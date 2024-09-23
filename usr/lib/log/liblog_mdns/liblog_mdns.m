char *mdns_dns_service_type_description(unsigned int a1)
{
  if (a1 > 5)
    return 0;
  else
    return off_24FEC1EC0[a1];
}

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
  _OWORD __dst[16];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  memset(__dst, 0, sizeof(__dst));
  result = DNSMessageExtractDomainName(a1, a2, a3, (char *)__dst, &v8);
  if (!(_DWORD)result)
  {
    result = DomainNameToString((unsigned __int8 *)__dst, 0, a4, 0);
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
  _OWORD __dst[16];
  char __srca[264];
  uint64_t v79;

  v10 = a7;
  v12 = a4;
  v79 = *MEMORY[0x24BDAC8D0];
  v76 = 0;
  memset(__srca, 0, 256);
  memset(__dst, 0, sizeof(__dst));
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
        result = DNSMessageExtractDomainName(a1, a2, (char *)v76, (char *)__dst, &v76);
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
          v56 = LOBYTE(__dst[0]);
          v57 = (char *)__dst;
          if (LOBYTE(__dst[0]))
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
          v60 = v57 - (char *)__dst;
          v61 = v57 - (char *)__dst + 1;
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
        result = DNSMessageExtractDomainName(a1, a2, (char *)v76, (char *)__dst, &v76);
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
          v42 = LOBYTE(__dst[0]);
          v43 = (char *)__dst;
          if (LOBYTE(__dst[0]))
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
          v46 = v43 - (char *)__dst;
          v47 = v43 - (char *)__dst + 1;
          v12 = v47 + v41;
          if (v41 < v10)
            v10 = v37 - __srca + 1;
          memcpy(a6, __srca, v10);
          v33 = &a6[v10];
          if (v40 - v33 >= v47)
            v34 = v46 + 1;
          else
            v34 = v40 - v33;
          v35 = (char *)__dst;
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

char *DNSMessageCollapse(unint64_t a1, unint64_t a2, _QWORD *a3, char **a4)
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
  char v21;
  unsigned int v22;
  char *v23;
  unsigned int v24;
  char v25;
  unsigned __int16 v26;
  __int16 v27;
  char *v28;
  char *v29;
  int v30;
  char *v31;
  char *v32;
  char *v33;
  char v34;
  __int16 v35;
  char *v36;
  _QWORD *v38;
  char **v39;
  unint64_t __n;
  char *v41;
  char v42;
  unsigned int v43;
  size_t size;
  unsigned int v45;
  char *v46;
  unsigned __int16 v47;
  unsigned int v48;
  size_t v49;
  unsigned __int16 v50;
  char *v51;
  int v52;
  char *v53;
  __int128 v54;
  __int128 v55;
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
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  char __dst[256];
  char __src[264];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v53 = 0;
  v52 = 0;
  memset(__src, 0, 256);
  memset(__dst, 0, sizeof(__dst));
  if (a2 < 0xC)
  {
LABEL_69:
    v36 = 0;
    v20 = 0;
    DomainName = -6743;
    goto LABEL_58;
  }
  if (__rev16(*(unsigned __int16 *)(a1 + 4)) != 1)
  {
    v36 = 0;
    v20 = 0;
    DomainName = -6764;
    goto LABEL_58;
  }
  v53 = (char *)(a1 + 12);
  DomainName = DNSMessageExtractQuestion(a1, a2, (char *)(a1 + 12), __src, (_WORD *)&v52 + 1, &v52, &v53);
  if (DomainName)
    goto LABEL_63;
  if ((unsigned __int16)v52 != 1)
  {
    v36 = 0;
    v20 = 0;
    DomainName = -6756;
    goto LABEL_58;
  }
  v9 = __src[0];
  v38 = a3;
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
  v41 = v53;
  __memcpy_chk();
  v14 = __rev16(*(unsigned __int16 *)(a1 + 6));
  if (v14)
  {
    v15 = 0;
    v43 = -1;
LABEL_9:
    v16 = 0;
    v53 = v41;
    v17 = 1;
    while (1)
    {
      v51 = 0;
      LODWORD(v49) = 0;
      LOWORD(v48) = 0;
      v50 = 0;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      DomainName = _DNSMessageExtractRecordEx(a1, a2, v53, (char *)&v54, &v48, &v50, &v49, (unsigned __int16 **)&v51, 0, 0, 0, 0, 0, &v53);
      if (DomainName)
        break;
      if ((unsigned __int16)v48 == 5
        && v50 == (unsigned __int16)v52
        && DomainNameEqual((unsigned __int8 *)&v54, (unsigned __int8 *)__dst))
      {
        DomainName = DNSMessageExtractDomainName(a1, a2, v51, __dst, 0);
        if (DomainName)
          break;
        v17 = 0;
        v18 = v43;
        if (v43 >= v49)
          v18 = v49;
        v43 = v18;
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
    v20 = 0;
    goto LABEL_58;
  }
  v43 = -1;
LABEL_25:
  v39 = a4;
  v46 = 0;
  v19 = 0;
  v20 = 0;
  size = v13 + 17;
  v21 = 1;
  a4 = &v53;
  while (1)
  {
    v42 = v21;
    v53 = v41;
    if (v14)
      break;
    v45 = 0;
    if (v20)
      goto LABEL_52;
LABEL_45:
    if (!size || (v29 = (char *)malloc_type_calloc(1uLL, size, 0xF1748037uLL)) == 0)
    {
      __break(1u);
      goto LABEL_69;
    }
    v20 = v29;
    if (size < 0xC)
      goto LABEL_67;
    v30 = *(_DWORD *)a1;
    *((_WORD *)v29 + 2) = *(_WORD *)(a1 + 4);
    *(_DWORD *)v29 = v30;
    *(_DWORD *)(v29 + 6) = 0;
    *((_WORD *)v29 + 5) = 0;
    if (size - 12 < __n)
      goto LABEL_67;
    v31 = &v29[size];
    v32 = v29 + 12;
    memcpy(v29 + 12, __src, __n);
    v33 = &v32[__n];
    v46 = v31;
    if ((unint64_t)(v31 - &v32[__n]) < 4)
      goto LABEL_67;
    v21 = 0;
    v34 = BYTE2(v52);
    v35 = v52;
    *v33 = HIBYTE(v52);
    v33[1] = v34;
    v33[2] = HIBYTE(v35);
    v33[3] = v35;
    v19 = v33 + 4;
    *((_WORD *)v20 + 2) = 256;
    if ((v42 & 1) == 0)
      goto LABEL_54;
  }
  v45 = 0;
  v22 = v14;
  do
  {
    v51 = 0;
    v49 = 0;
    v48 = 0;
    v50 = 0;
    v47 = 0;
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v23 = v53;
    DomainName = _DNSMessageExtractRecordEx(a1, a2, v53, (char *)&v54, &v50, &v47, &v48, 0, 0, 0, 0, 0, &v49, &v53);
    if (DomainName)
      goto LABEL_65;
    if (v50 == HIWORD(v52)
      && v47 == (unsigned __int16)v52
      && DomainNameEqual((unsigned __int8 *)&v54, (unsigned __int8 *)__dst))
    {
      if (v20)
      {
        if (v46 - v19 < 2)
          goto LABEL_64;
        *(_WORD *)v19 = 3264;
        if ((unint64_t)(v46 - v19 - 2) < 0xA)
          goto LABEL_64;
        v24 = v48;
        if (v48 >= v43)
          v24 = v43;
        v48 = v24;
        v25 = v50;
        v26 = v47;
        v27 = v49;
        v19[2] = HIBYTE(v50);
        v19[3] = v25;
        v19[4] = HIBYTE(v26);
        v19[5] = v26;
        v19[6] = HIBYTE(v24);
        v19[7] = BYTE2(v24);
        v19[8] = BYTE1(v24);
        v19[9] = v24;
        v19[10] = HIBYTE(v27);
        v19[11] = v27;
        v28 = v19 + 12;
        if (v46 - v28 < v49)
        {
LABEL_64:
          DomainName = -6762;
LABEL_65:
          v36 = 0;
          goto LABEL_66;
        }
        DomainName = _DNSMessageExtractRecordEx(a1, a2, v23, 0, 0, 0, 0, 0, 0, v28, v49, &v51, 0, 0);
        if (DomainName)
          goto LABEL_65;
        v19 = &v51[(_QWORD)v28];
        ++v45;
      }
      else
      {
        size += v49 + 12;
      }
    }
    --v22;
  }
  while (v22);
  if (!v20)
    goto LABEL_45;
LABEL_52:
  if (size >= 0xC)
  {
    *((_WORD *)v20 + 3) = bswap32(v45) >> 16;
LABEL_54:
    a4 = v39;
    DomainName = 0;
    if (v38)
      *v38 = v19 - v20;
    v36 = v20;
    goto LABEL_57;
  }
LABEL_67:
  v36 = 0;
  DomainName = -6762;
LABEL_66:
  a4 = v39;
LABEL_58:
  if (a4)
    *(_DWORD *)a4 = DomainName;
  if (v20)
    free(v20);
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
  unint64_t v10;
  uint64_t v11;
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr;
  uint64_t (*v13)(_OWORD *, const char *, ...);
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  int v17;
  uint64_t i;
  const char *v19;
  const char *v20;
  unsigned __int8 *v21;
  int v22;
  char *v23;
  _BOOL4 v24;
  char v25;
  int v26;
  char *v27;
  const char *v28;
  const char *v29;
  const char *v30;
  const char *v31;
  const char *v32;
  const char *v33;
  const char *v34;
  const char *v35;
  const char *v36;
  const char *v37;
  int v38;
  _BOOL4 v39;
  char v40;
  int v41;
  char *v42;
  const char *v43;
  const char *v44;
  const char *v45;
  const char *v46;
  const char *v47;
  const char *v48;
  int DomainName;
  char *v50;
  unint64_t v51;
  char *v52;
  const char *v53;
  const char *v54;
  int64_t v55;
  char *v56;
  unsigned int v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  unsigned __int8 *v63;
  int v64;
  const char *v65;
  const char *v66;
  const char *v67;
  const char *v68;
  unsigned int v69;
  unsigned __int8 *v70;
  unint64_t v71;
  const char *v72;
  const char *v73;
  unsigned int v74;
  const char *v75;
  const char *v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  const char *v80;
  const char *v81;
  unint64_t v82;
  const char *v83;
  const char *v84;
  int v85;
  unsigned __int8 *v86;
  unint64_t v87;
  uint64_t v88;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  int v96;
  uint64_t v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  const char *v101;
  unsigned int v102;
  unsigned int v103;
  unint64_t v104;
  int v105;
  uint64_t v106;
  void *v107;
  char *v108;
  _OWORD v109[3];
  uint64_t v110;
  int v111;
  int v112;
  unint64_t v113;
  unsigned __int8 *v114;
  void *v115;
  unsigned __int8 *v116;
  _OWORD v117[16];
  _BYTE v118[271];
  unsigned __int8 v119[1009];
  _BYTE v120[512];
  unint64_t v121[32];
  void *__src[130];

  __src[127] = *(void **)MEMORY[0x24BDAC8D0];
  v107 = 0;
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global);
  v110 = 0;
  memset(v109, 0, sizeof(v109));
  v108 = 0;
  v106 = 0;
  memset(v120, 0, sizeof(v120));
  bzero(v119, 0x3F1uLL);
  memset(v118, 0, 256);
  memset(v117, 0, sizeof(v117));
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr)
    goto LABEL_647;
  _GetCUSymAddr_DataBuffer_Init_sAddr(v109, v120, 512, -1);
  if (a2 < 0xC)
  {
LABEL_650:
    v78 = 4294960553;
    goto LABEL_640;
  }
  v8 = ((unint64_t)*((unsigned __int8 *)a1 + 2) >> 3) & 0xF;
  v102 = __rev16(a1[2]);
  v100 = __rev16(a1[3]);
  v99 = __rev16(a1[4]);
  v97 = a4;
  v98 = __rev16(a1[5]);
  v9 = "";
  v103 = a3;
  v104 = (unint64_t)a1;
  if ((a3 & 0x20) == 0)
  {
    v10 = *((unsigned __int8 *)a1 + 3) | (*((unsigned __int8 *)a1 + 2) << 8);
    v11 = __rev16(*a1);
    if ((a3 & 4) != 0)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      v13 = (uint64_t (*)(_OWORD *, const char *, ...))_GetCUSymAddr_DataBuffer_AppendF_sAddr;
      v16 = 81;
      if ((v10 & 0x8000u) != 0)
        v16 = 82;
      v94 = v10;
      v95 = v16;
      v93 = v11;
      v15 = "id: 0x%04X (%u), flags: 0x%04X (%c/";
    }
    else
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "ID:               0x%04X (%u)\n", v11, v11);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_639;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      v13 = (uint64_t (*)(_OWORD *, const char *, ...))_GetCUSymAddr_DataBuffer_AppendF_sAddr;
      v14 = 81;
      if ((v10 & 0x8000u) != 0)
        v14 = 82;
      v93 = v14;
      v15 = "Flags:            0x%04X %c/";
    }
    CUSymAddr_DataBuffer_AppendF_sAddr = v13(v109, v15);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_639;
    if (v8 > 6 || (_DWORD)v8 == 3)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      v17 = v8;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "OPCODE%d");
    }
    else
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      v17 = v8;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s");
    }
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_639;
    for (i = 0; i != 14; i += 2)
    {
      if (((uint64_t)(&kDNSHeaderFlagsDescs)[i + 1] & (unsigned __int16)v10) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_647;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, ", %s", (&kDNSHeaderFlagsDescs)[i]);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
      }
    }
    v19 = DNSRCodeToString(v10 & 0xF);
    if (v19)
    {
      v20 = v19;
      LODWORD(v8) = v17;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      v91 = (unint64_t)v20;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, ", %s");
    }
    else
    {
      LODWORD(v8) = v17;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      v91 = v10 & 0xF;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, ", RCODE%d");
    }
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    {
LABEL_639:
      v78 = CUSymAddr_DataBuffer_AppendF_sAddr;
      goto LABEL_640;
    }
    if ((a3 & 4) != 0)
    {
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, ")", v91, v93);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_639;
      if ((a3 & 0x40) != 0)
        goto LABEL_631;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, ", counts: %u/%u/%u/%u", v102, v100, v99, v98);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_639;
      v9 = ", ";
    }
    else
    {
      if ((a3 & 0x40) != 0)
      {
LABEL_631:
        if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
        if (!_GetCUSymAddr_DataBuffer_Append_sAddr)
          goto LABEL_647;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Append_sAddr(v109, "", 1);
        if (!(_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        {
          if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_226);
          if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
          {
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_Detach_sAddr(v109, v97, &v106);
            goto LABEL_639;
          }
LABEL_647:
          v78 = 4294960561;
          goto LABEL_640;
        }
        goto LABEL_639;
      }
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\n", v91, v93);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_639;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "Question count:   %u\n", v102);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_639;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "Answer count:     %u\n", v100);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_639;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "Authority count:  %u\n", v99);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_639;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_647;
      CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "Additional count: %u\n", v98);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_639;
      v9 = "";
    }
  }
  if ((a3 & 0x10) != 0)
    goto LABEL_631;
  v96 = v8;
  v105 = (a3 >> 3) & 1;
  v108 = (char *)(v104 + 12);
  if (v102)
  {
    v21 = 0;
    v22 = 0;
    v23 = v118;
    while (1)
    {
      LOWORD(__src[0]) = 0;
      LOWORD(v121[0]) = 0;
      CUSymAddr_DataBuffer_AppendF_sAddr = DNSMessageExtractQuestion(v104, a2, v108, v23, __src, v121, &v108);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_639;
      v24 = SLOWORD(v121[0]) < 0;
      if ((a3 & 1) != 0)
        LOWORD(v121[0]) &= ~0x8000u;
      v25 = a3;
      v26 = a3 & v24;
      if ((v25 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_647;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s", v9);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        if (v21 && DomainNameEqual((unsigned __int8 *)v23, v21))
        {
          v27 = v23;
          v23 = (char *)v21;
        }
        else
        {
          CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v23, 0, v119, 0);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_639;
          if (v105 && _NameIsPrivate((const char *)v119))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~s ");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s ");
          }
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_639;
          if (v23 == v118)
            v27 = (char *)v117;
          else
            v27 = v118;
          *v27 = 0;
        }
        v31 = "ANY";
        if (LOWORD(v121[0]) != 255)
          v31 = 0;
        if (LOWORD(v121[0]) == 1)
          v32 = "IN";
        else
          v32 = v31;
        if (v32)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "CLASS%u");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        if ((v103 & 1) != 0)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          v33 = "QM";
          if (v26)
            v33 = "QU";
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", v33);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_639;
        }
        v34 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v34)
        {
          v35 = v34;
          a3 = v103;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          v90 = (unint64_t)v35;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s?");
        }
        else
        {
          a3 = v103;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          v90 = LOWORD(__src[0]);
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u?");
        }
        v9 = ", ";
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
      }
      else
      {
        if (!v22)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\nQUESTION SECTION\n");
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_639;
        }
        CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v23, 0, v119, 0);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        if (v105 && _NameIsPrivate((const char *)v119))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~-30s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%-30s");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_647;
        v28 = "QM";
        if (v26)
          v28 = "QU";
        if ((v103 & 1) == 0)
          v28 = "";
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %2s", v28);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        v29 = "ANY";
        if (LOWORD(v121[0]) != 255)
          v29 = 0;
        if (LOWORD(v121[0]) == 1)
          v30 = "IN";
        else
          v30 = v29;
        if (v30)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", v30);
          a3 = v103;
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_639;
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          a3 = v103;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " CLASS%u", LOWORD(v121[0]));
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_639;
        }
        v36 = DNSRecordTypeValueToString(LOWORD(__src[0]));
        if (v36)
        {
          v37 = v36;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          v90 = (unint64_t)v37;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %-5s\n");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          v90 = LOWORD(__src[0]);
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u\n");
        }
        v27 = v23;
        v23 = (char *)v21;
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
      }
      v21 = (unsigned __int8 *)v23;
      ++v22;
      v23 = v27;
      if (v102 == v22)
        goto LABEL_201;
    }
  }
  v21 = 0;
  v27 = v118;
LABEL_201:
  if (v99 + v100 + v98)
  {
    v38 = 0;
    while (1)
    {
      __src[0] = 0;
      v121[0] = 0;
      LODWORD(v116) = 0;
      LOWORD(v115) = 0;
      LOWORD(v114) = 0;
      CUSymAddr_DataBuffer_AppendF_sAddr = _DNSMessageExtractRecordEx(v104, a2, v108, v27, &v115, &v114, &v116, (unsigned __int16 **)__src, v121, 0, 0, 0, 0, &v108);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_639;
      CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v27, 0, v119, 0);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_639;
      v39 = (__int16)v114 < 0;
      if ((a3 & 1) != 0)
        LOWORD(v114) = (unsigned __int16)v114 & 0x7FFF;
      v40 = a3;
      v41 = a3 & v39;
      if ((v40 & 4) != 0)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_647;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s", v9);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        if (v21 && DomainNameEqual((unsigned __int8 *)v27, v21))
        {
          v42 = v27;
          v27 = (char *)v21;
        }
        else
        {
          CUSymAddr_DataBuffer_AppendF_sAddr = DomainNameToString((unsigned __int8 *)v27, 0, v119, 0);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_639;
          if (v105 && _NameIsPrivate((const char *)v119))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~s ");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s ");
          }
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_639;
          if (v27 == v118)
            v42 = (char *)v117;
          else
            v42 = v118;
          *v42 = 0;
        }
        if ((unsigned __int16)v115 == 41)
        {
          if (v41)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "CF ");
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_639;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          a3 = v103;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "OPT %u", (unsigned __int16)v114);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_639;
          if ((_DWORD)v116)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " 0x%08X");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " 0");
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%u", (_DWORD)v116);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_639;
          if (v41)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " CF");
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_639;
          }
          v43 = "ANY";
          if ((unsigned __int16)v114 != 255)
            v43 = 0;
          if ((unsigned __int16)v114 == 1)
            v44 = "IN";
          else
            v44 = v43;
          if (v44)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", v44);
            a3 = v103;
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_639;
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            a3 = v103;
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " CLASS%u", (unsigned __int16)v114);
            if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_639;
          }
          if (DNSRecordTypeValueToString((unsigned __int16)v115))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u");
          }
        }
        v9 = ", ";
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        goto LABEL_372;
      }
      if (v100 && !v38)
        break;
      if (v99 && v100 == v38)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_647;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\nAUTHORITY SECTION\n");
        goto LABEL_284;
      }
      if (v98 && v99 + v100 == v38)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_647;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\nADDITIONAL SECTION\n");
        goto LABEL_284;
      }
LABEL_285:
      if ((unsigned __int16)v115 == 41)
      {
        if (v105 && _NameIsPrivate((const char *)v119))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_647;
        v45 = "";
        if (v41)
          v45 = " CF";
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s OPT %u", v45, (unsigned __int16)v114);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        a3 = v103;
        if ((_DWORD)v116)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " 0x%08X");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " 0");
        }
      }
      else
      {
        if (v105)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~-42s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%-42s");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_647;
        v46 = "";
        if (v41)
          v46 = "CF";
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %6u %2s", (_DWORD)v116, v46);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        v47 = "ANY";
        if ((unsigned __int16)v114 != 255)
          v47 = 0;
        if ((unsigned __int16)v114 == 1)
          v48 = "IN";
        else
          v48 = v47;
        if (v48)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", v48);
          a3 = v103;
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_639;
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          a3 = v103;
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " CLASS%u", (unsigned __int16)v114);
          if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_639;
        }
        if (DNSRecordTypeValueToString((unsigned __int16)v115))
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %-5s");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u");
        }
      }
      v42 = v27;
      v27 = (char *)v21;
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_639;
LABEL_372:
      if ((a3 & 2) == 0)
        DNSRecordDataToStringEx((unsigned __int8 *)__src[0], v121[0], (unsigned __int16)v115, v104, a2, v105, (uint64_t)&v107);
      if (v107)
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_647;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", (const char *)v107);
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        if (v107)
        {
          free(v107);
          v107 = 0;
        }
      }
      else
      {
        if (v105)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          v90 = v121[0];
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " [%zu B]");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_647;
          v92 = v121[0];
          v94 = v121[0];
          v90 = (unint64_t)__src[0];
          CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %#H");
        }
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
      }
      if ((a3 & 4) != 0)
      {
        if ((unsigned __int16)v115 == 5)
        {
          DomainName = DNSMessageExtractDomainName(v104, a2, (char *)__src[0], v42, 0);
          v50 = v118;
          if (v42 == v118)
            v50 = (char *)v117;
          if (!DomainName)
          {
            v27 = v42;
            v42 = v50;
          }
          *v42 = 0;
        }
      }
      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_647;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\n");
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
      }
      ++v38;
      v21 = (unsigned __int8 *)v27;
      v27 = v42;
      if (v100 + v98 + v99 == v38)
        goto LABEL_404;
    }
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_647;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\nANSWER SECTION\n");
LABEL_284:
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_639;
    goto LABEL_285;
  }
LABEL_404:
  if (v96 != 6)
    goto LABEL_631;
  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_647;
  CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "[");
  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
    goto LABEL_639;
  v51 = v104 + a2;
  v52 = v108;
  if ((unint64_t)v108 >= v104 + a2)
  {
LABEL_624:
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_647;
    if (((v103 >> 2) & 1) != 0)
      v88 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "]", v90, v92, v94, v95);
    else
      v88 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "\n]", v90, v92, v94, v95);
    v78 = v88;
    if ((_DWORD)v88)
      goto LABEL_640;
    goto LABEL_631;
  }
  if (((v103 >> 2) & 1) != 0)
    v53 = "";
  else
    v53 = "\n\t";
  if (((v103 >> 2) & 1) != 0)
    v54 = ", ";
  else
    v54 = ",\n\t";
  v101 = v54;
  while ((unint64_t)v52 >= v104)
  {
    if (v51 - (unint64_t)v52 < 4
      || (v55 = __rev16(*((unsigned __int16 *)v52 + 1)), v56 = v52 + 4, (uint64_t)(v51 - (_QWORD)(v52 + 4)) < v55))
    {
LABEL_648:
      v78 = 4294960546;
      goto LABEL_640;
    }
    v57 = *(unsigned __int16 *)v52;
    v58 = (unint64_t)&v56[v55];
    v108 = &v56[v55];
    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_647;
    CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s", v53);
    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
      goto LABEL_639;
    v59 = __rev16(v57);
    v61 = "Reserved";
    v60 = a2;
    switch((int)v59)
    {
      case 0:
        goto LABEL_438;
      case 1:
        v61 = "KeepAlive";
        goto LABEL_438;
      case 2:
        v61 = "Retry Delay";
        goto LABEL_438;
      case 3:
        v61 = "Encryption Padding";
LABEL_438:
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_647;
        v90 = (unint64_t)v61;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s: ");
LABEL_442:
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_639;
        break;
      default:
        v60 = a2;
        switch((int)v59)
        {
          case '@':
            v61 = "SUBSCRIBE";
            goto LABEL_438;
          case 'A':
            v61 = "PUSH";
            goto LABEL_438;
          case 'B':
            v61 = "UNSUBSCRIBE";
            goto LABEL_438;
          case 'C':
            v61 = "RECONFIRM";
            goto LABEL_438;
          default:
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_647;
            v90 = v59;
            CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "DSO-TYPE%u: ");
            break;
        }
        goto LABEL_442;
    }
    v115 = 0;
    v116 = (unsigned __int8 *)(v52 + 4);
    bzero(__src, 0x3F1uLL);
    switch((int)v59)
    {
      case '@':
        v62 = DNSMessageExtractDomainNameString(v104, v60, v52 + 4, (unsigned __int8 *)__src, &v116);
        if ((_DWORD)v62)
          goto LABEL_569;
        v63 = v116;
        if (v58 - (_QWORD)v116 == 4)
        {
          if (v105 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v90 = (unint64_t)__src;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v90 = (unint64_t)__src;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s");
          }
          if ((_DWORD)v62)
            goto LABEL_569;
          v71 = __rev16(*((unsigned __int16 *)v63 + 1));
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
              goto LABEL_621;
            v90 = (unint64_t)v73;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v90 = v71;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " CLASS%u");
          }
          if ((_DWORD)v62)
            goto LABEL_569;
          v79 = __rev16(*(unsigned __int16 *)v63);
          v80 = DNSRecordTypeValueToString(v79);
          if (v80)
          {
            v81 = v80;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v90 = (unint64_t)v81;
              v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s");
              goto LABEL_614;
            }
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v90 = v79;
              v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u");
              goto LABEL_614;
            }
          }
          goto LABEL_621;
        }
        v78 = 4294960553;
        goto LABEL_616;
      case 'A':
        if (v58 <= (unint64_t)v56)
          goto LABEL_648;
        v64 = (v103 >> 3) & 1;
        while (1)
        {
          v113 = 0;
          v114 = 0;
          v111 = 0;
          v112 = 0;
          memset(v121, 0, sizeof(v121));
          v62 = _DNSMessageExtractRecordEx(v104, v60, v56, (char *)v121, (_WORD *)&v111 + 1, &v111, &v112, (unsigned __int16 **)&v114, &v113, 0, 0, 0, 0, &v116);
          if ((_DWORD)v62)
            goto LABEL_569;
          if ((unint64_t)v116 > v58)
            goto LABEL_622;
          v62 = DomainNameToString((unsigned __int8 *)v121, 0, (unsigned __int8 *)__src, 0);
          if ((_DWORD)v62)
            goto LABEL_569;
          if (v64 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v90 = (unint64_t)__src;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v90 = (unint64_t)__src;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s");
          }
          if ((_DWORD)v62)
            goto LABEL_569;
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_621;
          v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " 0x%08X", v112);
          if ((_DWORD)v62)
            goto LABEL_569;
          v65 = "ANY";
          if ((unsigned __int16)v111 != 255)
            v65 = 0;
          if ((unsigned __int16)v111 == 1)
            v66 = "IN";
          else
            v66 = v65;
          if (v66)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v90 = (unint64_t)v66;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s");
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v90 = (unsigned __int16)v111;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " CLASS%u");
          }
          if ((_DWORD)v62)
            goto LABEL_569;
          v67 = DNSRecordTypeValueToString(HIWORD(v111));
          if (v67)
          {
            v68 = v67;
            v64 = (v103 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v90 = (unint64_t)v68;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s");
          }
          else
          {
            v64 = (v103 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v90 = HIWORD(v111);
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u");
          }
          if ((_DWORD)v62)
            goto LABEL_569;
          DNSRecordDataToStringEx(v114, v113, HIWORD(v111), v104, v60, v64, (uint64_t)&v115);
          if (v115)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", (const char *)v115);
            if ((_DWORD)v62)
              goto LABEL_569;
            if (v115)
            {
              free(v115);
              v115 = 0;
            }
          }
          else
          {
            if (v64)
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_621;
              v90 = v113;
              v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " [%zu B]");
            }
            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_621;
              v92 = v113;
              v94 = v113;
              v90 = (unint64_t)v114;
              v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %#H");
            }
            if ((_DWORD)v62)
              goto LABEL_569;
          }
          v56 = (char *)v116;
          if ((unint64_t)v116 >= v58)
            goto LABEL_615;
        }
      case 'B':
        if ((_DWORD)v55 != 2)
          goto LABEL_650;
        v69 = *((unsigned __int16 *)v52 + 2);
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_621;
        v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%u", __rev16(v69));
        goto LABEL_569;
      case 'C':
        v62 = DNSMessageExtractDomainNameString(v104, v60, v52 + 4, (unsigned __int8 *)__src, &v116);
        if ((_DWORD)v62)
          goto LABEL_569;
        v70 = v116;
        if (v58 - (unint64_t)v116 >= 4)
        {
          v116 += 4;
          if (v105 && _NameIsPrivate((const char *)__src))
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v90 = (unint64_t)__src;
              v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%~s");
              goto LABEL_553;
            }
LABEL_621:
            v78 = 4294960561;
            goto LABEL_616;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_621;
          v90 = (unint64_t)__src;
          v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "%s");
LABEL_553:
          if ((_DWORD)v62)
            goto LABEL_569;
          v74 = __rev16(*((unsigned __int16 *)v70 + 1));
          v75 = "ANY";
          if (v74 != 255)
            v75 = 0;
          if (v74 == 1)
            v76 = "IN";
          else
            v76 = v75;
          if (v76)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            v77 = v104;
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", v76);
            if ((_DWORD)v62)
              goto LABEL_569;
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " CLASS%u", v74);
            v77 = v104;
            if ((_DWORD)v62)
              goto LABEL_569;
          }
          v82 = __rev16(*(unsigned __int16 *)v70);
          v83 = DNSRecordTypeValueToString(v82);
          if (v83)
          {
            v84 = v83;
            v85 = (v103 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v90 = (unint64_t)v84;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s");
          }
          else
          {
            v85 = (v103 >> 3) & 1;
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
              goto LABEL_621;
            v90 = v82;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " TYPE%u");
          }
          if ((_DWORD)v62)
            goto LABEL_569;
          v86 = v116;
          v87 = v58 - (_QWORD)v116;
          DNSRecordDataToStringEx(v116, v58 - (_QWORD)v116, v82, v77, v60, v85, (uint64_t)&v115);
          if (v115)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " %s", (const char *)v115);
              if ((_DWORD)v62)
                goto LABEL_569;
              if (v115)
              {
                free(v115);
                v115 = 0;
              }
              goto LABEL_615;
            }
          }
          else if (v85)
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v90 = v87;
              v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " [%zu B]");
              goto LABEL_614;
            }
          }
          else
          {
            if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
              dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
            if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            {
              v92 = v87;
              v94 = v87;
              v90 = (unint64_t)v86;
              v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, " '%H'");
LABEL_614:
              if ((_DWORD)v62)
                goto LABEL_569;
LABEL_615:
              v78 = 0;
              goto LABEL_616;
            }
          }
          goto LABEL_621;
        }
LABEL_622:
        v78 = 4294960546;
LABEL_616:
        if (v115)
          free(v115);
        if ((_DWORD)v78)
          goto LABEL_640;
        v52 = v108;
        v53 = v101;
        v51 = v104 + a2;
        if ((unint64_t)v108 >= v104 + a2)
          goto LABEL_624;
        break;
      default:
        if (v105)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            v90 = v55;
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "[%u B]");
            goto LABEL_569;
          }
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          {
            v92 = v55;
            v94 = v55;
            v90 = (unint64_t)(v52 + 4);
            v62 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v109, "'%H'");
LABEL_569:
            v78 = v62;
            goto LABEL_616;
          }
        }
        goto LABEL_621;
    }
  }
  v78 = 4294960586;
LABEL_640:
  if (v107)
    free(v107);
  if (_GetCUSymAddr_DataBuffer_Free_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_Free_sOnce, &__block_literal_global_229);
  if (_GetCUSymAddr_DataBuffer_Free_sAddr)
    _GetCUSymAddr_DataBuffer_Free_sAddr(v109);
  return v78;
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
  uint64_t v16;
  unint64_t v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  unint64_t v20;
  unsigned __int8 *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned __int8 v31;
  char v32;
  uint64_t v33;
  unsigned int v34;
  char *v35;
  unsigned int v36;
  unsigned int *v37;
  const char *v38;
  unsigned int v39;
  const char *v40;
  const char *v41;
  const char *v42;
  unsigned int *v43;
  unsigned int *v44;
  const char *v45;
  char v46;
  const char *v47;
  const char *v48;
  unsigned int *v49;
  const char *v50;
  char v51;
  unint64_t v52;
  unsigned int *i;
  const char *v54;
  unsigned int v55;
  unsigned int *v56;
  const char *v57;
  uint64_t CUSymAddr_DataBuffer_AppendF_sAddr;
  unsigned int *v59;
  const char *v60;
  unsigned int *v61;
  const char *v62;
  unsigned int *v64;
  const char *v65;
  const char *v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _OWORD v73[3];
  uint64_t v74;
  unsigned __int8 *v75;
  unsigned int *v76;
  unsigned __int8 v77[1009];
  _BYTE v78[256];
  void *v79[130];

  v79[127] = *(void **)MEMORY[0x24BDAC8D0];
  if (_GetCUSymAddr_DataBuffer_Init_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_DataBuffer_Init_sOnce, &__block_literal_global);
  v74 = 0;
  v75 = 0;
  memset(v73, 0, sizeof(v73));
  v72 = 0;
  memset(v78, 0, sizeof(v78));
  bzero(v77, 0x3F1uLL);
  if (!_GetCUSymAddr_DataBuffer_Init_sAddr)
    goto LABEL_349;
  v14 = (unint64_t)&a1[a2];
  _GetCUSymAddr_DataBuffer_Init_sAddr(v73, v78, 256, -1);
  if (a3 <= 27)
  {
    switch(a3)
    {
      case 1:
        if (a2 != 4)
          goto LABEL_350;
        appended = _AppendIPv4Address((uint64_t)v73, 0, (unsigned int *)a1, a6);
        if ((_DWORD)appended)
          goto LABEL_341;
        goto LABEL_333;
      case 2:
      case 5:
      case 12:
        if (a4)
        {
          appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, v77, 0);
          if (!(_DWORD)appended)
            goto LABEL_331;
        }
        else
        {
          appended = DomainNameToString(a1, (unint64_t)&a1[a2], v77, 0);
          if (!(_DWORD)appended)
            goto LABEL_331;
        }
        goto LABEL_341;
      case 6:
        if (a4)
        {
          appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, v77, &v75);
          if ((_DWORD)appended)
            goto LABEL_341;
          if ((unint64_t)v75 >= v14)
            goto LABEL_350;
          appended = _AppendDomainNameStringEx((uint64_t)v73, 0, a6, (const char *)v77);
          if ((_DWORD)appended)
            goto LABEL_341;
          appended = DNSMessageExtractDomainNameString(a4, a5, (char *)v75, v77, &v75);
          if ((_DWORD)appended)
            goto LABEL_341;
        }
        else
        {
          appended = DomainNameToString(a1, (unint64_t)&a1[a2], v77, &v75);
          if ((_DWORD)appended)
            goto LABEL_341;
          appended = _AppendDomainNameStringEx((uint64_t)v73, 0, a6, (const char *)v77);
          if ((_DWORD)appended)
            goto LABEL_341;
          appended = DomainNameToString(v75, (unint64_t)&a1[a2], v77, &v75);
          if ((_DWORD)appended)
            goto LABEL_341;
        }
        appended = _AppendDomainNameStringEx((uint64_t)v73, (uint64_t)" ", a6, (const char *)v77);
        if ((_DWORD)appended)
          goto LABEL_341;
        v64 = (unsigned int *)v75;
        if (v14 - (_QWORD)v75 != 20)
          goto LABEL_350;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_349;
        CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u %u %u %u %u", bswap32(*v64), bswap32(v64[1]), bswap32(v64[2]), bswap32(v64[3]), bswap32(v64[4]));
        if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_342;
        goto LABEL_333;
      case 13:
      case 16:
        if (!a2)
          goto LABEL_350;
        if (a6)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_349;
          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "[%zu B]");
        }
        else if (a2 == 1)
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_349;
          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%#H");
        }
        else
        {
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_349;
          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%#{txt}");
        }
        if (!(_DWORD)appended)
          goto LABEL_333;
        goto LABEL_341;
      case 15:
        if ((uint64_t)a2 < 3)
          goto LABEL_350;
        v36 = *(unsigned __int16 *)a1;
        v35 = (char *)(a1 + 2);
        v34 = v36;
        if (a4)
        {
          appended = DNSMessageExtractDomainNameString(a4, a5, v35, v77, 0);
          if ((_DWORD)appended)
            goto LABEL_341;
        }
        else
        {
          appended = DomainNameToString((unsigned __int8 *)v35, v14, v77, 0);
          if ((_DWORD)appended)
            goto LABEL_341;
        }
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_349;
        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u", __rev16(v34));
        if ((_DWORD)appended)
          goto LABEL_341;
        v65 = " ";
        break;
      default:
        goto LABEL_115;
    }
LABEL_332:
    appended = _AppendDomainNameStringEx((uint64_t)v73, (uint64_t)v65, a6, (const char *)v77);
    if ((_DWORD)appended)
      goto LABEL_341;
LABEL_333:
    if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
    if (_GetCUSymAddr_DataBuffer_Append_sAddr)
    {
      appended = _GetCUSymAddr_DataBuffer_Append_sAddr(v73, "", 1);
      if (!(_DWORD)appended)
      {
        if (_GetCUSymAddr_DataBuffer_Detach_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_Detach_sOnce, &__block_literal_global_226);
        if (_GetCUSymAddr_DataBuffer_Detach_sAddr)
        {
          appended = _GetCUSymAddr_DataBuffer_Detach_sAddr(v73, a7, &v72);
          goto LABEL_341;
        }
        goto LABEL_349;
      }
LABEL_341:
      CUSymAddr_DataBuffer_AppendF_sAddr = appended;
      goto LABEL_342;
    }
LABEL_349:
    CUSymAddr_DataBuffer_AppendF_sAddr = 4294960561;
    goto LABEL_342;
  }
  switch(a3)
  {
    case '+':
      if (a2 < 4)
        goto LABEL_350;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_349;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u %u %u", __rev16(*(unsigned __int16 *)a1), a1[2], a1[3]);
      if ((_DWORD)appended)
        goto LABEL_341;
      if (a2 == 4)
        goto LABEL_333;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_349;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %.4H", a1 + 4, a2 - 4, a2 - 4);
      if ((_DWORD)appended)
        goto LABEL_341;
      goto LABEL_333;
    case ',':
    case '-':
    case '1':
      goto LABEL_115;
    case '.':
      LODWORD(v76) = 0;
      v70 = 0;
      v71 = 0;
      v69 = 0;
      if (a2 < 0x13)
        goto LABEL_350;
      if (DNSRecordTypeValueToString(__rev16(*(unsigned __int16 *)a1)))
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_349;
        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%s");
      }
      else
      {
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_349;
        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "TYPE%u");
      }
      if ((_DWORD)appended)
        goto LABEL_341;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_349;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u %u %u", a1[2], a1[3], bswap32(*((_DWORD *)a1 + 1)));
      if ((_DWORD)appended)
        goto LABEL_341;
      LODWORD(v76) = 0;
      v70 = 0;
      v71 = 0;
      v69 = 0;
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_241);
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr)
        goto LABEL_349;
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr(bswap32(*((_DWORD *)a1 + 2)) + 0xE77934880, &v76, (char *)&v71 + 4, &v71, (char *)&v70 + 4, &v70, &v69);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_349;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u%02u%02u%02u%02u%02u", (_DWORD)v76, HIDWORD(v71), v71, HIDWORD(v70), v70, v69);
      if ((_DWORD)appended)
        goto LABEL_341;
      if (_GetCUSymAddr_SecondsToYMD_HMS_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_SecondsToYMD_HMS_sOnce, &__block_literal_global_241);
      if (!_GetCUSymAddr_SecondsToYMD_HMS_sAddr)
        goto LABEL_349;
      _GetCUSymAddr_SecondsToYMD_HMS_sAddr(bswap32(*((_DWORD *)a1 + 3)) + 0xE77934880, &v76, (char *)&v71 + 4, &v71, (char *)&v70 + 4, &v70, &v69);
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_349;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u%02u%02u%02u%02u%02u", (_DWORD)v76, HIDWORD(v71), v71, HIDWORD(v70), v70, v69);
      if ((_DWORD)appended)
        goto LABEL_341;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_349;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %u", __rev16(*((unsigned __int16 *)a1 + 8)));
      if ((_DWORD)appended)
        goto LABEL_341;
      v75 = a1 + 18;
      appended = DomainNameToString(a1 + 18, v14, v77, &v75);
      if ((_DWORD)appended)
        goto LABEL_341;
      appended = _AppendDomainNameStringEx((uint64_t)v73, (uint64_t)" ", a6, (const char *)v77);
      if ((_DWORD)appended)
        goto LABEL_341;
      v79[0] = 0;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_238);
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr)
        goto LABEL_349;
      appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v75, v14 - (_QWORD)v75, 0, v79, 0);
      if ((_DWORD)appended)
        goto LABEL_341;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (_GetCUSymAddr_DataBuffer_AppendF_sAddr)
      {
        v16 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %s", (const char *)v79[0]);
LABEL_299:
        CUSymAddr_DataBuffer_AppendF_sAddr = v16;
      }
      else
      {
LABEL_352:
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960561;
      }
      if (v79[0])
        free(v79[0]);
      if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_342;
      goto LABEL_333;
    case '/':
      if (a4)
      {
        appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1, v77, &v75);
        if ((_DWORD)appended)
          goto LABEL_341;
      }
      else
      {
        appended = DomainNameToString(a1, (unint64_t)&a1[a2], v77, &v75);
        if ((_DWORD)appended)
          goto LABEL_341;
      }
      if ((unint64_t)v75 >= v14)
        goto LABEL_350;
      appended = _AppendDomainNameStringEx((uint64_t)v73, 0, a6, (const char *)v77);
      if ((_DWORD)appended)
        goto LABEL_341;
      appended = _DNSRecordDataAppendTypeBitMap((uint64_t)v73, v75, (uint64_t)&a1[a2]);
      if ((_DWORD)appended)
        goto LABEL_341;
      goto LABEL_333;
    case '0':
      if (a2 < 5)
        goto LABEL_350;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_349;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u %u %u", __rev16(*(unsigned __int16 *)a1), a1[2], a1[3]);
      if ((_DWORD)appended)
        goto LABEL_341;
      v75 = a1 + 4;
      v79[0] = 0;
      if (_GetCUSymAddr_Base64EncodeCopyEx_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_Base64EncodeCopyEx_sOnce, &__block_literal_global_238);
      if (!_GetCUSymAddr_Base64EncodeCopyEx_sAddr)
        goto LABEL_349;
      appended = _GetCUSymAddr_Base64EncodeCopyEx_sAddr(v75, v14 - (_QWORD)v75, 0, v79, 0);
      if ((_DWORD)appended)
        goto LABEL_341;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_352;
      v16 = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %s", (const char *)v79[0]);
      goto LABEL_299;
    case '2':
      if (a2 < 5)
        goto LABEL_350;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_349;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u %u %u", *a1, a1[1], __rev16(*((unsigned __int16 *)a1 + 1)));
      if ((_DWORD)appended)
        goto LABEL_341;
      v75 = a1 + 4;
      if ((uint64_t)(a2 - 4) < 1)
        goto LABEL_350;
      v75 = a1 + 5;
      v17 = a1[4];
      if (a2 - 5 < v17)
        goto LABEL_350;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_349;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %.4H", v75, v17, v17);
      if ((_DWORD)appended)
        goto LABEL_341;
      v18 = &v75[v17];
      v75 = v18;
      if ((uint64_t)(v14 - (_QWORD)v18) < 1)
        goto LABEL_350;
      v19 = v18 + 1;
      v75 = v18 + 1;
      v20 = *v18;
      if (v14 - (unint64_t)(v18 + 1) < v20)
        goto LABEL_350;
      if (!*v18)
        goto LABEL_76;
      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
        goto LABEL_349;
      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " ");
      if ((_DWORD)appended)
        goto LABEL_341;
      v19 = v75;
LABEL_76:
      v21 = &v19[v20];
      while (2)
      {
        v22 = v21 - v75;
        if (v21 != v75)
        {
          v79[0] = 0;
          v23 = 0;
          switch(v22)
          {
            case 1uLL:
              v24 = 0;
              v25 = (unint64_t)*v75++ << 32;
              goto LABEL_94;
            case 2uLL:
              v30 = 0;
              v28 = (unint64_t)v75[1] << 24;
              v25 = v28 | ((unint64_t)*v75 << 32);
              v75 += 2;
              goto LABEL_91;
            case 3uLL:
              v31 = v75[2];
              v28 = ((unint64_t)v31 << 16) | ((unint64_t)v75[1] << 24);
              v25 = v28 | ((unint64_t)*v75 << 32);
              v75 += 3;
              BYTE4(v79[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[2 * (v31 & 0xF)];
              v30 = 5;
              goto LABEL_91;
            case 4uLL:
              goto LABEL_81;
            default:
              v23 = v75[4];
LABEL_81:
              v26 = v75[3];
              v27 = v23 | (v26 << 8);
              v28 = ((unint64_t)v75[1] << 24) | ((unint64_t)v75[2] << 16) | v27;
              v25 = v28 | ((unint64_t)*v75 << 32);
              v29 = 5;
              if (v22 < 5)
                v29 = v21 - v75;
              v75 += v29;
              if (v22 == 1)
              {
                v24 = 0;
              }
              else
              {
                if (v22 == 4)
                {
                  v30 = 7;
                }
                else
                {
                  HIBYTE(v79[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v23 & 0x1F];
                  v30 = 8;
                }
                v32 = DNSRecordDataToStringEx_kBase32ExtendedHex[(v26 >> 2) & 0x1F];
                BYTE6(v79[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v27 >> 5) & 0x1F];
                BYTE5(v79[0]) = v32;
                BYTE4(v79[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v28 >> 15) & 0x1F];
LABEL_91:
                BYTE3(v79[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v28 >> 20) & 0x1F];
                BYTE2(v79[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v28 >> 25) & 0x1F];
                if (v30)
                  v24 = v30;
                else
                  v24 = 4;
              }
LABEL_94:
              BYTE1(v79[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[(v25 >> 30) & 0x1F];
              LOBYTE(v79[0]) = DNSRecordDataToStringEx_kBase32ExtendedHex[v25 >> 35];
              if (_GetCUSymAddr_DataBuffer_Append_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_Append_sOnce, &__block_literal_global_223);
              if (!_GetCUSymAddr_DataBuffer_Append_sAddr)
                goto LABEL_349;
              if (v24)
                v33 = v24;
              else
                v33 = 2;
              appended = _GetCUSymAddr_DataBuffer_Append_sAddr(v73, v79, v33);
              if ((_DWORD)appended)
                goto LABEL_341;
              continue;
          }
        }
        break;
      }
      appended = _DNSRecordDataAppendTypeBitMap((uint64_t)v73, v21, v14);
      if ((_DWORD)appended)
        goto LABEL_341;
      goto LABEL_333;
    default:
      if (a3 == 28)
      {
        if (a2 == 16)
        {
          appended = _AppendIPv6Address((uint64_t)v73, 0, (uint64_t)a1, a6);
          if (!(_DWORD)appended)
            goto LABEL_333;
          goto LABEL_341;
        }
        goto LABEL_350;
      }
      if (a3 == 33)
      {
        if (a2 >= 7)
        {
          if (a4)
          {
            appended = DNSMessageExtractDomainNameString(a4, a5, (char *)a1 + 6, v77, 0);
            if ((_DWORD)appended)
              goto LABEL_341;
          }
          else
          {
            appended = DomainNameToString(a1 + 6, (unint64_t)&a1[a2], v77, 0);
            if ((_DWORD)appended)
              goto LABEL_341;
          }
          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
            goto LABEL_349;
          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u %u %u ", __rev16(*(unsigned __int16 *)a1), __rev16(*((unsigned __int16 *)a1 + 1)), __rev16(*((unsigned __int16 *)a1 + 2)));
          if ((_DWORD)appended)
            goto LABEL_341;
LABEL_331:
          v65 = 0;
          goto LABEL_332;
        }
LABEL_350:
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960554;
        goto LABEL_342;
      }
LABEL_115:
      if ((a3 & 0xFFFFFFFE) != 0x40)
      {
        if (a3 != 41)
        {
          CUSymAddr_DataBuffer_AppendF_sAddr = 4294960582;
          goto LABEL_342;
        }
        appended = _AppendOPTRDataString((uint64_t)v73, (unsigned __int16 *)a1, (unint64_t)&a1[a2], a6);
        if (!(_DWORD)appended)
          goto LABEL_333;
        goto LABEL_341;
      }
      if (v14 < (unint64_t)a1)
      {
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960586;
      }
      else
      {
        if (a2 < 2)
          goto LABEL_350;
        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
          goto LABEL_349;
        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u", __rev16(*(unsigned __int16 *)a1));
        if ((_DWORD)appended)
          goto LABEL_341;
        bzero(v79, 0x3F1uLL);
        v76 = (unsigned int *)(a1 + 2);
        appended = DomainNameToString(a1 + 2, (unint64_t)&a1[a2], (unsigned __int8 *)v79, &v76);
        if ((_DWORD)appended)
          goto LABEL_341;
        v68 = a7;
        appended = _AppendDomainNameStringEx((uint64_t)v73, (uint64_t)" ", a6, (const char *)v79);
        if ((_DWORD)appended)
          goto LABEL_341;
        v37 = v76;
        if ((unint64_t)v76 >= v14)
        {
LABEL_347:
          a7 = v68;
          goto LABEL_333;
        }
        while (2)
        {
          if (v14 - (unint64_t)v37 >= 4)
          {
            v38 = (const char *)__rev16(*(unsigned __int16 *)v37);
            v39 = *((unsigned __int16 *)v37 + 1);
            v40 = _DNSSVCBKeyToString((int)v38);
            if (v40)
            {
              v41 = v40;
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_349;
              v67 = v41;
              appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " %s=\"");
            }
            else
            {
              if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
              if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                goto LABEL_349;
              v67 = v38;
              appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, " key%u=\"");
            }
            if ((_DWORD)appended)
              goto LABEL_341;
            v42 = (const char *)__rev16(v39);
            v43 = v37 + 1;
            v76 = v37 + 1;
            if (v14 - (unint64_t)(v37 + 1) >= v42)
            {
              switch((int)v38)
              {
                case 0:
                  if ((v42 & 1) != 0)
                    goto LABEL_350;
                  v44 = (unsigned int *)&v42[(_QWORD)v43];
                  if ((const char *)v43 >= &v42[(_QWORD)v43])
                    goto LABEL_238;
                  v45 = 0;
                  v46 = 1;
                  do
                  {
                    v47 = (const char *)__rev16(*(unsigned __int16 *)v43);
                    v76 = (unsigned int *)((char *)v43 + 2);
                    v48 = _DNSSVCBKeyToString((int)v47);
                    if ((v46 & 1) == 0)
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                        goto LABEL_349;
                      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%s", v45);
                      if ((_DWORD)appended)
                        goto LABEL_341;
                    }
                    if (v48)
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                        goto LABEL_349;
                      v67 = v48;
                      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%s");
                    }
                    else
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                        goto LABEL_349;
                      v67 = v47;
                      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "key%u");
                    }
                    if ((_DWORD)appended)
                      goto LABEL_341;
                    v46 = 0;
                    v43 = v76;
                    v45 = ",";
                  }
                  while (v76 < v44);
                  goto LABEL_238;
                case 1:
                  v49 = (unsigned int *)&v42[(_QWORD)v43];
                  if (v43 >= v49)
                    goto LABEL_238;
                  v50 = 0;
                  v51 = 1;
                  while (1)
                  {
                    v76 = (unsigned int *)((char *)v43 + 1);
                    v52 = *(unsigned __int8 *)v43;
                    if ((char *)v49 - ((char *)v43 + 1) < v52)
                      goto LABEL_350;
                    v43 = (unsigned int *)((char *)v43 + 1);
                    if ((v51 & 1) == 0)
                    {
                      if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                        dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                      if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                        goto LABEL_349;
                      appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%s", v50);
                      if ((_DWORD)appended)
                        goto LABEL_341;
                      v43 = v76;
                    }
                    for (i = (unsigned int *)((char *)v43 + v52); v43 < i; v76 = v43)
                    {
                      v54 = (const char *)*(unsigned __int8 *)v43;
                      if (((_DWORD)v54 - 32) > 0x5E)
                      {
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                          goto LABEL_349;
                        v67 = v54;
                        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\\%03d");
                      }
                      else if ((_DWORD)v54 == 92 || (_DWORD)v54 == 44)
                      {
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                          goto LABEL_349;
                        v67 = v54;
                        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\\%c");
                      }
                      else
                      {
                        if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                          dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                        if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                          goto LABEL_349;
                        v67 = v54;
                        appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%c");
                      }
                      if ((_DWORD)appended)
                        goto LABEL_341;
                      v43 = (unsigned int *)((char *)v76 + 1);
                    }
                    v51 = 0;
                    v50 = ",";
                    if (v43 >= v49)
                      goto LABEL_238;
                  }
                case 2:
                  goto LABEL_163;
                case 3:
                  if ((_DWORD)v42 != 2)
                    goto LABEL_350;
                  v55 = *((unsigned __int16 *)v37 + 2);
                  v76 = (unsigned int *)&v42[(_QWORD)v43];
                  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                    goto LABEL_349;
                  appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%u", __rev16(v55));
                  if ((_DWORD)appended)
                    goto LABEL_341;
                  goto LABEL_238;
                case 4:
                  if ((v42 & 3) != 0)
                    goto LABEL_350;
                  v56 = (unsigned int *)&v42[(_QWORD)v43];
                  if (v43 >= v56)
                    goto LABEL_238;
                  v57 = "";
                  while (2)
                  {
                    CUSymAddr_DataBuffer_AppendF_sAddr = _AppendIPv4Address((uint64_t)v73, (uint64_t)v57, v43, a6);
                    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
                      goto LABEL_342;
                    v43 = v76 + 1;
                    v76 = v43;
                    if (v43 < v56)
                    {
                      v57 = ",";
                      continue;
                    }
                    goto LABEL_238;
                  }
                case 5:
                  goto LABEL_159;
                case 6:
                  if ((v42 & 0xF) != 0)
                    goto LABEL_350;
                  v59 = (unsigned int *)&v42[(_QWORD)v43];
                  if (v43 >= v59)
                    goto LABEL_238;
                  v60 = "";
                  while (2)
                  {
                    CUSymAddr_DataBuffer_AppendF_sAddr = _AppendIPv6Address((uint64_t)v73, (uint64_t)v60, (uint64_t)v43, a6);
                    if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
                      goto LABEL_342;
                    v43 = v76 + 4;
                    v76 = v43;
                    if (v43 < v59)
                    {
                      v60 = ",";
                      continue;
                    }
                    goto LABEL_238;
                  }
                default:
                  if ((_DWORD)v38 == 32769)
                  {
LABEL_159:
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                      goto LABEL_349;
                    v67 = (const char *)v76;
                    appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%.4H");
                  }
                  else
                  {
LABEL_163:
                    if (!a6)
                    {
                      v61 = (unsigned int *)&v42[(_QWORD)v43];
                      while (v43 < v61)
                      {
                        v62 = (const char *)*(unsigned __int8 *)v43;
                        if (((_DWORD)v62 - 33) > 0x5D)
                        {
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                            goto LABEL_349;
                          v67 = v62;
                          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\\%03d");
                        }
                        else if (((_DWORD)v62 - 34) > 0x3A
                               || ((1 << (v62 - 34)) & 0x4000000020000C1) == 0)
                        {
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                            goto LABEL_349;
                          v67 = v62;
                          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "%c");
                        }
                        else
                        {
                          if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                            dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                          if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                            goto LABEL_349;
                          v67 = v62;
                          appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\\%c");
                        }
                        if ((_DWORD)appended)
                          goto LABEL_341;
                        v43 = (unsigned int *)((char *)v76 + 1);
                        v76 = (unsigned int *)((char *)v76 + 1);
                      }
                      goto LABEL_238;
                    }
                    if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                      dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                    if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                      goto LABEL_349;
                    v67 = v42;
                    appended = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "<%u redacted bytes>");
                  }
                  if ((_DWORD)appended)
                    goto LABEL_341;
                  v76 = (unsigned int *)&v42[(_QWORD)v76];
LABEL_238:
                  if (_GetCUSymAddr_DataBuffer_AppendF_sOnce != -1)
                    dispatch_once(&_GetCUSymAddr_DataBuffer_AppendF_sOnce, &__block_literal_global_213);
                  if (!_GetCUSymAddr_DataBuffer_AppendF_sAddr)
                    goto LABEL_349;
                  CUSymAddr_DataBuffer_AppendF_sAddr = _GetCUSymAddr_DataBuffer_AppendF_sAddr(v73, "\"", v67);
                  if ((_DWORD)CUSymAddr_DataBuffer_AppendF_sAddr)
                    goto LABEL_342;
                  v37 = v76;
                  if ((unint64_t)v76 >= v14)
                    goto LABEL_347;
                  continue;
              }
            }
          }
          break;
        }
        CUSymAddr_DataBuffer_AppendF_sAddr = 4294960546;
      }
LABEL_342:
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
  char __str[16];
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
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
          *(_OWORD *)__str = 0u;
          v18 = 0u;
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
  v7 = "";
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
        v16 = off_24FEC28C8[v15];
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
    return off_24FEC28C8[a1];
}

uint64_t _AppendIPAddress(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  uint64_t result;
  _OWORD v9[2];
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
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
  v10 = 0;
  memset(v9, 0, sizeof(v9));
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
  const char *v5;

  if (_NameIsPrivate(a3))
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
    if (_GetCUSymAddr_SNPrintF_sAddr)
    {
      v5 = "%~s";
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, v5);
    }
  }
  else
  {
    if (_GetCUSymAddr_SNPrintF_sOnce != -1)
      dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
    if (_GetCUSymAddr_SNPrintF_sAddr)
    {
      v5 = "%s";
      return _GetCUSymAddr_SNPrintF_sAddr(a1, a2, v5);
    }
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
  _OWORD v9[2];
  char v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a4 != 16 && a4 != 4)
    return 4294960553;
  if (_GetCUSymAddr_SNPrintF_sOnce != -1)
    dispatch_once(&_GetCUSymAddr_SNPrintF_sOnce, &__block_literal_global_244);
  if (!_GetCUSymAddr_SNPrintF_sAddr)
    return 4294960561;
  v10 = 0;
  memset(v9, 0, sizeof(v9));
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

char *dnssec_result_to_description(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_24FEC2990[a1];
}

char *dnssec_insecure_validation_state_to_description(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_24FEC29B0[a1];
}

uint64_t OSLogCopyFormattedString(const char *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  const char **v6;
  uint64_t v7;
  const char **v8;
  _WORD *v9;
  int v10;
  id v11;
  unsigned __int8 *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (stricmp_prefix())
    {
      v5 = 0;
      v6 = (const char **)&off_24FEC29D0;
      while (strcasecmp(a1, *v6))
      {
        ++v5;
        v6 += 2;
        if (v5 == 5)
          goto LABEL_15;
      }
      ((void (*)(id))(&off_24FEC29D0)[2 * v5 + 1])(v4);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    v9 = bsearch(a1 + 3, &DNSRecordTypeStringToValue_sTable, 0x5AuLL, 0x10uLL, (int (__cdecl *)(const void *, const void *))_DNSRecordTypeStringToValueCmp);
    if (v9)
    {
      v10 = (unsigned __int16)v9[4];
      if (v9[4])
      {
        v11 = objc_retainAutorelease(v4);
        v12 = (unsigned __int8 *)objc_msgSend(v11, "bytes");
        v13 = objc_msgSend(v11, "length");

        _log_mdns_create_record_data_attributed_string(v12, v13, v10);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_18:
        v15 = v14;

        goto LABEL_20;
      }
    }
LABEL_15:

    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_16:
    v15 = 0;
    goto LABEL_20;
  }
  v7 = 0;
  v8 = (const char **)&off_24FEC2A20;
  while (strcasecmp(a1, *v8))
  {
    ++v7;
    v8 += 2;
    if (v7 == 19)
      goto LABEL_16;
  }
  ((void (*)(id))(&off_24FEC2A20)[2 * v7 + 1])(v3);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v15;
}

id _log_mdns_create_record_data_attributed_string(unsigned __int8 *a1, unint64_t a2, int a3)
{
  void *v3;
  void *v4;
  void *v5;

  _log_mdns_create_record_data_string(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    _log_mdns_create_attributed_string(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id _log_mdns_format_acceptable(void *a1)
{
  if (objc_msgSend(a1, "BOOLValue"))
    return _log_mdns_create_attributed_string(CFSTR("acceptable"));
  else
    return _log_mdns_create_attributed_string(CFSTR("unacceptable"));
}

id _log_mdns_format_add_rmv(void *a1)
{
  if (objc_msgSend(a1, "BOOLValue"))
    return _log_mdns_create_attributed_string(CFSTR("add"));
  else
    return _log_mdns_create_attributed_string(CFSTR("rmv"));
}

id _log_mdns_format_add_rmv_uppercase(void *a1)
{
  if (objc_msgSend(a1, "BOOLValue"))
    return _log_mdns_create_attributed_string(CFSTR("ADD"));
  else
    return _log_mdns_create_attributed_string(CFSTR("RMV"));
}

id _log_mdns_format_dns_counts(void *a1)
{
  unint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = objc_msgSend(a1, "unsignedLongLongValue");
  v2 = (void *)objc_msgSend(objc_alloc((Class)&off_255E84340), "initWithFormat:", CFSTR("%u/%u/%u/%u"), HIWORD(v1), WORD2(v1), WORD1(v1), (unsigned __int16)v1);
  v3 = v2;
  if (v2)
  {
    _log_mdns_create_attributed_string(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id _log_mdns_format_dns_record_type(void *a1)
{
  unint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = objc_msgSend(a1, "unsignedLongLongValue");
  if (v1 >> 16)
  {
    v4 = 0;
  }
  else
  {
    _log_mdns_create_dns_record_type_string((unsigned __int16)v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    if (v2)
    {
      _log_mdns_create_attributed_string(v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

id _log_mdns_format_dns_id_and_flags(void *a1)
{
  unint64_t v1;
  unsigned __int16 v3;
  char v4;
  char v5;
  uint64_t v6;

  v1 = objc_msgSend(a1, "unsignedLongLongValue");
  if (HIDWORD(v1))
    return 0;
  v6 = 0;
  LOBYTE(v3) = BYTE3(v1);
  HIBYTE(v3) = BYTE2(v1);
  v4 = BYTE1(v1);
  v5 = v1;
  _log_mdns_format_dns_message_ex(&v3, 0xCuLL, 64);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _log_mdns_format_dns_service_type(void *a1)
{
  unint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = objc_msgSend(a1, "unsignedLongLongValue");
  v2 = 0;
  if (v1 <= 0xFF && v1 <= 5u)
  {
    +[NSString stringWithUTF8String:](&off_255E84340, "stringWithUTF8String:", off_24FEC1EC0[v1]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      _log_mdns_create_attributed_string(v3);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  return v2;
}

id _log_mdns_format_dnssec_insecure_validation_state(void *a1)
{
  unint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = objc_msgSend(a1, "unsignedLongLongValue");
  if (v1 <= 3)
  {
    +[NSString stringWithUTF8String:](&off_255E84340, "stringWithUTF8String:", off_24FEC29B0[v1]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      _log_mdns_create_attributed_string(v3);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id _log_mdns_format_dnssec_result(void *a1)
{
  unint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = objc_msgSend(a1, "unsignedLongLongValue");
  if (v1 <= 3)
  {
    +[NSString stringWithUTF8String:](&off_255E84340, "stringWithUTF8String:", off_24FEC2990[v1]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      _log_mdns_create_attributed_string(v3);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = 0;
    }

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

uint64_t _log_mdns_format_err()
{
  return NSPrintTypedObject();
}

id _log_mdns_format_gai_options(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  const char *v5;
  void *v6;

  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc((Class)&off_255E84430), "initWithCapacity:", 0);
  if (v2)
  {
    v3 = objc_msgSend(v1, "unsignedLongLongValue");
    objc_msgSend(v2, "appendFormat:", CFSTR("0x%llX {"), v3);
    v4 = 0;
    v5 = "";
    do
    {
      if ((v3 & byte_24FEC2B50[v4]) != 0)
      {
        objc_msgSend(v2, "appendFormat:", CFSTR("%s%s"), v5, *(_QWORD *)&byte_24FEC2B50[v4 + 8]);
        v5 = ", ";
      }
      v4 += 16;
    }
    while (v4 != 80);
    objc_msgSend(v2, "appendString:", CFSTR("}"));
    _log_mdns_create_attributed_string(v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id _log_mdns_format_mortality(void *a1)
{
  unint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "longLongValue");
  if (v1 > 2)
  {
    v2 = 0;
  }
  else
  {
    _log_mdns_create_attributed_string(*(&off_24FEC2BA0 + v1));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id _log_mdns_format_negative_reason(void *a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "longLongValue");
  v2 = 0;
  if (v1 == (int)v1 && v1 <= 5)
  {
    _log_mdns_create_attributed_string(*(&off_24FEC2BB8 + (int)v1));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id _log_mdns_format_positive_negative(void *a1)
{
  if (objc_msgSend(a1, "BOOLValue"))
    return _log_mdns_create_attributed_string(CFSTR("positive"));
  else
    return _log_mdns_create_attributed_string(CFSTR("negative"));
}

id _log_mdns_format_protocol(void *a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "longLongValue");
  v2 = 0;
  if (v1 == (int)v1 && v1 <= 4)
  {
    _log_mdns_create_attributed_string(*(&off_24FEC2BE8 + (int)v1));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

id _log_mdns_format_session_event(void *a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "longLongValue");
  if (v1 == (int)v1 && (v1 - 1) <= 3)
  {
    _log_mdns_create_attributed_string(*(&off_24FEC2C10 + (v1 - 1)));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

id _log_mdns_format_termination_reason(void *a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "longLongValue");
  v2 = 0;
  if (v1 == (int)v1 && v1 <= 5)
  {
    _log_mdns_create_attributed_string(*(&off_24FEC2C30 + (int)v1));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t _log_mdns_format_time_duration()
{
  return NSPrintTypedObject();
}

id _log_mdns_format_yes_no(void *a1)
{
  if (objc_msgSend(a1, "BOOLValue"))
    return _log_mdns_create_attributed_string(CFSTR("yes"));
  else
    return _log_mdns_create_attributed_string(CFSTR("no"));
}

id _log_mdns_create_attributed_string(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  v2 = (void *)objc_msgSend(objc_alloc((Class)&off_255E83EA0), "initWithString:", v1);

  return v2;
}

id _log_mdns_format_dns_message_ex(unsigned __int16 *a1, unint64_t a2, int a3)
{
  id v3;
  void *v4;
  void *v5;
  char *__s;

  __s = 0;
  DNSMessageToString(a1, a2, a3 | 4, (uint64_t)&__s);
  if (!__s)
    return 0;
  v3 = objc_alloc((Class)&off_255E84340);
  v4 = (void *)objc_msgSend(v3, "initWithBytesNoCopy:length:encoding:freeWhenDone:", __s, strlen(__s), 4, 1);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc((Class)&off_255E83EA0), "initWithString:", v4);
  }
  else if (__s)
  {
    free(__s);
    v5 = 0;
    __s = 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id _log_mdns_create_dns_record_type_string(uint64_t a1)
{
  const char *v2;
  id v3;
  void *v4;

  v2 = DNSRecordTypeValueToString(a1);
  v3 = objc_alloc((Class)&off_255E84340);
  if (v2)
    v4 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%s"), v2);
  else
    v4 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("TYPE%u"), a1);
  return v4;
}

id _log_mdns_format_base64(void *a1)
{
  id v1;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");

  Base64EncodeCopyEx();
  return 0;
}

id _log_mdns_format_dns_header(void *a1)
{
  id v1;
  unsigned __int16 *v2;
  unint64_t v3;

  v1 = objc_retainAutorelease(a1);
  v2 = (unsigned __int16 *)objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");

  return _log_mdns_format_dns_message_ex(v2, v3, 16);
}

id _log_mdns_format_dns_message(void *a1)
{
  id v1;
  unsigned __int16 *v2;
  unint64_t v3;

  v1 = objc_retainAutorelease(a1);
  v2 = (unsigned __int16 *)objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");

  return _log_mdns_format_dns_message_ex(v2, v3, 0);
}

unsigned __int8 *_log_mdns_format_record_data(void *a1)
{
  unsigned __int8 *v1;
  unint64_t v3;
  unsigned __int16 v4;

  v4 = 0;
  v3 = 0;
  v1 = (unsigned __int8 *)_log_mdns_extract_record_type_and_rdata(a1, &v4, (uint64_t *)&v3);
  if (v1)
  {
    _log_mdns_create_record_data_attributed_string(v1, v3, v4);
    v1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

unsigned __int8 *_log_mdns_format_record_type_data(void *a1)
{
  unsigned __int8 *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v7;
  unsigned __int16 v8;

  v8 = 0;
  v7 = 0;
  v1 = (unsigned __int8 *)_log_mdns_extract_record_type_and_rdata(a1, &v8, (uint64_t *)&v7);
  if (v1)
  {
    _log_mdns_create_dns_record_type_string(v8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2
      && ((_log_mdns_create_record_data_string(v1, v7, v8), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
       || (NSPrintF(), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0)))
    {
      v4 = (void *)objc_msgSend(objc_alloc((Class)&off_255E84340), "initWithFormat:", CFSTR("%@ %@"), v2, v3);
      v5 = v4;
      if (v4)
      {
        _log_mdns_create_attributed_string(v4);
        v1 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v1 = 0;
      }

    }
    else
    {
      v1 = 0;
    }

  }
  return v1;
}

unsigned __int16 *_log_mdns_extract_record_type_and_rdata(void *a1, _WORD *a2, uint64_t *a3)
{
  id v5;
  id v6;
  unsigned __int16 *v7;
  unsigned __int16 *v8;
  unsigned int v9;
  uint64_t v10;

  v5 = a1;
  if ((unint64_t)objc_msgSend(v5, "length") < 2)
  {
    LOWORD(v9) = 0;
    v10 = 0;
    v8 = 0;
    if (!a2)
      goto LABEL_6;
    goto LABEL_5;
  }
  v6 = objc_retainAutorelease(v5);
  v7 = (unsigned __int16 *)objc_msgSend(v6, "bytes");
  v8 = v7 + 1;
  v9 = bswap32(*v7) >> 16;
  v10 = objc_msgSend(v6, "length") - 2;
  if (a2)
LABEL_5:
    *a2 = v9;
LABEL_6:
  if (a3)
    *a3 = v10;

  return v8;
}

id _log_mdns_create_record_data_string(unsigned __int8 *a1, unint64_t a2, int a3)
{
  size_t v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  char *__s;

  __s = 0;
  DNSRecordDataToStringEx(a1, a2, a3, 0, 0, 0, (uint64_t)&__s);
  if (!__s)
    return 0;
  v3 = strlen(__s);
  v4 = objc_alloc((Class)&off_255E84340);
  v5 = (void *)objc_msgSend(v4, "initWithBytesNoCopy:length:encoding:freeWhenDone:", __s, v3, 4, 1);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else if (__s)
  {
    free(__s);
    __s = 0;
  }

  return v6;
}

uint64_t _log_mdns_negative_reason_to_string(unsigned int a1)
{
  if (a1 > 5)
    return 0;
  else
    return (uint64_t)*(&off_24FEC2BB8 + a1);
}

uint64_t _log_mdns_protocol_to_string(unsigned int a1)
{
  if (a1 > 4)
    return 0;
  else
    return (uint64_t)*(&off_24FEC2BE8 + a1);
}

uint64_t _log_mdns_session_event_to_string(int a1)
{
  if ((a1 - 1) > 3)
    return 0;
  else
    return (uint64_t)*(&off_24FEC2C10 + (a1 - 1));
}

uint64_t _log_mdns_termination_reason_to_string(unsigned int a1)
{
  if (a1 > 5)
    return 0;
  else
    return (uint64_t)*(&off_24FEC2C30 + a1);
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

uint64_t Base64EncodeCopyEx()
{
  return MEMORY[0x24BE28E10]();
}

uint64_t NSPrintF()
{
  return MEMORY[0x24BE296C0]();
}

uint64_t NSPrintTypedObject()
{
  return MEMORY[0x24BE296D0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x24BDAD310](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

uint64_t stricmp_prefix()
{
  return MEMORY[0x24BE29BF0]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

