uint64_t AMFDRTagsStringToTag(unsigned int *a1)
{
  return bswap32(*a1);
}

void *AMFDRDecodeLogSetHandler(void *result)
{
  _logHandler = result;
  return result;
}

uint64_t _AMFDRDecodeComputeDigest(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  _QWORD *v8;

  result = 6;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a5)
        {
          v8 = *(_QWORD **)(a5 + 32);
          if (v8)
          {
            if (*v8 == a4)
            {
              if (DEROidCompare(v8[1], (uint64_t)&oidSha1))
              {
                if (!AMSupportDigestSha1())
                  return 0;
              }
              else if (DEROidCompare(*(_QWORD *)(*(_QWORD *)(a5 + 32) + 8), (uint64_t)&oidSha256))
              {
                if (!AMSupportDigestSha256())
                  return 0;
              }
              else
              {
                if (!DEROidCompare(*(_QWORD *)(*(_QWORD *)(a5 + 32) + 8), (uint64_t)&oidSha384))
                  return 4;
                if (!AMSupportDigestSha384())
                  return 0;
              }
              return 3;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t _AMFDRDecodeVerifyChain(uint64_t a1, uint64_t a2, DERByte **a3, _QWORD *a4, DERByte **a5, DERSize *a6, uint64_t a7, uint64_t a8)
{
  DERItem v8;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  unsigned int v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  int i;
  int v32;
  uint64_t length;
  unsigned int v34;
  BOOL v35;
  uint64_t v36;
  uint64_t v37;
  DERItem *v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  DERItem *v42;
  uint64_t v43;
  uint64_t v44;
  DERItem v45;
  uint64_t v46;
  DERSize *v47;
  DERItem v48;
  _OWORD v49[4];
  DERItem *v50;
  _OWORD v51[19];
  DERItem v52;
  DERItem v53;
  DERItem v54;
  DERItem v55;
  DERItem v56;
  DERItem v57;
  DERItem v58;
  DERItem v59;
  DERItem v60;
  DERItem v61;
  DERItem v62;
  DERItem v63;
  DERItem v64;
  DERItem v65;
  DERItem v66;
  DERItem v67;
  DERItem v68;
  DERItem v69;
  DERItem v70;
  _QWORD v71[3];
  int v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v72 = 0;
  memset(v71, 170, sizeof(v71));
  v8.data = (DERByte *)0xAAAAAAAAAAAAAAAALL;
  v8.length = 0xAAAAAAAAAAAAAAAALL;
  v69 = v8;
  v70 = v8;
  v67 = v8;
  v68 = v8;
  v65 = v8;
  v66 = v8;
  v63 = v8;
  v64 = v8;
  v61 = v8;
  v62 = v8;
  v59 = v8;
  v60 = v8;
  v57 = v8;
  v58 = v8;
  v55 = v8;
  v56 = v8;
  v53 = v8;
  v54 = v8;
  v51[18] = v8;
  v52 = v8;
  v51[16] = v8;
  v51[17] = v8;
  v51[14] = v8;
  v51[15] = v8;
  v51[12] = v8;
  v51[13] = v8;
  v51[10] = v8;
  v51[11] = v8;
  v51[8] = v8;
  v51[9] = v8;
  v51[6] = v8;
  v51[7] = v8;
  v51[4] = v8;
  v51[5] = v8;
  v51[2] = v8;
  v51[3] = v8;
  v51[0] = v8;
  v51[1] = v8;
  v50 = (DERItem *)v51;
  if (a8)
  {
    if (a1 && a2)
    {
      if (a5 && a6)
      {
        if (!(_DWORD)a2)
        {
          v19 = 3;
          AMFDRDecodeLogInternal(3, "%s: _AMFDRDecodeIterateCertChainBegin failed", "_AMFDRDecodeVerifyChain");
          v21 = *(_QWORD *)a8 | 1;
          goto LABEL_56;
        }
        v71[1] = a2;
        v71[2] = 0;
        v71[0] = a1;
        AMFDRDecodeIterateCertChainNextWithOptions((uint64_t)v71, *(_QWORD *)(a8 + 2016), (_OWORD **)&v50, &v72);
        v15 = v14;
        if (v14 || !v50)
        {
          v19 = 3;
          AMFDRDecodeLogInternal(3, "%s: _AMFDRDecodeIterateCertChainNext failed (first call)", "_AMFDRDecodeVerifyChain");
          v21 = *(_QWORD *)a8 | v15;
LABEL_56:
          *(_QWORD *)a8 = v21;
          return v19;
        }
        if (*(_QWORD *)(a8 + 1944) && *(_QWORD *)(a8 + 1952))
        {
          if ((*(_BYTE *)(a8 + 2017) & 1) != 0)
          {
            memset(v49, 0, sizeof(v49));
            v48 = (DERItem)0;
            v22 = AMFDRDecodeIterateTrustObjectTrustedKeyBegin(a8 + 1768);
            if (v22 == 0x40000000000000)
            {
              AMFDRDecodeLogInternal(4, "%s: trustobject does not contain trusted key", "_AMFDRDecodeVerifyChain");
            }
            else if (v22)
            {
              *(_QWORD *)a8 |= v22;
              AMFDRDecodeLogInternal(3, "%s: failed to begin decoding trusted key");
              return 3;
            }
            v23 = 0;
LABEL_26:
            while (1)
            {
              v73 = 0;
              v74 = 0;
              v75 = 0;
              v24 = DERDecodeSeqNext((unint64_t *)(a8 + 1896), &v73);
              if (v24)
                break;
              v25 = v74;
              v26 = v75;
              if (v74)
                v27 = (_DWORD)v75 == 0;
              else
                v27 = 1;
              if (v27)
                goto LABEL_40;
              AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued by trusted key %d", "_AMFDRDecodeVerifyChain", v23);
              v28 = AMFDRDecodePublicKey((uint64_t)&v48, v25, v26);
              if (v28)
              {
                AMFDRDecodeLogInternal(7, "%s: PKI: decoding trusted key %d failed with error 0x%016llX");
                goto LABEL_72;
              }
              while (!DEROidCompare((uint64_t)&v50[1], (*(_QWORD **)((char *)&kAMFDRDecodeEcdsaInfoList + v28))[3])
                   || !DEROidCompare((uint64_t)v49, (*(_QWORD **)((char *)&kAMFDRDecodeEcdsaInfoList + v28))[2]))
              {
                v28 += 8;
                if (v28 == 24)
                {
                  ++v23;
                  goto LABEL_26;
                }
              }
              v69 = (DERItem)0;
              v70 = (DERItem)0;
              v68 = (DERItem)0;
              v63 = (DERItem)0;
              v64 = (DERItem)0;
              v61 = (DERItem)0;
              v62 = (DERItem)0;
              v59 = (DERItem)0;
              v60 = (DERItem)0;
              v57 = (DERItem)0;
              v58 = (DERItem)0;
              v55 = (DERItem)0;
              v56 = (DERItem)0;
              v53 = (DERItem)0;
              v54 = (DERItem)0;
              v52 = (DERItem)0;
              v65 = v48;
              v66 = oidEcPubKey;
              v67 = (DERItem)v49[0];
              v29 = AMFDRDecodeVerifyCertIssuerWithOptions((uint64_t)v50, (uint64_t)&v52, a8 + 1768, *(_QWORD *)(a8 + 2016), (_QWORD *)a8);
              if (v29 != 0x20000000000)
              {
                if (!v29)
                {
                  AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued by trusted key %d (success)", "_AMFDRDecodeVerifyChain", v23);
                  goto LABEL_53;
                }
                goto LABEL_74;
              }
            }
            if (v24 == 1)
            {
LABEL_40:
              AMFDRDecodeLogInternal(7, "%s: end of trusted key sequence found root_key=%d", "_AMFDRDecodeVerifyChain", v23);
              *(_QWORD *)a8 |= 0x100uLL;
              goto LABEL_53;
            }
            v29 = 0x400000;
LABEL_74:
            *(_QWORD *)a8 |= v29;
            AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued by trusted key %d failed with error 0x%016llX");
            return 3;
          }
          v16 = AMFDRDecodeIterateTrustObjectTrustedBegin(a8 + 1768);
          if (v16)
          {
            v17 = v16;
            v18 = "%s: AMFDRDecodeIterateTrustObjectTrustedBegin failed";
LABEL_55:
            v19 = 3;
            AMFDRDecodeLogInternal(3, v18, "_AMFDRDecodeVerifyChain");
            v21 = *(_QWORD *)a8 | v17;
            goto LABEL_56;
          }
          v30 = a4;
          for (i = 0; ; ++i)
          {
            v48 = (DERItem)0;
            *(_QWORD *)&v49[0] = 0;
            v32 = DERDecodeSeqNext((unint64_t *)(a8 + 1832), (unint64_t *)&v48);
            if (v32)
              break;
            length = v48.length;
            v34 = v49[0];
            if (v48.length)
              v35 = LODWORD(v49[0]) == 0;
            else
              v35 = 1;
            if (v35)
              goto LABEL_51;
            AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued by trusted root %d", "_AMFDRDecodeVerifyChain", i);
            v36 = AMFDRDecodeCertificate((unint64_t)&v52, length, v34);
            if (v36)
            {
              v28 = v36;
              AMFDRDecodeLogInternal(7, "%s: PKI: decoding trusted root %d failed with error 0x%016llX");
              goto LABEL_72;
            }
            v37 = AMFDRDecodeVerifyCertIssuerWithOptions((uint64_t)v50, (uint64_t)&v52, a8 + 1768, 0, 0);
            if (v37 != 0x20000000000)
            {
              v28 = v37;
              if (!v37)
              {
                AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued by trusted root %d (success)", "_AMFDRDecodeVerifyChain", i);
                goto LABEL_52;
              }
              AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued by trusted root %d failed with error 0x%016llX");
LABEL_72:
              v46 = *(_QWORD *)a8 | v28;
              goto LABEL_64;
            }
          }
          if (v32 == 1)
          {
LABEL_51:
            AMFDRDecodeLogInternal(7, "%s: end of trusted root sequence found root_cert=%d", "_AMFDRDecodeVerifyChain", i);
            *(_QWORD *)a8 |= 0x100uLL;
LABEL_52:
            a4 = v30;
            goto LABEL_53;
          }
          AMFDRDecodeLogInternal(7, "%s: AMFDRDecodeIterateTrustObjectTrustedNext failed", "_AMFDRDecodeVerifyChain");
          v46 = *(_QWORD *)a8 | 0x400000;
        }
        else
        {
          AMFDRDecodeLogInternal(4, "%s: Skipping trust root check (trustobject unset)", "_AMFDRDecodeVerifyChain");
          *(_QWORD *)a8 |= 0x200100uLL;
LABEL_53:
          v38 = v50;
          v50 = &v52;
          AMFDRDecodeIterateCertChainNextWithOptions((uint64_t)v71, *(_QWORD *)(a8 + 2016), (_OWORD **)&v50, &v72);
          if (v39)
          {
            v17 = v39;
            v18 = "%s: _AMFDRDecodeIterateCertChainNext failed (second call)";
            goto LABEL_55;
          }
          v47 = a4;
          v40 = 1;
          while (1)
          {
            if (!v50)
            {
              *a3 = v38[13].data;
              *v47 = v38[13].length;
              *a5 = v38[18].data;
              *a6 = v38[18].length;
              v45 = v38[15];
              *(DERItem *)(a8 + 312) = v38[14];
              *(DERItem *)(a8 + 328) = v45;
              AMFDRDecodeLogInternal(7, "%s: PKI: check payload hash with signature (success)", "_AMFDRDecodeVerifyChain");
              return 0;
            }
            AMFDRDecodeLogInternal(7, "%s: PKI: verify cert %d was issued by cert %d", "_AMFDRDecodeVerifyChain", v40, v40 - 1);
            v41 = AMFDRDecodeVerifyCertIssuerWithOptions((uint64_t)v50, (uint64_t)v38, a8 + 1768, *(_QWORD *)(a8 + 2016), (_QWORD *)a8);
            if (v41)
              break;
            AMFDRDecodeLogInternal(7, "%s: PKI: verify cert %d was issued by %d (success)", "_AMFDRDecodeVerifyChain", v40, v40 - 1);
            ++v40;
            v42 = v50;
            v50 = v38;
            AMFDRDecodeIterateCertChainNextWithOptions((uint64_t)v71, *(_QWORD *)(a8 + 2016), (_OWORD **)&v50, &v72);
            v38 = v42;
            if (v43)
            {
              v44 = v43;
              v19 = 3;
              AMFDRDecodeLogInternal(3, "%s: _AMFDRDecodeIterateCertChainNext failed (%d)", "_AMFDRDecodeVerifyChain", v40);
              v21 = *(_QWORD *)a8 | v44;
              goto LABEL_56;
            }
          }
          AMFDRDecodeLogInternal(7, "%s: PKI: verify cert %d was issued by cert %d failed with error 0x%016llX", "_AMFDRDecodeVerifyChain", v40, v40 - 1, v41);
          v46 = *(_QWORD *)a8 | 0x40000000000;
        }
LABEL_64:
        *(_QWORD *)a8 = v46;
        return 3;
      }
      AMFDRDecodeLogInternal(3, "%s: outImg4Blob must be non NULL and outImg4BlobLength must be non 0");
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: chain_blob must be non NULL and chain_blob_length must be non 0");
    }
    *(_QWORD *)a8 |= 1uLL;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: context must be non NULL", "_AMFDRDecodeVerifyChain");
  }
  return 6;
}

uint64_t _AMFDRDecodeVerifySignature(const void *a1, size_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  DERItem v15;

  if (!a1 || !a2)
  {
    AMFDRDecodeLogInternal(3, "%s: publicKey must be non NULL and publicKeyLength must be non 0");
    goto LABEL_19;
  }
  if (!a3 || !a4)
  {
    AMFDRDecodeLogInternal(3, "%s: signature must be non NULL and publicKeyLsignatureLengthength must be non 0");
    goto LABEL_19;
  }
  if (!a5 || !a6)
  {
    AMFDRDecodeLogInternal(3, "%s: digest must be non NULL and digestLength must be non 0");
    goto LABEL_19;
  }
  if (!a7 || !*(_QWORD *)(a7 + 40))
  {
    AMFDRDecodeLogInternal(3, "%s: implementation must be non NULL and signatureOid must be non NULL");
    goto LABEL_19;
  }
  if (**(_QWORD **)(a7 + 32) != a6)
  {
    AMFDRDecodeLogInternal(3, "%s: digestLength is %zu, expecting %zu");
    goto LABEL_19;
  }
  if (!DEROidCompare(a8 + 312, (uint64_t)&oidEcPubKey))
  {
    if (DEROidCompare(*(_QWORD *)(a7 + 40), (uint64_t)&oidSha1Rsa))
    {
      if (!DEROidCompare(a8 + 312, (uint64_t)&oidRsa))
        goto LABEL_46;
      result = AMSupportRsaVerifySignatureSha1();
    }
    else if (DEROidCompare(*(_QWORD *)(a7 + 40), (uint64_t)&oidSha256Rsa))
    {
      if (!DEROidCompare(a8 + 312, (uint64_t)&oidRsa))
        goto LABEL_46;
      result = AMSupportRsaVerifySignatureSha256();
    }
    else
    {
      if (!DEROidCompare(*(_QWORD *)(a7 + 40), (uint64_t)&oidSha384Rsa))
      {
        result = 4;
LABEL_20:
        if (!a8)
          return result;
        goto LABEL_21;
      }
      if (!DEROidCompare(a8 + 312, (uint64_t)&oidRsa))
        goto LABEL_46;
      result = AMSupportRsaVerifySignatureSha384();
    }
    if ((_DWORD)result == 2)
    {
      *(_QWORD *)a8 |= 0x80000000000000uLL;
      result = 3;
LABEL_21:
      *(_QWORD *)a8 |= 0x1000000000000uLL;
      return result;
    }
    goto LABEL_47;
  }
  if ((uint64_t (**)())a7 != kAMFDRDecodeImplementationSha384
    && (uint64_t (**)())a7 != kAMFDRDecodeImplementationOffline)
  {
    AMFDRDecodeLogInternal(3, "%s: Expecting kAMFDRDecodeImplementationSha384 or kAMFDRDecodeImplementationOffline");
LABEL_19:
    result = 6;
    goto LABEL_20;
  }
  v15 = oidEcPrime256v1;
  if ((*(_BYTE *)(a8 + 2017) & 1) == 0)
  {
    if (!AMSupportDigestSha256())
      goto LABEL_44;
LABEL_46:
    result = 3;
    goto LABEL_20;
  }
  if (!*(_QWORD *)(a8 + 336))
  {
    AMFDRDecodeLogInternal(3, "%s: missing IM4C leaf public key OID");
    goto LABEL_19;
  }
  v13 = 0;
  v15 = *(DERItem *)(a8 + 328);
  while (!DEROidCompare((uint64_t)&v15, (*(_QWORD **)((char *)&kAMFDRDecodeEcdsaInfoList + v13))[2]))
  {
    v13 += 8;
    if (v13 == 24)
      goto LABEL_36;
  }
  v14 = *(uint64_t *)((char *)&kAMFDRDecodeEcdsaInfoList + v13);
  if (!*(_DWORD *)(v14 + 8))
  {
LABEL_36:
    AMFDRDecodeLogInternal(3, "%s: invalid digest length");
    goto LABEL_19;
  }
  if (AMFDRDecodeDigestByLength(*(_QWORD *)(a8 + 664), *(_QWORD *)(a8 + 672), a8 + 776, *(unsigned int *)(v14 + 8)))goto LABEL_46;
LABEL_44:
  result = AMFDRDecodeEcdsaVerifySignature(a1, a2);
  if ((_DWORD)result == 2)
  {
    *(_QWORD *)a8 |= 0x80000000000000uLL;
    goto LABEL_46;
  }
LABEL_47:
  if ((_DWORD)result)
    goto LABEL_46;
  return result;
}

uint64_t _AMFDRDecodeEvaluateCertificateProperties(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  unint64_t *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  unint64_t v18[3];
  unint64_t v19[3];
  unint64_t v20;
  unint64_t v21[5];

  memset(v21, 170, 32);
  memset(v19, 170, sizeof(v19));
  memset(v18, 170, sizeof(v18));
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v17 = v3;
  v4 = 6;
  if (!a1 || !a2)
  {
LABEL_31:
    if (!a2)
      return v4;
    goto LABEL_32;
  }
  if (!*(_QWORD *)(a1 + 320) || (v6 = a1 + 312, !*(_QWORD *)(a1 + 312)))
  {
    v4 = 0;
    v14 = 0x200000000000;
LABEL_21:
    *(_QWORD *)a2 |= v14;
    return v4;
  }
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v7 = DERDecodeSeqInit(v6, &v20, &v21[2]);
  if ((_DWORD)v7)
  {
    v4 = v7;
    AMFDRDecodeLogInternal(3, "%s: failed to init certificate sequence", "_AMFDRDecodeEvaluateCertificateProperties");
LABEL_32:
    v14 = 0x800000000000;
    goto LABEL_21;
  }
  if (v20 != 0x2000000000000011)
  {
    v4 = 2;
    goto LABEL_32;
  }
  v8 = 0;
  do
  {
    v9 = DERDecodeSeqNext(&v21[2], v19);
    if (v9)
    {
      if (v9 == 1)
      {
        if (v8)
          return 0;
        AMFDRDecodeLogInternal(3, "%s: End of Outer Sequence found, before any valid DER.");
      }
      else
      {
        AMFDRDecodeLogInternal(3, "%s: Outer DER did not terminate properly.");
      }
      goto LABEL_27;
    }
    ++v8;
    if (v19[0] == 0xE00000004D414E50)
      break;
    if (v19[0] != 0xE00000004F424A50)
      goto LABEL_29;
  }
  while ((*(_BYTE *)(a2 + 2016) & 0x80) != 0);
  v10 = DERImg4DecodeProperty();
  if ((_DWORD)v10)
  {
    v4 = v10;
    AMFDRDecodeLogInternal(3, "%s: failed to parse certificate dictionary");
  }
  else
  {
    if (*((_QWORD *)&v17 + 1) != 0x2000000000000011)
      goto LABEL_30;
    v11 = DERDecodeSeqContentInit((unint64_t *)&v16 + 1, v21);
    if (!(_DWORD)v11)
    {
      v12 = DERDecodeSeqNext(v21, v18);
      if (!v12)
      {
        v13 = DERImg4DecodeProperty();
        if (!(_DWORD)v13)
        {
          DERImg4DecodeContentFindItemWithTag();
LABEL_29:
          AMFDRDecodeLogInternal(3, "%s: unexpected tag 0x%llX in certificate properties");
LABEL_30:
          v4 = 2;
          goto LABEL_31;
        }
        v4 = v13;
        AMFDRDecodeLogInternal(3, "%s: failed to parse certificate property");
        goto LABEL_41;
      }
      if (v12 == 1)
        AMFDRDecodeLogInternal(3, "%s: End of Inner Sequence found, before any valid DER.");
      else
        AMFDRDecodeLogInternal(3, "%s: Inner DER did not terminate properly.");
LABEL_27:
      v4 = 0xFFFFFFFFLL;
      if (a2)
        goto LABEL_32;
      return v4;
    }
    v4 = (uint64_t)v11;
    AMFDRDecodeLogInternal(3, "%s: failed to certificate dictionary");
  }
LABEL_41:
  if (a2)
    goto LABEL_32;
  return v4;
}

uint64_t _AMFDRDecodeVerifyChainOffline(uint64_t a1, uint64_t a2, unint64_t *a3, unint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  __int128 v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  _OWORD v19[13];
  void *__s1[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unint64_t v26[3];
  _QWORD v27[2];

  memset(v26, 170, sizeof(v26));
  if (a8)
  {
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24 = v11;
    v25 = v11;
    v22 = v11;
    v23 = v11;
    *(_OWORD *)__s1 = v11;
    v21 = v11;
    v19[11] = v11;
    v19[12] = v11;
    v19[9] = v11;
    v19[10] = v11;
    v19[7] = v11;
    v19[8] = v11;
    v19[5] = v11;
    v19[6] = v11;
    v19[3] = v11;
    v19[4] = v11;
    v19[1] = v11;
    v19[2] = v11;
    v19[0] = v11;
    v27[0] = a1;
    v27[1] = a2;
    if (DERDecodeItem((uint64_t)v27, v26))
    {
      v12 = "%s: malformed offline signing public key";
    }
    else
    {
      if (v26[0] != 2)
      {
        v13 = 3;
        AMFDRDecodeLogInternal(3, "%s: malformed offline signing public key tag", "_AMFDRDecodeVerifyChainOffline");
        v14 = *(_QWORD *)a8 | 0x40;
        goto LABEL_15;
      }
      if (!AMFDRDecodeCertificate((unint64_t)v19, *(_QWORD *)(a8 + 296), *(_DWORD *)(a8 + 304)))
      {
        *(_QWORD *)a8 |= 0x100uLL;
        v15 = v26[2];
        if ((void *)v26[2] == __s1[1])
        {
          v16 = v26[1];
          if (!memcmp(__s1[0], (const void *)v26[1], v26[2]))
          {
            v13 = 0;
            *a3 = v16;
            *a4 = v15;
            *(DERItem *)(a8 + 312) = oidEcPubKey;
            return v13;
          }
          v17 = "%s: offline signing public key mismatch";
        }
        else
        {
          v17 = "%s: offline signing public key length mismatch";
        }
        v13 = 3;
        AMFDRDecodeLogInternal(3, v17, "_AMFDRDecodeVerifyChainOffline");
        v14 = *(_QWORD *)a8 | 0x20000000000000;
        goto LABEL_15;
      }
      v12 = "%s: fail to decode certificate of offline signing";
    }
    v13 = 3;
    AMFDRDecodeLogInternal(3, v12, "_AMFDRDecodeVerifyChainOffline");
    v14 = *(_QWORD *)a8 | 0x40000000000;
LABEL_15:
    *(_QWORD *)a8 = v14;
    return v13;
  }
  AMFDRDecodeLogInternal(3, "%s: context must be non NULL", "_AMFDRDecodeVerifyChainOffline");
  return 6;
}

uint64_t _AMFDRDecodeEvaluateTestStationCertificateProperties()
{
  return 0;
}

uint64_t _AMFDRDecodeVerifyDataCallback(int a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t PropertyData;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  char *v17;
  uint64_t v18;
  _DWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  size_t v24;
  const void *v25;
  char *v26;
  char *v27;
  unsigned int *v28;
  int v29;
  void *v30;
  size_t v31;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *__s1;
  size_t __n;
  _DWORD *v39;
  unsigned int v40;

  v40 = 0;
  v39 = 0;
  if (!a4)
  {
    AMFDRDecodeLogInternal(3, "%s: fdrDecode is NULL", "_AMFDRDecodeVerifyDataCallback");
    return 6;
  }
  if (!a2)
  {
    AMFDRDecodeLogInternal(3, "%s: property is NULL", "_AMFDRDecodeVerifyDataCallback");
    *(_QWORD *)a4 |= 1uLL;
    return 6;
  }
  if (a1 <= 1634953571)
  {
    if (a1 > 1400000108)
    {
      if (a1 == 1400000109)
        return 0;
      if (a1 == 1400010324)
      {
        PropertyData = Img4DecodeGetPropertyData();
        if (!(_DWORD)PropertyData)
        {
          AMFDRDecodeLogInternal(3, "%s: Invalid property length of kFDRTag_SrvT", "_AMFDRDecodeVerifyDataCallback");
          v6 = 0;
          v10 = *(_QWORD *)a4 | 0x200;
          goto LABEL_94;
        }
        v6 = PropertyData;
        AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_SrvT) failed.");
        goto LABEL_36;
      }
      goto LABEL_37;
    }
    if (a1 == 1145525076)
    {
      if ((*(_BYTE *)(a4 + 2017) & 0x10) == 0)
      {
        v13 = Img4DecodeGetPropertyData();
        if ((_DWORD)v13)
        {
          v6 = v13;
          AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kImg4Tag_DGST) failed.");
        }
        else
        {
          if (*(_BYTE *)(a4 + 400))
          {
            if (**(_QWORD **)(*(_QWORD *)(a4 + 2008) + 32) == v40)
            {
              if (!memcmp(v39, (const void *)(a4 + 584), v40))
                return 0;
              v27 = "%s: propertyValue != fdrDecode->sealingManifestImg4.payload.hash";
            }
            else
            {
              v27 = "%s: propertyLength != implementation->digestInfo->digestOutputSize";
            }
          }
          else
          {
            v27 = "%s: fdrDecode->sealingManifestImg4.payload_hashed is false";
          }
          v6 = 3;
          AMFDRDecodeLogInternal(3, v27, "_AMFDRDecodeVerifyDataCallback");
        }
LABEL_93:
        v10 = *(_QWORD *)a4 | 0x8000;
        goto LABEL_94;
      }
      v17 = "%s: verifying subCC, skip comparing digest of the entire data";
    }
    else
    {
      if (a1 != 1396917319)
        goto LABEL_37;
      v7 = Img4DecodeGetPropertyData();
      if ((_DWORD)v7)
      {
        v6 = v7;
        AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_SCDG) failed.");
        goto LABEL_93;
      }
      v23 = v40;
      *(_QWORD *)(a4 + 360) = v39;
      *(_QWORD *)(a4 + 368) = v23;
      if ((*(_BYTE *)(a4 + 2017) & 0x10) != 0)
      {
        if (*(_QWORD *)(a4 + 128))
        {
          v28 = *(unsigned int **)(a4 + 120);
          if (v28)
          {
            __s1 = 0;
            __n = 0;
            v29 = AMFDRTagsStringToTag(v28);
            if (_AMFDRDecodeSearchEntryFromPropertyList(*(_QWORD *)(a4 + 360), *(_QWORD *)(a4 + 368), v29, &__s1))
            {
              v6 = 0;
              AMFDRDecodeLogInternal(3, "%s: failed to find subCC digest");
            }
            else if (*(_BYTE *)(a4 + 400))
            {
              if (__n == **(_QWORD **)(*(_QWORD *)(a4 + 2008) + 32))
              {
                if (!memcmp(__s1, (const void *)(a4 + 584), __n))
                {
                  AMFDRDecodeLogInternal(5, "%s: subCC digest verified", "_AMFDRDecodeVerifyDataCallback");
                  v6 = 0;
                  *(_BYTE *)(a4 + 376) = 1;
                  return v6;
                }
                v6 = 3;
                AMFDRDecodeLogInternal(3, "%s: subCC digest mismatch");
              }
              else
              {
                v6 = 3;
                AMFDRDecodeLogInternal(3, "%s: subCC digest length mismatch");
              }
            }
            else
            {
              v6 = 3;
              AMFDRDecodeLogInternal(3, "%s: subCC is not hashed");
            }
            v10 = *(_QWORD *)a4 | 0x1000000000000000;
            goto LABEL_94;
          }
        }
        *(_QWORD *)a4 |= 0x1000000000000000uLL;
        v17 = "%s: subCCName cannot be NULL when kAMFDRDecodeOptionSubCCOnly is set.";
        goto LABEL_97;
      }
      v17 = "%s: not verifying subCC payload, skip checking subCC digest";
    }
    v18 = 5;
    goto LABEL_51;
  }
  if (a1 <= 1717660002)
  {
    if (a1 == 1634953572)
    {
      v14 = Img4DecodeGetPropertyData();
      if ((_DWORD)v14)
      {
        v6 = v14;
        AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_asid) failed.");
        goto LABEL_36;
      }
      v24 = *(_QWORD *)(a4 + 224);
      if (v24)
      {
        if (v24 == v40)
        {
          v25 = *(const void **)(a4 + 216);
          if (v25 && !memcmp(v25, v39, v24))
            return 0;
          v26 = "%s: kFDRTag_asid property != fdrDecode->assemblyID";
        }
        else
        {
          v26 = "%s: kFDRTag_asid property length != fdrDecode->assemblyID.length";
        }
        v6 = 3;
        AMFDRDecodeLogInternal(3, v26, "_AMFDRDecodeVerifyDataCallback");
        v10 = *(_QWORD *)a4 | 0x200000000000000;
        goto LABEL_94;
      }
      v17 = "%s: Skip verifying assembly identifier";
      goto LABEL_42;
    }
    if (a1 == 1668047219)
    {
      if (Img4DecodeGetPropertyData())
      {
        v8 = "%s: Img4DecodeGetPropertyData(kFDRTag_clas) failed.";
      }
      else
      {
        v33 = v40;
        v8 = "%s: propertyValue must be non NULL with a non-zero length (length=%u)";
      }
      v6 = 3;
      AMFDRDecodeLogInternal(3, v8, "_AMFDRDecodeVerifyDataCallback", v33);
      v10 = *(_QWORD *)a4 | 0x400;
      goto LABEL_94;
    }
LABEL_37:
    v15 = 1;
    while (v15 != 48)
    {
      v16 = kFDRKnownTag[v15++];
      if (v16 == a1)
      {
        if ((unint64_t)(v15 - 2) < 0x2F)
          return 0;
        break;
      }
    }
    v35 = ((__int16)a1 >> 8);
    v36 = (char)a1;
    v33 = (a1 >> 24);
    v34 = (a1 << 8 >> 24);
    v17 = "%s: Unsupported tag found in manifest '%c%c%c%c'";
LABEL_42:
    v18 = 7;
LABEL_51:
    AMFDRDecodeLogInternal(v18, v17, "_AMFDRDecodeVerifyDataCallback", v33, v34, v35, v36);
    return 0;
  }
  if (a1 == 1717660003)
  {
    LOBYTE(__s1) = 0;
    if (!Img4DecodeGetPropertyBoolean())
    {
      v6 = 0;
      *(_BYTE *)(a4 + 2004) = (_BYTE)__s1;
      return v6;
    }
    v6 = 3;
    AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_faic) failed.", "_AMFDRDecodeVerifyDataCallback");
    v10 = *(_QWORD *)a4 | 0x400000000;
LABEL_94:
    *(_QWORD *)a4 = v10;
    return v6;
  }
  if (a1 != 1768846196)
  {
    if (a1 == 1886546276)
    {
      v5 = Img4DecodeGetPropertyData();
      if ((_DWORD)v5)
      {
        v6 = v5;
        AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_prid) failed.");
LABEL_36:
        v10 = *(_QWORD *)a4 | 0x2000;
        goto LABEL_94;
      }
      v19 = v39;
      v20 = v40;
      *(_QWORD *)(a4 + 200) = v39;
      *(_QWORD *)(a4 + 208) = v20;
      if (!*(_QWORD *)(a4 + 1944) || !*(_QWORD *)(a4 + 1952))
      {
        AMFDRDecodeLogInternal(4, "%s: Skipping revocation check (trustobject unset)", "_AMFDRDecodeVerifyDataCallback");
        v6 = 0;
        v10 = *(_QWORD *)a4 | 0x200000;
        goto LABEL_94;
      }
      v21 = AMFDRDecodeCheckProducerIDRevocation(a4 + 1768, (uint64_t)v19, v20);
      if (v21)
      {
        v22 = v21;
        v6 = 3;
        AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeCheckProducerIDRevocation failed with error 0x%016llX", "_AMFDRDecodeVerifyDataCallback", v21);
        v10 = *(_QWORD *)a4 | v22;
        goto LABEL_94;
      }
      return 0;
    }
    goto LABEL_37;
  }
  v12 = Img4DecodeGetPropertyData();
  if ((_DWORD)v12)
  {
    v6 = v12;
    AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_inst) failed.", "_AMFDRDecodeVerifyDataCallback");
LABEL_30:
    v10 = *(_QWORD *)a4 | 0x4000;
    goto LABEL_94;
  }
  if (a3 == 1)
  {
    v30 = *(void **)(a4 + 104);
    if (v30)
    {
      v31 = *(_QWORD *)(a4 + 112);
      if (v31)
      {
        if ((_AMFDRDecodeInstPropertyMatchingWithType(v39, v40, v30, v31, *(const void **)(a4 + 184), *(_QWORD *)(a4 + 192), 1, (_QWORD *)a4) & 1) != 0)return 0;
        AMFDRDecodeLogInternal(3, "%s: kFDRTag_inst property != fdrDecode->uniqueID");
        goto LABEL_85;
      }
    }
    if ((*(_BYTE *)(a4 + 2017) & 0x20) == 0)
    {
      AMFDRDecodeLogInternal(3, "%s: no uniqueID is specified, cannot verify kFDRTag_inst property");
LABEL_85:
      v6 = 0;
      goto LABEL_30;
    }
    v17 = "%s: no uniqueID is specified, but this is allowed, skip comparing kFDRTag_inst object property";
LABEL_97:
    v18 = 3;
    goto LABEL_51;
  }
  if (a3)
    return 0;
  v6 = 0;
  if ((_AMFDRDecodeInstPropertyMatchingWithType(v39, v40, *(void **)(a4 + 136), *(_QWORD *)(a4 + 144), *(const void **)(a4 + 168), *(_QWORD *)(a4 + 176), 0, (_QWORD *)a4) & 1) == 0)
  {
    AMFDRDecodeLogInternal(3, "%s: kFDRTag_inst property != fdrDecode->manifestUniqueID", "_AMFDRDecodeVerifyDataCallback");
    v6 = 0;
    v10 = *(_QWORD *)a4 | 0x40000000;
    goto LABEL_94;
  }
  return v6;
}

uint64_t _AMFDRDecodeGetExpectedManifestHash(uint64_t a1, uint64_t a2)
{
  if (a2)
    return *(_QWORD *)(a2 + 2024);
  AMFDRDecodeLogInternal(3, "%s: fdrDecode is NULL", "_AMFDRDecodeGetExpectedManifestHash");
  return 0;
}

uint64_t _AMFDRDecodePropertiesFilterCallback(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  int v6;
  unint64_t *v7;
  uint64_t PropertyInSequence;
  uint64_t v9;
  char v10;
  uint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;

  v19 = (unint64_t *)a5;
  v20 = 0xAAAAAAAAAAAA0000;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  v18 = 0xAAAAAAAAAAAAAAAALL;
  if (!a5)
  {
    AMFDRDecodeLogInternal(3, "%s: fdrDecode is NULL");
    return 6;
  }
  if (*(_QWORD *)(a5 + 104) && *(_QWORD *)(a5 + 112))
  {
    v6 = 0;
    goto LABEL_7;
  }
  if ((*(_BYTE *)(a5 + 2017) & 0x20) == 0)
  {
    AMFDRDecodeLogInternal(3, "%s: data instance cannot be missing without kAMFDRDecodeOptionAllowNoDataInstance specified");
    return 6;
  }
  v6 = 1;
LABEL_7:
  v7 = DERDecodeSeqContentInit(a1, &v17);
  if ((_DWORD)v7)
  {
    v9 = (uint64_t)v7;
    v15 = "%s: can't parse top-level container";
    goto LABEL_34;
  }
  while (1)
  {
    if ((_BYTE)v20)
      goto LABEL_25;
    PropertyInSequence = DERImg4DecodeFindPropertyInSequence();
    if ((_DWORD)PropertyInSequence == 1)
    {
      if (BYTE1(v20))
        AMFDRDecodeLogInternal(3, "%s: failed to find matching inst object propery, returning a mismatched one", "_AMFDRDecodePropertiesFilterCallback");
      if ((_BYTE)v20)
      {
        if (!v6)
          return 0;
      }
      else
      {
        *v19 |= 0x4000uLL;
LABEL_25:
        if ((v6 & 1) == 0)
          return 0;
      }
      AMFDRDecodeLogInternal(3, "%s: uniqueID is not specified, which is allowed, skip uniqueID mismatch errors", "_AMFDRDecodePropertiesFilterCallback");
      v9 = 0;
      v12 = v19;
      v13 = *v19 & 0xFFFFFFFFFFFFBFFFLL;
      goto LABEL_27;
    }
    v9 = PropertyInSequence;
    if ((_DWORD)PropertyInSequence)
      break;
    if (BYTE1(v20))
      v10 = v6;
    else
      v10 = 0;
    if ((v10 & 1) != 0)
    {
      AMFDRDecodeLogInternal(3, "%s: multiple entries for tag 0x%llu found, but no unique ID specified", "_AMFDRDecodePropertiesFilterCallback", a2);
      if ((_BYTE)v20)
        return 0;
      v9 = 0;
      v12 = v19;
      v13 = *v19 | 0x4000;
LABEL_27:
      *v12 = v13;
      return v9;
    }
    v11 = Img4DecodeEvaluateDictionaryProperties();
    if ((_DWORD)v11)
    {
      v9 = v11;
      AMFDRDecodeLogInternal(5, "%s: failed to find corresponding data instance");
      return v9;
    }
  }
  v16 = a2;
  v15 = "%s: failed to find property tag 0x%llu";
LABEL_34:
  AMFDRDecodeLogInternal(3, v15, "_AMFDRDecodePropertiesFilterCallback", v16, v17, v18);
  return v9;
}

uint64_t AMFDRDecodeTrustObject(unint64_t a1, uint64_t a2, unsigned int a3)
{
  _QWORD v5[2];

  v5[0] = a2;
  v5[1] = a3;
  if (DERParseSequenceToObject((uint64_t)v5, 5u, (uint64_t)&DERFDRTrustObjectItemSpecs, a1, 0x90uLL, 0))
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object Format");
  }
  else if (*(_QWORD *)a1 && *(_QWORD *)(a1 + 8) == 4)
  {
    if (**(_DWORD **)a1 == *(_DWORD *)"secb")
      return 0;
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object, expected tag %c%c%c%c found tag %c%c%c%c", "AMFDRDecodeTrustObject", kFDRTagStr_secb[0], kFDRTagStr_secb[1]);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object, invalid tag length");
  }
  return 0x400000;
}

uint64_t AMFDRDecodeLogInternal(uint64_t a1, char *__format, ...)
{
  __int128 v3;
  char __str[16];
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
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  va_list va;

  va_start(va, __format);
  v21 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19 = v3;
  v20 = v3;
  v17 = v3;
  v18 = v3;
  v15 = v3;
  v16 = v3;
  v13 = v3;
  v14 = v3;
  v11 = v3;
  v12 = v3;
  v9 = v3;
  v10 = v3;
  v7 = v3;
  v8 = v3;
  *(_OWORD *)__str = v3;
  v6 = v3;
  vsnprintf(__str, 0x100uLL, __format, va);
  if (_logHandler)
    return _logHandler(a1, __str);
  else
    return AMSupportLogFormat();
}

uint64_t AMFDRDecodeIterateTrustObjectTrustedBegin(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  _DWORD *v4;
  uint64_t v5;

  if (!a1)
    return 1;
  v3 = 0;
  v4 = 0;
  v1 = (unint64_t *)(a1 + 64);
  v5 = 0;
  if (DERDecodeSeqContentInit((unint64_t *)(a1 + 16), (unint64_t *)(a1 + 64)))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object trusted sequence");
  }
  else if (DERDecodeSeqNext(v1, &v3))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object trusted");
  }
  else if (v4 && v5 == 4)
  {
    if (*v4 == *(_DWORD *)"trst")
      return 0;
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object trusted, expected tag %c%c%c%c found tag %c%c%c%c", "AMFDRDecodeIterateTrustObjectTrustedBegin", kFDRTagStr_trst[0], kFDRTagStr_trst[1]);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object trusted, invalid trusted tag length");
  }
  return 0x400000;
}

uint64_t AMFDRDecodeIterateTrustObjectTrustedNext(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = 1;
  if (a1 && a2 && a3)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v7 = DERDecodeSeqNext((unint64_t *)(a1 + 64), &v10);
    if (v7)
    {
      if (v7 != 1)
        return 0x400000;
      v9 = 0;
      v8 = 0;
    }
    else
    {
      v8 = v11;
      v9 = v12;
    }
    result = 0;
    *a2 = v8;
    *a3 = v9;
  }
  return result;
}

uint64_t AMFDRDecodeIterateTrustObjectTrustedKeyBegin(uint64_t a1)
{
  unint64_t *v1;
  int v3;
  unint64_t v4;
  _DWORD *v5;
  uint64_t v6;

  if (!a1)
    return 1;
  v4 = 0;
  v5 = 0;
  v1 = (unint64_t *)(a1 + 128);
  v6 = 0;
  if (DERDecodeSeqContentInit((unint64_t *)(a1 + 112), (unint64_t *)(a1 + 128)))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object trusted key sequence");
  }
  else
  {
    v3 = DERDecodeSeqNext(v1, &v4);
    if (v3)
    {
      if (v3 == 1)
        return 0x40000000000000;
      AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object trusted key: %d");
    }
    else if (v5 && v6 == 4)
    {
      if (*v5 == *(_DWORD *)"trpk")
        return 0;
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object trusted key, expected tag %c%c%c%c found tag %c%c%c%c", "AMFDRDecodeIterateTrustObjectTrustedKeyBegin", kFDRTagStr_trpk[0], kFDRTagStr_trpk[1]);
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object trusted key, invalid trusted key tag length");
    }
  }
  return 0x400000;
}

uint64_t AMFDRDecodeIterateTrustObjectTrustedKeyNext(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = 1;
  if (a1 && a2 && a3)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v7 = DERDecodeSeqNext((unint64_t *)(a1 + 128), &v10);
    if (v7)
    {
      if (v7 != 1)
        return 0x400000;
      v9 = 0;
      v8 = 0;
    }
    else
    {
      v8 = v11;
      v9 = v12;
    }
    result = 0;
    *a2 = v8;
    *a3 = v9;
  }
  return result;
}

uint64_t AMFDRDecodeIterateTrustObjectRevokedBegin(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  _DWORD *v4;
  uint64_t v5;

  if (!a1)
    return 1;
  v3 = 0;
  v4 = 0;
  v1 = (unint64_t *)(a1 + 80);
  v5 = 0;
  if (DERDecodeSeqContentInit((unint64_t *)(a1 + 48), (unint64_t *)(a1 + 80)))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object Revoked sequence");
  }
  else if (DERDecodeSeqNext(v1, &v3))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object Revoked");
  }
  else if (v4 && v5 == 4)
  {
    if (*v4 == *(_DWORD *)"rvok")
      return 0;
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object Revoked, expected tag %c%c%c%c found tag %c%c%c%c", "AMFDRDecodeIterateTrustObjectRevokedBegin", kFDRTagStr_rvok[0], kFDRTagStr_rvok[1]);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object Revoked, invalid trusted tag length");
  }
  return 0x400000;
}

uint64_t AMFDRDecodeIterateTrustObjectRevokedNext(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;
  int v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = 1;
  if (a1 && a2 && a3)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v7 = DERDecodeSeqNext((unint64_t *)(a1 + 80), &v10);
    if (v7)
    {
      if (v7 == 1)
      {
        v8 = 0;
        v9 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      v8 = v12;
      if (v12 == 32)
      {
        v9 = v11;
LABEL_9:
        result = 0;
        *a2 = v9;
        *a3 = v8;
        return result;
      }
    }
    return 0x400000;
  }
  return result;
}

uint64_t AMFDRDecodeIterateTrustObjectSslRootBegin(uint64_t a1)
{
  unint64_t *v1;
  unint64_t v3;
  _DWORD *v4;
  uint64_t v5;

  if (!a1)
    return 1;
  v3 = 0;
  v4 = 0;
  v1 = (unint64_t *)(a1 + 96);
  v5 = 0;
  if (DERDecodeSeqContentInit((unint64_t *)(a1 + 32), (unint64_t *)(a1 + 96)))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object SslRoot sequence");
  }
  else if (DERDecodeSeqNext(v1, &v3))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Trust Object SslRoot");
  }
  else if (v4 && v5 == 4)
  {
    if (*v4 == *(_DWORD *)"rssl")
      return 0;
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object SslRoot, expected tag %c%c%c%c found tag %c%c%c%c", "AMFDRDecodeIterateTrustObjectSslRootBegin", kFDRTagStr_rssl[0], kFDRTagStr_rssl[1]);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object SslRoot, invalid trusted tag length");
  }
  return 0x400000;
}

uint64_t AMFDRDecodeIterateTrustObjectSslRootNext(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;
  int v7;
  int v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = 1;
  if (a1 && a2 && a3)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v7 = DERDecodeSeqNext((unint64_t *)(a1 + 96), &v10);
    if (v7)
    {
      if (v7 == 1)
      {
        v8 = 0;
        v9 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      v8 = v12;
      if (v12)
      {
        v9 = v11;
LABEL_9:
        result = 0;
        *a2 = v9;
        *a3 = v8;
        return result;
      }
    }
    return 0x400000;
  }
  return result;
}

uint64_t AMFDRDecodeIterateProducerIDBegin(_QWORD *a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  unint64_t v5;
  _QWORD v6[2];

  result = 1;
  if (a1 && a2 && a3)
  {
    v5 = 0xAAAAAAAAAAAAAAAALL;
    v6[0] = a2;
    v6[1] = a3;
    if (DERDecodeSeqInit((uint64_t)v6, &v5, a1))
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse FDR Producer ID sequence", "AMFDRDecodeIterateProducerIDBegin");
      return 0x80000000000;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t AMFDRDecodeIterateProducerIDNext(unint64_t *a1, _QWORD *a2, _DWORD *a3)
{
  uint64_t result;
  int v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  result = 1;
  if (a1 && a2 && a3)
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v7 = DERDecodeSeqNext(a1, &v10);
    if (v7)
    {
      if (v7 != 1)
        return 0x80000000000;
      v9 = 0;
      v8 = 0;
    }
    else
    {
      v8 = v11;
      v9 = v12;
    }
    result = 0;
    *a2 = v8;
    *a3 = v9;
  }
  return result;
}

uint64_t AMFDRDecodeCheckProducerIDRevocation(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v7;
  int v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  void *__s2;
  unsigned int __n;
  unint64_t __n_4[2];
  unint64_t v17;
  const void *v18;
  uint64_t v19;

  __n_4[0] = 0xAAAAAAAAAAAAAAAALL;
  __n_4[1] = 0xAAAAAAAAAAAAAAAALL;
  v3 = 1;
  if (!a1 || !a2 || !a3)
    return v3;
  AMFDRDecodeLogInternal(7, "%s: AMFDRDecodeCheckProducerIDRevocation", "AMFDRDecodeCheckProducerIDRevocation");
  v7 = AMFDRDecodeIterateProducerIDBegin(__n_4, a2, a3);
  if (v7)
  {
    v3 = v7;
    AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateProducerIDBegin failed with error 0x%016llX");
    return v3;
  }
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v8 = DERDecodeSeqNext(__n_4, &v17);
  if (v8)
  {
    if (v8 != 1)
    {
      v3 = 0x80000000000;
      AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateProducerIDNext(first) failed with error 0x%016llX");
      return v3;
    }
    return 0;
  }
  v9 = v18;
  if (!v18)
    return 0;
  while (2)
  {
    __n = 0;
    __s2 = 0;
    v10 = AMFDRDecodeIterateTrustObjectRevokedBegin(a1);
    if (v10)
    {
      v3 = v10;
      AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateTrustObjectRevokedBegin failed");
      return v3;
    }
    while (1)
    {
      v11 = AMFDRDecodeIterateTrustObjectRevokedNext(a1, &__s2, &__n);
      if (v11)
      {
        v3 = v11;
        AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateTrustObjectRevokedNext failed");
        return v3;
      }
      if (!__s2)
        break;
      if (!memcmp(v9, __s2, __n))
      {
        AMFDRDecodeLogInternal(3, "%s: FDR Trust Object revoked certificate found", "AMFDRDecodeCheckProducerIDRevocation");
        return 0x10000000000;
      }
    }
    v17 = 0;
    v18 = 0;
    v19 = 0;
    v12 = DERDecodeSeqNext(__n_4, &v17);
    if (v12)
    {
      if (v12 != 1)
      {
        v3 = 0x80000000000;
        AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateProducerIDNext(loop) failed with error 0x%016llX");
        return v3;
      }
      return 0;
    }
    v3 = 0;
    v9 = v18;
    if (v18)
      continue;
    break;
  }
  return v3;
}

uint64_t AMFDRDecodeVerifySealingManifest(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10)
{
  unsigned int *v18;
  unsigned int *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v25;
  char v26;
  unint64_t v27;
  uint64_t (*v28)(unint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, unsigned int, _QWORD, unsigned int, _QWORD);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  unint64_t v33[8];
  __int128 v34;
  _BYTE v35[32];

  v18 = (unsigned int *)malloc(0x7F8uLL);
  if (!v18)
  {
    AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeVerifySealingManifest");
    return 0x80000000000002;
  }
  v19 = v18;
  bzero(v18, 0x7F8uLL);
  *((_QWORD *)v19 + 5) = a1;
  *((_QWORD *)v19 + 6) = a2;
  *((_QWORD *)v19 + 243) = a3;
  *((_QWORD *)v19 + 244) = a4;
  *((_QWORD *)v19 + 9) = a5;
  *((_QWORD *)v19 + 10) = a6;
  *((_QWORD *)v19 + 17) = a7;
  *((_QWORD *)v19 + 18) = a8;
  *((_QWORD *)v19 + 48) = a9;
  *((_QWORD *)v19 + 49) = a10;
  *((_QWORD *)v19 + 251) = kAMFDRDecodeImplementationSha1;
  *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v35 = v20;
  *(_OWORD *)&v35[16] = v20;
  v34 = v20;
  memset(v33, 170, sizeof(v33));
  v32 = 0;
  v30 = 0;
  v31 = 0;
  v21 = _AMFDRDecodeVerifyTrustObject((uint64_t)v19);
  if (v21)
    *(_QWORD *)v19 |= v21;
  if (*((_QWORD *)v19 + 5) && *((_QWORD *)v19 + 6))
  {
    if (Img4DecodeInitManifest())
    {
      AMFDRDecodeLogInternal(3, "%s: could not parse sealing manifest");
    }
    else
    {
      if (!DERImg4DecodeManifest())
      {
        if ((**((unsigned int (***)(_QWORD, _QWORD, uint64_t, _QWORD))v19 + 251))(*((_QWORD *)v19 + 140), *((_QWORD *)v19 + 141), (uint64_t)(v19 + 308), **(_QWORD **)(*((_QWORD *)v19 + 251) + 32)))
        {
          AMFDRDecodeLogInternal(3, "%s: AMSupportDigestSha1 failed");
        }
        else if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t *, uint64_t *, unsigned int *, unsigned int *))(*((_QWORD *)v19 + 251) + 8))(*((_QWORD *)v19 + 144), *((_QWORD *)v19 + 145), &v30, &v31, v19 + 292, v19 + 294))
        {
          AMFDRDecodeLogInternal(3, "%s: %s: certificate chain validation failed");
        }
        else if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, unsigned int *, _QWORD))(*((_QWORD *)v19 + 251) + 16))(v30, v31, *((_QWORD *)v19 + 142), *((_QWORD *)v19 + 143), v19 + 308, **(_QWORD **)(*((_QWORD *)v19 + 251) + 32)))
        {
          AMFDRDecodeLogInternal(3, "%s: %s: signature validation failed");
        }
        else if (DERParseInteger((char **)v19 + 138, &v32))
        {
          AMFDRDecodeLogInternal(3, "%s: malformed Img4 Manifest (version parse fail)");
        }
        else if (DERDecodeItem((uint64_t)(v19 + 280), &v33[5]))
        {
          AMFDRDecodeLogInternal(3, "%s: failed to decode the signed section");
        }
        else if (v33[5] == 0x2000000000000011)
        {
          if (DERImg4DecodeFindProperty())
          {
            AMFDRDecodeLogInternal(3, "%s: failed to find MANB (manifest body) tag");
          }
          else
          {
            *((_OWORD *)v19 + 56) = *(_OWORD *)&v35[8];
            if (DERImg4DecodeFindProperty())
            {
              AMFDRDecodeLogInternal(3, "%s: failed to find MANP (manifest payload) tag");
            }
            else
            {
              *((_OWORD *)v19 + 57) = *(_OWORD *)&v35[8];
              if (Img4DecodeEvaluateManifestProperties())
              {
                AMFDRDecodeLogInternal(3, "%s: Img4DecodeEvaluateManifestProperties failed");
              }
              else if (DERDecodeSeqContentInit((unint64_t *)v19 + 112, v33)
                     || (v25 = DERDecodeSeqNext(v33, &v33[2])) != 0)
              {
LABEL_38:
                AMFDRDecodeLogInternal(3, "%s: can't parse top-level container");
              }
              else
              {
                v26 = 0;
                while (!v25)
                {
                  v27 = v33[2];
                  if (LODWORD(v33[2]) != 1296125520)
                  {
                    if (DERImg4DecodeFindProperty())
                    {
                      AMFDRDecodeLogInternal(3, "%s: failed to find object properties");
                      goto LABEL_14;
                    }
                    *((_OWORD *)v19 + 58) = *(_OWORD *)&v35[8];
                    if ((*(unsigned int (**)(unsigned int *, unsigned int *))(*((_QWORD *)v19 + 251) + 24))(v19 + 214, v19))
                    {
                      AMFDRDecodeLogInternal(3, "%s: evaluateCertificateProperties failed");
                      goto LABEL_14;
                    }
                    if (Img4DecodeEvaluateObjectProperties())
                    {
                      AMFDRDecodeLogInternal(3, "%s: Img4DecodeEvaluateObjectProperties failed");
                      goto LABEL_14;
                    }
                    v28 = (uint64_t (*)(unint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, unsigned int, _QWORD, unsigned int, _QWORD))*((_QWORD *)v19 + 48);
                    if (v28)
                    {
                      v29 = v28(v27, *((_QWORD *)v19 + 17), v19[36], *((_QWORD *)v19 + 25), v19[52], *((_QWORD *)v19 + 245), v19[492], *((_QWORD *)v19 + 247), v19[496], *((_QWORD *)v19 + 249), v19[500], *((_QWORD *)v19 + 49));
                      if (v29)
                      {
                        AMFDRDecodeLogInternal(3, "%s: sealingManifestCallback failed with error 0x%llX", "_AMFDRDecodeVerifySealingManifestInternal", v29);
                        v23 = *(_QWORD *)v19 | 0x400000000;
                        goto LABEL_15;
                      }
                    }
                    v26 = 1;
                  }
                  v25 = DERDecodeSeqNext(v33, &v33[2]);
                  if (v25 >= 2)
                    goto LABEL_38;
                }
                if ((v26 & 1) != 0)
                {
                  v23 = *(_QWORD *)v19;
                  goto LABEL_15;
                }
                AMFDRDecodeLogInternal(3, "%s: No manifest found - not evaluated.");
              }
            }
          }
        }
        else
        {
          AMFDRDecodeLogInternal(3, "%s: signed section has an unexpected tag");
        }
        goto LABEL_14;
      }
      AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest failed to decode sealing manifest");
    }
    v22 = *(_QWORD *)v19 | 0x2000000;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest is missing", "_AMFDRDecodeVerifySealingManifestInternal");
    v22 = *(_QWORD *)v19 | 0x1000000;
  }
  *(_QWORD *)v19 = v22;
LABEL_14:
  AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest failed to decode sequence", "_AMFDRDecodeVerifySealingManifestInternal");
  v23 = *(_QWORD *)v19 | 0x2000000;
LABEL_15:
  free(v19);
  return v23;
}

uint64_t AMFDRDecodeVerifySealingRequest(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, _BYTE *a9, _QWORD *a10, _DWORD *a11)
{
  uint64_t *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _DWORD *v25;
  _QWORD *v26;

  v19 = (uint64_t *)malloc(0x7F8uLL);
  if (v19)
  {
    v20 = v19;
    bzero(v19, 0x7F8uLL);
    if (a10)
      v21 = a11 == 0;
    else
      v21 = 1;
    if (v21)
    {
      AMFDRDecodeLogInternal(3, "%s: outRawData must be non NULL and outRawDataLength must be non 0", "AMFDRDecodeVerifySealingRequest");
      v22 = 1;
LABEL_18:
      free(v20);
      return v22;
    }
    v20[7] = a1;
    v20[8] = a2;
    v20[243] = a3;
    v20[244] = a4;
    v20[9] = a5;
    v20[10] = a6;
    v20[17] = a7;
    v20[18] = a8;
    v20[251] = (uint64_t)kAMFDRDecodeImplementationTestStationSha1;
    v23 = _AMFDRDecodeVerifyTrustObject((uint64_t)v20);
    if (v23)
    {
      v24 = v23;
      AMFDRDecodeLogInternal(3, "%s: _AMFDRDecodeVerifyTrustObject failed (%llu), continuing.", "_AMFDRDecodeVerifySealingRequestInternal", v23);
      *v20 |= v24;
    }
    if (v20[7] && v20[8])
    {
      if (!Img4DecodeInit())
      {
        if (Img4DecodePerformTrustEvaluatation())
        {
          AMFDRDecodeLogInternal(3, "%s: FDR Sealing Request trust evaluation failed.", "_AMFDRDecodeVerifySealingRequestInternal");
          v22 = *v20;
          v26 = a10;
          v25 = a11;
          if (!*v20)
          {
            v22 = 0x100000000000;
            *v20 = 0x100000000000;
          }
        }
        else
        {
          v22 = *v20;
          v26 = a10;
          v25 = a11;
        }
        v20[241] = v20[181];
        v20[242] = v20[182];
        goto LABEL_17;
      }
      AMFDRDecodeLogInternal(3, "%s: FDR Sealing Request failed to decode img4", "_AMFDRDecodeVerifySealingRequestInternal");
      v22 = *v20 | 0x200000000;
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: FDR Sealing Request is missing", "_AMFDRDecodeVerifySealingRequestInternal");
      v22 = *v20 | 0x100000000;
    }
    *v20 = v22;
    v26 = a10;
    v25 = a11;
LABEL_17:
    *v26 = v20[241];
    *v25 = v20[242];
    *a9 = *((_BYTE *)v20 + 2004);
    goto LABEL_18;
  }
  AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeVerifySealingRequest");
  return 0x80000000000002;
}

uint64_t AMFDRDecodeSealingRequest(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, const void *a7, unsigned int a8, uint64_t a9, uint64_t a10)
{
  uint64_t v16;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20[5];
  _QWORD v21[2];
  unint64_t v22;
  unint64_t v23[5];
  unint64_t v24[4];

  memset(v24, 170, 24);
  memset(v23, 170, sizeof(v23));
  memset(v20, 170, sizeof(v20));
  v21[0] = a1;
  v21[1] = a2;
  if (a1 && a2)
  {
    v22 = 0xAAAAAAAAAAAAAAAALL;
    if (DERDecodeSeqInit((uint64_t)v21, &v22, v23))
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse sealing manifest top-level container");
      return 0x400000000;
    }
    if (v22 != 0x2000000000000010)
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse sealing manifest top-level container. Expected tag %llu, found %llu");
      return 0x400000000;
    }
    if (DERDecodeSeqNext(v23, v24))
    {
      AMFDRDecodeLogInternal(3, "%s: failed to decode sealing manifest tag");
      return 0x400000000;
    }
    if (v24[0] != 22)
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse sealing manifest tag. Expected tag %d, found %llu");
      return 0x400000000;
    }
    if (v24[2] != a8)
    {
      AMFDRDecodeLogInternal(3, "%s: uniqueIDInfo.content.length != uniqueIDLength");
      return 0x2000000000;
    }
    if (memcmp((const void *)v24[1], a7, v24[2]))
    {
      AMFDRDecodeLogInternal(3, "%s: memcmp( uniqueIDInfo.content.data, uniqueID, uniqueIDLength) != 0");
      return 0x2000000000;
    }
    v18 = DERDecodeSeqNext(v23, &v23[2]);
    if (v18)
    {
      AMFDRDecodeLogInternal(3, "%s: failed to decode sealing manifest body");
      return 0x400000000;
    }
    while (1)
    {
      if (v18)
        return 0;
      if (DERDecodeItem((uint64_t)&v23[3], (unint64_t *)&v20[2]))
      {
        AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest failed to decode sequence", "AMFDRDecodeSealingRequest");
        return 0x2000000;
      }
      if (_AMFDRDecodeDERFDRItem((unint64_t *)&v20[3], v20))
      {
        AMFDRDecodeLogInternal(3, "%s: can't parse sealing manifest contents classItem");
        return 0x400000000;
      }
      v19 = AMFDRDecodeVerifyTestStationManifest(v20[0], v20[1], a3, a4, a5, a6, (uint64_t)a7, a8, a9, a10);
      if (v19)
        break;
      v18 = DERDecodeSeqNext(v23, &v23[2]);
      if (v18 >= 2)
      {
        AMFDRDecodeLogInternal(3, "%s: Failed decoding next item in sealing manifest contents");
        return 0x400000000;
      }
    }
    v16 = v19;
    AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeVerifySealingManifest 0x%016llX", "AMFDRDecodeSealingRequest", v19);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: Sealing manifest is NULL or 0 length", "AMFDRDecodeSealingRequest");
    return 0x100000000;
  }
  return v16;
}

uint64_t _AMFDRDecodeDERFDRItem(unint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  BOOL v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  if (DERParseSequenceContentToObject(a1, 2u, (uint64_t)&DERFDRItemSpecs, (unint64_t)&v6, 0x20uLL, 0))
  {
    AMFDRDecodeLogInternal(3, "%s: malformed DERFDRItem", "_AMFDRDecodeDERFDRItem");
    return 16;
  }
  else
  {
    if ((_QWORD)v6)
      v4 = *((_QWORD *)&v6 + 1) == 4;
    else
      v4 = 0;
    if (v4)
    {
      if (*(_DWORD *)v6 == *MEMORY[0x24BEDA2B8])
      {
        result = 0;
        v5 = *((_QWORD *)&v7 + 1);
        *a2 = v7;
        a2[1] = v5;
      }
      else
      {
        AMFDRDecodeLogInternal(3, "%s: malformed DERFDRItem, expected tag %c%c%c%c found tag %c%c%c%c", "_AMFDRDecodeDERFDRItem", *MEMORY[0x24BEDA2B8], *(unsigned __int8 *)(MEMORY[0x24BEDA2B8] + 1), *(unsigned __int8 *)(MEMORY[0x24BEDA2B8] + 2), *(unsigned __int8 *)(MEMORY[0x24BEDA2B8] + 3), *(unsigned __int8 *)v6, *(unsigned __int8 *)(v6 + 1), *(unsigned __int8 *)(v6 + 2), *(unsigned __int8 *)(v6 + 3));
        return 64;
      }
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: malformed DERFDRItem, invalid tag length", "_AMFDRDecodeDERFDRItem");
      return 32;
    }
  }
  return result;
}

uint64_t AMFDRDecodeVerifyTestStationManifest(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, uint64_t a10)
{
  unsigned int *v18;
  unsigned int *v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v25;
  char v26;
  unint64_t v27;
  uint64_t (*v28)(unint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, unsigned int, _QWORD, unsigned int, _QWORD);
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33[8];
  __int128 v34;
  _BYTE v35[32];

  v18 = (unsigned int *)malloc(0x7F8uLL);
  if (!v18)
  {
    AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeVerifyTestStationManifest");
    return 0x80000000000002;
  }
  v19 = v18;
  bzero(v18, 0x7F8uLL);
  *((_QWORD *)v19 + 5) = a1;
  *((_QWORD *)v19 + 6) = a2;
  *((_QWORD *)v19 + 243) = a3;
  *((_QWORD *)v19 + 244) = a4;
  *((_QWORD *)v19 + 9) = a5;
  *((_QWORD *)v19 + 10) = a6;
  *((_QWORD *)v19 + 17) = a7;
  *((_QWORD *)v19 + 18) = a8;
  *((_QWORD *)v19 + 48) = a9;
  *((_QWORD *)v19 + 49) = a10;
  *((_QWORD *)v19 + 251) = kAMFDRDecodeImplementationTestStationSha1;
  *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v35 = v20;
  *(_OWORD *)&v35[16] = v20;
  v34 = v20;
  memset(v33, 170, sizeof(v33));
  v31 = 0;
  v32 = 0;
  v30 = 0;
  v21 = _AMFDRDecodeVerifyTrustObject((uint64_t)v19);
  if (v21)
    *(_QWORD *)v19 |= v21;
  if (*((_QWORD *)v19 + 5) && *((_QWORD *)v19 + 6))
  {
    if (Img4DecodeInitManifest())
    {
      AMFDRDecodeLogInternal(3, "%s: could not parse sealing manifest");
    }
    else
    {
      if (!DERImg4DecodeManifest())
      {
        if ((**((unsigned int (***)(_QWORD, _QWORD, uint64_t, _QWORD))v19 + 251))(*((_QWORD *)v19 + 140), *((_QWORD *)v19 + 141), (uint64_t)(v19 + 308), **(_QWORD **)(*((_QWORD *)v19 + 251) + 32)))
        {
          AMFDRDecodeLogInternal(3, "%s: AMSupportDigestSha1 failed");
        }
        else if ((*(unsigned int (**)(_QWORD, _QWORD, uint64_t *, uint64_t *, unsigned int *, unsigned int *))(*((_QWORD *)v19 + 251) + 8))(*((_QWORD *)v19 + 144), *((_QWORD *)v19 + 145), &v31, &v32, v19 + 292, v19 + 294))
        {
          AMFDRDecodeLogInternal(3, "%s: %s: certificate chain validation failed");
        }
        else if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD, _QWORD, unsigned int *, _QWORD))(*((_QWORD *)v19 + 251) + 16))(v31, v32, *((_QWORD *)v19 + 142), *((_QWORD *)v19 + 143), v19 + 308, **(_QWORD **)(*((_QWORD *)v19 + 251) + 32)))
        {
          AMFDRDecodeLogInternal(3, "%s: %s: signature validation failed");
        }
        else if (DERDecodeItem((uint64_t)(v19 + 280), &v33[5]))
        {
          AMFDRDecodeLogInternal(3, "%s: failed to decode the signed section");
        }
        else if (v33[5] == 0x2000000000000011)
        {
          if (DERParseInteger((char **)v19 + 138, &v30))
          {
            AMFDRDecodeLogInternal(3, "%s: malformed Img4 Manifest (version parse fail)");
          }
          else if (DERImg4DecodeFindProperty())
          {
            AMFDRDecodeLogInternal(3, "%s: failed to find MANB (manifest body) tag");
          }
          else
          {
            *((_OWORD *)v19 + 56) = *(_OWORD *)&v35[8];
            if (DERImg4DecodeFindProperty())
            {
              AMFDRDecodeLogInternal(3, "%s: failed to find MANP (manifest payload) tag");
            }
            else
            {
              *((_OWORD *)v19 + 57) = *(_OWORD *)&v35[8];
              if (Img4DecodeEvaluateManifestProperties())
              {
                AMFDRDecodeLogInternal(3, "%s: Img4DecodeEvaluateManifestProperties failed");
              }
              else if (DERDecodeSeqContentInit((unint64_t *)v19 + 112, v33)
                     || (v25 = DERDecodeSeqNext(v33, &v33[2])) != 0)
              {
LABEL_38:
                AMFDRDecodeLogInternal(3, "%s: can't parse top-level container");
              }
              else
              {
                v26 = 0;
                while (!v25)
                {
                  v27 = v33[2];
                  if (LODWORD(v33[2]) != 1296125520)
                  {
                    if (DERImg4DecodeFindProperty())
                    {
                      AMFDRDecodeLogInternal(3, "%s: failed to find object properties");
                      goto LABEL_14;
                    }
                    *((_OWORD *)v19 + 58) = *(_OWORD *)&v35[8];
                    if ((*(unsigned int (**)(unsigned int *, unsigned int *))(*((_QWORD *)v19 + 251) + 24))(v19 + 214, v19))
                    {
                      AMFDRDecodeLogInternal(3, "%s: evaluateCertificateProperties failed");
                      goto LABEL_14;
                    }
                    if (Img4DecodeEvaluateObjectProperties())
                    {
                      AMFDRDecodeLogInternal(3, "%s: Img4DecodeEvaluateObjectProperties failed");
                      goto LABEL_14;
                    }
                    v28 = (uint64_t (*)(unint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, unsigned int, _QWORD, unsigned int, _QWORD))*((_QWORD *)v19 + 48);
                    if (v28)
                    {
                      v29 = v28(v27, *((_QWORD *)v19 + 17), v19[36], *((_QWORD *)v19 + 25), v19[52], *((_QWORD *)v19 + 245), v19[492], *((_QWORD *)v19 + 247), v19[496], *((_QWORD *)v19 + 249), v19[500], *((_QWORD *)v19 + 49));
                      if (v29)
                      {
                        AMFDRDecodeLogInternal(3, "%s: sealingManifestCallback failed with error 0x%llX", "_AMFDRDecodeVerifyTestStationManifestInternal", v29);
                        v23 = *(_QWORD *)v19 | 0x400000000;
                        goto LABEL_15;
                      }
                    }
                    v26 = 1;
                  }
                  v25 = DERDecodeSeqNext(v33, &v33[2]);
                  if (v25 >= 2)
                    goto LABEL_38;
                }
                if ((v26 & 1) != 0)
                {
                  v23 = *(_QWORD *)v19;
                  goto LABEL_15;
                }
                AMFDRDecodeLogInternal(3, "%s: No manifest found - not evaluated.");
              }
            }
          }
        }
        else
        {
          AMFDRDecodeLogInternal(3, "%s: signed section has an unexpected tag");
        }
        goto LABEL_14;
      }
      AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest failed to decode sealing manifest");
    }
    v22 = *(_QWORD *)v19 | 0x2000000;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest is missing", "_AMFDRDecodeVerifyTestStationManifestInternal");
    v22 = *(_QWORD *)v19 | 0x1000000;
  }
  *(_QWORD *)v19 = v22;
LABEL_14:
  AMFDRDecodeLogInternal(3, "%s: FDR Sealing Manifest failed to decode sequence", "_AMFDRDecodeVerifyTestStationManifestInternal");
  v23 = *(_QWORD *)v19 | 0x2000000;
LABEL_15:
  free(v19);
  return v23;
}

uint64_t AMFDRDecodeEvaluateTrustCombined(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, _QWORD *a9, _DWORD *a10)
{
  return AMFDRDecodeEvaluateTrustCombinedWithSik(a1, a2, a3, a4, a5, a6, a7, a8, 0, 0, a9, a10);
}

uint64_t AMFDRDecodeEvaluateTrustCombinedWithSik(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, _QWORD *a11, _DWORD *a12)
{
  _QWORD *v20;
  _QWORD *v21;
  BOOL v22;
  uint64_t v23;
  uint64_t (**v24)();

  v20 = malloc(0x7F8uLL);
  if (v20)
  {
    v21 = v20;
    bzero(v20, 0x7F8uLL);
    if (a11)
      v22 = a12 == 0;
    else
      v22 = 1;
    if (v22)
    {
      AMFDRDecodeLogInternal(3, "%s: outRawData must be non NULL and outRawDataLength must be non 0", "AMFDRDecodeEvaluateTrustCombinedWithSik");
      v23 = 1;
    }
    else
    {
      v21[1] = a1;
      v21[2] = a2;
      v21[9] = a3;
      v21[10] = a4;
      v21[13] = a5;
      v21[14] = a6;
      v21[17] = a7;
      v21[18] = a8;
      v21[21] = a9;
      v21[22] = a10;
      v24 = kAMFDRDecodeImplementationSha384;
      if (a4 != 48)
        v24 = kAMFDRDecodeImplementationSha1;
      v21[251] = v24;
      v23 = AMFDRDecodeEvaluateTrustInternal((uint64_t)v21);
      *a11 = v21[239];
      *a12 = v21[240];
    }
    free(v21);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeEvaluateTrustCombinedWithSik");
    return 0x80000000000000;
  }
  return v23;
}

uint64_t AMFDRDecodeEvaluateTrustInternal(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  int v10;
  const void *v11;
  size_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *__s2;
  unsigned int __n;
  char __n_7;
  unsigned int v23;
  int v24;
  void *v25;

  if (!*(_QWORD *)(a1 + 72) || !*(_QWORD *)(a1 + 80))
    *(_QWORD *)a1 |= 0x40000uLL;
  if ((!*(_QWORD *)(a1 + 104) || !*(_QWORD *)(a1 + 112)) && (*(_BYTE *)(a1 + 2017) & 0x20) == 0)
  {
    AMFDRDecodeLogInternal(3, "%s: fdrDecode->uniqueID is NULL or 0 size", "AMFDRDecodeEvaluateTrustInternal");
    result = *(_QWORD *)a1 | 1;
LABEL_12:
    *(_QWORD *)a1 = result;
    return result;
  }
  if (*(_QWORD *)(a1 + 8) && *(_QWORD *)(a1 + 16))
  {
    if (_AMFDRDecodeCombined(a1))
    {
      AMFDRDecodeLogInternal(4, "%s: data is unwrapped", "AMFDRDecodeEvaluateTrustInternal");
      v3 = *(_QWORD *)a1;
      *(_QWORD *)(a1 + 1912) = *(_QWORD *)(a1 + 8);
      *(_QWORD *)(a1 + 1920) = *(_QWORD *)(a1 + 16);
      result = v3 | 0x5A01C00;
      goto LABEL_12;
    }
  }
  else if (!*(_QWORD *)(a1 + 1944) || !*(_QWORD *)(a1 + 1952))
  {
    *(_QWORD *)a1 |= 0x200000uLL;
  }
  v4 = _AMFDRDecodeVerifyTrustObject(a1);
  if (v4)
    *(_QWORD *)a1 |= v4;
  v5 = _AMFDRDecodeVerifyData((uint64_t *)a1);
  if (v5)
    *(_QWORD *)a1 |= v5;
  v25 = 0;
  v24 = 0;
  if ((!*(_QWORD *)(a1 + 344) || !*(_DWORD *)(a1 + 352)) && (!*(_QWORD *)(a1 + 232) || !*(_QWORD *)(a1 + 240)))
  {
    AMFDRDecodeLogInternal(6, "%s: No need to verify subCC and asid");
    goto LABEL_56;
  }
  v6 = AMFDRDecodeIterateSysconfigBegin(*(_QWORD *)(a1 + 1912), *(_DWORD *)(a1 + 1920), &v25, &v24);
  v7 = v25;
  if (!v25 || v6)
  {
    AMFDRDecodeLogInternal(3, "%s: FDR 3.0 Data can't be decoded!");
    goto LABEL_51;
  }
  v8 = 0;
  while (1)
  {
    v23 = 0;
    __n_7 = 0;
    __n = 0;
    __s2 = 0;
    v9 = AMFDRDecodeIterateSysconfigPayloadNext((uint64_t)v7, &v23, &__n_7, &__s2, &__n, 0);
    if (v9)
    {
      if (v9 == 0x40000000000000)
      {
        if (*(_QWORD *)(a1 + 232) && !((*(_QWORD *)(a1 + 240) == 0) | v8 & 1))
          AMFDRDecodeLogInternal(4, "%s: kFDRTag_asid doesn't exist, but this is allowed");
        goto LABEL_56;
      }
      AMFDRDecodeLogInternal(3, "%s: failed to decode payload: 0x%llx!");
LABEL_51:
      v17 = *(_QWORD *)a1 | 0x400000000000000;
      goto LABEL_55;
    }
    v10 = AMFDRTagsStringToTag(&v23);
    if (v10 == 1634953572)
    {
      v11 = *(const void **)(a1 + 232);
      if (v11)
      {
        v12 = *(_QWORD *)(a1 + 240);
        if (v12)
        {
          if (v12 != __n)
          {
            AMFDRDecodeLogInternal(3, "%s: asid subCC length != fdrDecode->asidSubCCID.length", "_AMFDRDecodeVerifySubCC");
            *(_QWORD *)a1 |= 0x200000000000000uLL;
            v11 = *(const void **)(a1 + 232);
            v12 = __n;
          }
          if (memcmp(v11, __s2, v12))
          {
            AMFDRDecodeLogInternal(3, "%s: asid subCC data != fdrDecode->asidSubCCID", "_AMFDRDecodeVerifySubCC");
            *(_QWORD *)a1 |= 0x200000000000000uLL;
          }
          v8 = 1;
        }
      }
    }
    if (*(_QWORD *)(a1 + 344))
    {
      v13 = *(unsigned int *)(a1 + 352);
      if ((_DWORD)v13)
        break;
    }
LABEL_47:
    v7 = v25;
  }
  v14 = 0;
  while (*(_DWORD *)(*(_QWORD *)(a1 + 344) + 4 * v14) != v10)
  {
LABEL_46:
    if (++v14 >= v13)
      goto LABEL_47;
  }
  v15 = *(_QWORD *)(a1 + 360);
  if (!v15 || (v16 = *(_QWORD *)(a1 + 368)) == 0)
  {
    AMFDRDecodeLogInternal(3, "%s: No SCDG in manifest, subCC digest missing");
    goto LABEL_54;
  }
  v18 = 0;
  v19 = 0;
  if (!_AMFDRDecodeSearchEntryFromPropertyList(v15, v16, v10, &v18) && v19 && v18)
  {
    v13 = *(unsigned int *)(a1 + 352);
    goto LABEL_46;
  }
  AMFDRDecodeLogInternal(3, "%s: cannot find subCC digest for %u");
LABEL_54:
  v17 = *(_QWORD *)a1 | 0x1000000000000000;
LABEL_55:
  *(_QWORD *)a1 = v17;
LABEL_56:
  if (v25)
    free(v25);
  return *(_QWORD *)a1;
}

uint64_t AMFDRDecodeEvaluateTrust(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, _QWORD *a11, _DWORD *a12)
{
  return AMFDRDecodeEvaluateTrustWithSik(a1, a2, 0, 0, a3, a4, a5, a6, a7, a8, a9, a10, 0, 0, a11, a12);
}

uint64_t AMFDRDecodeEvaluateTrustWithSik(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, unsigned int a8, uint64_t a9, unsigned int a10, uint64_t a11, unsigned int a12, uint64_t a13, unsigned int a14, _QWORD *a15, _DWORD *a16)
{
  _QWORD *v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  uint64_t (**v28)();

  v24 = malloc(0x7F8uLL);
  if (v24)
  {
    v25 = v24;
    bzero(v24, 0x7F8uLL);
    if (a15)
      v26 = a16 == 0;
    else
      v26 = 1;
    if (v26)
    {
      AMFDRDecodeLogInternal(3, "%s: outRawData must be non NULL and outRawDataLength must be non 0", "AMFDRDecodeEvaluateTrustWithSik");
      v27 = 1;
    }
    else
    {
      v25[243] = a5;
      v25[244] = a6;
      v25[9] = a7;
      v25[10] = a8;
      v25[13] = a9;
      v25[14] = a10;
      v25[17] = a11;
      v25[18] = a12;
      v25[21] = a13;
      v25[22] = a14;
      v25[3] = a1;
      v25[4] = a2;
      v25[35] = a3;
      v25[36] = a4;
      v28 = kAMFDRDecodeImplementationSha384;
      if (a8 != 48)
        v28 = kAMFDRDecodeImplementationSha1;
      v25[251] = v28;
      v27 = AMFDRDecodeEvaluateTrustInternal((uint64_t)v25);
      *a15 = v25[239];
      *a16 = v25[240];
    }
    free(v25);
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeEvaluateTrustWithSik");
    return 0x80000000000000;
  }
  return v27;
}

uint64_t AMFDRDecodeEvaluateTrustOffline(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, _QWORD *a7, _DWORD *a8)
{
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = (uint64_t *)malloc(0x7F8uLL);
  if (v16)
  {
    v17 = v16;
    bzero(v16, 0x7F8uLL);
    if (!a7 || !a8)
    {
      AMFDRDecodeLogInternal(3, "%s: outRawData must be non NULL and outRawDataLength must be non 0", "AMFDRDecodeEvaluateTrustOffline");
      v19 = 1;
LABEL_13:
      free(v17);
      return v19;
    }
    v17[13] = a3;
    v17[14] = a4;
    v17[3] = a1;
    v17[4] = a2;
    v17[37] = a5;
    v17[38] = a6;
    v17[251] = (uint64_t)kAMFDRDecodeImplementationOffline;
    if (a3 && a4)
    {
      v18 = _AMFDRDecodeVerifyData(v17);
      v19 = *v17;
      if (!v18)
      {
LABEL_12:
        *a7 = v17[239];
        *a8 = v17[240];
        goto LABEL_13;
      }
      v19 |= v18;
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: fdrDecode->uniqueID is NULL or 0 size", "AMFDRDecodeEvaluateTrustOfflineInternal");
      v19 = 1;
    }
    *v17 = v19;
    goto LABEL_12;
  }
  AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeEvaluateTrustOffline");
  return 0x80000000000000;
}

uint64_t AMFDRDecodeCombined(uint64_t a1, unsigned int a2, _QWORD *a3, _DWORD *a4, _QWORD *a5, _DWORD *a6)
{
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = malloc(0x7F8uLL);
  if (v12)
  {
    v13 = v12;
    bzero(v12, 0x7F8uLL);
    if (a1 && a2)
    {
      if (a3 && a4)
      {
        if (a5 && a6)
        {
          v13[1] = a1;
          v13[2] = a2;
          v14 = _AMFDRDecodeCombined((uint64_t)v13);
          if (!v14)
          {
            *a3 = v13[243];
            *a4 = v13[244];
            v15 = v13[4];
            *a5 = v13[3];
            *a6 = v15;
          }
          goto LABEL_15;
        }
        AMFDRDecodeLogInternal(3, "%s: outData must be non NULL and outDataLength must be non 0");
      }
      else
      {
        AMFDRDecodeLogInternal(3, "%s: outTrustObject must be non NULL and outTrustObjectLength must be non 0");
      }
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: inData must be non NULL and inDataLength must be non 0");
    }
    v14 = 1;
LABEL_15:
    free(v13);
    return v14;
  }
  AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeCombined");
  return 0x80000000000000;
}

uint64_t _AMFDRDecodeCombined(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unint64_t v16[3];
  unint64_t v17[3];

  memset(v17, 170, sizeof(v17));
  v15 = 0u;
  *(_OWORD *)v16 = 0u;
  v14 = 0u;
  if (DERDecodeItem(a1 + 8, v17))
  {
    AMFDRDecodeLogInternal(3, "%s: failed to decode FDR Combined Format", "_AMFDRDecodeCombined");
    *(_QWORD *)a1 |= 0x80uLL;
    return 128;
  }
  if (v17[0] != 0x2000000000000010)
  {
    AMFDRDecodeLogInternal(3, "%s: FDR Combined Format unexpected tag: %llu", "_AMFDRDecodeCombined", v17[0]);
    *(_QWORD *)a1 |= 0x10000uLL;
    return 0x10000;
  }
  v3 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 8) + v3;
  if (v4 < v17[1] + v17[2])
  {
    AMFDRDecodeLogInternal(3, "%s: item is bigger on the inside", "_AMFDRDecodeCombined");
    *(_QWORD *)a1 |= 4uLL;
    return 4;
  }
  if (v4 > v17[1] + v17[2])
  {
    AMFDRDecodeLogInternal(3, "%s: Buffer contains %lu unused bytes", "_AMFDRDecodeCombined", v3 - v17[2]);
    *(_QWORD *)a1 |= 8uLL;
    return 8;
  }
  if (DERParseSequenceContentToObject(&v17[1], 3u, (uint64_t)&DERFDRCombinedItemSpecs, (unint64_t)&v14, 0x30uLL, 0))goto LABEL_30;
  if (!(_QWORD)v14 || *((_QWORD *)&v14 + 1) != 4)
    goto LABEL_29;
  if (*(_DWORD *)v14 != *(_DWORD *)"comb")
  {
LABEL_30:
    *(_QWORD *)a1 |= 0x20000uLL;
    return 0x20000;
  }
  if (!(_QWORD)v15 || !*((_QWORD *)&v15 + 1))
  {
    *(_QWORD *)a1 |= 0x200uLL;
    v2 = 512;
    goto LABEL_20;
  }
  v12 = 0u;
  v13 = 0u;
  if (DERParseSequenceContentToObject((unint64_t *)&v15, 2u, (uint64_t)&DERFDRItemSpecs, (unint64_t)&v12, 0x20uLL, 0))
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Combined Format (DERFDRItemSpecs)");
    goto LABEL_30;
  }
  if (!(_QWORD)v12 || *((_QWORD *)&v12 + 1) != 4)
  {
LABEL_29:
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Combined Format, invalid tag length");
    goto LABEL_30;
  }
  if (*(_DWORD *)v12 != *(_DWORD *)"fdrd")
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Combined Format, expected tag %c%c%c%c found tag %c%c%c%c", "_AMFDRDecodeCombined", kFDRTagStr_fdrd[0], kFDRTagStr_fdrd[1]);
    goto LABEL_30;
  }
  v9 = *((_QWORD *)&v13 + 1);
  *(_QWORD *)(a1 + 24) = v13;
  *(_QWORD *)(a1 + 32) = v9;
  if ((*(_BYTE *)(a1 + 2017) & 8) != 0)
  {
    v2 = _AMFDRDecodeMultiCombined(a1);
    if (v2)
    {
      AMFDRDecodeLogInternal(4, "%s: cannot decode to a multicombined data, proceed with combined format", "_AMFDRDecodeCombined");
      v11 = *((_QWORD *)&v13 + 1);
      *(_QWORD *)(a1 + 24) = v13;
      *(_QWORD *)(a1 + 32) = v11;
    }
  }
  else
  {
    v2 = 0;
  }
LABEL_20:
  if (!v16[0] || !v16[1])
  {
    v7 = *(_QWORD *)a1 | 0x200000;
LABEL_38:
    *(_QWORD *)a1 = v7;
    return v2;
  }
  v12 = 0u;
  v13 = 0u;
  if (DERParseSequenceContentToObject(v16, 2u, (uint64_t)&DERFDRItemSpecs, (unint64_t)&v12, 0x20uLL, 0))
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Combined Format (trustObject)");
LABEL_36:
    v8 = 0x20000;
    v2 = 0x20000;
LABEL_37:
    v7 = *(_QWORD *)a1 | v8;
    goto LABEL_38;
  }
  if (!(_QWORD)v12 || *((_QWORD *)&v12 + 1) != 4)
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Combined Format (trustObject), invalid tag length");
    goto LABEL_36;
  }
  if (*(_DWORD *)v12 != *(_DWORD *)"secb")
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR Combined Format (trustObject), expected tag %c%c%c%c found tag %c%c%c%c", "_AMFDRDecodeCombined", kFDRTagStr_secb[0], kFDRTagStr_secb[1]);
    goto LABEL_36;
  }
  v10 = v13;
  *(_OWORD *)(a1 + 1944) = v13;
  v8 = 0x200000;
  if (!(_QWORD)v10 || !*((_QWORD *)&v10 + 1))
    goto LABEL_37;
  return v2;
}

uint64_t AMFDRDecodePublicKey(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  unint64_t v5;
  __int128 v6;

  result = 1;
  if (a1 && a2 && a3)
  {
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    v6 = 0uLL;
    v5 = 0;
    *(_QWORD *)(a1 + 32) = a2;
    *(_QWORD *)(a1 + 40) = a3;
    if (_AMFDRDecodePubKey(a1 + 32, (unint64_t *)a1, a1 + 48))
    {
      AMFDRDecodeLogInternal(3, "%s: failed to decode public key: %d");
    }
    else
    {
      if (!DEROidCompare(a1 + 48, (uint64_t)&oidEcPubKey))
      {
        AMFDRDecodeLogInternal(3, "%s: public key OID is not EC", "AMFDRDecodePublicKey");
        return 64;
      }
      if (!DERDecodeItem(a1 + 64, &v5))
      {
        result = 0;
        *(_OWORD *)(a1 + 16) = v6;
        return result;
      }
      AMFDRDecodeLogInternal(3, "%s: failed to decode params");
    }
    return 16;
  }
  return result;
}

uint64_t _AMFDRDecodePubKey(uint64_t a1, unint64_t *a2, unint64_t a3)
{
  __int128 v5;
  uint64_t result;
  char v7;
  __int128 v8;
  __int128 v9;

  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8 = v5;
  v9 = v5;
  v7 = -86;
  result = DERParseSequenceToObject(a1, (unsigned __int16)DERNumSubjPubKeyInfoItemSpecs, (uint64_t)&DERSubjPubKeyInfoItemSpecs, (unint64_t)&v8, 0x20uLL, 0x20uLL);
  if (!(_DWORD)result)
  {
    result = DERParseSequenceContentToObject((unint64_t *)&v8, (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, a3, 0x20uLL, 0x20uLL);
    if (!(_DWORD)result)
    {
      if (DEROidCompare(a3, (uint64_t)&oidRsa) || DEROidCompare(a3, (uint64_t)&oidEcPubKey))
      {
        result = DERParseBitString((uint64_t)&v9, a2, &v7);
        if (!(_DWORD)result)
        {
          if (v7)
            return 3;
          else
            return 0;
        }
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

uint64_t AMFDRDecodeCertificate(unint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result;
  _BYTE *v5;
  _BYTE *v6;
  unint64_t v7;

  result = 1;
  if (a1 && a2 && a3)
  {
    *(_OWORD *)(a1 + 272) = 0u;
    *(_OWORD *)(a1 + 288) = 0u;
    *(_OWORD *)(a1 + 240) = 0u;
    *(_OWORD *)(a1 + 256) = 0u;
    *(_OWORD *)(a1 + 208) = 0u;
    *(_OWORD *)(a1 + 224) = 0u;
    *(_OWORD *)(a1 + 176) = 0u;
    *(_OWORD *)(a1 + 192) = 0u;
    *(_OWORD *)(a1 + 144) = 0u;
    *(_OWORD *)(a1 + 160) = 0u;
    *(_OWORD *)(a1 + 112) = 0u;
    *(_OWORD *)(a1 + 128) = 0u;
    *(_OWORD *)(a1 + 80) = 0u;
    *(_OWORD *)(a1 + 96) = 0u;
    *(_OWORD *)(a1 + 48) = 0u;
    *(_OWORD *)(a1 + 64) = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    *(_QWORD *)(a1 + 256) = a2;
    *(_QWORD *)(a1 + 264) = a3;
    if (DERParseSequenceToObject(a1 + 256, (unsigned __int16)DERNumSignedCertCrlItemSpecs, (uint64_t)&DERSignedCertCrlItemSpecs, a1, 0x30uLL, 0x30uLL)|| DERParseSequenceToObject(a1, 0xAu, (uint64_t)&FDRDERTBSCertItemSpecs, a1 + 48, 0xA0uLL, 0xA0uLL)|| _AMFDRDecodePubKey(a1 + 144, (unint64_t *)(a1 + 208), a1 + 224))
    {
      return 0x40000000000;
    }
    if (*(_QWORD *)(a1 + 248))
    {
      if (DEROidCompare(a1 + 224, (uint64_t)&oidEcPubKey))
      {
        if (*(_QWORD *)(a1 + 248) != 10)
          return 0x40000000000;
        v5 = *(_BYTE **)(a1 + 240);
        if (*v5 != 6 || v5[1] != 8 || memcmp(v5 + 2, &_oidEcPrime256v1, 8uLL))
          return 0x40000000000;
      }
      else if (DEROidCompare(a1 + 224, (uint64_t)&oidRsa))
      {
        if (*(_QWORD *)(a1 + 248) != 2)
          return 0x40000000000;
        v6 = *(_BYTE **)(a1 + 240);
        if (*v6 != 5 || v6[1])
          return 0x40000000000;
      }
    }
    v7 = 0xAAAAAAAAAAAAAAAALL;
    if (_AMFDRDecodeParseExtension(a1 + 48, (uint64_t)&___oidAppleFDRClientID, &v7, (_QWORD *)(a1 + 272), 1))
    {
      AMFDRDecodeLogInternal(5, "%s: ClientID extension not found", "AMFDRDecodeCertificate");
    }
    else if (v7 != 12)
    {
      return 0x40000000000;
    }
    if (_AMFDRDecodeParseExtension(a1 + 48, (uint64_t)&___oidAppleSecureBootCertificateProperties, &v7, (_QWORD *)(a1 + 288), 0))
    {
      AMFDRDecodeLogInternal(5, "%s: Certificate Properties extension not found", "AMFDRDecodeCertificate");
      return 0;
    }
    if (v7 == 0x2000000000000011)
      return 0;
    return 0x40000000000;
  }
  return result;
}

uint64_t _AMFDRDecodeParseExtension(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, int a5)
{
  __int128 v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  unint64_t *v13;
  unint64_t v15[3];
  _OWORD v16[2];
  __int128 v17;
  unint64_t v18[3];
  unint64_t v19;
  unint64_t v20[2];

  v20[0] = 0xAAAAAAAAAAAAAAAALL;
  v20[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(v18, 170, sizeof(v18));
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16[1] = v5;
  v17 = v5;
  memset(v15, 170, sizeof(v15));
  v6 = 1;
  v16[0] = v5;
  if (a1 && a2 && a4)
  {
    *a4 = 0;
    a4[1] = 0;
    if (*(_QWORD *)(a1 + 152) && (v10 = *(_QWORD *)(a1 + 144), v9 = a1 + 144, v10))
    {
      v19 = 0xAAAAAAAAAAAAAAAALL;
      v6 = 16;
      if (!DERDecodeSeqInit(v9, &v19, v20) && v19 == 0x2000000000000010)
      {
        v6 = 2;
        while (!DERDecodeSeqNext(v20, v18))
        {
          if (v18[0] != 0x2000000000000010
            || DERParseSequenceContentToObject(&v18[1], (unsigned __int16)DERNumExtensionItemSpecs, (uint64_t)&DERExtensionItemSpecs, (unint64_t)v16, 0x30uLL, 0x30uLL))
          {
            return 16;
          }
          if (DEROidCompare(a2, (uint64_t)v16))
          {
            if (DERDecodeItem((uint64_t)&v17, v15))
              return 0x40000000000;
            v6 = 0;
            *a3 = v15[0];
            if (a5)
              v13 = &v15[1];
            else
              v13 = (unint64_t *)&v17;
            *(_OWORD *)a4 = *(_OWORD *)v13;
            return v6;
          }
        }
      }
    }
    else
    {
      return 512;
    }
  }
  return v6;
}

double AMFDRDecodeImage4Certificate(_OWORD *a1, uint64_t a2, unsigned int a3)
{
  uint64_t v4;
  _OWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double result;
  __int128 *v11;
  __int128 v12;
  __int128 v13;
  unint64_t v14;
  __int128 v15;
  unint64_t v16;
  unint64_t v17[2];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[2];
  __int128 v23;
  __int128 v24;
  __int128 v25;

  if (a1 && a2 && a3)
  {
    a1[17] = 0u;
    a1[18] = 0u;
    a1[15] = 0u;
    a1[16] = 0u;
    a1[13] = 0u;
    a1[14] = 0u;
    a1[11] = 0u;
    a1[12] = 0u;
    a1[9] = 0u;
    a1[10] = 0u;
    a1[7] = 0u;
    a1[8] = 0u;
    a1[5] = 0u;
    a1[6] = 0u;
    a1[3] = 0u;
    a1[4] = 0u;
    a1[1] = 0u;
    a1[2] = 0u;
    *a1 = 0u;
    v23 = 0u;
    v24 = 0u;
    memset(v22, 0, sizeof(v22));
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17[0] = 0;
    v17[1] = 0;
    v16 = 0;
    v14 = 0;
    v15 = 0uLL;
    *(_QWORD *)&v25 = a2;
    *((_QWORD *)&v25 + 1) = a3;
    if (DERParseSequenceToObject((uint64_t)&v25, 4u, (uint64_t)&DERFDRImage4CertItemSpecs, (unint64_t)v22, 0x40uLL, 0x40uLL))
    {
      AMFDRDecodeLogInternal(3, "%s: failed to parse im4c: %d");
    }
    else if (*(_QWORD *)&v22[0] && *((_QWORD *)&v22[0] + 1) == 4)
    {
      if (**(_DWORD **)&v22[0] == *(_DWORD *)"IM4C")
      {
        if (DERDecodeItem((uint64_t)&v23, &v16))
        {
          AMFDRDecodeLogInternal(3, "%s: failed to parse signed section sequence: %d");
        }
        else if (v16 == 0x2000000000000011)
        {
          if (DERParseSequenceContentToObject(v17, 2u, (uint64_t)&DERFDRImage4CertSignedSectionItemSpecs, (unint64_t)&v20, 0x20uLL, 0x20uLL))
          {
            AMFDRDecodeLogInternal(3, "%s: failed to parse signed section of im4c: %d");
          }
          else if (DERDecodeItem((uint64_t)&v21, &v14))
          {
            AMFDRDecodeLogInternal(3, "%s: failed to parse public key of im4c: %d");
          }
          else if (DERParseSequenceToObject((uint64_t)&v20, 2u, (uint64_t)&DERFDRImage4CertPropertyItemSpecs, (unint64_t)&v18, 0x20uLL, 0x20uLL))
          {
            AMFDRDecodeLogInternal(3, "%s: failed to parse cert properties: %d");
          }
          else if ((_QWORD)v18 && *((_QWORD *)&v18 + 1) == 4)
          {
            if (*(_DWORD *)v18 == *(_DWORD *)"CRTP")
            {
              v4 = 0;
              v5 = 0;
              do
              {
                v6 = 0;
                v7 = (uint64_t)*(&kAMFDRDecodeEcdsaInfoList + v4);
                while (*((_QWORD *)&v24 + 1) != *(_DWORD *)(v7 + 4) + (_DWORD)v6)
                {
                  if (++v6 == 3)
                    goto LABEL_22;
                }
                v5 = *(_OWORD **)(v7 + 24);
LABEL_22:
                ++v4;
              }
              while (v4 != 3);
              if (v5)
              {
                v8 = 0;
                while (1)
                {
                  v9 = *(uint64_t *)((char *)&kAMFDRDecodeEcdsaInfoList + v8);
                  if (*((_QWORD *)&v15 + 1) == *(_DWORD *)v9)
                    break;
                  v8 += 8;
                  if (v8 == 24)
                    goto LABEL_27;
                }
                v11 = *(__int128 **)(v9 + 16);
                if (!v11)
                {
LABEL_27:
                  AMFDRDecodeLogInternal(3, "%s: unsupported public key length: %lu");
                  return result;
                }
                *a1 = v23;
                a1[2] = v24;
                a1[1] = *v5;
                a1[13] = v15;
                a1[14] = oidEcPubKey;
                v12 = *v11;
                a1[18] = v19;
                v13 = v25;
                a1[15] = v12;
                a1[16] = v13;
                result = *(double *)&v15;
                a1[9] = v15;
              }
              else
              {
                AMFDRDecodeLogInternal(3, "%s: unsupported signature length: %lu");
              }
            }
            else
            {
              AMFDRDecodeLogInternal(3, "%s: malformed cert property key: %c%c%c%c");
            }
          }
          else
          {
            AMFDRDecodeLogInternal(3, "%s: malformed cert property key length: %lu");
          }
        }
        else
        {
          AMFDRDecodeLogInternal(3, "%s: unexpected signed section tag: 0x%llx");
        }
      }
      else
      {
        AMFDRDecodeLogInternal(3, "%s: malformed im4c tag: %c%c%c%c");
      }
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: malformed im4c tag length: %lu");
    }
  }
  return result;
}

uint64_t AMFDRDecodeIterateCertChainBegin(_QWORD *a1, uint64_t a2, unsigned int a3)
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

void AMFDRDecodeIterateCertChainNext(uint64_t a1, _OWORD **a2, _DWORD *a3)
{
  AMFDRDecodeIterateCertChainNextWithOptions(a1, 0, a2, a3);
}

void AMFDRDecodeIterateCertChainNextWithOptions(uint64_t a1, __int16 a2, _OWORD **a3, _DWORD *a4)
{
  uint64_t v7;
  unint64_t v9;
  _OWORD *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  unsigned int v15;

  v15 = 0;
  if (a1 && a3 && *(_QWORD *)a1)
  {
    v7 = *(_QWORD *)(a1 + 8);
    if (v7)
    {
      if (!AMFDRDecodeParseDERLengthFromBuffer(*(_QWORD *)a1, v7, &v15))
      {
        v9 = *(_QWORD *)(a1 + 8);
        if (v9 >= v15)
        {
          v10 = *a3;
          v11 = *(_QWORD *)a1;
          if ((a2 & 0x100) != 0)
            AMFDRDecodeImage4Certificate(v10, v11, v9);
          else
            v12 = AMFDRDecodeCertificate((unint64_t)v10, v11, v9);
          if (!v12)
          {
            v13 = *(unsigned __int16 *)(a1 + 16);
            *(_WORD *)(a1 + 16) = v13 + 1;
            *a4 = v13;
            v14 = *(_QWORD *)(a1 + 8) - v15;
            *(_QWORD *)a1 += v15;
            *(_QWORD *)(a1 + 8) = v14;
          }
        }
      }
    }
    else
    {
      *a3 = 0;
    }
  }
}

uint64_t AMFDRDecodeCheckCertRevocation(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  unsigned int v5;
  uint64_t v6;
  char *v7;
  int v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  void *__s2;
  unsigned int __n;
  _OWORD __n_4[2];
  _OWORD v16[2];
  _OWORD __s1[2];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  __n = 0;
  __s2 = 0;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __s1[0] = v4;
  __s1[1] = v4;
  v16[0] = v4;
  v16[1] = v4;
  __n_4[0] = v4;
  __n_4[1] = v4;
  v5 = AMSupportDigestSha256();
  if (v5 || (v5 = AMSupportDigestSha256()) != 0)
  {
LABEL_3:
    v6 = v5;
    v7 = "%s: AMSupportDigestSha256 failed";
LABEL_4:
    AMFDRDecodeLogInternal(3, v7, "AMFDRDecodeCheckCertRevocation");
    return v6;
  }
  if (*(_QWORD *)(a2 + 272) && *(_QWORD *)(a2 + 280))
  {
    v5 = AMSupportDigestSha256();
    if (v5)
      goto LABEL_3;
    v9 = 1;
  }
  else
  {
    v9 = 0;
  }
  v10 = AMFDRDecodeIterateTrustObjectRevokedBegin(a1);
  if (v10)
  {
    v6 = v10;
    AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateTrustObjectRevokedBegin failed");
  }
  else
  {
    v11 = AMFDRDecodeIterateTrustObjectRevokedNext(a1, &__s2, &__n);
    if (v11)
    {
      v6 = v11;
      AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeIterateTrustObjectRevokedNext failed");
    }
    else
    {
      v7 = "%s: AMFDRDecodeIterateTrustObjectRevokedNext failed";
      while (1)
      {
        v6 = (uint64_t)__s2;
        if (!__s2)
          break;
        v12 = __n;
        if (!memcmp(__s1, __s2, __n))
        {
          v6 = 0x10000000000;
          AMFDRDecodeLogInternal(3, "%s: FDR Trust Object revoked certificate found");
          return v6;
        }
        if (!memcmp(v16, (const void *)v6, v12))
        {
          v6 = 0x10000000000;
          AMFDRDecodeLogInternal(3, "%s: FDR Trust Object revoked public key found");
          return v6;
        }
        if (v9 && !memcmp(__n_4, (const void *)v6, v12))
        {
          v6 = 0x10000000000;
          AMFDRDecodeLogInternal(3, "%s: FDR Trust Object revoked client ID found");
          return v6;
        }
        v6 = AMFDRDecodeIterateTrustObjectRevokedNext(a1, &__s2, &__n);
        if (v6)
          goto LABEL_4;
      }
    }
  }
  return v6;
}

uint64_t AMFDRDecodeVerifyCertIssuer(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return AMFDRDecodeVerifyCertIssuerWithOptions(a1, a2, a3, 0, 0);
}

uint64_t AMFDRDecodeVerifyCertIssuerWithOptions(uint64_t a1, uint64_t a2, uint64_t a3, __int16 a4, _QWORD *a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3)
  {
    if ((a4 & 0x100) == 0)
      return _AMFDRDecodeVerifyCertIssuerInternal(a1, a2, a3, a5);
    v8 = *(_QWORD *)(a1 + 24);
    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 40);
      if (v9)
      {
        if (_AMFDRDecodeVerifySignatureDataWithOid(*(const void **)(a2 + 208), *(_DWORD *)(a2 + 216), *(_QWORD *)(a1 + 32), v9, *(_QWORD *)a1, *(unsigned int *)(a1 + 8), *(_QWORD *)(a1 + 16), v8, a2 + 240, 1, a5))
        {
          v10 = 0x20000000000;
          AMFDRDecodeLogInternal(3, "%s: PKI: im4c cert signature validation with issuer pubkey failed");
        }
        else
        {
          AMFDRDecodeLogInternal(7, "%s: PKI: verify im4c cert was issued and signed by issuer (success)", "_AMFDRDecodeVerifyImage4CertIssuer");
          v10 = AMFDRDecodeCheckCertRevocation(a3, a1);
          if (v10)
            AMFDRDecodeLogInternal(3, "%s: im4c revocation check failed");
        }
      }
      else
      {
        v10 = 0x40000000000;
        AMFDRDecodeLogInternal(3, "%s: decoded IM4C signature is empty");
      }
    }
    else
    {
      v10 = 0x40000000000;
      AMFDRDecodeLogInternal(3, "%s: decoded IM4C signature OID is empty");
    }
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: trustObject is NULL", "AMFDRDecodeVerifyCertIssuerWithOptions");
    return 1;
  }
  return v10;
}

uint64_t AMFDRDecodeVerifyCertIssuerNoRevocation(uint64_t a1, uint64_t a2)
{
  return _AMFDRDecodeVerifyCertIssuerInternal(a1, a2, 0, 0);
}

uint64_t _AMFDRDecodeVerifyCertIssuerInternal(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  __int128 v7;
  size_t v8;
  char *v10;
  const char *v11;
  char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;
  char v18;
  _OWORD v19[2];

  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[0] = v7;
  v19[1] = v7;
  v16 = 0xAAAAAAAAAAAAAAAALL;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  v8 = *(_QWORD *)(a2 + 136);
  if (v8 != *(_QWORD *)(a1 + 104) || memcmp(*(const void **)(a2 + 128), *(const void **)(a1 + 96), v8))
  {
    AMFDRDecodeLogInternal(3, "%s: PKI: cert was not issued by issuer (subject != issuer)", "_AMFDRDecodeVerifyCertIssuerInternal");
    v10 = (char *)malloc(0x100uLL);
    if (_AMFDRDecodeSequenceString(*(_QWORD *)(a2 + 128), *(_QWORD *)(a2 + 136), v10))
      v11 = "decode error";
    else
      v11 = v10;
    v12 = (char *)malloc(0x100uLL);
    if (_AMFDRDecodeSequenceString(*(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), v12))
      v13 = "decode error";
    else
      v13 = v12;
    AMFDRDecodeLogInternal(3, "%s: subject: %s, issuer: %s", "_AMFDRDecodeVerifyCertIssuerInternal", v11, v13);
    if (v10)
      free(v10);
    if (v12)
      free(v12);
    return 0x20000000000;
  }
  v18 = -86;
  if (DERParseSequenceContentToObject((unint64_t *)(a1 + 16), (unsigned __int16)DERNumAlgorithmIdItemSpecs, (uint64_t)&DERAlgorithmIdItemSpecs, (unint64_t)v19, 0x20uLL, 0x20uLL))
  {
    AMFDRDecodeLogInternal(3, "%s: decodeAlgId failed");
    return 0x40000000000;
  }
  if (DERParseBitString(a1 + 32, (unint64_t *)&v16, &v18))
  {
    AMFDRDecodeLogInternal(3, "%s: DERParseBitString(sig) failed");
    return 0x40000000000;
  }
  if (v18)
  {
    AMFDRDecodeLogInternal(3, "%s: numUnused != 0");
    return 0x40000000000;
  }
  if (_AMFDRDecodeVerifySignatureDataWithOid(*(const void **)(a2 + 208), *(_DWORD *)(a2 + 216), v16, v17, *(_QWORD *)a1, *(unsigned int *)(a1 + 8), *(uint64_t *)&v19[0], DWORD2(v19[0]), a1 + 240, 0, a4))
  {
    AMFDRDecodeLogInternal(3, "%s: PKI: cert signature validation with issuer pubkey failed", "_AMFDRDecodeVerifyCertIssuerInternal");
    return 0x20000000000;
  }
  AMFDRDecodeLogInternal(7, "%s: PKI: verify cert was issued and signed by issuer (success)", "_AMFDRDecodeVerifyCertIssuerInternal");
  if (!a3)
    return 0;
  v14 = AMFDRDecodeCheckCertRevocation(a3, a1);
  if (v14)
    AMFDRDecodeLogInternal(3, "%s: revocation check failed", "_AMFDRDecodeVerifyCertIssuerInternal");
  return v14;
}

uint64_t AMFDRDecodeParseDERLengthFromBuffer(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t result;
  unint64_t v6[3];
  _QWORD v7[2];

  memset(v6, 170, sizeof(v6));
  result = 1;
  if (a1 && a3)
  {
    v7[0] = a1;
    v7[1] = a2;
    if (DERDecodeItemPartialBufferGetLength((uint64_t)v7, v6, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: failed to decode DER", "AMFDRDecodeParseDERLengthFromBuffer");
      return 2;
    }
    else
    {
      result = 0;
      *a3 = LODWORD(v6[2]) - a1 + LODWORD(v6[1]);
    }
  }
  return result;
}

uint64_t AMFDRDecodeMultiSealingResponse(uint64_t a1, unsigned int a2, _BYTE *a3, uint64_t (*a4)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, _DWORD, _QWORD, _DWORD, uint64_t), uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];

  v5 = 1;
  if (a1 && a2 && a3)
  {
    memset(v15, 0, sizeof(v15));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    *(_QWORD *)&v11 = a1;
    *((_QWORD *)&v11 + 1) = a2;
    if (DERParseSequenceToObject((uint64_t)&v11, 2u, (uint64_t)&DERFDRMultiResponseItemSpecs, (unint64_t)v15, 0x20uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Format");
      return 16;
    }
    v11 = v15[0];
    if (DERParseSequenceContentToObject((unint64_t *)&v11, 3u, (uint64_t)&DERFDRMultiSealingResponsePayloadItemSpecs, (unint64_t)&v12, 0x30uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Payload Format");
      return 16;
    }
    if ((_QWORD)v13 && (v10 = _AMFDRDecodeMultiSealingResposeRecords(1, (unint64_t *)&v13, a4, a5)) != 0
      || (_QWORD)v14 && (v10 = _AMFDRDecodeMultiSealingResposeRecords(0, (unint64_t *)&v14, a4, a5)) != 0)
    {
      v5 = v10;
      AMFDRDecodeLogInternal(3, "%s: _AMFDRDecodeMultiSealingResposeRecords failed with error 0x%llX", "AMFDRDecodeMultiSealingResponse", v10);
    }
    else if ((_QWORD)v12 && *((_QWORD *)&v12 + 1) == 1)
    {
      v5 = 0;
      *a3 = *(_BYTE *)v12;
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response actionCode Format", "AMFDRDecodeMultiSealingResponse");
      return 32;
    }
  }
  return v5;
}

uint64_t _AMFDRDecodeMultiSealingResposeRecords(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, _DWORD, _QWORD, _DWORD, uint64_t), uint64_t a4)
{
  uint64_t v7;
  __int128 v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;
  __int128 v22;
  unint64_t v23[2];
  __int128 v24;

  *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  if (!a2 || !*a2 || !a2[1])
    return 1;
  v23[0] = 0;
  v23[1] = 0;
  v22 = 0uLL;
  v21 = 0;
  if (DERDecodeSeqContentInit(a2, v23))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Multi-response payload");
    return 16;
  }
  else
  {
    v8 = 0uLL;
    v7 = 16;
    while (1)
    {
      v17 = v8;
      v18 = v8;
      v19 = v8;
      v20 = v8;
      v15 = v8;
      v16 = v8;
      v9 = DERDecodeSeqNext(v23, &v21);
      if (v9)
        break;
      if (!*((_QWORD *)&v22 + 1))
        return v7;
      if (v21 != 0x2000000000000010)
      {
        AMFDRDecodeLogInternal(3, "%s: Record must be SEQUENCE Container");
        return 32;
      }
      v24 = v22;
      if (DERParseSequenceContentToObject((unint64_t *)&v24, 4u, (uint64_t)&DERFDRMultiResponseRecordItemSpecs, (unint64_t)&v17, 0x40uLL, 0))
      {
        AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Payload Record Format");
        return 16;
      }
      if ((_QWORD)v18)
      {
        v24 = v18;
        if (DERDecodeItem((uint64_t)&v24, &v21))
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response value Format");
          return 32;
        }
        if (v21 != 4)
        {
          AMFDRDecodeLogInternal(3, "%s: Record value must be OCTET_STRING", "_AMFDRDecodeMultiSealingResposeRecords");
          return 64;
        }
        v10 = v22;
        if (!(_QWORD)v22)
        {
          AMFDRDecodeLogInternal(3, "%s: Record value is NULL");
          return 32;
        }
        v11 = *((_QWORD *)&v22 + 1);
        if (!*((_QWORD *)&v22 + 1))
        {
          AMFDRDecodeLogInternal(3, "%s: Record value length is 0");
          return 32;
        }
      }
      else
      {
        v10 = 0;
        v11 = 0;
      }
      if ((_QWORD)v20)
      {
        v24 = v20;
        if (DERParseSequenceToObject((uint64_t)&v24, 2u, (uint64_t)&DERFDRMultiResponseErrorItemSpecs, (unint64_t)&v15, 0x20uLL, 0))
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Error Format");
          return 16;
        }
        if (!(_QWORD)v15 || *((_QWORD *)&v15 + 1) != 1)
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Error Code Format");
          return 32;
        }
      }
      if (a3)
      {
        v12 = a3(v17, DWORD2(v17), v10, v11, v19, DWORD2(v19), a1, v15, DWORD2(v15), v16, DWORD2(v16), a4);
        if (v12)
        {
          v14 = v12;
          AMFDRDecodeLogInternal(3, "%s: multiResponseCallback failed with error 0x%llX", "_AMFDRDecodeMultiSealingResposeRecords", v12);
          return v14;
        }
      }
      v8 = 0uLL;
    }
    if (v9 == 1)
      return 0;
  }
  return v7;
}

uint64_t AMFDRDecodeMultiResponse(uint64_t a1, unsigned int a2, _BYTE *a3, uint64_t (*a4)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, _DWORD, _QWORD, _DWORD, uint64_t), uint64_t a5)
{
  uint64_t v5;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];

  v5 = 1;
  if (a1 && a2 && a3)
  {
    memset(v15, 0, sizeof(v15));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    *(_QWORD *)&v11 = a1;
    *((_QWORD *)&v11 + 1) = a2;
    if (DERParseSequenceToObject((uint64_t)&v11, 2u, (uint64_t)&DERFDRMultiResponseItemSpecs, (unint64_t)v15, 0x20uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Format");
      return 16;
    }
    v11 = v15[0];
    if (DERParseSequenceContentToObject((unint64_t *)&v11, 3u, (uint64_t)&DERFDRMultiResponsePayloadItemSpecs, (unint64_t)&v12, 0x30uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Payload Format");
      return 16;
    }
    if ((_QWORD)v13 && (v10 = _AMFDRDecodeMultiResposeRecords(1, &v13, a4, a5)) != 0
      || (_QWORD)v14 && (v10 = _AMFDRDecodeMultiResposeRecords(0, &v14, a4, a5)) != 0)
    {
      v5 = v10;
      AMFDRDecodeLogInternal(3, "%s: _AMFDRDecodeMultiResposeRecords failed with error 0x%llX", "AMFDRDecodeMultiResponse", v10);
    }
    else if ((_QWORD)v12 && *((_QWORD *)&v12 + 1) == 1)
    {
      v5 = 0;
      *a3 = *(_BYTE *)v12;
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response actionCode Format", "AMFDRDecodeMultiResponse");
      return 32;
    }
  }
  return v5;
}

uint64_t _AMFDRDecodeMultiResposeRecords(uint64_t a1, _QWORD *a2, uint64_t (*a3)(_QWORD, _QWORD, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t, _QWORD, _DWORD, _QWORD, _DWORD, uint64_t), uint64_t a4)
{
  uint64_t v7;
  __int128 v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;
  __int128 v22;
  unint64_t v23[2];
  __int128 v24;
  uint64_t v25;

  *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25 = 0;
  *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
  if (!a2 || !*a2 || !a2[1])
    return 1;
  v23[0] = 0;
  v23[1] = 0;
  v22 = 0uLL;
  v21 = 0;
  if (DERDecodeSeqInit((uint64_t)a2, &v25, v23))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse FDR Multi-response payload");
    return 16;
  }
  else if (v25 == 0x2000000000000011)
  {
    v8 = 0uLL;
    v7 = 16;
    while (1)
    {
      v17 = v8;
      v18 = v8;
      v19 = v8;
      v20 = v8;
      v15 = v8;
      v16 = v8;
      v9 = DERDecodeSeqNext(v23, &v21);
      if (v9)
        break;
      if (!*((_QWORD *)&v22 + 1))
        return v7;
      if (v21 != 0x2000000000000010)
      {
        AMFDRDecodeLogInternal(3, "%s: Record must be SEQUENCE Container");
        return 32;
      }
      v24 = v22;
      if (DERParseSequenceContentToObject((unint64_t *)&v24, 4u, (uint64_t)&DERFDRMultiResponseRecordItemSpecs, (unint64_t)&v17, 0x40uLL, 0))
      {
        AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Payload Record Format");
        return 16;
      }
      if ((_QWORD)v18)
      {
        v24 = v18;
        if (DERDecodeItem((uint64_t)&v24, &v21))
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response value Format");
          return 32;
        }
        if (v21 != 4)
        {
          AMFDRDecodeLogInternal(3, "%s: Record value must be OCTET_STRING", "_AMFDRDecodeMultiResposeRecords");
          return 64;
        }
        v10 = v22;
        if (!(_QWORD)v22)
        {
          AMFDRDecodeLogInternal(3, "%s: Record value is NULL");
          return 32;
        }
        v11 = *((_QWORD *)&v22 + 1);
        if (!*((_QWORD *)&v22 + 1))
        {
          AMFDRDecodeLogInternal(3, "%s: Record value length is 0");
          return 32;
        }
      }
      else
      {
        v10 = 0;
        v11 = 0;
      }
      if ((_QWORD)v20)
      {
        v24 = v20;
        if (DERParseSequenceToObject((uint64_t)&v24, 2u, (uint64_t)&DERFDRMultiResponseErrorItemSpecs, (unint64_t)&v15, 0x20uLL, 0))
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Error Format");
          return 16;
        }
        if (!(_QWORD)v15 || *((_QWORD *)&v15 + 1) != 1)
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Multi-Response Error Code Format");
          return 32;
        }
      }
      if (a3)
      {
        v12 = a3(v17, DWORD2(v17), v10, v11, v19, DWORD2(v19), a1, v15, DWORD2(v15), v16, DWORD2(v16), a4);
        if (v12)
        {
          v14 = v12;
          AMFDRDecodeLogInternal(3, "%s: multiResponseCallback failed with error 0x%llX", "_AMFDRDecodeMultiResposeRecords", v12);
          return v14;
        }
      }
      v8 = 0uLL;
    }
    if (v9 == 1)
      return 0;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: Records must be SET Container");
    return 32;
  }
  return v7;
}

uint64_t AMFDRDecodeMetadata(unint64_t a1, unsigned int a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t), uint64_t a4)
{
  uint64_t v4;
  __int128 v7;
  int v8;
  uint64_t v9;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17[2];
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = 0;
  v4 = 1;
  if (a1 && a2)
  {
    v17[0] = 0;
    v17[1] = 0;
    v15 = 0;
    v16 = 0;
    v14 = 0;
    v18 = a1;
    v19 = a2;
    if (DERDecodeSeqInit((uint64_t)&v18, &v20, v17))
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse FDR Multi-response Metadata");
      return 16;
    }
    else if (v20 == 0x2000000000000011)
    {
      v7 = 0uLL;
      v4 = 16;
      while (1)
      {
        v12 = v7;
        v13 = v7;
        v8 = DERDecodeSeqNext(v17, &v14);
        if (v8)
          break;
        if (!v16)
          return 512;
        if (v14 != 0x2000000000000010)
        {
          AMFDRDecodeLogInternal(3, "%s: MetadataRecord must be SEQUENCE Container");
          return 32;
        }
        v18 = v15;
        v19 = v16;
        if (DERParseSequenceContentToObject(&v18, 2u, (uint64_t)&DERFDRMetadataRecordItemSpecs, (unint64_t)&v12, 0x20uLL, 0))
        {
          AMFDRDecodeLogInternal(3, "%s: malformed FDR Metadata Record Format");
          return 16;
        }
        if (a3)
        {
          v9 = a3(v12, DWORD2(v12), v13, DWORD2(v13), a4);
          if (v9)
          {
            v11 = v9;
            AMFDRDecodeLogInternal(3, "%s: metadataRecordCallback failed with error 0x%llX", "AMFDRDecodeMetadata", v9);
            return v11;
          }
        }
        v7 = 0uLL;
      }
      if (v8 == 1)
        return 0;
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: Metadata must be SET Container");
      return 32;
    }
  }
  return v4;
}

uint64_t AMFDRDecodeGetImg4RawData(uint64_t a1, int a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v4;

  v4 = 1;
  if (a1 && a2)
  {
    if (Img4DecodeInit())
    {
      return 0x2000;
    }
    else
    {
      v4 = 0;
      if (a3 && a4)
      {
        v4 = 0;
        *a3 = 0xAAAAAAAAAAAAAAAALL;
        *a4 = -1431655766;
      }
    }
  }
  return v4;
}

uint64_t AMFDRDecodeGetImg4Manifest(uint64_t a1, int a2, _QWORD *a3, _DWORD *a4)
{
  uint64_t v4;

  v4 = 1;
  if (a1 && a2)
  {
    if (Img4DecodeInit())
    {
      AMFDRDecodeLogInternal(3, "%s: FDR failed to decode Data img4", "AMFDRDecodeGetImg4Manifest");
      return 0x2000;
    }
    else
    {
      v4 = 0;
      if (a3 && a4)
      {
        v4 = 0;
        *a3 = 0xAAAAAAAAAAAAAAAALL;
        *a4 = -1431655766;
      }
    }
  }
  return v4;
}

uint64_t AMFDRDecodeFDR2Data(uint64_t a1, unsigned int a2, _QWORD *a3, _DWORD *a4, _QWORD *a5, _DWORD *a6)
{
  uint64_t v10;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  uint64_t v14;
  char *v15;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unint64_t v30[3];
  uint64_t v31;
  uint64_t v32;
  unint64_t v33[3];

  v29 = 0u;
  *(_OWORD *)v30 = 0u;
  v28 = 0u;
  v31 = a1;
  v32 = a2;
  memset(v33, 170, sizeof(v33));
  if (DERDecodeItem((uint64_t)&v31, v33))
  {
    AMFDRDecodeLogInternal(3, "%s: failed to decode FDR2 Format", "AMFDRDecodeFDR2Data");
    return 128;
  }
  if (v33[0] != 0x2000000000000010)
  {
    AMFDRDecodeLogInternal(3, "%s: FDR2 Format unexpected tag: %llu", "AMFDRDecodeFDR2Data", v33[0]);
    return 0x4000000000000;
  }
  if (v31 + v32 < v33[1] + v33[2])
  {
    AMFDRDecodeLogInternal(3, "%s: item is bigger on the inside", "AMFDRDecodeFDR2Data");
    return 4;
  }
  if (v31 + v32 > v33[1] + v33[2])
  {
    AMFDRDecodeLogInternal(3, "%s: Buffer contains %lu unused bytes", "AMFDRDecodeFDR2Data", v32 - v33[2]);
    return 8;
  }
  if (DERParseSequenceContentToObject(&v33[1], 3u, (uint64_t)&DERFDR2DataItemSpecs, (unint64_t)&v28, 0x30uLL, 0))return 0x8000000000000;
  v12 = (unsigned __int8 *)v28;
  if (!(_QWORD)v28 || *((_QWORD *)&v28 + 1) != 4)
  {
    AMFDRDecodeLogInternal(3, "%s: malformed FDR2 Format, invalid fdr2Data.tag.length");
    return 0x8000000000000;
  }
  v13 = "fdr2";
  if (*(_DWORD *)v28 != *(_DWORD *)"fdr2")
    goto LABEL_14;
  v10 = 512;
  if ((_QWORD)v29 && *((_QWORD *)&v29 + 1))
  {
    v26 = 0u;
    v27 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)&v29, 2u, (uint64_t)&DERFDRItemSpecs, (unint64_t)&v26, 0x20uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR2 Format (DERFDRItemSpecs)");
      return 0x8000000000000;
    }
    v12 = (unsigned __int8 *)v26;
    if (!(_QWORD)v26 || *((_QWORD *)&v26 + 1) != 4)
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR2 Format, invalid tag length");
      return 0x8000000000000;
    }
    v13 = "fdrd";
    if (*(_DWORD *)v26 != *(_DWORD *)"fdrd")
    {
LABEL_14:
      v14 = *v13;
      v24 = v12[2];
      v25 = v12[3];
      v22 = *v12;
      v23 = v12[1];
      v20 = v13[2];
      v21 = v13[3];
      v19 = v13[1];
      v15 = "%s: malformed FDR2 Format, expected tag %c%c%c%c found tag %c%c%c%c";
LABEL_15:
      AMFDRDecodeLogInternal(3, v15, "AMFDRDecodeFDR2Data", v14, v19, v20, v21, v22, v23, v24, v25);
      return 0x8000000000000;
    }
    v10 = 0;
    v17 = DWORD2(v27);
    *a3 = v27;
    *a4 = v17;
  }
  if (v30[0] && v30[1])
  {
    v26 = 0u;
    v27 = 0u;
    if (DERParseSequenceContentToObject(v30, 2u, (uint64_t)&DERFDRItemSpecs, (unint64_t)&v26, 0x20uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR2 Format (manifest2)");
      return 0x8000000000000;
    }
    if (!(_QWORD)v26 || *((_QWORD *)&v26 + 1) != 4)
    {
      AMFDRDecodeLogInternal(3, "%s: malformed FDR2 Format (manifest2), invalid tag length");
      return 0x8000000000000;
    }
    if (*(_DWORD *)v26 == *(_DWORD *)"mft2")
    {
      v18 = DWORD2(v27);
      *a5 = v27;
      *a6 = v18;
      return v10;
    }
    v14 = kFDRTagStr_mft2[0];
    v24 = *(unsigned __int8 *)(v26 + 2);
    v25 = *(unsigned __int8 *)(v26 + 3);
    v22 = *(unsigned __int8 *)v26;
    v23 = *(unsigned __int8 *)(v26 + 1);
    v20 = kFDRTagStr_mft2[2];
    v21 = kFDRTagStr_mft2[3];
    v19 = kFDRTagStr_mft2[1];
    v15 = "%s: malformed FDR2 Format (manifest2), expected tag %c%c%c%c found tag %c%c%c%c";
    goto LABEL_15;
  }
  return v10;
}

uint64_t AMFDRDecodeOfflineBlob(uint64_t a1, unsigned int a2, _QWORD *a3, _DWORD *a4, _QWORD *a5, _DWORD *a6, _QWORD *a7, _DWORD *a8)
{
  char *v14;
  uint64_t v15;
  int v17;
  int v18;
  int v19;
  unint64_t v20[2];
  unint64_t v21[4];
  _QWORD v22[2];

  memset(v21, 170, sizeof(v21));
  v20[0] = 0xAAAAAAAAAAAAAAAALL;
  v20[1] = 0xAAAAAAAAAAAAAAAALL;
  v22[0] = a1;
  v22[1] = a2;
  if (DERDecodeSeqInit((uint64_t)v22, v21, v20))
  {
    v14 = "%s: failed to decode offline blob Format";
  }
  else if (DERDecodeSeqNext(v20, &v21[1]))
  {
    v14 = "%s: failed to get CSR from offline blob";
  }
  else
  {
    if (v21[1] != 2)
      goto LABEL_16;
    v17 = v21[3];
    *a3 = v21[2];
    *a4 = v17;
    if (DERDecodeSeqNext(v20, &v21[1]))
    {
      v14 = "%s: failed to get CSR signature from offline blob";
      goto LABEL_5;
    }
    if (v21[1] != 2)
      goto LABEL_16;
    v18 = v21[3];
    *a5 = v21[2];
    *a6 = v18;
    if (DERDecodeSeqNext(v20, &v21[1]))
    {
      v14 = "%s: failed to get attestation from offline blob";
      goto LABEL_5;
    }
    if (v21[1] != 2)
    {
LABEL_16:
      v15 = 32;
      AMFDRDecodeLogInternal(3, "%s: malformed offline blob");
      return v15;
    }
    v19 = v21[3];
    *a7 = v21[2];
    *a8 = v19;
    if (DERDecodeSeqNext(v20, &v21[1]) == 1)
      return 0;
    v14 = "%s: unexepcted items in offline blob";
  }
LABEL_5:
  v15 = 16;
  AMFDRDecodeLogInternal(3, v14, "AMFDRDecodeOfflineBlob");
  return v15;
}

uint64_t AMFDRDecodeTrustEvaluation(uint64_t *a1, _QWORD *a2, _DWORD *a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  BOOL v26;
  BOOL v27;
  uint64_t (**v28)();
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v6 = malloc(0x7F8uLL);
  if (v6)
  {
    v7 = (uint64_t)v6;
    bzero(v6, 0x7F8uLL);
    if (a1)
    {
      v8 = *a1;
      if (*a1 && (v9 = *((unsigned int *)a1 + 2), (_DWORD)v9))
      {
        if (a2 && a3)
        {
          v10 = a1[18];
          if ((v10 & 0x801) != 0)
          {
            *(_QWORD *)(v7 + 8) = v8;
            *(_QWORD *)(v7 + 16) = v9;
          }
          else
          {
            *(_QWORD *)(v7 + 1944) = a1[2];
            *(_QWORD *)(v7 + 1952) = *((unsigned int *)a1 + 6);
            *(_QWORD *)(v7 + 24) = v8;
            *(_QWORD *)(v7 + 32) = v9;
            v13 = *((unsigned int *)a1 + 10);
            *(_QWORD *)(v7 + 280) = a1[4];
            *(_QWORD *)(v7 + 288) = v13;
          }
          v14 = *((unsigned int *)a1 + 14);
          *(_QWORD *)(v7 + 72) = a1[6];
          *(_QWORD *)(v7 + 80) = v14;
          v15 = *((unsigned int *)a1 + 18);
          *(_QWORD *)(v7 + 88) = a1[8];
          *(_QWORD *)(v7 + 96) = v15;
          if ((v10 & 0x80) != 0)
          {
            v18 = a1[12];
            v19 = *((unsigned int *)a1 + 26);
            v16 = v18;
            v17 = v19;
          }
          else
          {
            v16 = a1[10];
            v17 = *((unsigned int *)a1 + 22);
            v18 = a1[12];
            v19 = *((unsigned int *)a1 + 26);
          }
          *(_QWORD *)(v7 + 104) = v16;
          *(_QWORD *)(v7 + 112) = v17;
          v20 = *((unsigned int *)a1 + 34);
          *(_QWORD *)(v7 + 216) = a1[16];
          *(_QWORD *)(v7 + 224) = v20;
          v21 = *((unsigned int *)a1 + 66);
          *(_QWORD *)(v7 + 232) = a1[32];
          *(_QWORD *)(v7 + 240) = v21;
          *(_QWORD *)(v7 + 136) = v18;
          *(_QWORD *)(v7 + 144) = v19;
          v22 = a1[14];
          v23 = *((unsigned int *)a1 + 30);
          *(_QWORD *)(v7 + 168) = v22;
          *(_QWORD *)(v7 + 176) = v23;
          v24 = a1[26];
          if (v24 && (v25 = *((unsigned int *)a1 + 54), (_DWORD)v25))
          {
            *(_QWORD *)(v7 + 184) = v24;
            v23 = v25;
          }
          else
          {
            *(_QWORD *)(v7 + 184) = v22;
          }
          *(_QWORD *)(v7 + 192) = v23;
          *(_QWORD *)(v7 + 2016) = v10;
          if (v22)
            v26 = 1;
          else
            v26 = (_DWORD)v14 == 48;
          v27 = !v26 && (v10 & 0x20) == 0;
          v28 = kAMFDRDecodeImplementationSha1;
          if (!v27)
            v28 = kAMFDRDecodeImplementationSha384;
          *(_QWORD *)(v7 + 2008) = v28;
          if ((v10 & 0x100) != 0)
          {
            *(_QWORD *)(v7 + 2008) = kAMFDRDecodeImplementationSha384;
            v29 = *((unsigned int *)a1 + 58);
            *(_QWORD *)(v7 + 152) = a1[28];
            *(_QWORD *)(v7 + 160) = v29;
          }
          if ((v10 & 0x1000) != 0)
          {
            v30 = *((unsigned int *)a1 + 62);
            *(_QWORD *)(v7 + 120) = a1[30];
            *(_QWORD *)(v7 + 128) = v30;
          }
          *(_QWORD *)(v7 + 2024) = a1[19];
          v31 = a1[34];
          if (v31)
          {
            v32 = *((_DWORD *)a1 + 70);
            if (v32)
            {
              *(_QWORD *)(v7 + 344) = v31;
              *(_DWORD *)(v7 + 352) = v32;
            }
          }
          v11 = AMFDRDecodeEvaluateTrustInternal(v7);
          *a2 = *(_QWORD *)(v7 + 1912);
          *a3 = *(_QWORD *)(v7 + 1920);
          if (*(_BYTE *)(v7 + 2032))
          {
            v33 = *(_OWORD *)(v7 + 744);
            *((_OWORD *)a1 + 10) = *(_OWORD *)(v7 + 728);
            *((_OWORD *)a1 + 11) = v33;
            *((_OWORD *)a1 + 12) = *(_OWORD *)(v7 + 760);
          }
          v34 = a1[18];
          if ((v34 & 2) != 0 && (v11 & 0x2600000000100) != 0)
          {
            AMFDRDecodeLogInternal(4, "%s: ignoring unsealed error 0x%016llX", "AMFDRDecodeTrustEvaluation", v11 & 0x2600000000100);
            v11 &= 0xFFFD9FFFFFFFFEFFLL;
            v34 = a1[18];
          }
          if ((v34 & 4) != 0 && (v11 & 0x140000) != 0)
          {
            AMFDRDecodeLogInternal(4, "%s: ignoring trust object mismatch error 0x%016llX", "AMFDRDecodeTrustEvaluation", v11 & 0x140000);
            v11 &= 0xFFFFFFFFFFEBFFFFLL;
            v34 = a1[18];
          }
          if ((v34 & 8) != 0)
          {
            v35 = 0x8005A33C80;
            if ((v34 & 1) == 0)
              v35 = 0x8005A03C00;
            v36 = v35 & v11;
            if ((v35 & v11) != 0)
            {
              AMFDRDecodeLogInternal(4, "%s: ignoring raw error 0x%016llX", "AMFDRDecodeTrustEvaluation", v35 & v11);
              v11 ^= v36;
              v34 = a1[18];
            }
          }
          if ((v34 & 0x10) != 0 && (v11 & 0x1040000300000) != 0)
          {
            AMFDRDecodeLogInternal(4, "%s: ignoring offline signing verification error 0x%016llX", "AMFDRDecodeTrustEvaluation", v11 & 0x1040000300000);
            v11 &= 0xFFFEFBFFFFCFFFFFLL;
            v34 = a1[18];
          }
          if ((v34 & 0x40) != 0 && (v11 & 0x2C0100) != 0)
          {
            AMFDRDecodeLogInternal(4, "%s: ignoring no trustobject error 0x%016llX", "AMFDRDecodeTrustEvaluation", v11 & 0x2C0100);
            v11 &= 0xFFFFFFFFFFD3FEFFLL;
            v34 = a1[18];
          }
          if ((v34 & 0x4000) != 0 && (v11 & 0x1000000000000000) != 0)
          {
            AMFDRDecodeLogInternal(4, "%s: ignoring incomplete subcc error 0x%016llX", "AMFDRDecodeTrustEvaluation", v11 & 0x1000000000000000);
            v11 &= ~0x1000000000000000uLL;
          }
          goto LABEL_14;
        }
        AMFDRDecodeLogInternal(3, "%s: outRawData and outRawDataLength must be non NULL");
      }
      else
      {
        AMFDRDecodeLogInternal(3, "%s: ctx->inData must be non NULL and ctx->inDataLength must be non 0");
      }
    }
    else
    {
      AMFDRDecodeLogInternal(3, "%s: ctx must be non NULL");
    }
    v11 = 1;
LABEL_14:
    free((void *)v7);
    return v11;
  }
  AMFDRDecodeLogInternal(3, "%s: Failed to malloc fdrDecode", "AMFDRDecodeTrustEvaluation");
  return 0x80000000000000;
}

uint64_t AMFDRDecodeMetaProperty(uint64_t a1, unsigned int a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;
  int v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  unint64_t v12;
  __int128 v13;
  unint64_t v14[2];
  __int128 v15;

  v3 = 1;
  if (a1 && a2)
  {
    v14[0] = 0;
    v14[1] = 0;
    v13 = 0uLL;
    v12 = 0;
    *(_QWORD *)&v15 = a1;
    *((_QWORD *)&v15 + 1) = a2;
    if (DERDecodeSeqContentInit((unint64_t *)&v15, v14)
      || DERDecodeSeqNext(v14, &v12))
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse FDR property meta");
      return 16;
    }
    v15 = v13;
    if (DERDecodeSeqContentInit((unint64_t *)&v15, v14)
      || DERDecodeSeqNext(v14, &v12))
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse MinimalManifestMetaData");
      return 16;
    }
    v15 = v13;
    v10 = 0u;
    v11 = 0u;
    if (DERParseSequenceContentToObject((unint64_t *)&v15, 2u, (uint64_t)&DERFDRMetaPropertyItemSpecs, (unint64_t)&v10, 0x20uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: malformed metaProperty Format");
      return 16;
    }
    v15 = v11;
    if (DERDecodeSeqContentInit((unint64_t *)&v15, v14))
    {
      AMFDRDecodeLogInternal(3, "%s: can't parse content of MinimalManifestMetaData");
      return 16;
    }
    v3 = 34;
    while (1)
    {
      v6 = DERDecodeSeqNext(v14, &v12);
      if (v6)
        break;
      if (!*((_QWORD *)&v13 + 1))
        return 512;
      if (a3)
      {
        if (!(_QWORD)v10
          || *((_QWORD *)&v10 + 1) != 16
          || (*(_QWORD *)v10 == 0x2D6C616D696E696DLL ? (v7 = *(_QWORD *)(v10 + 8) == 0x74736566696E616DLL) : (v7 = 0),
              !v7))
        {
          AMFDRDecodeLogInternal(3, "%s: unsupported meta property type", "AMFDRDecodeMetaProperty");
          return v3;
        }
        v8 = a3(0);
        v3 = 32;
        if (v8)
        {
          v9 = v8;
          AMFDRDecodeLogInternal(3, "%s: metaPropertyCallback failed with error 0x%llX", "AMFDRDecodeMetaProperty", v8);
          return v9;
        }
      }
    }
    if (v6 == 1)
      return 0;
    else
      return 16;
  }
  return v3;
}

uint64_t AMFDRDecodeManifestBody(_QWORD *a1)
{
  __int128 v2;
  char *v3;
  int v5;
  unint64_t v6[3];
  __int128 v7;
  _BYTE v8[32];

  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)v8 = v2;
  *(_OWORD *)&v8[16] = v2;
  v7 = v2;
  memset(v6, 170, sizeof(v6));
  v5 = 0;
  v3 = (char *)malloc(0x1D8uLL);
  *a1 = v3;
  if (Img4DecodeInitManifest())
  {
    AMFDRDecodeLogInternal(3, "%s: can't decode manifest from Img4DecodeInitManifest, but it might be multi-manifest");
    return 2;
  }
  if (DERDecodeItem((uint64_t)(v3 + 280), v6))
  {
    AMFDRDecodeLogInternal(3, "%s: failed to decode the signed section");
    return 2;
  }
  if (v6[0] != 0x2000000000000011)
  {
    AMFDRDecodeLogInternal(3, "%s: signed section has an unexpected tag");
    return 2;
  }
  if (DERParseInteger((char **)v3 + 33, &v5))
  {
    AMFDRDecodeLogInternal(3, "%s: malformed Img4 Manifest (version parse fail)");
    return 2;
  }
  if (DERImg4DecodeFindProperty())
  {
    AMFDRDecodeLogInternal(3, "%s: failed to find MANB (manifest body) tag");
    return 2;
  }
  *(_OWORD *)(v3 + 56) = *(_OWORD *)&v8[8];
  if (DERDecodeSeqContentInit((unint64_t *)v3 + 7, (unint64_t *)v3))
  {
    AMFDRDecodeLogInternal(3, "%s: can't parse top-level container");
    return 2;
  }
  return 0;
}

uint64_t AMFDRDecodeManifestBodyNext(unint64_t **a1, _QWORD *a2, _DWORD *a3, _QWORD *a4, _DWORD *a5)
{
  unint64_t *v5;
  int v6;
  int ObjectPropertyData;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  __int128 v12;

  v12 = 0uLL;
  v11 = 0;
  v5 = *a1;
  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  v6 = DERDecodeSeqNext(v5, &v11);
  if (v6 == 1)
    return 0x40000000000000;
  if (v6)
  {
    v9 = "%s: can't parse DERDecodeSeqNext";
LABEL_13:
    v10 = 3;
    goto LABEL_15;
  }
  ObjectPropertyData = Img4DecodeGetObjectPropertyData();
  if (ObjectPropertyData == 1)
    return 0;
  if (ObjectPropertyData)
  {
    v9 = "%s: Img4DecodeGetObjectPropertyData failed";
    goto LABEL_13;
  }
  if (DERImg4DecodePropertyWithItem())
  {
    v9 = "%s: DERImg4DecodePropertyWithItem failed";
    goto LABEL_13;
  }
  if (!Img4DecodeEvaluateDictionaryProperties())
    return 0;
  v9 = "%s: failed to find corresponding data instance";
  v10 = 5;
LABEL_15:
  AMFDRDecodeLogInternal(v10, v9, "AMFDRDecodeManifestBodyNext");
  return 2;
}

uint64_t _AMFDRDecodeGetDataInstCallback(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t PropertyData;

  if (a4)
  {
    if (a1 == 1768846196)
    {
      PropertyData = Img4DecodeGetPropertyData();
      if ((_DWORD)PropertyData)
        AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_inst) failed.");
    }
    else
    {
      return 0;
    }
  }
  else
  {
    PropertyData = 6;
    AMFDRDecodeLogInternal(3, "%s: context is NULL");
  }
  return PropertyData;
}

uint64_t AMFDRDecodeManifestBodyDestroy(void *a1)
{
  if (a1)
    free(a1);
  return 0;
}

void AMFDRDecodeIterateSysconfigDestroy(void **a1)
{
  void *v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
    {
      free(v2);
      *a1 = 0;
    }
  }
}

uint64_t AMFDRDecodeIterateSysconfigBegin(uint64_t a1, unsigned int a2, _QWORD *a3, _BYTE *a4)
{
  uint64_t v4;
  _BYTE *v7;
  _QWORD *v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  int v14;
  uint64_t v16;
  _QWORD v17[2];

  v16 = 0;
  v4 = 1;
  if (!a1)
    return v4;
  if (!a2)
    return v4;
  if (!a3)
    return v4;
  v7 = a4;
  if (!a4)
    return v4;
  v9 = (_QWORD *)*a3;
  v10 = (_QWORD *)*a3;
  if (!*a3)
  {
    v10 = malloc(0x78uLL);
    if (!v10)
      return 0x80000000000000;
  }
  v10[14] = 0;
  *((_OWORD *)v10 + 5) = 0u;
  *((_OWORD *)v10 + 6) = 0u;
  *((_OWORD *)v10 + 3) = 0u;
  *((_OWORD *)v10 + 4) = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((_OWORD *)v10 + 2) = 0u;
  *(_OWORD *)v10 = 0u;
  v17[0] = a1;
  v17[1] = a2;
  v11 = DERParseSequenceToObject((uint64_t)v17, 5u, (uint64_t)&DERSysconfigItemSpecs, (unint64_t)(v10 + 1), 0x50uLL, 0);
  if (v11)
  {
    AMFDRDecodeLogInternal(3, "%s: failed to parse sysconfig sequence: %d", "AMFDRDecodeIterateSysconfigBegin", v11);
    v4 = 0x400000000000000;
    goto LABEL_32;
  }
  v12 = v10[2];
  if (v12 != 4)
  {
    AMFDRDecodeLogInternal(3, "%s: magic size is invalid: %lu", "AMFDRDecodeIterateSysconfigBegin", v12);
    v4 = 0x400000000000020;
    goto LABEL_32;
  }
  for (i = 3; i != -1; --i)
    *v7++ = *(_BYTE *)(v10[1] + i);
  if (v10[4] != 4)
  {
    AMFDRDecodeLogInternal(3, "%s: version size is invalid: %lu");
    goto LABEL_25;
  }
  v14 = *(_DWORD *)v10[3];
  if (!(_BYTE)v14)
  {
    AMFDRDecodeLogInternal(3, "%s: minor version not supported: 0x%x");
    goto LABEL_25;
  }
  if ((v14 & 0xFFFF00) != 0x30000)
  {
    AMFDRDecodeLogInternal(3, "%s: sysconfig version not supported: 0x%x");
LABEL_25:
    v4 = 0x402000000000000;
    goto LABEL_32;
  }
  if (DERDecodeSeqInit((uint64_t)(v10 + 5), &v16, v10 + 11))
  {
    v4 = 0x400000000000010;
    AMFDRDecodeLogInternal(3, "%s: failed to decode sysconfig payload: %d");
    goto LABEL_32;
  }
  if (v16 != 0x2000000000000011)
  {
    AMFDRDecodeLogInternal(3, "%s: invalid payload tag: 0x%llx");
LABEL_31:
    v4 = 0x400000000000040;
    goto LABEL_32;
  }
  if (!DERDecodeSeqInit((uint64_t)(v10 + 7), &v16, v10 + 13))
  {
    if (v16 == 0x2000000000000011)
    {
      v4 = 0;
      *(_BYTE *)v10 = 1;
      *a3 = v10;
      return v4;
    }
    AMFDRDecodeLogInternal(3, "%s: invalid metadata tag: 0x%llx");
    goto LABEL_31;
  }
  v4 = 0x400000000000010;
  AMFDRDecodeLogInternal(3, "%s: failed to decode sysconfig metadata: %d");
LABEL_32:
  if (!v9)
    free(v10);
  return v4;
}

uint64_t AMFDRDecodeIterateSysconfigPayloadNext(uint64_t a1, _BYTE *a2, _BYTE *a3, _QWORD *a4, _DWORD *a5, _BYTE *a6)
{
  uint64_t v6;
  _BYTE *v7;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t i;
  int v17;
  int v18;
  BOOL v19;
  _OWORD v20[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  unint64_t v24;
  unint64_t v25[2];

  v24 = 0;
  v25[0] = 0;
  v25[1] = 0;
  v22 = 0u;
  v23 = 0u;
  v21 = 0u;
  memset(v20, 0, sizeof(v20));
  v6 = 1;
  v19 = 0;
  if (!a3)
    return v6;
  if (!a1)
    return v6;
  v7 = a2;
  if (!a2 || !a4 || !a5)
    return v6;
  if (!*(_BYTE *)a1)
  {
    AMFDRDecodeLogInternal(3, "%s: sysconfig context is not initialized");
    return 0x400000000000000;
  }
  v12 = DERDecodeSeqNext((unint64_t *)(a1 + 88), &v24);
  if (v12 == 1)
    return 0x40000000000000;
  if (v12 || v24 != 0x2000000000000010)
  {
    AMFDRDecodeLogInternal(3, "%s: failed to decode payload: %d", "AMFDRDecodeIterateSysconfigPayloadNext", v12);
    return 0x400000000000040;
  }
  v13 = DERParseSequenceContentToObject(v25, 5u, (uint64_t)&DERSysconfigPayloadItemSpecs, (unint64_t)v20, 0x50uLL, 0);
  if (v13)
  {
    v6 = 0x400000000000010;
    AMFDRDecodeLogInternal(3, "%s: failed to parse payload content: %d", "AMFDRDecodeIterateSysconfigPayloadNext", v13);
    return v6;
  }
  if (*((_QWORD *)&v20[0] + 1) != 4)
  {
    AMFDRDecodeLogInternal(3, "%s: invalid key length: %lu", "AMFDRDecodeIterateSysconfigPayloadNext", *((_QWORD *)&v20[0] + 1));
    return 0x400000000000020;
  }
  v14 = *(_QWORD *)&v20[0];
  for (i = 3; i != -1; --i)
    *v7++ = *(_BYTE *)(v14 + i);
  if (DERParseBooleanWithDefault((unsigned __int8 **)&v23, 0, &v19))
  {
    AMFDRDecodeLogInternal(3, "%s: failed to parse BOOLean: %d");
    return 0x400000000000000;
  }
  if (v19)
  {
    v6 = 0;
    *a3 = 1;
  }
  else
  {
    v17 = DWORD2(v22);
    if (*((_QWORD *)&v22 + 1))
    {
      *a4 = v22;
      *a5 = v17;
      v6 = 0;
      if (a6)
        *a6 = 1;
    }
    else
    {
      v6 = 0;
      v18 = DWORD2(v21);
      *a4 = v21;
      *a5 = v18;
    }
  }
  return v6;
}

_OWORD *AMFDRDecodeCreateCertificate()
{
  _OWORD *v0;
  _OWORD *v1;

  v0 = malloc(0x130uLL);
  v1 = v0;
  if (v0)
  {
    v0[17] = 0u;
    v0[18] = 0u;
    v0[15] = 0u;
    v0[16] = 0u;
    v0[13] = 0u;
    v0[14] = 0u;
    v0[11] = 0u;
    v0[12] = 0u;
    v0[9] = 0u;
    v0[10] = 0u;
    v0[7] = 0u;
    v0[8] = 0u;
    v0[5] = 0u;
    v0[6] = 0u;
    v0[3] = 0u;
    v0[4] = 0u;
    v0[1] = 0u;
    v0[2] = 0u;
    *v0 = 0u;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: Failed to malloc empty certificate", "AMFDRDecodeCreateCertificate");
  }
  return v1;
}

void AMFDRDecodeDestoryCertificate(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t AMFDRDecodeGetTbsCertSubject(uint64_t a1)
{
  if (a1)
    return a1 + 128;
  else
    return 0;
}

uint64_t AMFDRDecodeGetTbsCertExtensions(uint64_t a1)
{
  if (a1)
    return a1 + 192;
  else
    return 0;
}

uint64_t AMFDRDecodeGetPubkey(uint64_t a1)
{
  if (a1)
    return a1 + 208;
  else
    return 0;
}

uint64_t AMFDRDecodeGetRawCertificate(uint64_t a1)
{
  if (a1)
    return a1 + 256;
  else
    return 0;
}

_QWORD *AMFDRDecodeCreateCertificateChain()
{
  _QWORD *v0;
  _QWORD *v1;

  v0 = malloc(0x18uLL);
  v1 = v0;
  if (v0)
  {
    *v0 = 0;
    v0[1] = 0;
    v0[2] = 0;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: Failed to malloc empty certificate chain", "AMFDRDecodeCreateCertificateChain");
  }
  return v1;
}

void AMFDRDecodeDestoryCertificateChain(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t _AMFDRDecodeVerifyTrustObject(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  uint64_t v7;
  _OWORD __s2[3];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 1944);
  if (!v2)
  {
    AMFDRDecodeLogInternal(3, "%s: FDR Trust Object is NULL", "_AMFDRDecodeVerifyTrustObject");
    v4 = 0x200000;
    goto LABEL_5;
  }
  v3 = AMFDRDecodeTrustObject(a1 + 1768, v2, *(_DWORD *)(a1 + 1952));
  if (!v3)
  {
    if (!*(_QWORD *)(a1 + 72))
    {
      AMFDRDecodeLogInternal(3, "%s: FDR Trust Object digest is NULL", "_AMFDRDecodeVerifyTrustObject");
      v4 = 0x40000;
      goto LABEL_5;
    }
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    __s2[1] = v6;
    __s2[2] = v6;
    __s2[0] = v6;
    v7 = *(_QWORD *)(a1 + 80);
    if (v7 == 48)
    {
      if (AMSupportDigestSha384())
      {
LABEL_11:
        AMFDRDecodeLogInternal(3, "%s: AMSupportDigestSha256 failed");
LABEL_16:
        v4 = 0x100000;
        goto LABEL_5;
      }
    }
    else
    {
      if (v7 != 32)
      {
        AMFDRDecodeLogInternal(3, "%s: FDR Trust Object digest size not supported. digest is of size %zu", "_AMFDRDecodeVerifyTrustObject", v7);
        v4 = 0x80000;
        goto LABEL_5;
      }
      if (AMSupportDigestSha256())
        goto LABEL_11;
    }
    if (!memcmp(*(const void **)(a1 + 72), __s2, *(_QWORD *)(a1 + 80)))
      return 0;
    AMFDRDecodeLogInternal(3, "%s: FDR Trust Object digest mismatch.");
    goto LABEL_16;
  }
  v4 = v3;
  AMFDRDecodeLogInternal(3, "%s: malformed FDR Trust Object Format", "_AMFDRDecodeVerifyTrustObject");
LABEL_5:
  *(_QWORD *)a1 |= v4;
  return v4;
}

uint64_t _AMFDRDecodeVerifySealingManifestCallback(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  if (a1 <= 1717660002)
  {
    switch(a1)
    {
      case 1145525076:
        if (Img4DecodeGetPropertyData())
        {
          v5 = 3;
          AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kImg4Tag_DGST) failed.", "_AMFDRDecodeVerifySealingManifestCallback");
          v6 = *(_QWORD *)a4 | 0x80000000;
          goto LABEL_35;
        }
        v5 = 0;
        *(_QWORD *)(a4 + 1992) = 0xAAAAAAAAAAAAAAAALL;
        *(_DWORD *)(a4 + 2000) = 0;
        return v5;
      case 1400000109:
        return 0;
      case 1668047219:
        if (Img4DecodeGetPropertyData())
        {
          v5 = 3;
          AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_clas) failed.", "_AMFDRDecodeVerifySealingManifestCallback");
          v6 = *(_QWORD *)a4 | 0x20000000;
LABEL_35:
          *(_QWORD *)a4 = v6;
          return v5;
        }
        v5 = 0;
        *(_QWORD *)(a4 + 1960) = 0xAAAAAAAAAAAAAAAALL;
        *(_DWORD *)(a4 + 1968) = 0;
        return v5;
    }
LABEL_18:
    v7 = 1;
    while (v7 != 48)
    {
      v8 = kFDRKnownTag[v7++];
      if (v8 == a1)
      {
        if ((unint64_t)(v7 - 2) < 0x2F)
          return 0;
        break;
      }
    }
    AMFDRDecodeLogInternal(7, "%s: Unsupported tag found in manifest '%c%c%c%c'", "_AMFDRDecodeVerifySealingManifestCallback", (a1 >> 24), (a1 << 8 >> 24), ((__int16)a1 >> 8), (char)a1);
    return 0;
  }
  if (a1 == 1717660003)
  {
    if (Img4DecodeGetPropertyBoolean())
    {
      v5 = 3;
      AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_faic) failed.", "_AMFDRDecodeVerifySealingManifestCallback");
      v6 = *(_QWORD *)a4 | 0x400000000;
      goto LABEL_35;
    }
    v5 = 0;
    *(_BYTE *)(a4 + 2004) = 0;
    return v5;
  }
  if (a1 == 1768846196)
  {
    if (Img4DecodeGetPropertyData())
    {
      AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_inst) failed.", "_AMFDRDecodeVerifySealingManifestCallback");
      v5 = 0;
      v6 = *(_QWORD *)a4 | 0x40000000;
      goto LABEL_35;
    }
    v5 = 0;
    *(_QWORD *)(a4 + 1976) = 0xAAAAAAAAAAAAAAAALL;
    *(_DWORD *)(a4 + 1984) = 0;
    return v5;
  }
  if (a1 != 1886546276)
    goto LABEL_18;
  if (Img4DecodeGetPropertyData())
  {
    v5 = 3;
    AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_prid) failed.", "_AMFDRDecodeVerifySealingManifestCallback");
    v6 = *(_QWORD *)a4 | 0x2000;
    goto LABEL_35;
  }
  *(_QWORD *)(a4 + 200) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)(a4 + 208) = 0;
  if (!*(_QWORD *)(a4 + 1944) || !*(_QWORD *)(a4 + 1952))
  {
    AMFDRDecodeLogInternal(4, "%s: Skipping revocation check (trustobject unset)", "_AMFDRDecodeVerifySealingManifestCallback");
    v5 = 0;
    v6 = *(_QWORD *)a4 | 0x200000;
    goto LABEL_35;
  }
  v9 = AMFDRDecodeCheckProducerIDRevocation(a4 + 1768, 0xAAAAAAAAAAAAAAAALL, 0);
  v5 = v9;
  if (v9)
  {
    AMFDRDecodeLogInternal(3, "%s: AMFDRDecodeCheckProducerIDRevocation failed with error 0x%016llX", "_AMFDRDecodeVerifySealingManifestCallback", v9);
    *(_QWORD *)a4 |= v5;
    if ((v5 & 0xFFFFFFFFBFFFFFFFLL) != 0)
      return 3;
    else
      return 0;
  }
  return v5;
}

uint64_t _AMFDRDecodeVerifySealingRequestCallback(int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  char *v10;
  char *v11;
  uint64_t v12;

  if (!a4)
    return 1;
  if (a1 <= 1668047218)
  {
    if (a1 != 1145525076)
    {
      if (a1 != 1400000109)
      {
LABEL_12:
        v8 = 1;
        while (v8 != 48)
        {
          v9 = kFDRKnownTag[v8++];
          if (v9 == a1)
          {
            if ((unint64_t)(v8 - 2) < 0x2F)
              return 0;
            break;
          }
        }
        AMFDRDecodeLogInternal(7, "%s: Unsupported tag found in manifest '%c%c%c%c'", "_AMFDRDecodeVerifySealingRequestCallback", (a1 >> 24), (a1 << 8 >> 24), ((__int16)a1 >> 8), (char)a1);
      }
      return 0;
    }
    if (Img4DecodeGetPropertyData())
    {
      v11 = "%s: Img4DecodeGetPropertyData(kImg4Tag_DGST) failed.";
    }
    else if (*(_BYTE *)(a4 + 1312))
    {
      if (**(_QWORD **)(*(_QWORD *)(a4 + 2008) + 32))
      {
        v11 = "%s: propertyLength != AMFDRDigestSize";
      }
      else
      {
        if (!memcmp(0, (const void *)(a4 + 1496), 0))
          return 0;
        v11 = "%s: propertyValue != fdrDecode->sealingManifestImg4.payload.hash";
      }
    }
    else
    {
      v11 = "%s: fdrDecode->sealingRequestImg4.payload_hashed is false";
    }
    v6 = 3;
    AMFDRDecodeLogInternal(3, v11, "_AMFDRDecodeVerifySealingRequestCallback");
    v7 = *(_QWORD *)a4 | 0x4000000000;
    goto LABEL_36;
  }
  if (a1 == 1668047219)
  {
    if (Img4DecodeGetPropertyData())
      v10 = "%s: Img4DecodeGetPropertyData(kFDRTag_clas) failed.";
    else
      v10 = "%s: propertyLength != kImg4TagSize";
    v6 = 3;
    AMFDRDecodeLogInternal(3, v10, "_AMFDRDecodeVerifySealingRequestCallback");
    v7 = *(_QWORD *)a4 | 0x1000000000;
    goto LABEL_36;
  }
  if (a1 != 1717660003)
  {
    if (a1 == 1768846196)
    {
      if (Img4DecodeGetPropertyData())
      {
        v5 = "%s: Img4DecodeGetPropertyData(kFDRTag_inst) failed.";
LABEL_8:
        v6 = 3;
        AMFDRDecodeLogInternal(3, v5, "_AMFDRDecodeVerifySealingRequestCallback");
        v7 = *(_QWORD *)a4 | 0x2000000000;
LABEL_36:
        *(_QWORD *)a4 = v7;
        return v6;
      }
      v12 = *(_QWORD *)(a4 + 144);
      if (v12)
      {
        v6 = 3;
        AMFDRDecodeLogInternal(3, "%s: kFDRTag_inst propertyLength (%d) != fdrDecode->manifestUniqueID.length (%zu)", "_AMFDRDecodeVerifySealingRequestCallback", 0, v12);
        v7 = *(_QWORD *)a4 | 0x40000000;
        goto LABEL_36;
      }
      if (memcmp(0, *(const void **)(a4 + 136), 0))
      {
        v5 = "%s: kFDRTag_inst propertyValue != fdrDecode->manifestUniqueID.data";
        goto LABEL_8;
      }
      return 0;
    }
    goto LABEL_12;
  }
  if (Img4DecodeGetPropertyBoolean())
  {
    v6 = 3;
    AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_faic) failed.", "_AMFDRDecodeVerifySealingRequestCallback");
    v7 = *(_QWORD *)a4 | 0x400000000;
    goto LABEL_36;
  }
  v6 = 0;
  *(_BYTE *)(a4 + 2004) = 0;
  return v6;
}

uint64_t _AMFDRDecodeFilterDataInstanceCallback(int a1, uint64_t a2, int a3, _WORD *a4)
{
  uint64_t PropertyData;
  uint64_t v7;

  if (!*(_QWORD *)a4)
  {
    AMFDRDecodeLogInternal(3, "%s: fdrDecode is NULL", "_AMFDRDecodeFilterDataInstanceCallback");
    return 6;
  }
  if (!a2)
  {
    AMFDRDecodeLogInternal(3, "%s: property is NULL", "_AMFDRDecodeFilterDataInstanceCallback");
    **(_QWORD **)a4 |= 1uLL;
    return 6;
  }
  if (a1 != 1768846196)
    return 0;
  PropertyData = Img4DecodeGetPropertyData();
  if ((_DWORD)PropertyData)
  {
    v7 = PropertyData;
    AMFDRDecodeLogInternal(3, "%s: Img4DecodeGetPropertyData(kFDRTag_inst) failed.", "_AMFDRDecodeFilterDataInstanceCallback");
    **(_QWORD **)a4 |= 0x4000uLL;
    return v7;
  }
  if (a3 != 1)
  {
    AMFDRDecodeLogInternal(3, "%s: unexpected property type != kImg4ObjectProperty", "_AMFDRDecodeFilterDataInstanceCallback");
    return 0;
  }
  if ((_AMFDRDecodeInstPropertyMatchingWithType((_DWORD *)0xAAAAAAAAAAAAAAAALL, 0, *(void **)(*(_QWORD *)a4 + 104), *(_QWORD *)(*(_QWORD *)a4 + 112), *(const void **)(*(_QWORD *)a4 + 184), *(_QWORD *)(*(_QWORD *)a4 + 192), 1, *(_QWORD **)a4) & 1) != 0)
  {
    AMFDRDecodeLogInternal(6, "%s: kFDRTag_inst property == fdrDecode->uniqueID, found corresponding Data Instance.", "_AMFDRDecodeFilterDataInstanceCallback");
    v7 = 0;
    a4[4] = 1;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: kFDRTag_inst property != fdrDecode->uniqueID", "_AMFDRDecodeFilterDataInstanceCallback");
    v7 = 0;
    a4[4] = 256;
  }
  return v7;
}

uint64_t _AMFDRDecodeInstPropertyMatchingWithType(_DWORD *a1, uint64_t a2, void *__s2, size_t __n, const void *a5, size_t a6, int a7, _QWORD *a8)
{
  uint64_t v11;
  char *v12;
  uint64_t v13;
  size_t v14;
  _DWORD *v15;
  uint64_t result;
  uint64_t v17;
  size_t v18;

  if (a8)
  {
    v11 = a8[252];
    if ((v11 & 0x100) != 0 && a8[19] && a8[20] && (!a7 || (v11 & 0x80) != 0))
    {
      a6 = 0;
      a5 = 0;
      __n = a8[20];
      __s2 = (void *)a8[19];
    }
  }
  if (a2 < 5 || *a1 != 762014067)
  {
    if (__n != a2)
    {
      v17 = a2;
      v18 = __n;
      v12 = "%s: kFDRTag_inst propertyLength (%d) != instLength (%zu)";
      goto LABEL_14;
    }
    if (memcmp(a1, __s2, __n))
    {
      v12 = "%s: kFDRTag_inst propertyValue != instValue";
LABEL_14:
      v13 = 4;
LABEL_20:
      AMFDRDecodeLogInternal(v13, v12, "_AMFDRDecodeInstPropertyMatching", v17, v18);
      return 0;
    }
    return 1;
  }
  v14 = (a2 - 4);
  if (__n >= v14)
  {
    v17 = (a2 - 4);
    v18 = __n;
    v12 = "%s: kFDRTag_inst propertyLength (sik) (%d) <= instLength (%zu)";
    goto LABEL_19;
  }
  v15 = a1 + 1;
  if (memcmp(a1 + 1, __s2, __n))
  {
    v12 = "%s: kFDRTag_inst propertyValue (sik) != instValue";
    goto LABEL_19;
  }
  if (*((_BYTE *)v15 + __n) != 45)
  {
    v12 = "%s: kFDRTag_inst propertyValue missing expected -";
    goto LABEL_19;
  }
  result = 1;
  if (a6 && a5)
  {
    if (a6 == (_DWORD)v14 + ~(_DWORD)__n)
    {
      if (!memcmp((char *)v15 + __n + 1, a5, a6))
        return 1;
      v12 = "%s: kFDRTag_inst propertyValue (sik) != sikValue";
    }
    else
    {
      v17 = (v14 + ~(_DWORD)__n);
      v18 = a6;
      v12 = "%s: kFDRTag_inst propertyLength (sik) (%d) != sikLength (%zu)";
    }
LABEL_19:
    v13 = 3;
    goto LABEL_20;
  }
  return result;
}

uint64_t _AMFDRDecodeSearchEntryFromPropertyList(uint64_t a1, uint64_t a2, int a3, _QWORD *a4)
{
  __int128 v6;
  uint64_t result;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  unint64_t v12[2];
  unint64_t v13[2];
  uint64_t v14;
  _QWORD v15[2];

  v15[0] = a1;
  v15[1] = a2;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v9 = v6;
  v10 = v6;
  v14 = 0;
  v13[0] = 0;
  v13[1] = 0;
  v12[0] = 0;
  v12[1] = 0;
  v11 = 0;
  if (DERDecodeSeqInit((uint64_t)v15, &v14, v13) || v14 != 0x2000000000000011)
  {
    AMFDRDecodeLogInternal(3, "%s: failed to parse property list");
    return 2;
  }
  if (DERDecodeSeqNext(v13, &v11))
  {
LABEL_8:
    AMFDRDecodeLogInternal(3, "%s: cannot find tag in property list");
    return 2;
  }
  while (1)
  {
    v9 = 0u;
    v10 = 0u;
    if (DERParseSequenceContentToObject(v12, 2u, (uint64_t)&DERFDRItemSpecs, (unint64_t)&v9, 0x20uLL, 0))
    {
      AMFDRDecodeLogInternal(3, "%s: failed to decode subCC digests sequence");
      return 2;
    }
    if (*((_QWORD *)&v9 + 1) == 4 && AMFDRTagsStringToTag((unsigned int *)v9) == a3)
      break;
    if (DERDecodeSeqNext(v13, &v11))
      goto LABEL_8;
  }
  if (a4)
  {
    result = 0;
    v8 = *((_QWORD *)&v10 + 1);
    *a4 = v10;
    a4[1] = v8;
  }
  else
  {
    AMFDRDecodeLogInternal(3, "%s: outValue is NULL", "_AMFDRDecodeSearchEntryFromPropertyList");
    return 1;
  }
  return result;
}

uint64_t _AMFDRDecodeVerifyData(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (**v13)();
  char *v14;
  uint64_t (**v15)();
  unsigned __int16 *v16;
  int v17;
  int v18;
  uint64_t (**v20)();
  uint64_t v21;
  int v22;
  int v23;

  v23 = 0;
  v2 = a1[252];
  if ((~*((_DWORD *)a1 + 504) & 0x1080) == 0)
  {
    AMFDRDecodeLogInternal(3, "%s: cannot set kAMFDRDecodeOptionManifestOnly and kAMFDRDecodeOptionSubCCOnly at the same time");
    goto LABEL_68;
  }
  if ((v2 & 0x80) != 0)
  {
    if (!Img4DecodeInitManifest())
      goto LABEL_5;
    goto LABEL_7;
  }
  v3 = a1[3];
  v4 = a1[4];
  if ((v2 & 0x1000) == 0)
  {
    if (!Img4DecodeInit())
    {
LABEL_5:
      v2 = a1[252];
      goto LABEL_9;
    }
LABEL_7:
    AMFDRDecodeLogInternal(3, "%s: FDR failed to decode Data img4");
LABEL_18:
    v6 = *a1;
    v7 = 83901440;
LABEL_19:
    result = v6 | v7;
    *a1 = v6 | v7;
    v9 = a1[4];
    a1[239] = a1[3];
    a1[240] = v9;
    return result;
  }
  a1[106] = 0;
  *((_OWORD *)a1 + 51) = 0u;
  *((_OWORD *)a1 + 52) = 0u;
  *((_OWORD *)a1 + 49) = 0u;
  *((_OWORD *)a1 + 50) = 0u;
  *((_OWORD *)a1 + 47) = 0u;
  *((_OWORD *)a1 + 48) = 0u;
  *((_OWORD *)a1 + 45) = 0u;
  *((_OWORD *)a1 + 46) = 0u;
  *((_OWORD *)a1 + 43) = 0u;
  *((_OWORD *)a1 + 44) = 0u;
  *((_OWORD *)a1 + 41) = 0u;
  *((_OWORD *)a1 + 42) = 0u;
  *((_OWORD *)a1 + 39) = 0u;
  *((_OWORD *)a1 + 40) = 0u;
  *((_OWORD *)a1 + 37) = 0u;
  *((_OWORD *)a1 + 38) = 0u;
  *((_OWORD *)a1 + 35) = 0u;
  *((_OWORD *)a1 + 36) = 0u;
  *((_OWORD *)a1 + 33) = 0u;
  *((_OWORD *)a1 + 34) = 0u;
  *((_OWORD *)a1 + 31) = 0u;
  *((_OWORD *)a1 + 32) = 0u;
  *((_OWORD *)a1 + 29) = 0u;
  *((_OWORD *)a1 + 30) = 0u;
  *((_OWORD *)a1 + 27) = 0u;
  *((_OWORD *)a1 + 28) = 0u;
  *((_OWORD *)a1 + 25) = 0u;
  *((_OWORD *)a1 + 26) = 0u;
  a1[51] = v3;
  a1[52] = v4;
  a1[61] = (uint64_t)"IM4P";
  a1[62] = 4;
  a1[67] = v3;
  a1[68] = v4;
LABEL_9:
  v5 = a1[35];
  if ((v2 & 0x1000) != 0)
  {
    if (v5)
      goto LABEL_16;
    AMFDRDecodeLogInternal(3, "%s: trust evaluation on subCC requires a reStitchManifest");
LABEL_68:
    result = *a1 | 1;
    goto LABEL_36;
  }
  if (!v5)
  {
    if ((v2 & 0x1000) == 0)
      goto LABEL_12;
LABEL_21:
    v23 = AMFDRTagsStringToTag((unsigned int *)a1[11]);
    goto LABEL_22;
  }
LABEL_16:
  *(_OWORD *)(a1 + 53) = *(_OWORD *)(a1 + 35);
  if (DERImg4DecodeManifest())
  {
    AMFDRDecodeLogInternal(3, "%s: FDR failed to decode manifestOverride");
    goto LABEL_18;
  }
  v2 = a1[252];
  if ((v2 & 0x1000) != 0)
    goto LABEL_21;
LABEL_12:
  if ((v2 & 0x80) == 0)
  {
    if (Img4DecodeGetPayloadType())
    {
      AMFDRDecodeLogInternal(3, "%s: FDR failed to get payload type");
      goto LABEL_18;
    }
    if (a1[66] != 3)
    {
      AMFDRDecodeLogInternal(3, "%s: Payload version is wrong size. got %zu expected %d");
      goto LABEL_50;
    }
    v16 = (unsigned __int16 *)a1[65];
    v17 = *v16;
    v18 = *((unsigned __int8 *)v16 + 2);
    if (v17 != 11825 || v18 != 48)
    {
      AMFDRDecodeLogInternal(3, "%s: Payload version mismatch");
LABEL_50:
      v6 = *a1;
      v7 = 0x8005001C00;
      goto LABEL_19;
    }
  }
LABEL_22:
  v10 = (unsigned int *)a1[11];
  if (!v10)
    goto LABEL_25;
  if ((unint64_t)(a1[12] - 3) >= 2)
  {
    AMFDRDecodeLogInternal(3, "%s: Invalid data class length");
LABEL_35:
    result = *a1 | 0x100000004000C00;
LABEL_36:
    *a1 = result;
    return result;
  }
  if (AMFDRTagsStringToTag(v10) != v23)
  {
    AMFDRDecodeLogInternal(3, "%s: Payload type mismatch");
    goto LABEL_35;
  }
LABEL_25:
  v11 = *a1;
  if ((a1[252] & 0x80) != 0)
  {
    if (!Img4DecodePerformManifestTrustEvaluationWithCallbacks())
      goto LABEL_59;
  }
  else if (!Img4DecodePerformTrustEvaluationWithCallbacks())
  {
    goto LABEL_59;
  }
  v12 = *a1;
  if ((*a1 & 0x1000000000000) == 0)
  {
LABEL_54:
    AMFDRDecodeLogInternal(3, "%s: FDR data trust evaluation failed.", "_AMFDRDecodeVerifyData");
    if (!*a1)
      *a1 = 0x100000000000;
    goto LABEL_61;
  }
  v13 = (uint64_t (**)())a1[251];
  if (v13 == kAMFDRDecodeImplementationSha1)
  {
    v14 = "%s: Evaluation returned code=0x%016llX, re-evaluate with FDR 2.0 format";
    v15 = kAMFDRDecodeImplementationSha384;
    goto LABEL_44;
  }
  if (v13 == kAMFDRDecodeImplementationSha384)
  {
    v14 = "%s: Evaluation returned code=0x%016llX, re-evaluate with FDR 1.0 format";
    v15 = kAMFDRDecodeImplementationSha1;
LABEL_44:
    a1[251] = (uint64_t)v15;
    AMFDRDecodeLogInternal(4, v14, "_AMFDRDecodeVerifyData", v12);
  }
  v20 = (uint64_t (**)())a1[251];
  if (v20 != kAMFDRDecodeImplementationSha1 && v20 != kAMFDRDecodeImplementationSha384)
    goto LABEL_54;
  v21 = *a1;
  *a1 = v11;
  *((_BYTE *)a1 + 400) = 0;
  if ((a1[252] & 0x80) != 0)
    v22 = Img4DecodePerformManifestTrustEvaluationWithCallbacks();
  else
    v22 = Img4DecodePerformTrustEvaluationWithCallbacks();
  if (v22)
  {
    AMFDRDecodeLogInternal(4, "%s: Re-evaluation returned code=0x%016llX", "_AMFDRDecodeVerifyData", *a1);
    *a1 = v21;
    goto LABEL_54;
  }
  if ((a1[252] & 0x20) != 0)
  {
    AMFDRDecodeLogInternal(3, "%s: Re-evaluation succeeded but decode options require version2", "_AMFDRDecodeVerifyData");
    *a1 |= 0x2000000000000uLL;
  }
  else
  {
    AMFDRDecodeLogInternal(4, "%s: Re-evaluation succeeded", "_AMFDRDecodeVerifyData");
  }
LABEL_59:
  if (*((_BYTE *)a1 + 401))
    *((_BYTE *)a1 + 2032) = 1;
LABEL_61:
  if ((*((_BYTE *)a1 + 2017) & 0x10) != 0)
  {
    result = *a1;
    if (!*((_BYTE *)a1 + 376))
    {
      result |= 0x1000000000000000uLL;
      *a1 = result;
    }
  }
  else
  {
    result = *a1;
  }
  a1[239] = a1[67];
  a1[240] = a1[68];
  return result;
}

uint64_t _AMFDRDecodeMultiCombined(uint64_t a1)
{
  __int128 v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  size_t v12;
  uint64_t v13;
  void *__s1[2];
  __int128 v15;
  size_t v16[2];
  size_t __n[2];
  unint64_t v18[3];
  int v19;
  unint64_t v20;
  unsigned int v21;
  _QWORD v22[2];
  unint64_t v23;
  unint64_t v24[2];
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  unint64_t v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v22[0] = 0xAAAAAAAAAAAAAAAALL;
  v22[1] = 0xAAAAAAAAAAAAAAAALL;
  v56 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v54 = v2;
  v55 = v2;
  v52 = v2;
  v53 = v2;
  v50 = v2;
  v51 = v2;
  v48 = v2;
  v49 = v2;
  v46 = v2;
  v47 = v2;
  v44 = v2;
  v45 = v2;
  v42 = v2;
  v43 = v2;
  v40 = v2;
  v41 = v2;
  v38 = v2;
  v39 = v2;
  v36 = v2;
  v37 = v2;
  v34 = v2;
  v35 = v2;
  v32 = v2;
  v33 = v2;
  v30 = v2;
  v31 = v2;
  v28 = v2;
  v29 = v2;
  v21 = 0;
  v20 = 0xAAAAAAAAAAAAAAAALL;
  v19 = 0;
  memset(v18, 170, sizeof(v18));
  *(_OWORD *)v16 = v2;
  *(_OWORD *)__n = v2;
  *(_OWORD *)__s1 = v2;
  v15 = v2;
  v26 = 0;
  v27 = 0;
  v24[1] = 0;
  v25 = 0;
  v23 = 0;
  v24[0] = 0;
  if (DERDecodeItem(a1 + 24, &v25))
  {
    AMFDRDecodeLogInternal(3, "%s: failed to decode FDR Multi Combined Format", "_AMFDRDecodeMultiCombined");
    *(_QWORD *)a1 |= 0x80uLL;
    return 128;
  }
  if (v25 != 0x2000000000000010)
  {
    AMFDRDecodeLogInternal(3, "%s: FDR Multi Combined Format unexpected tag: %llu", "_AMFDRDecodeMultiCombined", v25);
    *(_QWORD *)a1 |= 0x10000uLL;
    return 0x10000;
  }
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(_QWORD *)(a1 + 32);
  if (v4 + v5 < (unint64_t)(v26 + v27))
  {
    AMFDRDecodeLogInternal(3, "%s: item is bigger on the inside", "_AMFDRDecodeMultiCombined");
    *(_QWORD *)a1 |= 4uLL;
    return 4;
  }
  if (v4 + v5 > (unint64_t)(v26 + v27))
  {
    AMFDRDecodeLogInternal(3, "%s: Buffer contains %lu unused bytes", "_AMFDRDecodeMultiCombined", v5 - v27);
    *(_QWORD *)a1 |= 8uLL;
    return 8;
  }
  if (Img4DecodeInit())
  {
    AMFDRDecodeLogInternal(3, "%s: FDR failed to decode multi combined Data img4");
    return 0x2000;
  }
  if (Img4DecodeGetManifest())
  {
    AMFDRDecodeLogInternal(3, "%s: FDR failed to get manifest from multi combined data");
    return 0x2000;
  }
  if (Img4DecodeGetPayloadType())
  {
    AMFDRDecodeLogInternal(3, "%s: FDR failed to get payload type from multi combined data");
    return 0x2000;
  }
  if (v19 != AMFDRTagsStringToTag((unsigned int *)"mcmb"))
  {
    AMFDRDecodeLogInternal(3, "%s: multi combined payload type is not mcmb");
    return 0x20000;
  }
  if (Img4DecodeGetPayload())
  {
    AMFDRDecodeLogInternal(3, "%s: FDR failed to get payload from multi combined data");
    return 0x2000;
  }
  if (DERDecodeSeqInit((uint64_t)v22, &v18[2], v18) || v18[2] != 0x2000000000000011)
  {
    AMFDRDecodeLogInternal(3, "%s: payload sequence malformed for multi combined data");
    return 0x20000;
  }
  if (*(_QWORD *)(a1 + 104) && *(_QWORD *)(a1 + 112))
  {
    v7 = 0;
  }
  else
  {
    if ((*(_BYTE *)(a1 + 2017) & 0x20) == 0)
    {
      AMFDRDecodeLogInternal(3, "%s: no data instance is specified when looking for data in multi combined format", "_AMFDRDecodeMultiCombined");
      return 1;
    }
    v7 = 1;
  }
  if (DERDecodeSeqNext(v18, &v23))
    goto LABEL_57;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  while (1)
  {
    while (1)
    {
      *(_OWORD *)v16 = 0u;
      *(_OWORD *)__n = 0u;
      *(_OWORD *)__s1 = 0u;
      v15 = 0u;
      if (DERParseSequenceContentToObject(v24, 4u, (uint64_t)&DERFDRMultiCombinedItemSpecs, (unint64_t)__s1, 0x40uLL, 0))
      {
        AMFDRDecodeLogInternal(3, "%s: MultiCombinedItem malformed for multi combined data");
        return 0x20000;
      }
      if (__s1[1] != *(void **)(a1 + 96)
        || memcmp(__s1[0], *(const void **)(a1 + 88), (size_t)__s1[1])
        || (v7 & 1) == 0
        && (v16[1] != *(_QWORD *)(a1 + 112) || memcmp((const void *)v16[0], *(const void **)(a1 + 104), v16[1]))
        || __n[1] != *(_QWORD *)(a1 + 128))
      {
        goto LABEL_34;
      }
      v11 = *(const void **)(a1 + 120);
      if (__n[0])
        break;
      if (!v11)
        goto LABEL_46;
LABEL_34:
      if (DERDecodeSeqNext(v18, &v23))
      {
        if ((v8 & 1) == 0)
          goto LABEL_57;
        goto LABEL_51;
      }
    }
    if (!v11 || memcmp((const void *)__n[0], v11, __n[1]))
      goto LABEL_34;
LABEL_46:
    if ((v7 & 1) == 0)
    {
      AMFDRDecodeLogInternal(5, "%s: found data in multi combined format", "_AMFDRDecodeMultiCombined");
      v9 = *((_QWORD *)&v15 + 1);
      v10 = v15;
LABEL_51:
      result = 0;
      v13 = v21;
      *(_QWORD *)(a1 + 280) = v20;
      *(_QWORD *)(a1 + 288) = v13;
      *(_QWORD *)(a1 + 24) = v10;
      *(_QWORD *)(a1 + 32) = v9;
      return result;
    }
    if ((v8 & 1) != 0)
      break;
    v12 = v16[1];
    *(_QWORD *)(a1 + 104) = v16[0];
    *(_QWORD *)(a1 + 112) = v12;
    AMFDRDecodeLogInternal(5, "%s: found data in multi combined format", "_AMFDRDecodeMultiCombined");
    v9 = *((_QWORD *)&v15 + 1);
    v10 = v15;
    v8 = 1;
    if (DERDecodeSeqNext(v18, &v23))
      goto LABEL_51;
  }
  AMFDRDecodeLogInternal(3, "%s: found multiple entries that match, uniqueID is required in this case", "_AMFDRDecodeMultiCombined");
  *(_QWORD *)a1 |= 0x4000uLL;
LABEL_57:
  AMFDRDecodeLogInternal(3, "%s: cannot find data in multi combined format", "_AMFDRDecodeMultiCombined");
  return 512;
}

uint64_t _AMFDRDecodeVerifySignatureDataWithOid(const void *a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8, uint64_t a9, char a10, _QWORD *a11)
{
  uint64_t result;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  size_t v18;
  const void *v19;
  unint64_t v20;
  __int128 v21;
  _OWORD v22[3];
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v22[0] = a7;
  *((_QWORD *)&v22[0] + 1) = a8;
  if (DEROidCompare((uint64_t)v22, (uint64_t)&oidSha1Rsa))
  {
    memset(&v22[1], 170, 20);
    if (AMSupportDigestSha1())
      return 0xFFFFFFFFLL;
    result = AMSupportRsaVerifySignatureSha1();
    if (!a11)
      goto LABEL_36;
LABEL_33:
    if ((_DWORD)result != 2)
      goto LABEL_36;
    *a11 |= 0x80000000000000uLL;
    return 0xFFFFFFFFLL;
  }
  if (DEROidCompare((uint64_t)v22, (uint64_t)&oidSha256Rsa))
  {
    *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22[1] = v14;
    v22[2] = v14;
    if (AMSupportDigestSha256())
      return 0xFFFFFFFFLL;
    result = AMSupportRsaVerifySignatureSha256();
    if (a11)
      goto LABEL_33;
    goto LABEL_36;
  }
  if (!DEROidCompare((uint64_t)v22, (uint64_t)&oidSha384Rsa))
  {
    if (DEROidCompare((uint64_t)v22, (uint64_t)&oidSha256Ecdsa))
    {
      *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v22[1] = v16;
      v22[2] = v16;
      v20 = 0;
      v21 = 0uLL;
      if (!a9)
      {
        AMFDRDecodeLogInternal(3, "%s: publicKeyParam is NULL!!");
        return 0xFFFFFFFFLL;
      }
      if (!a10)
      {
        if (DERDecodeItem(a9, &v20))
          return 0xFFFFFFFFLL;
        goto LABEL_26;
      }
      if (*(_QWORD *)(a9 + 8))
      {
        v21 = *(_OWORD *)a9;
LABEL_26:
        if (AMSupportDigestSha256())
          return 0xFFFFFFFFLL;
        v18 = a2;
        v19 = a1;
        goto LABEL_32;
      }
LABEL_38:
      AMFDRDecodeLogInternal(3, "%s: missing public key algorithm parameter OID", "_AMFDRDecodeVerifySignatureDataWithOid");
      return 6;
    }
    if (!DEROidCompare((uint64_t)v22, (uint64_t)&oidSha384Ecdsa))
      return 4;
    *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22[2] = v17;
    v23 = v17;
    v22[1] = v17;
    v20 = 0;
    v21 = 0uLL;
    if (!a9)
    {
      AMFDRDecodeLogInternal(3, "%s: publicKeyParam is NULL");
      return 0xFFFFFFFFLL;
    }
    if (a10)
    {
      if (!*(_QWORD *)(a9 + 8))
        goto LABEL_38;
      v21 = *(_OWORD *)a9;
    }
    else if (DERDecodeItem(a9, &v20))
    {
      return 0xFFFFFFFFLL;
    }
    if (AMSupportDigestSha384())
      return 0xFFFFFFFFLL;
    v18 = a2;
    v19 = a1;
LABEL_32:
    result = AMFDRDecodeEcdsaVerifySignature(v19, v18);
    if (!a11)
      goto LABEL_36;
    goto LABEL_33;
  }
  *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22[2] = v15;
  v23 = v15;
  v22[1] = v15;
  if (AMSupportDigestSha384())
    return 0xFFFFFFFFLL;
  result = AMSupportRsaVerifySignatureSha384();
  if (a11)
    goto LABEL_33;
LABEL_36:
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  return result;
}

uint64_t AMFDRDecodeEcdsaVerifySignature(const void *a1, size_t a2)
{
  uint64_t result;
  _BYTE *v5;
  void *v6;
  uint64_t v7;

  result = 1;
  if (a1 && a2)
  {
    if ((a2 & 1) != 0)
    {
      return AMSupportEcDsaVerifySignature();
    }
    else
    {
      v5 = malloc(a2 + 1);
      if (v5)
      {
        v6 = v5;
        *v5 = 4;
        memcpy(v5 + 1, a1, a2);
        v7 = AMSupportEcDsaVerifySignature();
        free(v6);
        return v7;
      }
      else
      {
        return 2;
      }
    }
  }
  return result;
}

uint64_t _AMFDRDecodeSequenceString(unint64_t a1, unint64_t a2, _OWORD *a3)
{
  unint64_t *v4;
  uint64_t v5;
  size_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unint64_t v17;
  __int128 v18;
  unint64_t v19[2];
  unint64_t v20[2];

  v20[0] = a1;
  v20[1] = a2;
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v18 = 0uLL;
  v17 = 0;
  v19[0] = 0;
  v19[1] = 0;
  v15 = 0u;
  v16 = 0u;
  if (a3)
  {
    a3[14] = 0uLL;
    a3[15] = 0uLL;
    a3[12] = 0uLL;
    a3[13] = 0uLL;
    a3[10] = 0uLL;
    a3[11] = 0uLL;
    a3[8] = 0uLL;
    a3[9] = 0uLL;
    a3[6] = 0uLL;
    a3[7] = 0uLL;
    a3[4] = 0uLL;
    a3[5] = 0uLL;
    a3[2] = 0uLL;
    a3[3] = 0uLL;
    *a3 = 0uLL;
    a3[1] = 0uLL;
    v4 = DERDecodeSeqContentInit(v20, v19);
    if ((_DWORD)v4)
    {
      v12 = (uint64_t)v4;
      AMFDRDecodeLogInternal(3, "%s: failed to init sequence");
    }
    else
    {
      v5 = 0;
      v6 = 255;
      while (1)
      {
        v7 = DERDecodeSeqNext(v19, &v17);
        if ((_DWORD)v7)
          break;
        v14 = v18;
        if (v17 == 0x2000000000000011)
        {
          v15 = 0u;
          v16 = 0u;
          v8 = DERParseSequenceToObject((uint64_t)&v14, (unsigned __int16)DERNumAttributeTypeAndValueItemSpecs, (uint64_t)&DERAttributeTypeAndValueItemSpecs, (unint64_t)&v15, 0x20uLL, 0);
          if ((_DWORD)v8)
          {
            v12 = v8;
            AMFDRDecodeLogInternal(3, "%s: malformed AttributeTypeAndValue format: %d");
            return v12;
          }
          if ((_QWORD)v16)
          {
            v14 = v16;
            v18 = 0uLL;
            v17 = 0;
            v9 = DERDecodeItem((uint64_t)&v14, &v17);
            if ((_DWORD)v9)
            {
              v12 = v9;
              AMFDRDecodeLogInternal(3, "%s: malformed attribute: %d");
              return v12;
            }
            if (v17 == 19 || v17 == 12)
            {
              if (v5)
              {
                if (!v6)
                  return 0;
                *((_BYTE *)a3 + v5++) = 32;
                --v6;
              }
              v10 = (char *)a3 + v5;
              v11 = *((_QWORD *)&v18 + 1);
              if (v6 < *((_QWORD *)&v18 + 1))
              {
                memcpy(v10, (const void *)v18, v6);
                return 0;
              }
              v6 -= *((_QWORD *)&v18 + 1);
              memcpy(v10, (const void *)v18, *((size_t *)&v18 + 1));
              v5 += v11;
            }
          }
        }
        else
        {
          AMFDRDecodeLogInternal(3, "%s: Attribute must be set container. Found unexpected tag 0x%llu, skipping", "_AMFDRDecodeSequenceString", v17);
        }
      }
      v12 = v7;
      if ((_DWORD)v7 == 1)
        return 0;
      AMFDRDecodeLogInternal(3, "%s: failed to decode all sequences: %d");
    }
  }
  else
  {
    v12 = 3;
    AMFDRDecodeLogInternal(3, "%s: buffer is NULL");
  }
  return v12;
}

uint64_t AMFDRDecodeDigestByLength(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a4 == 48)
    return AMSupportDigestSha384();
  if (a4 == 32)
    return AMSupportDigestSha256();
  return 1;
}

uint64_t DERDecodeItem(uint64_t a1, unint64_t *a2)
{
  return DERDecodeItemPartialBufferGetLength(a1, a2, 0);
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

uint64_t DERParseBooleanWithDefault(unsigned __int8 **a1, BOOL a2, BOOL *a3)
{
  unsigned __int8 *v3;
  int v4;
  uint64_t result;

  v3 = a1[1];
  if (!v3)
    goto LABEL_9;
  if (v3 == (unsigned __int8 *)1)
  {
    v4 = **a1;
    if (v4 == 255 || v4 == 0)
    {
      a2 = v4 != 0;
LABEL_9:
      result = 0;
      *a3 = a2;
      return result;
    }
  }
  return 3;
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

uint64_t AMSupportDigestSha1()
{
  return MEMORY[0x24BED9FE8]();
}

uint64_t AMSupportDigestSha256()
{
  return MEMORY[0x24BED9FF0]();
}

uint64_t AMSupportDigestSha384()
{
  return MEMORY[0x24BED9FF8]();
}

uint64_t AMSupportEcDsaVerifySignature()
{
  return MEMORY[0x24BEDA018]();
}

uint64_t AMSupportLogFormat()
{
  return MEMORY[0x24BEDA058]();
}

uint64_t AMSupportRsaVerifySignatureSha1()
{
  return MEMORY[0x24BEDA0C0]();
}

uint64_t AMSupportRsaVerifySignatureSha256()
{
  return MEMORY[0x24BEDA0C8]();
}

uint64_t AMSupportRsaVerifySignatureSha384()
{
  return MEMORY[0x24BEDA0D0]();
}

uint64_t DERImg4DecodeContentFindItemWithTag()
{
  return MEMORY[0x24BEDA170]();
}

uint64_t DERImg4DecodeFindProperty()
{
  return MEMORY[0x24BEDA178]();
}

uint64_t DERImg4DecodeFindPropertyInSequence()
{
  return MEMORY[0x24BEDA180]();
}

uint64_t DERImg4DecodeManifest()
{
  return MEMORY[0x24BEDA188]();
}

uint64_t DERImg4DecodeProperty()
{
  return MEMORY[0x24BEDA190]();
}

uint64_t DERImg4DecodePropertyWithItem()
{
  return MEMORY[0x24BEDA198]();
}

uint64_t Img4DecodeEvaluateDictionaryProperties()
{
  return MEMORY[0x24BEDA1A0]();
}

uint64_t Img4DecodeEvaluateManifestProperties()
{
  return MEMORY[0x24BEDA1A8]();
}

uint64_t Img4DecodeEvaluateObjectProperties()
{
  return MEMORY[0x24BEDA1B0]();
}

uint64_t Img4DecodeGetManifest()
{
  return MEMORY[0x24BEDA1C0]();
}

uint64_t Img4DecodeGetObjectPropertyData()
{
  return MEMORY[0x24BEDA1C8]();
}

uint64_t Img4DecodeGetPayload()
{
  return MEMORY[0x24BEDA1D8]();
}

uint64_t Img4DecodeGetPayloadType()
{
  return MEMORY[0x24BEDA1E0]();
}

uint64_t Img4DecodeGetPropertyBoolean()
{
  return MEMORY[0x24BEDA1E8]();
}

uint64_t Img4DecodeGetPropertyData()
{
  return MEMORY[0x24BEDA1F0]();
}

uint64_t Img4DecodeInit()
{
  return MEMORY[0x24BEDA200]();
}

uint64_t Img4DecodeInitManifest()
{
  return MEMORY[0x24BEDA208]();
}

uint64_t Img4DecodePerformManifestTrustEvaluationWithCallbacks()
{
  return MEMORY[0x24BEDA210]();
}

uint64_t Img4DecodePerformTrustEvaluatation()
{
  return MEMORY[0x24BEDA218]();
}

uint64_t Img4DecodePerformTrustEvaluationWithCallbacks()
{
  return MEMORY[0x24BEDA228]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

