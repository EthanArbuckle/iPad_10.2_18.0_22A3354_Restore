uint64_t sub_2198D09D4(uint64_t a1, uint64_t a2)
{
  char v5;
  char *v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  v5 = 1;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReActivateMFCComplete");
  if (a1)
  {
    *(_BYTE *)(a1 + 1483) = (_DWORD)a2 != 0;
    v6 = &v5;
    LODWORD(v7) = 1;
    sub_219891854(a1, a2, (uint64_t)&v6);
    *(_BYTE *)(a1 + 1484) = 0;
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid libnfc context received from lower layer!");
    a2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReActivateMFCComplete");
  return a2;
}

uint64_t sub_2198D0AA0(uint64_t a1, uint64_t a2)
{
  _QWORD v5[2];
  char v6;

  v6 = 1;
  v5[1] = 1;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReActivateMFCComplete1");
  v5[0] = &v6;
  if (a1)
  {
    if ((_DWORD)a2 != 121)
    {
      if ((_DWORD)a2)
      {
        *(_BYTE *)(a1 + 1483) = 1;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Reactivation of Mifare classic failed!");
        a2 = 44;
      }
      else
      {
        *(_BYTE *)(a1 + 1483) = 0;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Reactivation of Mifare classic Success");
      }
    }
    sub_2198C0364(a1, (uint64_t)v5, a2);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid LibNfc Context passed by lower layer");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReActivateMFCComplete1");
  return a2;
}

uint64_t sub_2198D0BAC(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t *v6;
  unsigned int v8;

  v8 = a2;
  sub_219850718(1, &v8, 5u, 5u, (uint64_t)"phLibNfc_SM_Init");
  if (v8 == 1)
  {
    if (!LODWORD(qword_253E470E8[0]))
    {
      v2 = 0;
      v3 = qword_253E470E8;
      qword_253E470E8[0] = 0xC00000001;
      dword_253E470F0 = 0;
      do
      {
        v4 = &qword_253E470E8[v2];
        v4[2] = 0x600000000;
        *((_DWORD *)v4 + 6) = 0;
        v2 += 2;
      }
      while (v2 != 8);
LABEL_9:
      *((_DWORD *)v3 + 20) = 0;
      *((_DWORD *)v3 + 21) = 6;
      *((_DWORD *)v3 + 22) = 0;
    }
  }
  else if (!LODWORD(qword_253E47078[0]))
  {
    v5 = 0;
    v3 = qword_253E47078;
    qword_253E47078[0] = 0xC00000001;
    dword_253E47080 = 0;
    do
    {
      v6 = &qword_253E47078[v5];
      v6[2] = 0x600000000;
      *((_DWORD *)v6 + 6) = 0;
      v5 += 2;
    }
    while (v5 != 8);
    goto LABEL_9;
  }
  sub_219850808(1, &v8, 5u, 5u, (uint64_t)"phLibNfc_SM_Init");
  return 1;
}

uint64_t sub_2198D0CBC(uint64_t a1, int a2)
{
  uint64_t v3;
  char v4;
  uint64_t *v5;
  char v6;
  int v7;
  uint64_t v8;
  uint64_t v10;

  v10 = a1;
  sub_219850718(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_IsVirtual");
  v3 = 0;
  v4 = 1;
  v5 = &qword_253E47078;
  while (1)
  {
    v6 = v4;
    if (*((_QWORD *)&unk_253E46700 + 14 * v3) == v10)
      break;
    v4 = 0;
    v3 = 1;
    if ((v6 & 1) == 0)
      goto LABEL_7;
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v3 + 2) == 1)
    v5 = &qword_253E470E8;
LABEL_7:
  v7 = a2 - 1;
  if ((a2 - 1) > 6)
  {
    v8 = 255;
  }
  else
  {
    v8 = 255;
    if (((0x53u >> v7) & 1) != 0)
    {
      if (LODWORD(v5[2 * qword_21990AE98[v7] + 2]) == 2)
        v8 = 0;
      else
        v8 = 255;
    }
  }
  sub_219850808(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_IsVirtual");
  return v8;
}

uint64_t sub_2198D0DC0(uint64_t a1, int a2)
{
  uint64_t v3;
  char v4;
  char v5;
  int v6;
  int *v7;
  uint64_t v10;

  v10 = a1;
  sub_219850718(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_IsApdu");
  v3 = 0;
  v4 = 1;
  while (1)
  {
    v5 = v4;
    if (*((_QWORD *)&unk_253E46700 + 14 * v3) == v10)
      break;
    v4 = 0;
    v3 = 1;
    if ((v5 & 1) == 0)
    {
      v6 = dword_253E47098;
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v3 + 2) == 1)
    v7 = (int *)&unk_253E47108;
  else
    v7 = &dword_253E47098;
  v6 = *v7;
LABEL_9:
  sub_219850808(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_IsApdu");
  if (v6 == 3 && a2 == 1)
    return 0;
  else
    return 255;
}

uint64_t sub_2198D0E9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  char v10;
  char v11;
  int v12;
  uint64_t *v13;
  unsigned int v14;
  uint64_t v15;
  int *v16;
  int i;
  int v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v21;
  uint64_t v22;
  char v23;
  char v24;
  int v25;
  int *v26;
  uint64_t v27;
  int *v28;
  uint64_t v30;
  uint64_t v31;

  v30 = a1;
  sub_219850718(0, (unsigned int *)&v30, 5u, 5u, (uint64_t)"phLibNfc_SM_MainStateHandler");
  v9 = 0;
  v10 = 1;
  while (1)
  {
    v11 = v10;
    if (*((_QWORD *)&unk_253E46700 + 14 * v9) == v30)
      break;
    v10 = 0;
    v9 = 1;
    if ((v11 & 1) == 0)
    {
      v12 = 255;
      goto LABEL_6;
    }
  }
  v12 = *((_DWORD *)&unk_253E46700 + 28 * v9 + 2);
LABEL_6:
  if ((_DWORD)a2 == 1)
  {
    if ((_DWORD)v30 == 1)
      v13 = &qword_253E470E8;
    else
      v13 = &qword_253E47078;
    v14 = *(_DWORD *)v13;
    v12 = v30;
    goto LABEL_15;
  }
  if (v12 == 1)
    v13 = &qword_253E470E8;
  else
    v13 = &qword_253E47078;
  v14 = *(_DWORD *)v13;
  if (a2 <= 0x8E)
  {
LABEL_15:
    if ((_DWORD)a2 != 4 && *((_DWORD *)v13 + 2) == 1)
      goto LABEL_17;
    goto LABEL_19;
  }
  if ((a2 - 145) > 9)
  {
LABEL_17:
    v15 = 111;
    goto LABEL_55;
  }
LABEL_19:
  v31 = v30;
  sub_219850718(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_RetrieveMainTable");
  v16 = (int *)qword_24DB724E0[2 * v14 + 1];
  sub_219850808(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_RetrieveMainTable");
  v31 = v30;
  sub_219850718(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_SearchTable");
  for (i = *v16; i != 235 && i != (_DWORD)a2; i = v19)
  {
    v19 = v16[4];
    v16 += 4;
  }
  sub_219850808(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_SearchTable");
  v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((_QWORD *)v16 + 1);
  if (!v20)
  {
    v15 = 147;
    goto LABEL_55;
  }
  if ((a2 - 145) <= 9)
  {
    if ((_DWORD)a2 == 146)
    {
      *((_DWORD *)v13 + 2) = 0;
      a2 = *((unsigned int *)v13 + 3);
      if ((_DWORD)a2 == 5)
        *((_DWORD *)v13 + 1) = 12;
    }
    else
    {
      if ((_DWORD)a2 == 145)
      {
        v21 = *((_DWORD *)v13 + 1);
        v16[1] = v21;
        *(_DWORD *)v13 = v21;
        *((_DWORD *)v13 + 2) = 0;
        a2 = *((unsigned int *)v13 + 3);
        goto LABEL_46;
      }
      v31 = v30;
      sub_219850718(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_HandleInternalEvent");
      v22 = 0;
      v23 = 1;
      while (1)
      {
        v24 = v23;
        if (*((_QWORD *)&unk_253E46700 + 14 * v22) == v31)
          break;
        v23 = 0;
        v22 = 1;
        if ((v24 & 1) == 0)
        {
          v25 = 255;
          goto LABEL_38;
        }
      }
      v25 = *((_DWORD *)&unk_253E46700 + 28 * v22 + 2);
LABEL_38:
      if ((a2 - 147) > 7)
      {
        v15 = 147;
        goto LABEL_57;
      }
      if (((1 << (a2 + 109)) & 0x78) == 0)
      {
        v26 = v25 == 1 ? &dword_253E470F0 : &dword_253E47080;
        if (*v26)
        {
          v15 = 111;
LABEL_57:
          sub_219850808(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_HandleInternalEvent");
          goto LABEL_55;
        }
      }
      sub_219850808(0, (unsigned int *)&v31, 5u, 5u, (uint64_t)"phLibNfc_HandleInternalEvent");
      v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((_QWORD *)v16 + 1);
    }
  }
LABEL_46:
  v27 = v20(v30, a2, a3, a4, a5);
  v15 = v27;
  if (!(_DWORD)v27)
  {
    *(_DWORD *)v13 = v16[1];
LABEL_50:
    if ((_DWORD)a2 != 4)
      *((_DWORD *)v13 + 2) = 0;
    goto LABEL_52;
  }
  if ((_DWORD)v27 != 13)
    goto LABEL_50;
  *((_DWORD *)v13 + 1) = v16[1];
  *((_DWORD *)v13 + 2) = 1;
  *((_DWORD *)v13 + 3) = a2;
LABEL_52:
  v28 = &dword_253E47158;
  if (!v12)
    v28 = &dword_253E47070;
  *v28 = ((*(_DWORD *)v13 & 0x1F) << 18) & 0xF07DFFFF | ((*((_DWORD *)v13 + 1) & 0x1F) << 23) | *v28 & 0xF001FFFF | ((v13[1] & 1) << 17);
LABEL_55:
  sub_219850808(0, (unsigned int *)&v30, 5u, 5u, (uint64_t)"phLibNfc_SM_MainStateHandler");
  return v15;
}

uint64_t sub_2198D1260(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  char v10;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  char v15;
  _BOOL4 v16;
  int v17;
  int *v18;
  uint64_t v19;
  uint64_t *v21;
  int v22;
  int *v23;
  int v24;
  int *v25;
  int v26;
  int *v27;
  int v28;
  BOOL v29;
  BOOL v30;
  uint64_t v32;
  BOOL v34;
  int v35;
  int *v36;
  int *v37;
  _DWORD *v38;
  BOOL v39;
  BOOL v40;
  _DWORD *v41;
  BOOL v42;
  BOOL v43;
  _DWORD *v44;
  BOOL v45;
  BOOL v46;
  int *v47;
  uint64_t v48;
  int *v49;
  int i;
  int v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v54;
  uint64_t *v55;
  int v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;

  v61 = a1;
  sub_219850718(0, (unsigned int *)&v61, 5u, 5u, (uint64_t)"phLibNfc_SM_SEStateHandler");
  v9 = 0;
  v10 = 1;
  while (1)
  {
    v11 = v10;
    if (*((_QWORD *)&unk_253E46700 + 14 * v9) == v61)
      break;
    v10 = 0;
    v9 = 1;
    if ((v11 & 1) == 0)
    {
      v12 = &qword_253E47078;
      goto LABEL_8;
    }
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v9 + 2) == 1)
    v12 = &qword_253E470E8;
  else
    v12 = &qword_253E47078;
LABEL_8:
  v62 = v61;
  sub_219850718(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_SM_RetrieveSEState");
  v13 = 0;
  v14 = 1;
  while (1)
  {
    v15 = v14;
    if (*((_QWORD *)&unk_253E46700 + 14 * v13) == v62)
      break;
    v14 = 0;
    v13 = 1;
    if ((v15 & 1) == 0)
    {
      v16 = 0;
      v17 = dword_253E47080;
      goto LABEL_15;
    }
  }
  v29 = *((_DWORD *)&unk_253E46700 + 28 * v13 + 2) == 1;
  v16 = v29;
  v18 = &dword_253E470F0;
  if (!v29)
    v18 = &dword_253E47080;
  v17 = *v18;
LABEL_15:
  if ((a2 - 187) >= 0x10 && (a2 - 169) >= 2 && v17 == 1)
    goto LABEL_18;
  v21 = &qword_253E470E8;
  if (!v16)
    v21 = &qword_253E47078;
  v22 = *((_DWORD *)v21 + 6);
  if ((a2 - 157) <= 0x1B)
  {
    if (v16)
      v23 = (int *)&unk_253E47110;
    else
      v23 = (int *)&unk_253E470A0;
    v24 = *v23;
    v25 = (int *)&unk_253E47120;
    if (!v16)
      v25 = (int *)&unk_253E470B0;
    v26 = *v25;
    v27 = (int *)&unk_253E47130;
    if (!v16)
      v27 = &dword_253E470C0;
    v28 = *v27;
    v29 = v22 == 1 || v24 == 1;
    v30 = v29 || v26 == 1;
    if (v30 || v28 == 1)
    {
LABEL_18:
      v19 = 111;
LABEL_19:
      sub_219850808(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_SM_RetrieveSEState");
      goto LABEL_20;
    }
  }
  v32 = 0;
  v34 = (a2 - 158) < 3 && v22 != 1;
  v35 = a2 & 0xFFFFFFFE;
  v36 = (int *)&unk_253E47088;
  v37 = (int *)&unk_253E470F8;
  if ((a2 & 0xFFFFFFFE) != 0xBC && !v34)
  {
    v37 = (int *)&unk_253E47108;
    v36 = &dword_253E47098;
    v38 = v16 ? &unk_253E47108 : &dword_253E47098;
    v39 = (a2 - 163) >= 0xA || v38[2] == 1;
    v40 = !v39;
    v32 = 1;
    if (v35 != 192 && !v40)
    {
      v37 = (int *)&unk_253E47118;
      v36 = (int *)&unk_253E470A8;
      v41 = v16 ? &unk_253E47118 : &unk_253E470A8;
      v42 = (a2 - 175) >= 3 || v41[2] == 1;
      v43 = !v42;
      v32 = 2;
      if (v35 != 196 && !v43)
      {
        v37 = (int *)&unk_253E47128;
        v36 = &dword_253E470B8;
        v44 = v16 ? &unk_253E47128 : &dword_253E470B8;
        v45 = (a2 & 0xFFFFFFFC) != 0xB4 || v44[2] == 1;
        v46 = !v45;
        v32 = 3;
        if (v35 != 200 && !v46)
        {
          v19 = 147;
          goto LABEL_19;
        }
      }
    }
  }
  if (v16)
    v47 = v37;
  else
    v47 = v36;
  v48 = *v47;
  sub_219850808(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_SM_RetrieveSEState");
  v62 = v61;
  sub_219850718(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_RetrieveSETable");
  v49 = (int *)qword_24DB725A0[2 * v48 + 1];
  sub_219850808(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_RetrieveSETable");
  v62 = v61;
  sub_219850718(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_SearchSETable");
  for (i = *v49; i != 235 && i != (_DWORD)a2; i = v52)
  {
    v52 = v49[4];
    v49 += 4;
  }
  sub_219850808(0, (unsigned int *)&v62, 5u, 5u, (uint64_t)"phLibNfc_SearchSETable");
  v53 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((_QWORD *)v49 + 1);
  if (!v53)
  {
    v19 = 147;
    goto LABEL_20;
  }
  if ((a2 - 187) <= 0xF && (a2 - 188) <= 0xD)
  {
    v54 = 1 << (a2 + 68);
    if ((v54 & 0x1111) != 0)
    {
      v55 = &v12[2 * v32];
      v56 = *((_DWORD *)v55 + 5);
      v49[1] = v56;
      *((_DWORD *)v55 + 4) = v56;
    }
    else if ((v54 & 0x2222) == 0)
    {
      goto LABEL_101;
    }
    v57 = &v12[2 * v32];
    *((_DWORD *)v57 + 6) = 0;
    a2 = *((unsigned int *)v57 + 7);
  }
LABEL_101:
  v58 = v53(v61, a2, a3, a4, a5);
  v19 = v58;
  if ((_DWORD)v58)
  {
    if ((_DWORD)v58 == 13)
    {
      v59 = &v12[2 * v32];
      *((_DWORD *)v59 + 5) = v49[1];
      *((_DWORD *)v59 + 6) = 1;
      *((_DWORD *)v59 + 7) = a2;
    }
    else
    {
      LODWORD(v12[2 * v32 + 3]) = 0;
    }
  }
  else
  {
    v60 = &v12[2 * v32];
    *((_DWORD *)v60 + 4) = v49[1];
    *((_DWORD *)v60 + 6) = 0;
  }
LABEL_20:
  sub_219850808(0, (unsigned int *)&v61, 5u, 5u, (uint64_t)"phLibNfc_SM_SEStateHandler");
  return v19;
}

uint64_t sub_2198D1714(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  _BOOL4 v10;
  int *v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  int *v15;
  int i;
  int v18;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  int v20;
  uint64_t *v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  int *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t *v32;
  int *v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t v36;

  v35 = a1;
  sub_219850718(0, (unsigned int *)&v35, 5u, 5u, (uint64_t)"phLibNfc_SM_DnldStateHandler");
  v9 = 0;
  v34 = 255;
  LOBYTE(v10) = 1;
  v11 = &dword_253E470C8;
  while (*((_QWORD *)&unk_253E46700 + 14 * v9) != v35)
  {
    v12 = v10;
    v10 = 0;
    v9 = 1;
    if (!v12)
      goto LABEL_7;
  }
  v34 = *((_DWORD *)&unk_253E46700 + 28 * v9 + 2);
  v10 = v34 == 1;
  if (v34 == 1)
    v11 = &dword_253E47138;
LABEL_7:
  v13 = *v11;
  if (a2 > 0xD8)
    goto LABEL_30;
  v14 = &qword_253E470E8;
  if (!v10)
    v14 = &qword_253E47078;
  if ((_DWORD)a2 != 205 && *((_DWORD *)v14 + 22) == 1)
  {
LABEL_30:
    if ((a2 - 212) >= 5 && (_DWORD)a2 != 8 && (a2 - 219) > 0xE)
    {
      v24 = 111;
      goto LABEL_59;
    }
  }
  v36 = v35;
  sub_219850718(0, (unsigned int *)&v36, 5u, 5u, (uint64_t)"phLibNfc_RetrieveDnldTable");
  v15 = (int *)qword_24DB72600[2 * v13 + 1];
  sub_219850808(0, (unsigned int *)&v36, 5u, 5u, (uint64_t)"phLibNfc_RetrieveDnldTable");
  v36 = v35;
  sub_219850718(0, (unsigned int *)&v36, 5u, 5u, (uint64_t)"phLibNfc_SearchDnldTable");
  for (i = *v15; i != 235 && i != (_DWORD)a2; i = v18)
  {
    v18 = v15[4];
    v15 += 4;
  }
  sub_219850808(0, (unsigned int *)&v36, 5u, 5u, (uint64_t)"phLibNfc_SearchDnldTable");
  v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))*((_QWORD *)v15 + 1);
  if (!v19)
  {
    v24 = 147;
    goto LABEL_59;
  }
  if ((a2 - 219) <= 0xE)
  {
    v20 = 1 << (a2 + 37);
    if ((v20 & 0x67E9) != 0)
    {
      *v11 = v15[1];
      if (v10)
        v21 = &qword_253E470E8;
      else
        v21 = &qword_253E47078;
      *((_DWORD *)v21 + 22) = 0;
      v22 = &dword_253E470D4;
      if (v10)
        v22 = (int *)&unk_253E47144;
      a2 = *v22;
      *((_DWORD *)v21 + 2) = 0;
      sub_219851888(1, &v34, 5u, 4u, (uint64_t)"Dnld TransStatus");
      v23 = (*((uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v15 + 1))(v35, a2, a3, a4, a5);
      goto LABEL_40;
    }
    if ((v20 & 0x1812) != 0)
    {
      *v11 = v15[1];
      if (v10)
        v25 = &qword_253E470E8;
      else
        v25 = &qword_253E47078;
      *((_DWORD *)v25 + 22) = 0;
      v26 = &dword_253E470D4;
      if (v10)
        v26 = (int *)&unk_253E47144;
      a2 = *v26;
      *((_DWORD *)v25 + 2) = 0;
    }
    else
    {
      *v11 = v15[1];
      if (v10)
        v32 = &qword_253E470E8;
      else
        v32 = &qword_253E47078;
      *((_DWORD *)v32 + 22) = 1;
      v33 = &dword_253E470D4;
      if (v10)
        v33 = (int *)&unk_253E47144;
      a2 = *v33;
    }
  }
  v23 = v19(v35, a2, a3, a4, a5);
LABEL_40:
  v24 = v23;
  if ((_DWORD)v23)
  {
    if ((_DWORD)v23 == 13)
    {
      *v11 = v15[1];
      if ((a2 - 217) <= 0xFFFFFFFA)
      {
        v27 = &qword_253E47078;
        if (v10)
          v27 = &qword_253E470E8;
        *((_DWORD *)v27 + 22) = 1;
        *((_DWORD *)v27 + 23) = a2;
      }
      v28 = &qword_253E47078;
      if (v10)
        v28 = &qword_253E470E8;
      *((_DWORD *)v28 + 2) = 1;
      sub_219851888(1, &v34, 5u, 4u, (uint64_t)"NFCSTATUS_PENDING");
      v24 = 13;
    }
    else if ((_DWORD)a2 != 8 && (_DWORD)a2 != 205)
    {
      v30 = &qword_253E47078;
      if (v10)
        v30 = &qword_253E470E8;
      *((_DWORD *)v30 + 2) = 0;
      *((_DWORD *)v30 + 22) = 0;
    }
  }
  else
  {
    *v11 = v15[1];
    if ((_DWORD)a2 != 8 && (_DWORD)a2 != 205)
    {
      v24 = 0;
      v29 = &qword_253E47078;
      if (v10)
        v29 = &qword_253E470E8;
      *((_DWORD *)v29 + 22) = 0;
      *((_DWORD *)v29 + 2) = 0;
    }
  }
LABEL_59:
  sub_219850808(0, (unsigned int *)&v35, 5u, 5u, (uint64_t)"phLibNfc_SM_DnldStateHandler");
  return v24;
}

uint64_t sub_2198D1B2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  uint64_t v19;

  v19 = a1;
  sub_219850718(0, (unsigned int *)&v19, 5u, 5u, (uint64_t)"phLibNfc_SM_StateHandler");
  if ((_DWORD)a2 == 1)
  {
    v9 = a3;
    v19 = a3;
    v10 = a3;
  }
  else
  {
    v12 = 0;
    v13 = 1;
    while (1)
    {
      v14 = v13;
      if (*((_QWORD *)&unk_253E46700 + 14 * v12) == v19)
        break;
      v13 = 0;
      v12 = 1;
      if ((v14 & 1) == 0)
      {
        v10 = 255;
        goto LABEL_11;
      }
    }
    v10 = *((_DWORD *)&unk_253E46700 + 28 * v12 + 2);
    if (v10 < 2)
      goto LABEL_12;
LABEL_11:
    sub_219850628(0, (unsigned int *)&v19, 5u, 1u, (uint64_t)"Driver handle is not mapped with NFCC type: Critical Failure");
LABEL_12:
    if (a2 > 0xE9)
    {
      v15 = 147;
      goto LABEL_36;
    }
    v9 = v19;
    if ((a2 - 136) <= 5)
    {
      v11 = sub_2198D1D64(a2, v19);
      if ((_DWORD)v11)
        goto LABEL_21;
      v9 = v19;
    }
  }
  v11 = sub_2198D2030(a2, v9);
  if (!(_DWORD)v11)
  {
    if ((a2 - 1) > 0x99)
    {
      if ((a2 - 157) > 0x2D)
      {
        if (a2 < 0xCD)
        {
          v15 = 147;
          goto LABEL_22;
        }
        v11 = sub_2198D1714(v19, a2, a3, a4, a5);
      }
      else
      {
        v11 = sub_2198D1260(v19, a2, a3, a4, a5);
      }
    }
    else
    {
      v11 = sub_2198D0E9C(v19, a2, a3, a4, a5);
    }
  }
LABEL_21:
  v15 = v11;
LABEL_22:
  if (v10 <= 1)
  {
    v16 = *((_QWORD *)&unk_253E46700 + 14 * v10 + 10);
    if (v16)
    {
      if ((_DWORD)v15)
        v17 = (_DWORD)v15 == 13;
      else
        v17 = 1;
      if (!v17 || (_DWORD)a2 == 76 || (_DWORD)a2 == 141)
      {
        if (!*(_WORD *)(v16 + 152) && (_DWORD)a2 != 76 && (_DWORD)a2 != 141)
          sub_2198D2284(v19, a2);
      }
      else
      {
        sub_2198D2284(v19, a2);
        *(_WORD *)(v16 + 152) = 0;
      }
    }
  }
LABEL_36:
  sub_219850808(0, (unsigned int *)&v19, 5u, 5u, (uint64_t)"phLibNfc_SM_StateHandler");
  return v15;
}

uint64_t sub_2198D1D64(int a1, uint64_t a2)
{
  uint64_t v3;
  _BOOL4 v4;
  uint64_t *v5;
  BOOL v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t *v11;
  int v12;
  const char *v13;
  uint64_t i;
  uint64_t *v15;
  uint64_t v17;

  v17 = a2;
  sub_219850718(0, (unsigned int *)&v17, 5u, 5u, (uint64_t)"phLibNfc_HandlePriorityEvent");
  v3 = 0;
  LOBYTE(v4) = 1;
  v5 = &qword_253E47078;
  while (1)
  {
    v6 = v4;
    if (*((_QWORD *)&unk_253E46700 + 14 * v3) == v17)
      break;
    v4 = 0;
    v3 = 1;
    if (!v6)
    {
      v7 = &qword_253E47078;
      goto LABEL_8;
    }
  }
  v4 = *((_DWORD *)&unk_253E46700 + 28 * v3 + 2) == 1;
  if (*((_DWORD *)&unk_253E46700 + 28 * v3 + 2) == 1)
    v7 = &qword_253E470E8;
  else
    v7 = &qword_253E47078;
LABEL_8:
  if ((a1 - 139) > 2)
  {
    if ((a1 & 0xFFFFFFFE) != 0x88)
    {
      v9 = a1 != 138;
      goto LABEL_49;
    }
    v10 = *(_DWORD *)v7;
    if (v4)
      v11 = &qword_253E470E8;
    else
      v11 = &qword_253E47078;
    v12 = *((_DWORD *)v11 + 1);
    if ((v10 - 7) <= 1 && v12 == 9 || v10 == 9 && v12 == 8)
      goto LABEL_24;
    if (v10 == 4)
    {
      if (a1 == 137 && v12 == 4)
      {
        if (v4)
          v5 = &qword_253E470E8;
        *((_DWORD *)v5 + 2) = 0;
        *((_DWORD *)v11 + 1) = 12;
        v13 = "Stop Discovery priority raised";
        goto LABEL_27;
      }
    }
    else if (v10 == 6 || v10 == 5 && v12 == 6)
    {
LABEL_24:
      if (v4)
        v5 = &qword_253E470E8;
      *((_DWORD *)v5 + 2) = 0;
      *((_DWORD *)v11 + 1) = 12;
      v13 = "Discovery priority raised";
      goto LABEL_27;
    }
    v13 = "No change in Discovery priority";
LABEL_27:
    sub_219850628(0, (unsigned int *)&v17, 5u, 4u, (uint64_t)v13);
    goto LABEL_48;
  }
  v8 = *(_DWORD *)v7;
  if (*(_DWORD *)v7 > 2u)
  {
    if (v4)
      v5 = &qword_253E470E8;
    if (v8 == 11 && *((_DWORD *)v5 + 2) == 1)
    {
      if (a1 == 139)
        v9 = 111;
      else
        v9 = 145;
      sub_219850628(0, (unsigned int *)&v17, 5u, 4u, (uint64_t)"Shutdown already in progress");
      goto LABEL_49;
    }
    if (a1 == 141 || a1 == 139)
      *(_DWORD *)v7 = 11;
    *((_DWORD *)v5 + 2) = 0;
    sub_219850628(0, (unsigned int *)&v17, 5u, 4u, (uint64_t)"State Machine is ready for shutdown");
    for (i = 0; i != 8; i += 2)
    {
      v15 = &v7[i];
      v15[2] = 0x600000000;
      *((_DWORD *)v15 + 6) = 0;
    }
LABEL_48:
    v9 = 0;
    goto LABEL_49;
  }
  if (a1 == 141)
  {
    v9 = 0;
    *(_DWORD *)v7 = 1;
  }
  else
  {
    v9 = 49;
    if (a1 != 140 || v8 == 1)
      goto LABEL_49;
    v9 = 0;
  }
  if (v4)
    v5 = &qword_253E470E8;
  *((_DWORD *)v5 + 2) = 0;
LABEL_49:
  sub_219850808(0, (unsigned int *)&v17, 5u, 5u, (uint64_t)"phLibNfc_HandlePriorityEvent");
  return v9;
}

uint64_t sub_2198D2030(int a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  char v5;
  int v6;
  int v7;
  uint64_t *v8;
  unsigned int v9;
  char *v10;
  int *v11;
  uint64_t v12;
  const char *v13;
  int *v14;
  int v15;
  int *v17;
  int v18;
  char *v19;
  char *v20;
  uint64_t v22;

  v22 = a2;
  sub_219850718(0, (unsigned int *)&v22, 5u, 5u, (uint64_t)"phLibNfc_ValidateSMState");
  v3 = 0;
  v4 = 1;
  while (1)
  {
    v5 = v4;
    if (*((_QWORD *)&unk_253E46700 + 14 * v3) == v22)
      break;
    v4 = 0;
    v3 = 1;
    if ((v5 & 1) == 0)
    {
      v6 = 255;
      goto LABEL_6;
    }
  }
  v6 = *((_DWORD *)&unk_253E46700 + 28 * v3 + 2);
LABEL_6:
  if (a1 == 1)
    v7 = v22;
  else
    v7 = v6;
  v8 = &qword_253E470E8;
  if (v7 != 1)
    v8 = &qword_253E47078;
  v9 = *(_DWORD *)v8;
  if (v9 > 2)
  {
    v14 = &dword_253E470F0;
    if (v7 != 1)
      v14 = &dword_253E47080;
    v15 = *v14;
    if (v9 == 11 && v15 == 1)
    {
      v17 = (int *)&unk_253E470F4;
      if (v7 != 1)
        v17 = &dword_253E47084;
      v18 = *v17;
      if (v18 == 141)
      {
        if (v7 == 1)
          v20 = (char *)&qword_253E470E8 + 4;
        else
          v20 = (char *)&qword_253E47078 + 4;
        v12 = 145;
        v13 = "####### LibNfc Stack Shutdown in progress #######";
        if (a1 != 145 || *(_DWORD *)v20 != 3)
          goto LABEL_47;
      }
      else
      {
        if (v18 != 139)
        {
          v12 = 145;
          v13 = "####### LibNfc Stack Shutdown in progress #######";
          goto LABEL_47;
        }
        if (v7 == 1)
          v19 = (char *)&qword_253E470E8 + 4;
        else
          v19 = (char *)&qword_253E47078 + 4;
        v12 = 145;
        v13 = "####### LibNfc Stack Shutdown in progress #######";
        if (a1 != 145 || *(_DWORD *)v19 != 1)
          goto LABEL_47;
      }
    }
    goto LABEL_29;
  }
  v10 = (char *)&qword_253E470E8 + 4;
  if (v7 != 1)
    v10 = (char *)&qword_253E47078 + 4;
  if (*(_DWORD *)v10 != 3 || (v7 != 1 ? (v11 = &dword_253E47080) : (v11 = &dword_253E470F0), *v11 != 1))
  {
LABEL_29:
    v12 = 0;
    goto LABEL_48;
  }
  v12 = 0;
  if (((a1 - 141) > 5 || ((1 << (a1 + 115)) & 0x31) == 0) && a1 != 4)
  {
    v13 = "####### LibNfc Stack Not Initialised #######";
    v12 = 49;
LABEL_47:
    sub_219850628(0, (unsigned int *)&v22, 5u, 1u, (uint64_t)v13);
  }
LABEL_48:
  sub_219850808(0, (unsigned int *)&v22, 5u, 5u, (uint64_t)"phLibNfc_ValidateSMState");
  return v12;
}

uint64_t sub_2198D2284(uint64_t a1, int a2)
{
  uint64_t v3;
  char v4;
  char v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v11 = a1;
  sub_219850718(0, (unsigned int *)&v11, 5u, 5u, (uint64_t)"phLibNfc_GetMwApi");
  v3 = 0;
  v4 = 1;
  while (1)
  {
    v5 = v4;
    if (*((_QWORD *)&unk_253E46700 + 14 * v3) == v11)
      break;
    v4 = 0;
    v3 = 1;
    if ((v5 & 1) == 0)
      goto LABEL_10;
  }
  v6 = *((_DWORD *)&unk_253E46700 + 28 * v3 + 2);
  if (v6 > 1 || (v7 = *((_QWORD *)&unk_253E46700 + 14 * v6 + 10)) == 0)
  {
LABEL_10:
    v8 = 136;
    goto LABEL_11;
  }
  if ((a2 - 1) < 0x8E || (a2 - 157) < 0x1C)
  {
    v8 = 136;
    if ((a2 - 158) <= 0x16 && ((1 << (a2 + 98)) & 0x420021) != 0 || a2 == 76)
      goto LABEL_11;
  }
  else if ((a2 - 205) >= 0xC)
  {
    goto LABEL_10;
  }
  v10 = 0;
  v8 = 136;
  while ((unsigned __int16)word_2550A30D8[v10] != a2)
  {
    v10 += 2;
    if (v10 == 264)
      goto LABEL_11;
  }
  v8 = (unsigned __int16)word_2550A30D8[v10 + 1];
  *(_DWORD *)(v7 + 156) = v8;
LABEL_11:
  sub_219850808(0, (unsigned int *)&v11, 5u, 5u, (uint64_t)"phLibNfc_GetMwApi");
  return v8;
}

uint64_t sub_2198D23DC(uint64_t a1)
{
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v7;

  v7 = a1;
  sub_219850718(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetCurrState");
  v1 = 0;
  v2 = 1;
  while (1)
  {
    v3 = v2;
    if (*((_QWORD *)&unk_253E46700 + 14 * v1) == v7)
      break;
    v2 = 0;
    v1 = 1;
    if ((v3 & 1) == 0)
    {
      v4 = qword_253E47078;
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v1 + 2) == 1)
    v5 = &qword_253E470E8;
  else
    v5 = &qword_253E47078;
  v4 = *(unsigned int *)v5;
LABEL_9:
  sub_219850808(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetCurrState");
  return v4;
}

uint64_t sub_2198D24A8(uint64_t a1)
{
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v7 = a1;
  sub_219850718(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetTargetState");
  v1 = 0;
  v2 = 1;
  while (1)
  {
    v3 = v2;
    if (*((_QWORD *)&unk_253E46700 + 14 * v1) == v7)
      break;
    v2 = 0;
    v1 = 1;
    if ((v3 & 1) == 0)
    {
      v4 = HIDWORD(qword_253E47078);
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v1 + 2) == 1)
    v5 = (char *)&qword_253E470E8 + 4;
  else
    v5 = (char *)&qword_253E47078 + 4;
  v4 = *(unsigned int *)v5;
LABEL_9:
  sub_219850808(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetTargetState");
  return v4;
}

uint64_t sub_2198D2574(uint64_t a1)
{
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  int *v5;
  uint64_t v7;

  v7 = a1;
  sub_219850718(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetTransStatus");
  v1 = 0;
  v2 = 1;
  while (1)
  {
    v3 = v2;
    if (*((_QWORD *)&unk_253E46700 + 14 * v1) == v7)
      break;
    v2 = 0;
    v1 = 1;
    if ((v3 & 1) == 0)
    {
      v4 = dword_253E47080;
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v1 + 2) == 1)
    v5 = &dword_253E470F0;
  else
    v5 = &dword_253E47080;
  v4 = *v5;
LABEL_9:
  sub_219850808(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetTransStatus");
  return v4;
}

uint64_t sub_2198D2640(uint64_t a1)
{
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  int *v5;
  uint64_t v7;

  v7 = a1;
  sub_219850718(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetTransEvent");
  v1 = 0;
  v2 = 1;
  while (1)
  {
    v3 = v2;
    if (*((_QWORD *)&unk_253E46700 + 14 * v1) == v7)
      break;
    v2 = 0;
    v1 = 1;
    if ((v3 & 1) == 0)
    {
      v4 = dword_253E47084;
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v1 + 2) == 1)
    v5 = (int *)&unk_253E470F4;
  else
    v5 = &dword_253E47084;
  v4 = *v5;
LABEL_9:
  sub_219850808(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetTransEvent");
  return v4;
}

uint64_t sub_2198D270C(uint64_t a1, int a2)
{
  uint64_t v3;
  char v4;
  int *v5;
  char v6;
  uint64_t v8;

  v8 = a1;
  sub_219850718(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetTransEvent");
  v3 = 0;
  v4 = 1;
  v5 = &dword_253E47084;
  while (1)
  {
    v6 = v4;
    if (*((_QWORD *)&unk_253E46700 + 14 * v3) == v8)
      break;
    v4 = 0;
    v3 = 1;
    if ((v6 & 1) == 0)
      goto LABEL_7;
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v3 + 2) == 1)
    v5 = (int *)&unk_253E470F4;
LABEL_7:
  *v5 = a2;
  sub_219850808(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetTransEvent");
  return 0;
}

uint64_t sub_2198D27D4(uint64_t a1, int a2)
{
  uint64_t v3;
  char v4;
  int *v5;
  char v6;
  uint64_t v8;

  v8 = a1;
  sub_219850718(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetTransStatus");
  v3 = 0;
  v4 = 1;
  v5 = &dword_253E47080;
  while (1)
  {
    v6 = v4;
    if (*((_QWORD *)&unk_253E46700 + 14 * v3) == v8)
      break;
    v4 = 0;
    v3 = 1;
    if ((v6 & 1) == 0)
      goto LABEL_7;
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v3 + 2) == 1)
    v5 = &dword_253E470F0;
LABEL_7:
  *v5 = a2;
  sub_219850808(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetTransStatus");
  return 0;
}

uint64_t sub_2198D289C(uint64_t a1, int a2)
{
  uint64_t v3;
  char v4;
  uint64_t *v5;
  char v6;
  uint64_t v8;

  v8 = a1;
  sub_219850718(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetCurrState");
  v3 = 0;
  v4 = 1;
  v5 = &qword_253E47078;
  while (1)
  {
    v6 = v4;
    if (*((_QWORD *)&unk_253E46700 + 14 * v3) == v8)
      break;
    v4 = 0;
    v3 = 1;
    if ((v6 & 1) == 0)
      goto LABEL_7;
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v3 + 2) == 1)
    v5 = &qword_253E470E8;
LABEL_7:
  *(_DWORD *)v5 = a2;
  sub_219850808(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetCurrState");
  return 0;
}

uint64_t sub_2198D2964(uint64_t a1, int a2)
{
  uint64_t v3;
  char v4;
  char *v5;
  char v6;
  uint64_t v8;

  v8 = a1;
  sub_219850718(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetTargetState");
  v3 = 0;
  v4 = 1;
  v5 = (char *)&qword_253E47078 + 4;
  while (1)
  {
    v6 = v4;
    if (*((_QWORD *)&unk_253E46700 + 14 * v3) == v8)
      break;
    v4 = 0;
    v3 = 1;
    if ((v6 & 1) == 0)
      goto LABEL_7;
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v3 + 2) == 1)
    v5 = (char *)&qword_253E470E8 + 4;
LABEL_7:
  *(_DWORD *)v5 = a2;
  sub_219850808(0, (unsigned int *)&v8, 5u, 5u, (uint64_t)"phLibNfc_SM_SetTargetState");
  return 0;
}

uint64_t sub_2198D2A2C(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v5;
  char v6;
  uint64_t *v7;
  char v8;
  uint64_t v10;

  v10 = a1;
  sub_219850718(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_SetSECurrState");
  v5 = 0;
  v6 = 1;
  v7 = &qword_253E47078;
  while (1)
  {
    v8 = v6;
    if (*((_QWORD *)&unk_253E46700 + 14 * v5) == v10)
      break;
    v6 = 0;
    v5 = 1;
    if ((v8 & 1) == 0)
      goto LABEL_7;
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v5 + 2) == 1)
    v7 = &qword_253E470E8;
LABEL_7:
  LODWORD(v7[2 * a2 + 2]) = a3;
  sub_219850808(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_SetSECurrState");
  return 0;
}

uint64_t sub_2198D2AFC(uint64_t a1, unsigned int a2, int a3)
{
  uint64_t v5;
  char v6;
  uint64_t *v7;
  char v8;
  uint64_t v10;

  v10 = a1;
  sub_219850718(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_SetSETransStatus");
  v5 = 0;
  v6 = 1;
  v7 = &qword_253E47078;
  while (1)
  {
    v8 = v6;
    if (*((_QWORD *)&unk_253E46700 + 14 * v5) == v10)
      break;
    v6 = 0;
    v5 = 1;
    if ((v8 & 1) == 0)
      goto LABEL_7;
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v5 + 2) == 1)
    v7 = &qword_253E470E8;
LABEL_7:
  LODWORD(v7[2 * a2 + 3]) = a3;
  sub_219850808(0, (unsigned int *)&v10, 5u, 5u, (uint64_t)"phLibNfc_SM_SetSETransStatus");
  return 0;
}

uint64_t sub_2198D2BCC(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  char v4;
  uint64_t *v5;
  char v6;
  uint64_t v7;
  uint64_t v9;

  v9 = a1;
  sub_219850718(0, (unsigned int *)&v9, 5u, 5u, (uint64_t)"phLibNfc_SM_GetSETransStatus");
  v3 = 0;
  v4 = 1;
  v5 = &qword_253E47078;
  while (1)
  {
    v6 = v4;
    if (*((_QWORD *)&unk_253E46700 + 14 * v3) == v9)
      break;
    v4 = 0;
    v3 = 1;
    if ((v6 & 1) == 0)
      goto LABEL_7;
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v3 + 2) == 1)
    v5 = &qword_253E470E8;
LABEL_7:
  v7 = LODWORD(v5[2 * a2 + 3]);
  sub_219850808(0, (unsigned int *)&v9, 5u, 5u, (uint64_t)"phLibNfc_SM_GetSETransStatus");
  return v7;
}

uint64_t sub_2198D2C98(uint64_t a1)
{
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  int *v5;
  uint64_t v7;

  v7 = a1;
  sub_219850718(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetDnldTransEvent");
  v1 = 0;
  v2 = 1;
  while (1)
  {
    v3 = v2;
    if (*((_QWORD *)&unk_253E46700 + 14 * v1) == v7)
      break;
    v2 = 0;
    v1 = 1;
    if ((v3 & 1) == 0)
    {
      v4 = dword_253E470D4;
      goto LABEL_9;
    }
  }
  if (*((_DWORD *)&unk_253E46700 + 28 * v1 + 2) == 1)
    v5 = (int *)&unk_253E47144;
  else
    v5 = &dword_253E470D4;
  v4 = *v5;
LABEL_9:
  sub_219850808(0, (unsigned int *)&v7, 5u, 5u, (uint64_t)"phLibNfc_SM_GetDnldTransEvent");
  return v4;
}

uint64_t sub_2198D2D64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  int v7;
  char v8;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = a1;
  sub_219850718(0, (unsigned int *)&v11, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_ChkNdef");
  sub_21988EF68(v11, &v10);
  v5 = 1;
  if (a3)
  {
    if (a2)
    {
      v6 = v10;
      if (v10)
      {
        *(_QWORD *)(v10 + 8) = a2;
        *(_QWORD *)(v6 + 40) = a3;
        *(_BYTE *)(v6 + 540) = 1;
        *(_BYTE *)(v6 + 547) = 1;
        *(_BYTE *)(v6 + 644) = 0;
        *(_WORD *)(v6 + 642) = 1;
        *(_BYTE *)(v6 + 544) = 4;
        if (*(_BYTE *)(v6 + 65))
        {
          phOsalNfc_MemCopy();
          v6 = v10;
          v7 = *(unsigned __int8 *)(v10 + 65);
          *(_BYTE *)v10 = 4;
          *(_BYTE *)(v6 + 540) = 1;
          *(_DWORD *)(v6 + 232) = 0;
          if (v7)
          {
            v8 = 0;
            *(_BYTE *)v6 = 5;
          }
          else
          {
            v8 = 120;
          }
        }
        else
        {
          *(_BYTE *)v6 = 4;
          *(_BYTE *)(v6 + 540) = 1;
          v8 = 120;
          *(_DWORD *)(v6 + 232) = 0;
        }
        *(_BYTE *)(v6 + 266) = v8;
        v5 = sub_2198D2E90(v6, *(_BYTE *)(v6 + 642), *(_BYTE *)(v6 + 643));
      }
    }
  }
  sub_219850808(0, (unsigned int *)&v11, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_ChkNdef");
  return v5;
}

uint64_t sub_2198D2E90(uint64_t a1, char a2, char a3)
{
  int v6;
  uint64_t v7;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_RdBytes");
  *(_BYTE *)(a1 + 204) &= 0xFCu;
  *(_BYTE *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 48) = sub_2198D360C;
  *(_QWORD *)(a1 + 56) = a1;
  *(_WORD *)(a1 + 264) = 260;
  v6 = *(unsigned __int8 *)(a1 + 266);
  if (!*(_BYTE *)(a1 + 266))
  {
    *(_DWORD *)(a1 + 232) = 0;
    *(_WORD *)(a1 + 266) = 0;
LABEL_8:
    *(_BYTE *)(a1 + 268) = 0;
    phOsalNfc_MemCopy();
    *(_WORD *)(a1 + 526) = 7;
    goto LABEL_9;
  }
  if (v6 == 1)
  {
    *(_DWORD *)(a1 + 232) = 0;
    *(_BYTE *)(a1 + 266) = 1;
    *(_BYTE *)(a1 + 267) = a3 + 8 * a2;
    goto LABEL_8;
  }
  if (v6 != 120)
  {
    v7 = 245;
    goto LABEL_11;
  }
  *(_DWORD *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 266) = 120;
  phOsalNfc_SetMemory();
  *(_WORD *)(a1 + 526) = 7;
  if (*(_BYTE *)(a1 + 65))
    phOsalNfc_MemCopy();
LABEL_9:
  v7 = sub_219888630(a1, (uint64_t)sub_2198D419C);
LABEL_11:
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_RdBytes");
  return v7;
}

uint64_t sub_2198D2FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = a1;
  sub_219850718(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_ConvertToReadOnly");
  sub_21988EF68(v10, &v9);
  v5 = 1;
  if (a2)
  {
    v6 = v9;
    if (v9)
    {
      *(_QWORD *)(v9 + 32) = a2;
      *(_QWORD *)(v6 + 40) = a3;
      *(_BYTE *)(v6 + 547) = 6;
      *(_BYTE *)(v6 + 644) = 0;
      *(_BYTE *)(v6 + 544) = 4;
      if (sub_21987BA3C(*(_QWORD *)(v6 + 2712)) == 1)
        v7 = 0;
      else
        v7 = 15;
      v5 = sub_2198D30C0(v9, 1, 3, v7);
      if (v5 == 13)
        *(_BYTE *)v9 = 9;
    }
  }
  sub_219850808(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_ConvertToReadOnly");
  return v5;
}

uint64_t sub_2198D30C0(uint64_t a1, char a2, char a3, char a4)
{
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrAByte");
  *(_BYTE *)(a1 + 204) &= 0xFCu;
  *(_BYTE *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 48) = sub_2198D360C;
  *(_QWORD *)(a1 + 56) = a1;
  *(_WORD *)(a1 + 264) = 260;
  *(_DWORD *)(a1 + 232) = 0;
  *(_BYTE *)(a1 + 266) = 83;
  *(_BYTE *)(a1 + 267) = a3 + 8 * a2;
  *(_BYTE *)(a1 + 268) = a4;
  phOsalNfc_MemCopy();
  *(_WORD *)(a1 + 526) = 7;
  v8 = sub_219888630(a1, (uint64_t)sub_2198D419C);
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrAByte");
  return v8;
}

uint64_t sub_2198D31A4(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v14 = 0;
  v15 = a1;
  sub_219850718(0, (unsigned int *)&v15, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_RdNdef");
  sub_21988EF68(v15, &v14);
  v11 = 1;
  if (a4 <= 1)
  {
    if (a3)
    {
      if (a2)
      {
        if (a5)
        {
          v12 = v14;
          if (v14)
          {
            *(_QWORD *)(v14 + 16) = a5;
            *(_QWORD *)(v12 + 40) = a6;
            *(_BYTE *)(v12 + 547) = 2;
            *(_QWORD *)(v12 + 240) = a2;
            *(_DWORD *)(v12 + 248) = *a3;
            *(_QWORD *)(v12 + 552) = a3;
            *a3 = 0;
            *(_WORD *)(v12 + 252) = 0;
            *(_BYTE *)(v12 + 560) = a4;
            *(_BYTE *)(v12 + 644) = 1;
            if (a4 == 1 || *(_BYTE *)(v12 + 540) == 3)
            {
              *(_BYTE *)(v12 + 560) = 1;
              *(_WORD *)(v12 + 642) = 1;
              *(_BYTE *)v12 = 5;
              *(_BYTE *)(v12 + 645) = 0;
              *(_DWORD *)(v12 + 232) = 0;
              *(_BYTE *)(v12 + 266) = 0;
              *(_BYTE *)(v12 + 540) = 2;
              if (a4)
              {
                v11 = sub_2198D2E90(v12, 1, 0);
                goto LABEL_13;
              }
            }
            else
            {
              *(_BYTE *)(v12 + 540) = 2;
              if (*(_BYTE *)(v12 + 645) == 1)
              {
                v11 = 26;
                goto LABEL_13;
              }
            }
            sub_2198D32F4(v12);
            v11 = 0;
          }
        }
      }
    }
  }
LABEL_13:
  sub_219850808(0, (unsigned int *)&v15, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_RdNdef");
  return v11;
}

uint64_t sub_2198D32F4(uint64_t a1)
{
  int v2;
  char v3;
  __int16 v4;
  __int16 v5;
  int v6;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CpDataToUsrBuf");
  if (*(_DWORD *)(a1 + 248) >= *(unsigned __int16 *)(a1 + 78))
  {
    phOsalNfc_MemCopy();
    v3 = 0;
    v5 = 0;
    v6 = *(unsigned __int16 *)(a1 + 78);
    **(_DWORD **)(a1 + 552) = v6;
    *(_BYTE *)(a1 + 645) = 1;
    v4 = *(_WORD *)(a1 + 640) - v6;
  }
  else
  {
    phOsalNfc_MemCopy();
    **(_DWORD **)(a1 + 552) = *(_DWORD *)(a1 + 248);
    v2 = *(_DWORD *)(a1 + 248);
    v3 = *(_BYTE *)(a1 + 643) + v2;
    v4 = *(_WORD *)(a1 + 640) - v2;
    v5 = *(_WORD *)(a1 + 78) - v2;
  }
  *(_BYTE *)(a1 + 643) = v3;
  *(_WORD *)(a1 + 640) = v4;
  *(_WORD *)(a1 + 78) = v5;
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CpDataToUsrBuf");
  return 0;
}

uint64_t sub_2198D33D8(uint64_t a1, char *a2, _DWORD *a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD *v14;
  char *v15;
  char v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;

  v21 = 0;
  v22 = a1;
  sub_219850718(0, (unsigned int *)&v22, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_WrNdef");
  sub_21988EF68(v22, &v21);
  v11 = 1;
  if (a3 && a5 && v21)
  {
    phOsalNfc_MemCopy();
    v12 = v21;
    *(_DWORD *)(v21 + 2740) = 3;
    *(_QWORD *)(v12 + 24) = a5;
    *(_QWORD *)(v12 + 40) = a6;
    *(_BYTE *)(v12 + 547) = 3;
    *(_WORD *)(v12 + 252) = 0;
    **(_WORD **)(v12 + 528) = 0;
    v13 = v21;
    v14 = (_DWORD *)(v21 + 2740);
    if (*a3)
    {
      v14 = a3;
      v15 = a2;
    }
    else
    {
      v15 = (char *)(v21 + 2736);
    }
    *(_QWORD *)(v21 + 240) = v15;
    *(_DWORD *)(v13 + 248) = *v14;
    *(_WORD *)(v13 + 252) = 0;
    *(_QWORD *)(v13 + 256) = v14;
    *v14 = 0;
    *(_BYTE *)(v13 + 644) = 2;
    *(_BYTE *)(v13 + 560) = a4;
    if (a4 == 1 || *(_BYTE *)(v13 + 540) == 2)
    {
      *(_BYTE *)(v13 + 560) = 1;
      *(_WORD *)(v13 + 642) = 1;
      *(_BYTE *)v13 = 5;
      *(_DWORD *)(v13 + 232) = 0;
      *(_BYTE *)(v13 + 266) = 0;
      *(_BYTE *)(v13 + 645) = 0;
      *(_WORD *)(v13 + 640) = *(_WORD *)(v13 + 202);
      v15 = (char *)(v13 + 267);
    }
    else
    {
      *(_BYTE *)v13 = 2;
    }
    v16 = *v15;
    *(_BYTE *)(v13 + 540) = 3;
    if (a4 || *(_BYTE *)(v13 + 645) != 1)
    {
      sub_2198D35A0(v13);
      v17 = *(_BYTE *)(v21 + 642);
      v18 = *(_BYTE *)(v21 + 643);
      if (*(_BYTE *)(v21 + 560) == 1)
        v19 = sub_2198D2E90(v21, v17, v18);
      else
        v19 = sub_2198D30C0(v21, v17, v18, v16);
      v11 = v19;
    }
    else
    {
      v11 = 26;
    }
  }
  sub_219850808(0, (unsigned int *)&v22, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_WrNdef");
  return v11;
}

uint64_t sub_2198D35A0(uint64_t a1)
{
  unsigned int v2;
  char v3;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_BlkChk");
  v2 = *(unsigned __int8 *)(a1 + 643);
  v3 = *(_BYTE *)(a1 + 642);
  if (v2 > 7)
    ++v3;
  *(_BYTE *)(a1 + 642) = v3;
  *(_BYTE *)(a1 + 643) = v2 & 7;
  return sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_BlkChk");
}

uint64_t sub_2198D360C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  char v10;
  int v11;
  int v12;
  BOOL v13;
  char v14;
  char v15;
  char v16;
  const char *v17;
  char v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  char v26;
  __int16 v27;
  int v28;
  char v29;
  char v30;
  uint64_t v32;

  v32 = a1;
  sub_219850718(0, (unsigned int *)&v32, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_Process");
  if (!(_BYTE)a3)
  {
    v5 = 245;
    switch(*(_BYTE *)a2)
    {
      case 2:
        sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProWrUsrData");
        v6 = *(unsigned __int16 *)(a2 + 252);
        if (*(unsigned __int8 *)(a2 + 266) == *(unsigned __int8 *)(*(_QWORD *)(a2 + 240) + v6)
          && *(_WORD *)(a2 + 264) == 1)
        {
          *(_WORD *)(a2 + 252) = v6 + 1;
          --*(_WORD *)(a2 + 640);
          ++*(_BYTE *)(a2 + 643);
          sub_2198D35A0(a2);
          v7 = *(unsigned __int16 *)(a2 + 252);
          if (*(_DWORD *)(a2 + 248) == (_DWORD)v7 || !*(_WORD *)(a2 + 640))
          {
            *(_BYTE *)(a2 + 645) = *(unsigned __int16 *)(a2 + 640) == 0;
            sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrLByte");
            v25 = *(unsigned __int16 *)(a2 + 68);
            v26 = *(_BYTE *)(a2 + 70);
            *(_BYTE *)a2 = 7;
            *(_BYTE *)(a2 + 646) = 8;
            v27 = *(_WORD *)(a2 + 252);
            if (*(_BYTE *)(a2 + 560) != 1)
              LOBYTE(v27) = *(_BYTE *)(a2 + 78) + v27;
            if (v25 > 6)
              ++v26;
            a3 = sub_2198D30C0(a2, v26, (v25 + 1) & 7, v27);
            sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrLByte");
          }
          else
          {
            *(_BYTE *)a2 = 2;
            a3 = sub_2198D30C0(a2, *(_BYTE *)(a2 + 642), *(_BYTE *)(a2 + 643), *(_BYTE *)(*(_QWORD *)(a2 + 240) + v7));
          }
        }
        else
        {
          a3 = 27;
        }
        v17 = "phFriNfc_Tpz_H_ProWrUsrData";
        goto LABEL_140;
      case 4:
        sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProReadID");
        if (*(_BYTE *)(a2 + 266) == 17 && *(_WORD *)(a2 + 264) == 6)
        {
          phOsalNfc_MemCopy();
          *(_BYTE *)a2 = 5;
          *(_DWORD *)(a2 + 232) = 0;
          *(_BYTE *)(a2 + 266) = 0;
          a3 = sub_2198D2E90(a2, *(unsigned __int8 *)(a2 + 642), *(unsigned __int8 *)(a2 + 643));
        }
        else
        {
          a3 = 27;
        }
        v17 = "phFriNfc_Tpz_H_ProReadID";
        goto LABEL_140;
      case 5:
        sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProReadAll");
        v13 = *(unsigned __int8 *)(a2 + 648) == *(unsigned __int8 *)(a2 + 268)
           && *(unsigned __int8 *)(a2 + 649) == *(unsigned __int8 *)(a2 + 269)
           && *(unsigned __int8 *)(a2 + 650) == *(unsigned __int8 *)(a2 + 270)
           && *(unsigned __int8 *)(a2 + 651) == *(unsigned __int8 *)(a2 + 271);
        if (*(_BYTE *)(a2 + 266) != 17)
          goto LABEL_65;
        v15 = !v13;
        if (*(_WORD *)(a2 + 264) != 122)
          v15 = 1;
        if ((v15 & 1) != 0)
        {
LABEL_65:
          a3 = 27;
        }
        else
        {
          phOsalNfc_MemCopy();
          sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkLockBits");
          if (*(_BYTE *)(a2 + 380) == 1
            && (*(unsigned __int8 *)(a2 + 381) | 0x80) == 0xE0
            && *(_BYTE *)(a2 + 279) != 15)
          {
            if (*(_BYTE *)(a2 + 279))
              v16 = 3;
            else
              v16 = 2;
          }
          else
          {
            v16 = 1;
          }
          *(_BYTE *)(a2 + 545) = v16;
          sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkLockBits");
          sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CallNxtOp");
          v21 = *(unsigned __int8 *)(a2 + 540);
          if (v21 == 2)
          {
            if (sub_2198D4460(a2))
            {
              a3 = 28;
            }
            else
            {
              a3 = sub_2198D42D0(a2);
              if (!(_DWORD)a3)
              {
                *(_BYTE *)(a2 + 643) += 2;
                sub_2198D32F4(a2);
              }
            }
          }
          else if (v21 == 1)
          {
            sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkCCinChkNdef");
            v22 = 22;
            if (*(unsigned __int8 *)(a2 + 661) == 225)
            {
              v23 = *(unsigned __int8 *)(a2 + 664);
              if (v23 >= 0x10)
                v22 = 22;
              else
                v22 = 0;
              if (v23 >= 0x10)
                v24 = *(_WORD *)(a2 + 202);
              else
                v24 = 92;
              *(_WORD *)(a2 + 640) = v24;
              *(_WORD *)(a2 + 202) = v24;
            }
            if (*(_BYTE *)(a2 + 545) != 1)
            {
              if (v22)
                v30 = 3;
              else
                v30 = 0;
              *(_BYTE *)(a2 + 545) = v30;
            }
            sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkCCinChkNdef");
            if (*(_BYTE *)(a2 + 545) == 3)
            {
              a3 = 0;
              *(_BYTE *)(a2 + 545) = 0;
              *(_WORD *)(a2 + 640) = 90;
              *(_WORD *)(a2 + 202) = 90;
            }
            else
            {
              a3 = sub_2198D4230((unsigned int *)a2, *(unsigned __int8 *)(a2 + 662));
              if (!(_DWORD)a3)
              {
                if (*(unsigned __int8 *)(a2 + 663) <= 0xEu)
                  sub_2198D42D0(a2);
                a3 = 0;
              }
            }
          }
          else if ((*(unsigned __int8 *)(a2 + 545) | 2) == 2)
          {
            if (sub_2198D4460(a2))
            {
              v29 = 0;
              *(_WORD *)(a2 + 68) = 4;
              *(_BYTE *)(a2 + 70) = 1;
              *(_BYTE *)(a2 + 643) = 4;
            }
            else
            {
              sub_2198D42D0(a2);
              v29 = 4;
            }
            *(_BYTE *)(a2 + 646) = v29;
            a3 = sub_2198D4568(a2);
          }
          else
          {
            a3 = 27;
          }
          sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CallNxtOp");
        }
        v17 = "phFriNfc_Tpz_H_ProReadAll";
        goto LABEL_140;
      case 6:
        sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProWrNMN");
        v8 = *(unsigned __int8 *)(a2 + 646);
        if (v8 == 6)
        {
          if (*(unsigned __int8 *)(a2 + 266) == 225 && *(_WORD *)(a2 + 264) == 1)
          {
            a3 = 0;
            v18 = *(_BYTE *)(a2 + 545);
            if (!v18)
              v18 = 2;
            *(_BYTE *)(a2 + 545) = v18;
            **(_DWORD **)(a2 + 256) = *(unsigned __int16 *)(a2 + 252);
            goto LABEL_72;
          }
        }
        else if (v8 == 5 && !*(_BYTE *)(a2 + 266) && *(_WORD *)(a2 + 264) == 1)
        {
          *(_BYTE *)a2 = 7;
          v9 = *(unsigned __int16 *)(a2 + 68);
          v10 = *(_BYTE *)(a2 + 70);
          if (v9 > 6)
            ++v10;
          *(_BYTE *)(a2 + 646) = 7;
          a3 = sub_2198D30C0(a2, v10, (v9 + 1) & 7, 0);
LABEL_72:
          v17 = "phFriNfc_Tpz_H_ProWrNMN";
LABEL_140:
          sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)v17);
          break;
        }
        a3 = 27;
        goto LABEL_72;
      case 7:
        sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProWrTLV");
        v11 = *(unsigned __int8 *)(a2 + 646);
        if (v11 != 8)
        {
          if (v11 == 7 && !*(_BYTE *)(a2 + 266) && *(_WORD *)(a2 + 264) == 1)
          {
            *(_BYTE *)a2 = 2;
            ++*(_BYTE *)(a2 + 643);
            sub_2198D35A0(a2);
            a3 = sub_2198D30C0(a2, *(_BYTE *)(a2 + 642), *(_BYTE *)(a2 + 643), *(_BYTE *)(*(_QWORD *)(a2 + 240) + *(unsigned __int16 *)(a2 + 252)));
            goto LABEL_113;
          }
LABEL_112:
          a3 = 27;
LABEL_113:
          v17 = "phFriNfc_Tpz_H_ProWrTLV";
          goto LABEL_140;
        }
        if (*(_BYTE *)(a2 + 560))
        {
          if (*(_BYTE *)(a2 + 560) != 1)
            goto LABEL_112;
          v19 = *(unsigned __int16 *)(a2 + 252);
          if (v19 != *(unsigned __int8 *)(a2 + 266) || *(_WORD *)(a2 + 264) != 1)
            goto LABEL_112;
        }
        else
        {
          v19 = *(unsigned __int16 *)(a2 + 252);
          v28 = *(unsigned __int16 *)(a2 + 78);
          if (v28 + v19 != *(unsigned __int8 *)(a2 + 266) || *(_WORD *)(a2 + 264) != 1)
            goto LABEL_112;
          LOWORD(v19) = v28 + v19;
        }
        *(_WORD *)(a2 + 78) = v19;
        sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrByte0ValE1");
        *(_BYTE *)a2 = 6;
        *(_BYTE *)(a2 + 646) = 6;
        a3 = sub_2198D30C0(a2, 1, 0, 225);
        sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrByte0ValE1");
        goto LABEL_113;
      case 8:
        sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProCCTLV");
        switch(*(_BYTE *)(a2 + 646))
        {
          case 0:
            if (*(unsigned __int8 *)(a2 + 266) == 225)
            {
              v12 = *(unsigned __int16 *)(a2 + 264);
              if (v12 == 1)
                goto LABEL_90;
            }
            goto LABEL_92;
          case 1:
            if (*(_BYTE *)(a2 + 266) != 16 || *(_WORD *)(a2 + 264) != 1)
              goto LABEL_92;
            LOBYTE(v12) = 2;
            goto LABEL_90;
          case 2:
            if (*(_BYTE *)(a2 + 266) != 14 || *(_WORD *)(a2 + 264) != 1)
              goto LABEL_92;
            LOBYTE(v12) = 3;
            goto LABEL_90;
          case 3:
            if (*(_BYTE *)(a2 + 266) || *(_WORD *)(a2 + 264) != 1)
              goto LABEL_92;
            LOBYTE(v12) = 4;
LABEL_90:
            *(_BYTE *)(a2 + 646) = v12;
            v20 = sub_2198D4568(a2);
            goto LABEL_91;
          default:
            if (*(_BYTE *)(a2 + 266) == 3 && *(_WORD *)(a2 + 264) == 1)
            {
              ++*(_BYTE *)(a2 + 643);
              sub_2198D35A0(a2);
              *(_BYTE *)a2 = 6;
              *(_BYTE *)(a2 + 646) = 5;
              v20 = sub_2198D30C0(a2, 1, 0, 0);
LABEL_91:
              a3 = v20;
            }
            else
            {
LABEL_92:
              a3 = 27;
            }
            v17 = "phFriNfc_Tpz_H_ProCCTLV";
            break;
        }
        goto LABEL_140;
      case 9:
        if (*(_BYTE *)(a2 + 266) != 15 || *(_WORD *)(a2 + 264) != 1)
          goto LABEL_60;
        byte_2550A428E = 0;
        *(_BYTE *)(a2 + 266) = 1;
        a3 = sub_2198D2E90(a2, 14, 0);
        if (a3 != 13)
          break;
        v14 = 10;
        goto LABEL_48;
      case 0xA:
        if (*(_WORD *)(a2 + 264) != 1)
          break;
        a3 = sub_2198D30C0(a2, 14, 0, 255);
        if (a3 != 13)
          break;
        v14 = 11;
        goto LABEL_48;
      case 0xB:
        if (*(unsigned __int8 *)(a2 + 266) != 255 || *(_WORD *)(a2 + 264) != 1)
          goto LABEL_60;
        *(_BYTE *)(a2 + 266) = 1;
        a3 = sub_2198D2E90(a2, 14, 1);
        if (a3 != 13)
          break;
        v14 = 12;
LABEL_48:
        *(_BYTE *)a2 = v14;
        break;
      case 0xC:
        if (*(_WORD *)(a2 + 264) != 1)
          break;
        byte_2550A428E = *(_BYTE *)(a2 + 266) | 0x7F;
        a3 = sub_2198D30C0(a2, 14, 1, byte_2550A428E);
        v14 = a3;
        if (a3 != 13)
          break;
        goto LABEL_48;
      case 0xD:
        if (byte_2550A428E == *(_BYTE *)(a2 + 266) && *(_WORD *)(a2 + 264) == 1)
        {
          byte_2550A428E = 0;
          break;
        }
        byte_2550A428E = 0;
LABEL_60:
        v5 = 27;
        goto LABEL_142;
      default:
        goto LABEL_142;
    }
  }
  v5 = a3;
  if ((_DWORD)a3 != 13)
LABEL_142:
    sub_2198D4020(a2, v5);
  return sub_219850808(0, (unsigned int *)&v32, 8u, 5u, (uint64_t)"phFriNfc_TopazMap_Process");
}

uint64_t sub_2198D4020(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  v12 = 0;
  v10 = 0;
  v11 = 0;
  v9 = 0;
  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_Complete");
  *(_BYTE *)a1 = 0;
  switch(*(_BYTE *)(a1 + 547))
  {
    case 1:
      if ((_DWORD)a2)
      {
        *(_BYTE *)(a1 + 546) = 0;
        LOBYTE(v11) = 3;
        if (((1 << a2) & 0x14400000) != 0)
          v4 = 152;
        else
          v4 = a2;
        if (a2 <= 0x1Cu)
          v5 = v4;
        else
          v5 = a2;
      }
      else
      {
        *(_BYTE *)(a1 + 546) = 1;
        LOBYTE(v11) = *(_BYTE *)(a1 + 545);
        v5 = 0;
        if (*(_BYTE *)(*(_QWORD *)(a1 + 224) + 19) == 17)
        {
          v6 = *(unsigned __int16 *)(a1 + 78);
          v7 = *(unsigned __int16 *)(a1 + 640);
        }
        else
        {
          v6 = *(unsigned __int16 *)(a1 + 922);
          v7 = *(unsigned __int16 *)(a1 + 924);
        }
        HIDWORD(v11) = v6;
        v12 = v7;
      }
      (*(void (**)(_QWORD, uint64_t, uint64_t *))(a1 + 8))(*(_QWORD *)(a1 + 40), v5, &v11);
      break;
    case 2:
      if (!(_DWORD)a2)
      {
        LODWORD(v10) = **(_DWORD **)(a1 + 552);
        v9 = *(_QWORD *)(a1 + 240);
      }
      (*(void (**)(_QWORD, uint64_t, uint64_t *))(a1 + 16))(*(_QWORD *)(a1 + 40), a2, &v9);
      break;
    case 3:
      *(_BYTE *)(a1 + 545) = 2 * (*(_WORD *)(a1 + 922) != 0);
      (*(void (**)(_QWORD, uint64_t))(a1 + 24))(*(_QWORD *)(a1 + 40), a2);
      break;
    case 6:
      (*(void (**)(_QWORD, uint64_t))(a1 + 32))(*(_QWORD *)(a1 + 40), a2);
      break;
    default:
      return sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_Complete");
  }
  return sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_Complete");
}

uint64_t sub_2198D419C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = a1;
  sub_219850718(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_Topaz_CB_Transceive");
  sub_21988EF68(v10, &v9);
  v7 = v9;
  if (v9)
  {
    if (a4)
      *(_WORD *)(v9 + 264) = *(_DWORD *)(a4 + 8);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v7 + 48))(*(_QWORD *)(v7 + 2712), v7, a5);
  }
  return sub_219850808(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_Topaz_CB_Transceive");
}

uint64_t sub_2198D4230(unsigned int *a1, unsigned int a2)
{
  unsigned int v4;
  uint64_t v5;

  sub_219850718(2, a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkSpcVer");
  if (a2)
  {
    v4 = a2 & 0xF;
    if ((a2 & 0xF0) == 0x10 && v4 < 3)
    {
      v5 = 0;
    }
    else if ((v4 <= 2 || (a2 & 0xF0) != 16) && a2 >= 0x20)
    {
      v5 = 28;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 28;
  }
  sub_219850808(2, a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkSpcVer");
  return v5;
}

uint64_t sub_2198D42D0(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned int v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  int v12;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_findNDEFTLV");
  v2 = a1 + 661;
  v3 = *(unsigned __int16 *)(a1 + 640);
  v4 = 4;
  while ((unsigned __int16)v3 >= 3u)
  {
    v5 = *(unsigned __int8 *)(v2 + v4);
    if (*(_BYTE *)(v2 + v4))
    {
      if (v5 == 254)
        break;
      if (v5 == 3)
      {
        v8 = v2 + v4;
        *(_WORD *)(a1 + 640) = v3 - 2;
        v9 = sub_21988B840(a1, *(unsigned __int8 *)(v8 + 1));
        v10 = *(unsigned __int8 *)(v8 + 1);
        if (*(unsigned __int16 *)(a1 + 640) >= v10 && (*(_BYTE *)(v8 + 1) || *(_BYTE *)(a1 + 540) != 2) && !v9)
        {
          v11 = 0;
          *(_WORD *)(a1 + 78) = v10;
          *(_WORD *)(a1 + 68) = v4 & 7;
          *(_BYTE *)(a1 + 70) = (v4 >> 3) + 1;
          *(_BYTE *)(a1 + 66) = 1;
          *(_BYTE *)(a1 + 643) = (v4 & 7 | (8 * ((v4 >> 3) + 1))) - 8;
          goto LABEL_21;
        }
        break;
      }
      v6 = v3 - 2;
      *(_WORD *)(a1 + 640) = v6;
      v7 = *(unsigned __int8 *)(v2 + v4 + 1);
      if (v7 > (unsigned __int16)v6)
        break;
      v3 = v6 - v7;
      *(_WORD *)(a1 + 640) = v3;
      v4 += v7 + 2;
    }
    else
    {
      *(_WORD *)(a1 + 640) = --v3;
      ++v4;
    }
    if (v4 >= 0x60u)
      break;
  }
  v11 = 22;
  if (!*(_BYTE *)(a1 + 66))
  {
    v12 = *(unsigned __int8 *)(a1 + 540);
    if (v12 == 2)
      v11 = 26;
    else
      v11 = 22;
    if ((v12 | 2) == 3)
    {
      *(_WORD *)(a1 + 68) = 4;
      *(_BYTE *)(a1 + 70) = 1;
      *(_BYTE *)(a1 + 643) = 4;
      *(_WORD *)(a1 + 640) = 90;
    }
  }
LABEL_21:
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_findNDEFTLV");
  return v11;
}

uint64_t sub_2198D4460(uint64_t a1)
{
  unsigned int v2;
  BOOL v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  unsigned int v7;
  int v8;
  unsigned int v9;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkCCBytes");
  if (*(unsigned __int8 *)(a1 + 661) == 225)
  {
    v2 = sub_2198D4230((unsigned int *)a1, *(unsigned __int8 *)(a1 + 662));
    v3 = *(unsigned __int8 *)(a1 + 663) < 0xFu && v2 == 0;
    if (v3)
      v4 = v2;
    else
      v4 = 26;
    if (*(unsigned __int8 *)(a1 + 663) < 0xFu && v2 == 0)
      v5 = 92;
    else
      v5 = *(_WORD *)(a1 + 202);
    *(_WORD *)(a1 + 202) = v5;
    *(_WORD *)(a1 + 640) = v5;
    v6 = *(unsigned __int8 *)(a1 + 540);
    if (v6 == 2)
    {
      if (*(_BYTE *)(a1 + 664) == 15)
        v8 = v2;
      else
        v8 = 28;
      if (v3)
        v9 = v8;
      else
        v9 = 26;
      if (*(_BYTE *)(a1 + 664))
        v4 = v9;
      else
        v4 = v4;
    }
    else if (v6 == 3)
    {
      if (*(_BYTE *)(a1 + 664))
        v7 = 28;
      else
        v7 = v2;
      if (v3)
        v4 = v7;
      else
        v4 = 26;
    }
  }
  else
  {
    v4 = 22;
  }
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkCCBytes");
  return v4;
}

uint64_t sub_2198D4568(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  char v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrCCorTLV");
  v2 = *(unsigned __int8 *)(a1 + 646);
  if (v2 >= 4)
  {
    LOBYTE(v2) = *(_BYTE *)(a1 + 68);
    v4 = *(_BYTE *)(a1 + 70);
    LOBYTE(v3) = 3;
  }
  else
  {
    v3 = 0xE10E1u >> (8 * v2);
    v4 = 1;
  }
  *(_BYTE *)a1 = 8;
  v5 = sub_2198D30C0(a1, v4, v2, v3);
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_WrCCorTLV");
  return v5;
}

uint64_t sub_2198D460C(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendDeactIdleCmd");
  if (a1)
  {
    sub_219888594(*(_QWORD *)(a1 + 19360));
    v2 = sub_2198FD2D0(*(_QWORD *)(a1 + 3040), 0, (uint64_t)sub_219865DD0, a1);
    if ((_DWORD)v2 == 13)
    {
      if (*(_BYTE *)(a1 + 19353) == 1)
      {
        v3 = *(_QWORD **)(a1 + 3040);
        if (v3)
        {
          v4 = v3[423];
          if (v4)
          {
            v3[92] = v4;
            v3[93] = v3[464];
          }
        }
        *(_BYTE *)(a1 + 19353) = 0;
      }
      v2 = 13;
    }
  }
  else
  {
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendDeactIdleCmd");
  return v2;
}

uint64_t sub_2198D46D4(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdConfig");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_DWORD *)(a1 + 3564) |= 0x10000u;
    if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
    {
      *(_DWORD *)(a1 + 5096) |= 0x300u;
    }
    else if ((*(_BYTE *)(a1 + 5097) & 3) == 0)
    {
      goto LABEL_8;
    }
    a2 = sub_2198FE090(*(_QWORD *)(a1 + 3040), a1 + 3560, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    a2 = 255;
  }
LABEL_8:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdConfig");
  return a2;
}

uint64_t sub_2198D47CC(unsigned int *a1, uint64_t a2)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdConfigProc");
  if (!a1 || (_DWORD)a2)
  {
    sub_219850628(2, a1, 4u, 1u, (uint64_t)"phLibNfc_GetLpcdConfigProc: FAILED");
    a2 = 255;
  }
  else
  {
    sub_219850628(1, a1 + 4842, 4u, 4u, (uint64_t)"phLibNfc_GetLpcdConfigProc- SUCCESS");
  }
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdConfigProc");
  return a2;
}

uint64_t sub_2198D4874(unsigned int *a1)
{
  uint64_t v2;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetConfigSeq");
  if (a1)
    v2 = sub_2198D687C((uint64_t)a1, a1 + 250);
  else
    v2 = 1;
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetConfigSeq");
  return v2;
}

uint64_t sub_2198D48E8(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetConfigSeqEnd");
  if (!a1)
    goto LABEL_6;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 2);
    if ((v4 & 1) != 0)
      break;
    v4 = 1;
    v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    v8 = (unsigned int *)(a1 + 19368);
    if ((_DWORD)a2)
    {
      sub_219850628(1, v8, 4u, 1u, (uint64_t)"Set Config before Start Disc Failed!");
    }
    else
    {
      sub_219850628(1, v8, 4u, 4u, (uint64_t)"Set Config before Start Disc success");
      sub_219865494(*(_QWORD *)(a1 + 3040), 0);
    }
  }
  else
  {
LABEL_6:
    a2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetConfigSeqEnd");
  return a2;
}

uint64_t sub_2198D49D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = 0;
  v6 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetISODepToFrameRfMapping");
  if (a1)
  {
    if (*(_BYTE *)(a1 + 1092) == 1)
    {
      *(_BYTE *)(a1 + 1422) = 1;
      phOsalNfc_SetMemory();
      BYTE4(v6) = BYTE4(v6) & 0xFC | 1;
      v7 = 1;
      LODWORD(v6) = 4;
      v4 = sub_2198FDA3C(*(_QWORD *)(a1 + 3040), 1, (int *)&v6, (uint64_t)sub_219865DD0, a1);
    }
    else
    {
      v4 = sub_219893808(a1);
    }
    a2 = v4;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetISODepToFrameRfMapping");
  return a2;
}

uint64_t sub_2198D4AF8(unsigned int *a1, uint64_t a2)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GenSequenceProcess");
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GenSequenceProcess");
  return a2;
}

uint64_t sub_2198D4B5C(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
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
  char v22;
  char v23;
  int v24;
  unsigned int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  int v37;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartDiscSeq");
  if (!a1)
    goto LABEL_6;
  v2 = 0;
  v3 = 0;
  do
  {
    v4 = *((_QWORD *)&unk_253E46700 + 14 * v3 + 2);
    if ((v2 & 1) != 0)
      break;
    v2 = 1;
    v3 = 1;
  }
  while (v4 != a1);
  if (v4 != a1)
  {
LABEL_6:
    v5 = 1;
    goto LABEL_7;
  }
  if (!sub_2198D6F20(a1, a1 + 1000))
  {
    v35 = 0;
    v36 = 0;
    v37 = 0;
    sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartDisc");
    sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetDiscPayload");
    v9 = *(_DWORD *)(a1 + 1000);
    if (*(_DWORD *)(a1 + 1088) == 2)
    {
      LOBYTE(v35) = v9 & 1;
      v10 = (v9 >> 1) & 1;
      BYTE2(v35) = (v9 & 2) != 0;
      if ((v9 & 1) != 0)
      {
        v11 = *(unsigned __int8 *)(a1 + 1017);
        if ((v11 - 11) < 0xFFFFFFF6)
          LOBYTE(v11) = 1;
        BYTE1(v35) = v11;
      }
      if (v10)
      {
        v12 = *(unsigned __int8 *)(a1 + 1019);
        if ((v12 - 11) <= 0xFFFFFFF5)
          LOBYTE(v12) = 1;
        BYTE3(v35) = v12;
      }
LABEL_88:
      sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetDiscPayload");
      v5 = sub_2198FBEF8(*(_QWORD *)(a1 + 3040), &v35, (uint64_t)sub_219865DD0, a1);
      sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartDisc");
      goto LABEL_7;
    }
    if (v9)
    {
      v13 = *(_DWORD *)(a1 + 1000) & 1;
      LOBYTE(v35) = v9 & 1;
      v14 = (v9 >> 1) & 1;
      BYTE2(v35) = (v9 & 2) != 0;
      v15 = (v9 & 0xC) != 0;
      BYTE4(v35) = (v9 & 0xC) != 0;
      v16 = (v9 >> 6) & 1;
      BYTE4(v36) = (v9 & 0x40) != 0;
      v17 = (v9 >> 4) & 1;
      BYTE6(v36) = (v9 & 0x10) != 0;
      LOBYTE(v37) = (v9 & 0x200) != 0;
      v18 = (v9 >> 12) & 0xFFF80;
      BYTE2(v37) = (v9 >> 12) & 0x80;
      v19 = (v9 >> 15) & 1;
      BYTE2(v36) = (v9 & 0x8000) != 0;
      v20 = HIWORD(v9) & 1;
      BYTE6(v35) = BYTE2(v9) & 1;
      v21 = (v9 >> 17) & 1;
      LOBYTE(v36) = (v9 & 0x20000) != 0;
      if (((v9 >> 12) & 0x80) != 0 && (*(_BYTE *)(a1 + 1012) & 7) != 0)
      {
        sub_219865598(*(unsigned int **)(a1 + 3040), 1u);
        *(_BYTE *)(a1 + 1425) = 1;
        v9 = *(_DWORD *)(a1 + 1000);
      }
      if ((v9 & 0x40000) != 0)
      {
LABEL_43:
        if ((v9 & 0x20) != 0)
        {
          LOBYTE(v18) = v18 & 0x9F;
          BYTE2(v37) = v18;
          v25 = *(unsigned __int8 *)(a1 + 1006);
          if ((v25 & 0x70) != 0)
          {
            if ((v25 & 0x60) != 0)
              LOBYTE(v18) = (2 * v25) & 0x20 | v18 | 0x40;
            else
              LOBYTE(v18) = (2 * v25) & 0x20 | v18;
            BYTE2(v37) = v18;
          }
        }
        else
        {
          v25 = *(unsigned __int8 *)(a1 + 1006);
          v13 |= v25 & 1;
          LOBYTE(v35) = v13;
          if (v15 | v25 & 2)
            v15 = 1;
          else
            v15 = (v25 >> 2) & 1;
          BYTE4(v35) = v15;
        }
        if ((~v25 & 0xF) == 0)
        {
          v15 = 1;
          LOBYTE(v35) = 1;
          BYTE4(v35) = 1;
          LOBYTE(v18) = v18 | 0x60;
          BYTE2(v37) = v18;
          v13 = 1;
        }
        if (*(_BYTE *)(a1 + 1007))
          goto LABEL_56;
        v34 = *(_BYTE *)(a1 + 1008);
        if (!v34)
        {
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_SetDiscPayload:None of the Technologies are configured for P2P Target Mode");
          goto LABEL_56;
        }
        if ((*(_BYTE *)(a1 + 1008) & 1) != 0)
        {
          LOBYTE(v18) = v18 | 1;
          BYTE2(v37) = v18;
          if ((v34 & 2) == 0)
          {
LABEL_92:
            if ((v34 & 4) == 0)
              goto LABEL_93;
            goto LABEL_98;
          }
        }
        else if ((*(_BYTE *)(a1 + 1008) & 2) == 0)
        {
          goto LABEL_92;
        }
        LOBYTE(v18) = v18 | 4;
        BYTE2(v37) = v18;
        if ((v34 & 4) == 0)
        {
LABEL_93:
          if ((v34 & 8) != 0)
            goto LABEL_99;
          goto LABEL_56;
        }
LABEL_98:
        LOBYTE(v18) = v18 | 8;
        BYTE2(v37) = v18;
        if ((v34 & 8) != 0)
LABEL_99:
          BYTE2(v37) = v18 | 0x10;
LABEL_56:
        if (v13)
        {
          v26 = *(unsigned __int8 *)(a1 + 1017);
          if ((v26 - 11) < 0xFFFFFFF6)
            LOBYTE(v26) = 1;
          BYTE1(v35) = v26;
        }
        if (v14)
        {
          v27 = *(unsigned __int8 *)(a1 + 1019);
          if ((v27 - 11) < 0xFFFFFFF6)
            LOBYTE(v27) = 1;
          BYTE3(v35) = v27;
        }
        if (v15)
        {
          v28 = *(unsigned __int8 *)(a1 + 1021);
          if ((v28 - 11) < 0xFFFFFFF6)
            LOBYTE(v28) = 1;
          BYTE5(v35) = v28;
        }
        if (v17)
        {
          v29 = *(unsigned __int8 *)(a1 + 1025);
          if ((v29 - 11) < 0xFFFFFFF6)
            LOBYTE(v29) = 1;
          HIBYTE(v36) = v29;
        }
        if (v16)
        {
          v30 = *(unsigned __int8 *)(a1 + 1029);
          if ((v30 - 11) < 0xFFFFFFF6)
            LOBYTE(v30) = 1;
          BYTE5(v36) = v30;
        }
        if (v19)
        {
          v31 = *(unsigned __int8 *)(a1 + 1043);
          if ((v31 - 11) < 0xFFFFFFF6)
            LOBYTE(v31) = 1;
          BYTE3(v36) = v31;
        }
        if (v20)
        {
          v32 = *(unsigned __int8 *)(a1 + 1045);
          if ((v32 - 11) < 0xFFFFFFF6)
            LOBYTE(v32) = 1;
          HIBYTE(v35) = v32;
        }
        if (v21)
        {
          v33 = *(unsigned __int8 *)(a1 + 1047);
          if ((v33 - 11) <= 0xFFFFFFF5)
            LOBYTE(v33) = 1;
          BYTE1(v36) = v33;
        }
        goto LABEL_88;
      }
    }
    else
    {
      LOBYTE(v18) = 0;
      v13 = 0;
      v15 = 0;
      v14 = 0;
      v17 = 0;
      v16 = 0;
      v19 = 0;
      v20 = 0;
      v21 = 0;
    }
    v22 = *(_BYTE *)(a1 + 1009);
    if ((v22 & 1) != 0)
    {
      LOBYTE(v18) = v18 | 1;
      BYTE2(v37) = v18;
    }
    if ((v22 & 2) != 0)
    {
      LOBYTE(v18) = v18 | 2;
      BYTE2(v37) = v18;
    }
    v23 = v22 & 4;
    if ((v22 & 0xF) == 0)
      v23 = 7;
    v24 = (char)(v18 | v23);
    if ((v22 & 4) != 0 || (v22 & 0xF) == 0)
    {
      BYTE2(v37) = v24;
      LOBYTE(v18) = v24;
    }
    if ((v24 & 0x80000000) == 0)
    {
      sub_219865598(*(unsigned int **)(a1 + 3040), 1u);
      *(_BYTE *)(a1 + 1425) = 1;
      v9 = *(_DWORD *)(a1 + 1000);
    }
    goto LABEL_43;
  }
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Recovery Seq: Discovery 'AddConfig' empty, passing SUCCESS to caller");
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DummyDisc");
  v7 = phOsalNfc_Timer_Create();
  if (v7 && (v8 = v7, v7 != 0xFFFFFFFFFFFFLL))
  {
    if (!phOsalNfc_Timer_Start())
    {
      sub_21988629C(1, (unsigned int *)(a1 + 19368), v8, 4u, 4u, (uint64_t)"phLibNfc_DummyDisc");
      v5 = 13;
      goto LABEL_7;
    }
    phOsalNfc_Timer_Delete();
  }
  else
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to create Timer!");
  }
  v5 = 255;
LABEL_7:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartDiscSeq");
  return v5;
}

uint64_t sub_2198D50D8(unsigned int *a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v8;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_StartDiscSeqEnd");
  if (!a1)
    goto LABEL_6;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = (unsigned int *)*((_QWORD *)&unk_253E46700 + 14 * v5 + 2);
    if ((v4 & 1) != 0)
      break;
    v4 = 1;
    v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    v8 = a1 + 4842;
    if ((_DWORD)a2)
      sub_219850628(1, v8, 4u, 1u, (uint64_t)"Discover start Failed!");
    else
      sub_219850628(1, v8, 4u, 4u, (uint64_t)"Discovery started...");
  }
  else
  {
LABEL_6:
    a2 = 255;
  }
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_StartDiscSeqEnd");
  return a2;
}

uint64_t sub_2198D51B8(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartDiscoverSeqComplete");
  if (a1)
  {
    if ((_BYTE)a2)
    {
      if (a2 == 143)
        v4 = a2;
      else
        v4 = 255;
      if (a2 == 158)
        v4 = a2;
      if (a2 == 81)
        a2 = a2;
      else
        a2 = v4;
      sub_219865598(*(unsigned int **)(a1 + 3040), 0);
    }
    if ((_DWORD)a2)
      v5 = 146;
    else
      v5 = 145;
    a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v5, a2, 0, 0);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartDiscoverSeqComplete");
  return a2;
}

uint64_t sub_2198D5270(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  const char *v4;
  int v5;
  unsigned int *v6;
  int v8;
  int v9;
  int v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  bzero(&v8, 0x6E8uLL);
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EnDisMultiTagSeq");
  if (!a1)
  {
    v4 = "phLibNfc_EnDisMultiTagSeq Fail : invalid context";
    v5 = 2;
    v6 = 0;
LABEL_6:
    sub_219850628(v5, v6, 4u, 1u, (uint64_t)v4);
    v3 = 255;
    goto LABEL_7;
  }
  phOsalNfc_SetMemory();
  v2 = *(unsigned __int8 *)(a1 + 1086);
  if (v2 > 1)
  {
    v4 = "phLibNfc_EnDisMultiTagSeq Fail : invalid config";
    v5 = 1;
    v6 = (unsigned int *)(a1 + 19368);
    goto LABEL_6;
  }
  v10 |= 0x10000u;
  v11 = v2;
  v8 = *(_DWORD *)(a1 + 19368);
  v9 |= 0x10000u;
  v3 = sub_2198FD4A4(*(_QWORD *)(a1 + 3040), (uint64_t)&v8, (uint64_t)sub_219865DD0, a1);
LABEL_7:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EnDisMultiTagSeq");
  return v3;
}

uint64_t sub_2198D53B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EnDisMultiTagSeqComplete");
  if (a1)
  {
    if ((_DWORD)a2)
      v4 = 146;
    else
      v4 = 145;
    a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EnDisMultiTagSeqComplete");
  return a2;
}

uint64_t sub_2198D5434(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  char *v8;
  int v10;
  int v11;
  __int16 v12;
  char v13;
  int v14;
  _BYTE v15[229];

  *(_QWORD *)&v15[221] = *MEMORY[0x24BDAC8D0];
  bzero(&v10, 0x6E8uLL);
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigSeReaderEmvCoSeq");
  if (a1)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = *((_QWORD *)&unk_253E46700 + 14 * v3 + 2);
      if ((v2 & 1) != 0)
        break;
      v2 = 1;
      v3 = 1;
    }
    while (v4 != a1);
    if (v4 == a1)
    {
      phOsalNfc_SetMemory();
      v6 = v11;
      v11 |= 0x8000u;
      v12 |= 0x10u;
      v7 = *(_DWORD *)(a1 + 1088);
      if (v7 == 1)
      {
        v8 = &v13;
      }
      else
      {
        if (v7 != 2)
        {
LABEL_12:
          v10 = *(_DWORD *)(a1 + 19368);
          v5 = sub_2198FD4A4(*(_QWORD *)(a1 + 3040), (uint64_t)&v10, (uint64_t)sub_219865DD0, a1);
          goto LABEL_13;
        }
        v13 = 1;
        v11 = v6 | 0x18000;
        v14 |= 0x800u;
        v8 = v15;
      }
      *v8 = 0;
      goto LABEL_12;
    }
  }
  v5 = 49;
LABEL_13:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigSeReaderEmvCoSeq");
  return v5;
}

uint64_t sub_2198D55B8(unsigned int *a1, uint64_t a2)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetSeReaderEnableEmvCoSeqEnd");
  if (!a1 || (_DWORD)a2)
    sub_219850628(2, a1, 4u, 1u, (uint64_t)"Set Config enable se reader Failed!");
  else
    sub_219850628(1, a1 + 4842, 4u, 4u, (uint64_t)"Set Config enable se reader success");
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetSeReaderEnableEmvCoSeqEnd");
  return a2;
}

uint64_t sub_2198D565C(uint64_t a1, uint64_t a2)
{
  uint64_t v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v6 = 0;
  v5 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetNfceeDepMapping");
  if (a1)
  {
    phOsalNfc_SetMemory();
    BYTE4(v5) = BYTE4(v5) & 0xFC | 1;
    v6 = 131;
    LODWORD(v5) = 4;
    a2 = sub_2198FDA3C(*(_QWORD *)(a1 + 3040), 1, (int *)&v5, (uint64_t)sub_219865DD0, a1);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetNfceeDepMapping");
  return a2;
}

uint64_t sub_2198D5758(unsigned int *a1, uint64_t a2)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetSeReaderDisableEmvCoSeqEnd");
  if ((_DWORD)a2)
    sub_219850628(2, a1, 4u, 1u, (uint64_t)"Set Config se reader Failed!");
  else
    sub_219850628(1, a1 + 4842, 4u, 4u, (uint64_t)"Set Config disable se reader success");
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetSeReaderDisableEmvCoSeqEnd");
  return a2;
}

uint64_t sub_2198D57F8(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendEMVCoTagDetection");
  if (a1)
  {
    sub_219865598(*(unsigned int **)(a1 + 3040), 0);
    a2 = sub_2198FD2D0(*(_QWORD *)(a1 + 3040), 4, (uint64_t)sub_219865DD0, a1);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendEMVCoTagDetection");
  return a2;
}

uint64_t sub_2198D5880(unsigned int *a1, uint64_t a2, unsigned __int16 *a3)
{
  uint64_t v5;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessEmvCoTagRemDeactResp");
  v5 = 255;
  if (a1 && a3)
    v5 = *a3;
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessEmvCoTagRemDeactResp");
  return v5;
}

uint64_t sub_2198D58F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EMVCoTagRemSeqComplete");
  if (a1)
  {
    if ((_DWORD)a2)
      v4 = 146;
    else
      v4 = 145;
    a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EMVCoTagRemSeqComplete");
  return a2;
}

uint64_t sub_2198D5978(uint64_t a1)
{
  uint64_t v2;
  unsigned int *v3;
  const char *v4;
  int v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReConfigSeq");
  if (!a1)
  {
    v4 = "Invalid LibNfc context";
    v2 = 1;
    v5 = 2;
    v3 = 0;
LABEL_6:
    sub_219850628(v5, v3, 4u, 1u, (uint64_t)v4);
    goto LABEL_7;
  }
  sub_219865494(*(_QWORD *)(a1 + 3040), *(_BYTE *)(a1 + 1425));
  v2 = sub_2198D687C(a1, (unsigned int *)(a1 + 1000));
  v3 = (unsigned int *)(a1 + 19368);
  if ((_DWORD)v2 != 13)
  {
    v4 = "Re-configure failed!";
    v5 = 1;
    goto LABEL_6;
  }
  sub_219850628(1, v3, 4u, 4u, (uint64_t)"Re-configure success");
LABEL_7:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReConfigSeq");
  return v2;
}

uint64_t sub_2198D5A4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t (**v7)();
  uint64_t (*v8)();
  unsigned int v9;
  uint64_t v10;
  char v12;

  v12 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReDiscoveryComplete");
  if (a1)
  {
    if ((_BYTE)a2)
    {
      sub_219865518(*(_QWORD *)(a1 + 3040), &v12);
      if (v12 == 1 && *(_BYTE *)(a1 + 1425) == 1)
      {
        if (*(unsigned __int8 *)(a1 + 1426) > 3u)
        {
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ReDiscoveryComplete: All retries for set config Failed");
          sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"pLibCtx->tDiscCtx.bRetryCfgCount");
          *(_BYTE *)(a1 + 1426) = 0;
          sub_219865494(*(_QWORD *)(a1 + 3040), 0);
        }
        else
        {
          phOsalNfc_Delay();
          sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ReDiscoveryComplete: Retry set config");
          sub_219865494(*(_QWORD *)(a1 + 3040), 1);
          *(_QWORD *)(a1 + 2912) = &qword_2550A35F8;
          *(_BYTE *)(a1 + 2904) = 0;
          *(_BYTE *)(a1 + 2906) = 0;
          v6 = qword_2550A35F8;
          if (qword_2550A35F8)
          {
            v6 = 0;
            v7 = off_2550A3608;
            do
            {
              ++v6;
              v8 = *v7;
              v7 += 2;
            }
            while (v8);
          }
          *(_BYTE *)(a1 + 2905) = v6;
          a2 = sub_2198655FC(a1, 0, a3);
          if ((_DWORD)a2 == 13)
            ++*(_BYTE *)(a1 + 1426);
        }
      }
      sub_219865598(*(unsigned int **)(a1 + 3040), 0);
    }
    if (!(_DWORD)a2)
    {
      v10 = 145;
LABEL_25:
      sub_2198C0850(a1);
      a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v10, a2, 0, 0);
      goto LABEL_26;
    }
    if ((_DWORD)a2 != 13)
    {
      *(_BYTE *)(a1 + 1425) = 0;
      if (a2 == 143)
        v9 = a2;
      else
        v9 = 255;
      if (a2 == 158)
        v9 = a2;
      if (a2 == 81)
        a2 = a2;
      else
        a2 = v9;
      v10 = 146;
      goto LABEL_25;
    }
  }
LABEL_26:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReDiscoveryComplete");
  return a2;
}

uint64_t sub_2198D5C68(uint64_t a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendDeactSleepCmd");
  if (a1)
  {
    v2 = a1 + 1456;
    if (sub_219902600(*(unsigned int **)(a1 + 3040), *(_QWORD *)(a1 + 1456)))
    {
      *(_QWORD *)v2 = 0;
      *(_QWORD *)(a1 + 1464) = 0;
      v3 = 1;
    }
    else
    {
      v3 = 1;
      if (*(_QWORD *)v2)
      {
        if (*(_DWORD *)(*(_QWORD *)v2 + 16) == 5)
          v3 = 2;
        else
          v3 = 1;
      }
    }
    v4 = sub_2198FD2D0(*(_QWORD *)(a1 + 3040), v3, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v4 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendDeactSleepCmd");
  return v4;
}

uint64_t sub_2198D5D1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v6;

  v6 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDeactComplete");
  if (a1)
  {
    if (!(_BYTE)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Lower layer has returned NFCSTATUS_SUCCESS");
      if ((_DWORD)a2)
        v4 = 146;
      else
        v4 = 145;
      *(_QWORD *)(a1 + 1464) = 0;
      *(_QWORD *)(a1 + 1456) = 0;
      goto LABEL_14;
    }
    if ((_DWORD)a2 != 81)
    {
      if ((_DWORD)a2 != 143)
      {
        if ((_DWORD)a2 == 121)
        {
          v4 = 150;
        }
        else
        {
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Buffer passed by Lower layer is NULL");
          v4 = 146;
          a2 = 255;
        }
        goto LABEL_14;
      }
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ProcessDeactComplete: Failed, non-heap memory access violation");
    }
    v4 = 146;
LABEL_14:
    a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, (uint64_t)&v6);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDeactComplete");
  return a2;
}

uint64_t sub_2198D5E50(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetProtoColToRfInterFaceMapping");
  if (a1)
  {
    sub_219865494(*(_QWORD *)(a1 + 3040), *(_BYTE *)(a1 + 1425));
    v2 = sub_219893808(a1);
  }
  else
  {
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetProtoColToRfInterFaceMapping");
  return v2;
}

uint64_t sub_2198D5EE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  uint64_t (**v7)();
  uint64_t (**v9)();
  uint64_t (*v10)();
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  char v15;

  v15 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DiscDeactivateComplete");
  if (a1)
  {
    v6 = (_QWORD *)(a1 + 1456);
    if (sub_219902600(*(unsigned int **)(a1 + 3040), *(_QWORD *)(a1 + 1456)))
    {
      *v6 = 0;
      *(_QWORD *)(a1 + 1464) = 0;
    }
    if ((_BYTE)a2)
    {
      sub_219865518(*(_QWORD *)(a1 + 3040), &v15);
      if (v15 == 1 && *(_BYTE *)(a1 + 1425) == 1)
      {
        if (*(unsigned __int8 *)(a1 + 1426) > 3u)
        {
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_DiscDeactivateComplete: Retry set mapping Failed");
          sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"pLibCtx->tDiscCtx.bRetryCfgCount");
          *(_BYTE *)(a1 + 1426) = 0;
          sub_219865494(*(_QWORD *)(a1 + 3040), 0);
        }
        else
        {
          phOsalNfc_Delay();
          sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_DiscDeactivateComplete: Retry set mapping cmd");
          sub_219865494(*(_QWORD *)(a1 + 3040), 1);
          v7 = *(uint64_t (***)())(a1 + 2912);
          if (v7 == off_2550A3428 || v7 == (uint64_t (**)())&qword_2550A3468)
            v9 = off_2550A3428;
          else
            v9 = off_2550A3408;
          *(_QWORD *)(a1 + 2912) = v9;
          *(_BYTE *)(a1 + 2904) = 0;
          *(_BYTE *)(a1 + 2906) = 0;
          v10 = *v9;
          if (*v9)
          {
            LOBYTE(v10) = 0;
            v11 = (uint64_t *)(v9 + 2);
            do
            {
              LOBYTE(v10) = (_BYTE)v10 + 1;
              v12 = *v11;
              v11 += 2;
            }
            while (v12);
          }
          *(_BYTE *)(a1 + 2905) = (_BYTE)v10;
          a2 = sub_2198655FC(a1, 0, a3);
          if ((_DWORD)a2 == 13)
          {
            ++*(_BYTE *)(a1 + 1426);
            goto LABEL_29;
          }
        }
      }
    }
    else
    {
      *v6 = 0;
      *(_QWORD *)(a1 + 1464) = 0;
    }
    if ((_DWORD)a2 == 13)
      goto LABEL_29;
    if ((_DWORD)a2)
    {
      *(_WORD *)(a1 + 1425) = 0;
      sub_219865494(*(_QWORD *)(a1 + 3040), 0);
      if (a2 != 81)
      {
        if (a2 != 143)
        {
          sub_219865598(*(unsigned int **)(a1 + 3040), 0);
          v13 = 146;
          a2 = 255;
          goto LABEL_28;
        }
        sub_219865598(*(unsigned int **)(a1 + 3040), 0);
      }
      v13 = 146;
    }
    else
    {
      *(_BYTE *)(a1 + 1426) = 0;
      sub_219865494(*(_QWORD *)(a1 + 3040), 0);
      v13 = 145;
    }
LABEL_28:
    *(_WORD *)(a1 + 1422) = 0;
    a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v13, a2, 0, 0);
  }
LABEL_29:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DiscDeactivateComplete");
  return a2;
}

uint64_t sub_2198D6150(uint64_t a1)
{
  uint64_t v2;
  _DWORD v4[386];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  bzero(v4, 0x6E8uLL);
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ClearExpModeSParams");
  if (a1)
  {
    if (*(_BYTE *)(a1 + 2936) == 1
      && ((*(_DWORD *)(a1 + 2980) & 0xFD) == 0xFC || *(_DWORD *)(a1 + 2980) - 1 <= 0x9E))
    {
      v4[1] = 0x10000;
      v4[384] = 64;
      v5 = 0;
    }
    if (sub_2198D719C((unsigned int *)a1, (uint64_t)v4))
    {
      v4[0] = *(_DWORD *)(a1 + 19368);
      sub_219865494(*(_QWORD *)(a1 + 3040), *(_BYTE *)(a1 + 1425));
      v2 = sub_2198FD4A4(*(_QWORD *)(a1 + 3040), (uint64_t)v4, (uint64_t)sub_219865DD0, a1);
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    v2 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ClearExpModeSParams");
  return v2;
}

uint64_t sub_2198D628C(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TagRemovalDetectCmd");
  if (a1)
    a2 = sub_219901AC8(*(_QWORD *)(a1 + 3040), (uint64_t)sub_219865DD0, a1);
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TagRemovalDetectCmd");
  return a2;
}

uint64_t sub_2198D6304(unsigned int *a1, uint64_t a2)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_TagRemovalDetectResp");
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_TagRemovalDetectResp");
  return a2;
}

uint64_t sub_2198D6368(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TagRemovalDetectComplete");
  if (a1)
  {
    if ((_DWORD)a2)
      v4 = 146;
    else
      v4 = 145;
    a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TagRemovalDetectComplete");
  return a2;
}

uint64_t sub_2198D63EC(unsigned int *a1, uint64_t a2, _WORD *a3)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDeactToDiscResp");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, a1 + 4842, 4u, 1u, (uint64_t)"Deactivate discovery failed!");
      goto LABEL_13;
    }
    if (!a3)
    {
LABEL_12:
      a2 = 255;
      goto LABEL_13;
    }
    a2 = (unsigned __int16)*a3;
    if ((unsigned __int16)*a3 <= 0x50u)
    {
      if (!*a3)
        goto LABEL_13;
      if ((_DWORD)a2 == 47 || (_DWORD)a2 == 58)
      {
        sub_219850628(1, a1 + 4842, 4u, 4u, (uint64_t)"Deactivation to discovery success");
        a2 = 0;
        goto LABEL_13;
      }
      goto LABEL_12;
    }
    if ((a2 - 81) > 0x3E || ((1 << (a2 - 81)) & 0x4000010000000001) == 0)
      goto LABEL_12;
  }
LABEL_13:
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDeactToDiscResp");
  return a2;
}

uint64_t sub_2198D64F8(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t (**v6)();
  uint64_t (*v7)();
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (**v11)();
  uint64_t (*v12)();
  unsigned int *v13;
  const char *v14;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDiscReq");
  if (a1)
  {
    if (a2 != 1)
    {
      if (a2)
      {
        v13 = (unsigned int *)(a1 + 19368);
        v14 = "Invalid Request Mode ";
      }
      else
      {
        if (a3)
        {
          v6 = off_2550A32E8;
          if (*(_DWORD *)(a3 + 88) == 2)
            v6 = off_2550A34F8;
          *(_QWORD *)(a1 + 2912) = v6;
          *(_BYTE *)(a1 + 2904) = 0;
          *(_BYTE *)(a1 + 2906) = 0;
          v7 = *v6;
          if (*v6)
          {
            LOBYTE(v7) = 0;
            v8 = (uint64_t *)(v6 + 2);
            do
            {
              LOBYTE(v7) = (_BYTE)v7 + 1;
              v9 = *v8;
              v8 += 2;
            }
            while (v9);
          }
LABEL_15:
          *(_BYTE *)(a1 + 2905) = (_BYTE)v7;
          v10 = sub_2198655FC(a1, 0, a3);
          goto LABEL_19;
        }
        v13 = (unsigned int *)(a1 + 19368);
        v14 = "pADDSetup is NULL ";
      }
      v10 = 1;
      sub_219850628(1, v13, 4u, 1u, (uint64_t)v14);
      goto LABEL_19;
    }
    *(_QWORD *)(a1 + 2912) = &qword_2550A3388;
    *(_BYTE *)(a1 + 2904) = 0;
    *(_BYTE *)(a1 + 2906) = 0;
    LOBYTE(v7) = qword_2550A3388;
    if (qword_2550A3388)
    {
      LOBYTE(v7) = 0;
      v11 = off_2550A3398;
      do
      {
        LOBYTE(v7) = (_BYTE)v7 + 1;
        v12 = *v11;
        v11 += 2;
      }
      while (v12);
    }
    goto LABEL_15;
  }
  v10 = 49;
LABEL_19:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDiscReq");
  return v10;
}

uint64_t sub_2198D6650(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t *v6;
  uint64_t v7;
  uint64_t (**v8)();
  uint64_t (*v9)();
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t (**v15)();
  uint64_t (*v16)();
  uint64_t (**v17)();
  uint64_t (*v18)();
  uint64_t *v19;
  uint64_t v20;
  _BYTE *v22;
  uint64_t v23;

  v22 = 0;
  v23 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessReDiscReq");
  if (a1)
  {
    v6 = (uint64_t *)(a1 + 1456);
    if (sub_219902600(*(unsigned int **)(a1 + 3040), *(_QWORD *)(a1 + 1456)))
    {
      *v6 = 0;
      *(_QWORD *)(a1 + 1464) = 0;
LABEL_4:
      v7 = 0;
      switch(a2)
      {
        case 0:
          if (!a3)
            goto LABEL_22;
          v8 = off_2550A3588;
          if (*(_DWORD *)(a3 + 88) == 2)
            v8 = off_2550A34F8;
          *(_QWORD *)(a1 + 2912) = v8;
          *(_BYTE *)(a1 + 2904) = 0;
          *(_BYTE *)(a1 + 2906) = 0;
          v9 = *v8;
          if (*v8)
          {
            LOBYTE(v9) = 0;
            v10 = (uint64_t *)(v8 + 2);
            do
            {
              LOBYTE(v9) = (_BYTE)v9 + 1;
              v11 = *v10;
              v10 += 2;
            }
            while (v11);
          }
          *(_BYTE *)(a1 + 2905) = (_BYTE)v9;
          v12 = a1;
          v13 = a3;
          goto LABEL_31;
        case 1:
          *(_QWORD *)(a1 + 2912) = &qword_2550A3388;
          *(_BYTE *)(a1 + 2904) = 0;
          *(_BYTE *)(a1 + 2906) = 0;
          v14 = qword_2550A3388;
          if (qword_2550A3388)
          {
            v14 = 0;
            v17 = off_2550A3398;
            do
            {
              ++v14;
              v18 = *v17;
              v17 += 2;
            }
            while (v18);
          }
          goto LABEL_30;
        case 3:
          goto LABEL_18;
        case 4:
          *(_QWORD *)(a1 + 2912) = &qword_2550A0D88;
          *(_BYTE *)(a1 + 2904) = 0;
          *(_BYTE *)(a1 + 2906) = 0;
          v14 = qword_2550A0D88;
          if (qword_2550A0D88)
          {
            v14 = 0;
            v19 = &qword_2550A0D98;
            do
            {
              ++v14;
              v20 = *v19;
              v19 += 2;
            }
            while (v20);
          }
          goto LABEL_30;
        case 6:
          goto LABEL_32;
        default:
LABEL_22:
          v7 = 1;
          goto LABEL_32;
      }
    }
    if (!*v6)
      goto LABEL_4;
    v23 = *v6;
    if (sub_2198BE4E4(a1, &v22, &v23, 0)
      || !v22
      || *v22 && sub_2198D0904((unsigned int *)a1, v23))
    {
      goto LABEL_4;
    }
LABEL_18:
    *(_QWORD *)(a1 + 2912) = &qword_2550A33D8;
    *(_BYTE *)(a1 + 2904) = 0;
    *(_BYTE *)(a1 + 2906) = 0;
    v14 = qword_2550A33D8;
    if (qword_2550A33D8)
    {
      v14 = 0;
      v15 = off_2550A33E8;
      do
      {
        ++v14;
        v16 = *v15;
        v15 += 2;
      }
      while (v16);
    }
LABEL_30:
    *(_BYTE *)(a1 + 2905) = v14;
    v12 = a1;
    v13 = 0;
LABEL_31:
    v7 = sub_2198655FC(v12, 0, v13);
  }
  else
  {
    v7 = 49;
  }
LABEL_32:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessReDiscReq");
  return v7;
}

uint64_t sub_2198D687C(uint64_t a1, unsigned int *a2)
{
  unsigned int v4;
  int v5;
  uint64_t v6;
  char v7;
  int v8;
  int v9;
  unsigned int v10;
  char v11;
  int v12;
  unsigned int v13;
  int v14;
  int v15;
  char v16;
  int v17;
  char v18;
  char v19;
  char v20;
  int v21;
  char *v22;
  char v23;
  _BYTE *v24;
  char v25;
  _OWORD v27[4];
  __int128 v28;
  int v29;
  int v30;
  int v31;
  char v32;
  char v33;
  char v34;
  BOOL v35;
  char v36;
  __int16 v37;
  int v38;
  char v39;
  char v40;
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  bzero(&v30, 0x6E8uLL);
  v29 = 0;
  v28 = 0u;
  memset(v27, 0, sizeof(v27));
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigDiscParams");
  if (!a2)
  {
    v6 = 1;
    goto LABEL_110;
  }
  v4 = *a2;
  if ((*a2 & 1) != 0)
    v5 = 1;
  else
    v5 = *((_BYTE *)a2 + 6) & 1;
  *a2 = v4 & 0xFFFFFFFE | v5;
  v7 = 1;
  if ((v4 & 4) != 0)
    goto LABEL_10;
  if ((v4 & 8) != 0)
  {
    v7 = 2;
LABEL_10:
    v8 = 4;
    v31 = 4;
    v32 = 1;
    v33 = v7;
    goto LABEL_11;
  }
  v8 = 0;
LABEL_11:
  sub_21989A864((uint64_t)v27, a1);
  v9 = *(unsigned __int8 *)(a1 + 2937);
  if (v9 != 1
    && *(_BYTE *)(a1 + 2938) != 1
    && *(_BYTE *)(a1 + 2944) != 1
    && (*(_BYTE *)(a1 + 2936) != 1 || (*(_DWORD *)(a1 + 2980) & 0xFEu) < 0x32))
  {
    v12 = 0;
    goto LABEL_29;
  }
  if (v29 != 1 && *(_BYTE *)(a1 + 2938) != 1 && *(_BYTE *)(a1 + 2944) != 1)
  {
    v12 = 0;
    v38 = 0;
    goto LABEL_29;
  }
  v8 |= 0x10000u;
  v38 = 2048;
  v10 = *a2;
  if ((*a2 & 0x800) != 0)
  {
    v11 = 1;
LABEL_22:
    v40 = v11;
    goto LABEL_23;
  }
  if ((v10 & 0x1000) != 0)
  {
    v11 = 3;
    goto LABEL_22;
  }
  v11 = 0;
  v40 = 0;
LABEL_23:
  if (!*(_BYTE *)(a1 + 2936))
  {
    if ((v10 & 0x2000) != 0)
    {
      v11 |= 4u;
      v40 = v11;
    }
    if ((v10 & 0x4000) != 0)
      v40 = v11 | 8;
  }
  v12 = 2048;
LABEL_29:
  v36 = 1;
  v13 = *((unsigned __int16 *)a2 + 2);
  if (v13 <= 0x12B
    && (v9 != 1 && *(_BYTE *)(a1 + 2938) != 1 && *(_BYTE *)(a1 + 2944) != 1
     || (*a2 & 0x40000) == 0
     || !*((_WORD *)a2 + 2)
     || (*a2 & 0x80000) != 0
     || (a2[20] & 1) != 0))
  {
    LOWORD(v13) = 300;
  }
  v37 = v13;
  v14 = v8 | 0x480;
  v31 = v8 | 0x480;
  v34 = 2;
  v35 = *((_BYTE *)a2 + 7) == 0;
  v15 = *(unsigned __int8 *)(a1 + 2944);
  if ((v15 == 1 || (v9 == 1 || *(_BYTE *)(a1 + 2938) == 1) && *(_DWORD *)(a1 + 3148) == 1)
    && (*((_BYTE *)a2 + 2) & 0xC) == 0
    && *((_BYTE *)a2 + 93) == 1)
  {
    v14 = v8 | 0x10480;
    v12 |= 0x80000u;
    v31 = v8 | 0x10480;
    v38 = v12;
    v41 = 1;
  }
  else
  {
    v38 = v12;
  }
  v39 = 0;
  if ((BYTE12(v28) & 1) != 0 && (v14 |= 0x10000u, v12 |= 0x40u, v31 = v14, v38 = v12, (a2[3] & 1) != 0))
  {
    v16 = 0x80;
    v39 = 0x80;
    v17 = 1;
  }
  else
  {
    v16 = 0;
    v17 = 0;
  }
  if ((BYTE12(v28) & 2) != 0)
  {
    v14 |= 0x10000u;
    v12 |= 0x40u;
    v31 = v14;
    v38 = v12;
    if ((a2[3] & 2) != 0)
    {
      v16 |= 0x40u;
      v39 = v16;
      v17 = 1;
    }
  }
  if ((BYTE12(v28) & 4) != 0)
  {
    v14 |= 0x10000u;
    v12 |= 0x40u;
    v31 = v14;
    v38 = v12;
    if ((a2[3] & 4) != 0)
    {
      v16 |= 0x20u;
      v39 = v16;
      v17 = 1;
    }
  }
  if ((BYTE12(v28) & 8) != 0)
  {
    v14 |= 0x10000u;
    v12 |= 0x40u;
    v31 = v14;
    v38 = v12;
    v18 = *((_BYTE *)a2 + 12);
    if ((v18 & 8) != 0)
    {
      v16 |= 0x10u;
      v39 = v16;
      goto LABEL_62;
    }
  }
  else
  {
    v18 = *((_BYTE *)a2 + 12);
  }
  if (!v17)
  {
    *((_BYTE *)a2 + 12) = v18 & 0xCF;
LABEL_75:
    if (*(_BYTE *)(a1 + 2936) == 1)
    {
      v42 = 0;
      v14 |= 0x10000u;
      v12 |= 0x80u;
      v31 = v14;
      v38 = v12;
      if ((a2[20] & 1) != 0)
      {
        if (*a2)
        {
          if ((a2[20] & 2) != 0)
            v20 = -127;
          else
            v20 = 1;
          v42 = v20;
        }
      }
    }
    goto LABEL_82;
  }
LABEL_62:
  if ((v18 & 0x10) != 0)
  {
    v16 |= 1u;
    v39 = v16;
  }
  if ((v18 & 0x20) != 0)
  {
    v19 = 2;
    goto LABEL_69;
  }
  if ((v18 & 0x18) != 0)
  {
LABEL_70:
    if (v15 == 1 || (v9 == 1 || *(_BYTE *)(a1 + 2938) == 1) && *(_DWORD *)(a1 + 3148) == 1)
    {
      v12 |= 0x80000u;
      v38 = v12;
      v41 = 0;
    }
    goto LABEL_75;
  }
  if (v9 == 1)
    goto LABEL_67;
  v19 = 4;
  if (v15 == 1 || *(_BYTE *)(a1 + 2938) == 1)
    goto LABEL_69;
  if (*(_BYTE *)(a1 + 2936) == 1)
  {
LABEL_67:
    v19 = 4;
LABEL_69:
    v39 = v19 | v16;
    goto LABEL_70;
  }
LABEL_82:
  v21 = *(unsigned __int8 *)(a1 + 2937);
  if (v21 == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
  {
    v22 = (char *)(a1 + 5127);
    if (*(_BYTE *)(a1 + 5168))
    {
      v31 = v14 | 0x10000;
      v38 = v12 | 0x100;
      v23 = *v22;
      *v22 &= ~0x80u;
      if ((a2[20] & 1) != 0 && *a2)
        *v22 = v23 | 0x80;
      phOsalNfc_MemCopy();
      v43 = *(_BYTE *)(a1 + 5168);
      v21 = *(unsigned __int8 *)(a1 + 2937);
    }
    if ((v21 == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1) && *(_BYTE *)(a1 + 5219))
    {
      sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkForListnModeConfig");
      if (((*a2 & 0x40000) != 0 || (*((_BYTE *)a2 + 9) & 0xF) == 8) && !(*a2 & 0x80000 | a2[3] & 0xF))
      {
        sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkForListnModeConfig");
      }
      else
      {
        sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkForListnModeConfig");
        v24 = (_BYTE *)(a1 + 5169);
        v25 = *(_BYTE *)(a1 + 5169);
        v38 |= 0x200u;
        *(_BYTE *)(a1 + 5169) = v25 & 0xF6;
        if (*((_BYTE *)a2 + 84) == 1)
        {
          *v24 = v25 & 0xF6 | 1;
          if (*((_BYTE *)a2 + 85) == 1)
            *v24 = v25 | 9;
        }
        phOsalNfc_MemCopy();
        v44 = *(_BYTE *)(a1 + 5219);
      }
    }
  }
  if (*(_BYTE *)(a1 + 2939) == 1
    && (*(_BYTE *)(a1 + 2943) == 1 || *(_BYTE *)(a1 + 2942) == 1 || *(_BYTE *)(a1 + 3088) == 2))
  {
    v31 |= 0x10000u;
    v38 |= 0x10000u;
    v45 = 0;
  }
  if (sub_2198D719C((unsigned int *)a1, (uint64_t)&v30))
  {
    v30 = *(_DWORD *)(a1 + 19368);
    v6 = sub_2198FD4A4(*(_QWORD *)(a1 + 3040), (uint64_t)&v30, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v6 = 255;
  }
LABEL_110:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigDiscParams");
  return v6;
}

uint64_t sub_2198D6F20(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  const char *v5;
  uint64_t v6;
  int v8;
  int v9;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDiscoveryType");
  if (!a2)
  {
    v6 = 1;
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid input parameters");
    goto LABEL_6;
  }
  if ((*(_DWORD *)a2 & 0xB83DF) == 0)
  {
    v8 = *(unsigned __int8 *)(a2 + 6);
    if (*(_BYTE *)(a2 + 6) && v8 != 255 && (v8 == 15 || (v8 & 0x77777777) != 0))
    {
      v4 = (unsigned int *)(a1 + 19368);
      v5 = "P2P Initiator is enabled";
      goto LABEL_4;
    }
    if ((*(_DWORD *)a2 & 0x40000) != 0)
    {
      if (!*(_BYTE *)(a2 + 7))
      {
        v4 = (unsigned int *)(a1 + 19368);
        v5 = "P2P Target mode is enabled";
        goto LABEL_4;
      }
      v9 = *(_DWORD *)(a2 + 88);
      if (v9 == 1 || v9 == 3)
      {
        v6 = 1;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"SE reader mode is Disabled or EMVCO tag removal detection is enabled");
        goto LABEL_6;
      }
      if (v9 == 2)
      {
        v4 = (unsigned int *)(a1 + 19368);
        v5 = "SE reader mode is Enabled";
        goto LABEL_4;
      }
    }
    else if (a1 && *(_BYTE *)(a1 + 314))
    {
      v4 = (unsigned int *)(a1 + 19368);
      v5 = "Card emulation is enabled";
      goto LABEL_4;
    }
    v6 = 1;
    goto LABEL_6;
  }
  v4 = (unsigned int *)(a1 + 19368);
  v5 = "Poll is enabled";
LABEL_4:
  sub_219850628(1, v4, 4u, 4u, (uint64_t)v5);
  v6 = 0;
LABEL_6:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDiscoveryType");
  return v6;
}

uint64_t sub_2198D70B0(uint64_t a1, unsigned int *a2)
{
  char v3;
  uint64_t v4;
  unsigned int *v5;

  sub_21988629C(2, a2, a1, 4u, 4u, (uint64_t)"phLibNfc_DelayDiscTimerCb");
  sub_219850718(2, a2, 4u, 5u, (uint64_t)"phLibNfc_DelayDiscTimerCb");
  if (a2)
  {
    v3 = 0;
    v4 = 0;
    do
    {
      v5 = (unsigned int *)*((_QWORD *)&unk_253E46700 + 14 * v4 + 2);
      if ((v3 & 1) != 0)
        break;
      v3 = 1;
      v4 = 1;
    }
    while (v5 != a2);
    if (v5 == a2)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      sub_2198655FC((uint64_t)a2, 0, 0);
    }
  }
  return sub_219850808(2, a2, 4u, 5u, (uint64_t)"phLibNfc_DelayDiscTimerCb");
}

BOOL sub_2198D719C(unsigned int *a1, uint64_t a2)
{
  _BOOL8 v4;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetconfEntryCheck");
  v4 = (*(_DWORD *)(a2 + 4) & 0x1B7FF) != 0;
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetconfEntryCheck");
  return v4;
}

uint64_t sub_2198D7214(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v5;
  _DWORD *v6;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendSelectCmd");
  if (!a1)
    goto LABEL_4;
  v2 = (uint64_t *)(a1 + 1456);
  if (sub_219902600(*(unsigned int **)(a1 + 3040), *(_QWORD *)(a1 + 1456)))
  {
    *v2 = 0;
    *(_QWORD *)(a1 + 1464) = 0;
LABEL_4:
    v3 = 1;
    goto LABEL_5;
  }
  v5 = *v2;
  if (!*v2)
    goto LABEL_4;
  if (*(_BYTE *)(a1 + 1472))
    v6 = (_DWORD *)(a1 + 1476);
  else
    v6 = (_DWORD *)(v5 + 12);
  v3 = sub_2198FD114(*(_QWORD *)(a1 + 3040), v5, *v6, (uint64_t)sub_219865DD0, a1);
  if ((_DWORD)v3 == 13)
    *(_BYTE *)(a1 + 19352) = 1;
LABEL_5:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendSelectCmd");
  return v3;
}

uint64_t sub_2198D72DC(uint64_t a1)
{
  uint64_t *v2;
  uint64_t v3;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendSelectCmd1");
  if (!a1)
    goto LABEL_4;
  v2 = (uint64_t *)(a1 + 1456);
  if (sub_219902600(*(unsigned int **)(a1 + 3040), *(_QWORD *)(a1 + 1456)))
  {
    *v2 = 0;
    *(_QWORD *)(a1 + 1464) = 0;
LABEL_4:
    v3 = 1;
    goto LABEL_5;
  }
  if (!*v2)
    goto LABEL_4;
  v3 = sub_2198FD114(*(_QWORD *)(a1 + 3040), *v2, *(_DWORD *)(*v2 + 12), (uint64_t)sub_219865DD0, a1);
  if ((_DWORD)v3 == 13)
    *(_BYTE *)(a1 + 19352) = 1;
LABEL_5:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SendSelectCmd1");
  return v3;
}

uint64_t sub_2198D7390(uint64_t a1, int a2, uint64_t a3)
{
  const char *v6;
  int v7;
  unsigned int *v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SelectCmdResp");
  if (!a1 || a2)
  {
    v6 = "Discovery select command failed!";
    v7 = 2;
    v8 = (unsigned int *)a1;
LABEL_7:
    sub_219850628(v7, v8, 4u, 1u, (uint64_t)v6);
    a3 = 255;
    goto LABEL_8;
  }
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Discovery select command success");
  if (a3)
  {
    if (*(_QWORD *)(a1 + 1456) == a3)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Valid remoteDev Handle!!");
      a3 = 0;
      goto LABEL_8;
    }
    v6 = "Invalid remoteDev Handle!!";
    v7 = 1;
    v8 = (unsigned int *)(a1 + 19368);
    goto LABEL_7;
  }
LABEL_8:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SelectCmdResp");
  return a3;
}

uint64_t sub_2198D748C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReqInfoComplete");
  if (a1)
  {
    if ((_DWORD)a2 != 10 && (_DWORD)a2)
    {
      v4 = 235;
      v5 = 255;
    }
    else
    {
      v4 = *(unsigned int *)(a1 + 816);
      v5 = a2;
    }
    sub_2198D752C(a1, v4, *(_QWORD *)(a1 + 808), a2);
  }
  else
  {
    v5 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReqInfoComplete");
  return v5;
}

uint64_t sub_2198D752C(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  int v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  int v14;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDevInfo");
  if (a4 > 0x37 || ((1 << a4) & 0x80010000000001) == 0)
  {
    if (a3
      && a4 == 10
      && *(_DWORD *)a3 == 1
      && (v10 = *(_QWORD *)(a3 + 8)) != 0
      && *(_DWORD *)(v10 + 4) == 19
      && (v11 = *(unsigned int *)(a1 + 816), v12 = sub_21990201C(*(_QWORD *)(a1 + 3040)), (v12 & 0xFFFE) == 0xBA))
    {
      sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v11, v12, a3, 0);
    }
    else
    {
      sub_2198D77C0(a1);
    }
    return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDevInfo");
  }
  v8 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), a2, 0, a3, 0);
  if (a4 == 55 || a4 == 40)
  {
    v9 = (unsigned int *)(a1 + 19368);
    switch(v8)
    {
      case 0:
        sub_219851790(1, v9, 4u, 4u, (uint64_t)"State machine has returned NFCSTATUS_SUCCESS ");
        if (*(_BYTE *)(a1 + 716) == 16)
          goto LABEL_24;
LABEL_30:
        *(_BYTE *)(a1 + 716) = 16;
        return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDevInfo");
      case 119:
        a4 = 119;
        sub_219851790(1, v9, 4u, 4u, (uint64_t)"State machine has returned NFCSTATUS_UNKNOWN_TAG_PROTOCOL ");
        break;
      case 111:
        a4 = 111;
        sub_219851790(1, v9, 4u, 2u, (uint64_t)"State machine has returned NFCSTATUS_BUSY ");
        break;
      default:
        a4 = 255;
        sub_219851790(1, v9, 4u, 1u, (uint64_t)"State machine has returned NFCSTATUS_FAILED ");
        break;
    }
  }
  if (*(_BYTE *)(a1 + 716) != 16)
    goto LABEL_30;
  if (a4)
    sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ProcessDevInfo: status returned is other than success wStatus");
LABEL_24:
  if (*(_BYTE *)(a1 + 714))
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Invoking upper layer callback function ");
    v13 = *(_DWORD **)(a3 + 8);
    v14 = v13[3];
    if (v14 == 1)
    {
      if (v13[4] == 3 && v13[5] == 130)
        goto LABEL_34;
    }
    else if (v14 == 2 && v13[4] == 4 && (v13[5] & 0xFFFFFFFE) == 0x80)
    {
LABEL_34:
      *(_BYTE *)(a1 + 486) = 1;
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcessDevInfo");
}

uint64_t sub_2198D77C0(uint64_t a1)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RestartDiscovery");
  *(_DWORD *)(a1 + 984) = 0;
  sub_2198D1B2C(*(_QWORD *)(a1 + 19360), 136, 0, a1 + 984, a1 + 1000);
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RestartDiscovery");
}

uint64_t sub_2198D782C(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  void (*v6)(_QWORD, uint64_t, _QWORD, uint64_t);
  _QWORD *v7;
  void (*v8)(_QWORD, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  unsigned int *v12;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_InvokeDiscDisconnCb");
  v4 = *(_DWORD *)(a1 + 984);
  if (v4 > 6 || ((1 << v4) & 0x43) == 0)
  {
    v8 = 0;
    v7 = (_QWORD *)(a1 + 6216);
    v6 = *(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(a1 + 6216);
    v9 = 6224;
  }
  else
  {
    v6 = 0;
    v7 = (_QWORD *)(a1 + 6248);
    v8 = *(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 6248);
    v9 = 6256;
  }
  v10 = *(_QWORD *)(a1 + v9);
  *v7 = 0;
  v7[1] = 0;
  if (v4 > 6 || ((1 << v4) & 0x43) == 0)
  {
    v12 = (unsigned int *)(a1 + 19368);
    if (v6)
    {
      sub_219885F70(1, v12, 4u, 130, (uint64_t)"phLibNfc_InvokeDiscDisconnCb");
      v6(*(_QWORD *)(a1 + 19360), v10, 0, a2);
      goto LABEL_16;
    }
    v11 = "InvokeDiscDisconnCb: Upper layer call back function (pDisconnNtfCb) not found";
LABEL_15:
    sub_219850628(1, v12, 4u, 4u, (uint64_t)v11);
    goto LABEL_16;
  }
  if (!v8)
  {
    v11 = "InvokeDiscDisconnCb: Upper layer call back function (pDiscNtfCb) not found";
    v12 = (unsigned int *)(a1 + 19368);
    goto LABEL_15;
  }
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"InvokeDiscDisconnCb: Invoking upper layer call back function");
  sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 114, (uint64_t)"phLibNfc_InvokeDiscDisconnCb");
  v8(*(_QWORD *)(a1 + 19360), v10, a2);
LABEL_16:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_InvokeDiscDisconnCb");
  return a2;
}

uint64_t sub_2198D79DC(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t (**v9)();
  uint64_t (*v10)();

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RequestMoreInfo");
  v6 = *(_QWORD *)(a1 + 808);
  if (((_DWORD)a3 == 55 || (_DWORD)a3 == 40) && *(_DWORD *)v6 == 1)
  {
    v7 = *(_QWORD *)(v6 + 8);
    if (v7)
    {
      if (*(_DWORD *)(v7 + 16) == 1 && !*(_BYTE *)(v7 + 46))
      {
        if ((sub_2198D2640(*(_QWORD *)(a1 + 19360)) == 136
           || sub_2198D2640(*(_QWORD *)(a1 + 19360)) == 137)
          && sub_2198D2574(*(_QWORD *)(a1 + 19360)) == 1)
        {
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_RequestMoreInfo : RID Sequence Dropped due to ongoing Discovery Sequence");
          a3 = 13;
        }
        else
        {
          *(_QWORD *)(a1 + 2912) = &qword_2550A2FB8;
          *(_BYTE *)(a1 + 2904) = 0;
          *(_BYTE *)(a1 + 2906) = 0;
          v8 = qword_2550A2FB8;
          if (qword_2550A2FB8)
          {
            v8 = 0;
            v9 = off_2550A2FC8;
            do
            {
              ++v8;
              v10 = *v9;
              v9 += 2;
            }
            while (v10);
          }
          *(_BYTE *)(a1 + 2905) = v8;
          *(_DWORD *)(a1 + 816) = a2;
          *(_BYTE *)(a1 + 1481) = 0;
          a3 = sub_2198655FC(a1, 0, 0);
        }
      }
    }
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RequestMoreInfo");
  return a3;
}

uint64_t sub_2198D7B28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  unsigned int v11;
  int v12;
  int v13;
  __int128 v15;
  uint64_t v16;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseDiscActivatedRemDevInfo");
  if (a1 && a3)
  {
    v6 = *(_DWORD *)(a3 + 20);
    switch(v6)
    {
      case 0:
      case 3:
      case 10:
      case 11:
      case 12:
LABEL_4:
        v7 = *(_DWORD *)(a3 + 16);
        switch(v7)
        {
          case 1:
            *(_DWORD *)(a2 + 4) = 22;
            sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevAJewel");
            v16 = *(_QWORD *)(a3 + 43);
            if (BYTE3(v16) > 0xAu)
            {
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Received UID length exceeded max UID length");
            }
            else
            {
              *(_BYTE *)(a2 + 18) = BYTE3(v16);
              phOsalNfc_MemCopy();
            }
            *(_BYTE *)(a2 + 19) = *(_BYTE *)(a3 + 49);
            *(_BYTE *)(a2 + 20) = *(_BYTE *)(a3 + 50);
            sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevAJewel");
            if (BYTE3(v16) >= 0xBu)
              goto LABEL_56;
            goto LABEL_59;
          case 2:
            goto LABEL_15;
          case 3:
            goto LABEL_56;
          case 4:
            v10 = *(_DWORD *)(a3 + 4);
            v11 = v10 & 0xFFFFFFFC;
            v12 = v10 + 8;
            if (v11 != 4)
              v12 = 11;
            *(_DWORD *)(a2 + 4) = v12;
            if (*(_DWORD *)(a3 + 12) == 1 && *(_BYTE *)(a1 + 1422) == 1)
              *(_BYTE *)(a1 + 1423) = 1;
            goto LABEL_42;
          case 5:
            *(_DWORD *)(a2 + 4) = 26;
            if (!sub_2198C6B38((unsigned int *)a1, a2 + 8, a3 + 36, v6))
              goto LABEL_59;
            goto LABEL_56;
          default:
            if (v7 == 138)
            {
              *(_DWORD *)(a2 + 4) = 25;
              sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevKovio");
              v15 = *(_OWORD *)(a3 + 36);
              *(_BYTE *)(a2 + 8) = v15;
              if (v15 == 16)
                phOsalNfc_MemCopy();
              else
                sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid TagID: TagID < 16 Bytes");
              sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevKovio");
              goto LABEL_59;
            }
            if (v7 != 128)
              goto LABEL_56;
LABEL_15:
            if (*(_DWORD *)(a3 + 4) == 4)
              v9 = 12;
            else
              v9 = 16;
            *(_DWORD *)(a2 + 4) = v9;
LABEL_42:
            if (!sub_2198D7FCC(a1, a2, a3))
              goto LABEL_59;
            goto LABEL_56;
        }
      case 1:
        if (*(_DWORD *)(a3 + 4) == 25)
        {
          *(_DWORD *)(a2 + 4) = 18;
          if (*(_DWORD *)(a3 + 12) == 1 && *(_BYTE *)(a1 + 1422) == 1)
            *(_BYTE *)(a1 + 1423) = 1;
        }
        else if (*(_DWORD *)(a3 + 16) == 4)
        {
          v13 = *(_DWORD *)(a3 + 12);
          if (v13 == 131 || v13 == 2)
            *(_DWORD *)(a2 + 4) = 19;
        }
LABEL_52:
        if (!sub_2198D8294((unsigned int *)a1, (_BYTE *)(a2 + 8), a3))
          goto LABEL_59;
        goto LABEL_56;
      case 2:
      case 5:
        if (*(_DWORD *)(a3 + 16) == 3)
        {
          *(_DWORD *)(a2 + 4) = 21;
LABEL_23:
          if (!sub_2198D8454((unsigned int *)a1, a2 + 8))
            goto LABEL_59;
        }
        goto LABEL_56;
      case 4:
      case 7:
      case 8:
      case 9:
LABEL_26:
        v8 = 0;
        *(_DWORD *)(a2 + 4) = 28;
        break;
      case 6:
        if (*(_DWORD *)(a3 + 16) != 6
          || (*(_DWORD *)(a2 + 4) = 23, sub_2198626E8((unsigned int *)a1, a2 + 8, a3 + 36)))
        {
LABEL_56:
          *(_DWORD *)(a2 + 4) = 28;
          v8 = 255;
        }
        else
        {
LABEL_59:
          v8 = 0;
        }
        break;
      default:
        switch(v6)
        {
          case 128:
          case 131:
            if (*(_DWORD *)(a3 + 16) == 4)
            {
              *(_DWORD *)(a2 + 4) = 1;
              if (sub_219890D4C(a1) == 13
                && !sub_219890DC8((unsigned int *)a1, (_BYTE *)(a2 + 8), (unsigned __int8 *)a3))
              {
                goto LABEL_59;
              }
            }
            goto LABEL_56;
          case 129:
            if (*(_DWORD *)(a3 + 16) != 4)
              goto LABEL_56;
            *(_DWORD *)(a2 + 4) = 2;
            if (sub_219890D4C(a1) != 13)
              goto LABEL_56;
            goto LABEL_52;
          case 130:
          case 133:
            if (*(_DWORD *)(a3 + 16) == 3)
            {
              *(_DWORD *)(a2 + 4) = 4;
              if (sub_219890D4C(a1) == 13)
                goto LABEL_23;
            }
            goto LABEL_56;
          case 132:
            goto LABEL_26;
          default:
            if (v6 != 112)
              goto LABEL_26;
            goto LABEL_4;
        }
    }
  }
  else
  {
    v8 = 1;
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid Input info!");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseDiscActivatedRemDevInfo");
  return v8;
}

uint64_t sub_2198D7FCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  memset(v18, 0, 26);
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  v13 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevA");
  if (!a2)
  {
    v6 = 1;
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid input parameter!");
    goto LABEL_20;
  }
  if (sub_2198D8570((unsigned int *)a1, *(unsigned __int8 *)(a3 + 32), &v13))
  {
    v6 = 255;
    goto LABEL_20;
  }
  *(_BYTE *)(a2 + 71) = v13;
  v7 = *(_OWORD *)(a3 + 100);
  v8 = *(_OWORD *)(a3 + 68);
  v17 = *(_OWORD *)(a3 + 84);
  v18[0] = v7;
  *(_OWORD *)((char *)v18 + 10) = *(_OWORD *)(a3 + 110);
  v9 = *(_OWORD *)(a3 + 52);
  v14 = *(_OWORD *)(a3 + 36);
  v15 = v9;
  v16 = v8;
  if (BYTE3(v7))
    *(_BYTE *)(a2 + 68) = BYTE12(v17);
  v10 = BYTE10(v14);
  *(_BYTE *)(a2 + 18) = BYTE10(v14);
  if (!v10)
    goto LABEL_10;
  if (v10 <= 0xA)
  {
    phOsalNfc_MemCopy();
LABEL_10:
    v6 = 0;
    goto LABEL_12;
  }
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Received UID length exceeded max UID length");
  v6 = 255;
LABEL_12:
  if (BYTE4(v18[0]) - 2 <= 0x32)
  {
    v11 = BYTE9(v18[1]);
    *(_BYTE *)(a2 + 67) = BYTE9(v18[1]);
    if (v11)
    {
      if (v11 > 0x30)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Received AppData length exceeded max ATR length");
        v6 = 255;
      }
      else
      {
        phOsalNfc_MemCopy();
      }
    }
  }
  *(_BYTE *)(a2 + 72) = v18[0];
  *(_WORD *)(a2 + 69) = *(_WORD *)((char *)v18 + 1);
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Check for MergeSak");
  if ((BYTE12(v17) & 0xF7) == 0x60)
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"MergeSak detected, update remote device detected to P2P Target");
    *(_DWORD *)(a2 + 4) = 26;
    *(_BYTE *)(a2 + 67) = 0;
    *(_WORD *)(a2 + 72) = 0;
    *(_BYTE *)(a2 + 18) = 0;
    *(_BYTE *)(a2 + 71) = ((*(_DWORD *)(a3 + 20) - 3) & 0xFFFFFF7D) == 0;
    *(_DWORD *)(a2 + 76) = 0;
    *(_BYTE *)(a2 + 68) = 64;
    *(_QWORD *)(a3 + 12) = 0x500000003;
    *(_DWORD *)(a3 + 4) = 23;
    *(_BYTE *)(a1 + 1442) = 1;
  }
  else
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"MergeSak not found");
  }
LABEL_20:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevA");
  return v6;
}

uint64_t sub_2198D8294(unsigned int *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  char v10;
  unsigned int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _OWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  memset(v18, 0, 30);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v12 = 0;
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevB");
  if (a2)
  {
    if (sub_2198D8570(a1, *(unsigned __int8 *)(a3 + 32), &v12))
    {
      v6 = 255;
    }
    else
    {
      a2[63] = v12;
      v7 = *(_OWORD *)(a3 + 84);
      v8 = *(_OWORD *)(a3 + 116);
      v17 = *(_OWORD *)(a3 + 100);
      v18[0] = v8;
      *(_OWORD *)((char *)v18 + 14) = *(_OWORD *)(a3 + 130);
      v9 = *(_OWORD *)(a3 + 52);
      v13 = *(_OWORD *)(a3 + 36);
      v14 = v9;
      v15 = *(_OWORD *)(a3 + 68);
      v16 = v7;
      a2[62] = BYTE12(v7);
      phOsalNfc_MemCopy();
      phOsalNfc_MemCopy();
      phOsalNfc_MemCopy();
      v10 = BYTE14(v16);
      if (BYTE14(v16) == 12)
        a2[11] = (BYTE10(v17) >> 4) | (16 * BYTE10(v17));
      a2[12] = v10;
      a2[61] = BYTE11(v16);
      phOsalNfc_MemCopy();
      v6 = 0;
    }
  }
  else
  {
    v6 = 1;
    sub_219850628(2, a1, 4u, 1u, (uint64_t)"Invalid input parameter!");
  }
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevB");
  return v6;
}

uint64_t sub_2198D8454(unsigned int *a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevFelica");
  if (a2)
  {
    *(_BYTE *)(a2 + 10) = 8;
    phOsalNfc_MemCopy();
    phOsalNfc_MemCopy();
    phOsalNfc_MemCopy();
    v4 = 0;
  }
  else
  {
    v4 = 255;
  }
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MapRemoteDevFelica");
  return v4;
}

uint64_t sub_2198D8570(unsigned int *a1, unsigned int a2, unsigned int *a3)
{
  uint64_t v6;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MapBitRate");
  if (a3)
  {
    v6 = 0;
    if (a2 <= 5)
      *a3 = a2;
  }
  else
  {
    v6 = 1;
  }
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MapBitRate");
  return v6;
}

uint64_t sub_2198D85FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VerifyResponse");
  if (a1)
  {
    v6 = 1;
    if (a2 && a3)
    {
      if ((*(_DWORD *)(a3 + 4) & 0xFFFFFFFE) == 0x12)
      {
        if (*(_DWORD *)(a2 + 8))
          v6 = 0;
        else
          v6 = 44;
      }
      else if ((*(unsigned __int8 *)(a1 + 1481) | 2) == 0xA2)
      {
        v7 = *(_BYTE **)a2;
        if (*(_QWORD *)a2 && *v7 == 10 && *(_DWORD *)(a2 + 8) == 1)
        {
          v6 = 0;
          *(_DWORD *)(a2 + 8) = 0;
          *v7 = 0;
        }
        else
        {
          v6 = 255;
        }
      }
      else
      {
        v6 = 0;
      }
    }
    *(_BYTE *)(a1 + 1481) = -1;
  }
  else
  {
    v6 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VerifyResponse");
  return v6;
}

uint64_t sub_2198D86F4(uint64_t a1, uint64_t a2, char *a3)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReActivateComplete");
  if (!a1)
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Lower layer has returned Null LibNfc context");
    goto LABEL_11;
  }
  *(_BYTE *)(a1 + 1472) = 0;
  if (!a3
    || a2 - 81 <= 0x3E
    && ((1 << (a2 - 81)) & 0x4000010000000001) != 0)
  {
    if ((_DWORD)a2)
      goto LABEL_6;
LABEL_10:
    *(_BYTE *)(a1 + 1483) = 0;
    goto LABEL_11;
  }
  if ((_BYTE)a2)
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Buffer passed by Lower layer is NULL");
    a2 = 255;
    goto LABEL_6;
  }
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Lower layer has returned NFCSTATUS_SUCCESS");
  if (!(_DWORD)a2)
    goto LABEL_10;
LABEL_6:
  *(_BYTE *)(a1 + 1483) = 1;
LABEL_11:
  sub_2198BF078(a1, a2, a3);
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReActivateComplete");
  return a2;
}

uint64_t sub_2198D8828(uint64_t a1)
{
  unsigned int *v2;
  uint64_t Memory;
  unsigned int v4;
  unint64_t v5;
  unsigned __int16 v6;
  unsigned __int8 v7;
  unsigned int v8;
  unsigned __int8 v9;
  uint64_t v10;
  unsigned int *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StateDiscoveredEntry");
  if (!a1)
    goto LABEL_22;
  if (!*(_BYTE *)(a1 + 714))
  {
    v6 = 0;
    *(_BYTE *)(a1 + 714) = 0;
    goto LABEL_25;
  }
  v2 = *(unsigned int **)(a1 + 808);
  *(_BYTE *)(a1 + 717) = 3;
  if (*(_QWORD *)(a1 + 1352))
  {
    phOsalNfc_FreeMemory();
    *(_QWORD *)(a1 + 1456) = 0;
    *(_BYTE *)(a1 + 717) = 3;
  }
  Memory = phOsalNfc_GetMemory();
  *(_QWORD *)(a1 + 1352) = Memory;
  if (!Memory)
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory, Insufficient Resources");
    v6 = 12;
    goto LABEL_25;
  }
  phOsalNfc_SetMemory();
  if (v2 && (v4 = *(unsigned __int8 *)(a1 + 714), *(_BYTE *)(a1 + 714)))
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = *v2;
      if (*v2)
      {
        v9 = 0;
        v10 = *(_QWORD *)(a1 + 8 * v5 + 728);
        while (1)
        {
          v11 = &v2[2 * v9];
          v13 = *((_QWORD *)v11 + 1);
          v12 = (uint64_t *)(v11 + 2);
          if (v10 == v13)
            break;
          if (v8 <= ++v9)
            goto LABEL_20;
        }
        if (v8 == 1)
          *(_QWORD *)(a1 + 1464) = v10;
        v14 = *(_QWORD *)(a1 + 1352) + 80 * v7;
        v15 = a1 + 16 * v7;
        *(int64x2_t *)(v15 + 824) = vdupq_n_s64(v14);
        *(_QWORD *)(v15 + 1192) = v14;
        *(_QWORD *)(v15 + 1200) = *v12;
        *(_BYTE *)(a1 + 1442) = 0;
        if (sub_2198D7B28(a1, v14, *v12))
        {
          v6 = 255;
        }
        else
        {
          ++v7;
          v6 = 0;
        }
        v4 = *(unsigned __int8 *)(a1 + 714);
      }
LABEL_20:
      ++v5;
    }
    while (v5 < v4);
  }
  else
  {
LABEL_22:
    v6 = 0;
  }
LABEL_25:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StateDiscoveredEntry");
  return v6;
}

uint64_t sub_2198D89F4(uint64_t a1, _BYTE *a2, _BYTE *a3)
{
  uint64_t result;
  unsigned int v5;
  unsigned int v7;
  int v8;

  result = 1;
  if (a1 && a2 && a3)
  {
    v5 = *(_DWORD *)(a1 + 20);
    if (v5 <= 0xC && ((1 << v5) & 0x1C6F) != 0)
      goto LABEL_8;
    v7 = v5 - 112;
    if (v7 <= 0x15)
    {
      v8 = 1 << v7;
      if ((v8 & 0x2F0000) != 0)
      {
        *a2 = 0;
        if (*(_DWORD *)(a1 + 12) == 3)
        {
          result = 0;
          *a3 = 0;
        }
        else
        {
          result = 0;
          *a3 = 1;
        }
      }
      else if ((v8 & 5) != 0)
      {
LABEL_8:
        *a2 = 1;
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_2198D8A94(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(_QWORD, uint64_t, _QWORD, uint64_t);
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
  if (!a1)
    goto LABEL_21;
  if (!*(_QWORD *)(a1 + 6136))
    goto LABEL_88;
  if (*(_QWORD *)(a1 + 6152))
  {
    v2 = *(_QWORD *)(a1 + 6160);
    sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 15, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
    v3 = *(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(a1 + 6152);
LABEL_5:
    v4 = *(_QWORD *)(a1 + 19360);
    v5 = v2;
LABEL_6:
    v3(v4, v5, 0, 0, 145);
    goto LABEL_21;
  }
  if (*(_QWORD *)(a1 + 6216))
  {
    v6 = *(_QWORD *)(a1 + 6224);
    sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 130, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
    v7 = *(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(a1 + 6216);
LABEL_10:
    v7(*(_QWORD *)(a1 + 19360), v6, 0, 145);
    goto LABEL_21;
  }
  if (!*(_QWORD *)(a1 + 6248))
  {
    if (*(_QWORD *)(a1 + 6424))
    {
      v8 = *(_QWORD *)(a1 + 6432);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 22, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6424);
      goto LABEL_18;
    }
    if (*(_QWORD *)(a1 + 6440))
    {
      v8 = *(_QWORD *)(a1 + 6448);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 37, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6440);
      goto LABEL_18;
    }
    if (*(_QWORD *)(a1 + 6184))
    {
      v2 = *(_QWORD *)(a1 + 6192);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 17, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v3 = *(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(a1 + 6184);
      goto LABEL_5;
    }
    if (*(_QWORD *)(a1 + 6168))
    {
      v2 = *(_QWORD *)(a1 + 6176);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 16, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v3 = *(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(a1 + 6168);
      goto LABEL_5;
    }
    if (*(_QWORD *)(a1 + 6680))
    {
      v14 = *(_QWORD *)(a1 + 6688);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 134, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(a1 + 6680))(*(_QWORD *)(a1 + 19360), v14, **(_QWORD **)(a1 + 512), 127, 145);
      goto LABEL_21;
    }
    if (*(_QWORD *)(a1 + 6536))
    {
      v15 = (_QWORD *)(a1 + 6536);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 126, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1 + 6536))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6544), 0, 145);
LABEL_40:
      v13 = 0;
      *v15 = 0;
      v15[1] = 0;
      goto LABEL_89;
    }
    if (*(_QWORD *)(a1 + 6584))
    {
      v15 = (_QWORD *)(a1 + 6584);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 46, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, uint64_t))(a1 + 6584))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6592), 145);
      goto LABEL_40;
    }
    if (*(_QWORD *)(a1 + 6104))
    {
      v15 = (_QWORD *)(a1 + 6104);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 42, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, uint64_t))(a1 + 6104))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6112), 145);
      goto LABEL_40;
    }
    if (*(_QWORD *)(a1 + 6600))
    {
      v15 = (_QWORD *)(a1 + 6600);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 48, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, uint64_t))(a1 + 6600))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6608), 145);
      goto LABEL_40;
    }
    if (*(_QWORD *)(a1 + 6616))
    {
      v15 = (_QWORD *)(a1 + 6616);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 49, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, uint64_t))(a1 + 6616))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6624), 145);
      goto LABEL_40;
    }
    if (*(_QWORD *)(a1 + 6552))
    {
      v15 = (_QWORD *)(a1 + 6552);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 4, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, uint64_t))(a1 + 6552))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6560), 145);
      goto LABEL_40;
    }
    if (*(_QWORD *)(a1 + 6296))
    {
      v15 = (_QWORD *)(a1 + 6296);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 124, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(a1 + 6296))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6304), 0, 0, 255, 145);
      goto LABEL_40;
    }
    if (*(_QWORD *)(a1 + 6312))
    {
      v15 = (_QWORD *)(a1 + 6312);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 125, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(a1 + 6312))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6320), 0, 0, 145);
      goto LABEL_40;
    }
    if (*(_QWORD *)(a1 + 6344))
    {
      v15 = (_QWORD *)(a1 + 6344);
      sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"CntDiscntDisvrychkprsn_Cb :EvtWtxCb");
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(a1 + 6344))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6352), 0, 0, 145);
      goto LABEL_40;
    }
    if (*(_QWORD *)(a1 + 6456))
    {
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 40, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, uint64_t))(a1 + 6456))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6464), 145);
      v13 = 0;
      *(_QWORD *)(a1 + 6344) = 0;
      *(_QWORD *)(a1 + 6464) = 0;
      goto LABEL_89;
    }
    if (*(_QWORD *)(a1 + 6040))
    {
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 47, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1 + 6040))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6048), 0, 145);
      goto LABEL_21;
    }
    if (*(_QWORD *)(a1 + 6088))
    {
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 43, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6088);
      v10 = *(_QWORD *)(a1 + 19360);
      v11 = *(_QWORD *)(a1 + 6096);
      goto LABEL_19;
    }
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6120);
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 19360);
      v11 = *(_QWORD *)(a1 + 6128);
      goto LABEL_19;
    }
    if (*(_QWORD *)(a1 + 6264))
    {
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 23, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(a1 + 6264))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6272), 0, 0, 145);
      goto LABEL_21;
    }
    if (*(_QWORD *)(a1 + 6280))
    {
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 17, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))(a1 + 6280))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6192), 0, 0, 145);
      goto LABEL_21;
    }
    v3 = *(void (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(a1 + 6328);
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 19360);
      v5 = *(_QWORD *)(a1 + 6336);
      goto LABEL_6;
    }
    if (*(_QWORD *)(a1 + 6360))
    {
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 24, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6360);
      v10 = *(_QWORD *)(a1 + 19360);
      v11 = *(_QWORD *)(a1 + 6368);
      goto LABEL_19;
    }
    if (*(_QWORD *)(a1 + 6376))
    {
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 25, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6376);
      v10 = *(_QWORD *)(a1 + 19360);
      v11 = *(_QWORD *)(a1 + 6384);
      goto LABEL_19;
    }
    if (*(_QWORD *)(a1 + 6392))
    {
      *(_BYTE *)(a1 + 19372) = 0;
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 27, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6392);
      v10 = *(_QWORD *)(a1 + 19360);
      v11 = *(_QWORD *)(a1 + 6400);
      goto LABEL_19;
    }
    if (*(_QWORD *)(a1 + 6472))
    {
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 7, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 6472))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6480), 145, 0);
      goto LABEL_21;
    }
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6488);
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 19360);
      v11 = *(_QWORD *)(a1 + 6496);
      goto LABEL_19;
    }
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6504);
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 19360);
      v11 = *(_QWORD *)(a1 + 6512);
      v12 = 2;
      goto LABEL_20;
    }
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6520);
    if (v9)
    {
      v10 = *(_QWORD *)(a1 + 19360);
      v11 = *(_QWORD *)(a1 + 6528);
      goto LABEL_19;
    }
    if (*(_QWORD *)(a1 + 6632))
    {
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 5, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6632);
      v10 = *(_QWORD *)(a1 + 19360);
      v11 = *(_QWORD *)(a1 + 6640);
      goto LABEL_19;
    }
    if (*(_QWORD *)(a1 + 6648))
    {
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 50, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6648);
      v10 = *(_QWORD *)(a1 + 19360);
      v11 = *(_QWORD *)(a1 + 6656);
      goto LABEL_19;
    }
    if (*(_QWORD *)(a1 + 6664))
    {
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 51, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6664);
      v10 = *(_QWORD *)(a1 + 19360);
      v11 = *(_QWORD *)(a1 + 6672);
      goto LABEL_19;
    }
    if (*(_QWORD *)(a1 + 6776))
    {
      v6 = *(_QWORD *)(a1 + 6784);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 131, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v7 = *(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(a1 + 6776);
      goto LABEL_10;
    }
    if (*(_QWORD *)(a1 + 6792))
    {
      v8 = *(_QWORD *)(a1 + 6800);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 132, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6792);
      goto LABEL_18;
    }
    if (*(_QWORD *)(a1 + 6808))
    {
      v6 = *(_QWORD *)(a1 + 6816);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 44, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
      v7 = *(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(a1 + 6808);
      goto LABEL_10;
    }
LABEL_88:
    v13 = 255;
    goto LABEL_89;
  }
  v8 = *(_QWORD *)(a1 + 6256);
  sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 114, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 6248);
LABEL_18:
  v10 = *(_QWORD *)(a1 + 19360);
  v11 = v8;
LABEL_19:
  v12 = 145;
LABEL_20:
  v9(v10, v11, v12);
LABEL_21:
  v13 = 0;
LABEL_89:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Pending_CntDiscntDisvrychkprsn_Cb");
  return v13;
}

uint64_t sub_2198D9444(uint64_t a1)
{
  char v2;
  uint64_t (**v3)();
  uint64_t (*v4)();
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Init2InitEnDisMultiTag");
  if (a1)
  {
    *(_QWORD *)(a1 + 2912) = &qword_2550A3358;
    *(_BYTE *)(a1 + 2904) = 0;
    *(_BYTE *)(a1 + 2906) = 0;
    v2 = qword_2550A3358;
    if (qword_2550A3358)
    {
      v2 = 0;
      v3 = off_2550A3368;
      do
      {
        ++v2;
        v4 = *v3;
        v3 += 2;
      }
      while (v4);
    }
    *(_BYTE *)(a1 + 2905) = v2;
    v5 = sub_2198655FC(a1, 0, 0);
  }
  else
  {
    v5 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Init2InitEnDisMultiTag");
  return v5;
}

uint64_t sub_2198D94F8(unsigned int *a1, int *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_Init2Discovery");
  v6 = 1;
  if (a1 && a2 && a3)
  {
    v7 = *a2;
    a1[357] = *a2;
    v6 = sub_2198D64F8((uint64_t)a1, v7, a3);
  }
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_Init2Discovery");
  return v6;
}

uint64_t sub_2198D9588(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Actv2Discovery");
  v6 = 1;
  if (a1 && a2 && a3)
  {
    if (*(_BYTE *)(a1 + 697) == 1 && !sub_2198D0DC0(*(_QWORD *)(a1 + 19360), 1))
    {
      *(_QWORD *)(a1 + 512) = a1 + 392;
      *(_DWORD *)(a1 + 524) = 0;
      sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeTransEvent");
      sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeTransEvent");
      sub_2198D1B2C(*(_QWORD *)(a1 + 19360), 167, 1, 0, 0);
      *(_BYTE *)(a1 + 697) = 0;
    }
    *(_BYTE *)(a1 + 1424) = 0;
    v7 = *a2;
    *(_DWORD *)(a1 + 1432) = *a2;
    v6 = sub_2198D6650(a1, v7, a3);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Actv2Discovery");
  return v6;
}

uint64_t sub_2198D9698(uint64_t a1, int *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  char v10;
  uint64_t (**v11)();
  uint64_t (*v12)();
  uint64_t (**v13)();
  uint64_t (*v14)();
  uint64_t (**v15)();
  uint64_t (*v16)();
  unsigned int v17;

  v17 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Actv2Init");
  if (a1 && a2 && a3)
  {
    v6 = 0;
    if (*(_DWORD *)(a1 + 984))
      v7 = a1 + 1000;
    else
      v7 = a3;
    v8 = *a2;
    *(_DWORD *)(a1 + 1436) = *a2;
    if (v8 != 2 && v8 != 7)
    {
      if (*(_BYTE *)(a1 + 19355) == 1)
      {
        *(_WORD *)(a1 + 19354) = 1;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Stop Discovery priority raised");
        v6 = 13;
      }
      else
      {
        if (*(_BYTE *)(a1 + 2936) == 1)
        {
          *(_QWORD *)(a1 + 2912) = &qword_2550A3468;
          *(_BYTE *)(a1 + 2904) = 0;
          *(_BYTE *)(a1 + 2906) = 0;
          v10 = qword_2550A3468;
          if (qword_2550A3468)
          {
            v10 = 0;
            v11 = off_2550A3478;
            do
            {
              ++v10;
              v12 = *v11;
              v11 += 2;
            }
            while (v12);
          }
        }
        else if (*(_DWORD *)(v7 + 88) == 1)
        {
          *(_QWORD *)(a1 + 2912) = &qword_2550A3548;
          *(_BYTE *)(a1 + 2904) = 0;
          *(_BYTE *)(a1 + 2906) = 0;
          v10 = qword_2550A3548;
          if (qword_2550A3548)
          {
            v10 = 0;
            v13 = off_2550A3558;
            do
            {
              ++v10;
              v14 = *v13;
              v13 += 2;
            }
            while (v14);
          }
        }
        else
        {
          if (*(_BYTE *)(a1 + 697) == 1 && !sub_2198D0DC0(*(_QWORD *)(a1 + 19360), 1))
          {
            *(_QWORD *)(a1 + 512) = a1 + 392;
            *(_DWORD *)(a1 + 524) = 0;
            sub_2198E03D8((unsigned int *)a1, 1, 0, (int *)&v17);
            sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v17, 1, 0, 0);
            *(_BYTE *)(a1 + 697) = 0;
          }
          *(_BYTE *)(a1 + 1424) = 0;
          *(_QWORD *)(a1 + 2912) = off_2550A3648;
          *(_BYTE *)(a1 + 2904) = 0;
          *(_BYTE *)(a1 + 2906) = 0;
          v10 = (char)off_2550A3648[0];
          if (off_2550A3648[0])
          {
            v10 = 0;
            v15 = off_2550A3658;
            do
            {
              ++v10;
              v16 = *v15;
              v15 += 2;
            }
            while (v16);
          }
        }
        *(_BYTE *)(a1 + 2905) = v10;
        v6 = sub_2198655FC(a1, 0, 0);
      }
    }
  }
  else
  {
    v6 = 1;
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid LibNfc context passed or Invalid parameter");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Actv2Init");
  return v6;
}

uint64_t sub_2198D98E4(unsigned int *a1, _DWORD *a2)
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v9;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_DummyInit");
  if (a1 && a2)
  {
    if (*a2)
    {
      v4 = "DummyInit: No previous configuration available, discovery failed!";
    }
    else
    {
      v6 = phOsalNfc_Timer_Create();
      if (v6)
        v7 = v6 == 0xFFFFFFFFFFFFLL;
      else
        v7 = 1;
      if (!v7)
      {
        v9 = v6;
        if (!phOsalNfc_Timer_Start())
        {
          sub_21988629C(1, a1 + 4842, v9, 4u, 4u, (uint64_t)"phLibNfc_DummyInit");
          sub_219850628(1, a1 + 4842, 4u, 4u, (uint64_t)"DummyInit: Timer started");
          v5 = 13;
          goto LABEL_14;
        }
        sub_219850628(1, a1 + 4842, 4u, 1u, (uint64_t)"DummyInit: Failed start timer");
        phOsalNfc_Timer_Delete();
        goto LABEL_13;
      }
      v4 = "DummyInit: Failed to create Timer!";
    }
    sub_219850628(1, a1 + 4842, 4u, 1u, (uint64_t)v4);
LABEL_13:
    v5 = 255;
    goto LABEL_14;
  }
  v5 = 1;
  sub_219850628(2, a1, 4u, 1u, (uint64_t)"Invalid LibNfc context passed or Invalid Parameter");
LABEL_14:
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_DummyInit");
  return v5;
}

uint64_t sub_2198D9A68(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;

  sub_21988629C(2, (unsigned int *)a2, a1, 4u, 4u, (uint64_t)"phLibNfc_DummyInitTimerCb");
  sub_219850718(2, (unsigned int *)a2, 4u, 5u, (uint64_t)"phLibNfc_DummyInitTimerCb");
  if (!a2)
    goto LABEL_6;
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = *((_QWORD *)&unk_253E46700 + 14 * v4 + 2);
    if ((v3 & 1) != 0)
      break;
    v3 = 1;
    v4 = 1;
  }
  while (v5 != a2);
  if (v5 == a2)
  {
    phOsalNfc_Timer_Stop();
    phOsalNfc_Timer_Delete();
    sub_219850628(1, (unsigned int *)(a2 + 19368), 4u, 4u, (uint64_t)"DummyInitTimerCb: Timer stopped and deleted");
    sub_2198D1B2C(*(_QWORD *)(a2 + 19360), 145, 0, 0, 0);
  }
  else
  {
LABEL_6:
    sub_219850628(2, (unsigned int *)a2, 4u, 1u, (uint64_t)"DummyInitTimerCb: Invalid 'pLibCtx', can not invoke upper layer call back");
  }
  return sub_219850808(2, (unsigned int *)a2, 4u, 5u, (uint64_t)"phLibNfc_DummyInitTimerCb");
}

uint64_t sub_2198D9B9C(uint64_t a1, int a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
  uint64_t v9;
  int v10;
  int v11;
  uint64_t *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int *v15;
  const char *v16;
  int v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(_QWORD, uint64_t, _QWORD, uint64_t);
  uint64_t v25;
  void (*v26)(_QWORD, uint64_t, uint64_t);
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  const char *v36;
  const char *v37;
  int v38;
  int v39;
  int v40;
  int v41;
  BOOL v42;
  unsigned int v43;
  int v44;
  char v46;
  void (*v47)(_QWORD, uint64_t, uint64_t);
  uint64_t v48;
  void (*v50)(_QWORD, uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t v51;
  uint64_t v52;
  void (*v53)(_QWORD, uint64_t, uint64_t);
  uint64_t v54;
  unsigned int *v55;
  uint64_t v56;
  void (*v57)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;

  v60 = 0;
  v61 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Process_ConfigDisc");
  v9 = 255;
  if (!a1 || !a4 || !a5)
    goto LABEL_132;
  if (*a4 == 3)
  {
    v10 = 0;
    goto LABEL_8;
  }
  if (*a4 == 1)
  {
    v10 = 0;
    a5 = a1 + 1000;
LABEL_8:
    v11 = 1;
    goto LABEL_10;
  }
  v11 = 0;
  v10 = 1;
LABEL_10:
  v12 = (uint64_t *)(a1 + 1456);
  if (!sub_219902600(*(unsigned int **)(a1 + 3040), *(_QWORD *)(a1 + 1456)))
  {
    if (!*v12)
      goto LABEL_12;
    v61 = *v12;
    sub_2198DA75C(a1);
    v17 = sub_2198BE4E4(a1, &v60, &v61, 0);
    if (*(_DWORD *)(v61 + 4) == 23 && !v17)
    {
      v15 = (unsigned int *)(a1 + 19368);
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"P2P Target detected as remote device type, try priority discovery");
      if (!*(_QWORD *)(a1 + 6184))
      {
        v35 = "In P2P Initiator mode: No P2P Transceive call back found";
LABEL_43:
        sub_219850628(1, v15, 4u, 4u, (uint64_t)v35);
        goto LABEL_44;
      }
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Found pClientTranscvCb as valid");
      v18 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))(a1 + 6184);
      v19 = *(_QWORD *)(a1 + 6192);
      *(_QWORD *)(a1 + 6184) = 0;
      *(_QWORD *)(a1 + 6192) = 0;
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Invoking pClientTranscvCb...");
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 17, (uint64_t)"phLibNfc_Process_ConfigDisc");
      v20 = *(_QWORD *)(a1 + 19360);
      v21 = v60;
      v22 = v19;
      v23 = 146;
      goto LABEL_27;
    }
    if (!*(_QWORD *)(a1 + 6184) || v17)
    {
      v28 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))(a1 + 6168);
      if (!v28)
      {
        if (a2 == 137 && *(_QWORD *)(a1 + 6424) && !v17)
        {
          sub_2199002B0(*(_QWORD *)(a1 + 3040), 1);
          v47 = *(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 6424);
          v48 = *(_QWORD *)(a1 + 6432);
          *(_QWORD *)(a1 + 6424) = 0;
          *(_QWORD *)(a1 + 6432) = 0;
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Aborting Presence Check");
          sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 22, (uint64_t)"phLibNfc_Process_ConfigDisc");
          v47(*(_QWORD *)(a1 + 19360), v48, 150);
          goto LABEL_44;
        }
        if (a2 != 137 || !*(_QWORD *)(a1 + 6152) || v17)
        {
          if (a2 == 137 && *(_QWORD *)(a1 + 6264) && !v17)
          {
            sub_2199002B0(*(_QWORD *)(a1 + 3040), 1);
            sub_21987B920(a1);
            v50 = *(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, uint64_t))(a1 + 6264);
            v51 = *(_QWORD *)(a1 + 6272);
            *(_QWORD *)(a1 + 6264) = 0;
            *(_QWORD *)(a1 + 6272) = 0;
            sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Aborting Check NDEF");
            sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 23, (uint64_t)"phLibNfc_Process_ConfigDisc");
            v50(*(_QWORD *)(a1 + 19360), v51, 0, 0, 150);
          }
          else
          {
            if (a2 == 137 && *(_QWORD *)(a1 + 6360) && !v17)
            {
              sub_2199002B0(*(_QWORD *)(a1 + 3040), 1);
              sub_21987B920(a1);
              v53 = *(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 6360);
              v54 = *(_QWORD *)(a1 + 6368);
              *(_QWORD *)(a1 + 6360) = 0;
              *(_QWORD *)(a1 + 6368) = 0;
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Aborting Read NDEF");
              v55 = (unsigned int *)(a1 + 19368);
              v56 = 24;
            }
            else
            {
              if (a2 != 137 || !*(_QWORD *)(a1 + 6376) || v17)
              {
                if (*(_QWORD *)(a1 + 6200) && !v17)
                {
                  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Internal Remote Device Transceive inprogress");
                  v57 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, uint64_t))(a1 + 6200);
                  v58 = *(_QWORD *)(a1 + 6208);
                  *(_QWORD *)(a1 + 6200) = 0;
                  *(_QWORD *)(a1 + 6208) = 0;
                  sub_2199002B0(*(_QWORD *)(a1 + 3040), 1);
                  sub_21987B920(a1);
                  if (a2 == 137)
                    v59 = 150;
                  else
                    v59 = 146;
                  v57(*(_QWORD *)(a1 + 19360), v58, v60, 0, v59);
                }
                goto LABEL_44;
              }
              sub_2199002B0(*(_QWORD *)(a1 + 3040), 1);
              sub_21987B920(a1);
              v53 = *(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 6376);
              v54 = *(_QWORD *)(a1 + 6384);
              *(_QWORD *)(a1 + 6376) = 0;
              *(_QWORD *)(a1 + 6384) = 0;
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Aborting Write NDEF");
              v55 = (unsigned int *)(a1 + 19368);
              v56 = 25;
            }
            sub_219885F70(1, v55, 4u, v56, (uint64_t)"phLibNfc_Process_ConfigDisc");
            v53(*(_QWORD *)(a1 + 19360), v54, 150);
          }
          if (*(_QWORD *)(a1 + 6200))
            *(_QWORD *)(a1 + 6200) = 0;
          goto LABEL_44;
        }
        if ((**(_BYTE **)(a1 + 808) & 0xFE) != 0 && *(_BYTE *)(a1 + 19352) == 1)
        {
          sub_2199002B0(*(_QWORD *)(a1 + 3040), 0);
          *(_BYTE *)(a1 + 19352) = 0;
        }
        else
        {
          sub_2199002B0(*(_QWORD *)(a1 + 3040), 1);
        }
        v18 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))(a1 + 6152);
        v52 = *(_QWORD *)(a1 + 6160);
        *(_QWORD *)(a1 + 6152) = 0;
        *(_QWORD *)(a1 + 6160) = 0;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Aborting Connect");
        sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 15, (uint64_t)"phLibNfc_Process_ConfigDisc");
        v20 = *(_QWORD *)(a1 + 19360);
        v22 = v52;
        v21 = 0;
        v23 = 150;
LABEL_27:
        v18(v20, v22, v21, 0, v23);
        goto LABEL_44;
      }
      v34 = *(_QWORD *)(a1 + 6176);
      *(_QWORD *)(a1 + 6168) = 0;
      *(_QWORD *)(a1 + 6176) = 0;
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Found pClientNfcIpRxCb as valid, invoking the same");
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 16, (uint64_t)"phLibNfc_Process_ConfigDisc");
      v30 = *(_QWORD *)(a1 + 19360);
      v32 = v34;
      v31 = 0;
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Remote Device Transceive inprogress");
      v28 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))(a1 + 6184);
      v29 = *(_QWORD *)(a1 + 6192);
      *(_QWORD *)(a1 + 6184) = 0;
      *(_QWORD *)(a1 + 6192) = 0;
      sub_2199002B0(*(_QWORD *)(a1 + 3040), 1);
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 17, (uint64_t)"phLibNfc_Process_ConfigDisc");
      v30 = *(_QWORD *)(a1 + 19360);
      v31 = v60;
      v32 = v29;
      if (a2 == 137)
      {
        v33 = 150;
LABEL_40:
        v28(v30, v32, v31, 0, v33);
        goto LABEL_44;
      }
    }
    v33 = 146;
    goto LABEL_40;
  }
  *v12 = 0;
  *(_QWORD *)(a1 + 1464) = 0;
LABEL_12:
  v13 = *(_QWORD *)(a1 + 1352);
  if (v13)
  {
    v14 = *(_DWORD *)(v13 + 4);
    if (v14 <= 0x1B && ((1 << v14) & 0x8000006) != 0)
    {
      v15 = (unsigned int *)(a1 + 19368);
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"P2P Initiator/HCE detected as remote device type, try priority discovery");
      if (sub_2198D23DC(*(_QWORD *)(a1 + 19360)) == 8
        && sub_2198D24A8(*(_QWORD *)(a1 + 19360)) == 9
        || sub_2198D23DC(*(_QWORD *)(a1 + 19360)) == 7
        && sub_2198D24A8(*(_QWORD *)(a1 + 19360)) == 9
        || sub_2198D23DC(*(_QWORD *)(a1 + 19360)) == 9
        && sub_2198D24A8(*(_QWORD *)(a1 + 19360)) == 8)
      {
        *(_WORD *)(a1 + 2904) = 0;
        *(_QWORD *)(a1 + 2912) = 0;
        v16 = "Discovery priority raised";
      }
      else
      {
        v16 = "No change in Discovery priority";
      }
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v16);
      sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EnablePriorityDiscovery");
      sub_2198DA75C(a1);
      v24 = *(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(a1 + 6760);
      if (v24)
      {
        v25 = *(_QWORD *)(a1 + 6768);
        *(_QWORD *)(a1 + 6760) = 0;
        *(_QWORD *)(a1 + 6768) = 0;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Found pClientNfcIpRxCb as valid, invoking the same");
        sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 30, (uint64_t)"phLibNfc_Process_ConfigDisc");
        v24(*(_QWORD *)(a1 + 19360), v25, 0, 146);
        goto LABEL_44;
      }
      v26 = *(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 6744);
      if (v26)
      {
        v27 = *(_QWORD *)(a1 + 6752);
        *(_QWORD *)(a1 + 6744) = 0;
        *(_QWORD *)(a1 + 6752) = 0;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Found pClientNfcIpTxCb as valid, invoking the same");
        sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 31, (uint64_t)"phLibNfc_Process_ConfigDisc");
        v26(*(_QWORD *)(a1 + 19360), v27, 146);
        goto LABEL_44;
      }
      v35 = "In P2P Target/HCE mode: No P2P Send/Receive call back found";
      goto LABEL_43;
    }
  }
LABEL_44:
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDiscoveryTypeAndMode");
  if ((*(_DWORD *)a5 & 0xB83DF) != 0)
  {
    v36 = "Poll is enabled";
LABEL_46:
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v36);
LABEL_47:
    sub_2198D23DC(*(_QWORD *)(a1 + 19360));
    goto LABEL_48;
  }
  v38 = *(unsigned __int8 *)(a5 + 6);
  if (*(_BYTE *)(a5 + 6))
  {
    if (v38 != 255)
    {
      v36 = "P2P Initiator is enabled";
      if (v38 == 15 || (v38 & 0x77777777) != 0)
        goto LABEL_46;
    }
  }
  if ((*(_DWORD *)a5 & 0x40000) != 0)
  {
    if (*(_BYTE *)(a5 + 7))
    {
      v41 = sub_2198D23DC(*(_QWORD *)(a1 + 19360));
      v42 = (a2 & 0xFFFFFFFE) == 0x88 && v41 == 4;
      if (v42)
        v43 = 136;
      else
        v43 = a2 & 0xFFFFFFFE;
      if (v42 && ((v10 ^ 1) & 1) == 0)
        goto LABEL_47;
      goto LABEL_105;
    }
    if (*(_BYTE *)(a5 + 8))
    {
      v36 = "P2P Target mode is enabled";
      goto LABEL_46;
    }
  }
  else
  {
    if (*(_BYTE *)(a1 + 314))
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Card emulation is enabled");
      v39 = 0;
    }
    else
    {
      v39 = 1;
    }
    if (!*(_BYTE *)(a5 + 9))
      v39 = 2;
    if (!v39)
      goto LABEL_47;
    if (v39 != 2)
    {
      v43 = a2 & 0xFFFFFFFE;
LABEL_105:
      v44 = sub_2198D23DC(*(_QWORD *)(a1 + 19360));
      if (v43 == 136 && v44 == 3)
        v46 = v10;
      else
        v46 = 1;
      if ((v46 & 1) == 0)
        goto LABEL_131;
      goto LABEL_48;
    }
  }
  if ((v10 & 1) != 0)
    goto LABEL_131;
LABEL_48:
  if (*(_BYTE *)(a1 + 2936) == 1)
  {
    if ((*(_BYTE *)(a5 + 80) & 3) == 2)
    {
      v37 = "LPCD Trace mode is wrongly enabled";
LABEL_130:
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v37);
LABEL_131:
      sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDiscoveryTypeAndMode");
      v9 = 1;
      goto LABEL_132;
    }
    if (*(_BYTE *)(a1 + 2937) != 1 && *(_BYTE *)(a1 + 2938) != 1 && *(_BYTE *)(a1 + 2944) != 1)
      goto LABEL_70;
  }
  else if (*(_BYTE *)(a1 + 2937) != 1 && *(_BYTE *)(a1 + 2938) != 1 && *(_BYTE *)(a1 + 2944) != 1)
  {
    if ((*(_BYTE *)(a5 + 12) & 1) != 0)
    {
      v37 = "SUICA is wrongly enabled";
      goto LABEL_130;
    }
    if ((*(_BYTE *)(a5 + 12) & 2) != 0)
    {
      v37 = "VAS Express is wrongly enabled";
      goto LABEL_130;
    }
    if ((*(_BYTE *)(a5 + 12) & 4) != 0)
    {
      v37 = "Generic-A Express is wrongly enabled";
      goto LABEL_130;
    }
    if ((*(_BYTE *)(a5 + 80) & 3) != 0)
    {
      v37 = "LPCD is wrongly enabled";
      goto LABEL_130;
    }
    goto LABEL_70;
  }
  if ((*(_BYTE *)(a5 + 80) & 2) != 0)
  {
    v37 = "LPCD Trace mode is not applicable for this platform";
    goto LABEL_130;
  }
LABEL_70:
  if (*(_BYTE *)(a5 + 84) == 1
    && (*(_DWORD *)a5 & 0x40000) != 0
    && !(*(_DWORD *)a5 & 0x80000 | *(_BYTE *)(a5 + 12) & 7))
  {
    v37 = "LPCD Assistance mode cannot be enabled without CE/express/RF Detect enabled";
    goto LABEL_130;
  }
  if (*(unsigned __int8 *)(a5 + 86) > 1u)
  {
    v37 = "Multi-Tag Enable Invalid Input Parameter";
    goto LABEL_130;
  }
  v40 = *(_DWORD *)(a5 + 88);
  if (v40 == 1 || v40 == 3)
  {
    if ((*(_DWORD *)a5 & 0xF83DF) != 0x40000 || !*(_BYTE *)(a5 + 7) || *(_BYTE *)(a5 + 9))
      goto LABEL_96;
  }
  else if (v40 == 2 && (*(_BYTE *)a5 & 3) == 0)
  {
LABEL_96:
    v37 = "eSE reader mode Invalid Input Parameter";
    goto LABEL_130;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDiscoveryTypeAndMode");
  v9 = sub_2199003D4(*(_QWORD *)(a1 + 3040));
  if (!(_DWORD)v9)
    *(_DWORD *)(a1 + 984) = v11;
LABEL_132:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Process_ConfigDisc");
  return v9;
}

uint64_t sub_2198DA75C(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 448);
    if (v2)
      v3 = v2 == 0xFFFFFFFFFFFFLL;
    else
      v3 = 1;
    if (!v3)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(_QWORD *)(a1 + 448) = 0;
    }
    *(_BYTE *)(a1 + 486) = 0;
    if (*(_QWORD *)(a1 + 488))
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 488) = 0;
      *(_DWORD *)(a1 + 496) = 0;
      *(_BYTE *)(a1 + 485) = 0;
    }
    sub_2199004B4(*(_QWORD *)(a1 + 3040), 0);
    v4 = 0;
  }
  else
  {
    v4 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AbortHceData");
  return v4;
}

uint64_t sub_2198DA808(_DWORD *a1)
{
  int v1;

  if (!a1)
    return 1;
  v1 = a1[3];
  if (v1 == 1)
  {
    if (a1[4] != 3 || a1[5] != 130)
      return 255;
    return 0;
  }
  if (v1 == 2 && a1[4] == 4 && (a1[5] & 0xFFFFFFFE) == 0x80)
    return 0;
  return 255;
}

uint64_t sub_2198DA870(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  const char *v9;
  int v10;
  unsigned int *v11;
  uint64_t v13;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_NtfRegRespCb");
  if (!a1)
  {
    v9 = "phLibNfc_NtfRegRespCb: Lower layer has returned invalid                                LibNfc context";
    v10 = 2;
    v11 = 0;
LABEL_21:
    sub_219850628(v10, v11, 4u, 1u, (uint64_t)v9);
    return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_NtfRegRespCb");
  }
  if (sub_2198D2574(*(_QWORD *)(a1 + 19360)) || !*a3)
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"Activated Notification received when SM is busy");
    if (*(_QWORD *)(a1 + 6248))
    {
      v7 = *(_QWORD **)(a1 + 3040);
      if (v7)
      {
        v8 = v7[423];
        if (v8)
        {
          v7[92] = v8;
          v7[93] = v7[464];
        }
      }
    }
    else
    {
      *(_BYTE *)(a1 + 19353) = 1;
    }
  }
  else
  {
    if ((_DWORD)a4 == 188)
    {
      sub_2198C0850(a1);
      sub_2198BCA8C(a1);
      *(_QWORD *)(a1 + 808) = *a3;
      sub_2198D1B2C(*(_QWORD *)(a1 + 19360), 147, 188, 0, 0);
      v11 = (unsigned int *)(a1 + 19368);
      v9 = "phLibNfc_NtfRegRespCb: Lower layer has returned NFCSTATUS_RF_ACTV_NTF_ERROR";
LABEL_20:
      v10 = 1;
      goto LABEL_21;
    }
    if ((_BYTE)a4 == 0xFF)
    {
      v11 = (unsigned int *)(a1 + 19368);
      v9 = "phLibNfc_NtfRegRespCb: Lower layer has returned NFCSTATUS_FAILED";
      goto LABEL_20;
    }
    if (!*(_QWORD *)(a1 + 1352)
      || sub_2198D23DC(*(_QWORD *)(a1 + 19360)) != 7
      || *(_DWORD *)(*(_QWORD *)(a1 + 1352) + 4) != 25
      || *(_BYTE *)(a1 + 1485))
    {
      *(_BYTE *)(a1 + 716) = 16;
      *(_BYTE *)(a1 + 1442) = 0;
      if (*(_BYTE *)(a1 + 1424) == 1)
      {
        v11 = (unsigned int *)(a1 + 19368);
        v9 = "phLibNfc_NtfRegRespCb: Ignoring HCE Activation in Exp + HCE mode ";
        goto LABEL_20;
      }
      if (!*(_BYTE *)(a1 + 1485))
      {
        sub_2198C0850(a1);
        sub_2198BCA8C(a1);
        *(_QWORD *)(a1 + 808) = *a3;
      }
      *(_BYTE *)(a1 + 486) = 0;
      if ((_DWORD)a4 == 40)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Lower layer has returned status NFCSTATUS_SINGLE_TAG_ACTIVATED");
        if (sub_2198D89F4(*(_QWORD *)(*a3 + 8), (_BYTE *)(a1 + 712), (_BYTE *)(a1 + 713)))
        {
          v13 = 143;
        }
        else if (sub_2198DA808(*(_DWORD **)(*a3 + 8)))
        {
          v13 = 147;
        }
        else
        {
          v13 = 148;
        }
      }
      else if ((_DWORD)a4 == 55)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Lower layer has returned status NFCSTATUS_MULTIPLE_TAGS");
        v13 = 147;
      }
      else
      {
        v13 = 235;
      }
      if (sub_2198DAB64(a1))
      {
        *(_BYTE *)(a1 + 19355) = 1;
        sub_2198D77C0(a1);
      }
      else
      {
        *(_BYTE *)(a1 + 19355) = 0;
        if (sub_2198D79DC(a1, v13, a4) != 13)
        {
          if (sub_2198DB378(a1))
            v13 = 147;
          else
            sub_2198DB3F0((unsigned int *)a1);
          sub_2198D752C(a1, v13, *a3, a4);
        }
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_NtfRegRespCb");
}

BOOL sub_2198DAB64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  unsigned __int8 v5;
  char v6;
  int v7;
  _BOOL8 v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int *v14;
  const char *v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  BOOL v22;
  int v23;
  int v24;
  unsigned int *v25;
  const char *v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 v30;
  uint64_t v31;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConnIsRfListnerRegisterd");
  v2 = *(_QWORD *)(a1 + 808);
  if (!v2)
  {
    v8 = 1;
    *(_BYTE *)(a1 + 715) = 1;
    goto LABEL_94;
  }
  if (!*(_DWORD *)v2 || (v4 = (uint64_t *)(v2 + 8), (v3 = *(_QWORD *)(v2 + 8)) == 0))
  {
    v8 = 1;
LABEL_87:
    *(_BYTE *)(a1 + 715) = 1;
    goto LABEL_94;
  }
  v5 = 0;
  v6 = 0;
  while (2)
  {
    v7 = *(_DWORD *)(v3 + 20);
    v8 = 1;
    switch(v7)
    {
      case 0:
      case 3:
      case 10:
      case 11:
      case 12:
        sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCAPoll");
        v9 = *v4;
        v10 = *(_DWORD *)(*v4 + 16);
        v11 = 255;
        switch(v10)
        {
          case 1:
            if (!sub_2198DB440((unsigned int *)a1, 22, 0))
            {
              v12 = 128;
              goto LABEL_53;
            }
            goto LABEL_73;
          case 2:
            goto LABEL_27;
          case 3:
            goto LABEL_73;
          case 4:
            v11 = 0;
            switch(*(_DWORD *)(v9 + 4))
            {
              case 3:
                if (sub_2198DB440((unsigned int *)a1, 11, 0))
                  goto LABEL_72;
                v12 = 4;
                goto LABEL_53;
              case 5:
                if (sub_2198DB440((unsigned int *)a1, 13, 0))
                  goto LABEL_72;
                v12 = 0x4000;
                goto LABEL_53;
              case 6:
                if (sub_2198DB440((unsigned int *)a1, 14, 0))
                  goto LABEL_72;
                v12 = 0x8000;
                goto LABEL_53;
              case 7:
                if (sub_2198DB440((unsigned int *)a1, 15, 0))
                  goto LABEL_72;
                v12 = 0x10000;
                goto LABEL_53;
              default:
                goto LABEL_73;
            }
            goto LABEL_73;
          case 5:
            if (sub_2198DB440((unsigned int *)a1, 26, 0))
              goto LABEL_73;
            v12 = 64;
            goto LABEL_53;
          default:
            if (v10 != 128)
              goto LABEL_73;
LABEL_27:
            v19 = *(unsigned __int8 *)(v9 + 96);
            v11 = sub_2198DB440((unsigned int *)a1, 16, *(unsigned __int8 *)(v9 + 96));
            if (v11)
              goto LABEL_73;
            if (v19 > 0x38)
              goto LABEL_31;
            if (((1 << v19) & 0x100010003030302) != 0)
              goto LABEL_33;
            if (!v19)
              goto LABEL_85;
LABEL_31:
            if ((v19 - 136) <= 0x30 && ((1 << (v19 + 120)) & 0x1000000010001) != 0)
            {
LABEL_33:
              v12 = 2;
LABEL_53:
              v11 = 0;
              *(_DWORD *)(a1 + 996) |= v12;
              goto LABEL_73;
            }
            if (*(_DWORD *)(*v4 + 16) == 2)
            {
LABEL_85:
              v12 = 1;
              goto LABEL_53;
            }
LABEL_72:
            v11 = 255;
LABEL_73:
            sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCAPoll");
            v22 = v11 == 0;
            v8 = v11 != 0;
            if (v22)
              v6 = 1;
            break;
        }
        goto LABEL_80;
      case 1:
        sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCBPoll");
        v20 = *v4;
        if (*(_DWORD *)(*v4 + 16) == 4
          && ((v21 = *(_DWORD *)(v20 + 12), v21 != 131) ? (v22 = v21 == 2) : (v22 = 1), v22))
        {
          if (sub_2198DB440((unsigned int *)a1, 19, 0))
            goto LABEL_58;
          v23 = 8;
        }
        else
        {
          if (*(_DWORD *)(v20 + 4) != 25 || sub_2198DB440((unsigned int *)a1, 17, 0))
          {
LABEL_58:
            v14 = (unsigned int *)a1;
            v15 = "phLibNfc_ChkRfListnerforNFCBPoll";
            goto LABEL_59;
          }
          v23 = 0x2000;
        }
        *(_DWORD *)(a1 + 996) |= v23;
        v25 = (unsigned int *)a1;
        v26 = "phLibNfc_ChkRfListnerforNFCBPoll";
LABEL_79:
        sub_219850808(2, v25, 4u, 5u, (uint64_t)v26);
        v8 = 0;
        v6 = 1;
        goto LABEL_80;
      case 2:
      case 5:
        sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCFPoll");
        v16 = *(_DWORD *)(*v4 + 16);
        if (v16 == 3)
        {
          if (!sub_2198DB440((unsigned int *)a1, 21, 0))
          {
            v17 = 32;
            goto LABEL_65;
          }
        }
        else if (v16 == 5 && !sub_2198DB440((unsigned int *)a1, 26, 0))
        {
          v17 = 64;
LABEL_65:
          *(_DWORD *)(a1 + 996) |= v17;
          v25 = (unsigned int *)a1;
          v26 = "phLibNfc_ChkRfListnerforNFCFPoll";
          goto LABEL_79;
        }
        v14 = (unsigned int *)a1;
        v15 = "phLibNfc_ChkRfListnerforNFCFPoll";
LABEL_59:
        sub_219850808(2, v14, 4u, 5u, (uint64_t)v15);
LABEL_80:
        ++v5;
        v27 = *(_DWORD *)v2;
        if (*(_DWORD *)v2 > v5)
        {
          v28 = v2 + 8 * v5;
          v29 = *(_QWORD *)(v28 + 8);
          v4 = (uint64_t *)(v28 + 8);
          v3 = v29;
          if (v29)
            continue;
        }
        if (!v6)
          goto LABEL_87;
        v30 = 0;
        if (v27)
        {
          do
          {
            v31 = v2 + 8 * v30;
            *(_QWORD *)(a1 + 712 + 8 * v30 + 16) = *(_QWORD *)(v31 + 8);
            *(_QWORD *)(a1 + 712 + 16 * v30++ + 488) = *(_QWORD *)(v31 + 8);
          }
          while (v27 > v30);
          *(_BYTE *)(a1 + 715) = 0;
        }
        v8 = 0;
        *(_BYTE *)(a1 + 714) = v30;
LABEL_94:
        sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConnIsRfListnerRegisterd");
        return v8;
      case 4:
      case 7:
      case 8:
      case 9:
        goto LABEL_80;
      case 6:
        sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCISO15693Poll");
        if (*(_DWORD *)(*v4 + 16) != 6 || sub_2198DB440((unsigned int *)a1, 23, 0))
        {
          sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCISO15693Poll");
          v8 = 1;
          goto LABEL_80;
        }
        *(_DWORD *)(a1 + 996) |= 0x10u;
        v25 = (unsigned int *)a1;
        v26 = "phLibNfc_ChkRfListnerforNFCISO15693Poll";
        goto LABEL_79;
      default:
        switch(v7)
        {
          case 128:
          case 131:
            sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCAListen");
            v13 = *(_DWORD *)(*v4 + 16);
            if (v13 == 4)
            {
              sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
              sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
            }
            else if (v13 != 5 || sub_2198DB440((unsigned int *)a1, 27, 0))
            {
              v14 = (unsigned int *)a1;
              v15 = "phLibNfc_ChkRfListnerforNFCAListen";
              goto LABEL_59;
            }
            *(_DWORD *)(a1 + 996) |= 0x40u;
            v25 = (unsigned int *)a1;
            v26 = "phLibNfc_ChkRfListnerforNFCAListen";
            goto LABEL_79;
          case 129:
            sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCBListen");
            v24 = *(_DWORD *)(*v4 + 16);
            v8 = v24 != 4;
            if (v24 == 4)
            {
              sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
              sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
              *(_DWORD *)(a1 + 996) |= 0x40u;
              v6 = 1;
            }
            v14 = (unsigned int *)a1;
            v15 = "phLibNfc_ChkRfListnerforNFCBListen";
            goto LABEL_59;
          case 130:
          case 133:
            sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforNFCFListen");
            v18 = *(_DWORD *)(*v4 + 16);
            if (v18 == 3)
            {
              sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
              sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
            }
            else if (v18 != 5 || sub_2198DB440((unsigned int *)a1, 27, 0))
            {
              v14 = (unsigned int *)a1;
              v15 = "phLibNfc_ChkRfListnerforNFCFListen";
              goto LABEL_59;
            }
            *(_DWORD *)(a1 + 996) |= 0x40u;
            v25 = (unsigned int *)a1;
            v26 = "phLibNfc_ChkRfListnerforNFCFListen";
            goto LABEL_79;
          case 132:
            goto LABEL_80;
          default:
            if (v7 != 112)
              goto LABEL_80;
            sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ChkRfListnerforKovioPoll");
            if (*(_DWORD *)(*v4 + 16) != 138 || sub_2198DB440((unsigned int *)a1, 25, 0))
            {
              v14 = (unsigned int *)a1;
              v15 = "phLibNfc_ChkRfListnerforKovioPoll";
              goto LABEL_59;
            }
            *(_DWORD *)(a1 + 996) |= 0x200u;
            v25 = (unsigned int *)a1;
            v26 = "phLibNfc_ChkRfListnerforKovioPoll";
            break;
        }
        goto LABEL_79;
    }
  }
}

BOOL sub_2198DB378(uint64_t a1)
{
  _BOOL8 v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConnChkDevType");
  v2 = *(_BYTE *)(a1 + 712) == 1 || *(unsigned __int8 *)(a1 + 714) > 1u;
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConnChkDevType");
  return v2;
}

uint64_t sub_2198DB3F0(unsigned int *a1)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ConnChkTgtType");
  return sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ConnChkTgtType");
}

uint64_t sub_2198DB440(unsigned int *a1, int a2, unsigned int a3)
{
  uint64_t v6;
  int v7;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
  v6 = 255;
  v7 = 128;
  switch(a2)
  {
    case 11:
      v7 = 4;
      goto LABEL_18;
    case 13:
      v7 = 0x4000;
      goto LABEL_18;
    case 14:
      v7 = 0x8000;
      goto LABEL_18;
    case 15:
      v7 = 0x10000;
      goto LABEL_18;
    case 16:
      if (a3 <= 0x38 && ((1 << a3) & 0x100010003030302) != 0
        || (v7 = 1, a3 - 136 <= 0x30) && ((1 << (a3 + 120)) & 0x1000000010001) != 0)
      {
        v7 = 2;
      }
      goto LABEL_18;
    case 17:
      v7 = 0x2000;
      goto LABEL_18;
    case 19:
      v7 = 8;
      goto LABEL_18;
    case 21:
      v7 = 32;
      goto LABEL_18;
    case 22:
      goto LABEL_18;
    case 23:
      v7 = 16;
      goto LABEL_18;
    case 24:
      v7 = 4096;
      goto LABEL_18;
    case 25:
      v7 = 512;
      goto LABEL_18;
    case 26:
    case 27:
      v7 = 64;
LABEL_18:
      if ((a1[248] & v7) != 0)
        v6 = 0;
      else
        v6 = 255;
      break;
    default:
      break;
  }
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_RfListnerRegisterd");
  return v6;
}

uint64_t sub_2198DB590(unsigned int *a1, uint64_t a2, uint64_t a3, unsigned int *a4, uint64_t a5)
{
  uint64_t v8;
  unsigned int v9;
  const char *v10;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_Process_Disconnect");
  v8 = 1;
  if (a1 && a4 && a5)
  {
    v12 = a5;
    v9 = *a4;
    if (sub_2198BE4E4((uint64_t)a1, &v12, &v13, 1))
    {
      v8 = 149;
      v10 = "Mapping of LibNfc RemoteDev Handle to NCI RemoteDev handle Failed";
    }
    else if (sub_21987B7E4(a1, v13))
    {
      v8 = 149;
      v10 = "Validation of  NCI RemoteDev handle Failed";
    }
    else
    {
      a1[246] = v9;
      if (v13)
      {
        v8 = 0;
        goto LABEL_9;
      }
      v8 = 1;
      v10 = "Remote Device Handle NULL!!!";
    }
    sub_219850628(1, a1 + 4842, 4u, 1u, (uint64_t)v10);
  }
LABEL_9:
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_Process_Disconnect");
  return v8;
}

uint64_t sub_2198DB69C(unsigned int *a1, unsigned int a2)
{
  char v4;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDeActType");
  if (a2 >= 8)
    v4 = 0;
  else
    v4 = 0x100010000010000uLL >> (8 * a2);
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ChkDeActType");
  return v4 & 1;
}

uint64_t sub_2198DB71C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = 0;
  v4 = a1;
  sub_219850718(0, (unsigned int *)&v4, 4u, 5u, (uint64_t)"phLibNfc_H_RetreiveConnectedHandle");
  sub_21988EDF4(v4, &v3);
  if (v3)
    v1 = *(_QWORD *)(v3 + 1456);
  else
    v1 = 0;
  sub_219850808(0, (unsigned int *)&v4, 4u, 5u, (uint64_t)"phLibNfc_H_RetreiveConnectedHandle");
  return v1;
}

uint64_t sub_2198DB79C(uint64_t a1, _BYTE *a2)
{
  uint64_t v3;
  int v4;
  uint64_t *v5;
  uint64_t v6;
  int v7;
  char v8;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = a1;
  sub_219850718(0, (unsigned int *)&v11, 4u, 5u, (uint64_t)"phLibNfc_H_GetFSC");
  sub_21988EDF4(v11, &v10);
  v3 = 255;
  if (a2 && v10)
  {
    v4 = sub_219902600(*(unsigned int **)(v10 + 3040), *(_QWORD *)(v10 + 1456));
    v5 = (uint64_t *)(v10 + 1456);
    if (v4)
    {
      *v5 = 0;
      v5[1] = 0;
      goto LABEL_12;
    }
    v6 = *v5;
    if (!v6)
      goto LABEL_12;
    v7 = *(_DWORD *)(v6 + 4);
    if ((v7 - 5) >= 3)
    {
      if (v7 == 16)
      {
        v3 = 0;
        v8 = *(_BYTE *)(v6 + 145);
        goto LABEL_11;
      }
      if (v7 != 3)
        goto LABEL_12;
    }
    v3 = 0;
    v8 = *(_BYTE *)(v6 + 106);
LABEL_11:
    *a2 = v8;
  }
LABEL_12:
  sub_219850718(0, (unsigned int *)&v11, 4u, 5u, (uint64_t)"phLibNfc_H_GetFSC");
  return v3;
}

uint64_t sub_2198DB87C(uint64_t a1, int a2)
{
  unsigned int v4;
  int v5;
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Recv4AResp");
  if (a1)
  {
    if (!a2 && (v4 = *(_DWORD *)(a1 + 3768)) != 0 && *(_QWORD *)(a1 + 3760))
    {
      if (v4 >= *(_DWORD *)(a1 + 4560))
        v5 = *(_DWORD *)(a1 + 4560);
      else
        v5 = *(_DWORD *)(a1 + 3768);
      phOsalNfc_MemCopy();
      v6 = 0;
      *(_DWORD *)(a1 + 4560) = v5;
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)" Data Receive Failed..");
      v6 = 255;
    }
    *(_WORD *)(a1 + 4592) = v6;
    if (*(_QWORD *)(a1 + 4600))
    {
      *(_DWORD *)(a1 + 4608) = 0;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)" Freeing Send Request Payload Buffer..");
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 4600) = 0;
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 4u, (uint64_t)" Invalid Context Param..");
    v6 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Recv4AResp");
  return v6;
}

uint64_t sub_2198DB9A8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v5;
  uint64_t Memory;
  __int128 v7;
  __int128 v8;

  v7 = 0u;
  v8 = 0u;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Send4AData");
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 4512);
    if (v2)
    {
      if (*(_DWORD *)(a1 + 4544))
      {
        phOsalNfc_SetMemory();
        LODWORD(v7) = 0;
        if (sub_219878C88((unsigned int *)a1, v2, (_BYTE *)((unint64_t)&v7 | 0xC)))
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)" Couldn't Get ConnId..");
          v3 = 255;
        }
        else
        {
          v5 = *(_DWORD *)(a1 + 4544);
          *(_DWORD *)(a1 + 4608) = 0;
          *(_QWORD *)(a1 + 4600) = 0;
          Memory = phOsalNfc_GetMemory();
          *(_QWORD *)(a1 + 4600) = Memory;
          if (Memory)
          {
            *(_DWORD *)(a1 + 4608) = v5;
            phOsalNfc_SetMemory();
            if (v5)
              phOsalNfc_MemCopy();
            sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)" 4A Payload created successfully..");
            *(_QWORD *)&v8 = *(_QWORD *)(a1 + 4600);
            DWORD2(v8) = *(_DWORD *)(a1 + 4608);
            v3 = sub_2198F2D0C(a1 + 888, (uint64_t)&v7, a1 + 3760, *(unsigned __int16 *)(a1 + 4526), (uint64_t)sub_2198F135C, a1);
            *(_WORD *)(a1 + 4526) = 0;
            if ((_DWORD)v3 != 13)
            {
              phOsalNfc_FreeMemory();
              *(_QWORD *)(a1 + 4600) = 0;
              *(_DWORD *)(a1 + 4608) = 0;
            }
          }
          else
          {
            sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)" Payload MemAlloc for Send request Failed..");
            v3 = 12;
          }
        }
      }
      else
      {
        v3 = 1;
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)" Invalid Length..");
      }
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)" Invalid Device..");
      v3 = 6;
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 4u, (uint64_t)" Invalid Context Param..");
    v3 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Send4AData");
  return v3;
}

uint64_t sub_2198DBBDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  unsigned int *v5;
  const char *v6;
  uint64_t v7;
  int v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciOpenAdmPipe");
  if (!a1)
  {
    v6 = "phLibNfc_HciOpenAdmPipe: Invalid LibNfc context passed!";
    v7 = 1;
    v8 = 2;
    v5 = 0;
    goto LABEL_9;
  }
  v2 = *(_QWORD *)(a1 + 464);
  v3 = *(_QWORD *)(a1 + 472);
  if (v2)
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {
    v5 = (unsigned int *)(a1 + 19368);
    v6 = "phLibNfc_HciOpenAdmPipe: Invalid Hci context passed!";
    v7 = 1;
    v8 = 1;
LABEL_9:
    sub_219850628(v8, v5, 4u, 1u, (uint64_t)v6);
    goto LABEL_18;
  }
  if (*(_BYTE *)(a1 + 2944) == 1 || *(_BYTE *)(a1 + 2936) == 1 && *(_BYTE *)(v3 + 1) == 1 && *(_DWORD *)(v3 + 4) == 1)
  {
    v7 = 0;
  }
  else if (sub_21988D350(v2, 1, (uint64_t)sub_219865DD0, a1) == 13)
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciOpenAdmPipe:ADM Open pipe Cmd Sent to NCI");
    v7 = 13;
  }
  else
  {
    sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HciOpenAdmPipe:Failed to create pipe for ADM, error");
    v7 = 255;
  }
LABEL_18:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciOpenAdmPipe");
  return v7;
}

uint64_t sub_2198DBD2C(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  const char *v5;
  int v6;
  unsigned int *v7;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciOpenAdmPipeProc");
  if (!a1)
  {
    v5 = "phLibNfc_HciOpenAdmPipeProc: Invalid LibNfc context received!";
    a2 = 1;
    v6 = 2;
    v7 = 0;
LABEL_7:
    sub_219850628(v6, v7, 4u, 1u, (uint64_t)v5);
    goto LABEL_9;
  }
  if (!*(_QWORD *)(a1 + 464))
  {
    v7 = (unsigned int *)(a1 + 19368);
    v5 = "phLibNfc_HciOpenAdmPipeProc: Invalid Hci context received!";
    a2 = 1;
    v6 = 1;
    goto LABEL_7;
  }
  v4 = (unsigned int *)(a1 + 19368);
  if ((_DWORD)a2)
  {
    sub_219850628(1, v4, 4u, 1u, (uint64_t)"phLibNfc_HciOpenAdmPipe: Failed to open ADM pipe");
    a2 = 255;
  }
  else
  {
    sub_219850628(1, v4, 4u, 4u, (uint64_t)"ADM pipe successfully opened");
  }
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciOpenAdmPipeProc");
  return a2;
}

uint64_t sub_2198DBE18(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  unsigned int *v4;
  const char *v5;
  uint64_t v6;
  int v7;
  __int16 v9;
  char v10;

  v10 = -1;
  v9 = -1;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciSetAllowList");
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 472);
    if (*(_QWORD *)(a1 + 464))
      v3 = v2 == 0;
    else
      v3 = 1;
    if (v3)
    {
      v4 = (unsigned int *)(a1 + 19368);
      v5 = "phLibNfc_HciSetAllowList: Invalid Hci context received!";
      v6 = 1;
    }
    else
    {
      if (*(_BYTE *)(a1 + 2944) == 1)
      {
LABEL_13:
        v6 = 0;
        goto LABEL_11;
      }
      if (*(_BYTE *)(a1 + 2936) == 1)
      {
        if (*(_BYTE *)(v2 + 1) == 1 && *(_DWORD *)(v2 + 4) == 1)
          goto LABEL_13;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciSetAllowList: Setting all secure elements to allow list");
        v9 = -32320;
        v10 = 2;
        LODWORD(v6) = 3;
      }
      else
      {
        if ((*(unsigned __int8 *)(a1 + 318) | 2) == 3)
        {
          LOBYTE(v9) = -64;
          v6 = 1;
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciSetAllowList: Setting eSE to Allow list");
        }
        else
        {
          v6 = 0;
        }
        if ((*(unsigned __int8 *)(a1 + 319) | 2) == 3)
        {
          *(_BYTE *)((unint64_t)&v9 | v6) = -127;
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciSetAllowList: Setting SE2 Se Allow list");
          v6 = (v6 + 1);
        }
        if ((*(unsigned __int8 *)(a1 + 317) | 2) == 3)
        {
          *((_BYTE *)&v9 + v6) = 2;
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciSetAllowList: Setting UICC to Allow list");
          LODWORD(v6) = v6 + 1;
        }
        else if (!(_DWORD)v6)
        {
          goto LABEL_11;
        }
      }
      v6 = sub_21988D124(*(_QWORD *)(a1 + 464), 3, 1, v6, (uint64_t)&v9, (uint64_t)sub_219865DD0, a1);
      v4 = (unsigned int *)(a1 + 19368);
      if ((_DWORD)v6 == 13)
      {
        sub_219850628(1, v4, 4u, 4u, (uint64_t)"phLibNfc_HciSetAllowList:Cmd Sent to NCI");
        goto LABEL_11;
      }
      v5 = "phLibNfc_HciSetAllowList:Failed to Send Cmd to NCI";
    }
    v7 = 1;
  }
  else
  {
    v5 = "phLibNfc_HciSetAllowList: Invalid LibNfc context received!";
    v6 = 1;
    v7 = 2;
    v4 = 0;
  }
  sub_219850628(v7, v4, 4u, 1u, (uint64_t)v5);
LABEL_11:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciSetAllowList");
  return v6;
}

uint64_t sub_2198DC088(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  const char *v5;
  int v6;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciSetAllowListProc");
  if (!a1)
  {
    v5 = "phLibNfc_HciSetAllowListProc: Invalid LibNfc context received!";
    a2 = 1;
    v6 = 2;
    v4 = 0;
LABEL_6:
    sub_219850628(v6, v4, 4u, 1u, (uint64_t)v5);
    goto LABEL_7;
  }
  v4 = (unsigned int *)(a1 + 19368);
  if (!*(_QWORD *)(a1 + 464))
  {
    v5 = "phLibNfc_HciSetAllowListProc: Invalid Hci context received!";
    a2 = 1;
    v6 = 1;
    goto LABEL_6;
  }
  sub_219850628(1, v4, 4u, 4u, (uint64_t)"phLibNfc_HciSetAllowListProc: Sucessfull");
LABEL_7:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciSetAllowListProc");
  return a2;
}

uint64_t sub_2198DC148(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  int v8;
  unsigned int *v9;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ModeSetHciNwk");
  if (!a1)
    goto LABEL_6;
  v2 = 0;
  v3 = 0;
  do
  {
    v4 = *((_QWORD *)&unk_253E46700 + 14 * v3 + 2);
    if ((v2 & 1) != 0)
      break;
    v2 = 1;
    v3 = 1;
  }
  while (v4 != a1);
  if (v4 == a1)
  {
    *(_BYTE *)(a1 + 2881) = 0;
    *(_DWORD *)(a1 + 544) = 0;
    v7 = *(_QWORD *)(a1 + 472);
    if ((*(unsigned __int8 *)(a1 + 318) | 2) == 3 && !*(_BYTE *)(a1 + 504))
    {
      *(_DWORD *)(a1 + 544) = 4000;
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Add Delay Wait for EoOP of p61");
    }
    if ((*(unsigned __int8 *)(a1 + 317) | 2) == 3 && !*(_BYTE *)(a1 + 505))
    {
      *(_DWORD *)(a1 + 544) += 2000;
      *(_BYTE *)(a1 + 2881) = 0;
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Add Delay Wait for EoOP of UICC");
    }
    if ((*(unsigned __int8 *)(a1 + 319) | 2) == 3 && !*(_BYTE *)(a1 + 506))
    {
      *(_DWORD *)(a1 + 544) += 2000;
      *(_BYTE *)(a1 + 2881) = 0;
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Add Delay Wait for EoOP of SE2");
    }
    if (*(_BYTE *)(v7 + 1) == 1 && *(_DWORD *)(v7 + 4) == 1)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ModeSetHciNwk:HCI Network is already Enabled");
      if (*(_DWORD *)(a1 + 544))
        sub_219865FEC(a1, 1);
      v5 = 0;
    }
    else
    {
      *(_DWORD *)(a1 + 524) = 0;
      v8 = sub_2198FC458(*(_QWORD *)(a1 + 3040), **(_QWORD **)(a1 + 512), 1u, (uint64_t)sub_219865DD0, a1);
      if (v8 == 13)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ModeSetHciNwk:Cmd Sent to lower layer");
        v5 = 13;
      }
      else
      {
        v9 = (unsigned int *)(a1 + 19368);
        if (v8 == 111)
        {
          sub_219850628(1, v9, 4u, 2u, (uint64_t)"phLibNfc_ModeSetHciNwk: NCI returned Busy status");
          v5 = 111;
        }
        else
        {
          sub_219851888(1, v9, 4u, 1u, (uint64_t)"phLibNfc_ModeSetHciNwk: Failed to set mode, error");
          v5 = 255;
        }
      }
    }
  }
  else
  {
LABEL_6:
    v5 = 1;
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid Context passed from lower layer!");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ModeSetHciNwk");
  return v5;
}

uint64_t sub_2198DC3D4(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ModeSetHciNwkProc");
  if (a1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 2);
      if ((v4 & 1) != 0)
        break;
      v4 = 1;
      v5 = 1;
    }
    while (v6 != a1);
    if (v6 == a1)
    {
      if ((_DWORD)a2)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ModeSetHciNwkProc: Set Mode Failed!");
      }
      else
      {
        if (*(_DWORD *)(a1 + 544))
          sub_219865FEC(a1, 1);
        *(_DWORD *)(*(_QWORD *)(a1 + 512) + 12) = *(_DWORD *)(a1 + 524) != 0;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ModeSetHciNwkProc: Set Mode success");
      }
    }
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ModeSetHciNwkProc");
  return a2;
}

uint64_t sub_2198DC4DC(unsigned int *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int *v5;
  const char *v6;
  unsigned int *v7;
  uint64_t v8;
  const char *v9;
  int v10;
  unsigned int *v11;
  uint64_t v13;

  v3 = (uint64_t)a1;
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_HciInitComplete");
  if (!v3)
  {
    v9 = "phLibNfc_HciInitComplete: Invalid LibNfc context received!";
    a2 = 1;
    v10 = 2;
    v11 = 0;
LABEL_9:
    sub_219850628(v10, v11, 4u, 1u, (uint64_t)v9);
    goto LABEL_17;
  }
  v4 = *(_QWORD *)(v3 + 464);
  *(_WORD *)(v3 + 704) = 0;
  *(_BYTE *)(v3 + 696) = 0;
  if (!v4)
  {
    v11 = (unsigned int *)(v3 + 19368);
    v9 = "phLibNfc_HciInitComplete: Invalid Hci context received!";
    a2 = 1;
    v10 = 1;
    goto LABEL_9;
  }
  v5 = (unsigned int *)(v3 + 19368);
  if (!(_DWORD)a2)
  {
    sub_219850628(1, (unsigned int *)(v3 + 19368), 4u, 4u, (uint64_t)"Hci network initialization success");
    *(_BYTE *)(v3 + 322) = 2;
    if (*(_BYTE *)(v3 + 2944) == 1)
    {
      a2 = sub_219897C98(v3);
      if ((_DWORD)a2)
        goto LABEL_20;
      if (*(_BYTE *)(v3 + 504))
      {
        if (*(_BYTE *)(v3 + 505))
        {
          *(_WORD *)(v4 + 832) = 16650;
LABEL_32:
          sub_219850628(1, v5, 4u, 4u, (uint64_t)"HCI Init Comp- Static feature config");
          a2 = sub_21989A264(v3);
          if ((_DWORD)a2 == 13)
          {
            sub_219850628(1, v5, 4u, 4u, (uint64_t)"phLibNfc_HciInitComplete: Static feature config seq started");
            goto LABEL_17;
          }
          v6 = "phLibNfc_HciInitComplete: Static feature config seq failed";
          goto LABEL_5;
        }
        goto LABEL_31;
      }
      if (*(_BYTE *)(v3 + 318) != 1)
      {
        if (*(_BYTE *)(v3 + 505))
          goto LABEL_32;
LABEL_31:
        if (*(_BYTE *)(v3 + 317) != 1)
          goto LABEL_32;
LABEL_21:
        if (*(_BYTE *)(v3 + 2936) == 1 && (v13 = sub_2198E0040(v3, 4u), (_DWORD)v13 != 255)
          || (v13 = sub_2198E0040(v3, 2u), (_DWORD)v13 != 255))
        {
          a2 = v13;
          goto LABEL_17;
        }
        if (*(_BYTE *)(v3 + 317) == 2 && *(_BYTE *)(v3 + 318) == 2 && *(_BYTE *)(v3 + 319) == 2)
          sub_219850628(1, v5, 4u, 4u, (uint64_t)"phLibNfc_HciInitComplete: UICC, SE2 and eSE are Removed");
        goto LABEL_32;
      }
    }
    a2 = sub_2198E0040(v3, 3u);
LABEL_20:
    if ((_DWORD)a2 != 255)
      goto LABEL_17;
    goto LABEL_21;
  }
  v6 = "phLibNfc_HciInitComplete: Hci network initialization FAILED";
LABEL_5:
  sub_219850628(1, v5, 4u, 1u, (uint64_t)v6);
  if (*(_BYTE *)(v3 + 2883))
  {
    v7 = (unsigned int *)v3;
    v8 = 137;
  }
  else
  {
    sub_2198DC7F0(v3);
    v7 = (unsigned int *)v3;
    v8 = 255;
  }
  sub_219898F04(v7, v8);
  v3 = 0;
LABEL_17:
  sub_219850808(2, (unsigned int *)v3, 4u, 5u, (uint64_t)"phLibNfc_HciInitComplete");
  return a2;
}

uint64_t sub_2198DC76C(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeReInitSeqComplete");
  if (a1)
    *(_BYTE *)(a1 + 509) = 0;
  else
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SeReInitSeqComplete: Invalid parameter!");
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeReInitSeqComplete");
  return a2;
}

uint64_t sub_2198DC7F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciDeInit");
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 464);
    if (v2)
    {
      v3 = *(_QWORD *)(v2 + 936);
      if (v3)
        v4 = v3 == 0xFFFFFFFFFFFFLL;
      else
        v4 = 1;
      if (!v4)
      {
        phOsalNfc_Timer_Delete();
        *(_QWORD *)(v2 + 936) = 0;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDeInit:dwHciResendPacketTimerId Deleted");
      }
      *(_QWORD *)(v2 + 792) = *(_QWORD *)(a1 + 3040);
      sub_219889084(v2);
      sub_219889EAC(v2);
      phOsalNfc_FreeMemory();
      sub_21988FBB0(*(_DWORD *)(a1 + 19368), 0);
      *(_QWORD *)(a1 + 464) = 0;
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDeInit:Invalid HCI Context");
    }
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_HciDeInit:Invalid LibNfc Context");
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciDeInit");
}

uint64_t sub_2198DC908(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  const char *v6;
  int v7;
  unsigned int *v8;
  uint64_t v9;
  unsigned __int8 v11;
  uint64_t v12;

  v12 = 0;
  v11 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciDataSend");
  if (!a1)
  {
    v6 = "phLibNfc_HciDataSend: Invalid LibNfc context received!";
    v3 = 1;
    v7 = 2;
    v8 = 0;
LABEL_21:
    sub_219850628(v7, v8, 4u, 1u, (uint64_t)v6);
    goto LABEL_22;
  }
  v2 = *(_QWORD *)(a1 + 464);
  if (!v2)
  {
    v8 = (unsigned int *)(a1 + 19368);
    v6 = "phLibNfc_HciDataSend: Invalid Hci context received!";
    v3 = 1;
    v7 = 1;
    goto LABEL_21;
  }
  v3 = sub_21988E9C8(*(_QWORD *)(a1 + 464), *(_DWORD *)(a1 + 596), (char *)&v11);
  if ((_DWORD)v3 == 147)
    v3 = sub_21988D588(*(_QWORD *)(a1 + 464), 240, &v11);
  sub_219851888(1, (unsigned int *)(v2 + 956), 7u, 4u, (uint64_t)"PIPE ID");
  if ((_DWORD)v3 || v11 == 255)
  {
    v6 = "phLibNfc_HciDataSend: Failure with phHciNfc_GetPipeId!";
LABEL_20:
    v7 = 1;
    v8 = (unsigned int *)(a1 + 19368);
    goto LABEL_21;
  }
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phHciNfc_RegisterForResponses:APDU Pipe");
  LODWORD(v12) = 2;
  BYTE4(v12) = v11;
  sub_21988CF78((unsigned int *)v2, (uint64_t)&v12, (uint64_t)sub_2198DCB70, (unsigned int *)v2);
  *(_BYTE *)(v2 + 1236) = 0;
  *(_BYTE *)(v2 + 1232) = 0;
  *(_BYTE *)(a1 + 706) = 0;
  v4 = sub_2198DCCDC(*(_QWORD *)(a1 + 464), v11, 16, 1, *(_DWORD *)(a1 + 568), *(_QWORD *)(a1 + 560), 0);
  if ((_DWORD)v4 != 13)
  {
    v3 = v4;
    v6 = "phLibNfc_HciDataSend: Failed Status from Lower Layer";
    goto LABEL_20;
  }
  *(_QWORD *)(v2 + 184) = sub_2198E2254;
  *(_QWORD *)(v2 + 192) = a1;
  v5 = *(unsigned __int16 *)(a1 + 708);
  if (v5 < 0x7D0)
  {
    v5 = *(_DWORD *)(a1 + 592);
    if (v5 >> 4 < 0x271)
      v5 = 10000;
  }
  *(_DWORD *)(v2 + 852) = v5;
  if (!sub_2198E2024(v2))
  {
    v9 = *(_QWORD *)(a1 + 464);
    if (!phOsalNfc_Timer_Start())
      goto LABEL_13;
    v3 = phOsalNfc_Timer_Delete();
    *(_QWORD *)(v9 + 840) = 0xFFFFFFFFFFFFLL;
    v6 = "phLibNfc_HciDataSend: SE TxRx Timer Start Failed";
    goto LABEL_20;
  }
  sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSend: SE TxRx Timer Started with Timeout");
LABEL_13:
  v3 = 13;
LABEL_22:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciDataSend");
  return v3;
}

uint64_t sub_2198DCB70(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  const char *v7;

  sub_219850718(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessRspsOnApduPipe");
  if (a1)
  {
    if (a3)
    {
      if (!a2)
      {
        v6 = *(_QWORD *)(a1 + 960);
        if (v6)
        {
          v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyENotConnected received";
          switch(*(_BYTE *)(a3 + 1))
          {
            case 0:
              sub_219850628(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)"phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyOk Not Expected From APDU Pipe");
              return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessRspsOnApduPipe");
            case 1:
              goto LABEL_18;
            case 2:
              v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyECmdParUnknown received";
              goto LABEL_18;
            case 3:
              v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyENok received";
              goto LABEL_18;
            case 4:
              v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyEPipesFull received";
              goto LABEL_18;
            case 5:
              v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyERegParUnknown received";
              goto LABEL_18;
            case 6:
              v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyEPipeNotOpened received";
              goto LABEL_18;
            case 7:
              v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyECmdNotSupported received";
              goto LABEL_18;
            case 8:
              v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyEInhibited received";
              goto LABEL_18;
            case 9:
              v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyETimeout received";
              goto LABEL_18;
            case 0xA:
              v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyERegAccessDenied received";
              goto LABEL_18;
            case 0xB:
              v7 = "phHciNfc_ProcessRspsOnApduPipe:phHciNfc_e_RspAnyEPipeAccessDenied received";
              goto LABEL_18;
            default:
              v7 = "phHciNfc_ProcessRspsOnApduPipe:Unknown Response INS received";
LABEL_18:
              sub_219850628(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)v7);
              sub_2198DCE40(v6, 255, a3);
              break;
          }
        }
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessRspsOnApduPipe");
}

uint64_t sub_2198DCCDC(uint64_t a1, char a2, char a3, char a4, int a5, uint64_t a6, uint64_t a7)
{
  uint64_t v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  uint64_t v19;

  v18 = 0uLL;
  v19 = 0;
  sub_219850718(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_Transceive");
  if (a1 && (v14 = *(_QWORD *)(a1 + 960)) != 0)
  {
    LOBYTE(v18) = a2;
    BYTE1(v18) = a3;
    BYTE2(v18) = a4;
    *((_QWORD *)&v18 + 1) = a6;
    DWORD1(v18) = a5;
    *(_BYTE *)(a1 + 953) = 0;
    if (*(_BYTE *)(v14 + 2944) == 1 || *(_BYTE *)(v14 + 2939) == 1)
      *(_BYTE *)(a1 + 953) = 1;
    if (a7)
      v15 = sub_21988C6CC;
    else
      v15 = sub_21988C618;
    v16 = sub_219889530(a1, &v18, (uint64_t)v15, a1);
    if ((_DWORD)v16 == 13)
    {
      *(_OWORD *)(a1 + 200) = 0u;
      *(_OWORD *)(a1 + 184) = 0u;
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 956), 7u, 1u, (uint64_t)"phHciNfc_Transceive:Failed Status from Lower layer");
      *(_BYTE *)(a1 + 953) = 0;
    }
  }
  else
  {
    v16 = 1;
    sub_219850628(2, (unsigned int *)a1, 7u, 1u, (uint64_t)"phHciNfc_Transceive:Invalid HCI Context");
  }
  sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_Transceive");
  return v16;
}

uint64_t sub_2198DCE40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int *v11;
  const char *v12;
  uint64_t v13;
  BOOL v14;
  unsigned int v15;
  uint64_t v16;
  const char *v17;
  __int16 v19;
  uint64_t v20;
  unsigned int v21;

  v21 = 191;
  v20 = 0;
  v19 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciDataSendProc");
  if (a1)
  {
    v6 = *(_QWORD *)(a1 + 464);
    if (!v6)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HciDataSendProc:Invalid HCI Context");
      a2 = 255;
      goto LABEL_37;
    }
    if ((_DWORD)a2 == 44)
      goto LABEL_53;
    v8 = &dword_253E47158;
    if (!*(_DWORD *)(v6 + 956))
      v8 = &dword_253E47070;
    *v8 &= ~8u;
    if ((_DWORD)a2 || !a3 || !*(_QWORD *)(a1 + 6296))
    {
LABEL_53:
      if (*(_QWORD *)(a1 + 6312))
      {
        sub_2198DD32C(a1, a2, a3);
      }
      else
      {
        if ((_DWORD)a2 != 65)
        {
          if ((_DWORD)a2 == 217 && !a3)
          {
            if (*(_DWORD *)(a1 + 584))
            {
              phOsalNfc_MemCopy();
              *(_DWORD *)(a1 + 584) = 1;
            }
            a2 = 217;
            goto LABEL_31;
          }
          *(_DWORD *)(a1 + 584) = 0;
          v11 = (unsigned int *)(a1 + 19368);
          v12 = "phLibNfc_HciDataSendProc:Failed Status received from lower layer";
LABEL_30:
          sub_219850628(1, v11, 4u, 1u, (uint64_t)v12);
          goto LABEL_31;
        }
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:RECOVERY SUCCESS");
      }
    }
    else
    {
      if (*(_WORD *)(a3 + 4) && *(_QWORD *)(a3 + 8))
      {
        v9 = sub_2198DD268(a1);
        if ((_DWORD)v9 == 111)
        {
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:Received valid data");
          if (*(_QWORD *)(a1 + 576) && (v10 = *(_DWORD *)(a1 + 584)) != 0)
          {
            if (v10 >= *(unsigned __int16 *)(a3 + 4))
            {
              phOsalNfc_MemCopy();
              a2 = 0;
              *(_DWORD *)(a1 + 584) = *(unsigned __int16 *)(a3 + 4);
            }
            else
            {
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HciDataSendProc:Could not copy entire received data");
              a2 = 8;
            }
          }
          else
          {
            a2 = 0;
          }
          goto LABEL_31;
        }
        a2 = v9;
        v12 = "phLibNfc_HciDataSendProc:eSE Transeive received data after Timeout";
        v11 = (unsigned int *)(a1 + 19368);
        goto LABEL_30;
      }
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HciDataSendProc:Invalid data received!");
      a2 = 255;
    }
LABEL_31:
    v13 = *(_QWORD *)(v6 + 840);
    if (v13)
      v14 = v13 == 0xFFFFFFFFFFFFLL;
    else
      v14 = 1;
    if (!v14)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(_QWORD *)(v6 + 840) = 0xFFFFFFFFFFFFLL;
      *(_DWORD *)(v6 + 852) = 10000;
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:SE TxRx Timer Deleted");
    }
    sub_21988D588(*(_QWORD *)(a1 + 464), 240, (_BYTE *)&v19 + 1);
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phHciNfc_UnRegisterCmdRspEvt:APDU Pipe");
    LODWORD(v20) = 2;
    BYTE4(v20) = HIBYTE(v19);
    sub_21988D688((unsigned int *)v6, (int *)&v20, (uint64_t)sub_2198DCB70);
    v15 = sub_2198893F8((unsigned int *)v6, v6, HIBYTE(v19));
    sub_2198C7138((unsigned int *)v6, v6, v15);
    *(_BYTE *)(v6 + 953) = 0;
LABEL_37:
    v16 = *(_QWORD *)(a1 + 512);
    if (v16)
      sub_2198E1240((unsigned int *)a1, *(_DWORD *)(v16 + 8), a2, (int *)&v21);
    if (*(_BYTE *)(a1 + 2944) != 1 && *(_BYTE *)(a1 + 2939) != 1
      || !sub_2198B00C4(*(_QWORD *)(a1 + 2952), 20))
    {
      goto LABEL_46;
    }
    if (sub_21988F5D4(*(_QWORD *)(a1 + 19360), &v19))
    {
      a2 = 255;
      v17 = "phLibNfc_HciDataSendProc-Fialed to retrieve bIgnoreWkUpRet from Util module";
    }
    else
    {
      if ((_BYTE)v19)
        goto LABEL_46;
      v17 = "phLibNfc_HciDataSendProc-Fialed to De-Assert Wake Up Line";
    }
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)v17);
LABEL_46:
    v7 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v21, a2, 0, 0);
    goto LABEL_47;
  }
  sub_219850628(2, 0, 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:Invalid Lib Context");
  v7 = 1;
LABEL_47:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciDataSendProc");
  return v7;
}

uint64_t sub_2198DD268(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phHciNfc_CheckTransOnApduPipe");
  if (a1)
  {
    if (*(_QWORD *)(a1 + 6296) || *(_QWORD *)(a1 + 6312) || *(_QWORD *)(a1 + 6536))
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phHciNfc_CheckTransOnApduPipe:eSE Transeive or Get ATR API in progress");
      v2 = 111;
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phHciNfc_CheckTransOnApduPipe:Invalid Context");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phHciNfc_CheckTransOnApduPipe");
  return v2;
}

uint64_t sub_2198DD32C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  BOOL v11;
  const char *v12;
  char v14;
  uint64_t v15;
  unsigned int v16;

  v16 = 191;
  v15 = 0;
  v14 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciRawDataSendProc");
  if (a1)
  {
    v6 = *(_QWORD *)(a1 + 464);
    if (!v6)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HciRawDataSendProc:Invalid HCI Context");
      a2 = 255;
      goto LABEL_34;
    }
    if (!(_DWORD)a2 && a3)
    {
      if (sub_2198DD268(a1) != 111)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HciDataSendProc:Invalid data received!");
        a2 = 255;
        goto LABEL_28;
      }
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:Received valid data");
      *(_WORD *)(a1 + 632) = *(_WORD *)a3;
      *(_BYTE *)(a1 + 634) = *(_BYTE *)(a3 + 2);
      if (!*(_QWORD *)(a1 + 640) || !*(_WORD *)(a1 + 636))
      {
        a2 = 0;
        goto LABEL_28;
      }
      if (*(unsigned __int16 *)(a3 + 4) <= *(unsigned __int16 *)(a1 + 636))
      {
        phOsalNfc_MemCopy();
        a2 = 0;
        *(_WORD *)(a1 + 636) = *(_WORD *)(a3 + 4);
        goto LABEL_28;
      }
      v7 = (unsigned int *)(a1 + 19368);
LABEL_18:
      sub_219850628(1, v7, 4u, 1u, (uint64_t)"phLibNfc_HciRawDataSendProc:Could not copy entire received data");
      a2 = 8;
LABEL_28:
      v10 = *(_QWORD *)(v6 + 840);
      if (v10)
        v11 = v10 == 0xFFFFFFFFFFFFLL;
      else
        v11 = 1;
      if (!v11)
      {
        phOsalNfc_Timer_Stop();
        phOsalNfc_Timer_Delete();
        *(_QWORD *)(v6 + 840) = 0xFFFFFFFFFFFFLL;
        *(_DWORD *)(v6 + 852) = 10000;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:SE TxRx Timer Deleted");
      }
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phHciNfc_UnRegisterCmdRspEvt:APDU Pipe");
      LODWORD(v15) = *(unsigned __int8 *)(a1 + 610);
      BYTE4(v15) = *(_BYTE *)(a1 + 608);
      sub_21988D688((unsigned int *)v6, (int *)&v15, (uint64_t)sub_2198DCB70);
      *(_BYTE *)(v6 + 953) = 0;
LABEL_34:
      sub_2198E1240((unsigned int *)a1, *(_DWORD *)(*(_QWORD *)(a1 + 512) + 8), a2, (int *)&v16);
      if (*(_BYTE *)(a1 + 2944) != 1 && *(_BYTE *)(a1 + 2939) != 1
        || !sub_2198B00C4(*(_QWORD *)(a1 + 2952), 20))
      {
        goto LABEL_41;
      }
      if (sub_21988F5D4(*(_QWORD *)(a1 + 19360), &v14))
      {
        v12 = "phLibNfc_HciRawDataSendProc-Fialed to retrieve bIgnoreWkUpRet from Util module";
      }
      else
      {
        if (v14)
          goto LABEL_41;
        v12 = "phLibNfc_HciRawDataSendProc-Fialed to De-Assert Wake Up Line";
      }
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)v12);
LABEL_41:
      v8 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v16, a2, 0, 0);
      goto LABEL_42;
    }
    if ((_DWORD)a2 != 217)
    {
      *(_BYTE *)(a1 + 634) = 0;
      *(_WORD *)(a1 + 632) = 0;
      *(_WORD *)(a1 + 636) = 0;
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciRawDataSendProc:Failed Status received from lower layer");
      goto LABEL_28;
    }
    if (a3)
    {
      *(_WORD *)(a1 + 632) = *(_WORD *)a3;
      *(_BYTE *)(a1 + 634) = *(_BYTE *)(a3 + 2);
      if (!*(_QWORD *)(a1 + 640) || !*(_WORD *)(a1 + 636))
        goto LABEL_27;
      if (*(unsigned __int16 *)(a3 + 4) > *(unsigned __int16 *)(a1 + 636))
      {
        v7 = (unsigned int *)(a1 + 19368);
        goto LABEL_18;
      }
      phOsalNfc_MemCopy();
      v9 = *(_WORD *)(a3 + 4);
    }
    else
    {
      *(_BYTE *)(a1 + 634) = 1;
      *(_WORD *)(a1 + 632) = 8193;
      if (*(unsigned __int16 *)(a1 + 636) < 2u)
      {
LABEL_27:
        a2 = 217;
        goto LABEL_28;
      }
      **(_BYTE **)(a1 + 640) = *(_BYTE *)(v6 + 1232);
      *(_BYTE *)(*(_QWORD *)(a1 + 640) + 1) = *(_BYTE *)(v6 + 1236);
      v9 = 2;
    }
    *(_WORD *)(a1 + 636) = v9;
    goto LABEL_27;
  }
  sub_219850628(2, 0, 4u, 4u, (uint64_t)"phLibNfc_HciRawDataSendProc:Invalid Lib Context");
  v8 = 1;
LABEL_42:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciRawDataSendProc");
  return v8;
}

uint64_t sub_2198DD6F0(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  int v7;
  unsigned __int8 *v8;
  unsigned __int8 v10;

  v10 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VerifyHciRawInfo");
  if (!a1)
  {
    v4 = 255;
    goto LABEL_20;
  }
  if (!a2
    || (v4 = sub_21988E9C8(*(_QWORD *)(a1 + 464), *((_DWORD *)a2 + 10), (char *)&v10), (_DWORD)v4 == 147)
    && ((v5 = sub_21988D588(*(_QWORD *)(a1 + 464), 240, &v10), v10 != 25) || (v4 = v5, *a2 != 25)))
  {
    v4 = 1;
    goto LABEL_20;
  }
  if (!(_DWORD)v4)
  {
    v6 = v10;
    if (v10 == 255)
    {
      v6 = *a2;
      v10 = *a2;
    }
    v4 = 1;
    if (v6 <= 0x29 && ((1 << v6) & 0x38002000000) != 0 && a2[2] == 1)
    {
      v7 = a2[1];
      if (v7 == 65)
      {
        v4 = 147;
        if (v6 == 40 || *((_DWORD *)a2 + 10) == 2)
          goto LABEL_20;
        goto LABEL_24;
      }
      if (v7 != 81 || !*((_DWORD *)a2 + 1) || (v8 = (unsigned __int8 *)*((_QWORD *)a2 + 1)) == 0)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_VerifyHciRawInfo: Event not supported");
        goto LABEL_20;
      }
      if (*v8 - 1 <= 2)
      {
LABEL_24:
        v4 = 0;
        if (*((_DWORD *)a2 + 4) <= 0x7CFu)
          *((_DWORD *)a2 + 4) = 2000;
      }
    }
  }
LABEL_20:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VerifyHciRawInfo");
  return v4;
}

uint64_t sub_2198DD8A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  unsigned __int8 v8;
  uint64_t v9;

  v9 = 0;
  v8 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciRawDataSend");
  if (!a1 || (v2 = *(_QWORD *)(a1 + 464)) == 0)
  {
    v4 = 1;
    goto LABEL_15;
  }
  if (!sub_21988E9C8(*(_QWORD *)(a1 + 464), *(_DWORD *)(a1 + 648), (char *)&v8) && v8 != 255)
    *(_BYTE *)(a1 + 608) = v8;
  *(_BYTE *)(v2 + 1236) = 0;
  *(_BYTE *)(v2 + 1232) = 0;
  *(_BYTE *)(a1 + 706) = 0;
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phHciNfc_RegisterForResponses:APDU Pipe");
  LODWORD(v9) = *(unsigned __int8 *)(a1 + 610);
  BYTE4(v9) = *(_BYTE *)(a1 + 608);
  sub_21988CF78((unsigned int *)v2, (uint64_t)&v9, (uint64_t)sub_2198DCB70, (unsigned int *)v2);
  v3 = sub_2198DCCDC(*(_QWORD *)(a1 + 464), *(_BYTE *)(a1 + 608), *(_BYTE *)(a1 + 609), *(_BYTE *)(a1 + 610), *(_DWORD *)(a1 + 612), *(_QWORD *)(a1 + 616), (uint64_t)sub_219865DD0);
  if ((_DWORD)v3 != 13)
  {
    v4 = v3;
    v5 = "phLibNfc_HciRawDataSend: Failed Status from Lower Layer";
    goto LABEL_14;
  }
  *(_QWORD *)(v2 + 184) = sub_2198E2310;
  *(_QWORD *)(v2 + 192) = a1;
  *(_DWORD *)(v2 + 852) = *(_DWORD *)(a1 + 624);
  if (!sub_2198E2024(v2))
  {
    v6 = *(_QWORD *)(a1 + 464);
    if (!phOsalNfc_Timer_Start())
      goto LABEL_9;
    v4 = phOsalNfc_Timer_Delete();
    *(_QWORD *)(v6 + 840) = 0xFFFFFFFFFFFFLL;
    v5 = "phLibNfc_HciRawDataSend: SE TxRx Timer Start Failed";
LABEL_14:
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)v5);
    goto LABEL_15;
  }
  sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciRawDataSend: SE TxRx Timer Started with Timeout");
LABEL_9:
  v4 = 13;
LABEL_15:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciRawDataSend");
  return v4;
}

uint64_t sub_2198DDA7C(uint64_t a1, int a2, unsigned __int8 *a3)
{
  uint64_t v6;
  unsigned int v7;
  const char *v8;
  unsigned int *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  unsigned int *v15;
  unsigned __int8 *v16;
  unsigned int v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  int v25;
  unsigned int *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  _OWORD v30[2];
  uint64_t v31;

  v31 = 0;
  memset(v30, 0, sizeof(v30));
  sub_219850718(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  if (!a1)
    return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  if (a2)
    return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  if (!a3)
    return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  v6 = *(_QWORD *)(a1 + 960);
  if (!v6)
    return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  v7 = a3[1];
  if (v7 > 0x10)
  {
    if (v7 != 17)
    {
      if (v7 != 18)
        return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
      v10 = *(_QWORD *)(v6 + 6312);
      if (*(_BYTE *)(v6 + 2944) == 1)
      {
        if (!v10)
          return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
        v11 = *(unsigned __int8 *)(a1 + 8);
        if ((v11 + 1) <= 2u)
          v11 = *(unsigned __int8 *)(v6 + 608);
        v9 = (unsigned int *)(v6 + 19368);
        if (*((_WORD *)a3 + 2) || v11 != *a3)
        {
          v8 = "phHciNfc_ProcessEventsOnApduPipe: Unexpected, SE Soft Reset or Event ATR, PipeID";
          goto LABEL_20;
        }
      }
      else
      {
        if (!v10 || *((_WORD *)a3 + 2))
          return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
        v9 = (unsigned int *)(v6 + 19368);
      }
      sub_219850628(1, v9, 4u, 4u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe:Soft Reset response received");
      goto LABEL_39;
    }
    sub_219850628(1, (unsigned int *)(v6 + 19368), 4u, 4u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe:EVENT_WTX_REQ received");
    if (*(_QWORD *)(v6 + 6344))
    {
      v16 = (unsigned __int8 *)*((_QWORD *)a3 + 1);
      if (v16)
      {
        v17 = sub_2198DE080(*(_DWORD *)(v6 + 19368), *v16);
        if (v17 <= 0x7CF)
          v18 = v17 + 400;
        else
          v18 = v17;
      }
      else
      {
        v18 = 2000;
      }
      v20 = 0;
      *(_DWORD *)(v6 + 656) = v18;
      *(_DWORD *)(a1 + 852) = v18;
      while (*(_DWORD *)(v6 + v20 + 352) != 1)
      {
        v20 += 16;
        if (v20 == 80)
        {
          v21 = 0;
          goto LABEL_50;
        }
      }
      v21 = *(_QWORD *)(v6 + v20 + 344);
LABEL_50:
      sub_219853E34(1, (unsigned int *)(v6 + 19368), 7u, 4u, (uint64_t)"ProcessEventsOnApduPipe :EvtWtxCb[WTX Ntf]");
      (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(v6 + 6344))(*(_QWORD *)(v6 + 19360), *(_QWORD *)(v6 + 6352), v21, v6 + 656, 74);
      v22 = *(_QWORD *)(a1 + 840);
      if (!v22 || v22 == 0xFFFFFFFFFFFFLL)
      {
        sub_219850628(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: SE Transeive Timer Already deleted");
        v23 = "phHciNfc_ProcessEventsOnApduPipe: SE Transeive user provided timeout should be incremented";
LABEL_55:
        sub_219850628(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)v23);
        return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
      }
      sub_2198EF82C(*(_DWORD *)(a1 + 956), v22);
      if (phOsalNfc_Timer_Start())
      {
        phOsalNfc_Timer_Delete();
        *(_QWORD *)(a1 + 840) = 0xFFFFFFFFFFFFLL;
        v23 = "phLibNfc_HciDataSend: SE TxRx Timer Start Failed";
        goto LABEL_55;
      }
      v19 = "phHciNfc_ProcessEventsOnApduPipe:                                        eSe Transeive Timer restarted with "
            "WTX timeout value";
    }
    else
    {
      v19 = "phHciNfc_ProcessEventsOnApduPipe:WTX Call Back not defined by App";
    }
    sub_219850628(1, (unsigned int *)(v6 + 19368), 4u, 4u, (uint64_t)v19);
    return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  }
  if (v7 == 2)
  {
    if (*(_BYTE *)(v6 + 2944) != 1)
    {
      sub_219851888(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: Ignoring eSE OS Reset, PipeID");
      return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
    }
    v14 = *(unsigned __int8 *)(a1 + 8);
    if (*(_QWORD *)(v6 + 6312))
    {
      if (v14 == 1)
        v14 = *(unsigned __int8 *)(a1 + 1232);
      if ((v14 + 1) <= 1u)
        v14 = *(unsigned __int8 *)(v6 + 608);
      v15 = (unsigned int *)(v6 + 19368);
      if (v14 == *a3)
      {
        if (*(_BYTE *)(v6 + 609) == 65)
        {
          sub_219851888(1, (unsigned int *)(v6 + 19368), 4u, 4u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: OS Reset Success,PipeID");
          goto LABEL_39;
        }
        v27 = "phHciNfc_ProcessEventsOnApduPipe: OS Reset Received,PipeID";
        v26 = (unsigned int *)(v6 + 19368);
LABEL_66:
        sub_219851888(1, v26, 4u, 2u, (uint64_t)v27);
        sub_2199004B4(*(_QWORD *)(v6 + 3040), 1);
        v12 = v6;
        v13 = 217;
        goto LABEL_40;
      }
      if (*(_QWORD *)(v6 + 6696))
      {
        sub_219851888(1, (unsigned int *)(v6 + 19368), 4u, 2u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: SE OS Reset (SE-raw transceive), PipeID");
        phOsalNfc_SetMemory();
        LODWORD(v31) = sub_21988E8F0(*v15, *a3);
        v28 = "ProcessEventsOnApduPipe:pSeListenerNtfCb[OS Reset Ntf during Warm reset]";
LABEL_71:
        sub_219853E34(1, v15, 4u, 4u, (uint64_t)v28);
        (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, uint64_t))(v6 + 6696))(*(_QWORD *)(v6 + 19360), *(_QWORD *)(v6 + 6704), 27, *(_QWORD *)(v6 + 392), v30, 217);
        return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
      }
      v29 = "phHciNfc_ProcessEventsOnApduPipe:Droping as SE NTF Handler is not registered, PipeID";
    }
    else
    {
      v25 = *a3;
      if (*(_QWORD *)(v6 + 6296) && v14 == v25)
      {
        v26 = (unsigned int *)(v6 + 19368);
        v27 = "phHciNfc_ProcessEventsOnApduPipe: OS Reset (SE-transceive),PipeID";
        goto LABEL_66;
      }
      if (*(_QWORD *)(v6 + 6536) && v14 == v25)
      {
        sub_219851888(1, (unsigned int *)(v6 + 19368), 4u, 2u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: OS Reset (SE Get ATR),PipeID");
        sub_2199004B4(*(_QWORD *)(v6 + 3040), 1);
        sub_2198E0AAC(v6, 217, (uint64_t)a3);
        return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
      }
      v15 = (unsigned int *)(v6 + 19368);
      if (*(_QWORD *)(v6 + 6696))
      {
        sub_219851888(1, (unsigned int *)(v6 + 19368), 4u, 2u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: Independent SE OS Reset, PipeID");
        phOsalNfc_SetMemory();
        LODWORD(v31) = sub_21988E8F0(*v15, *a3);
        v28 = "ProcessEventsOnApduPipe:pSeListenerNtfCb[OS Reset Ntf]";
        goto LABEL_71;
      }
      v29 = "phHciNfc_ProcessEventsOnApduPipe: Ignoring SE OS Reset, PipeID";
    }
    sub_219851888(1, v15, 4u, 2u, (uint64_t)v29);
    return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
  }
  if (v7 == 16)
  {
    if (*(_QWORD *)(v6 + 6312) && (*(unsigned __int8 *)(v6 + 609) | 0x10) == 0x51)
    {
      sub_219851888(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe: Undesired Data Packet received, PipeID");
      sub_219851888(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)"pReceivedParams->bIns");
      sub_219851888(1, (unsigned int *)(v6 + 19368), 4u, 1u, (uint64_t)"pReceivedParams->bMsgType");
      v8 = "pReceivedParams->wLen";
      v9 = (unsigned int *)(v6 + 19368);
LABEL_20:
      sub_219851888(1, v9, 4u, 1u, (uint64_t)v8);
      v12 = v6;
      v13 = 255;
LABEL_40:
      sub_2198DCE40(v12, v13, (uint64_t)a3);
      return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
    }
LABEL_39:
    v12 = v6;
    v13 = 0;
    goto LABEL_40;
  }
  return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_ProcessEventsOnApduPipe");
}

uint64_t sub_2198DE080(unsigned int a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v5;

  v5 = a1;
  sub_219850718(1, &v5, 7u, 5u, (uint64_t)"phHciNfc_CalcWtxTimeout");
  v3 = (float)((float)((float)sub_2198DE130(v5, 2u, a2 >> 4) / 10.0) * 1000.0);
  sub_219851888(1, &v5, 7u, 4u, (uint64_t)"phHciNfc_CalcWtxTimeout:WTX Timeout");
  sub_219850808(1, &v5, 7u, 5u, (uint64_t)"phHciNfc_CalcWtxTimeout");
  return v3;
}

uint64_t sub_2198DE130(unsigned int a1, unsigned int a2, int a3)
{
  uint64_t v5;
  int v6;
  uint32x4_t v7;
  int32x4_t v8;
  int32x4_t v9;
  int8x16_t v10;
  int8x16_t v11;
  unsigned int v13;

  v13 = a1;
  v5 = 1;
  sub_219850718(1, &v13, 7u, 5u, (uint64_t)"phHciNfc_CalcPower");
  if (a3)
  {
    v6 = 0;
    v7 = (uint32x4_t)vdupq_n_s32(a3 - 1);
    v8 = vdupq_n_s32(a2);
    v9.i64[0] = 0x100000001;
    v9.i64[1] = 0x100000001;
    do
    {
      v10 = (int8x16_t)v9;
      v9 = vmulq_s32(v9, v8);
      v6 += 4;
    }
    while (((a3 + 3) & 0x1FFFC) != v6);
    v11 = vbslq_s8((int8x16_t)vcgtq_u32((uint32x4_t)vorrq_s8((int8x16_t)vdupq_n_s32(v6 - 4), (int8x16_t)xmmword_21990AF70), v7), v10, (int8x16_t)v9);
    *(int32x2_t *)v11.i8 = vmul_s32(*(int32x2_t *)v11.i8, (int32x2_t)*(_OWORD *)&vextq_s8(v11, v11, 8uLL));
    v5 = (v11.i32[0] * v11.i32[1]);
  }
  sub_219850808(1, &v13, 7u, 5u, (uint64_t)"phHciNfc_CalcPower");
  return v5;
}

uint64_t sub_2198DE208(uint64_t a1, int a2)
{
  uint64_t (*v4)(uint64_t, int, unsigned __int8 *);
  uint64_t v6;

  v6 = 0;
  sub_219850718(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_RegisterForEvents");
  if (*(unsigned __int8 *)(a1 + 816) == a2
    || *(unsigned __int8 *)(a1 + 820) == a2
    || *(unsigned __int8 *)(a1 + 824) == a2
    || *(unsigned __int8 *)(a1 + 828) == a2)
  {
    sub_219850628(1, (unsigned int *)(a1 + 956), 4u, 4u, (uint64_t)"phHciNfc_RegisterForEvents:APDU Pipe");
    LODWORD(v6) = 1;
    BYTE4(v6) = a2;
    v4 = sub_2198DDA7C;
  }
  else
  {
    if (*(unsigned __int8 *)(a1 + 818) != a2
      && *(unsigned __int8 *)(a1 + 822) != a2
      && *(unsigned __int8 *)(a1 + 826) != a2
      && *(unsigned __int8 *)(a1 + 830) != a2
      && !*(_BYTE *)(a1 + 832)
      && !*(_BYTE *)(a1 + 834))
    {
      sub_219851790(1, (unsigned int *)(a1 + 956), 7u, 1u, (uint64_t)"No registerations done for PipeId");
      return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_RegisterForEvents");
    }
    sub_219850628(1, (unsigned int *)(a1 + 956), 4u, 4u, (uint64_t)"phHciNfc_RegisterForEvents:Connectivity Pipe");
    LODWORD(v6) = 1;
    BYTE4(v6) = a2;
    v4 = sub_21988E49C;
  }
  sub_21988CF78((unsigned int *)a1, (uint64_t)&v6, (uint64_t)v4, (unsigned int *)a1);
  return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_RegisterForEvents");
}

uint64_t sub_2198DE37C(unsigned int *a1)
{
  sub_219850718(2, a1, 7u, 5u, (uint64_t)"phLibNfc_PrintHciCritInfo");
  if (a1)
  {
    sub_219851790(1, a1 + 239, 4u, 1u, (uint64_t)"HCI pHciContext->bResendPacket =");
    sub_219851790(1, a1 + 239, 4u, 1u, (uint64_t)"HCI Resend Info,bMsgType =");
    sub_219851790(1, a1 + 239, 4u, 1u, (uint64_t)"HCI Resend Info,bPipeId =");
    sub_219851790(1, a1 + 239, 4u, 1u, (uint64_t)"HCI Resend Info,bIns =");
    sub_219851790(1, a1 + 239, 4u, 1u, (uint64_t)"HCI aSEPipeList[0].bGateId =");
    sub_219851790(1, a1 + 239, 4u, 1u, (uint64_t)"HCI aSEPipeList[0].bPipeId =");
    sub_219851790(1, a1 + 239, 4u, 1u, (uint64_t)"HCI aSEPipeList[1].bGateId =");
    sub_219851790(1, a1 + 239, 4u, 1u, (uint64_t)"HCI aSEPipeList[1].bPipeId =");
  }
  return sub_219850808(2, a1, 7u, 5u, (uint64_t)"phLibNfc_PrintHciCritInfo");
}

uint64_t sub_2198DE4D4(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SysEoOpNtfHandler");
  if (a1)
  {
    if (a3)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_SysEoOpNtfHandler: Received EoOP");
      if (*(_QWORD *)a3)
      {
        if (a3[2])
        {
          sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_UpdateEoOP");
          v5 = **(unsigned __int8 **)a3;
          if (v5 == 192)
          {
            sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"RXD eSE EOP");
            *(_BYTE *)(a1 + 504) = 1;
            if (!*(_BYTE *)(*(_QWORD *)a3 + 1))
              sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"P61 EVT ATR wait status");
          }
          else if (v5 == 129 && *(_BYTE *)(a1 + 2936) == 1)
          {
            sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"RXD SE2 EOP");
            *(_BYTE *)(a1 + 506) = 1;
          }
          else if (v5 == 2)
          {
            sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"RXD UICC EOP");
            *(_BYTE *)(a1 + 505) = 1;
          }
          else
          {
            sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_UpdateEoOP: Invalid EoOP received");
          }
          sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_UpdateEoOP");
          sub_21989AABC(a1);
        }
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SysEoOpNtfHandler");
}

uint64_t sub_2198DE694(unsigned int *a1, unsigned __int8 *a2, uint64_t a3)
{
  int v6;
  uint64_t v7;
  const char *v8;
  int v9;
  unsigned int *v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, unsigned __int8 *);
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  unsigned __int8 v20;

  v20 = 0;
  sub_219850718(2, a1, 7u, 5u, (uint64_t)"phHciNfc_ReceiveHandler");
  if (!a1 || !a2)
  {
    v8 = "phHciNfc_ReceiveHandler:Failed, Invalid Context or Rxd Params";
    v9 = 2;
    v10 = a1;
LABEL_8:
    sub_219850628(v9, v10, 7u, 1u, (uint64_t)v8);
    return sub_219850808(2, a1, 7u, 5u, (uint64_t)"phHciNfc_ReceiveHandler");
  }
  v6 = a2[2];
  if (v6 == 2)
  {
    v7 = (uint64_t)(a1 + 90);
    goto LABEL_10;
  }
  if (v6 == 1)
  {
    v7 = (uint64_t)(a1 + 126);
    v11 = 12;
    goto LABEL_12;
  }
  if (a2[2])
  {
    sub_219850628(1, a1 + 239, 7u, 1u, (uint64_t)"phHciNfc_ReceiveHandler:Failed, Invalid HCI bMsgType received");
    v8 = "phHciNfc_ReceiveHandler:Failed, List Empty";
    v9 = 1;
    v10 = a1 + 239;
    goto LABEL_8;
  }
  v7 = (uint64_t)(a1 + 54);
LABEL_10:
  v11 = 6;
LABEL_12:
  if (sub_21988DB60(a1, v7, v11, *a2, &v20)
    || (v12 = v20,
        v13 = v7 + 24 * v20,
        (v14 = *(void (**)(uint64_t, uint64_t, unsigned __int8 *))(v13 + 16)) == 0))
  {
    sub_219850628(1, a1 + 239, 7u, 2u, (uint64_t)"phHciNfc_ReceiveHandler:Failed, Invalid Pipe Id rxd");
  }
  else
  {
    v15 = v7 + 24 * v20;
    v18 = *(_QWORD *)(v15 + 8);
    v17 = (_QWORD *)(v15 + 8);
    v16 = v18;
    if (a2[2] == 2)
    {
      *(_BYTE *)v13 = 0;
      *(_BYTE *)(v7 + 24 * v12 + 1) = 0;
      *v17 = 0;
      v17[1] = 0;
    }
    v14(v16, a3, a2);
  }
  return sub_219850808(2, a1, 7u, 5u, (uint64_t)"phHciNfc_ReceiveHandler");
}

uint64_t sub_2198DE818(unsigned __int8 *a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned __int8 v8;
  int v9;
  int v10;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetPowerModeSeq");
  if (!a1)
    goto LABEL_6;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = (unsigned __int8 *)*((_QWORD *)&unk_253E46700 + 14 * v5 + 2);
    if ((v4 & 1) != 0)
      break;
    v4 = 1;
    v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    if (!(_DWORD)a2)
    {
      v8 = a1[2];
      v9 = (v8 & a1[1]);
      a1[1] &= v8;
      if (*a1 == v9)
      {
        a2 = 0;
        a1[2] = 1;
      }
      else if ((a1[2937] == 1 || a1[2938] == 1 || a1[2944] == 1)
             && *((_DWORD *)a1 + 787) == 2
             && v9 == 1
             && (a1[6024] & 3) == 3)
      {
        a2 = 0;
      }
      else
      {
        a2 = sub_2198FC704(*((_QWORD *)a1 + 380), v9, (uint64_t)sub_219865DD0, (uint64_t)a1);
        if ((_DWORD)a2 == 13)
        {
          v10 = *(_DWORD *)(*((_QWORD *)a1 + 64) + 8);
          if (v10 == 1)
          {
            a1[504] = 0;
          }
          else if (a1[2936] == 1)
          {
            if (v10 == 2)
            {
              a1[505] = 0;
            }
            else if (v10 == 7)
            {
              a1[506] = 0;
            }
          }
          a2 = 13;
        }
      }
    }
  }
  else
  {
LABEL_6:
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid Context passed from lower layer!");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetPowerModeSeq");
  return a2;
}

uint64_t sub_2198DE9B8(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v8;
  int v9;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetPowerModeSeqEnd");
  if (!a1)
    goto LABEL_6;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 2);
    if ((v4 & 1) != 0)
      break;
    v4 = 1;
    v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    v8 = (unsigned int *)(a1 + 19368);
    if ((_DWORD)a2)
    {
      sub_219850628(1, v8, 4u, 1u, (uint64_t)"Set Power Mode Failed!");
    }
    else
    {
      sub_219850628(1, v8, 4u, 4u, (uint64_t)"Set Power Mode success");
      v9 = *(unsigned __int8 *)(a1 + 1);
      *(_BYTE *)a1 = v9;
      *(_BYTE *)(a1 + 1) = v9 == 0;
      *(_BYTE *)(a1 + 2) = 1;
    }
  }
  else
  {
LABEL_6:
    a2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetPowerModeSeqEnd");
  return a2;
}

uint64_t sub_2198DEABC(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  int v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetModeSeq");
  if (!a1)
    goto LABEL_6;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 2);
    if ((v4 & 1) != 0)
      break;
    v4 = 1;
    v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    if (!(_DWORD)a2)
    {
      *(_BYTE *)(a1 + 2881) = 0;
      *(_DWORD *)(a1 + 544) = 0;
      a2 = sub_2198FC458(*(_QWORD *)(a1 + 3040), **(_QWORD **)(a1 + 512), *(_DWORD *)(a1 + 520), (uint64_t)sub_219865DD0, a1);
      if ((_DWORD)a2 == 13)
      {
        v8 = *(_DWORD *)(*(_QWORD *)(a1 + 512) + 8);
        if (v8 == 1)
        {
          *(_BYTE *)(a1 + 504) = 0;
        }
        else if (*(_BYTE *)(a1 + 2936) == 1)
        {
          if (v8 == 2)
          {
            *(_BYTE *)(a1 + 505) = 0;
          }
          else if (v8 == 7)
          {
            *(_BYTE *)(a1 + 506) = 0;
          }
        }
        a2 = 13;
      }
    }
  }
  else
  {
LABEL_6:
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid Context passed from lower layer!");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetModeSeq");
  return a2;
}

uint64_t sub_2198DEBF0(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  char v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;
  int v11;
  int v12;
  uint64_t v13;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetModeSeqEnd");
  if (a1)
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = *((_QWORD *)&unk_253E46700 + 14 * v7 + 2);
      if ((v6 & 1) != 0)
        break;
      v6 = 1;
      v7 = 1;
    }
    while (v8 != a1);
    if (v8 == a1)
    {
      v9 = (unsigned int *)(a1 + 19368);
      if ((_DWORD)a2)
      {
        sub_219850628(1, v9, 4u, 1u, (uint64_t)"Set Se Mode Failed!");
      }
      else
      {
        sub_219850628(1, v9, 4u, 4u, (uint64_t)"Set Se Mode success");
        if (a3)
          v11 = *a3;
        else
          v11 = 0;
        v12 = *(_DWORD *)(a1 + 520);
        if (v12)
        {
          if (v12 == 1)
          {
            a2 = 0;
            switch(*(_DWORD *)(*(_QWORD *)(a1 + 512) + 8))
            {
              case 1:
                v13 = *(_QWORD *)(a1 + 464);
                if (v13)
                  sub_21988925C(v13);
                a2 = 0;
                *(_BYTE *)(a1 + 504) = 1;
                *(_BYTE *)(a1 + 318) = 1;
                break;
              case 2:
                a2 = 0;
                *(_BYTE *)(a1 + 505) = 1;
                *(_BYTE *)(a1 + 317) = 1;
                break;
              case 5:
                break;
              case 7:
                a2 = 0;
                *(_BYTE *)(a1 + 506) = 1;
                *(_BYTE *)(a1 + 319) = 1;
                break;
              default:
                goto LABEL_18;
            }
          }
          else
          {
LABEL_18:
            a2 = 255;
          }
        }
        else
        {
          a2 = 0;
          *(_DWORD *)(a1 + 528) = v11;
        }
      }
    }
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetModeSeqEnd");
  return a2;
}

uint64_t sub_2198DED7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v7;
  unsigned int v9;

  v9 = 235;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSeModeSeqComplete");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      v4 = *(_QWORD *)(a1 + 536);
      if (v4 && v4 != 0xFFFFFFFFFFFFLL)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"SeModeSet/DelayForSE Ntf timer is still active, stopping and deleting the same");
        phOsalNfc_Timer_Stop();
        phOsalNfc_Timer_Delete();
        *(_QWORD *)(a1 + 536) = 0xFFFFFFFFFFFFLL;
      }
      if ((_DWORD)a2 == 67 || (_DWORD)a2 == 81 || (_DWORD)a2 == 143)
        a2 = a2;
      else
        a2 = 255;
      v7 = *(_QWORD *)(a1 + 512);
    }
    else
    {
      v7 = *(_QWORD *)(a1 + 512);
      *(_DWORD *)(v7 + 12) = *(_DWORD *)(a1 + 524);
    }
    *(_BYTE *)(a1 + 697) = 0;
    sub_2198E1240((unsigned int *)a1, *(_DWORD *)(v7 + 8), a2, (int *)&v9);
    a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v9, a2, 0, 0);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid input parameter!");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSeModeSeqComplete");
  return a2;
}

uint64_t sub_2198DEED0(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_eSePowerCycleSetModeSeqEnd");
  if (a1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 2);
      if ((v4 & 1) != 0)
        break;
      v4 = 1;
      v5 = 1;
    }
    while (v6 != a1);
    if (v6 == a1)
    {
      v7 = (unsigned int *)(a1 + 19368);
      if ((_DWORD)a2)
      {
        sub_219850628(1, v7, 4u, 1u, (uint64_t)"Set Se Mode Failed!");
      }
      else
      {
        sub_219850628(1, v7, 4u, 4u, (uint64_t)"Set Se Mode success");
        *(_BYTE *)(a1 + 1) = 0;
        *(_DWORD *)(a1 + 520) = 1;
        *(_BYTE *)(a1 + 2881) = 0;
        *(_DWORD *)(a1 + 544) = 4000;
      }
    }
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_eSePowerCycleSetModeSeqEnd");
  return a2;
}

uint64_t sub_2198DEFC8(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_eSePowerCycleSeqComplete");
  if (a1)
  {
    if ((_DWORD)a2 != 143 && (_DWORD)a2 != 81)
    {
      if ((_DWORD)a2)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"eSE Power Cycle Sequence Failed !!");
        a2 = 66;
      }
      else
      {
        *(_DWORD *)(a1 + 404) = 2;
        *(_BYTE *)(a1 + 318) = 3;
        sub_2198D2A2C(*(_QWORD *)(a1 + 19360), 1u, 3);
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"eSE Power Cycle Sequence Success !!");
        a2 = 65;
      }
    }
    sub_2198D27D4(*(_QWORD *)(a1 + 19360), 0);
    sub_2198DFF6C(a1, a2);
    *(_BYTE *)(a1 + 507) = 0;
    if ((_DWORD)a2 == 66)
      *(_DWORD *)(a1 + 404) = 4;
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid input parameter!");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_eSePowerCycleSeqComplete");
  return a2;
}

uint64_t sub_2198DF0F4(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  __int16 v5;

  v5 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeSvddCtrlCmd");
  if (a1)
  {
    if (*(_BYTE *)(a1 + 2936) == 1
      || *(_BYTE *)(a1 + 2937) == 1
      || *(_BYTE *)(a1 + 2938) == 1
      || *(_BYTE *)(a1 + 2944) == 1)
    {
      LOBYTE(v5) = *(_BYTE *)(a1 + 323);
      v2 = 1;
    }
    else
    {
      v2 = 0;
    }
    *(_BYTE *)((unint64_t)&v5 | v2) = *(_DWORD *)(a1 + 480);
    v3 = sub_2198AC768(*(_QWORD *)(a1 + 3040), (uint64_t)&v5, v2 + 1, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v3 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid Libnc context !!");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeSvddCtrlCmd");
  return v3;
}

uint64_t sub_2198DF1F8(unsigned int *a1, uint64_t a2)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SeSvddCtrlResp");
  if ((_DWORD)a2)
    sub_219850628(2, a1, 4u, 1u, (uint64_t)"SVDD Config Failed");
  else
    sub_219850628(2, a1, 4u, 4u, (uint64_t)"SVDD Config Success");
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SeSvddCtrlResp");
  return a2;
}

uint64_t sub_2198DF294(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeSvddCtrlSeqComplete");
  if (a1)
  {
    v4 = (unsigned int *)(a1 + 19368);
    if ((_DWORD)a2)
    {
      sub_219850628(1, v4, 4u, 1u, (uint64_t)"phLibNfc_SeSvddCtrlSeqComplete: Se SVDDD failed");
      v5 = 146;
    }
    else
    {
      sub_219850628(1, v4, 4u, 4u, (uint64_t)"phLibNfc_SeSvddCtrlSeqComplete: Se SVDDD Success");
      v5 = 145;
    }
    v6 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v5, a2, 0, 0);
  }
  else
  {
    v6 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeSvddCtrlSeqComplete");
  return v6;
}

uint64_t sub_2198DF35C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  void (*v7)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VirtualeSeRecoveryComp");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      v4 = 66;
    }
    else
    {
      if (*(_DWORD *)(a1 + 700) == 2)
        v5 = 3;
      else
        v5 = 2;
      *(_DWORD *)(a1 + 404) = 2 * (*(_DWORD *)(a1 + 700) == 2);
      sub_2198D2A2C(*(_QWORD *)(a1 + 19360), 1u, v5);
      *(_BYTE *)(a1 + 318) = 1;
      v4 = 65;
    }
    if (*(_QWORD *)(a1 + 6536) || *(_QWORD *)(a1 + 6296) || *(_QWORD *)(a1 + 6312))
    {
      sub_2198DFF6C(a1, v4);
    }
    else
    {
      v7 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t))(a1 + 6696);
      if (v7)
      {
        v8 = *(_QWORD *)(a1 + 6704);
        sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_VirtualeSeRecoveryComp :EvtESERemoved");
        v7(*(_QWORD *)(a1 + 19360), v8, 16, *(_QWORD *)(a1 + 392), 0, v4);
      }
    }
    if ((_DWORD)a2)
      *(_DWORD *)(a1 + 404) = 4;
    *(_BYTE *)(a1 + 507) = 0;
    sub_2198D27D4(*(_QWORD *)(a1 + 19360), 0);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VirtualeSeRecoveryComp");
  return a2;
}

uint64_t sub_2198DF498(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeGetRfCfg");
  if (a1)
    v2 = sub_2198FE090(*(_QWORD *)(a1 + 3040), a1 + 3560, (uint64_t)sub_219865DD0, a1);
  else
    v2 = 0;
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeGetRfCfg");
  return v2;
}

uint64_t sub_2198DF518(unsigned int *a1, uint64_t a2)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SeGetRfCfgProc");
  if (!a1)
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SeGetRfCfgProc: Invalid input parameter");
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SeGetRfCfgProc");
  return a2;
}

uint64_t sub_2198DF594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v8;
  _BYTE *Memory;
  uint64_t v10;
  uint64_t i;
  uint64_t j;
  uint64_t k;
  uint64_t m;
  uint64_t n;
  uint64_t ii;
  uint64_t jj;
  uint64_t kk;
  uint64_t mm;
  uint64_t v20;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeGetRfCfgSeqComplete");
  if (!a1)
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid LibNfc context passed by lower layer");
    sub_2198EEA6C(0xFFu);
    phOsalNfc_RaiseException();
    goto LABEL_5;
  }
  v6 = a2;
  if ((_DWORD)a2)
    goto LABEL_3;
  if (!a3)
  {
    a2 = 0;
    v6 = 255;
    goto LABEL_3;
  }
  if ((*(_BYTE *)(a3 + 5) & 0x20) == 0)
  {
LABEL_8:
    v6 = 0;
    a2 = 255;
LABEL_3:
    sub_2198D1B2C(*(_QWORD *)(a1 + 19360), 146, a2, 0, 0);
    a2 = v6;
    goto LABEL_5;
  }
  if ((*(_WORD *)(a3 + 1144) & 0x200) != 0)
  {
    v8 = (_BYTE *)(a3 + 1177);
  }
  else if ((*(_WORD *)(a3 + 1144) & 0x400) != 0)
  {
    v8 = (_BYTE *)(a3 + 1246);
  }
  else
  {
    if ((*(_WORD *)(a3 + 1144) & 0x100) == 0)
      goto LABEL_8;
    v8 = (_BYTE *)(a3 + 1315);
  }
  Memory = (_BYTE *)phOsalNfc_GetMemory();
  v10 = (uint64_t)Memory;
  *Memory = *v8;
  Memory[1] = v8[1];
  Memory[2] = v8[2];
  for (i = 3; i != 13; ++i)
    Memory[i] = v8[i];
  Memory[13] = v8[13];
  Memory[14] = v8[14];
  Memory[15] = v8[15];
  Memory[16] = v8[16];
  for (j = 17; j != 32; ++j)
    Memory[j] = v8[j];
  Memory[32] = v8[32];
  Memory[33] = v8[33];
  Memory[34] = v8[34];
  for (k = 35; k != 38; ++k)
    Memory[k] = v8[k];
  Memory[38] = v8[38];
  Memory[39] = v8[39];
  Memory[40] = v8[40];
  for (m = 41; m != 45; ++m)
    Memory[m] = v8[m];
  Memory[45] = v8[45];
  for (n = 46; n != 50; ++n)
    Memory[n] = v8[n];
  Memory[50] = v8[50];
  for (ii = 51; ii != 66; ++ii)
    Memory[ii] = v8[ii];
  do
  {
    Memory[ii] = v8[ii];
    ++ii;
  }
  while (ii != 69);
  v20 = *(_QWORD *)(a1 + 19360);
  sub_219850718(0, (unsigned int *)&v20, 4u, 5u, (uint64_t)"phLibNfc_DisplaySeRFParameters");
  sub_219850628(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"RF Technology A parameters");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"PipeStatusCeA ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bModeCeA ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bUidRegSizeCeA ");
  for (jj = 3; jj != 13; ++jj)
    sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aUidRegCeA ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bSakCeA ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aATQACeA[0] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aATQACeA[1] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bApplicationDataSizeCeA ");
  for (kk = 17; kk != 32; ++kk)
    sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aApplicationDataCeA ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bFWI_SFGICeA ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bCidSupportCeA ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bCltSupportCeA ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aDataRateMaxCeA[0] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aDataRateMaxCeA[1] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aDataRateMaxCeA[2] ");
  sub_219850628(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"RF Technology B parameters");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bPipeStatusCeB ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bModeCeB ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aPupiRegCeB[0] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aPupiRegCeB[1] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aPupiRegCeB[2] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aPupiRegCeB[3] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bAfiCeB ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aATQBCeB[0] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aATQBCeB[1] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aATQBCeB[2] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aATQBCeB[3] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"bHighLayerRspSizeCeB ");
  for (mm = 51; mm != 66; ++mm)
    sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aHighLayerRspCeB ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aDataRateMaxCeB[0] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aDataRateMaxCeB[1] ");
  sub_219851888(0, (unsigned int *)&v20, 4u, 4u, (uint64_t)"aDataRateMaxCeB[2] ");
  sub_219850808(0, (unsigned int *)&v20, 4u, 5u, (uint64_t)"phLibNfc_DisplaySeRFParameters");
  sub_2198D1B2C(*(_QWORD *)(a1 + 19360), 145, 0, v10, 0);
  phOsalNfc_FreeMemory();
  a2 = 0;
LABEL_5:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeGetRfCfgSeqComplete");
  return a2;
}

uint64_t sub_2198DFCC4(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v4;
  uint64_t v5;
  unint64_t i;
  uint64_t v7;
  int v8;
  char v9;
  const char *v10;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_UpdateNfceeDiscTechnType");
  if (a2)
  {
    v4 = *a2;
    if (*a2)
    {
      v5 = 0;
      for (i = 0; i < v4; ++i)
      {
        v7 = *((_QWORD *)a2 + 1);
        if (*(unsigned __int8 *)(v7 + v5) <= 1u)
        {
          v8 = *(_DWORD *)(v7 + v5 + 4);
          if (v8 <= 127)
          {
            if (!v8)
            {
              v9 = 1;
              v10 = "phLibNfc_UpdateNfceeDiscTechnType: poll Nfc-A tech supp";
              goto LABEL_16;
            }
            if (v8 == 1)
            {
              v9 = 2;
              v10 = "phLibNfc_UpdateNfceeDiscTechnType: poll Nfc-B tech supp";
              goto LABEL_16;
            }
          }
          else
          {
            switch(v8)
            {
              case 128:
                v9 = 1;
                v10 = "phLibNfc_UpdateNfceeDiscTechnType: Listen Nfc-A tech supp";
                goto LABEL_16;
              case 130:
                v9 = 4;
                v10 = "phLibNfc_UpdateNfceeDiscTechnType: Listen Nfc-F tech supp";
                goto LABEL_16;
              case 129:
                v9 = 2;
                v10 = "phLibNfc_UpdateNfceeDiscTechnType: Listen Nfc-B tech supp";
LABEL_16:
                *(_BYTE *)(a1 + 313) |= v9;
                sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v10);
                v4 = *a2;
                break;
            }
          }
        }
        v5 += 12;
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_UpdateNfceeDiscTechnType");
}

uint64_t sub_2198DFE2C(uint64_t a1)
{
  void (*v2)(_QWORD, uint64_t, uint64_t);
  uint64_t v3;
  void (*v4)(_QWORD, uint64_t, _QWORD, uint64_t);
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MuxCheckAbortTrans");
  if (*(_QWORD *)(a1 + 6744) || *(_QWORD *)(a1 + 6760))
  {
    sub_2199004B4(*(_QWORD *)(a1 + 3040), 3);
    v2 = *(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 6744);
    if (v2)
    {
      v3 = *(_QWORD *)(a1 + 6752);
      *(_QWORD *)(a1 + 6744) = 0;
      *(_QWORD *)(a1 + 6752) = 0;
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 31, (uint64_t)"phLibNfc_MuxCheckAbortTrans");
      v2(*(_QWORD *)(a1 + 19360), v3, 255);
    }
    else
    {
      v4 = *(void (**)(_QWORD, uint64_t, _QWORD, uint64_t))(a1 + 6760);
      if (v4)
      {
        v5 = *(_QWORD *)(a1 + 6768);
        *(_QWORD *)(a1 + 6760) = 0;
        *(_QWORD *)(a1 + 6768) = 0;
        sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 30, (uint64_t)"phLibNfc_MuxCheckAbortTrans");
        v4(*(_QWORD *)(a1 + 19360), v5, 0, 255);
      }
    }
  }
  if (*(_QWORD *)(a1 + 6296) || *(_QWORD *)(a1 + 6536) || *(_QWORD *)(a1 + 6312))
    sub_2199004B4(*(_QWORD *)(a1 + 3040), 3);
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_MuxCheckAbortTrans");
}

uint64_t sub_2198DFF6C(uint64_t a1, uint64_t a2)
{
  const char *v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phHciNfc_ProcessSERemovedNtf");
  if (*(_QWORD *)(a1 + 6536))
  {
    sub_2198E0AAC(a1, a2, 0);
    if ((_DWORD)a2 == 65)
    {
      v4 = "Rxd eSE Removed Ntf, eSE Get ATR CB Invoked";
LABEL_9:
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v4);
    }
  }
  else
  {
    if (!*(_QWORD *)(a1 + 6296) && !*(_QWORD *)(a1 + 6312))
    {
      v4 = "phLibNfc_UpdateSeInfo:No Upper layer Invoked";
      goto LABEL_9;
    }
    sub_2198DCE40(a1, a2, 0);
    if ((_DWORD)a2 == 65)
    {
      v4 = "phLibNfc_UpdateSeInfo:Rxd eSE Removed Ntf, eSE Transeive CB Invoked";
      goto LABEL_9;
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phHciNfc_ProcessSERemovedNtf");
}

uint64_t sub_2198E0040(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  int v5;
  uint64_t (**v6)();
  const char *v7;
  const char *v8;
  int v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t (*v13)();
  uint64_t *v14;
  uint64_t v15;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LaunchChildDeviceSequence");
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + a2 + 315) == 2)
      goto LABEL_10;
    v4 = a1 + 16 * a2;
    if (!*(_QWORD *)(v4 + 344))
      goto LABEL_10;
    *(_DWORD *)(a1 + 544) = 100;
    *(_BYTE *)(a1 + 2881) = 10;
    *(_BYTE *)(a1 + 322) = 1;
    *(_QWORD *)(a1 + 512) = v4 + 344;
    v5 = *(_DWORD *)(v4 + 352);
    if (v5 == 2)
    {
      v6 = off_2550A3748;
      v7 = "UICC Sequence";
    }
    else if (v5 == 7)
    {
      v6 = off_2550A3788;
      v7 = "SE2 Sequence";
    }
    else
    {
      v6 = off_2550A37C8;
      v7 = "eSE Sequence";
    }
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v7);
    *(_QWORD *)(a1 + 2912) = v6;
    *(_BYTE *)(a1 + 2904) = 0;
    *(_BYTE *)(a1 + 2906) = 0;
    v13 = *v6;
    if (*v6)
    {
      LOBYTE(v13) = 0;
      v14 = (uint64_t *)(v6 + 2);
      do
      {
        LOBYTE(v13) = (_BYTE)v13 + 1;
        v15 = *v14;
        v14 += 2;
      }
      while (v15);
    }
    *(_BYTE *)(a1 + 2905) = (_BYTE)v13;
    if (sub_2198655FC(a1, 0, 0) == 13)
    {
      sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_LaunchChildDeviceSequence:Started for SE Type");
      v11 = 13;
      goto LABEL_11;
    }
    v8 = "phLibNfc_LaunchChildDeviceSequence:Could not start!";
    v9 = 1;
    v10 = (unsigned int *)(a1 + 19368);
  }
  else
  {
    v8 = "phLibNfc_LaunchChildDeviceSequence:Invalid LibContext or HCI Network ID Passed";
    v9 = 2;
    v10 = (unsigned int *)a1;
  }
  sub_219850628(v9, v10, 4u, 1u, (uint64_t)v8);
LABEL_10:
  v11 = 255;
LABEL_11:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LaunchChildDeviceSequence");
  return v11;
}

uint64_t sub_2198E01F8(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, _QWORD);
  _OWORD v9[2];
  uint64_t v10;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  result = sub_21988629C(2, (unsigned int *)a2, a1, 4u, 4u, (uint64_t)"phLibNfc_eSEVasNtfTimeOutCb");
  if (a2)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 2);
      if ((v4 & 1) != 0)
        break;
      v4 = 1;
      v5 = 1;
    }
    while (v6 != a2);
    if (v6 == a2)
    {
      phOsalNfc_SetMemory();
      v7 = *(_QWORD *)(a2 + 720);
      if (v7 && v7 != 0xFFFFFFFFFFFFLL)
      {
        phOsalNfc_Timer_Delete();
        *(_QWORD *)(a2 + 720) = 0xFFFFFFFFFFFFLL;
      }
      LODWORD(v9[0]) = *(_DWORD *)(a2 + 1360);
      *(_DWORD *)(a2 + 1360) = 6;
      phOsalNfc_SetMemory();
      result = phOsalNfc_SetMemory();
      *(_BYTE *)(a2 + 1401) = 0;
      v8 = *(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, _QWORD))(a2 + 6696);
      if (v8)
        return v8(*(_QWORD *)(a2 + 19360), *(_QWORD *)(a2 + 6704), 24, *(_QWORD *)(a2 + 392), v9, 0);
    }
  }
  return result;
}

uint64_t sub_2198E0330(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *i;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetSeRmvdReasonCode");
  if (a2)
  {
    v6 = *(unsigned __int8 *)(a3 + 24);
    if (*(_BYTE *)(a3 + 24))
    {
      for (i = (_BYTE *)(a3 + 52); *((_DWORD *)i - 5) != 160 || *((_DWORD *)i - 4) != 1; i += 24)
      {
        if (!--v6)
          return sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetSeRmvdReasonCode");
      }
      *(_DWORD *)a2 = *((_DWORD *)i - 1);
      *(_BYTE *)(a2 + 4) = *i;
    }
  }
  return sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetSeRmvdReasonCode");
}

uint64_t sub_2198E03D8(unsigned int *a1, int a2, int a3, int *a4)
{
  int v8;
  _DWORD *v9;
  int v10;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeTransEvent");
  if (a4)
  {
    switch(a3)
    {
      case 0:
        v8 = a2 - 1;
        if ((a2 - 1) < 7 && ((0x53u >> v8) & 1) != 0)
        {
          v9 = &unk_21990AFCC;
          goto LABEL_12;
        }
        break;
      case 1:
        v8 = a2 - 1;
        if ((a2 - 1) < 7 && ((0x53u >> v8) & 1) != 0)
        {
          v9 = &unk_21990AFB0;
LABEL_12:
          v10 = v9[v8];
          goto LABEL_19;
        }
        break;
      case 2:
        if (a2 == 1)
        {
          v10 = 168;
          goto LABEL_19;
        }
        if (a2 == 7)
        {
          v10 = 183;
          goto LABEL_19;
        }
        break;
      case 4:
        if (a2 == 1)
        {
          v10 = 165;
          goto LABEL_19;
        }
        break;
      default:
        if (a2 == 1 && a3 == 3)
        {
          v10 = 166;
LABEL_19:
          *a4 = v10;
        }
        break;
    }
  }
  return sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeTransEvent");
}

uint64_t sub_2198E04F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  _BOOL8 v6;
  unsigned int *v7;
  const char *v8;
  int v10;
  uint64_t v11;
  int v12;
  unsigned int v13;
  char v14;
  unsigned __int8 *v15;
  int v16;
  _OWORD v17[2];
  uint64_t v18;
  unsigned __int8 v19;

  v19 = -1;
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  sub_219850718(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe");
  if (!a1)
    return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe");
  v5 = *(_QWORD *)(a1 + 960);
  if (!v5)
    return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe");
  if (!a3)
  {
    v7 = (unsigned int *)(v5 + 19368);
    v8 = "phLibNfc_OsResetRcvd_AdminPipe: pReceivedParams Invalid";
    goto LABEL_12;
  }
  if (!*(_QWORD *)(a3 + 8) || !*(_WORD *)(a3 + 4))
  {
    v7 = (unsigned int *)(v5 + 19368);
    v8 = "phLibNfc_OsResetRcvd_AdminPipe: SE OS Reset, Pipe Info error";
LABEL_12:
    sub_219850628(1, v7, 4u, 1u, (uint64_t)v8);
    return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe");
  }
  if (*(_BYTE *)(v5 + 2944) != 1)
  {
    sub_219851888(1, (unsigned int *)(v5 + 19368), 4u, 2u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe: Ignoring eSE OS Reset, PipeID on Admin Pipe");
    return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe");
  }
  v6 = *(unsigned __int8 *)(a1 + 1235) == 1;
  if (*(_QWORD *)(v5 + 6312))
  {
    sub_21988E9C8(a1, *(_DWORD *)(v5 + 648), (char *)&v19);
    if (v19 == 255)
      v19 = *(_BYTE *)(v5 + 608);
    goto LABEL_20;
  }
  if (*(_QWORD *)(v5 + 6296))
  {
    v10 = *(_DWORD *)(v5 + 596);
    v11 = a1;
LABEL_19:
    sub_21988E9C8(v11, v10, (char *)&v19);
    goto LABEL_20;
  }
  if (*(_QWORD *)(v5 + 6536))
  {
    v11 = a1;
    v10 = 0;
    goto LABEL_19;
  }
LABEL_20:
  v12 = v19;
  *(_BYTE *)(a1 + 1232) = v19;
  v13 = **(unsigned __int8 **)(a3 + 8);
  *(_BYTE *)(a1 + v6 + 1233) = v13;
  if (*(unsigned __int16 *)(a3 + 4) < 2u)
    v14 = -1;
  else
    v14 = *(_BYTE *)(*(_QWORD *)(a3 + 8) + 1);
  v15 = (unsigned __int8 *)(a1 + v6 + 1233);
  *(_BYTE *)(a1 + 1236) = v14;
  if (v13 == v12 && (*(_QWORD *)(v5 + 6296) || *(_QWORD *)(v5 + 6312) || *(_QWORD *)(v5 + 6536)))
  {
    sub_219850628(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Aborting HCI Data");
    sub_2199004B4(*(_QWORD *)(v5 + 3040), 1);
    v13 = *v15;
    v16 = v19;
  }
  else
  {
    v16 = 255;
    v19 = -1;
  }
  if (v13 != v16)
  {
    if (*(_QWORD *)(v5 + 6696))
    {
      phOsalNfc_SetMemory();
      LODWORD(v17[0]) = sub_21988E8F0(*(_DWORD *)(v5 + 19368), *v15);
      BYTE4(v17[0]) = *(_BYTE *)(a1 + 1236);
      sub_219851888(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Invoke SE-listner Ntf CB with Os Reset, PipeID");
      sub_219853E34(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"OsResetRcvd_AdminPipe:pSeListenerNtfCb[OS Reset Ntf]");
      (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, uint64_t))(v5 + 6696))(*(_QWORD *)(v5 + 19360), *(_QWORD *)(v5 + 6704), 27, *(_QWORD *)(v5 + 392), v17, 217);
    }
    else if (*(_QWORD *)(v5 + 6056) && *(_QWORD *)(v5 + 6568))
    {
      LODWORD(v17[0]) = sub_21988E8F0(*(_DWORD *)(v5 + 19368), v13);
      BYTE4(v17[0]) = *(_BYTE *)(a1 + 1236);
      sub_219851888(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Invoke General Ntf CB with Os Reset (during Init), PipeID");
      sub_219853E34(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"OsResetRcvd_AdminPipe:pGenericNtfCb[OS Reset Ntf During Init]");
      (*(void (**)(_QWORD, _QWORD, uint64_t, _OWORD *))(v5 + 6568))(*(_QWORD *)(v5 + 19360), *(_QWORD *)(v5 + 6576), 217, v17);
    }
  }
  sub_219851888(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Sending through admin pipe, os_reset_Acknowledgement for OS with pipeid");
  sub_219885FF8(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Sending through admin pipe, os_reset_Acknowledgement for OS @");
  if (sub_2198DCCDC(a1, *(_BYTE *)a3, 12, 1, 1, (uint64_t)v15, (uint64_t)sub_219865DD0) == 13)
  {
    *(_BYTE *)(a1 + 1235) = 1;
    *(_QWORD *)(a1 + 184) = sub_2198E0968;
    *(_QWORD *)(a1 + 192) = v5;
  }
  else
  {
    sub_219851888(1, (unsigned int *)(v5 + 19368), 4u, 2u, (uint64_t)"Sending os_reset_Acknowledgement failed for OS with pipeid");
    if (*(unsigned __int8 *)(a1 + 1232) == *v15)
    {
      if (*(_QWORD *)(v5 + 6296) || *(_QWORD *)(v5 + 6312))
      {
        sub_219850628(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Invoke Transcv Response CB");
        sub_2198DCE40(v5, 217, 0);
      }
      else if (*(_QWORD *)(v5 + 6536))
      {
        sub_219850628(1, (unsigned int *)(v5 + 19368), 4u, 4u, (uint64_t)"Invoke Get Atr Response CB");
        sub_2198E0AAC(v5, 217, 0);
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_OsResetRcvd_AdminPipe");
}

uint64_t sub_2198E0968(uint64_t a1, int a2)
{
  uint64_t v4;
  unsigned __int8 *v6;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeOsResetRsp_SendCb");
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 464);
    if (v4)
    {
      sub_219885FF8(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_SeOsResetRsp_SendCb rcvd pdata @");
      *(_BYTE *)(v4 + 1235) = 0;
      if (a2)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"SeSendCb: Call back received with sttus != success");
      }
      else
      {
        v6 = *(unsigned __int8 **)(v4 + 16);
        if (v6 && *(unsigned __int8 *)(v4 + 1232) == *v6)
        {
          if (*(_QWORD *)(a1 + 6296) || *(_QWORD *)(a1 + 6312))
          {
            sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Invoke Transcv Response CB");
            sub_2198DCE40(a1, 217, 0);
          }
          else if (*(_QWORD *)(a1 + 6536))
          {
            sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Invoke Get Atr Response CB");
            sub_2198E0AAC(a1, 217, 0);
          }
        }
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeOsResetRsp_SendCb");
}

uint64_t sub_2198E0AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  unsigned int *v17;
  const char *v18;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_eSE_GetAtrProc");
  if (a1)
  {
    v6 = *(_QWORD *)(a1 + 464);
    if (!v6)
      goto LABEL_13;
    v7 = *(_QWORD *)(v6 + 856);
    if (v7)
      v8 = v7 == 0xFFFFFFFFFFFFLL;
    else
      v8 = 1;
    if (!v8)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(_QWORD *)(v6 + 856) = 0xFFFFFFFFFFFFLL;
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_HciDataSendProc:SE Get Atr Timer Deleted");
    }
    v9 = *(_QWORD *)(v6 + 872);
    if (!v9 || v9 == 0xFFFFFFFFFFFFLL)
    {
LABEL_13:
      if ((_DWORD)a2)
        goto LABEL_22;
    }
    else
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phHciNfc_HciCmdRspCb : HCI Command Response timer deleted successfully");
      *(_DWORD *)(v6 + 884) = 2000;
      *(_QWORD *)(v6 + 872) = 0xFFFFFFFFFFFFLL;
      if ((_DWORD)a2)
        goto LABEL_22;
    }
    if (a3)
    {
      if (*(_QWORD *)(a1 + 464))
      {
        v11 = sub_2198DD268(a1);
        if ((_DWORD)v11 == 111)
        {
          v12 = *(_QWORD *)(a1 + 552);
          if (v12 && (v13 = *(unsigned __int16 *)(a3 + 4), *(_DWORD *)(v12 + 8) >= v13))
          {
            *(_DWORD *)(v12 + 8) = v13;
            phOsalNfc_MemCopy();
            sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_eSE_GetAtrProc: Sucessfull");
            a2 = 0;
            v14 = 192;
          }
          else
          {
            sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_eSE_GetAtrProc: Invalid Input Buffer Length");
            v14 = 193;
            a2 = 3;
          }
        }
        else
        {
          a2 = v11;
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_eSE_GetAtrProc:eSE Get Atr received data after Timeout!!!");
          v14 = 193;
        }
        goto LABEL_41;
      }
      v17 = (unsigned int *)(a1 + 19368);
      v18 = "phLibNfc_eSE_GetAtrProc: Invalid Hci context received!";
      goto LABEL_36;
    }
LABEL_22:
    v15 = *(_QWORD *)(a1 + 552);
    if (v15)
      *(_DWORD *)(v15 + 8) = 0;
    v14 = 193;
    if ((int)a2 > 216)
    {
      if ((_DWORD)a2 == 218)
      {
LABEL_41:
        sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v14, a2, 0, 0);
        return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_eSE_GetAtrProc");
      }
      if ((_DWORD)a2 == 217)
      {
        if (v15)
        {
          if (v6)
            v16 = *(_BYTE *)(v6 + 1236);
          else
            v16 = -1;
          *(_BYTE *)(v15 + 12) = v16;
        }
        a2 = 217;
        goto LABEL_41;
      }
    }
    else if ((a2 - 65) < 2 || (_DWORD)a2 == 214)
    {
      goto LABEL_41;
    }
    v17 = (unsigned int *)(a1 + 19368);
    v18 = "phLibNfc_eSE_GetAtrProc: Received FAILED status or pInfo Invalid";
LABEL_36:
    sub_219850628(1, v17, 4u, 1u, (uint64_t)v18);
    v14 = 193;
    a2 = 255;
    goto LABEL_41;
  }
  sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_eSE_GetAtrProc: LibNfc context invalid");
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_eSE_GetAtrProc");
}

uint64_t sub_2198E0D68(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciEvtEndofOptRcvd");
  if (a1)
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"HciEvtEndofOptRcvd: Evt End Of Operation received");
    *(_BYTE *)(a1 + 504) = 1;
    v2 = *(_QWORD *)(a1 + 536);
    if (v2 && v2 != 0xFFFFFFFFFFFFLL && *(_DWORD *)(a1 + 544) == 4000)
    {
      phOsalNfc_Timer_Stop();
      sub_21988629C(1, (unsigned int *)(a1 + 19368), v2, 4u, 4u, (uint64_t)"phLibNfc_HciEvtEndofOptRcvd");
      phOsalNfc_Timer_Delete();
      *(_QWORD *)(a1 + 536) = 0xFFFFFFFFFFFFLL;
      *(_DWORD *)(a1 + 544) = 0;
      *(_BYTE *)(a1 + 2881) = 0;
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"HciEvtEndofOptRcvd: SE Mode Set timer, stopping the timer");
      sub_2198655FC(a1, 0, 0);
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"HciEvtEndofOptRcvd: Fast ntf received and dropped");
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HciEvtEndofOptRcvd");
}

uint64_t sub_2198E0EB0(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_219850718(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_InvokeSeNtfCallback");
  if (a1)
  {
    v10 = *(_QWORD *)(a1 + 960);
    if (v10)
    {
      v11 = 0;
      v12 = 0;
      do
      {
        if (*(unsigned __int8 *)(a1 + 832) == a4 && *(_DWORD *)(v10 + v11 + 352) == 2
          || (*(unsigned __int8 *)(a1 + 816) == a4 || *(unsigned __int8 *)(a1 + 818) == a4)
          && *(_DWORD *)(v10 + v11 + 352) == 1)
        {
          v12 = *(_QWORD *)(v10 + v11 + 344);
        }
        v11 += 16;
      }
      while (v11 != 80);
      if (a2 && *(_QWORD *)(v10 + 6696))
      {
        sub_219853E34(1, (unsigned int *)(v10 + 19368), 4u, 4u, (uint64_t)"InvokeSeNtfCallback :HCI Events");
        (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 6696))(*(_QWORD *)(v10 + 19360), *(_QWORD *)(v10 + 6704), a5, v12, a2, a3);
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phLibNfc_InvokeSeNtfCallback");
}

uint64_t sub_2198E0FE0(uint64_t a1, int a2, unsigned __int8 *a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VerifyRxdRtngTable");
  if (a1 && !a2 && a3)
  {
    if (*a3 != *(unsigned __int8 *)(a1 + 312))
      goto LABEL_28;
    v6 = *(_QWORD *)(a1 + 328);
    sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"VerifyRoutingTable");
    if (!v6)
      goto LABEL_24;
    v7 = 0;
    LODWORD(v8) = *a3;
LABEL_7:
    if ((_DWORD)v8)
    {
      v9 = 0;
      v10 = v6;
      do
      {
        v11 = *((_QWORD *)a3 + 1);
        v12 = *(_DWORD *)(v11 + 32 * v7);
        if (v12 == *(_DWORD *)v10)
        {
          if (v12 == 2)
          {
            if (*(unsigned __int8 *)(v11 + 32 * v7 + 28) == *(unsigned __int8 *)(v10 + 28)
              && !phOsalNfc_MemCompare())
            {
              v14 = *((_QWORD *)a3 + 1) + 32 * v7;
              if (*(unsigned __int8 *)(v14 + 4) == *(unsigned __int8 *)(v10 + 4)
                && ((*(_BYTE *)(v10 + 8) ^ *(_BYTE *)(v14 + 8)) & 7) == 0)
              {
                LODWORD(v8) = *a3;
LABEL_23:
                if (++v7 >= (unint64_t)v8)
                {
LABEL_24:
                  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"VerifyRoutingTable");
                  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_VerifyRxdRtngTable: Routing Table configuration Success");
                  goto LABEL_26;
                }
                goto LABEL_7;
              }
            }
          }
          else if (v12 <= 1)
          {
            v13 = v11 + 32 * v7;
            if (*(_DWORD *)(v13 + 12) == *(_DWORD *)(v10 + 12)
              && *(unsigned __int8 *)(v13 + 4) == *(unsigned __int8 *)(v10 + 4)
              && ((*(_BYTE *)(v10 + 8) ^ *(_BYTE *)(v11 + 32 * v7 + 8)) & 7) == 0)
            {
              goto LABEL_23;
            }
          }
        }
        ++v9;
        v8 = *a3;
        v10 += 32;
      }
      while (v9 < v8);
    }
    sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"VerifyRoutingTable");
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_VerifyRxdRtngTable: Routing Table configuration failed");
LABEL_28:
    v15 = 255;
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_VerifyRxdRtngTable: Routing Table configuration failed");
LABEL_26:
    v15 = 0;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VerifyRxdRtngTable");
  return v15;
}

uint64_t sub_2198E1240(unsigned int *a1, int a2, int a3, int *a4)
{
  BOOL v8;
  int v9;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeIntEvent");
  if (a4)
  {
    *a4 = 235;
    switch(a2)
    {
      case 1:
        v8 = a3 == 0;
        v9 = 192;
        goto LABEL_7;
      case 2:
        v8 = a3 == 0;
        v9 = 196;
        goto LABEL_7;
      case 5:
        v8 = a3 == 0;
        v9 = 188;
        goto LABEL_7;
      case 7:
        v8 = a3 == 0;
        v9 = 200;
LABEL_7:
        if (!v8)
          ++v9;
        *a4 = v9;
        break;
      default:
        return sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeIntEvent");
    }
  }
  return sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_FindSetModeIntEvent");
}

uint64_t sub_2198E1308(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  int *v11;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_InitCompleteWdTimer");
  if (!a1)
    goto LABEL_6;
  v2 = 0;
  v3 = 0;
  do
  {
    v4 = *((_QWORD *)&unk_253E46700 + 14 * v3 + 2);
    if ((v2 & 1) != 0)
      break;
    v2 = 1;
    v3 = 1;
  }
  while (v4 != a1);
  if (v4 != a1)
  {
LABEL_6:
    v5 = 1;
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid LibNfc context passed");
    goto LABEL_16;
  }
  v6 = phOsalNfc_Timer_Create();
  if (v6)
    v7 = v6 == 0xFFFFFFFFFFFFLL;
  else
    v7 = 1;
  if (v7)
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to create Timer!");
LABEL_15:
    v5 = 255;
    goto LABEL_16;
  }
  v8 = v6;
  if (phOsalNfc_Timer_Start())
  {
    phOsalNfc_Timer_Delete();
    *(_QWORD *)(a1 + 2888) = 0;
    goto LABEL_15;
  }
  sub_21988629C(1, (unsigned int *)(a1 + 19368), v8, 4u, 4u, (uint64_t)"phLibNfc_InitCompleteWdTimer");
  v5 = 0;
  if (*(_DWORD *)(a1 + 19368))
    v11 = &dword_253E47158;
  else
    v11 = &dword_253E47070;
  v11[1] &= ~0x2000000u;
  *(_QWORD *)(a1 + 2888) = v8;
  *(_BYTE *)(a1 + 2880) = 8;
LABEL_16:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_InitCompleteWdTimer");
  return v5;
}

uint64_t sub_2198E14B4(uint64_t a1, unsigned int *a2)
{
  unsigned int *v2;
  char v4;
  uint64_t v5;
  unsigned int *v6;
  char v8;
  int *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;

  v2 = a2;
  sub_21988629C(2, a2, a1, 4u, 4u, (uint64_t)"phLibNfc_InitCompleteWdTimerCb");
  sub_219850718(2, v2, 4u, 5u, (uint64_t)"phLibNfc_InitCompleteWdTimerCb");
  if (v2)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = (unsigned int *)*((_QWORD *)&unk_253E46700 + 14 * v5 + 2);
      if ((v4 & 1) != 0)
        break;
      v4 = 1;
      v5 = 1;
    }
    while (v6 != v2);
    if (v6 == v2)
    {
      if (*((_BYTE *)v2 + 2880))
      {
        sub_219850628(1, v2 + 4842, 4u, 4u, (uint64_t)"\n\nTimer expired: Restarting timer");
        sub_2198EF82C(v2[4842], a1);
        if (phOsalNfc_Timer_Start())
        {
          sub_219850628(1, v2 + 4842, 4u, 2u, (uint64_t)"\n\nTimer expired: Failed to restarting timer");
          if (a1 && a1 != 0xFFFFFFFFFFFFLL)
          {
            phOsalNfc_Timer_Stop();
            phOsalNfc_Timer_Delete();
            *((_QWORD *)v2 + 361) = 0xFFFFFFFFFFFFLL;
          }
        }
        else
        {
          v13 = &dword_253E47158;
          if (!v2[4842])
            v13 = &dword_253E47070;
          v13[1] &= ~0x2000000u;
          sub_21988629C(1, v2 + 4842, a1, 4u, 4u, (uint64_t)"phLibNfc_InitCompleteWdTimerCb");
          --*((_BYTE *)v2 + 2880);
          sub_219851790(1, v2 + 4842, 4u, 4u, (uint64_t)"\n\nTimer Count");
        }
      }
      else
      {
        v8 = sub_219899740(v2, *((_QWORD *)v2 + 364));
        if (v2[4842])
          v9 = &dword_253E47158;
        else
          v9 = &dword_253E47070;
        v10 = v9[1] | 0x2000000;
        *v9 = *v9 & 0xFFFE003F | ((v8 & 0x3F) << 11) | ((v2[726] & 0x1F) << 6);
        v9[1] = v10;
        sub_219850628(1, v2 + 4842, 4u, 2u, (uint64_t)"\n\nTimer expired: Timer restart count reached limit");
        if (a1 && a1 != 0xFFFFFFFFFFFFLL)
        {
          phOsalNfc_Timer_Stop();
          phOsalNfc_Timer_Delete();
          *((_QWORD *)v2 + 361) = 0xFFFFFFFFFFFFLL;
        }
        sub_219889084(*((_QWORD *)v2 + 58));
        v11 = *((_QWORD *)v2 + 67);
        if (v11 && v11 != 0xFFFFFFFFFFFFLL)
        {
          sub_219850628(1, v2 + 4842, 4u, 4u, (uint64_t)"SeModeSet/DelayForSE Ntf timer is still active, stopping and deleting the same");
          phOsalNfc_Timer_Stop();
          phOsalNfc_Timer_Delete();
          *((_QWORD *)v2 + 67) = 0xFFFFFFFFFFFFLL;
        }
        *((_BYTE *)v2 + 2881) = 0;
        v2[136] = 0;
        if (*((_BYTE *)v2 + 2883) == 1)
          v12 = 137;
        else
          v12 = 255;
        sub_219898F04(v2, v12);
        v2 = 0;
      }
    }
  }
  return sub_219850808(2, v2, 4u, 5u, (uint64_t)"phLibNfc_InitCompleteWdTimerCb");
}

uint64_t sub_2198E17B0(uint64_t a1)
{
  BOOL v2;
  char v3;
  int v4;
  uint64_t v5;
  _DWORD v7[283];
  char v8;
  char v9;
  char v10;
  BOOL v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  bzero(v7, 0x6E8uLL);
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SwpIntfControl");
  if (a1)
  {
    v7[1] = 0x2000;
    v2 = *(_BYTE *)(a1 + 2946) == 0;
    if (*(_BYTE *)(a1 + 2946))
      v3 = 4;
    else
      v3 = 5;
    v8 = v3;
    v4 = *(_DWORD *)(a1 + 440);
    v9 = v2 & v4;
    v11 = (v4 & 2) != 0;
    v10 = 0;
    v5 = sub_2198FD4A4(*(_QWORD *)(a1 + 3040), (uint64_t)v7, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v5 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SwpIntfControl");
  return v5;
}

uint64_t sub_2198E18B0(unsigned int *a1)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SwpIntfControlProc");
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SwpIntfControlProc");
  return 0;
}

uint64_t sub_2198E1908(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DelayForSeNtf");
  if (a1 && !(_DWORD)a2)
  {
    if (*(_BYTE *)(a1 + 704) == 1 && (*(_DWORD *)(a1 + 440) & 0xB) == 2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_DelayForSeNtf: Do not start the InitModeSet Timer, returning SUCCESS\n");
      a2 = 0;
      *(_BYTE *)(a1 + 704) = 0;
    }
    else if (*(_DWORD *)(a1 + 544))
    {
      sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"DelayForSeNtf: Delay Timer(ms) ");
      sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"DelayForSeNtf: Timer Count");
      v4 = phOsalNfc_Timer_Create();
      a2 = 12;
      if (v4)
      {
        v5 = v4;
        if (v4 != 0xFFFFFFFFFFFFLL)
        {
          if (phOsalNfc_Timer_Start())
          {
            phOsalNfc_Timer_Delete();
            a2 = 255;
          }
          else
          {
            sub_21988629C(1, (unsigned int *)(a1 + 19368), v5, 4u, 4u, (uint64_t)"phLibNfc_DelayForSeNtf");
            sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"DelayForSeNtf: Timer started");
            *(_QWORD *)(a1 + 536) = v5;
            *(_BYTE *)(a1 + 705) = 1;
            a2 = 13;
          }
        }
      }
    }
    else
    {
      a2 = 0;
    }
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DelayForSeNtf");
  return a2;
}

uint64_t sub_2198E1AC0(uint64_t a1, int a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DelayForSeNtfProc");
  v4 = 0;
  if (a1 && !a2)
  {
    *(_BYTE *)(a1 + 705) = 0;
    if (*(_BYTE *)(a1 + 2881))
    {
      sub_219866158(a1, *(_QWORD *)(a1 + 2912), 2u);
    }
    else
    {
      sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"HCI NWK Delay Timer(ms) Expired");
      sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Timer Count");
    }
    if (*(_BYTE *)(a1 + 508) == 1)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Session Id is not retrieved in 10 tries ");
      *(_BYTE *)(a1 + 508) = 0;
      v4 = 255;
    }
    else
    {
      v4 = 0;
    }
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_DelayForSeNtfProc");
  return v4;
}

uint64_t sub_2198E1BD4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetNfceeModeSeq");
  if (a1)
  {
    *(_DWORD *)(a1 + 544) = 0;
    *(_BYTE *)(a1 + 2881) = 0;
    v2 = *(_QWORD *)(a1 + 344);
    if (v2 && *(_DWORD *)(a1 + 356) != 1)
    {
      v3 = sub_2198FC458(*(_QWORD *)(a1 + 3040), v2, 0, (uint64_t)sub_219865DD0, a1);
      if ((_DWORD)v3 != 13)
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Disable Nfcee mode failed!");
    }
    else
    {
      v3 = 0;
    }
  }
  else
  {
    v3 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetNfceeModeSeq");
  return v3;
}

uint64_t sub_2198E1CA0(unsigned int *a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v8;
  unsigned int v9;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetNfceeModeSeqEnd");
  if (!a1)
    goto LABEL_6;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = (unsigned int *)*((_QWORD *)&unk_253E46700 + 14 * v5 + 2);
    if ((v4 & 1) != 0)
      break;
    v4 = 1;
    v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    if ((_DWORD)a2 != 143 && (_DWORD)a2 != 81)
    {
      v8 = a1 + 4842;
      if ((_DWORD)a2)
      {
        sub_219850628(1, v8, 4u, 1u, (uint64_t)"Set Nfcee mode Failed!");
      }
      else
      {
        sub_219850628(1, v8, 4u, 4u, (uint64_t)"Set Nfcee mode success!");
        v9 = a1[130];
        if (v9 == 1)
        {
          a2 = 0;
          a1[89] = 0;
          goto LABEL_7;
        }
        if (!v9)
        {
          a2 = 0;
          a1[89] = 1;
          goto LABEL_7;
        }
      }
      a2 = 0;
    }
  }
  else
  {
LABEL_6:
    a2 = 255;
  }
LABEL_7:
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_SetNfceeModeSeqEnd");
  return a2;
}

uint64_t sub_2198E1DBC(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  uint64_t v10;

  sub_219850718(2, (unsigned int *)a2, 4u, 5u, (uint64_t)"phHciNfc_eSEGetAtrTimeOutCb");
  sub_219850628(2, (unsigned int *)a2, 4u, 1u, (uint64_t)"******HCI SE Get Atr Timer Expired********");
  if (!a2)
    goto LABEL_6;
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = *((_QWORD *)&unk_253E46700 + 14 * v4 + 2);
    if ((v3 & 1) != 0)
      break;
    v3 = 1;
    v4 = 1;
  }
  while (v5 != a2);
  if (v5 == a2)
  {
    v6 = *(_QWORD *)(a2 + 464);
    if (v6)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(_QWORD *)(v6 + 856) = 0xFFFFFFFFFFFFLL;
      if (*(_QWORD *)(v6 + 152))
      {
        sub_219850628(1, (unsigned int *)(v6 + 956), 7u, 4u, (uint64_t)"phHciNfc_eSEGetAtrTimeOutCb: Releasing memory");
        if (*(_QWORD *)(*(_QWORD *)(v6 + 152) + 8))
        {
          phOsalNfc_FreeMemory();
          *(_QWORD *)(*(_QWORD *)(v6 + 152) + 8) = 0;
        }
        phOsalNfc_FreeMemory();
        *(_QWORD *)(v6 + 152) = 0;
      }
    }
    v7 = *(_QWORD *)(a2 + 552);
    if (v7)
    {
      *(_QWORD *)v7 = 0;
      *(_DWORD *)(v7 + 8) = 0;
    }
    if (*(_DWORD *)(a2 + 19368))
      v8 = &dword_253E47158;
    else
      v8 = &dword_253E47070;
    *v8 |= 8u;
    if (*(_BYTE *)(a2 + 706))
    {
      *(_BYTE *)(a2 + 706) = 0;
      v9 = a2;
      v10 = 218;
    }
    else
    {
      v9 = a2;
      v10 = 44;
    }
    sub_2198E0AAC(v9, v10, 0);
  }
  else
  {
LABEL_6:
    sub_219850628(2, (unsigned int *)a2, 4u, 1u, (uint64_t)"phHciNfc_eSEGetAtrTimeOutCb:Invalid Context");
  }
  return sub_219850808(2, (unsigned int *)a2, 4u, 5u, (uint64_t)"phHciNfc_eSEGetAtrTimeOutCb");
}

uint64_t sub_2198E1F68(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_CreateSEGetAtrTimer");
  v2 = phOsalNfc_Timer_Create();
  *(_QWORD *)(a1 + 856) = v2;
  if (v2 == 0xFFFFFFFFFFFFLL || v2 == 0)
  {
    sub_219850628(1, (unsigned int *)(a1 + 956), 4u, 1u, (uint64_t)"HCI SE Get Atr Timer Create failed");
    v4 = 12;
  }
  else
  {
    sub_219850628(1, (unsigned int *)(a1 + 956), 4u, 4u, (uint64_t)"HCI SE Get Atr Timer Created Successfully");
    v4 = 0;
  }
  sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_CreateSEGetAtrTimer");
  return v4;
}

uint64_t sub_2198E2024(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_CreateSETranseiveTimer");
  v2 = phOsalNfc_Timer_Create();
  *(_QWORD *)(a1 + 840) = v2;
  if (v2 == 0xFFFFFFFFFFFFLL || v2 == 0)
  {
    sub_219850628(1, (unsigned int *)(a1 + 956), 4u, 1u, (uint64_t)"HCI SE TxRx Timer Create failed");
    v4 = 12;
  }
  else
  {
    sub_219850628(1, (unsigned int *)(a1 + 956), 4u, 4u, (uint64_t)"HCI SE TxRx Timer Created Successfully");
    v4 = 0;
  }
  sub_219850808(2, (unsigned int *)a1, 7u, 5u, (uint64_t)"phHciNfc_CreateSETranseiveTimer");
  return v4;
}

uint64_t sub_2198E20E0(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;

  sub_219850718(2, (unsigned int *)a2, 4u, 5u, (uint64_t)"phHciNfc_eSETranseiveTimeOutCb");
  sub_219850628(2, (unsigned int *)a2, 4u, 2u, (uint64_t)"******HCI SE TxRx Timer Expired********");
  if (!a2)
    goto LABEL_6;
  v3 = 0;
  v4 = 0;
  do
  {
    v5 = *((_QWORD *)&unk_253E46700 + 14 * v4 + 2);
    if ((v3 & 1) != 0)
      break;
    v3 = 1;
    v4 = 1;
  }
  while (v5 != a2);
  if (v5 == a2)
  {
    v6 = *(_QWORD *)(a2 + 464);
    phOsalNfc_Timer_Stop();
    phOsalNfc_Timer_Delete();
    *(_DWORD *)(v6 + 852) = 10000;
    *(_QWORD *)(v6 + 840) = 0xFFFFFFFFFFFFLL;
    sub_219886108(*(_QWORD *)(a2 + 19360), 44);
    if (*(_DWORD *)(v6 + 956))
      v7 = &dword_253E47158;
    else
      v7 = &dword_253E47070;
    *v7 |= 8u;
    sub_2199004B4(*(_QWORD *)(a2 + 3040), 1);
    if (*(_BYTE *)(a2 + 706) == 1)
    {
      *(_BYTE *)(a2 + 706) = 0;
      v8 = a2;
      v9 = 218;
    }
    else
    {
      sub_219879C68(*(_QWORD *)(a2 + 3040), 0);
      v8 = a2;
      v9 = 44;
    }
    sub_2198DCE40(v8, v9, 0);
  }
  else
  {
LABEL_6:
    sub_219850628(2, (unsigned int *)a2, 4u, 1u, (uint64_t)"phHciNfc_eSETranseiveTimeOutCb:Invalid Context");
  }
  return sub_219850808(2, (unsigned int *)a2, 4u, 5u, (uint64_t)"phHciNfc_eSETranseiveTimeOutCb");
}

uint64_t sub_2198E2254(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeSendCb");
  if (a1)
  {
    if (a2)
    {
      v4 = *(_QWORD *)(a1 + 464);
      if (v4)
      {
        BYTE2(v6) = *(_BYTE *)(v4 + 10);
        LOWORD(v6) = *(_WORD *)(v4 + 8);
        v7 = 0;
        WORD2(v6) = 0;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"SeSendCb: Call back received with sttus != success");
        sub_2198DE694((unsigned int *)v4, (unsigned __int8 *)&v6, 0);
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeSendCb");
}

uint64_t sub_2198E2310(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeRawSendCb");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      v4 = *(unsigned int **)(a1 + 464);
      if (v4)
      {
        if (*(_DWORD *)(a1 + 624))
        {
          sub_2198DD32C(a1, a2, 0);
        }
        else
        {
          *(_WORD *)((char *)&v6 + 1) = 274;
          LOBYTE(v6) = *(_BYTE *)(a1 + 608);
          v7 = 0;
          WORD2(v6) = 0;
          sub_2198DE694(v4, (unsigned __int8 *)&v6, 0);
        }
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SeRawSendCb");
}

uint64_t sub_2198E23C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Notify");
  if (a1)
  {
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(a1 + 3384);
    if (v6)
    {
      *(_BYTE *)(a1 + 6466) = 0;
      v7 = *(_QWORD *)(a1 + 3712);
      *(_QWORD *)(a1 + 3384) = 0;
      *(_QWORD *)(a1 + 3712) = 0;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Invoking upper layer call back function");
      v6(v7, a2, a3);
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Dropping as there is NO upper layer call back function");
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Notify");
}

uint64_t sub_2198E24A0(uint64_t a1)
{
  sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_Reset");
  *(_BYTE *)(a1 + 158) = 0;
  phOsalNfc_MemCopy();
  *(_DWORD *)(a1 + 126) = 0;
  return sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_Reset");
}

uint64_t sub_2198E2524(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_Format");
  *(_BYTE *)(a1 + 158) = 0;
  phOsalNfc_MemCopy();
  *(_BYTE *)(a1 + 25) = 1;
  *(_BYTE *)(a1 + 158) = 2;
  v2 = sub_2198E25CC(a1);
  sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_Format");
  return v2;
}

uint64_t sub_2198E25CC(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_WrRd");
  sub_2198E3594(a1, *(_BYTE *)(a1 + 158));
  v2 = sub_2198E38B8(a1);
  sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_WrRd");
  return v2;
}

uint64_t sub_2198E2644(uint64_t a1, uint64_t a2)
{
  _BYTE *v5;
  unsigned int v6;
  unsigned int *v7;
  const char *v8;
  char v9;
  int v10;
  int v11;
  uint64_t v12;
  char v13;
  int v14;
  char v15;
  int v16;
  unsigned int v17;

  sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_Process");
  if ((_DWORD)a2)
    goto LABEL_2;
  a2 = 0;
  switch(*(_BYTE *)(a1 + 25))
  {
    case 1:
      sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_ProRd16Bytes");
      v5 = *(_BYTE **)(a1 + 96);
      if (v5[3])
        goto LABEL_7;
      v14 = v5[8];
      if (v14 == 255)
      {
        if (v5[9] == 255)
        {
          *(_BYTE *)(a1 + 24) = 1;
          goto LABEL_57;
        }
      }
      else if (v14 == 2 && !v5[9])
      {
        *(_BYTE *)(a1 + 24) = 10;
LABEL_57:
        phOsalNfc_MemCopy();
        goto LABEL_64;
      }
      sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_ChkOtpFindTagType");
      if (phOsalNfc_MemCompare())
      {
        if (phOsalNfc_MemCompare())
        {
          if (phOsalNfc_MemCompare())
          {
            if (phOsalNfc_MemCompare())
            {
              if (phOsalNfc_MemCompare())
              {
                if (phOsalNfc_MemCompare())
                {
                  if (phOsalNfc_MemCompare())
                    goto LABEL_63;
                  *(_BYTE *)(a1 + 24) = 11;
                }
                else
                {
                  *(_BYTE *)(a1 + 24) = 11;
                }
              }
              else
              {
                *(_BYTE *)(a1 + 24) = 11;
              }
            }
            else
            {
              *(_BYTE *)(a1 + 24) = 11;
            }
          }
          else
          {
            *(_BYTE *)(a1 + 24) = 11;
          }
        }
        else
        {
          *(_BYTE *)(a1 + 24) = 11;
        }
        phOsalNfc_MemCopy();
      }
      else
      {
        *(_BYTE *)(a1 + 24) = 11;
      }
LABEL_63:
      sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_ChkOtpFindTagType");
LABEL_64:
      v15 = 4;
      if (phOsalNfc_MemCompare())
      {
        if (phOsalNfc_MemCompare())
        {
LABEL_7:
          v6 = *(unsigned __int8 *)(a1 + 25);
          goto LABEL_72;
        }
        v16 = *(unsigned __int8 *)(a1 + 24);
        v6 = 2;
        v15 = 3;
        if (v16 != 10 && v16 != 1)
        {
          v6 = 13;
          goto LABEL_71;
        }
      }
      else
      {
        v6 = 3;
      }
      *(_BYTE *)(a1 + 158) = v15;
LABEL_71:
      *(_BYTE *)(a1 + 25) = v6;
LABEL_72:
      a2 = 35;
      if (v6 <= 0xD && ((1 << v6) & 0x200C) != 0)
      {
        v17 = *(unsigned __int8 *)(a1 + 24);
        if (v17 <= 0xB && ((1 << v17) & 0xC02) != 0)
          a2 = sub_2198E25CC(a1);
      }
      v8 = "phFriNfc_MfUL_H_ProRd16Bytes";
      v7 = (unsigned int *)a1;
LABEL_78:
      sub_219850808(3, v7, 8u, 5u, (uint64_t)v8);
LABEL_2:
      if ((_DWORD)a2 != 13)
LABEL_3:
        sub_219890E88(a1, a2);
      return sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_Process");
    case 2:
      sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_ProWrOTPBytes");
      *(_BYTE *)(a1 + 25) = 3;
      *(_BYTE *)(a1 + 158) = 4;
      a2 = sub_2198E25CC(a1);
      v7 = (unsigned int *)a1;
      v8 = "phFriNfc_MfUL_H_ProWrOTPBytes";
      goto LABEL_78;
    case 3:
      if (*(_BYTE *)(a1 + 24) == 10)
      {
        *(_BYTE *)(a1 + 158) = 5;
        v9 = 4;
        goto LABEL_41;
      }
      a2 = 0;
      goto LABEL_3;
    case 4:
    case 6:
      goto LABEL_3;
    case 5:
      if (**(_WORD **)(a1 + 88) != 16)
        goto LABEL_31;
      phOsalNfc_MemCopy();
      *(_BYTE *)(a1 + 128) |= 0xF8u;
      *(_BYTE *)(a1 + 129) = -1;
      phOsalNfc_MemCopy();
      *(_BYTE *)(a1 + 125) = 15;
      v10 = *(unsigned __int8 *)(a1 + 124);
      if (v10 == 18)
      {
        *(_BYTE *)(a1 + 25) = 12;
        *(_BYTE *)(a1 + 158) = 4;
        goto LABEL_42;
      }
      if (v10 != 6)
      {
LABEL_18:
        a2 = 245;
        goto LABEL_3;
      }
LABEL_32:
      v9 = 7;
      goto LABEL_41;
    case 7:
      v11 = *(unsigned __int8 *)(a1 + 124);
      if (v11 != 18 && v11 != 6)
        goto LABEL_18;
      v9 = 6;
      goto LABEL_41;
    case 8:
      if (**(_WORD **)(a1 + 88) != 16)
        goto LABEL_31;
      phOsalNfc_MemCopy();
      *(_BYTE *)(a1 + 146) = 0;
      goto LABEL_24;
    case 9:
      *(_BYTE *)(a1 + 146) += 4;
      if (!sub_2198E3418(a1))
        goto LABEL_32;
      if (*(unsigned __int8 *)(a1 + 146) <= 0xFu && sub_2198E3418(a1))
      {
LABEL_24:
        v12 = sub_2198E3244(a1);
      }
      else
      {
        v13 = *(_BYTE *)(a1 + 158) + 4;
LABEL_35:
        *(_BYTE *)(a1 + 158) = v13;
        v12 = sub_2198E3174(a1);
      }
      goto LABEL_43;
    case 0xC:
      if (**(_WORD **)(a1 + 88) != 16)
        goto LABEL_31;
      a2 = sub_2198E2C38(a1, *(_QWORD *)(a1 + 96));
      if ((_DWORD)a2)
        goto LABEL_2;
      v13 = *(_BYTE *)(a1 + 154);
      goto LABEL_35;
    case 0xD:
      *(_BYTE *)(a1 + 146) = 0;
      if (**(_WORD **)(a1 + 88) != 8)
      {
LABEL_31:
        a2 = 27;
        goto LABEL_3;
      }
      phOsalNfc_MemCopy();
      if (sub_2198E3484(a1))
      {
        a2 = 1;
        goto LABEL_3;
      }
      v9 = 14;
LABEL_41:
      *(_BYTE *)(a1 + 25) = v9;
LABEL_42:
      v12 = sub_2198E25CC(a1);
LABEL_43:
      a2 = v12;
      goto LABEL_2;
    default:
      goto LABEL_18;
  }
}

uint64_t sub_2198E2C38(uint64_t a1, uint64_t a2)
{
  int v3;
  int v4;
  BOOL v5;
  uint64_t v6;
  int v8;
  int v9;
  unsigned int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  const char *v18;
  unsigned int v19;
  unsigned int v20;
  int v21;
  int v22;
  int v23;

  sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_ParseTLVs");
  v3 = HIWORD(dword_253E47028);
  if (!HIWORD(dword_253E47028))
  {
    v3 = 8 * *(unsigned __int8 *)(a1 + 124);
    HIWORD(dword_253E47028) = 8 * *(unsigned __int8 *)(a1 + 124);
  }
  v4 = dword_253E47030;
  v5 = dword_253E47030 == 5 || v3 == 0;
  if (!v5)
  {
    v8 = 0;
    v9 = 0;
    while (1)
    {
      v10 = BYTE1(dword_253E47028);
      if (!BYTE1(dword_253E47028))
      {
        v13 = *(unsigned __int8 *)(a1 + 158);
        sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_GetSkipSize");
        if (*(_BYTE *)(a1 + 156)
          || *(unsigned __int8 *)(a1 + 154) != v13
          || *(unsigned __int8 *)(a1 + 153) != v9)
        {
          sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_GetSkipSize");
          BYTE1(dword_253E47028) = 0;
LABEL_26:
          switch(dword_253E47030)
          {
            case 0:
              v16 = *(unsigned __int8 *)(a2 + v9);
              if (!*(_BYTE *)(a2 + v9))
                goto LABEL_51;
              if (v16 == 3)
              {
                dword_253E47030 = 4;
                *(_BYTE *)(a1 + 156) = 1;
                v18 = "phFriNfc_MfUL_GetDefaultLockBytesInfo";
                sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_GetDefaultLockBytesInfo");
                v22 = *(unsigned __int8 *)(a1 + 124);
                *(_BYTE *)(a1 + 154) = (8 * v22 + 16) >> 2;
                *(_BYTE *)(a1 + 153) = 0;
                *(_BYTE *)(a1 + 155) = v22 - 6;
                goto LABEL_50;
              }
              if (v16 == 1)
              {
                v6 = 0;
                goto LABEL_39;
              }
              dword_253E47030 = 0;
              goto LABEL_48;
            case 1:
              if (*(_BYTE *)(a2 + v9) != 3)
                goto LABEL_47;
              v6 = 0;
              v16 = 2;
              goto LABEL_39;
            case 2:
              v17 = dword_253E47028;
              if (dword_253E47028 < 2u)
              {
                v6 = 0;
                *(_BYTE *)(a1 + 156) = 0;
                *(_BYTE *)(a1 + v17 + 147) = *(_BYTE *)(a2 + v9);
                LOBYTE(dword_253E47028) = v17 + 1;
                break;
              }
              if (dword_253E47028 == 2)
              {
                *(_BYTE *)(a1 + 149) = *(_BYTE *)(a2 + v9);
                dword_253E47030 = 3;
                LOBYTE(dword_253E47028) = 0;
                v18 = "phFriNfc_MfUL_GetLockBytesInfo";
                sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_GetLockBytesInfo");
                v19 = *(unsigned __int8 *)(a1 + 147);
                *(_BYTE *)(a1 + 155) = *(_BYTE *)(a1 + 148);
                v20 = *(unsigned __int8 *)(a1 + 149);
                *(_BYTE *)(a1 + 152) = v20 & 0xF;
                *(_BYTE *)(a1 + 151) = v20 >> 4;
                v21 = (v19 & 0xF) + (v19 >> 4 << (v20 & 0xF));
                *(_BYTE *)(a1 + 154) = v21 >> 2;
                *(_BYTE *)(a1 + 153) = v21 & 3;
LABEL_50:
                sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)v18);
                goto LABEL_51;
              }
LABEL_47:
              BYTE1(dword_253E47028) = 0;
              dword_253E47030 = 0;
LABEL_48:
              v6 = 22;
              break;
            case 3:
              if (!*(_BYTE *)(a2 + v9))
                goto LABEL_51;
              if (*(_BYTE *)(a2 + v9) != 3)
                goto LABEL_47;
              v6 = 0;
              v16 = 4;
LABEL_39:
              dword_253E47030 = v16;
              break;
            case 4:
              if (dword_253E47028 == 2)
              {
                v6 = 0;
                word_253E4702C |= *(unsigned __int8 *)(a2 + v9);
                dword_253E47030 = 5;
                LOBYTE(dword_253E47028) = 0;
              }
              else if (dword_253E47028 == 1)
              {
                v6 = 0;
                word_253E4702C = *(unsigned __int8 *)(a2 + v9) << 8;
              }
              else if ((_BYTE)dword_253E47028)
              {
LABEL_51:
                v6 = 0;
              }
              else
              {
                v6 = 0;
                if (*(unsigned __int8 *)(a2 + v9) == 255)
                {
                  LOBYTE(dword_253E47028) = 1;
                }
                else
                {
                  word_253E4702C = *(unsigned __int8 *)(a2 + v9);
                  dword_253E47030 = 5;
                  LOBYTE(dword_253E47028) = 0;
                }
              }
              break;
            default:
              goto LABEL_47;
          }
          v12 = HIWORD(dword_253E47028);
          goto LABEL_53;
        }
        v14 = *(unsigned __int8 *)(a1 + 155);
        v5 = (v14 & 7) == 0;
        v15 = v14 >> 3;
        if (v5)
          v10 = v15;
        else
          v10 = v15 + 1;
        sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_GetSkipSize");
        BYTE1(dword_253E47028) = v10;
        if (!v10)
          goto LABEL_26;
        v3 = HIWORD(dword_253E47028);
      }
      v11 = 16 - v8;
      v6 = 0;
      if (16 - v8 <= v10)
      {
        v12 = v3 - v11;
        HIWORD(dword_253E47028) = v3 - v11;
        BYTE1(dword_253E47028) = v10 - v11;
        v9 = 16;
      }
      else
      {
        v12 = v3 - v10;
        HIWORD(dword_253E47028) = v3 - v10;
        v9 += v10;
        BYTE1(dword_253E47028) = 0;
      }
LABEL_53:
      if ((_WORD)v12)
      {
        v4 = dword_253E47030;
        if (dword_253E47030 == 5)
        {
          v3 = 0;
          if (*(unsigned __int8 *)(a1 + 124) <= 0x1Fu)
            v23 = -1;
          else
            v23 = -3;
          if (v23 + (unsigned __int16)v12 >= (unsigned __int16)word_253E4702C)
            v6 = v6;
          else
            v6 = 22;
          dword_253E47028 = 0;
          v4 = 5;
        }
        else
        {
          ++v9;
          v3 = v12 - 1;
          HIWORD(dword_253E47028) = v12 - 1;
        }
      }
      else
      {
        v3 = 0;
        v4 = 0;
        BYTE1(dword_253E47028) = 0;
        dword_253E47030 = 0;
        v6 = 22;
      }
      if ((_WORD)v3)
      {
        if (v4 != 5 && v9 <= 0xFu)
        {
          v8 = v9;
          if (!(_DWORD)v6)
            continue;
        }
      }
      goto LABEL_9;
    }
  }
  v6 = 0;
LABEL_9:
  if (v4 != 5 && (_DWORD)v6 == 0)
  {
    *(_BYTE *)(a1 + 25) = 12;
    *(_BYTE *)(a1 + 158) += 4;
    v6 = sub_2198E25CC(a1);
  }
  else
  {
    dword_253E47030 = 0;
  }
  if ((_DWORD)v6 != 13)
    dword_253E47028 = 0;
  sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_ParseTLVs");
  return v6;
}

uint64_t sub_2198E3174(uint64_t a1)
{
  char v2;
  uint64_t v3;

  sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_ReadWriteLockBytes");
  if ((*(_BYTE *)(a1 + 153)
     || *(unsigned __int8 *)(a1 + 158) != *(unsigned __int8 *)(a1 + 154)
     || sub_2198E3418(a1) <= 0x1F)
    && (*(unsigned __int8 *)(a1 + 158) == *(unsigned __int8 *)(a1 + 154) || sub_2198E3418(a1) < 0x20))
  {
    v2 = 8;
  }
  else
  {
    phOsalNfc_SetMemory();
    v2 = 9;
  }
  *(_BYTE *)(a1 + 25) = v2;
  v3 = sub_2198E25CC(a1);
  sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_ReadWriteLockBytes");
  return v3;
}

uint64_t sub_2198E3244(uint64_t a1)
{
  unsigned int v2;
  int v3;
  unsigned __int8 v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  int v10;

  v10 = 0;
  sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_UpdateAndWriteLockBits");
  phOsalNfc_MemCopy();
  v2 = sub_2198E3418(a1);
  v3 = 0;
  if (*(unsigned __int8 *)(a1 + 158) == *(unsigned __int8 *)(a1 + 154))
    v3 = *(unsigned __int8 *)(a1 + 153);
  v4 = 32 - 8 * v3;
  if ((v4 & 0xF8u) >= v2)
  {
    if ((v2 & 7) != 0)
    {
      if (v2 < 9)
      {
        LOBYTE(v10) = v10 & (-1 << (v2 & 7)) | 1;
      }
      else
      {
        LOBYTE(v5) = 0;
        do
        {
          *((_BYTE *)&v10 + v3) = -1;
          LOBYTE(v3) = v3 + 1;
          v5 = (v5 + 1);
        }
        while (v5 < v2 >> 3);
        *((_BYTE *)&v10 + v3) = 1;
      }
    }
    else if (v2 >= 8)
    {
      LOBYTE(v7) = 0;
      do
      {
        *((_BYTE *)&v10 + v3++) = -1;
        v7 = (v7 + 1);
      }
      while (v7 < v2 >> 3);
    }
  }
  else if ((8 * v3) == 32)
  {
    LOBYTE(v2) = 0;
  }
  else
  {
    LOBYTE(v6) = 0;
    do
    {
      *((_BYTE *)&v10 + v3++) = -1;
      v6 = (v6 + 1);
    }
    while (v6 < v4 >> 3);
    LOBYTE(v2) = v4;
  }
  *(_BYTE *)(a1 + 157) += v2;
  phOsalNfc_MemCopy();
  *(_BYTE *)(a1 + 25) = 9;
  v8 = sub_2198E25CC(a1);
  sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_UpdateAndWriteLockBits");
  return v8;
}

uint64_t sub_2198E3418(uint64_t a1)
{
  unsigned __int8 v2;

  sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_CalcRemainingLockBits");
  v2 = *(_BYTE *)(a1 + 155) - *(_BYTE *)(a1 + 157);
  sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_CalcRemainingLockBits");
  return v2;
}

uint64_t sub_2198E3484(uint64_t a1)
{
  uint64_t v2;
  int v3;

  sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_FindNtagSize");
  v2 = 1;
  if (a1)
  {
    v3 = 1 << (*(_BYTE *)(a1 + 165) >> 1);
    if ((*(_BYTE *)(a1 + 165) & 1) != 0)
    {
      sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_MapNtagSize");
      if ((unsigned __int16)v3 <= 0xFFu)
      {
        if ((unsigned __int16)v3 == 32)
        {
          LOWORD(v3) = 48;
        }
        else if ((unsigned __int16)v3 == 128)
        {
          LOWORD(v3) = 144;
        }
      }
      else
      {
        switch((unsigned __int16)v3)
        {
          case 0x100u:
            LOWORD(v3) = 504;
            break;
          case 0x200u:
            LOWORD(v3) = 888;
            break;
          case 0x400u:
            LOWORD(v3) = 1904;
            break;
        }
      }
      sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_MapNtagSize");
    }
    v2 = 0;
    *(_WORD *)(a1 + 168) = v3;
  }
  sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_FindNtagSize");
  return v2;
}

uint64_t sub_2198E3594(uint64_t a1, char a2)
{
  int v4;
  unsigned int v5;

  sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
  **(_BYTE **)(a1 + 96) = a2;
  switch(*(_BYTE *)(a1 + 25))
  {
    case 1:
      *(_DWORD *)(a1 + 80) = 48;
      goto LABEL_19;
    case 2:
      *(_WORD *)(a1 + 104) = 5;
      *(_DWORD *)(a1 + 80) = 162;
      goto LABEL_23;
    case 3:
      *(_WORD *)(a1 + 104) = 5;
      *(_DWORD *)(a1 + 80) = 162;
      v4 = *(unsigned __int8 *)(a1 + 24);
      if (v4 == 1 || v4 == 11 || v4 == 10)
        goto LABEL_23;
      return sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
    case 4:
      if (*(_BYTE *)(a1 + 24) != 10)
        return sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
      *(_WORD *)(a1 + 104) = 5;
      *(_DWORD *)(a1 + 80) = 162;
      goto LABEL_23;
    case 5:
      *(_DWORD *)(a1 + 80) = 48;
      **(_BYTE **)(a1 + 96) = 2;
      goto LABEL_19;
    case 6:
      *(_DWORD *)(a1 + 80) = 162;
      *(_WORD *)(a1 + 104) = 5;
      **(_BYTE **)(a1 + 96) = 2;
      goto LABEL_23;
    case 7:
      *(_DWORD *)(a1 + 80) = 162;
      *(_WORD *)(a1 + 104) = 5;
      **(_BYTE **)(a1 + 96) = 3;
      goto LABEL_23;
    case 8:
    case 0xC:
      *(_DWORD *)(a1 + 80) = 48;
      **(_BYTE **)(a1 + 96) = *(_BYTE *)(a1 + 158);
LABEL_19:
      *(_WORD *)(a1 + 104) = 1;
      return sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
    case 9:
      *(_DWORD *)(a1 + 80) = 162;
      *(_WORD *)(a1 + 104) = 5;
      **(_BYTE **)(a1 + 96) = *(_BYTE *)(a1 + 158);
LABEL_23:
      phOsalNfc_MemCopy();
      return sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
    case 0xD:
      *(_DWORD *)(a1 + 80) = 96;
      *(_WORD *)(a1 + 104) = 0;
      return sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
    case 0xE:
      *(_WORD *)(a1 + 104) = 5;
      *(_DWORD *)(a1 + 80) = 162;
      *(_BYTE *)(a1 + 158) = 3;
      v5 = *(unsigned __int16 *)(a1 + 168);
      if (v5 > 0x1F7)
      {
        if (v5 == 504 || v5 == 888 || v5 == 1904)
          goto LABEL_28;
      }
      else if (v5 == 48 || v5 == 128 || v5 == 144)
      {
LABEL_28:
        phOsalNfc_MemCopy();
      }
      phOsalNfc_MemCopy();
      *(_BYTE *)(a1 + 25) = 2;
      return sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
    default:
      return sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_fillSendBuf");
  }
}

uint64_t sub_2198E38B8(uint64_t a1)
{
  _BYTE *v2;
  unsigned __int16 *v3;
  uint64_t v4;

  sub_219850718(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_Transceive");
  *(_BYTE *)(a1 + 8) &= 0xFCu;
  *(_BYTE *)(a1 + 12) = 0;
  *(_QWORD *)(a1 + 64) = sub_2198911F8;
  *(_QWORD *)(a1 + 72) = a1;
  v3 = *(unsigned __int16 **)(a1 + 88);
  v2 = *(_BYTE **)(a1 + 96);
  *v3 = 252;
  v4 = sub_2198BB544(*(_QWORD *)a1, (_OWORD *)(a1 + 64), *(_QWORD *)(a1 + 16), *(_DWORD *)(a1 + 80), a1 + 8, v2, *(unsigned __int16 *)(a1 + 104), (uint64_t)v2, v3);
  sub_219850808(3, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_MfUL_H_Transceive");
  return v4;
}

uint64_t sub_2198E3974(uint64_t a1)
{
  uint64_t Memory;
  uint64_t v3;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEepromSettings");
  if (a1)
  {
    Memory = phOsalNfc_GetMemory();
    *(_QWORD *)(a1 + 3232) = Memory;
    if (Memory)
    {
      phOsalNfc_SetMemory();
      if ((*(_DWORD *)(a1 + 3156) | 2) == 2)
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 4) |= 0x10u;
        *(_BYTE *)(*(_QWORD *)(a1 + 3232) + 88) |= 1u;
        *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 4) |= 0x100u;
        *(_BYTE *)(*(_QWORD *)(a1 + 3232) + 380) |= 8u;
        *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 4) |= 0x20u;
        *(_BYTE *)(*(_QWORD *)(a1 + 3232) + 148) |= 4u;
      }
      if (*(_BYTE *)(a1 + 2937) != 1 && *(_BYTE *)(a1 + 2938) != 1 && *(_BYTE *)(a1 + 2944) != 1)
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 4) |= 0x1000u;
        *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 580) |= 0x4000u;
        *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 580) |= 0x8000u;
        *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 580) |= 2u;
        *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 580) |= 8u;
        *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 580) |= 0x40u;
        *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 580) |= 0x10000u;
      }
      if (*(_BYTE *)(a1 + 2936) != 1
        && *(_BYTE *)(a1 + 2937) != 1
        && *(_BYTE *)(a1 + 2938) != 1
        && *(_BYTE *)(a1 + 2944) != 1)
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 580) |= 0x20u;
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 4) |= 0x400u;
      if ((*(_DWORD *)(a1 + 3156) | 2) == 2)
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 3232) + 544) |= 4u;
        *(_BYTE *)(*(_QWORD *)(a1 + 3232) + 544) |= 8u;
      }
      *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 4) |= 0x2000u;
      if (*(_BYTE *)(a1 + 2946) != 1)
        *(_BYTE *)(*(_QWORD *)(a1 + 3232) + 1132) |= 1u;
      *(_BYTE *)(*(_QWORD *)(a1 + 3232) + 1132) |= 4u;
      if (*(_BYTE *)(a1 + 2936) == 1)
      {
        *(_BYTE *)(*(_QWORD *)(a1 + 3232) + 1132) &= ~2u;
        *(_BYTE *)(*(_QWORD *)(a1 + 3232) + 1132) |= 8u;
      }
      if ((*(_DWORD *)(a1 + 3156) | 2) == 2)
      {
        *(_DWORD *)(*(_QWORD *)(a1 + 3232) + 4) |= 0x8000u;
        *(_WORD *)(*(_QWORD *)(a1 + 3232) + 1408) |= 0x10u;
      }
      v3 = sub_2198FE090(*(_QWORD *)(a1 + 3040), *(_QWORD *)(a1 + 3232), (uint64_t)sub_219865DD0, a1);
      if ((_DWORD)v3 != 13)
      {
        phOsalNfc_FreeMemory();
        *(_QWORD *)(a1 + 3232) = 0;
      }
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory, Insufficient Resources");
      v3 = 12;
    }
  }
  else
  {
    v3 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEepromSettings");
  return v3;
}

uint64_t sub_2198E3CA0(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  char v10;
  int v11;
  char v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  char v18;
  char v19;
  __int16 v20;
  unsigned int v21;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEepromSettingsProc");
  v6 = 0;
  if (a1 && !a2 && a3)
  {
    sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckPollParams");
    if (*(_BYTE *)(a3 + 92) == 1)
      *(_BYTE *)(a3 + 88) &= ~1u;
    else
      *(_BYTE *)(a3 + 92) = 1;
    sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckPollParams");
    sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckListenParams");
    v7 = *(_BYTE *)(a3 + 156);
    if ((v7 & 7) == 1)
    {
      v8 = *(_BYTE *)(a3 + 148) & 0xFB;
    }
    else
    {
      *(_BYTE *)(a3 + 156) = v7 & 0xFC | 1;
      v8 = *(_BYTE *)(a3 + 148) | 4;
    }
    *(_BYTE *)(a3 + 148) = v8;
    if ((*(_BYTE *)(a3 + 204) & 1) != 0)
      *(_BYTE *)(a3 + 204) &= ~1u;
    else
      *(_BYTE *)(a3 + 196) &= ~2u;
    v9 = *(_BYTE *)(a3 + 380);
    if (*(_BYTE *)(a3 + 483))
    {
      v10 = v9 | 8;
      *(_BYTE *)(a3 + 483) = 0;
    }
    else
    {
      v10 = v9 & 0xF7;
    }
    *(_BYTE *)(a3 + 380) = v10;
    sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckListenParams");
    sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckSysConfigParams");
    v11 = *(_DWORD *)(a3 + 580);
    v12 = *(_BYTE *)(a3 + 1132);
    *(_BYTE *)(a3 + 1132) = v12 & 0xF7;
    v13 = v11 & 0xFFFE3F91;
    *(_DWORD *)(a3 + 580) = v13;
    if (*(_BYTE *)(a1 + 2937) != 1
      && *(_BYTE *)(a1 + 2938) != 1
      && *(_BYTE *)(a1 + 2944) != 1
      && *(_DWORD *)(a3 + 932) != 2)
    {
      *(_DWORD *)(a3 + 932) = 2;
      v13 |= 0x4000u;
      *(_DWORD *)(a3 + 580) = v13;
    }
    if (*(_BYTE *)(a1 + 2936))
    {
      if (*(_BYTE *)(a1 + 2936) != 1 || *(_DWORD *)(a3 + 936) == 10)
        goto LABEL_30;
      v13 |= 0x8000u;
      *(_DWORD *)(a3 + 580) = v13;
      v14 = 10;
    }
    else
    {
      v15 = *(unsigned __int8 *)(a1 + 2937);
      if (*(_BYTE *)(a1 + 2937))
      {
LABEL_31:
        if (v15 != 1 && *(_BYTE *)(a1 + 2938) != 1 && *(_BYTE *)(a1 + 2944) != 1 && *(_BYTE *)(a3 + 586) != 1)
        {
          *(_BYTE *)(a3 + 586) = 1;
          v13 |= 2u;
          *(_DWORD *)(a3 + 580) = v13;
        }
        if (*(_BYTE *)(a1 + 2936) == 1 && *(_BYTE *)(a3 + 587) != 12)
        {
          *(_BYTE *)(a3 + 587) = 12;
          v13 |= 8u;
          *(_DWORD *)(a3 + 580) = v13;
        }
        v16 = *(unsigned __int8 *)(a1 + 2937);
        if (v16 != 1)
        {
          if (*(_BYTE *)(a1 + 2938) != 1
            && *(_BYTE *)(a1 + 2944) != 1
            && (*(_DWORD *)(a3 + 604) || *(_DWORD *)(a3 + 608) != 1))
          {
            *(_QWORD *)(a3 + 604) = 0x100000000;
            v13 |= 0x40u;
            *(_DWORD *)(a3 + 580) = v13;
            v16 = *(unsigned __int8 *)(a1 + 2937);
          }
          if (!v16 && !*(_BYTE *)(a1 + 2938) && !*(_BYTE *)(a1 + 2944) && *(unsigned __int8 *)(a3 + 940) != 238)
          {
            *(_BYTE *)(a3 + 940) = -18;
            v13 |= 0x10000u;
            *(_DWORD *)(a3 + 580) = v13;
          }
        }
        if (*(_BYTE *)(a1 + 2936) != 1
          || *(_BYTE *)(a3 + 1173) != 1
          && (*(_BYTE *)(a3 + 1173) = 1, *(_BYTE *)(a3 + 1132) = v12 | 8, *(_BYTE *)(a1 + 2936) != 1))
        {
          if (*(_BYTE *)(a3 + 601))
          {
            *(_BYTE *)(a3 + 601) = 0;
            *(_DWORD *)(a3 + 580) = v13 | 0x20;
          }
        }
        sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckSysConfigParams");
        sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckComDiscParams");
        if (*(_BYTE *)(a3 + 551) == 1)
          *(_BYTE *)(a3 + 544) &= ~4u;
        else
          *(_BYTE *)(a3 + 551) = 1;
        if (*(_BYTE *)(a3 + 552) == 1)
          *(_BYTE *)(a3 + 544) &= ~8u;
        else
          *(_BYTE *)(a3 + 552) = 1;
        sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckComDiscParams");
        sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckSwpConfigParams");
        v17 = *(_DWORD *)(a1 + 440);
        if ((v17 & 1) != 0)
        {
          if (*(_BYTE *)(a3 + 1170) != 1)
          {
            *(_BYTE *)(a3 + 1170) = 1;
            goto LABEL_67;
          }
        }
        else if (*(_BYTE *)(a3 + 1170))
        {
          *(_BYTE *)(a3 + 1170) = 0;
LABEL_67:
          v18 = *(_BYTE *)(a3 + 1132) | 1;
LABEL_68:
          if ((v17 & 2) != 0)
          {
            if (*(_BYTE *)(a3 + 1172) != 1)
            {
              *(_BYTE *)(a3 + 1172) = 1;
              goto LABEL_74;
            }
          }
          else if (*(_BYTE *)(a3 + 1172))
          {
            *(_BYTE *)(a3 + 1172) = 0;
LABEL_74:
            v19 = v18 | 4;
LABEL_75:
            *(_BYTE *)(a3 + 1132) = v19;
            sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckSwpConfigParams");
            sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckNxpExtnRfDiscParams");
            if (*(_BYTE *)(a3 + 1421))
            {
              *(_BYTE *)(a3 + 1421) = 0;
              v20 = *(_WORD *)(a3 + 1408) | 0x10;
            }
            else
            {
              v20 = *(_WORD *)(a3 + 1408) & 0xFFEF;
            }
            *(_WORD *)(a3 + 1408) = v20;
            sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckNxpExtnRfDiscParams");
            sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckDisableConfigBit");
            if (!*(_DWORD *)(a3 + 88))
              *(_DWORD *)(a3 + 4) &= ~0x10u;
            if (!*(_DWORD *)(a3 + 148))
              *(_DWORD *)(a3 + 4) &= ~0x20u;
            if (!*(_DWORD *)(a3 + 196))
              *(_DWORD *)(a3 + 4) &= ~0x80u;
            if (!*(_DWORD *)(a3 + 380))
              *(_DWORD *)(a3 + 4) &= ~0x100u;
            if (!*(_DWORD *)(a3 + 580))
              *(_DWORD *)(a3 + 4) &= ~0x1000u;
            if (!*(_DWORD *)(a3 + 544))
              *(_DWORD *)(a3 + 4) &= ~0x400u;
            if (!*(_DWORD *)(a3 + 1132))
              *(_DWORD *)(a3 + 4) &= ~0x2000u;
            if (!*(_DWORD *)(a3 + 1408))
              *(_DWORD *)(a3 + 4) &= ~0x8000u;
            sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldtEepromCheckDisableConfigBit");
            if ((*(_DWORD *)(a3 + 4) & 0x1B5B0) != 0)
            {
              v21 = *(unsigned __int8 *)(a1 + 3225);
              *(_QWORD *)(a1 + 5392) = a3;
              if (v21 >= 2)
              {
                sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetEepromSettingsProc-Retry Failed to Configs Entries");
                v6 = 255;
                goto LABEL_102;
              }
            }
            else
            {
              phOsalNfc_FreeMemory();
              sub_21986607C(a1, (uint64_t)off_2550A3A28, 1);
              if (*(_QWORD *)(a1 + 5392))
                *(_QWORD *)(a1 + 5392) = 0;
              if (*(_QWORD *)(a1 + 3232))
              {
                v6 = 0;
                *(_QWORD *)(a1 + 3232) = 0;
                goto LABEL_102;
              }
            }
            v6 = 0;
            goto LABEL_102;
          }
          v19 = v18 & 0xFB;
          goto LABEL_75;
        }
        v18 = *(_BYTE *)(a3 + 1132) & 0xFE;
        goto LABEL_68;
      }
      if (*(_BYTE *)(a1 + 2938) || *(_BYTE *)(a1 + 2944) || *(_DWORD *)(a3 + 936) == 4)
      {
LABEL_30:
        v15 = *(unsigned __int8 *)(a1 + 2937);
        goto LABEL_31;
      }
      v13 |= 0x8000u;
      *(_DWORD *)(a3 + 580) = v13;
      v14 = 4;
    }
    *(_DWORD *)(a3 + 936) = v14;
    goto LABEL_30;
  }
LABEL_102:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEepromSettingsProc");
  return v6;
}

uint64_t sub_2198E433C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetEepromStngs");
  if (a1)
  {
    v4 = *(_QWORD *)(a1 + 5392);
    if (v4)
      a2 = sub_2198FD4A4(*(_QWORD *)(a1 + 3040), v4, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    a2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetEepromStngs :Invlaid LibNfc Ctx ");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetEepromStngs");
  return a2;
}

uint64_t sub_2198E43E0(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetEepromStngsProc");
  if (a1)
  {
    if (*(_QWORD *)(a1 + 3232))
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 3232) = 0;
    }
    *(_QWORD *)(a1 + 5392) = 0;
    ++*(_BYTE *)(a1 + 3225);
    sub_219866158(a1, (uint64_t)off_2550A3A28, 2u);
  }
  else
  {
    a2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetEepromStngsProc :Invlaid LibNfc Ctx");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetEepromStngsProc");
  return a2;
}

uint64_t sub_2198E44A0(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetRtngTable");
  if (a1)
  {
    if (*(_DWORD *)(a1 + 3156) == 1 && *(_QWORD *)(a1 + 6664))
      v2 = 0;
    else
      v2 = sub_2198FDF3C(*(_QWORD *)(a1 + 3040), (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetRtngTable");
  return v2;
}

uint64_t sub_2198E4554(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  unsigned int *v6;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetRtngTableProc");
  if (!a1)
  {
    a2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
    goto LABEL_10;
  }
  if (!(_DWORD)a2)
  {
    if (a3 && *a3 && *a3 != 255)
    {
      if (sub_21987A2C0((unsigned int *)a1, (uint64_t)a3) != 1)
      {
        sub_21986607C(a1, (uint64_t)off_2550A3A28, 1);
        goto LABEL_8;
      }
      v6 = (unsigned int *)(a1 + 19368);
      if (*(unsigned __int8 *)(a1 + 3226) >= 2u)
      {
        sub_219850628(1, v6, 4u, 1u, (uint64_t)"phLibNfc_GetRtngTableProc-Retry Failed to Restore Routing Entries");
        a2 = 255;
        goto LABEL_10;
      }
    }
    else
    {
      v6 = (unsigned int *)(a1 + 19368);
    }
    sub_219850628(1, v6, 4u, 4u, (uint64_t)"phLibNfc_GetRtngTableProc:Continue sequence which will perform basic routing entries");
LABEL_8:
    a2 = 0;
  }
LABEL_10:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetRtngTableProc");
  return a2;
}

uint64_t sub_2198E4680(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ValSetLstnModeRtngProc");
  if (a1)
  {
    ++*(_BYTE *)(a1 + 3226);
    sub_219866158(a1, (uint64_t)off_2550A3A28, 2u);
    v2 = 0;
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ValSetLstnModeRtngProc");
  return v2;
}

uint64_t sub_2198E4724(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfDiscMapping");
  if (a1)
  {
    if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
    {
      a2 = sub_219893808(a1);
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_RfDiscMapping : skip RF_DISCOVER_MAP_CMD ");
      a2 = 0;
    }
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfDiscMapping");
  return a2;
}

uint64_t sub_2198E47F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldteEepromStngsComp");
  if (!a1)
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"VldteEepromStngsComp :Invlaid LibNfc Ctx received from NCI");
    v4 = 49;
    goto LABEL_14;
  }
  if (*(_QWORD *)(a1 + 5392))
  {
    phOsalNfc_FreeMemory();
    *(_QWORD *)(a1 + 5392) = 0;
LABEL_7:
    *(_QWORD *)(a1 + 3232) = 0;
    goto LABEL_8;
  }
  if (*(_QWORD *)(a1 + 3232))
  {
    phOsalNfc_FreeMemory();
    goto LABEL_7;
  }
LABEL_8:
  if ((_DWORD)a2)
  {
    if ((_DWORD)a2 == 143)
    {
      v5 = 146;
    }
    else
    {
      sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_VldteEepromStngsComp: Internal LibNfc status = ");
      v5 = 146;
      a2 = 255;
    }
  }
  else
  {
    v5 = 145;
  }
  v4 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v5, a2, 0, 0);
LABEL_14:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_VldteEepromStngsComp");
  return v4;
}

uint64_t sub_2198E4908(uint64_t a1)
{
  unsigned int v2;
  char v3;
  unsigned int v4;
  char v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  uint64_t v10;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsCmd");
  if (!a1)
    goto LABEL_16;
  if (!*(_BYTE *)(a1 + 3248))
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_SetRfSettingsCmd: Number of configurations to be set is 0");
LABEL_16:
    v10 = 0;
    goto LABEL_17;
  }
  *(_BYTE *)(a1 + 3249) = 0;
  phOsalNfc_SetMemory();
  v2 = 0;
  v3 = 0;
  if (*(unsigned __int8 *)(a1 + 3248) >= 0xAu)
    v4 = 10;
  else
    v4 = *(unsigned __int8 *)(a1 + 3248);
  if (v4 <= 1)
    v5 = 1;
  else
    v5 = v4;
  v6 = 1;
  while (1)
  {
    v7 = *(_QWORD *)(a1 + 3240);
    v8 = v2 + (*(_BYTE *)(v7 + v2 + 2) + 3);
    if (v8 > 0xFE)
      break;
    v9 = (*(_BYTE *)(v7 + v2 + 2) + 3);
    phOsalNfc_MemCopy();
    v2 = v8;
    v6 += v9;
    if (v4 <= ++v3)
    {
      v7 = *(_QWORD *)(a1 + 3240);
      v3 = v5;
      break;
    }
  }
  *(_BYTE *)(a1 + 3248) -= v3;
  *(_QWORD *)(a1 + 3240) = v7 + v2;
  *(_BYTE *)(a1 + 3250) = v3;
  *(_BYTE *)(a1 + 3249) = v2 + 1;
  v10 = sub_2198FFF88(*(_QWORD *)(a1 + 3040), a1 + 3250, (v2 + 1), (uint64_t)sub_219865DD0, a1);
  if ((_DWORD)v10 == 111)
  {
    *(_BYTE *)(a1 + 3248) += v3;
    *(_QWORD *)(a1 + 3240) -= v2;
  }
LABEL_17:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsCmd");
  return v10;
}

uint64_t sub_2198E4AB0(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsProc");
  if (!a1)
  {
    a2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetRfSettingsProc : Invalid Param");
    goto LABEL_12;
  }
  if (*(_BYTE *)(a1 + 2937) != 1 && *(_BYTE *)(a1 + 2938) != 1)
  {
    if ((_DWORD)a2 || *(_BYTE *)(a1 + 2944) != 1)
      goto LABEL_5;
LABEL_9:
    if (*(_DWORD *)(a1 + 3512) >= *(_DWORD *)(a1 + 3508) || !*(_BYTE *)(a1 + 3248))
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"All Rf configs are set");
      a2 = 0;
      goto LABEL_12;
    }
    goto LABEL_5;
  }
  if (!(_DWORD)a2)
    goto LABEL_9;
LABEL_5:
  sub_21986607C(a1, *(_QWORD *)(a1 + 2912), 1);
LABEL_12:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsProc");
  return a2;
}

uint64_t sub_2198E4BB0(uint64_t a1, uint64_t a2)
{
  _BOOL4 v4;
  _BOOL4 v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t (**v10)();
  uint64_t (*v11)();
  int v12;
  const char *v13;
  int v14;
  int v15;
  char v17;
  uint64_t (**v18)();
  uint64_t (*v19)();
  int v20;
  int v21;
  unsigned int v22;
  char v23;

  v23 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsSeqComplete");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      v4 = *(_DWORD *)(a1 + 3148) == 2;
      v5 = a2 == 147;
      if ((_DWORD)a2 == 143)
        v6 = 143;
      else
        v6 = 255;
      if (v5 && v4)
        v7 = 0;
      else
        v7 = v6;
      if (v5 && v4)
        v8 = 145;
      else
        v8 = 146;
      v23 = 1;
      goto LABEL_35;
    }
    if (*(_BYTE *)(a1 + 3248))
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Re-Initialize the sequence to perform set config");
      *(_QWORD *)(a1 + 2912) = off_2550A3BB8;
      *(_BYTE *)(a1 + 2904) = 0;
      *(_BYTE *)(a1 + 2906) = 0;
      v9 = (char)off_2550A3BB8[0];
      if (off_2550A3BB8[0])
      {
        v9 = 0;
        v10 = off_2550A3BC8;
        do
        {
          ++v9;
          v11 = *v10;
          v10 += 2;
        }
        while (v11);
      }
      *(_BYTE *)(a1 + 2905) = v9;
      v12 = sub_2198655FC(a1, 0, 0);
      if (v12 == 13)
      {
LABEL_19:
        a2 = 13;
        goto LABEL_36;
      }
      v15 = v12;
      sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Set Rf Settings sequence failed to Set remaining configurations, failed with status=");
      v23 = 1;
      if (v15 == 143)
        v7 = 143;
      else
        v7 = 255;
LABEL_34:
      v8 = 146;
LABEL_35:
      a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v8, v7, 0, (uint64_t)&v23);
      goto LABEL_36;
    }
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"All Rf configs are set");
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"NFCC Hard reset success, verifying TML baud rate");
    if (*(_BYTE *)(a1 + 2939) == 1 || *(_BYTE *)(a1 + 2944) == 1 || *(_DWORD *)(a1 + 3056) == 2)
    {
      v13 = "Configuring of baud rate is not necessary.";
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"HSU baud rate different, changing it to the default baud rate (115200)");
      if (phTmlNfc_ConfigHsuBaudRate())
      {
        v23 = 1;
        sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"SetRfSettingsSeqComplete : Config Hsu Baud Rate failed Status ");
        goto LABEL_33;
      }
      v13 = "SetRfSettingsSeqComplete: TML HSU Baudrate Set to default baud rate";
    }
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v13);
    if (*(_DWORD *)(a1 + 3176) == 1)
    {
      if (phTmlNfc_IoCtl())
      {
LABEL_32:
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to Hard reset the controller, return failed");
        v23 = 1;
LABEL_33:
        v7 = 255;
        goto LABEL_34;
      }
      v14 = sub_2198972CC(*(unsigned int *)(a1 + 19368), *(_QWORD *)(a1 + 2952));
    }
    else
    {
      v14 = phTmlNfc_IoCtl();
    }
    if (!v14)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"NFCC hard resetted, performing Re-Init");
      *(_BYTE *)(a1 + 2882) = 0;
      phOsalNfc_SetMemory();
      *(_BYTE *)(a1 + 2883) = 1;
      if (*(_BYTE *)(a1 + 2936) == 1
        || *(_BYTE *)(a1 + 2937) == 1
        || *(_BYTE *)(a1 + 2938) == 1
        || *(_BYTE *)(a1 + 2944) == 1)
      {
        sub_2199013F4(*(_QWORD *)(a1 + 3040), 0);
        sub_21990135C(*(_QWORD *)(a1 + 3040), 0);
      }
      *(_BYTE *)(a1 + 2884) = 1;
      *(_QWORD *)(a1 + 2912) = off_2550A10F0;
      *(_BYTE *)(a1 + 2904) = 0;
      *(_BYTE *)(a1 + 2906) = 0;
      v17 = (char)off_2550A10F0[0];
      if (off_2550A10F0[0])
      {
        v17 = 0;
        v18 = off_2550A1100;
        do
        {
          ++v17;
          v19 = *v18;
          v18 += 2;
        }
        while (v19);
      }
      *(_BYTE *)(a1 + 2905) = v17;
      v20 = sub_2198655FC(a1, 0, 0);
      if (v20 != 13)
      {
        v21 = v20;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"NFCC Re-Init failed, return failed");
        sub_21987A7D4(a1);
        v23 = 1;
        if (v21 == 143)
          v22 = 143;
        else
          v22 = 137;
        v8 = 146;
        if (v21 == 179)
          v7 = 180;
        else
          v7 = v22;
        goto LABEL_35;
      }
      goto LABEL_19;
    }
    goto LABEL_32;
  }
  sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetRfSettingsSeqComplete: Invalid input parameter");
LABEL_36:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsSeqComplete");
  return a2;
}

uint64_t sub_2198E4FCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  BOOL v7;
  int v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  uint64_t v14;
  char v15;
  unsigned int v16;
  const char *v17;
  int v18;
  unsigned int *v19;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetCfgSignedCmd");
  if (!a1)
  {
    v17 = "Invalid parameter, Libnfc Context is Invalid";
    a2 = 1;
    v18 = 2;
    v19 = 0;
LABEL_23:
    sub_219850628(v18, v19, 4u, 1u, (uint64_t)v17);
    goto LABEL_24;
  }
  if (*(_DWORD *)(a1 + 3512) >= *(_DWORD *)(a1 + 3508))
  {
    v19 = (unsigned int *)(a1 + 19368);
    v17 = "phLibNfc_SetRfSignedCmd: Number of configurations to be set is 0";
    v18 = 1;
    goto LABEL_23;
  }
  *(_BYTE *)(a1 + 3249) = 0;
  phOsalNfc_SetMemory();
  v4 = *(_QWORD *)(a1 + 3240);
  v5 = *(unsigned int *)(a1 + 3512);
  v6 = *(_DWORD *)(a1 + 3508) - v5;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_BuildSetCfgSignedCmdPayload");
  if (v4)
    v7 = v6 > 0xF;
  else
    v7 = 0;
  v8 = v7;
  if (v8 == 1)
  {
    v9 = 0;
    v10 = 0;
    v11 = v4 + v5;
    while (1)
    {
      v12 = *(_BYTE *)(v11 + v10) & 0xFE;
      v13 = v12 == 160;
      if (v12 == 160)
        v14 = 2;
      else
        v14 = 3;
      if (v13)
        v15 = 3;
      else
        v15 = 4;
      v16 = (v15 + *(_BYTE *)(v11 + v14 + v10)) + v10;
      if (v16 >= 0xFF)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_BuildSetCfgSignedCmdPayload:data payload size exeeded, signature not copied");
        goto LABEL_28;
      }
      phOsalNfc_MemCopy();
      if (*(unsigned __int8 *)(v11 + v10) == 240)
        break;
      ++v9;
      v10 = v16;
      if ((~v16 & 0xFE) == 0)
        goto LABEL_28;
    }
    LOBYTE(v10) = v16;
LABEL_28:
    sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_BuildSetCfgSignedCmdPayload");
    if (v9 != 0)
    {
      *(_BYTE *)(a1 + 3250) = v9;
      a2 = sub_21990011C(*(_QWORD *)(a1 + 3040), a1 + 3250, v10 + 1, (uint64_t)sub_219865DD0, a1);
      if ((_DWORD)a2 == 13)
        *(_DWORD *)(a1 + 3512) += v10;
      else
        *(_DWORD *)(a1 + 3512) = 0;
    }
    else
    {
      a2 = 0;
    }
  }
  else
  {
    sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_BuildSetCfgSignedCmdPayload");
    a2 = 1;
  }
LABEL_24:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetCfgSignedCmd");
  return a2;
}

uint64_t sub_2198E5250(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BOOL4 v5;
  _BOOL4 v6;
  char v8;
  uint64_t (**v9)();
  uint64_t (*v10)();
  const char *v11;
  int v12;
  const char *v13;
  char v14;
  uint64_t (**v15)();
  uint64_t (*v16)();
  int v17;
  int v18;
  char v19;

  v19 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSignedSeqComplete");
  if (!a1)
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetRfSignedSeqComplete: Invalid input parameter");
    goto LABEL_14;
  }
  if ((_DWORD)a2)
  {
    v4 = 145;
    if ((_DWORD)a2 != 130 && (_DWORD)a2 != 143)
    {
      v5 = *(_DWORD *)(a1 + 3148) == 2;
      v6 = a2 == 147;
      if (v6 && v5)
        a2 = 0;
      else
        a2 = 255;
      if (v6 && v5)
        v4 = 145;
      else
        v4 = 146;
    }
    v19 = 1;
    goto LABEL_12;
  }
  if (*(_DWORD *)(a1 + 3512) < *(_DWORD *)(a1 + 3508))
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Re-Initialize the sequence to perform set signed config");
    *(_QWORD *)(a1 + 2912) = off_2550A3BE8;
    *(_BYTE *)(a1 + 2904) = 0;
    *(_BYTE *)(a1 + 2906) = 0;
    v8 = (char)off_2550A3BE8[0];
    if (off_2550A3BE8[0])
    {
      v8 = 0;
      v9 = off_2550A3BF8;
      do
      {
        ++v8;
        v10 = *v9;
        v9 += 2;
      }
      while (v10);
    }
    *(_BYTE *)(a1 + 2905) = v8;
    if (sub_2198655FC(a1, 0, 0) == 13)
    {
LABEL_20:
      a2 = 13;
      goto LABEL_14;
    }
    v13 = "Set Rf signed config sequence failed to Set remaining configurations, return failed";
    goto LABEL_32;
  }
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"All Rf configs are set");
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"NFCC Hard reset success, verifying TML baud rate");
  if (*(_BYTE *)(a1 + 2939) == 1 || *(_BYTE *)(a1 + 2944) == 1 || *(_DWORD *)(a1 + 3056) == 2)
  {
    v11 = "TML HSU baud rate is set to default, perform LibNfc Re-Init";
  }
  else
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"HSU baud rate different, changing it to the default baud rate (115200)");
    if (phTmlNfc_ConfigHsuBaudRate())
    {
      v19 = 1;
      sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"SetRfSignedSeqComplete : Config Hsu Baud Rate failed ");
      goto LABEL_33;
    }
    v11 = "SetRfSignedSeqComplete: TML HSU Baud rate Set to default baud rate";
  }
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)v11);
  if (*(_DWORD *)(a1 + 3176) == 1)
  {
    if (phTmlNfc_IoCtl())
    {
LABEL_31:
      v13 = "Failed to Hard reset the controller, return failed";
LABEL_32:
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)v13);
      v19 = 1;
LABEL_33:
      a2 = 255;
      goto LABEL_34;
    }
    v12 = sub_2198972CC(*(unsigned int *)(a1 + 19368), *(_QWORD *)(a1 + 2952));
  }
  else
  {
    v12 = phTmlNfc_IoCtl();
  }
  if (v12)
    goto LABEL_31;
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"NFCC hard resetted, performing Re-Init");
  *(_BYTE *)(a1 + 2882) = 0;
  phOsalNfc_SetMemory();
  *(_BYTE *)(a1 + 2883) = 1;
  if (*(_BYTE *)(a1 + 2936) == 1
    || *(_BYTE *)(a1 + 2937) == 1
    || *(_BYTE *)(a1 + 2938) == 1
    || *(_BYTE *)(a1 + 2944) == 1)
  {
    sub_2199013F4(*(_QWORD *)(a1 + 3040), 0);
    sub_21990135C(*(_QWORD *)(a1 + 3040), 0);
  }
  *(_BYTE *)(a1 + 2884) = 1;
  *(_QWORD *)(a1 + 2912) = off_2550A10F0;
  *(_BYTE *)(a1 + 2904) = 0;
  *(_BYTE *)(a1 + 2906) = 0;
  v14 = (char)off_2550A10F0[0];
  if (off_2550A10F0[0])
  {
    v14 = 0;
    v15 = off_2550A1100;
    do
    {
      ++v14;
      v16 = *v15;
      v15 += 2;
    }
    while (v16);
  }
  *(_BYTE *)(a1 + 2905) = v14;
  v17 = sub_2198655FC(a1, 0, 0);
  if (v17 == 13)
    goto LABEL_20;
  v18 = v17;
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"NFCC Re-Init failed, return failed");
  sub_21987A7D4(a1);
  v19 = 1;
  if (v18 == 179)
    a2 = 180;
  else
    a2 = 137;
LABEL_34:
  v4 = 146;
LABEL_12:
  a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, (uint64_t)&v19);
LABEL_14:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSignedSeqComplete");
  return a2;
}

uint64_t sub_2198E5640(uint64_t a1)
{
  uint64_t HsuMaxBaudRate;
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigHsuBrCmd");
  if (!a1 || *(_BYTE *)(a1 + 2939) == 1 || *(_BYTE *)(a1 + 2944) == 1)
  {
    HsuMaxBaudRate = 0;
  }
  else if (!*(_QWORD *)(a1 + 6056)
         || *(_DWORD *)(a1 + 3156) > 1u
         || (sub_21986C924(*(_QWORD *)(a1 + 19360), *(unsigned __int8 *)(a1 + 2988), *(unsigned __int8 *)(a1 + 3088)),
             HsuMaxBaudRate = phTmlNfc_GetHsuMaxBaudRate(),
             !(_DWORD)HsuMaxBaudRate))
  {
    if (phTmlNfc_ConfigHsuBaudRate())
    {
      sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ConfigHsuBrCmd : Check Hsu Baud Rate failed status");
      HsuMaxBaudRate = 51;
    }
    else
    {
      sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ConfigHsuBrCmd: Check succeeded with baudrate");
      phOsalNfc_Delay();
      v4 = phTmlNfc_ConfigHsuBaudRate();
      if ((_DWORD)v4)
      {
        HsuMaxBaudRate = v4;
        sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ConfigHsuBrCmd : Re-Config to exixting Baud Rate failed status");
      }
      else
      {
        sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ConfigHsuBrCmd: Re-Config to exixting Baud Rate succeeded");
        phOsalNfc_Delay();
        HsuMaxBaudRate = sub_2198FC894(*(_QWORD *)(a1 + 3040), *(_DWORD *)(a1 + 2948), (uint64_t)sub_219865DD0, a1);
      }
    }
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigHsuBrCmd");
  return HsuMaxBaudRate;
}

uint64_t sub_2198E57F4(uint64_t a1, uint64_t a2, _WORD *a3)
{
  const char *v6;
  int v7;
  unsigned int *v8;
  uint64_t v10;
  int v11;
  char v12;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigHsuBrResp");
  if (!a1 || !a3)
  {
    v6 = "phLibNfc_ConfigHsuBrResp : Libnfc Context or pInfo is Invalid";
    v7 = 2;
    v8 = (unsigned int *)a1;
LABEL_6:
    sub_219850628(v7, v8, 4u, 1u, (uint64_t)v6);
LABEL_7:
    a2 = 255;
    goto LABEL_8;
  }
  if ((_DWORD)a2)
  {
    sub_219851790(2, 0, 4u, 1u, (uint64_t)"phLibNfc_ConfigHsuBrResp: Failed to configure NFCC HSU baud rate");
    goto LABEL_8;
  }
  a2 = (unsigned __int16)*a3;
  if (!*a3)
  {
    if (*(_BYTE *)(a1 + 3161))
    {
      *(_BYTE *)(a1 + 3161) = 0;
      *(_DWORD *)(a1 + 3056) = *(_DWORD *)(a1 + 2948);
      sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"NFCC Configure HSU baud rate success after bBrRetryCnt");
      a2 = 0;
    }
    else
    {
      sub_21986607C(a1, *(_QWORD *)(a1 + 2912), 1);
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"NFCC Configure HSU baud rate success");
      a2 = phTmlNfc_ConfigHsuBaudRate();
      if ((_DWORD)a2)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ConfigHsuBrResp: Failed to updated TML HSU baud rate");
      }
      else
      {
        *(_DWORD *)(a1 + 3056) = *(_DWORD *)(a1 + 2948);
        sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ConfigHsuBrResp: TML HSU Baud rate Set to");
        phOsalNfc_Delay();
      }
    }
    goto LABEL_8;
  }
  if ((_DWORD)a2 != 44)
  {
    sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"NFCC Configure HSU baud rate Failed after bBrRetryCnt");
    *(_BYTE *)(a1 + 3161) = 0;
    goto LABEL_8;
  }
  v10 = *(_QWORD *)(a1 + 3040);
  sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"New HSU BR request failed, bBrRetryCnt");
  if (*(unsigned __int8 *)(a1 + 3161) > 2u)
  {
    sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Baudrate retry reached max count, bBrRetryCnt");
    *(_BYTE *)(a1 + 3161) = 0;
    goto LABEL_7;
  }
  phTmlNfc_ReadAbort();
  phTmlNfc_FlushTxRxBuffers();
  v11 = phTmlNfc_ConfigHsuBaudRate();
  if (!v10 || v11)
  {
    *(_BYTE *)(a1 + 3161) = 0;
    v6 = "phLibNfc_ConfigHsuBrResp: Cfg TML to new BR Failed";
    v7 = 1;
    v8 = (unsigned int *)(a1 + 19368);
    goto LABEL_6;
  }
  phOsalNfc_Delay();
  if (sub_219851DC0(v10 + 888, 0, 3) == 13)
  {
    if (*(_BYTE *)(a1 + 3161))
    {
      sub_219866158(a1, *(_QWORD *)(a1 + 2912), 1u);
      a2 = 0;
      v12 = *(_BYTE *)(a1 + 3161) + 1;
    }
    else
    {
      a2 = 0;
      v12 = 1;
    }
  }
  else
  {
    v12 = 1;
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_ConfigHsuBrResp: Nci Read request failed");
    sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"pLibContext->tPlatformInfo.bBrRetryCnt");
    a2 = 255;
  }
  *(_BYTE *)(a1 + 3161) = v12;
LABEL_8:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigHsuBrResp");
  return a2;
}

uint64_t sub_2198E5B00(uint64_t a1)
{
  uint64_t v2;
  int v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReApplyHsuBrCmd");
  if (a1)
  {
    if (*(_BYTE *)(a1 + 2939) == 1 || *(_BYTE *)(a1 + 2944) == 1)
    {
      v2 = 0;
    }
    else
    {
      v4 = sub_219899740((unsigned int *)a1, *(_QWORD *)(a1 + 2912));
      if (*(_DWORD *)(a1 + 3056) == 2 && v4 == 5)
      {
        v2 = 0;
        *(_BYTE *)(a1 + 3161) = 0;
      }
      else
      {
        v2 = sub_2198FC894(*(_QWORD *)(a1 + 3040), *(_DWORD *)(a1 + 2948), (uint64_t)sub_219865DD0, a1);
      }
    }
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_ReApplyHsuBrCmd: Invalid LIBNFC context!!");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReApplyHsuBrCmd");
  return v2;
}

uint64_t sub_2198E5BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigHsuBrSeqComplete");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      *(_DWORD *)(a1 + 3056) = 2;
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"ConfigHsuBrSeqComplete: NFCC Config Baudrate failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invlaid LibNfc Ctx received from NCI");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigHsuBrSeqComplete");
  return a2;
}

uint64_t sub_2198E5CB8(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartRfFieldOn");
  if (a1)
  {
    *(_BYTE *)(a1 + 6004) = 1;
    v2 = sub_2198FFA28(*(_QWORD *)(a1 + 3040), 1, (uint64_t)sub_219865DD0, a1);
    if ((_DWORD)v2 != 13)
      *(_BYTE *)(a1 + 6004) = 0;
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_AntennaTestCmd:Invalid Context");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StartRfFieldOn");
  return v2;
}

uint64_t sub_2198E5D78(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AntennaTestCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetAntennaTestParams");
    LOBYTE(v4) = v4 & 0xFE | *(_BYTE *)(a1 + 5988) & 1;
    sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetAntennaTestParams");
    phOsalNfc_Delay();
    v2 = sub_2198FF8D4(*(_QWORD *)(a1 + 3040), &v4, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 255;
    phOsalNfc_SetMemory();
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_AntennaTestCmd:Invalid Context");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AntennaTestCmd");
  return v2;
}

uint64_t sub_2198E5EAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v6;
  const char *v7;
  int v9;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AntennaTestResp");
  if (a1)
  {
    phOsalNfc_SetMemory();
    if (!(_DWORD)a2 && a3 && (v6 = *(_BYTE **)a3) != 0 && *(_DWORD *)(a3 + 8) == 3)
    {
      if (*v6)
      {
        v7 = "phLibNfc_AntennaTestResp: received failed status";
      }
      else
      {
        if ((*(_BYTE *)(a1 + 5988) & 1) != 0)
        {
          a2 = 0;
          v9 = v6[1];
          *(_DWORD *)(a1 + 6000) = v9;
          *(_DWORD *)(a1 + 6000) = v9 | (v6[2] << 8);
          *(_BYTE *)(a1 + 5996) |= 1u;
          goto LABEL_10;
        }
        v7 = "phLibNfc_AntennaTestResp: no of configs none";
      }
    }
    else
    {
      v7 = "phLibNfc_AntennaTestResp: Antenna Self Test failed";
    }
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)v7);
    a2 = 255;
  }
LABEL_10:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AntennaTestResp");
  return a2;
}

uint64_t sub_2198E5FD4(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StopRfFieldOn");
  if (a1)
  {
    v2 = sub_2198FFA28(*(_QWORD *)(a1 + 3040), 0, (uint64_t)sub_219865DD0, a1);
    if ((_DWORD)v2 == 13)
      *(_BYTE *)(a1 + 6004) = 0;
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_AntennaTestCmd:Invalid Context");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_StopRfFieldOn");
  return v2;
}

uint64_t sub_2198E6080(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t *v7;
  uint64_t v8;
  unsigned int *v9;
  const char *v10;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AntennaTestSeqComplete");
  if (a1)
  {
    if (a2 == 143)
    {
      v4 = 143;
LABEL_21:
      v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), 145, v4, 0, 0);
      goto LABEL_22;
    }
    if (!*(_BYTE *)(a1 + 6004) || *(uint64_t **)(a1 + 2912) == &qword_2550A3B28)
    {
      if (a2)
      {
        v9 = (unsigned int *)(a1 + 19368);
        v10 = "phLibNfc_AntennaTestSeqComplete: Failed status received from NFCC";
      }
      else
      {
        if ((*(_BYTE *)(a1 + 5988) & 1) == 0 || (*(_BYTE *)(a1 + 5996) & 1) != 0)
        {
          v4 = 0;
          goto LABEL_21;
        }
        v9 = (unsigned int *)(a1 + 19368);
        v10 = "phLibNfc_AntennaTestSeqComplete:TxLDO Current requested,same is not received";
      }
      sub_219850628(1, v9, 4u, 2u, (uint64_t)v10);
    }
    else
    {
      *(_QWORD *)(a1 + 2912) = &qword_2550A3B28;
      *(_BYTE *)(a1 + 2904) = 0;
      *(_BYTE *)(a1 + 2906) = 0;
      v6 = qword_2550A3B28;
      if (qword_2550A3B28)
      {
        v6 = 0;
        v7 = &qword_2550A3B38;
        do
        {
          ++v6;
          v8 = *v7;
          v7 += 2;
        }
        while (v8);
      }
      *(_BYTE *)(a1 + 2905) = v6;
      if (sub_2198655FC(a1, 0, 0) == 13)
      {
        v5 = 13;
        goto LABEL_22;
      }
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_AntennaTestSeqComplete: could not start RF Off sequence");
    }
    v4 = 255;
    goto LABEL_21;
  }
  sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_AntennaTestSeqComplete: Invalid LibNfc Ctx received from NCI");
  v5 = 255;
LABEL_22:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_AntennaTestSeqComplete");
  return v5;
}

uint64_t sub_2198E621C(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;
  char v8;
  __int16 v9;
  int8x8_t v10;
  char v11;
  char v12;
  int v13;
  _DWORD v15[384];
  int v16;
  __int16 v17;
  char v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  bzero(v15, 0x6E8uLL);
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigLoggingCmd");
  if (a1)
  {
    v4 = *(_DWORD *)(a1 + 104);
    v15[1] = 0x10000;
    v16 = 16;
    v18 = 0;
    v5 = v4 >> 4;
    if ((v4 & 0x5E7F) != 0x5E7F)
    {
      if ((v4 & 0x5E7F) != 0)
      {
        v9 = *(unsigned __int8 *)(a1 + 2944);
        v7 = *(unsigned __int8 *)(a1 + 2937);
        v10 = vand_s8(vand_s8((int8x8_t)vdup_n_s16((unsigned __int16)v4 >> 3), (int8x8_t)0x200010000400080), (int8x8_t)vshl_u16((uint16x4_t)vdup_n_s16((*(_BYTE *)(a1 + 2938) | v7 | v9)), (uint16x4_t)0x9000800060007));
        v6 = v10.i32[0] | v10.i32[1] | v4 & 3 | ((*(_QWORD *)&v10 | HIDWORD(*(_QWORD *)&v10)) >> 16) | (v4 >> 1) & 0x3C | (unsigned __int16)v5 & (unsigned __int16)(v9 << 10) & 0x400;
      }
      else
      {
        LOWORD(v6) = 0;
        v7 = *(unsigned __int8 *)(a1 + 2937);
      }
LABEL_12:
      v17 = v6;
      if (*(_BYTE *)(a1 + 2936) == 1)
      {
        v16 = 1040;
        v18 = BYTE1(v4) & 1;
        if (v7 == 1)
          goto LABEL_22;
        v13 = *(unsigned __int8 *)(a1 + 2938);
      }
      else
      {
        if (v7 == 1)
        {
          v16 = 1040;
          v18 = BYTE1(v4) & 1;
          goto LABEL_22;
        }
        v13 = *(unsigned __int8 *)(a1 + 2938);
        if (v13 != 1 && *(_BYTE *)(a1 + 2944) != 1)
          goto LABEL_21;
        v16 = 1040;
        v18 = BYTE1(v4) & 1;
      }
      if (v13 == 1)
        goto LABEL_22;
LABEL_21:
      if (*(_BYTE *)(a1 + 2944) != 1)
      {
LABEL_23:
        a2 = sub_2198FD4A4(*(_QWORD *)(a1 + 3040), (uint64_t)v15, (uint64_t)sub_219865DD0, a1);
        goto LABEL_24;
      }
LABEL_22:
      v17 = v6 & 0xF7FF | v5 & 0x800;
      goto LABEL_23;
    }
    v7 = *(unsigned __int8 *)(a1 + 2937);
    v8 = *(_BYTE *)(a1 + 2937);
    if (*(_BYTE *)(a1 + 2936) != 1)
    {
      if (v7 == 1)
      {
        v8 = 1;
      }
      else
      {
        v8 = *(_BYTE *)(a1 + 2937);
        if (*(_BYTE *)(a1 + 2938) != 1)
        {
          v8 = *(_BYTE *)(a1 + 2937);
          if (*(_BYTE *)(a1 + 2944) != 1)
          {
            LOWORD(v6) = 3;
            goto LABEL_12;
          }
        }
      }
    }
    v11 = *(_BYTE *)(a1 + 2944);
    v12 = *(_BYTE *)(a1 + 2938) | v8 | v11;
    LOWORD(v6) = ((v12 << 7) | ((v12 & 1) << 6)) | 0x1F | ((v12 & 1) << 8) | (32 * (v12 & 1)) | ((v12 & 1) << 9) | ((v11 & 1) << 10);
    goto LABEL_12;
  }
LABEL_24:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigLoggingCmd");
  return a2;
}

uint64_t sub_2198E64B0(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMeasuredFsRssiCfgCmd");
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
      && (*(_BYTE *)(a1 + 104) & 3) != 0)
    {
      phOsalNfc_SetMemory();
      *(_DWORD *)(a1 + 3564) |= 0x10000u;
      *(_DWORD *)(a1 + 5096) |= 0x40000u;
      a2 = sub_2198FE090(*(_QWORD *)(a1 + 3040), a1 + 3560, (uint64_t)sub_219865DD0, a1);
    }
  }
  else
  {
    a2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMeasuredFsRssiCfgCmd");
  return a2;
}

uint64_t sub_2198E6598(uint64_t a1, int a2)
{
  unsigned int *v4;
  const char *v5;
  int v6;
  uint64_t v7;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMeasuredFsRssiCfgProc");
  if (a1)
  {
    if (a2)
    {
      v4 = (unsigned int *)(a1 + 19368);
      v5 = "phLibNfc_GetMeasuredFsRssiCfgProc: Status Failed!";
    }
    else
    {
      if (*(_BYTE *)(a1 + 2937) == 1 && *(_BYTE *)(a1 + 5295) == 4
        || *(_BYTE *)(a1 + 2938) == 1 && *(_BYTE *)(a1 + 5295) == 5
        || *(_BYTE *)(a1 + 2944) == 1 && *(_BYTE *)(a1 + 5295) == 8)
      {
        v7 = 0;
        *(_BYTE *)(a1 + 306) = *(_BYTE *)(a1 + 5283);
        *(_WORD *)(a1 + 304) = *(_WORD *)(a1 + 5281);
        goto LABEL_7;
      }
      v4 = (unsigned int *)(a1 + 19368);
      v5 = "phLibNfc_GetMeasuredFsRssiCfgProc: Invalid length received!";
    }
    v6 = 1;
  }
  else
  {
    v5 = "phLibNfc_GetMeasuredFsRssiCfgProc:Context is Null";
    v6 = 2;
    v4 = 0;
  }
  sub_219850628(v6, v4, 4u, 1u, (uint64_t)v5);
  v7 = 255;
LABEL_7:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMeasuredFsRssiCfgProc");
  return v7;
}

uint64_t sub_2198E66B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigLoggingSeqComp");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"ConfigureLogging: Failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigLoggingSeqComp");
  return a2;
}

uint64_t sub_2198E6758(uint64_t a1)
{
  int v2;
  uint64_t v3;
  _DWORD v5[389];
  char v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  bzero(v5, 0x6E8uLL);
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigAssertLoggingCmd");
  if (a1)
  {
    v2 = *(_DWORD *)(a1 + 32);
    v5[1] = 0x10000;
    v5[384] = 32;
    v6 = v2;
    v3 = sub_2198FD4A4(*(_QWORD *)(a1 + 3040), (uint64_t)v5, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v3 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigAssertLoggingCmd");
  return v3;
}

uint64_t sub_2198E6854(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigAssertLoggingSeqComp");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"ConfigureAssertionLogging: Failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigAssertLoggingSeqComp");
  return a2;
}

uint64_t sub_2198E68FC(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerRfOnNtf");
  if (a1)
  {
    v2 = sub_2198FFC14(*(_QWORD *)(a1 + 3040), *(unsigned __int8 *)(a1 + 718), (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_TriggerRfOnNtf:Invalid Context");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerRfOnNtf");
  return v2;
}

uint64_t sub_2198E6998(unsigned int *a1, uint64_t a2)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerRfOnNtfProcess");
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerRfOnNtfProcess");
  return a2;
}

uint64_t sub_2198E69FC(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerRfSeqComplete");
  if (a1)
    a2 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), 145, a2, 0, 0);
  else
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_TriggerRfSeqComplete: Invlaid LibNfc Ctx received from NCI");
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerRfSeqComplete");
  return a2;
}

uint64_t sub_2198E6A98(uint64_t a1)
{
  uint64_t v2;
  int v4;
  __int16 v5;

  v5 = 0;
  v4 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPageCountCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    LOBYTE(v4) = 0;
    v2 = sub_219901000(*(_QWORD *)(a1 + 3040), (uint64_t)&v4, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPageCountCmd");
  return v2;
}

uint64_t sub_2198E6B60(uint64_t a1, int a2, uint64_t a3)
{
  _BYTE *v6;
  int v7;
  int v8;
  unsigned int *v9;
  const char *v10;
  int v11;
  uint64_t v12;
  uint64_t Memory;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPageCountProc");
  if (a1 && !a2 && a3 && (v6 = *(_BYTE **)a3) != 0)
  {
    if (*v6 || *(_DWORD *)(a3 + 8) != 5)
    {
      v9 = (unsigned int *)(a1 + 19368);
      v10 = "phLibNfc_GetPageCountProc: received failed status or invalid response length";
    }
    else
    {
      v7 = v6[3];
      *(_WORD *)(a1 + 5832) = v7;
      v8 = v7 | (v6[4] << 8);
      *(_WORD *)(a1 + 5832) = v8;
      if ((v8 - 65) >= 0xFFFFFFC0)
      {
        if (!*(_QWORD *)(a1 + 5840))
        {
          Memory = phOsalNfc_GetMemory();
          *(_QWORD *)(a1 + 5840) = Memory;
          if (!Memory)
          {
            v10 = "phLibNfc_GetPageCountProc: Failed to allocate memory";
            v11 = 1;
            v9 = (unsigned int *)(a1 + 19368);
            goto LABEL_12;
          }
          phOsalNfc_SetMemory();
        }
        v12 = 0;
        goto LABEL_13;
      }
      v9 = (unsigned int *)(a1 + 19368);
      v10 = "phLibNfc_GetPageCountProc: Total page count is zero or exceeded maximum number of flash page count ";
    }
    v11 = 1;
  }
  else
  {
    v10 = "phLibNfc_GetPageCountProc: Get page count operation failed";
    v11 = 2;
    v9 = (unsigned int *)a1;
  }
LABEL_12:
  sub_219850628(v11, v9, 4u, 1u, (uint64_t)v10);
  v12 = 255;
LABEL_13:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPageCountProc");
  return v12;
}

uint64_t sub_2198E6CB4(uint64_t a1)
{
  uint64_t v2;
  int v4;
  __int16 v5;

  v5 = 0;
  v4 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEraseCounterCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    LOBYTE(v4) = 1;
    HIWORD(v4) = *(_WORD *)(a1 + 5834);
    v5 = 32;
    if (*(unsigned __int16 *)(a1 + 5832) - HIWORD(v4) <= 31)
      v5 = *(_WORD *)(a1 + 5832) - HIWORD(v4);
    v2 = sub_219901000(*(_QWORD *)(a1 + 3040), (uint64_t)&v4, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEraseCounterCmd");
  return v2;
}

uint64_t sub_2198E6DA4(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  unsigned int *v10;
  unsigned __int16 v11;
  uint64_t v12;
  const char *v13;
  int v14;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEraseCounterProc");
  if (!a1 || a2 || !a3 || (v6 = *a3) == 0)
  {
    v13 = "phLibNfc_GetEraseCounterProc: Get erase counter operation failed";
    v14 = 2;
    v10 = (unsigned int *)a1;
LABEL_17:
    sub_219850628(v14, v10, 4u, 1u, (uint64_t)v13);
    v12 = 255;
    goto LABEL_18;
  }
  if (*(_BYTE *)v6 || (v7 = *((_DWORD *)a3 + 2), (v7 - 9) > 0x7D))
  {
    v10 = (unsigned int *)(a1 + 19368);
    v13 = "phLibNfc_GetEraseCounterProc: received failed status or invalid response length";
LABEL_16:
    v14 = 1;
    goto LABEL_17;
  }
  v8 = *(unsigned __int16 *)(v6 + 1);
  if (v8 != *(unsigned __int16 *)(a1 + 5834)
    || (v9 = *(unsigned __int16 *)(v6 + 3), v9 > *(unsigned __int16 *)(a1 + 5832) - v8)
    || v7 - 5 != 4 * v9)
  {
    v10 = (unsigned int *)(a1 + 19368);
    v13 = "phLibNfc_GetEraseCounterProc: Invalid data received from NFCC";
    goto LABEL_16;
  }
  v10 = (unsigned int *)(a1 + 19368);
  if (!*(_QWORD *)(a1 + 5840))
  {
    v13 = "phLibNfc_GetEraseCounterProc: Invalid memory";
    goto LABEL_16;
  }
  phOsalNfc_MemCopy();
  v11 = *(_WORD *)(a1 + 5834) + v9;
  *(_WORD *)(a1 + 5834) = v11;
  if (*(unsigned __int16 *)(a1 + 5832) > v11)
    sub_219866158(a1, *(_QWORD *)(a1 + 2912), 1u);
  v12 = 0;
LABEL_18:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEraseCounterProc");
  return v12;
}

uint64_t sub_2198E6F14(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  char *v11;
  int v12;
  uint64_t v13;
  int v14;
  _OWORD v16[17];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  memset(v16, 0, sizeof(v16));
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEraseCounterSeqComplete");
  if (a1)
  {
    phOsalNfc_SetMemory();
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetEraseCounterSeqComplete: Failed");
      v4 = 0;
      v5 = 146;
    }
    else
    {
      LODWORD(v16[0]) = 10;
      WORD4(v16[0]) = *(_WORD *)(a1 + 5834);
      if (WORD4(v16[0]))
      {
        v7 = 0;
        v8 = *(_QWORD *)(a1 + 5840);
        v9 = 4 * WORD4(v16[0]);
        do
        {
          v10 = *(unsigned __int8 *)(v8 + (unsigned __int16)v7);
          v4 = v16;
          v11 = (char *)v16 + v7;
          *((_DWORD *)v11 + 3) = v10;
          v12 = v10 | (*(unsigned __int8 *)(v8 + ((unsigned __int16)v7 | 1)) << 8);
          *((_DWORD *)v11 + 3) = v12;
          v13 = (unsigned __int16)v7 | 3;
          v14 = v12 | (*(unsigned __int8 *)(v8 + ((unsigned __int16)v7 | 2)) << 16);
          *((_DWORD *)v11 + 3) = v14;
          v7 += 4;
          *((_DWORD *)v11 + 3) = v14 | (*(unsigned __int8 *)(v8 + v13) << 24);
        }
        while (v9 != v7);
      }
      else
      {
        v4 = v16;
      }
      v5 = 145;
    }
    v6 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v5, a2, (uint64_t)v4, 0);
    if (*(_QWORD *)(a1 + 5840))
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 5840) = 0;
    }
    phOsalNfc_SetMemory();
  }
  else
  {
    v6 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetEraseCounterSeqComplete: Invlaid LibNfc Ctx received from NCI");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetEraseCounterSeqComplete");
  return v6;
}

uint64_t sub_2198E710C(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetProhibitTimerStsCmd");
  if (a1)
  {
    v2 = sub_21990112C(*(_QWORD *)(a1 + 3040), (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetProhibitTimerStsCmd: Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetProhibitTimerStsCmd");
  return v2;
}

uint64_t sub_2198E71A4(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  _OWORD v11[17];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  memset(v11, 0, sizeof(v11));
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetProhibitTimerStsSeqComplete");
  if (a1 && a3)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetProhibitTimerStsSeqComplete: Failed");
      v6 = 0;
      v7 = 146;
    }
    else
    {
      phOsalNfc_SetMemory();
      v9 = *a3;
      if (v9 <= 0xB && ((1 << v9) & 0xC01) != 0)
      {
        a2 = 0;
        LODWORD(v11[0]) = 11;
        DWORD2(v11[0]) = v9;
        HIDWORD(v11[0]) = *(_DWORD *)(a3 + 2);
        v6 = v11;
        v7 = 145;
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetProhibitTimerStsSeqComplete: Failed, Received unknown Timer ID");
        v6 = 0;
        v7 = 146;
        a2 = 255;
      }
    }
    v8 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v7, a2, (uint64_t)v6, 0);
  }
  else
  {
    v8 = 1;
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_GetProhibitTimerStsSeqComplete: Invalid LibNfc Ctx received from NCI");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetProhibitTimerStsSeqComplete");
  return v8;
}

uint64_t sub_2198E7364(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPowerTrackDataCmd");
  if (a1)
  {
    v2 = sub_219901244(*(_QWORD *)(a1 + 3040), (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPowerTrackDataCmd");
  return v2;
}

uint64_t sub_2198E73FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
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
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v11 = 0u;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPowerTrackDataSeqComplete");
  if (a1 && a3)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetPowerTrackDataSeqComplete: Failed");
      v6 = 0;
      v7 = 146;
    }
    else
    {
      v6 = &v11;
      phOsalNfc_SetMemory();
      LODWORD(v11) = 0;
      *((_QWORD *)&v11 + 1) = *(_QWORD *)a3;
      LODWORD(v12) = *(_DWORD *)(a3 + 8);
      BYTE4(v12) = *(_BYTE *)(a3 + 12);
      *(_WORD *)((char *)&v12 + 5) = *(_WORD *)(a3 + 13);
      *((_QWORD *)&v12 + 1) = *(_QWORD *)(a3 + 16);
      v9 = *(_DWORD *)(a3 + 24);
      DWORD2(v13) = 0;
      v7 = 145;
      *(_QWORD *)&v13 = v9;
    }
    v8 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v7, a2, (uint64_t)v6, 0);
  }
  else
  {
    v8 = 1;
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_GetPowerTrackDataSeqComplete: Invlaid LibNfc Ctx received from NCI");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetPowerTrackDataSeqComplete");
  return v8;
}

uint64_t sub_2198E7590(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwio1VoltageCmd");
  if (a1)
  {
    *(_BYTE *)(a1 + 6025) = 1;
    v2 = sub_219900DD4(*(_QWORD *)(a1 + 3040), 1, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSwio1VoltageCmd: Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwio1VoltageCmd");
  return v2;
}

uint64_t sub_2198E7638(uint64_t a1, int a2, _BYTE **a3)
{
  _BYTE *v6;
  unsigned int *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  int v12;
  __int16 v13;
  __int16 v14;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwioPadVoltageProc");
  if (!a1)
  {
    v8 = "phLibNfc_GetSwioPadVoltageProc: Invalid parameter, Libnfc Context is Invalid";
    v9 = 2;
    v7 = 0;
    goto LABEL_10;
  }
  if (a2 || !a3 || (v6 = *a3) == 0)
  {
    v7 = (unsigned int *)(a1 + 19368);
    v8 = "phLibNfc_GetSwioPadVoltageProc: read voltage of SWIO operation failed";
    goto LABEL_8;
  }
  if (*v6)
  {
    v7 = (unsigned int *)(a1 + 19368);
    v8 = "phLibNfc_GetSwioPadVoltageProc: received failed status";
LABEL_8:
    v9 = 1;
LABEL_10:
    sub_219850628(v9, v7, 4u, 1u, (uint64_t)v8);
    goto LABEL_11;
  }
  v12 = *(unsigned __int8 *)(a1 + 6025);
  if (v12 == 2)
  {
    v10 = 0;
    v14 = v6[1];
    *(_WORD *)(a1 + 5570) = v14;
    *(_WORD *)(a1 + 5570) = v14 | (v6[2] << 8);
    goto LABEL_12;
  }
  if (v12 == 1)
  {
    v10 = 0;
    v13 = v6[1];
    *(_WORD *)(a1 + 5568) = v13;
    *(_WORD *)(a1 + 5568) = v13 | (v6[2] << 8);
    goto LABEL_12;
  }
  sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetSwioPadVoltageProc: Unknown SWIO pad no");
LABEL_11:
  v10 = 255;
LABEL_12:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwioPadVoltageProc");
  return v10;
}

uint64_t sub_2198E777C(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwio2VoltageCmd");
  if (a1)
  {
    *(_BYTE *)(a1 + 6025) = 2;
    v2 = sub_219900DD4(*(_QWORD *)(a1 + 3040), 2, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSwio2VoltageCmd: Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwio2VoltageCmd");
  return v2;
}

uint64_t sub_2198E7824(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD v7[17];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(v7, 0, sizeof(v7));
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwioPadVoltageSeqComplete");
  if (a1)
  {
    phOsalNfc_SetMemory();
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetSwioPadVoltageSeqComplete: Failed");
      v4 = 146;
    }
    else
    {
      LODWORD(v7[0]) = 8;
      phOsalNfc_MemCopy();
      v4 = 145;
    }
    v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, (uint64_t)v7, 0);
    *(_BYTE *)(a1 + 6025) = 0;
  }
  else
  {
    v5 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSwioPadVoltageSeqComplete: Invlaid LibNfc Ctx received from NCI");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSwioPadVoltageSeqComplete");
  return v5;
}

uint64_t sub_2198E79A4(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetTrimVerCmd");
  if (a1)
  {
    v2 = sub_219900EF0(*(_QWORD *)(a1 + 3040), (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSwio1VoltageCmd: Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetTrimVerCmd");
  return v2;
}

uint64_t sub_2198E7A3C(uint64_t a1, int a2, _BYTE **a3)
{
  _BYTE *v6;
  unsigned int *v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v12;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetTrimVerProc");
  if (a1)
  {
    if (!a2 && a3 && (v6 = *a3) != 0)
    {
      if (!*v6)
      {
        v10 = 0;
        v12 = v6[1];
        *(_WORD *)(a1 + 5568) = v12;
        *(_WORD *)(a1 + 5568) = v12 | (v6[2] << 8);
        goto LABEL_11;
      }
      v7 = (unsigned int *)(a1 + 19368);
      v8 = "phLibNfc_GetTrimVerProc: received failed status";
    }
    else
    {
      v7 = (unsigned int *)(a1 + 19368);
      v8 = "phLibNfc_GetTrimVerProc: Get Trim version operation failed";
    }
    v9 = 1;
  }
  else
  {
    v8 = "phLibNfc_GetTrimVerProc: Invalid parameter, Libnfc Context is Invalid";
    v9 = 2;
    v7 = 0;
  }
  sub_219850628(v9, v7, 4u, 1u, (uint64_t)v8);
  v10 = 255;
LABEL_11:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetTrimVerProc");
  return v10;
}

uint64_t sub_2198E7B28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD v7[17];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(v7, 0, sizeof(v7));
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetTrimVerSeqComplete");
  if (a1)
  {
    phOsalNfc_SetMemory();
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetTrimVerSeqComplete: Failed");
      v4 = 146;
    }
    else
    {
      LODWORD(v7[0]) = 9;
      WORD4(v7[0]) = *(_WORD *)(a1 + 5568);
      v4 = 145;
    }
    v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, (uint64_t)v7, 0);
  }
  else
  {
    v5 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetTrimVerSeqComplete: Invlaid LibNfc Ctx received from NCI");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetTrimVerSeqComplete");
  return v5;
}

uint64_t sub_2198E7C80(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSmbLogCmd");
  if (a1)
  {
    v2 = sub_219901608(*(_QWORD *)(a1 + 3040), (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSmbLogCmd");
  return v2;
}

uint64_t sub_2198E7D18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSmbLogProcComplete");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetSmbLogProcComplete: Failed");
      v6 = 146;
    }
    else
    {
      phOsalNfc_SetMemory();
      LODWORD(v9) = 1;
      if (a3 && *(_DWORD *)(a3 + 8) && *(_QWORD *)a3)
      {
        LODWORD(v10) = *(_DWORD *)(a3 + 8);
        *((_QWORD *)&v9 + 1) = phOsalNfc_GetMemory();
        if (*((_QWORD *)&v9 + 1))
          phOsalNfc_MemCopy();
      }
      else
      {
        LODWORD(v10) = 0;
        *((_QWORD *)&v9 + 1) = 0;
      }
      v6 = 145;
    }
    v7 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v6, a2, (uint64_t)&v9, 0);
    if (*((_QWORD *)&v9 + 1))
    {
      phOsalNfc_FreeMemory();
      *((_QWORD *)&v9 + 1) = 0;
    }
  }
  else
  {
    v7 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSmbLogProcComplete: Invlaid LibNfc Ctx");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSmbLogProcComplete");
  return v7;
}

uint64_t sub_2198E7ED0(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetHlmDbgLogCmd");
  if (a1)
  {
    v2 = sub_219901828(*(_QWORD *)(a1 + 3040), 0, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetHlmDbgLogCmd");
  return v2;
}

uint64_t sub_2198E7F6C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v12 = 0;
  v13 = 0;
  v14 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetHlmDbgLogProcComplete");
  if (!a1)
  {
    v6 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSmbLogProcComplete: Invlaid LibNfc Ctx");
    goto LABEL_13;
  }
  phOsalNfc_SetMemory();
  *(_DWORD *)(a1 + 5560) = 5;
  if (a2 || !a3)
  {
    if (a3)
      v7 = a2;
    else
      v7 = 255;
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetHlmDbgLogProcComplete: Failed");
    *(_QWORD *)(a1 + 5576) = 0;
    v8 = *(_QWORD *)(a1 + 19360);
    v9 = 146;
    v10 = v7;
    goto LABEL_12;
  }
  *(_BYTE *)(a1 + 5568) = *(_BYTE *)a3;
  *(_BYTE *)(a1 + 5569) = *(_BYTE *)(a3 + 1);
  v12 = *(_QWORD *)(a3 + 8);
  LODWORD(v13) = *(unsigned __int16 *)(a3 + 2);
  if (!(_DWORD)v13)
  {
    v8 = *(_QWORD *)(a1 + 19360);
    v9 = 145;
    v10 = 0;
LABEL_12:
    v6 = sub_2198D1B2C(v8, v9, v10, a1 + 5560, 0);
    goto LABEL_13;
  }
  sub_2198EB980(a1, 9, &v12);
  v6 = 0;
LABEL_13:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetHlmDbgLogProcComplete");
  return v6;
}

uint64_t sub_2198E80E4(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntCmd");
  if (a1)
  {
    v2 = sub_219901718(*(_QWORD *)(a1 + 3040), (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntCmd");
  return v2;
}

uint64_t sub_2198E817C(unsigned int *a1, int a2, uint64_t a3)
{
  unsigned int *v6;
  uint64_t v7;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntProc");
  if (!a1)
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntProc: Libnfc Context is Invalid");
LABEL_7:
    v7 = 255;
    goto LABEL_8;
  }
  v6 = a1 + 4842;
  if (a2 || !a3)
  {
    sub_219850628(1, v6, 4u, 2u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntProc: operation failed");
    goto LABEL_7;
  }
  sub_219850628(1, v6, 4u, 4u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntProc: operation success");
  v7 = 0;
LABEL_8:
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntProc");
  return v7;
}

uint64_t sub_2198E8254(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD v10[17];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  memset(v10, 0, sizeof(v10));
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntComplete");
  if (a1)
  {
    if (a2 || !a3)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntComplete: Failed");
      v7 = 146;
      v6 = 255;
    }
    else
    {
      phOsalNfc_SetMemory();
      LODWORD(v10[0]) = 3;
      phOsalNfc_MemCopy();
      phOsalNfc_MemCopy();
      phOsalNfc_MemCopy();
      v6 = 0;
      v7 = 145;
    }
    v8 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v7, v6, (uint64_t)v10, 0);
  }
  else
  {
    v8 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntComplete: Invalid LibNfc Ctx");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetLpcdFalseDetCntComplete");
  return v8;
}

uint64_t sub_2198E83F8(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetVasCodeCfgCmd");
  if (a1)
  {
    v2 = sub_219901D60(*(_QWORD *)(a1 + 3040), 4, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetVasCodeCfgCmd : Libnfc Context is Invalid");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetVasCodeCfgCmd");
  return v2;
}

uint64_t sub_2198E8494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetVasCodeCfgComplete");
  if (a1)
  {
    if ((_DWORD)a2 || !a3)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetVasCodeCfgComplete: Failed");
      a3 = 0;
      v6 = 146;
    }
    else
    {
      v6 = 145;
    }
    v7 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v6, a2, a3, 0);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSetRfTransRegCfgComplete: Invlaid LibNfc Ctx");
    v7 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetVasCodeCfgComplete");
  return v7;
}

uint64_t sub_2198E8574(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSuicaSysCodeCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_DWORD *)(a1 + 3564) |= 0x10000u;
    *(_DWORD *)(a1 + 5096) |= 0x8000u;
    v2 = sub_2198FE090(*(_QWORD *)(a1 + 3040), a1 + 3560, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSuicaSysCodeCmd : Libnfc Context is Invalid");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSuicaSysCodeCmd");
  return v2;
}

uint64_t sub_2198E8644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSuicaSysCodeComplete");
  if (a1)
  {
    if ((_DWORD)a2 || !a3)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetSuicaSysCodeComplete: Failed");
      v6 = 146;
    }
    else
    {
      phOsalNfc_SetMemory();
      *(_DWORD *)(a1 + 5560) = 6;
      *(_BYTE *)(a1 + 5568) = *(_BYTE *)(a3 + 1662);
      *(_BYTE *)(a1 + 5569) = *(_BYTE *)(a3 + 1663);
      *(_WORD *)(a1 + 5570) = *(_WORD *)(a3 + 1664);
      *(_WORD *)(a1 + 5572) = *(_WORD *)(a3 + 1666);
      v6 = 145;
    }
    v7 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v6, a2, a1 + 5560, 0);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetSetRfTransRegCfgComplete: Invlaid LibNfc Ctx");
    v7 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetSuicaSysCodeComplete");
  return v7;
}

uint64_t sub_2198E876C(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[4];
  int v5;
  char v6;
  char v7;
  char v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  bzero(v4, 0x6E8uLL);
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSmbCfgCmd");
  if (a1)
  {
    v5 = 0x4000;
    v6 = 1;
    phOsalNfc_MemCopy();
    if (*(_DWORD *)(a1 + 5424) == 1)
    {
      v8 = 0;
      v6 |= 6u;
      phOsalNfc_MemCopy();
      v6 |= 8u;
      phOsalNfc_MemCopy();
    }
    else
    {
      v7 = 0;
    }
    v2 = sub_2198FD4A4(*(_QWORD *)(a1 + 3040), (uint64_t)v4, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetSmbCfgCmd : Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSmbCfgCmd");
  return v2;
}

uint64_t sub_2198E8900(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSmbCfgComplete");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_SetSmbCfgComplete: Failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    v5 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetSmbCfgComplete: Invlaid LibNfc Ctx");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSmbCfgComplete");
  return v5;
}

uint64_t sub_2198E89CC(uint64_t a1)
{
  uint64_t v2;
  _DWORD v4[415];
  char v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  bzero(v4, 0x6E8uLL);
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetHLMCfgCmd");
  if (a1)
  {
    v4[1] = 0x10000;
    v4[384] = 4096;
    v5 = *(_DWORD *)(a1 + 5424);
    v2 = sub_2198FD4A4(*(_QWORD *)(a1 + 3040), (uint64_t)v4, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetHLMCfgCmd : Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetHLMCfgCmd");
  return v2;
}

uint64_t sub_2198E8AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HLMCfgComplete");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_HLMCfgComplete: Failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    v5 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_HLMCfgComplete: Invlaid LibNfc Ctx");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_HLMCfgComplete");
  return v5;
}

uint64_t sub_2198E8B94(uint64_t a1)
{
  char v2;
  char v3;
  uint64_t v4;
  _DWORD v6[417];
  char v7;
  __int16 v8;
  char v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  bzero(v6, 0x6E8uLL);
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetMultiTagCfgCmd");
  if (!a1)
  {
    v4 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetMultiTagCfgCmd : Libnfc Context is Invalid");
    goto LABEL_17;
  }
  v6[1] = 0x10000;
  v6[384] = 0x20000;
  phOsalNfc_SetMemory();
  v2 = *(_BYTE *)(a1 + 5424);
  if ((v2 & 8) != 0)
  {
    v7 |= 1u;
    if ((v2 & 1) == 0)
    {
LABEL_4:
      if ((v2 & 2) == 0)
        goto LABEL_5;
      goto LABEL_20;
    }
  }
  else if ((*(_BYTE *)(a1 + 5424) & 1) == 0)
  {
    goto LABEL_4;
  }
  v7 |= 2u;
  if ((v2 & 2) == 0)
  {
LABEL_5:
    if ((v2 & 4) == 0)
      goto LABEL_6;
    goto LABEL_21;
  }
LABEL_20:
  v7 |= 4u;
  if ((v2 & 4) == 0)
  {
LABEL_6:
    if ((v2 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_22;
  }
LABEL_21:
  v7 |= 8u;
  if ((v2 & 0x10) == 0)
  {
LABEL_7:
    if ((v2 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_23;
  }
LABEL_22:
  v7 |= 0x10u;
  if ((v2 & 0x20) == 0)
  {
LABEL_8:
    if ((v2 & 0x40) == 0)
      goto LABEL_9;
LABEL_24:
    v7 |= 0x40u;
    if ((v2 & 0x80) == 0)
      goto LABEL_10;
LABEL_25:
    v7 |= 0x80u;
    goto LABEL_10;
  }
LABEL_23:
  v7 |= 0x20u;
  if ((v2 & 0x40) != 0)
    goto LABEL_24;
LABEL_9:
  if (v2 < 0)
    goto LABEL_25;
LABEL_10:
  v8 = *(_WORD *)(a1 + 5428);
  if (*(_BYTE *)(a1 + 5435) == 1)
    v9 |= 1u;
  v10 = *(_BYTE *)(a1 + 5436);
  if (*(unsigned __int16 *)(a1 + 5438) <= 0x9F6u)
    v3 = *(_WORD *)(a1 + 5438) / 0xAu;
  else
    v3 = -1;
  v11 = v3;
  v12 = 8;
  v4 = sub_2198FD4A4(*(_QWORD *)(a1 + 3040), (uint64_t)v6, (uint64_t)sub_219865DD0, a1);
LABEL_17:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetMultiTagCfgCmd");
  return v4;
}

uint64_t sub_2198E8DA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetClearMultiTagCfgComp");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_SetClearMultiTagCfgComp: Failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    v5 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetClearMultiTagCfgComp: Invlaid LibNfc Ctx");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetClearMultiTagCfgComp");
  return v5;
}

uint64_t sub_2198E8E6C(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMultiTagInfoCmd");
  if (a1)
  {
    v2 = sub_2198FCA9C(*(_QWORD *)(a1 + 3040), (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetMultiTagInfoCmd : Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMultiTagInfoCmd");
  return v2;
}

uint64_t sub_2198E8F04(uint64_t a1, int a2, uint64_t a3)
{
  _BYTE *v6;
  const char *v7;
  int v8;
  unsigned int *v9;
  uint64_t v10;
  int v12;
  unsigned __int8 v13;
  unsigned int v14;
  int v15;
  unsigned __int8 v16;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMultiTagInfoProc");
  if (!a1)
  {
    v7 = "phLibNfc_GetMultiTagInfoProc : Libnfc Context is Invalid";
    v8 = 2;
    v9 = 0;
    goto LABEL_10;
  }
  if (a2 || !a3 || (v6 = *(_BYTE **)a3) == 0 || !*(_DWORD *)(a3 + 8))
  {
    v9 = (unsigned int *)(a1 + 19368);
    v7 = "phLibNfc_GetMultiTagInfoProc: operation failed";
    v8 = 1;
    goto LABEL_10;
  }
  if (*v6)
  {
    v7 = "phLibNfc_GetMultiTagInfoProc: received failed status";
    v8 = 1;
    v9 = (unsigned int *)(a1 + 19368);
LABEL_10:
    sub_219850628(v8, v9, 4u, 1u, (uint64_t)v7);
    goto LABEL_11;
  }
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_GetMultiTagInfoProc: Get Multi-tag info response received with success");
  phOsalNfc_SetMemory();
  *(_DWORD *)(a1 + 5560) = 7;
  *(_BYTE *)(a1 + 5568) = v6[1];
  v16 = 3;
  v12 = v6[2];
  *(_BYTE *)(a1 + 5569) = v12;
  v13 = 5 * v12 + 4;
  if (v12)
  {
    if (*(_DWORD *)(a3 + 8) >= v13)
    {
      *(_QWORD *)(a1 + 5576) = phOsalNfc_GetMemory();
      phOsalNfc_SetMemory();
      sub_2198ECDF8((unsigned int *)a1, &v16, *(unsigned __int8 *)(a1 + 5569), 0, *(_BYTE **)(a1 + 5576), (uint64_t *)a3);
      v10 = 0;
      v14 = v16;
      goto LABEL_19;
    }
    *(_QWORD *)(a1 + 5576) = 0;
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetMultiTagInfoProc: Tag of interest detected but partial info received");
    sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"bNumTags");
    v10 = 255;
  }
  else
  {
    v10 = 0;
    *(_QWORD *)(a1 + 5576) = 0;
  }
  v14 = 3;
LABEL_19:
  v16 = v14 + 1;
  v15 = v6[v14];
  *(_BYTE *)(a1 + 5584) = v15;
  if (!v15)
  {
    *(_QWORD *)(a1 + 5592) = 0;
    goto LABEL_12;
  }
  if (*(_DWORD *)(a3 + 8) >= (v15 + v13))
  {
    *(_QWORD *)(a1 + 5592) = phOsalNfc_GetMemory();
    phOsalNfc_SetMemory();
    sub_2198ECDF8((unsigned int *)a1, &v16, *(unsigned __int8 *)(a1 + 5584), 1, *(_BYTE **)(a1 + 5592), (uint64_t *)a3);
    goto LABEL_12;
  }
  *(_QWORD *)(a1 + 5592) = 0;
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetMultiTagInfoProc: Tag of Not interest detected but partial info received");
  sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"bNumTags");
LABEL_11:
  v10 = 255;
LABEL_12:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMultiTagInfoProc");
  return v10;
}

uint64_t sub_2198E91CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMultiTagInfoComp");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetMultiTagInfoComp: Failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, a1 + 5560, 0);
    if (*(_QWORD *)(a1 + 5576))
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 5576) = 0;
    }
    if (*(_QWORD *)(a1 + 5592))
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 5592) = 0;
    }
  }
  else
  {
    v5 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetMultiTagInfoComp: Invalid LibNfc Ctx");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetMultiTagInfoComp");
  return v5;
}

uint64_t sub_2198E92D8(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ClearMultiTagInfoCmd");
  if (a1)
  {
    v2 = sub_2198FCBB8(*(_QWORD *)(a1 + 3040), (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_ClearMultiTagInfoCmd : Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ClearMultiTagInfoCmd");
  return v2;
}

uint64_t sub_2198E9370(uint64_t a1)
{
  uint64_t v2;
  __int16 v4;

  v4 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestMode");
  if (a1)
  {
    v2 = sub_2198FB470(*(_QWORD *)(a1 + 2952), (uint64_t)&v4, (uint64_t)sub_2198655FC, a1, 0, 0);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestMode");
  return v2;
}

uint64_t sub_2198E9420(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unsigned __int16 *v6;
  int v7;
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeRspCb");
  if (a1 && a3)
  {
    v6 = (unsigned __int16 *)a3[1];
    v7 = a2;
    if (v6 && (v7 = *v6, v7 == 44))
    {
      sub_219866158(a1, (uint64_t)off_2550A3D58, 1u);
    }
    else if (!v7)
    {
      v8 = *a3;
      *(_QWORD *)(a1 + 3040) = *a3;
      if (sub_2198975C8(a1, v8)
        || !sub_21986C924(*(_QWORD *)(a1 + 19360), *(unsigned __int8 *)(a1 + 2988), *(unsigned __int8 *)(a1 + 3088)))
      {
        a2 = 255;
      }
      else if (*(_DWORD *)(a1 + 19328) == 1)
      {
        sub_21986607C(a1, *(_QWORD *)(a1 + 2912), 1);
      }
    }
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeRspCb");
  return a2;
}

uint64_t sub_2198E9514(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeComplete");
  if (a1)
  {
    if ((_DWORD)a2)
      v4 = 146;
    else
      v4 = 145;
    sub_2198D1B2C(*(_QWORD *)(a1 + 2952), v4, a2, 0, 0);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeComplete");
  return a2;
}

uint64_t sub_2198E9594(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetVasCodeCfgCmd");
  if (a1)
  {
    v2 = sub_219901BD8(*(_QWORD *)(a1 + 3040), (int *)(a1 + 5416), (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetVasCodeCfgCmd : Libnfc Context is Invalid");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetVasCodeCfgCmd");
  return v2;
}

uint64_t sub_2198E9634(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetVasCodeCfgComplete");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_SetVasCodeCfgComplete: Failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetVasCodeCfgComplete: Invlaid LibNfc Ctx");
    v5 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetVasCodeCfgComplete");
  return v5;
}

uint64_t sub_2198E9700(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RFParaUpdateCmd");
  if (a1)
  {
    v2 = sub_219901BD8(*(_QWORD *)(a1 + 3040), (int *)(a1 + 5416), (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_RFParaUpdateCmd : Libnfc Context is Invalid");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RFParaUpdateCmd");
  return v2;
}

uint64_t sub_2198E97A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RFParaUpdateComplete");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_RFParaUpdateComplete: Failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_RFParaUpdateComplete: Invlaid LibNfc Ctx");
    v5 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RFParaUpdateComplete");
  return v5;
}

uint64_t sub_2198E986C(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_DWORD *)(a1 + 3564) |= 0x10000u;
    *(_DWORD *)(a1 + 5096) |= 0x8000u;
    *(_WORD *)(a1 + 5222) = *(_WORD *)(a1 + 5424);
    *(_DWORD *)(a1 + 5224) = *(_DWORD *)(a1 + 5426);
    v2 = sub_2198FD4A4(*(_QWORD *)(a1 + 3040), a1 + 3560, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeCmd : Libnfc Context is Invalid");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeCmd");
  return v2;
}

uint64_t sub_2198E9964(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeComplete");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeComplete: Failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeComplete: Invlaid LibNfc Ctx");
    v5 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetSuicaEntrySysCodeComplete");
  return v5;
}

uint64_t sub_2198E9A30(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeOff");
  if (a1)
  {
    v2 = sub_2198FF49C(*(unsigned int **)(a1 + 3040), 0, (uint64_t)sub_2198655FC, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeOff");
  return v2;
}

uint64_t sub_2198E9ACC(unsigned int *a1, uint64_t a2)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeOffRspCb");
  if ((_DWORD)a2)
    sub_219850628(2, a1, 4u, 1u, (uint64_t)"ConfigTestModeOff: Failed");
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeOffRspCb");
  return a2;
}

uint64_t sub_2198E9B48(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeOffComplete");
  if (a1)
    sub_2198D1B2C(*(_QWORD *)(a1 + 2952), 145, a2, 0, 0);
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeOffComplete");
  return a2;
}

uint64_t sub_2198E9BC0(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgCmd");
  if (a1)
  {
    v2 = sub_219901BD8(*(_QWORD *)(a1 + 3040), (int *)(a1 + 5416), (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetChipScopeLogCfgCmd : Libnfc Context is Invalid");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgCmd");
  return v2;
}

uint64_t sub_2198E9C60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgComplete");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_SetChipScopeLogCfgComplete: Failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetChipScopeLogCfgComplete: Invlaid LibNfc Ctx");
    v5 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgComplete");
  return v5;
}

uint64_t sub_2198E9D2C(uint64_t a1)
{
  int v2;
  int v3;
  const char *v4;
  int v5;
  unsigned int *v6;
  uint64_t v7;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetCWRFCfgCmd");
  if (!a1)
  {
    v4 = "phLibNfc_SetCWRFCfgCmd:Invalid Context";
    v5 = 2;
    v6 = 0;
LABEL_11:
    sub_219850628(v5, v6, 4u, 1u, (uint64_t)v4);
    v7 = 255;
    goto LABEL_12;
  }
  if (*(_DWORD *)(a1 + 5424) == 1)
  {
    v2 = *(unsigned __int8 *)(a1 + 5428);
    if (v2 == 1)
      v3 = 1;
    else
      v3 = 2 * (v2 == 2);
  }
  else
  {
    v3 = 0;
  }
  if (sub_2198FFA28(*(_QWORD *)(a1 + 3040), v3, (uint64_t)sub_219865DD0, a1) != 13)
  {
    v6 = (unsigned int *)(a1 + 19368);
    v4 = "phLibNfc_SetCWRFCfgCmd:Sending command failed";
    v5 = 1;
    goto LABEL_11;
  }
  v7 = 13;
LABEL_12:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetCWRFCfgCmd");
  return v7;
}

uint64_t sub_2198E9E18(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetCWRFCfgComplete");
  if (a1)
  {
    if (a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"phLibNfc_SetCWRFCfgComplete: Failed status received from NFCC");
      v4 = 255;
    }
    else
    {
      v4 = 0;
    }
    v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), 145, v4, 0, 0);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetCWRFCfgComplete: Invalid LibNfc Ctx received from NCI");
    v5 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetCWRFCfgComplete");
  return v5;
}

uint64_t sub_2198E9EE4(uint64_t a1, unint64_t a2, float *a3)
{
  float v6;
  float v7;
  float v8;
  float v9;
  unsigned int v10;
  uint64_t v11;
  float v12;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ApcCalculation2_x");
  if (*(_BYTE *)(a1 + 2936) == 1)
  {
    v6 = flt_21990B0B8[3 * ((a2 >> 7) & 3) + 1];
    v7 = flt_21990B0B8[3 * ((a2 >> 9) & 0xF)] + v6;
    LOBYTE(v6) = aDbYwvutsrqponm[(a2 >> 1) & 0x1F];
    v8 = flt_21990B0B8[3 * ((a2 >> 6) & 1) + 2] * (float)(v7 * (float)((float)LODWORD(v6) / 100.0));
    v9 = (float)((a2 & 1) + 1);
LABEL_6:
    v11 = 0;
    *a3 = v8 * v9;
    goto LABEL_7;
  }
  v10 = (a2 >> 8) & 7;
  *a3 = 0.0;
  if (v10 <= 4)
  {
    v12 = (double)(a2 & 0x1F) * -1.61 * 0.5 / 100.0 + 1.0;
    v8 = (float)(flt_21990B178[3 * v10] + flt_21990B178[3 * (a2 >> 6) + 1]) * v12;
    v9 = 2.0 - flt_21990B178[3 * ((a2 >> 5) & 1) + 2] + 1.0;
    goto LABEL_6;
  }
  v11 = 255;
LABEL_7:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ApcCalculation2_x");
  return v11;
}

uint64_t sub_2198EA064(uint64_t a1, unsigned int a2, unsigned int *a3)
{
  unsigned int v6;
  unsigned int v7;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_CalcFieldStrength");
  if (a3)
  {
    v7 = *(unsigned __int16 *)(a1 + 304);
    if (*(_WORD *)(a1 + 304))
    {
      LOBYTE(v6) = *(_BYTE *)(a1 + 306);
      v7 = (float)((float)((float)((float)((float)v6 * 1000.0) * 0.0625) * (float)a2) / (float)v7);
    }
    *a3 = v7;
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_CalcFieldStrength");
}

uint64_t sub_2198EA108(uint64_t a1, unsigned int a2, float *a3, float *a4)
{
  uint64_t v8;
  float v9;
  float v10;
  float v11;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ApcCalculation3_0");
  v8 = 0;
  if (a3 && a4)
  {
    if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
    {
      v8 = 0;
      *a4 = (float)(HIWORD(a2) & 0x7FF) * 0.25;
      v9 = (double)BYTE1(a2) / 255.0;
      v10 = (float)((float)((float)(a2 >> 2) / 10.0) + 1.5) * v9;
      v11 = 1.0;
      if ((a2 & 2) == 0)
        v11 = 2.0;
      *a3 = (float)(v11 * v10) * (float)(int)((a2 & 1) + 1);
    }
    else
    {
      v8 = 255;
    }
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ApcCalculation3_0");
  return v8;
}

uint64_t sub_2198EA228(unsigned int *a1, int a2)
{
  uint64_t v4;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeL1State");
  if ((a2 - 1) < 0xE)
    v4 = (a2 - 1) + 1;
  else
    v4 = 255;
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeL1State");
  return v4;
}

uint64_t sub_2198EA2A0(unsigned int *a1, char a2)
{
  uint64_t v4;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeL1FelicaState");
  if (((a2 - 1) & 0xF8) != 0)
    v4 = 255;
  else
    v4 = (a2 - 1) + 1;
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeL1FelicaState");
  return v4;
}

uint64_t sub_2198EA318(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeLxClifTech");
  switch((int)a2)
  {
    case 1:
      break;
    case 2:
      a2 = 2;
      break;
    case 3:
      a2 = 3;
      break;
    case 4:
      a2 = 4;
      break;
    case 5:
      a2 = 5;
      break;
    case 6:
      a2 = 6;
      break;
    case 7:
      a2 = 7;
      break;
    case 8:
      a2 = 8;
      break;
    case 9:
      a2 = 9;
      break;
    case 10:
      a2 = 10;
      break;
    case 11:
      a2 = 11;
      break;
    case 12:
      a2 = 12;
      break;
    case 13:
      a2 = 13;
      break;
    case 14:
      a2 = 14;
      break;
    case 15:
      if (*(_BYTE *)(a1 + 2936) == 1 || *(_BYTE *)(a1 + 2937) == 1)
      {
        a2 = 15;
      }
      else
      {
        a2 = 15;
        if (*(_BYTE *)(a1 + 2938) != 1)
        {
          if (*(_BYTE *)(a1 + 2944) == 1)
            a2 = 15;
          else
            a2 = 255;
        }
      }
      break;
    default:
      a2 = 255;
      break;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeLxClifTech");
  return a2;
}

uint64_t sub_2198EA448(unsigned int *a1, int a2)
{
  unsigned int v4;
  unsigned __int8 v5;
  unsigned int v6;
  char v7;
  char v8;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeDataRxFailure");
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ParseLogNtfDatRxFailure");
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ParseLogNtfDatRxFailure");
  if ((a2 & 0xFFFFFFBF) == 0x84)
  {
    v4 = a1[16];
    sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_CheckDpllLock");
    if (v4 - 8 >= 6)
      v5 = -1;
    else
      v5 = 0x848484FF8484uLL >> (8 * (v4 - 8));
    sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_CheckDpllLock");
  }
  else
  {
    v6 = a1[16];
    if (v6 == 5)
      v7 = a2 & 0xBF;
    else
      v7 = -1;
    if (v6 == 7)
      v8 = a2 & 0xBF;
    else
      v8 = -1;
    if (((a2 & 0xBF) + 123) <= 4u)
      v5 = v8;
    else
      v5 = v7;
  }
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ComputeDataRxFailure");
  return v5;
}

uint64_t sub_2198EA578(unsigned int *a1, int a2, int a3, int a4, int a5)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ExtractAPCInfo");
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ExtractAPCInfo");
  return a2 | (a3 << 8) | (a4 << 16) | (a5 << 24);
}

unsigned int *sub_2198EA5FC(unsigned int *a1, unsigned __int8 **a2)
{
  int v4;
  int v5;
  int v6;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ProcSysL1LogStandbyNtf");
  phOsalNfc_SetMemory();
  a1[12] = 1;
  a1[14] = **a2;
  v4 = a1[15] | (*a2)[1];
  a1[15] = v4;
  v5 = v4 | ((*a2)[2] << 8);
  a1[15] = v5;
  v6 = v5 | ((*a2)[3] << 16);
  a1[15] = v6;
  a1[15] = v6 | ((*a2)[4] << 24);
  sub_219851888(1, a1 + 4842, 4u, 4u, (uint64_t)"LoggingNtfHandler: L1-phNfc_SysL1LogEntry.StandbyEvent");
  sub_219851888(1, a1 + 4842, 4u, 4u, (uint64_t)"LoggingNtfHandler: L1-pSysL1StdbyDbgInfoEntry.eStandByDebgInfoTye");
  sub_219851888(1, a1 + 4842, 4u, 4u, (uint64_t)"\n\nLoggingNtfHandler: L1-phNfc_sSysL1LoggingEventEntry_t.dwStandbyPrvntnHwRegValue");
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ProcSysL1LogStandbyNtf");
  return a1 + 10;
}

uint64_t sub_2198EA744(uint64_t a1, _BYTE **a2)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcSysL1LogDpcEventNtf");
  phOsalNfc_SetMemory();
  *(_DWORD *)(a1 + 52) = 1;
  *(_BYTE *)(a1 + 56) = **a2;
  *(_BYTE *)(a1 + 57) = (*a2)[1];
  *(_WORD *)(a1 + 58) = *((_WORD *)*a2 + 1);
  *(_BYTE *)(a1 + 60) = (*a2)[4];
  sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"\n\nLoggingNtfHandler: L1-phNfc_sSysL1LoggingEventEntry_t.pSysL1DpcDbgInfoEntry.bDpcVddPaLutIdx");
  sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"\n\nLoggingNtfHandler: L1-phNfc_sSysL1LoggingEventEntry_t.pSysL1DpcDbgInfoEntry.wDpcVddPaCurrent");
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ProcSysL1LogDpcEventNtf");
  return a1 + 40;
}

uint64_t sub_2198EA844(uint64_t a1, uint64_t *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  unsigned int v6;
  unsigned int *v7;
  uint64_t v8;
  unsigned int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned __int8 *v14;
  uint64_t v15;
  _WORD *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  __int16 v24;
  __int16 v25;
  unsigned __int16 v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  __int16 v30;
  unsigned __int8 v31;
  _WORD *v32;
  __int16 v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;
  __int16 v37;
  __int16 v38;
  uint64_t v39;
  int v40;
  unsigned int v41;
  int v42;
  int v43;
  unsigned int v44;
  uint64_t v45;
  unsigned int v46;
  uint64_t v47;
  __int16 v48;
  unsigned int v49;
  uint64_t v50;
  __int16 v51;
  char v52;
  uint64_t v53;
  __int16 v54;
  unsigned int v55;
  uint64_t v56;
  __int16 v57;
  unsigned int v58;
  uint64_t v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  unsigned int *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  _DWORD *v76;
  _DWORD *v77;
  unsigned int v78;
  int v79;
  int *v80;
  unsigned int v81;
  int v82;
  BOOL v83;
  const char *v84;
  unsigned int v85;
  int v86;
  int v87;
  unsigned int v88;
  int v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t v95;
  char v96;
  _DWORD *v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  uint64_t v101;
  unsigned int v102;
  int v103;
  uint64_t v104;
  char v105;
  uint64_t v106;
  int v107;
  _DWORD *v109;
  _DWORD *v110;
  _DWORD *v111;
  unsigned int v112;
  unsigned __int8 *v113;
  int v114;
  int v115;
  int v116;
  int v117;
  uint64_t v118;
  uint64_t v119;
  _DWORD *v120;
  int *v121;
  unsigned int v122;
  int v123;
  uint64_t v124;
  float v125[4];

  v3 = a3;
  v124 = 0;
  *(_DWORD *)a3 = 0;
  a3[4] = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Sn100AndAboveProcSysL2LogNtf");
  if (*((_DWORD *)a2 + 2))
  {
    v6 = 0;
    v7 = (unsigned int *)(a1 + 19368);
    v113 = v3;
    while (2)
    {
      v8 = *a2;
      v9 = *(unsigned __int8 *)(*a2 + v6);
      v10 = v9 & 0xF;
      v11 = v6 + 1;
      switch(v9 >> 4)
      {
        case 1u:
          v123 = v9 & 0xF;
          v12 = *((_QWORD *)v3 + 1);
          v13 = *v3;
          *(_QWORD *)v125 = 0;
          sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_L2EventProc");
          if (!v12)
            goto LABEL_135;
          v14 = (unsigned __int8 *)(v8 + v11);
          v15 = v12 + 52 * v13;
          *(_DWORD *)(v15 + 44) = 0;
          v111 = (_DWORD *)(v15 + 44);
          v16 = (_WORD *)v15;
          *(_DWORD *)(v15 + 32) = 0;
          v110 = (_DWORD *)(v15 + 32);
          LOWORD(v15) = *v14;
          *v16 = v15;
          *v16 = v15 | (v14[1] << 8);
          LOWORD(v15) = v14[2];
          v16[1] = v15;
          v16[1] = v15 | (v14[3] << 8);
          if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1)
          {
            if ((v123 - 9) > 1)
            {
              v17 = 0;
              v18 = 0;
              v19 = 6;
              goto LABEL_45;
            }
LABEL_44:
            v17 = v14[6];
            v18 = v14[7];
            v19 = 8;
            goto LABEL_45;
          }
          v17 = 0;
          if ((v123 - 9) <= 1)
          {
            v19 = 6;
            v18 = 0;
            if (*(_BYTE *)(a1 + 2944) != 1)
              goto LABEL_45;
            goto LABEL_44;
          }
          v19 = 6;
          v18 = 0;
LABEL_45:
          v114 = v18;
          v115 = v17;
          v116 = v14[4];
          v117 = v14[5];
          v112 = v117 | (v116 << 8);
          v119 = v12;
          v122 = v13;
          v77 = (_DWORD *)(v12 + 52 * v13);
          v77[3] = 255;
          v78 = v14[v19] >> 4;
          v77[4] = sub_2198EA318(a1, v78);
          v120 = v77 + 4;
          v118 = v19;
          v79 = v14[v19] & 0xF;
          *(_QWORD *)(v77 + 1) = 0xFF000000FFLL;
          v80 = v77 + 1;
          v81 = v79 - 1;
          v82 = (v79 - 1);
          v83 = v78 == 15;
          if (v78 == 15)
            v84 = "phLibNfc_ComputeL2Iso15693ClifState";
          else
            v84 = "phLibNfc_ComputeL2ClifState";
          if (v83)
            v85 = 10;
          else
            v85 = 15;
          v121 = v80;
          v109 = v80 + 1;
          if (v83)
            ++v80;
          sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)v84);
          if (v81 < v85)
            v86 = v82 + 1;
          else
            v86 = 255;
          sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)v84);
          *v80 = v86;
          if (*(_BYTE *)(a1 + 2936) != 1
            && *(_BYTE *)(a1 + 2937) != 1
            && *(_BYTE *)(a1 + 2938) != 1
            && *(_BYTE *)(a1 + 2944) != 1)
          {
            v90 = v119;
            v101 = v119 + 52 * v122;
            *(_WORD *)(v101 + 24) = v112;
            *(_DWORD *)(v101 + 28) = 0;
            v3 = v113;
            v7 = (unsigned int *)(a1 + 19368);
            goto LABEL_105;
          }
          v87 = v123;
          v7 = (unsigned int *)(a1 + 19368);
          if ((v123 - 9) <= 1
            && (*v120 & 0xFFFFFFF8) == 8
            && (*(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
            && !*(_BYTE *)(a1 + 2946))
          {
            v93 = sub_2198EA578((unsigned int *)a1, v116, v117, v115, v114);
            v87 = v123;
            v90 = v119;
            *(_DWORD *)(v119 + 52 * v122 + 48) = v93;
            v3 = v113;
            goto LABEL_106;
          }
          if (*v121 == 10 || *v121 == 7)
          {
            if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
            {
              v88 = sub_2198EA578((unsigned int *)a1, v116, v117, v115, v114);
              v89 = sub_2198EA108(a1, v88, &v125[1], v125);
            }
            else
            {
              v89 = sub_2198E9EE4(a1, v116 | (v117 << 8), &v125[1]);
            }
            v3 = v113;
            v90 = v119;
            if (v89)
            {
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)" Vpp Calculation Failed!!!");
            }
            else
            {
              v92 = v119 + 52 * v122;
              *(float *)(v92 + 40) = v125[1];
              *v111 = LODWORD(v125[0]);
              *(_WORD *)(v92 + 24) = -1;
              *(_DWORD *)(v92 + 28) = 0;
            }
            goto LABEL_105;
          }
          v90 = v119;
          v91 = v119 + 52 * v122;
          *(_DWORD *)(v91 + 40) = 0;
          *(_WORD *)(v91 + 24) = v112;
          v3 = v113;
          if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
          {
            sub_2198EA064(a1, v112, (unsigned int *)(v119 + 52 * v122 + 28));
LABEL_105:
            v87 = v123;
            goto LABEL_106;
          }
          *(_DWORD *)(v119 + 52 * v122 + 28) = 0;
LABEL_106:
          if ((v87 | 2) != 0xA)
            goto LABEL_134;
          v102 = v14[v118 | 1];
          if (v87 == 10
            && (*v120 & 0xFFFFFFF8) == 8
            && (*(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
            && !*(_BYTE *)(a1 + 2946))
          {
            goto LABEL_133;
          }
          v103 = *v121;
          if (*v121 <= 12)
          {
            if (v103 == 5)
            {
              sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseLogNtfDatRxFailure");
              sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseLogNtfDatRxFailure");
LABEL_133:
              *(_BYTE *)(v90 + 52 * v122 + 36) = v102;
              goto LABEL_134;
            }
            if (v103 != 11)
              goto LABEL_133;
            sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseWupIotReconfigStage");
            if (v102 >= 6)
              v105 = -1;
            else
              v105 = 0x504030201FFuLL >> (8 * v102);
            sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseWupIotReconfigStage");
            *(_BYTE *)(v90 + 52 * v122 + 36) = v105;
          }
          else if ((v103 - 13) >= 3)
          {
            if (v103 != 255 || *v109 == 10 || *v109 == 6)
              goto LABEL_133;
          }
          else
          {
            *(_BYTE *)(v90 + 52 * v122 + 36) = v102;
            if ((*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
              && (v103 == 15 && (v102 & 0xFE) == 6 || v103 == 14 && v102 == 8))
            {
              v104 = v90 + 52 * v122;
              *v110 = *(unsigned __int16 *)(v104 + 24);
              *(_DWORD *)(v104 + 28) = 0;
              *(_WORD *)(v104 + 24) = 0;
              *(_QWORD *)(v104 + 40) = 0;
            }
          }
LABEL_134:
          sub_219851888(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-wTimeStampMillisec");
          sub_219851888(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-wAmsAgcRegValue");
          sub_219851888(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-bADCRegValue");
          sub_219851888(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-wTimeStampMicrosec");
          sub_219851888(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-wRssiInterpolatedinfo");
          sub_219851888(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-dwFieldStrength");
          sub_219851888(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-eDebMgmtL2Tech");
          sub_219851888(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-eDebMgmtL2State");
          sub_219851888(1, v7, 4u, 4u, (uint64_t)"LoggingNtfHandler: L2-bExtraInfo");
LABEL_135:
          sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_L2EventProc");
          ++*v3;
          LODWORD(v11) = v11 + v123;
LABEL_136:
          v6 = v11;
          if (v11 >= *((_DWORD *)a2 + 2))
            return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Sn100AndAboveProcSysL2LogNtf");
          continue;
        case 2u:
          v20 = *((_QWORD *)v3 + 2);
          if (!v20)
          {
            v72 = v7;
            v73 = " FelicaCmdEvent NULL!!!";
            goto LABEL_37;
          }
          v21 = *(unsigned __int8 *)(v8 + v11);
          v22 = v3[1];
          v23 = v20 + 16 * v22;
          *(_WORD *)v23 = v21;
          *(_WORD *)v23 = v21 | (*(unsigned __int8 *)(*a2 + v6 + 2) << 8);
          v24 = *(unsigned __int8 *)(*a2 + v6 + 3);
          *(_WORD *)(v23 + 2) = v24;
          *(_WORD *)(v23 + 2) = v24 | (*(unsigned __int8 *)(*a2 + v6 + 4) << 8);
          v25 = *(unsigned __int8 *)(*a2 + v6 + 5);
          *(_WORD *)(v23 + 4) = v25 << 8;
          v26 = *(unsigned __int8 *)(*a2 + v6 + 6) | (unsigned __int16)(v25 << 8);
          *(_WORD *)(v23 + 4) = v26;
          if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
          {
            sub_2198EA064(a1, v26, (unsigned int *)(v23 + 8));
            v20 = *((_QWORD *)v3 + 2);
            v22 = v3[1];
          }
          else
          {
            *(_DWORD *)(v20 + 16 * v22 + 8) = 0;
          }
          LODWORD(v11) = v6 + 8;
          v27 = v20 + 16 * v22;
          *(_BYTE *)(v27 + 12) = *(_BYTE *)(*a2 + v6 + 7);
          if (v10 == 8)
          {
            v28 = *(_BYTE *)(*a2 + v11);
            LODWORD(v11) = v6 + 9;
          }
          else
          {
            v28 = -1;
          }
          *(_BYTE *)(v27 + 13) = v28;
          v3[1] = v22 + 1;
          goto LABEL_136;
        case 3u:
          v29 = *((_QWORD *)v3 + 4);
          if (!v29)
          {
            v72 = v7;
            v73 = " FelicaSysCode NULL!!!";
            goto LABEL_37;
          }
          v30 = *(unsigned __int8 *)(v8 + v11);
          v31 = v3[2];
          v32 = (_WORD *)(v29 + 6 * v31);
          *v32 = v30;
          *v32 = v30 | (*(unsigned __int8 *)(*a2 + v6 + 2) << 8);
          v33 = *(unsigned __int8 *)(*a2 + v6 + 3);
          v32[1] = v33;
          v32[1] = v33 | (*(unsigned __int8 *)(*a2 + v6 + 4) << 8);
          v34 = *(unsigned __int8 *)(*a2 + v6 + 5);
          v32[2] = v34 << 8;
          LODWORD(v11) = v6 + 7;
          v32[2] = *(unsigned __int8 *)(*a2 + v6 + 6) | (unsigned __int16)(v34 << 8);
          v3[2] = v31 + 1;
          goto LABEL_136;
        case 4u:
          v35 = *((_QWORD *)v3 + 3);
          if (!v35)
          {
            v72 = v7;
            v73 = " FelicaRspEvent NULL!!!";
            goto LABEL_37;
          }
          v36 = v35 + 20 * v3[3];
          *(_DWORD *)(v36 + 16) = 0;
          v37 = *(unsigned __int8 *)(*a2 + v11);
          *(_WORD *)v36 = v37;
          *(_WORD *)v36 = v37 | (*(unsigned __int8 *)(*a2 + v6 + 2) << 8);
          v38 = *(unsigned __int8 *)(*a2 + v6 + 3);
          *(_WORD *)(v36 + 2) = v38;
          *(_WORD *)(v36 + 2) = v38 | (*(unsigned __int8 *)(*a2 + v6 + 4) << 8);
          v39 = *a2;
          v40 = *(unsigned __int8 *)(*a2 + v6 + 5);
          v41 = v6 + 7;
          v42 = *(unsigned __int8 *)(*a2 + v6 + 6);
          if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
          {
            v43 = *(unsigned __int8 *)(v39 + v41);
            v41 = v6 + 9;
            v44 = sub_2198EA578((unsigned int *)a1, v40, v42, v43, *(unsigned __int8 *)(v39 + v6 + 8));
            if (sub_2198EA108(a1, v44, (float *)&v124 + 1, (float *)&v124))
            {
LABEL_23:
              sub_219850628(1, v7, 4u, 1u, (uint64_t)" Vpp Calculation Failed!!!");
              v45 = *((_QWORD *)v3 + 3);
              v46 = v3[3];
              goto LABEL_82;
            }
          }
          else if (sub_2198E9EE4(a1, v40 | (v42 << 8), (float *)&v124 + 1))
          {
            goto LABEL_23;
          }
          v45 = *((_QWORD *)v3 + 3);
          v46 = v3[3];
          v94 = v45 + 20 * v3[3];
          *(_DWORD *)(v94 + 12) = HIDWORD(v124);
          *(_DWORD *)(v94 + 16) = v124;
LABEL_82:
          v95 = v45 + 20 * v46;
          *(_BYTE *)(v95 + 4) = *(_BYTE *)(*a2 + v41);
          LODWORD(v11) = v41 + 3;
          *(_WORD *)(v95 + 6) = *(unsigned __int8 *)(*a2 + v41 + 2) | (*(unsigned __int8 *)(*a2 + v41 + 1) << 8);
          if (v10 != 10)
          {
            if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1)
            {
              if (v10 != 12)
              {
                v96 = -1;
LABEL_101:
                *(_BYTE *)(v45 + 20 * v46 + 8) = v96;
                v3[3] = v46 + 1;
                goto LABEL_136;
              }
            }
            else
            {
              v96 = -1;
              if (v10 != 12 || *(_BYTE *)(a1 + 2944) != 1)
                goto LABEL_101;
            }
          }
          v96 = *(_BYTE *)(*a2 + v11);
          LODWORD(v11) = v41 + 4;
          goto LABEL_101;
        case 5u:
          v47 = *((_QWORD *)v3 + 5);
          if (v47)
          {
            v48 = *(unsigned __int8 *)(v8 + v11);
            v49 = v3[4];
            v50 = v47 + 12 * v3[4];
            *(_WORD *)v50 = v48;
            *(_WORD *)v50 = v48 | (*(unsigned __int8 *)(*a2 + v6 + 2) << 8);
            v51 = *(unsigned __int8 *)(*a2 + v6 + 3);
            *(_WORD *)(v50 + 2) = v51;
            *(_WORD *)(v50 + 2) = v51 | (*(unsigned __int8 *)(*a2 + v6 + 4) << 8);
            LODWORD(v11) = v6 + 6;
            *(_DWORD *)(v50 + 4) = *(unsigned __int8 *)(*a2 + v6 + 5);
            if (v10 == 6)
            {
              v52 = *(_BYTE *)(*a2 + v11);
              LODWORD(v11) = v6 + 7;
            }
            else
            {
              v52 = -1;
            }
            *(_BYTE *)(v47 + 12 * v49 + 8) = v52;
            v3[4] = v49 + 1;
          }
          goto LABEL_136;
        case 6u:
          v53 = *((_QWORD *)v3 + 6);
          if (!v53)
          {
            v72 = v7;
            v73 = " HLM Event NULL!!!";
            goto LABEL_37;
          }
          v54 = *(unsigned __int8 *)(v8 + v11);
          v55 = v3[5];
          v56 = v53 + 28 * v3[5];
          *(_WORD *)(v56 + 4) = v54;
          *(_WORD *)(v56 + 4) = v54 | (*(unsigned __int8 *)(*a2 + v6 + 2) << 8);
          v57 = *(unsigned __int8 *)(*a2 + v6 + 3);
          *(_WORD *)(v56 + 6) = v57;
          v58 = v6 + 5;
          *(_WORD *)(v56 + 6) = v57 | (*(unsigned __int8 *)(*a2 + v6 + 4) << 8);
          v59 = v6 + 7;
          switch(*(_BYTE *)(*a2 + v59))
          {
            case 1:
              v60 = v53 + 28 * v55;
              *(_DWORD *)v60 = 1;
              v61 = *(_BYTE *)(*a2 + v58);
              *(_WORD *)(v60 + 16) = *(_WORD *)(v60 + 16) & 0xFFFE | v61 & 1;
              v62 = *((_QWORD *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v62 + 16) = *(_WORD *)(v62 + 16) & 0xFFFD | v61 & 2;
              v63 = *((_QWORD *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v63 + 16) = *(_WORD *)(v63 + 16) & 0xFFFB | v61 & 4;
              v64 = *((_QWORD *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v64 + 16) = *(_WORD *)(v64 + 16) & 0xFFF7 | v61 & 8;
              v65 = *((_QWORD *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v65 + 16) = *(_WORD *)(v65 + 16) & 0xFFEF | v61 & 0x10;
              v66 = *((_QWORD *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v66 + 16) = *(_WORD *)(v66 + 16) & 0xFFDF | v61 & 0x20;
              v67 = *((_QWORD *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v67 + 16) = *(_WORD *)(v67 + 16) & 0xFFBF | v61 & 0x40;
              v68 = *((_QWORD *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v68 + 16) = *(_WORD *)(v68 + 16) & 0xFF7F | v61 & 0x80;
              v69 = *(unsigned __int8 *)(*a2 + v6 + 6);
              v70 = *((_QWORD *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v70 + 16) = *(_WORD *)(v70 + 16) & 0xFEFF | ((v69 & 1) << 8);
              v71 = *((_QWORD *)v3 + 6) + 28 * v3[5];
              *(_WORD *)(v71 + 16) = *(_WORD *)(v71 + 16) & 0xFDFF | (((v69 >> 1) & 1) << 9);
              break;
            case 2:
              v98 = v53 + 28 * v55;
              *(_DWORD *)v98 = 2;
              *(_BYTE *)(v98 + 20) = *(_BYTE *)(*a2 + v58);
              switch(*(_BYTE *)(*a2 + v6 + 6))
              {
                case 0:
                  *(_DWORD *)(v53 + 28 * v55 + 24) = 0;
                  goto LABEL_97;
                case 1:
                  v106 = v53 + 28 * v55;
                  v107 = 1;
                  goto LABEL_144;
                case 2:
                  v106 = v53 + 28 * v55;
                  v107 = 2;
                  goto LABEL_144;
                case 3:
                  v106 = v53 + 28 * v55;
                  v107 = 3;
                  goto LABEL_144;
                default:
                  v106 = v53 + 28 * v55;
                  v107 = 255;
LABEL_144:
                  *(_DWORD *)(v106 + 24) = v107;
                  break;
              }
              break;
            case 3:
              v99 = 28 * v55;
              v100 = 3;
              goto LABEL_96;
            case 4:
              v99 = 28 * v55;
              v100 = 4;
              goto LABEL_96;
            case 5:
              v99 = 28 * v55;
              v100 = 5;
              goto LABEL_96;
            case 6:
              *(_DWORD *)(v53 + 28 * v55) = 6;
              break;
            case 7:
              v99 = 28 * v55;
              v100 = 7;
LABEL_96:
              *(_DWORD *)(v53 + v99) = v100;
              break;
            default:
              v97 = (_DWORD *)(v53 + 28 * v55);
              if ((~*(unsigned __int8 *)(*a2 + v59) & 0xE) != 0)
              {
                *v97 = 8;
                sub_219851790(1, v7, 4u, 2u, (uint64_t)" HLM Invalid Event received");
              }
              else
              {
                *v97 = 0;
                *(float *)(v53 + 28 * v55 + 8) = (float)(unsigned __int16)(*(unsigned __int8 *)(*a2 + v58) | (*(unsigned __int8 *)(*a2 + v6 + 6) << 8))
                                                 / 142.2;
                *(_DWORD *)(*((_QWORD *)v3 + 6) + 28 * v3[5] + 12) = sub_2198EA318(a1, *(unsigned __int8 *)(*a2 + v59) >> 4);
              }
              break;
          }
LABEL_97:
          LODWORD(v11) = v6 + 8;
          ++v3[5];
          goto LABEL_136;
        case 0xCu:
          v74 = *((_QWORD *)v3 + 7);
          if (v74)
          {
            v75 = v3[6];
            v76 = (_DWORD *)(v74 + 16 * v75);
            *v76 = *(unsigned __int8 *)(v8 + v11);
            v76[1] = *(unsigned __int8 *)(*a2 + v6 + 2);
            v76[2] = *(unsigned __int8 *)(*a2 + v6 + 3);
            LODWORD(v11) = v6 + 5;
            v76[3] = *(unsigned __int8 *)(*a2 + v6 + 4);
            v3[6] = v75 + 1;
          }
          goto LABEL_136;
        default:
          LODWORD(v11) = v11 + v10;
          v72 = v7;
          v73 = " phLibNfc_Sn100AndAboveProcSysL2LogNtf : Invalid tag ID !!!";
LABEL_37:
          sub_219850628(1, v72, 4u, 2u, (uint64_t)v73);
          goto LABEL_136;
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Sn100AndAboveProcSysL2LogNtf");
}

uint64_t sub_2198EB8A8(uint64_t a1, uint64_t a2)
{
  void (*v4)(_QWORD, uint64_t, uint64_t);
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsInitCb");
  if (a1)
  {
    v4 = *(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 6104);
    v5 = *(_QWORD *)(a1 + 6112);
    *(_QWORD *)(a1 + 6112) = 0;
    *(_QWORD *)(a1 + 6104) = 0;
    if (v4)
    {
      sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_SetRfSettingsInitCb:Invoking callback function, wStatus = ");
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 42, (uint64_t)"phLibNfc_SetRfSettingsInitCb");
      v4(*(_QWORD *)(a1 + 19360), v5, a2);
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetRfSettingsInitCb");
}

uint64_t sub_2198EB980(uint64_t a1, int a2, uint64_t *a3)
{
  unsigned __int8 *v6;
  unsigned int v7;
  unsigned int v8;
  __int128 *v9;
  int v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  __int16 v14;
  int v15;
  int v16;
  unsigned int v17;
  __int16 v18;
  __int16 v19;
  int v20;
  int v21;
  int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  int v26;
  int v27;
  _BOOL4 v28;
  unsigned int v29;
  char v30;
  char v31;
  char v32;
  char v33;
  char v34;
  char v35;
  char v36;
  unsigned int v37;
  _BYTE *v38;
  unsigned int v39;
  int v40;
  unsigned int v41;
  int v42;
  int v43;
  uint64_t v44;
  __int16 v45;
  void (*v46)(_QWORD, uint64_t, uint64_t, uint64_t *);
  uint64_t v47;
  int v49;
  _BYTE *v50;
  int v51;
  int v52;
  int v53;
  float v54;
  unsigned int v55;
  int v56;
  uint64_t v57;
  unsigned int v58;
  int v59;
  int v60;
  unsigned int v61;
  int v62;
  uint64_t v63;
  __int128 *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint64_t v69;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0;
  v64 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LoggingNtfHandler");
  if (!a1)
    return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LoggingNtfHandler");
  if (!a3)
    return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LoggingNtfHandler");
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_LoggingNtfHandler: Received Lx debug logging Ntf from NFCC");
  v6 = (unsigned __int8 *)*a3;
  if (!*a3)
    return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LoggingNtfHandler");
  v7 = *((_DWORD *)a3 + 2);
  if (!v7)
    return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LoggingNtfHandler");
  if (a2 == 8 && v7 >= 7)
  {
    v69 = 0;
    sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_549ProcSysL1LogNtf");
    v8 = *((_DWORD *)a3 + 2);
    v9 = (__int128 *)(a1 + 40);
    phOsalNfc_SetMemory();
    *(_DWORD *)(a1 + 96) = 0;
    if (v8 - 7 > 1)
    {
      if (v8 - 9 <= 1)
      {
        v10 = *(unsigned __int8 *)(a1 + 2937);
        if (v10 == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
        {
LABEL_24:
          *(_BYTE *)(a1 + 40) = *(_BYTE *)(a1 + 40) & 0xFC | 1;
          v13 = *(unsigned __int8 *)*a3;
          *(_WORD *)(a1 + 56) = v13;
          *(_WORD *)(a1 + 56) = v13 | (*(unsigned __int8 *)(*a3 + 1) << 8);
          v14 = *(unsigned __int8 *)(*a3 + 2);
          *(_WORD *)(a1 + 58) = v14;
          *(_WORD *)(a1 + 58) = v14 | (*(unsigned __int8 *)(*a3 + 3) << 8);
          v15 = *(unsigned __int8 *)(*a3 + 4);
          v16 = *(unsigned __int8 *)(*a3 + 5);
          *(_DWORD *)(a1 + 80) = 0;
          *(_WORD *)(a1 + 76) = v16 | ((_WORD)v15 << 8);
          v61 = v8 - 9;
          if (v8 >= 9 && (v10 == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1))
          {
            v59 = *(unsigned __int8 *)(*a3 + 7);
            v60 = *(unsigned __int8 *)(*a3 + 6);
            v17 = 8;
          }
          else
          {
            v59 = 0;
            v60 = 0;
            v17 = 6;
          }
          *(_BYTE *)(a1 + 60) = -1;
          v24 = *(unsigned __int8 *)(*a3 + v17) >> 4;
          v62 = sub_2198EA318(a1, v24);
          *(_DWORD *)(a1 + 68) = v62;
          v25 = *(_BYTE *)(*a3 + v17) & 0xF;
          v26 = *(unsigned __int8 *)(a1 + 2936);
          if (v26 == 1 || *(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1)
          {
            if (v24 == 10 || v24 == 3)
              goto LABEL_45;
            v28 = v24 == 15;
            if (v24 == 15 && v26 == 1)
            {
              *(_DWORD *)(a1 + 64) = sub_2198EA228((unsigned int *)a1, v25);
              goto LABEL_46;
            }
            v38 = (_BYTE *)(a1 + 2937);
            if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1)
            {
              if (v24 == 15)
                goto LABEL_186;
              goto LABEL_189;
            }
            v40 = *(unsigned __int8 *)(a1 + 2944);
          }
          else
          {
            v40 = *(unsigned __int8 *)(a1 + 2944);
            if (v24 == 3 && v40 == 1 || v24 == 3)
              goto LABEL_45;
            v38 = (_BYTE *)(a1 + 2937);
            if (v24 != 15)
            {
              if (v24 == 10)
              {
LABEL_45:
                *(_DWORD *)(a1 + 84) = sub_2198EA2A0((unsigned int *)a1, v25);
                goto LABEL_46;
              }
              goto LABEL_189;
            }
            v28 = 1;
          }
          if (v28 && v40 == 1)
          {
LABEL_186:
            if (v25 == 8)
            {
              v49 = 8;
            }
            else if (v25 == 2)
            {
              v49 = 2;
            }
            else
            {
              v49 = 255;
            }
            *(_DWORD *)(a1 + 64) = v49;
LABEL_46:
            if ((v8 | 2) != 0xA)
            {
              *(_DWORD *)(a1 + 72) = 255;
              v9 = (__int128 *)(a1 + 40);
              goto LABEL_86;
            }
            v27 = *(unsigned __int8 *)(*a3 + (v17 | 1));
            v9 = (__int128 *)(a1 + 40);
            if (v8 == 10
              && (v62 & 0xF8) == 8
              && (*(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
              && !*(_BYTE *)(a1 + 2946))
            {
              goto LABEL_85;
            }
            if (v24 != 3)
            {
              if (v24 == 15)
              {
                if (*(_DWORD *)(a1 + 64) == 8)
                {
LABEL_85:
                  *(_BYTE *)(a1 + 88) = v27;
LABEL_86:
                  if (*(_BYTE *)(a1 + 2936) != 1
                    && *(_BYTE *)(a1 + 2937) != 1
                    && *(_BYTE *)(a1 + 2938) != 1
                    && *(_BYTE *)(a1 + 2944) != 1)
                  {
                    v9 = (__int128 *)(a1 + 56);
                  }
                  sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"\n\nLoggingNtfHandler: L1-wTimeStampMillisec");
                  sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"LoggingNtfHandler: L1-wTimeStampMicrosec");
                  sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"\n\nLoggingNtfHandler: L1-RSSI Interpolatedvalue");
                  sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"\n\nLoggingNtfHandler: L1- Calculated Field Strength");
                  sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"LoggingNtfHandler: L1-eDebMgmtL1Tech");
                  sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"LoggingNtfHandler: L1-eDebMgmtL1State");
                  if (*(_DWORD *)(a1 + 64) == 5)
                    sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"LoggingNtfHandler: L1-eDebMgmtL1DataRxFailure");
                  goto LABEL_162;
                }
LABEL_82:
                *(_DWORD *)(a1 + 72) = sub_2198EA448((unsigned int *)a1, v27);
                goto LABEL_86;
              }
              if (v24 != 10)
              {
                v39 = *(_DWORD *)(a1 + 64);
                if (v39 <= 0xA && ((1 << v39) & 0x5D2) != 0)
                  goto LABEL_85;
                goto LABEL_82;
              }
            }
            if ((*(_DWORD *)(a1 + 84) - 6) <= 2)
              goto LABEL_85;
            goto LABEL_82;
          }
LABEL_189:
          v58 = v16 | (v15 << 8);
          v50 = v38;
          v51 = sub_2198EA228((unsigned int *)a1, v25);
          *(_DWORD *)(a1 + 64) = v51;
          if (*(_BYTE *)(a1 + 2936) != 1 && *v50 != 1 && *(_BYTE *)(a1 + 2938) != 1 && *(_BYTE *)(a1 + 2944) != 1)
            goto LABEL_46;
          if (v51 - 8 >= 6 && v51 != 1)
          {
            *(_WORD *)(a1 + 76) = v58;
            if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
            {
              sub_2198EA064(a1, v58, (unsigned int *)(a1 + 80));
              if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1)
              {
                *(_DWORD *)(a1 + 44) = 1;
                v54 = (float)((float)v58 * 1000.0) * 0.00048828;
LABEL_233:
                *(float *)(a1 + 92) = v54;
                goto LABEL_46;
              }
            }
            else
            {
              *(_DWORD *)(a1 + 80) = 0;
            }
            *(_DWORD *)(a1 + 44) = 1;
            v54 = (float)(int)v58 * 0.0039062;
            goto LABEL_233;
          }
          if (*v50 == 1 || *(_BYTE *)(a1 + 2938) == 1)
          {
            if (v61 > 1)
            {
LABEL_197:
              v52 = sub_2198E9EE4(a1, v15 | (v16 << 8), (float *)&v69 + 1);
              v53 = v62 & 0xF8;
              goto LABEL_216;
            }
          }
          else if (*(_BYTE *)(a1 + 2944) != 1 || v61 >= 2)
          {
            goto LABEL_197;
          }
          v55 = sub_2198EA578((unsigned int *)a1, v15, v16, v60, v59);
          v53 = v62 & 0xF8;
          if (v53 == 8)
          {
            v56 = *(unsigned __int8 *)(a1 + 2938);
            if ((v56 == 1 || *(_BYTE *)(a1 + 2944) == 1) && !*(_BYTE *)(a1 + 2946))
            {
              v52 = 0;
              *(_DWORD *)(a1 + 100) = v55;
              goto LABEL_218;
            }
          }
          v52 = sub_2198EA108(a1, v55, (float *)&v69 + 1, (float *)&v69);
LABEL_216:
          if (v53 != 8)
          {
LABEL_221:
            if (v52)
            {
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)" APC Calculation Failed!!!");
            }
            else
            {
              *(_DWORD *)(a1 + 44) = 1;
              v57 = v69;
              *(_WORD *)(a1 + 76) = -1;
              *(_DWORD *)(a1 + 92) = HIDWORD(v57);
              *(_DWORD *)(a1 + 96) = v57;
            }
            goto LABEL_46;
          }
          v56 = *(unsigned __int8 *)(a1 + 2938);
LABEL_218:
          if ((v56 == 1 || *(_BYTE *)(a1 + 2944) == 1) && !*(_BYTE *)(a1 + 2946))
          {
            sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"In case of RM Robustness Info, Vpp/APC info should not be assigned");
            goto LABEL_46;
          }
          goto LABEL_221;
        }
      }
    }
    else
    {
      v10 = *(unsigned __int8 *)(a1 + 2937);
      if (!*(_BYTE *)(a1 + 2937) || !*(_BYTE *)(a1 + 2938) || !*(_BYTE *)(a1 + 2944))
        goto LABEL_24;
    }
    if (v8 != 12 && v8 != 10)
    {
      v9 = 0;
LABEL_162:
      sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_549ProcSysL1LogNtf");
      goto LABEL_163;
    }
    *(_BYTE *)(a1 + 40) = *(_BYTE *)(a1 + 40) & 0xFC | 2;
    v18 = *(unsigned __int8 *)*a3;
    *(_WORD *)(a1 + 56) = v18;
    *(_WORD *)(a1 + 56) = v18 | (*(unsigned __int8 *)(*a3 + 1) << 8);
    v19 = *(unsigned __int8 *)(*a3 + 2);
    *(_WORD *)(a1 + 58) = v19;
    *(_WORD *)(a1 + 58) = v19 | (*(unsigned __int8 *)(*a3 + 3) << 8);
    v20 = *(unsigned __int8 *)(*a3 + 4);
    v21 = *(unsigned __int8 *)(*a3 + 5);
    if (*(_BYTE *)(a1 + 2937) == 1 || *(_BYTE *)(a1 + 2938) == 1)
    {
      if (v8 != 12)
      {
LABEL_38:
        v22 = sub_2198E9EE4(a1, v20 | (v21 << 8), (float *)&v69 + 1);
        v23 = 6;
LABEL_102:
        if (v22)
        {
          *(_DWORD *)(a1 + 44) = 0;
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)" APC Calculation Failed!!!");
        }
        else
        {
          *(_DWORD *)(a1 + 44) = 1;
          v42 = v69;
          *(_DWORD *)(a1 + 92) = HIDWORD(v69);
          *(_DWORD *)(a1 + 96) = v42;
        }
        v43 = *(unsigned __int8 *)(*a3 + v23) >> 4;
        sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Compute7816ClifTech");
        switch(v43)
        {
          case 1:
            break;
          case 2:
            v43 = 2;
            break;
          case 3:
            v43 = 3;
            break;
          case 4:
            v43 = 4;
            break;
          case 5:
            v43 = 5;
            break;
          case 6:
            v43 = 6;
            break;
          case 7:
            v43 = 7;
            break;
          case 8:
            v43 = 8;
            break;
          case 9:
            v43 = 9;
            break;
          case 10:
            v43 = 10;
            break;
          case 11:
            v43 = 11;
            break;
          case 12:
            v43 = 12;
            break;
          case 13:
            v43 = 13;
            break;
          case 14:
            v43 = 14;
            break;
          case 15:
            if (*(_BYTE *)(a1 + 2936) == 1 || *(_BYTE *)(a1 + 2937) == 1)
            {
              v43 = 15;
            }
            else
            {
              v43 = 15;
              if (*(_BYTE *)(a1 + 2938) != 1)
              {
                if (*(_BYTE *)(a1 + 2944) == 1)
                  v43 = 15;
                else
                  v43 = 255;
              }
            }
            break;
          default:
            v43 = 255;
            break;
        }
        sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_Compute7816ClifTech");
        *(_DWORD *)(a1 + 64) = v43;
        v45 = *(unsigned __int8 *)(*a3 + v23 + 2);
        *(_WORD *)(a1 + 68) = v45 << 8;
        *(_WORD *)(a1 + 68) = *(unsigned __int8 *)(*a3 + v23 + 3) | (unsigned __int16)(v45 << 8);
        goto LABEL_162;
      }
    }
    else if (v8 != 12 || *(_BYTE *)(a1 + 2944) != 1)
    {
      goto LABEL_38;
    }
    v41 = sub_2198EA578((unsigned int *)a1, v20, v21, *(unsigned __int8 *)(*a3 + 6), *(unsigned __int8 *)(*a3 + 7));
    v22 = sub_2198EA108(a1, v41, (float *)&v69 + 1, (float *)&v69);
    v23 = 8;
    goto LABEL_102;
  }
  if (a2 != 8)
  {
    if (a2 != 9)
      goto LABEL_169;
    if (*(_BYTE *)(a1 + 2936) != 1)
    {
      if (*(_BYTE *)(a1 + 2937) == 1)
      {
        if (v7 < 5)
          goto LABEL_169;
        goto LABEL_64;
      }
      if (*(_BYTE *)(a1 + 2938) != 1 && *(_BYTE *)(a1 + 2944) != 1)
      {
        if ((v7 & 7) != 0)
          goto LABEL_169;
LABEL_138:
        if (*(_BYTE *)(a1 + 2936) == 1
          || *(_BYTE *)(a1 + 2937) == 1
          || *(_BYTE *)(a1 + 2938) == 1
          || *(_BYTE *)(a1 + 2944) == 1)
        {
          v9 = &v65;
          sub_2198EA844(a1, a3, (unsigned __int8 *)&v65);
        }
        else
        {
          v9 = 0;
        }
        v44 = 63;
LABEL_164:
        LODWORD(v63) = sub_21986C924(*(_QWORD *)(a1 + 19360), *(unsigned __int8 *)(a1 + 2988), *(unsigned __int8 *)(a1 + 3088));
        v64 = v9;
        if (*(_QWORD *)(a1 + 6776) && *(_DWORD *)(a1 + 5560) == 5)
        {
          *(_QWORD *)(a1 + 5576) = &v63;
          sub_2198D1B2C(*(_QWORD *)(a1 + 19360), 145, v44, a1 + 5560, 0);
        }
        else
        {
          v46 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(a1 + 6568);
          if (v46)
          {
            v47 = *(_QWORD *)(a1 + 6576);
            sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"LoggingNtfHandler :pGenericNtfCb[LxDebug Ntf]");
            v46(*(_QWORD *)(a1 + 19360), v47, v44, &v63);
          }
        }
        goto LABEL_169;
      }
    }
    if (v7 <= 4)
      goto LABEL_169;
LABEL_64:
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v35 = 0;
    v36 = 0;
    while (2)
    {
      v37 = v6[v29];
      switch(v37 >> 4)
      {
        case 1u:
          ++v36;
          goto LABEL_73;
        case 2u:
          ++v35;
          goto LABEL_73;
        case 3u:
          ++v34;
          goto LABEL_73;
        case 4u:
          ++v33;
          goto LABEL_73;
        case 5u:
          ++v32;
          goto LABEL_73;
        case 6u:
          ++v31;
          goto LABEL_73;
        case 0xCu:
          ++v30;
LABEL_73:
          v29 += (v37 & 0xF) + 1;
          if (v29 < v7)
            continue;
          if (v36)
          {
            *((_QWORD *)&v65 + 1) = phOsalNfc_GetMemory();
            if (*((_QWORD *)&v65 + 1))
              phOsalNfc_SetMemory();
            else
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory for L2 debug events");
          }
          if (v35)
          {
            *(_QWORD *)&v66 = phOsalNfc_GetMemory();
            if ((_QWORD)v66)
              phOsalNfc_SetMemory();
            else
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory for Felica cmd events");
          }
          if (v34)
          {
            *(_QWORD *)&v67 = phOsalNfc_GetMemory();
            if ((_QWORD)v67)
              phOsalNfc_SetMemory();
            else
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_LoggingNtfHandler : Failed to allocate memory for Felica SysCode events");
          }
          if (v33)
          {
            *((_QWORD *)&v66 + 1) = phOsalNfc_GetMemory();
            if (*((_QWORD *)&v66 + 1))
              phOsalNfc_SetMemory();
            else
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory for Felica Rsp events");
          }
          if (v32)
          {
            *((_QWORD *)&v67 + 1) = phOsalNfc_GetMemory();
            if (*((_QWORD *)&v67 + 1))
              phOsalNfc_SetMemory();
            else
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory for Felica Misc events");
          }
          if (v31)
          {
            *(_QWORD *)&v68 = phOsalNfc_GetMemory();
            if ((_QWORD)v68)
              phOsalNfc_SetMemory();
            else
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory for HLM events");
          }
          if (v30)
          {
            *((_QWORD *)&v68 + 1) = phOsalNfc_GetMemory();
            if (*((_QWORD *)&v68 + 1))
              phOsalNfc_SetMemory();
            else
              sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Failed to allocate memory for LPCD Assist events");
          }
          break;
        default:
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)" phLibNfc_LoggingNtfHandler : Invalid Type !!!");
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)" phLibNfc_LoggingNtfHandler : Unknown L2 Message!!!");
          goto LABEL_169;
      }
      goto LABEL_138;
    }
  }
  if (v7 == 5)
  {
    v11 = *(unsigned __int8 *)(a1 + 2944);
    if (v11 == 1 && *v6 == 255)
    {
      v12 = sub_2198EA744(a1, (_BYTE **)a3);
      goto LABEL_112;
    }
    if (*(_BYTE *)(a1 + 2937) == 1 || v11 == 1 || *(_BYTE *)(a1 + 2938) == 1)
    {
      v12 = (uint64_t)sub_2198EA5FC((unsigned int *)a1, (unsigned __int8 **)a3);
LABEL_112:
      v9 = (__int128 *)v12;
LABEL_163:
      v44 = 62;
      goto LABEL_164;
    }
  }
LABEL_169:
  if (*((_QWORD *)&v65 + 1))
  {
    phOsalNfc_FreeMemory();
    *((_QWORD *)&v65 + 1) = 0;
  }
  if (*((_QWORD *)&v66 + 1))
  {
    phOsalNfc_FreeMemory();
    *((_QWORD *)&v66 + 1) = 0;
  }
  if ((_QWORD)v66)
  {
    phOsalNfc_FreeMemory();
    *(_QWORD *)&v66 = 0;
  }
  if ((_QWORD)v67)
  {
    phOsalNfc_FreeMemory();
    *(_QWORD *)&v67 = 0;
  }
  if (*((_QWORD *)&v67 + 1))
  {
    phOsalNfc_FreeMemory();
    *((_QWORD *)&v67 + 1) = 0;
  }
  if ((_QWORD)v68)
  {
    phOsalNfc_FreeMemory();
    *(_QWORD *)&v68 = 0;
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LoggingNtfHandler");
}

uint64_t sub_2198EC918(uint64_t a1, int a2, uint64_t a3, int a4)
{
  _BYTE *v8;
  unsigned int v9;
  uint64_t Memory;
  _BYTE *v11;
  int v12;
  int v13;
  const char *v14;
  int v15;
  unsigned int *v16;
  char v17;
  int v18;
  uint64_t v19;
  char v20;
  void (*v21)(_QWORD, uint64_t, uint64_t, __int128 *);
  uint64_t v22;
  char v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v27;
  unsigned __int8 v28;
  unsigned int v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  unsigned __int8 v33;
  unsigned int v34;
  uint64_t v35;
  _BYTE *v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  _BYTE *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  unsigned __int8 v45;

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler");
  if (!a1)
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler- Rxd Failed Status");
LABEL_29:
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler-Corrutped MultiTag NTF received, Reset/Boot MW");
    goto LABEL_30;
  }
  if (a2 != 33 || a4 == 255)
  {
    v14 = "phLibNfc_PropMultiTagStatNtfHandler- Rxd Failed Status";
    v15 = 2;
    v16 = (unsigned int *)a1;
LABEL_12:
    sub_219850628(v15, v16, 4u, 1u, (uint64_t)v14);
    v12 = 0;
    v17 = 0;
    goto LABEL_13;
  }
  if (!*(_DWORD *)(a3 + 8) || (v8 = *(_BYTE **)a3) == 0)
  {
    v14 = "phLibNfc_PropMultiTagStatNtfHandler- Len Error or Null buffer received";
    v15 = 1;
    v16 = (unsigned int *)(a1 + 19368);
    goto LABEL_12;
  }
  v9 = 1;
  v45 = 1;
  LOBYTE(v41) = *v8;
  if ((_BYTE)v41)
  {
    Memory = phOsalNfc_GetMemory();
    *((_QWORD *)&v41 + 1) = Memory;
    if (Memory)
    {
      v11 = (_BYTE *)Memory;
      phOsalNfc_SetMemory();
      sub_2198ECDF8((unsigned int *)a1, &v45, v41, 0, v11, (uint64_t *)a3);
      v12 = 0;
      v13 = 1;
      v9 = v45;
    }
    else
    {
      v13 = 0;
      v12 = 255;
      v9 = 1;
    }
  }
  else
  {
    v12 = 0;
    v13 = 1;
  }
  v27 = *(_QWORD *)a3;
  v28 = v9 + 1;
  v45 = v9 + 1;
  v29 = *(unsigned __int8 *)(v27 + v9);
  LOBYTE(v42) = *(_BYTE *)(v27 + v9);
  if (v13 && v29)
  {
    v30 = phOsalNfc_GetMemory();
    *((_QWORD *)&v42 + 1) = v30;
    if (v30)
    {
      v31 = (_BYTE *)v30;
      phOsalNfc_SetMemory();
      sub_2198ECDF8((unsigned int *)a1, &v45, v29, 0, v31, (uint64_t *)a3);
      v28 = v45;
    }
    else
    {
      v12 = 255;
    }
  }
  v32 = *(_QWORD *)a3;
  v33 = v28 + 1;
  v45 = v28 + 1;
  v34 = *(unsigned __int8 *)(v32 + v28);
  LOBYTE(v43) = *(_BYTE *)(v32 + v28);
  if (!v12 && v34)
  {
    v35 = phOsalNfc_GetMemory();
    *((_QWORD *)&v43 + 1) = v35;
    if (v35)
    {
      v36 = (_BYTE *)v35;
      phOsalNfc_SetMemory();
      sub_2198ECDF8((unsigned int *)a1, &v45, v34, 0, v36, (uint64_t *)a3);
      v12 = 0;
      v33 = v45;
    }
    else
    {
      v12 = 255;
    }
  }
  v37 = *(_QWORD *)a3;
  v45 = v33 + 1;
  v38 = *(unsigned __int8 *)(v37 + v33);
  LOBYTE(v44) = *(_BYTE *)(v37 + v33);
  v17 = 1;
  if (!v12 && v38)
  {
    v39 = phOsalNfc_GetMemory();
    *((_QWORD *)&v44 + 1) = v39;
    if (v39)
    {
      v40 = (_BYTE *)v39;
      phOsalNfc_SetMemory();
      v17 = 1;
      sub_2198ECDF8((unsigned int *)a1, &v45, v38, 1, v40, (uint64_t *)a3);
      v12 = 0;
    }
    else
    {
      v17 = 1;
      v12 = 255;
    }
  }
LABEL_13:
  v18 = 0;
  v19 = *(_QWORD *)(a1 + 3192);
  if (v19 && v19 != 0xFFFFFFFFFFFFLL)
  {
    phOsalNfc_Timer_Stop();
    *(_BYTE *)(a1 + 6032) = 0;
    v18 = 1;
    sub_21988629C(1, (unsigned int *)(a1 + 19368), *(_QWORD *)(a1 + 3192), 4u, 4u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler");
    phOsalNfc_Timer_Delete();
    *(_QWORD *)(a1 + 3192) = 0xFFFFFFFFFFFFLL;
  }
  v20 = v17 ^ 1;
  if (v12)
    v20 = 1;
  if ((v20 & 1) != 0)
    goto LABEL_29;
  v21 = *(void (**)(_QWORD, uint64_t, uint64_t, __int128 *))(a1 + 6568);
  if (v21)
  {
    v22 = *(_QWORD *)(a1 + 6576);
    sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"PropMultiTagStatNtfHandler :pGenericNtfCb[Multi-tag Status]");
    v21(*(_QWORD *)(a1 + 19360), v22, 155, &v41);
  }
  if (*(_QWORD *)(a1 + 6056))
  {
    if (v18 && !*(_BYTE *)(a1 + 3216))
    {
      *(_BYTE *)(a1 + 3216) = 1;
      *(_QWORD *)(a1 + 2912) = off_2550A11C0;
      *(_BYTE *)(a1 + 2904) = 0;
      *(_BYTE *)(a1 + 2906) = 0;
      v23 = (char)off_2550A11C0[0];
      if (off_2550A11C0[0])
      {
        v23 = 0;
        v24 = &qword_2550A11D0;
        do
        {
          ++v23;
          v25 = *v24;
          v24 += 2;
        }
        while (v25);
      }
      *(_BYTE *)(a1 + 2905) = v23;
      if (sub_2198655FC(a1, 0, 0) != 13)
        sub_2198ECF68((unsigned int *)a1, 255);
    }
  }
  else
  {
    *(_BYTE *)(a1 + 3216) = 0;
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler- Independant Prop Tag Det NTF Rxd");
  }
LABEL_30:
  if (*((_QWORD *)&v41 + 1))
  {
    phOsalNfc_FreeMemory();
    *((_QWORD *)&v41 + 1) = 0;
  }
  if (*((_QWORD *)&v42 + 1))
  {
    phOsalNfc_FreeMemory();
    *((_QWORD *)&v42 + 1) = 0;
  }
  if (*((_QWORD *)&v43 + 1))
  {
    phOsalNfc_FreeMemory();
    *((_QWORD *)&v43 + 1) = 0;
  }
  if (*((_QWORD *)&v44 + 1))
  {
    phOsalNfc_FreeMemory();
    *((_QWORD *)&v44 + 1) = 0;
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler");
}

uint64_t sub_2198ECDF8(unsigned int *a1, unsigned __int8 *a2, unsigned int a3, int a4, _BYTE *a5, uint64_t *a6)
{
  unsigned int v12;
  unsigned __int8 v13;
  _BYTE *v14;
  uint64_t v15;
  char v16;
  unsigned int v17;
  unsigned __int8 v18;
  uint64_t v19;
  int v21;

  v21 = 28;
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_PopulateRxdTagInfo");
  if (a4 == 1)
  {
    if (a3)
    {
      v12 = 0;
      v13 = *a2;
      v14 = a5 + 2;
      do
      {
        v15 = *a6;
        v16 = *(_BYTE *)(*a6 + v13);
        *(v14 - 1) = (v16 & 0x10) != 0;
        *v14 = *(_BYTE *)(v15 + *a2) >> 5;
        sub_2198ED084(a1, v16 & 0xF, &v21);
        *(v14 - 2) = v21;
        v13 = *a2 + 1;
        *a2 = v13;
        ++v12;
        v14 += 3;
      }
      while (v12 < a3);
    }
  }
  else if (a3)
  {
    v17 = 0;
    v18 = *a2;
    do
    {
      v19 = *a6;
      *a2 = v18 + 1;
      sub_2198ED084(a1, *(unsigned __int8 *)(v19 + v18), &v21);
      *a5 = v21;
      a5 += 5;
      phOsalNfc_MemCopy();
      v18 = *a2 + 4;
      *a2 = v18;
      ++v17;
    }
    while (v17 < a3);
  }
  return sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_PopulateRxdTagInfo");
}

uint64_t sub_2198ECF68(unsigned int *a1, uint64_t a2)
{
  uint64_t v3;
  unsigned int *v4;
  unsigned int *v5;
  const char *v6;

  v3 = (uint64_t)a1;
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MultiTagCompleteInit");
  if (!v3 || (_DWORD)a2)
  {
    sub_219850628(2, (unsigned int *)v3, 4u, 1u, (uint64_t)"phLibNfc_MultiTagCompleteInit- GetFwInfoCmd failed");
    sub_219893CC0((unsigned int *)v3, a2);
    v3 = 0;
  }
  else
  {
    v4 = sub_2198FBC30(*(_QWORD *)(v3 + 2952));
    *(_QWORD *)(v3 + 3040) = v4;
    if (sub_2198975C8(v3, (uint64_t)v4))
    {
      v5 = (unsigned int *)(v3 + 19368);
      v6 = "phLibNfc_MultiTagCompleteInit- GetNfccFeatures failed";
LABEL_10:
      sub_219850628(1, v5, 4u, 1u, (uint64_t)v6);
      return sub_219850808(2, (unsigned int *)v3, 4u, 5u, (uint64_t)"phLibNfc_MultiTagCompleteInit");
    }
    if (sub_219893CC0((unsigned int *)v3, 0))
    {
      v5 = (unsigned int *)(v3 + 19368);
      v6 = "phLibNfc_MultiTagCompleteInit- INIT Complete failed";
      goto LABEL_10;
    }
    if (sub_219895978((unsigned int *)v3, 0))
    {
      v5 = (unsigned int *)(v3 + 19368);
      v6 = "phLibNfc_MultiTagCompleteInit- Static Seq failed";
      goto LABEL_10;
    }
  }
  return sub_219850808(2, (unsigned int *)v3, 4u, 5u, (uint64_t)"phLibNfc_MultiTagCompleteInit");
}

uint64_t sub_2198ED084(unsigned int *a1, int a2, int *a3)
{
  int v6;
  const char *v7;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ConvertToRemDevType");
  v6 = 10;
  switch(a2)
  {
    case 0:
    case 3:
      break;
    case 1:
      v6 = 17;
      break;
    case 2:
    case 5:
      v6 = 21;
      break;
    case 4:
    case 7:
    case 8:
    case 9:
      goto LABEL_5;
    case 6:
      v6 = 23;
      break;
    case 10:
      v6 = 13;
      break;
    case 11:
      v6 = 14;
      break;
    case 12:
      v6 = 15;
      break;
    default:
      if ((a2 - 112) >= 3)
LABEL_5:
        v7 = "phLibNfc_ConvertToRemDevType- RF tech Unknown";
      else
        v7 = "phLibNfc_ConvertToRemDevType- RF tech Not supported";
      sub_219850628(2, a1, 4u, 2u, (uint64_t)v7);
      v6 = 0;
      break;
  }
  *a3 = v6;
  return sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ConvertToRemDevType");
}

uint64_t sub_2198ED178(uint64_t a1, int a2, uint64_t a3, int a4)
{
  void (*v7)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LongVasCwDetNtfHandler");
  if (a2 == 41)
  {
    if (a1)
    {
      if (a4 != 255)
      {
        v7 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(a1 + 6568);
        if (v7)
        {
          v8 = *(_QWORD *)(a1 + 6576);
          sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_LongVasCwDetNtfHandler :pGenericNtfCb[Prop Vas Long CW Ntf]");
          v7(*(_QWORD *)(a1 + 19360), v8, 78, 0);
        }
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LongVasCwDetNtfHandler");
}

uint64_t sub_2198ED22C(uint64_t a1, int a2, _DWORD *a3, int a4)
{
  char *v8;
  char v9;
  char v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void (*v14)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, _QWORD);
  void (*v15)(_QWORD, uint64_t, uint64_t, __int128 *);
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _OWORD v22[2];
  uint64_t v23;
  __int128 v24;
  __int128 v25;

  v24 = 0u;
  v25 = 0u;
  v23 = 0;
  memset(v22, 0, sizeof(v22));
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropRdrNtfHandler");
  if (a2 != 10 || !a1 || a4 == 255)
    return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropRdrNtfHandler");
  *(_BYTE *)(a1 + 1401) = 1;
  phOsalNfc_SetMemory();
  if (a3[2])
  {
    v8 = *(char **)a3;
    if (*(_QWORD *)a3)
    {
      v9 = *v8;
      v10 = *v8 & 0xBF;
      LOBYTE(v24) = v24 & 0x40 | v10;
      if ((v9 & 9) != 0)
      {
        if (*(_BYTE *)(a1 + 2937) == 1
          || *(_BYTE *)(a1 + 2938) == 1
          || *(_BYTE *)(a1 + 2944) == 1
          || *(_BYTE *)(a1 + 2936) == 1 && (*(_DWORD *)(a1 + 2980) & 0xFEu) >= 0x32)
        {
          LOBYTE(v24) = (32 * v8[1]) & 0x40 | v10;
          phOsalNfc_MemCopy();
          v11 = *(_QWORD *)a3;
          LODWORD(v25) = *(unsigned __int8 *)(*(_QWORD *)a3 + 4);
          if ((v25 - 1) > 0x13)
          {
            *((_QWORD *)&v24 + 1) = 0;
            LODWORD(v25) = 0;
          }
          else
          {
            *((_QWORD *)&v24 + 1) = v11 + 5;
          }
        }
        else
        {
          if ((v9 & 1) != 0)
          {
            LODWORD(v25) = 5;
            *v8 = 106;
            v19 = *(_QWORD *)a3;
          }
          else
          {
            v19 = 0;
            LODWORD(v25) = 0;
          }
          *((_QWORD *)&v24 + 1) = v19;
          phOsalNfc_MemCopy();
        }
      }
      else
      {
        *((_QWORD *)&v24 + 1) = 0;
        LODWORD(v25) = 0;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_PropRdrNtfHandler- Not a Prop Reader");
      }
    }
  }
  if ((*(_BYTE *)(a1 + 1012) & 7) == 0)
    goto LABEL_25;
  v12 = *(_DWORD *)(a1 + 1360);
  if ((*(_BYTE *)(a1 + 1012) & 0x38) == 0 && v12 != 6)
  {
    phOsalNfc_SetMemory();
    v13 = *(_QWORD *)(a1 + 720);
    if (v13 && v13 != 0xFFFFFFFFFFFFLL)
    {
      phOsalNfc_Timer_Delete();
      *(_QWORD *)(a1 + 720) = 0xFFFFFFFFFFFFLL;
    }
    LODWORD(v22[0]) = *(_DWORD *)(a1 + 1360);
    *(_DWORD *)(a1 + 1360) = 6;
    *(_BYTE *)(a1 + 1401) = 0;
    phOsalNfc_MemCopy();
    v14 = *(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, _QWORD))(a1 + 6696);
    if (v14)
      v14(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6704), 24, *(_QWORD *)(a1 + 392), v22, 0);
    return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropRdrNtfHandler");
  }
  if ((*(_BYTE *)(a1 + 1012) & 0x38) == 0
    && v12 == 6
    && !*(_BYTE *)(a1 + 1400)
    && (*(_BYTE *)(a1 + 2937) == 1
     || *(_BYTE *)(a1 + 2938) == 1
     || *(_BYTE *)(a1 + 2939) == 1
     || *(_BYTE *)(a1 + 2944) == 1
     || *(_BYTE *)(a1 + 2936) == 1))
  {
    v18 = *(_QWORD *)(a1 + 720);
    if (v18 && v18 != 0xFFFFFFFFFFFFLL)
    {
      phOsalNfc_Timer_Delete();
      *(_QWORD *)(a1 + 720) = 0xFFFFFFFFFFFFLL;
    }
    phOsalNfc_MemCopy();
    if ((_DWORD)v25)
    {
      if (v25 > 0x14)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Received VasUpPayload size exceeded Max vas code length");
        LODWORD(v25) = 0;
      }
      else
      {
        phOsalNfc_MemCopy();
        *(_QWORD *)(a1 + 1376) = a1 + 1402;
      }
    }
    v20 = *(_QWORD *)(a1 + 720);
    if (v20 != 0xFFFFFFFFFFFFLL && v20)
    {
      phOsalNfc_Timer_Stop();
      v21 = *(_QWORD *)(a1 + 720);
    }
    else
    {
      v21 = phOsalNfc_Timer_Create();
      *(_QWORD *)(a1 + 720) = v21;
    }
    if (v21 && v21 != 0xFFFFFFFFFFFFLL)
    {
      if (!phOsalNfc_Timer_Start())
      {
        sub_21988629C(1, (unsigned int *)(a1 + 19368), *(_QWORD *)(a1 + 720), 4u, 4u, (uint64_t)"phLibNfc_PropRdrNtfHandler");
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"Vas Inversion Timer started:Waiting for Express Started NTF after reception of VAS");
        return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropRdrNtfHandler");
      }
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Timer Start Failed for VAS NTF timer");
      phOsalNfc_Timer_Delete();
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Timer Create Failed for VAS NTF timer");
    }
    *(_QWORD *)(a1 + 720) = 0xFFFFFFFFFFFFLL;
  }
  else
  {
LABEL_25:
    if ((*(_BYTE *)(a1 + 1012) & 0x10) != 0)
    {
      phOsalNfc_MemCopy();
      if ((_DWORD)v25)
      {
        if (v25 > 0x14)
        {
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Received VasUpPayload size exceeded Max vas code length");
          LODWORD(v25) = 0;
        }
        else
        {
          phOsalNfc_MemCopy();
          *(_QWORD *)(a1 + 1376) = a1 + 1402;
        }
      }
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"RF_ON followed by VAS (Exp Non Entry) received hence propogate VAS NTF to upper");
      *(_BYTE *)(a1 + 1401) = 0;
    }
    v15 = *(void (**)(_QWORD, uint64_t, uint64_t, __int128 *))(a1 + 6568);
    if (v15)
    {
      v16 = *(_QWORD *)(a1 + 6576);
      sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_PropRdrNtfHandler :pGenericNtfCb[Prop Rdr Ntf]");
      v15(*(_QWORD *)(a1 + 19360), v16, 69, &v24);
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropRdrNtfHandler");
}

uint64_t sub_2198ED75C(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v9;

  result = sub_21988629C(2, (unsigned int *)a2, a1, 4u, 4u, (uint64_t)"phLibNfc_eSEExpNtfTimeOutCb");
  if (a2)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 2);
      if ((v4 & 1) != 0)
        break;
      v4 = 1;
      v5 = 1;
    }
    while (v6 != a2);
    if (v6 == a2)
    {
      v7 = *(_QWORD *)(a2 + 720);
      if (v7 && v7 != 0xFFFFFFFFFFFFLL)
      {
        phOsalNfc_Timer_Delete();
        *(_QWORD *)(a2 + 720) = 0xFFFFFFFFFFFFLL;
      }
      sub_219850628(1, (unsigned int *)(a2 + 19368), 4u, 4u, (uint64_t)"Timer STOPPED phLibNfc_eSEExpNtfTimeOutCb");
      *(_BYTE *)(a2 + 1400) = 0;
      v8 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a2 + 6568);
      if (v8)
      {
        v9 = *(_QWORD *)(a2 + 6576);
        sub_219853E34(1, (unsigned int *)(a2 + 19368), 4u, 4u, (uint64_t)"eSEExpNtfTimeOutCb :pGenericNtfCb[exp ntf timeout]");
        v8(*(_QWORD *)(a2 + 19360), v9, 69, a2 + 1368);
      }
      *(_DWORD *)(a2 + 1360) = 6;
      phOsalNfc_SetMemory();
      result = phOsalNfc_SetMemory();
      *(_BYTE *)(a2 + 1401) = 0;
    }
  }
  return result;
}

uint64_t sub_2198ED8AC(uint64_t a1, int a2)
{
  void (*v4)(uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int *v9;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PllNtfHandler");
  if (a1)
  {
    v4 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 6568);
    v5 = *(_QWORD *)(a1 + 6576);
    if (a2 == 12)
    {
      if (*(_QWORD *)(a1 + 6056))
      {
        *(_BYTE *)(a1 + 3153) = 1;
        return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PllNtfHandler");
      }
      if (!v4)
        return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PllNtfHandler");
      v9 = (unsigned int *)(a1 + 19368);
      if (*(_BYTE *)(a1 + 2944) != 1)
      {
        sub_219850628(1, v9, 4u, 1u, (uint64_t)"Unknown ntf is received, and dropped ");
        return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PllNtfHandler");
      }
      sub_219853E34(1, v9, 4u, 4u, (uint64_t)"PlllostlockNtfHandler :pGenericNtfCb[PLL lost lock]");
      v6 = *(_QWORD *)(a1 + 19360);
      v7 = v5;
      v8 = 77;
      goto LABEL_13;
    }
    if (a2 == 11)
    {
      if (*(_QWORD *)(a1 + 6056))
      {
        *(_BYTE *)(a1 + 3152) = 1;
        return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PllNtfHandler");
      }
      if (!v4)
        return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PllNtfHandler");
      sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"PllUnlockedNtfHandler :pGenericNtfCb[PLL UNLOCK]");
      v6 = *(_QWORD *)(a1 + 19360);
      v7 = v5;
      v8 = 70;
LABEL_13:
      v4(v6, v7, v8, 0);
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PllNtfHandler");
}

uint64_t sub_2198ED9E0(uint64_t a1, int a2, uint64_t *a3)
{
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t *);
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v13 = 0;
  v14 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfTxLdoErrorNtfHandler");
  if (a1)
  {
    if (a2 == 13)
    {
      v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 6568);
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 6576);
        if (a3 && *a3 && (v8 = *((_DWORD *)a3 + 2)) != 0)
        {
          v13 = *a3;
          LODWORD(v14) = v8;
          sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_RfTxLdoErrorNtfHandler :pGenericNtfCb[TXLDO ERROR]");
          v9 = *(_QWORD *)(a1 + 19360);
          v10 = &v13;
          v11 = v7;
        }
        else
        {
          sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_RfTxLdoErrorNtfHandler :pGenericNtfCb[TXLDO ERROR]");
          v9 = *(_QWORD *)(a1 + 19360);
          v11 = v7;
          v10 = 0;
        }
        v6(v9, v11, 87, v10);
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfTxLdoErrorNtfHandler");
}

uint64_t sub_2198EDAEC(uint64_t a1, int a2)
{
  void (*v4)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ExtTempNormalNtfHandler");
  if (a1)
  {
    if (a2 == 14)
    {
      v4 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(a1 + 6568);
      if (v4)
      {
        v5 = *(_QWORD *)(a1 + 6576);
        sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ExtTempNormalNtfHandler :pGenericNtfCb[GPADC Temperature back To Normal Notification]");
        v4(*(_QWORD *)(a1 + 19360), v5, 88, 0);
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ExtTempNormalNtfHandler");
}

uint64_t sub_2198EDB94(uint64_t a1, int a2)
{
  void (*v4)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfXtalErrNtfHandler");
  if (a1 && a2 == 16)
  {
    if (*(_QWORD *)(a1 + 6056))
    {
      *(_BYTE *)(a1 + 3154) = 1;
    }
    else
    {
      v4 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(a1 + 6568);
      if (v4)
      {
        v5 = *(_QWORD *)(a1 + 6576);
        sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"XtalErrNtfHandler :pGenericNtfCb[XTAL Start Error]");
        v4(*(_QWORD *)(a1 + 19360), v5, 90, 0);
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfXtalErrNtfHandler");
}

uint64_t sub_2198EDC50(uint64_t a1, int a2, uint64_t a3, int a4)
{
  void (*v8)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v9;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TotalPollDurationNtfHandler");
  if (a3)
  {
    if (a1)
    {
      if (!a4 && a2 == 17)
      {
        v8 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a1 + 6568);
        if (v8)
        {
          v9 = *(_QWORD *)(a1 + 6576);
          sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"TotalPollDurationNtfHandler :pGenericNtfCb[Total POLL Duration]");
          v8(*(_QWORD *)(a1 + 19360), v9, 122, a3);
        }
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TotalPollDurationNtfHandler");
}

uint64_t sub_2198EDD08(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  void (*v7)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_CrcErrorNtfHandler");
  if (a1 && a2 == 26)
  {
    v7 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(a1 + 6568);
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 6576);
      sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"CrcErrorNtfHandler :pGenericNtfCb[CRC Err ntf]");
      v7(*(_QWORD *)(a1 + 19360), v8, a4, 0);
    }
    if (*(_QWORD *)(a1 + 6056))
      sub_219893CC0((unsigned int *)a1, 137);
  }
  else
  {
    sub_219850628(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_CrcErrorNtfHandler: Can not process Crc error - Invalid input parameters");
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_CrcErrorNtfHandler");
}

uint64_t sub_2198EDDEC(uint64_t a1, int a2, uint64_t *a3, int a4)
{
  void (*v8)(_QWORD, uint64_t, uint64_t, uint64_t *);
  uint64_t v9;
  const char *v10;
  uint64_t v12;
  uint64_t v13;

  v12 = 0;
  v13 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GpadcDebugHandler");
  if (!a1 || a2 != 39 || !a3 || a4)
  {
    v10 = "phLibNfc_GpadcDebugHandler: Can not process Gpadc debug Ntf - Invalid input parameters";
LABEL_9:
    sub_219850628(2, (unsigned int *)a1, 4u, 4u, (uint64_t)v10);
    return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GpadcDebugHandler");
  }
  v8 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(a1 + 6568);
  if (!v8)
  {
    v10 = "phLibNfc_GpadcDebugHandler: Dropping Ntf as there is no registration";
    goto LABEL_9;
  }
  v9 = *(_QWORD *)(a1 + 6576);
  v12 = *a3;
  LODWORD(v13) = *((_DWORD *)a3 + 2);
  sub_219853E34(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_GpadcDebugHandler :pGenericNtfCb[Gpadc debug ntf]");
  v8(*(_QWORD *)(a1 + 19360), v9, 85, &v12);
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GpadcDebugHandler");
}

uint64_t sub_2198EDEEC(uint64_t a1, int a2, uint64_t *a3, int a4)
{
  void (*v8)(_QWORD, uint64_t, uint64_t, uint64_t *);
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EraseCounterNtfHandler");
  if (a1 && a2 == 40 && a3 && !a4)
  {
    phOsalNfc_SetMemory();
    v8 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(a1 + 6568);
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 6576);
      v11 = *a3;
      LODWORD(v12) = *((_DWORD *)a3 + 2);
      sub_219853E34(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_EraseCounterNtfHandler :pGenericNtfCb[erase counter exceed limit ntf]");
      v8(*(_QWORD *)(a1 + 19360), v9, 86, &v11);
    }
    else
    {
      sub_219850628(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_EraseCounterNtfHandler: Dropping Ntf as there is no registration");
    }
  }
  else
  {
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_EraseCounterNtfHandler: Can not process Erase counter exceed limit Ntf - Invalid input parameters");
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_EraseCounterNtfHandler");
}

uint64_t sub_2198EE018(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  void (*v7)(_QWORD, uint64_t, uint64_t, _QWORD);
  uint64_t v8;
  void (*v9)(_QWORD, uint64_t, uint64_t);
  uint64_t v10;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_CustTrimErrorNtfHandler");
  if (a1 && a2 == 29)
  {
    v7 = *(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(a1 + 6568);
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 6576);
      sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"CustTrimErrorNtfHandler :pGenericNtfCb[Trim Err ntf]");
      v7(*(_QWORD *)(a1 + 19360), v8, a4, 0);
    }
    if (*(_QWORD *)(a1 + 6248))
    {
      sub_2199002B0(*(_QWORD *)(a1 + 3040), 0);
      *(_QWORD *)(a1 + 2912) = 0;
      *(_WORD *)(a1 + 2904) = 0;
      *(_BYTE *)(a1 + 2906) = 0;
      v9 = *(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 6248);
      v10 = *(_QWORD *)(a1 + 6256);
      *(_QWORD *)(a1 + 6248) = 0;
      *(_QWORD *)(a1 + 6256) = 0;
      v9(*(_QWORD *)(a1 + 19360), v10, 136);
    }
    if (*(_QWORD *)(a1 + 6056))
      sub_219893CC0((unsigned int *)a1, 136);
  }
  else
  {
    sub_219850628(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_CustTrimErrorNtfHandler: Can not process Cust Trim error - Invalid input parameters");
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_CustTrimErrorNtfHandler");
}

uint64_t sub_2198EE13C(uint64_t a1, int a2, uint64_t *a3)
{
  void (*v6)(_QWORD, uint64_t, uint64_t, uint64_t *);
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TrimmingErrorNtfHandler");
  if (a2 == 44 && a1 && a3)
  {
    v6 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t *))(a1 + 6568);
    if (v6 && (v7 = *a3) != 0 && (v8 = *((_DWORD *)a3 + 2)) != 0)
    {
      v9 = *(_QWORD *)(a1 + 6576);
      v11 = v7;
      LODWORD(v12) = v8;
      sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_TrimmingErrorNtfHandler :pGenericNtfCb[Trimming Failure ntf]");
      v6(*(_QWORD *)(a1 + 19360), v9, 89, &v11);
    }
    else
    {
      sub_219850628(2, (unsigned int *)a1, 4u, 2u, (uint64_t)"phLibNfc_TrimmingErrorNtfHandler: Dropping - Trimming Failure Info Ntf");
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TrimmingErrorNtfHandler");
}

uint64_t sub_2198EE234(uint64_t a1, int a2, uint64_t a3)
{
  void (*v6)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SpmiStsRegInfoNtfHandler");
  if (a1 && a2 == 45)
  {
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 6568);
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 6576);
      sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_SpmiStsRegInfoNtfHandler :pGenericNtfCb[Spmi Status RegInfo ntf]");
      if (a3)
      {
        v8 = *(_QWORD *)(a1 + 19360);
        v9 = v7;
        v10 = a3;
      }
      else
      {
        sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_SpmiStsRegInfoNtfHandler: Read Spmi Status Failed - pInfo set to NULL");
        v8 = *(_QWORD *)(a1 + 19360);
        v9 = v7;
        v10 = 0;
      }
      v6(v8, v9, 91, v10);
    }
    else
    {
      sub_219850628(2, (unsigned int *)a1, 4u, 2u, (uint64_t)"phLibNfc_SpmiStsRegInfoNtfHandler: Dropping - Spmi Status Register Info Ntf");
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SpmiStsRegInfoNtfHandler");
}

uint64_t sub_2198EE334(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void (*v7)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RssiStatsHandler");
  if (a3 && a1 && !a4)
  {
    v7 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a1 + 6568);
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 6576);
      sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"RssiStatsHandler :pGenericNtfCb[RSSI STATS ntf]");
      v7(*(_QWORD *)(a1 + 19360), v8, 83, a3);
    }
  }
  else
  {
    sub_219850628(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_RssiStatsHandler: Can not process RSSI Stats NTF - Invalid input parameters");
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RssiStatsHandler");
}

uint64_t sub_2198EE400(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void (*v7)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_UartCommnErrorHandler");
  if (a1 && a4 == 80)
  {
    v7 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a1 + 6568);
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 6576);
      sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"UartCommnErrorHandler :pGenericNtfCb[COMM ERR]");
      v7(*(_QWORD *)(a1 + 19360), v8, 80, a3);
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_UartCommnErrorHandler: Droping as no Registrations Exist");
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_UartCommnErrorHandler");
}

uint64_t sub_2198EE4D0(uint64_t a1, uint64_t a2, int *a3, uint64_t a4)
{
  char v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int *v11;
  const char *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  unsigned int *v18;
  uint64_t v19;
  int v21;
  uint64_t v22;
  unsigned int *v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  _OWORD v27[2];
  uint64_t v28;

  v28 = 0;
  memset(v27, 0, sizeof(v27));
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
  if (!a1)
    goto LABEL_9;
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = *((_QWORD *)&unk_253E46700 + 14 * v8 + 2);
    if ((v7 & 1) != 0)
      break;
    v7 = 1;
    v8 = 1;
  }
  while (v9 != a1);
  if (!a3 || v9 != a1)
  {
LABEL_9:
    v12 = "Invalid Params received!!";
    v13 = 2;
    v11 = (unsigned int *)a1;
LABEL_39:
    sub_219850628(v13, v11, 4u, 1u, (uint64_t)v12);
    return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
  }
  v10 = *a3;
  switch(*a3)
  {
    case 1:
      v11 = (unsigned int *)(a1 + 19368);
      v12 = "Generic error received: phNciNfc_e_Rejected";
      goto LABEL_38;
    case 2:
      v11 = (unsigned int *)(a1 + 19368);
      v12 = "Generic error received: phNciNfc_e_RfFrameCorrupted";
      goto LABEL_38;
    case 3:
      v11 = (unsigned int *)(a1 + 19368);
      v12 = "Generic error received: phNciNfc_e_Failed";
      goto LABEL_38;
    case 4:
      v11 = (unsigned int *)(a1 + 19368);
      v12 = "Generic error received: phNciNfc_e_NotInitiatlized";
      goto LABEL_38;
    case 5:
      v11 = (unsigned int *)(a1 + 19368);
      v12 = "Generic error received: phNciNfc_e_SyntaxErr";
      goto LABEL_38;
    case 6:
      v11 = (unsigned int *)(a1 + 19368);
      v12 = "Generic error received: phNciNfc_e_SemanticErr";
      goto LABEL_38;
    case 7:
      v11 = (unsigned int *)(a1 + 19368);
      v12 = "Generic error received: phNciNfc_e_InvalidParam";
      goto LABEL_38;
    case 8:
      v11 = (unsigned int *)(a1 + 19368);
      v12 = "Generic error received: phNciNfc_e_MsgSizeExceeded";
      goto LABEL_38;
    case 9:
      v11 = (unsigned int *)(a1 + 19368);
      v12 = "Generic error received: phNciNfc_e_DiscAlreadyStarted";
      goto LABEL_38;
    case 10:
      v11 = (unsigned int *)(a1 + 19368);
      v12 = "Generic error received: phNciNfc_e_DiscTgtActvnFailed";
      goto LABEL_38;
    case 11:
      v11 = (unsigned int *)(a1 + 19368);
      v12 = "Generic error received: phNciNfc_e_DiscTearDown";
      goto LABEL_38;
    default:
      if (v10 == 237)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"Generic error received: phNciNfc_e_CustTrimAreaAssert");
        sub_2198EE018(a1, 29, v14, a4);
        return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
      }
      if (v10 == 247)
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"Generic error received: phNciNfc_e_SmbTxBlocked");
        if (*(_QWORD *)(a1 + 6296) || *(_QWORD *)(a1 + 6312) || *(_QWORD *)(a1 + 6536))
          *(_BYTE *)(a1 + 706) = 1;
        if (*(_QWORD *)(a1 + 6696))
        {
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"phLibNfc_GenericErrorHandler: Independent SMB TX Blocked Received");
          phOsalNfc_SetMemory();
          LODWORD(v28) = 255;
          sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_GenericErrorHandler:pSeListenerNtfCb[SMB TX BLOCKED]");
          (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, _QWORD))(a1 + 6696))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6704), 28, *(_QWORD *)(a1 + 392), v27, 0);
        }
        return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
      }
      if ((_DWORD)a4 != 133)
      {
        v11 = (unsigned int *)(a1 + 19368);
        v12 = "Generic error received: phNciNfc_e_ErrorNotDefined -Unknown error code";
LABEL_38:
        v13 = 1;
        goto LABEL_39;
      }
      if (*(_QWORD *)(a1 + 6568))
      {
        sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"GenericErrorHandler :pGenericNtfCb[GENERIC ERR Ntf]");
        (*(void (**)(_QWORD, _QWORD, uint64_t, int *))(a1 + 6568))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6576), 133, a3 + 1);
      }
      v15 = *(_QWORD *)(a1 + 6056);
      v16 = a3[1];
      if (v15 && (v16 - 229) <= 0x11)
      {
        v17 = 1 << (v16 + 27);
        if ((v17 & 0x43) != 0)
        {
LABEL_48:
          v18 = (unsigned int *)a1;
          v19 = 137;
          goto LABEL_49;
        }
        if ((v17 & 0x20024) != 0)
        {
          v18 = (unsigned int *)a1;
          v19 = 136;
LABEL_49:
          sub_219893CC0(v18, v19);
          return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
        }
      }
      if ((v16 - 251) > 3)
        return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
      v21 = 0;
      v22 = *(_QWORD *)(a1 + 3192);
      if (v22 && v22 != 0xFFFFFFFFFFFFLL)
      {
        phOsalNfc_Timer_Stop();
        *(_BYTE *)(a1 + 6032) = 0;
        v21 = 1;
        sub_21988629C(1, (unsigned int *)(a1 + 19368), *(_QWORD *)(a1 + 3192), 4u, 4u, (uint64_t)"phLibNfc_GenericErrorHandler");
        phOsalNfc_Timer_Delete();
        *(_QWORD *)(a1 + 3192) = 0xFFFFFFFFFFFFLL;
        v15 = *(_QWORD *)(a1 + 6056);
      }
      v23 = (unsigned int *)(a1 + 19368);
      if (!v15)
      {
        *(_BYTE *)(a1 + 3216) = 0;
        sub_219850628(1, v23, 4u, 4u, (uint64_t)"phLibNfc_PropMultiTagStatNtfHandler- Independant Prop Tag Det NTF Rxd");
        return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
      }
      if (a3[1] == 253)
      {
        sub_219850628(1, v23, 4u, 1u, (uint64_t)"Generic error received: UNEXPECTED MULTI TAG DETECTION ERROR");
        goto LABEL_48;
      }
      sub_219850628(1, v23, 4u, 2u, (uint64_t)"Generic error received: MULTI_TAG ERROR");
      if (v21 && !*(_BYTE *)(a1 + 3216))
      {
        *(_BYTE *)(a1 + 3216) = 1;
        *(_QWORD *)(a1 + 2912) = off_2550A11C0;
        *(_BYTE *)(a1 + 2904) = 0;
        *(_BYTE *)(a1 + 2906) = 0;
        v24 = (char)off_2550A11C0[0];
        if (off_2550A11C0[0])
        {
          v24 = 0;
          v25 = &qword_2550A11D0;
          do
          {
            ++v24;
            v26 = *v25;
            v25 += 2;
          }
          while (v26);
        }
        *(_BYTE *)(a1 + 2905) = v24;
        if (sub_2198655FC(a1, 0, 0) != 13)
          sub_2198ECF68((unsigned int *)a1, 255);
      }
      return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GenericErrorHandler");
  }
}

uint64_t sub_2198EE9D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerAssertCb");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"TriggerNfccAssertion: Failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, 0, 0);
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_TriggerAssertCb");
}

unint64_t sub_2198EEA6C(unsigned int a1)
{
  int *v1;
  unsigned int v2;
  unsigned int v3;
  int8x16_t v4;
  uint64x2_t v5;
  uint64x2_t v6;
  uint32x4_t v7;
  int8x16_t v8;
  int8x16_t v9;
  int8x16_t v10;
  unint64_t v11;
  unsigned int v13;

  v13 = a1;
  sub_219850718(1, &v13, 4u, 5u, (uint64_t)"phLibNfc_FrameDebugParam");
  if (v13)
  {
    if (v13 != 1)
    {
      sub_219850628(1, &v13, 4u, 1u, (uint64_t)"phLibNfc_FrameDebugParam: passed controller type is unknown");
      v11 = 0;
      goto LABEL_7;
    }
    v1 = &dword_253E47158;
  }
  else
  {
    v1 = &dword_253E47070;
  }
  v3 = *v1;
  v2 = v1[1];
  v4 = vandq_s8((int8x16_t)vshlq_u32((uint32x4_t)vdupq_n_s32(v3), (uint32x4_t)xmmword_21990B1C0), (int8x16_t)xmmword_21990B1D0);
  v5.i64[0] = v4.u32[0];
  v5.i64[1] = v4.u32[1];
  v6 = v5;
  v5.i64[0] = v4.u32[2];
  v5.i64[1] = v4.u32[3];
  v7 = (uint32x4_t)vdupq_n_s32(v2);
  v8 = (int8x16_t)vshlq_u32(v7, (uint32x4_t)xmmword_21990B200);
  v8.i32[3] = vshlq_u32(v7, (uint32x4_t)xmmword_21990B220).i32[3];
  v9 = vorrq_s8(vandq_s8(v8, (int8x16_t)xmmword_21990B230), vorrq_s8(vandq_s8((int8x16_t)vshlq_u32(v7, (uint32x4_t)xmmword_21990B210), (int8x16_t)xmmword_21990B240), vandq_s8((int8x16_t)vshlq_u32(v7, (uint32x4_t)xmmword_21990B250), (int8x16_t)xmmword_21990B260)));
  *(int8x8_t *)v9.i8 = vorr_s8(*(int8x8_t *)v9.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v9, v9, 8uLL));
  v10 = vorrq_s8((int8x16_t)vshlq_u64(v6, (uint64x2_t)xmmword_21990B1F0), (int8x16_t)vshlq_u64(v5, (uint64x2_t)xmmword_21990B1E0));
  v11 = *(_QWORD *)&vorr_s8(*(int8x8_t *)v10.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v10, v10, 8uLL)) | ((unint64_t)((v3 >> 17) & 1) << 46) | ((unint64_t)((v3 >> 23) & 0x1F) << 36) | ((unint64_t)((v3 >> 18) & 0x1F) << 41) | (v2 << 31) | ((unint64_t)(v3 >> 28) << 32) | (v2 << 29) & 0x40000000 | (v2 >> 31) | (v2 << 25) & 0x10000000 | (((v2 >> 2) & 1) << 29) | v9.i32[0] | (v2 >> 29) & 2 | v9.i32[1];
LABEL_7:
  sub_219850808(1, &v13, 4u, 5u, (uint64_t)"phLibNfc_FrameDebugParam");
  return v11;
}

uint64_t sub_2198EEC3C(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeEnd");
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 2952);
    if (*(_DWORD *)(a1 + 3176) != 1)
      phTmlNfc_IoCtl();
    sub_2198BBF5C(a1);
    phOsalNfc_FreeMemory();
    sub_21988EEB4(v2, 0);
  }
  return sub_219850808(2, 0, 4u, 5u, (uint64_t)"phLibNfc_ConfigTestModeEnd");
}

uint64_t sub_2198EECD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  int v8;
  const char *v9;
  int v10;
  unsigned int *v11;
  int v12;
  uint64_t v15;
  const char *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  __int16 v20;

  v20 = 0;
  v18 = 0;
  v19 = 0;
  v17 = 8;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigNciMode");
  if (!a1)
  {
    v9 = "FAILURE, Libnfc or Download Context is Invalid";
    v10 = 2;
    v11 = 0;
LABEL_17:
    sub_219850628(v10, v11, 4u, 1u, (uint64_t)v9);
    a2 = 255;
    goto LABEL_28;
  }
  v4 = *(_QWORD *)(a1 + 2952);
  sub_21988F460(v4, &v18);
  sub_21988ED38(v4, &v17);
  sub_21988EB80(v4, &v19);
  v5 = 0;
  v6 = 1;
  while (1)
  {
    v7 = v6;
    if (*((_QWORD *)&unk_253E46700 + 14 * v5) == v4)
      break;
    v6 = 0;
    v5 = 1;
    if ((v7 & 1) == 0)
    {
      v8 = 255;
      goto LABEL_8;
    }
  }
  v8 = *((_DWORD *)&unk_253E46700 + 28 * v5 + 2);
LABEL_8:
  if (!v19 || !v18)
  {
    v11 = (unsigned int *)(a1 + 19368);
    v9 = "FAILURE, IOCTL/DNLD Context is Invalid";
    v10 = 1;
    goto LABEL_17;
  }
  v12 = sub_21986C924(*(_QWORD *)(v19 + 8), *(unsigned __int8 *)(v19 + 92), *(unsigned __int8 *)(v19 + 94));
  if ((v17 & 0xFFFFFFFD) != 4)
    goto LABEL_27;
  if (v12 == 6)
    goto LABEL_14;
  if (v12 == 3)
  {
    if (*(_BYTE *)(v19 + 94) == 1)
    {
LABEL_14:
      if (v8 != 1)
        goto LABEL_27;
      goto LABEL_23;
    }
LABEL_27:
    sub_21986607C(a1, *(_QWORD *)(a1 + 2912), 1);
    goto LABEL_28;
  }
  if (v12 != 7 || v8 != 1)
    goto LABEL_27;
LABEL_23:
  phTmlNfc_IoCtl();
  a2 = phTmlNfc_IoCtl();
  sub_219886334(1, (unsigned int *)(a1 + 19368), 4u, 3u, (uint64_t)"phLibNfc_ConfigNciMode: Assert Wakeup Status=");
  if ((_DWORD)a2 == 179)
  {
    sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ConfigNciMode: NFCSTATUS_SPMI_NACK1");
    phOsalNfc_Delay();
    a2 = phTmlNfc_IoCtl();
    sub_219886334(1, (unsigned int *)(a1 + 19368), 4u, 3u, (uint64_t)"phLibNfc_ConfigNciMode: Assert Wakeup Status=");
  }
  if ((_DWORD)a2 != 179)
  {
    if (!(_DWORD)a2)
      goto LABEL_27;
    v16 = "phLibNfc_ConfigNciMode Unexpected Driver Error";
LABEL_32:
    sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)v16);
    goto LABEL_28;
  }
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ConfigNciMode: NFCSTATUS_SPMI_NACK2");
  sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_ConfigNciMode: Update client-ID to Secondary client ID(0x0B)");
  v15 = phTmlNfc_ConfigureSpmi();
  if ((_DWORD)v15)
  {
    a2 = v15;
    v16 = "phLibNfc_ConfigNciMode - client ID update failed";
    goto LABEL_32;
  }
  phTmlNfc_ReadAbort();
  phTmlNfc_FlushTxRxBuffers();
  if (!sub_21988F8B8(v4))
    phTmlNfc_WriteAbort();
  *(_QWORD *)(a1 + 2952) = v4;
  *(_QWORD *)(a1 + 19360) = v4;
  if (sub_2198FB470(v4, (uint64_t)&v20, (uint64_t)sub_2198655FC, a1, 1, 0) == 13)
    a2 = 13;
  else
    a2 = 255;
LABEL_28:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ConfigNciMode");
  return a2;
}

uint64_t sub_2198EEFFC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unsigned __int16 *v6;
  int v7;
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SysConfigInitRspCb");
  if (a1 && a3)
  {
    v6 = (unsigned __int16 *)a3[1];
    v7 = a2;
    if (v6)
      v7 = *v6;
    if (!v7)
    {
      v8 = *a3;
      *(_QWORD *)(a1 + 3040) = *a3;
      if (sub_2198975C8(a1, v8)
        || !sub_21986C924(*(_QWORD *)(a1 + 19360), *(unsigned __int8 *)(a1 + 2988), *(unsigned __int8 *)(a1 + 3088)))
      {
        a2 = 255;
      }
    }
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SysConfigInitRspCb");
  return a2;
}

uint64_t sub_2198EF0AC(unsigned int *a1, uint64_t a2, unsigned int a3, _BYTE *a4)
{
  __int16 v8;
  char v9;
  unsigned int v10;
  int v11;
  int v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ParseRfConfigSignedInputBuffer");
  if (!a2 || !a3 || !a4)
  {
    if (a4)
      *a4 = 0;
    v15 = 1;
    sub_219850628(2, a1, 4u, 1u, (uint64_t)"Invalid input parameter");
    goto LABEL_23;
  }
  v8 = 0;
  v9 = 0;
  v10 = 0;
  while (1)
  {
    v11 = *(unsigned __int8 *)(a2 + v10);
    if ((v11 - 160) >= 2)
      break;
    v12 = 0;
    v13 = v10 + 2;
    v8 += *(unsigned __int8 *)(a2 + v10 + 2) + 3;
    ++v9;
    v14 = v10 + 3;
LABEL_13:
    v10 = v12 + v14 + *(unsigned __int8 *)(a2 + v12 + v13);
    if (v10 >= a3)
      goto LABEL_19;
  }
  if (v11 != 240)
    goto LABEL_19;
  if (*(_BYTE *)(a2 + v10 + 1) != 2)
    goto LABEL_19;
  v13 = v10 + 2;
  if (*(_BYTE *)(a2 + v10 + 2))
    goto LABEL_19;
  v14 = v10 + 3;
  if (*(_BYTE *)(a2 + v10 + 3) != 8)
    goto LABEL_19;
  if ((unsigned __int16)(v8 - 1) < 0xF2u)
  {
    v8 = 0;
    v12 = 1;
    goto LABEL_13;
  }
  sub_219850628(2, a1, 4u, 2u, (uint64_t)"phLibNfc_ParseRfConfigSignedInputBuffer: Payload Len issue");
LABEL_19:
  if (v10 == a3 && v9)
  {
    v15 = 0;
    *a4 = v9;
  }
  else
  {
    *a4 = 0;
    sub_219850628(2, a1, 4u, 1u, (uint64_t)"Inconsistent input buffer!");
    v15 = 255;
  }
LABEL_23:
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_ParseRfConfigSignedInputBuffer");
  return v15;
}

uint64_t sub_2198EF258(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void (*v7)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LpcdTraceNtfHandler");
  if (a3 && a1 && !a4)
  {
    v7 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a1 + 6568);
    if (v7)
    {
      v8 = *(_QWORD *)(a1 + 6576);
      sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"LpcdTraceNtfHandler :pGenericNtfCb[Lpcd Trace Ntf]");
      v7(*(_QWORD *)(a1 + 19360), v8, 82, a3);
    }
  }
  else
  {
    sub_219850628(2, (unsigned int *)a1, 4u, 4u, (uint64_t)"phLibNfc_LpcdTraceNtfHandler: Can not process LPCD Trace NTF - Invalid input parameters");
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_LpcdTraceNtfHandler");
}

uint64_t sub_2198EF324(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReConfigHsuBrCmd");
  if (a1)
  {
    if (*(_BYTE *)(a1 + 2939) == 1 || *(_BYTE *)(a1 + 2944) == 1 || (v2 = *(_DWORD *)(a1 + 3056), v2 == 2))
      v3 = 0;
    else
      v3 = sub_2198FC894(*(_QWORD *)(a1 + 3040), v2, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v3 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ReConfigHsuBrCmd");
  return v3;
}

uint64_t sub_2198EF3CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ClrRetAssertDataCb");
  if (a1)
  {
    if ((_DWORD)a2)
      v4 = 146;
    else
      v4 = 145;
    sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, a1 + 8, 0);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_ClrRetAssertDataCb:Context is Null");
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ClrRetAssertDataCb");
}

uint64_t sub_2198EF464(uint64_t a1, unsigned __int8 *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  unsigned int *v12;
  const char *v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  uint64_t v27;
  uint64_t v28;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseAssertionData");
  if (!a1)
    goto LABEL_22;
  if (a2[1])
  {
    v12 = (unsigned int *)(a1 + 19368);
    v13 = "phLibNfc_ParseAssertionData:Failed Status Received From Lower Layer";
LABEL_21:
    sub_219850628(1, v12, 4u, 1u, (uint64_t)v13);
LABEL_22:
    v19 = 255;
    goto LABEL_23;
  }
  v14 = *(unsigned __int8 *)(a1 + 2936);
  if (v14 == 1)
  {
    v15 = 146;
  }
  else if (*(_BYTE *)(a1 + 2938) == 1)
  {
    v15 = 186;
  }
  else if (*(_BYTE *)(a1 + 2946) == 1)
  {
    v15 = 126;
  }
  else
  {
    v15 = 166;
  }
  v16 = *a2;
  if (v15 != v16)
  {
    v12 = (unsigned int *)(a1 + 19368);
    v13 = "phLibNfc_ParseAssertionData:INvalid Length Received from Lower Layer";
    goto LABEL_21;
  }
  if (v16 >= 3)
  {
    v17 = 0;
    v18 = v15 - 2;
    while (a2[v17 + 3] != 160 || a2[v17 + 4] != 26 || a2[v17 + 5] != 4)
    {
      if (v18 == ++v17)
        goto LABEL_18;
    }
    v19 = 0;
    *a3 = v17 + 6;
    if (!v14)
      goto LABEL_25;
LABEL_19:
    v20 = 64;
    goto LABEL_28;
  }
LABEL_18:
  v19 = 255;
  if (*(_BYTE *)(a1 + 2936))
    goto LABEL_19;
LABEL_25:
  if (*(_BYTE *)(a1 + 2938) == 1)
    v20 = 96;
  else
    v20 = 80;
LABEL_28:
  v22 = *a2;
  if (v22 >= 3)
  {
    v24 = 2;
    while (a2[v24 + 1] != 160 || a2[v24 + 2] != 27 || v20 != a2[v24 + 3])
    {
      if (v22 == ++v24)
        goto LABEL_35;
    }
    v19 = 0;
    *a4 = v24 + 4;
    LODWORD(v22) = *a2;
LABEL_35:
    v23 = v22;
    if (v22 <= 2)
      goto LABEL_41;
    v25 = 2;
    while (a2[v25 + 1] != 160 || a2[v25 + 2] != 28 || a2[v25 + 3] != 44)
    {
      if (v22 == ++v25)
        goto LABEL_41;
    }
    v19 = 0;
    *a6 = v25 + 4;
    LODWORD(v22) = *a2;
  }
  v23 = v22;
LABEL_41:
  if (v14 == 1)
    v26 = 20;
  else
    v26 = 24;
  if (*(_BYTE *)(a1 + 2938) == 1)
    v26 += 4;
  if (*(_BYTE *)(a1 + 2946) == 1)
    v26 -= 8;
  if (v23 >= 3)
  {
    v27 = 0;
    v28 = v22 - 2;
    while (a2[v27 + 3] != 160 || a2[v27 + 4] != 39 || a2[v27 + 5] != v26)
    {
      if (v28 == ++v27)
        goto LABEL_23;
    }
    v19 = 0;
    *a5 = v27 + 6;
  }
LABEL_23:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_ParseAssertionData");
  return v19;
}

uint64_t sub_2198EF748(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v6)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v7;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetNfccParamsCallback");
  if (a1)
  {
    v6 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a1 + 6776);
    v7 = *(_QWORD *)(a1 + 6784);
    *(_OWORD *)(a1 + 6776) = 0u;
    if (v6)
    {
      sub_219851790(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_SM_eGetNfcParams: Invoking callback, wStatus = ");
      sub_219885F70(1, (unsigned int *)(a1 + 19368), 4u, 131, (uint64_t)"phLibNfc_GetNfccParamsCallback");
      v6(*(_QWORD *)(a1 + 19360), v7, a2, a3);
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetNfccParamsCallback");
}

uint64_t sub_2198EF82C(unsigned int a1, uint64_t a2)
{
  unsigned int v4;

  v4 = a1;
  sub_219850718(1, &v4, 4u, 5u, (uint64_t)"phLibNfc_StopTimer");
  if (a2 && a2 != 0xFFFFFFFFFFFFLL && phOsalNfc_Timer_Stop())
    sub_219851790(1, &v4, 4u, 4u, (uint64_t)"LibNfc Timer_Stop failed,Stat=");
  return sub_219850808(1, &v4, 4u, 5u, (uint64_t)"phLibNfc_StopTimer");
}

uint64_t sub_2198EF8CC(uint64_t a1)
{
  unsigned int v2;
  int v3;
  BOOL v4;
  uint64_t v5;
  int v7;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetFwTypeCmd");
  if (a1)
  {
    if (*(_BYTE *)(a1 + 3216) == 1
      || ((v2 = *(unsigned __int8 *)(a1 + 2980), v3 = *(unsigned __int8 *)(a1 + 2937), v3 == 1)
        ? (v4 = v2 > 0xA)
        : (v4 = 0),
          v4 || *(_BYTE *)(a1 + 2938) == 1 || *(_BYTE *)(a1 + 2944) == 1))
    {
      v5 = sub_2199019B8(*(_QWORD *)(a1 + 3040), (uint64_t)sub_219865DD0, a1);
    }
    else
    {
      if ((v2 & 0xFFFFFFFD) != 0xFC && (v3 == 1 || *(_BYTE *)(a1 + 2936) == 1))
      {
        v5 = 0;
        if (v2 - 160 > 0x3F)
          v7 = 1;
        else
          v7 = 2;
      }
      else
      {
        v5 = 0;
        v7 = 3;
      }
      *(_DWORD *)(a1 + 3148) = v7;
    }
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
    v5 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetFwTypeCmd");
  return v5;
}

uint64_t sub_2198EF9F0(unsigned int *a1, uint64_t a2, unsigned __int8 **a3)
{
  int v6;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetFwTypeProc");
  if (a1 && a3)
  {
    if (!(_DWORD)a2 && *a3 && *((_DWORD *)a3 + 2))
    {
      sub_219850628(1, a1 + 4842, 4u, 4u, (uint64_t)"phLibNfc_GetFwTypeProc: operation success");
      v6 = **a3;
      if ((v6 - 1) >= 2)
      {
        **a3 = 3;
        v6 = **a3;
      }
      a2 = 0;
    }
    else
    {
      sub_219850628(1, a1 + 4842, 4u, 1u, (uint64_t)"phLibNfc_GetFwTypeProc: operation failed");
      v6 = 3;
    }
    a1[787] = v6;
  }
  else
  {
    sub_219850628(2, a1, 4u, 1u, (uint64_t)"phLibNfc_GetFwTypeProc: Libnfc Context is Invalid");
    a2 = 255;
  }
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_GetFwTypeProc");
  return a2;
}

uint64_t sub_2198EFB0C(unsigned int *a1, uint64_t a2, unsigned __int8 **a3)
{
  _BYTE *v7;
  unsigned int v8;
  int v9;
  int v10;
  int v11;

  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MultiTagGetFwTypeProc");
  if (a1 && a3)
  {
    if (!(_DWORD)a2 && *a3 && *((_DWORD *)a3 + 2))
    {
      sub_219850628(1, a1 + 4842, 4u, 4u, (uint64_t)"phLibNfc_MultiTagGetFwTypeProc: operation success");
      v7 = *a3;
      v8 = **a3;
      if (v8 - 1 >= 2)
      {
        *v7 = 3;
        v7 = *a3;
        v8 = **a3;
      }
      a2 = 0;
      a1[787] = v8;
      v9 = a1[746] | (v7[1] << 24);
      a1[746] = v9;
      v10 = v9 | (v7[2] << 16);
      a1[746] = v10;
      v11 = v10 | (v7[3] << 8);
      a1[746] = v11;
      a1[746] = v11 | v7[4];
    }
    else
    {
      sub_219850628(1, a1 + 4842, 4u, 1u, (uint64_t)"phLibNfc_MultiTagGetFwTypeProc: operation failed");
      a1[787] = 3;
      a1[746] = 0;
    }
  }
  else
  {
    sub_219850628(2, a1, 4u, 1u, (uint64_t)"phLibNfc_MultiTagGetFwTypeProc: Libnfc Context is Invalid");
    a2 = 255;
  }
  sub_219850808(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MultiTagGetFwTypeProc");
  return a2;
}

uint64_t sub_2198EFC64(unsigned int *a1, uint64_t a2)
{
  sub_219850718(2, a1, 4u, 5u, (uint64_t)"phLibNfc_MultiTagGetFwInfoComplete");
  if (a1)
  {
    sub_2198ECF68(a1, a2);
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_MultiTagGetFwInfoComplete: Libnfc Context is Invalid");
    a2 = 255;
  }
  sub_219850808(2, 0, 4u, 5u, (uint64_t)"phLibNfc_MultiTagGetFwInfoComplete");
  return a2;
}

uint64_t sub_2198EFCF4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  void (*v7)(_QWORD, uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropTagRemDetNtfHandler");
  if (a1)
  {
    if (a2 == 30)
    {
      sub_2198D1B2C(*(_QWORD *)(a1 + 19360), 152, 0, 0, 0);
      v7 = *(void (**)(_QWORD, uint64_t, _QWORD, _QWORD, uint64_t))(a1 + 6232);
      if (v7)
      {
        v8 = *(_QWORD *)(a1 + 6240);
        sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"TagRemDetNtfHandler :RemDevNtfCB[TagRemDetNtf]");
        v7(*(_QWORD *)(a1 + 19360), v8, 0, 0, a4);
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropTagRemDetNtfHandler");
}

uint64_t sub_2198EFDBC(uint64_t a1, int a2, uint64_t a3, int a4)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropLpcdDebugNtfHandler");
  if (a3 && a2 == 31 && a1 && !a4 && *(_QWORD *)(a1 + 6568))
  {
    sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"PropLpcdDebugNtfHandler :pGenericNtfCb[Lpcd Dbg Ntf]");
    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(a1 + 6568))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6576), 75, a3);
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropLpcdDebugNtfHandler");
}

uint64_t sub_2198EFE74(uint64_t a1, int a2, uint64_t a3, int a4)
{
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfLpcdAssistExitNtfHandler");
  if (a2 == 43 && a1 && !a4 && *(_QWORD *)(a1 + 6568))
  {
    sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"RfLpcdAssistExitNtfHandler :pGenericNtfCb[Lpcd Assistance Exit Ntf]");
    (*(void (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 6568))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6576), 79, 0);
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RfLpcdAssistExitNtfHandler");
}

uint64_t sub_2198EFF24(uint64_t a1, int a2, _DWORD *a3, int a4)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  unsigned __int8 *v11;
  int v12;
  int v13;
  uint64_t v15;
  int v16;

  v16 = 0;
  v15 = 0;
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RelaydetectionNtfHandler");
  if (a1)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = *((_QWORD *)&unk_253E46700 + 14 * v9 + 2);
      if ((v8 & 1) != 0)
        break;
      v8 = 1;
      v9 = 1;
    }
    while (v10 != a1);
    if (v10 == a1)
    {
      if (a3 && a2 == 34 && !a4)
      {
        if (a3[2] == 11 && *(_QWORD *)a3)
        {
          phOsalNfc_SetMemory();
          v11 = *(unsigned __int8 **)a3;
          LODWORD(v15) = v15 | **(unsigned __int8 **)a3 | (*(unsigned __int8 *)(*(_QWORD *)a3 + 1) << 8) | (*(unsigned __int8 *)(*(_QWORD *)a3 + 2) << 16);
          v12 = HIDWORD(v15) | v11[4];
          LODWORD(v15) = v15 | (v11[3] << 24);
          HIDWORD(v15) = v12;
          HIDWORD(v15) = v12 | (v11[5] << 8) | (v11[6] << 16);
          v13 = v16 | v11[8];
          HIDWORD(v15) |= v11[7] << 24;
          v16 = v13;
          v16 = v13 | (v11[9] << 8) | (v11[10] << 16);
          if (*(_QWORD *)(a1 + 6568))
          {
            sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_RelaydetectionNtfHandler :pGenericNtfCb[Relay Attack Detection Ntf]");
            (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t *))(a1 + 6568))(*(_QWORD *)(a1 + 19360), *(_QWORD *)(a1 + 6576), 159, &v15);
          }
          else
          {
            sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_RelaydetectionNtfHandler: pGenericNtfCb is NULL");
          }
        }
        else
        {
          sub_219850628(2, (unsigned int *)a1, 4u, 2u, (uint64_t)"phLibNfc_RelaydetectionNtfHandler: Received Len is zero");
        }
      }
      else
      {
        sub_219851888(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"phLibNfc_RelaydetectionNtfHandler: Failed status");
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_RelaydetectionNtfHandler");
}

uint64_t sub_2198F0140(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgValReInit");
  if (a1)
  {
    if ((*(_BYTE *)(a1 + 6024) & 0xFE) == 2 && *(_QWORD *)(a1 + 6008) && *(_DWORD *)(a1 + 6016))
    {
      *(_DWORD *)(a1 + 5416) = 5;
      *(_DWORD *)(a1 + 5424) = 2;
      *(_QWORD *)(a1 + 5432) = a1 + 6008;
      v2 = sub_219901BD8(*(_QWORD *)(a1 + 3040), (int *)(a1 + 5416), (uint64_t)sub_219865DD0, a1);
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetChipScopeLogCfgCmd : Libnfc Context is Invalid");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgValReInit");
  return v2;
}

uint64_t sub_2198F0228(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgStartReInit");
  if (a1)
  {
    if (*(_BYTE *)(a1 + 6024) == 3 && *(_QWORD *)(a1 + 6008) && *(_DWORD *)(a1 + 6016))
    {
      *(_DWORD *)(a1 + 5416) = 5;
      *(_DWORD *)(a1 + 5424) = 1;
      v2 = sub_219901BD8(*(_QWORD *)(a1 + 3040), (int *)(a1 + 5416), (uint64_t)sub_219865DD0, a1);
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_SetChipScopeLogCfgCmd : Libnfc Context is Invalid");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_SetChipScopeLogCfgStartReInit");
  return v2;
}

uint64_t sub_2198F0300(uint64_t a1, int a2, uint64_t a3, int a4)
{
  void (*v8)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v9;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropChipScopeLoggingNtfHandler");
  if (a1)
  {
    if (a3 && a2 == 32 && !a4)
    {
      if (*(_DWORD *)(a3 + 8) && *(_QWORD *)a3)
      {
        v8 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a1 + 6568);
        if (v8)
        {
          v9 = *(_QWORD *)(a1 + 6576);
          sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"ChipScopeLoggingNtfHandler :pGenericNtfCb[Chip Scope Dbg Ntf]");
          v8(*(_QWORD *)(a1 + 19360), v9, 134, a3);
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"PropChipScopeLoggingNtfHandler: Received Len is zero");
      }
    }
    else
    {
      sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"PropChipScopeLoggingNtfHandler: Failed status");
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropChipScopeLoggingNtfHandler");
}

uint64_t sub_2198F0414(uint64_t a1, int a2, uint64_t a3, int a4)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropSmbLoggingNtfHandler");
  if (a1)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = *((_QWORD *)&unk_253E46700 + 14 * v9 + 2);
      if ((v8 & 1) != 0)
        break;
      v8 = 1;
      v9 = 1;
    }
    while (v10 != a1);
    if (v10 == a1)
    {
      if (a3 && a2 == 42 && !a4)
      {
        if (*(_DWORD *)(a3 + 8) && *(_QWORD *)a3)
        {
          v11 = *(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(a1 + 6568);
          if (v11)
          {
            v12 = *(_QWORD *)(a1 + 6576);
            sub_219853E34(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_PropSmbLoggingNtfHandler :pGenericNtfCb[Smb Logging Ntf]");
            v11(*(_QWORD *)(a1 + 19360), v12, 142, a3);
          }
        }
        else
        {
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 2u, (uint64_t)"phLibNfc_PropSmbLoggingNtfHandler: Received Len is zero");
        }
      }
      else
      {
        sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_PropSmbLoggingNtfHandler: Failed status");
      }
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_PropSmbLoggingNtfHandler");
}

uint64_t sub_2198F0560(uint64_t a1)
{
  uint64_t v2;
  _OWORD v4[9];
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v5 = 0;
  memset(v4, 0, sizeof(v4));
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertRegCmd");
  if (a1)
  {
    BYTE8(v4[0]) = 39;
    *(_QWORD *)&v4[0] = 0xA01CA01BA01AA004;
    v2 = sub_2198FD738(*(_QWORD *)(a1 + 3040), (uint64_t)v4, 9, (uint64_t)sub_219865DD0, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetAssertRegCmd: Invalid Libnfc Context");
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertRegCmd");
  return v2;
}

uint64_t sub_2198F0664(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  unsigned int *v6;
  const char *v7;
  int v8;
  uint64_t v10;
  uint64_t v11;
  _OWORD v12[6];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0;
  v11 = 0;
  memset(v12, 0, sizeof(v12));
  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertRegRsp");
  if (!a1)
  {
    v7 = "phLibNfc_ClrRetAssertDataCb:Context is Null";
    v8 = 2;
    v6 = 0;
LABEL_10:
    sub_219850628(v8, v6, 4u, 1u, (uint64_t)v7);
    a2 = 255;
    goto LABEL_11;
  }
  if (!(_DWORD)a2)
  {
    if (!a3 || !*(_QWORD *)(a1 + 8))
    {
      v6 = (unsigned int *)(a1 + 19368);
      v7 = "phLibNfc_ClrRetAssertDataCb:User Buffer is Null";
      goto LABEL_9;
    }
    if (sub_2198EF464(a1, a3, (_DWORD *)&v11 + 1, &v11, (_DWORD *)&v10 + 1, &v10))
    {
      v6 = (unsigned int *)(a1 + 19368);
      v7 = "phLibNfc_ClrRetAssertDataCb:Parsing Assertion Data Failed";
LABEL_9:
      v8 = 1;
      goto LABEL_10;
    }
    if (HIDWORD(v11))
    {
      phOsalNfc_MemCopy();
      sub_219851888(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"Assert Reg Program Counter");
    }
    if ((_DWORD)v11)
    {
      phOsalNfc_SetMemory();
      phOsalNfc_MemCopy();
      sub_21987ACB4(a1, *(_QWORD *)(a1 + 8) + 4, (uint64_t)v12);
    }
    if (HIDWORD(v10))
    {
      phOsalNfc_SetMemory();
      phOsalNfc_MemCopy();
      sub_21987B550(a1, *(_QWORD *)(a1 + 8) + 144, (uint64_t)v12);
    }
    a2 = v10;
    if ((_DWORD)v10)
    {
      phOsalNfc_SetMemory();
      phOsalNfc_MemCopy();
      sub_21987B2A8(*(_DWORD *)(a1 + 19368), *(_QWORD *)(a1 + 8) + 100, (uint64_t)v12);
      a2 = 0;
    }
  }
LABEL_11:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertRegRsp");
  return a2;
}

uint64_t sub_2198F0910(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertDbgLogCmd");
  if (!a1 || a2)
  {
    v5 = 1;
    sub_219850628(2, (unsigned int *)a1, 4u, 1u, (uint64_t)"Invalid parameter, Libnfc Context is Invalid");
  }
  else if (*(_BYTE *)(a1 + 2936) == 1)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4)
    {
      *(_QWORD *)(v4 + 176) = 0;
      *(_DWORD *)(v4 + 184) = 0;
    }
    v5 = 0;
    *(_QWORD *)(a1 + 288) = 0;
    *(_DWORD *)(a1 + 296) = 0;
  }
  else
  {
    v5 = sub_219901828(*(_QWORD *)(a1 + 3040), 3, (uint64_t)sub_219865DD0, a1);
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertDbgLogCmd");
  return v5;
}

uint64_t sub_2198F09E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t Memory;
  int v8;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertDbgLogApiProc");
  if (a1)
  {
    v6 = *(_QWORD *)(a1 + 8);
    if (v6 && (*(_QWORD *)(v6 + 176) = 0, *(_DWORD *)(v6 + 184) = 0, !(_DWORD)a2) && a3)
    {
      if (*(_QWORD *)(a3 + 8) && *(_WORD *)(a3 + 2))
      {
        Memory = phOsalNfc_GetMemory();
        *(_QWORD *)(a1 + 288) = Memory;
        if (!Memory)
        {
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: Failed to allocate memory");
          a2 = 12;
          goto LABEL_12;
        }
        phOsalNfc_SetMemory();
        phOsalNfc_MemCopy();
        v8 = *(unsigned __int16 *)(a3 + 2);
        *(_DWORD *)(a1 + 296) = v8;
        *(_QWORD *)(v6 + 176) = *(_QWORD *)(a1 + 288);
        *(_DWORD *)(v6 + 184) = v8;
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: Operation success");
      }
      a2 = 0;
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: operation failed");
    }
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: Libnfc Context is Invalid");
    a2 = 255;
  }
LABEL_12:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertDbgLogApiProc");
  return a2;
}

uint64_t sub_2198F0B54(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Memory;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertDbgLogProc");
  if (a1)
  {
    *(_QWORD *)(a1 + 288) = 0;
    *(_DWORD *)(a1 + 296) = 0;
    if ((_DWORD)a2 || !a3)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: operation failed");
    }
    else
    {
      if (*(_QWORD *)(a3 + 8) && *(_WORD *)(a3 + 2))
      {
        Memory = phOsalNfc_GetMemory();
        *(_QWORD *)(a1 + 288) = Memory;
        if (!Memory)
        {
          sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: Failed to allocate memory");
          a2 = 12;
          goto LABEL_11;
        }
        phOsalNfc_SetMemory();
        phOsalNfc_MemCopy();
        *(_DWORD *)(a1 + 296) = *(unsigned __int16 *)(a3 + 2);
        sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 4u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: Operation success");
      }
      a2 = 0;
    }
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetAssertDbgLogProc: Libnfc Context is Invalid");
    a2 = 255;
  }
LABEL_11:
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetAssertDbgLogProc");
  return a2;
}

uint64_t sub_2198F0CB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetClrAssertComplete");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 19368), 4u, 1u, (uint64_t)"phLibNfc_GetClrAssertComplete: Failed");
      v4 = 146;
    }
    else
    {
      v4 = 145;
    }
    v5 = sub_2198D1B2C(*(_QWORD *)(a1 + 19360), v4, a2, a1 + 8, 0);
    if (*(_QWORD *)(a1 + 288))
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 288) = 0;
      *(_DWORD *)(a1 + 296) = 0;
    }
  }
  else
  {
    sub_219850628(2, 0, 4u, 1u, (uint64_t)"phLibNfc_GetClrAssertComplete: Invalid LibNfc Ctx");
    v5 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 4u, 5u, (uint64_t)"phLibNfc_GetClrAssertComplete");
  return v5;
}

uint64_t sub_2198F0DA8(uint64_t a1, uint64_t a2, _BYTE *a3, unsigned int a4)
{
  unsigned int *v8;
  const char *v9;
  uint64_t v10;
  uint64_t Memory;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrMgmtInit");
  if (!a2 || !a1 || !a3)
  {
    sub_219850628(2, (unsigned int *)a1, 3u, 4u, (uint64_t)" Invalid Param(s)..");
    v10 = 1;
    goto LABEL_15;
  }
  if (a4 > 0xA)
  {
    if (*(_QWORD *)(a1 + 4760) || (Memory = phOsalNfc_GetMemory(), (*(_QWORD *)(a1 + 4760) = Memory) != 0))
    {
      phOsalNfc_SetMemory();
      if (!sub_2198F0F2C((unsigned int *)a1, a2, a3, a4))
      {
        *(_QWORD *)(a1 + 4512) = a2;
        if (!sub_219859BD8(a1))
        {
          v10 = 0;
          goto LABEL_15;
        }
      }
      goto LABEL_12;
    }
    v8 = (unsigned int *)(a1 + 6476);
    v9 = " DataXchg SequenceHandler pointer MemAlloc Failed..";
  }
  else
  {
    v8 = (unsigned int *)(a1 + 6476);
    v9 = " Intf Actvd Payload Incomplete..";
  }
  sub_219850628(1, v8, 3u, 4u, (uint64_t)v9);
LABEL_12:
  if (*(_QWORD *)(a1 + 4760))
  {
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)" Freeing RdrDataXchgSeq Mem..");
    phOsalNfc_FreeMemory();
    *(_QWORD *)(a1 + 4760) = 0;
  }
  v10 = 188;
LABEL_15:
  sub_2198830EC((unsigned int *)a1, a2);
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrMgmtInit");
  return v10;
}

uint64_t sub_2198F0F2C(unsigned int *a1, uint64_t a2, _BYTE *a3, int a4)
{
  int v8;
  int v9;
  uint64_t v10;
  unsigned __int8 *v11;
  uint64_t v12;
  uint64_t v13;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateRemDevInfo");
  if (a1 && a2 && a3 && a4)
  {
    *(_BYTE *)(a2 + 8) = *a3;
    v8 = a3[1];
    *(_DWORD *)(a2 + 12) = v8;
    if (v8)
    {
      *(_DWORD *)(a2 + 16) = a3[2];
      v9 = a3[3];
      *(_DWORD *)(a2 + 20) = v9;
      *(_BYTE *)(a2 + 24) = a3[4];
      *(_BYTE *)(a2 + 25) = a3[5];
      v10 = a3[6];
      *(_BYTE *)(a2 + 26) = v10;
      v11 = &a3[v10];
      *(_DWORD *)(a2 + 28) = v11[7];
      *(_BYTE *)(a2 + 32) = v11[8];
      *(_BYTE *)(a2 + 33) = v11[9];
      switch(v9)
      {
        case 0:
        case 3:
        case 10:
        case 11:
        case 12:
          v12 = sub_219861FB4((uint64_t)a1, a2, (uint64_t)a3, a4);
          goto LABEL_16;
        case 1:
          v12 = sub_219885AC0((uint64_t)a1, a2, a3, a4);
          goto LABEL_16;
        case 2:
        case 5:
          v12 = sub_21988A374((uint64_t)a1, a2, (uint64_t)a3, a4);
          goto LABEL_16;
        case 4:
        case 7:
        case 8:
        case 9:
          goto LABEL_13;
        case 6:
          v12 = sub_21988FC40((uint64_t)a1, a2, a3, a4);
          goto LABEL_16;
        default:
          if (v9 == 112)
          {
            v12 = sub_21986248C(a1, a2, (uint64_t)a3, a4);
LABEL_16:
            v13 = v12;
          }
          else
          {
LABEL_13:
            sub_219850628(1, a1 + 1619, 3u, 1u, (uint64_t)"Rf Technology and mode not supported");
            v13 = 255;
          }
          break;
      }
    }
    else
    {
      sub_219850628(1, a1 + 1619, 3u, 2u, (uint64_t)"Interface is NFCEE Direct RF,subsequent payload contents ignored..");
      v13 = 0;
    }
  }
  else
  {
    v13 = 1;
    sub_219850628(2, a1, 3u, 1u, (uint64_t)" Invalid Param(s)..");
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateRemDevInfo");
  return v13;
}

uint64_t sub_2198F1114(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int *v10;
  const char *v11;
  uint64_t v12;
  unsigned int *v13;
  const char *v14;
  _QWORD *v16;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrMgmtXchgData");
  if (a1)
  {
    if (!a2)
    {
      v10 = (unsigned int *)(a1 + 6476);
      v11 = " Invalid Device Handle Param..";
      goto LABEL_17;
    }
    if (*(_QWORD *)(a3 + 16) && *(_DWORD *)(a3 + 24))
    {
      if (*(_QWORD *)(a3 + 32) && *(_DWORD *)(a3 + 40) || *(_DWORD *)a3 == 4)
      {
        if (a4 && a5)
        {
          if (*(_QWORD *)(a1 + 4512) != a2)
          {
            v10 = (unsigned int *)(a1 + 6476);
            v11 = " Device Handle not Valid..";
LABEL_17:
            sub_219850628(1, v10, 3u, 4u, (uint64_t)v11);
            v12 = 6;
            goto LABEL_18;
          }
          v16 = *(_QWORD **)(a1 + 4760);
          if (!v16)
          {
            v12 = 255;
            goto LABEL_18;
          }
          *(_DWORD *)(a1 + 4520) = *(_DWORD *)a3;
          *(_WORD *)(a1 + 4524) = *(_WORD *)(a3 + 4);
          *(_OWORD *)(a1 + 4536) = *(_OWORD *)(a3 + 16);
          *(_OWORD *)(a1 + 4552) = *(_OWORD *)(a3 + 32);
          *(_DWORD *)(a1 + 4526) = *(_DWORD *)(a3 + 6);
          *(_BYTE *)(a1 + 4568) = *(_BYTE *)(a3 + 48);
          *(_QWORD *)(a1 + 4576) = a4;
          *(_QWORD *)(a1 + 4584) = a5;
          *(_QWORD *)(a1 + 3736) = v16;
          *(_BYTE *)(a1 + 3936) = 0;
          *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, v16);
          v12 = sub_2198F135C(a1, 0, 0);
          sub_219851888(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"RdrDataXchgSeq status received is..");
          if ((_DWORD)v12 == 13)
          {
            *(_BYTE *)(a1 + 6435) = 1;
            goto LABEL_18;
          }
          v14 = "Data Exchange Request Failed..";
          v13 = (unsigned int *)(a1 + 6476);
          goto LABEL_15;
        }
        v13 = (unsigned int *)(a1 + 6476);
        v14 = "Invalid Upper layer inputs..";
      }
      else
      {
        v13 = (unsigned int *)(a1 + 6476);
        v14 = " Invalid Recv Buff Params..";
      }
    }
    else
    {
      v13 = (unsigned int *)(a1 + 6476);
      v14 = " Invalid Send Buff Params..";
    }
    v12 = 1;
LABEL_15:
    sub_219850628(1, v13, 3u, 4u, (uint64_t)v14);
    goto LABEL_18;
  }
  sub_219850628(2, 0, 3u, 4u, (uint64_t)" Invalid Context Param..");
  v12 = 1;
LABEL_18:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrMgmtXchgData");
  return v12;
}

uint64_t sub_2198F135C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrDataXchgSequence");
  if (a1 && a2)
  {
    *(_QWORD *)(a1 + 3760) = *(_QWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 3768) = *(_DWORD *)(a2 + 16);
  }
  v6 = sub_21987CC04(a1, a3);
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrDataXchgSequence");
  return v6;
}

uint64_t sub_2198F13EC(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrMgmtRelease");
  if (a1)
  {
    if (*(_QWORD *)(a1 + 4760))
    {
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)" Freeing RdrDataXchgSeq Mem..");
      phOsalNfc_FreeMemory();
      v2 = 0;
      *(_QWORD *)(a1 + 4760) = 0;
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 4u, (uint64_t)" Invalid Context Param..");
    v2 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RdrMgmtRelease");
  return v2;
}

uint64_t sub_2198F14B0(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteDataXchgSequence");
  if (a1)
  {
    *(_DWORD *)(a1 + 6616) = 0;
    *(_BYTE *)(a1 + 6612) = 0;
    *(_BYTE *)(a1 + 4736) = 0;
    if (*(_QWORD *)(a1 + 4576))
    {
      sub_219851888(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Status received is...");
      if (!(_DWORD)a2)
        goto LABEL_7;
      if (*(_QWORD *)(a1 + 4600))
      {
        phOsalNfc_FreeMemory();
        *(_QWORD *)(a1 + 4600) = 0;
        *(_DWORD *)(a1 + 4608) = 0;
      }
      if ((_DWORD)a2 != 185)
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Resetting received length to 0 for this Failed Scenario!!");
        *(_DWORD *)(a1 + 4560) = 0;
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Invoking upper layer call back function");
        if ((_DWORD)a2 == 44 && *(_BYTE *)(a1 + 4568) == 1)
          *(_BYTE *)(a1 + 6449) = 1;
      }
      else
      {
LABEL_7:
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Invoking upper layer call back function");
      }
      (*(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 4576))(*(_QWORD *)(a1 + 4584), a2, a1 + 4552);
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)" Invalid Caller Param(s)..");
      a2 = 255;
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 4u, (uint64_t)" Invalid Context Param..");
    a2 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteDataXchgSequence");
  return a2;
}

uint64_t sub_2198F1654(uint64_t a1, _WORD *a2)
{
  char v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ChkDataRetransmission");
  if (a1 && a2)
  {
    if (*(_BYTE *)(a1 + 6612) == 1
      && *a2 == 181
      && *(_DWORD *)(a1 + 6616) <= 3u
      && (sub_219851790(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"phNciNfc_ChkDataRetransmission: Re-transmitting Data pkt Attempt.."), (v4 = *(_BYTE *)(a1 + 3936)) != 0))
    {
      v5 = 0;
      *a2 = 0;
      *(_WORD *)(a1 + 4526) = *(_DWORD *)(a1 + 6620);
      *(_BYTE *)(a1 + 3936) = v4 - 1;
      ++*(_DWORD *)(a1 + 6616);
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 1;
    sub_219850628(2, (unsigned int *)a1, 3u, 1u, (uint64_t)" phNciNfc_ChkDataRetransmission: Invalid Nci Context or status parm");
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ChkDataRetransmission");
  return v5;
}

uint64_t sub_2198F1764(uint64_t a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TrigRfOnPropCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 0xF00000001;
    DWORD2(v4) = 40;
    *(_QWORD *)&v5 = *(_QWORD *)(a1 + 848);
    DWORD2(v5) = 1;
    v2 = sub_2198F2D0C(a1 + 888, (uint64_t)&v4, a1 + 3760, 2000, (uint64_t)sub_21985A05C, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Invalid input parameter");
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TrigRfOnPropCmd");
  return v2;
}

uint64_t sub_2198F1850(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  const char *v5;
  int v6;
  unsigned int *v8;
  const char *v9;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TrigRfOnPropCmdRsp");
  if (!a1)
  {
    v5 = "Trigger RF Feild On Ntf Invalid Parameter";
    a2 = 1;
    v6 = 2;
    v4 = 0;
LABEL_6:
    sub_219850628(v6, v4, 3u, 1u, (uint64_t)v5);
    goto LABEL_7;
  }
  if ((_DWORD)a2)
  {
    v4 = (unsigned int *)(a1 + 6476);
    v5 = "Trigger RF Feild On Ntf resposne received with failure status";
LABEL_4:
    v6 = 1;
    goto LABEL_6;
  }
  if (*(_DWORD *)(a1 + 3768) == 1)
  {
    a2 = 147;
    switch(**(_BYTE **)(a1 + 3760))
    {
      case 0:
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Trigger RF Feild On Ntf command accepted by NFCC");
        a2 = 0;
        break;
      case 1:
        v4 = (unsigned int *)(a1 + 6476);
        v5 = "Trigger RF Feild On Ntf command rejected by NFCC";
        goto LABEL_4;
      case 3:
        v8 = (unsigned int *)(a1 + 6476);
        v9 = "Trigger RF Feild On Ntf command failed by NFCC";
        goto LABEL_12;
      case 6:
        break;
      default:
        goto LABEL_13;
    }
  }
  else
  {
    v8 = (unsigned int *)(a1 + 6476);
    v9 = "Trigger RF Feild On Ntf response received with invalid payload length";
LABEL_12:
    sub_219850628(1, v8, 3u, 1u, (uint64_t)v9);
LABEL_13:
    a2 = 255;
  }
LABEL_7:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TrigRfOnPropCmdRsp");
  return a2;
}

uint64_t sub_2198F199C(uint64_t a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TurnRfOnOffPropCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 0xF00000001;
    DWORD2(v4) = 51;
    *(_QWORD *)&v5 = *(_QWORD *)(a1 + 848);
    DWORD2(v5) = *(_DWORD *)(a1 + 856);
    v2 = sub_2198F2D0C(a1 + 888, (uint64_t)&v4, a1 + 3760, 2000, (uint64_t)sub_21985A05C, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Invalid input parameter");
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TurnRfOnOffPropCmd");
  return v2;
}

uint64_t sub_2198F1A88(uint64_t a1, uint64_t a2)
{
  const char *v4;
  int v5;
  unsigned int *v6;
  int v7;
  unsigned int *v9;
  const char *v10;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TurnRfOnOffPropCmdRsp");
  if (!a1)
  {
    v4 = "Turn RF ON or OFF command Invalid Parameter";
    v5 = 2;
    v6 = 0;
    goto LABEL_11;
  }
  if (!(_DWORD)a2)
  {
    if (*(_DWORD *)(a1 + 3768) == 1)
    {
      v7 = **(unsigned __int8 **)(a1 + 3760);
      if (v7 == 6)
      {
        v9 = (unsigned int *)(a1 + 6476);
        v10 = "Turn RF ON or OFF command Symantic Error";
      }
      else
      {
        if (v7 != 1)
        {
          if (!**(_BYTE **)(a1 + 3760))
          {
            sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Turn RF ON or OFF command accepted by NFCC");
            a2 = 0;
            goto LABEL_13;
          }
LABEL_12:
          a2 = 255;
          goto LABEL_13;
        }
        v9 = (unsigned int *)(a1 + 6476);
        v10 = "Turn RF ON or OFF command rejected by NFCC";
      }
      sub_219850628(1, v9, 3u, 1u, (uint64_t)v10);
      a2 = 147;
      goto LABEL_13;
    }
    v6 = (unsigned int *)(a1 + 6476);
    v4 = "Turn RF ON or OFF response received with invalid payload length";
    v5 = 1;
LABEL_11:
    sub_219850628(v5, v6, 3u, 1u, (uint64_t)v4);
    goto LABEL_12;
  }
  sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Turn RF ON or OFF resposne received with failure status");
LABEL_13:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TurnRfOnOffPropCmdRsp");
  return a2;
}

uint64_t sub_2198F1BD4(uint64_t a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestPropCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 0xF00000001;
    DWORD2(v4) = 50;
    *(_QWORD *)&v5 = a1 + 3688;
    DWORD2(v5) = *(unsigned __int8 *)(a1 + 3698);
    v2 = sub_2198F2D0C(a1 + 888, (uint64_t)&v4, a1 + 3760, 2000, (uint64_t)sub_21985A05C, a1);
  }
  else
  {
    v2 = 1;
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Invalid input parameter");
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestPropCmd");
  return v2;
}

uint64_t sub_2198F1CC0(unsigned int *a1, uint64_t a2)
{
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestPropRsp");
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestPropRsp");
  return a2;
}

uint64_t sub_2198F1D24(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestPropSeqComplete");
  if (a1)
  {
    *(_BYTE *)(a1 + 3698) = 0;
    sub_2198E23C4(a1, a2, a1 + 3760);
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestPropSeqComplete");
  return a2;
}

uint64_t sub_2198F1D98(unsigned int *a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 0xF00000001;
    DWORD2(v4) = 17;
    *(_QWORD *)&v5 = 0;
    DWORD2(v5) = 0;
    v2 = sub_2198F2D0C((uint64_t)(a1 + 222), (uint64_t)&v4, (uint64_t)(a1 + 940), 2000, (uint64_t)sub_2198F28C4, (uint64_t)a1);
  }
  else
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    v2 = 1;
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnCmd");
  return v2;
}

uint64_t sub_2198F1E7C(uint64_t a1, uint64_t a2)
{
  int v4;
  unsigned int *v5;
  const char *v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnRsp");
  if (!a1)
  {
    a2 = 1;
    goto LABEL_14;
  }
  if (!(_DWORD)a2)
  {
    if (*(_DWORD *)(a1 + 3768) == 1)
    {
      v4 = **(unsigned __int8 **)(a1 + 3760);
      if (v4 != 6)
      {
        if (v4 == 1)
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Presence check extension command rejected by NFCC");
          a2 = 147;
          goto LABEL_14;
        }
        if (!**(_BYTE **)(a1 + 3760))
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Presence check extension command accepted by NFCC");
          a2 = 0;
          goto LABEL_14;
        }
LABEL_13:
        a2 = 255;
        goto LABEL_14;
      }
      v5 = (unsigned int *)(a1 + 6476);
      v6 = "Presence check extension semantic error received";
    }
    else
    {
      v5 = (unsigned int *)(a1 + 6476);
      v6 = "Presence check extension response received with invalid payload length";
    }
    sub_219850628(1, v5, 3u, 2u, (uint64_t)v6);
    goto LABEL_13;
  }
  sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Presence check extension response received with failure status");
LABEL_14:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnRsp");
  return a2;
}

uint64_t sub_2198F1FBC(uint64_t a1, uint64_t a2)
{
  int v4;
  unsigned int *v5;
  uint64_t v6;
  unsigned int *v7;
  const char *v8;
  uint64_t v10;
  int v11;
  double v12;
  __int16 v13;
  const char *v14;
  double v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v18 = 0;
  v19 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteChkPresExtnSeq");
  if (a1)
  {
    if (!(_DWORD)a2)
    {
      v18 = 0xF00000003;
      LODWORD(v19) = 17;
      v4 = sub_2198F2F98((unsigned int *)(a1 + 888), (uint64_t)&v18, (uint64_t)sub_2198F2954, a1);
      switch(v4)
      {
        case 255:
          v7 = (unsigned int *)(a1 + 6476);
          v8 = "Check presence extension notification registration failed!";
          break;
        case 53:
          v7 = (unsigned int *)(a1 + 6476);
          v8 = "Check presence extension notification already registered";
          break;
        case 0:
          v5 = (unsigned int *)(a1 + 6476);
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Check presence extension notification registered");
          v6 = *(_QWORD *)(a1 + 4656);
          if (v6 == 0xFFFFFFFFFFFFLL)
          {
            sub_219850628(1, v5, 3u, 1u, (uint64_t)"Timer Create had failed\n#\n");
LABEL_33:
            sub_219850628(1, v5, 3u, 4u, (uint64_t)"Waiting for Check presence extension notification...");
            a2 = 0;
            goto LABEL_13;
          }
          v10 = *(_QWORD *)(a1 + 4512);
          if (v10)
          {
            v11 = *(_DWORD *)(v10 + 4);
            if ((v11 - 5) < 3)
              goto LABEL_18;
            if (v11 == 16)
            {
              v15 = (double)(1 << (*(_BYTE *)(v10 + 109) >> 4)) * 302.064897 / 1000.0;
              if ((int)v15 >= 0x54)
                v16 = 19796;
              else
                v16 = 236 * (int)v15;
              if ((v16 & 0xFFF0u) > 0x7CF)
                goto LABEL_30;
LABEL_28:
              v14 = "FWT timeout is less than default, hence using default timeout: ";
              goto LABEL_29;
            }
            if (v11 == 3)
            {
LABEL_18:
              v12 = (double)(1 << (*(_BYTE *)(v10 + 108) >> 4)) * 302.064897 / 1000.0;
              if ((int)v12 >= 0x54)
                v13 = 19796;
              else
                v13 = 236 * (int)v12;
              if ((v13 & 0xFFF0u) >= 0x7D0)
                goto LABEL_30;
              goto LABEL_28;
            }
          }
          v14 = "Using default timeout: ";
LABEL_29:
          sub_219851790(1, v5, 3u, 4u, (uint64_t)v14);
          v6 = *(_QWORD *)(a1 + 4656);
LABEL_30:
          sub_21988C4AC(*(_DWORD *)(a1 + 6476), v6);
          *(_BYTE *)(a1 + 6464) = 0;
          v17 = phOsalNfc_Timer_Start();
          if (!(_DWORD)v17)
          {
            sub_21988629C(1, v5, *(_QWORD *)(a1 + 4656), 3u, 4u, (uint64_t)"phNciNfc_CompleteChkPresExtnSeq");
            *(_QWORD *)(a1 + 816) = *(_QWORD *)(a1 + 3384);
            *(_QWORD *)(a1 + 824) = *(_QWORD *)(a1 + 3712);
            *(_QWORD *)(a1 + 3384) = 0;
            sub_219850628(1, v5, 3u, 4u, (uint64_t)"Chk Pres ntf timer started\n");
            goto LABEL_33;
          }
          a2 = v17;
          sub_219850628(1, v5, 3u, 1u, (uint64_t)"Chk Pres ntf timer start FAILED\n\n");
          goto LABEL_12;
        default:
          v7 = (unsigned int *)(a1 + 6476);
          v8 = "Invalid parameter sent";
          break;
      }
      sub_219850628(1, v7, 3u, 4u, (uint64_t)v8);
      a2 = 255;
    }
LABEL_12:
    sub_2198E23C4(a1, a2, 0);
  }
LABEL_13:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteChkPresExtnSeq");
  return a2;
}

uint64_t sub_2198F2300(unsigned int *a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_EnableExtnCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 0xF00000001;
    DWORD2(v4) = 2;
    *(_QWORD *)&v5 = 0;
    DWORD2(v5) = 0;
    v2 = sub_2198F2D0C((uint64_t)(a1 + 222), (uint64_t)&v4, (uint64_t)(a1 + 940), 2000, (uint64_t)sub_21985A05C, (uint64_t)a1);
  }
  else
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    v2 = 1;
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_EnableExtnCmd");
  return v2;
}

uint64_t sub_2198F23E4(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  const char *v5;
  int v6;
  unsigned int *v7;
  const char *v8;
  const char *v10;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_EnableExtnRsp");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      v4 = (unsigned int *)(a1 + 6476);
      v5 = "Iso-Dep presence check resposne received with failure status";
LABEL_4:
      sub_219850628(1, v4, 3u, 2u, (uint64_t)v5);
    }
    else
    {
      v6 = *(_DWORD *)(a1 + 3768);
      if (v6 == 1)
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Enabling extension failed!");
        a2 = 255;
        switch(**(_BYTE **)(a1 + 3760))
        {
          case 0:
            v5 = "Information field missing in Response Payload field";
            goto LABEL_21;
          case 1:
            v10 = "Enabling extension command rejected by NFCC";
            goto LABEL_23;
          case 3:
            v5 = "Enabling extension command failed by NFCC";
            goto LABEL_21;
          case 5:
            v5 = "Enabling extension command Syntax error received";
LABEL_21:
            v4 = (unsigned int *)(a1 + 6476);
            goto LABEL_4;
          case 6:
            v10 = "Enabling extension command Semantic error received";
LABEL_23:
            sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)v10);
            a2 = 147;
            goto LABEL_15;
          default:
            goto LABEL_15;
        }
      }
      if (v6 == 5)
      {
        a2 = 147;
        switch(**(_BYTE **)(a1 + 3760))
        {
          case 0:
            sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Enabling extension command accepted by NFCC");
            a2 = 0;
            break;
          case 1:
            v4 = (unsigned int *)(a1 + 6476);
            v5 = "Enabling extension command rejected by NFCC";
            goto LABEL_4;
          case 3:
            v7 = (unsigned int *)(a1 + 6476);
            v8 = "Enabling extension command failed by NFCC";
            goto LABEL_13;
          case 6:
            break;
          default:
            goto LABEL_14;
        }
      }
      else
      {
        v7 = (unsigned int *)(a1 + 6476);
        v8 = "Enabling extension response received with invalid payload length";
LABEL_13:
        sub_219850628(1, v7, 3u, 2u, (uint64_t)v8);
LABEL_14:
        a2 = 255;
      }
    }
  }
  else
  {
    a2 = 1;
  }
LABEL_15:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_EnableExtnRsp");
  return a2;
}

uint64_t sub_2198F25DC(uint64_t a1, uint64_t a2)
{
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteEnableExtnSeq");
  if (a1)
  {
    v4 = (_BYTE *)(a1 + 6664);
    *(_BYTE *)(a1 + 6664) = -1;
    if ((_DWORD)a2 == 44)
    {
      *v4 = 44;
      v5 = a1;
      v6 = 0;
    }
    else
    {
      v4 = *(_BYTE **)(a1 + 3760);
      v5 = a1;
      v6 = a2;
    }
    sub_2198E23C4(v5, v6, (uint64_t)v4);
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteEnableExtnSeq");
  return a2;
}

uint64_t sub_2198F2678(unsigned int *a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_FlushDataCmd");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 0xF00000001;
    DWORD2(v4) = 33;
    *(_QWORD *)&v5 = 0;
    DWORD2(v5) = 0;
    v2 = sub_2198F2D0C((uint64_t)(a1 + 222), (uint64_t)&v4, (uint64_t)(a1 + 940), 2000, (uint64_t)sub_21985A05C, (uint64_t)a1);
  }
  else
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    v2 = 1;
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_FlushDataCmd");
  return v2;
}

uint64_t sub_2198F275C(uint64_t a1, uint64_t a2)
{
  unsigned int *v4;
  const char *v5;
  unsigned int *v6;
  const char *v7;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_FlushDataRsp");
  if (a1)
  {
    if ((_DWORD)a2)
    {
      v4 = (unsigned int *)(a1 + 6476);
      v5 = "Flush Data resposne received with failure status";
LABEL_4:
      sub_219850628(1, v4, 3u, 2u, (uint64_t)v5);
    }
    else if (*(_DWORD *)(a1 + 3768) == 1)
    {
      a2 = 0;
      switch(**(_BYTE **)(a1 + 3760))
      {
        case 0:
          break;
        case 1:
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Flush Data command rejected by NFCC");
          a2 = 147;
          break;
        case 6:
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Flush Data command Semantic error received");
          a2 = 0;
          break;
        case 9:
          v4 = (unsigned int *)(a1 + 6476);
          v5 = "Flush Data response Invalid parameter received";
          a2 = 1;
          goto LABEL_4;
        default:
          v6 = (unsigned int *)(a1 + 6476);
          v7 = "Flush Data failed!";
          goto LABEL_10;
      }
    }
    else
    {
      v6 = (unsigned int *)(a1 + 6476);
      v7 = "Flush Data response received with invalid payload length";
LABEL_10:
      sub_219850628(1, v6, 3u, 2u, (uint64_t)v7);
      a2 = 255;
    }
  }
  else
  {
    a2 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_FlushDataRsp");
  return a2;
}

uint64_t sub_2198F28C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_IsoDepPresChkSequence");
  if (a1 && a2)
  {
    *(_QWORD *)(a1 + 3760) = *(_QWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 3768) = *(_DWORD *)(a2 + 16);
  }
  v6 = sub_21987CC04(a1, a3);
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_IsoDepPresChkSequence");
  return v6;
}

uint64_t sub_2198F2954(uint64_t a1, uint64_t a2, uint64_t a3)
{
  const char *v6;
  int v7;
  const char *v8;
  void (*v9)(_QWORD, uint64_t, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)();

  v11 = 0;
  v12 = 0;
  v13 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnNtfCb");
  if (!a1 || !a2)
  {
    sub_219850628(2, (unsigned int *)a1, 3u, 1u, (uint64_t)"Proc pres chk : Invalid input parameters");
    goto LABEL_24;
  }
  if ((_DWORD)a3)
  {
    v6 = "Proc Iso-Dep pres chk ntf: Receiption failed";
  }
  else
  {
    phOsalNfc_Timer_Stop();
    *(_BYTE *)(a1 + 6464) = 0;
    sub_21988629C(1, (unsigned int *)(a1 + 6476), *(_QWORD *)(a1 + 4656), 3u, 4u, (uint64_t)"phNciNfc_ChkPresExtnNtfCb");
    if (*(_DWORD *)(a2 + 16) == 1)
    {
      if (**(_BYTE **)(a2 + 8) == 1)
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Target is still in the fied");
        a3 = 0;
        goto LABEL_14;
      }
      if (!**(_BYTE **)(a2 + 8))
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Target is not in the fied: Target Lost!");
        a3 = 146;
        goto LABEL_14;
      }
      v6 = "ChkPresence Extn: invalid ntf";
    }
    else
    {
      v6 = "Proc Iso-Dep pres chk ntf: Invalid length of payload";
    }
  }
  sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)v6);
  a3 = 255;
LABEL_14:
  *(_WORD *)((char *)&v11 + 1) = 4367;
  v12 = a1;
  v13 = sub_2198F2954;
  v7 = sub_219860F20(a1 + 888, (uint64_t)&v11, 3);
  switch(v7)
  {
    case 255:
      v8 = "De-register pres chk extension ntf call back failed!";
      break;
    case 52:
      v8 = "Pres chk extension ntf call back not registered!";
      break;
    case 0:
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"De-register pres chk extension ntf call back success");
      goto LABEL_22;
    default:
      v8 = "Invalid parameter passed (phNciNfc_ChkPresExtnNtfCb)!";
      break;
  }
  sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)v8);
LABEL_22:
  v9 = *(void (**)(_QWORD, uint64_t, _QWORD))(a1 + 816);
  if (v9)
  {
    *(_QWORD *)(a1 + 816) = 0;
    v9(*(_QWORD *)(a1 + 824), a3, 0);
  }
LABEL_24:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnNtfCb");
  return a3;
}

uint64_t sub_2198F2B88(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _QWORD v9[3];

  memset(v9, 0, sizeof(v9));
  result = sub_219850718(2, (unsigned int *)a2, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnNtfTimeoutHandler");
  if (a2)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = *((_QWORD *)&unk_253E46700 + 14 * v6 + 4);
      if ((v5 & 1) != 0)
        break;
      v5 = 1;
      v6 = 1;
    }
    while (v7 != a2);
    if (v7 == a2)
    {
      v8 = (_BYTE *)(a2 + 6464);
      if (!*(_BYTE *)(a2 + 6464))
      {
        sub_21988C4AC(*(_DWORD *)(a2 + 6476), *(_QWORD *)(a2 + 4656));
        if (!phOsalNfc_Timer_Start())
        {
          result = sub_219850628(1, (unsigned int *)(a2 + 6476), 3u, 4u, (uint64_t)"Chk Pres ntf timer restarted for extended time\n");
          *v8 = 1;
          return result;
        }
        sub_219850628(1, (unsigned int *)(a2 + 6476), 3u, 1u, (uint64_t)"Chk Pres ntf timer failed to start for extended time\n\n");
      }
      sub_21988629C(2, (unsigned int *)a2, a1, 3u, 4u, (uint64_t)"phNciNfc_ChkPresExtnNtfTimeoutHandler");
      phOsalNfc_Timer_Stop();
      *v8 = 0;
      sub_2198F2954(a2, (uint64_t)v9, 255);
      return sub_219850808(2, (unsigned int *)a2, 3u, 5u, (uint64_t)"phNciNfc_ChkPresExtnNtfTimeoutHandler");
    }
  }
  return result;
}

uint64_t sub_2198F2D0C(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v12;
  unsigned int v13;
  _OWORD v15[10];
  __int128 v16;
  uint64_t v17;

  v17 = 0;
  v16 = 0u;
  memset(v15, 0, sizeof(v15));
  sub_219850718(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfTxRx");
  v12 = 0;
  if (a1 && a2 && a3 && a5)
  {
    BYTE14(v16) = 0;
    LODWORD(v17) = a4;
    if (*(_DWORD *)a2 == 1)
    {
      *(_BYTE *)(a1 + 616) = 0;
      *(_BYTE *)(a2 + 12) = 0;
      v13 = 2;
    }
    else
    {
      v13 = 0;
      *(_DWORD *)(a2 + 4) = 0;
      *(_DWORD *)(a2 + 8) = 0;
    }
    phOsalNfc_MemCopy();
    v12 = sub_21987EC70(*(_QWORD *)a1, v13, (uint64_t)v15, a5, a6);
  }
  sub_219850808(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfTxRx");
  return v12;
}

uint64_t sub_2198F2E28(uint64_t a1, _DWORD *a2, uint64_t a3, uint64_t a4)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  _OWORD v14[10];
  __int128 v15;
  uint64_t v16;

  v16 = 0;
  v15 = 0u;
  memset(v14, 0, sizeof(v14));
  sub_219850718(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfTxOnly");
  if (!a1)
    goto LABEL_6;
  v8 = 0;
  v9 = 0;
  do
  {
    v10 = *((_QWORD *)&unk_253E46700 + 14 * v9 + 5);
    if ((v8 & 1) != 0)
      break;
    v8 = 1;
    v9 = 1;
  }
  while (v10 != a1);
  if (v10 == a1)
  {
    v11 = 1;
    if (a3)
    {
      if (a2)
      {
        v13 = *(_QWORD *)a1;
        if (*(_QWORD *)a1)
        {
          BYTE14(v15) = 1;
          phOsalNfc_MemCopy();
          *(_BYTE *)(a1 + 616) = 0;
          if (*a2 == 1)
          {
            v11 = sub_21987EC70(v13, 2u, (uint64_t)v14, a3, a4);
            *(_BYTE *)(v13 + 5390) = 1;
          }
          else
          {
            *(_QWORD *)((char *)v14 + 4) = 0;
            v11 = sub_21987EC70(v13, 0, (uint64_t)v14, a3, a4);
          }
        }
      }
    }
  }
  else
  {
LABEL_6:
    v11 = 1;
  }
  sub_219850808(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfTxOnly");
  return v11;
}

uint64_t sub_2198F2F98(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  int v9;
  char v10;
  int v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v13 = 0;
  v14 = 0;
  v15 = 0;
  sub_219850718(3, a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfRegRspNtf");
  v8 = 1;
  if (!a1 || !a2 || !a3)
    goto LABEL_12;
  v14 = a4;
  v15 = a3;
  v9 = *(_DWORD *)a2;
  if (*(_DWORD *)a2 == 3)
  {
    v10 = 2;
LABEL_10:
    LOBYTE(v13) = v10;
    v11 = *(_DWORD *)(a2 + 8);
    BYTE1(v13) = *(_DWORD *)(a2 + 4);
    BYTE2(v13) = v11;
    goto LABEL_11;
  }
  if (v9 == 2)
  {
    v10 = 1;
    goto LABEL_10;
  }
  if (!v9)
  {
    LOBYTE(v13) = *(_BYTE *)(a2 + 13);
    BYTE3(v13) = *(_BYTE *)(a2 + 12);
LABEL_11:
    v8 = sub_219860BAC((uint64_t)a1, (uint64_t)&v13, v9);
  }
LABEL_12:
  sub_219850808(3, a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfRegRspNtf");
  return v8;
}

uint64_t sub_2198F3088(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  int v8;
  _QWORD v10[2];
  uint64_t v11;

  v10[0] = 0;
  v10[1] = 0;
  v11 = 0;
  sub_219850718(3, a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfUnRegRspNtf");
  v6 = 1;
  if (a1 && a2)
  {
    v11 = a3;
    v7 = *(_DWORD *)a2;
    if (*(_DWORD *)a2 == 3 || v7 == 2)
    {
      v8 = *(_DWORD *)(a2 + 8);
      BYTE1(v10[0]) = *(_DWORD *)(a2 + 4);
      BYTE2(v10[0]) = v8;
      goto LABEL_8;
    }
    if (!v7)
    {
      BYTE3(v10[0]) = *(_BYTE *)(a2 + 12);
LABEL_8:
      v6 = sub_219860F20((uint64_t)a1, (uint64_t)v10, v7);
    }
  }
  sub_219850808(3, a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfUnRegRspNtf");
  return v6;
}

uint64_t sub_2198F3150(uint64_t a1, char a2, char a3)
{
  uint64_t v6;

  sub_219850718(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfSetInitialCredit");
  if (a1)
  {
    v6 = 0;
    *(_BYTE *)(a1 + 961) = a2;
    *(_BYTE *)(a1 + 960) = a3;
  }
  else
  {
    v6 = 1;
  }
  sub_219850808(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfSetInitialCredit");
  return v6;
}

uint64_t sub_2198F31D0(uint64_t a1, char a2)
{
  uint64_t v4;

  sub_219850718(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfSetMaxCtrlPacketSize");
  if (a1)
  {
    v4 = 0;
    *(_BYTE *)(a1 + 624) = a2;
  }
  else
  {
    v4 = 1;
  }
  sub_219850808(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfSetMaxCtrlPacketSize");
  return v4;
}

uint64_t sub_2198F3248(uint64_t a1, int a2, int a3)
{
  uint64_t v6;

  sub_219850718(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfSetMaxDataPacketSize");
  v6 = 1;
  if (a1 && a3)
  {
    if (*(unsigned __int8 *)(a1 + 961) == a2)
    {
      v6 = 0;
      *(_BYTE *)(a1 + 962) = a3;
    }
    else
    {
      v6 = 3;
    }
  }
  sub_219850808(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfSetMaxDataPacketSize");
  return v6;
}

uint64_t sub_2198F32D8(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;

  sub_219850718(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfFlushDataOnLogChnlZero");
  if (a1)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = *((_QWORD *)&unk_253E46700 + 14 * v3 + 5);
      if ((v2 & 1) != 0)
        break;
      v2 = 1;
      v3 = 1;
    }
    while (v4 != a1);
    if (v4 == a1)
    {
      sub_219850628(1, (unsigned int *)(a1 + 2468), 3u, 4u, (uint64_t)"Flushing data on ConnID Zero if already present");
      if (sub_219853424((unsigned int *)a1) != 1)
      {
        v5 = 0;
        while (1)
        {
          v6 = *(_QWORD *)(a1 + 928 + v5);
          if (v6)
          {
            if ((*(_BYTE *)v6 & 0xEF) == 0)
              break;
          }
          v5 += 8;
          if (v5 == 24)
            return sub_219850808(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfFlushDataOnLogChnlZero");
        }
        v7 = a1 + 928;
        if (v6 == a1 + 640)
        {
          *(_QWORD *)(v7 + v5) = 0;
          *(_QWORD *)(a1 + 904) = 0;
          *(_WORD *)(a1 + 900) = 0;
        }
        else
        {
          for (i = *(_QWORD *)(v6 + 264); i; i = *(_QWORD *)(v9 + 264))
          {
            v9 = i;
            phOsalNfc_FreeMemory();
          }
          phOsalNfc_FreeMemory();
          *(_QWORD *)(v7 + v5) = 0;
        }
      }
    }
  }
  return sub_219850808(3, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreIfFlushDataOnLogChnlZero");
}

uint64_t sub_2198F3428(uint64_t a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfig");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 1;
    DWORD2(v4) = 2;
    *(_QWORD *)&v5 = *(_QWORD *)(a1 + 848);
    DWORD2(v5) = *(_DWORD *)(a1 + 856);
    v2 = sub_2198F2D0C(a1 + 888, (uint64_t)&v4, a1 + 3760, 2000, (uint64_t)sub_2198F46F0, a1);
  }
  else
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfig");
  return v2;
}

uint64_t sub_2198F3514(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  const char *v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigRsp");
  if (!a1)
  {
    v5 = 1;
    goto LABEL_23;
  }
  v2 = (_BYTE *)(a1 + 6592);
  *(_BYTE *)(a1 + 6593) = 0;
  if (*(_DWORD *)(a1 + 3768) < 2u || (v3 = *(_BYTE **)(a1 + 3760)) == 0)
  {
LABEL_22:
    v5 = 255;
    goto LABEL_23;
  }
  sub_219881A20((unsigned int *)a1, v3);
  v4 = **(unsigned __int8 **)(a1 + 3760);
  if (v4 > 0xF0)
  {
    switch(v4)
    {
      case 0xF1u:
        v7 = (unsigned int *)(a1 + 6476);
        v8 = "Set Config failed with NOK express mode enabled Error";
        break;
      case 0xF9u:
        v5 = 135;
        goto LABEL_23;
      case 0xFCu:
        v5 = 158;
        goto LABEL_23;
      default:
LABEL_19:
        v7 = (unsigned int *)(a1 + 6476);
        v8 = "Set Config failed";
        break;
    }
    sub_219850628(1, v7, 3u, 2u, (uint64_t)v8);
    if (*v2 == 1)
      *(_BYTE *)(a1 + 6593) = 1;
    goto LABEL_22;
  }
  v5 = 0;
  switch(**(_BYTE **)(a1 + 3760))
  {
    case 0:
      break;
    case 1:
    case 5:
    case 9:
      v6 = *(_QWORD *)(a1 + 848);
      if (v6 && *(_DWORD *)(a1 + 856) >= 2u)
        sub_219851FF8(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Set Cfg Rsp returned not supported, Tag ID (All):", v6 + 1);
      if (*v2 == 1)
        *(_BYTE *)(a1 + 6593) = 1;
      v5 = 147;
      break;
    default:
      goto LABEL_19;
  }
LABEL_23:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigRsp");
  return v5;
}

uint64_t sub_2198F36A4(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteSetConfig");
  if (a1)
  {
    *(_DWORD *)(a1 + 3744) = 4;
    if (*(_QWORD *)(a1 + 848))
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 848) = 0;
      *(_DWORD *)(a1 + 856) = 0;
    }
    sub_2198E23C4(a1, a2, 0);
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteSetConfig");
  return a2;
}

uint64_t sub_2198F3734(uint64_t a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigSigned");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 0xF00000001;
    DWORD2(v4) = 44;
    *(_QWORD *)&v5 = *(_QWORD *)(a1 + 848);
    DWORD2(v5) = *(_DWORD *)(a1 + 856);
    v2 = sub_2198F2D0C(a1 + 888, (uint64_t)&v4, a1 + 3760, 2000, (uint64_t)sub_2198F46F0, a1);
  }
  else
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigSigned");
  return v2;
}

uint64_t sub_2198F3820(uint64_t a1)
{
  unsigned __int8 *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfSignedRsp");
  if (a1 && (v2 = *(unsigned __int8 **)(a1 + 3760)) != 0)
  {
    if (*(_DWORD *)(a1 + 3768) >= 2u)
    {
      v3 = *v2;
      switch(v3)
      {
        case 0:
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Rf Signed Config response success");
          v5 = 0;
          goto LABEL_14;
        case 1:
        case 5:
        case 9:
          v4 = *(_QWORD *)(a1 + 848);
          if (v4 && *(_DWORD *)(a1 + 856) >= 2u)
            sub_219851FF8(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Rf Signed Config error, Tag ID (All):", v4 + 1);
          v5 = 147;
          goto LABEL_14;
        case 2:
        case 3:
        case 4:
        case 6:
        case 7:
        case 8:
          goto LABEL_12;
        default:
          if (v3 == 242)
          {
            sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Rf Signed Config response signature error");
            v5 = 130;
            goto LABEL_14;
          }
LABEL_12:
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Rf Signed Config response failed!");
          break;
      }
    }
    v5 = 255;
  }
  else
  {
    v5 = 1;
  }
LABEL_14:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfSignedRsp");
  return v5;
}

uint64_t sub_2198F397C(uint64_t a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProtoIfMap");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 0x100000001;
    DWORD2(v4) = 0;
    *(_QWORD *)&v5 = *(_QWORD *)(a1 + 848);
    DWORD2(v5) = *(_DWORD *)(a1 + 856);
    v2 = sub_2198F2D0C(a1 + 888, (uint64_t)&v4, a1 + 3760, 2000, (uint64_t)sub_2198F4814, a1);
  }
  else
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProtoIfMap");
  return v2;
}

uint64_t sub_2198F3A60(uint64_t a1)
{
  _BYTE *v2;
  unsigned int *v3;
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProtoIfMapRsp");
  if (a1)
  {
    *(_BYTE *)(a1 + 6593) = 0;
    if (*(_DWORD *)(a1 + 3768) == 1)
    {
      v2 = *(_BYTE **)(a1 + 3760);
      if (v2)
      {
        v3 = (unsigned int *)(a1 + 6476);
        if (!*v2)
        {
          sub_219850628(1, v3, 3u, 4u, (uint64_t)"Rf Proto Intf mapping: SUCCESS");
          v4 = 0;
          goto LABEL_9;
        }
        sub_219850628(1, v3, 3u, 2u, (uint64_t)"Rf Proto Intf mapping: FAILED");
        if (*(_BYTE *)(a1 + 6592) == 1)
          *(_BYTE *)(a1 + 6593) = 1;
      }
    }
    v4 = 255;
  }
  else
  {
    v4 = 1;
  }
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProtoIfMapRsp");
  return v4;
}

uint64_t sub_2198F3B4C(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteProtoIfMap");
  if (a1)
  {
    *(_DWORD *)(a1 + 3744) = 4;
    if (*(_QWORD *)(a1 + 848))
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 848) = 0;
      *(_DWORD *)(a1 + 856) = 0;
    }
    sub_2198E23C4(a1, a2, 0);
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteProtoIfMap");
  return a2;
}

uint64_t sub_2198F3BDC(unsigned int *a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngConfig");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 0x100000001;
    DWORD2(v4) = 2;
    *(_QWORD *)&v5 = 0;
    DWORD2(v5) = 0;
    v2 = sub_2198F2D0C((uint64_t)(a1 + 222), (uint64_t)&v4, (uint64_t)(a1 + 940), 2000, (uint64_t)sub_2198F4934, (uint64_t)a1);
  }
  else
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    v2 = 1;
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngConfig");
  return v2;
}

uint64_t sub_2198F3CBC(uint64_t a1, uint64_t a2)
{
  int v4;
  unsigned int *v5;
  uint64_t v6;
  const char *v7;
  unsigned int *v8;
  const char *v9;
  uint64_t v11;
  uint64_t v12;

  v11 = 0;
  v12 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteGetRtngConfig");
  if (a1)
  {
    if (!(_DWORD)a2)
    {
      v11 = 0x100000003;
      LODWORD(v12) = 2;
      v4 = sub_2198F2F98((unsigned int *)(a1 + 888), (uint64_t)&v11, (uint64_t)sub_2198F84C8, a1);
      switch(v4)
      {
        case 255:
          v8 = (unsigned int *)(a1 + 6476);
          v9 = "Get Listen mode routing notification registration failed!";
          break;
        case 53:
          v8 = (unsigned int *)(a1 + 6476);
          v9 = "Get Listen mode routing notification already registered";
          break;
        case 0:
          v5 = (unsigned int *)(a1 + 6476);
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Get Listen mode routing notification registered");
          *(_BYTE *)(a1 + 864) = 0;
          *(_BYTE *)(a1 + 866) = 0;
          *(_QWORD *)(a1 + 872) = 0;
          *(_WORD *)(a1 + 880) = 0;
          v6 = *(_QWORD *)(a1 + 4656);
          if (v6 == 0xFFFFFFFFFFFFLL)
          {
            a2 = 255;
            v7 = "Timer Create had failed\n#\n";
          }
          else
          {
            sub_21988C4AC(*(_DWORD *)(a1 + 6476), v6);
            *(_BYTE *)(a1 + 6464) = 0;
            a2 = phOsalNfc_Timer_Start();
            if (!(_DWORD)a2)
            {
              sub_21988629C(1, v5, *(_QWORD *)(a1 + 4656), 3u, 4u, (uint64_t)"phNciNfc_CompleteGetRtngConfig");
              sub_219850628(1, v5, 3u, 4u, (uint64_t)"Get Listen Mode Ntf Handler timer started\n");
              sub_219850628(1, v5, 3u, 4u, (uint64_t)"Waiting for Get listen mode routing notification...");
              goto LABEL_16;
            }
            v7 = "Get Listen Mode Ntf Handler timer start FAILED\n\n";
          }
          sub_219850628(1, v5, 3u, 1u, (uint64_t)v7);
          sub_2198F3088((unsigned int *)(a1 + 888), (uint64_t)&v11, (uint64_t)sub_2198F84C8);
          goto LABEL_15;
        default:
          v8 = (unsigned int *)(a1 + 6476);
          v9 = "Invalid parameter sent";
          break;
      }
      sub_219850628(1, v8, 3u, 1u, (uint64_t)v9);
      a2 = 255;
    }
LABEL_15:
    sub_2198E23C4(a1, a2, 0);
  }
LABEL_16:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteGetRtngConfig");
  return a2;
}

uint64_t sub_2198F3EEC(uint64_t a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRtngConfig");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 0x100000001;
    DWORD2(v4) = 1;
    *(_QWORD *)&v5 = *(_QWORD *)(a1 + 848);
    DWORD2(v5) = *(_DWORD *)(a1 + 856);
    v2 = sub_2198F2D0C(a1 + 888, (uint64_t)&v4, a1 + 3760, 2000, (uint64_t)sub_2198F48A4, a1);
  }
  else
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"Invalid input parameter");
    v2 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRtngConfig");
  return v2;
}

uint64_t sub_2198F3FD4(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteSetRtngConfig");
  if (a1)
  {
    if (*(_QWORD *)(a1 + 848))
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 848) = 0;
      *(_DWORD *)(a1 + 856) = 0;
    }
    if (!*(_BYTE *)(a1 + 864))
    {
      *(_WORD *)(a1 + 865) = 0;
      *(_WORD *)(a1 + 880) = 0;
    }
    sub_2198E23C4(a1, a2, 0);
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteSetRtngConfig");
  return a2;
}

uint64_t sub_2198F4070(uint64_t a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfig");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 1;
    DWORD2(v4) = 3;
    *(_QWORD *)&v5 = *(_QWORD *)(a1 + 848);
    DWORD2(v5) = *(_DWORD *)(a1 + 856);
    v2 = sub_2198F2D0C(a1 + 888, (uint64_t)&v4, a1 + 3760, 2000, (uint64_t)sub_2198F4780, a1);
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Invalid input parameter (phNciNfc_SetConfig)\n");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfig");
  return v2;
}

uint64_t sub_2198F415C(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *v4;
  int v5;
  uint64_t v6;
  _BYTE *v7;
  unsigned int v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRsp");
  if (a1)
  {
    if (!(_DWORD)a2)
    {
      v4 = *(unsigned __int8 **)(a1 + 3760);
      if (v4)
      {
        v5 = *v4;
        if (v5 != 10)
        {
          if (v5 == 9)
          {
            v6 = sub_2198F9434(a1, (*(_BYTE *)(a1 + 3768) - 2), (uint64_t)(v4 + 2), 0);
LABEL_13:
            a2 = v6;
            goto LABEL_19;
          }
          if (!*v4 && *(unsigned __int8 *)(a1 + 832) == v4[1])
          {
            v6 = sub_2198F9434(a1, (*(_BYTE *)(a1 + 3768) - 2), (uint64_t)(v4 + 2), 1);
            if (!*(_BYTE *)(a1 + 832))
            {
              v7 = *(_BYTE **)(a1 + 3760);
              v8 = *(_DWORD *)(a1 + 3768) - 1;
              goto LABEL_17;
            }
            goto LABEL_13;
          }
          goto LABEL_11;
        }
        if (*(unsigned __int8 *)(a1 + 832) < v4[1])
        {
LABEL_11:
          a2 = 255;
          goto LABEL_19;
        }
        a2 = 1;
        if (!sub_2198F9434(a1, (*(_BYTE *)(a1 + 3768) - 2), (uint64_t)(v4 + 2), 1))
        {
          if (!*(_BYTE *)(a1 + 832))
          {
LABEL_18:
            a2 = 0;
            goto LABEL_19;
          }
          v7 = *(_BYTE **)(a1 + 3760);
          v8 = *(_DWORD *)(a1 + 3768);
LABEL_17:
          sub_219880A3C((unsigned int *)a1, v7, v8);
          goto LABEL_18;
        }
      }
    }
  }
LABEL_19:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRsp");
  return a2;
}

uint64_t sub_2198F42A0(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  LODWORD(v2) = a2;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteGetConfig");
  if (!a1)
    goto LABEL_12;
  if (!*(_QWORD *)(a1 + 840))
  {
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Do not invoke upper layer as Deinit is in progress");
LABEL_12:
    v2 = 0;
    goto LABEL_13;
  }
  if ((_DWORD)v2)
  {
    if (*(_QWORD *)(a1 + 848))
    {
      *(_QWORD *)(a1 + 848) = 0;
      *(_DWORD *)(a1 + 856) = 0;
    }
    sub_2198FAA00(a1);
    if ((_DWORD)v2 == 1)
      v2 = 255;
    else
      v2 = v2;
    v4 = *(_QWORD *)(a1 + 4648);
    v5 = a1;
    v6 = v2;
  }
  else
  {
    if (*(_BYTE *)(a1 + 832))
    {
      *(_QWORD *)(a1 + 3736) = off_2550A4078;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A4078);
      *(_QWORD *)(a1 + 848) = *(_QWORD *)(a1 + 840);
      *(_DWORD *)(a1 + 856) = *(unsigned __int8 *)(a1 + 833) + 1;
      v2 = sub_2198F4780(a1, 0, 0);
      goto LABEL_13;
    }
    if (*(_QWORD *)(a1 + 848))
    {
      *(_QWORD *)(a1 + 848) = 0;
      *(_DWORD *)(a1 + 856) = 0;
    }
    v2 = sub_2198FAA00(a1);
    v4 = *(_QWORD *)(a1 + 4648);
    v5 = a1;
    v6 = 0;
  }
  sub_2198E23C4(v5, v6, v4);
LABEL_13:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteGetConfig");
  return v2;
}

uint64_t sub_2198F43E4(unsigned int *a1, uint64_t a2)
{
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRawRsp");
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRawRsp");
  return a2;
}

uint64_t sub_2198F4448(uint64_t a1, uint64_t a2)
{
  int v4;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteGetConfigRaw");
  if (a1)
  {
    phOsalNfc_SetMemory();
    if (*(_QWORD *)(a1 + 848))
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 848) = 0;
      *(_DWORD *)(a1 + 856) = 0;
    }
    if (!(_DWORD)a2)
    {
      v4 = *(_DWORD *)(a1 + 3768);
      *(_BYTE *)(a1 + 6668) = v4;
      if ((_BYTE)v4)
        phOsalNfc_MemCopy();
    }
    sub_2198E23C4(a1, a2, a1 + 6668);
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteGetConfigRaw");
  return a2;
}

uint64_t sub_2198F451C(uint64_t a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetTxValue");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_QWORD *)&v4 = 0xF00000001;
    DWORD2(v4) = 20;
    *(_QWORD *)&v5 = *(_QWORD *)(a1 + 848);
    DWORD2(v5) = *(_DWORD *)(a1 + 856);
    v2 = sub_2198F2D0C(a1 + 888, (uint64_t)&v4, a1 + 3760, 2000, (uint64_t)sub_2198F4780, a1);
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Invalid input parameter (phNciNfc_SetConfig)\n");
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetTxValue");
  return v2;
}

uint64_t sub_2198F4608(uint64_t a1, int a2)
{
  unint64_t v2;
  _BYTE *v4;
  unsigned __int8 v6;

  LODWORD(v2) = a2;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetTxValRsp");
  if (a1)
  {
    if (!(_DWORD)v2)
    {
      v4 = *(_BYTE **)(a1 + 3760);
      if (v4)
      {
        LOWORD(v2) = 255;
        switch(*v4)
        {
          case 0:
            v6 = v4[1] - 1;
            if (v6 >= 4u)
              LOWORD(v2) = 255;
            else
              v2 = 0xFF00000000uLL >> (16 * v6);
            break;
          case 1:
          case 5:
          case 9:
            sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"GetTransition reg resp failed");
            LOWORD(v2) = 147;
            break;
          default:
            break;
        }
      }
    }
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetTxValRsp");
  return (unsigned __int16)v2;
}

uint64_t sub_2198F46F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigSequence");
  if (a1 && a2)
  {
    *(_QWORD *)(a1 + 3760) = *(_QWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 3768) = *(_DWORD *)(a2 + 16);
  }
  v6 = sub_21987CC04(a1, a3);
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigSequence");
  return v6;
}

uint64_t sub_2198F4780(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigSequence");
  if (a1 && a2 && !(_DWORD)a3)
  {
    *(_QWORD *)(a1 + 3760) = *(_QWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 3768) = *(_DWORD *)(a2 + 16);
  }
  v6 = sub_21987CC04(a1, a3);
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigSequence");
  return v6;
}

uint64_t sub_2198F4814(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ConfigMappingSequence");
  if (a1 && a2)
  {
    *(_QWORD *)(a1 + 3760) = *(_QWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 3768) = *(_DWORD *)(a2 + 16);
  }
  v6 = sub_21987CC04(a1, a3);
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ConfigMappingSequence");
  return v6;
}

uint64_t sub_2198F48A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRtngConfigSequence");
  if (a1 && a2)
  {
    *(_QWORD *)(a1 + 3760) = *(_QWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 3768) = *(_DWORD *)(a2 + 16);
  }
  v6 = sub_21987CC04(a1, a3);
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRtngConfigSequence");
  return v6;
}

uint64_t sub_2198F4934(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngConfigSequence");
  if (a1 && a2)
  {
    *(_QWORD *)(a1 + 3760) = *(_QWORD *)(a2 + 8);
    *(_DWORD *)(a1 + 3768) = *(_DWORD *)(a2 + 16);
  }
  v6 = sub_21987CC04(a1, a3);
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngConfigSequence");
  return v6;
}

uint64_t sub_2198F49C4(unsigned int *a1, unsigned int a2, int *a3)
{
  unint64_t v3;
  uint64_t v7;
  unsigned int *v8;
  uint64_t v9;
  const char *v10;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateDiscMapParams");
  if (!a3)
  {
LABEL_13:
    v9 = 1;
    goto LABEL_14;
  }
  if (a2)
  {
    v7 = a2;
    v8 = (unsigned int *)(a3 + 2);
    while (1)
    {
      if (sub_2198591B4(a1, *(v8 - 2)) == 1)
      {
        v10 = "Invalid RF procotol";
        goto LABEL_12;
      }
      v3 = v3 & 0xFFFFFFFF00000000 | *(v8 - 1);
      if (sub_2198F4AE4(a1, v3))
      {
        v10 = "Invalid mode";
        goto LABEL_12;
      }
      if (sub_21985912C(a1, *v8) == 1)
        break;
      v8 += 3;
      if (!--v7)
        goto LABEL_8;
    }
    v10 = "Invalid RF interface";
LABEL_12:
    sub_219850628(2, a1, 3u, 4u, (uint64_t)v10);
    goto LABEL_13;
  }
LABEL_8:
  v9 = sub_2198F4B50(a1, a2, a3);
LABEL_14:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateDiscMapParams");
  return v9;
}

BOOL sub_2198F4AE4(unsigned int *a1, char a2)
{
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateMode");
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateMode");
  return (a2 & 3) == 0;
}

uint64_t sub_2198F4B50(unsigned int *a1, unsigned int a2, int *a3)
{
  uint64_t v6;
  unsigned __int8 v7;
  uint64_t v8;
  int *v9;
  int v10;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_VerifyRfProtocols");
  if (a2 < 2)
  {
    v7 = 0;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    do
    {
      v8 = 0;
      v9 = a3;
      do
      {
        v10 = *v9;
        v9 += 3;
        if (a3[3 * v6] == v10 && v6 != v8)
          v7 = 1;
        ++v8;
      }
      while (a2 != v8);
      ++v6;
    }
    while (v6 != a2);
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_VerifyRfProtocols");
  return v7;
}

uint64_t sub_2198F4C10(uint64_t a1, uint64_t a2)
{
  unsigned int v4;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_VerifySupportedRfIntfs");
  if (*(_BYTE *)(a1 + 4))
  {
    if ((_DWORD)a2)
    {
      v4 = 0;
      do
      {
        sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CheckRfIntfs");
        sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CheckRfIntfs");
        ++v4;
      }
      while (v4 < a2);
      a2 = 0;
    }
  }
  else
  {
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"NFCC does not supported any RF interface");
    a2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_VerifySupportedRfIntfs");
  return a2;
}

uint64_t sub_2198F4CF4(unsigned int *a1, _BYTE *a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  char *v9;
  int v10;
  uint64_t v11;
  char v12;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildDiscMapCmdPayload");
  *a2 = a3;
  if (a3)
  {
    v8 = a3;
    v9 = (char *)(a4 + 4);
    v10 = 1;
    do
    {
      a2[v10] = *((_DWORD *)v9 - 1);
      v11 = (v10 + 1);
      a2[v11] = 0;
      v12 = *v9;
      a2[v11] = *v9 & 1;
      a2[v11] = *v9 & 2 | v12 & 1;
      LOBYTE(v11) = v10 + 2;
      v10 += 3;
      a2[v11] = *((_DWORD *)v9 + 1);
      v9 += 12;
      --v8;
    }
    while (v8);
  }
  return sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildDiscMapCmdPayload");
}

uint64_t sub_2198F4DC0(unsigned int *a1, uint64_t a2, _WORD *a3, _BYTE *a4)
{
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  const char *v14;
  unsigned int v15;
  int v16;
  int v17;
  int i;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSetConfParams");
  v8 = 1;
  if (a2 && a3 && a4)
  {
    sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_SetconfEntryCheck");
    v9 = *(_DWORD *)(a2 + 4) & 0x1F7FF;
    sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_SetconfEntryCheck");
    if (v9)
    {
      v10 = *(_DWORD *)(a2 + 4);
      if ((v10 & 4) != 0)
      {
        sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePollNfcFParams");
        if ((*(_BYTE *)(a2 + 24) & 1) == 0)
        {
          sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePollNfcFParams");
LABEL_24:
          v14 = "phNciNfc_ValidatePollNfcFParams failed";
LABEL_104:
          v8 = 1;
          sub_219850628(2, a1, 3u, 1u, (uint64_t)v14);
          goto LABEL_105;
        }
        ++*a4;
        ++*a3;
        v11 = *(unsigned __int8 *)(a2 + 28);
        sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePollNfcFParams");
        if ((v11 - 1) >= 2 && v11 != 128)
          goto LABEL_24;
        v10 = *(_DWORD *)(a2 + 4);
      }
      if ((v10 & 0x10) == 0)
      {
LABEL_20:
        if ((v10 & 0x20) == 0)
          goto LABEL_41;
        sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcAParams");
        v13 = *(_DWORD *)(a2 + 148);
        if (v13)
        {
          if ((v13 & 4) != 0)
          {
            ++*a4;
            ++*a3;
            LOBYTE(v13) = *(_BYTE *)(a2 + 148);
          }
          if ((v13 & 1) != 0)
          {
            ++*a4;
            ++*a3;
            LOBYTE(v13) = *(_BYTE *)(a2 + 148);
          }
          if ((v13 & 2) != 0)
          {
            ++*a4;
            if (*(unsigned __int8 *)(a2 + 153) > 0xFu)
              goto LABEL_45;
            ++*a3;
            LOBYTE(v13) = *(_BYTE *)(a2 + 148);
          }
          if ((v13 & 8) == 0)
          {
LABEL_40:
            sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcAParams");
            v10 = *(_DWORD *)(a2 + 4);
LABEL_41:
            if ((v10 & 0x40) == 0)
              goto LABEL_54;
            sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcBParams");
            v16 = *(_DWORD *)(a2 + 172);
            if (!v16)
            {
              sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcBParams");
              v14 = "phNciNfc_ValidateLstnNfcBParams failed";
              goto LABEL_104;
            }
            if ((v16 & 1) != 0)
            {
              ++*a4;
              ++*a3;
              LOBYTE(v16) = *(_BYTE *)(a2 + 172);
            }
            if ((v16 & 2) != 0)
            {
              ++*a4;
              *a3 += 4;
              LOBYTE(v16) = *(_BYTE *)(a2 + 172);
              if ((v16 & 4) == 0)
              {
LABEL_50:
                if ((v16 & 8) == 0)
                  goto LABEL_51;
                goto LABEL_60;
              }
            }
            else if ((v16 & 4) == 0)
            {
              goto LABEL_50;
            }
            ++*a4;
            *a3 += 4;
            LOBYTE(v16) = *(_BYTE *)(a2 + 172);
            if ((v16 & 8) == 0)
            {
LABEL_51:
              if ((v16 & 0x10) == 0)
              {
LABEL_53:
                sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcBParams");
                v10 = *(_DWORD *)(a2 + 4);
LABEL_54:
                if ((v10 & 0x80) == 0)
                  goto LABEL_77;
                sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcFParams");
                v17 = *(_DWORD *)(a2 + 196);
                if (!v17)
                {
                  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcFParams");
                  v14 = "phNciNfc_ValidateLstnNfcFParams failed";
                  goto LABEL_104;
                }
                if ((v17 & 1) != 0)
                {
                  ++*a4;
                  ++*a3;
                  LOBYTE(v17) = *(_BYTE *)(a2 + 196);
                }
                if ((v17 & 2) != 0)
                {
                  ++*a4;
                  ++*a3;
                  LOBYTE(v17) = *(_BYTE *)(a2 + 196);
                  if ((v17 & 8) == 0)
                  {
LABEL_66:
                    if ((v17 & 0x10) == 0)
                      goto LABEL_67;
                    goto LABEL_71;
                  }
                }
                else if ((v17 & 8) == 0)
                {
                  goto LABEL_66;
                }
                ++*a4;
                *a3 += 8;
                LOBYTE(v17) = *(_BYTE *)(a2 + 196);
                if ((v17 & 0x10) == 0)
                {
LABEL_67:
                  if ((v17 & 4) == 0)
                    goto LABEL_76;
                  goto LABEL_72;
                }
LABEL_71:
                ++*a4;
                *a3 += 2;
                if ((*(_BYTE *)(a2 + 196) & 4) == 0)
                {
LABEL_76:
                  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcFParams");
                  v10 = *(_DWORD *)(a2 + 4);
LABEL_77:
                  if ((v10 & 0x100) != 0)
                  {
                    if (sub_2198F5530(a1, (int *)(a2 + 380), a3, a4))
                    {
                      v14 = "phNciNfc_ValidateLstnIsoDepParams failed";
                      goto LABEL_104;
                    }
                    v10 = *(_DWORD *)(a2 + 4);
                  }
                  if ((v10 & 0x400) != 0)
                  {
                    if (sub_2198F5658(a1, (int *)(a2 + 544), a3, a4))
                    {
                      v14 = "phNciNfc_ValidateCommonParams failed";
                      goto LABEL_104;
                    }
                    v10 = *(_DWORD *)(a2 + 4);
                  }
                  if ((v10 & 0x1000) != 0)
                  {
                    if (sub_2198F57A8(a1, (unsigned __int8 *)(a2 + 580), a3, a4))
                    {
                      v14 = "phNciNfc_ValidateSysConfigParams failed";
                      goto LABEL_104;
                    }
                    v10 = *(_DWORD *)(a2 + 4);
                  }
                  if ((v10 & 0x2000) != 0)
                  {
                    if (sub_2198F5CD4(a1, (int *)(a2 + 1128), a3, a4))
                    {
                      v14 = "phNciNfc_ValidateSwpConfigParams failed";
                      goto LABEL_104;
                    }
                    v10 = *(_DWORD *)(a2 + 4);
                  }
                  if ((v10 & 0x4000) != 0)
                  {
                    if (sub_2198F6098(a1, (int *)(a2 + 1740), a3, a4))
                    {
                      v14 = "phNciNfc_ValidateSmbCfgParams failed";
                      goto LABEL_104;
                    }
                    v10 = *(_DWORD *)(a2 + 4);
                  }
                  if ((v10 & 0x8000) != 0)
                  {
                    if (sub_2198F61A4(a1, (int *)(a2 + 1408), a3, a4))
                    {
                      v14 = "phNciNfc_ValidateNxpExtnRfDiscConfigParams failed";
                      goto LABEL_104;
                    }
                    v10 = *(_DWORD *)(a2 + 4);
                  }
                  if ((v10 & 0x10000) == 0 || !sub_2198F6650(a1, (int *)(a2 + 1536), a3, a4))
                  {
                    v8 = 0;
                    goto LABEL_105;
                  }
                  v14 = "phNciNfc_ValidatePropConfigParams failed";
                  goto LABEL_104;
                }
LABEL_72:
                for (i = 0; i != 16; ++i)
                {
                  if (((*(unsigned __int16 *)(a2 + 378) >> i) & 1) != 0)
                  {
                    ++*a4;
                    *a3 += 10;
                  }
                }
                goto LABEL_76;
              }
LABEL_52:
              ++*a4;
              ++*a3;
              goto LABEL_53;
            }
LABEL_60:
            ++*a4;
            ++*a3;
            if ((*(_BYTE *)(a2 + 172) & 0x10) == 0)
              goto LABEL_53;
            goto LABEL_52;
          }
          ++*a4;
          v15 = *(unsigned __int8 *)(a2 + 170);
          if (v15 <= 0xA && ((1 << v15) & 0x491) != 0)
          {
            *a3 += v15;
            goto LABEL_40;
          }
        }
LABEL_45:
        sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnNfcAParams");
        v14 = "phNciNfc_ValidateLstnNfcAParams failed";
        goto LABEL_104;
      }
      sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePollNfcDepParams");
      v12 = *(_DWORD *)(a2 + 88);
      if (v12)
      {
        if ((v12 & 1) == 0)
        {
          if ((v12 & 4) == 0)
          {
LABEL_17:
            if ((v12 & 2) != 0)
            {
              ++*a4;
              *a3 += *(unsigned __int8 *)(a2 + 141);
            }
            sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePollNfcDepParams");
            v10 = *(_DWORD *)(a2 + 4);
            goto LABEL_20;
          }
LABEL_16:
          ++*a4;
          ++*a3;
          LOBYTE(v12) = *(_BYTE *)(a2 + 88);
          goto LABEL_17;
        }
        if (*(unsigned __int8 *)(a2 + 92) <= 1u)
        {
          ++*a4;
          ++*a3;
          LOBYTE(v12) = *(_BYTE *)(a2 + 88);
          if ((v12 & 4) == 0)
            goto LABEL_17;
          goto LABEL_16;
        }
      }
      else
      {
        sub_219850628(2, a1, 3u, 2u, (uint64_t)"No Poll Nfc-Dep parameters are being requested by the user to configure");
      }
      sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePollNfcDepParams");
      v14 = "phNciNfc_ValidatePollNfcDepParams failed";
      goto LABEL_104;
    }
    sub_219850628(2, a1, 3u, 4u, (uint64_t)"No set config entries");
    v8 = 1;
  }
LABEL_105:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSetConfParams");
  return v8;
}

uint64_t sub_2198F5530(unsigned int *a1, int *a2, _WORD *a3, _BYTE *a4)
{
  int v8;
  uint64_t v9;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnIsoDepParams");
  v8 = *a2;
  if (!*a2)
    goto LABEL_13;
  if ((v8 & 1) != 0)
  {
    ++*a4;
    ++*a3;
    LOBYTE(v8) = *(_BYTE *)a2;
    if ((*(_BYTE *)a2 & 2) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
  if ((v8 & 2) != 0)
  {
LABEL_6:
    ++*a4;
    *a3 += *((unsigned __int8 *)a2 + 53);
    LOBYTE(v8) = *(_BYTE *)a2;
  }
LABEL_7:
  if ((v8 & 4) != 0)
  {
    ++*a4;
    *a3 += *((unsigned __int8 *)a2 + 102);
    if ((*(_BYTE *)a2 & 8) == 0)
      goto LABEL_9;
    goto LABEL_11;
  }
  if ((v8 & 8) != 0)
  {
LABEL_11:
    ++*a4;
    if (*((unsigned __int8 *)a2 + 103) <= 6u)
    {
      v9 = 0;
      ++*a3;
      goto LABEL_14;
    }
LABEL_13:
    v9 = 1;
    goto LABEL_14;
  }
LABEL_9:
  v9 = 0;
LABEL_14:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateLstnIsoDepParams");
  return v9;
}

uint64_t sub_2198F5658(unsigned int *a1, int *a2, _WORD *a3, _BYTE *a4)
{
  int v8;
  uint64_t v9;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateCommonParams");
  v8 = *a2;
  if (!*a2)
    goto LABEL_17;
  if ((v8 & 1) != 0)
  {
    ++*a4;
    *a3 += 2;
    LOBYTE(v8) = *(_BYTE *)a2;
    if ((*(_BYTE *)a2 & 2) == 0)
      goto LABEL_8;
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_8;
  }
  if (*((_BYTE *)a2 + 6))
  {
    ++*a4;
    ++*a3;
    LOBYTE(v8) = *(_BYTE *)a2;
  }
LABEL_8:
  if ((v8 & 0x10) != 0)
  {
    ++*a4;
    ++*a3;
    LOBYTE(v8) = *(_BYTE *)a2;
  }
  if ((v8 & 4) != 0)
  {
    ++*a4;
    if (*((unsigned __int8 *)a2 + 7) > 1u)
      goto LABEL_17;
    ++*a3;
    LOBYTE(v8) = *(_BYTE *)a2;
  }
  if ((v8 & 8) != 0)
  {
    ++*a4;
    if (*((unsigned __int8 *)a2 + 8) <= 1u)
    {
      v9 = 0;
      ++*a3;
      goto LABEL_18;
    }
LABEL_17:
    v9 = 1;
    goto LABEL_18;
  }
  v9 = 0;
LABEL_18:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateCommonParams");
  return v9;
}

uint64_t sub_2198F57A8(unsigned int *a1, unsigned __int8 *a2, _WORD *a3, _BYTE *a4)
{
  unsigned int v8;
  unsigned int v9;
  int v10;
  int v11;
  uint64_t v12;
  const char *v13;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSysConfigParams");
  if (!*(_DWORD *)a2)
    goto LABEL_47;
  sub_2198F93A4(a1, *(_DWORD *)a2 & 1, 3, a3, a4);
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysClkParams");
  v8 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 & 2) != 0)
  {
    ++*a4;
    if (a2[6] >= 3u)
    {
      sub_2198F93A4(a1, a2[8], 5, a3, a4);
      goto LABEL_43;
    }
    *a3 += 2;
    sub_2198F93A4(a1, a2[8], 5, a3, a4);
    v8 = *(_DWORD *)a2;
  }
  sub_2198F93A4(a1, (v8 >> 3) & 1, 2, a3, a4);
  if ((*a2 & 4) == 0)
    goto LABEL_9;
  ++*a4;
  if (!*((_DWORD *)a2 + 2) || *((_DWORD *)a2 + 3) > 7u)
  {
LABEL_43:
    v13 = "phNciNfc_ParseSysClkParams";
LABEL_46:
    sub_219850808(2, a1, 3u, 5u, (uint64_t)v13);
    goto LABEL_47;
  }
  *a3 += 2;
LABEL_9:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysClkParams");
  v9 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 & 0x10) != 0)
  {
    ++*a4;
    if (a2[20] > 1u)
      goto LABEL_47;
    *a3 += 2;
    v9 = *(_DWORD *)a2;
  }
  if ((v9 & 0x20) == 0)
    goto LABEL_15;
  ++*a4;
  if (a2[21] > 1u)
  {
LABEL_47:
    v12 = 1;
    goto LABEL_48;
  }
  *a3 += 2;
  v9 = *(_DWORD *)a2;
LABEL_15:
  sub_2198F93A4(a1, (v9 >> 6) & 1, 2, a3, a4);
  sub_2198F93A4(a1, *a2 >> 7, 65, a3, a4);
  sub_2198F93A4(a1, (*(_DWORD *)a2 >> 8) & 1, 3, a3, a4);
  sub_2198F93A4(a1, (*(_DWORD *)a2 >> 9) & 1, 3, a3, a4);
  sub_2198F93A4(a1, (*(_DWORD *)a2 >> 10) & 1, 2, a3, a4);
  sub_2198F93A4(a1, (*(_DWORD *)a2 >> 11) & 1, 2, a3, a4);
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysParams");
  v10 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 & 0x1000) != 0)
  {
    if (a2[102] > 0x1Fu)
      goto LABEL_45;
    ++*a4;
    *a3 += a2[102] + 1;
    v10 = *(_DWORD *)a2;
  }
  if ((v10 & 0x2000) != 0)
  {
    if (a2[134] > 0xD6u)
      goto LABEL_45;
    ++*a4;
    *a3 += a2[134] + 1;
    v10 = *(_DWORD *)a2;
  }
  if ((v10 & 0x4000) != 0)
  {
    if ((*((_DWORD *)a2 + 88) | 2) != 2)
      goto LABEL_45;
    ++*a4;
    *a3 += 2;
    v10 = *(_DWORD *)a2;
  }
  if ((v10 & 0x8000) == 0)
    goto LABEL_27;
  if (*((_DWORD *)a2 + 89) > 0xAu)
  {
LABEL_45:
    v13 = "phNciNfc_ParseSysParams";
    goto LABEL_46;
  }
  ++*a4;
  *a3 += 2;
  v10 = *(_DWORD *)a2;
LABEL_27:
  if ((v10 & 0x10000) != 0)
  {
    ++*a4;
    *a3 += 2;
  }
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysAssertParams");
  v11 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 & 0x20000) != 0)
  {
    if (a2[365] - 1 > 3)
      goto LABEL_44;
    ++*a4;
    *a3 += a2[365] + 1;
    v11 = *(_DWORD *)a2;
  }
  if ((v11 & 0x40000) != 0)
  {
    if (a2[462] - 1 > 0x5F)
      goto LABEL_44;
    ++*a4;
    *a3 += a2[462] + 1;
    v11 = *(_DWORD *)a2;
  }
  if ((v11 & 0x80000) == 0)
    goto LABEL_38;
  if (a2[491] - 1 > 0x1B)
  {
LABEL_44:
    sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysAssertParams");
    goto LABEL_45;
  }
  ++*a4;
  *a3 += a2[491] + 1;
  v11 = *(_DWORD *)a2;
LABEL_38:
  if ((v11 & 0x100000) != 0)
  {
    if (a2[536] - 1 <= 0x2B)
    {
      ++*a4;
      *a3 += a2[536] + 1;
      goto LABEL_41;
    }
    goto LABEL_44;
  }
LABEL_41:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysAssertParams");
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysParams");
  sub_2198F93A4(a1, (*(_DWORD *)a2 >> 21) & 1, 2, a3, a4);
  sub_2198F93A4(a1, (*(_DWORD *)a2 >> 22) & 1, 7, a3, a4);
  v12 = 0;
LABEL_48:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSysConfigParams");
  return v12;
}

uint64_t sub_2198F5CD4(unsigned int *a1, int *a2, _WORD *a3, _BYTE *a4)
{
  int v8;
  int v9;
  __int16 v10;
  char v11;
  uint64_t v12;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSwpConfigParams");
  if (!*a2)
  {
    if (!a2[1])
    {
      if ((a2[4] & 0x80) != 0)
      {
        v10 = 9;
LABEL_61:
        v12 = 0;
        ++*a4;
        *a3 += v10;
        goto LABEL_53;
      }
      goto LABEL_52;
    }
    goto LABEL_6;
  }
  if ((*a2 & 1) == 0)
  {
LABEL_6:
    v8 = 0;
    goto LABEL_8;
  }
  ++*a4;
  if (*((unsigned __int8 *)a2 + 8) - 8 >= 0xFFFFFFF9)
  {
    v8 = 0;
    *a3 += 2;
  }
  else
  {
    v8 = 1;
  }
LABEL_8:
  if ((*(_BYTE *)a2 & 2) != 0)
  {
    ++*a4;
    if (*((unsigned __int8 *)a2 + 9) - 8 >= 0xFFFFFFF9)
      *a3 += 2;
    else
      v8 = 1;
  }
  if ((*((_BYTE *)a2 + 1) & 0x10) != 0)
  {
    ++*a4;
    if (*((unsigned __int8 *)a2 + 28) - 101 >= 0xFFFFFF9C)
      *a3 += 2;
    else
      v8 = 1;
  }
  if ((*((_BYTE *)a2 + 1) & 0x20) != 0)
  {
    ++*a4;
    if (*((unsigned __int8 *)a2 + 29) - 104 < 0xFFFFFF99)
      goto LABEL_52;
    *a3 += 2;
  }
  if (v8)
    goto LABEL_52;
  v9 = *a2;
  if ((*a2 & 4) != 0)
  {
    ++*a4;
    *a3 += 2;
    v9 = *a2;
    if ((*a2 & 8) == 0)
    {
LABEL_22:
      if ((v9 & 0x10) == 0)
        goto LABEL_23;
      goto LABEL_34;
    }
  }
  else if ((v9 & 8) == 0)
  {
    goto LABEL_22;
  }
  ++*a4;
  *a3 += 2;
  v9 = *a2;
  if ((*a2 & 0x10) == 0)
  {
LABEL_23:
    if ((v9 & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_34:
  ++*a4;
  if (*((unsigned __int8 *)a2 + 20) - 2 > 2)
    goto LABEL_52;
  *a3 += 2;
  v9 = *a2;
  if ((*a2 & 0x20) != 0)
  {
LABEL_24:
    ++*a4;
    *a3 += 2;
    v9 = *a2;
  }
LABEL_25:
  if ((v9 & 0x40) != 0)
  {
    ++*a4;
    if (*((unsigned __int8 *)a2 + 22) > 3u)
      goto LABEL_52;
    *a3 += 2;
    v9 = *a2;
  }
  if ((v9 & 0x80) == 0)
  {
    if ((v9 & 0x100) == 0)
      goto LABEL_30;
LABEL_40:
    ++*a4;
    *a3 += 2;
    if ((*a2 & 0x800000) == 0)
      goto LABEL_43;
LABEL_41:
    ++*a4;
    if (*((unsigned __int8 *)a2 + 40) <= 2u)
    {
      *a3 += 2;
      goto LABEL_43;
    }
LABEL_52:
    v12 = 1;
    goto LABEL_53;
  }
  ++*a4;
  *a3 += 2;
  v9 = *a2;
  if ((*a2 & 0x100) != 0)
    goto LABEL_40;
LABEL_30:
  if ((v9 & 0x800000) != 0)
    goto LABEL_41;
LABEL_43:
  v11 = *((_BYTE *)a2 + 4);
  if ((v11 & 1) != 0)
  {
    ++*a4;
    *a3 += 2;
    v11 = *((_BYTE *)a2 + 4);
    if ((v11 & 2) == 0)
    {
LABEL_45:
      if ((v11 & 4) == 0)
        goto LABEL_46;
      goto LABEL_56;
    }
  }
  else if ((a2[1] & 2) == 0)
  {
    goto LABEL_45;
  }
  ++*a4;
  *a3 += 2;
  v11 = *((_BYTE *)a2 + 4);
  if ((v11 & 4) == 0)
  {
LABEL_46:
    if ((v11 & 8) == 0)
      goto LABEL_47;
    goto LABEL_57;
  }
LABEL_56:
  ++*a4;
  *a3 += 2;
  v11 = *((_BYTE *)a2 + 4);
  if ((v11 & 8) == 0)
  {
LABEL_47:
    if ((v11 & 0x10) == 0)
      goto LABEL_48;
    goto LABEL_58;
  }
LABEL_57:
  ++*a4;
  *a3 += 2;
  v11 = *((_BYTE *)a2 + 4);
  if ((v11 & 0x10) == 0)
  {
LABEL_48:
    if ((v11 & 0x20) == 0)
      goto LABEL_50;
    goto LABEL_49;
  }
LABEL_58:
  ++*a4;
  *a3 += 2;
  if ((a2[1] & 0x20) != 0)
  {
LABEL_49:
    ++*a4;
    *a3 += 2;
  }
LABEL_50:
  if ((*((_BYTE *)a2 + 3) & 1) != 0)
  {
    v10 = 2;
    goto LABEL_61;
  }
  v12 = 0;
LABEL_53:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSwpConfigParams");
  return v12;
}

uint64_t sub_2198F6098(unsigned int *a1, int *a2, _WORD *a3, _BYTE *a4)
{
  int v8;
  uint64_t v9;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSmbCfgParams");
  if (!a2 || (v8 = *a2) == 0)
  {
    v9 = 1;
    goto LABEL_13;
  }
  if ((v8 & 1) == 0)
  {
    if ((v8 & 2) == 0)
      goto LABEL_9;
    goto LABEL_8;
  }
  ++*a4;
  *a3 += 4;
  LOBYTE(v8) = *(_BYTE *)a2;
  if ((*(_BYTE *)a2 & 2) != 0)
  {
LABEL_8:
    ++*a4;
    *a3 += 2;
    LOBYTE(v8) = *(_BYTE *)a2;
  }
LABEL_9:
  if ((v8 & 4) != 0)
  {
    ++*a4;
    *a3 += 3;
    LOBYTE(v8) = *(_BYTE *)a2;
  }
  v9 = 0;
  if ((v8 & 8) != 0)
  {
    ++*a4;
    *a3 += 17;
  }
LABEL_13:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSmbCfgParams");
  return v9;
}

uint64_t sub_2198F61A4(unsigned int *a1, int *a2, _WORD *a3, _BYTE *a4)
{
  int v8;
  __int16 v9;
  uint64_t v10;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateNxpExtnRfDiscConfigParams");
  v8 = *a2;
  if (*a2)
  {
    if ((v8 & 1) != 0)
    {
      ++*a4;
      if (*((unsigned __int8 *)a2 + 8) > 0x83u)
        goto LABEL_54;
      *a3 += 2;
      LOWORD(v8) = *(_WORD *)a2;
      if ((*(_WORD *)a2 & 2) == 0)
      {
LABEL_4:
        if ((v8 & 4) == 0)
          goto LABEL_5;
        goto LABEL_51;
      }
    }
    else if ((v8 & 2) == 0)
    {
      goto LABEL_4;
    }
    ++*a4;
    if (*((unsigned __int8 *)a2 + 9) > 0xFu)
      goto LABEL_54;
    *a3 += 2;
    LOWORD(v8) = *(_WORD *)a2;
    if ((*(_WORD *)a2 & 4) == 0)
    {
LABEL_5:
      if ((v8 & 8) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
LABEL_51:
    ++*a4;
    if (*((unsigned __int16 *)a2 + 5) - 32 > 0x7B0)
      goto LABEL_54;
    *a3 += 3;
    LOWORD(v8) = *(_WORD *)a2;
    if ((*(_WORD *)a2 & 8) == 0)
    {
LABEL_7:
      if ((v8 & 0x10) != 0)
      {
        ++*a4;
        if (*((unsigned __int8 *)a2 + 13) > 1u)
          goto LABEL_54;
        *a3 += 2;
        LOWORD(v8) = *(_WORD *)a2;
      }
      if ((v8 & 0x20) != 0)
      {
        ++*a4;
        if (*((unsigned __int8 *)a2 + 14) > 1u)
          goto LABEL_54;
        *a3 += 2;
        LOWORD(v8) = *(_WORD *)a2;
      }
      if ((v8 & 0x40) != 0)
      {
        ++*a4;
        if (*((unsigned __int8 *)a2 + 15) > 1u)
          goto LABEL_54;
        *a3 += 2;
        LOWORD(v8) = *(_WORD *)a2;
      }
      if ((v8 & 0x80) != 0)
      {
        ++*a4;
        if (*((unsigned __int8 *)a2 + 16) > 1u)
          goto LABEL_54;
        *a3 += 2;
        LOWORD(v8) = *(_WORD *)a2;
      }
      if ((v8 & 0x100) != 0)
      {
        ++*a4;
        if (*((unsigned __int8 *)a2 + 17) > 1u)
          goto LABEL_54;
        *a3 += 2;
        LOWORD(v8) = *(_WORD *)a2;
      }
      if ((v8 & 0x200) != 0)
      {
        ++*a4;
        if (!*((_WORD *)a2 + 9))
          goto LABEL_54;
        *a3 += 3;
        LOWORD(v8) = *(_WORD *)a2;
      }
      if ((v8 & 0x2000) == 0)
        goto LABEL_29;
      ++*a4;
      if (*((_WORD *)a2 + 13))
      {
        *a3 += 2;
        goto LABEL_29;
      }
LABEL_54:
      v10 = 1;
      goto LABEL_55;
    }
LABEL_6:
    ++*a4;
    *a3 += 2;
    LOWORD(v8) = *(_WORD *)a2;
    goto LABEL_7;
  }
  if (!a2[1])
    goto LABEL_54;
LABEL_29:
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 1) != 0)
  {
    ++*a4;
    *a3 += 7;
    v9 = *((_WORD *)a2 + 2);
    if ((v9 & 2) == 0)
    {
LABEL_31:
      if ((v9 & 4) == 0)
        goto LABEL_32;
      goto LABEL_58;
    }
  }
  else if ((v9 & 2) == 0)
  {
    goto LABEL_31;
  }
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 4) == 0)
  {
LABEL_32:
    if ((v9 & 8) == 0)
      goto LABEL_33;
    goto LABEL_59;
  }
LABEL_58:
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 8) == 0)
  {
LABEL_33:
    if ((v9 & 0x10) == 0)
      goto LABEL_34;
    goto LABEL_60;
  }
LABEL_59:
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x10) == 0)
  {
LABEL_34:
    if ((v9 & 0x20) == 0)
      goto LABEL_35;
    goto LABEL_61;
  }
LABEL_60:
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x20) == 0)
  {
LABEL_35:
    if ((v9 & 0x40) == 0)
      goto LABEL_36;
    goto LABEL_62;
  }
LABEL_61:
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x40) == 0)
  {
LABEL_36:
    if ((v9 & 0x80) == 0)
      goto LABEL_37;
    goto LABEL_63;
  }
LABEL_62:
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x80) == 0)
  {
LABEL_37:
    if ((v9 & 0x100) == 0)
      goto LABEL_38;
    goto LABEL_64;
  }
LABEL_63:
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x100) == 0)
  {
LABEL_38:
    if ((v9 & 0x200) == 0)
      goto LABEL_39;
    goto LABEL_65;
  }
LABEL_64:
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x200) == 0)
  {
LABEL_39:
    if ((v9 & 0x400) == 0)
      goto LABEL_40;
    goto LABEL_66;
  }
LABEL_65:
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x400) == 0)
  {
LABEL_40:
    if ((v9 & 0x800) == 0)
      goto LABEL_41;
    goto LABEL_67;
  }
LABEL_66:
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x800) == 0)
  {
LABEL_41:
    if ((v9 & 0x1000) == 0)
      goto LABEL_42;
    goto LABEL_68;
  }
LABEL_67:
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x1000) == 0)
  {
LABEL_42:
    if ((v9 & 0x2000) == 0)
      goto LABEL_43;
    goto LABEL_69;
  }
LABEL_68:
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x2000) == 0)
  {
LABEL_43:
    if ((v9 & 0x4000) == 0)
      goto LABEL_45;
    goto LABEL_44;
  }
LABEL_69:
  ++*a4;
  *a3 += 7;
  v9 = *((_WORD *)a2 + 2);
  if ((v9 & 0x4000) != 0)
  {
LABEL_44:
    ++*a4;
    *a3 += 7;
    v9 = *((_WORD *)a2 + 2);
  }
LABEL_45:
  v10 = 0;
  if (v9 < 0)
  {
    ++*a4;
    *a3 += 7;
  }
LABEL_55:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateNxpExtnRfDiscConfigParams");
  return v10;
}

uint64_t sub_2198F6650(unsigned int *a1, int *a2, _WORD *a3, _BYTE *a4)
{
  int v8;
  uint64_t v9;
  int v10;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePropConfigParams");
  v8 = *a2;
  if (!*a2)
  {
    v9 = 1;
    goto LABEL_30;
  }
  if ((v8 & 1) != 0)
  {
    ++*a4;
    *a3 += 2;
    v8 = *a2;
    if ((*a2 & 2) == 0)
    {
LABEL_4:
      if ((v8 & 4) == 0)
        goto LABEL_5;
LABEL_10:
      ++*a4;
      *a3 += 2;
      if ((*a2 & 8) == 0)
        goto LABEL_6;
      goto LABEL_11;
    }
  }
  else if ((v8 & 2) == 0)
  {
    goto LABEL_4;
  }
  ++*a4;
  *a3 += 3;
  v8 = *a2;
  if ((*a2 & 4) != 0)
    goto LABEL_10;
LABEL_5:
  if ((v8 & 8) == 0)
  {
LABEL_6:
    v9 = 0;
    goto LABEL_14;
  }
LABEL_11:
  ++*a4;
  if (*((unsigned __int8 *)a2 + 9) > 1u)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    *a3 += 2;
  }
LABEL_14:
  v10 = *a2;
  if ((*a2 & 0x10) != 0)
  {
    ++*a4;
    *a3 += 3;
    v10 = *a2;
    if ((*a2 & 0x20) == 0)
    {
LABEL_16:
      if ((v10 & 0x40) == 0)
        goto LABEL_17;
      goto LABEL_33;
    }
  }
  else if ((v10 & 0x20) == 0)
  {
    goto LABEL_16;
  }
  ++*a4;
  *a3 += 2;
  v10 = *a2;
  if ((*a2 & 0x40) == 0)
  {
LABEL_17:
    if ((v10 & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_34;
  }
LABEL_33:
  ++*a4;
  *a3 += 2;
  v10 = *a2;
  if ((*a2 & 0x80) == 0)
  {
LABEL_18:
    if ((v10 & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_35;
  }
LABEL_34:
  ++*a4;
  *a3 += 2;
  v10 = *a2;
  if ((*a2 & 0x100) == 0)
  {
LABEL_19:
    if ((v10 & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_36;
  }
LABEL_35:
  ++*a4;
  *a3 += (*((_BYTE *)a2 + 72) + 1);
  v10 = *a2;
  if ((*a2 & 0x200) == 0)
  {
LABEL_20:
    if ((v10 & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_37;
  }
LABEL_36:
  ++*a4;
  *a3 += (*((_BYTE *)a2 + 123) + 1);
  v10 = *a2;
  if ((*a2 & 0x400) == 0)
  {
LABEL_21:
    if ((v10 & 0x800) == 0)
      goto LABEL_22;
    goto LABEL_38;
  }
LABEL_37:
  ++*a4;
  *a3 += 2;
  v10 = *a2;
  if ((*a2 & 0x800) == 0)
  {
LABEL_22:
    if ((v10 & 0x1000) == 0)
      goto LABEL_23;
    goto LABEL_39;
  }
LABEL_38:
  ++*a4;
  *a3 += 2;
  v10 = *a2;
  if ((*a2 & 0x1000) == 0)
  {
LABEL_23:
    if ((v10 & 0x2000) == 0)
      goto LABEL_24;
    goto LABEL_40;
  }
LABEL_39:
  ++*a4;
  *a3 += 2;
  v10 = *a2;
  if ((*a2 & 0x2000) == 0)
  {
LABEL_24:
    if ((v10 & 0x4000) == 0)
      goto LABEL_25;
    goto LABEL_41;
  }
LABEL_40:
  ++*a4;
  *a3 += 5;
  v10 = *a2;
  if ((*a2 & 0x4000) == 0)
  {
LABEL_25:
    if ((v10 & 0x10000) == 0)
      goto LABEL_26;
    goto LABEL_42;
  }
LABEL_41:
  ++*a4;
  *a3 += 2;
  v10 = *a2;
  if ((*a2 & 0x10000) == 0)
  {
LABEL_26:
    if ((v10 & 0x8000) == 0)
      goto LABEL_27;
    goto LABEL_43;
  }
LABEL_42:
  ++*a4;
  *a3 += 2;
  v10 = *a2;
  if ((*a2 & 0x8000) == 0)
  {
LABEL_27:
    if ((v10 & 0x20000) == 0)
      goto LABEL_28;
LABEL_44:
    ++*a4;
    *a3 += (*((_BYTE *)a2 + 183) + 1);
    if ((*a2 & 0x80000) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_43:
  ++*a4;
  *a3 += 6;
  v10 = *a2;
  if ((*a2 & 0x20000) != 0)
    goto LABEL_44;
LABEL_28:
  if ((v10 & 0x80000) != 0)
  {
LABEL_29:
    ++*a4;
    *a3 += 2;
  }
LABEL_30:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidatePropConfigParams");
  return v9;
}

uint64_t sub_2198F69B0(unsigned int *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSetConfPayload");
  if (a2 && a3)
  {
    v10 = a3;
    LODWORD(v11) = 1;
    HIDWORD(v11) = a4;
    v8 = sub_2198F6A74(a1, a2, &v10);
  }
  else
  {
    sub_219850628(2, a1, 3u, 2u, (uint64_t)"Invalid input parameters");
    v8 = 1;
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSetConfPayload");
  return v8;
}

uint64_t sub_2198F6A74(unsigned int *a1, uint64_t a2, uint64_t *a3)
{
  int v6;
  char v7;
  const char *v8;
  char v9;
  int v10;
  char v11;
  int v12;
  char v13;
  int v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  char v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  int v26;
  char v27;
  int v29;
  char v30;
  char v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  __int16 v35;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSetConfCmdPayload");
  v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 4) == 0)
  {
    if ((v6 & 0x10) != 0)
      goto LABEL_3;
LABEL_13:
    if ((v6 & 0x20) != 0)
      goto LABEL_29;
LABEL_14:
    if ((v6 & 0x40) != 0)
      goto LABEL_43;
LABEL_15:
    if ((v6 & 0x80) != 0)
      goto LABEL_60;
LABEL_16:
    if ((v6 & 0x100) != 0)
      goto LABEL_82;
LABEL_17:
    if ((v6 & 0x400) == 0)
      goto LABEL_102;
LABEL_18:
    sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildCommonParams");
    v9 = *(_BYTE *)(a2 + 544);
    if ((v9 & 1) != 0)
    {
      if (sub_2198B3E30(a1, a3, 0, 2, a2 + 548))
      {
LABEL_23:
        v8 = "phNciNfc_BuildCommonParams";
        goto LABEL_184;
      }
      v9 = *(_BYTE *)(a2 + 544);
    }
    if ((v9 & 4) != 0)
    {
      if (sub_2198B3E30(a1, a3, 0x80u, 1, a2 + 551))
        goto LABEL_23;
      v9 = *(_BYTE *)(a2 + 544);
    }
    if ((v9 & 8) != 0)
    {
      v21 = sub_2198B3E30(a1, a3, 0x81u, 1, a2 + 552);
      sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildCommonParams");
      if (v21)
        goto LABEL_185;
    }
    else
    {
      sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildCommonParams");
    }
    v6 = *(_DWORD *)(a2 + 4);
    goto LABEL_102;
  }
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPollNfcFParams");
  if ((*(_BYTE *)(a2 + 24) & 1) == 0 || sub_2198B3E30(a1, a3, 0x18u, 1, a2 + 28))
  {
    sub_219850628(2, a1, 3u, 2u, (uint64_t)"Poll Nfc-F disc config framing failed");
    v8 = "phNciNfc_BuildPollNfcFParams";
    goto LABEL_184;
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPollNfcFParams");
  v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x10) == 0)
    goto LABEL_13;
LABEL_3:
  v30 = 0;
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPollNfcDepParams");
  v7 = *(_BYTE *)(a2 + 88);
  if ((v7 & 1) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0x28u, 1, a2 + 92))
    {
LABEL_8:
      v8 = "phNciNfc_BuildPollNfcDepParams";
LABEL_184:
      sub_219850808(2, a1, 3u, 5u, (uint64_t)v8);
      goto LABEL_185;
    }
    v7 = *(_BYTE *)(a2 + 88);
  }
  if ((v7 & 2) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0x29u, *(unsigned __int8 *)(a2 + 141), a2 + 93))
      goto LABEL_8;
    v7 = *(_BYTE *)(a2 + 88);
  }
  if ((v7 & 4) != 0)
  {
    v30 = (8 * *(_BYTE *)(a2 + 144)) & 0x30 | (4 * (*(_BYTE *)(a2 + 144) & 1));
    v10 = sub_2198B3E30(a1, a3, 0x2Au, 1, (uint64_t)&v30);
    sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPollNfcDepParams");
    if (v10)
      goto LABEL_185;
  }
  else
  {
    sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPollNfcDepParams");
  }
  v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x20) == 0)
    goto LABEL_14;
LABEL_29:
  v31 = 0;
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcAParams");
  v11 = *(_BYTE *)(a2 + 148);
  if ((v11 & 1) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0x30u, 1, a2 + 152))
      goto LABEL_37;
    v11 = *(_BYTE *)(a2 + 148);
  }
  if ((v11 & 2) == 0)
    goto LABEL_35;
  if (sub_2198B3E30(a1, a3, 0x31u, 1, a2 + 153))
  {
LABEL_37:
    v8 = "phNciNfc_BuildLstnNfcAParams";
    goto LABEL_184;
  }
  v11 = *(_BYTE *)(a2 + 148);
LABEL_35:
  if ((v11 & 4) != 0)
  {
    v31 = 32 * (*(_BYTE *)(a2 + 156) & 3);
    if (sub_2198B3E30(a1, a3, 0x32u, 1, (uint64_t)&v31))
      goto LABEL_37;
    v11 = *(_BYTE *)(a2 + 148);
  }
  if ((v11 & 8) != 0)
  {
    v12 = sub_2198B3E30(a1, a3, 0x33u, *(unsigned __int8 *)(a2 + 170), a2 + 160);
    sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcAParams");
    if (v12)
      goto LABEL_185;
  }
  else
  {
    sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcAParams");
  }
  v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x40) == 0)
    goto LABEL_15;
LABEL_43:
  v32 = 0;
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcBParams");
  v13 = *(_BYTE *)(a2 + 172);
  if ((v13 & 1) != 0)
  {
    HIBYTE(v32) = *(_BYTE *)(a2 + 176) & 1;
    if (sub_2198B3E30(a1, a3, 0x38u, 1, (uint64_t)&v32 + 1))
      goto LABEL_54;
    v13 = *(_BYTE *)(a2 + 172);
  }
  if ((v13 & 2) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0x39u, 4, a2 + 180))
      goto LABEL_54;
    v13 = *(_BYTE *)(a2 + 172);
  }
  if ((v13 & 4) == 0)
    goto LABEL_52;
  if (sub_2198B3E30(a1, a3, 0x3Au, 4, a2 + 184))
  {
LABEL_54:
    v8 = "phNciNfc_BuildLstnNfcBParams";
    goto LABEL_184;
  }
  v13 = *(_BYTE *)(a2 + 172);
LABEL_52:
  if ((v13 & 8) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0x3Bu, 1, a2 + 188))
      goto LABEL_54;
    v13 = *(_BYTE *)(a2 + 172);
  }
  if ((v13 & 0x10) != 0)
  {
    LOBYTE(v32) = *(_BYTE *)(a2 + 192) & 1 | (4 * ((*(_BYTE *)(a2 + 192) >> 1) & 3));
    v14 = sub_2198B3E30(a1, a3, 0x3Cu, 1, (uint64_t)&v32);
    sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcBParams");
    if (v14)
      goto LABEL_185;
  }
  else
  {
    sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcBParams");
  }
  v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x80) == 0)
    goto LABEL_16;
LABEL_60:
  v34 = 0;
  v33 = 0;
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcFParams");
  v15 = *(_BYTE *)(a2 + 196);
  if ((v15 & 1) != 0)
  {
    HIBYTE(v34) = 2 * (*(_BYTE *)(a2 + 200) & 3);
    if (sub_2198B3E30(a1, a3, 0x54u, 1, (uint64_t)&v34 + 1))
      goto LABEL_71;
    v15 = *(_BYTE *)(a2 + 196);
  }
  if ((v15 & 2) != 0)
  {
    LOBYTE(v34) = 2 * (*(_BYTE *)(a2 + 204) & 1);
    if (sub_2198B3E30(a1, a3, 0x50u, 1, (uint64_t)&v34))
      goto LABEL_71;
    v15 = *(_BYTE *)(a2 + 196);
  }
  if ((v15 & 8) == 0)
    goto LABEL_69;
  if (sub_2198B3E30(a1, a3, 0x51u, 8, a2 + 369))
  {
LABEL_71:
    v8 = "phNciNfc_BuildLstnNfcFParams";
    goto LABEL_184;
  }
  v15 = *(_BYTE *)(a2 + 196);
LABEL_69:
  if ((v15 & 0x10) != 0)
  {
    v33 = bswap32(*(unsigned __int16 *)(a2 + 378)) >> 16;
    if (sub_2198B3E30(a1, a3, 0x53u, 2, (uint64_t)&v33))
      goto LABEL_71;
    v15 = *(_BYTE *)(a2 + 196);
  }
  if ((v15 & 4) != 0)
  {
    v16 = 0;
    v17 = a2 + 209;
    do
    {
      if (((*(unsigned __int16 *)(a2 + 378) >> v16) & 1) != 0)
      {
        sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetT3tTagId");
        v18 = (v16 & 0xFC) != 0 ? 0 : v16 + 64;
        sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetT3tTagId");
        if (sub_2198B3E30(a1, a3, v18, 10, v17))
          goto LABEL_71;
      }
      ++v16;
      v17 += 10;
    }
    while (v16 != 16);
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnNfcFParams");
  v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x100) == 0)
    goto LABEL_17;
LABEL_82:
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnIsoDepParams");
  v19 = *(_BYTE *)(a2 + 380);
  if ((v19 & 1) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0x58u, 1, a2 + 384))
      goto LABEL_90;
    v19 = *(_BYTE *)(a2 + 380);
  }
  if ((v19 & 2) == 0)
    goto LABEL_88;
  if (sub_2198B3E30(a1, a3, 0x59u, *(unsigned __int8 *)(a2 + 433), a2 + 385))
  {
LABEL_90:
    v8 = "phNciNfc_BuildLstnIsoDepParams";
    goto LABEL_184;
  }
  v19 = *(_BYTE *)(a2 + 380);
LABEL_88:
  if ((v19 & 4) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0x5Au, *(unsigned __int8 *)(a2 + 482), a2 + 434))
      goto LABEL_90;
    v19 = *(_BYTE *)(a2 + 380);
  }
  if ((v19 & 8) != 0)
  {
    v20 = sub_2198B3E30(a1, a3, 0x5Bu, 1, a2 + 483);
    sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnIsoDepParams");
    if (v20)
      goto LABEL_185;
  }
  else
  {
    sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildLstnIsoDepParams");
  }
  v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x400) != 0)
    goto LABEL_18;
LABEL_102:
  if ((v6 & 0x1000) == 0)
  {
    if ((v6 & 0x2000) == 0)
      goto LABEL_104;
LABEL_162:
    sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSwpConfigParams");
    v26 = *(_DWORD *)(a2 + 1128);
    if ((v26 & 2) != 0)
    {
      if (sub_2198B3E30(a1, a3, 0xA0D1u, 2, a2 + 1137))
        goto LABEL_183;
      v26 = *(_DWORD *)(a2 + 1128);
    }
    if ((v26 & 0x2000) != 0 && sub_2198B3E30(a1, a3, 0xA0D3u, 2, a2 + 1157))
      goto LABEL_183;
    v27 = *(_BYTE *)(a2 + 1132);
    if ((v27 & 1) != 0)
    {
      if (sub_2198B3E30(a1, a3, 0xA0ECu, 2, a2 + 1170))
        goto LABEL_183;
      v27 = *(_BYTE *)(a2 + 1132);
    }
    if ((v27 & 2) != 0)
    {
      if (sub_2198B3E30(a1, a3, 0xA0D4u, 2, a2 + 1171))
        goto LABEL_183;
      v27 = *(_BYTE *)(a2 + 1132);
    }
    if ((v27 & 4) != 0)
    {
      if (sub_2198B3E30(a1, a3, 0xA0EDu, 2, a2 + 1172))
        goto LABEL_183;
      v27 = *(_BYTE *)(a2 + 1132);
    }
    if ((v27 & 8) != 0)
    {
      if (sub_2198B3E30(a1, a3, 0xA0A2u, 2, a2 + 1173))
        goto LABEL_183;
      v27 = *(_BYTE *)(a2 + 1132);
    }
    if (((v27 & 0x20) == 0 || !sub_2198B3E30(a1, a3, 0xA0F2u, 2, a2 + 1175))
      && ((*(_BYTE *)(a2 + 1131) & 1) == 0 || !sub_2198B3E30(a1, a3, 0xA0F5u, 2, a2 + 1176)))
    {
      if ((*(_WORD *)(a2 + 1144) & 0x80) != 0)
      {
        v29 = sub_2198B3E30(a1, a3, 0xA0EBu, 9, a2 + 1392);
        sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSwpConfigParams");
        if (v29)
          goto LABEL_185;
      }
      else
      {
        sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSwpConfigParams");
      }
      v6 = *(_DWORD *)(a2 + 4);
      if ((v6 & 0x8000) == 0)
        goto LABEL_107;
      goto LABEL_105;
    }
LABEL_183:
    v8 = "phNciNfc_BuildSwpConfigParams";
    goto LABEL_184;
  }
  v35 = 0;
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSysConfigParams");
  v23 = *(_DWORD *)(a2 + 580);
  if ((v23 & 2) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0xA002u, 2, a2 + 586))
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 8) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0xA004u, 2, a2 + 587))
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 4) != 0)
  {
    HIBYTE(v35) = (*(_BYTE *)(a2 + 592) | (8 * *(_BYTE *)(a2 + 588))) & 0xF;
    v24 = sub_2198B3E30(a1, a3, 0xA003u, 2, (uint64_t)&v35 + 1);
    if (*(_DWORD *)(a2 + 588) == 1)
      v24 = sub_2198B3E30(a1, a3, 0xA011u, 5, a2 + 596);
    if (v24)
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x20) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0xA006u, 2, a2 + 601))
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x40) != 0)
  {
    LOBYTE(v35) = *(_BYTE *)(a2 + 604) | (2 * *(_BYTE *)(a2 + 608));
    if (sub_2198B3E30(a1, a3, 0xA007u, 2, (uint64_t)&v35))
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x80) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0xA00Fu, 65, a2 + 612))
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x1000) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0xA017u, (*(_BYTE *)(a2 + 682) + 1), a2 + 683))
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x2000) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0xA018u, (*(_BYTE *)(a2 + 714) + 1), a2 + 715))
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x4000) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0xA019u, 2, a2 + 932))
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x8000) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0xA0D5u, 2, a2 + 936))
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x20000) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0xA01Au, (*(_BYTE *)(a2 + 945) + 1), a2 + 941))
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x40000) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0xA01Bu, (*(_BYTE *)(a2 + 1042) + 1), a2 + 946))
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x80000) == 0)
    goto LABEL_154;
  if (sub_2198B3E30(a1, a3, 0xA027u, (*(_BYTE *)(a2 + 1071) + 1), a2 + 1043))
  {
LABEL_156:
    v8 = "phNciNfc_BuildSysConfigParams";
    goto LABEL_184;
  }
  v23 = *(_DWORD *)(a2 + 580);
LABEL_154:
  if ((v23 & 0x100000) != 0)
  {
    if (sub_2198B3E30(a1, a3, 0xA01Cu, (*(_BYTE *)(a2 + 1116) + 1), a2 + 1072))
      goto LABEL_156;
    v23 = *(_DWORD *)(a2 + 580);
  }
  if ((v23 & 0x10000) != 0)
  {
    v25 = sub_2198B3E30(a1, a3, 0xA037u, 2, a2 + 940);
    sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSysConfigParams");
    if (v25)
      goto LABEL_185;
  }
  else
  {
    sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSysConfigParams");
  }
  v6 = *(_DWORD *)(a2 + 4);
  if ((v6 & 0x2000) != 0)
    goto LABEL_162;
LABEL_104:
  if ((v6 & 0x8000) == 0)
    goto LABEL_107;
LABEL_105:
  if (sub_2198F8C44(a1, a3, (_WORD *)(a2 + 1408)))
    goto LABEL_185;
  v6 = *(_DWORD *)(a2 + 4);
LABEL_107:
  if ((v6 & 0x10000) != 0)
  {
    if (!sub_2198F8F1C(a1, a3, (int *)(a2 + 1536)))
    {
      v6 = *(_DWORD *)(a2 + 4);
      goto LABEL_110;
    }
LABEL_185:
    sub_219850628(2, a1, 3u, 1u, (uint64_t)"Framing failed!");
    v22 = 255;
    goto LABEL_186;
  }
LABEL_110:
  if ((v6 & 0x4000) != 0 && sub_2198F9294(a1, a3, (char *)(a2 + 1740)))
    goto LABEL_185;
  v22 = 0;
LABEL_186:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSetConfCmdPayload");
  return v22;
}

uint64_t sub_2198F77B0(unsigned int *a1, unsigned int a2, int *a3, _WORD *a4)
{
  uint64_t v8;
  int v9;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSetRtngParams");
  v8 = 1;
  if (!a2 || !a3 || !a4)
    goto LABEL_17;
  v8 = a2;
  while (1)
  {
    v9 = *a3;
    if (*a3 == 2)
    {
      if (sub_2198F79DC(a1, (uint64_t)a3, a4))
        goto LABEL_16;
      goto LABEL_13;
    }
    if (v9 != 1)
      break;
    if (sub_2198F7950(a1, (uint64_t)a3, a4))
      goto LABEL_16;
LABEL_13:
    a3 += 8;
    if (!--v8)
      goto LABEL_17;
  }
  if (!v9)
  {
    if (sub_2198F78C4(a1, (uint64_t)a3, a4))
      goto LABEL_16;
    goto LABEL_13;
  }
  sub_219850628(2, a1, 3u, 2u, (uint64_t)"Invalid routing type");
LABEL_16:
  v8 = 1;
LABEL_17:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateSetRtngParams");
  return v8;
}

uint64_t sub_2198F78C4(unsigned int *a1, uint64_t a2, _WORD *a3)
{
  uint64_t v6;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateTechBasedParams");
  if (*(unsigned __int8 *)(a2 + 4) == 255)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    *a3 += 5;
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateTechBasedParams");
  return v6;
}

uint64_t sub_2198F7950(unsigned int *a1, uint64_t a2, _WORD *a3)
{
  uint64_t v6;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateProtoBasedParams");
  if (*(unsigned __int8 *)(a2 + 4) == 255)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    *a3 += 5;
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateProtoBasedParams");
  return v6;
}

uint64_t sub_2198F79DC(unsigned int *a1, uint64_t a2, _WORD *a3)
{
  int v6;
  uint64_t v7;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateAidBasedParams");
  if (*(unsigned __int8 *)(a2 + 4) == 255 || (v6 = *(unsigned __int8 *)(a2 + 28), (v6 - 5) > 0xB))
  {
    v7 = 1;
  }
  else
  {
    v7 = 0;
    *a3 += v6 + 4;
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ValidateAidBasedParams");
  return v7;
}

uint64_t sub_2198F7A7C(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  unsigned int v8;
  int v9;
  _BYTE *Memory;
  char v11;
  uint64_t v12;
  __int16 v14;
  char v15;

  v15 = 0;
  v14 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRtngCmdHandler");
  if (a1)
  {
    v8 = sub_2198F7C00(a1, &v15, &v14);
    v9 = (unsigned __int16)(v14 + 2);
    Memory = (_BYTE *)phOsalNfc_GetMemory();
    v11 = v15;
    sub_2198F7D20((unsigned int *)a1, Memory, v8, (int *)(*(_QWORD *)(a1 + 4648) + 32 * *(unsigned __int8 *)(a1 + 865)), v15);
    *a3 = v11;
    *(_BYTE *)(a1 + 865) += v8;
    *(_BYTE *)(a1 + 864) = v11;
    *(_QWORD *)(a1 + 3736) = off_2550A4098;
    *(_BYTE *)(a1 + 3936) = 0;
    *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A4098);
    *(_QWORD *)(a1 + 848) = Memory;
    *(_DWORD *)(a1 + 856) = v9;
    *(_QWORD *)(a1 + 3384) = a2;
    *(_QWORD *)(a1 + 3712) = a4;
    v12 = sub_2198F48A4(a1, 0, 0);
    if ((_DWORD)v12 != 13)
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 848) = 0;
      *(_DWORD *)(a1 + 856) = 0;
      *(_WORD *)(a1 + 864) = 0;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Set Rtng table Sequence failed!");
    }
  }
  else
  {
    v12 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRtngCmdHandler");
  return v12;
}

uint64_t sub_2198F7C00(uint64_t a1, _BYTE *a2, _WORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  uint64_t v11;
  int *v12;
  __int16 v13;

  v6 = *(unsigned __int8 *)(a1 + 866);
  v7 = *(unsigned __int8 *)(a1 + 865);
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CalNumEntries");
  *a2 = 1;
  if (v6 <= v7)
  {
    v13 = 0;
LABEL_9:
    *a3 += v13;
    v9 = 1;
    goto LABEL_10;
  }
  v8 = 0;
  v9 = 0;
  v10 = v6 - v7;
  v11 = v6 - v7;
  v12 = (int *)(*(_QWORD *)(a1 + 4648) + 32 * v7);
  while (1)
  {
    v13 = sub_2198F8254((unsigned int *)a1, v12);
    v8 += v13;
    if (*(unsigned __int8 *)(a1 + 16) <= v8)
      break;
    *a3 += v13;
    ++v9;
    v12 += 8;
    if (!--v11)
    {
      v9 = v10;
      break;
    }
  }
  if (!v9)
    goto LABEL_9;
LABEL_10:
  if (*(unsigned __int8 *)(a1 + 865) + v9 >= v6)
    *a2 = 0;
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CalNumEntries");
  return v9;
}

uint64_t sub_2198F7D20(unsigned int *a1, _BYTE *a2, unsigned int a3, int *a4, char a5)
{
  uint64_t v10;
  int v11;
  int v12;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSetLstnRtngCmdPayload");
  *a2 = a5;
  a2[1] = a3;
  if (a3)
  {
    v10 = a3;
    v11 = 2;
    do
    {
      v12 = *a4;
      if (*a4 == 2)
      {
        v11 += sub_2198F8178(a1, &a2[v11], (uint64_t)a4);
      }
      else
      {
        if (v12 == 1)
        {
          sub_2198F80B8(a1, &a2[v11], (uint64_t)a4);
        }
        else
        {
          if (v12)
          {
            sub_219850628(2, a1, 3u, 2u, (uint64_t)"Unknown routing type");
            goto LABEL_11;
          }
          sub_2198F7FF8(a1, &a2[v11], (uint64_t)a4);
        }
        v11 += 5;
      }
LABEL_11:
      a4 += 8;
      --v10;
    }
    while (v10);
  }
  return sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSetLstnRtngCmdPayload");
}

uint64_t sub_2198F7E2C(unsigned int *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  int v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  const char *v13;
  int v14;
  char v15;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_VerifySupportedRouting");
  LOWORD(v8) = 1;
  if (!a2 || !a4)
    goto LABEL_30;
  if (!a3)
  {
    LOWORD(v8) = 0;
    goto LABEL_30;
  }
  v9 = 0;
  v10 = 0;
  v8 = 0;
  v11 = a3;
  v12 = (_BYTE *)(a4 + 8);
  v13 = "Techn based routing request but not supported by NFCC";
  while (1)
  {
    v14 = *((_DWORD *)v12 - 2);
    switch(v14)
    {
      case 2:
        v10 = v12;
        if ((*(_BYTE *)(a2 + 4) & 1) == 0)
        {
          v13 = "Aid based routing request but not supported by NFCC";
          goto LABEL_28;
        }
        break;
      case 1:
        if ((*(_BYTE *)(a2 + 4) & 2) == 0)
        {
          v13 = "Protocol based routing request but not supported by NFCC";
          goto LABEL_28;
        }
        goto LABEL_13;
      case 0:
        if ((*(_BYTE *)(a2 + 4) & 4) == 0)
          goto LABEL_28;
LABEL_13:
        v10 = (_BYTE *)(a4 + 32 * v9 + 8);
        break;
    }
    if (v8 || !v10)
      goto LABEL_23;
    if ((*v10 & 4) == 0 || (*(_BYTE *)(a2 + 8) & 2) != 0)
      break;
    sub_219850628(2, a1, 3u, 2u, (uint64_t)"Battery off pow state requested but not supported");
    v8 = 255;
    v15 = 1;
    if ((*v10 & 2) != 0)
      goto LABEL_21;
LABEL_22:
    if ((v15 & 1) != 0)
      goto LABEL_29;
LABEL_23:
    ++v9;
    v12 += 32;
    if (!--v11)
      goto LABEL_30;
  }
  v15 = 0;
  v8 = 0;
  if ((*v10 & 2) == 0)
    goto LABEL_22;
LABEL_21:
  if ((*(_BYTE *)(a2 + 8) & 1) != 0)
    goto LABEL_22;
  v13 = "Switched off pow state requested but not supported";
LABEL_28:
  sub_219850628(2, a1, 3u, 2u, (uint64_t)v13);
LABEL_29:
  sub_219850628(2, a1, 3u, 2u, (uint64_t)"Input Routing type not supported by NFCC");
  LOWORD(v8) = 255;
LABEL_30:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_VerifySupportedRouting");
  return (unsigned __int16)v8;
}

uint64_t sub_2198F7FF8(unsigned int *a1, _BYTE *a2, uint64_t a3)
{
  char v6;
  char v7;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateTechRtngParams");
  *a2 = *(_DWORD *)a3;
  a2[1] = 3;
  a2[2] = *(_BYTE *)(a3 + 4);
  a2[3] = 0;
  v6 = *(_BYTE *)(a3 + 8);
  a2[3] = v6 & 1;
  v7 = *(_BYTE *)(a3 + 8) & 2 | v6 & 1;
  a2[3] = v7;
  a2[3] = *(_BYTE *)(a3 + 8) & 4 | v7;
  a2[4] = *(_DWORD *)(a3 + 12);
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateTechRtngParams");
  return 5;
}

uint64_t sub_2198F80B8(unsigned int *a1, _BYTE *a2, uint64_t a3)
{
  char v6;
  char v7;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateProtoRtngParams");
  *a2 = *(_DWORD *)a3;
  a2[1] = 3;
  a2[2] = *(_BYTE *)(a3 + 4);
  a2[3] = 0;
  v6 = *(_BYTE *)(a3 + 8);
  a2[3] = v6 & 1;
  v7 = *(_BYTE *)(a3 + 8) & 2 | v6 & 1;
  a2[3] = v7;
  a2[3] = *(_BYTE *)(a3 + 8) & 4 | v7;
  a2[4] = *(_DWORD *)(a3 + 12);
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateProtoRtngParams");
  return 5;
}

uint64_t sub_2198F8178(unsigned int *a1, _BYTE *a2, uint64_t a3)
{
  char v6;
  char v7;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateAidRtngParams");
  *a2 = *(_DWORD *)a3;
  a2[1] = *(_BYTE *)(a3 + 28) + 2;
  a2[2] = *(_BYTE *)(a3 + 4);
  a2[3] = 0;
  v6 = *(_BYTE *)(a3 + 8);
  a2[3] = v6 & 1;
  v7 = *(_BYTE *)(a3 + 8) & 2 | v6 & 1;
  a2[3] = v7;
  a2[3] = *(_BYTE *)(a3 + 8) & 4 | v7;
  phOsalNfc_MemCopy();
  LOBYTE(a3) = *(_BYTE *)(a3 + 28) + 4;
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateAidRtngParams");
  return a3;
}

uint64_t sub_2198F8254(unsigned int *a1, int *a2)
{
  int v4;
  char v5;
  unsigned __int8 v6;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_EntrySize");
  v4 = *a2;
  if (*a2 == 2)
  {
    v6 = *((_BYTE *)a2 + 28) + 4;
  }
  else
  {
    if (v4)
      v5 = 0;
    else
      v5 = 5;
    if (v4 == 1)
      v6 = 5;
    else
      v6 = v5;
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_EntrySize");
  return v6;
}

uint64_t sub_2198F82E0(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = 0;
  sub_219850718(2, (unsigned int *)a2, 3u, 5u, (uint64_t)"phNciNfc_GetLstnNtfTimeoutHandler");
  if (!a2)
    goto LABEL_6;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 4);
    if ((v4 & 1) != 0)
      break;
    v4 = 1;
    v5 = 1;
  }
  while (v6 != a2);
  if (v6 == a2)
  {
    v7 = (_BYTE *)(a2 + 6464);
    if (!*(_BYTE *)(a2 + 6464))
    {
      sub_21988C4AC(*(_DWORD *)(a2 + 6476), *(_QWORD *)(a2 + 4656));
      if (!phOsalNfc_Timer_Start())
      {
        sub_219850628(1, (unsigned int *)(a2 + 6476), 3u, 4u, (uint64_t)"Get Listen Mode Ntf Handler timer restarted for extended time\n");
        *v7 = 1;
        return sub_219850808(2, (unsigned int *)a2, 3u, 5u, (uint64_t)"phNciNfc_GetLstnNtfTimeoutHandler");
      }
      sub_219850628(1, (unsigned int *)(a2 + 6476), 3u, 1u, (uint64_t)"Get Listen Mode Ntf Handler timer failed to start for extended time\n\n");
    }
    sub_21988629C(2, (unsigned int *)a2, a1, 3u, 4u, (uint64_t)"phNciNfc_GetLstnNtfTimeoutHandler");
    sub_219850628(1, (unsigned int *)(a2 + 6476), 3u, 4u, (uint64_t)"#######Get Listen Mode routing notification TIMEOUT########\n");
    phOsalNfc_Timer_Stop();
    *v7 = 0;
    v9 = 0x100000003;
    LODWORD(v10) = 2;
    sub_2198F3088((unsigned int *)(a2 + 888), (uint64_t)&v9, (uint64_t)sub_2198F84C8);
    sub_2198E23C4(a2, 255, 0);
  }
  else
  {
LABEL_6:
    sub_219850628(2, (unsigned int *)a2, 3u, 1u, (uint64_t)"Nci context null (phNciNfc_GetLstnNtfTimeoutHandler)\n");
  }
  return sub_219850808(2, (unsigned int *)a2, 3u, 5u, (uint64_t)"phNciNfc_GetLstnNtfTimeoutHandler");
}

uint64_t sub_2198F84C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6;
  unsigned __int8 *v7;
  int v8;
  int v9;
  unsigned __int8 v10;
  int v11;
  _BOOL4 v12;
  int v13;
  uint64_t Memory;
  int v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  uint64_t v27;
  unsigned int v28;
  int v29;
  char v30;
  char v31;
  unsigned int v32;
  char v33;
  char v34;
  unsigned int v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _BYTE *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v42 = 0;
  v43 = 0;
  v40 = 0;
  v41 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngConfigNtfCb");
  if (!a1 || !a2)
    goto LABEL_72;
  phOsalNfc_Timer_Stop();
  *(_BYTE *)(a1 + 6464) = 0;
  sub_21988629C(1, (unsigned int *)(a1 + 6476), *(_QWORD *)(a1 + 4656), 3u, 4u, (uint64_t)"phNciNfc_GetRtngConfigNtfCb");
  phOsalNfc_SetMemory();
  if ((_DWORD)a3 || (v6 = *(_DWORD *)(a2 + 16), v6 < 2))
  {
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid notification payload length!");
    goto LABEL_9;
  }
  v7 = *(unsigned __int8 **)(a2 + 8);
  v8 = *v7;
  v9 = v7[1];
  v10 = v6 - 2;
  v11 = *(unsigned __int8 *)(a1 + 864);
  v12 = (v11 | v8) == 0;
  if (v11 | v8)
  {
    if (*(_BYTE *)(a1 + 864) || v8 != 1)
    {
      if (v11 == 1 && v8 == 1)
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Received next Rtng ntf with more set to '1'");
        v15 = 0;
        v16 = *(_QWORD *)(a1 + 872);
        *(_BYTE *)(a1 + 864) = 1;
        if (!v16)
          goto LABEL_48;
      }
      else
      {
        v15 = 1;
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Received last Rtng ntf with more set to '0'");
        *(_BYTE *)(a1 + 864) = v8;
        if (!*(_QWORD *)(a1 + 872))
          goto LABEL_23;
      }
LABEL_22:
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Copying received Rtng ntf payload to ntf buffer");
      phOsalNfc_MemCopy();
      *(_WORD *)(a1 + 880) += v10;
      *(_BYTE *)(a1 + 866) += v9;
      if (v15)
        goto LABEL_23;
LABEL_48:
      a3 = 0;
      goto LABEL_72;
    }
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Received first Rtng ntf with more set to '1'");
    if (*(_QWORD *)(a1 + 872))
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 872) = 0;
    }
    Memory = phOsalNfc_GetMemory();
    *(_QWORD *)(a1 + 872) = Memory;
    if (Memory)
    {
      v15 = 0;
      *(_BYTE *)(a1 + 864) = 1;
      goto LABEL_22;
    }
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Failed to allocate memory for storing notification payload");
    *(_BYTE *)(a1 + 864) = 1;
LABEL_9:
    LOBYTE(v42) = 0;
    v13 = 1;
    goto LABEL_58;
  }
  sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Only one notification is received to read listen mode routing table");
  *(_BYTE *)(a1 + 864) = 0;
  *(_BYTE *)(a1 + 866) = v9;
  if (v9)
  {
    *(_QWORD *)(a1 + 872) = *(_QWORD *)(a2 + 8) + 2;
    *(_WORD *)(a1 + 880) = v10;
  }
  else
  {
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Listen mode routing table is empty. No of entries: 0");
  }
LABEL_23:
  v13 = !v12;
  sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Processing Rtng ntf...");
  v46 = 0;
  v47 = 0;
  v17 = *(unsigned __int8 *)(a1 + 866);
  v45 = 0;
  v44 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessGetRtngNtf");
  LOBYTE(v42) = 0;
  if (v17)
  {
    v18 = sub_2198B3FD4((unsigned int *)a1, *(_QWORD *)(a1 + 872), *(unsigned __int16 *)(a1 + 880));
    if (v18 == 255)
    {
      v36 = "Inconsistent TLVs received!";
    }
    else if (v18)
    {
      v36 = "Invalid input parameter sent!";
    }
    else
    {
      if (v43)
      {
        phOsalNfc_FreeMemory();
        v43 = 0;
      }
      v43 = phOsalNfc_GetMemory();
      if (v43)
      {
        v19 = 0;
        LOBYTE(v42) = v17;
        v46 = *(_QWORD *)(a1 + 872);
        v20 = *(unsigned __int16 *)(a1 + 880);
        LODWORD(v47) = 0;
        HIDWORD(v47) = v20;
        while (1)
        {
          v21 = sub_2198B40A4((unsigned int *)a1, &v46, (_BYTE *)&v45 + 1, &v45, &v44);
          if (v21)
            break;
          v22 = HIBYTE(v45);
          v23 = v45;
          v24 = v43;
          v25 = v44;
          sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessRtngEntry");
          if (v22 == 2)
          {
            v27 = v43 + v19;
            *(_DWORD *)v27 = 2;
            *(_BYTE *)(v27 + 4) = *v25;
            v28 = v25[1];
            if (v28 > 0xF)
            {
              v29 = 255;
            }
            else
            {
              v29 = 0;
              v30 = *(_BYTE *)(v27 + 8) & 0xFE | v28 & 1;
              *(_BYTE *)(v27 + 8) = v30;
              v31 = v30 & 0xFD | v25[1] & 2;
              *(_BYTE *)(v27 + 8) = v31;
              *(_BYTE *)(v27 + 8) = v31 & 0xFB | v25[1] & 4;
            }
            v35 = v23 - 2;
            if (v35 >= 0x11)
            {
              sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Received AID length exceeded Max AID Length");
LABEL_75:
              sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessRtngEntry");
              goto LABEL_57;
            }
            phOsalNfc_MemCopy();
            *(_BYTE *)(v24 + v19 + 28) = v35;
          }
          else
          {
            if (v22 == 1)
            {
              v26 = v43 + v19;
              *(_DWORD *)(v43 + v19) = 1;
            }
            else
            {
              if (v22)
                goto LABEL_75;
              v26 = v43 + v19;
              *(_DWORD *)(v43 + v19) = 0;
            }
            *(_BYTE *)(v26 + 4) = *v25;
            v32 = v25[1];
            if (v32 > 0xF)
            {
              v29 = 255;
            }
            else
            {
              v29 = 0;
              v33 = *(_BYTE *)(v26 + 8) & 0xFE | v32 & 1;
              *(_BYTE *)(v26 + 8) = v33;
              v34 = v33 & 0xFD | v25[1] & 2;
              *(_BYTE *)(v26 + 8) = v34;
              *(_BYTE *)(v26 + 8) = v34 & 0xFB | v25[1] & 4;
            }
            *(_DWORD *)(v26 + 12) = v25[2];
          }
          sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessRtngEntry");
          if (v29)
            goto LABEL_57;
          v19 += 32;
          if (!--v17)
            goto LABEL_47;
        }
        if (v21 == 255)
          v36 = "Get Tlv failed!";
        else
          v36 = "Invalid parameter passed";
      }
      else
      {
        v36 = "Failed to allocate trans info buffer!";
      }
    }
    sub_219850628(2, (unsigned int *)a1, 3u, 1u, (uint64_t)v36);
LABEL_57:
    sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessGetRtngNtf");
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Rxd Routing Entries Validation Failed!");
    LOBYTE(v42) = 0;
  }
  else
  {
LABEL_47:
    sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessGetRtngNtf");
  }
LABEL_58:
  v40 = 0x100000003;
  LODWORD(v41) = 2;
  v37 = sub_2198F3088((unsigned int *)(a1 + 888), (uint64_t)&v40, (uint64_t)sub_2198F84C8);
  a3 = v37;
  if ((_DWORD)v37 == 255)
  {
    v38 = "De-register Rtng Notificaion call back failed!";
LABEL_65:
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)v38);
    goto LABEL_66;
  }
  if ((_DWORD)v37 == 52)
  {
    v38 = "Rtng Notificaion call back not registered!";
    goto LABEL_65;
  }
  if ((_DWORD)v37)
  {
    v38 = "Invalid parameter passed!";
    goto LABEL_65;
  }
  sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"De-register Rtng ntf call back success");
LABEL_66:
  if (*(_QWORD *)(a1 + 872))
  {
    if (v13)
      phOsalNfc_FreeMemory();
    *(_QWORD *)(a1 + 872) = 0;
    *(_WORD *)(a1 + 880) = 0;
    *(_BYTE *)(a1 + 866) = 0;
    *(_BYTE *)(a1 + 864) = 0;
  }
  sub_219881B80((unsigned int *)a1, (unsigned __int8 *)&v42, a3);
  sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Notifying upper layer...");
  phOsalNfc_MemCopy();
  sub_2198E23C4(a1, a3, a1 + 6928);
  if (v43)
  {
    phOsalNfc_FreeMemory();
    v43 = 0;
  }
LABEL_72:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngConfigNtfCb");
  return a3;
}

BOOL sub_2198F8C44(unsigned int *a1, uint64_t *a2, _WORD *a3)
{
  int v6;
  __int16 v7;
  _BOOL8 v8;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildNxpRfDiscConfigParams");
  if ((*a3 & 0x10) == 0 || (v6 = sub_2198B3E30(a1, a2, 0xA044u, 2, (uint64_t)a3 + 13)) == 0)
  {
    v7 = a3[2];
    if ((v7 & 1) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA04Du, 7, (uint64_t)a3 + 29);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 2) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA04Eu, 7, (uint64_t)a3 + 35);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 4) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA04Fu, 7, (uint64_t)a3 + 41);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 8) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA050u, 7, (uint64_t)a3 + 47);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 0x10) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA051u, 7, (uint64_t)a3 + 53);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 0x20) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA052u, 7, (uint64_t)a3 + 59);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 0x40) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA053u, 7, (uint64_t)a3 + 65);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 0x80) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA054u, 7, (uint64_t)a3 + 71);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 0x100) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA055u, 7, (uint64_t)a3 + 77);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 0x200) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA056u, 7, (uint64_t)a3 + 83);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 0x400) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA057u, 7, (uint64_t)a3 + 89);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 0x800) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA058u, 7, (uint64_t)a3 + 95);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 0x1000) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA059u, 7, (uint64_t)a3 + 101);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 0x2000) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA05Au, 7, (uint64_t)a3 + 107);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if ((v7 & 0x4000) != 0)
    {
      v6 = sub_2198B3E30(a1, a2, 0xA05Bu, 7, (uint64_t)a3 + 113);
      if (v6)
        goto LABEL_51;
      v7 = a3[2];
    }
    if (v7 < 0)
      v6 = sub_2198B3E30(a1, a2, 0xA05Cu, 7, (uint64_t)a3 + 119);
    else
      v6 = 0;
  }
LABEL_51:
  v8 = v6 != 0;
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildNxpRfDiscConfigParams");
  return v8;
}

BOOL sub_2198F8F1C(unsigned int *a1, uint64_t *a2, int *a3)
{
  int v6;
  unsigned int v7;
  int v8;
  char v9;
  char v10;
  int v11;
  _BOOL8 v12;
  _BYTE v14[5];
  __int16 v15;

  v15 = 0;
  memset(v14, 0, sizeof(v14));
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPropConfigParams");
  v6 = *a3;
  if ((*a3 & 0x10) == 0)
    goto LABEL_20;
  v7 = *((unsigned __int16 *)a3 + 8);
  v8 = v7 & 0x22;
  if ((v7 & 0x1F) == 0 && v8 != 34)
  {
    if ((v7 & 0x40) == 0)
      goto LABEL_5;
LABEL_11:
    v9 = 2;
    HIBYTE(v15) = 2;
    if ((v7 & 0x80) == 0)
      goto LABEL_13;
    goto LABEL_12;
  }
  if (v8 == 34)
    v10 = (v7 >> 1) & 7 | (16 * (v7 & 1)) & 0xBF | (((v7 & 0x10) != 0) << 6) | 8;
  else
    v10 = (v7 >> 1) & 7 | (16 * (v7 & 1)) & 0xBF | (((v7 & 0x10) != 0) << 6);
  LOBYTE(v15) = v10;
  if ((v7 & 0x40) != 0)
    goto LABEL_11;
LABEL_5:
  v9 = 0;
  if ((v7 & 0x80) != 0)
  {
LABEL_12:
    v9 |= 4u;
    HIBYTE(v15) = v9;
  }
LABEL_13:
  if ((v7 & 0x100) != 0)
  {
    v9 |= 8u;
    HIBYTE(v15) = v9;
    if ((v7 & 0x200) == 0)
    {
LABEL_15:
      if ((v7 & 0x400) == 0)
        goto LABEL_16;
LABEL_63:
      v9 |= 0x40u;
      HIBYTE(v15) = v9;
      if ((v7 & 0x800) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
  }
  else if ((v7 & 0x200) == 0)
  {
    goto LABEL_15;
  }
  v9 |= 0x10u;
  HIBYTE(v15) = v9;
  if ((v7 & 0x400) != 0)
    goto LABEL_63;
LABEL_16:
  if ((v7 & 0x800) != 0)
LABEL_17:
    HIBYTE(v15) = v9 | 0x20;
LABEL_18:
  v11 = sub_2198B3E30(a1, a2, 0xA01Du, 3, (uint64_t)&v15);
  if (v11)
    goto LABEL_66;
  v6 = *a3;
LABEL_20:
  if ((v6 & 0x20) != 0)
  {
    v11 = sub_2198B3E30(a1, a2, 0xA039u, 2, (uint64_t)(a3 + 5));
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x40) != 0)
  {
    v11 = sub_2198B3E30(a1, a2, 0xA0FAu, 2, (uint64_t)a3 + 10);
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x80) != 0)
  {
    v11 = sub_2198B3E30(a1, a2, 0xA040u, 2, (uint64_t)a3 + 21);
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x100) != 0)
  {
    v11 = sub_2198B3E30(a1, a2, 0xA068u, (*((_BYTE *)a3 + 72) + 1), (uint64_t)a3 + 22);
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x200) != 0)
  {
    v11 = sub_2198B3E30(a1, a2, 0xA0C4u, (*((_BYTE *)a3 + 123) + 1), (uint64_t)a3 + 73);
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x400) != 0)
  {
    v11 = sub_2198B3E30(a1, a2, 0xA0BCu, 2, (uint64_t)(a3 + 31));
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x800) != 0)
  {
    v11 = sub_2198B3E30(a1, a2, 0xA08Fu, 2, (uint64_t)a3 + 11);
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x1000) != 0)
  {
    v11 = sub_2198B3E30(a1, a2, 0xA08Eu, 2, (uint64_t)a3 + 125);
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x2000) != 0)
  {
    v11 = sub_2198B3E30(a1, a2, 0xA00Du, 5, (uint64_t)(a3 + 50));
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x4000) != 0)
  {
    v11 = sub_2198B3E30(a1, a2, 0xA0BFu, 2, (uint64_t)(a3 + 3));
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x10000) != 0)
  {
    v11 = sub_2198B3E30(a1, a2, 0xA111u, 2, (uint64_t)(a3 + 33));
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x20000) != 0)
  {
    v11 = sub_2198B3E30(a1, a2, 0xA110u, (*((_BYTE *)a3 + 183) + 1), (uint64_t)a3 + 133);
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x8000) != 0)
  {
    v14[0] = *((_BYTE *)a3 + 126) | (2 * *((_BYTE *)a3 + 127));
    *(_DWORD *)&v14[1] = a3[32];
    v11 = sub_2198B3E30(a1, a2, 0xA0E7u, 6, (uint64_t)v14);
    if (v11)
      goto LABEL_66;
    v6 = *a3;
  }
  if ((v6 & 0x80000) != 0)
    v11 = sub_2198B3E30(a1, a2, 0xA137u, 2, (uint64_t)a3 + 13);
  else
    v11 = 0;
LABEL_66:
  v12 = v11 != 0;
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildPropConfigParams");
  return v12;
}

BOOL sub_2198F9294(unsigned int *a1, uint64_t *a2, char *a3)
{
  char v6;
  int v7;
  _BOOL8 v8;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSmbConfigParams");
  if (a3)
  {
    v6 = *a3;
    if ((*a3 & 1) != 0)
    {
      v7 = sub_2198B3E30(a1, a2, 0xA070u, 4, (uint64_t)(a3 + 4));
      if (v7)
        goto LABEL_15;
      v6 = *a3;
    }
    if ((v6 & 2) != 0)
    {
      v7 = sub_2198B3E30(a1, a2, 0xA071u, 2, (uint64_t)(a3 + 7));
      if (v7)
        goto LABEL_15;
      v6 = *a3;
    }
    if ((v6 & 4) == 0)
      goto LABEL_11;
    v7 = sub_2198B3E30(a1, a2, 0xA077u, 3, (uint64_t)(a3 + 8));
    if (!v7)
    {
      v6 = *a3;
LABEL_11:
      if ((v6 & 8) != 0)
        v7 = sub_2198B3E30(a1, a2, 0xA07Au, 17, (uint64_t)(a3 + 10));
      else
        v7 = 0;
    }
LABEL_15:
    v8 = v7 != 0;
    goto LABEL_16;
  }
  v8 = 1;
LABEL_16:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_BuildSmbConfigParams");
  return v8;
}

uint64_t sub_2198F93A4(unsigned int *a1, int a2, __int16 a3, _WORD *a4, _BYTE *a5)
{
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysConfigParams");
  if (a2 == 1)
  {
    ++*a5;
    *a4 += a3;
  }
  return sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_ParseSysConfigParams");
}

uint64_t sub_2198F9434(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  unsigned int v8;
  int v9;
  char v10;
  int v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  _BOOL4 v16;
  char v17;
  int v18;
  int v19;
  char v20;
  unsigned int *v21;
  const char *v22;
  char v23;
  char v24;
  int v25;
  unsigned int v26;
  _BYTE *v27;
  char v28;
  unint64_t v29;
  char v30;
  unsigned int v31;
  int v32;
  char v33;
  unsigned int v34;
  char v35;
  unsigned int v36;
  char v37;
  unsigned __int8 v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned __int8 v42;
  __int16 v43;
  __int16 v44;
  int v45;
  unsigned int v46;
  int v47;
  int v48;
  unsigned int v50;
  unsigned int v51;
  int v52;
  unsigned int v53;
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  unsigned int v57;
  int v58;
  int v59;
  unsigned __int8 v60;
  uint64_t v61;
  int v62;
  unint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  BOOL v67;
  _BOOL4 v68;
  char v70;
  unsigned __int8 v71;
  int v73;
  _BYTE v74[98];
  _OWORD v75[6];
  __int16 v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessRfParams");
  if ((_DWORD)a2)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v73 = a4;
    while (1)
    {
      v12 = (char *)(a3 + v11);
      if (a4 != 1)
      {
        v17 = *v12;
        if ((*v12 & 0xFE) == 0xA0)
          v18 = *(unsigned __int8 *)(a3 + v8 + 2);
        else
          v18 = *(unsigned __int8 *)(a3 + v8 + 1);
        v16 = v18 != 0;
        goto LABEL_214;
      }
      v13 = a2;
      v14 = *(_QWORD *)(a1 + 4648);
      sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreRfParams");
      v15 = *v12;
      if (v15 == 24)
      {
        sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StorePollABFParams");
        if (v12[1] == 1 && *v12 == 24)
        {
          v16 = 0;
          *(_BYTE *)(v14 + 28) = v12[2];
          *(_DWORD *)(v14 + 4) |= 4u;
          *(_BYTE *)(v14 + 24) |= 1u;
        }
        else
        {
          v16 = 1;
        }
        v21 = (unsigned int *)a1;
        v22 = "phNciNfc_StorePollABFParams";
        goto LABEL_212;
      }
      if (*v12)
        break;
      if (v12[1] != 2)
        goto LABEL_80;
      phOsalNfc_MemCopy();
      v16 = 0;
      *(_DWORD *)(v14 + 4) |= 0x400u;
      *(_BYTE *)(v14 + 544) |= 1u;
LABEL_213:
      a2 = v13;
      sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreRfParams");
      v17 = *v12;
      a4 = v73;
LABEL_214:
      if ((v17 & 0xFE) == 0xA0)
      {
        v74[v9] = v17;
        v17 = *(_BYTE *)(a3 + v8 + 1);
        v45 = 3;
        v46 = 2;
        ++v9;
      }
      else
      {
        v45 = 2;
        v46 = 1;
      }
      v74[v9] = v17;
      v47 = *(unsigned __int8 *)(a3 + v46 + (unint64_t)v8);
      v48 = v45 + v11;
      v11 = v48 + v47;
      ++v9;
      ++v10;
      v8 = (v48 + v47);
      if (v8 >= a2 || v16)
        goto LABEL_241;
    }
    if ((v15 - 40) <= 2)
    {
      sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StorePollIsoNfcDepParams");
      v19 = *v12;
      switch(v19)
      {
        case '*':
          v25 = v12[2];
          if ((~v25 & 0x30) == 0)
          {
            *(_BYTE *)(v14 + 144) |= 1u;
            LOBYTE(v25) = v12[2];
          }
          if ((v25 & 4) != 0)
            *(_BYTE *)(v14 + 144) = *(_BYTE *)(v14 + 144) & 0xF9 | 2;
          v20 = 4;
          break;
        case ')':
          v26 = v12[1];
          if (v26 > 0x30)
            goto LABEL_40;
          *(_BYTE *)(v14 + 141) = v26;
          phOsalNfc_MemCopy();
          v20 = 2;
          break;
        case '(':
          *(_BYTE *)(v14 + 92) = v12[2];
          v20 = 1;
          break;
        default:
LABEL_40:
          v16 = 1;
LABEL_41:
          v21 = (unsigned int *)a1;
          v22 = "phNciNfc_StorePollIsoNfcDepParams";
          goto LABEL_212;
      }
      v16 = 0;
      *(_DWORD *)(v14 + 4) |= 0x10u;
      *(_BYTE *)(v14 + 88) |= v20;
      goto LABEL_41;
    }
    if ((v15 & 0xFC) == 0x30)
    {
      sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreListenAParams");
      switch(*v12)
      {
        case '0':
          if (v12[1] != 1)
            goto LABEL_55;
          *(_BYTE *)(v14 + 152) = v12[2];
          v23 = 1;
          goto LABEL_210;
        case '1':
          if (v12[1] != 1)
            goto LABEL_55;
          *(_BYTE *)(v14 + 153) = v12[2];
          v23 = 2;
          goto LABEL_210;
        case '2':
          if (v12[1] != 1)
            goto LABEL_55;
          HIDWORD(v29) = v12[2];
          LODWORD(v29) = HIDWORD(v29);
          switch((v29 >> 5))
          {
            case 0u:
              v30 = *(_BYTE *)(v14 + 156) & 0xFC;
              break;
            case 1u:
              v30 = *(_BYTE *)(v14 + 156) | 1;
              break;
            case 2u:
              v30 = *(_BYTE *)(v14 + 156) | 2;
              break;
            case 3u:
              v30 = *(_BYTE *)(v14 + 156) | 3;
              break;
            default:
              v30 = *(_BYTE *)(v14 + 156) | 4;
              break;
          }
          *(_BYTE *)(v14 + 156) = v30;
          v23 = 4;
          goto LABEL_210;
        case '3':
          v31 = v12[1];
          v16 = 1;
          if (v31 > 0xA || ((1 << v31) & 0x490) == 0)
            break;
          *(_BYTE *)(v14 + 170) = v31;
          phOsalNfc_MemCopy();
          v23 = 8;
LABEL_210:
          v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x20u;
          *(_BYTE *)(v14 + 148) |= v23;
          break;
        default:
LABEL_55:
          v16 = 1;
          break;
      }
      v21 = (unsigned int *)a1;
      v22 = "phNciNfc_StoreListenAParams";
      goto LABEL_212;
    }
    if ((v15 - 56) <= 4)
    {
      sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreListenBParams");
      v16 = 1;
      switch(*v12)
      {
        case '8':
          if (v12[1] == 1)
          {
            if ((v12[2] & 1) != 0)
              *(_BYTE *)(v14 + 176) |= 1u;
            v24 = 1;
            goto LABEL_72;
          }
          break;
        case '9':
          if (v12[1] == 4)
          {
            phOsalNfc_MemCopy();
            v24 = 2;
            goto LABEL_72;
          }
          break;
        case ':':
          if (v12[1] == 4)
          {
            phOsalNfc_MemCopy();
            v24 = 4;
            goto LABEL_72;
          }
          break;
        case '<':
          if (v12[1] == 1)
          {
            v34 = v12[2];
            v35 = *(_BYTE *)(v14 + 192);
            if ((v34 & 1) != 0)
            {
              v35 |= 1u;
              *(_BYTE *)(v14 + 192) = v35;
              v34 = v12[2];
            }
            *(_BYTE *)(v14 + 192) = (v34 >> 1) & 6 | v35 & 0xF9;
            v24 = 16;
LABEL_72:
            v16 = 0;
            *(_DWORD *)(v14 + 4) |= 0x40u;
            *(_BYTE *)(v14 + 172) |= v24;
          }
          break;
        default:
          break;
      }
      v21 = (unsigned int *)a1;
      v22 = "phNciNfc_StoreListenBParams";
      goto LABEL_212;
    }
    if ((v15 - 64) <= 0x14)
    {
      sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreListenFParams");
      v16 = 1;
      switch(*v12)
      {
        case '@':
          if (v12[1] == 10)
            goto LABEL_86;
          break;
        case 'A':
          if (v12[1] == 10)
            goto LABEL_86;
          break;
        case 'B':
          if (v12[1] == 10)
            goto LABEL_86;
          break;
        case 'C':
          if (v12[1] == 10)
          {
LABEL_86:
            phOsalNfc_MemCopy();
            v16 = 0;
            goto LABEL_87;
          }
          break;
        case 'P':
          if (v12[1] == 1)
          {
            if ((v12[2] & 2) != 0)
              *(_BYTE *)(v14 + 204) |= 1u;
            v16 = 0;
            *(_DWORD *)(v14 + 4) |= 0x80u;
            v37 = *(_BYTE *)(v14 + 196) | 2;
            goto LABEL_98;
          }
          break;
        case 'Q':
          if (v12[1] == 8)
          {
            phOsalNfc_MemCopy();
            v16 = 0;
            *(_DWORD *)(v14 + 4) |= 0x80u;
            v37 = *(_BYTE *)(v14 + 196) | 8;
            goto LABEL_98;
          }
          break;
        case 'R':
          if (v12[1] == 1)
          {
            v16 = 0;
            *(_BYTE *)(v14 + 208) = v12[2];
            *(_DWORD *)(v14 + 4) |= 0x80u;
            v37 = *(_BYTE *)(v14 + 196) | 0x20;
            goto LABEL_98;
          }
          break;
        case 'S':
          if (v12[1] == 2)
          {
            phOsalNfc_MemCopy();
            v16 = 0;
            *(_DWORD *)(v14 + 4) |= 0x80u;
            v37 = *(_BYTE *)(v14 + 196) | 0x10;
LABEL_98:
            *(_BYTE *)(v14 + 196) = v37;
          }
          break;
        case 'T':
          if (v12[1] == 1)
          {
            v38 = v12[2];
            if ((v38 & 2) != 0)
            {
              *(_BYTE *)(v14 + 200) |= 1u;
              v38 = v12[2];
            }
            if ((v38 & 4) != 0)
              *(_BYTE *)(v14 + 200) |= 2u;
            v16 = 0;
            *(_BYTE *)(v14 + 196) |= 1u;
LABEL_87:
            *(_DWORD *)(v14 + 4) |= 0x80u;
          }
          break;
        default:
          break;
      }
      v21 = (unsigned int *)a1;
      v22 = "phNciNfc_StoreListenFParams";
      goto LABEL_212;
    }
    if ((v15 - 88) <= 0xA)
    {
      sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreListenIsoNfcDepParams");
      v16 = 1;
      switch(*v12)
      {
        case 'X':
          if (v12[1] == 1)
          {
            v27 = (_BYTE *)(v14 + 380);
            *(_BYTE *)(v14 + 384) = v12[2];
            v28 = 1;
            goto LABEL_228;
          }
          break;
        case 'Y':
          v50 = v12[1];
          if (v50 <= 0x30)
          {
            *(_BYTE *)(v14 + 433) = v50;
            phOsalNfc_MemCopy();
            v27 = (_BYTE *)(v14 + 380);
            v28 = 2;
            goto LABEL_228;
          }
          break;
        case 'Z':
          v51 = v12[1];
          if (v51 <= 0x30)
          {
            *(_BYTE *)(v14 + 482) = v51;
            phOsalNfc_MemCopy();
            v27 = (_BYTE *)(v14 + 380);
            v28 = 4;
            goto LABEL_228;
          }
          break;
        case '[':
          if (v12[1] == 1)
          {
            v27 = (_BYTE *)(v14 + 380);
            *(_BYTE *)(v14 + 483) = v12[2];
            v28 = 8;
LABEL_228:
            v52 = 256;
            goto LABEL_236;
          }
          break;
          if (v12[1] == 1)
          {
            v27 = (_BYTE *)(v14 + 484);
            *(_BYTE *)(v14 + 488) = v12[2];
            v28 = 1;
            goto LABEL_235;
          }
          break;
        case 'a':
          v53 = v12[1];
          if (v53 <= 0x30)
          {
            *(_BYTE *)(v14 + 537) = v53;
            phOsalNfc_MemCopy();
            v27 = (_BYTE *)(v14 + 484);
            v28 = 2;
            goto LABEL_235;
          }
          break;
        case 'b':
          if (v12[1] == 1)
          {
            v27 = (_BYTE *)(v14 + 484);
            *(_BYTE *)(v14 + 540) = *(_BYTE *)(v14 + 540) & 0xFC | (v12[2] >> 4) & 3;
            v28 = 4;
LABEL_235:
            v52 = 512;
LABEL_236:
            v16 = 0;
            *(_DWORD *)(v14 + 4) |= v52;
            *v27 |= v28;
          }
          break;
        default:
          break;
      }
      v21 = (unsigned int *)a1;
      v22 = "phNciNfc_StoreListenIsoNfcDepParams";
      goto LABEL_212;
    }
    if ((char)v15 <= -127)
    {
      sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreConfParams");
      v32 = *v12;
      if (v32 == 129)
      {
        if (v12[1] != 1)
          goto LABEL_203;
        *(_BYTE *)(v14 + 552) = v12[2];
        v33 = 8;
LABEL_202:
        v16 = 0;
        *(_DWORD *)(v14 + 4) |= 0x400u;
        *(_BYTE *)(v14 + 544) |= v33;
      }
      else
      {
        if (v32 == 128 && v12[1] == 1)
        {
          *(_BYTE *)(v14 + 551) = v12[2];
          v33 = 4;
          goto LABEL_202;
        }
LABEL_203:
        v16 = 1;
      }
      v21 = (unsigned int *)a1;
      v22 = "phNciNfc_StoreConfParams";
LABEL_212:
      sub_219850808(2, v21, 3u, 5u, (uint64_t)v22);
      goto LABEL_213;
    }
    if ((v15 & 0xFE) == 0xA0)
    {
      sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StorePropParams");
      if (v12[2] && v12[1] == 3)
      {
        v36 = v12[3] & 0xF;
        if (v36 > 8)
        {
          v16 = 0;
          *(_QWORD *)(v14 + 588) = 0x800000000;
        }
        else
        {
          *(_DWORD *)(v14 + 580) |= 4u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          v16 = 0;
          if (v36 == 8)
          {
            *(_DWORD *)(v14 + 588) = 1;
          }
          else
          {
            *(_DWORD *)(v14 + 588) = 2;
            *(_DWORD *)(v14 + 592) = v36;
          }
        }
      }
      else
      {
        v16 = 1;
      }
      v39 = v12[1];
      if (v39 == 15)
      {
        if (v12[2] == 64)
        {
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          *(_DWORD *)(v14 + 580) |= 0x80u;
          v39 = v12[1];
          goto LABEL_110;
        }
      }
      else
      {
LABEL_110:
        if (v39 == 23)
        {
          v40 = v12[2];
          if (v40 > 0x1F)
            goto LABEL_199;
          *(_BYTE *)(v14 + 682) = v40;
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          v39 = v12[1];
        }
        if (v39 == 24)
        {
          v41 = v12[2];
          if (v41 > 0xD6)
            goto LABEL_199;
          *(_BYTE *)(v14 + 714) = v41;
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          v39 = v12[1];
        }
        if (v39 == 25)
        {
          v16 = 0;
          *(_DWORD *)(v14 + 932) = v12[3];
          *(_DWORD *)(v14 + 580) |= 0x4000u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          v39 = v12[1];
        }
        if (v39 == 213)
        {
          v16 = 0;
          *(_DWORD *)(v14 + 936) = v12[3];
          *(_DWORD *)(v14 + 580) |= 0x8000u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          v39 = v12[1];
        }
        if (v39 == 2)
        {
          v16 = 0;
          *(_BYTE *)(v14 + 586) = v12[3];
          *(_DWORD *)(v14 + 580) |= 2u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          v39 = v12[1];
        }
        if (v39 == 4)
        {
          v16 = 0;
          *(_BYTE *)(v14 + 587) = v12[3];
          *(_DWORD *)(v14 + 580) |= 8u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          v39 = v12[1];
        }
        if (v39 == 7)
        {
          v42 = v12[3];
          if ((v42 & 1) != 0)
          {
            *(_DWORD *)(v14 + 604) = 1;
            v42 = v12[3];
          }
          if ((v42 & 2) != 0)
            *(_DWORD *)(v14 + 608) = 1;
          v16 = 0;
          *(_DWORD *)(v14 + 580) |= 0x40u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          v39 = v12[1];
        }
        if (v39 == 34)
        {
          if (v12[2] != 1)
            goto LABEL_199;
          v16 = 0;
          *(_BYTE *)(v14 + 1125) = v12[3];
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          *(_DWORD *)(v14 + 580) |= 0x1000000u;
          v39 = v12[1];
        }
        if (v39 == 35)
        {
          if (v12[2] != 1)
            goto LABEL_199;
          v16 = 0;
          *(_BYTE *)(v14 + 1124) = v12[3];
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          *(_DWORD *)(v14 + 580) |= 0x800000u;
          v39 = v12[1];
        }
        if (v39 == 36)
        {
          if (v12[2] != 1)
            goto LABEL_199;
          v16 = 0;
          *(_BYTE *)(v14 + 1126) = v12[3];
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          *(_DWORD *)(v14 + 580) |= 0x2000000u;
          v39 = v12[1];
        }
        if (v39 == 233)
        {
          if (v12[2] != 1)
            goto LABEL_199;
          v16 = 0;
          *(_BYTE *)(v14 + 1127) = v12[3];
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          *(_DWORD *)(v14 + 580) |= 0x4000000u;
          v39 = v12[1];
        }
        if (v39 == 236)
        {
          v16 = 0;
          *(_BYTE *)(v14 + 1170) = v12[3];
          *(_BYTE *)(v14 + 1132) |= 1u;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          v39 = v12[1];
        }
        if (v39 == 212)
        {
          v16 = 0;
          *(_BYTE *)(v14 + 1171) = v12[3];
          *(_BYTE *)(v14 + 1132) |= 2u;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          v39 = v12[1];
        }
        if (v39 == 237)
        {
          v16 = 0;
          *(_BYTE *)(v14 + 1172) = v12[3];
          *(_BYTE *)(v14 + 1132) |= 4u;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          v39 = v12[1];
        }
        if (v39 == 162)
        {
          v16 = 0;
          *(_BYTE *)(v14 + 1173) = v12[3];
          *(_BYTE *)(v14 + 1132) |= 8u;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          v39 = v12[1];
        }
        if (v39 == 242)
        {
          v16 = 0;
          *(_BYTE *)(v14 + 1175) = v12[3];
          *(_BYTE *)(v14 + 1132) |= 0x20u;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          v39 = v12[1];
        }
        if (v39 == 68)
        {
          v16 = 0;
          *(_BYTE *)(v14 + 1421) = v12[3];
          *(_WORD *)(v14 + 1408) |= 0x10u;
          *(_DWORD *)(v14 + 4) |= 0x8000u;
          v39 = v12[1];
        }
        if (v39 == 55)
        {
          v16 = 0;
          *(_BYTE *)(v14 + 940) = v12[3];
          *(_DWORD *)(v14 + 580) |= 0x10000u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          v39 = v12[1];
        }
        if (v39 == 245)
        {
          v16 = 0;
          *(_BYTE *)(v14 + 1176) = v12[3];
          *(_DWORD *)(v14 + 1128) |= 0x1000000u;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          v39 = v12[1];
        }
        if (v39 == 6)
        {
          v16 = 0;
          *(_BYTE *)(v14 + 601) = v12[3];
          *(_DWORD *)(v14 + 580) |= 0x20u;
          *(_DWORD *)(v14 + 4) |= 0x1000u;
          v39 = v12[1];
        }
        if (v39 == 232)
        {
          if (v12[2] != 69)
            goto LABEL_199;
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          *(_WORD *)(v14 + 1144) |= 0x100u;
          v39 = v12[1];
        }
        if (v39 == 239)
        {
          if (v12[2] != 69)
            goto LABEL_199;
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          *(_WORD *)(v14 + 1144) |= 0x200u;
          v39 = v12[1];
        }
        if (v39 == 240)
        {
          if (v12[2] != 69)
            goto LABEL_199;
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          *(_WORD *)(v14 + 1144) |= 0x400u;
          v39 = v12[1];
        }
        if (v39 == 234)
        {
          if (v12[2] != 8)
            goto LABEL_199;
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          *(_WORD *)(v14 + 1144) |= 0x40u;
          v39 = v12[1];
        }
        if (v39 == 235)
        {
          if (v12[2] != 8)
            goto LABEL_199;
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          *(_WORD *)(v14 + 1144) |= 0x80u;
          v39 = v12[1];
        }
        if (v39 == 30)
        {
          if (v12[2] != 8)
            goto LABEL_199;
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x2000u;
          *(_WORD *)(v14 + 1144) |= 0x20u;
          v39 = v12[1];
        }
        if (v39 == 104)
        {
          if (v12[2] - 1 > 0x31)
            goto LABEL_199;
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_BYTE *)(v14 + 1608) = v12[2];
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x100u;
          v39 = v12[1];
        }
        if (v39 == 196)
        {
          if (v12[2] - 1 > 0x31)
            goto LABEL_199;
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_BYTE *)(v14 + 1659) = v12[2];
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x200u;
          v39 = v12[1];
        }
        if (v39 == 142)
        {
          if (v12[2] != 1)
            goto LABEL_199;
          v16 = 0;
          *(_BYTE *)(v14 + 1661) = v12[3];
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x1000u;
          v39 = v12[1];
        }
        if (v39 == 16)
        {
          if (v12[2] - 1 > 0x31)
            goto LABEL_199;
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_BYTE *)(v14 + 1719) = v12[2];
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x20000u;
          v39 = v12[1];
        }
        if (v39 == 17)
        {
          if (v12[2] != 2)
            goto LABEL_199;
          v16 = 0;
          *(_BYTE *)(v14 + 1668) = v12[3];
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x10000u;
          v39 = v12[1];
        }
        if (v39 == 231)
        {
          if (v12[2] != 5)
            goto LABEL_199;
          v16 = 0;
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x8000u;
          *(_BYTE *)(v14 + 1662) = v12[3] & 1;
          *(_BYTE *)(v14 + 1663) = (v12[3] & 2) != 0;
          v43 = v12[4];
          *(_WORD *)(v14 + 1664) = v43;
          *(_WORD *)(v14 + 1664) = v43 | (v12[5] << 8);
          v44 = v12[6];
          *(_WORD *)(v14 + 1666) = v44;
          *(_WORD *)(v14 + 1666) = v44 | (v12[7] << 8);
          v39 = v12[1];
        }
        if (v39 == 152 && v12[2] - 1 <= 0xE)
        {
          phOsalNfc_MemCopy();
          v16 = 0;
          *(_BYTE *)(v14 + 1735) = v12[2];
          *(_DWORD *)(v14 + 4) |= 0x10000u;
          *(_DWORD *)(v14 + 1536) |= 0x40000u;
        }
      }
LABEL_199:
      v21 = (unsigned int *)a1;
      v22 = "phNciNfc_StorePropParams";
      goto LABEL_212;
    }
LABEL_80:
    v16 = 1;
    goto LABEL_213;
  }
  v16 = 0;
  LOBYTE(v11) = 0;
  v10 = 0;
  LOBYTE(v9) = 0;
LABEL_241:
  v54 = 1;
  if (!v16 && (_DWORD)a2 == v11)
  {
    v76 = 0;
    memset(v75, 0, sizeof(v75));
    sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateReqParamIDs");
    if (!v10)
      goto LABEL_280;
    v55 = *(_QWORD *)(a1 + 840);
    if (!v55)
      goto LABEL_280;
    v56 = *(unsigned __int8 *)(a1 + 833);
    if (*(_BYTE *)(a1 + 833))
    {
      v57 = 0;
      v58 = 0;
      v59 = 0;
      v60 = 0;
      v61 = v55 + 1;
      do
      {
        v62 = *(unsigned __int8 *)(v61 + v60);
        if ((_BYTE)v9)
        {
          v63 = 0;
          v64 = v57 + 1;
          v65 = v62 & 0xFE;
          do
          {
            v66 = v74[v63];
            if (v65 != 160 || (v62 == v66 ? (v67 = v64 >= v56) : (v67 = 1), v67))
            {
              v68 = v65 != 160 && v62 == v66;
              ++v63;
            }
            else
            {
              if (++v63 >= v9)
              {
                v71 = v58 + 1;
                *((_BYTE *)v75 + v58) = v62;
                goto LABEL_271;
              }
              v68 = *(unsigned __int8 *)(v61 + v64) == v74[v63];
            }
          }
          while (v63 < v9 && !v68);
          if (!v68)
            goto LABEL_268;
          v70 = 1;
        }
        else
        {
          v65 = v62 & 0xFE;
LABEL_268:
          v71 = v58 + 1;
          *((_BYTE *)v75 + v58) = v62;
          if (v65 == 160)
          {
LABEL_271:
            v58 += 2;
            *((_BYTE *)v75 + v71) = *(_BYTE *)(v61 + v57 + 1);
            ++v59;
            v70 = 2;
          }
          else
          {
            ++v59;
            v70 = 1;
            ++v58;
          }
        }
        v60 += v70;
        v57 = v60;
      }
      while (v60 < v56);
      if ((_BYTE)v59)
      {
        if (v58 > 0x62u)
        {
          v54 = 1;
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Received Req Param length exceeded Total Param Length");
          goto LABEL_279;
        }
        phOsalNfc_MemCopy();
LABEL_278:
        v54 = 0;
LABEL_279:
        *(_BYTE *)(a1 + 832) = v59;
        *(_BYTE *)(a1 + 833) = v58;
        **(_BYTE **)(a1 + 840) = v59;
LABEL_280:
        sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateReqParamIDs");
        goto LABEL_281;
      }
    }
    else
    {
      LOBYTE(v58) = 0;
    }
    LOBYTE(v59) = 0;
    goto LABEL_278;
  }
LABEL_281:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessRfParams");
  return v54;
}

uint64_t sub_2198FAA00(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ClearConfigParams");
  if (*(_QWORD *)(a1 + 840))
  {
    *(_BYTE *)(a1 + 832) = 0;
    phOsalNfc_FreeMemory();
    v2 = 0;
    *(_QWORD *)(a1 + 840) = 0;
  }
  else
  {
    v2 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ClearConfigParams");
  return v2;
}

BOOL sub_2198FAA7C(unsigned int *a1, uint64_t a2, _BYTE *a3, _BYTE *a4, _BYTE *a5)
{
  _BOOL8 v10;
  int v11;
  unsigned int v12;
  char v13;
  char v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  unsigned int v20;
  int v21;
  char v22;
  __int16 v23;
  int v24;
  int v25;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetRfParams");
  v10 = 1;
  if (a3 && a4 && a5)
  {
    v11 = *(_DWORD *)(a2 + 4);
    if ((v11 & 4) != 0 && (*(_BYTE *)(a2 + 24) & 1) != 0)
    {
      *a3 = 24;
      v12 = 1;
      if ((*(_DWORD *)(a2 + 4) & 0x10) == 0)
        goto LABEL_13;
    }
    else
    {
      v12 = 0;
      if ((v11 & 0x10) == 0)
        goto LABEL_13;
    }
    v13 = *(_BYTE *)(a2 + 88);
    if ((v13 & 1) != 0)
    {
      a3[v12++] = 40;
      v13 = *(_BYTE *)(a2 + 88);
      if ((v13 & 2) == 0)
      {
LABEL_11:
        if ((v13 & 4) == 0)
          goto LABEL_13;
        goto LABEL_12;
      }
    }
    else if ((*(_BYTE *)(a2 + 88) & 2) == 0)
    {
      goto LABEL_11;
    }
    a3[v12++] = 41;
    if ((*(_BYTE *)(a2 + 88) & 4) == 0)
    {
LABEL_13:
      if ((*(_BYTE *)(a2 + 4) & 0x20) == 0)
        goto LABEL_19;
      v14 = *(_BYTE *)(a2 + 148);
      if ((v14 & 1) != 0)
      {
        a3[v12++] = 48;
        v14 = *(_BYTE *)(a2 + 148);
        if ((v14 & 2) == 0)
        {
LABEL_16:
          if ((v14 & 4) == 0)
            goto LABEL_17;
          goto LABEL_59;
        }
      }
      else if ((*(_BYTE *)(a2 + 148) & 2) == 0)
      {
        goto LABEL_16;
      }
      a3[v12++] = 49;
      v14 = *(_BYTE *)(a2 + 148);
      if ((v14 & 4) == 0)
      {
LABEL_17:
        if ((v14 & 8) == 0)
          goto LABEL_19;
        goto LABEL_18;
      }
LABEL_59:
      a3[v12++] = 50;
      if ((*(_BYTE *)(a2 + 148) & 8) == 0)
      {
LABEL_19:
        if ((*(_BYTE *)(a2 + 4) & 0x40) == 0)
          goto LABEL_25;
        v15 = *(_BYTE *)(a2 + 172);
        if ((v15 & 1) != 0)
        {
          a3[v12++] = 56;
          v15 = *(_BYTE *)(a2 + 172);
          if ((v15 & 2) == 0)
          {
LABEL_22:
            if ((v15 & 4) == 0)
              goto LABEL_23;
            goto LABEL_63;
          }
        }
        else if ((*(_BYTE *)(a2 + 172) & 2) == 0)
        {
          goto LABEL_22;
        }
        a3[v12++] = 57;
        v15 = *(_BYTE *)(a2 + 172);
        if ((v15 & 4) == 0)
        {
LABEL_23:
          if ((v15 & 0x10) == 0)
            goto LABEL_25;
          goto LABEL_24;
        }
LABEL_63:
        a3[v12++] = 58;
        if ((*(_BYTE *)(a2 + 172) & 0x10) == 0)
        {
LABEL_25:
          if ((*(_BYTE *)(a2 + 4) & 0x80) == 0)
            goto LABEL_33;
          v16 = *(_BYTE *)(a2 + 196);
          if ((v16 & 4) != 0)
          {
            *(_DWORD *)&a3[v12] = 1128415552;
            v12 += 4;
            v16 = *(_BYTE *)(a2 + 196);
            if ((v16 & 2) == 0)
            {
LABEL_28:
              if ((v16 & 8) == 0)
                goto LABEL_29;
              goto LABEL_67;
            }
          }
          else if ((*(_BYTE *)(a2 + 196) & 2) == 0)
          {
            goto LABEL_28;
          }
          a3[v12++] = 80;
          v16 = *(_BYTE *)(a2 + 196);
          if ((v16 & 8) == 0)
          {
LABEL_29:
            if ((v16 & 0x20) == 0)
              goto LABEL_30;
            goto LABEL_68;
          }
LABEL_67:
          a3[v12++] = 81;
          v16 = *(_BYTE *)(a2 + 196);
          if ((v16 & 0x20) == 0)
          {
LABEL_30:
            if ((v16 & 0x10) == 0)
              goto LABEL_31;
            goto LABEL_69;
          }
LABEL_68:
          a3[v12++] = 82;
          v16 = *(_BYTE *)(a2 + 196);
          if ((v16 & 0x10) == 0)
          {
LABEL_31:
            if ((v16 & 1) == 0)
              goto LABEL_33;
            goto LABEL_32;
          }
LABEL_69:
          a3[v12++] = 83;
          if ((*(_BYTE *)(a2 + 196) & 1) == 0)
          {
LABEL_33:
            if ((*(_BYTE *)(a2 + 5) & 1) == 0)
              goto LABEL_39;
            v17 = *(_BYTE *)(a2 + 380);
            if ((v17 & 1) != 0)
            {
              a3[v12++] = 88;
              v17 = *(_BYTE *)(a2 + 380);
              if ((v17 & 2) == 0)
              {
LABEL_36:
                if ((v17 & 4) == 0)
                  goto LABEL_37;
                goto LABEL_73;
              }
            }
            else if ((*(_BYTE *)(a2 + 380) & 2) == 0)
            {
              goto LABEL_36;
            }
            a3[v12++] = 89;
            v17 = *(_BYTE *)(a2 + 380);
            if ((v17 & 4) == 0)
            {
LABEL_37:
              if ((v17 & 8) == 0)
                goto LABEL_39;
              goto LABEL_38;
            }
LABEL_73:
            a3[v12++] = 90;
            if ((*(_BYTE *)(a2 + 380) & 8) == 0)
            {
LABEL_39:
              if ((*(_BYTE *)(a2 + 5) & 2) == 0)
                goto LABEL_44;
              v18 = *(_BYTE *)(a2 + 484);
              if ((v18 & 1) != 0)
              {
                a3[v12++] = 96;
                v18 = *(_BYTE *)(a2 + 484);
                if ((v18 & 2) == 0)
                {
LABEL_42:
                  if ((v18 & 4) == 0)
                    goto LABEL_44;
                  goto LABEL_43;
                }
              }
              else if ((*(_BYTE *)(a2 + 484) & 2) == 0)
              {
                goto LABEL_42;
              }
              a3[v12++] = 97;
              if ((*(_BYTE *)(a2 + 484) & 4) == 0)
              {
LABEL_44:
                if ((*(_BYTE *)(a2 + 5) & 4) == 0)
                  goto LABEL_49;
                v19 = *(_BYTE *)(a2 + 544);
                if ((v19 & 1) != 0)
                {
                  a3[v12++] = 0;
                  v19 = *(_BYTE *)(a2 + 544);
                  if ((v19 & 4) == 0)
                  {
LABEL_47:
                    if ((v19 & 8) == 0)
                      goto LABEL_49;
                    goto LABEL_48;
                  }
                }
                else if ((*(_BYTE *)(a2 + 544) & 4) == 0)
                {
                  goto LABEL_47;
                }
                a3[v12++] = 0x80;
                if ((*(_BYTE *)(a2 + 544) & 8) == 0)
                {
LABEL_49:
                  if ((*(_BYTE *)(a2 + 5) & 0x10) == 0)
                  {
                    v20 = v12;
                    goto LABEL_97;
                  }
                  v21 = *(_DWORD *)(a2 + 580);
                  if ((v21 & 4) != 0)
                  {
                    *(_WORD *)&a3[v12] = 928;
                    v20 = v12 + 2;
                    ++v12;
                    v21 = *(_DWORD *)(a2 + 580);
                    if ((v21 & 0x80) == 0)
                      goto LABEL_83;
                  }
                  else
                  {
                    v20 = v12;
                    if ((v21 & 0x80) == 0)
                    {
LABEL_83:
                      if ((v21 & 0x1000000) != 0)
                      {
                        *(_WORD *)&a3[v20] = 8864;
                        v20 += 2;
                        ++v12;
                        v21 = *(_DWORD *)(a2 + 580);
                        if ((v21 & 0x800000) == 0)
                        {
LABEL_85:
                          if ((v21 & 0x2000000) == 0)
                            goto LABEL_86;
                          goto LABEL_128;
                        }
                      }
                      else if ((v21 & 0x800000) == 0)
                      {
                        goto LABEL_85;
                      }
                      *(_WORD *)&a3[v20] = 9120;
                      v20 += 2;
                      ++v12;
                      v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x2000000) == 0)
                      {
LABEL_86:
                        if ((v21 & 0x1000) == 0)
                          goto LABEL_87;
                        goto LABEL_129;
                      }
LABEL_128:
                      *(_WORD *)&a3[v20] = 9376;
                      v20 += 2;
                      ++v12;
                      v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x1000) == 0)
                      {
LABEL_87:
                        if ((v21 & 0x2000) == 0)
                          goto LABEL_88;
                        goto LABEL_130;
                      }
LABEL_129:
                      *(_WORD *)&a3[v20] = 6048;
                      v20 += 2;
                      ++v12;
                      v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x2000) == 0)
                      {
LABEL_88:
                        if ((v21 & 0x4000) == 0)
                          goto LABEL_89;
                        goto LABEL_131;
                      }
LABEL_130:
                      *(_WORD *)&a3[v20] = 6304;
                      v20 += 2;
                      ++v12;
                      v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x4000) == 0)
                      {
LABEL_89:
                        if ((v21 & 2) == 0)
                          goto LABEL_90;
                        goto LABEL_132;
                      }
LABEL_131:
                      *(_WORD *)&a3[v20] = 6560;
                      v20 += 2;
                      ++v12;
                      v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 2) == 0)
                      {
LABEL_90:
                        if ((v21 & 8) == 0)
                          goto LABEL_91;
                        goto LABEL_133;
                      }
LABEL_132:
                      *(_WORD *)&a3[v20] = 672;
                      v20 += 2;
                      ++v12;
                      v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 8) == 0)
                      {
LABEL_91:
                        if ((v21 & 0x40) == 0)
                          goto LABEL_92;
                        goto LABEL_134;
                      }
LABEL_133:
                      *(_WORD *)&a3[v20] = 1184;
                      v20 += 2;
                      ++v12;
                      v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x40) == 0)
                      {
LABEL_92:
                        if ((v21 & 0x8000) == 0)
                          goto LABEL_93;
                        goto LABEL_135;
                      }
LABEL_134:
                      *(_WORD *)&a3[v20] = 1952;
                      v20 += 2;
                      ++v12;
                      v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x8000) == 0)
                      {
LABEL_93:
                        if ((v21 & 0x10000) == 0)
                          goto LABEL_94;
                        goto LABEL_136;
                      }
LABEL_135:
                      *(_WORD *)&a3[v20] = -10848;
                      v20 += 2;
                      ++v12;
                      v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x10000) == 0)
                      {
LABEL_94:
                        if ((v21 & 0x20) == 0)
                          goto LABEL_95;
                        goto LABEL_137;
                      }
LABEL_136:
                      *(_WORD *)&a3[v20] = 14240;
                      v20 += 2;
                      ++v12;
                      v21 = *(_DWORD *)(a2 + 580);
                      if ((v21 & 0x20) == 0)
                      {
LABEL_95:
                        if ((v21 & 0x4000000) == 0)
                          goto LABEL_97;
                        goto LABEL_96;
                      }
LABEL_137:
                      *(_WORD *)&a3[v20] = 1696;
                      v20 += 2;
                      ++v12;
                      if ((*(_DWORD *)(a2 + 580) & 0x4000000) == 0)
                      {
LABEL_97:
                        if ((*(_BYTE *)(a2 + 5) & 0x20) == 0)
                          goto LABEL_113;
                        v22 = *(_BYTE *)(a2 + 1132);
                        if ((v22 & 1) != 0)
                        {
                          *(_WORD *)&a3[v20] = -4960;
                          v20 += 2;
                          ++v12;
                          v22 = *(_BYTE *)(a2 + 1132);
                          if ((v22 & 2) == 0)
                          {
LABEL_100:
                            if ((v22 & 4) == 0)
                              goto LABEL_101;
                            goto LABEL_141;
                          }
                        }
                        else if ((*(_BYTE *)(a2 + 1132) & 2) == 0)
                        {
                          goto LABEL_100;
                        }
                        *(_WORD *)&a3[v20] = -11104;
                        v20 += 2;
                        ++v12;
                        v22 = *(_BYTE *)(a2 + 1132);
                        if ((v22 & 4) == 0)
                        {
LABEL_101:
                          if ((v22 & 8) == 0)
                            goto LABEL_102;
                          goto LABEL_142;
                        }
LABEL_141:
                        *(_WORD *)&a3[v20] = -4704;
                        v20 += 2;
                        ++v12;
                        v22 = *(_BYTE *)(a2 + 1132);
                        if ((v22 & 8) == 0)
                        {
LABEL_102:
                          if ((v22 & 0x20) == 0)
                            goto LABEL_104;
                          goto LABEL_103;
                        }
LABEL_142:
                        *(_WORD *)&a3[v20] = -23904;
                        v20 += 2;
                        ++v12;
                        if ((*(_BYTE *)(a2 + 1132) & 0x20) == 0)
                        {
LABEL_104:
                          if ((*(_BYTE *)(a2 + 1131) & 1) != 0)
                          {
                            *(_WORD *)&a3[v20] = -2656;
                            v20 += 2;
                            ++v12;
                          }
                          v23 = *(_WORD *)(a2 + 1144);
                          if ((v23 & 0x100) != 0)
                          {
                            *(_WORD *)&a3[v20] = -5984;
                            v20 += 2;
                            ++v12;
                            v23 = *(_WORD *)(a2 + 1144);
                            if ((v23 & 0x200) == 0)
                            {
LABEL_108:
                              if ((v23 & 0x400) == 0)
                                goto LABEL_109;
                              goto LABEL_146;
                            }
                          }
                          else if ((*(_WORD *)(a2 + 1144) & 0x200) == 0)
                          {
                            goto LABEL_108;
                          }
                          *(_WORD *)&a3[v20] = -4192;
                          v20 += 2;
                          ++v12;
                          v23 = *(_WORD *)(a2 + 1144);
                          if ((v23 & 0x400) == 0)
                          {
LABEL_109:
                            if ((v23 & 0x80) == 0)
                              goto LABEL_110;
                            goto LABEL_147;
                          }
LABEL_146:
                          *(_WORD *)&a3[v20] = -3936;
                          v20 += 2;
                          ++v12;
                          v23 = *(_WORD *)(a2 + 1144);
                          if ((v23 & 0x80) == 0)
                          {
LABEL_110:
                            if ((v23 & 0x40) == 0)
                              goto LABEL_111;
                            goto LABEL_148;
                          }
LABEL_147:
                          *(_WORD *)&a3[v20] = -5216;
                          v20 += 2;
                          ++v12;
                          v23 = *(_WORD *)(a2 + 1144);
                          if ((v23 & 0x40) == 0)
                          {
LABEL_111:
                            if ((v23 & 0x20) != 0)
                            {
LABEL_112:
                              *(_WORD *)&a3[v20] = 7840;
                              v20 += 2;
                              ++v12;
                            }
LABEL_113:
                            v24 = *(_DWORD *)(a2 + 4);
                            if ((v24 & 0x8000) != 0 && (*(_WORD *)(a2 + 1408) & 0x10) != 0)
                            {
                              *(_WORD *)&a3[v20] = 17568;
                              v20 += 2;
                              ++v12;
                              v24 = *(_DWORD *)(a2 + 4);
                            }
                            if ((v24 & 0x10000) == 0)
                              goto LABEL_124;
                            v25 = *(_DWORD *)(a2 + 1536);
                            if ((v25 & 0x100) != 0)
                            {
                              *(_WORD *)&a3[v20] = 26784;
                              v20 += 2;
                              ++v12;
                              v25 = *(_DWORD *)(a2 + 1536);
                              if ((v25 & 0x200) == 0)
                              {
LABEL_119:
                                if ((v25 & 0x40000) == 0)
                                  goto LABEL_120;
                                goto LABEL_152;
                              }
                            }
                            else if ((v25 & 0x200) == 0)
                            {
                              goto LABEL_119;
                            }
                            *(_WORD *)&a3[v20] = -15200;
                            v20 += 2;
                            ++v12;
                            v25 = *(_DWORD *)(a2 + 1536);
                            if ((v25 & 0x40000) == 0)
                            {
LABEL_120:
                              if ((v25 & 0x4000) == 0)
                                goto LABEL_121;
                              goto LABEL_153;
                            }
LABEL_152:
                            *(_WORD *)&a3[v20] = -26464;
                            v20 += 2;
                            ++v12;
                            v25 = *(_DWORD *)(a2 + 1536);
                            if ((v25 & 0x4000) == 0)
                            {
LABEL_121:
                              if ((v25 & 0x1000) == 0)
                                goto LABEL_122;
                              goto LABEL_154;
                            }
LABEL_153:
                            *(_WORD *)&a3[v20] = -16480;
                            v20 += 2;
                            ++v12;
                            v25 = *(_DWORD *)(a2 + 1536);
                            if ((v25 & 0x1000) == 0)
                            {
LABEL_122:
                              if ((v25 & 0x8000) == 0)
                              {
LABEL_124:
                                v10 = v12 == 0;
                                *a4 = v12;
                                *a5 = v20;
                                goto LABEL_125;
                              }
LABEL_123:
                              *(_WORD *)&a3[v20] = -6240;
                              LOBYTE(v20) = v20 + 2;
                              ++v12;
                              goto LABEL_124;
                            }
LABEL_154:
                            *(_WORD *)&a3[v20] = -29024;
                            v20 += 2;
                            ++v12;
                            if ((*(_DWORD *)(a2 + 1536) & 0x8000) == 0)
                              goto LABEL_124;
                            goto LABEL_123;
                          }
LABEL_148:
                          *(_WORD *)&a3[v20] = -5472;
                          v20 += 2;
                          ++v12;
                          if ((*(_WORD *)(a2 + 1144) & 0x20) == 0)
                            goto LABEL_113;
                          goto LABEL_112;
                        }
LABEL_103:
                        *(_WORD *)&a3[v20] = -3424;
                        v20 += 2;
                        ++v12;
                        goto LABEL_104;
                      }
LABEL_96:
                      *(_WORD *)&a3[v20] = -5728;
                      v20 += 2;
                      ++v12;
                      goto LABEL_97;
                    }
                  }
                  *(_WORD *)&a3[v20] = 4000;
                  v20 += 2;
                  ++v12;
                  v21 = *(_DWORD *)(a2 + 580);
                  goto LABEL_83;
                }
LABEL_48:
                a3[v12++] = -127;
                goto LABEL_49;
              }
LABEL_43:
              a3[v12++] = 98;
              goto LABEL_44;
            }
LABEL_38:
            a3[v12++] = 91;
            goto LABEL_39;
          }
LABEL_32:
          a3[v12++] = 84;
          goto LABEL_33;
        }
LABEL_24:
        a3[v12++] = 60;
        goto LABEL_25;
      }
LABEL_18:
      a3[v12++] = 51;
      goto LABEL_19;
    }
LABEL_12:
    a3[v12++] = 42;
    goto LABEL_13;
  }
LABEL_125:
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_GetRfParams");
  return v10;
}

uint64_t sub_2198FB1D8(uint64_t a1)
{
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_NciCtxInitialize");
  if (a1)
  {
    *(_QWORD *)(a1 + 160) = 0;
    *(_QWORD *)(a1 + 3384) = 0;
    *(_QWORD *)(a1 + 3712) = 0;
    *(_QWORD *)(a1 + 3736) = 0;
    *(_QWORD *)(a1 + 3760) = 0;
    *(_QWORD *)(a1 + 4512) = 0;
    *(_QWORD *)(a1 + 4600) = 0;
    *(_QWORD *)(a1 + 4616) = 0;
    *(_QWORD *)(a1 + 4760) = 0;
    *(_QWORD *)(a1 + 4496) = 0;
    *(_QWORD *)(a1 + 4648) = 0;
    *(_QWORD *)(a1 + 184) = 0;
    *(_QWORD *)(a1 + 192) = 0;
    *(_OWORD *)(a1 + 208) = 0u;
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_QWORD *)(a1 + 288) = 0;
    *(_QWORD *)(a1 + 296) = 0;
    *(_QWORD *)(a1 + 848) = 0;
    *(_QWORD *)(a1 + 840) = 0;
    *(_QWORD *)(a1 + 4584) = 0;
    *(_QWORD *)(a1 + 4576) = 0;
  }
  return sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_NciCtxInitialize");
}

uint64_t sub_2198FB27C(uint64_t a1)
{
  uint64_t v2;
  __int128 v4;
  __int128 v5;

  v4 = 0u;
  v5 = 0u;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SendTxData");
  if (a1)
  {
    phOsalNfc_SetMemory();
    LODWORD(v4) = 0;
    BYTE12(v4) = *(_BYTE *)(a1 + 3928);
    *(_QWORD *)&v5 = *(_QWORD *)(a1 + 848);
    DWORD2(v5) = *(_DWORD *)(a1 + 856);
    v2 = sub_2198F2D0C(a1 + 888, (uint64_t)&v4, a1 + 3760, *(unsigned __int16 *)(a1 + 4526), (uint64_t)sub_21985A05C, a1);
  }
  else
  {
    v2 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SendTxData");
  return v2;
}

uint64_t sub_2198FB344(uint64_t a1, uint64_t a2)
{
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessDataRsp");
  if (a1)
  {
    if (!(_DWORD)a2)
    {
      *(_QWORD *)(a1 + 4552) = *(_QWORD *)(a1 + 3760);
      *(_DWORD *)(a1 + 4560) = *(_DWORD *)(a1 + 3768);
    }
  }
  else
  {
    a2 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ProcessDataRsp");
  return a2;
}

uint64_t sub_2198FB3C0(uint64_t a1, uint64_t a2)
{
  void (*v4)(_QWORD, uint64_t, uint64_t);

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteDataSequence");
  if (a1)
  {
    v4 = *(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 4576);
    *(_QWORD *)(a1 + 4576) = 0;
    *(_BYTE *)(a1 + 6435) = 0;
    if (v4)
      v4(*(_QWORD *)(a1 + 4584), a2, a1 + 4552);
    else
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"No CB registered");
    *(_QWORD *)(a1 + 848) = 0;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CompleteDataSequence");
  return a2;
}

uint64_t sub_2198FB470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, unsigned int a6)
{
  uint64_t v11;
  char v12;
  uint64_t v13;
  char v14;
  int v15;
  unsigned int *v16;
  unsigned int *v17;
  _BOOL4 v18;
  uint64_t v19;
  char v20;
  unsigned int *v21;
  unsigned int *v22;
  char v23;
  unsigned int *v24;
  uint64_t v25;
  int v26;
  unsigned int *v27;
  uint64_t v28;
  unsigned int *v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int *v34;
  uint64_t v35;

  v34 = 0;
  v35 = a1;
  v32 = 0;
  v33 = 0;
  sub_219850718(0, (unsigned int *)&v35, 3u, 5u, (uint64_t)"phNciNfc_Initialise");
  sub_21988F0DC(v35, &v34);
  v11 = 0;
  v12 = 1;
  v13 = v35;
  do
  {
    v14 = v12;
    if (*((_QWORD *)&unk_253E46700 + 14 * v11) == v35)
    {
      v15 = *((_DWORD *)&unk_253E46700 + 28 * v11 + 2);
      if (a3)
        goto LABEL_7;
      goto LABEL_12;
    }
    v12 = 0;
    v11 = 1;
  }
  while ((v14 & 1) != 0);
  v15 = 255;
  if (!a3)
    goto LABEL_12;
LABEL_7:
  if (!a2 || !v35)
  {
LABEL_12:
    v19 = 1;
    sub_219850628(0, (unsigned int *)&v35, 3u, 1u, (uint64_t)"Invalid input parameter");
    v17 = v34;
    v18 = v34 != 0;
    if (a5 != 1 || !v34)
    {
LABEL_14:
      if (a5 || !v18)
        goto LABEL_30;
    }
    *((_QWORD *)v17 + 423) = a3;
    *((_QWORD *)v17 + 464) = a4;
    *((_QWORD *)v17 + 467) = off_2550A0C38;
    *((_BYTE *)v17 + 3936) = 0;
    v20 = sub_21987CDC4(v17, off_2550A0C38);
    v21 = v34;
    *((_BYTE *)v34 + 3937) = v20;
    v19 = sub_21985A05C((uint64_t)v21, 0, 0);
    goto LABEL_30;
  }
  v16 = v34;
  if (v34)
  {
    if (a5 != 1)
    {
      sub_219850628(0, (unsigned int *)&v35, 3u, 4u, (uint64_t)"Stack already initialized");
      v17 = v34;
      v18 = v34 != 0;
      v19 = 50;
      goto LABEL_14;
    }
LABEL_19:
    *((_QWORD *)v16 + 423) = a3;
    *((_QWORD *)v16 + 464) = a4;
    *((_BYTE *)v16 + 6474) = a5;
    v16[936] = 0;
    v16[1619] = v15;
    *((_QWORD *)v16 + 810) = v13;
    *((_QWORD *)v16 + 467) = off_2550A0C38;
    *((_BYTE *)v16 + 3936) = 0;
    v23 = sub_21987CDC4(v16, off_2550A0C38);
    v24 = v34;
    v25 = v35;
    *((_BYTE *)v34 + 3937) = v23;
    *((_QWORD *)v24 + 190) = v25;
    *((_QWORD *)v24 + 180) = 0xFFFFFFFFFFFFLL;
    *((_QWORD *)v24 + 111) = v24;
    v24[839] = v15;
    v26 = sub_2198AE5BC((uint64_t)(v24 + 222));
    v27 = v34;
    if (v26)
    {
      sub_219850628(1, v34 + 1619, 3u, 1u, (uint64_t)"phNciNfc_CoreInitialise failed!");
      phOsalNfc_FreeMemory();
      v34 = 0;
      sub_21988F25C(v35, 0);
      sub_21988F310(v35, 0);
      v19 = 255;
      goto LABEL_30;
    }
    *((_QWORD *)v34 + 469) = 0x300000003;
    v27[9] = a6;
    *((_WORD *)v27 + 20) = 0;
    *((_BYTE *)v27 + 6568) = 0;
    *((_BYTE *)v27 + 6608) = 0;
    *((_WORD *)v27 + 3305) = 0;
    *((_WORD *)v27 + 3121) = 0;
    *((_QWORD *)v27 + 604) = 0xFFFFFFFFFFFFLL;
    if (a5 == 2)
    {
      BYTE5(v33) = 2;
      v32 = 0xF00000003;
      LODWORD(v33) = 58;
      sub_2198F2F98(v27 + 222, (uint64_t)&v32, (uint64_t)sub_21985C490, (uint64_t)v27);
      BYTE5(v33) = 2;
      v32 = 3;
      LODWORD(v33) = 0;
      sub_2198F2F98(v34 + 222, (uint64_t)&v32, (uint64_t)sub_21988550C, (uint64_t)v34);
      BYTE5(v33) = 2;
      v32 = 0x100000003;
      LODWORD(v33) = 33;
      sub_2198F2F98(v34 + 222, (uint64_t)&v32, (uint64_t)sub_21985C56C, (uint64_t)v34);
      BYTE5(v33) = 2;
      v32 = 0x100000003;
      LODWORD(v33) = 40;
      sub_2198F2F98(v34 + 222, (uint64_t)&v32, (uint64_t)sub_21985C60C, (uint64_t)v34);
      BYTE5(v33) = 2;
      v32 = 0x100000003;
      LODWORD(v33) = 35;
      sub_2198F2F98(v34 + 222, (uint64_t)&v32, (uint64_t)sub_21985C6AC, (uint64_t)v34);
      BYTE5(v33) = 2;
      v32 = 0x100000003;
      LODWORD(v33) = 44;
      sub_2198F2F98(v34 + 222, (uint64_t)&v32, (uint64_t)sub_21985C798, (uint64_t)v34);
      BYTE5(v33) = 2;
      v32 = 0x100000003;
      LODWORD(v33) = 36;
      sub_2198F2F98(v34 + 222, (uint64_t)&v32, (uint64_t)sub_21985C838, (uint64_t)v34);
      BYTE5(v33) = 2;
      v32 = 0xF00000003;
      LODWORD(v33) = 50;
      sub_2198F2F98(v34 + 222, (uint64_t)&v32, (uint64_t)sub_219853C54, (uint64_t)v34);
      BYTE5(v33) = 2;
      v32 = 0xF00000003;
      LODWORD(v33) = 3;
      sub_2198F2F98(v34 + 222, (uint64_t)&v32, (uint64_t)sub_21985D780, (uint64_t)v34);
      v19 = sub_2198849FC((uint64_t)v34);
      if (!(_DWORD)v19)
      {
        v28 = phOsalNfc_Timer_Create();
        v29 = v34;
        *((_QWORD *)v34 + 582) = v28;
        if (v28 == 0xFFFFFFFFFFFFLL || !v28)
        {
          sub_219850628(1, v29 + 1619, 3u, 1u, (uint64_t)"Notification Timer Create failed!!");
          v19 = 12;
          goto LABEL_29;
        }
        sub_219850628(1, v29 + 1619, 3u, 4u, (uint64_t)"Notification Timer Created Successfully");
        v31 = sub_2198F31D0((uint64_t)(v34 + 222), 255);
        if (!(_DWORD)v31)
        {
          v19 = 13;
          goto LABEL_30;
        }
        v19 = v31;
        sub_219850628(1, v34 + 1619, 3u, 1u, (uint64_t)"Failed to Udpate Control Packet size");
      }
    }
    else
    {
      v19 = sub_21985A05C((uint64_t)v27, 0, 0);
    }
    if ((_DWORD)v19 == 13)
      goto LABEL_30;
LABEL_29:
    sub_219850628(1, v34 + 1619, 3u, 2u, (uint64_t)"Init Sequence failed!");
    sub_2198FBBC4((uint64_t)v34);
    sub_2198AE9A8(v34);
    v34 = 0;
    goto LABEL_30;
  }
  v22 = (unsigned int *)sub_2198FB9B4(v35);
  v34 = v22;
  if (v22)
  {
    v16 = v22;
    v13 = v35;
    goto LABEL_19;
  }
  v19 = 0;
LABEL_30:
  sub_219850808(0, (unsigned int *)&v35, 3u, 5u, (uint64_t)"phNciNfc_Initialise");
  return v19;
}

uint64_t sub_2198FB9B4(uint64_t a1)
{
  int v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t Memory;
  unsigned int *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = a1;
  v14 = 0;
  sub_219850718(0, (unsigned int *)&v15, 3u, 5u, (uint64_t)"phNciNfc_InitContext");
  v1 = sub_21988F0DC(v15, &v14);
  v2 = 0;
  v13 = 255;
  v3 = 1;
  while (1)
  {
    v4 = v3;
    if (*((_QWORD *)&unk_253E46700 + 14 * v2) == v15)
      break;
    v3 = 0;
    v2 = 1;
    if ((v4 & 1) == 0)
      goto LABEL_6;
  }
  v13 = *((_DWORD *)&unk_253E46700 + 28 * v2 + 2);
LABEL_6:
  if (!v1 && v14)
    goto LABEL_19;
  if (v1 || v14)
  {
    v7 = "Failed to retrieve NCI Context";
    v6 = (unsigned int *)&v15;
    LODWORD(Memory) = 0;
LABEL_18:
    sub_219850628(Memory, v6, 3u, 1u, (uint64_t)v7);
    goto LABEL_19;
  }
  Memory = phOsalNfc_GetMemory();
  v14 = Memory;
  if (!Memory)
  {
    v7 = "Failed to allocate memory, insufficient resuorces";
    v6 = (unsigned int *)&v15;
    goto LABEL_18;
  }
  sub_219885FF8(1, &v13, 3u, 4u, (uint64_t)"####DriverHandle");
  sub_219885FF8(1, &v13, 3u, 4u, (uint64_t)"####NCI context");
  sub_219885FF8(1, &v13, 3u, 4u, (uint64_t)"####NCI CORE Context");
  if (sub_21988F25C(v15, v14))
  {
    v6 = (unsigned int *)(v14 + 6476);
    v7 = "Failed to assign NCI context to INFRA layer";
LABEL_17:
    LODWORD(Memory) = 1;
    goto LABEL_18;
  }
  phOsalNfc_SetMemory();
  v8 = v14;
  *(_DWORD *)(v14 + 6476) = v13;
  sub_2198FB1D8(v8);
  v9 = v15;
  v10 = v14;
  *(_QWORD *)(v14 + 6480) = v15;
  *(_QWORD *)(v10 + 888) = v10;
  if (sub_21988F310(v9, v10 + 888))
  {
    v7 = "Failed to assign NCI CORE context to INFRA layer";
    v6 = &v13;
    goto LABEL_17;
  }
  if (v15)
  {
    v12 = v14;
    *(_QWORD *)(v14 + 1520) = v15;
    *(_DWORD *)(v12 + 3356) = v13;
  }
LABEL_19:
  sub_219850808(0, (unsigned int *)&v15, 3u, 5u, (uint64_t)"phNciNfc_InitContext");
  return v14;
}

uint64_t sub_2198FBBC4(uint64_t a1)
{
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_FreeSendPayloadBuff");
  if (*(_QWORD *)(a1 + 848))
  {
    phOsalNfc_FreeMemory();
    *(_QWORD *)(a1 + 848) = 0;
    *(_QWORD *)(a1 + 840) = 0;
    *(_DWORD *)(a1 + 856) = 0;
  }
  return sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_FreeSendPayloadBuff");
}

unsigned int *sub_2198FBC30(uint64_t a1)
{
  int v1;
  unsigned int *v2;
  BOOL v3;
  unsigned int *v5;

  v5 = 0;
  v1 = sub_21988F0DC(a1, &v5);
  v2 = v5;
  if (v5)
    v3 = v1 == 0;
  else
    v3 = 0;
  if (!v3)
  {
    sub_219850628(2, v5, 3u, 1u, (uint64_t)"Failed to allocate memory, insufficient resuorces");
    return v5;
  }
  return v2;
}

uint64_t sub_2198FBC84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ReInitialise");
  if (a1)
  {
    if (a2)
    {
      *(_QWORD *)(a1 + 3384) = a2;
      *(_QWORD *)(a1 + 3712) = a3;
      *(_DWORD *)(a1 + 36) = 0;
      *(_WORD *)(a1 + 40) = 256;
      *(_QWORD *)(a1 + 1440) = 0xFFFFFFFFFFFFLL;
      sub_2198C81DC(a1);
      *(_BYTE *)(a1 + 6244) = 0;
      *(_WORD *)(a1 + 4768) = 0;
      *(_QWORD *)(a1 + 3736) = off_2550A0C38;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0C38);
      v6 = sub_21985A05C(a1, 0, 0);
      if ((_DWORD)v6 != 13)
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Re-Initialize Sequence failed!");
    }
    else
    {
      v6 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Stack not initialized");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v6 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ReInitialise");
  return v6;
}

uint64_t sub_2198FBDCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetFwInterfaceVersion");
  if (a1)
  {
    if (a2)
    {
      *(_QWORD *)(a1 + 848) = 0;
      *(_DWORD *)(a1 + 856) = 0;
      *(_QWORD *)(a1 + 3384) = a2;
      *(_QWORD *)(a1 + 3712) = a3;
      *(_QWORD *)(a1 + 3736) = off_2550A0C68;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0C68);
      v6 = sub_21985A05C(a1, 0, 0);
      if ((_DWORD)v6 != 13)
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Get FW interface version Sequence failed!");
        *(_QWORD *)(a1 + 848) = 0;
        *(_DWORD *)(a1 + 856) = 0;
      }
    }
    else
    {
      v6 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameter passed(phNciNfc_GetFwInterfaceVersion)\n");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_GetFwInterfaceVersion)\n");
    v6 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetFwInterfaceVersion");
  return v6;
}

uint64_t sub_2198FBEF8(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  int v8;
  unsigned int v9;
  unint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t Memory;
  uint64_t v15;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StartDiscovery");
  if (a1)
  {
    if (a2 && a3)
    {
      *(_DWORD *)(a1 + 172) = 0;
      sub_2198636E8(a1);
      v8 = (a2[2] & 1) + (*a2 & 1) + (a2[4] & 1) + (a2[12] & 1) + (a2[14] & 1);
      v9 = (char)a2[18];
      if ((v9 & 0x80000000) != 0)
      {
        v11 = v8 + 1;
      }
      else
      {
        v10 = *(_QWORD *)&vshl_u16((uint16x4_t)(*(_QWORD *)&vdup_n_s16(v9) & 0xFF00FF00FF00FFLL), (uint16x4_t)0xFFFCFFFDFFFEFFFFLL) & 0xFF01FF01FF01FF01;
        LOWORD(v10) = vaddv_s16((int16x4_t)v10);
        v11 = v10 + (v9 & 1) + v8;
      }
      v13 = ((v9 >> 6) & 1) + (a2[10] & 1) + (a2[6] & 1) + (a2[8] & 1) + ((v9 >> 5) & 1) + v11;
      phOsalNfc_MemCopy();
      *(_BYTE *)(a1 + 168) = (2 * v13) | 1;
      if (*(_QWORD *)(a1 + 160))
        phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 160) = 0;
      Memory = phOsalNfc_GetMemory();
      *(_QWORD *)(a1 + 160) = Memory;
      if (Memory)
      {
        v15 = sub_219863E28(a1, a2);
        if ((_DWORD)v15)
        {
          v12 = v15;
          phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 160) = 0;
          *(_QWORD *)(a1 + 3384) = 0;
          *(_QWORD *)(a1 + 3712) = 0;
        }
        else
        {
          **(_BYTE **)(a1 + 160) = v13;
          *(_QWORD *)(a1 + 3384) = a3;
          *(_QWORD *)(a1 + 3712) = a4;
          *(_QWORD *)(a1 + 3736) = off_2550A0948;
          *(_BYTE *)(a1 + 3936) = 0;
          *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0948);
          v12 = sub_2198631AC(a1, 0, 0);
        }
      }
      else
      {
        v12 = 12;
      }
    }
    else
    {
      v12 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid input parameter");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Nci stack not initialized");
    v12 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StartDiscovery");
  return v12;
}

uint64_t sub_2198FC140(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Memory;
  _BYTE *v7;
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Nfcee_StartDiscovery");
  if (a1)
  {
    if (a2)
    {
      Memory = phOsalNfc_GetMemory();
      if (Memory)
      {
        v7 = (_BYTE *)Memory;
        sub_2198AE918(a1);
        *(_BYTE *)(a1 + 4488) = 1;
        *v7 = 1;
        *(_QWORD *)(a1 + 848) = v7;
        *(_DWORD *)(a1 + 856) = 1;
        *(_QWORD *)(a1 + 3384) = a2;
        *(_QWORD *)(a1 + 3712) = a3;
        *(_QWORD *)(a1 + 3736) = off_2550A2A60;
        *(_BYTE *)(a1 + 3936) = 0;
        *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A2A60);
        v8 = sub_2198AB184(a1, 0, 0);
        if ((_DWORD)v8 != 13)
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Nfcee Discover Sequence failed!");
          phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 848) = 0;
          *(_DWORD *)(a1 + 856) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Memory not available(phNciNfc_Nfcee_StartDiscovery)\n");
        v8 = 12;
      }
    }
    else
    {
      v8 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid upper call back function (phNciNfc_Nfcee_StartDiscovery)\n");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_Nfcee_StartDiscovery)\n");
    v8 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Nfcee_StartDiscovery");
  return v8;
}

uint64_t sub_2198FC2D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _BYTE *Memory;
  uint64_t v7;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Nfcee_StopDiscovery");
  if (a1)
  {
    if (a2)
    {
      Memory = (_BYTE *)phOsalNfc_GetMemory();
      if (Memory)
      {
        *(_BYTE *)(a1 + 4488) = 0;
        *Memory = 0;
        *(_QWORD *)(a1 + 848) = Memory;
        *(_DWORD *)(a1 + 856) = 1;
        *(_QWORD *)(a1 + 3384) = a2;
        *(_QWORD *)(a1 + 3712) = a3;
        *(_QWORD *)(a1 + 3736) = off_2550A2A60;
        *(_BYTE *)(a1 + 3936) = 0;
        *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A2A60);
        v7 = sub_2198AB184(a1, 0, 0);
        if ((_DWORD)v7 != 13)
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Nfcee Discover Sequence failed!");
          phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 848) = 0;
          *(_DWORD *)(a1 + 856) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Memory not available(phNciNfc_Nfcee_StopDiscovery)\n");
        v7 = 12;
      }
    }
    else
    {
      v7 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid upper call back function (phNciNfc_Nfcee_StopDiscovery)\n");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_Nfcee_StopDiscovery)\n");
    v7 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Nfcee_StopDiscovery");
  return v7;
}

uint64_t sub_2198FC458(uint64_t a1, uint64_t a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  _BYTE *Memory;
  unsigned int *v15;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Nfcee_ModeSet");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_Nfcee_ModeSet)\n");
    v10 = 49;
    goto LABEL_14;
  }
  if (a3 > 1 || !a4)
  {
    v10 = 1;
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameter passed(phNciNfc_Nfcee_ModeSet)\n");
    goto LABEL_14;
  }
  if (!a2)
  {
    Memory = (_BYTE *)phOsalNfc_GetMemory();
    if (Memory)
    {
      *(_DWORD *)(a1 + 3948) = a3;
      *(_QWORD *)(a1 + 3952) = 0;
      *Memory = 0;
      Memory[1] = a3;
      *(_QWORD *)(a1 + 848) = Memory;
      *(_DWORD *)(a1 + 856) = 2;
      *(_QWORD *)(a1 + 3384) = a4;
      *(_QWORD *)(a1 + 3712) = a5;
      *(_QWORD *)(a1 + 3736) = off_2550A2A40;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A2A40);
      v10 = sub_2198AB7F8(a1, 0, 0);
      if ((_DWORD)v10 == 13)
        goto LABEL_14;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Nfcee ModeSet Sequence failed!");
LABEL_22:
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 848) = 0;
      goto LABEL_14;
    }
    v15 = (unsigned int *)(a1 + 6476);
LABEL_20:
    sub_219850628(1, v15, 3u, 1u, (uint64_t)"Memory not available(phNciNfc_Nfcee_ModeSet)\n");
    v10 = 12;
    goto LABEL_14;
  }
  v10 = 1;
  if (!*(_BYTE *)(a2 + 1) || *(unsigned __int8 *)(a2 + 1) == 255)
    goto LABEL_14;
  v11 = (_BYTE *)phOsalNfc_GetMemory();
  if (!v11)
  {
    v15 = (unsigned int *)(a1 + 6476);
    goto LABEL_20;
  }
  *(_DWORD *)(a1 + 3948) = a3;
  *(_QWORD *)(a1 + 3952) = a2;
  *v11 = *(_BYTE *)(a2 + 1);
  v11[1] = a3;
  *(_QWORD *)(a1 + 848) = v11;
  *(_DWORD *)(a1 + 856) = 2;
  *(_BYTE *)(a1 + 6432) = 0;
  *(_QWORD *)(a1 + 3736) = off_2550A2A40;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A2A40);
  v12 = sub_2198AB7F8(a1, 0, 0);
  if ((_DWORD)v12 != 13)
  {
    v10 = v12;
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Nfcee ModeSet Sequence failed!");
    goto LABEL_22;
  }
  *(_QWORD *)(a1 + 3384) = a4;
  *(_QWORD *)(a1 + 3712) = a5;
  if (a3 == 1 && *(_BYTE *)(a2 + 1) == 1)
  {
    *(_QWORD *)(a1 + 768) = 0;
    *(_QWORD *)(a1 + 776) = 0;
  }
  else
  {
    *(_QWORD *)(a1 + 768) = a4;
    *(_QWORD *)(a1 + 776) = a5;
  }
  v10 = 13;
LABEL_14:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Nfcee_ModeSet");
  return v10;
}

uint64_t sub_2198FC704(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  _BYTE *Memory;
  uint64_t v9;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetPowerMode");
  if (a1)
  {
    if (a3)
    {
      Memory = (_BYTE *)phOsalNfc_GetMemory();
      if (Memory)
      {
        *(_DWORD *)(a1 + 3364) = a2;
        *Memory = a2;
        *(_QWORD *)(a1 + 848) = Memory;
        *(_DWORD *)(a1 + 856) = 1;
        *(_QWORD *)(a1 + 3384) = a3;
        *(_QWORD *)(a1 + 3712) = a4;
        *(_QWORD *)(a1 + 3736) = off_2550A0CC8;
        *(_BYTE *)(a1 + 3936) = 0;
        *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0CC8);
        v9 = sub_21988496C(a1, 0, 0);
        if ((_DWORD)v9 != 13)
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Set/Reset Standby mode Sequence failed!");
          phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 848) = 0;
          *(_DWORD *)(a1 + 856) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Memory not available(phNciNfc_SetPowerMode)\n");
        v9 = 12;
      }
    }
    else
    {
      v9 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameter passed(phNciNfc_SetPowerMode)\n");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_SetPowerMode)\n");
    v9 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetPowerMode");
  return v9;
}

uint64_t sub_2198FC894(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  uint64_t Memory;
  uint64_t v9;
  const char *v10;
  int v11;
  unsigned int *v12;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_PropConfigHsuBr");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_SetPowerMode)\n");
    v9 = 49;
    goto LABEL_11;
  }
  if (!a3)
  {
    v10 = "Invalid parameter passed(phNciNfc_SetPowerMode)\n";
    v9 = 1;
    v11 = 2;
    v12 = (unsigned int *)a1;
LABEL_10:
    sub_219850628(v11, v12, 3u, 1u, (uint64_t)v10);
    goto LABEL_11;
  }
  Memory = phOsalNfc_GetMemory();
  *(_QWORD *)(a1 + 4776) = Memory;
  if (!Memory)
  {
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Memory not available(Config HSU Br)\n");
    v9 = 12;
    goto LABEL_11;
  }
  if (a2 > 9)
  {
    v10 = "Invalid Baud rate";
    v9 = 1;
    v11 = 1;
    v12 = (unsigned int *)(a1 + 6476);
    goto LABEL_10;
  }
  phOsalNfc_MemCopy();
  *(_QWORD *)(a1 + 848) = *(_QWORD *)(a1 + 4776);
  *(_DWORD *)(a1 + 856) = 8;
  *(_QWORD *)(a1 + 3384) = a3;
  *(_QWORD *)(a1 + 3712) = a4;
  *(_QWORD *)(a1 + 3736) = off_2550A0CE8;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0CE8);
  v9 = sub_21985A05C(a1, 0, 0);
  if ((_DWORD)v9 != 13)
  {
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Configure HSU BR Sequence failed!");
    phOsalNfc_FreeMemory();
    *(_QWORD *)(a1 + 848) = 0;
  }
LABEL_11:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_PropConfigHsuBr");
  return v9;
}

uint64_t sub_2198FCA9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetMultiTagInfo");
  if (a1)
  {
    if (a2)
    {
      *(_QWORD *)(a1 + 3384) = a2;
      *(_QWORD *)(a1 + 3712) = a3;
      *(_QWORD *)(a1 + 3736) = off_2550A0D08;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0D08);
      v6 = sub_21985A05C(a1, 0, 0);
      if ((_DWORD)v6 != 13)
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Get Multi tag Info Sequence failed!");
    }
    else
    {
      v6 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameter passed(phNciNfc_GetMultiTagInfo)\n");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_GetMultiTagInfo)\n");
    v6 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetMultiTagInfo");
  return v6;
}

uint64_t sub_2198FCBB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ClrMultiTagInfo");
  if (a1)
  {
    if (a2)
    {
      *(_QWORD *)(a1 + 3384) = a2;
      *(_QWORD *)(a1 + 3712) = a3;
      *(_QWORD *)(a1 + 3736) = off_2550A0D28;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0D28);
      v6 = sub_21985A05C(a1, 0, 0);
      if ((_DWORD)v6 != 13)
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Clear Multi tag List Sequence failed!");
    }
    else
    {
      v6 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameter passed(phNciNfc_PropConfigClrMultiTag)\n");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_PropConfigClrMultiTag)\n");
    v6 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ClrMultiTagInfo");
  return v6;
}

uint64_t sub_2198FCCD4(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RegisterNotification");
  if (a1)
  {
    if (a3)
    {
      v8 = 0;
      switch(a2)
      {
        case 1:
          v8 = 0;
          *(_QWORD *)(a1 + 208) = a4;
          *(_QWORD *)(a1 + 216) = a3;
          break;
        case 2:
          v8 = 0;
          *(_QWORD *)(a1 + 224) = a4;
          *(_QWORD *)(a1 + 232) = a3;
          break;
        case 3:
          v8 = 0;
          *(_QWORD *)(a1 + 184) = a4;
          *(_QWORD *)(a1 + 192) = a3;
          break;
        case 4:
          v8 = 0;
          *(_QWORD *)(a1 + 240) = a4;
          *(_QWORD *)(a1 + 248) = a3;
          break;
        case 5:
          v8 = 0;
          *(_QWORD *)(a1 + 272) = a4;
          *(_QWORD *)(a1 + 280) = a3;
          break;
        case 7:
          v8 = 0;
          *(_QWORD *)(a1 + 288) = a4;
          *(_QWORD *)(a1 + 296) = a3;
          break;
        case 8:
          v8 = 0;
          *(_QWORD *)(a1 + 304) = a4;
          *(_QWORD *)(a1 + 312) = a3;
          break;
        case 9:
          v8 = 0;
          *(_QWORD *)(a1 + 320) = a4;
          *(_QWORD *)(a1 + 328) = a3;
          break;
        case 10:
          v8 = 0;
          *(_QWORD *)(a1 + 384) = a4;
          *(_QWORD *)(a1 + 392) = a3;
          break;
        case 11:
          v8 = 0;
          *(_QWORD *)(a1 + 256) = a4;
          *(_QWORD *)(a1 + 264) = a3;
          break;
        case 12:
          v8 = 0;
          *(_QWORD *)(a1 + 400) = a4;
          *(_QWORD *)(a1 + 408) = a3;
          break;
        case 13:
          v8 = 0;
          *(_QWORD *)(a1 + 416) = a4;
          *(_QWORD *)(a1 + 424) = a3;
          break;
        case 14:
          v8 = 0;
          *(_QWORD *)(a1 + 432) = a4;
          *(_QWORD *)(a1 + 440) = a3;
          break;
        case 16:
          v8 = 0;
          *(_QWORD *)(a1 + 464) = a4;
          *(_QWORD *)(a1 + 472) = a3;
          break;
        case 17:
          v8 = 0;
          *(_QWORD *)(a1 + 480) = a4;
          *(_QWORD *)(a1 + 488) = a3;
          break;
        case 18:
          v8 = 0;
          *(_QWORD *)(a1 + 520) = a3;
          *(_QWORD *)(a1 + 512) = a4;
          break;
        case 19:
          v8 = 0;
          *(_QWORD *)(a1 + 552) = a3;
          *(_QWORD *)(a1 + 544) = a4;
          break;
        case 20:
          v8 = 0;
          *(_QWORD *)(a1 + 568) = a3;
          *(_QWORD *)(a1 + 560) = a4;
          break;
        case 21:
          v8 = 0;
          *(_QWORD *)(a1 + 584) = a3;
          *(_QWORD *)(a1 + 576) = a4;
          break;
        case 23:
          v8 = 0;
          *(_QWORD *)(a1 + 336) = a4;
          *(_QWORD *)(a1 + 344) = a3;
          break;
        case 24:
          v8 = 0;
          *(_QWORD *)(a1 + 368) = a4;
          *(_QWORD *)(a1 + 376) = a3;
          break;
        case 26:
          v8 = 0;
          *(_QWORD *)(a1 + 536) = a3;
          *(_QWORD *)(a1 + 528) = a4;
          break;
        case 27:
          v8 = 0;
          *(_QWORD *)(a1 + 496) = a4;
          *(_QWORD *)(a1 + 504) = a3;
          break;
        case 28:
          v8 = 0;
          *(_QWORD *)(a1 + 632) = a3;
          *(_QWORD *)(a1 + 624) = a4;
          break;
        case 29:
          v8 = 0;
          *(_QWORD *)(a1 + 352) = a4;
          *(_QWORD *)(a1 + 360) = a3;
          break;
        case 30:
          v8 = 0;
          *(_QWORD *)(a1 + 648) = a3;
          *(_QWORD *)(a1 + 640) = a4;
          break;
        case 31:
          v8 = 0;
          *(_QWORD *)(a1 + 696) = a3;
          *(_QWORD *)(a1 + 688) = a4;
          break;
        case 32:
          v8 = 0;
          *(_QWORD *)(a1 + 664) = a3;
          *(_QWORD *)(a1 + 656) = a4;
          break;
        case 33:
          v8 = 0;
          *(_QWORD *)(a1 + 712) = a3;
          *(_QWORD *)(a1 + 704) = a4;
          break;
        case 34:
          v8 = 0;
          *(_QWORD *)(a1 + 672) = a3;
          *(_QWORD *)(a1 + 680) = a4;
          break;
        default:
          break;
      }
    }
    else
    {
      v8 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid input parameter");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Nci stack not initialized");
    v8 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RegisterNotification");
  return v8;
}

uint64_t sub_2198FCF54(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_NfccRegNtfBeforeNciResetCmd");
  if (a1)
  {
    if (a3)
    {
      v8 = 1;
      switch(a2)
      {
        case 4:
          v8 = 0;
          *(_QWORD *)(a1 + 240) = a4;
          *(_QWORD *)(a1 + 248) = a3;
          break;
        case 5:
          v8 = 0;
          *(_QWORD *)(a1 + 272) = a4;
          *(_QWORD *)(a1 + 280) = a3;
          break;
        case 9:
          v8 = 0;
          *(_QWORD *)(a1 + 320) = a4;
          *(_QWORD *)(a1 + 328) = a3;
          break;
        case 14:
          v8 = 0;
          *(_QWORD *)(a1 + 432) = a4;
          *(_QWORD *)(a1 + 440) = a3;
          break;
        case 15:
          v8 = 0;
          *(_QWORD *)(a1 + 448) = a4;
          *(_QWORD *)(a1 + 456) = a3;
          break;
        case 19:
          v8 = 0;
          *(_QWORD *)(a1 + 552) = a3;
          *(_QWORD *)(a1 + 544) = a4;
          break;
        case 20:
          v8 = 0;
          *(_QWORD *)(a1 + 568) = a3;
          *(_QWORD *)(a1 + 560) = a4;
          break;
        case 22:
          v8 = 0;
          *(_QWORD *)(a1 + 600) = a3;
          *(_QWORD *)(a1 + 592) = a4;
          break;
        case 23:
          v8 = 0;
          *(_QWORD *)(a1 + 336) = a4;
          *(_QWORD *)(a1 + 344) = a3;
          break;
        case 25:
          v8 = 0;
          *(_QWORD *)(a1 + 616) = a3;
          *(_QWORD *)(a1 + 608) = a4;
          break;
        case 29:
          v8 = 0;
          *(_QWORD *)(a1 + 352) = a4;
          *(_QWORD *)(a1 + 360) = a3;
          break;
        case 30:
          v8 = 0;
          *(_QWORD *)(a1 + 648) = a3;
          *(_QWORD *)(a1 + 640) = a4;
          break;
        case 31:
          v8 = 0;
          *(_QWORD *)(a1 + 696) = a3;
          *(_QWORD *)(a1 + 688) = a4;
          break;
        case 32:
          v8 = 0;
          *(_QWORD *)(a1 + 664) = a3;
          *(_QWORD *)(a1 + 656) = a4;
          break;
        case 33:
          v8 = 0;
          *(_QWORD *)(a1 + 712) = a3;
          *(_QWORD *)(a1 + 704) = a4;
          break;
        default:
          break;
      }
    }
    else
    {
      v8 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid input parameter");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Nci stack not initialized");
    v8 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_NfccRegNtfBeforeNciResetCmd");
  return v8;
}

uint64_t sub_2198FD114(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  _BYTE *Memory;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Connect");
  if (a1)
  {
    if (a2 && a4 && *(_BYTE *)(a2 + 8) && *(unsigned __int8 *)(a2 + 8) != 255)
    {
      Memory = (_BYTE *)phOsalNfc_GetMemory();
      if (Memory)
      {
        *Memory = *(_BYTE *)(a2 + 8);
        Memory[1] = *(_DWORD *)(a2 + 16);
        Memory[2] = a3;
        *(_QWORD *)(a1 + 160) = Memory;
        *(_BYTE *)(a1 + 168) = 3;
        *(_QWORD *)(a1 + 3384) = a4;
        *(_QWORD *)(a1 + 3712) = a5;
        *(_QWORD *)(a1 + 3736) = off_2550A0968;
        *(_BYTE *)(a1 + 3936) = 0;
        *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0968);
        v10 = sub_21986323C(a1, 0, 0);
        if ((_DWORD)v10 != 13)
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Connect Sequence failed!");
          phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 160) = 0;
          *(_QWORD *)(a1 + 3384) = 0;
          *(_QWORD *)(a1 + 3712) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Memory not available(phNciNfc_Connect)\n");
        v10 = 12;
      }
    }
    else
    {
      v10 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameter passed(phNciNfc_Connect)\n");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_Connect)\n");
    v10 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Connect");
  return v10;
}

uint64_t sub_2198FD2D0(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t Memory;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Deactivate");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_InterfaceDeactivate)\n");
    v11 = 49;
    goto LABEL_14;
  }
  if (!a3)
  {
    v11 = 1;
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameter passed (phNciNfc_InterfaceDeactivate)\n");
    goto LABEL_14;
  }
  *(_WORD *)(a1 + 3320) = 0;
  Memory = phOsalNfc_GetMemory();
  if (!Memory)
  {
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Memory not available(phNciNfc_Deactivate)\n");
    v11 = 12;
    goto LABEL_14;
  }
  v9 = (_BYTE *)Memory;
  *(_QWORD *)(a1 + 3384) = a3;
  *(_QWORD *)(a1 + 3712) = a4;
  v10 = sub_219863404(a1, a1 + 48, a2, (int *)(a1 + 172));
  if ((_DWORD)v10)
  {
    v11 = v10;
LABEL_6:
    phOsalNfc_FreeMemory();
    *(_QWORD *)(a1 + 848) = 0;
    *(_DWORD *)(a1 + 856) = 0;
    goto LABEL_14;
  }
  *(_BYTE *)(a1 + 6609) = 0;
  if (*(_QWORD *)(a1 + 4600))
  {
    phOsalNfc_FreeMemory();
    *(_QWORD *)(a1 + 4600) = 0;
  }
  sub_21986361C((unsigned int *)a1, a1 + 48);
  *(_DWORD *)(a1 + 172) = a2;
  *v9 = a2;
  *(_QWORD *)(a1 + 848) = v9;
  *(_DWORD *)(a1 + 856) = 1;
  sub_219861274((unsigned int *)(a1 + 888), 0);
  *(_QWORD *)(a1 + 3736) = off_2550A0988;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0988);
  v11 = sub_21986311C(a1, 0, 0);
  if ((_DWORD)v11 != 13 && *(_QWORD *)(a1 + 848))
    goto LABEL_6;
LABEL_14:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Deactivate");
  return v11;
}

uint64_t sub_2198FD4A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  unsigned int *v11;
  const char *v12;
  _BYTE *Memory;
  _QWORD *v14;
  uint64_t v15;
  unsigned int *v16;
  const char *v17;
  unsigned __int8 v19;
  __int16 v20;

  v20 = 0;
  v19 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigRfParameters");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v9 = 49;
    goto LABEL_23;
  }
  if (!a2 || !a3)
  {
    v11 = (unsigned int *)(a1 + 6476);
    v12 = "Invalid parameters";
    v9 = 1;
LABEL_8:
    sub_219850628(1, v11, 3u, 1u, (uint64_t)v12);
    goto LABEL_23;
  }
  v8 = sub_2198F4DC0((unsigned int *)a1, a2, &v20, &v19);
  if ((_DWORD)v8)
  {
    v9 = v8;
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Set Config parameter validation failed!");
    v10 = 0;
  }
  else
  {
    v10 = (unsigned __int16)(v20 + 2 * v19 + 1);
    Memory = (_BYTE *)phOsalNfc_GetMemory();
    *(_QWORD *)(a1 + 4776) = Memory;
    if (!Memory)
    {
      v14 = (_QWORD *)(a1 + 4776);
      v9 = 255;
      goto LABEL_20;
    }
    *Memory = v19;
    v9 = sub_2198F69B0((unsigned int *)a1, a2, *(_QWORD *)(a1 + 4776), v10);
  }
  v14 = (_QWORD *)(a1 + 4776);
  v15 = *(_QWORD *)(a1 + 4776);
  if ((_DWORD)v9 == 1)
  {
    v16 = (unsigned int *)(a1 + 6476);
    if (v15)
    {
      v17 = "Build Set config command payload failed!";
      v9 = 1;
LABEL_22:
      sub_219850628(1, v16, 3u, 1u, (uint64_t)v17);
      phOsalNfc_FreeMemory();
      *v14 = 0;
      goto LABEL_23;
    }
    v12 = "Input parameter validation failed!";
    v9 = 1;
    v11 = (unsigned int *)(a1 + 6476);
    goto LABEL_8;
  }
  if (!(_DWORD)v9 && v15)
  {
    *(_QWORD *)(a1 + 3384) = a3;
    *(_QWORD *)(a1 + 3712) = a4;
    *(_QWORD *)(a1 + 3736) = off_2550A3FD8;
    *(_BYTE *)(a1 + 3936) = 0;
    *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A3FD8);
    *(_QWORD *)(a1 + 848) = *(_QWORD *)(a1 + 4776);
    *(_DWORD *)(a1 + 856) = v10;
    v9 = sub_2198F46F0(a1, 0, 0);
    if ((_DWORD)v9 != 13)
    {
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Set Config Sequence failed!");
      sub_2198FBBC4(a1);
    }
    goto LABEL_23;
  }
LABEL_20:
  v16 = (unsigned int *)(a1 + 6476);
  sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Memory allocation for Set Config Cmd payload failed!");
  if (*(_QWORD *)(a1 + 4776))
  {
    v17 = "Freeing payload memory as Building Set Config payload failed!";
    goto LABEL_22;
  }
LABEL_23:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigRfParameters");
  return v9;
}

uint64_t sub_2198FD738(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t Memory;
  uint64_t v11;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRaw");
  if (a1)
  {
    if (a2 && a3)
    {
      Memory = phOsalNfc_GetMemory();
      *(_QWORD *)(a1 + 848) = Memory;
      if (Memory)
      {
        phOsalNfc_MemCopy();
        *(_QWORD *)(a1 + 3384) = a4;
        *(_QWORD *)(a1 + 3712) = a5;
        *(_QWORD *)(a1 + 3736) = off_2550A4018;
        *(_BYTE *)(a1 + 3936) = 0;
        *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A4018);
        *(_DWORD *)(a1 + 856) = a3;
        v11 = sub_2198F46F0(a1, 0, 0);
        if ((_DWORD)v11 != 13)
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Get Config Raw Sequence failed!");
          phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 848) = 0;
          *(_DWORD *)(a1 + 856) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Get Config Raw - memory allocation failed");
        v11 = 31;
      }
    }
    else
    {
      v11 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameters");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v11 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRaw");
  return v11;
}

uint64_t sub_2198FD8CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetTransitionValue");
  if (a1)
  {
    if (a2 && a3 == 2)
    {
      *(_QWORD *)(a1 + 848) = phOsalNfc_GetMemory();
      phOsalNfc_MemCopy();
      *(_QWORD *)(a1 + 3384) = a4;
      *(_QWORD *)(a1 + 3712) = a5;
      *(_QWORD *)(a1 + 3736) = off_2550A40B8;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A40B8);
      *(_DWORD *)(a1 + 856) = 2;
      v10 = sub_2198F46F0(a1, 0, 0);
      if ((_DWORD)v10 != 13)
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Get transition Sequence failed!");
        phOsalNfc_FreeMemory();
        *(_DWORD *)(a1 + 856) = 0;
        *(_QWORD *)(a1 + 848) = 0;
      }
    }
    else
    {
      v10 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameters");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v10 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetTransitionValue");
  return v10;
}

uint64_t sub_2198FDA3C(uint64_t a1, uint64_t a2, int *a3, uint64_t a4, uint64_t a5)
{
  _BYTE *Memory;
  _BYTE *v11;
  uint64_t v12;
  unsigned int *v13;
  const char *v14;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ConfigMapping");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v12 = 49;
    goto LABEL_16;
  }
  if (!a3 || !a4)
  {
    v12 = 1;
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameters");
    goto LABEL_16;
  }
  if (!(_DWORD)a2)
  {
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"No entries");
    goto LABEL_13;
  }
  if (sub_2198F49C4((unsigned int *)a1, a2, a3))
  {
LABEL_13:
    v13 = (unsigned int *)(a1 + 6476);
    v14 = "Parameter validation failed";
LABEL_14:
    sub_219850628(1, v13, 3u, 1u, (uint64_t)v14);
    goto LABEL_15;
  }
  if (sub_2198F4C10(a1, a2))
  {
LABEL_15:
    v12 = 255;
    goto LABEL_16;
  }
  Memory = (_BYTE *)phOsalNfc_GetMemory();
  if (!Memory)
  {
    v14 = "Memory allcation for command payload failed";
    v13 = (unsigned int *)(a1 + 6476);
    goto LABEL_14;
  }
  v11 = Memory;
  sub_2198F4CF4((unsigned int *)a1, Memory, a2, (uint64_t)a3);
  *(_QWORD *)(a1 + 3384) = a4;
  *(_QWORD *)(a1 + 3712) = a5;
  *(_QWORD *)(a1 + 3736) = off_2550A4038;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A4038);
  *(_QWORD *)(a1 + 848) = v11;
  *(_DWORD *)(a1 + 856) = 3 * a2 + 1;
  v12 = sub_2198F4814(a1, 0, 0);
  if ((_DWORD)v12 != 13)
  {
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Config Mapping Sequence failed!");
    sub_2198FBBC4(a1);
  }
LABEL_16:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_ConfigMapping");
  return v12;
}

uint64_t sub_2198FDC40(uint64_t a1, unsigned int a2, int *a3)
{
  unsigned int *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v10;
  unsigned __int16 v11;
  _QWORD v12[3];

  memset(v12, 0, sizeof(v12));
  v11 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_VerifyRtngTableConfig");
  if (a1)
  {
    if (!a3)
    {
      v6 = (unsigned int *)(a1 + 6476);
      v7 = "Invalid parameters";
      goto LABEL_8;
    }
    if (!a2)
    {
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"No entries");
      v8 = 255;
      goto LABEL_13;
    }
    if (sub_2198F77B0((unsigned int *)a1, a2, a3, &v11))
    {
      v6 = (unsigned int *)(a1 + 6476);
      v7 = "Input parameter validation failed";
LABEL_8:
      v8 = 1;
LABEL_9:
      sub_219850628(1, v6, 3u, 1u, (uint64_t)v7);
      goto LABEL_13;
    }
    if (v11 > *(unsigned __int16 *)(a1 + 14))
    {
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Input Routing config size exceeds Max routing table size                                     supported by NFCC");
      v8 = 139;
      goto LABEL_13;
    }
    v10 = sub_2198FDDEC(a1, (uint64_t)v12);
    if ((_DWORD)v10)
    {
      v8 = v10;
      v6 = (unsigned int *)(a1 + 6476);
      v7 = "Failed to get NFCC features!";
      goto LABEL_9;
    }
    v8 = sub_2198F7E2C((unsigned int *)a1, (uint64_t)v12, a2, (uint64_t)a3);
    if (!(_DWORD)v8)
    {
      *(_BYTE *)(a1 + 866) = a2;
      *(_QWORD *)(a1 + 4648) = a3;
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v8 = 49;
  }
LABEL_13:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_VerifyRtngTableConfig");
  return v8;
}

uint64_t sub_2198FDDEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  int v6;
  unsigned int v7;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetNfccFeatures");
  if (a1)
  {
    if (a2)
    {
      v4 = 0;
      v5 = *(_BYTE *)a2 & 0xFB | (4 * (*(_BYTE *)a1 & 1));
      *(_BYTE *)a2 = v5;
      *(_BYTE *)a2 = v5 & 0xFC | (*(_BYTE *)a1 >> 1) & 3;
      v6 = *(_BYTE *)(a2 + 4) & 0xFB | (4 * ((*(unsigned __int8 *)(a1 + 1) >> 1) & 1));
      *(_BYTE *)(a2 + 4) = v6;
      v7 = v6 & 0xFFFFFFFD | (2 * ((*(unsigned __int8 *)(a1 + 1) >> 2) & 1));
      *(_BYTE *)(a2 + 4) = v7;
      *(_BYTE *)(a2 + 4) = v7 & 0xFE | ((*(_BYTE *)(a1 + 1) & 8) != 0);
      LOBYTE(v7) = *(_BYTE *)(a2 + 8) & 0xFD | (2 * (*(_BYTE *)(a1 + 2) & 1));
      *(_BYTE *)(a2 + 8) = v7;
      *(_BYTE *)(a2 + 8) = v7 & 0xFE | ((*(_BYTE *)(a1 + 2) & 2) != 0);
      *(_DWORD *)(a2 + 12) = *(_DWORD *)(a1 + 21);
      *(_BYTE *)(a2 + 16) = *(_BYTE *)(a1 + 25);
      *(_BYTE *)(a2 + 17) = *(_BYTE *)(a1 + 28);
      *(_BYTE *)(a2 + 18) = *(_BYTE *)(a1 + 3);
      *(_WORD *)(a2 + 20) = *(_WORD *)(a1 + 14) - 5;
    }
    else
    {
      v4 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid input parameters!");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v4 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetNfccFeatures");
  return v4;
}

uint64_t sub_2198FDF3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngTableConfig");
  if (a1)
  {
    if (a2)
    {
      if (*(_WORD *)(a1 + 14))
      {
        *(_QWORD *)(a1 + 3384) = a2;
        *(_QWORD *)(a1 + 3712) = a3;
        *(_QWORD *)(a1 + 3736) = off_2550A4058;
        *(_BYTE *)(a1 + 3936) = 0;
        *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A4058);
        v6 = sub_2198F4934(a1, 0, 0);
        if ((_DWORD)v6 != 13)
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Get Rtng Config Sequence failed!");
          sub_2198FBBC4(a1);
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Max Rtng table size is '0', can not read Rtng table!");
        v6 = 255;
      }
    }
    else
    {
      v6 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameters");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v6 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRtngTableConfig");
  return v6;
}

uint64_t sub_2198FE090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  int v9;
  _BYTE *Memory;
  _BYTE *v11;
  __int16 v13;
  _BYTE v14[98];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRfParameters");
  if (a1)
  {
    if (a2 && a3)
    {
      v8 = sub_2198FAA7C((unsigned int *)a1, a2, v14, (_BYTE *)&v13 + 1, &v13);
      if (!(_DWORD)v8 && HIBYTE(v13))
      {
        v9 = v13 + 1;
        Memory = (_BYTE *)phOsalNfc_GetMemory();
        if (Memory)
        {
          v11 = Memory;
          *Memory = HIBYTE(v13);
          phOsalNfc_MemCopy();
          *(_QWORD *)(a1 + 3736) = off_2550A4078;
          *(_BYTE *)(a1 + 3936) = 0;
          *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A4078);
          *(_QWORD *)(a1 + 848) = v11;
          *(_DWORD *)(a1 + 856) = v9;
          *(_QWORD *)(a1 + 4648) = a2;
          phOsalNfc_SetMemory();
          *(_BYTE *)(a1 + 832) = HIBYTE(v13);
          *(_BYTE *)(a1 + 833) = v13;
          *(_QWORD *)(a1 + 840) = v11;
          v8 = sub_2198F4780(a1, 0, 0);
          if ((_DWORD)v8 == 13)
          {
            *(_QWORD *)(a1 + 3384) = a3;
            *(_QWORD *)(a1 + 3712) = a4;
          }
          else
          {
            sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Lower layer returned failure(phNciNfc_GetConfigRfParameters)\n");
            phOsalNfc_FreeMemory();
            *(_QWORD *)(a1 + 4648) = 0;
            *(_QWORD *)(a1 + 840) = 0;
            *(_QWORD *)(a1 + 848) = 0;
            *(_DWORD *)(a1 + 856) = 0;
          }
        }
        else
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Memory allocation failed (phNciNfc_GetConfigRfParameters)\n");
          v8 = 12;
        }
      }
    }
    else
    {
      v8 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameters (phNciNfc_GetConfigRfParameters)\n");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_GetConfigRfParameters)\n");
    v8 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetConfigRfParameters");
  return v8;
}

uint64_t sub_2198FE2D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int *v14;
  const char *v15;
  unsigned __int16 v17;
  double v18;
  unsigned int v19;
  __int16 v20;
  char v21;
  char v22;

  v22 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Transceive");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_Transceive)\n");
    v13 = 49;
    goto LABEL_23;
  }
  if (!a2 || !a3 || !a4)
  {
    v13 = 1;
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameters (phNciNfc_Transceive)\n");
    goto LABEL_23;
  }
  if (!*(_QWORD *)(a3 + 16) || !*(_DWORD *)(a3 + 24))
  {
    v14 = (unsigned int *)(a1 + 6476);
    v15 = " Invalid Send Buff Params. (phNciNfc_Transceive)\n";
LABEL_22:
    v13 = 1;
    sub_219850628(1, v14, 3u, 4u, (uint64_t)v15);
    goto LABEL_23;
  }
  if ((!*(_QWORD *)(a3 + 32) || !*(_DWORD *)(a3 + 40)) && *(_DWORD *)a3 != 4)
  {
    v14 = (unsigned int *)(a1 + 6476);
    v15 = " Invalid Recv Buff Params. (phNciNfc_Transceive)\n";
    goto LABEL_22;
  }
  if (*(unsigned __int16 *)(a3 + 6) <= 0x12Bu)
  {
    *(_WORD *)(a3 + 6) = 300;
    sub_219851790(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Input timeout is less than default, hence using default timeout: ");
  }
  v10 = *(_QWORD *)(a1 + 4512);
  if (!v10)
    goto LABEL_43;
  if (*(_DWORD *)(v10 + 12) != 1 || *(_DWORD *)(v10 + 16))
  {
    v11 = *(_DWORD *)(v10 + 4);
    if (v11 > 15)
    {
      if (v11 != 16)
      {
        if (v11 != 18)
          goto LABEL_36;
        v17 = sub_21988AFF4(a1, a3);
        goto LABEL_34;
      }
      v12 = *(unsigned __int8 *)(v10 + 109);
    }
    else
    {
      if ((v11 - 5) >= 3 && v11 != 3)
        goto LABEL_36;
      v12 = *(unsigned __int8 *)(v10 + 108);
    }
    v18 = (double)(1 << (v12 >> 4)) * 302.064897 / 1000.0;
    if ((int)v18 >= 0x54)
      v17 = 19896;
    else
      v17 = 236 * (int)v18 + 100;
    if ((v17 & 0xFFFCu) <= 0x7CF)
    {
      sub_219851790(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"FWT timeout is less than default, hence using default timeout: ");
      v17 = 2000;
    }
LABEL_34:
    if (*(unsigned __int16 *)(a3 + 6) < v17)
    {
      *(_WORD *)(a3 + 6) = v17;
      sub_219851790(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Transceive timeout is greater then default, value ");
    }
  }
LABEL_36:
  sub_219851790(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Transceive timeout value  ");
  if (*(_DWORD *)(*(_QWORD *)(a1 + 4512) + 4) == 20 && *(_DWORD *)a3 == 1)
  {
    sub_21988C4AC(*(_DWORD *)(a1 + 6476), *(_QWORD *)(a1 + 4656));
    *(_BYTE *)(a1 + 6464) = 0;
    sub_21988629C(1, (unsigned int *)(a1 + 6476), *(_QWORD *)(a1 + 4656), 3u, 4u, (uint64_t)"phNciNfc_Transceive");
    v19 = *(unsigned __int16 *)(a3 + 8);
    if (v19 >= 0xA)
    {
      if (v19 < 0x33)
        goto LABEL_43;
      v20 = 50;
    }
    else
    {
      v20 = 20;
    }
    *(_WORD *)(a3 + 8) = v20;
  }
LABEL_43:
  v13 = sub_219878C88((unsigned int *)a1, a2, &v22);
  if (!(_DWORD)v13)
  {
    v21 = v22;
    if (v22)
    {
      *(_DWORD *)(a1 + 4520) = *(_DWORD *)a3;
      *(_WORD *)(a1 + 4524) = *(_WORD *)(a3 + 4);
      *(_OWORD *)(a1 + 4536) = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(a1 + 4552) = *(_OWORD *)(a3 + 32);
      *(_DWORD *)(a1 + 4526) = *(_DWORD *)(a3 + 6);
      *(_BYTE *)(a1 + 3928) = v21;
      *(_QWORD *)(a1 + 848) = *(_QWORD *)(a3 + 16);
      *(_DWORD *)(a1 + 856) = *(_DWORD *)(a3 + 24);
      *(_QWORD *)(a1 + 3736) = off_2550A41B0;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A41B0);
      v13 = sub_21985A05C(a1, 0, 0);
      if ((_DWORD)v13 == 13)
      {
        *(_QWORD *)(a1 + 4576) = a4;
        *(_QWORD *)(a1 + 4584) = a5;
      }
      else
      {
        *(_QWORD *)(a1 + 848) = 0;
      }
    }
    else
    {
      *(_BYTE *)(a1 + 6612) = 1;
      *(_DWORD *)(a1 + 6616) = 0;
      *(_DWORD *)(a1 + 6620) = *(unsigned __int16 *)(a3 + 6);
      v13 = sub_2198F1114(a1, a2, a3, a4, a5);
      if ((_DWORD)v13 != 13)
      {
        *(_BYTE *)(a1 + 6612) = 0;
        *(_DWORD *)(a1 + 6616) = 0;
      }
    }
  }
LABEL_23:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Transceive");
  return v13;
}

uint64_t sub_2198FE724(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;
  char v24;

  v24 = 0;
  v22 = 0;
  v23 = 0;
  v21 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RegUnRegSeEvent");
  if (!a1)
    goto LABEL_6;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = *((_QWORD *)&unk_253E46700 + 14 * v11 + 4);
    if ((v10 & 1) != 0)
      break;
    v10 = 1;
    v11 = 1;
  }
  while (v12 != a1);
  if (v12 != a1)
  {
LABEL_6:
    sub_219850628(2, (unsigned int *)a1, 3u, 1u, (uint64_t)"Stack not initialized (phNciNfc_RegUnRegSeEvent)");
    v13 = 49;
    goto LABEL_7;
  }
  if (!a2 || !a4)
  {
    v13 = 1;
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameters (phNciNfc_RegUnRegSeEvent)");
    goto LABEL_7;
  }
  v13 = sub_219878C88((unsigned int *)a1, a2, &v24);
  if (!(_DWORD)v13)
  {
    v15 = *(_QWORD *)(a1 + 6480);
    v16 = a1 + 4672;
    if (a3)
    {
      if (sub_2198FEB9C(v15, a1 + 4672, a2, &v21))
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"phNciNfc_RegUnRegSeEvent: No registration found!");
LABEL_22:
        v13 = 255;
        goto LABEL_7;
      }
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"phNciNfc_RegUnRegSeEvent: Unregistering SE event");
      BYTE4(v23) = v24;
      LODWORD(v22) = 0;
      if (!sub_2198F3088((unsigned int *)(a1 + 888), (uint64_t)&v22, a4))
      {
        v13 = 0;
        v19 = v16 + 32 * v21;
        *(_BYTE *)v19 = 0;
        *(_QWORD *)(v19 + 16) = 0;
        *(_QWORD *)(v19 + 24) = 0;
        *(_QWORD *)(v19 + 8) = 0;
        goto LABEL_7;
      }
      v18 = "phNciNfc_RegUnRegSeEvent: Failed to unregister with Nci core";
      v17 = (unsigned int *)(a1 + 6476);
    }
    else if (sub_2198FE9D8(v15, a1 + 4672, &v21))
    {
      v17 = (unsigned int *)(a1 + 6476);
      v18 = "phNciNfc_RegUnRegSeEvent: No free slots available, registration failed!";
    }
    else
    {
      *(_QWORD *)(a1 + 6600) = a2;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"phNciNfc_RegUnRegSeEvent: Registering SE event with NCI Core");
      BYTE5(v23) = 2;
      BYTE4(v23) = v24;
      LODWORD(v22) = 0;
      if (!sub_2198F2F98((unsigned int *)(a1 + 888), (uint64_t)&v22, (uint64_t)sub_2198FEAA4, a1))
      {
        v13 = 0;
        v20 = v16 + 32 * v21;
        *(_QWORD *)(v20 + 16) = a5;
        *(_QWORD *)(v20 + 24) = a4;
        *(_QWORD *)(v20 + 8) = a2;
        *(_BYTE *)v20 = 1;
        goto LABEL_7;
      }
      v18 = "phNciNfc_RegUnRegSeEvent: Failed to register with Nci core";
      v17 = (unsigned int *)(a1 + 6476);
    }
    sub_219850628(1, v17, 3u, 1u, (uint64_t)v18);
    goto LABEL_22;
  }
LABEL_7:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_RegUnRegSeEvent");
  return v13;
}

uint64_t sub_2198FE9D8(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v10;

  v10 = a1;
  sub_219850718(0, (unsigned int *)&v10, 3u, 5u, (uint64_t)"phLibNfc_GetAvailableSlotIndex");
  v5 = 1;
  if (a2 && a3)
  {
    v6 = 0;
    v7 = 1;
    while (1)
    {
      v8 = v7;
      if (!*(_BYTE *)(a2 + 32 * v6))
        break;
      v7 = 0;
      v6 = 1;
      if ((v8 & 1) == 0)
      {
        sub_219850628(0, (unsigned int *)&v10, 3u, 1u, (uint64_t)"phLibNfc_GetAvailableSlotIndex: No Free slot available");
        v5 = 255;
        goto LABEL_8;
      }
    }
    v5 = 0;
    *a3 = v6;
  }
LABEL_8:
  sub_219850808(0, (unsigned int *)&v10, 3u, 5u, (uint64_t)"phLibNfc_GetAvailableSlotIndex");
  return v5;
}

uint64_t sub_2198FEAA4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t *, uint64_t);
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v14 = 0;
  v15 = 0;
  v16 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SeEventCb");
  if (a1)
  {
    if (!a2)
    {
      v15 = 0;
      LODWORD(v16) = 0;
      a2 = &v14;
    }
    v6 = 0;
    v7 = a1 + 4672;
    v8 = 1;
    do
    {
      v9 = v8;
      if (*(_BYTE *)(v7 + 32 * v6) == 1)
      {
        v10 = v7 + 32 * v6;
        if (*(_QWORD *)(a1 + 6600) == *(_QWORD *)(v10 + 8))
        {
          v11 = *(void (**)(uint64_t, uint64_t *, uint64_t))(v10 + 24);
          if (v11)
          {
            v12 = *(_QWORD *)(v7 + 32 * v6 + 16);
            *a2 = a1;
            v11(v12, a2, a3);
          }
        }
      }
      v8 = 0;
      v6 = 1;
    }
    while ((v9 & 1) != 0);
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SeEventCb");
  return 255;
}

uint64_t sub_2198FEB9C(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v12;

  v12 = a1;
  sub_219850718(0, (unsigned int *)&v12, 3u, 5u, (uint64_t)"phLibNfc_GetRegisteredSlotIndex");
  v7 = 1;
  if (a3 && a2 && a4)
  {
    v8 = 0;
    v9 = 1;
    while (1)
    {
      v10 = v9;
      if (*(_BYTE *)(a2 + 32 * v8) == 1 && *(_QWORD *)(a2 + 32 * v8 + 8) == a3)
        break;
      v9 = 0;
      v8 = 1;
      if ((v10 & 1) == 0)
      {
        sub_219850628(0, (unsigned int *)&v12, 3u, 4u, (uint64_t)"phLibNfc_GetAvailableSlotIndex: Registration not found");
        v7 = 255;
        goto LABEL_10;
      }
    }
    v7 = 0;
    *a4 = v8;
  }
LABEL_10:
  sub_219850808(0, (unsigned int *)&v12, 3u, 5u, (uint64_t)"phLibNfc_GetRegisteredSlotIndex");
  return v7;
}

uint64_t sub_2198FEC84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t Memory;
  uint64_t v7;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CreateLogicalConn");
  if (a1)
  {
    if (a2)
    {
      Memory = phOsalNfc_GetMemory();
      if (Memory)
      {
        *(_DWORD *)Memory = 1;
        *(_BYTE *)(Memory + 4) = 0;
        *(_QWORD *)(a1 + 3256) = Memory;
        *(_QWORD *)(a1 + 3384) = a2;
        *(_QWORD *)(a1 + 3712) = a3;
        v7 = sub_21987874C(a1, Memory, (uint64_t)sub_2198FEDBC, a1);
        if ((_DWORD)v7 != 13)
        {
          *(_QWORD *)(a1 + 3384) = 0;
          *(_QWORD *)(a1 + 3712) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Failed to Open logical connection in loopback mode");
        v7 = 255;
      }
    }
    else
    {
      v7 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid input parameters!");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v7 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CreateLogicalConn");
  return v7;
}

uint64_t sub_2198FEDBC(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  void (*v7)(_QWORD, uint64_t, uint64_t);
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  unsigned __int8 v14;
  __int16 v15;

  v15 = 0;
  v14 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_LogicalConnOpen_CB");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Invalid Nci handle passed!");
    a3 = 255;
    goto LABEL_26;
  }
  if ((_DWORD)a3 == 81)
  {
    v6 = 0;
  }
  else
  {
    if ((_DWORD)a3)
    {
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Log conn in loop back mode creation failed!");
      v6 = 0;
    }
    else
    {
      *(_BYTE *)(a1 + 3248) = 1;
      *(_BYTE *)(a1 + 3249) = *a2;
      if (*(_QWORD *)(a1 + 3256))
      {
        phOsalNfc_FreeMemory();
        *(_QWORD *)(a1 + 3256) = 0;
      }
      v6 = a1 + 6944;
      if (!sub_219878B08(a1, 1, 254, a1 + 6944)
        && !sub_219878E9C((unsigned int *)a1, a1 + 6944, (_BYTE *)&v15 + 1)
        && !sub_219878FB8((unsigned int *)a1, a1 + 6944, &v15)
        && !sub_219878C88((unsigned int *)a1, a1 + 6944, &v14))
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Available num of credits and Max pld size updated in remote dev structure");
        v13 = v14;
        sub_2198F3150(a1 + 888, v14, SHIBYTE(v15));
        sub_2198F3248(a1 + 888, v13, v15);
        a3 = 0;
        goto LABEL_16;
      }
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Failed due to logical conn or unavailable memory");
      if (*(_QWORD *)(a1 + 4512))
      {
        phOsalNfc_FreeMemory();
        v6 = 0;
        *(_QWORD *)(a1 + 4512) = 0;
      }
    }
    a3 = 255;
  }
LABEL_16:
  v7 = *(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 3384);
  if (v7)
  {
    if (v6)
      v8 = v6;
    else
      v8 = 0;
    v7(*(_QWORD *)(a1 + 3712), a3, v8);
  }
  v9 = 0;
  v10 = 0;
  do
  {
    v11 = *((_QWORD *)&unk_253E46700 + 14 * v10 + 4);
    if ((v9 & 1) != 0)
      break;
    v9 = 1;
    v10 = 1;
  }
  while (v11 != a1);
  if (v11 == a1)
  {
    *(_QWORD *)(a1 + 3384) = 0;
    *(_QWORD *)(a1 + 3712) = 0;
  }
LABEL_26:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_LogicalConnOpen_CB");
  return a3;
}

uint64_t sub_2198FF008(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CloseLogicalConn");
  if (a1)
  {
    if (a2)
    {
      if (*(_BYTE *)(a1 + 3248) == 1)
      {
        *(_QWORD *)(a1 + 3384) = a2;
        *(_QWORD *)(a1 + 3712) = a3;
        v6 = sub_2198789E0(a1, 254, (uint64_t)sub_2198FF12C, a1);
        if ((_DWORD)v6 != 13)
        {
          *(_QWORD *)(a1 + 3384) = 0;
          *(_QWORD *)(a1 + 3712) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"No Log conn in loop back mode exists");
        v6 = 255;
      }
    }
    else
    {
      v6 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid input parameters!");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v6 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CloseLogicalConn");
  return v6;
}

uint64_t sub_2198FF12C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(uint64_t, uint64_t, _QWORD);
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_LogicalConnClose_CB");
  if (a1)
  {
    if ((_DWORD)a3 != 81)
    {
      if ((_DWORD)a3)
        a3 = 255;
      else
        *(_WORD *)(a1 + 3248) = -256;
    }
    v5 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 3384);
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 3712);
      *(_QWORD *)(a1 + 3384) = 0;
      *(_QWORD *)(a1 + 3712) = 0;
      v5(v6, a3, 0);
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Invalid Nci handle passed!");
    a3 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_LogicalConnClose_CB");
  return a3;
}

uint64_t sub_2198FF1EC(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SwpSelfTest");
  if (a1)
  {
    if (a3)
    {
      *(_QWORD *)(a1 + 3384) = a3;
      *(_QWORD *)(a1 + 3712) = a4;
      *(_BYTE *)(a1 + 3264) = a2;
      *(_QWORD *)(a1 + 3736) = off_2550A09A8;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A09A8);
      v8 = sub_21985A05C(a1, 0, 0);
      if ((_DWORD)v8 != 13)
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"SwpSelfTest: Swp self test sequence failed!");
    }
    else
    {
      v8 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"SwpSelfTest: Invalid parameters");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"SwpSelfTest: Stack not initialized");
    v8 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SwpSelfTest");
  return v8;
}

uint64_t sub_2198FF310(uint64_t a1, int a2, int a3, __int16 a4, uint64_t a5, uint64_t a6)
{
  uint64_t Memory;
  uint64_t v13;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_PrbsTest");
  if (a1)
  {
    if (a5)
    {
      *(_QWORD *)(a1 + 3272) = 0;
      Memory = phOsalNfc_GetMemory();
      *(_QWORD *)(a1 + 3272) = Memory;
      if (Memory)
      {
        *(_QWORD *)(a1 + 3384) = a5;
        *(_QWORD *)(a1 + 3712) = a6;
        *(_DWORD *)Memory = a2;
        *(_DWORD *)(Memory + 4) = a3;
        *(_WORD *)(Memory + 8) = a4;
        *(_QWORD *)(a1 + 3736) = off_2550A09D8;
        *(_BYTE *)(a1 + 3936) = 0;
        *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A09D8);
        v13 = sub_21985A05C(a1, 0, 0);
        if ((_DWORD)v13 != 13)
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"PrbsTest: Prbs test sequence failed!");
          phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 3272) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"PrbsTest: MemAlloc for Params Failed!");
        v13 = 12;
      }
    }
    else
    {
      v13 = 1;
      sub_219850628(2, (unsigned int *)a1, 3u, 1u, (uint64_t)"PrbsTest: Invalid parameters");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"PrbsTest: Stack not initialized");
    v13 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_PrbsTest");
  return v13;
}

uint64_t sub_2198FF49C(unsigned int *a1, int a2, uint64_t a3, uint64_t a4)
{
  unsigned int *v7;
  char v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  v7 = a1;
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_Reset");
  if (!v7)
    goto LABEL_6;
  v8 = 0;
  v9 = 0;
  do
  {
    v10 = (unsigned int *)*((_QWORD *)&unk_253E46700 + 14 * v9 + 4);
    if ((v8 & 1) != 0)
      break;
    v8 = 1;
    v9 = 1;
  }
  while (v10 != v7);
  if (v10 == v7)
  {
    v13 = v7 + 1619;
    if (a2 == 2)
    {
      sub_219850628(1, v13, 3u, 4u, (uint64_t)"Nci Reset - phNciNfc_NciReset_Mgt_Reset");
      sub_21987FEF8(v7);
      phTmlNfc_WriteAbort();
      sub_21988F804(*((_QWORD *)v7 + 190), 0);
      phTmlNfc_ReadAbort();
      v11 = sub_2198AE9A8(v7);
      v7 = 0;
    }
    else
    {
      if (a2 == 1)
      {
        sub_219850628(1, v13, 3u, 4u, (uint64_t)"Nci Reset - phNciNfc_NciReset_DeInit_ResetConfig");
        sub_219860B08(v7 + 222);
        sub_21987FEF8(v7);
        phTmlNfc_WriteAbort();
        sub_21988F804(*((_QWORD *)v7 + 190), 0);
        v14 = (uint64_t)v7;
        v15 = a3;
        v16 = a4;
        v17 = 1;
      }
      else
      {
        if (a2)
        {
          v11 = 1;
          sub_219850628(1, v13, 3u, 2u, (uint64_t)"Invalid Nci Reset type");
          goto LABEL_7;
        }
        sub_219850628(1, v13, 3u, 4u, (uint64_t)"Nci Reset - phNciNfc_NciReset_DeInit_KeepConfig");
        sub_219860B08(v7 + 222);
        sub_21987FEF8(v7);
        phTmlNfc_WriteAbort();
        sub_21988F804(*((_QWORD *)v7 + 190), 0);
        v14 = (uint64_t)v7;
        v15 = a3;
        v16 = a4;
        v17 = 0;
      }
      v11 = sub_2198FF6A4(v14, v15, v16, v17);
    }
  }
  else
  {
LABEL_6:
    v11 = 1;
    sub_219850628(2, v7, 3u, 1u, (uint64_t)"phNciNfc_Reset: Invalid NCINFC context!!");
  }
LABEL_7:
  sub_219850808(2, v7, 3u, 5u, (uint64_t)"phNciNfc_Reset");
  return v11;
}

uint64_t sub_2198FF6A4(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Release");
  v8 = 1;
  if (a1 && a2)
  {
    *(_QWORD *)(a1 + 3384) = a2;
    *(_QWORD *)(a1 + 3712) = a3;
    *(_QWORD *)(a1 + 3736) = off_2550A0D48;
    *(_BYTE *)(a1 + 3936) = 0;
    *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0D48);
    *(_DWORD *)(a1 + 36) = a4;
    v8 = sub_21985A05C(a1, 0, 0);
    if ((_DWORD)v8 == 13)
      sub_219900694(a1);
    else
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Failed to Reset!");
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_Release");
  return v8;
}

uint64_t sub_2198FF794(uint64_t a1)
{
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_EnterNciRecoveryMode");
  if (a1)
  {
    sub_21987FEF8((unsigned int *)a1);
    phOsalNfc_Timer_Stop();
    *(_BYTE *)(a1 + 6464) = 0;
  }
  return sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_EnterNciRecoveryMode");
}

uint64_t sub_2198FF808(uint64_t a1, _BYTE *a2)
{
  char v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateAntennaConfigParams");
  if (a1 && a2)
  {
    phOsalNfc_MemCopy();
    if ((*a2 & 1) != 0)
    {
      v5 = 0;
      *(_BYTE *)(a1 + 3688) = 8;
      v4 = 1;
    }
    else
    {
      v4 = 0;
      v5 = 255;
    }
    *(_BYTE *)(a1 + 3698) = v4;
  }
  else
  {
    sub_219850628(2, (unsigned int *)a1, 3u, 1u, (uint64_t)"phNciNfc_UpdateAntennaConfigParams: Failed!");
    v5 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateAntennaConfigParams");
  return v5;
}

uint64_t sub_2198FF8D4(uint64_t a1, _BYTE *a2, uint64_t a3, uint64_t a4)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestCmd");
  if (!a1)
    goto LABEL_6;
  v8 = 0;
  v9 = 0;
  do
  {
    v10 = *((_QWORD *)&unk_253E46700 + 14 * v9 + 4);
    if ((v8 & 1) != 0)
      break;
    v8 = 1;
    v9 = 1;
  }
  while (v10 != a1);
  if (v10 == a1)
  {
    v11 = 1;
    if (a2)
    {
      if (a3)
      {
        v11 = sub_2198FF808(a1, a2);
        if (!(_DWORD)v11)
        {
          *(_QWORD *)(a1 + 3384) = a3;
          *(_QWORD *)(a1 + 3712) = a4;
          *(_QWORD *)(a1 + 3736) = off_2550A3F58;
          *(_BYTE *)(a1 + 3936) = 0;
          *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A3F58);
          v11 = sub_21985A05C(a1, 0, 0);
          if ((_DWORD)v11 != 13)
            sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Antenna Self Test command failed!");
        }
      }
    }
  }
  else
  {
LABEL_6:
    sub_219850628(2, (unsigned int *)a1, 3u, 1u, (uint64_t)"Stack not initialized");
    v11 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AntennaSelfTestCmd");
  return v11;
}

uint64_t sub_2198FFA28(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t Memory;
  int v14;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SendRfOnOffCmd");
  if (!a1)
    goto LABEL_6;
  v8 = 0;
  v9 = 0;
  do
  {
    v10 = *((_QWORD *)&unk_253E46700 + 14 * v9 + 4);
    if ((v8 & 1) != 0)
      break;
    v8 = 1;
    v9 = 1;
  }
  while (v10 != a1);
  if (v10 == a1)
  {
    if (a3)
    {
      Memory = phOsalNfc_GetMemory();
      *(_QWORD *)(a1 + 848) = Memory;
      if (Memory)
      {
        if (a2 == 2 || a2 == 1)
          v14 = 3;
        else
          v14 = 1;
        *(_DWORD *)(a1 + 856) = v14;
        phOsalNfc_MemCopy();
        *(_QWORD *)(a1 + 3384) = a3;
        *(_QWORD *)(a1 + 3712) = a4;
        *(_QWORD *)(a1 + 3736) = off_2550A3F38;
        *(_BYTE *)(a1 + 3936) = 0;
        *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A3F38);
        v11 = sub_21985A05C(a1, 0, 0);
        if ((_DWORD)v11 != 13)
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Send RF On or Off command failed!");
          phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 848) = 0;
          *(_DWORD *)(a1 + 856) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Failed to allocate memory, insufficient resuorces");
        v11 = 12;
      }
    }
    else
    {
      v11 = 1;
    }
  }
  else
  {
LABEL_6:
    sub_219850628(2, (unsigned int *)a1, 3u, 1u, (uint64_t)"Stack not initialized");
    v11 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SendRfOnOffCmd");
  return v11;
}

uint64_t sub_2198FFC14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t Memory;
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TriggerRfOnNtf");
  if (a1)
  {
    if (a3)
    {
      Memory = phOsalNfc_GetMemory();
      *(_QWORD *)(a1 + 848) = Memory;
      if (Memory)
      {
        *(_QWORD *)(a1 + 3384) = a3;
        *(_QWORD *)(a1 + 3712) = a4;
        phOsalNfc_MemCopy();
        *(_DWORD *)(a1 + 856) = 1;
        *(_QWORD *)(a1 + 3736) = off_2550A3F18;
        *(_BYTE *)(a1 + 3936) = 0;
        *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A3F18);
        v8 = sub_21985A05C(a1, 0, 0);
        if ((_DWORD)v8 != 13)
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Trigger RF On command failed!");
          phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 848) = 0;
          *(_DWORD *)(a1 + 856) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Failed to allocate memory, insufficient resuorces");
        v8 = 12;
      }
    }
    else
    {
      v8 = 1;
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v8 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TriggerRfOnNtf");
  return v8;
}

uint64_t sub_2198FFD90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_EnablePropExtn");
  if (a1)
  {
    if (a2)
    {
      *(_QWORD *)(a1 + 3384) = a2;
      *(_QWORD *)(a1 + 3712) = a3;
      *(_QWORD *)(a1 + 3736) = off_2550A3F98;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A3F98);
      v6 = sub_21985A05C(a1, 0, 0);
      if ((_DWORD)v6 != 13)
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Extension Enable command failed!");
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v6 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_EnablePropExtn");
  return v6;
}

uint64_t sub_2198FFE8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_PresenceChk");
  if (a1)
  {
    if (a2)
    {
      *(_QWORD *)(a1 + 3384) = a2;
      *(_QWORD *)(a1 + 3712) = a3;
      *(_QWORD *)(a1 + 3736) = off_2550A3F78;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A3F78);
      v6 = sub_2198F28C4(a1, 0, 0);
      if ((_DWORD)v6 != 13)
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Presence check (extension command) failed!");
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v6 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_PresenceChk");
  return v6;
}

uint64_t sub_2198FFF88(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t Memory;
  uint64_t v11;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigRaw");
  if (a1)
  {
    if (a2 && a3)
    {
      Memory = phOsalNfc_GetMemory();
      *(_QWORD *)(a1 + 848) = Memory;
      if (Memory)
      {
        phOsalNfc_MemCopy();
        *(_QWORD *)(a1 + 3384) = a4;
        *(_QWORD *)(a1 + 3712) = a5;
        *(_QWORD *)(a1 + 3736) = off_2550A3FD8;
        *(_BYTE *)(a1 + 3936) = 0;
        *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A3FD8);
        *(_DWORD *)(a1 + 856) = a3;
        v11 = sub_2198F46F0(a1, 0, 0);
        if ((_DWORD)v11 != 13)
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Set Config Raw Sequence failed!");
          phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 848) = 0;
          *(_DWORD *)(a1 + 856) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Failed to allocate memory, insufficient resuorces");
        v11 = 12;
      }
    }
    else
    {
      v11 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameters");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v11 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigRaw");
  return v11;
}

uint64_t sub_21990011C(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  uint64_t Memory;
  uint64_t v11;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigSignedRaw");
  if (a1)
  {
    if (a2 && a3)
    {
      Memory = phOsalNfc_GetMemory();
      *(_QWORD *)(a1 + 848) = Memory;
      if (Memory)
      {
        phOsalNfc_MemCopy();
        *(_QWORD *)(a1 + 3384) = a4;
        *(_QWORD *)(a1 + 3712) = a5;
        *(_QWORD *)(a1 + 3736) = off_2550A3FF8;
        *(_BYTE *)(a1 + 3936) = 0;
        *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A3FF8);
        *(_DWORD *)(a1 + 856) = a3;
        v11 = sub_2198F46F0(a1, 0, 0);
        if ((_DWORD)v11 != 13)
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Set Config Raw Sequence failed!");
          phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 848) = 0;
          *(_DWORD *)(a1 + 856) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Failed to allocate memory, insufficient resuorces");
        v11 = 12;
      }
    }
    else
    {
      v11 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid parameters");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v11 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetConfigSignedRaw");
  return v11;
}

uint64_t sub_2199002B0(uint64_t a1, char a2)
{
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortNciCtrPacket");
  if (a1)
  {
    sub_21987FEF8((unsigned int *)a1);
    sub_2199003D4(a1);
    sub_21986133C(a1 + 888);
    *(_BYTE *)(a1 + 4736) = 0;
    sub_21988C4AC(*(_DWORD *)(a1 + 6476), *(_QWORD *)(a1 + 4656));
    *(_BYTE *)(a1 + 6464) = 0;
    sub_21988629C(1, (unsigned int *)(a1 + 6476), *(_QWORD *)(a1 + 4656), 3u, 4u, (uint64_t)"phNciNfc_AbortNciCtrPacket");
    phOsalNfc_SetMemory();
    *(_BYTE *)(a1 + 6473) = a2;
    if (*(_QWORD *)(a1 + 4600))
    {
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"De-allocating Send Request Payload Buffer...");
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 4600) = 0;
      *(_DWORD *)(a1 + 4608) = 0;
    }
    sub_2198FBBC4(a1);
  }
  return sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortNciCtrPacket");
}

uint64_t sub_2199003D4(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StopRespWaitTimer");
  if (a1)
  {
    if (*(_BYTE *)(a1 + 1880) == 1)
    {
      phOsalNfc_Timer_Stop();
      *(_BYTE *)(a1 + 6464) = 0;
      *(_BYTE *)(a1 + 1880) = 0;
      v2 = 0;
      if (*(_DWORD *)(a1 + 6476))
        dword_253E4715C &= ~0x10u;
      else
        dword_253E47074 &= ~0x10u;
    }
    else
    {
      v2 = 0;
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v2 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StopRespWaitTimer");
  return v2;
}

uint64_t sub_2199004B4(uint64_t a1, int a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  unsigned int *v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;

  v14 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortDataTransfer");
  if (a1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 4);
      if ((v4 & 1) != 0)
        break;
      v4 = 1;
      v5 = 1;
    }
    while (v6 != a1);
    switch(a2)
    {
      case 0:
        sub_21987FEF8((unsigned int *)a1);
        *(_BYTE *)(a1 + 6435) = 0;
        *(_QWORD *)(a1 + 4584) = 0;
        *(_QWORD *)(a1 + 4576) = 0;
        if (*(_BYTE *)(a1 + 3288) == 1)
        {
          *(_BYTE *)(a1 + 3288) = 0;
          if (*(_QWORD *)(a1 + 3296))
          {
            phOsalNfc_FreeMemory();
            *(_QWORD *)(a1 + 3296) = 0;
          }
          *(_DWORD *)(a1 + 3304) = 16711680;
        }
        v7 = *(_QWORD *)(a1 + 3312);
        if (v7 && v7 != 0xFFFFFFFFFFFFLL)
        {
          phOsalNfc_Timer_Stop();
          phOsalNfc_Timer_Delete();
          *(_QWORD *)(a1 + 3312) = 0xFFFFFFFFFFFFLL;
        }
        if (!sub_219878C88((unsigned int *)a1, *(_QWORD *)(a1 + 4512), &v14))
        {
          LOBYTE(v11) = 1;
          v8 = v14;
          BYTE3(v11) = v14;
          v12 = a1;
          v13 = sub_219861918;
          sub_219860F20(a1 + 888, (uint64_t)&v11, 0);
          BYTE3(v11) = v8;
          v12 = a1;
          v13 = sub_21985B810;
          sub_219860F20(a1 + 888, (uint64_t)&v11, 0);
        }
        *(_BYTE *)(a1 + 6612) = 0;
        return sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortDataTransfer");
      case 1:
        *(_BYTE *)(a1 + 6568) = 0;
        v9 = (unsigned int *)a1;
        goto LABEL_19;
      case 2:
        v9 = (unsigned int *)a1;
        goto LABEL_19;
      case 3:
        *(_BYTE *)(a1 + 6612) = 0;
        v9 = (unsigned int *)a1;
LABEL_19:
        sub_21987FEF8(v9);
        break;
      default:
        return sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortDataTransfer");
    }
  }
  return sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortDataTransfer");
}

uint64_t sub_219900694(uint64_t a1)
{
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phLibNfc_ClearSeEvents");
  if (a1)
  {
    *(_BYTE *)(a1 + 4672) = 0;
    *(_BYTE *)(a1 + 4704) = 0;
  }
  return sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phLibNfc_ClearSeEvents");
}

uint64_t sub_2199006F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v5)(_QWORD, uint64_t, _QWORD);

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TriggerAssertCb");
  if (a1)
  {
    if (*(_QWORD *)(a1 + 848))
    {
      phOsalNfc_FreeMemory();
      *(_QWORD *)(a1 + 848) = 0;
    }
    v5 = *(void (**)(_QWORD, uint64_t, _QWORD))(a1 + 3384);
    if (v5)
      v5(*(_QWORD *)(a1 + 3712), a3, 0);
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TriggerAssertCb");
  return a3;
}

uint64_t sub_219900784(uint64_t a1, char a2, int *a3, uint64_t a4, uint64_t a5)
{
  uint64_t Memory;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;

  v16 = 0u;
  v17 = 0u;
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TriggerNfccAssert");
  if (a1)
  {
    if (a4)
    {
      Memory = phOsalNfc_GetMemory();
      if (Memory)
      {
        v11 = Memory;
        if (a3)
        {
          v12 = *a3;
          *(_BYTE *)Memory = 5;
          *(_WORD *)(Memory + 1) = v12;
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"Configuring NFCC Assert Timeout for MFW");
          *(_QWORD *)(a1 + 848) = v11;
          *(_DWORD *)(a1 + 856) = 3;
          *(_QWORD *)(a1 + 3736) = off_2550A0848;
          *(_BYTE *)(a1 + 3936) = 0;
          *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0848);
          v13 = sub_21985A05C(a1, 0, 0);
        }
        else
        {
          *(_BYTE *)Memory = a2;
          *(_QWORD *)(a1 + 848) = Memory;
          *(_DWORD *)(a1 + 856) = 1;
          phOsalNfc_SetMemory();
          *(_QWORD *)&v16 = 0xF00000001;
          DWORD2(v16) = 59;
          *(_QWORD *)&v17 = *(_QWORD *)(a1 + 848);
          DWORD2(v17) = *(_DWORD *)(a1 + 856);
          v13 = sub_2198F2E28(a1 + 888, &v16, (uint64_t)sub_2199006F8, a1);
        }
        v14 = v13;
        if ((_DWORD)v13 == 13)
        {
          *(_QWORD *)(a1 + 3384) = a4;
          *(_QWORD *)(a1 + 3712) = a5;
        }
        else
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"phNciNfc_TriggerNfccAssert: Sequence failed!");
          if (*(_QWORD *)(a1 + 848))
            phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 848) = 0;
          *(_DWORD *)(a1 + 856) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"phNciNfc_TriggerNfccAssert: Insufficient Memory ");
        v14 = 12;
      }
    }
    else
    {
      v14 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"Invalid input parameter!");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v14 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_TriggerNfccAssert");
  return v14;
}

uint64_t sub_2199009D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unsigned int v4;
  uint64_t v6;

  v6 = a1;
  sub_219850718(0, (unsigned int *)&v6, 3u, 5u, (uint64_t)"phNciNfc_ValidateNciSendState");
  if (sub_21988F8B8(v6) == 1)
  {
    if (!a2 || (v3 = *(_QWORD *)(a2 + 6576)) == 0)
    {
      a2 = 111;
      goto LABEL_13;
    }
  }
  else
  {
    if (!a2)
      goto LABEL_13;
    v3 = 0;
  }
  if (v3)
    v4 = 0;
  else
    v4 = 111;
  if (*(_BYTE *)(a2 + 5952))
    a2 = v4;
  else
    a2 = 0;
LABEL_13:
  sub_219850808(0, (unsigned int *)&v6, 3u, 5u, (uint64_t)"phNciNfc_ValidateNciSendState");
  return a2;
}

uint64_t sub_219900A7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRfCalSignedData");
  if (a1)
  {
    if (a2 && *(_QWORD *)a2 && a3 && *(_DWORD *)(a2 + 8))
    {
      *(_QWORD *)(a1 + 3384) = a3;
      *(_QWORD *)(a1 + 3712) = a4;
      *(_QWORD *)(a1 + 3280) = a2;
      *(_QWORD *)(a1 + 3736) = off_2550A0A08;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0A08);
      v8 = sub_21985A05C(a1, 0, 0);
      if ((_DWORD)v8 != 13)
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"SetRfCalSignedData: Sequence failed!");
    }
    else
    {
      v8 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"SetRfCalSignedData: Invalid parameters");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"SetRfCalSignedData: Stack not initialized");
    v8 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetRfCalSignedData");
  return v8;
}

uint64_t sub_219900BB4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unsigned int *v9;
  const char *v10;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRfCalSignedData");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"GetRfCalSignedData: Stack not initialized");
    v8 = 49;
    goto LABEL_10;
  }
  if (!a2 || !a3 || !*a2)
  {
    v9 = (unsigned int *)(a1 + 6476);
    v10 = "GetRfCalSignedData: Invalid parameters";
    v8 = 1;
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 3384) = a3;
  *(_QWORD *)(a1 + 3712) = a4;
  *(_QWORD *)(a1 + 3280) = a2;
  *(_QWORD *)(a1 + 3736) = off_2550A0A28;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0A28);
  v8 = sub_21985A05C(a1, 0, 0);
  if ((_DWORD)v8 != 13)
  {
    v9 = (unsigned int *)(a1 + 6476);
    v10 = "GetRfCalSignedData: Sequence failed!";
LABEL_8:
    sub_219850628(1, v9, 3u, 2u, (uint64_t)v10);
  }
LABEL_10:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRfCalSignedData");
  return v8;
}

uint64_t sub_219900CD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_FlushSramToFlash");
  if (a1)
  {
    if (a2)
    {
      *(_QWORD *)(a1 + 3736) = off_2550A3FB8;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A3FB8);
      v6 = sub_21985A05C(a1, 0, 0);
      if ((_DWORD)v6 == 13)
      {
        *(_QWORD *)(a1 + 3384) = a2;
        *(_QWORD *)(a1 + 3712) = a3;
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"Flush data command failed!");
      }
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v6 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_FlushSramToFlash");
  return v6;
}

uint64_t sub_219900DD4(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unsigned int *v9;
  const char *v10;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetSwioPadVoltage");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"phNciNfc_GetSwioPadVoltage: Stack not initialized");
    v8 = 49;
    goto LABEL_9;
  }
  if (!a3)
  {
    v9 = (unsigned int *)(a1 + 6476);
    v10 = "phNciNfc_GetSwioPadVoltage: Invalid parameters";
    v8 = 1;
LABEL_8:
    sub_219850628(1, v9, 3u, 1u, (uint64_t)v10);
    goto LABEL_9;
  }
  *(_BYTE *)(a1 + 4840) = a2;
  *(_QWORD *)(a1 + 3736) = off_2550A0768;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0768);
  v8 = sub_21985A05C(a1, 0, 0);
  if ((_DWORD)v8 != 13)
  {
    v9 = (unsigned int *)(a1 + 6476);
    v10 = "phNciNfc_GetSwioPadVoltage: Sequence failed!";
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 3384) = a3;
  *(_QWORD *)(a1 + 3712) = a4;
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetSwioPadVoltage");
  return v8;
}

uint64_t sub_219900EF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int *v7;
  const char *v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetAteTrimVersion");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"phNciNfc_GetAteTrimVersion: Stack not initialized");
    v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_GetAteTrimVersion: Invalid parameters";
    v6 = 1;
LABEL_8:
    sub_219850628(1, v7, 3u, 1u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 3736) = off_2550A0788;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0788);
  v6 = sub_21985A05C(a1, 0, 0);
  if ((_DWORD)v6 != 13)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_GetAteTrimVersion: Sequence failed!";
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 3384) = a2;
  *(_QWORD *)(a1 + 3712) = a3;
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetAteTrimVersion");
  return v6;
}

uint64_t sub_219901000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  const char *v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetEraseCounterInfo");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetEraseCounterInfo: Stack not initialized");
    v7 = 49;
    goto LABEL_9;
  }
  if (!a3)
  {
    v8 = "phNciNfc_GetEraseCounterInfo: Invalid parameters";
    v7 = 1;
LABEL_8:
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  phOsalNfc_MemCopy();
  *(_QWORD *)(a1 + 3736) = off_2550A07A8;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A07A8);
  v7 = sub_21985A05C(a1, 0, 0);
  if ((_DWORD)v7 != 13)
  {
    v8 = "phNciNfc_GetEraseCounterInfo: Sequence failed!";
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 3384) = a3;
  *(_QWORD *)(a1 + 3712) = a4;
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetEraseCounterInfo");
  return v7;
}

uint64_t sub_21990112C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int *v7;
  const char *v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetProhibitTimerStatus");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetProhibitTimerStatus: Stack not initialized");
    v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_GetProhibitTimerStatus: Invalid parameters";
    v6 = 1;
LABEL_8:
    sub_219850628(1, v7, 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 3736) = off_2550A07C8;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A07C8);
  v6 = sub_21985A05C(a1, 0, 0);
  if ((_DWORD)v6 != 13)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_GetProhibitTimerStatus: Sequence failed!";
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 3384) = a2;
  *(_QWORD *)(a1 + 3712) = a3;
  *(_QWORD *)(a1 + 800) = a2;
  *(_QWORD *)(a1 + 808) = a3;
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetProhibitTimerStatus");
  return v6;
}

uint64_t sub_219901244(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int *v7;
  const char *v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetPwrTrackData");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetPwrTrackData: Stack not initialized");
    v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_GetPwrTrackData: Invalid parameters";
    v6 = 1;
LABEL_8:
    sub_219850628(1, v7, 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 3736) = off_2550A07E8;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A07E8);
  v6 = sub_21985A05C(a1, 0, 0);
  if ((_DWORD)v6 != 13)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_GetPwrTrackData: Sequence failed!";
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 3384) = a2;
  *(_QWORD *)(a1 + 3712) = a3;
  *(_QWORD *)(a1 + 784) = a2;
  *(_QWORD *)(a1 + 792) = a3;
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetPwrTrackData");
  return v6;
}

uint64_t sub_21990135C(uint64_t a1, char a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateCrcChkFlag");
  if (a1)
  {
    v4 = 0;
    *(_BYTE *)(a1 + 6241) = a2;
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"Stack not initialized");
    v4 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateCrcChkFlag");
  return v4;
}

uint64_t sub_2199013F4(uint64_t a1, char a2)
{
  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateCrcAppendFlag");
  if (a1)
    *(_BYTE *)(a1 + 6240) = a2;
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateCrcAppendFlag");
  return 0;
}

uint64_t sub_21990145C(uint64_t a1, char a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateCrcSkpFlag");
  if (a1)
  {
    v4 = 0;
    *(_BYTE *)(a1 + 6242) = a2;
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"UpdateCrcSkpFlag: Stack not initialized");
    v4 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateCrcSkpFlag");
  return v4;
}

uint64_t sub_2199014F4(uint64_t a1, char a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreReqCrcCfg");
  if (a1)
  {
    v4 = 0;
    *(_BYTE *)(a1 + 6243) = a2;
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"StoreReqCrcCfg: Stack not initialized");
    v4 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_StoreReqCrcCfg");
  return v4;
}

uint64_t sub_21990158C(uint64_t a1, char a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateDtaStatusFlag");
  if (a1)
  {
    v4 = 0;
    *(_BYTE *)(a1 + 4737) = a2;
  }
  else
  {
    v4 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_UpdateDtaStatusFlag");
  return v4;
}

uint64_t sub_219901608(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int *v7;
  const char *v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetSmbLogInfo");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetSmbLogInfo: Stack not initialized");
    v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_GetSmbLogInfo: Invalid parameters";
    v6 = 1;
LABEL_8:
    sub_219850628(1, v7, 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 3736) = off_2550A0808;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0808);
  v6 = sub_21985A05C(a1, 0, 0);
  if ((_DWORD)v6 != 13)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_GetSmbLogInfo: Sequence failed!";
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 3384) = a2;
  *(_QWORD *)(a1 + 3712) = a3;
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetSmbLogInfo");
  return v6;
}

uint64_t sub_219901718(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int *v7;
  const char *v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetLpcdCount");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetLpcdCount: Stack not initialized");
    v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_GetLpcdCount: Invalid parameters";
    v6 = 1;
LABEL_8:
    sub_219850628(1, v7, 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 3736) = off_2550A0868;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0868);
  v6 = sub_21985A05C(a1, 0, 0);
  if ((_DWORD)v6 != 13)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_GetLpcdCount: Sequence failed!";
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 3384) = a2;
  *(_QWORD *)(a1 + 3712) = a3;
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetLpcdCount");
  return v6;
}

uint64_t sub_219901828(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  _BYTE *Memory;
  uint64_t v9;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetGenericDbgLogInfo");
  if (a1)
  {
    if (a3)
    {
      Memory = (_BYTE *)phOsalNfc_GetMemory();
      if (Memory)
      {
        *Memory = a2;
        *(_QWORD *)(a1 + 848) = Memory;
        *(_DWORD *)(a1 + 856) = 1;
        *(_QWORD *)(a1 + 3736) = off_2550A0828;
        *(_BYTE *)(a1 + 3936) = 0;
        *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0828);
        v9 = sub_21985A05C(a1, 0, 0);
        if ((_DWORD)v9 == 13)
        {
          *(_QWORD *)(a1 + 3384) = a3;
          *(_QWORD *)(a1 + 3712) = a4;
        }
        else
        {
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"phNciNfc_GetGenericDbgLogInfo: Sequence failed!");
          phOsalNfc_FreeMemory();
          *(_QWORD *)(a1 + 848) = 0;
          *(_DWORD *)(a1 + 856) = 0;
        }
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"phNciNfc_GetGenericDbgLogInfo: Insufficient Memory ");
        v9 = 12;
      }
    }
    else
    {
      v9 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"phNciNfc_GetGenericDbgLogInfo: Invalid parameters");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetGenericDbgLogInfo: Stack not initialized");
    v9 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetGenericDbgLogInfo");
  return v9;
}

uint64_t sub_2199019B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int *v7;
  const char *v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetFwType");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"phNciNfc_GetFwType: Stack not initialized");
    v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_GetFwType: Invalid parameters";
    v6 = 1;
LABEL_8:
    sub_219850628(1, v7, 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 3736) = off_2550A0888;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0888);
  v6 = sub_21985A05C(a1, 0, 0);
  if ((_DWORD)v6 != 13)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_GetFwType: Sequence failed!";
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 3384) = a2;
  *(_QWORD *)(a1 + 3712) = a3;
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetFwType");
  return v6;
}

uint64_t sub_219901AC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int *v7;
  const char *v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_DetectTagRemoval");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 2u, (uint64_t)"phNciNfc_DetectTagRemoval: Stack not initialized");
    v6 = 49;
    goto LABEL_9;
  }
  if (!a2)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_DetectTagRemoval: Invalid parameters";
    v6 = 1;
LABEL_8:
    sub_219850628(1, v7, 3u, 2u, (uint64_t)v8);
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 3736) = off_2550A08A8;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A08A8);
  v6 = sub_21985A05C(a1, 0, 0);
  if ((_DWORD)v6 != 13)
  {
    v7 = (unsigned int *)(a1 + 6476);
    v8 = "phNciNfc_DetectTagRemoval: Sequence failed!";
    goto LABEL_8;
  }
  *(_QWORD *)(a1 + 3384) = a2;
  *(_QWORD *)(a1 + 3712) = a3;
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_DetectTagRemoval");
  return v6;
}

uint64_t sub_219901BD8(uint64_t a1, int *a2, uint64_t a3, uint64_t a4)
{
  int v8;
  uint64_t (**v9)();
  uint64_t v10;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetNfccParams");
  if (a1)
  {
    if (a2 && a3)
    {
      *(_QWORD *)(a1 + 3392) = a2;
      v8 = *a2;
      if (*a2 == 3)
      {
        v9 = off_2550A08C8;
      }
      else if (v8 == 8)
      {
        v9 = off_2550A08E8;
      }
      else
      {
        if (v8 != 5)
        {
          v10 = 1;
          sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"phNciNfc_SetNfccParams: Invalid eNfccParam");
          *(_QWORD *)(a1 + 3392) = 0;
          goto LABEL_15;
        }
        v9 = off_2550A0928;
      }
      *(_QWORD *)(a1 + 3736) = v9;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, v9);
      v10 = sub_21985A05C(a1, 0, 0);
      if ((_DWORD)v10 == 13)
      {
        *(_QWORD *)(a1 + 3384) = a3;
        *(_QWORD *)(a1 + 3712) = a4;
        goto LABEL_16;
      }
LABEL_15:
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 2u, (uint64_t)"phNciNfc_SetNfccParams: Sequence failed!");
      goto LABEL_16;
    }
    v10 = 1;
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"phNciNfc_SetNfccParams: Invalid parameters");
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"phNciNfc_SetNfccParams: Stack not initialized");
    v10 = 49;
  }
LABEL_16:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetNfccParams");
  return v10;
}

uint64_t sub_219901D60(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  unsigned int *v9;
  const char *v10;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetNfccParams");
  if (!a1)
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"phNciNfc_GetNfccParams: Stack not initialized");
    v8 = 49;
    goto LABEL_11;
  }
  if (!a3)
  {
    v9 = (unsigned int *)(a1 + 6476);
    v10 = "phNciNfc_GetNfccParams: Invalid parameters";
    v8 = 1;
LABEL_10:
    sub_219850628(1, v9, 3u, 1u, (uint64_t)v10);
    goto LABEL_11;
  }
  if (a2 != 4)
  {
    v8 = 1;
    sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"phNciNfc_GetNfccParams: Invalid eGetNfccParams");
    goto LABEL_9;
  }
  *(_QWORD *)(a1 + 3736) = off_2550A0908;
  *(_BYTE *)(a1 + 3936) = 0;
  *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0908);
  v8 = sub_21985A05C(a1, 0, 0);
  if ((_DWORD)v8 != 13)
  {
LABEL_9:
    v9 = (unsigned int *)(a1 + 6476);
    v10 = "phNciNfc_GetNfccParams: Sequence failed!";
    goto LABEL_10;
  }
  *(_QWORD *)(a1 + 3384) = a3;
  *(_QWORD *)(a1 + 3712) = a4;
LABEL_11:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetNfccParams");
  return v8;
}

uint64_t sub_219901EA0(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  unsigned int *v6;
  const char *v7;
  int v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetNciParams");
  if (a1)
  {
    if (a3)
    {
      if (!(_DWORD)a2)
      {
        *a3 = *(_BYTE *)(a1 + 6449);
        *(_BYTE *)(a1 + 6449) = 0;
        *(_BYTE *)(a1 + 4568) = 0;
        goto LABEL_9;
      }
      v6 = (unsigned int *)(a1 + 6476);
      v7 = "phNciNfc_GetNciParams: Invalid Param(eGetNciParams)";
      a2 = 1;
      v8 = 1;
    }
    else
    {
      v7 = "phNciNfc_GetNciParams: Invalid parameters";
      a2 = 1;
      v8 = 2;
      v6 = (unsigned int *)a1;
    }
    sub_219850628(v8, v6, 3u, 1u, (uint64_t)v7);
  }
  else
  {
    sub_219850628(2, 0, 3u, 4u, (uint64_t)"phNciNfc_GetNciParams: Stack not initialized");
    a2 = 49;
  }
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetNciParams");
  return a2;
}

uint64_t sub_219901F90(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v5;

  v5 = a1;
  sub_219850718(0, (unsigned int *)&v5, 3u, 5u, (uint64_t)"phNciNfc_ChkFelicaTag");
  if (a2)
  {
    v3 = 255;
    if (*(_DWORD *)(a2 + 20) == 2)
    {
      if (*(_DWORD *)(a2 + 16) == 3)
        v3 = 0;
      else
        v3 = 255;
    }
  }
  else
  {
    v3 = 255;
  }
  sub_219850808(0, (unsigned int *)&v5, 3u, 5u, (uint64_t)"phNciNfc_ChkFelicaTag");
  return v3;
}

uint64_t sub_21990201C(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRfErrorStatus");
  if (a1)
  {
    v2 = *(unsigned __int16 *)(a1 + 6570);
    *(_WORD *)(a1 + 6570) = 0;
  }
  else
  {
    v2 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetRfErrorStatus");
  return v2;
}

uint64_t sub_219902088(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreReset");
  if (a1)
  {
    if (a2)
    {
      *(_QWORD *)(a1 + 848) = 0;
      *(_DWORD *)(a1 + 856) = 0;
      *(_QWORD *)(a1 + 3384) = a2;
      *(_QWORD *)(a1 + 3712) = a3;
      *(_DWORD *)(a1 + 36) = 0;
      *(_QWORD *)(a1 + 3736) = off_2550A0C88;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0C88);
      v6 = sub_21985A05C(a1, 0, 0);
      if ((_DWORD)v6 != 13)
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"phNciNfc_CoreReset:gphNciNfc_CoreResetSequence failed");
        *(_QWORD *)(a1 + 848) = 0;
        *(_DWORD *)(a1 + 856) = 0;
      }
    }
    else
    {
      v6 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"phNciNfc_CoreReset:Invalid parameter passed");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"phNciNfc_CoreReset:Stack not initialized");
    v6 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreReset");
  return v6;
}

uint64_t sub_2199021B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreInit");
  if (a1)
  {
    if (a2)
    {
      *(_QWORD *)(a1 + 848) = 0;
      *(_DWORD *)(a1 + 856) = 0;
      *(_QWORD *)(a1 + 3384) = a2;
      *(_QWORD *)(a1 + 3712) = a3;
      *(_WORD *)(a1 + 40) = 256;
      *(_QWORD *)(a1 + 3736) = off_2550A0CA8;
      *(_BYTE *)(a1 + 3936) = 0;
      *(_BYTE *)(a1 + 3937) = sub_21987CDC4((unsigned int *)a1, off_2550A0CA8);
      v6 = sub_21985A05C(a1, 0, 0);
      if ((_DWORD)v6 != 13)
      {
        sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"phNciNfc_CoreInit:gphNciNfc_CoreResetSequence failed");
        *(_QWORD *)(a1 + 848) = 0;
        *(_DWORD *)(a1 + 856) = 0;
      }
    }
    else
    {
      v6 = 1;
      sub_219850628(1, (unsigned int *)(a1 + 6476), 3u, 1u, (uint64_t)"phNciNfc_CoreInit:Invalid parameter passed");
    }
  }
  else
  {
    sub_219850628(2, 0, 3u, 1u, (uint64_t)"phNciNfc_CoreInit:Stack not initialized");
    v6 = 49;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_CoreInit");
  return v6;
}

uint64_t sub_2199022EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetDnldCoreContext");
  if (a1)
  {
    v4 = 0;
    *(_QWORD *)(a1 + 6576) = a2;
  }
  else
  {
    v4 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetDnldCoreContext");
  return v4;
}

uint64_t sub_219902364(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetDnldEseCoreContext");
  if (a1)
  {
    v4 = 0;
    *(_QWORD *)(a1 + 6584) = a2;
  }
  else
  {
    v4 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SetDnldEseCoreContext");
  return v4;
}

uint64_t sub_2199023DC(uint64_t a1, char a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SeDataPktDelayCfg");
  if (!a1)
    goto LABEL_6;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 4);
    if ((v4 & 1) != 0)
      break;
    v4 = 1;
    v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1)
  {
    if (*(_BYTE *)(a1 + 4788) == 1)
      v8 = a2;
    else
      v8 = 0;
    *(_BYTE *)(a1 + 6608) = v8;
    sub_219851790(1, (unsigned int *)(a1 + 6476), 3u, 4u, (uint64_t)"phNciNfc_SeDataPktDelayCfg: pNciCtx->bSeTxDelay");
    v7 = 0;
  }
  else
  {
LABEL_6:
    v7 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_SeDataPktDelayCfg");
  return v7;
}

uint64_t sub_2199024B8(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetSeCreditToStatus");
  if (!a1)
    goto LABEL_6;
  v2 = 0;
  v3 = 0;
  do
  {
    v4 = *((_QWORD *)&unk_253E46700 + 14 * v3 + 4);
    if ((v2 & 1) != 0)
      break;
    v2 = 1;
    v3 = 1;
  }
  while (v4 != a1);
  if (v4 == a1)
    v5 = *(unsigned __int16 *)(a1 + 6610);
  else
LABEL_6:
    v5 = 255;
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_GetSeCreditToStatus");
  return v5;
}

uint64_t sub_219902558(uint64_t a1)
{
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortDataPktRetransmission");
  if (!a1)
    goto LABEL_6;
  v2 = 0;
  v3 = 0;
  do
  {
    v4 = *((_QWORD *)&unk_253E46700 + 14 * v3 + 4);
    if ((v2 & 1) != 0)
      break;
    v2 = 1;
    v3 = 1;
  }
  while (v4 != a1);
  if (v4 == a1)
  {
    v5 = 0;
    *(_BYTE *)(a1 + 6612) = 0;
  }
  else
  {
LABEL_6:
    v5 = 255;
  }
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_AbortDataPktRetransmission");
  return v5;
}

uint64_t sub_219902600(unsigned int *a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  unsigned int *v6;
  uint64_t v7;
  unsigned int v8;
  unsigned __int8 v9;

  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciNfc_VldtRmtDevConnectedHandle");
  if (a1)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = (unsigned int *)*((_QWORD *)&unk_253E46700 + 14 * v5 + 4);
      if ((v4 & 1) != 0)
        break;
      v4 = 1;
      v5 = 1;
    }
    while (v6 != a1);
    v7 = 255;
    if (a2)
    {
      if (v6 == a1)
      {
        v8 = a1[18];
        if (v8)
        {
          v9 = 0;
          while (*(_QWORD *)&a1[2 * v9 + 20] != a2)
          {
            if (v8 <= ++v9)
              goto LABEL_11;
          }
          v7 = 0;
        }
      }
    }
  }
  else
  {
LABEL_11:
    v7 = 255;
  }
  sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciNfc_VldtRmtDevConnectedHandle");
  return v7;
}

uint64_t sub_2199026DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = a1;
  sub_219850718(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_ChkNdef");
  sub_21988EF68(v10, &v9);
  v5 = 1;
  if (a3)
  {
    if (a2)
    {
      v6 = v9;
      if (v9)
      {
        *(_QWORD *)(v9 + 8) = a2;
        *(_QWORD *)(v6 + 40) = a3;
        *(_BYTE *)(v6 + 540) = 1;
        *(_BYTE *)(v6 + 547) = 1;
        *(_BYTE *)(v6 + 644) = 0;
        *(_WORD *)(v6 + 656) = 0;
        *(_BYTE *)(v6 + 660) = 0;
        *(_DWORD *)(v6 + 918) = 0;
        *(_BYTE *)(v6 + 545) = 3;
        *(_BYTE *)(v6 + 642) = 0;
        phOsalNfc_SetMemory();
        phOsalNfc_SetMemory();
        v7 = (_BYTE *)v9;
        *(_BYTE *)(v9 + 544) = 5;
        *v7 = 1;
        v7[646] = 9;
        v7[266] = 16;
        v5 = sub_2199027F4((uint64_t)v7);
      }
    }
  }
  sub_219850808(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_ChkNdef");
  return v5;
}

uint64_t sub_2199027F4(uint64_t a1)
{
  int v2;
  char v3;
  __int16 v4;
  uint64_t v5;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_NxpRead");
  *(_BYTE *)(a1 + 204) &= 0xFCu;
  *(_BYTE *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 48) = sub_219903134;
  *(_QWORD *)(a1 + 56) = a1;
  *(_WORD *)(a1 + 264) = 260;
  *(_DWORD *)(a1 + 232) = 0;
  v2 = *(unsigned __int8 *)(a1 + 266);
  if (v2 == 120)
  {
    phOsalNfc_MemCopy();
    v4 = 7;
    if (*(_BYTE *)(a1 + 266) == 120)
      goto LABEL_10;
  }
  else
  {
    if (v2 == 16)
    {
      v3 = 16 * *(_BYTE *)(a1 + 660);
    }
    else
    {
      if (v2 != 2)
      {
        v5 = 245;
        goto LABEL_12;
      }
      v3 = *(_BYTE *)(a1 + 642);
    }
    *(_BYTE *)(a1 + 267) = v3;
    v4 = 2;
  }
  phOsalNfc_MemCopy();
  phOsalNfc_MemCopy();
  v4 += 12;
LABEL_10:
  *(_WORD *)(a1 + 526) = v4;
  v5 = sub_219888630(a1, (uint64_t)sub_2199051B4);
LABEL_12:
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_NxpRead");
  return v5;
}

uint64_t sub_219902968(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  char *v14;
  BOOL v15;
  char v16;
  char v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  __int16 v21;
  uint64_t v23;
  uint64_t v24[34];

  v24[33] = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24[0] = a1;
  sub_219850718(0, (unsigned int *)v24, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_RdNdef");
  sub_21988EF68(v24[0], &v23);
  v11 = 1;
  if (a4 <= 1)
  {
    if (a3)
    {
      if (a2)
      {
        if (a5)
        {
          v12 = v23;
          if (v23)
          {
            if (a4 == 1 || *(_BYTE *)(v23 + 540) != 3)
            {
              *(_QWORD *)(v23 + 16) = a5;
              *(_QWORD *)(v12 + 40) = a6;
              *(_BYTE *)(v12 + 547) = 2;
              *(_QWORD *)(v12 + 240) = a2;
              *(_DWORD *)(v12 + 248) = *a3;
              *(_QWORD *)(v12 + 552) = a3;
              *a3 = 0;
              *(_WORD *)(v12 + 252) = 0;
              *(_BYTE *)(v12 + 560) = a4;
              *(_BYTE *)(v12 + 644) = 1;
              *(_BYTE *)(v12 + 647) = 0;
              *(_BYTE *)(v12 + 540) = 2;
              if (a4 || *(_BYTE *)(v12 + 645) != 1)
              {
                if (*(_BYTE *)(v12 + 545) && *(_WORD *)(v12 + 922))
                {
                  if (a4 == 1)
                  {
                    *(_BYTE *)(v12 + 560) = 1;
                    *(_WORD *)(v12 + 656) = 0;
                    *(_WORD *)(v12 + 926) = 0;
                    *(_BYTE *)(v12 + 917) = 0;
                    *(_BYTE *)(v12 + 645) = 0;
                    *(_BYTE *)(v12 + 642) = 0;
                    *(_BYTE *)(v12 + 921) = 0;
                    v13 = sub_219902C98(v12) >> 7;
                    v14 = (char *)v23;
                    *(_BYTE *)(v23 + 660) = v13;
                    v15 = v14[65] == 0;
                    if (v14[65])
                      v16 = 1;
                    else
                      v16 = 4;
                    *v14 = v16;
                    v14[645] = 0;
                    if (v15)
                      v17 = 120;
                    else
                      v17 = 16;
                    v14[266] = v17;
                    v11 = sub_2199027F4((uint64_t)v14);
                  }
                  else
                  {
                    *(_BYTE *)v12 = 1;
                    sub_219850718(2, (unsigned int *)v12, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_RemainingReadDataCopy");
                    v18 = *(unsigned __int8 *)(v12 + 917);
                    v19 = *(unsigned __int16 *)(v12 + 252);
                    if (*(_BYTE *)(v12 + 917))
                    {
                      v20 = *(_DWORD *)(v12 + 248) - v19;
                      phOsalNfc_MemCopy();
                      if (v18 > v20)
                      {
                        phOsalNfc_MemCopy();
                        phOsalNfc_MemCopy();
                        LOWORD(v18) = v20;
                      }
                      LOWORD(v19) = *(_WORD *)(v12 + 252) + v18;
                      *(_WORD *)(v12 + 252) = v19;
                      *(_BYTE *)(v12 + 917) -= v18;
                      v21 = *(_WORD *)(v12 + 926) - v18;
                      *(_WORD *)(v12 + 926) = v21;
                    }
                    else
                    {
                      v21 = *(_WORD *)(v12 + 926);
                    }
                    if (v21)
                    {
                      if (*(_DWORD *)(v12 + 248) == (unsigned __int16)v19)
                      {
                        v11 = 0;
                        **(_DWORD **)(v12 + 552) = (unsigned __int16)v19;
                      }
                      else
                      {
                        ++*(_BYTE *)(v12 + 660);
                        *(_BYTE *)(v12 + 266) = 16;
                        v11 = sub_2199027F4(v12);
                      }
                    }
                    else
                    {
                      v11 = 0;
                      **(_DWORD **)(v12 + 552) = (unsigned __int16)v19;
                      *(_BYTE *)(v12 + 917) = 0;
                      *(_BYTE *)(v12 + 645) = 1;
                    }
                    sub_219850808(2, (unsigned int *)v12, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_RemainingReadDataCopy");
                  }
                }
                else
                {
                  v11 = 20;
                }
              }
              else
              {
                v11 = 26;
              }
            }
            else
            {
              v11 = 245;
            }
          }
        }
      }
    }
  }
  sub_219850808(0, (unsigned int *)v24, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_RdNdef");
  return v11;
}

uint64_t sub_219902C98(uint64_t a1)
{
  unsigned int v2;
  int v3;
  int v4;
  unsigned int v5;
  unsigned __int16 v6;
  unsigned __int16 v7;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetNDEFValueFieldAddrForRead");
  LOBYTE(v2) = 0;
  v3 = *(unsigned __int16 *)(a1 + 918);
  do
  {
    if ((unsigned __int16)(v3 + 1) == 104)
      v4 = 128;
    else
      v4 = v3 + 1;
    v3 = v4 + sub_219905248(a1, (unsigned __int16)v4);
    v2 = (v2 + 1);
    if (*(unsigned __int16 *)(a1 + 922) <= 0xFEu)
      v5 = 1;
    else
      v5 = 3;
  }
  while (v2 < v5);
  if ((unsigned __int16)(v3 + 1) == 104)
    v6 = 128;
  else
    v6 = v3 + 1;
  v7 = sub_219905248(a1, v6) + v6;
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetNDEFValueFieldAddrForRead");
  return v7;
}

uint64_t sub_219902D70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = a1;
  sub_219850718(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_ConvertToReadOnly");
  sub_21988EF68(v10, &v9);
  v5 = 1;
  if (a2)
  {
    v6 = v9;
    if (v9)
    {
      *(_QWORD *)(v9 + 32) = a2;
      *(_QWORD *)(v6 + 40) = a3;
      *(_BYTE *)(v6 + 547) = 6;
      *(_BYTE *)v6 = 17;
      *(_WORD *)(v6 + 642) = 769;
      *(_BYTE *)(v6 + 266) = 83;
      if (sub_21987BA3C(*(_QWORD *)(v6 + 2712)) == 1)
        v7 = 0;
      else
        v7 = 15;
      byte_2550A41D0 = v7;
      v5 = sub_219902E60(v9, (uint64_t)&byte_2550A41D0, 1);
      if ((_DWORD)v5 == 13)
        *(_BYTE *)(v9 + 928) = 0;
    }
  }
  sub_219850808(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_ConvertToReadOnly");
  return v5;
}

uint64_t sub_219902E60(uint64_t a1, uint64_t a2, char a3)
{
  int v5;
  char v6;
  uint64_t v7;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_NxpWrite");
  *(_BYTE *)(a1 + 204) &= 0xFCu;
  *(_BYTE *)(a1 + 208) = 0;
  *(_QWORD *)(a1 + 48) = sub_219903134;
  *(_QWORD *)(a1 + 56) = a1;
  *(_WORD *)(a1 + 264) = 260;
  *(_DWORD *)(a1 + 232) = 0;
  v5 = *(unsigned __int8 *)(a1 + 266);
  if (v5 == 84)
  {
    v6 = *(_BYTE *)(a1 + 642);
  }
  else
  {
    if (v5 != 83)
    {
      v7 = 245;
      goto LABEL_7;
    }
    v6 = *(_BYTE *)(a1 + 643) | (8 * *(_BYTE *)(a1 + 642));
  }
  *(_BYTE *)(a1 + 267) = v6;
  phOsalNfc_MemCopy();
  phOsalNfc_MemCopy();
  *(_WORD *)(a1 + 526) = (a3 + 6);
  v7 = sub_219888630(a1, (uint64_t)sub_2199051B4);
LABEL_7:
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_NxpWrite");
  return v7;
}

uint64_t sub_219902F78(uint64_t a1, uint64_t a2, _DWORD *a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _DWORD *v15;
  uint64_t v17;
  uint64_t v18;

  v17 = 0;
  v18 = a1;
  sub_219850718(0, (unsigned int *)&v18, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_WrNdef");
  sub_21988EF68(v18, &v17);
  v11 = 1;
  if (a3 && a5 && v17)
  {
    phOsalNfc_MemCopy();
    v12 = v17;
    *(_DWORD *)(v17 + 2740) = 3;
    *(_QWORD *)(v12 + 24) = a5;
    *(_QWORD *)(v12 + 40) = a6;
    *(_BYTE *)(v12 + 547) = 3;
    *(_WORD *)(v12 + 252) = 0;
    **(_WORD **)(v12 + 528) = 0;
    v13 = v17;
    v14 = v17 + 2736;
    if (*a3)
      v15 = a3;
    else
      v15 = (_DWORD *)(v17 + 2740);
    if (*a3)
      v14 = a2;
    *(_QWORD *)(v17 + 240) = v14;
    *(_DWORD *)(v13 + 248) = *v15;
    *(_WORD *)(v13 + 252) = 0;
    *(_QWORD *)(v13 + 256) = v15;
    *v15 = 0;
    *(_BYTE *)(v13 + 644) = 2;
    *(_BYTE *)(v13 + 560) = a4;
    *(_BYTE *)(v13 + 540) = 3;
    if (*(_BYTE *)(v13 + 545) == 1)
    {
      v11 = 21;
    }
    else if (a4)
    {
      if (*(_WORD *)(v13 + 918))
      {
        if (a4 == 1)
        {
          *(_BYTE *)(v13 + 560) = 1;
          *(_WORD *)(v13 + 656) = 0;
          *(_BYTE *)v13 = 1;
          *(_BYTE *)(v13 + 645) = 0;
          *(_BYTE *)(v13 + 660) = 0;
          *(_BYTE *)(v13 + 642) = 1;
          *(_BYTE *)(v13 + 921) = 0;
          *(_BYTE *)(v13 + 266) = 2;
          v11 = sub_2199027F4(v13);
        }
        else
        {
          v11 = 0;
        }
      }
      else
      {
        v11 = 22;
      }
    }
    else if (*(_BYTE *)(v13 + 645) == 1)
    {
      v11 = 26;
    }
    else if (*(_WORD *)(v13 + 918))
    {
      v11 = 0;
    }
    else
    {
      v11 = 22;
    }
  }
  sub_219850808(0, (unsigned int *)&v18, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_WrNdef");
  return v11;
}

uint64_t sub_219903134(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unsigned int v5;
  char v6;
  unsigned __int8 v7;
  unsigned int v8;
  int v9;
  char v10;
  char v11;
  unsigned __int16 v12;
  int v13;
  int v14;
  __int16 v15;
  unsigned __int16 v16;
  unsigned __int8 v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  unsigned __int16 v24;
  unsigned int v25;
  int v26;
  unsigned __int16 v27;
  int v28;
  int v29;
  unsigned int v30;
  int v31;
  unsigned __int16 v32;
  int v33;
  int v34;
  const char *v35;
  int v36;
  char v37;
  unsigned int v38;
  int v39;
  char v40;
  int v41;
  char v42;
  uint64_t v43;
  int v44;
  int v45;
  int v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  int v50;
  char v51;
  unsigned int *v55;
  const char *v56;
  unsigned __int16 *v57;
  char v58;
  int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  _WORD *v63;
  char v64;
  unsigned int v65;
  int v66;
  int v67;
  int v68;
  unsigned int v69;
  int v70;
  unsigned int v71;
  int v72;
  unsigned int v73;
  unsigned __int8 *v74;
  unsigned int v75;
  unsigned int v76;
  unsigned int v78;
  __int16 v79;
  int v80;
  int v81;
  unsigned int v82;
  unsigned __int8 *v83;
  unsigned int v84;
  unsigned int v85;
  __int16 v87;
  int v88;
  __int16 v89;
  int v90;
  unsigned __int16 v91;
  int v92;
  unsigned __int16 v93;
  unsigned __int16 v94;
  unsigned int v95;
  _BOOL4 v96;
  __int16 v97;
  BOOL v98;
  __int16 v99;
  unsigned __int8 v100;
  unsigned int v101;
  unsigned int v102;
  unsigned __int16 v103;
  uint64_t v104;
  unsigned __int8 v105;
  unsigned int v106;
  unsigned int v107;
  uint64_t v108;
  const char *v109;
  _BOOL4 v110;
  _BOOL4 v111;
  unsigned __int8 *v112;
  int v113;
  char v116;
  int v117;
  int v118;
  int v119;
  uint64_t v120;
  unsigned __int8 *v121;
  int v122;
  int v123;
  char v124;
  int v125;
  int v126;
  int v127;
  uint64_t v128;
  unsigned __int8 *v129;
  int v130;
  uint64_t v131;
  unsigned int v132;
  unsigned int v133;
  unsigned int v134;
  char v135;
  signed int v136;
  char v137;
  unsigned int *v138;
  const char *v139;
  int v140;
  char v141;
  int v142;
  __int16 v143;
  _BOOL4 v144;
  int v145;
  unsigned int v146;
  unsigned __int16 v147;
  int v148;
  int v150;
  unsigned int v151;
  int v152;
  unsigned __int8 *v153;
  uint64_t v154;
  _QWORD v155[2];

  v155[1] = *MEMORY[0x24BDAC8D0];
  v154 = a1;
  sub_219850718(0, (unsigned int *)&v154, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_Process");
  if ((_BYTE)a3)
    goto LABEL_432;
  v5 = *a2;
  a3 = 245;
  if (v5 > 3)
  {
    if (v5 == 4)
    {
      sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ChkReadID");
      if (*((_WORD *)a2 + 132) == 6)
      {
        if (a2[266] == 18)
        {
          if (phOsalNfc_MemCompare())
          {
            a3 = 22;
          }
          else
          {
            *a2 = 1;
            a2[266] = 16;
            a3 = sub_2199027F4(a2);
          }
        }
        else
        {
          a3 = 0;
        }
      }
      else
      {
        a3 = 27;
      }
      v35 = "phFriNfc_Tpz_H_ChkReadID";
      goto LABEL_431;
    }
    if (v5 != 16)
    {
      if (v5 == 17)
      {
        sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProcessReadOnly");
        v6 = a2[928];
        switch(v6)
        {
          case 0:
            if (*((_WORD *)a2 + 132) != 1)
            {
              v6 = 0;
              goto LABEL_169;
            }
            a3 = 0;
            v6 = 0;
            a2[642] = a2[146];
            break;
          case 1:
            if (*((_WORD *)a2 + 132) != 8)
            {
              v6 = 1;
              goto LABEL_169;
            }
            v155[0] = 0;
            sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_UpdateAndWriteLockBits");
            phOsalNfc_MemCopy();
            LOBYTE(v30) = a2[138];
            if (*((_WORD *)a2 + 73) == a2[642])
            {
              v31 = a2[148];
            }
            else
            {
              v31 = 0;
              LOBYTE(v30) = v30 - a2[929];
            }
            v105 = 64 - 8 * v31;
            if ((v105 & 0xF8u) >= v30)
            {
              if ((v30 & 7) != 0)
              {
                LOBYTE(v155[0]) = LOBYTE(v155[0]) & (255 << (v30 & 7)) | 1;
              }
              else if (v30 >= 8u)
              {
                LOBYTE(v146) = 0;
                do
                {
                  *((_BYTE *)v155 + v31++) = -1;
                  v146 = (v146 + 1);
                }
                while (v146 < v30 >> 3);
              }
            }
            else
            {
              v30 = v105 >> 3;
              if ((8 * v31) != 64)
              {
                LOBYTE(v106) = 0;
                do
                {
                  *((_BYTE *)v155 + v31++) = -1;
                  v106 = (v106 + 1);
                }
                while (v106 < v30);
              }
            }
            a2[929] = v30;
            a2[266] = 84;
            a3 = sub_219902E60((uint64_t)a2, (uint64_t)v155, 8);
            sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_UpdateAndWriteLockBits");
            if ((_DWORD)a3 == 13)
              v6 = 2;
            else
              v6 = 1;
            break;
          case 2:
            if (*((_WORD *)a2 + 132) != 8)
            {
              v6 = 2;
              goto LABEL_169;
            }
            ++a2[642];
            if (a2[138] == a2[929])
            {
              *((_WORD *)a2 + 321) = 14;
              a2[266] = 2;
              a3 = sub_2199027F4(a2);
              v6 = 3;
            }
            else
            {
              a2[266] = 2;
              a3 = sub_2199027F4(a2);
              v6 = 1;
            }
            break;
          case 3:
            v6 = 3;
            if (*((_WORD *)a2 + 132) != 8)
              goto LABEL_169;
            phOsalNfc_MemCopy();
            LOBYTE(v155[0]) = -1;
            goto LABEL_87;
          case 4:
            v6 = 4;
            if (*((_WORD *)a2 + 132) != 1)
              goto LABEL_169;
            LOBYTE(v155[0]) = byte_253E47036 | 0x7F;
            *((_WORD *)a2 + 321) = 270;
LABEL_87:
            a2[266] = 83;
            a3 = sub_219902E60((uint64_t)a2, (uint64_t)v155, 1);
            if ((_DWORD)a3 == 13)
              ++v6;
            break;
          case 5:
            if (*((_WORD *)a2 + 132) == 1)
              a3 = 0;
            else
              a3 = 27;
            v6 = 5;
            break;
          default:
LABEL_169:
            a3 = 27;
            break;
        }
        a2[928] = v6;
        v35 = "phFriNfc_Tpz_H_ProcessReadOnly";
        goto LABEL_431;
      }
      goto LABEL_433;
    }
    sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProRdForWrResp");
    *a2 = 2;
    if (*((_WORD *)a2 + 132) != 8)
    {
      a3 = 27;
      goto LABEL_405;
    }
    a3 = 0;
    switch(a2[921])
    {
      case 0u:
        sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_UpdateNdefTypeField");
        phOsalNfc_MemCopy();
        *((_BYTE *)v155 + a2[643]) = 3;
        *a2 = 2;
        a2[266] = 84;
        a3 = sub_219902E60((uint64_t)a2, (uint64_t)v155, 8);
        v55 = (unsigned int *)a2;
        v56 = "phFriNfc_Tpz_H_UpdateNdefTypeField";
        goto LABEL_404;
      case 2u:
      case 3u:
      case 4u:
        sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_UpdateLenFieldZeroAfterRead");
        if (*((_DWORD *)a2 + 62) >= *((unsigned __int16 *)a2 + 462))
          v12 = *((_WORD *)a2 + 462);
        else
          v12 = *((_DWORD *)a2 + 62);
        *a2 = 2;
        phOsalNfc_MemCopy();
        v13 = a2[921];
        if (v13 == 2)
          word_253E47042 = 0;
        v14 = *((unsigned __int16 *)a2 + 126);
        v15 = a2[643];
        if (a2[643])
          a2[643] = 0;
        v16 = word_253E47042 + v15;
        if (v16 > 7u)
        {
          v45 = v14;
          goto LABEL_393;
        }
        v17 = 0;
        while (2)
        {
          if (*((unsigned __int16 *)a2 + 126) == v12)
            goto LABEL_394;
          v18 = v16;
          word_253E47042 = 0;
          v19 = sub_219905248((uint64_t)a2, 8 * a2[642] + v17);
          word_253E47042 = v19;
          if (!v19)
          {
            if ((v13 - 3) >= 2)
            {
              if (v13 == 2)
              {
                *((_BYTE *)v155 + v18) = 0;
                v16 = v18 + 1;
                if ((unsigned __int16)(v18 + 1) == 8)
                  v20 = 2;
                else
                  v20 = 3;
                if (v12 >= 0xFFu)
                  v13 = v20;
                else
                  v13 = 5;
              }
              else
              {
                v21 = *((unsigned __int16 *)a2 + 126);
                *((_BYTE *)v155 + v18) = *(_BYTE *)(*((_QWORD *)a2 + 30) + v21);
                v16 = v18 + 1;
                *((_WORD *)a2 + 126) = v21 + 1;
              }
            }
            else
            {
              *((_BYTE *)v155 + v18) = 0;
              v16 = v18 + 1;
              if (v18 != 7)
                ++v13;
            }
            v17 = a2[643] + 1;
            a2[643] = v17;
LABEL_51:
            if (v16 >= 8u)
              goto LABEL_392;
            continue;
          }
          break;
        }
        if (8 - v18 > v19)
        {
          v17 = a2[643] + v19;
          a2[643] = v17;
          v16 = v19 + v18;
          word_253E47042 = 0;
          goto LABEL_51;
        }
        word_253E47042 = v19 - (8 - v18);
LABEL_392:
        v45 = *((unsigned __int16 *)a2 + 126);
LABEL_393:
        if (v45 == v12)
        {
LABEL_394:
          LOBYTE(v13) = 5;
          goto LABEL_400;
        }
        if (v13 == 5 && v14 == v45)
        {
          if (v12 >= 0xFFu)
            LOBYTE(v13) = 4;
          else
            LOBYTE(v13) = 2;
        }
LABEL_400:
        a2[921] = v13;
        a2[643] = 0;
        a2[266] = 84;
        a3 = sub_219902E60((uint64_t)a2, (uint64_t)v155, 8);
        v56 = "phFriNfc_Tpz_H_UpdateLenFieldZeroAfterRead";
        goto LABEL_403;
      case 5u:
      case 6u:
        sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CopyReadDataAndWrite");
        if (*((_DWORD *)a2 + 62) >= *((unsigned __int16 *)a2 + 462))
          v32 = *((_WORD *)a2 + 462);
        else
          v32 = *((_DWORD *)a2 + 62);
        phOsalNfc_MemCopy();
        v33 = a2[642];
        if (v33 == sub_219904E6C((uint64_t)a2, v32) >> 3)
        {
          v34 = 0;
          word_253E4703E = 0;
        }
        else
        {
          v34 = (unsigned __int16)word_253E4703E;
          if (word_253E4703E && (unsigned __int16)word_253E4703E >= 8u)
          {
            word_253E4703E -= 8;
            v57 = (unsigned __int16 *)(a2 + 252);
            LOWORD(v34) = v34 - 8;
            goto LABEL_176;
          }
        }
        v57 = (unsigned __int16 *)(a2 + 252);
        if (*((unsigned __int16 *)a2 + 126) == v32)
          goto LABEL_176;
        v100 = a2[643];
        while (2)
        {
          word_253E4703E = 0;
          v101 = sub_219905248((uint64_t)a2, 8 * a2[642] + v100);
          word_253E4703E = v101;
          if (!v101)
          {
            v104 = *((unsigned __int16 *)a2 + 126);
            *((_BYTE *)v155 + (unsigned __int16)v34++) = *(_BYTE *)(*((_QWORD *)a2 + 30) + v104);
            v103 = v104 + 1;
            *((_WORD *)a2 + 126) = v103;
            v100 = a2[643] + 1;
            a2[643] = v100;
            goto LABEL_271;
          }
          v102 = 8 - (unsigned __int16)v34;
          if (v102 > v101)
          {
            v100 = a2[643] + v101;
            a2[643] = v100;
            v34 += v101;
            word_253E4703E = 0;
            v103 = *((_WORD *)a2 + 126);
LABEL_271:
            if ((unsigned __int16)v34 >= 8u || v32 == v103)
              goto LABEL_401;
            continue;
          }
          break;
        }
        LOWORD(v34) = v101 - v102;
        word_253E4703E = v101 - v102;
        a2[643] = 0;
LABEL_176:
        if (*v57 != v32 && (_WORD)v34)
        {
          v58 = 6;
          goto LABEL_402;
        }
LABEL_401:
        v58 = 5;
LABEL_402:
        a2[921] = v58;
        a2[266] = 84;
        a3 = sub_219902E60((uint64_t)a2, (uint64_t)v155, 8);
        v56 = "phFriNfc_Tpz_H_CopyReadDataAndWrite";
        goto LABEL_403;
      case 7u:
      case 8u:
      case 9u:
        sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_UpdateLenFieldValuesAfterRead");
        if (*((_DWORD *)a2 + 62) >= *((unsigned __int16 *)a2 + 462))
          v27 = *((_WORD *)a2 + 462);
        else
          v27 = *((_DWORD *)a2 + 62);
        *a2 = 2;
        phOsalNfc_MemCopy();
        v28 = a2[921];
        if (v28 == 7)
        {
          v29 = 0;
          word_253E47040 = 0;
        }
        else
        {
          v29 = (unsigned __int16)word_253E47040;
        }
        v46 = a2[643];
        v47 = v29 + v46;
        if ((unsigned __int16)(v29 + v46) > 7u)
          goto LABEL_368;
        while (2)
        {
          word_253E47040 = 0;
          v48 = sub_219905248((uint64_t)a2, 8 * a2[642] + v46);
          word_253E47040 = v48;
          if (v48)
          {
            v49 = 8 - (unsigned __int16)v47;
            if (v49 > v48)
            {
              v50 = 0;
              LOBYTE(v46) = a2[643] + v48;
              a2[643] = v46;
              v47 += v48;
              word_253E47040 = 0;
              goto LABEL_161;
            }
            word_253E47040 = v48 - v49;
LABEL_368:
            a2[921] = v28;
            a2[266] = 84;
            a3 = sub_219902E60((uint64_t)a2, (uint64_t)v155, 8);
            v56 = "phFriNfc_Tpz_H_UpdateLenFieldValuesAfterRead";
LABEL_403:
            v55 = (unsigned int *)a2;
LABEL_404:
            sub_219850808(2, v55, 8u, 5u, (uint64_t)v56);
LABEL_405:
            v35 = "phFriNfc_Tpz_H_ProRdForWrResp";
            goto LABEL_431;
          }
          switch(v28)
          {
            case 9:
              goto LABEL_147;
            case 8:
              v50 = 0;
              v51 = a2[253];
              break;
            case 7:
              if (v27 > 0xFEu)
              {
                v50 = 0;
                v51 = -1;
              }
              else
              {
LABEL_147:
                v51 = a2[252];
                v50 = 1;
              }
              break;
            default:
              v50 = 0;
LABEL_152:
              if ((unsigned __int16)++v47 != 8 && v28 != 9 && v27 > 0xFEu)
                ++v28;
              LOBYTE(v46) = a2[643] + 1;
              a2[643] = v46;
LABEL_161:
              if ((unsigned __int16)v47 > 7u || v50 != 0)
                goto LABEL_368;
              continue;
          }
          break;
        }
        *((_BYTE *)v155 + (unsigned __int16)v47) = v51;
        goto LABEL_152;
      default:
        goto LABEL_405;
    }
  }
  if (v5 != 1)
  {
    if (v5 == 2)
    {
      LOBYTE(v155[0]) = 0;
      sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProWrResp");
      v7 = a2[921];
      v8 = *((_DWORD *)a2 + 62);
      if (v8 >= *((unsigned __int16 *)a2 + 462))
        v8 = *((unsigned __int16 *)a2 + 462);
      switch(a2[921])
      {
        case 0u:
          if (*((_WORD *)a2 + 132) != 8)
            goto LABEL_136;
          *a2 = 2;
          a2[921] = 1;
          *((_WORD *)a2 + 321) = 1;
          a2[266] = 83;
          goto LABEL_133;
        case 1u:
          if (*((_WORD *)a2 + 132) != 1)
            goto LABEL_136;
          v11 = 2;
          goto LABEL_129;
        case 2u:
          if (*((_WORD *)a2 + 132) != 8)
            goto LABEL_136;
          if (v8 >= 0xFF)
          {
            a2[643] = 0;
            v36 = a2[642];
            if (v36 == 12)
              v37 = 16;
            else
              v37 = v36 + 1;
            a2[642] = v37;
            v11 = 3;
            goto LABEL_129;
          }
LABEL_113:
          v38 = sub_219904E6C((uint64_t)a2, (unsigned __int16)v8);
          a2[642] = v38 >> 3;
          a2[921] = 5;
          a2[643] = v38 & 7;
          if ((v38 & 7) != 0)
            goto LABEL_130;
          goto LABEL_373;
        case 3u:
        case 8u:
          if (*((_WORD *)a2 + 132) != 8)
            goto LABEL_136;
          a2[643] = 0;
          v9 = a2[642];
          if (v9 == 12)
            v10 = 16;
          else
            v10 = v9 + 1;
          a2[642] = v10;
          v11 = v7 + 1;
          goto LABEL_129;
        case 4u:
          if (*((_WORD *)a2 + 132) == 8)
            goto LABEL_113;
          goto LABEL_136;
        case 5u:
          if (*((_WORD *)a2 + 132) != 8)
            goto LABEL_136;
          if (*((unsigned __int16 *)a2 + 126) == (unsigned __int16)v8)
          {
            **((_DWORD **)a2 + 32) = v8;
            v11 = 7;
            goto LABEL_129;
          }
          a2[643] = 0;
          v140 = a2[642];
          if (v140 == 12)
            v141 = 16;
          else
            v141 = v140 + 1;
          a2[642] = v141;
LABEL_373:
          v43 = sub_219904F44((uint64_t)a2);
          break;
        case 6u:
          if (*((_WORD *)a2 + 132) != 8)
            goto LABEL_136;
          a2[643] = 0;
          v39 = a2[642];
          if (v39 == 12)
            v40 = 16;
          else
            v40 = v39 + 1;
          a2[642] = v40;
          goto LABEL_130;
        case 7u:
          if (*((_WORD *)a2 + 132) != 8)
            goto LABEL_136;
          if (v8 <= 0xFE)
          {
LABEL_132:
            a2[266] = 83;
            *a2 = 2;
            LOBYTE(v155[0]) = -31;
            *((_WORD *)a2 + 321) = 1;
            a2[921] = 10;
LABEL_133:
            v43 = sub_219902E60((uint64_t)a2, (uint64_t)v155, 1);
          }
          else
          {
            a2[643] = 0;
            v41 = a2[642];
            if (v41 == 12)
              v42 = 16;
            else
              v42 = v41 + 1;
            a2[642] = v42;
            v11 = 8;
LABEL_129:
            a2[921] = v11;
LABEL_130:
            v43 = sub_219904D38((uint64_t)a2);
          }
          break;
        case 9u:
          if (*((_WORD *)a2 + 132) == 8)
            goto LABEL_132;
          goto LABEL_136;
        case 0xAu:
          if (*((_WORD *)a2 + 132) == 1)
          {
            a3 = 0;
            v44 = *((unsigned __int16 *)a2 + 126);
            **((_DWORD **)a2 + 32) = v44;
            *((_WORD *)a2 + 461) = v44;
          }
          else
          {
LABEL_136:
            a3 = 27;
          }
          goto LABEL_375;
        default:
          a3 = 0;
          goto LABEL_375;
      }
      a3 = v43;
LABEL_375:
      v35 = "phFriNfc_Tpz_H_ProWrResp";
      goto LABEL_431;
    }
    goto LABEL_433;
  }
  LOBYTE(v155[0]) = 0;
  sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ProReadResp");
  v22 = a2[540];
  if (v22 == 3)
  {
    if (*((_WORD *)a2 + 132) == 8)
    {
      phOsalNfc_MemCopy();
      sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CheckCCBytesForWrite");
      if (a2[652] != 225 && a2[652] || a2[655])
      {
        sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CheckCCBytesForWrite");
        a3 = 22;
      }
      else
      {
        sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CheckCCBytesForWrite");
        if (a2[652] && a2[920] != 6)
        {
          a2[921] = 1;
          *((_WORD *)a2 + 321) = 1;
          *a2 = 2;
          a2[266] = 83;
          v108 = sub_219902E60((uint64_t)a2, (uint64_t)v155, 1);
        }
        else
        {
          *a2 = 16;
          a2[921] = 0;
          v107 = *((unsigned __int16 *)a2 + 459);
          a2[642] = v107 >> 3;
          a2[643] = v107 & 7;
          a2[266] = 2;
          v108 = sub_2199027F4(a2);
        }
        a3 = v108;
      }
      goto LABEL_430;
    }
    goto LABEL_71;
  }
  if (v22 == 2)
  {
    if (*((_WORD *)a2 + 132) == 128)
    {
      sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CopyReadData");
      if (a2[560])
        LOWORD(v26) = *((_WORD *)a2 + 461);
      else
        LOWORD(v26) = *((_WORD *)a2 + 126) + *((_WORD *)a2 + 463);
      v60 = *((unsigned __int16 *)a2 + 132);
      v61 = (unsigned __int16)v26;
      if (*((_DWORD *)a2 + 62) >= (unsigned __int16)v26)
        v26 = (unsigned __int16)v26;
      else
        v26 = *((_DWORD *)a2 + 62);
      v152 = v26;
      v62 = sub_219902C98((uint64_t)a2);
      v63 = &unk_253E47000;
      if (a2[660] == v62 >> 7)
      {
        v64 = sub_219902C98((uint64_t)a2);
        v63 = (_WORD *)&unk_253E47000;
        v65 = v64 & 0x7F;
      }
      else
      {
        v65 = (unsigned __int16)word_253E47038;
        if (!word_253E47038)
        {
LABEL_195:
          v66 = v152;
          v151 = v61;
          if (v65 >= v60)
            goto LABEL_262;
          v67 = 0;
          v68 = 0;
          v69 = 0;
          v150 = v61 - v152;
LABEL_197:
          if (!v67 && !a2[660] || (unsigned __int16)v65 <= 0x67u && !a2[660])
          {
            LOWORD(v78) = *((_WORD *)a2 + 132) - 24;
            v63[28] = 24;
            v67 = 1;
            goto LABEL_233;
          }
          v70 = a2[130];
          if (v70 == v69)
          {
            v71 = 0;
            goto LABEL_215;
          }
          v72 = a2[660];
          v71 = v72 << 7;
          v73 = (unsigned __int16)(v65 + ((_WORD)v72 << 7));
          while (1)
          {
            v74 = &a2[4 * v69 + 96];
            v75 = *(unsigned __int16 *)v74;
            v76 = *((unsigned __int16 *)v74 + 1) + v75;
            if (v72 == v75 >> 7)
            {
              if (v76 >= v73)
              {
                v79 = sub_219905248((uint64_t)a2, v75);
                v63 = &unk_253E47000;
                v66 = v152;
                word_253E47038 = v79;
                v71 = v75;
LABEL_214:
                ++v69;
LABEL_215:
                v80 = a2[184];
                if (v80 == v68)
                {
                  LOWORD(v78) = v71;
                  goto LABEL_233;
                }
                v81 = a2[660];
                LOWORD(v78) = (_WORD)v81 << 7;
                v82 = (unsigned __int16)(v65 + ((_WORD)v81 << 7));
                while (1)
                {
                  v83 = &a2[4 * v68 + 150];
                  v84 = *(unsigned __int16 *)v83;
                  v85 = *((unsigned __int16 *)v83 + 1) + v84;
                  if (v81 == v84 >> 7)
                  {
                    if (v85 >= v82)
                    {
                      v69 = (__PAIR64__(v69, v84) - v71) >> 32;
                      if (v84 <= (unsigned __int16)(v71 - 1))
                        v78 = v84;
                      else
                        v78 = v71;
                      if (v78 == v84)
                      {
                        v87 = sub_219905248((uint64_t)a2, v84);
                        v63 = &unk_253E47000;
                        v66 = v152;
                        word_253E47038 = v87;
                        ++v68;
                        LOWORD(v78) = v84;
                      }
LABEL_233:
                      v88 = (unsigned __int16)v78;
                      v89 = v78 & 0x7F;
                      if ((_WORD)v78)
                        v90 = v78 & 0x7F;
                      else
                        v90 = v60;
                      if (v90 != (unsigned __int16)v65)
                      {
                        v91 = v90 - v65;
                        v92 = *((unsigned __int16 *)a2 + 126);
                        if (v92 == (unsigned __int16)v66)
                        {
                          if ((_WORD)v88)
                            v93 = v89 - v65;
                          else
                            v93 = v91;
                          if (v66 + a2[917] < v151)
                          {
                            if (v150 < v93)
                              v93 = v150;
                            phOsalNfc_MemCopy();
                            v63 = (_WORD *)&unk_253E47000;
                            v66 = v152;
                            a2[917] += v93;
                          }
                          LOWORD(v65) = v93 + v65;
                        }
                        else
                        {
                          if (v91 >= (unsigned __int16)(v66 - v92))
                            v94 = v66 - v92;
                          else
                            v94 = v91;
                          phOsalNfc_MemCopy();
                          v63 = &unk_253E47000;
                          v66 = v152;
                          LOWORD(v65) = v94 + v65;
                          *((_WORD *)a2 + 126) += v94;
                          *((_WORD *)a2 + 463) -= v94;
                        }
                      }
                      if ((a2[660] << 7) + (unsigned __int16)v65 == v88)
                      {
                        v95 = (unsigned __int16)v65 + (unsigned __int16)v63[28];
                        v96 = v95 > v60;
                        if (v63[28])
                        {
                          v97 = v60 - v65;
                          goto LABEL_255;
                        }
                      }
                      else
                      {
                        v96 = (unsigned __int16)v65 > v60;
                        LOWORD(v95) = v65;
                      }
                      v97 = 0;
LABEL_255:
                      v98 = !v96;
                      if (v96)
                        v99 = v97;
                      else
                        v99 = 0;
                      if (v98)
                        LOWORD(v65) = v95;
                      else
                        LOWORD(v65) = v60;
                      v63[28] = v99;
                      if (v60 <= (unsigned __int16)v65)
                      {
LABEL_262:
                        if (*((unsigned __int16 *)a2 + 126) == (unsigned __int16)v66)
                        {
                          **((_DWORD **)a2 + 69) = (unsigned __int16)v66;
                          a3 = 0;
                          if ((unsigned __int16)v66 == v151)
                          {
                            a2[917] = 0;
                            a2[645] = 1;
                          }
                          else
                          {
                            *((_WORD *)a2 + 463) = v151 - v66;
                          }
                        }
                        else
                        {
                          ++a2[660];
                          a2[266] = 16;
                          a3 = sub_2199027F4(a2);
                        }
                        v109 = "phFriNfc_Tpz_H_CopyReadData";
                        goto LABEL_429;
                      }
                      goto LABEL_197;
                    }
                  }
                  else if (v81 == v85 >> 7 && v85 >= v82)
                  {
                    ++v68;
                    goto LABEL_233;
                  }
                  if (v80 == ++v68)
                  {
                    LOWORD(v78) = v71;
                    v68 = a2[184];
                    goto LABEL_233;
                  }
                }
              }
            }
            else if (v72 == v76 >> 7 && v76 >= v73)
            {
              goto LABEL_214;
            }
            if (v70 == ++v69)
            {
              v71 = 0;
              v69 = a2[130];
              goto LABEL_215;
            }
          }
        }
      }
      v63[28] = 0;
      goto LABEL_195;
    }
LABEL_71:
    a3 = 27;
    goto LABEL_430;
  }
  if (v22 != 1)
    goto LABEL_430;
  if (*((_WORD *)a2 + 132) != 128)
    goto LABEL_71;
  if (a2[660])
    goto LABEL_58;
  sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CheckCCBytes");
  phOsalNfc_MemCopy();
  if (a2[652] != 225 && a2[652])
    goto LABEL_427;
  a3 = sub_2198D4230((unsigned int *)a2, a2[653]);
  if ((_DWORD)a3)
  {
LABEL_428:
    a2[545] = 3;
    v109 = "phFriNfc_Tpz_H_CheckCCBytes";
    goto LABEL_429;
  }
  if (a2[654] != 63)
  {
LABEL_427:
    a3 = 22;
    goto LABEL_428;
  }
  *((_WORD *)a2 + 101) = 500;
  *((_WORD *)a2 + 320) = 512;
  sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_Dynamic_H_ChkLockBits");
  v59 = a2[655];
  if (a2[655])
  {
    if (v59 == 15)
    {
      LOBYTE(v59) = 1;
      goto LABEL_186;
    }
    a2[545] = 3;
    sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_Dynamic_H_ChkLockBits");
    goto LABEL_427;
  }
LABEL_186:
  a2[545] = v59;
  sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_Dynamic_H_ChkLockBits");
  sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CheckCCBytes");
LABEL_58:
  v23 = a2[920];
  sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ParseTLVs");
  v24 = *((_WORD *)a2 + 132);
  if (a2[660])
  {
    v25 = 0;
  }
  else
  {
    byte_253E47034[0] = 0;
    *(_DWORD *)&word_253E4703A = 0;
    v24 -= 24;
    v25 = 12;
  }
  a3 = 0;
  v110 = v23 != 8;
  v111 = 1;
  if (v25 >= v24 || v23 == 8)
    goto LABEL_378;
  v112 = a2 + 266;
  v153 = a2 + 96;
  while (1)
  {
    v113 = (unsigned __int16)word_253E4703A;
    if (!word_253E4703A)
    {
      v113 = sub_219905248((uint64_t)a2, (unsigned __int16)(v25 + (a2[660] << 7)));
      word_253E4703A = v113;
      if (!v113)
        break;
    }
    if (v24 - (unsigned __int16)v25 < v113)
    {
      a3 = 0;
      v111 = 1;
      goto LABEL_377;
    }
    a3 = 0;
    v25 += v113;
    word_253E4703A = 0;
LABEL_296:
    v111 = a3 == 0;
    v110 = v23 != 8;
    if ((unsigned __int16)v25 >= v24 || (_DWORD)a3 != 0 || v23 == 8)
      goto LABEL_378;
  }
  switch(v23)
  {
    case 0:
      sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ParseLockTLVType");
      if (v112[(unsigned __int16)v25])
      {
        if (v112[(unsigned __int16)v25] == 1)
        {
          ++v25;
          v23 = 1;
        }
        else
        {
          v23 = 3;
        }
      }
      else
      {
        v23 = 0;
        ++v25;
      }
      v138 = (unsigned int *)a2;
      v139 = "phFriNfc_Tpz_H_ParseLockTLVType";
      goto LABEL_352;
    case 1:
      if (v112[(unsigned __int16)v25] != 3)
      {
        v111 = 0;
        a3 = 22;
        v23 = 1;
        goto LABEL_439;
      }
      a3 = 0;
      ++v25;
LABEL_338:
      v23 = 2;
      goto LABEL_296;
    case 2:
      v116 = byte_253E47034[0];
      byte_253E47034[byte_253E47034[0] + 16] = v112[(unsigned __int16)v25++];
      byte_253E47034[0] = v116 + 1;
      if ((v116 + 1) != 3)
      {
        a3 = 0;
        goto LABEL_338;
      }
      phOsalNfc_MemCopy();
      sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetLockBytesInfo");
      v117 = byte_253E47044 >> 4;
      v118 = byte_253E47044 & 0xF;
      if ((byte_253E47045 & 7) != 0)
        v119 = (byte_253E47045 >> 3) + 1;
      else
        v119 = byte_253E47045 >> 3;
      v120 = a2[130];
      v121 = &v153[4 * v120];
      *((_WORD *)v121 + 1) = v119;
      v122 = (v117 << (byte_253E47046 & 0xF)) + v118;
      *(_WORD *)v121 = v122;
      if ((unsigned __int16)v122 < 0x78u || v119 + (unsigned __int16)v122 > 8 * a2[654] + 8)
      {
        *(_WORD *)v121 = 0;
        a3 = 22;
      }
      else
      {
        a3 = 0;
        *((_WORD *)a2 + 73) = (unsigned __int16)v122 >> 3;
        *((_WORD *)a2 + 74) = v122 & 7;
      }
      a2[130] = v120 + 1;
      sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetLockBytesInfo");
      byte_253E47034[0] = 0;
      v23 = 3;
      goto LABEL_296;
    case 3:
      sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ParseMemTLVType");
      v123 = v112[(unsigned __int16)v25];
      if (v112[(unsigned __int16)v25])
      {
        if (v123 == 2)
        {
          ++v25;
          v23 = 4;
        }
        else if (v123 == 1)
        {
          ++v25;
          v23 = 1;
        }
        else
        {
          v23 = 6;
        }
      }
      else
      {
        ++v25;
        v23 = 3;
      }
      v138 = (unsigned int *)a2;
      v139 = "phFriNfc_Tpz_H_ParseMemTLVType";
LABEL_352:
      sub_219850808(2, v138, 8u, 5u, (uint64_t)v139);
      goto LABEL_353;
    case 4:
      if (v112[(unsigned __int16)v25] != 3)
      {
        v111 = 0;
        a3 = 22;
        v23 = 4;
        goto LABEL_439;
      }
      a3 = 0;
      ++v25;
LABEL_340:
      v23 = 5;
      goto LABEL_296;
    case 5:
      v124 = byte_253E47034[0];
      byte_253E47034[byte_253E47034[0] + 16] = v112[(unsigned __int16)v25++];
      byte_253E47034[0] = v124 + 1;
      if ((v124 + 1) != 3)
      {
        a3 = 0;
        goto LABEL_340;
      }
      word_253E4703C = v25 + (a2[660] << 7);
      sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetMemBytesInfo");
      v125 = byte_253E47044 >> 4;
      v126 = byte_253E47044 & 0xF;
      v127 = byte_253E47045;
      v128 = a2[184];
      v129 = &a2[4 * v128 + 150];
      *((_WORD *)v129 + 1) = byte_253E47045;
      v130 = (v125 << (byte_253E47046 & 0xF)) + v126;
      *(_WORD *)v129 = v130;
      v131 = a2[130];
      v132 = *(unsigned __int16 *)&v153[4 * v131];
      if (v132 <= (unsigned __int16)v130 && *(unsigned __int16 *)&v153[4 * v131 + 2] + v132 > (unsigned __int16)v130)
        goto LABEL_362;
      v133 = (unsigned __int16)v130 + v127;
      if (v133 <= v132)
      {
        if ((unsigned __int16)v130 < 0x78u)
          goto LABEL_362;
        v134 = v132 + *(unsigned __int16 *)&v153[4 * v131 + 2];
      }
      else if ((unsigned __int16)v130 < 0x78u || (v134 = v132 + *(unsigned __int16 *)&v153[4 * v131 + 2], v133 <= v134))
      {
LABEL_362:
        *(_WORD *)v129 = 0;
        a3 = 22;
        goto LABEL_363;
      }
      if (v134 > 8 * a2[654])
        goto LABEL_362;
      a3 = 0;
      *((_WORD *)a2 + 99) = (unsigned __int16)v130 >> 3;
      *((_WORD *)a2 + 100) = v130 & 7;
LABEL_363:
      a2[184] = v128 + 1;
      sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetMemBytesInfo");
      byte_253E47034[0] = 0;
      v23 = 6;
      goto LABEL_296;
    case 6:
      sub_219850718(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ParseNdefTLVType");
      switch(v112[(unsigned __int16)v25])
      {
        case 0u:
          a3 = 0;
          ++v25;
          v23 = 6;
          break;
        case 1u:
          a3 = 0;
          ++v25;
          v23 = 1;
          break;
        case 2u:
          a3 = 0;
          ++v25;
          v23 = 4;
          break;
        case 3u:
          a3 = 0;
          ++v25;
          v23 = 7;
          break;
        default:
          v23 = 0;
          a3 = 22;
          break;
      }
      sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ParseNdefTLVType");
      goto LABEL_296;
    case 7:
      v135 = byte_253E47034[0];
      if (byte_253E47034[0])
      {
        byte_253E47034[byte_253E47034[0] + 16] = v112[(unsigned __int16)v25++];
        byte_253E47034[0] = v135 + 1;
        if ((v135 + 1) == 3)
        {
          a3 = 0;
          byte_253E47034[0] = 0;
          *((_WORD *)a2 + 461) = bswap32(*(unsigned __int16 *)&byte_253E47045) >> 16;
          v111 = 1;
          v23 = 8;
          goto LABEL_439;
        }
        a3 = 0;
        v23 = 7;
        goto LABEL_296;
      }
      *((_WORD *)a2 + 459) = v25 + (a2[660] << 7) - 1;
      v136 = v112[(unsigned __int16)v25];
      if ((int)(*((unsigned __int16 *)a2 + 320) + (~(_WORD)v25 | 0xFFFF0000)) >= v136)
      {
        if (v136 == 255)
        {
          byte_253E47044 = -1;
          v137 = 1;
          v23 = 7;
        }
        else
        {
          v137 = 0;
          *((_WORD *)a2 + 461) = v136;
          v23 = 8;
        }
        a3 = 0;
        byte_253E47034[0] = v137;
        ++v25;
        goto LABEL_296;
      }
      v111 = 0;
      byte_253E47034[0] = 0;
      a3 = 22;
      v23 = 7;
LABEL_439:
      v24 = v25;
LABEL_377:
      v110 = v23 != 8;
      LOWORD(v25) = v24;
LABEL_378:
      sub_21988BA0C((unsigned int *)a2, (_DWORD *)a2 + 24, a2[130]);
      sub_21988BA0C((unsigned int *)a2, a2 + 150, a2[184]);
      a2[920] = v23;
      v142 = a2[660];
      v143 = *((_WORD *)a2 + 320) - v25;
      if (!a2[660])
        v143 -= 24;
      *((_WORD *)a2 + 320) = v143;
      if (!v111 || v23 != 8)
      {
        if ((_DWORD)a3)
          v144 = 0;
        else
          v144 = v110;
        if (!v144)
          goto LABEL_414;
        v145 = v142 + 1;
        a2[660] = v145;
        if (v145 != 4)
        {
          a2[266] = 16;
          a3 = sub_2199027F4(a2);
          goto LABEL_414;
        }
        a3 = 22;
LABEL_416:
        *((_WORD *)a2 + 459) = 0;
        *((_WORD *)a2 + 461) = 0;
        goto LABEL_417;
      }
      a3 = sub_219905308((uint64_t)a2);
      if (a2[545] != 1 && *((_WORD *)a2 + 461))
        a2[545] = 2;
LABEL_414:
      if (!(_DWORD)a3)
      {
LABEL_417:
        if (!a2[652] || v23 == 6 && a2[660] == 4)
        {
          *((_WORD *)a2 + 461) = 0;
          a2[545] = 0;
          v147 = word_253E4703C;
          if (word_253E4703C)
          {
            do
            {
              v148 = sub_219905248((uint64_t)a2, v147);
              v147 = word_253E4703C + v148;
              word_253E4703C += v148;
            }
            while (v148);
            *((_WORD *)a2 + 459) = v147;
            *((_WORD *)a2 + 320) = *((_WORD *)a2 + 101) - v147 - 12;
            sub_219905308((uint64_t)a2);
            a3 = 0;
            *((_WORD *)a2 + 462) -= 2;
            word_253E4703C = 0;
          }
        }
        goto LABEL_423;
      }
      if ((_DWORD)a3 != 13)
        goto LABEL_416;
LABEL_423:
      v109 = "phFriNfc_Tpz_H_ParseTLVs";
LABEL_429:
      sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)v109);
LABEL_430:
      v35 = "phFriNfc_Tpz_H_ProReadResp";
LABEL_431:
      sub_219850808(2, (unsigned int *)a2, 8u, 5u, (uint64_t)v35);
LABEL_432:
      if ((_DWORD)a3 != 13)
LABEL_433:
        sub_2198D4020((uint64_t)a2, a3);
      return sub_219850808(0, (unsigned int *)&v154, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamicMap_Process");
    default:
LABEL_353:
      a3 = 0;
      goto LABEL_296;
  }
}

uint64_t sub_219904D38(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  int v5;
  unsigned int v6;
  uint64_t v7;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_RdForWrite");
  LOBYTE(v2) = 0;
  v3 = *(unsigned __int8 *)(a1 + 921);
  *(_BYTE *)(a1 + 266) = 2;
  *(_BYTE *)a1 = 16;
  if (v3 > 9)
  {
    LOBYTE(v6) = 0;
    goto LABEL_12;
  }
  if (((1 << v3) & 0x318) != 0)
  {
    LOWORD(v2) = *(unsigned __int8 *)(a1 + 643) + 8 * *(unsigned __int8 *)(a1 + 642);
    do
    {
      v4 = sub_219905248(a1, (unsigned __int16)v2);
      LOWORD(v2) = v4 + v2;
    }
    while (v4);
LABEL_11:
    LOWORD(v6) = (unsigned __int16)v2 >> 3;
    goto LABEL_12;
  }
  if (((1 << v3) & 0x84) != 0)
  {
    v2 = *(unsigned __int16 *)(a1 + 918) + 1;
    do
    {
      if ((v2 & 0xFFF8) == 0x68)
        v2 += 24;
      v5 = sub_219905248(a1, (unsigned __int16)v2);
      v2 += v5;
    }
    while (v5);
    goto LABEL_11;
  }
  LOBYTE(v6) = 0;
  if (v3 == 6)
  {
    v2 = *(unsigned __int8 *)(a1 + 643) + 8 * *(unsigned __int8 *)(a1 + 642);
    v6 = v2 >> 3;
  }
LABEL_12:
  *(_BYTE *)(a1 + 642) = v6;
  *(_BYTE *)(a1 + 643) = v2 & 7;
  v7 = sub_2199027F4(a1);
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_RdForWrite");
  return v7;
}

uint64_t sub_219904E6C(uint64_t a1, unsigned int a2)
{
  unsigned int v4;
  int v5;
  unsigned int v6;
  int v7;
  unsigned __int16 v8;
  unsigned __int16 v9;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetNDEFValueFieldAddrForWrite");
  LOBYTE(v4) = 0;
  v5 = *(unsigned __int16 *)(a1 + 918);
  if (a2 <= 0xFE)
    v6 = 1;
  else
    v6 = 3;
  do
  {
    if ((unsigned __int16)(v5 + 1) == 104)
      v7 = 128;
    else
      v7 = v5 + 1;
    v5 = v7 + sub_219905248(a1, (unsigned __int16)v7);
    v4 = (v4 + 1);
  }
  while (v4 < v6);
  if ((unsigned __int16)(v5 + 1) == 104)
    v8 = 128;
  else
    v8 = v5 + 1;
  v9 = sub_219905248(a1, v8) + v8;
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetNDEFValueFieldAddrForWrite");
  return v9;
}

uint64_t sub_219904F44(uint64_t a1)
{
  unsigned __int16 v2;
  int v3;
  uint64_t v4;
  unsigned int v5;
  int v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CopySendWrData");
  if (*(_DWORD *)(a1 + 248) >= *(unsigned __int16 *)(a1 + 924))
    v2 = *(_WORD *)(a1 + 924);
  else
    v2 = *(_DWORD *)(a1 + 248);
  v3 = *(unsigned __int8 *)(a1 + 642);
  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CompareLockBlocks");
  if (*(_BYTE *)(a1 + 130))
  {
    v4 = 0;
    while (1)
    {
      v5 = *(unsigned __int16 *)(a1 + v4 + 96);
      if (v3 == v5 >> 3)
        break;
      v4 += 4;
      if (4 * *(unsigned __int8 *)(a1 + 130) == v4)
        goto LABEL_8;
    }
    sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CompareLockBlocks");
    if (v5)
      goto LABEL_21;
  }
  else
  {
LABEL_8:
    sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CompareLockBlocks");
  }
  v6 = *(unsigned __int8 *)(a1 + 642);
  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CompareMemBlocks");
  if (*(_BYTE *)(a1 + 184))
  {
    v7 = 0;
    while (1)
    {
      v8 = *(unsigned __int16 *)(a1 + v7 + 150);
      if (v6 == v8 >> 3)
        break;
      v7 += 4;
      if (4 * *(unsigned __int8 *)(a1 + 184) == v7)
        goto LABEL_13;
    }
    sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CompareMemBlocks");
    if (v8)
    {
LABEL_21:
      *(_BYTE *)(a1 + 921) = 6;
      *(_BYTE *)(a1 + 643) = 0;
      v10 = sub_219904D38(a1);
      goto LABEL_22;
    }
  }
  else
  {
LABEL_13:
    sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CompareMemBlocks");
  }
  *(_BYTE *)(a1 + 266) = 84;
  *(_BYTE *)a1 = 2;
  v9 = v2 - *(unsigned __int16 *)(a1 + 252);
  phOsalNfc_MemCopy();
  if (v9 < 8)
  {
    *(_WORD *)(a1 + 252) += v9;
    phOsalNfc_SetMemory();
  }
  else
  {
    *(_WORD *)(a1 + 252) += 8;
  }
  *(_BYTE *)(a1 + 266) = 84;
  v10 = sub_219902E60(a1, (uint64_t)v13, 8);
LABEL_22:
  v11 = v10;
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_CopySendWrData");
  return v11;
}

uint64_t sub_2199051B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;

  v9 = 0;
  v10 = a1;
  sub_219850718(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamic_CB_Transceive");
  sub_21988EF68(v10, &v9);
  v7 = v9;
  if (v9)
  {
    if (a4)
      *(_WORD *)(v9 + 264) = *(_DWORD *)(a4 + 8);
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v7 + 48))(*(_QWORD *)(v7 + 2712), v7, a5);
  }
  return sub_219850808(0, (unsigned int *)&v10, 8u, 5u, (uint64_t)"phFriNfc_TopazDynamic_CB_Transceive");
}

uint64_t sub_219905248(uint64_t a1, int a2)
{
  uint64_t v4;
  unsigned __int16 v5;
  unsigned __int16 *v6;
  uint64_t v7;
  unsigned __int16 *v8;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetSkipSize");
  v4 = *(unsigned __int8 *)(a1 + 130);
  if (*(_BYTE *)(a1 + 130))
  {
    v5 = 0;
    v6 = (unsigned __int16 *)(a1 + 98);
    do
    {
      if (*(v6 - 1) == a2)
        v5 = *v6;
      v6 += 2;
      --v4;
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  v7 = *(unsigned __int8 *)(a1 + 184);
  if (*(_BYTE *)(a1 + 184))
  {
    v8 = (unsigned __int16 *)(a1 + 152);
    do
    {
      if (*(v8 - 1) == a2)
        v5 = *v8;
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_GetSkipSize");
  return v5;
}

uint64_t sub_219905308(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  _WORD *v5;
  unsigned int v6;
  uint64_t v7;
  _WORD *v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  __int16 v13;

  sub_219850718(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ActualCardSize");
  v2 = *(unsigned __int16 *)(a1 + 640);
  if (*(unsigned __int16 *)(a1 + 922) > v2)
    goto LABEL_15;
  v3 = sub_219902C98(a1);
  v4 = *(unsigned __int8 *)(a1 + 130);
  if (*(_BYTE *)(a1 + 130))
  {
    v5 = (_WORD *)(a1 + 98);
    do
    {
      v6 = (unsigned __int16)*(v5 - 1);
      if (v6 > v3 && (v6 & 0xFFF8) != 0x78)
        LOWORD(v2) = v2 - *v5;
      v5 += 2;
      --v4;
    }
    while (v4);
  }
  v7 = *(unsigned __int8 *)(a1 + 184);
  if (*(_BYTE *)(a1 + 184))
  {
    v8 = (_WORD *)(a1 + 152);
    do
    {
      v9 = (unsigned __int16)*(v8 - 1);
      if (v9 > v3 && (v9 & 0xFFF8) != 0x78)
        LOWORD(v2) = v2 - *v8;
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  v10 = *(unsigned __int16 *)(a1 + 922);
  if (v10 <= (unsigned __int16)v2)
  {
    if ((unsigned __int16)v2 < 0x100u || v10 > 0xFE)
    {
      if ((unsigned __int16)v2 != 255 || v10 > 0xFE)
      {
        v11 = 0;
        *(_WORD *)(a1 + 924) = v2;
        goto LABEL_16;
      }
      v11 = 0;
      v13 = 254;
    }
    else
    {
      v11 = 0;
      v13 = v2 - 2;
    }
    *(_WORD *)(a1 + 924) = v13;
  }
  else
  {
LABEL_15:
    *(_WORD *)(a1 + 922) = 0;
    v11 = 22;
  }
LABEL_16:
  sub_219850808(2, (unsigned int *)a1, 8u, 5u, (uint64_t)"phFriNfc_Tpz_H_ActualCardSize");
  return v11;
}

uint64_t sub_219905450(uint64_t a1, char a2)
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
  uint64_t v14;
  uint64_t v15;

  v14 = 0;
  v15 = 0;
  sub_219850718(2, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreInit");
  if (a1)
  {
    sub_21988EC5C(*(_QWORD *)(a1 + 24), &v15);
    v4 = v15;
    if (v15)
    {
      *(_QWORD *)(v15 + 48) = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 56) = v4;
      sub_219885FF8(1, (unsigned int *)(a1 + 48), 6u, 4u, (uint64_t)"####Primary NFCC, DriverHandle");
      sub_219885FF8(1, (unsigned int *)(a1 + 48), 6u, 4u, (uint64_t)"DOWNLOAD-CORE context");
      v5 = v15;
      *(_DWORD *)(v15 + 8492) = *(_DWORD *)(a1 + 48);
      *(_BYTE *)(v5 + 8504) = a2;
      sub_21988F744(*(_QWORD *)(v5 + 48), &v14);
      v6 = sub_21987FEF8(*(unsigned int **)(a1 + 40));
      *(_DWORD *)(a1 + 64) = 0;
      v7 = phOsalNfc_Timer_Create();
      if (v7 != 0xFFFFFFFFFFFFLL && (v8 = v7) != 0)
      {
        sub_219851790(1, (unsigned int *)(a1 + 48), 6u, 4u, (uint64_t)"phDnldNfc_CoreInit : Timer Create dwDnldRspTimerId!");
        *(_QWORD *)(v15 + 56) = v8;
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 48), 6u, 1u, (uint64_t)"phDnldNfc_CoreInit : Dnld Rsp Timer Create failed!!");
        v6 = 12;
      }
      v9 = phOsalNfc_Timer_Create();
      if (v9 != 0xFFFFFFFFFFFFLL && (v10 = v9) != 0)
      {
        sub_219851790(1, (unsigned int *)(a1 + 48), 6u, 4u, (uint64_t)"phDnldNfc_CoreInit : Timer Create dwDnldMuxTmlBusyTimerId!");
        *(_QWORD *)(v15 + 64) = v10;
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 48), 6u, 1u, (uint64_t)"phDnldNfc_CoreInit : Dnld Mux Tml Timer Create failed!!");
        v6 = 12;
      }
      v11 = phOsalNfc_Timer_Create();
      if (v11 != 0xFFFFFFFFFFFFLL && (v12 = v11) != 0)
      {
        sub_219851790(1, (unsigned int *)(a1 + 48), 6u, 4u, (uint64_t)"phDnldNfc_CoreInit : Timer Create dwDnldVenRstWaitTimerId!");
        *(_QWORD *)(v15 + 72) = v12;
      }
      else
      {
        sub_219850628(1, (unsigned int *)(a1 + 48), 6u, 1u, (uint64_t)"phDnldNfc_CoreInit : Dnld Ven Reset wait Timer Create failed!!");
        v6 = 12;
      }
    }
    else
    {
      v6 = 255;
    }
  }
  else
  {
    v6 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreInit");
  return v6;
}

uint64_t sub_2199056B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  sub_219850718(2, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreDeInit");
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 56);
    sub_21987FEF8(*(unsigned int **)(a1 + 40));
    *(_DWORD *)(a1 + 64) = 0;
    v3 = *(_QWORD *)(v2 + 56);
    if (v3)
      v4 = v3 == 0xFFFFFFFFFFFFLL;
    else
      v4 = 1;
    if (!v4)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(_QWORD *)(v2 + 56) = 0xFFFFFFFFFFFFLL;
    }
    v5 = *(_QWORD *)(v2 + 64);
    if (v5)
      v6 = v5 == 0xFFFFFFFFFFFFLL;
    else
      v6 = 1;
    if (!v6)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(_QWORD *)(v2 + 64) = 0xFFFFFFFFFFFFLL;
    }
    v7 = *(_QWORD *)(v2 + 72);
    if (v7)
      v8 = v7 == 0xFFFFFFFFFFFFLL;
    else
      v8 = 1;
    if (!v8)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(_QWORD *)(v2 + 72) = 0xFFFFFFFFFFFFLL;
    }
    phOsalNfc_SetMemory();
    v9 = 0;
    *(_DWORD *)(v2 + 8492) = 255;
    *(_QWORD *)(a1 + 56) = 0;
  }
  else
  {
    v9 = 1;
  }
  sub_219850808(2, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreDeInit");
  return v9;
}

uint64_t sub_2199057DC(uint64_t a1, int *a2)
{
  int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  const char *v8;
  uint64_t v9;
  int v10;
  unsigned int *v11;
  unsigned int v12;
  uint64_t v13;
  __int16 v14;
  int v15;
  unsigned int v16;
  unsigned __int8 *v17;
  _BYTE *v18;
  int v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  unsigned int v26;
  unsigned int v27;

  sub_219850718(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_BuildHdllPkt");
  if (a1)
  {
    phOsalNfc_SetMemory();
    *(_WORD *)(a1 + 124) = 6;
    v4 = a2[4];
    if (v4 && *((_QWORD *)a2 + 1))
    {
      LOWORD(v5) = v4 + 3;
      *(_WORD *)(a1 + 124) = v4 + 3;
      if (*a2 != 192)
        goto LABEL_46;
      if (*(_BYTE *)(a1 + 117) == 1)
      {
        *(_DWORD *)(a1 + 104) = v4;
        if ((*(_DWORD *)(a1 + 8480) - 8) > 2)
        {
          v6 = 0;
          *(_DWORD *)(a1 + 100) = 0;
        }
        else if (*((_BYTE *)a2 + 40))
        {
          v6 = a2[1];
          *(_DWORD *)(a1 + 100) = v6;
          *(_DWORD *)(a1 + 104) = v4 - v6 + 12;
        }
        else
        {
          v6 = 12;
          *(_DWORD *)(a1 + 100) = 12;
        }
      }
      else
      {
        v6 = *(_DWORD *)(a1 + 100);
      }
      sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Offset Address");
      sub_219851790(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"phDnldNfc_BuildHdllPkt wRemBytes");
      if (*(_DWORD *)(a1 + 104) && !*(_BYTE *)(a1 + 116))
      {
        v13 = *((_QWORD *)a2 + 1);
        v14 = *(unsigned __int8 *)(v13 + v6);
        *(_WORD *)(a1 + 110) = v14 << 8;
        *(_WORD *)(a1 + 110) = *(unsigned __int8 *)(v13 + v6 + 1) | (v14 << 8);
        sub_219851790(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Size Of DNLD PKT");
      }
      v15 = *(_DWORD *)(a1 + 8480);
      if (v15 == 8)
      {
        v5 = *(unsigned __int16 *)(a1 + 110);
        v16 = 4134;
      }
      else
      {
        v5 = *(unsigned __int16 *)(a1 + 110);
        if ((v15 - 9) > 1)
        {
          if (v5 >= 0x227)
          {
LABEL_31:
            if (*(_BYTE *)(a1 + 118))
            {
              v5 = *(unsigned __int16 *)(a1 + 108);
            }
            else
            {
              *(_WORD *)(a1 + 108) = v5;
              *(_DWORD *)(a1 + 100) += 2;
            }
            if ((v15 - 9) > 1)
            {
              if (v15 == 8)
              {
                if (v5 >= 0x1027)
                {
                  LOWORD(v5) = 4136;
                  goto LABEL_44;
                }
              }
              else if (v5 >= 0x227)
              {
                LOWORD(v5) = 552;
                goto LABEL_44;
              }
            }
            else if (v5 >= 0x102B)
            {
              LOWORD(v5) = 4140;
LABEL_44:
              *(_WORD *)(a1 + 124) = v5;
              *(_BYTE *)(a1 + 116) = 1;
              goto LABEL_46;
            }
            *(_WORD *)(a1 + 124) = v5;
            *(_BYTE *)(a1 + 116) = 0;
            goto LABEL_46;
          }
          goto LABEL_34;
        }
        v16 = 4138;
      }
      if (v5 > v16)
        goto LABEL_31;
LABEL_34:
      LOWORD(v5) = v5 + 2;
      *(_WORD *)(a1 + 124) = v5;
      *(_WORD *)(a1 + 110) = 0;
      goto LABEL_46;
    }
    if (a2[8] && *((_QWORD *)a2 + 3))
    {
      v7 = *a2;
      if (*a2 == 162)
      {
        LOWORD(v5) = 10;
        *(_WORD *)(a1 + 124) = 10;
LABEL_46:
        *(_WORD *)(a1 + 112) = v5;
        v17 = (unsigned __int8 *)(a1 + 8444);
        v18 = (_BYTE *)(a1 + 126 + *(unsigned __int8 *)(a1 + 8444));
        *v18 = (unsigned __int16)(v5 - 2) >> 8;
        v18[1] = v5 - 2;
        sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"phDnldNfc_BuildHdllPkt : Inserting FrameId ..");
        *(_BYTE *)(*(unsigned __int8 *)(a1 + 8444) + a1 + 126 + 2) = *a2;
        v19 = *a2;
        v20 = (*a2 - 162);
        if (v20 > 0x3E)
          goto LABEL_53;
        if (((1 << (*(_BYTE *)a2 + 94)) & 0x400000000000C020) != 0)
        {
          if (!a2[4] || !*((_QWORD *)a2 + 1))
            goto LABEL_56;
          goto LABEL_55;
        }
        if (v19 == 162)
        {
          if (*(_BYTE *)(a1 + 116))
          {
            v26 = *(_DWORD *)(a1 + 104);
            v27 = *(unsigned __int16 *)(a1 + 110);
          }
          else
          {
            sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"phDnldNfc_BuildHdllPkt : Verifying RspBuffInfo for Read Request..");
            v27 = 546;
            *(_WORD *)(a1 + 110) = 546;
            v26 = a2[8];
            *(_DWORD *)(a1 + 104) = v26;
            *(_DWORD *)(a1 + 96) = a2[1];
            *(_DWORD *)(a1 + 100) = 0;
            *(_WORD *)(a1 + 114) = 0;
            if (v26 - 547 <= 0xFFFFFDD8)
              *(_BYTE *)(a1 + 116) = 1;
          }
          if (v26 > v27)
            LOWORD(v26) = v27;
          *(_WORD *)(a1 + 112) = v26;
          phOsalNfc_MemCopy();
          phOsalNfc_MemCopy();
          ++*(_DWORD *)(a1 + 4280);
          sub_219851790(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"DNL Read COUNT");
          sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"DNL Read Addr");
          goto LABEL_56;
        }
        if (v20 != 30)
        {
LABEL_53:
          v21 = v19 - 241;
          if (v21 > 3 || v21 == 2)
          {
            v9 = 1;
            sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"phDnldNfc_BuildHdllPkt : Invalid Dnld Opcode!!");
            goto LABEL_57;
          }
        }
LABEL_55:
        phOsalNfc_MemCopy();
LABEL_56:
        v9 = 0;
LABEL_57:
        v22 = a1 + 126;
        v23 = sub_219853A48(*(_QWORD *)(a1 + 48), (unsigned __int8 *)(a1 + 126 + *v17), *(unsigned __int16 *)(a1 + 124));
        v24 = *(unsigned __int16 *)(a1 + 124);
        *(_BYTE *)(v22 + *v17 + v24) = HIBYTE(v23);
        *(_BYTE *)(v24 + v22 + *v17 + 1) = v23;
        *(_WORD *)(a1 + 124) = v24 + *v17 + 2;
        sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"phDnldNfc_BuildHdllPkt: Frame created successfully");
        goto LABEL_58;
      }
    }
    else
    {
      v7 = *a2;
    }
    LOWORD(v5) = 6;
    v12 = v7 - 167;
    if (v12 > 0x39 || ((1 << v12) & 0x200000002000001) == 0)
      goto LABEL_46;
    v8 = "phDnldNfc_BuildHdllPkt : Invalid Input Parameter(s)!!";
    v9 = 1;
    v10 = 1;
    v11 = (unsigned int *)(a1 + 8492);
  }
  else
  {
    v8 = "Invalid Input Parameter!!";
    v9 = 1;
    v10 = 3;
    v11 = 0;
  }
  sub_219850628(v10, v11, 6u, 1u, (uint64_t)v8);
LABEL_58:
  sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_BuildHdllPkt");
  return v9;
}

uint64_t sub_219905DA0(uint64_t a1)
{
  uint64_t v2;

  sub_219850718(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_ReqTmlRead");
  if (a1)
  {
    *(_WORD *)(a1 + 8438) = 0;
    *(_WORD *)(a1 + 8442) = 0;
    if (phTmlNfc_Read() == 13)
    {
      v2 = 13;
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Read Request Failure");
      sub_219886108(*(_QWORD *)(a1 + 48), 195);
      v2 = 255;
    }
  }
  else
  {
    v2 = 1;
  }
  sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_ReqTmlRead");
  return v2;
}

uint64_t sub_219905E74(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char *v9;

  sub_219850718(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_TmlReadCommonCb");
  if (!a1)
    goto LABEL_6;
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 12);
    if ((v4 & 1) != 0)
      break;
    v4 = 1;
    v5 = 1;
  }
  while (v6 != a1);
  if (v6 == a1
    && (v8 = *(_QWORD *)(a1 + 8496)) != 0
    && a2
    && *(_QWORD *)(v8 + 6584)
    && (v9 = *(char **)(a2 + 8)) != 0
    && *(_WORD *)(a2 + 16)
    && !*(_WORD *)a2
    && *v9 <= -127)
  {
    sub_2199094F8(a1, a2);
  }
  else
  {
LABEL_6:
    sub_219906C34(a1, a2);
  }
  return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_TmlReadCommonCb");
}

uint64_t sub_219905F58(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v6;
  unsigned __int8 *v7;
  int v8;
  int v9;
  _BYTE *v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  const char *v16;
  unsigned int *v17;
  int v18;
  unsigned int *v19;
  const char *v20;
  int v21;
  unsigned int *v22;
  uint64_t v23;
  int v24;
  unsigned int *v25;
  const char *v26;
  int v27;
  int v28;
  int v29;
  unsigned int *v30;
  const char *v31;
  uint64_t v32;
  int v33;
  unsigned __int16 v34;
  unsigned int v35;
  int v36;
  int v37;
  int v38;
  unsigned int *v39;
  int v40;
  int v41;
  uint64_t v42;

  sub_219850718(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_DnldValidateRxdPkt");
  if (a1)
  {
    if (!*(_WORD *)a2
      && (v6 = *(unsigned __int16 *)(a2 + 16), *(_WORD *)(a2 + 16))
      && (v7 = *(unsigned __int8 **)(a2 + 8)) != 0)
    {
      v42 = *(_QWORD *)(a1 + 48);
      sub_219850718(0, (unsigned int *)&v42, 6u, 5u, (uint64_t)"phDnldNfc_DnldVldtCrcRcvd");
      v8 = sub_219853A48(v42, v7, (unsigned __int16)(v6 - 2));
      v9 = *v7;
      if ((v7[(v6 - 1)] | (v7[v6 - 2] << 8)) != v8)
      {
        if (v9 == 96 && !v7[1] && v7[2] == 2 && v7[3] == 165)
        {
          sub_219850628(0, (unsigned int *)&v42, 6u, 1u, (uint64_t)"RESET NTF- NO UART MSG Received");
          v4 = 132;
        }
        else
        {
          sub_219850628(0, (unsigned int *)&v42, 6u, 1u, (uint64_t)"Invalid frame received");
          sub_219851888(0, (unsigned int *)&v42, 6u, 1u, (uint64_t)"Received CRC: ");
          sub_219851888(0, (unsigned int *)&v42, 6u, 1u, (uint64_t)"Calculated CRC: ");
          v4 = 255;
        }
        v16 = "phDnldNfc_DnldVldtCrcRcvd";
        v17 = (unsigned int *)&v42;
        v18 = 0;
        goto LABEL_130;
      }
      if ((v7[1] | (v9 << 8)) == (unsigned __int16)(v6 - 4))
      {
        v10 = (_BYTE *)(a1 + 8445);
        sub_219850808(0, (unsigned int *)&v42, 6u, 5u, (uint64_t)"phDnldNfc_DnldVldtCrcRcvd");
        if (!*(_BYTE *)(*(_QWORD *)(a2 + 8) + 2) && !*v10)
          *v10 = 1;
        v42 = 0;
        sub_219850718(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_UpdateRsp");
        sub_21988F460(*(_QWORD *)(a1 + 48), &v42);
        v11 = *(_DWORD *)a1;
        v12 = v42;
        if (*(_DWORD *)a1 != 192 && v42 && *(_DWORD *)(v42 + 64) != 2)
        {
          switch(*(_BYTE *)(*(_QWORD *)(a2 + 8) + 2))
          {
            case '0':
              goto LABEL_17;
            case '1':
              v19 = (unsigned int *)(a1 + 8492);
              v20 = "EDL_CERT_ERROR:Error during Cert frame processing";
              goto LABEL_68;
            case '2':
              v19 = (unsigned int *)(a1 + 8492);
              v20 = "MISSING_CERTIFICATE:Missing certificate (missing 0xC1 frame)";
              goto LABEL_68;
            case '3':
              v19 = (unsigned int *)(a1 + 8492);
              v20 = "CHIPID_OR_MASK_ERROR:Wrong ChipId or ChipMask in First Frame";
              goto LABEL_68;
            default:
              if (!*(_BYTE *)(*(_QWORD *)(a2 + 8) + 2))
                goto LABEL_17;
              v22 = (unsigned int *)(a1 + 8492);
              break;
          }
          goto LABEL_57;
        }
LABEL_17:
        if (v11 > 223)
        {
          if ((v11 - 241) >= 2)
          {
            if (v11 == 244)
            {
              if (*(_DWORD *)(a1 + 32) && *(_QWORD *)(a1 + 24))
              {
                phOsalNfc_MemCopy();
                v4 = 0;
                *(_DWORD *)(a1 + 32) = *(unsigned __int16 *)(a2 + 16);
                goto LABEL_129;
              }
              sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Cannot update Response buff with received data!!");
              goto LABEL_128;
            }
            if (v11 != 224)
              goto LABEL_40;
          }
        }
        else if (v11 <= 175)
        {
          if (v11 == 162)
          {
            v23 = *(_QWORD *)(a2 + 8);
            if (*(_BYTE *)(v23 + 1) == 4 && *(_BYTE *)(v23 + 2) == 48)
            {
              *(_DWORD *)(a1 + 8508) = 0;
              if (!v12 || *(_DWORD *)(v12 + 64) != 2)
              {
                switch(*(_BYTE *)(a1 + 8484))
                {
                  case 2:
                    *(_BYTE *)(a1 + 8484) = 3;
                    v30 = (unsigned int *)(a1 + 8492);
                    sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"FIRST_SUCC FAILED ADDRESS");
                    *(_DWORD *)(a1 + 96) = *(_DWORD *)(a1 + 4284) + 409;
                    v31 = "FIRST_SUCC NEXT ADDRESS";
                    goto LABEL_126;
                  case 3:
                    *(_BYTE *)(a1 + 8484) = 5;
                    v30 = (unsigned int *)(a1 + 8492);
                    sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"M1 FAILED ADDRESS");
                    ++*(_DWORD *)(a1 + 96);
                    v31 = "M1 Fallback NEXT ADDRESS";
                    goto LABEL_126;
                  case 4:
                    *(_BYTE *)(a1 + 8484) = 5;
                    v30 = (unsigned int *)(a1 + 8492);
                    sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"M2 FAILED ADDRESS");
                    ++*(_DWORD *)(a1 + 96);
                    v31 = "M2 Fallback NEXT ADDRESS";
                    goto LABEL_126;
                  case 5:
                    v30 = (unsigned int *)(a1 + 8492);
                    sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Fallback Error Addr");
                    ++*(_DWORD *)(a1 + 96);
                    v31 = "Fallback CONTD NEXT ADDR";
LABEL_126:
                    v39 = v30;
                    goto LABEL_127;
                  default:
                    *(_DWORD *)(a1 + 96) += 546;
                    sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"CHUNK READ ERROR ADDR");
                    v4 = 0;
                    *(_BYTE *)(a1 + 8484) = 1;
                    goto LABEL_129;
                }
              }
              sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 2u, (uint64_t)"Memory Read PH_DL_STATUS_READFLASH_PROTECTED_ERROR !!");
              phOsalNfc_MemCopy();
              *(_DWORD *)(a1 + 32) = 1;
              *(_DWORD *)(a1 + 104) = 0;
              v4 = 48;
              goto LABEL_129;
            }
            switch(*(_BYTE *)(a1 + 8484))
            {
              case 1:
                *(_BYTE *)(a1 + 8484) = 2;
                v24 = *(_DWORD *)(a1 + 96) - 546;
                *(_DWORD *)(a1 + 96) = v24;
                *(_DWORD *)(a1 + 4284) = v24;
                v25 = (unsigned int *)(a1 + 8492);
                sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"First Success RD Address");
                *(_DWORD *)(a1 + 96) = *(_DWORD *)(a1 + 4284) + 273;
                v26 = "First Success RD, Midpoint0 read NEXT ADDR";
                goto LABEL_92;
              case 2:
                *(_BYTE *)(a1 + 8484) = 4;
                v25 = (unsigned int *)(a1 + 8492);
                sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"FIRST_SUCC,2nd SUCCESS ADDRESS");
                *(_DWORD *)(a1 + 96) = *(_DWORD *)(a1 + 4284) + 136;
                v26 = "FIRST_SUCC NEXT dwAddr";
                goto LABEL_92;
              case 3:
                v25 = (unsigned int *)(a1 + 8492);
                sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"M1 Success Addr");
                *(_BYTE *)(a1 + 8484) = 5;
                *(_DWORD *)(a1 + 96) = *(_DWORD *)(a1 + 4284) + 273;
                v26 = "M1 NEXT Addr";
                goto LABEL_92;
              case 4:
                *(_BYTE *)(a1 + 8484) = 5;
                v25 = (unsigned int *)(a1 + 8492);
                sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)" M2 Success, 3rd SUCCESS Addr");
                *(_DWORD *)(a1 + 96) = *(_DWORD *)(a1 + 4284);
                v26 = "M2 NEXT dwAddr";
LABEL_92:
                sub_219851888(1, v25, 6u, 4u, (uint64_t)v26);
                *(_WORD *)(a1 + 112) = 0;
                break;
              case 5:
                if (!*(_DWORD *)(a1 + 8508))
                  *(_DWORD *)(a1 + 8508) = *(_DWORD *)(a1 + 96);
                sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"FOUND START ADDR");
                *(_DWORD *)(a1 + 104) = *(_DWORD *)(a1 + 120) - *(_DWORD *)(a1 + 96) + 1;
                *(_BYTE *)(a1 + 8484) = 0;
                break;
              default:
                break;
            }
            if (v42)
            {
              v32 = *(_QWORD *)(a2 + 8);
              if (*(_DWORD *)(v42 + 64) == 2 && *(_BYTE *)(v32 + 2))
              {
                sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 2u, (uint64_t)"Memory Read Error!!,status");
                v4 = 48;
                **(_BYTE **)(a1 + 24) = 48;
                *(_DWORD *)(a1 + 32) = 1;
                goto LABEL_110;
              }
            }
            else
            {
              v32 = *(_QWORD *)(a2 + 8);
            }
            v33 = *(unsigned __int16 *)(v32 + 4);
            if (v33 == *(unsigned __int16 *)(a1 + 112))
            {
              if (!*(_BYTE *)(a1 + 8484))
              {
                phOsalNfc_MemCopy();
                v4 = 0;
                v34 = *(_WORD *)(a1 + 114) + v33;
                *(_WORD *)(a1 + 114) = v34;
                *(_DWORD *)(a1 + 32) = v34;
                v35 = *(unsigned __int16 *)(a1 + 112);
                *(_DWORD *)(a1 + 104) -= v35;
                *(int32x2_t *)(a1 + 96) = vadd_s32(*(int32x2_t *)(a1 + 96), vdup_n_s32(v35));
                goto LABEL_129;
              }
              goto LABEL_128;
            }
            if (*(_BYTE *)(a1 + 8484))
              goto LABEL_128;
            v19 = (unsigned int *)(a1 + 8492);
            v20 = "Desired Length bytes not received!!";
            goto LABEL_68;
          }
          if (v11 != 167)
          {
LABEL_40:
            v19 = (unsigned int *)(a1 + 8492);
            v20 = "Unknown cmd id passed, while receive!!";
LABEL_68:
            sub_219850628(1, v19, 6u, 1u, (uint64_t)v20);
            goto LABEL_69;
          }
        }
        else
        {
          if (v11 == 176)
          {
            if (!*(_DWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 24))
              goto LABEL_128;
            v21 = (unsigned __int16)(v6 - 5) + 1;
            goto LABEL_48;
          }
          if (v11 != 177)
          {
            if (v11 == 192)
            {
              v13 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 8) + 2);
              if (*(_BYTE *)(*(_QWORD *)(a2 + 8) + 2))
              {
                if (*(_BYTE *)(a1 + 118) == 1)
                {
                  if (v13 == 46 && *(_BYTE *)(a1 + 116) == 1)
                  {
                    v4 = 0;
                    v27 = *(unsigned __int16 *)(a1 + 112);
                    *(_WORD *)(a1 + 108) -= v27;
                    v28 = *(_DWORD *)(a1 + 104) - v27;
                    *(_DWORD *)(a1 + 100) += v27;
                    *(_DWORD *)(a1 + 104) = v28;
                    goto LABEL_129;
                  }
                }
                else if (!*(_BYTE *)(a1 + 118) && v13 == 45 && *(_BYTE *)(a1 + 116) == 1)
                {
                  *(_BYTE *)(a1 + 118) = 1;
                  v14 = *(unsigned __int16 *)(a1 + 112);
                  *(_WORD *)(a1 + 108) -= v14;
                  v15 = *(_DWORD *)(a1 + 104) - v14 - 2;
                  *(_DWORD *)(a1 + 100) += v14;
                  *(_DWORD *)(a1 + 104) = v15;
                  if (*(_BYTE *)(a1 + 117) == 1)
                  {
                    sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"First Write Frame Success Status received!!");
                    v4 = 0;
                    *(_BYTE *)(a1 + 117) = 0;
LABEL_129:
                    v16 = "phDnldNfc_UpdateRsp";
                    v18 = 3;
                    v17 = (unsigned int *)a1;
LABEL_130:
                    sub_219850808(v18, v17, 6u, 5u, (uint64_t)v16);
                    goto LABEL_6;
                  }
LABEL_128:
                  v4 = 0;
                  goto LABEL_129;
                }
                if (*(unsigned __int8 *)(*(_QWORD *)(a2 + 8) + 2) > 0x20u)
                {
                  switch(v13)
                  {
                    case '!':
                      sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Signature Mismatch Error received!!");
                      v40 = 33;
                      break;
                    case '1':
                      sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"EDL_CERT_ERROR:Error during Cert frame processing");
                      v40 = 49;
                      break;
                    case '$':
                      sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Firmware Already Up To Date!!");
                      v4 = 0;
                      *(_BYTE *)(a1 + 117) = 0;
                      *(_DWORD *)(a1 + 100) = 0;
                      *(_DWORD *)(a1 + 104) = 0;
                      goto LABEL_129;
                    default:
LABEL_117:
                      sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Unsuccessful Status received!!");
                      v41 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 8) + 2);
                      if (v41 == 51)
                      {
                        v20 = "CHIPID_OR_MASK_ERROR:Wrong ChipId or ChipMask in First Frame";
                        goto LABEL_132;
                      }
                      if (v41 == 50)
                      {
                        v20 = "MISSING_CERTIFICATE:Missing certificate (missing 0xC1 frame)";
LABEL_132:
                        v19 = (unsigned int *)(a1 + 8492);
                        goto LABEL_68;
                      }
                      v22 = (unsigned int *)(a1 + 8492);
LABEL_57:
                      sub_219851888(1, v22, 6u, 1u, (uint64_t)"Received DNDL Error, Status:");
LABEL_69:
                      v4 = 255;
                      goto LABEL_129;
                  }
                  *(_DWORD *)(a1 + 8448) = v40;
                  v4 = 147;
                  goto LABEL_129;
                }
                if (v13 == 13)
                {
                  sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"PLL Error Status received!!");
                  *(_DWORD *)(a1 + 8448) = 13;
                  v4 = 21;
                  goto LABEL_129;
                }
                if (v13 == 32)
                {
                  sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Mem Busy Status received!!");
                  *(_DWORD *)(a1 + 8448) = 32;
                  goto LABEL_69;
                }
                goto LABEL_117;
              }
              if (*(_BYTE *)(a1 + 117) == 1)
              {
                sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"First Write Frame Success Status received!!");
                *(_BYTE *)(a1 + 117) = 0;
              }
              if (*(_BYTE *)(a1 + 118) == 1)
              {
                v19 = (unsigned int *)(a1 + 8492);
                if (*(_BYTE *)(a1 + 116))
                {
                  v20 = "UnExpected Status received!!";
                  goto LABEL_68;
                }
                sub_219850628(1, v19, 6u, 4u, (uint64_t)"Chunked Write Frame Success Status received!!");
                v29 = *(unsigned __int16 *)(a1 + 112);
                *(_WORD *)(a1 + 108) -= v29;
                *(_BYTE *)(a1 + 118) = 0;
              }
              else
              {
                v29 = *(unsigned __int16 *)(a1 + 112);
              }
              v36 = *(_DWORD *)(a1 + 104);
              v37 = *(_DWORD *)(a1 + 100) + v29;
              *(_DWORD *)(a1 + 100) = v37;
              *(_DWORD *)(a1 + 104) = v36 - v29;
              v38 = *(_DWORD *)(a1 + 4);
              if (*(_BYTE *)(a1 + 40) || v38 != v37)
              {
                if (v38 == v37)
                {
                  v39 = (unsigned int *)(a1 + 8492);
                  v31 = "Start of Degraded FW Update, Offset";
LABEL_127:
                  sub_219851888(1, v39, 6u, 4u, (uint64_t)v31);
                }
                else if (v36 == v29)
                {
                  sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Download Completed (Degraded FW)");
                  v4 = 0;
                  *(_BYTE *)(a1 + 40) = 0;
                  goto LABEL_129;
                }
                goto LABEL_128;
              }
              sub_219851888(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Regular FW Update Complete, Offset");
              v4 = 0;
LABEL_110:
              *(_DWORD *)(a1 + 104) = 0;
              goto LABEL_129;
            }
            goto LABEL_40;
          }
        }
        if (!*(_DWORD *)(a1 + 32) || !*(_QWORD *)(a1 + 24))
          goto LABEL_128;
        v21 = (unsigned __int16)(v6 - 5);
LABEL_48:
        phOsalNfc_MemCopy();
        v4 = 0;
        *(_DWORD *)(a1 + 32) = v21;
        goto LABEL_129;
      }
      sub_219850628(0, (unsigned int *)&v42, 6u, 1u, (uint64_t)"Invalid frame payload length received");
      sub_219850808(0, (unsigned int *)&v42, 6u, 5u, (uint64_t)"phDnldNfc_DnldVldtCrcRcvd");
    }
    else
    {
      sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Dnld Cmd Request Failed!!");
    }
    v4 = 255;
  }
  else
  {
    v4 = 1;
    sub_219850628(3, 0, 6u, 1u, (uint64_t)"Invalid Input Parameters!!");
  }
LABEL_6:
  sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_DnldValidateRxdPkt");
  return v4;
}

uint64_t sub_219906C34(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  int v17;
  unsigned __int16 v18;
  unsigned int v19;
  int v20;
  __int16 v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  unsigned int v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v36 = 0;
  v37 = 0;
  v34 = 0;
  v35 = 0;
  sub_219850718(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
  if (!a1)
    return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
  v4 = 0;
  v5 = 0;
  v6 = (_BYTE *)(a1 + 4288);
  do
  {
    v7 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 12);
    if ((v4 & 1) != 0)
      break;
    v4 = 1;
    v5 = 1;
  }
  while (v7 != a1);
  if (v7 != a1)
    return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
  v9 = *(_QWORD *)(a1 + 8496);
  if (!v9)
    return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
  if (!a2
    || (v10 = *(_QWORD *)(a2 + 8)) == 0
    || v10 != a1 + 4288 + *(unsigned __int16 *)(a1 + 8438)
    || !*(_WORD *)(a2 + 16)
    || *(_WORD *)a2)
  {
    v11 = 1;
    goto LABEL_12;
  }
  sub_21988F744(*(_QWORD *)(a1 + 48), &v37);
  v18 = *(_WORD *)(a1 + 8438) + *(_WORD *)(a2 + 16);
  *(_WORD *)(a1 + 8438) = v18;
  if (v18 <= 1u)
  {
    *(_WORD *)(a1 + 8442) = 2 - v18;
    goto LABEL_30;
  }
  v19 = *v6;
  if (*(_DWORD *)a1 != 162)
  {
    if (!*v6)
    {
      v20 = *(unsigned __int8 *)(a1 + 4289);
      if (*(_BYTE *)(a1 + 4289))
        goto LABEL_63;
    }
LABEL_56:
    sub_219851FF8(1, (unsigned int *)(a1 + 8492), 6u, 2u, (uint64_t)"corrutped dnld packet rxd and dropped", a1 + 4288);
    phTmlNfc_ReadAbort();
    phTmlNfc_FlushTxRxBuffers();
    *(_WORD *)(a1 + 8438) = 0;
    *(_WORD *)(a1 + 8442) = 0;
    v26 = phTmlNfc_Read();
    if (v26 == 13)
      return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
    v11 = v26;
    sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"phDnldNfc_RecvDnldPkt: dnld packet Read Request Failure");
LABEL_58:
    sub_219886108(*(_QWORD *)(a1 + 48), 195);
    goto LABEL_59;
  }
  if (v19 > 3)
    goto LABEL_56;
  v20 = *(unsigned __int8 *)(a1 + 4289);
LABEL_63:
  v27 = (v20 & 0xFFFFFCFF | ((v19 & 3) << 8)) + 4;
  *(_WORD *)(a1 + 8442) = v27 - v18;
  if ((unsigned __int16)(v27 - v18) > 0x22Au)
  {
    v11 = 255;
    v31 = "Invalid length : Received size greater than maximum download frame size!!";
  }
  else
  {
    if (v27 == v18)
    {
      *(_QWORD *)(a2 + 8) = v6;
      *(_WORD *)(a2 + 16) = v18;
      *(_WORD *)(a1 + 8442) = 0;
      v11 = sub_219905F58(a1, a2);
      if (v11 != 48 && (_BYTE)v11)
      {
LABEL_59:
        if (v11 <= 0x30 && ((1 << v11) & 0x1000000002001) != 0)
          return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
        goto LABEL_12;
      }
      if (sub_219905DA0(a1) != 13)
      {
        if (v11 == 48)
        {
          *(_WORD *)a2 = 48;
          *(_DWORD *)(v9 + 5956) = 4;
          sub_21987D1CC(v9, 8, a2);
          if (!v37)
            return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
          v32 = 0;
          v33 = 0;
          do
          {
            v30 = *((_QWORD *)&unk_253E46700 + 14 * v33 + 4);
            if ((v32 & 1) != 0)
              break;
            v32 = 1;
            v33 = 1;
          }
          while (v30 != v9);
LABEL_74:
          if (v30 == v9 && !*(_BYTE *)(v9 + 5952) && !sub_21988F8B8(*(_QWORD *)(v9 + 6480)))
            sub_219907214((unsigned int *)v9);
          return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
        }
        if ((_BYTE)v11)
          goto LABEL_59;
      }
      *(_DWORD *)(v9 + 5956) = 4;
      sub_21987D1CC(v9, 8, a2);
      if (!v37)
        return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
      v28 = 0;
      v29 = 0;
      do
      {
        v30 = *((_QWORD *)&unk_253E46700 + 14 * v29 + 4);
        if ((v28 & 1) != 0)
          break;
        v28 = 1;
        v29 = 1;
      }
      while (v30 != v9);
      goto LABEL_74;
    }
    if (v27 > v18)
    {
LABEL_30:
      v11 = phTmlNfc_Read();
      if (v11 == 13)
        return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
      goto LABEL_58;
    }
    v11 = 1;
    v31 = "Critical failure in Download!!";
  }
  sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)v31);
LABEL_12:
  v12 = 0;
  v13 = 0;
  do
  {
    v14 = *((_QWORD *)&unk_253E46700 + 14 * v13 + 12);
    if ((v12 & 1) != 0)
      break;
    v12 = 1;
    v13 = 1;
  }
  while (v14 != a1);
  if (v14 == a1)
    v15 = a1;
  else
    v15 = 0;
  if (a2)
  {
    if (v14 == a1)
    {
      v16 = *(unsigned __int8 **)(a2 + 8);
      if (v16)
      {
        if (*(unsigned __int16 *)(v15 + 8438) <= 2u)
        {
          v17 = *(unsigned __int16 *)(a2 + 16);
          if ((v17 - 3) < 0xFFFFFFFE || *(_WORD *)a2)
          {
LABEL_24:
            sub_219851FF8(1, (unsigned int *)(v15 + 8492), 6u, 2u, (uint64_t)"corrutped packet rxd and dropped", (uint64_t)v16);
            phTmlNfc_ReadAbort();
            phTmlNfc_FlushTxRxBuffers();
            *(_WORD *)(v15 + 8438) = 0;
            *(_WORD *)(v15 + 8442) = 0;
            if (phTmlNfc_Read() != 13)
            {
              sub_219850628(1, (unsigned int *)(v15 + 8492), 6u, 1u, (uint64_t)"phDnldNfc_RecvDnldPkt: Read Request Failure");
              sub_219886108(*(_QWORD *)(v15 + 48), 195);
            }
            return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
          }
          if (*(_DWORD *)v15 == 162)
          {
            if (*v16 >= 4u)
              goto LABEL_24;
          }
          else if (*v16 || v17 == 2 && !v16[1])
          {
            goto LABEL_24;
          }
        }
      }
    }
  }
  if (v11 == 132 || v11 == 147)
    v22 = v11;
  else
    v22 = 255;
  if (sub_219905DA0(v15) != 13)
  {
    sub_219850628(1, (unsigned int *)(v9 + 6476), 6u, 1u, (uint64_t)"phDnldNfc_RecvDnldPkt: Read Request Failure");
    v22 = 255;
  }
  LOWORD(v34) = v22;
  v35 = 0;
  LOWORD(v36) = 0;
  *(_DWORD *)(v9 + 5956) = 4;
  sub_21987D1CC(v9, 9, &v34);
  v23 = 0;
  v24 = 0;
  do
  {
    v25 = *((_QWORD *)&unk_253E46700 + 14 * v24 + 4);
    if ((v23 & 1) != 0)
      break;
    v23 = 1;
    v24 = 1;
  }
  while (v25 != v9);
  if (v25 == v9 && *(_BYTE *)(v9 + 5954) == 1)
  {
    *(_BYTE *)(v9 + 5954) = 0;
    *(_DWORD *)(v9 + 5956) = 5;
    sub_21987D1CC(v9, 9, 0);
  }
  return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldPkt");
}

uint64_t sub_219907214(unsigned int *a1)
{
  _QWORD v3[3];

  memset(v3, 0, sizeof(v3));
  sub_219850718(2, a1, 3u, 5u, (uint64_t)"phNciMuxNfc_InitiateNextPkt");
  sub_21987D1CC(a1, 7, v3);
  return sub_219850808(2, a1, 3u, 5u, (uint64_t)"phNciMuxNfc_InitiateNextPkt");
}

uint64_t sub_21990728C(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t (*v7)(_QWORD, uint64_t, uint64_t);

  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)(result + 56);
    if (v5)
      v6 = v5 == 0xFFFFFFFFFFFFLL;
    else
      v6 = 1;
    if (!v6)
      result = sub_21988C4AC(*(_DWORD *)(result + 8492), v5);
    v7 = *(uint64_t (**)(_QWORD, uint64_t, uint64_t))(v4 + 8464);
    if (v7)
      return v7(*(_QWORD *)(v4 + 8472), a3, v4 + 24);
  }
  return result;
}

uint64_t sub_2199072EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  _OWORD v10[10];
  __int128 v11;
  uint64_t v12;

  v12 = 0;
  v11 = 0u;
  memset(v10, 0, sizeof(v10));
  sub_219850718(4, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_DnldCoreIfTxRx");
  v8 = 1;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        BYTE14(v11) = 1;
        phOsalNfc_MemCopy();
        phOsalNfc_MemCopy();
        *(_BYTE *)(a1 + 117) = 1;
        *(_DWORD *)(a1 + 4280) = 0;
        v8 = sub_21987EC70(*(_QWORD *)(a1 + 8496), 4u, (uint64_t)v10, (uint64_t)sub_21990728C, a1);
        if ((_DWORD)v8 == 13)
        {
          *(_QWORD *)(a1 + 8464) = a3;
          *(_QWORD *)(a1 + 8472) = a4;
        }
      }
    }
  }
  sub_219850808(4, (unsigned int *)a1, 3u, 5u, (uint64_t)"phNciNfc_DnldCoreIfTxRx");
  return v8;
}

uint64_t sub_219907400(uint64_t a1, unsigned __int8 *a2)
{
  unsigned int v4;

  sub_219850718(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreSendCb");
  if (!a2)
  {
    if (a1)
    {
      sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Invalid pInfo received from TML!!");
      return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreSendCb");
    }
LABEL_10:
    sub_219850628(3, 0, 6u, 2u, (uint64_t)"Nci context cleared, received send CB!!");
    return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreSendCb");
  }
  v4 = *((_DWORD *)a2 + 1);
  if (v4 <= 1)
    sub_21988F804(*((_QWORD *)&unk_253E46700 + 14 * v4), 0);
  if (!a1)
    goto LABEL_10;
  if (*a2 == 179)
  {
    sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 2u, (uint64_t)"SPMI Nack");
  }
  else if (*a2)
  {
    sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"Tml Write error!!");
  }
  else
  {
    sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 4u, (uint64_t)"Send Success");
  }
  sub_21987D1CC(*(_QWORD *)(a1 + 8496), 7, a2);
  return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_CoreSendCb");
}

uint64_t sub_219907554(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v9 = 0;
  sub_219850718(3, (unsigned int *)a2, 6u, 5u, (uint64_t)"phDnldNfc_RspTimeOutCb");
  if (a2)
  {
    if (*(_QWORD *)(a2 + 8496))
    {
      sub_21988F744(*(_QWORD *)(a2 + 48), &v9);
      v4 = *(_QWORD *)(a2 + 8496);
      sub_21988C4AC(*(_DWORD *)(v4 + 6476), a1);
      if (v4)
      {
        if (*(_QWORD *)(a2 + 56) == a1)
        {
          *(_DWORD *)(v4 + 5956) = 4;
          sub_21987D1CC(v4, 10, 0);
          if (v9)
          {
            v5 = 0;
            v6 = 0;
            do
            {
              v7 = *((_QWORD *)&unk_253E46700 + 14 * v6 + 4);
              if ((v5 & 1) != 0)
                break;
              v5 = 1;
              v6 = 1;
            }
            while (v7 != v4);
            if (v7 == v4 && !*(_BYTE *)(v4 + 5952) && !sub_21988F8B8(*(_QWORD *)(v4 + 6480)))
              sub_219907214((unsigned int *)v4);
          }
        }
      }
    }
  }
  return sub_219850808(3, (unsigned int *)a2, 6u, 5u, (uint64_t)"phDnldNfc_RspTimeOutCb");
}

uint64_t sub_21990766C(uint64_t a1)
{
  uint64_t v1;
  char v2;
  char v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v12;
  uint64_t v13;
  unsigned int *v14;
  _QWORD *v15;
  uint64_t v16;

  v15 = 0;
  v16 = a1;
  v14 = 0;
  sub_219850718(0, (unsigned int *)&v16, 6u, 5u, (uint64_t)"phDnldEseNfc_CoreInit");
  v1 = 0;
  v2 = 1;
  while (1)
  {
    v3 = v2;
    if (*((_QWORD *)&unk_253E46700 + 14 * v1) == v16)
      break;
    v2 = 0;
    v1 = 1;
    if ((v3 & 1) == 0)
    {
      sub_21988F0DC(v16, &v14);
LABEL_11:
      v5 = 1;
      goto LABEL_12;
    }
  }
  v4 = *((_DWORD *)&unk_253E46700 + 28 * v1 + 2);
  sub_21988F0DC(v16, &v14);
  if (v4 > 1)
    goto LABEL_11;
  sub_21987C9E0(v4, (uint64_t *)&v15);
  v5 = 1;
  if (v16)
  {
    v6 = (uint64_t)v15;
    if (v15)
    {
      *v15 = v16;
      *(_DWORD *)(v6 + 1368) = v4;
      v7 = v14;
      *(_QWORD *)(v6 + 1376) = v14;
      *(_BYTE *)(v6 + 1384) = 1;
      sub_219902364((uint64_t)v7, v6);
      sub_21987FEF8(v14);
      sub_219885FF8(0, (unsigned int *)&v16, 6u, 4u, (uint64_t)"####Primary NFCC, DriverHandle");
      sub_219885FF8(0, (unsigned int *)&v16, 6u, 4u, (uint64_t)"####Primary NFCC, DOWNLOAD-ESE-CORE context");
      v8 = phOsalNfc_Timer_Create();
      if (v8 != 0xFFFFFFFFFFFFLL && (v9 = v8) != 0)
      {
        sub_219851790(0, (unsigned int *)&v16, 6u, 4u, (uint64_t)"phDnldEseNfc_CoreInit : Timer Create dwRspTimerId!");
        v15[6] = v9;
        v12 = phOsalNfc_Timer_Create();
        if (v12 != 0xFFFFFFFFFFFFLL)
        {
          v13 = v12;
          if (v12)
          {
            sub_219851790(0, (unsigned int *)&v16, 6u, 4u, (uint64_t)"phDnldEseNfc_CoreInit : Timer Create dwCrdtTimerId!");
            v5 = 0;
            v15[7] = v13;
            goto LABEL_12;
          }
        }
        v10 = "phDnldEseNfc_CoreInit : Dnld Ese Credit Timer Create failed!!";
      }
      else
      {
        v10 = "phDnldEseNfc_CoreInit : Dnld Ese Rsp Timer Create failed!!";
      }
      sub_219850628(0, (unsigned int *)&v16, 6u, 1u, (uint64_t)v10);
      v5 = 12;
    }
  }
LABEL_12:
  sub_219850808(0, (unsigned int *)&v16, 6u, 5u, (uint64_t)"phDnldEseNfc_CoreInit");
  return v5;
}

uint64_t sub_219907884(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _OWORD v11[10];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = 0;
  v13 = 0;
  v12 = 0u;
  memset(v11, 0, sizeof(v11));
  sub_219850718(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phNciNfc_DnldEseCoreIfTxOnly");
  v8 = 1;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        sub_21988F0DC(*(_QWORD *)a1, &v14);
        BYTE14(v12) = 1;
        phOsalNfc_SetMemory();
        phOsalNfc_SetMemory();
        phOsalNfc_MemCopy();
        phOsalNfc_MemCopy();
        v8 = sub_21987EC70(v14, 5u, (uint64_t)v11, (uint64_t)sub_219907A08, a1);
        if ((_DWORD)v8 == 13)
        {
          *(_QWORD *)(a1 + 80) = a3;
          *(_QWORD *)(a1 + 88) = a4;
          v9 = *(_QWORD *)(a1 + 48);
          if (v9)
          {
            if (v9 != 0xFFFFFFFFFFFFLL)
            {
              if (*(_BYTE *)(a1 + 16) == 1)
              {
                sub_21988C4AC(*(_DWORD *)(a1 + 1368), v9);
                *(_BYTE *)(a1 + 16) = 0;
              }
              v8 = 13;
            }
          }
        }
      }
    }
  }
  sub_219850808(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phNciNfc_DnldEseCoreIfTxOnly");
  return v8;
}

uint64_t sub_219907A08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  void (*v8)(_QWORD, uint64_t, uint64_t);
  char v9;
  uint64_t v10;
  uint64_t v11;

  sub_219850718(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phNciNfc_DnldEseCoreIfTxOnlyComplete");
  if (a1)
  {
    v5 = *(_QWORD *)(a1 + 48);
    if (v5)
      v6 = v5 == 0xFFFFFFFFFFFFLL;
    else
      v6 = 1;
    if (!v6)
    {
      sub_21988C4AC(*(_DWORD *)(a1 + 1368), v5);
      *(_BYTE *)(a1 + 16) = 0;
    }
    v7 = *(_QWORD *)(a1 + 56);
    if (v7 && v7 != 0xFFFFFFFFFFFFLL)
      sub_21988C4AC(*(_DWORD *)(a1 + 1368), v7);
    v8 = *(void (**)(_QWORD, uint64_t, uint64_t))(a1 + 80);
    if (v8)
    {
      v8(*(_QWORD *)(a1 + 88), a3, a1 + 768);
      v9 = 0;
      v10 = 0;
      do
      {
        v11 = *((_QWORD *)&unk_253E46700 + 14 * v10 + 8);
        if ((v9 & 1) != 0)
          break;
        v9 = 1;
        v10 = 1;
      }
      while (v11 != a1);
      if (v11 == a1 && !*(_QWORD *)(a1 + 264))
        *(_QWORD *)(a1 + 80) = 0;
    }
  }
  else
  {
    sub_219850628(4, 0, 6u, 1u, (uint64_t)"phNciNfc_DnldEseCoreIfTxOnlyComplete:Invalid Dnld Ese Context!!");
  }
  return sub_219850808(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phNciNfc_DnldEseCoreIfTxOnlyComplete");
}

uint64_t sub_219907B18(uint64_t a1, char a2)
{
  uint64_t v4;

  sub_219850718(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_UpdateCredits");
  v4 = *(_QWORD *)(a1 + 1376);
  if (v4)
  {
    *(_BYTE *)(a1 + 29) += a2;
    if (*(_BYTE *)(a1 + 17) == 1)
    {
      sub_21988C4AC(*(_DWORD *)(a1 + 1368), *(_QWORD *)(a1 + 56));
      *(_BYTE *)(a1 + 17) = 0;
      *(_DWORD *)(v4 + 5956) = 5;
      sub_21987D1CC(v4, 11, 0);
    }
  }
  return sub_219850808(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_UpdateCredits");
}

uint64_t sub_219907BBC(unsigned int *a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;

  sub_219850718(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_HciDeleteList");
  if (a1)
  {
    v4 = a2;
    v5 = (uint64_t)&a1[a2 + 38];
    *(_DWORD *)(v5 + 80) = 0;
    v6 = (_DWORD *)(v5 + 80);
    v7 = *(_QWORD *)&a1[2 * a2 + 38];
    if (v7)
    {
      for (i = *(_QWORD *)(v7 + 296); i; i = *(_QWORD *)(v9 + 296))
      {
        v9 = i;
        phOsalNfc_FreeMemory();
      }
      phOsalNfc_FreeMemory();
      *(_QWORD *)&a1[2 * v4 + 38] = 0;
      *((_WORD *)a1 + v4 + 108) = 1;
    }
    else
    {
      sub_219850628(1, a1 + 342, 6u, 4u, (uint64_t)"phDnldEseNfc_HciDeleteList:List is empty");
      *((_WORD *)a1 + a2 + 108) = 1;
    }
    *v6 = 0;
  }
  else
  {
    sub_219850628(4, 0, 6u, 1u, (uint64_t)"phDnldEseNfc_HciDeleteList:Invalid Dnld Ese Core context!");
  }
  return sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_HciDeleteList");
}

uint64_t sub_219907CD0(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  void (*v7)(_QWORD, _QWORD, _QWORD, _QWORD *, uint64_t);
  unsigned __int8 *v8;
  unsigned int v9;
  int v10;
  unsigned int *v11;
  const char *v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v18;
  _OWORD v19[2];
  uint64_t v20;

  v20 = 0;
  memset(v19, 0, sizeof(v19));
  v18 = -1;
  sub_219850718(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts");
  if (a2)
  {
    v4 = a1[172];
    if (!v4)
      goto LABEL_39;
    v5 = *(unsigned __int8 *)(a2 + 1);
    if (v5 != 2)
    {
      if (v5 == 17)
      {
        sub_219850628(1, (unsigned int *)a1 + 342, 6u, 4u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts:EVENT_WTX_REQ received");
        v7 = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD *, uint64_t))a1[83];
        if (!v7)
        {
          sub_219850628(1, (unsigned int *)a1 + 342, 6u, 4u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts:WTX Call Back not defined by App");
          goto LABEL_39;
        }
        v8 = *(unsigned __int8 **)(a2 + 8);
        if (v8)
        {
          v9 = sub_2198DE080(*((_DWORD *)a1 + 342), *v8);
          if (v9 <= 0x7CF)
            v10 = v9 + 400;
          else
            v10 = v9;
          v7 = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD *, uint64_t))a1[83];
        }
        else
        {
          v10 = 2000;
        }
        *((_DWORD *)a1 + 24) = v10;
        *((_DWORD *)a1 + 8) = v10;
        v7(*a1, a1[84], a1[1], a1 + 12, 74);
        v13 = a1[6];
        if (v13 == 0xFFFFFFFFFFFFLL)
          goto LABEL_39;
        sub_21988C4AC(*((_DWORD *)a1 + 342), v13);
        *((_BYTE *)a1 + 16) = 0;
        a2 = phOsalNfc_Timer_Start();
        if (!(_DWORD)a2)
        {
          *((_BYTE *)a1 + 16) = 1;
          goto LABEL_40;
        }
        v12 = "phDnldEseNfc_ProcessApduPipeEvts : Response Timer Start failed!!!";
        v11 = (unsigned int *)(a1 + 171);
      }
      else
      {
        if (v5 != 16)
          goto LABEL_39;
        if (a1[8])
        {
          v6 = *((_DWORD *)a1 + 18);
          if (v6)
          {
            if (v6 < *(unsigned __int16 *)(a2 + 16))
            {
              sub_219850628(1, (unsigned int *)a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts:Could not copy entire received data");
              a2 = 8;
              goto LABEL_40;
            }
            phOsalNfc_MemCopy();
            *((_DWORD *)a1 + 18) = *(unsigned __int16 *)(a2 + 16);
            *(_DWORD *)(v4 + 5956) = 5;
            sub_21987D1CC(v4, 8, a2);
            v14 = 0;
            v15 = 0;
            do
            {
              v16 = *((_QWORD *)&unk_253E46700 + 14 * v15 + 4);
              if ((v14 & 1) != 0)
                break;
              v14 = 1;
              v15 = 1;
            }
            while (v16 != v4);
            if (v16 == v4 && !*(_BYTE *)(v4 + 5952) && !sub_21988F8B8(*(_QWORD *)(v4 + 6480)))
              sub_219907214((unsigned int *)v4);
LABEL_39:
            a2 = 0;
            goto LABEL_40;
          }
        }
        v11 = (unsigned int *)(a1 + 171);
        v12 = "phDnldEseNfc_ProcessApduPipeEvts:Invalid User response buffer or length";
        a2 = 1;
      }
      sub_219850628(1, v11, 6u, 1u, (uint64_t)v12);
      goto LABEL_40;
    }
    if (sub_219908188((uint64_t)a1, *((_DWORD *)a1 + 197), &v18))
    {
      a2 = 1;
      goto LABEL_40;
    }
    if (a1[81] && v18 == *(_BYTE *)a2)
    {
      sub_219886108(*a1, 217);
      sub_21988C4AC(*((_DWORD *)a1 + 342), a1[6]);
      *((_BYTE *)a1 + 16) = 0;
      sub_21988C4AC(*((_DWORD *)a1 + 342), a1[7]);
      *((_BYTE *)a1 + 17) = 0;
      *(_BYTE *)(v4 + 5940) = 0;
      *(_DWORD *)(v4 + 5932) = 0;
      sub_219850628(1, (unsigned int *)a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts: OS Reset Event received");
      phDnldEseNfc_ProcOsResetNtf((unsigned int *)a1, 217, 0);
    }
    else if (a1[85])
    {
      phOsalNfc_SetMemory();
      LODWORD(v19[0]) = sub_21988E8F0(*((_DWORD *)a1 + 342), *(unsigned __int8 *)a2);
      ((void (*)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, uint64_t))a1[85])(*a1, a1[86], 27, a1[1], v19, 217);
    }
    else
    {
      sub_219851888(1, (unsigned int *)a1 + 342, 6u, 2u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts: Ignoring SE OS Reset, PipeID");
    }
    goto LABEL_39;
  }
LABEL_40:
  sub_219850808(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ProcessApduPipeEvts");
  return a2;
}

uint64_t sub_219908064(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;

  sub_219850718(4, (unsigned int *)a2, 6u, 5u, (uint64_t)"phDnldEseNfc_RspTimeOutCb");
  if (a2)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 8);
      if ((v4 & 1) != 0)
        break;
      v4 = 1;
      v5 = 1;
    }
    while (v6 != a2);
    if (v6 == a2)
    {
      v8 = *(_QWORD *)(a2 + 1376);
      if (v8)
      {
        if (*(_QWORD *)(a2 + 48) == a1)
        {
          sub_21988C4AC(*(_DWORD *)(a2 + 1368), a1);
          *(_BYTE *)(a2 + 16) = 0;
          *(_DWORD *)(v8 + 5956) = 5;
          sub_21987D1CC(v8, 10, 0);
          v9 = 0;
          v10 = 0;
          do
          {
            v11 = *((_QWORD *)&unk_253E46700 + 14 * v10 + 4);
            if ((v9 & 1) != 0)
              break;
            v9 = 1;
            v10 = 1;
          }
          while (v11 != v8);
          if (v11 == v8 && !*(_BYTE *)(v8 + 5952) && !sub_21988F8B8(*(_QWORD *)(v8 + 6480)))
            sub_219907214((unsigned int *)v8);
        }
      }
    }
  }
  return sub_219850808(4, (unsigned int *)a2, 6u, 5u, (uint64_t)"phDnldEseNfc_RspTimeOutCb");
}

uint64_t sub_219908188(uint64_t a1, int a2, _BYTE *a3)
{
  uint64_t v6;
  char v7;

  sub_219850718(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_MultiOSGetPipeId");
  if (a3)
  {
    switch(a2)
    {
      case 0:
        v6 = 0;
        v7 = *(_BYTE *)(a1 + 136);
        goto LABEL_9;
      case 1:
        v6 = 0;
        v7 = *(_BYTE *)(a1 + 140);
        goto LABEL_9;
      case 2:
        v6 = 0;
        v7 = *(_BYTE *)(a1 + 144);
        goto LABEL_9;
      case 3:
        v6 = 0;
        v7 = *(_BYTE *)(a1 + 148);
LABEL_9:
        *a3 = v7;
        break;
      default:
        *a3 = -1;
        v6 = 1;
        break;
    }
  }
  else
  {
    v6 = 1;
    sub_219850628(4, (unsigned int *)a1, 6u, 1u, (uint64_t)"phDnldEseNfc_MultiOSGetPipeId:Invalid Context or PipeId");
  }
  sub_219850808(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_MultiOSGetPipeId");
  return v6;
}

uint64_t sub_21990827C(unsigned int *a1, unsigned __int8 *a2)
{
  unsigned int v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t v7;
  int v8;
  _BYTE *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void (*v13)(_QWORD, _QWORD, uint64_t, _QWORD, __int128 *, _QWORD);
  unsigned int v14;
  unsigned __int8 v15;
  void (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, __int128 *, _QWORD);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned __int8 v20;
  const char *v22;
  unsigned __int8 v23;
  int v24;
  void (*v25)(_QWORD, _QWORD, uint64_t, _QWORD, __int128 *, uint64_t);
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = 0;
  v26 = 0u;
  v27 = 0u;
  sub_219850718(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts");
  if (!a2 || !*((_QWORD *)a2 + 1))
    goto LABEL_40;
  LODWORD(v28) = sub_21988E8F0(a1[342], *a2);
  v4 = a2[1];
  if (v4 <= 0x12)
  {
    if (v4 != 16)
    {
      if (v4 == 18)
      {
        v5 = (unsigned __int8 *)*((_QWORD *)a2 + 1);
        if (*v5 != 129)
        {
          sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Failed, error in packet");
          v14 = 0;
          v15 = 0;
          v7 = 255;
          goto LABEL_51;
        }
        v6 = v5[1];
        DWORD2(v26) = v6;
        *(_QWORD *)&v26 = v5 + 2;
        if ((v6 - 17) > 0xF3u)
        {
          v7 = 0;
        }
        else
        {
          sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Failed AID Length Evaluation");
          v5 = (unsigned __int8 *)*((_QWORD *)a2 + 1);
          v7 = 255;
        }
        if (v5[(v6 + 2)] != 130)
        {
          sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Failed, PARAMETER Field is not available");
          v14 = 0;
          v7 = 255;
          v15 = v6 + 2;
          goto LABEL_51;
        }
        v20 = v6 + 3;
        v14 = v5[(v6 + 3)];
        if ((char)v5[(v6 + 3)] < 0)
        {
          if (v14 != 130)
          {
            if (v14 == 129)
            {
              v20 = v6 + 4;
              if ((char)v5[(v6 + 4)] < 0)
              {
                v14 = v5[(v6 + 4)];
                v15 = v6 + 5;
                goto LABEL_32;
              }
              v22 = "phDnldEseNfc_ProcessConnPipeEvts:Failed Parsing BER TLV One BYTE";
            }
            else
            {
              v22 = "phDnldEseNfc_ProcessConnPipeEvts:Failed Parsing BER TLV";
            }
            sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)v22);
            v14 = 0;
            v7 = 255;
            v15 = v20;
            goto LABEL_50;
          }
          v23 = v6 + 5;
          v24 = v5[(v6 + 4)];
          v15 = v6 + 6;
          v14 = v5[v23] | (v24 << 8);
          if (v14 < 0x100)
          {
            sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Failed Parsing BER TLV Two BYTE");
            v14 = 0;
            v7 = 255;
            goto LABEL_50;
          }
        }
        else
        {
          v15 = v6 + 4;
        }
LABEL_32:
        DWORD2(v27) = v14;
LABEL_50:
        *(_QWORD *)&v27 = *((_QWORD *)a2 + 1) + v15;
LABEL_51:
        if (v14 + v15 != *((unsigned __int16 *)a2 + 8))
        {
          DWORD2(v27) = 0;
          DWORD2(v26) = 0;
          sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Failed,BER TLV parsing, Length Mismatch");
          v7 = 255;
        }
        v25 = (void (*)(_QWORD, _QWORD, uint64_t, _QWORD, __int128 *, uint64_t))*((_QWORD *)a1 + 85);
        if (v25)
        {
          v25(*(_QWORD *)a1, *((_QWORD *)a1 + 86), 2, *((_QWORD *)a1 + 1), &v26, v7);
          goto LABEL_41;
        }
LABEL_55:
        sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Se notification callback is NULL");
        v7 = 255;
        goto LABEL_41;
      }
      goto LABEL_20;
    }
    v11 = *((unsigned __int16 *)a2 + 8);
    if (*((_WORD *)a2 + 8))
      v12 = *((_QWORD *)a2 + 1);
    else
      v12 = 0;
    *(_QWORD *)&v27 = v12;
    DWORD2(v27) = v11;
    DWORD2(v26) = 0;
    *(_QWORD *)&v26 = 0;
    v16 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, __int128 *, _QWORD))*((_QWORD *)a1 + 85);
    if (!v16)
      goto LABEL_55;
    v17 = *((_QWORD *)a1 + 86);
    v18 = *(_QWORD *)a1;
    v19 = *((_QWORD *)a1 + 1);
    v10 = 3;
    goto LABEL_39;
  }
  if (v4 != 19)
  {
    if (v4 != 32)
    {
LABEL_20:
      sub_219851888(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts: Unknown HCI Event, Dropped Ins");
LABEL_40:
      v7 = 0;
      goto LABEL_41;
    }
    v8 = *((unsigned __int16 *)a2 + 8);
    if (*((_WORD *)a2 + 8) && (v9 = (_BYTE *)*((_QWORD *)a2 + 1)) != 0)
    {
      if (*v9 == 1)
      {
        v10 = 23;
      }
      else if (*v9)
      {
        sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:SE restricted mode Unknown Event\n");
        v9 = (_BYTE *)*((_QWORD *)a2 + 1);
        v8 = *((unsigned __int16 *)a2 + 8);
        v10 = 255;
      }
      else
      {
        LODWORD(v28) = 255;
        v10 = 4;
      }
      *(_QWORD *)&v27 = v9;
      DWORD2(v27) = v8;
      DWORD2(v26) = 0;
      *(_QWORD *)&v26 = 0;
    }
    else
    {
      *(_QWORD *)&v26 = 0;
      DWORD2(v26) = 0;
      *(_QWORD *)&v27 = 0;
      v10 = 4;
      LODWORD(v28) = 255;
      DWORD2(v27) = 0;
    }
    v16 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, __int128 *, _QWORD))*((_QWORD *)a1 + 85);
    if (!v16)
      goto LABEL_55;
    v17 = *((_QWORD *)a1 + 86);
    v18 = *(_QWORD *)a1;
    v19 = *((_QWORD *)a1 + 1);
LABEL_39:
    v16(v18, v17, v10, v19, &v26, 0);
    goto LABEL_40;
  }
  *(_QWORD *)&v26 = 0;
  DWORD2(v26) = 0;
  *(_QWORD *)&v27 = 0;
  DWORD2(v27) = 0;
  v13 = (void (*)(_QWORD, _QWORD, uint64_t, _QWORD, __int128 *, _QWORD))*((_QWORD *)a1 + 85);
  if (v13)
  {
    v13(*(_QWORD *)a1, *((_QWORD *)a1 + 86), 17, *((_QWORD *)a1 + 1), &v26, 0);
    v7 = 0;
  }
  else
  {
    sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts:Se notification callback is NULL");
    v7 = 255;
  }
  sub_219851888(1, a1 + 342, 6u, 4u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts: phLibNfc_eSE_EvtEndOfOperation, Ins");
LABEL_41:
  sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ProcessConnPipeEvts");
  return v7;
}

uint64_t sub_2199086F8(unsigned int *a1, int a2)
{
  int v4;
  uint64_t v5;
  const char *v6;
  void (*v7)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, uint64_t);
  _OWORD v9[2];
  uint64_t v10;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  sub_219850718(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GenErrNtfHandler");
  sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_GenErrNtfHandler:Generic Error Notification received");
  v4 = a2 - 10;
  v5 = a2 | 0x100u;
  switch(v4)
  {
    case 0:
      v6 = "ErrorCode: 0x0A,Message size exceeded maximum size";
      goto LABEL_13;
    case 1:
      v6 = "ErrorCode: 0x0B,SE is not enabled";
      goto LABEL_13;
    case 2:
      v6 = "ErrorCode: 0x0C,Invalid Pipe";
      goto LABEL_13;
    case 3:
      v6 = "ErrorCode: 0x0D,Invalid HCP Packet";
      goto LABEL_13;
    case 4:
      v6 = "ErrorCode: 0x0E,SE cleared all Pipe";
      goto LABEL_13;
    case 5:
      v6 = "ErrorCode: 0x0F,SE connectivity Pipe deleted";
      goto LABEL_13;
    case 6:
      v6 = "ErrorCode: 0x10,SE loopback Pipe deleted";
      goto LABEL_13;
    case 7:
      v6 = "ErrorCode: 0x11,SE Identity Management Pipe deleted";
      goto LABEL_13;
    case 8:
      v6 = "ErrorCode: 0x12,SE APDU Pipe deleted";
      goto LABEL_13;
    case 9:
      v6 = "ErrorCode: 0x13,Temperature Error";
LABEL_13:
      sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)v6);
      break;
    default:
      sub_219851888(1, a1 + 342, 6u, 1u, (uint64_t)"UnknownErrorCode: ");
      v5 = 256;
      break;
  }
  v7 = (void (*)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, uint64_t))*((_QWORD *)a1 + 85);
  if (v7)
    v7(*(_QWORD *)a1, *((_QWORD *)a1 + 86), 26, *((_QWORD *)a1 + 1), v9, v5);
  return sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GenErrNtfHandler");
}

uint64_t sub_219908884(unsigned int *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  _BYTE *v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  const char *v15;
  int v16;
  unsigned int *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned int *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t Memory;
  uint64_t v27;
  unsigned int *v28;
  void (*v29)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, _QWORD);
  unsigned int v30;
  int v31;
  _BOOL4 v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int *v36;
  int *v37;
  unsigned int v38;
  uint64_t v39;
  uint64_t v40;
  unsigned int v41;
  unsigned __int8 v42;
  unsigned int v43;
  uint64_t v44;
  uint64_t v45;
  unsigned int v46;
  int v47;
  unsigned int v48;
  int v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  char v59;
  uint64_t v60;
  _QWORD *v61;
  unsigned int v62;
  int v63;
  unsigned int v64;
  unsigned int *v65;
  _OWORD v66[2];
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  sub_219850718(4, a1, 6u, 5u, (uint64_t)"phDnldNfc_DnldEseValidateRxdPkt");
  if (*(_WORD *)a2
    || (v6 = *(unsigned __int16 *)(a2 + 16), !*(_WORD *)(a2 + 16))
    || (v7 = *(unsigned __int8 **)(a2 + 8)) == 0)
  {
    sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldNfc_DnldEseValidateRxdPkt:Dnld eSE Cmd Request Failed!!");
LABEL_3:
    v4 = 255;
    goto LABEL_4;
  }
  *(_QWORD *)&v66[0] = *(_QWORD *)a1;
  sub_219850718(0, (unsigned int *)v66, 6u, 5u, (uint64_t)"phDnldNfc_DnldEseVldtCrcRcvd");
  if ((v7[(v6 - 1)] | (v7[v6 - 2] << 8)) != sub_219853A48(*(uint64_t *)&v66[0], v7, (unsigned __int16)(v6 - 2)))
  {
    sub_219850628(0, (unsigned int *)v66, 6u, 1u, (uint64_t)"phDnldNfc_DnldEseVldtCrcRcvd:Invalid frame received");
    sub_219851888(0, (unsigned int *)v66, 6u, 1u, (uint64_t)"Received CRC: ");
    sub_219851888(0, (unsigned int *)v66, 6u, 1u, (uint64_t)"Calculated CRC: ");
LABEL_23:
    sub_219850808(0, (unsigned int *)v66, 6u, 5u, (uint64_t)"phDnldNfc_DnldEseVldtCrcRcvd");
    goto LABEL_3;
  }
  if ((v7[1] | ((*v7 & 0x1F) << 8)) != (unsigned __int16)(v6 - 4))
  {
    sub_219850628(0, (unsigned int *)v66, 6u, 1u, (uint64_t)"phDnldNfc_DnldEseVldtCrcRcvd:Invalid frame payload length received");
    goto LABEL_23;
  }
  sub_219850808(0, (unsigned int *)v66, 6u, 5u, (uint64_t)"phDnldNfc_DnldEseVldtCrcRcvd");
  v67 = 0;
  memset(v66, 0, sizeof(v66));
  sub_219850718(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_UpdateRsp");
  v8 = *((_QWORD *)a1 + 172);
  if (!v8 || !*(_QWORD *)(v8 + 6576))
  {
    v15 = "phDnldEseNfc_UpdateRsp:Invalid Context!!";
    v16 = 4;
    v17 = a1;
LABEL_61:
    sub_219850628(v16, v17, 6u, 1u, (uint64_t)v15);
    goto LABEL_62;
  }
  v9 = a1[186];
  if (v9 > 0x25 || ((1 << v9) & 0x3400000001) == 0)
  {
    v17 = a1 + 342;
    v15 = "phDnldEseNfc_UpdateRsp:Unsuccessful Status received!!";
    goto LABEL_60;
  }
  v10 = *(_QWORD *)(a2 + 8);
  if (!v10)
  {
    v17 = a1 + 342;
    v15 = "phDnldEseNfc_UpdateRsp:Invalid TML buffer received!!";
LABEL_60:
    v16 = 1;
    goto LABEL_61;
  }
  LOWORD(v6) = v6 - 5;
  v11 = (_BYTE *)(v8 + 5940);
  v12 = *(unsigned __int8 *)(v10 + 2);
  v13 = v12 >> 5;
  if (!(v12 >> 5))
  {
    v68 = 0;
    v69 = 0;
    v70 = 0;
    sub_219850718(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_HciRecvManager");
    v18 = *(_BYTE *)(v10 + 3);
    sub_219850718(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetPipeIndx");
    v19 = 0;
    v20 = 136;
    while (*((_BYTE *)a1 + v20) != (v18 & 0x7F))
    {
      ++v19;
      v20 += 2;
      if (v19 == 8)
      {
        sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetPipeIndx");
        LOBYTE(v19) = 0;
        goto LABEL_39;
      }
    }
    sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetPipeIndx");
    if (v19 >= 8u)
    {
      v22 = a1 + 342;
      v23 = "phDnldEseNfc_HciRecvManager: Data from unknown Pipe ID";
LABEL_41:
      sub_219850628(1, v22, 6u, 1u, (uint64_t)v23);
      v4 = 255;
LABEL_42:
      sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_HciRecvManager");
      goto LABEL_63;
    }
LABEL_39:
    if ((unsigned __int16)v6 >= 0x11Bu)
    {
      v22 = a1 + 342;
      v23 = "phDnldEseNfc_HciRecvManager: Recvd HCP Pkt > PHDNLDNFC_ESE_HDLL_HCP_MAX_PACKET_SIZE";
      goto LABEL_41;
    }
    sub_219850718(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetNewNode");
    v61 = a1 + 38;
    v24 = *(_QWORD *)&a1[2 * v19 + 38];
    if (v24)
    {
      do
      {
        v25 = v24;
        v24 = *(_QWORD *)(v24 + 296);
      }
      while (v24);
      v65 = a1 + 342;
      Memory = phOsalNfc_GetMemory();
      *(_QWORD *)(v25 + 296) = Memory;
      if (Memory)
      {
        ++*((_WORD *)a1 + v19 + 108);
        phOsalNfc_SetMemory();
        *(_QWORD *)(*(_QWORD *)(v25 + 296) + 296) = 0;
        v27 = *(_QWORD *)(v25 + 296);
        v11 = (_BYTE *)(v8 + 5940);
        a1[v19 + 58] = (unsigned __int16)v6 + a1[v19 + 58] - 1;
        sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetNewNode");
        if (v27)
        {
          v59 = v18;
          v28 = a1 + 342;
          LODWORD(v6) = (unsigned __int16)v6;
LABEL_65:
          v65 = v28;
          phOsalNfc_MemCopy();
          *(_DWORD *)(v27 + 288) = v6;
          v18 = v59;
          goto LABEL_69;
        }
      }
      else
      {
        sub_219850628(1, v65, 6u, 1u, (uint64_t)"phDnldEseNfc_GetNewNode:Memory allcation failed while creating new node!");
        sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetNewNode");
      }
      sub_219850628(1, v65, 6u, 1u, (uint64_t)" phDnldEseNfc_HciRecvManager:Failed To Allocate Memory for Node");
LABEL_69:
      if ((v18 & 0x80) == 0)
      {
        sub_219850628(1, v65, 6u, 4u, (uint64_t)"phDnldEseNfc_HciRecvManager:Buffered Received Chained HCI packets");
        v13 = 0;
        if (*((_QWORD *)a1 + 81) && *((_BYTE *)a1 + 1384) == 1)
        {
          *((_BYTE *)a1 + 1384) = 0;
          v35 = *((_QWORD *)a1 + 6);
          if (v35 == 0xFFFFFFFFFFFFLL)
          {
            sub_219850628(1, v65, 6u, 1u, (uint64_t)"phDnldEseNfc_HciRecvManager: Invalid response timer");
          }
          else
          {
            v51 = a1[196];
            if (v51 <= 0x2710)
              v51 = 10000;
            a1[8] = v51;
            sub_21988C4AC(a1[342], v35);
            *((_BYTE *)a1 + 16) = 0;
            v52 = phOsalNfc_Timer_Start();
            if ((_DWORD)v52)
            {
              v4 = v52;
              sub_219850628(1, v65, 6u, 1u, (uint64_t)"phDnldEseNfc_HciRecvManager : Response Timer Start failed!!!");
              goto LABEL_42;
            }
            *((_BYTE *)a1 + 16) = 1;
            v13 = 0;
          }
        }
        sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_HciRecvManager");
        goto LABEL_107;
      }
      *((_BYTE *)a1 + 1384) = 1;
      v36 = &a1[v19];
      v38 = v36[58];
      v37 = (int *)(v36 + 58);
      if (v38)
      {
        v39 = phOsalNfc_GetMemory();
        if (!v39)
        {
          v23 = "phDnldEseNfc_HciRecvManager:Memory Allocation Failed";
          v22 = v65;
          goto LABEL_41;
        }
      }
      else
      {
        v39 = 0;
      }
      v58 = v37;
      sub_219850718(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ExtractHciData");
      v40 = v61[v19];
      v41 = *((unsigned __int16 *)a1 + v19 + 108);
      v62 = *(_BYTE *)v40 & 0x7F;
      LOBYTE(v68) = *(_BYTE *)v40 & 0x7F;
      v42 = *(_BYTE *)(v40 + 1);
      BYTE2(v68) = v42 >> 6;
      v63 = v42 & 0x3F;
      BYTE1(v68) = v42 & 0x3F;
      v43 = *(_DWORD *)(v40 + 288) - 2;
      phOsalNfc_MemCopy();
      v64 = v41;
      v60 = v39;
      if (v41 >= 2)
      {
        if (v39)
          v44 = v39 + v43;
        else
          v44 = 0;
        v45 = *(_QWORD *)(v40 + 296);
        v46 = 1;
        do
        {
          v47 = *(_DWORD *)(v45 + 288);
          v48 = v47 - 1;
          if (v47 == 1)
          {
            sub_219850628(1, v65, 6u, 1u, (uint64_t)"phDnldEseNfc_ExtractHciData: HCI Core Receive- Zero Payload Len");
          }
          else
          {
            phOsalNfc_MemCopy();
            v45 = *(_QWORD *)(v45 + 296);
            v43 += v48;
            if (!v45)
              break;
            v44 += v48;
          }
          ++v46;
        }
        while (v46 < v64);
      }
      v49 = *v58;
      LOWORD(v70) = *v58;
      v69 = v60;
      if (v43 != v49)
      {
        sub_219850628(1, v65, 6u, 1u, (uint64_t)"phDnldEseNfc_ExtractHciData:HCI Core Receive- Mismatch in Number of Payload Bytes                Processed and Stored");
        sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ExtractHciData");
        v23 = " phDnldEseNfc_HciRecvManager: HCI Packet Extraction Failed";
        v22 = v65;
        goto LABEL_41;
      }
      sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_ExtractHciData");
      sub_219907BBC(a1, v19);
      sub_219851888(1, v65, 6u, 4u, (uint64_t)"Rx HCP:PipeID");
      sub_219851888(1, v65, 6u, 4u, (uint64_t)"Rx HCP:MsgType");
      sub_219851888(1, v65, 6u, 4u, (uint64_t)"Rx HCP:Ins");
      sub_219851FF8(1, v65, 6u, 4u, (uint64_t)"Rx HCP:Data", v60);
      if (v62 <= 0x2D)
      {
        if (((1 << v62) & 0x38002000000) != 0)
        {
          if (v63 == 2 || !a1[186])
          {
            v50 = sub_219907CD0(a1, (uint64_t)&v68);
            goto LABEL_102;
          }
        }
        else if (((1 << v62) & 0x380000400000) != 0)
        {
          v50 = sub_21990827C(a1, (unsigned __int8 *)&v68);
LABEL_102:
          v4 = v50;
LABEL_103:
          phOsalNfc_FreeMemory();
          sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_HciRecvManager");
          v11 = (_BYTE *)(v8 + 5940);
          v13 = 0;
          if (!(_DWORD)v4)
            goto LABEL_107;
          goto LABEL_63;
        }
      }
      sub_219851888(1, v65, 6u, 2u, (uint64_t)"phDnldEseNfc_HciRecvManager: Invalid PipeID/response received, packet dropped PipeID");
      v4 = 0;
      goto LABEL_103;
    }
    v59 = v18;
    v28 = a1 + 342;
    v61[v19] = phOsalNfc_GetMemory();
    phOsalNfc_SetMemory();
    v34 = v61[v19];
    *(_DWORD *)(v34 + 288) = 0;
    *(_QWORD *)(v34 + 296) = 0;
    v27 = v61[v19];
    *(_QWORD *)(v27 + 296) = 0;
    LODWORD(v6) = (unsigned __int16)v6;
    v11 = (_BYTE *)(v8 + 5940);
    a1[v19 + 58] = (unsigned __int16)v6 - 2;
    sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_GetNewNode");
    goto LABEL_65;
  }
  if (v13 != 3)
  {
    if (v13 == 2)
    {
      v14 = a1[194];
      if (v14 && v14 >= (unsigned __int16)v6 && *((_QWORD *)a1 + 96))
      {
        phOsalNfc_MemCopy();
        a1[194] = (unsigned __int16)v6;
LABEL_107:
        a1[10] = 0;
        v53 = phTmlNfc_Read();
        v4 = 0;
        if ((_DWORD)v53 != 13)
        {
          v54 = v53;
          sub_219850628(1, a1 + 342, 6u, 1u, (uint64_t)"phDnldEseNfc_UpdateRsp: dnld packet Read Request Failure");
          sub_219886108(*(_QWORD *)a1, 195);
          v4 = v54;
        }
        if (v13 == 2 && !(_DWORD)v4)
        {
          *(_DWORD *)(v8 + 5956) = 5;
          sub_21987D1CC(v8, 8, a2);
          v55 = 0;
          v56 = 0;
          do
          {
            v57 = *((_QWORD *)&unk_253E46700 + 14 * v56 + 4);
            if ((v55 & 1) != 0)
              break;
            v55 = 1;
            v56 = 1;
          }
          while (v57 != v8);
          if (v57 == v8 && !v11[12] && !sub_21988F8B8(*(_QWORD *)(v8 + 6480)))
            sub_219907214((unsigned int *)v8);
          v4 = 0;
        }
        goto LABEL_63;
      }
      v4 = 1;
LABEL_63:
      sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldEseNfc_UpdateRsp");
      goto LABEL_4;
    }
    v17 = a1 + 342;
    v15 = "phDnldEseNfc_UpdateRsp:Unknown Resp passed, while receive!!";
    goto LABEL_60;
  }
  v21 = v12 & 0x1F;
  if (v21 == 3)
  {
    sub_2199086F8(a1, *(unsigned __int8 *)(v10 + 3));
LABEL_62:
    v4 = 255;
    goto LABEL_63;
  }
  if (v21 != 2)
  {
    if (!v21)
    {
      sub_219907B18((uint64_t)a1, *(_BYTE *)(v10 + 3));
      goto LABEL_107;
    }
    v17 = a1 + 342;
    v15 = "phDnldEseNfc_UpdateRsp:Invalid opcode notification received!!";
    goto LABEL_60;
  }
  sub_21988C4AC(a1[342], *((_QWORD *)a1 + 6));
  *((_BYTE *)a1 + 16) = 0;
  sub_21988C4AC(a1[342], *((_QWORD *)a1 + 7));
  *((_BYTE *)a1 + 17) = 0;
  *v11 = 0;
  *(_DWORD *)(v8 + 5932) = 0;
  sub_219850628(1, a1 + 342, 6u, 2u, (uint64_t)"phDnldEseNfc_UpdateRsp:eSE Removed Notification");
  sub_219886108(*(_QWORD *)a1, 214);
  v29 = (void (*)(_QWORD, _QWORD, uint64_t, _QWORD, _OWORD *, _QWORD))*((_QWORD *)a1 + 85);
  if (v29)
  {
    v30 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 8) + 3);
    v31 = 255;
    if (v30 < 0x10 || (v30 & 0xB0) == 0x20 || (v30 >> 4) - 6 >= 0xFFFFFFFE)
    {
      v32 = v30 > 0xF;
      v33 = (v30 & 0xF) - 13 < 0xFFFFFFF4;
      v31 = v32 && v33 ? 255 : *(unsigned __int8 *)(*(_QWORD *)(a2 + 8) + 3);
      if (!v32 || !v33)
        LOBYTE(v30) = 0;
    }
    LODWORD(v66[0]) = v31;
    BYTE4(v66[0]) = v30;
    v29(*(_QWORD *)a1, *((_QWORD *)a1 + 86), 16, *((_QWORD *)a1 + 1), v66, 0);
    v4 = 214;
    sub_219875710((uint64_t)a1, 214, a2);
  }
  else
  {
    sub_219850628(1, a1 + 342, 6u, 2u, (uint64_t)"phDnldEseNfc_UpdateRsp: Dropping SE Removed Notification as no callback registered");
    v4 = 214;
  }
LABEL_4:
  sub_219850808(4, a1, 6u, 5u, (uint64_t)"phDnldNfc_DnldEseValidateRxdPkt");
  return v4;
}

uint64_t sub_2199094F8(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int16 v12;
  char v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  int v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  int v24;

  sub_219850718(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
  if (!a1)
    return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
  v4 = 0;
  v5 = 0;
  do
  {
    v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 12);
    if ((v4 & 1) != 0)
      break;
    v4 = 1;
    v5 = 1;
  }
  while (v6 != a1);
  if (v6 != a1)
    return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
  v8 = *(_QWORD *)(a1 + 8496);
  if (!v8)
    return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
  if (!a2)
    return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
  v9 = *(_QWORD *)(v8 + 6584);
  if (!v9 || *(_WORD *)a2)
    return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
  v10 = *(_QWORD *)(a2 + 8);
  if (*(_WORD *)(a1 + 8438) || v10 != a1 + 4288 + *(unsigned __int16 *)(a1 + 8438))
  {
    v11 = *(unsigned __int16 *)(v9 + 42);
    if (v10 != v9 + v11 + 1075)
      return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
  }
  else
  {
    phOsalNfc_MemCopy();
    LOWORD(v11) = *(_WORD *)(v9 + 42);
  }
  v12 = *(_WORD *)(a2 + 16) + v11;
  *(_WORD *)(v9 + 42) = v12;
  if (v12 <= 1u)
  {
    *(_WORD *)(v9 + 40) = 2 - v12;
    if (phTmlNfc_Read() != 13)
      sub_219886108(*(_QWORD *)v9, 195);
    return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
  }
  v13 = *(_BYTE *)(v9 + 1075);
  v14 = *(unsigned __int8 *)(v9 + 1076) | ((v13 & 0x1F) << 8);
  v15 = v14 + 4;
  *(_WORD *)(v9 + 40) = (*(unsigned __int8 *)(v9 + 1076) | ((v13 & 0x1F) << 8)) + 4;
  if (v14 > 0x120)
  {
    sub_219850628(1, (unsigned int *)(v9 + 1368), 6u, 1u, (uint64_t)"phDnldNfc_RecvDnldEsePkt: Invalid length; Received size greater than maximum download frame size!!");
    goto LABEL_25;
  }
  if (v15 == v12)
  {
    *(_QWORD *)(a2 + 8) = v9 + 1075;
    *(_WORD *)(a2 + 16) = v12;
    *(_WORD *)(v9 + 40) = 0;
    v16 = sub_219908884((unsigned int *)v9, a2);
    if (!v16)
      return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
LABEL_21:
    if (v16 == 13)
      return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
    if (v16 != 255)
    {
      v17 = 0;
LABEL_26:
      v18 = 0;
      v19 = 0;
      do
      {
        v20 = *((_QWORD *)&unk_253E46700 + 14 * v19 + 8);
        if ((v18 & 1) != 0)
          break;
        v18 = 1;
        v19 = 1;
      }
      while (v20 != v9);
      if (v20 == v9 && *(_QWORD *)v9)
      {
        phTmlNfc_ReadAbort();
        if (v17)
          phTmlNfc_FlushTxRxBuffers();
        *(_DWORD *)(v9 + 40) = 0;
        if (phTmlNfc_Read() != 13)
        {
          sub_219850628(1, (unsigned int *)(a1 + 8492), 6u, 1u, (uint64_t)"phDnldNfc_RecvDnldEsePkt: Read Request Failure");
          sub_219886108(*(_QWORD *)(a1 + 48), 195);
        }
        *(_WORD *)a2 = v16;
        *(_DWORD *)(v8 + 5956) = 5;
        sub_21987D1CC(v8, 9, a2);
        v21 = 0;
        v22 = 0;
        do
        {
          v23 = *((_QWORD *)&unk_253E46700 + 14 * v22 + 4);
          if ((v21 & 1) != 0)
            break;
          v21 = 1;
          v22 = 1;
        }
        while (v23 != v8);
        if (v23 == v8 && !*(_BYTE *)(v8 + 5952) && !sub_21988F8B8(*(_QWORD *)(v8 + 6480)))
          sub_219907214((unsigned int *)v8);
      }
      return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
    }
LABEL_25:
    v17 = 1;
    sub_219851FF8(1, (unsigned int *)(a1 + 8492), 6u, 2u, (uint64_t)"phDnldNfc_RecvDnldEsePkt:corrutped packet rxd and dropped", *(_QWORD *)(a2 + 8));
    LOWORD(v16) = 255;
    goto LABEL_26;
  }
  if (v15 <= v12)
  {
    sub_219850628(1, (unsigned int *)(v9 + 1368), 6u, 1u, (uint64_t)"phDnldNfc_RecvDnldEsePkt:Critical failure in Download Ese mode!!");
    return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
  }
  *(_WORD *)(v9 + 40) = v15 - v12;
  v24 = phTmlNfc_Read();
  if (v24 != 13)
  {
    v16 = v24;
    sub_219886108(*(_QWORD *)v9, 195);
    if (v16)
      goto LABEL_21;
  }
  return sub_219850808(3, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_RecvDnldEsePkt");
}

uint64_t sub_21990989C(uint64_t a1, uint64_t a2)
{
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  sub_219850718(4, (unsigned int *)a2, 6u, 5u, (uint64_t)"phDnldEseNfc_CrdtTimeOutCb");
  if (a2)
  {
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *((_QWORD *)&unk_253E46700 + 14 * v5 + 8);
      if ((v4 & 1) != 0)
        break;
      v4 = 1;
      v5 = 1;
    }
    while (v6 != a2);
    v7 = v6 == a2 ? *(_QWORD *)(a2 + 1376) : 0;
    if (*(_QWORD *)(a2 + 56) == a1)
    {
      sub_21988C4AC(*(_DWORD *)(a2 + 1368), a1);
      *(_BYTE *)(a2 + 17) = 0;
      if (v7)
      {
        *(_DWORD *)(v7 + 5956) = 5;
        if (*(_BYTE *)(a2 + 29))
        {
          sub_21987D1CC(v7, 11, 0);
        }
        else
        {
          sub_21987D1CC(v7, 12, 0);
          v8 = 0;
          v9 = 0;
          do
          {
            v10 = *((_QWORD *)&unk_253E46700 + 14 * v9 + 4);
            if ((v8 & 1) != 0)
              break;
            v8 = 1;
            v9 = 1;
          }
          while (v10 != v7);
          if (v10 == v7 && !*(_BYTE *)(v7 + 5952) && !sub_21988F8B8(*(_QWORD *)(v7 + 6480)))
            sub_219907214((unsigned int *)v7);
        }
      }
    }
  }
  return sub_219850808(4, (unsigned int *)a2, 6u, 5u, (uint64_t)"phDnldEseNfc_CrdtTimeOutCb");
}

uint64_t sub_2199099E0(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  int v8;
  unsigned int *v9;
  unsigned int *v11;
  int v12;
  const char *v13;
  int v14;
  unsigned __int16 v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  __int128 v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  __int128 v23;
  uint64_t v24;
  char v25;
  int v26;
  __int128 v27;
  __int128 v28;
  __int16 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;

  sub_219850718(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phDnldNfc_BuildDnldEsePkt");
  if (!a1 || ((v4 = *(_QWORD *)(a1 + 6576), (v5 = *(_QWORD *)(a1 + 6584)) != 0) ? (v6 = v4 == 0) : (v6 = 1), v6))
  {
    v7 = 1;
    v8 = 2;
    v9 = (unsigned int *)a1;
    goto LABEL_8;
  }
  v11 = (unsigned int *)(v5 + 1368);
  phOsalNfc_SetMemory();
  *(_WORD *)(v5 + 382) = 0;
  if (!a2[4] || !*((_QWORD *)a2 + 1))
  {
    v12 = *a2;
    if (*a2 == 37)
      goto LABEL_18;
    v7 = 1;
    v8 = 1;
    v9 = v11;
LABEL_8:
    sub_219850628(v8, v9, 6u, 1u, (uint64_t)"phDnldNfc_BuildDnldEsePkt:Invalid Input Parameter!!");
    goto LABEL_9;
  }
  v12 = *a2;
  if ((*a2 - 36) < 2)
  {
LABEL_18:
    *(_BYTE *)(v5 + 386) = v12;
    if (*a2 != 37)
      phOsalNfc_MemCopy();
    v14 = a2[4];
    *(_BYTE *)(v5 + 385) = v14 + 1;
    *(_BYTE *)(v5 + 384) = ((unsigned __int16)(v14 + 1) >> 8) & 0x1F | 0x80;
    v15 = v14 + 3;
LABEL_21:
    *(_WORD *)(v5 + 382) = v15;
    v16 = sub_219853A48(*(_QWORD *)v5, (unsigned __int8 *)(v5 + 384), v15);
    v17 = *(unsigned __int16 *)(v5 + 382);
    *(_WORD *)(v5 + v17 + 384) = __rev16(v16);
    *(_WORD *)(v5 + 382) = v17 + 2;
    sub_219850628(1, (unsigned int *)(v5 + 1368), 6u, 4u, (uint64_t)"phDnldNfc_BuildDnldEsePkt: Frame created successfully");
    v7 = 0;
    goto LABEL_9;
  }
  if (v12)
  {
    if (v12 != 34)
    {
      v13 = "phDnldNfc_BuildDnldEsePkt:Invalid Input Parameter!!";
LABEL_16:
      sub_219850628(1, v11, 6u, 1u, (uint64_t)v13);
      v7 = 255;
      goto LABEL_9;
    }
    goto LABEL_18;
  }
  if (*(_BYTE *)(v5 + 29))
  {
    *(_BYTE *)(v5 + 386) = 0;
    *(_WORD *)(v5 + 382) = 1;
    if (*(_BYTE *)(v5 + 380))
    {
      v18 = *(_DWORD *)(v5 + 376);
      if (v18 <= 0xFE)
      {
        v19 = *((_OWORD *)a2 + 1);
        v31 = *(_OWORD *)a2;
        v32 = v19;
        v33 = *((_OWORD *)a2 + 2);
        v20 = sub_219909D8C(v5, (uint64_t)&v31, v18, 1, 1);
        *(_BYTE *)(v5 + 380) = 0;
LABEL_37:
        if (v20)
        {
          v7 = 1;
          goto LABEL_9;
        }
        v29 = *(_WORD *)(v5 + 382);
        *(_BYTE *)(v5 + 385) = v29;
        *(_BYTE *)(v5 + 384) = HIBYTE(v29) & 0x1F | 0x80;
        v15 = v29 + 2;
        goto LABEL_21;
      }
      v27 = *((_OWORD *)a2 + 1);
      v31 = *(_OWORD *)a2;
      v32 = v27;
      v33 = *((_OWORD *)a2 + 2);
      v24 = v5;
      v22 = 254;
      v25 = 0;
      v26 = 1;
    }
    else
    {
      v22 = a2[4];
      *(_DWORD *)(v5 + 376) = v22;
      if (v22 > 0xFD)
      {
        v28 = *((_OWORD *)a2 + 1);
        v31 = *(_OWORD *)a2;
        v32 = v28;
        v33 = *((_OWORD *)a2 + 2);
        v20 = sub_219909D8C(v5, (uint64_t)&v31, 253, 0, 0);
        *(_BYTE *)(v5 + 380) = 1;
        goto LABEL_37;
      }
      v23 = *((_OWORD *)a2 + 1);
      v31 = *(_OWORD *)a2;
      v32 = v23;
      v33 = *((_OWORD *)a2 + 2);
      v24 = v5;
      v25 = 1;
      v26 = 0;
    }
    v20 = sub_219909D8C(v24, (uint64_t)&v31, v22, v25, v26);
    goto LABEL_37;
  }
  v21 = *(_QWORD *)(v5 + 56);
  if (!v21 || v21 == 0xFFFFFFFFFFFFLL)
  {
    v13 = "phDnldNfc_BuildDnldEsePkt : Invalid Download Ese CreditTimer ID";
    goto LABEL_16;
  }
  *(_DWORD *)(v5 + 36) = 250;
  *(_BYTE *)(v5 + 17) = 1;
  sub_21988C4AC(*(_DWORD *)(v5 + 1368), v21);
  if (phOsalNfc_Timer_Start())
  {
    sub_219850628(1, (unsigned int *)(v5 + 1368), 6u, 1u, (uint64_t)"phDnldNfc_BuildDnldEsePkt : Credit Timer Start failed!!!");
    v7 = 255;
  }
  else
  {
    v7 = 13;
  }
  v30 = *(_QWORD *)(v4 + 64);
  if (v30 && v30 != 0xFFFFFFFFFFFFLL && !*(_BYTE *)(v4 + 80))
  {
    if (!phOsalNfc_Timer_Start())
    {
      *(_BYTE *)(v4 + 80) = 1;
      goto LABEL_9;
    }
    v13 = "phNciCoreMuxNfc_eMuxEvtDnldTxCb : Failed to create start timer";
    goto LABEL_16;
  }
LABEL_9:
  sub_219850808(2, (unsigned int *)a1, 3u, 5u, (uint64_t)"phDnldNfc_BuildDnldEsePkt");
  return v7;
}

uint64_t sub_219909D8C(uint64_t a1, uint64_t a2, int a3, char a4, int a5)
{
  uint64_t v9;
  __int16 v10;
  __int16 v11;
  unsigned __int8 v13;

  v13 = -1;
  sub_219850718(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_BuildDnldEseHciPkt");
  if (a3)
  {
    phOsalNfc_SetMemory();
    v9 = sub_219908188(a1, *(_DWORD *)(a1 + 788), &v13);
    if ((_DWORD)v9 || v13 == 255)
    {
      sub_219850628(4, (unsigned int *)a1, 6u, 1u, (uint64_t)"phDnldNfc_BuildDnldEseHciPkt:Invalid PipeId");
    }
    else
    {
      *(_BYTE *)(a1 + 792) = v13 | (a4 << 7);
      if (a5)
      {
        phOsalNfc_MemCopy();
        v10 = 1;
      }
      else
      {
        *(_BYTE *)(a1 + 793) = 80;
        phOsalNfc_MemCopy();
        v10 = 2;
      }
      v11 = v10 + a3;
      phOsalNfc_MemCopy();
      v9 = 0;
      *(_DWORD *)(a1 + 376) -= a3;
      *(_WORD *)(a1 + 382) += v11;
    }
  }
  else
  {
    v9 = 1;
  }
  sub_219850808(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldNfc_BuildDnldEseHciPkt");
  return v9;
}

uint64_t sub_219909F14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_219850718(4, (unsigned int *)a1, 6u, 5u, (uint64_t)"phDnldEseNfc_CoreDeInit");
  if (a1)
  {
    sub_21987FEF8(*(unsigned int **)(a1 + 1376));
    v2 = *(_QWORD *)(a1 + 48);
    if (v2 && v2 != 0xFFFFFFFFFFFFLL)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(_QWORD *)(a1 + 48) = 0xFFFFFFFFFFFFLL;
    }
    v3 = *(_QWORD *)(a1 + 56);
    if (v3 && v3 != 0xFFFFFFFFFFFFLL)
    {
      phOsalNfc_Timer_Stop();
      phOsalNfc_Timer_Delete();
      *(_QWORD *)(a1 + 56) = 0xFFFFFFFFFFFFLL;
    }
    sub_21987CAA0(*(_DWORD *)(a1 + 1368));
    v4 = 0;
  }
  else
  {
    v4 = 1;
  }
  sub_219850808(4, 0, 6u, 5u, (uint64_t)"phDnldEseNfc_CoreDeInit");
  return v4;
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x24BDAEEB0](__b, __pattern16, __len);
}

uint64_t phOsalNfc_CloseLogFile()
{
  return MEMORY[0x24BED88D8]();
}

uint64_t phOsalNfc_DeInit()
{
  return MEMORY[0x24BED88E0]();
}

uint64_t phOsalNfc_Delay()
{
  return MEMORY[0x24BED88E8]();
}

uint64_t phOsalNfc_FreeLibrary()
{
  return MEMORY[0x24BED88F0]();
}

uint64_t phOsalNfc_FreeMemory()
{
  return MEMORY[0x24BED88F8]();
}

uint64_t phOsalNfc_GetMemory()
{
  return MEMORY[0x24BED8900]();
}

uint64_t phOsalNfc_Init()
{
  return MEMORY[0x24BED8908]();
}

uint64_t phOsalNfc_LoadLibrary()
{
  return MEMORY[0x24BED8910]();
}

uint64_t phOsalNfc_LogFunc()
{
  return MEMORY[0x24BED8918]();
}

uint64_t phOsalNfc_LogHexData()
{
  return MEMORY[0x24BED8920]();
}

uint64_t phOsalNfc_LogStr()
{
  return MEMORY[0x24BED8928]();
}

uint64_t phOsalNfc_LogU32()
{
  return MEMORY[0x24BED8930]();
}

uint64_t phOsalNfc_LogX32()
{
  return MEMORY[0x24BED8938]();
}

uint64_t phOsalNfc_LogX64()
{
  return MEMORY[0x24BED8940]();
}

uint64_t phOsalNfc_MemCompare()
{
  return MEMORY[0x24BED8948]();
}

uint64_t phOsalNfc_MemCopy()
{
  return MEMORY[0x24BED8950]();
}

uint64_t phOsalNfc_OpenLogFile()
{
  return MEMORY[0x24BED8958]();
}

uint64_t phOsalNfc_RaiseException()
{
  return MEMORY[0x24BED8960]();
}

uint64_t phOsalNfc_SetMemory()
{
  return MEMORY[0x24BED8970]();
}

uint64_t phOsalNfc_SignPostLogFunc()
{
  return MEMORY[0x24BED8978]();
}

uint64_t phOsalNfc_SignPostLogHexData()
{
  return MEMORY[0x24BED8980]();
}

uint64_t phOsalNfc_SignPostLogStr()
{
  return MEMORY[0x24BED8988]();
}

uint64_t phOsalNfc_SignPostLogTimerEvents()
{
  return MEMORY[0x24BED8990]();
}

uint64_t phOsalNfc_SignPostLogX32()
{
  return MEMORY[0x24BED8998]();
}

uint64_t phOsalNfc_Timer_Create()
{
  return MEMORY[0x24BED89A0]();
}

uint64_t phOsalNfc_Timer_Delete()
{
  return MEMORY[0x24BED89A8]();
}

uint64_t phOsalNfc_Timer_Start()
{
  return MEMORY[0x24BED89B0]();
}

uint64_t phOsalNfc_Timer_Stop()
{
  return MEMORY[0x24BED89B8]();
}

uint64_t phTmlNfc_ConfigHsuBaudRate()
{
  return MEMORY[0x24BED89C8]();
}

uint64_t phTmlNfc_ConfigureSpmi()
{
  return MEMORY[0x24BED89D0]();
}

uint64_t phTmlNfc_FlushTxRxBuffers()
{
  return MEMORY[0x24BED89D8]();
}

uint64_t phTmlNfc_GetHsuMaxBaudRate()
{
  return MEMORY[0x24BED89E0]();
}

uint64_t phTmlNfc_Init()
{
  return MEMORY[0x24BED89E8]();
}

uint64_t phTmlNfc_IoCtl()
{
  return MEMORY[0x24BED89F0]();
}

uint64_t phTmlNfc_Read()
{
  return MEMORY[0x24BED89F8]();
}

uint64_t phTmlNfc_ReadAbort()
{
  return MEMORY[0x24BED8A00]();
}

uint64_t phTmlNfc_SetGetSpmiDrvConfigRegs()
{
  return MEMORY[0x24BED8A08]();
}

uint64_t phTmlNfc_Shutdown()
{
  return MEMORY[0x24BED8A10]();
}

uint64_t phTmlNfc_SpmiDrvErrorStatus()
{
  return MEMORY[0x24BED8A18]();
}

uint64_t phTmlNfc_Write()
{
  return MEMORY[0x24BED8A20]();
}

uint64_t phTmlNfc_WriteAbort()
{
  return MEMORY[0x24BED8A28]();
}

