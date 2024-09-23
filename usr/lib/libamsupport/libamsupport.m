uint64_t DERParseSequenceToObject(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t result;
  unint64_t v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  memset(v12, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v12, 0);
  if (!(_DWORD)result)
  {
    if (v12[0] == 0x2000000000000010)
      return DERParseSequenceContentToObject(&v12[1], a2, a3, a4, a5, a6);
    else
      return 2;
  }
  return result;
}

uint64_t DERParseSequenceContentToObject(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int16 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;
  unsigned __int16 v17;
  __int16 v18;
  unint64_t v19;
  char *v21;
  uint64_t v23;
  unint64_t v24;
  __int16 *v25;
  unint64_t v26;
  __int16 v27;
  unint64_t v28;
  char *v29;
  unint64_t v31[3];
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v32 = 0;
  if (a6)
  {
    if (a6 > a5)
      goto LABEL_59;
    bzero((void *)a4, a6);
  }
  v10 = *a1;
  v11 = a1[1];
  if (__CFADD__(*a1, v11))
    goto LABEL_58;
  v12 = v10 + v11;
  if (v10 > v12)
LABEL_59:
    __break(0x5519u);
  v32 = *a1;
  v33 = v12;
  if (a2)
  {
    v13 = 0;
    v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      v15 = v32;
      v14 = v33;
      result = DERDecodeSeqNext(&v32, v31);
      if ((_DWORD)result)
        break;
      if (a2 <= v13)
        return 2;
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3)
          goto LABEL_58;
        v17 = v13;
        v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(_QWORD *)(a3 + 24 * v13 + 8))
          break;
        result = 2;
        if ((v18 & 1) != 0)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1))
            continue;
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        v19 = *(_QWORD *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5)
          return 7;
        if (v19 > ~a4)
          goto LABEL_58;
        v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4)
          goto LABEL_59;
        *(_OWORD *)v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((_QWORD *)v21 + 1) <= v14 - v15)
            {
              *(_QWORD *)v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29)
            goto LABEL_59;
          v23 = *((_QWORD *)v21 + 1);
          v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15)
            goto LABEL_59;
          *(_QWORD *)v21 = v15;
          *((_QWORD *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            v10 = v31[1] + v31[2];
            v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        v10 = v32;
        v12 = v33;
        goto LABEL_47;
      }
    }
    if ((_DWORD)result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        v25 = (__int16 *)(a3 + 24 * v13 + 16);
        v26 = a2 - (unint64_t)v13;
        result = 0;
        while (1)
        {
          v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0)
            break;
          if (!--v26)
            return result;
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12)
      return 0;
    else
      return 3;
  }
  return result;
}

uint64_t DERDecodeSeqNext(unint64_t *a1, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  v2 = *a1;
  v3 = a1[1];
  if (*a1 >= v3)
    return 1;
  v10[0] = *a1;
  v10[1] = v3 - v2;
  result = DERDecodeItemPartialBufferGetLength((uint64_t)v10, a2, 0);
  if (!(_DWORD)result)
  {
    v8 = a2[1];
    v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t DERDecodeItemPartialBufferGetLength(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  _BYTE *v4;
  _BYTE *v5;
  unsigned __int8 *v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  BOOL v10;
  unint64_t v11;
  char *v12;
  unsigned __int8 v13;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unsigned int v24;
  BOOL v25;
  char v26;
  unint64_t v27;
  _BYTE *v28;

  v3 = *(_QWORD *)(result + 8);
  if (v3 < 2)
    return 3;
  v4 = *(_BYTE **)result;
  if (*(_QWORD *)result == -1)
    goto LABEL_68;
  v5 = &v4[v3];
  v6 = v4 + 1;
  v7 = v3 - 1;
  v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4)
        goto LABEL_69;
      v14 = v12 + 1;
      v15 = *v12;
      v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15)
            v17 = *v12;
          else
            v17 = v7 - 1;
          v10 = v5 >= v14;
          v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3)
              return 0;
LABEL_34:
            result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8)
        return 3;
      if ((v15 & 0x7F) == 0 || v16 < v19)
        return 3;
      if (v14 >= v5 || v14 < v4)
        goto LABEL_69;
      if (!*v14)
        return 3;
      v15 = 0;
      v21 = (v19 - 1);
      v22 = v7 - v21 - 2;
      v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (_BYTE *)-1)
      {
        if (v14 >= v5)
          goto LABEL_69;
        v10 = v16-- != 0;
        if (!v10)
          goto LABEL_70;
        v24 = *v14++;
        v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!(_DWORD)v19)
        {
          if (a3)
            v25 = 0;
          else
            v25 = v15 > v22;
          v26 = v25;
          result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0)
            return result;
          if (v15 >= v22)
            v27 = v22;
          else
            v27 = v15;
          v10 = (unint64_t)v5 >= v23;
          v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28)
            goto LABEL_69;
          a2[1] = v23;
          a2[2] = v27;
          if (a3)
            goto LABEL_34;
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  v9 = *v6;
  v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10)
    return 3;
  v8 = 0;
  result = 3;
  while (v7 >= 2)
  {
    v11 = v8;
    if (v8 >> 57)
      break;
    if (v6 == (unsigned __int8 *)-1)
      goto LABEL_68;
    if (v6 >= v5 || v6 < v4)
      goto LABEL_69;
    v12 = (char *)(v6 + 1);
    --v7;
    v13 = *v6;
    v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54)
        return 3;
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t DERDecodeSeqInit(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  memset(v8, 170, 24);
  result = DERDecodeItemPartialBufferGetLength(a1, v8, 0);
  if (!(_DWORD)result)
  {
    v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t DERParseInteger(char **a1, _DWORD *a2)
{
  uint64_t result;
  unint64_t v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  result = DERParseInteger64(a1, v4);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t DERParseInteger64(char **a1, unint64_t *a2)
{
  unint64_t v2;
  unsigned __int8 *v3;
  uint64_t result;
  unint64_t v5;
  unsigned int v6;

  v2 = (unint64_t)a1[1];
  if (!v2)
    return 3;
  v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0)
    return 3;
  if (**a1)
  {
    if (v2 > 8)
      return 7;
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0)
      return 3;
    if (v2 > 9)
      return 7;
  }
LABEL_10:
  v5 = 0;
  do
  {
    v6 = *v3++;
    v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t AMSupportEcCreateKeyFromPEMBuffer()
{
  return 13;
}

uint64_t AMSupportEcDsaCreateSignature()
{
  return 13;
}

uint64_t AMSupportEcDsaVerifySignature(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t cp;
  size_t v11;
  uint64_t *v12;
  uint64_t result;
  int v14;
  int v15;
  _BYTE v16[7];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  ccec_x963_import_pub_size();
  if (!ccec_keysize_is_supported())
    return 13;
  cp = ccec_get_cp();
  MEMORY[0x24BDAC7A8]();
  v12 = (uint64_t *)&v16[-v11];
  bzero(&v16[-v11], v11);
  *v12 = cp;
  result = 1;
  if (a1 && a5 && a7)
  {
    v14 = ccec_import_pub();
    if (v14 == -13)
      return 2;
    if (v14)
      return 6;
    v15 = ccec_verify();
    if (v15 == -13)
      return 2;
    if (v15)
    {
      return 6;
    }
    else if (v17)
    {
      return 0;
    }
    else
    {
      return 6;
    }
  }
  return result;
}

uint64_t AMSupportEcDsaCreateSignatureSha256(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  result = 1;
  if (a1 && a3 && a5)
  {
    memset(v16, 0, sizeof(v16));
    result = AMSupportDigestSha256(a1);
    if (!(_DWORD)result)
    {
      v15 = MEMORY[0x20BD2DF5C](result, v12, v13, v14);
      return AMSupportEcDsaCreateSignatureWithCp(v15, (uint64_t)v16, 32, a3, a4, a5, a6);
    }
  }
  return result;
}

uint64_t AMSupportEcDsaCreateSignatureWithCp(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, _QWORD *a7)
{
  size_t v12;
  size_t v13;
  _QWORD *v14;
  uint64_t result;
  void *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v12 = (((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
  v18[0] = v12;
  MEMORY[0x24BDAC7A8]();
  v14 = (_QWORD *)((char *)v18 - v13);
  bzero((char *)v18 - v13, v13);
  result = 1;
  if (a2 && a4 && a6)
  {
    *v14 = a1;
    if (!ccec_der_import_priv())
    {
      v16 = malloc_type_calloc(1uLL, v12, 0xD65B37A4uLL);
      if (v16)
      {
        v17 = v16;
        ccDRBGGetRngState();
        result = ccec_sign();
        if (!(_DWORD)result)
        {
          *a6 = v17;
          *a7 = v18[0];
          return result;
        }
        free(v17);
      }
    }
    return 99;
  }
  return result;
}

uint64_t AMSupportEcDsaCreateSignatureSha384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v18[3];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  result = 1;
  if (a1 && a3 && a5)
  {
    memset(v18, 0, sizeof(v18));
    result = AMSupportDigestSha384(a1);
    if (!(_DWORD)result)
    {
      v17 = MEMORY[0x20BD2DF68](result, v12, v13, v14, v15, v16);
      return AMSupportEcDsaCreateSignatureWithCp(v17, (uint64_t)v18, 48, a3, a4, a5, a6);
    }
  }
  return result;
}

uint64_t AMSupportEcDsaCreateSignatureSha512(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _OWORD v20[4];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  result = 1;
  if (a1 && a3 && a5)
  {
    memset(v20, 0, sizeof(v20));
    result = AMSupportDigestSha512(a1);
    if (!(_DWORD)result)
    {
      v19 = MEMORY[0x20BD2DF68](result, v12, v13, v14, v15, v16, v17, v18);
      return AMSupportEcDsaCreateSignatureWithCp(v19, (uint64_t)v20, 64, a3, a4, a5, a6);
    }
  }
  return result;
}

uint64_t AMSupportDigestMd5(uint64_t a1)
{
  if (!a1)
    return 1;
  ccdigest();
  return 0;
}

uint64_t AMSupportDigestSha1(uint64_t a1)
{
  if (!a1)
    return 1;
  ccdigest();
  return 0;
}

uint64_t AMSupportDigestSha256(uint64_t a1)
{
  if (!a1)
    return 1;
  if (!sha256_digest_info)
    sha256_digest_info = ccsha256_di();
  ccdigest();
  return 0;
}

uint64_t AMSupportDigestSha384(uint64_t a1)
{
  if (!a1)
    return 1;
  ccdigest();
  return 0;
}

uint64_t AMSupportDigestSha512(uint64_t a1)
{
  if (!a1)
    return 1;
  ccdigest();
  return 0;
}

uint64_t AMSupportDigestInitContext(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v7;

  if (!a1)
    return 1;
  v4 = *a1;
  if (*a1 == 48)
  {
    v5 = ccsha384_di();
  }
  else if (v4 == 32)
  {
    v5 = ccsha256_di();
  }
  else
  {
    if (v4 != 20)
      return 13;
    v5 = ccsha1_di();
  }
  a1[2] = v5;
  v7 = malloc_type_malloc(*(_QWORD *)(v5 + 8) + *(_QWORD *)(v5 + 16) + 12, 0xD85256EFuLL);
  *a2 = v7;
  if (!v7)
    return 2;
  ccdigest_init();
  return 0;
}

uint64_t AMSupportDigestUpdate(uint64_t a1)
{
  if (!a1)
    return 1;
  if (!*(_QWORD *)(a1 + 16))
    return 1;
  ccdigest_update();
  return 0;
}

uint64_t AMSupportDigestFinal(uint64_t a1)
{
  uint64_t v1;

  if (!a1)
    return 1;
  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 1;
  (*(void (**)(void))(v1 + 56))();
  return 0;
}

uint64_t AMSupportDigestReturnHash(unint64_t *a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v5;

  if (!a1)
    return 1;
  v5 = a1[2];
  if (!v5 || *a1 > a4)
    return 1;
  (*(void (**)(void))(v5 + 56))();
  return 0;
}

uint64_t AMSupportDigestCompute(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t result;
  _QWORD *v8;

  result = 1;
  if (a1 && a2 && a3 && a5)
  {
    if (*a5 == a4 && (v8 = (_QWORD *)a5[2]) != 0 && *v8)
    {
      ccdigest();
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t AMSupportX509DecodeVerifyCertIssuer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  _OWORD v33[2];
  _QWORD v34[2];
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = *(_QWORD *)(a2 + 136);
  if (v8 == *(_QWORD *)(a1 + 104) && !memcmp(*(const void **)(a2 + 128), *(const void **)(a1 + 96), v8))
  {
    memset(v33, 0, sizeof(v33));
    v32 = 0;
    v30 = 0;
    v31 = 0;
    if (DERParseSequenceContent((unint64_t *)(a1 + 16), (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)v33, 0x20uLL))
    {
      v17 = "decodeAlgId failed";
LABEL_12:
      AMSupportLogInternal(3, (uint64_t)"AMSupportX509DecodeVerifyCertIssuer", (uint64_t)v17, v12, v13, v14, v15, v16, v29);
      return 19;
    }
    if (DERParseBitString(a1 + 32, (unint64_t *)&v30, &v32))
    {
      v17 = "DERParseBitString(sig) failed";
      goto LABEL_12;
    }
    if (v32)
    {
      v17 = "numUnused != 0";
      goto LABEL_12;
    }
    v18 = *(_QWORD *)(a2 + 208);
    v19 = *(_DWORD *)(a2 + 216);
    v20 = v30;
    v21 = v31;
    v22 = *(_QWORD *)a1;
    v34[0] = *(_QWORD *)&v33[0];
    v34[1] = DWORD2(v33[0]);
    if (DEROidCompare((uint64_t)v34, (uint64_t)&oidSha1Rsa))
    {
      v35 = 0uLL;
      LODWORD(v36) = 0;
      if (AMSupportDigestSha1(v22)
        || AMSupportRsaVerifySignatureSha1(v18, v19, v20, v21, (uint64_t)&v35, 20))
      {
        goto LABEL_23;
      }
    }
    else
    {
      if (!DEROidCompare((uint64_t)v34, (uint64_t)&oidSha256Rsa))
      {
        v28 = 13;
LABEL_22:
        AMSupportLogInternal(3, (uint64_t)"AMSupportX509DecodeVerifyCertIssuer", (uint64_t)"PKI: cert signature validation with issuer pubkey failed amstatus=%d", v23, v24, v25, v26, v27, v28);
        return 18;
      }
      v35 = 0u;
      v36 = 0u;
      if (AMSupportDigestSha256(v22)
        || AMSupportRsaVerifySignatureSha256(v18, v19, v20, v21, (uint64_t)&v35, 32))
      {
LABEL_23:
        v28 = 6;
        goto LABEL_22;
      }
    }
    AMSupportLogInternal(7, (uint64_t)"AMSupportX509DecodeVerifyCertIssuer", (uint64_t)"PKI: verify cert was issued and signed by issuer (success)", v23, v24, v25, v26, v27, v29);
    return 0;
  }
  AMSupportLogInternal(3, (uint64_t)"AMSupportX509DecodeVerifyCertIssuer", (uint64_t)"PKI: cert was not issued by issuer (subject != issuer)", a4, a5, a6, a7, a8, v29);
  return 18;
}

uint64_t AMSupportX509DecodeParseDERLengthFromBuffer(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  result = 1;
  if (a1 && a3)
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17[0] = a1;
    v17[1] = a2;
    if (DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v14, &v13))
    {
      v11 = "failed to decode DER";
    }
    else
    {
      if (v13)
      {
        if (v13 >= ~(v15 - a1))
        {
          AMSupportLogInternal(3, (uint64_t)"AMSupportX509DecodeParseDERLengthFromBuffer", (uint64_t)"encoded size will overrun DERSize", v6, v7, v8, v9, v10, v12);
          return 22;
        }
        else
        {
          result = 0;
          *a3 = v15 - a1 + v13;
        }
        return result;
      }
      v11 = "encodedSize is 0";
    }
    AMSupportLogInternal(3, (uint64_t)"AMSupportX509DecodeParseDERLengthFromBuffer", (uint64_t)v11, v6, v7, v8, v9, v10, v12);
    return 99;
  }
  return result;
}

uint64_t AMSupportX509DecodeCertificate(unint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  uint64_t v5;
  _BYTE *v6;
  char v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  result = 1;
  if (a1 && a2 && a3)
  {
    *(_OWORD *)(a1 + 256) = 0u;
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_OWORD *)(a1 + 192) = 0u;
    *(_OWORD *)(a1 + 208) = 0u;
    *(_OWORD *)(a1 + 160) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_QWORD *)(a1 + 256) = a2;
    *(_QWORD *)(a1 + 264) = a3;
    if (DERParseSequence(a1 + 256, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a1, 0x30uLL))return 19;
    if (DERParseSequence(a1, 0xAu, (uint64_t)&AMSupportX509DERTBSCertItemSpecs, a1 + 48, 0xA0uLL))
      return 19;
    v8 = 0u;
    v9 = 0u;
    v7 = 0;
    if (DERParseSequence(a1 + 144, (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v8, 0x20uLL))return 19;
    if (DERParseSequenceContent((unint64_t *)&v8, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, a1 + 224, 0x20uLL))return 19;
    if (!DEROidCompare(a1 + 224, (uint64_t)&oidRsa))
      return 19;
    v5 = *(_QWORD *)(a1 + 248);
    if (v5)
    {
      if (v5 != 2)
        return 19;
      v6 = *(_BYTE **)(a1 + 240);
      if (*v6 != 5 || v6[1])
        return 19;
    }
    if (DERParseBitString((uint64_t)&v9, (unint64_t *)(a1 + 208), &v7) || v7)
      return 19;
    else
      return 0;
  }
  return result;
}

uint64_t AMSupportX509DecodeIterateCertChainBegin(_QWORD *a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;

  result = 1;
  if (a1 && a2)
  {
    if (a3)
    {
      result = 0;
      *a1 = a2;
      a1[1] = a3;
      a1[2] = 0;
    }
  }
  return result;
}

uint64_t AMSupportX509DecodeIterateCertChainNext(uint64_t a1, unint64_t *a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 1;
  result = 1;
  if (a2)
  {
    v6 = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
    {
      v7 = *(_QWORD *)(a1 + 8);
      if (v7)
      {
        v12 = 0;
        if (AMSupportX509DecodeParseDERLengthFromBuffer(v6, v7, &v12))
        {
          return 19;
        }
        else
        {
          v9 = *(_QWORD *)(a1 + 8);
          if (v9 < v12)
          {
            return 22;
          }
          else
          {
            result = AMSupportX509DecodeCertificate(*a2, *(_QWORD *)a1, v9);
            if (!(_DWORD)result)
            {
              v10 = *(unsigned __int16 *)(a1 + 16);
              *(_WORD *)(a1 + 16) = v10 + 1;
              *a3 = v10;
              v11 = *(_QWORD *)(a1 + 8) - v12;
              *(_QWORD *)a1 += v12;
              *(_QWORD *)(a1 + 8) = v11;
            }
          }
        }
      }
      else
      {
        result = 0;
        *a2 = 0;
      }
    }
  }
  return result;
}

uint64_t AMSupportRsaCreateSignatureSha1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t *a6)
{
  uint64_t v9;
  size_t v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v16 = 0;
  v9 = ccrsa_import_priv_n();
  MEMORY[0x24BDAC7A8]();
  v11 = (uint64_t *)((char *)&v15 - v10);
  bzero((char *)&v15 - v10, v10);
  *v11 = v9;
  if (ccrsa_import_priv())
    return 6;
  if (AMSupportDigestSha1(a1))
    return 6;
  v16 = 8 * v9;
  v12 = malloc_type_calloc(1uLL, 8 * v9, 0x64DE7348uLL);
  if (!v12)
    return 6;
  v13 = v12;
  result = ccrsa_sign_pkcs1v15();
  if ((_DWORD)result)
  {
    free(v13);
    return 6;
  }
  *a5 = v13;
  *a6 = v16;
  return result;
}

uint64_t AMSupportRsaCreateSignatureSha256(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t *a6)
{
  uint64_t v9;
  size_t v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  v16 = 0;
  v9 = ccrsa_import_priv_n();
  MEMORY[0x24BDAC7A8]();
  v11 = (uint64_t *)((char *)&v15 - v10);
  bzero((char *)&v15 - v10, v10);
  *v11 = v9;
  if (ccrsa_import_priv())
    return 6;
  if (AMSupportDigestSha256(a1))
    return 6;
  v16 = 8 * v9;
  v12 = malloc_type_calloc(1uLL, 8 * v9, 0x73E04CFEuLL);
  if (!v12)
    return 6;
  v13 = v12;
  result = ccrsa_sign_pkcs1v15();
  if ((_DWORD)result)
  {
    free(v13);
    return 6;
  }
  *a5 = v13;
  *a6 = v16;
  return result;
}

uint64_t AMSupportRsaCreateSignatureSha384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t *a6)
{
  uint64_t v9;
  size_t v10;
  uint64_t *v11;
  void *v12;
  void *v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  v16 = 0;
  v9 = ccrsa_import_priv_n();
  MEMORY[0x24BDAC7A8]();
  v11 = (uint64_t *)((char *)&v15 - v10);
  bzero((char *)&v15 - v10, v10);
  *v11 = v9;
  if (ccrsa_import_priv())
    return 6;
  if (AMSupportDigestSha384(a1))
    return 6;
  v16 = 8 * v9;
  v12 = malloc_type_calloc(1uLL, 8 * v9, 0xB5D0E932uLL);
  if (!v12)
    return 6;
  v13 = v12;
  result = ccrsa_sign_pkcs1v15();
  if ((_DWORD)result)
  {
    free(v13);
    return 6;
  }
  *a5 = v13;
  *a6 = v16;
  return result;
}

uint64_t AMSupportRsaCreateSignatureSha512()
{
  return 13;
}

uint64_t AMSupportRsaVerifySignatureSha1(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  int v7;
  unsigned int v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = a1;
  v10[1] = a2;
  v6 = 6;
  if (a6 == 20)
  {
    v7 = verify_pkcs1_sig((uint64_t)v10);
    if (v7)
      v8 = 6;
    else
      v8 = 0;
    if (v7 == -13)
      return 2;
    else
      return v8;
  }
  return v6;
}

uint64_t verify_pkcs1_sig(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  unint64_t v5;
  uint64_t result;
  BOOL v7;
  _OWORD v8[2];
  _QWORD v9[2];
  uint64_t v10;
  _QWORD v11[202];

  v11[201] = *MEMORY[0x24BDAC8D0];
  v11[199] = 0;
  v11[200] = 0;
  bzero(v11, 0x638uLL);
  v10 = 64;
  v2 = *(unsigned int *)(a1 + 8);
  v9[0] = *(_QWORD *)a1;
  v9[1] = v2;
  memset(v8, 0, sizeof(v8));
  if (DERParseSequence((uint64_t)v9, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)v8, 0x20uLL))return 0xFFFFFFFFLL;
  v3 = *((_QWORD *)&v8[0] + 1);
  v4 = *(_BYTE **)&v8[0];
  if (*((_QWORD *)&v8[0] + 1))
  {
    v5 = 7;
    while (!*v4)
    {
      ++v4;
      if (!--v3)
        goto LABEL_10;
    }
    v5 = v3 + 7;
    if ((unint64_t)(v3 + 7) >= 0x208)
      return 0xFFFFFFFFLL;
  }
  else
  {
    v5 = 7;
  }
LABEL_10:
  v10 = v5 >> 3;
  result = ccrsa_make_pub();
  if (!(_DWORD)result)
  {
    if (MEMORY[0x24BDAD800])
      v7 = MEMORY[0x24BDAC2C0] == 0;
    else
      v7 = 1;
    if (v7)
    {
      LOBYTE(v8[0]) = 0;
      result = ccrsa_verify_pkcs1v15();
      if (!(_DWORD)result && LOBYTE(v8[0]))
        return 0;
    }
    else
    {
      result = ccrsa_verify_pkcs1v15_digest();
      if (!(_DWORD)result)
      {
        cc_cmp_safe();
        return 0;
      }
    }
  }
  return result;
}

uint64_t AMSupportRsaVerifySignatureSha256(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  int v7;
  unsigned int v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = a1;
  v10[1] = a2;
  v6 = 6;
  if (a6 == 32)
  {
    v7 = verify_pkcs1_sig((uint64_t)v10);
    if (v7)
      v8 = 6;
    else
      v8 = 0;
    if (v7 == -13)
      return 2;
    else
      return v8;
  }
  return v6;
}

uint64_t AMSupportRsaVerifySignatureSha384(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  int v7;
  unsigned int v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x24BDAC8D0];
  v10[0] = a1;
  v10[1] = a2;
  v6 = 6;
  if (a6 == 48)
  {
    v7 = verify_pkcs1_sig((uint64_t)v10);
    if (v7)
      v8 = 6;
    else
      v8 = 0;
    if (v7 == -13)
      return 2;
    else
      return v8;
  }
  return v6;
}

uint64_t AMSupportRsaVerifySignatureSha512()
{
  return 13;
}

uint64_t AMSupportRsaCreateKeyFromPEMBuffer(uint64_t a1, size_t a2, int a3, int a4, char **a5, size_t *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  size_t v13;
  BOOL v14;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  size_t v20;
  uint64_t *v21;
  size_t v22;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28[2];

  v28[1] = *(char **)MEMORY[0x24BDAC8D0];
  v27 = 0;
  v28[0] = 0;
  v25 = 0;
  v26 = 0;
  if (a3 == a4)
  {
    v11 = AMSupportRsaCreateDataFromPem(a1, a2, &v26, &v25, (uint64_t)a5, (uint64_t)a6, a7, a8);
    v12 = v26;
    if ((_DWORD)v11)
    {
      v10 = v11;
      goto LABEL_24;
    }
    if (!v26)
    {
      v10 = 14;
      goto LABEL_26;
    }
    v13 = v25;
    if (v25 >= 0x19)
    {
      v14 = *(_QWORD *)v26 == 0x9060D3022018230 && *((_QWORD *)v26 + 1) == 0x1010DF78648862ALL;
      if (v14 && *((_QWORD *)v26 + 2) == 0xF018203000501)
      {
        v13 = v25 - 24;
        v16 = (char *)malloc_type_calloc(1uLL, v25 - 24, 0xC6A4A4D6uLL);
        v12 = v26;
        if (!v16)
        {
          v10 = 2;
          goto LABEL_24;
        }
        v17 = v16;
        memcpy(v16, v26 + 24, v13);
        free(v26);
        v25 = v13;
        v12 = v17;
      }
    }
    v10 = 0;
    *a5 = v12;
    *a6 = v13;
    v26 = 0;
    goto LABEL_26;
  }
  if (a4 && !a3)
  {
    v10 = 6;
    goto LABEL_26;
  }
  v18 = AMSupportRsaCreateDataFromPem(a1, a2, v28, &v27, (uint64_t)a5, (uint64_t)a6, a7, a8);
  if ((_DWORD)v18)
  {
    v10 = v18;
    goto LABEL_26;
  }
  v19 = ccrsa_import_priv_n();
  MEMORY[0x24BDAC7A8]();
  v21 = (uint64_t *)((char *)&v24 - v20);
  bzero((char *)&v24 - v20, v20);
  *v21 = v19;
  if (ccrsa_import_priv())
  {
    v12 = 0;
LABEL_33:
    v10 = 6;
    goto LABEL_24;
  }
  ccrsa_ctx_public();
  v22 = MEMORY[0x20BD2DFE0]();
  v25 = v22;
  v12 = (char *)malloc_type_calloc(1uLL, v22, 0xB8F6E168uLL);
  v26 = v12;
  if (v12)
  {
    if (!ccrsa_export_pub())
    {
      v10 = 0;
      *a5 = v12;
      *a6 = v22;
      v26 = 0;
      v12 = 0;
      goto LABEL_24;
    }
    goto LABEL_33;
  }
  v10 = 2;
LABEL_24:
  if (v12)
    free(v12);
LABEL_26:
  if (v28[0])
    free(v28[0]);
  return v10;
}

uint64_t AMSupportRsaCreatePrivateKeyFromPEMBuffer(uint64_t a1, size_t a2, char **a3, size_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return AMSupportRsaCreateKeyFromPEMBuffer(a1, a2, 1, 1, a3, a4, a7, a8);
}

uint64_t AMSupportRsaCreatePublicKeyFromPEMBuffer(uint64_t a1, size_t a2, char **a3, size_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return AMSupportRsaCreateKeyFromPEMBuffer(a1, a2, 0, 0, a3, a4, a7, a8);
}

uint64_t AMSupportRsaCreatePublicKeyFromPrivateKeyPEMBuffer(uint64_t a1, size_t a2, char **a3, size_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return AMSupportRsaCreateKeyFromPEMBuffer(a1, a2, 1, 0, a3, a4, a7, a8);
}

uint64_t AMSupportRsaCreateDataFromPem(uint64_t a1, size_t size, char **a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  size_t v19;
  uint64_t v20;
  char v21;
  int v22;
  BOOL v23;
  unsigned int v24;
  int v25;
  uint64_t result;
  const char *v27;
  char v28;

  if (!a1)
  {
    v27 = "pemBuffer == NULL";
LABEL_22:
    AMSupportLogInternal(3, (uint64_t)"AMSupportRsaCreateDataFromPem", (uint64_t)v27, (uint64_t)a4, a5, a6, a7, a8, v28);
    return 1;
  }
  if (!size)
  {
    v27 = "pemBufferLength == 0";
    goto LABEL_22;
  }
  if (!a3)
  {
    v27 = "outData == NULL";
    goto LABEL_22;
  }
  if (!a4)
  {
    v27 = "outDataLength == NULL";
    goto LABEL_22;
  }
  v12 = (char *)malloc_type_calloc(1uLL, size, 0xCB20347uLL);
  if (v12)
  {
    v18 = v12;
    v19 = 0;
    v20 = 0;
    do
    {
      v21 = 0;
      while (1)
      {
        v22 = *(unsigned __int8 *)(a1 + v19);
        if (v22 != 45)
        {
          v23 = v22 == 10 || v22 == 13;
          if (v23 || (v21 & 1) == 0)
            break;
        }
        ++v19;
        v21 = 1;
        if (v19 >= size)
        {
          v24 = v20;
          goto LABEL_17;
        }
      }
      ++v19;
      v24 = v20 + 1;
      v12[v20++] = v22;
    }
    while (v19 < size);
LABEL_17:
    v25 = _base64decode(v12, v24);
    result = 0;
    *a4 = v25;
    *a3 = v18;
  }
  else
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportRsaCreateDataFromPem", (uint64_t)"base64Buffer == NULL", v13, v14, v15, v16, v17, v28);
    return 2;
  }
  return result;
}

uint64_t AMSupportRsaCreatePemFromData(unsigned __int8 *a1, uint64_t a2, const void *a3, uint64_t a4, const void *a5, size_t a6, _QWORD *a7, uint64_t a8)
{
  size_t v9;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  size_t v21;
  size_t v22;
  size_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  size_t v31;
  size_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  size_t v38;
  uint64_t v39;
  const char *v41;
  const char *v42;
  const char *v43;
  char v44;
  _QWORD *v45;

  if (!a1)
  {
    v41 = "data == NULL";
LABEL_33:
    AMSupportLogInternal(3, (uint64_t)"AMSupportRsaCreatePemFromData", (uint64_t)v41, a4, (uint64_t)a5, a6, (uint64_t)a7, a8, v44);
    v30 = 0;
    v20 = 0;
    v39 = 1;
    goto LABEL_24;
  }
  if (!a2)
  {
    v41 = "dataLength == 0";
    goto LABEL_33;
  }
  if (!a3)
  {
    v41 = "header == NULL";
    goto LABEL_33;
  }
  v9 = a4;
  if (!a4)
  {
    v41 = "headerLength == 0";
    goto LABEL_33;
  }
  if (!a5)
  {
    v41 = "footer == NULL";
    goto LABEL_33;
  }
  if (!a6)
  {
    v41 = "footerLength == 0";
    goto LABEL_33;
  }
  if (!a7)
  {
    v41 = "outPemData == NULL";
    goto LABEL_33;
  }
  if (!a8)
  {
    v41 = "outPemLength == NULL";
    goto LABEL_33;
  }
  v14 = _base64encode(a1, a2);
  v20 = (char *)v14;
  if (!v14)
  {
    v42 = "encodedBuffer == NULL";
LABEL_36:
    AMSupportLogInternal(3, (uint64_t)"AMSupportRsaCreatePemFromData", (uint64_t)v42, v15, v16, v17, v18, v19, v44);
    v30 = 0;
LABEL_40:
    v39 = 99;
    goto LABEL_24;
  }
  v21 = strlen(v14);
  if (!v21)
  {
    v42 = "encodedLength == 0";
    goto LABEL_36;
  }
  v22 = v21;
  if ((v21 & 0x3F) != 0)
    v23 = a6 + v9 + v21 + (v21 >> 6) + 1;
  else
    v23 = a6 + v9 + v21 + (v21 >> 6);
  v24 = malloc_type_calloc(1uLL, v23, 0xA770E1A8uLL);
  v30 = v24;
  if (v24)
  {
    v45 = (_QWORD *)a8;
    memcpy(v24, a3, v9);
    v31 = 0;
    do
    {
      if (v22 - v31 >= 0x40)
        v32 = 64;
      else
        v32 = v22 - v31;
      memcpy(&v30[v9], &v20[v31], v32);
      v31 += v32;
      v38 = v32 + v9;
      v9 += v32 + 1;
      v30[v38] = 10;
    }
    while (v31 < v22);
    if (v31 != v22)
    {
      v43 = "encodedLocation != encodedLength";
LABEL_39:
      AMSupportLogInternal(3, (uint64_t)"AMSupportRsaCreatePemFromData", (uint64_t)v43, v33, v34, v35, v36, v37, v44);
      goto LABEL_40;
    }
    memcpy(&v30[v9], a5, a6);
    if (v9 + a6 != v23)
    {
      v43 = "pemLocation != pemLength";
      goto LABEL_39;
    }
    v39 = 0;
    *a7 = v30;
    *v45 = v23;
    v30 = 0;
  }
  else
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportRsaCreatePemFromData", (uint64_t)"pemString == NULL", v25, v26, v27, v28, v29, v44);
    v39 = 2;
  }
LABEL_24:
  free(v30);
  free(v20);
  return v39;
}

uint64_t AMSupportCreateArrayFromFileURL(const __CFAllocator *a1, _QWORD *a2, const __CFURL *a3)
{
  uint64_t v3;
  uint64_t DataFromFileURL;
  CFPropertyListRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFErrorRef error;
  CFDataRef data[2];

  data[1] = *(CFDataRef *)MEMORY[0x24BDAC8D0];
  error = 0;
  data[0] = 0;
  v3 = 1;
  if (a2 && a3)
  {
    DataFromFileURL = AMSupportPlatformCreateDataFromFileURL(a1, (CFTypeRef *)data, a3);
    if ((_DWORD)DataFromFileURL)
    {
      v3 = DataFromFileURL;
    }
    else
    {
      if (!data[0])
      {
        v3 = 14;
        goto LABEL_10;
      }
      v7 = CFPropertyListCreateWithData(a1, data[0], 0, 0, &error);
      if (v7)
      {
        v3 = 0;
        *a2 = v7;
      }
      else
      {
        AMSupportLogInternal(3, (uint64_t)"AMSupportCreateArrayFromFileURL", (uint64_t)"failed to create property list: %@", v8, v9, v10, v11, v12, (char)error);
        v3 = 2;
      }
    }
  }
  if (data[0])
    CFRelease(data[0]);
LABEL_10:
  if (error)
    CFRelease(error);
  return v3;
}

void AMSupportSafeRelease(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

uint64_t AMSupportCreateDictionaryFromFileURL(const __CFAllocator *a1, CFTypeRef *a2, const __CFURL *a3)
{
  const void *v3;
  uint64_t v4;
  uint64_t DataFromFileURL;
  CFPropertyListRef v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFErrorRef error;
  CFDataRef data[2];

  v3 = 0;
  data[1] = *(CFDataRef *)MEMORY[0x24BDAC8D0];
  error = 0;
  data[0] = 0;
  v4 = 1;
  if (a2 && a3)
  {
    DataFromFileURL = AMSupportPlatformCreateDataFromFileURL(a1, (CFTypeRef *)data, a3);
    if ((_DWORD)DataFromFileURL)
    {
      v4 = DataFromFileURL;
      v3 = 0;
    }
    else
    {
      if (!data[0])
      {
        v3 = 0;
        v4 = 14;
        goto LABEL_10;
      }
      v8 = CFPropertyListCreateWithData(a1, data[0], 0, 0, &error);
      v3 = v8;
      if (v8)
      {
        v4 = 0;
        *a2 = CFRetain(v8);
      }
      else
      {
        v4 = 3;
        AMSupportLogInternal(3, (uint64_t)"AMSupportCreateDictionaryFromFileURL", (uint64_t)"failed to create property list: %@", v9, v10, v11, v12, v13, (char)error);
      }
    }
  }
  if (data[0])
    CFRelease(data[0]);
LABEL_10:
  if (error)
    CFRelease(error);
  if (v3)
    CFRelease(v3);
  return v4;
}

uint64_t AMSupportWriteDictionarytoFileURL(const __CFAllocator *a1, const void *a2, const __CFURL *a3)
{
  return AMSupportWriteDictionarytoFileURLWithFormat(a1, a2, a3, kCFPropertyListXMLFormat_v1_0);
}

uint64_t AMSupportWriteDictionarytoFileURLWithFormat(const __CFAllocator *a1, const void *a2, const __CFURL *a3, CFPropertyListFormat format)
{
  uint64_t v4;
  const __CFData *Data;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFData *v12;
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  error[0] = 0;
  v4 = 1;
  if (a2 && a3)
  {
    Data = CFPropertyListCreateData(a1, a2, format, 0, error);
    if (Data)
    {
      v12 = Data;
      v4 = AMSupportPlatformWriteDataToFileURL(Data, a3);
      CFRelease(v12);
    }
    else
    {
      v4 = 3;
      AMSupportLogInternal(3, (uint64_t)"AMSupportWriteDictionarytoFileURLWithFormat", (uint64_t)"failed to create data: %@", v7, v8, v9, v10, v11, (char)error[0]);
    }
    if (error[0])
      CFRelease(error[0]);
  }
  return v4;
}

uint64_t AMSupportWriteDictionarytoFileURLBinary(const __CFAllocator *a1, const void *a2, const __CFURL *a3)
{
  return AMSupportWriteDictionarytoFileURLWithFormat(a1, a2, a3, kCFPropertyListBinaryFormat_v1_0);
}

CFTypeRef AMSupportSafeRetain(CFTypeRef cf)
{
  if (cf)
    return CFRetain(cf);
  return cf;
}

void AMSupportSafeFree(void *a1)
{
  if (a1)
    free(a1);
}

void AMSupportCFDictionarySetInteger64(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, v7);
  if (!v5)
    AMSupportCFDictionarySetInteger64_cold_1();
  v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void AMSupportCFDictionarySetInteger32(__CFDictionary *a1, const void *a2, int a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  int valuePtr;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  if (!v5)
    AMSupportCFDictionarySetInteger32_cold_1();
  v6 = v5;
  CFDictionarySetValue(a1, a2, v5);
  CFRelease(v6);
}

void AMSupportCFDictionarySetBoolean(__CFDictionary *a1, const void *a2, int a3)
{
  const void **v3;

  v3 = (const void **)MEMORY[0x24BDBD270];
  if (!a3)
    v3 = (const void **)MEMORY[0x24BDBD268];
  CFDictionarySetValue(a1, a2, *v3);
}

uint64_t AMSupportCFDictionaryGetBoolean(const void *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeID TypeID;
  const __CFBoolean *Value;
  const __CFBoolean *v13;
  CFTypeID v14;
  const char *v16;
  char v17;

  if (!a1)
  {
    v16 = "dict is NULL";
LABEL_11:
    AMSupportLogInternal(3, (uint64_t)"AMSupportCFDictionaryGetBoolean", (uint64_t)v16, a4, a5, a6, a7, a8, v17);
    return a3;
  }
  if (!a2)
  {
    v16 = "key is NULL";
    goto LABEL_11;
  }
  TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(a1))
  {
    v16 = "dict is not CFDictionary";
    goto LABEL_11;
  }
  Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)a1, a2);
  if (Value)
  {
    v13 = Value;
    v14 = CFBooleanGetTypeID();
    if (v14 == CFGetTypeID(v13))
      return CFBooleanGetValue(v13);
    v16 = "dict value is not CFBoolean";
    goto LABEL_11;
  }
  return a3;
}

uint64_t AMSupportCopySetValueAtTypedKeypath(CFStringRef theString, const __CFString *a2, const __CFString *a3, const __CFDictionary **a4)
{
  uint64_t v4;
  const __CFAllocator *v8;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v10;
  CFTypeRef URLFromString;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFArray *v16;
  CFIndex v17;
  const __CFString *ValueAtIndex;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  CFNumberRef v22;
  const char *v23;
  CFTypeRef *v24;
  const __CFDictionary *v25;
  char v27;
  int valuePtr;
  CFTypeRef cf[2];

  cf[1] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  cf[0] = 0;
  v4 = 1;
  if (!theString || !a4 || !*a4)
    return v4;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings((CFAllocatorRef)*MEMORY[0x24BDBD240], theString, CFSTR(":"));
  if (!ArrayBySeparatingStrings)
    return 2;
  v10 = ArrayBySeparatingStrings;
  if (CFArrayGetCount(ArrayBySeparatingStrings) < 1)
  {
    v4 = 2;
    goto LABEL_43;
  }
  if (CFArrayGetCount(v10) >= 4)
  {
    v23 = "Too many delimiters in argument";
    goto LABEL_52;
  }
  if (!a2 && CFArrayGetCount(v10) <= 1)
  {
    v23 = "Too few delimiters in argument";
    goto LABEL_52;
  }
  if (CFArrayGetCount(v10) == 1)
  {
    v16 = v10;
    v17 = 0;
LABEL_13:
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v16, v17);
    goto LABEL_14;
  }
  if (CFArrayGetCount(v10) == 2)
  {
    a2 = (const __CFString *)CFArrayGetValueAtIndex(v10, 0);
    v16 = v10;
    v17 = 1;
    goto LABEL_13;
  }
  if (CFArrayGetCount(v10) == 3)
  {
    a2 = (const __CFString *)CFArrayGetValueAtIndex(v10, 0);
    ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v10, 2);
    a3 = (const __CFString *)CFArrayGetValueAtIndex(v10, 1);
  }
  else
  {
    a2 = 0;
    ValueAtIndex = 0;
  }
LABEL_14:
  if (a3)
  {
    if (CFStringCompare(a3, CFSTR("sint32"), 1uLL) == kCFCompareEqualTo)
    {
      valuePtr = 0;
      if (!AMSupportCFStringToUInt32(ValueAtIndex, &valuePtr))
      {
        v21 = "Failed to convert argument to uint32";
        goto LABEL_21;
      }
      v22 = CFNumberCreate(v8, kCFNumberSInt32Type, &valuePtr);
      cf[0] = v22;
      if (!v22)
      {
        v21 = "tmpResult (Number) is NULL";
        goto LABEL_21;
      }
      URLFromString = v22;
      goto LABEL_42;
    }
    if (CFStringCompare(a3, CFSTR("data"), 1uLL))
    {
      if (CFStringCompare(a3, CFSTR("BOOL"), 1uLL) == kCFCompareEqualTo)
      {
        if (CFStringCompare(ValueAtIndex, CFSTR("yes"), 1uLL)
          && CFStringCompare(ValueAtIndex, CFSTR("true"), 1uLL)
          && CFStringCompare(ValueAtIndex, CFSTR("1"), 0))
        {
          if (CFStringCompare(ValueAtIndex, CFSTR("no"), 1uLL)
            && CFStringCompare(ValueAtIndex, CFSTR("false"), 1uLL)
            && CFStringCompare(ValueAtIndex, CFSTR("0"), 0))
          {
            v21 = "Unrecognized Boolean value. (yes/no, true/false, 1/0)";
            goto LABEL_21;
          }
          v24 = (CFTypeRef *)MEMORY[0x24BDBD268];
        }
        else
        {
          v24 = (CFTypeRef *)MEMORY[0x24BDBD270];
        }
        URLFromString = *v24;
        cf[0] = *v24;
        goto LABEL_42;
      }
      if (CFStringCompare(a3, CFSTR("string"), 1uLL))
      {
        if (CFStringCompare(a3, CFSTR("url"), 1uLL))
        {
          v21 = "Unrecognized data type.";
LABEL_21:
          AMSupportLogInternal(3, (uint64_t)"AMSupportCopySetValueAtTypedKeypath", (uint64_t)v21, v20, v12, v13, v14, v15, v27);
          v4 = 99;
          goto LABEL_43;
        }
        URLFromString = AMSupportCreateURLFromString(v8, ValueAtIndex, v19, v20, v12, v13, v14, v15);
        cf[0] = URLFromString;
        if (URLFromString)
          goto LABEL_42;
        v23 = "Failed to parse URL.";
        goto LABEL_52;
      }
      URLFromString = CFRetain(ValueAtIndex);
      cf[0] = URLFromString;
LABEL_42:
      v25 = (const __CFDictionary *)AMSupportCopySetValueForKeyPathInDict(v8, *a4, a2, (uint64_t)URLFromString, v12, v13, v14, v15);
      v4 = 0;
      *a4 = v25;
      goto LABEL_43;
    }
    if (!AMSupportCopyDataFromHexString(v8, ValueAtIndex, (CFDataRef *)cf))
    {
      URLFromString = cf[0];
      if (cf[0])
        goto LABEL_42;
    }
    v23 = "Failed to parse hex encoded data.";
  }
  else
  {
    v23 = "No default type, nor one specified in argument";
  }
LABEL_52:
  AMSupportLogInternal(3, (uint64_t)"AMSupportCopySetValueAtTypedKeypath", (uint64_t)v23, (uint64_t)URLFromString, v12, v13, v14, v15, v27);
  v4 = 1;
LABEL_43:
  CFRelease(v10);
  if (cf[0])
    CFRelease(cf[0]);
  return v4;
}

uint64_t AMSupportCFStringToUInt32(const __CFString *a1, _DWORD *a2)
{
  uint64_t result;
  _OWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  memset(v4, 0, sizeof(v4));
  result = CFStringGetCString(a1, (char *)v4, 32, 0x600u);
  if ((_DWORD)result)
  {
    *__error() = 0;
    *a2 = strtol((const char *)v4, 0, 0);
    return *__error() == 0;
  }
  return result;
}

uint64_t AMSupportCopyDataFromHexString(const __CFAllocator *a1, CFStringRef theString, CFDataRef *a3)
{
  uint64_t v3;
  CFDataRef v6;
  _OWORD v8[32];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 1;
  if (theString)
  {
    if (a3)
    {
      memset(v8, 0, sizeof(v8));
      v3 = 3;
      if (CFStringGetCString(theString, (char *)v8, 512, 0x8000100u))
      {
        v6 = AMSupportCopyDataFromAsciiEncodedHex(a1, v8, 0x200uLL);
        *a3 = v6;
        if (v6)
          return 0;
        else
          return 3;
      }
    }
  }
  return v3;
}

CFURLRef AMSupportCreateURLFromString(const __CFAllocator *a1, const __CFString *cf, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeID v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFTypeID v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if (!cf)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCreateURLFromString", (uint64_t)"%s: theString is NULL", a4, a5, a6, a7, a8, (char)"AMSupportCreateURLFromString");
    return 0;
  }
  v10 = CFGetTypeID(cf);
  if (v10 == CFURLGetTypeID())
  {
    AMSupportLogInternal(4, (uint64_t)"AMSupportCreateURLFromString", (uint64_t)"%s: CFURLRef passed, retaining copy", v11, v12, v13, v14, v15, (char)"AMSupportCreateURLFromString");
    return (CFURLRef)CFRetain(cf);
  }
  v17 = CFGetTypeID(cf);
  if (v17 != CFStringGetTypeID())
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCreateURLFromString", (uint64_t)"%s: invalid string", v18, v19, v20, v21, v22, (char)"AMSupportCreateURLFromString");
    return 0;
  }
  if (CFStringFind(cf, CFSTR("://"), 0).location == -1)
    return CFURLCreateWithFileSystemPath(a1, cf, kCFURLPOSIXPathStyle, 0);
  else
    return CFURLCreateWithString(a1, cf, 0);
}

CFTypeRef AMSupportCopySetValueForKeyPathInDict(const __CFAllocator *a1, const __CFDictionary *a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeRef v9;
  CFIndex location;
  CFIndex v13;
  CFIndex v14;
  CFStringRef v15;
  CFStringRef v16;
  CFStringRef v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFStringRef v23;
  const __CFDictionary *Value;
  const __CFDictionary *v25;
  CFTypeID v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CFMutableDictionaryRef Mutable;
  CFIndex Count;
  __CFDictionary *MutableCopy;
  __CFDictionary *v35;
  __CFDictionary *v36;
  void *v37;
  __CFDictionary *v38;
  const char *v40;
  char v41;
  CFRange v42;
  CFRange v43;

  if (!a2)
  {
    v40 = "dict is NULL";
LABEL_27:
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopySetValueForKeyPathInDict", (uint64_t)v40, a4, a5, a6, a7, a8, v41);
    return 0;
  }
  if (!a3)
  {
    v40 = "keyPath is NULL";
    goto LABEL_27;
  }
  v9 = (CFTypeRef)a4;
  if (!a4)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopySetValueForKeyPathInDict", (uint64_t)"value is NULL", 0, a5, a6, a7, a8, v41);
    return v9;
  }
  location = CFStringFind(a3, CFSTR("."), 0).location;
  if (location == -1)
  {
    Count = CFDictionaryGetCount(a2);
    MutableCopy = CFDictionaryCreateMutableCopy(a1, Count, a2);
    if (MutableCopy)
    {
      v35 = MutableCopy;
      CFDictionarySetValue(MutableCopy, a3, v9);
      v9 = CFRetain(v35);
      v36 = v35;
LABEL_21:
      CFRelease(v36);
      return v9;
    }
    return 0;
  }
  v13 = location;
  v14 = location + 1;
  v42.length = CFStringGetLength(a3) - (location + 1);
  v42.location = v14;
  v15 = CFStringCreateWithSubstring(a1, a3, v42);
  if (!v15)
  {
    v40 = "failed to create key substring";
    goto LABEL_27;
  }
  v16 = v15;
  v43.location = 0;
  v43.length = v13;
  v17 = CFStringCreateWithSubstring(a1, a3, v43);
  if (!v17)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopySetValueForKeyPathInDict", (uint64_t)"failed to create current substring", v18, v19, v20, v21, v22, v41);
    CFRelease(v16);
    return 0;
  }
  v23 = v17;
  Value = (const __CFDictionary *)CFDictionaryGetValue(a2, v17);
  if (Value)
  {
    v25 = Value;
    v26 = CFGetTypeID(Value);
    if (v26 == CFDictionaryGetTypeID())
    {
      Mutable = CFDictionaryCreateMutableCopy(a1, 0, v25);
      goto LABEL_13;
    }
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopySetValueForKeyPathInDict", (uint64_t)"item %@ not a dictionary", v27, v28, v29, v30, v31, (char)v23);
    v9 = 0;
    Mutable = 0;
LABEL_16:
    v37 = 0;
    goto LABEL_17;
  }
  Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    v9 = 0;
    goto LABEL_16;
  }
LABEL_13:
  v37 = (void *)AMSupportCopySetValueForKeyPathInDict(a1, Mutable, v16, v9);
  v38 = CFDictionaryCreateMutableCopy(a1, 0, a2);
  v9 = v38;
  if (v38)
    CFDictionarySetValue(v38, v23, v37);
LABEL_17:
  CFRelease(v16);
  CFRelease(v23);
  if (Mutable)
    CFRelease(Mutable);
  if (v37)
  {
    v36 = (__CFDictionary *)v37;
    goto LABEL_21;
  }
  return v9;
}

CFArrayRef AMSupportCFArrayCreateWithObjects(const __CFAllocator *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CFIndex v9;
  void **v10;
  void *v11;
  void **v13;
  void *values[2];
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
  uint64_t v30;

  v9 = 0;
  v30 = *MEMORY[0x24BDAC8D0];
  v13 = (void **)&a9;
  v28 = 0u;
  v29 = 0u;
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
  *(_OWORD *)values = 0u;
  v15 = 0u;
  while (1)
  {
    v10 = v13++;
    v11 = *v10;
    if (!v11)
      break;
    values[v9++] = v11;
    if (v9 == 32)
      return 0;
  }
  return CFArrayCreate(a1, (const void **)values, v9, MEMORY[0x24BDBD690]);
}

uint64_t AMSupportHexAsciiToNumeric(unsigned int a1, _BYTE *a2)
{
  char v3;
  uint64_t result;
  __darwin_ct_rune_t v6;

  v3 = a1 - 48;
  if (a1 - 48 >= 0xA)
  {
    if ((a1 & 0x80000000) != 0)
    {
      result = __maskrune(a1, 0x100uLL);
      if (!(_DWORD)result)
        return result;
    }
    else
    {
      result = *(_DWORD *)(MEMORY[0x24BDAC740] + 4 * a1 + 60) & 0x100;
      if (!(_DWORD)result)
        return result;
    }
    v6 = __toupper(a1);
    if (((v6 << 24) - 1174405121) < 0xFAFFFFFF)
      return 0;
    v3 = v6 - 55;
  }
  if (a2)
    *a2 = v3;
  return 1;
}

CFDataRef AMSupportCopyDataFromAsciiEncodedHex(const __CFAllocator *a1, _BYTE *a2, unint64_t a3)
{
  unsigned int v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  char v18;
  char v19;
  int v20;
  CFDataRef result;
  char v22;
  __int16 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return 0;
  if (a3 >= 2 && *a2 == 48)
    v6 = 2 * (((a2[1] - 88) & 0xDF) == 0);
  else
    v6 = 0;
  v7 = malloc_type_malloc(((a3 & 1) + a3 - v6) >> 1, 0x50287D26uLL);
  if (!v7)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopyDataFromAsciiEncodedHex", (uint64_t)"malloc() returned NULL", v8, v9, v10, v11, v12, v22);
    return 0;
  }
  v13 = v7;
  v14 = v6;
  v23 = 0;
  if (v6 >= a3)
    goto LABEL_19;
  v15 = 0;
  v16 = a3 & 1;
  do
  {
    if (!a2[v14])
      break;
    if (!AMSupportHexAsciiToNumeric((char)a2[v14], (_BYTE *)&v23 + 1))
      goto LABEL_19;
    v17 = v6 + 1;
    if (v16)
    {
      v18 = 0;
      v19 = HIBYTE(v23);
      v23 = HIBYTE(v23);
    }
    else
    {
      v20 = a2[v17];
      if (!v20 || !AMSupportHexAsciiToNumeric((char)v20, &v23))
        goto LABEL_19;
      v17 = v6 + 2;
      v18 = HIBYTE(v23);
      v19 = v23;
    }
    v16 = 0;
    v13[v15++] = v19 | (16 * v18);
    v14 = v17;
    v6 = v17;
  }
  while (v17 < a3);
  if (!v15 || (result = CFDataCreateWithBytesNoCopy(a1, v13, v15, (CFAllocatorRef)*MEMORY[0x24BDBD248])) == 0)
  {
LABEL_19:
    free(v13);
    return 0;
  }
  return result;
}

uint64_t AMSupportCopyBytesFromAsciiEncodedHex(_BYTE *a1, unint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  unsigned int v20;
  unsigned int v21;
  int v22;
  uint64_t v23;
  const char *v25;
  char v26;
  __int16 v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v25 = "asciiBuffer is NULL";
LABEL_27:
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopyBytesFromAsciiEncodedHex", (uint64_t)v25, (uint64_t)a4, a5, a6, a7, a8, v26);
    return 1;
  }
  if (!a2)
  {
    v25 = "asciiBufferLength is 0";
    goto LABEL_27;
  }
  if (!a3)
  {
    v25 = "outDataBuffer is NULL";
    goto LABEL_27;
  }
  if (!a4)
  {
    v25 = "outDataBufferLength is NULL";
    goto LABEL_27;
  }
  v12 = malloc_type_malloc(a2 >> 1, 0x3C9B6822uLL);
  if (v12)
  {
    v18 = v12;
    if (a2 >= 2 && *a1 == 48)
      LODWORD(v19) = 2 * (((a1[1] - 88) & 0xDF) == 0);
    else
      LODWORD(v19) = 0;
    v27 = 0;
    v19 = v19;
    if (v19 >= a2)
    {
LABEL_19:
      v23 = 3;
      AMSupportLogInternal(3, (uint64_t)"AMSupportCopyBytesFromAsciiEncodedHex", (uint64_t)"Conversion failed; created 0 bytes of data.",
        v13,
        v14,
        v15,
        v16,
        v17,
        v26);
LABEL_21:
      free(v18);
    }
    else
    {
      v20 = 0;
      v21 = v19 + 2;
      do
      {
        v22 = a1[v19];
        if (!v22)
          break;
        if (!AMSupportHexAsciiToNumeric((char)v22, (_BYTE *)&v27 + 1)
          || !a1[v21 - 1]
          || !AMSupportHexAsciiToNumeric((char)a1[v21 - 1], &v27))
        {
          v23 = 99;
          goto LABEL_21;
        }
        *((_BYTE *)v18 + v20++) = v27 | (16 * HIBYTE(v27));
        v19 = v21;
        v21 += 2;
      }
      while (v19 < a2);
      if (!v20)
        goto LABEL_19;
      v23 = 0;
      *a3 = v18;
      *a4 = v20;
    }
  }
  else
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopyBytesFromAsciiEncodedHex", (uint64_t)"malloc() returned NULL", v13, v14, v15, v16, v17, v26);
    return 2;
  }
  return v23;
}

CFStringRef AMSupportCopyHexStringFromData(const __CFAllocator *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeID TypeID;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const UInt8 *BytePtr;
  unsigned __int8 *v17;
  CFIndex Length;
  int v19;
  CFStringRef v20;
  const char *v22;
  char v23;
  char *cStr;
  size_t v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  cStr = 0;
  if (!a2)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopyHexStringFromData", (uint64_t)"data is NULL", a4, a5, a6, a7, a8, v23);
    return 0;
  }
  v25[0] = 0;
  TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(a2))
  {
    v22 = "CFDataGetTypeID() != CFGetTypeID(data)";
LABEL_19:
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopyHexStringFromData", (uint64_t)v22, v11, v12, v13, v14, v15, v23);
    goto LABEL_20;
  }
  BytePtr = CFDataGetBytePtr((CFDataRef)a2);
  if (!BytePtr)
  {
    v22 = "dataPtr is NULL";
    goto LABEL_19;
  }
  v17 = (unsigned __int8 *)BytePtr;
  Length = CFDataGetLength((CFDataRef)a2);
  if (!Length)
  {
    v22 = "length is 0";
    goto LABEL_19;
  }
  v19 = AMSupportCommonCopyHexStringFromData(v17, Length, &cStr, v25, v12, v13, v14, v15);
  if (!v19)
  {
    if (cStr)
    {
      if (v25[0])
      {
        v20 = CFStringCreateWithCString(a1, cStr, 0x8000100u);
        goto LABEL_9;
      }
      v22 = "bufferLength is 0";
    }
    else
    {
      v22 = "buffer is NULL";
    }
    goto LABEL_19;
  }
  AMSupportLogInternal(3, (uint64_t)"AMSupportCopyHexStringFromData", (uint64_t)"AMSupportCommonCopyHexStringFromData failed %d", v11, v12, v13, v14, v15, v19);
LABEL_20:
  v20 = 0;
LABEL_9:
  if (cStr)
    free(cStr);
  return v20;
}

CFStringRef AMSupportCopyHexStringFromUInt32(const __CFAllocator *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFStringRef v15;
  const char *v17;
  char v18;
  size_t v19;
  char *cStr[2];

  cStr[1] = *(char **)MEMORY[0x24BDAC8D0];
  v19 = 0;
  cStr[0] = 0;
  v9 = AMSupportCommonCopyHexStringFromUInt32(a2, cStr, &v19, a4, a5, a6, a7, a8);
  if (v9)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopyHexStringFromUInt32", (uint64_t)"AMSupportCommonCopyHexStringFromUInt32 failed (%d)", v10, v11, v12, v13, v14, v9);
LABEL_10:
    v15 = 0;
    goto LABEL_5;
  }
  if (!cStr[0])
  {
    v17 = "hexString is NULL";
LABEL_9:
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopyHexStringFromUInt32", (uint64_t)v17, v10, v11, v12, v13, v14, v18);
    goto LABEL_10;
  }
  if (!v19)
  {
    v17 = "stringLength is 0";
    goto LABEL_9;
  }
  v15 = CFStringCreateWithCString(a1, cStr[0], 0x8000100u);
LABEL_5:
  free(cStr[0]);
  return v15;
}

CFStringRef AMSupportCopyHexStringFromUInt64(const __CFAllocator *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFStringRef v15;
  const char *v17;
  char v18;
  size_t v19;
  char *cStr[2];

  cStr[1] = *(char **)MEMORY[0x24BDAC8D0];
  v19 = 0;
  cStr[0] = 0;
  v9 = AMSupportCommonCopyHexStringFromUInt64(a2, cStr, &v19, a4, a5, a6, a7, a8);
  if (v9)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopyHexStringFromUInt64", (uint64_t)"AMSupportCommonCopyHexStringFromUInt64 failed (%d)", v10, v11, v12, v13, v14, v9);
LABEL_10:
    v15 = 0;
    goto LABEL_5;
  }
  if (!cStr[0])
  {
    v17 = "hexString is NULL";
LABEL_9:
    AMSupportLogInternal(3, (uint64_t)"AMSupportCopyHexStringFromUInt64", (uint64_t)v17, v10, v11, v12, v13, v14, v18);
    goto LABEL_10;
  }
  if (!v19)
  {
    v17 = "stringLength is 0";
    goto LABEL_9;
  }
  v15 = CFStringCreateWithCString(a1, cStr[0], 0x8000100u);
LABEL_5:
  free(cStr[0]);
  return v15;
}

uint64_t AMSupportCreateCStringFromCFString(const __CFString *a1, char **a2, CFIndex *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFIndex v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v26;
  char v27;

  if (!a1)
  {
    v26 = "inString is NULL";
LABEL_11:
    AMSupportLogInternal(3, (uint64_t)"AMSupportCreateCStringFromCFString", (uint64_t)v26, a4, a5, a6, a7, a8, v27);
    return 1;
  }
  if (!a2)
  {
    v26 = "outString is NULL";
    goto LABEL_11;
  }
  if (!a3)
  {
    v26 = "outStringLength is NULL";
    goto LABEL_11;
  }
  v11 = CFStringGetLength(a1) + 1;
  v12 = (char *)malloc_type_malloc(v11, 0x91C1D91EuLL);
  if (v12)
  {
    v18 = v12;
    if (CFStringGetCString(a1, v12, v11, 0x8000100u))
    {
      v24 = 0;
      *a2 = v18;
      *a3 = v11;
    }
    else
    {
      v24 = 3;
      AMSupportLogInternal(3, (uint64_t)"AMSupportCreateCStringFromCFString", (uint64_t)"outStringLength is NULL", v19, v20, v21, v22, v23, v27);
      free(v18);
    }
  }
  else
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCreateCStringFromCFString", (uint64_t)"stringBuffer is NULL", v13, v14, v15, v16, v17, v27);
    return 2;
  }
  return v24;
}

uint64_t AMSupportGetUInt32(const __CFNumber *a1, _DWORD *a2)
{
  CFNumberType Type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  const char *v12;
  const char *v14;
  uint64_t v15;
  int valuePtr;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 1;
  valuePtr = 0;
  v15 = 0;
  Type = CFNumberGetType(a1);
  if (Type == kCFNumberSInt64Type)
  {
    if (CFNumberGetValue(a1, kCFNumberSInt64Type, &v15))
    {
      v10 = v15;
      goto LABEL_8;
    }
    v14 = "AMSupportGetUInt32";
    v12 = "%s: failed to convert 64-bit value";
LABEL_10:
    v11 = 3;
    AMSupportLogInternal(3, (uint64_t)"AMSupportGetUInt32", (uint64_t)v12, v5, v6, v7, v8, v9, (char)v14);
    return v11;
  }
  if (Type != kCFNumberSInt32Type)
  {
    LOBYTE(v14) = Type;
    v12 = "Incoming CFNumberRef is of unexpected type %d";
    goto LABEL_10;
  }
  if (!CFNumberGetValue(a1, kCFNumberSInt32Type, &valuePtr))
  {
    v14 = "AMSupportGetUInt32";
    v12 = "%s: failed to convert 32-bit value";
    goto LABEL_10;
  }
  v10 = valuePtr;
LABEL_8:
  v11 = 0;
  *a2 = v10;
  return v11;
}

__CFSet *AMSupportCreateSetFromCFIndexArray(char *a1, CFIndex capacity)
{
  int v2;
  const __CFAllocator *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __CFSet *Mutable;
  CFNumberRef v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFNumberRef v18;
  char v20;

  v2 = capacity;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = capacity;
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], capacity, MEMORY[0x24BDBD6B8]);
  if (Mutable)
  {
    if (v2)
    {
      while (1)
      {
        v12 = CFNumberCreate(v4, kCFNumberLongType, a1);
        if (!v12)
          break;
        v18 = v12;
        CFSetAddValue(Mutable, v12);
        CFRelease(v18);
        a1 += 8;
        if (!--v5)
          goto LABEL_5;
      }
      AMSupportLogInternal(3, (uint64_t)"AMSupportCreateSetFromCFIndexArray", (uint64_t)"AMSupportCreateSetFromCFIndexArray input contains invalid number.", v13, v14, v15, v16, v17, v20);
    }
    else
    {
LABEL_5:
      CFRetain(Mutable);
    }
    CFRelease(Mutable);
  }
  else
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCreateSetFromCFIndexArray", (uint64_t)"AMSupportCreateSetFromCFIndexArray CFSetCreateMutable failed.", v6, v7, v8, v9, v10, v20);
  }
  return Mutable;
}

uint64_t AMSupportRemoveFile(const __CFURL *a1)
{
  uint64_t result;
  BOOL v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  result = AMSupportPlatformFileURLExists(a1, &v3);
  if (!(_DWORD)result)
  {
    if (!v3)
      return 0;
    result = AMSupportPlatformRemoveFile(a1);
    if (!(_DWORD)result)
      return 0;
  }
  return result;
}

uint64_t AMSupportCopyURLWithAppendedComponent(const __CFAllocator *a1, const void *a2, const __CFString *a3, Boolean a4, CFURLRef *a5)
{
  if (a2 && a3 && a5)
    return AMSupportPlatformCopyURLWithAppendedComponent(a1, a2, a3, a4, a5);
  else
    return 1;
}

uint64_t AMSupportCreateDataFromFileURL(const __CFAllocator *a1, CFTypeRef *a2, CFTypeRef cf)
{
  uint64_t DataFromFileURL;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFTypeRef cfa[2];

  cfa[1] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  cfa[0] = 0;
  DataFromFileURL = 1;
  if (a2 && cf)
  {
    v6 = AMSupportCopyPreserveFileURL(a1, cf, cfa, 0);
    if ((_DWORD)v6)
    {
      DataFromFileURL = v6;
      AMSupportLogInternal(3, (uint64_t)"AMSupportCreateDataFromFileURL", (uint64_t)"AMSupportCopyPreserveFileURL failed.", v7, v8, v9, v10, v11, (char)cfa[0]);
    }
    else
    {
      DataFromFileURL = AMSupportPlatformCreateDataFromFileURL(a1, a2, (const __CFURL *)cfa[0]);
    }
    if (cfa[0])
      CFRelease(cfa[0]);
  }
  return DataFromFileURL;
}

uint64_t AMSupportCopyPreserveFileURL(const __CFAllocator *a1, CFTypeRef cf, CFTypeRef *a3, int a4)
{
  uint64_t v4;
  const __CFURL *v7;
  CFTypeRef v8;
  CFStringRef v9;
  CFMutableStringRef Mutable;
  CFStringRef v11;
  uint64_t v12;
  uint64_t v13;
  CFURLRef v14;
  BOOL v15;
  const __CFURL *v16;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = 1;
  v20 = 1;
  if (cf && a3)
  {
    v7 = (const __CFURL *)CFRetain(cf);
    v8 = CFRetain(cf);
    v9 = 0;
    Mutable = 0;
    v11 = 0;
    v12 = 1;
    while (1)
    {
      v13 = AMSupportPlatformFileURLExists(v7, (BOOL *)&v20);
      if ((_DWORD)v13)
      {
        v4 = v13;
        goto LABEL_25;
      }
      if (!v20)
        goto LABEL_21;
      if (v11)
        CFRelease(v11);
      v11 = CFStringCreateWithFormat(a1, 0, CFSTR("~%d"), v12);
      if (!v11)
        goto LABEL_38;
      if (Mutable)
        CFRelease(Mutable);
      if (v9)
        CFRelease(v9);
      Mutable = CFStringCreateMutable(a1, 0);
      if (!Mutable)
        break;
      v9 = CFURLCopyFileSystemPath((CFURLRef)cf, kCFURLPOSIXPathStyle);
      if (!v9)
        goto LABEL_38;
      CFStringAppend(Mutable, v9);
      CFStringAppend(Mutable, v11);
      if (v8)
        CFRelease(v8);
      v8 = CFRetain(v7);
      CFRelease(v7);
      v14 = CFURLCreateWithFileSystemPath(a1, Mutable, kCFURLPOSIXPathStyle, 0);
      if (!v14)
      {
        v4 = 2;
LABEL_28:
        CFRelease(v11);
        goto LABEL_29;
      }
      v7 = v14;
      if (v20)
      {
        v15 = v12 > 0x1E;
        v12 = (v12 + 1);
        if (!v15)
          continue;
      }
LABEL_21:
      if (a4)
        v16 = v7;
      else
        v16 = (const __CFURL *)v8;
      v4 = 0;
      *a3 = CFRetain(v16);
      goto LABEL_25;
    }
    v9 = 0;
LABEL_38:
    v4 = 2;
LABEL_25:
    if (v7)
      CFRelease(v7);
    if (v11)
      goto LABEL_28;
LABEL_29:
    if (Mutable)
      CFRelease(Mutable);
    if (v9)
      CFRelease(v9);
    if (v8)
      CFRelease(v8);
  }
  return v4;
}

const __CFString *AMSupportGetLibraryVersionString()
{
  return CFSTR("libamsupport-???");
}

uint64_t AMSupportBase64Encode(const __CFAllocator *a1, CFDataRef theData, CFTypeRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned __int8 *BytePtr;
  int Length;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  UInt8 *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CFStringRef v26;
  CFStringRef v27;
  const char *v29;
  const char *v30;
  char v31;

  if (!theData)
  {
    v29 = "value == NULL";
LABEL_11:
    AMSupportLogInternal(3, (uint64_t)"AMSupportBase64Encode", (uint64_t)v29, a4, a5, a6, a7, a8, v31);
    return 1;
  }
  if (!CFDataGetLength(theData))
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportBase64Encode", (uint64_t)"value length == 0: '%@'", a4, a5, a6, a7, a8, (char)theData);
    return 1;
  }
  if (!a3)
  {
    v29 = "outEncodedValue == NULL";
    goto LABEL_11;
  }
  BytePtr = (unsigned __int8 *)CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  v13 = _base64encode(BytePtr, Length);
  if (v13)
  {
    v19 = (UInt8 *)v13;
    v20 = strlen(v13);
    if (v20)
    {
      v26 = CFStringCreateWithBytes(a1, v19, v20, 0x8000100u, 0);
      if (v26)
      {
        v27 = v26;
        *a3 = CFRetain(v26);
        free(v19);
        CFRelease(v27);
        return 0;
      }
      v30 = "encodedValue == NULL: '%@'";
    }
    else
    {
      v30 = "encodedLength == 0: '%@'";
    }
    AMSupportLogInternal(3, (uint64_t)"AMSupportBase64Encode", (uint64_t)v30, v21, v22, v23, v24, v25, (char)theData);
    free(v19);
  }
  else
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportBase64Encode", (uint64_t)"encodedBuffer == NULL: '%@'", v14, v15, v16, v17, v18, (char)theData);
  }
  return 99;
}

uint64_t AMSupportBase64Decode(const __CFAllocator *a1, CFStringRef theString, CFTypeRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFDataRef v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CFDataRef v36;
  uint64_t v37;
  const char *v39;
  char v40;
  char v41;

  if (!theString)
  {
    v39 = "value == NULL";
LABEL_13:
    AMSupportLogInternal(3, (uint64_t)"AMSupportBase64Decode", (uint64_t)v39, a4, a5, a6, a7, a8, v40);
    return 1;
  }
  if (!CFStringGetLength(theString))
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportBase64Decode", (uint64_t)"value length == 0: '%@'", a4, a5, a6, a7, a8, (char)theString);
    return 1;
  }
  if (!a3)
  {
    v39 = "outDecodedValue == NULL";
    goto LABEL_13;
  }
  v11 = (int)(CFStringGetLength(theString) + 1);
  v12 = (char *)malloc_type_malloc(v11, 0xAD7E8605uLL);
  if (!v12)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportBase64Decode", (uint64_t)"failed to allocate buffer", v13, v14, v15, v16, v17, (char)theString);
    return 2;
  }
  v18 = v12;
  if (!CFStringGetCString(theString, v12, v11, 0x8000100u))
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportBase64Decode", (uint64_t)"failed to convert value to c-string", v19, v20, v21, v22, v23, (char)theString);
LABEL_19:
    v37 = 2;
    goto LABEL_20;
  }
  v24 = _base64decode(v18, v11);
  if (v24 <= 0)
  {
    v41 = (char)theString;
    v37 = 3;
    AMSupportLogInternal(3, (uint64_t)"AMSupportBase64Decode", (uint64_t)"_base64decode of value '%@' failed with error code %d.", v25, v26, v27, v28, v29, v41);
LABEL_20:
    free(v18);
    return v37;
  }
  v30 = CFDataCreate(a1, (const UInt8 *)v18, v24);
  if (!v30)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportBase64Decode", (uint64_t)"decodedData is NULL", v31, v32, v33, v34, v35, (char)theString);
    goto LABEL_19;
  }
  v36 = v30;
  *a3 = CFRetain(v30);
  free(v18);
  CFRelease(v36);
  return 0;
}

uint64_t AMSupportWriteDataToFileURL(const __CFAllocator *a1, const __CFData *a2, const __CFURL *cf, int a4)
{
  uint64_t v4;
  uint64_t v7;
  const __CFURL *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFURL *v15;
  CFTypeRef cfa[2];

  cfa[1] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  cfa[0] = 0;
  v4 = 1;
  if (!a2 || !cf)
    return v4;
  if (a4)
  {
    v7 = AMSupportRemoveFile(cf);
    if ((_DWORD)v7)
    {
LABEL_12:
      v4 = v7;
      goto LABEL_13;
    }
    v8 = 0;
LABEL_8:
    if (v8)
      v15 = v8;
    else
      v15 = cf;
    v7 = AMSupportPlatformWriteDataToFileURL(a2, v15);
    goto LABEL_12;
  }
  v9 = AMSupportCopyPreserveFileURL(a1, cf, cfa, 1);
  if (!(_DWORD)v9)
  {
    v8 = (const __CFURL *)cfa[0];
    goto LABEL_8;
  }
  v4 = v9;
  AMSupportLogInternal(3, (uint64_t)"AMSupportWriteDataToFileURL", (uint64_t)"AMSupportCopyPreserveFileURL failed.", v10, v11, v12, v13, v14, (char)cfa[0]);
LABEL_13:
  if (cfa[0])
    CFRelease(cfa[0]);
  return v4;
}

CFDataRef AMSupportCreateRandomNumber(int a1)
{
  size_t v1;
  UInt8 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  UInt8 *v8;
  CFDataRef result;
  char v10;

  v1 = a1;
  v2 = (UInt8 *)malloc_type_calloc(1uLL, a1, 0x8C25A3F4uLL);
  if (v2)
  {
    v8 = v2;
    arc4random_buf(v2, v1);
    result = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v8, v1, (CFAllocatorRef)*MEMORY[0x24BDBD240]);
    if (result)
      return result;
    free(v8);
  }
  else
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCreateRandomNumber", (uint64_t)"calloc failed", v3, v4, v5, v6, v7, v10);
  }
  return 0;
}

CFIndex AMSupportApplyDictionaryOverrides(int a1, CFDictionaryRef theDict, CFMutableDictionaryRef *a3, const __CFString *a4)
{
  CFIndex Count;
  const void **v8;
  const void **v9;
  const void **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  CFStringRef *v17;
  const void **v18;
  CFStringRef v19;
  const void *v20;
  char v22;

  Count = 1;
  if (theDict && a3 && *a3)
  {
    Count = CFDictionaryGetCount(theDict);
    v8 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v9 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
    v10 = v9;
    if (v8 && v9)
    {
      CFDictionaryGetKeysAndValues(theDict, v8, v9);
      if (Count < 1)
      {
        Count = 0;
        goto LABEL_17;
      }
      v16 = "invalid overridesKey";
      v17 = (CFStringRef *)v8;
      v18 = v10;
      while (1)
      {
        v19 = *v17;
        if (!*v17)
        {
LABEL_22:
          AMSupportLogInternal(3, (uint64_t)"AMSupportApplyDictionaryOverrides", (uint64_t)v16, v11, v12, v13, v14, v15, v22);
          Count = 99;
          goto LABEL_17;
        }
        v20 = *v18;
        if (!*v18)
        {
          v16 = "invalid overridesValue";
          goto LABEL_22;
        }
        if (!a4)
          goto LABEL_13;
        if (CFStringFind(*v17, a4, 0).location != -1)
          break;
LABEL_14:
        ++v18;
        ++v17;
        if (!--Count)
          goto LABEL_17;
      }
      v19 = *v17;
      v20 = *v18;
LABEL_13:
      CFDictionarySetValue(*a3, v19, v20);
      goto LABEL_14;
    }
    Count = 2;
    if (v8)
LABEL_17:
      free(v8);
    if (v10)
      free(v10);
  }
  return Count;
}

const __CFDictionary *AMSupportGetValueForKeyPathInDict(const __CFAllocator *a1, const __CFDictionary *a2, CFStringRef theString, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFDictionary *Value;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex v13;
  const void *ValueAtIndex;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v21;
  char v22;

  Value = a2;
  if (!a2)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportGetValueForKeyPathInDict", (uint64_t)"dict is NULL", a4, a5, a6, a7, a8, v22);
    return Value;
  }
  if (!theString)
  {
    v21 = "keyPath is NULL";
LABEL_15:
    AMSupportLogInternal(3, (uint64_t)"AMSupportGetValueForKeyPathInDict", (uint64_t)v21, a4, a5, a6, a7, a8, v22);
    return 0;
  }
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(a1, theString, CFSTR("."));
  if (!ArrayBySeparatingStrings)
  {
    v21 = "keys is NULL";
    goto LABEL_15;
  }
  v10 = ArrayBySeparatingStrings;
  Count = CFArrayGetCount(ArrayBySeparatingStrings);
  if (Count >= 1)
  {
    v12 = Count;
    v13 = 0;
    while (1)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v10, v13);
      if (!ValueAtIndex)
        break;
      Value = (const __CFDictionary *)CFDictionaryGetValue(Value, ValueAtIndex);
      if (Value)
      {
        if (v12 != ++v13)
          continue;
      }
      goto LABEL_9;
    }
    AMSupportLogInternal(3, (uint64_t)"AMSupportGetValueForKeyPathInDict", (uint64_t)"key is NULL", v15, v16, v17, v18, v19, v22);
    Value = 0;
  }
LABEL_9:
  CFRelease(v10);
  return Value;
}

uint64_t AMSupportCopyFile(const __CFAllocator *a1, const void *a2, const __CFURL *a3)
{
  uint64_t v3;
  char *DirectoryForURL;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t DataFromFileURL;
  const char *v15;
  CFTypeRef cf[2];

  cf[1] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  cf[0] = 0;
  v3 = 1;
  if (!a2 || !a3)
    return v3;
  DirectoryForURL = AMSupportPlatformMakeDirectoryForURL(a3);
  if ((_DWORD)DirectoryForURL)
  {
    v3 = (uint64_t)DirectoryForURL;
    v15 = "AMSupportMakeDirectory failed.";
  }
  else
  {
    DataFromFileURL = AMSupportCreateDataFromFileURL(a1, cf, a2);
    if ((_DWORD)DataFromFileURL)
    {
      v3 = DataFromFileURL;
      v15 = "AMSupportCreateDataFromFileURL failed.";
    }
    else
    {
      v3 = AMSupportWriteDataToFileURL((const __CFAllocator *)*MEMORY[0x24BDBD240], (const __CFData *)cf[0], a3, 1);
      if (!(_DWORD)v3)
        goto LABEL_6;
      v15 = "AMSupportWriteDataToFileURL failed.";
    }
  }
  AMSupportLogInternal(3, (uint64_t)"AMSupportCopyFile", (uint64_t)v15, v8, v9, v10, v11, v12, (char)cf[0]);
LABEL_6:
  if (cf[0])
    CFRelease(cf[0]);
  return v3;
}

uint64_t AMSupportCopyStringReplacingLastComponent(const __CFAllocator *a1, const __CFString *a2, const __CFString *a3, const void *a4, CFTypeRef *a5)
{
  uint64_t v5;
  const __CFArray *ArrayBySeparatingStrings;
  const __CFArray *v11;
  const __CFArray *MutableCopy;
  __CFArray *v13;
  CFIndex Count;
  CFStringRef v15;
  CFStringRef v16;

  v5 = 1;
  if (a2 && a4 && a5)
  {
    ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(a1, a2, a3);
    if (!ArrayBySeparatingStrings)
      return 3;
    v11 = ArrayBySeparatingStrings;
    MutableCopy = CFArrayCreateMutableCopy(a1, 0, ArrayBySeparatingStrings);
    if (!MutableCopy)
    {
      v5 = 3;
      v16 = (CFStringRef)v11;
LABEL_9:
      CFRelease(v16);
      return v5;
    }
    v13 = MutableCopy;
    Count = CFArrayGetCount(MutableCopy);
    CFArraySetValueAtIndex(v13, Count - 1, a4);
    v15 = CFStringCreateByCombiningStrings(a1, v13, a3);
    v16 = v15;
    if (v15)
    {
      v5 = 0;
      *a5 = CFRetain(v15);
    }
    else
    {
      v5 = 3;
    }
    CFRelease(v11);
    CFRelease(v13);
    if (v16)
      goto LABEL_9;
  }
  return v5;
}

uint64_t AMSupportCreateMergedDictionary(const __CFAllocator *a1, const __CFDictionary *a2, const __CFDictionary *a3, CFMutableDictionaryRef *a4)
{
  uint64_t v4;
  CFIndex Count;
  const void **v10;
  const void **v11;
  const void **v12;
  CFTypeRef *v13;
  const CFDictionaryValueCallBacks *v14;
  const void *v15;
  CFTypeID v16;
  __CFDictionary *Value;
  CFMutableDictionaryRef Mutable;
  CFTypeID v19;
  const __CFDictionary *v20;
  CFMutableDictionaryRef MutableCopy;
  uint64_t MergedDictionary;
  CFDictionaryRef v23;
  CFTypeRef *v25;
  const void **v26;
  CFDictionaryRef theDict[2];

  theDict[1] = *(CFDictionaryRef *)MEMORY[0x24BDAC8D0];
  theDict[0] = 0;
  v4 = 1;
  if (!a2 || !a3 || !a4)
    return v4;
  Count = CFDictionaryGetCount(a3);
  v10 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v10)
    return 2;
  v11 = v10;
  v12 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  if (!v12)
  {
    free(v11);
    return 2;
  }
  v13 = v12;
  CFDictionaryGetKeysAndValues(a3, v11, v12);
  if (Count < 1)
  {
    v23 = 0;
    v4 = 0;
    Mutable = 0;
    goto LABEL_31;
  }
  v14 = (const CFDictionaryValueCallBacks *)MEMORY[0x24BDBD6B0];
  v25 = v13;
  v26 = v11;
  while (1)
  {
    v15 = *v11;
    if (!*a4)
      *a4 = CFDictionaryCreateMutableCopy(a1, 0, a2);
    v16 = CFGetTypeID(*v13);
    if (v16 == CFDictionaryGetTypeID())
      break;
    v20 = theDict[0];
    MutableCopy = *a4;
    if (theDict[0])
    {
      if (MutableCopy)
      {
        CFRelease(MutableCopy);
        v20 = theDict[0];
      }
      MutableCopy = CFDictionaryCreateMutableCopy(a1, 0, v20);
      *a4 = MutableCopy;
    }
    if (!MutableCopy)
    {
      Mutable = 0;
LABEL_37:
      v4 = 2;
      goto LABEL_29;
    }
    CFDictionarySetValue(MutableCopy, v15, *v13);
    Mutable = 0;
LABEL_23:
    if (theDict[0])
    {
      CFRelease(theDict[0]);
      theDict[0] = 0;
    }
    if (Mutable)
      CFRelease(Mutable);
    ++v13;
    ++v11;
    if (!--Count)
    {
      v4 = 0;
      Mutable = 0;
      goto LABEL_29;
    }
  }
  Value = (__CFDictionary *)CFDictionaryGetValue(a2, v15);
  if (Value)
  {
    Mutable = Value;
    CFRetain(Value);
    v19 = CFGetTypeID(Mutable);
    if (v19 != CFDictionaryGetTypeID())
    {
      v4 = 8;
      goto LABEL_29;
    }
  }
  else
  {
    Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x24BDBD6A0], v14);
    if (!Mutable)
      goto LABEL_37;
  }
  MergedDictionary = AMSupportCreateMergedDictionary(a1, Mutable, *v13, theDict);
  if (!(_DWORD)MergedDictionary)
  {
    CFDictionarySetValue(*a4, v15, theDict[0]);
    goto LABEL_23;
  }
  v4 = MergedDictionary;
LABEL_29:
  v11 = v26;
  v23 = theDict[0];
  v13 = v25;
LABEL_31:
  free(v11);
  free(v13);
  if (v23)
    CFRelease(v23);
  if (Mutable)
    CFRelease(Mutable);
  return v4;
}

void AMSupportApplyBlockToDictionary(const __CFDictionary *a1, uint64_t a2)
{
  CFIndex Count;
  uint64_t v5;
  size_t v6;
  const void **v7;
  const void **v8;
  const void **v9;
  uint64_t v10;
  const void **v11;
  const void **v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  BOOL v18;

  if (a1)
  {
    if (a2)
    {
      Count = CFDictionaryGetCount(a1);
      if (Count)
      {
        v5 = Count;
        v6 = 8 * Count;
        v7 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
        v8 = (const void **)malloc_type_malloc(v6, 0xC0040B8AA526DuLL);
        v9 = v8;
        if (v7 && v8)
        {
          CFDictionaryGetKeysAndValues(a1, v7, v8);
          v10 = v5 - 1;
          if (v5 >= 1)
          {
            v11 = v7;
            v12 = v9;
            do
            {
              v14 = (uint64_t)*v11++;
              v13 = v14;
              v15 = (uint64_t)*v12++;
              v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 16))(a2, v13, v15);
              v18 = v10-- != 0;
            }
            while (v16 && v18);
          }
        }
        else if (!v7)
        {
LABEL_14:
          if (v9)
            free(v9);
          return;
        }
        free(v7);
        goto LABEL_14;
      }
    }
  }
}

BOOL _digestChunks(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return AMSupportDigestUpdate(*a3) == 0;
}

CFIndex *AMSupportCreateDigest(const __CFURL *a1, unsigned int a2, CFIndex *a3, __CFDictionary *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFIndex *Copy;
  __CFData *Mutable;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFData *v16;
  unsigned int inited;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  CFIndex v29;
  const __CFString *v30;
  __CFDictionary *v31;
  CFTypeRef v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  CFTypeRef cf[2];

  cf[1] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  v36 = 0;
  cf[0] = 0;
  if (!a1)
  {
    AMSupportCreateErrorInternal(a4, CFSTR("AMSupportErrorDomain"), 1, 0, CFSTR("%s: srcURL is NULL"), a6, a7, a8, (char)"AMSupportCreateDigest");
    Copy = 0;
LABEL_8:
    v16 = 0;
LABEL_11:
    v21 = 0;
    goto LABEL_12;
  }
  Copy = a3;
  if (!a3)
  {
    AMSupportCreateErrorInternal(a4, CFSTR("AMSupportErrorDomain"), 1, 0, CFSTR("%s: digestInfo is NULL"), a6, a7, a8, (char)"AMSupportCreateDigest");
    goto LABEL_8;
  }
  Mutable = CFDataCreateMutable(0, *a3);
  v16 = Mutable;
  if (!Mutable)
  {
    AMSupportCreateErrorInternal(a4, CFSTR("AMSupportErrorDomain"), 2, 0, CFSTR("%s: failed to allocate digest"), v13, v14, v15, (char)"AMSupportCreateDigest");
    goto LABEL_10;
  }
  CFDataSetLength(Mutable, *Copy);
  inited = AMSupportDigestInitContext(Copy, &v36);
  if (inited)
  {
    AMSupportCreateErrorInternal(a4, CFSTR("AMSupportErrorDomain"), inited, 0, CFSTR("%s: failed to init digest"), v18, v19, v20, (char)"AMSupportCreateDigest");
LABEL_10:
    Copy = 0;
    goto LABEL_11;
  }
  v23 = malloc_type_malloc(0x10uLL, 0xA0040AFF93C70uLL);
  v21 = v23;
  if (!v23)
  {
    v30 = CFSTR("%s: failed to allocate params");
    v31 = a4;
    v29 = 2;
    goto LABEL_26;
  }
  v27 = v36;
  *v23 = Copy;
  v23[1] = v27;
  if (!AMSupportReadChunks(a1, "rb", a2, (unsigned int (*)(void *, size_t, uint64_t, CFTypeRef *))_digestChunks, (uint64_t)v23, (__CFDictionary *)cf, v25, v26))
  {
    v32 = cf[0];
    v30 = CFSTR("%s: failed to read file in chunks");
    v31 = a4;
    v29 = 4;
    goto LABEL_28;
  }
  CFDataGetMutableBytePtr(v16);
  v28 = AMSupportDigestFinal((uint64_t)Copy);
  if (v28)
  {
    v29 = v28;
    v30 = CFSTR("%s: failed to finalize digest");
    v31 = a4;
LABEL_26:
    v32 = 0;
LABEL_28:
    AMSupportCreateErrorInternal(v31, CFSTR("AMSupportErrorDomain"), v29, v32, v30, v24, v25, v26, (char)"AMSupportCreateDigest");
    Copy = 0;
    goto LABEL_12;
  }
  if (!CFDataGetLength(v16))
  {
    v30 = CFSTR("%s: failed to create digest");
    v31 = a4;
    v29 = 3;
    goto LABEL_26;
  }
  Copy = (CFIndex *)CFDataCreateCopy(0, v16);
  if (!Copy)
    AMSupportCreateErrorInternal(a4, CFSTR("AMSupportErrorDomain"), 2, 0, CFSTR("%s: failed to copy digest"), v33, v34, v35, (char)"AMSupportCreateDigest");
LABEL_12:
  if (cf[0])
    CFRelease(cf[0]);
  if (v16)
    CFRelease(v16);
  if (v21)
    free(v21);
  if (v36)
    free(v36);
  return Copy;
}

uint64_t AMSupportReadChunks(const __CFURL *a1, const char *a2, unsigned int a3, unsigned int (*a4)(void *, size_t, uint64_t, CFTypeRef *), uint64_t a5, __CFDictionary *a6, uint64_t a7, uint64_t a8)
{
  size_t v11;
  FILE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  FILE *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CFTypeRef cf[2];

  cf[1] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  cf[0] = 0;
  if (!a1)
  {
    v26 = CFSTR("%s: srcURL is NULL");
LABEL_17:
    AMSupportCreateErrorInternal(a6, CFSTR("AMSupportErrorDomain"), 1, 0, v26, (uint64_t)a6, a7, a8, (char)"AMSupportReadChunks");
    return 0;
  }
  if (!a2)
  {
    v26 = CFSTR("%s: flags is NULL");
    goto LABEL_17;
  }
  if (!a4)
  {
    v26 = CFSTR("%s: callback is NULL");
    goto LABEL_17;
  }
  if (a3)
    v11 = a3;
  else
    v11 = 0x100000;
  v12 = AMSupportPlatformOpenFileStreamWithURL(a1, a2);
  if (!v12)
  {
    AMSupportCreateErrorInternal(a6, CFSTR("AMSupportErrorDomain"), 4, 0, CFSTR("%s: failed to open file %@"), v13, v14, v15, (char)"AMSupportReadChunks");
    return 0;
  }
  v16 = v12;
  v17 = malloc_type_malloc(v11, 0x2B5D69ACuLL);
  if (v17)
  {
    v21 = v17;
    while (feof(v16) != -1)
    {
      v22 = fread(v21, 1uLL, v11, v16);
      if (!v22)
        break;
      if (!a4(v21, v22, a5, cf))
      {
        AMSupportCreateErrorInternal(a6, CFSTR("AMSupportErrorDomain"), 4, cf[0], CFSTR("%s: callback failed"), v23, v24, v25, (char)"AMSupportReadChunks");
LABEL_23:
        v27 = 0;
        goto LABEL_26;
      }
    }
    if (ferror(v16))
    {
      AMSupportCreateErrorInternal(a6, CFSTR("AMSupportErrorDomain"), 4, 0, CFSTR("%s: failed to read from file %d"), v29, v30, v31, (char)"AMSupportReadChunks");
      goto LABEL_23;
    }
    v27 = 1;
LABEL_26:
    free(v21);
    if (cf[0])
      CFRelease(cf[0]);
  }
  else
  {
    AMSupportCreateErrorInternal(a6, CFSTR("AMSupportErrorDomain"), 2, 0, CFSTR("%s: failed to allocate chunk buffer"), v18, v19, v20, (char)"AMSupportReadChunks");
    v27 = 0;
  }
  fclose(v16);
  return v27;
}

uint64_t AMSupportHttpUriEscapeString(const __CFAllocator *a1, CFStringRef theString, CFTypeRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFMutableStringRef MutableCopy;
  uint64_t i;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  const char *v20;
  char v21;
  CFRange v22;

  if (!theString)
  {
    v20 = "value == NULL";
LABEL_10:
    AMSupportLogInternal(3, (uint64_t)"AMSupportHttpUriEscapeString", (uint64_t)v20, a4, a5, a6, a7, a8, v21);
    MutableCopy = 0;
    v18 = 1;
    goto LABEL_7;
  }
  if (!a3)
  {
    v20 = "outEscapedValue == NULL";
    goto LABEL_10;
  }
  MutableCopy = CFStringCreateMutableCopy(a1, 0, theString);
  if (MutableCopy)
  {
    for (i = 0; i != 66; i += 2)
    {
      v16 = kEscapeTable[i];
      v17 = kEscapeTable[i + 1];
      v22.length = CFStringGetLength(MutableCopy);
      v22.location = 0;
      CFStringFindAndReplace(MutableCopy, v16, v17, v22, 0);
    }
    v18 = 0;
    *a3 = CFRetain(MutableCopy);
  }
  else
  {
    v18 = 3;
    AMSupportLogInternal(3, (uint64_t)"AMSupportHttpUriEscapeString", (uint64_t)"escapedValue == NULL", v9, v10, v11, v12, v13, v21);
  }
LABEL_7:
  AMSupportSafeRelease(MutableCopy);
  return v18;
}

uint64_t AMSupportHttpUriUnescapeString(const __CFAllocator *a1, CFStringRef theString, CFTypeRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFMutableStringRef MutableCopy;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  uint64_t v18;
  const char *v20;
  char v21;
  CFRange v22;

  if (!theString)
  {
    v20 = "value == NULL";
LABEL_10:
    AMSupportLogInternal(3, (uint64_t)"AMSupportHttpUriUnescapeString", (uint64_t)v20, a4, a5, a6, a7, a8, v21);
    MutableCopy = 0;
    v18 = 1;
    goto LABEL_7;
  }
  if (!a3)
  {
    v20 = "outUnescapedValue == NULL";
    goto LABEL_10;
  }
  MutableCopy = CFStringCreateMutableCopy(a1, 0, theString);
  if (MutableCopy)
  {
    v15 = 0x42u;
    do
    {
      v17 = kEscapeTable[v15 - 2];
      v16 = kEscapeTable[v15 - 1];
      v22.length = CFStringGetLength(MutableCopy);
      v22.location = 0;
      CFStringFindAndReplace(MutableCopy, v16, v17, v22, 0);
      v15 -= 2;
    }
    while (v15 * 8);
    v18 = 0;
    *a3 = CFRetain(MutableCopy);
  }
  else
  {
    v18 = 3;
    AMSupportLogInternal(3, (uint64_t)"AMSupportHttpUriUnescapeString", (uint64_t)"unescapedValue == NULL", v9, v10, v11, v12, v13, v21);
  }
LABEL_7:
  AMSupportSafeRelease(MutableCopy);
  return v18;
}

uint64_t AMSupportHttpCreatePostBody(const __CFAllocator *a1, const __CFDictionary *a2, CFTypeRef *a3)
{
  CFDataRef v3;
  uint64_t v4;
  CFMutableStringRef Mutable;
  const void **v7;
  const void **v8;
  char *v9;
  CFIndex Count;
  const void **v13;
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
  CFIndex v24;
  const __CFString *v25;
  CFIndex Length;
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
  CFDataRef v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v44;
  const char *v45;
  char v46;
  char v47;

  v3 = 0;
  v4 = 1;
  if (!a2)
  {
    Mutable = 0;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    goto LABEL_17;
  }
  Mutable = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  if (a3)
  {
    Mutable = CFStringCreateMutable(a1, 0);
    if (Mutable)
    {
      Count = CFDictionaryGetCount(a2);
      v7 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      v13 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
      v8 = v13;
      if (v7)
      {
        if (v13)
        {
          CFDictionaryGetKeysAndValues(a2, v7, v13);
          if (Count >= 1)
          {
            v24 = 0;
            while (1)
            {
              v25 = (const __CFString *)v7[v24];
              if (!v25)
              {
                v44 = "invalid requestDictKeysBuffer array";
                goto LABEL_20;
              }
              if (!v8[v24])
                break;
              CFStringAppend(Mutable, v25);
              CFStringAppend(Mutable, CFSTR("="));
              CFStringAppend(Mutable, (CFStringRef)v8[v24]);
              if (v24 < Count - 1)
                CFStringAppend(Mutable, CFSTR("&"));
              if (Count == ++v24)
                goto LABEL_13;
            }
            v44 = "invalid requestDictValuesBuffer array";
LABEL_20:
            AMSupportLogInternal(3, (uint64_t)"AMSupportHttpCreatePostBody", (uint64_t)v44, v19, v20, v21, v22, v23, v46);
            v3 = 0;
            v9 = 0;
            v4 = 14;
            goto LABEL_17;
          }
LABEL_13:
          AMSupportLogInternal(7, (uint64_t)"AMSupportHttpCreatePostBody", (uint64_t)"postString=%@", v19, v20, v21, v22, v23, (char)Mutable);
          Length = CFStringGetLength(Mutable);
          v9 = (char *)malloc_type_malloc(Length + 1, 0xC65CD456uLL);
          if (v9)
          {
            if (!CFStringGetCString(Mutable, v9, Length + 1, 0x8000100u))
            {
              v4 = 3;
              AMSupportLogInternal(3, (uint64_t)"AMSupportHttpCreatePostBody", (uint64_t)"conversion of postString to c-string failed", v32, v33, v34, v35, v36, v47);
              v3 = 0;
              goto LABEL_17;
            }
            v37 = CFDataCreate(a1, (const UInt8 *)v9, Length);
            v3 = v37;
            if (v37)
            {
              v4 = 0;
              *a3 = CFRetain(v37);
              goto LABEL_17;
            }
            AMSupportLogInternal(3, (uint64_t)"AMSupportHttpCreatePostBody", (uint64_t)"postData allocation failed", v38, v39, v40, v41, v42, v47);
          }
          else
          {
            AMSupportLogInternal(3, (uint64_t)"AMSupportHttpCreatePostBody", (uint64_t)"tmpStringBuffer allocation failure", v27, v28, v29, v30, v31, v47);
            v3 = 0;
          }
LABEL_30:
          v4 = 2;
          goto LABEL_17;
        }
        v45 = "requestDictValuesBuffer allocation failed";
      }
      else
      {
        v45 = "requestDictKeysBuffer allocation failed";
      }
      AMSupportLogInternal(3, (uint64_t)"AMSupportHttpCreatePostBody", (uint64_t)v45, v14, v15, v16, v17, v18, v46);
      v3 = 0;
    }
    else
    {
      v3 = 0;
      v7 = 0;
      v8 = 0;
    }
    v9 = 0;
    goto LABEL_30;
  }
LABEL_17:
  AMSupportSafeRelease(Mutable);
  AMSupportSafeRelease(v3);
  AMSupportSafeFree(v7);
  AMSupportSafeFree(v8);
  AMSupportSafeFree(v9);
  return v4;
}

uint64_t AMSupportHttpSetUriEscapedValue(const __CFAllocator *a1, __CFDictionary *a2, const void *a3, CFStringRef theString, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v18;
  void *value[2];

  value[1] = *(void **)MEMORY[0x24BDAC8D0];
  value[0] = 0;
  v8 = 1;
  if (a2 && a3 && theString)
  {
    v11 = AMSupportHttpUriEscapeString(a1, theString, (CFTypeRef *)value, (uint64_t)theString, a5, a6, a7, a8);
    if ((_DWORD)v11)
    {
      v8 = v11;
      v18 = "AMSupportHttpUriEscapeString failed";
    }
    else
    {
      if (value[0])
      {
        CFDictionarySetValue(a2, a3, value[0]);
        v8 = 0;
        goto LABEL_7;
      }
      v18 = "escapedValue is NULL";
      v8 = 3;
    }
    AMSupportLogInternal(3, (uint64_t)"AMSupportHttpSetUriEscapedValue", (uint64_t)v18, v12, v13, v14, v15, v16, (char)value[0]);
  }
LABEL_7:
  AMSupportSafeRelease(value[0]);
  return v8;
}

uint64_t AMSupportHttpCreatePostRequest(const __CFAllocator *a1, const __CFURL *a2, const __CFDictionary *a3, CFTypeRef *a4)
{
  __CFHTTPMessage *Request;
  uint64_t v5;
  const __CFString *v7;
  uint64_t PostBody;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFIndex Length;
  char v18;
  CFDataRef theData[2];

  Request = 0;
  theData[1] = *(CFDataRef *)MEMORY[0x24BDAC8D0];
  theData[0] = 0;
  v5 = 1;
  if (!a2 || !a3)
  {
    v7 = 0;
    goto LABEL_8;
  }
  v7 = 0;
  if (a4)
  {
    PostBody = AMSupportHttpCreatePostBody(a1, a3, (CFTypeRef *)theData);
    if ((_DWORD)PostBody)
    {
      v5 = PostBody;
      AMSupportLogInternal(3, (uint64_t)"AMSupportHttpCreatePostRequest", (uint64_t)"AMSupportHttpCreatePostBody failed", v11, v12, v13, v14, v15, v18);
      Request = 0;
    }
    else
    {
      if (!theData[0])
      {
        Request = 0;
        v7 = 0;
        v5 = 2;
        goto LABEL_8;
      }
      Request = CFHTTPMessageCreateRequest(a1, CFSTR("POST"), a2, (CFStringRef)*MEMORY[0x24BDB7698]);
      if (Request)
      {
        Length = CFDataGetLength(theData[0]);
        v7 = CFStringCreateWithFormat(a1, 0, CFSTR("%lu"), Length);
        CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Content-Type"), CFSTR("text/xml; charset=\"utf-8\""));
        CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Content-Length"), v7);
        CFHTTPMessageSetBody(Request, theData[0]);
        v5 = 0;
        *a4 = CFRetain(Request);
        goto LABEL_8;
      }
      v5 = 0;
    }
    v7 = 0;
  }
LABEL_8:
  AMSupportSafeRelease(theData[0]);
  AMSupportSafeRelease(Request);
  AMSupportSafeRelease(v7);
  AMSupportSafeRelease(0);
  return v5;
}

uint64_t AMSupportHttpSetBase64EncodedValue(const __CFAllocator *a1, __CFDictionary *a2, const void *a3, CFDataRef theData, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v12;
  CFStringRef v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v19;
  CFStringRef theString[2];

  theString[1] = *(CFStringRef *)MEMORY[0x24BDAC8D0];
  theString[0] = 0;
  v8 = 1;
  if (a2 && a3 && theData)
  {
    v12 = AMSupportBase64Encode(a1, theData, (CFTypeRef *)theString, (uint64_t)theData, a5, a6, a7, a8);
    if ((_DWORD)v12)
    {
      v8 = v12;
      v19 = "Base64Encode failed";
    }
    else
    {
      v13 = theString[0];
      if (theString[0])
      {
        v8 = AMSupportHttpSetUriEscapedValue(a1, a2, a3, theString[0], v14, v15, v16, v17);
        goto LABEL_7;
      }
      v19 = "encodedValue is NULL";
      v8 = 3;
    }
    AMSupportLogInternal(3, (uint64_t)"AMSupportHttpSetBase64EncodedValue", (uint64_t)v19, (uint64_t)v13, v14, v15, v16, v17, (char)theString[0]);
  }
LABEL_7:
  AMSupportSafeRelease(theString[0]);
  return v8;
}

uint64_t AMSupportHttpCreateDataFromURL(const __CFAllocator *a1, CFURLRef url, void *a3, CFTypeRef *a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFHTTPMessage *Request;
  CFMutableDataRef Mutable;
  uint64_t v15;
  CFTypeRef cf;
  CFTypeRef v18;
  uint64_t v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v19[0] = 0;
  cf = 0;
  v4 = 1;
  if (!url || !a4)
    goto LABEL_17;
  Request = CFHTTPMessageCreateRequest(a1, CFSTR("GET"), url, (CFStringRef)*MEMORY[0x24BDB7698]);
  if (Request)
  {
    Mutable = CFDataCreateMutable(a1, 0);
    if (Mutable)
    {
      v15 = AMSupportHttpMessageSendSyncWithOptions(Request, a3, (uint64_t)Mutable, (CFHTTPMessageRef *)&v18, v19, (uint64_t)&cf);
      if ((_DWORD)v15)
      {
        v4 = v15;
      }
      else if (v19[0] == 200)
      {
        v4 = 0;
        *a4 = CFRetain(Mutable);
      }
      else
      {
        AMSupportLogInternal(3, (uint64_t)"AMSupportHttpCreateDataFromURL", (uint64_t)"httpStatus is %ld", v8, v9, v10, v11, v12, v19[0]);
        v4 = 14;
      }
      goto LABEL_9;
    }
  }
  else
  {
    Mutable = 0;
  }
  v4 = 2;
LABEL_9:
  if (cf)
    AMSupportLogInternal(3, (uint64_t)"AMSupportHttpCreateDataFromURL", (uint64_t)"command failed with error: %@", v8, v9, v10, v11, v12, (char)cf);
  if (Request)
    CFRelease(Request);
  if (Mutable)
    CFRelease(Mutable);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
LABEL_17:
  if (v18)
    CFRelease(v18);
  return v4;
}

uint64_t AMSupportHttpCopyProxySettings(uint64_t a1, const void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  intptr_t v17;
  __CFDictionary *Mutable;
  const char *v19;
  const char *v20;
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
  char v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  char v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v9 = dispatch_semaphore_create(0);
  v36 = 0;
  v37 = &v36;
  v38 = 0x2000000000;
  v39 = 0;
  if (AMSupportHttpCopyProxySettings_onceToken != -1)
    dispatch_once(&AMSupportHttpCopyProxySettings_onceToken, &__block_literal_global);
  if (!AMSupportHttpCopyProxySettings_dl_RPRegisterForAvailability
    || !AMSupportHttpCopyProxySettings_dl_RPRegistrationResume
    || !AMSupportHttpCopyProxySettings_dl_RPRegistrationInvalidate
    || !AMSupportHttpCopyProxySettings_dl_RPCopyProxyDictionaryWithOptions)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportHttpCopyProxySettings", (uint64_t)"Missing symbols.", v4, v5, v6, v7, v8, v34);
    Mutable = 0;
    v16 = 0;
    goto LABEL_17;
  }
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 0x40000000;
  v35[2] = __AMSupportHttpCopyProxySettings_block_invoke_2;
  v35[3] = &unk_24C3819B8;
  v35[4] = &v36;
  v35[5] = v9;
  v10 = AMSupportHttpCopyProxySettings_dl_RPRegisterForAvailability(v35);
  v16 = (const void *)v10;
  if (!v10)
  {
    v19 = "failed to register for reverse proxy availability";
LABEL_16:
    AMSupportLogInternal(3, (uint64_t)"AMSupportHttpCopyProxySettings", (uint64_t)v19, v11, v12, v13, v14, v15, v34);
    Mutable = 0;
LABEL_17:
    v21 = 0;
    goto LABEL_22;
  }
  AMSupportHttpCopyProxySettings_dl_RPRegistrationResume(v10);
  v17 = dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  AMSupportHttpCopyProxySettings_dl_RPRegistrationInvalidate(v16);
  if (!*((_BYTE *)v37 + 24))
  {
    v20 = " after 5 seconds";
    if (!v17)
      v20 = "";
    v34 = (char)v20;
    v19 = "No proxy available%s";
    goto LABEL_16;
  }
  if (a2)
  {
    Mutable = (__CFDictionary *)CFRetain(a2);
    if (CFDictionaryContainsKey((CFDictionaryRef)a2, CFSTR("TestReachability")))
      goto LABEL_20;
    goto LABEL_19;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportHttpCopyProxySettings", (uint64_t)"CFDictionaryCreateMutable failed.", v22, v23, v24, v25, v26, v34);
    goto LABEL_17;
  }
LABEL_19:
  CFDictionaryAddValue(Mutable, CFSTR("TestReachability"), (const void *)*MEMORY[0x24BDBD268]);
LABEL_20:
  v27 = AMSupportHttpCopyProxySettings_dl_RPCopyProxyDictionaryWithOptions(a1, Mutable);
  v21 = v27;
  if (v27)
    AMSupportLogInternal(6, (uint64_t)"AMSupportHttpCopyProxySettings", (uint64_t)"proxyInfo = %@", v28, v29, v30, v31, v32, v27);
LABEL_22:
  if (v9)
    dispatch_release(v9);
  if (v16)
    CFRelease(v16);
  if (Mutable)
    CFRelease(Mutable);
  _Block_object_dispose(&v36, 8);
  return v21;
}

uint64_t AMSupportHttpMessageSendSyncWithOptions(__CFHTTPMessage *a1, void *a2, uint64_t a3, CFHTTPMessageRef *a4, uint64_t *a5, uint64_t a6)
{
  void *v12;
  void *v13;
  CFTypeID TypeID;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  const __CFNumber *v21;
  const __CFNumber *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  unsigned int v31;
  const char *v32;
  char v34;
  _QWORD *v35;
  uint64_t *v36;
  _QWORD *v37;
  CFTypeRef v38;
  uint64_t v39;
  CFTypeRef cf;
  unsigned int v41;
  int valuePtr;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  if (!a2
    || !objc_msgSend(a2, "objectForKey:", CFSTR("ValidResponses"))
    && !objc_msgSend(a2, "objectForKey:", CFSTR("MaxAttempts")))
  {
    return _AMSupportHttpMessageSendSyncNoRetry(a1, a2, a3, a4, a5, a6);
  }
  v12 = (void *)MEMORY[0x20BD2E238]();
  v41 = 1;
  valuePtr = 1;
  v39 = -1;
  cf = 0;
  v38 = 0;
  v13 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("ValidResponses"));
  if (v13)
  {
    TypeID = CFSetGetTypeID();
    if (TypeID != CFGetTypeID(v13))
    {
      AMSupportLogInternal(3, (uint64_t)"_AMSupportHttpMessageSendSyncRetry", (uint64_t)"kAMSupportHttpOptionValidResponses is not a CFSet", v15, v16, v17, v18, v19, v34);
      v29 = 16;
      goto LABEL_44;
    }
  }
  v35 = a4;
  v36 = a5;
  v37 = (_QWORD *)a6;
  v20 = 1;
  while (1)
  {
    v21 = (const __CFNumber *)objc_msgSend(a2, "objectForKey:", CFSTR("Backoff"));
    if (!v21 || !CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr))
      valuePtr = 1;
    v22 = (const __CFNumber *)objc_msgSend(a2, "objectForKey:", CFSTR("MaxAttempts"));
    if (!v22 || !CFNumberGetValue(v22, kCFNumberSInt32Type, &v41))
      v41 = 1;
    v23 = _AMSupportHttpMessageSendSyncNoRetry(a1, a2, a3, (CFHTTPMessageRef *)&cf, &v39, (uint64_t)&v38);
    v29 = v23;
    if ((_DWORD)v23)
    {
      AMSupportLogInternal(3, (uint64_t)"_AMSupportHttpMessageSendSyncRetry", (uint64_t)"HTTP request failed (status=%d)", v24, v25, v26, v27, v28, v23);
      v30 = 1;
    }
    else
    {
      v30 = 0;
    }
    if (v38)
    {
      AMSupportLogInternal(3, (uint64_t)"_AMSupportHttpMessageSendSyncRetry", (uint64_t)"URL connection error occurred: %@", v24, v25, v26, v27, v28, (char)v38);
      v30 = 1;
    }
    if (cf)
    {
      if (!v13)
        goto LABEL_23;
    }
    else
    {
      AMSupportLogInternal(3, (uint64_t)"_AMSupportHttpMessageSendSyncRetry", (uint64_t)"HTTP request failed, httpResponseHeader is NULL", v24, v25, v26, v27, v28, v34);
      v30 = 1;
      if (!v13)
        goto LABEL_23;
    }
    if (!objc_msgSend(v13, "member:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v39)))
    {
      AMSupportLogInternal(3, (uint64_t)"_AMSupportHttpMessageSendSyncRetry", (uint64_t)"HTTP server returned unexpected HTTP response code %ld", v24, v25, v26, v27, v28, v39);
      goto LABEL_26;
    }
LABEL_23:
    if (!v30)
      break;
LABEL_26:
    if (v20 < v41)
    {
      v31 = valuePtr * v20;
      AMSupportLogInternal(3, (uint64_t)"_AMSupportHttpMessageSendSyncRetry", (uint64_t)"-------------------- Attempt %d of %d failed, sleeping for %d seconds --------------------", v24, v25, v26, v27, v28, v20);
      sleep(v31);
      v39 = -1;
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
      if (v38)
      {
        CFRelease(v38);
        v38 = 0;
      }
    }
    if (++v20 > v41)
    {
      v34 = v41;
      v32 = "!!!!!!!!!!!!!!!!!!!!!!!!!! Retries exhausted on attempt %d !!!!!!!!!!!!!!!!!!!!!!!!!!";
LABEL_33:
      AMSupportLogInternal(3, (uint64_t)"_AMSupportHttpMessageSendSyncRetry", (uint64_t)v32, v24, v25, v26, v27, v28, v34);
      goto LABEL_44;
    }
  }
  if (!cf)
  {
    v32 = "HTTP request failed, httpResponse is NULL";
    goto LABEL_33;
  }
  if (v35)
    *v35 = CFRetain(cf);
  if (v36 && v39)
    *v36 = v39;
  if (v37 && v38)
    *v37 = CFRetain(v38);
LABEL_44:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v38)
    CFRelease(v38);
  objc_autoreleasePoolPop(v12);
  return v29;
}

uint64_t _AMSupportHttpMessageSendSyncNoRetry(__CFHTTPMessage *a1, void *a2, uint64_t a3, CFHTTPMessageRef *a4, _QWORD *a5, uint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  CFURLRef v18;
  __CFString *v19;
  CFDictionaryRef v20;
  CFDataRef v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __CFHTTPMessage *v27;
  __CFHTTPMessage *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  AMSupportOSURLConnectionDelegate *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  const __CFData *v39;
  CFIndex v40;
  CFHTTPMessageRef Response;
  uint64_t v42;
  char v44;
  void *v45;

  v45 = (void *)MEMORY[0x20BD2E238]();
  if (!a1)
  {
    AMSupportLogInternal(3, (uint64_t)"_AMSupportHttpMessageSendSyncNoRetry", (uint64_t)"httpRequest is NULL", v12, v13, v14, v15, v16, v44);
    v17 = 0;
    v36 = 0;
    v35 = 0;
    v42 = 1;
    goto LABEL_22;
  }
  v17 = objc_alloc_init(MEMORY[0x24BDB7458]);
  v18 = CFHTTPMessageCopyRequestURL(a1);
  v19 = (__CFString *)CFHTTPMessageCopyRequestMethod(a1);
  v20 = CFHTTPMessageCopyAllHeaderFields(a1);
  v21 = CFHTTPMessageCopyBody(a1);
  objc_msgSend(v17, "setURL:", v18);
  objc_msgSend(v17, "setHTTPMethod:", v19);
  objc_msgSend(v17, "setAllHTTPHeaderFields:", v20);
  objc_msgSend(v17, "setHTTPBody:", v21);

  if (!v17)
  {
    v42 = 3;
    AMSupportLogInternal(3, (uint64_t)"_AMSupportHttpMessageSendSyncNoRetry", (uint64_t)"request is nil", v22, v23, v24, v25, v26, v44);
    v36 = 0;
    a1 = 0;
    v35 = 0;
    goto LABEL_22;
  }
  v27 = (__CFHTTPMessage *)objc_msgSend(a2, "objectForKey:", CFSTR("SocksProxySettings"));
  if (v27)
  {
    a1 = v27;
    v28 = v27;
LABEL_5:
    if (!objc_msgSend(v17, "_CFURLRequest"))
    {
      AMSupportLogInternal(4, (uint64_t)"_AMSupportHttpMessageSendSyncNoRetry", (uint64_t)"CFMutableRequestRef could not be retrieved to set proxy settings", v29, v30, v31, v32, v33, v44);
      v36 = 0;
      v35 = 0;
LABEL_26:
      v42 = 16;
      goto LABEL_22;
    }
    CFURLRequestSetProxySettings();
    goto LABEL_11;
  }
  if ((objc_msgSend((id)objc_msgSend(a2, "objectForKey:", CFSTR("UsePurpleReverseProxy")), "BOOLValue") & 1) == 0)
  {
    a1 = 0;
    goto LABEL_11;
  }
  a1 = (__CFHTTPMessage *)AMSupportHttpCopyProxySettings(0, 0);
  if (a1)
    goto LABEL_5;
LABEL_11:
  v34 = (void *)objc_msgSend(a2, "objectForKey:", CFSTR("Timeout"));
  if (v34)
  {
    objc_msgSend(v34, "doubleValue");
    objc_msgSend(v17, "setTimeoutInterval:");
  }
  v35 = -[AMSupportOSURLConnectionDelegate initWithData:Options:]([AMSupportOSURLConnectionDelegate alloc], "initWithData:Options:", a3, a2);
  v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB7478]), "initWithRequest:delegate:startImmediately:", v17, v35, 1);
  v37 = -[AMSupportOSURLConnectionDelegate waitForResponseOrError:](v35, "waitForResponseOrError:", a6);
  if (!v37)
    goto LABEL_26;
  v38 = (void *)v37;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a5)
      *a5 = objc_msgSend(v38, "statusCode");
    if (a4)
    {
      v39 = -[AMSupportOSURLConnectionDelegate data](v35, "data");
      v40 = objc_msgSend(v38, "statusCode");
      Response = CFHTTPMessageCreateResponse((CFAllocatorRef)*MEMORY[0x24BDBD240], v40, (CFStringRef)objc_msgSend(MEMORY[0x24BDB7450], "localizedStringForStatusCode:", v40), CFSTR("HTTP/1.1"));
      if (Response)
      {
        CFDictionaryApplyFunction((CFDictionaryRef)objc_msgSend(v38, "allHeaderFields"), (CFDictionaryApplierFunction)_CFHTTPMessageSetHeader, Response);
        CFHTTPMessageSetBody(Response, v39);
      }
      *a4 = Response;
    }
  }
  v42 = 16 * (-[AMSupportOSURLConnectionDelegate error](v35, "error") != 0);
LABEL_22:

  objc_autoreleasePoolPop(v45);
  return v42;
}

uint64_t AMSupportHttpURLSessionSendSync(void *a1, uint64_t a2, CFTypeRef *a3, CFTypeRef *a4, uint64_t *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  void *Value;
  CFTypeID TypeID;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  unsigned int v22;
  const __CFNumber *v23;
  const __CFNumber *v24;
  dispatch_semaphore_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  unsigned int v46;
  unsigned int v47;
  const char *v49;
  char v50;
  void *context;
  uint64_t v55;
  unsigned int v56;
  int valuePtr;
  _QWORD v58[9];
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  void (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  void (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  uint64_t v80;
  uint64_t v81;

  v81 = *MEMORY[0x24BDAC8D0];
  context = (void *)MEMORY[0x20BD2E238]();
  v56 = 1;
  valuePtr = 1;
  if (!a1)
  {
    v49 = "Session is NULL";
LABEL_62:
    AMSupportLogInternal(3, (uint64_t)"AMSupportHttpURLSessionSendSync", (uint64_t)v49, v7, v8, v9, v10, v11, v50);
    v37 = 2;
    goto LABEL_58;
  }
  if (!a2)
  {
    v49 = "Failed to create session";
    goto LABEL_62;
  }
  v12 = (const __CFDictionary *)objc_msgSend(a1, "options");
  Value = (void *)CFDictionaryGetValue(v12, CFSTR("ValidResponses"));
  if (Value)
  {
    TypeID = CFSetGetTypeID();
    if (TypeID != CFGetTypeID(Value))
    {
      AMSupportLogInternal(3, (uint64_t)"AMSupportHttpURLSessionSendSync", (uint64_t)"kAMSupportHttpOptionValidResponses is not an NSSet", v15, v16, v17, v18, v19, v50);
      v37 = 16;
      goto LABEL_58;
    }
  }
  v55 = a2;
  v20 = 0;
  v21 = 0;
  v22 = 1;
  do
  {
    if (v21)
      CFRelease(v21);
    if (v20)
      CFRelease(v20);
    v23 = (const __CFNumber *)CFDictionaryGetValue(v12, CFSTR("Backoff"));
    if (!v23 || !CFNumberGetValue(v23, kCFNumberSInt32Type, &valuePtr))
      valuePtr = 1;
    v24 = (const __CFNumber *)CFDictionaryGetValue(v12, CFSTR("MaxAttempts"));
    if (!v24 || !CFNumberGetValue(v24, kCFNumberSInt32Type, &v56))
      v56 = 1;
    v75 = 0;
    v76 = &v75;
    v77 = 0x3052000000;
    v78 = __Block_byref_object_copy_;
    v79 = __Block_byref_object_dispose_;
    v80 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x3052000000;
    v72 = __Block_byref_object_copy_;
    v73 = __Block_byref_object_dispose_;
    v74 = 0;
    v63 = 0;
    v64 = &v63;
    v65 = 0x3052000000;
    v66 = __Block_byref_object_copy_;
    v67 = __Block_byref_object_dispose_;
    v68 = 0;
    v59 = 0;
    v60 = &v59;
    v61 = 0x2020000000;
    v62 = 0;
    v25 = dispatch_semaphore_create(0);
    v31 = v25;
    if (!v25)
    {
      AMSupportLogInternal(3, (uint64_t)"_AMSupportHttpURLSessionSendSyncNoRetry", (uint64_t)"Failed to create semaphore", v26, v27, v28, v29, v30, v50);
      v21 = 0;
      v20 = 0;
      v37 = 2;
LABEL_21:
      v38 = -1;
      goto LABEL_24;
    }
    v58[0] = MEMORY[0x24BDAC760];
    v58[1] = 3221225472;
    v58[2] = ___AMSupportHttpURLSessionSendSyncNoRetry_block_invoke;
    v58[3] = &unk_24C381A40;
    v58[6] = &v69;
    v58[7] = &v63;
    v58[8] = &v59;
    v58[4] = v25;
    v58[5] = &v75;
    objc_msgSend(a1, "sendRequest:completion:", v55, v58);
    dispatch_semaphore_wait(v31, 0xFFFFFFFFFFFFFFFFLL);
    if (v64[5])
    {
      AMSupportLogInternal(3, (uint64_t)"_AMSupportHttpURLSessionSendSyncNoRetry", (uint64_t)"HTTP request failed with error %@", v32, v33, v34, v35, v36, v64[5]);
      v21 = 0;
      v20 = 0;
      if (objc_msgSend(a1, "sslEvalFailed"))
        v37 = 23;
      else
        v37 = 16;
      goto LABEL_21;
    }
    v39 = (void *)v76[5];
    if (!v39)
    {
      AMSupportLogInternal(3, (uint64_t)"_AMSupportHttpURLSessionSendSyncNoRetry", (uint64_t)"HTTP request provided no response data", v32, v33, v34, v35, v36, v50);
      v21 = 0;
      v20 = 0;
      v37 = 16;
      goto LABEL_21;
    }
    v21 = v39;
    v20 = (id)v70[5];
    v37 = 0;
    v38 = *((int *)v60 + 6);
LABEL_24:

    if (v31)
      dispatch_release(v31);
    _Block_object_dispose(&v59, 8);
    _Block_object_dispose(&v63, 8);
    _Block_object_dispose(&v69, 8);
    _Block_object_dispose(&v75, 8);
    v45 = v37;
    if ((_DWORD)v37)
    {
      if ((_DWORD)v37 == 23)
      {
        AMSupportLogInternal(3, (uint64_t)"AMSupportHttpURLSessionSendSync", (uint64_t)"SSL trust evaluation failed", v40, v41, v42, v43, v44, v50);
        goto LABEL_54;
      }
      AMSupportLogInternal(3, (uint64_t)"AMSupportHttpURLSessionSendSync", (uint64_t)"HTTP request failed (status=%d)", v40, v41, v42, v43, v44, v37);
      v45 = 1;
    }
    if (v21)
    {
      if (!Value)
        goto LABEL_34;
    }
    else
    {
      AMSupportLogInternal(3, (uint64_t)"AMSupportHttpURLSessionSendSync", (uint64_t)"HTTP request failed, httpResponseData is NULL", v40, v41, v42, v43, v44, v50);
      v45 = 1;
      if (!Value)
        goto LABEL_34;
    }
    if (!objc_msgSend(Value, "member:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v38)))
    {
      AMSupportLogInternal(3, (uint64_t)"AMSupportHttpURLSessionSendSync", (uint64_t)"HTTP server returned unexpected HTTP response code %ld", v40, v41, v42, v43, v44, v38);
      goto LABEL_37;
    }
LABEL_34:
    if (!v45)
    {
      if (a3 && v21)
        *a3 = CFRetain(v21);
      if (a4 && v20)
        *a4 = CFRetain(v20);
      if (a5 && v38)
        *a5 = v38;
      goto LABEL_54;
    }
LABEL_37:
    v46 = v56;
    if (v22 < v56)
    {
      v47 = valuePtr * v22;
      AMSupportLogInternal(3, (uint64_t)"AMSupportHttpURLSessionSendSync", (uint64_t)"-------------------- Attempt %d of %d failed, sleeping for %d seconds --------------------", v40, v41, v42, v43, v44, v22);
      sleep(v47);
      v46 = v56;
    }
    ++v22;
  }
  while (v22 <= v46);
  if (v46 >= 2)
    AMSupportLogInternal(3, (uint64_t)"AMSupportHttpURLSessionSendSync", (uint64_t)"!!!!!!!!!!!!!!!!!!!!!!!!!! Retries exhausted on attempt %d !!!!!!!!!!!!!!!!!!!!!!!!!!", v40, v41, v42, v43, v44, v46);
LABEL_54:
  if (v21)
    CFRelease(v21);
  if (v20)
    CFRelease(v20);
LABEL_58:
  objc_autoreleasePoolPop(context);
  return v37;
}

void sub_20AC13914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 176), 8);
  _Unwind_Resume(a1);
}

AMSupportOSURLSession *AMSupportHttpURLSessionCreateWithOptions(uint64_t a1)
{
  return -[AMSupportOSURLSession initWithOptions:]([AMSupportOSURLSession alloc], "initWithOptions:", a1);
}

uint64_t AMSupportHttpSendSync(uint64_t a1, uint64_t a2, CFTypeRef *a3, CFTypeRef *a4, uint64_t *a5)
{
  void *v10;
  AMSupportOSURLSession *v11;
  uint64_t v12;

  v10 = (void *)MEMORY[0x20BD2E238]();
  v11 = -[AMSupportOSURLSession initWithOptions:]([AMSupportOSURLSession alloc], "initWithOptions:", a2);
  v12 = AMSupportHttpURLSessionSendSync(v11, a1, a3, a4, a5);
  -[AMSupportOSURLSession invalidateAndCancel](v11, "invalidateAndCancel");
  AMSupportSafeRelease(v11);
  objc_autoreleasePoolPop(v10);
  return v12;
}

void _CFHTTPMessageSetHeader(CFStringRef headerField, CFStringRef value, CFHTTPMessageRef message)
{
  CFHTTPMessageSetHeaderFieldValue(message, headerField, value);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t (*AMSupportLogSetHandler(uint64_t (*result)(int level)))(int level)
{
  uint64_t (*v1)(int);

  v1 = (uint64_t (*)(int))_DefaultLogHandler;
  if (result)
    v1 = result;
  _logHandler = v1;
  return result;
}

uint64_t _DefaultLogHandler(int level, const char *a2)
{
  return asl_log(0, 0, level, "%s", a2);
}

void AMSupportLogInternal(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  int v14;
  const char *v15;
  unsigned int v16;
  const __CFAllocator *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int Length;
  unsigned int v24;
  char *v25;
  char *v26;
  char *v27;
  char __str[4096];
  uint64_t v29;

  v9 = MEMORY[0x24BDAC7A8]();
  v11 = v10;
  v13 = v12;
  v14 = v9;
  v29 = *MEMORY[0x24BDAC8D0];
  bzero(__str, 0x1000uLL);
  v15 = "";
  if (v13)
    v15 = v13;
  v16 = snprintf(__str, 0x1000uLL, "%s: ", v15);
  v17 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v18 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], v11, 0x8000100u, (CFAllocatorRef)*MEMORY[0x24BDBD258]);
  if (!v18)
  {
    v20 = 0;
    goto LABEL_9;
  }
  v19 = CFStringCreateWithFormatAndArguments(v17, 0, v18, &a9);
  v20 = v19;
  if (!v19)
  {
LABEL_9:
    v27 = 0;
    goto LABEL_12;
  }
  v21 = v16;
  v22 = 4096 - v16;
  Length = CFStringGetLength(v19);
  v24 = Length;
  if (4096 - v16 < Length && (v25 = (char *)malloc_type_malloc(v16 + Length + 1, 0xD6DA2896uLL)) != 0)
  {
    v26 = v25;
    v22 = v24 + 1;
    memcpy(v25, __str, v16);
    v27 = v26;
  }
  else
  {
    v27 = 0;
    v26 = __str;
  }
  CFStringGetCString(v20, &v26[v21], v22, 0x8000100u);
LABEL_12:
  _logHandler(v14);
  AMSupportSafeRelease(v18);
  AMSupportSafeRelease(v20);
  AMSupportSafeFree(v27);
}

uint64_t AMSupportDebugWriteObject(const __CFAllocator *a1, const void *a2, CFTypeRef cf, uint64_t a4)
{
  CFTypeID v8;
  const __CFData *Data;
  const char *v10;
  CFTypeID v11;
  CFTypeID v12;
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
  const __CFString *v23;
  const __CFString *v24;
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
  char v37;
  CFTypeRef cfa;
  CFErrorRef error[2];

  error[1] = *(CFErrorRef *)MEMORY[0x24BDAC8D0];
  cfa = 0;
  error[0] = 0;
  if (!a2)
    goto LABEL_17;
  v8 = CFGetTypeID(cf);
  if (v8 != CFDataGetTypeID())
  {
    v11 = CFGetTypeID(cf);
    if (v11 == CFDictionaryGetTypeID() || (v12 = CFGetTypeID(cf), v12 == CFArrayGetTypeID()))
    {
      Data = CFPropertyListCreateData(a1, cf, kCFPropertyListXMLFormat_v1_0, 0, error);
      if (!Data)
      {
        v25 = 3;
        AMSupportLogInternal(3, (uint64_t)"AMSupportDebugWriteObject", (uint64_t)"failed to create debugData: %@", v18, v19, v20, v21, v22, (char)error[0]);
        goto LABEL_18;
      }
      v10 = ".plist";
      goto LABEL_9;
    }
    AMSupportLogInternal(3, (uint64_t)"AMSupportDebugWriteObject", (uint64_t)"can't prepare data for output to file", v13, v14, v15, v16, v17, v37);
    AMSupportLogInternal(7, (uint64_t)"AMSupportDebugWriteObject", (uint64_t)"%@", v31, v32, v33, v34, v35, (char)cf);
LABEL_17:
    Data = 0;
    v25 = 1;
    goto LABEL_18;
  }
  Data = (const __CFData *)CFRetain(cf);
  if (!Data)
  {
    v25 = 0;
    goto LABEL_18;
  }
  v10 = "";
LABEL_9:
  v23 = CFStringCreateWithFormat(a1, 0, CFSTR("%@%s"), a4, v10);
  if (v23)
  {
    v24 = v23;
    v25 = AMSupportCopyURLWithAppendedComponent(a1, a2, v23, 0, (CFURLRef *)&cfa);
    CFRelease(v24);
    if (!(_DWORD)v25)
    {
      v25 = AMSupportWriteDataToFileURL(a1, Data, (const __CFURL *)cfa, 0);
      AMSupportLogInternal(7, (uint64_t)"AMSupportDebugWriteObject", (uint64_t)"debug object written: %@", v26, v27, v28, v29, v30, (char)cfa);
    }
  }
  else
  {
    v25 = 2;
  }
LABEL_18:
  AMSupportSafeRelease(Data);
  AMSupportSafeRelease(cfa);
  AMSupportSafeRelease(error[0]);
  return v25;
}

CFMutableDictionaryRef AMSupportCreateErrorInternal(CFMutableDictionaryRef result, const __CFString *a2, CFIndex a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  CFErrorRef *v13;
  const __CFAllocator *v14;
  __CFDictionary *v15;
  CFStringRef v16;
  CFStringRef v17;

  if (result)
  {
    v13 = (CFErrorRef *)result;
    v14 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (result)
    {
      v15 = result;
      v16 = CFStringCreateWithFormatAndArguments(v14, 0, a5, &a9);
      if (v16)
      {
        v17 = v16;
        CFDictionaryAddValue(v15, (const void *)*MEMORY[0x24BDBD378], v16);
        CFRelease(v17);
      }
      if (a4)
        CFDictionaryAddValue(v15, (const void *)*MEMORY[0x24BDBD3B0], a4);
      *v13 = CFErrorCreate(v14, a2, a3, v15);
      CFRelease(v15);
      return (CFMutableDictionaryRef)1;
    }
  }
  return result;
}

void AMSupportLogDumpMemory(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  unsigned __int8 *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;
  int v20;
  char v21;
  _OWORD v22[4];
  uint64_t v23;

  v8 = a5;
  v9 = (unsigned __int8 *)a4;
  v23 = *MEMORY[0x24BDAC8D0];
  memset(v22, 0, sizeof(v22));
  AMSupportLogInternal(a1, a2, (uint64_t)"[%s: %u bytes]", a4, a5, a6, a7, a8, a3);
  if (v8 >= 1)
  {
    v16 = 0;
    v17 = 0;
    v18 = v8 + 1;
    do
    {
      v19 = *v9++;
      v20 = snprintf((char *)v22 + v17, 64 - v17, "%02x ", v19);
      if (++v16 > 0xF || v18 == 2)
      {
        AMSupportLogInternal(a1, (uint64_t)"", (uint64_t)"%s", v11, v12, v13, v14, v15, (char)v22);
        v17 = 0;
        v16 = 0;
      }
      else
      {
        v17 += v20;
      }
      --v18;
    }
    while (v18 > 1);
  }
  AMSupportLogInternal(a1, (uint64_t)"", (uint64_t)"-----------------------------------------------", v11, v12, v13, v14, v15, v21);
}

uint64_t AMSupportLogFormat(char *__format, ...)
{
  char __str[16];
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
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  va_list va;

  va_start(va, __format);
  v18 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  *(_OWORD *)__str = 0u;
  v3 = 0u;
  vsnprintf(__str, 0x100uLL, __format, va);
  return fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s\n", __str);
}

uint64_t AMSupportPlatformCreateSoftLink(const __CFURL *a1, const __CFURL *a2)
{
  uint64_t result;
  int *v5;
  char v6;
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
  UInt8 v17[1024];
  UInt8 buffer[1024];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  bzero(buffer, 0x400uLL);
  bzero(v17, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a2, 1u, buffer, 1024)
    || !CFURLGetFileSystemRepresentation(a1, 1u, v17, 1024))
  {
    return 3;
  }
  result = symlink((const char *)buffer, (const char *)v17);
  if ((_DWORD)result)
  {
    v5 = __error();
    v6 = strerror(*v5);
    AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformCreateSoftLink", (uint64_t)"failed to create link: %s", v7, v8, v9, v10, v11, v6);
    AMSupportLogInternal(7, (uint64_t)"AMSupportPlatformCreateSoftLink", (uint64_t)"source path: %s; dest path: %s",
      v12,
      v13,
      v14,
      v15,
      v16,
      (char)buffer);
    return 4;
  }
  return result;
}

char *AMSupportPlatformMakeDirectoryForURL(const __CFURL *a1)
{
  size_t v2;
  size_t v3;
  BOOL v4;
  char *result;
  const char *v6;
  int *v7;
  char v8;
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
  char *__stringp;
  char __delim[2];
  stat v21;
  UInt8 buffer[1024];
  char __str[1024];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  strcpy(__delim, "/");
  bzero(__str, 0x400uLL);
  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
    return (char *)3;
  v2 = strlen((const char *)buffer);
  if (!CFURLHasDirectoryPath(a1))
  {
    if (v2)
    {
      do
      {
        v3 = v2 - 1;
        v4 = buffer[v2 - 1] == 47 || v2 == 1;
        --v2;
      }
      while (!v4);
    }
    else
    {
      v3 = 0;
    }
    buffer[v3] = 0;
  }
  __stringp = (char *)buffer;
  result = strsep(&__stringp, __delim);
  if (result)
  {
    v6 = "Could not stat (%s)";
    while (1)
    {
      memset(&v21, 0, sizeof(v21));
      if (*result)
      {
        snprintf(__str, 0x400uLL, "%s%c%s", __str, 47, result);
        if (stat(__str, &v21) == -1)
        {
          if (*__error() != 2)
            goto LABEL_23;
          if (mkdir(__str, 0x1EDu) == -1 && *__error() != 17)
            break;
        }
      }
      result = strsep(&__stringp, __delim);
      if (!result)
        return result;
    }
    v6 = "Could not mkdir (%s)";
LABEL_23:
    v7 = __error();
    v8 = strerror(*v7);
    AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformMakeDirectoryForURL", (uint64_t)v6, v9, v10, v11, v12, v13, v8);
    AMSupportLogInternal(7, (uint64_t)"AMSupportPlatformMakeDirectoryForURL", (uint64_t)"%s", v14, v15, v16, v17, v18, (char)__str);
    return (char *)4;
  }
  return result;
}

uint64_t AMSupportPlatformMapFileIntoMemory(const __CFURL *a1, _QWORD *a2, off_t *a3)
{
  int v6;
  int v7;
  void *v8;
  uint64_t v9;
  int *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int *v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  UInt8 buffer[1024];
  stat v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    AMSupportPlatformMapFileIntoMemory_cold_1();
  if (!a2)
    AMSupportPlatformMapFileIntoMemory_cold_2();
  if (!a3)
    AMSupportPlatformMapFileIntoMemory_cold_3();
  memset(&v33, 0, sizeof(v33));
  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
    return 3;
  v6 = open((const char *)buffer, 0);
  if (v6 < 0)
  {
    v10 = __error();
    v11 = strerror(*v10);
    AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformMapFileIntoMemory", (uint64_t)"failed to open file for reading: %s", v12, v13, v14, v15, v16, v11);
    return 4;
  }
  else
  {
    v7 = v6;
    if (fstat(v6, &v33) == -1)
    {
      v17 = __error();
      v18 = strerror(*v17);
      AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformMapFileIntoMemory", (uint64_t)"failed to stat file: %s", v19, v20, v21, v22, v23, v18);
      v9 = 4;
    }
    else
    {
      v8 = mmap(0, v33.st_size, 1, 2, v7, 0);
      if (v8 == (void *)-1)
      {
        v24 = __error();
        v25 = strerror(*v24);
        AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformMapFileIntoMemory", (uint64_t)"failed to map file into memory: %s", v26, v27, v28, v29, v30, v25);
        v9 = 2;
      }
      else
      {
        v9 = 0;
        *a2 = v8;
        *a3 = v33.st_size;
      }
    }
    close(v7);
  }
  return v9;
}

uint64_t AMSupportPlatformUnmapMemory(void *a1, size_t a2)
{
  uint64_t result;
  int *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = munmap(a1, a2);
  if ((_DWORD)result)
  {
    v3 = __error();
    v4 = strerror(*v3);
    AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformUnmapMemory", (uint64_t)"munmap() returned error: %s", v5, v6, v7, v8, v9, v4);
    return 1;
  }
  return result;
}

uint64_t AMSupportPlatformRemoveDirectory(const __CFURL *a1)
{
  int *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
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
  int v17;
  UInt8 buffer[1024];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
    return 3;
  v17 = 0;
  v2 = &v17;
  v3 = _AMSupportPlatformRemoveDirectoryRecursion((const char *)buffer, &v17);
  if ((_DWORD)v3)
  {
    v4 = v3;
  }
  else
  {
    if (!rmdir((const char *)buffer))
      return 0;
    v4 = 4;
    v2 = __error();
  }
  v5 = strerror(*v2);
  AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformRemoveDirectory", (uint64_t)"failed to remove directory: %s", v6, v7, v8, v9, v10, v5);
  AMSupportLogInternal(7, (uint64_t)"AMSupportPlatformRemoveDirectory", (uint64_t)"url=%@, path=%s", v11, v12, v13, v14, v15, (char)a1);
  return v4;
}

uint64_t _AMSupportPlatformRemoveDirectoryRecursion(const char *a1, int *a2)
{
  DIR *v4;
  DIR *v5;
  dirent *i;
  const char *d_name;
  uint64_t result;
  stat v9;
  char __str[1024];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = opendir(a1);
  if (!v4)
    goto LABEL_13;
  v5 = v4;
  for (i = readdir(v4); i; i = readdir(v5))
  {
    d_name = i->d_name;
    if (strncmp(i->d_name, ".", 0x400uLL))
    {
      if (strncmp(d_name, "..", 0x400uLL))
      {
        bzero(__str, 0x400uLL);
        snprintf(__str, 0x400uLL, "%s%c%s", a1, 47, d_name);
        memset(&v9, 0, sizeof(v9));
        if (!lstat(__str, &v9))
        {
          if ((v9.st_mode & 0x4000) != 0)
          {
            if (_AMSupportPlatformRemoveDirectoryRecursion(__str, a2))
              return 4;
            if (rmdir(__str))
              goto LABEL_13;
          }
          else if (unlink(__str))
          {
            goto LABEL_13;
          }
        }
      }
    }
  }
  result = closedir(v5);
  if ((_DWORD)result)
  {
LABEL_13:
    *a2 = *__error();
    return 4;
  }
  return result;
}

uint64_t AMSupportPlatformRemoveFile(const __CFURL *a1)
{
  std::error_code *v2;
  uint64_t result;
  int *v4;
  char v5;
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
  std::__fs::filesystem::path buffer[42];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a1, 1u, (UInt8 *)buffer, 1024))
    return 3;
  result = remove(buffer, v2);
  if ((_DWORD)result)
  {
    v4 = __error();
    v5 = strerror(*v4);
    AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformRemoveFile", (uint64_t)"failed to file: %s", v6, v7, v8, v9, v10, v5);
    AMSupportLogInternal(7, (uint64_t)"AMSupportPlatformRemoveFile", (uint64_t)"url=%@, path=%s", v11, v12, v13, v14, v15, (char)a1);
    return 4;
  }
  return result;
}

uint64_t AMSupportPlatformCopyURLToNewTempDirectory(const __CFAllocator *a1, const char *a2, CFURLRef *a3)
{
  uint64_t result;
  CFIndex v7;
  CFURLRef v8;
  CFURLRef v9;
  int *v10;
  char v11;
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
  char __str[1024];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  result = 1;
  if (a2 && a3)
  {
    bzero(__str, 0x400uLL);
    snprintf(__str, 0x400uLL, "/tmp/%s", a2);
    if (mkdtemp(__str))
    {
      v7 = strlen(__str);
      v8 = CFURLCreateFromFileSystemRepresentation(a1, (const UInt8 *)__str, v7, 1u);
      if (v8)
      {
        v9 = v8;
        result = 0;
        *a3 = v9;
      }
      else
      {
        unlink(__str);
        return 2;
      }
    }
    else
    {
      v10 = __error();
      v11 = strerror(*v10);
      AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformCopyURLToNewTempDirectory", (uint64_t)"failed to create tmp dir: %s", v12, v13, v14, v15, v16, v11);
      AMSupportLogInternal(8, (uint64_t)"AMSupportPlatformCopyURLToNewTempDirectory", (uint64_t)"tmp dir template: %s", v17, v18, v19, v20, v21, (char)a2);
      return 4;
    }
  }
  return result;
}

uint64_t AMSupportPlatformWriteBufferToNativeFilePath(char *a1, unint64_t a2, char *a3, int a4)
{
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  size_t v11;
  ssize_t v12;
  int *v14;
  char v15;
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

  v7 = 420;
  if (a4)
    v7 = 436;
  v8 = open(a3, 1537, v7);
  if ((v8 & 0x80000000) == 0)
  {
    v9 = v8;
    if (!a2)
    {
LABEL_8:
      close(v9);
      return 0;
    }
    v10 = 0;
    v11 = a2;
    while (1)
    {
      v12 = write(v9, a1, v11);
      if (v12 <= 0)
        break;
      a1 += v12;
      v11 -= v12;
      v10 += v12;
      if (v10 >= a2)
        goto LABEL_8;
    }
    close(v9);
    unlink(a3);
  }
  v14 = __error();
  v15 = strerror(*v14);
  AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformWriteBufferToNativeFilePath", (uint64_t)"failed to open file for writing: %s", v16, v17, v18, v19, v20, v15);
  AMSupportLogInternal(7, (uint64_t)"AMSupportPlatformWriteBufferToNativeFilePath", (uint64_t)"path: %s", v21, v22, v23, v24, v25, (char)a3);
  return 4;
}

uint64_t AMSupportPlatformWriteDataToFileURL(const __CFData *a1, const __CFURL *a2)
{
  char *BytePtr;
  CFIndex Length;
  UInt8 buffer[1024];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a2, 1u, buffer, 1024))
    return 3;
  BytePtr = (char *)CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  return AMSupportPlatformWriteBufferToNativeFilePath(BytePtr, Length, (char *)buffer, 0);
}

uint64_t AMSupportPlatformWriteDataToFileURLUncached(const __CFData *a1, const __CFURL *a2)
{
  char *BytePtr;
  CFIndex Length;
  UInt8 buffer[1024];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  bzero(buffer, 0x400uLL);
  if (!CFURLGetFileSystemRepresentation(a2, 1u, buffer, 1024))
    return 3;
  BytePtr = (char *)CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  return AMSupportPlatformWriteBufferToNativeFilePath(BytePtr, Length, (char *)buffer, 1);
}

uint64_t AMSupportPlatformCopyURLWithAppendedComponent(const __CFAllocator *a1, CFTypeRef cf, const __CFString *a3, Boolean a4, CFURLRef *a5)
{
  CFTypeID v10;
  CFTypeID v11;
  uint64_t result;
  CFURLRef v13;
  CFURLRef v14;

  if (!cf)
    return 1;
  v10 = CFGetTypeID(cf);
  v11 = CFURLGetTypeID();
  result = 1;
  if (a5 && a3 && v10 == v11)
  {
    v13 = CFURLCreateCopyAppendingPathComponent(a1, (CFURLRef)cf, a3, a4);
    if (v13)
    {
      v14 = v13;
      result = 0;
      *a5 = v14;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t AMSupportPlatformFileURLExists(const __CFURL *a1, BOOL *a2)
{
  uint64_t result;
  int v5;
  UInt8 v6[1024];
  stat v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  result = 1;
  if (a1 && a2)
  {
    memset(&v7, 0, sizeof(v7));
    bzero(v6, 0x400uLL);
    if (CFURLGetFileSystemRepresentation(a1, 1u, v6, 1024))
    {
      v5 = stat((const char *)v6, &v7);
      result = 0;
      *a2 = v5 == 0;
    }
    else
    {
      return 3;
    }
  }
  return result;
}

uint64_t AMSupportPlatformCreateBufferFromNativeFilePath(_QWORD *a1, off_t *a2, char *a3)
{
  char v3;
  int v6;
  int v7;
  off_t st_size;
  void *v9;
  void *v10;
  uint64_t v11;
  int *v12;
  char v13;
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
  int *v24;
  char v25;
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
  int *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int *v42;
  char v43;
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
  stat v55;
  uint64_t v56;

  v3 = (char)a3;
  v56 = *MEMORY[0x24BDAC8D0];
  memset(&v55, 0, sizeof(v55));
  v6 = open(a3, 0, 0);
  if ((v6 & 0x80000000) == 0)
  {
    v7 = v6;
    if (fstat(v6, &v55) < 0)
    {
      v24 = __error();
      v25 = strerror(*v24);
      AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformCreateBufferFromNativeFilePath", (uint64_t)"fstat failed: %s", v26, v27, v28, v29, v30, v25);
      AMSupportLogInternal(7, (uint64_t)"AMSupportPlatformCreateBufferFromNativeFilePath", (uint64_t)"%s", v31, v32, v33, v34, v35, v3);
    }
    else
    {
      st_size = v55.st_size;
      v9 = malloc_type_malloc(v55.st_size, 0xE7096D54uLL);
      if (!v9)
      {
        v36 = __error();
        strerror(*v36);
        AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformCreateBufferFromNativeFilePath", (uint64_t)"malloc(%d) failed: %s", v37, v38, v39, v40, v41, st_size);
        v11 = 2;
        goto LABEL_11;
      }
      v10 = v9;
      if (read(v7, v9, st_size) == st_size)
      {
        v11 = 0;
        *a1 = v10;
        *a2 = st_size;
LABEL_11:
        close(v7);
        return v11;
      }
      v42 = __error();
      v43 = strerror(*v42);
      AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformCreateBufferFromNativeFilePath", (uint64_t)"read failed: %s", v44, v45, v46, v47, v48, v43);
      AMSupportLogInternal(7, (uint64_t)"AMSupportPlatformCreateBufferFromNativeFilePath", (uint64_t)"%s", v49, v50, v51, v52, v53, v3);
      free(v10);
    }
    v11 = 4;
    goto LABEL_11;
  }
  v12 = __error();
  v13 = strerror(*v12);
  AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformCreateBufferFromNativeFilePath", (uint64_t)"open failed: %s", v14, v15, v16, v17, v18, v13);
  AMSupportLogInternal(7, (uint64_t)"AMSupportPlatformCreateBufferFromNativeFilePath", (uint64_t)"%s", v19, v20, v21, v22, v23, v3);
  return 4;
}

uint64_t AMSupportPlatformCreateDataFromFileURL(const __CFAllocator *a1, CFTypeRef *a2, const __CFURL *a3)
{
  uint64_t v6;
  UInt8 *v7;
  CFDataRef v8;
  CFDataRef v9;
  uint64_t v10;
  off_t v12;
  UInt8 *v13;
  UInt8 buffer[1024];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  bzero(buffer, 0x400uLL);
  if (CFURLGetFileSystemRepresentation(a3, 1u, buffer, 1024))
  {
    v12 = 0;
    v13 = 0;
    v6 = AMSupportPlatformCreateBufferFromNativeFilePath(&v13, &v12, (char *)buffer);
    if ((_DWORD)v6)
    {
      v10 = v6;
      v9 = 0;
    }
    else
    {
      v7 = v13;
      v8 = CFDataCreateWithBytesNoCopy(a1, v13, v12, (CFAllocatorRef)*MEMORY[0x24BDBD248]);
      v9 = v8;
      if (v8)
      {
        v10 = 0;
        *a2 = CFRetain(v8);
      }
      else
      {
        free(v7);
        v10 = 2;
      }
    }
  }
  else
  {
    v9 = 0;
    v10 = 3;
  }
  AMSupportSafeRelease(v9);
  return v10;
}

FILE *AMSupportPlatformOpenFileStreamWithURL(const __CFURL *a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  UInt8 buffer[1024];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  bzero(buffer, 0x400uLL);
  if (CFURLGetFileSystemRepresentation(a1, 1u, buffer, 1024))
    return fopen((const char *)buffer, a2);
  AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformOpenFileStreamWithURL", (uint64_t)"failed to convert url to file system representation", v4, v5, v6, v7, v8, v15);
  AMSupportLogInternal(7, (uint64_t)"AMSupportPlatformOpenFileStreamWithURL", (uint64_t)"%@", v10, v11, v12, v13, v14, (char)a1);
  return 0;
}

uint64_t AMSupportPlatformCopyURLWithAppendedExtension(const __CFAllocator *a1, const __CFURL *a2, const __CFString *a3, CFURLRef *a4)
{
  CFURLRef v5;
  CFURLRef v6;
  uint64_t result;

  v5 = CFURLCreateCopyAppendingPathExtension(a1, a2, a3);
  if (!v5)
    return 2;
  v6 = v5;
  result = 0;
  *a4 = v6;
  return result;
}

uint64_t AMSupportPlatformGetURLForTempDirectoryRoot()
{
  pthread_once(&_platformConstantsOnce, (void (*)(void))_AMSupportPlatformConstantsInitialize);
  return _tempDirURL;
}

uint64_t AMSupportPlatformCopyLocalIPAddressString(const __CFAllocator *a1, CFTypeRef *a2)
{
  hostent *v4;
  char *v5;
  CFStringRef v6;
  CFStringRef v7;
  uint64_t v8;
  int *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30[16];
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
  __int128 v44;
  __int128 v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v44 = 0u;
  v45 = 0u;
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
  *(_OWORD *)v30 = 0u;
  v31 = 0u;
  if (gethostname(v30, 0x100uLL))
  {
    v10 = __error();
    v11 = strerror(*v10);
    AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformCopyLocalIPAddressString", (uint64_t)"gethostname() failed: %s", v12, v13, v14, v15, v16, v11);
LABEL_10:
    v7 = 0;
    v8 = 99;
    goto LABEL_6;
  }
  v4 = gethostbyname(v30);
  if (!v4)
  {
    v17 = hstrerror(*MEMORY[0x24BDAE7D8]);
    AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformCopyLocalIPAddressString", (uint64_t)"gethostbyname() failed: %s", v18, v19, v20, v21, v22, v17);
    goto LABEL_10;
  }
  v5 = addr2ascii(2, *(const void **)v4->h_addr_list, 4, 0);
  if (!v5)
  {
    v23 = __error();
    v24 = strerror(*v23);
    AMSupportLogInternal(3, (uint64_t)"AMSupportPlatformCopyLocalIPAddressString", (uint64_t)"addr2ascii() failed: %s", v25, v26, v27, v28, v29, v24);
    goto LABEL_10;
  }
  v6 = CFStringCreateWithCString(a1, v5, 0x8000100u);
  v7 = v6;
  if (v6)
  {
    v8 = 0;
    *a2 = CFRetain(v6);
  }
  else
  {
    v8 = 3;
  }
LABEL_6:
  AMSupportSafeRelease(v7);
  return v8;
}

uint64_t AMSupportPlatformGetPlatformInfoString()
{
  pthread_once(&_platformConstantsOnce, (void (*)(void))_AMSupportPlatformConstantsInitialize);
  return _platformInfoStr;
}

const __CFString *AMSupportPlatformGetSimplePlatformInfoString()
{
  return CFSTR("mac");
}

const __CFString *_AMSupportPlatformConstantsInitialize()
{
  const __CFAllocator *v0;
  const __CFString *result;
  size_t v2;
  _OWORD v3[2];
  _OWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v0 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  _tempDirURL = (uint64_t)CFURLCreateWithFileSystemPath((CFAllocatorRef)*MEMORY[0x24BDBD240], CFSTR("/tmp"), kCFURLPOSIXPathStyle, 1u);
  if (!_tempDirURL)
    _AMSupportPlatformConstantsInitialize_cold_1();
  memset(v4, 0, sizeof(v4));
  memset(v3, 0, sizeof(v3));
  v2 = 32;
  result = (const __CFString *)sysctlbyname("kern.osversion", v4, &v2, 0, 0);
  if (!(_DWORD)result)
  {
    v2 = 32;
    if (!sysctlbyname("hw.product", v3, &v2, 0, 0)
      || (result = (const __CFString *)sysctlbyname("hw.machine", v3, &v2, 0, 0), !(_DWORD)result))
    {
      result = CFStringCreateWithFormat(v0, 0, CFSTR("mac/%s/%s"), v4, v3);
      if (result)
        goto LABEL_6;
    }
  }
  if (!_platformInfoStr)
  {
    result = CFSTR("???");
LABEL_6:
    _platformInfoStr = (uint64_t)result;
  }
  return result;
}

uint64_t AMSupportEcCreatePrivateKeyFromPEMBuffer()
{
  return AMSupportEcCreateKeyFromPEMBuffer();
}

uint64_t AMSupportEcCreatePublicKeyFromPEMBuffer()
{
  return AMSupportEcCreateKeyFromPEMBuffer();
}

uint64_t AMSupportEcCreatePublicKeyFromPrivateKeyPEMBuffer()
{
  return AMSupportEcCreateKeyFromPEMBuffer();
}

uint64_t AMSupportX509ChainEvaluateTrust(__SecTrust *a1, CFArrayRef theArray, _DWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char Count;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CFIndex CertificateCount;
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
  __SecCertificate *CertificateAtIndex;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  int v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  CFIndex v49;
  __SecCertificate *ValueAtIndex;
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
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  int v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  char v74;
  char v75;
  char v76;
  char v77;
  _OWORD v78[16];
  void *__s2[2];
  __int128 v80;
  _OWORD v81[16];
  void *__s1[2];
  __int128 v83;
  CFTypeRef v84;
  CFTypeRef v85[2];

  v85[1] = *(CFTypeRef *)MEMORY[0x24BDAC8D0];
  v84 = 0;
  v85[0] = 0;
  *(_OWORD *)__s1 = 0u;
  v83 = 0u;
  memset(v81, 0, sizeof(v81));
  *(_OWORD *)__s2 = 0u;
  v80 = 0u;
  memset(v78, 0, sizeof(v78));
  if (!a1)
  {
    v73 = "serverTrust must be non-null";
LABEL_37:
    AMSupportLogInternal(3, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)v73, a4, a5, a6, a7, a8, v74);
    v42 = 4294967292;
    goto LABEL_13;
  }
  if (!theArray)
  {
    v73 = "trustedRootArray must be non-null";
    goto LABEL_37;
  }
  if (!a3)
  {
    v73 = "result must be non-null";
    goto LABEL_37;
  }
  if (CFArrayGetCount(theArray) <= 0)
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)"trustedRootArray must be non NULL and have at least one element", v11, v12, v13, v14, v15, v74);
    v42 = 4294966387;
    goto LABEL_13;
  }
  Count = CFArrayGetCount(theArray);
  AMSupportLogInternal(7, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)"Number of trusted roots: %d", v17, v18, v19, v20, v21, Count);
  CertificateCount = SecTrustGetCertificateCount(a1);
  if (CertificateCount <= 0)
  {
    v75 = 0;
    v40 = "Array index of root server cert out of range. (%d)";
    v41 = 7;
LABEL_11:
    AMSupportLogInternal(v41, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)v40, v23, v24, v25, v26, v27, v75);
    *a3 = 6;
LABEL_12:
    v42 = 4294967246;
    goto LABEL_13;
  }
  AMSupportLogInternal(7, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)"Number of server certificates: %d", v23, v24, v25, v26, v27, CertificateCount);
  AMSupportLogInternal(7, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)"Checking server certificate %d of %d", v28, v29, v30, v31, v32, 0);
  CertificateAtIndex = SecTrustGetCertificateAtIndex(a1, 0);
  v39 = _SecCertificateCopyAMSupportCert(CertificateAtIndex, (unint64_t)v78, v85, v34, v35, v36, v37, v38);
  if (v39)
  {
    v75 = v39;
    v40 = "PKI: decoding top-level server cert failed with error 0x%08X";
LABEL_8:
    v41 = 3;
    goto LABEL_11;
  }
  AMSupportLogInternal(7, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)"First server cert length %d", v23, v24, v25, v26, v27, (char)__s2[1]);
  if (CFArrayGetCount(theArray) < 1)
  {
LABEL_27:
    AMSupportLogInternal(3, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)"Root cert not signed by any trusted roots.", v44, v45, v46, v47, v48, v76);
    v42 = 0;
    *a3 = 3;
  }
  else
  {
    v49 = 0;
    while (1)
    {
      ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(theArray, v49);
      if (_SecCertificateCopyAMSupportCert(ValueAtIndex, (unint64_t)v81, &v84, v51, v52, v53, v54, v55))
      {
        AMSupportLogInternal(3, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)"PKI: decoding trusted root %d failed with error 0x%08X", v56, v57, v58, v59, v60, v49);
        goto LABEL_12;
      }
      AMSupportLogInternal(7, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)"Trusted root #%d has length %d", v56, v57, v58, v59, v60, v49);
      v66 = __s1[1];
      if (__s1[1] == __s2[1] && !memcmp(__s1[0], __s2[0], (size_t)__s1[1]))
      {
        AMSupportLogInternal(7, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)"PKI: Root cert is identical to trusted root. (success)", v61, v62, v63, v64, v65, v76);
        goto LABEL_33;
      }
      v67 = AMSupportX509DecodeVerifyCertIssuer((uint64_t)v78, (uint64_t)v81, (uint64_t)v66, v61, v62, v63, v64, v65);
      if (v67 != 18)
        break;
      if (v84)
        CFRelease(v84);
      v84 = 0;
      if (++v49 >= CFArrayGetCount(theArray))
        goto LABEL_27;
    }
    if (v67)
    {
      v75 = v49;
      v40 = "PKI: verify cert was issued by trusted root %d failed with error 0x%08X";
      goto LABEL_8;
    }
    AMSupportLogInternal(7, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)"PKI: verify cert was issued by trusted root %d (success)", v23, v24, v25, v26, v27, v49);
LABEL_33:
    AMSupportLogInternal(7, (uint64_t)"AMSupportX509ChainEvaluateTrust", (uint64_t)"PKI: Chain validation complete. (success)", v68, v69, v70, v71, v72, v77);
    v42 = 0;
    *a3 = 1;
  }
LABEL_13:
  if (v85[0])
  {
    CFRelease(v85[0]);
    v85[0] = 0;
  }
  if (v84)
    CFRelease(v84);
  return v42;
}

uint64_t _SecCertificateCopyAMSupportCert(__SecCertificate *a1, unint64_t a2, CFTypeRef *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFData *v10;
  const __CFData *v11;
  const UInt8 *BytePtr;
  unsigned int Length;
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
  const char *v27;
  char v28;

  if (!a3)
  {
    v27 = "outDataRef must be non-null";
LABEL_17:
    AMSupportLogInternal(3, (uint64_t)"_SecCertificateCopyAMSupportCert", (uint64_t)v27, a4, a5, a6, a7, a8, v28);
    return 99;
  }
  if (!a2)
  {
    v27 = "outCert must be non-null";
    goto LABEL_17;
  }
  if (!a1)
  {
    v27 = "certRef must be non-null";
    goto LABEL_17;
  }
  v10 = SecCertificateCopyData(a1);
  if (!v10)
  {
    v27 = "SecCertificateCopyData returned NULL CFDataRef";
    goto LABEL_17;
  }
  v11 = v10;
  BytePtr = CFDataGetBytePtr(v10);
  Length = CFDataGetLength(v11);
  if (BytePtr && Length)
  {
    v19 = AMSupportX509DecodeCertificate(a2, (uint64_t)BytePtr, Length);
    v25 = v19;
    if ((_DWORD)v19)
      AMSupportLogInternal(7, (uint64_t)"_SecCertificateCopyAMSupportCert", (uint64_t)"PKI: decoding cert failed with error 0x%08X", v20, v21, v22, v23, v24, v19);
    else
      *a3 = CFRetain(v11);
  }
  else
  {
    AMSupportLogInternal(3, (uint64_t)"_SecCertificateCopyAMSupportCert", (uint64_t)"chain_blob must be non NULL and chain_blob_length must be non 0", v14, v15, v16, v17, v18, v28);
    v25 = 99;
  }
  CFRelease(v11);
  return v25;
}

unint64_t _base64_ntop(unsigned __int8 *a1, unint64_t a2, _BYTE *a3, unint64_t a4)
{
  unint64_t v5;
  unint64_t result;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  __int16 v17;
  unsigned __int8 v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  *a3 = 0;
  if (a2 >= 3)
  {
    v5 = 0;
    while (1)
    {
      result = v5 + 4;
      if (v5 + 4 > a4)
        goto LABEL_16;
      v7 = a1[2];
      v8 = a1[1];
      v9 = *a1;
      a1 += 3;
      a2 -= 3;
      v10 = &a3[v5];
      *v10 = Base64[(unint64_t)v9 >> 2];
      v10[1] = Base64[(v8 >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (v9 & 3))];
      v10[2] = Base64[(v7 >> 6) & 0xFFFFFFFFFFFFFFC3 | (4 * (v8 & 0xF))];
      v10[3] = Base64[v7 & 0x3F];
      v5 = result;
      if (a2 <= 2)
      {
        if (a2)
          goto LABEL_8;
        goto LABEL_14;
      }
    }
  }
  result = 0;
  if (a2)
  {
LABEL_8:
    v11 = 0;
    v12 = 0;
    v18 = 0;
    v17 = 0;
    do
    {
      *((_BYTE *)&v17 + v12) = a1[v11++];
      v12 = v11;
    }
    while (a2 > v11);
    if (result + 4 > a4)
      goto LABEL_16;
    v13 = HIBYTE(v17);
    v14 = ((unint64_t)HIBYTE(v17) >> 4) & 0xFFFFFFFFFFFFFFCFLL | (16 * (v17 & 3));
    a3[result] = Base64[(unint64_t)v17 >> 2];
    v15 = v18;
    a3[result | 1] = Base64[v14];
    v16 = 61;
    if (a2 != 1)
      v16 = Base64[(v15 >> 6) & 0xFFFFFFFFFFFFFFC3 | (4 * (v13 & 0xF))];
    a3[result | 2] = v16;
    a3[result | 3] = 61;
    result += 4;
  }
LABEL_14:
  if (result < a4)
  {
    a3[result] = 0;
    return result;
  }
LABEL_16:
  a3[a4 - 1] = 0;
  *a3 = 0;
  return 0xFFFFFFFFLL;
}

_BYTE *_base64encode(unsigned __int8 *a1, int a2)
{
  _BYTE *v2;
  unint64_t v5;
  size_t v6;

  v2 = 0;
  if (a1 && a2 >= 1)
  {
    v5 = a2 / 3uLL;
    if (a2 != 3 * (_DWORD)v5)
      ++v5;
    v6 = (4 * v5) | 1;
    v2 = malloc_type_malloc(v6, 0x5A112648uLL);
    if (v2)
      _base64_ntop(a1, a2, v2, v6);
  }
  return v2;
}

uint64_t _base64decode(char *__s, unsigned int a2)
{
  int64_t v3;
  char *v4;
  int v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  if ((a2 & 0x80000000) != 0)
    v3 = strlen(__s);
  else
    v3 = a2;
  v4 = __s;
  if (v3 >= 1)
  {
    v5 = 0;
    v6 = 0;
    v7 = __s;
    v4 = __s;
    do
    {
      v8 = *v7;
      if ((_DWORD)v8 == 10 || (_DWORD)v8 == 13)
      {
        v10 = 0;
        v5 = 0;
      }
      else
      {
        v10 = _base64decode_table[v8];
        if ((_DWORD)v10 == -1)
        {
          v10 = v6;
        }
        else
        {
          switch(v5)
          {
            case 0:
              v5 = 1;
              break;
            case 1:
              *v4++ = (4 * v6) | (v10 >> 4) & 3;
              v5 = 2;
              break;
            case 2:
              *v4++ = (16 * v6) | (v10 >> 2) & 0xF;
              v5 = 3;
              break;
            case 3:
              v5 = 0;
              *v4++ = v10 | ((_BYTE)v6 << 6);
              break;
            default:
              break;
          }
        }
      }
      ++v7;
      v6 = v10;
    }
    while (v7 < &__s[v3]);
  }
  *v4 = 0;
  return ((_DWORD)v4 - (_DWORD)__s);
}

uint64_t AMSupportCommonCopyHexStringFromData(unsigned __int8 *a1, uint64_t a2, _QWORD *a3, size_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  unsigned __int8 *v11;
  size_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  unsigned int v21;
  uint64_t v22;
  const char *v24;
  char v25;

  if (!a1)
  {
    v24 = "bufferToCovert is NULL";
LABEL_14:
    AMSupportLogInternal(3, (uint64_t)"AMSupportCommonCopyHexStringFromData", (uint64_t)v24, (uint64_t)a4, a5, a6, a7, a8, v25);
    return 1;
  }
  v8 = a2;
  if (!a2)
  {
    v24 = "bufferToConvertLength is 0";
    goto LABEL_14;
  }
  if (!a3)
  {
    v24 = "outHexString is NULL";
    goto LABEL_14;
  }
  if (!a4)
  {
    v24 = "outHexStringLength is NULL";
    goto LABEL_14;
  }
  v11 = a1;
  v12 = (2 * a2) | 1;
  v13 = (char *)malloc_type_calloc(1uLL, v12, 0xE3C46D7AuLL);
  if (v13)
  {
    v19 = 2 * v8;
    v20 = v13 + 1;
    do
    {
      v21 = *v11++;
      *(v20 - 1) = AMSupportCommonCopyHexStringFromData_kAsciiHexChars[(unint64_t)v21 >> 4];
      *v20 = AMSupportCommonCopyHexStringFromData_kAsciiHexChars[v21 & 0xF];
      v20 += 2;
      --v8;
    }
    while (v8);
    v22 = 0;
    v13[v19] = 0;
    *a3 = v13;
    *a4 = v12;
  }
  else
  {
    AMSupportLogInternal(3, (uint64_t)"AMSupportCommonCopyHexStringFromData", (uint64_t)"hexString is NULL", v14, v15, v16, v17, v18, v25);
    return 99;
  }
  return v22;
}

uint64_t AMSupportCommonCopyHexStringFromUInt32(unsigned int a1, _QWORD *a2, size_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unsigned int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v9 = bswap32(a1);
  return AMSupportCommonCopyHexStringFromData((unsigned __int8 *)&v9, 4, a2, a3, a5, a6, a7, a8);
}

uint64_t AMSupportCommonCopyHexStringFromUInt64(unint64_t a1, _QWORD *a2, size_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v9[0] = bswap64(a1);
  return AMSupportCommonCopyHexStringFromData((unsigned __int8 *)v9, 8, a2, a3, a5, a6, a7, a8);
}

uint64_t Img4EncodeItemBegin(uint64_t *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;

  if (!a1)
    return 101;
  v4 = *a1;
  if (*a1)
  {
    v5 = *(_QWORD *)(v4 + 32);
    if (*(_QWORD *)v5 || *(_DWORD *)(v5 + 8))
      return 101;
  }
  else
  {
    v7 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A0040C7713FB7uLL);
    *a1 = (uint64_t)v7;
    if (!v7)
      return 102;
    *(_QWORD *)(*a1 + 8) = malloc_type_calloc(1uLL, 0x400uLL, 0xCC0233F6uLL);
    v8 = *a1;
    v9 = *(_QWORD *)(*a1 + 8);
    if (!v9)
      return 102;
    *(_DWORD *)(v8 + 16) = 1024;
    *(_QWORD *)(v8 + 24) = v9;
    v4 = *a1;
  }
  *(_DWORD *)v4 = a2;
  *(_QWORD *)(*a1 + 32) = malloc_type_calloc(1uLL, 0x18uLL, 0x1080040BEC857D6uLL);
  if (*(_QWORD *)(*a1 + 32))
  {
    **(_QWORD **)(*a1 + 32) = malloc_type_calloc(1uLL, 0x400uLL, 0x7A646854uLL);
    v10 = *(uint64_t **)(*a1 + 32);
    v11 = *v10;
    if (*v10)
    {
      *((_DWORD *)v10 + 2) = 1024;
      v10[2] = v11;
      return 100;
    }
  }
  return 102;
}

uint64_t Img4EncodeItemEnd(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  uint64_t v4;
  size_t v5;
  size_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *__src;
  unsigned int __n[3];

  *(_QWORD *)&__n[1] = *MEMORY[0x24BDAC8D0];
  __n[0] = 0;
  __src = 0;
  if (!a1 || *(_DWORD *)a1 != a2)
    return 101;
  if (*(_QWORD *)(a1 + 8) && *(_DWORD *)(a1 + 16) && (v3 = *(_QWORD *)(a1 + 32), *(_QWORD *)v3) && *(_DWORD *)(v3 + 8))
  {
    v4 = Img4EncodeDictionary(0, a2, *(const void **)v3, *(_DWORD *)(v3 + 16) - *(_QWORD *)v3, &__src, __n);
    if ((_DWORD)v4 == 100)
    {
      v5 = __n[0];
      v6 = *(unsigned int *)(a1 + 16);
      v7 = *(char **)(a1 + 24);
      v8 = &v7[-*(_QWORD *)(a1 + 8)];
      if (v6 - (unint64_t)v8 > __n[0])
      {
LABEL_14:
        memcpy(v7, __src, v5);
        *(_DWORD *)a1 = 0;
        v11 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)(a1 + 24) += __n[0];
        if (*(_QWORD *)v11)
        {
          free(*(void **)v11);
          v11 = *(_QWORD *)(a1 + 32);
          *(_QWORD *)v11 = 0;
        }
        *(_DWORD *)(v11 + 8) = 0;
        *(_QWORD *)(v11 + 16) = 0;
        v4 = 100;
        goto LABEL_19;
      }
      if (__n[0] <= 0x400)
        v9 = 1024;
      else
        v9 = __n[0];
      v10 = img4encode_realloc(*(void **)(a1 + 8), v6, v6 + v9);
      if (v10)
      {
        *(_QWORD *)(a1 + 8) = v10;
        v7 = &v8[(_QWORD)v10];
        *(_QWORD *)(a1 + 24) = v7;
        *(_DWORD *)(a1 + 16) += v9;
        v5 = __n[0];
        goto LABEL_14;
      }
      v4 = 2;
    }
  }
  else
  {
    v4 = 101;
  }
LABEL_19:
  if (__src)
    free(__src);
  return v4;
}

uint64_t Img4EncodeDictionary(int a1, unsigned int a2, const void *a3, unsigned int a4, _QWORD *a5, unsigned int *a6)
{
  uint64_t v6;
  unsigned int v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  void *v19;
  void *v20;
  unsigned int v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21 = 0;
  v22 = 0;
  v19 = 0;
  v20 = 0;
  v6 = 101;
  if (!a5 || !a6)
    goto LABEL_23;
  v12 = bswap32(a2);
  if (a1 == 2)
  {
    v23 = v12;
    v13 = (uint64_t *)DEREncoderCreate(0);
    v14 = v13;
    if (!v13)
    {
      v6 = 102;
      goto LABEL_23;
    }
    v6 = DEREncoderAddData(v13, 0, 0x16u, &v23, 4u, 0);
    if ((_DWORD)v6)
      goto LABEL_18;
    v6 = DEREncoderAddData(v14, 0, 0x10u, a3, a4, 1);
    if ((_DWORD)v6)
      goto LABEL_18;
    v6 = DEREncoderCreateEncodedBuffer((uint64_t **)v14, &v20, &v22);
    if ((_DWORD)v6)
      goto LABEL_18;
  }
  else
  {
    v23 = v12;
    v15 = (uint64_t *)DEREncoderCreate(1);
    if (!v15)
    {
      DEREncoderDestroy(0);
      v6 = 102;
      goto LABEL_23;
    }
    v16 = v15;
    v6 = DEREncoderAddData(v15, 0, 0x16u, &v23, 4u, 0);
    if ((_DWORD)v6
      || (v6 = DEREncoderAddData(v16, 0, 0x11u, a3, a4, 1), (_DWORD)v6)
      || (v6 = DEREncoderCreateEncodedBuffer((uint64_t **)v16, &v20, &v22), (_DWORD)v6))
    {
      DEREncoderDestroy((_QWORD **)v16);
      if ((_DWORD)v6 != 100)
        goto LABEL_23;
    }
    else
    {
      DEREncoderDestroy((_QWORD **)v16);
    }
    v14 = 0;
  }
  v17 = Img4EncodeSequence(v20, v22, &v19, &v21);
  if ((_DWORD)v17 == 100)
    v17 = Img4EncodePrivate(a2, v19, v21, a5, a6);
  v6 = v17;
LABEL_18:
  if (v14)
    DEREncoderDestroy((_QWORD **)v14);
LABEL_23:
  if (v20)
  {
    free(v20);
    v20 = 0;
  }
  if (v19)
    free(v19);
  return v6;
}

void *img4encode_realloc(void *a1, size_t a2, size_t size)
{
  void *v6;
  void *v7;
  size_t v8;

  v6 = malloc_type_calloc(1uLL, size, 0x9177B021uLL);
  v7 = v6;
  if (a1 && v6)
  {
    if (a2 >= size)
      v8 = size;
    else
      v8 = a2;
    memcpy(v6, a1, v8);
    free(a1);
  }
  return v7;
}

uint64_t Img4EncodeItemPropertyData(_DWORD *a1, int a2, unsigned int a3, const void *a4, unsigned int a5)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v11;
  uint64_t v12;
  void *v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;

  v5 = 0;
  v17 = *MEMORY[0x24BDAC8D0];
  v15 = bswap32(a3);
  v16 = 0;
  v14 = 0;
  v6 = 102;
  if (a1 && a4 && a5)
  {
    if (*a1 == a2)
    {
      v11 = (uint64_t *)DEREncoderCreate(0);
      v5 = v11;
      if (v11)
      {
        v12 = DEREncoderAddData(v11, 0, 0x16u, &v15, 4u, 0);
        if (!(_DWORD)v12)
        {
          v12 = DEREncoderAddData(v5, 0, 4u, a4, a5, 0);
          if (!(_DWORD)v12)
          {
            v12 = DEREncoderCreateEncodedBuffer((uint64_t **)v5, &v14, &v16);
            if (!(_DWORD)v12)
              v12 = Img4EncodeItemProperty((uint64_t)a1, a3, v14, v16);
          }
        }
        v6 = v12;
      }
      else
      {
        v6 = 2;
      }
    }
    else
    {
      v5 = 0;
      v6 = 101;
    }
  }
  DEREncoderDestroy((_QWORD **)v5);
  if (v14)
    free(v14);
  return v6;
}

uint64_t Img4EncodeItemProperty(uint64_t a1, unsigned int a2, const void *a3, unsigned int a4)
{
  uint64_t v4;
  size_t v7;
  uint64_t v8;
  size_t v9;
  char *v10;
  _BYTE *v11;
  int64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *__src;
  void *v18;
  size_t __n[2];

  __n[1] = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  __n[0] = 0;
  __src = 0;
  v4 = 101;
  if (a1)
  {
    if (a3)
    {
      v4 = Img4EncodeSequence(a3, a4, &v18, (unsigned int *)__n + 1);
      if ((_DWORD)v4 == 100)
      {
        v4 = Img4EncodePrivate(a2, v18, HIDWORD(__n[0]), &__src, (unsigned int *)__n);
        if ((_DWORD)v4 == 100)
        {
          v7 = LODWORD(__n[0]);
          v8 = *(_QWORD *)(a1 + 32);
          v9 = *(unsigned int *)(v8 + 8);
          v10 = *(char **)(v8 + 16);
          v11 = *(_BYTE **)v8;
          v12 = v10 - v11;
          if (v9 - (v10 - v11) > LODWORD(__n[0]))
          {
LABEL_11:
            memcpy(v10, __src, v7);
            *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) += LODWORD(__n[0]);
            v4 = 100;
            goto LABEL_12;
          }
          if (LODWORD(__n[0]) <= 0x400)
            v13 = 1024;
          else
            v13 = LODWORD(__n[0]);
          v14 = (char *)img4encode_realloc(v11, v9, v9 + v13);
          if (v14)
          {
            v15 = *(_QWORD *)(a1 + 32);
            *(_QWORD *)v15 = v14;
            v10 = &v14[v12];
            *(_QWORD *)(v15 + 16) = v10;
            *(_DWORD *)(v15 + 8) += v13;
            v7 = LODWORD(__n[0]);
            goto LABEL_11;
          }
          v4 = 2;
        }
      }
    }
  }
LABEL_12:
  if (v18)
  {
    free(v18);
    v18 = 0;
  }
  if (__src)
    free(__src);
  return v4;
}

uint64_t Img4EncodeItemPropertyBool(_DWORD *a1, int a2, unsigned int a3, int a4)
{
  uint64_t *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  unsigned int v12;
  _BYTE v13[5];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v13[4] = 0;
  *(_DWORD *)v13 = (a4 << 31 >> 31);
  v12 = bswap32(a3);
  v11 = 0;
  if (a1)
  {
    if (*a1 == a2)
    {
      v6 = (uint64_t *)DEREncoderCreate(0);
      v7 = v6;
      if (v6)
      {
        v8 = DEREncoderAddData(v6, 0, 0x16u, &v12, 4u, 0);
        if (!(_DWORD)v8)
        {
          v8 = DEREncoderAddData(v7, 0, 1u, v13, 1u, 0);
          if (!(_DWORD)v8)
          {
            v8 = DEREncoderCreateEncodedBuffer((uint64_t **)v7, &v11, (unsigned int *)&v13[1]);
            if (!(_DWORD)v8)
              v8 = Img4EncodeItemProperty((uint64_t)a1, a3, v11, *(unsigned int *)&v13[1]);
          }
        }
        v9 = v8;
      }
      else
      {
        v9 = 2;
      }
    }
    else
    {
      v7 = 0;
      v9 = 101;
    }
  }
  else
  {
    v7 = 0;
    v9 = 102;
  }
  DEREncoderDestroy((_QWORD **)v7);
  if (v11)
    free(v11);
  return v9;
}

uint64_t Img4EncodeItemPropertyInt32(_DWORD *a1, int a2, unsigned int a3, unsigned int a4)
{
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = bswap32(a3);
  v14 = 0;
  v12 = 0;
  if (a1)
  {
    if (*a1 == a2)
    {
      v7 = (uint64_t *)DEREncoderCreate(0);
      v8 = v7;
      if (v7)
      {
        v9 = DEREncoderAddData(v7, 0, 0x16u, &v13, 4u, 0);
        if (!(_DWORD)v9)
        {
          v9 = DEREncoderAddUInt32(v8, 0, 2u, a4);
          if (!(_DWORD)v9)
          {
            v9 = DEREncoderCreateEncodedBuffer((uint64_t **)v8, &v12, &v14);
            if (!(_DWORD)v9)
              v9 = Img4EncodeItemProperty((uint64_t)a1, a3, v12, v14);
          }
        }
        v10 = v9;
      }
      else
      {
        v10 = 2;
      }
    }
    else
    {
      v8 = 0;
      v10 = 101;
    }
  }
  else
  {
    v8 = 0;
    v10 = 102;
  }
  DEREncoderDestroy((_QWORD **)v8);
  if (v12)
    free(v12);
  return v10;
}

uint64_t Img4EncodeItemPropertyInt64(_DWORD *a1, int a2, unsigned int a3, unint64_t a4)
{
  uint64_t *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v13 = bswap32(a3);
  v14 = 0;
  v12 = 0;
  if (a1)
  {
    if (*a1 == a2)
    {
      v7 = (uint64_t *)DEREncoderCreate(0);
      v8 = v7;
      if (v7)
      {
        v9 = DEREncoderAddData(v7, 0, 0x16u, &v13, 4u, 0);
        if (!(_DWORD)v9)
        {
          v9 = DEREncoderAddUInt64(v8, 0, 2u, a4);
          if (!(_DWORD)v9)
          {
            v9 = DEREncoderCreateEncodedBuffer((uint64_t **)v8, &v12, &v14);
            if (!(_DWORD)v9)
              v9 = Img4EncodeItemProperty((uint64_t)a1, a3, v12, v14);
          }
        }
        v10 = v9;
      }
      else
      {
        v10 = 2;
      }
    }
    else
    {
      v8 = 0;
      v10 = 101;
    }
  }
  else
  {
    v8 = 0;
    v10 = 102;
  }
  DEREncoderDestroy((_QWORD **)v8);
  if (v12)
    free(v12);
  return v10;
}

void Img4EncodeItemDestroy(_QWORD *a1)
{
  void *v2;
  void **v3;

  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2)
      free(v2);
    a1[1] = 0;
    v3 = (void **)a1[4];
    if (v3)
    {
      if (*v3)
      {
        free(*v3);
        v3 = (void **)a1[4];
        *v3 = 0;
      }
      free(v3);
    }
    free(a1);
  }
}

uint64_t Img4EncodeItemCopyBuffer(uint64_t a1, _QWORD *a2, unsigned int *a3)
{
  uint64_t result;
  unsigned int v7;
  void *v8;
  void *v9;

  result = 102;
  if (a1 && a2 && a3)
  {
    v7 = *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 8);
    v8 = malloc_type_calloc(1uLL, v7, 0xE5E07A0AuLL);
    if (v8)
    {
      v9 = v8;
      memcpy(v8, *(const void **)(a1 + 8), v7);
      *a2 = v9;
      *a3 = v7;
      return 100;
    }
    else
    {
      return 102;
    }
  }
  return result;
}

uint64_t Img4EncodeCreatePayload(const char *a1, const char *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, _QWORD *a7, unsigned int *a8)
{
  uint64_t *v8;
  uint64_t v9;
  uint64_t **v12;
  uint64_t v18;
  unsigned int v19;
  unsigned int EncodedBuffer;

  v8 = 0;
  v9 = 101;
  if (!a1 || !a2)
  {
    v12 = 0;
    goto LABEL_16;
  }
  v12 = 0;
  if (a3)
  {
    if (strlen(a1) != 4)
    {
      v8 = 0;
      v12 = 0;
      goto LABEL_16;
    }
    v8 = (uint64_t *)DEREncoderCreate(0);
    if (v8)
    {
      v12 = (uint64_t **)DEREncoderCreate(0);
      if (v12)
      {
        v18 = DEREncoderAddData(v8, 0, 0x16u, "IM4P", 4u, 0);
        if ((_DWORD)v18
          || (v18 = DEREncoderAddData(v8, 0, 0x16u, a1, 4u, 0), (_DWORD)v18)
          || (v19 = strlen(a2), v18 = DEREncoderAddData(v8, 0, 0x16u, a2, v19, 0), (_DWORD)v18)
          || (v18 = DEREncoderAddDataNoCopy(v8, 0, 4u, a3, a4, 0), (_DWORD)v18)
          || a5 && (v18 = DEREncoderAddDataNoCopy(v8, 0, 4u, a5, a6, 0), (_DWORD)v18)
          || (v18 = DEREncoderAddDataFromEncoderNoCopy((uint64_t)v8, (uint64_t)v12, 0, 0x10u, 1), (_DWORD)v18))
        {
          v9 = v18;
        }
        else
        {
          EncodedBuffer = DEREncoderCreateEncodedBuffer(v12, a7, a8);
          if (EncodedBuffer)
            v9 = EncodedBuffer;
          else
            v9 = 100;
        }
        goto LABEL_16;
      }
    }
    else
    {
      v12 = 0;
    }
    v9 = 2;
  }
LABEL_16:
  DEREncoderDestroy((_QWORD **)v8);
  DEREncoderDestroy(v12);
  return v9;
}

uint64_t Img4EncodeCreateManifest(uint64_t a1, uint64_t (*a2)(void **, char *, uint64_t), uint64_t (*a3)(void **, size_t *, uint64_t), uint64_t (*a4)(uint64_t, void *, _QWORD, void **, uint64_t *, uint64_t), const void *a5, unsigned int a6, _QWORD *a7, unsigned int *a8, uint64_t a9, uint64_t a10)
{
  uint64_t *v10;
  uint64_t v11;
  uint64_t **v15;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v23;
  unsigned int v24;
  char *v25;
  char *v26;
  uint64_t *v27;
  uint64_t v28;
  unsigned int EncodedBuffer;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  void *v39;
  void *__src;
  size_t __n[2];

  v10 = 0;
  __n[1] = *MEMORY[0x24BDAC8D0];
  v38 = 0;
  v37 = 0;
  v36 = 0;
  v35 = 1295273289;
  v33 = 0;
  v34 = 0;
  v31 = 0;
  v32 = 0;
  v11 = 101;
  if (!a2 || !a3 || !a7)
  {
    v15 = 0;
    goto LABEL_13;
  }
  v15 = 0;
  if (!a8)
    goto LABEL_13;
  v20 = (uint64_t *)DEREncoderCreate(0);
  v10 = v20;
  if (!v20)
  {
    v15 = 0;
LABEL_12:
    v11 = 2;
    goto LABEL_13;
  }
  v21 = DEREncoderAddData(v20, 0, 0x16u, &v35, 4u, 0);
  if ((_DWORD)v21)
    goto LABEL_8;
  v21 = DEREncoderAddUInt32(v10, 0, 2u, a1);
  if ((_DWORD)v21)
    goto LABEL_8;
  __n[0] = 0;
  v39 = 0;
  __src = 0;
  v23 = a2(&__src, (char *)__n + 4, a9);
  if ((_DWORD)v23 == 100 && (v23 = a3(&v39, __n, a9), (_DWORD)v23 == 100))
  {
    v24 = HIDWORD(__n[0]) + LODWORD(__n[0]);
    if (__CFADD__(HIDWORD(__n[0]), __n[0]))
    {
      v26 = 0;
      v11 = 106;
    }
    else
    {
      v25 = (char *)malloc_type_calloc(1uLL, (HIDWORD(__n[0]) + LODWORD(__n[0])), 0xC411733uLL);
      v26 = v25;
      if (v25)
      {
        memcpy(v25, __src, HIDWORD(__n[0]));
        memcpy(&v26[HIDWORD(__n[0])], v39, LODWORD(__n[0]));
        v11 = Img4EncodeDictionary(a1, 0x4D414E42u, v26, v24, &v34, (unsigned int *)&v38 + 1);
      }
      else
      {
        v11 = 102;
      }
    }
  }
  else
  {
    v11 = v23;
    v26 = 0;
  }
  if (__src)
  {
    free(__src);
    __src = 0;
  }
  if (v39)
  {
    free(v39);
    v39 = 0;
  }
  if (v26)
    free(v26);
  if ((_DWORD)v11 != 100)
    goto LABEL_9;
  v21 = DEREncoderAddData(v10, 0, 0x11u, v34, HIDWORD(v38), 1);
  if ((_DWORD)v21
    || (v21 = Img4EncodeCopyFullManifestBytes(v34, HIDWORD(v38), &v32, &v37), (_DWORD)v21 != 100)
    || (v21 = a4(a1, v32, v37, &v31, &v36, a10), (_DWORD)v21 != 100)
    || (v21 = DEREncoderAddData(v10, 0, 4u, v31, v36, 0), (_DWORD)v21)
    || (v21 = DEREncoderAddData(v10, 0, 0x10u, a5, a6, 1), (_DWORD)v21)
    || (v21 = DEREncoderCreateEncodedBuffer((uint64_t **)v10, &v33, (unsigned int *)&v38), (_DWORD)v21))
  {
LABEL_8:
    v11 = v21;
LABEL_9:
    v15 = 0;
    goto LABEL_13;
  }
  v27 = (uint64_t *)DEREncoderCreate(0);
  v15 = (uint64_t **)v27;
  if (!v27)
    goto LABEL_12;
  v28 = DEREncoderAddData(v27, 0, 0x10u, v33, v38, 1);
  if ((_DWORD)v28)
  {
    v11 = v28;
  }
  else
  {
    EncodedBuffer = DEREncoderCreateEncodedBuffer(v15, a7, a8);
    if (EncodedBuffer)
      v11 = EncodedBuffer;
    else
      v11 = 100;
  }
LABEL_13:
  DEREncoderDestroy((_QWORD **)v10);
  DEREncoderDestroy(v15);
  if (v34)
  {
    free(v34);
    v34 = 0;
  }
  if (v33)
  {
    free(v33);
    v33 = 0;
  }
  if (v32)
  {
    free(v32);
    v32 = 0;
  }
  if (v31)
    free(v31);
  return v11;
}

uint64_t Img4EncodeCopyFullManifestBytes(const void *a1, unsigned int a2, _QWORD *a3, unsigned int *a4)
{
  uint64_t *v8;
  uint64_t **v9;
  uint64_t v10;
  unsigned int EncodedBuffer;

  v8 = (uint64_t *)DEREncoderCreate(0);
  v9 = (uint64_t **)v8;
  if (v8)
  {
    v10 = DEREncoderAddData(v8, 0, 0x11u, a1, a2, 1);
    if (!(_DWORD)v10)
    {
      EncodedBuffer = DEREncoderCreateEncodedBuffer(v9, a3, a4);
      if (EncodedBuffer)
        v10 = EncodedBuffer;
      else
        v10 = 100;
    }
  }
  else
  {
    v10 = 2;
  }
  DEREncoderDestroy(v9);
  return v10;
}

uint64_t Img4EncodeStitch(const void *a1, unsigned int a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, _QWORD *a7, unsigned int *a8)
{
  uint64_t **v8;
  uint64_t v9;
  uint64_t *v11;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v21;
  unsigned int EncodedBuffer;
  int v24;
  uint64_t v25;

  v8 = 0;
  v25 = *MEMORY[0x24BDAC8D0];
  v24 = 877088073;
  v9 = 101;
  if (!a1)
  {
    v11 = 0;
    goto LABEL_10;
  }
  v11 = 0;
  if (a7)
  {
    v18 = (uint64_t *)DEREncoderCreate(0);
    v11 = v18;
    if (v18)
    {
      v19 = DEREncoderAddData(v18, 0, 0x16u, &v24, 4u, 0);
      if ((_DWORD)v19
        || (v19 = DEREncoderAddDataNoCopy(v11, 0x103u, 0, a1, a2, 0), (_DWORD)v19)
        || a3 && (v19 = DEREncoderAddData(v11, 2u, 0, a3, a4, 1), (_DWORD)v19)
        || a5 && (v19 = DEREncoderAddData(v11, 2u, 1u, a5, a6, 1), (_DWORD)v19))
      {
        v9 = v19;
        v8 = 0;
        goto LABEL_10;
      }
      v8 = (uint64_t **)DEREncoderCreate(0);
      if (v8)
      {
        v21 = DEREncoderAddDataFromEncoderNoCopy((uint64_t)v11, (uint64_t)v8, 0, 0x10u, 1);
        if ((_DWORD)v21)
        {
          v9 = v21;
        }
        else
        {
          EncodedBuffer = DEREncoderCreateEncodedBuffer(v8, a7, a8);
          if (EncodedBuffer)
            v9 = EncodedBuffer;
          else
            v9 = 100;
        }
        goto LABEL_10;
      }
    }
    else
    {
      v8 = 0;
    }
    v9 = 102;
  }
LABEL_10:
  DEREncoderDestroy((_QWORD **)v11);
  DEREncoderDestroy(v8);
  return v9;
}

uint64_t Img4EncodeStitchManifest(const void *a1, unsigned int a2, const void *a3, unsigned int a4, _QWORD *a5, unsigned int *a6)
{
  return Img4EncodeStitch(a1, a2, a3, a4, 0, 0, a5, a6);
}

uint64_t Img4EncodeSequence(const void *a1, unsigned int a2, _QWORD *a3, unsigned int *a4)
{
  uint64_t **v4;
  uint64_t v5;
  uint64_t *v10;
  uint64_t v11;
  unsigned int EncodedBuffer;

  v4 = 0;
  v5 = 101;
  if (a1 && a3 && a4)
  {
    v10 = (uint64_t *)DEREncoderCreate(0);
    v4 = (uint64_t **)v10;
    if (v10)
    {
      v11 = DEREncoderAddData(v10, 0, 0x10u, a1, a2, 1);
      if ((_DWORD)v11)
      {
        v5 = v11;
      }
      else
      {
        EncodedBuffer = DEREncoderCreateEncodedBuffer(v4, a3, a4);
        if (EncodedBuffer)
          v5 = EncodedBuffer;
        else
          v5 = 100;
      }
    }
    else
    {
      v5 = 102;
    }
  }
  DEREncoderDestroy(v4);
  return v5;
}

uint64_t Img4EncodePrivate(unsigned int a1, const void *a2, unsigned int a3, _QWORD *a4, unsigned int *a5)
{
  uint64_t **v5;
  uint64_t v6;
  uint64_t *v12;
  uint64_t v13;
  unsigned int EncodedBuffer;

  v5 = 0;
  v6 = 101;
  if (a2 && a4 && a5)
  {
    v12 = (uint64_t *)DEREncoderCreate(0);
    v5 = (uint64_t **)v12;
    if (v12)
    {
      v13 = DEREncoderAddData(v12, 3u, a1, a2, a3, 1);
      if ((_DWORD)v13)
      {
        v6 = v13;
      }
      else
      {
        EncodedBuffer = DEREncoderCreateEncodedBuffer(v5, a4, a5);
        if (EncodedBuffer)
          v6 = EncodedBuffer;
        else
          v6 = 100;
      }
    }
    else
    {
      v6 = 102;
    }
  }
  DEREncoderDestroy(v5);
  return v6;
}

_DWORD *DEREncoderCreate(int a1)
{
  _DWORD *result;

  result = malloc_type_calloc(1uLL, 0x10uLL, 0x1020040EDED9539uLL);
  if (result)
    result[3] = a1;
  return result;
}

void DEREncoderDestroy(_QWORD **a1)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      do
      {
        v3 = (_QWORD *)*v2;
        _EncodedDataRelease((uint64_t)v2);
        v2 = v3;
      }
      while (v3);
    }
    free(a1);
  }
}

uint64_t DEREncoderAddData(uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  char *v7;

  v7 = _EncodedDataCreate(a2, a3, a4, a5, a6, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v7);
}

uint64_t _DEREncoderAddEncodedData(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  int v4;
  uint64_t v5;
  int v6;
  BOOL v7;
  int v8;
  int v9;
  uint64_t *v10;
  uint64_t *v11;
  int v12;
  uint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  size_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;

  v2 = a2;
  if (!a1)
  {
    v22 = 1;
    if (!a2)
      return v22;
    goto LABEL_30;
  }
  if (!a2)
    return 2;
  v4 = *((_DWORD *)a1 + 2);
  v5 = a2;
  do
  {
    v6 = *(_DWORD *)(v5 + 20);
    v7 = __CFADD__(v4, v6);
    v8 = v4 + v6;
    if (v7 || (v9 = *(_DWORD *)(v5 + 24), v4 = v8 + v9, __CFADD__(v8, v9)))
    {
      v22 = 2;
      do
      {
LABEL_30:
        v23 = *(_QWORD *)v2;
        _EncodedDataRelease(v2);
        v2 = v23;
      }
      while (v23);
      return v22;
    }
    v5 = *(_QWORD *)v5;
  }
  while (v5);
  v10 = (uint64_t *)*a1;
  v11 = a1;
  if (!*a1)
    goto LABEL_26;
  v12 = *((_DWORD *)a1 + 3);
  v11 = a1;
  while (2)
  {
    v13 = v11;
    v11 = v10;
    if (!v12)
      goto LABEL_20;
    v14 = bswap64(*(_QWORD *)(v2 + 28));
    v15 = bswap64(*(uint64_t *)((char *)v11 + 28));
    if (v14 != v15 || (v14 = bswap64(*(_QWORD *)(v2 + 36)), v15 = bswap64(*(uint64_t *)((char *)v11 + 36)), v14 != v15))
    {
      if (v14 < v15)
        v16 = -1;
      else
        v16 = 1;
LABEL_19:
      if (v16 < 0)
        break;
      goto LABEL_20;
    }
    v17 = *(_DWORD *)(v2 + 24);
    v18 = *((_DWORD *)v11 + 6);
    if (v17 >= v18)
      v19 = v18;
    else
      v19 = v17;
    v16 = memcmp(*(const void **)(v2 + 8), (const void *)v11[1], v19);
    if (v16)
      goto LABEL_19;
    if (v17 >= v18)
    {
LABEL_20:
      v10 = (uint64_t *)*v11;
      if (!*v11)
        goto LABEL_26;
      continue;
    }
    break;
  }
  v20 = (_QWORD *)v2;
  do
  {
    v21 = v20;
    v20 = (_QWORD *)*v20;
  }
  while (v20);
  *v21 = v11;
  v11 = v13;
LABEL_26:
  v22 = 0;
  *v11 = v2;
  *((_DWORD *)a1 + 2) = v4;
  return v22;
}

char *_EncodedDataCreate(unsigned int a1, unsigned int a2, const void *a3, unsigned int a4, int a5, int a6)
{
  char *v12;
  char *v13;
  char *v14;
  int v15;
  int v16;
  uint64_t v17;
  BOOL v18;
  _BYTE *v19;
  uint64_t v20;
  int v21;
  char *v22;
  _BYTE *v23;
  uint64_t v24;
  unsigned int v25;
  int v26;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  if (!a3 && a4 && a6)
    return 0;
  v12 = (char *)malloc_type_calloc(1uLL, 0x38uLL, 0x1070040322F9897uLL);
  v13 = v12;
  if (!v12)
    return v13;
  *((_DWORD *)v12 + 4) = 1;
  v14 = v12 + 28;
  if (a1 == 259)
  {
    v15 = 0;
    goto LABEL_7;
  }
  if (a1 > 3)
    goto LABEL_40;
  if (a2 > 0x1E)
  {
    v17 = 0;
    v28[0] = 0;
    do
    {
      *((_BYTE *)v28 + v17++) = a2 & 0x7F;
      v18 = a2 > 0x7F;
      a2 >>= 7;
    }
    while (v18);
    v16 = (_DWORD)v13 + 28;
    if ((v17 & 0xFFFFFFF0) == 0)
    {
      v13[28] = ((_BYTE)a1 << 6) | (32 * (a5 != 0)) | 0x1F;
      v19 = v13 + 29;
      if (v17 >= 2)
      {
        v20 = v17 - 1;
        do
          *v19++ = *((_BYTE *)v28 + v20--) | 0x80;
        while ((_DWORD)v20);
      }
      *v19 = v28[0];
      v16 = (_DWORD)v19 + 1;
    }
  }
  else
  {
    v13[28] = ((_BYTE)a1 << 6) | (32 * (a5 != 0)) | a2;
    v16 = (_DWORD)v13 + 29;
  }
  v21 = v16 - (_DWORD)v14;
  if (!v21)
    goto LABEL_40;
  v22 = &v14[v21];
  if (a4 > 0x7F)
  {
    v24 = 0;
    v28[0] = 0;
    v25 = a4;
    do
    {
      *((_BYTE *)v28 + v24++) = v25;
      v18 = v25 > 0xFF;
      v25 >>= 8;
    }
    while (v18);
    if (16 - v21 <= v24)
    {
      LODWORD(v23) = (_DWORD)v14 + v21;
    }
    else
    {
      *v22 = v24 | 0x80;
      v23 = v22 + 1;
      if ((_DWORD)v24)
      {
        do
          *v23++ = *((_BYTE *)&v28[-1] + v24-- + 7);
        while (v24);
      }
    }
  }
  else
  {
    LODWORD(v23) = (_DWORD)v14 + v21;
    if (v21 != 16)
    {
      *v22 = a4;
      LODWORD(v23) = (_DWORD)v22 + 1;
    }
  }
  v26 = (_DWORD)v23 - (_DWORD)v22;
  if ((_DWORD)v23 == (_DWORD)v22)
  {
LABEL_40:
    free(v13);
    return 0;
  }
  v14 = &v22[v26];
  v15 = v21 + v26;
LABEL_7:
  *((_DWORD *)v13 + 5) = v15;
  switch(a6)
  {
    case 0:
      *((_QWORD *)v13 + 1) = 0;
      *((_QWORD *)v13 + 6) = 0;
      *((_DWORD *)v13 + 6) = 0;
      return v13;
    case 1:
      *((_QWORD *)v13 + 1) = a3;
      *((_QWORD *)v13 + 6) = 0;
      goto LABEL_25;
    case 2:
      *((_QWORD *)v13 + 1) = a3;
      *((_QWORD *)v13 + 6) = v13;
LABEL_25:
      *((_DWORD *)v13 + 6) = a4;
      return v13;
    case 3:
      if (v13 + 56 - v14 >= a4)
      {
        *((_QWORD *)v13 + 1) = v14;
        *((_DWORD *)v13 + 6) = a4;
      }
      else
      {
        v14 = (char *)malloc_type_malloc(a4, 0x7C1E6B85uLL);
        *((_QWORD *)v13 + 1) = v14;
        *((_QWORD *)v13 + 6) = v13;
        *((_DWORD *)v13 + 6) = a4;
        if (!v14)
          goto LABEL_40;
      }
      memcpy(v14, a3, a4);
      break;
    default:
      return v13;
  }
  return v13;
}

uint64_t DEREncoderAddDataNoCopy(uint64_t *a1, unsigned int a2, unsigned int a3, const void *a4, unsigned int a5, int a6)
{
  char *v7;

  v7 = _EncodedDataCreate(a2, a3, a4, a5, a6, 1);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v7);
}

uint64_t DEREncoderAddUInt32(uint64_t *a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  char *v8;
  unsigned int v10;
  char v11;
  unsigned int v12;
  uint64_t v13;

  v5 = 0;
  v13 = *MEMORY[0x24BDAC8D0];
  v10 = bswap32(a4);
  v11 = 0;
  v12 = v10;
  while (!*((_BYTE *)&v10 + v5))
  {
    if (++v5 == 4)
    {
      v6 = 0;
      goto LABEL_6;
    }
  }
  v6 = ((unint64_t)*((unsigned __int8 *)&v10 + v5) >> 7) - v5 + 4;
LABEL_6:
  if (v6 <= 1)
    v7 = 1;
  else
    v7 = v6;
  v8 = _EncodedDataCreate(a2, a3, &v11 - v7 + 5, v7, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v8);
}

uint64_t DEREncoderAddUInt64(uint64_t *a1, unsigned int a2, unsigned int a3, unint64_t a4)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  char *v8;
  unint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;

  v5 = 0;
  v13 = *MEMORY[0x24BDAC8D0];
  v10 = bswap64(a4);
  v11 = 0;
  v12 = v10;
  while (!*((_BYTE *)&v10 + v5))
  {
    if (++v5 == 8)
    {
      v6 = 0;
      goto LABEL_6;
    }
  }
  v6 = ((unint64_t)*((unsigned __int8 *)&v10 + v5) >> 7) - v5 + 8;
LABEL_6:
  if (v6 <= 1)
    v7 = 1;
  else
    v7 = v6;
  v8 = _EncodedDataCreate(a2, a3, &v11 - v7 + 9, v7, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v8);
}

uint64_t DEREncoderAddInt32AsData(uint64_t *a1, unsigned int a2, unsigned int a3, int a4)
{
  char *v5;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v5 = _EncodedDataCreate(a2, a3, &v7, 4u, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v5);
}

uint64_t DEREncoderAddInt64AsData(uint64_t *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  char *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v7[0] = a4;
  v5 = _EncodedDataCreate(a2, a3, v7, 8u, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v5);
}

uint64_t DEREncoderAddIA5String(uint64_t *a1, const void *a2, unsigned int a3)
{
  char *v4;

  v4 = _EncodedDataCreate(0, 0x16u, a2, a3, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v4);
}

uint64_t DEREncoderAddBoolean(uint64_t *a1, int a2)
{
  char *v3;
  char *v4;
  char v6;
  char v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v7 = -1;
  v6 = 0;
  if (a2)
    v3 = &v7;
  else
    v3 = &v6;
  v4 = _EncodedDataCreate(0, 1u, v3, 1u, 0, 3);
  return _DEREncoderAddEncodedData(a1, (uint64_t)v4);
}

uint64_t DEREncoderCreateEncodedBuffer(uint64_t **a1, _QWORD *a2, unsigned int *a3)
{
  unsigned int v6;
  char *v7;
  void *v8;
  uint64_t **v9;
  char *v10;
  char *v11;
  uint64_t result;

  if (!a1)
    return 1;
  v6 = *((_DWORD *)a1 + 2);
  v7 = (char *)malloc_type_malloc(v6, 0x65EDEA8uLL);
  if (!v7)
    return 2;
  v8 = v7;
  v9 = (uint64_t **)*a1;
  if (*a1)
  {
    v10 = v7;
    do
    {
      memcpy(v10, (char *)v9 + 28, *((unsigned int *)v9 + 5));
      v11 = &v10[*((unsigned int *)v9 + 5)];
      memcpy(v11, v9[1], *((unsigned int *)v9 + 6));
      v10 = &v11[*((unsigned int *)v9 + 6)];
      v9 = (uint64_t **)*v9;
    }
    while (v9);
  }
  if (a3)
    *a3 = v6;
  if (a2)
  {
    result = 0;
    *a2 = v8;
  }
  else
  {
    free(v8);
    return 0;
  }
  return result;
}

uint64_t DEREncoderAddDataFromEncoder(uint64_t **a1, uint64_t *a2, unsigned int a3, unsigned int a4)
{
  if (a1 && a2)
    return _DEREncoderAddDataFromEncoderByEncoding(a1, a2, a3, a4, 1);
  else
    return 1;
}

uint64_t _DEREncoderAddDataFromEncoderByEncoding(uint64_t **a1, uint64_t *a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t v9;
  char *v10;
  void *v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  v12 = 0;
  v9 = DEREncoderCreateEncodedBuffer(a1, &v12, &v13);
  if (!(_DWORD)v9)
  {
    v9 = 2;
    v10 = _EncodedDataCreate(a3, a4, v12, v13, a5, 2);
    if (v10)
    {
      v12 = 0;
      v9 = _DEREncoderAddEncodedData(a2, (uint64_t)v10);
    }
  }
  if (v12)
    free(v12);
  return v9;
}

uint64_t DEREncoderAddDataFromEncoderNoCopy(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, int a5)
{
  uint64_t result;
  char *v8;
  char *v9;
  uint64_t *v10;
  _QWORD *i;
  _QWORD *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  unint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  char *v20;
  _QWORD *v21;

  result = 1;
  if (!a1 || !a2)
    return result;
  if (*(_DWORD *)(a2 + 12))
    return _DEREncoderAddDataFromEncoderByEncoding((uint64_t **)a1, (uint64_t *)a2, a3, a4, a5);
  v8 = _EncodedDataCreate(a3, a4, 0, *(_DWORD *)(a1 + 8), 1, 0);
  if (!v8)
    return 2;
  v9 = v8;
  v10 = *(uint64_t **)a1;
  v21 = 0;
  for (i = &v21; ; i = v12)
  {
    if (!v10)
    {
      v19 = v21;
      *(_QWORD *)v9 = v21;
      if (!v19)
        goto LABEL_20;
      return _DEREncoderAddEncodedData((uint64_t *)a2, (uint64_t)v9);
    }
    v12 = malloc_type_malloc(0x38uLL, 0x1070040322F9897uLL);
    if (!v12)
      break;
    v13 = v10[6];
    v15 = *((_OWORD *)v10 + 1);
    v14 = *((_OWORD *)v10 + 2);
    *(_OWORD *)v12 = *(_OWORD *)v10;
    *((_OWORD *)v12 + 1) = v15;
    v12[6] = v13;
    *((_OWORD *)v12 + 2) = v14;
    *v12 = 0;
    *((_DWORD *)v12 + 4) = 1;
    v16 = v10[1];
    if ((unint64_t)v10 + 28 > v16 || v16 >= (unint64_t)(v10 + 7))
    {
      if (v13)
        ++*(_DWORD *)(v13 + 16);
    }
    else
    {
      v12[1] = (char *)v12 + v16 - (_QWORD)v10;
    }
    *i = v12;
    v10 = (uint64_t *)*v10;
  }
  v17 = v21;
  if (v21)
  {
    do
    {
      v18 = (_QWORD *)*v17;
      _EncodedDataRelease((uint64_t)v17);
      v17 = v18;
    }
    while (v18);
  }
  *(_QWORD *)v9 = 0;
LABEL_20:
  if (!*(_QWORD *)a1)
    return _DEREncoderAddEncodedData((uint64_t *)a2, (uint64_t)v9);
  do
  {
    v20 = *(char **)v9;
    _EncodedDataRelease((uint64_t)v9);
    v9 = v20;
  }
  while (v20);
  return 2;
}

uint64_t DEREncoderAddSequenceFromEncoder(uint64_t **a1, uint64_t *a2)
{
  if (a1 && a2)
    return _DEREncoderAddDataFromEncoderByEncoding(a1, a2, 0, 0x10u, 1);
  else
    return 1;
}

uint64_t DEREncoderAddSetFromEncoder(uint64_t **a1, uint64_t *a2)
{
  if (a1 && a2)
    return _DEREncoderAddDataFromEncoderByEncoding(a1, a2, 0, 0x11u, 1);
  else
    return 1;
}

uint64_t DEREncoderAddPrivateFromEncoder(uint64_t **a1, uint64_t *a2, unsigned int a3)
{
  uint64_t **v6;
  uint64_t **v7;
  uint64_t v8;

  v6 = (uint64_t **)malloc_type_calloc(1uLL, 0x10uLL, 0x1020040EDED9539uLL);
  v7 = v6;
  if (!v6)
  {
    v8 = 0xFFFFFFFFLL;
    goto LABEL_8;
  }
  *((_DWORD *)v6 + 3) = 0;
  if (!a1)
    goto LABEL_7;
  v8 = _DEREncoderAddDataFromEncoderByEncoding(a1, (uint64_t *)v6, 0, 0x10u, 1);
  if (!(_DWORD)v8)
  {
    if (a2)
    {
      v8 = _DEREncoderAddDataFromEncoderByEncoding(v7, a2, 3u, a3, 1);
      goto LABEL_8;
    }
LABEL_7:
    v8 = 1;
  }
LABEL_8:
  DEREncoderDestroy(v7);
  return v8;
}

void _EncodedDataRelease(uint64_t a1)
{
  int v1;
  void *v3;
  uint64_t v4;

  v1 = *(_DWORD *)(a1 + 16) - 1;
  *(_DWORD *)(a1 + 16) = v1;
  if (!v1)
  {
    v3 = *(void **)(a1 + 8);
    if (v3)
    {
      v4 = *(_QWORD *)(a1 + 48);
      if (((unint64_t)v3 >= a1 + 56 || a1 + 28 > (unint64_t)v3) && v4 != 0)
      {
        if (v4 == a1)
          free(v3);
        else
          _EncodedDataRelease(*(_QWORD *)(a1 + 48));
      }
    }
    free((void *)a1);
  }
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
}

uint64_t DERParseBitString(uint64_t result, unint64_t *a2, _BYTE *a3)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 *v8;
  unint64_t v10;

  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(result + 8))
    return 3;
  v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  v4 = *(_QWORD *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      v6 = *(_QWORD *)result;
      v7 = *(_QWORD *)result + v4;
      v8 = (unsigned __int8 *)(*(_QWORD *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3)
    return 3;
  else
    return 0;
}

uint64_t DERParseBoolean(unsigned __int8 **a1, BOOL *a2)
{
  int v2;
  uint64_t result;

  if (a1[1] != (unsigned __int8 *)1)
    return 3;
  v2 = **a1;
  if (v2 != 255 && v2 != 0)
    return 3;
  result = 0;
  *a2 = v2 != 0;
  return result;
}

unint64_t *DERDecodeSeqContentInit(unint64_t *result, unint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = *result;
  v3 = result[1];
  if (__CFADD__(*result, v3))
  {
    __break(0x5513u);
  }
  else
  {
    v4 = v2 + v3;
    if (v2 <= v4)
    {
      *a2 = v2;
      a2[1] = v4;
      return 0;
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t DERParseSequence(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return DERParseSequenceToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

unint64_t *DERParseSequenceContent(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4)
    return (unint64_t *)DERParseSequenceContentToObject(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  __break(0x5519u);
  return result;
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;
  size_t v4;

  result = 0;
  if (a1 && a2)
  {
    v4 = *(_QWORD *)(a1 + 8);
    return v4 == *(_QWORD *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

uint64_t Img4DecodeSecureBootRsa4kSha384IM4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&SecureBoot_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeLocalRsa4kSha384IM4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Local_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t Img4DecodeShamRsa4kSha384IM4C(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, uint64_t a8)
{
  return Img4DecodeVerifyChainIM4C((uint64_t)&Sham_root_rsa4k_pub, 526, a1, a2, a3, a4, a5, a6, a7, a8);
}

void Img4DecodeEvaluateTrust(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  Img4DecodeEvaluateTrustWithCallbacks(a1, a2, a3, (unsigned int (*)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))img4_verify_signature_with_chain, (unsigned int (*)(uint64_t, uint64_t))Img4DecodeEvaluateCertificateProperties, (void (*)(_QWORD, _QWORD, uint64_t))sha1_digest, a4);
}

double Img4DecodeCopyPayloadHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyPayloadHashWithCallback(a1, (void (*)(_QWORD, _QWORD, __int128 *))sha1_digest, a2, a3);
}

double Img4DecodeCopyManifestHash(uint64_t a1, uint64_t a2, int a3)
{
  return Img4DecodeCopyManifestHashWithCallback(a1, (void (*)(void))sha1_digest, a2, a3);
}

double DERImg4DecodeFindInSequence(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v7;
  __int128 v8;

  v7 = 0;
  v8 = 0uLL;
  while (!DERDecodeSeqNext(a1, &v7))
  {
    if (v7 == a2)
    {
      result = *(double *)&v8;
      *a3 = v8;
      return result;
    }
  }
  return result;
}

double DERImg4DecodeContentFindItemWithTag(unint64_t *a1, uint64_t a2, _OWORD *a3)
{
  double result;
  unint64_t v6[2];

  v6[0] = 0;
  v6[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v6))
    return DERImg4DecodeFindInSequence(v6, a2, a3);
  return result;
}

uint64_t DERImg4DecodeTagCompare(uint64_t a1, unsigned int a2)
{
  unint64_t v2;
  unsigned int v5;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2 < 4)
    return 0xFFFFFFFFLL;
  if (v2 != 4)
    return 1;
  v5 = 0;
  if (DERParseInteger((char **)a1, &v5))
    return 4294967294;
  if (v5 < a2)
    return 0xFFFFFFFFLL;
  return v5 > a2;
}

uint64_t DERImg4Decode(_QWORD *a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      v6 = 0;
      v7 = 0;
      v8 = 0;
      result = DERDecodeItem((uint64_t)a1, &v6);
      if (!(_DWORD)result)
      {
        if (v6 == 0x2000000000000010)
        {
          v5 = a1[1];
          if (__CFADD__(*a1, v5) || __CFADD__(v7, v8))
          {
            __break(0x5513u);
          }
          else if (*a1 + v5 == v7 + v8)
          {
            result = DERParseSequenceContentToObject(&v7, 4u, (uint64_t)&DERImg4ItemSpecs, a2, 0x40uLL, 0);
            if (!(_DWORD)result)
              return 2 * (DERImg4DecodeTagCompare(a2, 0x494D4734u) != 0);
          }
          else
          {
            return 7;
          }
        }
        else
        {
          return 2;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadCompression(unint64_t *a1, char **a2)
{
  uint64_t result;
  unsigned int v5;

  v5 = 2;
  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)a2, 0x20uLL, 0);
      if (!(_DWORD)result)
      {
        result = DERParseInteger(a2, &v5);
        if (!(_DWORD)result)
        {
          if (v5 <= 1)
            return 0;
          else
            return 6;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadWithProperties(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = DERParseSequenceToObject(a1, 7u, (uint64_t)&DERImg4PayloadWithPropertiesItemSpecs, a2, 0xA0uLL, 0);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else if (!*(_QWORD *)(a2 + 80)
               || (v7 = 0u,
                   v8 = 0u,
                   result = DERImg4DecodePayloadCompression((unint64_t *)(a2 + 80), (char **)&v7),
                   !(_DWORD)result))
        {
          v6 = *(_QWORD *)(a2 + 96);
          v5 = a2 + 96;
          if (!v6)
            return 0;
          v7 = 0u;
          v8 = 0u;
          result = DERImg4DecodePayloadProperties(v5, (unint64_t)&v7);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePayloadProperties(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4PayloadPropertiesItemSpecs, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (DERImg4DecodeTagCompare(a2, 0x50415950u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodePayload(uint64_t a1, unint64_t a2)
{
  uint64_t result;
  unint64_t *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v10[2];
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
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  result = 6;
  if (a1 && a2)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    result = DERImg4DecodePayloadWithProperties(a1, (unint64_t)&v11);
    if ((_DWORD)result)
    {
      result = DERParseSequenceToObject(a1, 6u, (uint64_t)&DERImg4PayloadItemSpecs, a2, 0x90uLL, 0);
      if (!(_DWORD)result)
      {
        if (DERImg4DecodeTagCompare(a2, 0x494D3450u))
        {
          return 2;
        }
        else
        {
          v6 = *(_QWORD *)(a2 + 80);
          v5 = (unint64_t *)(a2 + 80);
          if (!v6)
            return 0;
          memset(v10, 0, sizeof(v10));
          result = DERImg4DecodePayloadCompression(v5, (char **)v10);
          if (!(_DWORD)result)
            return 0;
        }
      }
    }
    else
    {
      v7 = v12;
      *(_OWORD *)a2 = v11;
      *(_OWORD *)(a2 + 16) = v7;
      v8 = v14;
      *(_OWORD *)(a2 + 32) = v13;
      *(_OWORD *)(a2 + 48) = v8;
      v9 = v16;
      *(_OWORD *)(a2 + 64) = v15;
      *(_OWORD *)(a2 + 80) = v9;
    }
  }
  return result;
}

uint64_t DERImg4DecodeManifest(_QWORD *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 5uLL, (uint64_t)&DERImg4ManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeManifestCommon(_QWORD *a1, unint64_t a2, uint64_t a3, unint64_t a4, unsigned int a5)
{
  uint64_t result;
  unsigned int v9;

  result = 6;
  if (a1 && a4)
  {
    if (!*a1 || !a1[1])
      return 0;
    if (a2 >= 0x10000)
    {
      __break(0x5507u);
      return result;
    }
    result = DERParseSequenceToObject((uint64_t)a1, (unsigned __int16)a2, a3, a4, 0xC0uLL, 0);
    if (!(_DWORD)result)
    {
      if (DERImg4DecodeTagCompare(a4, a5))
        return 2;
      v9 = 0;
      result = DERParseInteger((char **)(a4 + 16), &v9);
      if ((_DWORD)result)
        return result;
      if (v9 > 2)
        return 2;
      return 0;
    }
  }
  return result;
}

uint64_t DERImg4DecodeUnsignedManifest(_QWORD *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D344Du);
}

uint64_t DERImg4DecodeCertificate(_QWORD *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 4uLL, (uint64_t)&DERImg4CertificateItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeUnsignedCertificate(_QWORD *a1, unint64_t a2)
{
  return DERImg4DecodeManifestCommon(a1, 3uLL, (uint64_t)&DERImg4UnsignedManifestItemSpecs, a2, 0x494D3443u);
}

uint64_t DERImg4DecodeCertificatePropertiesAndPubKey(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v18 = 0;
  v19 = 0;
  v20 = 0;
  result = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              v21[0] = a1;
              v21[1] = a2;
              v16 = 0u;
              v17 = 0u;
              v14 = 0u;
              v15 = 0u;
              result = DERDecodeItem((uint64_t)v21, &v18);
              if (!(_DWORD)result)
              {
                if (v18 != 0x2000000000000011)
                  return 2;
                if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERIM4CItemSpecs, (unint64_t)&v16, 0x20uLL, 0))
                {
                  result = DERDecodeItem((uint64_t)&v16, &v18);
                  if ((_DWORD)result)
                    return result;
                  if (v18 != 0x2000000000000010)
                    return 2;
                  if (!DERParseSequenceContentToObject(&v19, 2u, (uint64_t)&DERCRTPSequenceItemSpecs, (unint64_t)&v14, 0x20uLL, 0))
                  {
                    v12 = *((_QWORD *)&v15 + 1);
                    *a3 = v15;
                    *a4 = v12;
                    result = DERDecodeItem((uint64_t)&v17, &v18);
                    if ((_DWORD)result)
                      return result;
                    if (v18 == 4)
                    {
                      result = 0;
                      v13 = v20;
                      *a5 = v19;
                      *a6 = v13;
                      return result;
                    }
                    return 2;
                  }
                }
                return 0xFFFFFFFFLL;
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodeRestoreInfo(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if (!a2)
      return 6;
    if (*(_QWORD *)result && *(_QWORD *)(result + 8))
    {
      result = DERParseSequenceToObject(result, 2u, (uint64_t)&DERImg4RestoreInfoItemSpecs, a2, 0x20uLL, 0);
      if ((_DWORD)result)
        return result;
      if (DERImg4DecodeTagCompare(a2, 0x494D3452u))
        return 2;
    }
    return 0;
  }
  return result;
}

uint64_t DERImg4DecodeProperty(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  __int128 v13;
  unint64_t v14;
  __int128 v15;

  result = 6;
  if (a1)
  {
    if (a3)
    {
      v14 = 0;
      v15 = 0uLL;
      v13 = 0uLL;
      v11 = 0;
      v12 = 0;
      v9 = 0;
      v10 = 0;
      v8 = 0;
      result = DERDecodeSeqInit((uint64_t)a1, &v9, &v10);
      if (!(_DWORD)result)
      {
        if (v9 != 0x2000000000000010)
          return 2;
        result = DERDecodeSeqNext(&v10, &v14);
        if ((_DWORD)result)
          return result;
        if (v14 != 22)
          return 2;
        result = DERParseInteger((char **)&v15, &v8);
        if ((_DWORD)result)
          return result;
        if ((v8 | 0xE000000000000000) != a2)
          return 2;
        *(_OWORD *)a3 = v15;
        result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result)
          return result;
        *(_QWORD *)(a3 + 40) = v12;
        *(_OWORD *)(a3 + 24) = v13;
        result = DERDecodeSeqNext(&v10, &v12);
        if ((_DWORD)result != 1)
          return 2;
        v7 = a1[1];
        if (__CFADD__(*a1, v7))
        {
          __break(0x5513u);
        }
        else if (v11 == *a1 + v7)
        {
          return 0;
        }
        else
        {
          return 7;
        }
      }
    }
  }
  return result;
}

uint64_t DERImg4DecodePropertyWithItem(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t result;
  unsigned int v8;
  _QWORD v9[4];
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8 = 0;
  v9[0] = 0;
  v9[2] = 0;
  v9[1] = 22;
  v9[3] = 24;
  v10 = a3;
  result = DERParseSequenceToObject(a1, 2u, (uint64_t)v9, a4, 0x30uLL, 0);
  if (!(_DWORD)result)
  {
    result = DERParseInteger((char **)a4, &v8);
    if (!(_DWORD)result)
    {
      if ((v8 | 0xE000000000000000) == a2)
      {
        result = 0;
        *(_QWORD *)(a4 + 16) = a2 | 0xE000000000000000;
        *(_QWORD *)(a4 + 40) = a3;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

void DERImg4DecodeFindPropertyInSequence(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  int v7;
  __int128 v8;

  v8 = 0uLL;
  DERImg4DecodeFindInSequence(a1, a2, &v8);
  if (!v7)
    DERImg4DecodePropertyWithItem((uint64_t)&v8, a2, a3, a4);
}

void DERImg4DecodeFindProperty(unint64_t *a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7[2];

  v7[0] = 0;
  v7[1] = 0;
  if (!DERDecodeSeqContentInit(a1, v7))
    DERImg4DecodeFindPropertyInSequence(v7, a2, a3, a4);
}

void DERImg4DecodeParseManifestProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
  DERImg4DecodeParseManifestPropertiesInternal(a1, a2, a3, 0x4D414E42u);
}

void DERImg4DecodeParseManifestPropertiesInternal(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4)
{
  unint64_t v8;
  int v9;
  int v10;
  int v11;
  _OWORD v12[3];
  _OWORD v13[3];
  unint64_t v14;
  unint64_t v15[2];

  v11 = 0;
  if (a1)
  {
    if (a2 | a3)
    {
      v14 = 0;
      v15[0] = 0;
      v15[1] = 0;
      memset(v13, 0, sizeof(v13));
      memset(v12, 0, sizeof(v12));
      if (!DERDecodeItem(a1 + 264, &v14)
        && v14 == 0x2000000000000011
        && !DERParseInteger((char **)(a1 + 248), &v11))
      {
        v8 = v11 == 2 ? 0x2000000000000010 : 0x2000000000000011;
        DERImg4DecodeFindProperty(v15, a4 | 0xE000000000000000, v8, (unint64_t)v13);
        if (!v9)
        {
          if (a2)
            *(_OWORD *)a2 = *(_OWORD *)((char *)&v13[1] + 8);
          DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, 0xE00000004D414E50, 0x2000000000000011uLL, (unint64_t)v12);
          if (a3)
          {
            if (!v10)
              *(_OWORD *)a3 = *(_OWORD *)((char *)&v12[1] + 8);
          }
        }
      }
    }
  }
}

void DERImg4DecodeParseCertificateProperties(uint64_t a1, unint64_t a2, unint64_t a3)
{
  DERImg4DecodeParseManifestPropertiesInternal(a1, a2, a3, 0x43525450u);
}

uint64_t Img4DecodeParseLengthFromBufferWithTag(uint64_t a1, uint64_t a2, unsigned int a3, _QWORD *a4)
{
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD v14[2];
  unint64_t v15;
  _QWORD v16[2];
  _QWORD v17[2];

  v11 = 0;
  v12 = 0;
  v16[0] = 0;
  v16[1] = 0;
  v14[1] = 0;
  v15 = 0;
  result = 0xFFFFFFFFLL;
  v13 = 0;
  v14[0] = 0;
  if (a1)
  {
    if (a4)
    {
      v17[0] = a1;
      v17[1] = a2;
      result = DERDecodeItemPartialBufferGetLength((uint64_t)v17, &v15, &v12);
      if (!(_DWORD)result)
      {
        if (v12)
        {
          if (v15 != 0x2000000000000010)
            return 2;
          result = DERDecodeItemPartialBufferGetLength((uint64_t)v16, &v13, &v11);
          if ((_DWORD)result)
            return result;
          if (v11)
          {
            result = DERImg4DecodeTagCompare((uint64_t)v14, a3);
            if (!(_DWORD)result)
            {
              v8 = v16[0] - a1;
              if (v12 >= ~(v16[0] - a1))
                return 7;
              v9 = __CFADD__(v12, v8);
              v10 = v12 + v8;
              if (v9)
              {
                __break(0x5500u);
              }
              else
              {
                result = 0;
                *a4 = v10;
              }
              return result;
            }
            return 2;
          }
        }
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeParseLengthFromBuffer(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  return Img4DecodeParseLengthFromBufferWithTag(a1, a2, 0x494D4734u, a3);
}

uint64_t Img4DecodePayloadExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 136))
      v4 = *(_QWORD *)(a1 + 144) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayload(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 136);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadType(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  BOOL v5;

  v5 = 0;
  result = 6;
  if (!a1 || !a2 || (result = Img4DecodePayloadExists(a1, &v5), (_DWORD)result))
  {
LABEL_6:
    if (!a2)
      return result;
    goto LABEL_7;
  }
  if (v5)
  {
    result = DERParseInteger((char **)(a1 + 104), a2);
    goto LABEL_6;
  }
  result = 1;
  if (!a2)
    return result;
LABEL_7:
  if ((_DWORD)result)
    *a2 = 0;
  return result;
}

uint64_t Img4DecodeGetPayloadVersion(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 120);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadKeybagExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 152))
      v4 = *(_QWORD *)(a1 + 160) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadKeybag(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  BOOL v5;

  if (a1 && a2)
  {
    v5 = 0;
    result = Img4DecodePayloadExists(a1, &v5);
    if (!(_DWORD)result)
    {
      if (v5)
      {
        result = 0;
        *(_OWORD *)a2 = *(_OWORD *)(a1 + 152);
        return result;
      }
      result = 1;
    }
    goto LABEL_9;
  }
  result = 6;
  if (a2)
  {
LABEL_9:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
  }
  return result;
}

uint64_t Img4DecodePayloadCompressionInfoExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  BOOL v4;

  result = 6;
  if (a1 && a2)
  {
    if (*(_QWORD *)(a1 + 168))
      v4 = *(_QWORD *)(a1 + 176) != 0;
    else
      v4 = 0;
    result = 0;
    *a2 = v4;
  }
  return result;
}

uint64_t Img4DecodeGetPayloadCompressionInfo(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result;
  unint64_t *v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  BOOL v11;

  v11 = 0;
  result = 6;
  if (!a1)
    goto LABEL_14;
  if (!a2)
    goto LABEL_14;
  if (!a3)
    goto LABEL_14;
  result = Img4DecodePayloadExists(a1, &v11);
  if ((_DWORD)result)
    goto LABEL_14;
  if (!v11)
    goto LABEL_13;
  result = Img4DecodePayloadCompressionInfoExists(a1, &v11);
  if ((_DWORD)result)
    goto LABEL_14;
  if (!v11)
  {
LABEL_13:
    result = 1;
    goto LABEL_14;
  }
  v9 = 0u;
  v10 = 0u;
  v8 = *(_QWORD *)(a1 + 168);
  v7 = (unint64_t *)(a1 + 168);
  if (!v8)
  {
    result = 0xFFFFFFFFLL;
    if (!a2)
      return result;
LABEL_15:
    if (a3)
    {
      *a2 = -1;
      *a3 = -1;
    }
    return result;
  }
  result = DERParseSequenceContentToObject(v7, 2u, (uint64_t)&DERImg4CompressionItemSpecs, (unint64_t)&v9, 0x20uLL, 0);
  if ((_DWORD)result
    || (result = DERParseInteger((char **)&v9, a2), (_DWORD)result)
    || (result = DERParseInteger((char **)&v10, a3), (_DWORD)result))
  {
LABEL_14:
    if (!a2)
      return result;
    goto LABEL_15;
  }
  return result;
}

double Img4DecodeCopyPayloadHashWithCallback(uint64_t a1, void (*a2)(_QWORD, _QWORD, __int128 *), uint64_t a3, int a4)
{
  __int128 v7;
  BOOL v9;
  __int128 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3)
      return *(double *)&v7;
LABEL_9:
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    return *(double *)&v7;
  }
  v9 = 0;
  if (Img4DecodePayloadExists(a1, &v9) || !v9)
    goto LABEL_9;
  if (*(_BYTE *)a1)
  {
    v7 = *(_OWORD *)(a1 + 184);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 200);
    *(_OWORD *)a3 = v7;
  }
  else
  {
    v10 = 0uLL;
    v11 = 0;
    a2(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), &v10);
    *(_QWORD *)&v7 = v10;
    *(_OWORD *)a3 = v10;
    *(_DWORD *)(a3 + 16) = v11;
  }
  return *(double *)&v7;
}

uint64_t Img4DecodeCopyPayloadDigest(uint64_t a1, void *a2, size_t a3, uint64_t (**a4)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD))
{
  uint64_t v4;
  BOOL v10;
  _OWORD __src[3];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          v10 = 0;
          if (*a4)
          {
            if (!Img4DecodePayloadExists(a1, &v10))
            {
              if (v10)
              {
                if (a3 > 0x30)
                {
                  return 7;
                }
                else if (*(_BYTE *)a1)
                {
                  memcpy(a2, (const void *)(a1 + 184), a3);
                  return 0;
                }
                else
                {
                  memset(__src, 0, sizeof(__src));
                  v4 = (*a4)(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), __src, a3, a4);
                  if (!(_DWORD)v4)
                    memcpy(a2, __src, a3);
                }
              }
              else
              {
                return 1;
              }
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeManifestExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *(_QWORD *)(a1 + 24) != 0;
    }
  }
  return result;
}

double Img4DecodeCopyManifestHashWithCallback(uint64_t a1, void (*a2)(void), uint64_t a3, int a4)
{
  __int128 v5;

  if (!a1 || a4 != 20 || !a3)
  {
    if (!a3)
      return *(double *)&v5;
LABEL_8:
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    return *(double *)&v5;
  }
  if (!*(_QWORD *)(a1 + 24))
    goto LABEL_8;
  if (*(_BYTE *)(a1 + 1))
  {
    v5 = *(_OWORD *)(a1 + 328);
    *(_DWORD *)(a3 + 16) = *(_DWORD *)(a1 + 344);
    *(_OWORD *)a3 = v5;
  }
  else
  {
    a2();
    *(_QWORD *)&v5 = 0;
    *(_OWORD *)a3 = 0uLL;
    *(_DWORD *)(a3 + 16) = 0;
  }
  return *(double *)&v5;
}

uint64_t Img4DecodeCopyManifestDigest(uint64_t a1, void *__dst, size_t __n, uint64_t (**a4)(uint64_t, _QWORD, _OWORD *, size_t, _QWORD))
{
  uint64_t v4;
  uint64_t (*v7)(uint64_t, _QWORD, _OWORD *, size_t, _QWORD);
  uint64_t v8;
  _OWORD v10[3];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = 6;
  if (a1)
  {
    if (__dst)
    {
      if (__n)
      {
        if (a4)
        {
          v7 = *a4;
          if (*a4)
          {
            v8 = *(_QWORD *)(a1 + 24);
            if (v8)
            {
              if (__n > 0x30)
              {
                return 7;
              }
              else if (*(_BYTE *)(a1 + 1))
              {
                memcpy(__dst, (const void *)(a1 + 328), __n);
                return 0;
              }
              else
              {
                memset(v10, 0, sizeof(v10));
                v4 = v7(v8, *(_QWORD *)(a1 + 32), v10, __n, a4);
                if (!(_DWORD)v4)
                  memcpy(__dst, v10, __n);
              }
            }
            else
            {
              return 1;
            }
          }
        }
      }
    }
  }
  return v4;
}

uint64_t Img4DecodeGetManifest(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;
  uint64_t v5;
  int v6;
  BOOL v7;
  int v8;

  result = 6;
  if (a1 && a2 && a3)
  {
    v5 = *(_QWORD *)(a1 + 24);
    *a2 = v5;
    v6 = *(_DWORD *)(a1 + 32);
    *a3 = v6;
    if (v5)
      v7 = v6 == 0;
    else
      v7 = 1;
    v8 = v7;
    return (v8 << 31 >> 31);
  }
  return result;
}

uint64_t Img4DecodeSectionExists(_QWORD *a1, unsigned int a2, char *a3)
{
  uint64_t v3;
  char v4;

  v3 = 6;
  if (a2 <= 1 && a1 && a3)
  {
    if (a2 == 1)
    {
      if (!a1[55] || !a1[56])
        goto LABEL_11;
    }
    else if (!a1[33] || !a1[34])
    {
LABEL_11:
      v4 = 0;
      goto LABEL_12;
    }
    v4 = 1;
LABEL_12:
    v3 = 0;
    *a3 = v4;
  }
  return v3;
}

uint64_t Img4DecodeRestoreInfoExists(_QWORD *a1, char *a2)
{
  return Img4DecodeSectionExists(a1, 1u, a2);
}

uint64_t Img4DecodeGetRestoreInfoBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  return Img4DecodeGetBooleanFromSection(a1, 1u, a2, a3);
}

uint64_t Img4DecodeGetBooleanFromSection(uint64_t a1, unsigned int a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4;
  uint64_t v6;
  _OWORD v8[3];

  memset(v8, 0, sizeof(v8));
  v4 = 6;
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
      v4 = v6;
      if (!(_DWORD)v6)
        return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    }
  }
  return v4;
}

void Img4DecodeGetRestoreInfoInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  Img4DecodeGetIntegerFromSection(a1, 1u, a2, a3);
}

void Img4DecodeGetIntegerFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _DWORD *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger((char **)&v6[1] + 1, a4))
          *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetRestoreInfoInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  Img4DecodeGetInteger64FromSection(a1, 1u, a2, a3);
}

void Img4DecodeGetInteger64FromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (!v5)
      {
        if (DERParseInteger64((char **)&v6[1] + 1, a4))
          *a4 = 0;
      }
    }
  }
}

void Img4DecodeGetRestoreInfoData(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  Img4DecodeGetDataFromSection(a1, 1u, a2, a3, a4);
}

void Img4DecodeGetDataFromSection(uint64_t a1, unsigned int a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetPropertyFromSection(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      *a5 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
      *a5 = v8;
    }
  }
}

uint64_t Img4DecodePayloadPropertiesExists(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  _OWORD v7[6];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 6;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = 6;
  memset(v7, 0, sizeof(v7));
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v5 = a1 + 8;
    if (v6)
    {
      result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v7);
      if (!(_DWORD)result)
        *a2 = (_QWORD)v8 != 0;
    }
  }
  return result;
}

void Img4DecodePayloadProperty(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  int v7;
  int v8;
  __int128 v9;
  __int128 v10;
  _OWORD v11[6];
  _OWORD v12[4];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    if (a4)
    {
      if (*(_QWORD *)(a1 + 8))
      {
        v10 = 0uLL;
        v9 = 0uLL;
        memset(v11, 0, sizeof(v11));
        memset(v12, 0, sizeof(v12));
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)v11))
        {
          if (*(_QWORD *)&v12[0])
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)v12, 0x2000000000000010, &v10);
            if (!v7)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v8)
                DERImg4DecodeFindProperty((unint64_t *)&v9, a2, a3, a4);
            }
          }
        }
      }
    }
  }
}

void Img4DecodePayloadPropertyExistsByTag(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v5;
  int v6;
  int v7;
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
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v10 = 0uLL;
    v9 = 0uLL;
    v8 = 0uLL;
    if (a3)
    {
      if (*(_QWORD *)(a1 + 8))
      {
        v19 = 0uLL;
        v20 = 0uLL;
        v17 = 0uLL;
        v18 = 0uLL;
        v15 = 0uLL;
        v16 = 0uLL;
        v13 = 0uLL;
        v14 = 0uLL;
        v11 = 0uLL;
        v12 = 0uLL;
        if (!DERImg4DecodePayloadWithProperties(a1 + 8, (unint64_t)&v11))
        {
          if ((_QWORD)v17)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v17, 0x2000000000000010, &v10);
            if (!v5)
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v10, 0x2000000000000011, &v9);
              if (!v6)
              {
                DERImg4DecodeContentFindItemWithTag((unint64_t *)&v9, a2, &v8);
                if (!v7)
                  *a3 = (_QWORD)v8 != 0;
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeGetPayloadProperties(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[6];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 6;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  result = 6;
  memset(v8, 0, sizeof(v8));
  if (a2)
  {
    v6 = *(_QWORD *)(a1 + 8);
    v5 = a1 + 8;
    if (v6)
    {
      result = DERImg4DecodePayloadWithProperties(v5, (unint64_t)v8);
      if (!(_DWORD)result)
      {
        if ((_QWORD)v9)
        {
          result = 0;
          v7 = *((_QWORD *)&v9 + 1);
          *a2 = v9;
          a2[1] = v7;
          return result;
        }
        return 6;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeCopyPayloadPropertiesDigest(_QWORD *a1, void *a2, size_t a3, uint64_t (**a4)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD))
{
  uint64_t result;
  uint64_t (*v8)(_QWORD, _QWORD, _OWORD *, size_t, _QWORD);
  _OWORD v9[3];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  result = 6;
  if (a1 && a2 && a3)
  {
    if (a3 > 0x30)
    {
      return 7;
    }
    else if (a4)
    {
      v8 = *a4;
      if (*a4)
      {
        memset(v9, 0, sizeof(v9));
        result = v8(*a1, a1[1], v9, a3, a4);
        if (!(_DWORD)result)
        {
          memcpy(a2, v9, a3);
          return 0;
        }
      }
    }
  }
  return result;
}

void Img4DecodePayloadPropertiesFindItemWithTag(unint64_t *a1, unsigned int a2, _QWORD *a3)
{
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17[3];
  unint64_t v18;
  unint64_t v19[2];
  unint64_t v20;
  _QWORD v21[2];
  unint64_t v22[2];
  unint64_t v23[2];

  if (a1)
  {
    v23[0] = 0;
    v23[1] = 0;
    v22[0] = 0;
    v22[1] = 0;
    v21[0] = 0;
    v21[1] = 0;
    v20 = 0;
    v19[0] = 0;
    v19[1] = 0;
    v18 = 0;
    memset(v17, 0, sizeof(v17));
    v15 = 0;
    v16 = 0;
    v14 = 0;
    v13 = 0uLL;
    v12 = 0uLL;
    v11 = 0uLL;
    if (a3)
    {
      if (*a1)
      {
        DERImg4DecodeContentFindItemWithTag(a1, 0x2000000000000010, &v11);
        if (!v5)
        {
          if ((_QWORD)v11)
          {
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 22, &v13);
            if (!v6 && !DERImg4DecodeTagCompare((uint64_t)&v13, 0x50415950u))
            {
              DERImg4DecodeContentFindItemWithTag((unint64_t *)&v11, 0x2000000000000011, &v12);
              if (!v7 && !DERDecodeSeqContentInit((unint64_t *)&v12, v23))
              {
                while (1)
                {
                  do
                  {
                    while (1)
                    {
                      v8 = DERDecodeSeqNext(v23, &v20);
                      if (!v8)
                        break;
                      if (v8 == 1)
                        return;
                    }
                  }
                  while (DERDecodeItem((uint64_t)v21, &v18));
                  DERImg4DecodeContentFindItemWithTag(v19, 22, &v13);
                  if (v9)
                    break;
                  if (!DERImg4DecodeTagCompare((uint64_t)&v13, a2)
                    && !DERDecodeSeqContentInit(v19, v22)
                    && !DERDecodeSeqNext(v22, v17)
                    && v17[0] == 22
                    && !DERDecodeSeqNext(v22, &v14))
                  {
                    if (v15)
                    {
                      v10 = v16;
                      *a3 = v15;
                      a3[1] = v10;
                    }
                    return;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodeGetPayloadPropertiesBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  int v4;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 1uLL, (unint64_t)v5);
  if (!v4)
    DERParseBoolean((unsigned __int8 **)&v5[1] + 1, a3);
}

void Img4DecodeGetPayloadPropertiesInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v4;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4)
    DERParseInteger((char **)&v5[1] + 1, a3);
}

void Img4DecodeGetPayloadPropertiesInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  int v4;
  _OWORD v5[3];

  memset(v5, 0, sizeof(v5));
  Img4DecodePayloadProperty(a1, a2, 2uLL, (unint64_t)v5);
  if (!v4)
    DERParseInteger64((char **)&v5[1] + 1, a3);
}

void Img4DecodeGetPayloadPropertiesData(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  int v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  Img4DecodePayloadProperty(a1, a2, 4uLL, (unint64_t)&v8);
  if (!v6)
  {
    v7 = v10;
    *a3 = *((_QWORD *)&v9 + 1);
    *a4 = v7;
  }
}

double Img4DecodeGetObjectProperty(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  double result;
  int v10;
  int v11;
  int v12;
  _OWORD v13[3];
  unint64_t v14[2];

  v14[0] = 0;
  v14[1] = 0;
  result = 0.0;
  memset(v13, 0, sizeof(v13));
  if (a1)
  {
    if (a5)
    {
      DERImg4DecodeParseManifestProperties(a1, (unint64_t)v14, 0);
      if (v10
        || (DERImg4DecodeFindProperty(v14, a2 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v13), v11)
        || (DERImg4DecodeFindProperty((unint64_t *)&v13[1] + 1, a3, a4, (unint64_t)a5), v12))
      {
        result = 0.0;
        a5[1] = 0u;
        a5[2] = 0u;
        *a5 = 0u;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeGetObjectPropertyBoolean(uint64_t a1, uint64_t a2, uint64_t a3, BOOL *a4)
{
  uint64_t v4;
  uint64_t v6;
  _OWORD v8[3];

  memset(v8, 0, sizeof(v8));
  v4 = 6;
  if (a1 && a4)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 1uLL, v8);
    if (!(_DWORD)v6)
      return DERParseBoolean((unsigned __int8 **)&v8[1] + 1, a4);
    return v6;
  }
  return v4;
}

void Img4DecodeGetObjectPropertyInteger(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger((char **)&v6[1] + 1, a4))
        *a4 = 0;
    }
  }
}

void Img4DecodeGetObjectPropertyInteger64(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  int v5;
  _OWORD v6[3];

  memset(v6, 0, sizeof(v6));
  if (a1)
  {
    if (a4)
    {
      Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 2uLL, v6);
      if (v5 || DERParseInteger64((char **)&v6[1] + 1, a4))
        *a4 = 0;
    }
  }
}

void Img4DecodeGetObjectPropertyData(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 4uLL, &v9);
    if (v7)
    {
      v8 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetObjectPropertyString(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v9 = 0u;
  if (a1 && a4 && a5)
  {
    Img4DecodeGetObjectProperty(a1, a2, a3 | 0xE000000000000000, 0x16uLL, &v9);
    if (v7)
    {
      v8 = 0;
      *a4 = 0;
    }
    else
    {
      v8 = v11;
      *a4 = *((_QWORD *)&v10 + 1);
    }
    *a5 = v8;
  }
}

void Img4DecodeGetPayloadVersionPropertyString(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];
  uint64_t v14;
  _QWORD v15[2];

  if (a3 && a4)
  {
    v14 = 0;
    v15[0] = 0;
    v15[1] = 0;
    memset(v13, 0, sizeof(v13));
    v12 = 0uLL;
    v9 = 0u;
    v10 = 0u;
    v11 = 0u;
    if (DERDecodeItem(a1, (unint64_t *)&v14)
      || DERImg4DecodeProperty(v15, v14, (uint64_t)v13)
      || (DERImg4DecodeContentFindItemWithTag((unint64_t *)&v13[1] + 1, a2, &v12), v7)
      || DERImg4DecodeProperty(&v12, a2, (uint64_t)&v9))
    {
      v8 = 0;
      *a3 = 0;
    }
    else
    {
      v8 = v11;
      *a3 = *((_QWORD *)&v10 + 1);
    }
    *a4 = v8;
  }
}

double Img4DecodeGetPropertyFromSection(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, _OWORD *a5)
{
  int v10;
  double result;
  int v12;
  unint64_t v13[3];
  char v14;

  *(_OWORD *)v13 = 0uLL;
  if (a2 <= 1 && a1 && a5)
  {
    v14 = 0;
    if (!Img4DecodeSectionExists((_QWORD *)a1, a2, &v14) && v14)
    {
      if (a2)
      {
        *(_OWORD *)v13 = *(_OWORD *)(a1 + 440);
        goto LABEL_9;
      }
      DERImg4DecodeParseManifestProperties(a1, 0, (unint64_t)v13);
      if (!v10)
      {
LABEL_9:
        DERImg4DecodeFindProperty(v13, a3, a4, (unint64_t)a5);
        if (!v12)
          return result;
      }
    }
    result = 0.0;
    a5[1] = 0u;
    a5[2] = 0u;
    *a5 = 0u;
  }
  return result;
}

uint64_t Img4DecodeGetPropertyInteger(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) != 2)
    {
      result = 2;
      if (!a3)
        return result;
      goto LABEL_6;
    }
    if (!a3)
      return 6;
    result = DERParseInteger((char **)&v8 + 1, a3);
  }
  if (!a3)
    return result;
LABEL_6:
  if ((_DWORD)result)
    *a3 = 0;
  return result;
}

uint64_t Img4DecodeGetPropertyInteger64(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) != 2)
    {
      result = 2;
      if (!a3)
        return result;
      goto LABEL_6;
    }
    if (!a3)
      return 6;
    result = DERParseInteger64((char **)&v8 + 1, a3);
  }
  if (!a3)
    return result;
LABEL_6:
  if ((_DWORD)result)
    *a3 = 0;
  return result;
}

uint64_t Img4DecodeGetPropertyBoolean(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t v4;
  uint64_t result;
  _QWORD v6[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v4 = *(unsigned int *)(a1 + 8);
  v6[0] = *(_QWORD *)a1;
  v6[1] = v4;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  result = DERImg4DecodeProperty(v6, a2 | 0xE000000000000000, (uint64_t)&v7);
  if (!(_DWORD)result)
  {
    if (*((_QWORD *)&v9 + 1) == 1)
    {
      if (a3)
        return DERParseBoolean((unsigned __int8 **)&v8 + 1, a3);
      else
        return 6;
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t Img4DecodeGetPropertyData(uint64_t *a1, uint64_t a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD v11[2];
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v13 = 0u;
  v14 = 0u;
  v12 = 0u;
  result = 6;
  if (a3 && a4)
  {
    v8 = *a1;
    v9 = *((unsigned int *)a1 + 2);
    v11[0] = v8;
    v11[1] = v9;
    result = DERImg4DecodeProperty(v11, a2 | 0xE000000000000000, (uint64_t)&v12);
    if (!(_DWORD)result)
    {
      if (*((_QWORD *)&v14 + 1) == 4)
      {
        result = 0;
        *a3 = *((_QWORD *)&v13 + 1);
        v10 = v14;
LABEL_6:
        *a4 = v10;
        return result;
      }
      result = 2;
    }
    v10 = 0;
    *a3 = 0;
    goto LABEL_6;
  }
  return result;
}

void Img4DecodeEvaluateCertificateProperties(_QWORD *a1)
{
  Img4DecodeEvaluateCertificatePropertiesInternal(a1, 0);
}

void Img4DecodeEvaluateCertificatePropertiesInternal(_QWORD *a1, _OWORD *a2)
{
  __int128 *v4;
  int v5;
  int v6;
  __int128 v7;
  __int128 __s2;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  void *__s1;
  size_t __n;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  unint64_t v20[2];
  unint64_t v21[3];

  v21[0] = 0;
  v21[1] = 0;
  v20[0] = 0;
  v20[1] = 0;
  v19 = 0;
  v18 = 0uLL;
  __n = 0;
  v17 = 0;
  v14 = 0;
  __s1 = 0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  memset(v9, 0, sizeof(v9));
  __s2 = 0uLL;
  v7 = 0uLL;
  if (a1 && a1[40] && !DERDecodeSeqInit((uint64_t)(a1 + 39), &v19, v21) && v19 == 0x2000000000000011)
  {
    while (1)
    {
      if (DERDecodeSeqNext(v21, (unint64_t *)&v17))
        return;
      v4 = (__int128 *)(a1 + 7);
      switch(v17)
      {
        case 0xE00000004D414E50:
LABEL_11:
          v7 = *v4;
          if (DERImg4DecodeProperty(&v18, v17, (uint64_t)&v11)
            || *((_QWORD *)&v13 + 1) != 0x2000000000000011
            || DERDecodeSeqContentInit((unint64_t *)&v12 + 1, v20))
          {
            return;
          }
          while (1)
          {
            v5 = DERDecodeSeqNext(v20, (unint64_t *)&v14);
            if (v5)
              break;
            if (DERImg4DecodeProperty(&__s1, v14, (uint64_t)v9))
              return;
            DERImg4DecodeContentFindItemWithTag((unint64_t *)&v7, v14, &__s2);
            if (*((_QWORD *)&v10 + 1) <= 4uLL && ((1 << SBYTE8(v10)) & 0x16) != 0)
            {
              if (v6)
                return;
              if (__n != *((_QWORD *)&__s2 + 1))
                return;
              v6 = memcmp(__s1, (const void *)__s2, __n);
              if (v6)
                return;
            }
            else if (*((_QWORD *)&v10 + 1) != 0xA000000000000000)
            {
              if (*((_QWORD *)&v10 + 1) != 0xA000000000000001 || v6 != 1)
                return;
              v6 = 0;
            }
            if (v6)
              return;
          }
          if (v5 != 1)
            return;
          break;
        case 0xE00000006D616E78:
          if (a2)
            *a2 = v18;
          break;
        case 0xE00000004F424A50:
          v4 = (__int128 *)(a1 + 9);
          if (a1[9])
            goto LABEL_11;
          v4 = (__int128 *)(a1 + 9);
          if (a1[10])
            goto LABEL_11;
          break;
        default:
          return;
      }
    }
  }
}

void Img4DecodeCopyManifestTrustedBootPolicyMeasurement(_QWORD *a1, uint64_t a2, uint64_t a3, void *a4, size_t a5)
{
  int v9;
  _QWORD v10[3];
  _QWORD v11[3];
  _BYTE *v12;
  __int128 v13;
  uint64_t v14;
  _QWORD *v15;
  _BYTE v16[48];
  _BYTE v17[208];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    if (a5)
    {
      if (a5 <= 0x30)
      {
        memset(v17, 0, sizeof(v17));
        memset(v16, 0, sizeof(v16));
        v10[0] = Img4DecodeDigestInit;
        v10[1] = Img4DecodeDigestUpdate;
        v10[2] = Img4DecodeDigestReturnHash;
        *(_QWORD *)&v13 = &default_manifest_property_exclude;
        *((_QWORD *)&v13 + 1) = 156;
        v14 = a3;
        v15 = v10;
        Img4DecodeEvaluateCertificatePropertiesInternal(a1, &v13);
        if (!v9)
        {
          if (a1)
          {
            if (a2)
            {
              v11[0] = &v13;
              v11[1] = a2;
              v11[2] = a1;
              v12 = v17;
              if (!((unsigned int (*)(_QWORD, _BYTE **))*v15)(*(_QWORD *)(v14 + 32), &v12)
                && !Img4DecodeEvaluateDictionaryProperties(a1 + 7, 0, (uint64_t (*)(unint64_t, uint64_t *, uint64_t, uint64_t))_Img4DecodeValidateManifestPropertyInterposer, (uint64_t)v11)&& !((unsigned int (*)(_QWORD, _BYTE **, uint64_t, _BYTE *))v15[2])(*(_QWORD *)(v14 + 32), &v12, 48, v16))
              {
                memcpy(a4, v16, a5);
              }
            }
          }
        }
      }
    }
  }
}

uint64_t Img4DecodeEvaluateManifestProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 56), 0, a2, a3);
}

uint64_t Img4DecodeEvaluateDictionaryProperties(unint64_t *a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a4)
{
  uint64_t result;
  _OWORD v8[2];
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13[2];
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v15 = 0;
  v16 = 0;
  v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  memset(v8, 0, sizeof(v8));
  v9 = 0u;
  if (!a3)
    return 6;
  result = (uint64_t)DERDecodeSeqContentInit(a1, v13);
  if (!(_DWORD)result)
  {
    while (1)
    {
      result = DERDecodeSeqNext(v13, &v14);
      if ((_DWORD)result == 1)
        return 0;
      if ((_DWORD)result)
        return result;
      result = DERImg4DecodeProperty(&v15, v14, (uint64_t)v8);
      if ((_DWORD)result)
        return result;
      result = 2;
      if (*((_QWORD *)&v9 + 1) > 0x16uLL
        || ((1 << SBYTE8(v9)) & 0x400016) == 0
        || !(v14 >> 62)
        || (v14 & 0x2000000000000000) == 0)
      {
        return result;
      }
      if (HIDWORD(v16))
        break;
      v10 = v15;
      LODWORD(v11) = v16;
      v12 = *((_QWORD *)&v9 + 1);
      result = a3(v14, &v10, a2, a4);
      if ((_DWORD)result)
        return result;
    }
    return 7;
  }
  return result;
}

uint64_t Img4DecodeEvaluateObjectProperties(uint64_t a1, uint64_t (*a2)(unint64_t, uint64_t *, uint64_t, uint64_t), uint64_t a3)
{
  return Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a1 + 72), 1, a2, a3);
}

double Img4DecodeInit(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _QWORD v9[2];

  if (a1)
  {
    if (a3)
    {
      v9[0] = a1;
      v9[1] = a2;
      v7 = 0u;
      v8 = 0u;
      v5 = 0u;
      v6 = 0u;
      *(_OWORD *)a3 = 0u;
      *(_OWORD *)(a3 + 16) = 0u;
      *(_OWORD *)(a3 + 32) = 0u;
      *(_OWORD *)(a3 + 48) = 0u;
      *(_OWORD *)(a3 + 64) = 0u;
      *(_OWORD *)(a3 + 80) = 0u;
      *(_OWORD *)(a3 + 96) = 0u;
      *(_OWORD *)(a3 + 112) = 0u;
      *(_OWORD *)(a3 + 128) = 0u;
      *(_OWORD *)(a3 + 144) = 0u;
      *(_OWORD *)(a3 + 160) = 0u;
      *(_OWORD *)(a3 + 176) = 0u;
      *(_OWORD *)(a3 + 192) = 0u;
      *(_OWORD *)(a3 + 208) = 0u;
      *(_OWORD *)(a3 + 224) = 0u;
      *(_OWORD *)(a3 + 240) = 0u;
      *(_OWORD *)(a3 + 256) = 0u;
      *(_OWORD *)(a3 + 272) = 0u;
      *(_OWORD *)(a3 + 288) = 0u;
      *(_OWORD *)(a3 + 304) = 0u;
      *(_OWORD *)(a3 + 320) = 0u;
      *(_OWORD *)(a3 + 336) = 0u;
      *(_OWORD *)(a3 + 352) = 0u;
      *(_OWORD *)(a3 + 368) = 0u;
      *(_OWORD *)(a3 + 384) = 0u;
      *(_OWORD *)(a3 + 400) = 0u;
      *(_OWORD *)(a3 + 416) = 0u;
      *(_OWORD *)(a3 + 432) = 0u;
      *(_QWORD *)(a3 + 448) = 0;
      if (!DERImg4Decode(v9, (unint64_t)&v5)
        && !DERImg4DecodePayload((uint64_t)&v6, a3 + 88)
        && !DERImg4DecodeManifest(&v7, a3 + 232)
        && !DERImg4DecodeRestoreInfo((uint64_t)&v8, a3 + 424))
      {
        *(_OWORD *)(a3 + 8) = v6;
        result = *(double *)&v7;
        *(_OWORD *)(a3 + 24) = v7;
      }
    }
  }
  return result;
}

double Img4DecodeInitPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double result;
  __int128 v5;

  if (a1 && a3)
  {
    *(_QWORD *)&v5 = a1;
    *((_QWORD *)&v5 + 1) = a2;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
    *(_OWORD *)(a3 + 32) = 0u;
    *(_OWORD *)(a3 + 48) = 0u;
    *(_OWORD *)(a3 + 64) = 0u;
    *(_OWORD *)(a3 + 80) = 0u;
    *(_OWORD *)(a3 + 96) = 0u;
    *(_OWORD *)(a3 + 112) = 0u;
    *(_OWORD *)(a3 + 128) = 0u;
    *(_OWORD *)(a3 + 144) = 0u;
    *(_OWORD *)(a3 + 160) = 0u;
    *(_OWORD *)(a3 + 176) = 0u;
    *(_OWORD *)(a3 + 192) = 0u;
    *(_OWORD *)(a3 + 208) = 0u;
    *(_OWORD *)(a3 + 224) = 0u;
    *(_OWORD *)(a3 + 240) = 0u;
    *(_OWORD *)(a3 + 256) = 0u;
    *(_OWORD *)(a3 + 272) = 0u;
    *(_OWORD *)(a3 + 288) = 0u;
    *(_OWORD *)(a3 + 304) = 0u;
    *(_OWORD *)(a3 + 320) = 0u;
    *(_OWORD *)(a3 + 336) = 0u;
    *(_OWORD *)(a3 + 352) = 0u;
    *(_OWORD *)(a3 + 368) = 0u;
    *(_OWORD *)(a3 + 384) = 0u;
    *(_OWORD *)(a3 + 400) = 0u;
    *(_OWORD *)(a3 + 416) = 0u;
    *(_OWORD *)(a3 + 432) = 0u;
    *(_QWORD *)(a3 + 448) = 0;
    if (!DERImg4DecodePayload((uint64_t)&v5, a3 + 88))
    {
      result = *(double *)&v5;
      *(_OWORD *)(a3 + 8) = v5;
    }
  }
  return result;
}

uint64_t Img4DecodeInitManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 1, a3, 1229796429);
}

uint64_t Img4DecodeInitManifestCommon(uint64_t a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  result = 6;
  if (a1 && a4)
  {
    v15 = a1;
    v16 = a2;
    *(_OWORD *)a4 = 0u;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_OWORD *)(a4 + 32) = 0u;
    *(_OWORD *)(a4 + 48) = 0u;
    *(_OWORD *)(a4 + 64) = 0u;
    *(_OWORD *)(a4 + 80) = 0u;
    *(_OWORD *)(a4 + 96) = 0u;
    *(_OWORD *)(a4 + 112) = 0u;
    *(_OWORD *)(a4 + 128) = 0u;
    *(_OWORD *)(a4 + 144) = 0u;
    *(_OWORD *)(a4 + 160) = 0u;
    *(_OWORD *)(a4 + 176) = 0u;
    *(_OWORD *)(a4 + 192) = 0u;
    *(_OWORD *)(a4 + 208) = 0u;
    *(_OWORD *)(a4 + 224) = 0u;
    *(_OWORD *)(a4 + 240) = 0u;
    *(_OWORD *)(a4 + 256) = 0u;
    *(_OWORD *)(a4 + 272) = 0u;
    *(_OWORD *)(a4 + 288) = 0u;
    *(_OWORD *)(a4 + 304) = 0u;
    *(_OWORD *)(a4 + 320) = 0u;
    *(_OWORD *)(a4 + 336) = 0u;
    *(_OWORD *)(a4 + 352) = 0u;
    *(_OWORD *)(a4 + 368) = 0u;
    *(_OWORD *)(a4 + 384) = 0u;
    *(_OWORD *)(a4 + 400) = 0u;
    *(_OWORD *)(a4 + 416) = 0u;
    *(_OWORD *)(a4 + 432) = 0u;
    *(_QWORD *)(a4 + 448) = 0;
    if (a5 == 1229796419)
    {
      v10 = a4 + 232;
      if (a3)
        result = DERImg4DecodeCertificate(&v15, v10);
      else
        result = DERImg4DecodeUnsignedCertificate(&v15, v10);
    }
    else
    {
      if (a5 != 1229796429)
        return 2;
      v9 = a4 + 232;
      if (a3)
        result = DERImg4DecodeManifest(&v15, v9);
      else
        result = DERImg4DecodeUnsignedManifest(&v15, v9);
    }
    if (!(_DWORD)result)
    {
      if (*(_QWORD *)(a4 + 264))
      {
        v12 = 0;
        v13 = 0;
        v14 = 0;
        v15 = a1;
        v16 = a2;
        result = DERDecodeItemPartialBufferGetLength((uint64_t)&v15, &v12, 0);
        if (!(_DWORD)result)
        {
          *(_QWORD *)(a4 + 24) = a1;
          v11 = v14 + v13 - a1;
          if (__CFADD__(v14, v13 - a1))
          {
            __break(0x5500u);
          }
          else
          {
            *(_QWORD *)(a4 + 32) = v11;
            if (v11 == a2)
              return 0;
            else
              return 7;
          }
        }
      }
      else
      {
        return 3;
      }
    }
  }
  return result;
}

uint64_t Img4DecodeInitUnsignedManifest(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return Img4DecodeInitManifestCommon(a1, a2, 0, a3, 1229796429);
}

uint64_t Img4DecodeEvaluateCertificateChain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t result;
  void (*v9)(uint64_t);

  result = 6;
  if (a1 && a2 && a3 && a4 && a7 && a6)
  {
    v9 = *(void (**)(uint64_t))(a4 + 8);
    if (v9)
    {
      v9(a1);
      return 3;
    }
  }
  return result;
}

void Img4DecodeEvaluateTrustWithCallbacks(unsigned int a1, uint64_t a2, uint64_t (*a3)(unint64_t, uint64_t *, uint64_t, uint64_t), unsigned int (*a4)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), unsigned int (*a5)(uint64_t, uint64_t), void (*a6)(_QWORD, _QWORD, uint64_t), uint64_t a7)
{
  int v14;
  int v15;
  BOOL v16;
  _OWORD v17[3];

  memset(v17, 0, sizeof(v17));
  if (a2)
  {
    if (a3)
    {
      if (*(_QWORD *)(a2 + 24))
      {
        v16 = 0;
        a6(*(_QWORD *)(a2 + 264), *(_QWORD *)(a2 + 272), a2 + 376);
        if (!a4(*(_QWORD *)(a2 + 296), *(unsigned int *)(a2 + 304), *(_QWORD *)(a2 + 280), *(unsigned int *)(a2 + 288), a2 + 376, 20, a2 + 312, a2 + 320, a7))
        {
          DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
          if (!v14)
          {
            DERImg4DecodeFindProperty((unint64_t *)(a2 + 40), a1 | 0xE000000000000000, 0x2000000000000011uLL, (unint64_t)v17);
            if (!v15)
            {
              *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v17[1] + 8);
              if (!a5(a2, a7) && !Img4DecodePayloadExists(a2, &v16))
              {
                if (v16)
                {
                  a6(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), a2 + 184);
                  *(_BYTE *)a2 = 1;
                }
                if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, a3, a7)
                  && !Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, a3, a7))
                {
                  a6(*(_QWORD *)(a2 + 24), *(_QWORD *)(a2 + 32), a2 + 328);
                  *(_BYTE *)(a2 + 1) = 1;
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformTrustEvaluation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v5[3];

  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, (uint64_t)v5, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, a3, a4, 0, a5);
}

void Img4DecodePerformTrustEvaluatation(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v5[3];

  v5[1] = 0;
  v5[2] = 0;
  v5[0] = a3;
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, (uint64_t)v5, a4, 0, a5);
}

uint64_t Img4DecodeVerifyChainIM4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, _QWORD *a6, _QWORD *a7, _QWORD *a8, uint64_t a9, uint64_t a10)
{
  uint64_t result;
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
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[5];
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v41 = 0;
  v39 = 0u;
  memset(v40, 0, sizeof(v40));
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  result = 6;
  v17 = 0u;
  v18 = 0u;
  if (a3 && a4 && a5 && a6 && a7 && a8 && a9)
  {
    if (Img4DecodeInitManifestCommon(a3, a4, 1, (uint64_t)&v17, 1229796419)
      || (*(unsigned int (**)(_QWORD, _QWORD, char *, _QWORD, uint64_t))a9)(*((_QWORD *)&v33 + 1), v34, (char *)v40 + 8, **(_QWORD **)(a9 + 32), a9)|| (*(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, char *, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(a9 + 16))(a1, a2, *((_QWORD *)&v34 + 1), v35, (char *)v40 + 8, **(_QWORD **)(a9 + 32), a9, a10, v17, *((_QWORD *)&v17 + 1), v18, *((_QWORD *)&v18 + 1), v19,
           *((_QWORD *)&v19 + 1),
           v20,
           *((_QWORD *)&v20 + 1),
           v21,
           *((_QWORD *)&v21 + 1),
           v22,
           *((_QWORD *)&v22 + 1),
           v23,
           *((_QWORD *)&v23 + 1),
           v24,
           *((_QWORD *)&v24 + 1),
           v25,
           *((_QWORD *)&v25 + 1),
           v26,
           *((_QWORD *)&v26 + 1),
           v27,
           *((_QWORD *)&v27 + 1),
           v28,
           *((_QWORD *)&v28 + 1),
           v29,
           *((_QWORD *)&v29 + 1),
           v30,
           *((_QWORD *)&v30 + 1),
           v31,
           *((_QWORD *)&v31 + 1),
           v32,
           *((_QWORD *)&v32 + 1),
           v33))
    {
      return 0xFFFFFFFFLL;
    }
    else if (DERImg4DecodeCertificatePropertiesAndPubKey(*((uint64_t *)&v33 + 1), v34, a7, a8, a5, a6))
    {
      return 0xFFFFFFFFLL;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void Img4DecodePerformTrustEvaluationWithCallbacks(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(a1, a2, a3, a4, 0, a5);
}

void _Img4DecodePerformTrustEvaluationWithCallbacksInternal(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
  _QWORD *v9;
  uint64_t (*v13)(uint64_t, uint64_t);
  const void *v14;
  int v15;
  int v16;
  unsigned int (*v17)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t);
  unint64_t v18;
  unint64_t *v19;
  int v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD v24[3];

  v22 = 0;
  v23 = 0;
  memset(v24, 0, sizeof(v24));
  if (a2)
  {
    if (a3)
    {
      v21 = 0;
      if (a4)
      {
        if (*(_QWORD *)a3)
        {
          if (*(_QWORD *)a4)
          {
            if (*(_QWORD *)(a4 + 24))
            {
              if (*(_QWORD *)(a4 + 8))
              {
                if (*(_QWORD *)(a4 + 16))
                {
                  v9 = *(_QWORD **)(a4 + 32);
                  if (v9)
                  {
                    if (*(_QWORD *)(a2 + 24) && *v9 <= 0x30uLL && !(*(unsigned int (**)(void))a4)())
                    {
                      *(_BYTE *)(a2 + 1) = 1;
                      v13 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 8);
                      if (v13
                        && (v14 = (const void *)v13(a2, a6)) != 0
                        && !memcmp((const void *)(a2 + 328), v14, **(_QWORD **)(a4 + 32)))
                      {
                        v15 = 0;
                      }
                      else
                      {
                        if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t))(a4 + 8))(*(_QWORD *)(a2 + 296), *(_QWORD *)(a2 + 304), &v22, &v23, a2 + 312, a2 + 320, a4, a6)|| **(_QWORD **)(a4 + 32) > 0x30uLL|| (*(unsigned int (**)(_QWORD, _QWORD, uint64_t))a4)(*(_QWORD *)(a2 + 264), *(_QWORD *)(a2 + 272), a2 + 376)|| (*(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, uint64_t, uint64_t))(a4 + 16))(v22, v23, *(_QWORD *)(a2 + 280), *(_QWORD *)(a2 + 288), a2 + 376,
                               **(_QWORD **)(a4 + 32),
                               a4,
                               a6))
                        {
                          return;
                        }
                        v15 = 1;
                      }
                      DERImg4DecodeParseManifestProperties(a2, a2 + 40, a2 + 56);
                      if (v16)
                        return;
                      if ((a5 & 1) == 0)
                      {
                        v17 = *(unsigned int (**)(unint64_t *, unint64_t, uint64_t, _OWORD *, uint64_t))(a3 + 16);
                        v18 = a1 | 0xE000000000000000;
                        v19 = (unint64_t *)(a2 + 40);
                        if (v17)
                        {
                          if (v17(v19, v18, 0x2000000000000011, v24, a6))
                            return;
                        }
                        else
                        {
                          DERImg4DecodeFindProperty(v19, v18, 0x2000000000000011uLL, (unint64_t)v24);
                          if (v20)
                            return;
                        }
                        *(_OWORD *)(a2 + 72) = *(_OWORD *)((char *)&v24[1] + 8);
                      }
                      if ((!v15 || !(*(unsigned int (**)(uint64_t, uint64_t))(a4 + 24))(a2, a6))
                        && **(_QWORD **)(a4 + 32) <= 0x30uLL
                        && !Img4DecodePayloadExists(a2, &v21))
                      {
                        if (v21)
                        {
                          if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t, _QWORD, uint64_t))a4)(*(_QWORD *)(a2 + 8), *(_QWORD *)(a2 + 16), a2 + 184, **(_QWORD **)(a4 + 32), a4))
                          {
                            return;
                          }
                          *(_BYTE *)a2 = 1;
                        }
                        if (!Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 56), 0, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6)&& (a5 & 1) == 0)
                        {
                          Img4DecodeEvaluateDictionaryProperties((unint64_t *)(a2 + 72), 1, *(uint64_t (**)(unint64_t, uint64_t *, uint64_t, uint64_t))a3, a6);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

void Img4DecodePerformManifestTrustEvaluationWithCallbacks(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _Img4DecodePerformTrustEvaluationWithCallbacksInternal(0, a1, a2, a3, 1, a4);
}

uint64_t _Img4DecodeValidateManifestPropertyInterposer(unsigned int a1, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD *v8;
  unint64_t v9;
  unsigned int v10;
  unint64_t v11[3];
  unint64_t v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v10 = a1;
  if (a3)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD **)a4;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  v12[0] = 0;
  v12[1] = 0;
  memset(v11, 0, sizeof(v11));
  if (v8
    && !DERImg4DecodeProperty(v8, 0xE00000006D616E78, (uint64_t)&v13)
    && *((_QWORD *)&v15 + 1) == 0x2000000000000011
    && !DERDecodeSeqContentInit((unint64_t *)&v14 + 1, v12))
  {
    v9 = a1 | 0xE000000000000000;
    while (!DERDecodeSeqNext(v12, v11))
    {
      if (v11[0] == v9)
      {
        (*(void (**)(_QWORD, uint64_t, uint64_t, unsigned int *))(*(_QWORD *)(*(_QWORD *)a4 + 24) + 8))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 16) + 32), a4 + 24, 4, &v10);
        return 0;
      }
    }
  }
  (*(void (**)(_QWORD, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)a4 + 24) + 8))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)a4 + 16) + 32), a4 + 24, *(unsigned int *)(a2 + 8), *(_QWORD *)a2);
  return 0;
}

uint64_t sha1_digest()
{
  return ccdigest();
}

uint64_t verify_signature_rsa3k(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD **v8;
  _QWORD *v9;
  uint64_t result;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];

  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  if (!a4)
    return 0xFFFFFFFFLL;
  if (!a5)
    return 0xFFFFFFFFLL;
  if (!a6)
    return 0xFFFFFFFFLL;
  if (!a7)
    return 0xFFFFFFFFLL;
  v7 = *(_QWORD *)(a7 + 32);
  if (!v7)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD ***)(v7 + 16);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = *v8;
  if (!v9)
    return 0xFFFFFFFFLL;
  if (*v9 != a6)
    return 0xFFFFFFFFLL;
  result = verify_pkcs1_sig_0((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 3072);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t verify_pkcs1_sig_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v6;
  size_t v7;
  unint64_t *v8;
  uint64_t v9;
  uint64_t result;
  unint64_t v11;
  _BYTE *i;
  unint64_t v13;
  BOOL v14;
  int v15;
  int v16;
  _OWORD v17[2];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  if (a5 != 4096 && a5 != 3072)
    return 0xFFFFFFFFLL;
  v18[2] = 0;
  v18[3] = 0;
  v6 = (unint64_t)(a5 + 63) >> 6;
  MEMORY[0x24BDAC7A8]();
  v8 = (unint64_t *)((char *)v17 - v7);
  bzero((char *)v17 - v7, v7);
  *v8 = v6;
  v9 = *(unsigned int *)(a1 + 8);
  v18[0] = *(_QWORD *)a1;
  v18[1] = v9;
  memset(v17, 0, sizeof(v17));
  result = DERParseSequenceToObject((uint64_t)v18, (unsigned __int16)DERNumRSAPubKeyPKCS1ItemSpecs, (uint64_t)&DERRSAPubKeyPKCS1ItemSpecs, (unint64_t)v17, 0x20uLL, 0x20uLL);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  v11 = *((_QWORD *)&v17[0] + 1);
  for (i = *(_BYTE **)&v17[0]; v11; --v11)
  {
    if (*i)
      break;
    if (i == (_BYTE *)-1)
      __break(0x5513u);
    ++i;
  }
  if (v11 >= 0xFFFFFFFFFFFFFFF8)
  {
    __break(0x5500u);
    return result;
  }
  v13 = (v11 + 7) >> 3;
  if (v13 > *v8)
    return 0xFFFFFFFFLL;
  *v8 = v13;
  if (ccrsa_make_pub())
    return 0xFFFFFFFFLL;
  if (MEMORY[0x24BDAD800])
    v14 = MEMORY[0x24BDAC2C0] == 0;
  else
    v14 = 1;
  if (!v14)
  {
    v16 = ccrsa_verify_pkcs1v15_digest();
    if (!v16 && !cc_cmp_safe())
      return 0;
    return 0xFFFFFFFFLL;
  }
  LOBYTE(v17[0]) = 0;
  v15 = ccrsa_verify_pkcs1v15();
  result = 0xFFFFFFFFLL;
  if (!v15 && LOBYTE(v17[0]))
    return 0;
  return result;
}

uint64_t verify_signature_rsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  _QWORD **v8;
  _QWORD *v9;
  uint64_t result;
  _QWORD v11[2];
  _QWORD v12[2];
  _QWORD v13[2];

  v13[0] = a1;
  v13[1] = a2;
  v12[0] = a3;
  v12[1] = a4;
  v11[0] = a5;
  v11[1] = a6;
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  if (!a4)
    return 0xFFFFFFFFLL;
  if (!a5)
    return 0xFFFFFFFFLL;
  if (!a6)
    return 0xFFFFFFFFLL;
  if (!a7)
    return 0xFFFFFFFFLL;
  v7 = *(_QWORD *)(a7 + 32);
  if (!v7)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD ***)(v7 + 16);
  if (!v8)
    return 0xFFFFFFFFLL;
  v9 = *v8;
  if (!v9)
    return 0xFFFFFFFFLL;
  if (*v9 != a6)
    return 0xFFFFFFFFLL;
  result = verify_pkcs1_sig_0((uint64_t)v13, v9[4], (uint64_t)v11, (uint64_t)v12, 4096);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

void verify_signature_ecdsa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          if (a5)
          {
            if (a6)
            {
              if (a7)
              {
                v7 = *(_QWORD **)(a7 + 32);
                if (v7)
                {
                  if (v7[2] && *(_QWORD *)(a7 + 48) && *v7 == a6)
                    verify_ecdsa_sig();
                }
              }
            }
          }
        }
      }
    }
  }
}

void verify_ecdsa_sig()
{
  _QWORD *cp;
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  size_t v8;
  _QWORD *v9;
  _BYTE v10[8];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v10[7] = 0;
  ccec_x963_import_pub_size();
  if (ccec_keysize_is_supported())
  {
    cp = (_QWORD *)ccec_get_cp();
    v1 = *cp;
    if (*cp >> 61 || !is_mul_ok(8 * v1, 3uLL))
    {
      __break(0x550Cu);
    }
    else
    {
      v2 = 24 * v1;
      v3 = __CFADD__(v2, 16);
      v4 = v2 + 16;
      if (!v3)
      {
        v3 = __CFADD__(v4, 16);
        v5 = v4 + 16;
        if (!v3)
        {
          v6 = cp;
          v7 = v5 - 1;
          MEMORY[0x24BDAC7A8]();
          v9 = &v10[-v8];
          bzero(&v10[-v8], v8);
          if (v7 < 0x10)
          {
            __break(1u);
          }
          else
          {
            *v9 = v6;
            if (!ccec_import_pub())
              ccec_verify();
          }
          return;
        }
      }
    }
    __break(0x5500u);
  }
}

uint64_t verify_chain_img4_v1(unint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  uint64_t result;
  unsigned int v9;
  uint64_t v15;
  const void **v16;
  uint64_t *v17;
  const void **v18;
  unint64_t *v19;
  size_t v20;
  const void *v21;
  int v22;
  uint64_t v23;
  _QWORD *v24;
  __int128 v25;
  unint64_t v26[2];
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[216];
  _BYTE v32[24];
  unint64_t v33[30];
  _OWORD v34[2];
  uint64_t v35;
  uint64_t v36;
  _BYTE v37[32];
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41[2];
  unint64_t v42[2];
  __int128 v43;
  __int128 v44;
  unint64_t v45;
  unint64_t v46[2];
  unint64_t v47[3];

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v9 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(&v28, 0x2F0uLL);
        v26[0] = a1;
        v26[1] = v9;
        v27[0] = &ROOT_CA_CERTIFICATE;
        v27[1] = 1215;
        if (!_crack_chain_with_anchor(v26, (uint64_t)v27, 3u)
          && !parse_chain((uint64_t)v27, 3u, (uint64_t)&v29, (uint64_t)v31, (uint64_t)v34, (uint64_t)v37))
        {
          v24 = a6;
          v15 = 0;
          v16 = (const void **)v32;
          v17 = &v30;
          v18 = (const void **)v32;
          while (1)
          {
            v19 = &v26[20 * v15];
            v20 = v19[37];
            v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21)
              break;
            if (memcmp((const void *)v19[36], *(v16 - 1), v20))
              break;
            result = verify_chain_signatures(&v34[v15], v17, a7);
            if ((_DWORD)result)
              break;
            v17 += 6;
            ++v15;
            v16 = v18;
            if (v15 == 2)
            {
              v25 = 0uLL;
              if ((unint64_t)v31 > 0xFFFFFFFFFFFFFF5FLL)
              {
LABEL_34:
                __break(0x5513u);
                return result;
              }
              v42[0] = 0;
              v42[1] = 0;
              v40 = 0;
              v41[0] = 0;
              v41[1] = 0;
              if (DERDecodeSeqContentInit(v33, v42))
                return 0xFFFFFFFFLL;
LABEL_14:
              if (!DERDecodeSeqNext(v42, &v40) && v40 == 0x2000000000000011)
              {
                v47[0] = 0;
                v47[1] = 0;
                v45 = 0;
                v46[0] = 0;
                v46[1] = 0;
                v43 = 0u;
                v44 = 0u;
                if (!DERDecodeSeqContentInit(v41, v47))
                {
                  do
                  {
                    v22 = DERDecodeSeqNext(v47, &v45);
                    if (v22)
                    {
                      if (v22 == 1)
                        goto LABEL_14;
                      return 0xFFFFFFFFLL;
                    }
                    if (v45 != 0x2000000000000010
                      || DERParseSequenceContentToObject(v46, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v43, 0x20uLL, 0x20uLL))
                    {
                      return 0xFFFFFFFFLL;
                    }
                  }
                  while (!DEROidCompare((uint64_t)&oidCommonName, (uint64_t)&v43));
                  v25 = v44;
                  result = DEROidCompare((uint64_t)&verify_chain_img4_v1_sboot_item, (uint64_t)&v25);
                  if (!(_DWORD)result)
                    return 0xFFFFFFFFLL;
                  if ((unint64_t)v34 > 0xFFFFFFFFFFFFFFDFLL)
                    goto LABEL_34;
                  *a3 = v35;
                  *a4 = v36;
                  if ((unint64_t)v37 > 0xFFFFFFFFFFFFFFDFLL)
                    goto LABEL_34;
                  if (!v38)
                    return 0;
                  v23 = v39;
                  if (!v39)
                    return 0;
                  result = 0;
                  if (a5)
                  {
                    if (v24)
                    {
                      result = 0;
                      *a5 = v38;
                      *v24 = v23;
                    }
                  }
                  return result;
                }
              }
              return 0xFFFFFFFFLL;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t parse_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v17;
  unint64_t v18;
  __int128 v19;
  __int128 v20;
  char v21;
  __int128 v22;
  __int128 v23;

  if (!a2)
    return 0;
  v8 = 0;
  v15 = result;
  v18 = ~result;
  v17 = ~a3;
  v14 = ~a4;
  v13 = ~a5;
  v11 = ~a6;
  v10 = a2;
  while (1)
  {
    v9 = 16 * v8;
    if (16 * v8 > v18 || 48 * v8 > v17)
      break;
    result = DERParseSequenceToObject(v15 + 16 * v8, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + 48 * v8, 0x30uLL, 0x30uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (160 * v8 > v14)
      break;
    result = DERParseSequenceToObject(a3 + 48 * v8, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + 160 * v8, 0xA0uLL, 0xA0uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v9 > v13)
      break;
    v22 = 0u;
    v23 = 0u;
    v21 = 0;
    v19 = 0u;
    v20 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + 160 * v8 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v22, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (DERParseSequenceContentToObject((unint64_t *)&v22, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v19, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    result = DEROidCompare((uint64_t)&v19, (uint64_t)&oidRsa);
    if (!(_DWORD)result)
      return 0xFFFFFFFFLL;
    if (*((_QWORD *)&v20 + 1))
    {
      if (*((_QWORD *)&v20 + 1) != 2 || *(_BYTE *)v20 != 5)
        return 0xFFFFFFFFLL;
      if ((_QWORD)v20 == -1)
        break;
      if (*(_BYTE *)(v20 + 1))
        return 0xFFFFFFFFLL;
    }
    result = DERParseBitString((uint64_t)&v23, (unint64_t *)(a5 + 16 * v8), &v21);
    if ((_DWORD)result || v21)
      return 0xFFFFFFFFLL;
    if (v9 > v11)
      break;
    result = parse_extensions(a4 + 160 * v8, (_QWORD *)(a6 + 16 * v8));
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (++v8 == v10)
      return 0;
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_signatures(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[3];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a3)
    return 0xFFFFFFFFLL;
  v11 = 0u;
  v12 = 0u;
  v10 = 0;
  memset(v13, 0, sizeof(v13));
  v8 = 0;
  v9 = 0;
  v5 = *(_QWORD **)(a3 + 32);
  if (!v5
    || !v5[2]
    || !*(_QWORD *)a3
    || !*(_QWORD *)(a3 + 40)
    || *v5 > 0x30uLL
    || DERParseSequenceContentToObject(a2 + 2, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v11, 0x20uLL, 0x20uLL))
  {
    return 0xFFFFFFFFLL;
  }
  if (*((_QWORD *)&v12 + 1))
  {
    result = DEROidCompare((uint64_t)&v11, (uint64_t)&oidEcPubKey);
    if ((result & 1) == 0)
    {
      if (*((_QWORD *)&v12 + 1) != 2 || *(_BYTE *)v12 != 5)
        return 0xFFFFFFFFLL;
      if ((_QWORD)v12 == -1)
      {
        __break(0x5513u);
        return result;
      }
      if (*(_BYTE *)(v12 + 1))
        return 0xFFFFFFFFLL;
    }
  }
  if (!DEROidCompare((uint64_t)&v11, *(_QWORD *)(a3 + 40)))
    return 0xFFFFFFFFLL;
  if ((*(unsigned int (**)(_QWORD, _QWORD, _OWORD *, _QWORD, uint64_t))a3)(*a2, a2[1], v13, **(_QWORD **)(a3 + 32), a3))
  {
    return 0xFFFFFFFFLL;
  }
  if (DERParseBitString((uint64_t)(a2 + 4), &v8, &v10))
    return 0xFFFFFFFFLL;
  if (v10)
    return 0xFFFFFFFFLL;
  result = (*(uint64_t (**)(_QWORD, _QWORD, unint64_t, uint64_t, _OWORD *, _QWORD, uint64_t, _QWORD))(a3 + 16))(*a1, a1[1], v8, v9, v13, **(_QWORD **)(a3 + 32), a3, 0);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t verify_chain_img4_x86(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_x86);
}

uint64_t verify_chain_img4_v2_with_crack_callback(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, unsigned int (*a8)(_QWORD *, _BYTE *, uint64_t))
{
  uint64_t result;
  unsigned int v10;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD v21[2];
  _BYTE v22[48];
  _OWORD v23[9];
  uint64_t v24;
  void *__s1;
  size_t __n;
  _QWORD v27[6];
  _BYTE v28[16];
  uint64_t v29;
  uint64_t v30;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v22, 0x300uLL);
        v21[0] = a1;
        v21[1] = v10;
        if (a8(v21, v22, 2))
          return 0xFFFFFFFFLL;
        result = parse_chain((uint64_t)v22, 2u, (uint64_t)v23, (uint64_t)&v24, (uint64_t)v27, (uint64_t)v28);
        if ((_DWORD)result)
        {
          return 0xFFFFFFFFLL;
        }
        else
        {
          v16 = 1;
          v17 = 1;
          while ((v16 & 1) != 0)
          {
            v18 = &v21[20 * v17];
            if (__n == v18[33] && !memcmp(__s1, (const void *)v18[32], __n))
            {
              result = verify_chain_signatures(v27, &v23[3 * v17], a7);
              v16 = 0;
              v17 = 2;
              if (!(_DWORD)result)
                continue;
            }
            return 0xFFFFFFFFLL;
          }
          if ((unint64_t)v27 > 0xFFFFFFFFFFFFFFEFLL
            || (*a3 = v27[2], *a4 = v27[3], (unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL))
          {
            __break(0x5513u);
          }
          else if (v29 && (v19 = v30) != 0)
          {
            result = 0;
            if (a5 && a6)
            {
              result = 0;
              *a5 = v29;
              *a6 = v19;
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
  return result;
}

uint64_t crack_chain_rsa4k_sha384_x86(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_X86_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_ddi);
}

uint64_t crack_chain_rsa4k_sha384_ddi(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_ROOT_CA_CERTIFICATE;
  a2[1] = 1394;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi_global(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_ddi_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_global(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1404;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi_fake(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_ROOT_CA_CERTIFICATE;
  a2[1] = 1425;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ddi_fake_global(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_ddi_fake_global);
}

uint64_t crack_chain_rsa4k_sha384_ddi_fake_global(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_DDI_FAKE_GLOBAL_ROOT_CA_CERTIFICATE;
  a2[1] = 1435;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_avp(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_avp);
}

uint64_t crack_chain_rsa4k_sha384_avp(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_AVP_ROOT_CA_CERTIFICATE;
  a2[1] = 1431;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_tatsu_local_policy(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1382;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_tatsu_local_policy_hacktivate(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate);
}

uint64_t crack_chain_rsa4k_sha384_tatsu_local_policy_hacktivate(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &LOCAL_RSA4K_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 1442;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2_rsa3k(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa3k_sha384);
}

uint64_t crack_chain_rsa3k_sha384(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA3K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1118;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384);
}

uint64_t crack_chain_rsa4k_sha384(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 1374;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2_AWG1(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_AWG1);
}

uint64_t crack_chain_rsa4k_sha384_AWG1(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_ROOT_CA_CERTIFICATE_AWG1;
  a2[1] = 1404;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_v2_PED(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_v2_with_crack_callback(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_rsa4k_sha384_PED);
}

uint64_t crack_chain_rsa4k_sha384_PED(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &RSA4K_SHA384_PED_ROOT_CA_CERTIFICATE;
  a2[1] = 1400;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ec_v1(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, unsigned int (*a8)(_QWORD *, _BYTE *, uint64_t))
{
  uint64_t result;
  unsigned int v10;
  uint64_t v15;
  const void **v16;
  uint64_t *v17;
  const void **v18;
  _QWORD *v19;
  size_t v20;
  const void *v21;
  uint64_t v22;
  _QWORD *v25;
  _QWORD v26[2];
  _BYTE v27[48];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[264];
  _OWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  _BYTE v36[32];
  uint64_t v37;
  uint64_t v38;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    v10 = a2;
    if (a2)
    {
      if (a3 && a4)
      {
        bzero(v27, 0x330uLL);
        v26[0] = a1;
        v26[1] = v10;
        if (!a8(v26, v27, 3)
          && !parse_ec_chain((uint64_t)v27, 3u, (uint64_t)&v28, (uint64_t)&v30, (unint64_t)v32, (unint64_t)&v35, (uint64_t)v36))
        {
          v25 = a4;
          v15 = 0;
          v16 = (const void **)v31;
          v17 = &v29;
          v18 = (const void **)v31;
          while (1)
          {
            v19 = &v26[20 * v15];
            v20 = v19[37];
            v21 = *v18;
            v18 += 20;
            if ((const void *)v20 != v21)
              break;
            if (memcmp((const void *)v19[36], *(v16 - 1), v20))
              break;
            result = verify_chain_signatures(&v32[v15], v17, a7);
            if ((_DWORD)result)
              break;
            v17 += 6;
            ++v15;
            v16 = v18;
            if (v15 == 2)
            {
              if ((unint64_t)v32 > 0xFFFFFFFFFFFFFFDFLL
                || (*a3 = v33, *v25 = v34, (unint64_t)v36 > 0xFFFFFFFFFFFFFFDFLL))
              {
                __break(0x5513u);
              }
              else if (v37 && (v22 = v38) != 0)
              {
                result = 0;
                if (a5)
                {
                  if (a6)
                  {
                    result = 0;
                    *a5 = v37;
                    *a6 = v22;
                  }
                }
              }
              else
              {
                return 0;
              }
              return result;
            }
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t parse_ec_chain(uint64_t result, unsigned int a2, uint64_t a3, uint64_t a4, unint64_t a5, unint64_t a6, uint64_t a7)
{
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  char v30;
  __int128 v31;
  __int128 v32;

  if (!a2)
    return 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v21 = result;
  v24 = ~result;
  v23 = ~a3;
  v20 = ~a4;
  if (a5 <= a6)
    v12 = a6;
  else
    v12 = a5;
  v19 = ~v12;
  v16 = ~a7;
  v15 = 16 * a2;
  while (v11 <= v24 && v10 <= v23)
  {
    result = DERParseSequenceToObject(v21 + v11, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a3 + v10, 0x30uLL, 0x30uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v9 > v20)
      break;
    result = DERParseSequenceToObject(a3 + v10, (unsigned __int16)DERNumTBSCertItemSpecs, (uint64_t)&DERTBSCertItemSpecs, a4 + v9, 0xA0uLL, 0xA0uLL);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (v11 > v19)
      break;
    v31 = 0u;
    v32 = 0u;
    v30 = 0;
    v28 = 0u;
    v29 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)(a4 + v9 + 96), (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v31, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (DERParseSequenceContentToObject((unint64_t *)&v31, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)&v28, 0x20uLL, 0x20uLL))return 0xFFFFFFFFLL;
    if (!DEROidCompare((uint64_t)&v28, (uint64_t)&oidEcPubKey))
      return 0xFFFFFFFFLL;
    if (DERParseBitString((uint64_t)&v32, (unint64_t *)(a5 + v11), &v30))
      return 0xFFFFFFFFLL;
    if (v30)
      return 0xFFFFFFFFLL;
    v25 = 0;
    v26 = 0;
    v27 = 0;
    result = DERDecodeItem((uint64_t)&v29, &v25);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    v13 = (_QWORD *)(a6 + v11);
    v14 = v27;
    *v13 = v26;
    v13[1] = v14;
    if (v11 > v16)
      break;
    result = parse_extensions(a4 + v9, (_QWORD *)(a7 + v11));
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    v11 += 16;
    v10 += 48;
    v9 += 160;
    if (v15 == v11)
      return 0;
  }
  __break(0x5513u);
  return result;
}

uint64_t verify_chain_img4_ecdsa256(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_ecdsa256_sha256);
}

uint64_t verify_chain_img4_ec_v2(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7, unsigned int (*a8)(_QWORD *, _BYTE *, uint64_t))
{
  uint64_t result;
  unsigned int v10;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[2];
  _BYTE v20[32];
  _BYTE v21[48];
  _QWORD v22[6];
  _BYTE v23[80];
  void *__s1;
  size_t __n;
  void *__s2;
  uint64_t v27;
  _QWORD v28[4];
  uint64_t v29;
  _BYTE v30[16];
  uint64_t v31;
  uint64_t v32;

  result = 0xFFFFFFFFLL;
  if (!a1)
    return result;
  v10 = a2;
  if (!a2 || !a3 || !a4)
    return result;
  bzero(v20, 0x220uLL);
  v19[0] = a1;
  v19[1] = v10;
  if (a8(v19, v20, 2))
    return 0xFFFFFFFFLL;
  result = parse_ec_chain((uint64_t)v20, 2u, (uint64_t)v21, (uint64_t)v23, (unint64_t)v28, (unint64_t)&v29, (uint64_t)v30);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  if ((unint64_t)v23 > 0xFFFFFFFFFFFFFF5FLL)
    goto LABEL_22;
  if (__n != v27)
    return 0xFFFFFFFFLL;
  result = memcmp(__s1, __s2, __n);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  if ((unint64_t)v21 > 0xFFFFFFFFFFFFFFCFLL)
  {
LABEL_22:
    __break(0x5513u);
    return result;
  }
  result = verify_chain_signatures(v28, v22, a7);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  if ((unint64_t)v28 > 0xFFFFFFFFFFFFFFEFLL)
    goto LABEL_22;
  v16 = v28[3];
  *a3 = v28[2];
  *a4 = v16;
  if ((unint64_t)v30 > 0xFFFFFFFFFFFFFFEFLL)
    goto LABEL_22;
  if (!v31)
    return 0;
  v17 = v32;
  if (!v32)
    return 0;
  result = 0;
  if (a5)
  {
    if (a6)
    {
      result = 0;
      *a5 = v31;
      *a6 = v17;
    }
  }
  return result;
}

uint64_t crack_chain_ecdsa256_sha256(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC256_SHA256_ROOT_CA_CERTIFICATE;
  a2[1] = 551;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ecdsa384(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v2(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t crack_chain_ecdsa384_sha384_hacktivate(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &LOCAL_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 610;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ecdsa384_local_policy(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_ecdsa384_sha384);
}

uint64_t crack_chain_ecdsa384_sha384(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &EC384_SHA384_LP_ROOT_CA_CERTIFICATE;
  a2[1] = 542;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t verify_chain_img4_ecdsa384_hacktivate(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_ecdsa384_sha384_hacktivate);
}

uint64_t verify_chain_img4_ecdsa384_qa(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6, uint64_t a7)
{
  return verify_chain_img4_ec_v1(a1, a2, a3, a4, a5, a6, a7, (unsigned int (*)(_QWORD *, _BYTE *, uint64_t))crack_chain_ecdsa384_sha384_qa);
}

uint64_t crack_chain_ecdsa384_sha384_qa(unint64_t *a1, _QWORD *a2, unsigned int a3)
{
  *a2 = &QA_EC384_SHA384_ROOT_CA_CERTIFICATE;
  a2[1] = 540;
  if (_crack_chain_with_anchor(a1, (uint64_t)a2, a3))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t Img4DecodeDigestInit(uint64_t a1)
{
  _QWORD *v1;

  if (!a1)
    return 0xFFFFFFFFLL;
  v1 = *(_QWORD **)(a1 + 16);
  if (!v1 || !*v1)
    return 0xFFFFFFFFLL;
  ccdigest_init();
  return 0;
}

uint64_t Img4DecodeDigestUpdate(uint64_t a1)
{
  if (!a1)
    return 0xFFFFFFFFLL;
  if (!**(_QWORD **)(a1 + 16))
    return 0xFFFFFFFFLL;
  ccdigest_update();
  return 0;
}

uint64_t Img4DecodeDigestReturnHash(uint64_t a1, _QWORD *a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;

  if (!a1)
    return 0xFFFFFFFFLL;
  v4 = **(_QWORD **)(a1 + 16);
  if (!v4 || *(_QWORD *)v4 > a3)
    return 0xFFFFFFFFLL;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v4 + 56))(v4, *a2, a4);
  return 0;
}

uint64_t Img4DecodeDigestFinal(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unint64_t *v3;

  if (a1 && (v3 = **(unint64_t ***)(a1 + 16)) != 0)
    return Img4DecodeDigestReturnHash(a1, a2, *v3, a3);
  else
    return 0xFFFFFFFFLL;
}

uint64_t Img4DecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  _QWORD *v8;
  _QWORD *v9;

  result = 0xFFFFFFFFLL;
  if (a1 && a2 && a3 && a5)
  {
    v8 = *(_QWORD **)(a5 + 32);
    if (v8 && (v9 = (_QWORD *)v8[2]) != 0 && *v8 == a4 && *v9 && *(_QWORD *)*v9 == a4)
    {
      ccdigest();
      return 0;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t img4_verify_signature_with_chain(unint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, _QWORD *a7, _QWORD *a8)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v17 = 0;
  v18 = 0;
  v15 = 0;
  v16 = 0;
  if (verify_chain_img4_v1(a1, a2, &v17, &v18, &v15, &v16, (uint64_t)kImg4DecodeSecureBootRsa1kSha1))
    return 0xFFFFFFFFLL;
  *a7 = v15;
  *a8 = v16;
  result = verify_signature_rsa(v17, v18, a3, a4, a5, a6, (uint64_t)kImg4DecodeSecureBootRsa1kSha1);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t _crack_chain_with_anchor(unint64_t *a1, uint64_t a2, unsigned int a3)
{
  unint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;

  v18 = 0;
  v19 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v5 = ~a2;
  v6 = 1;
  v7 = *a1;
  v8 = a1[1];
  while (1)
  {
    v18 = v7;
    v19 = v8;
    result = DERDecodeItem((uint64_t)&v18, &v15);
    if ((_DWORD)result)
      return 0xFFFFFFFFLL;
    if (__CFADD__(v16, v17))
      break;
    v10 = v16 + v17;
    v11 = v16 + v17 - v7;
    v12 = !(v11 >> 17) && v8 >= v11;
    if (!v12 || v6 >= a3)
      return 0xFFFFFFFFLL;
    if (v5 < 16 * (unint64_t)v6)
      break;
    v14 = (unint64_t *)(a2 + 16 * v6);
    *v14 = v7;
    v14[1] = v11;
    if (v10 < v7)
      break;
    v12 = v8 >= v11;
    v8 -= v11;
    if (!v12)
      goto LABEL_21;
    ++v6;
    v7 = v10;
    if (!v8)
    {
      if (v6 == a3)
        return 0;
      return 0xFFFFFFFFLL;
    }
  }
  __break(0x5513u);
LABEL_21:
  __break(0x5515u);
  return result;
}

uint64_t parse_extensions(uint64_t a1, _QWORD *a2)
{
  char v3;
  int v4;
  _OWORD v6[2];
  __int128 v7;
  unint64_t v8;
  unint64_t v9[2];
  uint64_t v10;
  unint64_t v11[2];
  unint64_t v12[3];

  v11[0] = 0;
  v11[1] = 0;
  v9[1] = 0;
  v10 = 0;
  v8 = 0;
  v9[0] = 0;
  v7 = 0u;
  memset(v6, 0, sizeof(v6));
  *a2 = 0;
  a2[1] = 0;
  if (!*(_QWORD *)(a1 + 152))
    return 0;
  if (DERDecodeSeqInit(a1 + 144, &v10, v11) || v10 != 0x2000000000000010)
    return 0xFFFFFFFFLL;
  v3 = 1;
  while (1)
  {
    v4 = DERDecodeSeqNext(v11, &v8);
    if (v4)
      break;
    if (v8 != 0x2000000000000010
      || DERParseSequenceContentToObject(v9, (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v6, 0x30uLL, 0x30uLL))
    {
      return 0xFFFFFFFFLL;
    }
    v3 = 0;
    if (DEROidCompare((uint64_t)&oidAppleImg4ManifestCertSpec, (uint64_t)v6))
    {
      memset(v12, 0, sizeof(v12));
      if (DERDecodeItem((uint64_t)&v7, v12) || v12[0] != 0x2000000000000011)
        return 0xFFFFFFFFLL;
      v3 = 0;
      *(_OWORD *)a2 = v7;
    }
  }
  if (v4 != 1 || (v3 & 1) != 0)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

void AMSupportCFDictionarySetInteger64_cold_1()
{
  __assert_rtn("AMSupportCFDictionarySetInteger64", "AMSupport.m", 216, "num != NULL");
}

void AMSupportCFDictionarySetInteger32_cold_1()
{
  __assert_rtn("AMSupportCFDictionarySetInteger32", "AMSupport.m", 227, "num != NULL");
}

void AMSupportPlatformMapFileIntoMemory_cold_1()
{
  __assert_rtn("AMSupportPlatformMapFileIntoMemory", "AMSupportPlatform.c", 152, "fileURL != NULL");
}

void AMSupportPlatformMapFileIntoMemory_cold_2()
{
  __assert_rtn("AMSupportPlatformMapFileIntoMemory", "AMSupportPlatform.c", 153, "outMapping != NULL");
}

void AMSupportPlatformMapFileIntoMemory_cold_3()
{
  __assert_rtn("AMSupportPlatformMapFileIntoMemory", "AMSupportPlatform.c", 154, "outLength != NULL");
}

void _AMSupportPlatformConstantsInitialize_cold_1()
{
  __assert_rtn("_AMSupportPlatformTempDirURLInitialize", "AMSupportPlatform.c", 713, "_tempDirURL != NULL");
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x24BDBB7F0](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x24BDBBCA0](allocator, theData);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x24BDBBCC0](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x24BDBBD00](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x24BDBBD20](theData, length);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x24BDBBE00](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x24BDBBE10](theDict, keys, values);
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

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFDictionaryRef CFHTTPMessageCopyAllHeaderFields(CFHTTPMessageRef message)
{
  return (CFDictionaryRef)MEMORY[0x24BDB72A0](message);
}

CFDataRef CFHTTPMessageCopyBody(CFHTTPMessageRef message)
{
  return (CFDataRef)MEMORY[0x24BDB72A8](message);
}

CFStringRef CFHTTPMessageCopyRequestMethod(CFHTTPMessageRef request)
{
  return (CFStringRef)MEMORY[0x24BDB72B8](request);
}

CFURLRef CFHTTPMessageCopyRequestURL(CFHTTPMessageRef request)
{
  return (CFURLRef)MEMORY[0x24BDB72C0](request);
}

CFHTTPMessageRef CFHTTPMessageCreateRequest(CFAllocatorRef alloc, CFStringRef requestMethod, CFURLRef url, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x24BDB72D8](alloc, requestMethod, url, httpVersion);
}

CFHTTPMessageRef CFHTTPMessageCreateResponse(CFAllocatorRef alloc, CFIndex statusCode, CFStringRef statusDescription, CFStringRef httpVersion)
{
  return (CFHTTPMessageRef)MEMORY[0x24BDB72E0](alloc, statusCode, statusDescription, httpVersion);
}

void CFHTTPMessageSetBody(CFHTTPMessageRef message, CFDataRef bodyData)
{
  MEMORY[0x24BDB7308](message, bodyData);
}

void CFHTTPMessageSetHeaderFieldValue(CFHTTPMessageRef message, CFStringRef headerField, CFStringRef value)
{
  MEMORY[0x24BDB7310](message, headerField, value);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x24BDBC110](number);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x24BDBC1C0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1E8](allocator, data, options, format, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x24BDBC400]();
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x24BDBC518](alloc, theArray, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x24BDBC578](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x24BDBC5D0](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

CFIndex CFStringFindAndReplace(CFMutableStringRef theString, CFStringRef stringToFind, CFStringRef replacementString, CFRange rangeToSearch, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC5D8](theString, stringToFind, replacementString, rangeToSearch.location, rangeToSearch.length, compareOptions);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x24BDBC798](anURL, pathStyle);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC7F8](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyAppendingPathExtension(CFAllocatorRef allocator, CFURLRef url, CFStringRef extension)
{
  return (CFURLRef)MEMORY[0x24BDBC800](allocator, url, extension);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC828](allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC858](allocator, filePath, pathStyle, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x24BDBC868](allocator, URLString, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x24BDBC898](url, resolveAgainstBase, buffer, maxBufLen);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x24BDBC8B0]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x24BDBC8B8](anURL);
}

uint64_t CFURLRequestSetProxySettings()
{
  return MEMORY[0x24BDB73B0]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x24BDE8850](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x24BDE8918](allocator, data);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x24BDE8A48](identityRef, certificateRef);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x24BDE8DF8](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x24BDE8E00](trust);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

char *__cdecl addr2ascii(int a1, const void *a2, int a3, char *a4)
{
  return (char *)MEMORY[0x24BDAD128](*(_QWORD *)&a1, a2, *(_QWORD *)&a3, a4);
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x24BDAD1C0](client, msg, *(_QWORD *)&level, format);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

uint64_t ccDRBGGetRngState()
{
  return MEMORY[0x24BDAD340]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x24BDAD350]();
}

uint64_t ccdigest()
{
  return MEMORY[0x24BDAD538]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x24BDAD540]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x24BDAD548]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x24BDAD590]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x24BDAD598]();
}

uint64_t ccec_der_import_priv()
{
  return MEMORY[0x24BDAD5A8]();
}

uint64_t ccec_get_cp()
{
  return MEMORY[0x24BDAD5C8]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x24BDAD5D0]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x24BDAD5D8]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x24BDAD5E0]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x24BDAD5F0]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x24BDAD618]();
}

uint64_t ccrsa_ctx_public()
{
  return MEMORY[0x24BDAD770]();
}

uint64_t ccrsa_export_pub()
{
  return MEMORY[0x24BDAD798]();
}

uint64_t ccrsa_export_pub_size()
{
  return MEMORY[0x24BDAD7A0]();
}

uint64_t ccrsa_import_priv()
{
  return MEMORY[0x24BDAD7C0]();
}

uint64_t ccrsa_import_priv_n()
{
  return MEMORY[0x24BDAD7C8]();
}

uint64_t ccrsa_make_pub()
{
  return MEMORY[0x24BDAD7E0]();
}

uint64_t ccrsa_sign_pkcs1v15()
{
  return MEMORY[0x24BDAD7E8]();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return MEMORY[0x24BDAD7F0]();
}

uint64_t ccrsa_verify_pkcs1v15_digest()
{
  return MEMORY[0x24BDAD800]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x24BDAD818]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x24BDAD828]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x24BDAD838]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x24BDAD928]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x24BDAE328](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x24BDAE330](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
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

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

hostent *__cdecl gethostbyname(const char *a1)
{
  return (hostent *)MEMORY[0x24BDAE640](a1);
}

int gethostname(char *a1, size_t a2)
{
  return MEMORY[0x24BDAE650](a1, a2);
}

const char *__cdecl hstrerror(int a1)
{
  return (const char *)MEMORY[0x24BDAE830](*(_QWORD *)&a1);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAEB28](a1, a2);
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

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x24BDAEF38](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x24BDAF910](a1, a2);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return MEMORY[0x24BDAFB38](__p, __ec);
}

int rmdir(const char *a1)
{
  return MEMORY[0x24BDAFBB0](a1);
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

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x24BDAFFB0](__stringp, __delim);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x24BDB0090](a1, a2);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

