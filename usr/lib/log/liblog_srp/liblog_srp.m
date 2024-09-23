uint64_t DNSMessageExtractDomainName(unint64_t a1, uint64_t a2, char *__src, char *__dst, _QWORD *a5)
{
  char *v6;
  uint64_t result;
  unint64_t v8;
  _BYTE *v10;
  unsigned int v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;

  if (__dst)
    v6 = __dst + 256;
  else
    v6 = 0;
  result = 4294960586;
  if ((unint64_t)__src < a1)
    return result;
  v8 = a1 + a2;
  if (a1 + a2 <= (unint64_t)__src)
    return result;
  v10 = __dst;
  v11 = *__src;
  if (*__src)
  {
    v12 = 0;
    do
    {
      if (v11 > 0x3F)
      {
        if ((~v11 & 0xC0) != 0)
          return 4294960554;
        if ((uint64_t)(v8 - (_QWORD)__src) < 2)
          return 4294960546;
        if (!v12)
        {
          v12 = __src + 2;
          if (!v10)
            goto LABEL_23;
        }
        __src = (char *)(a1 + (__src[1] | ((unint64_t)(v11 & 0x3F) << 8)));
        if ((unint64_t)__src >= v8)
          return 4294960546;
        v11 = *__src;
        if (v11 > 0xBF)
          return 4294960554;
      }
      else
      {
        v13 = &__src[v11 + 1];
        if ((unint64_t)v13 >= v8)
          return 4294960546;
        if (v10)
        {
          v14 = v11 + 1;
          if (v6 - v10 <= v14)
            return 4294960545;
          memcpy(v10, __src, v11 + 1);
          v10 += v14;
        }
        v11 = *v13;
        __src = v13;
      }
    }
    while (v11);
    if (!v10)
      goto LABEL_23;
    goto LABEL_22;
  }
  v12 = 0;
  if (__dst)
LABEL_22:
    *v10 = 0;
LABEL_23:
  result = 0;
  if (a5)
  {
    if (v12)
      v15 = v12;
    else
      v15 = __src + 1;
    *a5 = v15;
  }
  return result;
}

uint64_t DNSMessageExtractDomainNameString(unint64_t a1, uint64_t a2, char *a3, unsigned __int8 *a4, _QWORD *a5)
{
  uint64_t result;
  uint64_t v8;
  unsigned __int8 __dst[256];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  result = DNSMessageExtractDomainName(a1, a2, a3, (char *)__dst, &v8);
  if (!(_DWORD)result)
  {
    result = DomainNameToString(__dst, 0, a4, 0);
    if (a5)
    {
      if (!(_DWORD)result)
        *a5 = v8;
    }
  }
  return result;
}

uint64_t DomainNameToString(unsigned __int8 *a1, unint64_t a2, unsigned __int8 *a3, _QWORD *a4)
{
  uint64_t i;
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  unsigned __int8 v8;
  char v10;
  char v11;
  uint64_t result;

  if (a2 && (uint64_t)(a2 - (_QWORD)a1) < 1)
    return 4294960546;
  LODWORD(i) = *a1;
  if (*a1)
  {
    v5 = a1;
    do
    {
      if (i > 0x3F)
        return 4294960554;
      v6 = &v5[i + 1];
      if (v6 - a1 > 255)
        return 4294960554;
      if (a2 && (unint64_t)v6 >= a2)
        return 4294960546;
      v7 = v5 + 1;
      if (v7 < v6)
      {
        for (i = i; i; --i)
        {
          v8 = *v7;
          if (((char)*v7 - 32) > 0x5E)
          {
            if ((*v7 & 0x80) == 0)
            {
              *a3 = 92;
              if (v8 <= 0x63u)
                v10 = 48;
              else
                v10 = 49;
              a3[1] = v10;
              if (v8 >= 0x64u)
                v11 = v8 / 0xAu - 10;
              else
                v11 = v8 / 0xAu;
              a3[2] = v11 + 48;
              a3[3] = (v8 % 0xAu) | 0x30;
              a3 += 4;
              goto LABEL_26;
            }
          }
          else if (*v7 - 32 <= 0x3C && ((1 << (v8 - 32)) & 0x1000000000004001) != 0)
          {
            *a3++ = 92;
          }
          *a3++ = v8;
LABEL_26:
          ++v7;
        }
      }
      *a3++ = 46;
      LODWORD(i) = *v6;
      v5 = v6;
    }
    while (*v6);
    if (v6 != a1)
      goto LABEL_30;
  }
  *a3++ = 46;
  v6 = a1;
LABEL_30:
  *a3 = 0;
  result = 0;
  if (a4)
    *a4 = v6 + 1;
  return result;
}

uint64_t DNSMessageExtractQuestion(unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _QWORD *a7)
{
  uint64_t result;
  unsigned __int16 *v13;
  unsigned __int16 *v14;

  v14 = 0;
  result = DNSMessageExtractDomainName(a1, a2, a3, a4, &v14);
  if (!(_DWORD)result)
  {
    v13 = v14;
    if (a1 + a2 - (unint64_t)v14 < 4)
    {
      return 4294960546;
    }
    else
    {
      if (a5)
        *a5 = bswap32(*v14) >> 16;
      if (a6)
        *a6 = bswap32(v13[1]) >> 16;
      result = 0;
      if (a7)
        *a7 = v13 + 2;
    }
  }
  return result;
}

uint64_t DNSMessageExtractRecord(unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _DWORD *a7, unsigned __int16 **a8, unint64_t *a9, _QWORD *a10)
{
  return _DNSMessageExtractRecordEx(a1, a2, a3, a4, a5, a6, a7, a8, a9, 0, 0, 0, 0, a10);
}

uint64_t _DNSMessageExtractRecordEx(unint64_t a1, uint64_t a2, char *a3, char *a4, _WORD *a5, _WORD *a6, _DWORD *a7, unsigned __int16 **a8, unint64_t *a9, char *a10, size_t a11, _QWORD *a12, _QWORD *a13, _QWORD *a14)
{
  uint64_t result;
  char *v20;
  unsigned __int16 *v21;
  unint64_t v22;
  unsigned int v23;
  unint64_t v25;
  size_t v26;
  char *v27;

  v27 = 0;
  result = DNSMessageExtractDomainName(a1, a2, a3, a4, &v27);
  if (!(_DWORD)result)
  {
    v20 = v27;
    if (a1 + a2 - (unint64_t)v27 < 0xA)
      return 4294960546;
    v21 = (unsigned __int16 *)(v27 + 10);
    v22 = __rev16(*((unsigned __int16 *)v27 + 4));
    if (a1 + a2 - (unint64_t)(v27 + 10) < v22)
    {
      return 4294960546;
    }
    else
    {
      v25 = 0;
      v26 = 0;
      v23 = bswap32(*(unsigned __int16 *)v27) >> 16;
      if (!a11 && !a13
        || (result = DNSMessageExtractRData(a1, a2, v27 + 10, v22, v23, a10, a11, &v26, &v25), !(_DWORD)result))
      {
        if (a5)
          *a5 = v23;
        if (a6)
          *a6 = bswap32(*((unsigned __int16 *)v20 + 1)) >> 16;
        if (a7)
          *a7 = bswap32(*((_DWORD *)v20 + 1));
        if (a8)
          *a8 = v21;
        if (a9)
          *a9 = v22;
        if (a12)
          *a12 = v26;
        if (a13)
          *a13 = v25;
        result = 0;
        if (a14)
          *a14 = (char *)v21 + v22;
      }
    }
  }
  return result;
}

uint64_t DNSMessageExtractRData(unint64_t a1, uint64_t a2, char *__src, unint64_t a4, int a5, char *a6, size_t a7, size_t *a8, unint64_t *a9)
{
  size_t v10;
  unint64_t v12;
  char *v16;
  uint64_t result;
  int v18;
  char *v19;
  char *v20;
  int v21;
  char *v22;
  void *v23;
  char *v24;
  int v25;
  char *v26;
  char *v27;
  int v28;
  int64_t v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  char *v33;
  size_t v34;
  char *v35;
  int v36;
  char *v37;
  char *v38;
  int v39;
  char *v40;
  unint64_t v41;
  int v42;
  char *v43;
  char *v44;
  int v45;
  int64_t v46;
  unint64_t v47;
  char *v48;
  _BYTE *v49;
  int v50;
  char *v51;
  char *v52;
  int v53;
  char *v54;
  int64_t v55;
  int v56;
  char *v57;
  char *v58;
  int v59;
  int64_t v60;
  unint64_t v61;
  char *v62;
  size_t v63;
  char *v64;
  size_t v65;
  int v66;
  char *v67;
  char *v68;
  int v69;
  char *v70;
  int v71;
  char *v72;
  char *v73;
  int v74;
  unint64_t v75;
  void *v76;
  char __dst[256];
  char __srca[256];
  uint64_t v79;

  v10 = a7;
  v12 = a4;
  v79 = *MEMORY[0x24BDAC8D0];
  v76 = 0;
  v16 = &__src[a4];
  switch(a5)
  {
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
    case 9:
    case 12:
    case 39:
      result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!(_DWORD)result)
      {
        if (v76 != v16)
          goto LABEL_77;
        v18 = __srca[0];
        v19 = __srca;
        if (__srca[0])
        {
          do
          {
            v20 = &v19[v18];
            v21 = v20[1];
            v19 = v20 + 1;
            v18 = v21;
          }
          while (v21);
        }
        v12 = v19 - __srca + 1;
        if (v12 < v10)
          v10 = v19 - __srca + 1;
        v22 = __srca;
        v23 = a6;
        goto LABEL_9;
      }
      break;
    case 6:
      result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!(_DWORD)result)
      {
        result = DNSMessageExtractDomainName(a1, a2, (char *)v76, __dst, &v76);
        if (!(_DWORD)result)
        {
          v49 = v76;
          if (v16 - (_BYTE *)v76 != 20)
            goto LABEL_77;
          v50 = __srca[0];
          v51 = __srca;
          if (__srca[0])
          {
            do
            {
              v52 = &v51[v50];
              v53 = v52[1];
              v51 = v52 + 1;
              v50 = v53;
            }
            while (v53);
          }
          v54 = &a6[v10];
          v55 = v51 - __srca;
          v56 = __dst[0];
          v57 = __dst;
          if (__dst[0])
          {
            do
            {
              v58 = &v57[v56];
              v59 = v58[1];
              v57 = v58 + 1;
              v56 = v59;
            }
            while (v59);
          }
          v60 = v57 - __dst;
          v61 = v57 - __dst + 1;
          v12 = v55 + v61 + 21;
          if (v55 + 1 < v10)
            v10 = v55 + 1;
          memcpy(a6, __srca, v10);
          v62 = &a6[v10];
          if (v54 - v62 >= v61)
            v63 = v60 + 1;
          else
            v63 = v54 - v62;
          memcpy(v62, __dst, v63);
          v64 = &v62[v63];
          if ((unint64_t)(v54 - v64) >= 0x14)
            v65 = 20;
          else
            v65 = v54 - v64;
          goto LABEL_70;
        }
      }
      break;
    case 14:
    case 17:
    case 26:
      result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!(_DWORD)result)
      {
        result = DNSMessageExtractDomainName(a1, a2, (char *)v76, __dst, &v76);
        if (!(_DWORD)result)
        {
          if (v76 != v16)
            goto LABEL_77;
          v36 = __srca[0];
          v37 = __srca;
          if (__srca[0])
          {
            do
            {
              v38 = &v37[v36];
              v39 = v38[1];
              v37 = v38 + 1;
              v36 = v39;
            }
            while (v39);
          }
          v40 = &a6[v10];
          v41 = v37 - __srca + 1;
          v42 = __dst[0];
          v43 = __dst;
          if (__dst[0])
          {
            do
            {
              v44 = &v43[v42];
              v45 = v44[1];
              v43 = v44 + 1;
              v42 = v45;
            }
            while (v45);
          }
          v46 = v43 - __dst;
          v47 = v43 - __dst + 1;
          v12 = v47 + v41;
          if (v41 < v10)
            v10 = v37 - __srca + 1;
          memcpy(a6, __srca, v10);
          v33 = &a6[v10];
          if (v40 - v33 >= v47)
            v34 = v46 + 1;
          else
            v34 = v40 - v33;
          v35 = __dst;
          goto LABEL_36;
        }
      }
      break;
    case 15:
    case 18:
    case 21:
    case 36:
      if (a4 < 3)
        goto LABEL_77;
      result = DNSMessageExtractDomainName(a1, a2, __src + 2, __srca, &v76);
      if (!(_DWORD)result)
      {
        if (v76 != v16)
          goto LABEL_77;
        v24 = &a6[v10];
        v25 = __srca[0];
        v26 = __srca;
        if (__srca[0])
        {
          do
          {
            v27 = &v26[v25];
            v28 = v27[1];
            v26 = v27 + 1;
            v25 = v28;
          }
          while (v28);
        }
        v29 = v26 - __srca;
        v30 = v26 - __srca + 1;
        v12 = v26 - __srca + 3;
        v31 = v10 >= 2;
        v32 = 2;
        goto LABEL_16;
      }
      break;
    case 33:
      if (a4 < 7)
        goto LABEL_77;
      result = DNSMessageExtractDomainName(a1, a2, __src + 6, __srca, &v76);
      if (!(_DWORD)result)
      {
        if (v76 != v16)
          goto LABEL_77;
        v24 = &a6[v10];
        v66 = __srca[0];
        v67 = __srca;
        if (__srca[0])
        {
          do
          {
            v68 = &v67[v66];
            v69 = v68[1];
            v67 = v68 + 1;
            v66 = v69;
          }
          while (v69);
        }
        v29 = v67 - __srca;
        v30 = v67 - __srca + 1;
        v12 = v67 - __srca + 7;
        v31 = v10 >= 6;
        v32 = 6;
LABEL_16:
        if (v31)
          v10 = v32;
        memcpy(a6, __src, v10);
        v33 = &a6[v10];
        if (v24 - v33 >= v30)
          v34 = v29 + 1;
        else
          v34 = v24 - v33;
        v35 = __srca;
LABEL_36:
        memcpy(v33, v35, v34);
        v48 = &v33[v34];
        goto LABEL_71;
      }
      break;
    case 47:
      result = DNSMessageExtractDomainName(a1, a2, __src, __srca, &v76);
      if (!(_DWORD)result)
      {
        v49 = v76;
        if (v76 <= v16)
        {
          v70 = &a6[v10];
          v71 = __srca[0];
          v72 = __srca;
          if (__srca[0])
          {
            do
            {
              v73 = &v72[v71];
              v74 = v73[1];
              v72 = v73 + 1;
              v71 = v74;
            }
            while (v74);
          }
          v75 = v16 - (_BYTE *)v76;
          v12 = v72 - __srca + 1 + v16 - (_BYTE *)v76;
          if (v72 - __srca + 1 < v10)
            v10 = v72 - __srca + 1;
          memcpy(a6, __srca, v10);
          v64 = &a6[v10];
          if (v70 - v64 >= v75)
            v65 = v16 - v49;
          else
            v65 = v70 - v64;
LABEL_70:
          memcpy(v64, v49, v65);
          v48 = &v64[v65];
LABEL_71:
          v10 = v48 - a6;
          goto LABEL_72;
        }
LABEL_77:
        result = 4294960554;
      }
      break;
    default:
      if (a7 >= a4)
        v10 = a4;
      v23 = a6;
      v22 = __src;
LABEL_9:
      memcpy(v23, v22, v10);
LABEL_72:
      if (a8)
        *a8 = v10;
      result = 0;
      if (a9)
        *a9 = v12;
      break;
  }
  return result;
}

uint64_t DomainNameLength(_BYTE *a1)
{
  int v1;
  _BYTE *v2;
  _BYTE *v3;
  int v4;

  v1 = *a1;
  v2 = a1;
  if (*a1)
  {
    v2 = a1;
    do
    {
      v3 = &v2[v1];
      v4 = v3[1];
      v2 = v3 + 1;
      v1 = v4;
    }
    while (v4);
  }
  return v2 - a1 + 1;
}

uint64_t DNSMessageGetAnswerSection(unint64_t a1, unint64_t a2, char **a3)
{
  uint64_t v3;
  uint64_t v4;
  unsigned int v7;
  char *v8;
  unint64_t v10;
  uint64_t result;
  _QWORD v12[9];

  if (a2 < 0xC)
    return 4294960553;
  v12[7] = v3;
  v12[8] = v4;
  v7 = __rev16(*(unsigned __int16 *)(a1 + 4));
  v8 = (char *)(a1 + 12);
  if (v7)
  {
    v10 = a1 + a2;
    while (1)
    {
      v12[0] = 0;
      result = DNSMessageExtractDomainName(a1, a2, v8, 0, v12);
      if ((_DWORD)result)
        break;
      if (v10 - v12[0] <= 3)
        return 4294960546;
      v8 = (char *)(v12[0] + 4);
      if (!--v7)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    result = 0;
    if (a3)
      *a3 = v8;
  }
  return result;
}

uint64_t DNSMessageGetOptRecord(unsigned __int16 *a1, unint64_t a2, _QWORD *a3, char **a4)
{
  uint64_t result;
  unsigned int v9;
  unsigned int v10;
  char *v11;
  char *v12;
  char *v13;
  unsigned int v14;
  __int16 v15;
  __int16 v16;
  char *v17;

  v17 = 0;
  result = DNSMessageGetAnswerSection((unint64_t)a1, a2, &v17);
  if (!(_DWORD)result)
  {
    v9 = __rev16(a1[4]) + (bswap32(a1[3]) >> 16);
    if (v9)
    {
      while (1)
      {
        v16 = 0;
        LODWORD(result) = _DNSMessageExtractRecordEx((unint64_t)a1, a2, v17, 0, &v16, 0, 0, 0, 0, 0, 0, 0, 0, &v17);
        if ((_DWORD)result || v16 == 41)
          break;
        if (!--v9)
          goto LABEL_6;
      }
      if (v16 == 41)
        v14 = -6742;
      else
        v14 = 0;
      if ((_DWORD)result)
        return result;
      else
        return v14;
    }
    else
    {
LABEL_6:
      v10 = __rev16(a1[5]);
      if (v10)
      {
        v11 = 0;
        v12 = 0;
        while (1)
        {
          v15 = 0;
          v13 = v17;
          result = _DNSMessageExtractRecordEx((unint64_t)a1, a2, v17, 0, &v15, 0, 0, 0, 0, 0, 0, 0, 0, &v17);
          if ((_DWORD)result)
            break;
          if (v15 == 41)
          {
            if (v12 || *v13)
              return 4294960554;
            v11 = (char *)(v17 - v13);
            v12 = v13;
          }
          else
          {
            v13 = v12;
          }
          if (!--v10)
          {
            if (!a3)
              goto LABEL_17;
            goto LABEL_16;
          }
        }
      }
      else
      {
        v13 = 0;
        v11 = 0;
        if (a3)
LABEL_16:
          *a3 = v13;
LABEL_17:
        result = 0;
        if (a4)
          *a4 = v11;
      }
    }
  }
  return result;
}

uint64_t DNSMessageGetExtendedDNSError(unsigned __int16 *a1, unint64_t a2, _WORD *a3, char **a4, _WORD *a5)
{
  uint64_t result;
  char *v9;
  char *v10;
  char *v11;
  int64_t v12;
  unsigned int v13;
  char *v14;
  char *v15;
  uint64_t v16;

  v15 = 0;
  v16 = 0;
  result = DNSMessageGetOptRecord(a1, a2, &v16, &v15);
  if (!(_DWORD)result)
  {
    if (v16)
    {
      if ((unint64_t)v15 < 0xB)
        return 4294960546;
      v9 = &v15[v16];
      v10 = (char *)(v16 + 11);
      while (v10 < v9)
      {
        v11 = v10;
        if ((unint64_t)(v9 - v10) < 4)
          return 4294960546;
        v12 = __rev16(*((unsigned __int16 *)v10 + 1));
        if (v9 - (v10 + 4) < v12)
          return 4294960546;
        v13 = __rev16(*(unsigned __int16 *)v10);
        v10 += v12 + 4;
        if (v13 == 15)
        {
          if (v12 < 2)
            return 4294960546;
          v14 = v11 + 6;
          if ((_WORD)v10 == (_WORD)v11 + 6)
            v14 = 0;
          if (a3)
            *a3 = bswap32(*((unsigned __int16 *)v11 + 2)) >> 16;
          if (a4)
            *a4 = v14;
          result = 0;
          if (a5)
            *a5 = (_WORD)v10 - ((_WORD)v11 + 6);
          return result;
        }
      }
    }
    return 4294960569;
  }
  return result;
}

uint64_t DNSMessageWriteQuery(__int16 a1, __int16 a2, _BYTE *__src, __int16 a4, __int16 a5, uint64_t a6, _QWORD *a7)
{
  int v11;
  _BYTE *v12;
  _BYTE *v13;
  int v14;
  unint64_t v15;
  _BYTE *v16;
  uint64_t result;

  *(_WORD *)(a6 + 10) = 0;
  *(_DWORD *)(a6 + 6) = 0;
  *(_BYTE *)a6 = HIBYTE(a1);
  *(_BYTE *)(a6 + 1) = a1;
  *(_BYTE *)(a6 + 2) = HIBYTE(a2);
  *(_BYTE *)(a6 + 3) = a2;
  *(_WORD *)(a6 + 4) = 256;
  v11 = *__src;
  v12 = __src;
  if (*__src)
  {
    v12 = __src;
    do
    {
      v13 = &v12[v11];
      v14 = v13[1];
      v12 = v13 + 1;
      v11 = v14;
    }
    while (v14);
  }
  v15 = v12 - __src + 1;
  if (v15 > 0x100)
    return 4294960553;
  memcpy((void *)(a6 + 12), __src, v12 - __src + 1);
  v16 = (_BYTE *)(a6 + 12 + v15);
  *v16 = HIBYTE(a4);
  v16[1] = a4;
  v16[2] = HIBYTE(a5);
  v16[3] = a5;
  result = 0;
  if (a7)
    *a7 = v15 + 16;
  return result;
}

char *DNSMessageCollapse(unint64_t a1, unint64_t a2, _QWORD *a3, size_t *a4)
{
  int DomainName;
  int v9;
  char *v10;
  char *v11;
  int v12;
  int64_t v13;
  unsigned int v14;
  int v15;
  int v16;
  char v17;
  unsigned int v18;
  char *v19;
  char *v20;
  char *v21;
  char v22;
  unsigned int v23;
  char *v24;
  unsigned int v25;
  char v26;
  unsigned __int16 v27;
  __int16 v28;
  char *v29;
  char *v30;
  int v31;
  char *v32;
  char *v33;
  char v34;
  __int16 v35;
  char *v36;
  size_t *v38;
  unint64_t __n;
  char *v40;
  char v41;
  unsigned int v42;
  size_t size;
  unsigned int v44;
  unsigned __int16 v45;
  unsigned int v46;
  size_t v47;
  unsigned __int16 v48;
  char *v49;
  int v50;
  char *v51;
  unsigned __int8 v52[256];
  unsigned __int8 __dst[256];
  char __src[256];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v51 = 0;
  v50 = 0;
  if (a2 < 0xC)
  {
LABEL_69:
    v36 = 0;
    v21 = 0;
    DomainName = -6743;
    goto LABEL_58;
  }
  if (__rev16(*(unsigned __int16 *)(a1 + 4)) != 1)
  {
    v36 = 0;
    v21 = 0;
    DomainName = -6764;
    goto LABEL_58;
  }
  v51 = (char *)(a1 + 12);
  DomainName = DNSMessageExtractQuestion(a1, a2, (char *)(a1 + 12), __src, (_WORD *)&v50 + 1, &v50, &v51);
  if (DomainName)
    goto LABEL_63;
  if ((unsigned __int16)v50 != 1)
  {
    v36 = 0;
    v21 = 0;
    DomainName = -6756;
    goto LABEL_58;
  }
  v9 = __src[0];
  v10 = __src;
  if (__src[0])
  {
    do
    {
      v11 = &v10[v9];
      v12 = v11[1];
      v10 = v11 + 1;
      v9 = v12;
    }
    while (v12);
  }
  v13 = v10 - __src;
  __n = v10 - __src + 1;
  v40 = v51;
  __memcpy_chk();
  v14 = __rev16(*(unsigned __int16 *)(a1 + 6));
  if (v14)
  {
    v15 = 0;
    v42 = -1;
LABEL_9:
    v16 = 0;
    v51 = v40;
    v17 = 1;
    while (1)
    {
      v49 = 0;
      LODWORD(v47) = 0;
      LOWORD(v46) = 0;
      v48 = 0;
      DomainName = _DNSMessageExtractRecordEx(a1, a2, v51, (char *)v52, &v46, &v48, &v47, (unsigned __int16 **)&v49, 0, 0, 0, 0, 0, &v51);
      if (DomainName)
        break;
      if ((unsigned __int16)v46 == 5 && v48 == (unsigned __int16)v50 && DomainNameEqual(v52, __dst))
      {
        DomainName = DNSMessageExtractDomainName(a1, a2, v49, (char *)__dst, 0);
        if (DomainName)
          break;
        v17 = 0;
        v18 = v42;
        if (v42 >= v47)
          v18 = v47;
        v42 = v18;
        if (++v16 == v14)
          goto LABEL_22;
      }
      else if (v14 == ++v16)
      {
        if ((v17 & 1) != 0)
          goto LABEL_25;
LABEL_22:
        if (++v15 != v14)
          goto LABEL_9;
        goto LABEL_25;
      }
    }
LABEL_63:
    v36 = 0;
LABEL_57:
    v21 = 0;
    goto LABEL_58;
  }
  v42 = -1;
LABEL_25:
  v38 = a4;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  size = v13 + 17;
  v22 = 1;
  a4 = &v47;
  while (1)
  {
    v41 = v22;
    v51 = v40;
    if (v14)
      break;
    v44 = 0;
    if (v21)
      goto LABEL_52;
LABEL_45:
    if (!size || (v30 = (char *)malloc_type_calloc(1uLL, size, 0xF1748037uLL)) == 0)
    {
      __break(1u);
      goto LABEL_69;
    }
    v21 = v30;
    if (size < 0xC)
      goto LABEL_67;
    v31 = *(_DWORD *)a1;
    *((_WORD *)v30 + 2) = *(_WORD *)(a1 + 4);
    *(_DWORD *)v30 = v31;
    *(_DWORD *)(v30 + 6) = 0;
    *((_WORD *)v30 + 5) = 0;
    if (size - 12 < __n)
      goto LABEL_67;
    v19 = &v30[size];
    v32 = v30 + 12;
    memcpy(v30 + 12, __src, __n);
    v33 = &v32[__n];
    if ((unint64_t)(v19 - &v32[__n]) < 4)
      goto LABEL_67;
    v22 = 0;
    v34 = BYTE2(v50);
    v35 = v50;
    *v33 = HIBYTE(v50);
    v33[1] = v34;
    v33[2] = HIBYTE(v35);
    v33[3] = v35;
    v20 = v33 + 4;
    *((_WORD *)v21 + 2) = 256;
    if ((v41 & 1) == 0)
      goto LABEL_54;
  }
  v44 = 0;
  v23 = v14;
  do
  {
    v49 = 0;
    v47 = 0;
    v46 = 0;
    v48 = 0;
    v45 = 0;
    v24 = v51;
    DomainName = _DNSMessageExtractRecordEx(a1, a2, v51, (char *)v52, &v48, &v45, &v46, 0, 0, 0, 0, 0, &v47, &v51);
    if (DomainName)
      goto LABEL_65;
    if (v48 == HIWORD(v50) && v45 == (unsigned __int16)v50 && DomainNameEqual(v52, __dst))
    {
      if (v21)
      {
        if (v19 - v20 < 2)
          goto LABEL_64;
        *(_WORD *)v20 = 3264;
        if ((unint64_t)(v19 - v20 - 2) < 0xA)
          goto LABEL_64;
        v25 = v46;
        if (v46 >= v42)
          v25 = v42;
        v46 = v25;
        v26 = v48;
        v27 = v45;
        v28 = v47;
        v20[2] = HIBYTE(v48);
        v20[3] = v26;
        v20[4] = HIBYTE(v27);
        v20[5] = v27;
        v20[6] = HIBYTE(v25);
        v20[7] = BYTE2(v25);
        v20[8] = BYTE1(v25);
        v20[9] = v25;
        v20[10] = HIBYTE(v28);
        v20[11] = v28;
        v29 = v20 + 12;
        if (v19 - v29 < v47)
        {
LABEL_64:
          DomainName = -6762;
LABEL_65:
          v36 = 0;
          goto LABEL_66;
        }
        DomainName = _DNSMessageExtractRecordEx(a1, a2, v24, 0, 0, 0, 0, 0, 0, v29, v47, &v49, 0, 0);
        if (DomainName)
          goto LABEL_65;
        v20 = &v49[(_QWORD)v29];
        ++v44;
      }
      else
      {
        size += v47 + 12;
      }
    }
    --v23;
  }
  while (v23);
  if (!v21)
    goto LABEL_45;
LABEL_52:
  if (size >= 0xC)
  {
    *((_WORD *)v21 + 3) = bswap32(v44) >> 16;
LABEL_54:
    a4 = v38;
    DomainName = 0;
    if (a3)
      *a3 = v20 - v21;
    v36 = v21;
    goto LABEL_57;
  }
LABEL_67:
  v36 = 0;
  DomainName = -6762;
LABEL_66:
  a4 = v38;
LABEL_58:
  if (a4)
    *(_DWORD *)a4 = DomainName;
  if (v21)
    free(v21);
  return v36;
}

uint64_t DomainNameEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  uint64_t v4;
  int v5;

  if (a1 == a2)
    return 1;
  v2 = a2;
  v3 = a1;
  while (1)
  {
    v4 = *v3;
    if (v3 != v2)
    {
      v5 = *v2;
      if ((_DWORD)v4 != v5 || mdns_memcmp_us_ascii_case_insensitive(v3 + 1, v2 + 1, *v3, v5))
        break;
    }
    v3 += v4 + 1;
    v2 += v4 + 1;
    if (!(_DWORD)v4)
      return 1;
  }
  return 0;
}

uint64_t DomainNameAppendDomainName(_BYTE *a1, _BYTE *a2, _QWORD *a3)
{
  int v5;
  _BYTE *v6;
  _BYTE *v7;
  int v8;
  unint64_t v9;
  int v10;
  _BYTE *v11;
  _BYTE *v12;
  int v13;
  uint64_t result;
  size_t v15;
  size_t v16;

  v5 = *a1;
  v6 = a1;
  if (*a1)
  {
    v6 = a1;
    do
    {
      v7 = &v6[v5];
      v8 = v7[1];
      v6 = v7 + 1;
      v5 = v8;
    }
    while (v8);
  }
  v9 = v6 - a1;
  v10 = *a2;
  v11 = a2;
  if (*a2)
  {
    v11 = a2;
    do
    {
      v12 = &v11[v10];
      v13 = v12[1];
      v11 = v12 + 1;
      v10 = v13;
    }
    while (v13);
  }
  result = 4294960553;
  if (v9 <= 0x100)
  {
    v15 = v11 - a2 + 1;
    if (v15 <= 0x100)
    {
      v16 = v15 + v9;
      if (v15 + v9 <= 0x100)
      {
        memcpy(&a1[v9], a2, v15);
        result = 0;
        if (a3)
          *a3 = &a1[v16];
      }
    }
  }
  return result;
}

uint64_t DomainNameAppendString(_BYTE *a1, char *a2, _QWORD *a3)
{
  _BYTE *v3;
  uint64_t result;
  int v5;
  unint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _BYTE *v9;
  unsigned __int8 *v10;
  int v11;
  int v12;
  int v13;
  char *v14;

  v3 = a1;
  while (*v3)
  {
    v3 += *v3 + 1;
    if (v3 >= a1 + 256)
      return 4294960554;
  }
  v5 = *a2;
  if (*a2)
  {
    if (v5 != 46)
      goto LABEL_9;
    if (a2[1])
    {
      v5 = 46;
LABEL_9:
      v6 = (unint64_t)(a1 + 255);
      do
      {
        if ((unint64_t)(v3 + 64) >= v6)
          v7 = (_BYTE *)v6;
        else
          v7 = v3 + 64;
        v8 = v3 + 1;
        v9 = v3 + 1;
        v10 = (unsigned __int8 *)a2;
        do
        {
          a2 = (char *)(v10 + 1);
          if (v5 == 92)
          {
            v5 = *a2;
            if (!*a2)
              return 4294960546;
            a2 = (char *)(v10 + 2);
            if (v5 - 48 <= 9)
            {
              v11 = *a2;
              if ((v11 - 48) <= 9)
              {
                v12 = v10[3];
                if ((v12 - 48) <= 9)
                {
                  v13 = 100 * v5 + 10 * (char)v11 + (char)v12;
                  v14 = (char *)(v10 + 4);
                  if (v13 < 5584)
                  {
                    a2 = v14;
                    LOBYTE(v5) = v13 + 48;
                  }
                }
              }
            }
          }
          else if (v5 == 46)
          {
            break;
          }
          if (v9 >= v7)
            return 4294960545;
          *v9++ = v5;
          v5 = *a2;
          v10 = (unsigned __int8 *)a2;
        }
        while (*a2);
        if (v9 == v8)
          return 4294960554;
        *v3 = (_BYTE)v9 - (_BYTE)v8;
        *v9 = 0;
        v5 = *a2;
        v3 = v9;
      }
      while (*a2);
      goto LABEL_29;
    }
  }
  v9 = v3;
LABEL_29:
  result = 0;
  if (a3)
    *a3 = v9 + 1;
  return result;
}

_BYTE *DomainNameDupEx(_BYTE *result, int a2, unsigned __int8 **a3, size_t *a4)
{
  const void *v7;
  int v8;
  _BYTE *v9;
  _BYTE *v10;
  int v11;
  size_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  uint64_t v18;
  int v19;

  v7 = result;
  v8 = *result;
  v9 = result;
  if (*result)
  {
    v9 = result;
    do
    {
      v10 = &v9[v8];
      v11 = v10[1];
      v9 = v10 + 1;
      v8 = v11;
    }
    while (v11);
  }
  v12 = v9 - result + 1;
  if (v9 - result == -1 || (result = malloc_type_malloc(v9 - result + 1, 0xA172743EuLL)) == 0)
  {
    __break(1u);
  }
  else
  {
    v13 = result;
    memcpy(result, v7, v12);
    if (a2)
    {
      v14 = *v13;
      if (*v13)
      {
        v15 = v13;
        do
        {
          v16 = v15 + 1;
          v17 = v16;
          v18 = v14;
          do
          {
            v19 = *v17;
            if ((v19 - 65) < 0x1A)
              LOBYTE(v19) = v19 + 32;
            *v17++ = v19;
            --v18;
          }
          while (v18);
          v15 = &v16[v14];
          v14 = *v15;
        }
        while (*v15);
      }
    }
    *a3 = v13;
    if (a4)
      *a4 = v12;
    return 0;
  }
  return result;
}

BOOL DomainLabelEqual(unsigned __int8 *a1, unsigned __int8 *a2)
{
  uint64_t v2;
  int v3;

  if (a1 == a2)
    return 1;
  v2 = *a1;
  v3 = *a2;
  return (_DWORD)v2 == v3 && mdns_memcmp_us_ascii_case_insensitive(a1 + 1, a2 + 1, v2, v3) == 0;
}

uint64_t DomainNameFromString(_BYTE *a1, char *a2, _QWORD *a3)
{
  *a1 = 0;
  return DomainNameAppendString(a1, a2, a3);
}

uint64_t DomainNameLabelCount(uint64_t result)
{
  unsigned int v1;
  uint64_t v2;
  _BYTE *v3;

  v1 = *(unsigned __int8 *)result;
  if (!*(_BYTE *)result)
    return 0;
  v2 = result;
  LODWORD(result) = 0;
  v3 = (_BYTE *)v2;
  while (v1 <= 0x3F)
  {
    v3 += v1 + 1;
    if ((uint64_t)&v3[-v2] > 255)
      break;
    result = (result + 1);
    v1 = *v3;
    if (!*v3)
      return result;
  }
  return 0xFFFFFFFFLL;
}

const char *DNSRecordTypeValueToString(int a1)
{
  int v1;
  const char *result;

  if (a1 > 248)
  {
    if (a1 >= 0x8000)
    {
      switch(a1)
      {
        case 0x8000:
          return "TA";
        case 0x8001:
          return "DLV";
        case 0xFFFF:
          return "Reserved";
        default:
          return 0;
      }
    }
    else
    {
      switch(a1)
      {
        case 249:
          result = "TKEY";
          break;
        case 250:
          result = "TSIG";
          break;
        case 251:
          result = "IXFR";
          break;
        case 252:
          result = "AXFR";
          break;
        case 253:
          result = "MAILB";
          break;
        case 254:
          result = "MAILA";
          break;
        case 255:
          result = "ANY";
          break;
        case 256:
          result = "URI";
          break;
        case 257:
          result = "CAA";
          break;
        case 258:
          result = "AVC";
          break;
        case 259:
          result = "DOA";
          break;
        case 260:
          result = "AMTRELAY";
          break;
        default:
          return 0;
      }
    }
  }
  else
  {
    v1 = a1 - 1;
    result = "A";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        result = "NS";
        break;
      case 2:
        result = "MD";
        break;
      case 3:
        result = "MF";
        break;
      case 4:
        result = "CNAME";
        break;
      case 5:
        result = "SOA";
        break;
      case 6:
        result = "MB";
        break;
      case 7:
        result = "MG";
        break;
      case 8:
        result = "MR";
        break;
      case 9:
        result = "NULL";
        break;
      case 10:
        result = "WKS";
        break;
      case 11:
        result = "PTR";
        break;
      case 12:
        result = "HINFO";
        break;
      case 13:
        result = "MINFO";
        break;
      case 14:
        result = "MX";
        break;
      case 15:
        result = "TXT";
        break;
      case 16:
        result = "RP";
        break;
      case 17:
        result = "AFSDB";
        break;
      case 18:
        result = "X25";
        break;
      case 19:
        result = "ISDN";
        break;
      case 20:
        result = "RT";
        break;
      case 21:
        result = "NSAP";
        break;
      case 22:
        result = "NSAP-PTR";
        break;
      case 23:
        result = "SIG";
        break;
      case 24:
        result = "KEY";
        break;
      case 25:
        result = "PX";
        break;
      case 26:
        result = "GPOS";
        break;
      case 27:
        result = "AAAA";
        break;
      case 28:
        result = "LOC";
        break;
      case 29:
        result = "NXT";
        break;
      case 30:
        result = "EID";
        break;
      case 31:
        result = "NIMLOC";
        break;
      case 32:
        result = "SRV";
        break;
      case 33:
        result = "ATMA";
        break;
      case 34:
        result = "NAPTR";
        break;
      case 35:
        result = "KX";
        break;
      case 36:
        result = "CERT";
        break;
      case 37:
        result = "A6";
        break;
      case 38:
        result = "DNAME";
        break;
      case 39:
        result = "SINK";
        break;
      case 40:
        result = "OPT";
        break;
      case 41:
        result = "APL";
        break;
      case 42:
        result = "DS";
        break;
      case 43:
        result = "SSHFP";
        break;
      case 44:
        result = "IPSECKEY";
        break;
      case 45:
        result = "RRSIG";
        break;
      case 46:
        result = "NSEC";
        break;
      case 47:
        result = "DNSKEY";
        break;
      case 48:
        result = "DHCID";
        break;
      case 49:
        result = "NSEC3";
        break;
      case 50:
        result = "NSEC3PARAM";
        break;
      case 51:
        result = "TLSA";
        break;
      case 52:
        result = "SMIMEA";
        break;
      case 54:
        result = "HIP";
        break;
      case 55:
        result = "NINFO";
        break;
      case 56:
        result = "RKEY";
        break;
      case 57:
        result = "TALINK";
        break;
      case 58:
        result = "CDS";
        break;
      case 59:
        result = "CDNSKEY";
        break;
      case 60:
        result = "OPENPGPKEY";
        break;
      case 61:
        result = "CSYNC";
        break;
      case 62:
        result = "ZONEMD";
        break;
      case 63:
        result = "SVCB";
        break;
      case 64:
        result = "HTTPS";
        break;
      case 98:
        result = "SPF";
        break;
      case 99:
        result = "UINFO";
        break;
      case 100:
        result = "UID";
        break;
      case 101:
        result = "GID";
        break;
      case 102:
        result = "UNSPEC";
        break;
      case 103:
        result = "NID";
        break;
      case 104:
        result = "L32";
        break;
      case 105:
        result = "L64";
        break;
      case 106:
        result = "LP";
        break;
      case 107:
        result = "EUI48";
        break;
      case 108:
        result = "EUI64";
        break;
      default:
        return 0;
    }
  }
  return result;
}

unsigned __int16 *DNSRecordTypeStringToValue(const void *a1)
{
  unsigned __int16 *result;

  result = (unsigned __int16 *)bsearch(a1, &DNSRecordTypeStringToValue_sTable, 0x5AuLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))_DNSRecordTypeStringToValueCmp);
  if (result)
    return (unsigned __int16 *)result[4];
  return result;
}

uint64_t _DNSRecordTypeStringToValueCmp(const char *a1, const char **a2)
{
  return strcasecmp(a1, *a2);
}

const char *DNSClassTypeToString(int a1)
{
  const char *v1;

  v1 = "ANY";
  if (a1 != 255)
    v1 = 0;
  if (a1 == 1)
    return "IN";
  else
    return v1;
}

const char *DNSRCodeToString(int a1)
{
  const char *result;

  result = "NoError";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "FormErr";
      break;
    case 2:
      result = "ServFail";
      break;
    case 3:
      result = "NXDomain";
      break;
    case 4:
      result = "NotImp";
      break;
    case 5:
      result = "Refused";
      break;
    case 6:
      result = "YXDomain";
      break;
    case 7:
      result = "YXRRSet";
      break;
    case 8:
      result = "NXRRSet";
      break;
    case 9:
      result = "NotAuth";
      break;
    case 10:
      result = "NotZone";
      break;
    case 11:
      result = "DSOTYPENI";
      break;
    case 12:
    case 13:
    case 14:
    case 15:
      goto LABEL_5;
    case 16:
      result = "BADVERS";
      break;
    case 17:
      result = "BADKEY";
      break;
    case 18:
      result = "BADTIME";
      break;
    case 19:
      result = "BADMODE";
      break;
    case 20:
      result = "BADNAME";
      break;
    case 21:
      result = "BADALG";
      break;
    case 22:
      result = "BADTRUNC";
      break;
    case 23:
      result = "BADCOOKIE";
      break;
    default:
      if (a1 == 0xFFFF)
        result = "Reserved";
      else
LABEL_5:
        result = 0;
      break;
  }
  return result;
}

uint64_t DNSRCodeFromString(const void *a1)
{
  unsigned int *v1;

  v1 = (unsigned int *)bsearch(a1, &DNSRCodeFromString_sTable, 0x15uLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))_DNSRCodeFromStringCmp);
  if (v1)
    return v1[2];
  else
    return 0xFFFFFFFFLL;
}

uint64_t _DNSRCodeFromStringCmp(const char *a1, const char **a2)
{
  return strcasecmp(a1, *a2);
}

uint64_t DNSMessageToString(unsigned __int16 *a1, unint64_t a2, unsigned int a3, uint64_t a4)
{
  unint64_t v8;
  const char *v9;
  int v10;
  unsigned int v11;
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  const char *v17;
  const char *v18;
  unsigned __int8 *v19;
  int v20;
  char *v21;
  _BOOL4 v22;
  int v23;
  char *v24;
  const char *v25;
  const char *v26;
  const char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  int v35;
  _BOOL4 v36;
  int v37;
  char *v38;
  const char *v39;
  const char *v40;
  const char *v41;
  const char *v42;
  const char *v43;
  const char *v44;
  int DomainName;
  char *v46;
  unint64_t v47;
  unint64_t v48;
  char *v49;
  const char *v50;
  const char *v51;
  int64_t v52;
  char *v53;
  unsigned int v54;
  unint64_t v55;
  unint64_t v56;
  const char *v57;
  uint64_t v58;
  unsigned __int8 *v59;
  uint64_t v60;
  const char *v61;
  const char *v62;
  const char *v63;
  const char *v64;
  unsigned int v65;
  uint64_t v66;
  unsigned __int8 *v67;
  unint64_t v68;
  const char *v69;
  const char *v70;
  unint64_t v71;
  const char *v72;
  const char *v73;
  unint64_t v74;
  const char *v75;
  const char *v76;
  unint64_t v77;
  const char *v78;
  const char *v79;
  unsigned __int8 *v80;
  unint64_t v81;
  uint64_t v82;
  unint64_t v84;
  const char *v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  const char *v93;
  unsigned int v94;
  int v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  void *v99;
  char *v100;
  _OWORD v101[3];
  uint64_t v102;
  int v103;
  int v104;
  unint64_t v105;
  unsigned __int8 *v106;
  void *v107;
  unsigned __int8 *v108;
  _BYTE v109[256];
  _BYTE v110[256];
  unsigned __int8 v111[1009];
  char v112[512];
  unint64_t v113[32];
  void *__src[129];

  __src[127] = *(void **)MEMORY[0x24BDAC8D0];
  v99 = 0;
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global);
  v102 = 0;
  memset(v101, 0, sizeof(v101));
  v100 = 0;
  v98 = 0;
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr)
    goto LABEL_652;
  _GetCUSymAddr_DataBuffer_Init_sAddr(v101, v112, 512, -1);
  if (a2 < 0xC)
  {
LABEL_655:
    v66 = 4294960553;
    goto LABEL_645;
  }
  v8 = *((unsigned __int8 *)a1 + 2);
  v88 = (v8 >> 3) & 0xF;
  v89 = a4;
  v94 = __rev16(a1[2]);
  v92 = __rev16(a1[3]);
  v91 = __rev16(a1[4]);
  v90 = __rev16(a1[5]);
  v9 = (const char *)&unk_24BC3DD1A;
  v96 = a2;
  v97 = (unint64_t)a1;
  if ((a3 & 0x20) != 0)
    goto LABEL_75;
  v10 = *((unsigned __int8 *)a1 + 3) | (*((unsigned __int8 *)a1 + 2) << 8);
  v11 = __rev16(*a1);
  if ((a3 & 4) != 0)
  {
    v14 = (v8 >> 3) & 0xF;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    v15 = 81;
    if ((v10 & 0x8000u) != 0)
      v15 = 82;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "id: 0x%04X (%u), flags: 0x%04X (%c/", v11, v11, v10, v15);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
  }
  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "ID:               0x%04X (%u)\n", v11, v11);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    v13 = 81;
    if ((v10 & 0x8000u) != 0)
      v13 = 82;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "Flags:            0x%04X %c/", v10, v13);
    LODWORD(v14) = v88;
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
  }
  if (v14 > 6 || (_DWORD)v14 == 3)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "OPCODE%d");
  }
  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s");
  }
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_644;
  for (i = 0; i != 14; i += 2)
  {
    if (((uint64_t)(&kDNSHeaderFlagsDescs)[i + 1] & (unsigned __int16)v10) != 0)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_652;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, ", %s", (&kDNSHeaderFlagsDescs)[i]);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_644;
    }
  }
  v17 = DNSRCodeToString(v10 & 0xF);
  if (v17)
  {
    v18 = v17;
    a1 = (unsigned __int16 *)v97;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    v85 = v18;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, ", %s");
  }
  else
  {
    a1 = (unsigned __int16 *)v97;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    v85 = (const char *)(v10 & 0xF);
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, ", RCODE%d");
  }
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
  {
LABEL_644:
    v66 = CUSymAddr_DataBuffer_AppendF_sAddr;
    goto LABEL_645;
  }
  if ((a3 & 4) == 0)
  {
    if ((a3 & 0x40) != 0)
      goto LABEL_636;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\n", v85);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "Question count:   %u\n", v94);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "Answer count:     %u\n", v92);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "Authority count:  %u\n", v91);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "Additional count: %u\n", v90);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    v9 = (const char *)&unk_24BC3DD1A;
LABEL_75:
    if ((a3 & 0x10) == 0)
      goto LABEL_76;
LABEL_636:
    if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
    if (!_GetCUSymAddr_DataBuffer_Append_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Append_sAddr(v101, &unk_24BC3DD1A, 1);
    if (!(_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    {
      if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_226);
      if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
      {
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Detach_sAddr(v101, v89, &v98);
        goto LABEL_644;
      }
LABEL_652:
      v66 = 4294960561;
      goto LABEL_645;
    }
    goto LABEL_644;
  }
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_652;
  CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, ")", v85);
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_644;
  if ((a3 & 0x40) != 0)
    goto LABEL_636;
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_652;
  CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, ", counts: %u/%u/%u/%u", v94, v92, v91, v90);
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_644;
  v9 = ", ";
  if ((a3 & 0x10) != 0)
    goto LABEL_636;
LABEL_76:
  v95 = (a3 >> 3) & 1;
  v100 = (char *)(a1 + 6);
  if (v94)
  {
    v19 = 0;
    v20 = 0;
    v21 = v110;
    while (1)
    {
      LOWORD(__src[0]) = 0;
      LOWORD(v113[0]) = 0;
      CUSymAddr_DataBuffer_AppendF_sAddr = DNSMessageExtractQuestion(v97, v96, v100, v21, __src, v113, &v100);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_644;
      v22 = SLOWORD(v113[0]) < 0;
      if ((a3 & 1) != 0)
        LOWORD(v113[0]) &= ~0x8000u;
      v23 = a3 & v22;
      if ((a3 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s", v9);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (v19 && DomainNameEqual((unsigned __int8 *)v21, v19))
        {
          v24 = v21;
          v21 = (char *)v19;
        }
        else
        {
          CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v21, 0, v111, 0);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if (v95 && _NameIsPrivate((const char *)v111))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~s ");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s ");
          }
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if (v21 == v110)
            v24 = v109;
          else
            v24 = v110;
          *v24 = 0;
        }
        v28 = "ANY";
        if (LOWORD(v113[0]) != 255)
          v28 = 0;
        if (LOWORD(v113[0]) == 1)
          v29 = "IN";
        else
          v29 = v28;
        if (v29)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "CLASS%u");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if ((a3 & 1) != 0)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v30 = "QM";
          if (v23)
            v30 = "QU";
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s", v30);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
        }
        v31 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v31)
        {
          v32 = v31;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v84 = (unint64_t)v32;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s?");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v84 = LOWORD(__src[0]);
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u?");
        }
        v9 = ", ";
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
      }
      else
      {
        if (!v20)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\nQUESTION SECTION\n");
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
        }
        CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v21, 0, v111, 0);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (v95 && _NameIsPrivate((const char *)v111))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~-30s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%-30s");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        v25 = "QM";
        if (v23)
          v25 = "QU";
        if ((a3 & 1) == 0)
          v25 = (const char *)&unk_24BC3DD1A;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %2s", v25);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        v26 = "ANY";
        if (LOWORD(v113[0]) != 255)
          v26 = 0;
        if (LOWORD(v113[0]) == 1)
          v27 = "IN";
        else
          v27 = v26;
        if (v27)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CLASS%u");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        v33 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v33)
        {
          v34 = v33;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v84 = (unint64_t)v34;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %-5s\n");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v84 = LOWORD(__src[0]);
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u\n");
        }
        v24 = v21;
        v21 = (char *)v19;
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
      }
      v19 = (unsigned __int8 *)v21;
      ++v20;
      v21 = v24;
      if (v94 == v20)
        goto LABEL_202;
    }
  }
  v19 = 0;
  v24 = v110;
LABEL_202:
  if (v91 + v92 + v90)
  {
    v35 = 0;
    while (1)
    {
      __src[0] = 0;
      v113[0] = 0;
      LODWORD(v108) = 0;
      LOWORD(v107) = 0;
      LOWORD(v106) = 0;
      CUSymAddr_DataBuffer_AppendF_sAddr = _DNSMessageExtractRecordEx(v97, v96, v100, v24, &v107, &v106, &v108, (unsigned __int16 **)__src, v113, 0, 0, 0, 0, &v100);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_644;
      CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v24, 0, v111, 0);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_644;
      v36 = (__int16)v106 < 0;
      if ((a3 & 1) != 0)
        LOWORD(v106) = (unsigned __int16)v106 & 0x7FFF;
      v37 = a3 & v36;
      if ((a3 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s", v9);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (v19 && DomainNameEqual((unsigned __int8 *)v24, v19))
        {
          v38 = v24;
          v24 = (char *)v19;
        }
        else
        {
          CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v24, 0, v111, 0);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if (v95 && _NameIsPrivate((const char *)v111))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~s ");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s ");
          }
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if (v24 == v110)
            v38 = v109;
          else
            v38 = v110;
          *v38 = 0;
        }
        if ((unsigned __int16)v107 == 41)
        {
          if (v37)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "CF ");
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_644;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "OPT %u", (unsigned __int16)v106);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if ((_DWORD)v108)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " 0x%08X");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " 0");
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%u", (_DWORD)v108);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if (v37)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CF");
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_644;
          }
          v39 = "ANY";
          if ((unsigned __int16)v106 != 255)
            v39 = 0;
          if ((unsigned __int16)v106 == 1)
            v40 = "IN";
          else
            v40 = v39;
          if (v40)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CLASS%u");
          }
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_644;
          if (DNSRecordTypeValueToString((unsigned __int16)v107))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u");
          }
        }
        v9 = ", ";
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        goto LABEL_373;
      }
      if (v92 && !v35)
        break;
      if (v91 && v92 == v35)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\nAUTHORITY SECTION\n");
        goto LABEL_284;
      }
      if (v90 && v91 + v92 == v35)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\nADDITIONAL SECTION\n");
        goto LABEL_284;
      }
LABEL_285:
      if ((unsigned __int16)v107 == 41)
      {
        if (v95 && _NameIsPrivate((const char *)v111))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        v41 = (const char *)&unk_24BC3DD1A;
        if (v37)
          v41 = " CF";
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s OPT %u", v41, (unsigned __int16)v106);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if ((_DWORD)v108)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " 0x%08X");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " 0");
        }
      }
      else
      {
        if (v95)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~-42s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%-42s");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        v42 = (const char *)&unk_24BC3DD1A;
        if (v37)
          v42 = "CF";
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %6u %2s", (_DWORD)v108, v42);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        v43 = "ANY";
        if ((unsigned __int16)v106 != 255)
          v43 = 0;
        if ((unsigned __int16)v106 == 1)
          v44 = "IN";
        else
          v44 = v43;
        if (v44)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CLASS%u");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (DNSRecordTypeValueToString((unsigned __int16)v107))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %-5s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u");
        }
      }
      v38 = v24;
      v24 = (char *)v19;
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_644;
LABEL_373:
      if ((a3 & 2) == 0)
        DNSRecordDataToStringEx((unsigned __int8 *)__src[0], v113[0], (unsigned __int16)v107, v97, v96, v95, (uint64_t)&v99);
      if (v99)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s", (const char *)v99);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        if (v99)
        {
          free(v99);
          v99 = 0;
        }
      }
      else
      {
        if (v95)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v84 = v113[0];
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " [%zu B]");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_652;
          v86 = v113[0];
          v87 = v113[0];
          v84 = (unint64_t)__src[0];
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %#H");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
      }
      if ((a3 & 4) != 0)
      {
        if ((unsigned __int16)v107 == 5)
        {
          DomainName = DNSMessageExtractDomainName(v97, v96, (char *)__src[0], v38, 0);
          v46 = v110;
          if (v38 == v110)
            v46 = v109;
          if (!DomainName)
          {
            v24 = v38;
            v38 = v46;
          }
          *v38 = 0;
        }
      }
      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\n");
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
      }
      ++v35;
      v19 = (unsigned __int8 *)v24;
      v24 = v38;
      if (v92 + v90 + v91 == v35)
        goto LABEL_405;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\nANSWER SECTION\n");
LABEL_284:
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    goto LABEL_285;
  }
LABEL_405:
  v47 = v97;
  if ((_DWORD)v88 != 6)
    goto LABEL_636;
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_652;
  CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "[");
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_644;
  v48 = v97 + v96;
  v49 = v100;
  if ((unint64_t)v100 >= v97 + v96)
  {
LABEL_629:
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    if (((a3 >> 2) & 1) != 0)
      v82 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "]", v84, v86, v87);
    else
      v82 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "\n]", v84, v86, v87);
    v66 = v82;
    if ((_DWORD)v82)
      goto LABEL_645;
    goto LABEL_636;
  }
  if (((a3 >> 2) & 1) != 0)
    v50 = (const char *)&unk_24BC3DD1A;
  else
    v50 = "\n\t";
  if (((a3 >> 2) & 1) != 0)
    v51 = ", ";
  else
    v51 = ",\n\t";
  v93 = v51;
  while ((unint64_t)v49 >= v47)
  {
    if (v48 - (unint64_t)v49 < 4
      || (v52 = __rev16(*((unsigned __int16 *)v49 + 1)), v53 = v49 + 4, (uint64_t)(v48 - (_QWORD)(v49 + 4)) < v52))
    {
LABEL_653:
      v66 = 4294960546;
      goto LABEL_645;
    }
    v54 = *(unsigned __int16 *)v49;
    v55 = (unint64_t)&v53[v52];
    v100 = &v53[v52];
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_652;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s", v50);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_644;
    v56 = __rev16(v54);
    v57 = "Reserved";
    switch((int)v56)
    {
      case 0:
        goto LABEL_439;
      case 1:
        v57 = "KeepAlive";
        goto LABEL_439;
      case 2:
        v57 = "Retry Delay";
        goto LABEL_439;
      case 3:
        v57 = "Encryption Padding";
LABEL_439:
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_652;
        v84 = (unint64_t)v57;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s: ");
LABEL_443:
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_644;
        break;
      default:
        switch((int)v56)
        {
          case '@':
            v57 = "SUBSCRIBE";
            goto LABEL_439;
          case 'A':
            v57 = "PUSH";
            goto LABEL_439;
          case 'B':
            v57 = "UNSUBSCRIBE";
            goto LABEL_439;
          case 'C':
            v57 = "RECONFIRM";
            goto LABEL_439;
          default:
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_652;
            v84 = v56;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "DSO-TYPE%u: ");
            break;
        }
        goto LABEL_443;
    }
    v107 = 0;
    v108 = (unsigned __int8 *)(v49 + 4);
    switch((int)v56)
    {
      case '@':
        v47 = v97;
        v58 = DNSMessageExtractDomainNameString(v97, v96, v49 + 4, (unsigned __int8 *)__src, &v108);
        if ((_DWORD)v58)
          goto LABEL_527;
        v59 = v108;
        if (v55 - (_QWORD)v108 == 4)
        {
          if (v95 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (unint64_t)__src;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (unint64_t)__src;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s");
          }
          if ((_DWORD)v58)
            goto LABEL_527;
          v68 = __rev16(*((unsigned __int16 *)v59 + 1));
          v69 = "ANY";
          if ((_DWORD)v68 != 255)
            v69 = 0;
          if ((_DWORD)v68 == 1)
            v70 = "IN";
          else
            v70 = v69;
          if (v70)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (unint64_t)v70;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = v68;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CLASS%u");
          }
          if ((_DWORD)v58)
            goto LABEL_527;
          v74 = __rev16(*(unsigned __int16 *)v59);
          v75 = DNSRecordTypeValueToString(v74);
          if (v75)
          {
            v76 = v75;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v84 = (unint64_t)v76;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
              goto LABEL_618;
            }
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v84 = v74;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u");
              goto LABEL_618;
            }
          }
          goto LABEL_625;
        }
        v66 = 4294960553;
        goto LABEL_620;
      case 'A':
        if (v55 <= (unint64_t)v53)
          goto LABEL_653;
        v47 = v97;
        while (1)
        {
          v105 = 0;
          v106 = 0;
          v103 = 0;
          v104 = 0;
          v58 = _DNSMessageExtractRecordEx(v97, v96, v53, (char *)v113, (_WORD *)&v103 + 1, &v103, &v104, (unsigned __int16 **)&v106, &v105, 0, 0, 0, 0, &v108);
          if ((_DWORD)v58)
            goto LABEL_527;
          if ((unint64_t)v108 > v55)
            goto LABEL_626;
          v58 = DomainNameToString((unsigned __int8 *)v113, 0, (unsigned __int8 *)__src, 0);
          if ((_DWORD)v58)
            goto LABEL_527;
          if (v95 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (unint64_t)__src;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (unint64_t)__src;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s");
          }
          if ((_DWORD)v58)
            goto LABEL_527;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_625;
          v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " 0x%08X", v104);
          if ((_DWORD)v58)
            goto LABEL_527;
          v61 = "ANY";
          if ((unsigned __int16)v103 != 255)
            v61 = 0;
          if ((unsigned __int16)v103 == 1)
            v62 = "IN";
          else
            v62 = v61;
          if (v62)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (unint64_t)v62;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (unsigned __int16)v103;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CLASS%u");
          }
          if ((_DWORD)v58)
            goto LABEL_527;
          v63 = DNSRecordTypeValueToString(HIWORD(v103));
          if (v63)
          {
            v64 = v63;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (unint64_t)v64;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = HIWORD(v103);
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u");
          }
          if ((_DWORD)v58)
            goto LABEL_527;
          DNSRecordDataToStringEx(v106, v105, HIWORD(v103), v97, v96, v95, (uint64_t)&v107);
          if (v107)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s", (const char *)v107);
            if ((_DWORD)v58)
              goto LABEL_527;
            if (v107)
            {
              free(v107);
              v107 = 0;
            }
          }
          else
          {
            if (v95)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_625;
              v84 = v105;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " [%zu B]");
            }
            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_625;
              v86 = v105;
              v87 = v105;
              v84 = (unint64_t)v106;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %#H");
            }
            if ((_DWORD)v58)
              goto LABEL_527;
          }
          v53 = (char *)v108;
          if ((unint64_t)v108 >= v55)
            goto LABEL_619;
        }
      case 'B':
        if ((_DWORD)v52 != 2)
          goto LABEL_655;
        v65 = *((unsigned __int16 *)v49 + 2);
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        v47 = v97;
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_625;
        v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%u", __rev16(v65));
        goto LABEL_527;
      case 'C':
        v47 = v97;
        v58 = DNSMessageExtractDomainNameString(v97, v96, v49 + 4, (unsigned __int8 *)__src, &v108);
        if ((_DWORD)v58)
          goto LABEL_527;
        v67 = v108;
        if (v55 - (unint64_t)v108 >= 4)
        {
          v108 += 4;
          if (v95 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v84 = (unint64_t)__src;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%~s");
              goto LABEL_555;
            }
LABEL_625:
            v66 = 4294960561;
            goto LABEL_620;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_625;
          v84 = (unint64_t)__src;
          v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "%s");
LABEL_555:
          if ((_DWORD)v58)
            goto LABEL_527;
          v71 = __rev16(*((unsigned __int16 *)v67 + 1));
          v72 = "ANY";
          if ((_DWORD)v71 != 255)
            v72 = 0;
          if ((_DWORD)v71 == 1)
            v73 = "IN";
          else
            v73 = v72;
          if (v73)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = (unint64_t)v73;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = v71;
            v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " CLASS%u");
          }
          if ((_DWORD)v58)
            goto LABEL_527;
          v77 = __rev16(*(unsigned __int16 *)v67);
          v78 = DNSRecordTypeValueToString(v77);
          if (v78)
          {
            v79 = v78;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
LABEL_627:
              v66 = 4294960561;
              goto LABEL_571;
            }
            v84 = (unint64_t)v79;
            v60 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_625;
            v84 = v77;
            v60 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " TYPE%u");
          }
          if ((_DWORD)v60)
          {
LABEL_570:
            v66 = v60;
LABEL_571:
            v47 = v97;
            goto LABEL_620;
          }
          v80 = v108;
          v81 = v55 - (_QWORD)v108;
          DNSRecordDataToStringEx(v108, v55 - (_QWORD)v108, v77, v97, v96, v95, (uint64_t)&v107);
          if (v107)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            v47 = v97;
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " %s", (const char *)v107);
              if ((_DWORD)v58)
                goto LABEL_527;
              if (v107)
              {
                free(v107);
                v107 = 0;
              }
LABEL_619:
              v66 = 0;
              goto LABEL_620;
            }
          }
          else
          {
            if (!v95)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_627;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " '%H'", v80, v81, v81);
              v47 = v97;
              if ((_DWORD)v58)
                goto LABEL_527;
              goto LABEL_619;
            }
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            v47 = v97;
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v84 = v81;
              v58 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, " [%zu B]");
LABEL_618:
              if ((_DWORD)v58)
              {
LABEL_527:
                v66 = v58;
                goto LABEL_620;
              }
              goto LABEL_619;
            }
          }
          goto LABEL_625;
        }
LABEL_626:
        v66 = 4294960546;
LABEL_620:
        if (v107)
          free(v107);
        if ((_DWORD)v66)
          goto LABEL_645;
        v49 = v100;
        v50 = v93;
        v48 = v97 + v96;
        if ((unint64_t)v100 >= v97 + v96)
          goto LABEL_629;
        break;
      default:
        if (v95)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            v84 = v52;
            v60 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "[%u B]");
            goto LABEL_570;
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            v86 = v52;
            v87 = v52;
            v84 = (unint64_t)(v49 + 4);
            v60 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v101, "'%H'");
            goto LABEL_570;
          }
        }
        goto LABEL_627;
    }
  }
  v66 = 4294960586;
LABEL_645:
  if (v99)
    free(v99);
  if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_229);
  if (_GetCUSymAddr_DataBuffer_Free_sAddr)
    _GetCUSymAddr_DataBuffer_Free_sAddr(v101);
  return v66;
}

uint64_t _NameIsPrivate(const char *a1)
{
  uint64_t result;

  result = strcasecmp(a1, ".");
  if ((_DWORD)result)
    return strcasecmp(a1, "ipv4only.arpa.") != 0;
  return result;
}

uint64_t DNSRecordDataToStringEx(unsigned __int8 *a1, unint64_t a2, int a3, unint64_t a4, uint64_t a5, int a6, uint64_t a7)
{
  unint64_t v14;
  uint64_t appended;
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr;
  char *v17;
  unint64_t v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  unint64_t v21;
  unsigned __int8 *v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unsigned __int8 v32;
  char v33;
  uint64_t v34;
  unsigned int v35;
  char *v36;
  unsigned int v37;
  const char *v38;
  const char *v39;
  unsigned int v40;
  const char *v41;
  const char *v42;
  const char *v43;
  char *v44;
  unint64_t v45;
  const char *v46;
  char v47;
  const char *v48;
  const char *v49;
  char *v50;
  const char *v51;
  char v52;
  unint64_t v53;
  char *i;
  const char *v55;
  unsigned int v56;
  char *v57;
  const char *v58;
  char *v59;
  const char *v60;
  char *v61;
  const char *v62;
  unsigned int *v64;
  const char *v65;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _OWORD v73[3];
  uint64_t v74;
  unsigned __int8 *v75;
  char *v76;
  _BYTE v77[256];
  void *v78[129];

  v78[127] = *(void **)MEMORY[0x24BDAC8D0];
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global);
  v74 = 0;
  v75 = 0;
  memset(v73, 0, sizeof(v73));
  v72 = 0;
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr)
    goto LABEL_351;
  v14 = (unint64_t)&a1[a2];
  _GetCUSymAddr_DataBuffer_Init_sAddr(v73, v77, 256, -1);
  if (a3 <= 27)
  {
    switch(a3)
    {
      case 1:
        if (a2 != 4)
          goto LABEL_352;
        appended = _AppendIPv4Address((uint64_t)v73, 0, (unsigned int *)a1, a6);
        if ((_DWORD)appended)
          goto LABEL_343;
        goto LABEL_335;
      case 2:
      case 5:
      case 12:
        if (a4)
        {
          appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, (unsigned __int8 *)v78, 0);
          if (!(_DWORD)appended)
            goto LABEL_333;
        }
        else
        {
          appended = DomainNameToString(a1, (unint64_t)&a1[a2], (unsigned __int8 *)v78, 0);
          if (!(_DWORD)appended)
            goto LABEL_333;
        }
        goto LABEL_343;
      case 6:
        if (a4)
        {
          appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, (unsigned __int8 *)v78, &v75);
          if ((_DWORD)appended)
            goto LABEL_343;
          if ((unint64_t)v75 >= v14)
            goto LABEL_352;
          appended = _AppendDomainNameStringEx((uint64_t)v73, 0, a6, (const char *)v78);
          if ((_DWORD)appended)
            goto LABEL_343;
          appended = DNSMessageExtractDomainNameString(a4, a5, (char *)v75, (unsigned __int8 *)v78, &v75);
          if ((_DWORD)appended)
            goto LABEL_343;
        }
        else
        {
          appended = DomainNameToString(a1, (unint64_t)&a1[a2], (unsigned __int8 *)v78, &v75);
          if ((_DWORD)appended)
            goto LABEL_343;
          appended = _AppendDomainNameStringEx((uint64_t)v73, 0, a6, (const char *)v78);
          if ((_DWORD)appended)
            goto LABEL_343;
          appended = DomainNameToString(v75, (unint64_t)&a1[a2], (unsigned __int8 *)v78, &v75);
          if ((_DWORD)appended)
            goto LABEL_343;
        }
        appended = _AppendDomainNameStringEx((uint64_t)v73, (uint64_t)" ", a6, (const char *)v78);
        if ((_DWORD)appended)
          goto LABEL_343;
        v64 = (unsigned int *)v75;
        if (v14 - (_QWORD)v75 != 20)
          goto LABEL_352;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_351;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u %u %u %u %u", bswap32(*v64), bswap32(v64[1]), bswap32(v64[2]), bswap32(v64[3]), bswap32(v64[4]));
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_344;
        goto LABEL_335;
      case 13:
      case 16:
        if (!a2)
          goto LABEL_352;
        if (a6)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_351;
          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "[%zu B]");
        }
        else if (a2 == 1)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_351;
          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%#H");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_351;
          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%#{txt}");
        }
        if (!(_DWORD)appended)
          goto LABEL_335;
        goto LABEL_343;
      case 15:
        if ((uint64_t)a2 < 3)
          goto LABEL_352;
        v37 = *(unsigned __int16 *)a1;
        v36 = (char *)(a1 + 2);
        v35 = v37;
        if (a4)
        {
          appended = DNSMessageExtractDomainNameString(a4, a5, v36, (unsigned __int8 *)v78, 0);
          if ((_DWORD)appended)
            goto LABEL_343;
        }
        else
        {
          appended = DomainNameToString((unsigned __int8 *)v36, v14, (unsigned __int8 *)v78, 0);
          if ((_DWORD)appended)
            goto LABEL_343;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_351;
        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u", __rev16(v35));
        if ((_DWORD)appended)
          goto LABEL_343;
        v65 = " ";
        break;
      default:
        goto LABEL_120;
    }
LABEL_334:
    appended = _AppendDomainNameStringEx((uint64_t)v73, (uint64_t)v65, a6, (const char *)v78);
    if ((_DWORD)appended)
      goto LABEL_343;
LABEL_335:
    if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
    if (_GetCUSymAddr_DataBuffer_Append_sAddr)
    {
      appended = _GetCUSymAddr_DataBuffer_Append_sAddr(v73, &unk_24BC3DD1A, 1);
      if (!(_DWORD)appended)
      {
        if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_226);
        if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
        {
          appended = _GetCUSymAddr_DataBuffer_Detach_sAddr(v73, a7, &v72);
          goto LABEL_343;
        }
        goto LABEL_351;
      }
LABEL_343:
      CUSymAddr_DataBuffer_AppendF_sAddr = appended;
      goto LABEL_344;
    }
LABEL_351:
    CUSymAddr_DataBuffer_AppendF_sAddr = 4294960561;
    goto LABEL_344;
  }
  switch(a3)
  {
    case '+':
      if (a2 < 4)
        goto LABEL_352;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u %u %u", __rev16(*(unsigned __int16 *)a1), a1[2], a1[3]);
      if ((_DWORD)appended)
        goto LABEL_343;
      if (a2 == 4)
        goto LABEL_335;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %.4H", a1 + 4, a2 - 4, a2 - 4);
      if ((_DWORD)appended)
        goto LABEL_343;
      goto LABEL_335;
    case ',':
    case '-':
    case '1':
      goto LABEL_120;
    case '.':
      v70 = 0;
      v71 = 0;
      v69 = 0;
      if (a2 < 0x13)
        goto LABEL_352;
      if (DNSRecordTypeValueToString(__rev16(*(unsigned __int16 *)a1)))
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_351;
        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%s");
      }
      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_351;
        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "TYPE%u");
      }
      if ((_DWORD)appended)
        goto LABEL_343;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u %u %u", a1[2], a1[3], bswap32(*((_DWORD *)a1 + 1)));
      if ((_DWORD)appended)
        goto LABEL_343;
      v70 = 0;
      v71 = 0;
      v69 = 0;
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_241);
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr)
        goto LABEL_351;
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr(bswap32(*((_DWORD *)a1 + 2)) + 0xE77934880, (char *)&v71 + 4, &v71, (char *)&v70 + 4, &v70, (char *)&v69 + 4, &v69);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u%02u%02u%02u%02u%02u", HIDWORD(v71), v71, HIDWORD(v70), v70, HIDWORD(v69), v69);
      if ((_DWORD)appended)
        goto LABEL_343;
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_241);
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr)
        goto LABEL_351;
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr(bswap32(*((_DWORD *)a1 + 3)) + 0xE77934880, (char *)&v71 + 4, &v71, (char *)&v70 + 4, &v70, (char *)&v69 + 4, &v69);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u%02u%02u%02u%02u%02u", HIDWORD(v71), v71, HIDWORD(v70), v70, HIDWORD(v69), v69);
      if ((_DWORD)appended)
        goto LABEL_343;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u", __rev16(*((unsigned __int16 *)a1 + 8)));
      if ((_DWORD)appended)
        goto LABEL_343;
      v75 = a1 + 18;
      appended = DomainNameToString(a1 + 18, v14, (unsigned __int8 *)v78, &v75);
      if ((_DWORD)appended)
        goto LABEL_343;
      appended = _AppendDomainNameStringEx((uint64_t)v73, (uint64_t)" ", a6, (const char *)v78);
      if ((_DWORD)appended)
        goto LABEL_343;
      v76 = 0;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_238);
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v75, v14 - (_QWORD)v75, 0, &v76, 0);
      if ((_DWORD)appended)
        goto LABEL_343;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %s", v76);
      else
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960561;
      v17 = v76;
      if (v76)
LABEL_58:
        free(v17);
LABEL_59:
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_344;
      goto LABEL_335;
    case '/':
      if (a4)
      {
        appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, (unsigned __int8 *)v78, &v75);
        if ((_DWORD)appended)
          goto LABEL_343;
      }
      else
      {
        appended = DomainNameToString(a1, (unint64_t)&a1[a2], (unsigned __int8 *)v78, &v75);
        if ((_DWORD)appended)
          goto LABEL_343;
      }
      if ((unint64_t)v75 >= v14)
        goto LABEL_352;
      appended = _AppendDomainNameStringEx((uint64_t)v73, 0, a6, (const char *)v78);
      if ((_DWORD)appended)
        goto LABEL_343;
      appended = _DNSRecordDataAppendTypeBitMap((uint64_t)v73, v75, (uint64_t)&a1[a2]);
      if ((_DWORD)appended)
        goto LABEL_343;
      goto LABEL_335;
    case '0':
      if (a2 < 5)
        goto LABEL_352;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u %u %u", __rev16(*(unsigned __int16 *)a1), a1[2], a1[3]);
      if ((_DWORD)appended)
        goto LABEL_343;
      v75 = a1 + 4;
      v78[0] = 0;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_238);
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v75, v14 - (_QWORD)v75, 0, v78, 0);
      if ((_DWORD)appended)
        goto LABEL_343;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %s", (const char *)v78[0]);
      else
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960561;
      v17 = (char *)v78[0];
      if (v78[0])
        goto LABEL_58;
      goto LABEL_59;
    case '2':
      if (a2 < 5)
        goto LABEL_352;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u %u %u", *a1, a1[1], __rev16(*((unsigned __int16 *)a1 + 1)));
      if ((_DWORD)appended)
        goto LABEL_343;
      v75 = a1 + 4;
      if ((uint64_t)(a2 - 4) < 1)
        goto LABEL_352;
      v75 = a1 + 5;
      v18 = a1[4];
      if (a2 - 5 < v18)
        goto LABEL_352;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %.4H", v75, v18, v18);
      if ((_DWORD)appended)
        goto LABEL_343;
      v19 = &v75[v18];
      v75 = v19;
      if ((uint64_t)(v14 - (_QWORD)v19) < 1)
        goto LABEL_352;
      v20 = v19 + 1;
      v75 = v19 + 1;
      v21 = *v19;
      if (v14 - (unint64_t)(v19 + 1) < v21)
        goto LABEL_352;
      if (!*v19)
        goto LABEL_80;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_351;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " ");
      if ((_DWORD)appended)
        goto LABEL_343;
      v20 = v75;
LABEL_80:
      v22 = &v20[v21];
      while (2)
      {
        v23 = v22 - v75;
        if (v22 != v75)
        {
          v24 = 0;
          switch(v23)
          {
            case 1uLL:
              v25 = 0;
              v26 = (unint64_t)*v75++ << 32;
              goto LABEL_99;
            case 2uLL:
              v31 = 0;
              v29 = (unint64_t)v75[1] << 24;
              v26 = v29 | ((unint64_t)*v75 << 32);
              v75 += 2;
              goto LABEL_96;
            case 3uLL:
              v32 = v75[2];
              v29 = ((unint64_t)v32 << 16) | ((unint64_t)v75[1] << 24);
              v26 = v29 | ((unint64_t)*v75 << 32);
              v75 += 3;
              BYTE4(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[2 * (v32 & 0xF)];
              v31 = 5;
              goto LABEL_96;
            case 4uLL:
              goto LABEL_85;
            default:
              v24 = v75[4];
LABEL_85:
              v27 = v75[3];
              v28 = v24 | (v27 << 8);
              v29 = ((unint64_t)v75[1] << 24) | ((unint64_t)v75[2] << 16) | v28;
              v26 = v29 | ((unint64_t)*v75 << 32);
              if (v23 >= 5)
                v30 = 5;
              else
                v30 = v22 - v75;
              v75 += v30;
              if (v23 == 1)
              {
                v25 = 0;
              }
              else
              {
                if (v23 == 4)
                {
                  v31 = 7;
                }
                else
                {
                  HIBYTE(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v24 & 0x1F];
                  v31 = 8;
                }
                v33 = DNSRecordDataToStringEx_kBase32ExtendedHex[(v27 >> 2) & 0x1F];
                BYTE6(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v28 >> 5) & 0x1F];
                BYTE5(v78[0]) = v33;
                BYTE4(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v29 >> 15) & 0x1F];
LABEL_96:
                BYTE3(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v29 >> 20) & 0x1F];
                BYTE2(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v29 >> 25) & 0x1F];
                if (v31)
                  v25 = v31;
                else
                  v25 = 4;
              }
LABEL_99:
              BYTE1(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v26 >> 30) & 0x1F];
              LOBYTE(v78[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v26 >> 35];
              if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
              if (!_GetCUSymAddr_DataBuffer_Append_sAddr)
                goto LABEL_351;
              if (v25)
                v34 = v25;
              else
                v34 = 2;
              appended = _GetCUSymAddr_DataBuffer_Append_sAddr(v73, v78, v34);
              if ((_DWORD)appended)
                goto LABEL_343;
              continue;
          }
        }
        break;
      }
      appended = _DNSRecordDataAppendTypeBitMap((uint64_t)v73, v22, v14);
      if ((_DWORD)appended)
        goto LABEL_343;
      goto LABEL_335;
    default:
      if (a3 == 28)
      {
        if (a2 == 16)
        {
          appended = _AppendIPv6Address((uint64_t)v73, 0, (uint64_t)a1, a6);
          if (!(_DWORD)appended)
            goto LABEL_335;
          goto LABEL_343;
        }
        goto LABEL_352;
      }
      if (a3 == 33)
      {
        if (a2 >= 7)
        {
          if (a4)
          {
            appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1 + 6, (unsigned __int8 *)v78, 0);
            if ((_DWORD)appended)
              goto LABEL_343;
          }
          else
          {
            appended = DomainNameToString(a1 + 6, (unint64_t)&a1[a2], (unsigned __int8 *)v78, 0);
            if ((_DWORD)appended)
              goto LABEL_343;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_351;
          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u %u %u ", __rev16(*(unsigned __int16 *)a1), __rev16(*((unsigned __int16 *)a1 + 1)), __rev16(*((unsigned __int16 *)a1 + 2)));
          if ((_DWORD)appended)
            goto LABEL_343;
LABEL_333:
          v65 = 0;
          goto LABEL_334;
        }
LABEL_352:
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960554;
        goto LABEL_344;
      }
LABEL_120:
      if ((a3 & 0xFFFFFFFE) != 0x40)
      {
        if (a3 != 41)
        {
          CUSymAddr_DataBuffer_AppendF_sAddr = 4294960582;
          goto LABEL_344;
        }
        appended = _AppendOPTRDataString((uint64_t)v73, (unsigned __int16 *)a1, (unint64_t)&a1[a2], a6);
        if (!(_DWORD)appended)
          goto LABEL_335;
        goto LABEL_343;
      }
      if (v14 < (unint64_t)a1)
      {
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960586;
      }
      else
      {
        if (a2 < 2)
          goto LABEL_352;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_351;
        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u", __rev16(*(unsigned __int16 *)a1));
        if ((_DWORD)appended)
          goto LABEL_343;
        v76 = (char *)(a1 + 2);
        appended = DomainNameToString(a1 + 2, (unint64_t)&a1[a2], (unsigned __int8 *)v78, &v76);
        if ((_DWORD)appended)
          goto LABEL_343;
        v68 = a7;
        appended = _AppendDomainNameStringEx((uint64_t)v73, (uint64_t)" ", a6, (const char *)v78);
        if ((_DWORD)appended)
          goto LABEL_343;
        v38 = v76;
        if ((unint64_t)v76 >= v14)
        {
LABEL_349:
          a7 = v68;
          goto LABEL_335;
        }
        while (2)
        {
          if (v14 - (unint64_t)v38 >= 4)
          {
            v39 = (const char *)__rev16(*(unsigned __int16 *)v38);
            v40 = *((unsigned __int16 *)v38 + 1);
            v41 = _DNSSVCBKeyToString((int)v39);
            if (v41)
            {
              v42 = v41;
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_351;
              v67 = v42;
              appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %s=\"");
            }
            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_351;
              v67 = v39;
              appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " key%u=\"");
            }
            if ((_DWORD)appended)
              goto LABEL_343;
            v43 = (const char *)__rev16(v40);
            v44 = (char *)(v38 + 4);
            v76 = (char *)(v38 + 4);
            if (v14 - (unint64_t)(v38 + 4) >= v43)
            {
              switch((int)v39)
              {
                case 0:
                  if ((v43 & 1) != 0)
                    goto LABEL_352;
                  v45 = (unint64_t)&v43[(_QWORD)v44];
                  if (v44 >= &v43[(_QWORD)v44])
                    goto LABEL_243;
                  v46 = 0;
                  v47 = 1;
                  do
                  {
                    v48 = (const char *)__rev16(*(unsigned __int16 *)v44);
                    v76 = v44 + 2;
                    v49 = _DNSSVCBKeyToString((int)v48);
                    if ((v47 & 1) == 0)
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                        goto LABEL_351;
                      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%s", v46);
                      if ((_DWORD)appended)
                        goto LABEL_343;
                    }
                    if (v49)
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                        goto LABEL_351;
                      v67 = v49;
                      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%s");
                    }
                    else
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                        goto LABEL_351;
                      v67 = v48;
                      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "key%u");
                    }
                    if ((_DWORD)appended)
                      goto LABEL_343;
                    v47 = 0;
                    v44 = v76;
                    v46 = ",";
                  }
                  while ((unint64_t)v76 < v45);
                  goto LABEL_243;
                case 1:
                  v50 = (char *)&v43[(_QWORD)v44];
                  if (v44 >= v50)
                    goto LABEL_243;
                  v51 = 0;
                  v52 = 1;
                  while (1)
                  {
                    v76 = v44 + 1;
                    v53 = *v44;
                    if (v50 - (v44 + 1) < v53)
                      goto LABEL_352;
                    ++v44;
                    if ((v52 & 1) == 0)
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                        goto LABEL_351;
                      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%s", v51);
                      if ((_DWORD)appended)
                        goto LABEL_343;
                      v44 = v76;
                    }
                    for (i = &v44[v53]; v44 < i; v76 = v44)
                    {
                      v55 = (const char *)*v44;
                      if (((_DWORD)v55 - 32) > 0x5E)
                      {
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                          goto LABEL_351;
                        v67 = v55;
                        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\\%03d");
                      }
                      else if ((_DWORD)v55 == 92 || (_DWORD)v55 == 44)
                      {
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                          goto LABEL_351;
                        v67 = v55;
                        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\\%c");
                      }
                      else
                      {
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                          goto LABEL_351;
                        v67 = v55;
                        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%c");
                      }
                      if ((_DWORD)appended)
                        goto LABEL_343;
                      v44 = v76 + 1;
                    }
                    v52 = 0;
                    v51 = ",";
                    if (v44 >= v50)
                      goto LABEL_243;
                  }
                case 2:
                  goto LABEL_168;
                case 3:
                  if ((_DWORD)v43 != 2)
                    goto LABEL_352;
                  v56 = *((unsigned __int16 *)v38 + 2);
                  v76 = (char *)&v43[(_QWORD)v44];
                  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                    goto LABEL_351;
                  appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u", __rev16(v56));
                  if ((_DWORD)appended)
                    goto LABEL_343;
                  goto LABEL_243;
                case 4:
                  if ((v43 & 3) != 0)
                    goto LABEL_352;
                  v57 = (char *)&v43[(_QWORD)v44];
                  if (v44 >= v57)
                    goto LABEL_243;
                  v58 = (const char *)&unk_24BC3DD1A;
                  while (2)
                  {
                    CUSymAddr_DataBuffer_AppendF_sAddr = _AppendIPv4Address((uint64_t)v73, (uint64_t)v58, (unsigned int *)v44, a6);
                    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
                      goto LABEL_344;
                    v44 = v76 + 4;
                    v76 = v44;
                    if (v44 < v57)
                    {
                      v58 = ",";
                      continue;
                    }
                    goto LABEL_243;
                  }
                case 5:
                  goto LABEL_164;
                case 6:
                  if ((v43 & 0xF) != 0)
                    goto LABEL_352;
                  v59 = (char *)&v43[(_QWORD)v44];
                  if (v44 >= v59)
                    goto LABEL_243;
                  v60 = (const char *)&unk_24BC3DD1A;
                  while (2)
                  {
                    CUSymAddr_DataBuffer_AppendF_sAddr = _AppendIPv6Address((uint64_t)v73, (uint64_t)v60, (uint64_t)v44, a6);
                    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
                      goto LABEL_344;
                    v44 = v76 + 16;
                    v76 = v44;
                    if (v44 < v59)
                    {
                      v60 = ",";
                      continue;
                    }
                    goto LABEL_243;
                  }
                default:
                  if ((_DWORD)v39 == 32769)
                  {
LABEL_164:
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                      goto LABEL_351;
                    v67 = v76;
                    appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%.4H");
                  }
                  else
                  {
LABEL_168:
                    if (!a6)
                    {
                      v61 = (char *)&v43[(_QWORD)v44];
                      while (v44 < v61)
                      {
                        v62 = (const char *)*v44;
                        if (((_DWORD)v62 - 33) > 0x5D)
                        {
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                            goto LABEL_351;
                          v67 = v62;
                          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\\%03d");
                        }
                        else if (((_DWORD)v62 - 34) > 0x3A
                               || ((1 << (v62 - 34)) & 0x4000000020000C1) == 0)
                        {
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                            goto LABEL_351;
                          v67 = v62;
                          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%c");
                        }
                        else
                        {
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                            goto LABEL_351;
                          v67 = v62;
                          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\\%c");
                        }
                        if ((_DWORD)appended)
                          goto LABEL_343;
                        v44 = ++v76;
                      }
                      goto LABEL_243;
                    }
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                      goto LABEL_351;
                    v67 = v43;
                    appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "<%u redacted bytes>");
                  }
                  if ((_DWORD)appended)
                    goto LABEL_343;
                  v76 = (char *)&v43[(_QWORD)v76];
LABEL_243:
                  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                    goto LABEL_351;
                  CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\"", v67);
                  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
                    goto LABEL_344;
                  v38 = v76;
                  if ((unint64_t)v76 >= v14)
                    goto LABEL_349;
                  continue;
              }
            }
          }
          break;
        }
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960546;
      }
LABEL_344:
      if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_229);
      if (_GetCUSymAddr_DataBuffer_Free_sAddr)
        _GetCUSymAddr_DataBuffer_Free_sAddr(v73);
      return CUSymAddr_DataBuffer_AppendF_sAddr;
  }
}

uint64_t _AppendIPv4Address(uint64_t a1, uint64_t a2, unsigned int *a3, int a4)
{
  unsigned int v4;
  BOOL v5;
  int v6;

  if (a4)
  {
    v4 = bswap32(*a3);
    if (v4)
      v5 = v4 == 2130706433;
    else
      v5 = 1;
    v6 = !v5;
  }
  else
  {
    v6 = 0;
  }
  return _AppendIPAddress(a1, a2, (uint64_t)a3, 4, v6);
}

uint64_t _AppendIPv6Address(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  BOOL v4;
  int v5;

  if (a4)
  {
    if (*(_QWORD *)a3 | *(_QWORD *)(a3 + 7))
      v4 = 1;
    else
      v4 = *(unsigned __int8 *)(a3 + 15) > 1u;
    v5 = v4;
  }
  else
  {
    v5 = 0;
  }
  return _AppendIPAddress(a1, a2, a3, 16, v5);
}

uint64_t _AppendDomainNameStringEx(uint64_t a1, uint64_t a2, int a3, const char *a4)
{
  const char *v5;

  if (a3 && _NameIsPrivate(a4))
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    {
      v5 = "%s%~s";
      return _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, v5);
    }
  }
  else
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    {
      v5 = "%s%s";
      return _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, v5);
    }
  }
  return 4294960561;
}

uint64_t _DNSRecordDataAppendTypeBitMap(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  unsigned __int8 *v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  int v10;
  BOOL v11;
  const char *v12;
  uint64_t result;
  uint64_t v14;
  uint64_t v15;
  char __str[32];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3 - (_QWORD)a2;
  if (a3 - (uint64_t)a2 >= 1)
  {
    while (2)
    {
      if ((unint64_t)v3 < 3)
        return 4294960554;
      v5 = a2[1];
      if ((v5 - 33) < 0xFFFFFFE0)
        return 4294960554;
      v6 = a2 + 2;
      if (a3 - (uint64_t)(a2 + 2) < v5)
        return 4294960554;
      v14 = a3 - (_QWORD)(a2 + 2);
      v15 = a2[1];
      v7 = 0;
      v8 = 8 * v5;
      v9 = *a2 << 8;
      if ((8 * v5) <= 1)
        v10 = 1;
      else
        v10 = 8 * v5;
      v11 = 1;
      while (1)
      {
        if (((v6[(unint64_t)v7 >> 3] >> (~(_BYTE)v7 & 7)) & 1) != 0)
        {
          v12 = DNSRecordTypeValueToString(v9 + v7);
          if (!v12)
          {
            v12 = __str;
            snprintf(__str, 0x20uLL, "TYPE%u", v9 + v7);
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            return 4294960561;
          result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, " %s", v12);
          if ((_DWORD)result)
            break;
        }
        v11 = ++v7 < v8;
        if (v10 == v7)
        {
          v6 += v15;
          v3 = a3 - (_QWORD)v6;
          goto LABEL_19;
        }
      }
      v3 = v14;
      if (v11)
        return result;
LABEL_19:
      a2 = v6;
      if (v3 > 0)
        continue;
      break;
    }
  }
  return 0;
}

const char *_DNSSVCBKeyToString(int a1)
{
  const char *result;
  const char *v4;

  result = "mandatory";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "alpn";
      break;
    case 2:
      result = "no-default-alpn";
      break;
    case 3:
      result = "port";
      break;
    case 4:
      result = "ipv4hint";
      break;
    case 5:
      result = "echconfig";
      break;
    case 6:
      result = "ipv6hint";
      break;
    case 7:
      result = "dohpath";
      break;
    default:
      v4 = "odohconfig";
      if (a1 != 32769)
        v4 = 0;
      if (a1 == 0x8000)
        result = "dohuri";
      else
        result = v4;
      break;
  }
  return result;
}

uint64_t _AppendOPTRDataString(uint64_t a1, unsigned __int16 *a2, unint64_t a3, int a4)
{
  unsigned __int16 *v5;
  const char *v7;
  _BYTE *v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t result;
  unsigned int v12;
  unsigned __int16 *v13;
  unsigned int v14;
  unsigned int v15;
  const char *v16;

  if ((unint64_t)a2 > a3)
    return 4294960586;
  v5 = a2;
  v7 = (const char *)&unk_24BC3DD1A;
  while (1)
  {
    if ((unint64_t)v5 >= a3)
      return 0;
    if (a3 - (unint64_t)v5 < 4)
      break;
    v8 = v5 + 2;
    v9 = __rev16(v5[1]);
    if (a3 - (unint64_t)(v5 + 2) < v9)
      break;
    v10 = *v5;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      return 4294960561;
    result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "%s{", v7);
    if ((_DWORD)result)
      return result;
    v12 = __rev16(v10);
    if (v12 == 12)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "Padding");
    }
    else if (v12 == 15)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "EDE");
    }
    else
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "CODE%u");
    }
    if ((_DWORD)result)
      return result;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      return 4294960561;
    result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, ", ");
    if ((_DWORD)result)
      return result;
    v13 = (unsigned __int16 *)&v8[v9];
    if (v12 == 15 && (_DWORD)v9)
    {
      if (v9 < 2)
        return 4294960546;
      v14 = v5[2];
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      v15 = __rev16(v14);
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "code: %u", v15);
      if ((_DWORD)result)
        return result;
      if (v15 <= 0x18)
      {
        v16 = off_251CDE410[v15];
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          return 4294960561;
        result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, " (%s)", v16);
        if ((_DWORD)result)
          return result;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, ", extra-text: ");
      if ((_DWORD)result)
        return result;
      if (!a4 || (_WORD)v13 == (_WORD)v5 + 6)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          return 4294960561;
        result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "'%.*s'");
      }
      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          return 4294960561;
        result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "«REDACTED»");
      }
    }
    else if (a4)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "[%u B]");
    }
    else if (v12 == 12 && (_DWORD)v9 && !*v8 && !memcmp(v5 + 2, (char *)v5 + 5, v9 - 1))
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "<%u zero bytes>");
    }
    else
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        return 4294960561;
      result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "'%H'");
    }
    if ((_DWORD)result)
      return result;
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      return 4294960561;
    result = _GetCUSymAddr_DataBuffer_AppendF_sAddr(a1, "}");
    v5 = v13;
    v7 = ", ";
    if ((_DWORD)result)
      return result;
  }
  return 4294960546;
}

char *DNSExtendedDNSErrorCodeToString(unsigned int a1)
{
  if (a1 > 0x18)
    return 0;
  else
    return off_251CDE410[a1];
}

uint64_t _AppendIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t result;
  _BYTE v9[33];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if ((_DWORD)a4 != 16 && (_DWORD)a4 != 4)
    return 4294960553;
  if (!a5)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      return ((uint64_t (*)(uint64_t, const char *))_GetCUSymAddr_DataBuffer_AppendF_sAddr)(a1, "%s%.*a");
    return 4294960561;
  }
  if (_GetCUSymAddr_SNPrintF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
  if (!_GetCUSymAddr_SNPrintF_sAddr)
    return 4294960561;
  result = _GetCUSymAddr_SNPrintF_sAddr(v9, 33, "%.4H", a3, a4, a4);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      return ((uint64_t (*)(uint64_t, const char *))_GetCUSymAddr_DataBuffer_AppendF_sAddr)(a1, "%s%~s");
    return 4294960561;
  }
  return result;
}

uint64_t DNSComputeDNSKeyTag(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  int v4;

  if (a2)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      v4 = *(unsigned __int8 *)(a1 + v2);
      if ((v2 & 1) == 0)
        v4 <<= 8;
      v3 += v4;
      ++v2;
    }
    while (a2 != v2);
  }
  else
  {
    v3 = 0;
  }
  return (unsigned __int16)(v3 + HIWORD(v3));
}

uint64_t DNSMessagePrintObfuscatedString(uint64_t a1, uint64_t a2, const char *a3)
{
  if (_NameIsPrivate(a3))
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
    if (_GetCUSymAddr_SNPrintF_sAddr)
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%~s", a3);
  }
  else
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
    if (_GetCUSymAddr_SNPrintF_sAddr)
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%s");
  }
  return 4294960561;
}

uint64_t DNSMessagePrintObfuscatedIPv4Address(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6;
  unsigned int v7;

  v6 = bswap32(a3);
  v7 = a3;
  if (a3 && a3 != 2130706433)
    return _DNSMessagePrintObfuscatedIPAddress(a1, a2, (uint64_t)&v6, 4);
  if (_GetCUSymAddr_SNPrintF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
  if (_GetCUSymAddr_SNPrintF_sAddr)
    return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%#.4a", COERCE_DOUBLE(&v7));
  else
    return 4294960561;
}

uint64_t _DNSMessagePrintObfuscatedIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  _BYTE v9[33];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (a4 != 16 && a4 != 4)
    return 4294960553;
  if (_GetCUSymAddr_SNPrintF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
  if (!_GetCUSymAddr_SNPrintF_sAddr)
    return 4294960561;
  result = _GetCUSymAddr_SNPrintF_sAddr(v9, 33, "%.4H", a3, a4, a4);
  if ((result & 0x80000000) == 0)
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
    if (_GetCUSymAddr_SNPrintF_sAddr)
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%~s", v9);
    return 4294960561;
  }
  return result;
}

uint64_t DNSMessagePrintObfuscatedIPv6Address(uint64_t a1, uint64_t a2, uint64_t a3)
{
  BOOL v6;

  if (*(_QWORD *)a3 | *(_QWORD *)(a3 + 7))
    v6 = 1;
  else
    v6 = *(unsigned __int8 *)(a3 + 15) >= 2u;
  if (v6)
    return _DNSMessagePrintObfuscatedIPAddress(a1, a2, a3, 16);
  if (_GetCUSymAddr_SNPrintF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
  if (_GetCUSymAddr_SNPrintF_sAddr)
    return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, "%.16a", *(double *)&a3);
  else
    return 4294960561;
}

uint64_t OSLogCopyFormattedString(char *__s1, uint64_t a2)
{
  uint64_t v4;
  const char **i;

  v4 = 0;
  for (i = (const char **)&OSLogCopyFormattedString_formatters; strcmp(__s1, *i); i += 2)
  {
    if (++v4 == 3)
      return 0;
  }
  return ((uint64_t (*)(uint64_t))(&OSLogCopyFormattedString_formatters)[2 * v4 + 1])(a2);
}

uint64_t srp_os_log_copy_formatted_string_ipv6_addr_segment(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  char *v8;
  const char *v9;
  char *v10;
  int v11;
  void *v13;
  id v14;
  uint64_t v15;
  id v17;
  uint64_t v18;
  id v19;
  const __CFString *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _WORD v27[8];
  char __str[52];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  __str[51] = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v21 = objc_alloc((Class)&off_257A51BD0);
    v22 = objc_alloc((Class)&off_257A52070);
    objc_msgSend(v1, "description");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("<failed to decode - invalid data type: %@>"), v23);
    v15 = objc_msgSend(v21, "initWithString:", v24);

    goto LABEL_19;
  }
  v2 = objc_retainAutorelease(v1);
  if (!objc_msgSend(v2, "bytes") || !objc_msgSend(v2, "length") || (unint64_t)objc_msgSend(v2, "length") >= 0x11)
  {
    v17 = objc_alloc((Class)&off_257A51BD0);
    v19 = objc_alloc((Class)&off_257A52070);
    v25 = objc_msgSend(v2, "length");
    v20 = CFSTR("<failed to decode - NIL or invalid data length: %lu>");
LABEL_23:
    v18 = objc_msgSend(v19, "initWithFormat:", v20, v25, v26);
LABEL_24:
    v13 = (void *)v18;
    v14 = v17;
    goto LABEL_18;
  }
  if ((objc_msgSend(v2, "length") & 1) != 0)
  {
    v17 = objc_alloc((Class)&off_257A51BD0);
    v19 = objc_alloc((Class)&off_257A52070);
    v25 = objc_msgSend(v2, "length");
    v20 = CFSTR("<failed to decode - odd data length: %lu>");
    goto LABEL_23;
  }
  v2 = objc_retainAutorelease(v2);
  v3 = objc_msgSend(v2, "bytes");
  if (objc_msgSend(v2, "length"))
  {
    v4 = 0;
    LODWORD(v5) = 0;
    do
    {
      v6 = v5;
      v27[(int)v5] = bswap32(*(unsigned __int16 *)(v3 + v4)) >> 16;
      v5 = (v5 + 1);
      v4 += 2;
    }
    while (v4 < objc_msgSend(v2, "length"));
    if (v6 <= 0x7FFFFFFE)
    {
      v7 = 0;
      v8 = __str;
      v9 = (const char *)&unk_24BC3DD1A;
      while (1)
      {
        v10 = (char *)((char *)&v29 - v8);
        v11 = snprintf(v8, (char *)&v29 - v8, "%s%x", v9, (unsigned __int16)v27[v7]);
        if (v11 < 1 || (unint64_t)v10 <= v11)
          break;
        v8 += v11;
        ++v7;
        v9 = ":";
        if (v5 == v7)
          goto LABEL_17;
      }
      v17 = objc_alloc((Class)&off_257A51BD0);
      v18 = objc_msgSend(objc_alloc((Class)&off_257A52070), "initWithFormat:", CFSTR("<failed to decode - snprintf: result: %d remain: %lu>"), v7, v10);
      goto LABEL_24;
    }
  }
LABEL_17:
  +[NSString stringWithUTF8String:](&off_257A52070, "stringWithUTF8String:", __str);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc((Class)&off_257A51BD0);
LABEL_18:
  v15 = objc_msgSend(v14, "initWithString:", v13);

LABEL_19:
  return v15;
}

uint64_t srp_os_log_copy_formatted_string_domain_name(void *a1)
{
  id v1;
  id v2;
  id v3;
  unsigned __int8 *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  const __CFString *v15;
  unsigned __int8 v16[1009];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = objc_alloc((Class)&off_257A51BD0);
    v11 = objc_alloc((Class)&off_257A52070);
    objc_msgSend(v1, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("<failed to decode - invalid data type: %@>"), v12);
    v7 = objc_msgSend(v10, "initWithString:", v13);

    goto LABEL_9;
  }
  v2 = objc_retainAutorelease(v1);
  if (!objc_msgSend(v2, "bytes"))
  {
    v14 = objc_alloc((Class)&off_257A51BD0);
    v15 = CFSTR("<null>");
LABEL_14:
    v7 = objc_msgSend(v14, "initWithString:", v15);
    goto LABEL_8;
  }
  if (!objc_msgSend(v2, "length") || (unint64_t)objc_msgSend(v2, "length") >= 0x101)
  {
    v9 = objc_alloc((Class)&off_257A51BD0);
    v5 = (void *)objc_msgSend(objc_alloc((Class)&off_257A52070), "initWithFormat:", CFSTR("<failed to decode - NIL or invalid data length: %lu>"), objc_msgSend(v2, "length"));
    v6 = v9;
    goto LABEL_7;
  }
  v16[1008] = 0;
  v3 = objc_retainAutorelease(v2);
  v4 = (unsigned __int8 *)objc_msgSend(v3, "bytes");
  v2 = objc_retainAutorelease(v3);
  if (DomainNameToString(v4, objc_msgSend(v2, "bytes") + objc_msgSend(v2, "length"), v16, 0))
  {
    v14 = objc_alloc((Class)&off_257A51BD0);
    v15 = CFSTR("Malformed Domain Name");
    goto LABEL_14;
  }
  +[NSString stringWithUTF8String:](&off_257A52070, "stringWithUTF8String:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc((Class)&off_257A51BD0);
LABEL_7:
  v7 = objc_msgSend(v6, "initWithString:", v5);

LABEL_8:
LABEL_9:

  return v7;
}

uint64_t srp_os_log_copy_formatted_string_mac_addr(void *a1)
{
  id v1;
  id v2;
  unsigned __int8 *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  char __str[18];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  __str[17] = 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v9 = objc_alloc((Class)&off_257A51BD0);
    v10 = objc_alloc((Class)&off_257A52070);
    objc_msgSend(v1, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("<failed to decode - invalid data type: %@>"), v11);
    v6 = objc_msgSend(v9, "initWithString:", v12);

    goto LABEL_8;
  }
  v2 = objc_retainAutorelease(v1);
  if (objc_msgSend(v2, "bytes") && objc_msgSend(v2, "length") == 6)
  {
    v2 = objc_retainAutorelease(v2);
    v3 = (unsigned __int8 *)objc_msgSend(v2, "bytes");
    if (snprintf(__str, 0x12uLL, "%02x:%02x:%02x:%02x:%02x:%02x", *v3, v3[1], v3[2], v3[3], v3[4], v3[5]) <= 0)
    {
      v6 = objc_msgSend(objc_alloc((Class)&off_257A51BD0), "initWithString:", CFSTR("<failed to decode - MAC address conversion failed>"));
      goto LABEL_7;
    }
    +[NSString stringWithUTF8String:](&off_257A52070, "stringWithUTF8String:", __str);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_alloc((Class)&off_257A51BD0);
  }
  else
  {
    v8 = objc_alloc((Class)&off_257A51BD0);
    v4 = (void *)objc_msgSend(objc_alloc((Class)&off_257A52070), "initWithFormat:", CFSTR("<failed to decode - NIL or invalid data length: %lu>"), objc_msgSend(v2, "length"));
    v5 = v8;
  }
  v6 = objc_msgSend(v5, "initWithString:", v4);

LABEL_7:
LABEL_8:

  return v6;
}

_BYTE *mdns_memcpy_bits(_BYTE *__dst, void *__src, unint64_t a3)
{
  char v3;
  _BYTE *v5;
  unint64_t v6;

  v3 = a3;
  v5 = __dst;
  v6 = a3 >> 3;
  if (a3 >= 8)
    __dst = memcpy(__dst, __src, a3 >> 3);
  if ((v3 & 7) != 0)
    v5[v6] = v5[v6] & ~(-1 << (8 - (v3 & 7))) | *((_BYTE *)__src + v6) & (-1 << (8 - (v3 & 7)));
  return __dst;
}

uint64_t mdns_memcmp_us_ascii_case_insensitive@<X0>(unsigned __int8 *a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, char a4@<W8>)
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;

  if (a3)
  {
    while (1)
    {
      v5 = *a1++;
      v4 = v5;
      v6 = v5 + 32;
      if (v5 - 65 < 0x1A)
        v4 = v6;
      v8 = *a2++;
      v7 = v8;
      v9 = v8 + 32;
      if (v8 - 65 < 0x1A)
        v7 = v9;
      if (v4 > v7)
        a4 = 1;
      if (v4 < v7)
        a4 = -1;
      if (v4 != v7)
        break;
      if (!--a3)
        return 0;
    }
  }
  else
  {
    return 0;
  }
  return a4;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x24BDAD310](__key, __base, __nel, __width, __compar);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

