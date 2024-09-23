uint64_t tls_record_get_header_size(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 488))
    return 13;
  else
    return 5;
}

uint64_t tls_handshake_continue(uint64_t a1)
{
  uint64_t result;
  char *v3;

  if (!*(_BYTE *)(a1 + 416))
    return 0;
  result = SSLAdvanceHandshake(*(_DWORD *)(a1 + 420), a1);
  if ((_DWORD)result)
    return result;
  v3 = *(char **)(a1 + 656);
  if (v3)
    return SSLProcessHandshakeRecordInner(*(_QWORD *)(a1 + 648), v3, a1);
  else
    return 0;
}

uint64_t tls_handshake_get_peer_certificates(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

uint64_t SSLCopyBufferTerm(const void *a1, size_t a2, uint64_t a3)
{
  void *v6;
  size_t v7;
  size_t v8;
  uint64_t result;

  v6 = malloc_type_malloc(a2 + 1, 0xC274D582uLL);
  if (v6)
    v7 = a2 + 1;
  else
    v7 = 0;
  *(_QWORD *)a3 = v7;
  *(_QWORD *)(a3 + 8) = v6;
  if (!v6)
    return 0xFFFFFFFFLL;
  memmove(v6, a1, a2);
  *(_BYTE *)(*(_QWORD *)(a3 + 8) + a2) = 0;
  v8 = strlen(*(const char **)(a3 + 8));
  result = 0;
  *(_QWORD *)a3 = v8;
  return result;
}

uint64_t SSLProcessChangeCipherSpec(uint64_t a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  void (*v6)(_QWORD, uint64_t, uint64_t *);
  uint64_t v7;
  uint64_t v8;

  if (a1 != 1 || *a2 != 1)
  {
    if (!*(_BYTE *)(a3 + 16))
    {
      SSLFatalSessionAlert(10, a3);
      __ssl_debug("sslError", "SSLProcessChangeCipherSpec", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslChangeCipher.c", 69, "***bad changeCipherSpec msg: length %d data 0x%x\n");
      return 4294957496;
    }
    return 4294957447;
  }
  if (*(_BYTE *)(a3 + 17)
    || !*(_QWORD *)(a3 + 736)
    || (*(_DWORD *)(a3 + 380) - 7) > 1
    || (v6 = *(void (**)(_QWORD, uint64_t, uint64_t *))(a3 + 752)) == 0)
  {
LABEL_4:
    if (*(_BYTE *)(a3 + 324) && *(_DWORD *)(a3 + 380) == 14)
    {
      v4 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a3 + 1112) + 88))(*(_QWORD *)(a3 + 1104));
      if (!(_DWORD)v4)
      {
        *(_BYTE *)(a3 + 324) = 0;
        *(_DWORD *)(a3 + 380) = 15;
        return v4;
      }
      goto LABEL_7;
    }
    if (!*(_BYTE *)(a3 + 16))
    {
      SSLFatalSessionAlert(10, a3);
      __ssl_debug("sslError", "SSLProcessChangeCipherSpec", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslChangeCipher.c", 110, "***bad changeCipherSpec msg: readPending.ready %d state %d\n");
      return 4294957496;
    }
    return 4294957447;
  }
  v8 = 48;
  v6(*(_QWORD *)(a3 + 760), a3 + 520, &v8);
  *(_BYTE *)(a3 + 320) = 1;
  v4 = ValidateSelectedCiphersuite(a3);
  if ((_DWORD)v4)
    return v4;
  v7 = SSLInitPendingCiphers(a3);
  if (!(_DWORD)v7)
  {
    *(_DWORD *)(a3 + 380) = 14;
    goto LABEL_4;
  }
  v4 = v7;
LABEL_7:
  SSLFatalSessionAlert(80, a3);
  return v4;
}

double tls_record_advance_read_cipher(uint64_t a1)
{
  uint64_t v2;
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2 || !(*(unsigned int (**)(_QWORD))(v2 + 8))(*(_QWORD *)(a1 + 24)))
  {
    v4 = *(_OWORD *)(a1 + 248);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a1 + 232);
    *(_OWORD *)(a1 + 56) = v4;
    v5 = *(_OWORD *)(a1 + 216);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a1 + 200);
    *(_OWORD *)(a1 + 24) = v5;
    v6 = *(_OWORD *)(a1 + 280);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a1 + 264);
    *(_OWORD *)(a1 + 88) = v6;
    result = 0.0;
    *(_OWORD *)(a1 + 200) = 0u;
    *(_OWORD *)(a1 + 216) = 0u;
    *(_OWORD *)(a1 + 232) = 0u;
    *(_OWORD *)(a1 + 248) = 0u;
    *(_OWORD *)(a1 + 264) = 0u;
    *(_OWORD *)(a1 + 280) = 0u;
  }
  return result;
}

void tls_record_destroy(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = a1[2];
  if (v2)
    (*(void (**)(_QWORD))(v2 + 8))(a1[3]);
  v3 = a1[14];
  if (v3)
    (*(void (**)(_QWORD))(v3 + 8))(a1[15]);
  v4 = a1[26];
  if (v4)
    (*(void (**)(_QWORD))(v4 + 8))(a1[27]);
  v5 = a1[38];
  if (v5)
    (*(void (**)(_QWORD))(v5 + 8))(a1[39]);
  v6 = a1[50];
  if (v6)
    (*(void (**)(_QWORD))(v6 + 8))(a1[51]);
  sslFree(a1);
}

uint64_t NullFinish()
{
  return 0;
}

uint64_t CCSymmFinish(void *a1)
{
  if (a1)
  {
    cc_clear();
    sslFree(a1);
  }
  return 0;
}

uint64_t CCSymmFinish_0(void **a1)
{
  if (a1)
  {
    cc_clear();
    sslFree(a1[1]);
    cc_clear();
    sslFree(a1[4]);
    sslFree(a1);
  }
  return 0;
}

void __process_identifier_block_invoke()
{
  uint64_t v0;
  char *v1;
  char *v2;
  char *v3;
  uint64_t v4;

  getpid();
  if (csops() != -1)
    goto LABEL_7;
  if (*__error() != 34)
    goto LABEL_7;
  v0 = bswap32(0xAAAAAAAA);
  if ((v0 - 1025) < 0xFFFFFC07)
    goto LABEL_7;
  v1 = (char *)malloc_type_malloc((v0 + 1), 0x167FC559uLL);
  if (!v1)
    goto LABEL_7;
  v2 = v1;
  getpid();
  if (csops())
  {
    free(v2);
LABEL_7:
    v2 = 0;
    v3 = "no_bundle_id";
    goto LABEL_8;
  }
  v2[v0] = 0;
  if (strncmp(v2 + 8, "com.apple.", 0xAuLL))
  {
    v4 = 0;
    v3 = "redacted_bundle_id";
    while (strcmp(top_bundles[v4], v2 + 8))
    {
      if (++v4 == 249)
        goto LABEL_8;
    }
  }
  v3 = strdup(v2 + 8);
LABEL_8:
  process_identifier_data = (uint64_t)v3;
  free(v2);
}

uint64_t SSLEncodeClientHello(size_t *a1, unsigned int *a2)
{
  int v4;
  __int128 *v5;
  size_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  __int16 v10;
  uint64_t MaxProtVersion;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  _BYTE *v36;
  size_t v37;
  uint64_t v38;
  _WORD *v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t v64;
  _BOOL4 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  _BYTE *v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  _BOOL4 v77;
  uint64_t v78;
  _BOOL4 v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  unint64_t v84;
  uint64_t v85;
  _BOOL4 v86;
  _BOOL4 v87;
  _BOOL4 v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  size_t v95;
  void *__src;

  v95 = 0;
  __src = 0;
  v94 = 0uLL;
  *a1 = 0;
  a1[1] = 0;
  v4 = *((unsigned __int8 *)a2 + 16);
  v5 = (__int128 *)(a2 + 184);
  if (*((_QWORD *)a2 + 92))
  {
    v6 = 0;
    v94 = *v5;
  }
  else
  {
    v7 = *((_QWORD *)a2 + 34);
    if (!v7 || SSLClientValidateSessionDataBefore(*((_QWORD *)a2 + 33), v7, (uint64_t)a2))
      goto LABEL_5;
    MaxProtVersion = SSLRetrieveSessionID(*((_QWORD *)a2 + 33), *((_QWORD *)a2 + 34), &v95);
    if ((_DWORD)MaxProtVersion)
      goto LABEL_146;
    MaxProtVersion = SSLRetrieveSessionTicket(*((_QWORD *)a2 + 33), *((_QWORD *)a2 + 34), &v94);
    if ((_DWORD)MaxProtVersion)
      goto LABEL_146;
    if ((_QWORD)v94 && !*((_BYTE *)a2 + 705))
    {
LABEL_5:
      v6 = 0;
    }
    else
    {
      v6 = v95;
      SSLCopyBuffer((uint64_t)&v95, (size_t *)a2 + 36);
    }
  }
  if (a2[90])
  {
    v8 = 0;
    v9 = 0;
    do
      v9 += tls_handshake_ciphersuite_is_valid((uint64_t)a2, *(unsigned __int16 *)(*((_QWORD *)a2 + 44) + 2 * v8++));
    while (v8 < a2[90]);
  }
  else
  {
    LOWORD(v9) = 0;
  }
  if (!*((_BYTE *)a2 + 848))
    LOWORD(v9) = v9 + 1;
  v10 = *((unsigned __int8 *)a2 + 1064);
  MaxProtVersion = sslGetMaxProtVersion((uint64_t)a2, a2 + 1);
  if ((_DWORD)MaxProtVersion)
    goto LABEL_146;
  v12 = 2 * (unsigned __int16)(v9 + v10);
  *((_BYTE *)a2 + 849) = 0;
  v13 = *a2;
  if (!(_DWORD)v13)
  {
    v13 = a2[2];
    if (v13 <= 0x300 && a2[3] > 0x300)
      v13 = 769;
  }
  v14 = v6 + (v12 + 39);
  (*(void (**)(_QWORD, uint64_t))(*((_QWORD *)a2 + 139) + 96))(*((_QWORD *)a2 + 138), v13);
  v15 = *((unsigned __int8 *)a2 + 16);
  if (*((_BYTE *)a2 + 16))
    v14 += *((_QWORD *)a2 + 23) + 1;
  if (*((_BYTE *)a2 + 848))
    v16 = *((_QWORD *)a2 + 107) + 5;
  else
    v16 = 0;
  v17 = a2[1];
  if (v17 >= 0x301 && *((_QWORD *)a2 + 50))
  {
    v18 = *((_QWORD *)a2 + 49);
    v19 = v18 + 9 + v16;
    v20 = v18 == 0;
    if (v18)
      v21 = v18 + 9;
    else
      v21 = 0;
    v90 = v21;
    if (!v20)
      v16 = v19;
  }
  else
  {
    v90 = 0;
  }
  if (*((_BYTE *)a2 + 705) || *(_QWORD *)v5)
  {
    v22 = v94 + 4;
    v16 += v94 + 4;
    *((_BYTE *)a2 + 706) = 1;
  }
  else
  {
    v22 = 0;
  }
  if (v17 >= 0x301 && *((_BYTE *)a2 + 771))
  {
    v91 = 2 * a2[30] + 6;
    v16 += v91 + 6;
    v92 = 6;
    if (!v15)
      goto LABEL_38;
LABEL_41:
    if (v17 >= 0xFEFF)
    {
      v23 = 0;
      goto LABEL_46;
    }
    goto LABEL_42;
  }
  v91 = 0;
  v92 = 0;
  if (v15)
    goto LABEL_41;
LABEL_38:
  if (v17 < 0x303)
  {
    v23 = 0;
    goto LABEL_43;
  }
LABEL_42:
  v23 = 2 * a2[200] + 6;
  v16 += v23;
LABEL_43:
  if (v17 < 0x301)
  {
    v93 = v23;
    v85 = 0;
    v88 = 0;
    v89 = 0;
LABEL_61:
    v86 = 0;
    v87 = 0;
    goto LABEL_68;
  }
LABEL_46:
  if (*((_BYTE *)a2 + 929))
  {
    v88 = *((_BYTE *)a2 + 930) == 0;
    if (!*((_BYTE *)a2 + 930))
      v16 += 4;
  }
  else
  {
    v88 = 0;
  }
  v24 = *((_QWORD *)a2 + 122);
  if (v24)
    v25 = v24 + 6;
  else
    v25 = 0;
  v16 += v25;
  v89 = v25;
  v93 = v23;
  if (*((_BYTE *)a2 + 1008))
  {
    v85 = SSLEncodedBufferListSize(*((_QWORD **)a2 + 129), 2) + *((_QWORD *)a2 + 127) + 9;
    v16 += v85;
    if (a2[1] < 0x301)
      goto LABEL_61;
  }
  else
  {
    v85 = 0;
  }
  v26 = v16 + 4;
  if (!*((_BYTE *)a2 + 1066))
    v26 = v16;
  v86 = *((_BYTE *)a2 + 1066) != 0;
  v87 = *((_BYTE *)a2 + 768) != 0;
  if (*((_BYTE *)a2 + 768))
    v16 = v26 + 4;
  else
    v16 = v26;
LABEL_68:
  if (v4)
    v27 = 12;
  else
    v27 = 4;
  v28 = v14 + v27 + v16;
  v29 = (v28 + 2) & 0xFFFFFFFFFFFFFF00;
  v30 = 510 - v28;
  if (v30 <= 4)
    v30 = 4;
  v31 = v29;
  v84 = v30;
  if (v29 != 256)
    v30 = 0;
  v32 = v30 + v16;
  if (v30 + v16)
  {
    if (v32 < 0x10000)
    {
      v14 += v32 + 2;
    }
    else
    {
      __ssl_debug("sslError", "SSLEncodeClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 931, "Total extensions length EXCEEDED\n");
      v22 = 0;
      v90 = 0;
      v91 = 0;
      v92 = 0;
      v93 = 0;
      v32 = 0;
    }
  }
  MaxProtVersion = SSLAllocBuffer(a1, v14 + v27);
  if ((_DWORD)MaxProtVersion)
    goto LABEL_146;
  v33 = SSLEncodeHandshakeHeader((uint64_t)a2, (uint64_t)a1, 1, v14);
  v34 = SSLEncodeInt(v33, a2[1], 2);
  MaxProtVersion = SSLEncodeRandom(v34);
  if ((_DWORD)MaxProtVersion)
    goto LABEL_146;
  v35 = *(_OWORD *)(v34 + 16);
  *(_OWORD *)(a2 + 109) = *(_OWORD *)v34;
  *(_OWORD *)(a2 + 113) = v35;
  *(_BYTE *)(v34 + 32) = v6;
  if (v6)
    memcpy((void *)(v34 + 33), __src, v6);
  v36 = (_BYTE *)(v34 + 33 + v6);
  if (*((_BYTE *)a2 + 16))
  {
    *v36++ = *((_QWORD *)a2 + 23);
    v37 = *((_QWORD *)a2 + 23);
    if (v37)
    {
      memcpy(v36, *((const void **)a2 + 24), v37);
      v36 += *((_QWORD *)a2 + 23);
    }
  }
  v38 = SSLEncodeInt((uint64_t)v36, v12, 2);
  v39 = (_WORD *)v38;
  if (!*((_BYTE *)a2 + 848))
    v39 = (_WORD *)SSLEncodeInt(v38, 0xFFuLL, 2);
  if (*((_BYTE *)a2 + 1064))
    v39 = (_WORD *)SSLEncodeInt((uint64_t)v39, 0x5600uLL, 2);
  if (a2[90])
  {
    v40 = 0;
    do
    {
      if (tls_handshake_ciphersuite_is_valid((uint64_t)a2, *(unsigned __int16 *)(*((_QWORD *)a2 + 44) + 2 * v40)))v39 = (_WORD *)SSLEncodeInt((uint64_t)v39, *(unsigned __int16 *)(*((_QWORD *)a2 + 44) + 2 * v40), 2);
      ++v40;
    }
    while (v40 < a2[90]);
  }
  *v39 = 1;
  v41 = (uint64_t)(v39 + 1);
  if (v32)
    v41 = SSLEncodeInt(v41, v32, 2);
  if (*((_BYTE *)a2 + 848) && v41)
  {
    v42 = SSLEncodeInt(v41, 0xFF01uLL, 2);
    v43 = SSLEncodeInt(v42, *((_QWORD *)a2 + 107) + 1, 2);
    v44 = (void *)SSLEncodeInt(v43, *((_QWORD *)a2 + 107), 1);
    memcpy(v44, *((const void **)a2 + 108), *((_QWORD *)a2 + 107));
    v41 = (uint64_t)v44 + *((_QWORD *)a2 + 107);
  }
  if (v22 && v41)
  {
    v45 = SSLEncodeInt(v41, 0x23uLL, 2);
    v46 = (void *)SSLEncodeInt(v45, v94, 2);
    memcpy(v46, *((const void **)&v94 + 1), v94);
    v41 = (uint64_t)v46 + v94;
  }
  if (v90 && v41)
  {
    v47 = SSLEncodeInt(v41, 0, 2);
    v48 = SSLEncodeInt(v47, *((_QWORD *)a2 + 49) + 5, 2);
    v49 = SSLEncodeInt(v48, *((_QWORD *)a2 + 49) + 3, 2);
    v50 = SSLEncodeInt(v49, 0, 1);
    v51 = (void *)SSLEncodeInt(v50, *((_QWORD *)a2 + 49), 2);
    memcpy(v51, *((const void **)a2 + 50), *((_QWORD *)a2 + 49));
    v41 = (uint64_t)v51 + *((_QWORD *)a2 + 49);
  }
  if (v91)
  {
    if (v41)
    {
      v52 = 2 * a2[30];
      v53 = SSLEncodeInt(v41, 0xAuLL, 2);
      v54 = SSLEncodeInt(v53, (v52 + 2), 2);
      v41 = SSLEncodeInt(v54, v52, 2);
      if (a2[30])
      {
        v55 = 0;
        do
          v41 = SSLEncodeInt(v41, *(unsigned __int16 *)(*((_QWORD *)a2 + 14) + 2 * v55++), 2);
        while (v55 < a2[30]);
      }
    }
  }
  if (v92 && v41)
  {
    v56 = SSLEncodeInt(v41, 0xBuLL, 2);
    v57 = SSLEncodeInt(v56, 2uLL, 2);
    v58 = SSLEncodeInt(v57, 1uLL, 1);
    v41 = SSLEncodeInt(v58, 0, 1);
  }
  if (v93)
  {
    if (v41)
    {
      v59 = 2 * a2[200];
      v60 = SSLEncodeInt(v41, 0xDuLL, 2);
      v61 = SSLEncodeInt(v60, (v59 + 2), 2);
      v41 = SSLEncodeInt(v61, v59, 2);
      if (a2[200])
      {
        v62 = 0;
        v63 = 0;
        do
        {
          v64 = SSLEncodeInt(v41, *(unsigned int *)(*((_QWORD *)a2 + 101) + v62), 1);
          v41 = SSLEncodeInt(v64, *(unsigned int *)(*((_QWORD *)a2 + 101) + v62 + 4), 1);
          ++v63;
          v62 += 8;
        }
        while (v63 < a2[200]);
      }
    }
  }
  v65 = v88;
  if (!v41)
    v65 = 0;
  if (v65)
  {
    *((_BYTE *)a2 + 930) = 1;
    v66 = SSLEncodeInt(v41, 0x3374uLL, 2);
    v41 = SSLEncodeInt(v66, 0, 2);
  }
  if (v89 && v41)
  {
    *((_BYTE *)a2 + 969) = 1;
    v67 = SSLEncodeInt(v41, 0x10uLL, 2);
    v68 = SSLEncodeInt(v67, *((_QWORD *)a2 + 122) + 2, 2);
    v69 = (void *)SSLEncodeInt(v68, *((_QWORD *)a2 + 122), 2);
    memcpy(v69, *((const void **)a2 + 123), *((_QWORD *)a2 + 122));
    v41 = (uint64_t)v69 + *((_QWORD *)a2 + 122);
  }
  if (v85 && v41)
  {
    v70 = SSLEncodeInt(v41, 5uLL, 2);
    v71 = (_BYTE *)SSLEncodeInt(v70, v85 - 4, 2);
    *v71 = 1;
    v72 = (uint64_t)(v71 + 1);
    v73 = SSLEncodedBufferListSize(*((_QWORD **)a2 + 129), 2);
    v74 = SSLEncodeInt(v72, v73, 2);
    v75 = SSLEncodeBufferList(*((uint64_t **)a2 + 129), 2, v74);
    v76 = (void *)SSLEncodeInt(v75, *((_QWORD *)a2 + 127), 2);
    memcpy(v76, *((const void **)a2 + 128), *((_QWORD *)a2 + 127));
    v41 = (uint64_t)v76 + *((_QWORD *)a2 + 127);
  }
  if (v41)
    v77 = v86;
  else
    v77 = 0;
  if (v77)
  {
    v78 = SSLEncodeInt(v41, 0x12uLL, 2);
    v41 = SSLEncodeInt(v78, 0, 2);
  }
  if (v41)
    v79 = v87;
  else
    v79 = 0;
  if (v79)
  {
    v80 = SSLEncodeInt(v41, 0x17uLL, 2);
    v41 = SSLEncodeInt(v80, 0, 2);
  }
  if (v31 == 256 && v41)
  {
    v81 = SSLEncodeInt(v41, 0x15uLL, 2);
    v82 = (void *)SSLEncodeInt(v81, v84 - 4, 2);
    bzero(v82, v84 - 4);
    v41 = (uint64_t)v82 + v84 - 4;
  }
  if (v41 != a1[1] + *a1)
  {
    MaxProtVersion = 4294957486;
LABEL_146:
    SSLFreeBuffer(a1);
    return MaxProtVersion;
  }
  MaxProtVersion = SSLInitMessageHashes((size_t *)a2);
  if ((_DWORD)MaxProtVersion)
    goto LABEL_146;
  return MaxProtVersion;
}

uint64_t tls_handshake_ciphersuite_is_valid(uint64_t a1, int a2)
{
  unsigned int KeyExchangeMethod;
  unsigned int SymmetricCipherAlgorithm;
  uint64_t result;

  KeyExchangeMethod = sslCipherSuiteGetKeyExchangeMethod(a2);
  SymmetricCipherAlgorithm = sslCipherSuiteGetSymmetricCipherAlgorithm(a2);
  sslCipherSuiteGetMacAlgorithm(a2);
  result = 0;
  if (KeyExchangeMethod <= 0x13)
  {
    if (((1 << KeyExchangeMethod) & 0x80A22) != 0)
      goto LABEL_5;
    if (((1 << KeyExchangeMethod) & 0x68000) == 0)
      return result;
    if (*(_DWORD *)(a1 + 12) != 768)
    {
LABEL_5:
      result = 0;
      if (SymmetricCipherAlgorithm > 8)
        return result;
      if (((1 << SymmetricCipherAlgorithm) & 0x70) != 0)
      {
        if (*(_DWORD *)(a1 + 12) != 768 || !*(_BYTE *)(a1 + 1064))
          return 1;
      }
      else
      {
        if (((1 << SymmetricCipherAlgorithm) & 5) != 0)
          return 1;
        if (((1 << SymmetricCipherAlgorithm) & 0x180) == 0)
          return result;
        if (*(_DWORD *)(a1 + 12) == 771)
          return 1;
      }
    }
    return 0;
  }
  return result;
}

uint64_t SSLEncodeInt(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (a3)
  {
    v3 = a3;
    do
    {
      *(_BYTE *)(a1 - 1 + v3) = a2;
      a2 >>= 8;
      --v3;
    }
    while (v3);
  }
  return a1 + a3;
}

uint64_t tls_record_encrypt(uint64_t a1, unint64_t a2, char *a3, int a4, unint64_t *a5)
{
  char v5;
  unint64_t v6;
  unint64_t v8;
  char *v9;
  char v10;
  uint64_t v14;
  unint64_t v15;
  unsigned __int16 v16;
  int v17;
  unint64_t v18;
  __int16 v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t result;
  char v25;
  size_t **v26;
  _DWORD **v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  char v33;
  unint64_t *v34;
  size_t **v35;
  _DWORD **v36;
  unint64_t v38;
  unint64_t v39;
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  v5 = a4;
  v6 = a2;
  v8 = *a5;
  v9 = (char *)a5[1];
  v10 = *(_BYTE *)(a1 + 490);
  if (v10)
    v10 = a4 == 23
       && *(_BYTE *)(a1 + 489) != 0
       && *(_DWORD *)(**(_QWORD **)(a1 + 112) + 4) == 1
       && *(_DWORD *)(a1 + 492) < 0x302u;
  *(_BYTE *)(a1 + 490) = a4 == 23;
  v34 = (unint64_t *)(a1 + 136);
  v35 = (size_t **)(a1 + 104);
  v33 = a4;
  while (1)
  {
    v14 = 0x4000;
    if (v6 < 0x4000)
      v14 = v6;
    if ((v10 & 1) != 0)
      v15 = 1;
    else
      v15 = v14;
    v38 = 0xAAAAAAAAAAAAAAAALL;
    v39 = 0xAAAAAAAAAAAAAAAALL;
    v16 = tls_record_encrypted_size_1(a1, v15);
    if (v8 < v16)
      return 4294967246;
    v36 = *(_DWORD ***)(a1 + 112);
    v17 = (*v36)[1];
    v18 = *((unsigned __int8 *)*v36 + 10);
    if (*(_BYTE *)(a1 + 488))
      v19 = -13;
    else
      v19 = -5;
    *v9 = v5;
    v20 = SSLEncodeInt((uint64_t)(v9 + 1), *(unsigned int *)(a1 + 492), 2);
    if (*(_BYTE *)(a1 + 488))
      v20 = SSLEncodeUInt64(v20, *v34);
    v21 = (unsigned __int16)(v19 + v16);
    v22 = SSLEncodeInt(v20, v21, 2);
    v23 = v22;
    if (*(_DWORD *)(a1 + 492) >= 0x302u && v17 == 1)
    {
      result = (**(uint64_t (***)(void))(a1 + 496))();
      if ((_DWORD)result)
        return result;
      v23 += v18;
      v39 = v23;
    }
    else
    {
      v39 = v22;
      if (v17 == 2)
      {
        result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(a1 + 112) + 32))(v22, *(_QWORD *)(a1 + 120));
        if ((_DWORD)result)
          return result;
        result = (*(uint64_t (**)(unint64_t, _QWORD))(*(_QWORD *)(a1 + 112) + 24))(v23, *(_QWORD *)(a1 + 120));
        if ((_DWORD)result)
          return result;
        memset(v40, 170, 13);
        SSLEncodeUInt64((uint64_t)v40, *(_QWORD *)(a1 + 136));
        v25 = *(_BYTE *)(v23 - 3);
        LOWORD(v40[1]) = *(_WORD *)(v23 - 5);
        BYTE2(v40[1]) = v25;
        *(_WORD *)((char *)&v40[1] + 3) = bswap32(v15) >> 16;
        result = (*(uint64_t (**)(_QWORD *, uint64_t, _QWORD))(*(_QWORD *)(a1 + 112) + 40))(v40, 13, *(_QWORD *)(a1 + 120));
        if ((_DWORD)result)
          return result;
        memcpy((void *)(v23 + 8), a3, v15);
        v38 = v21;
        result = ((uint64_t (*)(unint64_t, unint64_t, unint64_t, _QWORD))v36[6])(v23, v23, v21, *(_QWORD *)(a1 + 120));
        goto LABEL_49;
      }
    }
    memcpy((void *)v23, a3, v15);
    v38 = v15;
    v26 = v35;
    if (**v35)
    {
      result = SSLComputeMac(v33, &v38, 0, v23 + v15, v35, *(_DWORD *)(a1 + 492));
      v26 = v35;
      if ((_DWORD)result)
        return result;
    }
    if (*(_DWORD *)(a1 + 492) >= 0x302u && v17 == 1)
    {
      v38 = v21;
      v39 -= v18;
      goto LABEL_43;
    }
    v38 = v21;
    if (v17)
      break;
    v27 = v36;
LABEL_48:
    result = ((uint64_t (*)(unint64_t, unint64_t, unint64_t, _QWORD))v27[3])(v39, v39, v21, *(_QWORD *)(a1 + 120));
LABEL_49:
    if ((_DWORD)result)
      return result;
    IncrementUInt64(v34);
    v10 = 0;
    a3 += v15;
    v9 += v16;
    v8 -= v16;
    v6 -= v15;
    v5 = v33;
    if (!v6)
    {
      result = 0;
      *a5 -= v8;
      return result;
    }
  }
  if (v17 == 1)
  {
LABEL_43:
    v27 = v36;
    v28 = (**v26 + v15) % v18;
    v29 = v18 + ~(_DWORD)v28;
    if ((v29 & 0x80000000) == 0)
    {
      v30 = -(uint64_t)(v18 - v28 + 1);
      v31 = -1;
      do
        *(_BYTE *)(v39 + v38 + v31--) = v29;
      while (v30 != v31);
      v21 = v38;
    }
    goto LABEL_48;
  }
  return 4294957296;
}

_QWORD *IncrementUInt64(_QWORD *result)
{
  ++*result;
  return result;
}

uint64_t tls_record_encrypted_size(uint64_t a1, int a2, uint64_t a3)
{
  BOOL v7;
  _BOOL8 v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (*(_BYTE *)(a1 + 490))
  {
    v7 = a2 == 23
      && *(_BYTE *)(a1 + 489) != 0
      && *(_DWORD *)(**(_QWORD **)(a1 + 112) + 4) == 1
      && *(_DWORD *)(a1 + 492) < 0x302u;
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }
  v9 = (unint64_t)(a3 - v8) >> 14;
  v10 = (a3 - v8) & 0x3FFF;
  v11 = tls_record_encrypted_size_1(a1, 0x4000);
  v12 = tls_record_encrypted_size_1(a1, 1) * v8 + v9 * v11;
  if (v10)
    v12 += tls_record_encrypted_size_1(a1, v10);
  return v12;
}

uint64_t tls_record_encrypted_size_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = **(_QWORD **)(a1 + 112);
  v3 = *(_DWORD *)(v2 + 4);
  if (v3)
  {
    if (v3 == 2)
    {
      a2 += 24;
    }
    else if (v3 == 1)
    {
      v4 = *(unsigned __int8 *)(v2 + 10);
      v5 = **(_QWORD **)(a1 + 104) + a2;
      v6 = v5 / v4 * v4 - v5;
      v7 = v4 + v5;
      if (*(_DWORD *)(a1 + 492) <= 0x301u)
        v4 = 0;
      a2 = v7 + v4 + v6;
    }
  }
  else
  {
    a2 += **(_QWORD **)(a1 + 104);
  }
  v8 = 13;
  if (!*(_BYTE *)(a1 + 488))
    v8 = 5;
  return v8 + a2;
}

uint64_t NullCrypt(void *__src, void *__dst, size_t a3)
{
  if (__src != __dst)
    memcpy(__dst, __src, a3);
  return 0;
}

uint64_t SSLEncodeUInt64(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t i;
  unint64_t v4;
  uint64_t j;

  v2 = HIDWORD(a2);
  for (i = 3; i != -1; --i)
  {
    *(_BYTE *)(a1 + i) = v2;
    v2 >>= 8;
  }
  v4 = a2;
  for (j = 7; j != 3; --j)
  {
    *(_BYTE *)(a1 + j) = v4;
    v4 >>= 8;
  }
  return a1 + 8;
}

uint64_t CCSymmAddADD(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (a3 && *a3)
    return ccgcm_gmac();
  __ssl_debug("sslError", "CCSymmAddADD", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslAesGcmCipher.c", 187, "CCSymmAddADD: NULL cipherCtx\n");
  return 4294957296;
}

uint64_t CCSymmAEADSetIV(_QWORD *a1, _QWORD *a2)
{
  if (a2 && *a2)
  {
    *(_QWORD *)((char *)a2 + 20) = *a1;
    return ccgcm_init_with_iv();
  }
  else
  {
    __ssl_debug("sslError", "CCSymmAEADSetIV", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslAesGcmCipher.c", 99, "CCSymmAEADSetIV: NULL cipherCtx\n");
    return 4294957296;
  }
}

uint64_t CCSymmAEADGetIV(_QWORD *a1, _QWORD *a2)
{
  uint64_t result;

  if (a2 && *a2)
  {
    result = 0;
    *a1 = *(_QWORD *)((char *)a2 + 20);
  }
  else
  {
    __ssl_debug("sslError", "CCSymmAEADGetIV", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslAesGcmCipher.c", 115, "CCSymmAEADSetIV: NULL cipherCtx\n");
    return 4294957296;
  }
  return result;
}

uint64_t CCSymmAEADEncrypt(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  int v4;
  int v5;
  int v6;

  if (a4 && *a4)
  {
    v4 = ccgcm_update();
    v5 = ccgcm_finalize() | v4;
    v6 = ccgcm_reset();
    return v5 | v6 | ccgcm_inc_iv();
  }
  else
  {
    __ssl_debug("sslError", "CCSymmAEADEncrypt", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslAesGcmCipher.c", 134, "CCSymmAEADEncrypt: NULL cipherCtx\n");
    return 4294957296;
  }
}

uint64_t tls_handshake_internal_prf(uint64_t a1, uint64_t a2, unint64_t a3, const void *a4, size_t a5, void *a6, size_t a7, char *a8, size_t a9)
{
  size_t v10;
  size_t v17;
  char *v18;
  char *v19;
  unsigned int v20;
  void *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t i;

  v10 = a7;
  if (a4)
  {
    v17 = a7 + a5;
    v18 = (char *)sslMalloc(a7 + a5);
    if (!v18)
      return 4294967188;
    v19 = v18;
    memmove(v18, a4, a5);
    memmove(&v19[a5], a6, v10);
    a6 = v19;
    v10 = v17;
  }
  if (*(_BYTE *)(a1 + 16))
    v20 = 65279;
  else
    v20 = 770;
  if (*(_DWORD *)a1 > v20)
  {
    if (*(_DWORD *)(a1 + 344) == 4)
      v21 = &TlsHmacSHA384;
    else
      v21 = &TlsHmacSHA256;
    v22 = tlsPHash((uint64_t)v21, a2, a3, (uint64_t)a6, v10, a8, a9);
    v23 = 0;
    if (!(_DWORD)v22)
      goto LABEL_12;
    goto LABEL_18;
  }
  v23 = (char *)sslMalloc(a9);
  if (v23)
  {
    v24 = tlsPHash((uint64_t)&TlsHmacMD5, a2, (a3 & 1) + (a3 >> 1), (uint64_t)a6, v10, a8, a9);
    if (!(_DWORD)v24)
    {
      v24 = tlsPHash((uint64_t)&TlsHmacSHA1, a2 + (a3 >> 1), (a3 & 1) + (a3 >> 1), (uint64_t)a6, v10, v23, a9);
      if (!(_DWORD)v24)
      {
        if (a9)
        {
          for (i = 0; i != a9; ++i)
            a8[i] ^= v23[i];
        }
LABEL_12:
        v22 = 0;
        if (!a4)
          goto LABEL_21;
LABEL_19:
        if (a6)
          sslFree(a6);
        goto LABEL_21;
      }
    }
    v22 = v24;
LABEL_18:
    if (!a4)
      goto LABEL_21;
    goto LABEL_19;
  }
  v22 = 4294967188;
  if (a4)
    goto LABEL_19;
LABEL_21:
  if (v23)
    sslFree(v23);
  return v22;
}

uint64_t tlsPHash(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char *a6, size_t a7)
{
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  size_t __len;
  unint64_t v17;
  _OWORD __src[3];
  _OWORD v19[3];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = v12;
  v19[2] = v12;
  __src[2] = v12;
  v19[0] = v12;
  __src[0] = v12;
  __src[1] = v12;
  __len = *(_QWORD *)a1;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, unint64_t *))(a1 + 16))(a1, a2, a3, &v17);
  if (!(_DWORD)v13)
  {
    v13 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t, _OWORD *, size_t *))(a1 + 56))(v17, a4, a5, v19, &__len);
    if (!(_DWORD)v13)
    {
      while (1)
      {
        v14 = (*(uint64_t (**)(unint64_t))(a1 + 32))(v17);
        if ((_DWORD)v14
          || (v14 = (*(uint64_t (**)(unint64_t, _OWORD *, size_t))(a1 + 40))(v17, v19, __len),
              (_DWORD)v14)
          || (v14 = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(a1 + 40))(v17, a4, a5), (_DWORD)v14)
          || (v14 = (*(uint64_t (**)(unint64_t, _OWORD *, size_t *))(a1 + 48))(v17, __src, &__len),
              (_DWORD)v14))
        {
LABEL_10:
          v13 = v14;
          goto LABEL_11;
        }
        if (a7 <= __len)
          break;
        memmove(a6, __src, __len);
        a6 += __len;
        a7 -= __len;
        v14 = (*(uint64_t (**)(unint64_t, _OWORD *))(a1 + 56))(v17, v19);
        if ((_DWORD)v14)
          goto LABEL_10;
      }
      memmove(a6, __src, a7);
      v13 = 0;
    }
LABEL_11:
    (*(void (**)(unint64_t))(a1 + 24))(v17);
  }
  return v13;
}

void HMAC_Update(HMAC_CTX *ctx, const unsigned __int8 *data, size_t len)
{
  _QWORD v3[2];

  v3[0] = len;
  v3[1] = data;
  if (ctx)
    ((void (*)(EVP_MD_CTX *, _QWORD *))ctx->md->init)(&ctx->i_ctx, v3);
}

void HMAC_Init(HMAC_CTX *ctx, const void *key, int len, const EVP_MD *md)
{
  EVP_MD_CTX *p_i_ctx;

  if (ctx)
  {
    p_i_ctx = &ctx->i_ctx;
    ((void (*)(EVP_MD_CTX *, const void *, _QWORD, const EVP_MD *))ctx->md->final)(&ctx->i_ctx, key, *(_QWORD *)&len, md);
    ((void (*)(unint64_t *, EVP_MD_CTX *))ctx->md->copy)(&ctx->md_ctx.flags, p_i_ctx);
  }
}

uint64_t HMAC_Free(void **a1)
{
  if (a1)
  {
    (*((void (**)(void **))*a1 + 5))(a1 + 1);
    (*((void (**)(void **))*a1 + 5))(a1 + 3);
    (*((void (**)(void **))*a1 + 5))(a1 + 5);
    bzero(a1[2], (size_t)a1[1]);
    bzero(a1[4], (size_t)a1[3]);
    bzero(a1[6], (size_t)a1[5]);
    sslFree(a1);
  }
  return 0;
}

uint64_t HashSHA384Close()
{
  ccsha384_di();
  return 0;
}

uint64_t HashSHA256Close()
{
  ccsha256_di();
  return 0;
}

uint64_t HMAC_Alloc(uint64_t a1, char *a2, size_t a3, _QWORD *a4)
{
  int v4;
  size_t v8;
  unsigned int *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  char *v13;
  void (*v14)(void);
  uint64_t v15;
  size_t v16;
  void *v17;
  char *v18;
  char *v19;
  char *v20;
  size_t v21;
  char v22;
  size_t v23;
  void (*v24)(_QWORD *, _QWORD *);
  _BYTE *v25;
  size_t v26;
  char v27;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  _QWORD *v32;
  _QWORD *v33;
  size_t v34;
  char *v35;
  _QWORD v36[2];
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 8) - 1;
  if (v4 > 3)
    return 0xFFFFFFFFLL;
  v8 = *(_QWORD *)&asc_1DF069230[8 * v4];
  v9 = (unsigned int *)*(&off_1EA97E830 + v4);
  v10 = v9[2];
  v11 = sslMalloc((3 * v10) + 56);
  if (!v11)
    return 0xFFFFFFFFLL;
  v12 = v11;
  v33 = a4;
  *v11 = v9;
  v11[1] = v10;
  v11[2] = v11 + 7;
  v13 = (char *)v11 + v10 + 56;
  v11[3] = v10;
  v11[4] = v13;
  v11[5] = v10;
  v32 = v11 + 5;
  v11[6] = &v13[v10];
  v14 = (void (*)(void))*((_QWORD *)v9 + 2);
  v30 = v11 + 1;
  v14();
  v15 = ((uint64_t (*)(_QWORD *))v14)(v12 + 3);
  v31 = &v29;
  v16 = *v9;
  v17 = (void *)MEMORY[0x1E0C80A78](v15);
  if ((_DWORD)v16)
    v17 = memset((char *)&v29 - ((v16 + 15) & 0x1FFFFFFF0), 170, v16);
  MEMORY[0x1E0C80A78](v17);
  v18 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  memset(v18, 170, v8);
  v37[0] = v8;
  v37[1] = v18;
  if (v8 < a3)
  {
    v36[0] = a3;
    v36[1] = a2;
    v34 = v16;
    v35 = (char *)&v29 - ((v16 + 15) & 0x1FFFFFFF0);
    (*((void (**)(_QWORD *, _QWORD *))v9 + 3))(v12 + 3, v36);
    (*((void (**)(_QWORD *, size_t *))v9 + 4))(v12 + 3, &v34);
    a3 = v34;
    a2 = v35;
    ((void (*)(_QWORD *))v14)(v12 + 3);
  }
  if (a3)
  {
    v19 = a2;
    v20 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
    v21 = a3;
    do
    {
      v22 = *v19++;
      *v20++ = v22 ^ 0x5C;
      --v21;
    }
    while (v21);
  }
  v23 = v8 - a3;
  memset(&v18[a3], 92, v23);
  v24 = (void (*)(_QWORD *, _QWORD *))*((_QWORD *)v9 + 3);
  v24(v30, v37);
  if (a3)
  {
    v25 = v18;
    v26 = a3;
    do
    {
      v27 = *a2++;
      *v25++ = v27 ^ 0x36;
      --v26;
    }
    while (v26);
  }
  memset(&v18[a3], 54, v23);
  v24(v12 + 3, v37);
  bzero(v18, a3);
  (*((void (**)(_QWORD *, _QWORD *))v9 + 6))(v12 + 3, v32);
  *v33 = v12;
  return 0;
}

uint64_t HashSHA384Init()
{
  ccsha384_di();
  ccdigest_init();
  return 0;
}

void HMAC_Hmac(HMAC_CTX *a1, uint64_t a2, uint64_t a3, unsigned __int8 *a4, unsigned int *a5)
{
  EVP_MD_CTX *p_i_ctx;
  _QWORD v11[2];

  if (a1)
  {
    p_i_ctx = &a1->i_ctx;
    ((void (*)(EVP_MD_CTX *))a1->md->final)(&a1->i_ctx);
    ((void (*)(unint64_t *, EVP_MD_CTX *))a1->md->copy)(&a1->md_ctx.flags, p_i_ctx);
    v11[0] = a3;
    v11[1] = a2;
    ((void (*)(EVP_MD_CTX *, _QWORD *))a1->md->init)(p_i_ctx, v11);
    HMAC_Final(a1, a4, a5);
  }
}

void HMAC_Final(HMAC_CTX *ctx, unsigned __int8 *md, unsigned int *len)
{
  __int128 v5;
  const EVP_MD *v6;
  _QWORD v7[2];
  _QWORD v8[2];
  _OWORD v9[3];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v8[0] = 48;
  v8[1] = v9;
  if (ctx && md)
  {
    if (len)
    {
      *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v9[1] = v5;
      v9[2] = v5;
      v9[0] = v5;
      v7[0] = *(_QWORD *)len;
      v7[1] = md;
      ((void (*)(EVP_MD_CTX *, _QWORD *))ctx->md->update)(&ctx->i_ctx, v8);
      ((void (*)(EVP_MD_CTX *, EVP_MD_CTX *))ctx->md->copy)(&ctx->md_ctx, &ctx->i_ctx);
      ((void (*)(EVP_MD_CTX *, _QWORD *))ctx->md->init)(&ctx->i_ctx, v8);
      v6 = ctx->md;
      __memset_chk();
      ((void (*)(EVP_MD_CTX *, _QWORD *))v6->update)(&ctx->i_ctx, v7);
      *(_QWORD *)len = ctx->md->type;
    }
  }
}

uint64_t HashSHA384Final(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = ccsha384_di();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 56))(v4, *(_QWORD *)(a1 + 8), a2[1]);
  *a2 = *(_QWORD *)v4;
  return 0;
}

uint64_t HashSHA256Clone(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = ccsha256_di();
  memcpy(*(void **)(a2 + 8), *(const void **)(a1 + 8), *(_QWORD *)(v4 + 8) + *(_QWORD *)(v4 + 16) + 12);
  return 0;
}

uint64_t HashSHA256Final(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = ccsha256_di();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 56))(v4, *(_QWORD *)(a1 + 8), a2[1]);
  *a2 = *(_QWORD *)v4;
  return 0;
}

uint64_t SSLUpdateHandshakeMacs(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  int v3;
  unsigned int v4;
  uint64_t result;

  if (!*(_DWORD *)a2)
  {
    v4 = *(_DWORD *)(a2 + 12);
    if (*(_BYTE *)(a2 + 16))
    {
      if (v4 < 0xFEFF)
      {
LABEL_9:
        v3 = 1;
        goto LABEL_12;
      }
    }
    else if (v4 >= 0x303)
    {
      goto LABEL_9;
    }
LABEL_11:
    v3 = 0;
LABEL_12:
    result = HashMD5Update();
    if ((_DWORD)result)
      return result;
    goto LABEL_13;
  }
  if (*(_BYTE *)(a2 + 16))
    v2 = 65279;
  else
    v2 = 770;
  if (*(_DWORD *)a2 <= v2)
    goto LABEL_11;
  v3 = 1;
LABEL_13:
  result = HashSHA1Update();
  if (v3)
  {
    if (!(_DWORD)result)
    {
      result = HashSHA256Update();
      if (!(_DWORD)result)
      {
        result = HashSHA384Update();
        if (!(_DWORD)result)
          return HashSHA512Update();
      }
    }
  }
  return result;
}

uint64_t HashSHA256Update()
{
  ccsha256_di();
  ccdigest_update();
  return 0;
}

uint64_t HashSHA384Clone(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = ccsha384_di();
  memcpy(*(void **)(a2 + 8), *(const void **)(a1 + 8), *(_QWORD *)(v4 + 8) + *(_QWORD *)(v4 + 16) + 12);
  return 0;
}

uint64_t HashSHA384Update()
{
  ccsha384_di();
  ccdigest_update();
  return 0;
}

uint64_t HashSHA1Update()
{
  ccsha1_di();
  ccdigest_update();
  return 0;
}

uint64_t HashSHA256Init()
{
  ccsha256_di();
  ccdigest_init();
  return 0;
}

uint64_t SSLEncodedBufferListSize(_QWORD *a1, int a2)
{
  uint64_t i;
  _QWORD *v3;

  for (i = 0; a1; i += a2 + v3[1])
  {
    v3 = a1;
    a1 = (_QWORD *)*a1;
  }
  return i;
}

uint64_t tls_handshake_set_ciphersuites_internal(uint64_t a1, unsigned int a2, unsigned __int16 *a3, unsigned int a4)
{
  unsigned __int16 *v4;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int16 *v10;
  int v11;
  int v12;
  _WORD *v13;
  _WORD *v14;
  int v15;
  int v16;

  if (!a4)
    return 4294967246;
  v4 = a3;
  v7 = 0;
  v8 = a4;
  v9 = a4;
  v10 = a3;
  do
  {
    v12 = *v10++;
    v11 = v12;
    if (tls_handshake_ciphersuite_is_supported(*(unsigned __int8 *)(a1 + 17), *(_BYTE *)(a1 + 16), v12))
      v7 += tls_handshake_ciphersuite_is_allowed(a2, v11);
    --v9;
  }
  while (v9);
  if (!v7)
    return 4294967246;
  sslFree(*(void **)(a1 + 352));
  *(_DWORD *)(a1 + 360) = 0;
  v13 = sslMalloc(2 * v7);
  if (!v13)
    return 4294967188;
  v14 = v13;
  *(_DWORD *)(a1 + 360) = v7;
  *(_QWORD *)(a1 + 352) = v13;
  do
  {
    v16 = *v4++;
    v15 = v16;
    if (tls_handshake_ciphersuite_is_supported(*(unsigned __int8 *)(a1 + 17), *(_BYTE *)(a1 + 16), v16)
      && tls_handshake_ciphersuite_is_allowed(a2, v15))
    {
      *v14++ = v15;
    }
    --v8;
  }
  while (v8);
  sslAnalyzeCipherSpecs(a1);
  return 0;
}

BOOL tls_handshake_ciphersuite_is_allowed(unsigned int a1, int a2)
{
  unsigned int KeyExchangeMethod;
  unsigned int SymmetricCipherAlgorithm;
  unsigned int MacAlgorithm;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  unint64_t v10;
  BOOL v12;

  KeyExchangeMethod = sslCipherSuiteGetKeyExchangeMethod(a2);
  SymmetricCipherAlgorithm = sslCipherSuiteGetSymmetricCipherAlgorithm(a2);
  MacAlgorithm = sslCipherSuiteGetMacAlgorithm(a2);
  switch(a1)
  {
    case 0xFFFFFFFF:
    case 0xDu:
      goto LABEL_4;
    case 6u:
      if (KeyExchangeMethod != 15 && KeyExchangeMethod != 17)
        return 0;
      goto LABEL_23;
    case 8u:
      v7 = 0;
      HIDWORD(v10) = KeyExchangeMethod - 1;
      LODWORD(v10) = KeyExchangeMethod - 1;
      v9 = v10 >> 1;
      if (v9 > 8 || ((1 << v9) & 0x191) == 0)
        return v7;
LABEL_12:
      v7 = 0;
      v12 = SymmetricCipherAlgorithm == 2 || SymmetricCipherAlgorithm > 3;
      if (SymmetricCipherAlgorithm == 9 || !v12)
        return v7;
      goto LABEL_26;
    case 9u:
      if (KeyExchangeMethod != 11 && KeyExchangeMethod != 18)
        return 0;
      if (SymmetricCipherAlgorithm >= 0xA)
        goto LABEL_26;
LABEL_23:
      v8 = 543;
LABEL_25:
      if (((v8 >> SymmetricCipherAlgorithm) & 1) != 0)
        return 0;
LABEL_26:
      if (a1 > 0xD || ((1 << a1) & 0xD3F) != 0)
        return MacAlgorithm != 0;
      return MacAlgorithm > 1;
    case 0xCu:
      v7 = 0;
      if (KeyExchangeMethod != 15 || SymmetricCipherAlgorithm <= 4)
        return v7;
      return MacAlgorithm > 1;
    default:
      v7 = 0;
      if (KeyExchangeMethod <= 0x11 && ((1 << KeyExchangeMethod) & 0x28002) != 0)
      {
LABEL_4:
        v7 = 1;
        switch(a1)
        {
          case 0xFFFFFFFF:
            return v7;
          case 0u:
          case 4u:
          case 0xAu:
          case 0xBu:
            if (SymmetricCipherAlgorithm >= 0xA)
              goto LABEL_26;
            v8 = 527;
            goto LABEL_25;
          case 1u:
          case 3u:
          case 5u:
          case 8u:
            goto LABEL_12;
          case 2u:
          case 6u:
          case 7u:
          case 9u:
            goto LABEL_23;
          case 0xCu:
            if (SymmetricCipherAlgorithm > 4)
              return MacAlgorithm > 1;
            return 0;
          case 0xDu:
            if (SymmetricCipherAlgorithm <= 6)
              return 0;
            return MacAlgorithm > 1;
          default:
            if (SymmetricCipherAlgorithm <= 3)
              return 0;
            goto LABEL_26;
        }
      }
      return v7;
  }
}

BOOL tls_handshake_ciphersuite_is_supported(uint64_t a1, char a2, int a3)
{
  unsigned int KeyExchangeMethod;
  int SymmetricCipherAlgorithm;
  unsigned int MacAlgorithm;
  uint64_t v8;

  KeyExchangeMethod = sslCipherSuiteGetKeyExchangeMethod(a3);
  SymmetricCipherAlgorithm = sslCipherSuiteGetSymmetricCipherAlgorithm(a3);
  MacAlgorithm = sslCipherSuiteGetMacAlgorithm(a3);
  v8 = 0;
  if (KeyExchangeMethod <= 0x13 && ((1 << KeyExchangeMethod) & 0xE8A02) != 0)
    return ((SymmetricCipherAlgorithm - 4) < 5
         || !SymmetricCipherAlgorithm
         || SymmetricCipherAlgorithm == 2 && (a2 & 1) == 0)
        && MacAlgorithm < 5;
  return v8;
}

uint64_t sslCipherSuiteGetKeyExchangeMethod(int a1)
{
  uint64_t result;
  unsigned int v3;

  result = 0;
  switch(a1)
  {
    case 1:
    case 2:
    case 4:
    case 5:
    case 7:
    case 9:
    case 10:
    case 47:
    case 53:
    case 59:
    case 60:
    case 61:
    case 156:
    case 157:
LABEL_2:
      result = 1;
      break;
    case 3:
    case 6:
    case 8:
      result = 2;
      break;
    case 11:
      result = 4;
      break;
    case 12:
    case 13:
    case 48:
    case 54:
    case 62:
    case 104:
    case 164:
    case 165:
      result = 3;
      break;
    case 14:
      result = 6;
      break;
    case 15:
    case 16:
    case 49:
    case 55:
    case 63:
    case 105:
    case 160:
    case 161:
      result = 5;
      break;
    case 17:
      result = 8;
      break;
    case 18:
    case 19:
    case 50:
    case 56:
    case 64:
    case 106:
    case 162:
    case 163:
      result = 7;
      break;
    case 20:
      result = 10;
      break;
    case 21:
    case 22:
    case 51:
    case 57:
    case 103:
    case 107:
    case 158:
    case 159:
      result = 9;
      break;
    case 23:
    case 25:
      result = 12;
      break;
    case 24:
    case 26:
    case 27:
    case 52:
    case 58:
    case 108:
    case 109:
    case 166:
    case 167:
      result = 11;
      break;
    case 28:
    case 29:
      result = 13;
      break;
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
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
    case 110:
    case 111:
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
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
      return result;
    case 44:
    case 138:
    case 139:
    case 140:
    case 141:
    case 168:
    case 169:
    case 174:
    case 175:
    case 176:
    case 177:
      result = 19;
      break;
    case 45:
    case 142:
    case 143:
    case 144:
    case 145:
    case 170:
    case 171:
    case 178:
    case 179:
    case 180:
    case 181:
      result = 20;
      break;
    case 46:
    case 146:
    case 147:
    case 148:
    case 149:
    case 172:
    case 173:
    case 182:
    case 183:
    case 184:
    case 185:
      result = 21;
      break;
    default:
      switch(a1)
      {
        case 49153:
        case 49154:
        case 49155:
        case 49156:
        case 49157:
        case 49189:
        case 49190:
        case 49197:
        case 49198:
          result = 14;
          break;
        case 49158:
        case 49159:
        case 49160:
        case 49161:
        case 49162:
        case 49187:
        case 49188:
        case 49195:
        case 49196:
          result = 15;
          break;
        case 49163:
        case 49164:
        case 49165:
        case 49166:
        case 49167:
        case 49193:
        case 49194:
        case 49201:
        case 49202:
          result = 16;
          break;
        case 49168:
        case 49169:
        case 49170:
        case 49171:
        case 49172:
        case 49191:
        case 49192:
        case 49199:
        case 49200:
          result = 17;
          break;
        case 49173:
        case 49174:
        case 49175:
        case 49176:
        case 49177:
          result = 18;
          break;
        case 49178:
        case 49179:
        case 49180:
        case 49181:
        case 49182:
        case 49183:
        case 49184:
        case 49185:
        case 49186:
          return result;
        default:
          v3 = a1 - 65408;
          if (v3 <= 3 && v3 != 1)
            goto LABEL_2;
          break;
      }
      break;
  }
  return result;
}

uint64_t sslCipherSuiteGetSymmetricCipherAlgorithm(int a1)
{
  uint64_t result;
  unsigned int v3;

  result = 0;
  if (a1 > 4865)
  {
    if (a1 > 65407)
    {
      if (a1 == 65411)
      {
        return 4;
      }
      else if (a1 == 65410)
      {
        return 3;
      }
      else
      {
        return a1 == 65408;
      }
    }
    else
    {
      switch(a1)
      {
        case 49154:
        case 49159:
        case 49164:
        case 49169:
        case 49174:
LABEL_10:
          result = 2;
          break;
        case 49155:
        case 49160:
        case 49165:
        case 49170:
        case 49175:
          return 4;
        case 49156:
        case 49161:
        case 49166:
        case 49171:
        case 49176:
        case 49187:
        case 49189:
        case 49191:
        case 49193:
LABEL_6:
          result = 5;
          break;
        case 49157:
        case 49162:
        case 49167:
        case 49172:
        case 49177:
        case 49188:
        case 49190:
        case 49192:
        case 49194:
LABEL_7:
          result = 6;
          break;
        case 49158:
        case 49163:
        case 49168:
        case 49173:
        case 49178:
        case 49179:
        case 49180:
        case 49181:
        case 49182:
        case 49183:
        case 49184:
        case 49185:
        case 49186:
          return result;
        case 49195:
        case 49197:
        case 49199:
        case 49201:
LABEL_8:
          result = 7;
          break;
        case 49196:
        case 49198:
        case 49200:
        case 49202:
LABEL_9:
          result = 8;
          break;
        default:
          if (a1 == 4867)
            v3 = 9;
          else
            v3 = 0;
          if (a1 == 4866)
            result = 8;
          else
            result = v3;
          break;
      }
    }
  }
  else
  {
    switch(a1)
    {
      case 4:
      case 5:
      case 24:
      case 138:
      case 142:
      case 146:
        goto LABEL_10;
      case 6:
      case 7:
      case 8:
      case 11:
      case 14:
      case 17:
      case 20:
      case 23:
      case 25:
      case 28:
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
      case 44:
      case 45:
      case 46:
      case 59:
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
      case 110:
      case 111:
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
      case 150:
      case 151:
      case 152:
      case 153:
      case 154:
      case 155:
      case 176:
      case 177:
      case 180:
      case 181:
        return result;
      case 9:
      case 12:
      case 15:
      case 18:
      case 21:
      case 26:
        return 3;
      case 10:
      case 13:
      case 16:
      case 19:
      case 22:
      case 27:
      case 139:
      case 143:
      case 147:
        return 4;
      case 47:
      case 48:
      case 49:
      case 50:
      case 51:
      case 52:
      case 60:
      case 62:
      case 63:
      case 64:
      case 103:
      case 108:
      case 140:
      case 144:
      case 148:
      case 174:
      case 178:
      case 182:
        goto LABEL_6;
      case 53:
      case 54:
      case 55:
      case 56:
      case 57:
      case 58:
      case 61:
      case 104:
      case 105:
      case 106:
      case 107:
      case 109:
      case 141:
      case 145:
      case 149:
      case 175:
      case 179:
      case 183:
        goto LABEL_7;
      case 156:
      case 158:
      case 160:
      case 162:
      case 164:
      case 166:
      case 168:
      case 170:
      case 172:
        goto LABEL_8;
      case 157:
      case 159:
      case 161:
      case 163:
      case 165:
      case 167:
      case 169:
      case 171:
      case 173:
        goto LABEL_9;
      default:
        if (a1 == 4865)
          result = 7;
        else
          result = 0;
        break;
    }
  }
  return result;
}

uint64_t sslCipherSuiteGetMacAlgorithm(int a1)
{
  uint64_t result;
  char v3;
  unsigned int v4;

  result = 0;
  switch(a1)
  {
    case 1:
    case 3:
    case 4:
    case 6:
    case 23:
    case 24:
      return 1;
    case 2:
    case 5:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
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
    case 25:
    case 26:
    case 27:
    case 28:
    case 29:
    case 44:
    case 45:
    case 46:
    case 47:
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
    case 138:
    case 139:
    case 140:
    case 141:
    case 142:
    case 143:
    case 144:
    case 145:
    case 146:
    case 147:
    case 148:
    case 149:
      return 2;
    case 30:
    case 31:
    case 32:
    case 33:
    case 34:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
    case 42:
    case 43:
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
    case 110:
    case 111:
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
    case 150:
    case 151:
    case 152:
    case 153:
    case 154:
    case 155:
      return result;
    case 59:
    case 60:
    case 61:
    case 62:
    case 63:
    case 64:
    case 103:
    case 104:
    case 105:
    case 106:
    case 107:
    case 108:
    case 109:
    case 156:
    case 158:
    case 160:
    case 162:
    case 164:
    case 166:
    case 168:
    case 170:
    case 172:
    case 174:
    case 176:
    case 178:
    case 180:
    case 182:
    case 184:
      return 3;
    case 157:
    case 159:
    case 161:
    case 163:
    case 165:
    case 167:
    case 169:
    case 171:
    case 173:
    case 175:
    case 177:
    case 179:
    case 181:
    case 183:
    case 185:
      return 4;
    default:
      v3 = a1 - 1;
      if ((a1 - 49153) > 0x31)
        goto LABEL_10;
      if (((1 << v3) & 0x1FFFFFF) != 0)
        return 2;
      if (((1 << v3) & 0x1555400000000) != 0)
        return 3;
      if (((1 << v3) & 0x2AAA800000000) != 0)
        return 4;
LABEL_10:
      v4 = a1 - 65408;
      if (v4 <= 3 && v4 != 1)
        return 1;
      return result;
  }
}

uint64_t sslAnalyzeCipherSpecs(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(result + 352);
  *(_BYTE *)(result + 771) = 0;
  if (*(_DWORD *)(result + 360))
  {
    v2 = result;
    v3 = 0;
    do
    {
      result = sslCipherSuiteGetKeyExchangeMethod(*(unsigned __int16 *)(v1 + 2 * v3));
      if (result <= 0x12 && ((1 << result) & 0x68000) != 0)
        *(_BYTE *)(v2 + 771) = 1;
      ++v3;
    }
    while (v3 < *(_DWORD *)(v2 + 360));
  }
  return result;
}

uint64_t SSLProcessFinished(size_t size, const void *a2, int *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  size_t *v9;
  size_t v11;
  void *__s1;

  v11 = 0xAAAAAAAAAAAAAAAALL;
  v6 = *a3;
  if ((*a3 - 769) < 3)
  {
LABEL_4:
    v7 = 12;
    goto LABEL_5;
  }
  if (v6 != 768)
  {
    if (v6 != 65279)
      return 4294957486;
    goto LABEL_4;
  }
  v7 = 36;
LABEL_5:
  if (size == v7)
  {
    __s1 = 0;
    v8 = SSLAllocBuffer(&v11, size);
    if (!(_DWORD)v8)
    {
      v8 = (*(uint64_t (**)(int *, size_t, void *, BOOL))(*((_QWORD *)a3 + 3) + 16))(a3, v11, __s1, *((_BYTE *)a3 + 17) == 0);
      if (!(_DWORD)v8)
      {
        if (!memcmp(__s1, a2, size))
        {
          v9 = (size_t *)(a3 + 218);
          SSLFreeBuffer(v9);
          v8 = SSLCopyBuffer((uint64_t)&v11, v9);
        }
        else
        {
          __ssl_debug("sslError", "SSLProcessFinished", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeFinish.c", 235, "SSLProcessFinished: memcmp failure\n");
          v8 = 4294957496;
        }
      }
      SSLFreeBuffer(&v11);
    }
  }
  else
  {
    __ssl_debug("sslError", "SSLProcessFinished", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeFinish.c", 224, "SSLProcessFinished: msg len error 1\n");
    return 4294957496;
  }
  return v8;
}

uint64_t SSLEncodeFinishedMessage(size_t *a1, uint64_t a2)
{
  int v4;
  unsigned int v5;
  int v6;
  uint64_t result;
  size_t *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *(_DWORD *)a2;
  if ((*(_DWORD *)a2 - 769) >= 3)
  {
    if (v4 == 768)
    {
      v5 = 36;
      goto LABEL_5;
    }
    if (v4 != 65279)
      return 4294957486;
  }
  v5 = 12;
LABEL_5:
  if (*(_BYTE *)(a2 + 16))
    v6 = 12;
  else
    v6 = 4;
  result = SSLAllocBuffer(a1, v6 + v5);
  if (!(_DWORD)result)
  {
    v9 = v5;
    v10 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 20, v5);
    result = (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a2 + 24) + 16))(a2, v5, v10, *(unsigned __int8 *)(a2 + 17));
    if (!(_DWORD)result)
    {
      v8 = (size_t *)(a2 + 856);
      SSLFreeBuffer(v8);
      return SSLCopyBuffer((uint64_t)&v9, v8);
    }
  }
  return result;
}

uint64_t tls12ComputeFinishedMac(uint64_t a1, size_t a2, char *a3, int a4)
{
  __int128 v8;
  int v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  uint64_t (**v13)();
  const char *v14;
  size_t v16[2];
  size_t v17;
  _OWORD *v18;
  _OWORD v19[4];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[2] = v8;
  v19[3] = v8;
  v19[0] = v8;
  v19[1] = v8;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  v18 = (_OWORD *)0xAAAAAAAAAAAAAAAALL;
  v9 = *(_DWORD *)(a1 + 344);
  if (v9 == 4)
    v10 = a1 + 616;
  else
    v10 = a1 + 600;
  if (v9 == 4)
    v11 = &SSLHashSHA384;
  else
    v11 = &SSLHashSHA256;
  v16[0] = 0xAAAAAAAAAAAAAAAALL;
  v16[1] = 0;
  v12 = CloneHashState((uint64_t)v11, v10, v16);
  if (!(_DWORD)v12)
  {
    v17 = *v11;
    v18 = v19;
    v13 = off_1EA97DCE0;
    if (v9 != 4)
      v13 = off_1EA97DCA8;
    v12 = ((uint64_t (*)(size_t *, size_t *))*v13)(v16, &v17);
    if (!(_DWORD)v12)
    {
      if (a4)
        v14 = "server finished";
      else
        v14 = "client finished";
      v12 = tls_handshake_internal_prf(a1, a1 + 520, 0x30uLL, v14, 0xFuLL, v18, v17, a3, a2);
    }
  }
  SSLFreeBuffer(v16);
  return v12;
}

uint64_t CloneHashState(uint64_t a1, uint64_t a2, size_t *a3)
{
  uint64_t result;

  result = SSLAllocBuffer(a3, *(unsigned int *)(a1 + 8));
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, size_t *))(a1 + 48))(a2, a3);
  return result;
}

uint64_t SSLEncodeCertificate(size_t *a1, uint64_t a2)
{
  uint64_t *v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t *v13;

  if (!*(_BYTE *)(a2 + 17) && *(_DWORD *)(a2 + 784) == -1)
  {
    v5 = 0;
    v4 = 0;
  }
  else
  {
    v4 = *(uint64_t **)(a2 + 56);
    if (v4)
    {
      v5 = 0;
      v6 = *(_QWORD **)(a2 + 56);
      do
      {
        v7 = v6;
        v6 = (_QWORD *)*v6;
        v5 += v7[1] + 3;
      }
      while (v6);
    }
    else
    {
      v5 = 0;
    }
  }
  v8 = 12;
  if (!*(_BYTE *)(a2 + 16))
    v8 = 4;
  result = SSLAllocBuffer(a1, v5 + 3 + v8);
  if (!(_DWORD)result)
  {
    v10 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 11, v5 + 3);
    for (i = SSLEncodeInt(v10, v5, 3); v4; i = (uint64_t)v12 + v13[1])
    {
      v12 = (void *)SSLEncodeInt(i, v4[1], 3);
      memcpy(v12, (const void *)v4[2], v4[1]);
      v13 = v4;
      v4 = (uint64_t *)*v4;
    }
    if (*(_BYTE *)(a2 + 17) || *(_DWORD *)(a2 + 784) == -1)
    {
      return 0;
    }
    else
    {
      result = 0;
      *(_BYTE *)(a2 + 433) = 1;
      *(_DWORD *)(a2 + 428) = 2;
    }
  }
  return result;
}

uint64_t SSLEncodeServerHello(size_t *a1, unsigned int *a2)
{
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  const void *v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  uint64_t v35;
  _QWORD v36[2];

  if (!*((_QWORD *)a2 + 39) || (v4 = *((_QWORD *)a2 + 38)) == 0)
    v4 = 32;
  if (*((_BYTE *)a2 + 929) && *((_BYTE *)a2 + 930) && !*((_BYTE *)a2 + 931))
  {
    v5 = *((_QWORD *)a2 + 117) + 4;
    *((_BYTE *)a2 + 931) = 1;
  }
  else
  {
    v5 = 0;
  }
  v6 = *((_QWORD *)a2 + 122);
  if (v6 && *((_BYTE *)a2 + 969))
  {
    v5 += v6 + 6;
    *((_BYTE *)a2 + 970) = 1;
  }
  if (*((_BYTE *)a2 + 1009) && *((_BYTE *)a2 + 1008))
    v5 += 4;
  if (*((_BYTE *)a2 + 1067) && (v7 = (_QWORD *)*((_QWORD *)a2 + 134)) != 0 && !*((_BYTE *)a2 + 320))
  {
    v8 = SSLEncodedBufferListSize(v7, 2);
    v5 += v8 + 6;
  }
  else
  {
    v8 = 0;
  }
  if (*((_QWORD *)a2 + 50))
    v5 += 4;
  if (*((_BYTE *)a2 + 848))
    v5 += *((_QWORD *)a2 + 107) + *((_QWORD *)a2 + 109) + 5;
  if (*((_BYTE *)a2 + 768) && *((_BYTE *)a2 + 769))
    v5 += 4;
  v9 = v5 + 2;
  if (!v5)
    v9 = 0;
  v10 = v9 + v4 + 38;
  v11 = 12;
  if (!*((_BYTE *)a2 + 16))
    v11 = 4;
  result = SSLAllocBuffer(a1, v10 + v11);
  if (!(_DWORD)result)
  {
    v13 = SSLEncodeHandshakeHeader((uint64_t)a2, (uint64_t)a1, 2, v10);
    v14 = SSLEncodeInt(v13, *a2, 2);
    result = SSLEncodeRandom((uint64_t)(a2 + 117));
    if (!(_DWORD)result)
    {
      v15 = *(_OWORD *)(a2 + 121);
      *(_OWORD *)v14 = *(_OWORD *)(a2 + 117);
      *(_OWORD *)(v14 + 16) = v15;
      v16 = (void *)(v14 + 33);
      *(_BYTE *)(v14 + 32) = v4;
      v17 = (const void *)*((_QWORD *)a2 + 39);
      if (v17)
      {
        v18 = v4;
        memcpy(v16, v17, v4);
      }
      else
      {
        v36[0] = 32;
        v36[1] = v14 + 33;
        sslRand(v36);
        v18 = v4;
      }
      v19 = (_BYTE *)SSLEncodeInt((uint64_t)v16 + v18, *((unsigned __int16 *)a2 + 164), 2);
      *v19 = 0;
      v20 = (uint64_t)(v19 + 1);
      if (v5)
      {
        v20 = SSLEncodeInt(v20, v5, 2);
        if (*((_QWORD *)a2 + 50))
        {
          v21 = SSLEncodeInt(v20, 0, 2);
          v20 = SSLEncodeInt(v21, 0, 2);
        }
        if (*((_BYTE *)a2 + 931))
        {
          v22 = SSLEncodeInt(v20, 0x3374uLL, 2);
          v23 = (void *)SSLEncodeInt(v22, *((_QWORD *)a2 + 117), 2);
          memcpy(v23, *((const void **)a2 + 118), *((_QWORD *)a2 + 117));
          v20 = (uint64_t)v23 + *((_QWORD *)a2 + 117);
        }
        if (*((_BYTE *)a2 + 970))
        {
          v24 = SSLEncodeInt(v20, 0x10uLL, 2);
          v25 = SSLEncodeInt(v24, *((_QWORD *)a2 + 122) + 2, 2);
          v26 = (void *)SSLEncodeInt(v25, *((_QWORD *)a2 + 122), 2);
          memcpy(v26, *((const void **)a2 + 123), *((_QWORD *)a2 + 122));
          v20 = (uint64_t)v26 + *((_QWORD *)a2 + 122);
        }
        if (*((_BYTE *)a2 + 1008) && *((_BYTE *)a2 + 1009))
        {
          v27 = SSLEncodeInt(v20, 5uLL, 2);
          v20 = SSLEncodeInt(v27, 0, 2);
        }
        if (v8)
        {
          v28 = SSLEncodeInt(v20, 0x12uLL, 2);
          v29 = SSLEncodeInt(v28, v8 + 2, 2);
          v30 = SSLEncodeInt(v29, v8, 2);
          v20 = SSLEncodeBufferList(*((uint64_t **)a2 + 134), 2, v30);
        }
        if (*((_BYTE *)a2 + 848))
        {
          v31 = SSLEncodeInt(v20, 0xFF01uLL, 2);
          v32 = SSLEncodeInt(v31, *((_QWORD *)a2 + 107) + *((_QWORD *)a2 + 109) + 1, 2);
          v33 = (char *)SSLEncodeInt(v32, *((_QWORD *)a2 + 109) + *((_QWORD *)a2 + 107), 1);
          memcpy(v33, *((const void **)a2 + 110), *((_QWORD *)a2 + 109));
          v34 = &v33[*((_QWORD *)a2 + 109)];
          memcpy(v34, *((const void **)a2 + 108), *((_QWORD *)a2 + 107));
          v20 = (uint64_t)&v34[*((_QWORD *)a2 + 107)];
        }
        if (*((_BYTE *)a2 + 768) && *((_BYTE *)a2 + 769))
        {
          v35 = SSLEncodeInt(v20, 0x17uLL, 2);
          v20 = SSLEncodeInt(v35, 0, 2);
        }
      }
      if (v20 == a1[1] + *a1)
        return 0;
      else
        return 4294957486;
    }
  }
  return result;
}

uint64_t SSLEncodeHandshakeHeader(uint64_t a1, uint64_t a2, char a3, unint64_t a4)
{
  _BYTE *v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;

  v6 = *(_BYTE **)(a2 + 8);
  *v6 = a3;
  result = SSLEncodeInt((uint64_t)(v6 + 1), a4, 3);
  if (*(_BYTE *)(a1 + 16))
  {
    v8 = SSLEncodeInt(result, *(unsigned __int16 *)(a1 + 202), 2);
    v9 = SSLEncodeInt(v8, 0, 3);
    return SSLEncodeInt(v9, a4, 3);
  }
  return result;
}

uint64_t SSLEncodeRandom(uint64_t a1)
{
  time_t v3[2];

  v3[0] = 0xAAAAAAAAAAAAAAAALL;
  time(v3);
  SSLEncodeInt(a1, LODWORD(v3[0]), 4);
  v3[0] = 28;
  v3[1] = a1 + 4;
  return sslRand(v3);
}

uint64_t sslRand(_QWORD *a1)
{
  uint64_t (**v2)(_QWORD, _QWORD, _QWORD);

  if (*a1)
  {
    v2 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))ccDRBGGetRngState();
    if (!v2)
      abort();
    return (*v2)(v2, *a1, a1[1]);
  }
  else
  {
    __ssl_debug("sslError", "sslRand", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 275, "sslRand: zero buf->length\n");
    return 0;
  }
}

uint64_t sslGetMaxProtVersion(uint64_t a1, _DWORD *a2)
{
  int v2;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 12);
  if (!v2)
    return 4294967246;
  result = 0;
  *a2 = v2;
  return result;
}

uint64_t HashMD5Update()
{
  ccmd5_di();
  ccdigest_update();
  return 0;
}

unint64_t tls_record_decrypted_size(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;

  v2 = 13;
  if (!*(_BYTE *)(a1 + 488))
    v2 = 5;
  v3 = **(_QWORD **)(a1 + 16);
  v4 = *(_DWORD *)(v3 + 4);
  if (v4)
  {
    if (v4 == 2)
    {
      v2 += 24;
    }
    else if (v4 == 1)
    {
      v5 = *(unsigned __int8 *)(v3 + 10);
      v6 = v2 + **(_QWORD **)(a1 + 8);
      if (*(_DWORD *)(a1 + 492) <= 0x301u)
        v5 = 0;
      v2 = v6 + v5 + 1;
    }
  }
  else
  {
    v2 += **(_QWORD **)(a1 + 8);
  }
  v7 = a2 >= v2;
  v8 = a2 - v2;
  if (v7)
    return v8;
  else
    return 0;
}

uint64_t tls_handshake_set_callbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 1104) = a3;
  *(_QWORD *)(a1 + 1112) = a2;
  return 0;
}

uint64_t tls_handshake_get_min_protocol_version(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 8);
  return 0;
}

uint64_t tls_handshake_get_max_protocol_version(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 12);
  return 0;
}

uint64_t tls_handshake_set_sct_enable(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 1066) = a2;
  return 0;
}

uint64_t tls_handshake_set_ocsp_enable(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 1008) = a2;
  return 0;
}

uint64_t tls_handshake_set_min_protocol_version(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  *(_DWORD *)(a1 + 8) = a2;
  v2 = *(_DWORD *)(a1 + 12);
  if (!*(_BYTE *)(a1 + 16))
  {
    if (v2 >= a2)
      return 0;
    goto LABEL_3;
  }
  if (v2 > a2)
LABEL_3:
    *(_DWORD *)(a1 + 12) = a2;
  return 0;
}

uint64_t tls_handshake_set_max_protocol_version(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  *(_DWORD *)(a1 + 12) = a2;
  v2 = *(_DWORD *)(a1 + 8);
  if (!*(_BYTE *)(a1 + 16))
  {
    if (v2 <= a2)
      return 0;
    goto LABEL_3;
  }
  if (v2 < a2)
LABEL_3:
    *(_DWORD *)(a1 + 8) = a2;
  return 0;
}

uint64_t tls_private_key_get_context(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t tls_handshake_set_peer_trust(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 72) = a2;
  return 0;
}

uint64_t tls_handshake_get_peer_signature_algorithms(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 788);
  return *(_QWORD *)(a1 + 792);
}

uint64_t tls_record_set_record_splitting(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 489) = a2;
  return 0;
}

uint64_t tls_handshake_set_client_auth(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 424) = a2;
  return 0;
}

uint64_t tls_handshake_get_peer_hostname(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 392);
  *a2 = *(_QWORD *)(a1 + 400);
  *a3 = v3;
  return 0;
}

uint64_t tls_handshake_process(uint64_t a1, size_t size, unsigned __int8 *__src, int a4)
{
  uint64_t v6;
  uint64_t v7;

  v6 = 4294957496;
  if (a4 > 21)
  {
    if (a4 == 128)
    {
      v7 = SSLProcessSSL2Message(size, __src, a1);
    }
    else
    {
      if (a4 != 22)
        return v6;
      v7 = SSLProcessHandshakeRecord(size, __src, a1);
    }
  }
  else if (a4 == 20)
  {
    v7 = SSLProcessChangeCipherSpec(size, __src, a1);
  }
  else
  {
    if (a4 != 21)
      return v6;
    v7 = SSLProcessAlert(size, __src, a1);
  }
  v6 = v7;
  if ((_DWORD)v7 == -9849)
    v6 = DTLSRetransmit(a1);
  if ((_DWORD)v6)
    __ssl_debug("sslError", "tls_handshake_process", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/tls_handshake.c", 326, "Error processing a message (ct=%d, err=%d)", a4, v6);
  return v6;
}

uint64_t SSLProcessHandshakeRecordInner(size_t size, char *__src, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  size_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _DWORD v21[2];
  unint64_t v22;
  char *v23;
  unint64_t v24;
  char *v25;

  v24 = 0xAAAAAAAAAAAAAAAALL;
  v25 = (char *)0xAAAAAAAAAAAAAAAALL;
  while (size >= 4)
  {
    v25 = __src;
    v6 = *__src;
    v7 = SSLDecodeSize((unint64_t)(__src + 1), 3);
    v8 = size - (v7 + 4);
    if (size < v7 + 4)
    {
      v14 = 0;
      goto LABEL_14;
    }
    v9 = v7;
    v10 = __src + 4;
    v23 = v10;
    v24 = v7 + 4;
    v21[0] = v6;
    v21[1] = 0;
    v22 = v7;
    v11 = SSLProcessHandshakeMessage((uint64_t)v21, a3);
    if ((_DWORD)v11)
      return v11;
    if ((_DWORD)v6)
    {
      v12 = SSLUpdateHandshakeMacs((uint64_t)&v24, a3);
      if ((_DWORD)v12)
      {
        v14 = v12;
        SSLFatalSessionAlert(80, a3);
        return v14;
      }
    }
    __src = &v10[v9];
    *(_BYTE *)(a3 + 416) = 1;
    *(_DWORD *)(a3 + 420) = v6;
    v13 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a3 + 1112) + 8))(*(_QWORD *)(a3 + 1104), v6);
    if ((_DWORD)v13)
    {
      v14 = v13;
      size = v8;
      if (v8)
        goto LABEL_14;
LABEL_19:
      if (*(_QWORD *)(a3 + 656))
      {
        v18 = SSLFreeBuffer((_QWORD *)(a3 + 648));
        if ((_DWORD)v18)
        {
          v19 = v18;
          SSLFatalSessionAlert(80, a3);
          return v19;
        }
      }
      return v14;
    }
    v11 = SSLAdvanceHandshake(v6, a3);
    size = v8;
    if ((_DWORD)v11)
      return v11;
  }
  v14 = 0;
  if (!size)
    goto LABEL_19;
LABEL_14:
  v15 = *(char **)(a3 + 656);
  if (!v15)
  {
    v16 = SSLAllocBuffer((size_t *)(a3 + 648), size);
    if ((_DWORD)v16)
    {
      v17 = v16;
      SSLFatalSessionAlert(80, a3);
      return v17;
    }
    v15 = *(char **)(a3 + 656);
  }
  if (__src != v15)
  {
    memmove(v15, __src, size);
    *(_QWORD *)(a3 + 648) = size;
  }
  return v14;
}

unint64_t SSLDecodeSize(unint64_t result, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned int v3;

  if (!a2)
    return 0;
  v2 = (unsigned __int8 *)result;
  LODWORD(result) = 0;
  do
  {
    v3 = *v2++;
    result = v3 | ((_DWORD)result << 8);
    --a2;
  }
  while (a2);
  return result;
}

uint64_t SSLProcessHandshakeRecord(size_t size, unsigned __int8 *__src, uint64_t a3)
{
  size_t v5;
  size_t *v6;
  size_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int8 *v10;
  size_t v11;
  char *v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int16 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  size_t *v34;
  uint64_t v35;
  uint64_t v36;
  _DWORD *v37;
  size_t *v38;
  __int128 v39;
  uint64_t v40;
  char v41;
  _QWORD v42[3];

  v5 = size;
  *(_QWORD *)((char *)&v42[1] + 3) = *MEMORY[0x1E0C80C00];
  v6 = (size_t *)(a3 + 648);
  if (*(_QWORD *)(a3 + 656))
  {
    v7 = *v6;
    v8 = SSLReallocBuffer(a3 + 648, *v6 + size);
    if ((_DWORD)v8)
    {
LABEL_3:
      v9 = v8;
      SSLFatalSessionAlert(80, a3);
      return v9;
    }
    memcpy((void *)(*(_QWORD *)(a3 + 656) + v7), __src, v5);
    v5 = *(_QWORD *)(a3 + 648);
    v10 = *(unsigned __int8 **)(a3 + 656);
    __src = v10;
  }
  else
  {
    v10 = 0;
  }
  if (!*(_BYTE *)(a3 + 16))
    return SSLProcessHandshakeRecordInner(v5, (char *)__src, a3);
  if (!v5)
  {
    v9 = 0;
LABEL_35:
    if (v10)
    {
      v29 = SSLFreeBuffer(v6);
      if ((_DWORD)v29)
      {
        v30 = v29;
        SSLFatalSessionAlert(80, a3);
        return v30;
      }
    }
    return v9;
  }
  v37 = (_DWORD *)(a3 + 216);
  v38 = (size_t *)(a3 + 224);
  v34 = v6;
  v36 = a3 + 568;
  v35 = a3 + 584;
  v11 = v5;
  while (1)
  {
    if (v11 <= 0xB)
    {
      __ssl_debug("sslError", "DTLSProcessHandshakeRecordInner", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 308, "DTLSProcessHandshakeRecord: remaining too small (%lu out of %lu)\n", v11, v5);
      v9 = 4294957447;
LABEL_47:
      v20 = (_QWORD *)(a3 + 224);
LABEL_48:
      __ssl_debug("sslError", "DTLSProcessHandshakeRecordInner", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 456, "DTLSProcessHandshakeRecord: flushing record (err=%d)\n", v9);
      SSLFreeBuffer(v20);
      *(_WORD *)(a3 + 240) = 0;
      return v9;
    }
    v12 = (char *)(__src + 12);
    v13 = *__src;
    v14 = SSLDecodeInt(__src + 1, 3);
    v15 = SSLDecodeInt(__src + 4, 2);
    v16 = SSLDecodeInt(__src + 6, 3);
    v17 = SSLDecodeInt(__src + 9, 3);
    v18 = v17;
    v19 = v11 - 12;
    v20 = (_QWORD *)(a3 + 224);
    if (v17 + v16 > v14
      || v19 < v17
      || v15 != *(unsigned __int16 *)(a3 + 208)
      || (v21 = *(unsigned __int16 *)(a3 + 240), v16 != (_DWORD)v21))
    {
LABEL_38:
      __ssl_debug("sslError", "DTLSProcessHandshakeRecordInner", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 337, "DTLSProcessHandshakeRecord: wrong fragment (fl=%d, fo=%d, ml=%d, rm=%d | ms=%d/%d | mt=%d/%d, ml=%d/%d\n", v17, v16, v14, v19, v13, *v37, v14, *v38, v33, (_DWORD)v34);
      v9 = 4294957447;
      goto LABEL_48;
    }
    if (v16)
    {
      if (*v37 != (_DWORD)v13 || *v38 != v14)
        goto LABEL_38;
    }
    else
    {
      v8 = SSLAllocBuffer(v38, v14);
      if ((_DWORD)v8)
        goto LABEL_3;
      *(_DWORD *)(a3 + 216) = v13;
      v21 = *(unsigned __int16 *)(a3 + 240);
    }
    v22 = v18;
    memcpy((void *)(*(_QWORD *)(a3 + 232) + v21), v12, v18);
    v23 = *(_WORD *)(a3 + 240) + v18;
    *(_WORD *)(a3 + 240) = v23;
    __src = (unsigned __int8 *)&v12[v18];
    v11 = v19 - v22;
    if (*(_QWORD *)(a3 + 224) != v23)
      goto LABEL_30;
    v39 = *(_OWORD *)v37;
    v40 = *(_QWORD *)(a3 + 232);
    v24 = SSLProcessHandshakeMessage((uint64_t)&v39, a3);
    if ((_DWORD)v24)
    {
      v9 = v24;
      goto LABEL_47;
    }
    if ((_DWORD)v13)
    {
      if ((_DWORD)v13 != 3)
      {
        v42[0] = 0xAAAAAAAAAAAAAAAALL;
        *(_DWORD *)((char *)v42 + 7) = -1431655766;
        *((_QWORD *)&v39 + 1) = &v41;
        *(_QWORD *)&v39 = 12;
        v41 = v13;
        SSLEncodeInt((uint64_t)v42, v14, 3);
        SSLEncodeInt((uint64_t)v42 + 3, v15, 2);
        SSLEncodeInt((uint64_t)v42 + 5, 0, 3);
        SSLEncodeInt((uint64_t)&v42[1], v14, 3);
        v25 = ((uint64_t (*)(uint64_t, __int128 *))HashSHA1Update)(v36, &v39);
        if ((_DWORD)v25
          || (v25 = ((uint64_t (*)(uint64_t, __int128 *))HashMD5Update)(v35, &v39), (_DWORD)v25)
          || (v25 = ((uint64_t (*)(uint64_t, size_t *))HashSHA1Update)(v36, v38), (_DWORD)v25)
          || (v25 = ((uint64_t (*)(uint64_t, size_t *))HashMD5Update)(v35, v38), (_DWORD)v25))
        {
          v9 = v25;
          SSLFatalSessionAlert(80, a3);
          goto LABEL_47;
        }
      }
    }
    SSLFreeBuffer(v38);
    *(_WORD *)(a3 + 240) = 0;
    ++*(_WORD *)(a3 + 208);
    *(_BYTE *)(a3 + 416) = 1;
    *(_DWORD *)(a3 + 420) = v13;
    v26 = (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a3 + 1112) + 8))(*(_QWORD *)(a3 + 1104), v13);
    if ((_DWORD)v26)
      break;
    v27 = SSLAdvanceHandshake(v13, a3);
    if ((_DWORD)v27)
    {
      v9 = v27;
      __ssl_debug("sslError", "DTLSProcessHandshakeRecordInner", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 421, "AdvanceHandshake error: %d\n", v27);
      goto LABEL_47;
    }
LABEL_30:
    if (!v11)
    {
      v9 = 0;
      v10 = *(unsigned __int8 **)(a3 + 656);
LABEL_32:
      v6 = v34;
      goto LABEL_35;
    }
  }
  v9 = v26;
  v10 = *(unsigned __int8 **)(a3 + 656);
  if (!v11)
    goto LABEL_32;
  if (v10)
  {
LABEL_44:
    if (__src != v10)
    {
      memmove(v10, __src, v11);
      *v34 = v11;
    }
  }
  else
  {
    v31 = SSLAllocBuffer(v34, v11);
    if (!(_DWORD)v31)
    {
      v10 = *(unsigned __int8 **)(a3 + 656);
      goto LABEL_44;
    }
    v32 = v31;
    SSLFatalSessionAlert(80, a3);
    return v32;
  }
  return v9;
}

uint64_t SSLProcessHandshakeMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  int v7;
  int v8;
  int v10;

  switch(*(_DWORD *)a1)
  {
    case 0:
      if (*(_BYTE *)(a2 + 17))
        goto LABEL_45;
      if (*(_QWORD *)(a1 + 8))
      {
        v3 = 4294957496;
        goto LABEL_50;
      }
      return 0;
    case 1:
      v7 = *(_DWORD *)(a2 + 380);
      if (v7 == 1)
        goto LABEL_19;
      if (v7 != 16)
        goto LABEL_45;
      if (*(_BYTE *)(a2 + 321))
LABEL_19:
        v4 = SSLProcessClientHello(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), a2);
      else
        v4 = SSLSendAlert(1, 100, a2);
      goto LABEL_49;
    case 2:
      if (*(_DWORD *)(a2 + 380) != 6)
        goto LABEL_45;
      v4 = SSLProcessServerHello(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), a2);
      goto LABEL_49;
    case 3:
      if (*(_BYTE *)(a2 + 17) || *(_DWORD *)(a2 + 380) != 6)
        goto LABEL_45;
      v4 = SSLProcessServerHelloVerifyRequest(*(_QWORD *)(a1 + 8), *(unsigned __int8 **)(a1 + 16), a2);
      goto LABEL_49;
    case 4:
      if (*(_DWORD *)(a2 + 380) != 13)
        goto LABEL_45;
      v4 = SSLProcessNewSessionTicket(*(_QWORD *)(a1 + 8), *(unsigned __int8 **)(a1 + 16), a2);
      goto LABEL_49;
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 0xA:
    case 0x11:
    case 0x12:
    case 0x13:
    case 0x15:
      goto LABEL_45;
    case 0xB:
      if ((*(_DWORD *)(a2 + 380) | 2) != 0xA)
        goto LABEL_45;
      v4 = SSLProcessCertificate(*(_QWORD *)(a1 + 8), *(unsigned __int8 **)(a1 + 16), a2);
      goto LABEL_49;
    case 0xC:
      v8 = *(_DWORD *)(a2 + 380);
      if (v8 != 9 && v8 != 7)
        goto LABEL_45;
      v4 = SSLProcessServerKeyExchange(*(_QWORD *)(a1 + 8), *(unsigned __int8 **)(a1 + 16), a2);
      goto LABEL_49;
    case 0xD:
      if (*(_DWORD *)(a2 + 380) != 9 || *(_BYTE *)(a2 + 432))
        goto LABEL_45;
      v4 = SSLProcessCertificateRequest(*(_QWORD *)(a1 + 8), *(_BYTE **)(a1 + 16), a2);
      goto LABEL_49;
    case 0xE:
      if (*(_DWORD *)(a2 + 380) != 9)
        goto LABEL_45;
      v4 = SSLProcessServerHelloDone(*(_QWORD *)(a1 + 8));
      goto LABEL_49;
    case 0xF:
      if (*(_DWORD *)(a2 + 380) != 12)
        goto LABEL_45;
      v3 = SSLProcessCertificateVerify(*(_QWORD *)(a1 + 8), *(unsigned __int8 **)(a1 + 16), a2);
      if (!(_DWORD)v3)
        return v3;
      *(_DWORD *)(a2 + 428) = 3;
      goto LABEL_50;
    case 0x10:
      if (*(_DWORD *)(a2 + 380) != 11)
        goto LABEL_45;
      v4 = SSLProcessKeyExchange(*(_QWORD *)(a1 + 8), *(unsigned __int8 **)(a1 + 16), a2);
      goto LABEL_49;
    case 0x14:
      if (*(_DWORD *)(a2 + 380) != 15)
        goto LABEL_45;
      v4 = SSLProcessFinished(*(_QWORD *)(a1 + 8), *(const void **)(a1 + 16), (int *)a2);
      goto LABEL_49;
    case 0x16:
      v5 = *(_DWORD *)(a2 + 380);
      if (v5 != 9 && v5 != 7)
        goto LABEL_45;
      v4 = SSLProcessCertificateStatus(*(_QWORD *)(a1 + 8), *(_BYTE **)(a1 + 16), a2);
      goto LABEL_49;
    default:
      if (*(_DWORD *)a1 != 67 || *(_DWORD *)(a2 + 380) != 15)
      {
LABEL_45:
        v10 = 10;
        goto LABEL_46;
      }
      v4 = SSLProcessEncryptedExtension(*(_QWORD *)(a1 + 8), *(const void **)(a1 + 16), a2);
LABEL_49:
      v3 = v4;
      if ((_DWORD)v4)
      {
LABEL_50:
        if (*(_BYTE *)(a2 + 704))
          return v3;
        if ((int)v3 <= -9804)
        {
          if ((v3 + 9842) < 2)
            return v3;
          if ((_DWORD)v3 == -9810)
          {
            SSLFatalSessionAlert(80, a2);
            return 4294957486;
          }
LABEL_61:
          SSLFatalSessionAlert(0, a2);
          return v3;
        }
        if ((_DWORD)v3 == -9803)
          return v3;
        if ((_DWORD)v3 == -9801)
        {
          SSLFatalSessionAlert(40, a2);
          return 4294957495;
        }
        if ((_DWORD)v3 != -9800)
          goto LABEL_61;
        v10 = 47;
LABEL_46:
        SSLFatalSessionAlert(v10, a2);
        return 4294957496;
      }
      return v3;
  }
}

uint64_t SSLAdvanceHandshake(int a1, uint64_t a2)
{
  int v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  int v15;
  unint64_t v16;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  char *v23;
  _QWORD **v24;
  _QWORD *v25;
  _QWORD *i2;
  char *v27;
  _QWORD *i4;
  char *v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  char *v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  char *v37;
  _QWORD *v38;
  _QWORD *v39;
  char *v40;
  _QWORD **v41;
  _QWORD *v42;
  _QWORD *i;
  unsigned int v44;
  int v45;
  char *v46;
  _QWORD *v47;
  _QWORD *i3;
  _QWORD *v49;
  uint64_t v50;
  char *v52;
  _QWORD **v53;
  _QWORD *v54;
  _QWORD *jj;
  char *v56;
  _QWORD *v57;
  _QWORD *kk;
  char *v59;
  _QWORD *v60;
  _QWORD *mm;
  char *v62;
  _QWORD *i1;
  char *v64;
  _QWORD *v65;
  _QWORD *j;
  char *v67;
  _QWORD *v68;
  _QWORD *k;
  unsigned int v70;
  char *v71;
  _QWORD *v72;
  _QWORD *m;
  char *v74;
  _QWORD *v75;
  _QWORD *n;
  char *v77;
  _QWORD *ii;
  char *v79;
  _QWORD *v80;
  _QWORD *nn;
  void *__s1[2];

  SSLResetFlight(a2);
  *(_BYTE *)(a2 + 416) = 0;
  switch(a1)
  {
    case 0:
      v5 = *(_DWORD *)(a2 + 380);
      if (v5 == 17 || v5 == 2)
        goto LABEL_8;
      return 0;
    case 1:
      *(_BYTE *)(a2 + 320) = 0;
      *(_QWORD *)(a2 + 428) = 0;
      if (*(_BYTE *)(a2 + 322))
      {
        *(_BYTE *)(a2 + 322) = 0;
        (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a2 + 1112) + 16))(*(_QWORD *)(a2 + 1104), 0, 0);
      }
      if (*(_BYTE *)(a2 + 323))
      {
        *(_BYTE *)(a2 + 323) = 0;
        (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a2 + 1112) + 16))(*(_QWORD *)(a2 + 1104), 1, 0);
      }
      if (!*(_BYTE *)(a2 + 1065))
      {
        if (!*(_BYTE *)(a2 + 16))
          goto LABEL_96;
        goto LABEL_76;
      }
      v10 = *(_DWORD *)(a2 + 12);
      v11 = *(_DWORD *)(a2 + 4);
      if (*(_BYTE *)(a2 + 16))
      {
        if (v10 < v11)
          goto LABEL_95;
LABEL_76:
        if (!*(_BYTE *)(a2 + 200))
        {
          __s1[0] = 0;
          __s1[1] = 0;
          v7 = SSLEncodeServerHelloVerifyRequest((size_t *)__s1, (unsigned int *)a2);
          if ((_DWORD)v7)
            goto LABEL_178;
          v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
          if ((_DWORD)v8)
            goto LABEL_14;
          ++*(_WORD *)(a2 + 202);
          v29 = (char *)sslMalloc(0x20uLL);
          if (!v29)
            goto LABEL_258;
          *(_QWORD *)v29 = 0;
          *(_OWORD *)(v29 + 8) = *(_OWORD *)__s1;
          v29[24] = 22;
          v30 = *(_QWORD **)(a2 + 664);
          if (v30)
          {
            do
            {
              v31 = v30;
              v30 = (_QWORD *)*v30;
            }
            while (v30);
          }
          else
          {
            v31 = (_QWORD *)(a2 + 664);
          }
          *v31 = v29;
          return SSLSendFlight(a2);
        }
        goto LABEL_96;
      }
      if (v10 > v11)
      {
LABEL_95:
        SSLFatalSessionAlert(86, a2);
        return 4294957460;
      }
LABEL_96:
      v36 = *(_QWORD *)(a2 + 296);
      if (!v36)
        goto LABEL_103;
      __s1[0] = (void *)0xAAAAAAAAAAAAAAAALL;
      __s1[1] = (void *)0xAAAAAAAAAAAAAAAALL;
      v32 = (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, void **))(*(_QWORD *)(a2 + 1112) + 40))(*(_QWORD *)(a2 + 1104), *(_QWORD *)(a2 + 288), v36, __s1);
      if (!(_DWORD)v32)
        v32 = SSLServerValidateSessionData((unint64_t)__s1[0], (uint64_t)__s1[1], a2);
      if ((_DWORD)v32 == -9802)
        return v32;
      if (!(_DWORD)v32)
      {
        v32 = SSLInstallSessionFromData((unint64_t)__s1[0], (uint64_t)__s1[1], a2);
        if ((_DWORD)v32)
          return v32;
        *(_BYTE *)(a2 + 320) = 1;
      }
LABEL_103:
      if (!*(_BYTE *)(a2 + 320))
      {
        v32 = SelectNewCiphersuite(a2);
        if ((_DWORD)v32)
          return v32;
        SSLFreeBuffer((_QWORD *)(a2 + 304));
        if (*(_BYTE *)(a2 + 280))
        {
          if (!SSLAllocBuffer((size_t *)(a2 + 304), 0x10uLL))
          {
            v50 = sslRand((_QWORD *)(a2 + 304));
            if ((_DWORD)v50)
              goto LABEL_172;
          }
        }
        __s1[0] = 0;
        __s1[1] = 0;
        v7 = SSLEncodeServerHello((size_t *)__s1, (unsigned int *)a2);
        if ((_DWORD)v7)
          goto LABEL_178;
        v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
        if ((_DWORD)v8)
          goto LABEL_14;
        ++*(_WORD *)(a2 + 202);
        v40 = (char *)sslMalloc(0x20uLL);
        if (!v40)
          goto LABEL_258;
        *(_QWORD *)v40 = 0;
        *(_OWORD *)(v40 + 8) = *(_OWORD *)__s1;
        v40[24] = 22;
        v41 = (_QWORD **)(a2 + 664);
        v42 = *(_QWORD **)(a2 + 664);
        for (i = (_QWORD *)(a2 + 664); v42; v42 = (_QWORD *)*v42)
          i = v42;
        *i = v40;
        v44 = *(_DWORD *)(a2 + 336);
        if (v44 <= 0x13)
        {
          v45 = 1 << v44;
          if ((v45 & 0x28202) != 0)
          {
            if (!*(_QWORD *)(a2 + 56))
            {
              __ssl_debug("sslError", "SSLAdvanceHandshake", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 841, "SSLAdvanceHandshake: No server cert!\n");
              goto LABEL_232;
            }
            __s1[0] = 0;
            __s1[1] = 0;
            v7 = SSLEncodeCertificate((size_t *)__s1, a2);
            if ((_DWORD)v7)
              goto LABEL_178;
            v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
            if ((_DWORD)v8)
              goto LABEL_14;
            ++*(_WORD *)(a2 + 202);
            v64 = (char *)sslMalloc(0x20uLL);
            if (!v64)
              goto LABEL_258;
            *(_QWORD *)v64 = 0;
            *(_OWORD *)(v64 + 8) = *(_OWORD *)__s1;
            v64[24] = 22;
            v65 = *v41;
            for (j = (_QWORD *)(a2 + 664); v65; v65 = (_QWORD *)*v65)
              j = v65;
            *j = v64;
            if (*(_BYTE *)(a2 + 1009) && *(_QWORD *)(a2 + 1048))
            {
              __s1[0] = 0;
              __s1[1] = 0;
              v7 = SSLEncodeCertificateStatus((size_t *)__s1, a2);
              if ((_DWORD)v7)
                goto LABEL_178;
              v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
              if ((_DWORD)v8)
                goto LABEL_14;
              ++*(_WORD *)(a2 + 202);
              v67 = (char *)sslMalloc(0x20uLL);
              if (!v67)
                goto LABEL_258;
              *(_QWORD *)v67 = 0;
              *(_OWORD *)(v67 + 8) = *(_OWORD *)__s1;
              v67[24] = 22;
              v68 = *v41;
              for (k = (_QWORD *)(a2 + 664); v68; v68 = (_QWORD *)*v68)
                k = v68;
              *k = v67;
            }
LABEL_223:
            v70 = *(_DWORD *)(a2 + 336);
            if (v70 <= 0x12 && (((1 << v70) & 0x68A00) != 0 || v70 == 1 && *(_QWORD *)(a2 + 176)))
            {
              __s1[0] = 0;
              __s1[1] = 0;
              v7 = SSLEncodeServerKeyExchange((size_t *)__s1, a2);
              if ((_DWORD)v7)
                goto LABEL_178;
              v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
              if ((_DWORD)v8)
                goto LABEL_14;
              ++*(_WORD *)(a2 + 202);
              v71 = (char *)sslMalloc(0x20uLL);
              if (!v71)
                goto LABEL_258;
              *(_QWORD *)v71 = 0;
              *(_OWORD *)(v71 + 8) = *(_OWORD *)__s1;
              v71[24] = 22;
              v72 = *v41;
              for (m = (_QWORD *)(a2 + 664); v72; v72 = (_QWORD *)*v72)
                m = v72;
              *m = v71;
            }
            if (*(_BYTE *)(a2 + 424))
            {
              __s1[0] = 0;
              __s1[1] = 0;
              v7 = SSLEncodeCertificateRequest((size_t *)__s1, a2);
              if ((_DWORD)v7)
                goto LABEL_178;
              v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
              if ((_DWORD)v8)
                goto LABEL_14;
              ++*(_WORD *)(a2 + 202);
              v74 = (char *)sslMalloc(0x20uLL);
              if (!v74)
                goto LABEL_258;
              *(_QWORD *)v74 = 0;
              *(_OWORD *)(v74 + 8) = *(_OWORD *)__s1;
              v74[24] = 22;
              v75 = *v41;
              for (n = (_QWORD *)(a2 + 664); v75; v75 = (_QWORD *)*v75)
                n = v75;
              *n = v74;
              *(_BYTE *)(a2 + 432) = 1;
              *(_DWORD *)(a2 + 428) = 1;
            }
            __s1[0] = 0;
            __s1[1] = 0;
            v7 = SSLEncodeServerHelloDone((size_t *)__s1, a2);
            if ((_DWORD)v7)
              goto LABEL_178;
            v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
            if (!(_DWORD)v8)
            {
              ++*(_WORD *)(a2 + 202);
              v77 = (char *)sslMalloc(0x20uLL);
              if (!v77)
                goto LABEL_258;
              *(_QWORD *)v77 = 0;
              *(_OWORD *)(v77 + 8) = *(_OWORD *)__s1;
              v77[24] = 22;
              for (ii = *v41; ii; ii = (_QWORD *)*ii)
                v41 = (_QWORD **)ii;
              *v41 = v77;
              if (*(_BYTE *)(a2 + 432))
                v4 = 10;
              else
                v4 = 11;
              goto LABEL_124;
            }
            goto LABEL_14;
          }
          if ((v45 & 0xC0801) != 0)
          {
            if (*(_BYTE *)(a2 + 424))
            {
              __ssl_debug("sslError", "SSLAdvanceHandshake", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 826, "SSLAdvanceHandshake: Attempting Client Auth with Anonyous CipherSuite!\n");
LABEL_232:
              SSLFatalSessionAlert(80, a2);
              return 4294957448;
            }
            *(_BYTE *)(a2 + 424) = 0;
            goto LABEL_223;
          }
        }
        __ssl_debug("sslError", "SSLAdvanceHandshake", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshake.c", 855, "SSLAdvanceHandshake: Unsupported KEM!\n");
        SSLFatalSessionAlert(80, a2);
        return 4294957486;
      }
      SSLFreeBuffer((_QWORD *)(a2 + 304));
      SSLCopyBuffer(a2 + 288, (size_t *)(a2 + 304));
      v32 = SSLResumeServerSide(a2);
      if (!(_DWORD)v32)
        return SSLSendFlight(a2);
      return v32;
    case 2:
      *(_BYTE *)(a2 + 320) = 0;
      v12 = *(_QWORD *)(a2 + 272);
      if (v12)
      {
        if (*(_QWORD *)(a2 + 312))
        {
          __s1[0] = (void *)0xAAAAAAAAAAAAAAAALL;
          __s1[1] = (void *)0xAAAAAAAAAAAAAAAALL;
          SSLRetrieveSessionID(*(_QWORD *)(a2 + 264), v12, __s1);
          if (__s1[0] == *(void **)(a2 + 304) && !memcmp(__s1[1], *(const void **)(a2 + 312), (size_t)__s1[0]))
          {
            if (SSLClientValidateSessionDataAfter(*(_QWORD *)(a2 + 264), *(_QWORD *)(a2 + 272), a2))
            {
              v32 = 4294957496;
              v22 = 47;
              goto LABEL_56;
            }
            v50 = SSLInstallSessionFromData(*(_QWORD *)(a2 + 264), *(_QWORD *)(a2 + 272), a2);
            if ((_DWORD)v50 || (v50 = SSLInitPendingCiphers(a2), (_DWORD)v50))
            {
LABEL_172:
              v32 = v50;
              goto LABEL_55;
            }
            *(_BYTE *)(a2 + 320) = 1;
            if (*(_BYTE *)(a2 + 707))
              v4 = 13;
            else
              v4 = 14;
            goto LABEL_124;
          }
        }
      }
      v13 = *(_DWORD *)(a2 + 336);
      if (v13 > 0x13)
        return SSLSendFlight(a2);
      if (((1 << v13) & 0x28202) != 0)
      {
        v4 = 8;
        goto LABEL_124;
      }
      if (((1 << v13) & 0x40801) != 0)
        goto LABEL_42;
      if (v13 == 19)
        goto LABEL_123;
      return SSLSendFlight(a2);
    case 3:
LABEL_8:
      *(_QWORD *)(a2 + 428) = 0;
      if (*(_BYTE *)(a2 + 322))
      {
        *(_BYTE *)(a2 + 322) = 0;
        (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a2 + 1112) + 16))(*(_QWORD *)(a2 + 1104), 0, 0);
      }
      if (*(_BYTE *)(a2 + 323))
      {
        *(_BYTE *)(a2 + 323) = 0;
        (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a2 + 1112) + 16))(*(_QWORD *)(a2 + 1104), 1, 0);
      }
      __s1[0] = 0;
      __s1[1] = 0;
      v7 = SSLEncodeClientHello((size_t *)__s1, (unsigned int *)a2);
      if ((_DWORD)v7)
        goto LABEL_178;
      v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
      if ((_DWORD)v8)
        goto LABEL_14;
      ++*(_WORD *)(a2 + 202);
      v33 = (char *)sslMalloc(0x20uLL);
      if (!v33)
        goto LABEL_258;
      *(_QWORD *)v33 = 0;
      *(_OWORD *)(v33 + 8) = *(_OWORD *)__s1;
      v33[24] = 22;
      v34 = *(_QWORD **)(a2 + 664);
      if (v34)
      {
        do
        {
          v35 = v34;
          v34 = (_QWORD *)*v34;
        }
        while (v34);
      }
      else
      {
        v35 = (_QWORD *)(a2 + 664);
      }
      *v35 = v33;
      v4 = 6;
      goto LABEL_124;
    case 4:
    case 15:
      goto LABEL_2;
    case 11:
      if (*(_BYTE *)(a2 + 17) && *(_QWORD *)(a2 + 64))
        *(_DWORD *)(a2 + 428) = 2;
      v14 = *(_DWORD *)(a2 + 380);
      if (v14 == 10)
      {
        *(_DWORD *)(a2 + 380) = 11;
        if (*(_QWORD *)(a2 + 64))
          *(_BYTE *)(a2 + 434) = 1;
      }
      else
      {
        if (v14 != 8)
          return SSLSendFlight(a2);
        HIDWORD(v16) = *(_DWORD *)(a2 + 336) - 1;
        LODWORD(v16) = HIDWORD(v16);
        v15 = v16 >> 1;
        if ((v15 - 7) < 2 || v15 == 4)
        {
LABEL_42:
          v4 = 7;
          goto LABEL_124;
        }
        if (!v15)
        {
LABEL_123:
          v4 = 9;
          goto LABEL_124;
        }
      }
      return SSLSendFlight(a2);
    case 12:
      goto LABEL_123;
    case 13:
      if (*(_QWORD *)(a2 + 64))
      {
        *(_BYTE *)(a2 + 432) = 1;
        *(_DWORD *)(a2 + 428) = 1;
        return SSLSendFlight(a2);
      }
      SSLFatalSessionAlert(40, a2);
      return 4294957496;
    case 14:
      if (*(_QWORD *)(a2 + 64))
      {
        v18 = 80;
        v32 = 4294957486;
        switch(*(_DWORD *)(a2 + 72))
        {
          case 0:
            break;
          case 1:
            goto LABEL_109;
          case 2:
            goto LABEL_107;
          case 3:
            goto LABEL_108;
          default:
            goto LABEL_106;
        }
      }
      if (*(_DWORD *)(a2 + 428) != 1)
        goto LABEL_177;
      if (!*(_QWORD *)(a2 + 56))
        goto LABEL_112;
      v19 = *(_QWORD *)(a2 + 32);
      if (!v19)
        goto LABEL_112;
      v20 = *(_DWORD *)(v19 + 16);
      if (v20 == 1)
      {
        v21 = 64;
LABEL_160:
        *(_DWORD *)(a2 + 784) = v21;
        __s1[0] = 0;
        __s1[1] = 0;
        v7 = SSLEncodeCertificate((size_t *)__s1, a2);
        if ((_DWORD)v7)
          goto LABEL_178;
        v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
        if ((_DWORD)v8)
          goto LABEL_14;
        ++*(_WORD *)(a2 + 202);
        v37 = (char *)sslMalloc(0x20uLL);
        if (!v37)
          goto LABEL_258;
        *(_QWORD *)v37 = 0;
        *(_OWORD *)(v37 + 8) = *(_OWORD *)__s1;
        v37[24] = 22;
        v49 = *(_QWORD **)(a2 + 664);
        if (v49)
        {
          do
          {
            v39 = v49;
            v49 = (_QWORD *)*v49;
          }
          while (v49);
          goto LABEL_176;
        }
LABEL_175:
        v39 = (_QWORD *)(a2 + 664);
LABEL_176:
        *v39 = v37;
        goto LABEL_177;
      }
      if (!v20)
      {
        v21 = 1;
        goto LABEL_160;
      }
LABEL_112:
      *(_DWORD *)(a2 + 784) = -1;
      if (*(_DWORD *)a2 >= 0x301u)
      {
        __s1[0] = 0;
        __s1[1] = 0;
        v7 = SSLEncodeCertificate((size_t *)__s1, a2);
        if ((_DWORD)v7)
          goto LABEL_178;
        v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
        if ((_DWORD)v8)
          goto LABEL_14;
        ++*(_WORD *)(a2 + 202);
        v37 = (char *)sslMalloc(0x20uLL);
        if (!v37)
          goto LABEL_258;
        *(_QWORD *)v37 = 0;
        *(_OWORD *)(v37 + 8) = *(_OWORD *)__s1;
        v37[24] = 22;
        v38 = *(_QWORD **)(a2 + 664);
        if (v38)
        {
          do
          {
            v39 = v38;
            v38 = (_QWORD *)*v38;
          }
          while (v38);
          goto LABEL_176;
        }
        goto LABEL_175;
      }
      v32 = SSLSendAlert(1, 41, a2);
      if ((_DWORD)v32)
        return v32;
LABEL_177:
      __s1[0] = 0;
      __s1[1] = 0;
      v7 = SSLEncodeKeyExchange((size_t *)__s1, a2);
      if ((_DWORD)v7)
        goto LABEL_178;
      v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
      if ((_DWORD)v8)
        goto LABEL_14;
      ++*(_WORD *)(a2 + 202);
      v52 = (char *)sslMalloc(0x20uLL);
      if (!v52)
        goto LABEL_258;
      *(_QWORD *)v52 = 0;
      *(_OWORD *)(v52 + 8) = *(_OWORD *)__s1;
      v52[24] = 22;
      v53 = (_QWORD **)(a2 + 664);
      v54 = *(_QWORD **)(a2 + 664);
      for (jj = (_QWORD *)(a2 + 664); v54; v54 = (_QWORD *)*v54)
        jj = v54;
      *jj = v52;
      v32 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 24) + 8))(a2);
      if ((_DWORD)v32 || (v32 = SSLInitPendingCiphers(a2), (_DWORD)v32))
      {
LABEL_55:
        v22 = 80;
LABEL_56:
        SSLFatalSessionAlert(v22, a2);
        return v32;
      }
      bzero(*(void **)(a2 + 512), *(_QWORD *)(a2 + 504));
      v32 = SSLFreeBuffer((_QWORD *)(a2 + 504));
      if ((_DWORD)v32)
        return v32;
      if (!*(_BYTE *)(a2 + 433))
        goto LABEL_196;
      __s1[0] = 0;
      __s1[1] = 0;
      v7 = SSLEncodeCertificateVerify((size_t *)__s1, a2);
      if ((_DWORD)v7)
        goto LABEL_178;
      v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
      if ((_DWORD)v8)
        goto LABEL_14;
      ++*(_WORD *)(a2 + 202);
      v56 = (char *)sslMalloc(0x20uLL);
      if (!v56)
        goto LABEL_258;
      *(_QWORD *)v56 = 0;
      *(_OWORD *)(v56 + 8) = *(_OWORD *)__s1;
      v56[24] = 22;
      v57 = *v53;
      for (kk = (_QWORD *)(a2 + 664); v57; v57 = (_QWORD *)*v57)
        kk = v57;
      *kk = v56;
LABEL_196:
      __s1[0] = 0;
      __s1[1] = 0;
      v7 = SSLEncodeChangeCipherSpec((uint64_t)__s1, a2);
      if ((_DWORD)v7)
        goto LABEL_178;
      v59 = (char *)sslMalloc(0x20uLL);
      if (!v59)
        goto LABEL_258;
      *(_QWORD *)v59 = 0;
      *(_OWORD *)(v59 + 8) = *(_OWORD *)__s1;
      v59[24] = 20;
      v60 = *v53;
      for (mm = (_QWORD *)(a2 + 664); v60; v60 = (_QWORD *)*v60)
        mm = v60;
      *mm = v59;
      if (*(_BYTE *)(a2 + 17) || !*(_BYTE *)(a2 + 932) || *(_BYTE *)(a2 + 931))
        goto LABEL_201;
      __s1[0] = 0;
      __s1[1] = 0;
      v7 = SSLEncodeNPNEncryptedExtensionMessage((size_t *)__s1, a2);
      if ((_DWORD)v7)
        goto LABEL_178;
      v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
      if (!(_DWORD)v8)
      {
        ++*(_WORD *)(a2 + 202);
        v79 = (char *)sslMalloc(0x20uLL);
        if (!v79)
          goto LABEL_258;
        *(_QWORD *)v79 = 0;
        *(_OWORD *)(v79 + 8) = *(_OWORD *)__s1;
        v79[24] = 22;
        v80 = *v53;
        for (nn = (_QWORD *)(a2 + 664); v80; v80 = (_QWORD *)*v80)
          nn = v80;
        *nn = v79;
LABEL_201:
        __s1[0] = 0;
        __s1[1] = 0;
        v7 = SSLEncodeFinishedMessage((size_t *)__s1, a2);
        if ((_DWORD)v7)
          goto LABEL_178;
        v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
        if (!(_DWORD)v8)
        {
          ++*(_WORD *)(a2 + 202);
          v62 = (char *)sslMalloc(0x20uLL);
          if (!v62)
            goto LABEL_258;
          *(_QWORD *)v62 = 0;
          *(_OWORD *)(v62 + 8) = *(_OWORD *)__s1;
          v62[24] = 22;
          for (i1 = *v53; i1; i1 = (_QWORD *)*i1)
            v53 = (_QWORD **)i1;
          *v53 = v62;
          if (*(_BYTE *)(a2 + 707))
            v4 = 13;
          else
LABEL_2:
            v4 = 14;
LABEL_124:
          *(_DWORD *)(a2 + 380) = v4;
          return SSLSendFlight(a2);
        }
      }
LABEL_14:
      v32 = v8;
      v9 = 80;
LABEL_179:
      SSLFatalSessionAlert(v9, a2);
      goto LABEL_180;
    case 16:
      v32 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(a2 + 24) + 8))(a2);
      if ((_DWORD)v32)
        goto LABEL_55;
      v32 = SSLInitPendingCiphers(a2);
      if ((_DWORD)v32)
        goto LABEL_55;
      bzero(*(void **)(a2 + 512), *(_QWORD *)(a2 + 504));
      v32 = SSLFreeBuffer((_QWORD *)(a2 + 504));
      if ((_DWORD)v32)
        return v32;
      if (!*(_BYTE *)(a2 + 434))
        goto LABEL_2;
      v4 = 12;
      goto LABEL_124;
    case 20:
      if (*(_BYTE *)(a2 + 17) && *(_BYTE *)(a2 + 432))
      {
        v18 = 80;
        v32 = 4294957486;
        switch(*(_DWORD *)(a2 + 72))
        {
          case 0:
            goto LABEL_60;
          case 1:
            break;
          case 2:
LABEL_107:
            v18 = 48;
            v32 = 4294957484;
            break;
          case 3:
LABEL_108:
            v18 = 45;
            v32 = 4294957482;
            break;
          default:
LABEL_106:
            v18 = 46;
            v32 = 4294957489;
            break;
        }
LABEL_109:
        SSLFatalSessionAlert(v18, a2);
        if (*(_BYTE *)(a2 + 17) && *(_QWORD *)(a2 + 64))
          *(_DWORD *)(a2 + 428) = 3;
        return v32;
      }
LABEL_60:
      if (!*(_BYTE *)(a2 + 322))
      {
        *(_BYTE *)(a2 + 322) = 1;
        (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a2 + 1112) + 16))(*(_QWORD *)(a2 + 1104), 0, 1);
      }
      if (!*(_BYTE *)(a2 + 325))
      {
        if (!*(_BYTE *)(a2 + 323))
        {
          *(_BYTE *)(a2 + 323) = 1;
          (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a2 + 1112) + 16))(*(_QWORD *)(a2 + 1104), 1, 1);
        }
        goto LABEL_88;
      }
      __s1[0] = 0;
      __s1[1] = 0;
      v7 = SSLEncodeChangeCipherSpec((uint64_t)__s1, a2);
      if ((_DWORD)v7)
        goto LABEL_178;
      v23 = (char *)sslMalloc(0x20uLL);
      if (!v23)
        goto LABEL_258;
      *(_QWORD *)v23 = 0;
      *(_OWORD *)(v23 + 8) = *(_OWORD *)__s1;
      v23[24] = 20;
      v24 = (_QWORD **)(a2 + 664);
      v25 = *(_QWORD **)(a2 + 664);
      for (i2 = (_QWORD *)(a2 + 664); v25; v25 = (_QWORD *)*v25)
        i2 = v25;
      *i2 = v23;
      if (*(_BYTE *)(a2 + 17) || !*(_BYTE *)(a2 + 932) || *(_BYTE *)(a2 + 931))
        goto LABEL_68;
      __s1[0] = 0;
      __s1[1] = 0;
      v7 = SSLEncodeNPNEncryptedExtensionMessage((size_t *)__s1, a2);
      if ((_DWORD)v7)
        goto LABEL_178;
      v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
      if ((_DWORD)v8)
        goto LABEL_14;
      ++*(_WORD *)(a2 + 202);
      v46 = (char *)sslMalloc(0x20uLL);
      if (v46)
      {
        *(_QWORD *)v46 = 0;
        *(_OWORD *)(v46 + 8) = *(_OWORD *)__s1;
        v46[24] = 22;
        v47 = *v24;
        for (i3 = (_QWORD *)(a2 + 664); v47; v47 = (_QWORD *)*v47)
          i3 = v47;
        *i3 = v46;
LABEL_68:
        __s1[0] = 0;
        __s1[1] = 0;
        v7 = SSLEncodeFinishedMessage((size_t *)__s1, a2);
        if ((_DWORD)v7)
        {
LABEL_178:
          v32 = v7;
          v9 = 0;
          goto LABEL_179;
        }
        v8 = SSLUpdateHandshakeMacs((uint64_t)__s1, a2);
        if ((_DWORD)v8)
          goto LABEL_14;
        ++*(_WORD *)(a2 + 202);
        v27 = (char *)sslMalloc(0x20uLL);
        if (v27)
        {
          *(_QWORD *)v27 = 0;
          *(_OWORD *)(v27 + 8) = *(_OWORD *)__s1;
          v27[24] = 22;
          for (i4 = *v24; i4; i4 = (_QWORD *)*i4)
            v24 = (_QWORD **)i4;
          *v24 = v27;
LABEL_88:
          if (*(_BYTE *)(a2 + 17))
          {
            *(_DWORD *)(a2 + 380) = 16;
          }
          else
          {
            *(_DWORD *)(a2 + 380) = 17;
            if (!*(_BYTE *)(a2 + 320))
              tls_metric_client_finished(a2);
          }
          if (*(_BYTE *)(a2 + 280) && (!*(_BYTE *)(a2 + 320) || *(_QWORD *)(a2 + 720)))
            SSLAddSessionData(a2);
          return SSLSendFlight(a2);
        }
      }
LABEL_258:
      v32 = 4294957486;
LABEL_180:
      SSLFreeBuffer(__s1);
      return v32;
    default:
      return SSLSendFlight(a2);
  }
}

uint64_t SSLPrepareAndQueueMessage(uint64_t (*a1)(size_t *a1, uint64_t a2), int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v10;
  char *v11;
  _QWORD *v12;
  _QWORD *v13;
  __int128 v14;

  v14 = 0uLL;
  v6 = a1((size_t *)&v14, a3);
  if ((_DWORD)v6)
  {
    v7 = v6;
    v8 = 0;
LABEL_3:
    SSLFatalSessionAlert(v8, a3);
LABEL_4:
    SSLFreeBuffer(&v14);
    return v7;
  }
  if (a2 == 22)
  {
    if (a1 != SSLEncodeServerHelloRequest)
    {
      v10 = SSLUpdateHandshakeMacs((uint64_t)&v14, a3);
      if ((_DWORD)v10)
      {
        v7 = v10;
        v8 = 80;
        goto LABEL_3;
      }
    }
    ++*(_WORD *)(a3 + 202);
  }
  v11 = (char *)sslMalloc(0x20uLL);
  if (!v11)
  {
    v7 = 4294957486;
    goto LABEL_4;
  }
  *(_QWORD *)v11 = 0;
  *(_OWORD *)(v11 + 8) = v14;
  v11[24] = a2;
  v12 = *(_QWORD **)(a3 + 664);
  if (v12)
  {
    do
    {
      v13 = v12;
      v12 = (_QWORD *)*v12;
    }
    while (v12);
    v7 = 0;
    *v13 = v11;
  }
  else
  {
    v7 = 0;
    *(_QWORD *)(a3 + 664) = v11;
  }
  return v7;
}

void *sslMalloc(size_t a1)
{
  return malloc_type_malloc(a1, 0xC274D582uLL);
}

uint64_t HashSHA512Update()
{
  ccsha512_di();
  ccdigest_update();
  return 0;
}

uint64_t SSLResetFlight(uint64_t a1)
{
  _QWORD *v2;
  uint64_t result;
  _QWORD *v4;

  *(_DWORD *)(a1 + 204) = 0;
  if (*(_BYTE *)(a1 + 16))
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 1112) + 24))(*(_QWORD *)(a1 + 1104), 0);
  v2 = *(_QWORD **)(a1 + 664);
  *(_BYTE *)(a1 + 672) = 0;
  if (v2)
  {
    while (1)
    {
      result = SSLFreeBuffer(v2 + 1);
      if ((_DWORD)result)
        break;
      v4 = (_QWORD *)*v2;
      sslFree(v2);
      v2 = v4;
      if (!v4)
        goto LABEL_6;
    }
  }
  else
  {
LABEL_6:
    result = 0;
    *(_QWORD *)(a1 + 664) = 0;
  }
  return result;
}

uint64_t SSLSendFlight(uint64_t a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  _DWORD *v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  int SymmetricCipherAlgorithm;
  unsigned int KeyExchangeMethod;
  BOOL v20;
  BOOL v21;
  int v22;
  size_t v24;
  unint64_t v25;

  if (*(_BYTE *)(a1 + 16))
  {
    v2 = *(_DWORD *)(a1 + 204) + 1;
    *(_DWORD *)(a1 + 204) = v2;
    if (v2 > 0xA)
      return 4294957452;
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 1112) + 24))(*(_QWORD *)(a1 + 1104));
  }
  v4 = a1 + 664;
  while (1)
  {
    v4 = *(_QWORD *)v4;
    if (!v4)
      break;
    v5 = *(unsigned __int8 *)(v4 + 24);
    v6 = *(_QWORD *)(v4 + 8);
    if (*(_BYTE *)(a1 + 16) && (v7 = *(unsigned __int8 **)(v4 + 16), v5 == 22))
    {
      v24 = 0xAAAAAAAAAAAAAAAALL;
      v25 = 0xAAAAAAAAAAAAAAAALL;
      SSLDecodeInt(v7 + 4, 2);
      v8 = *(_QWORD *)(a1 + 840) - 13;
      v9 = *(unsigned __int8 *)(a1 + 343);
      if (*(_BYTE *)(a1 + 342))
        v8 = (v8 & -(uint64_t)*(unsigned __int8 *)(a1 + 342)) + ~(unint64_t)*(unsigned __int8 *)(a1 + 342);
      v10 = v8 - v9;
      v11 = SSLAllocBuffer(&v24, v8 - v9);
      if ((_DWORD)v11)
        return v11;
      v12 = v10 - 12;
      v13 = v6 - 12;
      v14 = (_DWORD *)v25;
      v15 = *(_DWORD *)v7;
      *(_WORD *)(v25 + 4) = *((_WORD *)v7 + 2);
      *v14 = v15;
      if (v13 <= v10 - 12)
      {
        v16 = 0;
LABEL_23:
        SSLEncodeInt(v25 + 6, v16, 3);
        SSLEncodeInt(v25 + 9, v13, 3);
        memcpy((void *)(v25 + 12), &v7[v16 + 12], v13);
        v24 = v13 + 12;
        v17 = (**(uint64_t (***)(_QWORD))(a1 + 1112))(*(_QWORD *)(a1 + 1104));
      }
      else
      {
        v16 = 0;
        while (1)
        {
          SSLEncodeInt(v25 + 6, v16, 3);
          SSLEncodeInt(v25 + 9, v12, 3);
          memcpy((void *)(v25 + 12), &v7[v16 + 12], v12);
          v17 = (**(uint64_t (***)(_QWORD, size_t, unint64_t, uint64_t))(a1 + 1112))(*(_QWORD *)(a1 + 1104), v24, v25, 22);
          if ((_DWORD)v17)
            break;
          v13 -= v12;
          v16 += v12;
          if (v13 <= v12)
            goto LABEL_23;
        }
      }
      v3 = v17;
      SSLFreeBuffer(&v24);
    }
    else
    {
      v11 = (**(uint64_t (***)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 1112))(*(_QWORD *)(a1 + 1104), *(_QWORD *)(v4 + 8), *(_QWORD *)(v4 + 16), *(unsigned __int8 *)(v4 + 24));
      if ((_DWORD)v11)
        return v11;
      if (v5 == 20)
      {
        v3 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 1112) + 72))(*(_QWORD *)(a1 + 1104));
        if ((_DWORD)v3)
        {
          SSLFatalSessionAlert(80, a1);
          return v3;
        }
        *(_BYTE *)(a1 + 325) = 0;
      }
      else
      {
        v3 = 0;
      }
    }
    if ((_DWORD)v3)
      return v3;
  }
  if (*(_BYTE *)(a1 + 672))
  {
    if ((SymmetricCipherAlgorithm = sslCipherSuiteGetSymmetricCipherAlgorithm(*(unsigned __int16 *)(a1 + 328)),
          KeyExchangeMethod = sslCipherSuiteGetKeyExchangeMethod(*(unsigned __int16 *)(a1 + 328)),
          *(_BYTE *)(a1 + 928))
      && ((SymmetricCipherAlgorithm - 5) <= 3 ? (v20 = KeyExchangeMethod > 0x11) : (v20 = 1),
          !v20 ? (v21 = ((1 << KeyExchangeMethod) & 0x28200) == 0) : (v21 = 1),
          !v21 && ((v22 = *(_DWORD *)(a1 + 784), v22 == -1) || v22 == 1 || v22 == 64))
      || *(_BYTE *)(a1 + 322))
    {
      if (!*(_BYTE *)(a1 + 323))
      {
        *(_BYTE *)(a1 + 323) = 1;
        (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 1112) + 16))(*(_QWORD *)(a1 + 1104), 1, 1);
      }
    }
  }
  return 0;
}

uint64_t SSLProcessCertificate(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  void *v11;

  if (a1 > 2)
  {
    v6 = SSLDecodeInt(a2, 3);
    if (v6 + 3 != a1)
    {
      __ssl_debug("sslError", "SSLProcessCertificate", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 208, "SSLProcessCertificate: length decode error 1\n");
      return 4294957496;
    }
    v11 = (void *)0xAAAAAAAAAAAAAAAALL;
    result = SSLDecodeBufferList(a2 + 3, v6, 3, (void ***)&v11);
    if ((_DWORD)result)
      return result;
    v8 = *(_QWORD *)(a3 + 64);
    if (*(_BYTE *)(a3 + 888))
    {
      if (v8)
      {
LABEL_21:
        tls_free_buffer_list(*(_QWORD **)(a3 + 64));
        result = 0;
        *(_QWORD *)(a3 + 64) = v11;
        return result;
      }
    }
    else if (v8)
    {
      v9 = (unint64_t)v11;
      while (v8)
      {
        if (!v9)
          break;
        v10 = *(_QWORD *)(v8 + 8);
        if (v10 != *(_QWORD *)(v9 + 8) || memcmp(*(const void **)(v8 + 16), *(const void **)(v9 + 16), v10))
          break;
        v8 = *(_QWORD *)v8;
        v9 = *(_QWORD *)v9;
        if (!(v8 | v9))
          goto LABEL_21;
      }
      __ssl_debug("sslError", "SSLProcessCertificate", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 232, "Illegal server identity change during renegotiation\n");
      tls_free_buffer_list(v11);
      return 4294957496;
    }
    if (__ssl_debug_enabled("sslLogNegotiateDebug"))
      debug_log_chain(v11);
    goto LABEL_21;
  }
  __ssl_debug("sslError", "SSLProcessCertificate", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 200, "SSLProcessCertificate: message length decode error\n");
  return 4294957496;
}

uint64_t __ssl_debug_enabled(const char *a1)
{
  uint64_t result;

  pthread_once(&__ssl_debug_enabled___security_debug_once, (void (*)(void))__security_debug_init);
  if (__ssl_debug_all)
    return 1;
  result = gDebugScope;
  if (gDebugScope)
  {
    result = (uint64_t)xpc_dictionary_get_value((xpc_object_t)gDebugScope, a1);
    if (result)
      return 1;
  }
  return result;
}

uint64_t SSLDecodeBufferList(unsigned __int8 *a1, unint64_t a2, int a3, void ***a4)
{
  unint64_t v5;
  _QWORD *v7;
  void **v8;
  unint64_t v9;
  unsigned int v10;
  unint64_t v11;
  size_t v12;
  size_t *v13;
  void **v14;
  uint64_t v15;
  unsigned __int8 *v16;
  void **v17;
  uint64_t v18;

  if (!a2)
  {
    v17 = 0;
LABEL_13:
    v18 = 0;
    *a4 = v17;
    return v18;
  }
  v5 = a2;
  v7 = 0;
  v8 = 0;
  v9 = a3;
  while (1)
  {
    if (v5 < v9)
    {
      __ssl_debug("sslError", "SSLDecodeBufferList", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslDecode.c", 72, "SSLDecodeBufferList: length decode error 2\n");
LABEL_17:
      v18 = 4294957496;
      goto LABEL_20;
    }
    v10 = SSLDecodeInt(a1, v9);
    v11 = v9 + v10;
    if (v5 < v11)
    {
      __ssl_debug("sslError", "SSLDecodeBufferList", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslDecode.c", 79, "SSLDecodeBufferList: length decode error 3\n");
      goto LABEL_17;
    }
    v12 = v10;
    if (!v10)
    {
      __ssl_debug("sslError", "SSLDecodeBufferList", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslDecode.c", 84, "SSLDecodeBufferList: lenght decode error 4 (empty item)\n");
      goto LABEL_17;
    }
    v13 = (size_t *)sslMalloc(0x18uLL);
    if (!v13)
    {
      v18 = 4294967188;
      goto LABEL_20;
    }
    v14 = (void **)v13;
    v15 = SSLAllocBuffer(v13 + 1, v12);
    if ((_DWORD)v15)
      break;
    v16 = &a1[v9];
    *v14 = 0;
    memcpy(v14[2], v16, v12);
    v17 = v14;
    if (v8)
    {
      *v7 = v14;
      v17 = v8;
    }
    a1 = &v16[v12];
    v7 = v14;
    v8 = v17;
    v5 -= v11;
    if (!v5)
      goto LABEL_13;
  }
  v18 = v15;
  sslFree(v14);
LABEL_20:
  tls_free_buffer_list(v8);
  return v18;
}

uint64_t HashSHA512Init()
{
  ccsha512_di();
  ccdigest_init();
  return 0;
}

double tls_record_advance_write_cipher(uint64_t a1)
{
  uint64_t v2;
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v2 = *(_QWORD *)(a1 + 400);
  if (!v2 || !(*(unsigned int (**)(_QWORD))(v2 + 8))(*(_QWORD *)(a1 + 408)))
  {
    v4 = *(_OWORD *)(a1 + 152);
    *(_OWORD *)(a1 + 424) = *(_OWORD *)(a1 + 136);
    *(_OWORD *)(a1 + 440) = v4;
    v5 = *(_OWORD *)(a1 + 184);
    *(_OWORD *)(a1 + 456) = *(_OWORD *)(a1 + 168);
    *(_OWORD *)(a1 + 472) = v5;
    v6 = *(_OWORD *)(a1 + 120);
    *(_OWORD *)(a1 + 392) = *(_OWORD *)(a1 + 104);
    *(_OWORD *)(a1 + 408) = v6;
    v7 = *(_OWORD *)(a1 + 344);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a1 + 328);
    *(_OWORD *)(a1 + 152) = v7;
    v8 = *(_OWORD *)(a1 + 376);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a1 + 360);
    *(_OWORD *)(a1 + 184) = v8;
    v9 = *(_OWORD *)(a1 + 312);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a1 + 296);
    *(_OWORD *)(a1 + 120) = v9;
    *(_BYTE *)(a1 + 490) = 0;
    result = 0.0;
    *(_OWORD *)(a1 + 296) = 0u;
    *(_OWORD *)(a1 + 312) = 0u;
    *(_OWORD *)(a1 + 328) = 0u;
    *(_OWORD *)(a1 + 344) = 0u;
    *(_OWORD *)(a1 + 360) = 0u;
    *(_OWORD *)(a1 + 376) = 0u;
  }
  return result;
}

void tls_handshake_destroy(uint64_t a1)
{
  _QWORD *v2;
  void (*v3)(void);

  tls_metric_destroyed(a1);
  SSLResetFlight(a1);
  CloseHash((uint64_t)&SSLHashSHA1, (_QWORD *)(a1 + 568));
  CloseHash((uint64_t)&SSLHashMD5, (_QWORD *)(a1 + 584));
  CloseHash((uint64_t)&SSLHashSHA256, (_QWORD *)(a1 + 600));
  CloseHash((uint64_t)&SSLHashSHA384, (_QWORD *)(a1 + 616));
  CloseHash((uint64_t)&SSLHashSHA512, (_QWORD *)(a1 + 632));
  sslFreePubKey(a1 + 40);
  sslFreePubKey(a1 + 168);
  SSLFreeBuffer((_QWORD *)(a1 + 648));
  SSLFreeBuffer((_QWORD *)(a1 + 248));
  SSLFreeBuffer((_QWORD *)(a1 + 288));
  SSLFreeBuffer((_QWORD *)(a1 + 304));
  SSLFreeBuffer((_QWORD *)(a1 + 712));
  SSLFreeBuffer((_QWORD *)(a1 + 736));
  SSLFreeBuffer((_QWORD *)(a1 + 504));
  SSLFreeBuffer((_QWORD *)(a1 + 80));
  SSLFreeBuffer((_QWORD *)(a1 + 128));
  SSLFreeBuffer((_QWORD *)(a1 + 936));
  SSLFreeBuffer((_QWORD *)(a1 + 952));
  SSLFreeBuffer((_QWORD *)(a1 + 976));
  SSLFreeBuffer((_QWORD *)(a1 + 992));
  SSLFreeBuffer((_QWORD *)(a1 + 856));
  SSLFreeBuffer((_QWORD *)(a1 + 872));
  SSLFreeBuffer((_QWORD *)(a1 + 912));
  SSLFreeBuffer((_QWORD *)(a1 + 896));
  SSLFreeBuffer((_QWORD *)(a1 + 392));
  SSLFreeBuffer((_QWORD *)(a1 + 1048));
  SSLFreeBuffer((_QWORD *)(a1 + 1016));
  tls_free_buffer_list(*(_QWORD **)(a1 + 1032));
  tls_free_buffer_list(*(_QWORD **)(a1 + 1072));
  sslFree(*(void **)(a1 + 408));
  sslFree(*(void **)(a1 + 352));
  sslFree(*(void **)(a1 + 368));
  sslFree(*(void **)(a1 + 112));
  sslFree(*(void **)(a1 + 792));
  sslFree(*(void **)(a1 + 808));
  sslFree(*(void **)(a1 + 776));
  sslFree(*(void **)(a1 + 152));
  sslFree(*(void **)(a1 + 96));
  sslFree(*(void **)(a1 + 104));
  sslFree(*(void **)(a1 + 1080));
  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v3 = (void (*)(void))v2[1];
    if (v3 && *v2)
      v3();
    sslFree(v2);
  }
  SSLFreeCertificates(*(_QWORD *)(a1 + 56));
  SSLFreeCertificates(*(_QWORD *)(a1 + 64));
  if (!*(_BYTE *)(a1 + 17))
    SSLFreeCertificates(*(_QWORD *)(a1 + 384));
  free((void *)a1);
}

uint64_t SSLFreeBuffer(_QWORD *a1)
{
  void *v2;
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = (void *)a1[1];
  if (v2)
    free(v2);
  result = 0;
  *a1 = 0;
  a1[1] = 0;
  return result;
}

void sslFree(void *a1)
{
  if (a1)
    free(a1);
}

uint64_t tls_free_buffer_list(_QWORD *a1)
{
  _QWORD *v1;
  _QWORD *v2;
  void *v3;

  if (a1)
  {
    v1 = a1;
    do
    {
      v2 = (_QWORD *)*v1;
      v3 = (void *)v1[2];
      if (v3)
        free(v3);
      free(v1);
      v1 = v2;
    }
    while (v2);
  }
  return 0;
}

uint64_t sslFreePubKey(uint64_t a1)
{
  if (a1)
  {
    sslFree(*(void **)(a1 + 8));
    *(_QWORD *)(a1 + 8) = 0;
    sslFree(0);
    *(_QWORD *)(a1 + 8) = 0;
  }
  return 0;
}

uint64_t SSLInitMessageHashes(size_t *a1)
{
  size_t *v2;
  uint64_t result;
  size_t *v4;
  size_t *v5;
  size_t *v6;
  size_t *v7;

  v2 = a1 + 71;
  result = CloseHash((uint64_t)&SSLHashSHA1, a1 + 71);
  if (!(_DWORD)result)
  {
    v4 = a1 + 73;
    result = CloseHash((uint64_t)&SSLHashMD5, a1 + 73);
    if (!(_DWORD)result)
    {
      v5 = a1 + 75;
      result = CloseHash((uint64_t)&SSLHashSHA256, a1 + 75);
      if (!(_DWORD)result)
      {
        v6 = a1 + 77;
        result = CloseHash((uint64_t)&SSLHashSHA384, a1 + 77);
        if (!(_DWORD)result)
        {
          v7 = a1 + 79;
          result = CloseHash((uint64_t)&SSLHashSHA512, v7);
          if (!(_DWORD)result)
          {
            result = ReadyHash((uint64_t)&SSLHashSHA1, v2);
            if (!(_DWORD)result)
            {
              result = ReadyHash((uint64_t)&SSLHashMD5, v4);
              if (!(_DWORD)result)
              {
                result = ReadyHash((uint64_t)&SSLHashSHA256, v5);
                if (!(_DWORD)result)
                {
                  result = ReadyHash((uint64_t)&SSLHashSHA384, v6);
                  if (!(_DWORD)result)
                    return ReadyHash((uint64_t)&SSLHashSHA512, v7);
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

uint64_t CloseHash(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a2[1])
    return 0;
  result = (*(uint64_t (**)(_QWORD *))(a1 + 40))(a2);
  if (!(_DWORD)result)
    return SSLFreeBuffer(a2);
  return result;
}

uint64_t ReadyHash(uint64_t a1, size_t *a2)
{
  uint64_t result;

  result = SSLAllocBuffer(a2, *(unsigned int *)(a1 + 8));
  if (!(_DWORD)result)
    return (*(uint64_t (**)(size_t *))(a1 + 16))(a2);
  return result;
}

uint64_t SSLAllocBuffer(size_t *a1, size_t size)
{
  void *v4;
  size_t v5;
  uint64_t v6;

  v4 = malloc_type_malloc(size, 0xC274D582uLL);
  if (v4)
    v5 = size;
  else
    v5 = 0;
  if (v4)
    v6 = 0;
  else
    v6 = 0xFFFFFFFFLL;
  *a1 = v5;
  a1[1] = (size_t)v4;
  return v6;
}

uint64_t HashSHA1Init()
{
  ccsha1_di();
  ccdigest_init();
  return 0;
}

uint64_t HashMD5Init()
{
  ccmd5_di();
  ccdigest_init();
  return 0;
}

void tls_metric_destroyed(uint64_t a1)
{
  const char *v2;
  const char *v3;
  _QWORD *v4;

  if (!arc4random_uniform(0x64u))
  {
    if (*(_BYTE *)(a1 + 17))
      v2 = "server_released";
    else
      v2 = "client_released";
    if (process_identifier___csops_once != -1)
      dispatch_once(&process_identifier___csops_once, &__block_literal_global);
    if (*(_BYTE *)(a1 + 16))
      v3 = "dtls";
    else
      v3 = "tls";
    v4 = tls_metric_event_new(v2, (const char *)process_identifier_data, v3);
    free(v4);
  }
}

uint64_t tls12GenerateMasterSecret(uint64_t a1)
{
  __int128 v2;
  int v3;
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (**v7)();
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  size_t v12[2];
  _OWORD v13[4];
  _OWORD v14[4];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v13[2] = v2;
  v13[3] = v2;
  v13[0] = v2;
  v13[1] = v2;
  v12[0] = 0xAAAAAAAAAAAAAAAALL;
  if (*(_BYTE *)(a1 + 768) && *(_BYTE *)(a1 + 769))
  {
    v3 = *(_DWORD *)(a1 + 344);
    if (v3 == 4)
      v4 = &SSLHashSHA384;
    else
      v4 = &SSLHashSHA256;
    if (v3 == 4)
      v5 = a1 + 616;
    else
      v5 = a1 + 600;
    v12[1] = 0;
    v6 = CloneHashState((uint64_t)v4, v5, v12);
    if (!(_DWORD)v6)
    {
      *(_QWORD *)&v14[0] = *v4;
      *((_QWORD *)&v14[0] + 1) = v13;
      v7 = off_1EA97DCE0;
      if (v3 != 4)
        v7 = off_1EA97DCA8;
      v8 = ((uint64_t (*)(size_t *, _OWORD *))*v7)(v12, v14);
      if (!(_DWORD)v8)
        v8 = tls_handshake_internal_prf(a1, *(_QWORD *)(a1 + 512), *(_QWORD *)(a1 + 504), "extended master secret", 0x16uLL, *((void **)&v14[0] + 1), *(size_t *)&v14[0], (char *)(a1 + 520), 0x30uLL);
      v6 = v8;
      SSLFreeBuffer(v12);
    }
  }
  else
  {
    v9 = *(_OWORD *)(a1 + 452);
    v14[0] = *(_OWORD *)(a1 + 436);
    v14[1] = v9;
    v10 = *(_OWORD *)(a1 + 484);
    v14[2] = *(_OWORD *)(a1 + 468);
    v14[3] = v10;
    return tls_handshake_internal_prf(a1, *(_QWORD *)(a1 + 512), *(_QWORD *)(a1 + 504), "master secret", 0xDuLL, v14, 0x40uLL, (char *)(a1 + 520), 0x30uLL);
  }
  return v6;
}

void __ssl_debug(const char *a1, const char *a2, uint64_t a3, uint64_t a4, char *a5, ...)
{
  uint64_t i;
  char *v8[2];
  va_list va;

  va_start(va, a5);
  v8[0] = 0;
  va_copy((va_list)&v8[1], va);
  vasprintf(v8, a5, va);
  if (v8[0])
  {
    if (__ssl_debug_enabled(a1))
      syslog(4, "[%s] %s: %s", a1, a2, v8[0]);
    for (i = gDebugLoggers; i; i = *(_QWORD *)(i + 16))
      (*(void (**)(_QWORD, const char *, const char *, char *))i)(*(_QWORD *)(i + 8), a1, a2, v8[0]);
    sslFree(v8[0]);
  }
}

uint64_t SelectNewCiphersuite(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  int v4;
  unsigned __int16 *v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t result;

  if (!*(_DWORD *)(a1 + 360))
    return 4294957495;
  v2 = 0;
  while (1)
  {
    v3 = *(unsigned int *)(a1 + 376);
    if ((_DWORD)v3)
    {
      v4 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 352) + 2 * v2);
      v5 = *(unsigned __int16 **)(a1 + 368);
      if (*v5 == v4)
        break;
      v6 = 1;
      do
      {
        v7 = v6;
        if (v3 == v6)
          break;
        v8 = v5[v6++];
      }
      while (v8 != v4);
      if (v7 < v3)
        break;
    }
LABEL_15:
    if (++v2 >= (unint64_t)*(unsigned int *)(a1 + 360))
      return 4294957495;
  }
  HIDWORD(v9) = sslCipherSuiteGetKeyExchangeMethod(v4) - 1;
  LODWORD(v9) = HIDWORD(v9);
  switch((v9 >> 1))
  {
    case 0u:
    case 4u:
    case 8u:
      v10 = *(_QWORD *)(a1 + 32);
      if (!v10)
        goto LABEL_15;
      v11 = 0;
      goto LABEL_14;
    case 7u:
      v10 = *(_QWORD *)(a1 + 32);
      if (!v10)
        goto LABEL_15;
      v11 = 1;
LABEL_14:
      if (*(_DWORD *)(v10 + 16) != v11)
        goto LABEL_15;
      goto LABEL_17;
    default:
LABEL_17:
      *(_WORD *)(a1 + 328) = *(_WORD *)(*(_QWORD *)(a1 + 352) + 2 * v2);
      InitCipherSpecParams(a1);
      result = 0;
      break;
  }
  return result;
}

uint64_t tls_handshake_create(char a1, char a2)
{
  void *v4;
  uint64_t v5;
  int v6;

  v4 = malloc_type_malloc(0x468uLL, 0x10F00405A3378A2uLL);
  v5 = (uint64_t)v4;
  if (v4)
  {
    bzero(v4, 0x468uLL);
    *(_BYTE *)(v5 + 16) = a1;
    *(_QWORD *)(v5 + 840) = 1400;
    *(_BYTE *)(v5 + 17) = a2;
    *(_QWORD *)(v5 + 24) = Ssl3Callouts;
    InitCipherSpecParams(v5);
    tls_handshake_set_config(v5, 0);
    if (!*(_BYTE *)(v5 + 17))
    {
      *(_BYTE *)(v5 + 1066) = 1;
      *(_BYTE *)(v5 + 1008) = 1;
    }
    *(_BYTE *)(v5 + 768) = 1;
    tls_handshake_set_curves(v5, KnownCurves, 3u);
    *(_DWORD *)(v5 + 144) = -1;
    *(_DWORD *)(v5 + 784) = -1;
    tls_handshake_set_sigalgs(v5, KnownSigAlgs, 8u);
    if (*(_BYTE *)(v5 + 17))
      v6 = 1;
    else
      v6 = 2;
    *(_DWORD *)(v5 + 380) = v6;
  }
  return v5;
}

uint64_t InitCipherSpecParams(uint64_t a1)
{
  int v2;
  char SymmetricCipherBlockIvSize;
  uint64_t result;

  v2 = *(unsigned __int16 *)(a1 + 328);
  *(_WORD *)(a1 + 332) = v2;
  *(_BYTE *)(a1 + 343) = sslCipherSuiteGetMacSize(v2);
  *(_DWORD *)(a1 + 344) = sslCipherSuiteGetMacAlgorithm(*(unsigned __int16 *)(a1 + 328));
  *(_BYTE *)(a1 + 340) = sslCipherSuiteGetSymmetricCipherKeySize(*(unsigned __int16 *)(a1 + 328));
  SymmetricCipherBlockIvSize = sslCipherSuiteGetSymmetricCipherBlockIvSize(*(unsigned __int16 *)(a1 + 328));
  *(_BYTE *)(a1 + 342) = SymmetricCipherBlockIvSize;
  *(_BYTE *)(a1 + 341) = SymmetricCipherBlockIvSize;
  result = sslCipherSuiteGetKeyExchangeMethod(*(unsigned __int16 *)(a1 + 328));
  *(_DWORD *)(a1 + 336) = result;
  return result;
}

uint64_t sslCipherSuiteGetSymmetricCipherKeySize(int a1)
{
  uint64_t v1;

  v1 = (int)sslCipherSuiteGetSymmetricCipherAlgorithm(a1) - 1;
  if (v1 > 8)
    return 0;
  else
    return byte_1DF068FCF[v1];
}

uint64_t sslCipherSuiteGetSymmetricCipherBlockIvSize(int a1)
{
  uint64_t v1;

  v1 = (int)sslCipherSuiteGetSymmetricCipherAlgorithm(a1) - 1;
  if (v1 > 8)
    return 0;
  else
    return byte_1DF068FD8[v1];
}

uint64_t sslCipherSuiteGetMacSize(int a1)
{
  uint64_t v2;

  if (sslCipherSuiteGetSymmetricCipherAlgorithm(a1) - 7 >= 2)
    return (0x3020141000uLL >> (8 * sslCipherSuiteGetMacAlgorithm(a1)));
  else
    LOBYTE(v2) = 0;
  return v2;
}

uint64_t tls_handshake_set_sigalgs(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t *v4;
  unsigned int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  size_t v10;
  void *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;

  LODWORD(v3) = a3;
  v4 = a2;
  if (a3)
  {
    v6 = 0;
    v7 = a3;
    v8 = a2;
    do
    {
      v9 = *v8++;
      v6 += tls_handshake_sigalg_is_supported(v9);
      --v7;
    }
    while (v7);
    v10 = 8 * v6;
  }
  else
  {
    v10 = 0;
  }
  sslFree(*(void **)(a1 + 808));
  *(_DWORD *)(a1 + 800) = 0;
  v11 = sslMalloc(v10);
  *(_QWORD *)(a1 + 808) = v11;
  if (v11)
    result = 0;
  else
    result = 4294967188;
  if (v11 && (_DWORD)v3)
  {
    v3 = v3;
    do
    {
      if (tls_handshake_sigalg_is_supported(*v4))
      {
        v13 = *(_QWORD *)(a1 + 808);
        v14 = *(unsigned int *)(a1 + 800);
        *(_DWORD *)(a1 + 800) = v14 + 1;
        *(_QWORD *)(v13 + 8 * v14) = *v4;
      }
      ++v4;
      --v3;
    }
    while (v3);
    return 0;
  }
  return result;
}

uint64_t tls_handshake_sigalg_is_supported(uint64_t a1)
{
  if (((HIDWORD(a1) - 1) & 0xFFFFFFFD) != 0)
    return 0;
  else
    return (a1 < 7) & (0x74u >> a1);
}

uint64_t tls_handshake_set_config(uint64_t a1, unsigned int a2)
{
  int v2;
  signed int v3;
  int v4;
  unint64_t v5;
  char v6;

  *(_DWORD *)(a1 + 1092) = a2;
  if (*(_BYTE *)(a1 + 16))
  {
    v2 = 65279;
    *(_DWORD *)(a1 + 8) = 65279;
  }
  else
  {
    v3 = a2 + 1;
    if (a2 + 1 >= 0xF)
      v4 = 769;
    else
      v4 = dword_1DF068C60[v3];
    *(_DWORD *)(a1 + 8) = v4;
    if (v3 > 0xE)
      v2 = 771;
    else
      v2 = dword_1DF068C9C[v3];
  }
  *(_DWORD *)(a1 + 12) = v2;
  *(_DWORD *)(a1 + 76) = 1024;
  v5 = 0x100000000000101uLL >> (8 * (a2 - 4));
  if (a2 - 4 > 7)
    LOBYTE(v5) = 0;
  if (*(_BYTE *)(a1 + 17))
    v6 = 0;
  else
    v6 = v5;
  *(_BYTE *)(a1 + 1064) = v6;
  return tls_handshake_set_ciphersuites_internal(a1, a2, all_ciphersuites, 0x24u);
}

uint64_t SSLInitPendingCiphers(uint64_t a1)
{
  uint64_t v2;
  size_t v4;
  uint64_t v5;

  v4 = 0xAAAAAAAAAAAAAAAALL;
  v5 = 0;
  v2 = SSLAllocBuffer(&v4, 2* (*(unsigned __int8 *)(a1 + 340)+ (unint64_t)*(unsigned __int8 *)(a1 + 343)+ *(unsigned __int8 *)(a1 + 341)));
  if (!(_DWORD)v2)
  {
    v2 = (**(uint64_t (***)(size_t, uint64_t, uint64_t))(a1 + 24))(v4, v5, a1);
    if (!(_DWORD)v2)
    {
      v2 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, size_t, uint64_t))(*(_QWORD *)(a1 + 1112) + 64))(*(_QWORD *)(a1 + 1104), *(unsigned __int16 *)(a1 + 328), *(unsigned __int8 *)(a1 + 17), v4, v5);
      if (!(_DWORD)v2)
        *(_WORD *)(a1 + 324) = 257;
    }
    SSLFreeBuffer(&v4);
  }
  return v2;
}

uint64_t tls_record_init_pending_ciphers(uint64_t a1, int a2, int a3, uint64_t a4, char *a5)
{
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 **v13;
  _DWORD *v14;
  uint64_t v15;
  size_t v16;
  size_t v17;
  char *v18;
  char *v19;
  uint64_t result;
  _DWORD **v21;
  uint64_t v22;

  *(_WORD *)a1 = a2;
  *(_QWORD *)(a1 + 200) = sslCipherSuiteGetDigestInfo(a2);
  *(_QWORD *)(a1 + 296) = sslCipherSuiteGetDigestInfo(a2);
  *(_QWORD *)(a1 + 208) = sslCipherSuiteGetSymmetricCipher(a2);
  *(_QWORD *)(a1 + 304) = sslCipherSuiteGetSymmetricCipher(a2);
  *(_BYTE *)(a1 + 224) = 0;
  *(_BYTE *)(a1 + 320) = 1;
  if (*(_BYTE *)(a1 + 488))
  {
    *(_QWORD *)(a1 + 232) = ((unint64_t)*(unsigned __int16 *)(a1 + 238) << 48) + 0x1000000000000;
    *(_QWORD *)(a1 + 328) = ((unint64_t)*(unsigned __int16 *)(a1 + 334) << 48) + 0x1000000000000;
  }
  else
  {
    *(_QWORD *)(a1 + 328) = 0;
    *(_QWORD *)(a1 + 232) = 0;
  }
  v10 = a3 == 0;
  if (a3)
    v11 = a1 + 296;
  else
    v11 = a1 + 200;
  if (v10)
    v12 = a1 + 296;
  else
    v12 = a1 + 200;
  v13 = *(unsigned __int8 ***)(a1 + 208);
  v14 = *v13;
  if (*((_DWORD *)*v13 + 1) == 2)
  {
    v15 = *((unsigned __int8 *)v14 + 8);
    if (a4 != 2 * (*((unsigned __int8 *)v14 + 9) + v15))
      return 4294957296;
  }
  else
  {
    v16 = **(_QWORD **)(a1 + 200);
    if (a4 != 2 * (v16 + *((unsigned __int8 *)v14 + 8) + *((unsigned __int8 *)v14 + 9)))
      return 4294957296;
    memcpy((void *)(v12 + 41), a5, v16);
    v17 = **(_QWORD **)(a1 + 200);
    v18 = &a5[v17];
    memcpy((void *)(v11 + 41), v18, v17);
    v13 = *(unsigned __int8 ***)(a1 + 208);
    a5 = &v18[**(_QWORD **)(a1 + 200)];
    v15 = (*v13)[8];
  }
  v19 = &a5[v15];
  result = ((uint64_t (*)(_QWORD, _QWORD, char *, char *, _QWORD, uint64_t))v13[2])(**(_QWORD **)(v12 + 8), *(unsigned __int8 *)(v12 + 24), a5, &a5[v15 + v15], *(_QWORD *)(a1 + 496), v12 + 16);
  if (!(_DWORD)result)
  {
    v21 = *(_DWORD ***)(a1 + 208);
    v22 = -8;
    if ((*v21)[1] != 2)
      v22 = 0;
    result = ((uint64_t (*)(_QWORD, _QWORD, char *, char *, _QWORD, uint64_t))v21[2])(**(_QWORD **)(v11 + 8), *(unsigned __int8 *)(v11 + 24), v19, &v19[*((unsigned __int8 *)*v21 + 8) + (unint64_t)*((unsigned __int8 *)*v21 + 9) + v22], *(_QWORD *)(a1 + 496), v11 + 16);
    if (!(_DWORD)result)
    {
      *(_BYTE *)(a1 + 336) = 1;
      *(_BYTE *)(a1 + 240) = 1;
    }
  }
  return result;
}

uint64_t CCGCMSymmInit(uint64_t a1, int a2, const void *a3, _DWORD *a4, void (**a5)(_QWORD, uint64_t, uint64_t), void **a6)
{
  uint64_t v12;
  size_t *v13;
  _QWORD *v14;
  _QWORD *v15;
  size_t v16;
  void *v17;
  uint64_t result;

  if (*a6)
    sslFree(*a6);
  if (a2)
    v12 = ccaes_gcm_encrypt_mode();
  else
    v12 = ccaes_gcm_decrypt_mode();
  v13 = (size_t *)v12;
  v14 = sslMalloc(0x30uLL);
  if (v14)
  {
    v15 = v14;
    *v14 = v13;
    v14[1] = sslMalloc(*v13);
    *((_DWORD *)v15 + 4) = *a4;
    (*a5)(a5, 8, (uint64_t)v15 + 20);
    v16 = *(unsigned __int8 *)(a1 + 8);
    v15[5] = v16;
    v17 = sslMalloc(v16);
    v15[4] = v17;
    memcpy(v17, a3, v15[5]);
    result = 0;
    *a6 = v15;
  }
  else
  {
    __ssl_debug("sslError", "CCGCMSymmInit", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslAesGcmCipher.c", 69, "CCSymmInit: Can't allocate context\n");
    return 4294957296;
  }
  return result;
}

unsigned __int16 *tls_record_create(char a1, uint64_t a2)
{
  unsigned __int16 *v4;
  unsigned __int16 *v5;

  v4 = (unsigned __int16 *)sslMalloc(0x1F8uLL);
  v5 = v4;
  if (v4)
  {
    *((_QWORD *)v4 + 62) = 0;
    *((_OWORD *)v4 + 29) = 0u;
    *((_OWORD *)v4 + 30) = 0u;
    *((_OWORD *)v4 + 27) = 0u;
    *((_OWORD *)v4 + 28) = 0u;
    *((_OWORD *)v4 + 25) = 0u;
    *((_OWORD *)v4 + 26) = 0u;
    *((_OWORD *)v4 + 23) = 0u;
    *((_OWORD *)v4 + 24) = 0u;
    *((_OWORD *)v4 + 21) = 0u;
    *((_OWORD *)v4 + 22) = 0u;
    *((_OWORD *)v4 + 19) = 0u;
    *((_OWORD *)v4 + 20) = 0u;
    *((_OWORD *)v4 + 17) = 0u;
    *((_OWORD *)v4 + 18) = 0u;
    *((_OWORD *)v4 + 15) = 0u;
    *((_OWORD *)v4 + 16) = 0u;
    *((_OWORD *)v4 + 13) = 0u;
    *((_OWORD *)v4 + 14) = 0u;
    *((_OWORD *)v4 + 11) = 0u;
    *((_OWORD *)v4 + 12) = 0u;
    *((_OWORD *)v4 + 9) = 0u;
    *((_OWORD *)v4 + 10) = 0u;
    *((_OWORD *)v4 + 7) = 0u;
    *((_OWORD *)v4 + 8) = 0u;
    *((_OWORD *)v4 + 5) = 0u;
    *((_OWORD *)v4 + 6) = 0u;
    *((_OWORD *)v4 + 3) = 0u;
    *((_OWORD *)v4 + 4) = 0u;
    *((_OWORD *)v4 + 1) = 0u;
    *((_OWORD *)v4 + 2) = 0u;
    *(_OWORD *)v4 = 0u;
    *((_DWORD *)v4 + 123) = 0;
    *v4 = 0;
    *((_QWORD *)v4 + 13) = sslCipherSuiteGetDigestInfo(0);
    *((_QWORD *)v5 + 1) = sslCipherSuiteGetDigestInfo(*v5);
    *((_QWORD *)v5 + 2) = sslCipherSuiteGetSymmetricCipher(*v5);
    *((_QWORD *)v5 + 14) = sslCipherSuiteGetSymmetricCipher(*v5);
    *((_BYTE *)v5 + 32) = 0;
    *((_BYTE *)v5 + 128) = 1;
    *((_BYTE *)v5 + 488) = a1;
    *((_QWORD *)v5 + 62) = a2;
  }
  return v5;
}

_UNKNOWN **sslCipherSuiteGetSymmetricCipher(int a1)
{
  unsigned int v1;

  v1 = sslCipherSuiteGetSymmetricCipherAlgorithm(a1) - 4;
  if (v1 > 4)
    return &SSLCipherNull;
  else
    return (_UNKNOWN **)off_1EA97DEB0[v1];
}

uint64_t sslCipherSuiteGetDigestInfo(int a1)
{
  int MacAlgorithm;
  void *v2;
  uint64_t result;

  MacAlgorithm = sslCipherSuiteGetMacAlgorithm(a1);
  v2 = &null_di;
  switch(MacAlgorithm)
  {
    case 0:
      goto LABEL_4;
    case 1:
      result = ccmd5_di();
      break;
    case 2:
      result = ccsha1_di();
      break;
    case 3:
      result = ccsha256_di();
      break;
    case 4:
      result = ccsha384_di();
      break;
    default:
      __ssl_debug("sslError", "sslCipherSuiteGetDigestInfo", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/tls_record.c", 64, "Invalid hashAlgorithm %d", MacAlgorithm);
      v2 = 0;
LABEL_4:
      result = (uint64_t)v2;
      break;
  }
  return result;
}

uint64_t tls1GenerateKeyMaterial(size_t a1, char *a2, uint64_t a3)
{
  __int128 v3;
  __int128 v4;
  _BYTE v6[13];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_OWORD *)(a3 + 484);
  v7 = *(_OWORD *)(a3 + 468);
  v8 = v3;
  v4 = *(_OWORD *)(a3 + 452);
  v9 = *(_OWORD *)(a3 + 436);
  qmemcpy(v6, "key expansion", sizeof(v6));
  v10 = v4;
  return tls_handshake_internal_prf(a3, a3 + 520, 0x30uLL, 0, 0, v6, 0x4DuLL, a2, a1);
}

uint64_t SSLGenServerECDHParamsAndKey(uint64_t a1)
{
  uint64_t v2;
  int v3;
  _QWORD *v4;

  if (*(_DWORD *)(a1 + 1088))
  {
    v2 = 0;
    while (!tls_handshake_curve_is_supported(*(unsigned __int16 *)(*(_QWORD *)(a1 + 1080) + 2 * v2)))
    {
      if (++v2 >= (unint64_t)*(unsigned int *)(a1 + 1088))
        goto LABEL_7;
    }
    *(_DWORD *)(a1 + 144) = *(unsigned __int16 *)(*(_QWORD *)(a1 + 1080) + 2 * v2);
  }
LABEL_7:
  v3 = *(_DWORD *)(a1 + 144);
  switch(v3)
  {
    case 25:
      v4 = (_QWORD *)ccec_cp_521();
      return sslEcdhCreateKey(v4, (_QWORD *)(a1 + 152));
    case 24:
      v4 = (_QWORD *)MEMORY[0x1DF0F5018]();
      return sslEcdhCreateKey(v4, (_QWORD *)(a1 + 152));
    case 23:
      v4 = (_QWORD *)MEMORY[0x1DF0F500C]();
      return sslEcdhCreateKey(v4, (_QWORD *)(a1 + 152));
  }
  return 4294957496;
}

uint64_t tls_handshake_set_curves(uint64_t a1, unsigned __int16 *a2, unsigned int a3)
{
  unsigned __int16 *v4;
  unsigned int v6;
  uint64_t v7;
  unsigned __int16 *v8;
  int v9;
  _WORD *v10;
  _WORD *v11;
  uint64_t v12;
  __int16 v13;
  int v14;

  v4 = a2;
  v6 = 0;
  if (a3)
  {
    v7 = a3;
    v8 = a2;
    do
    {
      v9 = *v8++;
      v6 += tls_handshake_curve_is_supported(v9);
      --v7;
    }
    while (v7);
  }
  sslFree(*(void **)(a1 + 112));
  *(_DWORD *)(a1 + 120) = 0;
  v10 = sslMalloc(2 * v6);
  if (!v10)
    return 4294967188;
  v11 = v10;
  *(_DWORD *)(a1 + 120) = v6;
  *(_QWORD *)(a1 + 112) = v10;
  if (a3)
  {
    v12 = a3;
    do
    {
      v14 = *v4++;
      v13 = v14;
      if (tls_handshake_curve_is_supported(v14))
        *v11++ = v13;
      --v12;
    }
    while (v12);
  }
  return 0;
}

BOOL tls_handshake_curve_is_supported(int a1)
{
  return (a1 - 23) < 3;
}

uint64_t SSLEncodeServerKeyExchange(size_t *a1, uint64_t a2)
{
  unsigned int v2;
  uint64_t MaxSigSize;
  unint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  size_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unint64_t v27;
  uint64_t v28;
  size_t v29;
  char *v30;
  __int128 v31;
  __int128 *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  unsigned int v40;
  void *v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  size_t v49;
  char *v50;
  int v51;
  int *v52;
  __int128 v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t (*v57)(size_t *, size_t *);
  uint64_t v58;
  size_t v59;
  size_t v60;
  const void *v61;
  size_t v62;
  char *v63;
  size_t v64;
  size_t size;
  _QWORD v66[2];
  _QWORD v67[3];
  uint64_t v68;
  size_t v69;
  uint64_t v70;
  uint64_t v71;
  __int128 *v72;
  size_t v73;
  const void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a2 + 336);
  MaxSigSize = 4294967292;
  if (v2 > 0x12)
    return MaxSigSize;
  if (((1 << v2) & 0x28202) == 0)
  {
    if (((1 << v2) & 0x40800) == 0)
      return MaxSigSize;
    if (*(_BYTE *)(a2 + 16))
      v16 = 12;
    else
      v16 = 4;
    if (v2 == 18)
    {
      v17 = SSLGenServerECDHParamsAndKey(a2);
      if (!(_DWORD)v17)
      {
        v27 = (((unint64_t)(cczp_bitlen() + 7) >> 2) | 1) + 4;
        v17 = SSLAllocBuffer(a1, v27 + v16);
        if (!(_DWORD)v17)
        {
          v28 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 12, v27);
          SSLEncodeECDHKeyParams(a2, v28);
          return 0;
        }
      }
    }
    else
    {
      if (v2 != 11)
      {
        SSLFreeBuffer(a1);
        return 4294957486;
      }
      v17 = SSLGenServerDHParamsAndKey(a2);
      if (!(_DWORD)v17)
      {
        v18 = SSLEncodedDHKeyParamsLen(a2);
        v17 = SSLAllocBuffer(a1, v18 + v16);
        if (!(_DWORD)v17)
        {
          v19 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 12, v18);
          SSLEncodeDHKeyParams(a2, v19);
          return 0;
        }
      }
    }
    return v17;
  }
  v64 = 0xAAAAAAAAAAAAAAAALL;
  size = 0xAAAAAAAAAAAAAAAALL;
  v60 = 0xAAAAAAAAAAAAAAAALL;
  v61 = 0;
  v62 = 0xAAAAAAAAAAAAAAAALL;
  v63 = 0;
  HIDWORD(v6) = v2 - 1;
  LODWORD(v6) = v2 - 1;
  MaxSigSize = 4294957486;
  v7 = *(unsigned __int8 *)(a2 + 16);
  v8 = 1;
  switch((v6 >> 1))
  {
    case 0u:
      v9 = ccn_write_uint_size();
      v10 = ccn_write_uint_size();
      v11 = SSLAllocBuffer(&v60, v9 + v10 + 4);
      if ((_DWORD)v11)
        goto LABEL_87;
      v12 = (uint64_t)v61;
      v13 = ccn_write_uint_size();
      v14 = ccn_write_uint_size();
      v15 = SSLEncodeInt(v12, v13, 2);
      ccn_write_uint();
      SSLEncodeInt(v15 + v13, v14, 2);
      ccn_write_uint();
      v8 = 1;
      goto LABEL_22;
    case 4u:
      v11 = SSLGenServerDHParamsAndKey(a2);
      if ((_DWORD)v11)
        goto LABEL_87;
      v20 = SSLEncodedDHKeyParamsLen(a2);
      v11 = SSLAllocBuffer(&v60, v20);
      if ((_DWORD)v11)
        goto LABEL_87;
      SSLEncodeDHKeyParams(a2, (uint64_t)v61);
      goto LABEL_22;
    case 7u:
      v8 = 0;
      goto LABEL_19;
    case 8u:
LABEL_19:
      v11 = SSLGenServerECDHParamsAndKey(a2);
      if ((_DWORD)v11
        || (v21 = cczp_bitlen(), v11 = SSLAllocBuffer(&v60, (((unint64_t)(v21 + 7) >> 2) | 1) + 4), (_DWORD)v11))
      {
LABEL_87:
        MaxSigSize = v11;
        goto LABEL_88;
      }
      SSLEncodeECDHKeyParams(a2, (uint64_t)v61);
LABEL_22:
      MaxSigSize = sslGetMaxSigSize(*(_QWORD *)(a2 + 32), &size);
      if ((_DWORD)MaxSigSize)
        goto LABEL_88;
      MaxSigSize = SSLAllocBuffer(&v62, size);
      if ((_DWORD)MaxSigSize)
        goto LABEL_88;
      v22 = *(_DWORD *)a2;
      if (*(_BYTE *)(a2 + 16))
        v23 = 65279;
      else
        v23 = 770;
      if (v22 <= v23)
      {
        v59 = v60 + 2;
        v29 = v62;
        v30 = v63;
        v73 = v60;
        v74 = v61;
        LODWORD(v77) = -1431655766;
        *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v75 = v31;
        v76 = v31;
        memset(v67, 170, sizeof(v67));
        v68 = 0;
        v71 = 32;
        v72 = (__int128 *)(a2 + 436);
        v69 = 32;
        v70 = a2 + 468;
        if (v8)
        {
          v67[0] = 16;
          v67[1] = &v75;
          MaxSigSize = ReadyHash((uint64_t)&SSLHashMD5, &v67[2]);
          if ((_DWORD)MaxSigSize
            || (MaxSigSize = HashMD5Update(), (_DWORD)MaxSigSize)
            || (MaxSigSize = HashMD5Update(), (_DWORD)MaxSigSize)
            || (MaxSigSize = HashMD5Update(), (_DWORD)MaxSigSize)
            || (MaxSigSize = HashMD5Final((uint64_t)&v67[2], v67), (_DWORD)MaxSigSize)
            || (MaxSigSize = SSLFreeBuffer(&v67[2]), (_DWORD)MaxSigSize))
          {
LABEL_55:
            SSLFreeBuffer(&v67[2]);
            LOBYTE(v34) = 0;
            LOBYTE(v35) = 0;
            goto LABEL_56;
          }
          v32 = &v75;
          v33 = 36;
        }
        else
        {
          v32 = &v76;
          v33 = 20;
        }
        v67[0] = 20;
        v67[1] = &v76;
        MaxSigSize = ReadyHash((uint64_t)&SSLHashSHA1, &v67[2]);
        if (!(_DWORD)MaxSigSize)
        {
          MaxSigSize = HashSHA1Update();
          if (!(_DWORD)MaxSigSize)
          {
            MaxSigSize = HashSHA1Update();
            if (!(_DWORD)MaxSigSize)
            {
              MaxSigSize = HashSHA1Update();
              if (!(_DWORD)MaxSigSize)
              {
                MaxSigSize = HashSHA1Final((uint64_t)&v67[2], v67);
                if (!(_DWORD)MaxSigSize)
                {
                  MaxSigSize = SSLFreeBuffer(&v67[2]);
                  if (!(_DWORD)MaxSigSize)
                    MaxSigSize = sslRawSign(*(_QWORD **)(a2 + 32), (uint64_t)v32, v33, v30, v29, &v64);
                }
              }
            }
          }
        }
        goto LABEL_55;
      }
      if (!*(_DWORD *)(a2 + 788))
        goto LABEL_34;
      v24 = *(_QWORD *)(a2 + 792);
      if (!v24)
        goto LABEL_34;
      v25 = *(_QWORD *)(a2 + 32);
      if (!v25)
        goto LABEL_34;
      v26 = *(_DWORD *)(v25 + 16);
      if (v26)
      {
        if (v26 != 1 || v22 < 0x301)
        {
LABEL_34:
          MaxSigSize = 4294957486;
          goto LABEL_88;
        }
        v42 = 0;
        v34 = 3;
      }
      else
      {
        v42 = 1;
        v34 = 1;
      }
      v43 = *(unsigned int *)(a2 + 800);
      if (!(_DWORD)v43)
      {
        MaxSigSize = 4294957496;
        goto LABEL_88;
      }
      v44 = 0;
      v45 = *(_QWORD *)(a2 + 808);
      v46 = v24 + 4;
      while (v34 != *(_DWORD *)(v45 + 8 * v44 + 4))
      {
LABEL_74:
        ++v44;
        MaxSigSize = 4294957496;
        if (v44 == v43)
          goto LABEL_88;
      }
      v35 = *(unsigned int *)(v45 + 8 * v44);
      v47 = *(unsigned int *)(a2 + 788);
      v48 = v46;
      while (__PAIR64__(v34, v35) != *(_QWORD *)(v48 - 4))
      {
        v48 += 8;
        if (!--v47)
          goto LABEL_74;
      }
      v59 = v60 + 4;
      v49 = v62;
      v50 = v63;
      v73 = v60;
      v74 = v61;
      v69 = 0xAAAAAAAAAAAAAAAALL;
      v70 = 0;
      v67[2] = 32;
      v68 = a2 + 436;
      v51 = v35 - 2;
      v67[1] = a2 + 468;
      v66[1] = 0;
      v67[0] = 32;
      if ((v35 - 2) < 5 && ((0x1Du >> v51) & 1) != 0)
      {
        v52 = off_1EA97E808[v51];
        *(_QWORD *)&v53 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v53 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v77 = v53;
        v78 = v53;
        v75 = v53;
        v76 = v53;
        v66[0] = 0xAAAAAAAAAAAAAAAALL;
        v71 = *v52;
        v72 = &v75;
        v58 = v71;
        MaxSigSize = ReadyHash((uint64_t)v52, &v69);
        if (!(_DWORD)MaxSigSize)
        {
          v57 = (uint64_t (*)(size_t *, size_t *))*((_QWORD *)v52 + 3);
          MaxSigSize = v57(&v69, &v67[2]);
          if (!(_DWORD)MaxSigSize)
          {
            MaxSigSize = v57(&v69, v67);
            if (!(_DWORD)MaxSigSize)
            {
              MaxSigSize = v57(&v69, &v73);
              if (!(_DWORD)MaxSigSize)
              {
                MaxSigSize = (*((uint64_t (**)(size_t *, uint64_t *))v52 + 4))(&v69, &v71);
                if (!(_DWORD)MaxSigSize)
                {
                  v54 = *(_QWORD **)(a2 + 32);
                  v55 = v42
                      ? sslRsaSign((uint64_t)v54, v35, (uint64_t)&v75, v58, v50, v49, &v64)
                      : sslRawSign(v54, (uint64_t)&v75, v58, v50, v49, &v64);
                  MaxSigSize = v55;
                  if ((_DWORD)v55)
                    __ssl_debug("sslError", "SSLSignServerKeyExchangeTls12", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 287, "SSLDecodeSignedServerKeyExchangeTls12: sslRawVerify returned %d\n", v55);
                }
              }
            }
          }
        }
        SSLFreeBuffer(v66);
        SSLFreeBuffer(&v69);
      }
      else
      {
        __ssl_debug("sslError", "SSLSignServerKeyExchangeTls12", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 247, "SSLVerifySignedServerKeyExchangeTls12: unsupported hash %d\n", v35);
        MaxSigSize = 4294957496;
      }
LABEL_56:
      if (!(_DWORD)MaxSigSize)
      {
        v36 = v64 + v59;
        v37 = 12;
        if (!v7)
          v37 = 4;
        MaxSigSize = SSLAllocBuffer(a1, v36 + v37);
        if (!(_DWORD)MaxSigSize)
        {
          v38 = (char *)SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 12, v36);
          memcpy(v38, v61, v60);
          v39 = &v38[v60];
          if (*(_BYTE *)(a2 + 16))
            v40 = 65279;
          else
            v40 = 770;
          if (*(_DWORD *)a2 > v40)
          {
            *v39 = v35;
            v39[1] = v34;
            v39 += 2;
          }
          v41 = (void *)SSLEncodeInt((uint64_t)v39, v64, 2);
          memcpy(v41, v63, v64);
          MaxSigSize = 0;
        }
      }
LABEL_88:
      SSLFreeBuffer(&v60);
      SSLFreeBuffer(&v62);
      if (!(_DWORD)MaxSigSize)
        return 0;
      return MaxSigSize;
    default:
      goto LABEL_88;
  }
}

uint64_t sslEcdhCreateKey(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  uint64_t result;

  v3 = sslMalloc((32 * *a1) | 0x10);
  if (!v3)
    return 4294967188;
  v4 = v3;
  if (!ccDRBGGetRngState())
    abort();
  result = ccec_generate_key();
  if (!(_DWORD)result)
    *a2 = v4;
  return result;
}

uint64_t sslRsaSign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5, size_t a6, size_t *a7)
{
  size_t v8;
  uint64_t v10;
  size_t v11;
  size_t __len;

  v8 = a6;
  __len = a6;
  v10 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, char *, size_t *))(a1 + 32))(*(_QWORD *)a1, a2, a3, a4, a5, &__len);
  if ((_DWORD)v10)
  {
    __ssl_debug("sslError", "sslRsaSign", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 399, "privKey->desc.rsa.sign: failed (error %d)\n", v10);
    v8 = __len;
  }
  else
  {
    v11 = v8 - __len;
    if (v8 <= __len)
    {
      v8 = __len;
    }
    else
    {
      memmove(&a5[v11], a5, __len);
      bzero(a5, v11);
    }
  }
  *a7 = v8;
  return v10;
}

uint64_t sslGetMaxSigSize(uint64_t a1, _QWORD *a2)
{
  uint64_t result;

  if (!a1)
    return 4294957486;
  if (*(_DWORD *)(a1 + 16) > 1u)
    return 4294967246;
  result = 0;
  *a2 = *(_QWORD *)(a1 + 24);
  return result;
}

uint64_t SSLEncodeServerHelloDone(size_t *a1, uint64_t a2)
{
  size_t v4;
  uint64_t v5;

  if (*(_BYTE *)(a2 + 16))
    v4 = 12;
  else
    v4 = 4;
  v5 = SSLAllocBuffer(a1, v4);
  if (!(_DWORD)v5)
    SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 14, 0);
  return v5;
}

uint64_t SSLEncodeECDHKeyParams(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = ((unint64_t)(cczp_bitlen() + 7) >> 2) | 1;
  v5 = SSLEncodeInt(a2, 3uLL, 1);
  v6 = SSLEncodeInt(v5, *(int *)(a1 + 144), 2);
  SSLEncodeInt(v6, v4, 1);
  return ccec_export_pub();
}

uint64_t SSLEncodeChangeCipherSpec(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)a1 = 1;
  result = SSLAllocBuffer((size_t *)a1, 1uLL);
  if (!(_DWORD)result)
  {
    **(_BYTE **)(a1 + 8) = 1;
    *(_BYTE *)(a2 + 672) = 1;
  }
  return result;
}

uint64_t SSLEncodeCertificateRequest(size_t *a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *i;
  void *v18;
  uint64_t *v19;

  if (*(_BYTE *)(a2 + 16))
    v4 = 65279;
  else
    v4 = 770;
  if (*(_DWORD *)a2 <= v4)
    v5 = 0;
  else
    v5 = (2 * *(_DWORD *)(a2 + 800) + 2);
  v6 = *(_QWORD **)(a2 + 384);
  if (v6)
  {
    v7 = 0;
    do
    {
      v8 = v6;
      v6 = (_QWORD *)*v6;
      v7 += v8[1] + 2;
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }
  v9 = 12;
  if (!*(_BYTE *)(a2 + 16))
    v9 = 4;
  result = SSLAllocBuffer(a1, v5 + v7 + 5 + v9);
  if (!(_DWORD)result)
  {
    v11 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 13, v5 + v7 + 5);
    *(_WORD *)v11 = 258;
    v12 = v11 + 3;
    *(_BYTE *)(v11 + 2) = 64;
    if (v5)
    {
      v12 = SSLEncodeInt(v12, v5 - 2, 2);
      if (*(_DWORD *)(a2 + 800))
      {
        v13 = 0;
        v14 = 0;
        do
        {
          v15 = SSLEncodeInt(v12, *(unsigned int *)(*(_QWORD *)(a2 + 808) + v13), 1);
          v12 = SSLEncodeInt(v15, *(unsigned int *)(*(_QWORD *)(a2 + 808) + v13 + 4), 1);
          ++v14;
          v13 += 8;
        }
        while (v14 < *(unsigned int *)(a2 + 800));
      }
    }
    v16 = SSLEncodeInt(v12, v7, 2);
    for (i = *(uint64_t **)(a2 + 384); i; v16 = (uint64_t)v18 + v19[1])
    {
      v18 = (void *)SSLEncodeInt(v16, i[1], 2);
      memcpy(v18, (const void *)i[2], i[1]);
      v19 = i;
      i = (uint64_t *)*i;
    }
    return 0;
  }
  return result;
}

uint64_t HashSHA512Close()
{
  ccsha512_di();
  return 0;
}

uint64_t HashSHA1Close()
{
  ccsha1_di();
  return 0;
}

uint64_t HashMD5Close()
{
  ccmd5_di();
  return 0;
}

uint64_t SSLProcessServerHelloDone(uint64_t result)
{
  if (result)
  {
    __ssl_debug("sslError", "SSLProcessServerHelloDone", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeFinish.c", 269, "SSLProcessServerHelloDone: nonzero msg len\n");
    return 4294957496;
  }
  return result;
}

uint64_t tls_handshake_get_peer_sct_list(uint64_t a1)
{
  return *(_QWORD *)(a1 + 1072);
}

uint64_t SSLEncodeKeyExchange(size_t *a1, uint64_t a2)
{
  unsigned int v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  BOOL v8;
  int v9;
  uint64_t EcPubKeyFromBits;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t Key;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  _QWORD **v29;
  unint64_t v30;
  unsigned int v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  size_t v35;
  size_t v36;
  _QWORD **v37;

  v4 = *(_DWORD *)(a2 + 336);
  if (v4 > 0x13)
    goto LABEL_26;
  if (((1 << v4) & 0x68000) == 0)
  {
    if (((1 << v4) & 0xA00) != 0)
    {
      v6 = (uint64_t *)(a2 + 104);
      v5 = *(void **)(a2 + 104);
      v36 = 0xAAAAAAAAAAAAAAAALL;
      v37 = (_QWORD **)0xAAAAAAAAAAAAAAAALL;
      sslFree(v5);
      SSLFreeBuffer((_QWORD *)(a2 + 504));
      if (*(_QWORD *)(a2 + 96))
      {
        if (cczp_bitlen() < (unint64_t)*(unsigned int *)(a2 + 76))
          return 4294957446;
        Key = sslDhCreateKey(*(_QWORD *)(a2 + 96), (_QWORD *)(a2 + 104));
        if (!(_DWORD)Key)
        {
          v7 = sslDhKeyExchange(*(uint64_t **)(a2 + 104), a2 + 80, (size_t *)(a2 + 504));
          if (!(_DWORD)v7)
          {
            v7 = sslDhExportPub(*v6, &v36);
            if (!(_DWORD)v7)
            {
              v25 = v36 + 2;
              v26 = 12;
              if (!*(_BYTE *)(a2 + 16))
                v26 = 4;
              v7 = SSLAllocBuffer(a1, v26 + v25);
              if (!(_DWORD)v7)
              {
                v14 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 16, v25);
                v15 = v36;
                v16 = 2;
                goto LABEL_39;
              }
            }
          }
          return v7;
        }
        return Key;
      }
      return 4294957496;
    }
    if (v4 == 19)
    {
      v17 = *(_QWORD *)(a2 + 912) + 2;
      v18 = 12;
      if (!*(_BYTE *)(a2 + 16))
        v18 = 4;
      v7 = SSLAllocBuffer(a1, v18 + v17);
      if (!(_DWORD)v7)
      {
        v19 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 16, v17);
        v20 = (void *)SSLEncodeInt(v19, *(_QWORD *)(a2 + 912), 2);
        memcpy(v20, *(const void **)(a2 + 920), *(_QWORD *)(a2 + 912));
        v21 = *(_QWORD *)(a2 + 896);
        if (v21)
        {
          v7 = SSLAllocBuffer((size_t *)(a2 + 504), 2 * v21 + 4);
          if (!(_DWORD)v7)
          {
            v22 = (void *)SSLEncodeInt(*(_QWORD *)(a2 + 512), v21, 2);
            bzero(v22, v21);
            v23 = (void *)SSLEncodeInt((uint64_t)v22 + v21, v21, 2);
            memcpy(v23, *(const void **)(a2 + 904), v21);
            return 0;
          }
        }
        else
        {
          return 4294957448;
        }
      }
      return v7;
    }
LABEL_26:
    if (v4 != 1)
    {
      __ssl_debug("sslError", "SSLEncodeKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1823, "SSLEncodeKeyExchange: unknown method (%d)\n", v4);
      return 4294967292;
    }
    if (!*(_BYTE *)(a2 + 40) || !*(_QWORD *)(a2 + 48))
    {
      __ssl_debug("sslError", "SSLEncodeRSAKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 954, "SSLEncodeRSAKeyExchange: no RSA peer pub key\n");
      return 4294957487;
    }
    Key = SSLAllocBuffer((size_t *)(a2 + 504), 0x30uLL);
    if (!(_DWORD)Key)
    {
      v35 = 0xAAAAAAAAAAAAAAAALL;
      SSLEncodeInt(*(_QWORD *)(a2 + 512), *(unsigned int *)(a2 + 4), 2);
      v29 = (_QWORD **)(*(_QWORD *)(a2 + 512) + 2);
      v36 = 46;
      v37 = v29;
      v7 = sslRand(&v36);
      if (!(_DWORD)v7)
      {
        v30 = sslPubKeyLengthInBytes();
        if (!v30)
          __ssl_debug("sslError", "SSLEncodeRSAKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 965, "SSLEncodeRSAKeyExchange: peer key modulus is 0\n");
        v31 = *(_DWORD *)a2;
        if (*(_DWORD *)a2 <= 0x300u)
          v32 = v30;
        else
          v32 = v30 + 2;
        if (*(_BYTE *)(a2 + 16))
          v33 = 12;
        else
          v33 = 4;
        v7 = SSLAllocBuffer(a1, v33 + v32);
        if (!(_DWORD)v7)
        {
          v34 = (char *)(a1[1] + v33 + 2 * (v31 > 0x300));
          SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 16, v32);
          if (v31 >= 0x301)
            SSLEncodeInt(a1[1] + v33, v30, 2);
          v7 = sslRsaEncrypt(a2 + 40, *(const void **)(a2 + 512), 0x30uLL, v34, v30, &v35);
          if ((_DWORD)v7)
            __ssl_debug("sslError", "SSLEncodeRSAKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1004, "SSLEncodeRSAKeyExchange: error %d\n", v7);
        }
      }
      return v7;
    }
    return Key;
  }
  v36 = 0xAAAAAAAAAAAAAAAALL;
  v37 = (_QWORD **)0xAAAAAAAAAAAAAAAALL;
  v8 = v4 > 0x12;
  v9 = (1 << v4) & 0x68000;
  if (v8 || v9 == 0)
    return 4294957486;
  if (!*(_QWORD *)(a2 + 136))
  {
    __ssl_debug("sslError", "SSLGenClientECDHKeyAndExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1399, "SSLGenClientECDHKeyAndExchange: incomplete server params\n");
    return 4294957496;
  }
  EcPubKeyFromBits = sslGetEcPubKeyFromBits(*(_DWORD *)(a2 + 144), a2 + 128, (uint64_t)&v36);
  if ((_DWORD)EcPubKeyFromBits
    || (sslFree(*(void **)(a2 + 152)),
        EcPubKeyFromBits = sslEcdhCreateKey(*v37, (_QWORD *)(a2 + 152)),
        (_DWORD)EcPubKeyFromBits))
  {
    v7 = EcPubKeyFromBits;
    sslFreePubKey((uint64_t)&v36);
    return v7;
  }
  SSLFreeBuffer((_QWORD *)(a2 + 504));
  v7 = sslEcdhKeyExchange(*(uint64_t ***)(a2 + 152), (uint64_t)v37, (size_t *)(a2 + 504));
  sslFreePubKey((uint64_t)&v36);
  if (!(_DWORD)v7)
  {
    v36 = 0;
    v37 = 0;
    sslEcdhExportPub(*(_QWORD *)(a2 + 152), &v36);
    v12 = v36 + 1;
    v13 = 12;
    if (!*(_BYTE *)(a2 + 16))
      v13 = 4;
    v7 = SSLAllocBuffer(a1, v13 + v12);
    if (!(_DWORD)v7)
    {
      v14 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 16, v12);
      v15 = v36;
      v16 = 1;
LABEL_39:
      v27 = (void *)SSLEncodeInt(v14, v15, v16);
      memcpy(v27, v37, v36);
      SSLFreeBuffer(&v36);
    }
  }
  return v7;
}

uint64_t SSLProcessKeyExchange(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t EcPubKeyFromBits;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  unsigned __int8 *v15;
  int v16;
  uint64_t v17;
  uint32x2_t v18;
  int8x16_t v19;
  int64x2_t v20;
  int8x16_t v21;
  int8x8_t v22;
  int64x2_t v23;
  int64_t v24;
  unsigned __int8 *v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unint64_t v30;
  void *v31;
  void *v32;
  _QWORD v34[2];
  uint64_t v35;
  _OWORD v36[3];
  uint64_t v37;

  v4 = (uint64_t)a2;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = *(_DWORD *)(a3 + 336);
  if (v6 <= 0x13)
  {
    if (((1 << v6) & 0x68000) != 0)
    {
      *(_QWORD *)&v36[0] = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v36[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      if (!*(_QWORD *)(a3 + 152))
        return 4294957486;
      if (!a1)
        return 4294957496;
      v7 = SSLDecodeInt(a2, 1);
      if (a1 != v7 + 1)
        return 4294957496;
      v8 = v7;
      SSLFreeBuffer((_QWORD *)(a3 + 128));
      EcPubKeyFromBits = SSLAllocBuffer((size_t *)(a3 + 128), v8);
      if ((_DWORD)EcPubKeyFromBits
        || (memmove(*(void **)(a3 + 136), (const void *)(v4 + 1), v8),
            EcPubKeyFromBits = sslGetEcPubKeyFromBits(*(_DWORD *)(a3 + 144), a3 + 128, (uint64_t)v36),
            (_DWORD)EcPubKeyFromBits))
      {
        v10 = EcPubKeyFromBits;
        sslFreePubKey((uint64_t)v36);
        return v10;
      }
      SSLFreeBuffer((_QWORD *)(a3 + 504));
      v10 = sslEcdhKeyExchange(*(uint64_t ***)(a3 + 152), *((uint64_t *)&v36[0] + 1), (size_t *)(a3 + 504));
      sslFreePubKey((uint64_t)v36);
      if ((_DWORD)v10)
        return v10;
      return 0;
    }
    if (((1 << v6) & 0xA00) != 0)
    {
      if (*(_QWORD *)(a3 + 104))
      {
        if (a1 <= 1)
        {
          __ssl_debug("sslError", "SSLDecodeDHClientKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1301, "SSLDecodeDHClientKeyExchange: msg len error 1\n");
          return 4294957496;
        }
        v26 = SSLDecodeInt(a2, 2);
        if (a1 < v26 + 2)
        {
          __ssl_debug("sslError", "SSLDecodeDHClientKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1309, "SSLDecodeDHClientKeyExchange: msg len error 2\n");
          return 4294957496;
        }
        v28 = v26;
        SSLFreeBuffer((_QWORD *)(a3 + 80));
        v10 = SSLAllocBuffer((size_t *)(a3 + 80), v28);
        if (!(_DWORD)v10)
        {
          memmove(*(void **)(a3 + 88), (const void *)(v4 + 2), v28);
          SSLFreeBuffer((_QWORD *)(a3 + 504));
          v10 = sslDhKeyExchange(*(uint64_t **)(a3 + 104), a3 + 80, (size_t *)(a3 + 504));
          if (!(_DWORD)v10)
            return 0;
        }
        return v10;
      }
      return 4294957486;
    }
    if (v6 == 19)
    {
      if (a1 <= 1)
      {
        __ssl_debug("sslError", "SSLDecodePSKClientKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1662, "SSLDecodePSKClientKeyExchange: msg len error 1\n");
        return 4294957496;
      }
      v27 = SSLDecodeInt(a2, 2);
      if (a1 < v27 + 2)
      {
        __ssl_debug("sslError", "SSLDecodePSKClientKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1670, "SSLDecodePSKClientKeyExchange: msg len error 2\n");
        return 4294957496;
      }
      v29 = v27;
      SSLFreeBuffer((_QWORD *)(a3 + 912));
      v10 = SSLAllocBuffer((size_t *)(a3 + 912), v29);
      if ((_DWORD)v10)
        return v10;
      memmove(*(void **)(a3 + 920), (const void *)(v4 + 2), v29);
      v30 = *(_QWORD *)(a3 + 896);
      if (!v30)
        return 4294957448;
      v10 = SSLAllocBuffer((size_t *)(a3 + 504), 2 * v30 + 4);
      if ((_DWORD)v10)
        return v10;
      v31 = (void *)SSLEncodeInt(*(_QWORD *)(a3 + 512), v30, 2);
      bzero(v31, v30);
      v32 = (void *)SSLEncodeInt((uint64_t)v31 + v30, v30, 2);
      memcpy(v32, *(const void **)(a3 + 904), v30);
      return 0;
    }
  }
  if (v6 != 1)
  {
    __ssl_debug("sslError", "SSLProcessKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 1862, "SSLProcessKeyExchange: unknown keyExchangeMethod (%d)\n", v6);
    return 4294967292;
  }
  v35 = 0;
  v11 = *(_QWORD *)(a3 + 32);
  v12 = sslPrivKeyLengthInBytes(v11);
  if (!v12)
  {
    __ssl_debug("sslError", "SSLDecodeRSAKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 867, "SSLDecodeRSAKeyExchange: private key modulus is 0\n");
    return 4294957487;
  }
  v13 = v12;
  if (a1 != v12)
  {
    if (a1 != v12 + 2 || *(_DWORD *)a3 < 0x301u)
    {
      __ssl_debug("sslError", "SSLDecodeRSAKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 886, "SSLDecodeRSAKeyExchange: length error (exp %u got %u)\n");
      return 4294957496;
    }
    v4 += 2;
  }
  v10 = SSLAllocBuffer((size_t *)(a3 + 504), 0x30uLL);
  if (!(_DWORD)v10)
  {
    *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v36[1] = v14;
    v36[2] = v14;
    v36[0] = v14;
    v34[0] = 48;
    v34[1] = v36;
    sslRand(v34);
    v15 = *(unsigned __int8 **)(a3 + 512);
    v16 = sslRsaDecrypt(v11, v4, v13, (uint64_t)v15, 48, &v35);
    v17 = 0;
    v18 = vshr_n_u32(*(uint32x2_t *)a3, 8uLL);
    v19.i64[0] = v18.u32[0];
    v19.i64[1] = v18.u32[1];
    v20.i64[0] = -1;
    v20.i64[1] = -1;
    v21 = (int8x16_t)vaddq_s64((int64x2_t)veorq_s8((int8x16_t)vdupq_n_s64(*v15), v19), v20);
    v22 = vand_s8(*(int8x8_t *)a3, (int8x8_t)0xFF000000FFLL);
    v19.i64[0] = v22.u32[0];
    v19.i64[1] = v22.u32[1];
    v23 = (int64x2_t)vandq_s8(v21, (int8x16_t)vaddq_s64((int64x2_t)veorq_s8((int8x16_t)vdupq_n_s64(v15[1]), v19), v20));
    v24 = (v16 - 1) & ~(v35 | v16) & ((v35 ^ 0x30) - 1) & vorrq_s8((int8x16_t)vdupq_laneq_s64(v23, 1), (int8x16_t)v23).u64[0];
    do
    {
      v25 = (unsigned __int8 *)v36 + v17;
      if (v24 < 0)
        v25 = &v15[v17];
      v15[v17++] = *v25;
    }
    while (v17 != 48);
    return 0;
  }
  return v10;
}

uint64_t sslGetEcPubKeyFromBits(int a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v4;
  void *v5;
  void *v6;
  uint64_t result;

  switch(a1)
  {
    case 25:
      v4 = (_QWORD *)ccec_cp_521();
      break;
    case 24:
      v4 = (_QWORD *)MEMORY[0x1DF0F5018]();
      break;
    case 23:
      v4 = (_QWORD *)MEMORY[0x1DF0F500C]();
      break;
    default:
      __ssl_debug("sslError", "sslGetEcPubKeyFromBits", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 768, "sslEcdhGenerateKeyPair: bad namedCurve (%u)\n", a1);
      return 4294967246;
  }
  v5 = sslMalloc(24 * *v4 + 16);
  if (!v5)
    return 4294967188;
  v6 = v5;
  result = ccec_import_pub();
  if ((_DWORD)result)
  {
    sslFree(v6);
    return 4294957487;
  }
  else
  {
    *(_BYTE *)a3 = 0;
    *(_QWORD *)(a3 + 8) = v6;
  }
  return result;
}

uint64_t sslEcdhKeyExchange(uint64_t **a1, uint64_t a2, size_t *a3)
{
  uint64_t v4;
  uint64_t result;

  v4 = **a1;
  if (!ccDRBGGetRngState())
    abort();
  result = SSLAllocBuffer(a3, (16 * v4) | 1);
  if (!(_DWORD)result)
    return ccecdh_compute_shared_secret();
  return result;
}

uint64_t sslEcdhExportPub(uint64_t a1, size_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = cczp_bitlen();
  v4 = SSLAllocBuffer(a2, ((unint64_t)(v3 + 7) >> 2) | 1);
  if (!(_DWORD)v4)
    ccec_export_pub();
  return v4;
}

uint64_t SSLProcessServerKeyExchange(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t ready;
  unsigned int v8;
  int v9;
  unsigned int v10;
  unint64_t v12;
  unsigned __int8 *v13;
  unsigned int v14;
  unsigned __int8 *v15;
  unsigned __int16 v16;
  unsigned int v17;
  unint64_t v18;
  int v19;
  __int128 v20;
  int *v21;
  __int128 v22;
  uint64_t (*v23)(size_t *, uint64_t *);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  size_t v34;
  uint64_t v35;
  unint64_t v36;
  __int128 *v37;
  int64_t v38;
  unsigned __int8 *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  tls_handshake_set_session_warning(a3, 0);
  v6 = *(_DWORD *)(a3 + 336);
  ready = 4294967292;
  if (v6 <= 0x12)
  {
    if (((1 << v6) & 0x28200) != 0)
    {
      if (a1 <= 1)
      {
        __ssl_debug("sslError", "SSLDecodeSignedServerKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 717, "SSLDecodeSignedServerKeyExchange: msg len error 1\n");
        return 4294957496;
      }
      v27 = a2;
      switch(v6)
      {
        case 0x11u:
          v9 = 1;
          break;
        case 0xFu:
          v9 = 0;
          break;
        case 9u:
          ready = SSLDecodeDHKeyParams(a3, &v27, a1);
          if ((_DWORD)ready)
            return ready;
          v9 = 1;
          goto LABEL_27;
        default:
          return 4294957486;
      }
      ready = SSLDecodeECDHKeyParams(a3, (const void **)&v27, a1);
      if ((_DWORD)ready)
        return ready;
LABEL_27:
      v12 = (unint64_t)&a2[a1];
      v13 = v27;
      if (*(_BYTE *)(a3 + 16))
        v14 = 65279;
      else
        v14 = 770;
      if (*(_DWORD *)a3 <= v14)
      {
        v15 = v27;
      }
      else
      {
        v15 = v27 + 2;
        if ((unint64_t)(v27 + 2) > v12)
        {
          __ssl_debug("sslError", "SSLDecodeSignedServerKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 757, "signedServerKeyExchange: msg len error 499\n", v26, v27);
          return 4294957496;
        }
        *(_DWORD *)(a3 + 824) = *v27;
        *(_DWORD *)(a3 + 828) = v13[1];
      }
      v16 = SSLDecodeInt(v15, 2);
      v27 = v15 + 2;
      if (&v15[v16 + 2] == (unsigned __int8 *)v12)
      {
        if (*(_BYTE *)(a3 + 16))
          v17 = 65279;
        else
          v17 = 770;
        if (*(_DWORD *)a3 <= v17)
        {
          v38 = v13 - a2;
          v39 = a2;
          v36 = 0xAAAAAAAAAAAAAAAALL;
          v37 = (__int128 *)0xAAAAAAAAAAAAAAAALL;
          LODWORD(v42) = -1431655766;
          *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v40 = v20;
          v41 = v20;
          v28 = 0xAAAAAAAAAAAAAAAALL;
          v29 = 0;
          v34 = 0xAAAAAAAAAAAAAAAALL;
          v35 = 0;
          v32 = 32;
          v33 = a3 + 436;
          v30 = 32;
          v31 = a3 + 468;
          if (!v9
            || (v36 = 16, v37 = &v40, ready = ReadyHash((uint64_t)&SSLHashMD5, &v34), !(_DWORD)ready)
            && (ready = HashMD5Update(), !(_DWORD)ready)
            && (ready = HashMD5Update(), !(_DWORD)ready)
            && (ready = HashMD5Update(), !(_DWORD)ready)
            && (ready = HashMD5Final((uint64_t)&v34, &v36), !(_DWORD)ready))
          {
            v36 = 20;
            v37 = &v41;
            ready = SSLFreeBuffer(&v34);
            if (!(_DWORD)ready)
            {
              ready = ReadyHash((uint64_t)&SSLHashSHA1, &v34);
              if (!(_DWORD)ready)
              {
                ready = HashSHA1Update();
                if (!(_DWORD)ready)
                {
                  ready = HashSHA1Update();
                  if (!(_DWORD)ready)
                  {
                    ready = HashSHA1Update();
                    if (!(_DWORD)ready)
                    {
                      ready = HashSHA1Final((uint64_t)&v34, &v36);
                      if (!(_DWORD)ready)
                      {
                        ready = sslRawVerify(a3 + 40);
                        if ((_DWORD)ready)
                          __ssl_debug("sslError", "SSLVerifySignedServerKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 609, "SSLDecodeSignedServerKeyExchange: sslRawVerify returned %d\n", ready);
                      }
                    }
                  }
                }
              }
            }
          }
        }
        else
        {
          v18 = *(_QWORD *)(a3 + 824);
          v38 = v13 - a2;
          v39 = a2;
          v34 = 0xAAAAAAAAAAAAAAAALL;
          v35 = 0;
          v32 = 32;
          v33 = a3 + 436;
          v31 = a3 + 468;
          v29 = 0;
          v30 = 32;
          v19 = v18 - 2;
          if ((v18 - 2) >= 5 || ((0x1Du >> v19) & 1) == 0)
          {
            __ssl_debug("sslError", "SSLVerifySignedServerKeyExchangeTls12", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 654, "SSLVerifySignedServerKeyExchangeTls12: unsupported hash %d\n");
            return 4294957496;
          }
          v21 = off_1EA97E808[v19];
          *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v42 = v22;
          v43 = v22;
          v40 = v22;
          v41 = v22;
          v28 = 0xAAAAAAAAAAAAAAAALL;
          v36 = *v21;
          v37 = &v40;
          ready = ReadyHash((uint64_t)v21, &v34);
          if (!(_DWORD)ready)
          {
            v23 = (uint64_t (*)(size_t *, uint64_t *))*((_QWORD *)v21 + 3);
            ready = v23(&v34, &v32);
            if (!(_DWORD)ready)
            {
              ready = v23(&v34, &v30);
              if (!(_DWORD)ready)
              {
                ready = v23(&v34, &v38);
                if (!(_DWORD)ready)
                {
                  ready = (*((uint64_t (**)(size_t *, unint64_t *))v21 + 4))(&v34, &v36);
                  if (!(_DWORD)ready)
                  {
                    v24 = a3 + 40;
                    if (HIDWORD(v18) == 1)
                      v25 = sslRsaVerify(v24);
                    else
                      v25 = sslRawVerify(v24);
                    ready = v25;
                    if ((_DWORD)v25)
                      __ssl_debug("sslError", "SSLVerifySignedServerKeyExchangeTls12", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 691, "SSLDecodeSignedServerKeyExchangeTls12: sslRawVerify returned %d\n", v25);
                  }
                }
              }
            }
          }
        }
        SSLFreeBuffer(&v28);
        SSLFreeBuffer(&v34);
        return ready;
      }
      __ssl_debug("sslError", "SSLDecodeSignedServerKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslKeyExchange.c", 767, "signedServerKeyExchange: msg len error 4\n", v26, v27);
      return 4294957496;
    }
    if (((1 << v6) & 0x40800) == 0)
      return ready;
    *(_QWORD *)&v40 = a2;
    if (v6 == 18)
    {
      v8 = SSLDecodeECDHKeyParams(a3, (const void **)&v40, a1);
    }
    else
    {
      if (v6 != 11)
        return 4294957486;
      v8 = SSLDecodeDHKeyParams(a3, (unsigned __int8 **)&v40, a1);
    }
    if (&a2[a1] == (unsigned __int8 *)v40)
      v10 = 0;
    else
      v10 = -9800;
    if (v8)
      return v8;
    else
      return v10;
  }
  return ready;
}

uint64_t tls_handshake_set_session_warning(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 1120) = a2;
  return 0;
}

uint64_t sslRawVerify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (!*(_BYTE *)a1)
  {
    if (*(_QWORD *)(a1 + 8))
    {
      v3 = ccec_verify();
      if ((_DWORD)v3)
      {
        v2 = v3;
        __ssl_debug("sslError", "sslRawEccVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 466, "sslRawEccVerify: ccec_verify failed (error %d)\n", v3);
        return v2;
      }
      return 0;
    }
    __ssl_debug("sslError", "sslRawEccVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 460, "Internal Error: Invalid EC public key\n");
    return 4294957486;
  }
  if (!*(_QWORD *)(a1 + 8))
  {
    __ssl_debug("sslError", "sslRawRsaVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 431, "Internal Error: Invalid RSA public key\n");
    return 4294957486;
  }
  v1 = ccrsa_verify_pkcs1v15();
  if (!(_DWORD)v1)
    return 0;
  v2 = v1;
  __ssl_debug("sslError", "sslRawRsaVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 438, "sslRawRsaVerify: ccrsa_verify_pkcs1v15 failed (error %d)\n", v1);
  return v2;
}

uint64_t SSLDecodeECDHKeyParams(uint64_t a1, const void **a2, uint64_t a3)
{
  unsigned __int8 *v5;
  size_t *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unsigned __int8 *v9;
  int v10;
  int v12;
  char *v13;
  unsigned __int8 *v14;
  char *v15;
  unsigned int v17;
  uint64_t v18;
  uint64_t result;
  size_t v20;

  v5 = (unsigned __int8 *)*a2 + a3;
  v6 = (size_t *)(a1 + 128);
  SSLFreeBuffer((_QWORD *)(a1 + 128));
  v7 = (unsigned __int8 *)*a2;
  v8 = (unsigned __int8 *)*a2 + 1;
  if (v8 > v5)
    return 4294957496;
  v10 = *v7;
  v9 = v7 + 3;
  *a2 = v8;
  if (v10 != 3 || v9 > v5)
    return 4294957496;
  v12 = SSLDecodeInt(v8, 2);
  *(_DWORD *)(a1 + 144) = v12;
  v13 = (char *)*a2;
  v14 = (unsigned __int8 *)*a2 + 2;
  *a2 = v14;
  v15 = v13 + 3;
  if ((v12 - 26) < 0xFFFFFFFD || v15 > (char *)v5)
    return 4294957496;
  v17 = SSLDecodeInt(v14, 1);
  v18 = (uint64_t)*a2 + 1;
  *a2 = (const void *)v18;
  if (v18 + (unint64_t)v17 > (unint64_t)v5)
    return 4294957496;
  v20 = v17;
  result = SSLAllocBuffer(v6, v17);
  if (!(_DWORD)result)
  {
    memmove(*(void **)(a1 + 136), *a2, v20);
    result = 0;
    *a2 = (char *)*a2 + v20;
  }
  return result;
}

uint64_t SSLProcessServerHello(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  unsigned int v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t (**v11)();
  __int128 v12;
  size_t v13;
  size_t v14;
  char *v15;
  unsigned __int8 *v16;

  if (a1 <= 0x25)
  {
    __ssl_debug("sslError", "SSLProcessServerHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 596, "SSLProcessServerHello: msg len error\n");
    return 4294957496;
  }
  v7 = SSLDecodeInt((unsigned __int8 *)a2, 2);
  v8 = v7;
  v9 = *(_DWORD *)(a3 + 8);
  if (!*(_BYTE *)(a3 + 16))
  {
    if (v9 > v7)
      return 4294957495;
    v10 = *(_DWORD *)(a3 + 12);
    if (v10 >= v7)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (v9 < v7)
    return 4294957495;
  v10 = *(_DWORD *)(a3 + 12);
  if (v10 > v7)
  {
LABEL_10:
    v8 = v10;
    if (*(_BYTE *)(a3 + 17))
      goto LABEL_11;
    return 4294957495;
  }
LABEL_11:
  *(_DWORD *)a3 = v8;
  result = 4294957495;
  if (v8 <= 770)
  {
    if ((v8 - 769) >= 2)
    {
      if (v8 != 768)
        return result;
      v11 = Ssl3Callouts;
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (v8 != 771)
  {
    if (v8 != 65279)
      return result;
LABEL_18:
    v11 = Tls1Callouts;
    goto LABEL_20;
  }
  v11 = Tls12Callouts;
LABEL_20:
  *(_QWORD *)(a3 + 24) = v11;
  result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a3 + 1112) + 96))(*(_QWORD *)(a3 + 1104));
  if (!(_DWORD)result)
  {
    v12 = *(_OWORD *)(a2 + 18);
    *(_OWORD *)(a3 + 468) = *(_OWORD *)(a2 + 2);
    *(_OWORD *)(a3 + 484) = v12;
    v13 = *(unsigned __int8 *)(a2 + 34);
    v14 = v13 + 38;
    if (a1 < v13 + 38)
    {
      __ssl_debug("sslError", "SSLProcessServerHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 637, "SSLProcessServerHello: msg len error 2\n");
      return 4294957496;
    }
    v15 = (char *)(a2 + 35);
    SSLFreeBuffer((_QWORD *)(a3 + 304));
    if ((_DWORD)v13 && *(_QWORD *)(a3 + 256) && !SSLAllocBuffer((size_t *)(a3 + 304), v13))
      memcpy(*(void **)(a3 + 312), v15, v13);
    v16 = (unsigned __int8 *)&v15[v13];
    *(_WORD *)(a3 + 328) = SSLDecodeInt(v16, 2);
    result = ValidateSelectedCiphersuite(a3);
    if (!(_DWORD)result)
    {
      if (v16[2])
      {
        return 4294967292;
      }
      else if (a1 == v14
             || (result = SSLProcessServerHelloExtensions(a3, (unsigned __int16)(a1 - v14), v16 + 3), !(_DWORD)result))
      {
        if (*(_BYTE *)(a3 + 848))
          result = 4294957495;
        else
          result = 0;
        if (*(_BYTE *)(a3 + 849))
        {
          result = 0;
          *(_BYTE *)(a3 + 848) = 1;
        }
      }
    }
  }
  return result;
}

uint64_t ValidateSelectedCiphersuite(uint64_t a1)
{
  uint64_t v1;
  unsigned __int16 *v2;
  int v3;

  v1 = *(unsigned int *)(a1 + 360);
  if (!(_DWORD)v1)
    return 4294957495;
  v2 = *(unsigned __int16 **)(a1 + 352);
  while (1)
  {
    v3 = *v2++;
    if (v3 == *(unsigned __int16 *)(a1 + 328))
      break;
    if (!--v1)
      return 4294957495;
  }
  InitCipherSpecParams(a1);
  return 0;
}

uint64_t SSLProcessServerHelloExtensions(uint64_t a1, unsigned int a2, unsigned __int8 *a3)
{
  __int16 v4;
  unsigned __int16 v6;
  uint64_t result;
  unsigned __int16 v8;
  int v9;
  unsigned __int8 *v10;
  unsigned __int16 v11;
  unsigned __int16 v12;
  size_t v13;
  unsigned __int16 v14;
  unsigned __int8 *v15;
  _BYTE *v16;
  unint64_t v17;
  uint64_t v18;
  size_t v19;
  char *v20;
  unint64_t v21;
  size_t v22;
  const void *v23;
  size_t *v24;
  int v25;

  if (a2 <= 1)
  {
    __ssl_debug("sslError", "SSLProcessServerHelloExtensions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 494, "SSLProcessHelloExtensions: need a least 2 bytes\n");
    return 4294957496;
  }
  v4 = a2;
  *(_BYTE *)(a1 + 1009) = 0;
  *(_BYTE *)(a1 + 1067) = 0;
  *(_BYTE *)(a1 + 849) = 0;
  tls_free_buffer_list(*(_QWORD **)(a1 + 1072));
  *(_BYTE *)(a1 + 769) = 0;
  v6 = SSLDecodeInt(a3, 2);
  if (v6 > (unsigned __int16)(v4 - 2))
  {
    __ssl_debug("sslError", "SSLProcessServerHelloExtensions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 512, "SSLProcessHelloExtensions: ext len error 1\n");
    return 4294957496;
  }
  v8 = v6;
  if (v6 < (unsigned __int16)(v4 - 2))
    __ssl_debug("sslError", "SSLProcessServerHelloExtensions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 517, "Warning: SSLProcessServerHelloExtensions: Too many bytes\n");
  if (!v8)
    return 0;
  v9 = 0;
  v10 = a3 + 2;
  while (1)
  {
    if (v8 <= 3u)
    {
      __ssl_debug("sslError", "SSLProcessServerHelloExtensions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 525, "SSLProcessHelloExtensions: ext len error\n");
      return 4294957496;
    }
    v11 = SSLDecodeInt(v10, 2);
    v12 = SSLDecodeInt(v10 + 2, 2);
    v13 = v12;
    if (v12 + 4 > v8)
    {
      __ssl_debug("sslError", "SSLProcessServerHelloExtensions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 533, "SSLProcessHelloExtension: ext len error 2\n");
      return 4294957496;
    }
    v14 = v12;
    v15 = v10 + 4;
    if (v11 <= 0x16u)
      break;
    if (v11 > 0x3373u)
    {
      if (v11 == 13172)
      {
        if (!*(_BYTE *)(a1 + 930))
          return 4294957496;
        *(_BYTE *)(a1 + 932) = 1;
        if (*(_QWORD *)(a1 + 960))
          return 4294957496;
        v23 = v10 + 4;
        v22 = v13;
        v24 = (size_t *)(a1 + 952);
LABEL_47:
        result = SSLCopyBufferFromData(v23, v22, v24);
        if ((_DWORD)result)
          return result;
        goto LABEL_48;
      }
      if (v11 == 65281)
      {
        if (v9)
          return 4294957496;
        v18 = *(_QWORD *)(a1 + 856);
        v19 = *(_QWORD *)(a1 + 872);
        if (v19 + v18 + 1 == v12 && v19 + v18 == *v15)
        {
          v20 = (char *)(v10 + 5);
          if (!memcmp(v20, *(const void **)(a1 + 864), *(_QWORD *)(a1 + 856)))
          {
            v25 = memcmp(&v20[v18], *(const void **)(a1 + 880), v19);
            v9 = 1;
            v16 = (_BYTE *)(a1 + 849);
            if (v25)
              goto LABEL_48;
            goto LABEL_38;
          }
        }
        v9 = 1;
      }
    }
    else
    {
      if (v11 == 23)
      {
        v16 = (_BYTE *)(a1 + 769);
LABEL_38:
        *v16 = 1;
        goto LABEL_48;
      }
      if (v11 == 35)
      {
        result = 4294957496;
        if (v14)
          return result;
        v16 = (_BYTE *)(a1 + 707);
        if (!*(_BYTE *)(a1 + 706))
          return result;
        goto LABEL_38;
      }
    }
LABEL_48:
    v8 -= v13 + 4;
    v10 = &v15[v13];
    if (!v8)
      return 0;
  }
  if (v11 == 5)
  {
    result = 4294957496;
    if (v14)
      return result;
    v16 = (_BYTE *)(a1 + 1009);
    if (!*(_BYTE *)(a1 + 1008))
      return result;
    goto LABEL_38;
  }
  if (v11 == 16)
  {
    result = 4294957496;
    if (!*(_BYTE *)(a1 + 969))
      return result;
    if (v14 < 4u)
      return result;
    *(_BYTE *)(a1 + 971) = 1;
    if (*(_QWORD *)(a1 + 1000))
      return result;
    v21 = SSLDecodeSize((unint64_t)(v10 + 4), 2);
    if (v21 != (_DWORD)v13 - 2)
      return 4294957496;
    v22 = v21;
    v23 = v10 + 6;
    v24 = (size_t *)(a1 + 992);
    goto LABEL_47;
  }
  if (v11 != 18)
    goto LABEL_48;
  if (!*(_BYTE *)(a1 + 1066))
    return 4294957496;
  if (v12 <= 1u)
  {
    __ssl_debug("sslError", "SSLProcessServerHelloExtension_SCT", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 457, "SSLProcessClientHelloExtension_SCT: length decode error 1\n");
    return 4294957496;
  }
  v17 = SSLDecodeSize((unint64_t)(v10 + 4), 2);
  if (v17 == (unsigned __int16)(v14 - 2))
  {
    result = SSLDecodeBufferList(v10 + 6, v17, 2, (void ***)(a1 + 1072));
    if ((_DWORD)result)
      return result;
    goto LABEL_48;
  }
  __ssl_debug("sslError", "SSLProcessServerHelloExtension_SCT", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 464, "SSLProcessClientHelloExtension_SCT: length decode error 2\n");
  return 4294957496;
}

void tls_record_decrypt(uint64_t a1, unint64_t a2, unsigned __int8 *a3, uint64_t a4, _BYTE *a5)
{
  unint64_t v5;
  uint64_t v11;
  unsigned __int8 *v12;
  unint64_t v13;
  unsigned int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int (**v17)(void);
  char v18;
  int v19;
  size_t v20;
  size_t __n;
  void *__src;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = 13;
  if (!*(_BYTE *)(a1 + 488))
    v5 = 5;
  if (a2 >= v5)
  {
    v12 = a3 + 3;
    v11 = *a3;
    if (*(_BYTE *)(a1 + 488))
    {
      v13 = SSLDecodeUInt64(a3 + 3, 8);
      v12 = a3 + 11;
    }
    else
    {
      v13 = 0;
    }
    v14 = SSLDecodeInt(v12, 2);
    v15 = v14;
    __n = v14;
    __src = v12 + 2;
    v16 = 13;
    if (!*(_BYTE *)(a1 + 488))
      v16 = 5;
    if (a2 >= v16 + (unint64_t)v14)
    {
      if (*(_BYTE *)(a1 + 488))
      {
        if ((*(_QWORD *)(a1 + 40) ^ v13) >> 48)
          return;
        *(_QWORD *)(a1 + 40) = v13;
      }
      v17 = *(unsigned int (***)(void))(a1 + 16);
      if (*((_DWORD *)*v17 + 1) != 2
        || v15 >= 0x18
        && !v17[3]()
        && (memset(v23, 170, 13),
            SSLEncodeUInt64((uint64_t)v23, *(_QWORD *)(a1 + 40)),
            v18 = *(v12 - 1),
            LOWORD(v23[1]) = *(_WORD *)(v12 - 3),
            BYTE2(v23[1]) = v18,
            *(_WORD *)((char *)&v23[1] + 3) = bswap32(v15 - 24) >> 16,
            !(*(unsigned int (**)(_QWORD *, uint64_t, _QWORD))(*(_QWORD *)(a1 + 16) + 40))(v23, 13, *(_QWORD *)(a1 + 24))))
      {
        SSLDecryptRecord(v11, &__n, a1);
        if (!v19)
        {
          v20 = __n;
          if (*(_QWORD *)a4 >= __n)
          {
            *(_QWORD *)a4 = __n;
            memcpy(*(void **)(a4 + 8), __src, v20);
            IncrementUInt64((_QWORD *)(a1 + 40));
            if (a5)
              *a5 = v11;
          }
        }
      }
    }
  }
}

double SSLDecryptRecord(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  int v7;
  double result;
  uint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  size_t v19;
  size_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  int v26;
  char v27;
  unsigned __int8 v28;
  unint64_t v29;
  unsigned __int8 *v30;
  int v31;
  int v32;
  unint64_t v33;
  _BOOL4 v35;
  size_t v36;
  size_t v37;
  size_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v42 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6 = *(_QWORD *)(a3 + 16);
  v7 = *(_DWORD *)(*(_QWORD *)v6 + 4);
  if (v7)
  {
    if (v7 != 1)
    {
      if (v7 == 2)
      {
        if ((*(unsigned int (**)(unint64_t, unint64_t, unint64_t, _QWORD))(v6 + 56))(a2[1] + 8, a2[1] + 8, *a2 - 8, *(_QWORD *)(a3 + 24)))
        {
          return result;
        }
        v9 = a2[1] + 8;
        v10 = *a2 >= 0x18;
        *(_QWORD *)&v42 = *a2 - 24;
        *((_QWORD *)&v42 + 1) = v9;
        if (!v10)
          return result;
      }
LABEL_49:
      result = *(double *)&v42;
      *(_OWORD *)a2 = v42;
      return result;
    }
    if (!(*a2 % *(unsigned __int8 *)(*(_QWORD *)v6 + 10)))
    {
      v14 = (*(uint64_t (**)(unint64_t, unint64_t))(v6 + 32))(a2[1], a2[1]);
      if (!(_DWORD)v14)
      {
        v15 = *(_DWORD *)(a3 + 492);
        v16 = a2[1];
        if (v15 < 0x302)
        {
          v20 = **(_QWORD **)(a3 + 8);
          v19 = v20;
          v18 = a2[1];
        }
        else
        {
          v17 = *(unsigned __int8 *)(**(_QWORD **)(a3 + 16) + 10);
          v18 = v16 + v17;
          v19 = **(_QWORD **)(a3 + 8);
          v20 = v19 + v17;
        }
        v21 = *a2;
        v22 = *a2 + ~v20;
        *(_QWORD *)&v42 = v22;
        *((_QWORD *)&v42 + 1) = v18;
        if (v22 <= v21)
        {
          v23 = *(unsigned __int8 *)(v21 + v16 - 1);
          if (v15 == 768)
            v24 = *(unsigned __int8 *)(**(_QWORD **)(a3 + 16) + 10) - 1;
          else
            v24 = 255;
          if (v24 >= v22)
            v25 = v22;
          else
            v25 = v24;
          v26 = v25 >= v23;
          if (v25 < v23)
            v27 = 0;
          else
            v27 = -1;
          v28 = v25 & ~v27 | v27 & v23;
          if (v15 != 768 && v25)
          {
            v29 = 0;
            v30 = (unsigned __int8 *)(v21 + v16 - 1);
            do
            {
              v32 = *v30--;
              v31 = v32;
              v33 = v29 + 1;
              v35 = v29 >= v28 || v31 == v28;
              v26 &= v35;
              ++v29;
            }
            while (v25 != v33);
          }
          if (v19)
          {
            v41 = (uint64_t)&v41;
            MEMORY[0x1E0C80A78](v14);
            memset((char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v19);
            v36 = **(_QWORD **)(a3 + 8);
            bzero((char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), v36);
            v37 = 0;
            v38 = a2[1] + ~v36 + *a2 - v25;
            do
            {
              v39 = 0;
              if (v37 == v25 - v28)
                v40 = -1;
              else
                v40 = 0;
              do
              {
                *((_BYTE *)&v41 + v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0)) = *((_BYTE *)&v41
                                                                               + v39
                                                                               - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0)) & ~v40 | v40 & *(_BYTE *)(v38 + v39);
                ++v39;
              }
              while (v19 != v39);
              ++v37;
              ++v38;
            }
            while (v37 <= v36 + v25 - v19);
            SSLVerifyMac(a1, (unint64_t *)&v42, v28, (uint64_t)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
            *(_QWORD *)&v42 = v22 - v28;
          }
          goto LABEL_49;
        }
      }
    }
  }
  else if (!(*(unsigned int (**)(unint64_t, unint64_t, unint64_t, _QWORD))(v6 + 32))(a2[1], a2[1], *a2, *(_QWORD *)(a3 + 24)))
  {
    v11 = a2[1];
    v12 = **(_QWORD **)(a3 + 8);
    v10 = *a2 >= v12;
    v13 = *a2 - v12;
    *(_QWORD *)&v42 = v13;
    *((_QWORD *)&v42 + 1) = v11;
    if (v10)
    {
      if (v12)
        SSLVerifyMac(a1, (unint64_t *)&v42, 0, v11 + v13, a3);
      goto LABEL_49;
    }
  }
  return result;
}

uint64_t CCSymmAEADDecrypt(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  if (a4 && *a4)
  {
    v4 = ccgcm_update();
    v5 = ccgcm_finalize() | v4;
    v6 = ccgcm_reset();
    v7 = v5 | v6 | ccgcm_inc_iv();
    if ((_DWORD)v7)
      cc_clear();
  }
  else
  {
    puts("CCSymmAEADDecrypt: NULL cipherCtx");
    return 0xFFFFFFFFLL;
  }
  return v7;
}

uint64_t tls_record_parse_header(uint64_t a1, unint64_t a2, _BYTE *a3, _QWORD *a4, _BYTE *a5)
{
  unint64_t v5;
  uint64_t result;

  v5 = 13;
  if (!*(_BYTE *)(a1 + 488))
    v5 = 5;
  if (a2 < v5)
    return 0xFFFFFFFFLL;
  *a4 = SSLDecodeInt(&a3[v5 - 2], 2);
  result = 0;
  if (a5)
    *a5 = *a3;
  return result;
}

uint64_t SSLProcessClientHello(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;
  uint64_t (**v11)();
  __int128 v12;
  size_t v13;
  int v14;
  size_t v15;
  unint64_t v16;
  unsigned __int8 *v17;
  size_t v18;
  char *v19;
  unsigned int v20;
  unsigned __int8 *v21;
  uint64_t v22;
  BOOL v23;
  unsigned __int16 v24;
  size_t v25;
  void *v26;
  unint64_t v27;
  __int16 v28;
  __int16 v29;
  int v30;
  unsigned __int8 *v31;
  char v32;

  if (a1 <= 0x28)
  {
    __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1481, "SSLProcessClientHello: msg len error 1\n");
    return 4294957496;
  }
  v7 = SSLDecodeInt((unsigned __int8 *)a2, 2);
  *(_DWORD *)(a3 + 4) = v7;
  v8 = *(_DWORD *)(a3 + 8);
  if (!*(_BYTE *)(a3 + 16))
  {
    if (v8 > v7)
      goto LABEL_15;
    v9 = *(_DWORD *)(a3 + 12);
    v10 = v7;
    if (v9 >= v7)
      goto LABEL_11;
    goto LABEL_10;
  }
  if (v8 < v7)
    goto LABEL_15;
  v9 = *(_DWORD *)(a3 + 12);
  v10 = v7;
  if (v9 > v7)
  {
LABEL_10:
    v10 = v9;
    if (*(_BYTE *)(a3 + 17))
      goto LABEL_11;
LABEL_15:
    __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1490, "SSLProcessClientHello: protocol version error %04x\n", v7);
    return 4294957495;
  }
LABEL_11:
  result = 4294957495;
  if (v10 > 770)
  {
    if (v10 == 771)
    {
      v11 = Tls12Callouts;
      goto LABEL_21;
    }
    if (v10 != 65279)
      return result;
LABEL_19:
    v11 = Tls1Callouts;
    goto LABEL_21;
  }
  if ((v10 - 769) < 2)
    goto LABEL_19;
  if (v10 != 768)
    return result;
  v11 = Ssl3Callouts;
LABEL_21:
  *(_QWORD *)(a3 + 24) = v11;
  *(_DWORD *)a3 = v10;
  result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a3 + 1112) + 96))(*(_QWORD *)(a3 + 1104));
  if (!(_DWORD)result)
  {
    v12 = *(_OWORD *)(a2 + 18);
    *(_OWORD *)(a3 + 436) = *(_OWORD *)(a2 + 2);
    *(_OWORD *)(a3 + 452) = v12;
    v13 = *(unsigned __int8 *)(a2 + 34);
    if (a1 < v13 + 41)
    {
      __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1519, "SSLProcessClientHello: msg len error 2\n");
      return 4294957496;
    }
    SSLFreeBuffer((_QWORD *)(a3 + 288));
    if ((_DWORD)v13)
    {
      v14 = SSLCopyBufferFromData((const void *)(a2 + 35), v13, (size_t *)(a3 + 288));
      v15 = v13;
      if (v14)
        return 4294967188;
    }
    else
    {
      v15 = 0;
    }
    v16 = a2 + a1;
    v17 = (unsigned __int8 *)(a2 + 35 + v15);
    if (*(_BYTE *)(a3 + 16))
    {
      v20 = *v17;
      v19 = (char *)(v17 + 1);
      v18 = v20;
      v21 = (unsigned __int8 *)&v19[v20];
      if ((unint64_t)v21 > v16)
      {
        __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1539, "SSLProcessClientHello: msg len error 3\n");
        return 4294957496;
      }
      v22 = *(_QWORD *)(a3 + 184);
      v23 = !v22 || v22 == v18 && !memcmp(*(const void **)(a3 + 192), v19, v18);
      *(_BYTE *)(a3 + 200) = v23;
      v17 = v21;
    }
    v24 = SSLDecodeInt(v17, 2);
    v25 = v24;
    if ((unint64_t)&v17[v24 + 2] > v16)
    {
      __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1560, "SSLProcessClientHello: msg len error 4\n");
      return 4294957496;
    }
    if ((v24 & 1) != 0 || v24 < 2u || a1 < v13 + v24 + 39)
    {
      __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1566, "SSLProcessClientHello: msg len error 5\n");
      return 4294957496;
    }
    sslFree(*(void **)(a3 + 368));
    v26 = sslMalloc(v25);
    *(_QWORD *)(a3 + 368) = v26;
    if (!v26)
      return 4294967188;
    v27 = 0;
    *(_BYTE *)(a3 + 850) = 0;
    *(_BYTE *)(a3 + 1065) = 0;
    *(_DWORD *)(a3 + 376) = v25 >> 1;
    v28 = (_WORD)v17 - a1 - a2 + 3;
    do
    {
      v29 = SSLDecodeInt(v17 + 2, 2);
      *(_WORD *)(*(_QWORD *)(a3 + 368) + 2 * v27) = v29;
      if (v29 == 255)
        *(_BYTE *)(a3 + 850) = 1;
      if (v29 == 22016)
        *(_BYTE *)(a3 + 1065) = 1;
      ++v27;
      v17 += 2;
      v28 += 2;
    }
    while (v27 < *(unsigned int *)(a3 + 376));
    v30 = v17[2];
    if (!v17[2] || a1 < (v13 + v25 + v30 + 38))
    {
      __ssl_debug("sslError", "SSLProcessClientHello", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1594, "SSLProcessClientHello: msg len error 6\n");
      return 4294957496;
    }
    v31 = &v17[v17[2] + 3];
    if ((unint64_t)v31 < v16)
      SSLProcessClientHelloExtensions(a3, (unsigned __int16)(-v28 - v30), v31);
    if (*(_QWORD *)(a3 + 872))
    {
      if (*(_BYTE *)(a3 + 848) && (*(_BYTE *)(a3 + 850) || !*(_BYTE *)(a3 + 849)))
        return 4294957495;
    }
    else
    {
      if (*(_BYTE *)(a3 + 850))
        v32 = 1;
      else
        v32 = *(_BYTE *)(a3 + 849);
      *(_BYTE *)(a3 + 848) = v32;
    }
    return SSLInitMessageHashes((size_t *)a3);
  }
  return result;
}

uint64_t SSLDecodeInt(unsigned __int8 *a1, uint64_t a2)
{
  uint64_t i;
  unsigned int v3;

  for (i = 0; a2; --a2)
  {
    v3 = *a1++;
    i = v3 | ((_DWORD)i << 8);
  }
  return i;
}

uint64_t tls_record_set_protocol_version(uint64_t a1, int a2)
{
  uint64_t result;

  if ((a2 - 768) >= 4 && a2 != 65279)
    return 4294957293;
  result = 0;
  *(_DWORD *)(a1 + 492) = a2;
  return result;
}

void SSLProcessClientHelloExtensions(uint64_t a1, unsigned int a2, unsigned __int8 *a3)
{
  const char *v3;
  char *v4;
  uint64_t v5;
  __int16 v7;
  size_t *v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  unsigned __int8 *v12;
  unsigned __int16 v13;
  int v14;
  int v15;
  unsigned int v16;
  __int16 v17;
  unsigned __int8 *v18;
  unint64_t v19;
  unsigned __int16 v20;
  unint64_t v21;
  unsigned __int8 *v22;
  unint64_t v23;
  size_t v24;
  int v25;
  unsigned int v26;
  char *v27;
  uint64_t v28;
  _DWORD *v29;
  unsigned __int8 *v30;
  int v31;
  size_t v32;
  int v33;
  char *v34;
  unint64_t v35;
  int v36;
  char *v37;
  int v38;
  unint64_t v39;
  int v40;
  size_t v41;
  unsigned int v42;
  unint64_t v43;
  unsigned __int8 *v44;

  if (a2 <= 1)
  {
    v3 = "SSLProcessClientHelloExtensions";
    v4 = "SSLProcessClientHelloExtensions: need a least 2 bytes\n";
    v5 = 1380;
    goto LABEL_5;
  }
  v7 = a2;
  *(_BYTE *)(a1 + 1009) = 0;
  v9 = (size_t *)(a1 + 392);
  SSLFreeBuffer((_QWORD *)(a1 + 392));
  *(_BYTE *)(a1 + 769) = 0;
  v10 = SSLDecodeInt(a3, 2);
  if (v10 > (unsigned __int16)(v7 - 2))
  {
    v3 = "SSLProcessClientHelloExtensions";
    v4 = "SSLProcessClientHelloExtensions: ext len error 1\n";
    v5 = 1395;
    goto LABEL_5;
  }
  v11 = v10;
  if (v10 < (unsigned __int16)(v7 - 2))
    __ssl_debug("sslError", "SSLProcessClientHelloExtensions", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 1400, "Warning: SSLProcessClientHelloExtensions: Too many bytes\n");
  if (v11)
  {
    v12 = a3 + 2;
    do
    {
      if (v11 <= 3u)
      {
        v3 = "SSLProcessClientHelloExtensions";
        v4 = "SSLProcessClientHelloExtensions: ext len error\n";
        v5 = 1408;
        goto LABEL_5;
      }
      v13 = SSLDecodeInt(v12, 2);
      v14 = SSLDecodeInt(v12 + 2, 2);
      v15 = (unsigned __int16)v14;
      v16 = (unsigned __int16)v14 + 4;
      if (v16 > v11)
      {
        v3 = "SSLProcessClientHelloExtensions";
        v4 = "SSLProcessClientHelloExtension: ext len error 2\n";
        v5 = 1416;
        goto LABEL_5;
      }
      v17 = v14;
      v18 = v12 + 4;
      if (v13 > 0x11u)
      {
        if (v13 > 0x3373u)
        {
          if (v13 == 13172)
          {
            if (*(_BYTE *)(a1 + 930))
              return;
            if ((_WORD)v14)
            {
              v3 = "SSLProcessClientHelloExtension_NPN";
              v4 = "SSLProcessClientHelloExtension_NPN: length decode error 1\n";
              v5 = 1147;
              goto LABEL_5;
            }
            *(_BYTE *)(a1 + 930) = 1;
          }
          else if (v13 == 65281)
          {
            *(_BYTE *)(a1 + 849) = 0;
            v32 = *(_QWORD *)(a1 + 872);
            if (v32 + 1 != (unsigned __int16)v14 || v32 != *v18 || memcmp(v12 + 5, *(const void **)(a1 + 880), v32))
              return;
            *(_BYTE *)(a1 + 849) = 1;
          }
        }
        else if (v13 == 18)
        {
          if ((_WORD)v14)
          {
            v3 = "SSLProcessClientHelloExtension_SCT";
            v4 = "SSLProcessClientHelloExtension_SCT: length decode error 1\n";
            v5 = 1160;
            goto LABEL_5;
          }
          *(_BYTE *)(a1 + 1067) = 1;
        }
        else if (v13 == 23)
        {
          *(_BYTE *)(a1 + 769) = 1;
        }
      }
      else if (v13 > 9u)
      {
        if (v13 == 10)
        {
          if ((unsigned __int16)v14 <= 1u)
          {
            v3 = "SSLProcessClientHelloExtension_EllipticCurves";
            v4 = "SSLProcessClientHelloExtension_SignatureAlgorithms: length decode error 1\n";
            v5 = 1322;
            goto LABEL_5;
          }
          v42 = SSLDecodeInt(v12 + 4, 2);
          if (v42 != (unsigned __int16)(v17 - 2) || v42 < 2 || (v42 & 1) != 0)
            return;
          *(_DWORD *)(a1 + 1088) = v42 >> 1;
          sslFree(*(void **)(a1 + 1080));
          *(_QWORD *)(a1 + 1080) = sslMalloc(2 * *(unsigned int *)(a1 + 1088));
          if (*(_DWORD *)(a1 + 1088))
          {
            v43 = 0;
            v44 = v12 + 6;
            do
            {
              *(_WORD *)(*(_QWORD *)(a1 + 1080) + 2 * v43++) = SSLDecodeInt(v44, 2);
              v44 += 2;
            }
            while (v43 < *(unsigned int *)(a1 + 1088));
          }
        }
        else if (v13 == 13)
        {
          if ((unsigned __int16)v14 <= 1u)
          {
            v3 = "SSLProcessClientHelloExtension_SignatureAlgorithms";
            v4 = "SSLProcessClientHelloExtension_SignatureAlgorithms: length decode error 1\n";
            v5 = 1287;
            goto LABEL_5;
          }
          v25 = SSLDecodeInt(v12 + 4, 2);
          if ((v17 & 1) != 0)
            return;
          v26 = (unsigned __int16)(v17 - 2);
          if (v25 != v26 || (v25 & 1) != 0)
            return;
          *(_DWORD *)(a1 + 788) = v26 >> 1;
          sslFree(*(void **)(a1 + 792));
          v27 = (char *)sslMalloc(8 * *(unsigned int *)(a1 + 788));
          *(_QWORD *)(a1 + 792) = v27;
          v28 = *(unsigned int *)(a1 + 788);
          if ((_DWORD)v28)
          {
            v29 = v27 + 4;
            v30 = v12 + 7;
            do
            {
              *(v29 - 1) = *(v30 - 1);
              v31 = *v30;
              v30 += 2;
              *v29 = v31;
              v29 += 2;
              --v28;
            }
            while (v28);
          }
        }
      }
      else if (v13)
      {
        if (v13 == 5)
        {
          if (!(_WORD)v14)
          {
            v3 = "SSLProcessClientHelloExtension_StatusRequest";
            v4 = "SSLProcessClientHelloExtension_StatusRequest: length decode error 1\n";
            v5 = 1175;
            goto LABEL_5;
          }
          if (*(_BYTE *)(a1 + 1008) && v12[4] == 1)
          {
            if ((unsigned __int16)v14 <= 2u)
            {
              v3 = "SSLProcessClientHelloExtension_StatusRequest";
              v4 = "SSLProcessClientHelloExtension_StatusRequest: length decode error 2\n";
              v5 = 1186;
              goto LABEL_5;
            }
            v19 = SSLDecodeSize((unint64_t)(v12 + 5), 2);
            v20 = v17 - 3;
            if (v19 > v20)
            {
              v3 = "SSLProcessClientHelloExtension_StatusRequest";
              v4 = "SSLProcessClientHelloExtension_StatusRequest: length decode error 3\n";
              v5 = 1192;
              goto LABEL_5;
            }
            v21 = v19;
            v22 = v12 + 7;
            if (SSLDecodeBufferList(v22, v19, 2, (void ***)(a1 + 1032)))
              return;
            if ((unsigned __int16)(v20 - v21) <= 1u)
            {
              v3 = "SSLProcessClientHelloExtension_StatusRequest";
              v4 = "SSLProcessClientHelloExtension_StatusRequest: length decode error 4\n";
              v5 = 1202;
              goto LABEL_5;
            }
            v23 = (unint64_t)&v22[v21];
            v24 = SSLDecodeSize(v23, 2);
            if (v24 != (unsigned __int16)(v20 - v21 - 2))
            {
              v3 = "SSLProcessClientHelloExtension_StatusRequest";
              v4 = "SSLProcessClientHelloExtension_StatusRequest: length decode error 5\n";
              v5 = 1209;
              goto LABEL_5;
            }
            SSLCopyBufferFromData((const void *)(v23 + 2), v24, (size_t *)(a1 + 1016));
            *(_BYTE *)(a1 + 1009) = 1;
          }
        }
      }
      else
      {
        if ((unsigned __int16)v14 <= 1u)
        {
          v3 = "SSLProcessClientHelloExtension_ServerName";
          v4 = "SSLProcessClientHelloExtension_ServerName: length decode error 1\n";
          v5 = 1226;
          goto LABEL_5;
        }
        v33 = v14 - 2;
        if (SSLDecodeSize((unint64_t)(v12 + 4), 2) != (unsigned __int16)(v14 - 2))
        {
          v3 = "SSLProcessClientHelloExtension_ServerName";
          v4 = "SSLProcessClientHelloExtension_ServerName: length decode error 2\n";
          v5 = 1232;
          goto LABEL_5;
        }
        if ((_WORD)v33)
        {
          v34 = (char *)(v12 + 6);
          while (1)
          {
            if ((unsigned __int16)v33 <= 2u)
            {
              v3 = "SSLProcessClientHelloExtension_ServerName";
              v4 = "SSLProcessClientHelloExtension_ServerName: length decode error 3\n";
              v5 = 1241;
              goto LABEL_5;
            }
            v35 = (unint64_t)(v34 + 1);
            v38 = *v34;
            v37 = v34 + 3;
            v36 = v38;
            v39 = SSLDecodeSize(v35, 2);
            v40 = v33 - 3;
            if (v39 > (unsigned __int16)v40)
              break;
            v41 = v39;
            if (!v36)
            {
              SSLFreeBuffer(v9);
              SSLAllocBuffer(v9, v41 + 1);
              memcpy(*(void **)(a1 + 400), v37, v41);
              *(_BYTE *)(*(_QWORD *)(a1 + 400) + v41) = 0;
            }
            v34 = &v37[v41];
            v33 = v40 - v41;
            if (!(_WORD)v33)
              goto LABEL_68;
          }
          v3 = "SSLProcessClientHelloExtension_ServerName";
          v4 = "SSLProcessClientHelloExtension_ServerName: length decode error 4\n";
          v5 = 1249;
LABEL_5:
          __ssl_debug("sslError", v3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", v5, v4);
          return;
        }
      }
LABEL_68:
      v11 -= v16;
      v12 = &v18[v15];
    }
    while (v11);
  }
}

uint64_t tls_handshake_set_resumption(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 280) = a2;
  return 0;
}

uint64_t tls_handshake_set_peer_hostname(uint64_t a1, const void *a2, size_t a3)
{
  uint64_t v5;

  v5 = a1 + 392;
  SSLFreeBuffer((_QWORD *)(a1 + 392));
  return SSLCopyBufferTerm(a2, a3, v5);
}

uint64_t tls_handshake_get_peer_ocsp_response(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 1040))
    return a1 + 1048;
  else
    return 0;
}

uint64_t tls_handshake_get_peer_npn_data(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 932))
    return a1 + 952;
  else
    return 0;
}

uint64_t tls_handshake_get_peer_alpn_data(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 971))
    return a1 + 992;
  else
    return 0;
}

void tls_private_key_destroy(_QWORD *a1)
{
  void (*v2)(void);

  v2 = (void (*)(void))a1[1];
  if (v2 && *a1)
    v2();
  sslFree(a1);
}

uint64_t tls_handshake_negotiate(uint64_t a1, _QWORD *a2)
{
  int v2;

  v2 = *(_DWORD *)(a1 + 380);
  if (v2 != 17 && v2 != 2)
    return 4294957466;
  if (a2)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 1112) + 40))(*(_QWORD *)(a1 + 1104), *a2, a2[1], a1 + 264);
    SSLFreeBuffer((_QWORD *)(a1 + 248));
    SSLCopyBuffer((uint64_t)a2, (size_t *)(a1 + 248));
  }
  else
  {
    SSLFreeBuffer((_QWORD *)(a1 + 248));
  }
  return SSLAdvanceHandshake(0, a1);
}

uint64_t tls_handshake_set_identity(uint64_t a1, uint64_t **a2, uint64_t *a3)
{
  _QWORD *v6;
  void (*v7)(void);
  unint64_t v8;
  char *v9;
  unint64_t v11;

  SSLFreeCertificates(*(_QWORD *)(a1 + 56));
  v6 = *(_QWORD **)(a1 + 32);
  if (v6)
  {
    v7 = (void (*)(void))v6[1];
    if (v7 && *v6)
      v7();
    sslFree(v6);
  }
  if (a2)
  {
    v11 = 0xAAAAAAAAAAAAAAAALL;
    tls_copy_buffer_list(a2, &v11);
    v8 = v11;
  }
  else
  {
    v8 = 0;
  }
  *(_QWORD *)(a1 + 56) = v8;
  if (a3)
    v9 = tls_private_key_create((uint64_t)(a3 + 2), *a3, a3[1]);
  else
    v9 = 0;
  *(_QWORD *)(a1 + 32) = v9;
  return 0;
}

char *tls_private_key_create(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *result;
  __int128 v7;

  result = (char *)sslMalloc(0x30uLL);
  if (result)
  {
    *(_QWORD *)result = a2;
    *((_QWORD *)result + 1) = a3;
    *((_DWORD *)result + 4) = *(_DWORD *)a1;
    if (*(_DWORD *)a1 > 1u)
    {
      sslFree(result);
      return 0;
    }
    else
    {
      v7 = *(_OWORD *)(a1 + 8);
      *((_QWORD *)result + 5) = *(_QWORD *)(a1 + 24);
      *(_OWORD *)(result + 24) = v7;
    }
  }
  return result;
}

uint64_t tls_copy_buffer_list(uint64_t **a1, _QWORD *a2)
{
  uint64_t **v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  size_t v8;
  void *v9;
  _QWORD *v10;
  uint64_t result;

  if (a1)
  {
    v3 = a1;
    v4 = 0;
    v5 = 0;
    while (1)
    {
      v6 = malloc_type_malloc(0x18uLL, 0xC274D582uLL);
      if (!v6)
        break;
      v7 = v6;
      *v6 = 0;
      v8 = (size_t)v3[1];
      v9 = sslAllocCopy(v3[2], v8);
      v7[2] = v9;
      if (!v9)
      {
        free(v7);
        break;
      }
      v7[1] = v8;
      v10 = v7;
      if (v5)
      {
        *v4 = v7;
        v10 = v5;
      }
      v3 = (uint64_t **)*v3;
      v4 = v7;
      v5 = v10;
      if (!v3)
        goto LABEL_10;
    }
    tls_free_buffer_list(v5);
    return 0xFFFFFFFFLL;
  }
  else
  {
    v10 = 0;
LABEL_10:
    result = 0;
    *a2 = v10;
  }
  return result;
}

uint64_t SessionCacheAddEntry(size_t **a1, size_t *a2, uint64_t a3, size_t *a4)
{
  uint64_t v8;
  size_t v9;
  time_t v11;
  size_t *v12;

  v8 = (uint64_t)a1;
  do
  {
    v8 = *(_QWORD *)v8;
    if (!v8)
    {
      v11 = time(0);
      if (!a4)
        a4 = a1[1];
      v12 = (size_t *)sslMalloc(0x30uLL);
      if (!v12)
        goto LABEL_14;
      if (!SSLCopyBuffer((uint64_t)a2, v12 + 1))
      {
        if (!SSLCopyBuffer(a3, v12 + 3))
        {
          v12[5] = (size_t)a4 + v11;
          goto LABEL_14;
        }
        SSLFreeBuffer(v12 + 1);
      }
      sslFree(v12);
      v12 = 0;
LABEL_14:
      *v12 = (size_t)*a1;
      *a1 = v12;
      return 0;
    }
  }
  while (!SessionCacheEntryMatchKey(v8, a2));
  v9 = *(_QWORD *)(v8 + 24);
  if (v9 != *(_QWORD *)a3 || memcmp(*(const void **)(v8 + 32), *(const void **)(a3 + 8), v9))
  {
    SSLFreeBuffer((_QWORD *)(v8 + 24));
    return SSLCopyBuffer(a3, (size_t *)(v8 + 24));
  }
  return 0;
}

uint64_t SSLCopyBuffer(uint64_t a1, size_t *a2)
{
  size_t v3;
  void *v4;
  uint64_t result;

  v3 = *(_QWORD *)a1;
  v4 = sslAllocCopy(*(const void **)(a1 + 8), *(_QWORD *)a1);
  a2[1] = (size_t)v4;
  if (!v4)
    return 0xFFFFFFFFLL;
  result = 0;
  *a2 = v3;
  return result;
}

void *sslAllocCopy(const void *a1, size_t size)
{
  void *v4;
  void *v5;

  v4 = malloc_type_malloc(size, 0xC274D582uLL);
  v5 = v4;
  if (v4)
    memmove(v4, a1, size);
  return v5;
}

uint64_t tls_handshake_set_peer_rsa_public_key(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;

  v5 = a1 + 40;
  sslFreePubKey(a1 + 40);
  return sslGetPubKeyFromBits(a2, a3, v5);
}

uint64_t tls_cache_cleanup(uint64_t a1)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  SessionCacheCleanup((_QWORD **)a1);
  return pthread_mutex_unlock(v2);
}

uint64_t SessionCacheCleanup(_QWORD **a1)
{
  time_t v2;
  _QWORD *v3;
  time_t v4;
  char v5;

  v2 = time(0);
  v3 = *a1;
  if (*a1)
  {
    v4 = v2;
    v5 = 0;
    do
    {
      if (v3[5] >= v4)
      {
        v5 = 1;
        a1 = (_QWORD **)v3;
      }
      else
      {
        *a1 = (_QWORD *)*v3;
        SSLFreeBuffer(v3 + 1);
        SSLFreeBuffer(v3 + 3);
        sslFree(v3);
      }
      v3 = *a1;
    }
    while (*a1);
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

_QWORD *tls_cache_create()
{
  _QWORD *v0;
  _QWORD *v1;

  v0 = malloc_type_malloc(0x50uLL, 0x102004089B94702uLL);
  v1 = v0;
  if (v0)
  {
    SessionCacheInit(v0);
    pthread_mutex_init((pthread_mutex_t *)(v1 + 2), 0);
  }
  return v1;
}

_QWORD *SessionCacheInit(_QWORD *result)
{
  *result = 0;
  result[1] = 600;
  return result;
}

uint64_t tls_handshake_close(uint64_t a1)
{
  uint64_t result;

  result = SSLSendAlert(1, 0, a1);
  *(_DWORD *)(a1 + 380) = 3;
  return result;
}

uint64_t SSLSendAlert(char a1, int a2, uint64_t a3)
{
  uint64_t v4;
  size_t v8;
  _BYTE *v9;

  v9 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
  if (!*(_DWORD *)a3 || *(_BYTE *)(a3 + 704))
    return 0;
  v8 = 2;
  v4 = SSLAllocBuffer(&v8, 2uLL);
  if (!(_DWORD)v4)
  {
    *v9 = a1;
    v9[1] = a2;
    v4 = (**(uint64_t (***)(_QWORD, size_t, _BYTE *, uint64_t))(a3 + 1112))(*(_QWORD *)(a3 + 1104), v8, v9, 21);
    SSLFreeBuffer(&v8);
    if (!a2)
      *(_BYTE *)(a3 + 704) = 1;
  }
  return v4;
}

void tls_metric_client_finished(uint64_t a1)
{
  int KeyExchangeMethod;
  int v4;
  char v5;
  const char *v6;
  unint64_t v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  char v14;
  int *v15;
  int v16;
  int v17;
  BOOL v18;
  int v19;
  int v20;
  int v21;
  char v22;
  const char *v23;
  const char *v24;
  const char *v25;
  const char **v26;
  const char **v27;
  int v28;

  if (arc4random_uniform(0x64u) > 9)
    return;
  KeyExchangeMethod = sslCipherSuiteGetKeyExchangeMethod(*(unsigned __int16 *)(a1 + 328));
  if (KeyExchangeMethod == 17 || KeyExchangeMethod == 15)
  {
    v4 = *(_DWORD *)(a1 + 144);
    if (v4 > 23)
    {
      if (v4 == 24)
      {
        v28 = 0;
        v5 = 0;
        v6 = "p384";
        goto LABEL_26;
      }
      if (v4 == 25)
      {
        v28 = 0;
        v5 = 0;
        v6 = "p521";
        goto LABEL_26;
      }
    }
    else
    {
      if (v4 == -1)
      {
LABEL_25:
        v28 = 0;
        v6 = 0;
        v5 = 1;
        goto LABEL_26;
      }
      if (v4 == 23)
      {
        v28 = 0;
        v5 = 0;
        v6 = "p256";
        goto LABEL_26;
      }
    }
    v28 = 0;
    v5 = 0;
    v6 = "other";
    goto LABEL_26;
  }
  if (KeyExchangeMethod != 9 || !*(_QWORD *)(a1 + 96))
    goto LABEL_25;
  v7 = cczp_bitlen();
  if (v7 < 0x800)
    v8 = 4;
  else
    v8 = 5;
  if (v7 >= 0x400)
    v9 = v8;
  else
    v9 = 3;
  if (v7 >= 0x300)
    v10 = v9;
  else
    v10 = 2;
  if (v7 < 0x200)
    v10 = 1;
  v28 = v10;
  v5 = 1;
  v6 = 0;
LABEL_26:
  v11 = *(unsigned int *)(a1 + 772);
  if ((_DWORD)v11)
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = *(int **)(a1 + 776);
    do
    {
      v17 = *v15++;
      v16 = v17;
      v18 = v17 == 64;
      if (v17 == 64)
        v19 = 1;
      else
        v19 = v13;
      if (v18)
        v20 = v12;
      else
        v20 = 1;
      if (v16 == 1)
      {
        v14 = 1;
      }
      else
      {
        v13 = v19;
        v12 = v20;
      }
      --v11;
    }
    while (v11);
  }
  else
  {
    v14 = 0;
    LOBYTE(v13) = 0;
    LOBYTE(v12) = 0;
  }
  v21 = *(_DWORD *)(a1 + 784);
  if (v21 == -1)
  {
    v23 = 0;
    v22 = 1;
  }
  else if (v21 == 1)
  {
    v22 = 0;
    v23 = "rsa";
  }
  else
  {
    v22 = 0;
    if (v21 == 64)
      v23 = "ecc";
    else
      v23 = "other";
  }
  if (*(_QWORD *)(a1 + 48))
  {
    if (*(_BYTE *)(a1 + 40))
      v24 = "rsa";
    else
      v24 = "ecc";
  }
  else
  {
    v24 = "none";
  }
  if (process_identifier___csops_once != -1)
    dispatch_once(&process_identifier___csops_once, &__block_literal_global);
  if (*(_BYTE *)(a1 + 16))
    v25 = "dtls";
  else
    v25 = "tls";
  v26 = (const char **)tls_metric_event_new("client_finished", (const char *)process_identifier_data, v25);
  if (v26)
  {
    v27 = v26;
    tls_metric_event_add_string(v26, "config", "%d", *(_DWORD *)(a1 + 1092));
    tls_metric_event_add_string(v27, "pv", "%04x", *(_DWORD *)a1);
    tls_metric_event_add_string(v27, "cs", "%04x", *(unsigned __int16 *)(a1 + 328));
    tls_metric_event_add_string(v27, "key_type", "%s", v24);
    if (*(_QWORD *)(a1 + 824))
      tls_metric_event_add_string(v27, "kxSigAlg", "%02x_%02x", *(_DWORD *)(a1 + 824), *(_DWORD *)(a1 + 828));
    if (*(_QWORD *)(a1 + 816))
      tls_metric_event_add_string(v27, "certSigAlg", "%02x_%02x", *(_DWORD *)(a1 + 816), *(_DWORD *)(a1 + 820));
    if (v28)
      tls_metric_event_add_string(v27, "dhe_bucket", "%d", v28);
    if ((v5 & 1) != 0)
    {
      if ((v22 & 1) != 0)
        goto LABEL_69;
    }
    else
    {
      tls_metric_event_add_string(v27, "curve", "%s", v6);
      if ((v22 & 1) != 0)
      {
LABEL_69:
        if ((v14 & 1) == 0)
          goto LABEL_70;
        goto LABEL_95;
      }
    }
    tls_metric_event_add_string(v27, "neg_client_cert", "%s", v23);
    if ((v14 & 1) == 0)
    {
LABEL_70:
      if ((v13 & 1) == 0)
        goto LABEL_71;
      goto LABEL_96;
    }
LABEL_95:
    ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "req_client_cert_rsa", v27[2]);
    if ((v13 & 1) == 0)
    {
LABEL_71:
      if ((v12 & 1) == 0)
      {
LABEL_73:
        if (*(_BYTE *)(a1 + 931))
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "npn_confirmed", v27[2]);
        if (*(_BYTE *)(a1 + 971))
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "alpn_received", v27[2]);
        if (*(_BYTE *)(a1 + 1009))
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "ocsp_peer_enabled", v27[2]);
        if (*(_BYTE *)(a1 + 1040))
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "ocsp_response_received", v27[2]);
        if (*(_BYTE *)(a1 + 1067))
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "sct_peer_enabled", v27[2]);
        if (*(_QWORD *)(a1 + 1072))
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "sct_list", v27[2]);
        if (*(_BYTE *)(a1 + 707))
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "sessionticket_confirmed", v27[2]);
        if (*(_QWORD *)(a1 + 952))
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "npnpeerdata", v27[2]);
        if (*(_QWORD *)(a1 + 712))
          ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "sessionticket", v27[2]);
        free(v27);
        return;
      }
LABEL_72:
      ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "req_client_cert_other", v27[2]);
      goto LABEL_73;
    }
LABEL_96:
    ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", *v27, v27[1], "req_client_cert_ecc", v27[2]);
    if ((v12 & 1) == 0)
      goto LABEL_73;
    goto LABEL_72;
  }
}

void tls_metric_event_add_string(const char **a1, const char *a2, char *a3, ...)
{
  char *v5[2];
  va_list va;

  va_start(va, a3);
  v5[0] = 0;
  va_copy((va_list)&v5[1], va);
  vasprintf(v5, a3, va);
  if (v5[0])
  {
    ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s=%s.%s", *a1, a1[1], a2, v5[0], a1[2]);
    free(v5[0]);
  }
}

void ADClientIncValueForScalarKeyWithFormat(char *a1, ...)
{
  const char *v1;
  xpc_object_t v2;
  void *v3[2];
  va_list va;

  va_start(va, a1);
  v3[0] = 0;
  va_copy((va_list)&v3[1], va);
  vasprintf((char **)v3, a1, va);
  v1 = (const char *)v3[0];
  if (v3[0])
  {
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v2, "operation", 5);
    xpc_dictionary_set_int64(v2, "value", 1);
    xpc_dictionary_set_string(v2, "key", v1);
    if (connection___once != -1)
      dispatch_once(&connection___once, &__block_literal_global_300);
    xpc_connection_send_notification();
    xpc_release(v2);
    free(v3[0]);
  }
}

uint64_t tls_handshake_set_peer_ec_public_key(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;

  v5 = a1 + 40;
  sslFreePubKey(a1 + 40);
  return sslGetEcPubKeyFromBits(a2, a3, v5);
}

uint64_t SSLAddSessionData(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  const void *v6;
  size_t v7;
  __int128 v8;
  __int128 v9;
  size_t v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  size_t v17;
  unint64_t v18;

  v17 = 0xAAAAAAAAAAAAAAAALL;
  v18 = 0xAAAAAAAAAAAAAAAALL;
  if (!*(_QWORD *)(a1 + 312) && !*(_QWORD *)(a1 + 720))
    return 4294957492;
  v2 = SSLEncodedBufferListSize(*(_QWORD **)(a1 + 1072), 2);
  v3 = SSLEncodedBufferListSize(*(_QWORD **)(a1 + 64), 3);
  v4 = SSLAllocBuffer(&v17, v2 + v3 + *(_QWORD *)(a1 + 712) + *(_QWORD *)(a1 + 1048) + 144);
  if (!(_DWORD)v4)
  {
    v5 = v18;
    v6 = *(const void **)(a1 + 312);
    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 304);
      *(_QWORD *)v18 = v7;
      memcpy((void *)(v5 + 8), v6, v7);
    }
    else
    {
      *(_QWORD *)v18 = 14;
      qmemcpy((void *)(v5 + 8), "SESSION-TICKET", 14);
    }
    *(_QWORD *)(v5 + 40) = *(_QWORD *)a1;
    *(_WORD *)(v5 + 48) = *(_WORD *)(a1 + 328);
    v8 = *(_OWORD *)(a1 + 520);
    v9 = *(_OWORD *)(a1 + 536);
    *(_OWORD *)(v5 + 84) = *(_OWORD *)(a1 + 552);
    *(_OWORD *)(v5 + 68) = v9;
    *(_OWORD *)(v5 + 52) = v8;
    v10 = *(_QWORD *)(a1 + 712);
    *(_QWORD *)(v5 + 104) = v10;
    *(_QWORD *)(v5 + 112) = *(_QWORD *)(a1 + 1048);
    *(_QWORD *)(v5 + 120) = v2;
    *(_QWORD *)(v5 + 128) = v3;
    *(_WORD *)(v5 + 50) = 0;
    memcpy((void *)(v5 + 137), *(const void **)(a1 + 720), v10);
    v11 = (void *)(v5 + 137 + *(_QWORD *)(a1 + 712));
    memcpy(v11, *(const void **)(a1 + 1056), *(_QWORD *)(a1 + 1048));
    v12 = SSLEncodeBufferList(*(uint64_t **)(a1 + 1072), 2, (uint64_t)v11 + *(_QWORD *)(a1 + 1048));
    SSLEncodeBufferList(*(uint64_t **)(a1 + 64), 3, v12);
    if (v17 >= 0x90 && v17 == vaddvq_s64(vaddq_s64(*(int64x2_t *)(v18 + 104), *(int64x2_t *)(v18 + 120))) + 144)
    {
      v13 = *(_BYTE *)(a1 + 768) && *(_BYTE *)(a1 + 769);
      *(_BYTE *)(v5 + 136) = v13;
      v14 = 312;
      if (!*(_BYTE *)(a1 + 17))
        v14 = 256;
      v15 = 304;
      if (!*(_BYTE *)(a1 + 17))
        v15 = 248;
      v4 = (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 1112) + 32))(*(_QWORD *)(a1 + 1104), *(_QWORD *)(a1 + v15), *(_QWORD *)(a1 + v14));
    }
    else
    {
      v4 = 4294957486;
    }
    SSLFreeBuffer(&v17);
  }
  return v4;
}

uint64_t SSLEncodeBufferList(uint64_t *a1, int a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  void *v5;
  uint64_t *v6;

  if (a1)
  {
    v3 = a1;
    v4 = a2;
    do
    {
      v5 = (void *)SSLEncodeInt(a3, v3[1], v4);
      memcpy(v5, (const void *)v3[2], v3[1]);
      v6 = v3;
      v3 = (uint64_t *)*v3;
      a3 = (uint64_t)v5 + v6[1];
    }
    while (v3);
  }
  return a3;
}

uint64_t tls_cache_load_session_data(uint64_t a1, size_t *a2, size_t *a3)
{
  pthread_mutex_t *v6;
  uint64_t v7;

  v6 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v7 = SessionCacheLookupEntry((_QWORD *)a1, a2, a3);
  pthread_mutex_unlock(v6);
  return v7;
}

uint64_t SessionCacheLookupEntry(_QWORD *a1, size_t *a2, size_t *a3)
{
  _QWORD *v6;

  do
  {
    v6 = a1;
    a1 = (_QWORD *)*a1;
    if (!a1)
      return 4294957492;
  }
  while (!SessionCacheEntryMatchKey((uint64_t)a1, a2));
  if (a1[5] < time(0))
  {
    *v6 = *a1;
    SSLFreeBuffer(a1 + 1);
    SSLFreeBuffer(a1 + 3);
    sslFree(a1);
    return 4294957492;
  }
  return SSLCopyBuffer((uint64_t)(a1 + 3), a3);
}

uint64_t sslGetPubKeyFromBits(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  size_t v9;
  void *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 4294967246;
  v4 = *a1 + 7;
  v5 = MEMORY[0x1E0C80A78](a1);
  v7 = (8 * (v4 >> 3) + 15) & 0xFFFFFFFFFFFFFFF0;
  if (v4 > 7)
  {
    v9 = ((v6 - 1) & 0xFFFFFFFFFFFFFFF8) + 8;
    v10 = memset((char *)v13 - v7, 170, v9);
    MEMORY[0x1E0C80A78](v10);
    memset((char *)v13 - v7, 170, v9);
  }
  else
  {
    MEMORY[0x1E0C80A78](v5);
  }
  if (ccn_read_uint()
    || ccn_read_uint()
    || (unint64_t)ccn_bitlen() < 2
    || (v11 = sslMalloc(3 * (v4 & 0xFFFFFFFFFFFFFFF8) + 40)) == 0)
  {
    __ssl_debug("sslError", "sslGetPubKeyFromBits", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 742, "sslGetPubKeyFromBits: SecKeyCreateRSAPublicKey failed\n");
    return 4294957487;
  }
  else
  {
    v12 = v11;
    *v11 = v4 >> 3;
    ccrsa_init_pub();
    result = 0;
    *(_BYTE *)a3 = 1;
    *(_QWORD *)(a3 + 8) = v12;
  }
  return result;
}

uint64_t SSLProcessCertificateVerify(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  __int128 v4;
  unsigned int v5;
  uint64_t v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];
  _OWORD v15[4];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v15[2] = v4;
  v15[3] = v4;
  v15[0] = v4;
  v15[1] = v4;
  if (*(_BYTE *)(a3 + 16))
    v5 = 65279;
  else
    v5 = 770;
  if (*(_DWORD *)a3 <= v5)
  {
    v6 = 0;
    v7 = 0;
    v8 = (unint64_t)a2;
  }
  else
  {
    if (a1 <= 1)
    {
      __ssl_debug("sslError", "SSLProcessCertificateVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 677, "SSLProcessCertificateVerify: msg len error 1\n");
      return 4294957496;
    }
    v6 = *a2;
    v8 = (unint64_t)(a2 + 2);
    v7 = a2[1];
  }
  if (v8 + 2 > (unint64_t)&a2[a1])
  {
    __ssl_debug("sslError", "SSLProcessCertificateVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 685, "SSLProcessCertificateVerify: msg len error\n");
    return 4294957496;
  }
  if (v8 + 2 + SSLDecodeSize(v8, 2) > (unint64_t)&a2[a1])
  {
    __ssl_debug("sslError", "SSLProcessCertificateVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 692, "SSLProcessCertificateVerify: sig len error 1\n");
    return 4294957496;
  }
  v14[0] = 64;
  v14[1] = v15;
  v9 = (*(uint64_t (**)(uint64_t, _QWORD *, uint64_t))(*(_QWORD *)(a3 + 24) + 24))(a3, v14, v6);
  if (!(_DWORD)v9)
  {
    if (*(_BYTE *)(a3 + 16))
      v11 = 65279;
    else
      v11 = 770;
    v12 = a3 + 40;
    if (*(_DWORD *)a3 > v11 && v7 == 1)
      v13 = sslRsaVerify(v12);
    else
      v13 = sslRawVerify(v12);
    v9 = v13;
    if ((_DWORD)v13)
      SSLFatalSessionAlert(51, a3);
  }
  return v9;
}

uint64_t tls12ComputeCertVfyMac(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t v3;
  uint64_t v5;
  int *v6;
  size_t v8[2];

  v8[1] = 0;
  v3 = 4294957486;
  switch(a3)
  {
    case 2:
      v5 = a1 + 568;
      v6 = &SSLHashSHA1;
      goto LABEL_6;
    case 4:
      v5 = a1 + 600;
      v6 = &SSLHashSHA256;
      goto LABEL_6;
    case 5:
      v5 = a1 + 616;
      v6 = &SSLHashSHA384;
      goto LABEL_6;
    case 6:
      v5 = a1 + 632;
      v6 = &SSLHashSHA512;
LABEL_6:
      v8[0] = 0xAAAAAAAAAAAAAAAALL;
      v3 = CloneHashState((uint64_t)v6, v5, v8);
      if (!(_DWORD)v3)
      {
        *a2 = *v6;
        v3 = (*((uint64_t (**)(uint64_t, _QWORD *))v6 + 4))((uint64_t)v8, a2);
      }
      SSLFreeBuffer(v8);
      break;
    default:
      return v3;
  }
  return v3;
}

uint64_t sslRsaVerify(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  if (*(_BYTE *)a1 && *(_QWORD *)(a1 + 8))
  {
    v1 = ccrsa_verify_pkcs1v15();
    if ((_DWORD)v1)
    {
      v2 = v1;
      __ssl_debug("sslError", "sslRsaVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 535, "sslRsaVerify: ccrsa_verify_pkcs1v15 failed (error %d)\n", v1);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    __ssl_debug("sslError", "sslRsaVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 528, "Internal Error: Invalid RSA public key\n");
    return 4294957486;
  }
  return v2;
}

uint64_t __security_debug_init()
{
  uint64_t result;
  int v1;
  timespec v2;
  void *v3;
  void *v4;
  off_t st_size;
  void *v6;
  void *v7;
  stat v8;

  result = open("/Library/Preferences/com.apple.security.plist", 0);
  if ((_DWORD)result != -1)
  {
    v1 = result;
    v2.tv_sec = 0xAAAAAAAAAAAAAAAALL;
    v2.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
    *(timespec *)&v8.st_blksize = v2;
    *(timespec *)v8.st_qspare = v2;
    v8.st_birthtimespec = v2;
    *(timespec *)&v8.st_size = v2;
    v8.st_mtimespec = v2;
    v8.st_ctimespec = v2;
    *(timespec *)&v8.st_uid = v2;
    v8.st_atimespec = v2;
    *(timespec *)&v8.st_dev = v2;
    if (fstat(result, &v8) != -1 && v8.st_size <= 99999)
    {
      v3 = malloc_type_malloc(v8.st_size, 0xEC05DB5FuLL);
      if (v3)
      {
        v4 = v3;
        st_size = v8.st_size;
        if (st_size == read(v1, v3, v8.st_size))
        {
          v6 = (void *)xpc_create_from_plist();
          if (v6)
          {
            v7 = v6;
            gDebugScope = (uint64_t)xpc_dictionary_get_value(v6, "SSLDebugScope");
            if (gDebugScope)
            {
              if (MEMORY[0x1DF0F5378]() == MEMORY[0x1E0C812F8])
              {
                xpc_retain((xpc_object_t)gDebugScope);
              }
              else if (MEMORY[0x1DF0F5378](gDebugScope) == MEMORY[0x1E0C812D0])
              {
                __ssl_debug_all = xpc_BOOL_get_value((xpc_object_t)gDebugScope);
                gDebugScope = 0;
              }
            }
            xpc_release(v7);
          }
        }
        free(v4);
      }
    }
    return close(v1);
  }
  return result;
}

_QWORD *tls_metric_event_new(const char *a1, const char *a2, const char *a3)
{
  _QWORD *v6;
  _QWORD *v7;

  v6 = malloc_type_malloc(0x20uLL, 0x50040BBB33FCDuLL);
  v7 = v6;
  if (v6)
  {
    *v6 = a1;
    v6[1] = a3;
    v6[2] = a2;
    ADClientIncValueForScalarKeyWithFormat("com.apple.coretls.%s.%s.%s.%s", a1, a3, "events", a2);
  }
  return v7;
}

uint64_t tls_handshake_get_negotiated_cipherspec(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 328);
}

uint64_t tls_cache_save_session_data(uint64_t a1, size_t *a2, uint64_t a3, size_t *a4)
{
  pthread_mutex_t *v8;
  uint64_t v9;

  v8 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v9 = SessionCacheAddEntry((size_t **)a1, a2, a3, a4);
  pthread_mutex_unlock(v8);
  return v9;
}

dispatch_queue_t __queue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t result;

  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  result = dispatch_queue_create("com.apple.aggregated.requestQueue", v0);
  queue___queue = (uint64_t)result;
  return result;
}

uint64_t __connection_block_invoke_2(int a1, xpc_object_t xdict)
{
  const char *string;

  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81270]);
  return fprintf((FILE *)*MEMORY[0x1E0C80C10], "error in %s: %s\n", "connection_block_invoke_2", string);
}

void __connection_block_invoke()
{
  if (queue___once != -1)
    dispatch_once(&queue___once, &__block_literal_global_307);
  connection___connection = (uint64_t)xpc_connection_create_mach_service("com.apple.aggregated", (dispatch_queue_t)queue___queue, 0);
  xpc_connection_set_event_handler((xpc_connection_t)connection___connection, &__block_literal_global_304);
  xpc_connection_resume((xpc_connection_t)connection___connection);
}

const void *SessionCacheEntryMatchKey(uint64_t a1, size_t *a2)
{
  size_t v2;
  const void *result;
  const void *v5;

  v2 = *a2;
  if (*a2 != *(_QWORD *)(a1 + 8))
    return 0;
  result = (const void *)a2[1];
  if (!result)
    return result;
  v5 = *(const void **)(a1 + 16);
  if (v5)
    return (const void *)(memcmp(result, v5, v2) == 0);
  else
    return 0;
}

uint64_t SessionCacheDeleteEntry(_QWORD *a1, size_t *a2)
{
  _QWORD *v4;

  while (1)
  {
    v4 = a1;
    a1 = (_QWORD *)*a1;
    if (!a1)
      break;
    if (SessionCacheEntryMatchKey((uint64_t)a1, a2))
    {
      *v4 = *a1;
      SSLFreeBuffer(a1 + 1);
      SSLFreeBuffer(a1 + 3);
      sslFree(a1);
      return 0;
    }
  }
  return 0;
}

void SessionCacheEmpty(_QWORD **a1)
{
  _QWORD *i;

  for (i = *a1; *a1; i = *a1)
  {
    *a1 = (_QWORD *)*i;
    SSLFreeBuffer(i + 1);
    SSLFreeBuffer(i + 3);
    sslFree(i);
  }
}

double tls_record_rollback_write_cipher(uint64_t a1)
{
  uint64_t v2;
  double result;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  v2 = *(_QWORD *)(a1 + 304);
  if (!v2 || !(*(unsigned int (**)(_QWORD))(v2 + 8))(*(_QWORD *)(a1 + 312)))
  {
    v4 = *(_OWORD *)(a1 + 152);
    *(_OWORD *)(a1 + 328) = *(_OWORD *)(a1 + 136);
    *(_OWORD *)(a1 + 344) = v4;
    v5 = *(_OWORD *)(a1 + 184);
    *(_OWORD *)(a1 + 360) = *(_OWORD *)(a1 + 168);
    *(_OWORD *)(a1 + 376) = v5;
    v6 = *(_OWORD *)(a1 + 120);
    *(_OWORD *)(a1 + 296) = *(_OWORD *)(a1 + 104);
    *(_OWORD *)(a1 + 312) = v6;
    v7 = *(_OWORD *)(a1 + 440);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a1 + 424);
    *(_OWORD *)(a1 + 152) = v7;
    v8 = *(_OWORD *)(a1 + 472);
    *(_OWORD *)(a1 + 168) = *(_OWORD *)(a1 + 456);
    *(_OWORD *)(a1 + 184) = v8;
    v9 = *(_OWORD *)(a1 + 408);
    *(_OWORD *)(a1 + 104) = *(_OWORD *)(a1 + 392);
    *(_OWORD *)(a1 + 120) = v9;
    result = 0.0;
    *(_OWORD *)(a1 + 456) = 0u;
    *(_OWORD *)(a1 + 472) = 0u;
    *(_OWORD *)(a1 + 424) = 0u;
    *(_OWORD *)(a1 + 440) = 0u;
    *(_OWORD *)(a1 + 392) = 0u;
    *(_OWORD *)(a1 + 408) = 0u;
  }
  return result;
}

uint64_t tls_record_parse_ssl2_header(uint64_t a1, unint64_t a2, unsigned __int8 *a3, uint64_t *a4, _BYTE *a5)
{
  uint64_t result;

  if (a2 < 2)
    return 0xFFFFFFFFLL;
  if (((char)*a3 & 0x80000000) == 0)
    return 0xFFFFFFFFLL;
  *a4 = SSLDecodeInt(a3, 2) & 0x7FFF;
  result = 0;
  if (a5)
    *a5 = 0x80;
  return result;
}

double tls_stream_parser_create(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  double result;

  v4 = malloc_type_malloc(0x30uLL, 0x10900402D626F53uLL);
  result = 0.0;
  *v4 = 0u;
  v4[1] = 0u;
  *((_QWORD *)v4 + 4) = a1;
  *((_QWORD *)v4 + 5) = a2;
  return result;
}

uint64_t tls_stream_parser_parse(uint64_t *a1, unint64_t a2, char *__src)
{
  unint64_t v4;
  size_t *v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  unint64_t v9;
  size_t v10;
  size_t v11;
  size_t v12;
  size_t v13;
  uint64_t result;
  uint64_t v15;
  int v16;

  if (!a2)
    return 0;
  v4 = a2;
  v6 = (size_t *)(a1 + 2);
  v7 = (unsigned __int8 *)(a1 + 1);
  v8 = (unsigned __int8 *)a1 + 11;
  do
  {
    v9 = *a1;
    if ((unint64_t)*a1 > 4)
    {
      if (v4 >= a1[2] - v9)
        v10 = a1[2] - v9;
      else
        v10 = v4;
      memcpy((void *)(a1[3] + v9), __src, v10);
      v13 = *a1 + v10;
      *a1 = v13;
      if (v13 >= a1[2])
      {
        result = ((uint64_t (*)(uint64_t))a1[5])(a1[4]);
        if ((_DWORD)result)
          return result;
        *a1 = 0;
        SSLFreeBuffer(v6);
      }
    }
    else
    {
      if (v4 >= 5 - v9)
        v10 = 5 - v9;
      else
        v10 = v4;
      memcpy(&v7[v9], __src, v10);
      v11 = *a1 + v10;
      *a1 = v11;
      if (v11 == 5)
      {
        if ((char)*v7 < 0)
          v12 = (SSLDecodeInt(v7, 2) & 0x7FFF) + 2;
        else
          v12 = SSLDecodeInt(v8, 2) + 5;
        result = SSLAllocBuffer(v6, v12);
        if ((_DWORD)result)
          return result;
        v15 = a1[3];
        v16 = *(_DWORD *)v7;
        *(_BYTE *)(v15 + 4) = v7[4];
        *(_DWORD *)v15 = v16;
      }
    }
    __src += v10;
    v4 -= v10;
  }
  while (v4);
  return 0;
}

void tls_stream_parser_destroy(_QWORD *a1)
{
  SSLFreeBuffer(a1 + 2);
  sslFree(a1);
}

uint64_t tls_cache_destroy(uint64_t a1)
{
  SessionCacheEmpty((_QWORD **)a1);
  return pthread_mutex_destroy((pthread_mutex_t *)(a1 + 16));
}

uint64_t tls_cache_empty(uint64_t a1)
{
  pthread_mutex_t *v2;

  v2 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  SessionCacheEmpty((_QWORD **)a1);
  return pthread_mutex_unlock(v2);
}

uint64_t tls_cache_delete_session_data(uint64_t a1, size_t *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;

  v4 = (pthread_mutex_t *)(a1 + 16);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 16));
  v5 = SessionCacheDeleteEntry((_QWORD *)a1, a2);
  pthread_mutex_unlock(v4);
  return v5;
}

uint64_t SSLReallocBuffer(uint64_t a1, size_t a2)
{
  void *v4;
  size_t v5;
  uint64_t v6;

  v4 = malloc_type_realloc(*(void **)(a1 + 8), a2, 0x5F1AF22BuLL);
  if (v4)
    v5 = a2;
  else
    v5 = 0;
  if (v4)
    v6 = 0;
  else
    v6 = 0xFFFFFFFFLL;
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v4;
  return v6;
}

uint64_t SSLCopyBufferFromData(const void *a1, size_t a2, size_t *a3)
{
  void *v5;
  uint64_t result;

  v5 = sslAllocCopy(a1, a2);
  a3[1] = (size_t)v5;
  if (!v5)
    return 0xFFFFFFFFLL;
  result = 0;
  *a3 = a2;
  return result;
}

char *tls_private_key_rsa_create(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD v5[4];

  v5[1] = a2;
  v5[0] = 0xAAAAAAAA00000000;
  v5[2] = a3;
  v5[3] = a4;
  return tls_private_key_create((uint64_t)v5, a1, 0);
}

char *tls_private_key_ecdsa_create(uint64_t a1, uint64_t a2, __int16 a3, uint64_t a4)
{
  _QWORD v5[2];
  unint64_t v6;
  uint64_t v7;

  v5[1] = a2;
  v5[0] = 0xAAAAAAAA00000001;
  v6 = 0xAAAAAAAAAAAAAAAALL;
  v7 = a4;
  LOWORD(v6) = a3;
  return tls_private_key_create((uint64_t)v5, a1, 0);
}

uint64_t tls_handshake_set_ems_enable(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 768) = a2;
  return 0;
}

uint64_t tls_handshake_set_ciphersuites(uint64_t a1, unsigned __int16 *a2, unsigned int a3)
{
  return tls_handshake_set_ciphersuites_internal(a1, 0xFFFFFFFF, a2, a3);
}

uint64_t tls_handshake_get_ciphersuites(uint64_t a1, _QWORD *a2, _DWORD *a3)
{
  *a2 = *(_QWORD *)(a1 + 352);
  *a3 = *(_DWORD *)(a1 + 360);
  return 0;
}

uint64_t tls_handshake_set_session_ticket_enabled(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 705) = a2;
  return 0;
}

uint64_t tls_handshake_set_renegotiation(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 321) = a2;
  return 0;
}

uint64_t tls_handshake_set_mtu(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 < 0x40)
    return 4294967246;
  result = 0;
  *(_QWORD *)(a1 + 840) = a2;
  return result;
}

uint64_t tls_handshake_set_min_dh_group_size(uint64_t a1, unsigned int a2)
{
  unsigned int v2;

  if (a2 <= 0x200)
    v2 = 512;
  else
    v2 = a2;
  if (v2 >= 0x800)
    v2 = 2048;
  *(_DWORD *)(a1 + 76) = v2;
  return 0;
}

uint64_t tls_handshake_get_min_dh_group_size(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 76);
  return 0;
}

uint64_t tls_handshake_set_dh_parameters(uint64_t a1)
{
  uint64_t v2;
  size_t v3;
  _QWORD *v4;

  v2 = ccder_decode_dhparam_n();
  sslFree(*(void **)(a1 + 96));
  v3 = ccdh_gp_size();
  v4 = sslMalloc(v3);
  *(_QWORD *)(a1 + 96) = v4;
  if (!v4)
    return 4294967188;
  *v4 = v2;
  if (ccder_decode_dhparams())
    return 0;
  else
    return 4294967246;
}

uint64_t tls_handshake_set_encrypt_rsa_public_key(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v5;

  v5 = a1 + 168;
  sslFreePubKey(a1 + 168);
  return sslGetPubKeyFromBits(a2, a3, v5);
}

uint64_t tls_handshake_set_psk_identity(uint64_t a1, uint64_t a2)
{
  SSLCopyBuffer(a2, (size_t *)(a1 + 912));
  return 0;
}

uint64_t tls_handshake_set_psk_identity_hint()
{
  return 0xFFFFFFFFLL;
}

uint64_t tls_handshake_set_psk_secret(uint64_t a1, uint64_t a2)
{
  SSLCopyBuffer(a2, (size_t *)(a1 + 896));
  return 0;
}

uint64_t tls_handshake_set_client_auth_type(uint64_t a1, int a2)
{
  *(_DWORD *)(a1 + 784) = a2;
  return 0;
}

uint64_t tls_handshake_set_acceptable_dn_list(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 384) = a2;
  return 0;
}

uint64_t tls_handshake_get_acceptable_dn_list(uint64_t a1, _QWORD *a2)
{
  *a2 = *(_QWORD *)(a1 + 384);
  return 0;
}

uint64_t tls_handshake_set_acceptable_client_auth_type(uint64_t a1, const void *a2, unsigned int a3)
{
  void *v6;

  sslFree(*(void **)(a1 + 776));
  v6 = sslMalloc(4 * a3);
  *(_QWORD *)(a1 + 776) = v6;
  if (!v6)
    return 4294967188;
  *(_DWORD *)(a1 + 772) = a3;
  memcpy(v6, a2, 4 * a3);
  return 0;
}

uint64_t tls_handshake_set_false_start(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 928) = a2;
  return 0;
}

uint64_t tls_handshake_get_false_start(uint64_t a1, _BYTE *a2)
{
  *a2 = *(_BYTE *)(a1 + 928);
  return 0;
}

uint64_t tls_handshake_set_npn_enable(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 929) = a2;
  return 0;
}

uint64_t tls_handshake_set_npn_data(uint64_t a1, uint64_t a2, uint64_t a3)
{
  size_t *v3;
  _QWORD v5[2];

  v5[0] = a2;
  v5[1] = a3;
  v3 = (size_t *)(a1 + 936);
  SSLFreeBuffer((_QWORD *)(a1 + 936));
  return SSLCopyBuffer((uint64_t)v5, v3);
}

uint64_t tls_handshake_set_alpn_data(uint64_t a1, uint64_t a2, uint64_t a3)
{
  size_t *v3;
  _QWORD v5[2];

  v5[0] = a2;
  v5[1] = a3;
  v3 = (size_t *)(a1 + 976);
  SSLFreeBuffer((_QWORD *)(a1 + 976));
  return SSLCopyBuffer((uint64_t)v5, v3);
}

uint64_t tls_handshake_set_server_identity_change(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 888) = a2;
  return 0;
}

uint64_t tls_handshake_get_server_identity_change(uint64_t a1, _BYTE *a2)
{
  *a2 = *(_BYTE *)(a1 + 888);
  return 0;
}

uint64_t tls_handshake_set_fallback(uint64_t a1, char a2)
{
  *(_BYTE *)(a1 + 1064) = a2;
  return 0;
}

uint64_t tls_handshake_get_fallback(uint64_t a1, _BYTE *a2)
{
  *a2 = *(_BYTE *)(a1 + 1064);
  return 0;
}

uint64_t tls_handshake_set_ocsp_responder_id_list(uint64_t a1, uint64_t **a2)
{
  _QWORD *v3;

  v3 = (_QWORD *)(a1 + 1032);
  tls_free_buffer_list(*(_QWORD **)(a1 + 1032));
  return tls_copy_buffer_list(a2, v3);
}

uint64_t tls_handshake_set_ocsp_request_extensions(uint64_t a1, uint64_t a2, uint64_t a3)
{
  size_t *v3;
  _QWORD v5[2];

  v5[0] = a2;
  v5[1] = a3;
  v3 = (size_t *)(a1 + 1016);
  SSLFreeBuffer((_QWORD *)(a1 + 1016));
  return SSLCopyBuffer((uint64_t)v5, v3);
}

uint64_t tls_handshake_set_ocsp_response(uint64_t a1, uint64_t a2)
{
  size_t *v3;

  v3 = (size_t *)(a1 + 1048);
  SSLFreeBuffer((_QWORD *)(a1 + 1048));
  return SSLCopyBuffer(a2, v3);
}

uint64_t tls_handshake_set_sct_list(uint64_t a1, uint64_t **a2)
{
  _QWORD *v3;

  v3 = (_QWORD *)(a1 + 1072);
  tls_free_buffer_list(*(_QWORD **)(a1 + 1072));
  return tls_copy_buffer_list(a2, v3);
}

BOOL tls_handshake_get_negotiated_ems(uint64_t a1)
{
  return *(_BYTE *)(a1 + 768) && *(_BYTE *)(a1 + 769);
}

uint64_t tls_handshake_set_user_agent(uint64_t a1, const char *a2)
{
  size_t v4;
  char *v5;

  sslFree(*(void **)(a1 + 408));
  *(_QWORD *)(a1 + 408) = 0;
  if (a2)
  {
    v4 = strlen(a2);
    v5 = (char *)sslMalloc(v4 + 1);
    *(_QWORD *)(a1 + 408) = v5;
    strcpy(v5, a2);
  }
  return 0;
}

uint64_t tls_handshake_get_config(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 1092);
  return 0;
}

uint64_t tls_handshake_request_renegotiation(uint64_t a1)
{
  uint64_t result;

  if (*(_DWORD *)(a1 + 380) != 16)
    return 4294957466;
  result = SSLResetFlight(a1);
  if (!(_DWORD)result)
  {
    *(_WORD *)(a1 + 202) = 0;
    result = SSLPrepareAndQueueMessage(SSLEncodeServerHelloRequest, 22, a1);
    if (!(_DWORD)result)
      return SSLSendFlight(a1);
  }
  return result;
}

uint64_t tls_handshake_send_alert(uint64_t a1, int a2, unsigned int a3)
{
  char v4;

  if ((a3 > 0x3C || ((1 << a3) & 0x100FFF0040700401) == 0)
    && (a3 - 70 > 0x28 || ((1 << (a3 - 70)) & 0x10040110403) == 0))
  {
    return 4294967246;
  }
  if (a2 == 2)
    v4 = 2;
  else
    v4 = 1;
  return SSLSendAlert(v4, a3, a1);
}

uint64_t tls_handshake_get_negotiated_protocol_version(unsigned int *a1)
{
  return *a1;
}

uint64_t tls_handshake_get_negotiated_curve(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 144);
}

uint64_t tls_handshake_get_server_random(uint64_t a1)
{
  return a1 + 468;
}

uint64_t tls_handshake_get_client_random(uint64_t a1)
{
  return a1 + 436;
}

uint64_t tls_handshake_get_master_secret(uint64_t a1)
{
  return a1 + 520;
}

BOOL tls_handshake_get_session_proposed(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 296);
    *a2 = *(_QWORD *)(a1 + 288);
    a2[1] = v2;
  }
  return *(_QWORD *)(a1 + 296) != 0;
}

uint64_t tls_handshake_get_session_match(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 312);
    *a2 = *(_QWORD *)(a1 + 304);
    a2[1] = v2;
  }
  return *(unsigned __int8 *)(a1 + 320);
}

uint64_t tls_handshake_get_sni_hostname(uint64_t a1)
{
  return a1 + 392;
}

uint64_t tls_handshake_get_peer_requested_ciphersuites(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 376);
  return *(_QWORD *)(a1 + 368);
}

uint64_t tls_handshake_get_peer_acceptable_client_auth_type(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 772);
  return *(_QWORD *)(a1 + 776);
}

uint64_t tls_handshake_get_peer_acceptable_dn_list(uint64_t a1)
{
  return *(_QWORD *)(a1 + 384);
}

uint64_t tls_handshake_get_peer_psk_identity_hint()
{
  return 0;
}

uint64_t tls_handshake_get_peer_psk_identity(uint64_t a1)
{
  return a1 + 912;
}

uint64_t tls_handshake_get_peer_ocsp_enabled(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1009);
}

uint64_t tls_handshake_get_peer_ocsp_responder_id_list(uint64_t a1)
{
  return *(_QWORD *)(a1 + 1032);
}

uint64_t tls_handshake_get_peer_ocsp_request_extensions(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 1009))
    return a1 + 1016;
  else
    return 0;
}

uint64_t tls_handshake_get_peer_sct_enabled(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 1067);
}

uint64_t tls_handshake_get_peer_requested_ecdh_curves(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(a1 + 1088);
  return *(_QWORD *)(a1 + 1080);
}

__n128 tls_handshake_internal_master_secret(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  __n128 result;
  __int128 v4;

  if (*a3 >= 0x30uLL)
  {
    result = *(__n128 *)(a1 + 520);
    v4 = *(_OWORD *)(a1 + 552);
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 536);
    *(_OWORD *)(a2 + 32) = v4;
    *(__n128 *)a2 = result;
    *a3 = 48;
  }
  return result;
}

__n128 tls_handshake_internal_server_random(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  __n128 result;
  __int128 v4;

  if (*a3 >= 0x20uLL)
  {
    result = *(__n128 *)(a1 + 468);
    v4 = *(_OWORD *)(a1 + 484);
    *(__n128 *)a2 = result;
    *(_OWORD *)(a2 + 16) = v4;
    *a3 = 32;
  }
  return result;
}

__n128 tls_handshake_internal_client_random(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  __n128 result;
  __int128 v4;

  if (*a3 >= 0x20uLL)
  {
    result = *(__n128 *)(a1 + 436);
    v4 = *(_OWORD *)(a1 + 452);
    *(__n128 *)a2 = result;
    *(_OWORD *)(a2 + 16) = v4;
    *a3 = 32;
  }
  return result;
}

uint64_t tls_handshake_internal_set_master_secret_function(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 752) = a2;
  *(_QWORD *)(a1 + 760) = a3;
  return 0;
}

uint64_t tls_handshake_internal_set_session_ticket(uint64_t a1, const void *a2, size_t a3)
{
  size_t *v6;

  if (a3 >> 16)
    return 4294967246;
  v6 = (size_t *)(a1 + 736);
  SSLFreeBuffer((_QWORD *)(a1 + 736));
  return SSLCopyBufferFromData(a2, a3, v6);
}

uint64_t tls_handshake_get_session_warning(uint64_t a1)
{
  return *(unsigned int *)(a1 + 1120);
}

uint64_t sslCipherSuiteGetMinSupportedTLSVersion(int a1)
{
  uint64_t v1;

  if (a1 > 155)
  {
    if ((a1 - 49153) < 0x19)
      return 769;
    else
      return 771;
  }
  else
  {
    v1 = 768;
    switch(a1)
    {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
      case 6:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
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
      case 23:
      case 24:
      case 25:
      case 26:
      case 27:
      case 28:
      case 29:
      case 47:
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
        return v1;
      default:
        return 771;
    }
  }
}

uint64_t sslCipherSuiteGetKeydataSize(int a1)
{
  uint64_t v2;
  uint64_t v3;
  char SymmetricCipherKeySize;

  v2 = (int)sslCipherSuiteGetSymmetricCipherAlgorithm(a1) - 1;
  if (v2 > 8)
    v3 = 0;
  else
    v3 = qword_1DF068FE8[v2];
  SymmetricCipherKeySize = sslCipherSuiteGetSymmetricCipherKeySize(a1);
  return v3 + 2 * ((sslCipherSuiteGetMacSize(a1) + SymmetricCipherKeySize) & 0x7F);
}

uint64_t SSLDeleteSessionData(_QWORD *a1)
{
  if (a1[39])
    return (*(uint64_t (**)(_QWORD, _QWORD))(a1[139] + 48))(a1[138], a1[38]);
  else
    return 4294957492;
}

uint64_t SSLRetrieveSessionTicket(unint64_t a1, uint64_t a2, _QWORD *a3)
{
  int64x2_t v3;
  uint64_t result;

  if (a1 < 0x90)
    return 4294957486;
  v3 = *(int64x2_t *)(a2 + 104);
  if (a1 != vaddvq_s64(vaddq_s64(v3, *(int64x2_t *)(a2 + 120))) + 144)
    return 4294957486;
  result = 0;
  a3[1] = a2 + 137;
  *a3 = v3.i64[0];
  return result;
}

uint64_t SSLRetrieveSessionID(unint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  if (a1 < 0x90 || a1 != vaddvq_s64(vaddq_s64(*(int64x2_t *)(a2 + 104), *(int64x2_t *)(a2 + 120))) + 144)
    return 4294957486;
  result = 0;
  *a3 = *(_QWORD *)a2;
  a3[1] = a2 + 8;
  return result;
}

uint64_t SSLServerValidateSessionData(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0x90)
    return 4294957486;
  if (a1 != vaddvq_s64(vaddq_s64(*(int64x2_t *)(a2 + 104), *(int64x2_t *)(a2 + 120))) + 144)
    return 4294957486;
  if (*(_QWORD *)a2 != *(_QWORD *)(a3 + 288)
    || memcmp((const void *)(a2 + 8), *(const void **)(a3 + 296), *(_QWORD *)a2)
    || *(_DWORD *)(a2 + 40) != *(_DWORD *)a3
    || !cipherSuiteInSet(*(unsigned __int16 *)(a2 + 48), *(unsigned __int16 **)(a3 + 352), *(unsigned int *)(a3 + 360))
    || !cipherSuiteInSet(*(unsigned __int16 *)(a2 + 48), *(unsigned __int16 **)(a3 + 368), *(unsigned int *)(a3 + 376)))
  {
    return 4294957492;
  }
  if (*(_BYTE *)(a2 + 136))
  {
    if (!*(_BYTE *)(a3 + 769))
    {
      SSLFatalSessionAlert(40, a3);
      return 4294957494;
    }
    goto LABEL_15;
  }
  if (*(_BYTE *)(a3 + 769))
    return 4294957492;
LABEL_15:
  *(_WORD *)(a3 + 328) = *(_WORD *)(a2 + 48);
  InitCipherSpecParams(a3);
  return 0;
}

uint64_t SSLClientValidateSessionDataBefore(unint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  unsigned int v5;

  if (a1 < 0x90)
    return 4294957486;
  if (a1 != vaddvq_s64(vaddq_s64(*(int64x2_t *)(a2 + 104), *(int64x2_t *)(a2 + 120))) + 144)
    return 4294957486;
  v4 = *(_DWORD *)(a3 + 12);
  if (v4 <= *(_DWORD *)(a2 + 44)
    && (v5 = *(_DWORD *)(a2 + 40), v5 <= v4)
    && v5 >= *(_DWORD *)(a3 + 8)
    && cipherSuiteInSet(*(unsigned __int16 *)(a2 + 48), *(unsigned __int16 **)(a3 + 352), *(unsigned int *)(a3 + 360)))
  {
    return 0;
  }
  else
  {
    return 4294957492;
  }
}

uint64_t SSLClientValidateSessionDataAfter(unint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 < 0x90 || a1 != vaddvq_s64(vaddq_s64(*(int64x2_t *)(a2 + 104), *(int64x2_t *)(a2 + 120))) + 144)
    return 4294957486;
  if (*(_DWORD *)(a2 + 40) == *(_DWORD *)a3
    && *(unsigned __int16 *)(a2 + 48) == *(unsigned __int16 *)(a3 + 328)
    && *(unsigned __int8 *)(a2 + 136) == *(unsigned __int8 *)(a3 + 769))
  {
    return 0;
  }
  return 4294957496;
}

uint64_t SSLInstallSessionFromData(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  __int128 v6;
  __int128 v7;
  char *v8;
  size_t *v9;
  size_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  unint64_t v13;
  uint64_t v14;
  void ***v15;
  uint64_t v16;
  unint64_t v17;

  if (a1 < 0x90)
    return 4294957486;
  if (a1 != vaddvq_s64(vaddq_s64(*(int64x2_t *)(a2 + 104), *(int64x2_t *)(a2 + 120))) + 144)
    return 4294957486;
  v6 = *(_OWORD *)(a2 + 52);
  v7 = *(_OWORD *)(a2 + 84);
  *(_OWORD *)(a3 + 536) = *(_OWORD *)(a2 + 68);
  *(_OWORD *)(a3 + 552) = v7;
  *(_OWORD *)(a3 + 520) = v6;
  v8 = (char *)(a2 + *(_QWORD *)(a2 + 104) + 137);
  v9 = (size_t *)(a3 + 1048);
  SSLFreeBuffer((_QWORD *)(a3 + 1048));
  *(_BYTE *)(a3 + 1040) = 0;
  v10 = *(_QWORD *)(a2 + 112);
  if (v10)
  {
    *(_BYTE *)(a3 + 1040) = 1;
    SSLCopyBufferFromData(v8, v10, v9);
    v11 = *(_QWORD *)(a2 + 112);
  }
  else
  {
    v11 = 0;
  }
  v12 = (unsigned __int8 *)&v8[v11];
  tls_free_buffer_list(*(_QWORD **)(a3 + 1072));
  *(_QWORD *)(a3 + 1072) = 0;
  v13 = *(_QWORD *)(a2 + 120);
  if (v13)
  {
    result = SSLDecodeBufferList(v12, v13, 2, (void ***)(a3 + 1072));
    if ((_DWORD)result)
      return result;
    v14 = *(_QWORD *)(a2 + 120);
  }
  else
  {
    v14 = 0;
  }
  v16 = *(_QWORD *)(a3 + 64);
  v15 = (void ***)(a3 + 64);
  SSLFreeCertificates(v16);
  *v15 = 0;
  v17 = *(_QWORD *)(a2 + 128);
  if (!v17)
    return 0;
  result = SSLDecodeBufferList(&v12[v14], v17, 3, v15);
  if (!(_DWORD)result)
    return 0;
  return result;
}

BOOL cipherSuiteInSet(int a1, unsigned __int16 *a2, unint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  int v6;

  if (!a3)
    return 0;
  if (*a2 == a1)
    return 1;
  v4 = 1;
  do
  {
    v5 = v4;
    if (a3 == v4)
      break;
    v6 = a2[v4++];
  }
  while (v6 != a1);
  return v5 < a3;
}

uint64_t sslEncodeDhParams(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  size_t v8;
  void *v9;
  void *v10;
  size_t v11;
  uint64_t inited;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;

  v8 = ccdh_gp_size();
  v9 = sslMalloc(v8);
  if (!v9)
    return 4294967188;
  v10 = v9;
  v11 = ccdh_gp_size();
  bzero(v10, v11);
  inited = ccdh_init_gp_from_bytes();
  v13 = inited;
  if ((_DWORD)inited)
  {
    if ((_DWORD)inited == -168)
    {
      v14 = copyHexString(*(_QWORD *)(a3 + 8), *(_QWORD *)a3);
      v15 = copyHexString(*(_QWORD *)(a4 + 8), *(_QWORD *)a4);
      tls_metric_insecure_dh_param();
      tls_handshake_set_session_warning(a1, -168);
      if (v14)
        CFRelease(v14);
      if (v15)
        CFRelease(v15);
      v13 = 4294957446;
    }
    sslFree(v10);
  }
  else
  {
    *a2 = v10;
  }
  return v13;
}

uint64_t sslDhCreateKey(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t key;

  v3 = ccdh_ccn_size();
  v4 = sslMalloc(2 * v3 + 16);
  if (!v4)
    return 4294967188;
  v5 = v4;
  if (!ccDRBGGetRngState())
    abort();
  key = ccdh_generate_key();
  if ((_DWORD)key)
    sslFree(v5);
  else
    *a2 = v5;
  return key;
}

uint64_t sslDhExportPub(uint64_t a1, size_t *a2)
{
  size_t v3;
  uint64_t v4;

  ccdh_ctx_public();
  v3 = ccdh_export_pub_size();
  v4 = SSLAllocBuffer(a2, v3);
  if (!(_DWORD)v4)
  {
    ccdh_ctx_public();
    ccdh_export_pub();
  }
  return v4;
}

uint64_t sslDhKeyExchange(uint64_t *a1, uint64_t a2, size_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  if (!ccDRBGGetRngState())
    abort();
  v5 = *a1;
  ccdh_ccn_size();
  MEMORY[0x1E0C80A78]();
  if (v7 >= 0x10)
  {
    v8 = (_QWORD *)((char *)v13 - v6);
    do
    {
      *v8 = 0xAAAAAAAAAAAAAAAALL;
      v8[1] = 0xAAAAAAAAAAAAAAAALL;
      v8 += 2;
      v6 -= 16;
    }
    while (v6);
  }
  if (ccdh_import_pub())
    goto LABEL_10;
  v9 = MEMORY[0x1DF0F4FAC](v5);
  v10 = SSLAllocBuffer(a3, 8 * v9);
  if ((_DWORD)v10)
  {
    v11 = v10;
    goto LABEL_12;
  }
  if (ccdh_compute_shared_secret())
  {
LABEL_10:
    v11 = 4294957496;
LABEL_12:
    __ssl_debug("sslError", "sslDhKeyExchange", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 192, "sslDhKeyExchange: failed to compute key (error %d)\n", v11);
    return v11;
  }
  return 0;
}

uint64_t sslRawSign(_QWORD *a1, uint64_t a2, uint64_t a3, char *a4, size_t a5, size_t *a6)
{
  size_t v7;
  int v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  size_t __len;

  v7 = a5;
  __len = a5;
  v10 = *((_DWORD *)a1 + 4);
  if (v10 == 1)
  {
    v11 = ((uint64_t (*)(_QWORD, uint64_t, uint64_t, char *, size_t *))a1[5])(*a1, a2, a3, a4, &__len);
  }
  else
  {
    if (v10)
    {
      v12 = 4294967246;
      goto LABEL_10;
    }
    v11 = ((uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t, char *, size_t *))a1[4])(*a1, 0, a2, a3, a4, &__len);
  }
  v12 = v11;
  if ((_DWORD)v11)
  {
LABEL_10:
    __ssl_debug("sslError", "sslRawSign", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 336, "privKey->desc.rsa.sign: failed (error %d)\n", v12);
    v7 = __len;
    goto LABEL_11;
  }
  if (*((_DWORD *)a1 + 4) || (v13 = v7 - __len, v7 <= __len))
  {
    v7 = __len;
  }
  else
  {
    memmove(&a4[v13], a4, __len);
    bzero(a4, v13);
    v12 = 0;
  }
LABEL_11:
  *a6 = v7;
  return v12;
}

uint64_t sslEcdsaSign(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v7;
  uint64_t v9;

  v9 = a5;
  v7 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 40))(*(_QWORD *)a1, a2, a3, a4, &v9);
  if ((_DWORD)v7)
    __ssl_debug("sslError", "sslEcdsaSign", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 373, "privKey->desc.ecdsa.sign: failed (error %d)\n", v7);
  *a6 = v9;
  return v7;
}

uint64_t sslRsaEncrypt(uint64_t a1, const void *a2, size_t a3, char *a4, size_t a5, size_t *a6)
{
  uint64_t *v6;
  size_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  size_t v15;
  char *v16;
  size_t v17;
  char *v18;
  unsigned int (**v19)(_QWORD, size_t, char *);
  size_t v20;
  uint64_t result;
  size_t *v22;
  size_t v23;
  size_t **v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)a1 && (v6 = *(uint64_t **)(a1 + 8)) != 0)
  {
    v22 = a6;
    v23 = a5;
    v24 = &v22;
    MEMORY[0x1E0C80A78]();
    v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    if (v12)
      memset((char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v10);
    v13 = *v6;
    v14 = ccn_write_uint_size();
    if (v14 - 11 < a3)
      goto LABEL_22;
    v15 = v14;
    v16 = v11;
    v17 = 8 * v13 - v14;
    if (v17)
    {
      bzero(v11, v17);
      v16 = &v11[v17];
    }
    *(_WORD *)v16 = 512;
    v18 = v16 + 2;
    v19 = (unsigned int (**)(_QWORD, size_t, char *))ccDRBGGetRngState();
    if (!v19)
      abort();
    if ((*v19)(v19, v15 - a3 - 3, v16 + 2))
      goto LABEL_22;
    if ((uint64_t)(v15 - a3 - 3) >= 1)
    {
      do
      {
        if (!*v18)
          *v18 = -1;
        ++v18;
      }
      while (v18 < &v16[v15 - a3 - 1]);
    }
    *v18 = 0;
    memcpy(v18 + 1, a2, a3);
    ccn_swap();
    if (ccrsa_pub_crypt())
    {
LABEL_22:
      __ssl_debug("sslError", "sslRsaEncrypt", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 640, "***sslRsaEncrypt error\n");
      return 4294957487;
    }
    else
    {
      ccn_write_uint_padded();
      v20 = v23;
      if (v23 <= v15)
      {
        v20 = v15;
      }
      else
      {
        memmove(&a4[v23 - v15], a4, v15);
        bzero(a4, v20 - v15);
      }
      result = 0;
      if (v22)
        *v22 = v20;
    }
  }
  else
  {
    __ssl_debug("sslError", "sslRsaEncrypt", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 565, "Internal Error: Invalid RSA public key\n");
    return 4294957486;
  }
  return result;
}

uint64_t sslRsaDecrypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v7;
  uint64_t v9;

  v9 = a5;
  v7 = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t *))(a1 + 40))(*(_QWORD *)a1, a2, a3, a4, &v9);
  *a6 = v9;
  if ((_DWORD)v7)
    __ssl_debug("sslError", "sslRsaDecrypt", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCrypto.c", 662, "sslRsaDecrypt: privKey->desc.rsa->decrypt failed (error %d)\n", v7);
  return v7;
}

uint64_t sslPrivKeyLengthInBytes(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t sslPubKeyLengthInBytes()
{
  return ccn_write_uint_size();
}

void debug_log_chain(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v2;
  __int128 v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  char *v10;
  char v11;
  char v12;
  _OWORD v13[4];
  char v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    v2 = 0;
    do
    {
      v14 = -86;
      *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v13[2] = v3;
      v13[3] = v3;
      v13[0] = v3;
      v13[1] = v3;
      __ssl_debug("sslLogNegotiateDebug", "debug_log_chain", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 147, "cert: %lu", v2);
      __ssl_debug("sslLogNegotiateDebug", "debug_log_chain", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 148, "-----BEGIN CERTIFICATE-----");
      v4 = v1[1];
      if (v4)
      {
        v5 = 0;
        v6 = 0;
        do
        {
          v7 = v1[2];
          v8 = *(unsigned __int8 *)(v7 + v6) << 8;
          if (v6 + 1 < v4)
            v8 |= *(unsigned __int8 *)(v7 + v6 + 1);
          v9 = (v8 << 8);
          if (v6 + 2 < v4)
            v9 = v9 | *(unsigned __int8 *)(v7 + v6 + 2);
          v6 += 3;
          v10 = (char *)v13 + v5;
          *v10 = base64_chars[(unint64_t)v9 >> 18];
          v10[1] = base64_chars[(v9 >> 12) & 0x3F];
          if (v6 <= v1[1] + 1)
            v11 = base64_chars[(v9 >> 6) & 0x3F];
          else
            v11 = 61;
          *((_BYTE *)v13 + v5 + 2) = v11;
          if (v6 <= v1[1])
            v12 = base64_chars[v9 & 0x3F];
          else
            v12 = 61;
          *((_BYTE *)v13 + v5 + 3) = v12;
          v5 += 4;
          if (v5 == 64)
          {
            v14 = 0;
            __ssl_debug("sslLogNegotiateDebug", "debug_log_chain", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 176, "%s", (const char *)v13);
            v5 = 0;
          }
          v4 = v1[1];
        }
        while (v6 < v4);
        if (v5)
        {
          *((_BYTE *)v13 + v5) = 0;
          __ssl_debug("sslLogNegotiateDebug", "debug_log_chain", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 183, "%s", (const char *)v13);
        }
      }
      ++v2;
      __ssl_debug("sslLogNegotiateDebug", "debug_log_chain", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 185, "-----END CERTIFICATE-----");
      v1 = (_QWORD *)*v1;
    }
    while (v1);
  }
}

uint64_t SSLEncodeCertificateStatus(size_t *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  _BYTE *v8;
  void *v9;

  v2 = *(_QWORD *)(a2 + 1048);
  if (!v2)
    return 4294957486;
  v5 = v2 + 4;
  v6 = 12;
  if (!*(_BYTE *)(a2 + 16))
    v6 = 4;
  result = SSLAllocBuffer(a1, v6 + v5);
  if (!(_DWORD)result)
  {
    v8 = (_BYTE *)SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 22, v5);
    *v8 = 1;
    v9 = (void *)SSLEncodeInt((uint64_t)(v8 + 1), *(_QWORD *)(a2 + 1048), 3);
    memcpy(v9, *(const void **)(a2 + 1056), *(_QWORD *)(a2 + 1048));
    return 0;
  }
  return result;
}

uint64_t SSLProcessCertificateStatus(unint64_t a1, _BYTE *a2, uint64_t a3)
{
  unint64_t v7;
  size_t v8;
  size_t *v9;

  if (!a1)
  {
    __ssl_debug("sslError", "SSLProcessCertificateStatus", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 294, "SSLProcessCertificateStatus: message length decode error (1)\n");
    return 4294957496;
  }
  if (*a2 != 1)
    return 0;
  if (a1 <= 2)
  {
    __ssl_debug("sslError", "SSLProcessCertificateStatus", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 305, "SSLProcessCertificateStatus: message length decode error (2)\n");
    return 4294957496;
  }
  v7 = SSLDecodeSize((unint64_t)(a2 + 1), 3);
  if (!v7)
  {
    __ssl_debug("sslError", "SSLProcessCertificateStatus", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 312, "SSLProcessCertificateStatus: message length decode error (3)\n");
    return 4294957496;
  }
  v8 = v7;
  if (v7 + 4 != a1)
  {
    __ssl_debug("sslError", "SSLProcessCertificateStatus", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 317, "SSLProcessCertificateStatus: message length decode error (4)\n");
    return 4294957496;
  }
  *(_BYTE *)(a3 + 1040) = 1;
  v9 = (size_t *)(a3 + 1048);
  SSLFreeBuffer(v9);
  return SSLCopyBufferFromData(a2 + 4, v8, v9);
}

uint64_t SSLProcessCertificateRequest(unint64_t a1, _BYTE *a2, uint64_t a3)
{
  unsigned int v3;
  unint64_t v4;
  unsigned int v6;
  unint64_t v8;
  uint64_t v9;
  void *v12;
  unsigned __int8 *v13;
  unint64_t v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  char *v18;
  uint64_t v19;
  _DWORD *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  unsigned int v23;
  BOOL v24;
  unsigned int v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  size_t v31;
  unint64_t v32;

  v31 = 0xAAAAAAAAAAAAAAAALL;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  if (*(_BYTE *)(a3 + 16))
    v3 = 65279;
  else
    v3 = 770;
  if (*(_DWORD *)a3 <= v3)
    v4 = 3;
  else
    v4 = 5;
  if (a1 < v4)
  {
    __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 408, "SSLProcessCertificateRequest: length decode error 1\n", v31);
    return 4294957496;
  }
  v6 = *a2;
  if (!*a2 || (v8 = v4 + v6, a1 < v8))
  {
    __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 414, "SSLProcessCertificateRequest: length decode error 2\n", v31);
    return 4294957496;
  }
  sslFree(*(void **)(a3 + 776));
  *(_DWORD *)(a3 + 772) = v6;
  v12 = sslMalloc(4 * v6);
  *(_QWORD *)(a3 + 776) = v12;
  if (!v12)
    return 4294957486;
  v13 = a2 + 1;
  if (*(_DWORD *)(a3 + 772))
  {
    v14 = 0;
    do
    {
      *(_DWORD *)(*(_QWORD *)(a3 + 776) + 4 * v14) = v13[v14];
      ++v14;
    }
    while (v14 < *(unsigned int *)(a3 + 772));
    v13 += v14;
  }
  if (*(_BYTE *)(a3 + 16))
    v15 = 65279;
  else
    v15 = 770;
  if (*(_DWORD *)a3 <= v15)
  {
    v17 = 0;
    goto LABEL_33;
  }
  v16 = SSLDecodeInt(v13, 2);
  if (v16 < 2 || (v17 = v16, a1 < v16 + v8))
  {
    __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 436, "SSLProcessCertificateRequest: length decode error 3\n", v31);
    return 4294957496;
  }
  if ((v16 & 1) != 0)
  {
    __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 441, "SSLProcessCertificateRequest: signAlg len odd\n", v31);
    return 4294957496;
  }
  sslFree(*(void **)(a3 + 792));
  *(_DWORD *)(a3 + 788) = v17 >> 1;
  v18 = (char *)sslMalloc(8 * (v17 >> 1));
  *(_QWORD *)(a3 + 792) = v18;
  if (!v18)
    return 4294957486;
  v19 = *(unsigned int *)(a3 + 788);
  v13 += 2;
  if ((_DWORD)v19)
  {
    v20 = v18 + 4;
    do
    {
      *(v20 - 1) = *v13;
      *v20 = v13[1];
      v20 += 2;
      v13 += 2;
      --v19;
    }
    while (v19);
  }
LABEL_33:
  tls_free_buffer_list(*(_QWORD **)(a3 + 384));
  *(_QWORD *)(a3 + 384) = 0;
  v21 = SSLDecodeInt(v13, 2);
  if (a1 != v17 + (_DWORD)v8 + (_DWORD)v21)
  {
    __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 468, "SSLProcessCertificateRequest: length decode error 3\n", v31);
    return 4294957496;
  }
  v9 = v21;
  v22 = v13 + 2;
  if ((_DWORD)v21)
  {
    while (1)
    {
      if ((_DWORD)v9 == 1)
      {
        __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 473, "SSLProcessCertificateRequest: dnListLen error 1\n", v31);
        return 4294957496;
      }
      v23 = SSLDecodeInt(v22, 2);
      v24 = v9 >= v23 + 2;
      v9 = v9 - (v23 + 2);
      if (!v24)
      {
        __ssl_debug("sslError", "SSLProcessCertificateRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 479, "SSLProcessCertificateRequest: dnListLen error 2\n", v31);
        return 4294957496;
      }
      v25 = v23;
      v26 = SSLAllocBuffer(&v31, 0x18uLL);
      if ((_DWORD)v26)
        return v26;
      v27 = v32;
      v28 = SSLAllocBuffer((size_t *)(v32 + 8), v25);
      if ((_DWORD)v28)
        break;
      v29 = (char *)(v22 + 2);
      memcpy(*(void **)(v27 + 16), v29, v25);
      v22 = (unsigned __int8 *)&v29[v25];
      *(_QWORD *)v27 = *(_QWORD *)(a3 + 384);
      *(_QWORD *)(a3 + 384) = v27;
      if (!(_DWORD)v9)
        return v9;
    }
    v30 = v28;
    SSLFreeBuffer(&v31);
    return v30;
  }
  return v9;
}

uint64_t SSLEncodeCertificateVerify(size_t *a1, uint64_t a2)
{
  __int128 v4;
  uint64_t MaxSigSize;
  int v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  size_t v12;
  size_t v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  size_t v26;
  unint64_t v27;
  size_t v29;
  size_t v30;
  uint64_t v31[2];
  _OWORD v32[4];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v32[2] = v4;
  v32[3] = v4;
  v32[0] = v4;
  v32[1] = v4;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  a1[1] = 0;
  v31[0] = 64;
  v31[1] = (uint64_t)v32;
  MaxSigSize = sslGetMaxSigSize(*(_QWORD *)(a2 + 32), &v29);
  if (!(_DWORD)MaxSigSize)
  {
    v6 = *(_DWORD *)(*(_QWORD *)(a2 + 32) + 16);
    if (v6 == 1)
    {
      v7 = *(_DWORD *)a2;
      if (*(_DWORD *)a2 < 0x301u)
        return 4294957486;
      v8 = 0;
      v9 = 3;
    }
    else
    {
      if (v6)
        return 4294957486;
      v7 = *(_DWORD *)a2;
      v8 = 1;
      v9 = 1;
    }
    v10 = *(_BYTE *)(a2 + 16) == 0;
    if (*(_BYTE *)(a2 + 16))
      v11 = 12;
    else
      v11 = 4;
    v12 = v11 + v29;
    v13 = v11 + v29 + 2;
    v30 = v13;
    if (v10)
      v14 = 770;
    else
      v14 = 65279;
    if (v7 <= v14)
    {
      v18 = 0;
    }
    else
    {
      if (!*(_DWORD *)(a2 + 788))
        return 4294957486;
      v15 = *(unsigned int *)(a2 + 800);
      if (!(_DWORD)v15)
        return 4294957486;
      v16 = 0;
      v17 = *(_QWORD *)(a2 + 808);
      while ((_DWORD)v9 != *(_DWORD *)(v17 + 8 * v16 + 4))
      {
LABEL_22:
        ++v16;
        MaxSigSize = 4294957496;
        if (v16 == v15)
          return MaxSigSize;
      }
      v18 = *(unsigned int *)(v17 + 8 * v16);
      v19 = *(_QWORD *)(a2 + 792) + 4;
      v20 = *(unsigned int *)(a2 + 788);
      while (__PAIR64__(v9, v18) != *(_QWORD *)(v19 - 4))
      {
        v19 += 8;
        if (!--v20)
          goto LABEL_22;
      }
      v13 = v12 + 4;
      v30 = v12 + 4;
      *(_QWORD *)(a2 + 816) = v18 | (v9 << 32);
    }
    MaxSigSize = (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(a2 + 24) + 24))(a2, v31, v18);
    if (!(_DWORD)MaxSigSize)
    {
      MaxSigSize = SSLAllocBuffer(a1, v13);
      if (!(_DWORD)MaxSigSize)
      {
        v21 = (_BYTE *)(a1[1] + v11);
        if (*(_BYTE *)(a2 + 16))
          v22 = 65279;
        else
          v22 = 770;
        if (*(_DWORD *)a2 <= v22)
        {
          MaxSigSize = sslRawSign(*(_QWORD **)(a2 + 32), (uint64_t)v32, v31[0], v21 + 2, v29, &v30);
          v25 = v30;
          v26 = v30;
LABEL_38:
          if ((_DWORD)MaxSigSize)
          {
            __ssl_debug("sslError", "SSLEncodeCertificateVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 643, "SSLEncodeCertificateVerify: unable to sign data (error %d)\n", MaxSigSize);
          }
          else
          {
            v27 = v26 + 2;
            *a1 = v26 + 2 + v11;
            SSLEncodeInt((uint64_t)v21, v25, 2);
            SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 15, v27);
          }
          return MaxSigSize;
        }
        *v21 = v18;
        v21[1] = v9;
        if (v18 <= 6 && ((1 << v18) & 0x74) != 0)
        {
          v23 = *(_QWORD *)(a2 + 32);
          if (v8)
            v24 = sslRsaSign(v23, v18, (uint64_t)v32, v31[0], v21 + 4, v29, &v30);
          else
            v24 = sslEcdsaSign(v23, (uint64_t)v32, v31[0], (uint64_t)(v21 + 4), v29, &v30);
          MaxSigSize = v24;
          v25 = v30;
          v26 = v30 + 2;
          v21 += 2;
          goto LABEL_38;
        }
        __ssl_debug("sslError", "SSLEncodeCertificateVerify", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslCert.c", 610, "SSLEncodeCertificateVerify: unsupported signature hash algorithm (%d)\n", v18);
        return 4294957486;
      }
    }
  }
  return MaxSigSize;
}

uint64_t tls_metric_insecure_dh_param()
{
  uint64_t result;
  uint64_t (*v1)(const char *, _QWORD *);
  _QWORD v2[5];
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  result = arc4random_uniform(0x64u);
  if (result <= 9)
  {
    if (process_identifier___csops_once != -1)
      dispatch_once(&process_identifier___csops_once, &__block_literal_global);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 0x40000000;
    v2[2] = __tls_metric_insecure_dh_param_block_invoke;
    v2[3] = &__block_descriptor_tmp;
    v2[4] = process_identifier_data;
    v4 = 0;
    v5 = &v4;
    v6 = 0x2000000000;
    v1 = (uint64_t (*)(const char *, _QWORD *))getanalytics_send_event_lazySymbolLoc_ptr;
    v7 = getanalytics_send_event_lazySymbolLoc_ptr;
    if (!getanalytics_send_event_lazySymbolLoc_ptr)
    {
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 0x40000000;
      v3[2] = __getanalytics_send_event_lazySymbolLoc_block_invoke;
      v3[3] = &unk_1EA97E7D0;
      v3[4] = &v4;
      __getanalytics_send_event_lazySymbolLoc_block_invoke((uint64_t)v3);
      v1 = (uint64_t (*)(const char *, _QWORD *))v5[3];
    }
    _Block_object_dispose(&v4, 8);
    if (!v1)
      tls_metric_insecure_dh_param_cold_1();
    return v1("com.apple.coretls.insecureDHParams", v2);
  }
  return result;
}

xpc_object_t __tls_metric_insecure_dh_param_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "Client", *(const char **)(a1 + 32));
  return v2;
}

void *__getanalytics_send_event_lazySymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
  }
  else
  {
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)CoreAnalyticsLibraryCore_frameworkLibrary;
    if (!CoreAnalyticsLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "analytics_send_event_lazy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getanalytics_send_event_lazySymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SSLGenServerDHParamsAndKey(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 96);
  if (!v2)
    v2 = ccdh_gp_rfc5114_MODP_2048_256();
  return sslDhCreateKey(v2, (_QWORD *)(a1 + 104));
}

uint64_t SSLEncodedDHKeyParamsLen(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = **(_QWORD **)(a1 + 104);
  MEMORY[0x1DF0F4FAC](v1);
  MEMORY[0x1DF0F4FB8](v1);
  v2 = ccn_write_uint_size();
  ccdh_gp_g();
  v3 = ccn_write_uint_size();
  ccdh_ctx_public();
  return v2 + v3 + ccdh_export_pub_size() + 6;
}

uint64_t SSLEncodeDHKeyParams(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = **(_QWORD **)(a1 + 104);
  MEMORY[0x1DF0F4FAC](v3);
  MEMORY[0x1DF0F4FB8](v3);
  v4 = ccn_write_uint_size();
  ccdh_gp_g();
  v5 = ccn_write_uint_size();
  ccdh_ctx_public();
  v6 = ccdh_export_pub_size();
  v7 = SSLEncodeInt(a2, v4, 2);
  MEMORY[0x1DF0F4FB8](v3);
  ccn_write_uint();
  v8 = SSLEncodeInt(v7 + v4, v5, 2);
  ccdh_gp_g();
  ccn_write_uint();
  SSLEncodeInt(v8 + v5, v6, 2);
  ccdh_ctx_public();
  return ccdh_export_pub();
}

uint64_t SSLDecodeDHKeyParams(uint64_t a1, unsigned __int8 **a2, uint64_t a3)
{
  unint64_t v5;
  size_t *v6;
  unsigned int v7;
  uint64_t v8;
  unsigned __int8 *v9;
  unsigned int v10;
  uint64_t v11;
  unsigned __int8 *v12;
  uint64_t result;
  unsigned int v14;
  size_t v15;
  _QWORD v16[2];
  _QWORD v17[2];

  v5 = (unint64_t)&(*a2)[a3];
  v6 = (size_t *)(a1 + 80);
  SSLFreeBuffer((_QWORD *)(a1 + 80));
  if ((unint64_t)(*a2 + 2) > v5)
    return 4294957496;
  v7 = SSLDecodeInt(*a2, 2);
  v8 = (uint64_t)(*a2 + 2);
  *a2 = (unsigned __int8 *)v8;
  v9 = (unsigned __int8 *)(v8 + v7);
  if ((unint64_t)v9 > v5)
    return 4294957496;
  v17[0] = v7;
  v17[1] = v8;
  *a2 = v9;
  if ((unint64_t)(v9 + 2) > v5)
    return 4294957496;
  v10 = SSLDecodeInt(v9, 2);
  v11 = (uint64_t)(*a2 + 2);
  *a2 = (unsigned __int8 *)v11;
  v12 = (unsigned __int8 *)(v11 + v10);
  if ((unint64_t)v12 > v5)
    return 4294957496;
  v16[0] = v10;
  v16[1] = v11;
  *a2 = v12;
  sslFree(*(void **)(a1 + 96));
  result = sslEncodeDhParams(a1, (_QWORD *)(a1 + 96), (uint64_t)v17, (uint64_t)v16);
  if (!(_DWORD)result)
  {
    if ((unint64_t)(*a2 + 2) > v5)
      return 4294957496;
    v14 = SSLDecodeInt(*a2, 2);
    *a2 += 2;
    v15 = v14;
    result = SSLAllocBuffer(v6, v14);
    if (!(_DWORD)result)
    {
      memmove(*(void **)(a1 + 88), *a2, v15);
      result = 0;
      *a2 += v15;
    }
  }
  return result;
}

uint64_t SSLProcessAlert(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  unsigned int v14;

  if ((a1 & 1) != 0)
  {
    v14 = SSLFatalSessionAlert(47, a3);
    if (v14)
      return v14;
    else
      return 4294957496;
  }
  if (!a1)
    return 0;
  v5 = 0;
  v6 = 0;
  v7 = a1 - 2;
  while (1)
  {
    v8 = v7;
    v9 = *a2;
    v10 = a2[1];
    if (v9 == 2)
    {
      __ssl_debug("sslError", "SSLProcessAlert", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslAlertMessage.c", 112, "***Fatal alert %d received\n", a2[1]);
      v6 = 1;
    }
    v11 = *(unsigned __int8 *)(a3 + 17);
    if (!*(_BYTE *)(a3 + 17) && *(_DWORD *)(a3 + 428) == 2 && ((v10 - 42) < 5 || v10 == 48))
      *(_DWORD *)(a3 + 428) = 3;
    if (v10 > 69)
      break;
    v12 = v10 - 20;
    v13 = 4294957471;
    switch(v12)
    {
      case 0:
        v13 = 4294957476;
        goto LABEL_61;
      case 1:
        v13 = 4294957475;
        goto LABEL_61;
      case 2:
        v13 = 4294957474;
        goto LABEL_61;
      case 10:
        v13 = 4294957473;
        goto LABEL_61;
      case 20:
        v13 = 4294957472;
        goto LABEL_61;
      case 21:
        if (v11)
        {
          v13 = v5;
          if (*(_DWORD *)(a3 + 380) == 10)
          {
            v13 = SSLAdvanceHandshake(11, a3);
            if ((_DWORD)v13)
              return v13;
          }
          goto LABEL_56;
        }
        v13 = v5;
        if ((v6 & 1) != 0)
        {
LABEL_60:
          if ((v6 & 1) != 0)
            goto LABEL_61;
          return v13;
        }
        break;
      case 22:
        goto LABEL_56;
      case 23:
        v13 = 4294957470;
        if ((v6 & 1) != 0)
          goto LABEL_60;
        break;
      case 24:
        v13 = 4294957469;
        if ((v6 & 1) != 0)
          goto LABEL_60;
        break;
      case 25:
        v13 = 4294957468;
        if ((v6 & 1) != 0)
          goto LABEL_60;
        break;
      case 26:
        v13 = 4294957467;
        if ((v6 & 1) != 0)
          goto LABEL_60;
        break;
      case 27:
        v13 = 4294957466;
        goto LABEL_61;
      case 28:
        v13 = 4294957465;
        if ((v6 & 1) != 0)
          goto LABEL_60;
        break;
      case 29:
        v13 = 4294957464;
        if ((v6 & 1) != 0)
          goto LABEL_60;
        break;
      case 30:
        v13 = 4294957463;
        if ((v6 & 1) != 0)
          goto LABEL_60;
        break;
      case 31:
        v13 = 4294957462;
        if ((v6 & 1) != 0)
          goto LABEL_60;
        break;
      case 40:
        v13 = 4294957461;
        if ((v6 & 1) != 0)
          goto LABEL_60;
        break;
      default:
        goto LABEL_53;
    }
LABEL_57:
    v7 = v8 - 2;
    a2 += 2;
    v5 = v13;
    if (!v8)
      goto LABEL_60;
  }
  if (v10 <= 89)
  {
    switch(v10)
    {
      case 'F':
        v13 = 4294957460;
        if ((v6 & 1) != 0)
          goto LABEL_60;
        goto LABEL_57;
      case 'G':
        v13 = 4294957459;
        if ((v6 & 1) != 0)
          goto LABEL_60;
        goto LABEL_57;
      case 'P':
        v13 = 4294957458;
        if ((v6 & 1) != 0)
          goto LABEL_60;
        goto LABEL_57;
    }
    goto LABEL_53;
  }
  if (v10 == 90)
  {
    v13 = 4294957457;
    if ((v6 & 1) != 0)
      goto LABEL_60;
    goto LABEL_57;
  }
  if (v10 == 100)
  {
    v13 = 4294957456;
    if ((v6 & 1) != 0)
      goto LABEL_60;
    goto LABEL_57;
  }
  if (v10 != 110)
  {
LABEL_53:
    if (v9 == 2)
      v13 = 4294957494;
    else
      v13 = 0;
LABEL_56:
    if ((v6 & 1) != 0)
      goto LABEL_60;
    goto LABEL_57;
  }
  v13 = 4294957494;
LABEL_61:
  SSLDeleteSessionData((_QWORD *)a3);
  return v13;
}

uint64_t SSLFatalSessionAlert(int a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t result;

  v3 = a1;
  *(_DWORD *)(a2 + 380) = 4;
  if (*(_DWORD *)a2 > 0x300u)
    goto LABEL_5;
  v4 = (a1 - 48);
  if (v4 <= 0x34)
  {
    if (((1 << (a1 - 48)) & 0x10040000C0000ELL) != 0)
    {
LABEL_4:
      v3 = 40;
      goto LABEL_5;
    }
    if (a1 == 48)
    {
      v3 = 43;
      goto LABEL_5;
    }
    if (v4 == 32)
    {
      v3 = 0;
      goto LABEL_5;
    }
  }
  if (a1 == 22)
    goto LABEL_4;
LABEL_5:
  v5 = SSLDeleteSessionData((_QWORD *)a2);
  LODWORD(result) = SSLSendAlert(2, v3, a2);
  *(_BYTE *)(a2 + 704) = 1;
  if (v5)
    return v5;
  else
    return result;
}

uint64_t SSLProcessSSL2Message(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unint64_t v3;
  __int16 v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v3 = a1 - 3;
  if (a1 < 3)
    return 4294967246;
  v7 = SSLDecodeInt(a2, 2);
  if ((v7 & 0x8000) == 0)
    return 4294967246;
  if (a1 != (v7 & 0x7FFF) + 2 || a2[2] != 1)
    return 4294967246;
  v9 = SSLProcessSSL2ClientHello(v3, a2 + 3, a3);
  if ((_DWORD)v9)
    return v9;
  v13[0] = a1 - 2;
  v13[1] = a2 + 2;
  v10 = SSLUpdateHandshakeMacs((uint64_t)v13, a3);
  if (!(_DWORD)v10)
    return SSLAdvanceHandshake(1, a3);
  v11 = v10;
  SSLFatalSessionAlert(80, a3);
  return v11;
}

uint64_t DTLSRetransmit(uint64_t a1)
{
  uint64_t result;

  if (!*(_BYTE *)(a1 + 672))
    return SSLSendFlight(a1);
  result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 1112) + 80))(*(_QWORD *)(a1 + 1104));
  if (!(_DWORD)result)
    return SSLSendFlight(a1);
  return result;
}

uint64_t SSLResumeServerSide(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  char *v7;
  _QWORD **v8;
  _QWORD *v9;
  _QWORD *i;
  uint64_t v11;
  char *v12;
  _QWORD *v13;
  _QWORD *j;
  char *v15;
  _QWORD *k;
  __int128 v17;

  v17 = 0uLL;
  v2 = SSLEncodeServerHello((size_t *)&v17, (unsigned int *)a1);
  if ((_DWORD)v2)
  {
LABEL_2:
    v3 = v2;
    v4 = 0;
LABEL_5:
    SSLFatalSessionAlert(v4, a1);
LABEL_6:
    SSLFreeBuffer(&v17);
    return v3;
  }
  v5 = SSLUpdateHandshakeMacs((uint64_t)&v17, a1);
  if ((_DWORD)v5)
  {
LABEL_4:
    v3 = v5;
    v4 = 80;
    goto LABEL_5;
  }
  ++*(_WORD *)(a1 + 202);
  v7 = (char *)sslMalloc(0x20uLL);
  if (!v7)
    goto LABEL_23;
  *(_QWORD *)v7 = 0;
  *(_OWORD *)(v7 + 8) = v17;
  v7[24] = 22;
  v8 = (_QWORD **)(a1 + 664);
  v9 = *(_QWORD **)(a1 + 664);
  for (i = (_QWORD *)(a1 + 664); v9; v9 = (_QWORD *)*v9)
    i = v9;
  *i = v7;
  v11 = SSLInitPendingCiphers(a1);
  if ((_DWORD)v11)
  {
    v3 = v11;
    SSLFatalSessionAlert(80, a1);
    return v3;
  }
  v17 = 0uLL;
  v2 = SSLEncodeChangeCipherSpec((uint64_t)&v17, a1);
  if ((_DWORD)v2)
    goto LABEL_2;
  v12 = (char *)sslMalloc(0x20uLL);
  if (!v12)
    goto LABEL_23;
  *(_QWORD *)v12 = 0;
  *(_OWORD *)(v12 + 8) = v17;
  v12[24] = 20;
  v13 = *v8;
  for (j = (_QWORD *)(a1 + 664); v13; v13 = (_QWORD *)*v13)
    j = v13;
  *j = v12;
  v17 = 0uLL;
  v2 = SSLEncodeFinishedMessage((size_t *)&v17, a1);
  if ((_DWORD)v2)
    goto LABEL_2;
  v5 = SSLUpdateHandshakeMacs((uint64_t)&v17, a1);
  if ((_DWORD)v5)
    goto LABEL_4;
  ++*(_WORD *)(a1 + 202);
  v15 = (char *)sslMalloc(0x20uLL);
  if (!v15)
  {
LABEL_23:
    v3 = 4294957486;
    goto LABEL_6;
  }
  *(_QWORD *)v15 = 0;
  *(_OWORD *)(v15 + 8) = v17;
  v15[24] = 22;
  for (k = *v8; k; k = (_QWORD *)*k)
    v8 = (_QWORD **)k;
  v3 = 0;
  *v8 = v15;
  *(_DWORD *)(a1 + 380) = 14;
  return v3;
}

uint64_t SSLEncodeNPNEncryptedExtensionMessage(size_t *a1, uint64_t a2)
{
  int v4;
  int v5;
  unint64_t v6;
  int v7;
  uint64_t result;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  if (!*(_QWORD *)(a2 + 944))
    return 4294957448;
  v4 = *(_DWORD *)(a2 + 936);
  v5 = ((_BYTE)v4 + 2) & 0x1F;
  v6 = (v4 - v5 + 34);
  if (*(_BYTE *)(a2 + 16))
    v7 = 12;
  else
    v7 = 4;
  result = SSLAllocBuffer(a1, (v6 + v7));
  if (!(_DWORD)result)
  {
    v9 = (32 - v5);
    v10 = SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 67, v6);
    v11 = (void *)SSLEncodeInt(v10, *(_QWORD *)(a2 + 936), 1);
    memcpy(v11, *(const void **)(a2 + 944), *(_QWORD *)(a2 + 936));
    v12 = (void *)SSLEncodeInt((uint64_t)v11 + *(_QWORD *)(a2 + 936), v9, 1);
    bzero(v12, v9);
    result = 0;
    *(_BYTE *)(a2 + 931) = 1;
  }
  return result;
}

uint64_t SSLProcessEncryptedExtension(size_t size, const void *a2, uint64_t a3)
{
  uint64_t result;

  if (!*(_BYTE *)(a3 + 930))
    return 4294957496;
  *(_BYTE *)(a3 + 932) = 1;
  result = SSLAllocBuffer((size_t *)(a3 + 952), size);
  if (!(_DWORD)result)
  {
    memcpy(*(void **)(a3 + 960), a2, *(_QWORD *)(a3 + 952));
    return 0;
  }
  return result;
}

uint64_t tls1GenerateMasterSecret(uint64_t a1)
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  size_t *v5;
  __int128 v6;
  __int128 v7;
  uint64_t v9;
  size_t v10[2];
  size_t v11[2];
  _OWORD v12[2];
  int v13;
  _OWORD v14[4];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v11[0] = 0xAAAAAAAAAAAAAAAALL;
  v10[0] = 0xAAAAAAAAAAAAAAAALL;
  v13 = -1431655766;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[0] = v2;
  v12[1] = v2;
  if (*(_BYTE *)(a1 + 768) && *(_BYTE *)(a1 + 769))
  {
    v11[1] = 0;
    v10[1] = 0;
    v3 = CloneHashState((uint64_t)&SSLHashSHA1, a1 + 568, v11);
    if (!(_DWORD)v3)
    {
      v4 = CloneHashState((uint64_t)&SSLHashMD5, a1 + 584, v10);
      if ((_DWORD)v4)
      {
        v3 = v4;
        v5 = v11;
      }
      else
      {
        *(_QWORD *)&v14[0] = 16;
        *((_QWORD *)&v14[0] + 1) = v12;
        v9 = HashMD5Final((uint64_t)v10, v14);
        if (!(_DWORD)v9)
        {
          *(_QWORD *)&v14[0] = 20;
          *((_QWORD *)&v14[0] + 1) += 16;
          v9 = HashSHA1Final((uint64_t)v11, v14);
          if (!(_DWORD)v9)
            v9 = tls_handshake_internal_prf(a1, *(_QWORD *)(a1 + 512), *(_QWORD *)(a1 + 504), "extended master secret", 0x16uLL, v12, 0x24uLL, (char *)(a1 + 520), 0x30uLL);
        }
        v3 = v9;
        SSLFreeBuffer(v11);
        v5 = v10;
      }
      SSLFreeBuffer(v5);
    }
  }
  else
  {
    v6 = *(_OWORD *)(a1 + 452);
    v14[0] = *(_OWORD *)(a1 + 436);
    v14[1] = v6;
    v7 = *(_OWORD *)(a1 + 484);
    v14[2] = *(_OWORD *)(a1 + 468);
    v14[3] = v7;
    return tls_handshake_internal_prf(a1, *(_QWORD *)(a1 + 512), *(_QWORD *)(a1 + 504), "master secret", 0xDuLL, v14, 0x40uLL, (char *)(a1 + 520), 0x30uLL);
  }
  return v3;
}

uint64_t tls1ComputeFinishedMac(uint64_t a1, size_t a2, char *a3, int a4)
{
  __int128 v8;
  uint64_t v9;
  const char *v11;
  size_t v12[2];
  size_t v13[2];
  unint64_t v14;
  _OWORD *v15;
  _OWORD v16[2];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17 = -1431655766;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v16[0] = v8;
  v16[1] = v8;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v15 = (_OWORD *)0xAAAAAAAAAAAAAAAALL;
  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0;
  v12[0] = 0xAAAAAAAAAAAAAAAALL;
  v12[1] = 0;
  v9 = CloneHashState((uint64_t)&SSLHashSHA1, a1 + 568, v13);
  if ((_DWORD)v9)
    goto LABEL_3;
  v9 = CloneHashState((uint64_t)&SSLHashMD5, a1 + 584, v12);
  if ((_DWORD)v9)
    goto LABEL_3;
  if (a4)
    v11 = "server finished";
  else
    v11 = "client finished";
  v14 = 16;
  v15 = v16;
  v9 = HashMD5Final((uint64_t)v12, &v14);
  if (!(_DWORD)v9)
  {
    v14 = 20;
    ++v15;
    v9 = HashSHA1Final((uint64_t)v13, &v14);
    if (!(_DWORD)v9)
    {
      v9 = tls_handshake_internal_prf(a1, a1 + 520, 0x30uLL, v11, 0xFuLL, v16, 0x24uLL, a3, a2);
LABEL_3:
      SSLFreeBuffer(v13);
      SSLFreeBuffer(v12);
    }
  }
  return v9;
}

uint64_t tls1ComputeCertVfyMac(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  size_t v8[2];
  size_t v9[2];
  unint64_t v10;
  unint64_t v11;

  v10 = 0xAAAAAAAAAAAAAAAALL;
  v11 = 0xAAAAAAAAAAAAAAAALL;
  v9[0] = 0xAAAAAAAAAAAAAAAALL;
  v9[1] = 0;
  v8[0] = 0xAAAAAAAAAAAAAAAALL;
  v8[1] = 0;
  v4 = CloneHashState((uint64_t)&SSLHashSHA1, a1 + 568, v9);
  if (!(_DWORD)v4)
  {
    v4 = CloneHashState((uint64_t)&SSLHashMD5, a1 + 584, v8);
    if (!(_DWORD)v4)
    {
      v5 = a2[1];
      if (*(_DWORD *)(a1 + 784) == 64)
      {
        v6 = 20;
LABEL_7:
        *a2 = v6;
        v10 = 20;
        v11 = v5;
        v4 = HashSHA1Final((uint64_t)v9, &v10);
        goto LABEL_8;
      }
      v10 = 16;
      v11 = v5;
      v4 = HashMD5Final((uint64_t)v8, &v10);
      if (!(_DWORD)v4)
      {
        v5 = a2[1] + 16;
        v6 = 36;
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  SSLFreeBuffer(v9);
  SSLFreeBuffer(v8);
  return v4;
}

uint64_t SSLEncodeServerHelloRequest(size_t *a1, uint64_t a2)
{
  size_t v4;
  uint64_t v5;

  if (*(_BYTE *)(a2 + 16))
    v4 = 12;
  else
    v4 = 4;
  v5 = SSLAllocBuffer(a1, v4);
  if (!(_DWORD)v5)
    SSLEncodeHandshakeHeader(a2, (uint64_t)a1, 0, 0);
  return v5;
}

uint64_t SSLEncodeServerHelloVerifyRequest(size_t *a1, unsigned int *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  _BYTE *v8;
  _BYTE *v9;

  v4 = *((_QWORD *)a2 + 23) + 3;
  v5 = 12;
  if (!*((_BYTE *)a2 + 16))
    v5 = 4;
  result = SSLAllocBuffer(a1, v5 + v4);
  if (!(_DWORD)result)
  {
    v7 = SSLEncodeHandshakeHeader((uint64_t)a2, (uint64_t)a1, 3, v4);
    v8 = (_BYTE *)SSLEncodeInt(v7, *a2, 2);
    *v8 = *((_QWORD *)a2 + 23);
    v9 = v8 + 1;
    memcpy(v8 + 1, *((const void **)a2 + 24), *((_QWORD *)a2 + 23));
    if (&v9[*((_QWORD *)a2 + 23)] == (_BYTE *)(a1[1] + *a1))
      return 0;
    else
      return 4294957486;
  }
  return result;
}

uint64_t SSLProcessServerHelloVerifyRequest(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  size_t v6;
  uint64_t result;

  if (a1 <= 2)
  {
    __ssl_debug("sslError", "SSLProcessServerHelloVerifyRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 344, "SSLProcessServerHelloVerifyRequest: msg len error\n");
    return 4294957496;
  }
  if (SSLDecodeInt(a2, 2) != 65279)
  {
    __ssl_debug("sslError", "SSLProcessServerHelloVerifyRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 354, "SSLProcessServerHelloVerifyRequest: protocol version error\n");
    return 4294957496;
  }
  v6 = a2[2];
  if (a1 < v6 + 3)
  {
    __ssl_debug("sslError", "SSLProcessServerHelloVerifyRequest", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/sslHandshakeHello.c", 362, "SSLProcessServerHelloVerifyRequest: msg len error 2\n");
    return 4294957496;
  }
  result = SSLAllocBuffer((size_t *)(a3 + 184), a2[2]);
  if (!(_DWORD)result)
  {
    memcpy(*(void **)(a3 + 192), a2 + 3, v6);
    return 0;
  }
  return result;
}

uint64_t SSLProcessSSL2ClientHello(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  unsigned __int16 v6;
  unsigned __int16 v7;
  __int16 v8;
  unsigned __int16 v9;
  unsigned __int16 v10;
  int v11;
  uint64_t result;
  int v13;
  uint64_t v14;
  unsigned int v15;
  int v17;
  unsigned int v18;
  unsigned int v19;
  uint64_t (**v20)();
  unsigned __int8 *v21;
  int v22;
  uint64_t v23;
  unsigned __int8 *v24;
  int v25;
  void *v26;
  int v27;
  int v28;
  unsigned __int8 *v29;
  unsigned __int8 *v30;
  __int128 v31;

  if (a1 < 8)
    return 4294967246;
  v6 = SSLDecodeInt(a2, 2);
  v7 = SSLDecodeInt(a2 + 2, 2);
  v8 = SSLDecodeInt(a2 + 4, 2);
  v9 = SSLDecodeInt(a2 + 6, 2);
  if (v8)
    return 4294967246;
  v10 = v9;
  v11 = v9;
  result = 4294967246;
  if (v11 == 32)
  {
    v13 = v7;
    v14 = v7 + v10 + 8;
    v15 = v7 / 3u;
    if (!(v7 % 3u) && a1 == v14)
    {
      v17 = v6;
      *(_DWORD *)(a3 + 4) = v6;
      v18 = *(_DWORD *)(a3 + 8);
      if (*(_BYTE *)(a3 + 16))
      {
        if (v18 < v6)
          return 4294957495;
        v19 = *(_DWORD *)(a3 + 12);
        if (v19 <= v6)
        {
LABEL_16:
          result = 4294957495;
          if (v17 > 770)
          {
            if (v17 == 771)
            {
              v20 = Tls12Callouts;
LABEL_25:
              *(_QWORD *)(a3 + 24) = v20;
              *(_DWORD *)a3 = v17;
              result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a3 + 1112) + 96))(*(_QWORD *)(a3 + 1104));
              if (!(_DWORD)result)
              {
                v21 = a2 + 8;
                *(_DWORD *)(a3 + 376) = 0;
                if (v7 >= 3u)
                {
                  v22 = 0;
                  if (v15 <= 1)
                    v23 = 1;
                  else
                    v23 = v15;
                  v24 = a2 + 8;
                  do
                  {
                    v25 = *v24;
                    v24 += 3;
                    if (!v25)
                      *(_DWORD *)(a3 + 376) = ++v22;
                    --v23;
                  }
                  while (v23);
                }
                sslFree(*(void **)(a3 + 368));
                v26 = sslMalloc(2 * *(unsigned int *)(a3 + 376));
                *(_QWORD *)(a3 + 368) = v26;
                if (v26)
                {
                  if (v7 >= 3u)
                  {
                    v27 = 0;
                    if (v15 <= 1)
                      v28 = 1;
                    else
                      v28 = v15;
                    v29 = a2 + 9;
                    do
                    {
                      if (!*(v29 - 1))
                        *(_WORD *)(*(_QWORD *)(a3 + 368) + 2 * v27++) = SSLDecodeInt(v29, 2);
                      v29 += 3;
                      --v28;
                    }
                    while (v28);
                  }
                  v30 = &v21[v13];
                  v31 = *((_OWORD *)v30 + 1);
                  *(_OWORD *)(a3 + 436) = *(_OWORD *)v30;
                  *(_OWORD *)(a3 + 452) = v31;
                  return SSLInitMessageHashes((size_t *)a3);
                }
                else
                {
                  return 4294967188;
                }
              }
              return result;
            }
            if (v17 != 65279)
              return result;
          }
          else if ((v17 - 769) >= 2)
          {
            if (v17 != 768)
              return result;
            v20 = Ssl3Callouts;
            goto LABEL_25;
          }
          v20 = Tls1Callouts;
          goto LABEL_25;
        }
      }
      else
      {
        if (v18 > v6)
          return 4294957495;
        v19 = *(_DWORD *)(a3 + 12);
        if (v19 >= v6)
          goto LABEL_16;
      }
      v17 = v19;
      if (*(_BYTE *)(a3 + 17))
        goto LABEL_16;
      return 4294957495;
    }
  }
  return result;
}

uint64_t SSLProcessNewSessionTicket(unint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  size_t v3;
  int v6;
  size_t *v7;

  v3 = a1 - 6;
  if (a1 < 6)
    return 4294957496;
  v6 = SSLDecodeInt(a2, 4);
  if (v3 != (unsigned __int16)SSLDecodeInt(a2 + 4, 2))
    return 4294957496;
  *(_DWORD *)(a3 + 728) = v6;
  v7 = (size_t *)(a3 + 712);
  SSLFreeBuffer(v7);
  return SSLCopyBufferFromData(a2 + 6, v3, v7);
}

uint64_t ssl3GenerateKeyMaterial(unint64_t a1, char *a2, uint64_t a3)
{
  uint64_t ready;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  size_t v9;
  _QWORD v11[2];
  _QWORD v12[8];
  unint64_t v13;
  unint64_t *v14;
  size_t v15[2];
  size_t v16[2];
  _QWORD __src[2];
  _QWORD v18[3];
  unint64_t v19;
  __int16 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v20 = -21846;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  memset(v18, 170, 20);
  __src[0] = 0xAAAAAAAAAAAAAAAALL;
  __src[1] = 0xAAAAAAAAAAAAAAAALL;
  v13 = 0xAAAAAAAAAAAAAAAALL;
  v14 = &v19;
  v12[6] = 48;
  v12[7] = a3 + 520;
  v12[4] = 32;
  v12[5] = a3 + 468;
  v12[2] = 32;
  v12[3] = a3 + 436;
  v12[0] = 20;
  v12[1] = v18;
  v11[0] = 16;
  v11[1] = __src;
  v15[0] = 0xAAAAAAAAAAAAAAAALL;
  v15[1] = 0;
  v16[0] = 0xAAAAAAAAAAAAAAAALL;
  v16[1] = 0;
  ready = ReadyHash((uint64_t)&SSLHashMD5, v15);
  if (!(_DWORD)ready)
  {
    ready = ReadyHash((uint64_t)&SSLHashSHA1, v16);
    if (!(_DWORD)ready)
    {
      if (a1)
      {
        v6 = 0;
        while (1)
        {
          v7 = 0;
          do
            *((_BYTE *)&v19 + v7++) = v6 + 65;
          while (v7 <= v6);
          v13 = ++v6;
          v8 = HashSHA1Update();
          if ((_DWORD)v8)
            break;
          v8 = HashSHA1Update();
          if ((_DWORD)v8)
            break;
          v8 = HashSHA1Update();
          if ((_DWORD)v8)
            break;
          v8 = HashSHA1Update();
          if ((_DWORD)v8)
            break;
          v8 = HashSHA1Final((uint64_t)v16, v12);
          if ((_DWORD)v8)
            break;
          v8 = HashMD5Update();
          if ((_DWORD)v8)
            break;
          v8 = HashMD5Update();
          if ((_DWORD)v8)
            break;
          v8 = HashMD5Final((uint64_t)v15, v11);
          if ((_DWORD)v8)
            break;
          if (a1 >= 0x10)
            v9 = 16;
          else
            v9 = a1;
          memcpy(a2, __src, v9);
          a1 -= v9;
          if (!a1)
            goto LABEL_23;
          v8 = ((uint64_t (*)(size_t *))HashMD5Init)(v15);
          if ((_DWORD)v8)
            break;
          a2 += v9;
          ready = HashSHA1Init();
          if ((_DWORD)ready)
            goto LABEL_24;
        }
        ready = v8;
      }
      else
      {
LABEL_23:
        ready = 0;
      }
    }
  }
LABEL_24:
  SSLFreeBuffer(v15);
  SSLFreeBuffer(v16);
  return ready;
}

uint64_t ssl3GenerateMasterSecret(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int16 v7;
  char v8;
  _QWORD v9[4];
  _QWORD v10[8];
  size_t v11[2];
  _QWORD v12[5];

  v12[3] = *MEMORY[0x1E0C80C00];
  memset(v10, 170, 56);
  memset(v9, 170, sizeof(v9));
  memset(v12, 170, 20);
  v7 = -21846;
  v8 = -86;
  v11[0] = 0xAAAAAAAAAAAAAAAALL;
  v11[1] = 0;
  v10[7] = 0;
  v2 = SSLAllocBuffer(&v10[6], 0x5CuLL);
  if (!(_DWORD)v2)
  {
    v2 = SSLAllocBuffer(v11, 0x60uLL);
    if (!(_DWORD)v2)
    {
      v10[4] = 32;
      v10[5] = a1 + 436;
      v10[2] = 32;
      v10[3] = a1 + 468;
      v10[0] = 20;
      v10[1] = v12;
      v3 = a1 + 520;
      v4 = 1;
      while (1)
      {
        v5 = HashMD5Init();
        if ((_DWORD)v5)
          break;
        v5 = HashSHA1Init();
        if ((_DWORD)v5)
          break;
        v8 = v4 + 64;
        HIBYTE(v7) = v4 + 64;
        LOBYTE(v7) = v4 + 64;
        v9[0] = v4;
        v9[1] = &v7;
        v5 = HashSHA1Update();
        if ((_DWORD)v5)
          break;
        v5 = HashSHA1Update();
        if ((_DWORD)v5)
          break;
        v5 = HashSHA1Update();
        if ((_DWORD)v5)
          break;
        v5 = HashSHA1Update();
        if ((_DWORD)v5)
          break;
        v5 = HashSHA1Final((uint64_t)v11, v10);
        if ((_DWORD)v5)
          break;
        v5 = HashMD5Update();
        if ((_DWORD)v5)
          break;
        v5 = HashMD5Update();
        if ((_DWORD)v5)
          break;
        v9[2] = 16;
        v9[3] = v3;
        v2 = HashMD5Final((uint64_t)&v10[6], &v9[2]);
        if (!(_DWORD)v2)
        {
          v3 += 16;
          if (++v4 != 4)
            continue;
        }
        goto LABEL_17;
      }
      v2 = v5;
    }
  }
LABEL_17:
  SSLFreeBuffer(v11);
  SSLFreeBuffer(&v10[6]);
  return v2;
}

uint64_t ssl3ComputeFinishedMac(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v8;
  unsigned int v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v13 = 0xAAAAAAAAAAAAAAAALL;
  v14 = 0;
  v11 = 0xAAAAAAAAAAAAAAAALL;
  v12 = 0;
  v8 = CloneHashState((uint64_t)&SSLHashSHA1, a1 + 568, (size_t *)&v13);
  if (!(_DWORD)v8)
  {
    v8 = CloneHashState((uint64_t)&SSLHashMD5, a1 + 584, (size_t *)&v11);
    if (!(_DWORD)v8)
    {
      if (a4)
        v9 = 1397904978;
      else
        v9 = 1129074260;
      v8 = ssl3CalculateFinishedMessage(a1, a2, a3, v13, v14, v11, v12, v9);
    }
  }
  SSLFreeBuffer(&v13);
  SSLFreeBuffer(&v11);
  return v8;
}

uint64_t ssl3ComputeCertVfyMac(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v8 = 0xAAAAAAAAAAAAAAAALL;
  v9 = 0;
  v6 = 0xAAAAAAAAAAAAAAAALL;
  v7 = 0;
  v4 = CloneHashState((uint64_t)&SSLHashSHA1, a1 + 568, (size_t *)&v8);
  if (!(_DWORD)v4)
  {
    v4 = CloneHashState((uint64_t)&SSLHashMD5, a1 + 584, (size_t *)&v6);
    if (!(_DWORD)v4)
    {
      *a2 = 36;
      v4 = ssl3CalculateFinishedMessage(a1, 36, a2[1], v8, v9, v6, v7, 0);
    }
  }
  SSLFreeBuffer(&v8);
  SSLFreeBuffer(&v6);
  return v4;
}

uint64_t ssl3CalculateFinishedMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned int a8)
{
  uint64_t result;
  _DWORD v11[9];
  _QWORD v12[2];
  _QWORD v13[2];
  _QWORD v14[3];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v13[0] = a4;
  v13[1] = a5;
  v12[0] = a6;
  v12[1] = a7;
  memset(v11, 170, sizeof(v11));
  v15[0] = 0xAAAAAAAAAAAAAAAALL;
  v15[1] = 0xAAAAAAAAAAAAAAAALL;
  memset(v14, 170, 20);
  if (!a8
    || (SSLEncodeInt((uint64_t)v11, a8, 4),
        *(_QWORD *)&v11[1] = 4,
        *(_QWORD *)&v11[3] = v11,
        result = HashMD5Update(),
        !(_DWORD)result)
    && (result = HashSHA1Update(), !(_DWORD)result))
  {
    *(_QWORD *)&v11[1] = 48;
    *(_QWORD *)&v11[3] = a1 + 520;
    result = HashMD5Update();
    if (!(_DWORD)result)
    {
      result = HashSHA1Update();
      if (!(_DWORD)result)
      {
        *(_QWORD *)&v11[1] = 48;
        *(_QWORD *)&v11[3] = &SSLMACPad1;
        result = HashMD5Update();
        if (!(_DWORD)result)
        {
          *(_QWORD *)&v11[1] = 40;
          result = HashSHA1Update();
          if (!(_DWORD)result)
          {
            *(_QWORD *)&v11[5] = 16;
            *(_QWORD *)&v11[7] = v15;
            result = HashMD5Final((uint64_t)v12, &v11[5]);
            if (!(_DWORD)result)
            {
              *(_QWORD *)&v11[5] = 20;
              *(_QWORD *)&v11[7] = v14;
              result = HashSHA1Final((uint64_t)v13, &v11[5]);
              if (!(_DWORD)result)
              {
                result = HashMD5Init();
                if (!(_DWORD)result)
                {
                  result = HashSHA1Init();
                  if (!(_DWORD)result)
                  {
                    *(_QWORD *)&v11[1] = 48;
                    *(_QWORD *)&v11[3] = a1 + 520;
                    result = HashMD5Update();
                    if (!(_DWORD)result)
                    {
                      result = HashSHA1Update();
                      if (!(_DWORD)result)
                      {
                        *(_QWORD *)&v11[1] = 48;
                        *(_QWORD *)&v11[3] = "\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
                                             "\\\\\\\\\\\\\\\\\\\\";
                        result = HashMD5Update();
                        if (!(_DWORD)result)
                        {
                          *(_QWORD *)&v11[1] = 40;
                          result = HashSHA1Update();
                          if (!(_DWORD)result)
                          {
                            *(_QWORD *)&v11[1] = 16;
                            *(_QWORD *)&v11[3] = v15;
                            result = HashMD5Update();
                            if (!(_DWORD)result)
                            {
                              *(_QWORD *)&v11[5] = 16;
                              *(_QWORD *)&v11[7] = a3;
                              result = HashMD5Final((uint64_t)v12, &v11[5]);
                              if (!(_DWORD)result)
                              {
                                *(_QWORD *)&v11[1] = 20;
                                *(_QWORD *)&v11[3] = v14;
                                result = HashSHA1Update();
                                if (!(_DWORD)result)
                                {
                                  *(_QWORD *)&v11[5] = 20;
                                  *(_QWORD *)&v11[7] = a3 + 16;
                                  return HashSHA1Final((uint64_t)v13, &v11[5]);
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
      }
    }
  }
  return result;
}

uint64_t SSLComputeMac(char a1, unint64_t *a2, uint64_t a3, uint64_t a4, size_t **a5, int a6)
{
  unint64_t v10;
  size_t *v11;
  size_t v12;
  size_t v13;
  uint64_t v14;
  size_t v15;
  uint64_t v16;
  size_t v17;
  char *v18;
  char *v19;
  size_t v20;
  _BYTE *v21;
  _BYTE *v22;
  _BYTE *v23;
  size_t i;
  _BYTE *v25;
  void *v26;
  char *v27;
  size_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  void *v32;
  size_t v33;
  size_t v34;
  uint64_t v35;
  size_t v36;
  BOOL v37;
  char *v38;
  _BYTE *v39;
  size_t v40;
  size_t v41;
  unint64_t v42;
  size_t v43;
  unint64_t v44;
  size_t v45;
  size_t v46;
  unint64_t v47;
  char *v48;
  unint64_t *v49;
  size_t v50;
  size_t v51;
  unint64_t v52;
  size_t v53;
  char *v54;
  size_t *v55;
  unint64_t v56;
  size_t v57;
  unint64_t v58;
  unint64_t v59;
  char v60;
  char v61;
  char v62;
  BOOL v63;
  char v65;
  unint64_t v66;
  unint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  size_t *v71;
  unint64_t v72;
  char *v73;
  char *v74;
  int v75;
  uint64_t v76;
  unint64_t v77;
  unsigned int v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  unsigned int v82;
  int v83;
  uint64_t v84;
  unint64_t v85;
  unsigned int v86;
  void *v87;
  size_t v88;
  uint64_t v89;
  char *v90;
  unint64_t v91;
  size_t v92;
  size_t v93;
  uint64_t v94;
  uint64_t v96;
  size_t **v97;
  size_t v98;
  int v99;
  uint64_t v100;
  char *v101;
  char *v102;
  char *v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t *v106;
  size_t *v107;
  char *v108;
  char *v109;
  _QWORD v110[2];

  v100 = a4;
  v110[1] = *MEMORY[0x1E0C80C00];
  v106 = a2;
  v10 = *a2;
  v11 = *a5;
  v12 = (*a5)[2];
  v13 = **a5;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  if (v13)
    memset((char *)&v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v13);
  v14 = v10 - a3;
  v101 = (char *)&v96 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v101, v13);
  v15 = 40;
  v16 = 40;
  if (v13 == 16)
    v16 = 48;
  if (a6 == 768)
    v15 = v16;
  v98 = v15;
  if (a6 == 768)
    v17 = v13 + v16 + 11;
  else
    v17 = v12 + 13;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v18 = (char *)&v96 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v108 = v18;
  if (v17)
  {
    memset(v108, 170, v17);
    v18 = v108;
  }
  v97 = a5;
  if (a6 == 768)
  {
    memcpy(v18, (char *)a5 + 41, v13);
    v19 = &v18[v13];
    v20 = v98;
    memset(v19, 54, v98);
    v21 = (_BYTE *)SSLEncodeUInt64((uint64_t)&v19[v20], (unint64_t)a5[4]);
    *v21 = a1;
    v22 = v21 + 2;
    v21[1] = BYTE1(v14);
  }
  else
  {
    memset(v108, 54, v12);
    v23 = v108;
    if (v13)
    {
      for (i = 0; i < v13; ++i)
        v23[i] ^= *((_BYTE *)a5 + i + 41);
    }
    v25 = (_BYTE *)SSLEncodeUInt64((uint64_t)&v23[v12], (unint64_t)a5[4]);
    *v25 = a1;
    v25[1] = BYTE1(a6);
    v25[2] = a6;
    v22 = v25 + 4;
    v25[3] = BYTE1(v14);
  }
  v99 = a6;
  *v22 = v14;
  v26 = (void *)((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v27 = (char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v12)
    v26 = memset((char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v12);
  v28 = v11[1];
  MEMORY[0x1E0C80A78](v26);
  v29 = (8 * ((v28 + 7) >> 3) + 15) & 0xFFFFFFFFFFFFFFF0;
  v109 = (char *)&v96 - v29;
  if (v30 > 7)
  {
    v32 = memset(v109, 170, ((v28 - 1) & 0xFFFFFFFFFFFFFFF8) + 8);
    MEMORY[0x1E0C80A78](v32);
    v102 = (char *)&v96 - v29;
    memset((char *)&v96 - v29, 170, ((v28 - 1) & 0xFFFFFFFFFFFFFFF8) + 8);
    v31 = v109;
  }
  else
  {
    v31 = (char *)MEMORY[0x1E0C80A78]((char *)&v96 - v29);
    v102 = (char *)&v96 - v29;
  }
  memcpy(v31, (const void *)v11[5], v28);
  v33 = *v11;
  bzero(v101, *v11);
  v34 = v17 + v14;
  v110[0] = 0;
  if (v33 == 16)
  {
    v110[0] = 8 * v34;
    v35 = 8;
  }
  else
  {
    v36 = v11[2];
    v110[0] = bswap64(8 * v34);
    v37 = v36 == 128;
    v35 = 16;
    if (!v37)
      v35 = 8;
  }
  v39 = v108;
  v38 = v109;
  v107 = v11;
  v40 = v17 + *v106;
  v103 = (char *)v35;
  v41 = (v35 + v40) / v12;
  v42 = v41 + 1;
  v43 = v41 - 5;
  v105 = v42;
  if (v42 >= 6)
    v44 = v43;
  else
    v44 = 0;
  if (v44)
  {
    v45 = 0;
    v104 = -(uint64_t)v17;
    v46 = v17;
    v47 = v44;
    do
    {
      if (v12 + v45 >= v17)
      {
        if (v45 >= v17)
        {
          ((void (*)(char *, uint64_t, unint64_t))v107[6])(v38, 1, v106[1] + v104 + v45);
        }
        else
        {
          v48 = v38;
          memcpy((char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), &v39[v45], v46);
          memcpy(&v27[v46], (const void *)v106[1], v12 - v17 + v45);
          ((void (*)(char *, uint64_t, char *))v107[6])(v48, 1, (char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
        }
      }
      else
      {
        ((void (*)(char *, uint64_t, _BYTE *))v107[6])(v38, 1, &v39[v45]);
      }
      v45 += v12;
      v46 -= v12;
      --v47;
      v39 = v108;
      v38 = v109;
    }
    while (v47);
  }
  v49 = v106;
  if (v44 < v105)
  {
    v50 = (unint64_t)&v103[v34] / v12;
    v51 = v12 + v12 * v50;
    v52 = v51 - 1;
    v53 = v51 - 9;
    v54 = (char *)&v110[1] - v12;
    v103 = v54;
    v104 = v51 - 1;
    v55 = v107;
    do
    {
      v56 = 0;
      v57 = v44 * v12;
      do
      {
        v58 = v56 + v57;
        v59 = v56 + v57 - v17;
        if (v56 + v57 >= v17)
        {
          if (v59 >= *v49)
            v61 = 0;
          else
            v61 = *(_BYTE *)(v49[1] + v59);
          if (v58 == v34)
            v62 = 0;
          else
            v62 = -1;
          v60 = v62 & v61 | ~v62 & 0x80;
          v63 = v58 <= v53 && v58 > v34;
          if (v63)
            v60 = 0;
          if (v56 >= v12 - 8)
          {
            if (v58 <= v52 && v58 > v53)
              v65 = -1;
            else
              v65 = 0;
            v60 = v65 & v54[v56] | v60 & ~v65;
          }
        }
        else
        {
          v60 = v39[v58];
        }
        v27[v56++] = v60;
      }
      while (v12 != v56);
      ((void (*)(char *, uint64_t, char *))v55[6])(v109, 1, (char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
      v38 = v109;
      v66 = v55[1];
      if (v66 >= 4)
      {
        v67 = v66 >> 2;
        v68 = v102;
        v69 = v109;
        do
        {
          if (v44 == v50)
            v70 = v69;
          else
            v70 = v68;
          *(_DWORD *)v68 = *(_DWORD *)v70;
          v68 += 4;
          v69 += 4;
          --v67;
        }
        while (v67);
      }
      ++v44;
      v49 = v106;
      v39 = v108;
      v54 = v103;
      v52 = v104;
    }
    while (v44 < v105);
  }
  v71 = v107;
  v72 = *v107;
  if (*v107 > 0x10)
  {
    v74 = v101;
    v79 = v102;
    v75 = v99;
    if (v72 >= 0x21)
    {
      v83 = 0;
      v84 = 0;
      v85 = v72 >> 3;
      v86 = 1;
      do
      {
        *(_QWORD *)&v74[v83] = bswap64(*(_QWORD *)&v79[8 * v84]);
        v84 = v86;
        v63 = v85 > v86++;
        v83 += 8;
      }
      while (v63);
    }
    else
    {
      v80 = 0;
      v81 = v72 >> 2;
      v82 = 1;
      do
      {
        *(_DWORD *)&v74[v80] = bswap32(*(_DWORD *)&v79[v80]);
        v80 += 4;
        v63 = v81 > v82++;
      }
      while (v63);
    }
  }
  else
  {
    v74 = v101;
    v73 = v102;
    v75 = v99;
    if (v72 >= 4)
    {
      v76 = 0;
      v77 = v72 >> 2;
      v78 = 1;
      do
      {
        *(_DWORD *)&v74[v76] = *(_DWORD *)&v73[v76];
        v76 += 4;
        v63 = v77 > v78++;
      }
      while (v63);
    }
  }
  bzero(v38, v71[1]);
  v87 = memset((char *)&v96 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), 92, v12);
  MEMORY[0x1E0C80A78](v87);
  v90 = (char *)&v96 - v89;
  if (v91 >= 8)
    memset((char *)&v96 - v89, 170, v88);
  ccdigest_init();
  v92 = *v71;
  if (v75 == 768)
  {
    ccdigest_update();
  }
  else if (v92)
  {
    v93 = 0;
    v94 = (uint64_t)v97 + 41;
    do
    {
      v27[v93] ^= *(_BYTE *)(v94 + v93);
      ++v93;
    }
    while (v93 < v92);
  }
  ccdigest_update();
  ccdigest_update();
  ((void (*)(size_t *, char *, uint64_t))v71[7])(v71, v90, v100);
  cc_clear();
  bzero(v74, *v71);
  return 0;
}

BOOL SSLVerifyMac(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v8;
  size_t **v9;
  size_t v10;
  char *v11;
  _QWORD v13[2];

  v8 = a1;
  v13[1] = *MEMORY[0x1E0C80C00];
  v9 = (size_t **)(a5 + 8);
  MEMORY[0x1E0C80A78](a1);
  v11 = (char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v10)
    memset((char *)v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v10);
  SSLComputeMac(v8, a2, a3, (uint64_t)v11, v9, *(_DWORD *)(a5 + 492));
  return (cc_cmp_safe() & 1) == 0;
}

__CFString *copyHexString(uint64_t a1, unint64_t a2)
{
  __CFString *Mutable;
  unint64_t v5;
  unsigned int v6;

  Mutable = CFStringCreateMutable(0, 2 * a2);
  if (a2)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      CFStringAppendFormat(Mutable, 0, CFSTR("%02X"), *(unsigned __int8 *)(a1 + v5));
      v5 = v6++;
    }
    while (v5 < a2);
  }
  return Mutable;
}

unint64_t SSLDecodeUInt64(unsigned __int8 *a1, uint64_t a2)
{
  unint64_t i;
  unsigned int v3;

  for (i = 0; a2; --a2)
  {
    v3 = *a1++;
    i = v3 | (i << 8);
  }
  return i;
}

_QWORD *__ssl_add_debug_logger(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = sslMalloc(0x18uLL);
  *result = a1;
  result[1] = a2;
  result[2] = gDebugLoggers;
  gDebugLoggers = (uint64_t)result;
  return result;
}

uint64_t NullInit()
{
  return 0;
}

uint64_t CCSymmInit(_DWORD *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, void **a6)
{
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (*a6)
    sslFree(*a6);
  if ((*a1 - 5) > 1)
  {
    if (a2)
      v9 = (_QWORD *)ccdes3_cbc_encrypt_mode();
    else
      v9 = (_QWORD *)ccdes3_cbc_decrypt_mode();
  }
  else if (a2)
  {
    v9 = (_QWORD *)ccaes_cbc_encrypt_mode();
  }
  else
  {
    v9 = (_QWORD *)ccaes_cbc_decrypt_mode();
  }
  v10 = v9;
  v11 = sslMalloc(((v9[1] + ((*v9 + 15) & 0xFFFFFFFFFFFFFFF0) + 15) & 0xFFFFFFFFFFFFFFF0) + 16);
  if (!v11)
  {
    __ssl_debug("sslError", "CCSymmInit", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/symCipher.c", 140, "CCSymmInit: Can't allocate context\n");
    return 4294957296;
  }
  v12 = v11;
  *v11 = v10;
  v13 = cccbc_init();
  if ((_DWORD)v13)
  {
    v14 = v13;
    goto LABEL_17;
  }
  v14 = cccbc_set_iv();
  if ((_DWORD)v14)
  {
LABEL_17:
    sslFree(v12);
    return v14;
  }
  *a6 = v12;
  return v14;
}

uint64_t CCSymmEncryptDecrypt(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (!a4 || !*(_QWORD *)a4)
  {
    __ssl_debug("sslError", "CCSymmEncryptDecrypt", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/symCipher.c", 167, "CCSymmEncryptDecrypt: NULL cipherCtx\n");
    return 4294957296;
  }
  if (a3 % *(_QWORD *)(*(_QWORD *)a4 + 8))
  {
    __ssl_debug("sslError", "CCSymmEncryptDecrypt", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/coreTLS/lib/symCipher.c", 174, "CCSymmEncryptDecrypt: Invalid size\n");
    return 4294957296;
  }
  return cccbc_update();
}

uint64_t HashMD5Final(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = ccmd5_di();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 56))(v4, *(_QWORD *)(a1 + 8), a2[1]);
  *a2 = *(_QWORD *)v4;
  return 0;
}

uint64_t HashMD5Clone(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = ccmd5_di();
  memcpy(*(void **)(a2 + 8), *(const void **)(a1 + 8), *(_QWORD *)(v4 + 8) + *(_QWORD *)(v4 + 16) + 12);
  return 0;
}

uint64_t HashSHA1Final(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = ccsha1_di();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 56))(v4, *(_QWORD *)(a1 + 8), a2[1]);
  *a2 = *(_QWORD *)v4;
  return 0;
}

uint64_t HashSHA1Clone(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = ccsha1_di();
  memcpy(*(void **)(a2 + 8), *(const void **)(a1 + 8), *(_QWORD *)(v4 + 8) + *(_QWORD *)(v4 + 16) + 12);
  return 0;
}

uint64_t HashSHA512Final(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;

  v4 = ccsha512_di();
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 56))(v4, *(_QWORD *)(a1 + 8), a2[1]);
  *a2 = *(_QWORD *)v4;
  return 0;
}

uint64_t HashSHA512Clone(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = ccsha512_di();
  memcpy(*(void **)(a2 + 8), *(const void **)(a1 + 8), *(_QWORD *)(v4 + 8) + *(_QWORD *)(v4 + 16) + 12);
  return 0;
}

void tls_metric_insecure_dh_param_cold_1()
{
  const void *v0;

  dlerror();
  v0 = (const void *)abort_report_np();
  CFRelease(v0);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1E0C80B78]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t ccDRBGGetRngState()
{
  return MEMORY[0x1E0C81860]();
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C81868]();
}

uint64_t cc_cmp_safe()
{
  return MEMORY[0x1E0C81870]();
}

uint64_t ccaes_cbc_decrypt_mode()
{
  return MEMORY[0x1E0C81878]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x1E0C81880]();
}

uint64_t ccaes_gcm_decrypt_mode()
{
  return MEMORY[0x1E0C818B0]();
}

uint64_t ccaes_gcm_encrypt_mode()
{
  return MEMORY[0x1E0C818B8]();
}

uint64_t cccbc_init()
{
  return MEMORY[0x1E0C81908]();
}

uint64_t cccbc_set_iv()
{
  return MEMORY[0x1E0C81918]();
}

uint64_t cccbc_update()
{
  return MEMORY[0x1E0C81920]();
}

uint64_t ccder_decode_dhparam_n()
{
  return MEMORY[0x1E0C81A60]();
}

uint64_t ccder_decode_dhparams()
{
  return MEMORY[0x1E0C81A68]();
}

uint64_t ccdes3_cbc_decrypt_mode()
{
  return MEMORY[0x1E0C81B58]();
}

uint64_t ccdes3_cbc_encrypt_mode()
{
  return MEMORY[0x1E0C81B60]();
}

uint64_t ccdh_ccn_size()
{
  return MEMORY[0x1E0C81B68]();
}

uint64_t ccdh_compute_shared_secret()
{
  return MEMORY[0x1E0C81B70]();
}

uint64_t ccdh_ctx_public()
{
  return MEMORY[0x1E0C81B78]();
}

uint64_t ccdh_export_pub()
{
  return MEMORY[0x1E0C81B80]();
}

uint64_t ccdh_export_pub_size()
{
  return MEMORY[0x1E0C81B88]();
}

uint64_t ccdh_generate_key()
{
  return MEMORY[0x1E0C81B90]();
}

uint64_t ccdh_gp_g()
{
  return MEMORY[0x1E0C81B98]();
}

uint64_t ccdh_gp_n()
{
  return MEMORY[0x1E0C81BA0]();
}

uint64_t ccdh_gp_prime()
{
  return MEMORY[0x1E0C81BA8]();
}

uint64_t ccdh_gp_rfc5114_MODP_2048_256()
{
  return MEMORY[0x1E0C81BB0]();
}

uint64_t ccdh_gp_size()
{
  return MEMORY[0x1E0C81BB8]();
}

uint64_t ccdh_import_pub()
{
  return MEMORY[0x1E0C81BC0]();
}

uint64_t ccdh_init_gp_from_bytes()
{
  return MEMORY[0x1E0C81BC8]();
}

uint64_t ccdigest_init()
{
  return MEMORY[0x1E0C81BD8]();
}

uint64_t ccdigest_update()
{
  return MEMORY[0x1E0C81BE0]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1E0C81C60]();
}

uint64_t ccec_cp_384()
{
  return MEMORY[0x1E0C81C68]();
}

uint64_t ccec_cp_521()
{
  return MEMORY[0x1E0C81C70]();
}

uint64_t ccec_export_pub()
{
  return MEMORY[0x1E0C81CD8]();
}

uint64_t ccec_generate_key()
{
  return MEMORY[0x1E0C81CF0]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1E0C81D20]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1E0C81DC8]();
}

uint64_t ccecdh_compute_shared_secret()
{
  return MEMORY[0x1E0C81E20]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x1E0C81ED0]();
}

uint64_t ccgcm_gmac()
{
  return MEMORY[0x1E0C81ED8]();
}

uint64_t ccgcm_inc_iv()
{
  return MEMORY[0x1E0C81EE0]();
}

uint64_t ccgcm_init_with_iv()
{
  return MEMORY[0x1E0C81EF0]();
}

uint64_t ccgcm_reset()
{
  return MEMORY[0x1E0C81F00]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x1E0C81F10]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1E0C821F0]();
}

uint64_t ccn_bitlen()
{
  return MEMORY[0x1E0C82208]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1E0C82220]();
}

uint64_t ccn_swap()
{
  return MEMORY[0x1E0C82238]();
}

uint64_t ccn_write_uint()
{
  return MEMORY[0x1E0C82250]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x1E0C82258]();
}

uint64_t ccn_write_uint_size()
{
  return MEMORY[0x1E0C82268]();
}

uint64_t ccrsa_init_pub()
{
  return MEMORY[0x1E0C82350]();
}

uint64_t ccrsa_pub_crypt()
{
  return MEMORY[0x1E0C82378]();
}

uint64_t ccrsa_verify_pkcs1v15()
{
  return MEMORY[0x1E0C82380]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1E0C823D0]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C823E0]();
}

uint64_t ccsha384_di()
{
  return MEMORY[0x1E0C823E8]();
}

uint64_t ccsha512_di()
{
  return MEMORY[0x1E0C823F8]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1E0C825C8]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t csops()
{
  return MEMORY[0x1E0C82B68]();
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

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
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

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strcpy(char *__dst, const char *__src)
{
  return (char *)MEMORY[0x1E0C85530](__dst, __src);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A58](a1, a2, a3);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x1E0C85F00](xBOOL);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1E0C86058]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

uint64_t xpc_create_from_plist()
{
  return MEMORY[0x1E0C86150]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

