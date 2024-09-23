uint64_t PRDblIdx(int a1, int a2)
{
  signed int v2;
  uint64_t result;
  unsigned __int16 v4;
  int v5;
  int v6;
  unsigned int v7;
  BOOL v8;
  unsigned int v9;
  BOOL v10;
  unsigned int v11;
  unsigned int v12;

  v2 = a1 & 0xF0FFFFFF;
  if ((int)(a1 & 0xF0FFFFFF) > -1073741313)
  {
    if (v2 > -1073217537)
    {
      if (v2 <= -536870897)
      {
        switch(v2)
        {
          case -536870911:
            return 15;
          case -536870910:
            v10 = a2 == 6;
            v11 = 23;
            v12 = 17;
            goto LABEL_68;
          case -536870909:
          case -536870907:
          case -536870906:
          case -536870905:
            return 23;
          case -536870908:
          case -536870904:
            return 16;
          default:
            if (v2 == -1073217536)
              goto LABEL_45;
            v5 = -1072693248;
            goto LABEL_44;
        }
      }
      if (v2 == -536870896)
        return 5;
      if (v2 == -536870880)
        return 6;
      if (v2 != -536870848)
        return 23;
    }
    else
    {
      if (v2 > -1073725441)
      {
        if (v2 > -1073676289)
        {
          if (v2 != -1073676288 && v2 != -1073610752)
          {
            v5 = -1073479680;
LABEL_44:
            if (v2 != v5)
              return 23;
          }
LABEL_45:
          v6 = a1 & 0x3000000;
          v7 = 14;
          v8 = (a1 & 0x1000000) == 0;
          v9 = 18;
          goto LABEL_53;
        }
        if (v2 == -1073725440)
          goto LABEL_52;
        v4 = 0x8000;
LABEL_51:
        if (v2 != (v4 | 0xC0000000))
          return 23;
        goto LABEL_52;
      }
      if (v2 > -1073739777)
      {
        if (v2 != -1073739776 && v2 != -1073737728)
        {
          v4 = 0x2000;
          goto LABEL_51;
        }
LABEL_52:
        v6 = a1 & 0x3000000;
        v7 = 13;
        v8 = (a1 & 0x1000000) == 0;
        v9 = 17;
LABEL_53:
        if (v8)
          v9 = 23;
        if (v6 == 0x2000000)
          return v7;
        else
          return v9;
      }
      if (v2 != -1073741312)
      {
        v4 = 1024;
        goto LABEL_51;
      }
    }
    v10 = a2 == 6;
    v11 = 22;
    v12 = 18;
    goto LABEL_68;
  }
  if (v2 > -2147481601)
  {
    if (v2 <= -1073741809)
    {
      switch(v2)
      {
        case -1073741823:
          result = 11;
          break;
        case -1073741822:
          v10 = a2 == 6;
          v11 = 23;
          v12 = 13;
          goto LABEL_68;
        case -1073741820:
        case -1073741816:
          result = 12;
          break;
        default:
          return 23;
      }
      return result;
    }
    if (v2 <= -1073741761)
    {
      if (v2 != -1073741808)
      {
        if (v2 == -1073741792)
          return 20;
        return 23;
      }
      return 19;
    }
    if (v2 != -1073741760 && v2 != -1073741568)
      return 23;
    v10 = a2 == 6;
    v11 = 21;
    v12 = 14;
LABEL_68:
    if (v10)
      return v12;
    else
      return v11;
  }
  if (v2 > -2147483585)
  {
    if (v2 <= -2147483393)
    {
      if (v2 != -2147483584)
      {
        if (v2 == -2147483520)
          return 2;
        return 23;
      }
      return 3;
    }
    else if (v2 == -2147483392)
    {
      return 8;
    }
    else
    {
      if (v2 != -2147483136)
        return 23;
      return 9;
    }
  }
  else
  {
    if (v2 > -2147483641)
    {
      if (v2 != -2147483640)
      {
        if (v2 == -2147483632)
          return 4;
        if (v2 == -2147483616)
          return 0;
        return 23;
      }
      return 7;
    }
    if (v2 != -2147483646)
    {
      if (v2 == -2147483644)
        return 7;
      return 23;
    }
    return 1;
  }
}

uint64_t PRInsRefs(uint64_t result, _BYTE *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  signed int v7;
  uint64_t v8;
  int v9;
  int v10;
  _BYTE *v11;
  unsigned int v12;
  BOOL v13;
  signed int v14;
  uint64_t v16;
  char i;

  v5 = *(_QWORD *)(result + 72);
  if (v5)
  {
    v6 = *(_QWORD *)(v5 + 8);
    if (v6)
    {
      v7 = *(__int16 *)(v6 + 18);
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = 0;
LABEL_6:
  if (*a2)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = a2;
    do
    {
      result = SLstrncmp(v11, "REF", 3);
      if ((_DWORD)result)
      {
        *(_BYTE *)(a3 + (unsigned __int16)v9++) = *v11;
        ++v10;
      }
      else
      {
        v12 = a2[v8 + 3];
        v13 = v12 >= 0x31;
        v14 = v12 - 49;
        if (!v13 || v7 <= v14)
        {
          *(_BYTE *)(a3 + (unsigned __int16)v9) = *v11;
          ++v10;
          ++v9;
        }
        else
        {
          v10 += 4;
          v16 = *(unsigned __int16 *)(*(_QWORD *)(v6 + 8) + 2 * v14);
          for (i = *(_BYTE *)(*(_QWORD *)v6 + v16); i; i = *(_BYTE *)(*(_QWORD *)v6 + (unsigned __int16)v16))
          {
            *(_BYTE *)(a3 + (unsigned __int16)v9) = i;
            LODWORD(v16) = v16 + 1;
            ++v9;
          }
        }
      }
      v8 = (unsigned __int16)v10;
      v11 = &a2[(unsigned __int16)v10];
    }
    while (*v11);
  }
  else
  {
    LOWORD(v9) = 0;
  }
  *(_BYTE *)(a3 + (unsigned __int16)v9) = 0;
  return result;
}

uint64_t PRopnScope(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4, char **a5, unsigned int a6, unsigned int a7, _BYTE *a8)
{
  _QWORD *v11;
  unsigned int v12;
  int v13;
  unsigned __int16 v14;
  uint64_t v15;
  int v16;
  uint64_t result;
  unsigned int v18;
  unsigned __int16 *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  unsigned int v25;
  unsigned int v26;
  unsigned __int16 v27;
  int v28;
  uint64_t v29;
  int v31;
  uint64_t v32;
  unsigned __int16 v34;
  _WORD *v35;
  unsigned __int16 v36;
  unsigned __int16 v37;
  _WORD *v38;
  unsigned __int16 v39;
  __int16 v40;
  uint64_t v41;
  int v42[2];
  char __s[64];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)v42 = 0;
  v11 = *(_QWORD **)(a2 + 80);
  v12 = *a4;
  if (!*a4)
  {
    v13 = *(__int16 *)(v11[136] + 2 * a6);
    if ((v13 & 0x80000000) == 0)
    {
LABEL_10:
      v18 = (unsigned __int16)(v13 - 1);
      v19 = (unsigned __int16 *)(v11[134] + 6 * (unsigned __int16)(v13 - 1));
      v20 = *v19;
      v21 = v20 >> 8;
      v22 = v19[2];
      *a8 = 1;
      v23 = v20;
      if (!PRliveRule(a1, a2, 0, v20 >> 8, v20, 1, *(unsigned __int16 *)a5 >= a7))
      {
        v24 = v11[135];
        v25 = *(unsigned __int8 *)(v24 + v22);
        v26 = *(unsigned __int8 *)(v24 + (unsigned __int16)(v22 + 1));
        result = PRmkErr(a1, a2, v42, (uint64_t)a5, 0, v21, v23);
        if (!(_DWORD)result)
        {
          result = PRaddRefs(a1, *(uint64_t *)v42, a5[2], 1u, 0);
          if (!(_DWORD)result)
          {
            v27 = v22 + 2;
            if (v25)
            {
              v28 = 0;
              v29 = v11[135];
              while (1)
              {
                PRInsRefs(*(uint64_t *)v42, (_BYTE *)(v29 + v27), (uint64_t)__s);
                result = PRaddAlts(a1, *(uint64_t *)v42, __s, 0, 1uLL, 0);
                if ((_DWORD)result)
                  break;
                v29 = v11[135];
                while (*(unsigned __int8 *)(v29 + v27++))
                  ;
                if (v25 <= (unsigned __int16)++v28)
                  goto LABEL_19;
              }
            }
            else
            {
LABEL_19:
              if (!v26)
              {
LABEL_25:
                v34 = *((_WORD *)a5 + 4);
                v35 = *(_WORD **)v42;
                *(_WORD *)(*(_QWORD *)v42 + 4) = v34;
                v36 = *((_WORD *)a5 + 16);
                v35[3] = v36;
                *v35 = v34;
                v35[1] = v36;
                if ((*(_BYTE *)(v11[134] + 6 * v18 + 2) & 0x38) != 0)
                {
                  v35[4] = v34;
                  v35[5] = v36;
                }
                return 0;
              }
              v31 = 0;
              v32 = v11[135];
              while (1)
              {
                PRInsRefs(*(uint64_t *)v42, (_BYTE *)(v32 + v27), (uint64_t)__s);
                result = PRaddFils(a1, *(uint64_t *)v42, __s, 1u, 0);
                if ((_DWORD)result)
                  break;
                v32 = v11[135];
                while (*(unsigned __int8 *)(v32 + v27++))
                  ;
                if (v26 <= (unsigned __int16)++v31)
                  goto LABEL_25;
              }
            }
          }
        }
        return result;
      }
      return 0;
    }
    v12 = 0;
LABEL_32:
    *(_WORD *)(a3 + 24 * v12 + 10) = v13 & 0x7FFF;
    v40 = *a4;
    v41 = a3 + 24 * *a4;
    *(_BYTE *)(v41 + 8) = a6;
    *(_QWORD *)v41 = a5;
    *(_QWORD *)(v41 + 16) = 0;
    *a4 = v40 + 1;
    return 0;
  }
  v13 = *(__int16 *)(v11[136] + 20 * *(unsigned __int16 *)(a3 + 24 * (v12 - 1) + 10) + 2 * a6);
  if (v13 < 0)
  {
    if (v12 == 4)
    {
      *a8 = 1;
      if (!PRliveRule(a1, a2, 0, 0x34u, 98, 1, *(unsigned __int16 *)a5 >= a7))
      {
        result = PRmkErr(a1, a2, v42, (uint64_t)a5, 0, 0x34u, 98);
        if ((_DWORD)result)
          return result;
        v37 = *((_WORD *)a5 + 4);
        v38 = *(_WORD **)v42;
        *(_WORD *)(*(_QWORD *)v42 + 4) = v37;
        v39 = *((_WORD *)a5 + 16);
        v38[3] = v39;
        *v38 = v37;
        v38[1] = v39;
      }
      return 0;
    }
    goto LABEL_32;
  }
  if (!*(_QWORD *)(a3 + 24 * (v12 - 1) + 16))
    goto LABEL_10;
  v14 = v12 - 1;
  *a4 = v14;
  v15 = *(_QWORD *)(a3 + 24 * v14 + 16);
  if (**(_BYTE **)(v15 + 16) == 39)
    v16 = -1056962560;
  else
    v16 = -1056956416;
  *(_DWORD *)(v15 + 4) = v16;
  result = PRopnScope(a1, a2);
  if (!(_DWORD)result)
    return 0;
  return result;
}

uint64_t PRclsScope(uint64_t a1, uint64_t a2, uint64_t a3, unsigned __int16 *a4, unsigned __int16 *a5, unsigned int a6, unsigned int a7, _BYTE *a8)
{
  unsigned __int16 *v8;
  uint64_t v11;
  unsigned int v12;
  int v13;
  int v14;
  unsigned int *v15;
  char **v16;
  char **v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  unsigned int v20;
  int v21;
  uint64_t result;
  unsigned __int16 v23;
  unsigned __int16 *v24;
  unsigned __int16 v25;
  unsigned int v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  unsigned __int16 i;
  unsigned __int16 *v31;
  int v32[2];

  v8 = a5;
  *(_QWORD *)v32 = 0;
  v11 = *(_QWORD *)(a2 + 80);
  v12 = *a4;
  if (!*a4)
  {
    v15 = (unsigned int *)(a5 + 2);
    v14 = *((_DWORD *)a5 + 1);
    if ((~v14 & 0x3000000) == 0)
    {
LABEL_17:
      v26 = v14 & 0xFEFFFFFF;
      *v15 = v26;
      if (!*(_WORD *)(v11 + 1096))
        return 0;
      v27 = 0;
      while (*(_DWORD *)(*(_QWORD *)(v11 + 1104) + 4 * v27) != v26)
      {
        if (*(unsigned __int16 *)(v11 + 1096) == ++v27)
          return 0;
      }
      result = PRopnScope(a1, a2, a3, a4, (char **)a5, *(unsigned __int8 *)(*(_QWORD *)(v11 + 1120) + v27), a7, a8);
      if (!(_DWORD)result)
        return 0;
      return result;
    }
    goto LABEL_6;
  }
  if (*(unsigned __int8 *)(a3 + 24 * (v12 - 1) + 8) == a6)
  {
    *a4 = v12 - 1;
    v13 = *((_DWORD *)a5 + 1);
    if ((~v13 & 0x3000000) == 0)
      *((_DWORD *)a5 + 1) = v13 & 0xFDFFFFFF;
    return 0;
  }
  v15 = (unsigned int *)(a5 + 2);
  v14 = *((_DWORD *)a5 + 1);
  if ((~v14 & 0x3000000) == 0)
    goto LABEL_17;
  if (!*(_QWORD *)(a3 + 24 * (v12 - 1) + 16))
  {
    if (v12 >= 2)
    {
      if (*(unsigned __int8 *)(a3 + 24 * (v12 - 2) + 8) == a6)
      {
        v16 = *(char ***)(a3 + 24 * (v12 - 1));
        v19 = 52;
        v18 = 119;
        v17 = (char **)a5;
        switch(*(_BYTE *)(a2 + 20))
        {
          case 5:
            v18 = 122;
            goto LABEL_56;
          case 6:
            break;
          case 7:
            v18 = 125;
            goto LABEL_56;
          case 8:
            v18 = -118;
            goto LABEL_56;
          case 9:
            v18 = 118;
            goto LABEL_56;
          case 0xC:
            v18 = -90;
            goto LABEL_56;
          default:
            v19 = 52;
            v18 = 117;
LABEL_56:
            v17 = (char **)a5;
            break;
        }
LABEL_9:
        *a8 = 1;
        v20 = v19;
        v21 = v18;
        if (PRliveRule(a1, a2, 0, v19, v18, 1, *v8 >= a7))
          return 0;
        result = PRmkErr(a1, a2, v32, (uint64_t)v8, 0, v20, v21);
        if (!(_DWORD)result)
        {
          v23 = v8[4];
          v24 = *(unsigned __int16 **)v32;
          *(_WORD *)(*(_QWORD *)v32 + 4) = v23;
          v25 = v8[16];
          v24[3] = v25;
          *v24 = v23;
          v24[1] = v25;
          if (!v16 || (result = PRaddRefs(a1, (uint64_t)v24, v16[2], 1u, 0), !(_DWORD)result))
          {
            if (!v17)
              return 0;
            result = PRaddRefs(a1, *(uint64_t *)v32, v17[2], 1u, 0);
            if (!(_DWORD)result)
              return 0;
          }
        }
        return result;
      }
      if (v12 >= 3)
      {
        v18 = 0;
        v19 = 0;
        v16 = 0;
        for (i = 3; i <= v12; ++i)
        {
          if (*(unsigned __int8 *)(a3 + 24 * (int)(v12 - i) + 8) == a6)
          {
            v18 = 120;
            v19 = 52;
            v31 = a5;
            v16 = (char **)a5;
            switch(*(_BYTE *)(a2 + 20))
            {
              case 5:
                v18 = 123;
                goto LABEL_46;
              case 6:
                break;
              case 7:
                v18 = 126;
                goto LABEL_46;
              case 8:
                v18 = -117;
                goto LABEL_46;
              case 9:
                v18 = 119;
                goto LABEL_46;
              case 0xC:
                v18 = -89;
                goto LABEL_46;
              default:
                v18 = 118;
                v19 = 52;
LABEL_46:
                v31 = a5;
                v16 = (char **)a5;
                break;
            }
          }
          else
          {
            v31 = 0;
          }
          if (v31)
            break;
        }
        if (v31)
        {
          v17 = 0;
          v8 = v31;
          goto LABEL_9;
        }
LABEL_7:
        if (!a5)
          return 0;
        v17 = 0;
        v18 = pOpnMissed[pMissedOffset[*(unsigned __int8 *)(a2 + 20)] + (unint64_t)a6];
        v19 = 52;
        goto LABEL_9;
      }
    }
LABEL_6:
    v16 = 0;
    goto LABEL_7;
  }
  *a4 = v12 - 1;
  v28 = *(_QWORD *)(a3 + 24 * (unsigned __int16)(v12 - 1) + 16);
  if (**(_BYTE **)(v28 + 16) == 39)
    v29 = -1056962560;
  else
    v29 = -1056956416;
  *(_DWORD *)(v28 + 4) = v29;
  result = PRclsScope(a1, a2);
  if (!(_DWORD)result)
    return 0;
  return result;
}

uint64_t isUpperCase(int a1)
{
  unsigned int v2;
  uint64_t result;
  unsigned int v4;

  v2 = a1 - 65;
  result = 1;
  if (v2 >= 0x1A && (a1 - 192) >= 0x17 && (a1 - 216) >= 7)
  {
    v4 = a1 - 138;
    if (v4 > 0x15 || ((1 << v4) & 0x200015) == 0)
      return 0;
  }
  return result;
}

uint64_t toLower(uint64_t result)
{
  if ((result - 65) < 0x1A || (result - 192) < 0x17)
  {
    if ((result - 138) > 0x15 || ((1 << (result + 118)) & 0x200015) == 0)
      return (result + 32);
LABEL_13:
    if ((_DWORD)result == 159)
      return 255;
    else
      return (result + 16);
  }
  if ((result - 216) < 7)
    return (result + 32);
  if ((result - 138) <= 0x15 && ((1 << (result + 118)) & 0x200015) != 0)
    goto LABEL_13;
  return result;
}

uint64_t isVowelTurkish(int a1)
{
  uint64_t result;
  unsigned int v3;

  result = 1;
  if ((a1 - 65) > 0x34 || ((1 << (a1 - 65)) & 0x10411100104111) == 0)
  {
    v3 = a1 - 214;
    if (v3 > 0x27 || ((1 << v3) & 0xC1000000C1) == 0)
      return 0;
  }
  return result;
}

uint64_t simpleTokenRangeAfterIndex(UniChar *buffer, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  int64_t v22;
  int64_t v23;
  int16x4_t v24;
  unsigned int v25;
  const __CFCharacterSet *Predefined;
  const __CFCharacterSet *theSet;
  CFRange v29;

  v4 = a2 + a3;
  if (a2 + a3 <= a4)
    return 0;
  v5 = a4;
  Predefined = 0;
  theSet = 0;
  v7 = -(uint64_t)a4;
  v8 = a4 + 64;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v11 = v10;
    if ((unint64_t)v5 >= 4)
      v12 = 4;
    else
      v12 = v5;
    if (v5 < 0 || (v13 = *((_QWORD *)buffer + 20), v13 <= v5))
    {
      LOWORD(v15) = 0;
    }
    else
    {
      v14 = *((_QWORD *)buffer + 17);
      if (v14)
      {
        v15 = *(unsigned __int16 *)(v14 + 2 * (v5 + *((_QWORD *)buffer + 19)));
      }
      else
      {
        v17 = *((_QWORD *)buffer + 18);
        if (v17)
        {
          v15 = *(char *)(v17 + *((_QWORD *)buffer + 19) + v5);
        }
        else
        {
          if (*((_QWORD *)buffer + 22) <= v5 || (v18 = *((_QWORD *)buffer + 21), v18 > v5))
          {
            v19 = -v12;
            v20 = v12 + v7;
            v21 = v8 - v12;
            v22 = v5 + v19;
            v23 = v22 + 64;
            if (v22 + 64 >= v13)
              v23 = *((_QWORD *)buffer + 20);
            *((_QWORD *)buffer + 21) = v22;
            *((_QWORD *)buffer + 22) = v23;
            if (v13 >= v21)
              v13 = v21;
            v29.length = v13 + v20;
            v29.location = v22 + *((_QWORD *)buffer + 19);
            CFStringGetCharacters(*((CFStringRef *)buffer + 16), v29, buffer);
            v18 = *((_QWORD *)buffer + 21);
          }
          v15 = buffer[v5 - v18];
        }
      }
      if ((unsigned __int16)v15 >= 0x100u)
      {
        v24 = vdup_n_s16(v15);
        if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x35003600820076, (uint16x4_t)vadd_s16(v24, (int16x4_t)0xF5FBF6FCFC00FB76))) & 1) != 0|| (unsigned __int16)(v15 - 3077) < 0x39u|| (unsigned __int16)((unsigned __int16)(v15 + 21504) >> 2) < 0xAE9u|| (v15 & 0xFF00) == 0x1100|| (unsigned __int16)(v15 - 12592) < 0x60u)
        {
          goto LABEL_50;
        }
        v25 = (unsigned __int16)v15 - 8204;
        if (v25 <= 0x1B && ((1 << v25) & 0x9003003) != 0)
        {
LABEL_35:
          if (v9 != 0x7FFFFFFFFFFFFFFFLL)
            return v11;
          if (v11 == 0x7FFFFFFFFFFFFFFFLL)
            v9 = 0x7FFFFFFFFFFFFFFFLL;
          else
            v9 = v5;
LABEL_39:
          v10 = v11;
          goto LABEL_53;
        }
        if ((vmaxv_u16(vcgt_u16((uint16x4_t)0x16000300160007, (uint16x4_t)vadd_s16(v24, (int16x4_t)0xF5C4F5FFF6C6FB7DLL))) & 1) != 0|| (unsigned __int16)(v15 - 3072) < 5u|| (unsigned __int16)(v15 - 3134) < 0x19u|| (v15 & 0xFFFC) == 0x900)
        {
          goto LABEL_39;
        }
        if ((unsigned __int16)((unsigned __int16)v15 >> 3) <= 0x404u)
        {
          if (!theSet)
            theSet = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
          if (!Predefined)
            Predefined = CFCharacterSetGetPredefined(kCFCharacterSetNonBase);
          if (CFCharacterSetIsCharacterMember(theSet, v15))
            goto LABEL_50;
          if (CFCharacterSetIsCharacterMember(Predefined, v15))
            goto LABEL_39;
        }
        goto LABEL_14;
      }
    }
    v16 = simpleTokenCategories[(unsigned __int16)v15];
    if (v16 == 50)
      goto LABEL_35;
    if (v16 == 49)
    {
LABEL_50:
      v9 = 0x7FFFFFFFFFFFFFFFLL;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
        v10 = v5;
      else
        v10 = v11;
      goto LABEL_53;
    }
    if (v16 != 48)
      goto LABEL_39;
LABEL_14:
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      return v11;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      return v11;
LABEL_53:
    ++v5;
    --v7;
    ++v8;
  }
  while (v4 != v5);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL && v10 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  return v10;
}

uint64_t toUpper(uint64_t result)
{
  unsigned int v1;

  if ((int)result <= 247 && (result - 97) >= 0x1A && (result - 223) >= 0x18)
  {
    if ((result - 154) > 4 || ((1 << (result + 102)) & 0x15) == 0)
      return result;
    return (result - 16);
  }
  if ((result - 154) <= 4 && ((1 << (result + 102)) & 0x15) != 0)
    return (result - 16);
  if ((_DWORD)result == 255)
    v1 = 159;
  else
    v1 = result - 32;
  if ((_DWORD)result == 223)
    return 223;
  else
    return v1;
}

uint64_t PRrule(unsigned __int8 *a1, int a2, unsigned __int16 a3)
{
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  int v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t RuleStatus;
  unint64_t v21;
  int v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  int v27;
  __int16 v28;
  uint64_t v29;
  void *v30;

  if (!a1)
    return 230;
  v6 = a1 + 20;
  v7 = PRGetAppElem(*a1);
  if (!v7)
  {
    v10 = 0xE6FFFFFF93;
LABEL_19:
    *(_QWORD *)(a1 + 20) = v10;
    v12 = 520;
LABEL_34:
    *((_WORD *)a1 + 14) = v12;
    return 230;
  }
  v8 = v7;
  v9 = a3;
  *(_QWORD *)(v7 + 32) = v6;
  if (a2 <= 1023)
  {
    if (a2 > 511)
    {
      if (a2 == 512)
        goto LABEL_17;
      if (a2 != 768)
        goto LABEL_32;
    }
    else if (a2 != 17)
    {
      if (a2 != 256)
        goto LABEL_32;
LABEL_17:
      if (a3 - 1 >= 2)
      {
        v10 = 0xE6FFFFFF94;
        goto LABEL_19;
      }
      goto LABEL_24;
    }
LABEL_22:
    if (a3)
    {
      *(_QWORD *)(a1 + 20) = 0xE6FFFFFF94;
      v12 = 521;
      goto LABEL_34;
    }
    goto LABEL_24;
  }
  if (a2 > 1535)
  {
    if (a2 != 1536 && a2 != 1792)
      goto LABEL_32;
    goto LABEL_22;
  }
  if (a2 == 1024)
    goto LABEL_17;
  if (a2 != 1280)
  {
LABEL_32:
    v11 = 0xE6FFFFFF95;
    goto LABEL_33;
  }
  if (a3 - 3 >= 3)
  {
    v11 = 0xE6FFFFFF94;
    goto LABEL_33;
  }
LABEL_24:
  if (a2 <= 511)
  {
    if (a2 == 17)
    {
      release((uint64_t)a1);
      return 0;
    }
LABEL_30:
    if (!*((_QWORD *)a1 + 1))
    {
      a1[16] = 0;
      if (a2 == 1024 && !a1[7])
      {
        *(_QWORD *)(a1 + 20) = 0xE6FFFFFF85;
        v12 = 523;
        goto LABEL_34;
      }
      goto LABEL_43;
    }
    v11 = 0xE6FFFFFF85;
LABEL_33:
    *(_QWORD *)(a1 + 20) = v11;
    v12 = 522;
    goto LABEL_34;
  }
  if (a2 == 512)
  {
    v15 = a1[6];
    if ((~v15 & 0xC) == 0 || !a1[6] || (v15 & 3) == 3)
    {
      *(_QWORD *)(a1 + 20) = 0xE6FFFFFF85;
      v12 = 524;
      goto LABEL_34;
    }
    goto LABEL_43;
  }
  if (a2 == 768 || a2 == 1024)
    goto LABEL_30;
LABEL_43:
  v16 = PRGetDbElem(*a1, a1[1]);
  if (!v16)
  {
    v19 = *(_QWORD *)(v8 + 32);
    *(_QWORD *)v19 = 0xE6FFFFFF92;
    *(_WORD *)(v19 + 8) = 524;
    return 230;
  }
  v17 = v16;
  HIDWORD(v18) = a2;
  LODWORD(v18) = a2 - 256;
  switch((v18 >> 8))
  {
    case 0u:
      RuleStatus = getRuleStatus(v8, v16, a1, v9 != 1);
      goto LABEL_64;
    case 1u:
      RuleStatus = setStatus(v8, v16, a1, v9 != 1);
      goto LABEL_64;
    case 2u:
      RuleStatus = getLongTypeDescription(v8, v16, (uint64_t)a1);
      goto LABEL_64;
    case 3u:
      if (v9 == 1)
        RuleStatus = getTypeDescriptions(v8, v16, a1);
      else
        RuleStatus = getRuleDescriptions(v8, v16, a1);
      goto LABEL_64;
    case 4u:
      v21 = 0x30201000000uLL >> (8 * v9);
      if (v9 >= 6)
        LOBYTE(v21) = 0;
      v22 = a1[2];
      v23 = v21 & 3;
      v24 = v8;
      v25 = v17;
      v26 = 0;
      goto LABEL_56;
    case 5u:
      v22 = a1[2];
      v23 = *(_BYTE *)(*(_QWORD *)(v16 + 48) + 324) & 3;
      v24 = v8;
      v25 = v17;
      v26 = 1;
LABEL_56:
      RuleStatus = PRloadProfile(v24, v25, v22, v23, v26);
LABEL_64:
      v13 = RuleStatus;
      goto LABEL_65;
    case 6u:
      v27 = *(_BYTE *)(*(_QWORD *)(v16 + 48) + 324) & 3;
      switch(v27)
      {
        case 3:
          v13 = 0;
          v28 = 5;
          goto LABEL_73;
        case 2:
          v13 = 0;
          v28 = 4;
          goto LABEL_73;
        case 1:
          v13 = 0;
          v28 = 3;
LABEL_73:
          *((_WORD *)a1 + 9) = v28;
          goto LABEL_65;
      }
      v13 = 0;
      *((_WORD *)a1 + 9) = 0;
LABEL_65:
      if (a2 != 1280 && a2 != 1536)
      {
        if (a1[2])
        {
          v29 = *(_QWORD *)(v8 + 32);
          *(_QWORD *)v29 = 0xE6FFFFFF8FLL;
          *(_WORD *)(v29 + 8) = 536;
        }
        else
        {
          v30 = *(void **)(v17 + 136);
          if (v30)
          {
            free(v30);
            *(_QWORD *)(v17 + 136) = 0;
          }
        }
      }
      return v13;
    default:
      v13 = 0;
      goto LABEL_65;
  }
}

void release(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
  {
    do
    {
      v3 = *(_QWORD *)(v2 + 16);
      if (*(_QWORD *)v2)
        free(*(void **)v2);
      free((void *)v2);
      v2 = v3;
    }
    while (v3);
  }
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 0;
}

uint64_t getLongTypeDescription(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  __int16 v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  unsigned int v16;
  void **v17;
  char OneStatus;
  uint64_t v19;
  char v20;
  __int16 v21;
  unsigned __int16 v22;
  void *v23;
  void **v24;

  if (*(_BYTE *)(a3 + 2))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v4 = 0xE6FFFFFF8ELL;
    v5 = 744;
LABEL_8:
    *(_WORD *)(v4 + 8) = v5;
    return 230;
  }
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 136) = 0;
  v9 = *(_QWORD *)(v8 + 32);
  v10 = *(uint64_t **)(v8 + 312);
  if (v10)
    v11 = *v10;
  else
    v11 = 0;
  v12 = *(_QWORD *)(v8 + 200);
  v13 = *(_QWORD *)(v8 + 224);
  v22 = 0;
  v14 = *(_QWORD *)(v8 + 304);
  if (getTypeIndex(v9, &v22, *(unsigned __int8 *)(v8 + 26), *(unsigned __int8 *)(a3 + 3), 0))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v4 = 0xE6FFFFFF8ELL;
    v5 = 536;
    goto LABEL_8;
  }
  v16 = bswap32(*(_DWORD *)(v13 + 4 * v22));
  if (v16 == -1)
    return 4;
  v23 = 0;
  v21 = 0;
  v20 = 0;
  result = getOneDesc(a1, a2, a3, (unsigned int *)v8, (char **)&v23, &v20, &v21, *(_DWORD *)(v8 + 4) + 4 * v16, 1);
  if (!(_DWORD)result)
  {
    v24 = 0;
    if (newListNode(a3, (uint64_t)&v24))
    {
      v17 = v24;
      *v24 = v23;
      *((_WORD *)v17 + 4) = v21;
      *((_BYTE *)v17 + 10) = *(_BYTE *)(a3 + 3);
      *((_BYTE *)v17 + 12) = v20;
      OneStatus = getOneStatus(v11, v14, v12, v22, 0);
      result = 0;
      *((_BYTE *)v17 + 11) = OneStatus;
    }
    else
    {
      free(v23);
      v19 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)v19 = 0xDC00000078;
      *(_WORD *)(v19 + 8) = 536;
      return 220;
    }
  }
  return result;
}

uint64_t getTypeDescriptions(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned __int16 v15;
  uint64_t OneDesc;
  void **v17;
  int v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  __int16 v25;
  unsigned __int16 v26;
  void *v27;
  void **v28;

  if (a3[2])
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v4 = 0xE6FFFFFF8ELL;
    *(_WORD *)(v4 + 8) = 744;
    return 230;
  }
  else
  {
    v8 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a2 + 136) = 0;
    v9 = *(_QWORD *)(v8 + 32);
    v10 = *(uint64_t **)(v8 + 312);
    if (v10)
      v23 = *v10;
    else
      v23 = 0;
    v11 = *(_QWORD *)(v8 + 200);
    v12 = *(_QWORD *)(v8 + 208);
    v26 = 0;
    v13 = *(_QWORD *)(v8 + 304);
    if (getTypeIndex(v9, &v26, *(unsigned __int8 *)(v8 + 26), a3[3], 1))
    {
      return 4;
    }
    else
    {
      if ((unsigned __int16)(v26 + a3[7]) >= *(unsigned __int8 *)(v8 + 26))
        v14 = *(unsigned __int8 *)(v8 + 26);
      else
        v14 = (unsigned __int16)(v26 + a3[7]);
      if (v26 >= v14)
      {
        return 0;
      }
      else
      {
        v21 = v13;
        v22 = v11;
        v27 = 0;
        v28 = 0;
        v25 = 0;
        v15 = 4 * v26;
        v24 = 0;
        while (1)
        {
          OneDesc = getOneDesc(a1, a2, (uint64_t)a3, (unsigned int *)v8, (char **)&v27, &v24, &v25, ((*(unsigned __int8 *)(v12 + v15) << 24) | (*(unsigned __int8 *)(v12 + (v15 | 1)) << 16) | (*(unsigned __int8 *)(v12 + (v15 | 2)) << 8) | *(unsigned __int8 *)(v12 + (v15 | 3)))+ *(_DWORD *)(v8 + 4), 0);
          if ((_DWORD)OneDesc)
          {
            v5 = OneDesc;
            goto LABEL_20;
          }
          if (!newListNode((uint64_t)a3, (uint64_t)&v28))
            break;
          v17 = v28;
          *v28 = v27;
          *((_WORD *)v17 + 4) = v25;
          v18 = v26;
          *((_BYTE *)v17 + 10) = *(_BYTE *)(v9 + v26);
          *((_BYTE *)v17 + 12) = v24;
          v5 = 0;
          *((_BYTE *)v17 + 11) = getOneStatus(v23, v21, v22, v18, 0);
          v15 += 4;
          if (v14 <= ++v26)
            return v5;
        }
        free(v27);
        v19 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)v19 = 0xDC00000078;
        *(_WORD *)(v19 + 8) = 537;
        v5 = 220;
LABEL_20:
        release((uint64_t)a3);
      }
    }
  }
  return v5;
}

uint64_t getRuleDescriptions(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v4;
  __int16 v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  int v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int16 v26;
  unsigned int OneStatus;
  int v28;
  char v29;
  uint64_t OneDesc;
  void **v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int16 v37;
  __int16 v38;
  char v39;
  __int16 v40;
  unsigned __int16 v41;
  void *v42;
  void **v43;

  if (a3[2])
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v4 = 0xE6FFFFFF8ELL;
    v5 = 744;
LABEL_8:
    *(_WORD *)(v4 + 8) = v5;
    return 230;
  }
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 136) = 0;
  v9 = *(_QWORD *)(v8 + 32);
  v10 = *(uint64_t **)(v8 + 312);
  if (v10)
    v11 = *v10;
  else
    v11 = 0;
  v12 = *(_QWORD *)(v8 + 40);
  v13 = *(_QWORD *)(v8 + 200);
  v14 = *(_QWORD *)(v8 + 216);
  v41 = 0;
  v15 = *(_QWORD *)(v8 + 304);
  if (getTypeIndex(v9, &v41, *(unsigned __int8 *)(v8 + 26), a3[3], 0))
  {
    v4 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v4 = 0xE6FFFFFF8ELL;
    v5 = 537;
    goto LABEL_8;
  }
  v34 = v14;
  v35 = v15;
  v18 = 2 * v41;
  v19 = *(unsigned __int8 *)(v12 + (v18 | 1)) | (*(unsigned __int8 *)(v12 + v18) << 8);
  v20 = *(unsigned __int8 *)(v13 + (v18 | 1)) | (*(unsigned __int8 *)(v13 + v18) << 8);
  v33 = a2;
  if (v41)
    v20 -= bswap32(*(unsigned __int16 *)(v13 + v18 - 2)) >> 16;
  v37 = v20 + v19;
  v21 = a3[4];
  v22 = v19 + v21 + 0xFFFF;
  v36 = (uint64_t)a3;
  v38 = a3[7];
  v23 = (unsigned __int16)(v20 + v19) <= (unsigned __int16)(v19 + v21 - 1) || a3[7] == 0;
  v25 = v14;
  v24 = v35;
  if (v23)
    return 4 * (*(_BYTE *)(v36 + 16) == 0);
  v42 = 0;
  v43 = 0;
  v40 = 0;
  v26 = 4 * (v19 + v21 - 1);
  v39 = 0;
  while (1)
  {
    OneStatus = getOneStatus(v11, v24, v13, v41, (__int16)v21);
    if (OneStatus < 8)
      goto LABEL_22;
    v28 = (*(unsigned __int8 *)(v25 + v26) << 24) | (*(unsigned __int8 *)(v25 + (v26 | 1)) << 16) | (*(unsigned __int8 *)(v25 + (v26 | 2)) << 8) | *(unsigned __int8 *)(v25 + (v26 | 3));
    if (v28 == -1)
      goto LABEL_22;
    v29 = OneStatus;
    OneDesc = getOneDesc(a1, v33, v36, (unsigned int *)v8, (char **)&v42, &v39, &v40, *(_DWORD *)(v8 + 4) + v28, 0);
    if ((_DWORD)OneDesc)
    {
      v16 = OneDesc;
      goto LABEL_27;
    }
    if (!newListNode(v36, (uint64_t)&v43))
      break;
    --v38;
    v31 = v43;
    *v43 = v42;
    *((_WORD *)v31 + 4) = v40;
    *((_BYTE *)v31 + 10) = v21;
    *((_BYTE *)v31 + 12) = v39;
    *((_BYTE *)v31 + 11) = v29;
    v25 = v34;
    v24 = v35;
LABEL_22:
    if ((unsigned __int16)++v22 < v37)
    {
      v26 += 4;
      LOWORD(v21) = v21 + 1;
      if (v38 > 0)
        continue;
    }
    return 4 * (*(_BYTE *)(v36 + 16) == 0);
  }
  free(v42);
  v32 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)v32 = 0xDC00000078;
  *(_WORD *)(v32 + 8) = 538;
  v16 = 220;
LABEL_27:
  release(v36);
  return v16;
}

uint64_t getRuleStatus(uint64_t a1, uint64_t a2, _BYTE *a3, int a4)
{
  uint64_t v5;
  __int16 v6;
  uint64_t v8;
  uint64_t v9;
  unsigned __int16 *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  uint64_t result;
  char v20;
  int MapVal;
  uint64_t v22;
  char v23;
  char v24;
  uint64_t v25;
  unsigned __int16 v26;
  int v27;
  uint64_t v28;
  uint64_t v29;

  v28 = 0;
  v27 = 0;
  if (a3[2])
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v5 = 0xE6FFFFFF8ELL;
    v6 = 744;
LABEL_11:
    *(_WORD *)(v5 + 8) = v6;
    return 230;
  }
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 136) = 0;
  v9 = *(_QWORD *)(v8 + 32);
  v10 = *(unsigned __int16 **)(v8 + 200);
  v11 = *(uint64_t **)(v8 + 312);
  if (v11)
    v12 = *v11;
  else
    v12 = 0;
  v13 = *(_QWORD *)(v8 + 216);
  v14 = *(_QWORD *)(v8 + 40);
  v15 = *(_QWORD *)(v8 + 304);
  v16 = a3[3];
  v17 = a3[4];
  if (a4)
    v18 = a3[4];
  else
    v18 = 0;
  v26 = 0;
  if (getPosition(&v26, (_DWORD *)&v28 + 1, &v28, &v27, v9, v10, *(unsigned __int8 *)(v8 + 26), v16, v17))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v5 = 0xE6FFFFFF8ELL;
    v6 = 538;
    goto LABEL_11;
  }
  if (v18
    && (!(_DWORD)v28
     || bswap32(*(_DWORD *)(v13
                          + ((4
                            * ((*(unsigned __int8 *)(v14 + 2 * v26 + 1) | (*(unsigned __int8 *)(v14 + 2 * v26) << 8))
                             + v18)
                            - 4) & 0x3FFFC))) == -1))
  {
    return 4;
  }
  v29 = 0;
  if (newListNode((uint64_t)a3, (uint64_t)&v29))
  {
    if (v12)
    {
      if (getMapVal(v12, v28, 1))
        v20 = 2;
      else
        v20 = 1;
      *(_BYTE *)(v29 + 11) |= v20;
    }
    MapVal = getMapVal(v15, v28, 1);
    result = 0;
    v22 = v29;
    if (MapVal)
      v23 = 8;
    else
      v23 = 4;
    *(_BYTE *)(v29 + 11) |= v23;
    *(_QWORD *)v22 = 0;
    *(_WORD *)(v22 + 8) = 0;
    if (v18)
      v24 = v18;
    else
      v24 = v16;
    *(_BYTE *)(v22 + 10) = v24;
    *(_BYTE *)(v22 + 12) = 0;
  }
  else
  {
    v25 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v25 = 0xDC00000078;
    *(_WORD *)(v25 + 8) = 539;
    return 220;
  }
  return result;
}

uint64_t setStatus(uint64_t a1, uint64_t a2, _BYTE *a3, int a4)
{
  uint64_t v5;
  __int16 v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v12;
  unsigned __int16 *v13;
  uint64_t v14;
  int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t result;
  unint64_t v19;
  unsigned int v20;
  unint64_t v21;
  unsigned int v22;
  unsigned int v23;

  v23 = 0;
  if (a3[2])
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v5 = 0xE6FFFFFF8ELL;
    v6 = 744;
LABEL_15:
    *(_WORD *)(v5 + 8) = v6;
    return 230;
  }
  v8 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 136) = 0;
  v9 = *(uint64_t **)(v8 + 312);
  if (v9)
    v10 = *v9;
  else
    v10 = 0;
  if ((a3[6] & 3) != 0 && v10 == 0)
  {
    v5 = *(_QWORD *)(a1 + 32);
    v17 = 0xE6FFFFFF85;
    goto LABEL_14;
  }
  v12 = *(_QWORD *)(v8 + 32);
  v13 = *(unsigned __int16 **)(v8 + 200);
  v14 = *(_QWORD *)(v8 + 304);
  v15 = *(unsigned __int8 *)(v8 + 26);
  v16 = a3[3];
  if (a4)
  {
    if (getPosition(0, 0, &v23, 0, v12, v13, v15, v16, a3[4]))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v17 = 0xE6FFFFFF8ELL;
LABEL_14:
      *(_QWORD *)v5 = v17;
      v6 = 740;
      goto LABEL_15;
    }
    if (!v23)
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)v5 = 0xE6FFFFFF8ELL;
      v6 = 741;
      goto LABEL_15;
    }
  }
  else if (getPosition(0, &v23, 0, 0, v12, v13, v15, v16, 0))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v5 = 0xE6FFFFFF8ELL;
    v6 = 742;
    goto LABEL_15;
  }
  if (v10)
  {
    if ((a3[6] & 1) != 0)
    {
      v19 = (unint64_t)v23 >> 3;
      v20 = *(unsigned __int8 *)(v10 + v19) & (-129 >> (v23 & 7));
    }
    else
    {
      if ((a3[6] & 2) == 0)
        goto LABEL_27;
      v19 = (unint64_t)v23 >> 3;
      v20 = *(unsigned __int8 *)(v10 + v19) | (0x80u >> (v23 & 7));
    }
    *(_BYTE *)(v10 + v19) = v20;
    *(_BYTE *)(v8 + 324) |= 0x80u;
  }
LABEL_27:
  if ((a3[6] & 4) != 0)
  {
    result = 0;
    v21 = (unint64_t)v23 >> 3;
    v22 = *(unsigned __int8 *)(v14 + v21) & (-129 >> (v23 & 7));
    goto LABEL_31;
  }
  result = 0;
  if ((a3[6] & 8) != 0)
  {
    v21 = (unint64_t)v23 >> 3;
    v22 = *(unsigned __int8 *)(v14 + v21) | (0x80u >> (v23 & 7));
LABEL_31:
    *(_BYTE *)(v14 + v21) = v22;
  }
  return result;
}

uint64_t PRsleepRuleData(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t result;

  if (a3)
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v3 = 0xE6FFFFFF8FLL;
    *(_WORD *)(v3 + 8) = 536;
    return 230;
  }
  else
  {
    result = *(_QWORD *)(a2 + 136);
    if (result)
    {
      free((void *)result);
      result = 0;
      *(_QWORD *)(a2 + 136) = 0;
    }
  }
  return result;
}

uint64_t PRwakeRuleData(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, _QWORD *a9, _QWORD *a10, _QWORD *a11, _QWORD *a12, _QWORD *a13, char a14)
{
  uint64_t v14;
  uint64_t result;
  _QWORD *v16;
  _QWORD *v17;

  if (a14)
  {
    v14 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v14 = 0xE6FFFFFF8ELL;
    *(_WORD *)(v14 + 8) = 744;
    return 230;
  }
  else
  {
    v16 = *(_QWORD **)(a2 + 48);
    *(_QWORD *)(a2 + 136) = 0;
    if (a3)
      *a3 = v16;
    if (a4)
      *a4 = v16[4];
    if (a5)
      *a5 = v16[5];
    if (a6)
      *a6 = v16[25];
    if (a7)
      *a7 = v16[26];
    if (a8)
      *a8 = v16[27];
    if (a9)
      *a9 = v16[28];
    if (a10)
      *a10 = v16[32];
    if (a11)
      *a11 = v16[34];
    if (a12)
    {
      v17 = (_QWORD *)v16[39];
      if (v17)
        v17 = (_QWORD *)*v17;
      *a12 = v17;
    }
    result = 0;
    if (a13)
      *a13 = v16[38];
  }
  return result;
}

uint64_t getOneDesc(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int *a4, char **a5, _BYTE *a6, _WORD *a7, unsigned int a8, char a9)
{
  unsigned __int8 *v17;
  unsigned int v18;
  unsigned __int8 *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t result;
  int v24;
  int v25;
  int v26;
  int v27;
  unsigned int v28;
  uint64_t v30;
  int v31;
  int v32;
  int v33;
  int v34;
  unsigned int v35;
  unsigned int v36;
  int v37;
  BOOL v39;
  int v40;
  unsigned __int16 v41;
  unsigned __int8 *v42;
  signed int v43;
  char *v44;
  char *v45;
  __int16 v46;
  unsigned int v47;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  char **v52;
  __int16 v53;
  char *v54;
  int v55;
  int v56;
  char *v57;
  char **v58;
  _BYTE *v59;
  __int16 v60;
  unsigned int v61;
  char *v62;

  v17 = *(unsigned __int8 **)(a2 + 136);
  if (v17)
  {
    v58 = a5;
    v59 = a6;
    v18 = *(_DWORD *)(a2 + 144);
  }
  else
  {
    v19 = (unsigned __int8 *)malloc_type_malloc(0x400uLL, 0xD576EDBAuLL);
    *(_QWORD *)(a2 + 136) = v19;
    if (!v19)
    {
      v49 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)v49 = 0xDC00000078;
      v50 = 742;
      goto LABEL_65;
    }
    v17 = v19;
    v58 = a5;
    v59 = a6;
    v18 = 0;
    *(_DWORD *)(a2 + 144) = 0;
  }
  v61 = v18;
  v20 = *a4;
  v21 = v18 + 1024;
  if (v18 > a8 || v21 <= a8)
  {
    result = loadCache(a1, v17, (int *)&v61, a8, 1024, v20);
    if ((_DWORD)result)
      return result;
    v18 = v61;
    v21 = v61 + 1024;
  }
  if (a9)
    v24 = 3;
  else
    v24 = 2;
  if (a9)
    v25 = 4;
  else
    v25 = 3;
  v26 = v17[a8 - v18];
  v27 = a8 + 1;
  v28 = v27 + v26 * v25;
  if (v18 > v28 || v28 >= v21)
  {
    result = loadCache(a1, v17, (int *)&v61, v27, 1024, v20);
    if ((_DWORD)result)
      return result;
    v18 = v61;
  }
  LODWORD(v30) = v27 - v18;
  if (v26)
  {
    v31 = 0;
    v32 = v26;
    do
    {
      --v32;
      v31 += v24 + (v17[(unsigned __int16)v30 + (unint64_t)v31] >> 7);
    }
    while ((_BYTE)v32);
    v27 += v31;
    while (1)
    {
      v33 = (char)v17[(unsigned __int16)v30];
      if (v33 < 0)
      {
        v34 = v17[(unsigned __int16)v30 + 1];
        v35 = 2;
      }
      else
      {
        v34 = 0;
        v35 = 1;
      }
      v36 = v17[(unsigned __int16)v30];
      v37 = v33 & 0x7F;
      if (v37 == 127)
      {
        if ((v36 & 0x80) == 0 || v34)
          goto LABEL_47;
      }
      else
      {
        v39 = (v36 & 0x80u) == 0 || v34 != 0;
        if (v37 == *(unsigned __int8 *)(a3 + 5) && v39)
        {
LABEL_47:
          if (a9)
            goto LABEL_48;
LABEL_50:
          v30 = (unsigned __int16)v30;
          v41 = v17[v35 + (unint64_t)(unsigned __int16)v30];
          goto LABEL_51;
        }
      }
      if (a9)
        v40 = v17[v35 + 1 + (unint64_t)(unsigned __int16)v30] | (v17[v35
                                                                          + (unint64_t)(unsigned __int16)v30] << 8);
      else
        v40 = v17[(unsigned __int16)v30 + (unint64_t)v35];
      --v26;
      v27 += v40;
      LODWORD(v30) = v30 + v24 + (v36 >> 7);
      if (!(_BYTE)v26)
        goto LABEL_47;
    }
  }
  v35 = 0;
  if (!a9)
    goto LABEL_50;
LABEL_48:
  v30 = (unsigned __int16)v30;
  v41 = _byteswap_ushort(*(_WORD *)&v17[v35 + (unint64_t)(unsigned __int16)v30]);
LABEL_51:
  v60 = v41;
  if (v17[v30] == 127)
    v42 = (unsigned __int8 *)(a2 + 20);
  else
    v42 = (unsigned __int8 *)(a3 + 5);
  v43 = *v42;
  *a7 = v41 + 1;
  v44 = (char *)malloc_type_calloc((unsigned __int16)(v41 + 1), 1uLL, 0x100004077774924uLL);
  v62 = v44;
  if (!v44)
  {
    v49 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v49 = 0xDC00000078;
    v50 = 743;
LABEL_65:
    *(_WORD *)(v49 + 8) = v50;
    return 220;
  }
  v45 = v44;
  v46 = v61;
  v47 = v27 + v41;
  if (v61 <= v47 && v47 < v61 + 1024)
  {
LABEL_68:
    memcpy(v45, &v17[(unsigned __int16)(v27 - v46)], v41);
    goto LABEL_69;
  }
  if (!a9)
  {
    result = loadCache(a1, v17, (int *)&v61, v27, 1024, v20);
    if ((_DWORD)result)
      return result;
    v46 = v61;
    goto LABEL_68;
  }
  result = loadCache(a1, v44, 0, v27, v41, v20);
  if ((_DWORD)result)
    return result;
LABEL_69:
  SLcrypt(v45, v41, (uint64_t)&ruleKey, 7);
  v51 = SLLngToA(v43);
  if (v43 <= 7)
  {
    v52 = v58;
    if (v43 != 5)
    {
      if (v43 == 6 && *(_WORD *)(a2 + 16) == 64)
        OneToMultiChrCnv((const char **)&v62, (unsigned __int16 *)&v60, 223, a1);
      goto LABEL_84;
    }
    v53 = *(_WORD *)(a2 + 18);
    if ((v53 & 0x10) != 0)
    {
      OneToMultiChrCnv((const char **)&v62, (unsigned __int16 *)&v60, 247, a1);
      OneToMultiChrCnv((const char **)&v62, (unsigned __int16 *)&v60, 230, a1);
      v53 = *(_WORD *)(a2 + 18);
    }
    if ((v53 & 0x40) == 0)
      goto LABEL_84;
    v54 = v62;
    v55 = v60;
    v56 = 5;
    goto LABEL_83;
  }
  v52 = v58;
  if (v43 != 8)
  {
    if (v43 == 16)
      ConvertString(v45, a2);
    goto LABEL_84;
  }
  if ((*(_WORD *)(a2 + 18) & 0x40) != 0)
  {
    v55 = (__int16)v41;
    v54 = v45;
    v56 = 8;
LABEL_83:
    ToUpUnaccentedCnv(v54, v55, v56, v51);
  }
LABEL_84:
  v57 = v62;
  if (*(_BYTE *)(a1 + 28))
  {
    SLchcnv(v62, v60, (unsigned __int8 *)v62, 0, v43);
    v57 = v62;
  }
  result = 0;
  *(_DWORD *)(a2 + 144) = v61;
  *v52 = v57;
  *v59 = v43;
  return result;
}

uint64_t newListNode(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v5;

  result = (uint64_t)malloc_type_calloc(1uLL, 0x18uLL, 0x1030040DD0DA86DuLL);
  if (result)
  {
    if (*(_QWORD *)(a1 + 8))
    {
      *(_QWORD *)(*(_QWORD *)a2 + 16) = result;
      v5 = *(_BYTE *)(a1 + 16) + 1;
    }
    else
    {
      *(_QWORD *)(a1 + 8) = result;
      v5 = 1;
    }
    *(_BYTE *)(a1 + 16) = v5;
    *(_QWORD *)a2 = result;
    return 1;
  }
  return result;
}

uint64_t getOneStatus(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5)
{
  int v5;
  char v7;
  char v8;

  v5 = a5;
  if (a4)
    v5 = a5
       + a4
       + (*(unsigned __int8 *)(a3 + (2 * a4 - 1)) | (*(unsigned __int8 *)(a3 + (2 * a4 - 2)) << 8));
  if (a1)
  {
    if (getMapVal(a1, v5, 1))
      v7 = 2;
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }
  if (getMapVal(a2, v5, 1))
    v8 = 8;
  else
    v8 = 4;
  return (v8 | v7);
}

uint64_t loadCache(uint64_t a1, void *a2, int *a3, int a4, int a5, unsigned int a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  unsigned int v15;

  v15 = 0;
  if (SLSeek(a6, a4, 0))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 0xDC0000006FLL;
LABEL_5:
    *(_QWORD *)v12 = v13;
    *(_WORD *)(v12 + 8) = 743;
    return 220;
  }
  if (SLFRead(a6, a5, a2, &v15))
  {
    v12 = *(_QWORD *)(a1 + 32);
    v13 = 0xDC00000070;
    goto LABEL_5;
  }
  result = 0;
  if (a3)
    *a3 = a4;
  return result;
}

uint64_t PRSfxGet(const char *a1, int a2, _BYTE *a3, _BYTE *a4, _WORD *a5, uint64_t a6)
{
  unsigned __int16 *v7;
  uint64_t v12;
  signed int v13;
  int v14;
  unsigned int v15;
  __int16 v16;
  int v17;
  int v18;
  __int16 v19;
  unsigned __int16 v20;
  __int16 v21;
  __int16 v22;
  __int16 v23;
  uint64_t result;
  int v25;
  unsigned __int16 v26;
  char v27;
  unsigned __int16 v28;
  signed int v29;
  int v30;
  uint64_t v31;
  int v32;
  char v33;

  *a3 = 0;
  *a4 = 0;
  v7 = *(unsigned __int16 **)(a6 + 56);
  if (v7)
  {
    v12 = *((_QWORD *)v7 + 1);
    v13 = *v7;
    v14 = *((_DWORD *)v7 + 1);
    v15 = v7[1];
    v16 = strlen(a1);
    if (a2)
    {
      if (a2 != 1)
        return 8;
      v17 = 0;
      v18 = 0;
      v19 = v16;
      if (v16 <= 1)
        v19 = 1;
      v20 = v19 - 1;
      v21 = -1;
    }
    else
    {
      v20 = 0;
      v23 = v16;
      if (v16 <= 1)
        v23 = 1;
      v17 = (unsigned __int16)(v23 - 1);
      v18 = 128;
      v21 = 1;
    }
    if (v17 == v20)
    {
      v22 = 0;
    }
    else
    {
      v22 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 1;
      do
      {
        v28 = 0;
        v26 = ((v26 & 0x7F) << 8) + 19 * (v26 >> 7) + a1[(__int16)v20];
        if (v26 > 0x7FECu)
          v26 -= 32749;
        v25 ^= v26 & 0x7FFF;
        v29 = (unsigned __int16)v25 % v13;
        v30 = v13 + (v14 >> 1) + (unsigned __int16)(v14 & v26);
        while (1)
        {
          v31 = 3 * v29;
          v32 = *(unsigned __int8 *)(v12 + (int)v31 + 1) | (*(unsigned __int8 *)(v12 + v31) << 8);
          if (v32 == v26)
          {
            v33 = *(_BYTE *)((int)v31 + v12 + 2);
            if (v18 == (v33 & 0x80))
              break;
          }
          v29 += v30;
          do
            v29 -= v13;
          while (v29 >= v13);
          if (v15 >= v28)
          {
            ++v28;
            v30 += 2 * (unsigned __int16)(v14 & v26);
            if (v32)
              continue;
          }
          goto LABEL_26;
        }
        a3[v22] = v27;
        a4[v22++] = v33 | 4;
LABEL_26:
        v20 += v21;
        if (v17 == (__int16)v20)
          break;
        ++v27;
      }
      while (v22 < 6);
    }
    a3[v22] = 0;
  }
  else
  {
    v22 = 0;
  }
  result = 0;
  *a5 = v22;
  return result;
}

uint64_t PRspace(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  _BYTE *v11;
  int v12;
  int v13;
  _BYTE *v14;
  int v15;
  unsigned __int16 v16;
  BOOL v17;
  _BOOL4 v18;
  int v20;
  uint64_t v21;

  if (!a2)
  {
    v21 = MEMORY[0x20];
    *MEMORY[0x20] = 0xE6FFFFFF93;
    v8 = 230;
LABEL_40:
    *(_WORD *)(v21 + 8) = 680;
    return v8;
  }
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 2);
  if (*(_BYTE *)(a3 + 27))
  {
    if (v5)
      goto LABEL_4;
    goto LABEL_39;
  }
  *(_BYTE *)(a3 + 27) = 1;
  if (!v5)
  {
LABEL_39:
    v21 = *(_QWORD *)(a2 + 32);
    *(_QWORD *)v21 = 0xDCFFFFFF89;
    v8 = 220;
    goto LABEL_40;
  }
LABEL_4:
  v7 = *(_QWORD *)(v5 + 64);
  if (!v7)
    return 0;
  v8 = 0;
  v9 = *(_QWORD *)(v5 + 64);
  do
  {
    if (v9 == v7)
    {
      v14 = *(_BYTE **)(v5 + 24);
      if (v14)
      {
        v15 = strlen(*(const char **)(v5 + 24));
        v16 = v15;
        v17 = v6 && (unsigned __int16)v15 >= v6;
        v18 = !v17;
        if ((unsigned __int16)v15 != *(unsigned __int8 *)(a3 + 27) && v18)
        {
          if ((_WORD)v15)
          {
            v20 = v15;
            while (*v14 == 32)
            {
              ++v14;
              if (!(_WORD)--v20)
                goto LABEL_35;
            }
          }
          else
          {
LABEL_35:
            if (!PRliveRule(a2, a3, 0, 0x34u, 82, 0, 1))
              v8 = Makerr(a2, a3, v7, 82, *(_WORD *)(v7 + 8) - v16, v16, a3 + 22);
          }
        }
      }
    }
    if (v9 != *(_QWORD *)(v5 + 80))
    {
      v10 = *(unsigned __int16 *)(v9 + 48);
      if ((v10 & 0xFFFE) == 2)
      {
        v11 = *(_BYTE **)(v9 + 40);
        v12 = *(unsigned __int16 *)(v9 + 48);
        while (*v11 == 32)
        {
          ++v11;
          if (!(_WORD)--v12)
          {
            v13 = *(unsigned __int8 *)(*(_QWORD *)(v9 + 24) + (unsigned __int16)(strlen(*(const char **)(v9 + 24)) - 1));
            if (v13 != 33
              && v13 != 63
              && (v13 != 46 || (*(_DWORD *)(v9 + 4) & 0x10000001) != 0)
              && !PRliveRule(a2, a3, 0, 0x34u, 81, 0, 1))
            {
              v8 = Makerr(a2, a3, v9, 81, *(_WORD *)(v9 + 32) + *(_WORD *)(v9 + 8), v10, a3 + 22);
            }
            break;
          }
        }
      }
    }
    v9 = *(_QWORD *)(v9 + 80);
  }
  while (v9);
  return v8;
}

uint64_t Makerr(uint64_t a1, uint64_t a2, uint64_t a3, int a4, __int16 a5, unsigned int a6, uint64_t a7)
{
  uint64_t v13;
  _WORD *v14;
  __int16 v15;
  uint64_t v16;
  char *v18;
  char *v19;
  uint64_t v20;
  int v22[2];

  *(_QWORD *)v22 = 0;
  v13 = PRmkErr(a1, a2, v22, a3, 0, 0x34u, a4);
  if (!(_DWORD)v13)
  {
    v14 = *(_WORD **)v22;
    **(_WORD **)v22 = a5;
    v14[1] = a6;
    if (a4 == 81)
    {
      v13 = 0;
      v14[4] = a5;
      v15 = a6 - 1;
LABEL_12:
      v14[5] = v15;
      return v13;
    }
    v16 = *(unsigned __int8 *)(a7 + 5);
    if (*(_BYTE *)(a2 + 20) != 16 && a6 > v16)
    {
      v13 = 0;
      v14[4] = a5;
      v15 = a6 - v16;
      goto LABEL_12;
    }
    v18 = (char *)malloc_type_calloc(v16 + 1, 1uLL, 0x100004077774924uLL);
    if (v18)
    {
      v19 = v18;
      memset(v18, 32, *(unsigned __int8 *)(a7 + 5));
      v19[*(unsigned __int8 *)(a7 + 5)] = 0;
      v13 = PRaddAlts(a1, *(uint64_t *)v22, v19, 0, 1uLL, 0);
      free(v19);
    }
    else
    {
      v20 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)v20 = 0xDC00000078;
      *(_WORD *)(v20 + 8) = 680;
      return 220;
    }
  }
  return v13;
}

uint64_t PRss(_BYTE *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, char a7)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v17;
  char *v18;
  int v19;
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
  int v32;
  char v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int8 *v37;
  uint64_t v38;
  char *v39;
  int v40;
  uint64_t v41;
  int v42;
  char v43;
  unsigned __int8 *v44;
  unsigned int v45;
  int v46;
  uint64_t v47;
  BOOL v48;
  int v49;
  int v50;
  int v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  unsigned __int8 v56;
  unsigned __int8 *v57;
  unsigned int v58;
  int v59;
  BOOL v60;
  _BOOL4 v62;
  int v64;
  unsigned __int8 v65;
  unsigned __int8 *v66;
  int v67;
  BOOL v68;
  unsigned int v69;
  int v70;
  int v71;
  uint64_t v72;
  int v73;
  char *v74;
  unsigned __int8 v75;
  int v76;
  unsigned __int8 *v77;
  unsigned int v78;
  int v79;
  BOOL v80;
  int v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  int v86;
  unsigned int v87;
  char *v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  _DWORD *v101;
  unsigned int v102;
  unsigned __int16 v103;
  __int16 v104;
  unsigned int v105;
  char *v106;
  int v107;
  unsigned __int16 *v108;
  uint64_t v109;
  unsigned __int16 *v110;
  int v111;
  unsigned __int16 v112;
  uint64_t v113;
  unsigned __int16 v114;
  __int16 *v115;
  __int16 v116;
  uint64_t v117;
  __int16 *v118;
  __int16 v119;
  int v120;
  uint64_t v121;
  unsigned int v122;
  unsigned __int16 v123;
  unsigned __int16 *v124;
  uint64_t v125;
  uint64_t v126;
  unsigned __int16 *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  unsigned __int16 v132;
  char *v133;
  __int16 v134;
  unsigned int v135;
  int v136;
  unsigned int v137;
  int v138;
  int v139;
  unsigned int v140;
  int v141;
  unsigned int v142;
  unsigned int v143;
  int v144;
  int v145;
  int v146;
  __int16 v147;
  unint64_t v148;
  char *v149;
  unsigned int v150;
  int v151;
  int v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  int v156;
  int v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  unsigned __int16 *v162;
  unsigned __int16 *v163;
  uint64_t v164;
  unsigned __int16 *v165;
  int v166;
  int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  unsigned __int16 *v175;
  unsigned __int16 *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  int v181;
  int v182;
  uint64_t v183;
  unsigned __int16 v184;
  unsigned int v185;
  unsigned int v186;
  __int16 v187;
  __int16 v188;
  uint64_t v189;
  uint64_t v190;
  unsigned __int16 *v191;
  unsigned __int16 *v192;
  uint64_t v193;
  unsigned __int16 *v194;
  _BOOL4 v195;
  uint64_t v196;
  uint64_t v197;
  unsigned __int16 *v198;
  unsigned __int16 *v199;
  unsigned int v200;
  unsigned int v201;
  int v202;
  int v203;
  char *v204;
  char *v205;
  uint64_t v206;
  unsigned int v207;
  int v208;
  char *v209;
  char *v210;
  char *v211;
  unsigned __int16 v212;
  uint64_t v213;
  uint64_t v214;
  int v215;
  int v216;
  int v217;
  int v218;
  int v219;
  int v220;
  unsigned int v221;
  char *v222;
  unsigned int v223;
  unsigned int v224;
  unsigned int v225;
  unsigned int v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  unsigned int v230;
  unsigned int v231;
  unsigned int v232;
  unsigned int v233;
  int v234;
  unsigned int v235;
  unsigned int v236;
  unsigned int v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  int v242;
  __int128 v243;
  __int128 v244;
  void *v245[2];
  _OWORD v246[2];
  _OWORD v247[2];
  int v248;
  unsigned __int8 v249;
  unsigned __int8 v250;
  uint64_t v251;
  unsigned __int16 v252[8];
  uint64_t v253;

  v253 = *MEMORY[0x1E0C80C00];
  memset(v246, 0, sizeof(v246));
  v244 = 0u;
  *(_OWORD *)v245 = 0u;
  v243 = 0u;
  v8 = *(_QWORD *)(a3 + 16);
  if (!v8)
  {
    v9 = *(_QWORD *)(a3 + 32);
    v10 = 0xDCFFFFFC14;
    goto LABEL_5;
  }
  if (*(_QWORD *)(v8 + 56))
  {
    v9 = *(_QWORD *)(a3 + 32);
    v10 = 0xDCFFFFFC13;
LABEL_5:
    *(_QWORD *)v9 = v10;
    result = 220;
LABEL_6:
    *(_WORD *)(v9 + 8) = 1000;
    return result;
  }
  if (!*a1)
  {
    v9 = *(_QWORD *)(a3 + 32);
    *(_QWORD *)v9 = 0xE6FFFFFF9BLL;
    result = 230;
    goto LABEL_6;
  }
  if (!a6)
  {
    *(_BYTE *)(v8 + 3) = *(_BYTE *)(v8 + 2);
    *(_BYTE *)(v8 + 5) = *(_BYTE *)(v8 + 4);
    *(_BYTE *)(v8 + 7) = *(_BYTE *)(v8 + 6);
    *(_BYTE *)(v8 + 9) = *(_BYTE *)(v8 + 8);
    *(_BYTE *)(v8 + 11) = *(_BYTE *)(v8 + 10);
  }
  *(_QWORD *)&v244 = 0;
  v245[0] = 0;
  WORD4(v244) = 0;
  result = PRgrowWkBuf((void **)&v244, v245, (_WORD *)&v244 + 4, a3, a4);
  if ((_DWORD)result)
    return result;
  v245[1] = 0;
  LOWORD(v246[0]) = 0;
  result = PRgrowRaw(a3, (uint64_t)&v243);
  if ((_DWORD)result)
    return result;
  DWORD2(v246[0]) = 0;
  WORD1(v246[0]) = 0;
  WORD5(v244) = 0;
  *(_QWORD *)&v243 = a1;
  WORD4(v243) = a2;
  *((_QWORD *)&v246[1] + 1) = a5;
  *(_DWORD *)((char *)v246 + 13) = *(unsigned __int8 *)(v8 + 7);
  BYTE12(v246[0]) = *(_BYTE *)(v8 + 11);
  BYTE4(v246[0]) = a7;
  v249 = 0;
  v248 = 0;
  memset(v247, 0, sizeof(v247));
  v17 = SLLngToC(1, *(unsigned __int8 *)(a4 + 20));
  v18 = 0;
  v212 = 0;
  v213 = 0;
  v234 = 0;
  v203 = 0;
  v19 = 0;
  v227 = 0;
  v202 = 0;
  v207 = 0;
  v214 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = 0;
  v27 = 0;
  BYTE2(v247[0]) = 0;
  LOWORD(v247[0]) = 256;
  LOWORD(v248) = 0;
  BYTE11(v246[0]) = 0;
  v28 = a3;
  v29 = 0;
  v241 = a3;
  while (2)
  {
    v242 = v19;
    if ((unsigned __int16)v26 > 0xCu)
    {
      v31 = v27;
      v30 = v29;
      if ((_DWORD)v20)
        goto LABEL_19;
      goto LABEL_61;
    }
    if (!(_DWORD)v20 && (_WORD)v26)
    {
      v22 = 0;
      v23 = v21;
      v30 = v29;
      v31 = v27;
      goto LABEL_62;
    }
    v228 = v26;
    v231 = v21;
    v33 = 0;
    v34 = *(unsigned __int8 *)(v28 + 28);
    v35 = *(_QWORD *)(a4 + 64);
    v36 = v243;
    do
    {
      if (*(_BYTE *)(v28 + 28) && *(char *)(v243 + (unsigned __int16)a2) < 0)
        v37 = (unsigned __int8 *)(*(unsigned __int8 *)(v243 + (unsigned __int16)a2) + v17 - 128);
      else
        v37 = (unsigned __int8 *)(v243 + (unsigned __int16)a2);
      v38 = *v37;
      v21 = *(unsigned int *)(v35 + 4 * v38 + 16);
      if ((v21 & 0x800) != 0)
      {
        if ((_DWORD)v38 == *(unsigned __int8 *)(a4 + 23))
        {
          v33 = 1;
        }
        else if ((_DWORD)v38 == *(unsigned __int8 *)(a4 + 24))
        {
          v33 = 0;
        }
      }
      else if (!v33)
      {
        break;
      }
      ++a2;
    }
    while ((_DWORD)v38);
    v235 = v29;
    v238 = v27;
    if ((v21 & 0x1000) == 0)
      goto LABEL_34;
    v42 = a2 + 1;
    v31 = (v27 + 1);
    if ((int)v38 > 59)
    {
      if ((_DWORD)v38 != 62 && (_DWORD)v38 != 60)
        goto LABEL_34;
    }
    else if ((_DWORD)v38 != 45)
    {
      if ((_DWORD)v38 != 46)
        goto LABEL_34;
      v223 = v20;
      v204 = v18;
      v206 = v17;
      v53 = 0;
      LODWORD(v54) = 1;
      LODWORD(v20) = v27 + 1;
      v208 = a2 + 1;
      v30 = 1;
      v55 = 1;
      while (1)
      {
        v56 = 0;
        do
        {
          if (v34 && *(char *)(v36 + (unsigned __int16)v42) < 0)
            v57 = (unsigned __int8 *)(*(unsigned __int8 *)(v36 + (unsigned __int16)v42) + v17 - 128);
          else
            v57 = (unsigned __int8 *)(v36 + (unsigned __int16)v42);
          v58 = *v57;
          if ((*(_DWORD *)(v35 + 4 * v58 + 16) & 0x800) != 0)
          {
            if (v58 == *(unsigned __int8 *)(a4 + 23))
            {
              v56 = 1;
            }
            else if (v58 == *(unsigned __int8 *)(a4 + 24))
            {
              v56 = 0;
            }
          }
          v59 = *(_DWORD *)(v35 + 4 * v58 + 16) & 0x800 | v56;
          v48 = v59 == 0;
          v60 = v59 != 0;
          if (v48)
            v42 = (unsigned __int16)v42;
          else
            v42 = (unsigned __int16)v42 + 1;
        }
        while (v58 && v60);
        if ((_DWORD)v53 && v58 != 32)
        {
          v42 = v208;
          v18 = v204;
          v20 = v223;
          goto LABEL_373;
        }
        v62 = (unsigned __int16)v54 == 1 || (_DWORD)v53 != 0;
        if (v58 == 32 && v62)
        {
          if ((unsigned __int16)v20 >= WORD4(v244))
          {
            v220 = v54;
            v215 = v55;
            v64 = PRgrowWkBuf((void **)&v244, v245, (_WORD *)&v244 + 4, v28, a4);
            v55 = v215;
            LODWORD(v54) = v220;
            v28 = v241;
            if (v64)
              return 220;
          }
          if ((v20 & 0xF) == 0 && *(_BYTE *)(*(_QWORD *)(a4 + 64) + 1040))
            *((_WORD *)v245[0] + ((unsigned __int16)v20 >> 4)) = v42;
          v65 = 0;
          *(_BYTE *)(v244 + (unsigned __int16)v20) = 32;
          LOWORD(v42) = v42 + 1;
          do
          {
            if (*(_BYTE *)(v28 + 28) && *(char *)(v243 + (unsigned __int16)v42) < 0)
              v66 = (unsigned __int8 *)(*(unsigned __int8 *)(v243 + (unsigned __int16)v42) + v17 - 128);
            else
              v66 = (unsigned __int8 *)(v243 + (unsigned __int16)v42);
            v58 = *v66;
            if ((*(_DWORD *)(*(_QWORD *)(a4 + 64) + 4 * v58 + 16) & 0x800) != 0)
            {
              if (v58 == *(unsigned __int8 *)(a4 + 23))
              {
                v65 = 1;
              }
              else if (v58 == *(unsigned __int8 *)(a4 + 24))
              {
                v65 = 0;
              }
            }
            v67 = *(_DWORD *)(*(_QWORD *)(a4 + 64) + 4 * v58 + 16) & 0x800 | v65;
            v48 = v67 == 0;
            v68 = v67 != 0;
            if (v48)
              v42 = (unsigned __int16)v42;
            else
              v42 = (unsigned __int16)v42 + 1;
          }
          while (v58 && v68);
          LODWORD(v54) = v54 + 1;
          LODWORD(v20) = v20 + 1;
          v53 = 1;
        }
        if (v58 != 46)
          break;
        v69 = (unsigned __int16)v20;
        if ((unsigned __int16)v20 >= WORD4(v244))
        {
          v221 = v30;
          v216 = v20;
          v70 = v54;
          v71 = v55;
          v72 = v53;
          v73 = PRgrowWkBuf((void **)&v244, v245, (_WORD *)&v244 + 4, v28, a4);
          v53 = v72;
          v55 = v71;
          LODWORD(v54) = v70;
          LODWORD(v20) = v216;
          v17 = v206;
          v30 = v221;
          v28 = v241;
          if (v73)
            return 220;
        }
        if ((v69 & 0xF) == 0 && *(_BYTE *)(*(_QWORD *)(a4 + 64) + 1040))
          *((_WORD *)v245[0] + (v69 >> 4)) = v42;
        *(_BYTE *)(v244 + (unsigned __int16)v20) = 46;
        v54 = (v54 + 1);
        ++v42;
        v20 = (v20 + 1);
        if ((unsigned __int16)v55 == 3)
        {
          LOWORD(v27) = v238;
        }
        else
        {
          LOWORD(v27) = v238;
          if ((unsigned __int16)v55 != 1 || *(_BYTE *)(a4 + 20) == 10 && !(_DWORD)v53)
          {
            v208 = v42;
            v31 = v20;
            v30 = v54;
          }
        }
        ++v55;
        v34 = *(unsigned __int8 *)(v28 + 28);
        v35 = *(_QWORD *)(a4 + 64);
        v36 = v243;
      }
      v42 = v208;
      v18 = v204;
      v20 = v223;
      goto LABEL_372;
    }
    v224 = v20;
    v74 = v18;
    v30 = 1;
    while (1)
    {
      v75 = 0;
      LOWORD(v76) = v42;
      do
      {
        if (v34 && *(char *)(v36 + (unsigned __int16)v76) < 0)
          v77 = (unsigned __int8 *)(*(unsigned __int8 *)(v36 + (unsigned __int16)v76) + v17 - 128);
        else
          v77 = (unsigned __int8 *)(v36 + (unsigned __int16)v76);
        v78 = *v77;
        if ((*(_DWORD *)(v35 + 4 * v78 + 16) & 0x800) != 0)
        {
          if (v78 == *(unsigned __int8 *)(a4 + 23))
          {
            v75 = 1;
          }
          else if (v78 == *(unsigned __int8 *)(a4 + 24))
          {
            v75 = 0;
          }
        }
        v79 = *(_DWORD *)(v35 + 4 * v78 + 16) & 0x800 | v75;
        v48 = v79 == 0;
        v80 = v79 != 0;
        if (v48)
          v76 = (unsigned __int16)v76;
        else
          v76 = (unsigned __int16)v76 + 1;
      }
      while (v78 && v80);
      if (v78 != (_DWORD)v38)
        break;
      if ((unsigned __int16)v31 >= WORD4(v244))
      {
        v81 = PRgrowWkBuf((void **)&v244, v245, (_WORD *)&v244 + 4, v28, a4);
        v28 = v241;
        if (v81)
          return 220;
      }
      if ((v31 & 0xF) == 0 && *(_BYTE *)(*(_QWORD *)(a4 + 64) + 1040))
        *((_WORD *)v245[0] + ((unsigned __int16)v31 >> 4)) = v76;
      *(_BYTE *)(v244 + (unsigned __int16)v31) = v38;
      v30 = (v30 + 1);
      v42 = v76 + 1;
      v31 = (v31 + 1);
      v34 = *(unsigned __int8 *)(v28 + 28);
      v35 = *(_QWORD *)(a4 + 64);
      v36 = v243;
    }
    v18 = v74;
    v20 = v224;
    if ((_DWORD)v38 == 45)
    {
      LOWORD(v27) = v238;
      if (*(_BYTE *)(a4 + 20) == 6 && (unsigned __int16)v30 == 2)
        goto LABEL_34;
      goto LABEL_373;
    }
LABEL_372:
    LOWORD(v27) = v238;
LABEL_373:
    if ((unsigned __int16)v30 >= 2u)
    {
      v39 = v18;
      if (WORD4(v244) <= (unsigned __int16)v27)
      {
        v166 = PRgrowWkBuf((void **)&v244, v245, (_WORD *)&v244 + 4, v28, a4);
        v28 = v241;
        if (v166)
          return 220;
      }
      v41 = v238;
      if ((v238 & 0xF) == 0 && *(_BYTE *)(*(_QWORD *)(a4 + 64) + 1040))
        *((_WORD *)v245[0] + ((unsigned __int16)v238 >> 4)) = a2;
      *(_BYTE *)(v244 + (unsigned __int16)v238) = v38;
      goto LABEL_40;
    }
LABEL_34:
    v39 = v18;
    if (WORD4(v244) <= (unsigned __int16)v27)
    {
      v40 = PRgrowWkBuf((void **)&v244, v245, (_WORD *)&v244 + 4, v28, a4);
      v28 = v241;
      if (v40)
        return 220;
    }
    v41 = v238;
    if ((v238 & 0xF) == 0 && *(_BYTE *)(*(_QWORD *)(a4 + 64) + 1040))
      *((_WORD *)v245[0] + ((unsigned __int16)v238 >> 4)) = a2;
    *(_BYTE *)(v244 + (unsigned __int16)v238) = v38;
    v31 = (v238 + 1);
    v42 = a2 + 1;
    v30 = 1;
LABEL_40:
    v18 = v39;
    if ((v21 & 0x400) != 0)
    {
      v43 = 0;
      while (1)
      {
        a2 = v42;
        if (*(_BYTE *)(v28 + 28) && *(char *)(v243 + (unsigned __int16)v42) < 0)
          v44 = (unsigned __int8 *)(*(unsigned __int8 *)(v243 + (unsigned __int16)v42) + v17 - 128);
        else
          v44 = (unsigned __int8 *)(v243 + (unsigned __int16)v42);
        v45 = *v44;
        v46 = *(_DWORD *)(*(_QWORD *)(a4 + 64) + 4 * v45 + 16);
        if ((v46 & 0x800) != 0)
          break;
        if (v43)
        {
LABEL_58:
          ++v42;
          if (!v45)
            goto LABEL_59;
        }
        else
        {
          v43 = 0;
          v47 = v46 & 0x2000000;
          ++v42;
          if (v45)
            v48 = v47 == 0;
          else
            v48 = 1;
          if (v48)
            goto LABEL_60;
        }
      }
      if (v45 == *(unsigned __int8 *)(a4 + 23))
      {
        v43 = 1;
      }
      else if (v45 == *(unsigned __int8 *)(a4 + 24))
      {
        v43 = 0;
      }
      goto LABEL_58;
    }
LABEL_59:
    a2 = v42;
LABEL_60:
    v25 = v41;
    v24 = v235;
    v23 = v231;
    v22 = v20;
    v20 = v38;
    v26 = v228;
    if ((_DWORD)v38)
    {
LABEL_19:
      v32 = 0;
      goto LABEL_64;
    }
LABEL_61:
    v29 = v24;
    v27 = v25;
LABEL_62:
    if (!BYTE4(v246[0]))
      goto LABEL_500;
    v20 = 0;
    v32 = 1;
    BYTE11(v246[0]) = 1;
    v24 = v29;
    v25 = v27;
LABEL_64:
    v29 = v30;
    v27 = v31;
    v49 = v242;
    v50 = 0x10000;
    v51 = v242;
    switch((__int16)v26)
    {
      case 0:
        if ((v21 & 0x2000000) == 0)
          goto LABEL_166;
        WORD3(v246[0]) = v31 - 1;
        goto LABEL_235;
      case 1:
        if ((v21 & 0x2000000) == 0)
        {
          WORD4(v246[0]) = v31 + ~WORD3(v246[0]);
LABEL_166:
          v26 = 23;
          goto LABEL_319;
        }
        if (!v32)
        {
LABEL_235:
          v26 = 1;
LABEL_319:
          v51 = v49;
LABEL_320:
          v19 = v51;
          if (v249)
            goto LABEL_504;
          continue;
        }
        WORD4(v246[0]) = v31 + ~WORD3(v246[0]);
LABEL_504:
        v197 = v28;
        result = PRnormalize(v28, a4, (uint64_t)&v243);
        if (!(_DWORD)result)
        {
          result = PRssPost(v197, a4, (uint64_t)&v243);
          if (!(_DWORD)result)
          {
            PRssTidyUp((uint64_t)&v243);
            return 0;
          }
        }
        return result;
      case 2:
        v82 = *((unsigned __int16 *)v18 + 9);
        if (v82 > 7)
        {
          *((_DWORD *)v18 + 5) = 0x10000000;
          v83 = v18 + 2;
        }
        else
        {
          *((_WORD *)v18 + 9) = v82 + 1;
          v83 = &v18[2 * v82 + 2];
        }
        *(_WORD *)v83 += v24;
        if ((v21 & 4) != 0)
          goto LABEL_285;
        if ((v21 & 0x1000000) != 0)
        {
          v140 = *((_DWORD *)v18 + 5) & 0xBFFFFFFF;
          goto LABEL_341;
        }
        if ((v21 & 0x2000000) != 0)
          goto LABEL_306;
        if ((v21 & 0x40000000) != 0)
          *((_DWORD *)v18 + 5) |= 0x8000u;
        if ((v23 & 0x8000) != 0)
        {
          v135 = *((_DWORD *)v18 + 5) | 0x8000000;
        }
        else
        {
          if ((v23 & 1) == 0)
            goto LABEL_398;
          v135 = *((_DWORD *)v18 + 5) | 0x4000000;
        }
        goto LABEL_397;
      case 3:
        v84 = *((unsigned __int16 *)v18 + 9);
        if (v84 > 7)
        {
          *((_DWORD *)v18 + 5) = 0x10000000;
          v85 = v18 + 2;
        }
        else
        {
          *((_WORD *)v18 + 9) = v84 + 1;
          v85 = &v18[2 * v84 + 2];
        }
        *(_WORD *)v85 += v24;
        if ((v23 & 0x800000) != 0)
        {
          *((_DWORD *)v18 + 5) |= 0x4000u;
          BYTE4(v247[1]) = v22;
          WORD3(v247[1]) = v25 - v24;
          WORD4(v247[1]) = v24;
          HIDWORD(v247[1]) = v23;
        }
        if ((v21 & 0x1000000) != 0)
        {
          v139 = *((_DWORD *)v18 + 5);
          *((_DWORD *)v18 + 5) = v139 & 0xBFFFFFFF;
          if ((v21 & 2) == 0)
          {
            v140 = v139 & 0xBFFFBFFF;
LABEL_341:
            *((_DWORD *)v18 + 5) = v140;
          }
          goto LABEL_344;
        }
        if ((v21 & 0x2000000) != 0)
        {
LABEL_306:
          v26 = 12;
          goto LABEL_319;
        }
        if ((v23 & 0x8000) != 0)
          v136 = 0x8000000;
        else
          v136 = (v23 & 1) << 26;
        v135 = *((_DWORD *)v18 + 5) & 0xFFFFBFFF | v136;
LABEL_397:
        *((_DWORD *)v18 + 5) = v135;
        goto LABEL_398;
      case 4:
        if ((_DWORD)v214)
          goto LABEL_174;
        v51 = HIDWORD(v214);
        if (HIDWORD(v214))
        {
          v49 = 0;
          v234 = 0;
          *((_DWORD *)v18 + 7) = v23;
          WORD2(v213) = 1;
LABEL_174:
          v86 = v21;
          if ((v21 & 0x10000000) != 0)
          {
            ++WORD2(v213);
            if (HIDWORD(v214))
            {
              *((_DWORD *)v18 + 7) |= v21;
              v214 = 0x100000001;
              goto LABEL_398;
            }
            v167 = *((_DWORD *)v18 + 6);
            v51 = v49;
            goto LABEL_394;
          }
          v87 = *((unsigned __int16 *)v18 + 9);
          v51 = v49;
        }
        else
        {
          v87 = *((unsigned __int16 *)v18 + 9);
          *((_DWORD *)v18 + 6) = v23;
          v86 = v21;
          if ((v21 & 0x10000000) != 0)
          {
            WORD2(v213) = 2;
            v167 = v23;
            v234 = HIDWORD(v214);
            v212 = v87;
LABEL_394:
            HIDWORD(v214) = 0;
            *((_DWORD *)v18 + 6) = v167 | v21;
            goto LABEL_395;
          }
          WORD2(v213) = 1;
          v212 = v87;
          v234 = HIDWORD(v214);
        }
        if (v87 > 7)
        {
          *((_DWORD *)v18 + 5) = 0x10000000;
          v88 = v18 + 2;
        }
        else
        {
          *((_WORD *)v18 + 9) = v87 + 1;
          v88 = &v18[2 * v87 + 2];
        }
        *(_WORD *)v88 += WORD2(v213);
        if ((*(_QWORD *)&v86 & 0x800000) != 0)
          v142 = 5;
        else
          v142 = 7;
        if ((v86 & 0x2000000) != 0)
          v26 = 8;
        else
          v26 = v142;
        LODWORD(v214) = 0;
        v143 = v207;
        if ((v86 & 0x2000000) == 0)
          v143 = v20;
        v207 = v143;
        if ((v86 & 0x2000000) != 0)
          v144 = v202;
        else
          v144 = v31 - v29;
        v202 = v144;
        v145 = HIDWORD(v227);
        if ((v86 & 0x2000000) == 0)
          v145 = v29;
        HIDWORD(v227) = v145;
        v48 = (v86 & 0x2000000) == 0;
        v146 = v213;
        if (v48)
          v146 = v21;
        LODWORD(v213) = v146;
        goto LABEL_320;
      case 5:
        v89 = *((unsigned __int16 *)v18 + 9);
        if (v89 > 7)
        {
          *((_DWORD *)v18 + 5) = 0x10000000;
          v90 = v18 + 2;
        }
        else
        {
          *((_WORD *)v18 + 9) = v89 + 1;
          v90 = &v18[2 * v89 + 2];
        }
        *(_WORD *)v90 += v24;
        ++v234;
        if ((v21 & 0x800000) != 0)
        {
          v26 = 5;
          goto LABEL_319;
        }
        BYTE4(v247[1]) = v22;
        WORD3(v247[1]) = v25 - v24;
        WORD4(v247[1]) = v24;
        HIDWORD(v247[1]) = v23;
        v51 = v23 | v242;
        if ((v21 & 2) != 0)
          goto LABEL_283;
        if ((v21 & 0x1000000) != 0)
          goto LABEL_342;
        if ((v21 & 0x2000000) != 0)
          v26 = 9;
        else
          v26 = 25;
        goto LABEL_320;
      case 6:
        v91 = *((unsigned __int16 *)v18 + 9);
        if (v91 > 7)
        {
          *((_DWORD *)v18 + 5) = 0x10000000;
          v92 = v18 + 2;
        }
        else
        {
          *((_WORD *)v18 + 9) = v91 + 1;
          v92 = &v18[2 * v91 + 2];
        }
        *(_WORD *)v92 += v24;
        ++v234;
        v51 = v23 | v242;
        if ((v21 & 0x800000) != 0)
        {
          v26 = 5;
        }
        else if ((v21 & 2) != 0)
        {
LABEL_283:
          v26 = 6;
        }
        else if ((v21 & 0x1000000) != 0)
        {
LABEL_342:
          v26 = 7;
        }
        else if ((v21 & 0x2000000) != 0)
        {
          v26 = 10;
        }
        else
        {
          v26 = 25;
        }
        goto LABEL_320;
      case 7:
        v93 = *((unsigned __int16 *)v18 + 9);
        if (v93 > 7)
        {
          *((_DWORD *)v18 + 5) = 0x10000000;
          v94 = v18 + 2;
        }
        else
        {
          *((_WORD *)v18 + 9) = v93 + 1;
          v94 = &v18[2 * v93 + 2];
        }
        *(_WORD *)v94 += v24;
        ++v234;
        v51 = v23 | v242;
        if ((v21 & 0x2000000) != 0)
          v137 = 11;
        else
          v137 = 25;
        if ((v21 & 0x1000000) != 0)
          v137 = 7;
        if ((v21 & 0x800000) != 0)
          v26 = 5;
        else
          v26 = v137;
        goto LABEL_320;
      case 8:
        goto LABEL_293;
      case 9:
      case 10:
      case 11:
        if (WORD2(v227) != 1)
          goto LABEL_290;
        if ((v213 & 1) != 0)
        {
          v52 = 0x800000;
        }
        else if ((v213 & 0x8000) != 0)
        {
          v52 = 0x1000000;
        }
        else
        {
          if (v207 != 46)
            goto LABEL_290;
          v52 = 0x400000;
        }
        *((_DWORD *)v18 + 5) |= v52;
LABEL_290:
        if ((unsigned __int16)(v26 - 9) <= 2u)
        {
          v50 = dword_1DE2F1B9C[(__int16)(v26 - 9)];
LABEL_292:
          *((_DWORD *)v18 + 5) |= v50;
        }
LABEL_293:
        if (v32)
        {
          LOBYTE(v246[1]) = 1;
          LODWORD(v26) = 24;
        }
        if (*(_BYTE *)(a4 + 22))
        {
          if ((_DWORD)v22 == *(unsigned __int8 *)(a4 + 22))
            LOBYTE(v246[1]) = 1;
          goto LABEL_314;
        }
        if ((int)v22 > 12)
        {
          if ((_DWORD)v22 != 13)
          {
            if ((_DWORD)v22 == 32)
              ++LOWORD(v247[1]);
            goto LABEL_308;
          }
          ++HIWORD(v247[0]);
          LODWORD(v247[1]) = 0;
        }
        else
        {
          v141 = v227;
          if ((_DWORD)v22 == 9)
          {
            ++WORD1(v247[1]);
LABEL_308:
            v141 = v227;
            goto LABEL_311;
          }
          if ((_DWORD)v22 != 10)
            goto LABEL_311;
          if (!(_BYTE)v227)
          {
            ++HIWORD(v247[0]);
            v141 = 0;
            LODWORD(v247[1]) = 0;
            goto LABEL_311;
          }
        }
        v141 = 1;
LABEL_311:
        if ((_DWORD)v22 != 13)
          v141 = 0;
        LODWORD(v227) = v141;
LABEL_314:
        if ((_DWORD)v22)
          ++*((_WORD *)v18 + 18);
        if ((v21 & 0x2000000) != 0)
          v26 = v26;
        else
          v26 = 24;
        goto LABEL_319;
      case 12:
        goto LABEL_292;
      case 13:
      case 14:
      case 15:
      case 16:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
        goto LABEL_320;
      case 23:
        v95 = WORD1(v246[0]);
        if (WORD1(v246[0]) < LOWORD(v246[0]))
          goto LABEL_187;
        v236 = v29;
        v225 = v20;
        v96 = v21;
        v97 = v24;
        v98 = v25;
        v99 = v22;
        v100 = v23;
        result = PRgrowRaw(v28, (uint64_t)&v243);
        if ((_DWORD)result)
          goto LABEL_499;
        v95 = WORD1(v246[0]);
        v28 = v241;
        v27 = v31;
        v23 = v100;
        v22 = v99;
        v25 = v98;
        v24 = v97;
        v21 = v96;
        v20 = v225;
        v29 = v236;
LABEL_187:
        v101 = v245[1];
        WORD1(v246[0]) = v95 + 1;
        v18 = (char *)v245[1] + 40 * v95;
        *(_WORD *)v18 = v27 - v29;
        WORD1(v247[1]) = 0;
        *(_DWORD *)((char *)v247 + 14) = 0;
        *(_WORD *)((char *)v246 + 15) = 0;
        BYTE4(v247[1]) = 0;
        *(_DWORD *)((char *)&v247[1] + 6) = 0;
        HIDWORD(v247[1]) = 0;
        if ((v21 & 4) != 0)
        {
          HIDWORD(v214) = 0;
          LODWORD(v227) = 0;
          v101[10 * v95 + 5] |= 0xC0000000;
LABEL_285:
          v26 = 2;
        }
        else if ((v21 & 0x1000000) != 0)
        {
          HIDWORD(v214) = 0;
          LODWORD(v227) = 0;
          v101[10 * v95 + 5] |= 0x80000000;
LABEL_344:
          v26 = 3;
        }
        else
        {
          HIDWORD(v214) = 0;
          LODWORD(v227) = 0;
          if ((v21 & 0x40000000) != 0)
            v101[10 * v95 + 5] |= 0x8000u;
LABEL_398:
          v26 = 4;
        }
        goto LABEL_319;
      case 24:
        v102 = *((unsigned __int16 *)v18 + 9);
        if (*((_DWORD *)v18 + 6))
          v103 = v212;
        else
          v103 = *((_WORD *)v18 + 9);
        *((_WORD *)v18 + 16) = v103;
        v104 = v102 - v234;
        if (v102 < (unsigned __int16)v234)
          v104 = 0;
        *((_WORD *)v18 + 17) = v104;
        v105 = HIWORD(v247[0]);
        if (!HIWORD(v247[0]))
          goto LABEL_198;
        *((_DWORD *)v18 + 5) |= 0x1000u;
        if (*(_BYTE *)(a4 + 22) || !*(_BYTE *)(*((_QWORD *)&v246[1] + 1) + 1))
          goto LABEL_198;
        if (v105 > *(unsigned __int8 *)(*((_QWORD *)&v246[1] + 1) + 1))
          goto LABEL_347;
        v168 = *(unsigned __int8 *)(*((_QWORD *)&v246[1] + 1) + 2);
        v169 = *(unsigned __int8 *)(*((_QWORD *)&v246[1] + 1) + 4);
        if (v168 | v169)
          goto LABEL_389;
        if (*(_BYTE *)(*((_QWORD *)&v246[1] + 1) + 3) || *(_BYTE *)(*((_QWORD *)&v246[1] + 1) + 5))
        {
          v169 = 0;
LABEL_389:
          if (v169 + v168 <= LOWORD(v247[1])
            && *(unsigned __int8 *)(*((_QWORD *)&v246[1] + 1) + 5)
             + *(unsigned __int8 *)(*((_QWORD *)&v246[1] + 1) + 3) <= WORD1(v247[1]))
          {
LABEL_347:
            LOBYTE(v246[1]) = 1;
          }
        }
LABEL_198:
        v237 = v29;
        v226 = v20;
        v205 = v18;
        v250 = 0;
        v106 = (char *)v245[1];
        v107 = WORD1(v246[0]) - 1;
        v108 = (unsigned __int16 *)((char *)v245[1] + 40 * v107);
        v109 = *(_QWORD *)(a4 + 8);
        v229 = *(_QWORD *)(a4 + 64);
        v110 = v108 + 10;
        v111 = *((_DWORD *)v108 + 5);
        if ((v111 & 0x400000) == 0
          && ((*((_DWORD *)v108 + 5) & 0x9000000) == 0 || *((_DWORD *)v245[1] + 10 * v107 + 7))
          && ((v111 & 0x8000) == 0 || *(_BYTE *)(a4 + 20) != 6 || !BYTE2(v247[0])))
        {
          goto LABEL_361;
        }
        v112 = *v108;
        if (*((unsigned __int16 *)v245[1] + 20 * v107 + 16) >= 8u)
          v113 = 8;
        else
          v113 = *((unsigned __int16 *)v245[1] + 20 * v107 + 16);
        v114 = *v108;
        if ((_DWORD)v113)
        {
          v115 = (__int16 *)((char *)v245[1] + 40 * WORD1(v246[0]) - 38);
          v114 = *v108;
          do
          {
            v116 = *v115++;
            v114 += v116;
            --v113;
          }
          while (v113);
        }
        if (*((unsigned __int16 *)v245[1] + 20 * v107 + 17) >= 8u)
          v117 = 8;
        else
          v117 = *((unsigned __int16 *)v245[1] + 20 * v107 + 17);
        v239 = v27;
        if ((_DWORD)v117)
        {
          v118 = (__int16 *)((char *)v245[1] + 40 * WORD1(v246[0]) - 38);
          do
          {
            v119 = *v118++;
            v112 += v119;
            --v117;
          }
          while (v117);
        }
        if ((__int16)(v112 - v114) <= 15)
        {
          v120 = v112;
          v121 = v244;
          v222 = (char *)v245[1] + 40 * v107;
          v232 = v21;
          if (v112 <= v114)
          {
            v127 = v108 + 10;
            v128 = v24;
            v129 = v25;
            v130 = v23;
            v123 = 0;
          }
          else
          {
            v122 = v114;
            v123 = v112 - v114;
            v124 = v252;
            v125 = v120 - v114;
            do
            {
              v126 = *(unsigned __int8 *)(v121 + v122);
              if ((*(_DWORD *)(v109 + 4 * v126) & 0x40000000) != 0)
                LOBYTE(v126) = v126 + 32;
              *(_BYTE *)v124 = v126;
              v124 = (unsigned __int16 *)((char *)v124 + 1);
              ++v122;
              --v125;
            }
            while (v125);
            v127 = v108 + 10;
            v128 = v24;
            v129 = v25;
            v130 = v23;
          }
          *((_BYTE *)v252 + v123) = 0;
          v150 = SLcap(v121, (__int16)v114, (__int16)(v120 - 1), &v251, v109);
          result = PRSSWdGet((const char *)v252, v150, &v106[40 * v107 + 38], a4);
          v28 = v241;
          v23 = v130;
          v25 = v129;
          v24 = v128;
          v21 = v232;
          v108 = (unsigned __int16 *)v222;
          v110 = v127;
          if ((_DWORD)result)
            goto LABEL_499;
        }
        v27 = v239;
LABEL_361:
        if (BYTE12(v246[0]))
        {
          if (BYTE13(v246[0]))
            goto LABEL_363;
          v233 = v21;
          v158 = v22;
          v159 = v23;
          v160 = v25;
          v161 = v27;
          v162 = v108;
          v217 = v107;
          v209 = v106;
          v163 = v108;
          v164 = v24;
          v165 = v110;
          PRisListEnum(v162, (uint64_t)&v243, (char *)&v250);
          v110 = v165;
          v24 = v164;
          v108 = v163;
          v106 = v209;
          v107 = v217;
          v25 = v160;
          v23 = v159;
          v22 = v158;
          v27 = v161;
          v28 = v241;
          v151 = 0;
          BYTE13(v246[0]) = v250;
          v156 = v250;
          v157 = 1;
          v152 = v250;
        }
        else
        {
          if (!BYTE13(v246[0]))
          {
            BYTE12(v246[0]) = 0;
LABEL_411:
            v171 = BYTE2(v247[0]);
            goto LABEL_415;
          }
          BYTE14(v246[0]) = 1;
          if (!LOBYTE(v247[0]))
          {
LABEL_363:
            v151 = 0;
            v152 = 0;
            BYTE12(v246[0]) = 0;
            goto LABEL_402;
          }
          v198 = v110;
          v233 = v21;
          v153 = v24;
          v200 = v25;
          v154 = v23;
          v155 = v27;
          PRisListEnum(v108, (uint64_t)&v243, (char *)&v250);
          v156 = BYTE13(v246[0]);
          v152 = v250;
          if (BYTE13(v246[0]) == v250)
          {
            --WORD1(v246[0]);
            v151 = 1;
            v249 = 1;
            v157 = 0;
            if (BYTE2(v247[0]))
              HIBYTE(v246[0]) = 1;
            v152 = BYTE13(v246[0]);
          }
          else
          {
            v151 = 0;
            LOWORD(v247[0]) = 0;
            v157 = 1;
          }
          v28 = v241;
          v27 = v155;
          v23 = v154;
          v25 = v200;
          v24 = v153;
          v110 = v198;
        }
        BYTE12(v246[0]) = 0;
        v21 = v233;
        if (!v156)
        {
          if (!v157)
            goto LABEL_450;
          goto LABEL_411;
        }
LABEL_402:
        v170 = *(_DWORD *)v110;
        if ((*(_DWORD *)v110 & 0x1000) != 0)
        {
          LOBYTE(v247[0]) = 1;
          if ((v170 & 0x4000) != 0)
          {
            BYTE2(v247[0]) = 1;
            BYTE8(v247[0]) = BYTE4(v247[1]);
            DWORD1(v247[0]) = *(_DWORD *)((char *)&v247[1] + 6);
            WORD6(v247[0]) = WORD1(v246[0]);
            WORD5(v247[0]) = WORD1(v246[0]);
          }
        }
        v171 = BYTE2(v247[0]);
        if (BYTE2(v247[0]) && WORD5(v247[0]) != WORD1(v246[0]) && BYTE8(v247[0]) == 58)
        {
          if (v152)
          {
            WORD1(v246[0]) = WORD5(v247[0]);
            BYTE12(v246[0]) = 1;
            v249 = 1;
            goto LABEL_450;
          }
          v171 = 0;
          BYTE2(v247[0]) = 0;
        }
        if (v151 || BYTE1(v247[0]))
          goto LABEL_450;
LABEL_415:
        if (!v171 || WORD5(v247[0]) == WORD1(v246[0]))
          goto LABEL_445;
        v172 = *(unsigned __int8 *)(a4 + 20);
        if ((*(_DWORD *)v110 & 0x8000) != 0)
        {
          if (v172 == 6)
          {
            v175 = v110;
            v218 = v107;
            v210 = v106;
            v176 = v108;
            v177 = v21;
            v178 = v24;
            v179 = v25;
            v180 = v23;
            v240 = v27;
            result = PRgermScan(v28, a4, (uint64_t)&v243, (uint64_t)v247, &v249);
            if ((_DWORD)result)
              goto LABEL_499;
            v181 = v249;
            v23 = v180;
            v25 = v179;
            v24 = v178;
            v21 = v177;
            v110 = v175;
LABEL_428:
            v27 = v240;
            v28 = v241;
            v108 = v176;
            v106 = v210;
            v107 = v218;
            if (v181)
              goto LABEL_449;
            goto LABEL_445;
          }
          if (BYTE8(v247[0]) != 46
            || WORD3(v247[0]) != 1
            || (*((char *)v245[1] + 40 * WORD5(v247[0]) - 2) & 0x80000000) == 0
            && WORD2(v247[0]) >= 2u
            && ((v182 = *(unsigned __int8 *)(v244 + WORD2(v247[0]) - 1),
                 v183 = *(unsigned __int8 *)(v244 + WORD2(v247[0]) - 2),
                 (*(_DWORD *)(v229 + 16 + 4 * *(unsigned __int8 *)(v244 + WORD2(v247[0]) - 1)) & 0x40000000) == 0)
             || (*(_DWORD *)(v229 + 16 + 4 * v183) & 0x3000000) == 0)
            && ((v182 != 114 || (_DWORD)v183 != 68) && (v182 != 116 || (_DWORD)v183 != 83)
             || WORD5(v247[0]) >= 3u && (*((_BYTE *)v245[1] + 40 * WORD5(v247[0]) - 59) & 0x80) != 0))
          {
            WORD1(v246[0]) = WORD6(v247[0]);
            goto LABEL_448;
          }
          BYTE2(v247[0]) = 0;
        }
        else
        {
          v240 = v27;
          if (v172 == 11)
          {
            if ((*(_DWORD *)v110 & 0x8000000) == 0)
              goto LABEL_444;
            if ((v106[40 * v107 + 38] & 0x10) == 0)
            {
              if (*(unsigned __int16 *)&v106[40 * v107 + 18] >= 4u)
              {
                v219 = v107;
                v189 = v23;
                v190 = v25;
                v191 = v108;
                v211 = v106;
                v192 = v108;
                v193 = v24;
                v194 = v110;
                v195 = PRisDutchOpenCompound(*(_QWORD *)(a4 + 64), (uint64_t)&v243, v191);
                v110 = v194;
                v24 = v193;
                v108 = v192;
                v106 = v211;
                v25 = v190;
                v23 = v189;
                v107 = v219;
                v28 = v241;
                if (v195)
                {
                  WORD1(v246[0]) = WORD6(v247[0]);
                  v27 = v240;
                  goto LABEL_448;
                }
              }
LABEL_444:
              BYTE2(v247[0]) = 0;
              v27 = v240;
              goto LABEL_445;
            }
            v199 = v110;
            v218 = v107;
            v210 = v106;
            v176 = v108;
            v230 = v24;
            v201 = v25;
            v196 = v23;
            v252[0] = 0;
            result = PRpendTermIsDot(v28, a4, (uint64_t)&v243, *((unsigned __int16 *)v245[1] + 20 * WORD5(v247[0]) - 20), WORD2(v247[0]), 0, 1u, v252, (BOOL *)&v251);
            if ((_DWORD)result)
            {
LABEL_499:
              if ((_DWORD)result == 200)
              {
LABEL_500:
                if (v245[0])
                  free(v245[0]);
                PRssTidyUp((uint64_t)&v243);
                return 200;
              }
              return result;
            }
            v181 = v252[0];
            if (v252[0])
            {
              WORD1(v246[0]) = WORD6(v247[0]);
              v181 = 1;
              v249 = 1;
            }
            v23 = v196;
            v25 = v201;
            v24 = v230;
            v110 = v199;
            goto LABEL_428;
          }
          if (v172 != 5 || *(_WORD *)&v106[40 * v107 + 18] != 1)
            goto LABEL_444;
          v173 = *(unsigned __int16 *)&v106[40 * v107 + 2];
          if (v173 == 1)
          {
            v174 = *(unsigned __int8 *)(v244 + *v108);
            if ((v174 | 0x10) != 0xBB)
              goto LABEL_444;
          }
          else
          {
            if (v173 != 2)
              goto LABEL_444;
            v174 = *(unsigned __int8 *)(v244 + *v108);
            if ((v174 | 2) != 0x3E)
              goto LABEL_444;
          }
          if (v174 == 187 || v174 == 62)
            WORD6(v247[0]) = WORD1(v246[0]);
        }
LABEL_445:
        if ((*(_DWORD *)v110 & 0x4000) == 0)
          goto LABEL_450;
        if (LOBYTE(v246[1]))
        {
          BYTE12(v246[0]) = 1;
LABEL_448:
          v249 = 1;
LABEL_449:
          HIBYTE(v246[0]) = 1;
          BYTE13(v246[0]) = 0;
          goto LABEL_450;
        }
        v186 = **((_BYTE **)&v246[1] + 1);
        if (v186 >= 2
          && (!HIWORD(v247[0]) && LOWORD(v247[1]) >= v186
           || *(unsigned __int8 *)(*((_QWORD *)&v246[1] + 1) + 2) + v186 <= LOWORD(v247[1])))
        {
          goto LABEL_448;
        }
        if (BYTE4(v247[1]) == 46)
        {
          v187 = WORD4(v247[1]);
          if (WORD4(v247[1]) > 5u)
            goto LABEL_448;
          v188 = WORD3(v247[1]);
          if (WORD4(v247[1]) == 5)
          {
            if (*(_BYTE *)(WORD3(v247[1]) + (_QWORD)v244 + 1) == 46)
              goto LABEL_448;
            v187 = 5;
          }
          goto LABEL_484;
        }
        if (BYTE4(v247[1]) != 58)
        {
          v187 = WORD4(v247[1]);
          v188 = WORD3(v247[1]);
LABEL_484:
          BYTE2(v247[0]) = 1;
          BYTE8(v247[0]) = BYTE4(v247[1]);
          WORD3(v247[0]) = v187;
          WORD2(v247[0]) = v188;
          WORD6(v247[0]) = WORD1(v246[0]);
          WORD5(v247[0]) = WORD1(v246[0]);
          goto LABEL_450;
        }
        if ((*(_DWORD *)v110 & 0x1000) != 0
          && (__int16)(*(_WORD *)&v106[40 * v107 + 18] - *(_WORD *)&v106[40 * v107 + 34]) <= 1)
        {
          BYTE2(v247[0]) = 1;
          BYTE8(v247[0]) = 58;
          DWORD1(v247[0]) = *(_DWORD *)((char *)&v247[1] + 6);
          WORD6(v247[0]) = WORD1(v246[0]);
          WORD5(v247[0]) = WORD1(v246[0]);
          BYTE12(v246[0]) = 1;
        }
LABEL_450:
        if (LOBYTE(v246[1]))
        {
          if (WORD1(v246[0]) == WORD6(v247[0]) && BYTE2(v247[0]))
            HIBYTE(v246[0]) = 1;
          if (BYTE13(v246[0]))
          {
            BYTE13(v246[0]) = 0;
            if ((*((_BYTE *)v110 + 1) & 0x40) != 0)
              HIBYTE(v246[0]) = 1;
          }
          BYTE12(v246[0]) = 1;
          v249 = 1;
        }
        v184 = *(_WORD *)&v106[40 * v107 + 18] + v248;
        v185 = *(unsigned __int16 *)(a4 + 28);
        v18 = v205;
        v20 = v226;
        if (v185 > v184)
          goto LABEL_468;
        if (v185 < v184 && (char *)v245[1] + 40 * WORD1(v246[0]) - 40 == (char *)v108)
        {
          HIBYTE(v246[0]) = 0;
          BYTE13(v246[0]) = 0;
          --WORD1(v246[0]);
        }
        else if (HIBYTE(v246[0]))
        {
          goto LABEL_465;
        }
        BYTE10(v246[0]) = 1;
LABEL_465:
        if (!v249)
          BYTE13(v246[0]) = 0;
        v249 = 1;
LABEL_468:
        LOWORD(v248) = v184;
        v26 = 23;
        v51 = v242;
        v29 = v237;
        goto LABEL_320;
      case 25:
        if ((unsigned __int16)v234 == 1 && WORD2(v227) == 1)
        {
          if ((v23 & 0xC000) != 0
            || v207 <= 0x3A
            && ((1 << v207) & 0x400D00000000000) != 0
            && (v21 & 0x8000000) != 0
            && (*(_DWORD *)(*(_QWORD *)(a4 + 64) + 4 * *(unsigned __int8 *)(v244 + (unsigned __int16)v202 - 1) + 16) & 0x8000000) != 0)
          {
            v51 = 0;
            v234 = 0;
            v131 = 24;
            if (HIDWORD(v214))
              v131 = 28;
            *(_DWORD *)&v18[v131] |= v242 | v21;
            v132 = *((_WORD *)v18 + 9) - 2;
            *((_WORD *)v18 + 9) = v132;
            v133 = &v18[2 * v132 + 2];
            v134 = *(_WORD *)v133 + *((_WORD *)v133 + 1) + 1;
            *(_WORD *)v133 = 0;
            *(_WORD *)&v18[2 * *((unsigned __int16 *)v18 + 9) + 4] = 0;
            WORD2(v213) = v134;
            LODWORD(v214) = 1;
            v26 = 4;
            HIDWORD(v227) = 1;
            goto LABEL_320;
          }
        }
        else if ((unsigned __int16)v234 != 1)
        {
          v138 = *((_DWORD *)v18 + 5);
          goto LABEL_354;
        }
        v138 = *((_DWORD *)v18 + 5);
        if ((v138 & 0x20000000) == 0)
        {
          v51 = 0;
          v234 = 0;
          *((_DWORD *)v18 + 5) = v138 | 0x22000000;
          HIDWORD(v214) = 1;
          v26 = 4;
          v203 = v242;
          goto LABEL_320;
        }
LABEL_354:
        v147 = 0;
        *((_DWORD *)v18 + 6) |= *((_DWORD *)v18 + 7) | v203 | v242;
        *((_DWORD *)v18 + 7) = 0;
        if (*((unsigned __int16 *)v18 + 9) > v212)
        {
          v147 = 0;
          v148 = v212;
          v149 = v18 + 2;
          do
          {
            v147 += *(_WORD *)&v149[2 * v148];
            *(_WORD *)&v149[2 * v148++] = 0;
          }
          while (v148 < *((unsigned __int16 *)v18 + 9));
        }
        HIDWORD(v214) = 0;
        v51 = 0;
        v203 = 0;
        v234 = 0;
        WORD2(v213) = v147 + 1;
        *((_WORD *)v18 + 9) = v212;
        *((_DWORD *)v18 + 5) = v138 & 0xDDFFFFFF | 0x20000000;
LABEL_395:
        LODWORD(v214) = 1;
        v26 = 4;
        goto LABEL_320;
      default:
        goto LABEL_319;
    }
  }
}

uint64_t PRgrowWkBuf(void **a1, void **a2, _WORD *a3, uint64_t a4, uint64_t a5)
{
  _BYTE *v10;
  _BYTE *v11;
  int v12;
  BOOL v13;
  int v14;
  int v15;
  _WORD *v16;
  uint64_t v17;
  uint64_t result;
  void *v19;
  unint64_t v20;
  _WORD *v21;
  int v22;

  v10 = malloc_type_malloc((unsigned __int16)*a3 + 1024, 0xD5D9936FuLL);
  if (!v10)
  {
LABEL_6:
    v17 = *(_QWORD *)(a4 + 32);
    *(_QWORD *)v17 = 0xDC00000078;
    *(_WORD *)(v17 + 8) = 940;
    return 220;
  }
  v11 = v10;
  if (*(_BYTE *)(*(_QWORD *)(a5 + 64) + 1040))
  {
    v12 = (__int16)*a3;
    v14 = v12 + 1024;
    v13 = v12 < -1024;
    v15 = v12 + 1039;
    if (!v13)
      v15 = v14;
    v16 = malloc_type_calloc((v15 >> 4) + 1, 2uLL, 0x1000040BDFB0063uLL);
    if (!v16)
      goto LABEL_6;
  }
  else
  {
    v16 = 0;
  }
  v19 = *a1;
  if (*a1)
  {
    if (*a3)
    {
      v20 = 0;
      do
      {
        v11[v20] = *((_BYTE *)*a1 + v20);
        ++v20;
      }
      while (v20 < (unsigned __int16)*a3);
      v19 = *a1;
    }
    free(v19);
  }
  if (a2 && *(_BYTE *)(*(_QWORD *)(a5 + 64) + 1040))
  {
    v21 = *a2;
    if (*a2)
    {
      if (*a3)
      {
        v22 = 0;
        do
        {
          v16[(unsigned __int16)v22] = v21[(unsigned __int16)v22];
          ++v22;
        }
        while (16 * (v22 & 0xFFFu) < (unsigned __int16)*a3);
      }
      free(v21);
    }
    *a2 = v16;
  }
  result = 0;
  *a3 += 1024;
  *a1 = v11;
  return result;
}

uint64_t PRgrowRaw(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  const void *v6;
  uint64_t result;
  uint64_t v8;

  v4 = malloc_type_calloc(*(unsigned __int16 *)(a2 + 48) + 32, 0x28uLL, 0x1000040F24650D8uLL);
  if (v4)
  {
    v5 = v4;
    v6 = *(const void **)(a2 + 40);
    if (v6)
    {
      memcpy(v4, v6, 40 * *(unsigned __int16 *)(a2 + 48));
      free(*(void **)(a2 + 40));
    }
    result = 0;
    *(_WORD *)(a2 + 48) += 32;
    *(_QWORD *)(a2 + 40) = v5;
  }
  else
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v8 = 0xDC00000078;
    *(_WORD *)(v8 + 8) = 960;
    return 220;
  }
  return result;
}

void PRssTidyUp(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 40);
  if (v2)
    free(v2);
  v3 = *(void **)(a1 + 16);
  if (v3)
    free(v3);
}

uint64_t PRnormalize(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int16 v8;
  unint64_t v9;
  BOOL v10;
  unsigned int v11;
  unsigned __int16 v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  unsigned __int16 *v20;
  uint64_t v21;
  _DWORD *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  __int16 *v26;
  __int16 v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  unsigned int v31;
  unsigned __int16 v32;
  unsigned __int16 *v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int16 *v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t result;
  uint64_t v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  _BOOL4 v47;
  char v48;
  uint64_t v49;
  _DWORD *v50;
  int v51;
  unint64_t v52;
  unint64_t v53;
  uint64_t v54;
  int v55;
  unsigned int v56;
  uint64_t v57;
  unsigned int v58;
  unsigned __int16 v59;
  unsigned __int16 *v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  unsigned __int16 *v64;
  uint64_t v65;
  uint64_t v66;
  unsigned __int16 *v67;
  uint64_t v68;
  int v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  uint64_t v73;
  char v74;
  _BYTE *v75;
  int v76;
  int v77;
  int v78;
  int v79;
  uint64_t v80;
  unsigned __int16 *v81;
  int v82;
  int v83;
  uint64_t v84;
  uint64_t v85;
  int v86;
  unsigned __int16 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  unsigned int v94;
  int v95;
  int v96;
  uint64_t v97;
  unsigned __int16 *v98;
  int v99;
  _BOOL4 v100;
  uint64_t v101;
  int *v102;
  int v103;
  int v104;
  int v105;
  unsigned __int16 v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unsigned __int16 v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  unsigned __int16 *v121;
  unsigned int v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unsigned int v126;
  uint64_t v127;
  uint64_t v128;
  int v129;
  char v130;
  uint64_t v131;
  int *v132;
  int v133;
  int v134;
  BOOL v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unsigned __int16 v139;
  int v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unsigned __int16 v144;
  char v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  int v150;
  unsigned __int16 *v151;
  char v152;
  char v153;
  uint64_t v154;
  unsigned int v155;
  int v156;
  uint64_t v157;
  uint64_t v158;
  unsigned __int8 v159;
  unsigned int v160;
  BOOL v161;
  int v162;
  uint64_t v164;
  _WORD *v165;
  unint64_t v166;
  unsigned __int16 *v167;
  __int16 v168;
  unsigned __int16 v169;
  uint64_t v170;
  _WORD *v171;
  unint64_t v172;
  unsigned int v173;
  uint64_t v174;
  int v175;
  unint64_t v176;
  unint64_t v177;
  uint64_t v178;
  uint64_t v179;
  unsigned __int16 *v180;
  __int16 v181;
  unsigned __int16 v182;
  uint64_t v183;
  uint64_t v184;
  _WORD *v185;
  unint64_t v186;
  unsigned __int16 *v187;
  __int16 v188;
  unsigned __int16 v189;
  unsigned __int16 *v190;
  unsigned __int16 *v191;
  int v193;
  int v194;
  int v195;
  char v196;
  char v197;
  uint64_t v198;
  uint64_t v199;
  _BOOL4 v200;
  int v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v206;
  uint64_t v207;
  char v208;
  uint64_t v209;
  unsigned __int16 v210[8];
  uint64_t v211;

  v211 = *MEMORY[0x1E0C80C00];
  v208 = 0;
  v3 = *(unsigned __int16 *)(a3 + 50);
  if (*(_WORD *)(a3 + 50))
  {
    v4 = a2;
    v5 = *(_QWORD *)(a2 + 8);
    v6 = *(_QWORD *)(a2 + 64);
    if (*(_BYTE *)(a3 + 62))
    {
      v7 = *(_QWORD *)(a3 + 40);
      *(_DWORD *)(v7 + 24) |= *(_DWORD *)(v7 + 28);
      *(_DWORD *)(v7 + 28) = 0;
      if (*(unsigned __int16 *)(v7 + 18) >= 2u)
      {
        v8 = *(_WORD *)(v7 + 2);
        v9 = 2;
        do
        {
          v8 += *(_WORD *)(v7 + 2 * v9);
          *(_WORD *)(v7 + 2 * v9) = 0;
          v10 = v9++ >= *(unsigned __int16 *)(v7 + 18);
        }
        while (!v10);
        *(_WORD *)(v7 + 2) = v8;
        v3 = *(unsigned __int16 *)(a3 + 50);
      }
      *(_DWORD *)(v7 + 32) = 65537;
      v11 = 1;
      *(_WORD *)(v7 + 18) = 1;
    }
    else
    {
      v11 = 0;
    }
    if (v11 < v3)
    {
      v12 = 0;
      v13 = v11;
      v14 = (8 * v11) | (32 * v11);
      v206 = v5;
      v207 = v6 + 16;
      v15 = v14 | 2;
      v16 = v14 | 4;
      v17 = v14 | 6;
      v203 = a3;
      v204 = v6;
      while (1)
      {
        v18 = *(_QWORD *)(a3 + 40);
        v19 = (unsigned __int16 *)(v18 + 40 * v13);
        v20 = v19 + 10;
        if ((*((_DWORD *)v19 + 5) & 0xFC00000) != 0)
          break;
LABEL_313:
        ++v13;
        v15 += 40;
        v16 += 40;
        v17 += 40;
        if (v13 >= *(unsigned __int16 *)(a3 + 50))
          return 0;
      }
      if ((*((_DWORD *)v19 + 5) & 0x8000000) == 0)
        goto LABEL_46;
      v21 = v18 + 40 * v13;
      v23 = *(_DWORD *)(v21 + 28);
      v22 = (_DWORD *)(v21 + 28);
      if (v23)
      {
        v12 = *v19;
        v24 = *(unsigned __int16 *)(v18 + 40 * v13 + 32);
        if (v24 >= 8)
          v25 = 8;
        else
          v25 = *(unsigned __int16 *)(v18 + 40 * v13 + 32);
        if ((_DWORD)v25)
        {
          v26 = (__int16 *)(v18 + v15);
          do
          {
            v27 = *v26++;
            v12 += v27;
            --v25;
          }
          while (v25);
        }
        v28 = *(__int16 *)(v18 + 40 * v13 + 2 * v24 + 2);
        if (v28 <= 15)
        {
          v29 = (unsigned __int16)(v28 + v12);
          v30 = *(_QWORD *)(a3 + 16);
          if (v29 <= v12)
          {
            v36 = (unsigned __int16 *)(v18 + 40 * v13);
            v37 = v17;
            v32 = 0;
          }
          else
          {
            v31 = v12;
            v32 = v29 - v12;
            v33 = v210;
            v34 = v29 - v12;
            do
            {
              v35 = *(unsigned __int8 *)(v30 + v31);
              if ((*(_DWORD *)(v5 + 4 * v35) & 0x40000000) != 0)
                LOBYTE(v35) = v35 + 32;
              *(_BYTE *)v33 = v35;
              v33 = (unsigned __int16 *)((char *)v33 + 1);
              ++v31;
              --v34;
            }
            while (v34);
            v36 = (unsigned __int16 *)(v18 + 40 * v13);
            v37 = v17;
          }
          *((_BYTE *)v210 + v32) = 0;
          v38 = SLcap(v30, (__int16)v12, (__int16)(v29 - 1), &v209, v206);
          result = PRSSWdGet((const char *)v210, v38, &v208, v4);
          v5 = v206;
          a3 = v203;
          v6 = v204;
          v17 = v37;
          v19 = v36;
          if ((_DWORD)result)
            return result;
        }
      }
      else
      {
        v208 = *(_BYTE *)(v18 + 40 * v13 + 38);
      }
      v40 = v18 + 40 * v13;
      v41 = *(unsigned __int16 *)(v40 + 32);
      v42 = *(unsigned __int16 *)(v40 + 2 * v41 + 2);
      if (v42 >= 2 && (*(_BYTE *)(v18 + 40 * v13 + 27) & 8) != 0 && (v208 & 0x10) == 0)
      {
        v12 = *v19;
        if (v41 >= 8)
          v43 = 8;
        else
          v43 = *(unsigned __int16 *)(v40 + 32);
        if ((_DWORD)v43)
        {
          v44 = v18;
          do
          {
            v12 += *(_WORD *)(v44 + v15);
            v44 += 2;
            --v43;
          }
          while (v43);
        }
        v45 = *(_QWORD *)(a3 + 16);
        if ((*(_DWORD *)(v5 + 4 * *(unsigned __int8 *)(v45 + v12)) & 0x8000000) != 0
          && (*(_DWORD *)(v5 + 4 * *(unsigned __int8 *)(v45 + v12 + 1)) & 0x8000000) != 0
          && (v42 == 2 || (*(_DWORD *)(v5 + 4 * *(unsigned __int8 *)(v45 + v12 + 2)) & 0x8000000) == 0))
        {
          v208 |= 0x10u;
        }
      }
      if ((v208 & 0x10) == 0)
      {
LABEL_46:
        v46 = 0;
        v47 = 0;
        v48 = 1;
        goto LABEL_47;
      }
      *(_DWORD *)(v18 + 40 * v13 + 24) |= *(_DWORD *)(v6 + 172);
      if (*(_BYTE *)(v4 + 20) != 11 || !*v22)
      {
        v48 = 0;
        v47 = 0;
        v46 = 1;
        goto LABEL_47;
      }
      v66 = v4;
      v67 = v19;
      v68 = a3;
      if (SLstrncmp("'s-", (unsigned __int8 *)(*(_QWORD *)(a3 + 16) + v12 - 1), 3))
      {
        v48 = 0;
        v46 = 1;
        a3 = v68;
        v5 = v206;
        v6 = v204;
        v19 = v67;
      }
      else
      {
        v5 = v206;
        a3 = v68;
        v19 = v67;
        v48 = 0;
        if ((*(_DWORD *)(v206 + 4 * *(unsigned __int8 *)(*(_QWORD *)(v68 + 16) + v12 + 2)) & 0x40000000) != 0)
        {
          *(_DWORD *)v20 &= ~0x2000000u;
          v46 = 1;
          v6 = v204;
          v4 = v66;
          v47 = 1;
LABEL_47:
          if ((*((_BYTE *)v20 + 3) & 1) != 0)
          {
            v49 = v18 + 40 * v13;
            v51 = *(_DWORD *)(v49 + 28);
            v50 = (_DWORD *)(v49 + 28);
            if (v51)
            {
              v12 = *v19;
              if (*(_WORD *)(v18 + 40 * v13 + 32) != 0xFFFE)
              {
                v52 = (unsigned __int16)(*(_WORD *)(v18 + 40 * v13 + 32) + 2) - 1;
                if (v52 >= 7)
                  v52 = 7;
                v53 = ~v52;
                v54 = v18;
                do
                {
                  v12 += *(_WORD *)(v54 + v15);
                  v54 += 2;
                  v10 = __CFADD__(v53++, 1);
                }
                while (!v10);
              }
              v55 = *(__int16 *)(v18 + 40 * v13 + 2 * (*(unsigned __int16 *)(v18 + 40 * v13 + 32) + 2) + 2);
              if (v55 <= 15)
              {
                v196 = v48;
                v56 = (unsigned __int16)(v55 + v12);
                v57 = *(_QWORD *)(a3 + 16);
                v198 = v16;
                v200 = v47;
                if (v56 <= v12)
                {
                  v63 = v46;
                  v64 = v19;
                  v65 = v17;
                  v59 = 0;
                }
                else
                {
                  v58 = v12;
                  v59 = v56 - v12;
                  v60 = v210;
                  v61 = v56 - v12;
                  do
                  {
                    v62 = *(unsigned __int8 *)(v57 + v58);
                    if ((*(_DWORD *)(v5 + 4 * v62) & 0x40000000) != 0)
                      LOBYTE(v62) = v62 + 32;
                    *(_BYTE *)v60 = v62;
                    v60 = (unsigned __int16 *)((char *)v60 + 1);
                    ++v58;
                    --v61;
                  }
                  while (v61);
                  v63 = v46;
                  v64 = v19;
                  v65 = v17;
                }
                *((_BYTE *)v210 + v59) = 0;
                v71 = SLcap(v57, (__int16)v12, (__int16)(v56 - 1), &v209, v206);
                result = PRSSWdGet((const char *)v210, v71, &v208, v4);
                v5 = v206;
                a3 = v203;
                v6 = v204;
                v17 = v65;
                v19 = v64;
                v46 = v63;
                v16 = v198;
                v47 = v200;
                v48 = v196;
                if ((_DWORD)result)
                  return result;
              }
              if ((v208 & 8) == 0)
                goto LABEL_75;
LABEL_67:
              v69 = *(_DWORD *)(v6 + 172);
              if (*v50)
                *v50 |= v69;
              else
                *(_DWORD *)(v18 + 40 * v13 + 24) |= v69;
              v70 = 1;
LABEL_76:
              v72 = *(_DWORD *)v20;
              if ((*(_DWORD *)v20 & 0x400000) == 0)
                goto LABEL_155;
              v73 = v18 + 40 * v13;
              v76 = *(char *)(v73 + 38);
              v75 = (_BYTE *)(v73 + 38);
              v74 = v76;
              if (v76 < 0)
              {
                v83 = v72 | 0x80000;
                *(_DWORD *)v20 = v72 | 0x80000;
                if ((v72 & 0x2000000) != 0)
                {
                  v72 = v72 & 0xFDF7FFFF | 0x80000;
                  *(_DWORD *)v20 = v83 & 0xFDFFFFFF;
                  v47 = 1;
                }
                else
                {
                  v72 |= 0x80000u;
                }
                goto LABEL_151;
              }
              v77 = *(unsigned __int8 *)(v4 + 20);
              if ((v74 & 0x20) != 0 && v77 != 6)
              {
                v78 = v72 | 0x100000;
                *(_DWORD *)v20 = v72 | 0x100000;
                v79 = *(unsigned __int16 *)(a3 + 50);
                if (v79 - 1 != (_DWORD)v13)
                {
                  if (v77 != 5
                    || v79 - 2 != (_DWORD)v13
                    || (v80 = *(_QWORD *)(a3 + 40),
                        v81 = (unsigned __int16 *)(v80 + 40 * (v13 + 1)),
                        v81[9] != 1)
                    || *(unsigned __int16 *)(v80 + 40 * (v13 + 1) + 2) > 2u
                    || (v82 = *(unsigned __int8 *)(*(_QWORD *)(a3 + 16) + *v81), v82 != 62) && v82 != 187)
                  {
                    v70 = 1;
                  }
                }
                if ((v72 & 0x2000000) != 0)
                {
                  v72 = v72 & 0xFDEFFFFF | 0x100000;
                  *(_DWORD *)v20 = v78 & 0xFDFFFFFF;
                  v47 = 1;
                }
                else
                {
                  v72 |= 0x100000u;
                }
                goto LABEL_150;
              }
              v84 = v18 + 40 * v13;
              v85 = *(unsigned __int16 *)(v84 + 32);
              if (!*(_DWORD *)(v84 + 28)
                && *(_WORD *)(v18 + 40 * v13 + 2 * v85 + 2) == 1
                && (*(_BYTE *)(v18 + 40 * v13 + 27) & 0x60) != 0)
              {
                v86 = *(unsigned __int8 *)(*(_QWORD *)(a3 + 16) + *v19);
                if ((v86 - 108) < 2 || v86 == 103)
                  goto LABEL_150;
                if (v86 == 97 && v77 == 5)
                  goto LABEL_150;
LABEL_151:
                v101 = v18 + 40 * v13;
                v104 = *(_DWORD *)(v101 + 28);
                v102 = (int *)(v101 + 28);
                v103 = v104;
                v105 = *(_DWORD *)(v6 + 200);
                if (v104)
                  *v102 = v105 | v103;
                else
                  *(_DWORD *)(v18 + 40 * v13 + 24) |= v105;
                v70 = 1;
LABEL_155:
                if ((v72 & 0x4000000) != 0 && ((v72 & 0x2000000) != 0 || (*(_BYTE *)(v18 + 40 * v13 + 24) & 1) != 0))
                {
                  v12 = *v19;
                  v112 = *(unsigned __int16 *)(v18 + 40 * v13 + 32);
                  if ((((_WORD)v112 - 1) & 0xFFF8) != 0)
                    v113 = 8;
                  else
                    v113 = (unsigned __int16)(v112 - 1);
                  v114 = *v19;
                  if ((_DWORD)v113)
                  {
                    v115 = v18;
                    v114 = *v19;
                    do
                    {
                      v114 += *(_WORD *)(v115 + v15);
                      v115 += 2;
                      --v113;
                    }
                    while (v113);
                  }
                  v116 = 0;
                  v117 = *(_QWORD *)(a3 + 16);
                  v118 = *(unsigned __int8 *)(v117 + v114);
                  while (PRnormalize_PairPunTab[v116] != (_DWORD)v118)
                  {
                    v116 += 2;
                    if (v116 == 8)
                    {
                      v12 = v114;
                      if ((v72 & 0x800000) != 0)
                        goto LABEL_157;
                      goto LABEL_181;
                    }
                  }
                  if ((v72 & 0x2000000) != 0)
                  {
                    LOWORD(v112) = v112 + 1;
                    if ((v112 & 0xFFF8) != 0)
                      v112 = 8;
                    else
                      v112 = (unsigned __int16)v112;
                    if ((_DWORD)v112)
                    {
                      v148 = v18;
                      do
                      {
                        v12 += *(_WORD *)(v148 + v15);
                        v148 += 2;
                        --v112;
                      }
                      while (v112);
                    }
                    if (*(unsigned __int8 *)(v117 + v12) == PRnormalize_PairPunTab[v116 + 1])
                    {
                      v72 &= ~0x2000000u;
                      *(_DWORD *)v20 = v72;
                      *(_DWORD *)(v18 + 40 * v13 + 24) |= *(_DWORD *)(v207 + 4 * v118);
                      v46 = 1;
                      v47 = 1;
                    }
                    goto LABEL_156;
                  }
                  if (v112 >= 8)
                    v142 = 8;
                  else
                    v142 = *(unsigned __int16 *)(v18 + 40 * v13 + 32);
                  if ((_DWORD)v142)
                  {
                    v143 = v18;
                    do
                    {
                      v12 += *(_WORD *)(v143 + v15);
                      v143 += 2;
                      --v142;
                    }
                    while (v142);
                  }
                  v144 = *(_WORD *)(v18 + 40 * v13 + 2 * v112 + 2) + v12;
                  v145 = v48 ^ 1;
                  if (v12 >= v144)
                    v145 = 1;
                  if ((v145 & 1) != 0)
                    goto LABEL_156;
                  v146 = v12;
                  while (*(unsigned __int8 *)(v117 + v146) != PRnormalize_PairPunTab[v116 + 1])
                  {
                    if (++v146 >= (unint64_t)v144)
                    {
                      v46 = 0;
                      if ((v72 & 0x800000) != 0)
                        goto LABEL_157;
                      goto LABEL_181;
                    }
                  }
                  *(_DWORD *)(v18 + 40 * v13 + 24) |= *(_DWORD *)(v207 + 4 * v118);
                  v46 = 1;
                  if ((v72 & 0x800000) != 0)
                    goto LABEL_157;
                  goto LABEL_181;
                }
LABEL_156:
                if ((v72 & 0x800000) == 0)
                  goto LABEL_181;
LABEL_157:
                if ((v72 & 0x2000000) == 0 && (*(_BYTE *)(v18 + 40 * v13 + 24) & 1) == 0)
                {
LABEL_181:
                  if ((v72 & 0x2000000) == 0)
                    goto LABEL_293;
                  goto LABEL_182;
                }
                v106 = *v19;
                if (*(unsigned __int16 *)(v18 + 40 * v13 + 34) >= 8u)
                  v107 = 8;
                else
                  v107 = *(unsigned __int16 *)(v18 + 40 * v13 + 34);
                v12 = *v19;
                if ((_DWORD)v107)
                {
                  v108 = v18;
                  v12 = *v19;
                  do
                  {
                    v12 += *(_WORD *)(v108 + v15);
                    v108 += 2;
                    --v107;
                  }
                  while (v107);
                }
                v109 = 0;
                v110 = *(_QWORD *)(a3 + 16);
                v111 = *(unsigned __int8 *)(v110 + v12);
                while (PRnormalize_PairPunTab[v109 + 1] != (_DWORD)v111)
                {
                  v109 += 2;
                  if (v109 == 8)
                    goto LABEL_181;
                }
                v136 = *(unsigned __int16 *)(v18 + 40 * v13 + 32);
                if ((v72 & 0x2000000) != 0)
                {
                  LOWORD(v136) = v136 + 1;
                  if ((v136 & 0xFFF8) != 0)
                    v136 = 8;
                  else
                    v136 = (unsigned __int16)v136;
                  if ((_DWORD)v136)
                  {
                    v147 = v18;
                    do
                    {
                      v106 += *(_WORD *)(v147 + v15);
                      v147 += 2;
                      --v136;
                    }
                    while (v136);
                  }
                  if (*(unsigned __int8 *)(v110 + v106) == PRnormalize_PairPunTab[v109])
                  {
                    v72 &= ~0x2000000u;
                    *(_DWORD *)v20 = v72;
                    v47 = 1;
LABEL_242:
                    *(_DWORD *)(v18 + 40 * v13 + 24) |= *(_DWORD *)(v207 + 4 * v111);
                    v70 = 1;
                  }
                }
                else
                {
                  if (v136 >= 8)
                    v137 = 8;
                  else
                    v137 = *(unsigned __int16 *)(v18 + 40 * v13 + 32);
                  if ((_DWORD)v137)
                  {
                    v138 = v18;
                    do
                    {
                      v106 += *(_WORD *)(v138 + v15);
                      v138 += 2;
                      --v137;
                    }
                    while (v137);
                  }
                  if (!v70)
                  {
                    v139 = *(_WORD *)(v18 + 40 * v13 + 2 * v136 + 2) + v106;
                    if (v106 < v139)
                    {
                      v140 = PRnormalize_PairPunTab[v109];
                      v141 = v106;
                      while (*(unsigned __int8 *)(v110 + v141) != v140)
                      {
                        if (++v141 >= (unint64_t)v139)
                        {
                          v70 = 0;
                          goto LABEL_243;
                        }
                      }
                      goto LABEL_242;
                    }
                  }
                }
LABEL_243:
                v12 = v106;
                if ((v72 & 0x2000000) == 0)
                  goto LABEL_293;
LABEL_182:
                v210[0] = 0;
                v12 = *v19;
                v119 = v18 + 40 * v13;
                v122 = *(unsigned __int16 *)(v119 + 32);
                v121 = (unsigned __int16 *)(v119 + 32);
                v120 = v122;
                if (v122 >= 8)
                  v123 = 8;
                else
                  v123 = v120;
                if ((_DWORD)v123)
                {
                  v124 = v18;
                  do
                  {
                    v12 += *(_WORD *)(v124 + v15);
                    v124 += 2;
                    --v123;
                  }
                  while (v123);
                }
                v125 = v18 + 40 * v13 + 2 * v120;
                v126 = *(unsigned __int16 *)(v125 + 2);
                v127 = *(_QWORD *)(a3 + 16);
                v128 = (unsigned __int16)(v126 + v12);
                v129 = *(unsigned __int8 *)(v127 + v128);
                if (*(unsigned __int16 *)(v125 + 4) < 2u)
                {
                  if (v129 == 151 || v129 == 133)
                    goto LABEL_291;
                  v130 = 0;
                  if (v129 == 46)
                  {
                    v131 = v18 + 40 * v13;
                    v134 = *(_DWORD *)(v131 + 24);
                    v132 = (int *)(v131 + 24);
                    v133 = v134;
                    if ((v134 & 0x60000000) != 0)
                    {
                      v135 = v126 != 1 || (*(_DWORD *)(v18 + 40 * v13 + 28) & 0x60000000) == 0;
                      if (!v135
                        && *(_WORD *)(v18 + 40 * v13 + 2 * v120 + 6) == 1
                        && *(unsigned __int16 *)(v18 + 40 * v13 + 18) >= 4u
                        && *(_BYTE *)(v12 + v127 + 3) == 46)
                      {
                        if (v70)
                        {
                          v70 = 1;
                          v4 = a2;
                        }
                        else
                        {
                          v4 = a2;
                          if ((v72 & 0x400000) != 0)
                          {
                            *v132 = *(_DWORD *)(v6 + 200) | v133;
                            v70 = 1;
                          }
                          else
                          {
                            v70 = 0;
                          }
                        }
                        *(_DWORD *)v20 = v72 & 0xFFE7FFFF | 0x80000;
LABEL_289:
                        v47 = 1;
                        if (v46)
                        {
LABEL_294:
                          v164 = v18 + 40 * v13;
                          v165 = (_WORD *)(v164 + 32);
                          *(_WORD *)(v164 + 2 * *(unsigned __int16 *)(v164 + 32)) += *(_WORD *)(v164
                                                                                                + 2
                                                                                                * *(unsigned __int16 *)(v164 + 32)
                                                                                                + 2);
                          v166 = *(unsigned __int16 *)(v164 + 32);
                          v168 = *(_WORD *)(v164 + 18);
                          v167 = (unsigned __int16 *)(v164 + 18);
                          v169 = v168 - 1;
                          if (v166 < (unsigned __int16)(v168 - 1))
                          {
                            do
                            {
                              *(_WORD *)(v18 + v15 + 2 * v166) = *(_WORD *)(v18 + v16 + 2 * v166);
                              ++v166;
                              v169 = *v167 - 1;
                            }
                            while (v166 < v169);
                            LOWORD(v166) = *v165;
                          }
                          *v167 = v169;
                          *v165 = v166 - 1;
                          --*(_WORD *)(v18 + 40 * v13 + 34);
                        }
LABEL_298:
                        if (v47)
                        {
                          v12 = *v19;
                          v170 = v18 + 40 * v13;
                          v173 = *(unsigned __int16 *)(v170 + 32);
                          v171 = (_WORD *)(v170 + 32);
                          v172 = v173;
                          v174 = v173 + 1;
                          v175 = (unsigned __int16)(v173 + 1);
                          if ((_WORD)v173 != 0xFFFF)
                          {
                            v176 = (v175 - 1);
                            if (v176 >= 7)
                              v176 = 7;
                            v177 = ~v176;
                            v178 = v18;
                            do
                            {
                              v12 += *(_WORD *)(v178 + v15);
                              v178 += 2;
                              v10 = __CFADD__(v177++, 1);
                            }
                            while (!v10);
                          }
                          v179 = v18 + 40 * v13;
                          *(_WORD *)(v179 + 2 + 2 * v172) += *(_WORD *)(v179 + 2 + 2 * v172 + 4)
                                                                           + *(_WORD *)(v179 + 2 + 2 * v174);
                          v181 = *(_WORD *)(v179 + 18);
                          v180 = (unsigned __int16 *)(v179 + 18);
                          LOWORD(v172) = *v171 + 1;
                          v182 = v181 - 2;
                          if ((unsigned __int16)v172 < (unsigned __int16)(v181 - 2))
                          {
                            v172 = (unsigned __int16)v172;
                            do
                            {
                              *(_WORD *)(v18 + v15 + 2 * v172) = *(_WORD *)(v18 + v17 + 2 * v172);
                              ++v172;
                              v182 = *v180 - 2;
                            }
                            while (v172 < v182);
                          }
                          v183 = v18 + 40 * v13;
                          *(_WORD *)(v183 + 34) -= 2;
                          *v180 = v182;
                          *(_QWORD *)(v183 + 24) = *(_DWORD *)(v207
                                                             + 4 * *(unsigned __int8 *)(*(_QWORD *)(a3 + 16) + v12)) | (*(_DWORD *)(v183 + 28) | *(_DWORD *)(v183 + 24));
                        }
                        if (v70)
                        {
                          v184 = v18 + 40 * v13;
                          v185 = (_WORD *)(v184 + 2 * *(unsigned __int16 *)(v184 + 34));
                          *v185 += v185[1];
                          v186 = *(unsigned __int16 *)(v184 + 34);
                          v188 = *(_WORD *)(v184 + 18);
                          v187 = (unsigned __int16 *)(v184 + 18);
                          v189 = v188 - 1;
                          if (v186 < (unsigned __int16)(v188 - 1))
                          {
                            do
                            {
                              *(_WORD *)(v18 + v15 + 2 * v186) = *(_WORD *)(v18 + v16 + 2 * v186);
                              ++v186;
                              v189 = *v187 - 1;
                            }
                            while (v186 < v189);
                          }
                          *v187 = v189;
                        }
                        goto LABEL_313;
                      }
                    }
                    v130 = 1;
                  }
                }
                else
                {
                  if ((v129 - 45) < 2)
                    goto LABEL_291;
                  if (v129 == 133)
                    goto LABEL_291;
                  v130 = 0;
                  if (v129 == 151)
                    goto LABEL_291;
                }
                v149 = v18 + 40 * v13;
                if ((*(_BYTE *)(v149 + 27) & 0x60) != 0)
                {
                  if (v126 >= 2)
                  {
                    v199 = v16;
                    v194 = v70;
                    v150 = v46;
                    v151 = v19;
                    result = PRpendTermIsDot(a1, a2, a3, v12, (unsigned __int16)(v126 + v12), 0, 0, v210, (BOOL *)&v209);
                    if ((_DWORD)result)
                      return result;
                    a3 = v203;
                    v6 = v204;
                    v5 = v206;
                    v19 = v151;
                    v46 = v150;
                    v16 = v199;
                    v149 = v18 + 40 * v13;
                    v70 = v194;
                    if (!v210[0])
                      goto LABEL_268;
                  }
                }
                else if (*(_WORD *)(v18 + 40 * v13 + 2 * v120 + 6) == 1)
                {
                  v152 = (*(_BYTE *)(v18 + 40 * v13 + 31) & 0x60) != 0 ? v130 : 0;
                  if ((v152 & 1) != 0
                    || (*(unsigned __int8 *)(v128 + v127 + 1) == 186 ? (v153 = v130) : (v153 = 0), (v153 & 1) != 0))
                  {
LABEL_268:
                    v47 = 1;
                    goto LABEL_292;
                  }
                }
                if ((*(_BYTE *)(v18 + 40 * v13 + 31) & 0x60) != 0
                  && (v154 = *v121, v155 = *(unsigned __int16 *)(v18 + 40 * v13 + 2 * v154 + 6), v155 >= 2))
                {
                  v202 = v149;
                  v195 = v70;
                  v156 = v46;
                  v12 = *(_WORD *)(v18 + 40 * v13 + 2 * v154 + 4) + v128;
                  v191 = v19;
                  result = PRpendTermIsDot(a1, a2, a3, v12, (unsigned __int16)(v12 + v155), 0, 0, v210, (BOOL *)&v209);
                  v47 = v210[0] == 0;
                  if ((_DWORD)result)
                    return result;
                  a3 = v203;
                  v6 = v204;
                  v5 = v206;
                  v19 = v191;
                  v46 = v156;
                  v70 = v195;
                  v149 = v202;
                  if (!v210[0])
                    goto LABEL_292;
                }
                else
                {
                  v47 = 0;
                }
                if (*(_BYTE *)(a2 + 20) != 7 || (v47 = 0, (*(_BYTE *)(v149 + 27) & 0x60) != 0) || v129 != 58)
                {
LABEL_292:
                  v4 = a2;
LABEL_293:
                  if (v46)
                    goto LABEL_294;
                  goto LABEL_298;
                }
                v157 = *v121;
                if (*(_WORD *)(v18 + 40 * v13 + 2 * v157 + 6) == 1)
                {
                  v12 = *v19;
                  LOWORD(v157) = v157 + 2;
                  if ((v157 & 0xFFF8) != 0)
                    v157 = 8;
                  else
                    v157 = (unsigned __int16)v157;
                  v4 = a2;
                  if ((_DWORD)v157)
                  {
                    v158 = v18;
                    do
                    {
                      v12 += *(_WORD *)(v158 + v15);
                      v158 += 2;
                      --v157;
                    }
                    while (v157);
                  }
                  v159 = *(_BYTE *)(*(_QWORD *)(a3 + 16) + v12) - 65;
                  v160 = ((v159 >> 2) | (v159 << 6));
                  v161 = v160 > 9;
                  v162 = (1 << v160) & 0x303;
                  if (v161 || v162 == 0)
                  {
                    v47 = 0;
                    if (v46)
                      goto LABEL_294;
                    goto LABEL_298;
                  }
                  goto LABEL_289;
                }
LABEL_291:
                v47 = 0;
                goto LABEL_292;
              }
              v210[0] = 0;
              LOBYTE(v209) = 0;
              v88 = *v19;
              if (v85 >= 8)
                v89 = 8;
              else
                v89 = v85;
              v12 = *v19;
              if ((_DWORD)v89)
              {
                v90 = v18;
                v12 = *v19;
                do
                {
                  v12 += *(_WORD *)(v90 + v15);
                  v90 += 2;
                  --v89;
                }
                while (v89);
              }
              if (*(unsigned __int16 *)(v18 + 40 * v13 + 34) >= 8u)
                v91 = 8;
              else
                v91 = *(unsigned __int16 *)(v18 + 40 * v13 + 34);
              if ((_DWORD)v91)
              {
                v92 = v18;
                do
                {
                  v88 += *(_WORD *)(v92 + v15);
                  v92 += 2;
                  --v91;
                }
                while (v91);
              }
              if (v88
                && (*(_DWORD *)(v207 + 4 * *(unsigned __int8 *)(*(_QWORD *)(a3 + 16) + v88 - 1)) & 0x8000000) != 0)
              {
                v70 = 0;
                goto LABEL_150;
              }
              if (v12 > v88)
                goto LABEL_150;
              v193 = v70;
              v197 = v48;
              v201 = v47;
              v93 = v46;
              v190 = v19;
              result = PRpendTermIsDot(a1, v4, a3, v12, v88, 1, 0, v210, (BOOL *)&v209);
              if ((_DWORD)result)
                return result;
              v94 = *(_DWORD *)v20;
              if (v210[0])
              {
                a3 = v203;
                if ((v94 & 0x2000000) != 0)
                {
                  v94 &= ~0x2000000u;
                  *(_DWORD *)v20 = v94;
                  v201 = 1;
                }
                v6 = v204;
                v19 = v190;
                v46 = v93;
                v70 = v193;
                v48 = v197;
                v4 = a2;
                v5 = v206;
                if ((_BYTE)v209)
                {
                  v47 = v201;
                  if (*(_BYTE *)(a2 + 20) == 6 && (*v75 & 0x20) != 0)
                  {
                    v72 = v94 | 0x100000;
                    *(_DWORD *)v20 = v94 | 0x100000;
                    if (*(unsigned __int16 *)(v203 + 50) - 1 != (_DWORD)v13)
                      v70 = 1;
                  }
                  else
                  {
                    v72 = v94 | 0x80000;
                    *(_DWORD *)v20 = v94 | 0x80000;
                    v70 = 1;
                  }
LABEL_150:
                  if (!v70)
                    goto LABEL_155;
                  goto LABEL_151;
                }
                v72 = v94 | 0x200000;
                *(_DWORD *)v20 = v94 | 0x200000;
LABEL_149:
                v47 = v201;
                goto LABEL_150;
              }
              v72 = v94 | 0x100000;
              *(_DWORD *)v20 = v94 | 0x100000;
              a3 = v203;
              v95 = *(unsigned __int16 *)(v203 + 50);
              if (v95 - 1 == (_DWORD)v13)
              {
                v6 = v204;
                v19 = v190;
                v4 = a2;
                v5 = v206;
                v46 = v93;
                v70 = v193;
                v48 = v197;
                goto LABEL_149;
              }
              v5 = v206;
              v96 = *(unsigned __int8 *)(a2 + 20);
              v6 = v204;
              v19 = v190;
              v46 = v93;
              v48 = v197;
              if (v96 == 5 && v95 - 2 == (_DWORD)v13)
              {
                v97 = *(_QWORD *)(v203 + 40);
                v98 = (unsigned __int16 *)(v97 + 40 * (v13 + 1));
                if (v98[9] != 1
                  || *(unsigned __int16 *)(v97 + 40 * (v13 + 1) + 2) > 2u
                  || (v99 = *(unsigned __int8 *)(*(_QWORD *)(v203 + 16) + *v98), v99 != 62) && v99 != 187)
                {
LABEL_148:
                  v70 = 1;
                  v4 = a2;
                  goto LABEL_149;
                }
              }
              else
              {
                if (v96 != 6)
                  goto LABEL_148;
                v100 = PRisRoman((unsigned __int8 *)(*(_QWORD *)(v203 + 16) + v12));
                v48 = v197;
                v46 = v93;
                v19 = v190;
                a3 = v203;
                v6 = v204;
                v5 = v206;
                if (!v100)
                  goto LABEL_148;
              }
              v4 = a2;
              v70 = v193;
              goto LABEL_149;
            }
            v208 = *(_BYTE *)(v18 + 40 * v13 + 38);
            if ((v208 & 8) != 0)
              goto LABEL_67;
          }
LABEL_75:
          v70 = 0;
          goto LABEL_76;
        }
        v46 = 1;
        v6 = v204;
      }
      v4 = v66;
      v47 = 0;
      goto LABEL_47;
    }
  }
  return 0;
}

uint64_t PRssPost(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  int v6;
  uint64_t v7;
  unsigned __int16 v8;
  uint64_t v9;
  unsigned __int16 *v10;
  int v11;
  uint64_t v12;
  unsigned __int16 *v13;
  int v14;
  unsigned int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  _DWORD *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t result;
  unsigned int v34;
  char *v35;
  char v36;
  unsigned int v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unsigned __int16 *v41;
  unsigned __int16 *v42;
  int v43;
  unint64_t v44;
  int v45;
  char *v46;
  uint64_t v47;
  unsigned __int16 *v48;
  int *v49;
  int *v50;
  uint64_t v51;
  __int16 *v52;
  unsigned int v53;
  unsigned int v54;
  uint64_t v55;
  int v56;
  __int16 v57;
  uint64_t v58;
  uint64_t i;
  uint64_t v60;
  uint64_t v61;
  int v62;
  unsigned int v63;
  __int16 v64;
  BOOL v65;
  int v66;
  char v67;
  uint64_t v68;
  int v69;
  unsigned int v70;
  int v71;
  char v72;
  unsigned int v73;
  _BYTE *v74;
  unsigned int v75;
  unsigned int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  int v81;
  unsigned __int16 v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v86;
  uint64_t *v87;
  _DWORD *v88;
  int *v89;
  int *v90;
  uint64_t v91;
  unint64_t v92;
  __int16 *v93;
  char *v94;

  v3 = a3;
  if (*(unsigned __int16 *)(a3 + 56) >= 0x40u)
    v5 = 64;
  else
    v5 = *(unsigned __int16 *)(a3 + 56);
  if (*(_WORD *)(a3 + 56))
    v6 = v5 + 1;
  else
    v6 = 0;
  if (*(_WORD *)(a3 + 50))
  {
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)(a3 + 40);
    v10 = (unsigned __int16 *)(v9 + 2);
    do
    {
      v11 = *(unsigned __int16 *)(v9 + 40 * v7 + 18);
      if (*(_WORD *)(v9 + 40 * v7 + 18))
      {
        v12 = *(unsigned __int16 *)(v9 + 40 * v7 + 18);
        v13 = v10;
        do
        {
          v15 = *v13++;
          v14 = v15;
          if (v15 >= 0x40)
            v14 = 64;
          v6 += 2 * v14;
          --v12;
        }
        while (v12);
      }
      v16 = v6 + 2 * v11;
      if (*(unsigned __int16 *)(v9 + 40 * v7 + 36) >= 0x40u)
        v17 = 64;
      else
        v17 = *(unsigned __int16 *)(v9 + 40 * v7 + 36);
      if (*(_WORD *)(v9 + 40 * v7 + 36))
        v18 = v17 + 1;
      else
        v18 = 0;
      v6 = v16 + v18;
      v8 += v11;
      ++v7;
      v10 += 20;
    }
    while (v7 != *(unsigned __int16 *)(a3 + 50));
  }
  else
  {
    v8 = 0;
  }
  v19 = *(_QWORD *)(a2 + 64);
  v20 = *(_QWORD *)(a2 + 8);
  v83 = *(_QWORD *)(a1 + 16);
  if ((_WORD)v6)
  {
    v21 = (char *)malloc_type_malloc((unsigned __int16)v6, 0xAAAA0DE5uLL);
    if (!v21)
      goto LABEL_36;
  }
  else
  {
    v21 = 0;
  }
  if (v8)
  {
    v22 = (char *)malloc_type_calloc(v8, 0xB8uLL, 0x10B00409DE433CAuLL);
    if (!v22)
    {
LABEL_36:
      v32 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)v32 = 0xDC00000078;
      *(_WORD *)(v32 + 8) = 980;
      return 220;
    }
    v23 = v22;
    v24 = 0;
    v25 = 0;
    v26 = v83;
    do
    {
      v27 = &v22[v24];
      *(_WORD *)&v22[v24] = v25;
      if (v24)
      {
        *((_QWORD *)v27 + 21) = v27 - 184;
        *((_QWORD *)v27 + 9) = v27 - 184;
      }
      if (v25 < (unsigned __int16)(v8 - 1))
      {
        v28 = &v22[v24];
        v29 = (uint64_t)&v22[v24 + 184];
        *((_QWORD *)v28 + 22) = v29;
        *((_QWORD *)v28 + 10) = v29;
      }
      *(_QWORD *)&v22[v24 + 152] = v27;
      v24 += 184;
      ++v25;
    }
    while (184 * v8 != v24);
    v82 = v8;
    LOWORD(v30) = 0;
    *(_QWORD *)(v83 + 72) = 0;
    v31 = (uint64_t *)(v83 + 72);
    *(_QWORD *)(v83 + 56) = v22;
    *(_QWORD *)(v83 + 64) = v22;
    *(_QWORD *)(v83 + 80) = &v22[184 * v8 - 184];
  }
  else
  {
    v82 = v8;
    v23 = 0;
    LOWORD(v30) = *(_WORD *)(v3 + 56);
    v26 = v83;
    *(_QWORD *)(v83 + 72) = 0;
    v31 = (uint64_t *)(v83 + 72);
    *(_QWORD *)(v83 + 56) = 0;
    *(_QWORD *)(v83 + 64) = 0;
  }
  v34 = *(unsigned __int16 *)(v3 + 56);
  if (*(_WORD *)(v3 + 56))
  {
    v35 = *(char **)(v3 + 16);
    *(_QWORD *)(v26 + 24) = v21;
    if (v34 >= 0x41)
    {
      *(_WORD *)(v26 + 32) = v34 - 64;
      v34 = 64;
    }
    ++v21;
    do
    {
      v36 = *v35++;
      *(v21 - 1) = v36;
      --v34;
      ++v21;
    }
    while ((_WORD)v34);
    *(v21 - 1) = 0;
  }
  v37 = *(unsigned __int16 *)(v3 + 50);
  if (!*(_WORD *)(v3 + 50))
    goto LABEL_125;
  v38 = 0;
  v84 = v19 + 16;
  v39 = (uint64_t)v23;
  v87 = v31;
  v88 = v23;
  v86 = v3;
  do
  {
    v40 = *(_QWORD *)(v3 + 40);
    v41 = (unsigned __int16 *)(v40 + 40 * v38);
    v30 = *v41;
    v43 = v41[9];
    v42 = v41 + 9;
    if (!v43)
      goto LABEL_124;
    v44 = 0;
    v45 = 0;
    v46 = (char *)(*(_QWORD *)(v3 + 16) + v30);
    v47 = v40 + 40 * v38;
    v48 = (unsigned __int16 *)(v47 + 32);
    v93 = (__int16 *)(v47 + 36);
    v94 = (char *)(v47 + 38);
    v49 = (int *)(v47 + 24);
    v50 = (int *)(v47 + 28);
    v91 = *(_QWORD *)(v3 + 40);
    v92 = v38;
    v89 = (int *)(v47 + 28);
    v90 = (int *)(v47 + 24);
    do
    {
      *(_WORD *)(v39 + 8) = v30;
      v51 = v40 + 40 * v38 + 2 * v44;
      v54 = *(unsigned __int16 *)(v51 + 2);
      v52 = (__int16 *)(v51 + 2);
      v53 = v54;
      if (v54 >= 0x40)
        v55 = 64;
      else
        v55 = v53;
      *(_WORD *)(v39 + 32) = v55;
      v56 = *v52;
      v57 = v56 - 64;
      if (v56 < 64)
        v57 = 0;
      *(_WORD *)(v39 + 34) = v57;
      v58 = (uint64_t)&v21[v55 + 1];
      *(_QWORD *)(v39 + 16) = v21;
      *(_QWORD *)(v39 + 24) = v58;
      if ((_DWORD)v55)
      {
        for (i = 0; i != v55; ++i)
        {
          *(_BYTE *)(*(_QWORD *)(v39 + 24) + i) = v46[i];
          v60 = v46[i];
          if ((*(_DWORD *)(v20 + 4 * v60) & 0x40000000) != 0)
            LOBYTE(v60) = v60 + 32;
          *(_BYTE *)(*(_QWORD *)(v39 + 16) + i) = v60;
        }
        v58 = *(_QWORD *)(v39 + 24);
        v46 += i;
      }
      *(_BYTE *)(v58 + v55) = 0;
      *(_BYTE *)(*(_QWORD *)(v39 + 16) + v55) = 0;
      v61 = *(unsigned __int16 *)(v39 + 34);
      if (!*v31 && v44 == *v48)
        *v31 = v39;
      LODWORD(v30) = v56 + v30;
      v46 += v61;
      if (*v42 - 1 == v45 && (v62 = *v93) != 0)
      {
        v63 = 0;
        *(_QWORD *)(v39 + 40) = &v21[2 * v55 + 2];
        LODWORD(v30) = v62 + v30;
        v64 = v62;
        if ((v62 & 0xFFC0) != 0)
          v64 = 64;
        *(_WORD *)(v39 + 48) = v64;
        v65 = __OFSUB__(v62, 64);
        v66 = v62 - 64;
        if (v66 < 0 != v65)
          LOWORD(v66) = 0;
        *(_WORD *)(v39 + 36) = v66;
        v21 += 2 * v55 + 3;
        do
        {
          v67 = *v46++;
          *(v21 - 1) = v67;
          ++v63;
          ++v21;
        }
        while (v63 < *(unsigned __int16 *)(v39 + 48));
        *(v21 - 1) = 0;
      }
      else
      {
        v21 += 2 * v55 + 2;
      }
      if ((_DWORD *)v39 == v23 && *(_BYTE *)(v86 + 62))
      {
        v23[1] = 16;
        *v31 = 0;
        v72 = 5;
LABEL_116:
        *(_BYTE *)(v39 + 51) = v72;
        goto LABEL_117;
      }
      v68 = *v48;
      if (*v94 < 0 && v44 == v68 && *v52 != 2)
      {
        *(_DWORD *)(v39 + 4) = 268435457;
        v71 = 268435457;
      }
      else if (v44 == v68 && (v69 = *v49, (*v49 & 0x1000000) != 0) && (*v49 & 0x68000000) != 0
             || (_DWORD)v68 + 2 == v45 && (*v50 & 0x1000000) != 0 && (v69 = *v50, (*v50 & 0x68000000) != 0))
      {
        if ((v69 & 0x60000000) == 0)
        {
          v71 = 8;
LABEL_108:
          *(_DWORD *)(v39 + 4) = v71;
          goto LABEL_109;
        }
        v70 = *(unsigned __int16 *)(v39 + 32);
        if (v70 == 2)
        {
          if (*(_BYTE *)(*(_QWORD *)(v39 + 16) + 1) == 46)
            v71 = 0x10000;
          else
            v71 = 256;
          goto LABEL_108;
        }
        v71 = 256;
        *(_DWORD *)(v39 + 4) = 256;
        if (v70 >= 4)
        {
          v74 = *(_BYTE **)(v39 + 16);
          v75 = *v74;
          if (*v74)
          {
            v76 = (unsigned __int16)(v70 - 1);
            v77 = *(_QWORD *)(v39 + 16);
            while ((*(_DWORD *)(v84 + 4 * v75) & 0x20000000) != 0 && *(_BYTE *)(v77 + 1) == 46)
            {
              v78 = 2;
              if (*(_BYTE *)(v77 + 2) == 45 && v76 > (unsigned __int16)(v77 + 2 - (_WORD)v74))
                v78 = 3;
              v75 = *(unsigned __int8 *)(v77 + v78);
              if (*(_BYTE *)(v77 + 2) == 45 && v76 > (unsigned __int16)(v77 + 2 - (_WORD)v74))
                v77 += 3;
              else
                v77 += 2;
              if (!v75)
                goto LABEL_105;
            }
          }
          else
          {
LABEL_105:
            *(_DWORD *)(v39 + 92) = 8;
          }
          v71 = 256;
        }
      }
      else
      {
        if (*(_QWORD *)(v39 + 40))
          v73 = 0;
        else
          v73 = *v46;
        v71 = PRtoktyp(*(unsigned __int8 *)(a2 + 20), v39, 0, *(unsigned __int8 *)(a2 + 26), v73);
        *(_DWORD *)(v39 + 4) = v71;
        v31 = v87;
        v23 = v88;
        v40 = v91;
        v38 = v92;
        v50 = v89;
        v49 = v90;
      }
LABEL_109:
      v72 = 5;
      if (v71 < 0 || v71 == 16)
        goto LABEL_116;
      v79 = *v48;
      if (v44 == v79 && (*((_BYTE *)v49 + 3) & 0x40) != 0
        || (_DWORD)v79 + 2 == v45 && (*((_BYTE *)v50 + 3) & 0x40) != 0)
      {
        v80 = SLcap(*(_QWORD *)(v39 + 24), 0, (__int16)(v55 - 1), (_QWORD *)(v39 + 52), v20);
        v50 = v89;
        v49 = v90;
        v40 = v91;
        v38 = v92;
        v31 = v87;
        v23 = v88;
        v72 = v80;
        goto LABEL_116;
      }
LABEL_117:
      if ((*((_BYTE *)v49 + 1) & 0x40) != 0 && v44 == *v48 || (*((_BYTE *)v50 + 1) & 0x40) != 0 && *v48 + 2 == v45)
        *(_BYTE *)(v39 + 50) = 1;
      v39 = *(_QWORD *)(v39 + 80);
      v45 = ++v44;
    }
    while (v44 < *v42);
    v3 = v86;
    v37 = *(unsigned __int16 *)(v86 + 50);
LABEL_124:
    ++v38;
  }
  while (v38 < v37);
LABEL_125:
  *(_WORD *)(v83 + 18) = v82;
  if (!*(_BYTE *)(v3 + 59))
    LOWORD(v30) = v30 - *(_WORD *)(*(_QWORD *)(v3 + 40) + 40 * v37 - 4);
  *(_WORD *)(v83 + 20) = v30;
  *(_BYTE *)(v83 + 4) = *(_BYTE *)(v3 + 64);
  *(_BYTE *)(v83 + 6) = *(_BYTE *)(v3 + 61);
  v81 = *(unsigned __int8 *)(v3 + 58);
  *(_BYTE *)(v83 + 8) = v81;
  *(_BYTE *)(v83 + 10) = *(_BYTE *)(v3 + 60);
  if (!*(_BYTE *)(v3 + 63) || v81 || *(_BYTE *)(v83 + 9))
  {
    *(_BYTE *)(v83 + 2) = 1;
    *(_WORD *)(v83 + 14) = v82;
    *(_WORD *)(v83 + 16) = v30;
    *(_QWORD *)(v83 + 64) = 0;
    *(_QWORD *)(v83 + 72) = 0;
  }
  else
  {
    *(_BYTE *)(v83 + 2) = 2;
    *(_DWORD *)(v83 + 14) = 0;
  }
  result = 0;
  *(_QWORD *)(v83 + 40) = *(_QWORD *)(v3 + 32);
  return result;
}

unsigned __int16 *PRisListEnum(unsigned __int16 *result, uint64_t a2, char *a3)
{
  unsigned int v4;
  unsigned int v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int16 v10;
  uint64_t v11;
  __int16 *v12;
  __int16 v13;
  uint64_t v14;
  const char *v15;
  char v16;
  char v17;

  *a3 = 0;
  v4 = result[9];
  if (v4 == 1)
  {
    v5 = result[1];
    if (v5 <= 2)
    {
      v6 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 16) + *result);
      if (v5 == 1)
      {
        v7 = 0;
        if (*(unsigned __int8 *)(*(_QWORD *)(a2 + 16) + *result) <= 0x6Eu)
        {
          switch(*(_BYTE *)(*(_QWORD *)(a2 + 16) + *result))
          {
            case '*':
              v7 = 4;
              goto LABEL_10;
            case '+':
              v7 = 2;
              goto LABEL_10;
            case ',':
              goto LABEL_12;
            case '-':
              v7 = 7;
              goto LABEL_10;
            case '.':
              v7 = 5;
              goto LABEL_10;
            default:
              if (v6 != 61)
                goto LABEL_12;
              v7 = 1;
              break;
          }
          goto LABEL_10;
        }
        if (*(unsigned __int8 *)(*(_QWORD *)(a2 + 16) + *result) <= 0x96u)
        {
          if (v6 == 111)
          {
            v7 = 3;
          }
          else
          {
            if (v6 != 126)
              goto LABEL_12;
            v7 = 6;
          }
          goto LABEL_10;
        }
        if (v6 != 151)
        {
          if (v6 != 183)
            goto LABEL_12;
          v7 = 9;
          goto LABEL_10;
        }
LABEL_9:
        v7 = 8;
LABEL_10:
        *a3 = v7;
LABEL_12:
        v4 = result[9];
        goto LABEL_13;
      }
      if (v6 == 45)
        goto LABEL_9;
    }
    v7 = 0;
    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:
  if (v4 == 2 && result[1] == 1 && result[2] == 1)
  {
    v8 = *(_QWORD *)(a2 + 16);
    v9 = *result;
    if (*(_BYTE *)(v8 + v9) == 45 && *(_BYTE *)(v9 + v8 + 1) == 45)
    {
      *a3 = 8;
      return result;
    }
  }
  if (!v7)
  {
    if (!v4)
    {
      v14 = 0;
LABEL_26:
      v15 = (const char *)(*(_QWORD *)(a2 + 16) + *result);
      v16 = v15[v14];
      v15[v14] = 0;
      result = (unsigned __int16 *)SLlisten(v15);
      if ((_DWORD)result == 1)
      {
        v17 = 10;
      }
      else
      {
        if ((_DWORD)result != 2)
        {
LABEL_31:
          v15[v14] = v16;
          return result;
        }
        v17 = 11;
      }
      *a3 = v17;
      goto LABEL_31;
    }
    v10 = 0;
    v11 = v4;
    v12 = (__int16 *)(result + 1);
    do
    {
      v13 = *v12++;
      v10 += v13;
      --v11;
    }
    while (v11);
    if (v4 <= 0xA)
    {
      v14 = v10;
      goto LABEL_26;
    }
  }
  return result;
}

uint64_t PRgermScan(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned __int16 v14;
  uint64_t v15;
  unsigned __int16 v16;
  __int16 *v17;
  __int16 v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __int16 *v26;
  unsigned __int16 v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int16 v31;
  __int16 *v32;
  __int16 v33;
  uint64_t v34;
  size_t v35;
  uint64_t v36;
  unsigned __int8 *v37;
  char *v38;
  uint64_t v39;
  char v40;
  unsigned int v41;
  char v42;
  uint64_t result;
  uint64_t v44;
  uint64_t v45;
  int v46;
  int v47;
  BOOL v48;
  int v49;
  uint64_t v51;
  __int16 *v52;
  __int16 v53;
  _BOOL4 v54;
  uint64_t v55;
  __int16 *v56;
  __int16 v57;
  unsigned int v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  BOOL v62;
  unsigned __int16 v63;
  char __s[65];
  uint64_t v65;

  v8 = a1;
  v65 = *MEMORY[0x1E0C80C00];
  v9 = *(_QWORD *)(a3 + 40);
  v10 = *(unsigned __int16 *)(a4 + 10);
  v11 = v10 - 1;
  v15 = v9 + 40 * (int)(v10 - 1);
  v12 = *(unsigned __int16 *)(a3 + 50);
  v13 = v12 - 1;
  v14 = *(_WORD *)v15;
  LODWORD(v15) = *(unsigned __int16 *)(v15 + 34);
  if (v15 >= 8)
    v15 = 8;
  else
    v15 = v15;
  v16 = v14;
  if ((_DWORD)v15)
  {
    v17 = (__int16 *)(v9 + 40 * *(unsigned __int16 *)(a4 + 10) - 38);
    v16 = v14;
    do
    {
      v18 = *v17++;
      v16 += v18;
      --v15;
    }
    while (v15);
  }
  if (*(_BYTE *)(a4 + 8) != 46 || *(_WORD *)(a4 + 6) != 1)
  {
    if (*(unsigned __int16 *)(a4 + 4) == v16 && !*(_WORD *)(v9 + 40 * (int)v13 + 32)
      || (*(_BYTE *)(v9 + 40 * (int)v13 + 38) & 0x40) != 0)
    {
      goto LABEL_44;
    }
    goto LABEL_28;
  }
  v19 = *(unsigned __int16 *)(a4 + 4);
  if (v19 != v16)
    goto LABEL_44;
  v20 = *(char *)(v9 + 40 * (int)v11 + 38);
  if (v20 < 0)
    goto LABEL_62;
  if ((*(_BYTE *)(v9 + 40 * (int)v13 + 38) & 0x40) != 0)
  {
LABEL_44:
    result = 0;
    *a5 = 1;
    *(_WORD *)(a3 + 50) = *(_WORD *)(a4 + 10);
    return result;
  }
  if (v16 < 2u)
    goto LABEL_62;
  v21 = *(_QWORD *)(a2 + 8);
  v22 = *(_QWORD *)(a3 + 16);
  if ((*(_DWORD *)(v21 + 4 * *(unsigned __int8 *)(v22 + (v19 - 1))) & 0x60000040) != 0)
  {
    v23 = *(unsigned __int8 *)(v22 + (v19 - 2));
    if (v23 == 46 || (*(_DWORD *)(v21 + 4 * v23) & 0x2000000) != 0)
      goto LABEL_62;
  }
  v24 = *(_DWORD *)(v9 + 40 * (int)v11 + 28);
  if (v24)
  {
    if ((v24 & 0x61100200) != 0)
    {
      v58 = *(unsigned __int16 *)(v9 + 40 * (int)v11 + 32);
      if ((((_WORD)v58 + 2) & 0xFFF8) != 0)
        v25 = 8;
      else
        v25 = (unsigned __int16)(v58 + 2);
      v60 = a1;
      v61 = a2;
      v59 = *(_BYTE *)(v9 + 40 * (int)v11 + 38);
      if ((_DWORD)v25)
      {
        v26 = (__int16 *)(v9 + 40 * *(unsigned __int16 *)(a4 + 10) - 38);
        v27 = v14;
        do
        {
          v28 = *v26++;
          v27 += v28;
          --v25;
        }
        while (v25);
        goto LABEL_61;
      }
LABEL_60:
      v27 = v14;
      goto LABEL_61;
    }
LABEL_62:
    result = 0;
    *a5 = 0;
    *(_BYTE *)(a4 + 2) = 0;
    return result;
  }
  v44 = v9 + 40 * (int)v11;
  v45 = *(unsigned __int16 *)(v44 + 32);
  v46 = *(unsigned __int16 *)(v44 + 2 * v45 + 2);
  v47 = *(_DWORD *)(v44 + 24);
  v48 = (v47 & 0x60000000) != 0 && v46 == 1;
  v49 = v47 & 0x61100200;
  if (v48 || v49 == 0)
    goto LABEL_62;
  v58 = v45;
  if (v45 >= 8)
    v51 = 8;
  else
    v51 = v45;
  v60 = a1;
  v61 = a2;
  v59 = v20;
  if (!(_DWORD)v51)
    goto LABEL_60;
  v52 = (__int16 *)(v9 + 40 * *(unsigned __int16 *)(a4 + 10) - 38);
  v27 = v14;
  do
  {
    v53 = *v52++;
    v27 += v53;
    --v51;
  }
  while (v51);
LABEL_61:
  v54 = PRisRoman((unsigned __int8 *)(v22 + v27));
  v8 = v60;
  a2 = v61;
  if (v54)
    goto LABEL_62;
  if (v58 >= 8)
    v55 = 8;
  else
    v55 = v58;
  if ((_DWORD)v55)
  {
    v56 = (__int16 *)(v9 + 40 * v10 - 38);
    do
    {
      v57 = *v56++;
      v14 += v57;
      --v55;
    }
    while (v55);
  }
  if ((v59 & 0x20) != 0)
    goto LABEL_28;
  v62 = 0;
  result = PRpendTermIsDot(v60, v61, a3, v14, v16, 1, 0, &v63, &v62);
  if (!(_DWORD)result)
  {
    a2 = v61;
    v8 = v60;
    if (!v62)
      goto LABEL_44;
LABEL_28:
    v29 = *(unsigned __int16 *)(v9 + 40 * (int)v13);
    if (*(unsigned __int16 *)(v9 + 40 * (int)v13 + 18) >= 8u)
      v30 = 8;
    else
      v30 = *(unsigned __int16 *)(v9 + 40 * (int)v13 + 18);
    v31 = *(_WORD *)(v9 + 40 * (int)v13);
    if ((_DWORD)v30)
    {
      v32 = (__int16 *)(v9 + 40 * v12 - 38);
      v31 = *(_WORD *)(v9 + 40 * (int)v13);
      do
      {
        v33 = *v32++;
        v31 += v33;
        --v30;
      }
      while (v30);
    }
    LODWORD(v34) = (__int16)(v31 - v29);
    if ((int)v34 <= 64)
    {
      v35 = *(_QWORD *)(a2 + 128);
      if ((_DWORD)v29 == v31)
      {
        v34 = (unsigned __int16)(v31 - v29);
      }
      else
      {
        v36 = *(_QWORD *)(a2 + 8);
        v34 = (unsigned __int16)v34;
        v37 = (unsigned __int8 *)(*(_QWORD *)(a3 + 16) + v29);
        v38 = __s;
        v39 = (unsigned __int16)v34;
        do
        {
          v41 = *v37++;
          v40 = v41;
          v42 = v41 + 32;
          if ((*(_DWORD *)(v36 + 4 * v41) & 0x40000000) != 0)
            v40 = v42;
          *v38++ = v40;
          --v39;
        }
        while (v39);
      }
      __s[v34] = 0;
      *(_BYTE *)(v35 + 1412) = 0;
      *(_DWORD *)(v35 + 1408) = 1;
      if (PRIcs(v8, a2, 0, 0, 0, __s, 0, v35, 3, 0) == 8)
        return 220;
      if ((*(_QWORD *)(v35 + 1328) & 0x400) != 0)
        goto LABEL_62;
    }
    goto LABEL_44;
  }
  return result;
}

BOOL PRisDutchOpenCompound(uint64_t a1, uint64_t a2, unsigned __int16 *a3)
{
  unsigned __int16 v3;
  unsigned __int16 v4;
  uint64_t v5;
  __int16 *v6;
  __int16 v7;
  unsigned __int8 *v8;

  v3 = a3[16];
  if (a3[9] < (unsigned __int16)(v3 + 3))
    return 0;
  v4 = *a3;
  LOWORD(v5) = v3 - 1;
  v5 = (v5 & 0xFFF8) != 0 ? 8 : (unsigned __int16)v5;
  if ((_DWORD)v5)
  {
    v6 = (__int16 *)(a3 + 1);
    do
    {
      v7 = *v6++;
      v4 += v7;
      --v5;
    }
    while (v5);
  }
  v8 = (unsigned __int8 *)(*(_QWORD *)(a2 + 16) + v4);
  return (*(_DWORD *)(a1 + 4 * *v8 + 16) & 0x8000) != 0
      && v8[1] == 115
      && (*(_DWORD *)(a1 + 4 * v8[2] + 16) & 0x4000) != 0
      && (*(_DWORD *)(a1 + 4 * v8[3] + 16) & 0x40000000) != 0;
}

uint64_t PRpendTermIsDot(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, int a6, unsigned __int8 a7, unsigned __int16 *a8, BOOL *a9)
{
  __int16 v12;
  size_t v14;
  uint64_t v15;
  char v16;
  int v17;
  uint64_t result;
  unsigned __int16 v19;
  BOOL v20;

  v12 = a4;
  v14 = *(_QWORD *)(a2 + 128);
  v15 = *(_QWORD *)(a3 + 16);
  v16 = *(_BYTE *)(v15 + a5);
  *(_BYTE *)(v15 + a5) = 0;
  *(_BYTE *)(v14 + 1412) = a6;
  *(_DWORD *)(v14 + 1408) = a7;
  v17 = PRIcs(a1, a2, 0, 0, 0, (char *)(*(_QWORD *)(a3 + 16) + a4), 0, v14, 3, 0);
  *(_BYTE *)(*(_QWORD *)(a3 + 16) + a5) = v16;
  if (v17 == 8)
    return 220;
  if ((v17 & 0xFFFFFFF7) == 2)
  {
    v19 = strlen((const char *)(v14 + 1547));
    *a8 = v19;
    v20 = a6
       && v19
       && *(_BYTE *)(v14 + v19 - 1 + 1547) == 46
       && (v19 > (unsigned __int16)(a5 - v12) || *(_BYTE *)(v14 + 1614));
  }
  else
  {
    v20 = 0;
    *a8 = 0;
  }
  result = 0;
  *a9 = v20;
  return result;
}

BOOL PRisRoman(unsigned __int8 *a1)
{
  uint64_t v1;
  unsigned int v2;
  unsigned __int8 *v3;

  v1 = 0;
  while (1)
  {
    v2 = *a1;
    if (v2 > 0x55)
    {
      if (v2 == 86)
      {
        v3 = (unsigned __int8 *)&romanFsa + 3 * v1 + 1;
      }
      else
      {
        if (v2 != 88)
          return 0;
        v3 = (unsigned __int8 *)&romanFsa + 3 * v1 + 2;
      }
      goto LABEL_9;
    }
    if (v2 != 73)
      break;
    v3 = (unsigned __int8 *)&romanFsa + 3 * v1;
LABEL_9:
    v1 = *v3;
    ++a1;
    if (!(_DWORD)v1)
      return 0;
  }
  return v2 == 46 && v1 != 0;
}

uint64_t PRssClr(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  void *v5;

  if (!a1)
    return 220;
  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 56);
    if (v4)
    {
      v5 = *(void **)(v4 + 16);
      if (v5)
        free(v5);
    }
  }
  if (*(_QWORD *)(a1 + 56))
    FreeList((void **)(a1 + 56));
  result = *(_QWORD *)(a1 + 40);
  if (result)
  {
    free((void *)result);
    result = 0;
    *(_QWORD *)(a1 + 40) = 0;
  }
  return result;
}

uint64_t PRSSWdGet(const char *a1, unsigned int a2, char *a3, uint64_t a4)
{
  unsigned __int16 *v4;
  uint64_t v8;
  signed int v9;
  int v10;
  unsigned int v11;
  __int16 v12;
  unsigned __int16 v13;
  int v14;
  signed int v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  char v20;
  _BOOL4 v21;
  char v22;
  int v24;

  v24 = 0;
  *a3 = 0;
  v4 = *(unsigned __int16 **)(a4 + 64);
  if (v4)
  {
    v8 = *((_QWORD *)v4 + 1);
    v9 = *v4;
    v10 = *((_DWORD *)v4 + 1);
    v11 = v4[1];
    v12 = strlen(a1);
    SLfun((uint64_t)a1, 0, (__int16)(v12 - 1), (unsigned __int16 *)&v24 + 1, &v24);
    v13 = 0;
    v14 = (unsigned __int16)(v10 & HIWORD(v24));
    v15 = (unsigned __int16)v24 % v9;
    v16 = 2 * v14;
    v17 = v14 + (v10 >> 1) + v9;
    while (1)
    {
      v18 = 3 * v15;
      v19 = *(unsigned __int8 *)(v8 + (int)v18 + 1) | (*(unsigned __int8 *)(v8 + v18) << 8);
      if (v19 == HIWORD(v24))
        break;
      v15 += v17;
      do
        v15 -= v9;
      while (v15 >= v9);
      if (v11 >= v13)
      {
        ++v13;
        v17 += v16;
        if (v19)
          continue;
      }
      return 0;
    }
    v20 = *(_BYTE *)((int)v18 + v8 + 2);
    *a3 = v20;
    if (a2 >= 3)
    {
      if (a2 != 3)
        return 0;
      v21 = (v20 & 4) == 0;
    }
    else
    {
      v20 = *a3;
      v21 = (*a3 & 3u) > a2;
    }
    v22 = v20 & 0xF8;
    if (v21)
      v22 = 0;
    *a3 = v22;
  }
  return 0;
}

uint64_t PRtoktyp(unsigned int a1, uint64_t a2, unsigned __int8 *a3, int a4, unsigned int a5)
{
  uint64_t v10;
  int v11;
  uint64_t result;
  unsigned __int8 *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  int v19;
  unsigned __int8 *v20;
  int v21;
  unsigned __int8 *v22;
  int v23;
  __int16 v24;
  unsigned __int8 v25;
  __int16 v26;
  unsigned __int8 v27;
  int v28;
  int *v29;
  unsigned __int8 *v30;
  unsigned int v31;
  unsigned int v32;
  unsigned __int8 *v33;
  unsigned int v34;
  unsigned int v35;
  unsigned __int8 *v36;
  char v37;
  unsigned int v38;
  char v39;
  unsigned int v40;
  unsigned int v41;
  BOOL v43;
  unsigned int v44;
  unsigned int v45;
  unsigned __int8 *v46;
  int v47;
  int v48;
  unsigned int v49;

  v10 = SLLngToA(a1);
  if (a2)
    a3 = *(unsigned __int8 **)(a2 + 24);
  v11 = strlen((const char *)a3);
  result = (unsigned __int16)v11;
  switch((__int16)v11)
  {
    case 0:
      return result;
    case 1:
      v13 = a3;
      if (a2)
        v13 = *(unsigned __int8 **)(a2 + 24);
      v14 = *v13;
      v15 = *(_DWORD *)(v10 + 4 * v14);
      if ((v15 & 0x20000000) != 0)
        return 0x4000;
      if ((v15 & 0x40000000) != 0)
        return 4096;
      if (a2 && (_DWORD)v14 == 45)
      {
        result = 2147483656;
        if ((*(_DWORD *)(v10 + 4 * a5) & 0x60000040) == 0)
        {
          v16 = *(_QWORD *)(a2 + 72);
          if (!v16
            || *(_QWORD *)(v16 + 40)
            || (*(_DWORD *)(v10
                          + 4 * *(unsigned __int8 *)(*(_QWORD *)(v16 + 16) + *(unsigned __int16 *)(v16 + 32) - 1)) & 0x60000040) == 0)
          {
            return 2147483652;
          }
        }
        return result;
      }
      v24 = 0;
      v25 = 0;
      v26 = 40;
      v27 = 40;
      while (2)
      {
        if (OneByteTokenType_PunTab[2 * v25] == (_DWORD)v14)
        {
          v29 = &OneByteTokenType_PunTab[2 * v25];
        }
        else
        {
          if (OneByteTokenType_PunTab[2 * v27] != (_DWORD)v14)
          {
            v28 = (unsigned __int16)(v24 + v26) >> 1;
            if (OneByteTokenType_PunTab[2 * v28] >= v14)
              v27 = v28;
            else
              v25 = v28 + 1;
            v24 = v25;
            v26 = v27;
            if (v25 == v27)
            {
              result = v15 & 0x200;
              goto LABEL_72;
            }
            continue;
          }
          v29 = &OneByteTokenType_PunTab[2 * v27];
        }
        break;
      }
      result = v29[1];
LABEL_72:
      if (!(_DWORD)result)
      {
        v17 = *a3;
        goto LABEL_74;
      }
      return result;
    case 2:
      v17 = *a3;
      if (v17 > 0x3B)
      {
        if (v17 == 60)
        {
          if (a3[1] != 60)
          {
            v17 = 60;
            goto LABEL_75;
          }
          return 3221225536;
        }
        else
        {
          if (v17 != 62)
            goto LABEL_74;
          if (a3[1] != 62)
          {
            v17 = 62;
            goto LABEL_75;
          }
          return 3758096448;
        }
      }
      else
      {
        if (v17 != 45)
        {
          if (v17 != 46)
            goto LABEL_74;
          if (a1 == 10 && a3[1] == 46)
            return 2147484160;
          goto LABEL_75;
        }
        if (a3[1] != 45)
        {
          v17 = 45;
          goto LABEL_75;
        }
        return 2147483904;
      }
    case 3:
      v17 = *a3;
      if (v17 != 46)
        goto LABEL_32;
      if (a3[1] == 46 && a3[2] == 46)
        return 2147484160;
      v17 = 46;
      goto LABEL_32;
    default:
      v17 = *a3;
LABEL_32:
      v18 = v11 << 16;
      if (v18 <= 196608)
        goto LABEL_74;
      if (v18 == 327680 && v17 == 46)
      {
        if (a3[2] == 46 && a3[4] == 46 && a3[1] == 32 && a3[3] == 32)
          return 2147484160;
      }
      else if (v17 - 45 > 1)
      {
        goto LABEL_74;
      }
      v19 = a3[1];
      if (!a3[1])
        return 2147485696;
      if (v19 == 32)
      {
        v20 = a3 + 3;
        while (v19 == 32)
        {
          if (*(v20 - 1) != v17)
            goto LABEL_74;
          v21 = *v20;
          v20 += 2;
          v19 = v21;
        }
        if (!v19)
          return 2147485696;
      }
      else
      {
        v22 = a3 + 2;
        while (v17 == v19)
        {
          v23 = *v22++;
          v19 = v23;
          if (!v23)
            return 2147485696;
        }
      }
LABEL_74:
      if (!v17)
        return 32;
LABEL_75:
      v30 = a3 + 1;
      v31 = v17;
      while ((*(_DWORD *)(v10 + 4 * v31) & 0x8000000) != 0)
      {
        v32 = *v30++;
        v31 = v32;
        if (!v32)
          return 32;
      }
      v33 = a3 + 1;
      v34 = v17;
      while ((*(_DWORD *)(v10 + 4 * v34) & 0x40000000) != 0)
      {
        v35 = *v33++;
        v34 = v35;
        if (!v35)
          return 0x2000;
      }
      v36 = a3 + 1;
      v37 = 1;
      v38 = v17;
      do
      {
        v39 = v37;
        if ((*(_DWORD *)(v10 + 4 * v38) & 0x200) == 0)
        {
          v46 = a3 + 1;
          v47 = 1;
          while (1)
          {
            if (v17 != a4)
            {
              v48 = *(_DWORD *)(v10 + 4 * v17);
              if ((v48 & 0x60000040) == 0)
              {
                if ((v48 & 0x68000000) != 0)
                {
                  v47 = 0;
                }
                else if ((v48 & 0x1000000) == 0)
                {
                  return 0;
                }
              }
            }
            v49 = *v46++;
            v17 = v49;
            if (!v49)
            {
              v43 = v47 == 0;
              v44 = 128;
              v45 = 64;
              goto LABEL_100;
            }
          }
        }
        v41 = *v36++;
        v40 = v41;
        if (v38 != v41 && v40 != 0)
          v37 = 0;
        v38 = v40;
      }
      while (v40);
      v43 = v39 == 0;
      v44 = 2048;
      v45 = 1024;
LABEL_100:
      if (v43)
        return v45;
      else
        return v44;
  }
}

void FreeList(void **a1)
{
  _QWORD *v2;
  _QWORD *v3;

  v2 = *a1;
  v3 = v2;
  if (v2)
  {
    do
    {
      v2 = (_QWORD *)v2[22];
      FreeTokenNode((uint64_t *)&v3);
      v3 = v2;
    }
    while (v2);
    if (*a1)
      free(*a1);
  }
  *a1 = 0;
}

void FreeTokenNode(uint64_t *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  _QWORD *v11;

  v2 = *a1;
  v3 = *(void **)(*a1 + 144);
  if (v3)
  {
    if (((*(_DWORD *)(v2 + 92) >> 17) & 1) + *(_WORD *)(v2 + 136))
    {
      v4 = 0;
      v5 = 8 * (unsigned __int16)(((*(_DWORD *)(v2 + 92) >> 17) & 1) + *(_WORD *)(v2 + 136));
      do
      {
        v6 = *(void **)(*(_QWORD *)(v2 + 144) + v4);
        if (v6)
          free(v6);
        v4 += 8;
      }
      while (v5 != v4);
      v3 = *(void **)(v2 + 144);
    }
    free(v3);
  }
  v7 = *(void **)(v2 + 104);
  if (v7)
    free(v7);
  v8 = *(void **)(v2 + 112);
  if (v8)
    free(v8);
  v9 = *(void **)(v2 + 128);
  if (v9)
    free(v9);
  v10 = *(_QWORD **)(v2 + 160);
  if (v10)
  {
    do
    {
      v11 = (_QWORD *)v10[5];
      PRfreeErr(v10);
      *(_QWORD *)(v2 + 160) = v11;
      v10 = v11;
    }
    while (v11);
  }
  if (*(_QWORD *)(v2 + 152) != v2)
    free((void *)v2);
  *a1 = 0;
}

uint64_t PRFillError(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8;
  int v9;
  unint64_t v10;
  int v11;
  BOOL v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  uint64_t v29;
  int v30;
  int v31;
  char *i;
  int v33;
  uint64_t v35;
  unsigned __int16 *v36;
  unsigned __int16 *v37;
  int v38;
  int v39;
  int v40;
  int v41;
  char *v42;
  int v43;
  __int16 *j;
  int v45;
  uint64_t v46;
  int v47;
  unsigned int v48;

  v8 = *(_QWORD *)(a2 + 128);
  v9 = *(unsigned __int16 *)(v8 + 1322);
  v10 = *(_QWORD *)(v8 + 1328);
  v11 = *(_DWORD *)(v8 + 4);
  if (*(_BYTE *)(v8 + 1690))
    v12 = v11 == 2;
  else
    v12 = 0;
  if (v12)
    v13 = (v10 >> 10) & 1;
  else
    v13 = 0;
  if ((v13 & 1) == 0 && *(_BYTE *)(v8 + 1690))
    v13 = *(unsigned __int16 *)(v8 + 1686);
  v14 = *(unsigned __int8 *)(v8 + 8);
  if (((a4 != 0) & ((unsigned __int16)(v9 & 0x800) >> 11)) != 0)
    v15 = v10 & 0xFFFFFBFF;
  else
    v15 = *(_QWORD *)(v8 + 1328);
  if ((v10 & 0x400) != 0)
    v16 = v15;
  else
    v16 = *(_QWORD *)(v8 + 1328);
  if ((v16 & 0x8000) != 0 && v11 != 11)
  {
    if (v14 == 6
      && (v17 = *(_QWORD *)(a3 + 72)) != 0
      && *(unsigned __int8 *)(a3 + 51) != *(unsigned __int8 *)(v17 + 51))
    {
      *(_QWORD *)(v8 + 1328) = v10 & 0xFFFFFFFFFFFF7FFFLL;
    }
    else if (PRMakenFillErr(a1, a2, v8, a3, "", 0, 4u, 1, a4))
    {
      return 8;
    }
  }
  v48 = v13;
  if ((v16 & 0x1000000) != 0)
  {
    if (v11 == 2)
      v18 = 6;
    else
      v18 = 4;
    if (PRMakenFillErr(a1, a2, v8, a3, "", 0, 1u, v18, a4))
      return 8;
  }
  else
  {
    v18 = 0;
  }
  if ((v16 & 0x40000) != 0 && PRMakenFillErr(a1, a2, v8, a3, "", 0, 0x34u, 100, a4))
    return 8;
  v19 = v16 & 0x10000000;
  if (v14 != 16 || v19 == 0)
  {
    if (v14 != 15 || v19 == 0)
    {
      if (v14 != 4)
        goto LABEL_53;
      if (v16 == 0x4000000)
      {
        v22 = PRMakenFillErr(a1, a2, v8, a3, "", 0, 7u, 5, a4);
      }
      else
      {
        if (v16 != 0x8000000)
          goto LABEL_53;
        v22 = PRMakenFillErr(a1, a2, v8, a3, "", 0, 7u, 4, a4);
      }
    }
    else
    {
      v24 = *(unsigned __int16 *)(v8 + 1404);
      if ((v24 - 1) > 0x1B)
        goto LABEL_53;
      v22 = PRMakenFillErr(a1, a2, v8, a3, *((char **)&pGreekErrors + 2 * (v24 - 1) + 1), *((unsigned __int8 *)&pGreekErrors + 16 * (v24 - 1) + 1), 6u, *((unsigned __int8 *)&pGreekErrors + 16 * (v24 - 1)), a4);
    }
  }
  else
  {
    v23 = *(unsigned __int16 *)(v8 + 1404);
    if (v23 == 30)
    {
      v22 = PRMakenFillErr(a1, a2, v8, a3, "", 0, 6u, 2, a4);
    }
    else
    {
      if (v23 != 29)
        goto LABEL_53;
      v22 = PRMakenFillErr(a1, a2, v8, a3, "", 0, 6u, 1, a4);
    }
  }
  if (v22)
    return 8;
LABEL_53:
  v46 = a1;
  v47 = v9;
  if ((v9 & 0x100) != 0)
  {
    if (v14 == 16)
    {
      v26 = *(char **)(a3 + 16);
      v27 = strchr(v26, 45);
      if (v27)
      {
        v28 = v27;
        if (v27 > v26 + 1 && *(v27 - 1) == 121 && *(v27 - 2) == 108)
        {
          *v27 = 32;
          v29 = PRMakenFillErr(v46, a2, v8, a3, *(char **)(a3 + 16), 1uLL, 0x3Cu, 46, a4);
          *v28 = 45;
          if ((_DWORD)v29)
            return v29;
        }
      }
    }
    else if (PRMakenFillErr(a1, a2, v8, a3, "", 0, 7u, 2, a4))
    {
      return 8;
    }
  }
  v25 = v46;
  if (v16 & 8 | v47 & 0x10)
  {
    if ((v47 & 0x40) != 0)
    {
      if ((v47 & 4) != 0)
      {
        v18 = 2;
      }
      else if ((v47 & 2) != 0)
      {
        v18 = 4;
      }
      else if (!v18)
      {
        goto LABEL_75;
      }
    }
    else if ((v47 & 0x10) != 0)
    {
      v18 = 3;
    }
    else
    {
      v18 = 1;
    }
    if (PRMakenFillErr(v46, a2, v8, a3, "", 0, 2u, v18, a4))
      return 8;
  }
LABEL_75:
  if ((v16 & 2) != 0)
  {
    if ((v14 & 0xFE) == 8)
    {
      *(_WORD *)(a3 + 98) &= 0xF0FFu;
      v30 = PRMakenFillErr(v46, a2, v8, a3, "", 0, 1u, 1, a4);
    }
    else
    {
      v30 = PRMakenFillErr(v46, a2, v8, a3, "", 0, 0xAu, 1, a4);
    }
    if (v30)
      return 8;
    if (v14 == 8)
      v16 &= ~0x400u;
  }
  if ((v16 & 1) != 0 && PRMakenFillErr(v46, a2, v8, a3, "", 0, 9u, 1, a4))
    return 8;
  if (v11 == 11)
  {
    if ((v16 & 0x20) != 0)
      v33 = PRMakenFillErr(v46, a2, v8, a3, "", 0, 1u, 3, a4);
    else
      v33 = PRMakenFillErr(v46, a2, v8, a3, "", 0, 1u, 1, a4);
    if (v33)
      return 8;
    return 0;
  }
  if (v11 == 3)
  {
    v31 = 128;
    for (i = &byte_1DE2F1D14;
          (v31 & v16) == 0
       || !PRMakenFillErr(v46, a2, v8, a3, "", 0, *i, i[1], a4);
          i += 8)
    {
      v31 = *((_DWORD *)i + 1);
      if (!v31)
        return 0;
    }
    return 8;
  }
  if (v11 != 2)
    return 0;
  if (v14 == 16 && (v16 & 0x4000) != 0)
  {
    if (!PRMakenFillErr(v46, a2, v8, a3, (char *)(v8 + 1690), v48, 0x33u, 4, a4))
    {
LABEL_131:
      v41 = 4;
      v42 = &byte_1DE2F1D34;
      while ((v41 & v16) == 0
           || !PRMakenFillErr(v25, a2, v8, a3, (char *)(v8 + 1690), v48, *v42, v42[1], a4))
      {
        v41 = *((_DWORD *)v42 + 1);
        v42 += 8;
        if (!v41)
          goto LABEL_135;
      }
      return 8;
    }
    return 8;
  }
  if (v14 != 6)
  {
LABEL_130:
    v25 = v46;
    if (v16)
      goto LABEL_131;
LABEL_135:
    if (v47)
    {
      v43 = 512;
      for (j = &word_1DE2F1D74;
            (v43 & v47) == 0
         || !PRMakenFillErr(v25, a2, v8, a3, (char *)(v8 + 1690), v48, *((unsigned __int8 *)j - 2), *((unsigned __int8 *)j - 1), a4);
            j += 2)
      {
        v45 = (unsigned __int16)*j;
        v43 = v45;
        if (!v45)
          return 0;
      }
      return 8;
    }
    return 0;
  }
  if ((v16 & 0x400000) != 0 && PRMakenFillErr(v46, a2, v8, a3, (char *)(v8 + 1690), v48, 0x33u, 3, a4))
    return 8;
  if ((v16 & 0x400) == 0 || !a4 || (v47 & 0x400) == 0)
    goto LABEL_125;
  v35 = *(_QWORD *)(v46 + 16);
  v36 = *(unsigned __int16 **)(v35 + 64);
  v16 &= ~0x400u;
  if (!v36)
    v36 = *(unsigned __int16 **)(v35 + 56);
  v37 = *(unsigned __int16 **)(a3 + 72);
  if (!v37)
    goto LABEL_125;
  v38 = *((_DWORD *)v37 + 1);
  if (v38 <= -1072693249)
  {
    if (v38 == -2147483584)
      goto LABEL_125;
    v39 = -1073709056;
  }
  else
  {
    if (v38 == -1072693248 || v38 == -536870910)
      goto LABEL_125;
    v39 = -536870848;
  }
  if (v38 != v39)
  {
    while ((*((_DWORD *)v37 + 1) & 0x80000000) != 0)
    {
      v37 = (unsigned __int16 *)*((_QWORD *)v37 + 9);
      if (!v37)
        goto LABEL_124;
    }
    if (!v36 || *v37 < *v36)
    {
LABEL_124:
      v25 = v46;
      goto LABEL_125;
    }
    v25 = v46;
    if (PRMakenFillErr(v46, a2, v8, a3, (char *)(v8 + 1690), v48, 3u, 3, a4))
      return 8;
  }
LABEL_125:
  if ((v47 & 1) == 0)
    goto LABEL_130;
  v40 = v48 <= 1 ? 1 : 2;
  v29 = 8;
  if (!PRMakenFillErr(v25, a2, v8, a3, (char *)(v8 + 1690), v48, 8u, v40, a4))
    goto LABEL_130;
  return v29;
}

uint64_t PRMakenFillErr(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, size_t a6, unsigned int a7, int a8, char a9)
{
  int v17;
  int v18;
  uint64_t result;
  __int16 v20;
  __int16 v21;
  _WORD *v22;
  __int16 v23;
  uint64_t v24;
  char *v25;
  size_t v26;
  __int16 v27;
  __int16 v28;
  uint64_t v29;
  char *v30;
  int v31;
  unsigned __int16 v32;
  int v33;
  BOOL v34;
  int v35;
  char v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  size_t v40;
  unsigned __int16 v41;
  uint64_t v42;
  uint64_t v43;
  unsigned __int16 v44;
  int v45[2];
  char v46[66];
  char v47[65];
  char __s[65];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(a4 + 16))
    return 8;
  v17 = *(unsigned __int8 *)(a2 + 26);
  *(_QWORD *)v45 = 0;
  if (a9)
  {
    v18 = PRliveRule(a1, a2, 0, a7, a8, 0, 1);
    if (v18)
    {
      if (v18 == 4)
        return 0;
      else
        return 8;
    }
    if (PRmkErr(a1, a2, v45, a4, 0, a7, a8))
      return 8;
    if (a7 == 5 && (a8 & 0xFE) == 2)
    {
      if (a8 == 2)
      {
        v27 = *(_WORD *)(*(_QWORD *)(a4 + 72) + 8);
        v28 = *(_WORD *)(a4 + 32) - v27 + *(_WORD *)(a4 + 8);
      }
      else
      {
        v27 = *(_WORD *)(a4 + 8);
        v28 = *(_WORD *)(*(_QWORD *)(a4 + 80) + 32) - v27 + *(_WORD *)(*(_QWORD *)(a4 + 80) + 8);
      }
      goto LABEL_26;
    }
    if (a7 == 6)
    {
      v29 = *(_QWORD *)(a4 + 72);
      v27 = *(_WORD *)(v29 + 8);
      v28 = *(_WORD *)(v29 + 32);
LABEL_26:
      v22 = *(_WORD **)v45;
      **(_WORD **)v45 = v27;
      v22[1] = v28;
LABEL_27:
      switch(a7)
      {
        case 1u:
          if ((a8 & 0xFFFFFFFB) == 2)
            goto LABEL_45;
          if (a8 != 5)
            goto LABEL_80;
          goto LABEL_34;
        case 2u:
          switch(a8)
          {
            case 1:
              __strcpy_chk();
              v31 = 0;
              do
              {
                v32 = v31;
                v33 = v46[(unsigned __int16)v31++];
                if (v33)
                  v34 = v33 == v17;
                else
                  v34 = 1;
              }
              while (!v34);
              goto LABEL_95;
            case 2:
              __strcpy_chk();
              v41 = v46[0];
              if (v46[0])
              {
                v42 = 0;
                v41 = 0;
                do
                {
                  if (*(unsigned __int8 *)(*(_QWORD *)(a4 + 16) + v42) == v17)
                    break;
                  v42 = ++v41;
                }
                while (v46[v41]);
              }
              PRinsOneHyp(v46, (_DWORD *)(a3 + 3156), v17, v41);
              if (PRaddAlts(a1, *(uint64_t *)v45, v46, 0, 1uLL, 0))
                return 8;
              __strcpy_chk();
              v32 = v46[0];
              if (!v46[0])
                goto LABEL_95;
              v43 = 0;
              v44 = 0;
              while (*(unsigned __int8 *)(*(_QWORD *)(a4 + 16) + v43) != v17)
              {
                v43 = ++v44;
                v32 = v44;
                if (!v46[v44])
                  goto LABEL_95;
              }
              goto LABEL_102;
            case 3:
              __strcpy_chk();
              v32 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a3 + 3184) + 288) + 18);
              goto LABEL_95;
            case 4:
              __strcpy_chk();
              if (PRaddAlts(a1, *(uint64_t *)v45, v46, 0, 1uLL, 0))
                return 8;
              __strcpy_chk();
              v32 = v46[0];
              if (!v46[0])
                goto LABEL_95;
              v44 = 0;
              break;
            default:
              return 8;
          }
          break;
        case 3u:
          if (a8 == 3)
          {
            v30 = *(char **)(a4 + 16);
          }
          else
          {
            if (a8 != 1)
              goto LABEL_80;
LABEL_45:
            __strcpy_chk();
            __strcat_chk();
LABEL_52:
            __strcat_chk();
            v22 = *(_WORD **)v45;
            v30 = v47;
          }
          goto LABEL_76;
        case 4u:
        case 5u:
        case 7u:
        case 8u:
          goto LABEL_11;
        case 6u:
          v35 = *(unsigned __int8 *)(a3 + 8);
          if (v35 == 16)
          {
            v46[0] = 97;
            if (a8 == 1)
            {
              v46[2] = 0;
              v36 = 110;
            }
            else
            {
              v36 = 0;
            }
            v46[1] = v36;
            if (a9 && *(_BYTE *)(*(_QWORD *)(a4 + 72) + 51))
              v46[0] = 65;
            v30 = v46;
LABEL_76:
            v39 = a1;
            v40 = 1;
          }
          else
          {
            if (!(_DWORD)a6 || v35 != 15)
              goto LABEL_80;
            v39 = a1;
            v30 = a5;
            v40 = a6;
          }
          if (!PRaddAlts(v39, (uint64_t)v22, v30, 0, v40, 0))
            goto LABEL_80;
          return 8;
        case 9u:
          if (a8 == 1)
            goto LABEL_60;
          if (a8 != 2)
            goto LABEL_80;
          __strcpy_chk();
          goto LABEL_52;
        case 0xAu:
          if (a8 == 3)
          {
            __strcpy_chk();
            __strcat_chk();
            if (PRaddAlts(a1, *(uint64_t *)v45, v47, 0, 1uLL, 0))
              return 8;
            goto LABEL_69;
          }
          if (a8 != 2)
            goto LABEL_57;
          __strcpy_chk();
          __strcat_chk();
          __strcat_chk();
          if (PRaddAlts(a1, *(uint64_t *)v45, v47, 0, 1uLL, 0))
            return 8;
          goto LABEL_58;
        default:
          if (a7 != 51)
            goto LABEL_11;
          if (a8 == 1)
            goto LABEL_45;
          if ((a8 - 3) > 1u)
            goto LABEL_80;
LABEL_34:
          v30 = (char *)(a3 + 1690);
          goto LABEL_76;
      }
      while (((*(_DWORD *)(a3 + 1640 + 4 * (v44 >> 5)) >> ~(_BYTE)v44) & 1) == 0)
      {
        v32 = ++v44;
        if (!v46[v44])
          goto LABEL_95;
      }
LABEL_102:
      v32 = v44;
LABEL_95:
      PRinsOneHyp(v46, (_DWORD *)(a3 + 1640), v17, v32);
      v22 = *(_WORD **)v45;
      v25 = v46;
      v24 = a1;
      v26 = 1;
LABEL_13:
      if (!PRaddAlts(v24, (uint64_t)v22, v25, 0, v26, 0))
        goto LABEL_14;
      return 8;
    }
  }
  else if (PRmkErr(a1, a2, v45, a4, 0, a7, a8))
  {
    return 8;
  }
  v20 = *(_WORD *)(a4 + 32);
  v21 = *(_WORD *)(a4 + 8);
  v22 = *(_WORD **)v45;
  **(_WORD **)v45 = v21;
  v22[1] = v20;
  if (a7 != 4 || !a9)
    goto LABEL_27;
  v23 = *(_WORD *)(*(_QWORD *)(a4 + 72) + 48);
  v22[4] = v21 - v23;
  v22[5] = v20 + v23;
LABEL_11:
  if ((_DWORD)a6)
  {
    v24 = a1;
    v25 = a5;
    v26 = a6;
    goto LABEL_13;
  }
LABEL_14:
  if (a7 == 10)
  {
LABEL_57:
    if ((a8 - 1) <= 1u)
    {
LABEL_58:
      __strcpy_chk();
      result = PRaddRefs(a1, *(uint64_t *)v45, __s, 1u, 0);
      if ((_DWORD)result)
        return result;
      __strcpy_chk();
      v37 = *(_QWORD *)v45;
      v38 = v47;
      goto LABEL_82;
    }
    if (a8 != 3)
      goto LABEL_80;
LABEL_69:
    __strcpy_chk();
    result = PRaddRefs(a1, *(uint64_t *)v45, v47, 1u, 0);
    if ((_DWORD)result)
      return result;
  }
  else
  {
    if (a7 != 9 || a8 != 1)
    {
LABEL_80:
      v37 = *(_QWORD *)v45;
      v38 = *(char **)(a4 + 24);
      if (!v38)
        v38 = *(char **)(a4 + 16);
      goto LABEL_82;
    }
LABEL_60:
    __strcpy_chk();
    result = PRaddRefs(a1, *(uint64_t *)v45, v47, 1u, 0);
    if ((_DWORD)result)
      return result;
  }
  __strcpy_chk();
  v37 = *(_QWORD *)v45;
  v38 = __s;
LABEL_82:
  result = PRaddRefs(a1, v37, v38, 1u, 0);
  if (!(_DWORD)result)
    return 0;
  return result;
}

uint64_t PRIcs(uint64_t a1, uint64_t a2, char a3, int a4, int a5, char *__s, uint64_t a7, size_t a8, __int16 a9, char a10)
{
  int v14;
  unsigned int v16;
  BOOL v18;
  uint64_t v19;
  __int16 v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  __int16 v24;
  uint64_t v25;
  int v26;
  uint64_t v28;
  uint64_t v29;
  int v30;
  int v31;
  int v32;
  void *v33;
  void *v34;
  __int16 v35;
  int v36;
  size_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;
  void *v41;
  unsigned int v42;
  unsigned __int8 *v43;
  uint64_t v44;
  int v45;
  unsigned __int8 *v46;
  uint64_t v47;
  unsigned int v48;
  uint64_t v49;
  unsigned int v50;
  int v51;
  int v52;
  unsigned __int8 *v53;
  int v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  size_t v58;
  char *v59;
  unsigned int v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  int v65;
  int v66;
  unsigned int v67;

  *(_WORD *)(a8 + 1322) = 0;
  *(_QWORD *)(a8 + 1328) = 0;
  if (a7)
    v14 = *(_DWORD *)(a7 + 92);
  else
    v14 = 0;
  *(_BYTE *)(a8 + 1338) = *(_BYTE *)(a2 + 26);
  *(_DWORD *)a8 = a9;
  if (a9 == 1)
  {
    *(_BYTE *)(a8 + 8) = a3;
    *(_DWORD *)(a8 + 20) = a4;
    *(_DWORD *)(a8 + 24) = a5;
    *(_DWORD *)(a8 + 1308) = 1;
    return (__int16)ICspl("", a8);
  }
  v16 = *(unsigned __int8 *)(a8 + 8);
  v18 = (unsigned __int16)(a9 - 8) < 0xFFFDu && (a9 & 0xFFFFFFFC) != 100;
  v19 = *(_QWORD *)(a8 + 3184);
  if (a7 || v18)
  {
    *(_BYTE *)(v19 + 304) = 11;
    if (a7)
      *(_DWORD *)(a8 + 1408) = 0;
  }
  else
  {
    *(_BYTE *)(v19 + 304) = 6;
  }
  if (a9 <= 0x16 && ((1 << a9) & 0x6000EC) != 0 || (a9 - 100) < 4)
  {
    if (a9 == 3)
    {
      v20 = strlen(__s);
      v21 = v20;
      if (a10)
      {
        v22 = v20 - 1;
        if (__s[v22] == 46)
        {
          v14 |= 0x400000u;
          *(_BYTE *)(a8 + 1412) = 1;
          __s[v22] = 0;
        }
        else
        {
          v14 &= ~0x400000u;
        }
      }
    }
    else
    {
      v21 = 0;
    }
    v23 = ICspl(__s, a8);
    v24 = v23;
    if (a9 == 3 && (v14 & 0x400000) != 0)
    {
      v25 = v21 - 1;
      __s[v25] = 46;
      *(_BYTE *)(a8 + 1412) = 0;
      v26 = *(unsigned __int8 *)(a8 + v25 + 1547);
      if (v23 != 11 && v26 != 46)
        v14 |= 0x800000u;
    }
    if (!a7)
      return v24;
  }
  else
  {
    v24 = 220;
    if (!a7)
      return v24;
  }
  if (a9 != 3)
    return v24;
  v28 = SLLngToA(*(unsigned __int8 *)(a2 + 20));
  v29 = *(_QWORD *)(*(_QWORD *)(a8 + 3184) + 288);
  *(_WORD *)(a7 + 98) = *(_WORD *)v29;
  if (*(_BYTE *)(a8 + 1614))
    v30 = v14 | 0x4000;
  else
    v30 = v14;
  if (*(_BYTE *)(a8 + 1624))
    v30 |= 0x8000u;
  v31 = *(unsigned __int16 *)(v29 + 12);
  v32 = v30 | 0x10000;
  if ((v31 & 0xF) == 0)
    v32 = v30;
  if (v24 != 11)
    v32 |= (*(_DWORD *)(a8 + 1328) & 3) << 18;
  v66 = v32;
  v33 = *(void **)(a7 + 104);
  if (v33)
  {
    free(v33);
    *(_QWORD *)(a7 + 104) = 0;
  }
  v34 = *(void **)(a7 + 112);
  if (v34)
  {
    free(v34);
    *(_QWORD *)(a7 + 112) = 0;
  }
  v35 = *(_WORD *)(v29 + 14);
  if ((v35 & 4) != 0)
    *(_WORD *)(a7 + 98) |= 8u;
  v67 = v16;
  if ((v35 & 8) != 0)
    *(_WORD *)(a7 + 98) |= 4u;
  v36 = *(unsigned __int8 *)(v29 + 18);
  if (*(_BYTE *)(v29 + 18))
  {
    v37 = *(unsigned __int8 *)(v29 + 16);
    v38 = *(_WORD *)(a8 + 1612);
    v39 = malloc_type_malloc(v37 + 1, 0x58569D36uLL);
    *(_QWORD *)(a7 + 104) = v39;
    if (!v39)
      goto LABEL_103;
    v64 = v31;
    v40 = (v38 - v36);
    v41 = malloc_type_malloc(v40 + 1, 0x842F0C45uLL);
    *(_QWORD *)(a7 + 112) = v41;
    if (!v41)
      goto LABEL_103;
    memcpy(*(void **)(a7 + 104), (const void *)(a8 + 1547), v37);
    *(_BYTE *)(*(_QWORD *)(a7 + 104) + v37) = 0;
    if ((_DWORD)v37)
    {
      v42 = 0;
      v43 = *(unsigned __int8 **)(a7 + 104);
      do
      {
        v44 = *v43;
        if ((*(_DWORD *)(v28 + 4 * v44) & 0x40000000) != 0)
          LOBYTE(v44) = v44 + 32;
        *v43++ = v44;
        ++v42;
      }
      while (v42 < v37);
    }
    memcpy(*(void **)(a7 + 112), (const void *)(a8 + *(unsigned __int8 *)(v29 + 18) + 1547), (v38 - v36));
    *(_BYTE *)(*(_QWORD *)(a7 + 112) + v40) = 0;
    v31 = v64;
    if (v36 != v38)
    {
      v45 = 0;
      v46 = *(unsigned __int8 **)(a7 + 112);
      do
      {
        v47 = *v46;
        if ((*(_DWORD *)(v28 + 4 * v47) & 0x40000000) != 0)
          LOBYTE(v47) = v47 + 32;
        *v46++ = v47;
        ++v45;
      }
      while (v45 < (v38 - v36));
    }
  }
  v48 = v67;
  if (v67 != 5)
    goto LABEL_85;
  if ((*(_WORD *)(a7 + 98) & 0x3000) == 0x2000)
  {
    v65 = v31;
    v49 = *(_QWORD *)(a7 + 16);
    v50 = *(unsigned __int16 *)(a7 + 32);
    TwoToOneChrCnv_pNewStr[0] = 0;
    TwoToOneChrCnv_pOeStr = 247;
    TwoToOneChrCnv_pAeStr = 230;
    if (v50)
    {
      v51 = 0;
      v52 = 0;
      while (1)
      {
        v53 = (unsigned __int8 *)(v49 + (unsigned __int16)v51);
        v54 = *v53;
        if (v54 == 97)
        {
          if (v53[1] != 101)
            goto LABEL_75;
        }
        else if (v54 != 111 || v53[1] != 101)
        {
LABEL_75:
          v55 = (__int16)v52++;
          TwoToOneChrCnv_pNewStr[v55] = v54;
          TwoToOneChrCnv_pNewStr[(__int16)v52] = 0;
          goto LABEL_76;
        }
        __strcat_chk();
        ++v51;
        ++v52;
LABEL_76:
        if (v50 <= (unsigned __int16)++v51)
          goto LABEL_81;
      }
    }
    LOWORD(v52) = 0;
LABEL_81:
    v56 = (char *)malloc_type_calloc((__int16)v52 + 1, 1uLL, 0x100004077774924uLL);
    *(_QWORD *)(a7 + 128) = v56;
    v48 = 5;
    if (v56)
    {
      strcpy(v56, TwoToOneChrCnv_pNewStr);
    }
    else
    {
      v57 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)v57 = 0xDC00000078;
      *(_WORD *)(v57 + 8) = 841;
    }
    v31 = v65;
LABEL_85:
    if (v48 > 0xC || ((1 << v48) & 0x1320) == 0)
      goto LABEL_91;
  }
  if ((*(_WORD *)(a7 + 98) & 4) == 0 || !SLstrcmp((_BYTE *)(v29 + 19), *(unsigned __int8 **)(a7 + 16)))
    goto LABEL_91;
  v58 = strlen((const char *)(v29 + 19));
  v59 = (char *)malloc_type_calloc(v58 + 1, 1uLL, 0x100004077774924uLL);
  *(_QWORD *)(a7 + 128) = v59;
  if (v59)
  {
    strcpy(v59, (const char *)(v29 + 19));
LABEL_91:
    v60 = v66 | (v31 << 24) | (16 * *(_DWORD *)(a8 + 1328)) & 0x800 | (*(_DWORD *)(a8 + 1328) << 6) & 0x1000 | (*(_DWORD *)(a8 + 1328) << 18) & 0x200000;
    v61 = *(_WORD *)(a8 + 1322);
    if ((v61 & 0x100) != 0)
    {
      v60 = v66 & 0xFFFC1FFF | (v31 << 24) | (16 * *(_DWORD *)(a8 + 1328)) & 0x800 | (*(_DWORD *)(a8 + 1328) << 6) & 0x1000 | (*(_DWORD *)(a8 + 1328) << 18) & 0x200000 | 0x2000;
      *(_WORD *)(a7 + 98) &= 0xF09Cu;
    }
    *(_DWORD *)(a7 + 92) = v60;
    if (v48 == 5)
    {
      if ((v61 & 0x20) != 0 && (*(_DWORD *)(v28 + 4 * *(unsigned __int8 *)(a8 + 1547)) & 0x10000000) == 0)
        *(_DWORD *)(a7 + 92) = v60 & 0xF0FFFFFF;
      if ((v61 & 0x100) != 0)
      {
        v62 = *(unsigned __int8 *)(a8 + 1547);
        if ((v62 | 0x20) != 0x68 && (*(_DWORD *)(v28 + 4 * v62) & 0x10000000) == 0)
          *(_DWORD *)(a7 + 92) = v60 & 0xF0FFFFFF;
      }
    }
    *(_BYTE *)(a7 + 60) = *(_BYTE *)(v29 + 84);
    return v24;
  }
LABEL_103:
  v63 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)v63 = 0xDC00000078;
  *(_WORD *)(v63 + 8) = 0;
  return 220;
}

uint64_t PRgetSeverity(uint64_t a1, uint64_t a2, int *a3, int a4, unsigned int a5, int a6)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;
  int v14;
  int v15;
  uint64_t v16;

  v16 = 0;
  if (a4)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 0xE6FFFFFF8FLL;
LABEL_5:
    *(_QWORD *)v7 = v8;
    *(_WORD *)(v7 + 8) = 525;
    return 230;
  }
  v11 = *(_QWORD *)(a2 + 48);
  v12 = *(_QWORD *)(v11 + 256);
  if (getPosition(0, (_DWORD *)&v16 + 1, &v16, 0, *(_QWORD *)(v11 + 32), *(unsigned __int16 **)(v11 + 200), *(unsigned __int8 *)(v11 + 26), a5, a6))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 0xE6FFFFFF8ELL;
    goto LABEL_5;
  }
  if (a6)
  {
    if (!(_DWORD)v16)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 0xE6FFFFFF8DLL;
      goto LABEL_5;
    }
    v14 = *(unsigned __int8 *)(v12 + ((unint64_t)(2 * v16) >> 3)) << ((2 * v16) & 6);
    *a3 = v14 >> 6;
    if (v14 >> 6)
      return 0;
  }
  result = 0;
  if (((*(unsigned __int8 *)(v12
                                                              + ((unint64_t)(2 * HIDWORD(v16)) >> 3)) << ((2 * BYTE4(v16)) & 6)) >> 6) <= 1u)
    v15 = 1;
  else
    v15 = (*(unsigned __int8 *)(v12 + ((unint64_t)(2 * HIDWORD(v16)) >> 3)) << ((2 * BYTE4(v16)) & 6)) >> 6;
  *a3 = v15;
  return result;
}

uint64_t getPosition(unsigned __int16 *a1, _DWORD *a2, _DWORD *a3, int *a4, uint64_t a5, unsigned __int16 *a6, int a7, unsigned int a8, unsigned __int8 a9)
{
  uint64_t v14;
  int v15;
  unsigned __int16 v16;
  uint64_t result;
  int v18;
  unsigned __int16 v19;

  v19 = 0;
  if (!BinarySearch(a5, a7, 1, a8, 1, &v19))
    return 230;
  v14 = v19;
  if (a1)
    *a1 = v19;
  if (!(_DWORD)v14)
  {
    v15 = 0;
    if (!a2)
      goto LABEL_7;
    goto LABEL_6;
  }
  v15 = (unsigned __int16)((*((unsigned __int8 *)a6 + (2 * v14 - 1)) | (*((unsigned __int8 *)a6
                                                                                      + (2 * v14 - 2)) << 8))
                         + v14);
  if (a2)
LABEL_6:
    *a2 = v15;
  if (!a3)
    return 0;
LABEL_7:
  v16 = (_DWORD)v14
      ? _byteswap_ushort(a6[v14])
      - (*((unsigned __int8 *)a6 + (2 * v14 - 1)) | (*((unsigned __int8 *)a6 + (2 * v14 - 2)) << 8))
      : __rev16(*a6);
  v18 = v15 + a9;
  if (a9 > v16)
    v18 = 0;
  *a3 = v18;
  if (!a4)
    return 0;
  result = 0;
  *a4 = HIBYTE(a6[v14]) | (LOBYTE(a6[v14]) << 8);
  return result;
}

uint64_t getMapVal(uint64_t a1, int a2, int a3)
{
  unint64_t v3;
  char v4;

  v3 = (unint64_t)(a3 * a2) >> 3;
  v4 = (a3 * a2) & 7;
  if (a3 == 2)
    return (*(unsigned __int8 *)(a1 + v3) << v4) >> 6;
  if (a3 == 1)
    return (0x80u >> v4) & *(unsigned __int8 *)(a1 + v3);
  return 0;
}

uint64_t PRliveRule(uint64_t a1, uint64_t a2, int a3, unsigned int a4, int a5, int a6, int a7)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 *v17;
  int v18;
  int Position;
  unsigned int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;

  if (*(unsigned __int8 *)(a1 + 26) < a4)
    return 4;
  v25 = 0;
  if (a3)
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)v9 = 0xE6FFFFFF8FLL;
    *(_WORD *)(v9 + 8) = 524;
    return 230;
  }
  v15 = *(_QWORD *)(a2 + 48);
  v16 = *(_QWORD *)(v15 + 32);
  v17 = *(unsigned __int16 **)(v15 + 200);
  v23 = *(_QWORD *)(v15 + 304);
  v18 = *(unsigned __int8 *)(v15 + 26);
  if (getPosition(0, (_DWORD *)&v25 + 1, 0, 0, v16, v17, v18, a4, 0))
    return 4;
  if (a5)
  {
    Position = getPosition(0, 0, &v25, 0, v16, v17, v18, a4, a5);
    v20 = v25;
    if (Position)
      v21 = 1;
    else
      v21 = (_DWORD)v25 == 0;
    if (v21)
      return 4;
  }
  else
  {
    v20 = 0;
  }
  if (((*(unsigned __int8 *)(v23 + ((unint64_t)HIDWORD(v25) >> 3)) << (BYTE4(v25) & 7)) & 0x80) != 0
    || a5 && ((*(unsigned __int8 *)(v23 + ((unint64_t)v20 >> 3)) << (v20 & 7)) & 0x80) != 0
    || a6
    && !a7
    && ((*(unsigned __int8 *)(*(_QWORD *)(v15 + 272) + ((unint64_t)v20 >> 3)) << (v20 & 7)) & 0x80) == 0)
  {
    return 4;
  }
  if (!*(_BYTE *)(a1 + 27))
  {
LABEL_23:
    v22 = *(_QWORD *)(v15 + 288);
    if (!v22 || ((*(unsigned __int8 *)(v22 + ((unint64_t)v25 >> 3)) << (v25 & 7)) & 0x80) != 0)
      return 0;
    return 4;
  }
  v24 = 0;
  result = PRgetSeverity(a1, a2, &v24, 0, a4, a5);
  if (!(_DWORD)result)
  {
    if (v24 == 3)
      return 4;
    goto LABEL_23;
  }
  return result;
}

uint64_t BinarySearch(uint64_t a1, int a2, int a3, unsigned int a4, int a5, _WORD *a6)
{
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;
  unsigned int v10;
  BOOL v11;
  __int16 v12;

  *a6 = 0;
  v6 = a2 / a3 - 1;
  if ((v6 & 0x8000) != 0)
    return 0;
  v7 = 0;
  while (1)
  {
    v8 = (v7 + (__int16)v6) / 2;
    v9 = v8 * (uint64_t)a3;
    v10 = *(unsigned __int8 *)(a1 + v9);
    if (a5 == 2)
      v10 = *(unsigned __int8 *)(v9 + a1 + 1) | (v10 << 8);
    if (v10 == a4)
      break;
    v11 = v10 >= a4;
    if (v10 <= a4)
      v12 = v6;
    else
      v12 = v8 - 1;
    if (!v11)
      v12 = v6;
    LOWORD(v6) = v12;
    if (!v11)
      v7 = v8 + 1;
    if (v7 > v12)
      return 0;
  }
  *a6 = v8;
  return 1;
}

uint64_t getTypeIndex(uint64_t a1, _WORD *a2, int a3, unsigned int a4, int a5)
{
  uint64_t result;
  uint64_t v11;

  if (BinarySearch(a1, a3, 1, a4, 1, a2))
    return 0;
  result = 230;
  if (a5 && a3)
  {
    v11 = 0;
    while (*(unsigned __int8 *)(a1 + v11) <= a4)
    {
      if (a3 == ++v11)
        return 230;
    }
    result = 0;
    *a2 = v11;
  }
  return result;
}

char *CalExtBytesAfterCnv(char *result, _WORD *a2, int a3)
{
  unsigned int v5;
  char *v6;
  __int16 v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  *a2 = 0;
  v5 = *((unsigned __int16 *)result + 9);
  if (*((_WORD *)result + 9))
  {
    v6 = result;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)result;
    v10 = *((_QWORD *)result + 1);
    do
    {
      result = strchr((char *)(v9 + *(__int16 *)(v10 + 2 * v8)), (char)a3);
      if (result)
      {
        do
        {
          *a2 = ++v7;
          result = strchr(result + 1, (char)a3);
        }
        while (result);
        v5 = *((unsigned __int16 *)v6 + 9);
      }
      ++v8;
    }
    while (v8 < v5);
  }
  else
  {
    v7 = 0;
  }
  if (a3 == 133)
    *a2 = 2 * v7;
  return result;
}

uint64_t AltOneToMultiChrCnv(uint64_t a1, int a2, __int16 a3, uint64_t a4)
{
  uint64_t result;
  __int16 v8;
  char v9;
  char v10;
  char v11;
  char v12;
  __int16 v13;
  _BYTE *v14;
  _BYTE *v15;
  unint64_t v16;
  int v17;
  unsigned __int16 v18;
  int v19;
  uint64_t v20;

  result = 0;
  v8 = *(_WORD *)(a1 + 24);
  if (a2 <= 222)
  {
    if (a2 == 133)
    {
      v10 = 0;
      v12 = 46;
      v11 = 46;
      v9 = 46;
    }
    else
    {
      if (a2 != 151)
        return result;
      v9 = 0;
      v10 = 1;
      v12 = 45;
      v11 = 45;
    }
  }
  else
  {
    switch(a2)
    {
      case 223:
        v9 = 0;
        v10 = 1;
        v12 = 115;
        v11 = 115;
        break;
      case 230:
        v9 = 0;
        v10 = 1;
        v11 = 101;
        v12 = 97;
        break;
      case 247:
        v9 = 0;
        v10 = 1;
        v11 = 101;
        v12 = 111;
        break;
      default:
        return result;
    }
  }
  v13 = v8 + a3;
  v14 = malloc_type_calloc((unsigned __int16)(v8 + a3) + 1, 1uLL, 0x100004077774924uLL);
  if (v14)
  {
    v15 = v14;
    if (*(_WORD *)(a1 + 24))
    {
      v16 = 0;
      v17 = 0;
      v18 = 2;
      do
      {
        v19 = *(unsigned __int8 *)(*(_QWORD *)a1 + v16);
        if (v19 == a2)
        {
          v14[(unsigned __int16)v17] = v12;
          v14[(unsigned __int16)(v17 + 1)] = v11;
          if ((v10 & 1) != 0)
          {
            ++v17;
          }
          else
          {
            v17 += 2;
            v14[(unsigned __int16)v17] = v9;
          }
        }
        else
        {
          v14[(unsigned __int16)v17] = v19;
          if (!*(_BYTE *)(*(_QWORD *)a1 + v16) && *(unsigned __int16 *)(a1 + 18) >= v18)
            *(_WORD *)(*(_QWORD *)(a1 + 8) + 2 * v18++ - 2) = v17 + 1;
        }
        ++v16;
        ++v17;
      }
      while (v16 < *(unsigned __int16 *)(a1 + 24));
    }
    *(_WORD *)(a1 + 24) = v13;
    free(*(void **)a1);
    result = 0;
    *(_QWORD *)a1 = v15;
  }
  else
  {
    v20 = *(_QWORD *)(a4 + 32);
    *(_QWORD *)v20 = 0xDC00000078;
    *(_WORD *)(v20 + 8) = 842;
    return 220;
  }
  return result;
}

char *OneToMultiChrCnv(const char **a1, unsigned __int16 *a2, int a3, uint64_t a4)
{
  char *v8;
  unsigned __int16 v9;
  char *result;
  __int16 v11;
  char *v12;
  char v14;
  char v15;
  char v16;
  char v17;
  unsigned __int16 v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  uint64_t v25;
  unsigned __int16 *v26;

  v8 = (char *)*a1;
  v9 = strlen(*a1);
  result = strchr(v8, (char)a3);
  if (!result)
    return result;
  v11 = 0;
  v12 = v8 + 1;
  do
    ++v11;
  while (strchr(v12++, (char)a3));
  if (!v11)
    return 0;
  v26 = a2;
  v14 = 0;
  v15 = 1;
  if (a3 <= 222)
  {
    if (a3 == 133)
    {
      v15 = 0;
      v11 *= 2;
      v14 = 46;
      v16 = 46;
      v17 = 46;
      goto LABEL_19;
    }
    if (a3 == 151)
    {
      v17 = 45;
      v16 = 45;
      goto LABEL_16;
    }
  }
  else
  {
    switch(a3)
    {
      case 223:
        v17 = 115;
        v16 = 115;
        goto LABEL_16;
      case 230:
        v16 = 101;
        v17 = 97;
        goto LABEL_16;
      case 247:
        v16 = 101;
        v17 = 111;
LABEL_16:
        v14 = 0;
        goto LABEL_19;
    }
  }
  v16 = 0;
  v17 = 0;
LABEL_19:
  v18 = v11 + v9;
  v19 = (const char *)malloc_type_calloc(v18 + 1, 1uLL, 0x100004077774924uLL);
  if (v19)
  {
    v20 = v19;
    if (v9)
    {
      v21 = 0;
      v22 = 0;
      do
      {
        v23 = (*a1)[v21];
        if (v23 == a3)
        {
          v19[(unsigned __int16)v22] = v17;
          v24 = v22 + 1;
          v19[(unsigned __int16)(v22 + 1)] = v16;
          if ((v15 & 1) == 0)
          {
            v24 = v22 + 2;
            v19[(unsigned __int16)(v22 + 2)] = v14;
          }
        }
        else
        {
          v19[(unsigned __int16)v22] = v23;
          v24 = v22;
        }
        ++v21;
        v22 = v24 + 1;
      }
      while (v9 != v21);
    }
    v19[v18] = 0;
    free((void *)*a1);
    result = 0;
    *a1 = v20;
    *v26 = v18;
  }
  else
  {
    v25 = *(_QWORD *)(a4 + 32);
    *(_QWORD *)v25 = 0xDC00000078;
    *(_WORD *)(v25 + 8) = 840;
    return (char *)220;
  }
  return result;
}

_BYTE *ToUpUnaccentedCnv(_BYTE *result, int a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  if (a2 >= 1)
  {
    v4 = (unsigned __int16)a2;
    do
    {
      v5 = *result;
      if ((v5 + 64) <= 0x1Cu
        && (a3 != 8 || (*(_DWORD *)(a4 + 4 * v5) & 0x40000) == 0)
        && ((0x1A300E8uLL >> v5) & 1) == 0)
      {
        *result = byte_1DE2F1D7C[v5 - 192];
      }
      ++result;
      --v4;
    }
    while (v4);
  }
  return result;
}

char *PRinsOneHyp(char *result, _DWORD *a2, int a3, unsigned int a4)
{
  int v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  char *v9;
  char v10;
  int v11;
  unsigned int v12;
  __int16 v13;
  int v14;
  int v15;
  __int16 v16;
  unsigned int v17;
  unsigned int i;
  __int16 v19;
  __int16 v20;
  char __src[65];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = *result;
  if (*result)
  {
    LOWORD(v5) = 0;
    v6 = 0;
    do
    {
      if (v4 != a3)
      {
        result[(unsigned __int16)v5] = v4;
        LOWORD(v5) = v5 + 1;
      }
      v4 = result[(unsigned __int16)++v6];
    }
    while (result[(unsigned __int16)v6]);
  }
  else
  {
    LOWORD(v5) = 0;
  }
  v5 = (unsigned __int16)v5;
  result[(unsigned __int16)v5] = 0;
  if (*a2)
  {
    if (((a2[a4 >> 5] >> ~(_BYTE)a4) & 1) != 0)
    {
      if ((_WORD)v5)
      {
LABEL_11:
        v7 = 0;
        v8 = (unsigned __int16)a4;
        v9 = result;
        do
        {
          v10 = *v9++;
          v11 = v7 + 1;
          __src[(unsigned __int16)v7] = v10;
          if (!v8)
          {
            __src[(unsigned __int16)(v7 + 1)] = a3;
            v11 = v7 + 2;
          }
          --v8;
          v7 = v11;
          --v5;
        }
        while (v5);
        goto LABEL_36;
      }
    }
    else
    {
      if (a4)
      {
        v12 = a4 - 1;
        do
        {
          v13 = v12 - 1;
          if (!v12)
            break;
          v14 = a2[v12 >> 5];
          v15 = 1 << ~(_BYTE)v12--;
        }
        while ((v15 & v14) == 0);
        v16 = v13 + 1;
      }
      else
      {
        v16 = 0;
      }
      v17 = (unsigned __int16)(v5 - 1);
      for (i = a4; v17 > i; ++i)
      {
        if (((a2[i >> 5] >> ~(_BYTE)i) & 1) != 0)
          break;
      }
      if ((unsigned __int16)(a4 - v16) <= (unsigned __int16)(i - a4))
        v19 = v16;
      else
        v19 = i;
      if ((unsigned __int16)v5 - 1 == (unsigned __int16)i)
        v20 = v16;
      else
        v20 = v19;
      if (v16)
        LOWORD(a4) = v20;
      else
        LOWORD(a4) = i;
      if ((_WORD)v5)
        goto LABEL_11;
    }
    LOWORD(v11) = 0;
LABEL_36:
    __src[(unsigned __int16)v11] = 0;
    return strcpy(result, __src);
  }
  return result;
}

uint64_t PRword(uint64_t a1, int a2, int a3)
{
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  int v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  char *v27;
  unsigned __int16 v28;
  int v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  __int16 v38;
  __int16 v39;
  __int16 v40;
  __int16 v41;
  __int16 v42;
  __int16 v43;
  __int16 v44;
  __int16 v45;
  __int16 v46;
  char v47;
  int v48;
  __int16 v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  char v63;
  int v65;
  __int16 v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  int v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  void **v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  __int16 v78;
  __int16 v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  int v83;
  __int16 v84;
  __int16 v85;
  __int16 v86;
  __int16 v87;
  __int16 v88;
  __int16 v89;
  unsigned int v90;
  uint64_t v91;
  unsigned int v92;
  uint64_t v93;
  void *v94;
  void *v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t i;
  uint64_t v99;
  uint64_t v100;
  char ***v101;
  unsigned int v102;
  unint64_t v103;
  char **v104;
  unint64_t v105;
  size_t v106;
  char *v107;
  __int16 v108;
  char *v109;
  __int16 v110;
  uint64_t v111;
  uint64_t *v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  uint64_t v124;
  char __dst[65];
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 230;
  v124 = 0;
  v122 = 0u;
  v123 = 0u;
  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  v113 = 0u;
  *(_DWORD *)(a1 + 112) = 0;
  *(_DWORD *)(a1 + 116) = 0;
  v6 = a1 + 112;
  *(_WORD *)(a1 + 120) = 0;
  if (a2 <= 7)
  {
    if (a2 != 3 && a2 != 7)
    {
LABEL_25:
      v12 = *(_QWORD *)(a1 + 8);
      if (v12)
      {
        *(_DWORD *)(v12 + 18) = 0;
        *(_WORD *)(v12 + 24) = 0;
        if (*(_WORD *)(v12 + 16))
        {
          v13 = 0;
          v14 = *(_QWORD *)(v12 + 8);
          do
            *(_WORD *)(v14 + 2 * v13++) = -1;
          while (v13 < *(unsigned __int16 *)(v12 + 16));
        }
      }
      goto LABEL_29;
    }
  }
  else
  {
    if (a2 == 8)
      goto LABEL_29;
    if (a2 != 103 && a2 != 17)
      goto LABEL_25;
  }
  v7 = *(_QWORD **)(a1 + 96);
  if (v7)
  {
    do
    {
      v8 = (_QWORD *)v7[5];
      PRfreeErr(v7);
      v7 = v8;
    }
    while (v8);
  }
  *(_QWORD *)(a1 + 96) = 0;
  if (a2 != 8)
  {
    if (a2 == 17)
    {
      v9 = *(void ***)(a1 + 8);
      if (v9)
        PRfreeList(v9);
      *(_QWORD *)(a1 + 8) = 0;
      v10 = *(_QWORD *)(a1 + 136);
      if (v10)
      {
        if (*(_QWORD *)v10)
        {
          PRfreeList(*(void ***)v10);
          v10 = *(_QWORD *)(a1 + 136);
        }
        if (*(_QWORD *)(v10 + 8))
        {
          PRfreeList(*(void ***)(v10 + 8));
          v10 = *(_QWORD *)(a1 + 136);
        }
        if (*(_QWORD *)(v10 + 16))
        {
          free(*(void **)(v10 + 16));
          v10 = *(_QWORD *)(a1 + 136);
        }
        if (*(_QWORD *)(v10 + 24))
        {
          free(*(void **)(v10 + 24));
          v10 = *(_QWORD *)(a1 + 136);
        }
        free((void *)v10);
        v11 = 0;
        *(_QWORD *)(a1 + 136) = 0;
        return v11;
      }
      return 0;
    }
    goto LABEL_25;
  }
LABEL_29:
  v15 = PRGetAppElem(*(unsigned __int8 *)(a1 + 129));
  if (!v15)
  {
    v24 = 0xE6FFFFFF93;
LABEL_41:
    *(_QWORD *)(a1 + 112) = v24;
    *(_WORD *)(a1 + 120) = 500;
    return 230;
  }
  v16 = v15;
  *(_QWORD *)(v15 + 32) = v6;
  *(_WORD *)(v15 + 24) = 0;
  v17 = PRGetDbElem(*(unsigned __int8 *)(a1 + 129), *(unsigned __int8 *)(a1 + 130));
  if (!v17)
  {
    v24 = 0xE6FFFFFF92;
    goto LABEL_41;
  }
  v18 = v17;
  v19 = *(_QWORD *)(v17 + 128);
  v20 = *(unsigned __int8 *)(v16 + 28);
  if (a2 == 7 || a2 == 103)
  {
    *(_DWORD *)(v19 + 1308) = 1;
    if (a2 == 103)
      v21 = 3;
    else
      v21 = a2;
    if ((*(_WORD *)v17 & 2) == 0)
    {
      v22 = *(_QWORD *)(v16 + 32);
      if (v21 == 7)
      {
        v23 = 0xE6000001F9;
LABEL_106:
        *(_QWORD *)v22 = v23;
        *(_WORD *)(v22 + 8) = 500;
        return 230;
      }
      *(_QWORD *)v22 = 0x4000001F9;
      *(_WORD *)(v22 + 8) = 500;
      *(_DWORD *)(v19 + 1308) = 0;
    }
  }
  else
  {
    *(_DWORD *)(v19 + 1308) = 0;
    v21 = a2;
  }
  v25 = *(char *)(a1 + 127);
  *(_DWORD *)(v19 + 1408) = v25;
  if (!v25)
  {
    v26 = *(_QWORD *)(a1 + 104);
    *(_DWORD *)(v19 + 1412) = *(_DWORD *)(v26 + 252);
    *(_BYTE *)(v19 + 1416) = *(_BYTE *)(v26 + 256);
  }
  *(_BYTE *)(v19 + 1339) = 0;
  v27 = *(char **)a1;
  if (*(_QWORD *)a1)
  {
    v28 = strlen(*(const char **)a1);
    LOWORD(v29) = v28;
    if (!v20)
    {
      if (v28 < 0x41u)
      {
        v20 = 0;
      }
      else
      {
        LOWORD(v29) = 64;
        strncpy(__dst, v27, 0x40uLL);
        v20 = 0;
        v27 = __dst;
      }
      goto LABEL_56;
    }
LABEL_52:
    if ((v29 & 0xFFC0) != 0)
      v29 = 64;
    else
      v29 = (unsigned __int16)v29;
    v20 = 1;
    SLchcnv(v27, v29, (unsigned __int8 *)__dst, 1, *(unsigned __int8 *)(v18 + 20));
    v27 = __dst;
    goto LABEL_56;
  }
  if (v20)
  {
    LOWORD(v29) = 0;
    goto LABEL_52;
  }
  v27 = 0;
  LOWORD(v29) = 0;
LABEL_56:
  switch(v21)
  {
    case 3:
    case 7:
      goto LABEL_74;
    case 4:
    case 12:
    case 13:
    case 14:
      goto LABEL_105;
    case 5:
    case 6:
      if (a3)
        goto LABEL_75;
      *(_DWORD *)(v19 + 1408) = 0;
      *(_WORD *)(v19 + 1684) = *(_WORD *)(a1 + 124);
      *(_BYTE *)(v19 + 1339) = 0;
      if (PRIcs(v16, v18, 0, 0, 0, v27, 0, v19, v21, 0) == 8)
        goto LABEL_192;
      v31 = *(_QWORD *)(a1 + 8);
      v30 = (uint64_t *)(a1 + 8);
      if (!v31 && PRmkList(v16, v30, 100) == 220)
        return 220;
      v32 = *(unsigned __int16 *)(v19 + 1686);
      if (!*(_WORD *)(v19 + 1686))
        return 0;
      if (v20)
      {
        SLchcnv((char *)(v19 + *(__int16 *)(v19 + 2890) + 1690), (__int16)(*(_WORD *)(v19 + 1688) - *(_WORD *)(v19 + 2890)), (unsigned __int8 *)(v19 + *(__int16 *)(v19 + 2890) + 1690), 0, *(unsigned __int8 *)(v18 + 20));
        v32 = *(unsigned __int16 *)(v19 + 1686);
      }
      return PRaddList((char **)*v30, (char *)(v19 + *(__int16 *)(v19 + 2890) + 1690), v32, 0);
    case 8:
      if (a3 > 1)
      {
        if (a3 == 2)
        {
          v50 = 0;
          v49 = 103;
          v48 = 1;
        }
        else
        {
          if (a3 != 64)
            goto LABEL_75;
          v48 = 0;
          v50 = 0;
          v49 = 101;
        }
      }
      else if (a3)
      {
        if (a3 != 1)
          goto LABEL_75;
        v48 = 0;
        v49 = 102;
        v50 = 1;
      }
      else
      {
        *(_DWORD *)(v19 + 1680) = 0;
        v80 = *(_QWORD *)(a1 + 8);
        if (v80)
        {
          *(_DWORD *)(v80 + 18) = 0;
          *(_WORD *)(v80 + 24) = 0;
          if (*(_WORD *)(v80 + 16))
          {
            v81 = 0;
            v82 = *(_QWORD *)(v80 + 8);
            do
              *(_WORD *)(v82 + 2 * v81++) = -1;
            while (v81 < *(unsigned __int16 *)(v80 + 16));
          }
        }
        if (SLstrcmp((_BYTE *)(v19 + 1339), (unsigned __int8 *)v27))
        {
          *(_BYTE *)(v19 + 1339) = 0;
          v83 = PRIcs(v16, v18, 0, 0, 0, v27, 0, v19, 3, 0);
          if (v83 == 4)
            goto LABEL_214;
          if (v83 == 8)
          {
LABEL_192:
            v72 = *(_QWORD *)(v16 + 32);
            v73 = 0xDC000000A0;
            goto LABEL_193;
          }
          *(_QWORD *)(a1 + 16) = *(_QWORD *)(v19 + 1640);
          *(_QWORD *)(a1 + 88) = *(_QWORD *)(v19 + 3156);
          **(_QWORD **)(a1 + 104) = *(_QWORD *)(v19 + 1664);
          *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) = *(_QWORD *)(v19 + 1672);
          *(_QWORD *)(*(_QWORD *)(a1 + 104) + 16) = *(_QWORD *)(v19 + 1648);
          *(_QWORD *)(*(_QWORD *)(a1 + 104) + 24) = *(_QWORD *)(v19 + 1656);
          if (v20)
          {
            v84 = strlen((const char *)(v19 + 3090));
            SLchcnv((char *)(v19 + 3090), v84, (unsigned __int8 *)(a1 + 24), 0, *(unsigned __int8 *)(v18 + 20));
            v85 = strlen((const char *)(v19 + 1614));
            SLchcnv((char *)(v19 + 1614), v85, (unsigned __int8 *)(*(_QWORD *)(a1 + 104) + 32), 0, *(unsigned __int8 *)(v18 + 20));
            v86 = strlen((const char *)(v19 + 1624));
            SLchcnv((char *)(v19 + 1624), v86, (unsigned __int8 *)(*(_QWORD *)(a1 + 104) + 42), 0, *(unsigned __int8 *)(v18 + 20));
            v87 = strlen((const char *)(v19 + 1547));
            SLchcnv((char *)(v19 + 1547), v87, (unsigned __int8 *)(*(_QWORD *)(a1 + 104) + 55), 0, *(unsigned __int8 *)(v18 + 20));
            v88 = strlen((const char *)(v19 + 1417));
            SLchcnv((char *)(v19 + 1417), v88, (unsigned __int8 *)(*(_QWORD *)(a1 + 104) + 122), 0, *(unsigned __int8 *)(v18 + 20));
            v89 = strlen((const char *)(v19 + 1482));
            SLchcnv((char *)(v19 + 1482), v89, (unsigned __int8 *)(*(_QWORD *)(a1 + 104) + 187), 0, *(unsigned __int8 *)(v18 + 20));
          }
          else
          {
            __strcpy_chk();
            __strcpy_chk();
            __strcpy_chk();
            __strcpy_chk();
            __strcpy_chk();
            __strcpy_chk();
          }
          v48 = 0;
          v50 = 0;
          v99 = *(_QWORD *)(a1 + 104);
          *(_DWORD *)(v99 + 252) = *(_DWORD *)(v19 + 1412);
          *(_BYTE *)(v99 + 256) = *(_BYTE *)(v19 + 1416);
        }
        else
        {
          v48 = 0;
          v50 = 0;
        }
        v49 = 100;
      }
      v100 = PRIcs(v16, v18, 0, 0, 0, "", 0, v19, v49, 0);
      v11 = v100;
      if ((v100 - 20) >= 3)
      {
        if ((_DWORD)v100 != 8)
          return v11;
        goto LABEL_192;
      }
      v101 = (char ***)(a1 + 8);
      if (!*(_QWORD *)(a1 + 8) && PRmkList(v16, (uint64_t *)(a1 + 8), 100) == 220)
        return 220;
      if (((v48 | v50) & 1) != 0)
        v102 = 0;
      else
        v102 = *((unsigned __int16 *)*v101 + 9);
      LODWORD(v103) = *(unsigned __int16 *)(v19 + 1686);
      if (v102 >= v103)
      {
LABEL_208:
        if ((_DWORD)v11 == 22)
        {
          v11 = 0;
          *(_BYTE *)(a1 + 128) = 1;
          return v11;
        }
        if ((_DWORD)v11 != 21)
          return 240;
        if ((_DWORD)v103)
          return 0;
LABEL_214:
        v111 = *(_QWORD *)(v16 + 32);
        *(_QWORD *)v111 = 0x4000001F5;
        *(_WORD *)(v111 + 8) = 500;
        return 4;
      }
      v104 = *v101;
      if (*((unsigned __int16 *)*v101 + 9) >= *((unsigned __int16 *)*v101 + 8))
      {
        LODWORD(v103) = 1;
        goto LABEL_208;
      }
      v105 = v102;
      v106 = v19 + 2890;
      while (1)
      {
        if (v20)
        {
          v107 = (char *)(v19 + *(__int16 *)(v106 + 2 * v105) + 1690);
          v108 = strlen(v107);
          SLchcnv(v107, v108, (unsigned __int8 *)v107, 0, *(unsigned __int8 *)(v18 + 20));
          v104 = *v101;
        }
        v33 = PRaddList(v104, (char *)(v19 + *(__int16 *)(v106 + 2 * v105) + 1690), 1, 0);
        if ((_DWORD)v33)
          return v33;
        if (v20)
        {
          v109 = (char *)(v19 + *(__int16 *)(v106 + 2 * v105) + 1690);
          v110 = strlen(v109);
          SLchcnv(v109, v110, (unsigned __int8 *)v109, 1, *(unsigned __int8 *)(v18 + 20));
        }
        ++v105;
        v103 = *(unsigned __int16 *)(v19 + 1686);
        if (v105 < v103)
        {
          v104 = *v101;
          if (*((unsigned __int16 *)*v101 + 9) < *((unsigned __int16 *)*v101 + 8))
            continue;
        }
        goto LABEL_208;
      }
    case 9:
    case 10:
      v34 = *(_QWORD *)(v16 + 8 * *(unsigned __int8 *)(a1 + 131) + 56);
      if (!v34)
        goto LABEL_104;
      v35 = *(unsigned __int8 *)(a1 + 132);
      v36 = *(_QWORD *)(v34 + 776);
      if (v21 == 9 && *(_BYTE *)(a1 + 126) && (v37 = a1 + 24, *(_BYTE *)(a1 + 24)))
      {
        v38 = strlen((const char *)(a1 + 24));
        v39 = v38;
        if (!v20)
        {
          *(_QWORD *)(v36 + 2128) = v37;
          *(_WORD *)(v36 + 2136) = v38;
          __strcpy_chk();
          goto LABEL_83;
        }
        SLchcnv((char *)(a1 + 24), v38, (unsigned __int8 *)(a1 + 24), 1, v35);
        *(_QWORD *)(v36 + 2128) = v37;
        *(_WORD *)(v36 + 2136) = v39;
      }
      else
      {
        *(_QWORD *)(v36 + 2128) = 0;
        *(_WORD *)(v36 + 2136) = 0;
        if ((v20 & 1) == 0)
        {
LABEL_82:
          __strcpy_chk();
          if (v21 == 9)
          {
LABEL_83:
            *(_BYTE *)(v36 + 2125) = *(_BYTE *)(a1 + 126);
            v47 = 1;
            goto LABEL_110;
          }
          v47 = 2;
LABEL_110:
          *(_WORD *)(v36 + 4) = *(_WORD *)v34;
          *(_BYTE *)v36 = v47;
          if (ICpd(v19, (unsigned __int8 *)v36) == 8)
          {
            if (v21 == 9)
              v65 = 710;
            else
              v65 = 709;
            if (*(_WORD *)(v36 + 2148) == 5151)
            {
              v65 = 714;
              v66 = 710;
            }
            else
            {
              v66 = 500;
            }
            v11 = 230;
            *(_DWORD *)(a1 + 112) = v65;
            *(_DWORD *)(a1 + 116) = 230;
            *(_WORD *)(a1 + 120) = v66;
            return v11;
          }
          return 0;
        }
      }
      v46 = strlen(*(const char **)a1);
      SLchcnv(*(char **)a1, v46, *(unsigned __int8 **)a1, 1, v35);
      goto LABEL_82;
    case 11:
      v51 = *(_QWORD *)(v16 + 8 * *(unsigned __int8 *)(a1 + 131) + 56);
      if (!v51)
        goto LABEL_104;
      v52 = *(_QWORD *)(v51 + 776);
      *(_WORD *)(v52 + 4) = *(_WORD *)v51;
      if (*(_WORD *)(v51 + 784))
        goto LABEL_90;
      if (a3 == 3)
      {
        v71 = 4;
      }
      else
      {
        if (a3 != 4)
        {
LABEL_75:
          v22 = *(_QWORD *)(v16 + 32);
          v23 = 0xE6FFFFFF94;
          goto LABEL_106;
        }
        v71 = 5;
      }
      *(_BYTE *)v52 = v71;
      v90 = *(unsigned __int16 *)(a1 + 134);
      *(_BYTE *)(v52 + 2138) = v90;
      if (v90 > 0x14 || !(_BYTE)v90)
      {
        v22 = *(_QWORD *)(v16 + 32);
        v23 = 0xE6FFFFFF85;
        goto LABEL_106;
      }
      if (ICpd(v19, (unsigned __int8 *)v52) == 8)
        goto LABEL_140;
      *(_WORD *)(v51 + 784) = a3;
      v91 = *(_QWORD *)(a1 + 136);
      if (v91)
        goto LABEL_171;
      v112 = (uint64_t *)malloc_type_calloc(1uLL, 0x28uLL, 0x10B00405BDECF31uLL);
      *(_QWORD *)(a1 + 136) = v112;
      if (!v112)
        goto LABEL_140;
      if (PRmkList(v16, v112, *(__int16 *)(a1 + 134)) == 220
        || PRmkList(v16, (uint64_t *)(*(_QWORD *)(a1 + 136) + 8), *(__int16 *)(a1 + 134)) == 220)
      {
        return 220;
      }
      v91 = *(_QWORD *)(a1 + 136);
LABEL_171:
      v92 = *(unsigned __int16 *)(a1 + 134);
      if (!*(_WORD *)(v91 + 32))
        goto LABEL_174;
      if (*(unsigned __int16 *)(v91 + 32) >= v92)
        goto LABEL_177;
      free(*(void **)(v91 + 16));
      free(*(void **)(*(_QWORD *)(a1 + 136) + 24));
      v93 = *(_QWORD *)(a1 + 136);
      *(_QWORD *)(v93 + 16) = 0;
      *(_QWORD *)(v93 + 24) = 0;
      *(_WORD *)(v93 + 32) = 0;
      v92 = *(unsigned __int16 *)(a1 + 134);
LABEL_174:
      v94 = malloc_type_malloc(8 * v92, 0x100004000313F17uLL);
      *(_QWORD *)(*(_QWORD *)(a1 + 136) + 16) = v94;
      if (!v94)
        goto LABEL_140;
      v95 = malloc_type_malloc(*(unsigned __int16 *)(a1 + 134), 0x100004077774924uLL);
      v96 = *(_QWORD *)(a1 + 136);
      *(_QWORD *)(v96 + 24) = v95;
      if (!v95)
        goto LABEL_140;
      v92 = *(unsigned __int16 *)(a1 + 134);
      *(_WORD *)(v96 + 32) = v92;
LABEL_177:
      *(_QWORD *)(v52 + 2192) = malloc_type_calloc(v92, 8uLL, 0x2004093837F09uLL);
      **(_QWORD **)(v52 + 2192) = malloc_type_calloc(*(unsigned __int16 *)(a1 + 134), 0x94uLL, 0x10000403212CEEEuLL);
      v97 = *(unsigned __int16 *)(a1 + 134);
      if (v97 >= 2)
      {
        for (i = 1; i != v97; ++i)
          *(_QWORD *)(*(_QWORD *)(v52 + 2192) + 8 * i) = **(_QWORD **)(v52 + 2192) + 148 * i;
      }
LABEL_90:
      v53 = *(uint64_t **)(a1 + 136);
      v54 = *v53;
      if (*v53)
      {
        *(_DWORD *)(v54 + 18) = 0;
        *(_WORD *)(v54 + 24) = 0;
        if (*(_WORD *)(v54 + 16))
        {
          v55 = 0;
          v56 = *(_QWORD *)(v54 + 8);
          do
            *(_WORD *)(v56 + 2 * v55++) = -1;
          while (v55 < *(unsigned __int16 *)(v54 + 16));
        }
      }
      v57 = v53[1];
      if (v57)
      {
        *(_DWORD *)(v57 + 18) = 0;
        *(_WORD *)(v57 + 24) = 0;
        if (*(_WORD *)(v57 + 16))
        {
          v58 = 0;
          v59 = *(_QWORD *)(v57 + 8);
          do
            *(_WORD *)(v59 + 2 * v58++) = -1;
          while (v58 < *(unsigned __int16 *)(v57 + 16));
        }
      }
      *(_BYTE *)v52 = 6;
      if (ICpd(v19, (unsigned __int8 *)v52) == 8)
      {
        *(_QWORD *)(a1 + 112) = 0xE60000007BLL;
        *(_WORD *)(a1 + 120) = 500;
        return 220;
      }
      if (!*(_WORD *)(v52 + 2184))
        return 0;
      v75 = 0;
      while (1)
      {
        v76 = *(_QWORD *)(v52 + 2192);
        v77 = *(_QWORD *)(v76 + 8 * v75);
        if (v20)
        {
          v78 = strlen(*(const char **)(v76 + 8 * v75));
          SLchcnv((char *)v77, v78, (unsigned __int8 *)v77, 0, *(unsigned __int8 *)(v18 + 20));
          v79 = strlen((const char *)(v77 + 80));
          SLchcnv((char *)(v77 + 80), v79, (unsigned __int8 *)(v77 + 80), 0, *(unsigned __int8 *)(v18 + 20));
        }
        v33 = PRaddList(**(char ****)(a1 + 136), (char *)v77, 1, (unsigned __int16)v75);
        if ((_DWORD)v33)
          break;
        v11 = PRaddList(*(char ***)(*(_QWORD *)(a1 + 136) + 8), (char *)(v77 + 80), 1, (unsigned __int16)v75);
        if (!(_DWORD)v11)
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 16) + 8 * v75) = *(_QWORD *)(v77 + 72);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 24) + v75++) = *(_BYTE *)(v77 + 68);
          if (v75 < *(unsigned __int16 *)(v52 + 2184))
            continue;
        }
        return v11;
      }
      return v33;
    case 15:
      v60 = *(_QWORD *)(v16 + 8 * *(unsigned __int8 *)(a1 + 131) + 56);
      if (!v60)
      {
LABEL_104:
        v22 = *(_QWORD *)(v16 + 32);
        v23 = 0xE6000002C0;
        goto LABEL_106;
      }
      v61 = *(_QWORD *)(v60 + 776);
      *(_WORD *)(v61 + 4) = *(_WORD *)v60;
      v62 = *(unsigned __int16 *)(v60 + 784);
      if (v62 == 3)
      {
        v63 = 7;
      }
      else
      {
        if (v62 != 4)
        {
LABEL_105:
          v22 = *(_QWORD *)(v16 + 32);
          v23 = 0xE6FFFFFF95;
          goto LABEL_106;
        }
        v63 = 8;
      }
      *(_BYTE *)v61 = v63;
      if (ICpd(v19, (unsigned __int8 *)v61) != 8)
      {
        v74 = *(void ***)(v61 + 2192);
        if (v74)
        {
          free(*v74);
          free(*(void **)(v61 + 2192));
          *(_QWORD *)(v61 + 2192) = 0;
        }
        v11 = 0;
        *(_WORD *)(v60 + 784) = 0;
        return v11;
      }
LABEL_140:
      v72 = *(_QWORD *)(v16 + 32);
      v73 = 0xDC00000078;
LABEL_193:
      *(_QWORD *)v72 = v73;
      *(_WORD *)(v72 + 8) = 500;
      return 220;
    default:
      if (v21 != 103)
        goto LABEL_105;
LABEL_74:
      if (a3)
        goto LABEL_75;
      *(_BYTE *)(v19 + 1339) = 0;
      if (PRIcs(v16, v18, 0, 0, 0, v27, 0, v19, v21, 0) == 8)
        goto LABEL_192;
      *(_QWORD *)(a1 + 16) = *(_QWORD *)(v19 + 1640);
      *(_QWORD *)(a1 + 88) = *(_QWORD *)(v19 + 3156);
      **(_QWORD **)(a1 + 104) = *(_QWORD *)(v19 + 1664);
      *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) = *(_QWORD *)(v19 + 1672);
      *(_QWORD *)(*(_QWORD *)(a1 + 104) + 16) = *(_QWORD *)(v19 + 1648);
      *(_QWORD *)(*(_QWORD *)(a1 + 104) + 24) = *(_QWORD *)(v19 + 1656);
      if (v20)
      {
        v40 = strlen((const char *)(v19 + 3090));
        SLchcnv((char *)(v19 + 3090), v40, (unsigned __int8 *)(a1 + 24), 0, *(unsigned __int8 *)(v18 + 20));
        v41 = strlen((const char *)(v19 + 1614));
        SLchcnv((char *)(v19 + 1614), v41, (unsigned __int8 *)(*(_QWORD *)(a1 + 104) + 32), 0, *(unsigned __int8 *)(v18 + 20));
        v42 = strlen((const char *)(v19 + 1624));
        SLchcnv((char *)(v19 + 1624), v42, (unsigned __int8 *)(*(_QWORD *)(a1 + 104) + 42), 0, *(unsigned __int8 *)(v18 + 20));
        v43 = strlen((const char *)(v19 + 1547));
        SLchcnv((char *)(v19 + 1547), v43, (unsigned __int8 *)(*(_QWORD *)(a1 + 104) + 55), 0, *(unsigned __int8 *)(v18 + 20));
        v44 = strlen((const char *)(v19 + 1417));
        SLchcnv((char *)(v19 + 1417), v44, (unsigned __int8 *)(*(_QWORD *)(a1 + 104) + 122), 0, *(unsigned __int8 *)(v18 + 20));
        v45 = strlen((const char *)(v19 + 1482));
        SLchcnv((char *)(v19 + 1482), v45, (unsigned __int8 *)(*(_QWORD *)(a1 + 104) + 187), 0, *(unsigned __int8 *)(v18 + 20));
      }
      else
      {
        __strcpy_chk();
        __strcpy_chk();
        __strcpy_chk();
        __strcpy_chk();
        __strcpy_chk();
        __strcpy_chk();
      }
      v67 = *(_QWORD *)(a1 + 104);
      *(_DWORD *)(v67 + 252) = *(_DWORD *)(v19 + 1412);
      *(_BYTE *)(v67 + 256) = *(_BYTE *)(v19 + 1416);
      v68 = *(_DWORD *)(v19 + 4);
      if (v68 == 4 || !*(_QWORD *)(v19 + 1328) && v68 != 11 && !*(_WORD *)(v19 + 1322))
        return 0;
      v124 = 0;
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v115 = 0u;
      v113 = 0u;
      v114 = (unint64_t)v27;
      LOWORD(v115) = v29;
      if (PRFillError(v16, v18, (uint64_t)&v113, 0))
        return 220;
      v69 = v123;
      *(_QWORD *)(a1 + 96) = v123;
      if (v69)
        v70 = v20;
      else
        v70 = 0;
      if (v69)
        v11 = 210;
      else
        v11 = 0;
      if (v70 == 1)
      {
        v11 = 210;
        do
        {
          ConvertAlts(*(_QWORD *)(v69 + 24), 0, *(unsigned __int8 *)(v18 + 20));
          v69 = *(_QWORD *)(v123 + 40);
          *(_QWORD *)&v123 = v69;
        }
        while (v69);
      }
      return v11;
  }
}

uint64_t add_phrase(uint64_t *a1, const char *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v9;
  uint64_t **v10;
  uint64_t v11;
  uint64_t *v12;
  unsigned __int8 *v13;
  int v14;
  unint64_t v18;
  unint64_t matched;
  _WORD *v20;
  uint64_t v21;
  __int16 v22;
  _WORD *v23;

  if (!a1)
    return 0;
  v4 = a1;
LABEL_3:
  v5 = *(unsigned __int8 *)a2;
  if ((v5 - 65) >= 0x1A && (v5 - 192) >= 0x17)
  {
    if ((v5 - 216) >= 7)
    {
      if ((v5 - 138) > 0x15 || ((1 << (v5 + 118)) & 0x200015) == 0)
      {
        if (!*a2)
        {
          v4[2] = a3;
          return 1;
        }
        goto LABEL_22;
      }
      goto LABEL_19;
    }
  }
  else if ((v5 - 138) <= 0x15 && ((1 << (v5 + 118)) & 0x200015) != 0)
  {
LABEL_19:
    if (v5 == 159)
      v5 = 255;
    else
      v5 += 16;
    goto LABEL_22;
  }
  v5 += 32;
LABEL_22:
  v9 = *((unsigned __int16 *)v4 + 5);
  if (!*((_WORD *)v4 + 5))
  {
    v22 = 0;
    goto LABEL_52;
  }
  v10 = (uint64_t **)(v4 + 3);
  v11 = *((unsigned __int16 *)v4 + 5);
  do
  {
    v12 = *v10;
    v13 = (unsigned __int8 *)**v10;
    v14 = *v13;
    if ((v14 - 65) < 0x1A || (v14 - 192) < 0x17)
    {
      if ((v14 - 138) > 0x15 || ((1 << (v14 + 118)) & 0x200015) == 0)
      {
LABEL_35:
        v14 += 32;
        goto LABEL_43;
      }
LABEL_40:
      if (v14 == 159)
        v14 = 255;
      else
        v14 += 16;
      goto LABEL_43;
    }
    if ((v14 - 216) < 7)
      goto LABEL_35;
    if ((v14 - 138) <= 0x15 && ((1 << (v14 + 118)) & 0x200015) != 0)
      goto LABEL_40;
LABEL_43:
    if (v5 == v14)
    {
      v18 = *((unsigned __int16 *)v12 + 4);
      matched = matchLength((uint64_t)a2, **v10, v18);
      if (matched < v18)
      {
        v20 = malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
        *(_QWORD *)v20 = v13;
        v20[4] = matched;
        v20[5] = 1;
        *((_QWORD *)v20 + 3) = v12;
        *v12 = (uint64_t)&v13[matched];
        *((_WORD *)v12 + 4) = v18 - matched;
        v12 = (uint64_t *)v20;
        *v10 = (uint64_t *)v20;
      }
      a2 += matched;
      v4 = v12;
      goto LABEL_3;
    }
    ++v10;
    --v11;
  }
  while (v11);
  v22 = *((_WORD *)v4 + 5);
  if (v9 >= 0x1C)
    return 0;
LABEL_52:
  v21 = 1;
  v23 = malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  *(_QWORD *)v23 = a2;
  v23[4] = strlen(a2);
  *((_QWORD *)v23 + 2) = a3;
  v4[v9 + 3] = (uint64_t)v23;
  *((_WORD *)v4 + 5) = v22 + 1;
  return v21;
}

uint64_t matchLength(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  int v5;
  int v9;

  if (a3)
  {
    result = 0;
    while (1)
    {
      v5 = *(unsigned __int8 *)(a1 + result);
      if ((v5 - 65) < 0x1A || (v5 - 192) < 0x17)
        break;
      if ((v5 - 216) < 7)
        goto LABEL_14;
      if ((v5 - 138) <= 0x15 && ((1 << (v5 + 118)) & 0x200015) != 0)
      {
LABEL_19:
        if (v5 == 159)
          v5 = 255;
        else
          v5 += 16;
      }
LABEL_22:
      v9 = *(unsigned __int8 *)(a2 + result);
      if ((v9 - 65) >= 0x1A && (v9 - 192) >= 0x17)
      {
        if ((v9 - 216) >= 7)
        {
          if ((v9 - 138) > 0x15 || ((1 << (v9 + 118)) & 0x200015) == 0)
            goto LABEL_36;
LABEL_33:
          if (v9 == 159)
            v9 = 255;
          else
            v9 += 16;
          goto LABEL_36;
        }
      }
      else if ((v9 - 138) <= 0x15 && ((1 << (v9 + 118)) & 0x200015) != 0)
      {
        goto LABEL_33;
      }
      v9 += 32;
LABEL_36:
      if (v5 != v9)
        return result;
      if (a3 == ++result)
        return a3;
    }
    if ((v5 - 138) <= 0x15 && ((1 << (v5 + 118)) & 0x200015) != 0)
      goto LABEL_19;
LABEL_14:
    v5 += 32;
    goto LABEL_22;
  }
  return 0;
}

uint64_t find_phrase(uint64_t a1, unsigned __int8 *a2, unint64_t a3, unsigned int a4, uint64_t a5, unsigned __int8 **a6, _QWORD *a7)
{
  unsigned __int8 *v7;
  int v11;
  uint64_t v14;
  unsigned __int8 ***v15;
  int v16;
  unsigned __int8 **v17;
  unsigned __int8 *v18;
  int v19;
  unint64_t v23;
  unsigned __int8 *v25;

  v7 = 0;
  if (!a1 || !a3)
    return (uint64_t)v7;
  v11 = *a2;
  if (!(_DWORD)a5)
    goto LABEL_21;
  if ((v11 - 65) >= 0x1A && (v11 - 192) >= 0x17)
  {
    if ((v11 - 216) >= 7)
    {
      if ((v11 - 138) > 0x15 || ((1 << (v11 + 118)) & 0x200015) == 0)
        goto LABEL_21;
      goto LABEL_18;
    }
  }
  else if ((v11 - 138) <= 0x15 && ((1 << (v11 + 118)) & 0x200015) != 0)
  {
LABEL_18:
    if (v11 == 159)
      LOBYTE(v11) = -1;
    else
      LOBYTE(v11) = v11 + 16;
    goto LABEL_21;
  }
  LOBYTE(v11) = v11 + 32;
LABEL_21:
  v14 = *(unsigned __int16 *)(a1 + 10);
  if (!*(_WORD *)(a1 + 10))
    return 0;
  v15 = (unsigned __int8 ***)(a1 + 24);
  v16 = v11;
  while (1)
  {
    v17 = *v15;
    v18 = **v15;
    v19 = *v18;
    if (!(_DWORD)a5)
      goto LABEL_43;
    if ((v19 - 65) < 0x1A || (v19 - 192) < 0x17)
    {
      if ((v19 - 138) > 0x15 || ((1 << (v19 + 118)) & 0x200015) == 0)
      {
LABEL_35:
        LOBYTE(v19) = v19 + 32;
        goto LABEL_43;
      }
LABEL_40:
      if (v19 == 159)
        LOBYTE(v19) = -1;
      else
        LOBYTE(v19) = v19 + 16;
      goto LABEL_43;
    }
    if ((v19 - 216) < 7)
      goto LABEL_35;
    if ((v19 - 138) <= 0x15 && ((1 << (v19 + 118)) & 0x200015) != 0)
      goto LABEL_40;
LABEL_43:
    if (v16 == v19)
    {
      v23 = *((unsigned __int16 *)v17 + 4);
      if (a3 >= v23 && matchLength((uint64_t)v18, (uint64_t)a2, *((unsigned __int16 *)v17 + 4)) >= v23)
        break;
    }
    ++v15;
    if (!--v14)
      return 0;
  }
  v25 = &a2[v23];
  if (find_phrase(v17, v25, a3 - v23, a4, a5, a6, a7))
    return 1;
  v7 = v17[2];
  if (v7)
  {
    if (!a4 || a3 == v23 || !isAnyAlpha(*v25))
    {
      if (a6)
        *a6 = v25;
      if (a7)
        *a7 = v17[2];
      return 1;
    }
    return 0;
  }
  return (uint64_t)v7;
}

BOOL isAnyAlpha(int a1)
{
  _BOOL8 result;

  result = 1;
  if (a1 <= 247
    && (a1 - 216) >= 0x1F
    && (a1 - 192) >= 0x17
    && (a1 & 0xFFFFFFDF) - 65 >= 0x1A
    && ((a1 - 131) > 0x1B || ((1 << (a1 + 125)) & 0xA800A81) == 0))
  {
    return a1 == 159;
  }
  return result;
}

BOOL find_partial_phrase(_BOOL8 result, unsigned __int8 *a2, unint64_t a3, int a4)
{
  unint64_t v4;
  unsigned __int8 **v7;
  int v8;
  uint64_t v12;
  unsigned __int8 ***i;
  unsigned __int8 *v14;
  int v15;
  unint64_t v19;

  if (!result)
    return result;
  v4 = a3;
  if (!a3)
    return 1;
  v7 = (unsigned __int8 **)result;
  while (2)
  {
    v8 = *a2;
    if (!a4)
      goto LABEL_24;
    if ((v8 - 65) >= 0x1A && (v8 - 192) >= 0x17)
    {
      if ((v8 - 216) >= 7)
      {
        if ((v8 - 138) > 0x15 || ((1 << (v8 + 118)) & 0x200015) == 0)
          goto LABEL_24;
        goto LABEL_21;
      }
    }
    else if ((v8 - 138) <= 0x15 && ((1 << (v8 + 118)) & 0x200015) != 0)
    {
LABEL_21:
      if (v8 == 159)
        LOBYTE(v8) = -1;
      else
        LOBYTE(v8) = v8 + 16;
      goto LABEL_24;
    }
    LOBYTE(v8) = v8 + 32;
LABEL_24:
    v12 = *((unsigned __int16 *)v7 + 5);
    if (!*((_WORD *)v7 + 5))
      return 0;
    for (i = (unsigned __int8 ***)(v7 + 3); ; ++i)
    {
      v7 = *i;
      v14 = **i;
      v15 = *v14;
      if (a4)
      {
        if ((v15 - 65) >= 0x1A && (v15 - 192) >= 0x17)
        {
          if ((v15 - 216) >= 7)
          {
            if ((v15 - 138) > 0x15 || ((1 << (v15 + 118)) & 0x200015) == 0)
              goto LABEL_46;
LABEL_43:
            if (v15 == 159)
              LOBYTE(v15) = -1;
            else
              LOBYTE(v15) = v15 + 16;
            goto LABEL_46;
          }
        }
        else if ((v15 - 138) <= 0x15 && ((1 << (v15 + 118)) & 0x200015) != 0)
        {
          goto LABEL_43;
        }
        LOBYTE(v15) = v15 + 32;
      }
LABEL_46:
      if (v8 == v15)
      {
        v19 = *((unsigned __int16 *)v7 + 4);
        if (v4 <= v19)
          return matchLength((uint64_t)v14, (uint64_t)a2, v4) >= v4;
        if (matchLength((uint64_t)v14, (uint64_t)a2, *((unsigned __int16 *)v7 + 4)) >= v19)
          break;
      }
      if (!--v12)
        return 0;
    }
    a2 += v19;
    result = 1;
    v4 -= v19;
    if (v4)
      continue;
    return result;
  }
}

uint64_t print_node(const char **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  unint64_t v6;

  if (a2)
  {
    ++print_node_num_nodes;
    v4 = a2;
    do
    {
      putchar(32);
      --v4;
    }
    while (v4);
  }
  else
  {
    print_node_num_nodes = 1;
  }
  printf("node %p ", a1);
  if (*a1 && *((_WORD *)a1 + 4))
    printf(" phrase <%.*s> ", *((unsigned __int16 *)a1 + 4), *a1);
  if (a1[2])
    printf("suggestion <%p> ", a1[2]);
  if (!*((_WORD *)a1 + 5))
  {
    result = putchar(10);
    if (a2)
      return result;
    return printf("%lu total nodes\n", print_node_num_nodes);
  }
  result = printf("%u children\n", *((unsigned __int16 *)a1 + 5));
  if (*((_WORD *)a1 + 5))
  {
    v6 = 0;
    do
      result = print_node(a1[v6++ + 3], a2 + 1);
    while (v6 < *((unsigned __int16 *)a1 + 5));
  }
  if (!a2)
    return printf("%lu total nodes\n", print_node_num_nodes);
  return result;
}

uint64_t *create_phrase_root_from_strings(const char *a1)
{
  uint64_t *v2;
  size_t v3;
  const char *v4;
  const char *v5;

  v2 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  if (*a1)
  {
    do
    {
      v3 = strlen(a1);
      v4 = &a1[v3 + 1];
      if (!*v4)
        break;
      v5 = &v4[strlen(&a1[v3 + 1])];
      add_phrase(v2, a1, (uint64_t)v4);
      a1 = v5 + 1;
    }
    while (v5[1]);
  }
  return v2;
}

unsigned __int8 *next_phrase(unsigned __int8 *a1, unint64_t a2, uint64_t a3, unsigned __int8 **a4, _QWORD *a5)
{
  unsigned __int8 *v10;
  unint64_t v11;

  if (a3 && a2)
  {
    v10 = a1;
    v11 = a2;
    while (!find_phrase(a3, v10, v11, 1u, 1, a4, a5))
    {
      ++v10;
      if (!--v11)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    if (a4)
      *a4 = &a1[a2];
    v10 = 0;
    if (a5)
      *a5 = 0;
  }
  return v10;
}

uint64_t *pinyin_root()
{
  uint64_t *v0;
  const char *v1;
  char **v2;
  char *v3;

  v0 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  phrases_3 = (uint64_t)v0;
  v1 = "a";
  v2 = &off_1EA8CF070;
  do
  {
    add_phrase(v0, v1, *((unsigned int *)v2 - 2));
    v3 = *v2;
    v2 += 2;
    v1 = v3;
  }
  while (v3);
  return v0;
}

uint64_t *jyutping_root()
{
  uint64_t *v0;
  const char *v1;
  char **v2;
  char *v3;

  v0 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  phrases_2 = (uint64_t)v0;
  v1 = "aa";
  v2 = &off_1EA8D0A10;
  do
  {
    add_phrase(v0, v1, *((unsigned int *)v2 - 2));
    v3 = *v2;
    v2 += 2;
    v1 = v3;
  }
  while (v3);
  return v0;
}

uint64_t *pinyin_root_extended(int a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = &phrases_2;
  if (a1 != 1)
    v1 = &phrases_3;
  v2 = *v1;
  if (v2)
    return (uint64_t *)v2;
  if (a1 == 1)
    return jyutping_root();
  return pinyin_root();
}

unsigned __int8 *next_pinyin(unsigned __int8 *a1, unint64_t a2, int a3, int a4, unsigned __int8 **a5, _DWORD *a6)
{
  uint64_t *v11;
  unsigned __int8 *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v17;
  uint64_t v18;

  v11 = pinyin_root_extended(a3);
  if (!v11
    || (v17 = 0, v18 = 0, !find_phrase((uint64_t)v11, a1, a2, 0, 0, &v17, &v18))
    || (v12 = v17, !a4) && &a1[a2] > v17 && is_interjection(a1, v17 - a1))
  {
    if (a5)
      *a5 = a1;
    a1 = 0;
    if (a6)
    {
      v13 = 0;
      goto LABEL_19;
    }
    return a1;
  }
  v13 = v18;
  v14 = MEMORY[0x1E0C80978];
  while (1)
  {
    v15 = *v12;
    if ((char)*v12 < 0)
      break;
    if ((*(_DWORD *)(v14 + 4 * v15 + 60) & 0x2000) == 0)
      goto LABEL_16;
LABEL_15:
    v17 = ++v12;
  }
  if (__maskrune(v15, 0x2000uLL))
    goto LABEL_15;
LABEL_16:
  if (a5)
    *a5 = v12;
  if (a6)
LABEL_19:
    *a6 = v13;
  return a1;
}

BOOL is_interjection(unsigned __int8 *a1, uint64_t a2)
{
  int v2;
  _BOOL8 result;
  int v6;
  int v9;

  if (a2 == 2)
  {
    v6 = a1[1];
    if ((v6 - 65) >= 0x1A && (v6 - 192) >= 0x17)
    {
      if ((v6 - 216) >= 7)
      {
        if ((v6 - 138) <= 0x15 && ((1 << (v6 + 118)) & 0x200015) != 0)
          return 0;
LABEL_30:
        if (v6 != 111)
          return 0;
        v9 = *a1;
        if ((v9 - 65) < 0x1A || (v9 - 192) < 0x17)
        {
          result = 1;
          if ((v9 - 138) <= 0x15 && ((1 << (v9 + 118)) & 0x200015) != 0)
            return 0;
          if (v9 == 76)
            return result;
        }
        else if ((v9 - 216) >= 7)
        {
          if ((v9 - 108) <= 0x33)
          {
            if (((1 << (v9 - 108)) & 0x8000540000000) != 0)
              return 0;
            if (v9 == 108)
              return 1;
          }
          return v9 == 121;
        }
        v9 += 32;
        return v9 == 121;
      }
    }
    else if ((v6 - 138) <= 0x15 && ((1 << (v6 + 118)) & 0x200015) != 0)
    {
      return 0;
    }
    v6 += 32;
    goto LABEL_30;
  }
  if (a2 != 1)
    return 0;
  v2 = *a1;
  if ((v2 - 65) >= 0x1A && (v2 - 192) >= 0x17)
  {
    if ((v2 - 216) >= 7)
    {
      if ((v2 - 97) <= 0x3E)
      {
        if (((1 << (v2 - 97)) & 0x40002A0000000000) != 0)
          return 0;
        if (v2 == 97)
          return 1;
      }
      return v2 == 111;
    }
LABEL_25:
    v2 += 32;
    return v2 == 111;
  }
  result = 1;
  if ((v2 - 138) <= 0x15 && ((1 << (v2 + 118)) & 0x200015) != 0)
    return 0;
  if (v2 != 65)
    goto LABEL_25;
  return result;
}

uint64_t *is_partial_pinyin(unsigned __int8 *a1, unint64_t a2, int a3, _DWORD *a4)
{
  uint64_t *result;

  result = pinyin_root_extended(a3);
  if (result)
  {
    result = (uint64_t *)find_partial_phrase((_BOOL8)result, a1, a2, 0);
    if ((_DWORD)result)
    {
      if (a4)
        *a4 = 255;
      return (uint64_t *)1;
    }
  }
  return result;
}

uint64_t internalFromExternalZhuyin(unsigned int a1)
{
  uint64_t v2;

  if (a1 - 12549 > 0x24)
  {
    if (a1 - 711 > 0x12)
    {
LABEL_7:
      if (a1 >= 0x100)
        return 39;
      else
        return a1;
    }
    else
    {
      v2 = 0;
      while (toneCharacters[v2] != a1)
      {
        if (++v2 == 5)
          goto LABEL_7;
      }
      return (v2 + 49);
    }
  }
  else
  {
    return internalLetters[a1 - 12549];
  }
}

uint64_t externalZhuyinFromInternal(uint64_t result)
{
  uint64_t i;

  for (i = 0; i != 37; ++i)
  {
    if (internalLetters[i] == (_DWORD)result)
    {
      LOWORD(result) = i + 12549;
      return (unsigned __int16)result;
    }
  }
  if ((result - 49) <= 4)
    LOWORD(result) = toneCharacters[(result - 49)];
  return (unsigned __int16)result;
}

uint64_t add_zhuyin(uint64_t *a1, unsigned __int8 **a2)
{
  unsigned __int8 *v4;
  size_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t result;
  unsigned __int8 *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  int v20;
  char v21;
  size_t v22;
  int phrase;
  BOOL v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;

  v26 = 0;
  v27 = 0;
  v4 = *a2;
  if (*a2)
  {
    v5 = 0;
    v6 = 0;
    while (1)
    {
      while (1)
      {
        ++v5;
        v7 = *v4;
        if (v7 != 203)
          break;
        v8 = 1;
LABEL_8:
        v4 += v8 + 1;
      }
      if (v7 == 227 && v4[1] == 132)
      {
        v8 = 2;
        goto LABEL_8;
      }
      v4 = a2[++v6];
      if (!v4)
        goto LABEL_12;
    }
  }
  v5 = 0;
LABEL_12:
  result = (uint64_t)malloc_type_malloc(v5, 0x1C2AE1EBuLL);
  add_zhuyin_internal_syllables = result;
  v10 = *a2;
  if (!*a2)
    return result;
  v11 = (char *)result;
  v12 = 0;
  do
  {
    v13 = v11++;
    v14 = 255;
    while (1)
    {
      v15 = *v10;
      if (v15 != 203)
        break;
      v16 = 576;
      v17 = 1;
LABEL_20:
      v18 = &v10[v17];
      v19 = *v18;
      v10 = v18 + 1;
      v20 = internalFromExternalZhuyin(v16 + v19);
      if ((v20 - 49) >= 5)
        v21 = v20;
      else
        v21 = 0;
      if ((v20 - 49) < 5)
        v14 = (1 << (v20 - 49));
      *(v11++ - 1) = v21;
    }
    if (v15 == 227 && v10[1] == 132)
    {
      v16 = 12416;
      v17 = 2;
      goto LABEL_20;
    }
    *(v11 - 1) = 0;
    v22 = strlen(v13);
    phrase = find_phrase((uint64_t)a1, (unsigned __int8 *)v13, v22, 0, 0, (unsigned __int8 **)&v26, &v27);
    v24 = &v13[v22] != v26 || phrase == 0;
    v25 = v27;
    if (v24)
      v25 = 0;
    result = add_phrase(a1, v13, v25 | v14);
    v10 = a2[++v12];
  }
  while (v10);
  return result;
}

uint64_t *zhuyin_root1()
{
  uint64_t *v0;

  v0 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  phrases_0 = (uint64_t)v0;
  add_zhuyin(v0, (unsigned __int8 **)zhuyin_syllables1);
  return v0;
}

uint64_t *zhuyin_root2()
{
  uint64_t *v0;

  v0 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  phrases_1 = (uint64_t)v0;
  add_zhuyin(v0, (unsigned __int8 **)zhuyin_syllables2);
  return v0;
}

unsigned __int8 *next_zhuyin(unsigned __int8 *a1, unint64_t a2, int a3, int a4, _QWORD *a5, _DWORD *a6)
{
  uint64_t *v12;
  uint64_t *v13;
  BOOL v14;
  unsigned __int8 *v15;
  unint64_t v16;
  int v17;
  unsigned __int8 *v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  unsigned __int8 *v23;
  uint64_t v24;

  v12 = (uint64_t *)phrases_0;
  v13 = (uint64_t *)phrases_1;
  if (phrases_0)
  {
    if (phrases_1)
      goto LABEL_3;
  }
  else
  {
    v12 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
    phrases_0 = (uint64_t)v12;
    add_zhuyin(v12, (unsigned __int8 **)zhuyin_syllables1);
    if (v13)
      goto LABEL_3;
  }
  v13 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  phrases_1 = (uint64_t)v13;
  add_zhuyin(v13, (unsigned __int8 **)zhuyin_syllables2);
LABEL_3:
  if (v12)
    v14 = v13 == 0;
  else
    v14 = 1;
  if (!v14)
  {
    v23 = 0;
    v24 = 0;
    if (find_phrase((uint64_t)v12, a1, a2, 0, 0, &v23, &v24)
      || find_phrase((uint64_t)v13, a1, a2, 0, 0, &v23, &v24))
    {
      v15 = v23;
      v16 = (unint64_t)&a1[a2];
      if (a3 || v16 <= (unint64_t)v23)
      {
        if (v16 <= (unint64_t)v23)
          goto LABEL_28;
      }
      else if (is_interjection(a1, v23 - a1))
      {
        goto LABEL_28;
      }
      if (*v15 - 49 <= 4)
      {
        v17 = v24;
        if (a4 || (v24 & (1 << (*v15 - 49))) != 0)
        {
          v18 = v15 + 1;
          v19 = MEMORY[0x1E0C80978];
          do
          {
            v23 = v18;
            v20 = *v18;
            if ((char)*v18 < 0)
              v21 = __maskrune(v20, 0x2000uLL);
            else
              v21 = *(_DWORD *)(v19 + 4 * v20 + 60) & 0x2000;
            ++v18;
          }
          while (v21);
          if (a5)
            *a5 = v18 - 1;
          if (!a6)
            return a1;
LABEL_32:
          *a6 = v17;
          return a1;
        }
      }
    }
  }
LABEL_28:
  if (a5)
    *a5 = a1;
  a1 = 0;
  if (a6)
  {
    v17 = 0;
    goto LABEL_32;
  }
  return a1;
}

BOOL is_partial_zhuyin(unsigned __int8 *a1, unint64_t a2, _DWORD *a3)
{
  uint64_t *v6;
  uint64_t *v7;
  BOOL v8;
  _BOOL8 result;
  _BOOL4 partial_phrase;

  v6 = (uint64_t *)phrases_0;
  v7 = (uint64_t *)phrases_1;
  if (phrases_0)
  {
    if (phrases_1)
      goto LABEL_3;
  }
  else
  {
    v6 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
    phrases_0 = (uint64_t)v6;
    add_zhuyin(v6, (unsigned __int8 **)zhuyin_syllables1);
    if (v7)
      goto LABEL_3;
  }
  v7 = (uint64_t *)malloc_type_calloc(1uLL, 0xF8uLL, 0x1070040A09EEE56uLL);
  phrases_1 = (uint64_t)v7;
  add_zhuyin(v7, (unsigned __int8 **)zhuyin_syllables2);
LABEL_3:
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
    return 0;
  partial_phrase = find_partial_phrase((_BOOL8)v6, a1, a2, 0);
  if (partial_phrase || (result = find_partial_phrase((_BOOL8)v7, a1, a2, 0)))
  {
    if (a3)
      *a3 = 255;
    return 1;
  }
  return result;
}

void sub_1DE2D2190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t findZhuyin(unint64_t a1, uint64_t a2, int a3, int a4, unsigned __int8 **a5, unsigned __int8 **a6, unsigned __int8 **a7, _QWORD *a8, _QWORD *a9, _QWORD *a10, _BYTE *a11, _QWORD *a12)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  unsigned __int8 *v23;
  unsigned __int8 *v24;
  unsigned __int8 *v25;
  unsigned __int8 *v26;
  unsigned __int8 *v27;
  unsigned __int8 *v28;
  uint64_t v29;
  char v30;
  BOOL v31;
  uint64_t result;
  unsigned __int8 *v33;
  unsigned __int8 *v34;
  unsigned __int8 *v35;
  char v40;
  uint64_t v43;
  unsigned __int8 *v44;

  v14 = 0;
  v43 = 0;
  v15 = MEMORY[0x1E0C80978];
  do
  {
    v16 = *(unsigned __int8 *)(a1 + v14);
    if (*(char *)(a1 + v14) < 0)
      v17 = __maskrune(v16, 0x2000uLL);
    else
      v17 = *(_DWORD *)(v15 + 4 * v16 + 60) & 0x2000;
    ++v14;
  }
  while (v17);
  v18 = (unsigned __int8 *)(a1 + v14 - 1);
  v44 = v18;
  v19 = (unsigned __int8 *)(a1 + a2);
  if ((unint64_t)v18 >= a1 + a2)
  {
    v25 = 0;
    v26 = 0;
    v27 = 0;
    v28 = 0;
    v21 = 0;
    v30 = 0;
    v29 = 0;
    if (a12)
      goto LABEL_24;
    goto LABEL_25;
  }
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v40 = 0;
  while (1)
  {
    v26 = v24;
    v27 = v23;
    v28 = v22;
    v29 = v20;
    v24 = next_zhuyin(v18, v19 - v18, a3, a4, &v44, (_DWORD *)&v43 + 1);
    v18 = v44;
    if (v24)
    {
      if (a12)
        goto LABEL_10;
    }
    else
    {
      if (!is_partial_zhuyin(v44, v19 - v44, &v43))
        goto LABEL_23;
      v24 = v44;
      v44 = v19;
      v40 = 1;
      v18 = v19;
      if (a12)
LABEL_10:
        a12[v29] = v18 - v24;
    }
    if (!v24 || (unint64_t)v24 < a1 || (unint64_t)v18 < a1)
      break;
    v20 = v29 + 1;
    v21 = v28;
    v22 = v27;
    v23 = v26;
    v25 = v18;
    if (v18 >= v19)
      goto LABEL_22;
  }
  v18 = v25;
  v24 = v26;
  v26 = v27;
  v27 = v28;
  v28 = v21;
LABEL_22:
  v21 = v28;
  v28 = v27;
  v27 = v26;
  ++v29;
  v25 = v18;
  v26 = v24;
LABEL_23:
  v30 = v40;
  if (a12)
LABEL_24:
    *a12 = *a12 + v14 - 1;
LABEL_25:
  if (v25)
    v31 = v26 == 0;
  else
    v31 = 1;
  result = !v31;
  if (!v31)
  {
    if (a5)
    {
      v33 = &v21[-a1];
      if (!v21)
        v33 = 0;
      *a5 = v33;
    }
    if (a6)
    {
      v34 = &v28[-a1];
      if (!v28)
        v34 = 0;
      *a6 = v34;
    }
    if (a7)
    {
      v35 = &v27[-a1];
      if (!v27)
        v35 = 0;
      *a7 = v35;
    }
    if (a8)
      *a8 = &v26[-a1];
    if (a9)
      *a9 = &v25[-a1];
    if (a10)
      *a10 = v29;
    if (a11)
      *a11 = v30 & 1;
  }
  return result;
}

void *modificationArrayFilteredByMaskAndLength(void *a1, unint64_t a2, unint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v5 = a1;
  v31 = *MEMORY[0x1E0C80C00];
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v8)
        objc_enumerationMutation(v5);
      v10 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v9), "syllableRange");
      if (v11 + v10 + 7 < a3)
        break;
      if (v7 == ++v9)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if (!a2)
      return v5;
  }
  v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v5);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (((1 << objc_msgSend(v17, "modificationType")) & a2) == 0)
        {
          v18 = objc_msgSend(v17, "syllableRange");
          if (v19 + v18 + 7 >= a3)
            objc_msgSend(v12, "addObject:", v17);
        }
      }
      v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v14);
  }
  return v12;
}

NSString *_NSSpellingDictDirectoryPath2()
{
  NSString *v0;

  v0 = NSUserName();
  return -[NSString stringByAppendingPathComponent:](-[NSString stringByAppendingPathComponent:](NSHomeDirectoryForUser(v0), "stringByAppendingPathComponent:", CFSTR("Library")), "stringByAppendingPathComponent:", CFSTR("Spelling"));
}

BOOL adjacentMatch(int a1, int a2, int a3)
{
  unsigned int v3;
  uint64_t v4;
  _DWORD *v5;

  v3 = a2 - 97;
  if ((a2 - 97) > 0x19)
  {
    if (a3 != 517)
      return 0;
    v3 = a2 - 208;
    if ((a2 - 208) > 0x1F)
      return 0;
    v4 = 6 * v3;
    v5 = &adjacentMatchesCyrillic;
  }
  else
  {
    v4 = 6 * v3;
    v5 = &adjacentMatches;
  }
  return v5[v4] == a1
      || v5[6 * v3 + 1] == a1
      || v5[6 * v3 + 2] == a1
      || v5[6 * v3 + 3] == a1
      || v5[6 * v3 + 4] == a1
      || v5[6 * v3 + 5] == a1;
}

uint64_t restrictedEditDistance(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  int v23;
  int v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v8 = a2 + 1;
  v9 = a4 + 1;
  v10 = malloc_type_calloc((a4 + 1) * (a2 + 1), 8uLL, 0x100004000313F17uLL);
  if (!v10)
    return a4 + a2;
  v11 = 0;
  if (v8 <= 1)
    v12 = 1;
  else
    v12 = v8;
  v13 = v10;
  do
  {
    *v13 = v11++;
    v13 += a4 + 1;
  }
  while (v12 != v11);
  v14 = 0;
  if (v9 <= 1)
    v15 = 1;
  else
    v15 = v9;
  do
  {
    v10[v14] = v14;
    ++v14;
  }
  while (v15 != v14);
  if (a2)
  {
    v16 = 0;
    v17 = 8 * v9;
    v18 = (char *)(v10 + 1);
    do
    {
      if (a4)
      {
        v19 = 0;
        v20 = v16 + 1;
        v21 = *(_QWORD *)((char *)v10 + v17 * (v16 + 1));
        v22 = &v18[v17 * v16];
        do
        {
          v23 = *(unsigned __int8 *)(a1 + v16);
          v24 = *(unsigned __int8 *)(a3 + v19);
          v25 = *((_QWORD *)v22 - 1);
          v26 = *(_QWORD *)v22;
          if (v23 != v24)
            ++v25;
          if (v26 + 1 < v25)
            v25 = v26 + 1;
          if (v21 + 1 < v25)
            ++v21;
          else
            v21 = v25;
          if (v16
            && v19
            && v23 == *(unsigned __int8 *)(a3 - 1 + v19)
            && *(unsigned __int8 *)(a1 + v16 - 1) == v24
            && *(_QWORD *)((char *)&v10[v19 - 1] + v17 * (v16 - 1)) + (unint64_t)(v23 != v24) < v21)
          {
            v21 = *(_QWORD *)((char *)&v10[v19 - 1] + v17 * (v16 - 1)) + (v23 != v24);
          }
          *(_QWORD *)&v18[8 * v19 + v17 * (v16 + 1)] = v21;
          v22 += 8;
          ++v19;
        }
        while (a4 != v19);
      }
      else
      {
        v20 = v16 + 1;
      }
      v16 = v20;
    }
    while (v20 != a2);
  }
  v27 = v10[a4 + v9 * a2];
  free(v10);
  return v27;
}

uint64_t effectiveEditDistance(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  int v5;
  int v7;
  BOOL v9;
  unint64_t v10;
  int v14;
  BOOL v15;
  BOOL v16;
  _BOOL4 v17;
  int v18;

  v5 = a2 != 3 || a4 == 3;
  v7 = a2 == 4 && a4 < 4;
  v9 = v7 == v5 || a2 - 3 > 0x1C || a4 - 3 > 0x1C;
  v10 = a4 + 2;
  if (v9 || a2 + 2 < a4 || v10 < a2)
    return 3;
  v14 = *(unsigned __int8 *)(a4 + a3 - 1);
  if (v14 == 46)
    return 3;
  v15 = a4 + 1 == a2 && *(_BYTE *)(a2 + a1 - 1) == 115;
  v16 = !v15 || v14 == 115;
  v17 = v16;
  if (v10 == a2 && v17)
  {
    v18 = *(unsigned __int8 *)(a2 + a1 - 2);
    if (v18 == 44 || v18 == 59)
      return 3;
  }
  if (!v17)
    return 3;
  else
    return restrictedEditDistance(a1, a2, a3, a4);
}

uint64_t restrictedUTF16EditDistance(uint64_t a1, uint64_t a2, unsigned __int16 *a3, uint64_t a4)
{
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  unsigned __int16 *v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v8 = a2 + 1;
  v9 = a4 + 1;
  v10 = malloc_type_calloc((a4 + 1) * (a2 + 1), 8uLL, 0x100004000313F17uLL);
  if (!v10)
    return a4 + a2;
  v11 = 0;
  if (v8 <= 1)
    v12 = 1;
  else
    v12 = v8;
  v13 = v10;
  do
  {
    *v13 = v11++;
    v13 += a4 + 1;
  }
  while (v12 != v11);
  v14 = 0;
  if (v9 <= 1)
    v15 = 1;
  else
    v15 = v9;
  do
  {
    v10[v14] = v14;
    ++v14;
  }
  while (v15 != v14);
  if (a2)
  {
    v16 = 0;
    v17 = 8 * v9;
    v18 = (char *)(v10 + 1);
    do
    {
      if (a4)
      {
        v19 = 0;
        v20 = *(unsigned __int16 *)(a1 + 2 * v16);
        v21 = v16 + 1;
        v22 = *(_QWORD *)((char *)v10 + v17 * (v16 + 1));
        v23 = &v18[v17 * v16];
        v24 = a3;
        do
        {
          v25 = *v24;
          v26 = *((_QWORD *)v23 - 1);
          v27 = *(_QWORD *)v23;
          if (v20 != v25)
            ++v26;
          if (v27 + 1 < v26)
            v26 = v27 + 1;
          if (v22 + 1 < v26)
            ++v22;
          else
            v22 = v26;
          if (v16
            && v19
            && v20 == *(v24 - 1)
            && *(unsigned __int16 *)(a1 + 2 * (v16 - 1)) == v25
            && *(_QWORD *)((char *)&v10[v19 - 1] + v17 * (v16 - 1)) + (unint64_t)(v20 != v25) < v22)
          {
            v22 = *(_QWORD *)((char *)&v10[v19 - 1] + v17 * (v16 - 1)) + (v20 != v25);
          }
          *(_QWORD *)&v18[8 * v19 + v17 * (v16 + 1)] = v22;
          v23 += 8;
          ++v24;
          ++v19;
        }
        while (a4 != v19);
      }
      else
      {
        v21 = v16 + 1;
      }
      v16 = v21;
    }
    while (v21 != a2);
  }
  v28 = v10[a4 + v9 * a2];
  free(v10);
  return v28;
}

uint64_t effectiveUTF16EditDistance(uint64_t a1, unint64_t a2, unsigned __int16 *a3, unint64_t a4)
{
  int v5;
  int v7;
  BOOL v9;
  unint64_t v10;
  int v14;
  BOOL v15;
  BOOL v16;
  _BOOL4 v17;
  int v18;

  v5 = a2 != 3 || a4 == 3;
  v7 = a2 == 4 && a4 < 4;
  v9 = v7 == v5 || a2 - 3 > 0x1C || a4 - 3 > 0x1C;
  v10 = a4 + 2;
  if (v9 || a2 + 2 < a4 || v10 < a2)
    return 3;
  v14 = a3[a4 - 1];
  if (v14 == 46)
    return 3;
  v15 = a4 + 1 == a2 && *(_WORD *)(a1 + 2 * a2 - 2) == 115;
  v16 = !v15 || v14 == 115;
  v17 = v16;
  if (v10 == a2 && v17)
  {
    v18 = *(unsigned __int16 *)(a1 + 2 * a2 - 4);
    if (v18 == 44 || v18 == 59)
      return 3;
  }
  if (!v17)
    return 3;
  else
    return restrictedUTF16EditDistance(a1, a2, a3, a4);
}

uint64_t toLowerX_1(uint64_t result, int a2)
{
  if (a2 <= 1279)
  {
    if (a2 == 514)
    {
      if ((result - 65) >= 0x1A
        && (result - 192) >= 0x17
        && ((result - 161) > 0x3D || ((1 << (result + 95)) & 0x3F80000000006F35) == 0))
      {
        return result;
      }
      if ((result - 161) < 0xF && ((0x6F35u >> (result + 95)) & 1) != 0)
        return dword_1DE2F2844[(int)result - 161];
      return (result + 32);
    }
    if (a2 == 517)
    {
      if ((result - 65) >= 0x1A && (result - 176) > 0x1F)
      {
        if ((result & 0xFFFFFFFE) != 0xAE && (result - 161) >= 0xC)
          return result;
        else
          return (result + 80);
      }
      return (result + 32);
    }
LABEL_32:
    if ((result - 65) >= 0x1A)
      return result;
    else
      return (result + 32);
  }
  if (a2 != 1284)
  {
    if (a2 != 1280)
      goto LABEL_32;
    if ((result - 65) >= 0x1A && (result - 192) >= 0x17)
    {
      if ((result - 216) < 7)
        return (result + 32);
      goto LABEL_44;
    }
    if ((result - 138) > 0x15 || ((1 << (result + 118)) & 0x200015) == 0)
      return (result + 32);
LABEL_46:
    if ((_DWORD)result == 159)
      return 255;
    else
      return (result + 16);
  }
  if ((result - 65) < 0x1A || (result - 192) < 0x17)
  {
    if ((result - 138) > 0x15 || ((1 << (result + 118)) & 0x200015) == 0)
    {
      if ((_DWORD)result == 73)
        return 253;
      return (result + 32);
    }
    goto LABEL_46;
  }
  if ((int)result <= 215)
  {
LABEL_44:
    if ((result - 138) > 0x15 || ((1 << (result + 118)) & 0x200015) == 0)
      return result;
    goto LABEL_46;
  }
  if ((result - 216) < 5)
    return (result + 32);
  if ((_DWORD)result == 221)
    return 105;
  if ((_DWORD)result == 222)
    return (result + 32);
  return result;
}

uint64_t removeDiacriticsX_0(uint64_t result, int a2)
{
  int v2;
  unsigned int v3;
  unsigned int v4;

  if (a2 == 514)
  {
    if ((int)result < 161)
      return result;
    if (result > 0xF7
      || (result - 216) < 0x1F
      || (result - 192) < 0x17
      || (result & 0xFFFFFFDF) - 65 < 0x1A)
    {
      if ((_DWORD)result == 161)
        return 65;
    }
    else
    {
      if ((result - 161) > 0x1E)
        return result;
      if (((1 << (result + 95)) & 0x6F356F34) == 0)
      {
        if ((_DWORD)result == 161)
          return 65;
        return result;
      }
    }
    if (result < 0xA6)
      return 76;
    if (result < 0xAB)
      return 83;
    if ((_DWORD)result == 171)
      return 84;
    if (result < 0xB0)
      return 90;
    if ((_DWORD)result == 177)
      return 97;
    if (result < 0xB6)
      return 108;
    if (result < 0xBB)
      return 115;
    if ((_DWORD)result == 187)
      return 116;
    if (result < 0xC0)
      return 122;
    if ((_DWORD)result == 192)
      return 82;
    if (result < 0xC5)
      return 65;
    if ((_DWORD)result == 197)
      return 76;
    if (result >= 0xC9)
    {
      if (result < 0xCD)
        return 69;
      if (result < 0xCF)
        return 73;
      if ((_DWORD)result == 208)
        return 68;
      if (result < 0xD3)
        return 78;
      if (result < 0xD7)
        return 79;
      if ((_DWORD)result == 216)
        return 82;
      v3 = result - 221;
      if (result < 0xDD)
        return 85;
      if (v3 < 4)
        return dword_1DE2EC9B0[v3];
      if (result < 0xE5)
        return 65;
      if ((_DWORD)result == 229)
        return 76;
      if (result >= 0xE9)
      {
        if (result < 0xED)
          return 69;
        if (result < 0xEF)
          return 73;
        if ((_DWORD)result == 240)
          return 68;
        if (result < 0xF3)
          return 78;
        if (result >= 0xF7)
        {
          if ((_DWORD)result != 248)
          {
            if (result < 0xFD)
              return 85;
            if ((_DWORD)result == 254)
              v4 = 84;
            else
              v4 = 255;
            if ((_DWORD)result == 253)
              return 89;
            else
              return v4;
          }
          return 82;
        }
        return 79;
      }
    }
    return 67;
  }
  if (a2 != 1284 && a2 != 1280 || (int)result < 193)
    return result;
  if (result < 0xC6)
    return 65;
  if ((_DWORD)result == 199)
    return 67;
  v2 = result & 0x7FFFFFFC;
  if ((result & 0xFFFFFFFC) == 0xC8)
    return 69;
  if (v2 == 204)
    return 73;
  if ((result - 209) < 8 && ((0xBFu >> (result + 47)) & 1) != 0)
    return dword_1DE2F2880[(int)result - 209];
  if ((result - 217) < 4)
    return 85;
  if ((_DWORD)result == 221)
    return 89;
  if ((result - 224) < 6)
    return 97;
  if ((_DWORD)result == 231)
    return 99;
  if (v2 == 232)
    return 101;
  if (v2 == 236)
    return 105;
  if ((result - 241) < 8 && ((0xBFu >> (result + 15)) & 1) != 0)
    return dword_1DE2F28A0[(int)result - 241];
  if ((result - 249) < 4)
    return 117;
  if ((result & 0xFFFFFFFD) == 0xFD)
    return 121;
  return result;
}

uint64_t toUpperX_0(uint64_t result, int a2)
{
  unsigned int v3;

  if (a2 > 1279)
  {
    if (a2 == 1284)
    {
      if ((int)result > 247 || (result - 97) < 0x1A || (result - 223) < 0x18)
      {
        if ((int)result <= 157)
        {
          if ((_DWORD)result == 105)
            return 221;
          if ((_DWORD)result != 154 && (_DWORD)result != 156)
            return (result - 32);
        }
        else
        {
          if ((int)result > 252)
          {
            if ((_DWORD)result == 253)
              return 73;
            if ((_DWORD)result == 255)
              return 159;
            return (result - 32);
          }
          if ((_DWORD)result != 158)
          {
            if ((_DWORD)result == 223)
              return result;
            return (result - 32);
          }
        }
        return (result - 16);
      }
    }
    else
    {
      if (a2 != 1280)
        goto LABEL_39;
      if ((int)result > 247 || (result - 97) < 0x1A || (result - 223) < 0x18)
      {
        if ((result - 154) > 4 || ((1 << (result + 102)) & 0x15) == 0)
        {
          if ((_DWORD)result == 255)
            v3 = 159;
          else
            v3 = result - 32;
          if ((_DWORD)result == 223)
            return 223;
          else
            return v3;
        }
        return (result - 16);
      }
    }
    if ((result - 154) > 4 || ((1 << (result + 102)) & 0x15) == 0)
      return result;
    return (result - 16);
  }
  if (a2 != 514)
  {
    if (a2 == 517)
    {
      if ((result - 97) >= 0x1A && (result - 208) > 0x1F)
      {
        if ((result - 241) >= 0xC && (int)result <= 253)
          return result;
        else
          return (result - 80);
      }
      return (result - 32);
    }
LABEL_39:
    if ((result - 97) >= 0x1A)
      return result;
    else
      return (result - 32);
  }
  if ((result - 97) < 0x1A
    || (result - 223) < 0x18
    || (result - 177) <= 0xE && ((1 << (result + 79)) & 0x6F35) != 0
    || (result - 248) < 7)
  {
    if ((result - 177) < 0xF && ((0x6F35u >> (result + 79)) & 1) != 0)
      return dword_1DE2F28C0[(int)result - 177];
    return (result - 32);
  }
  return result;
}

void sub_1DE2DA328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1DE2DD1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t findPinyin(unsigned __int8 *a1, uint64_t a2, int a3, int a4, _QWORD *a5, unsigned __int8 **a6, unsigned __int8 **a7, _QWORD *a8, _QWORD *a9, _QWORD *a10, _QWORD *a11, _BYTE *a12, uint64_t *a13, _QWORD *a14, _QWORD *a15, _QWORD *a16, _QWORD *a17, _QWORD *a18)
{
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  unsigned __int8 *v25;
  unsigned int v26;
  unsigned int v27;
  uint64_t v28;
  unsigned __int8 *v29;
  unsigned __int8 *v30;
  unsigned __int8 *v31;
  unint64_t v32;
  unsigned __int8 *v33;
  _QWORD *v34;
  unsigned __int8 *v35;
  unsigned __int8 *v36;
  unsigned __int8 *v37;
  unsigned __int8 *pinyin;
  uint64_t v39;
  char v40;
  char v41;
  unsigned __int8 *v42;
  unsigned __int8 *v43;
  _QWORD *v44;
  uint64_t v45;
  char v46;
  int v47;
  unsigned __int8 *v48;
  char v49;
  unsigned __int8 *v50;
  int v51;
  unsigned __int8 *v52;
  unsigned __int8 *v53;
  unsigned __int8 *v54;
  _QWORD *v55;
  unsigned int v56;
  unsigned int v57;
  unsigned __int8 *v58;
  unsigned int v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  unsigned __int8 *v63;
  unsigned __int8 *v64;
  char v70;
  unsigned __int8 *v71;
  unsigned int v72;
  unsigned __int8 *v73;
  unsigned int v74;
  unsigned int v75;
  unsigned int v76;
  unsigned __int8 *v77;
  uint64_t v78;
  uint64_t v79;
  unsigned __int8 *v80;
  int v82;
  int v83;
  unsigned int v84;
  uint64_t v85;
  unsigned __int8 *v86;
  unsigned __int8 *v87[2];

  v21 = 0;
  v85 = 0;
  v84 = 0;
  v22 = MEMORY[0x1E0C80978];
  do
  {
    v23 = a1[v21];
    if ((char)a1[v21] < 0)
      v24 = __maskrune(v23, 0x2000uLL);
    else
      v24 = *(_DWORD *)(v22 + 4 * v23 + 60) & 0x2000;
    ++v21;
  }
  while (v24);
  v82 = a4;
  v25 = &a1[v21 - 1];
  v86 = 0;
  v87[0] = v25;
  v80 = &a1[a2];
  if (v25 >= &a1[a2])
  {
    v25 = 0;
    v31 = 0;
    v36 = 0;
    v37 = 0;
    v58 = 0;
    v27 = 0;
    v57 = 0;
    v56 = 0;
    v70 = 0;
    v28 = 0;
    v78 = 0;
LABEL_61:
    v34 = a18;
    goto LABEL_62;
  }
  v72 = 0;
  v26 = 0;
  v27 = 0;
  v78 = 0;
  v28 = 0;
  v71 = 0;
  v29 = 0;
  v30 = 0;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  v70 = 0;
  v73 = a1;
  v34 = a18;
  v35 = v80;
  do
  {
    v36 = v31;
    v37 = v30;
    v77 = v29;
    v75 = v27;
    v74 = v26;
    pinyin = next_pinyin(v25, v35 - v25, a3, v82, v87, (_DWORD *)&v85 + 1);
    if (pinyin)
    {
      v31 = pinyin;
      if (v34)
        v34[v28] = v87[0] - pinyin;
      v78 += HIDWORD(v85);
      v79 = v28 + 1;
    }
    else
    {
      v31 = v87[0];
      if (*v87[0] == 127)
      {
        ++v87[0];
        if (v34)
          v34[v28] = 1;
        v79 = v28 + 1;
      }
      else if (is_partial_pinyin(v87[0], v80 - v87[0], a3, &v84))
      {
        v31 = v87[0];
        v87[0] = v80;
        if (v34)
          v34[v28] = v80 - v31;
        v78 += v84;
        v79 = v28 + 1;
        v70 = 1;
      }
      else
      {
        v79 = v28;
        v31 = 0;
      }
    }
    v39 = 0;
    v40 = 1;
    do
    {
      v41 = v40;
      if (v33 && !v31 && v36)
      {
        if (v33 > &v36[v39 + 1]
          && v36 == next_pinyin(v36, &v33[-v39 - 1] - v36, a3, v82, &v86, &v85)
          && (v87[0] = v86,
              v42 = next_pinyin(v86, v80 - v86, a3, v82, v87, (_DWORD *)&v85 + 1),
              v43 = v87[0],
              v87[0] > v33))
        {
          v31 = v42;
          if (v42)
          {
            if (a18)
            {
              v44 = &a18[v79];
              *(v44 - 1) = v42 - v36;
              *v44 = v43 - v42;
            }
            v78 = v78 - v27 + (HIDWORD(v85) + v85);
            ++v79;
          }
        }
        else
        {
          v31 = 0;
        }
      }
      v40 = 0;
      v39 = 1;
    }
    while ((v41 & 1) != 0);
    v45 = 0;
    v46 = 1;
    v47 = a3;
    v48 = v77;
    do
    {
      v49 = v46;
      if (v32 && !v31 && v37)
      {
        if (v32 <= (unint64_t)&v37[v45 + 1]
          || v37 != next_pinyin(v37, v32 - 1 - v45 - (_QWORD)v37, v47, v82, &v86, &v85))
        {
          v31 = 0;
          goto LABEL_41;
        }
        v83 = 0;
        v50 = next_pinyin(v86, v80 - v86, v47, v82, &v86, &v83);
        v51 = v47;
        if (!v50)
        {
          v31 = 0;
LABEL_52:
          v48 = v77;
          goto LABEL_41;
        }
        v52 = v50;
        v87[0] = v86;
        v53 = next_pinyin(v86, v80 - v86, v51, v82, v87, (_DWORD *)&v85 + 1);
        v54 = v87[0];
        if (v87[0] <= v33)
        {
          v31 = 0;
          v47 = a3;
          goto LABEL_52;
        }
        v31 = v53;
        v48 = v77;
        if (v53)
        {
          if (a18)
          {
            v55 = &a18[v79];
            *(v55 - 2) = v52 - v37;
            *(v55 - 1) = v53 - v52;
            *v55 = v54 - v53;
          }
          ++v79;
          v78 = v78 - (v74 + v75) + (v83 + v85 + HIDWORD(v85));
        }
        v47 = a3;
      }
LABEL_41:
      v46 = 0;
      v45 = 1;
    }
    while ((v49 & 1) != 0);
    v28 = v79;
    if (!v31)
    {
      v25 = v33;
      v31 = v36;
      v36 = v37;
      v37 = v48;
      v58 = v71;
      v27 = v75;
      v57 = v74;
      v56 = v72;
      a1 = v73;
      goto LABEL_61;
    }
    a1 = v73;
    if (v31 < v73 || (v25 = v87[0], v87[0] < v73))
    {
      v25 = v33;
      v31 = v36;
      v36 = v37;
      v37 = v77;
      v58 = v71;
      v27 = v75;
      v57 = v74;
      v56 = v72;
      goto LABEL_61;
    }
    v27 = HIDWORD(v85);
    v56 = v74;
    v72 = v74;
    v57 = v75;
    v26 = v75;
    v58 = v77;
    v71 = v77;
    v29 = v37;
    v30 = v36;
    v32 = (unint64_t)v33;
    v33 = v87[0];
    v35 = v80;
    v34 = a18;
  }
  while (v87[0] < v80);
LABEL_62:
  v76 = v57;
  v59 = v56;
  v86 = 0;
  if (v34)
    *v34 = *v34 + v21 - 1;
  if (v25)
    v60 = v31 == 0;
  else
    v60 = 1;
  v61 = !v60;
  if (!v60)
  {
    if (a5)
    {
      v62 = v58 - a1;
      if (!v58)
        v62 = 0;
      *a5 = v62;
    }
    if (a6)
    {
      v63 = (unsigned __int8 *)(v37 - a1);
      if (!v37)
        v63 = 0;
      *a6 = v63;
    }
    if (a7)
    {
      v64 = (unsigned __int8 *)(v36 - a1);
      if (!v36)
        v64 = 0;
      *a7 = v64;
    }
    if (a8)
      *a8 = v31 - a1;
    if (a9)
      *a9 = v25 - a1;
    if (v25 < v80
      && v25 > v31 + 1
      && v31 == next_pinyin(v31, (unint64_t)&v25[~(unint64_t)v31], a3, v82, &v86, (_DWORD *)&v85 + 1))
    {
      if (a10)
        *a10 = v86 - a1;
      if (a14)
        *a14 = v78 - v27 + HIDWORD(v85);
    }
    if (a11)
      *a11 = v28;
    if (a12)
      *a12 = v70 & 1;
    if (a15)
      *a15 = v78 - v27;
    if (a16)
      *a16 = v78 - (v76 + (unint64_t)v27);
    if (a17)
      *a17 = v78 - (v76 + (unint64_t)v27 + v59);
    if (a13)
      *a13 = v78;
  }
  return v61;
}

uint64_t isFullOrAbbreviatedPinyin(uint64_t a1, uint64_t a2, int a3, _QWORD *a4)
{
  unsigned __int8 *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  unint64_t v12;
  uint64_t v13;
  unsigned __int8 *v14;
  unsigned int v15;
  uint64_t result;
  unsigned __int8 *v17;

  v8 = (unsigned __int8 *)(a1 - 1);
  v9 = MEMORY[0x1E0C80978];
  do
  {
    v10 = v8[1];
    if ((char)v8[1] < 0)
      v11 = __maskrune(v10, 0x2000uLL);
    else
      v11 = *(_DWORD *)(v9 + 4 * v10 + 60) & 0x2000;
    ++v8;
  }
  while (v11);
  v17 = v8;
  v12 = a1 + a2;
  if ((unint64_t)v8 >= a1 + a2)
  {
    v13 = 0;
    if (!a4)
      return 1;
    goto LABEL_19;
  }
  v13 = 0;
  do
  {
    if (next_pinyin(v8, v12 - (_QWORD)v8, a3, 1, &v17, 0))
    {
      ++v13;
    }
    else
    {
      v14 = v17;
      v15 = *v17;
      if (memchr("bcdfghjklmnpqrstwxyz", v15, 0x15uLL))
      {
        ++v13;
      }
      else if ((v15 & 0x80) != 0)
      {
        result = __maskrune(v15, 0x2000uLL);
        if (!(_DWORD)result)
          return result;
      }
      else
      {
        result = *(_DWORD *)(v9 + 4 * v15 + 60) & 0x2000;
        if (!(_DWORD)result)
          return result;
      }
      v17 = v14 + 1;
    }
    v8 = v17;
  }
  while ((unint64_t)v17 < v12);
  if (a4)
LABEL_19:
    *a4 = v13;
  return 1;
}

uint64_t PRCopyAlternativesForPinyinInputString(uint64_t a1)
{
  AppleSpell *v2;

  v2 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v2 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v2;
  }
  return (uint64_t)-[AppleSpell spellServer:_retainedAlternativesForPinyinInputString:extended:](v2, "spellServer:_retainedAlternativesForPinyinInputString:extended:", 0, a1, 0);
}

uint64_t PRCopyPrefixesForPinyinInputString(uint64_t a1)
{
  AppleSpell *v2;

  v2 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v2 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v2;
  }
  return (uint64_t)-[AppleSpell spellServer:_retainedPrefixesForPinyinInputString:](v2, "spellServer:_retainedPrefixesForPinyinInputString:", 0, a1);
}

uint64_t PRCopyCorrectionsForPinyinInputString(uint64_t a1)
{
  AppleSpell *v2;

  v2 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v2 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v2;
  }
  return (uint64_t)-[AppleSpell spellServer:_retainedCorrectionsForPinyinInputString:](v2, "spellServer:_retainedCorrectionsForPinyinInputString:", 0, a1);
}

uint64_t PRCopyModificationsForPinyinInputString(uint64_t a1)
{
  AppleSpell *v2;

  v2 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v2 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v2;
  }
  return (uint64_t)-[AppleSpell spellServer:_retainedModificationsForPinyinInputString:geometryModelData:](v2, "spellServer:_retainedModificationsForPinyinInputString:geometryModelData:", 0, a1, 0);
}

uint64_t PRCopyModificationsForPinyinInputStringWithGeometryModelData(uint64_t a1, uint64_t a2)
{
  AppleSpell *v4;

  v4 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v4 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v4;
  }
  return (uint64_t)-[AppleSpell spellServer:_retainedModificationsForPinyinInputString:geometryModelData:](v4, "spellServer:_retainedModificationsForPinyinInputString:geometryModelData:", 0, a1, a2);
}

uint64_t PRCopyFinalModificationsForPinyinInputString(uint64_t a1)
{
  AppleSpell *v2;

  v2 = (AppleSpell *)_sharedChecker;
  if (!_sharedChecker)
  {
    v2 = objc_alloc_init(AppleSpell);
    _sharedChecker = (uint64_t)v2;
  }
  return (uint64_t)-[AppleSpell spellServer:_retainedFinalModificationsForPinyinInputString:geometryModelData:](v2, "spellServer:_retainedFinalModificationsForPinyinInputString:geometryModelData:", 0, a1, 0);
}

uint64_t ConvertStringToHangulCompatibilityJamo(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unsigned __int16 *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v21 - v4;
  if (v3)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = objc_msgSend(a1, "characterAtIndex:", v9);
      v11 = v10;
      if ((v10 & 0xFF00) == 0x1100)
      {
        if ((v6 & ((v7 - 4520) < 0x1B)) != 0 || (v10 - 4371) <= 0xFFFFFFEC)
        {
          v12 = 0;
          v13 = 22;
          while (1)
          {
            v14 = v12 + v13;
            if (v12 + v13 < 0 != __OFADD__(v12, v13))
              ++v14;
            v15 = v14 >> 1;
            v16 = (uint64_t)v14 >> 1;
            v17 = *((unsigned __int16 *)&CompoundJamoTable + 3 * v15 + 2);
            if (v17 == (_DWORD)v10)
              break;
            if (v17 >= v10)
              v13 = v16 - 1;
            else
              v12 = v16 + 1;
            if (v12 > v13)
              goto LABEL_14;
          }
          v19 = (unsigned __int16 *)((char *)&CompoundJamoTable + 6 * (int)v16);
          v18 = v19[1];
          *(_WORD *)&v5[2 * v8++] = HangulJamoToCompatibility(*v19);
          v6 = 1;
        }
        else
        {
LABEL_14:
          v6 = 0;
          v18 = v10;
        }
        LOWORD(v10) = HangulJamoToCompatibility(v18);
      }
      else
      {
        v6 = 0;
      }
      *(_WORD *)&v5[2 * v8++] = v10;
      ++v9;
      v7 = v11;
    }
    while (v9 != v2);
  }
  else
  {
    v8 = 0;
  }
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v5, v8);
}

uint64_t HangulJamoToCompatibility(uint64_t result)
{
  int v1;
  __int16 *v2;
  unsigned int v3;

  if ((result & 0xFF00) == 0x1100)
  {
    if (result >> 3 >= 0x235)
    {
      v1 = result - 4520;
      if ((result - 4520) > 0x1A)
        return result;
      v2 = (__int16 *)&JongToCompatibilityTable;
      return (unsigned __int16)v2[v1];
    }
    if (result < 0x1161)
    {
      v1 = result - 4352;
      if ((result - 4352) > 0x12)
        return result;
      v2 = (__int16 *)&ChoToCompatibilityTable;
      return (unsigned __int16)v2[v1];
    }
    v1 = result - 4449;
    if ((result - 4449) <= 0x14)
    {
      v2 = &JungToCompatibilityTable;
      return (unsigned __int16)v2[v1];
    }
    if ((_DWORD)result == 4513)
      v3 = 12686;
    else
      v3 = result;
    if ((_DWORD)result == 4510)
      return 12685;
    else
      return v3;
  }
  return result;
}

uint64_t ConvertStringFromHangulCompatibilityJamo(void *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  int v10;
  unsigned int v11;
  _BOOL4 v13;
  int v14;
  unint64_t v15;
  BOOL v16;
  __int16 *v17;
  _BOOL4 v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "length");
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v21 - v4;
  if (v3)
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = objc_msgSend(a1, "characterAtIndex:", v8++);
      if (v8 >= v2)
        v10 = 0;
      else
        v10 = objc_msgSend(a1, "characterAtIndex:", v8);
      if (v9 - 12593 <= 0x5D)
      {
        v11 = v10 - 12687;
        v13 = v6 - 4371 < 0xFFFFFFED && v11 < 0xFFFFFFC0;
        v14 = HangulCompatibilityToJamo(v9, v13);
        if (!v7)
          goto LABEL_21;
        v15 = 0;
        v16 = 1;
        v17 = &word_1DE2F2DE0;
        while ((unsigned __int16)*(v17 - 2) != v6 || (unsigned __int16)*(v17 - 1) != v14)
        {
          v16 = v15 < 0x16;
          v17 += 3;
          if (++v15 == 23)
            goto LABEL_21;
        }
        if (v16)
        {
          v9 = (unsigned __int16)*v17;
          --v7;
        }
        else
        {
LABEL_21:
          v19 = v6 - 4449 < 0x42 && v11 < 0xFFFFFFC0;
          v9 = HangulCompatibilityToJamo(v9, v19);
        }
      }
      *(_WORD *)&v5[2 * v7] = v9;
      v6 = v9;
      ++v7;
    }
    while (v8 != v2);
  }
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v5);
}

uint64_t HangulCompatibilityToJamo(unsigned int a1, int a2)
{
  uint64_t v2;
  __int16 *v3;
  unsigned __int16 v4;
  int v5;
  unsigned int v6;

  if (a1 - 12593 > 0x1D)
  {
    if (a1 - 12623 <= 0x3F)
    {
      v3 = &JungToCompatibilityTable;
      v2 = 21;
      v4 = 4449;
      goto LABEL_11;
    }
  }
  else
  {
    v2 = 19;
    if (a2)
      v2 = 27;
    v3 = (__int16 *)&ChoToCompatibilityTable;
    if (a2)
      v3 = (__int16 *)&JongToCompatibilityTable;
    v4 = 4352;
    if (a2)
      v4 = 4520;
LABEL_11:
    while (1)
    {
      v5 = (unsigned __int16)*v3++;
      if (v5 == a1)
        break;
      ++v4;
      if (!--v2)
        goto LABEL_15;
    }
    a1 = v4;
  }
LABEL_15:
  if (a1 == 12686)
    v6 = 4513;
  else
    v6 = a1;
  if (a1 == 12685)
    return 4510;
  else
    return v6;
}

void sub_1DE2E91C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFBinaryHeapAddValue(CFBinaryHeapRef heap, const void *value)
{
  MEMORY[0x1E0C97F08](heap, value);
}

CFBinaryHeapRef CFBinaryHeapCreate(CFAllocatorRef allocator, CFIndex capacity, const CFBinaryHeapCallBacks *callBacks, const CFBinaryHeapCompareContext *compareContext)
{
  return (CFBinaryHeapRef)MEMORY[0x1E0C97F20](allocator, capacity, callBacks, compareContext);
}

CFIndex CFBinaryHeapGetCount(CFBinaryHeapRef heap)
{
  return MEMORY[0x1E0C97F28](heap);
}

const void *__cdecl CFBinaryHeapGetMinimum(CFBinaryHeapRef heap)
{
  return (const void *)MEMORY[0x1E0C97F38](heap);
}

void CFBinaryHeapRemoveMinimumValue(CFBinaryHeapRef heap)
{
  MEMORY[0x1E0C97F48](heap);
}

CFCharacterSetRef CFCharacterSetGetPredefined(CFCharacterSetPredefinedSet theSetIdentifier)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982F0](theSetIdentifier);
}

Boolean CFCharacterSetIsCharacterMember(CFCharacterSetRef theSet, UniChar theChar)
{
  return MEMORY[0x1E0C98320](theSet, theChar);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x1E0C98FE8](alloc, chars, numChars);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x1E0C991D8](theString, theForm);
}

void CFStringReplace(CFMutableStringRef theString, CFRange range, CFStringRef replacement)
{
  MEMORY[0x1E0C991F0](theString, range.location, range.length, replacement);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFIndex CFStringTokenizerGetCurrentSubTokens(CFStringTokenizerRef tokenizer, CFRange *ranges, CFIndex maxRangeLength, CFMutableArrayRef derivedSubTokens)
{
  return MEMORY[0x1E0C99228](tokenizer, ranges, maxRangeLength, derivedSubTokens);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x1E0D43820]();
}

uint64_t LXCursorCopyTraversedCharacters()
{
  return MEMORY[0x1E0D43538]();
}

uint64_t LXCursorCreateByAdvancing()
{
  return MEMORY[0x1E0D43540]();
}

uint64_t LXCursorEnumerateChildren()
{
  return MEMORY[0x1E0D43550]();
}

uint64_t LXCursorEnumerateEntries()
{
  return MEMORY[0x1E0D43558]();
}

uint64_t LXCursorEnumerateEntriesRecursively()
{
  return MEMORY[0x1E0D43560]();
}

uint64_t LXCursorHasChildren()
{
  return MEMORY[0x1E0D43570]();
}

uint64_t LXCursorHasEntries()
{
  return MEMORY[0x1E0D43578]();
}

uint64_t LXCursorPrefixProbability()
{
  return MEMORY[0x1E0D43598]();
}

uint64_t LXCursorTerminationProbability()
{
  return MEMORY[0x1E0D435A8]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x1E0D435C8]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x1E0D43600]();
}

uint64_t LXEntryGetProbability()
{
  return MEMORY[0x1E0D43618]();
}

uint64_t LXEntryGetTokenID()
{
  return MEMORY[0x1E0D43628]();
}

uint64_t LXLexiconAdd()
{
  return MEMORY[0x1E0D43650]();
}

uint64_t LXLexiconCopyEntryForTokenID()
{
  return MEMORY[0x1E0D43678]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1E0D43690]();
}

uint64_t LXLexiconCreateMutable()
{
  return MEMORY[0x1E0D43698]();
}

uint64_t LXLexiconCreateRootCursor()
{
  return MEMORY[0x1E0D436A0]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1E0CB2C08](userName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSOrthographyFlagsForScriptAndOrthographyIndexes()
{
  return MEMORY[0x1E0CB2FD8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1E0CB3428]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C80B70]();
}

uint64_t __strcat_chk()
{
  return MEMORY[0x1E0C80C30]();
}

uint64_t __strcpy_chk()
{
  return MEMORY[0x1E0C80C38]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t __strncat_chk()
{
  return MEMORY[0x1E0C80C50]();
}

uint64_t __strncpy_chk()
{
  return MEMORY[0x1E0C80C58]();
}

__darwin_ct_rune_t __tolower(__darwin_ct_rune_t a1)
{
  return MEMORY[0x1E0C80C70](*(_QWORD *)&a1);
}

int access(const char *a1, int a2)
{
  return MEMORY[0x1E0C813D0](a1, *(_QWORD *)&a2);
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int getc(FILE *a1)
{
  return MEMORY[0x1E0C83638](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

off_t lseek(int a1, off_t a2, int a3)
{
  return MEMORY[0x1E0C83C38](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
  MEMORY[0x1E0C840B8](__b, __pattern16, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_threadid_np(pthread_t a1, __uint64_t *a2)
{
  return MEMORY[0x1E0C84F38](a1, a2);
}

int putc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C84F48](*(_QWORD *)&a1, a2);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x1E0C84F90](__base, __nel, __width, __compar);
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

void srandom(unsigned int a1)
{
  MEMORY[0x1E0C85488](*(_QWORD *)&a1);
}

char *__cdecl strcat(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85510](__s1, __s2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

size_t strcspn(const char *__s, const char *__charset)
{
  return MEMORY[0x1E0C85538](__s, __charset);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85568](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncasecmp_l(const char *a1, const char *a2, size_t a3, locale_t a4)
{
  return MEMORY[0x1E0C85598](a1, a2, a3, a4);
}

char *__cdecl strncat(char *__s1, const char *__s2, size_t __n)
{
  return (char *)MEMORY[0x1E0C855A0](__s1, __s2, __n);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

ssize_t writev(int a1, const iovec *a2, int a3)
{
  return MEMORY[0x1E0C85D48](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

