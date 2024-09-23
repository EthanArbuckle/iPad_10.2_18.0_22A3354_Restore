int ECDH_compute_key(void *out, size_t outlen, const EC_POINT *pub_key, EC_KEY *ecdh, void *(__cdecl *KDF)(const void *, size_t, void *, size_t *))
{
  size_t v8;
  const BIGNUM *v10;
  unsigned int v11;
  unsigned __int8 *v12;
  unsigned __int8 *v13;
  size_t v14;
  size_t v15;
  unsigned __int8 *v16;
  NSObject *v17;
  _QWORD *cp;
  _QWORD *v19;
  void *v20;
  void *v21;
  _QWORD *v22;
  void *v23;
  NSObject *v25;
  void *v26;
  size_t v27;
  size_t v28;

  v8 = outlen;
  v28 = outlen;
  if (!ccrng())
  {
LABEL_17:
    LODWORD(v8) = -1;
    return v8;
  }
  v10 = (const BIGNUM *)*((_QWORD *)ecdh + 2);
  v11 = BN_num_bytes(v10);
  v12 = (unsigned __int8 *)malloc_type_malloc(v11, 0x74AF8911uLL);
  if (!v12)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      ECDH_compute_key_cold_1();
    goto LABEL_17;
  }
  v13 = v12;
  BN_bn2bin(v10, v12);
  v14 = EC_POINT_point2oct(*(const EC_GROUP **)ecdh, pub_key, (point_conversion_form_t)*((_DWORD *)ecdh + 7), 0, 0, 0);
  if (!v14)
  {
    v17 = g_boringssl_log;
    if (!g_boringssl_log)
      goto LABEL_29;
    if (!os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
    {
LABEL_26:
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        ECDH_compute_key_cold_2();
      v17 = 0;
      goto LABEL_29;
    }
    ECDH_compute_key_cold_3();
LABEL_25:
    v17 = g_boringssl_log;
    if (!g_boringssl_log)
      goto LABEL_29;
    goto LABEL_26;
  }
  v15 = v14;
  v16 = (unsigned __int8 *)malloc_type_malloc(v14, 0x920AA068uLL);
  if (!v16)
    goto LABEL_25;
  v17 = v16;
  if ((int)EC_POINT_point2oct(*(const EC_GROUP **)ecdh, pub_key, (point_conversion_form_t)*((_DWORD *)ecdh + 7), v16, v15, 0) <= 0)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      ECDH_compute_key_cold_4();
    free(v17);
    goto LABEL_25;
  }
  ccec_x963_import_pub_size();
  if (!ccec_keysize_is_supported())
  {
    v25 = g_boringssl_log;
    if (!g_boringssl_log)
      goto LABEL_29;
    if (!os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      goto LABEL_42;
    ECDH_compute_key_cold_6();
    goto LABEL_41;
  }
  cp = (_QWORD *)ccec_get_cp();
  if (!cp)
  {
LABEL_41:
    v25 = g_boringssl_log;
    if (g_boringssl_log)
    {
LABEL_42:
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        ECDH_compute_key_cold_5();
    }
LABEL_29:
    v23 = 0;
    v21 = 0;
    goto LABEL_30;
  }
  v19 = cp;
  v20 = malloc_type_malloc(8 * *cp, 0x22087AD0uLL);
  if (!v20)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      ECDH_compute_key_cold_7();
    goto LABEL_29;
  }
  v21 = v20;
  v22 = malloc_type_malloc((32 * *v19) | 0x10, 0xCA46AA7DuLL);
  if (v22)
  {
    *v22 = v19;
    v26 = v22;
    if (ccec_import_pub())
    {
      if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
        ECDH_compute_key_cold_8();
    }
    else if (ccn_read_uint() != -1)
    {
      v27 = 8 * *v19;
      v23 = malloc_type_malloc(v27, 0x5457DB28uLL);
      if (!ccecdh_compute_shared_secret())
      {
        if (!KDF)
        {
          if (v27 < v8)
          {
            v28 = v27;
            v8 = v27;
          }
          memcpy(out, v23, v8);
          goto LABEL_55;
        }
        if (((uint64_t (*)(void *, size_t, void *, size_t *))KDF)(v23, v27, out, &v28))
        {
          LODWORD(v8) = v28;
LABEL_55:
          cc_clear();
          free(v26);
          goto LABEL_31;
        }
        ERR_put_error(27, 0, 100, "/Library/Caches/com.apple.xbs/Sources/boringssl/apple/crypto/boringssl_crypto_ecdh.m", 124);
      }
LABEL_54:
      LODWORD(v8) = -1;
      goto LABEL_55;
    }
    v23 = 0;
    goto LABEL_54;
  }
  v23 = 0;
LABEL_30:
  LODWORD(v8) = -1;
LABEL_31:
  cc_clear();
  free(v13);
  if (v17)
  {
    cc_clear();
    free(v17);
  }
  if (v23)
  {
    cc_clear();
    free(v23);
  }
  if (v21)
    free(v21);
  return v8;
}

int BN_rand(BIGNUM *rnd, int bits, int top, int bottom)
{
  int v5;
  int v6;
  BIGNUM *v9;
  int v10;
  int v11;
  unint64_t v12;
  int v13;
  uint64_t v14;
  unsigned __int8 *d;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  if (rnd)
  {
    if ((top - 2) <= 0xFFFFFFFC)
    {
      v5 = 66;
      v6 = 131;
LABEL_9:
      ERR_put_error(3, 0, v5, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/bn/random.c", v6);
      LODWORD(rnd) = 0;
      return (int)rnd;
    }
    if (bottom >= 2)
    {
      v5 = 66;
      v6 = 136;
      goto LABEL_9;
    }
    v9 = rnd;
    if (!bits)
    {
      BN_zero((uint64_t)rnd);
LABEL_33:
      LODWORD(rnd) = 1;
      return (int)rnd;
    }
    if (bits >= 2147483585)
    {
      v5 = 102;
      v6 = 146;
      goto LABEL_9;
    }
    v10 = bits >= -63 ? bits + 63 : bits + 126;
    v11 = 1 - bits >= 0 ? -((1 - bits) & 0x3F) : (bits - 1) & 0x3F;
    v12 = (uint64_t)v10 >> 6;
    LODWORD(rnd) = bn_wexpand(&rnd->d, v12);
    if ((_DWORD)rnd)
    {
      v13 = v10 >> 6;
      if (v11 < 63)
        v14 = ~(-1 << (v11 + 1));
      else
        v14 = -1;
      RAND_bytes((unsigned __int8 *)v9->d, 8 * v12);
      d = (unsigned __int8 *)v9->d;
      v16 = v13 - 1;
      v17 = v9->d[v16] & v14;
      v9->d[v16] = v17;
      if (top != -1)
      {
        if (bits >= 2 && top == 1)
        {
          if (!v11)
          {
            *(_QWORD *)&d[8 * v16] = v17 | 1;
            *(_QWORD *)&d[8 * v13 - 16] |= 0x8000000000000000;
            goto LABEL_30;
          }
          v18 = 3 << (v11 - 1);
        }
        else
        {
          v18 = 1 << v11;
        }
        *(_QWORD *)&d[8 * v16] = v17 | v18;
      }
LABEL_30:
      if (bottom == 1)
        *(_QWORD *)d |= 1uLL;
      v9->neg = 0;
      v9->top = v13;
      goto LABEL_33;
    }
  }
  return (int)rnd;
}

uint64_t bn_rand_secret_range(uint64_t a1, _DWORD *a2, unint64_t a3, uint64_t a4)
{
  uint64_t result;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  unint64_t v18;
  unint64_t v19;

  v18 = 0xAAAAAAAAAAAAAAAALL;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  result = bn_range_to_mask(&v19, &v18, a3, *(unint64_t **)a4, *(int *)(a4 + 8));
  if ((_DWORD)result)
  {
    v9 = v19;
    result = bn_wexpand((_QWORD **)a1, v19);
    if ((_DWORD)result)
    {
      if (!v9)
        bn_rand_secret_range_cold_1();
      v10 = v18;
      if (!v18)
        bn_rand_secret_range_cold_2();
      v11 = v18 >> 1;
      if (v9 == 1 && v11 < a3)
      {
        ERR_put_error(3, 0, 108, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/bn/random.c", 317);
        return 0;
      }
      else
      {
        RAND_bytes(*(unsigned __int8 **)a1, 8 * v9);
        v12 = *(uint64_t **)a1;
        v13 = 8 * v9 - 8;
        *(uint64_t *)((char *)v12 + v13) = *(_QWORD *)(*(_QWORD *)a1 + v13) & v10;
        v14 = bn_in_range_words(v12, a3, *(uint64_t **)a4, v9);
        *a2 = v14;
        v15 = -(uint64_t)v14;
        v16 = v14 - 1;
        v17 = *(uint64_t **)a1;
        *v17 = **(_QWORD **)a1 | v16 & a3;
        *(uint64_t *)((char *)v17 + v13) &= v16 & v11 | v15;
        if (!bn_in_range_words(v17, a3, *(uint64_t **)a4, v9))
          bn_rand_secret_range_cold_3();
        *(_DWORD *)(a1 + 16) = 0;
        *(_DWORD *)(a1 + 8) = v9;
        return 1;
      }
    }
  }
  return result;
}

uint64_t ec_compute_wNAF(uint64_t result, _BYTE *a2, _DWORD *a3, unint64_t a4, unsigned int a5)
{
  char v6;
  int v8;
  unsigned int v9;
  int v10;
  uint64_t v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  int v17;
  unsigned int v18;

  if (a5 - 8 <= 0xFFFFFFF8)
    ec_compute_wNAF_cold_1();
  if (!a4)
    ec_compute_wNAF_cold_2();
  v6 = a5;
  v8 = 2 << a5;
  v9 = (2 << a5) - 1;
  v10 = v9 & *a3;
  if (a4 != -1)
  {
    v12 = result;
    v13 = 1 << a5;
    v17 = -(1 << a5);
    v18 = v9 >> 1;
    v14 = a4 + 1;
    v15 = a5 + 1;
    do
    {
      if (v10 < 0 || v10 > v8)
        ec_compute_wNAF_cold_4();
      if ((v10 & 1) != 0)
      {
        v16 = v10 - v8;
        if (v10 >= v8)
          ec_compute_wNAF_cold_9();
        if (v15 >= a4)
          v16 = v10 & v18;
        if ((v10 & v13) == 0)
          v16 = v10;
        v10 -= v16;
        if (v10 && v10 != v8 && v10 != v13)
          ec_compute_wNAF_cold_8();
        if (v16 <= v17 || v16 >= v13)
          ec_compute_wNAF_cold_6();
        if ((v16 & 1) == 0)
          ec_compute_wNAF_cold_7();
      }
      else
      {
        LOBYTE(v16) = 0;
      }
      *a2 = v16;
      result = bn_is_bit_set_words((uint64_t)a3, *(int *)(v12 + 24), v15);
      v10 = ((_DWORD)result << v6) + (v10 >> 1);
      if (v10 > v8)
        ec_compute_wNAF_cold_5();
      ++a2;
      ++v15;
      --v14;
    }
    while (v14);
  }
  if (v10)
    ec_compute_wNAF_cold_3();
  return result;
}

uint64_t ec_GFp_mont_mul_public_batch()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  _DWORD *v3;
  _DWORD *v4;
  unint64_t *v5;
  unint64_t *v6;
  _DWORD *v7;
  _DWORD *v8;
  unint64_t *v9;
  unint64_t *v10;
  uint64_t v11;
  unsigned int v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t *v17;
  uint64_t v18;
  _BYTE *v19;
  unint64_t v20;
  __int128 v21;
  int v22;
  unint64_t v23;
  _DWORD *v24;
  _BYTE *v25;
  uint64_t v26;
  unint64_t i;
  _QWORD *v29;
  _QWORD *v30;
  _BYTE *v31;
  _BYTE *v32;
  _OWORD v33[13];
  unint64_t v34;
  _BYTE v35[1735];
  _BYTE v36[529];
  _BYTE __b[5189];
  _BYTE v38[1587];
  uint64_t v39;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = v0;
  v39 = *MEMORY[0x1E0C80C00];
  v12 = BN_num_bits((const BIGNUM *)(v0 + 16));
  v32 = v38;
  memset(v38, 170, sizeof(v38));
  v31 = __b;
  memset(__b, 170, 0x1440uLL);
  if (v2 < 4)
  {
    v13 = 0;
    v14 = 0;
LABEL_7:
    memset(v36, 170, sizeof(v36));
    memset(v35, 170, 0x6C0uLL);
    if (v12 >= 0x211)
      ec_GFp_mont_mul_public_batch_cold_1();
    v29 = v14;
    v30 = v13;
    if (v8)
    {
      v17 = (unint64_t *)(*(_QWORD *)(v11 + 8) + 8);
      ec_compute_wNAF(v11, v36, v8, v12, 4u);
      compute_precomp(v11, (uint64_t)v35, v17);
    }
    if (v2)
    {
      v18 = (uint64_t)v31;
      v19 = v32;
      v20 = v2;
      do
      {
        ec_compute_wNAF(v11, v19, v4, v12, 4u);
        compute_precomp(v11, v18, v6);
        v6 += 27;
        v18 += 1728;
        v4 += 18;
        v19 += 529;
        --v20;
      }
      while (v20);
    }
    v34 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v33[11] = v21;
    v33[12] = v21;
    v33[9] = v21;
    v33[10] = v21;
    v33[7] = v21;
    v33[8] = v21;
    v33[5] = v21;
    v33[6] = v21;
    v33[3] = v21;
    v33[4] = v21;
    v33[1] = v21;
    v33[2] = v21;
    v22 = 1;
    v23 = v12;
    v33[0] = v21;
    v24 = v8;
    while (1)
    {
      if (v22)
      {
        if (v8)
          goto LABEL_18;
      }
      else
      {
        ec_GFp_mont_dbl(v11, v10, v10);
        if (v8)
        {
LABEL_18:
          if (v36[v23])
          {
            lookup_precomp(v11, (uint64_t)v33, (uint64_t)v35, (char)v36[v23]);
            if (v22)
            {
              ec_GFp_simple_point_copy((uint64_t)v10, (uint64_t)v33);
              v22 = 0;
            }
            else
            {
              ec_GFp_mont_add(v11, (uint64_t)v10, (uint64_t)v10, (uint64_t)v33);
            }
          }
        }
      }
      v26 = (uint64_t)v31;
      v25 = v32;
      for (i = v2; i; --i)
      {
        if (v25[v23])
        {
          lookup_precomp(v11, (uint64_t)v33, v26, (char)v25[v23]);
          if (v22)
          {
            ec_GFp_simple_point_copy((uint64_t)v10, (uint64_t)v33);
            v22 = 0;
          }
          else
          {
            ec_GFp_mont_add(v11, (uint64_t)v10, (uint64_t)v10, (uint64_t)v33);
          }
        }
        v25 += 529;
        v26 += 1728;
      }
      --v23;
      v8 = v24;
      if (v23 > v12)
      {
        if (v22)
          ec_GFp_simple_point_set_to_infinity(v11, (uint64_t)v10);
        v15 = 1;
        v14 = v29;
        v13 = v30;
        goto LABEL_32;
      }
    }
  }
  if (v2 >= 0x25ED097B425ED0)
  {
    ERR_put_error(15, 0, 69, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/wnaf.c", 202);
    v15 = 0;
    v13 = 0;
    v14 = 0;
    goto LABEL_32;
  }
  v13 = OPENSSL_malloc(529 * v2);
  v16 = OPENSSL_malloc(1728 * v2);
  v14 = v16;
  v15 = 0;
  if (v13)
  {
    v31 = v16;
    v32 = v13;
    if (v16)
      goto LABEL_7;
  }
LABEL_32:
  OPENSSL_free(v13);
  OPENSSL_free(v14);
  return v15;
}

uint64_t *compute_precomp(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  __int128 v6;
  uint64_t i;
  uint64_t *result;
  _OWORD v9[13];
  unint64_t v10;

  ec_GFp_simple_point_copy(a2, (uint64_t)a3);
  v10 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v9[11] = v6;
  v9[12] = v6;
  v9[9] = v6;
  v9[10] = v6;
  v9[7] = v6;
  v9[8] = v6;
  v9[5] = v6;
  v9[6] = v6;
  v9[3] = v6;
  v9[4] = v6;
  v9[1] = v6;
  v9[2] = v6;
  v9[0] = v6;
  ec_GFp_mont_dbl(a1, (unint64_t *)v9, a3);
  for (i = 0; i != 1512; i += 216)
    result = ec_GFp_mont_add(a1, a2 + i + 216, a2 + i, (uint64_t)v9);
  return result;
}

void lookup_precomp(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if ((a4 & 0x80000000) != 0)
  {
    ec_GFp_simple_point_copy(a2, a3 + 216 * (-a4 >> 1));
    ec_GFp_simple_invert(a1, a2);
  }
  else
  {
    ec_GFp_simple_point_copy(a2, a3 + 216 * (a4 >> 1));
  }
}

uint64_t EVP_tls_cbc_remove_padding(uint64_t *a1, _QWORD *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char v12;
  char v13;
  uint64_t v14;

  if (a6 + 1 > a4)
    return 0;
  v7 = *(unsigned __int8 *)(a3 + a4 - 1);
  v8 = (uint64_t)(((a4 - (a6 + 1 + v7)) ^ a4 | (a6 + 1 + v7) ^ a4) ^ ~a4) >> 63;
  v9 = 256;
  if (a4 < 0x100)
    v9 = a4;
  if (v9)
  {
    v10 = 0;
    v11 = (char *)(a3 + a4 - 1);
    do
    {
      v12 = *v11--;
      v13 = v12 ^ ~(_BYTE)v7;
      if (v10 > v7)
        v13 = -1;
      LOBYTE(v8) = v13 & v8;
      ++v10;
    }
    while (v9 != v10);
  }
  if ((_BYTE)v8 == 0xFF)
    v14 = -1;
  else
    v14 = 0;
  *a2 = a4 - ((v7 + 1) & v14);
  *a1 = v14;
  return 1;
}

void *EVP_tls_cbc_copy_mac(void *a1, size_t a2, uint64_t a3, size_t a4, unint64_t a5)
{
  unint64_t v5;
  __int128 v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  size_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  size_t v20;
  size_t v21;
  uint64_t v22;
  __int128 v24;
  _OWORD *v25;
  _OWORD *v26;
  unint64_t v27;
  uint64_t v28;
  _OWORD *v29;
  size_t v30;
  size_t v31;
  size_t v32;
  _OWORD *v33;
  _OWORD v35[4];
  _OWORD __src[4];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a5 - a4;
  if (a5 < a4)
    EVP_tls_cbc_copy_mac_cold_1();
  if (a4 < a2)
    EVP_tls_cbc_copy_mac_cold_2();
  if (a2 >= 0x41)
    EVP_tls_cbc_copy_mac_cold_3();
  if (!a2)
    EVP_tls_cbc_copy_mac_cold_4();
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  __src[2] = v11;
  __src[3] = v11;
  __src[0] = v11;
  __src[1] = v11;
  v12 = a2 + 256;
  if (a5 >= a2 + 256)
    v13 = a5 - (a2 + 256);
  else
    v13 = 0;
  __memset_chk();
  v14 = 0;
  if (v13 < a5)
  {
    v15 = 0;
    LOBYTE(v16) = 0;
    v14 = 0;
    if (a5 >= v12)
      v17 = a2 + 256;
    else
      v17 = a5;
    v18 = -(uint64_t)v17;
    do
    {
      v19 = a5 + v18;
      if (v15 >= a2)
        v20 = a2;
      else
        v20 = 0;
      v21 = v15 - v20;
      v22 = ((v19 ^ (a4 - a2)) - 1) & ~(v19 ^ (a4 - a2));
      v16 = v16 | (unint64_t)(v22 >> 63);
      *((_BYTE *)__src + v21) |= ((uint64_t)(((v5 + v18) ^ v19 | v19 ^ a4) ^ v19) >> 63) & *(_BYTE *)(a3 + a5 + v18) & v16;
      v14 |= v21 & (v22 >> 63);
      v15 = v21 + 1;
    }
    while (!__CFADD__(v18++, 1));
  }
  *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v35[2] = v24;
  v35[3] = v24;
  v35[0] = v24;
  v35[1] = v24;
  if (a2 < 2)
  {
    v33 = __src;
  }
  else
  {
    v25 = v35;
    v26 = __src;
    v27 = 1;
    do
    {
      v28 = 0;
      v29 = v26;
      v30 = v27;
      do
      {
        if (v30 >= a2)
          v31 = a2;
        else
          v31 = 0;
        v32 = v30 - v31;
        *((_BYTE *)v25 + v28) = ~((v14 & 1) - 1) & *((_BYTE *)v26 + v32) | ((v14 & 1) - 1) & *((_BYTE *)v26 + v28);
        ++v28;
        v30 = v32 + 1;
      }
      while (a2 != v28);
      v27 *= 2;
      v14 >>= 1;
      v33 = v25;
      v26 = v25;
      v25 = v29;
    }
    while (v27 < a2);
  }
  return memcpy(a1, v33, a2);
}

BOOL EVP_tls_cbc_record_digest_supported(const EVP_MD *a1)
{
  int v1;

  v1 = EVP_MD_type(a1);
  return (v1 - 672) < 2 || v1 == 64;
}

uint64_t EVP_tls_cbc_digest_record(const EVP_MD *a1, unsigned __int8 *a2, _QWORD *a3, _QWORD *a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, unsigned int a9)
{
  __int128 v14;
  int v15;
  unsigned int v16;
  int v17;
  char v18;
  unsigned int v19;
  void (__cdecl *v20)(SHA_CTX *, const unsigned __int8 *);
  unint64_t v21;
  size_t v22;
  uint64_t v23;
  unint64_t v24;
  BOOL v25;
  unint64_t v26;
  __int128 v27;
  unsigned int v28;
  uint64_t v29;
  unint64_t v30;
  unsigned int v31;
  unint64_t v32;
  size_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  int8x16_t v39;
  int v40;
  __int128 v41;
  uint64_t v42;
  const unsigned __int8 *v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  char v52;
  char v53;
  unint64_t v54;
  char *v55;
  char v56;
  char v57;
  char v58;
  char v59;
  char v60;
  uint64_t v61;
  __int128 v62;
  unint64_t v63;
  int8x16_t v64;
  unsigned __int8 *md;
  _QWORD *v67;
  EVP_MD *type;
  unsigned int v69;
  unint64_t v70;
  unint64_t v71;
  char v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  void (*v76)(uint64_t, _BYTE *);
  void (__cdecl *v78)(SHA_CTX *, const unsigned __int8 *);
  unint64_t v79;
  unint64_t v81;
  unsigned int s;
  _OWORD v83[4];
  _BYTE ctx[128];
  _QWORD v85[2];
  _OWORD d[8];
  SHA512_CTX c;
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  if (a7 >= 0x100000)
    EVP_tls_cbc_digest_record_cold_1();
  *(_QWORD *)&c.num = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.u.p[96] = v14;
  *(_OWORD *)&c.u.p[112] = v14;
  *(_OWORD *)&c.u.p[64] = v14;
  *(_OWORD *)&c.u.p[80] = v14;
  *(_OWORD *)&c.u.p[32] = v14;
  *(_OWORD *)&c.u.p[48] = v14;
  *(_OWORD *)c.u.d = v14;
  *(_OWORD *)&c.u.p[16] = v14;
  *(_OWORD *)&c.h[6] = v14;
  *(_OWORD *)&c.Nl = v14;
  *(_OWORD *)&c.h[2] = v14;
  *(_OWORD *)&c.h[4] = v14;
  *(_OWORD *)c.h = v14;
  v15 = EVP_MD_type(a1);
  switch(v15)
  {
    case 673:
      SHA384_Init(&c);
      v76 = (void (*)(uint64_t, _BYTE *))tls1_sha512_final_raw;
      v16 = 48;
      v17 = 16;
      v18 = 7;
      v19 = 128;
      v20 = (void (__cdecl *)(SHA_CTX *, const unsigned __int8 *))tls1_sha512_transform;
      break;
    case 672:
      SHA256_Init((SHA256_CTX *)&c);
      v76 = (void (*)(uint64_t, _BYTE *))tls1_sha256_final_raw;
      v16 = 32;
      v17 = 8;
      v18 = 6;
      v19 = 64;
      v20 = (void (__cdecl *)(SHA_CTX *, const unsigned __int8 *))tls1_sha256_transform;
      break;
    case 64:
      SHA1_Init((SHA_CTX *)&c);
      v76 = (void (*)(uint64_t, _BYTE *))tls1_sha1_final_raw;
      v16 = 20;
      v17 = 8;
      v18 = 6;
      v19 = 64;
      v20 = tls1_sha1_transform;
      break;
    default:
      EVP_tls_cbc_digest_record_cold_2();
  }
  if (v19 != 1 << v18)
    EVP_tls_cbc_digest_record_cold_4();
  v72 = v18;
  v74 = a6;
  v67 = a3;
  type = (EVP_MD *)a1;
  v21 = a7 + 13;
  v22 = v19;
  v23 = v19 - 1;
  v79 = v21;
  v24 = ((_DWORD)v23 + (_DWORD)v21 + v17 - v16) / v19;
  v70 = ((v16 | v19) + 255) / v19 + 1;
  v25 = v24 >= v70;
  v26 = v24 - v70;
  *(_QWORD *)&v27 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v27 + 1) = 0xAAAAAAAAAAAAAAAALL;
  d[6] = v27;
  d[7] = v27;
  d[4] = v27;
  d[5] = v27;
  d[2] = v27;
  d[3] = v27;
  v28 = v19;
  v29 = v26 * v19;
  if (v25)
    v30 = v26;
  else
    v30 = 0;
  v31 = v17;
  if (v26 != 0 && v25)
    v32 = v29;
  else
    v32 = 0;
  d[0] = v27;
  d[1] = v27;
  __memset_chk();
  if (a9 >= 0x81)
    EVP_tls_cbc_digest_record_cold_3();
  v78 = v20;
  md = a2;
  v33 = v16;
  v34 = v74 - v16 + 13;
  v69 = v31;
  v35 = v34 + v31;
  if (a9)
    __memcpy_chk();
  v36 = 0;
  v37 = v34 & v23;
  v38 = v34 >> v72;
  v73 = v35 >> v72;
  v75 = v38;
  v39.i64[0] = 0x3636363636363636;
  v39.i64[1] = 0x3636363636363636;
  v40 = 8 * v28 + 8 * v34;
  do
  {
    d[v36 / 0x10] = veorq_s8((int8x16_t)d[v36 / 0x10], v39);
    v36 += 16;
  }
  while (v22 != v36);
  v78((SHA_CTX *)&c, (const unsigned __int8 *)d);
  v85[0] = 0xAAAAAAAAAAAAAAAALL;
  v85[1] = 0xAAAAAAAAAAAAAAAALL;
  __memset_chk();
  *((_BYTE *)v85 + v69 - 4) = HIBYTE(v40);
  *((_BYTE *)v85 + v69 - 3) = BYTE2(v40);
  *((_BYTE *)v85 + v69 - 2) = BYTE1(v40);
  *((_BYTE *)v85 + v69 - 1) = 8 * v34;
  if (v32)
  {
    *(_DWORD *)&ctx[124] = -1431655766;
    *(_QWORD *)&v41 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&ctx[109] = v41;
    *(_OWORD *)&ctx[93] = v41;
    *(_OWORD *)&ctx[77] = v41;
    *(_OWORD *)&ctx[61] = v41;
    *(_OWORD *)&ctx[45] = v41;
    *(_OWORD *)&ctx[29] = v41;
    *(_QWORD *)ctx = *a4;
    *(_QWORD *)&ctx[5] = *(_QWORD *)((char *)a4 + 5);
    *(_OWORD *)&ctx[13] = v41;
    __memcpy_chk();
    v78((SHA_CTX *)&c, ctx);
    if (v32 / v22 >= 2)
    {
      v42 = v32 / v22 - 1;
      v43 = (const unsigned __int8 *)(v22 + a5 - 13);
      do
      {
        v78((SHA_CTX *)&c, v43);
        v43 += v22;
        --v42;
      }
      while (v42);
    }
  }
  memset(v83, 0, sizeof(v83));
  v71 = v30 + v70;
  v44 = v28 - v69;
  v46 = v79;
  v45 = a5;
  do
  {
    v47 = 0;
    *(_QWORD *)&v48 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&ctx[96] = v48;
    *(_OWORD *)&ctx[112] = v48;
    *(_OWORD *)&ctx[64] = v48;
    *(_OWORD *)&ctx[80] = v48;
    *(_OWORD *)&ctx[32] = v48;
    *(_OWORD *)&ctx[48] = v48;
    *(_OWORD *)ctx = v48;
    *(_OWORD *)&ctx[16] = v48;
    v49 = (uint64_t)(((v30 ^ v75) - 1) & ~(v30 ^ v75)) >> 63;
    v81 = v30;
    v50 = (uint64_t)(((v30 ^ v73) - 1) & ~(v30 ^ v73)) >> 63;
    v51 = v49;
    v52 = ~(_BYTE)v49;
    v53 = v49 | ~(_BYTE)v50;
    v54 = v32;
    do
    {
      if (v32 + v47 <= 0xC)
      {
        v55 = (char *)a4 + v32 + v47;
LABEL_30:
        v56 = *v55;
        goto LABEL_32;
      }
      if (v32 + v47 < v46)
      {
        v55 = (char *)(v54 + v45 - 13);
        goto LABEL_30;
      }
      v56 = 0;
LABEL_32:
      if (v47 >= v37)
        v57 = v51;
      else
        v57 = 0;
      v58 = ~v57 & v56 | v57 & 0x80;
      if (v47 <= v37)
        v59 = -1;
      else
        v59 = v52;
      v60 = v59 & v53 & v58;
      if (v47 >= v44)
        v60 = ~(_BYTE)v50 & v60 | v50 & *((_BYTE *)v85 + v47 - v44);
      ctx[v47++] = v60;
      ++v54;
    }
    while (v22 != v47);
    v78((SHA_CTX *)&c, ctx);
    v76((uint64_t)&c, ctx);
    v61 = 0;
    v32 += v47;
    do
    {
      *((_BYTE *)v83 + v61) |= ctx[v61] & v50;
      ++v61;
    }
    while (v33 != v61);
    v45 = a5;
    v30 = v81 + 1;
    v46 = v79;
  }
  while (v81 + 1 <= v71);
  *(_QWORD *)&v62 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v62 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)ctx = v62;
  *(_OWORD *)&ctx[16] = v62;
  EVP_MD_CTX_init((EVP_MD_CTX *)ctx);
  if (EVP_DigestInit_ex((EVP_MD_CTX *)ctx, type, 0))
  {
    v63 = 0;
    v64.i64[0] = 0x6A6A6A6A6A6A6A6ALL;
    v64.i64[1] = 0x6A6A6A6A6A6A6A6ALL;
    do
    {
      d[v63 / 0x10] = veorq_s8((int8x16_t)d[v63 / 0x10], v64);
      v63 += 16;
    }
    while (v22 != v63);
    EVP_DigestUpdate((EVP_MD_CTX *)ctx, d, v22);
    EVP_DigestUpdate((EVP_MD_CTX *)ctx, v83, v33);
    s = -1431655766;
    EVP_DigestFinal((EVP_MD_CTX *)ctx, md, &s);
    *v67 = s;
    EVP_MD_CTX_cleanup((EVP_MD_CTX *)ctx);
    return 1;
  }
  else
  {
    EVP_MD_CTX_cleanup((EVP_MD_CTX *)ctx);
    return 0;
  }
}

uint64_t tls1_sha1_final_raw(uint64_t result, _BYTE *a2)
{
  *a2 = *(_BYTE *)(result + 3);
  a2[1] = *(_WORD *)(result + 2);
  a2[2] = BYTE1(*(_DWORD *)result);
  a2[3] = *(_DWORD *)result;
  a2[4] = *(_BYTE *)(result + 7);
  a2[5] = *(_WORD *)(result + 6);
  a2[6] = BYTE1(*(_DWORD *)(result + 4));
  a2[7] = *(_DWORD *)(result + 4);
  a2[8] = *(_BYTE *)(result + 11);
  a2[9] = *(_WORD *)(result + 10);
  a2[10] = BYTE1(*(_DWORD *)(result + 8));
  a2[11] = *(_DWORD *)(result + 8);
  a2[12] = *(_BYTE *)(result + 15);
  a2[13] = *(_WORD *)(result + 14);
  a2[14] = BYTE1(*(_DWORD *)(result + 12));
  a2[15] = *(_DWORD *)(result + 12);
  a2[16] = *(_BYTE *)(result + 19);
  a2[17] = *(_WORD *)(result + 18);
  a2[18] = BYTE1(*(_DWORD *)(result + 16));
  a2[19] = *(_DWORD *)(result + 16);
  return result;
}

uint64_t tls1_sha256_final_raw(uint64_t result, uint64_t a2)
{
  uint64_t i;
  _BYTE *v3;

  for (i = 0; i != 32; i += 4)
  {
    v3 = (_BYTE *)(a2 + i);
    *v3 = *(_BYTE *)(result + i + 3);
    v3[1] = *(_WORD *)(result + i + 2);
    v3[2] = BYTE1(*(_DWORD *)(result + i));
    v3[3] = *(_DWORD *)(result + i);
  }
  return result;
}

uint64_t tls1_sha512_final_raw(uint64_t result, uint64_t a2)
{
  uint64_t i;
  _BYTE *v3;

  for (i = 0; i != 64; i += 8)
  {
    v3 = (_BYTE *)(a2 + i);
    *v3 = *(_BYTE *)(result + i + 7);
    v3[1] = *(_WORD *)(result + i + 6);
    v3[2] = (unsigned __int16)WORD2(*(_QWORD *)(result + i)) >> 8;
    v3[3] = *(_DWORD *)(result + i + 4);
    v3[4] = BYTE3(*(_QWORD *)(result + i));
    v3[5] = BYTE2(*(_QWORD *)(result + i));
    v3[6] = BYTE1(*(_QWORD *)(result + i));
    v3[7] = *(_QWORD *)(result + i);
  }
  return result;
}

int *bssl::ssl_reset_error_state(bssl *this, ssl_st *a2)
{
  *(_DWORD *)(*((_QWORD *)this + 6) + 196) = 0;
  ERR_clear_error();
  return ERR_clear_system_error();
}

void bssl::ssl_set_read_error(bssl *this, ssl_st *a2)
{
  uint64_t v2;
  uint64_t *v3;
  _QWORD *v4;

  v2 = *((_QWORD *)this + 6);
  *(_DWORD *)(v2 + 172) = 2;
  v3 = (uint64_t *)(v2 + 184);
  v4 = ERR_save_state();
  std::unique_ptr<err_save_state_st,bssl::internal::Deleter>::reset[abi:ne180100](v3, (uint64_t)v4);
}

BOOL bssl::cbb_add_hex(uint64_t a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v3;
  int v5;
  unsigned int v6;
  char v7;
  char *v8;
  char v9;
  char *v10;
  unint64_t v12;

  v3 = a3;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  v5 = CBB_add_space(a1, &v12, 2 * a3);
  if (v5 && v3)
  {
    do
    {
      v6 = *a2++;
      v7 = bssl::cbb_add_hex(cbb_st *,bssl::Span<unsigned char const>)::hextable[(unint64_t)v6 >> 4];
      v8 = (char *)v12++;
      *v8 = v7;
      v9 = bssl::cbb_add_hex(cbb_st *,bssl::Span<unsigned char const>)::hextable[v6 & 0xF];
      v10 = (char *)v12++;
      *v10 = v9;
      --v3;
    }
    while (v3);
  }
  return v5 != 0;
}

uint64_t ssl_session_hash(const ssl_session_st *a1)
{
  return bssl::ssl_hash_session_id((int *)&a1->session_id_length, *(unsigned int *)&a1->master_key[44]);
}

uint64_t ssl_session_cmp(const ssl_session_st *a1, const ssl_session_st *a2)
{
  size_t v2;

  v2 = *(unsigned int *)&a1->master_key[44];
  if ((_DWORD)v2 != *(_DWORD *)&a2->master_key[44])
    return 1;
  if ((_DWORD)v2)
    return memcmp(&a1->session_id_length, &a2->session_id_length, v2);
  return 0;
}

uint64_t SSL_CTX_up_ref(uint64_t a1)
{
  CRYPTO_refcount_inc((unsigned int *)(a1 + 328));
  return 1;
}

void std::unique_ptr<bssl::SSL_CONFIG,bssl::internal::Deleter>::reset[abi:ne180100](STACK ***a1, STACK **a2)
{
  STACK **v3;
  _QWORD *v4;

  v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    bssl::SSL_CONFIG::~SSL_CONFIG(v3);
    OPENSSL_free(v4);
  }
}

void SSL_set_accept_state(SSL *s)
{
  BYTE4(s->param) |= 1u;
  *(_QWORD *)&s->rwstate = bssl::ssl_server_handshake;
}

uint64_t SSL_generate_authenticator(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, unsigned __int8 **a5)
{
  uint64_t v5;
  uint64_t v6;
  bssl *session;
  const ssl_session_st *v12;
  const EVP_MD *digest;
  size_t v14;
  char *v15;
  size_t v16;
  char *v17;
  unint64_t *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  unsigned __int8 *v25;
  _QWORD *v26;
  _OWORD v27[3];
  _OWORD v28[3];
  size_t v29;
  void *v30;
  unsigned int md_len;
  EVP_MD_CTX v32;
  unsigned int n[3];
  void *v34;
  EVP_MD_CTX ctx;
  unsigned int s;
  unsigned __int8 *v37;
  void *v38;
  unsigned __int8 v39[16];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  unsigned __int8 v43[16];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  unsigned __int8 md[16];
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD key[4];
  _OWORD d[4];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v5 + 280) || !*(_QWORD *)(v5 + 288))
    return 0;
  session = (bssl *)SSL_get_session((const SSL *)a1);
  digest = bssl::ssl_session_get_digest(session, v12);
  v14 = EVP_MD_size(digest);
  memset(d, 0, sizeof(d));
  v15 = (*(_BYTE *)(a1 + 180) & 1) != 0
      ? "EXPORTER-server authenticator handshake context"
      : "EXPORTER-client authenticator handshake context";
  if (!SSL_export_keying_material((bssl *)a1, (ssl_st *)d, v14, v15, 0x2FuLL, 0, 0, 0))
    return 0;
  v16 = EVP_MD_size(digest);
  memset(key, 0, sizeof(key));
  v17 = (*(_BYTE *)(a1 + 180) & 1) != 0
      ? "EXPORTER-server authenticator finished key"
      : "EXPORTER-client authenticator finished key";
  if (!SSL_export_keying_material((bssl *)a1, (ssl_st *)key, v16, v17, 0x2AuLL, 0, 0, 0))
    return 0;
  v37 = 0;
  v38 = 0;
  v19 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(*(_QWORD *)(v19 + 288) + 8) = *(_QWORD *)(a1 + 8);
  if (!bssl::tls13_add_certificate_in_buffer(*(bssl **)(v19 + 288), (bssl::SSL_HANDSHAKE *)1, &v38, &v37, v18))
  {
    OPENSSL_free(v38);
    return 0;
  }
  *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v49 = v20;
  v50 = v20;
  *(_OWORD *)md = v20;
  v48 = v20;
  s = -1431655766;
  *(_OWORD *)&ctx.digest = v20;
  *(_OWORD *)&ctx.flags = v20;
  EVP_MD_CTX_init(&ctx);
  EVP_DigestInit_ex(&ctx, digest, 0);
  EVP_DigestUpdate(&ctx, d, v14);
  EVP_DigestUpdate(&ctx, v38, (size_t)v37);
  EVP_DigestFinal_ex(&ctx, md, &s);
  EVP_MD_CTX_cleanup(&ctx);
  *(_QWORD *)&n[1] = 0;
  v34 = 0;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 288) + 1600) &= ~0x2000000u;
  if (bssl::tls13_add_certificate_verify_in_buffer(*(EVP_PKEY ***)(*(_QWORD *)(a1 + 48) + 288), (bssl::SSL_HANDSHAKE *)1, (unsigned __int16 *)&v34, (unsigned __int8 **)&n[1], (unint64_t *)md, (const unsigned __int8 *)s))
  {
    OPENSSL_free(v38);
    OPENSSL_free(v34);
    return 0;
  }
  *(_QWORD *)&v21 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v21 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v45 = v21;
  v46 = v21;
  *(_OWORD *)v43 = v21;
  v44 = v21;
  n[0] = -1431655766;
  *(_OWORD *)&v32.digest = v21;
  *(_OWORD *)&v32.flags = v21;
  EVP_MD_CTX_init(&v32);
  EVP_DigestInit_ex(&v32, digest, 0);
  EVP_DigestUpdate(&v32, d, v14);
  EVP_DigestUpdate(&v32, v38, (size_t)v37);
  EVP_DigestUpdate(&v32, v34, *(size_t *)&n[1]);
  EVP_DigestFinal_ex(&v32, v43, n);
  EVP_MD_CTX_cleanup(&v32);
  md_len = -1431655766;
  *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v41 = v22;
  v42 = v22;
  *(_OWORD *)v39 = v22;
  v40 = v22;
  if (!HMAC(digest, key, v16, v43, n[0], v39, &md_len))
  {
    OPENSSL_free(v38);
    OPENSSL_free(v34);
    return 0;
  }
  v29 = 0;
  v30 = 0;
  *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28[1] = v23;
  v28[2] = v23;
  v28[0] = v23;
  CBB_zero(v28);
  *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[1] = v24;
  v27[2] = v24;
  v27[0] = v24;
  if ((*(unsigned int (**)(uint64_t, _OWORD *, _OWORD *, uint64_t))(*(_QWORD *)a1 + 88))(a1, v28, v27, 20)
    && CBB_add_bytes((uint64_t)v27, v39, md_len)
    && CBB_finish((uint64_t)v28, &v30, &v29))
  {
    v25 = &v37[*(_QWORD *)&n[1] + v29];
    *a5 = v25;
    v26 = OPENSSL_malloc((unint64_t)v25);
    *a4 = v26;
    memcpy(v26, v38, (size_t)v37);
    memcpy(&v37[*a4], v34, *(size_t *)&n[1]);
    memcpy(&v37[*a4 + *(_QWORD *)&n[1]], v30, v29);
    OPENSSL_free(v38);
    OPENSSL_free(v34);
    OPENSSL_free(v30);
    v6 = 1;
  }
  else
  {
    OPENSSL_free(v38);
    OPENSSL_free(v34);
    OPENSSL_free(v30);
    v6 = 0;
  }
  CBB_cleanup((uint64_t)v28);
  return v6;
}

void sub_1B4FDAE14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

uint64_t SSL_validate_authenticator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t result;
  bssl *session;
  const ssl_session_st *v9;
  const EVP_MD *digest;
  size_t v11;
  const char *v12;
  size_t v13;
  char *v14;
  __int128 v15;
  __int128 v16;
  int v17;
  __int128 v18;
  int v19;
  SSL_SESSION **v20;
  SSL_SESSION *v21;
  int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unsigned int md_len;
  EVP_MD_CTX v27;
  unsigned int n;
  EVP_MD_CTX n_4;
  unsigned int s;
  _OWORD v31[2];
  unint64_t v32;
  __int128 v33;
  __int128 v34;
  size_t v35;
  __int128 v36;
  __int128 v37;
  size_t v38;
  uint64_t v39[2];
  _OWORD v40[4];
  _OWORD v41[4];
  _OWORD md[4];
  _BYTE key[64];
  _BYTE d[72];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 48);
  if (*(_QWORD *)(v3 + 280) || !*(_QWORD *)(v3 + 288))
    return 0;
  session = (bssl *)SSL_get_session((const SSL *)a1);
  digest = bssl::ssl_session_get_digest(session, v9);
  v11 = EVP_MD_size(digest);
  memset(d, 0, 64);
  if ((*(_BYTE *)(a1 + 180) & 1) != 0)
    v12 = "EXPORTER-client authenticator handshake context";
  else
    v12 = "EXPORTER-server authenticator handshake context";
  result = SSL_export_keying_material((bssl *)a1, (ssl_st *)d, v11, v12, 0x2FuLL, 0, 0, 0);
  if ((_DWORD)result)
  {
    v13 = EVP_MD_size(digest);
    memset(key, 0, sizeof(key));
    v14 = (*(_BYTE *)(a1 + 180) & 1) != 0
        ? "EXPORTER-client authenticator finished key"
        : "EXPORTER-server authenticator finished key";
    result = SSL_export_keying_material((bssl *)a1, (ssl_st *)key, v13, v14, 0x2AuLL, 0, 0, 0);
    if ((_DWORD)result)
    {
      v39[0] = a2;
      v39[1] = a3;
      v38 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v36 = v15;
      v37 = v15;
      result = parse_handshake_message(v39, (uint64_t)&v36);
      if ((_DWORD)result)
      {
        if (BYTE1(v36) == 25 || BYTE1(v36) == 11)
        {
          v35 = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
          v33 = v16;
          v34 = v16;
          v17 = parse_handshake_message(v39, (uint64_t)&v33);
          result = 0;
          if (v17)
          {
            if (BYTE1(v33) == 15)
            {
              v32 = 0xAAAAAAAAAAAAAAAALL;
              *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
              *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
              v31[0] = v18;
              v31[1] = v18;
              v19 = parse_handshake_message(v39, (uint64_t)v31);
              result = 0;
              if (v19)
              {
                if (BYTE1(v31[0]) == 20)
                {
                  bssl::SSL_SESSION_dup(*(bssl **)(*(_QWORD *)(a1 + 48) + 472), (ssl_session_st *)2, md);
                  v20 = (SSL_SESSION **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 288) + 1536);
                  v21 = *(SSL_SESSION **)&md[0];
                  *(_QWORD *)&md[0] = 0;
                  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100](v20, v21);
                  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)md, 0);
                  v22 = bssl::tls13_process_certificate(*(uint64_t **)(*(_QWORD *)(a1 + 48) + 288), (uint64_t)&v36, 0);
                  result = 0;
                  if (v22)
                  {
                    *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
                    *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
                    md[2] = v23;
                    md[3] = v23;
                    md[0] = v23;
                    md[1] = v23;
                    s = -1431655766;
                    *(_OWORD *)&n_4.digest = v23;
                    *(_OWORD *)&n_4.flags = v23;
                    EVP_MD_CTX_init(&n_4);
                    EVP_DigestInit_ex(&n_4, digest, 0);
                    EVP_DigestUpdate(&n_4, d, v11);
                    EVP_DigestUpdate(&n_4, *((const void **)&v37 + 1), v38);
                    EVP_DigestFinal_ex(&n_4, (unsigned __int8 *)md, &s);
                    EVP_MD_CTX_cleanup(&n_4);
                    result = bssl::tls13_process_certificate_verify_with_transcript(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 288), (uint64_t)&v33, 1, md, s);
                    if ((_DWORD)result)
                    {
                      *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
                      *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
                      v41[2] = v24;
                      v41[3] = v24;
                      v41[0] = v24;
                      v41[1] = v24;
                      n = -1431655766;
                      *(_OWORD *)&v27.digest = v24;
                      *(_OWORD *)&v27.flags = v24;
                      EVP_MD_CTX_init(&v27);
                      EVP_DigestInit_ex(&v27, digest, 0);
                      EVP_DigestUpdate(&v27, d, v11);
                      EVP_DigestUpdate(&v27, *((const void **)&v37 + 1), v38);
                      EVP_DigestUpdate(&v27, *((const void **)&v34 + 1), v35);
                      EVP_DigestFinal_ex(&v27, (unsigned __int8 *)v41, &n);
                      EVP_MD_CTX_cleanup(&v27);
                      md_len = -1431655766;
                      *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
                      *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
                      v40[2] = v25;
                      v40[3] = v25;
                      v40[0] = v25;
                      v40[1] = v25;
                      result = (uint64_t)HMAC(digest, key, v13, (const unsigned __int8 *)v41, n, (unsigned __int8 *)v40, &md_len);
                      if (result)
                        return CBS_mem_equal((uint64_t)v31 + 8, (char *)v40, md_len);
                    }
                  }
                }
              }
            }
          }
          return result;
        }
        return 0;
      }
    }
  }
  return result;
}

uint64_t parse_handshake_message(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  unsigned int v6;

  v4 = CBS_data((uint64_t)a1);
  result = CBS_get_u8(a1, (_BYTE *)(a2 + 1));
  if ((_DWORD)result)
  {
    v6 = -1431655766;
    result = CBS_get_u24(a1, (int *)&v6);
    if ((_DWORD)result)
    {
      result = CBS_get_bytes(a1, (_QWORD *)(a2 + 8), v6);
      if ((_DWORD)result)
      {
        CBS_init((_QWORD *)(a2 + 24), v4, v6 + 4);
        return 1;
      }
    }
  }
  return result;
}

int SSL_accept(SSL *ssl)
{
  if (!*(_QWORD *)&ssl->rwstate)
  {
    BYTE4(ssl->param) |= 1u;
    *(_QWORD *)&ssl->rwstate = bssl::ssl_server_handshake;
  }
  return SSL_do_handshake(ssl);
}

uint64_t SSL_set_quic_early_data_context(uint64_t a1, const void *a2, unint64_t a3)
{
  uint64_t v3;
  void **v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return 0;
  v6 = (void **)(v3 + 256);
  v7 = bssl::Array<unsigned char>::Init(v3 + 256, a3);
  v8 = v7;
  if (a3 && (_DWORD)v7)
    memcpy(*v6, a2, a3);
  return v8;
}

uint64_t SSL_get_quic_early_data_context(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  result = *(_QWORD *)(v2 + 256);
  *a2 = *(_QWORD *)(v2 + 264);
  return result;
}

uint64_t SSL_CTX_set_early_data_enabled(uint64_t result, int a2)
{
  *(_WORD *)(result + 840) = *(_WORD *)(result + 840) & 0xFBFF | ((a2 != 0) << 10);
  return result;
}

void SSL_reset_early_data_reject(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 280);
  if (!v1 || *(_DWORD *)(v1 + 16) != 13)
    abort();
  *(_DWORD *)(v1 + 16) = 1;
  *(_DWORD *)(v1 + 1600) &= ~0x800u;
  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)(v1 + 1544), 0);
  v3 = *(_QWORD *)(a1 + 48);
  *(_QWORD *)(v3 + 152) = 0;
  *(_QWORD *)(v3 + 160) = 0;
}

uint64_t SSL_CTX_set_options(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  v2 = *(_DWORD *)(a1 + 416) | a2;
  *(_DWORD *)(a1 + 416) = v2;
  return v2;
}

uint64_t SSL_CTX_clear_options(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = *(_DWORD *)(a1 + 416) & ~a2;
  *(_DWORD *)(a1 + 416) = v2;
  return v2;
}

uint64_t SSL_CTX_set_mode(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  v2 = *(_DWORD *)(a1 + 420) | a2;
  *(_DWORD *)(a1 + 420) = v2;
  return v2;
}

uint64_t SSL_CTX_clear_mode(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = *(_DWORD *)(a1 + 420) & ~a2;
  *(_DWORD *)(a1 + 420) = v2;
  return v2;
}

uint64_t SSL_CTX_get_mode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 420);
}

uint64_t SSL_set_mode(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  v2 = *(_DWORD *)(a1 + 148) | a2;
  *(_DWORD *)(a1 + 148) = v2;
  return v2;
}

void SSL_certs_clear(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1)
    bssl::ssl_cert_clear_certs(*(_QWORD *)(v1 + 32));
}

int SSL_renegotiate(SSL *s)
{
  const ssl_st *v1;
  int v2;
  int v3;
  const ssl_st *v5;
  BOOL can_renegotiate;
  int (__cdecl *handshake_func)(SSL *);
  uint64_t v8;
  bssl::SSL_HANDSHAKE **v10;
  bssl::SSL_HANDSHAKE *v11;
  int (__cdecl *v12)(SSL *);
  bssl::SSL_HANDSHAKE *v13;

  if ((*((_WORD *)s->handshake_func + 110) & 0x2000) == 0)
  {
    v2 = 66;
    v3 = 2011;
LABEL_11:
    ERR_put_error(16, 0, v2, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_lib.cc", v3);
    return 0;
  }
  if (!bssl::ssl_can_renegotiate((bssl *)s, v1))
  {
    v2 = 182;
    v3 = 2016;
    goto LABEL_11;
  }
  can_renegotiate = bssl::ssl_can_renegotiate((bssl *)s, v5);
  handshake_func = s->handshake_func;
  if (!can_renegotiate)
  {
    v8 = *((_QWORD *)handshake_func + 35);
    if (!v8 || (*(_BYTE *)(v8 + 1603) & 2) != 0)
      SSL_renegotiate_cold_1();
  }
  if (*((_WORD *)handshake_func + 58) || *((_DWORD *)handshake_func + 44))
  {
    v2 = 182;
    v3 = 2029;
    goto LABEL_11;
  }
  if (*((_QWORD *)handshake_func + 35))
  {
    v2 = 68;
    v3 = 2035;
    goto LABEL_11;
  }
  bssl::ssl_handshake_new(s, &v13);
  v10 = (bssl::SSL_HANDSHAKE **)((char *)s->handshake_func + 280);
  v11 = v13;
  v13 = 0;
  std::unique_ptr<bssl::SSL_HANDSHAKE,bssl::internal::Deleter>::reset[abi:ne180100](v10, v11);
  std::unique_ptr<bssl::SSL_HANDSHAKE,bssl::internal::Deleter>::reset[abi:ne180100](&v13, 0);
  v12 = s->handshake_func;
  if (*((_QWORD *)v12 + 35))
  {
    *((_WORD *)v12 + 110) &= ~0x2000u;
    ++*((_DWORD *)s->handshake_func + 48);
    return 1;
  }
  return 0;
}

BOOL bssl::ssl_can_renegotiate(bssl *this, const ssl_st *a2)
{
  _BOOL8 result;

  if ((*((_BYTE *)this + 180) & 1) != 0
    || **(_BYTE **)this
    || (*(_WORD *)(*((_QWORD *)this + 6) + 220) & 2) != 0
    && bssl::ssl_protocol_version(this, a2) > 0x303
    || !*((_QWORD *)this + 1))
  {
    return 0;
  }
  result = 0;
  switch(*((_DWORD *)this + 44))
  {
    case 0:
    case 3:
      return result;
    case 1:
      result = *(_DWORD *)(*((_QWORD *)this + 6) + 192) == 0;
      break;
    case 2:
    case 4:
      result = 1;
      break;
    default:
      bssl::ssl_can_renegotiate();
  }
  return result;
}

uint64_t SSL_set_mtu(bssl *a1, unsigned int a2)
{
  if (!**(_BYTE **)a1 || bssl::dtls1_min_mtu(a1) > a2)
    return 0;
  *(_DWORD *)(*((_QWORD *)a1 + 7) + 280) = a2;
  return 1;
}

uint64_t SSL_CTX_sess_get_cache_size(uint64_t a1)
{
  return *(_QWORD *)(a1 + 264);
}

uint64_t SSL_CTX_set_tlsext_ticket_keys(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  uint64_t result;

  if (!a2)
    return 48;
  if (a3 == 48)
  {
    result = (uint64_t)OPENSSL_malloc(0x38uLL);
    if (result)
    {
      *(_QWORD *)(result + 48) = 0;
      *(_OWORD *)(result + 16) = 0u;
      *(_OWORD *)(result + 32) = 0u;
      *(_OWORD *)result = 0u;
      *(_OWORD *)result = *a2;
      *(_OWORD *)(result + 16) = a2[1];
      *(_OWORD *)(result + 32) = a2[2];
      *(_QWORD *)(result + 48) = 0;
      std::unique_ptr<bssl::TicketKey,bssl::internal::Deleter>::reset[abi:ne180100]((_QWORD **)(a1 + 520), (_QWORD *)result);
      std::unique_ptr<bssl::TicketKey,bssl::internal::Deleter>::reset[abi:ne180100]((_QWORD **)(a1 + 528), 0);
      return 1;
    }
  }
  else
  {
    ERR_put_error(16, 0, 161, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_lib.cc", 2172);
    return 0;
  }
  return result;
}

void std::unique_ptr<bssl::TicketKey,bssl::internal::Deleter>::reset[abi:ne180100](_QWORD **a1, _QWORD *a2)
{
  _QWORD *v3;

  v3 = *a1;
  *a1 = a2;
  if (v3)
    OPENSSL_free(v3);
}

uint64_t SSL_CTX_set1_curves(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  return bssl::tls1_set_curves(a1 + 744, a2, a3);
}

uint64_t SSL_set1_curves(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3)
    return bssl::tls1_set_curves(v3 + 104, a2, a3);
  else
    return 0;
}

uint64_t SSL_set1_curves_list(uint64_t a1, char *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
    return bssl::tls1_set_curves_list(v2 + 104, a2);
  else
    return 0;
}

uint64_t SSL_CTX_get_ciphers(uint64_t a1)
{
  return **(_QWORD **)(a1 + 232);
}

int SSL_CTX_set_cipher_list(SSL_CTX *a1, const char *str)
{
  return bssl::ssl_create_cipher_list((bssl::SSLCipherPreferenceList **)&a1->md5, (uint64_t)str, 0);
}

int SSL_set_cipher_list(SSL *s, const char *str)
{
  SSL_METHOD *method;

  method = s->method;
  if (method)
    return bssl::ssl_create_cipher_list((bssl::SSLCipherPreferenceList **)&method->ssl_free, (uint64_t)str, 0);
  else
    return 0;
}

const char *__cdecl SSL_get_servername(const SSL *s, const int type)
{
  const char *result;

  if (type)
    return 0;
  result = (const char *)s->msg_callback_arg;
  if (!result)
    return (const char *)*((_QWORD *)s->handshake_func + 64);
  return result;
}

uint64_t SSL_CTX_enable_signed_cert_timestamps(uint64_t result)
{
  *(_WORD *)(result + 840) |= 8u;
  return result;
}

uint64_t SSL_CTX_enable_ocsp_stapling(uint64_t result)
{
  *(_WORD *)(result + 840) |= 4u;
  return result;
}

uint64_t SSL_CTX_set_next_protos_advertised_cb(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 576) = a2;
  *(_QWORD *)(result + 584) = a3;
  return result;
}

uint64_t SSL_CTX_set_next_proto_select_cb(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 592) = a2;
  *(_QWORD *)(result + 600) = a3;
  return result;
}

uint64_t SSL_CTX_set_alpn_protos(uint64_t a1, void *a2, unsigned __int8 *a3)
{
  void **v6;

  if (!a3)
    return bssl::Array<unsigned char>::Init(a1 + 624, 0) ^ 1;
  if ((bssl::ssl_is_valid_alpn_list((unsigned __int8 *)a2, a3) & 1) != 0)
  {
    v6 = (void **)(a1 + 624);
    if (bssl::Array<unsigned char>::Init((uint64_t)v6, (unint64_t)a3))
    {
      memcpy(*v6, a2, (size_t)a3);
      return 0;
    }
  }
  else
  {
    ERR_put_error(16, 0, 315, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_lib.cc", 2511);
  }
  return 1;
}

uint64_t SSL_CTX_set_alpn_select_cb(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 608) = a2;
  *(_QWORD *)(result + 616) = a3;
  return result;
}

uint64_t SSL_set_alpn_select_cb(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 80) = a2;
  *(_QWORD *)(result + 88) = a3;
  return result;
}

uint64_t SSL_get0_certificate_types(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  if ((*(_BYTE *)(a1 + 180) & 1) != 0 || (v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 280)) == 0)
  {
    result = 0;
    v3 = 0;
  }
  else
  {
    v3 = *(_QWORD *)(v2 + 1504);
    result = *(_QWORD *)(v2 + 1512);
  }
  *a2 = v3;
  return result;
}

void SSL_set_shutdown(SSL *ssl, int mode)
{
  int (__cdecl *handshake_func)(SSL *);
  int v3;
  int v4;

  handshake_func = ssl->handshake_func;
  v4 = *((_DWORD *)handshake_func + 43);
  v3 = *((_DWORD *)handshake_func + 44);
  if ((((v3 == 1) | (2 * (v4 != 0))) & ~mode) != 0)
    SSL_set_shutdown_cold_1();
  if ((mode & 2) != 0 && !v4)
    *((_DWORD *)handshake_func + 43) = 1;
  if ((mode & 1) != 0 && !v3)
    *((_DWORD *)handshake_func + 44) = 1;
}

uint64_t SSL_CTX_use_psk_identity_hint(uint64_t a1, char *a2)
{
  return use_psk_identity_hint((_QWORD **)(a1 + 544), a2);
}

uint64_t use_psk_identity_hint(_QWORD **a1, char *__s)
{
  _QWORD *v4;

  if (!__s)
  {
    std::unique_ptr<char,bssl::internal::Deleter>::reset[abi:ne180100](a1, 0);
    return 1;
  }
  if (strlen(__s) < 0x81)
  {
    std::unique_ptr<char,bssl::internal::Deleter>::reset[abi:ne180100](a1, 0);
    if (*__s)
    {
      v4 = OPENSSL_strdup(__s);
      std::unique_ptr<char,bssl::internal::Deleter>::reset[abi:ne180100](a1, v4);
      if (!*a1)
        return 0;
    }
    return 1;
  }
  ERR_put_error(16, 0, 136, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_lib.cc", 2918);
  return 0;
}

uint64_t SSL_use_psk_identity_hint(uint64_t a1, char *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 8);
  if (v2)
    return use_psk_identity_hint((_QWORD **)(v2 + 56), a2);
  else
    return 0;
}

uint64_t SSL_get_psk_identity_hint(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = *(_QWORD *)(result + 8);
    if (!v1)
      SSL_get_psk_identity_hint_cold_1();
    return *(_QWORD *)(v1 + 56);
  }
  return result;
}

const SSL *SSL_get_psk_identity(const SSL *result)
{
  if (result)
  {
    result = (const SSL *)SSL_get_session(result);
    if (result)
      return (const SSL *)result->d1;
  }
  return result;
}

uint64_t SSL_set_psk_client_callback(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  if (v2)
    *(_QWORD *)(v2 + 64) = a2;
  return result;
}

uint64_t SSL_CTX_set_psk_client_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 552) = a2;
  return result;
}

uint64_t SSL_set_psk_server_callback(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  if (v2)
    *(_QWORD *)(v2 + 72) = a2;
  return result;
}

uint64_t SSL_CTX_set_psk_server_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 560) = a2;
  return result;
}

uint64_t SSL_set_psk_client13_ext_callback(uint64_t result, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 8);
  if (v2)
    *(_QWORD *)(v2 + 80) = a2;
  return result;
}

uint64_t SSL_CTX_set_psk_client13_ext_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 568) = a2;
  return result;
}

void SSL_CTX_set_msg_callback(SSL_CTX *ctx, void (__cdecl *cb)(int, int, int, const void *, size_t, SSL *, void *))
{
  *(_QWORD *)&ctx->tlsext_tick_key_name[8] = cb;
}

uint64_t SSL_CTX_set_keylog_callback(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 776) = a2;
  return result;
}

size_t SSL_get_client_random(uint64_t a1, void *__dst, unint64_t a3)
{
  size_t v3;

  if (!a3)
    return 32;
  if (a3 >= 0x20)
    v3 = 32;
  else
    v3 = a3;
  memcpy(__dst, (const void *)(*(_QWORD *)(a1 + 48) + 48), v3);
  return v3;
}

size_t SSL_get_server_random(uint64_t a1, void *__dst, unint64_t a3)
{
  size_t v3;

  if (!a3)
    return 32;
  if (a3 >= 0x20)
    v3 = 32;
  else
    v3 = a3;
  memcpy(__dst, (const void *)(*(_QWORD *)(a1 + 48) + 16), v3);
  return v3;
}

uint64_t SSL_get_pending_cipher(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 280);
  if (v1)
    return *(_QWORD *)(v1 + 1568);
  else
    return 0;
}

uint64_t SSL_CTX_use_server_raw_public_key_certificate(uint64_t a1, const void *a2, unsigned int a3)
{
  void **v6;
  size_t v7;
  int v8;
  int v9;
  _BYTE **v10;
  uint64_t result;

  v6 = (void **)(a1 + 656);
  v7 = a3;
  v8 = bssl::Array<unsigned char>::Init(a1 + 656, a3);
  v9 = v8;
  if (a3 && v8)
    memcpy(*v6, a2, v7);
  if (!v9)
    return 0;
  v10 = (_BYTE **)(a1 + 640);
  result = bssl::Array<unsigned char>::Init((uint64_t)v10, 1uLL);
  if ((_DWORD)result)
  {
    **v10 = 2;
    return 1;
  }
  return result;
}

uint64_t SSL_CTX_use_client_raw_public_key_certificate(uint64_t a1, const void *a2, unsigned int a3)
{
  void **v6;
  size_t v7;
  int v8;
  int v9;
  _BYTE **v10;
  uint64_t result;

  v6 = (void **)(a1 + 688);
  v7 = a3;
  v8 = bssl::Array<unsigned char>::Init(a1 + 688, a3);
  v9 = v8;
  if (a3 && v8)
    memcpy(*v6, a2, v7);
  if (!v9)
    return 0;
  v10 = (_BYTE **)(a1 + 672);
  result = bssl::Array<unsigned char>::Init((uint64_t)v10, 1uLL);
  if ((_DWORD)result)
  {
    **v10 = 2;
    return 1;
  }
  return result;
}

uint64_t SSL_use_server_raw_public_key_certificate(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v3;
  void **v7;
  size_t v8;
  int v9;
  int v10;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return 0;
  v7 = (void **)(v3 + 184);
  v8 = a3;
  v9 = bssl::Array<unsigned char>::Init(v3 + 184, a3);
  v10 = v9;
  if (a3 && v9)
    memcpy(*v7, a2, v8);
  if (!v10)
    return 0;
  result = bssl::Array<unsigned char>::Init(*(_QWORD *)(a1 + 8) + 168, 1uLL);
  if ((_DWORD)result)
  {
    **(_BYTE **)(*(_QWORD *)(a1 + 8) + 168) = 2;
    return 1;
  }
  return result;
}

uint64_t SSL_use_client_raw_public_key_certificate(uint64_t a1, const void *a2, unsigned int a3)
{
  uint64_t v3;
  void **v7;
  size_t v8;
  int v9;
  int v10;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return 0;
  v7 = (void **)(v3 + 216);
  v8 = a3;
  v9 = bssl::Array<unsigned char>::Init(v3 + 216, a3);
  v10 = v9;
  if (a3 && v9)
    memcpy(*v7, a2, v8);
  if (!v10)
    return 0;
  result = bssl::Array<unsigned char>::Init(*(_QWORD *)(a1 + 8) + 200, 1uLL);
  if ((_DWORD)result)
  {
    **(_BYTE **)(*(_QWORD *)(a1 + 8) + 200) = 2;
    return 1;
  }
  return result;
}

BOOL SSL_has_server_raw_public_key_certificate(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  return v1 && *(_QWORD *)(v1 + 192) != 0;
}

uint64_t SSL_CTX_use_ticket_request(uint64_t a1, char a2, char a3)
{
  *(_BYTE *)(a1 + 704) = a2;
  *(_BYTE *)(a1 + 705) = a3;
  return 1;
}

void std::unique_ptr<ssl_ctx_st,bssl::internal::Deleter>::reset[abi:ne180100](SSL_CTX **a1, SSL_CTX *a2)
{
  SSL_CTX *v3;

  v3 = *a1;
  *a1 = a2;
  if (v3)
    SSL_CTX_free(v3);
}

void std::unique_ptr<ssl_ech_keys_st,bssl::internal::Deleter>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *a1;
  *a1 = a2;
  if (v3)
    SSL_ECH_KEYS_free(v3);
}

void std::unique_ptr<bssl::SSLCipherPreferenceList,bssl::internal::Deleter>::reset[abi:ne180100](bssl::SSLCipherPreferenceList **a1, bssl::SSLCipherPreferenceList *a2)
{
  bssl::SSLCipherPreferenceList *v3;
  _QWORD *v4;

  v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    bssl::SSLCipherPreferenceList::~SSLCipherPreferenceList(v3);
    OPENSSL_free(v4);
  }
}

void std::unique_ptr<stack_st_SRTP_PROTECTION_PROFILE,bssl::internal::Deleter>::reset[abi:ne180100](STACK **a1, STACK *a2)
{
  STACK *v3;

  v3 = *a1;
  *a1 = a2;
  if (v3)
    sk_free(v3);
}

void std::unique_ptr<ssl_st,bssl::internal::Deleter>::reset[abi:ne180100](ssl_st **a1, ssl_st *a2)
{
  ssl_st *v3;
  _QWORD *v4;

  v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    ssl_st::~ssl_st(v3);
    OPENSSL_free(v4);
  }
}

ECDSA_SIG *ECDSA_SIG_new(void)
{
  ECDSA_SIG *result;

  result = (ECDSA_SIG *)malloc_type_malloc(0x10uLL, 0x20040A4A59CD2uLL);
  if (result)
  {
    result->r = 0;
    result->s = 0;
  }
  return result;
}

void ECDSA_SIG_free(ECDSA_SIG *a)
{
  BIGNUM *r;
  BIGNUM *s;

  if (a)
  {
    r = a->r;
    if (r)
      BN_free(r);
    s = a->s;
    if (s)
      BN_free(s);
    free(a);
  }
}

int ECDSA_sign(int type, const unsigned __int8 *dgst, int dgstlen, unsigned __int8 *sig, unsigned int *siglen, EC_KEY *eckey)
{
  if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
    ECDSA_sign_cold_1();
  return 0;
}

ECDSA_SIG *__cdecl ECDSA_do_sign(const unsigned __int8 *dgst, int dgst_len, EC_KEY *eckey)
{
  if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
    ECDSA_do_sign_cold_1();
  return 0;
}

int ECDSA_size(const EC_KEY *eckey)
{
  const EC_GROUP *v1;
  int curve_name;
  uint64_t v3;

  v1 = EC_KEY_get0_group(eckey);
  curve_name = EC_GROUP_get_curve_name(v1);
  if (boringssl_ecdsa_get_cc_curve_parameters(curve_name))
  {
    return (((unint64_t)(cczp_bitlen() + 7) >> 2) & 0x3FFFFFFFFFFFFFFELL) + 9;
  }
  else
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      ECDSA_size_cold_1();
    LODWORD(v3) = 0;
  }
  return v3;
}

int ECDSA_do_verify(const unsigned __int8 *dgst, int dgst_len, const ECDSA_SIG *sig, EC_KEY *eckey)
{
  const EC_GROUP *v6;
  int curve_name;
  _QWORD *cc_curve_parameters;
  _QWORD *v9;
  char *v10;
  char *v11;
  int result;
  char *v13;
  size_t v14;
  void *v15;
  char *v16;
  char *v17;
  BOOL v18;
  int v19;
  unsigned __int8 *out;

  v6 = EC_KEY_get0_group(eckey);
  curve_name = EC_GROUP_get_curve_name(v6);
  cc_curve_parameters = (_QWORD *)boringssl_ecdsa_get_cc_curve_parameters(curve_name);
  if (!cc_curve_parameters)
  {
    if (g_boringssl_log)
    {
      result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      ECDSA_do_verify_cold_1();
    }
    return 0;
  }
  v9 = cc_curve_parameters;
  v10 = (char *)malloc_type_malloc(24 * *cc_curve_parameters + 16, 0xBD949DAAuLL);
  if (!v10)
  {
    if (g_boringssl_log)
    {
      result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
      if (!result)
        return result;
      ECDSA_do_verify_cold_2();
    }
    return 0;
  }
  v11 = v10;
  *(_QWORD *)v10 = v9;
  out = 0;
  i2o_ECPublicKey(eckey, &out);
  if (!out)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      ECDSA_do_verify_cold_3();
    goto LABEL_18;
  }
  if (ccec_import_pub())
  {
    if (g_boringssl_log)
    {
      if (os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
        ECDSA_do_verify_cold_7();
    }
    OPENSSL_free(out);
LABEL_18:
    v13 = v11;
LABEL_19:
    free(v13);
    return 0;
  }
  v14 = ccec_signature_r_s_size();
  v15 = malloc_type_malloc(v14, 0xE6BA1D8EuLL);
  v16 = (char *)malloc_type_malloc(v14, 0x4E01E6FBuLL);
  v17 = v16;
  if (v15)
    v18 = v16 == 0;
  else
    v18 = 1;
  if (v18)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      ECDSA_do_verify_cold_4();
    OPENSSL_free(out);
    free(v11);
    if (v15)
      free(v15);
    if (!v17)
      return 0;
    goto LABEL_45;
  }
  v19 = BN_bn2bin_padded((char *)v15, v14, (uint64_t)sig->r);
  if (!v19 || !BN_bn2bin_padded(v17, v14, (uint64_t)sig->s))
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      ECDSA_do_verify_cold_5();
    OPENSSL_free(out);
    free(v11);
    free(v15);
LABEL_45:
    v13 = v17;
    goto LABEL_19;
  }
  if (ccec_verify_composite()
    && g_boringssl_log
    && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
  {
    ECDSA_do_verify_cold_6();
  }
  OPENSSL_free(out);
  free(v11);
  free(v15);
  free(v17);
  return 0;
}

void bssl::DTLS1_STATE::~DTLS1_STATE(bssl::SSLAEADContext **this)
{
  uint64_t i;
  uint64_t j;

  for (i = 31; i != 10; i -= 3)
    bssl::Array<unsigned char>::~Array((uint64_t)&this[i]);
  for (j = 12; j != 5; --j)
    std::unique_ptr<bssl::hm_fragment,bssl::internal::Deleter>::reset[abi:ne180100](&this[j], 0);
  std::unique_ptr<bssl::SSLAEADContext,bssl::internal::Deleter>::reset[abi:ne180100](this + 5, 0);
}

BOOL bssl::dtls1_new(unsigned __int8 **this, ssl_st *a2)
{
  bssl::SSLAEADContext **v3;
  ssl_st *v4;
  _BOOL8 v5;
  bssl::SSLAEADContext **v7;

  if (!bssl::tls_new(this, a2))
    return 0;
  v3 = (bssl::SSLAEADContext **)bssl::New<bssl::DTLS1_STATE>();
  v7 = v3;
  v5 = v3 != 0;
  if (v3)
  {
    v7 = 0;
    this[7] = (unsigned __int8 *)v3;
    *((_WORD *)this + 8) = -259;
  }
  else
  {
    bssl::tls_free((bssl *)this, v4);
  }
  std::unique_ptr<bssl::DTLS1_STATE,bssl::internal::Deleter>::reset[abi:ne180100](&v7, 0);
  return v5;
}

void sub_1B4FDC420(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<bssl::DTLS1_STATE,bssl::internal::Deleter>::reset[abi:ne180100]((bssl::SSLAEADContext ***)va, 0);
  _Unwind_Resume(a1);
}

void bssl::dtls1_free(bssl::SSLAEADContext ***this, ssl_st *a2)
{
  bssl::SSLAEADContext **v3;
  _QWORD *v4;

  bssl::tls_free((bssl *)this, a2);
  if (this)
  {
    v3 = this[7];
    if (v3)
    {
      bssl::DTLS1_STATE::~DTLS1_STATE(v3);
      OPENSSL_free(v4);
    }
    this[7] = 0;
  }
}

uint64_t bssl::dtls1_start_timer(bssl *this, ssl_st *a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unsigned int v8;

  v3 = *((_QWORD *)this + 7);
  if (!*(_QWORD *)(v3 + 288) && !*(_DWORD *)(v3 + 296))
    *(_DWORD *)(v3 + 304) = *((_DWORD *)this + 24);
  result = bssl::ssl_get_current_time((uint64_t)this, v3 + 288);
  v5 = *((_QWORD *)this + 7);
  v6 = *(_DWORD *)(v5 + 304);
  v7 = *(_QWORD *)(v5 + 288) + v6 / 0x3E8uLL;
  *(_QWORD *)(v5 + 288) = v7;
  v8 = *(_DWORD *)(v5 + 296) + 1000 * (v6 % 0x3E8);
  *(_DWORD *)(v5 + 296) = v8;
  if (v8 >= 0xF4240)
  {
    *(_QWORD *)(v5 + 288) = v7 + 1;
    *(_DWORD *)(v5 + 296) = v8 - 1000000;
  }
  return result;
}

uint64_t bssl::dtls1_is_timer_expired(bssl *this, ssl_st *a2)
{
  uint64_t result;
  uint64_t v4;
  unint64_t v5;

  v4 = 0xAAAAAAAAAAAAAAAALL;
  v5 = 0xAAAAAAAAAAAAAAAALL;
  result = DTLSv1_get_timeout((uint64_t)this, (unint64_t *)&v4);
  if ((_DWORD)result)
    return v4 < 1 && (int)v5 < 1;
  return result;
}

uint64_t DTLSv1_get_timeout(uint64_t a1, unint64_t *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unsigned int v10;
  _BOOL8 v11;
  unsigned int v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  result = SSL_is_dtls((unsigned __int8 **)a1);
  if ((_DWORD)result)
  {
    v5 = *(_QWORD *)(a1 + 56);
    if (!*(_QWORD *)(v5 + 288) && !*(_DWORD *)(v5 + 296))
      return 0;
    v14 = 0xAAAAAAAAAAAAAAAALL;
    v15 = 0xAAAAAAAAAAAAAAAALL;
    bssl::ssl_get_current_time(a1, (uint64_t)&v14);
    v6 = *(_QWORD *)(a1 + 56);
    v7 = *(_QWORD *)(v6 + 288);
    v8 = v7 >= v14;
    v9 = v7 - v14;
    if (!v8)
      goto LABEL_5;
    if (v9)
    {
      v10 = *(_DWORD *)(v6 + 296);
    }
    else
    {
      v10 = *(_DWORD *)(v6 + 296);
      if (v10 <= v15)
      {
LABEL_5:
        *a2 = 0;
        a2[1] = 0;
        return 1;
      }
    }
    v11 = v10 < v15;
    if (v10 < v15)
      v10 += 1000000;
    v12 = v10 - v15;
    v13 = v9 - v11;
    if (v13 || v12 >> 3 >= 0x753)
    {
      if (v13 >> 31)
        DTLSv1_get_timeout_cold_1();
    }
    else
    {
      v12 = 0;
    }
    *a2 = v13;
    *((_DWORD *)a2 + 2) = v12;
    return 1;
  }
  return result;
}

uint64_t bssl::dtls1_stop_timer(uint64_t this, ssl_st *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(this + 56);
  *(_DWORD *)(v2 + 300) = 0;
  *(_QWORD *)(v2 + 292) = 0;
  *(_QWORD *)(v2 + 284) = 0;
  *(_DWORD *)(*(_QWORD *)(this + 56) + 304) = *(_DWORD *)(this + 96);
  return this;
}

BOOL bssl::dtls1_check_timeout_num(bssl *this, ssl_st *a2)
{
  uint64_t v3;
  unsigned int v4;
  bssl *v5;
  int v6;
  unsigned int v7;

  v3 = *((_QWORD *)this + 7);
  v4 = *(_DWORD *)(v3 + 284) + 1;
  *(_DWORD *)(v3 + 284) = v4;
  if (v4 >= 3 && (SSL_get_options((uint64_t)this) & 0x1000) == 0)
  {
    v5 = (bssl *)BIO_ctrl(*((BIO **)this + 4), 47, 0, 0);
    if ((unint64_t)v5 <= 0x40000000)
    {
      v6 = (int)v5;
      if (bssl::dtls1_min_mtu(v5) <= v5)
        *(_DWORD *)(*((_QWORD *)this + 7) + 280) = v6;
    }
  }
  v7 = *(_DWORD *)(*((_QWORD *)this + 7) + 284);
  if (v7 >= 7)
    ERR_put_error(16, 0, 198, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/d1_lib.cc", 183);
  return v7 < 7;
}

uint64_t DTLSv1_handle_timeout(bssl *a1, ssl_st *a2)
{
  ssl_st *v3;
  uint64_t result;
  ssl_st *v5;
  ssl_st *v6;
  uint64_t v7;
  unsigned int v8;
  ssl_st *v9;

  bssl::ssl_reset_error_state(a1, a2);
  if (!SSL_is_dtls((unsigned __int8 **)a1))
  {
    ERR_put_error(16, 0, 66, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/d1_lib.cc", 252);
    return 0xFFFFFFFFLL;
  }
  result = bssl::dtls1_is_timer_expired(a1, v3);
  if (!(_DWORD)result)
    return result;
  if (!bssl::dtls1_check_timeout_num(a1, v5))
    return 0xFFFFFFFFLL;
  v7 = *((_QWORD *)a1 + 7);
  v8 = 2 * *(_DWORD *)(v7 + 304);
  if (v8 >= 0xEA60)
    v8 = 60000;
  *(_DWORD *)(v7 + 304) = v8;
  bssl::dtls1_start_timer(a1, v6);
  return bssl::dtls1_retransmit_outgoing_messages(a1, v9);
}

_QWORD *bssl::New<bssl::DTLS1_STATE>()
{
  _QWORD *result;
  uint64_t v1;
  _QWORD *v2;

  result = OPENSSL_malloc(0x138uLL);
  if (result)
  {
    v1 = 0;
    *(_BYTE *)result &= 0xF8u;
    *(_DWORD *)((char *)result + 2) = 0;
    result[1] = 0;
    result[2] = 0;
    *((_DWORD *)result + 6) = 0;
    *((_OWORD *)result + 2) = 0u;
    *((_OWORD *)result + 3) = 0u;
    *((_OWORD *)result + 4) = 0u;
    *((_OWORD *)result + 5) = 0u;
    result[12] = 0;
    do
    {
      v2 = &result[v1 + 13];
      *v2 = 0;
      v2[1] = 0;
      *(_DWORD *)((char *)v2 + 15) = 0;
      v1 += 3;
    }
    while (v1 != 21);
    *((_WORD *)result + 136) = 0;
    *((_DWORD *)result + 76) = 0;
    *(_QWORD *)((char *)result + 284) = 0;
    *(_QWORD *)((char *)result + 292) = 0;
    *(_QWORD *)((char *)result + 276) = 0;
  }
  return result;
}

void std::unique_ptr<bssl::DTLS1_STATE,bssl::internal::Deleter>::reset[abi:ne180100](bssl::SSLAEADContext ***a1, bssl::SSLAEADContext **a2)
{
  bssl::SSLAEADContext **v3;
  _QWORD *v4;

  v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    bssl::DTLS1_STATE::~DTLS1_STATE(v3);
    OPENSSL_free(v4);
  }
}

unint64_t HRSS_poly3_mul(uint64_t a1, _QWORD *a2, unint64_t *a3)
{
  __int128 v4;
  unint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t *v22[2];
  _QWORD *v23[2];
  uint64_t *v24[2];
  __int128 v25;
  _OWORD v26[12];
  _OWORD v27[12];
  _OWORD v28[5];
  _OWORD v29[6];
  _OWORD v30[5];
  _OWORD v31[6];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31[4] = v4;
  v31[5] = v4;
  v31[2] = v4;
  v31[3] = v4;
  v31[0] = v4;
  v31[1] = v4;
  v30[3] = v4;
  v30[4] = v4;
  v30[1] = v4;
  v30[2] = v4;
  v30[0] = v4;
  v29[4] = v4;
  v29[5] = v4;
  v29[2] = v4;
  v29[3] = v4;
  v29[0] = v4;
  v29[1] = v4;
  v28[3] = v4;
  v28[4] = v4;
  v28[1] = v4;
  v28[2] = v4;
  v27[11] = v4;
  v28[0] = v4;
  v27[9] = v4;
  v27[10] = v4;
  v27[7] = v4;
  v27[8] = v4;
  v27[5] = v4;
  v27[6] = v4;
  v27[3] = v4;
  v27[4] = v4;
  v27[1] = v4;
  v27[2] = v4;
  v26[11] = v4;
  v27[0] = v4;
  v26[9] = v4;
  v26[10] = v4;
  v26[7] = v4;
  v26[8] = v4;
  v26[5] = v4;
  v26[6] = v4;
  v26[3] = v4;
  v26[4] = v4;
  v26[1] = v4;
  v26[2] = v4;
  v26[0] = v4;
  *(_QWORD *)&v25 = v30;
  *((_QWORD *)&v25 + 1) = v28;
  v24[0] = (uint64_t *)v27;
  v24[1] = (uint64_t *)v26;
  v23[0] = a2;
  v23[1] = a2 + 11;
  v22[0] = a3;
  v22[1] = a3 + 11;
  result = poly3_mul_aux(&v25, v24, v23, v22, 0xBuLL);
  v6 = 0;
  v7 = *(_QWORD *)&v31[0];
  v8 = *(_QWORD *)&v29[0];
  do
  {
    v9 = *(_QWORD *)((char *)v31 + v6 + 8);
    *((_QWORD *)&v11 + 1) = v9;
    *(_QWORD *)&v11 = v7;
    v10 = v11 >> 61;
    *((_QWORD *)&v11 + 1) = *(_QWORD *)((char *)v29 + v6 + 8);
    *(_QWORD *)&v11 = v8;
    v12 = v11 >> 61;
    v13 = (uint64_t *)(a1 + v6);
    v14 = *(_QWORD *)((char *)v28 + v6);
    v15 = v12 ^ *(_QWORD *)((char *)v30 + v6);
    *v13 = (v14 ^ v10) & v15;
    v13[11] = v15 ^ v10 | v14 ^ v12;
    v6 += 8;
    v8 = *((_QWORD *)&v11 + 1);
    v7 = v9;
  }
  while (v6 != 88);
  v16 = 0;
  v17 = (8 * *(_QWORD *)(a1 + 80)) >> 63;
  v18 = (8 * *(_QWORD *)(a1 + 168)) >> 63;
  do
  {
    v19 = (uint64_t *)(a1 + v16);
    v20 = *(_QWORD *)(a1 + v16);
    v21 = *(_QWORD *)(a1 + v16 + 88) ^ v18;
    *v19 = (v21 ^ v17) & (v20 ^ v18);
    v19[11] = v21 | v20 ^ v17;
    v16 += 8;
  }
  while (v16 != 88);
  *(_QWORD *)(a1 + 80) &= 0x1FFFFFFFFFFFFFFFuLL;
  *(_QWORD *)(a1 + 168) &= 0x1FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t poly3_mul_aux(__int128 *a1, uint64_t **a2, _QWORD **a3, unint64_t **a4, unint64_t a5)
{
  char v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t result;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  unint64_t *v24;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t *v31;
  unint64_t *v32;
  unint64_t *v33;
  uint64_t v34;
  unint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t *v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  __int128 v67;
  _QWORD v68[2];
  _QWORD v69[2];

  if (a5 == 1)
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = **a4;
    v14 = *a4[1];
    v15 = 64;
    do
    {
      v16 = ((uint64_t)(v14 << 63) >> 63) & *a3[1];
      result = v16 & (**a3 ^ -(uint64_t)(v13 & 1));
      v13 >>= 1;
      v14 >>= 1;
      v18 = (v16 << v8) ^ v12;
      v19 = ((result << v8) ^ v10) & v18;
      v10 = v18 ^ (result << v8) | (v16 << v8) ^ v10;
      v20 = (v16 >> v15) ^ v11;
      v21 = ((result >> v15) ^ v9) & v20;
      v22 = v20 ^ (result >> v15) | (v16 >> v15) ^ v9;
      if (v15 == 64)
        v12 = result;
      else
        v12 = v19;
      if (v15 == 64)
        v10 = v16;
      else
        v11 = v21;
      if (v15 != 64)
        v9 = v22;
      ++v8;
      --v15;
    }
    while (v15);
    v23 = *(uint64_t **)a1;
    *v23 = v12;
    v23[1] = v11;
    v24 = (unint64_t *)*((_QWORD *)a1 + 1);
    *v24 = v10;
    v24[1] = v9;
  }
  else
  {
    v26 = a5 >> 1;
    v27 = a5 - (a5 >> 1);
    v28 = *a3;
    v29 = a3[1];
    v30 = (uint64_t)&(*a3)[a5 >> 1];
    v31 = &v29[a5 >> 1];
    v69[0] = v30;
    v69[1] = v31;
    v32 = *a4;
    v33 = a4[1];
    v34 = (uint64_t)&(*a4)[a5 >> 1];
    v35 = &v33[a5 >> 1];
    v68[0] = v34;
    v68[1] = v35;
    v67 = *a1;
    v37 = *(uint64_t **)a1;
    v36 = *((_QWORD *)a1 + 1);
    v38 = *(_QWORD *)a1 + 8 * v27;
    v66[0] = v38;
    v66[1] = v36 + 8 * v27;
    if (a5)
    {
      v40 = (uint64_t *)*((_QWORD *)&v67 + 1);
      v39 = (uint64_t *)v67;
      v41 = a5 >> 1;
      do
      {
        v42 = *v29;
        v43 = v28[v26];
        v44 = v29[v26];
        v45 = v44 ^ *v28;
        *v39++ = v45 & (v43 ^ *v29);
        *v40++ = v45 ^ v43 | v44 ^ v42;
        ++v29;
        ++v28;
        --v41;
      }
      while (v41);
      v46 = 0;
      do
      {
        v47 = v33[v46];
        v48 = *(_QWORD *)(v34 + 8 * v46);
        v49 = v35[v46];
        v50 = v49 ^ v32[v46];
        *(_QWORD *)(v38 + 8 * v46) = v50 & (v48 ^ v47);
        *(_QWORD *)(v36 + 8 * v27 + 8 * v46++) = v50 ^ v48 | v49 ^ v47;
      }
      while (v26 != v46);
    }
    if (v27 != v26)
    {
      v51 = *((_QWORD *)&v67 + 1);
      *(_QWORD *)(v67 + 8 * v26) = *(_QWORD *)(v30 + 8 * v26);
      *(_QWORD *)(v51 + 8 * v26) = v31[v26];
      v37[a5] = *(_QWORD *)(v34 + 8 * v26);
      *(_QWORD *)(v36 + 8 * a5) = v35[v26];
    }
    v52 = 2 * v27;
    v53 = (uint64_t)&a2[1][2 * v27];
    v65[0] = &(*a2)[2 * v27];
    v65[1] = v53;
    v54 = a5 & 0xFFFFFFFFFFFFFFFELL;
    v64[0] = &v37[a5 & 0xFFFFFFFFFFFFFFFELL];
    v64[1] = (uint64_t *)(v36 + 8 * (a5 & 0xFFFFFFFFFFFFFFFELL));
    poly3_mul_aux(a2, v65, &v67, v66, a5 - (a5 >> 1));
    poly3_mul_aux(v64, v65, v69, v68, v27);
    poly3_mul_aux(a1, v65, a3, a4, v26);
    poly3_span_sub(a2, (uint64_t **)a1, v54);
    result = (unint64_t)poly3_span_sub(a2, v64, 2 * v27);
    if (2 * v27)
    {
      v55 = &v37[v26];
      v56 = *a2;
      v57 = a2[1];
      v58 = (uint64_t *)(v36 + 8 * v26);
      do
      {
        v60 = *v56++;
        v59 = v60;
        v61 = *v57++;
        v62 = *v58;
        v63 = v61 ^ *v55;
        *v55++ = v63 & (v59 ^ *v58);
        *v58++ = v63 ^ v59 | v61 ^ v62;
        --v52;
      }
      while (v52);
    }
  }
  return result;
}

int8x16_t *HRSS_poly3_invert(uint64_t a1, uint64_t a2)
{
  int8x16_t v4;
  unsigned int v5;
  uint64_t i;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t j;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t k;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  unint64_t v31;
  uint64_t m;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  int8x16_t v45[5];
  _OWORD v46[6];
  _OWORD v47[5];
  uint64_t v48;
  _OWORD v49[5];
  uint64_t v50;
  _OWORD v51[5];
  uint64_t v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _OWORD v59[12];

  v4.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v4.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  v46[4] = v4;
  v46[5] = v4;
  v46[2] = v4;
  v46[3] = v4;
  v46[0] = v4;
  v46[1] = v4;
  v45[3] = v4;
  v45[4] = v4;
  v45[1] = v4;
  v45[2] = v4;
  v45[0] = v4;
  memset(v59, 0, 176);
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v52 = 0;
  v54 = 0u;
  memset(v51, 0, sizeof(v51));
  v5 = 1;
  v53 = 1;
  memset(v47, 0, sizeof(v47));
  v4.i64[0] = -1;
  v4.i64[1] = -1;
  v49[4] = v4;
  v49[3] = v4;
  v49[2] = v4;
  v49[1] = v4;
  v48 = 0;
  v50 = 0x1FFFFFFFFFFFFFFFLL;
  v49[0] = v4;
  poly2_reverse_700((int8x16_t *)((char *)v46 + 8), a2 + 88);
  poly2_reverse_700(v45, a2);
  for (i = 0; i != 1399; ++i)
  {
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = *(_QWORD *)((char *)v59 + v7);
      *(_QWORD *)((char *)v59 + v7) = v8 | (2 * v9);
      v7 += 8;
      v8 = v9 >> 63;
    }
    while (v7 != 88);
    v10 = 0;
    do
    {
      v11 = *(_QWORD *)((char *)v59 + v7);
      *(_QWORD *)((char *)v59 + v7) = v10 | (2 * v11);
      v7 += 8;
      v10 = v11 >> 63;
    }
    while (v7 != 176);
    if ((BYTE8(v46[0]) & 1) == 0 || v5 == 0)
      v13 = 0;
    else
      v13 = (v5 >> 31) - 1;
    v14 = v49[0] & BYTE8(v46[0]) & 1;
    v15 = -(v14 & (v45[0].i64[0] ^ *(_QWORD *)&v47[0]));
    v16 = -v14;
    v17 = ~(_DWORD)v13 & v5 | v13 & -v5;
    poly3_cswap((uint64_t)v47, (uint64_t)v45, v13);
    for (j = 0; j != 11; ++j)
    {
      v19 = *(_QWORD *)((_BYTE *)v49 + j * 8) & v16;
      v20 = v19 & (*(_QWORD *)((char *)v47 + j * 8) ^ v15);
      v21 = &v45[0].i64[j];
      v22 = v45[0].i64[j];
      v23 = *(_QWORD *)((char *)v46 + j * 8 + 8) ^ v19;
      *v21 = (v23 ^ v20) & (v19 ^ v22);
      v21[11] = v23 | v20 ^ v22;
    }
    v24 = 0;
    for (k = 10; k < 0xB; --k)
    {
      *((_QWORD *)&v26 + 1) = v24;
      *(_QWORD *)&v26 = v45[0].i64[k];
      v45[0].i64[k] = v26 >> 1;
      v24 = v26 & 1;
    }
    v27 = 0;
    v28 = 21;
    do
    {
      v29 = v45[0].i64[v28];
      *((_QWORD *)&v30 + 1) = v27;
      *(_QWORD *)&v30 = v29;
      v45[0].i64[v28] = v30 >> 1;
      v27 = v29 & 1;
      v31 = v28 - 12;
      --v28;
    }
    while (v31 < 0xB);
    poly3_cswap((uint64_t)v59, (uint64_t)v51, v13);
    for (m = 0; m != 88; m += 8)
    {
      v33 = *(_QWORD *)((_BYTE *)&v59[5] + m + 8) & v16;
      v34 = v33 & (*(_QWORD *)((char *)v59 + m) ^ v15);
      v35 = (uint64_t *)((char *)v51 + m);
      v36 = *(_QWORD *)((char *)v51 + m);
      v37 = *(uint64_t *)((char *)&v53 + m) ^ v33;
      *v35 = (v37 ^ v34) & (v33 ^ v36);
      v35[11] = v37 | v34 ^ v36;
    }
    v5 = v17 + 1;
  }
  if (v5)
    HRSS_poly3_invert_cold_1();
  v38 = 0;
  v39 = -(uint64_t)(v47[0] & 1);
  v40 = (uint64_t)(*(_QWORD *)&v49[0] << 63) >> 63;
  do
  {
    v41 = (uint64_t *)((char *)v59 + v38);
    v42 = *(_QWORD *)((char *)v59 + v38);
    v43 = v40 & *(_QWORD *)((_BYTE *)&v59[5] + v38 + 8);
    v41[11] = v43;
    *v41 = v43 & (v42 ^ v39);
    v38 += 8;
  }
  while (v38 != 88);
  poly2_reverse_700((int8x16_t *)(a1 + 88), (uint64_t)&v59[5] + 8);
  return poly2_reverse_700((int8x16_t *)a1, (uint64_t)v59);
}

uint64_t poly3_cswap(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t i;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  for (i = 0; i != 88; i += 8)
  {
    v4 = *(_QWORD *)(result + i);
    v5 = (*(_QWORD *)(a2 + i) ^ v4) & a3;
    *(_QWORD *)(result + i) = v5 ^ v4;
    *(_QWORD *)(a2 + i) ^= v5;
  }
  v6 = 0;
  v7 = result + 88;
  v8 = a2 + 88;
  do
  {
    v9 = *(_QWORD *)(v7 + v6);
    v10 = (*(_QWORD *)(v8 + v6) ^ v9) & a3;
    *(_QWORD *)(v7 + v6) = v10 ^ v9;
    *(_QWORD *)(v8 + v6) ^= v10;
    v6 += 8;
  }
  while (v6 != 88);
  return result;
}

uint64_t HRSS_generate_key(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  char *v8;
  char *v9;
  __int128 v10;
  uint64_t i;
  _WORD *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  _WORD *v16;
  __int16 v17;
  char *v19;
  uint64_t j;
  uint64_t v21;
  unint64_t v22;
  unsigned int v23;
  int8x16_t v24;
  int8x16_t *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t k;
  __int128 v49;
  uint64_t m;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t n;
  int8x16_t *v55;
  uint64_t v56;
  int v57;
  unint64_t v58;
  unint64_t v59;
  int v60;
  uint64_t ii;
  uint64_t jj;
  void *v64;
  _WORD v65[704];
  _WORD __b[704];
  int8x16_t v67[5];
  unint64_t v68;
  int8x16_t v69[5];
  uint64_t v70;
  uint64_t v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  int8x16_t v77[5];
  uint64_t v78;

  v4 = (uint64_t)a1 + (-(int)a1 & 0xFLL);
  if ((v4 & 0xF) != 0)
    HRSS_generate_key_cold_3((uint64_t)a1, (uint64_t)a2, a3);
  v6 = (uint64_t)&a2[-(int)a2 & 0xFLL];
  if ((v6 & 0xF) != 0)
    HRSS_generate_key_cold_3((uint64_t)a1, (uint64_t)a2, a3);
  v64 = (void *)0xAAAAAAAAAAAAAAAALL;
  v8 = (char *)malloc_align32((uint64_t *)&v64, 11200);
  if (v8)
  {
    v9 = v8;
    memset(v8, 255, 0x2BC0uLL);
    v10 = *(_OWORD *)(a3 + 1416);
    *(_OWORD *)(v6 + 1760) = *(_OWORD *)(a3 + 1400);
    *(_OWORD *)(v6 + 1776) = v10;
    poly_short_sample_plus((__int16 *)v9 + 2784, a3);
    poly3_from_poly((unint64_t *)v6, (uint64_t)(v9 + 5568));
    HRSS_poly3_invert(v6 + 176, v6);
    poly_short_sample_plus((__int16 *)v9 + 3488, a3 + 700);
    for (i = 3488; i != 4189; ++i)
      *(_WORD *)&v9[2 * i] *= 3;
    v12 = v9 + 8376;
    v13 = *((_WORD *)v9 + 4188);
    v14 = -700;
    v15 = v13;
    v16 = v9 + 8376;
    do
    {
      v17 = *--v16;
      *v12 = v17 - v15;
      v12 = v16;
      v15 = v17;
    }
    while (!__CFADD__(v14++, 1));
    *((_WORD *)v9 + 3488) = v13 - *((_WORD *)v9 + 3488);
    v19 = v9 + 8384;
    poly_mul((int16x8_t *)v9, (uint64_t)(v9 + 8384), (_WORD *)v9 + 2784, (_WORD *)v9 + 3488);
    memset(__b, 170, sizeof(__b));
    for (j = 0; j != 701; ++j)
      __b[j] = -*(_WORD *)&v19[j * 2];
    memset(v65, 170, sizeof(v65));
    v21 = 0;
    v22 = 0;
    v23 = 0;
    *(_DWORD *)&__b[701] = 0;
    v68 = 0xAAAAAAAAAAAAAAAALL;
    v24.i64[0] = 0xAAAAAAAAAAAAAAAALL;
    v24.i64[1] = 0xAAAAAAAAAAAAAAAALL;
    v67[3] = v24;
    v67[4] = v24;
    v67[1] = v24;
    v67[2] = v24;
    v67[0] = v24;
    memset(v77, 0, sizeof(v77));
    v76 = 0u;
    v71 = 1;
    __b[703] = 0;
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v24.i64[0] = -1;
    v24.i64[1] = -1;
    v69[0] = v24;
    v69[1] = v24;
    v69[2] = v24;
    v69[3] = v24;
    v69[4] = v24;
    v70 = 0x1FFFFFFFFFFFFFFFLL;
    v25 = v67;
    v78 = 0;
    do
    {
      *((_QWORD *)&v26 + 1) = *(unsigned __int16 *)&v19[v21];
      *(_QWORD *)&v26 = v22;
      v22 = v26 >> 1;
      if (++v23 == 64)
      {
        v23 = 0;
        v25->i64[0] = v22;
        v25 = (int8x16_t *)((char *)v25 + 8);
        v22 = 0;
      }
      v21 += 2;
    }
    while (v21 != 1402);
    v27 = 0;
    v25->i64[0] = v22 >> -(uint64_t)v23;
    v28 = (uint64_t)(8 * v68) >> 63;
    do
      v67[0].i64[v27++] ^= v28;
    while (v27 != 11);
    v68 &= 0xFFFFFFFFFFFFFFFuLL;
    poly2_reverse_700(v67, (uint64_t)v67);
    v29 = 0;
    v30 = 1;
    do
    {
      v31 = 0;
      v32 = 0;
      do
      {
        v33 = v77[0].u64[v31];
        v77[0].i64[v31++] = v32 | (2 * v33);
        v32 = v33 >> 63;
      }
      while (v31 != 11);
      v34 = 0;
      v35 = (v30 >> 31) - 1;
      v36 = v67[0].i8[0] & 1;
      if ((v67[0].i8[0] & 1) == 0 || v30 == 0)
        v35 = 0;
      v38 = v69[0].i64[0];
      v39 = -v30;
      v40 = ~(_DWORD)v35 & v30;
      do
      {
        v41 = v69[0].i64[v34];
        v42 = v67[0].i64[v34];
        v43 = (v42 ^ v41) & v35;
        v69[0].i64[v34] = v43 ^ v41;
        v67[0].i64[v34++] = v43 ^ v42;
      }
      while (v34 != 11);
      v44 = 0;
      v45 = v35 & v39;
      v46 = -(v36 & v38);
      do
      {
        v67[0].i64[v44] ^= v69[0].i64[v44] & v46;
        ++v44;
      }
      while (v44 != 11);
      v47 = 0;
      for (k = 10; k < 0xB; --k)
      {
        *((_QWORD *)&v49 + 1) = v47;
        *(_QWORD *)&v49 = v67[0].i64[k];
        v67[0].i64[k] = v49 >> 1;
        v47 = v49 & 1;
      }
      for (m = 0; m != 11; ++m)
      {
        v51 = v77[0].i64[m];
        v52 = *(uint64_t *)((char *)&v71 + m * 8);
        v53 = (v52 ^ v51) & v35;
        v77[0].i64[m] = v53 ^ v51;
        *(uint64_t *)((char *)&v71 + m * 8) = v53 ^ v52;
      }
      for (n = 0; n != 11; ++n)
        *(uint64_t *)((char *)&v71 + n * 8) ^= v77[0].i64[n] & v46;
      v30 = (v40 | v45) + 1;
      ++v29;
    }
    while (v29 != 1399);
    if (v30)
      HRSS_generate_key_cold_2();
    if ((v69[0].i8[0] & 1) == 0)
      HRSS_generate_key_cold_1();
    v55 = v77;
    poly2_reverse_700(v77, (uint64_t)v77);
    v56 = 0;
    v57 = 0;
    v58 = v77[0].i64[0];
    do
    {
      *(_WORD *)&v9[v56 + 9792] = v58 & 1;
      if (++v57 == 64)
      {
        v57 = 0;
        v59 = v55->u64[1];
        v55 = (int8x16_t *)((char *)v55 + 8);
        v58 = v59;
      }
      else
      {
        v58 >>= 1;
      }
      v56 += 2;
    }
    while (v56 != 1402);
    *((_WORD *)v9 + 5599) = 0;
    *(_DWORD *)(v9 + 11194) = 0;
    poly_assert_normalized((_WORD *)v9 + 4896);
    v60 = 4;
    do
    {
      poly_mul((int16x8_t *)v9, (uint64_t)v65, __b, (_WORD *)v9 + 4896);
      v65[0] += 2;
      poly_mul((int16x8_t *)v9, (uint64_t)(v9 + 9792), (_WORD *)v9 + 4896, v65);
      --v60;
    }
    while (v60);
    poly_assert_normalized((_WORD *)v9 + 4896);
    poly_mul((int16x8_t *)v9, v4, (_WORD *)v9 + 4896, (_WORD *)v9 + 3488);
    poly_mul((int16x8_t *)v9, v4, (_WORD *)v4, (_WORD *)v9 + 3488);
    for (ii = 0; ii != 1402; ii += 2)
      *(_WORD *)(v4 + ii) &= 0x1FFFu;
    poly_mul((int16x8_t *)v9, v6 + 352, (_WORD *)v9 + 4896, (_WORD *)v9 + 2784);
    poly_mul((int16x8_t *)v9, v6 + 352, (_WORD *)(v6 + 352), (_WORD *)v9 + 2784);
    for (jj = 352; jj != 1754; jj += 2)
      *(_WORD *)(v6 + jj) &= 0x1FFFu;
    OPENSSL_free(v64);
    return 1;
  }
  else
  {
    bzero(a1, 0x590uLL);
    RAND_bytes(a2, 1808);
    return 0;
  }
}

uint64_t malloc_align32(uint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = (uint64_t)OPENSSL_malloc(a2 + 31);
  if (result)
  {
    *a1 = result;
    result += -(int)result & 0x1FLL;
    if ((result & 0x1F) != 0)
      HRSS_generate_key_cold_3(result, v4, v5);
  }
  else
  {
    *a1 = 0;
  }
  return result;
}

_WORD *poly_short_sample_plus(__int16 *a1, uint64_t a2)
{
  __int16 v3;
  __int16 v4;
  uint64_t i;
  __int16 v6;
  unint64_t v7;
  int v8;
  BOOL v9;

  poly_short_sample((uint64_t)a1, a2);
  v3 = 0;
  v4 = *a1;
  for (i = 1; i != 700; ++i)
  {
    v6 = a1[i];
    v3 += v6 * v4;
    v4 = v6;
  }
  v7 = 0;
  v8 = (v3 >> 15) | 1;
  do
  {
    a1[v7] *= (_WORD)v8;
    v9 = v7 >= 0x2BB;
    v7 += 2;
  }
  while (!v9);
  return poly_assert_normalized(a1);
}

unint64_t *poly3_from_poly(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unsigned int v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t *v6;
  unsigned int v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  v5 = 0;
  v6 = result + 11;
  do
  {
    v7 = -3 * ((21845 * (*(unsigned __int16 *)(a2 + v2) << 19 >> 19)) >> 16)
       + (*(unsigned __int16 *)(a2 + v2) << 19 >> 19);
    v8 = ((v7 & ((__int16)(-3 * ((21845 * (*(unsigned __int16 *)(a2 + v2) << 19 >> 19)) >> 16)
                         + ((__int16)(8 * *(_WORD *)(a2 + v2)) >> 3)) >> 1))
        - 1) & v7;
    v5 = (v5 >> 1) | ((unint64_t)((v8 & 2) >> 1) << 63);
    *((_QWORD *)&v9 + 1) = v8;
    *(_QWORD *)&v9 = v4;
    v4 = (v9 >> 1) | ((unint64_t)(v8 & 2) << 62);
    if (++v3 == 64)
    {
      v3 = 0;
      *result++ = v5;
      *v6++ = v4;
      v5 = 0;
      v4 = 0;
    }
    v2 += 2;
  }
  while (v2 != 1402);
  v10 = -(uint64_t)v3;
  *result = v5 >> v10;
  *v6 = v4 >> v10;
  return result;
}

_WORD *poly_mul(int16x8_t *a1, uint64_t a2, _WORD *a3, _WORD *a4)
{
  uint64_t i;

  poly_assert_normalized(a3);
  poly_assert_normalized(a4);
  poly_mul_vec_aux((uint64_t)a1, a1 + 176, (uint64_t)a3, (uint64_t)a4, 0x58uLL);
  for (i = 0; i != 88; ++i)
    *(int16x8_t *)(a2 + i * 16) = vaddq_s16((int16x8_t)vextq_s8((int8x16_t)a1[i + 87], (int8x16_t)a1[i + 88], 0xAuLL), a1[i]);
  *(_WORD *)(a2 + 1406) = 0;
  *(_DWORD *)(a2 + 1402) = 0;
  return poly_assert_normalized((_WORD *)a2);
}

uint64_t HRSS_encap(_BYTE *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  _WORD *v4;
  int16x8_t *v8;
  int16x8_t *v9;
  int16x8_t *v10;
  uint64_t v11;
  int16x8_t *v12;
  const void *v13;
  SHA256_CTX *v14;
  void *v16;

  v4 = (_WORD *)(a3 + (-(int)a3 & 0xFLL));
  if ((v4 & 0xF) != 0)
    HRSS_generate_key_cold_3((uint64_t)a1, (uint64_t)a2, a3);
  v16 = (void *)0xAAAAAAAAAAAAAAAALL;
  v8 = (int16x8_t *)malloc_align32((uint64_t *)&v16, 11600);
  if (v8)
  {
    v9 = v8;
    memset(v8, 255, 0x2D50uLL);
    poly_short_sample((uint64_t)v9[348].i64, a4);
    poly_short_sample((uint64_t)v9[436].i64, a4 + 700);
    v10 = v9 + 524;
    poly_lift((uint64_t)v9[524].i64, (int16x8_t *)v9[348].i16);
    poly_mul(v9, (uint64_t)v9[612].i64, (int16x8_t *)v9[436].i16, v4);
    v11 = 701;
    do
    {
      v10[88].i16[0] += v10->i16[0];
      v10 = (int16x8_t *)((char *)v10 + 2);
      --v11;
    }
    while (v11);
    poly_marshal(a1, (uint64_t)v9[612].i64);
    v12 = v9 + 707;
    poly_marshal_mod3((uint64_t)v9[707].i64, (uint64_t)v9[348].i64);
    v13 = (char *)&v9[715].u64[1] + 4;
    poly_marshal_mod3((uint64_t)&v9[715].i64[1] + 4, (uint64_t)v9[436].i64);
    v14 = (SHA256_CTX *)&v9[700];
    SHA256_Init(v14);
    SHA256_Update(v14, "shared key", 0xBuLL);
    SHA256_Update(v14, v12, 0x8CuLL);
    SHA256_Update(v14, v13, 0x8CuLL);
    SHA256_Update(v14, a1, 0x472uLL);
    SHA256_Final(a2, v14);
    OPENSSL_free(v16);
    return 1;
  }
  else
  {
    bzero(a1, 0x472uLL);
    RAND_bytes(a2, 32);
    return 0;
  }
}

uint64_t poly_short_sample(uint64_t result, uint64_t a2)
{
  uint64_t i;
  signed int v3;

  for (i = 0; i != 700; ++i)
  {
    v3 = -3 * ((21845 * *(unsigned __int8 *)(a2 + i)) >> 16) + *(unsigned __int8 *)(a2 + i);
    *(_WORD *)(result + 2 * i) = ((((unsigned __int16)(((v3 & (v3 >> 1)) - 1) & v3) >> 1) ^ 1) - 1) | ((v3 & (v3 >> 1)) - 1) & v3;
  }
  *(_WORD *)(result + 1400) = 0;
  *(_WORD *)(result + 1406) = 0;
  *(_DWORD *)(result + 1402) = 0;
  return result;
}

uint64_t poly_lift(uint64_t result, _WORD *a2)
{
  __int16 v2;
  __int16 v3;
  __int16 v4;
  int16x8_t v5;
  uint64_t v6;
  int16x8_t v7;
  const __int16 *v8;
  uint64_t v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  uint64_t v13;
  int v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  __int16 v19;
  __int16 v20;
  int16x8x3_t v21;

  v2 = a2[2] + *a2;
  *(_WORD *)result = v2;
  v3 = a2[1];
  *(_WORD *)(result + 2) = v3;
  v4 = a2[2] - *a2;
  *(_WORD *)(result + 4) = v4;
  v5 = 0uLL;
  v6 = 3;
  v7 = 0uLL;
  do
  {
    v8 = &a2[v6];
    v6 += 24;
    v21 = vld3q_s16(v8);
    v5 = vaddq_s16(vsubq_s16(v5, v21.val[0]), v21.val[2]);
    v7 = vaddq_s16(vsubq_s16(v7, v21.val[2]), v21.val[1]);
  }
  while (v6 != 699);
  v9 = 0;
  v10 = vaddvq_s16(v7);
  v11 = vaddvq_s16(v5) - a2[699];
  v12 = a2[700];
  *(_WORD *)result = v11 + v2;
  *(_WORD *)(result + 2) = v3 - (v11 + v12 + v10);
  *(_WORD *)(result + 4) = v12 + v10 + v4;
  do
  {
    *(_WORD *)(result + v9 * 2 + 6) = *(_WORD *)(result + v9 * 2) - a2[v9 + 3] - (a2[v9 + 1] + a2[v9 + 2]);
    ++v9;
  }
  while (v9 != 698);
  v13 = 0;
  v14 = *(unsigned __int16 *)(result + 1400);
  do
  {
    v15 = -3 * ((21845 * (__int16)(*(_WORD *)(result + v13) - v14)) >> 16)
        + *(unsigned __int16 *)(result + v13)
        - v14;
    v16 = ((v15 & ((__int16)v15 >> 1)) - 1) & v15;
    *(_WORD *)(result + v13) = v16 | -((unsigned __int16)(v16 & 0xFFFE) >> 1);
    v13 += 2;
  }
  while (v13 != 1402);
  v17 = 0;
  v18 = *(_WORD *)(result + 1400);
  v19 = v18;
  do
  {
    v20 = *(_WORD *)(result + v17 + 1398);
    *(_WORD *)(result + v17 + 1400) = v20 - v19;
    v17 -= 2;
    v19 = v20;
  }
  while (v17 != -1400);
  *(_WORD *)result = v18 - *(_WORD *)result;
  *(_WORD *)(result + 1406) = 0;
  *(_DWORD *)(result + 1402) = 0;
  return result;
}

_BYTE *poly_marshal(_BYTE *result, uint64_t a2)
{
  unsigned __int16 *v2;
  uint64_t i;
  _BYTE *v4;

  v2 = (unsigned __int16 *)(a2 + 4);
  for (i = 6; i != 1137; i += 13)
  {
    v4 = &result[i];
    *(v4 - 6) = *((_BYTE *)v2 - 4);
    *(v4 - 5) = *((_BYTE *)v2 - 3) & 0x1F | (32 * *(v2 - 1));
    *(v4 - 4) = *(v2 - 1) >> 3;
    *(v4 - 3) = (4 * *v2) | (*(v2 - 1) >> 11) & 3;
    *(v4 - 2) = (v2[1] << 7) | (*v2 >> 6) & 0x7F;
    *(v4 - 1) = v2[1] >> 1;
    *v4 = (16 * v2[2]) | (v2[1] >> 9) & 0xF;
    v4[1] = v2[2] >> 4;
    v4[2] = (2 * v2[3]) | ((v2[2] & 0x1000) != 0);
    v4[3] = (v2[4] << 6) | (v2[3] >> 7) & 0x3F;
    v4[4] = v2[4] >> 2;
    v4[5] = (8 * v2[5]) | (v2[4] >> 10) & 7;
    v4[6] = v2[5] >> 5;
    v2 += 8;
  }
  result[1131] = *((_BYTE *)v2 - 4);
  result[1132] = *((_BYTE *)v2 - 3) & 0x1F | (32 * *(v2 - 1));
  result[1133] = *(v2 - 1) >> 3;
  result[1134] = (4 * *v2) | (*(v2 - 1) >> 11) & 3;
  result[1135] = (v2[1] << 7) | (*v2 >> 6) & 0x7F;
  result[1136] = v2[1] >> 1;
  result[1137] = (v2[1] >> 9) & 0xF;
  return result;
}

uint64_t poly_marshal_mod3(uint64_t result, uint64_t a2)
{
  uint64_t i;
  int8x8_t v3;

  if (*(_WORD *)(a2 + 1400))
    poly_marshal_mod3_cold_1();
  for (i = 0; i != 140; ++i)
  {
    v3 = vand_s8(*(int8x8_t *)(a2 + 2), (int8x8_t)0x3000300030003);
    *(_BYTE *)(result + i) = vaddv_s16(vmul_s16((int16x4_t)veor_s8((int8x8_t)vshr_n_u16((uint16x4_t)v3, 1uLL), v3), (int16x4_t)0x51001B00090003))+ (*(_WORD *)a2 & 3 ^ ((*(_WORD *)a2 & 3) >> 1));
    a2 += 10;
  }
  return result;
}

uint64_t HRSS_decap(unsigned __int8 *a1, uint64_t a2, void *a3, size_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v10;
  char *v11;
  uint64_t i;
  __int128 v13;
  SHA256_CTX *v14;
  __int128 v15;
  uint64_t v16;
  int8x16_t v17;
  __int128 v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  __int16 v22;
  uint64_t j;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unsigned int v27;
  unint64_t *v28;
  unint64_t *v29;
  char v30;
  int v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  int v35;
  unsigned __int8 *v36;
  uint64_t v37;
  char v38;
  void *v40;
  unsigned __int8 md[16];
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = -(int)a2 & 0xFLL;
  v6 = a2 + v5;
  if (((a2 + v5) & 0xF) != 0)
    HRSS_generate_key_cold_3((uint64_t)a1, a2, (uint64_t)a3);
  v40 = (void *)0xAAAAAAAAAAAAAAAALL;
  v10 = (char *)malloc_align32((uint64_t *)&v40, 16176);
  if (v10)
  {
    v11 = v10;
    memset(v10, 255, 0x3F30uLL);
    for (i = 0; i != 32; ++i)
      v11[i + 5568] = *(_BYTE *)(v5 + a2 + 1760 + i) ^ 0x36;
    *(_QWORD *)&v13 = 0x3636363636363636;
    *((_QWORD *)&v13 + 1) = 0x3636363636363636;
    *((_OWORD *)v11 + 351) = v13;
    *((_OWORD *)v11 + 350) = v13;
    v14 = (SHA256_CTX *)(v11 + 5632);
    SHA256_Init((SHA256_CTX *)(v11 + 5632));
    SHA256_Update((SHA256_CTX *)(v11 + 5632), v11 + 5568, 0x40uLL);
    SHA256_Update((SHA256_CTX *)(v11 + 5632), a3, a4);
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)md = v15;
    v42 = v15;
    SHA256_Final(md, (SHA256_CTX *)(v11 + 5632));
    v16 = -32;
    v17.i64[0] = 0x6A6A6A6A6A6A6A6ALL;
    v17.i64[1] = 0x6A6A6A6A6A6A6A6ALL;
    do
    {
      *(int8x16_t *)&v11[v16 + 5600] = veorq_s8(*(int8x16_t *)&v11[v16 + 5600], v17);
      v16 += 16;
    }
    while (v16);
    *(_QWORD *)&v18 = 0x5C5C5C5C5C5C5C5CLL;
    *((_QWORD *)&v18 + 1) = 0x5C5C5C5C5C5C5C5CLL;
    *((_OWORD *)v11 + 350) = v18;
    *((_OWORD *)v11 + 351) = v18;
    SHA256_Init((SHA256_CTX *)(v11 + 5632));
    SHA256_Update((SHA256_CTX *)(v11 + 5632), v11 + 5568, 0x40uLL);
    SHA256_Update((SHA256_CTX *)(v11 + 5632), md, 0x20uLL);
    SHA256_Final(a1, (SHA256_CTX *)(v11 + 5632));
    if (a4 == 1138 && poly_unmarshal((uint64_t)(v11 + 5744), (uint64_t)a3))
    {
      poly_from_poly3((uint64_t)(v11 + 7152), (_QWORD *)v6);
      poly_mul((int16x8_t *)v11, (uint64_t)(v11 + 8560), (_WORD *)v11 + 2872, (_WORD *)v11 + 3576);
      poly3_from_poly((unint64_t *)v11 + 1246, (uint64_t)(v11 + 8560));
      HRSS_poly3_mul((uint64_t)(v11 + 10144), (_QWORD *)v11 + 1246, (unint64_t *)(v6 + 176));
      poly_from_poly3((uint64_t)(v11 + 10320), (_QWORD *)v11 + 1268);
      poly_lift((uint64_t)(v11 + 11728), (_WORD *)v11 + 5160);
      v19 = 0;
      v20 = v11 + 13136;
      do
      {
        *(_WORD *)&v11[v19 + 13136] = *(_WORD *)&v11[v19 + 5744] - *(_WORD *)&v11[v19 + 11728];
        v19 += 2;
      }
      while (v19 != 1402);
      *((_WORD *)v11 + 7271) = 0;
      *(_DWORD *)(v11 + 14538) = 0;
      poly_mul((int16x8_t *)v11, (uint64_t)(v11 + 13136), (_WORD *)v11 + 6568, (_WORD *)(v6 + 352));
      v21 = 0;
      v22 = *((_WORD *)v11 + 7268);
      do
      {
        *(_WORD *)&v20[v21] -= v22;
        v21 += 2;
      }
      while (v21 != 1402);
      for (j = 0; j != 1402; j += 2)
        *(_WORD *)&v20[j] &= 0x1FFFu;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      v27 = 0;
      v28 = (unint64_t *)(v11 + 14544);
      v29 = (unint64_t *)(v11 + 14632);
      v30 = -1;
      do
      {
        v31 = *(unsigned __int16 *)&v20[v24];
        v32 = v31 & 2;
        if ((v31 & 3 ^ (v32 >> 1) | -(v32 >> 1) & 0x1FFF) != v31)
          v30 = 0;
        v25 = (v25 >> 1) | ((unint64_t)((v31 & 2) >> 1) << 63);
        *((_QWORD *)&v33 + 1) = v31 & 3 ^ (v32 >> 1);
        *(_QWORD *)&v33 = v26;
        v26 = (v33 >> 1) | (v32 << 62);
        if (++v27 == 64)
        {
          v27 = 0;
          *v28++ = v25;
          *v29++ = v26;
          v26 = 0;
          v25 = 0;
        }
        v24 += 2;
      }
      while (v24 != 1402);
      v34 = -(uint64_t)v27;
      *v28 = v25 >> v34;
      *v29 = v26 >> v34;
      poly_marshal(v11 + 14720, (uint64_t)(v11 + 5744));
      poly_marshal_mod3((uint64_t)(v11 + 15858), (uint64_t)(v11 + 10320));
      poly_marshal_mod3((uint64_t)(v11 + 15998), (uint64_t)(v11 + 13136));
      v35 = CRYPTO_memcmp((char *)a3, v11 + 14720, 1138);
      SHA256_Init((SHA256_CTX *)(v11 + 5632));
      SHA256_Update((SHA256_CTX *)(v11 + 5632), "shared key", 0xBuLL);
      SHA256_Update((SHA256_CTX *)(v11 + 5632), v11 + 15858, 0x8CuLL);
      SHA256_Update((SHA256_CTX *)(v11 + 5632), v11 + 15998, 0x8CuLL);
      SHA256_Update((SHA256_CTX *)(v11 + 5632), v11 + 14720, 0x472uLL);
      v36 = (unsigned __int8 *)(v11 + 16138);
      SHA256_Final(v36, v14);
      v37 = 0;
      if (v35)
        v38 = 0;
      else
        v38 = v30;
      do
      {
        a1[v37] = ~v38 & a1[v37] | v38 & v36[v37];
        ++v37;
      }
      while (v37 != 32);
    }
    OPENSSL_free(v40);
    return 1;
  }
  else
  {
    RAND_bytes(a1, 32);
    return 0;
  }
}

uint64_t poly_unmarshal(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _BYTE *v3;
  _WORD *v4;
  uint64_t v5;
  uint64_t v6;
  __int16 v7;

  v2 = 0;
  v3 = (_BYTE *)(a2 + 3);
  do
  {
    v4 = (_WORD *)(a1 + v2);
    *v4 = *(v3 - 3) | ((*(v3 - 2) & 0x1F) << 8);
    v4[1] = ((*(v3 - 2) >> 5) | (8 * *(v3 - 1))) & 0xE7FF | ((*v3 & 3) << 11);
    v4[2] = (*v3 >> 2) & 0x3F | ((v3[1] & 0x7F) << 6);
    v4[3] = ((v3[1] >> 7) | (2 * v3[2])) & 0xE1FF | ((v3[3] & 0xF) << 9);
    v4[4] = ((v3[3] >> 4) | (16 * v3[4])) & 0xEFFF | ((v3[5] & 1) << 12);
    v4[5] = (v3[5] >> 1) & 0x7F | ((v3[6] & 0x3F) << 7);
    v4[6] = ((v3[6] >> 6) | (4 * v3[7])) & 0xE3FF | ((v3[8] & 7) << 10);
    v4[7] = (v3[8] >> 3) | (32 * v3[9]);
    v2 += 16;
    v3 += 13;
  }
  while (v2 != 1392);
  v5 = 0;
  *(_WORD *)(a1 + 1392) = *(v3 - 3) | ((*(v3 - 2) & 0x1F) << 8);
  *(_WORD *)(a1 + 1394) = ((*(v3 - 2) >> 5) | (8 * *(v3 - 1))) & 0xE7FF | ((*v3 & 3) << 11);
  *(_WORD *)(a1 + 1396) = (*v3 >> 2) & 0x3F | ((v3[1] & 0x7F) << 6);
  *(_WORD *)(a1 + 1398) = ((v3[1] >> 7) | (2 * v3[2])) & 0xE1FF | ((v3[3] & 0xF) << 9);
  do
  {
    *(_WORD *)(a1 + v5) = (__int16)(8 * *(_WORD *)(a1 + v5)) >> 3;
    v5 += 2;
  }
  while (v5 != 1400);
  if (v3[3] > 0xFu)
    return 0;
  v6 = 0;
  v7 = 0;
  do
  {
    v7 += *(_WORD *)(a1 + v6);
    v6 += 2;
  }
  while (v6 != 1400);
  *(_WORD *)(a1 + 1400) = -v7;
  *(_WORD *)(a1 + 1406) = 0;
  *(_DWORD *)(a1 + 1402) = 0;
  return 1;
}

uint64_t poly_from_poly3(uint64_t result, _QWORD *a2)
{
  uint64_t v2;
  int v3;
  _QWORD *v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v2 = 0;
  v3 = 0;
  v4 = a2 + 11;
  v5 = a2[11];
  v6 = ~*a2;
  do
  {
    *(_WORD *)(result + v2) = ((v6 & 1) - 1) | v5 & 1;
    if (++v3 == 64)
    {
      v3 = 0;
      v8 = a2[1];
      ++a2;
      v7 = v8;
      v9 = v4[1];
      ++v4;
      v5 = v9;
      v6 = ~v7;
    }
    else
    {
      v6 >>= 1;
      v5 >>= 1;
    }
    v2 += 2;
  }
  while (v2 != 1402);
  *(_WORD *)(result + 1406) = 0;
  *(_DWORD *)(result + 1402) = 0;
  return result;
}

_BYTE *HRSS_marshal_public_key(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = a2 + (-(int)a2 & 0xFLL);
  if ((v3 & 0xF) != 0)
    HRSS_generate_key_cold_3((uint64_t)a1, v3, a3);
  return poly_marshal(a1, v3);
}

uint64_t HRSS_parse_public_key(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v3 = -(int)a1 & 0xFLL;
  v4 = a1 + v3;
  if (((a1 + v3) & 0xF) != 0)
    HRSS_generate_key_cold_3(a1, a2, a3);
  result = poly_unmarshal(a1 + v3, a2);
  if ((_DWORD)result)
  {
    *(_WORD *)(v4 + 1406) = 0;
    *(_DWORD *)(v4 + 1402) = 0;
    return 1;
  }
  return result;
}

uint64_t **poly3_span_sub(uint64_t **result, uint64_t **a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (a3)
  {
    v3 = *result;
    v4 = result[1];
    v5 = *a2;
    v6 = a2[1];
    do
    {
      v7 = *v3;
      v9 = *v5++;
      v8 = v9;
      v10 = *v6++;
      v11 = v10 ^ *v4;
      *v3 = (v11 ^ v8) & (v10 ^ *v3);
      ++v3;
      *v4++ = v11 | v8 ^ v7;
      --a3;
    }
    while (a3);
  }
  return result;
}

int8x16_t *poly2_reverse_700(int8x16_t *result, uint64_t a2)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int8x16_t *v7;
  _OWORD v8[5];
  unint64_t v9;

  v2 = 0;
  v9 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8[3] = v3;
  v8[4] = v3;
  v8[1] = v3;
  v8[2] = v3;
  v8[0] = v3;
  do
  {
    v4 = 0;
    v5 = *(_QWORD *)(a2 + 8 * v2);
    do
    {
      v5 = (v5 >> (1 << v4)) & word_reverse_kMasks[v4] | ((word_reverse_kMasks[v4] & v5) << (1 << v4));
      ++v4;
    }
    while (v4 != 6);
    *((_QWORD *)v8 + v2++) = v5;
  }
  while (v2 != 11);
  v6 = 0;
  v7 = result;
  do
  {
    *v7++ = vorrq_s8((int8x16_t)vshlq_n_s64((int64x2_t)vextq_s8((int8x16_t)v8[v6 + 4], (int8x16_t)v8[v6 + 4], 8uLL), 0x3CuLL), (int8x16_t)vshrq_n_u64((uint64x2_t)vextq_s8(*(int8x16_t *)((char *)&v8[v6 + 4] + 8), *(int8x16_t *)((char *)&v8[v6 + 4] + 8), 8uLL), 4uLL));
    --v6;
  }
  while (v6 != -5);
  result[5].i64[0] = *(_QWORD *)&v8[0] >> 4;
  return result;
}

_WORD *poly_assert_normalized(_WORD *result)
{
  if (result[701])
    poly_assert_normalized_cold_3();
  if (result[702])
    poly_assert_normalized_cold_2();
  if (result[703])
    poly_assert_normalized_cold_1();
  return result;
}

uint64_t poly_mul_vec_aux(uint64_t result, int16x8_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  int16x8_t *v7;
  int16x8_t v9;
  int16x8_t v10;
  int16x8_t v11;
  int16x8_t v12;
  int16x8_t v13;
  int16x8_t v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t v17;
  int16x8_t v18;
  int16x8_t v19;
  int16x8_t v20;
  int16x8_t v21;
  int16x8_t v22;
  int16x8_t v23;
  int16x8_t v24;
  int16x8_t v25;
  int16x8_t v26;
  int16x8_t v27;
  int16x8_t v28;
  int16x8_t v29;
  int16x8_t v30;
  int16x8_t v31;
  int16x8_t v32;
  int16x8_t v33;
  int16x8_t v34;
  int16x8_t v35;
  int16x8_t v36;
  int16x8_t v37;
  int16x8_t v38;
  int16x8_t v39;
  int16x8_t v40;
  int16x8_t v41;
  int16x8_t v42;
  int16x8_t v43;
  int16x8_t v44;
  int16x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int16x8_t v48;
  int16x8_t v49;
  int16x8_t v50;
  int16x8_t v51;
  int16x8_t v52;
  int16x8_t v53;
  int16x8_t v54;
  int16x8_t v55;
  int16x8_t v56;
  int16x8_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  int16x8_t v61;
  int16x8_t v62;
  int16x8_t v63;
  int16x8_t v64;
  int16x8_t v65;
  int16x8_t v66;
  int16x8_t v67;
  int16x8_t v68;
  int16x8_t v69;
  int16x8_t v70;
  int16x8_t v71;
  int16x8_t v72;
  int16x8_t v73;
  int16x8_t v74;
  int16x8_t v75;
  int16x8_t v76;
  int16x8_t v77;
  int16x8_t v78;
  int16x8_t v79;
  int16x8_t v80;
  int16x8_t v81;
  int16x8_t v82;
  int16x8_t v83;
  int16x8_t v84;
  int16x8_t v85;
  int16x8_t v86;
  int16x8_t v87;
  int16x8_t v88;
  int16x8_t v89;
  int16x8_t v90;
  int16x8_t v91;
  int16x8_t v92;
  int16x8_t v93;
  int16x8_t v94;
  int16x8_t v95;
  int16x8_t v96;
  int16x8_t v97;
  int16x8_t v98;
  int16x8_t v99;
  int16x8_t v100;
  int16x8_t v101;
  int16x8_t v102;
  int16x8_t v103;
  int16x8_t v104;
  int16x8_t v105;
  int16x8_t v106;
  int16x8_t v107;
  int16x8_t v108;
  int16x8_t v109;
  int16x8_t v110;
  int16x8_t v111;
  int16x8_t v112;
  int16x8_t v113;
  int16x8_t v114;
  int16x8_t v115;
  int16x8_t v116;
  int16x8_t v117;
  int16x8_t v118;
  int16x8_t v119;
  int16x8_t v120;
  int16x8_t v121;
  int16x8_t v122;
  int16x8_t v123;
  int16x8_t v124;
  int16x8_t v125;
  int16x8_t v126;
  int16x8_t v127;
  int16x8_t v128;
  int16x8_t *v129;
  unint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  int16x8_t *v135;
  int16x8_t *v136;
  int16x8_t *v137;
  int16x8_t v138;
  int16x8_t v139;
  int16x8_t v140;
  int16x8_t v141;
  unint64_t v142;
  int16x8_t *v143;
  int16x8_t *v144;
  unint64_t v145;
  uint64_t v146;
  int16x8_t *v147;
  int16x8_t v148;
  int16x8_t *v149;
  int16x8_t v150;
  uint64_t v151;

  v7 = (int16x8_t *)result;
  if (a5 == 3)
  {
    v61 = *(int16x8_t *)(a3 + 16);
    v62 = *(int16x8_t *)(a3 + 32);
    v63 = *(int16x8_t *)(a4 + 16);
    v64 = *(int16x8_t *)(a4 + 32);
    v65 = (int16x8_t)vextq_s8((int8x16_t)v62, (int8x16_t)0, 0xEuLL);
    v66 = (int16x8_t)vextq_s8((int8x16_t)v61, (int8x16_t)v62, 0xEuLL);
    v67 = (int16x8_t)vextq_s8(*(int8x16_t *)a3, (int8x16_t)v61, 0xEuLL);
    v68 = (int16x8_t)vextq_s8((int8x16_t)0, *(int8x16_t *)a3, 0xEuLL);
    v69 = vmlaq_lane_s16(vmlaq_lane_s16(vmlaq_lane_s16(vmulq_n_s16(v61, *(_OWORD *)a4), *(int16x8_t *)a3, *(int16x4_t *)v63.i8, 0), v67, *(int16x4_t *)a4, 1), v68, *(int16x4_t *)v63.i8, 1);
    v70 = vmlaq_lane_s16(vmlaq_lane_s16(vmlaq_lane_s16(vmlaq_lane_s16(vmlaq_lane_s16(vmulq_n_s16(v62, *(_OWORD *)a4), v61, *(int16x4_t *)v63.i8, 0), *(int16x8_t *)a3, *(int16x4_t *)v64.i8, 0), v66, *(int16x4_t *)a4, 1), v67, *(int16x4_t *)v63.i8, 1), v68, *(int16x4_t *)v64.i8, 1);
    v71 = vmlaq_lane_s16(vmlaq_lane_s16(vmlaq_lane_s16(vmlaq_lane_s16(vmulq_n_s16(v62, v63.i16[0]), v61, *(int16x4_t *)v64.i8, 0), v65, *(int16x4_t *)a4, 1), v66, *(int16x4_t *)v63.i8, 1), v67, *(int16x4_t *)v64.i8, 1);
    v72 = vmlaq_lane_s16(vmlaq_lane_s16(vmulq_lane_s16(v65, *(int16x4_t *)v63.i8, 1), v62, *(int16x4_t *)v64.i8, 0), v66, *(int16x4_t *)v64.i8, 1);
    v73 = vmulq_lane_s16(v65, *(int16x4_t *)v64.i8, 1);
    v74 = (int16x8_t)vextq_s8((int8x16_t)v66, (int8x16_t)v65, 0xEuLL);
    v75 = (int16x8_t)vextq_s8((int8x16_t)v67, (int8x16_t)v66, 0xEuLL);
    v76 = (int16x8_t)vextq_s8((int8x16_t)v68, (int8x16_t)v67, 0xEuLL);
    v77 = (int16x8_t)vextq_s8((int8x16_t)0, (int8x16_t)v68, 0xEuLL);
    v78 = vmlaq_lane_s16(vmlaq_lane_s16(vmulq_n_s16(*(int16x8_t *)a3, *(_OWORD *)a4), v68, *(int16x4_t *)a4, 1), v77, *(int16x4_t *)a4, 2);
    v79 = vmlaq_lane_s16(vmlaq_lane_s16(v69, v76, *(int16x4_t *)a4, 2), v77, *(int16x4_t *)v63.i8, 2);
    v80 = vmlaq_lane_s16(vmlaq_lane_s16(vmlaq_lane_s16(v70, v75, *(int16x4_t *)a4, 2), v76, *(int16x4_t *)v63.i8, 2), v77, *(int16x4_t *)v64.i8, 2);
    v81 = vmlaq_lane_s16(vmlaq_lane_s16(vmlaq_lane_s16(v71, v74, *(int16x4_t *)a4, 2), v75, *(int16x4_t *)v63.i8, 2), v76, *(int16x4_t *)v64.i8, 2);
    v82 = vmlaq_lane_s16(vmlaq_lane_s16(v72, v74, *(int16x4_t *)v63.i8, 2), v75, *(int16x4_t *)v64.i8, 2);
    v83 = vmlaq_lane_s16(v73, v74, *(int16x4_t *)v64.i8, 2);
    v84 = (int16x8_t)vextq_s8((int8x16_t)v75, (int8x16_t)v74, 0xEuLL);
    v85 = (int16x8_t)vextq_s8((int8x16_t)v76, (int8x16_t)v75, 0xEuLL);
    v86 = (int16x8_t)vextq_s8((int8x16_t)v77, (int8x16_t)v76, 0xEuLL);
    v87 = (int16x8_t)vextq_s8((int8x16_t)0, (int8x16_t)v77, 0xEuLL);
    v88 = vmlaq_lane_s16(v78, v87, *(int16x4_t *)a4, 3);
    v89 = vmlaq_lane_s16(vmlaq_lane_s16(v79, v86, *(int16x4_t *)a4, 3), v87, *(int16x4_t *)v63.i8, 3);
    v90 = vmlaq_lane_s16(vmlaq_lane_s16(vmlaq_lane_s16(v80, v85, *(int16x4_t *)a4, 3), v86, *(int16x4_t *)v63.i8, 3), v87, *(int16x4_t *)v64.i8, 3);
    v91 = vmlaq_lane_s16(vmlaq_lane_s16(vmlaq_lane_s16(v81, v84, *(int16x4_t *)a4, 3), v85, *(int16x4_t *)v63.i8, 3), v86, *(int16x4_t *)v64.i8, 3);
    v92 = vmlaq_lane_s16(vmlaq_lane_s16(v82, v84, *(int16x4_t *)v63.i8, 3), v85, *(int16x4_t *)v64.i8, 3);
    v93 = vmlaq_lane_s16(v83, v84, *(int16x4_t *)v64.i8, 3);
    v94 = (int16x8_t)vextq_s8((int8x16_t)v85, (int8x16_t)v84, 0xEuLL);
    v95 = (int16x8_t)vextq_s8((int8x16_t)v86, (int8x16_t)v85, 0xEuLL);
    v96 = (int16x8_t)vextq_s8((int8x16_t)v87, (int8x16_t)v86, 0xEuLL);
    v97 = (int16x8_t)vextq_s8((int8x16_t)0, (int8x16_t)v87, 0xEuLL);
    v98 = vmlaq_laneq_s16(v88, v97, *(int16x8_t *)a4, 4);
    v99 = vmlaq_laneq_s16(vmlaq_laneq_s16(v89, v96, *(int16x8_t *)a4, 4), v97, v63, 4);
    v100 = vmlaq_laneq_s16(vmlaq_laneq_s16(vmlaq_laneq_s16(v90, v95, *(int16x8_t *)a4, 4), v96, v63, 4), v97, v64, 4);
    v101 = vmlaq_laneq_s16(vmlaq_laneq_s16(vmlaq_laneq_s16(v91, v94, *(int16x8_t *)a4, 4), v95, v63, 4), v96, v64, 4);
    v102 = vmlaq_laneq_s16(vmlaq_laneq_s16(v92, v94, v63, 4), v95, v64, 4);
    v103 = vmlaq_laneq_s16(v93, v94, v64, 4);
    v104 = (int16x8_t)vextq_s8((int8x16_t)v95, (int8x16_t)v94, 0xEuLL);
    v105 = (int16x8_t)vextq_s8((int8x16_t)v96, (int8x16_t)v95, 0xEuLL);
    v106 = (int16x8_t)vextq_s8((int8x16_t)v97, (int8x16_t)v96, 0xEuLL);
    v107 = (int16x8_t)vextq_s8((int8x16_t)0, (int8x16_t)v97, 0xEuLL);
    v108 = vmlaq_laneq_s16(v98, v107, *(int16x8_t *)a4, 5);
    v109 = vmlaq_laneq_s16(vmlaq_laneq_s16(v99, v106, *(int16x8_t *)a4, 5), v107, v63, 5);
    v110 = vmlaq_laneq_s16(vmlaq_laneq_s16(vmlaq_laneq_s16(v100, v105, *(int16x8_t *)a4, 5), v106, v63, 5), v107, v64, 5);
    v111 = vmlaq_laneq_s16(vmlaq_laneq_s16(vmlaq_laneq_s16(v101, v104, *(int16x8_t *)a4, 5), v105, v63, 5), v106, v64, 5);
    v112 = vmlaq_laneq_s16(vmlaq_laneq_s16(v102, v104, v63, 5), v105, v64, 5);
    v113 = vmlaq_laneq_s16(v103, v104, v64, 5);
    v114 = (int16x8_t)vextq_s8((int8x16_t)v105, (int8x16_t)v104, 0xEuLL);
    v115 = (int16x8_t)vextq_s8((int8x16_t)v106, (int8x16_t)v105, 0xEuLL);
    v116 = (int16x8_t)vextq_s8((int8x16_t)v107, (int8x16_t)v106, 0xEuLL);
    v117 = (int16x8_t)vextq_s8((int8x16_t)0, (int8x16_t)v107, 0xEuLL);
    v118 = vmlaq_laneq_s16(vmlaq_laneq_s16(v109, v116, *(int16x8_t *)a4, 6), v117, v63, 6);
    v119 = vmlaq_laneq_s16(vmlaq_laneq_s16(vmlaq_laneq_s16(v110, v115, *(int16x8_t *)a4, 6), v116, v63, 6), v117, v64, 6);
    v120 = vmlaq_laneq_s16(vmlaq_laneq_s16(vmlaq_laneq_s16(v111, v114, *(int16x8_t *)a4, 6), v115, v63, 6), v116, v64, 6);
    v121 = vmlaq_laneq_s16(vmlaq_laneq_s16(v112, v114, v63, 6), v115, v64, 6);
    v122 = vmlaq_laneq_s16(v113, v114, v64, 6);
    v123 = (int16x8_t)vextq_s8((int8x16_t)v115, (int8x16_t)v114, 0xEuLL);
    v124 = (int16x8_t)vextq_s8((int8x16_t)v116, (int8x16_t)v115, 0xEuLL);
    v125 = (int16x8_t)vextq_s8((int8x16_t)v117, (int8x16_t)v116, 0xEuLL);
    v126 = (int16x8_t)vextq_s8((int8x16_t)0, (int8x16_t)v117, 0xEuLL);
    v127 = vmlaq_laneq_s16(vmlaq_laneq_s16(v118, v125, *(int16x8_t *)a4, 7), v126, v63, 7);
    v128 = vmlaq_laneq_s16(vmlaq_laneq_s16(vmlaq_laneq_s16(v119, v124, *(int16x8_t *)a4, 7), v125, v63, 7), v126, v64, 7);
    v55 = vmlaq_laneq_s16(vmlaq_laneq_s16(vmlaq_laneq_s16(v120, v123, *(int16x8_t *)a4, 7), v124, v63, 7), v125, v64, 7);
    v56 = vmlaq_laneq_s16(vmlaq_laneq_s16(v121, v123, v63, 7), v124, v64, 7);
    v57 = vmlaq_laneq_s16(v122, v123, v64, 7);
    *(int16x8_t *)result = vmlaq_laneq_s16(vmlaq_laneq_s16(v108, v117, *(int16x8_t *)a4, 6), v126, *(int16x8_t *)a4, 7);
    *(int16x8_t *)(result + 16) = v127;
    *(int16x8_t *)(result + 32) = v128;
    v58 = 80;
    v59 = 64;
    v60 = 48;
    goto LABEL_5;
  }
  if (a5 == 2)
  {
    v9 = *(int16x8_t *)(a3 + 16);
    v10 = *(int16x8_t *)(a4 + 16);
    v11 = (int16x8_t)vextq_s8((int8x16_t)v9, (int8x16_t)0, 0xEuLL);
    v12 = (int16x8_t)vextq_s8(*(int8x16_t *)a3, (int8x16_t)v9, 0xEuLL);
    v13 = (int16x8_t)vextq_s8((int8x16_t)0, *(int8x16_t *)a3, 0xEuLL);
    v14 = vmlaq_lane_s16(vmulq_n_s16(*(int16x8_t *)a3, *(_OWORD *)a4), v13, *(int16x4_t *)a4, 1);
    v15 = vmlaq_lane_s16(vmlaq_lane_s16(vmlaq_lane_s16(vmulq_n_s16(v9, *(_OWORD *)a4), *(int16x8_t *)a3, *(int16x4_t *)v10.i8, 0), v12, *(int16x4_t *)a4, 1), v13, *(int16x4_t *)v10.i8, 1);
    v16 = vmlaq_lane_s16(vmlaq_lane_s16(vmulq_lane_s16(v11, *(int16x4_t *)a4, 1), v9, *(int16x4_t *)v10.i8, 0), v12, *(int16x4_t *)v10.i8, 1);
    v17 = vmulq_lane_s16(v11, *(int16x4_t *)v10.i8, 1);
    v18 = (int16x8_t)vextq_s8((int8x16_t)v12, (int8x16_t)v11, 0xEuLL);
    v19 = (int16x8_t)vextq_s8((int8x16_t)v13, (int8x16_t)v12, 0xEuLL);
    v20 = (int16x8_t)vextq_s8((int8x16_t)0, (int8x16_t)v13, 0xEuLL);
    v21 = vmlaq_lane_s16(v14, v20, *(int16x4_t *)a4, 2);
    v22 = vmlaq_lane_s16(vmlaq_lane_s16(v15, v19, *(int16x4_t *)a4, 2), v20, *(int16x4_t *)v10.i8, 2);
    v23 = vmlaq_lane_s16(vmlaq_lane_s16(v16, v18, *(int16x4_t *)a4, 2), v19, *(int16x4_t *)v10.i8, 2);
    v24 = vmlaq_lane_s16(v17, v18, *(int16x4_t *)v10.i8, 2);
    v25 = (int16x8_t)vextq_s8((int8x16_t)v19, (int8x16_t)v18, 0xEuLL);
    v26 = (int16x8_t)vextq_s8((int8x16_t)v20, (int8x16_t)v19, 0xEuLL);
    v27 = (int16x8_t)vextq_s8((int8x16_t)0, (int8x16_t)v20, 0xEuLL);
    v28 = vmlaq_lane_s16(v21, v27, *(int16x4_t *)a4, 3);
    v29 = vmlaq_lane_s16(vmlaq_lane_s16(v22, v26, *(int16x4_t *)a4, 3), v27, *(int16x4_t *)v10.i8, 3);
    v30 = vmlaq_lane_s16(vmlaq_lane_s16(v23, v25, *(int16x4_t *)a4, 3), v26, *(int16x4_t *)v10.i8, 3);
    v31 = vmlaq_lane_s16(v24, v25, *(int16x4_t *)v10.i8, 3);
    v32 = (int16x8_t)vextq_s8((int8x16_t)v26, (int8x16_t)v25, 0xEuLL);
    v33 = (int16x8_t)vextq_s8((int8x16_t)v27, (int8x16_t)v26, 0xEuLL);
    v34 = (int16x8_t)vextq_s8((int8x16_t)0, (int8x16_t)v27, 0xEuLL);
    v35 = vmlaq_laneq_s16(v28, v34, *(int16x8_t *)a4, 4);
    v36 = vmlaq_laneq_s16(vmlaq_laneq_s16(v29, v33, *(int16x8_t *)a4, 4), v34, v10, 4);
    v37 = vmlaq_laneq_s16(vmlaq_laneq_s16(v30, v32, *(int16x8_t *)a4, 4), v33, v10, 4);
    v38 = vmlaq_laneq_s16(v31, v32, v10, 4);
    v39 = (int16x8_t)vextq_s8((int8x16_t)v33, (int8x16_t)v32, 0xEuLL);
    v40 = (int16x8_t)vextq_s8((int8x16_t)v34, (int8x16_t)v33, 0xEuLL);
    v41 = (int16x8_t)vextq_s8((int8x16_t)0, (int8x16_t)v34, 0xEuLL);
    v42 = vmlaq_laneq_s16(v35, v41, *(int16x8_t *)a4, 5);
    v43 = vmlaq_laneq_s16(vmlaq_laneq_s16(v36, v40, *(int16x8_t *)a4, 5), v41, v10, 5);
    v44 = vmlaq_laneq_s16(vmlaq_laneq_s16(v37, v39, *(int16x8_t *)a4, 5), v40, v10, 5);
    v45 = vmlaq_laneq_s16(v38, v39, v10, 5);
    v46 = (int16x8_t)vextq_s8((int8x16_t)v40, (int8x16_t)v39, 0xEuLL);
    v47 = (int16x8_t)vextq_s8((int8x16_t)v41, (int8x16_t)v40, 0xEuLL);
    v48 = (int16x8_t)vextq_s8((int8x16_t)0, (int8x16_t)v41, 0xEuLL);
    v49 = vmlaq_laneq_s16(vmlaq_laneq_s16(v43, v47, *(int16x8_t *)a4, 6), v48, v10, 6);
    v50 = vmlaq_laneq_s16(vmlaq_laneq_s16(v44, v46, *(int16x8_t *)a4, 6), v47, v10, 6);
    v51 = vmlaq_laneq_s16(v45, v46, v10, 6);
    v52 = (int16x8_t)vextq_s8((int8x16_t)v47, (int8x16_t)v46, 0xEuLL);
    v53 = (int16x8_t)vextq_s8((int8x16_t)v48, (int8x16_t)v47, 0xEuLL);
    v54 = (int16x8_t)vextq_s8((int8x16_t)0, (int8x16_t)v48, 0xEuLL);
    v55 = vmlaq_laneq_s16(vmlaq_laneq_s16(v49, v53, *(int16x8_t *)a4, 7), v54, v10, 7);
    v56 = vmlaq_laneq_s16(vmlaq_laneq_s16(v50, v52, *(int16x8_t *)a4, 7), v53, v10, 7);
    v57 = vmlaq_laneq_s16(v51, v52, v10, 7);
    *(int16x8_t *)result = vmlaq_laneq_s16(vmlaq_laneq_s16(v42, v48, *(int16x8_t *)a4, 6), v54, *(int16x8_t *)a4, 7);
    v58 = 48;
    v59 = 32;
    v60 = 16;
LABEL_5:
    *(int16x8_t *)(result + v60) = v55;
    *(int16x8_t *)(result + v59) = v56;
    *(int16x8_t *)(result + v58) = v57;
    return result;
  }
  v129 = a2;
  v130 = a5 >> 1;
  v131 = a5 - (a5 >> 1);
  v132 = a3 + 16 * (a5 >> 1);
  v151 = 16 * a5;
  v133 = a4 + 16 * (a5 >> 1);
  if (a5 >= 2)
  {
    if (v130 <= 1)
      v134 = 1;
    else
      v134 = a5 >> 1;
    v135 = (int16x8_t *)a3;
    v136 = (int16x8_t *)a4;
    v137 = (int16x8_t *)result;
    do
    {
      v138 = v135[v130];
      v139 = *v135++;
      *v137 = vaddq_s16(v139, v138);
      v140 = v136[v130];
      v141 = *v136++;
      *(int16x8_t *)((char *)v137++ + v151 - 16 * v130) = vaddq_s16(v141, v140);
      --v134;
    }
    while (v134);
  }
  if (v131 != v130)
  {
    *(_OWORD *)(result + 16 * v130) = *(_OWORD *)(v132 + 16 * v130);
    *(_OWORD *)(result + 16 * a5) = *(_OWORD *)(v133 + 16 * v130);
  }
  poly_mul_vec_aux(a2, &a2[2 * v131], result, result + 16 * v131, a5 - (a5 >> 1));
  v142 = a5 & 0xFFFFFFFFFFFFFFFELL;
  poly_mul_vec_aux(&v7[v142], &v129[2 * v131], v132, v133, v131);
  result = poly_mul_vec_aux(v7, &v129[2 * v131], a3, a4, v130);
  if (v142)
  {
    v143 = v129;
    v144 = v7;
    v145 = v142;
    do
    {
      *v143 = vsubq_s16(*v143, vaddq_s16(*v144, v144[2 * v130]));
      ++v143;
      ++v144;
      --v145;
    }
    while (v145);
  }
  v146 = 2 * v131;
  if (v131 != v130)
  {
    v147 = &v7[4 * v130];
    v148 = v147[1];
    v129[v142] = vsubq_s16(v129[v142], *v147);
    *(int16x8_t *)((char *)v129 + (v151 | 0x10)) = vsubq_s16(*(int16x8_t *)((char *)v129 + (v151 | 0x10)), v148);
  }
  if (v146)
  {
    v149 = &v7[v130];
    do
    {
      v150 = *v129++;
      *v149 = vaddq_s16(v150, *v149);
      ++v149;
      --v146;
    }
    while (v146);
  }
  return result;
}

uint64_t bssl::ssl_decode_client_hello_inner(uint64_t a1, _BYTE *a2, uint64_t a3, unsigned __int16 *a4, unsigned __int16 *a5, _QWORD *a6)
{
  __int128 v10;
  uint64_t v11;
  int v12;
  BOOL v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  size_t v21;
  unint64_t v22;
  unsigned __int16 *v23;
  unsigned __int16 *v24;
  int v25;
  unsigned __int16 v26;
  const void *v27;
  size_t v28;
  int v29;
  int v30;
  unint64_t v31[2];
  unsigned __int16 v32;
  __int16 v33;
  unsigned __int8 *v34[2];
  unsigned __int16 *v35[2];
  _OWORD v36[3];
  _OWORD v37[3];
  _OWORD v38[3];
  char v39;
  unsigned __int16 *v40[2];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _OWORD v48[3];

  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v46 = v10;
  v47 = v10;
  v44 = v10;
  v45 = v10;
  v42 = v10;
  v43 = v10;
  v41 = v10;
  v40[0] = a4;
  v40[1] = a5;
  if ((bssl::ssl_parse_client_hello_with_trailing_data(a1, v40, (uint64_t)&v41) & 1) != 0)
  {
    v39 = -86;
    while (CBS_get_u8(v40, &v39))
    {
      if (v39)
      {
        ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 140);
        v11 = 0;
        *a2 = 47;
        return v11;
      }
    }
    if (*((_QWORD *)&v47 + 1))
      v13 = *((_QWORD *)&v44 + 1) == 0;
    else
      v13 = 0;
    if (!v13)
    {
      v12 = 150;
      goto LABEL_12;
    }
    v15 = a6[7];
    *(_QWORD *)&v44 = a6[6];
    *((_QWORD *)&v44 + 1) = v15;
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v38[1] = v16;
    v38[2] = v16;
    v38[0] = v16;
    CBB_zero(v38);
    *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v37[2] = v17;
    v37[0] = v17;
    v37[1] = v17;
    v36[1] = v17;
    v36[2] = v17;
    v36[0] = v17;
    if (!(*(unsigned int (**)(uint64_t, _OWORD *, _OWORD *, uint64_t))(*(_QWORD *)a1 + 88))(a1, v38, v37, 1)|| !CBB_add_u16((uint64_t)v37, WORD4(v42))|| !CBB_add_bytes((uint64_t)v37, (const void *)v43, *((size_t *)&v43 + 1))|| (*(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL, *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL, v48[1] = v18, v48[2] = v18, v48[0] = v18, !CBB_add_u8_length_prefixed((uint64_t *)v37, (uint64_t)v48))|| !CBB_add_bytes((uint64_t)v48, (const void *)v44, *((size_t *)&v44 + 1))|| !CBB_add_u16_length_prefixed((uint64_t *)v37, (uint64_t)v48)|| !CBB_add_bytes((uint64_t)v48, (const void *)v45, *((size_t *)&v45 + 1))|| !CBB_add_u8_length_prefixed((uint64_t *)v37, (uint64_t)v48)|| !CBB_add_bytes((uint64_t)v48, (const void *)v46, *((size_t *)&v46 + 1))|| !CBB_flush((uint64_t *)v37)|| !CBB_add_u16_length_prefixed((uint64_t *)v37, (uint64_t)v36))
    {
      ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 162);
      v11 = 0;
LABEL_37:
      CBB_cleanup((uint64_t)v38);
      return v11;
    }
    v19 = v47;
    *(_QWORD *)&v48[0] = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v48[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
    if ((bssl::ssl_client_hello_get_extension((uint64_t)&v41, v48, 64768) & 1) != 0)
    {
      v20 = CBS_data((uint64_t)v48);
      if (*((_QWORD *)&v19 + 1) >= (unint64_t)(v20 - v19 - 4))
        v21 = v20 - v19 - 4;
      else
        v21 = *((_QWORD *)&v19 + 1);
      v22 = CBS_len((uint64_t)v48) + v20 - v19;
      if (*((_QWORD *)&v19 + 1) < v22)
        abort();
      if (!CBB_add_bytes((uint64_t)v36, (const void *)v19, v21))
      {
        ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 185);
        v11 = 0;
        goto LABEL_37;
      }
      v35[0] = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
      v35[1] = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
      if (!CBS_get_u8_length_prefixed((unsigned __int8 **)v48, (unint64_t *)v35)
        || !CBS_len((uint64_t)v35)
        || CBS_len((uint64_t)v48))
      {
        ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 193);
LABEL_65:
        v11 = 0;
        goto LABEL_37;
      }
      v34[0] = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      v34[1] = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
      CBS_init(v34, a6[12], a6[13]);
      while (CBS_len((uint64_t)v35))
      {
        v33 = -21846;
        if (!CBS_get_u16(v35, &v33))
        {
          v29 = 203;
          v30 = 137;
LABEL_64:
          ERR_put_error(16, 0, v30, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", v29);
          goto LABEL_65;
        }
        if (v33 == -499)
        {
          *a2 = 47;
          v29 = 209;
          v30 = 320;
          goto LABEL_64;
        }
        v32 = -21846;
        v31[0] = 0xAAAAAAAAAAAAAAAALL;
        v31[1] = 0xAAAAAAAAAAAAAAAALL;
        do
        {
          if (!CBS_len((uint64_t)v34))
          {
            *a2 = 47;
            v29 = 219;
            v30 = 320;
            goto LABEL_64;
          }
          if (!CBS_get_u16((unsigned __int16 **)v34, &v32)
            || !CBS_get_u16_length_prefixed(v34, v31))
          {
            v29 = 224;
            goto LABEL_62;
          }
        }
        while (v32 != (unsigned __int16)v33);
        if (CBB_add_u16((uint64_t)v36, v32))
        {
          v26 = CBS_len((uint64_t)v31);
          if (CBB_add_u16((uint64_t)v36, v26))
          {
            v27 = (const void *)CBS_data((uint64_t)v31);
            v28 = CBS_len((uint64_t)v31);
            if (CBB_add_bytes((uint64_t)v36, v27, v28))
              continue;
          }
        }
        v29 = 233;
LABEL_62:
        v30 = 137;
        goto LABEL_64;
      }
      if (!CBB_add_bytes((uint64_t)v36, (const void *)(v19 + v22), *((_QWORD *)&v19 + 1) - v22))
      {
        ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 240);
        goto LABEL_65;
      }
    }
    else if (!CBB_add_bytes((uint64_t)v36, (const void *)v19, *((size_t *)&v19 + 1)))
    {
      v25 = 174;
      goto LABEL_47;
    }
    if (CBB_flush((uint64_t *)v37))
    {
      v23 = (unsigned __int16 *)CBB_data((uint64_t)v37);
      v24 = (unsigned __int16 *)CBB_len((uint64_t)v37);
      if (!bssl::is_valid_client_hello_inner(a1, a2, v23, v24))
        goto LABEL_65;
      if (((*(uint64_t (**)(uint64_t, _OWORD *, uint64_t))(*(_QWORD *)a1 + 96))(a1, v38, a3) & 1) != 0)
      {
        v11 = 1;
        goto LABEL_37;
      }
      v25 = 255;
    }
    else
    {
      v25 = 245;
    }
LABEL_47:
    ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", v25);
    v11 = 0;
    goto LABEL_37;
  }
  v12 = 133;
LABEL_12:
  ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", v12);
  return 0;
}

void sub_1B4FDEFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  CBB_cleanup((uint64_t)&a29);
  _Unwind_Resume(a1);
}

uint64_t bssl::is_valid_client_hello_inner(uint64_t a1, _BYTE *a2, unsigned __int16 *a3, unsigned __int16 *a4)
{
  __int128 v5;
  int v6;
  int v7;
  uint64_t result;
  uint64_t v11;
  unsigned __int16 v12;
  unsigned __int16 *v13[2];
  __int128 v14;
  _OWORD v15[7];

  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v15[5] = v5;
  v15[6] = v5;
  v15[3] = v5;
  v15[4] = v5;
  v15[1] = v5;
  v15[2] = v5;
  v15[0] = v5;
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  if (!bssl::ssl_client_hello_init(a1, (uint64_t)v15, a3, a4)
    || !bssl::ssl_client_hello_get_extension((uint64_t)v15, &v14, 65037)
    || CBS_len((uint64_t)&v14) != 1
    || *(_BYTE *)CBS_data((uint64_t)&v14) != 1
    || (bssl::ssl_client_hello_get_extension((uint64_t)v15, &v14, 43) & 1) == 0)
  {
    *a2 = 47;
    v6 = 314;
    v7 = 94;
    goto LABEL_10;
  }
  v13[0] = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
  v13[1] = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
  if (!CBS_get_u8_length_prefixed((unsigned __int8 **)&v14, (unint64_t *)v13)
    || CBS_len((uint64_t)&v14)
    || !CBS_len((uint64_t)v13))
  {
    *a2 = 50;
    v6 = 137;
    v7 = 104;
LABEL_10:
    ERR_put_error(16, 0, v6, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", v7);
    return 0;
  }
  if (CBS_len((uint64_t)v13))
  {
    while (1)
    {
      v12 = -21846;
      if (!CBS_get_u16(v13, &v12))
        break;
      if (v12 - 768 < 4 || v12 == 65279 || v12 == 65277)
      {
        *a2 = 47;
        v6 = 314;
        v7 = 118;
        goto LABEL_10;
      }
      v11 = CBS_len((uint64_t)v13);
      result = 1;
      if (!v11)
        return result;
    }
    *a2 = 50;
    v6 = 137;
    v7 = 111;
    goto LABEL_10;
  }
  return 1;
}

uint64_t bssl::ssl_client_hello_decrypt(uint64_t *a1, _BYTE *a2, _BYTE *a3, uint64_t *a4, _QWORD *a5, char *a6, unint64_t a7)
{
  const void *v14;
  unint64_t v15;
  char v16;
  char v17;
  unint64_t v18;
  char *v19;
  size_t v20;
  uint64_t v21;
  const char *v23;
  int v24;
  unsigned __int16 *v25;
  void *v26;
  unsigned __int16 *v27;
  void *__dst;
  unint64_t v29;

  *a3 = 0;
  __dst = 0;
  v29 = 0;
  v14 = (const void *)a5[1];
  v15 = a5[2];
  v16 = bssl::Array<unsigned char>::Init((uint64_t)&__dst, v15);
  v17 = v16 ^ 1;
  if (!v15)
    v17 = 1;
  if ((v17 & 1) == 0)
    memcpy(__dst, v14, v15);
  if ((v16 & 1) == 0)
  {
    v21 = 0;
    *a2 = 80;
    goto LABEL_24;
  }
  v18 = a5[12];
  if (v18 > (unint64_t)a6)
  {
    v23 = "reinterpret_cast<uintptr_t>(client_hello_outer->extensions) <= reinterpret_cast<uintptr_t>(payload.data())";
    v24 = 280;
    goto LABEL_27;
  }
  if (v18 + a5[13] < (unint64_t)&a6[a7])
  {
    v23 = "reinterpret_cast<uintptr_t>(client_hello_outer->extensions + client_hello_outer->extensions_len) >= reinterpre"
          "t_cast<uintptr_t>(payload.data() + payload.size())";
    v24 = 283;
LABEL_27:
    __assert_rtn("ssl_client_hello_decrypt", "encrypted_client_hello.cc", v24, v23);
  }
  v19 = &a6[-a5[1]];
  if (v29 < (unint64_t)v19)
    abort();
  if (v29 - (unint64_t)v19 >= a7)
    v20 = a7;
  else
    v20 = v29 - (_QWORD)v19;
  if (v20)
    bzero(&v19[(_QWORD)__dst], v20);
  v26 = 0;
  v27 = 0;
  if ((bssl::Array<unsigned char>::Init((uint64_t)&v26, a7) & 1) != 0)
  {
    v25 = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
    if (EVP_HPKE_CTX_open((uint64_t)(a1 + 92), (char *)v26, (size_t *)&v25, (size_t)v27, a6, a7))
    {
      if (v27 < v25)
        abort();
      v27 = v25;
      if (bssl::ssl_decode_client_hello_inner(*a1, a2, (uint64_t)a4, (unsigned __int16 *)v26, v25, a5))
      {
        bssl::ssl_do_msg_callback(*a1, 0, 257, *a4, a4[1]);
        v21 = 1;
      }
      else
      {
        v21 = 0;
      }
    }
    else
    {
      *a2 = 51;
      *a3 = 1;
      ERR_put_error(16, 0, 138, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 316);
      v21 = 0;
    }
  }
  else
  {
    v21 = 0;
    *a2 = 80;
  }
  OPENSSL_free(v26);
LABEL_24:
  OPENSSL_free(__dst);
  return v21;
}

void sub_1B4FDF42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  uint64_t v4;
  va_list va;
  uint64_t v6;
  va_list va1;

  va_start(va1, a3);
  va_start(va, a3);
  v4 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  bssl::Array<unsigned char>::~Array((uint64_t)va);
  bssl::Array<unsigned char>::~Array((uint64_t)va1);
  _Unwind_Resume(a1);
}

BOOL bssl::ssl_is_valid_ech_public_name(unsigned __int8 *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unsigned __int8 *v7;
  unint64_t v8;
  unsigned __int8 *v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  _BOOL4 v13;
  _BOOL8 result;
  unint64_t v16;
  unint64_t v17;
  int v18;
  unsigned __int8 *i;

  if (a2)
  {
    v2 = a2;
    v4 = 0;
    v5 = 0;
    while (2)
    {
      v6 = 0;
      v7 = a1;
      v8 = v2;
      v9 = &a1[v2];
      while (a1[v6] != 46)
      {
        if (v2 == ++v6)
          goto LABEL_8;
      }
      v9 = &a1[v6];
LABEL_8:
      v10 = v9 - a1;
      if (v10 == v2)
      {
        a1 = 0;
        v2 = 0;
        v5 = v7;
        v4 = v8;
      }
      else
      {
        v11 = v10 + 1;
        if (v2 < v10 + 1)
          abort();
        if (v2 < v10)
          v10 = v2;
        v2 -= v11;
        if (v8 == v11)
          return 0;
        a1 += v11;
        v8 = v10;
      }
      if (v8 - 64 >= 0xFFFFFFFFFFFFFFC1 && *v7 != 45 && v7[v8 - 1] != 45)
      {
        do
        {
          v12 = *v7;
          v13 = OPENSSL_isalnum(v12);
          if (v12 != 45 && !v13)
            return 0;
          ++v7;
          --v8;
        }
        while (v8);
        if (v2)
          continue;
        if (v4 >= 2)
        {
          if (*v5 != 48 || (v5[1] | 0x20) != 0x78)
          {
LABEL_31:
            v17 = v4 - 1;
            do
            {
              v18 = *v5++;
              result = (v18 - 58) < 0xFFFFFFF6;
            }
            while ((v18 - 58) >= 0xFFFFFFF6 && v17-- != 0);
            return result;
          }
          v16 = v4 - 2;
          if (v4 == 2)
            return 0;
          for (i = v5 + 2; OPENSSL_isxdigit(*i); ++i)
          {
            result = 0;
            if (!--v16)
              return result;
          }
        }
        if (!v4)
          return 1;
        goto LABEL_31;
      }
      break;
    }
  }
  return 0;
}

uint64_t bssl::parse_ech_config(unsigned __int16 **a1, uint64_t a2, _BYTE *a3, char a4)
{
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  unsigned __int8 *v13;
  int v14;
  unint64_t v16;
  unint64_t v17;
  unsigned __int16 *v18;
  char v19;
  char v20;
  char v21;
  unint64_t v22[2];
  __int16 v23;
  unsigned __int16 *v24[4];
  unint64_t v25[4];
  unsigned __int8 *v26[2];
  unsigned __int8 *v27[2];
  __int128 v28;
  __int16 v29;

  v29 = -21846;
  v28 = *(_OWORD *)a1;
  v27[0] = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  v27[1] = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  if (CBS_get_u16(a1, &v29)
    && CBS_get_u16_length_prefixed((unsigned __int8 **)a1, (unint64_t *)v27))
  {
    if (v29 != -499)
      goto LABEL_37;
    v8 = (const void *)CBS_data((uint64_t)&v28);
    v9 = CBS_len((uint64_t)&v28);
    v10 = CBS_len((uint64_t)a1);
    v11 = bssl::Array<unsigned char>::Init(a2, v9 - v10);
    v12 = v11;
    if (v9 != v10 && v11)
      memcpy(*(void **)a2, v8, v9 - v10);
    if (!v12)
      return 0;
    v13 = *(unsigned __int8 **)(a2 + 8);
    v26[0] = *(unsigned __int8 **)a2;
    v26[1] = v13;
    memset(v25, 170, sizeof(v25));
    memset(v24, 170, sizeof(v24));
    if (CBS_skip(v26, 2uLL)
      && CBS_get_u16_length_prefixed(v26, (unint64_t *)v27)
      && CBS_get_u8(v27, (_BYTE *)(a2 + 67))
      && CBS_get_u16((unsigned __int16 **)v27, (_WORD *)(a2 + 64))
      && CBS_get_u16_length_prefixed(v27, v25)
      && CBS_len((uint64_t)v25)
      && CBS_get_u16_length_prefixed(v27, (unint64_t *)&v24[2])
      && CBS_len((uint64_t)&v24[2])
      && (CBS_len((uint64_t)&v24[2]) & 3) == 0
      && CBS_get_u8(v27, (_BYTE *)(a2 + 66))
      && CBS_get_u8_length_prefixed(v27, &v25[2])
      && CBS_len((uint64_t)&v25[2])
      && CBS_get_u16_length_prefixed(v27, (unint64_t *)v24)
      && !CBS_len((uint64_t)v27))
    {
      if (bssl::ssl_is_valid_ech_public_name((unsigned __int8 *)v25[2], v25[3]))
      {
        v16 = v25[1];
        *(_QWORD *)(a2 + 16) = v25[0];
        *(_QWORD *)(a2 + 24) = v16;
        v17 = v25[3];
        *(_QWORD *)(a2 + 32) = v25[2];
        *(_QWORD *)(a2 + 40) = v17;
        v18 = v24[3];
        *(unsigned __int16 **)(a2 + 48) = v24[2];
        *(_QWORD *)(a2 + 56) = v18;
        if (CBS_len((uint64_t)v24))
        {
          v19 = 0;
          while (1)
          {
            v23 = -21846;
            v22[0] = 0xAAAAAAAAAAAAAAAALL;
            v22[1] = 0xAAAAAAAAAAAAAAAALL;
            if (!CBS_get_u16(v24, &v23)
              || !CBS_get_u16_length_prefixed((unsigned __int8 **)v24, v22))
            {
              break;
            }
            if (v23 < 0)
              v20 = 1;
            else
              v20 = a4;
            v19 |= v20;
            if (!CBS_len((uint64_t)v24))
            {
              v21 = v19 ^ 1;
              goto LABEL_41;
            }
          }
          v14 = 468;
          goto LABEL_19;
        }
        v21 = 1;
LABEL_41:
        *a3 = v21 & 1;
        return 1;
      }
LABEL_37:
      *a3 = 0;
      return 1;
    }
    v14 = 444;
  }
  else
  {
    v14 = 413;
  }
LABEL_19:
  ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", v14);
  return 0;
}

BOOL bssl::ECHServerConfig::SetupContext(uint64_t a1, _QWORD *a2, int a3, int a4, uint64_t a5, uint64_t a6)
{
  unsigned __int16 *v12;
  _BOOL8 v14;
  __int128 v16;
  uint64_t v17;
  const char *v18;
  unsigned __int16 *v19;
  int v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  unsigned __int16 *v24;
  _QWORD *v25;
  size_t v26;
  _OWORD v27[3];
  unsigned __int16 v28;
  unsigned __int16 *v29[2];

  v12 = *(unsigned __int16 **)(a1 + 56);
  v29[0] = *(unsigned __int16 **)(a1 + 48);
  v29[1] = v12;
  if (CBS_len((uint64_t)v29))
  {
    while (1)
    {
      LOWORD(v27[0]) = -21846;
      v28 = -21846;
      if (!CBS_get_u16(v29, v27) || !CBS_get_u16(v29, &v28))
        return 0;
      if (LOWORD(v27[0]) == a3 && v28 == a4)
        break;
      if (!CBS_len((uint64_t)v29))
        return 0;
    }
    *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v27[1] = v16;
    v27[2] = v16;
    v27[0] = v16;
    CBB_zero(v27);
    if (CBB_init((uint64_t)v27, *(_QWORD *)(a1 + 8) + 8)
      && CBB_add_bytes((uint64_t)v27, "tls ech", 8uLL)
      && CBB_add_bytes((uint64_t)v27, *(const void **)a1, *(_QWORD *)(a1 + 8)))
    {
      if (a3 == 1)
      {
        v17 = 0;
        v18 = "get_ech_aead(aead_id) != NULL";
        while (1)
        {
          v19 = (unsigned __int16 *)bssl::kSupportedAEADs[v17]();
          if (EVP_HPKE_KDF_id(v19) == a4)
            break;
          if (++v17 == 3)
            goto LABEL_18;
        }
        if (v19)
        {
          v21 = EVP_hpke_hkdf_sha256();
          v22 = 0;
          v23 = (uint64_t *)(a1 + 72);
          while (1)
          {
            v24 = (unsigned __int16 *)bssl::kSupportedAEADs[v22]();
            if (EVP_HPKE_KDF_id(v24) == a4)
              break;
            if (++v22 == 3)
            {
              v24 = 0;
              break;
            }
          }
          v25 = CBB_data((uint64_t)v27);
          v26 = CBB_len((uint64_t)v27);
          v14 = EVP_HPKE_CTX_setup_recipient(a2, v23, (uint64_t)v21, (uint64_t)v24, a5, a6, v25, v26) != 0;
          goto LABEL_26;
        }
        v18 = "get_ech_aead(aead_id) != NULL";
LABEL_18:
        v20 = 578;
      }
      else
      {
        v18 = "kdf_id == EVP_HPKE_HKDF_SHA256";
        v20 = 577;
      }
      __assert_rtn("SetupContext", "encrypted_client_hello.cc", v20, v18);
    }
    v14 = 0;
LABEL_26:
    CBB_cleanup((uint64_t)v27);
    return v14;
  }
  return 0;
}

void sub_1B4FDFACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CBB_cleanup((uint64_t)&a9);
  _Unwind_Resume(a1);
}

BOOL bssl::ssl_is_valid_ech_config_list(unsigned __int8 *a1, unsigned __int8 *a2)
{
  _BOOL8 v2;
  uint64_t v4;
  char v5;
  char v6;
  void *v7[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  unsigned __int16 *v12[2];
  unsigned __int8 *v13[2];

  v13[0] = a1;
  v13[1] = a2;
  v12[0] = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
  v12[1] = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
  if (!CBS_get_u16_length_prefixed(v13, (unint64_t *)v12)
    || !CBS_len((uint64_t)v12)
    || CBS_len((uint64_t)v13))
  {
    return 0;
  }
  do
  {
    v4 = CBS_len((uint64_t)v12);
    v2 = v4 == 0;
    if (!v4)
      break;
    *(_OWORD *)v7 = 0u;
    v8 = 0u;
    v9 = 0u;
    v10 = 0u;
    v11 = 0xAAAAAAAA00000000;
    v5 = bssl::parse_ech_config(v12, (uint64_t)v7, &v6, 0);
    OPENSSL_free((_QWORD *)v7[0]);
  }
  while ((v5 & 1) != 0);
  return v2;
}

void sub_1B4FDFBA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  bssl::Array<unsigned char>::~Array((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t SSL_set1_ech_config_list(uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  void **v6;
  uint64_t v7;
  uint64_t v8;

  if (!*(_QWORD *)(a1 + 8))
    return 0;
  if (!bssl::ssl_is_valid_ech_config_list(a2, a3))
  {
    ERR_put_error(16, 0, 318, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/encrypted_client_hello.cc", 911);
    return 0;
  }
  v6 = (void **)(*(_QWORD *)(a1 + 8) + 296);
  v7 = bssl::Array<unsigned char>::Init((uint64_t)v6, (unint64_t)a3);
  v8 = v7;
  if (a3 && (_DWORD)v7)
    memcpy(*v6, a2, (size_t)a3);
  return v8;
}

unsigned int *SSL_ECH_KEYS_up_ref(uint64_t a1)
{
  return CRYPTO_refcount_inc((unsigned int *)(a1 + 24));
}

void SSL_ECH_KEYS_free(uint64_t a1)
{
  if (a1)
  {
    if (CRYPTO_refcount_dec_and_test_zero((unsigned int *)(a1 + 24)))
    {
      bssl::Array<std::unique_ptr<bssl::ECHServerConfig,bssl::internal::Deleter>>::~Array(a1 + 8);
      OPENSSL_free((_QWORD *)a1);
    }
  }
}

BOOL SSL_ech_accepted(uint64_t a1)
{
  if (!SSL_in_early_data(a1) || (*(_BYTE *)(a1 + 180) & 1) != 0)
    return *(_DWORD *)(*(_QWORD *)(a1 + 48) + 216) == 1;
  else
    return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 280) + 1560) != 0;
}

uint64_t bssl::Array<std::unique_ptr<bssl::ECHServerConfig,bssl::internal::Deleter>>::~Array(uint64_t a1)
{
  bssl::Array<std::unique_ptr<bssl::ECHServerConfig,bssl::internal::Deleter>>::Reset(a1, 0, 0);
  return a1;
}

void bssl::Array<std::unique_ptr<bssl::ECHServerConfig,bssl::internal::Deleter>>::Reset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;

  if (*(_QWORD *)(a1 + 8))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      std::unique_ptr<bssl::ECHServerConfig,bssl::internal::Deleter>::reset[abi:ne180100]((uint64_t *)(*(_QWORD *)a1 + v6), 0);
      ++v7;
      v6 += 8;
    }
    while (v7 < *(_QWORD *)(a1 + 8));
  }
  OPENSSL_free(*(_QWORD **)a1);
  *(_QWORD *)a1 = a2;
  *(_QWORD *)(a1 + 8) = a3;
}

_QWORD *bssl::New<bssl::ECHConfig,bssl::ECHConfig>(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v2 = OPENSSL_malloc(0x48uLL);
  v3 = v2;
  if (v2)
  {
    *v2 = 0;
    v2[1] = 0;
    OPENSSL_free(0);
    *v3 = 0;
    v3[1] = 0;
    v4 = *(_QWORD *)(a1 + 8);
    *v3 = *(_QWORD *)a1;
    v3[1] = v4;
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    v5 = *(_OWORD *)(a1 + 16);
    v6 = *(_OWORD *)(a1 + 32);
    v7 = *(_OWORD *)(a1 + 48);
    *((_DWORD *)v3 + 16) = *(_DWORD *)(a1 + 64);
    *((_OWORD *)v3 + 2) = v6;
    *((_OWORD *)v3 + 3) = v7;
    *((_OWORD *)v3 + 1) = v5;
  }
  return v3;
}

void std::unique_ptr<bssl::ECHConfig,bssl::internal::Deleter>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;

  v3 = *a1;
  *a1 = a2;
  if (v3)
  {
    v4 = (_QWORD *)bssl::Array<unsigned char>::~Array(v3);
    OPENSSL_free(v4);
  }
}

void std::unique_ptr<bssl::ECHServerConfig,bssl::internal::Deleter>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *a1;
  *a1 = a2;
  if (v3)
    bssl::Delete<bssl::ECHServerConfig>(v3);
}

void bssl::Delete<bssl::ECHServerConfig>(uint64_t a1)
{
  _QWORD *v2;

  if (a1)
  {
    bio_clear_socket_error(a1 + 72);
    v2 = (_QWORD *)bssl::Array<unsigned char>::~Array(a1);
    OPENSSL_free(v2);
  }
}

DSA *DSA_new(void)
{
  _QWORD *v0;
  DSA *v1;
  void *v2;
  CRYPTO_EX_DATA *v3;

  v0 = OPENSSL_malloc(0x120uLL);
  v1 = (DSA *)v0;
  if (v0)
  {
    *((_OWORD *)v0 + 16) = 0u;
    *((_OWORD *)v0 + 17) = 0u;
    *((_OWORD *)v0 + 14) = 0u;
    *((_OWORD *)v0 + 15) = 0u;
    *((_OWORD *)v0 + 12) = 0u;
    *((_OWORD *)v0 + 13) = 0u;
    *((_OWORD *)v0 + 10) = 0u;
    *((_OWORD *)v0 + 11) = 0u;
    *((_OWORD *)v0 + 8) = 0u;
    *((_OWORD *)v0 + 9) = 0u;
    *((_OWORD *)v0 + 6) = 0u;
    *((_OWORD *)v0 + 7) = 0u;
    *((_OWORD *)v0 + 4) = 0u;
    *((_OWORD *)v0 + 5) = 0u;
    *((_OWORD *)v0 + 2) = 0u;
    *((_OWORD *)v0 + 3) = 0u;
    *((_DWORD *)v0 + 68) = 1;
    *(_OWORD *)v0 = 0u;
    *((_OWORD *)v0 + 1) = 0u;
    CRYPTO_MUTEX_init((pthread_rwlock_t *)(v0 + 7));
    CRYPTO_new_ex_data((_DWORD)v1 + 280, v2, v3);
  }
  return v1;
}

void DSA_free(DSA *r)
{
  if (r)
  {
    if (CRYPTO_refcount_dec_and_test_zero((unsigned int *)&r[2]))
    {
      CRYPTO_free_ex_data((int)&g_ex_data_class_0, r, (CRYPTO_EX_DATA *)&r[2].version);
      BN_clear_free((BIGNUM *)r->version);
      BN_clear_free(*(BIGNUM **)&r->write_params);
      BN_clear_free(r->p);
      BN_clear_free(r->q);
      BN_clear_free(r->g);
      BN_MONT_CTX_free((BN_MONT_CTX *)r[1].meth);
      BN_MONT_CTX_free((BN_MONT_CTX *)r[1].engine);
      CRYPTO_MUTEX_cleanup((pthread_rwlock_t *)&r->priv_key);
      OPENSSL_free(r);
    }
  }
}

uint64_t DSA_get0_pub_key(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t DSA_get0_g(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

int DSA_size(const DSA *a1)
{
  const BIGNUM *v1;
  unsigned int v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v6;
  BOOL v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v1 = *(const BIGNUM **)&a1->write_params;
  if (v1)
  {
    v2 = BN_num_bytes(v1);
    v3 = v2;
    if (v2 >= 0x7F)
    {
      v5 = v2 + 1;
      v4 = 1;
      do
      {
        ++v4;
        v6 = v5 >= 0xFF;
        v7 = v5 == 255;
        v5 >>= 8;
      }
      while (!v7 && v6);
    }
    else
    {
      v4 = 1;
    }
    LODWORD(v1) = 0;
    v8 = v3 + v4 + 2;
    if (v8 >= v3 && (v8 & 0x8000000000000000) == 0)
    {
      v9 = 2 * v8;
      if (v8 >= 0x40)
      {
        v10 = 1;
        v11 = v9;
        do
        {
          ++v10;
          v6 = v11 >= 0xFF;
          v7 = v11 == 255;
          v11 >>= 8;
        }
        while (!v7 && v6);
      }
      else
      {
        v10 = 1;
      }
      v12 = (v9 | 1) + v10;
      if (v12 >= v9)
        LODWORD(v1) = v12;
      else
        LODWORD(v1) = 0;
    }
  }
  return (int)v1;
}

void *DTLS_with_buffers_method()
{
  return &DTLS_with_buffers_method::kMethod;
}

void dtls1_on_handshake_complete(ssl_st *a1, ssl_st *a2)
{
  ssl_st *v3;

  bssl::dtls1_stop_timer((uint64_t)a1, a2);
  if ((**(_BYTE **)&a1->server & 4) != 0)
    bssl::dtls_clear_outgoing_messages((bssl *)a1, v3);
}

BOOL dtls1_set_read_state(bssl *a1, const ssl_st *a2, bssl::SSLAEADContext **a3, uint64_t a4, uint64_t a5)
{
  int v6;
  _BOOL4 has_unprocessed_handshake_data;
  uint64_t v9;
  uint64_t v10;
  bssl::SSLAEADContext *v11;
  _BYTE *v12;

  if (a5)
    dtls1_set_read_state();
  v6 = (int)a2;
  has_unprocessed_handshake_data = bssl::dtls_has_unprocessed_handshake_data(a1, a2);
  if (has_unprocessed_handshake_data)
  {
    ERR_put_error(16, 0, 255, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/dtls_method.cc", 86);
    bssl::ssl_send_alert(a1, (ssl_st *)2, 10);
  }
  else
  {
    v9 = *((_QWORD *)a1 + 7);
    ++*(_WORD *)(v9 + 2);
    *(_QWORD *)(v9 + 8) = 0;
    *(_QWORD *)(v9 + 16) = 0;
    v10 = *((_QWORD *)a1 + 6);
    *(_QWORD *)v10 = 0;
    v11 = *a3;
    *a3 = 0;
    std::unique_ptr<bssl::SSLAEADContext,bssl::internal::Deleter>::reset[abi:ne180100]((bssl::SSLAEADContext **)(v10 + 264), v11);
    v12 = (_BYTE *)*((_QWORD *)a1 + 7);
    *(_DWORD *)(*((_QWORD *)a1 + 6) + 200) = v6;
    *v12 &= ~1u;
  }
  return !has_unprocessed_handshake_data;
}

uint64_t dtls1_set_write_state(uint64_t a1, int a2, bssl::SSLAEADContext **a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  bssl::SSLAEADContext *v10;
  bssl::SSLAEADContext **v11;
  bssl::SSLAEADContext *v12;

  if (a5)
    dtls1_set_write_state();
  v9 = *(_QWORD *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  ++*(_WORD *)(v8 + 4);
  *(_QWORD *)(v8 + 32) = *(_QWORD *)(v9 + 8);
  *(_QWORD *)(v9 + 8) = 0;
  v10 = *(bssl::SSLAEADContext **)(v9 + 272);
  *(_QWORD *)(v9 + 272) = 0;
  std::unique_ptr<bssl::SSLAEADContext,bssl::internal::Deleter>::reset[abi:ne180100]((bssl::SSLAEADContext **)(v8 + 40), v10);
  v11 = (bssl::SSLAEADContext **)(*(_QWORD *)(a1 + 48) + 272);
  v12 = *a3;
  *a3 = 0;
  std::unique_ptr<bssl::SSLAEADContext,bssl::internal::Deleter>::reset[abi:ne180100](v11, v12);
  *(_DWORD *)(*(_QWORD *)(a1 + 48) + 204) = a2;
  return 1;
}

uint64_t dsa_check_key(uint64_t *a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v2 = a1[1];
  if (!v2 || !a1[2] || !a1[3])
  {
    v3 = 101;
    v4 = 75;
    goto LABEL_10;
  }
  if (BN_is_negative(v2)
    || BN_is_negative(a1[2])
    || BN_is_zero(a1[1])
    || BN_is_zero(a1[2])
    || !BN_is_odd(a1[1])
    || !BN_is_odd(a1[2])
    || (BN_cmp((const BIGNUM *)a1[2], (const BIGNUM *)a1[1]) & 0x80000000) == 0
    || BN_is_negative(a1[3])
    || BN_is_zero(a1[3])
    || (BN_cmp((const BIGNUM *)a1[3], (const BIGNUM *)a1[1]) & 0x80000000) == 0)
  {
    v3 = 107;
    v4 = 92;
LABEL_10:
    ERR_put_error(10, 0, v3, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/dsa/dsa_asn1.c", v4);
    return 0;
  }
  v6 = BN_num_bits((const BIGNUM *)a1[2]);
  if (v6 != 160 && v6 != 224 && v6 != 256)
  {
    v3 = 100;
    v4 = 99;
    goto LABEL_10;
  }
  if (BN_num_bits((const BIGNUM *)a1[1]) >= 0x2711)
  {
    v3 = 102;
    v4 = 106;
    goto LABEL_10;
  }
  v7 = a1[4];
  if (v7
    && (BN_is_negative(v7)
     || BN_is_zero(a1[4])
     || (BN_cmp((const BIGNUM *)a1[4], (const BIGNUM *)a1[1]) & 0x80000000) == 0))
  {
    v3 = 107;
    v4 = 114;
    goto LABEL_10;
  }
  v8 = a1[5];
  if (v8
    && (BN_is_negative(v8)
     || BN_is_zero(a1[5])
     || (BN_cmp((const BIGNUM *)a1[5], (const BIGNUM *)a1[2]) & 0x80000000) == 0))
  {
    v3 = 107;
    v4 = 124;
    goto LABEL_10;
  }
  return 1;
}

DSA *DSA_parse_parameters(__int128 *a1)
{
  DSA *v2;
  __int128 v4;

  v2 = DSA_new();
  if (v2)
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    if (CBS_get_asn1(a1, &v4, 536870928)
      && parse_integer(&v4, (BIGNUM **)&v2->version)
      && parse_integer(&v4, (BIGNUM **)&v2->write_params)
      && parse_integer(&v4, &v2->p)
      && !CBS_len((uint64_t)&v4))
    {
      if (dsa_check_key((uint64_t *)&v2->pad))
        return v2;
    }
    else
    {
      ERR_put_error(10, 0, 105, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/dsa/dsa_asn1.c", 229);
    }
    DSA_free(v2);
    return 0;
  }
  return v2;
}

uint64_t DSA_marshal_parameters(uint64_t *a1, const BIGNUM **a2)
{
  __int128 v4;
  _OWORD v6[3];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = v4;
  v6[2] = v4;
  v6[0] = v4;
  if (CBB_add_asn1(a1, (uint64_t)v6, 0x20000010u)
    && marshal_integer((uint64_t *)v6, a2[1])
    && marshal_integer((uint64_t *)v6, a2[2])
    && marshal_integer((uint64_t *)v6, a2[3])
    && CBB_flush(a1))
  {
    return 1;
  }
  ERR_put_error(10, 0, 106, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/dsa/dsa_asn1.c", 249);
  return 0;
}

DSA *DSA_parse_private_key(__int128 *a1)
{
  DSA *v2;
  int v3;
  int v4;
  unint64_t v6[3];

  v2 = DSA_new();
  if (v2)
  {
    memset(v6, 170, sizeof(v6));
    if (CBS_get_asn1(a1, &v6[1], 536870928) && CBS_get_asn1_uint64((__int128 *)&v6[1], v6))
    {
      if (v6[0])
      {
        v3 = 104;
        v4 = 270;
      }
      else
      {
        if (parse_integer((__int128 *)&v6[1], (BIGNUM **)&v2->version)
          && parse_integer((__int128 *)&v6[1], (BIGNUM **)&v2->write_params)
          && parse_integer((__int128 *)&v6[1], &v2->p)
          && parse_integer((__int128 *)&v6[1], &v2->q)
          && parse_integer((__int128 *)&v6[1], &v2->g)
          && !CBS_len((uint64_t)&v6[1]))
        {
          if (dsa_check_key((uint64_t *)&v2->pad))
            return v2;
          goto LABEL_8;
        }
        v3 = 105;
        v4 = 280;
      }
    }
    else
    {
      v3 = 105;
      v4 = 265;
    }
    ERR_put_error(10, 0, v3, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/dsa/dsa_asn1.c", v4);
LABEL_8:
    DSA_free(v2);
    return 0;
  }
  return v2;
}

int BUF_MEM_grow(BUF_MEM *str, int len)
{
  unint64_t v2;

  v2 = *(_QWORD *)&len;
  if (BUF_MEM_reserve((uint64_t)str, *(unint64_t *)&len))
  {
    if (v2 > *(_QWORD *)&str->length)
      bzero(&str->data[*(_QWORD *)&str->length], v2 - *(_QWORD *)&str->length);
    *(_QWORD *)&str->length = v2;
  }
  else
  {
    LODWORD(v2) = 0;
  }
  return v2;
}

xpc_object_t boringssl_metrics_create_connection_failure_event(uint64_t a1)
{
  uint64_t v2;
  xpc_object_t v3;
  const char *v4;
  int stack_error;
  id v6;

  if (!a1)
    return 0;
  if (*(_DWORD *)a1 != -1252936367)
    return 0;
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  v3 = xpc_dictionary_create(0, 0, 0);
  if (v3)
  {
    boringssl_metrics_log_configuration_data(a1, v3);
    boringssl_metrics_log_connection_data(a1, v3);
    xpc_dictionary_set_uint64(v3, (const char *)TLS_METRIC_FAILURE_ALERT_TYPE, *(int *)(v2 + 312));
    xpc_dictionary_set_uint64(v3, (const char *)TLS_METRIC_FAILURE_ALERT_LEVEL, *(unsigned __int8 *)(v2 + 316));
    xpc_dictionary_set_uint64(v3, (const char *)TLS_METRIC_FAILURE_ALERT_CODE, *(unsigned __int8 *)(v2 + 317));
    xpc_dictionary_set_uint64(v3, (const char *)TLS_METRIC_FAILURE_HANDSHAKE_STATE, *(int *)(v2 + 304));
    xpc_dictionary_set_uint64(v3, (const char *)TLS_METRIC_FAILURE_HANDSHAKE_TYPE, *(unsigned __int8 *)(v2 + 308));
    xpc_dictionary_set_uint64(v3, (const char *)TLS_METRIC_FAILURE_INTERNAL_ERROR, *(int *)(v2 + 296));
    v4 = (const char *)TLS_METRIC_FAILURE_STACK_ERROR;
    stack_error = boringssl_session_get_stack_error(a1);
    xpc_dictionary_set_uint64(v3, v4, stack_error);
    v6 = v3;
  }
  else if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
  {
    boringssl_metrics_create_connection_failure_event_cold_1();
  }

  return v3;
}

BOOL boringssl_metrics_log_connection_failure(uint64_t a1)
{
  xpc_object_t connection_failure_event;
  void *v2;
  _BOOL8 v3;
  uint64_t v5;

  if (!a1 || *(_DWORD *)a1 != -1252936367 || !*(_QWORD *)(a1 + 8))
    return 0;
  if (metricsQueueToken != -1)
  {
    v5 = a1;
    dispatch_once(&metricsQueueToken, &__block_literal_global_77);
    a1 = v5;
  }
  if (!boringssl_context_metrics_queue)
    return 0;
  connection_failure_event = boringssl_metrics_create_connection_failure_event(a1);
  if (!connection_failure_event)
    return 0;
  v2 = connection_failure_event;
  v3 = boringssl_metrics_log_event((uint64_t)"TLSFailureEvent", connection_failure_event, (void *)boringssl_context_metrics_queue);

  return v3;
}

void __boringssl_metrics_log_connection_failure_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.network.boringssl.metrics_queue", 0);
  v1 = (void *)boringssl_context_metrics_queue;
  boringssl_context_metrics_queue = (uint64_t)v0;

}

void __boringssl_metrics_log_ech_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.network.boringssl.metrics_queue", 0);
  v1 = (void *)boringssl_context_metrics_queue;
  boringssl_context_metrics_queue = (uint64_t)v0;

}

BOOL ec_scalar_equal_vartime(uint64_t a1, void *__s1, void *__s2)
{
  uint64_t v3;

  v3 = *(int *)(a1 + 24);
  return !(_DWORD)v3 || memcmp(__s1, __s2, 8 * v3) == 0;
}

BOOL ec_scalar_is_zero(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(unsigned int *)(a1 + 24);
  if ((int)v2 < 1)
    return 1;
  v3 = 0;
  do
  {
    v4 = *a2++;
    v3 |= v4;
    --v2;
  }
  while (v2);
  return v3 == 0;
}

uint64_t ec_random_nonzero_scalar(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  return bn_rand_range_words(a2, 1uLL, *(unint64_t **)(a1 + 16), *(int *)(a1 + 24), a3);
}

void ec_simple_scalar_inv0_montgomery(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  bn_mod_inverse0_prime_mont_small(a2, a3, *(int *)(a1 + 24), *(_QWORD *)(a1 + 48));
}

uint64_t ec_simple_scalar_to_montgomery_inv_vartime(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = *(unsigned int *)(a1 + 24);
  if ((int)v3 < 1)
    return 0;
  v6 = 0;
  v7 = 0;
  v8 = 8 * v3;
  do
  {
    v7 |= *(_QWORD *)(a3 + v6);
    v6 += 8;
  }
  while (v8 != v6);
  if (!v7)
    return 0;
  (*(void (**)(uint64_t, unint64_t *))(*(_QWORD *)a1 + 160))(a1, a2);
  bn_from_montgomery_small(a2, *(int *)(a1 + 24), (uint64_t)a2, *(int *)(a1 + 24), *(_QWORD *)(a1 + 48));
  return 1;
}

unint64_t ec_felem_neg(uint64_t a1, unint64_t *rp, const unint64_t *a3)
{
  unint64_t *v3;
  int v5;
  uint64_t v6;
  const unint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t result;
  uint64_t v12;

  v3 = rp;
  v5 = *(_DWORD *)(a1 + 64);
  if (v5 < 1)
  {
    v10 = 0;
  }
  else
  {
    v6 = 0;
    v7 = a3;
    v8 = *(unsigned int *)(a1 + 64);
    do
    {
      v9 = *v7++;
      v6 |= v9;
      --v8;
    }
    while (v8);
    if (v6)
      v10 = -1;
    else
      v10 = 0;
  }
  result = bn_sub_words(rp, *(const unint64_t **)(a1 + 56), a3, v5);
  if (result)
    ec_felem_neg_cold_1();
  v12 = *(unsigned int *)(a1 + 64);
  if ((int)v12 >= 1)
  {
    do
    {
      *v3++ &= v10;
      --v12;
    }
    while (v12);
  }
  return result;
}

uint64_t *ec_felem_select(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  return bn_select_words(a2, a3, a4, a5, *(int *)(a1 + 64));
}

uint64_t x25519_pub_decode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD *v6;
  uint64_t v7;

  if (CBS_len(a2))
  {
    ERR_put_error(6, 0, 102, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 133);
    return 0;
  }
  else
  {
    v6 = (_OWORD *)CBS_data(a3);
    v7 = CBS_len(a3);
    return x25519_set_pub_raw(a1, v6, v7);
  }
}

uint64_t x25519_pub_encode(uint64_t *a1, uint64_t a2)
{
  const void *v3;
  __int128 v4;
  _OWORD v6[3];
  _OWORD v7[3];
  _OWORD v8[3];
  _OWORD v9[3];

  v3 = *(const void **)(a2 + 8);
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v9[1] = v4;
  v9[2] = v4;
  v9[0] = v4;
  v8[1] = v4;
  v8[2] = v4;
  v7[2] = v4;
  v8[0] = v4;
  v7[0] = v4;
  v7[1] = v4;
  v6[1] = v4;
  v6[2] = v4;
  v6[0] = v4;
  if (CBB_add_asn1(a1, (uint64_t)v9, 0x20000010u)
    && CBB_add_asn1((uint64_t *)v9, (uint64_t)v8, 0x20000010u)
    && CBB_add_asn1((uint64_t *)v8, (uint64_t)v7, 6u)
    && CBB_add_bytes((uint64_t)v7, &unk_1E686E4CC, 3uLL)
    && CBB_add_asn1((uint64_t *)v9, (uint64_t)v6, 3u)
    && CBB_add_u8((uint64_t)v6, 0)
    && CBB_add_bytes((uint64_t)v6, v3, 0x20uLL)
    && CBB_flush(a1))
  {
    return 1;
  }
  ERR_put_error(6, 0, 105, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 153);
  return 0;
}

BOOL x25519_pub_cmp(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(uint64_t **)(a1 + 8);
  v3 = *(uint64_t **)(a2 + 8);
  v4 = *v2;
  v5 = v2[1];
  v6 = *v3;
  v7 = v3[1];
  v9 = v2[2];
  v8 = v2[3];
  v11 = v3[2];
  v10 = v3[3];
  return v4 == v6 && v5 == v7 && v9 == v11 && v8 == v10;
}

uint64_t x25519_priv_decode(uint64_t a1, uint64_t a2, __int128 *a3)
{
  _OWORD *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[0] = 0xAAAAAAAAAAAAAAAALL;
  v8[1] = 0xAAAAAAAAAAAAAAAALL;
  if (CBS_len(a2) || !CBS_get_asn1(a3, v8, 4) || CBS_len((uint64_t)a3))
  {
    ERR_put_error(6, 0, 102, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 175);
    return 0;
  }
  else
  {
    v6 = (_OWORD *)CBS_data((uint64_t)v8);
    v7 = CBS_len((uint64_t)v8);
    return x25519_set_priv_raw(a1, v6, v7);
  }
}

uint64_t x25519_priv_encode(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  __int128 v4;
  int v6;
  int v7;
  _OWORD v8[3];
  _OWORD v9[3];
  _OWORD v10[3];
  _OWORD v11[3];
  _OWORD v12[3];

  v2 = *(_QWORD *)(a2 + 8);
  if (*(_BYTE *)(v2 + 64))
  {
    *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v12[1] = v4;
    v12[2] = v4;
    v11[2] = v4;
    v12[0] = v4;
    v11[0] = v4;
    v11[1] = v4;
    v10[1] = v4;
    v10[2] = v4;
    v9[2] = v4;
    v10[0] = v4;
    v9[0] = v4;
    v9[1] = v4;
    v8[1] = v4;
    v8[2] = v4;
    v8[0] = v4;
    if (CBB_add_asn1(a1, (uint64_t)v12, 0x20000010u)
      && CBB_add_asn1_uint64((uint64_t *)v12, 0)
      && CBB_add_asn1((uint64_t *)v12, (uint64_t)v11, 0x20000010u)
      && CBB_add_asn1((uint64_t *)v11, (uint64_t)v10, 6u)
      && CBB_add_bytes((uint64_t)v10, &unk_1E686E4CC, 3uLL)
      && CBB_add_asn1((uint64_t *)v12, (uint64_t)v9, 4u)
      && CBB_add_asn1((uint64_t *)v9, (uint64_t)v8, 4u)
      && CBB_add_bytes((uint64_t)v8, (const void *)(v2 + 32), 0x20uLL)
      && CBB_flush(a1))
    {
      return 1;
    }
    v6 = 105;
    v7 = 202;
  }
  else
  {
    v6 = 130;
    v7 = 185;
  }
  ERR_put_error(6, 0, v6, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", v7);
  return 0;
}

uint64_t x25519_set_priv_raw(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  __int128 v7;
  uint64_t v8;

  if (a3 != 32)
  {
    ERR_put_error(6, 0, 102, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 33);
    return 0;
  }
  v5 = OPENSSL_malloc(0x41uLL);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = a2[1];
  *((_OWORD *)v5 + 2) = *a2;
  *((_OWORD *)v5 + 3) = v7;
  X25519_public_from_private(v5, (uint64_t)(v5 + 4));
  v8 = 1;
  *((_BYTE *)v6 + 64) = 1;
  OPENSSL_free(*(_QWORD **)(a1 + 8));
  *(_QWORD *)(a1 + 8) = v6;
  return v8;
}

uint64_t x25519_set_pub_raw(uint64_t a1, _OWORD *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;
  __int128 v7;

  if (a3 == 32)
  {
    result = (uint64_t)OPENSSL_malloc(0x41uLL);
    if (result)
    {
      v6 = result;
      v7 = a2[1];
      *(_OWORD *)result = *a2;
      *(_OWORD *)(result + 16) = v7;
      *(_BYTE *)(result + 64) = 0;
      OPENSSL_free(*(_QWORD **)(a1 + 8));
      *(_QWORD *)(a1 + 8) = v6;
      return 1;
    }
  }
  else
  {
    ERR_put_error(6, 0, 102, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 53);
    return 0;
  }
  return result;
}

uint64_t x25519_get_priv_raw(uint64_t a1, _OWORD *a2, _QWORD *a3)
{
  uint64_t v3;
  int v4;
  int v5;
  __int128 v7;

  v3 = *(_QWORD *)(a1 + 8);
  if (!*(_BYTE *)(v3 + 64))
  {
    v4 = 130;
    v5 = 74;
    goto LABEL_6;
  }
  if (a2)
  {
    if (*a3 <= 0x1FuLL)
    {
      v4 = 100;
      v5 = 84;
LABEL_6:
      ERR_put_error(6, 0, v4, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", v5);
      return 0;
    }
    v7 = *(_OWORD *)(v3 + 48);
    *a2 = *(_OWORD *)(v3 + 32);
    a2[1] = v7;
  }
  *a3 = 32;
  return 1;
}

uint64_t x25519_get_pub_raw(uint64_t a1, _OWORD *a2, _QWORD *a3)
{
  _OWORD *v4;
  __int128 v5;

  if (a2)
  {
    if (*a3 <= 0x1FuLL)
    {
      ERR_put_error(6, 0, 100, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 102);
      return 0;
    }
    v4 = *(_OWORD **)(a1 + 8);
    v5 = v4[1];
    *a2 = *v4;
    a2[1] = v5;
  }
  *a3 = 32;
  return 1;
}

uint64_t x25519_get1_tls_encodedpoint(uint64_t a1, _QWORD *a2)
{
  const void *v2;
  _QWORD *v4;

  v2 = *(const void **)(a1 + 8);
  if (v2)
  {
    v4 = OPENSSL_memdup(v2, 0x20uLL);
    *a2 = v4;
    return 32 * (v4 != 0);
  }
  else
  {
    ERR_put_error(6, 0, 120, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_x25519_asn1.c", 120);
    return 0;
  }
}

uint64_t x25519_size()
{
  return 32;
}

uint64_t x25519_bits()
{
  return 253;
}

void x25519_free(uint64_t a1)
{
  OPENSSL_free(*(_QWORD **)(a1 + 8));
  *(_QWORD *)(a1 + 8) = 0;
}

void sk_pop_free(STACK *st, void (__cdecl *func)(void *))
{
  unint64_t v3;
  unint64_t v5;

  if (st)
  {
    v3 = *(_QWORD *)&st->num;
    if (*(_QWORD *)&st->num)
    {
      v5 = 0;
      do
      {
        if (st->data[v5])
        {
          ((void (*)(void))func)();
          v3 = *(_QWORD *)&st->num;
        }
        ++v5;
      }
      while (v5 < v3);
    }
    OPENSSL_free(st->data);
    OPENSSL_free(st);
  }
}

char *__cdecl sk_delete(STACK *st, int loc)
{
  uint64_t v3;
  char **v4;
  char *v5;
  uint64_t v6;
  size_t v7;

  if (!st)
    return 0;
  v3 = *(_QWORD *)&st->num;
  if (*(_QWORD *)&st->num <= *(_QWORD *)&loc)
    return 0;
  v4 = &st->data[*(_QWORD *)&loc];
  v5 = *v4;
  v6 = v3 - 1;
  v7 = 8 * (v3 + ~*(_QWORD *)&loc);
  if (v3 - 1 != *(_QWORD *)&loc && v7 != 0)
  {
    memmove(v4, v4 + 1, v7);
    v6 = *(_QWORD *)&st->num - 1;
  }
  *(_QWORD *)&st->num = v6;
  return v5;
}

char *__cdecl sk_shift(STACK *st)
{
  if (st && *(_QWORD *)&st->num)
    return sk_delete(st, 0);
  else
    return 0;
}

char *__cdecl sk_pop(STACK *st)
{
  if (st && *(_QWORD *)&st->num)
    return sk_delete(st, *(_QWORD *)&st->num - 1);
  else
    return 0;
}

uint64_t OPENSSL_lh_retrieve(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD, uint64_t), unsigned int (*a4)(_QWORD, _QWORD, uint64_t))
{
  _QWORD *next_ptr_and_hash;

  next_ptr_and_hash = get_next_ptr_and_hash(a1, 0, a2, a3, a4);
  if (*next_ptr_and_hash)
    return *(_QWORD *)*next_ptr_and_hash;
  else
    return 0;
}

_QWORD *get_next_ptr_and_hash(_QWORD *a1, unsigned int *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t), unsigned int (*a5)(_QWORD, _QWORD, uint64_t))
{
  unsigned int v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;

  v9 = a4(a1[5], a3);
  if (a2)
    *a2 = v9;
  v10 = (_QWORD *)(a1[1] + 8 * ((unint64_t)v9 % a1[2]));
  v11 = (_QWORD *)*v10;
  if (*v10 && a5(a1[4], *v11, a3))
  {
    do
    {
      v12 = v11;
      v11 = (_QWORD *)v11[1];
    }
    while (v11 && a5(a1[4], *v11, a3));
    return v12 + 1;
  }
  return v10;
}

uint64_t OPENSSL_lh_retrieve_key(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int (*a4)(uint64_t, _QWORD))
{
  unint64_t v4;
  _QWORD *v5;
  _QWORD *v8;

  v4 = *(_QWORD *)(a1 + 8) + 8 * ((unint64_t)a3 % *(_QWORD *)(a1 + 16));
  v5 = *(_QWORD **)v4;
  if (*(_QWORD *)v4)
  {
    if (a4(a2, *v5))
    {
      while (1)
      {
        v8 = v5;
        v5 = (_QWORD *)v5[1];
        if (!v5)
          break;
        if (!a4(a2, *v5))
        {
          v4 = (unint64_t)(v8 + 1);
          goto LABEL_6;
        }
      }
    }
    else
    {
LABEL_6:
      if (*(_QWORD *)v4)
        return **(_QWORD **)v4;
    }
  }
  return 0;
}

uint64_t OPENSSL_lh_insert(_QWORD *a1, _QWORD *a2, uint64_t a3, uint64_t (*a4)(_QWORD, uint64_t), unsigned int (*a5)(_QWORD, _QWORD, uint64_t))
{
  uint64_t *next_ptr_and_hash;
  uint64_t *v9;
  uint64_t result;
  unsigned int v11;

  v11 = -1431655766;
  *a2 = 0;
  next_ptr_and_hash = get_next_ptr_and_hash(a1, &v11, a3, a4, a5);
  v9 = next_ptr_and_hash;
  if (*next_ptr_and_hash)
  {
    *a2 = *(_QWORD *)*next_ptr_and_hash;
    *(_QWORD *)*next_ptr_and_hash = a3;
  }
  else
  {
    result = (uint64_t)OPENSSL_malloc(0x18uLL);
    if (!result)
      return result;
    *(_DWORD *)(result + 16) = v11;
    *(_QWORD *)result = a3;
    *(_QWORD *)(result + 8) = 0;
    *v9 = result;
    ++*a1;
    lh_maybe_resize((uint64_t)a1);
  }
  return 1;
}

uint64_t OPENSSL_lh_delete(_QWORD *a1, uint64_t a2, uint64_t (*a3)(_QWORD, uint64_t), unsigned int (*a4)(_QWORD, _QWORD, uint64_t))
{
  uint64_t **next_ptr_and_hash;
  uint64_t *v6;
  uint64_t v7;

  next_ptr_and_hash = (uint64_t **)get_next_ptr_and_hash(a1, 0, a2, a3, a4);
  v6 = *next_ptr_and_hash;
  if (!*next_ptr_and_hash)
    return 0;
  *next_ptr_and_hash = (uint64_t *)v6[1];
  v7 = *v6;
  OPENSSL_free(v6);
  --*a1;
  lh_maybe_resize((uint64_t)a1);
  return v7;
}

void lh_rebucket(uint64_t a1, unint64_t a2)
{
  size_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  if (!(a2 >> 61))
  {
    v4 = 8 * a2;
    v5 = OPENSSL_malloc(8 * a2);
    if (v5)
    {
      v6 = v5;
      if (v4)
        bzero(v5, v4);
      v7 = *(_QWORD *)(a1 + 16);
      if (v7)
      {
        for (i = 0; i != v7; ++i)
        {
          v9 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * i);
          if (v9)
          {
            do
            {
              v10 = *(unsigned int *)(v9 + 16) % a2;
              v11 = *(_QWORD *)(v9 + 8);
              *(_QWORD *)(v9 + 8) = v6[v10];
              v6[v10] = v9;
              v9 = v11;
            }
            while (v11);
          }
        }
      }
      OPENSSL_free(*(_QWORD **)(a1 + 8));
      *(_QWORD *)(a1 + 8) = v6;
      *(_QWORD *)(a1 + 16) = a2;
    }
  }
}

unint64_t ERR_get_error(void)
{
  return get_error_values(1, 0, 0, 0, 0, 0);
}

uint64_t get_error_values(int a1, int a2, _QWORD *a3, _DWORD *a4, _QWORD *a5, _DWORD *a6)
{
  _QWORD *state;
  _QWORD *v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;

  state = err_get_state();
  if (!state)
    return 0;
  v13 = state;
  v14 = *((_DWORD *)state + 97);
  v15 = *((_DWORD *)state + 96);
  if (v14 == v15)
    return 0;
  if (a2)
  {
    if (a1)
      get_error_values_cold_2();
  }
  else
  {
    v15 = (v14 + 1) & 0xF;
  }
  v17 = v15;
  v18 = &state[3 * v15];
  v16 = *((unsigned int *)v18 + 4);
  if (a3 && a4)
  {
    v19 = *v18;
    if (*v18)
    {
      *a3 = v19;
      LODWORD(v19) = WORD2(state[3 * v15 + 2]);
    }
    else
    {
      *a3 = "NA";
    }
    *a4 = v19;
  }
  if (!a5)
    goto LABEL_24;
  v20 = &state[3 * v15];
  v23 = v20[1];
  v22 = v20 + 1;
  v21 = v23;
  if (!v23)
  {
    *a5 = &unk_1B50022E3;
    if (a6)
      *a6 = 0;
LABEL_24:
    if (!a1)
      return v16;
    goto LABEL_25;
  }
  *a5 = v21;
  if (a6)
    *a6 = 3;
  if (a1)
  {
    if (*v22)
    {
      free((void *)state[49]);
      v17 = v15;
      v13[49] = *v22;
    }
    *v22 = 0;
LABEL_25:
    if (a2)
      get_error_values_cold_1();
    free((void *)v13[3 * v17 + 1]);
    *v18 = 0;
    v18[1] = 0;
    v18[2] = 0;
    *((_DWORD *)v13 + 97) = v15;
  }
  return v16;
}

unint64_t ERR_peek_last_error(void)
{
  unint64_t result;
  unsigned int v1;

  result = (unint64_t)err_get_state();
  if (result)
  {
    v1 = *(_DWORD *)(result + 384);
    if (*(_DWORD *)(result + 388) == v1)
      return 0;
    else
      return *(unsigned int *)(result + 24 * v1 + 16);
  }
  return result;
}

const char *__cdecl ERR_reason_error_string(unint64_t e)
{
  const char *result;

  result = err_reason_error_string(e);
  if (!result)
    return "unknown error";
  return result;
}

char *err_reason_error_string(unsigned int a1)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v5;
  _DWORD *v6;
  int __key;

  v2 = HIBYTE(a1);
  v3 = a1 & 0xFFF;
  if (v2 == 2)
  {
    if (v3 <= 0x7E)
      return strerror(v3);
    return 0;
  }
  if (v3 <= 0x21)
    return kLibraryNames[v3];
  if (v3 > 0x63)
  {
    v5 = 0;
    if (a1 >> 30 || v3 > 0x7FF)
      return (char *)v5;
    __key = ((_DWORD)v3 << 15) | (v2 << 26);
    v6 = bsearch(&__key, &kOpenSSLReasonValues, 0x2B7uLL, 4uLL, (int (__cdecl *)(const void *, const void *))err_string_cmp);
    if (!v6)
      return 0;
    return &kOpenSSLReasonStringData[*v6 & 0x7FFF];
  }
  else
  {
    if ((v3 - 65) >= 5)
      return 0;
    return off_1E686F7F0[v3 - 65];
  }
}

void ERR_error_string_n(unint64_t e, char *buf, size_t len)
{
  int v5;
  unsigned int v6;
  char *v7;
  char *v8;
  char *v9;
  __int128 v10;
  size_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char v18[16];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char bufa[16];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (!len)
    return;
  v5 = e;
  v6 = BYTE3(e);
  if (e >> 25 <= 0x10)
    v7 = kLibraryNames[v6];
  else
    v7 = 0;
  v8 = err_reason_error_string(e);
  v9 = v8;
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24 = v10;
  v25 = v10;
  *(_OWORD *)bufa = v10;
  v23 = v10;
  v20 = v10;
  v21 = v10;
  *(_OWORD *)v18 = v10;
  v19 = v10;
  if (!v7)
  {
    v7 = bufa;
    BIO_snprintf(bufa, 0x40uLL, "lib(%u)", v6);
    if (v9)
      goto LABEL_8;
LABEL_17:
    v9 = v18;
    BIO_snprintf(v18, 0x40uLL, "reason(%u)", v5 & 0xFFF);
    goto LABEL_8;
  }
  if (!v8)
    goto LABEL_17;
LABEL_8:
  BIO_snprintf(buf, len, "error:%08x:%s:OPENSSL_internal:%s", v5, v7, v9);
  v11 = strlen(buf);
  if (len >= 5 && v11 == len - 1)
  {
    v12 = &buf[v11];
    v13 = -4;
    v14 = buf;
    while (1)
    {
      v15 = strchr(v14, 58);
      v16 = &v12[v13];
      if (!v15 || v15 > v16)
        break;
      v14 = v15 + 1;
      if (__CFADD__(v13++, 1))
        return;
    }
    memset(v16, 58, -v13);
  }
}

void ERR_print_errors_cb(int (__cdecl *cb)(const char *, size_t, void *), void *u)
{
  __int128 v4;
  _QWORD *state;
  unint64_t error_values;
  const char *v7;
  size_t v8;
  _QWORD v9[3];
  char __b[1024];
  _OWORD buf[7];
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  buf[5] = v4;
  buf[6] = v4;
  buf[3] = v4;
  buf[4] = v4;
  buf[1] = v4;
  buf[2] = v4;
  buf[0] = v4;
  memset(__b, 170, sizeof(__b));
  memset(v9, 170, sizeof(v9));
  state = err_get_state();
  do
  {
    error_values = get_error_values(1, 0, &v9[2], (_DWORD *)v9 + 1, &v9[1], v9);
    if (!(_DWORD)error_values)
      break;
    ERR_error_string_n(error_values, (char *)buf, 0x78uLL);
    v7 = (v9[0] & 1) != 0 ? (const char *)v9[1] : (const char *)&unk_1B50022E3;
    BIO_snprintf(__b, 0x400uLL, "%lu:%s:%s:%d:%s\n", state, (const char *)buf, (const char *)v9[2], HIDWORD(v9[0]), v7);
    v8 = strlen(__b);
  }
  while (((int (*)(char *, size_t, void *))cb)(__b, v8, u) > 0);
}

void ERR_print_errors_fp(FILE *fp)
{
  ERR_print_errors_cb((int (__cdecl *)(const char *, size_t, void *))print_errors_to_file, fp);
}

BOOL print_errors_to_file(const char *a1, uint64_t a2, FILE *a3)
{
  if (a1[a2])
    print_errors_to_file_cold_1();
  return fputs(a1, a3) >= 0;
}

void ERR_add_error_data(int num, ...)
{
  uint64_t v2;
  size_t v3;
  uint64_t v4;
  const char *v5;
  size_t v6;
  _BYTE *v7;
  _BYTE *v8;
  char **v9;
  va_list v10;
  va_list v11;
  va_list va;

  va_start(va, num);
  va_copy(v10, va);
  va_copy(v11, va);
  v2 = num;
  v3 = 0;
  if (!num)
    goto LABEL_8;
  v4 = num;
  do
  {
    v5 = va_arg(v10, const char *);
    if (v5)
    {
      v6 = strlen(v5);
      if (__CFADD__(v3, v6))
        return;
      v3 += v6;
    }
    --v4;
  }
  while (v4);
  if (v3 != -1)
  {
LABEL_8:
    v7 = malloc_type_malloc(v3 + 1, 0x104FB059uLL);
    if (v7)
    {
      v8 = v7;
      *v7 = 0;
      if (num)
      {
        do
        {
          v9 = (char **)v11;
          v11 += 8;
          if (*v9)
          {
            if (OPENSSL_strlcat(v8, *v9, v3 + 1) > v3)
              ERR_add_error_data_cold_1();
          }
          --v2;
        }
        while (v2);
      }
      err_set_error_data(v8);
    }
  }
}

void ERR_add_error_dataf(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char *v9;

  v9 = 0;
  if (OPENSSL_vasprintf_internal(&v9, a1, &a9, 1) != -1)
    err_set_error_data(v9);
}

void err_set_error_data(void *a1)
{
  _QWORD *state;
  unsigned int v3;
  _QWORD *v4;

  state = err_get_state();
  if (state && (v3 = *((_DWORD *)state + 96), v3 != *((_DWORD *)state + 97)))
  {
    v4 = &state[3 * v3];
    free((void *)v4[1]);
    v4[1] = a1;
  }
  else
  {
    free(a1);
  }
}

void ERR_SAVE_STATE_free(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 8))
    {
      v2 = 0;
      v3 = 0;
      do
      {
        v4 = *(_QWORD *)a1 + v2;
        free(*(void **)(v4 + 8));
        *(_QWORD *)v4 = 0;
        *(_QWORD *)(v4 + 8) = 0;
        *(_QWORD *)(v4 + 16) = 0;
        ++v3;
        v2 += 24;
      }
      while (v3 < *(_QWORD *)(a1 + 8));
    }
    free(*(void **)a1);
    free((void *)a1);
  }
}

_QWORD *ERR_save_state()
{
  _QWORD *state;
  _QWORD *v1;
  _QWORD *v2;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;

  state = err_get_state();
  if (!state)
    return 0;
  v1 = state;
  if (*((_DWORD *)state + 96) == *((_DWORD *)state + 97))
    return 0;
  v2 = malloc_type_malloc(0x10uLL, 0x1020040EDED9539uLL);
  if (!v2)
    return v2;
  v4 = *((_DWORD *)v1 + 96);
  v5 = *((_DWORD *)v1 + 97);
  if (v4 >= v5)
    v6 = *((_DWORD *)v1 + 96);
  else
    v6 = v4 + 16;
  v7 = v6 - v5;
  if (v7 >= 0x10)
    ERR_save_state_cold_1();
  v8 = malloc_type_malloc(24 * v7, 0x10500400B811B97uLL);
  *v2 = v8;
  if (!v8)
  {
    free(v2);
    return 0;
  }
  if (v6 == v5)
  {
    v2[1] = v7;
  }
  else
  {
    bzero(v8, 24 * v7);
    v9 = 0;
    v2[1] = v7;
    if (v7 <= 1)
      v10 = 1;
    else
      v10 = v6 - v5;
    v11 = 24 * v10;
    v12 = 1;
    do
    {
      err_copy(*v2 + v9, (uint64_t)&v1[3 * ((v12 + *((_DWORD *)v1 + 97)) & 0xF)]);
      v9 += 24;
      ++v12;
    }
    while (v11 != v9);
  }
  return v2;
}

char *err_copy(uint64_t a1, uint64_t a2)
{
  char *result;

  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  result = *(char **)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  if (result)
  {
    result = strdup(result);
    *(_QWORD *)(a1 + 8) = result;
  }
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_WORD *)(a1 + 20) = *(_WORD *)(a2 + 20);
  return result;
}

void ERR_restore_state(_QWORD *a1)
{
  _QWORD *state;
  _QWORD *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;

  if (a1 && a1[1])
  {
    state = err_get_state();
    if (state)
    {
      v3 = state;
      if (a1[1])
      {
        v4 = 0;
        v5 = 0;
        do
        {
          err_copy((uint64_t)&v3[v4], *a1 + v4 * 8);
          ++v5;
          v6 = a1[1];
          v4 += 3;
        }
        while (v5 < v6);
        v7 = v6 - 1;
      }
      else
      {
        v7 = -1;
      }
      *((_DWORD *)v3 + 96) = v7;
      *((_DWORD *)v3 + 97) = 15;
    }
  }
  else
  {
    ERR_clear_error();
  }
}

uint64_t err_string_cmp(_DWORD *a1, _DWORD *a2)
{
  unsigned int v2;
  BOOL v3;
  _BOOL4 v4;

  v2 = *a1 >> 15;
  v3 = v2 >= *a2 >> 15;
  v4 = v2 > *a2 >> 15;
  if (v3)
    return v4;
  else
    return 0xFFFFFFFFLL;
}

boringssl_concrete_boringssl_context_state *boringssl_context_state_create(uint64_t a1)
{
  boringssl_concrete_boringssl_context_state *v2;
  boringssl_concrete_boringssl_context_state *v3;
  boringssl_concrete_boringssl_context_state *v4;
  NSObject *v5;

  if (!a1)
    return 0;
  v2 = objc_alloc_init(boringssl_concrete_boringssl_context_state);
  v3 = v2;
  if (v2)
  {
    v2->cached_content_type = 2;
    v2->ssl_ctx = (ssl_ctx_st *)a1;
    SSL_CTX_up_ref(a1);
    v4 = v3;
  }
  else
  {
    v5 = g_boringssl_log;
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      boringssl_context_state_create_cold_1(v5);
  }

  return v3;
}

uint64_t boringssl_context_state_get_ssl_ctx(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

BOOL boringssl_context_state_is_context_state(_BOOL8 result)
{
  if (result)
    return *(unsigned __int8 *)(result + 8) == 2;
  return result;
}

void BN_BLINDING_free(BN_BLINDING *b)
{
  if (b)
  {
    BN_free(*(BIGNUM **)b);
    BN_free(*((BIGNUM **)b + 1));
    OPENSSL_free(b);
  }
}

RSA *RSA_parse_private_key(__int128 *a1)
{
  RSA *v2;
  int v3;
  int v4;
  unint64_t v6[3];

  v2 = RSA_new();
  if (v2)
  {
    memset(v6, 170, sizeof(v6));
    if (CBS_get_asn1(a1, &v6[1], 536870928) && CBS_get_asn1_uint64((__int128 *)&v6[1], v6))
    {
      if (v6[0])
      {
        v3 = 106;
        v4 = 171;
      }
      else
      {
        if (!parse_integer_0((__int128 *)&v6[1], (BIGNUM **)&v2->version)
          || !parse_integer_0((__int128 *)&v6[1], (BIGNUM **)&v2->meth)
          || !parse_integer_0((__int128 *)&v6[1], (BIGNUM **)&v2->engine)
          || !parse_integer_0((__int128 *)&v6[1], &v2->n)
          || !parse_integer_0((__int128 *)&v6[1], &v2->e)
          || !parse_integer_0((__int128 *)&v6[1], &v2->d)
          || !parse_integer_0((__int128 *)&v6[1], &v2->p)
          || !parse_integer_0((__int128 *)&v6[1], &v2->q))
        {
          goto LABEL_8;
        }
        if (CBS_len((uint64_t)&v6[1]))
        {
          v3 = 100;
          v4 = 187;
        }
        else
        {
          if (RSA_check_key(v2))
            return v2;
          v3 = 104;
          v4 = 192;
        }
      }
    }
    else
    {
      v3 = 100;
      v4 = 166;
    }
    ERR_put_error(4, 0, v3, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/rsa_extra/rsa_asn1.c", v4);
LABEL_8:
    RSA_free(v2);
    return 0;
  }
  return v2;
}

RSA *RSA_private_key_from_bytes(uint64_t a1, uint64_t a2)
{
  RSA *v2;
  __int128 v4;

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  CBS_init(&v4, a1, a2);
  v2 = RSA_parse_private_key(&v4);
  if (!v2 || CBS_len((uint64_t)&v4))
  {
    ERR_put_error(4, 0, 100, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/rsa_extra/rsa_asn1.c", 208);
    RSA_free(v2);
    return 0;
  }
  return v2;
}

uint64_t RSA_marshal_private_key(uint64_t *a1, const BIGNUM **a2)
{
  __int128 v4;
  _OWORD v6[3];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = v4;
  v6[2] = v4;
  v6[0] = v4;
  if (CBB_add_asn1(a1, (uint64_t)v6, 0x20000010u)
    && CBB_add_asn1_uint64((uint64_t *)v6, 0)
    && marshal_integer_0((uint64_t *)v6, a2[1])
    && marshal_integer_0((uint64_t *)v6, a2[2])
    && marshal_integer_0((uint64_t *)v6, a2[3])
    && marshal_integer_0((uint64_t *)v6, a2[4])
    && marshal_integer_0((uint64_t *)v6, a2[5])
    && marshal_integer_0((uint64_t *)v6, a2[6])
    && marshal_integer_0((uint64_t *)v6, a2[7])
    && marshal_integer_0((uint64_t *)v6, a2[8])
    && CBB_flush(a1))
  {
    return 1;
  }
  ERR_put_error(4, 0, 121, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/rsa_extra/rsa_asn1.c", 228);
  return 0;
}

uint64_t RSA_private_key_to_bytes(_QWORD *a1, _QWORD *a2, const BIGNUM **a3)
{
  __int128 v6;
  _OWORD v8[3];

  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8[1] = v6;
  v8[2] = v6;
  v8[0] = v6;
  CBB_zero(v8);
  if (CBB_init((uint64_t)v8, 0)
    && RSA_marshal_private_key((uint64_t *)v8, a3)
    && CBB_finish((uint64_t)v8, a1, a2))
  {
    return 1;
  }
  ERR_put_error(4, 0, 121, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/rsa_extra/rsa_asn1.c", 241);
  CBB_cleanup((uint64_t)v8);
  return 0;
}

int BIO_printf(BIO *bio, const char *format, ...)
{
  __int128 v4;
  unsigned int v5;
  int v6;
  int v7;
  char *v8;
  char *v9;
  char __str[16];
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
  uint64_t v27;
  va_list va;

  va_start(va, format);
  v27 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v25 = v4;
  v26 = v4;
  v23 = v4;
  v24 = v4;
  v21 = v4;
  v22 = v4;
  v19 = v4;
  v20 = v4;
  v17 = v4;
  v18 = v4;
  v15 = v4;
  v16 = v4;
  v13 = v4;
  v14 = v4;
  *(_OWORD *)__str = v4;
  v12 = v4;
  v5 = vsnprintf(__str, 0x100uLL, format, va);
  if ((v5 & 0x80000000) != 0)
    return -1;
  v6 = v5;
  if (v5 <= 0xFF)
    return BIO_write(bio, __str, v5);
  v8 = (char *)OPENSSL_malloc(v5 + 1);
  if (!v8)
    return -1;
  v9 = v8;
  if (vsnprintf(v8, (v6 + 1), format, va) != v6)
    BIO_printf_cold_1();
  v7 = BIO_write(bio, v9, v6);
  OPENSSL_free(v9);
  return v7;
}

uint64_t CBS_asn1_ber_to_der(__int128 *a1, _QWORD *a2, uint64_t *a3)
{
  __int128 v6;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  int v10;
  _OWORD v11[3];

  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11[1] = v6;
  v11[2] = v6;
  v11[0] = v6;
  v10 = -1431655766;
  result = cbs_find_ber((uint64_t)a1, &v10, 0);
  if ((_DWORD)result)
  {
    if (v10)
    {
      v9 = 0xAAAAAAAAAAAAAAAALL;
      v8 = CBS_len((uint64_t)a1);
      if (!CBB_init((uint64_t)v11, v8)
        || !cbs_convert_ber(a1, (uint64_t *)v11, 0, 0, 0)
        || !CBB_finish((uint64_t)v11, a3, &v9))
      {
        CBB_cleanup((uint64_t)v11);
        return 0;
      }
      CBS_init(a2, *a3, v9);
    }
    else
    {
      result = CBS_get_any_asn1_element(a1, a2, 0, 0);
      if (!(_DWORD)result)
        return result;
      *a3 = 0;
    }
    return 1;
  }
  return result;
}

uint64_t cbs_find_ber(uint64_t a1, int *a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v12;
  unint64_t v13;
  _DWORD v14[5];
  __int128 v15;

  *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  if (a3 <= 0x800)
  {
    v7 = CBS_data(a1);
    v8 = CBS_len(a1);
    CBS_init(&v15, v7, v8);
    *a2 = 0;
    v3 = 1;
    if (!CBS_len((uint64_t)&v15))
      return v3;
    v9 = a3 + 1;
    while (1)
    {
      memset(v14, 170, sizeof(v14));
      v13 = 0xAAAAAAAAAAAAAAAALL;
      v12 = -1431655766;
      if (!CBS_get_any_ber_asn1_element(&v15, &v14[1], v14, &v13, a2, &v12))
        break;
      if (!*a2)
      {
        if ((v14[0] & 0x20000000) != 0)
        {
          if ((v14[0] & 0xDFFFFFFF) <= 0x1E && ((1 << SLOBYTE(v14[0])) & 0x5E7C1010) != 0)
          {
            v3 = 1;
            *a2 = 1;
            return v3;
          }
          if (!CBS_skip(&v14[1], v13) || !cbs_find_ber(&v14[1], a2, v9))
            return 0;
        }
        if (CBS_len((uint64_t)&v15))
          continue;
      }
      return 1;
    }
  }
  return 0;
}

uint64_t cbs_convert_ber(__int128 *a1, uint64_t *a2, uint64_t a3, int a4, unsigned int a5)
{
  uint64_t result;
  uint64_t v10;
  __int128 v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t *v14;
  signed int v15;
  __int128 *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  const void *v20;
  size_t v21;
  _OWORD v22[3];
  int v23;
  unint64_t v24;
  _DWORD v25[5];

  if ((a3 & 0x20000000) != 0)
    cbs_convert_ber_cold_1();
  if (a5 > 0x800)
    return 0;
  v10 = a5 + 1;
  while (1)
  {
    if (!CBS_len((uint64_t)a1))
      return a4 == 0;
    if (a4
      && (unint64_t)CBS_len((uint64_t)a1) >= 2
      && !*(_BYTE *)CBS_data((uint64_t)a1)
      && !*(_BYTE *)(CBS_data((uint64_t)a1) + 1)
      && CBS_skip(a1, 2uLL))
    {
      return 1;
    }
    memset(v25, 170, sizeof(v25));
    v24 = 0xAAAAAAAAAAAAAAAALL;
    v23 = -1431655766;
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v22[1] = v11;
    v22[2] = v11;
    v22[0] = v11;
    if (!CBS_get_any_ber_asn1_element(a1, &v25[1], v25, &v24, 0, &v23))
      return 0;
    v12 = v25[0];
    if ((_DWORD)a3)
    {
      v13 = a3;
      v14 = a2;
      if ((v25[0] & 0xDFFFFFFF) != (_DWORD)a3)
        return 0;
    }
    else
    {
      if ((v25[0] & 0x20000000) != 0
        && (v15 = (v25[0] & 0xDFFFFFFF) - 4, v15 <= 0x1A)
        && ((0x5E7C101u >> (LOBYTE(v25[0]) - 4)) & 1) != 0)
      {
        v13 = dword_1B5018108[v15];
        v12 = dword_1B5018108[v15];
      }
      else
      {
        v13 = 0;
      }
      v14 = (uint64_t *)v22;
      if (!CBB_add_asn1(a2, (uint64_t)v22, v12))
        return 0;
    }
    if (v23)
    {
      v16 = a1;
      v17 = v14;
      v18 = v13;
      v19 = 1;
      goto LABEL_27;
    }
    if (!CBS_skip(&v25[1], v24))
      return 0;
    if ((v25[0] & 0x20000000) != 0)
    {
      v16 = (__int128 *)&v25[1];
      v17 = v14;
      v18 = v13;
      v19 = 0;
LABEL_27:
      if (!cbs_convert_ber(v16, v17, v18, v19, v10))
        return 0;
      goto LABEL_28;
    }
    v20 = (const void *)CBS_data((uint64_t)&v25[1]);
    v21 = CBS_len((uint64_t)&v25[1]);
    if (!CBB_add_bytes((uint64_t)v14, v20, v21))
      return 0;
LABEL_28:
    result = CBB_flush(a2);
    if (!(_DWORD)result)
      return result;
  }
}

uint64_t CBS_get_asn1_implicit_string(__int128 *a1, _QWORD *a2, _QWORD *a3, int a4, int a5)
{
  __int128 v11;
  unint64_t v12;
  const void *v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[2];
  __int128 v18;
  _OWORD v19[3];

  if ((a4 & 0x20000000) != 0)
    CBS_get_asn1_implicit_string_cold_3();
  if ((a5 & 0x20000000) != 0)
    CBS_get_asn1_implicit_string_cold_2();
  if ((a5 & 0xDFFFFFFF) > 0x1E || ((1 << a5) & 0x5E7C1010) == 0)
    CBS_get_asn1_implicit_string_cold_1();
  if (CBS_peek_asn1_tag(a1, a4))
  {
    *a3 = 0;
    return CBS_get_asn1(a1, a2, a4);
  }
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = v11;
  v19[2] = v11;
  v19[0] = v11;
  *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12 = CBS_len((uint64_t)a1);
  if (CBB_init((uint64_t)v19, v12) && CBS_get_asn1(a1, &v18, a4 | 0x20000000u))
  {
    if (CBS_len((uint64_t)&v18))
    {
      while (1)
      {
        v17[0] = 0xAAAAAAAAAAAAAAAALL;
        v17[1] = 0xAAAAAAAAAAAAAAAALL;
        if (!CBS_get_asn1(&v18, v17, a5))
          break;
        v13 = (const void *)CBS_data((uint64_t)v17);
        v14 = CBS_len((uint64_t)v17);
        if (!CBB_add_bytes((uint64_t)v19, v13, v14))
          break;
        if (!CBS_len((uint64_t)&v18))
          goto LABEL_13;
      }
    }
    else
    {
LABEL_13:
      v15 = 0xAAAAAAAAAAAAAAAALL;
      v16 = 0xAAAAAAAAAAAAAAAALL;
      if (CBB_finish((uint64_t)v19, &v16, &v15))
      {
        CBS_init(a2, v16, v15);
        *a3 = v16;
        return 1;
      }
    }
  }
  CBB_cleanup((uint64_t)v19);
  return 0;
}

uint64_t CBB_init_fixed(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_BYTE *)(a1 + 8) = 0;
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = a3;
  *(_BYTE *)(a1 + 40) &= 0xFCu;
  return 1;
}

_QWORD *CBB_data(uint64_t a1)
{
  _QWORD *v1;

  if (*(_QWORD *)a1)
    CBB_data_cold_1();
  v1 = *(_QWORD **)(a1 + 16);
  if (*(_BYTE *)(a1 + 8))
    return (_QWORD *)(*v1 + *(_QWORD *)(a1 + 24) + *(unsigned __int8 *)(a1 + 32));
  return v1;
}

BOOL add_base128_integer(uint64_t a1, unint64_t a2)
{
  unsigned int v4;
  unint64_t v5;
  BOOL v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;

  v4 = 0;
  if (a2)
  {
    v5 = a2;
    do
    {
      ++v4;
      v6 = v5 > 0x7F;
      v5 >>= 7;
    }
    while (v6);
  }
  if (v4 <= 1)
    v7 = 1;
  else
    v7 = v4;
  v8 = v7 - 1;
  v9 = 7 * v7 - 7;
  do
  {
    v10 = v8;
    if (v8 >= v7)
      break;
    v11 = cbb_add_u(a1, (a2 >> v9) & 0x7F | ((unint64_t)(v8 != 0) << 7), 1uLL);
    v8 = v10 - 1;
    v9 -= 7;
  }
  while (v11);
  return v10 >= v7;
}

uint64_t CBB_reserve(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  uint64_t result;
  _QWORD *v7;

  result = CBB_flush((uint64_t *)a1);
  if ((_DWORD)result)
  {
    v7 = (_QWORD *)(a1 + 16);
    if (*(_BYTE *)(a1 + 8))
      v7 = (_QWORD *)*v7;
    return cbb_buffer_reserve((uint64_t)v7, a2, a3) != 0;
  }
  return result;
}

uint64_t CBB_did_write(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  uint64_t result;
  uint64_t v5;
  BOOL v6;
  unint64_t v7;
  char v8;

  v3 = (_QWORD *)(a1 + 16);
  if (*(_BYTE *)(a1 + 8))
    v3 = (_QWORD *)*v3;
  result = 0;
  v5 = v3[1];
  v6 = __CFADD__(v5, a2);
  v7 = v5 + a2;
  v8 = v6;
  if (!*(_QWORD *)a1 && (v8 & 1) == 0)
  {
    if (v7 <= v3[2])
    {
      v3[1] = v7;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t CBB_add_u24(uint64_t a1, unsigned int a2)
{
  return cbb_add_u(a1, a2, 3uLL);
}

uint64_t *CBB_discard_child(uint64_t *result)
{
  uint64_t v1;
  _QWORD *v2;

  v1 = *result;
  if (*result)
  {
    v2 = result + 2;
    if (*((_BYTE *)result + 8))
      v2 = (_QWORD *)*v2;
    if (!*(_BYTE *)(v1 + 8))
      CBB_discard_child_cold_1();
    v2[1] = *(_QWORD *)(v1 + 24);
    *(_QWORD *)(v1 + 16) = 0;
    *result = 0;
  }
  return result;
}

uint64_t CBS_skip(_QWORD *a1, unint64_t a2)
{
  unint64_t v2;
  BOOL v3;
  unint64_t v4;

  v2 = a1[1];
  v3 = v2 >= a2;
  v4 = v2 - a2;
  if (!v3)
    return 0;
  *a1 += a2;
  a1[1] = v4;
  return 1;
}

BOOL CBS_strdup(uint64_t a1, _QWORD **a2)
{
  _QWORD *v4;

  if (*a2)
    OPENSSL_free(*a2);
  v4 = OPENSSL_strndup(*(_BYTE **)a1, *(_QWORD *)(a1 + 8));
  *a2 = v4;
  return v4 != 0;
}

BOOL CBS_contains_zero_byte(uint64_t a1)
{
  size_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  return v1 && memchr(*(void **)a1, 0, v1) != 0;
}

uint64_t CBS_copy_bytes(uint64_t a1, void *__dst, size_t a3)
{
  unint64_t v3;
  size_t v4;
  const void *v6;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = v3 - a3;
  if (v3 < a3)
    return 0;
  v6 = *(const void **)a1;
  *(_QWORD *)a1 += a3;
  *(_QWORD *)(a1 + 8) = v4;
  if (a3)
    memcpy(__dst, v6, a3);
  return 1;
}

uint64_t CBS_get_any_ber_asn1_element(__int128 *a1, _QWORD *a2, _DWORD *a3, unint64_t *a4, int *a5, _DWORD *a6)
{
  int v7;

  v7 = -1431655766;
  if (!a5)
    a5 = &v7;
  return cbs_get_any_asn1_element(a1, a2, a3, a4, a5, a6, 1);
}

uint64_t parse_base128_integer(_QWORD *a1, unint64_t *a2)
{
  unint64_t v2;
  uint64_t i;
  unsigned __int8 *v4;
  int v5;
  unint64_t v6;

  v2 = 0;
  for (i = a1[1] - 1; i != -1; --i)
  {
    v4 = (unsigned __int8 *)(*a1)++;
    a1[1] = i;
    if (v2 >> 57)
      break;
    v5 = *v4;
    if (!v2 && v5 == 128)
      break;
    v6 = v5 & 0x7F | (v2 << 7);
    v2 = v6;
    if ((v5 & 0x80) == 0)
    {
      *a2 = v6;
      return 1;
    }
  }
  return 0;
}

int EC_POINT_is_at_infinity(const EC_GROUP *a1, const EC_POINT *a2)
{
  BN_CTX *v2;

  if (!EC_GROUP_cmp(a1, *(const EC_GROUP **)a2, v2))
    return ec_GFp_simple_is_at_infinity((uint64_t)a1, (uint64_t)a2 + 8);
  ERR_put_error(15, 0, 106, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 749);
  return 0;
}

int EC_POINT_is_on_curve(const EC_GROUP *a1, const EC_POINT *a2, BN_CTX *a3)
{
  if (!EC_GROUP_cmp(a1, *(const EC_GROUP **)a2, a3))
    return ec_GFp_simple_is_on_curve(a1, (uint64_t)a2 + 8);
  ERR_put_error(15, 0, 106, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 758);
  return 0;
}

int EC_POINT_cmp(const EC_GROUP *a1, const EC_POINT *a, const EC_POINT *b, BN_CTX *a4)
{
  BN_CTX *v7;

  if (!EC_GROUP_cmp(a1, *(const EC_GROUP **)a, b) && !EC_GROUP_cmp(a1, *(const EC_GROUP **)b, v7))
    return ec_GFp_simple_points_equal((uint64_t)a1, (uint64_t)a + 8, (uint64_t)b + 8) == 0;
  ERR_put_error(15, 0, 106, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 768);
  return -1;
}

uint64_t ec_jacobian_to_affine_batch(uint64_t a1)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(*(_QWORD *)a1 + 32);
  if (v1)
    return v1();
  ERR_put_error(15, 0, 66, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 819);
  return 0;
}

int EC_POINT_set_affine_coordinates_GFp(const EC_GROUP *a1, EC_POINT *a2, const BIGNUM *x, const BIGNUM *y, BN_CTX *a5)
{
  int v9;
  int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[80];
  _OWORD v26[4];
  unint64_t v27;
  _OWORD v28[4];
  unint64_t v29;

  if (EC_GROUP_cmp(a1, *(const EC_GROUP **)a2, (BN_CTX *)x))
  {
    v9 = 106;
    v10 = 862;
LABEL_10:
    ERR_put_error(15, 0, v9, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", v10);
    return 0;
  }
  if (!x || !y)
  {
    v9 = 67;
    v10 = 867;
    goto LABEL_10;
  }
  v29 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v28[2] = v11;
  v28[3] = v11;
  v28[0] = v11;
  v28[1] = v11;
  v27 = 0xAAAAAAAAAAAAAAAALL;
  v26[2] = v11;
  v26[3] = v11;
  v26[0] = v11;
  v26[1] = v11;
  *(_OWORD *)&v25[48] = v11;
  *(_OWORD *)&v25[64] = v11;
  *(_OWORD *)&v25[16] = v11;
  *(_OWORD *)&v25[32] = v11;
  v24 = v11;
  *(_OWORD *)v25 = v11;
  v22 = v11;
  v23 = v11;
  v21 = v11;
  if (ec_bignum_to_felem((uint64_t)a1, (uint64_t)v28, x)
    && ec_bignum_to_felem((uint64_t)a1, (uint64_t)v26, y)
    && ec_point_set_affine_coordinates((uint64_t)a1, (uint64_t)&v21, (uint64_t)v28, (uint64_t)v26))
  {
    v12 = v21;
    *(_OWORD *)((char *)a2 + 24) = v22;
    v13 = v24;
    *(_OWORD *)((char *)a2 + 40) = v23;
    *(_OWORD *)((char *)a2 + 56) = v13;
    *((_QWORD *)a2 + 9) = *(_QWORD *)v25;
    *(_OWORD *)((char *)a2 + 8) = v12;
    v14 = *(_OWORD *)&v25[8];
    *((_QWORD *)a2 + 18) = *(_QWORD *)&v25[72];
    v15 = *(_OWORD *)&v25[56];
    *((_OWORD *)a2 + 7) = *(_OWORD *)&v25[40];
    *((_OWORD *)a2 + 8) = v15;
    v16 = *(_OWORD *)&v25[24];
    *((_OWORD *)a2 + 5) = v14;
    *((_OWORD *)a2 + 6) = v16;
    *(_OWORD *)((char *)a2 + 152) = *((_OWORD *)a1 + 20);
    v17 = *((_OWORD *)a1 + 21);
    v18 = *((_OWORD *)a1 + 22);
    v19 = *((_OWORD *)a1 + 23);
    *((_QWORD *)a2 + 27) = *((_QWORD *)a1 + 48);
    *(_OWORD *)((char *)a2 + 200) = v19;
    *(_OWORD *)((char *)a2 + 184) = v18;
    *(_OWORD *)((char *)a2 + 168) = v17;
    return 1;
  }
  ec_set_to_safe_point((uint64_t)a1, (uint64_t)a2 + 8);
  return 0;
}

double ec_set_to_safe_point(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return ec_GFp_simple_point_set_to_infinity(a1, a2);
  *(_QWORD *)&result = ec_GFp_simple_point_copy(a2, v2 + 8).n128_u64[0];
  return result;
}

uint64_t *ec_point_select(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  ec_felem_select(a1, a2, a3, a4, a5);
  ec_felem_select(a1, a2 + 9, a3, a4 + 9, a5 + 9);
  return ec_felem_select(a1, a2 + 18, a3, a4 + 18, a5 + 18);
}

uint64_t ec_get_x_coordinate_as_scalar(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  __int128 v5;
  uint64_t result;
  uint64_t v7;
  _OWORD v8[5];
  _OWORD v9[4];
  __int16 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = -21846;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v9[2] = v5;
  v9[3] = v5;
  v9[0] = v5;
  v9[1] = v5;
  v7 = 0xAAAAAAAAAAAAAAAALL;
  result = ec_get_x_coordinate_as_bytes(a1, (uint64_t)v9, &v7, 0x42uLL, a3);
  if ((_DWORD)result)
  {
    memset(v8, 0, sizeof(v8));
    bn_big_endian_to_words((unint64_t *)v8, *(int *)(a1 + 24) + 1, (uint64_t)v9, v7);
    bn_reduce_once(a2, (unint64_t *)v8, *((_QWORD *)v8 + *(int *)(a1 + 24)), *(unint64_t **)(a1 + 16), *(int *)(a1 + 24));
    return 1;
  }
  return result;
}

uint64_t ec_get_x_coordinate_as_bytes(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t a4, uint64_t a5)
{
  unsigned int v9;
  uint64_t v10;
  uint64_t result;
  __int128 v12;
  _OWORD v13[4];
  unint64_t v14;

  v9 = BN_num_bytes((const BIGNUM *)(a1 + 56));
  if (v9 >= 0x43)
    ec_get_x_coordinate_as_bytes_cold_1();
  v10 = v9;
  if (v9 <= a4)
  {
    v14 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v13[2] = v12;
    v13[3] = v12;
    v13[0] = v12;
    v13[1] = v12;
    result = (*(uint64_t (**)(uint64_t, uint64_t, _OWORD *, _QWORD))(*(_QWORD *)a1 + 24))(a1, a5, v13, 0);
    if ((_DWORD)result)
    {
      ec_felem_to_bytes(a1);
      *a3 = v10;
      return 1;
    }
  }
  else
  {
    ERR_put_error(15, 0, 100, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec.c", 1208);
    return 0;
  }
  return result;
}

boringssl_concrete_boringssl_psk_cache *boringssl_psk_cache_create_with_context(void *a1)
{
  boringssl_concrete_boringssl_psk_cache *v2;
  boringssl_concrete_boringssl_psk_cache *v3;
  OS_sec_array *list;

  v2 = objc_alloc_init(boringssl_concrete_boringssl_psk_cache);
  v3 = v2;
  if (v2)
  {
    list = v2->list;
    v2->list = 0;

    objc_storeStrong((id *)&v3->context, a1);
  }
  return v3;
}

void boringssl_psk_cache_add_psk(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v6 = a1;
  v3 = a2;
  if (v6 && v3)
  {
    if (!v6[1])
    {
      v4 = sec_array_create();
      v5 = (void *)v6[1];
      v6[1] = v4;

    }
    sec_array_append();
  }

}

id boringssl_psk_cache_lookup_psk(void *a1, void *a2, void *a3)
{
  _QWORD *v5;
  id v6;
  id v7;
  uint64_t v8;
  id WeakRetained;
  void *v10;
  _BYTE *v11;
  char v12;
  uint64_t v13;
  id v14;
  _BYTE *v15;
  _BOOL8 v16;
  uint64_t v17;
  id v18;
  void *v19;
  _BYTE *v20;
  char v21;
  uint64_t v22;
  id v23;
  _BYTE *v24;
  _BOOL4 v25;
  uint64_t v26;
  id v27;
  void *v28;
  _BYTE *v29;
  char v30;
  uint64_t v31;
  id v32;
  _BYTE *v33;
  _BOOL4 v34;
  id v35;
  void *v36;
  _BYTE *v37;
  char v38;
  uint64_t v39;
  id v40;
  _BYTE *v41;
  _BOOL4 v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  _BOOL4 v48;
  id v49;
  char v50;
  void *v51;
  NSObject *v52;
  uint64_t v53;
  char *v54;
  uint64_t v55;
  _BOOL4 v56;
  id v57;
  char v58;
  void *v59;
  NSObject *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  _BOOL4 v64;
  NSObject *v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  _BOOL4 v69;
  id v70;
  char v71;
  void *v72;
  id v73;
  char v74;
  void *v75;
  void *psk;
  NSObject *v77;
  void *v79;
  void *v80;
  _QWORD block[4];
  _QWORD *v82;
  id v83;
  id v84;
  _BYTE *v85;
  uint8_t v86[4];
  const char *v87;
  __int16 v88;
  int v89;
  __int16 v90;
  void *v91;
  __int16 v92;
  id v93;
  _BYTE buf[40];
  id v95;
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (!v5)
    goto LABEL_83;
  if (sec_array_get_count())
  {
    if (v5[3] && v5[4])
    {
      if (v7)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        *(_QWORD *)&buf[24] = __Block_byref_object_copy__2;
        *(_QWORD *)&buf[32] = __Block_byref_object_dispose__2;
        v95 = 0;
        v8 = v5[2];
        if (!v8)
          goto LABEL_33;
        WeakRetained = objc_loadWeakRetained((id *)(v8 + 16));
        if (WeakRetained)
        {
          v10 = WeakRetained;
          v11 = objc_loadWeakRetained((id *)(v5[2] + 16));
          v12 = v11[475];

          if ((v12 & 1) != 0)
            goto LABEL_114;
        }
        v13 = v5[2];
        if (v13)
        {
          v14 = objc_loadWeakRetained((id *)(v13 + 16));
          if (v14)
          {
            v15 = objc_loadWeakRetained((id *)(v5[2] + 16));
            v16 = (v15[475] & 1) == 0;

          }
          else
          {
            v16 = 1;
          }

          if (!v16)
            goto LABEL_114;
        }
        else
        {
LABEL_33:
          v16 = 1;
        }
        if (!g_boringssl_log)
        {
LABEL_114:
          v77 = v5[4];
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __boringssl_psk_cache_lookup_psk_block_invoke;
          block[3] = &unk_1E686F848;
          v82 = v5;
          v83 = v7;
          v84 = v6;
          v85 = buf;
          dispatch_sync(v77, block);
          v43 = *(id *)(*(_QWORD *)&buf[8] + 40);

          _Block_object_dispose(buf, 8);
          goto LABEL_130;
        }
        v60 = (id)g_boringssl_log;
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          goto LABEL_113;
        v61 = v5[2];
        if (v61)
        {
          v62 = (char *)objc_loadWeakRetained((id *)(v61 + 16));
          v16 = (_BOOL8)v62;
          v63 = v5[2];
          if (v62)
          {
            v64 = v63 != 0;
            if (v63)
            {
              v62 = (char *)objc_loadWeakRetained((id *)(v63 + 16));
              v63 = v5[2];
            }
            else
            {
              v62 = 0;
            }
            v72 = v62 + 391;
          }
          else
          {
            v64 = 0;
            v72 = &unk_1B50022E3;
          }
          v80 = v62;
          if (v63)
          {
            v70 = objc_loadWeakRetained((id *)(v63 + 16));
            v71 = 0;
          }
          else
          {
            v70 = 0;
            v71 = 1;
          }
        }
        else
        {
          v64 = 0;
          v70 = 0;
          v71 = 1;
          v72 = &unk_1B50022E3;
        }
        *(_DWORD *)v86 = 136446978;
        v87 = "boringssl_psk_cache_lookup_psk";
        v88 = 1024;
        v89 = 104;
        v90 = 2082;
        v91 = v72;
        v92 = 2048;
        v93 = v70;
        _os_log_impl(&dword_1B4F6D000, v60, OS_LOG_TYPE_INFO, "%{public}s(%d) %{public}s[%p] Invoking client PSK selection callback.", v86, 0x26u);
        if ((v71 & 1) != 0)
        {
          if (!v64)
            goto LABEL_111;
        }
        else
        {

          if (!v64)
          {
LABEL_111:
            if (v61)
LABEL_112:

LABEL_113:
            goto LABEL_114;
          }
        }

        if (!v61)
          goto LABEL_113;
        goto LABEL_112;
      }
      goto LABEL_83;
    }
    v17 = v5[2];
    if (v6)
    {
      if (v17)
      {
        v18 = objc_loadWeakRetained((id *)(v17 + 16));
        if (v18)
        {
          v19 = v18;
          v20 = objc_loadWeakRetained((id *)(v5[2] + 16));
          v21 = v20[475];

          if ((v21 & 1) != 0)
            goto LABEL_99;
        }
        v22 = v5[2];
        if (v22)
        {
          v23 = objc_loadWeakRetained((id *)(v22 + 16));
          if (v23)
          {
            v24 = objc_loadWeakRetained((id *)(v5[2] + 16));
            v25 = (v24[475] & 1) == 0;

          }
          else
          {
            v25 = 1;
          }

          if (!v25)
            goto LABEL_99;
        }
      }
      if (!g_boringssl_log)
        goto LABEL_99;
      v52 = (id)g_boringssl_log;
      if (!os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        goto LABEL_98;
      v53 = v5[2];
      if (v53)
      {
        v54 = (char *)objc_loadWeakRetained((id *)(v53 + 16));
        v55 = v5[2];
        v80 = v54;
        if (v54)
        {
          v56 = v55 != 0;
          if (v55)
          {
            v54 = (char *)objc_loadWeakRetained((id *)(v55 + 16));
            v55 = v5[2];
          }
          else
          {
            v54 = 0;
          }
          v59 = v54 + 391;
        }
        else
        {
          v56 = 0;
          v59 = &unk_1B50022E3;
        }
        v79 = v54;
        if (v55)
        {
          v57 = objc_loadWeakRetained((id *)(v55 + 16));
          v58 = 0;
        }
        else
        {
          v57 = 0;
          v58 = 1;
        }
      }
      else
      {
        v56 = 0;
        v57 = 0;
        v58 = 1;
        v59 = &unk_1B50022E3;
      }
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "boringssl_psk_cache_lookup_psk";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 124;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = v59;
      *(_WORD *)&buf[28] = 2048;
      *(_QWORD *)&buf[30] = v57;
      _os_log_impl(&dword_1B4F6D000, v52, OS_LOG_TYPE_INFO, "%{public}s(%d) %{public}s[%p] No PSK selection logic. Indexing cache using identity hint verbatim.", buf, 0x26u);
      if ((v58 & 1) != 0)
      {
        if (!v56)
          goto LABEL_96;
      }
      else
      {

        if (!v56)
        {
LABEL_96:
          if (v53)
LABEL_97:

LABEL_98:
LABEL_99:
          psk = boringssl_psk_cache_lookup_psk_inner(v5, v6);
LABEL_129:
          v43 = psk;
          goto LABEL_130;
        }
      }

      if (!v53)
        goto LABEL_98;
      goto LABEL_97;
    }
    if (v17)
    {
      v35 = objc_loadWeakRetained((id *)(v17 + 16));
      if (v35)
      {
        v36 = v35;
        v37 = objc_loadWeakRetained((id *)(v5[2] + 16));
        v38 = v37[475];

        if ((v38 & 1) != 0)
          goto LABEL_128;
      }
      v39 = v5[2];
      if (v39)
      {
        v40 = objc_loadWeakRetained((id *)(v39 + 16));
        if (v40)
        {
          v41 = objc_loadWeakRetained((id *)(v5[2] + 16));
          v42 = (v41[475] & 1) == 0;

        }
        else
        {
          v42 = 1;
        }

        if (!v42)
          goto LABEL_128;
      }
    }
    if (!g_boringssl_log)
    {
LABEL_128:
      psk = boringssl_psk_cache_copy_first_psk(v5);
      goto LABEL_129;
    }
    v65 = (id)g_boringssl_log;
    if (!os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      goto LABEL_127;
    v66 = v5[2];
    if (v66)
    {
      v67 = (char *)objc_loadWeakRetained((id *)(v66 + 16));
      v68 = v5[2];
      v80 = v67;
      if (v67)
      {
        v69 = v68 != 0;
        if (v68)
        {
          v67 = (char *)objc_loadWeakRetained((id *)(v68 + 16));
          v68 = v5[2];
        }
        else
        {
          v67 = 0;
        }
        v75 = v67 + 391;
      }
      else
      {
        v69 = 0;
        v75 = &unk_1B50022E3;
      }
      v79 = v67;
      if (v68)
      {
        v73 = objc_loadWeakRetained((id *)(v68 + 16));
        v74 = 0;
      }
      else
      {
        v73 = 0;
        v74 = 1;
      }
    }
    else
    {
      v69 = 0;
      v73 = 0;
      v74 = 1;
      v75 = &unk_1B50022E3;
    }
    *(_DWORD *)buf = 136446978;
    *(_QWORD *)&buf[4] = "boringssl_psk_cache_lookup_psk";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 118;
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = v75;
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = v73;
    _os_log_impl(&dword_1B4F6D000, v65, OS_LOG_TYPE_INFO, "%{public}s(%d) %{public}s[%p] No PSK hint or selection logic. Using first PSK in the cache.", buf, 0x26u);
    if ((v74 & 1) != 0)
    {
      if (!v69)
        goto LABEL_125;
    }
    else
    {

      if (!v69)
      {
LABEL_125:
        if (v66)
LABEL_126:

LABEL_127:
        goto LABEL_128;
      }
    }

    if (!v66)
      goto LABEL_127;
    goto LABEL_126;
  }
  v26 = v5[2];
  if (!v26)
    goto LABEL_25;
  v27 = objc_loadWeakRetained((id *)(v26 + 16));
  if (v27)
  {
    v28 = v27;
    v29 = objc_loadWeakRetained((id *)(v5[2] + 16));
    v30 = v29[475];

    if ((v30 & 1) != 0)
      goto LABEL_83;
  }
  v31 = v5[2];
  if (v31)
  {
    v32 = objc_loadWeakRetained((id *)(v31 + 16));
    if (v32)
    {
      v33 = objc_loadWeakRetained((id *)(v5[2] + 16));
      v34 = (v33[475] & 1) == 0;

    }
    else
    {
      v34 = 1;
    }

  }
  else
  {
LABEL_25:
    v34 = 1;
  }
  v43 = 0;
  if (v34 && g_boringssl_log)
  {
    v44 = (id)g_boringssl_log;
    if (!os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      goto LABEL_82;
    v45 = v5[2];
    if (v45)
    {
      v46 = (char *)objc_loadWeakRetained((id *)(v45 + 16));
      v47 = v5[2];
      v80 = v46;
      if (v46)
      {
        v48 = v47 != 0;
        if (v47)
        {
          v46 = (char *)objc_loadWeakRetained((id *)(v47 + 16));
          v47 = v5[2];
        }
        else
        {
          v46 = 0;
        }
        v51 = v46 + 391;
      }
      else
      {
        v48 = 0;
        v51 = &unk_1B50022E3;
      }
      v79 = v46;
      if (v47)
      {
        v49 = objc_loadWeakRetained((id *)(v47 + 16));
        v50 = 0;
      }
      else
      {
        v49 = 0;
        v50 = 1;
      }
    }
    else
    {
      v48 = 0;
      v49 = 0;
      v50 = 1;
      v51 = &unk_1B50022E3;
    }
    *(_DWORD *)buf = 136446978;
    *(_QWORD *)&buf[4] = "boringssl_psk_cache_lookup_psk";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 96;
    *(_WORD *)&buf[18] = 2082;
    *(_QWORD *)&buf[20] = v51;
    *(_WORD *)&buf[28] = 2048;
    *(_QWORD *)&buf[30] = v49;
    _os_log_impl(&dword_1B4F6D000, v44, OS_LOG_TYPE_INFO, "%{public}s(%d) %{public}s[%p] PSK cache is empty.", buf, 0x26u);
    if ((v50 & 1) != 0)
    {
      if (!v48)
        goto LABEL_80;
    }
    else
    {

      if (!v48)
      {
LABEL_80:
        if (v45)
LABEL_81:

LABEL_82:
LABEL_83:
        v43 = 0;
        goto LABEL_130;
      }
    }

    if (!v45)
      goto LABEL_82;
    goto LABEL_81;
  }
LABEL_130:

  return v43;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __boringssl_psk_cache_lookup_psk_block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = (_QWORD *)a1[4];
  v3 = a1[5];
  v4 = v2[3];
  v5 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __boringssl_psk_cache_lookup_psk_block_invoke_2;
  v8[3] = &unk_1E686F820;
  v6 = v2;
  v7 = a1[7];
  v9 = v6;
  v10 = v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v4 + 16))(v4, v3, v5, v8);

}

void __boringssl_psk_cache_lookup_psk_block_invoke_2(uint64_t a1, void *a2)
{
  char *v2;
  id v4;
  uint64_t v5;
  id WeakRetained;
  void *v7;
  _BYTE *v8;
  char v9;
  uint64_t v10;
  id v11;
  _BYTE *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 16));
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v8 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16));
      v9 = v8[475];

      if ((v9 & 1) != 0)
        goto LABEL_32;
    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v10)
  {
    v11 = objc_loadWeakRetained((id *)(v10 + 16));
    if (v11)
    {
      v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) + 16));
      v13 = (v12[475] & 1) == 0;

    }
    else
    {
      v13 = 1;
    }

    if (!(_DWORD)v13)
      goto LABEL_32;
  }
  else
  {
    v13 = 1;
  }
  if (g_boringssl_log)
  {
    v14 = (id)g_boringssl_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(v15 + 16);
      if (v16)
      {
        v13 = (uint64_t)objc_loadWeakRetained((id *)(v16 + 16));
        v15 = *(_QWORD *)(a1 + 32);
        if (v13)
        {
          v17 = *(_QWORD *)(v15 + 16);
          v18 = v17 != 0;
          if (v17)
          {
            v2 = (char *)objc_loadWeakRetained((id *)(v17 + 16));
            v15 = *(_QWORD *)(a1 + 32);
          }
          else
          {
            v2 = 0;
          }
          v19 = v2 + 391;
        }
        else
        {
          v18 = 0;
          v19 = &unk_1B50022E3;
        }
      }
      else
      {
        v18 = 0;
        v19 = &unk_1B50022E3;
      }
      v20 = *(_QWORD *)(v15 + 16);
      if (v20)
        v21 = objc_loadWeakRetained((id *)(v20 + 16));
      else
        v21 = 0;
      v27 = "boringssl_psk_cache_lookup_psk_block_invoke_2";
      v28 = 1024;
      v22 = "with";
      v29 = 108;
      v26 = 136447234;
      if (!v4)
        v22 = "without";
      v30 = 2082;
      v31 = v19;
      v32 = 2048;
      v33 = v21;
      v34 = 2082;
      v35 = v22;
      _os_log_impl(&dword_1B4F6D000, v14, OS_LOG_TYPE_INFO, "%{public}s(%d) %{public}s[%p] Returned from client PSK selection callback %{public}s PSK.", (uint8_t *)&v26, 0x30u);
      if (v20)

      if (v18)
      if (v16)

    }
  }
LABEL_32:
  v23 = boringssl_psk_cache_lookup_psk_inner(*(void **)(a1 + 32), v4);
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

}

void *boringssl_psk_cache_lookup_psk_inner(void *a1, void *a2)
{
  _QWORD *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;
  id WeakRetained;
  _BYTE *v11;
  _BOOL4 v12;
  uint64_t v13;
  id v14;
  _BYTE *v15;
  _BOOL8 v16;
  NSObject *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _BOOL4 v21;
  id v22;
  char v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__2;
    v31 = __Block_byref_object_dispose__2;
    v32 = 0;
    v26 = v4;
    sec_array_apply();
    v6 = (void *)v28[5];
    if (v6)
    {
      v7 = v6;
LABEL_5:

      _Block_object_dispose(&v27, 8);
      goto LABEL_6;
    }
    v9 = v3[2];
    if (!v9)
      goto LABEL_13;
    WeakRetained = objc_loadWeakRetained((id *)(v9 + 16));
    if (WeakRetained)
    {
      v11 = objc_loadWeakRetained((id *)(v3[2] + 16));
      v12 = (v11[475] & 1) == 0;

      if (!v12)
        goto LABEL_5;
    }
    v13 = v3[2];
    if (v13)
    {
      v14 = objc_loadWeakRetained((id *)(v13 + 16));
      if (v14)
      {
        v15 = objc_loadWeakRetained((id *)(v3[2] + 16));
        v16 = (v15[475] & 1) == 0;

      }
      else
      {
        v16 = 1;
      }

    }
    else
    {
LABEL_13:
      v16 = 1;
    }
    if (v16 && g_boringssl_log)
    {
      v17 = (id)g_boringssl_log;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = v3[2];
        if (v18)
        {
          v19 = (char *)objc_loadWeakRetained((id *)(v18 + 16));
          v16 = (_BOOL8)v19;
          v20 = v3[2];
          if (v19)
          {
            v21 = v20 != 0;
            if (v20)
            {
              v19 = (char *)objc_loadWeakRetained((id *)(v20 + 16));
              v20 = v3[2];
            }
            else
            {
              v19 = 0;
            }
            v24 = v19 + 391;
          }
          else
          {
            v21 = 0;
            v24 = &unk_1B50022E3;
          }
          v25 = v19;
          if (v20)
          {
            v22 = objc_loadWeakRetained((id *)(v20 + 16));
            v23 = 0;
          }
          else
          {
            v22 = 0;
            v23 = 1;
          }
        }
        else
        {
          v21 = 0;
          v22 = 0;
          v23 = 1;
          v24 = &unk_1B50022E3;
        }
        *(_DWORD *)buf = 136446978;
        v34 = "boringssl_psk_cache_lookup_psk_inner";
        v35 = 1024;
        v36 = 81;
        v37 = 2082;
        v38 = v24;
        v39 = 2048;
        v40 = v22;
        _os_log_impl(&dword_1B4F6D000, v17, OS_LOG_TYPE_INFO, "%{public}s(%d) %{public}s[%p] PSK lookup using identity hint did not find a match.", buf, 0x26u);
        if ((v23 & 1) == 0)

        if (v21)
        if (v18)

      }
    }
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

void sub_1B4FE45DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id boringssl_psk_cache_copy_first_psk(void *a1)
{
  id v1;
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v1 = a1;
  if (v1)
  {
    v4 = 0;
    v5 = &v4;
    v6 = 0x3032000000;
    v7 = __Block_byref_object_copy__2;
    v8 = __Block_byref_object_dispose__2;
    v9 = 0;
    sec_array_apply();
    v2 = (id)v5[5];
    _Block_object_dispose(&v4, 8);

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1B4FE46C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __boringssl_psk_cache_copy_first_psk_block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
  return 0;
}

void boringssl_psk_cache_set_selection_block_and_queue(void *a1, uint64_t a2, void *a3)
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v6 = a3;
  if (a1 && a2 && v6)
  {
    v10 = v6;
    v7 = a1;
    v8 = MEMORY[0x1B5E45624](a2);
    v9 = (void *)*((_QWORD *)v7 + 3);
    *((_QWORD *)v7 + 3) = v8;

    objc_storeStrong((id *)v7 + 4, a3);
    v6 = v10;
  }

}

id boringssl_psk_cache_copy_psk_object_array(void *a1)
{
  id v1;
  id v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v1 = a1;
  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__2;
  v8 = __Block_byref_object_dispose__2;
  v9 = (id)0xAAAAAAAAAAAAAAAALL;
  v9 = xpc_array_create(0, 0);
  sec_array_apply();
  v2 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v2;
}

void sub_1B4FE484C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __boringssl_psk_cache_copy_psk_object_array_block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  xpc_object_t v4;

  v4 = boringssl_psk_copy_xpc_object(a3);
  xpc_array_set_value(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), 0xFFFFFFFFFFFFFFFFLL, v4);

  return 1;
}

void boringssl_psk_cache_clear_context(uint64_t a1)
{
  void *v1;

  if (a1)
  {
    v1 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

  }
}

BOOL __boringssl_psk_cache_lookup_psk_inner_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD *v5;
  _BOOL4 v6;

  v5 = a3;
  v6 = boringssl_psk_matches_identity_hint(v5, *(void **)(a1 + 32));
  if (v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);

  return !v6;
}

const EVP_CIPHER *EVP_des_ede3_cbc(void)
{
  return (const EVP_CIPHER *)&des_ede3_cbc;
}

uint64_t des_cbc_ede3_init_key(uint64_t a1, void *key, void *iv, int a4)
{
  CCCryptorStatus v5;
  uint64_t result;
  CCCryptorRef cryptorRef;

  cryptorRef = 0;
  v5 = CCCryptorCreate(a4 == 0, 2u, 0, key, *(unsigned int *)(a1 + 24), iv, &cryptorRef);
  result = 0;
  if (!v5)
  {
    *(_QWORD *)(a1 + 8) = cryptorRef;
    return 1;
  }
  return result;
}

BOOL des_ede3_cbc_cipher(uint64_t a1, void *a2, const void *a3, size_t a4)
{
  _CCCryptor *v4;
  BOOL v8;
  size_t dataOutMoved;

  v4 = *(_CCCryptor **)(a1 + 8);
  if (v4
    && !CCCryptorReset(*(CCCryptorRef *)(a1 + 8), (const void *)(a1 + 52))
    && ((dataOutMoved = 0, !CCCryptorUpdate(v4, a3, a4, a2, a4, &dataOutMoved)) ? (v8 = dataOutMoved == a4) : (v8 = 0),
        v8))
  {
    return CCCryptorGetIV() == 0;
  }
  else
  {
    return 0;
  }
}

_CCCryptor *des_cleanup(uint64_t a1)
{
  _CCCryptor *result;

  result = *(_CCCryptor **)(a1 + 8);
  if (result)
  {
    result = (_CCCryptor *)CCCryptorRelease(result);
    *(_QWORD *)(a1 + 8) = 0;
  }
  return result;
}

uint64_t pkey_ed25519_copy()
{
  return 1;
}

uint64_t pkey_ed25519_keygen(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *v4;
  __int128 v5;
  uint64_t v6;
  _OWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = OPENSSL_malloc(0x41uLL);
  if (!v3)
    return 0;
  v4 = v3;
  if (!EVP_PKEY_set_type(a2, 949))
  {
    OPENSSL_free(v4);
    return 0;
  }
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = v5;
  v8[1] = v5;
  ED25519_keypair((uint64_t)v8, v4);
  v6 = 1;
  *((_BYTE *)v4 + 64) = 1;
  OPENSSL_free(*(_QWORD **)(a2 + 8));
  *(_QWORD *)(a2 + 8) = v4;
  return v6;
}

uint64_t pkey_ed25519_sign_message(uint64_t a1, _BYTE *a2, _QWORD *a3, const void *a4, size_t a5)
{
  unsigned __int8 *v5;
  int v7;
  int v8;
  uint64_t result;

  v5 = *(unsigned __int8 **)(*(_QWORD *)(a1 + 16) + 8);
  if (!v5[64])
  {
    v7 = 130;
    v8 = 52;
    goto LABEL_6;
  }
  if (!a2)
    goto LABEL_8;
  if (*a3 <= 0x3FuLL)
  {
    v7 = 100;
    v8 = 62;
LABEL_6:
    ERR_put_error(6, 0, v7, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_ed25519.c", v8);
    return 0;
  }
  result = ED25519_sign(a2, a4, a5, v5);
  if ((_DWORD)result)
  {
LABEL_8:
    *a3 = 64;
    return 1;
  }
  return result;
}

uint64_t pkey_ed25519_verify_message(uint64_t a1, unsigned __int8 *a2, uint64_t a3, const void *a4, size_t a5)
{
  if (a3 == 64
    && ED25519_verify(a4, a5, a2, (int64x2_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 16) + 8) + 32)))
  {
    return 1;
  }
  ERR_put_error(6, 0, 131, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/evp/p_ed25519.c", 80);
  return 0;
}

int OBJ_obj2nid(const ASN1_OBJECT *o)
{
  const ASN1_OBJECT *v1;
  uint64_t v2;
  uint64_t v3;
  char **v4;

  if (o)
  {
    v1 = o;
    LODWORD(o) = o->nid;
    if (!(_DWORD)o)
    {
      CRYPTO_MUTEX_lock_read(&global_added_lock);
      if (global_added_by_data)
      {
        v2 = OPENSSL_lh_retrieve((_QWORD *)global_added_by_data, (uint64_t)v1, (uint64_t (*)(_QWORD, uint64_t))lh_ASN1_OBJECT_call_hash_func, (unsigned int (*)(_QWORD, _QWORD, uint64_t))lh_ASN1_OBJECT_call_cmp_func);
        if (v2)
        {
          v3 = v2;
          CRYPTO_MUTEX_unlock_read(&global_added_lock);
          v4 = (char **)(v3 + 16);
LABEL_8:
          LODWORD(o) = *(_DWORD *)v4;
          return (int)o;
        }
      }
      CRYPTO_MUTEX_unlock_read(&global_added_lock);
      o = (const ASN1_OBJECT *)bsearch(v1, &kNIDsInOIDOrder, 0x371uLL, 2uLL, (int (__cdecl *)(const void *, const void *))obj_cmp);
      if (o)
      {
        v4 = &kObjects[5 * LOWORD(o->sn) + 2];
        goto LABEL_8;
      }
    }
  }
  return (int)o;
}

uint64_t obj_cmp(uint64_t a1, unsigned __int16 *a2)
{
  size_t v2;
  int v3;

  v2 = *(int *)(a1 + 20);
  v3 = HIDWORD(kObjects[5 * *a2 + 2]);
  if ((int)v2 < v3)
    return 0xFFFFFFFFLL;
  if ((int)v2 > v3)
    return 1;
  if ((_DWORD)v2)
    return memcmp(*(const void **)(a1 + 24), kObjects[5 * *a2 + 3], v2);
  return 0;
}

uint64_t lh_ASN1_OBJECT_call_hash_func(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  return a1(a2);
}

uint64_t lh_ASN1_OBJECT_call_cmp_func(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a2, a3);
}

uint64_t boringssl_context_set_internal_error(uint64_t result, int a2)
{
  uint64_t v2;

  if (result && *(_DWORD *)result == -1252936367)
  {
    v2 = *(_QWORD *)(result + 8);
    if (v2)
      *(_DWORD *)(v2 + 296) = a2;
  }
  return result;
}

uint64_t boringssl_context_get_peer_hostname(uint64_t a1, const char **a2, size_t *a3)
{
  uint64_t result;
  uint64_t v7;
  const SSL *v8;
  const char *servername;
  const char *v10;
  size_t v11;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 != -1252936367)
    return 0xFFFFFFFFLL;
  result = 0xFFFFFFFFLL;
  if (a3)
  {
    if (a2)
    {
      v7 = *(_QWORD *)(a1 + 8);
      if (v7)
      {
        v8 = *(const SSL **)(v7 + 400);
        if (v8)
        {
          servername = SSL_get_servername(v8, 0);
          if (servername)
          {
            v10 = servername;
            v11 = strnlen(servername, 0xFFFFuLL);
            result = 0;
            *a3 = v11;
            *a2 = v10;
            return result;
          }
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t boringssl_context_set_psk_identity_hint(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 != -1252936367)
    return 0xFFFFFFFFLL;
  result = 0xFFFFFFFFLL;
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4)
    {
      if (*(_QWORD *)(a2 + 8) && *(_QWORD *)a2)
      {
        v5 = *(_QWORD *)(v4 + 400);
        if (v5)
        {
          if (SSL_use_psk_identity_hint(v5, *(char **)(a2 + 8)) == 1)
            return 0;
          else
            return 0xFFFFFFFFLL;
        }
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

uint64_t boringssl_context_set_key_exchange_groups_from_list(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  size_t v11;
  uint64_t v12;
  char *curve_name;
  const char *v14;
  uint64_t v15;
  size_t v16;
  size_t v17;
  char *v18;
  BOOL v19;
  id WeakRetained;
  void *v21;
  _BYTE *v22;
  char v23;
  id v24;
  _BYTE *v25;
  _BOOL4 v26;
  NSObject *v27;
  uint64_t v28;
  char v29[1024];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  if (!a1 || *(_DWORD *)a1 != -1252936367)
    return 0xFFFFFFFFLL;
  result = 0xFFFFFFFFLL;
  if (a3)
  {
    if (a2)
    {
      v7 = *(_QWORD *)(a1 + 8);
      if (v7)
      {
        v8 = *(_QWORD *)(v7 + 400);
        if (v8)
        {
          bzero(v29, 0x400uLL);
          v9 = 0;
          v10 = 0;
          v11 = 0;
          v12 = a3 - 1;
          while (1)
          {
            while (1)
            {
              curve_name = SSL_get_curve_name(*(unsigned __int16 *)(a2 + 2 * v9));
              if (curve_name)
                break;
              if (a3 == ++v9)
              {
                if ((v10 & 1) != 0)
                {
                  v18 = v29;
                  goto LABEL_25;
                }
                if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
                  boringssl_context_set_key_exchange_groups_from_list_cold_2();
LABEL_24:
                v18 = 0;
                goto LABEL_25;
              }
            }
            v14 = curve_name;
            v28 = v8;
            if ((v10 & 1) != 0)
            {
              if (v11 + 1 > 0x3FF)
                goto LABEL_24;
              v15 = v12;
              v29[v11++] = 58;
            }
            else
            {
              v15 = v12;
            }
            v16 = strlen(curve_name);
            v17 = v16 + v11;
            if (v16 + v11 >= 0x400)
              break;
            v18 = v29;
            strncpy(&v29[v11], v14, v16);
            v10 = 1;
            v11 = v17;
            v12 = v15;
            v19 = v15 == v9++;
            v8 = v28;
            if (v19)
              goto LABEL_25;
          }
          v18 = 0;
          v8 = v28;
LABEL_25:
          if (SSL_set1_curves_list(v8, v18))
            return 0;
          WeakRetained = objc_loadWeakRetained((id *)(v7 + 16));
          if (WeakRetained)
          {
            v21 = WeakRetained;
            v22 = objc_loadWeakRetained((id *)(v7 + 16));
            v23 = v22[475];

            if ((v23 & 1) != 0)
              return 0xFFFFFFFFLL;
          }
          v24 = objc_loadWeakRetained((id *)(v7 + 16));
          if (v24)
          {
            v25 = objc_loadWeakRetained((id *)(v7 + 16));
            v26 = (v25[475] & 1) == 0;

          }
          else
          {
            v26 = 1;
          }

          result = 0xFFFFFFFFLL;
          if (v26)
          {
            if (g_boringssl_log)
            {
              v27 = (id)g_boringssl_log;
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
                boringssl_context_set_key_exchange_groups_from_list_cold_1(v7 + 16, v27);

              return 0xFFFFFFFFLL;
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t boringssl_context_set_key_exchange_groups(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  size_t count;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  void *v12;

  v3 = a2;
  v4 = v3;
  if (!a1 || *(_DWORD *)a1 != -1252936367)
    goto LABEL_8;
  v5 = 0xFFFFFFFFLL;
  if (!v3 || !*(_QWORD *)(a1 + 8))
    goto LABEL_9;
  count = xpc_array_get_count(v3);
  v7 = malloc_type_malloc(2 * count, 0x1000040BDFB0063uLL);
  if (!v7)
  {
LABEL_8:
    v5 = 0xFFFFFFFFLL;
    goto LABEL_9;
  }
  v8 = v7;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __boringssl_context_set_key_exchange_groups_block_invoke;
  v10[3] = &unk_1E6878F88;
  v11 = v4;
  v12 = v8;
  xpc_array_apply(v11, v10);
  if (count)
    v5 = boringssl_context_set_key_exchange_groups_from_list(a1, (uint64_t)v8, count);
  else
    v5 = 0xFFFFFFFFLL;
  free(v8);

LABEL_9:
  return v5;
}

uint64_t __boringssl_context_set_key_exchange_groups_block_invoke(uint64_t a1, size_t a2)
{
  *(_WORD *)(*(_QWORD *)(a1 + 40) + 2 * a2) = xpc_array_get_uint64(*(xpc_object_t *)(a1 + 32), a2);
  return 1;
}

uint64_t boringssl_session_set_quic_early_data_context(uint64_t a1, const char *a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 != -1252936367)
    return 0xFFFFFFFFLL;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = *(_QWORD *)(v3 + 400);
  if (!v4)
    return 0xFFFFFFFFLL;
  if (a2 == 0 || a3 == 0)
  {
    a2 = "Default QUIC Early Data Context";
    a3 = 32;
  }
  if (SSL_set_quic_early_data_context(v4, a2, a3) == 1)
    return 0;
  else
    return 0xFFFFFFFFLL;
}

uint64_t boringssl_session_get_quic_early_data_context(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a1 && *(_DWORD *)a1 == -1252936367 && (v2 = *(_QWORD *)(a1 + 8)) != 0 && (v3 = *(_QWORD *)(v2 + 400)) != 0)
    return SSL_get_quic_early_data_context(v3, a2);
  else
    return 0;
}

uint64_t boringssl_context_zlib_compress_data(const SSL *a1, uint64_t a2, uint64_t a3, uLong a4)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[6];

  if (!a1)
    return 0;
  v7 = SSL_get_ex_data(a1, 0);
  if (!v7 || *(_DWORD *)v7 != -1252936367)
    return 0;
  v8 = 0;
  if (a2)
  {
    v9 = v7[1];
    if (v9)
    {
      *(_BYTE *)(v9 + 559) |= 0x40u;
      *(_WORD *)(v9 + 336) = 1;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __boringssl_context_zlib_compress_data_block_invoke;
      v11[3] = &__block_descriptor_48_e12_B24__0r_8Q16lu40l8;
      v11[4] = a2;
      v11[5] = v9;
      return boringssl_helper_zlib_compress_data((void *)v9, a3, a4, v11);
    }
  }
  return v8;
}

uint64_t boringssl_context_enable_keylog(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    if (*(_DWORD *)result == -1252936367)
    {
      v1 = *(_QWORD *)(result + 8);
      if (v1)
      {
        result = *(_QWORD *)(v1 + 408);
        if (result)
          return SSL_CTX_set_keylog_callback(result, (uint64_t)boringssl_context_keylog_handler);
      }
    }
  }
  return result;
}

#error "1B4FE550C: call analysis failed (funcsize=63)"

_DWORD *boringssl_context_set_raw_public_key_certificate(_DWORD *result, CFArrayRef theArray, int a3)
{
  _DWORD *v3;
  uint64_t v5;
  const __CFData *ValueAtIndex;
  unsigned int v8;
  const void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  if (result)
  {
    v3 = result;
    if (*result != -1252936367)
      return 0;
    result = 0;
    if (!theArray)
      return result;
    v5 = *((_QWORD *)v3 + 1);
    if (!v5)
      return result;
    if (CFArrayGetCount(theArray) < 1)
      return 0;
    ValueAtIndex = (const __CFData *)CFArrayGetValueAtIndex(theArray, 0);
    result = (_DWORD *)CFDataGetLength(ValueAtIndex);
    if (result)
    {
      v8 = result;
      result = CFDataGetBytePtr(ValueAtIndex);
      if (result)
      {
        v9 = result;
        v10 = *(_QWORD *)(v5 + 400);
        if (v10)
        {
          if (a3)
            v11 = SSL_use_server_raw_public_key_certificate(v10, v9, v8);
          else
            v11 = SSL_use_client_raw_public_key_certificate(v10, v9, v8);
        }
        else
        {
          v12 = *(_QWORD *)(v5 + 408);
          if (a3)
            v11 = SSL_CTX_use_server_raw_public_key_certificate(v12, v9, v8);
          else
            v11 = SSL_CTX_use_client_raw_public_key_certificate(v12, v9, v8);
        }
        return (_DWORD *)(v11 == 1);
      }
    }
  }
  return result;
}

uint64_t boringssl_context_set_experiment_identifier(uint64_t result, char *__s1)
{
  uint64_t v2;
  void *v4;

  if (result)
  {
    if (*(_DWORD *)result == -1252936367 && (v2 = *(_QWORD *)(result + 8)) != 0)
    {
      v4 = *(void **)(v2 + 96);
      if (v4)
      {
        free(v4);
        *(_QWORD *)(v2 + 96) = 0;
      }
      *(_QWORD *)(v2 + 96) = strdup(__s1);
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *boringssl_context_copy_peer_sct_list_from_extension(void *a1, unsigned __int16 *a2, uint64_t a3)
{
  uint64_t v3;
  id *v6;
  const __CFAllocator *v7;
  CFMutableArrayRef Mutable;
  const __CFArray *v9;
  unint64_t v10;
  const UInt8 *v11;
  const UInt8 *v12;
  unsigned int v13;
  CFIndex v14;
  id v15;
  void *v16;
  unsigned __int8 *v17;
  id v18;
  _BYTE *v19;
  CFDataRef v20;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  _BYTE *v29;
  char v30;
  _BYTE *v31;
  uint64_t v32;
  id WeakRetained;
  void *v34;
  _BYTE *v35;
  char v36;
  id v37;
  _BYTE *v38;
  uint64_t v39;
  id v40;
  void *v41;
  _BYTE *v42;
  char v43;
  id v44;
  _BYTE *v45;
  NSObject *v46;
  int v47;
  NSObject *v48;
  _BOOL4 v49;
  void *v50;
  _BOOL4 v52;
  id v53;
  void *v54;
  _BOOL4 v55;
  id v56;
  void *v57;
  id v58;
  char *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  uint8_t buf[4];
  const char *v64;
  __int16 v65;
  int v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  id v70;
  __int16 v71;
  int v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (Mutable)
  {
    v9 = Mutable;
    v10 = a3 - 2;
    if (a3 == 2)
    {
LABEL_37:
      if (!CFArrayGetCount(v9))
        goto LABEL_72;
      goto LABEL_74;
    }
    v11 = (const UInt8 *)(a2 + 1);
    while (1)
    {
      v13 = *(unsigned __int16 *)v11;
      v12 = v11 + 2;
      v14 = __rev16(v13);
      if (v10 < v14 + 2)
      {
        if (v6)
        {
          WeakRetained = objc_loadWeakRetained(v6 + 2);
          if (WeakRetained)
          {
            v34 = WeakRetained;
            v35 = objc_loadWeakRetained(v6 + 2);
            v36 = v35[475];

            if ((v36 & 1) != 0)
              goto LABEL_72;
          }
          v37 = objc_loadWeakRetained(v6 + 2);
          if (v37)
          {
            v38 = objc_loadWeakRetained(v6 + 2);
            v39 = (v38[475] & 1) == 0;

          }
          else
          {
            v39 = 1;
          }

        }
        else
        {
          v39 = 1;
        }
        if ((_DWORD)v39 && g_boringssl_log)
        {
          v48 = (id)g_boringssl_log;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
          {
            if (v6)
            {
              v39 = (uint64_t)objc_loadWeakRetained(v6 + 2);
              v55 = v39 != 0;
              if (v39)
              {
                v3 = (uint64_t)objc_loadWeakRetained(v6 + 2);
                v57 = (void *)(v3 + 391);
              }
              else
              {
                v57 = &unk_1B50022E3;
              }
              v56 = objc_loadWeakRetained(v6 + 2);
            }
            else
            {
              v55 = 0;
              v56 = 0;
              v57 = &unk_1B50022E3;
            }
            *(_DWORD *)buf = 136446978;
            v64 = "boringssl_context_copy_peer_sct_list_from_extension";
            v65 = 1024;
            v66 = 972;
            v67 = 2082;
            v68 = v57;
            v69 = 2048;
            v70 = v56;
            _os_log_error_impl(&dword_1B4F6D000, v48, OS_LOG_TYPE_ERROR, "%{public}s(%d) %{public}s[%p] Received incorrectly encoded SerializedSCT list", buf, 0x26u);
            if (v6)

            if (v55)
            if (v6)
LABEL_107:

          }
LABEL_71:

        }
LABEL_72:
        CFRelease(v9);
LABEL_73:
        v9 = 0;
        goto LABEL_74;
      }
      if (!v6)
        break;
      v15 = objc_loadWeakRetained(v6 + 2);
      if (v15)
      {
        v16 = v15;
        v17 = (unsigned __int8 *)objc_loadWeakRetained(v6 + 2);
        v3 = v17[475];

        if ((v3 & 1) != 0)
        {
          v20 = CFDataCreate(v7, v12, v14);
          if (!v20)
            goto LABEL_46;
          goto LABEL_19;
        }
      }
      v18 = objc_loadWeakRetained(v6 + 2);
      if (v18)
      {
        v19 = objc_loadWeakRetained(v6 + 2);
        v3 = (v19[475] & 1) == 0;

      }
      else
      {
        v3 = 1;
      }

      if ((_DWORD)v3)
        goto LABEL_15;
LABEL_18:
      v20 = CFDataCreate(v7, v12, v14);
      if (!v20)
      {
        if (!v6)
        {
          v47 = 0;
          v39 = 1;
          goto LABEL_60;
        }
LABEL_46:
        v40 = objc_loadWeakRetained(v6 + 2);
        if (!v40
          || (v41 = v40,
              v42 = objc_loadWeakRetained(v6 + 2),
              v43 = v42[475],
              v42,
              v41,
              (v43 & 1) == 0))
        {
          v44 = objc_loadWeakRetained(v6 + 2);
          if (v44)
          {
            v45 = objc_loadWeakRetained(v6 + 2);
            v39 = (v45[475] & 1) == 0;

          }
          else
          {
            v39 = 1;
          }

          v47 = 1;
LABEL_60:
          if ((_DWORD)v39 && g_boringssl_log)
          {
            v48 = (id)g_boringssl_log;
            if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
            {
              if (v47)
              {
                v39 = (uint64_t)objc_loadWeakRetained(v6 + 2);
                v49 = v39 != 0;
                if (v39)
                {
                  v3 = (uint64_t)objc_loadWeakRetained(v6 + 2);
                  v50 = (void *)(v3 + 391);
                }
                else
                {
                  v50 = &unk_1B50022E3;
                }
                v58 = objc_loadWeakRetained(v6 + 2);
              }
              else
              {
                v49 = 0;
                v58 = 0;
                v50 = &unk_1B50022E3;
              }
              *(_DWORD *)buf = 136446978;
              v64 = "boringssl_context_copy_peer_sct_list_from_extension";
              v65 = 1024;
              v66 = 981;
              v67 = 2082;
              v68 = v50;
              v69 = 2048;
              v70 = v58;
              _os_log_error_impl(&dword_1B4F6D000, v48, OS_LOG_TYPE_ERROR, "%{public}s(%d) %{public}s[%p] CFDataCreate failed", buf, 0x26u);
              if (v47)

              if (v49)
              if (v47)
                goto LABEL_107;
            }
            goto LABEL_71;
          }
        }
        goto LABEL_72;
      }
LABEL_19:
      CFArrayAppendValue(v9, v20);
      CFRelease(v20);
      v11 = &v12[v14];
      v10 -= v14 + 2;
      if (!v10)
        goto LABEL_37;
    }
    v3 = 1;
LABEL_15:
    if (g_boringssl_log)
    {
      v21 = (id)g_boringssl_log;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        if (v6)
        {
          v24 = objc_loadWeakRetained(v6 + 2);
          v60 = v24 != 0;
          v25 = &unk_1B50022E3;
          v62 = v24;
          if (v24)
          {
            v59 = (char *)objc_loadWeakRetained(v6 + 2);
            v25 = v59 + 391;
          }
          v26 = objc_loadWeakRetained(v6 + 2);
          v23 = v25;
          v61 = v26;
          v22 = v26;
          v3 = v60;
        }
        else
        {
          v3 = 0;
          v22 = 0;
          v23 = &unk_1B50022E3;
        }
        *(_DWORD *)buf = 136447234;
        v64 = "boringssl_context_copy_peer_sct_list_from_extension";
        v65 = 1024;
        v66 = 978;
        v67 = 2082;
        v68 = v23;
        v69 = 2048;
        v70 = v22;
        v71 = 1024;
        v72 = v14;
        _os_log_debug_impl(&dword_1B4F6D000, v21, OS_LOG_TYPE_DEBUG, "%{public}s(%d) %{public}s[%p] SerializedSCT length %d", buf, 0x2Cu);
        if (v6)

        if ((_DWORD)v3)
        if (v6)

      }
    }
    goto LABEL_18;
  }
  if (v6)
  {
    v27 = objc_loadWeakRetained(v6 + 2);
    if (v27)
    {
      v28 = v27;
      v29 = objc_loadWeakRetained(v6 + 2);
      v30 = v29[475];

      if ((v30 & 1) != 0)
        goto LABEL_73;
    }
    a2 = (unsigned __int16 *)objc_loadWeakRetained(v6 + 2);
    if (a2)
    {
      v31 = objc_loadWeakRetained(v6 + 2);
      v32 = (v31[475] & 1) == 0;

    }
    else
    {
      v32 = 1;
    }

  }
  else
  {
    v32 = 1;
  }
  v9 = 0;
  if ((_DWORD)v32 && g_boringssl_log)
  {
    v46 = (id)g_boringssl_log;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      if (v6)
      {
        a2 = (unsigned __int16 *)objc_loadWeakRetained(v6 + 2);
        v52 = a2 != 0;
        if (a2)
        {
          v32 = (uint64_t)objc_loadWeakRetained(v6 + 2);
          v54 = (void *)(v32 + 391);
        }
        else
        {
          v54 = &unk_1B50022E3;
        }
        v53 = objc_loadWeakRetained(v6 + 2);
      }
      else
      {
        v52 = 0;
        v53 = 0;
        v54 = &unk_1B50022E3;
      }
      *(_DWORD *)buf = 136446978;
      v64 = "boringssl_context_copy_peer_sct_list_from_extension";
      v65 = 1024;
      v66 = 961;
      v67 = 2082;
      v68 = v54;
      v69 = 2048;
      v70 = v53;
      _os_log_error_impl(&dword_1B4F6D000, v46, OS_LOG_TYPE_ERROR, "%{public}s(%d) %{public}s[%p] CFArrayCreateMutable failed", buf, 0x26u);
      if (v6)

      if (v52)
      if (v6)

    }
    goto LABEL_73;
  }
LABEL_74:

  return v9;
}

uint64_t boringssl_context_select_alpn_callback(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  uint64_t v6;
  void *v9;

  *a3 = 0;
  if (a6)
  {
    if (*(_DWORD *)a6 == -1252936367)
    {
      v6 = *(_QWORD *)(a6 + 8);
      if (v6)
      {
        boringssl_helper_create_protocol_list_from_encoded_list(a4, a5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          boringssl_helper_find_first_overlapping_protocol(*(void **)(v6 + 64), v9, a2, a3);

      }
    }
  }
  return 0;
}

uint64_t boringssl_context_set_alpn_data(uint64_t a1, size_t a2, uint64_t a3)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v7;
  void *v8;
  void *v9;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 == -1252936367)
  {
    v4 = *(_QWORD *)(a1 + 8);
    v5 = !v4 || a3 == 0;
    if (!v5 && a2 != 0)
    {
      boringssl_helper_create_protocol_list_from_encoded_list(a3, a2);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(void **)(v4 + 64);
      *(_QWORD *)(v4 + 64) = v7;

      v9 = *(void **)(v4 + 64);
      if (v9)
        return (boringssl_context_set_alpn_protocol_list(a1, v9, 0) - 1);
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t boringssl_context_set_allow_unknown_alpn_protos(uint64_t a1, int a2)
{
  uint64_t v2;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 != -1252936367)
    return 0xFFFFFFFFLL;
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2 || !*(_QWORD *)(v2 + 400))
    return 0xFFFFFFFFLL;
  SSL_CTX_set_allow_unknown_alpn_protos(*(_QWORD *)(v2 + 408), a2);
  return 0;
}

uint64_t boringssl_context_set_client_auth(uint64_t a1, int a2)
{
  int v2;

  if (!a1 || *(_DWORD *)a1 != -1252936367 || !*(_QWORD *)(a1 + 8))
    return 0xFFFFFFFFLL;
  if (a2)
    v2 = 3;
  else
    v2 = 0;
  return boringssl_context_set_verify_mode(a1, v2);
}

uint64_t boringssl_context_set_signed_cert_timestamp_list(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  size_t size;
  void *buffer_from_dispatch_data;
  void *v9;
  uint64_t v10;
  id *v11;
  id v12;
  void *v13;
  _BYTE *v14;
  char v15;
  id v16;
  _BYTE *v17;
  _BOOL4 v18;
  id *v19;
  id WeakRetained;
  void *v21;
  _BYTE *v22;
  char v23;
  id v24;
  _BYTE *v25;
  _BOOL4 v26;
  NSObject *v27;

  v3 = a2;
  v4 = v3;
  if (!a1 || *(_DWORD *)a1 != -1252936367)
    goto LABEL_29;
  v5 = 0;
  if (!v3)
    goto LABEL_30;
  v6 = *(_QWORD *)(a1 + 8);
  if (!v6)
    goto LABEL_30;
  size = dispatch_data_get_size(v3);
  buffer_from_dispatch_data = boringssl_helper_create_buffer_from_dispatch_data(v4);
  if (buffer_from_dispatch_data)
  {
    v9 = buffer_from_dispatch_data;
    v10 = *(_QWORD *)(v6 + 400);
    if (v10)
    {
      if (SSL_set_signed_cert_timestamp_list(v10, (uint64_t)v9, size))
      {
        v5 = 1;
        goto LABEL_30;
      }
      v19 = (id *)(v6 + 16);
      WeakRetained = objc_loadWeakRetained((id *)(v6 + 16));
      if (!WeakRetained
        || (v21 = WeakRetained,
            v22 = objc_loadWeakRetained(v19),
            v23 = v22[475],
            v22,
            v21,
            (v23 & 1) == 0))
      {
        v24 = objc_loadWeakRetained(v19);
        if (v24)
        {
          v25 = objc_loadWeakRetained(v19);
          v26 = (v25[475] & 1) == 0;

        }
        else
        {
          v26 = 1;
        }

        v5 = 0;
        if (v26 && g_boringssl_log)
        {
          v27 = (id)g_boringssl_log;
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            boringssl_context_set_signed_cert_timestamp_list_cold_2(v19, v27);
LABEL_28:

          goto LABEL_29;
        }
        goto LABEL_30;
      }
    }
    else
    {
      free(v9);
    }
LABEL_29:
    v5 = 0;
    goto LABEL_30;
  }
  v11 = (id *)(v6 + 16);
  v12 = objc_loadWeakRetained((id *)(v6 + 16));
  if (v12)
  {
    v13 = v12;
    v14 = objc_loadWeakRetained((id *)(v6 + 16));
    v15 = v14[475];

    if ((v15 & 1) != 0)
      goto LABEL_29;
  }
  v16 = objc_loadWeakRetained(v11);
  if (v16)
  {
    v17 = objc_loadWeakRetained(v11);
    v18 = (v17[475] & 1) == 0;

  }
  else
  {
    v18 = 1;
  }

  v5 = 0;
  if (v18 && g_boringssl_log)
  {
    v27 = (id)g_boringssl_log;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      boringssl_context_set_signed_cert_timestamp_list_cold_1(v11, v27);
    goto LABEL_28;
  }
LABEL_30:

  return v5;
}

uint64_t boringssl_context_set_ocsp_response(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  id *v5;
  id WeakRetained;
  void *v7;
  _BYTE *v8;
  char v9;
  id v10;
  _BYTE *v11;
  _BOOL4 v12;
  NSObject *v13;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 != -1252936367)
    return 0xFFFFFFFFLL;
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = *(_QWORD *)(v2 + 400);
  if (!v3)
    return 0xFFFFFFFFLL;
  if (SSL_set_ocsp_response(v3, *(const void **)(a2 + 8), *(_QWORD *)a2))
    return 0;
  v5 = (id *)(v2 + 16);
  WeakRetained = objc_loadWeakRetained(v5);
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained(v5);
    v9 = v8[475];

    if ((v9 & 1) != 0)
      return 0xFFFFFFFFLL;
  }
  v10 = objc_loadWeakRetained(v5);
  if (v10)
  {
    v11 = objc_loadWeakRetained(v5);
    v12 = (v11[475] & 1) == 0;

  }
  else
  {
    v12 = 1;
  }

  result = 0xFFFFFFFFLL;
  if (v12 && g_boringssl_log)
  {
    v13 = (id)g_boringssl_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      boringssl_context_set_ocsp_response_cold_1(v5, v13);

    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t boringssl_context_set_mtu(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  bssl *v3;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 != -1252936367)
    return 0xFFFFFFFFLL;
  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = *(bssl **)(v2 + 400);
  if (!v3 || (*(_BYTE *)(v2 + 556) & 0x20) == 0)
    return 0xFFFFFFFFLL;
  if (SSL_set_mtu(v3, a2) == 1)
    return 0;
  return 0xFFFFFFFFLL;
}

uint64_t boringssl_context_process_trust_result(uint64_t a1, __SecTrust *a2, uint64_t a3)
{
  CFTypeID v3;
  char *v4;
  uint64_t v5;
  id WeakRetained;
  void *v9;
  unsigned __int8 *v10;
  id v11;
  _BYTE *v12;
  NSObject *v14;
  void *v15;
  id v16;
  CFDictionaryRef v17;
  CFDictionaryRef v18;
  CFTypeID v19;
  const __CFBoolean *v20;
  const __CFBoolean *v21;
  int Value;
  id v23;
  void *v24;
  _BYTE *v25;
  char v26;
  id v27;
  _BYTE *v28;
  _BOOL4 v29;
  id v30;
  void *v31;
  _BYTE *v32;
  char v33;
  id v34;
  _BYTE *v35;
  _BOOL4 v36;
  NSObject *v37;
  id v38;
  void *v39;
  _BYTE *v40;
  char v41;
  id v42;
  _BYTE *v43;
  _BOOL4 v44;
  NSObject *v45;
  id v46;
  void *v47;
  id v48;
  const char *v49;
  id v50;
  const char *redacted_identity;
  id v52;
  void *v53;
  id v54;
  int v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  const char *v64;
  __int16 v65;
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (*(_DWORD *)a1 != -1252936367)
    return 0;
  v5 = *(_QWORD *)(a1 + 8);
  if (!v5)
    return 0;
  if ((*(_BYTE *)(v5 + 559) & 2) == 0)
    goto LABEL_44;
  WeakRetained = objc_loadWeakRetained((id *)(v5 + 16));
  if (!WeakRetained
    || (v9 = WeakRetained,
        v10 = (unsigned __int8 *)objc_loadWeakRetained((id *)(v5 + 16)),
        v3 = v10[475],
        v10,
        v9,
        (v3 & 1) == 0))
  {
    v11 = objc_loadWeakRetained((id *)(v5 + 16));
    if (v11)
    {
      v12 = objc_loadWeakRetained((id *)(v5 + 16));
      v3 = (v12[475] & 1) == 0;

    }
    else
    {
      v3 = 1;
    }

    if ((_DWORD)v3)
    {
      if (g_boringssl_log)
      {
        v14 = (id)g_boringssl_log;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v3 = (CFTypeID)objc_loadWeakRetained((id *)(v5 + 16));
          if (v3)
          {
            v4 = (char *)objc_loadWeakRetained((id *)(v5 + 16));
            v15 = v4 + 391;
          }
          else
          {
            v15 = &unk_1B50022E3;
          }
          v16 = objc_loadWeakRetained((id *)(v5 + 16));
          v55 = 136446978;
          v56 = "boringssl_context_process_trust_result";
          v57 = 1024;
          v58 = 1520;
          v59 = 2082;
          v60 = v15;
          v61 = 2048;
          v62 = v16;
          _os_log_impl(&dword_1B4F6D000, v14, OS_LOG_TYPE_INFO, "%{public}s(%d) %{public}s[%p] Applying EV constraint", (uint8_t *)&v55, 0x26u);

          if (v3)
        }

      }
    }
  }
  v17 = SecTrustCopyResult(a2);
  if (v17)
  {
    v18 = v17;
    v19 = CFGetTypeID(v17);
    if (v19 == CFDictionaryGetTypeID()
      && (v20 = (const __CFBoolean *)CFDictionaryGetValue(v18, (const void *)*MEMORY[0x1E0CD7040])) != 0
      && (v21 = v20, v3 = CFGetTypeID(v20), v3 == CFBooleanGetTypeID()))
    {
      Value = CFBooleanGetValue(v21);
      CFRelease(v18);
      if (Value)
      {
        v23 = objc_loadWeakRetained((id *)(v5 + 16));
        if (!v23
          || (v24 = v23,
              v25 = objc_loadWeakRetained((id *)(v5 + 16)),
              v26 = v25[475],
              v25,
              v24,
              (v26 & 1) == 0))
        {
          v27 = objc_loadWeakRetained((id *)(v5 + 16));
          if (v27)
          {
            v28 = objc_loadWeakRetained((id *)(v5 + 16));
            v29 = (v28[475] & 1) == 0;

          }
          else
          {
            v29 = 1;
          }

          if (v29)
          {
            if (g_boringssl_log)
            {
              v37 = (id)g_boringssl_log;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                v52 = objc_loadWeakRetained((id *)(v5 + 16));
                if (v52)
                {
                  v3 = (CFTypeID)objc_loadWeakRetained((id *)(v5 + 16));
                  v53 = (void *)(v3 + 391);
                }
                else
                {
                  v53 = &unk_1B50022E3;
                }
                v54 = objc_loadWeakRetained((id *)(v5 + 16));
                v55 = 136446978;
                v56 = "boringssl_context_process_trust_result";
                v57 = 1024;
                v58 = 1537;
                v59 = 2082;
                v60 = v53;
                v61 = 2048;
                v62 = v54;
                _os_log_impl(&dword_1B4F6D000, v37, OS_LOG_TYPE_INFO, "%{public}s(%d) %{public}s[%p] EV constraint passed", (uint8_t *)&v55, 0x26u);

                if (v52)
              }
LABEL_43:

              goto LABEL_44;
            }
          }
        }
        goto LABEL_44;
      }
    }
    else
    {
      CFRelease(v18);
    }
  }
  v30 = objc_loadWeakRetained((id *)(v5 + 16));
  if (v30)
  {
    v31 = v30;
    v32 = objc_loadWeakRetained((id *)(v5 + 16));
    v33 = v32[475];

    if ((v33 & 1) != 0)
    {
      a3 = 0;
      goto LABEL_44;
    }
  }
  v34 = objc_loadWeakRetained((id *)(v5 + 16));
  if (v34)
  {
    v35 = objc_loadWeakRetained((id *)(v5 + 16));
    v36 = (v35[475] & 1) == 0;

  }
  else
  {
    v36 = 1;
  }

  a3 = 0;
  if (v36 && g_boringssl_log)
  {
    v37 = (id)g_boringssl_log;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      boringssl_context_process_trust_result_cold_1(v5 + 16, v37);
    a3 = 0;
    goto LABEL_43;
  }
LABEL_44:
  v38 = objc_loadWeakRetained((id *)(v5 + 16));
  if (!v38
    || (v39 = v38,
        v40 = objc_loadWeakRetained((id *)(v5 + 16)),
        v41 = v40[475],
        v40,
        v39,
        (v41 & 1) == 0))
  {
    v42 = objc_loadWeakRetained((id *)(v5 + 16));
    if (v42)
    {
      v43 = objc_loadWeakRetained((id *)(v5 + 16));
      v44 = (v43[475] & 1) == 0;

    }
    else
    {
      v44 = 1;
    }

    if (v44)
    {
      if (g_boringssl_log)
      {
        v45 = (id)g_boringssl_log;
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
        {
          v46 = objc_loadWeakRetained((id *)(v5 + 16));
          if (v46)
          {
            v3 = (CFTypeID)objc_loadWeakRetained((id *)(v5 + 16));
            v47 = (void *)(v3 + 391);
          }
          else
          {
            v47 = &unk_1B50022E3;
          }
          v48 = objc_loadWeakRetained((id *)(v5 + 16));
          v49 = *(const char **)(v5 + 80);
          v50 = v48;
          redacted_identity = nw_protocol_boringssl_get_redacted_identity((uint64_t)v50, v49);
          v55 = 136447490;
          v56 = "boringssl_context_process_trust_result";
          v57 = 1024;
          v58 = 1543;
          v59 = 2082;
          v60 = v47;
          v61 = 2048;
          v62 = v48;
          v63 = 2082;
          v64 = redacted_identity;
          v65 = 1024;
          v66 = a3;
          _os_log_debug_impl(&dword_1B4F6D000, v45, OS_LOG_TYPE_DEBUG, "%{public}s(%d) %{public}s[%p] Subject name: %{public}s, tls_handshake_trust: %{BOOL}d", (uint8_t *)&v55, 0x36u);

          if (v46)
        }

      }
    }
  }
  return a3;
}

id boringssl_context_copy_global_trust_queue_for_qos(void *a1)
{
  id v1;
  int scheduling_mode;
  id *v3;
  uint64_t *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD block[4];
  id v12;

  v1 = a1;
  scheduling_mode = nw_context_get_scheduling_mode();
  if (scheduling_mode == 1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __boringssl_context_copy_global_trust_queue_for_qos_block_invoke_2;
    v9[3] = &unk_1E686E748;
    v3 = &v10;
    v10 = v1;
    if (boringssl_context_copy_global_trust_queue_for_qos_userInitiatedQueueToken != -1)
      dispatch_once(&boringssl_context_copy_global_trust_queue_for_qos_userInitiatedQueueToken, v9);
    v4 = &boringssl_context_copy_global_trust_queue_for_qos_userInitiatedQueue;
  }
  else if (scheduling_mode == 2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __boringssl_context_copy_global_trust_queue_for_qos_block_invoke;
    block[3] = &unk_1E686E748;
    v3 = &v12;
    v12 = v1;
    if (boringssl_context_copy_global_trust_queue_for_qos_userInteractiveQueueToken != -1)
      dispatch_once(&boringssl_context_copy_global_trust_queue_for_qos_userInteractiveQueueToken, block);
    v4 = &boringssl_context_copy_global_trust_queue_for_qos_userInteractiveQueue;
  }
  else
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __boringssl_context_copy_global_trust_queue_for_qos_block_invoke_3;
    v7[3] = &unk_1E686E748;
    v3 = &v8;
    v8 = v1;
    if (boringssl_context_copy_global_trust_queue_for_qos_defaultQueueToken != -1)
      dispatch_once(&boringssl_context_copy_global_trust_queue_for_qos_defaultQueueToken, v7);
    v4 = &boringssl_context_copy_global_trust_queue_for_qos_defaultQueue;
  }
  v5 = (id)*v4;

  return v5;
}

void __boringssl_context_copy_global_trust_queue_for_qos_block_invoke(uint64_t a1)
{
  dispatch_queue_t queue_for_qos;
  void *v2;

  queue_for_qos = boringssl_context_create_queue_for_qos(*(void **)(a1 + 32), "com.apple.network.boringssl.user_interactive_qos_trust_queue", QOS_CLASS_USER_INTERACTIVE);
  v2 = (void *)boringssl_context_copy_global_trust_queue_for_qos_userInteractiveQueue;
  boringssl_context_copy_global_trust_queue_for_qos_userInteractiveQueue = (uint64_t)queue_for_qos;

}

dispatch_queue_t boringssl_context_create_queue_for_qos(void *a1, const char *a2, dispatch_qos_class_t a3)
{
  id v3;
  char *v4;
  id *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  id WeakRetained;
  void *v12;
  unsigned __int8 *v13;
  _BYTE *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  _BYTE *v18;
  char v19;
  _BYTE *v20;
  _BOOL4 v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  char *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  _BYTE v40[14];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  dispatch_queue_attr_make_with_qos_class(0, a3, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    if (!v7)
      goto LABEL_18;
    WeakRetained = objc_loadWeakRetained(v7 + 2);
    if (!WeakRetained
      || (v12 = WeakRetained,
          v13 = (unsigned __int8 *)objc_loadWeakRetained(v7 + 2),
          v4 = (char *)v13[475],
          v13,
          v12,
          (v4 & 1) == 0))
    {
      v3 = objc_loadWeakRetained(v7 + 2);
      if (v3)
      {
        v14 = objc_loadWeakRetained(v7 + 2);
        v15 = (v14[475] & 1) == 0;

      }
      else
      {
        v15 = 1;
      }

      if (v15)
      {
LABEL_18:
        if (g_boringssl_log)
        {
          v22 = (id)g_boringssl_log;
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            if (v7)
            {
              v3 = objc_loadWeakRetained(v7 + 2);
              v24 = v3 != 0;
              if (v3)
              {
                v4 = (char *)objc_loadWeakRetained(v7 + 2);
                v26 = v4 + 391;
              }
              else
              {
                v26 = &unk_1B50022E3;
              }
              v25 = objc_loadWeakRetained(v7 + 2);
            }
            else
            {
              v24 = 0;
              v25 = 0;
              v26 = &unk_1B50022E3;
            }
            *(_DWORD *)buf = 136447490;
            v32 = "boringssl_context_create_queue_for_qos";
            v33 = 1024;
            v34 = 1552;
            v35 = 2082;
            v36 = v26;
            v37 = 2048;
            v38 = v25;
            v39 = 1024;
            *(_DWORD *)v40 = a3;
            *(_WORD *)&v40[4] = 2082;
            *(_QWORD *)&v40[6] = a2;
            _os_log_error_impl(&dword_1B4F6D000, v22, OS_LOG_TYPE_ERROR, "%{public}s(%d) %{public}s[%p] Failed to set the %u QoS class attribute for queue %{public}s.", buf, 0x36u);
            if (v7)

            if (v24)
            if (v7)

          }
        }
      }
    }
  }
  v9 = dispatch_queue_create(a2, v8);
  if (!v9)
  {
    if (!v7)
      goto LABEL_23;
    v16 = objc_loadWeakRetained(v7 + 2);
    if (!v16
      || (v17 = v16,
          v18 = objc_loadWeakRetained(v7 + 2),
          v19 = v18[475],
          v18,
          v17,
          (v19 & 1) == 0))
    {
      v4 = (char *)objc_loadWeakRetained(v7 + 2);
      if (v4)
      {
        v20 = objc_loadWeakRetained(v7 + 2);
        v21 = (v20[475] & 1) == 0;

      }
      else
      {
        v21 = 1;
      }

      if (v21)
      {
LABEL_23:
        if (g_boringssl_log)
        {
          v23 = (id)g_boringssl_log;
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            if (v7)
            {
              v4 = (char *)objc_loadWeakRetained(v7 + 2);
              v27 = v4 != 0;
              if (v4)
              {
                v30 = (char *)objc_loadWeakRetained(v7 + 2);
                v29 = v30 + 391;
              }
              else
              {
                v29 = &unk_1B50022E3;
              }
              v28 = objc_loadWeakRetained(v7 + 2);
            }
            else
            {
              v27 = 0;
              v28 = 0;
              v29 = &unk_1B50022E3;
            }
            *(_DWORD *)buf = 136447490;
            v32 = "boringssl_context_create_queue_for_qos";
            v33 = 1024;
            v34 = 1556;
            v35 = 2082;
            v36 = v29;
            v37 = 2048;
            v38 = v28;
            v39 = 2082;
            *(_QWORD *)v40 = a2;
            *(_WORD *)&v40[8] = 1024;
            *(_DWORD *)&v40[10] = a3;
            _os_log_error_impl(&dword_1B4F6D000, v23, OS_LOG_TYPE_ERROR, "%{public}s(%d) %{public}s[%p] Failed to create queue %{public}s with QoS class %u.", buf, 0x36u);
            if (v7)

            if (v27)
            if (v7)

          }
        }
      }
    }
  }

  return v9;
}

void __boringssl_context_copy_global_trust_queue_for_qos_block_invoke_2(uint64_t a1)
{
  dispatch_queue_t queue_for_qos;
  void *v2;

  queue_for_qos = boringssl_context_create_queue_for_qos(*(void **)(a1 + 32), "com.apple.network.boringssl.user_initiated_qos_trust_queue", QOS_CLASS_USER_INITIATED);
  v2 = (void *)boringssl_context_copy_global_trust_queue_for_qos_userInitiatedQueue;
  boringssl_context_copy_global_trust_queue_for_qos_userInitiatedQueue = (uint64_t)queue_for_qos;

}

void __boringssl_context_copy_global_trust_queue_for_qos_block_invoke_3(uint64_t a1)
{
  dispatch_queue_t queue_for_qos;
  void *v2;

  queue_for_qos = boringssl_context_create_queue_for_qos(*(void **)(a1 + 32), "com.apple.network.boringssl.unspecified_qos_trust_queue", QOS_CLASS_UNSPECIFIED);
  v2 = (void *)boringssl_context_copy_global_trust_queue_for_qos_defaultQueue;
  boringssl_context_copy_global_trust_queue_for_qos_defaultQueue = (uint64_t)queue_for_qos;

}

void boringssl_context_async(uint64_t a1, dispatch_queue_t queue, dispatch_block_t block)
{
  if (a1 && queue)
  {
    if (block)
    {
      ++*(_QWORD *)(a1 + 504);
      dispatch_async(queue, block);
    }
  }
}

BOOL boringssl_context_evaluate_trust_async_internal(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  _BOOL8 v7;
  id *v8;
  id v9;
  id *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  _BYTE *v16;
  char v17;
  id v18;
  _BYTE *v19;
  _BOOL4 v20;
  id *v22;
  id v23;
  void *v24;
  _BYTE *v25;
  char v26;
  id v27;
  _BYTE *v28;
  _BOOL4 v29;
  NSObject *v30;
  id v31;
  void *v32;
  id v33;
  char *v34;
  _QWORD v35[4];
  NSObject *v36;
  NSObject *v37;
  id v38;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a1 && *(_DWORD *)a1 == -1252936367)
  {
    v7 = 0;
    if (v5)
    {
      if (a2)
      {
        v8 = *(id **)(a1 + 8);
        if (v8)
        {
          v9 = boringssl_context_copy_global_trust_queue_for_qos(*(void **)(a1 + 8));
          v7 = v9 != 0;
          if (v9)
          {
            v10 = v8;
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __boringssl_context_evaluate_trust_async_internal_block_invoke;
            v35[3] = &unk_1E6879028;
            v39 = a1;
            v40 = v10;
            v11 = v10;
            v36 = v11;
            v38 = v6;
            v41 = a2;
            v12 = v9;
            v37 = v12;
            v13 = (void *)MEMORY[0x1B5E45624](v35);
            BYTE6(v11[69].isa) |= 8u;
            WeakRetained = objc_loadWeakRetained((id *)&v11[2].isa);
            if (!WeakRetained
              || (v15 = WeakRetained,
                  v16 = objc_loadWeakRetained((id *)&v11[2].isa),
                  v17 = v16[475],
                  v16,
                  v15,
                  (v17 & 1) == 0))
            {
              v18 = objc_loadWeakRetained((id *)&v11[2].isa);
              if (v18)
              {
                v19 = objc_loadWeakRetained((id *)&v11[2].isa);
                v20 = (v19[475] & 1) == 0;

              }
              else
              {
                v20 = 1;
              }

              if (v20)
              {
                if (g_boringssl_log)
                {
                  v30 = (id)g_boringssl_log;
                  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
                  {
                    v31 = objc_loadWeakRetained((id *)&v11[2].isa);
                    if (v31)
                    {
                      v34 = (char *)objc_loadWeakRetained((id *)&v11[2].isa);
                      v32 = v34 + 391;
                    }
                    else
                    {
                      v32 = &unk_1B50022E3;
                    }
                    v33 = objc_loadWeakRetained((id *)&v11[2].isa);
                    *(_DWORD *)buf = 136446978;
                    v43 = "boringssl_context_evaluate_trust_async_internal";
                    v44 = 1024;
                    v45 = 1660;
                    v46 = 2082;
                    v47 = v32;
                    v48 = 2048;
                    v49 = v33;
                    _os_log_impl(&dword_1B4F6D000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s(%d) %{public}s[%p] Asyncing for internal verify block", buf, 0x26u);

                    if (v31)
                  }

                }
              }
            }
            if (v13)
            {
              ++v11[63].isa;
              dispatch_async(v12, v13);
            }

          }
          else
          {
            v22 = v8 + 2;
            v23 = objc_loadWeakRetained(v8 + 2);
            if (v23)
            {
              v24 = v23;
              v25 = objc_loadWeakRetained(v22);
              v26 = v25[475];

              if ((v26 & 1) != 0)
                goto LABEL_37;
            }
            v27 = objc_loadWeakRetained(v22);
            if (v27)
            {
              v28 = objc_loadWeakRetained(v22);
              v29 = (v28[475] & 1) == 0;

            }
            else
            {
              v29 = 1;
            }

            if (!v29 || !g_boringssl_log)
              goto LABEL_37;
            v11 = (id)g_boringssl_log;
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
              boringssl_context_evaluate_trust_async_internal_cold_1(v22, v11);
          }

LABEL_37:
        }
      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __boringssl_context_evaluate_trust_async_internal_block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  _BYTE *v9;
  char v10;
  uint64_t v11;
  id v12;
  _BYTE *v13;
  _BOOL4 v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  void *v18;
  _BYTE *v19;
  char v20;
  uint64_t v21;
  id v22;
  _BYTE *v23;
  _BOOL4 v24;
  NSObject *v25;
  uint64_t v26;
  id v27;
  char v28;
  void *v29;
  uint64_t v30;
  _BOOL4 v31;
  id v32;
  char v33;
  void *v34;
  char *v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  __int128 v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  __int128 v46;
  uint64_t v47;
  uint8_t buf[4];
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  if (boringssl_session_get_state(*(_QWORD *)(a1 + 56)) > 3
    || boringssl_session_is_cancelled(*(_QWORD *)(a1 + 56)))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 64) + 558) &= ~8u;
    return;
  }
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __boringssl_context_evaluate_trust_async_internal_block_invoke_2;
  v44[3] = &unk_1E6878FD8;
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 64);
  v45 = v2;
  v47 = v3;
  v41 = *(_OWORD *)(a1 + 48);
  v4 = (id)v41;
  v46 = v41;
  v5 = (void *)MEMORY[0x1B5E45624](v44);
  v6 = *(_QWORD *)(a1 + 32);
  if (!v6)
    goto LABEL_13;
  WeakRetained = objc_loadWeakRetained((id *)(v6 + 16));
  if (!WeakRetained
    || (v8 = WeakRetained,
        v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16)),
        v10 = v9[475],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    v11 = *(_QWORD *)(a1 + 32);
    if (!v11)
      goto LABEL_13;
    v12 = objc_loadWeakRetained((id *)(v11 + 16));
    if (v12)
    {
      v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      v14 = (v13[475] & 1) == 0;

    }
    else
    {
      v14 = 1;
    }

    if (v14)
    {
LABEL_13:
      if (g_boringssl_log)
      {
        v15 = (id)g_boringssl_log;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          v26 = *(_QWORD *)(a1 + 32);
          if (v26)
          {
            v35 = (char *)objc_loadWeakRetained((id *)(v26 + 16));
            v36 = *(_QWORD *)(a1 + 32);
            v40 = v35;
            if (v35)
            {
              LODWORD(v41) = v36 != 0;
              if (v36)
              {
                v35 = (char *)objc_loadWeakRetained((id *)(v36 + 16));
                v36 = *(_QWORD *)(a1 + 32);
              }
              else
              {
                v35 = 0;
              }
              v29 = v35 + 391;
            }
            else
            {
              LODWORD(v41) = 0;
              v29 = &unk_1B50022E3;
            }
            v39 = v35;
            if (v36)
            {
              v27 = objc_loadWeakRetained((id *)(v36 + 16));
              v28 = 0;
            }
            else
            {
              v27 = 0;
              v28 = 1;
            }
          }
          else
          {
            LODWORD(v41) = 0;
            v27 = 0;
            v28 = 1;
            v29 = &unk_1B50022E3;
          }
          *(_DWORD *)buf = 136446978;
          v49 = "boringssl_context_evaluate_trust_async_internal_block_invoke_2";
          v50 = 1024;
          v51 = 1647;
          v52 = 2082;
          v53 = v29;
          v54 = 2048;
          v55 = v27;
          _os_log_debug_impl(&dword_1B4F6D000, v15, OS_LOG_TYPE_DEBUG, "%{public}s(%d) %{public}s[%p] Invoking SecTrustEvaluateAsyncWithError", buf, 0x26u);
          if ((v28 & 1) == 0)

          if ((_DWORD)v41)
          if (v26)

        }
      }
    }
  }
  if (SecTrustEvaluateAsyncWithError(*(SecTrustRef *)(a1 + 72), *(dispatch_queue_t *)(a1 + 40), v5))
  {
    v16 = *(_QWORD *)(a1 + 32);
    if (v16)
    {
      v17 = objc_loadWeakRetained((id *)(v16 + 16));
      if (v17)
      {
        v18 = v17;
        v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
        v20 = v19[475];

        if ((v20 & 1) != 0)
          goto LABEL_29;
      }
      v21 = *(_QWORD *)(a1 + 32);
      if (v21)
      {
        v22 = objc_loadWeakRetained((id *)(v21 + 16));
        if (v22)
        {
          v23 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
          v24 = (v23[475] & 1) == 0;

        }
        else
        {
          v24 = 1;
        }

        if (!v24)
          goto LABEL_29;
      }
    }
    if (!g_boringssl_log)
      goto LABEL_29;
    v25 = (id)g_boringssl_log;
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
LABEL_28:

LABEL_29:
      v42 = *(id *)(a1 + 32);
      v43 = *(id *)(a1 + 48);
      nw_queue_context_async_if_needed();

      goto LABEL_30;
    }
    v30 = *(_QWORD *)(a1 + 32);
    if (v30)
    {
      v37 = (char *)objc_loadWeakRetained((id *)(v30 + 16));
      v38 = *(_QWORD *)(a1 + 32);
      *(_QWORD *)&v41 = v37;
      if (v37)
      {
        v31 = v38 != 0;
        if (v38)
        {
          v37 = (char *)objc_loadWeakRetained((id *)(v38 + 16));
          v38 = *(_QWORD *)(a1 + 32);
        }
        else
        {
          v37 = 0;
        }
        v34 = v37 + 391;
      }
      else
      {
        v31 = 0;
        v34 = &unk_1B50022E3;
      }
      v40 = v37;
      if (v38)
      {
        v32 = objc_loadWeakRetained((id *)(v38 + 16));
        v33 = 0;
      }
      else
      {
        v32 = 0;
        v33 = 1;
      }
    }
    else
    {
      v31 = 0;
      v32 = 0;
      v33 = 1;
      v34 = &unk_1B50022E3;
    }
    *(_DWORD *)buf = 136446978;
    v49 = "boringssl_context_evaluate_trust_async_internal_block_invoke";
    v50 = 1024;
    v51 = 1650;
    v52 = 2082;
    v53 = v34;
    v54 = 2048;
    v55 = v32;
    _os_log_error_impl(&dword_1B4F6D000, v25, OS_LOG_TYPE_ERROR, "%{public}s(%d) %{public}s[%p] SecTrustEvaluateAsyncWithError failed", buf, 0x26u);
    if ((v33 & 1) != 0)
    {
      if (!v31)
        goto LABEL_61;
    }
    else
    {

      if (!v31)
      {
LABEL_61:
        if (!v30)
          goto LABEL_28;
        goto LABEL_65;
      }
    }

    if (!v30)
      goto LABEL_28;
LABEL_65:

    goto LABEL_28;
  }
LABEL_30:

}

void __boringssl_context_evaluate_trust_async_internal_block_invoke_2(uint64_t a1, uint64_t a2, int a3, __CFError *a4)
{
  uint64_t v7;
  id WeakRetained;
  void *v9;
  _BYTE *v10;
  char v11;
  uint64_t v12;
  id v13;
  _BYTE *v14;
  _BOOL4 v15;
  NSObject *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  _BOOL4 v20;
  id v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;
  __int16 v36;
  int v37;
  __int16 v38;
  __CFError *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v7 = *(_QWORD *)(a1 + 32);
  if (!v7)
    goto LABEL_10;
  WeakRetained = objc_loadWeakRetained((id *)(v7 + 16));
  if (!WeakRetained
    || (v9 = WeakRetained,
        v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16)),
        v11 = v10[475],
        v10,
        v9,
        (v11 & 1) == 0))
  {
    v12 = *(_QWORD *)(a1 + 32);
    if (!v12)
      goto LABEL_10;
    v13 = objc_loadWeakRetained((id *)(v12 + 16));
    if (v13)
    {
      v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      v15 = (v14[475] & 1) == 0;

    }
    else
    {
      v15 = 1;
    }

    if (v15)
    {
LABEL_10:
      if (g_boringssl_log)
      {
        v16 = (id)g_boringssl_log;
        if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        v17 = *(_QWORD *)(a1 + 32);
        if (v17)
        {
          v18 = (char *)objc_loadWeakRetained((id *)(v17 + 16));
          v19 = *(_QWORD *)(a1 + 32);
          v25 = v18;
          if (v18)
          {
            v20 = v19 != 0;
            if (v19)
            {
              v18 = (char *)objc_loadWeakRetained((id *)(v19 + 16));
              v19 = *(_QWORD *)(a1 + 32);
            }
            else
            {
              v18 = 0;
            }
            v23 = v18 + 391;
          }
          else
          {
            v20 = 0;
            v23 = &unk_1B50022E3;
          }
          v24 = v18;
          if (v19)
          {
            v21 = objc_loadWeakRetained((id *)(v19 + 16));
            v22 = 0;
          }
          else
          {
            v21 = 0;
            v22 = 1;
          }
        }
        else
        {
          v20 = 0;
          v21 = 0;
          v22 = 1;
          v23 = &unk_1B50022E3;
        }
        *(_DWORD *)buf = 136447490;
        v29 = "boringssl_context_evaluate_trust_async_internal_block_invoke_2";
        v30 = 1024;
        v31 = 1633;
        v32 = 2082;
        v33 = v23;
        v34 = 2048;
        v35 = v21;
        v36 = 1024;
        v37 = a3;
        v38 = 2114;
        v39 = a4;
        _os_log_impl(&dword_1B4F6D000, v16, OS_LOG_TYPE_DEFAULT, "%{public}s(%d) %{public}s[%p] Returning from internal verify block with result: %{BOOL}d (%{public}@)", buf, 0x36u);
        if ((v22 & 1) != 0)
        {
          if (!v20)
            goto LABEL_25;
        }
        else
        {

          if (!v20)
          {
LABEL_25:
            if (v17)
LABEL_26:

LABEL_27:
            goto LABEL_28;
          }
        }

        if (!v17)
          goto LABEL_27;
        goto LABEL_26;
      }
    }
  }
LABEL_28:
  if (a4)
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 324) = CFErrorGetCode(a4);
  if (boringssl_session_get_state(*(_QWORD *)(a1 + 48)) <= 3
    && (boringssl_session_is_cancelled(*(_QWORD *)(a1 + 48)) & 1) == 0)
  {
    v26 = *(id *)(a1 + 32);
    v27 = *(id *)(a1 + 40);
    nw_queue_context_async_if_needed();

  }
}

uint64_t __boringssl_context_evaluate_trust_async_internal_block_invoke_195(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 559) |= 0x10u;
  *(_BYTE *)(*(_QWORD *)(a1 + 48) + 558) &= ~8u;
  boringssl_context_process_trust_result(*(_QWORD *)(a1 + 56), *(__SecTrust **)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __boringssl_context_evaluate_trust_async_internal_block_invoke_199(_QWORD *a1)
{
  *(_BYTE *)(a1[4] + 559) |= 0x10u;
  *(_BYTE *)(a1[6] + 558) &= ~8u;
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

uint64_t __boringssl_context_evaluate_trust_async_external_block_invoke_203(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 558) &= ~8u;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t boringssl_context_certificate_request_callback(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  _BYTE *v7;
  char v8;
  id v9;
  _BYTE *v10;
  _BOOL4 v11;
  uint64_t result;
  id *v13;
  id v14;
  void *v15;
  _BYTE *v16;
  char v17;
  id v18;
  _BYTE *v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  char *v23;
  id *v24;
  id v25;
  void *v26;
  _BYTE *v27;
  char v28;
  id v29;
  _BYTE *v30;
  _BOOL4 v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  void *v36;
  id v37;
  NSObject *v38;
  id v39;
  char *v40;
  char *v41;
  char *v42;
  _QWORD block[4];
  char *v44;
  id v45;
  uint64_t v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  id v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  if (*(_DWORD *)a2 != -1252936367)
    return 0;
  v4 = *(_QWORD *)(a2 + 8);
  if (!v4)
    return 0;
  *(_BYTE *)(v4 + 558) |= 0x10u;
  if ((*(_BYTE *)(v4 + 557) & 4) == 0)
  {
    if (*(_QWORD *)(v4 + 104))
    {
      WeakRetained = objc_loadWeakRetained((id *)(v4 + 16));
      if (!WeakRetained
        || (v6 = WeakRetained,
            v7 = objc_loadWeakRetained((id *)(v4 + 16)),
            v8 = v7[475],
            v7,
            v6,
            (v8 & 1) == 0))
      {
        v9 = objc_loadWeakRetained((id *)(v4 + 16));
        if (v9)
        {
          v10 = objc_loadWeakRetained((id *)(v4 + 16));
          v11 = (v10[475] & 1) == 0;

        }
        else
        {
          v11 = 1;
        }

        if (v11)
        {
          if (g_boringssl_log)
          {
            v33 = (id)g_boringssl_log;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              boringssl_context_certificate_request_callback_cold_1(v4 + 16, v33);

          }
        }
      }
      *(_BYTE *)(v4 + 557) |= 4u;
      return 1;
    }
    if (*(_DWORD *)a2 == -1252936367)
    {
      v21 = *(_QWORD *)(a2 + 8);
      if (v21)
      {
        if (*(_QWORD *)(v21 + 136) && *(_QWORD *)(v21 + 144) && (*(_BYTE *)(v21 + 559) & 4) == 0)
        {
          boringssl_session_update_metadata(a2);
          v22 = (void *)MEMORY[0x1B5E45624](*(_QWORD *)(v4 + 136));
          v23 = (char *)(id)v4;
          v24 = (id *)(v23 + 16);
          v25 = objc_loadWeakRetained((id *)v23 + 2);
          if (!v25
            || (v26 = v25,
                v27 = objc_loadWeakRetained(v24),
                v28 = v27[475],
                v27,
                v26,
                (v28 & 1) == 0))
          {
            v29 = objc_loadWeakRetained(v24);
            if (v29)
            {
              v30 = objc_loadWeakRetained(v24);
              v31 = (v30[475] & 1) == 0;

            }
            else
            {
              v31 = 1;
            }

            if (v31)
            {
              if (g_boringssl_log)
              {
                v34 = (id)g_boringssl_log;
                if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
                {
                  v35 = objc_loadWeakRetained(v24);
                  if (v35)
                  {
                    v2 = (char *)objc_loadWeakRetained(v24);
                    v36 = v2 + 391;
                  }
                  else
                  {
                    v36 = &unk_1B50022E3;
                  }
                  v37 = objc_loadWeakRetained(v24);
                  *(_DWORD *)buf = 136446978;
                  v48 = "boringssl_context_certificate_request_callback";
                  v49 = 1024;
                  v50 = 1835;
                  v51 = 2082;
                  v52 = v36;
                  v53 = 2048;
                  v54 = v37;
                  _os_log_impl(&dword_1B4F6D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s(%d) %{public}s[%p] Asyncing for challenge block", buf, 0x26u);

                  if (v35)
                }

              }
            }
          }
          v38 = *((_QWORD *)v23 + 18);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __boringssl_context_certificate_request_callback_block_invoke;
          block[3] = &unk_1E6879140;
          v46 = a2;
          v39 = v22;
          v45 = v39;
          v40 = v23;
          v41 = v40;
          v44 = v40;
          v42 = v40;
          if (v38)
          {
            ++*((_QWORD *)v40 + 63);
            dispatch_async(v38, block);
            v42 = v44;
          }

          return 0xFFFFFFFFLL;
        }
      }
    }
    return 1;
  }
  v13 = (id *)(v4 + 16);
  v14 = objc_loadWeakRetained((id *)(v4 + 16));
  if (v14)
  {
    v15 = v14;
    v16 = objc_loadWeakRetained((id *)(v4 + 16));
    v17 = v16[475];

    if ((v17 & 1) != 0)
      return 1;
  }
  v18 = objc_loadWeakRetained(v13);
  if (v18)
  {
    v19 = objc_loadWeakRetained(v13);
    v20 = (v19[475] & 1) == 0;

  }
  else
  {
    v20 = 1;
  }

  result = 1;
  if (v20 && g_boringssl_log)
  {
    v32 = (id)g_boringssl_log;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      boringssl_context_certificate_request_callback_cold_2(v13, v32);

    return 1;
  }
  return result;
}

void __boringssl_context_certificate_request_callback_block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  if (boringssl_session_get_state(a1[6]) <= 3 && (boringssl_session_is_cancelled(a1[6]) & 1) == 0)
  {
    v2 = (_QWORD *)a1[4];
    v3 = a1[5];
    v4 = v2[65];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __boringssl_context_certificate_request_callback_block_invoke_2;
    v7[3] = &unk_1E6879118;
    v5 = v2;
    v6 = a1[6];
    v8 = v5;
    v9 = v6;
    (*(void (**)(uint64_t, uint64_t, _QWORD *))(v3 + 16))(v3, v4, v7);

  }
}

void __boringssl_context_certificate_request_callback_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  nw_queue_context_async_if_needed();

}

void __boringssl_context_certificate_request_callback_block_invoke_3(_QWORD *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  void *v5;
  _BYTE *v6;
  char v7;
  uint64_t v8;
  id v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  id WeakRetained;
  void *v14;
  _BYTE *v15;
  char v16;
  uint64_t v17;
  id v18;
  _BYTE *v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v24;
  id v25;
  char v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  _BOOL4 v31;
  id v32;
  char v33;
  void *v34;
  void *v35;
  char v36;
  uint64_t v37;
  id v38;
  void *v39;
  _BYTE *v40;
  char v41;
  uint64_t v42;
  id v43;
  _BYTE *v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _BOOL4 v50;
  id v51;
  char v52;
  void *v53;
  uint64_t v54;
  int v55;
  const char *v56;
  __int16 v57;
  int v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  if (boringssl_session_get_state(a1[6]) <= 3 && (boringssl_session_is_cancelled(a1[6]) & 1) == 0)
  {
    v12 = a1[4];
    if (v12)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v12 + 16));
      if (WeakRetained)
      {
        v14 = WeakRetained;
        v15 = objc_loadWeakRetained((id *)(a1[4] + 16));
        v16 = v15[475];

        if ((v16 & 1) != 0)
          goto LABEL_58;
      }
      v17 = a1[4];
      if (v17)
      {
        v18 = objc_loadWeakRetained((id *)(v17 + 16));
        if (v18)
        {
          v19 = objc_loadWeakRetained((id *)(a1[4] + 16));
          v20 = (v19[475] & 1) == 0;

        }
        else
        {
          v20 = 1;
        }

        if ((_DWORD)v20)
        {
LABEL_30:
          if (!g_boringssl_log)
            goto LABEL_58;
          v28 = (id)g_boringssl_log;
          if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
            goto LABEL_57;
          v29 = a1[4];
          if (v29)
          {
            v20 = (uint64_t)objc_loadWeakRetained((id *)(v29 + 16));
            v30 = a1[4];
            if (v20)
            {
              v31 = v30 != 0;
              if (v30)
              {
                v1 = (char *)objc_loadWeakRetained((id *)(v30 + 16));
                v30 = a1[4];
              }
              else
              {
                v1 = 0;
              }
              v34 = v1 + 391;
            }
            else
            {
              v31 = 0;
              v34 = &unk_1B50022E3;
            }
            if (v30)
            {
              v32 = objc_loadWeakRetained((id *)(v30 + 16));
              v33 = 0;
            }
            else
            {
              v32 = 0;
              v33 = 1;
            }
          }
          else
          {
            v31 = 0;
            v32 = 0;
            v33 = 1;
            v34 = &unk_1B50022E3;
          }
          v55 = 136446978;
          v56 = "boringssl_context_certificate_request_callback_block_invoke_3";
          v57 = 1024;
          v58 = 1844;
          v59 = 2082;
          v60 = v34;
          v61 = 2048;
          v62 = v32;
          _os_log_impl(&dword_1B4F6D000, v28, OS_LOG_TYPE_DEFAULT, "%{public}s(%d) %{public}s[%p] Returning from challenge block", (uint8_t *)&v55, 0x26u);
          if ((v33 & 1) != 0)
          {
            if (!v31)
              goto LABEL_55;
          }
          else
          {

            if (!v31)
            {
LABEL_55:
              if (!v29)
              {
LABEL_57:

                goto LABEL_58;
              }
LABEL_56:

              goto LABEL_57;
            }
          }

          if (!v29)
            goto LABEL_57;
          goto LABEL_56;
        }
LABEL_58:
        v35 = (void *)a1[5];
        if (v35)
        {
          v36 = boringssl_context_set_identity(a1[6], v35);
          v37 = a1[4];
          if ((v36 & 1) == 0)
          {
            if (!v37)
              goto LABEL_68;
            v38 = objc_loadWeakRetained((id *)(v37 + 16));
            if (v38)
            {
              v39 = v38;
              v40 = objc_loadWeakRetained((id *)(a1[4] + 16));
              v41 = v40[475];

              if ((v41 & 1) != 0)
                goto LABEL_77;
            }
            v42 = a1[4];
            if (v42)
            {
              v43 = objc_loadWeakRetained((id *)(v42 + 16));
              if (v43)
              {
                v44 = objc_loadWeakRetained((id *)(a1[4] + 16));
                v45 = (v44[475] & 1) == 0;

              }
              else
              {
                v45 = 1;
              }

              if (!(_DWORD)v45)
                goto LABEL_77;
            }
            else
            {
LABEL_68:
              v45 = 1;
            }
            if (!g_boringssl_log)
            {
LABEL_77:
              v47 = a1[4];
              v48 = *(_QWORD *)(v47 + 280);
              v21 = objc_loadWeakRetained((id *)(v47 + 16));
              (*(void (**)(uint64_t, NSObject *, _QWORD, uint64_t))(v48 + 16))(v48, v21, 0, 4294957486);
              goto LABEL_78;
            }
            v46 = (id)g_boringssl_log;
            if (!os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
LABEL_76:

              goto LABEL_77;
            }
            v49 = a1[4];
            if (v49)
            {
              v45 = (uint64_t)objc_loadWeakRetained((id *)(v49 + 16));
              v54 = a1[4];
              if (v45)
              {
                v50 = v54 != 0;
                if (v54)
                {
                  v1 = (char *)objc_loadWeakRetained((id *)(v54 + 16));
                  v54 = a1[4];
                }
                else
                {
                  v1 = 0;
                }
                v53 = v1 + 391;
              }
              else
              {
                v50 = 0;
                v53 = &unk_1B50022E3;
              }
              if (v54)
              {
                v51 = objc_loadWeakRetained((id *)(v54 + 16));
                v52 = 0;
              }
              else
              {
                v51 = 0;
                v52 = 1;
              }
            }
            else
            {
              v50 = 0;
              v51 = 0;
              v52 = 1;
              v53 = &unk_1B50022E3;
            }
            v55 = 136446978;
            v56 = "boringssl_context_certificate_request_callback_block_invoke";
            v57 = 1024;
            v58 = 1847;
            v59 = 2082;
            v60 = v53;
            v61 = 2048;
            v62 = v51;
            _os_log_error_impl(&dword_1B4F6D000, v46, OS_LOG_TYPE_ERROR, "%{public}s(%d) %{public}s[%p] boringssl_context_set_identity failed", (uint8_t *)&v55, 0x26u);
            if ((v52 & 1) != 0)
            {
              if (!v50)
                goto LABEL_93;
            }
            else
            {

              if (!v50)
              {
LABEL_93:
                if (!v49)
                  goto LABEL_76;
                goto LABEL_97;
              }
            }

            if (!v49)
              goto LABEL_76;
LABEL_97:

            goto LABEL_76;
          }
        }
        else
        {
          v37 = a1[4];
        }
        *(_BYTE *)(v37 + 557) |= 4u;
        v21 = objc_loadWeakRetained((id *)(a1[4] + 16));
        nw_protocol_boringssl_handshake_negotiate(v21);
        goto LABEL_78;
      }
    }
    v20 = 1;
    goto LABEL_30;
  }
  v3 = a1[4];
  if (!v3)
    goto LABEL_9;
  v4 = objc_loadWeakRetained((id *)(v3 + 16));
  if (v4)
  {
    v5 = v4;
    v6 = objc_loadWeakRetained((id *)(a1[4] + 16));
    v7 = v6[475];

    if ((v7 & 1) != 0)
      return;
  }
  v8 = a1[4];
  if (!v8)
  {
LABEL_9:
    v11 = 1;
    goto LABEL_19;
  }
  v9 = objc_loadWeakRetained((id *)(v8 + 16));
  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)(a1[4] + 16));
    v11 = (v10[475] & 1) == 0;

  }
  else
  {
    v11 = 1;
  }

  if ((_DWORD)v11)
  {
LABEL_19:
    if (!g_boringssl_log)
      return;
    v21 = (id)g_boringssl_log;
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_78;
    v22 = a1[4];
    if (!v22)
    {
      v24 = 0;
      v25 = 0;
      v26 = 1;
      v27 = &unk_1B50022E3;
      goto LABEL_39;
    }
    v11 = (uint64_t)objc_loadWeakRetained((id *)(v22 + 16));
    v23 = a1[4];
    if (v11)
    {
      v24 = v23 != 0;
      if (v23)
      {
        v1 = (char *)objc_loadWeakRetained((id *)(v23 + 16));
        v23 = a1[4];
      }
      else
      {
        v1 = 0;
      }
      v27 = v1 + 391;
      if (v23)
        goto LABEL_38;
    }
    else
    {
      v24 = 0;
      v27 = &unk_1B50022E3;
      if (v23)
      {
LABEL_38:
        v25 = objc_loadWeakRetained((id *)(v23 + 16));
        v26 = 0;
LABEL_39:
        v55 = 136446978;
        v56 = "boringssl_context_certificate_request_callback_block_invoke";
        v57 = 1024;
        v58 = 1854;
        v59 = 2082;
        v60 = v27;
        v61 = 2048;
        v62 = v25;
        _os_log_impl(&dword_1B4F6D000, v21, OS_LOG_TYPE_DEFAULT, "%{public}s(%d) %{public}s[%p] Cancelled during challenge block", (uint8_t *)&v55, 0x26u);
        if ((v26 & 1) != 0)
        {
          if (!v24)
            goto LABEL_41;
        }
        else
        {

          if (!v24)
          {
LABEL_41:
            if (!v22)
              goto LABEL_78;
            goto LABEL_45;
          }
        }

        if (!v22)
        {
LABEL_78:

          return;
        }
LABEL_45:

        goto LABEL_78;
      }
    }
    v25 = 0;
    v26 = 1;
    goto LABEL_39;
  }
}

uint64_t boringssl_context_set_identity(uint64_t a1, void *a2)
{
  char *v2;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  SecIdentityRef v9;
  void *v10;
  id WeakRetained;
  void *v12;
  unsigned __int8 *v13;
  id v14;
  _BYTE *v15;
  _BOOL4 v16;
  const __CFArray *v17;
  void *v18;
  void *v19;
  NSObject *v21;
  id v22;
  void *v23;
  id v24;
  int v25;
  const char *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  if (!a1)
    goto LABEL_17;
  if (*(_DWORD *)a1 != -1252936367 || (v5 = *(_QWORD *)(a1 + 8)) == 0)
  {
LABEL_16:
    a1 = 0;
    goto LABEL_17;
  }
  if (!SSL_has_server_raw_public_key_certificate(*(_QWORD *)(v5 + 400)))
  {
    v17 = boringssl_identity_create_from_identity(v4);
    v18 = *(void **)(v5 + 104);
    *(_QWORD *)(v5 + 104) = v17;

    v19 = *(void **)(v5 + 104);
    if (v19)
    {
      a1 = boringssl_context_install_identity(a1, v19);
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  v6 = v4;
  v7 = v6;
  if (*(_DWORD *)a1 == -1252936367
    && (v8 = *(_QWORD *)(a1 + 8)) != 0
    && (v9 = boringssl_identity_create_from_identity_without_certificates(v6),
        v10 = *(void **)(v8 + 104),
        *(_QWORD *)(v8 + 104) = v9,
        v10,
        *(_QWORD *)(v8 + 104)))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v8 + 16));
    if (!WeakRetained
      || (v12 = WeakRetained,
          v13 = (unsigned __int8 *)objc_loadWeakRetained((id *)(v8 + 16)),
          v2 = (char *)v13[475],
          v13,
          v12,
          (v2 & 1) == 0))
    {
      v14 = objc_loadWeakRetained((id *)(v8 + 16));
      if (v14)
      {
        v15 = objc_loadWeakRetained((id *)(v8 + 16));
        v16 = (v15[475] & 1) == 0;

      }
      else
      {
        v16 = 1;
      }

      if (v16)
      {
        if (g_boringssl_log)
        {
          v21 = (id)g_boringssl_log;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            v22 = objc_loadWeakRetained((id *)(v8 + 16));
            if (v22)
            {
              v2 = (char *)objc_loadWeakRetained((id *)(v8 + 16));
              v23 = v2 + 391;
            }
            else
            {
              v23 = &unk_1B50022E3;
            }
            v24 = objc_loadWeakRetained((id *)(v8 + 16));
            v25 = 136446978;
            v26 = "boringssl_context_set_identity_without_certificates";
            v27 = 1024;
            v28 = 2055;
            v29 = 2082;
            v30 = v23;
            v31 = 2048;
            v32 = v24;
            _os_log_impl(&dword_1B4F6D000, v21, OS_LOG_TYPE_INFO, "%{public}s(%d) %{public}s[%p] Calling SSL_set_private_key_method", (uint8_t *)&v25, 0x26u);

            if (v22)
          }

        }
      }
    }
    SSL_set_private_key_method(*(_QWORD *)(v8 + 400), (uint64_t)g_boringssl_private_key_methods);
    a1 = 1;
  }
  else
  {
    a1 = 0;
  }

LABEL_17:
  return a1;
}

uint64_t boringssl_context_set_identity_from_array(uint64_t a1, const __CFArray *a2)
{
  uint64_t result;
  uint64_t v4;
  const __CFArray *v5;
  void *v6;
  void *v7;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (*(_DWORD *)a1 != -1252936367)
    return 0xFFFFFFFFLL;
  result = 0xFFFFFFFFLL;
  if (a2)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4)
    {
      if (*(_QWORD *)(v4 + 400))
      {
        v5 = boringssl_identity_create_from_identity_array(a2);
        v6 = *(void **)(v4 + 104);
        *(_QWORD *)(v4 + 104) = v5;

        v7 = *(void **)(v4 + 104);
        if (v7)
          return (boringssl_context_install_identity(a1, v7) - 1);
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

BOOL boringssl_context_install_identity(uint64_t a1, void *a2)
{
  id *v3;
  id *v4;
  _BOOL8 v5;
  uint64_t v6;
  id *v7;
  STACK *certificate_buffer_chain_from_certificate_chain;
  uint64_t v9;
  uint64_t *v10;
  uint64_t *v11;
  unint64_t v12;
  id *v13;
  id v14;
  void *v15;
  _BYTE *v16;
  char v17;
  id v18;
  _BYTE *v19;
  _BOOL4 v20;
  id WeakRetained;
  void *v22;
  _BYTE *v23;
  char v24;
  id v25;
  _BYTE *v26;
  _BOOL4 v27;
  id v28;
  void *v29;
  _BYTE *v30;
  char v31;
  id v32;
  _BYTE *v33;
  _BOOL4 v34;
  NSObject *v35;
  id v36;
  void *v37;
  NSObject *v38;
  id v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  unint64_t error;
  int v45;
  const char *v46;
  id v47;
  void *v48;
  _BYTE *v49;
  char v50;
  id v51;
  _BYTE *v52;
  _BOOL4 v53;
  NSObject *v54;
  id v55;
  id v56;
  void *v57;
  const char *v58;
  char *v59;
  char *v60;
  void *v61;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  int v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  id v69;
  __int16 v70;
  _QWORD v71[3];

  v71[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (*(_DWORD *)a1 != -1252936367)
    goto LABEL_39;
  v5 = 0;
  if (!v3)
    goto LABEL_40;
  v6 = *(_QWORD *)(a1 + 8);
  if (!v6)
    goto LABEL_40;
  if (!*(_QWORD *)(v6 + 400))
  {
LABEL_39:
    v5 = 0;
    goto LABEL_40;
  }
  v7 = boringssl_identity_copy_certificate_chain(v3);
  certificate_buffer_chain_from_certificate_chain = (STACK *)boringssl_helper_create_certificate_buffer_chain_from_certificate_chain(v7);

  if (!certificate_buffer_chain_from_certificate_chain)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 16));
    if (WeakRetained)
    {
      v22 = WeakRetained;
      v23 = objc_loadWeakRetained((id *)(v6 + 16));
      v24 = v23[475];

      if ((v24 & 1) != 0)
        goto LABEL_39;
    }
    v25 = objc_loadWeakRetained((id *)(v6 + 16));
    if (v25)
    {
      v26 = objc_loadWeakRetained((id *)(v6 + 16));
      v27 = (v26[475] & 1) == 0;

    }
    else
    {
      v27 = 1;
    }

    v5 = 0;
    if (!v27 || !g_boringssl_log)
      goto LABEL_40;
    v38 = (id)g_boringssl_log;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      boringssl_context_install_identity_cold_1(v6 + 16, v38);
LABEL_38:

    goto LABEL_39;
  }
  v9 = sk_num(certificate_buffer_chain_from_certificate_chain);
  v10 = (uint64_t *)malloc_type_malloc(8 * v9, 0x8B6A8A63uLL);
  if (!v10)
  {
    sk_pop_free_ex((unint64_t *)certificate_buffer_chain_from_certificate_chain, (void (*)(uint64_t))sk_CRYPTO_BUFFER_call_free_func_0, (uint64_t)CRYPTO_BUFFER_free);
    v28 = objc_loadWeakRetained((id *)(v6 + 16));
    if (v28)
    {
      v29 = v28;
      v30 = objc_loadWeakRetained((id *)(v6 + 16));
      v31 = v30[475];

      if ((v31 & 1) != 0)
        goto LABEL_39;
    }
    v32 = objc_loadWeakRetained((id *)(v6 + 16));
    if (v32)
    {
      v33 = objc_loadWeakRetained((id *)(v6 + 16));
      v34 = (v33[475] & 1) == 0;

    }
    else
    {
      v34 = 1;
    }

    v5 = 0;
    if (!v34 || !g_boringssl_log)
      goto LABEL_40;
    v38 = (id)g_boringssl_log;
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      boringssl_context_install_identity_cold_2(v6 + 16, v38);
    goto LABEL_38;
  }
  v11 = v10;
  if (sk_num(certificate_buffer_chain_from_certificate_chain))
  {
    v12 = 0;
    do
    {
      v11[v12] = (uint64_t)sk_value(certificate_buffer_chain_from_certificate_chain, v12);
      ++v12;
    }
    while (v12 < sk_num(certificate_buffer_chain_from_certificate_chain));
  }
  v13 = (id *)(v6 + 16);
  v14 = objc_loadWeakRetained((id *)(v6 + 16));
  if (!v14
    || (v15 = v14,
        v16 = objc_loadWeakRetained((id *)(v6 + 16)),
        v17 = v16[475],
        v16,
        v15,
        (v17 & 1) == 0))
  {
    v18 = objc_loadWeakRetained((id *)(v6 + 16));
    if (v18)
    {
      v19 = objc_loadWeakRetained((id *)(v6 + 16));
      v20 = (v19[475] & 1) == 0;

    }
    else
    {
      v20 = 1;
    }

    if (v20)
    {
      if (g_boringssl_log)
      {
        v35 = (id)g_boringssl_log;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          v36 = objc_loadWeakRetained((id *)(v6 + 16));
          if (v36)
          {
            v60 = (char *)objc_loadWeakRetained((id *)(v6 + 16));
            v37 = v60 + 391;
          }
          else
          {
            v37 = &unk_1B50022E3;
          }
          v40 = objc_loadWeakRetained((id *)(v6 + 16));
          *(_DWORD *)buf = 136447234;
          v63 = "boringssl_context_install_identity";
          v64 = 1024;
          v65 = 2014;
          v66 = 2082;
          v67 = v37;
          v68 = 2048;
          v69 = v40;
          v70 = 2048;
          v71[0] = sk_num(certificate_buffer_chain_from_certificate_chain);
          _os_log_impl(&dword_1B4F6D000, v35, OS_LOG_TYPE_INFO, "%{public}s(%d) %{public}s[%p] Calling SSL_set_chain_and_key with %zu certificates", buf, 0x30u);

          if (v36)
        }

      }
    }
  }
  v41 = *(_QWORD *)(v6 + 400);
  v42 = sk_num(certificate_buffer_chain_from_certificate_chain);
  v43 = SSL_set_chain_and_key(v41, v11, v42, 0, (uint64_t)g_boringssl_private_key_methods);
  v5 = v43 != 0;
  if (!v43)
  {
    error = ERR_get_error();
    v45 = error;
    v46 = ERR_reason_error_string(error);
    v47 = objc_loadWeakRetained((id *)(v6 + 16));
    if (!v47
      || (v48 = v47,
          v49 = objc_loadWeakRetained((id *)(v6 + 16)),
          v50 = v49[475],
          v49,
          v48,
          (v50 & 1) == 0))
    {
      v51 = objc_loadWeakRetained(v13);
      if (v51)
      {
        v52 = objc_loadWeakRetained(v13);
        v53 = (v52[475] & 1) == 0;

      }
      else
      {
        v53 = 1;
      }

      if (v53)
      {
        if (g_boringssl_log)
        {
          v54 = (id)g_boringssl_log;
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            v55 = objc_loadWeakRetained(v13);
            if (v55)
            {
              v59 = (char *)objc_loadWeakRetained(v13);
              v61 = v59 + 391;
            }
            else
            {
              v61 = &unk_1B50022E3;
            }
            v56 = objc_loadWeakRetained(v13);
            v57 = v56;
            *(_DWORD *)buf = 136447490;
            v63 = "boringssl_context_install_identity";
            if (v46)
              v58 = v46;
            else
              v58 = (const char *)&unk_1B50022E3;
            v64 = 1024;
            v65 = 2019;
            v66 = 2082;
            v67 = v61;
            v68 = 2048;
            v69 = v56;
            v70 = 1024;
            LODWORD(v71[0]) = v45;
            WORD2(v71[0]) = 2080;
            *(_QWORD *)((char *)v71 + 6) = v58;
            _os_log_error_impl(&dword_1B4F6D000, v54, OS_LOG_TYPE_ERROR, "%{public}s(%d) %{public}s[%p] SSL_set_chain_and_key failed: %d %s", buf, 0x36u);

            if (v55)
          }

        }
      }
    }
  }
  sk_pop_free_ex((unint64_t *)certificate_buffer_chain_from_certificate_chain, (void (*)(uint64_t))sk_CRYPTO_BUFFER_call_free_func_0, (uint64_t)CRYPTO_BUFFER_free);
  free(v11);
LABEL_40:

  return v5;
}

uint64_t boringssl_context_set_temporary_identity(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void **v6;
  void *v7;
  id *v8;
  const __CFArray *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*(_DWORD *)a1 == -1252936367)
    {
      v5 = *(_QWORD *)(a1 + 8);
      if (v5)
      {
        if (v3)
        {
          v7 = *(void **)(v5 + 104);
          v6 = (void **)(v5 + 104);
          v8 = v6 + 1;
          objc_storeStrong(v6 + 1, v7);
          v9 = boringssl_identity_create_from_identity(v4);
          v10 = *v6;
          *v6 = v9;

          if (*v6 && boringssl_context_install_identity(a1, *v6))
          {
            a1 = 1;
            goto LABEL_12;
          }
          objc_storeStrong(v6, *v8);
          v11 = *v8;
          *v8 = 0;

        }
        else
        {
          v12 = *(void **)(v5 + 112);
          if (v12)
          {
            objc_storeStrong((id *)(v5 + 104), v12);
            v13 = *(void **)(v5 + 112);
            *(_QWORD *)(v5 + 112) = 0;

            a1 = boringssl_context_install_identity(a1, *(void **)(v5 + 104));
            goto LABEL_12;
          }
        }
      }
    }
    a1 = 0;
  }
LABEL_12:

  return a1;
}

BOOL boringssl_context_set_external_identity(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  boringssl_concrete_boringssl_identity *v16;
  void *v17;
  void *v18;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (!a1 || *(_DWORD *)a1 != -1252936367)
    goto LABEL_10;
  v14 = 0;
  if (v12)
  {
    if (v11)
    {
      if (v10)
      {
        if (v9)
        {
          v15 = *(_QWORD *)(a1 + 8);
          if (v15)
          {
            v16 = boringssl_identity_create_from_external_identity(v9, v10, v11, v12);
            v17 = *(void **)(v15 + 104);
            *(_QWORD *)(v15 + 104) = v16;

            v18 = *(void **)(v15 + 104);
            if (v18)
            {
              v14 = boringssl_context_install_identity(a1, v18);
              goto LABEL_11;
            }
LABEL_10:
            v14 = 0;
          }
        }
      }
    }
  }
LABEL_11:

  return v14;
}

uint64_t __boringssl_context_message_handler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 216), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

uint64_t __boringssl_context_update_encryption_level_block_invoke_213(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 548), 0);
}

uint64_t __boringssl_context_update_encryption_level_block_invoke_215(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 552), 1);
}

uint64_t boringssl_context_ssl_context_create_datagram(uint64_t a1, int a2)
{
  uint64_t v3;
  id WeakRetained;
  id *v6;
  id v7;
  uint64_t v8;
  SSL_METHOD *v10;
  uint64_t v11;
  char v12;

  if (!a1)
    return 1;
  if (*(_DWORD *)a1 != -1252936367)
    return 1;
  v3 = *(_QWORD *)(a1 + 8);
  if (!v3)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)(v3 + 16));

  if (WeakRetained)
  {
    v6 = (id *)objc_loadWeakRetained((id *)(v3 + 16));
    v7 = v6[41];

  }
  else
  {
    v7 = 0;
  }
  v10 = (SSL_METHOD *)DTLS_with_buffers_method();
  v11 = boringssl_context_restore_ssl_context((void *)v3, v7, v10);
  *(_QWORD *)(v3 + 408) = v11;
  if (a2)
    v12 = 48;
  else
    v12 = 32;
  *(_BYTE *)(v3 + 556) = v12 | *(_BYTE *)(v3 + 556) & 0xCF;
  if (v11)
    v8 = boringssl_context_configure_defaults(a1);
  else
    v8 = 0;

  return v8;
}

BOOL __boringssl_context_zlib_compress_data_block_invoke(uint64_t a1, const void *a2, size_t a3)
{
  char *v3;
  int v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  _BYTE *v9;
  char v10;
  uint64_t v11;
  id v12;
  _BYTE *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _BYTE *v17;
  char v18;
  uint64_t v19;
  id v20;
  _BYTE *v21;
  NSObject *v22;
  uint64_t v23;
  _BOOL4 v24;
  id v25;
  char v26;
  void *v27;
  char v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = CBB_add_bytes(*(_QWORD *)(a1 + 32), a2, a3);
  v6 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    if (!v6)
      goto LABEL_14;
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 16));
    if (WeakRetained)
    {
      v8 = WeakRetained;
      v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
      v10 = v9[475];

      if ((v10 & 1) != 0)
        return v5 != 0;
    }
    v11 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      v12 = objc_loadWeakRetained((id *)(v11 + 16));
      if (v12)
      {
        v13 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
        v14 = (v13[475] & 1) == 0;

      }
      else
      {
        v14 = 1;
      }

      if (!(_DWORD)v14)
        return v5 != 0;
    }
    else
    {
LABEL_14:
      v14 = 1;
    }
    if (g_boringssl_log)
    {
      v22 = (id)g_boringssl_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        v23 = *(_QWORD *)(a1 + 40);
        if (v23)
        {
          v14 = (uint64_t)objc_loadWeakRetained((id *)(v23 + 16));
          v31 = *(_QWORD *)(a1 + 40);
          if (v14)
          {
            v24 = v31 != 0;
            if (v31)
            {
              v3 = (char *)objc_loadWeakRetained((id *)(v31 + 16));
              v31 = *(_QWORD *)(a1 + 40);
            }
            else
            {
              v3 = 0;
            }
            v27 = v3 + 391;
          }
          else
          {
            v24 = 0;
            v27 = &unk_1B50022E3;
          }
          if (v31)
          {
            v25 = objc_loadWeakRetained((id *)(v31 + 16));
            v26 = 0;
          }
          else
          {
            v25 = 0;
            v26 = 1;
          }
        }
        else
        {
          v24 = 0;
          v25 = 0;
          v26 = 1;
          v27 = &unk_1B50022E3;
        }
        v33 = 136446978;
        v34 = "boringssl_context_zlib_compress_data_block_invoke";
        v35 = 1024;
        v36 = 740;
        v37 = 2082;
        v38 = v27;
        v39 = 2048;
        v40 = v25;
        _os_log_debug_impl(&dword_1B4F6D000, v22, OS_LOG_TYPE_DEBUG, "%{public}s(%d) %{public}s[%p] Wrote compressed certificate data", (uint8_t *)&v33, 0x26u);
        if ((v26 & 1) != 0)
          goto LABEL_45;
        goto LABEL_44;
      }
      goto LABEL_26;
    }
  }
  else
  {
    if (!v6)
      goto LABEL_15;
    v15 = objc_loadWeakRetained((id *)(v6 + 16));
    if (v15)
    {
      v16 = v15;
      v17 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
      v18 = v17[475];

      if ((v18 & 1) != 0)
        return v5 != 0;
    }
    v19 = *(_QWORD *)(a1 + 40);
    if (v19)
    {
      v20 = objc_loadWeakRetained((id *)(v19 + 16));
      if (v20)
      {
        v21 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 16));
        v14 = (v21[475] & 1) == 0;

      }
      else
      {
        v14 = 1;
      }

      if (!(_DWORD)v14)
        return v5 != 0;
    }
    else
    {
LABEL_15:
      v14 = 1;
    }
    if (g_boringssl_log)
    {
      v22 = (id)g_boringssl_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = *(_QWORD *)(a1 + 40);
        if (v23)
        {
          v14 = (uint64_t)objc_loadWeakRetained((id *)(v23 + 16));
          v32 = *(_QWORD *)(a1 + 40);
          if (v14)
          {
            v24 = v32 != 0;
            if (v32)
            {
              v3 = (char *)objc_loadWeakRetained((id *)(v32 + 16));
              v32 = *(_QWORD *)(a1 + 40);
            }
            else
            {
              v3 = 0;
            }
            v30 = v3 + 391;
          }
          else
          {
            v24 = 0;
            v30 = &unk_1B50022E3;
          }
          if (v32)
          {
            v25 = objc_loadWeakRetained((id *)(v32 + 16));
            v29 = 0;
          }
          else
          {
            v25 = 0;
            v29 = 1;
          }
        }
        else
        {
          v24 = 0;
          v25 = 0;
          v29 = 1;
          v30 = &unk_1B50022E3;
        }
        v33 = 136446978;
        v34 = "boringssl_context_zlib_compress_data_block_invoke";
        v35 = 1024;
        v36 = 737;
        v37 = 2082;
        v38 = v30;
        v39 = 2048;
        v40 = v25;
        _os_log_error_impl(&dword_1B4F6D000, v22, OS_LOG_TYPE_ERROR, "%{public}s(%d) %{public}s[%p] CBB_add_bytes failed", (uint8_t *)&v33, 0x26u);
        if ((v29 & 1) != 0)
          goto LABEL_45;
LABEL_44:

LABEL_45:
        if (v24)

        if (v23)
      }
LABEL_26:

    }
  }
  return v5 != 0;
}

uint64_t sk_CRYPTO_BUFFER_call_free_func_0(uint64_t (*a1)(uint64_t), uint64_t a2)
{
  return a1(a2);
}

uint64_t __boringssl_context_restore_ssl_context_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  id v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  _BYTE *v10;
  char v11;
  uint64_t v12;
  id v13;
  _BYTE *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v18;
  _BOOL4 v19;
  id v20;
  char v21;
  void *v22;
  uint64_t v23;
  int v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!boringssl_context_state_is_context_state((_BOOL8)v5))
  {
    v7 = *(_QWORD *)(a1 + 32);
    if (!v7)
      goto LABEL_8;
    WeakRetained = objc_loadWeakRetained((id *)(v7 + 16));
    if (WeakRetained)
    {
      v9 = WeakRetained;
      v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      v11 = v10[475];

      if ((v11 & 1) != 0)
        goto LABEL_14;
    }
    v12 = *(_QWORD *)(a1 + 32);
    if (v12)
    {
      v13 = objc_loadWeakRetained((id *)(v12 + 16));
      if (v13)
      {
        v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
        v15 = (v14[475] & 1) == 0;

      }
      else
      {
        v15 = 1;
      }

      if (!(_DWORD)v15)
        goto LABEL_14;
    }
    else
    {
LABEL_8:
      v15 = 1;
    }
    if (!g_boringssl_log)
    {
LABEL_14:

      v6 = 0;
      goto LABEL_15;
    }
    v16 = (id)g_boringssl_log;
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
LABEL_13:

      goto LABEL_14;
    }
    v18 = *(_QWORD *)(a1 + 32);
    if (v18)
    {
      v15 = (uint64_t)objc_loadWeakRetained((id *)(v18 + 16));
      v23 = *(_QWORD *)(a1 + 32);
      if (v15)
      {
        v19 = v23 != 0;
        if (v23)
        {
          v3 = (char *)objc_loadWeakRetained((id *)(v23 + 16));
          v23 = *(_QWORD *)(a1 + 32);
        }
        else
        {
          v3 = 0;
        }
        v22 = v3 + 391;
      }
      else
      {
        v19 = 0;
        v22 = &unk_1B50022E3;
      }
      if (v23)
      {
        v20 = objc_loadWeakRetained((id *)(v23 + 16));
        v21 = 0;
      }
      else
      {
        v20 = 0;
        v21 = 1;
      }
    }
    else
    {
      v19 = 0;
      v20 = 0;
      v21 = 1;
      v22 = &unk_1B50022E3;
    }
    v24 = 136446978;
    v25 = "boringssl_context_restore_ssl_context_block_invoke";
    v26 = 1024;
    v27 = 2616;
    v28 = 2082;
    v29 = v22;
    v30 = 2048;
    v31 = v20;
    _os_log_error_impl(&dword_1B4F6D000, v16, OS_LOG_TYPE_ERROR, "%{public}s(%d) %{public}s[%p] Cached context state is invalid.", (uint8_t *)&v24, 0x26u);
    if ((v21 & 1) != 0)
    {
      if (!v19)
        goto LABEL_29;
    }
    else
    {

      if (!v19)
      {
LABEL_29:
        if (!v18)
          goto LABEL_13;
        goto LABEL_33;
      }
    }

    if (!v18)
      goto LABEL_13;
LABEL_33:

    goto LABEL_13;
  }
LABEL_15:
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = boringssl_context_state_get_ssl_ctx((uint64_t)v6);

  return 0;
}

uint64_t boringssl_context_error_print(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id *v5;
  id WeakRetained;
  void *v7;
  _BYTE *v8;
  char v9;
  id v10;
  _BYTE *v11;
  _BOOL4 v12;
  uint64_t result;
  NSObject *v14;

  if (!a3)
    return 0;
  if (*(_DWORD *)a3 != -1252936367)
    return 0;
  v3 = *(_QWORD *)(a3 + 8);
  if (!v3)
    return 0;
  v5 = (id *)(v3 + 16);
  WeakRetained = objc_loadWeakRetained((id *)(v3 + 16));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v8 = objc_loadWeakRetained(v5);
    v9 = v8[475];

    if ((v9 & 1) != 0)
      return 1;
  }
  v10 = objc_loadWeakRetained(v5);
  if (v10)
  {
    v11 = objc_loadWeakRetained(v5);
    v12 = (v11[475] & 1) == 0;

  }
  else
  {
    v12 = 1;
  }

  result = 1;
  if (v12 && g_boringssl_log)
  {
    v14 = (id)g_boringssl_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      boringssl_context_error_print_cold_1(v5, a1, v14);

    return 1;
  }
  return result;
}

void OUTLINED_FUNCTION_20_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x36u);
}

_BYTE *x25519_ge_tobytes(_BYTE *a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _BYTE *result;
  _OWORD v8[2];
  unint64_t v9;
  _OWORD v10[2];
  unint64_t v11;
  _OWORD v12[2];
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v13 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v12[0] = v4;
  v12[1] = v4;
  v11 = 0xAAAAAAAAAAAAAAAALL;
  v10[0] = v4;
  v10[1] = v4;
  v9 = 0xAAAAAAAAAAAAAAAALL;
  v8[0] = v4;
  v8[1] = v4;
  v5 = *(_OWORD *)(a2 + 96);
  v14 = *(_OWORD *)(a2 + 80);
  v15 = v5;
  v16 = *(_QWORD *)(a2 + 112);
  fe_loose_invert((uint64_t)v12, (unint64_t *)&v14);
  fe_mul_impl((uint64_t)v10, (unint64_t *)a2, (unint64_t *)v12);
  fe_mul_impl((uint64_t)v8, (unint64_t *)(a2 + 40), (unint64_t *)v12);
  fe_tobytes(a1, v8);
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14 = v6;
  v15 = v6;
  result = fe_tobytes(&v14, v10);
  a1[31] ^= (_BYTE)v14 << 7;
  return result;
}

uint64_t x25519_ge_frombytes_vartime(uint64_t a1, int64x2_t *a2)
{
  int64x2_t v4;
  unint64_t *v5;
  int64x2_t v6;
  int64x2_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int64x2_t v16;
  int64x2_t v17;
  int64x2_t v18[2];
  unint64_t v19;
  int64x2_t v20[2];
  unint64_t v21;
  int64x2_t v22[2];
  unint64_t v23;
  int64x2_t v24[2];
  unint64_t v25;
  int64x2_t v26[2];
  unint64_t v27;
  _OWORD v28[2];
  unint64_t v29;
  _OWORD v30[2];
  unint64_t v31;
  int64x2_t v32;
  int64x2_t v33;
  unint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v27 = 0xAAAAAAAAAAAAAAAALL;
  v4.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v4.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  v26[0] = v4;
  v26[1] = v4;
  v25 = 0xAAAAAAAAAAAAAAAALL;
  v24[0] = v4;
  v24[1] = v4;
  v23 = 0xAAAAAAAAAAAAAAAALL;
  v22[0] = v4;
  v22[1] = v4;
  v21 = 0xAAAAAAAAAAAAAAAALL;
  v20[0] = v4;
  v20[1] = v4;
  v5 = (unint64_t *)(a1 + 40);
  v19 = 0xAAAAAAAAAAAAAAAALL;
  v18[0] = v4;
  v18[1] = v4;
  v6 = a2[1];
  v32 = *a2;
  v33 = v6;
  v33.i8[15] = v6.i8[15] & 0x7F;
  fe_frombytes_strict((unint64_t *)(a1 + 40), (unsigned int *)&v32);
  *(_OWORD *)(a1 + 80) = 0u;
  *(_QWORD *)(a1 + 112) = 0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_QWORD *)(a1 + 80) = 1;
  fe_sq_tt((uint64_t)v22, v5);
  fe_mul_impl((uint64_t)v20, (unint64_t *)v22, d);
  fe_sub(v24, v22, (int64x2_t *)(a1 + 80));
  fe_carry((unint64_t *)v26, v24);
  fe_add(v24, v20, (int64x2_t *)(a1 + 80));
  fe_mul_impl((uint64_t)v22, (unint64_t *)v26, (unint64_t *)v24);
  v34 = 0xAAAAAAAAAAAAAAAALL;
  v7.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v7.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  v32 = v7;
  v33 = v7;
  v31 = 0xAAAAAAAAAAAAAAAALL;
  v30[0] = v7;
  v30[1] = v7;
  v29 = 0xAAAAAAAAAAAAAAAALL;
  v28[0] = v7;
  v28[1] = v7;
  fe_sq_tt((uint64_t)&v32, (unint64_t *)v22);
  fe_sq_tt((uint64_t)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
  fe_mul_impl((uint64_t)v30, (unint64_t *)v22, (unint64_t *)v30);
  fe_mul_impl((uint64_t)&v32, (unint64_t *)&v32, (unint64_t *)v30);
  fe_sq_tt((uint64_t)&v32, (unint64_t *)&v32);
  fe_mul_impl((uint64_t)&v32, (unint64_t *)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)v30, (unint64_t *)&v32);
  v8 = 4;
  do
  {
    fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
    --v8;
  }
  while (v8);
  fe_mul_impl((uint64_t)&v32, (unint64_t *)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)v30, (unint64_t *)&v32);
  v9 = 9;
  do
  {
    fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
    --v9;
  }
  while (v9);
  fe_mul_impl((uint64_t)v30, (unint64_t *)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)v28, (unint64_t *)v30);
  v10 = 19;
  do
  {
    fe_sq_tt((uint64_t)v28, (unint64_t *)v28);
    --v10;
  }
  while (v10);
  fe_mul_impl((uint64_t)v30, (unint64_t *)v28, (unint64_t *)v30);
  fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
  v11 = 9;
  do
  {
    fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
    --v11;
  }
  while (v11);
  fe_mul_impl((uint64_t)&v32, (unint64_t *)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)v30, (unint64_t *)&v32);
  v12 = 49;
  do
  {
    fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
    --v12;
  }
  while (v12);
  fe_mul_impl((uint64_t)v30, (unint64_t *)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)v28, (unint64_t *)v30);
  v13 = 99;
  do
  {
    fe_sq_tt((uint64_t)v28, (unint64_t *)v28);
    --v13;
  }
  while (v13);
  fe_mul_impl((uint64_t)v30, (unint64_t *)v28, (unint64_t *)v30);
  fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
  v14 = 49;
  do
  {
    fe_sq_tt((uint64_t)v30, (unint64_t *)v30);
    --v14;
  }
  while (v14);
  fe_mul_impl((uint64_t)&v32, (unint64_t *)v30, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)&v32, (unint64_t *)&v32);
  fe_sq_tt((uint64_t)&v32, (unint64_t *)&v32);
  fe_mul_impl(a1, (unint64_t *)&v32, (unint64_t *)v22);
  fe_mul_impl(a1, (unint64_t *)a1, (unint64_t *)v26);
  fe_sq_tt((uint64_t)v20, (unint64_t *)a1);
  fe_mul_impl((uint64_t)v20, (unint64_t *)v20, (unint64_t *)v24);
  fe_sub(v18, v20, v26);
  if (fe_isnonzero(v18))
  {
    fe_add(v18, v20, v26);
    if (fe_isnonzero(v18))
      return 0;
    fe_mul_impl(a1, (unint64_t *)a1, sqrtm1);
  }
  v16.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v16.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  v32 = v16;
  v33 = v16;
  fe_tobytes(&v32, (_QWORD *)a1);
  if ((v32.i8[0] & 1) != a2[1].u8[15] >> 7)
  {
    v34 = 0xAAAAAAAAAAAAAAAALL;
    v17.i64[0] = 0xAAAAAAAAAAAAAAAALL;
    v17.i64[1] = 0xAAAAAAAAAAAAAAAALL;
    v32 = v17;
    v33 = v17;
    fe_neg(&v32, (int64x2_t *)a1);
    fe_carry((unint64_t *)a1, &v32);
  }
  fe_mul_impl(a1 + 120, (unint64_t *)a1, v5);
  return 1;
}

BOOL fe_isnonzero(_QWORD *a1)
{
  __int128 v1;
  __int128 v2;
  _OWORD v4[2];
  unint64_t v5;
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v5 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v4[0] = v1;
  v4[1] = v1;
  fe_carry((unint64_t *)v4, a1);
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v2;
  v6[1] = v2;
  fe_tobytes(v6, v4);
  return CRYPTO_memcmp((char *)v6, fe_isnonzero_zero, 32) != 0;
}

uint64_t x25519_ge_p3_to_cached(uint64_t a1, uint64_t a2)
{
  int64x2_t *v4;
  __int128 v5;
  __int128 v6;

  v4 = (int64x2_t *)(a2 + 40);
  fe_add((int64x2_t *)a1, (int64x2_t *)(a2 + 40), (int64x2_t *)a2);
  fe_sub((int64x2_t *)(a1 + 40), v4, (int64x2_t *)a2);
  v5 = *(_OWORD *)(a2 + 80);
  v6 = *(_OWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 96) = v6;
  return fe_mul_impl(a1 + 120, (unint64_t *)(a2 + 120), d2);
}

int64x2_t *x25519_ge_add(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  int64x2_t v6;
  int64x2_t *v7;
  int64x2_t v9[2];
  unint64_t v10;
  int64x2_t v11[2];
  unint64_t v12;
  int64x2_t v13[2];
  unint64_t v14;
  int64x2_t v15[2];
  unint64_t v16;

  v16 = 0xAAAAAAAAAAAAAAAALL;
  v6.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v6.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  v15[0] = v6;
  v15[1] = v6;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v13[0] = v6;
  v13[1] = v6;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  v11[0] = v6;
  v11[1] = v6;
  v7 = (int64x2_t *)(a2 + 40);
  v10 = 0xAAAAAAAAAAAAAAAALL;
  v9[0] = v6;
  v9[1] = v6;
  fe_add((int64x2_t *)a1, (int64x2_t *)(a2 + 40), (int64x2_t *)a2);
  fe_sub((int64x2_t *)(a1 + 40), v7, (int64x2_t *)a2);
  fe_mul_impl((uint64_t)v11, (unint64_t *)a1, a3);
  fe_mul_impl((uint64_t)v13, (unint64_t *)(a1 + 40), a3 + 5);
  fe_mul_impl((uint64_t)v9, a3 + 15, (unint64_t *)(a2 + 120));
  fe_mul_impl((uint64_t)v15, (unint64_t *)(a2 + 80), a3 + 10);
  fe_add((int64x2_t *)(a1 + 120), v15, v15);
  fe_sub((int64x2_t *)a1, v11, v13);
  fe_add((int64x2_t *)(a1 + 40), v11, v13);
  fe_carry((unint64_t *)v11, (_QWORD *)(a1 + 120));
  fe_add((int64x2_t *)(a1 + 80), v11, v9);
  return fe_sub((int64x2_t *)(a1 + 120), v11, v9);
}

int64x2_t *x25519_ge_sub(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  int64x2_t v6;
  int64x2_t *v7;
  int64x2_t v9[2];
  unint64_t v10;
  int64x2_t v11[2];
  unint64_t v12;
  int64x2_t v13[2];
  unint64_t v14;
  int64x2_t v15[2];
  unint64_t v16;

  v16 = 0xAAAAAAAAAAAAAAAALL;
  v6.i64[0] = 0xAAAAAAAAAAAAAAAALL;
  v6.i64[1] = 0xAAAAAAAAAAAAAAAALL;
  v15[0] = v6;
  v15[1] = v6;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v13[0] = v6;
  v13[1] = v6;
  v12 = 0xAAAAAAAAAAAAAAAALL;
  v11[0] = v6;
  v11[1] = v6;
  v7 = (int64x2_t *)(a2 + 40);
  v10 = 0xAAAAAAAAAAAAAAAALL;
  v9[0] = v6;
  v9[1] = v6;
  fe_add((int64x2_t *)a1, (int64x2_t *)(a2 + 40), (int64x2_t *)a2);
  fe_sub((int64x2_t *)(a1 + 40), v7, (int64x2_t *)a2);
  fe_mul_impl((uint64_t)v11, (unint64_t *)a1, a3 + 5);
  fe_mul_impl((uint64_t)v13, (unint64_t *)(a1 + 40), a3);
  fe_mul_impl((uint64_t)v9, a3 + 15, (unint64_t *)(a2 + 120));
  fe_mul_impl((uint64_t)v15, (unint64_t *)(a2 + 80), a3 + 10);
  fe_add((int64x2_t *)(a1 + 120), v15, v15);
  fe_sub((int64x2_t *)a1, v11, v13);
  fe_add((int64x2_t *)(a1 + 40), v11, v13);
  fe_carry((unint64_t *)v11, (_QWORD *)(a1 + 120));
  fe_sub((int64x2_t *)(a1 + 80), v11, v9);
  return fe_add((int64x2_t *)(a1 + 120), v11, v9);
}

double ge_p2_0(uint64_t a1)
{
  double result;

  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 1;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  *(_QWORD *)(a1 + 80) = 1;
  return result;
}

unsigned __int16 *x25519_sc_reduce(unsigned __int16 *result)
{
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  uint64_t v79;
  unint64_t v80;
  int64_t v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  int64_t v88;
  uint64_t v89;
  int64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;

  v1 = *(unsigned int *)((char *)result + 15);
  v2 = *((unsigned int *)result + 9);
  v3 = (v2 >> 24) | ((unint64_t)*((unsigned __int8 *)result + 40) << 8) | ((unint64_t)*((unsigned __int8 *)result + 41) << 16);
  v4 = ((unint64_t)(HIBYTE(*((_DWORD *)result + 11)) | (*((unsigned __int8 *)result + 48) << 8) | (*((unsigned __int8 *)result + 49) << 16)) >> 2) & 0x1FFFFF;
  v5 = ((unint64_t)*(unsigned int *)((char *)result + 49) >> 7) & 0x1FFFFF;
  v6 = ((unint64_t)*((unsigned int *)result + 13) >> 4) & 0x1FFFFF;
  v7 = ((unint64_t)(HIBYTE(*((_DWORD *)result + 13)) | (*((unsigned __int8 *)result + 56) << 8) | (*((unsigned __int8 *)result + 57) << 16)) >> 1) & 0x1FFFFF;
  v8 = ((v1 >> 6) & 0x1FFFFF) + 666643 * v4;
  v9 = (*(unsigned __int16 *)((char *)result + 21) | ((unint64_t)(*((_BYTE *)result + 23) & 0x1F) << 16))
     + 470296 * v5
     + 666643 * v6
     + 654183 * v4;
  v10 = (((v1 >> 24) | ((unint64_t)*((unsigned __int8 *)result + 19) << 8) | ((unint64_t)*((unsigned __int8 *)result + 20) << 16)) >> 3)
      + 666643 * v5
      + 470296 * v4
      + ((unint64_t)(v8 + 0x100000) >> 21);
  v11 = (((unint64_t)*(unsigned int *)((char *)result + 23) >> 5) & 0x1FFFFF)
      + 654183 * v5
      + 470296 * v6
      - 997805 * (int)v4
      + 666643 * v7
      + ((v9 + 0x100000) >> 21);
  v12 = (((unint64_t)(HIBYTE(*(_DWORD *)((char *)result + 23)) | (*((unsigned __int8 *)result + 27) << 8) | (*((unsigned __int8 *)result + 28) << 16)) >> 2) & 0x1FFFFF)
      - 997805 * (int)v5
      + 654183 * v6
      + 136657 * v4;
  v13 = (((unint64_t)*((unsigned int *)result + 7) >> 7) & 0x1FFFFF)
      + 136657 * v5
      - 997805 * (int)v6
      - 683901 * (int)v4;
  v14 = (((unint64_t)*(unsigned int *)((char *)result + 31) >> 4) & 0x1FFFFF)
      - 683901 * (int)v5
      + 136657 * v6;
  v15 = (((unint64_t)(HIBYTE(*(_DWORD *)((char *)result + 31)) | (*((unsigned __int8 *)result + 35) << 8) | (*((unsigned __int8 *)result + 36) << 16)) >> 1) & 0x1FFFFF)
      - 683901 * (int)v6;
  v16 = (unint64_t)*((unsigned int *)result + 15) >> 3;
  v17 = ((v2 >> 6) & 0x1FFFFF) - 997805 * (int)v16;
  v18 = (v3 >> 3) + 136657 * v16;
  v19 = (result[21] | ((unint64_t)(result[22] & 0x1F) << 16)) - 683901 * (int)v16;
  v20 = v14 + 470296 * v16;
  v21 = v13 + 666643 * v16;
  v22 = v15 + 654183 * v16;
  v23 = ((unint64_t)*(unsigned int *)((char *)result + 57) >> 6) & 0x1FFFFF;
  v24 = v18 - 683901 * (int)v23;
  v25 = v17 + 136657 * v23 - 683901 * (int)v7;
  v26 = v20 + 654183 * v23 - 997805 * (int)v7;
  v27 = v12 + 666643 * v23 + 470296 * v7;
  v28 = v21 + 470296 * v23;
  v29 = v22 - 997805 * (int)v23;
  v30 = v28 + 654183 * v7 + ((v27 + 0x100000) >> 21);
  v31 = v29 + 136657 * v7 + ((v26 + 0x100000) >> 21);
  v32 = v26 - ((v26 + 0x100000) & 0xFFFFFFFFFFE00000);
  v33 = v24 + ((v25 + 0x100000) >> 21);
  v34 = (((unint64_t)*((unsigned int *)result + 11) >> 5) & 0x1FFFFF) + ((uint64_t)(v19 + 0x100000) >> 21);
  v35 = v9 - ((v9 + 0x100000) & 0xFFFFFE00000) + ((v10 + 0x100000) >> 21);
  v36 = v10 - ((v10 + 0x100000) & 0x7FFFFFFFFFE00000);
  v37 = v32 + ((v30 + 0x100000) >> 21);
  v38 = v30 - ((v30 + 0x100000) & 0xFFFFFFFFFFE00000);
  v39 = v25 - ((v25 + 0x100000) & 0xFFFFFFFFFFE00000) + ((v31 + 0x100000) >> 21);
  v40 = v31 - ((v31 + 0x100000) & 0xFFFFFFFFFFE00000);
  v41 = v19 - ((v19 + 0x100000) & 0xFFFFFFFFFFE00000) + ((v33 + 0x100000) >> 21);
  v42 = v33 - ((v33 + 0x100000) & 0xFFFFFFFFFFE00000);
  v43 = (((unint64_t)*(unsigned int *)((char *)result + 7) >> 7) & 0x1FFFFF) + 666643 * v42;
  v44 = (((unint64_t)*(unsigned int *)(result + 5) >> 4) & 0x1FFFFF) + 666643 * v41 + 470296 * v42;
  v45 = (((unint64_t)(HIBYTE(*(_DWORD *)(result + 5)) | (*((unsigned __int8 *)result + 14) << 8) | (*((unsigned __int8 *)result + 15) << 16)) >> 1) & 0x1FFFFF)
      + 666643 * v34
      + 470296 * v41
      + 654183 * v42;
  v46 = v8 - ((v8 + 0x100000) & 0x7FFFFE00000) + 470296 * v34 + 654183 * v41 - 997805 * v42;
  v47 = v36 + 654183 * v34 - 997805 * v41 + 136657 * v42;
  v48 = v35 - 997805 * v34 + 136657 * v41 - 683901 * v42;
  v49 = (((unint64_t)(HIBYTE(*(_DWORD *)(result + 1)) | (*((unsigned __int8 *)result + 6) << 8) | (*((unsigned __int8 *)result + 7) << 16)) >> 2) & 0x1FFFFF)
      + 666643 * v39;
  v50 = v43 + 470296 * v39;
  v51 = v44 + 654183 * v39;
  v52 = v45 - 997805 * v39;
  v53 = v46 + 136657 * v39;
  v54 = v47 - 683901 * v39;
  v55 = (((unint64_t)*(unsigned int *)(result + 1) >> 5) & 0x1FFFFF) + 666643 * v40;
  v56 = v49 + 470296 * v40;
  v57 = v50 + 654183 * v40;
  v58 = v51 - 997805 * v40;
  v59 = v52 + 136657 * v40;
  v60 = v53 - 683901 * v40;
  v61 = v27 - 683901 * v34 - ((v27 + 0x100000) & 0xFFFFFFFFFFE00000) + ((uint64_t)(v11 + 0x100000) >> 21);
  v62 = (*result | ((unint64_t)(result[1] & 0x1F) << 16)) + 666643 * v37;
  v63 = v56 + 654183 * v37;
  v64 = v58 + 136657 * v37;
  v65 = v55 + 470296 * v37 + ((uint64_t)(v62 + 0x100000) >> 21);
  v66 = v54 + ((uint64_t)(v60 + 0x100000) >> 21);
  v67 = v11 + 136657 * v34 - ((v11 + 0x100000) & 0xFFFFFFFFFFE00000) - 683901 * v41 + ((v48 + 0x100000) >> 21);
  v68 = v48 - ((v48 + 0x100000) & 0xFFFFFFFFFFE00000);
  v69 = v38 + ((uint64_t)(v61 + 0x100000) >> 21);
  v70 = v61 - ((v61 + 0x100000) & 0xFFFFFFFFFFE00000);
  v71 = v65 + 0x100000;
  v72 = v70 + ((uint64_t)(v67 + 0x100000) >> 21);
  v73 = v67 - ((v67 + 0x100000) & 0xFFFFFFFFFFE00000);
  v74 = (uint64_t)(v69 + 0x100000) >> 21;
  v75 = v65 + 470296 * v74 - ((v65 + 0x100000) & 0xFFFFFFFFFFE00000);
  v76 = v57 - 997805 * v37 + ((uint64_t)(v63 + 0x100000) >> 21);
  v77 = v63 + 654183 * v74 - ((v63 + 0x100000) & 0xFFFFFFFFFFE00000) + (v71 >> 21);
  v78 = v76 - 997805 * v74 - ((v76 + 0x100000) & 0xFFFFFFFFFFE00000);
  v79 = v59 - 683901 * v37 + ((uint64_t)(v64 + 0x100000) >> 21);
  v80 = v64 + 136657 * v74 - ((v64 + 0x100000) & 0xFFFFFFFFFFE00000) + ((v76 + 0x100000) >> 21);
  v81 = v62 - ((v62 + 0x100000) & 0xFFFFFFFFFFE00000) + 666643 * v74;
  v82 = v79 - 683901 * v74;
  v79 += 0x100000;
  v83 = v60 - ((v60 + 0x100000) & 0xFFFFFFFFFFE00000) + (v79 >> 21);
  v84 = v75 + (v81 >> 21);
  v85 = v77 + (v84 >> 21);
  v86 = v78 + (v85 >> 21);
  v87 = v80 + (v86 >> 21);
  v88 = v82 - (v79 & 0xFFFFFFFFFFE00000) + (v87 >> 21);
  v89 = v83 + (v88 >> 21);
  v90 = v66 - ((v66 + 0x100000) & 0xFFFFFFFFFFE00000) + (v89 >> 21);
  v91 = v68 + ((uint64_t)(v66 + 0x100000) >> 21) + (v90 >> 21);
  v92 = v73 + (v91 >> 21);
  v93 = v72 + (v92 >> 21);
  v94 = v69 - ((v69 + 0x100000) & 0xFFFFFFFFFFE00000) + (v93 >> 21);
  v95 = (v81 & 0x1FFFFF) + 666643 * (v94 >> 21);
  *((_BYTE *)result + 1) = (unsigned __int16)(v81 + 11283 * (v94 >> 21)) >> 8;
  v96 = (v84 & 0x1FFFFF) + 470296 * (v94 >> 21) + (v95 >> 21);
  *(_BYTE *)result = v81 + 19 * (v94 >> 21);
  *((_BYTE *)result + 2) = ((unint64_t)((v81 & 0x1FFFFF) + 666643 * (v94 >> 21)) >> 16) & 0x1F | (32 * (v84 + 24 * (v94 >> 21) + (v95 >> 21)));
  *((_BYTE *)result + 3) = (unint64_t)v96 >> 3;
  *((_BYTE *)result + 4) = (unint64_t)v96 >> 11;
  v97 = (v85 & 0x1FFFFF) + 654183 * (v94 >> 21) + (v96 >> 21);
  *((_BYTE *)result + 5) = (v96 >> 19) & 3 | (4 * (v85 + 103 * (v94 >> 21) + (v96 >> 21)));
  *((_BYTE *)result + 6) = (unint64_t)v97 >> 6;
  v98 = (v86 & 0x1FFFFF) - 997805 * (v94 >> 21) + (v97 >> 21);
  *((_BYTE *)result + 7) = (v97 >> 14) & 0x7F | (((_BYTE)v86
                                                              - -83 * (v94 >> 21)
                                                              + (v97 >> 21)) << 7);
  *((_BYTE *)result + 8) = (unint64_t)v98 >> 1;
  *((_BYTE *)result + 9) = (unint64_t)v98 >> 9;
  v99 = (v87 & 0x1FFFFF) + 136657 * (v94 >> 21) + (v98 >> 21);
  *((_BYTE *)result + 10) = (v98 >> 17) & 0xF | (16 * (v87 - 47 * (v94 >> 21) + (v98 >> 21)));
  *((_BYTE *)result + 11) = (unint64_t)v99 >> 4;
  *((_BYTE *)result + 12) = (unint64_t)v99 >> 12;
  v100 = (v88 & 0x1FFFFF) - 683901 * (v94 >> 21) + (v99 >> 21);
  *((_BYTE *)result + 13) = ((v99 & 0x100000) != 0) | (2 * (v88 - 125 * (v94 >> 21) + (v99 >> 21)));
  *((_BYTE *)result + 14) = (unint64_t)v100 >> 7;
  v101 = (v89 & 0x1FFFFF) + (v100 >> 21);
  *((_BYTE *)result + 15) = (v100 >> 15) & 0x3F | (((_BYTE)v89 + (v100 >> 21)) << 6);
  *((_BYTE *)result + 16) = (unint64_t)v101 >> 2;
  *((_BYTE *)result + 17) = (unint64_t)v101 >> 10;
  v102 = (v90 & 0x1FFFFF) + (v101 >> 21);
  *((_BYTE *)result + 18) = (v101 >> 18) & 7 | (8 * (v66 + (v89 >> 21) + (v101 >> 21)));
  *((_BYTE *)result + 19) = (unint64_t)v102 >> 5;
  *((_BYTE *)result + 20) = (unint64_t)v102 >> 13;
  *((_BYTE *)result + 22) = (unsigned __int16)(v91 + (v102 >> 21)) >> 8;
  v103 = (v92 & 0x1FFFFF) + (((v91 & 0x1FFFFF) + (v102 >> 21)) >> 21);
  *((_BYTE *)result + 21) = v91 + (v102 >> 21);
  *((_BYTE *)result + 23) = ((unint64_t)((v91 & 0x1FFFFF) + (v102 >> 21)) >> 16) & 0x1F | (32 * v103);
  *((_BYTE *)result + 24) = (unint64_t)v103 >> 3;
  *((_BYTE *)result + 25) = (unint64_t)v103 >> 11;
  v104 = (v93 & 0x1FFFFF) + (v103 >> 21);
  *((_BYTE *)result + 26) = (v103 >> 19) & 3 | (4 * v104);
  *((_BYTE *)result + 27) = (unint64_t)v104 >> 6;
  v105 = (v94 & 0x1FFFFF) + (v104 >> 21);
  *((_BYTE *)result + 28) = (v104 >> 14) & 0x7F | ((_BYTE)v105 << 7);
  *((_BYTE *)result + 29) = v105 >> 1;
  *((_BYTE *)result + 30) = v105 >> 9;
  *((_BYTE *)result + 31) = v105 >> 17;
  return result;
}

double ED25519_keypair(uint64_t a1, _OWORD *a2)
{
  __int128 v4;
  double result;
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v4;
  v6[1] = v4;
  RAND_bytes((unsigned __int8 *)v6, 32);
  *(_QWORD *)&result = ED25519_keypair_from_seed(a1, a2, (unsigned __int8 *)v6).n128_u64[0];
  return result;
}

__n128 ED25519_keypair_from_seed(uint64_t a1, _OWORD *a2, unsigned __int8 *d)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __n128 result;
  __int128 v10;
  __int128 v11[10];
  unsigned __int8 md[16];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14 = v6;
  v15 = v6;
  *(_OWORD *)md = v6;
  v13 = v6;
  SHA512(d, 0x20uLL, md);
  md[0] &= 0xF8u;
  HIBYTE(v13) = HIBYTE(v13) & 0x3F | 0x40;
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11[8] = v7;
  v11[9] = v7;
  v11[6] = v7;
  v11[7] = v7;
  v11[4] = v7;
  v11[5] = v7;
  v11[2] = v7;
  v11[3] = v7;
  v11[0] = v7;
  v11[1] = v7;
  x25519_ge_scalarmult_base(v11, (int8x16_t *)md);
  x25519_ge_tobytes((_BYTE *)a1, (uint64_t)v11);
  v8 = *((_OWORD *)d + 1);
  *a2 = *(_OWORD *)d;
  a2[1] = v8;
  result = *(__n128 *)a1;
  v10 = *(_OWORD *)(a1 + 16);
  a2[2] = *(_OWORD *)a1;
  a2[3] = v10;
  return result;
}

uint64_t ED25519_sign(_BYTE *a1, const void *a2, size_t a3, unsigned __int8 *d)
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  unint64_t v81;
  unint64_t v82;
  unint64_t v83;
  unint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  unint64_t v94;
  unint64_t v95;
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  unint64_t v100;
  unint64_t v101;
  unint64_t v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  unint64_t v108;
  unint64_t v109;
  uint64_t v110;
  unint64_t v111;
  unint64_t v112;
  unint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  int64_t v117;
  unint64_t v118;
  int64_t v119;
  uint64_t v120;
  int64_t v121;
  int64_t v122;
  int64_t v123;
  int64_t v124;
  int64_t v125;
  int64_t v126;
  int64_t v127;
  int64_t v128;
  uint64_t v129;
  int64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  unint64_t v142;
  unint64_t v144;
  unint64_t v145;
  unint64_t v146;
  unint64_t v147;
  unint64_t v148;
  unint64_t v149;
  unint64_t v150;
  unint64_t v151;
  unint64_t v152;
  unint64_t v153;
  __int128 v154[10];
  _BYTE v155[32];
  __int128 v156;
  __int128 v157;
  _BYTE v158[32];
  __int128 v159;
  __int128 v160;
  SHA512_CTX c;
  _BYTE md[32];
  _OWORD v163[2];
  uint64_t v164;

  v164 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v163[0] = v8;
  v163[1] = v8;
  *(_OWORD *)md = v8;
  *(_OWORD *)&md[16] = v8;
  SHA512(d, 0x20uLL, md);
  md[0] &= 0xF8u;
  md[31] = md[31] & 0x3F | 0x40;
  *(_QWORD *)&c.num = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.u.p[96] = v9;
  *(_OWORD *)&c.u.p[112] = v9;
  *(_OWORD *)&c.u.p[64] = v9;
  *(_OWORD *)&c.u.p[80] = v9;
  *(_OWORD *)&c.u.p[32] = v9;
  *(_OWORD *)&c.u.p[48] = v9;
  *(_OWORD *)c.u.d = v9;
  *(_OWORD *)&c.u.p[16] = v9;
  *(_OWORD *)&c.h[6] = v9;
  *(_OWORD *)&c.Nl = v9;
  *(_OWORD *)&c.h[2] = v9;
  *(_OWORD *)&c.h[4] = v9;
  *(_OWORD *)c.h = v9;
  SHA512_Init(&c);
  SHA512_Update(&c, v163, 0x20uLL);
  SHA512_Update(&c, a2, a3);
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v159 = v10;
  v160 = v10;
  *(_OWORD *)v158 = v10;
  *(_OWORD *)&v158[16] = v10;
  SHA512_Final(v158, &c);
  x25519_sc_reduce((unsigned __int16 *)v158);
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v154[8] = v11;
  v154[9] = v11;
  v154[6] = v11;
  v154[7] = v11;
  v154[4] = v11;
  v154[5] = v11;
  v154[2] = v11;
  v154[3] = v11;
  v154[0] = v11;
  v154[1] = v11;
  x25519_ge_scalarmult_base(v154, (int8x16_t *)v158);
  x25519_ge_tobytes(a1, (uint64_t)v154);
  SHA512_Init(&c);
  SHA512_Update(&c, a1, 0x20uLL);
  SHA512_Update(&c, d + 32, 0x20uLL);
  SHA512_Update(&c, a2, a3);
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v156 = v12;
  v157 = v12;
  *(_OWORD *)v155 = v12;
  *(_OWORD *)&v155[16] = v12;
  SHA512_Final(v155, &c);
  x25519_sc_reduce((unsigned __int16 *)v155);
  v13 = *(unsigned __int16 *)v155 | ((v155[2] & 0x1F) << 16);
  v14 = *(unsigned __int16 *)&v155[21] | ((v155[23] & 0x1F) << 16);
  v15 = *(unsigned __int16 *)md | ((md[2] & 0x1F) << 16);
  v16 = *(unsigned __int16 *)&md[21] | ((md[23] & 0x1F) << 16);
  v17 = ((unint64_t)*(unsigned int *)&v155[2] >> 5) & 0x1FFFFF;
  v18 = ((unint64_t)(v155[5] | (v155[6] << 8) | (v155[7] << 16)) >> 2) & 0x1FFFFF;
  v19 = ((unint64_t)*(unsigned int *)&md[2] >> 5) & 0x1FFFFF;
  v20 = ((unint64_t)(md[5] | (md[6] << 8) | (md[7] << 16)) >> 2) & 0x1FFFFF;
  v153 = v19 * v17
       + v15 * (unint64_t)v18
       + v20 * v13
       + (((unint64_t)(v158[5] | (v158[6] << 8) | (v158[7] << 16)) >> 2) & 0x1FFFFF);
  v21 = ((unint64_t)*(unsigned int *)&v155[7] >> 7) & 0x1FFFFF;
  v22 = ((unint64_t)*(unsigned int *)&v155[10] >> 4) & 0x1FFFFF;
  v23 = ((unint64_t)*(unsigned int *)&md[7] >> 7) & 0x1FFFFF;
  v24 = ((unint64_t)*(unsigned int *)&md[10] >> 4) & 0x1FFFFF;
  v25 = v19 * (unint64_t)v21
      + v15 * v22
      + v23 * (unint64_t)v17
      + v13 * (unint64_t)v24
      + v20 * (unint64_t)v18
      + (((unint64_t)*(unsigned int *)&v158[10] >> 4) & 0x1FFFFF);
  v26 = ((unint64_t)(v155[13] | (v155[14] << 8) | (v155[15] << 16)) >> 1) & 0x1FFFFF;
  v27 = ((unint64_t)*(unsigned int *)&v155[15] >> 6) & 0x1FFFFF;
  v28 = ((unint64_t)*(unsigned int *)&md[15] >> 6) & 0x1FFFFF;
  v29 = ((unint64_t)(md[13] | (md[14] << 8) | (md[15] << 16)) >> 1) & 0x1FFFFF;
  v151 = v26 * (unint64_t)v19
       + v15 * (unint64_t)v27
       + v23 * (unint64_t)v21
       + v18 * (unint64_t)v24
       + v20 * (unint64_t)v22
       + v13 * (unint64_t)v28
       + v29 * (unint64_t)v17
       + (((unint64_t)*(unsigned int *)&v158[15] >> 6) & 0x1FFFFF);
  v30 = (v155[18] | ((unint64_t)v155[19] << 8) | ((unint64_t)v155[20] << 16)) >> 3;
  v31 = (md[18] | ((unint64_t)md[19] << 8) | ((unint64_t)md[20] << 16)) >> 3;
  v150 = v30 * (unint64_t)v19
       + v15 * (unint64_t)v14
       + v26 * (unint64_t)v23
       + v24 * (unint64_t)v22
       + v20 * (unint64_t)v27
       + v18 * (unint64_t)v28
       + v29 * (unint64_t)v21
       + v31 * (unint64_t)v17
       + v16 * (unint64_t)v13
       + *(unsigned __int16 *)&v158[21]
       + ((unint64_t)(v158[23] & 0x1F) << 16);
  v32 = ((unint64_t)*(unsigned int *)&v155[23] >> 5) & 0x1FFFFF;
  v33 = ((unint64_t)(HIBYTE(*(_DWORD *)&v155[23]) | (v155[27] << 8) | (v155[28] << 16)) >> 2) & 0x1FFFFF;
  v34 = ((unint64_t)*(unsigned int *)&md[23] >> 5) & 0x1FFFFF;
  v35 = ((unint64_t)(HIBYTE(*(_DWORD *)&md[23]) | (md[27] << 8) | (md[28] << 16)) >> 2) & 0x1FFFFF;
  v149 = v19 * v32
       + v15 * v33
       + v30 * (unint64_t)v23
       + v24 * (unint64_t)v27
       + v20 * (unint64_t)v14
       + v28 * (unint64_t)v22
       + v29 * (unint64_t)v26
       + v31 * (unint64_t)v21
       + v34 * v17
       + v16 * (unint64_t)v18
       + v35 * v13
       + (((unint64_t)(HIBYTE(*(_DWORD *)&v158[23]) | (v158[27] << 8) | (v158[28] << 16)) >> 2) & 0x1FFFFF);
  v36 = (*(unsigned __int16 *)v158 | ((unint64_t)(v158[2] & 0x1F) << 16)) + v15 * (unint64_t)v13;
  v37 = v13 * (unint64_t)v19
      + v15 * (unint64_t)v17
      + (((unint64_t)*(unsigned int *)&v158[2] >> 5) & 0x1FFFFF)
      + ((v36 + 0x100000) >> 21);
  v152 = v36 - ((v36 + 0x100000) & 0xFFFFFE00000);
  v38 = v18 * (unint64_t)v19
      + v15 * (unint64_t)v21
      + v13 * (unint64_t)v23
      + v20 * (unint64_t)v17
      + (((unint64_t)*(unsigned int *)&v158[7] >> 7) & 0x1FFFFF);
  v147 = v19 * (unint64_t)v22
       + v15 * (unint64_t)v26
       + v18 * (unint64_t)v23
       + v24 * (unint64_t)v17
       + v20 * (unint64_t)v21
       + v29 * (unint64_t)v13
       + ((v25 + 0x100000) >> 21)
       + (((unint64_t)(v158[13] | (v158[14] << 8) | (v158[15] << 16)) >> 1) & 0x1FFFFF);
  v39 = v25 - ((v25 + 0x100000) & 0xFFFFFFFFFFE00000);
  v145 = v19 * (unint64_t)v27
       + v15 * (unint64_t)v30
       + v23 * (unint64_t)v22
       + v24 * (unint64_t)v21
       + v20 * (unint64_t)v26
       + v28 * (unint64_t)v17
       + v29 * (unint64_t)v18
       + v31 * (unint64_t)v13
       + ((v158[18] | ((unint64_t)v158[19] << 8) | ((unint64_t)v158[20] << 16)) >> 3);
  v144 = v14 * (unint64_t)v19
       + v15 * (unint64_t)v32
       + v23 * (unint64_t)v27
       + v26 * (unint64_t)v24
       + v20 * (unint64_t)v30
       + v28 * (unint64_t)v21
       + v29 * (unint64_t)v22
       + v31 * (unint64_t)v18
       + v13 * (unint64_t)v34
       + v16 * (unint64_t)v17
       + (((unint64_t)*(unsigned int *)&v158[23] >> 5) & 0x1FFFFF);
  v40 = (unint64_t)*(unsigned int *)&v155[28] >> 7;
  v41 = v33 * (unint64_t)v19 + v15 * (unint64_t)v40;
  v42 = (unint64_t)*(unsigned int *)&md[28] >> 7;
  v43 = v41
      + v14 * (unint64_t)v23
      + v30 * (unint64_t)v24
      + v20 * (unint64_t)v32
      + v26 * (unint64_t)v28
      + v29 * (unint64_t)v27
      + v31 * (unint64_t)v22
      + v18 * (unint64_t)v34
      + v16 * (unint64_t)v21
      + v13 * (unint64_t)v42;
  v44 = v19 * (unint64_t)v40
      + v23 * (unint64_t)v32
      + v14 * (unint64_t)v24
      + v20 * (unint64_t)v33
      + v28 * (unint64_t)v27
      + v29 * (unint64_t)v30
      + v31 * (unint64_t)v26
      + v34 * (unint64_t)v21
      + v16 * (unint64_t)v22
      + v42 * (unint64_t)v17;
  v45 = v43
      + v35 * (unint64_t)v17
      + ((unint64_t)*(unsigned int *)&v158[28] >> 7);
  v46 = v44 + v35 * (unint64_t)v18;
  v47 = v23 * (unint64_t)v40
      + v33 * (unint64_t)v24
      + v14 * (unint64_t)v28
      + v29 * (unint64_t)v32
      + v31 * (unint64_t)v30
      + v26 * (unint64_t)v34
      + v16 * (unint64_t)v27
      + v42 * (unint64_t)v21;
  v48 = v33 * (unint64_t)v23
      + v24 * (unint64_t)v32
      + v20 * (unint64_t)v40
      + v30 * (unint64_t)v28
      + v29 * (unint64_t)v14
      + v31 * (unint64_t)v27
      + v34 * (unint64_t)v22
      + v16 * (unint64_t)v26
      + v18 * (unint64_t)v42
      + v35 * (unint64_t)v21;
  v49 = v31 * (unint64_t)v40
      + v34 * (unint64_t)v32
      + v16 * (unint64_t)v33
      + v30 * (unint64_t)v42
      + v35 * (unint64_t)v14;
  v50 = v33 * (unint64_t)v34
      + v16 * (unint64_t)v40
      + v14 * (unint64_t)v42
      + v35 * (unint64_t)v32
      + ((v49 + 0x100000) >> 21);
  v51 = v47 + v35 * (unint64_t)v22;
  v52 = v24 * (unint64_t)v40
      + v28 * (unint64_t)v32
      + v29 * (unint64_t)v33
      + v31 * (unint64_t)v14
      + v34 * (unint64_t)v27
      + v16 * (unint64_t)v30
      + v42 * (unint64_t)v22;
  v53 = v33 * (unint64_t)v28
      + v29 * (unint64_t)v40
      + v31 * (unint64_t)v32
      + v30 * (unint64_t)v34
      + v16 * (unint64_t)v14
      + v26 * (unint64_t)v42;
  v54 = v28 * (unint64_t)v40
      + v31 * (unint64_t)v33
      + v14 * (unint64_t)v34;
  v55 = v38 + ((v153 + 0x100000) >> 21);
  v56 = v48 + ((v46 + 0x100000) >> 21);
  v57 = v53 + v35 * (unint64_t)v27;
  v58 = v52 + v35 * (unint64_t)v26 + ((v51 + 0x100000) >> 21);
  v59 = v54
      + v16 * (unint64_t)v32
      + v42 * (unint64_t)v27
      + v35 * (unint64_t)v30
      + ((v57 + 0x100000) >> 21);
  v60 = v34 * (unint64_t)v40
      + v42 * (unint64_t)v32
      + v35 * (unint64_t)v33;
  v61 = v33 * (unint64_t)v42
      + v35 * (unint64_t)v40
      + ((v60 + 0x100000) >> 21);
  v62 = v42 * (unint64_t)v40;
  v63 = (v62 + 0x100000) >> 21;
  v64 = v37 + 0x100000;
  v146 = v37 - ((v37 + 0x100000) & 0xFFFFFFFFFFE00000);
  v148 = v39 + ((v55 + 0x100000) >> 21);
  v65 = v49 - ((v49 + 0x100000) & 0xFFFFFFFFFFE00000) + ((v59 + 0x100000) >> 21);
  v66 = v59 - ((v59 + 0x100000) & 0xFFFFFFFFFFE00000);
  v67 = v60 - ((v60 + 0x100000) & 0x1FFFFFFE00000) + ((v50 + 0x100000) >> 21);
  v68 = v50 - ((v50 + 0x100000) & 0xFFFFFFFFFFE00000);
  v69 = v62 - ((v62 + 0x100000) & 0x7FFFFFFE00000) + ((v61 + 0x100000) >> 21);
  v70 = v61 - ((v61 + 0x100000) & 0x1FFFFFFE00000);
  v71 = v57 - 683901 * (int)v63 - ((v57 + 0x100000) & 0xFFFFFFFFFFE00000);
  v72 = v51 - 997805 * (int)v63 - ((v51 + 0x100000) & 0xFFFFFFFFFFE00000);
  v73 = v46 + 470296 * v63 - ((v46 + 0x100000) & 0xFFFFFFFFFFE00000);
  v74 = v145 + ((v151 + 0x100000) >> 21);
  v75 = v144 + ((v150 + 0x100000) >> 21);
  v76 = 666643 * v67
      + 470296 * v68
      + 654183 * v65
      + v150
      + ((v74 + 0x100000) >> 21)
      - ((v150 + 0x100000) & 0xFFFFFFFFFFE00000);
  v77 = v45 + ((v149 + 0x100000) >> 21);
  v78 = 666643 * v69
      + 470296 * v70
      + 654183 * v67
      - 997805 * v68
      + 136657 * v65
      + ((v75 + 0x100000) >> 21)
      + v149
      - ((v149 + 0x100000) & 0xFFFFFFFFFFE00000);
  v79 = 666643 * v68 + 470296 * v65 + v74 - ((v74 + 0x100000) & 0xFFFFFFFFFFE00000);
  v80 = 666643 * v70 + 470296 * v67 + 654183 * v68 - 997805 * v65 + v75 - ((v75 + 0x100000) & 0xFFFFFFFFFFE00000);
  v81 = v73 + 654183 * v69 - 997805 * v70 + 136657 * v67 - 683901 * v68 + ((v77 + 0x100000) >> 21);
  v82 = 470296 * v69
      + 666643 * v63
      + 654183 * v70
      - 997805 * v67
      + 136657 * v68
      - 683901 * v65
      + v77
      - ((v77 + 0x100000) & 0xFFFFFFFFFFE00000);
  v83 = v72 + ((v56 + 0x100000) >> 21);
  v84 = v56
      + 654183 * v63
      - ((v56 + 0x100000) & 0xFFFFFFFFFFE00000)
      - 997805 * v69
      + 136657 * v70
      - 683901 * v67
      + ((uint64_t)(v81 + 0x100000) >> 21);
  v85 = v58 + 136657 * v63;
  v58 += 0x100000;
  v86 = v71 + (v58 >> 21);
  v87 = v151 + 666643 * v65 - ((v151 + 0x100000) & 0xFFFFFFFFFFE00000) + ((v147 + 0x100000) >> 21);
  v88 = v80 + ((uint64_t)(v76 + 0x100000) >> 21);
  v89 = v83 + 136657 * v69 - 683901 * v70;
  v90 = v82 + ((uint64_t)(v78 + 0x100000) >> 21);
  v91 = v85 - (v58 & 0xFFFFFFFFFFE00000) - 683901 * v69 + ((v89 + 0x100000) >> 21);
  v92 = v66 + ((uint64_t)(v86 + 0x100000) >> 21);
  v93 = v86 - ((v86 + 0x100000) & 0xFFFFFFFFFFE00000);
  v94 = v81 - ((v81 + 0x100000) & 0xFFFFFFFFFFE00000) + ((uint64_t)(v90 + 0x100000) >> 21);
  v95 = v90 - ((v90 + 0x100000) & 0xFFFFFFFFFFE00000);
  v96 = v89 - ((v89 + 0x100000) & 0xFFFFFFFFFFE00000) + ((uint64_t)(v84 + 0x100000) >> 21);
  v97 = v84 - ((v84 + 0x100000) & 0xFFFFFFFFFFE00000);
  v98 = v93 + ((uint64_t)(v91 + 0x100000) >> 21);
  v99 = v91 - ((v91 + 0x100000) & 0xFFFFFFFFFFE00000);
  v100 = v78 - 683901 * v92 + ((uint64_t)(v88 + 0x100000) >> 21) - ((v78 + 0x100000) & 0xFFFFFFFFFFE00000);
  v101 = v79 + ((uint64_t)(v87 + 0x100000) >> 21);
  v102 = -997805 * v92
       + 136657 * v98
       - 683901 * v99
       + v76
       + ((uint64_t)(v101 + 0x100000) >> 21)
       - ((v76 + 0x100000) & 0xFFFFFFFFFFE00000);
  v103 = v87 + 470296 * v92 - ((v87 + 0x100000) & 0xFFFFFFFFFFE00000);
  v104 = v152 + 666643 * v94;
  v105 = v146 + 470296 * v94 + 666643 * v97 + ((uint64_t)(v104 + 0x100000) >> 21);
  v106 = v103 + 654183 * v98 - 997805 * v99 + 136657 * v96 - 683901 * v97;
  v107 = v101
       + 654183 * v92
       - 997805 * v98
       + 136657 * v99
       - ((v101 + 0x100000) & 0xFFFFFFFFFFE00000)
       - 683901 * v96
       + ((v106 + 0x100000) >> 21);
  v108 = 136657 * v92
       - 683901 * v98
       + v88
       - ((v88 + 0x100000) & 0xFFFFFFFFFFE00000)
       + ((uint64_t)(v102 + 0x100000) >> 21);
  v109 = v95 + ((uint64_t)(v100 + 0x100000) >> 21);
  v110 = (uint64_t)(v109 + 0x100000) >> 21;
  v111 = v153 + (v64 >> 21) - ((v153 + 0x100000) & 0xFFFFFFFFFFE00000) + 654183 * v94 + 666643 * v96 + 470296 * v97;
  v112 = v55
       - ((v55 + 0x100000) & 0xFFFFFFFFFFE00000)
       + 666643 * v99
       - 997805 * v94
       + 470296 * v96
       + 654183 * v97
       + ((uint64_t)(v111 + 0x100000) >> 21);
  v113 = v147 + 666643 * v92 - ((v147 + 0x100000) & 0xFFFFFFFFFFE00000) + 470296 * v98 + 654183 * v99 - 683901 * v94;
  v114 = v148 + 666643 * v98 + 470296 * v99 + 136657 * v94 + 654183 * v96 - 997805 * v97;
  v115 = v113 - 997805 * v96 + 136657 * v97 + ((v114 + 0x100000) >> 21);
  v116 = v100 + ((uint64_t)(v108 + 0x100000) >> 21);
  v117 = v104 - ((v104 + 0x100000) & 0xFFFFFFFFFFE00000) + 666643 * v110;
  v118 = (v100 + 0x100000) & 0xFFFFFFFFFFE00000;
  v119 = v105 + 470296 * v110 - ((v105 + 0x100000) & 0xFFFFFFFFFFE00000) + (v117 >> 21);
  v120 = v117 & 0x1FFFFF;
  v121 = v111 + 654183 * v110 - ((v111 + 0x100000) & 0xFFFFFFFFFFE00000) + ((v105 + 0x100000) >> 21) + (v119 >> 21);
  v122 = v112 - 997805 * v110 - ((v112 + 0x100000) & 0xFFFFFFFFFFE00000) + (v121 >> 21);
  v123 = v114
       + 136657 * v110
       - ((v114 + 0x100000) & 0xFFFFFFFFFFE00000)
       + ((uint64_t)(v112 + 0x100000) >> 21)
       + (v122 >> 21);
  v124 = v115 - 683901 * v110 - ((v115 + 0x100000) & 0xFFFFFFFFFFE00000) + (v123 >> 21);
  v125 = v106 - ((v106 + 0x100000) & 0xFFFFFFFFFFE00000) + ((v115 + 0x100000) >> 21) + (v124 >> 21);
  v126 = v107 - ((v107 + 0x100000) & 0xFFFFFFFFFFE00000) + (v125 >> 21);
  v127 = v102 - ((v102 + 0x100000) & 0xFFFFFFFFFFE00000) + ((uint64_t)(v107 + 0x100000) >> 21) + (v126 >> 21);
  v128 = v108 - ((v108 + 0x100000) & 0xFFFFFFFFFFE00000) + (v127 >> 21);
  v129 = v116 - v118 + (v128 >> 21);
  v130 = v109 - ((v109 + 0x100000) & 0xFFFFFFFFFFE00000) + (v129 >> 21);
  v131 = v120 + 666643 * (v130 >> 21);
  a1[33] = BYTE1(v131);
  v132 = (v119 & 0x1FFFFF) + 470296 * (v130 >> 21) + (v131 >> 21);
  a1[32] = v131;
  a1[34] = ((v120 + 666643 * (v130 >> 21)) >> 16) & 0x1F | (32
                                                                                      * (v119
                                                                                       + 24 * (v130 >> 21)
                                                                                       + (v131 >> 21)));
  a1[35] = (unint64_t)v132 >> 3;
  a1[36] = (unint64_t)v132 >> 11;
  v133 = (v121 & 0x1FFFFF) + 654183 * (v130 >> 21) + (v132 >> 21);
  a1[37] = (v132 >> 19) & 3 | (4 * (v121 + 103 * (v130 >> 21) + (v132 >> 21)));
  a1[38] = (unint64_t)v133 >> 6;
  v134 = (v122 & 0x1FFFFF) - 997805 * (v130 >> 21) + (v133 >> 21);
  a1[39] = (v133 >> 14) & 0x7F | (((_BYTE)v112
                                               - -83 * (_BYTE)v110
                                               + (v121 >> 21)
                                               - -83 * (v130 >> 21)
                                               + (v133 >> 21)) << 7);
  a1[40] = (unint64_t)v134 >> 1;
  a1[41] = (unint64_t)v134 >> 9;
  v135 = (v123 & 0x1FFFFF) + 136657 * (v130 >> 21) + (v134 >> 21);
  a1[42] = (v134 >> 17) & 0xF | (16 * (v123 - 47 * (v130 >> 21) + (v134 >> 21)));
  a1[43] = (unint64_t)v135 >> 4;
  a1[44] = (unint64_t)v135 >> 12;
  v136 = (v124 & 0x1FFFFF) - 683901 * (v130 >> 21) + (v135 >> 21);
  a1[45] = ((v135 & 0x100000) != 0) | (2 * (v124 - 125 * (v130 >> 21) + (v135 >> 21)));
  a1[46] = (unint64_t)v136 >> 7;
  v137 = (v125 & 0x1FFFFF) + (v136 >> 21);
  a1[47] = (v136 >> 15) & 0x3F | (((_BYTE)v125 + (v136 >> 21)) << 6);
  a1[48] = (unint64_t)v137 >> 2;
  a1[49] = (unint64_t)v137 >> 10;
  v138 = (v126 & 0x1FFFFF) + (v137 >> 21);
  a1[50] = (v137 >> 18) & 7 | (8 * (v126 + (v137 >> 21)));
  a1[51] = (unint64_t)v138 >> 5;
  v139 = (v127 & 0x1FFFFF) + (v138 >> 21);
  a1[52] = (unint64_t)v138 >> 13;
  a1[54] = BYTE1(v139);
  v140 = (v128 & 0x1FFFFF) + (v139 >> 21);
  a1[53] = v139;
  a1[55] = BYTE2(v139) & 0x1F | (32 * (v128 + (v139 >> 21)));
  a1[56] = (unint64_t)v140 >> 3;
  a1[57] = (unint64_t)v140 >> 11;
  v141 = (v129 & 0x1FFFFF) + (v140 >> 21);
  a1[58] = (v140 >> 19) & 3 | (4 * v141);
  a1[59] = (unint64_t)v141 >> 6;
  v142 = (v130 & 0x1FFFFF) + (v141 >> 21);
  a1[60] = (v141 >> 14) & 0x7F | ((_BYTE)v142 << 7);
  a1[61] = v142 >> 1;
  a1[62] = v142 >> 9;
  a1[63] = v142 >> 17;
  return 1;
}

uint64_t ED25519_verify(const void *a1, size_t a2, unsigned __int8 *a3, int64x2_t *a4)
{
  int64x2_t v8;
  uint64_t result;
  int64x2_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  unint64_t v14;
  unint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  int64x2_t v19;
  int64x2_t v20;
  unsigned int v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  unint64_t *v25;
  int64x2_t v26;
  __int128 v28;
  _OWORD v29[7];
  unint64_t v30;
  int64x2_t v31[2];
  unint64_t v32;
  int64x2_t v33[7];
  _OWORD v34[3];
  _OWORD v35[10];
  int64x2_t v36[2];
  _OWORD v37[3];
  int64x2_t v38[2];
  _OWORD v39[3];
  int64x2_t v40[2];
  _OWORD v41[3];
  int64x2_t v42[2];
  _OWORD v43[3];
  int64x2_t v44;
  int64x2_t v45;
  int64x2_t v46;
  int64x2_t v47;
  int64x2_t v48;
  int64x2_t v49;
  int64x2_t v50;
  unint64_t v51;
  int64x2_t v52[2];
  unint64_t v53;
  int64x2_t v54[2];
  unint64_t v55;
  unsigned __int8 md[16];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  SHA512_CTX c;
  _OWORD v61[2];
  _OWORD v62[2];
  _OWORD __b[80];
  _OWORD v64[16];
  _OWORD v65[16];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (a3[63] <= 0x1Fu)
  {
    v8.i64[0] = 0xAAAAAAAAAAAAAAAALL;
    v8.i64[1] = 0xAAAAAAAAAAAAAAAALL;
    v34[1] = v8;
    v34[2] = v8;
    v33[6] = v8;
    v34[0] = v8;
    v33[4] = v8;
    v33[5] = v8;
    v33[2] = v8;
    v33[3] = v8;
    v33[0] = v8;
    v33[1] = v8;
    result = x25519_ge_frombytes_vartime((uint64_t)v33, a4);
    if (!(_DWORD)result)
      return result;
    v32 = 0xAAAAAAAAAAAAAAAALL;
    v10.i64[0] = 0xAAAAAAAAAAAAAAAALL;
    v10.i64[1] = 0xAAAAAAAAAAAAAAAALL;
    v31[0] = v10;
    v31[1] = v10;
    fe_neg(v31, v33);
    fe_carry((unint64_t *)v33, v31);
    fe_neg(v31, (int64x2_t *)((char *)v34 + 8));
    fe_carry((unint64_t *)v34 + 1, v31);
    v11 = 0;
    v12 = *((_OWORD *)a3 + 1);
    v62[0] = *(_OWORD *)a3;
    v62[1] = v12;
    v13 = *((_OWORD *)a3 + 3);
    v61[0] = *((_OWORD *)a3 + 2);
    v61[1] = v13;
    do
    {
      v14 = (*((unsigned __int8 *)&v61[1] + (int)v11 + 8) | ((unint64_t)*((unsigned __int8 *)&v61[1] + v11 + 9) << 8) | ((unint64_t)*((unsigned __int8 *)&v61[1] + v11 + 10) << 16) | ((unint64_t)*((unsigned __int8 *)&v61[1] + v11 + 11) << 24) | ((unint64_t)*((unsigned __int8 *)&v61[1] + v11 + 12) << 32) | ((unint64_t)*((unsigned __int8 *)&v61[1] + v11 + 13) << 40))
          + ((unint64_t)*((unsigned __int8 *)&v61[1] + v11 + 14) << 48)
          + ((unint64_t)*((unsigned __int8 *)&v61[1] + v11 + 15) << 56);
      v15 = *(_QWORD *)((char *)&ED25519_verify_kOrder + v11 + 24);
      v11 -= 8;
      if (v14 > v15)
        break;
      if (v14 < v15)
      {
        *(_QWORD *)&c.num = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&c.u.p[112] = v16;
        *(_OWORD *)&c.u.p[96] = v16;
        *(_OWORD *)&c.u.p[80] = v16;
        *(_OWORD *)&c.u.p[64] = v16;
        *(_OWORD *)&c.u.p[48] = v16;
        *(_OWORD *)&c.u.p[32] = v16;
        *(_OWORD *)&c.u.p[16] = v16;
        *(_OWORD *)c.u.d = v16;
        *(_OWORD *)&c.Nl = v16;
        *(_OWORD *)&c.h[6] = v16;
        *(_OWORD *)&c.h[4] = v16;
        *(_OWORD *)&c.h[2] = v16;
        *(_OWORD *)c.h = v16;
        SHA512_Init(&c);
        SHA512_Update(&c, a3, 0x20uLL);
        SHA512_Update(&c, a4, 0x20uLL);
        SHA512_Update(&c, a1, a2);
        *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v59 = v17;
        v58 = v17;
        v57 = v17;
        *(_OWORD *)md = v17;
        SHA512_Final(md, &c);
        x25519_sc_reduce((unsigned __int16 *)md);
        v30 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v29[5] = v18;
        v29[6] = v18;
        v29[3] = v18;
        v29[4] = v18;
        v29[1] = v18;
        v29[2] = v18;
        v29[0] = v18;
        v65[15] = v18;
        v65[14] = v18;
        v65[13] = v18;
        v65[12] = v18;
        v65[11] = v18;
        v65[10] = v18;
        v65[9] = v18;
        v65[8] = v18;
        v65[7] = v18;
        v65[6] = v18;
        v65[5] = v18;
        v65[4] = v18;
        v65[3] = v18;
        v65[2] = v18;
        v65[1] = v18;
        v65[0] = v18;
        v64[15] = v18;
        v64[14] = v18;
        v64[13] = v18;
        v64[12] = v18;
        v64[11] = v18;
        v64[10] = v18;
        v64[9] = v18;
        v64[8] = v18;
        v64[7] = v18;
        v64[6] = v18;
        v64[5] = v18;
        v64[4] = v18;
        v64[3] = v18;
        v64[2] = v18;
        v64[1] = v18;
        v64[0] = v18;
        memset(__b, 170, sizeof(__b));
        v19.i64[0] = 0xAAAAAAAAAAAAAAAALL;
        v19.i64[1] = 0xAAAAAAAAAAAAAAAALL;
        v43[1] = v19;
        v43[2] = v19;
        v42[1] = v19;
        v43[0] = v19;
        v41[2] = v19;
        v42[0] = v19;
        v41[0] = v19;
        v41[1] = v19;
        v40[0] = v19;
        v40[1] = v19;
        v39[1] = v19;
        v39[2] = v19;
        v38[1] = v19;
        v39[0] = v19;
        v37[2] = v19;
        v38[0] = v19;
        v37[0] = v19;
        v37[1] = v19;
        v36[0] = v19;
        v36[1] = v19;
        v35[8] = v19;
        v35[9] = v19;
        v35[6] = v19;
        v35[7] = v19;
        v35[4] = v19;
        v35[5] = v19;
        v35[2] = v19;
        v35[3] = v19;
        v35[0] = v19;
        v35[1] = v19;
        slide((uint64_t)v65, (uint64_t)md);
        slide((uint64_t)v64, (uint64_t)v61);
        x25519_ge_p3_to_cached((uint64_t)__b, (uint64_t)v33);
        v51 = 0xAAAAAAAAAAAAAAAALL;
        v20.i64[0] = 0xAAAAAAAAAAAAAAAALL;
        v20.i64[1] = 0xAAAAAAAAAAAAAAAALL;
        v49 = v20;
        v50 = v20;
        v47 = v20;
        v48 = v20;
        v45 = v20;
        v46 = v20;
        v44 = v20;
        ge_p3_to_p2((uint64_t)&v44, (__int128 *)v33[0].i8);
        ge_p2_dbl((uint64_t)v40, (uint64_t)&v44);
        x25519_ge_p1p1_to_p3((uint64_t)v35, (unint64_t *)v40);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)__b);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[10], (uint64_t)v36);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)&__b[10]);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[20], (uint64_t)v36);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)&__b[20]);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[30], (uint64_t)v36);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)&__b[30]);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[40], (uint64_t)v36);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)&__b[40]);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[50], (uint64_t)v36);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)&__b[50]);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[60], (uint64_t)v36);
        x25519_ge_add((uint64_t)v40, (uint64_t)v35, (unint64_t *)&__b[60]);
        x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
        x25519_ge_p3_to_cached((uint64_t)&__b[70], (uint64_t)v36);
        ge_p2_0((uint64_t)v29);
        v21 = 255;
        while (1)
        {
          v22 = v21;
          if (*((_BYTE *)v65 + v21) || *((_BYTE *)v64 + v21))
            break;
          --v21;
          if (!(_DWORD)v22)
            goto LABEL_25;
        }
        if ((v21 & 0x80000000) == 0)
        {
          do
          {
            ge_p2_dbl((uint64_t)v40, (uint64_t)v29);
            v23 = *((unsigned __int8 *)v65 + v22);
            if (*((char *)v65 + v22) < 1)
            {
              if ((v23 & 0x80) != 0)
              {
                x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
                x25519_ge_sub((uint64_t)v40, (uint64_t)v36, (unint64_t *)&__b[10 * (-(char)v23 >> 1)]);
              }
            }
            else
            {
              x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
              x25519_ge_add((uint64_t)v40, (uint64_t)v36, (unint64_t *)&__b[10 * (v23 >> 1)]);
            }
            v24 = *((char *)v64 + v22);
            if (v24 < 1)
            {
              if (v24 < 0)
              {
                x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
                v46.i64[0] = 0xAAAAAAAAAAAAAAAALL;
                v25 = &Bi[15 * (-(char)v24 >> 1)];
                v26.i64[0] = 0xAAAAAAAAAAAAAAAALL;
                v26.i64[1] = 0xAAAAAAAAAAAAAAAALL;
                v44 = v26;
                v45 = v26;
                v55 = 0xAAAAAAAAAAAAAAAALL;
                v54[1] = v26;
                v54[0] = v26;
                v53 = 0xAAAAAAAAAAAAAAAALL;
                v52[0] = v26;
                v52[1] = v26;
                fe_add(v40, (int64x2_t *)((char *)v37 + 8), v36);
                fe_sub((int64x2_t *)((char *)v41 + 8), (int64x2_t *)((char *)v37 + 8), v36);
                fe_mul_impl((uint64_t)v54, (unint64_t *)v40, v25 + 5);
                fe_mul_impl((uint64_t)&v44, (unint64_t *)v41 + 1, v25);
                fe_mul_impl((uint64_t)v52, v25 + 10, (unint64_t *)v39 + 1);
                fe_add((int64x2_t *)((char *)v43 + 8), v38, v38);
                fe_sub(v40, v54, &v44);
                fe_add((int64x2_t *)((char *)v41 + 8), v54, &v44);
                fe_carry((unint64_t *)v54, (_QWORD *)v43 + 1);
                fe_sub(v42, v54, v52);
                fe_add((int64x2_t *)((char *)v43 + 8), v54, v52);
              }
            }
            else
            {
              x25519_ge_p1p1_to_p3((uint64_t)v36, (unint64_t *)v40);
              ge_madd((uint64_t)v40, (uint64_t)v36, &Bi[15 * (v24 >> 1)]);
            }
            x25519_ge_p1p1_to_p2((uint64_t)v29, (unint64_t *)v40);
          }
          while (v22-- > 0);
        }
LABEL_25:
        *(_QWORD *)&v28 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v28 + 1) = 0xAAAAAAAAAAAAAAAALL;
        __b[1] = v28;
        __b[0] = v28;
        x25519_ge_tobytes(__b, (uint64_t)v29);
        return CRYPTO_memcmp((char *)__b, (char *)v62, 32) == 0;
      }
    }
    while (v11 != -32);
  }
  return 0;
}

uint64_t slide(uint64_t result, uint64_t a2)
{
  uint64_t i;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unint64_t v14;

  for (i = 0; i != 256; ++i)
    *(_BYTE *)(result + i) = (*(unsigned __int8 *)(a2 + (i >> 3)) >> (i & 7)) & 1;
  v3 = 0;
  v4 = result + 1;
  v5 = 1;
  do
  {
    if (*(_BYTE *)(result + v3) && v3 <= 0xFE)
    {
      v6 = v3;
      v7 = 1;
      v8 = v5;
      do
      {
        v9 = *(char *)(result + v8);
        if (*(_BYTE *)(result + v8))
        {
          v10 = *(char *)(result + v3);
          v11 = v9 << v7;
          v12 = (v9 << v7) + v10;
          if (v12 > 15)
          {
            v13 = v10 - v11;
            if (v13 < -15)
              break;
            *(_BYTE *)(result + v3) = v13;
            v14 = v6;
            while (*(_BYTE *)(v4 + v14))
            {
              *(_BYTE *)(v4 + v14++) = 0;
              if (v14 >= 0xFF)
                goto LABEL_16;
            }
            *(_BYTE *)(v4 + v14) = 1;
          }
          else
          {
            *(_BYTE *)(result + v3) = v12;
            *(_BYTE *)(result + v8) = 0;
          }
        }
LABEL_16:
        if (v7 > 5)
          break;
        ++v7;
        ++v8;
        ++v6;
      }
      while (v7 + v3 < 0x100);
    }
    ++v3;
    ++v5;
  }
  while (v3 != 256);
  return result;
}

int BN_bn2bin(const BIGNUM *a, unsigned __int8 *to)
{
  unsigned int v4;

  v4 = BN_num_bytes(a);
  bn_words_to_big_endian((char *)to, v4, (char *)a->d, a->top);
  return v4;
}

void *EVP_hpke_x25519_hkdf_sha256()
{
  return &EVP_hpke_x25519_hkdf_sha256_kKEM;
}

uint64_t x25519_init_key(uint64_t a1, __int128 *a2, uint64_t a3)
{
  __int128 v3;

  if (a3 == 32)
  {
    v3 = *a2;
    *(_OWORD *)(a1 + 24) = a2[1];
    *(_OWORD *)(a1 + 8) = v3;
    X25519_public_from_private((_BYTE *)(a1 + 40), (uint64_t)a2);
    return 1;
  }
  else
  {
    ERR_put_error(6, 0, 102, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/hpke/hpke.c", 145);
    return 0;
  }
}

uint64_t x25519_generate_key(uint64_t a1)
{
  X25519_keypair((_BYTE *)(a1 + 40), (unsigned __int8 *)(a1 + 8));
  return 1;
}

uint64_t x25519_encap_with_seed(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, unint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v10;
  int v11;
  uint64_t result;

  if (a6 <= 0x1F)
  {
    v10 = 137;
    v11 = 227;
LABEL_11:
    ERR_put_error(6, 0, v10, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/hpke/hpke.c", v11);
    return 0;
  }
  if (a10 != 32)
  {
    v10 = 102;
    v11 = 231;
    goto LABEL_11;
  }
  result = ccrng();
  if (!result)
    return result;
  if (!cccurve25519_make_pub_with_rng())
  {
    if (a8 == 32)
    {
      cchpke_params_x25519_AESGCM128_HKDF_SHA256();
      if (!cchpke_initiator_setup() && !cchpke_initiator_export())
      {
        *a5 = 32;
        *a3 = 32;
        return 1;
      }
      return 0;
    }
    v10 = 134;
    v11 = 244;
    goto LABEL_11;
  }
  return 0;
}

uint64_t x25519_decap(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  if (a5 == 32)
  {
    cchpke_params_x25519_AESGCM128_HKDF_SHA256();
    if (!cchpke_responder_setup() && !cchpke_responder_export())
    {
      *a3 = 32;
      return 1;
    }
  }
  else
  {
    ERR_put_error(6, 0, 134, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/hpke/hpke.c", 271);
  }
  return 0;
}

void *EVP_hpke_hkdf_sha256()
{
  return &EVP_hpke_hkdf_sha256_kKDF;
}

uint64_t EVP_HPKE_KDF_id(unsigned __int16 *a1)
{
  return *a1;
}

void *EVP_hpke_aes_128_gcm()
{
  return &EVP_hpke_aes_128_gcm_kAEAD;
}

void *EVP_hpke_aes_256_gcm()
{
  return &EVP_hpke_aes_256_gcm_kAEAD;
}

void *EVP_hpke_chacha20_poly1305()
{
  return &EVP_hpke_chacha20_poly1305_kAEAD;
}

uint64_t EVP_HPKE_AEAD_aead(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 8))();
}

uint64_t EVP_HPKE_CTX_setup_sender(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, const void *a10, size_t a11)
{
  __int128 v19;
  unsigned __int8 buf[16];
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v19;
  v22 = v19;
  RAND_bytes(buf, *(_QWORD *)(a5 + 24));
  return EVP_HPKE_CTX_setup_sender_with_seed_for_testing(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, (uint64_t)buf, *(_QWORD *)(a5 + 24));
}

uint64_t EVP_HPKE_CTX_setup_sender_with_seed_for_testing(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, const void *a10, size_t a11, uint64_t a12, uint64_t a13)
{
  __int128 v19;
  uint64_t v23;
  _OWORD v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  bzero(a1, 0x2D8uLL);
  EVP_AEAD_CTX_zero(a1 + 3);
  *((_DWORD *)a1 + 180) = 1;
  a1[1] = a7;
  a1[2] = a6;
  *a1 = a5;
  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v24[0] = v19;
  v24[1] = v19;
  v23 = 0xAAAAAAAAAAAAAAAALL;
  if ((*(unsigned int (**)(uint64_t, _OWORD *, uint64_t *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a5 + 56))(a5, v24, &v23, a2, a3, a4, a8, a9, a12, a13)&& hpke_key_schedule((uint64_t)a1, (uint64_t)v24, v23, a10, a11))
  {
    return 1;
  }
  EVP_AEAD_CTX_cleanup((uint64_t)(a1 + 3));
  return 0;
}

uint64_t hpke_key_schedule(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, size_t a5)
{
  uint64_t result;
  EVP_MD *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  unsigned __int8 *v16;
  __int128 v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  _OWORD v22[3];
  size_t v23;
  size_t v24;
  size_t v25;
  _OWORD v26[5];
  _OWORD v27[4];
  _OWORD v28[8];
  char v29;
  _OWORD v30[4];
  _OWORD v31[4];
  unint64_t v32;
  __int16 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v33 = -21846;
  v32 = 0xAAAAAAAAAAAAAAAALL;
  result = hpke_build_suite_id((unsigned __int16 **)a1, (uint64_t)&v32);
  if ((_DWORD)result)
  {
    v11 = (EVP_MD *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 8))();
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v31[2] = v12;
    v31[3] = v12;
    v31[0] = v12;
    v31[1] = v12;
    v25 = 0xAAAAAAAAAAAAAAAALL;
    result = hpke_labeled_extract(v11, (int)v31, &v25, 0, 0, &v32, "psk_id_hash", 0, 0);
    if ((_DWORD)result)
    {
      *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v30[2] = v13;
      v30[3] = v13;
      v30[0] = v13;
      v30[1] = v13;
      v24 = 0xAAAAAAAAAAAAAAAALL;
      result = hpke_labeled_extract(v11, (int)v30, &v24, 0, 0, &v32, "info_hash", a4, a5);
      if ((_DWORD)result)
      {
        v29 = -86;
        *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
        v28[6] = v14;
        v28[7] = v14;
        v28[4] = v14;
        v28[5] = v14;
        v28[2] = v14;
        v28[3] = v14;
        v28[0] = v14;
        v28[1] = v14;
        v23 = 0xAAAAAAAAAAAAAAAALL;
        v22[1] = v14;
        v22[2] = v14;
        v22[0] = v14;
        CBB_init_fixed((uint64_t)v22, (uint64_t)v28, 129);
        result = CBB_add_u8((uint64_t)v22, 0);
        if ((_DWORD)result)
        {
          result = CBB_add_bytes((uint64_t)v22, v31, v25);
          if ((_DWORD)result)
          {
            result = CBB_add_bytes((uint64_t)v22, v30, v24);
            if ((_DWORD)result)
            {
              result = CBB_finish((uint64_t)v22, 0, &v23);
              if ((_DWORD)result)
              {
                *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v27[2] = v15;
                v27[3] = v15;
                v27[0] = v15;
                v27[1] = v15;
                v21 = 0xAAAAAAAAAAAAAAAALL;
                result = hpke_labeled_extract(v11, (int)v27, &v21, a2, a3, &v32, "secret", 0, 0);
                if ((_DWORD)result)
                {
                  v16 = (unsigned __int8 *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 8) + 8))();
                  *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
                  *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
                  v26[3] = v17;
                  v26[4] = v17;
                  v26[1] = v17;
                  v26[2] = v17;
                  v26[0] = v17;
                  v18 = EVP_AEAD_key_length(v16);
                  result = hpke_labeled_expand(v11, (int)v26, v18, (uint64_t)v27, v21, &v32, "key", v28, v23);
                  if ((_DWORD)result)
                  {
                    result = EVP_AEAD_CTX_init((_QWORD *)(a1 + 24), (uint64_t)v16, (uint64_t)v26, v18, 0);
                    if ((_DWORD)result)
                    {
                      v19 = EVP_AEAD_nonce_length((uint64_t)v16);
                      result = hpke_labeled_expand(v11, a1 + 624, v19, (uint64_t)v27, v21, &v32, "base_nonce", v28, v23);
                      if ((_DWORD)result)
                      {
                        v20 = EVP_MD_size(v11);
                        return hpke_labeled_expand(v11, a1 + 648, v20, (uint64_t)v27, v21, &v32, "exp", v28, v23);
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

uint64_t EVP_HPKE_CTX_setup_recipient(_QWORD *a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7, size_t a8)
{
  uint64_t v16;
  __int128 v17;
  uint64_t v19;
  _OWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  bzero(a1, 0x2D8uLL);
  EVP_AEAD_CTX_zero(a1 + 3);
  *((_DWORD *)a1 + 180) = 0;
  v16 = *a2;
  a1[1] = a4;
  a1[2] = a3;
  *a1 = v16;
  *(_QWORD *)&v17 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v17 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v20[0] = v17;
  v20[1] = v17;
  v19 = 0xAAAAAAAAAAAAAAAALL;
  if ((*(unsigned int (**)(uint64_t *, _OWORD *, uint64_t *, uint64_t, uint64_t))(v16 + 64))(a2, v20, &v19, a5, a6)&& hpke_key_schedule((uint64_t)a1, (uint64_t)v20, v19, a7, a8))
  {
    return 1;
  }
  EVP_AEAD_CTX_cleanup((uint64_t)(a1 + 3));
  return 0;
}

uint64_t EVP_HPKE_CTX_open(uint64_t a1, char *a2, size_t *a3, size_t a4, char *a5, unint64_t a6)
{
  int v6;
  int v7;
  uint64_t result;
  uint64_t v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)(a1 + 720))
  {
    v6 = 66;
    v7 = 642;
LABEL_3:
    ERR_put_error(6, 0, v6, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/hpke/hpke.c", v7);
    return 0;
  }
  if (*(_QWORD *)(a1 + 712) == -1)
  {
    v6 = 69;
    v7 = 646;
    goto LABEL_3;
  }
  memset(v16, 170, 24);
  v15 = EVP_AEAD_nonce_length(*(_QWORD *)(a1 + 24));
  hpke_nonce(a1, v16, v15);
  result = EVP_AEAD_CTX_open((unsigned __int8 *)(a1 + 24), a2, a3, a4, (uint64_t)v16, v15, a5, a6);
  if ((_DWORD)result)
  {
    ++*(_QWORD *)(a1 + 712);
    return 1;
  }
  return result;
}

void hpke_nonce(uint64_t a1, _BYTE *a2, size_t a3)
{
  size_t v3;
  _BYTE *v4;
  unint64_t v6;
  uint64_t i;
  char *v8;
  char v9;

  if (a3 <= 7)
    hpke_nonce_cold_1();
  v3 = a3;
  v4 = a2;
  bzero(a2, a3);
  v6 = *(_QWORD *)(a1 + 712);
  for (i = -1; i != -9; --i)
  {
    v4[v3 + i] = v6;
    v6 >>= 8;
  }
  v8 = (char *)(a1 + 624);
  do
  {
    v9 = *v8++;
    *v4++ ^= v9;
    --v3;
  }
  while (v3);
}

uint64_t EVP_HPKE_CTX_seal(uint64_t a1, char *a2, unint64_t *a3, size_t a4, char *a5, size_t a6)
{
  uint64_t v12;
  uint64_t result;
  int v14;
  int v15;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  if (!*(_DWORD *)(a1 + 720))
  {
    v14 = 66;
    v15 = 666;
LABEL_7:
    ERR_put_error(6, 0, v14, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/hpke/hpke.c", v15);
    return 0;
  }
  if (*(_QWORD *)(a1 + 712) == -1)
  {
    v14 = 69;
    v15 = 670;
    goto LABEL_7;
  }
  memset(v16, 170, 24);
  v12 = EVP_AEAD_nonce_length(*(_QWORD *)(a1 + 24));
  hpke_nonce(a1, v16, v12);
  result = EVP_AEAD_CTX_seal(a1 + 24, a2, a3, a4, (uint64_t)v16, v12, a5, a6);
  if ((_DWORD)result)
  {
    ++*(_QWORD *)(a1 + 712);
    return 1;
  }
  return result;
}

uint64_t hpke_build_suite_id(unsigned __int16 **a1, uint64_t a2)
{
  __int128 v3;
  uint64_t result;
  _OWORD v5[3];

  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v5[1] = v3;
  v5[2] = v3;
  v5[0] = v3;
  CBB_init_fixed((uint64_t)v5, a2, 10);
  result = CBB_add_bytes((uint64_t)v5, "HPKE", 4uLL);
  if ((_DWORD)result)
  {
    result = CBB_add_u16((uint64_t)v5, **a1);
    if ((_DWORD)result)
    {
      result = CBB_add_u16((uint64_t)v5, *a1[2]);
      if ((_DWORD)result)
        return CBB_add_u16((uint64_t)v5, *a1[1]) != 0;
    }
  }
  return result;
}

BOOL hpke_labeled_expand(EVP_MD *a1, int a2, int a3, uint64_t a4, uint64_t a5, const void *a6, const char *a7, const void *a8, size_t a9)
{
  __int128 v15;
  size_t v16;
  _BOOL8 v17;
  _OWORD v19[3];

  *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = v15;
  v19[2] = v15;
  v19[0] = v15;
  if (CBB_init((uint64_t)v19, 0)
    && CBB_add_u16((uint64_t)v19, (unsigned __int16)a3)
    && CBB_add_bytes((uint64_t)v19, "HPKE-v1", 7uLL)
    && CBB_add_bytes((uint64_t)v19, a6, 0xAuLL)
    && (v16 = strlen(a7), CBB_add_bytes((uint64_t)v19, a7, v16))
    && CBB_add_bytes((uint64_t)v19, a8, a9))
  {
    CBB_data((uint64_t)v19);
    CBB_len((uint64_t)v19);
    v17 = HKDF_expand(a2, a3, a1);
  }
  else
  {
    v17 = 0;
  }
  CBB_cleanup((uint64_t)v19);
  return v17;
}

BOOL hpke_labeled_extract(EVP_MD *a1, int a2, _QWORD *a3, uint64_t a4, uint64_t a5, const void *a6, const char *a7, const void *a8, size_t a9)
{
  __int128 v15;
  size_t v16;
  _BOOL8 v17;
  _OWORD v19[3];

  *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = v15;
  v19[2] = v15;
  v19[0] = v15;
  if (CBB_init((uint64_t)v19, 0)
    && CBB_add_bytes((uint64_t)v19, "HPKE-v1", 7uLL)
    && CBB_add_bytes((uint64_t)v19, a6, 0xAuLL)
    && (v16 = strlen(a7), CBB_add_bytes((uint64_t)v19, a7, v16))
    && CBB_add_bytes((uint64_t)v19, a8, a9))
  {
    CBB_data((uint64_t)v19);
    CBB_len((uint64_t)v19);
    v17 = HKDF_extract(a2, a3, a1) != 0;
  }
  else
  {
    v17 = 0;
  }
  CBB_cleanup((uint64_t)v19);
  return v17;
}

uint64_t bssl::ssl_hash_session_id(int *__src, size_t __n)
{
  int *p_dst;
  int __dst;

  p_dst = __src;
  __dst = -1431655766;
  if (__n <= 3)
  {
    __dst = 0;
    if (__n)
      memcpy(&__dst, __src, __n);
    p_dst = &__dst;
  }
  return *p_dst;
}

void bssl::ssl_session_renew_timeout(bssl *this, ssl_st *a2, ssl_session_st *a3)
{
  unsigned int v3;
  unsigned int cipher_list_by_id_high;

  v3 = a3;
  bssl::ssl_session_rebase_time(this, a2, a3);
  if (LODWORD(a2->cipher_list_by_id) <= v3)
  {
    cipher_list_by_id_high = HIDWORD(a2->cipher_list_by_id);
    if (cipher_list_by_id_high >= v3)
      cipher_list_by_id_high = v3;
    LODWORD(a2->cipher_list_by_id) = cipher_list_by_id_high;
  }
}

uint64_t bssl::ssl_ctx_rotate_ticket_encryption_key(bssl *this, ssl_ctx_st *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD **v6;
  unsigned __int8 *v7;
  unsigned __int8 *v8;
  _QWORD *v9;
  uint64_t v10;
  pthread_rwlock_t *v12;
  _QWORD v13[2];

  v13[0] = 0xAAAAAAAAAAAAAAAALL;
  v13[1] = 0xAAAAAAAAAAAAAAAALL;
  bssl::ssl_ctx_get_current_time((uint64_t)this, (uint64_t)v13);
  v12 = (pthread_rwlock_t *)0xAAAAAAAAAAAAAAAALL;
  bssl::internal::MutexLockBase<&(CRYPTO_MUTEX_lock_read),&(CRYPTO_MUTEX_unlock_read)>::MutexLockBase(&v12, (pthread_rwlock_t *)((char *)this + 16));
  v3 = *((_QWORD *)this + 65);
  if (!v3
    || (unint64_t)(*(_QWORD *)(v3 + 48) - 1) < v13[0]
    || (v4 = *((_QWORD *)this + 66)) != 0 && *(_QWORD *)(v4 + 48) <= v13[0])
  {
    CRYPTO_MUTEX_unlock_read(v12);
    v6 = (_QWORD **)((char *)this + 520);
    v12 = (pthread_rwlock_t *)0xAAAAAAAAAAAAAAAALL;
    bssl::internal::MutexLockBase<&(CRYPTO_MUTEX_lock_write),&(CRYPTO_MUTEX_unlock_write)>::MutexLockBase(&v12, (pthread_rwlock_t *)((char *)this + 16));
    if (!*((_QWORD *)this + 65) || (unint64_t)(*(_QWORD *)(*((_QWORD *)this + 65) + 48) - 1) < v13[0])
    {
      v7 = (unsigned __int8 *)OPENSSL_malloc(0x38uLL);
      v8 = v7;
      if (!v7)
      {
        v5 = 0;
LABEL_17:
        CRYPTO_MUTEX_unlock_read(v12);
        return v5;
      }
      *((_QWORD *)v7 + 6) = 0;
      *((_OWORD *)v7 + 1) = 0u;
      *((_OWORD *)v7 + 2) = 0u;
      *(_OWORD *)v7 = 0u;
      RAND_bytes(v7, 16);
      RAND_bytes(v8 + 16, 16);
      RAND_bytes(v8 + 32, 16);
      *((_QWORD *)v8 + 6) = v13[0] + 172800;
      v9 = *v6;
      if (*v6)
      {
        v9[6] += 172800;
        *((_QWORD *)this + 65) = 0;
        std::unique_ptr<bssl::TicketKey,bssl::internal::Deleter>::reset[abi:ne180100]((_QWORD **)this + 66, v9);
      }
      std::unique_ptr<bssl::TicketKey,bssl::internal::Deleter>::reset[abi:ne180100]((_QWORD **)this + 65, v8);
    }
    v10 = *((_QWORD *)this + 66);
    if (v10 && *(_QWORD *)(v10 + 48) <= v13[0])
      std::unique_ptr<bssl::TicketKey,bssl::internal::Deleter>::reset[abi:ne180100]((_QWORD **)this + 66, 0);
    v5 = 1;
    goto LABEL_17;
  }
  CRYPTO_MUTEX_unlock_read(v12);
  return 1;
}

void sub_1B4FED25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, pthread_rwlock_t *a10)
{
  CRYPTO_MUTEX_unlock_read(a10);
  _Unwind_Resume(a1);
}

uint64_t bssl::ssl_encrypt_ticket(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  const unsigned __int8 *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  ssl_ctx_st *v14;
  uint64_t v16;
  uint64_t (*v17)(void);
  unsigned int v18;
  uint64_t v19;
  const unsigned __int8 *v20;
  size_t v21;
  int v22;
  int v23;
  const EVP_CIPHER *v24;
  uint64_t v25;
  const EVP_MD *v26;
  int v27;
  unint64_t v29;
  void *v30;
  unsigned int len;
  int outl;
  unsigned __int8 *out;
  HMAC_CTX ctx;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v29 = 0xAAAAAAAAAAAAAAAALL;
  v30 = 0;
  if (SSL_SESSION_to_bytes_for_ticket(a3, &v30, &v29))
  {
    v5 = *a1;
    v6 = *(_QWORD *)(*(_QWORD *)(*a1 + 128) + 800);
    v8 = v29;
    v7 = (const unsigned __int8 *)v30;
    if (v6)
    {
      v9 = (*(uint64_t (**)(_QWORD))v6)(*a1);
      v10 = v9 + v8;
      if (__CFADD__(v9, v8))
      {
        ERR_put_error(16, 0, 69, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_session.cc", 546);
      }
      else
      {
        *(_QWORD *)&ctx.key[36] = 0xAAAAAAAAAAAAAAAALL;
        if (CBB_reserve(a2, &ctx.key[36], v10))
        {
          ctx.md = (const EVP_MD *)0xAAAAAAAAAAAAAAAALL;
          if ((*(unsigned int (**)(uint64_t, _QWORD, HMAC_CTX *, uint64_t, const unsigned __int8 *, unint64_t))(v6 + 8))(v5, *(_QWORD *)&ctx.key[36], &ctx, v10, v7, v8))
          {
            v11 = CBB_did_write(a2, (uint64_t)ctx.md) != 0;
LABEL_34:
            OPENSSL_free(v30);
            return v11;
          }
          ERR_put_error(16, 0, 276, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_session.cc", 558);
        }
      }
      v11 = 0;
      goto LABEL_34;
    }
    v38 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v36 = v12;
    v37 = v12;
    *(_OWORD *)&ctx.key[116] = v12;
    v35 = v12;
    *(_OWORD *)&ctx.key[84] = v12;
    *(_OWORD *)&ctx.key[100] = v12;
    *(_OWORD *)&ctx.key[52] = v12;
    *(_OWORD *)&ctx.key[68] = v12;
    *(_OWORD *)&ctx.key[36] = v12;
    EVP_CIPHER_CTX_init((EVP_CIPHER_CTX *)&ctx.key[36]);
    ctx.o_ctx.md_data = (void *)0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&ctx.i_ctx.md_data = v13;
    *(_OWORD *)&ctx.o_ctx.engine = v13;
    *(_OWORD *)&ctx.md_ctx.md_data = v13;
    *(_OWORD *)&ctx.i_ctx.engine = v13;
    *(_OWORD *)&ctx.md = v13;
    *(_OWORD *)&ctx.md_ctx.engine = v13;
    HMAC_CTX_init(&ctx);
    if (v8 >> 7 >= 0x1FF)
    {
      v11 = CBB_add_bytes(a2, "TICKET TOO LARGE", 0x10uLL);
LABEL_33:
      HMAC_CTX_cleanup(&ctx);
      EVP_CIPHER_CTX_cleanup((EVP_CIPHER_CTX *)&ctx.key[36]);
      goto LABEL_34;
    }
    v16 = *(_QWORD *)(*a1 + 128);
    memset(&ctx.key[4], 170, 32);
    v17 = *(uint64_t (**)(void))(v16 + 536);
    if (v17)
    {
      if ((v17() & 0x80000000) != 0)
        goto LABEL_32;
    }
    else
    {
      if (!bssl::ssl_ctx_rotate_ticket_encryption_key((bssl *)v16, v14))
        goto LABEL_32;
      CRYPTO_MUTEX_lock_read((pthread_rwlock_t *)(v16 + 16));
      if (!RAND_bytes(&ctx.key[20], 16)
        || (v24 = EVP_aes_128_cbc(),
            !EVP_EncryptInit_ex((EVP_CIPHER_CTX *)&ctx.key[36], v24, 0, (const unsigned __int8 *)(*(_QWORD *)(v16 + 520) + 32), &ctx.key[20]))|| (v25 = *(_QWORD *)(v16 + 520), v26 = EVP_sha256(), HMAC_Init_ex(&ctx, (const void *)(v25 + 16), 16, v26, 0), !v27))
      {
        CRYPTO_MUTEX_unlock_read((pthread_rwlock_t *)(v16 + 16));
        goto LABEL_32;
      }
      *(_OWORD *)&ctx.key[4] = *(_OWORD *)*(_QWORD *)(v16 + 520);
      CRYPTO_MUTEX_unlock_read((pthread_rwlock_t *)(v16 + 16));
    }
    out = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
    if (CBB_add_bytes(a2, &ctx.key[4], 0x10uLL))
    {
      v18 = EVP_CIPHER_CTX_iv_length((const EVP_CIPHER_CTX *)&ctx.key[36]);
      if (CBB_add_bytes(a2, &ctx.key[20], v18))
      {
        if (CBB_reserve(a2, &out, v8 + 32))
        {
          outl = -1431655766;
          if (EVP_EncryptUpdate((EVP_CIPHER_CTX *)&ctx.key[36], out, &outl, v7, v8))
          {
            v19 = outl;
            if (EVP_EncryptFinal_ex((EVP_CIPHER_CTX *)&ctx.key[36], &out[outl], &outl))
            {
              if (CBB_did_write(a2, outl + v19))
              {
                len = -1431655766;
                v20 = (const unsigned __int8 *)CBB_data(a2);
                v21 = CBB_len(a2);
                HMAC_Update(&ctx, v20, v21);
                if (v22)
                {
                  if (CBB_reserve(a2, &out, 64))
                  {
                    HMAC_Final(&ctx, out, &len);
                    if (v23)
                    {
                      v11 = CBB_did_write(a2, len) != 0;
                      goto LABEL_33;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
LABEL_32:
    v11 = 0;
    goto LABEL_33;
  }
  return 0xFFFFFFFFLL;
}

void sub_1B4FED650(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, HMAC_CTX *ctx)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

BOOL bssl::ssl_session_is_context_valid(bssl *this, const bssl::SSL_HANDSHAKE *a2, const ssl_session_st *a3)
{
  size_t v3;
  uint64_t v4;

  if (!a2)
    return 0;
  v3 = *((unsigned __int8 *)a2 + 100);
  v4 = *(_QWORD *)(*((_QWORD *)this + 1) + 32);
  if ((_DWORD)v3 != *(unsigned __int8 *)(v4 + 112))
    return 0;
  if (*((_BYTE *)a2 + 100))
    return memcmp((char *)a2 + 101, (const void *)(v4 + 113), v3) == 0;
  return 1;
}

uint64_t bssl::ssl_session_is_resumable(bssl *this, const STACK **a2, const ssl_session_st *a3)
{
  uint64_t v5;
  uint64_t result;
  const ssl_session_st *v7;
  uint64_t v8;
  unsigned int v9;

  v5 = *(_QWORD *)this;
  result = bssl::ssl_session_is_context_valid(this, (const bssl::SSL_HANDSHAKE *)a2, a3);
  if ((_DWORD)result)
  {
    if (((*(unsigned __int8 *)(v5 + 180) ^ (*((unsigned __int8 *)a2 + 448) >> 4)) & 1) == 0)
    {
      result = bssl::ssl_session_is_time_valid((bssl *)v5, (const ssl_st *)a2, v7);
      if (!(_DWORD)result)
        return result;
      if (*(unsigned __int16 *)(v5 + 16) == *((unsigned __int16 *)a2 + 2) && *((const STACK **)this + 196) == a2[26])
      {
        v8 = sk_num(a2[18]);
        v9 = *((unsigned __int8 *)a2 + 448);
        if (!v8 && (v9 & 2) == 0)
          return (*(_QWORD *)(*(_QWORD *)this + 168) == 0) ^ ((v9 & 0x20) >> 5);
        if (((*(unsigned __int16 *)(*((_QWORD *)this + 1) + 313) >> 5) & 1) == ((v9 >> 1) & 1))
          return (*(_QWORD *)(*(_QWORD *)this + 168) == 0) ^ ((v9 & 0x20) >> 5);
      }
    }
    return 0;
  }
  return result;
}

uint64_t bssl::ssl_get_prev_session(uint64_t *a1, SSL_SESSION **a2, char *a3, _BYTE *a4, uint64_t a5)
{
  uint64_t v6;
  int v11;
  uint64_t v12;
  char v13;
  size_t v14;
  unsigned int *v15;
  bssl **v16;
  SSL_SESSION *v17;
  bssl *v18;
  unsigned int v19;
  uint64_t v20;
  unsigned int *key;
  SSL_SESSION *v22;
  const ssl_session_st *v23;
  uint64_t (*v24)(bssl **, unsigned int *, _QWORD, _QWORD *);
  SSL_SESSION *v25;
  bssl *v26;
  SSL_SESSION *v27;
  SSL_SESSION *v28;
  SSL_SESSION *v29;
  __int128 v31;
  char v32;
  SSL_SESSION *ses;
  SSL_SESSION *v34;
  unsigned int *v35;
  size_t v36;
  _QWORD __dst[2];

  v6 = *a1;
  if ((*(_BYTE *)(v6 + 180) & 1) == 0)
    bssl::ssl_get_prev_session();
  ses = 0;
  v32 = 0;
  *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
  if ((SSL_get_options(v6) & 0x4000) != 0 || !bssl::ssl_client_hello_get_extension(a5, &v31, 35))
  {
    v13 = 0;
    goto LABEL_10;
  }
  if (!CBS_len((uint64_t)&v31))
  {
    v13 = 1;
LABEL_10:
    v15 = *(unsigned int **)(a5 + 48);
    v14 = *(_QWORD *)(a5 + 56);
    v35 = v15;
    v36 = v14;
    v16 = (bssl **)*a1;
    v17 = ses;
    ses = 0;
    if (v17)
      SSL_SESSION_free(v17);
    if (v14 - 33 <= 0xFFFFFFFFFFFFFFDFLL)
      goto LABEL_37;
    v34 = 0;
    v18 = v16[16];
    if ((*((_BYTE *)v18 + 293) & 1) == 0)
    {
      LODWORD(__dst[0]) = -1431655766;
      if (v14 <= 3)
      {
        LODWORD(__dst[0]) = 0;
        memcpy(__dst, v15, v14);
        v15 = (unsigned int *)__dst;
      }
      v19 = *v15;
      CRYPTO_MUTEX_lock_read((pthread_rwlock_t *)((char *)v18 + 16));
      v20 = *((_QWORD *)v16[16] + 32);
      __dst[0] = bssl::ssl_lookup_session(bssl::SSL_HANDSHAKE *,std::unique_ptr<ssl_session_st,bssl::internal::Deleter> *,bssl::Span<unsigned char const>)::$_0::__invoke;
      __dst[1] = &v35;
      key = (unsigned int *)OPENSSL_lh_retrieve_key(v20, (uint64_t)__dst, v19, (unsigned int (*)(uint64_t, _QWORD))lh_SSL_SESSION_call_cmp_key);
      v22 = (SSL_SESSION *)key;
      if (key)
        CRYPTO_refcount_inc(key);
      v34 = v22;
      CRYPTO_MUTEX_unlock_read((pthread_rwlock_t *)((char *)v18 + 16));
      if (v22)
        goto LABEL_27;
      v18 = v16[16];
    }
    v24 = (uint64_t (*)(bssl **, unsigned int *, _QWORD, _QWORD *))*((_QWORD *)v18 + 40);
    if (!v24)
      goto LABEL_30;
    LODWORD(__dst[0]) = 1;
    v25 = (SSL_SESSION *)v24(v16, v35, v36, __dst);
    v22 = v25;
    v34 = v25;
    if (!v25)
    {
LABEL_37:
      v28 = ses;
      ses = 0;
      std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100](a2, v28);
      *a3 = v13;
      *a4 = v32;
      v12 = 1;
      goto LABEL_38;
    }
    if (v25 == (SSL_SESSION *)&bssl::g_pending_session_magic)
    {
      v12 = 10;
      goto LABEL_38;
    }
    if (LODWORD(__dst[0]))
      CRYPTO_refcount_inc((unsigned int *)v25);
    v26 = v16[16];
    if ((*((_BYTE *)v26 + 293) & 2) == 0)
      SSL_CTX_add_session((SSL_CTX *)v26, v22);
LABEL_27:
    if (bssl::ssl_session_is_time_valid((bssl *)v16, (const ssl_st *)v22, v23)
      || (bssl::remove_session(v16[16], (ssl_ctx_st *)v22, (ssl_session_st *)1), v34 = 0, !v22))
    {
LABEL_31:
      v27 = ses;
      ses = v22;
      v34 = 0;
      if (v27)
        SSL_SESSION_free(v27);
      goto LABEL_37;
    }
    SSL_SESSION_free(v22);
LABEL_30:
    v22 = 0;
    goto LABEL_31;
  }
  v11 = bssl::ssl_process_ticket(a1, &ses, &v32, (const unsigned __int8 *)v31, *((unint64_t *)&v31 + 1), *(_QWORD *)(a5 + 48), *(_QWORD *)(a5 + 56));
  if (v11 != 1)
  {
    if (v11 == 2)
    {
      if (ses)
        __assert_rtn("ssl_get_prev_session", "ssl_session.cc", 739, "!session");
    }
    else if (v11 == 3)
    {
      v12 = 0;
      goto LABEL_38;
    }
    v13 = 1;
    goto LABEL_37;
  }
  v12 = 11;
LABEL_38:
  v29 = ses;
  ses = 0;
  if (v29)
    SSL_SESSION_free(v29);
  return v12;
}

void sub_1B4FEDAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  SSL_SESSION *v6;
  va_list va;
  va_list va1;

  va_start(va1, a5);
  va_start(va, a5);
  v6 = va_arg(va1, SSL_SESSION *);
  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)va1, 0);
  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)va, 0);
  _Unwind_Resume(a1);
}

uint64_t bssl::add_session_locked(uint64_t a1, SSL_SESSION **a2)
{
  ssl_ctx_st *v4;
  _QWORD *v5;
  uint64_t result;
  SSL_SESSION *v7;
  ssl_session_st *v8;
  uint64_t v9;
  ssl_ctx_st **v10;
  unint64_t v11;
  SSL_SESSION *v12;

  v4 = (ssl_ctx_st *)*a2;
  v5 = *(_QWORD **)(a1 + 256);
  v12 = 0;
  result = OPENSSL_lh_insert(v5, &v12, (uint64_t)v4, (uint64_t (*)(_QWORD, uint64_t))lh_SSL_SESSION_call_hash_func, (unsigned int (*)(_QWORD, _QWORD, uint64_t))lh_SSL_SESSION_call_cmp_func);
  if ((_DWORD)result)
  {
    v7 = v12;
    *a2 = 0;
    std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100](a2, v7);
    if (v7)
    {
      if (v7 == (SSL_SESSION *)v4)
        return 0;
      bssl::SSL_SESSION_list_remove(a1, (ssl_ctx_st *)v7, v8);
    }
    if (v4->md5 && v4->rsa_md5)
      bssl::SSL_SESSION_list_remove(a1, v4, v8);
    v9 = *(_QWORD *)(a1 + 272);
    v10 = (ssl_ctx_st **)(v9 + 224);
    if (!v9)
      v10 = (ssl_ctx_st **)(a1 + 280);
    *v10 = v4;
    *(_QWORD *)(a1 + 272) = v4;
    if (!v9)
      v9 = a1 + 280;
    v4->rsa_md5 = (const EVP_MD *)(a1 + 272);
    v4->md5 = (const EVP_MD *)v9;
    if (SSL_CTX_sess_get_cache_size(a1))
    {
      do
        v11 = EVP_AEAD_CTX_aead(*(_QWORD *)(a1 + 256));
      while (v11 > SSL_CTX_sess_get_cache_size(a1)
           && (bssl::remove_session((bssl *)a1, *(ssl_ctx_st **)(a1 + 280), 0) & 1) != 0);
    }
    return 1;
  }
  return result;
}

SSL_SESSION *SSL_SESSION_new(void)
{
  uint64_t v0;
  void *v2;

  v2 = *(void **)(v0 + 8);
  return (SSL_SESSION *)bssl::New<ssl_session_st,bssl::SSL_X509_METHOD const*&>(&v2);
}

uint64_t SSL_SESSION_up_ref(unsigned int *a1)
{
  CRYPTO_refcount_inc(a1);
  return 1;
}

const unsigned __int8 *__cdecl SSL_SESSION_get_id(const SSL_SESSION *s, unsigned int *len)
{
  if (len)
    *len = *(_DWORD *)&s->master_key[44];
  return (const unsigned __int8 *)&s->session_id_length;
}

size_t SSL_SESSION_get_master_key(uint64_t a1, void *__dst, size_t a3)
{
  size_t v3;

  v3 = *(int *)(a1 + 12);
  if (a3)
  {
    if (v3 >= a3)
      v3 = a3;
    if (v3)
      memcpy(__dst, (const void *)(a1 + 16), v3);
  }
  return v3;
}

uint64_t SSL_SESSION_set_ticket(uint64_t a1, const void *a2, unint64_t a3)
{
  void **v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (void **)(a1 + 240);
  v6 = bssl::Array<unsigned char>::Init(a1 + 240, a3);
  v7 = v6;
  if (a3 && (_DWORD)v6)
    memcpy(*v5, a2, a3);
  return v7;
}

uint64_t SSL_SESSION_get0_cipher(uint64_t a1)
{
  return *(_QWORD *)(a1 + 208);
}

uint64_t SSL_SESSION_get_max_early_data(uint64_t a1)
{
  return *(unsigned int *)(a1 + 388);
}

int SSL_CTX_add_session(SSL_CTX *s, SSL_SESSION *c)
{
  int v4;
  SSL_SESSION *v5;
  SSL_SESSION *ses;
  pthread_rwlock_t *v8;
  SSL_SESSION *v9;

  if (c)
    CRYPTO_refcount_inc((unsigned int *)c);
  v8 = (pthread_rwlock_t *)0xAAAAAAAAAAAAAAAALL;
  v9 = c;
  bssl::internal::MutexLockBase<&(CRYPTO_MUTEX_lock_write),&(CRYPTO_MUTEX_unlock_write)>::MutexLockBase(&v8, (pthread_rwlock_t *)&s->cipher_list_by_id);
  v9 = 0;
  ses = c;
  v4 = bssl::add_session_locked((uint64_t)s, &ses);
  v5 = ses;
  ses = 0;
  if (v5)
    SSL_SESSION_free(v5);
  CRYPTO_MUTEX_unlock_read(v8);
  return v4;
}

void sub_1B4FEDD98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  SSL_SESSION *v3;
  va_list va;
  pthread_rwlock_t *v5;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, SSL_SESSION *);
  v5 = va_arg(va1, pthread_rwlock_t *);
  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)va, 0);
  CRYPTO_MUTEX_unlock_read(v5);
  std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)va1, 0);
  _Unwind_Resume(a1);
}

uint64_t bssl::remove_session(bssl *this, ssl_ctx_st *a2, ssl_session_st *a3)
{
  int v4;
  ssl_ctx_st *v6;
  SSL_SESSION *v7;
  ssl_session_st *v9;
  void (*v10)(bssl *, SSL_SESSION *);

  if (!a2)
    return 0;
  if (!a2->session_cache_mode)
    return 0;
  v4 = (int)a3;
  if ((_DWORD)a3)
    CRYPTO_MUTEX_lock_write((pthread_rwlock_t *)((char *)this + 16));
  v6 = (ssl_ctx_st *)OPENSSL_lh_retrieve(*((_QWORD **)this + 32), (uint64_t)a2, (uint64_t (*)(_QWORD, uint64_t))lh_SSL_SESSION_call_hash_func, (unsigned int (*)(_QWORD, _QWORD, uint64_t))lh_SSL_SESSION_call_cmp_func);
  v7 = (SSL_SESSION *)v6;
  if (v6 == a2)
  {
    v7 = (SSL_SESSION *)OPENSSL_lh_delete(*((_QWORD **)this + 32), (uint64_t)a2, (uint64_t (*)(_QWORD, uint64_t))lh_SSL_SESSION_call_hash_func, (unsigned int (*)(_QWORD, _QWORD, uint64_t))lh_SSL_SESSION_call_cmp_func);
    bssl::SSL_SESSION_list_remove((uint64_t)this, a2, v9);
    if (!v4)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (v4)
LABEL_7:
    CRYPTO_MUTEX_unlock_read((pthread_rwlock_t *)((char *)this + 16));
LABEL_8:
  if (v6 != a2)
    return 0;
  v10 = (void (*)(bssl *, SSL_SESSION *))*((_QWORD *)this + 39);
  if (v10)
    v10(this, v7);
  SSL_SESSION_free(v7);
  return 1;
}

void timeout_doall_arg(ssl_ctx_st *a1, uint64_t *a2)
{
  unint64_t v4;
  SSL_CIPHER *app_verify_cookie_cb;
  uint64_t app_gen_cookie_cb_low;
  BOOL v7;
  char *v8;
  ssl_session_st *v9;
  void (*v10)(void);

  v4 = a2[1];
  if (!v4
    || (app_verify_cookie_cb = (SSL_CIPHER *)a1->app_verify_cookie_cb,
        app_gen_cookie_cb_low = LODWORD(a1->app_gen_cookie_cb),
        v7 = __CFADD__(app_verify_cookie_cb, app_gen_cookie_cb_low),
        v8 = (char *)app_verify_cookie_cb + app_gen_cookie_cb_low,
        v7)
    || v4 > (unint64_t)v8)
  {
    OPENSSL_lh_delete((_QWORD *)a2[2], (uint64_t)a1, (uint64_t (*)(_QWORD, uint64_t))lh_SSL_SESSION_call_hash_func, (unsigned int (*)(_QWORD, _QWORD, uint64_t))lh_SSL_SESSION_call_cmp_func);
    bssl::SSL_SESSION_list_remove(*a2, a1, v9);
    v10 = *(void (**)(void))(*a2 + 312);
    if (v10)
      v10();
    SSL_SESSION_free((SSL_SESSION *)a1);
  }
}

uint64_t lh_SSL_SESSION_call_cmp_key(_QWORD *a1, const void *a2)
{
  return ((uint64_t (*)(_QWORD, const void *))*a1)(a1[1], a2);
}

uint64_t bssl::ssl_lookup_session(bssl::SSL_HANDSHAKE *,std::unique_ptr<ssl_session_st,bssl::internal::Deleter> *,bssl::Span<unsigned char const>)::$_0::__invoke(unsigned __int8 **a1, uint64_t a2)
{
  unsigned __int8 *v2;
  unsigned __int8 *v3;
  unsigned __int8 *v4;
  unsigned __int8 *i;
  unsigned __int8 *v6;

  v2 = a1[1];
  if (v2 == (unsigned __int8 *)*(unsigned int *)(a2 + 64))
  {
    if (!v2)
      return 0;
    v3 = (unsigned __int8 *)(a2 + 68);
    v4 = *a1;
    for (i = v2 - 1; ; --i)
    {
      v6 = i;
      if (*v4 != *v3)
        break;
      ++v4;
      ++v3;
      if (!v6)
        return 0;
    }
  }
  return 1;
}

uint64_t bssl::SSL_SESSION_list_remove(uint64_t this, ssl_ctx_st *a2, ssl_session_st *a3)
{
  EVP_MD *md5;
  const EVP_MD **p_rsa_md5;
  _QWORD *p_type;
  const EVP_MD *rsa_md5;
  _QWORD *v7;

  md5 = (EVP_MD *)a2->md5;
  if (md5)
  {
    rsa_md5 = a2->rsa_md5;
    p_rsa_md5 = &a2->rsa_md5;
    p_type = &rsa_md5->type;
    if (rsa_md5)
    {
      v7 = (_QWORD *)(this + 272);
      if (md5 == (EVP_MD *)(this + 280))
      {
        if (p_type == v7)
        {
          *p_type = 0;
          *(_QWORD *)&md5->type = 0;
          goto LABEL_11;
        }
        *(_QWORD *)&md5->type = p_type;
      }
      else
      {
        if (p_type == v7)
        {
          *p_type = md5;
          *(_QWORD *)&md5[2].type = p_type;
          goto LABEL_11;
        }
        *(_QWORD *)&md5[2].type = p_type;
        p_type = *p_rsa_md5;
      }
      p_type[29] = md5;
LABEL_11:
      *p_rsa_md5 = 0;
      p_rsa_md5[1] = 0;
    }
  }
  return this;
}

uint64_t lh_SSL_SESSION_call_hash_func(uint64_t (*a1)(const void *), const void *a2)
{
  return a1(a2);
}

uint64_t lh_SSL_SESSION_call_cmp_func(uint64_t (*a1)(const void *, const void *), const void *a2, const void *a3)
{
  return a1(a2, a3);
}

uint64_t lh_SSL_SESSION_call_doall_arg(void *a1, _QWORD *a2)
{
  return ((uint64_t (*)(void *, _QWORD))*a2)(a1, a2[1]);
}

BOOL bssl::ssl_client_cipher_list_contains_cipher(uint64_t a1, int a2)
{
  uint64_t v3;
  _BOOL8 v4;
  unsigned __int16 v6;
  unsigned __int16 *v7[2];

  v7[0] = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
  v7[1] = (unsigned __int16 *)0xAAAAAAAAAAAAAAAALL;
  CBS_init(v7, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  do
  {
    v3 = CBS_len((uint64_t)v7);
    v4 = v3 != 0;
    if (!v3)
      break;
    v6 = -21846;
    if (!CBS_get_u16(v7, &v6))
      return 0;
  }
  while (v6 != a2);
  return v4;
}

uint64_t bssl::ssl_server_handshake(bssl *this, bssl::SSL_HANDSHAKE *a2, unsigned __int16 *a3)
{
  int v4;
  uint64_t prev_session;
  int v6;
  int v7;
  bssl *v8;
  __int128 v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  bssl *v14;
  __int128 v15;
  __int128 v16;
  bssl *v17;
  __int128 v18;
  unsigned __int16 *v19;
  uint64_t (*v20)(ssl3_state_st **);
  int v21;
  bssl *v22;
  uint64_t v23;
  uint64_t (*v24)(_QWORD, _QWORD);
  int v25;
  uint64_t v26;
  uint64_t (*v27)(bssl *, _QWORD);
  int v28;
  bssl *v29;
  __int128 v30;
  const ssl_cipher_st *v31;
  const bssl::SSL_HANDSHAKE *v32;
  bssl::SSL_HANDSHAKE *v33;
  bssl *v34;
  int v35;
  int v36;
  __int128 v37;
  unsigned __int16 *v38;
  const char *v39;
  size_t v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  SSL_SESSION **v45;
  ssl_st *v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  unsigned __int8 cipher_list;
  size_t cipher_list_low;
  int version_low;
  bssl *v53;
  __int128 v54;
  char *v55;
  const evp_pkey_st *v56;
  int v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  uint64_t v63;
  bssl *v64;
  int v65;
  bssl *v66;
  __int128 v67;
  __int128 v68;
  unint64_t v69;
  const ssl_cipher_st *v70;
  const ssl_st *v71;
  unsigned __int16 *v72;
  const ssl_st *v73;
  int v74;
  int v75;
  bssl *v76;
  bssl *v77;
  SSL_SESSION *s3;
  uint64_t v79;
  uint64_t v80;
  _OWORD *v81;
  __int128 v82;
  const ssl_st *v83;
  int v84;
  char *v85;
  size_t v86;
  const void *v87;
  bssl *v88;
  __int128 v89;
  bssl *v90;
  __int128 v91;
  __int128 v92;
  uint64_t v93;
  unint64_t **v94;
  unsigned __int8 *v95;
  unsigned __int8 *v96;
  uint64_t v97;
  int v98;
  int v99;
  SSL_METHOD *v100;
  unsigned __int8 *v101;
  SSL_METHOD *method;
  unsigned __int8 *v103;
  const ssl_st *v104;
  SSL_SESSION *v105;
  uint64_t v106;
  __int128 v107;
  __int128 v108;
  unsigned int protocol_id;
  int v110;
  __int128 v111;
  __int128 v112;
  int v113;
  int v114;
  uint64_t v115;
  __int128 v116;
  uint64_t v117;
  BIO *i;
  const bssl::SSL_HANDSHAKE *v119;
  char *cipher_by_value;
  int v121;
  __int128 v122;
  const void *v123;
  size_t v124;
  uint64_t v125;
  int is_resumable;
  SSL_SESSION *bbio;
  unsigned int v128;
  bssl::SSL_HANDSHAKE *v129;
  uint64_t v130;
  unsigned int (*v131)(ssl3_state_st **);
  bssl *v132;
  uint64_t v133;
  int v134;
  unsigned int v135;
  unsigned int v136;
  int v137;
  BOOL v138;
  unsigned int v139;
  BOOL v140;
  int v141;
  const ssl_st *v142;
  bssl *v143;
  uint64_t v144;
  int rbio_low;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const ssl_st *v149;
  uint64_t v150;
  __int128 v151;
  const ssl_st *v152;
  _QWORD *v153;
  BIO *v154;
  uint64_t v155;
  uint64_t v156;
  const STACK *v157;
  uint64_t v158;
  SSL_SESSION *v159;
  int v160;
  char v161;
  BUF_MEM *init_buf;
  int v163;
  int v164;
  int v165;
  void **v166;
  BIO *v167;
  size_t v168;
  int v169;
  char v170;
  const evp_pkey_st *v171;
  unsigned __int16 *v172;
  int v173;
  _BOOL4 v174;
  int shared_group;
  unint64_t v176;
  int v177;
  uint64_t v178;
  BOOL v179;
  int v180;
  int v181;
  unint64_t v182;
  char *v183;
  unint64_t v184;
  unsigned int min_version;
  const ssl_st *v186;
  const ssl_st *v187;
  unsigned int v188;
  int v190;
  int v191;
  int v192;
  char *v193;
  char *v194;
  __int128 v195;
  _QWORD *v196;
  unint64_t v197;
  int v198;
  char v199;
  int v200;
  BIO *v201;
  int master_secret;
  uint64_t v203;
  uint64_t v204;
  CRYPTO_EX_DATA v205;
  unsigned int v206;
  unsigned int v207;
  __int128 v208;
  __int128 v209;
  _BOOL4 v210;
  int v211;
  int64_t v212;
  uint64_t v213;
  int64_t v214;
  unsigned __int8 *v215;
  unsigned int v216;
  SSL_METHOD *v217;
  char v218;
  pthread_rwlock_t *v219;
  uint64_t v220;
  _QWORD *v221;
  uint64_t *v222;
  uint64_t v223;
  uint64_t v224;
  int v225;
  STACK *v227;
  int v228;
  int v229;
  int v230;
  uint64_t v231;
  unint64_t v232;
  bssl *v233;
  STACK *v234;
  uint64_t *v235;
  uint64_t *v236;
  _QWORD *v237;
  _QWORD **v238;
  _QWORD **v239;
  EVP_PKEY **v240;
  _QWORD **v241;
  const bssl::SSL_HANDSHAKE *v242;
  unsigned __int16 *v243;
  BUF_MEM **v244;
  char *__dst;
  unsigned __int8 v246;
  unsigned __int16 v247;
  char v248;
  char v249;
  _BYTE v250[34];
  __int128 v251;
  ssl_st var1F0;

  *(_QWORD *)&var1F0.references = *MEMORY[0x1E0C80C00];
  v239 = (_QWORD **)((char *)this + 392);
  v240 = (EVP_PKEY **)((char *)this + 1528);
  v241 = (_QWORD **)((char *)this + 1464);
  v244 = (BUF_MEM **)((char *)this + 424);
  __dst = (char *)this + 1611;
  v242 = (bssl *)((char *)this + 28);
  v243 = (unsigned __int16 *)((char *)this + 30);
  v237 = (_QWORD *)((char *)this + 736);
  v238 = (_QWORD **)((char *)this + 400);
  v235 = (uint64_t *)((char *)this + 1552);
  v236 = (uint64_t *)((char *)this + 600);
  while (2)
  {
    v4 = *((_DWORD *)this + 5);
    switch(v4)
    {
      case 0:
        bssl::ssl_do_info_callback(*(_QWORD *)this, (const ssl_st *)0x10);
        prev_session = 1;
        goto LABEL_9;
      case 1:
        v17 = *(bssl **)this;
        *(_QWORD *)&var1F0.packet_length = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v41 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v41 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.init_buf = v41;
        *(_OWORD *)&var1F0.init_num = v41;
        if (!(*(unsigned int (**)(bssl *, BUF_MEM **))(*(_QWORD *)v17 + 24))(v17, &var1F0.init_buf))
          goto LABEL_167;
        if (!bssl::ssl_check_message_type(v17, (uint64_t)&var1F0.init_buf, 1))
          goto LABEL_473;
        *(_QWORD *)&v42 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v42 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.read_hash = v42;
        *(_OWORD *)&var1F0.enc_write_ctx = v42;
        *(_OWORD *)&var1F0.param = v42;
        *(_OWORD *)&var1F0.cipher_list_by_id = v42;
        *(_OWORD *)&var1F0.read_ahead = v42;
        *(_OWORD *)&var1F0.msg_callback_arg = v42;
        *(_OWORD *)&var1F0.s3 = v42;
        if ((bssl::ssl_client_hello_init((uint64_t)v17, (uint64_t)&var1F0.s3, (unsigned __int16 *)var1F0.init_msg, *(unsigned __int16 **)&var1F0.init_num) & 1) == 0)
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 661);
          bssl::ssl_send_alert(v17, (ssl_st *)2, 50);
          goto LABEL_473;
        }
        if ((*(unsigned int (**)(bssl *))(*(_QWORD *)v17 + 40))(v17))
        {
          bssl::ssl_send_alert(v17, (ssl_st *)2, 10);
          ERR_put_error(16, 0, 255, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 670);
          goto LABEL_473;
        }
        if ((*(_WORD *)(*((_QWORD *)this + 1) + 313) & 0x40) != 0)
        {
          prev_session = 6;
          goto LABEL_474;
        }
        v246 = 50;
        v125 = *(_QWORD *)this;
        var1F0.bbio = (BIO *)0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&var1F0.rwstate = 0xAAAAAAAAAAAAAAAALL;
        if ((bssl::ssl_client_hello_get_extension((uint64_t)&var1F0.s3, &var1F0.bbio, 65037) & 1) == 0)
          goto LABEL_270;
        v249 = -86;
        if (!CBS_get_u8(&var1F0.bbio, &v249))
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 531);
LABEL_471:
          rbio_low = 50;
          v246 = 50;
          goto LABEL_472;
        }
        if (v249)
          goto LABEL_270;
        v248 = -86;
        memset(v250, 170, 18);
        v247 = -21846;
        var1F0.rbio = (BIO *)0xAAAAAAAAAAAAAAAALL;
        var1F0.wbio = (BIO *)0xAAAAAAAAAAAAAAAALL;
        if (!CBS_get_u16((unsigned __int16 **)&var1F0.bbio, v250)
          || !CBS_get_u16((unsigned __int16 **)&var1F0.bbio, &v247)
          || !CBS_get_u8(&var1F0.bbio, &v248)
          || !CBS_get_u16_length_prefixed((unsigned __int8 **)&var1F0.bbio, (unint64_t *)&v250[2])
          || !CBS_get_u16_length_prefixed((unsigned __int8 **)&var1F0.bbio, (unint64_t *)&var1F0.rbio)|| CBS_len((uint64_t)&var1F0.bbio))
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 548);
          goto LABEL_471;
        }
        v219 = (pthread_rwlock_t *)(*(_QWORD *)(v125 + 120) + 16);
        CRYPTO_MUTEX_lock_read(v219);
        v220 = *(_QWORD *)(*(_QWORD *)(v125 + 120) + 768);
        if (v220)
          SSL_ECH_KEYS_up_ref(v220);
        *(_QWORD *)&var1F0.version = 0;
        std::unique_ptr<ssl_ech_keys_st,bssl::internal::Deleter>::reset[abi:ne180100](v235, v220);
        std::unique_ptr<ssl_ech_keys_st,bssl::internal::Deleter>::reset[abi:ne180100]((uint64_t *)&var1F0.version, 0);
        CRYPTO_MUTEX_unlock_read(v219);
        v221 = (_QWORD *)*v235;
        if (!*v235 || !*v221)
        {
LABEL_580:
          v224 = *(_QWORD *)(v125 + 48);
          v225 = 2;
LABEL_581:
          *(_DWORD *)(v224 + 216) = v225;
LABEL_270:
          if ((bssl::SSL_HANDSHAKE::GetClientHello((uint64_t *)this, (uint64_t)&var1F0.init_buf, (uint64_t)&var1F0.s3) & 1) != 0)
          {
            if ((bssl::extract_sni((uint64_t *)this, (char *)&v246, (uint64_t)&var1F0.s3) & 1) != 0)
            {
              v6 = 2;
              goto LABEL_204;
            }
            bssl::ssl_send_alert(v17, (ssl_st *)2, v246);
          }
          else
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 687);
          }
          goto LABEL_473;
        }
        v222 = (uint64_t *)v221[1];
        v223 = 8 * *v221;
        while (2)
        {
          EVP_HPKE_CTX_cleanup((uint64_t)v237);
          EVP_HPKE_CTX_zero((uint64_t)v237);
          if (v248 != *(_BYTE *)(*v222 + 67)
            || !bssl::ECHServerConfig::SetupContext(*v222, v237, *(unsigned __int16 *)v250, v247, *(uint64_t *)&v250[2], *(uint64_t *)&v250[10]))
          {
            ERR_clear_error();
LABEL_579:
            ++v222;
            v223 -= 8;
            if (!v223)
              goto LABEL_580;
            continue;
          }
          break;
        }
        LOBYTE(var1F0.version) = -86;
        if ((bssl::ssl_client_hello_decrypt((uint64_t *)this, &v246, &var1F0, v236, &var1F0.s3, (char *)var1F0.rbio, (unint64_t)var1F0.wbio) & 1) != 0)
        {
          *((_BYTE *)this + 1610) = v248;
          v224 = *(_QWORD *)(v125 + 48);
          v225 = 1;
          goto LABEL_581;
        }
        if (LOBYTE(var1F0.version))
        {
          ERR_clear_error();
          v246 = 50;
          goto LABEL_579;
        }
        ERR_put_error(16, 0, 138, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 584);
        rbio_low = v246;
LABEL_472:
        bssl::ssl_send_alert(v17, (ssl_st *)2, rbio_low);
LABEL_473:
        prev_session = 0;
LABEL_474:
        if (*((_DWORD *)this + 5) != v4)
          bssl::ssl_do_info_callback(*(_QWORD *)this, (const ssl_st *)0x2001);
        if ((_DWORD)prev_session == 1)
          continue;
        return prev_session;
      case 2:
        v17 = *(bssl **)this;
        *(_QWORD *)&var1F0.packet_length = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.init_buf = v18;
        *(_OWORD *)&var1F0.init_num = v18;
        *(_OWORD *)&var1F0.read_hash = v18;
        *(_OWORD *)&var1F0.enc_write_ctx = v18;
        *(_OWORD *)&var1F0.param = v18;
        *(_OWORD *)&var1F0.cipher_list_by_id = v18;
        *(_OWORD *)&var1F0.read_ahead = v18;
        *(_OWORD *)&var1F0.msg_callback_arg = v18;
        *(_OWORD *)&var1F0.s3 = v18;
        if (!bssl::SSL_HANDSHAKE::GetClientHello((uint64_t *)this, (uint64_t)&var1F0.init_buf, (uint64_t)&var1F0.s3))goto LABEL_473;
        v20 = *(uint64_t (**)(ssl3_state_st **))(*((_QWORD *)v17 + 15) + 480);
        if (!v20)
          goto LABEL_169;
        v21 = v20(&var1F0.s3);
        if (!v21)
        {
          prev_session = 5;
          goto LABEL_474;
        }
        if (v21 == -1)
        {
          ERR_put_error(16, 0, 133, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 717);
          bssl::ssl_send_alert(v17, (ssl_st *)2, 40);
          goto LABEL_473;
        }
LABEL_169:
        if (!bssl::ssl_get_version_range(this, v242, v243, v19))
          goto LABEL_473;
        if ((*(_WORD *)(*((_QWORD *)this + 1) + 313) & 0x100) == 0
          || bssl::ssl_client_cipher_list_contains_cipher((uint64_t)&var1F0.s3, 4867))
        {
          goto LABEL_325;
        }
        var1F0.bbio = (BIO *)0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&var1F0.rwstate = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v250[2] = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v250[10] = 0xAAAAAAAAAAAAAAAALL;
        CBS_init(&var1F0.bbio, (uint64_t)var1F0.enc_write_ctx, (uint64_t)var1F0.write_hash);
        v97 = 0;
        v98 = 0;
        v99 = 0;
        v100 = 0;
        v101 = 0;
        method = 0;
        v103 = 0;
        do
        {
          *(_OWORD *)&var1F0.rbio = *(_OWORD *)&var1F0.bbio;
          *(_WORD *)v250 = -21846;
          if (CBS_get_u16((unsigned __int16 **)&var1F0.rbio, v250)
            && *(unsigned __int16 *)v250 == (unsigned __int16)bssl::is_probably_jdk11_with_tls13(ssl_early_callback_ctx const*)::kJavaExtensions[v97])
          {
            *(_OWORD *)&var1F0.bbio = *(_OWORD *)&var1F0.rbio;
            *(_QWORD *)&var1F0.version = 0xAAAAAAAAAAAAAAAALL;
            var1F0.method = (SSL_METHOD *)0xAAAAAAAAAAAAAAAALL;
            if (!CBS_get_u16_length_prefixed((unsigned __int8 **)&var1F0.bbio, (unint64_t *)&var1F0))goto LABEL_325;
            if (*(unsigned __int16 *)v250 <= 0xCu)
            {
              if (*(unsigned __int16 *)v250 == 5)
              {
                v98 = 1;
              }
              else if (*(unsigned __int16 *)v250 == 10)
              {
                *(_OWORD *)&v250[2] = *(_OWORD *)&var1F0.version;
              }
            }
            else
            {
              switch(*(unsigned __int16 *)v250)
              {
                case 0xDu:
                  v103 = *(unsigned __int8 **)&var1F0.version;
                  method = var1F0.method;
                  break;
                case 0x11u:
                  v99 = 1;
                  break;
                case 0x32u:
                  v101 = *(unsigned __int8 **)&var1F0.version;
                  v100 = var1F0.method;
                  break;
              }
            }
          }
          else if (LOBYTE(bssl::is_probably_jdk11_with_tls13(ssl_early_callback_ctx const*)::kJavaExtensions[v97 + 1]))
          {
            goto LABEL_325;
          }
          v97 += 2;
        }
        while (v97 != 32);
        if (!CBS_len((uint64_t)&var1F0.bbio))
        {
          while (CBS_len((uint64_t)&v250[2]))
          {
            LOWORD(var1F0.rbio) = -21846;
            if (!CBS_get_u16((unsigned __int16 **)&v250[2], &var1F0.rbio) || LOWORD(var1F0.rbio) == 29)
              goto LABEL_325;
          }
          if (method == v100)
          {
            if (method)
            {
              v193 = (char *)&method[-1].ssl_ctx_callback_ctrl + 7;
              while (1)
              {
                v194 = v193;
                if (*v103 != *v101)
                  break;
                ++v103;
                ++v101;
                --v193;
                if (!v194)
                  goto LABEL_483;
              }
            }
            else
            {
LABEL_483:
              if (((v99 ^ v98) & 1) == 0)
                *((_DWORD *)this + 400) |= 0x1000000u;
            }
          }
        }
LABEL_325:
        LOBYTE(var1F0.rbio) = 50;
        v144 = *(_QWORD *)this;
        if ((*(_WORD *)(*(_QWORD *)(*(_QWORD *)this + 48) + 220) & 2) != 0)
          bssl::ssl_server_handshake();
        var1F0.bbio = (BIO *)0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&var1F0.rwstate = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v250[2] = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v250[10] = 0xAAAAAAAAAAAAAAAALL;
        if (bssl::ssl_client_hello_get_extension((uint64_t)&var1F0.s3, &var1F0.bbio, 43))
        {
          if (!CBS_get_u8_length_prefixed((unsigned __int8 **)&var1F0.bbio, (unint64_t *)&v250[2])
            || CBS_len((uint64_t)&var1F0.bbio)
            || !CBS_len((uint64_t)&v250[2]))
          {
            ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 211);
            rbio_low = 50;
            goto LABEL_330;
          }
        }
        else if (SSL_is_dtls((unsigned __int8 **)v144))
        {
          if (LOWORD(var1F0.msg_callback) >= 0xFEFEu)
            v146 = 2 * (HIBYTE(LOWORD(var1F0.msg_callback)) < 0xFFu);
          else
            v146 = 4;
          CBS_init(&v250[2], (uint64_t)&bssl::negotiate_version(bssl::SSL_HANDSHAKE *,unsigned char *,ssl_early_callback_ctx const*)::kDTLSVersions- v146+ 4, v146);
        }
        else
        {
          v147 = 4;
          if (LOWORD(var1F0.msg_callback) != 770)
            v147 = 2 * (LOWORD(var1F0.msg_callback) > 0x300u);
          if (LOWORD(var1F0.msg_callback) <= 0x302u)
            v148 = v147;
          else
            v148 = 6;
          CBS_init(&v250[2], (uint64_t)&bssl::negotiate_version(bssl::SSL_HANDSHAKE *,unsigned char *,ssl_early_callback_ctx const*)::kTLSVersions- v148+ 6, v148);
        }
        if (!bssl::ssl_negotiate_version(this, (char *)&var1F0.rbio, (_WORD *)(v144 + 16), (__int128 *)&v250[2]))
        {
          rbio_low = LOBYTE(var1F0.rbio);
          goto LABEL_472;
        }
        *(_WORD *)(*(_QWORD *)(v144 + 48) + 220) |= 2u;
        bssl::SSLAEADContext::SetVersionIfNullCipher(*(_QWORD *)(*(_QWORD *)(v144 + 48) + 272), *(_WORD *)(v144 + 16));
        if (!bssl::ssl_client_cipher_list_contains_cipher((uint64_t)&var1F0.s3, 22016)
          || bssl::ssl_protocol_version((bssl *)v144, v149) >= *v243)
        {
          *((_WORD *)this + 802) = var1F0.msg_callback;
          if (*(_QWORD *)&var1F0.hit != 32)
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 744);
            goto LABEL_473;
          }
          v150 = *((_QWORD *)v17 + 6);
          v151 = *((_OWORD *)var1F0.msg_callback_arg + 1);
          *(_OWORD *)(v150 + 48) = *(_OWORD *)var1F0.msg_callback_arg;
          *(_OWORD *)(v150 + 64) = v151;
          if (!var1F0.expand
            || !memchr((void *)var1F0.read_hash, 0, (size_t)var1F0.expand)
            || bssl::ssl_protocol_version(v17, v152) >= 0x304 && var1F0.expand != (COMP_CTX *)1)
          {
            ERR_put_error(16, 0, 256, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 756);
            bssl::ssl_send_alert(v17, (ssl_st *)2, 47);
            goto LABEL_473;
          }
          if ((bssl::ssl_parse_clienthello_tlsext((uint64_t)this, (uint64_t)&var1F0.s3) & 1) == 0)
          {
            ERR_put_error(16, 0, 190, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 763);
            goto LABEL_473;
          }
          v6 = 3;
          goto LABEL_204;
        }
        ERR_put_error(16, 0, 157, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 264);
        rbio_low = 86;
LABEL_330:
        LOBYTE(var1F0.rbio) = rbio_low;
        goto LABEL_472;
      case 3:
        v22 = *(bssl **)this;
        v23 = *(_QWORD *)(*((_QWORD *)this + 1) + 32);
        v24 = *(uint64_t (**)(_QWORD, _QWORD))(v23 + 72);
        if (!v24)
          goto LABEL_38;
        v25 = v24(*(_QWORD *)this, *(_QWORD *)(v23 + 80));
        if (!v25)
        {
          ERR_put_error(16, 0, 126, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 778);
          bssl::ssl_send_alert(v22, (ssl_st *)2, 80);
          goto LABEL_473;
        }
        if (v25 < 0)
        {
          prev_session = 8;
          goto LABEL_474;
        }
LABEL_38:
        if (!bssl::ssl_on_certificate_selected(this, a2))
          goto LABEL_473;
        if ((*((_BYTE *)this + 1600) & 0x80) == 0)
          goto LABEL_44;
        v26 = *((_QWORD *)v22 + 15);
        v27 = *(uint64_t (**)(bssl *, _QWORD))(v26 + 808);
        if (!v27)
          goto LABEL_44;
        v28 = v27(v22, *(_QWORD *)(v26 + 816));
        if (!v28)
          goto LABEL_44;
        if (v28 != 3)
        {
          ERR_put_error(16, 0, 289, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 801);
          bssl::ssl_send_alert(v22, (ssl_st *)2, 80);
          goto LABEL_473;
        }
        *((_DWORD *)this + 400) &= ~0x80u;
LABEL_44:
        if (bssl::ssl_protocol_version(v22, (const ssl_st *)a2) >= 0x304)
        {
          *((_DWORD *)this + 5) = 4;
          goto LABEL_205;
        }
        v115 = *((_QWORD *)v22 + 6);
        if (*(_DWORD *)(v115 + 216) == 1)
          bssl::ssl_server_handshake();
        *(_DWORD *)(v115 + 256) = 3;
        *(_QWORD *)&var1F0.packet_length = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v116 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v116 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.init_buf = v116;
        *(_OWORD *)&var1F0.init_num = v116;
        *(_OWORD *)&var1F0.read_hash = v116;
        *(_OWORD *)&var1F0.enc_write_ctx = v116;
        *(_OWORD *)&var1F0.param = v116;
        *(_OWORD *)&var1F0.cipher_list_by_id = v116;
        *(_OWORD *)&var1F0.read_ahead = v116;
        *(_OWORD *)&var1F0.msg_callback_arg = v116;
        *(_OWORD *)&var1F0.s3 = v116;
        if (!bssl::SSL_HANDSHAKE::GetClientHello((uint64_t *)this, (uint64_t)&var1F0.init_buf, (uint64_t)&var1F0.s3))goto LABEL_473;
        v117 = *(_QWORD *)(*((_QWORD *)this + 1) + 24);
        if (!v117)
          v117 = *(_QWORD *)(*((_QWORD *)v22 + 15) + 232);
        v233 = *(bssl **)this;
        var1F0.bbio = (BIO *)0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&var1F0.rwstate = 0xAAAAAAAAAAAAAAAALL;
        CBS_init(&var1F0.bbio, (uint64_t)var1F0.cipher_list_by_id, (uint64_t)var1F0.enc_read_ctx);
        i = (BIO *)sk_new_null();
        *(_QWORD *)&v250[2] = i;
        if (!i)
          goto LABEL_387;
        while (1)
        {
          if (!CBS_len((uint64_t)&var1F0.bbio))
          {
            var1F0.rbio = i;
            v157 = *(const STACK **)v117;
            if ((*((_BYTE *)v233 + 146) & 0x40) != 0)
            {
              v158 = *(_QWORD *)(v117 + 8);
              v234 = *(STACK **)v117;
              v157 = (const STACK *)i;
            }
            else
            {
              v158 = 0;
              v234 = (STACK *)i;
            }
            if (bssl::ssl_has_certificate(this, v119))
            {
              v173 = bssl::ssl_cipher_auth_mask_for_key(*((bssl **)this + 190), v171);
              v174 = EVP_PKEY_id(*((_QWORD *)this + 190)) == 6;
            }
            else
            {
              v174 = 0;
              v173 = 0;
            }
            LOWORD(var1F0.bbio) = -21846;
            shared_group = bssl::tls1_get_shared_group(this, (const ssl_st *)&var1F0.bbio, v172);
            v227 = (STACK *)i;
            v176 = 0;
            v177 = v174 | 2;
            if (!shared_group)
              v177 = v174;
            v178 = *(_QWORD *)(*((_QWORD *)this + 1) + 72);
            v179 = v178 == 0;
            if (v178)
              v180 = v177 | 8;
            else
              v180 = v177;
            if (v179)
              v181 = v173;
            else
              v181 = v173 | 4;
            v228 = v181;
            v229 = v180;
            v230 = -1;
            v231 = v158;
            while (1)
            {
              v182 = sk_num(v234);
              if (v176 >= v182)
                goto LABEL_514;
              v183 = sk_value(v234, v176);
              for (i = 0; ; i = (BIO *)((char *)i + 1))
              {
                v184 = sk_num(v157);
                if ((unint64_t)i >= v184)
                  break;
                if (*((_DWORD *)v183 + 4) == *((_DWORD *)sk_value(v157, (int)i) + 4))
                {
                  v232 = (unint64_t)i;
                  goto LABEL_433;
                }
              }
              v232 = 0;
LABEL_433:
              min_version = SSL_CIPHER_get_min_version(v183);
              if (min_version <= bssl::ssl_protocol_version(v233, v186)
                && (v188 = bssl::ssl_protocol_version(v233, v187),
                    v188 <= SSL_CIPHER_get_max_version((uint64_t)v183))
                && (*((_DWORD *)v183 + 5) & v229) != 0
                && (unint64_t)i < v184
                && (*((_DWORD *)v183 + 6) & v228) != 0)
              {
                if (!v231 || !*(_BYTE *)(v231 + v176))
                {
                  v200 = v230;
                  if (v232 < v230)
                    v200 = v232;
                  if (v230 == -1)
                    v192 = v232;
                  else
                    v192 = v200;
                  goto LABEL_513;
                }
                if (v232 < v230 || v230 == -1)
                  v190 = v232;
                else
                  v190 = v230;
                v230 = v190;
              }
              else if (v231 && !*(_BYTE *)(v231 + v176) && v230 != -1)
              {
                v192 = v230;
LABEL_513:
                i = (BIO *)sk_value(v157, v192);
LABEL_514:
                var1F0.rbio = 0;
                sk_free(v227);
                if (v176 >= v182)
                  v201 = 0;
                else
                  v201 = i;
                *((_QWORD *)this + 196) = v201;
                if (v201)
                {
                  v6 = 5;
LABEL_204:
                  *((_DWORD *)this + 5) = v6;
LABEL_205:
                  prev_session = 1;
                  goto LABEL_474;
                }
LABEL_388:
                ERR_put_error(16, 0, 184, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 833);
                bssl::ssl_send_alert(v22, (ssl_st *)2, 40);
                goto LABEL_473;
              }
              ++v176;
            }
          }
          LOWORD(var1F0.version) = -21846;
          if (!CBS_get_u16((unsigned __int16 **)&var1F0.bbio, &var1F0))
            break;
          cipher_by_value = (char *)SSL_get_cipher_by_value(LOWORD(var1F0.version));
          if (cipher_by_value && !sk_push((STACK *)i, cipher_by_value))
            goto LABEL_386;
        }
        ERR_put_error(16, 0, 148, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 287);
LABEL_386:
        var1F0.rbio = 0;
        *(_QWORD *)&v250[2] = 0;
        sk_free((STACK *)i);
LABEL_387:
        *((_QWORD *)this + 196) = 0;
        goto LABEL_388;
      case 4:
        prev_session = bssl::tls13_server_handshake(this, a2, a3);
        if ((_DWORD)prev_session == 1)
          *((_DWORD *)this + 5) = 20;
        goto LABEL_474;
      case 5:
        v47 = *(_QWORD *)this;
        *(_QWORD *)&var1F0.packet_length = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v48 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v48 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.init_buf = v48;
        *(_OWORD *)&var1F0.init_num = v48;
        if (!(*(unsigned int (**)(uint64_t, BUF_MEM **))(*(_QWORD *)v47 + 24))(v47, &var1F0.init_buf))
          goto LABEL_167;
        *(_QWORD *)&v49 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v49 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.read_hash = v49;
        *(_OWORD *)&var1F0.enc_write_ctx = v49;
        *(_OWORD *)&var1F0.param = v49;
        *(_OWORD *)&var1F0.cipher_list_by_id = v49;
        *(_OWORD *)&var1F0.read_ahead = v49;
        *(_OWORD *)&var1F0.msg_callback_arg = v49;
        *(_OWORD *)&var1F0.s3 = v49;
        if (!bssl::ssl_client_hello_init(v47, (uint64_t)&var1F0.s3, (unsigned __int16 *)var1F0.init_msg, *(unsigned __int16 **)&var1F0.init_num))goto LABEL_473;
        cipher_list = var1F0.cipher_list;
        cipher_list_low = LOBYTE(var1F0.cipher_list);
        *((_BYTE *)this + 1643) = var1F0.cipher_list;
        if (cipher_list >= 0x21uLL)
          bssl::ssl_server_handshake();
        if (cipher_list_low)
          memcpy(__dst, var1F0.param, cipher_list_low);
        var1F0.bbio = 0;
        v250[2] = 0;
        LOBYTE(var1F0.rbio) = 0;
        prev_session = bssl::ssl_get_prev_session((uint64_t *)this, (SSL_SESSION **)&var1F0.bbio, &v250[2], &var1F0.rbio, (uint64_t)&var1F0.s3);
        if ((_DWORD)prev_session != 1)
          goto LABEL_383;
        if (!var1F0.bbio)
          goto LABEL_297;
        if (((uint64_t)var1F0.bbio[4].method & 1) != 0 && (*((_BYTE *)this + 1602) & 2) == 0)
        {
          ERR_put_error(16, 0, 204, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 883);
          version_low = 40;
LABEL_381:
          bssl::ssl_send_alert((bssl *)v47, (ssl_st *)2, version_low);
          goto LABEL_382;
        }
        is_resumable = bssl::ssl_session_is_resumable(this, (const STACK **)var1F0.bbio, (const ssl_session_st *)a3);
        bbio = (SSL_SESSION *)var1F0.bbio;
        if (is_resumable)
        {
          v128 = *((_DWORD *)this + 400);
          if (((v128 >> 17) & 1) == ((uint64_t)var1F0.bbio[4].method & 1))
          {
LABEL_296:
            *((_DWORD *)this + 400) = v128 & 0xFFFEFFFF | (LOBYTE(var1F0.rbio) << 16);
            var1F0.bbio = 0;
            std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)(v47 + 104), bbio);
            *(_WORD *)(*(_QWORD *)(v47 + 48) + 220) |= 0x40u;
            *((_DWORD *)this + 400) |= 0x2000000u;
LABEL_301:
            v131 = *(unsigned int (**)(ssl3_state_st **))(*(_QWORD *)(v47 + 120) + 488);
            if (v131 && !v131(&var1F0.s3))
            {
              ERR_put_error(16, 0, 133, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 921);
              version_low = 80;
            }
            else
            {
              if (!*(_QWORD *)(v47 + 104))
              {
                v132 = (bssl *)*((_QWORD *)this + 196);
                *(_QWORD *)(*((_QWORD *)this + 192) + 208) = v132;
                v133 = *((_QWORD *)this + 1);
                v134 = *((_DWORD *)this + 400);
                v135 = v134 & 0xFFFFFFDF;
                v138 = (v134 & 0x4000000) == 0;
                v136 = v134 & 0xFFFFFFDF | (32 * (*(_BYTE *)(v133 + 312) & 1));
                *((_DWORD *)this + 400) = v136;
                v137 = *(_BYTE *)(v133 + 312) & 4;
                v138 = v138 || v137 == 0;
                if (v138)
                  v139 = v136;
                else
                  v139 = v135;
                *((_DWORD *)this + 400) = v139;
                v140 = bssl::ssl_cipher_uses_certificate_auth(v132, (const ssl_cipher_st *)a2);
                v141 = *((_DWORD *)this + 400);
                if (!v140)
                {
                  v141 &= ~0x20u;
                  *((_DWORD *)this + 400) = v141;
                }
                if ((v141 & 0x20) == 0)
                  *(_QWORD *)(*((_QWORD *)this + 192) + 184) = 0;
              }
              LOBYTE(var1F0.version) = 50;
              if ((bssl::ssl_negotiate_alpn((uint64_t)this, (char *)&var1F0, (uint64_t)&var1F0.s3) & 1) != 0)
              {
                v143 = (bssl *)bssl::ssl_protocol_version((bssl *)v47, v142);
                if (bssl::SSLTranscript::InitHash((size_t **)v244, v143, *((const ssl_cipher_st **)this + 196))&& (bssl::ssl_hash_message((uint64_t)this, (uint64_t)&var1F0.init_buf) & 1) != 0)
                {
                  if ((*((_DWORD *)this + 400) & 0x80020) == 0)
                    bssl::SSLTranscript::FreeBuffer(v244);
                  (*(void (**)(uint64_t))(*(_QWORD *)v47 + 32))(v47);
                  *((_DWORD *)this + 5) = 6;
                  prev_session = 1;
LABEL_383:
                  v159 = (SSL_SESSION *)var1F0.bbio;
                  var1F0.bbio = 0;
                  if (v159)
                    SSL_SESSION_free(v159);
                  goto LABEL_474;
                }
                version_low = 80;
              }
              else
              {
                version_low = LOBYTE(var1F0.version);
              }
            }
            goto LABEL_381;
          }
          var1F0.bbio = 0;
        }
        else
        {
          var1F0.bbio = 0;
          if (!bbio)
            goto LABEL_297;
        }
        SSL_SESSION_free(bbio);
        bbio = (SSL_SESSION *)var1F0.bbio;
        if (var1F0.bbio)
        {
          v128 = *((_DWORD *)this + 400);
          goto LABEL_296;
        }
LABEL_297:
        *((_DWORD *)this + 400) = *((_DWORD *)this + 400) & 0xFFFEFFFF | (v250[2] << 16);
        bssl::ssl_set_session((ssl_st **)v47, 0, (ssl_session_st *)a3);
        if (!bssl::ssl_get_new_session(this, v129))
        {
LABEL_382:
          prev_session = 0;
          goto LABEL_383;
        }
        if ((*((_BYTE *)this + 1602) & 1) == 0 && (*(_BYTE *)(*(_QWORD *)(v47 + 120) + 292) & 2) != 0)
        {
          v130 = *((_QWORD *)this + 192);
          *(_DWORD *)(v130 + 64) = 32;
          RAND_bytes((unsigned __int8 *)(v130 + 68), 32);
        }
        goto LABEL_301;
      case 6:
        v57 = *((_DWORD *)this + 400);
        if ((v57 & 0x4000000) != 0 && (*(_BYTE *)(*((_QWORD *)this + 196) + 20) & 2) == 0)
        {
          v57 &= ~0x4000000u;
          *((_DWORD *)this + 400) = v57;
        }
        v58 = *(_QWORD *)this;
        v59 = *(_QWORD *)(*(_QWORD *)this + 104);
        if (v59 && !*(_BYTE *)(v59 + 376))
        {
          v57 &= ~0x4000000u;
          *((_DWORD *)this + 400) = v57;
        }
        v60 = *((_QWORD *)this + 199);
        if (v60 && (v57 & 0x100000) == 0 && *(_QWORD *)(v60 + 8) == 32)
        {
          v61 = *(_QWORD *)(v58 + 48);
          v62 = *(_OWORD *)(*(_QWORD *)v60 + 16);
          *(_OWORD *)(v61 + 16) = *(_OWORD *)*(_QWORD *)v60;
          *(_OWORD *)(v61 + 32) = v62;
        }
        else
        {
          var1F0.s3 = (ssl3_state_st *)0xAAAAAAAAAAAAAAAALL;
          var1F0.d1 = (dtls1_state_st *)0xAAAAAAAAAAAAAAAALL;
          bssl::ssl_get_current_time(v58, (uint64_t)&var1F0.s3);
          *(_DWORD *)(*(_QWORD *)(v58 + 48) + 16) = bswap32(var1F0.s3);
          if (!RAND_bytes((unsigned __int8 *)(*(_QWORD *)(v58 + 48) + 20), 28))
            goto LABEL_473;
          if (v60 && (*((_BYTE *)this + 1602) & 0x10) != 0)
          {
            v80 = *(_QWORD *)(v58 + 48);
            if (!bssl::Array<unsigned char>::Init(v60, 0x20uLL))
              goto LABEL_473;
            v81 = *(_OWORD **)v60;
            v82 = *(_OWORD *)(v80 + 32);
            *v81 = *(_OWORD *)(v80 + 16);
            v81[1] = v82;
          }
        }
        if (bssl::ssl_supports_version(this, (const bssl::SSL_HANDSHAKE *)0x304))
        {
          v84 = bssl::ssl_protocol_version((bssl *)v58, v83);
          v85 = "DOWNGRD";
          if (v84 == 771)
          {
            v85 = bssl::kJDK11DowngradeRandom;
            if ((*((_BYTE *)this + 1603) & 1) == 0)
              v85 = bssl::kTLS13DowngradeRandom;
          }
          *(_QWORD *)(*(_QWORD *)(v58 + 48) + 40) = *(_QWORD *)v85;
        }
        if (*(_QWORD *)(v58 + 104))
        {
          v86 = *((unsigned __int8 *)this + 1643);
          v87 = __dst;
        }
        else
        {
          v106 = *((_QWORD *)this + 192);
          v87 = (const void *)(v106 + 68);
          v86 = *(unsigned int *)(v106 + 64);
        }
        *(_QWORD *)&v107 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v107 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.read_ahead = v107;
        *(_OWORD *)&var1F0.msg_callback_arg = v107;
        *(_OWORD *)&var1F0.s3 = v107;
        CBB_zero(&var1F0.s3);
        *(_QWORD *)&v108 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v108 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.init_num = v108;
        *(_OWORD *)&var1F0.packet_length = v108;
        *(_OWORD *)&var1F0.init_buf = v108;
        *(_OWORD *)&var1F0.handshake_func = v108;
        *(_OWORD *)&var1F0.quiet_shutdown = v108;
        *(_OWORD *)&var1F0.bbio = v108;
        if (!(*(unsigned int (**)(uint64_t, ssl3_state_st **, BUF_MEM **, uint64_t))(*(_QWORD *)v58 + 88))(v58, &var1F0.s3, &var1F0.init_buf, 2)|| !CBB_add_u16((uint64_t)&var1F0.init_buf, *(unsigned __int16 *)(v58 + 16))|| !CBB_add_bytes((uint64_t)&var1F0.init_buf, (const void *)(*(_QWORD *)(v58 + 48) + 16), 0x20uLL)|| !CBB_add_u8_length_prefixed((uint64_t *)&var1F0.init_buf, (uint64_t)&var1F0.bbio)|| !CBB_add_bytes((uint64_t)&var1F0.bbio, v87, v86)|| (protocol_id = SSL_CIPHER_get_protocol_id(*((_QWORD *)this + 196)), !CBB_add_u16((uint64_t)&var1F0.init_buf, protocol_id))|| !CBB_add_u8((uint64_t)&var1F0.init_buf, 0)|| !bssl::ssl_add_serverhello_tlsext((uint64_t)this, (uint64_t *)&var1F0.init_buf)|| (bssl::ssl_add_message_cbb(v58, (uint64_t)&var1F0.s3) & 1) == 0)
        {
          ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1056);
          prev_session = 0;
          goto LABEL_558;
        }
        if (!*(_QWORD *)(v58 + 104))
        {
          v110 = 7;
          goto LABEL_502;
        }
        if ((*((_BYTE *)this + 1602) & 0x10) == 0)
        {
          v110 = 19;
LABEL_502:
          *((_DWORD *)this + 5) = v110;
          prev_session = 1;
          goto LABEL_558;
        }
        prev_session = 17;
        goto LABEL_558;
      case 7:
        v29 = *(bssl **)this;
        *(_QWORD *)&v30 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v30 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.read_ahead = v30;
        *(_OWORD *)&var1F0.msg_callback_arg = v30;
        *(_OWORD *)&var1F0.s3 = v30;
        CBB_zero(&var1F0.s3);
        if (!bssl::ssl_cipher_uses_certificate_auth(*((bssl **)this + 196), v31))
          goto LABEL_50;
        if (!bssl::ssl_has_certificate(this, v32))
        {
          ERR_put_error(16, 0, 174, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1078);
          prev_session = 0;
          goto LABEL_558;
        }
        if (!bssl::ssl_output_cert_chain(this, v33))
          goto LABEL_390;
        if ((*((_BYTE *)this + 1600) & 0x40) == 0)
          goto LABEL_50;
        *(_QWORD *)&v122 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v122 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.init_num = v122;
        *(_OWORD *)&var1F0.packet_length = v122;
        *(_OWORD *)&var1F0.init_buf = v122;
        *(_OWORD *)&var1F0.handshake_func = v122;
        *(_OWORD *)&var1F0.quiet_shutdown = v122;
        *(_OWORD *)&var1F0.bbio = v122;
        if (!(*(unsigned int (**)(bssl *, ssl3_state_st **, BUF_MEM **, uint64_t))(*(_QWORD *)v29 + 88))(v29, &var1F0.s3, &var1F0.init_buf, 22))goto LABEL_265;
        if (CBB_add_u8((uint64_t)&var1F0.init_buf, 1u)
          && CBB_add_u24_length_prefixed((uint64_t *)&var1F0.init_buf, (uint64_t)&var1F0.bbio)
          && (v123 = (const void *)CRYPTO_BUFFER_data(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 1) + 32) + 104)),
              v124 = CRYPTO_BUFFER_len(*(_QWORD *)(*(_QWORD *)(*((_QWORD *)this + 1) + 32) + 104)),
              CBB_add_bytes((uint64_t)&var1F0.bbio, v123, v124))
          && (bssl::ssl_add_message_cbb((uint64_t)v29, (uint64_t)&var1F0.s3) & 1) != 0)
        {
LABEL_50:
          v34 = (bssl *)*((_QWORD *)this + 196);
          v36 = *((_DWORD *)v34 + 5);
          v35 = *((_DWORD *)v34 + 6);
          if ((bssl::ssl_cipher_requires_server_key_exchange(v34, (const ssl_cipher_st *)v32) & 1) == 0
            && ((v35 & 4) == 0 || !*(_QWORD *)(*((_QWORD *)this + 1) + 56)))
          {
            goto LABEL_364;
          }
          *(_QWORD *)&v37 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v37 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)&var1F0.init_num = v37;
          *(_OWORD *)&var1F0.packet_length = v37;
          *(_OWORD *)&var1F0.init_buf = v37;
          if (!CBB_init((uint64_t)&var1F0.s3, 0xC0uLL)
            || !CBB_add_bytes((uint64_t)&var1F0.s3, (const void *)(*((_QWORD *)v29 + 6) + 48), 0x20uLL)
            || !CBB_add_bytes((uint64_t)&var1F0.s3, (const void *)(*((_QWORD *)v29 + 6) + 16), 0x20uLL))
          {
            goto LABEL_390;
          }
          if ((v35 & 4) != 0)
          {
            v39 = *(const char **)(*((_QWORD *)this + 1) + 56);
            v40 = v39 ? strlen(v39) : 0;
            if (!CBB_add_u16_length_prefixed((uint64_t *)&var1F0.s3, (uint64_t)&var1F0.init_buf)
              || !CBB_add_bytes((uint64_t)&var1F0.init_buf, *(const void **)(*((_QWORD *)this + 1) + 56), v40))
            {
              goto LABEL_390;
            }
          }
          if ((v36 & 2) != 0)
          {
            *(_WORD *)&v250[2] = -21846;
            if ((bssl::tls1_get_shared_group(this, (const ssl_st *)&v250[2], v38) & 1) == 0)
            {
              ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1134);
              bssl::ssl_send_alert(v29, (ssl_st *)2, 40);
              goto LABEL_390;
            }
            v153 = (_QWORD *)*(unsigned __int16 *)&v250[2];
            *(_WORD *)(*((_QWORD *)this + 192) + 6) = *(_WORD *)&v250[2];
            bssl::SSLKeyShare::Create(v153, &var1F0.bbio);
            v154 = var1F0.bbio;
            var1F0.bbio = 0;
            std::unique_ptr<bssl::SSLKeyShare,bssl::internal::Deleter>::reset[abi:ne180100](v239, v154);
            std::unique_ptr<bssl::SSLKeyShare,bssl::internal::Deleter>::reset[abi:ne180100]((_QWORD **)&var1F0.bbio, 0);
            if (!*v239
              || !CBB_add_u8((uint64_t)&var1F0.s3, 3u)
              || !CBB_add_u16((uint64_t)&var1F0.s3, *(unsigned __int16 *)&v250[2])
              || !CBB_add_u8_length_prefixed((uint64_t *)&var1F0.s3, (uint64_t)&var1F0.init_buf))
            {
              goto LABEL_390;
            }
            v155 = *((_QWORD *)this + 199);
            if (v155
              && (*((_BYTE *)this + 1602) & 0x10) == 0
              && *(unsigned __int16 *)(v155 + 184) == *(unsigned __int16 *)&v250[2]
              && *(_QWORD *)(v155 + 200)
              && (v156 = *(_QWORD *)(v155 + 216)) != 0
              && (var1F0.bbio = *(BIO **)(v155 + 208),
                  *(_QWORD *)&var1F0.rwstate = v156,
                  ((*(uint64_t (**)(_QWORD, BIO **))(**v239 + 56))(*v239, &var1F0.bbio) & 1) != 0))
            {
              if (!CBB_add_bytes((uint64_t)&var1F0.init_buf, *(const void **)(v155 + 192), *(_QWORD *)(v155 + 200)))goto LABEL_390;
            }
            else
            {
              if (!(*(unsigned int (**)(_QWORD, BUF_MEM **))(**v239 + 24))(*v239, &var1F0.init_buf))
                goto LABEL_390;
              if (v155 && (*((_BYTE *)this + 1602) & 0x10) != 0)
              {
                *(_QWORD *)&v195 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v195 + 1) = 0xAAAAAAAAAAAAAAAALL;
                *(_OWORD *)&var1F0.handshake_func = v195;
                *(_OWORD *)&var1F0.quiet_shutdown = v195;
                *(_OWORD *)&var1F0.bbio = v195;
                CBB_zero(&var1F0.bbio);
                v196 = CBB_data((uint64_t)&var1F0.init_buf);
                v197 = CBB_len((uint64_t)&var1F0.init_buf);
                v198 = bssl::Array<unsigned char>::Init(v155 + 192, v197);
                v199 = v198 ^ 1;
                if (!v197)
                  v199 = 1;
                if ((v199 & 1) == 0)
                  memcpy(*(void **)(v155 + 192), v196, v197);
                if (!v198
                  || !CBB_init((uint64_t)&var1F0.bbio, 0x20uLL)
                  || !(*(unsigned int (**)(_QWORD, BIO **))(**v239 + 48))(*v239, &var1F0.bbio)
                  || !bssl::CBBFinishArray((uint64_t)&var1F0.bbio, v155 + 208))
                {
                  CBB_cleanup((uint64_t)&var1F0.bbio);
                  goto LABEL_390;
                }
                *(_WORD *)(v155 + 184) = *(_WORD *)&v250[2];
                CBB_cleanup((uint64_t)&var1F0.bbio);
              }
            }
          }
          else if ((v36 & 8) == 0)
          {
            __assert_rtn("do_send_server_certificate", "handshake_server.cc", 1183, "alg_k & SSL_kPSK");
          }
          if (bssl::CBBFinishArray((uint64_t)&var1F0.s3, (uint64_t)v241))
          {
LABEL_364:
            *((_DWORD *)this + 5) = 8;
            prev_session = 1;
            goto LABEL_558;
          }
        }
        else
        {
LABEL_265:
          ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1097);
        }
LABEL_390:
        prev_session = 0;
LABEL_558:
        CBB_cleanup((uint64_t)&var1F0.s3);
        goto LABEL_474;
      case 8:
        if (!*((_QWORD *)this + 184))
        {
          v6 = 9;
          goto LABEL_204;
        }
        v66 = *(bssl **)this;
        *(_QWORD *)&v67 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v67 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.read_ahead = v67;
        *(_OWORD *)&var1F0.msg_callback_arg = v67;
        *(_OWORD *)&var1F0.s3 = v67;
        CBB_zero(&var1F0.s3);
        *(_QWORD *)&v68 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v68 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.init_num = v68;
        *(_OWORD *)&var1F0.packet_length = v68;
        *(_OWORD *)&var1F0.init_buf = v68;
        *(_OWORD *)&var1F0.handshake_func = v68;
        *(_OWORD *)&var1F0.quiet_shutdown = v68;
        *(_OWORD *)&var1F0.bbio = v68;
        if (!(*(unsigned int (**)(bssl *, ssl3_state_st **, BUF_MEM **, uint64_t))(*(_QWORD *)v66 + 88))(v66, &var1F0.s3, &var1F0.init_buf, 12))goto LABEL_557;
        v69 = *((_QWORD *)this + 184);
        if (v69 < 0x40 || !CBB_add_bytes((uint64_t)&var1F0.init_buf, *v241 + 8, v69 - 64))
          goto LABEL_557;
        if (!bssl::ssl_cipher_uses_certificate_auth(*((bssl **)this + 196), v70))
          goto LABEL_555;
        if (!bssl::ssl_has_private_key(this, v71))
        {
          bssl::ssl_send_alert(v66, (ssl_st *)2, 80);
          goto LABEL_557;
        }
        LOWORD(var1F0.version) = -21846;
        if ((bssl::tls1_choose_signature_algorithm(this, &var1F0, v72) & 1) != 0)
        {
          if (bssl::ssl_protocol_version(v66, v73) < 0x303
            || CBB_add_u16((uint64_t)&var1F0.init_buf, LOWORD(var1F0.version)))
          {
            v74 = EVP_PKEY_size(*((EVP_PKEY **)this + 190));
            *(_QWORD *)&v250[2] = 0xAAAAAAAAAAAAAAAALL;
            if (CBB_add_u16_length_prefixed((uint64_t *)&var1F0.init_buf, (uint64_t)&var1F0.bbio)
              && CBB_reserve((uint64_t)&var1F0.bbio, &v250[2], v74))
            {
              var1F0.rbio = (BIO *)v74;
              v75 = bssl::ssl_private_key_sign((uint64_t)this, *(ssl_st **)&v250[2], (unint64_t *)&var1F0.rbio, v74, (evp_pkey_st *)LOWORD(var1F0.version), *((unsigned __int8 **)this + 183), *((_QWORD *)this + 184));
              if (v75)
              {
                if (v75 == 1)
                {
                  prev_session = 9;
                  goto LABEL_558;
                }
                if (v75 == 2)
                  goto LABEL_557;
LABEL_555:
                *((_DWORD *)this + 400) |= 0x2000000u;
                if (bssl::ssl_add_message_cbb((uint64_t)v66, (uint64_t)&var1F0.s3))
                {
                  OPENSSL_free(*v241);
                  *v241 = 0;
                  v241[1] = 0;
                  prev_session = 1;
                  *((_DWORD *)this + 5) = 9;
                  goto LABEL_558;
                }
                goto LABEL_557;
              }
              if (CBB_did_write((uint64_t)&var1F0.bbio, (uint64_t)var1F0.rbio))
                goto LABEL_555;
            }
LABEL_557:
            prev_session = 0;
            goto LABEL_558;
          }
          ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1229);
          v165 = 80;
        }
        else
        {
          v165 = 40;
        }
        bssl::ssl_send_alert(v66, (ssl_st *)2, v165);
        goto LABEL_557;
      case 9:
        if ((*((_BYTE *)this + 1602) & 0x10) != 0)
        {
          prev_session = 17;
          goto LABEL_474;
        }
        v14 = *(bssl **)this;
        *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.read_ahead = v15;
        *(_OWORD *)&var1F0.msg_callback_arg = v15;
        *(_OWORD *)&var1F0.s3 = v15;
        CBB_zero(&var1F0.s3);
        *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.init_num = v16;
        *(_OWORD *)&var1F0.packet_length = v16;
        *(_OWORD *)&var1F0.init_buf = v16;
        if ((*((_BYTE *)this + 1600) & 0x20) == 0
          || (*(_OWORD *)&var1F0.handshake_func = v16,
              *(_OWORD *)&var1F0.quiet_shutdown = v16,
              *(_OWORD *)&var1F0.bbio = v16,
              *(_OWORD *)&v250[18] = v16,
              v251 = v16,
              *(_OWORD *)&v250[2] = v16,
              (*(unsigned int (**)(bssl *, ssl3_state_st **, BUF_MEM **, uint64_t))(*(_QWORD *)v14 + 88))(v14, &var1F0.s3, &var1F0.init_buf, 13))&& CBB_add_u8_length_prefixed((uint64_t *)&var1F0.init_buf, (uint64_t)&var1F0.bbio)&& CBB_add_u8((uint64_t)&var1F0.bbio, 1u)&& CBB_add_u8((uint64_t)&var1F0.bbio, 0x40u)&& (bssl::ssl_protocol_version(v14, v104) < 0x303|| CBB_add_u16_length_prefixed((uint64_t *)&var1F0.init_buf, (uint64_t)&v250[2])&& bssl::tls12_add_verify_sigalgs((uint64_t)this, (uint64_t)&v250[2]))&& bssl::ssl_add_client_CA_list(this, (uint64_t *)&var1F0.init_buf)&& (bssl::ssl_add_message_cbb((uint64_t)v14, (uint64_t)&var1F0.s3) & 1) != 0)
        {
          if ((*(unsigned int (**)(bssl *, ssl3_state_st **, BUF_MEM **, uint64_t))(*(_QWORD *)v14 + 88))(v14, &var1F0.s3, &var1F0.init_buf, 14)&& (bssl::ssl_add_message_cbb((uint64_t)v14, (uint64_t)&var1F0.s3) & 1) != 0)
          {
            *((_DWORD *)this + 5) = 10;
            prev_session = 4;
          }
          else
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1298);
            prev_session = 0;
          }
        }
        else
        {
          ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1290);
          prev_session = 0;
        }
        goto LABEL_558;
      case 10:
        v64 = *(bssl **)this;
        v65 = *((_DWORD *)this + 400);
        if ((v65 & 0x80000) != 0 && *(_DWORD *)(*((_QWORD *)this + 196) + 20) == 2)
          goto LABEL_105;
        if ((v65 & 0x20) == 0)
          goto LABEL_138;
        var1F0.msg_callback_arg = (void *)0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v92 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v92 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.s3 = v92;
        *(_OWORD *)&var1F0.read_ahead = v92;
        if (!(*(unsigned int (**)(bssl *, ssl3_state_st **))(*(_QWORD *)v64 + 24))(v64, &var1F0.s3))
          goto LABEL_167;
        if (!bssl::ssl_check_message_type(v64, (uint64_t)&var1F0.s3, 11)
          || !bssl::ssl_hash_message((uint64_t)this, (uint64_t)&var1F0.s3))
        {
          goto LABEL_473;
        }
        *(_OWORD *)&var1F0.init_buf = *(_OWORD *)&var1F0.d1;
        LOBYTE(var1F0.bbio) = 50;
        v93 = *((_QWORD *)this + 192);
        v94 = (unint64_t **)(v93 + 144);
        v95 = (unsigned __int8 *)(v93 + 280);
        if ((*(_WORD *)(*((_QWORD *)this + 1) + 313) & 0x20) != 0)
          v96 = v95;
        else
          v96 = 0;
        if ((bssl::ssl_parse_cert_chain((char *)&var1F0.bbio, v94, v240, v96, (unsigned __int8 **)&var1F0.init_buf, *(_QWORD ***)(*((_QWORD *)v64 + 15) + 792)) & 1) == 0)
        {
          bssl::ssl_send_alert(v64, (ssl_st *)2, LOBYTE(var1F0.bbio));
          goto LABEL_473;
        }
        if (CBS_len((uint64_t)&var1F0.init_buf)
          || ((*(uint64_t (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)v64 + 15) + 8) + 48))(*((_QWORD *)this + 192)) & 1) == 0)
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1343);
          bssl::ssl_send_alert(v64, (ssl_st *)2, 50);
          goto LABEL_473;
        }
        if (sk_num(*(const STACK **)(*((_QWORD *)this + 192) + 144)))
        {
          if ((*(_WORD *)(*((_QWORD *)this + 1) + 313) & 0x20) != 0)
            *(_BYTE *)(*((_QWORD *)this + 192) + 448) |= 2u;
        }
        else
        {
          bssl::SSLTranscript::FreeBuffer(v244);
          if ((*(_BYTE *)(*((_QWORD *)this + 1) + 312) & 2) != 0)
          {
            ERR_put_error(16, 0, 192, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1354);
            bssl::ssl_send_alert(v64, (ssl_st *)2, 40);
            goto LABEL_473;
          }
          *(_QWORD *)(*((_QWORD *)this + 192) + 184) = 0;
        }
        (*(void (**)(bssl *))(*(_QWORD *)v64 + 32))(v64);
LABEL_138:
        v6 = 11;
        goto LABEL_204;
      case 11:
        if (!sk_num(*(const STACK **)(*((_QWORD *)this + 192) + 144)))
          goto LABEL_139;
        v7 = bssl::ssl_verify_peer_cert(this, a2);
        if (v7 == 1)
          goto LABEL_473;
        if (v7 == 2)
        {
          prev_session = 16;
          goto LABEL_474;
        }
LABEL_139:
        v6 = 12;
        goto LABEL_204;
      case 12:
        v8 = *(bssl **)this;
        *(_QWORD *)&v251 = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v250[2] = v9;
        *(_OWORD *)&v250[18] = v9;
        if (!(*(unsigned int (**)(bssl *, _BYTE *))(*(_QWORD *)v8 + 24))(v8, &v250[2]))
          goto LABEL_167;
        if (!bssl::ssl_check_message_type(v8, (uint64_t)&v250[2], 16))
          goto LABEL_473;
        *(_OWORD *)&var1F0.rbio = *(_OWORD *)&v250[10];
        v10 = *((_QWORD *)this + 196);
        v12 = *(_DWORD *)(v10 + 20);
        v11 = *(_DWORD *)(v10 + 24);
        if ((v11 & 4) == 0)
          goto LABEL_19;
        var1F0.s3 = (ssl3_state_st *)0xAAAAAAAAAAAAAAAALL;
        var1F0.d1 = (dtls1_state_st *)0xAAAAAAAAAAAAAAAALL;
        if (!CBS_get_u16_length_prefixed((unsigned __int8 **)&var1F0.rbio, (unint64_t *)&var1F0.s3)|| (v12 & 8) != 0 && CBS_len((uint64_t)&var1F0.rbio))
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1411);
          v121 = 50;
LABEL_279:
          bssl::ssl_send_alert(v8, (ssl_st *)2, v121);
          goto LABEL_473;
        }
        if ((unint64_t)CBS_len((uint64_t)&var1F0.s3) > 0x80 || CBS_contains_zero_byte((uint64_t)&var1F0.s3))
        {
          ERR_put_error(16, 0, 136, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1418);
          v121 = 47;
          goto LABEL_279;
        }
        var1F0.init_buf = 0;
        if (!CBS_strdup((uint64_t)&var1F0.s3, (_QWORD **)&var1F0.init_buf))
        {
          bssl::ssl_send_alert(v8, (ssl_st *)2, 80);
          goto LABEL_473;
        }
        std::unique_ptr<char,bssl::internal::Deleter>::reset[abi:ne180100]((_QWORD **)(*((_QWORD *)this + 192) + 136), &var1F0.init_buf->length);
LABEL_19:
        *(_QWORD *)&var1F0.version = 0;
        var1F0.method = 0;
        if ((v12 & 1) == 0)
        {
          if ((v12 & 2) != 0)
          {
            var1F0.s3 = (ssl3_state_st *)0xAAAAAAAAAAAAAAAALL;
            var1F0.d1 = (dtls1_state_st *)0xAAAAAAAAAAAAAAAALL;
            if (!CBS_get_u8_length_prefixed((unsigned __int8 **)&var1F0.rbio, (unint64_t *)&var1F0.s3)|| CBS_len((uint64_t)&var1F0.rbio))
            {
              ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1512);
              bssl::ssl_send_alert(v8, (ssl_st *)2, 50);
              goto LABEL_551;
            }
            LOBYTE(var1F0.init_buf) = 50;
            if (((*(uint64_t (**)(_QWORD, ssl_st *, BUF_MEM **, ssl3_state_st *, dtls1_state_st *))(**v239 + 40))(*v239, &var1F0, &var1F0.init_buf, var1F0.s3, var1F0.d1) & 1) == 0)
            {
              bssl::ssl_send_alert(v8, (ssl_st *)2, LOBYTE(var1F0.init_buf));
              goto LABEL_551;
            }
            std::unique_ptr<bssl::SSLKeyShare,bssl::internal::Deleter>::reset[abi:ne180100](v239, 0);
            std::unique_ptr<bssl::SSLKeyShare,bssl::internal::Deleter>::reset[abi:ne180100](v238, 0);
          }
          else if ((v12 & 8) == 0)
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1528);
            v13 = 40;
LABEL_550:
            bssl::ssl_send_alert(v8, (ssl_st *)2, v13);
            goto LABEL_551;
          }
          LODWORD(prev_session) = 0;
          goto LABEL_525;
        }
        var1F0.s3 = (ssl3_state_st *)0xAAAAAAAAAAAAAAAALL;
        var1F0.d1 = (dtls1_state_st *)0xAAAAAAAAAAAAAAAALL;
        if (!CBS_get_u16_length_prefixed((unsigned __int8 **)&var1F0.rbio, (unint64_t *)&var1F0.s3)|| CBS_len((uint64_t)&var1F0.rbio))
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1437);
          bssl::ssl_send_alert(v8, (ssl_st *)2, 50);
          goto LABEL_551;
        }
        var1F0.init_buf = 0;
        var1F0.init_msg = 0;
        v160 = EVP_PKEY_size(*((EVP_PKEY **)this + 190));
        v161 = bssl::Array<unsigned char>::Init((uint64_t)&var1F0.init_buf, v160);
        init_buf = var1F0.init_buf;
        if ((v161 & 1) == 0)
        {
          prev_session = 0;
          v191 = 1;
          goto LABEL_524;
        }
        var1F0.bbio = (BIO *)0xAAAAAAAAAAAAAAAALL;
        v163 = bssl::ssl_private_key_decrypt((uint64_t *)this, (uint64_t)var1F0.init_buf, (uint64_t)&var1F0.bbio, (uint64_t)var1F0.init_msg, (uint64_t)var1F0.s3, (uint64_t)var1F0.d1);
        if (v163 == 1)
        {
          prev_session = 9;
LABEL_522:
          v191 = 1;
LABEL_523:
          init_buf = var1F0.init_buf;
LABEL_524:
          OPENSSL_free(init_buf);
          if (v191)
            goto LABEL_552;
LABEL_525:
          if ((v11 & 4) == 0)
          {
LABEL_526:
            if (!bssl::ssl_hash_message((uint64_t)this, (uint64_t)&v250[2]))
              goto LABEL_551;
            master_secret = bssl::tls1_generate_master_secret((uint64_t *)this, (_BYTE *)(*((_QWORD *)this + 192) + 16), *(char **)&var1F0.version, (unint64_t)var1F0.method);
            v203 = *((_QWORD *)this + 192);
            *(_DWORD *)(v203 + 12) = master_secret;
            if (!master_secret)
              goto LABEL_551;
            *(_BYTE *)(v203 + 448) = *(_BYTE *)(v203 + 448) & 0xFE | ((*((_DWORD *)this + 400) & 0x20000) != 0);
            *((_DWORD *)this + 400) |= 0x2000000u;
            (*(void (**)(bssl *))(*(_QWORD *)v8 + 32))(v8);
            *((_DWORD *)this + 5) = 13;
            prev_session = 1;
LABEL_552:
            OPENSSL_free(*(_QWORD **)&var1F0.version);
            goto LABEL_474;
          }
          v204 = *((_QWORD *)this + 1);
          if (!*(_QWORD *)(v204 + 72))
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1537);
            v13 = 80;
            goto LABEL_550;
          }
          v205.sk = (STACK *)0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v205.dummy = 0xAAAAAAAAAAAAAAAALL;
          *(CRYPTO_EX_DATA *)&var1F0.debug = v205;
          var1F0.ex_data = v205;
          *(CRYPTO_EX_DATA *)&var1F0.verify_callback = v205;
          *(CRYPTO_EX_DATA *)&var1F0.error = v205;
          *(CRYPTO_EX_DATA *)&var1F0.sid_ctx[28] = v205;
          *(CRYPTO_EX_DATA *)&var1F0.generate_session_id = v205;
          *(CRYPTO_EX_DATA *)&var1F0.sid_ctx_length = v205;
          *(CRYPTO_EX_DATA *)&var1F0.sid_ctx[12] = v205;
          *(CRYPTO_EX_DATA *)&var1F0.enc_write_ctx = v205;
          *(CRYPTO_EX_DATA *)&var1F0.compress = v205;
          *(CRYPTO_EX_DATA *)&var1F0.cipher_list_by_id = v205;
          *(CRYPTO_EX_DATA *)&var1F0.read_hash = v205;
          *(CRYPTO_EX_DATA *)&var1F0.msg_callback_arg = v205;
          *(CRYPTO_EX_DATA *)&var1F0.param = v205;
          *(CRYPTO_EX_DATA *)&var1F0.s3 = v205;
          *(CRYPTO_EX_DATA *)&var1F0.read_ahead = v205;
          v206 = (*(uint64_t (**)(bssl *, _QWORD, ssl3_state_st **, uint64_t))(v204 + 72))(v8, *(_QWORD *)(*((_QWORD *)this + 192) + 136), &var1F0.s3, 256);
          v207 = v206;
          if (v206 >= 0x101)
          {
            ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1547);
            v13 = 80;
            goto LABEL_550;
          }
          if (!v206)
          {
            ERR_put_error(16, 0, 195, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1552);
            v13 = 115;
            goto LABEL_550;
          }
          if ((v12 & 8) == 0)
          {
LABEL_538:
            *(_QWORD *)&v208 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v208 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)&var1F0.init_num = v208;
            *(_OWORD *)&var1F0.packet_length = v208;
            *(_OWORD *)&var1F0.init_buf = v208;
            CBB_zero(&var1F0.init_buf);
            *(_QWORD *)&v209 = 0xAAAAAAAAAAAAAAAALL;
            *((_QWORD *)&v209 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)&var1F0.handshake_func = v209;
            *(_OWORD *)&var1F0.quiet_shutdown = v209;
            *(_OWORD *)&var1F0.bbio = v209;
            if (CBB_init((uint64_t)&var1F0.init_buf, (unint64_t)&var1F0.method->version + v207 + 4)
              && CBB_add_u16_length_prefixed((uint64_t *)&var1F0.init_buf, (uint64_t)&var1F0.bbio)
              && CBB_add_bytes((uint64_t)&var1F0.bbio, *(const void **)&var1F0.version, (size_t)var1F0.method)&& CBB_add_u16_length_prefixed((uint64_t *)&var1F0.init_buf, (uint64_t)&var1F0.bbio)&& CBB_add_bytes((uint64_t)&var1F0.bbio, &var1F0.s3, v207))
            {
              v210 = bssl::CBBFinishArray((uint64_t)&var1F0.init_buf, (uint64_t)&var1F0);
              v211 = !v210;
              if (v210)
                prev_session = prev_session;
              else
                prev_session = 0;
            }
            else
            {
              prev_session = 0;
              v211 = 1;
            }
            CBB_cleanup((uint64_t)&var1F0.init_buf);
            if (v211)
              goto LABEL_552;
            goto LABEL_526;
          }
          if (bssl::Array<unsigned char>::Init((uint64_t)&var1F0, v206))
          {
            if (var1F0.method)
              bzero(*(void **)&var1F0.version, (size_t)var1F0.method);
            goto LABEL_538;
          }
LABEL_551:
          prev_session = 0;
          goto LABEL_552;
        }
        if (v163 == 2)
          goto LABEL_521;
        if (var1F0.bbio == var1F0.init_msg)
        {
          if (!bssl::Array<unsigned char>::Init((uint64_t)&var1F0, 0x30uLL)
            || !RAND_bytes(*(unsigned __int8 **)&var1F0.version, (int)var1F0.method))
          {
            goto LABEL_521;
          }
          if (var1F0.bbio >= (BIO *)((char *)&var1F0.method->ssl_new + 3))
          {
            v212 = (char *)var1F0.bbio - (char *)var1F0.method;
            v213 = (((BYTE1(var1F0.init_buf->length) ^ 2) - 1) & (var1F0.init_buf->length - 1)) >> 63;
            if ((unint64_t)((char *)var1F0.bbio - (char *)var1F0.method - 1) >= 3)
            {
              v214 = v212 - 3;
              v215 = (unsigned __int8 *)&var1F0.init_buf->length + 2;
              do
              {
                v216 = *v215++;
                LODWORD(v213) = v213 & ~((v216 - 1) >> 63);
                --v214;
              }
              while (v214);
            }
            if (var1F0.method)
            {
              v217 = 0;
              v218 = v213 & ((((*((unsigned __int8 *)&var1F0.init_buf->length + v212) ^ HIBYTE(*((unsigned __int16 *)this
                                                                                               + 802)))
                             - 1) & (*((unsigned __int8 *)var1F0.init_buf + v212 - 1) - 1) & ((*((_WORD *)this + 802) ^ *((unsigned __int8 *)&var1F0.init_buf->length + v212 + 1))
                                                                                                - 1)) >> 63);
              do
              {
                v191 = 0;
                prev_session = 0;
                *((_BYTE *)&v217->version + *(_QWORD *)&var1F0.version) = ~v218 & *((_BYTE *)&v217->version
                                                                                  + *(_QWORD *)&var1F0.version) | v218 & *((_BYTE *)&var1F0.init_buf->length + v212 + (unint64_t)v217);
                v217 = (SSL_METHOD *)((char *)v217 + 1);
              }
              while (v217 < var1F0.method);
            }
            else
            {
              v191 = 0;
              prev_session = 0;
            }
            goto LABEL_523;
          }
          v164 = 1480;
        }
        else
        {
          v164 = 1463;
        }
        ERR_put_error(16, 0, 138, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", v164);
        bssl::ssl_send_alert(v8, (ssl_st *)2, 51);
LABEL_521:
        prev_session = 0;
        goto LABEL_522;
      case 13:
        if (*((_QWORD *)this + 191))
        {
          v53 = *(bssl **)this;
          var1F0.msg_callback_arg = (void *)0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v54 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v54 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)&var1F0.s3 = v54;
          *(_OWORD *)&var1F0.read_ahead = v54;
          if (!(*(unsigned int (**)(bssl *, ssl3_state_st **))(*(_QWORD *)v53 + 24))(v53, &var1F0.s3))
          {
LABEL_167:
            prev_session = 3;
            goto LABEL_474;
          }
          if (!bssl::ssl_check_message_type(v53, (uint64_t)&var1F0.s3, 15))
            goto LABEL_473;
          v55 = sk_value(*(const STACK **)(*((_QWORD *)this + 192) + 144), 0);
          var1F0.init_buf = (BUF_MEM *)0xAAAAAAAAAAAAAAAALL;
          var1F0.init_msg = (void *)0xAAAAAAAAAAAAAAAALL;
          CRYPTO_BUFFER_init_CBS((uint64_t)v55, &var1F0.init_buf);
          if (!bssl::ssl_cert_check_key_usage((__int128 *)&var1F0.init_buf, 0))
            goto LABEL_473;
          *(_OWORD *)&var1F0.bbio = *(_OWORD *)&var1F0.d1;
          *(_QWORD *)&v250[2] = 0xAAAAAAAAAAAAAAAALL;
          *(_QWORD *)&v250[10] = 0xAAAAAAAAAAAAAAAALL;
          LOWORD(var1F0.rbio) = 0;
          if (bssl::ssl_protocol_version(v53, (const ssl_st *)a2) < 0x303)
          {
            if ((bssl::tls1_get_legacy_signature_algorithm((bssl *)&var1F0.rbio, (unsigned __int16 *)*v240, v56) & 1) == 0)
            {
              ERR_put_error(16, 0, 193, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1646);
              bssl::ssl_send_alert(v53, (ssl_st *)2, 43);
              goto LABEL_473;
            }
          }
          else
          {
            if (!CBS_get_u16((unsigned __int16 **)&var1F0.bbio, &var1F0.rbio))
            {
              ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1634);
              bssl::ssl_send_alert(v53, (ssl_st *)2, 50);
              goto LABEL_473;
            }
            LOBYTE(var1F0.version) = 50;
            if (!bssl::tls12_check_peer_sigalg(this, (const bssl::SSL_HANDSHAKE *)&var1F0, (unsigned __int8 *)LOWORD(var1F0.rbio)))
            {
              bssl::ssl_send_alert(v53, (ssl_st *)2, LOBYTE(var1F0.version));
              goto LABEL_473;
            }
            *(_WORD *)(*((_QWORD *)this + 192) + 8) = var1F0.rbio;
          }
          if (!CBS_get_u16_length_prefixed((unsigned __int8 **)&var1F0.bbio, (unint64_t *)&v250[2])|| CBS_len((uint64_t)&var1F0.bbio))
          {
            ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1654);
            bssl::ssl_send_alert(v53, (ssl_st *)2, 50);
            goto LABEL_473;
          }
          if (!bssl::ssl_public_key_verify(v53, *(uint64_t *)&v250[2], *(uint64_t *)&v250[10], (evp_pkey_st *)LOWORD(var1F0.rbio), (const ssl_st *)*v240, (*v244)->data, *(_QWORD *)&(*v244)->length))
          {
            ERR_put_error(16, 0, 114, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1661);
            bssl::ssl_send_alert(v53, (ssl_st *)2, 51);
            goto LABEL_473;
          }
          bssl::SSLTranscript::FreeBuffer(v244);
          if (!bssl::ssl_hash_message((uint64_t)this, (uint64_t)&var1F0.s3))
            goto LABEL_473;
          (*(void (**)(bssl *))(*(_QWORD *)v53 + 32))(v53);
        }
        else
        {
          bssl::SSLTranscript::FreeBuffer(v244);
        }
        v6 = 14;
        goto LABEL_204;
      case 14:
        if ((*((_BYTE *)this + 1602) & 8) != 0 && *(_QWORD *)(*(_QWORD *)this + 104))
          goto LABEL_105;
        prev_session = 15;
LABEL_9:
        *((_DWORD *)this + 5) = prev_session;
        goto LABEL_474;
      case 15:
        if (!bssl::tls1_change_cipher_state((uint64_t *)this, 0))
          goto LABEL_473;
        v6 = 16;
        goto LABEL_204;
      case 16:
        if ((*((_BYTE *)this + 1601) & 0x80) == 0)
          goto LABEL_5;
        v88 = *(bssl **)this;
        var1F0.msg_callback_arg = (void *)0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v89 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v89 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.s3 = v89;
        *(_OWORD *)&var1F0.read_ahead = v89;
        if (!(*(unsigned int (**)(bssl *, ssl3_state_st **))(*(_QWORD *)v88 + 24))(v88, &var1F0.s3))
          goto LABEL_167;
        if (!bssl::ssl_check_message_type(v88, (uint64_t)&var1F0.s3, 67)
          || !bssl::ssl_hash_message((uint64_t)this, (uint64_t)&var1F0.s3))
        {
          goto LABEL_473;
        }
        *(_OWORD *)&var1F0.init_buf = *(_OWORD *)&var1F0.d1;
        var1F0.bbio = (BIO *)0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&var1F0.rwstate = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v250[2] = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v250[10] = 0xAAAAAAAAAAAAAAAALL;
        if (!CBS_get_u8_length_prefixed((unsigned __int8 **)&var1F0.init_buf, (unint64_t *)&var1F0.bbio)|| !CBS_get_u8_length_prefixed((unsigned __int8 **)&var1F0.init_buf, (unint64_t *)&v250[2])|| CBS_len((uint64_t)&var1F0.init_buf))
        {
          ERR_put_error(16, 0, 137, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake_server.cc", 1717);
          bssl::ssl_send_alert(v88, (ssl_st *)2, 50);
          goto LABEL_473;
        }
        v166 = (void **)(*((_QWORD *)v88 + 6) + 480);
        v167 = var1F0.bbio;
        v168 = *(_QWORD *)&var1F0.rwstate;
        v169 = bssl::Array<unsigned char>::Init((uint64_t)v166, *(unint64_t *)&var1F0.rwstate);
        v170 = v169 ^ 1;
        if (!v168)
          v170 = 1;
        if ((v170 & 1) == 0)
          memcpy(*v166, v167, v168);
        if (!v169)
          goto LABEL_473;
        (*(void (**)(bssl *))(*(_QWORD *)v88 + 32))(v88);
LABEL_5:
        v6 = 17;
        goto LABEL_204;
      case 17:
        if ((*((_BYTE *)this + 1603) & 4) == 0)
          goto LABEL_65;
        v90 = *(bssl **)this;
        var1F0.msg_callback_arg = (void *)0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v91 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v91 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.s3 = v91;
        *(_OWORD *)&var1F0.read_ahead = v91;
        if (!(*(unsigned int (**)(bssl *, ssl3_state_st **))(*(_QWORD *)v90 + 24))(v90, &var1F0.s3))
          goto LABEL_167;
        if (!bssl::ssl_check_message_type(v90, (uint64_t)&var1F0.s3, 203)
          || !bssl::tls1_verify_channel_id((bssl **)this, (uint64_t)&var1F0.s3)
          || !bssl::ssl_hash_message((uint64_t)this, (uint64_t)&var1F0.s3))
        {
          goto LABEL_473;
        }
        (*(void (**)(bssl *))(*(_QWORD *)v90 + 32))(v90);
LABEL_65:
        v6 = 18;
        goto LABEL_204;
      case 18:
        v63 = *(_QWORD *)this;
        prev_session = bssl::ssl_get_finished(this, a2);
        if ((_DWORD)prev_session != 1)
          goto LABEL_474;
        if (*(_QWORD *)(v63 + 104))
        {
          v6 = 20;
          goto LABEL_204;
        }
        *((_DWORD *)this + 5) = 19;
        if ((*(_WORD *)(*(_QWORD *)(v63 + 48) + 220) & 0x200) != 0
          && !bssl::tls1_record_handshake_hashes_for_channel_id(this, a2))
        {
          goto LABEL_473;
        }
        goto LABEL_205;
      case 19:
        v76 = *(bssl **)this;
        if ((*((_BYTE *)this + 1602) & 1) == 0)
          goto LABEL_232;
        *(_QWORD *)&v250[2] = 0;
        v77 = (bssl *)*((_QWORD *)v76 + 13);
        if (v77)
        {
          bssl::SSL_SESSION_dup(v77, (ssl_session_st *)2, &var1F0.s3);
          s3 = (SSL_SESSION *)var1F0.s3;
          *(_QWORD *)&v250[2] = var1F0.s3;
          if (!var1F0.s3)
            goto LABEL_473;
          bssl::ssl_session_rebase_time(v76, (ssl_st *)var1F0.s3, (ssl_session_st *)a3);
          v79 = (uint64_t)s3;
        }
        else
        {
          bssl::ssl_session_rebase_time(v76, *((ssl_st **)this + 192), (ssl_session_st *)a3);
          s3 = 0;
          v79 = *((_QWORD *)this + 192);
        }
        *(_QWORD *)&v111 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v111 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.read_ahead = v111;
        *(_OWORD *)&var1F0.msg_callback_arg = v111;
        *(_OWORD *)&var1F0.s3 = v111;
        CBB_zero(&var1F0.s3);
        *(_QWORD *)&v112 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v112 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&var1F0.init_num = v112;
        *(_OWORD *)&var1F0.packet_length = v112;
        *(_OWORD *)&var1F0.init_buf = v112;
        *(_OWORD *)&var1F0.handshake_func = v112;
        *(_OWORD *)&var1F0.quiet_shutdown = v112;
        *(_OWORD *)&var1F0.bbio = v112;
        if ((*(unsigned int (**)(bssl *, ssl3_state_st **, BUF_MEM **, uint64_t))(*(_QWORD *)v76 + 88))(v76, &var1F0.s3, &var1F0.init_buf, 4)&& CBB_add_u32((uint64_t)&var1F0.init_buf, *(_DWORD *)(v79 + 192))&& CBB_add_u16_length_prefixed((uint64_t *)&var1F0.init_buf, (uint64_t)&var1F0.bbio)&& bssl::ssl_encrypt_ticket(this, (uint64_t)&var1F0.bbio, v79))
        {
          v113 = bssl::ssl_add_message_cbb((uint64_t)v76, (uint64_t)&var1F0.s3) ^ 1;
        }
        else
        {
          v113 = 1;
        }
        CBB_cleanup((uint64_t)&var1F0.s3);
        *(_QWORD *)&v250[2] = 0;
        if (s3)
          SSL_SESSION_free(s3);
        if (v113)
          goto LABEL_473;
LABEL_232:
        if (!(*(unsigned int (**)(bssl *, bssl::SSL_HANDSHAKE *))(*(_QWORD *)v76 + 112))(v76, a2)
          || !bssl::tls1_change_cipher_state((uint64_t *)this, 1)
          || !bssl::ssl_send_finished(this, a2))
        {
          goto LABEL_473;
        }
        if (*((_QWORD *)v76 + 13))
          v114 = 14;
        else
          v114 = 20;
        *((_DWORD *)this + 5) = v114;
        prev_session = 4;
        goto LABEL_474;
      case 20:
        if ((*((_BYTE *)this + 1602) & 8) != 0)
        {
LABEL_105:
          prev_session = 7;
          goto LABEL_474;
        }
        v43 = *(_QWORD *)this;
        (*(void (**)(_QWORD, bssl::SSL_HANDSHAKE *))(**(_QWORD **)this + 128))(*(_QWORD *)this, a2);
        v44 = *((_QWORD *)this + 192);
        if (v44
          && ((*(_WORD *)(*((_QWORD *)this + 1) + 313) & 0x20) == 0
           || (std::unique_ptr<stack_st_CRYPTO_BUFFER,bssl::internal::Deleter>::reset[abi:ne180100]((unint64_t **)(v44 + 144), 0), (*(void (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)(v43 + 120) + 8) + 64))(*((_QWORD *)this + 192)), (v44 = *((_QWORD *)this + 192)) != 0)))
        {
          if (*(_QWORD *)(v43 + 104))
            bssl::ssl_server_handshake();
          v45 = (SSL_SESSION **)(*(_QWORD *)(v43 + 48) + 472);
          *((_QWORD *)this + 192) = 0;
          std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100](v45, (SSL_SESSION *)v44);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v43 + 48) + 472) + 448) &= ~4u;
          *((_DWORD *)this + 400) |= 8u;
          *(_WORD *)(*(_QWORD *)(v43 + 48) + 220) |= 0x20u;
          bssl::ssl_update_cache((bssl *)v43, v46);
        }
        else
        {
          v105 = *(SSL_SESSION **)(v43 + 104);
          if (!v105)
            bssl::ssl_server_handshake();
          SSL_SESSION_up_ref(*(unsigned int **)(v43 + 104));
          std::unique_ptr<ssl_session_st,bssl::internal::Deleter>::reset[abi:ne180100]((SSL_SESSION **)(*(_QWORD *)(v43 + 48) + 472), v105);
          *((_DWORD *)this + 400) |= 8u;
          *(_WORD *)(*(_QWORD *)(v43 + 48) + 220) |= 0x20u;
        }
        v6 = 21;
        goto LABEL_204;
      case 21:
        bssl::ssl_do_info_callback(*(_QWORD *)this, (const ssl_st *)0x20);
        return 1;
      default:
        goto LABEL_473;
    }
  }
}

void sub_1B4FF0C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  CBB_cleanup((uint64_t)&a53);
  _Unwind_Resume(a1);
}

uint64_t bssl::ssl_server_handshake_int_state(bssl *this, bssl::SSL_HANDSHAKE *a2)
{
  if (*((_DWORD *)this + 5) == 4)
    return bssl::tls13_server_handshake_int_state(this, a2);
  else
    return (4 * *((_DWORD *)this + 5)) | 0x2B291000u;
}

const char *bssl::ssl_server_handshake_state(bssl *this, bssl::SSL_HANDSHAKE *a2)
{
  int v2;
  const char *result;

  v2 = *((_DWORD *)this + 5);
  result = "TLS server start_accept";
  switch(v2)
  {
    case 0:
      return result;
    case 1:
      result = "TLS server read_client_hello";
      break;
    case 2:
      result = "TLS server read_client_hello_after_ech";
      break;
    case 3:
      result = "TLS server select_certificate";
      break;
    case 4:
      result = bssl::tls13_server_handshake_state(this, a2);
      break;
    case 5:
      result = "TLS server select_parameters";
      break;
    case 6:
      result = "TLS server send_server_hello";
      break;
    case 7:
      result = "TLS server send_server_certificate";
      break;
    case 8:
      result = "TLS server send_server_key_exchange";
      break;
    case 9:
      result = "TLS server send_server_hello_done";
      break;
    case 10:
      result = "TLS server read_client_certificate";
      break;
    case 11:
      result = "TLS server verify_client_certificate";
      break;
    case 12:
      result = "TLS server read_client_key_exchange";
      break;
    case 13:
      result = "TLS server read_client_certificate_verify";
      break;
    case 14:
      result = "TLS server read_change_cipher_spec";
      break;
    case 15:
      result = "TLS server process_change_cipher_spec";
      break;
    case 16:
      result = "TLS server read_next_proto";
      break;
    case 17:
      result = "TLS server read_channel_id";
      break;
    case 18:
      result = "TLS server read_client_finished";
      break;
    case 19:
      result = "TLS server send_server_finished";
      break;
    case 20:
      result = "TLS server finish_server_handshake";
      break;
    case 21:
      result = "TLS server done";
      break;
    default:
      result = "TLS server unknown";
      break;
  }
  return result;
}

uint64_t bssl::extract_sni(uint64_t *a1, char *a2, uint64_t a3)
{
  uint64_t v5;
  _BOOL8 v6;
  char v7;
  _BOOL4 v9;
  _QWORD *v10;
  char v11;
  unint64_t v12[4];
  __int128 v13;

  v5 = *a1;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  if (!bssl::ssl_client_hello_get_extension(a3, &v13, 0))
    return 1;
  memset(v12, 170, sizeof(v12));
  v11 = -86;
  if (CBS_get_u16_length_prefixed((unsigned __int8 **)&v13, &v12[2])
    && CBS_get_u8(&v12[2], &v11)
    && CBS_get_u16_length_prefixed((unsigned __int8 **)&v12[2], v12)
    && !CBS_len((uint64_t)&v12[2])
    && !CBS_len((uint64_t)&v13))
  {
    if (v11
      || !CBS_len((uint64_t)v12)
      || (unint64_t)CBS_len((uint64_t)v12) > 0xFF
      || CBS_contains_zero_byte((uint64_t)v12))
    {
      v6 = 0;
      v7 = 112;
    }
    else
    {
      v10 = 0;
      v9 = CBS_strdup((uint64_t)v12, &v10);
      v6 = v9;
      if (v9)
      {
        std::unique_ptr<char,bssl::internal::Deleter>::reset[abi:ne180100]((_QWORD **)(*(_QWORD *)(v5 + 48) + 512), v10);
        *((_DWORD *)a1 + 400) |= 0x200u;
        return v6;
      }
      v7 = 80;
    }
  }
  else
  {
    v6 = 0;
    v7 = 50;
  }
  *a2 = v7;
  return v6;
}

void std::unique_ptr<stack_st_SSL_CIPHER,bssl::internal::Deleter>::reset[abi:ne180100](STACK **a1, STACK *a2)
{
  STACK *v3;

  v3 = *a1;
  *a1 = a2;
  if (v3)
    sk_free(v3);
}

uint64_t bssl::ssl_client_handshake_int_state(bssl *this, bssl::SSL_HANDSHAKE *a2)
{
  if (*((_DWORD *)this + 5) == 5)
    return bssl::tls13_client_handshake_int_state(this, a2);
  else
    return (4 * *((_DWORD *)this + 5)) | 0x2B290C00u;
}

uint64_t sk_SSL_CIPHER_call_cmp_func(uint64_t (*a1)(uint64_t *, uint64_t *), uint64_t *a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v3 = *a2;
  v5 = *a3;
  v6 = v3;
  return a1(&v6, &v5);
}

uint64_t bssl::dtls_open_record(bssl *a1, char *a2, uint64_t a3, unsigned __int8 **a4, _BYTE *a5, unsigned __int8 *a6, unsigned __int8 *a7)
{
  uint64_t result;
  bssl::SSLAEADContext *v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  BOOL v21;
  unint64_t v22;
  char *v23;
  unint64_t v24;
  int v25;
  char v26;
  bssl::SSLAEADContext *v27;
  __int16 v28;
  char v29;
  unint64_t v30[2];
  unsigned __int16 v31;
  char v32;
  unsigned __int8 *v33[2];
  unint64_t __dst[2];

  __dst[1] = *MEMORY[0x1E0C80C00];
  *a4 = 0;
  if (*(_DWORD *)(*((_QWORD *)a1 + 6) + 172) == 1)
    return 3;
  if (!a7)
    return 2;
  v33[0] = a6;
  v33[1] = a7;
  v32 = -86;
  v31 = -21846;
  __dst[0] = 0xAAAAAAAAAAAAAAAALL;
  v30[0] = 0xAAAAAAAAAAAAAAAALL;
  v30[1] = 0xAAAAAAAAAAAAAAAALL;
  if (!CBS_get_u8(v33, &v32)
    || !CBS_get_u16((unsigned __int16 **)v33, &v31)
    || !CBS_copy_bytes((uint64_t)v33, __dst, 8uLL)
    || !CBS_get_u16_length_prefixed(v33, v30)
    || (unint64_t)CBS_len((uint64_t)v30) >= 0x4141)
  {
    goto LABEL_21;
  }
  v15 = *(bssl::SSLAEADContext **)(*((_QWORD *)a1 + 6) + 264);
  v16 = v31;
  if (*(_QWORD *)v15)
  {
    if (v16 == bssl::SSLAEADContext::RecordVersion(v15))
      goto LABEL_11;
LABEL_21:
    *a4 = a7;
    return 1;
  }
  if ((v31 & 0xFF00) != 0xFE00)
    goto LABEL_21;
LABEL_11:
  if ((unint64_t)a7 >= 0xD)
    v17 = 13;
  else
    v17 = (uint64_t)a7;
  bssl::ssl_do_msg_callback((uint64_t)a1, 0, 256, (uint64_t)a6, v17);
  v18 = bswap64(__dst[0]);
  v19 = *((_QWORD *)a1 + 7);
  if (HIWORD(v18) != *(unsigned __int16 *)(v19 + 2))
    goto LABEL_28;
  v20 = *(_QWORD *)(v19 + 16);
  v21 = v20 >= v18;
  v22 = v20 - v18;
  if (v21 && (v22 > 0x3F || ((*(_QWORD *)(v19 + 8) >> v22) & 1) != 0))
    goto LABEL_28;
  v27 = *(bssl::SSLAEADContext **)(*((_QWORD *)a1 + 6) + 264);
  v28 = v31;
  v29 = v32;
  v23 = (char *)CBS_data((uint64_t)v30);
  v24 = CBS_len((uint64_t)v30);
  if (!bssl::SSLAEADContext::Open(v27, (char **)a3, v29, v28, v18, (int)a6, v17, v25, v23, v24))
  {
    ERR_clear_error();
LABEL_28:
    *a4 = &a7[-CBS_len((uint64_t)v33)];
    return 1;
  }
  *a4 = &a7[-CBS_len((uint64_t)v33)];
  if (*(_QWORD *)(a3 + 8) <= 0x4000uLL)
  {
    bssl::dtls1_bitmap_record((_QWORD *)(*((_QWORD *)a1 + 7) + 8), (DTLS1_BITMAP *)v18);
    v26 = v32;
    if (v32 == 21)
    {
      return bssl::ssl_process_alert(a1, a5, *(unsigned __int8 **)a3, *(_QWORD *)(a3 + 8));
    }
    else
    {
      result = 0;
      *(_BYTE *)(*((_QWORD *)a1 + 6) + 211) = 0;
      *a2 = v26;
    }
  }
  else
  {
    ERR_put_error(16, 0, 136, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/dtls_record.cc", 240);
    *a5 = 22;
    return 4;
  }
  return result;
}

_QWORD *bssl::dtls1_bitmap_record(_QWORD *this, DTLS1_BITMAP *a2)
{
  DTLS1_BITMAP *v2;
  unint64_t v3;
  uint64_t v4;

  v2 = (DTLS1_BITMAP *)this[1];
  v3 = (char *)a2 - (char *)v2;
  if (a2 > v2)
  {
    if (v3 <= 0x3F)
      v4 = *this << v3;
    else
      v4 = 0;
    *this = v4;
    this[1] = a2;
    v2 = a2;
  }
  if ((unint64_t)((char *)v2 - (char *)a2) <= 0x3F)
    *this |= 1 << (v2 - a2);
  return this;
}

uint64_t bssl::dtls_max_seal_overhead(uint64_t a1, int a2)
{
  bssl::SSLAEADContext *v2;

  v2 = (bssl::SSLAEADContext *)bssl::get_write_aead(a1, a2);
  return bssl::SSLAEADContext::MaxOverhead(v2) + 13;
}

uint64_t bssl::get_write_aead(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  if (a2)
  {
    v2 = *(_QWORD *)(a1 + 48) + 272;
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 56);
    if (!*(_WORD *)(v3 + 4))
      bssl::get_write_aead();
    v2 = v3 + 40;
  }
  return *(_QWORD *)v2;
}

uint64_t bssl::dtls_seal_prefix_len(uint64_t a1, int a2)
{
  bssl::SSLAEADContext *v2;

  v2 = (bssl::SSLAEADContext *)bssl::get_write_aead(a1, a2);
  return bssl::SSLAEADContext::ExplicitNonceLen(v2) + 13;
}

uint64_t bssl::dtls_seal_record(uint64_t a1, unint64_t a2, _QWORD *a3, unint64_t a4, char a5, char *a6, unint64_t a7, int a8)
{
  bssl::SSLAEADContext *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  bssl::SSLAEADContext **v21;
  _QWORD *v22;
  int v23;
  int v24;
  bssl::SSLAEADContext *v25;
  unsigned int v26;
  __int16 v27;
  unint64_t v28;
  int v29;
  uint64_t v30;
  unint64_t v31;
  _QWORD *v33;
  unint64_t v34;
  unint64_t v35;

  v16 = (bssl::SSLAEADContext *)bssl::get_write_aead(a1, a8);
  v17 = bssl::SSLAEADContext::ExplicitNonceLen(v16);
  if (a2 + a4 > (unint64_t)a6
    && (unint64_t)&a6[a7] > a2
    && (v17 + 13 > a4 || (char *)(a2 + v17 + 13) != a6))
  {
    v23 = 189;
    v24 = 286;
    goto LABEL_19;
  }
  v18 = *(_QWORD *)(a1 + 56);
  v19 = *(unsigned __int16 *)(v18 + 4);
  if (a8)
  {
    v20 = *(_QWORD *)(a1 + 48);
    v21 = (bssl::SSLAEADContext **)(v20 + 272);
    v22 = (_QWORD *)(v20 + 8);
  }
  else
  {
    if (!*(_WORD *)(v18 + 4))
      bssl::dtls_seal_record();
    v19 = (v19 - 1);
    v21 = (bssl::SSLAEADContext **)(v18 + 40);
    v22 = (_QWORD *)(v18 + 32);
  }
  if (a4 <= 0xC)
  {
    v23 = 121;
    v24 = 302;
LABEL_19:
    ERR_put_error(16, 0, v23, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/dtls_record.cc", v24);
    return 0;
  }
  v33 = a3;
  v25 = *v21;
  *(_BYTE *)a2 = a5;
  v26 = bssl::SSLAEADContext::RecordVersion(*(bssl::SSLAEADContext **)(*(_QWORD *)(a1 + 48) + 272));
  *(_WORD *)(a2 + 1) = __rev16(v26);
  if ((unint64_t)(*v22 - 0xFFFFFFFFFFFFLL) <= 0xFFFEFFFFFFFFFFFFLL)
  {
    v23 = 69;
    v24 = 315;
    goto LABEL_19;
  }
  v27 = v26;
  v28 = *v22 | (v19 << 48);
  *(_QWORD *)(a2 + 3) = bswap64(v28);
  v35 = 0xAAAAAAAAAAAAAAAALL;
  if ((bssl::SSLAEADContext::CiphertextLen(v25, &v35, a7, 0) & 1) == 0)
  {
    v23 = 200;
    v24 = 324;
    goto LABEL_19;
  }
  *(_WORD *)(a2 + 11) = bswap32((unsigned __int16)v35) >> 16;
  v34 = 0xAAAAAAAAAAAAAAAALL;
  v30 = bssl::SSLAEADContext::Seal((uint64_t)v25, (char *)(a2 + 13), &v34, a4 - 13, a5, v27, v28, v29, a2, 13, a6, a7);
  if ((_DWORD)v30)
  {
    v31 = v35;
    if (v35 != v34)
      bssl::dtls_seal_record();
    ++*v22;
    *v33 = v31 + 13;
    bssl::ssl_do_msg_callback(a1, 1, 256, a2, 13);
  }
  return v30;
}

void ec_GFp_mont_group_finish(uint64_t a1)
{
  BN_MONT_CTX_free(*(BN_MONT_CTX **)(a1 + 312));
  *(_QWORD *)(a1 + 312) = 0;
  ec_GFp_simple_group_finish(a1);
}

void ec_GFp_mont_felem_reduce(uint64_t a1, unint64_t *a2, uint64_t a3, unint64_t a4)
{
  bn_from_montgomery_small(a2, *(int *)(a1 + 64), a3, a4, *(_QWORD *)(a1 + 312));
  bn_to_montgomery_small(a2, a2, *(int *)(a1 + 64), *(unint64_t ***)(a1 + 312));
  bn_to_montgomery_small(a2, a2, *(int *)(a1 + 64), *(unint64_t ***)(a1 + 312));
}

void ec_GFp_mont_felem_exp(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  bn_mod_exp_mont_small(a2, a3, *(int *)(a1 + 64), a4, a5, *(_QWORD *)(a1 + 312));
}

uint64_t *ec_GFp_mont_add(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  _OWORD v27[4];
  unint64_t v28;
  _OWORD v29[4];
  unint64_t v30;
  _OWORD v31[4];
  unint64_t v32;
  _OWORD v33[4];
  unint64_t v34;
  _OWORD v35[4];
  unint64_t v36;
  _OWORD v37[4];
  unint64_t v38;
  _OWORD v39[4];
  unint64_t v40;
  _OWORD v41[4];
  unint64_t v42;
  _OWORD v43[4];
  unint64_t v44;
  _OWORD v45[4];
  unint64_t v46;
  _OWORD v47[4];
  unint64_t v48;
  _OWORD v49[4];
  unint64_t v50;
  _OWORD v51[4];
  unint64_t v52;
  _OWORD v53[4];
  unint64_t v54;
  _OWORD v55[4];
  unint64_t v56;
  _OWORD v57[4];
  unint64_t v58;
  _OWORD v59[4];
  unint64_t v60;

  if (a3 == a4)
    return ec_GFp_mont_dbl(a1, (unint64_t *)a2, (unint64_t *)a3);
  v60 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v59[2] = v8;
  v59[3] = v8;
  v59[0] = v8;
  v59[1] = v8;
  v58 = 0xAAAAAAAAAAAAAAAALL;
  v57[2] = v8;
  v57[3] = v8;
  v57[0] = v8;
  v57[1] = v8;
  v56 = 0xAAAAAAAAAAAAAAAALL;
  v55[3] = v8;
  v55[2] = v8;
  v55[1] = v8;
  v55[0] = v8;
  v26 = ec_felem_non_zero_mask(a1, (uint64_t *)(a3 + 144));
  v9 = ec_felem_non_zero_mask(a1, (uint64_t *)(a4 + 144));
  v54 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v53[3] = v10;
  v53[2] = v10;
  v53[1] = v10;
  v53[0] = v10;
  bn_mod_mul_montgomery_small((unint64_t *)v53, (unint64_t *)(a3 + 144), (unint64_t *)(a3 + 144), *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  v52 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v51[2] = v11;
  v51[3] = v11;
  v51[0] = v11;
  v51[1] = v11;
  bn_mod_mul_montgomery_small((unint64_t *)v51, (unint64_t *)(a4 + 144), (unint64_t *)(a4 + 144), *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  v50 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v49[2] = v12;
  v49[3] = v12;
  v49[0] = v12;
  v49[1] = v12;
  bn_mod_mul_montgomery_small((unint64_t *)v49, (unint64_t *)a3, (unint64_t *)v51, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  v48 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v47[2] = v13;
  v47[3] = v13;
  v47[0] = v13;
  v47[1] = v13;
  ec_felem_add(a1, (unint64_t *)v47, (const unint64_t *)(a3 + 144), (const unint64_t *)(a4 + 144));
  bn_mod_mul_montgomery_small((unint64_t *)v47, (unint64_t *)v47, (unint64_t *)v47, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  ec_felem_sub(a1, (unint64_t *)v47, (const unint64_t *)v47, (const unint64_t *)v53);
  ec_felem_sub(a1, (unint64_t *)v47, (const unint64_t *)v47, (const unint64_t *)v51);
  v46 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v45[2] = v14;
  v45[3] = v14;
  v45[0] = v14;
  v45[1] = v14;
  bn_mod_mul_montgomery_small((unint64_t *)v45, (unint64_t *)(a4 + 144), (unint64_t *)v51, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  bn_mod_mul_montgomery_small((unint64_t *)v45, (unint64_t *)v45, (unint64_t *)(a3 + 72), *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  v44 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v43[2] = v15;
  v43[3] = v15;
  v43[0] = v15;
  v43[1] = v15;
  bn_mod_mul_montgomery_small((unint64_t *)v43, (unint64_t *)a4, (unint64_t *)v53, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  v42 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v16 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v16 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v41[2] = v16;
  v41[3] = v16;
  v41[0] = v16;
  v41[1] = v16;
  ec_felem_sub(a1, (unint64_t *)v41, (const unint64_t *)v43, (const unint64_t *)v49);
  v17 = ec_felem_non_zero_mask(a1, (uint64_t *)v41);
  bn_mod_mul_montgomery_small((unint64_t *)v55, (unint64_t *)v41, (unint64_t *)v47, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  v40 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v39[2] = v18;
  v39[3] = v18;
  v39[0] = v18;
  v39[1] = v18;
  bn_mod_mul_montgomery_small((unint64_t *)v39, (unint64_t *)(a3 + 144), (unint64_t *)v53, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  v38 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v37[2] = v19;
  v37[3] = v19;
  v37[0] = v19;
  v37[1] = v19;
  bn_mod_mul_montgomery_small((unint64_t *)v37, (unint64_t *)(a4 + 72), (unint64_t *)v39, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  v36 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v20 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v20 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v35[2] = v20;
  v35[3] = v20;
  v35[0] = v20;
  v35[1] = v20;
  ec_felem_sub(a1, (unint64_t *)v35, (const unint64_t *)v37, (const unint64_t *)v45);
  ec_felem_add(a1, (unint64_t *)v35, (const unint64_t *)v35, (const unint64_t *)v35);
  if ((v26 & ~(ec_felem_non_zero_mask(a1, (uint64_t *)v35) | v17) & v9) != 0)
    return ec_GFp_mont_dbl(a1, (unint64_t *)a2, (unint64_t *)a3);
  v34 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33[2] = v22;
  v33[3] = v22;
  v33[0] = v22;
  v33[1] = v22;
  ec_felem_add(a1, (unint64_t *)v33, (const unint64_t *)v41, (const unint64_t *)v41);
  bn_mod_mul_montgomery_small((unint64_t *)v33, (unint64_t *)v33, (unint64_t *)v33, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  v32 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31[2] = v23;
  v31[3] = v23;
  v31[0] = v23;
  v31[1] = v23;
  bn_mod_mul_montgomery_small((unint64_t *)v31, (unint64_t *)v41, (unint64_t *)v33, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  v30 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v29[2] = v24;
  v29[3] = v24;
  v29[0] = v24;
  v29[1] = v24;
  bn_mod_mul_montgomery_small((unint64_t *)v29, (unint64_t *)v49, (unint64_t *)v33, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  bn_mod_mul_montgomery_small((unint64_t *)v59, (unint64_t *)v35, (unint64_t *)v35, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  ec_felem_sub(a1, (unint64_t *)v59, (const unint64_t *)v59, (const unint64_t *)v31);
  ec_felem_sub(a1, (unint64_t *)v59, (const unint64_t *)v59, (const unint64_t *)v29);
  ec_felem_sub(a1, (unint64_t *)v59, (const unint64_t *)v59, (const unint64_t *)v29);
  ec_felem_sub(a1, (unint64_t *)v57, (const unint64_t *)v29, (const unint64_t *)v59);
  bn_mod_mul_montgomery_small((unint64_t *)v57, (unint64_t *)v57, (unint64_t *)v35, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  v28 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v27[2] = v25;
  v27[3] = v25;
  v27[0] = v25;
  v27[1] = v25;
  bn_mod_mul_montgomery_small((unint64_t *)v27, (unint64_t *)v45, (unint64_t *)v31, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
  ec_felem_sub(a1, (unint64_t *)v57, (const unint64_t *)v57, (const unint64_t *)v27);
  ec_felem_sub(a1, (unint64_t *)v57, (const unint64_t *)v57, (const unint64_t *)v27);
  ec_felem_select(a1, (uint64_t *)v59, v26, (uint64_t *)v59, (uint64_t *)a4);
  ec_felem_select(a1, (uint64_t *)a2, v9, (uint64_t *)v59, (uint64_t *)a3);
  ec_felem_select(a1, (uint64_t *)v57, v26, (uint64_t *)v57, (uint64_t *)(a4 + 72));
  ec_felem_select(a1, (uint64_t *)(a2 + 72), v9, (uint64_t *)v57, (uint64_t *)(a3 + 72));
  ec_felem_select(a1, (uint64_t *)v55, v26, (uint64_t *)v55, (uint64_t *)(a4 + 144));
  return ec_felem_select(a1, (uint64_t *)(a2 + 144), v9, (uint64_t *)v55, (uint64_t *)(a3 + 144));
}

uint64_t *ec_GFp_mont_dbl(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  __int128 v6;
  unint64_t *v7;
  const unint64_t *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[4];
  unint64_t v14;
  _OWORD v15[4];
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  unint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  unint64_t v46;

  if (*(_DWORD *)(a1 + 224))
  {
    v46 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v44 = v6;
    v45 = v6;
    v42 = v6;
    v43 = v6;
    v41 = 0xAAAAAAAAAAAAAAAALL;
    v39 = v6;
    v40 = v6;
    v37 = v6;
    v38 = v6;
    v36 = 0xAAAAAAAAAAAAAAAALL;
    v34 = v6;
    v35 = v6;
    v32 = v6;
    v33 = v6;
    v31 = 0xAAAAAAAAAAAAAAAALL;
    v29 = v6;
    v30 = v6;
    v27 = v6;
    v28 = v6;
    v26 = 0xAAAAAAAAAAAAAAAALL;
    v24 = v6;
    v25 = v6;
    v22 = v6;
    v23 = v6;
    v21 = 0xAAAAAAAAAAAAAAAALL;
    v19 = v6;
    v20 = v6;
    v17 = v6;
    v18 = v6;
    v16 = 0xAAAAAAAAAAAAAAAALL;
    v15[2] = v6;
    v15[3] = v6;
    v15[0] = v6;
    v15[1] = v6;
    v14 = 0xAAAAAAAAAAAAAAAALL;
    v13[2] = v6;
    v13[3] = v6;
    v13[0] = v6;
    v13[1] = v6;
    bn_mod_mul_montgomery_small((unint64_t *)&v42, a3 + 18, a3 + 18, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    bn_mod_mul_montgomery_small((unint64_t *)&v37, a3 + 9, a3 + 9, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    bn_mod_mul_montgomery_small((unint64_t *)&v32, a3, (unint64_t *)&v37, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    ec_felem_sub(a1, (unint64_t *)&v27, a3, (const unint64_t *)&v42);
    ec_felem_add(a1, (unint64_t *)&v22, a3, (const unint64_t *)&v42);
    ec_felem_add(a1, (unint64_t *)&v17, (const unint64_t *)&v22, (const unint64_t *)&v22);
    ec_felem_add(a1, (unint64_t *)&v22, (const unint64_t *)&v22, (const unint64_t *)&v17);
    bn_mod_mul_montgomery_small((unint64_t *)v15, (unint64_t *)&v27, (unint64_t *)&v22, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    bn_mod_mul_montgomery_small(a2, (unint64_t *)v15, (unint64_t *)v15, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    ec_felem_add(a1, (unint64_t *)v13, (const unint64_t *)&v32, (const unint64_t *)&v32);
    ec_felem_add(a1, (unint64_t *)v13, (const unint64_t *)v13, (const unint64_t *)v13);
    ec_felem_add(a1, (unint64_t *)&v17, (const unint64_t *)v13, (const unint64_t *)v13);
    ec_felem_sub(a1, a2, a2, (const unint64_t *)&v17);
    ec_felem_add(a1, (unint64_t *)&v42, (const unint64_t *)&v37, (const unint64_t *)&v42);
    ec_felem_add(a1, (unint64_t *)&v27, a3 + 9, a3 + 18);
    bn_mod_mul_montgomery_small(a2 + 18, (unint64_t *)&v27, (unint64_t *)&v27, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    ec_felem_sub(a1, a2 + 18, a2 + 18, (const unint64_t *)&v42);
    v7 = a2 + 9;
    ec_felem_sub(a1, a2 + 9, (const unint64_t *)v13, a2);
    ec_felem_add(a1, (unint64_t *)&v37, (const unint64_t *)&v37, (const unint64_t *)&v37);
    bn_mod_mul_montgomery_small((unint64_t *)&v37, (unint64_t *)&v37, (unint64_t *)&v37, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    bn_mod_mul_montgomery_small(a2 + 9, (unint64_t *)v15, a2 + 9, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    ec_felem_add(a1, (unint64_t *)&v37, (const unint64_t *)&v37, (const unint64_t *)&v37);
    v8 = (const unint64_t *)&v37;
  }
  else
  {
    v46 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v44 = v9;
    v45 = v9;
    v42 = v9;
    v43 = v9;
    v41 = 0xAAAAAAAAAAAAAAAALL;
    v39 = v9;
    v40 = v9;
    v37 = v9;
    v38 = v9;
    v36 = 0xAAAAAAAAAAAAAAAALL;
    v34 = v9;
    v35 = v9;
    v32 = v9;
    v33 = v9;
    v31 = 0xAAAAAAAAAAAAAAAALL;
    v29 = v9;
    v30 = v9;
    v27 = v9;
    v28 = v9;
    bn_mod_mul_montgomery_small((unint64_t *)&v42, a3, a3, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    bn_mod_mul_montgomery_small((unint64_t *)&v37, a3 + 9, a3 + 9, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    bn_mod_mul_montgomery_small((unint64_t *)&v32, (unint64_t *)&v37, (unint64_t *)&v37, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    bn_mod_mul_montgomery_small((unint64_t *)&v27, a3 + 18, a3 + 18, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    v26 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v10 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v10 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v24 = v10;
    v25 = v10;
    v22 = v10;
    v23 = v10;
    ec_felem_add(a1, (unint64_t *)&v22, a3, (const unint64_t *)&v37);
    bn_mod_mul_montgomery_small((unint64_t *)&v22, (unint64_t *)&v22, (unint64_t *)&v22, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    ec_felem_sub(a1, (unint64_t *)&v22, (const unint64_t *)&v22, (const unint64_t *)&v42);
    ec_felem_sub(a1, (unint64_t *)&v22, (const unint64_t *)&v22, (const unint64_t *)&v32);
    ec_felem_add(a1, (unint64_t *)&v22, (const unint64_t *)&v22, (const unint64_t *)&v22);
    v21 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v19 = v11;
    v20 = v11;
    v17 = v11;
    v18 = v11;
    bn_mod_mul_montgomery_small((unint64_t *)&v17, (unint64_t *)&v27, (unint64_t *)&v27, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    bn_mod_mul_montgomery_small((unint64_t *)&v17, (unint64_t *)(a1 + 80), (unint64_t *)&v17, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    ec_felem_add(a1, (unint64_t *)&v17, (const unint64_t *)&v17, (const unint64_t *)&v42);
    ec_felem_add(a1, (unint64_t *)&v17, (const unint64_t *)&v17, (const unint64_t *)&v42);
    ec_felem_add(a1, (unint64_t *)&v17, (const unint64_t *)&v17, (const unint64_t *)&v42);
    bn_mod_mul_montgomery_small(a2, (unint64_t *)&v17, (unint64_t *)&v17, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    ec_felem_sub(a1, a2, a2, (const unint64_t *)&v22);
    ec_felem_sub(a1, a2, a2, (const unint64_t *)&v22);
    ec_felem_add(a1, a2 + 18, a3 + 9, a3 + 18);
    bn_mod_mul_montgomery_small(a2 + 18, a2 + 18, a2 + 18, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    ec_felem_sub(a1, a2 + 18, a2 + 18, (const unint64_t *)&v37);
    ec_felem_sub(a1, a2 + 18, a2 + 18, (const unint64_t *)&v27);
    ec_felem_add(a1, (unint64_t *)&v32, (const unint64_t *)&v32, (const unint64_t *)&v32);
    ec_felem_add(a1, (unint64_t *)&v32, (const unint64_t *)&v32, (const unint64_t *)&v32);
    ec_felem_add(a1, (unint64_t *)&v32, (const unint64_t *)&v32, (const unint64_t *)&v32);
    v7 = a2 + 9;
    ec_felem_sub(a1, a2 + 9, (const unint64_t *)&v22, a2);
    bn_mod_mul_montgomery_small(a2 + 9, a2 + 9, (unint64_t *)&v17, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    v8 = (const unint64_t *)&v32;
  }
  return ec_felem_sub(a1, v7, v7, v8);
}

uint64_t ec_GFp_mont_point_get_affine_coordinates(uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  __int128 v9;
  _OWORD v10[4];
  unint64_t v11;
  _OWORD v12[4];
  unint64_t v13;

  if (ec_GFp_simple_is_at_infinity(a1, (uint64_t)a2))
  {
    ERR_put_error(15, 0, 119, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec_montgomery.c", 181);
    return 0;
  }
  else
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v12[2] = v9;
    v12[3] = v9;
    v12[0] = v9;
    v12[1] = v9;
    v11 = 0xAAAAAAAAAAAAAAAALL;
    v10[2] = v9;
    v10[3] = v9;
    v10[0] = v9;
    v10[1] = v9;
    bn_mod_inverse0_prime_mont_small((unint64_t *)v10, (uint64_t)(a2 + 18), *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    bn_mod_mul_montgomery_small((unint64_t *)v12, (unint64_t *)v10, (unint64_t *)v10, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    if (a3)
      bn_mod_mul_montgomery_small(a3, a2, (unint64_t *)v12, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    if (a4)
    {
      bn_mod_mul_montgomery_small((unint64_t *)v12, (unint64_t *)v12, (unint64_t *)v10, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
      bn_mod_mul_montgomery_small(a4, a2 + 9, (unint64_t *)v12, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    }
    return 1;
  }
}

uint64_t ec_GFp_mont_jacobian_to_affine_batch(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v15;
  unint64_t *v16;
  unint64_t *v17;
  __int128 v18;
  _OWORD v20[4];
  unint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unint64_t v31;

  if (!a4)
    return 1;
  v6 = a2;
  *(_OWORD *)a2 = *(_OWORD *)(a3 + 144);
  v8 = *(_OWORD *)(a3 + 160);
  v9 = *(_OWORD *)(a3 + 176);
  v10 = *(_OWORD *)(a3 + 192);
  *(_QWORD *)(a2 + 64) = *(_QWORD *)(a3 + 208);
  *(_OWORD *)(a2 + 32) = v9;
  *(_OWORD *)(a2 + 48) = v10;
  *(_OWORD *)(a2 + 16) = v8;
  v11 = a4 - 1;
  if (a4 != 1)
  {
    v12 = (unint64_t *)(a3 + 360);
    v13 = a4 - 1;
    do
    {
      v14 = a2 + 144;
      bn_mod_mul_montgomery_small((unint64_t *)(a2 + 144), (unint64_t *)a2, v12, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
      v12 += 27;
      a2 = v14;
      --v13;
    }
    while (v13);
  }
  if (ec_felem_non_zero_mask(a1, (uint64_t *)(v6 + 144 * v11)))
  {
    v31 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v15 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v15 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v29 = v15;
    v30 = v15;
    v27 = v15;
    v28 = v15;
    bn_mod_inverse0_prime_mont_small((unint64_t *)&v27, v6 + 144 * v11, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    v16 = (unint64_t *)(a3 + 216 * a4 - 216);
    v17 = (unint64_t *)(v6 + 144 * a4 - 144);
    do
    {
      v26 = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v24 = v18;
      v25 = v18;
      v22 = v18;
      v23 = v18;
      v21 = 0xAAAAAAAAAAAAAAAALL;
      v20[2] = v18;
      v20[3] = v18;
      v20[0] = v18;
      v20[1] = v18;
      if (v11)
      {
        bn_mod_mul_montgomery_small((unint64_t *)&v22, (unint64_t *)&v27, v17 - 18, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
        bn_mod_mul_montgomery_small((unint64_t *)&v27, (unint64_t *)&v27, v16 + 18, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
      }
      else
      {
        v24 = v29;
        v25 = v30;
        v26 = v31;
        v22 = v27;
        v23 = v28;
      }
      bn_mod_mul_montgomery_small((unint64_t *)v20, (unint64_t *)&v22, (unint64_t *)&v22, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
      bn_mod_mul_montgomery_small(v17, v16, (unint64_t *)v20, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
      bn_mod_mul_montgomery_small(v17 + 9, v16 + 9, (unint64_t *)v20, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
      bn_mod_mul_montgomery_small(v17 + 9, v17 + 9, (unint64_t *)&v22, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
      v16 -= 27;
      v17 -= 18;
      --v11;
    }
    while (v11 < a4);
    return 1;
  }
  else
  {
    ERR_put_error(15, 0, 119, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/ec/ec_montgomery.c", 220);
    return 0;
  }
}

uint64_t ec_GFp_mont_cmp_x_coordinate(uint64_t a1, uint64_t a2, void *a3)
{
  __int128 v7;
  unint64_t v8;
  _OWORD v9[4];
  unint64_t v10;
  _OWORD v11[4];
  unint64_t v12;
  unint64_t rp[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  unint64_t v17;

  if (!*(_DWORD *)(a1 + 228) || *(_DWORD *)(a1 + 64) != *(_DWORD *)(a1 + 24))
    return ec_GFp_simple_cmp_x_coordinate(a1, a2, a3);
  if (!ec_GFp_simple_is_at_infinity(a1, a2))
  {
    v17 = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v15 = v7;
    v16 = v7;
    *(_OWORD *)rp = v7;
    v14 = v7;
    v12 = 0xAAAAAAAAAAAAAAAALL;
    v11[2] = v7;
    v11[3] = v7;
    v11[0] = v7;
    v11[1] = v7;
    v10 = 0xAAAAAAAAAAAAAAAALL;
    v9[2] = v7;
    v9[3] = v7;
    v9[0] = v7;
    v9[1] = v7;
    bn_mod_mul_montgomery_small((unint64_t *)v11, (unint64_t *)(a2 + 144), (unint64_t *)(a2 + 144), *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    v8 = *(int *)(a1 + 64);
    if ((_DWORD)v8)
      __memcpy_chk();
    bn_mod_mul_montgomery_small(rp, rp, (unint64_t *)v11, v8, *(_QWORD *)(a1 + 312));
    bn_from_montgomery_small((unint64_t *)v9, *(int *)(a1 + 64), a2, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
    if (ec_felem_equal(a1, (char *)rp, (char *)v9))
      return 1;
    if (bn_less_than_words((uint64_t *)a3, (uint64_t *)(a1 + 232), *(int *)(a1 + 64)))
    {
      bn_add_words(rp, (const unint64_t *)a3, *(const unint64_t **)(a1 + 16), *(_DWORD *)(a1 + 64));
      bn_mod_mul_montgomery_small(rp, rp, (unint64_t *)v11, *(int *)(a1 + 64), *(_QWORD *)(a1 + 312));
      if (ec_felem_equal(a1, (char *)rp, (char *)v9))
        return 1;
    }
  }
  return 0;
}

uint64_t bssl::ssl_cipher_requires_server_key_exchange(bssl *this, const ssl_cipher_st *a2)
{
  return (*((unsigned __int8 *)this + 20) >> 1) & 1;
}

uint64_t bssl::ssl_cipher_get_record_split_len(bssl *this, const ssl_cipher_st *a2)
{
  int v2;
  uint64_t v4;

  v2 = *((_DWORD *)this + 7);
  if (v2 == 1)
  {
    v4 = 24;
  }
  else
  {
    if (v2 != 4 && v2 != 2)
      return 0;
    v4 = 32;
  }
  if (*((_DWORD *)this + 8) != 1)
    bssl::ssl_cipher_get_record_split_len();
  return v4;
}

uint64_t SSL_CIPHER_get_cipher_nid(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 28);
  if (v1 <= 15)
  {
    switch(v1)
    {
      case 1:
        return 44;
      case 2:
        return 419;
      case 4:
        return 427;
      case 8:
        return 895;
      default:
        goto LABEL_14;
    }
  }
  if (v1 == 16)
    return 901;
  if (v1 == 32)
    return 0;
  if (v1 != 64)
LABEL_14:
    SSL_CIPHER_get_cipher_nid_cold_1();
  return 950;
}

uint64_t SSL_CIPHER_get_digest_nid(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 32) - 1;
  if (v1 >= 8 || ((0x8Bu >> v1) & 1) == 0)
    SSL_CIPHER_get_digest_nid_cold_1();
  return dword_1B5022270[v1];
}

uint64_t SSL_CIPHER_get_prf_nid(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 36);
  if (v1 == 1)
    return 114;
  if (v1 == 4)
    return 673;
  if (v1 != 2)
    SSL_CIPHER_get_prf_nid_cold_1();
  return 672;
}

BOOL SSL_CIPHER_is_block_cipher(uint64_t a1)
{
  return (*(_BYTE *)(a1 + 28) & 0x20) == 0 && *(_DWORD *)(a1 + 32) != 8;
}

int SSL_CIPHER_get_bits(const SSL_CIPHER *c, int *alg_bits)
{
  int algorithms_high;
  int v3;
  int v4;

  if (c)
  {
    algorithms_high = HIDWORD(c->algorithms);
    if (algorithms_high <= 15)
    {
      v3 = algorithms_high - 1;
      v4 = 128;
      LODWORD(c) = 128;
      switch(v3)
      {
        case 0:
          LODWORD(c) = 112;
          v4 = 168;
          if (!alg_bits)
            return (int)c;
          goto LABEL_11;
        case 1:
        case 7:
          goto LABEL_10;
        case 3:
          goto LABEL_9;
        default:
          goto LABEL_15;
      }
    }
    if (algorithms_high != 64)
    {
      if (algorithms_high == 32)
      {
        v4 = 0;
        LODWORD(c) = 0;
        if (!alg_bits)
          return (int)c;
        goto LABEL_11;
      }
      if (algorithms_high != 16)
LABEL_15:
        SSL_CIPHER_get_bits_cold_1();
    }
LABEL_9:
    v4 = 256;
    LODWORD(c) = 256;
LABEL_10:
    if (alg_bits)
LABEL_11:
      *alg_bits = v4;
  }
  return (int)c;
}

char *__cdecl SSL_CIPHER_get_version(const SSL_CIPHER *c)
{
  return "TLSv1/SSLv3";
}

uint64_t bssl::Array<int>::Init(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  OPENSSL_free(*(_QWORD **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  if (!a2)
    return 1;
  if (a2 >> 62)
  {
    ERR_put_error(16, 0, 69, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/internal.h", 312);
    return 0;
  }
  result = (uint64_t)OPENSSL_malloc(4 * a2);
  *(_QWORD *)a1 = result;
  if (result)
  {
    *(_QWORD *)(a1 + 8) = a2;
    return 1;
  }
  return result;
}

uint64_t boringssl_memory_outstanding_allocations()
{
  return 0;
}

uint64_t boringssl_memory_copy_array(const void *a1, size_t size)
{
  void *v4;
  uint64_t v5;

  if (!a1)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      boringssl_memory_copy_array_cold_1();
    return 0;
  }
  if (!size)
  {
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      boringssl_memory_copy_array_cold_2();
    return 0;
  }
  v4 = malloc_type_malloc(size, 0x49539E5DuLL);
  if (!v4)
  {
    v5 = g_boringssl_log;
    if (!g_boringssl_log)
      return v5;
    if (os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      boringssl_memory_copy_array_cold_3();
    return 0;
  }
  v5 = (uint64_t)v4;
  memcpy(v4, a1, size);
  return v5;
}

void *EVP_aead_chacha20_poly1305()
{
  return &aead_chacha20_poly1305;
}

uint64_t aead_chacha20_poly1305_init(uint64_t a1, _OWORD *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  __int128 v5;

  v4 = 16;
  if (a4)
    v4 = a4;
  if (v4 < 0x11)
  {
    if (a3 == 32)
    {
      v5 = a2[1];
      *(_OWORD *)(a1 + 8) = *a2;
      *(_OWORD *)(a1 + 24) = v5;
      *(_BYTE *)(a1 + 40) = v4;
      *(_BYTE *)(a1 + 592) = v4;
      return 1;
    }
  }
  else
  {
    ERR_put_error(30, 0, 117, "/Library/Caches/com.apple.xbs/Sources/boringssl/apple/crypto/boringssl_crypto_chacha20poly1305.m", 30);
  }
  return 0;
}

uint64_t aead_chacha20_poly1305_cleanup()
{
  return cc_clear();
}

BOOL aead_chacha20_poly1305_open(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, unint64_t a10)
{
  unint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  _BOOL8 result;
  __int128 v18;
  _OWORD v19[3];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a6 != 12)
  {
    v13 = 121;
    v14 = 214;
    goto LABEL_7;
  }
  v11 = *(unsigned __int8 *)(a1 + 40);
  v12 = a8 - v11;
  if (a8 < v11)
  {
    v13 = 101;
    v14 = 219;
LABEL_7:
    ERR_put_error(30, 0, v13, "/Library/Caches/com.apple.xbs/Sources/boringssl/apple/crypto/boringssl_crypto_chacha20poly1305.m", v14);
    return 0;
  }
  if (a8 >= 0x3FFFFFFFC0)
  {
    v13 = 117;
    v14 = 230;
    goto LABEL_7;
  }
  *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v19[1] = v18;
  v19[2] = v18;
  v19[0] = v18;
  if (calc_tag((uint64_t)v19, a1 + 8, a5, a9, a10, a7, v12, 0, 0))
  {
    if (!g_boringssl_log)
      return 0;
    result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      aead_chacha20_poly1305_open_cold_2();
      return 0;
    }
  }
  else
  {
    if (!ccchacha20())
    {
      if (!CRYPTO_memcmp((char *)v19, (char *)(a7 + v12), *(unsigned __int8 *)(a1 + 40)))
      {
        *a3 = v12;
        return 1;
      }
      v13 = 101;
      v14 = 250;
      goto LABEL_7;
    }
    if (!g_boringssl_log)
      return 0;
    result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      aead_chacha20_poly1305_open_cold_1();
      return 0;
    }
  }
  return result;
}

BOOL aead_chacha20_poly1305_seal_scatter(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, uint64_t a10, unint64_t a11, uint64_t a12, unint64_t a13)
{
  int v13;
  int v14;
  _BOOL8 result;
  _QWORD *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  NSObject *v25;
  size_t v26;
  _OWORD v30[4];
  _OWORD __src[3];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a7 != 12)
  {
    v13 = 121;
    v14 = 133;
    goto LABEL_5;
  }
  if (a9 >= 0x3FFFFFFFC0)
  {
    v13 = 117;
    v14 = 145;
LABEL_5:
    ERR_put_error(30, 0, v13, "/Library/Caches/com.apple.xbs/Sources/boringssl/apple/crypto/boringssl_crypto_chacha20poly1305.m", v14);
    return 0;
  }
  v17 = a4;
  v19 = a2;
  v20 = a1;
  v21 = a1 + 8;
  memset(__src, 0, sizeof(__src));
  if (a11)
  {
    v22 = 0;
    v23 = a9 >> 6;
    v24 = a9 & 0x3F;
    while (1)
    {
      LODWORD(v23) = v23 + 1;
      memset(v30, 0, sizeof(v30));
      if (ccchacha20())
        break;
      while (v22 < a11)
      {
        *(_BYTE *)(a3 + v22) = *((_BYTE *)v30 + v24) ^ *(_BYTE *)(a10 + v22);
        ++v22;
        if (v24 > 0x3E)
          break;
        ++v24;
      }
      v24 = 0;
      if (v22 >= a11)
      {
        v20 = a1;
        v17 = a4;
        v19 = a2;
        goto LABEL_16;
      }
    }
    v25 = g_boringssl_log;
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      aead_chacha20_poly1305_seal_scatter_cold_3(v25);
    return 0;
  }
LABEL_16:
  if (ccchacha20())
  {
    if (!g_boringssl_log)
      return 0;
    result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      aead_chacha20_poly1305_seal_scatter_cold_2();
      return 0;
    }
  }
  else
  {
    if (!calc_tag((uint64_t)__src, v21, a6, a12, a13, v19, a9, a3, a11))
    {
      v26 = *(unsigned __int8 *)(v20 + 40);
      *v17 = v26 + a11;
      memcpy((void *)(a3 + a11), __src, v26);
      return 1;
    }
    if (!g_boringssl_log)
      return 0;
    result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      aead_chacha20_poly1305_seal_scatter_cold_1();
      return 0;
    }
  }
  return result;
}

BOOL aead_chacha20_poly1305_open_gather(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, char *a7, uint64_t a8, uint64_t a9, unint64_t a10)
{
  int v11;
  int v12;
  _BOOL8 result;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  if (a4 != 12)
  {
    v11 = 121;
    v12 = 274;
    goto LABEL_7;
  }
  if (*(unsigned __int8 *)(a1 + 592) != a8)
  {
    v11 = 101;
    v12 = 279;
    goto LABEL_7;
  }
  if (a6 >= 0x3FFFFFFFC0)
  {
    v11 = 117;
    v12 = 291;
LABEL_7:
    ERR_put_error(30, 0, v11, "/Library/Caches/com.apple.xbs/Sources/boringssl/apple/crypto/boringssl_crypto_chacha20poly1305.m", v12);
    return 0;
  }
  v15[0] = 0xAAAAAAAAAAAAAAAALL;
  v15[1] = 0xAAAAAAAAAAAAAAAALL;
  if (calc_tag((uint64_t)v15, a1 + 8, a3, a9, a10, a5, a6, 0, 0))
  {
    if (!g_boringssl_log)
      return 0;
    result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      aead_chacha20_poly1305_open_cold_2();
      return 0;
    }
  }
  else
  {
    if (!ccchacha20())
    {
      if (!CRYPTO_memcmp((char *)v15, a7, *(unsigned __int8 *)(a1 + 40)))
        return 1;
      v11 = 101;
      v12 = 310;
      goto LABEL_7;
    }
    if (!g_boringssl_log)
      return 0;
    result = os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR);
    if (result)
    {
      aead_chacha20_poly1305_open_cold_1();
      return 0;
    }
  }
  return result;
}

uint64_t calc_tag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v11 = ccchacha20();
  if ((_DWORD)v11)
  {
    v12 = v11;
    if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
      aead_chacha20_poly1305_open_cold_1();
  }
  else
  {
    v13 = ccpoly1305_init();
    if ((_DWORD)v13)
    {
      v12 = v13;
      if (g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
        calc_tag_cold_2();
    }
    else
    {
      v14 = ccpoly1305_update();
      v15 = v14;
      if ((a5 & 0xF) != 0 && !v14)
        v15 = ccpoly1305_update();
      v16 = ccpoly1305_update() | v15;
      v17 = v16 | ccpoly1305_update();
      v18 = a9 + a7;
      if ((v18 & 0xF) != 0 && !v17)
        v17 = ccpoly1305_update();
      v19 = 0;
      v24[0] = 0xAAAAAAAAAAAAAAAALL;
      do
      {
        *((_BYTE *)v24 + v19) = a5;
        a5 >>= 8;
        ++v19;
      }
      while (v19 != 8);
      v20 = ccpoly1305_update();
      v21 = 0;
      v24[0] = 0xAAAAAAAAAAAAAAAALL;
      do
      {
        *((_BYTE *)v24 + v21) = v18;
        v18 >>= 8;
        ++v21;
      }
      while (v21 != 8);
      v22 = v20 | v17 | ccpoly1305_update();
      v12 = v22 | ccpoly1305_final();
      if ((_DWORD)v12 && g_boringssl_log && os_log_type_enabled((os_log_t)g_boringssl_log, OS_LOG_TYPE_ERROR))
        calc_tag_cold_1();
    }
  }
  return v12;
}

uint64_t bssl::SSLAEADContext::Seal(uint64_t a1, char *a2, _QWORD *a3, unint64_t a4, char a5, __int16 a6, unint64_t a7, int a8, uint64_t a9, uint64_t a10, char *__src, uint64_t a12)
{
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  uint64_t v23;
  uint64_t result;
  uint64_t v25;

  if ((*(_BYTE *)(a1 + 625) & 1) != 0)
    v19 = *(unsigned __int8 *)(a1 + 621);
  else
    v19 = 0;
  v25 = 0xAAAAAAAAAAAAAAAALL;
  if (*(_QWORD *)a1)
  {
    if (!EVP_AEAD_CTX_tag_len((uint64_t *)(a1 + 8), &v25, a12, 0))
    {
      v20 = 16;
      v21 = 200;
      v22 = 404;
LABEL_12:
      ERR_put_error(v20, 0, v21, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/ssl_aead_ctx.cc", v22);
      return 0;
    }
  }
  else
  {
    v25 = 0;
  }
  v23 = v19 + a12;
  if (__CFADD__(v19, a12) || __CFADD__(v25, v23))
  {
    v20 = 30;
    v21 = 200;
    v22 = 409;
    goto LABEL_12;
  }
  if (v25 + v23 > a4)
  {
    v20 = 16;
    v21 = 121;
    v22 = 413;
    goto LABEL_12;
  }
  result = bssl::SSLAEADContext::SealScatter(a1, a2, &a2[v19], &a2[v19 + a12], a5, a6, a7, a8, a9, a10, __src, a12, 0, 0);
  if ((_DWORD)result)
  {
    *a3 = v25 + v23;
    return 1;
  }
  return result;
}

void bssl::Delete<bssl::SSLAEADContext>(_QWORD *a1)
{
  if (a1)
  {
    EVP_AEAD_CTX_cleanup((uint64_t)(a1 + 1));
    OPENSSL_free(a1);
  }
}

uint64_t ENGINE_get_RSA_method(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t ENGINE_get_ECDSA_method(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t METHOD_unref(uint64_t result)
{
  if (result)
  {
    if (!*(_BYTE *)(result + 4))
      METHOD_unref_cold_1();
  }
  return result;
}

int BN_GENCB_call(BN_GENCB *cb, int a, int b)
{
  if (cb)
    return ((uint64_t (*)(_QWORD, _QWORD, BN_GENCB *))cb->arg)(*(_QWORD *)&a, *(_QWORD *)&b, cb);
  else
    return 1;
}

int BN_generate_prime_ex(BIGNUM *ret, int bits, int safe, const BIGNUM *add, const BIGNUM *rem, BN_GENCB *cb)
{
  int v11;
  _BOOL4 v12;
  BN_CTX *v13;
  BN_CTX *v14;
  uint64_t v15;
  BIGNUM *v16;
  BIGNUM *v17;
  BIGNUM *v18;
  BIGNUM *v19;
  const BIGNUM *v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  _BOOL4 v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  int v34;
  _BOOL4 v36;
  int v37;
  BN_GENCB *v38;
  unsigned int v39;
  unsigned int v40;
  BIGNUM *a;
  BIGNUM *r;
  int v43;
  int v44;
  int v45;

  if (bits > 3746)
  {
    v11 = 3;
LABEL_13:
    v12 = safe != 0;
    goto LABEL_14;
  }
  if (bits > 1344)
  {
    v11 = 4;
    goto LABEL_13;
  }
  if (bits > 475)
  {
    v11 = 5;
    goto LABEL_13;
  }
  if (bits > 399)
  {
    v11 = 6;
    goto LABEL_13;
  }
  if (bits > 346)
  {
    v11 = 7;
    goto LABEL_13;
  }
  if (bits >= 308)
  {
    v11 = 8;
    goto LABEL_13;
  }
  if (bits <= 1)
  {
    v34 = 400;
LABEL_95:
    ERR_put_error(3, 0, 103, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/bn/prime.c", v34);
    return 0;
  }
  if (bits <= 0x36)
    v11 = 34;
  else
    v11 = 27;
  v12 = safe != 0;
  if (bits == 2 && safe)
  {
    v34 = 404;
    goto LABEL_95;
  }
LABEL_14:
  v13 = BN_CTX_new();
  if (!v13)
    return 0;
  v14 = v13;
  BN_CTX_start(v13);
  r = BN_CTX_get(v14);
  if (r)
  {
    v15 = 0;
    a = (BIGNUM *)rem;
    while (1)
    {
LABEL_17:
      if (!add)
      {
        while (BN_rand(ret, bits, 1, 1))
        {
          if (!bn_odd_number_is_obviously_composite((unsigned int *)ret))
          {
            if (cb)
              goto LABEL_49;
            goto LABEL_50;
          }
        }
        goto LABEL_85;
      }
      BN_CTX_start(v14);
      v16 = BN_CTX_get(v14);
      v17 = v16;
      v38 = cb;
      v36 = v12;
      v37 = v11;
      v39 = v15;
      if (v12)
        break;
      if (!v16 || !BN_rand(ret, bits, 0, 1) || !BN_div(0, v17, ret, add, v14) || !BN_sub(ret, ret, v17))
        goto LABEL_84;
      if (a)
      {
        if (!BN_add(ret, ret, a))
          goto LABEL_84;
      }
      else if (!BN_add_word(ret, 1uLL))
      {
        goto LABEL_84;
      }
      if (ret->top <= 16)
        v21 = 512;
      else
        v21 = 1024;
      for (i = 1; i != v21; ++i)
      {
        while (bn_mod_u16_consttime((uint64_t)ret, (unsigned __int16)kPrimes[i]) <= 1)
        {
          i = 1;
          if (!BN_add(ret, ret, add))
            goto LABEL_84;
        }
      }
LABEL_48:
      BN_CTX_end(v14);
      cb = v38;
      v12 = v36;
      v11 = v37;
      v15 = v39;
      if (v38)
      {
LABEL_49:
        if (!((unsigned int (*)(_QWORD, uint64_t, BN_GENCB *))cb->arg)(0, v15, cb))
          goto LABEL_85;
      }
LABEL_50:
      v15 = (v15 + 1);
      if (v12)
      {
        if (BN_rshift1(r, ret))
        {
          v40 = v15;
          v23 = 0;
          while (1)
          {
            v44 = -1431655766;
            v24 = BN_primality_test(&v44, ret, 1, v14, 0, 0);
            v25 = v44;
            if (!v24)
              v25 = -1;
            if (v25 == -1)
              break;
            if (!v25)
              goto LABEL_83;
            v45 = -1431655766;
            v26 = BN_primality_test(&v45, r, 1, v14, 0, 0);
            v27 = v45;
            if (!v26)
              v27 = -1;
            if (v27 == -1)
              goto LABEL_85;
            if (!v27)
            {
LABEL_83:
              v15 = v40;
              goto LABEL_17;
            }
            if (cb && !((unsigned int (*)(uint64_t, uint64_t, BN_GENCB *))cb->arg)(1, v23, cb))
              goto LABEL_85;
            v23 = (v23 + 1);
            v28 = 1;
            if (v11 == (_DWORD)v23)
              goto LABEL_86;
          }
        }
        goto LABEL_85;
      }
      v43 = -1431655766;
      v29 = BN_primality_test(&v43, ret, v11, v14, 0, (uint64_t)cb);
      v30 = v43;
      if (!v29)
        v30 = -1;
      if (v30)
      {
        v28 = v30 != -1;
        goto LABEL_86;
      }
    }
    v18 = BN_CTX_get(v14);
    v19 = BN_CTX_get(v14);
    if (v19)
    {
      v20 = v19;
      if (BN_rshift1(v19, add))
      {
        if (BN_rand(v18, bits - 1, 0, 1) && BN_div(0, v17, v18, v20, v14) && BN_sub(v18, v18, v17))
        {
          if (a)
          {
            if (!BN_rshift1(v17, a) || !BN_add(v18, v18, v17))
              goto LABEL_84;
LABEL_70:
            if (BN_lshift1(ret, v18) && BN_add_word(ret, 1uLL))
            {
              if (ret->top <= 16)
                v31 = 512;
              else
                v31 = 1024;
              v32 = 1;
              do
              {
                while (1)
                {
                  v33 = (unsigned __int16)kPrimes[v32];
                  if (!bn_mod_u16_consttime((uint64_t)ret, v33)
                    || !bn_mod_u16_consttime((uint64_t)v18, v33))
                  {
                    break;
                  }
                  if (++v32 == v31)
                    goto LABEL_48;
                }
                if (!BN_add(ret, ret, add))
                  break;
                v32 = 1;
              }
              while (BN_add(v18, v18, v20));
            }
            goto LABEL_84;
          }
          if (BN_add_word(v18, 1uLL))
            goto LABEL_70;
        }
      }
    }
LABEL_84:
    BN_CTX_end(v14);
  }
LABEL_85:
  v28 = 0;
LABEL_86:
  BN_CTX_end(v14);
  BN_CTX_free(v14);
  return v28;
}

BOOL bn_odd_number_is_obviously_composite(unsigned int *a1)
{
  _BOOL8 result;
  unsigned __int16 v3;

  v3 = -21846;
  result = bn_trial_division(&v3, (uint64_t)a1);
  if (result)
    return !BN_is_word(a1, v3);
  return result;
}

BOOL bn_trial_division(unsigned __int16 *a1, uint64_t a2)
{
  unint64_t v4;
  unsigned __int16 v5;
  uint64_t v6;
  _BOOL8 result;

  if (*(int *)(a2 + 8) <= 16)
    v4 = 512;
  else
    v4 = 1024;
  v5 = 3;
  if (bn_mod_u16_consttime(a2, 3u))
  {
    v6 = 2;
    while (v4 != v6)
    {
      v5 = kPrimes[v6++];
      if (!bn_mod_u16_consttime(a2, v5))
      {
        result = v6 - 1 < v4;
        goto LABEL_10;
      }
    }
    return 0;
  }
  else
  {
    result = 1;
LABEL_10:
    *a1 = v5;
  }
  return result;
}

uint64_t bn_miller_rabin_init(uint64_t a1, BIGNUM *a2, BN_CTX *ctx)
{
  BIGNUM *v6;
  uint64_t v7;
  BIGNUM *v8;
  uint64_t result;
  const BIGNUM *v10;
  unsigned int v11;

  *(_QWORD *)a1 = BN_CTX_get(ctx);
  *(_QWORD *)(a1 + 8) = BN_CTX_get(ctx);
  *(_QWORD *)(a1 + 16) = BN_CTX_get(ctx);
  v6 = BN_CTX_get(ctx);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)a1;
  if (!*(_QWORD *)a1 || !*(_QWORD *)(a1 + 8))
    return 0;
  v8 = v6;
  result = 0;
  if (*(_QWORD *)(a1 + 16))
  {
    if (v8)
    {
      v10 = BN_value_one();
      result = bn_usub_consttime(v7, (uint64_t)&a2[1], (uint64_t)v10);
      if ((_DWORD)result)
      {
        v11 = BN_count_low_zero_bits(*(_QWORD *)a1);
        *(_DWORD *)(a1 + 36) = v11;
        result = bn_rshift_secret_shift(*(_QWORD *)(a1 + 8), *(const BIGNUM **)a1, v11, ctx);
        if ((_DWORD)result)
        {
          *(_DWORD *)(a1 + 32) = BN_num_bits(a2 + 1);
          result = bn_one_to_montgomery(*(BIGNUM **)(a1 + 16), a2, ctx);
          if ((_DWORD)result)
            return bn_usub_consttime(*(_QWORD *)(a1 + 24), (uint64_t)&a2[1], *(_QWORD *)(a1 + 16)) != 0;
        }
      }
    }
  }
  return result;
}

uint64_t bn_miller_rabin_iteration(uint64_t a1, _DWORD *a2, const BIGNUM *a3, uint64_t a4, BN_CTX *ctx)
{
  BIGNUM *v10;
  BIGNUM *v11;
  _BOOL4 v12;
  uint64_t v13;
  int v14;
  uint64_t v16;

  BN_CTX_start(ctx);
  v10 = BN_CTX_get(ctx);
  if (v10
    && (v11 = v10,
        BN_mod_exp_mont_consttime(v10, a3, *(const BIGNUM **)(a1 + 8), (const BIGNUM *)(a4 + 24), ctx, (BN_MONT_CTX *)a4))&& BN_to_montgomery(v11, v11, (BIGNUM *)a4, ctx))
  {
    v12 = BN_equal_consttime((uint64_t)v11, *(_QWORD *)(a1 + 16));
    v13 = -(uint64_t)(BN_equal_consttime((uint64_t)v11, *(_QWORD *)(a1 + 24)) | v12);
    if (*(int *)(a1 + 32) >= 2)
    {
      v14 = 1;
      do
      {
        if (v14 == *(_DWORD *)(a1 + 36) && v13 != -1)
          break;
        if (!BN_mod_mul_montgomery(v11, v11, v11, (BN_MONT_CTX *)a4, ctx))
          goto LABEL_15;
        v13 |= -(uint64_t)BN_equal_consttime((uint64_t)v11, *(_QWORD *)(a1 + 24));
        if ((BN_equal_consttime((uint64_t)v11, *(_QWORD *)(a1 + 16)) & (unint64_t)~v13) != 0)
          break;
        ++v14;
      }
      while (v14 < *(_DWORD *)(a1 + 32));
    }
    *a2 = v13 & 1;
    v16 = 1;
  }
  else
  {
LABEL_15:
    v16 = 0;
  }
  BN_CTX_end(ctx);
  return v16;
}

uint64_t BN_primality_test(_DWORD *a1, BIGNUM *a2, int a3, BN_CTX *a4, int a5, uint64_t a6)
{
  const BIGNUM *v12;
  uint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  int v17;
  BN_CTX *v18;
  BIGNUM *v19;
  BIGNUM *v20;
  BN_MONT_CTX *v21;
  __int128 v22;
  unint64_t v23;
  unint64_t v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  _BOOL8 v29;
  BN_CTX *v30;
  int v31;
  int v32;
  _OWORD v33[2];
  unint64_t v34;

  *a1 = 0;
  v12 = BN_value_one();
  if (BN_cmp(a2, v12) < 1)
    return 1;
  if (!BN_is_odd((uint64_t)a2))
  {
    v14 = (unsigned int *)a2;
    v15 = 2;
LABEL_6:
    *a1 = BN_is_word(v14, v15);
    return 1;
  }
  if (BN_is_word((unsigned int *)a2, 3))
  {
    v13 = 1;
    *a1 = 1;
    return v13;
  }
  if (a5)
  {
    LOWORD(v33[0]) = -21846;
    if (bn_trial_division((unsigned __int16 *)v33, (uint64_t)a2))
    {
      v15 = LOWORD(v33[0]);
      v14 = (unsigned int *)a2;
      goto LABEL_6;
    }
    if (a6 && !(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(a6 + 8))(1, 0xFFFFFFFFLL, a6))
      return 0;
  }
  if (!a3)
  {
    v17 = BN_num_bits(a2);
    if (v17 <= 3746)
    {
      if (v17 <= 1344)
      {
        if (v17 <= 475)
        {
          if (v17 <= 399)
          {
            if (v17 <= 346)
            {
              if (v17 <= 307)
              {
                if (v17 <= 54)
                  a3 = 34;
                else
                  a3 = 27;
              }
              else
              {
                a3 = 8;
              }
            }
            else
            {
              a3 = 7;
            }
          }
          else
          {
            a3 = 6;
          }
        }
        else
        {
          a3 = 5;
        }
      }
      else
      {
        a3 = 4;
      }
    }
    else
    {
      a3 = 3;
    }
  }
  if (a4)
  {
    v18 = 0;
    goto LABEL_33;
  }
  a4 = BN_CTX_new();
  v18 = a4;
  if (!a4)
    return 0;
LABEL_33:
  BN_CTX_start(a4);
  v19 = BN_CTX_get(a4);
  v20 = (BIGNUM *)BN_MONT_CTX_new_consttime(a2, a4);
  v21 = (BN_MONT_CTX *)v20;
  v13 = 0;
  v34 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v22 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v22 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v33[0] = v22;
  v33[1] = v22;
  if (v19 && v20)
  {
    if (bn_miller_rabin_init((uint64_t)v33, v20, a4))
    {
      v30 = v18;
      v23 = 0;
      v24 = a3;
      v25 = 1;
      v26 = *(_QWORD *)&v33[0];
      do
      {
        v32 = -1431655766;
        if (!bn_rand_secret_range((uint64_t)v19, &v32, 2uLL, v26)
          || (v27 = v32, v31 = 0, !bn_miller_rabin_iteration((uint64_t)v33, &v31, v19, (uint64_t)v21, a4)))
        {
LABEL_50:
          v13 = 0;
          goto LABEL_52;
        }
        if (!v31)
        {
          *a1 = 0;
          v13 = 1;
          goto LABEL_52;
        }
        if (a6 && !(*(unsigned int (**)(uint64_t, _QWORD, uint64_t))(a6 + 8))(1, v25 - 1, a6))
          goto LABEL_50;
        v23 += v27;
        v29 = v25++ < 0x10;
      }
      while (v29 | ((uint64_t)(((v23 - v24) ^ v23 | v23 ^ v24) ^ v23) >> 63));
      if (v23 < v24)
        BN_primality_test_cold_1();
      v13 = 1;
      *a1 = 1;
LABEL_52:
      v18 = v30;
    }
    else
    {
      v13 = 0;
    }
  }
  BN_MONT_CTX_free(v21);
  BN_CTX_end(a4);
  BN_CTX_free(v18);
  return v13;
}

uint64_t CRYPTO_library_init()
{
  return CRYPTO_once(&once, (void (*)(void))do_library_init);
}

uint64_t EVP_DigestSignInit(uint64_t a1, _QWORD *a2, const EVP_MD *a3, ENGINE *a4, uint64_t a5)
{
  return do_sigver_init(a1, a2, a3, a4, a5, 0);
}

uint64_t EVP_DigestSignUpdate(uint64_t a1, const void *a2, size_t a3)
{
  if (*(_QWORD *)(**(_QWORD **)(a1 + 16) + 40))
    return EVP_DigestUpdate((EVP_MD_CTX *)a1, a2, a3);
  ERR_put_error(6, 0, 125, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/digestsign/digestsign.c", 135);
  return 0;
}

uint64_t EVP_DigestSignFinal(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  _BOOL8 v4;
  unsigned int s;
  EVP_MD_CTX ctx;
  unsigned __int8 md[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(**(_QWORD **)(a1 + 16) + 40))
  {
    ERR_put_error(6, 0, 125, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/digestsign/digestsign.c", 154);
    return 0;
  }
  if (a2)
  {
    *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&ctx.digest = v3;
    *(_OWORD *)&ctx.flags = v3;
    v10 = v3;
    v11 = v3;
    *(_OWORD *)md = v3;
    v9 = v3;
    s = -1431655766;
    EVP_MD_CTX_init(&ctx);
    v4 = EVP_MD_CTX_copy_ex(&ctx, (const EVP_MD_CTX *)a1)
      && EVP_DigestFinal_ex(&ctx, md, &s)
      && EVP_PKEY_sign(*(_DWORD **)(a1 + 16)) != 0;
    EVP_MD_CTX_cleanup(&ctx);
    return v4;
  }
  EVP_MD_size(*(const EVP_MD **)a1);
  return EVP_PKEY_sign(*(_DWORD **)(a1 + 16));
}

uint64_t EVP_DigestSign(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, size_t a5)
{
  uint64_t v7;
  uint64_t (*v9)(void);

  v7 = *(_QWORD *)(a1 + 16);
  if (*(_QWORD *)(*(_QWORD *)v7 + 40))
  {
    if (!a2 || EVP_DigestSignUpdate(a1, a4, a5))
      return EVP_DigestSignFinal(a1, a2);
  }
  else
  {
    v9 = *(uint64_t (**)(void))(*(_QWORD *)v7 + 48);
    if (v9)
      return v9();
    ERR_put_error(6, 0, 125, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/fipsmodule/digestsign/digestsign.c", 228);
  }
  return 0;
}

int CRYPTO_get_ex_new_index(int class_index, uint64_t argl, void *argp, CRYPTO_EX_new *new_func, CRYPTO_EX_dup *dup_func, CRYPTO_EX_free *free_func)
{
  uint64_t v10;
  char *v11;
  char *v12;
  STACK *v13;
  int v14;

  v10 = *(_QWORD *)&class_index;
  v11 = (char *)OPENSSL_malloc(0x18uLL);
  if (v11)
  {
    v12 = v11;
    *(_QWORD *)v11 = argp;
    *((_QWORD *)v11 + 1) = new_func;
    *((_QWORD *)v11 + 2) = dup_func;
    CRYPTO_MUTEX_lock_write((pthread_rwlock_t *)v10);
    v13 = *(STACK **)(v10 + 200);
    if (v13 || (v13 = sk_new_null(), (*(_QWORD *)(v10 + 200) = v13) != 0))
    {
      if (sk_num(v13) <= (*(unsigned __int8 *)(v10 + 208) ^ 0x7FFFFFFFuLL))
      {
        if (sk_push(*(STACK **)(v10 + 200), v12))
        {
          v12 = 0;
          *(_DWORD *)argl = sk_num(*(const STACK **)(v10 + 200)) + *(unsigned __int8 *)(v10 + 208) - 1;
          v14 = 1;
LABEL_10:
          CRYPTO_MUTEX_unlock_read((pthread_rwlock_t *)v10);
          OPENSSL_free(v12);
          return v14;
        }
      }
      else
      {
        ERR_put_error(14, 0, 69, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/ex_data.c", 160);
      }
    }
    v14 = 0;
    goto LABEL_10;
  }
  return 0;
}

unint64_t OPENSSL_strnlen(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = 0;
  if (a2)
  {
    while (*(_BYTE *)(a1 + v2))
    {
      if (a2 == ++v2)
      {
        v2 = a2;
        break;
      }
    }
  }
  if (v2 >= a2)
    return a2;
  else
    return v2;
}

BOOL OPENSSL_isxdigit(int a1)
{
  return (a1 - 48) < 0xA || (a1 & 0xFFFFFFDF) - 65 < 6;
}

int BIO_snprintf(char *buf, size_t n, const char *format, ...)
{
  va_list va;

  va_start(va, format);
  return vsnprintf(buf, n, format, va);
}

uint64_t OPENSSL_vasprintf_internal(char **a1, const char *a2, va_list a3, int a4)
{
  _QWORD *(*v6)(unint64_t);
  void (*v7)(char *);
  _QWORD *(*v8)(char *, unint64_t);
  char *v9;
  char *v10;
  uint64_t result;
  size_t v12;
  char *v13;
  char *v14;

  v6 = (_QWORD *(*)(unint64_t))MEMORY[0x1E0C83E68];
  if (a4)
  {
    v7 = (void (*)(char *))MEMORY[0x1E0C834A8];
  }
  else
  {
    v6 = OPENSSL_malloc;
    v7 = (void (*)(char *))OPENSSL_free;
  }
  if (a4)
    v8 = (_QWORD *(*)(char *, unint64_t))MEMORY[0x1E0C85028];
  else
    v8 = (_QWORD *(*)(char *, unint64_t))OPENSSL_realloc;
  v9 = (char *)v6(64uLL);
  v10 = v9;
  if (!v9)
    goto LABEL_16;
  result = vsnprintf(v9, 0x40uLL, a2, a3);
  if ((result & 0x80000000) != 0)
    goto LABEL_16;
  if (result < 0x40)
  {
    v12 = 64;
  }
  else
  {
    v12 = result + 1;
    v13 = (char *)v8(v10, v12);
    if (!v13)
      goto LABEL_16;
    v14 = v13;
    result = vsnprintf(v13, v12, a2, a3);
    v10 = v14;
    if ((result & 0x80000000) != 0)
      goto LABEL_16;
  }
  if (v12 > result)
  {
    *a1 = v10;
    return result;
  }
LABEL_16:
  v7(v10);
  *a1 = 0;
  *__error() = 12;
  return 0xFFFFFFFFLL;
}

_QWORD *OPENSSL_strndup(_BYTE *a1, size_t a2)
{
  size_t v3;
  size_t v4;
  _QWORD *v5;
  _QWORD *v6;

  v3 = 0;
  if (a2)
  {
    while (a1[v3])
    {
      if (a2 == ++v3)
      {
        v3 = a2;
        break;
      }
    }
  }
  if (v3 >= a2)
    v4 = a2;
  else
    v4 = v3;
  if (v4 == -1)
  {
    ERR_put_error(14, 0, 65, "/Library/Caches/com.apple.xbs/Sources/boringssl/crypto/mem.c", 559);
    return 0;
  }
  else
  {
    v5 = OPENSSL_malloc(v4 + 1);
    v6 = v5;
    if (v5)
    {
      if (v4)
        memcpy(v5, a1, v4);
      *((_BYTE *)v6 + v4) = 0;
    }
  }
  return v6;
}

size_t OPENSSL_strlcpy(_BYTE *a1, char *__s, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;

  if (a3 < 2)
  {
    v4 = 0;
    if (!a3)
      return strlen(__s) + v4;
  }
  else
  {
    v3 = 0;
    v4 = a3 - 1;
    while (__s[v3])
    {
      a1[v3] = __s[v3];
      if (v4 == ++v3)
      {
        __s += v3;
        a1 += v3;
        goto LABEL_9;
      }
    }
    __s += v3;
    a1 += v3;
    v4 = v3;
  }
LABEL_9:
  *a1 = 0;
  return strlen(__s) + v4;
}

size_t OPENSSL_strlcat(_BYTE *a1, char *a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t i;

  v3 = a3;
  if (a3)
  {
    for (i = 0; a1[i]; ++i)
    {
      if (!--a3)
      {
        a1 += v3;
        return OPENSSL_strlcpy(a1, a2, a3) + v3;
      }
    }
    a1 += i;
    v3 = i;
  }
  return OPENSSL_strlcpy(a1, a2, a3) + v3;
}

uint64_t nw_protocol_boringssl_options_compare()
{
  return sec_protocol_options_contents_compare();
}

uint64_t nw_protocol_boringssl_options_are_equal()
{
  return sec_protocol_options_contents_compare();
}

void nw_protocol_boringssl_prepend_frame_array()
{
  _QWORD v0[6];

  v0[0] = 0;
  v0[1] = v0;
  v0[2] = 0x3010000000;
  v0[4] = 0;
  v0[5] = 0;
  v0[3] = "";
  nw_frame_array_init();
  nw_frame_array_foreach();
  nw_frame_array_prepend_array();
  _Block_object_dispose(v0, 8);
}

void sub_1B4FF4848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __nw_protocol_boringssl_prepend_frame_array_block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  nw_frame_array_remove();
  nw_frame_array_append();

  return 1;
}

BIGNUM *__cdecl BN_dup(const BIGNUM *a)
{
  BIGNUM *v2;
  BIGNUM *v3;

  if (!a)
    return 0;
  v2 = BN_new();
  v3 = v2;
  if (v2 && !BN_copy(v2, a))
  {
    BN_free(v3);
    return 0;
  }
  return v3;
}

uint64_t BN_one(uint64_t a1)
{
  uint64_t v2;

  v2 = 1;
  if (!bn_wexpand((_QWORD **)a1, 1uLL))
    return 0;
  *(_DWORD *)(a1 + 16) = 0;
  **(_QWORD **)a1 = 1;
  *(_DWORD *)(a1 + 8) = 1;
  return v2;
}

int BN_set_word(BIGNUM *a, unint64_t w)
{
  int result;
  int v5;

  if (w)
  {
    result = bn_wexpand(&a->d, 1uLL);
    if (!result)
      return result;
    a->neg = 0;
    *a->d = w;
    v5 = 1;
  }
  else
  {
    v5 = 0;
    a->neg = 0;
  }
  a->top = v5;
  return 1;
}

uint64_t bssl::SSL_HANDSHAKE::GetClientHello(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  unsigned __int16 *v8;
  unsigned __int16 *v9;

  v6 = a1[76];
  if (v6)
  {
    *(_WORD *)a2 = 256;
    *(_QWORD *)(a2 + 24) = a1[75];
    *(_QWORD *)(a2 + 32) = v6;
    v7 = a1[76];
    if (v7 <= 3)
      abort();
    v8 = (unsigned __int16 *)(a1[75] + 4);
    v9 = (unsigned __int16 *)(v7 - 4);
    *(_QWORD *)(a2 + 8) = v8;
    *(_QWORD *)(a2 + 16) = v7 - 4;
  }
  else
  {
    if (!(*(unsigned int (**)(void))(*(_QWORD *)*a1 + 24))())
    {
      ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake.cc", 191);
      return 0;
    }
    v8 = *(unsigned __int16 **)(a2 + 8);
    v9 = *(unsigned __int16 **)(a2 + 16);
  }
  if ((bssl::ssl_client_hello_init(*a1, a3, v8, v9) & 1) != 0)
    return 1;
  ERR_put_error(16, 0, 131, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake.cc", 196);
  bssl::ssl_send_alert((bssl *)*a1, (ssl_st *)2, 50);
  return 0;
}

uint64_t bssl::ssl_reverify_peer_cert(bssl **this, bssl::SSL_HANDSHAKE *a2)
{
  bssl *v2;
  bssl *v3;
  int v4;
  uint64_t (*v5)(bssl *, int *);
  uint64_t result;
  int v7;

  v2 = *this;
  if (*(_QWORD *)(*((_QWORD *)*this + 6) + 472))
    bssl::ssl_reverify_peer_cert();
  v3 = this[1];
  if (!*((_BYTE *)v3 + 312))
    bssl::ssl_reverify_peer_cert();
  v4 = (int)a2;
  LOBYTE(v7) = 46;
  v5 = (uint64_t (*)(bssl *, int *))*((_QWORD *)v3 + 6);
  if (!v5 || (result = v5(v2, &v7), (_DWORD)result == 1))
  {
    ERR_put_error(16, 0, 125, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake.cc", 462);
    if (v4)
      bssl::ssl_send_alert(v2, (ssl_st *)2, v7);
    return 1;
  }
  return result;
}

uint64_t bssl::ssl_output_cert_chain(bssl *this, bssl::SSL_HANDSHAKE *a2)
{
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  _OWORD v7[3];
  _OWORD v8[3];

  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v8[1] = v3;
  v8[2] = v3;
  v8[0] = v3;
  CBB_zero(v8);
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[1] = v4;
  v7[2] = v4;
  v7[0] = v4;
  if ((*(unsigned int (**)(_QWORD, _OWORD *, _OWORD *, uint64_t))(**(_QWORD **)this + 88))(*(_QWORD *)this, v8, v7, 11)&& bssl::ssl_add_cert_chain(this, (const bssl::SSL_HANDSHAKE *)v7)&& (bssl::ssl_add_message_cbb(*(_QWORD *)this, (uint64_t)v8) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    ERR_put_error(16, 0, 68, "/Library/Caches/com.apple.xbs/Sources/boringssl/ssl/handshake.cc", 600);
    v5 = 0;
  }
  CBB_cleanup((uint64_t)v8);
  return v5;
}

void sub_1B4FF4BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  CBB_cleanup((uint64_t)va);
  _Unwind_Resume(a1);
}

void std::unique_ptr<bssl::SSL_HANDSHAKE_HINTS,bssl::internal::Deleter>::reset[abi:ne180100](uint64_t *a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *a1;
  *a1 = a2;
  if (v3)
    bssl::Delete<bssl::SSL_HANDSHAKE_HINTS>(v3);
}

void bssl::Delete<bssl::SSL_HANDSHAKE_HINTS>(uint64_t a1)
{
  _QWORD *v2;

  if (a1)
  {
    bssl::Array<unsigned char>::~Array(a1 + 224);
    bssl::Array<unsigned char>::~Array(a1 + 208);
    bssl::Array<unsigned char>::~Array(a1 + 192);
    bssl::Array<unsigned char>::~Array(a1 + 168);
    bssl::Array<unsigned char>::~Array(a1 + 152);
    bssl::Array<unsigned char>::~Array(a1 + 128);
    bssl::Array<unsigned char>::~Array(a1 + 112);
    bssl::Array<unsigned char>::~Array(a1 + 96);
    bssl::Array<unsigned char>::~Array(a1 + 80);
    bssl::Array<unsigned char>::~Array(a1 + 56);
    bssl::Array<unsigned char>::~Array(a1 + 40);
    bssl::Array<unsigned char>::~Array(a1 + 16);
    v2 = (_QWORD *)bssl::Array<unsigned char>::~Array(a1);
    OPENSSL_free(v2);
  }
}

void boringssl_bio_create_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) BIO_new(BIO_nw_protocol()) failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_bio_create_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) Failed to allocate a boringssl_bio_state structure", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_ciphers_fillout_configuration_string_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) No supported ciphersuites from the provided selection", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_ciphers_create_configuration_string_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_2(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl_memory_malloc(%zu) failed", v2, v3, v4, v5, 2u);
}

void boringssl_ciphers_create_configuration_string_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) CFStringGetCString failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_ciphers_create_configuration_string_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) No supported ciphersuites from the provided selection", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_ciphers_copy_default_ciphersuites_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B4F6D000, log, OS_LOG_TYPE_DEBUG, "Restricted mode: Returning restricted default ciphersuite set.", v1, 2u);
}

void boringssl_ciphers_copy_supported_list_for_groups_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) CFDataCreateMutable failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_ciphers_copy_supported_list_for_groups_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_2(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl_memory_malloc(%zu) failed", v2, v3, v4, v5, 2u);
}

#error "1B4FF5150: call analysis failed (funcsize=45)"

#error "1B4FF521C: call analysis failed (funcsize=45)"

#error "1B4FF52E8: call analysis failed (funcsize=45)"

#error "1B4FF53C4: call analysis failed (funcsize=49)"

#error "1B4FF5490: call analysis failed (funcsize=45)"

#error "1B4FF5574: call analysis failed (funcsize=51)"

#error "1B4FF5650: call analysis failed (funcsize=49)"

#error "1B4FF5734: call analysis failed (funcsize=51)"

void boringssl_session_read_cold_2()
{
  id v0;
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_9();
  v2 = OUTLINED_FUNCTION_8(v1, 16);
  if (v2)
    v0 = OUTLINED_FUNCTION_20();
  v3 = OUTLINED_FUNCTION_20();
  boringssl_helper_get_ssl_error_code_description(2u);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_14(&dword_1B4F6D000, v4, v5, "%{public}s(%d) %{public}s[%p] %{public}s", v6, v7, v8, v9, 2u);

  if (v2)
}

#error "1B4FF5910: call analysis failed (funcsize=45)"

#error "1B4FF59DC: call analysis failed (funcsize=45)"

#error "1B4FF5AA8: call analysis failed (funcsize=45)"

#error "1B4FF5B74: call analysis failed (funcsize=45)"

#error "1B4FF5C40: call analysis failed (funcsize=45)"

#error "1B4FF5D0C: call analysis failed (funcsize=45)"

#error "1B4FF5DD8: call analysis failed (funcsize=45)"

#error "1B4FF5EA4: call analysis failed (funcsize=45)"

#error "1B4FF5F70: call analysis failed (funcsize=45)"

#error "1B4FF603C: call analysis failed (funcsize=45)"

#error "1B4FF6108: call analysis failed (funcsize=45)"

void __boringssl_session_apply_protocol_options_for_transport_block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) Clearning PSK data", v2, v3, v4, v5, v6);
}

void __boringssl_session_apply_protocol_options_for_transport_block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) Clearning PSK identity", v2, v3, v4, v5, v6);
}

#error "1B4FF62C4: call analysis failed (funcsize=45)"

#error "1B4FF6390: call analysis failed (funcsize=45)"

#error "1B4FF645C: call analysis failed (funcsize=45)"

#error "1B4FF6528: call analysis failed (funcsize=45)"

#error "1B4FF65F4: call analysis failed (funcsize=45)"

#error "1B4FF66C0: call analysis failed (funcsize=45)"

void nw_protocol_boringssl_write_bytes_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] no output_handler or get_output_frames callback", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_write_bytes_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136447490;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_19(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] output_frames is empty; requested min=%d, max=%d",
    v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136447490;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_19(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] output_frames is empty; requested min=%d, max=%d",
    v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] output frames count is zero", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_write_bytes_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  _BYTE v2[20];

  *(_DWORD *)v2 = 136447234;
  *(_QWORD *)&v2[4] = "nw_protocol_boringssl_write_bytes";
  *(_WORD *)&v2[12] = 1024;
  *(_DWORD *)&v2[14] = 177;
  *(_WORD *)&v2[18] = 2082;
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_16_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] failed to use %u frames, marking as failed", *(_QWORD *)v2, *(_QWORD *)&v2[8], *(_DWORD *)&v2[16]);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] total bytes written: 0 (no output frames available)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_write_bytes_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] total bytes written: 0 (no output frames available)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_write_bytes_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] total bytes written: 0 (no finalize_output_frames callback)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_write_bytes_cold_10()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] total bytes written: %u", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_11()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_16_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] claiming frame with %u bytes failed", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_13()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] write request: %u", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_write_bytes_cold_14()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_read_bytes_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] no input frames available", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_read_bytes_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] total bytes read: %u", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_read_bytes_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] read request: %u", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_read_bytes_cold_7()
{
  void *v0;
  int v1;
  char v2;
  NSObject *v3;
  int v4;
  const char *v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = "nw_protocol_boringssl_read_bytes";
  OUTLINED_FUNCTION_13_0();
  v6 = 229;
  v4 = v1;
  if ((v2 & 1) != 0)
    v0 = &unk_1B50022E3;
  v7 = 2082;
  v8 = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_1B4F6D000, v3, (uint64_t)v3, "%{public}s(%d) %{public}s[%p] ", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_read_frames_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] no output_handler or get_input_frames callback", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_handshake_negotiate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_handshake_negotiate_cold_2()
{
  void *v0;
  int v1;
  char v2;
  NSObject *v3;
  int v4;
  const char *v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = "nw_protocol_boringssl_handshake_negotiate";
  OUTLINED_FUNCTION_13_0();
  v6 = 792;
  v4 = v1;
  if ((v2 & 1) != 0)
    v0 = &unk_1B50022E3;
  v7 = 2082;
  v8 = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_1B4F6D000, v3, (uint64_t)v3, "%{public}s(%d) %{public}s[%p] ", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void nw_boringssl_read_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_output_available_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] relaying output available log", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_output_available_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] waiting for writable frames", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_output_available_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] received input available", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_output_available_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_input_available_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] triggering input available", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_input_available_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_disconnect_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_add_input_handler_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] no input_protocol or supports_external_data callback", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_add_input_handler_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] no get_parameters callback", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_add_input_handler_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] no parameters", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_add_input_handler_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] boringssl_context_create_with_nw_context failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_add_input_handler_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] boringssl_bio_create failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_add_input_handler_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] received add input handler again", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_add_input_handler_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_replace_input_handler_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_remove_input_handler_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_get_input_frames_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] Cannot get any bytes in current state", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_get_input_frames_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_get_output_frames_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] nw_frame_create failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_get_output_frames_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] output buffer is NULL", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_get_output_frames_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] nw_frame_create_external failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_get_output_frames_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_10_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] get output frames failed, state %d", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_get_output_frames_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] Waiting for writable frames -- returning 0 frames", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_get_output_frames_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_input_finished_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] default_input_handler is NULL", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_input_finished_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_finalize_output_frames_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_finalize_output_frames_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_waiting_for_output_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_connect_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] no parameters", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_connect_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] boringssl_context_ssl_context_create failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_connect_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] boringssl_context_ssl_context_create_datagram failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_connect_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_connected_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] no protocol->default_input_handler or connected callback", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_connected_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] TLS context is NULL. The connection was likely torn down between add_input_handler and connected callbacks.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_connected_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_reset_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] nw_parameters_copy_context failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_reset_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] boringssl_context_create_with_nw_context failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_reset_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] boringssl_bio_create failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_reset_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_copy_info_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_error_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_signal_connected_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_error_print_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  _WORD v3[10];
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)v3 = 136446978;
  OUTLINED_FUNCTION_1_0();
  *(_DWORD *)&v3[7] = 60;
  v3[9] = 2048;
  v4 = v0;
  v5 = 2082;
  v6 = v1;
  _os_log_error_impl(&dword_1B4F6D000, v2, OS_LOG_TYPE_ERROR, "%{public}s(%d) BoringSSL %p: %{public}s", (uint8_t *)v3, 0x26u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_frame_input_finalizer_cold_1()
{
  void *v0;
  int v1;
  char v2;
  NSObject *v3;
  int v4;
  const char *v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = "nw_protocol_boringssl_frame_input_finalizer";
  OUTLINED_FUNCTION_13_0();
  v6 = 580;
  v4 = v1;
  if ((v2 & 1) != 0)
    v0 = &unk_1B50022E3;
  v7 = 2082;
  v8 = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_1B4F6D000, v3, (uint64_t)v3, "%{public}s(%d) %{public}s[%p] ", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_write_frames_cold_1()
{
  os_log_t v0;
  int v1[10];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 136446978;
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  _os_log_fault_impl(&dword_1B4F6D000, v0, OS_LOG_TYPE_FAULT, "%{public}s(%d) %{public}s[%p] first frame cannot be larger than the frame array", (uint8_t *)v1, 0x26u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_write_frames_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] already in write frames, skipping", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_write_frames_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void __nw_protocol_boringssl_write_frames_block_invoke_129_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] External data buffer length is too large. Partial writes are unsupported.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __nw_protocol_boringssl_input_available_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] Failed to process input message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __nw_protocol_boringssl_get_input_frames_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] Resuming reading frames", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __nw_protocol_boringssl_get_input_frames_block_invoke_133_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] Failed to create trimmed frame", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

void __nw_protocol_boringssl_get_input_frames_block_invoke_133_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_16_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] system_malloc(%u) failed", v2);
  OUTLINED_FUNCTION_12_0();
}

void __nw_protocol_boringssl_get_input_frames_block_invoke_133_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_frame_output_finalizer_cold_1()
{
  void *v0;
  int v1;
  char v2;
  NSObject *v3;
  int v4;
  const char *v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = "nw_protocol_boringssl_frame_output_finalizer";
  OUTLINED_FUNCTION_13_0();
  v6 = 1099;
  v4 = v1;
  if ((v2 & 1) != 0)
    v0 = &unk_1B50022E3;
  v7 = 2082;
  v8 = v0;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_1B4F6D000, v3, (uint64_t)v3, "%{public}s(%d) %{public}s[%p] ", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_begin_connection_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) no parameters", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void nw_protocol_boringssl_begin_connection_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] no remote endpoint", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_begin_connection_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] no sec_protocol_options were supplied during instantiation", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_begin_connection_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] parameters is nil", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_begin_connection_cold_5()
{
  uint64_t v0;
  os_log_t v1;
  _BYTE v2[20];

  *(_DWORD *)v2 = 136447234;
  *(_QWORD *)&v2[4] = "nw_protocol_boringssl_begin_connection";
  *(_WORD *)&v2[12] = 1024;
  *(_DWORD *)&v2[14] = 559;
  *(_WORD *)&v2[18] = 2082;
  OUTLINED_FUNCTION_20_0();
  OUTLINED_FUNCTION_17_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] unable to copy context from parameters %p", *(_QWORD *)v2, *(_QWORD *)&v2[8], *(_DWORD *)&v2[16]);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_begin_connection_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] Success setting ECHconfig", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_begin_connection_cold_7()
{
  uint64_t v0;
  os_log_t v1;
  int v2;

  v2 = 136447234;
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] Failed to set ECHconfig: %@", v2);
  OUTLINED_FUNCTION_12_0();
}

void nw_protocol_boringssl_begin_connection_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_7_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] boringssl_session_apply_protocol_options_for_transport failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void nw_protocol_boringssl_begin_connection_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl session set bio failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void nw_protocol_boringssl_begin_connection_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl session create failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void nw_protocol_boringssl_begin_connection_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) %{public}s[%p] ", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_8_0();
}

void boringssl_crypto_hash_nid_to_cc_digest_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) No support for cc digest with NID %i.", v2, v3, v4, v5, 2u);
}

void digest_init_cold_1()
{
  __assert_rtn("digest_init", "boringssl_crypto_digests.m", 19, "ctx");
}

void digest_init_cold_2()
{
  __assert_rtn("digest_init", "boringssl_crypto_digests.m", 21, "ret == 0");
}

void digest_update_cold_1()
{
  __assert_rtn("digest_update", "boringssl_crypto_digests.m", 29, "ctx");
}

void digest_update_cold_2()
{
  __assert_rtn("digest_update", "boringssl_crypto_digests.m", 31, "ret == 0");
}

void digest_final_cold_1()
{
  __assert_rtn("digest_final", "boringssl_crypto_digests.m", 39, "ctx");
}

void digest_final_cold_2()
{
  __assert_rtn("digest_final", "boringssl_crypto_digests.m", 41, "ret == 0");
}

void CRYPTO_BUFFER_free_cold_1()
{
  __assert_rtn("CRYPTO_BUFFER_free", "pool.c", 235, "found == buf");
}

void bssl::dtls1_open_handshake()
{
  __assert_rtn("dtls1_open_handshake", "d1_both.cc", 393, "msg_len > 0");
}

{
  __assert_rtn("dtls1_open_handshake", "d1_both.cc", 387, "frag->msg_len == msg_len");
}

{
  __assert_rtn("dtls1_get_incoming_message", "d1_both.cc", 272, "frag->seq == msg_hdr->seq");
}

void bssl::dtls1_hm_fragment_mark()
{
  __assert_rtn("dtls1_hm_fragment_mark", "d1_both.cc", 212, "0");
}

{
  __assert_rtn("dtls1_hm_fragment_mark", "d1_both.cc", 216, "msg_len > 0");
}

void bssl::dtls1_next_message()
{
  __assert_rtn("dtls1_next_message", "d1_both.cc", 423, "ssl->s3->has_message");
}

{
  __assert_rtn("dtls1_next_message", "d1_both.cc", 424, "dtls1_is_current_message_complete(ssl)");
}

void bssl::dtls_has_unprocessed_handshake_data()
{
  __assert_rtn("dtls_has_unprocessed_handshake_data", "d1_both.cc", 441, "dtls1_is_current_message_complete(ssl)");
}

void bssl::add_outgoing()
{
  __assert_rtn("add_outgoing", "d1_both.cc", 557, "false");
}

void bssl::send_flight()
{
  __assert_rtn("dtls1_update_mtu", "d1_both.cc", 609, "ssl->d1->mtu >= dtls1_min_mtu()");
}

void bssl::hkdf_extract_to_secret()
{
  __assert_rtn("hkdf_extract_to_secret", "tls13_enc.cc", 57, "len == hs->secret().size()");
}

void bssl::tls13_init_early_key_schedule()
{
  __assert_rtn("tls13_init_early_key_schedule", "tls13_enc.cc", 77, "!hs->ssl->server");
}

void bssl::tls13_export_keying_material()
{
  __assert_rtn("tls13_export_keying_material", "tls13_enc.cc", 390, "0");
}

void EVP_CipherInit_ex_cold_1()
{
  __assert_rtn("EVP_CipherInit_ex", "cipher.c", 190, "ctx->cipher->block_size == 1 || ctx->cipher->block_size == 8 || ctx->cipher->block_size == 16");
}

void EVP_CipherInit_ex_cold_2()
{
  __assert_rtn("EVP_CipherInit_ex", "cipher.c", 203, "EVP_CIPHER_CTX_iv_length(ctx) <= sizeof(ctx->iv)");
}

void EVP_EncryptUpdate_cold_1()
{
  __assert_rtn("EVP_EncryptUpdate", "cipher.c", 308, "bl <= (int)sizeof(ctx->buf)");
}

void block_remainder_cold_1()
{
  __assert_rtn("block_remainder", "cipher.c", 252, "ctx->cipher->block_size != 0");
}

void block_remainder_cold_2()
{
  __assert_rtn("block_remainder", "cipher.c", 253, "(ctx->cipher->block_size & (ctx->cipher->block_size - 1)) == 0");
}

void EVP_EncryptFinal_ex_cold_1()
{
  __assert_rtn("EVP_EncryptFinal_ex", "cipher.c", 370, "b <= sizeof(ctx->buf)");
}

void EVP_DecryptUpdate_cold_1()
{
  __assert_rtn("EVP_DecryptUpdate", "cipher.c", 435, "b <= sizeof(ctx->final)");
}

void EVP_DecryptFinal_ex_cold_1()
{
  __assert_rtn("EVP_DecryptFinal_ex", "cipher.c", 499, "b <= sizeof(ctx->final)");
}

void sha512_final_impl_cold_1()
{
  __assert_rtn("sha512_final_impl", "sha512.c", 271, "md_len % 8 == 0");
}

void bssl::tls13_server_handshake()
{
  __assert_rtn("do_send_server_certificate_verify", "tls13_server.cc", 912, "0");
}

{
  __assert_rtn("do_send_half_rtt_ticket", "tls13_server.cc", 970, "hs->expected_client_finished().size() <= 0xff");
}

{
  __assert_rtn("do_send_half_rtt_ticket", "tls13_server.cc", 969, "!SSL_is_dtls(hs->ssl)");
}

void bssl::add_new_session_tickets()
{
  __assert_rtn("add_new_session_tickets", "tls13_server.cc", 158, "ssl->session_ctx->num_tickets <= kMaxTickets");
}

void EC_KEY_set_group_cold_1()
{
  __assert_rtn("EC_KEY_set_group", "ec_key.c", 226, "key->pub_key == NULL");
}

void EC_KEY_set_group_cold_2()
{
  __assert_rtn("EC_KEY_set_group", "ec_key.c", 225, "key->priv_key == NULL");
}

void boringssl_private_key_sign_cold_1(__CFError **a1, NSObject *a2, uint64_t a3)
{
  __CFError *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  if (v4)
    LODWORD(v4) = CFErrorGetCode(v4);
  v5 = 136446722;
  v6 = "boringssl_private_key_sign";
  v7 = 1024;
  v8 = 84;
  v9 = 1024;
  v10 = (int)v4;
  OUTLINED_FUNCTION_0_3(&dword_1B4F6D000, a2, a3, "%{public}s(%d) SecKeyCreateSignature failed: %d", (uint8_t *)&v5);
}

void boringssl_private_key_sign_cold_2(unsigned __int16 a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 136446722;
  v4 = "boringssl_private_key_sign";
  v5 = 1024;
  v6 = 24;
  v7 = 1026;
  v8 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1B4F6D000, a2, a3, "%{public}s(%d) Failed to get signature algorithm: %{public}d", (uint8_t *)&v3);
}

void bssl::dtls1_open_app_data()
{
  __assert_rtn("dtls1_open_app_data", "d1_pkt.cc", 133, "!SSL_in_init(ssl)");
}

void bssl::dtls1_write_app_data()
{
  __assert_rtn("dtls1_write_app_data", "d1_pkt.cc", 191, "!SSL_in_init(ssl)");
}

void bssl::dtls1_write_record()
{
  __assert_rtn("dtls1_write_record", "d1_pkt.cc", 222, "in.size() <= SSL3_RT_MAX_PLAIN_LENGTH");
}

{
  __assert_rtn("dtls1_write_record", "d1_pkt.cc", 226, "buf->empty()");
}

void bssl::tls1_configure_aead()
{
  __assert_rtn("tls1_configure_aead", "t1_enc.cc", 223, "key_block_cache->size() == key_block_size");
}

void bssl::ssl_compare_public_and_private_key()
{
  __assert_rtn("ssl_compare_public_and_private_key", "ssl_cert.cc", 526, "0");
}

void bssl::ssl_check_leaf_certificate()
{
  __assert_rtn("ssl_check_leaf_certificate", "ssl_cert.cc", 712, "ssl_protocol_version(hs->ssl) < TLS1_3_VERSION");
}

void bssl::ssl_signing_with_dc()
{
  __assert_rtn("ssl_can_serve_dc", "ssl_cert.cc", 847, "hs->ssl->s3->have_version");
}

void CBB_finish_i2d_cold_1()
{
  __assert_rtn("CBB_finish_i2d", "asn1_compat.c", 30, "cbb->u.base.can_resize");
}

void CBB_finish_i2d_cold_2()
{
  __assert_rtn("CBB_finish_i2d", "asn1_compat.c", 29, "!cbb->is_child");
}

void bssl::ssl_protocol_version()
{
  __assert_rtn("ssl_protocol_version", "ssl_versions.cc", 252, "ssl->s3->have_version");
}

{
  __assert_rtn("ssl_protocol_version", "ssl_versions.cc", 256, "0");
}

void bssl::tls_on_handshake_complete()
{
  __assert_rtn("tls_on_handshake_complete", "tls_method.cc", 79, "!ssl->s3->hs_buf || ssl->s3->hs_buf->length == 0");
}

{
  __assert_rtn("tls_on_handshake_complete", "tls_method.cc", 72, "!ssl->s3->has_message");
}

void bssl::tls_seal_record()
{
  __assert_rtn("tls_seal_scatter_record", "tls_record.cc", 502, "tls_seal_scatter_prefix_len(ssl, type, in_len) == split_record_len + SSL3_RT_HEADER_LENGTH - 1");
}

{
  __assert_rtn("tls_seal_scatter_record", "tls_record.cc", 492, "SSL3_RT_HEADER_LENGTH + ssl_cipher_get_record_split_len( ssl->s3->aead_write_ctx->cipher()) == split_record_len");
}

{
  __assert_rtn("tls_seal_scatter_record", "tls_record.cc", 486, "false");
}

{
  __assert_rtn("tls_seal_scatter_record", "tls_record.cc", 472, "ssl->s3->aead_write_ctx->ExplicitNonceLen() == 0");
}

void bssl::do_seal_record()
{
  __assert_rtn("do_seal_record", "tls_record.cc", 390, "!buffers_alias(in, in_len, out_suffix, suffix_len)");
}

{
  __assert_rtn("do_seal_record", "tls_record.cc", 389, "!buffers_alias(in, in_len, out_prefix, ssl_record_prefix_len(ssl))");
}

{
  __assert_rtn("do_seal_record", "tls_record.cc", 388, "in == out || !buffers_alias(in, in_len, out, in_len)");
}

void bssl::ssl_private_key_decrypt()
{
  __assert_rtn("ssl_private_key_decrypt", "ssl_privkey.cc", 309, "!hs->can_release_private_key");
}

void aead_tls_open_cold_1()
{
  __assert_rtn("aead_tls_open", "e_tls.c", 356, "EVP_CIPHER_CTX_mode(&tls_ctx->cipher_ctx) != EVP_CIPH_CBC_MODE");
}

void aead_tls_open_cold_2()
{
  __assert_rtn("aead_tls_open", "e_tls.c", 367, "mac_len == HMAC_size(&tls_ctx->hmac_ctx)");
}

void aead_tls_open_cold_3()
{
  __assert_rtn("aead_tls_open", "e_tls.c", 349, "mac_len == HMAC_size(&tls_ctx->hmac_ctx)");
}

void aead_tls_open_cold_4()
{
  __assert_rtn("aead_tls_open", "e_tls.c", 316, "data_plus_mac_len >= HMAC_size(&tls_ctx->hmac_ctx)");
}

void aead_tls_open_cold_5()
{
  __assert_rtn("aead_tls_open", "e_tls.c", 294, "total == in_len");
}

void aead_tls_seal_scatter_cold_1()
{
  __assert_rtn("aead_tls_seal_scatter", "e_tls.c", 212, "block_size <= 256");
}

void aead_tls_seal_scatter_cold_2()
{
  __assert_rtn("aead_tls_seal_scatter", "e_tls.c", 230, "tag_len == aead_tls_tag_len(ctx, in_len, extra_in_len)");
}

void aead_tls_seal_scatter_cold_3()
{
  __assert_rtn("aead_tls_seal_scatter", "e_tls.c", 229, "len == 0");
}

void aead_tls_seal_scatter_cold_4()
{
  __assert_rtn("aead_tls_seal_scatter", "e_tls.c", 213, "EVP_CIPHER_CTX_mode(&tls_ctx->cipher_ctx) == EVP_CIPH_CBC_MODE");
}

void aead_tls_seal_scatter_cold_5()
{
  __assert_rtn("aead_tls_seal_scatter", "e_tls.c", 199, "buf_len == (int)block_size");
}

void aead_tls_seal_scatter_cold_6()
{
  __assert_rtn("aead_tls_seal_scatter", "e_tls.c", 192, "len + block_size - early_mac_len == in_len");
}

void aead_tls_tag_len_cold_1()
{
  __assert_rtn("aead_tls_tag_len", "e_tls.c", 111, "block_size != 0 && (block_size & (block_size - 1)) == 0");
}

void aead_tls_tag_len_cold_2()
{
  __assert_rtn("aead_tls_tag_len", "e_tls.c", 99, "extra_in_len == 0");
}

void aead_tls_init_cold_1()
{
  __assert_rtn("aead_tls_init", "e_tls.c", 80, "mac_key_len <= EVP_MAX_MD_SIZE");
}

void aead_tls_init_cold_2()
{
  __assert_rtn("aead_tls_init", "e_tls.c", 75, "mac_key_len + enc_key_len + (implicit_iv ? EVP_CIPHER_iv_length(cipher) : 0) == key_len");
}

void BN_mod_exp_mont_cold_1()
{
  __assert_rtn("BN_mod_exp_mont", "exponentiation.c", 692, "wvalue & 1");
}

void BN_mod_exp_mont_cold_2()
{
  __assert_rtn("BN_mod_exp_mont", "exponentiation.c", 693, "wvalue < (1 << window)");
}

void BN_mod_exp_mont_cold_3()
{
  __assert_rtn("BN_mod_exp_mont", "exponentiation.c", 710, "!r_is_one");
}

void bn_mod_exp_mont_small_cold_1()
{
  __assert_rtn("bn_mod_exp_mont_small", "exponentiation.c", 730, "BN_is_odd(&mont->N)");
}

void bn_mod_exp_mont_small_cold_2()
{
  __assert_rtn("bn_mod_exp_mont_small", "exponentiation.c", 742, "bits != 0");
}

void bn_mod_exp_mont_small_cold_3()
{
  __assert_rtn("bn_mod_exp_mont_small", "exponentiation.c", 796, "wvalue & 1");
}

void bn_mod_exp_mont_small_cold_4()
{
  __assert_rtn("bn_mod_exp_mont_small", "exponentiation.c", 797, "wvalue < (1u << window)");
}

void bn_mod_exp_mont_small_cold_5()
{
  __assert_rtn("bn_mod_exp_mont_small", "exponentiation.c", 811, "!r_is_one");
}

void BN_mod_exp_mont_consttime_cold_1()
{
  __assert_rtn("BN_mod_exp_mont_consttime", "exponentiation.c", 963, "(size_t)top <= BN_MONTGOMERY_MAX_WORDS");
}

void BN_mod_exp_mont_consttime_cold_2()
{
  __assert_rtn("BN_mod_exp_mont_consttime", "exponentiation.c", 1014, "BN_ucmp(a, m) < 0");
}

void BN_mod_exp_mont_consttime_cold_3()
{
  __assert_rtn("BN_mod_exp_mont_consttime", "exponentiation.c", 1013, "!a->neg");
}

void BN_mod_exp_mont_consttime_cold_4()
{
  __assert_rtn("align_pointer", "internal.h", 282, "((uintptr_t)ptr & (alignment - 1)) == 0");
}

void copy_to_prebuf_cold_1()
{
  __assert_rtn("copy_to_prebuf", "exponentiation.c", 842, "ret");
}

void sha256_final_impl_cold_1()
{
  __assert_rtn("crypto_md32_final", "md32_common.h", 165, "n < block_size");
}

void sha256_final_impl_cold_2()
{
  __assert_rtn("sha256_final_impl", "sha256.c", 148, "md_len % 4 == 0");
}

void EVP_AEAD_CTX_open_cold_1()
{
  __assert_rtn("EVP_AEAD_CTX_open", "aead.c", 205, "ctx->tag_len");
}

void EVP_AEAD_CTX_tag_len_cold_1()
{
  __assert_rtn("EVP_AEAD_CTX_tag_len", "aead.c", 273, "ctx->aead->seal_scatter_supports_extra_in || !extra_in_len");
}

void RSA_encrypt_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl_memory_malloc failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void RSA_encrypt_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) RSA_PKCS1_OAEP_PADDING encryption not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void RSA_encrypt_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) RSA_NO_PADDING encryption not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void RSA_verify_raw_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl_memory_malloc failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void RSA_verify_raw_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl_memory_malloc failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void rsa_default_decrypt_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) rsa_default_decrypt not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void RSA_decrypt_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) RSA_decrypt not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void rsa_default_sign_raw_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) rsa_default_sign_raw not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void RSA_sign_raw_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) RSA_sign_raw not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void RSA_sign_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) RSA_sign not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void RSA_sign_pss_mgf1_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) RSA_sign not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ec_GFp_nistp224_point_mul_public_cold_1()
{
  __assert_rtn("ec_GFp_nistp224_point_mul_public", "p224-64.c", 1076, "!skip");
}

void bn_mod_u16_consttime_cold_1()
{
  __assert_rtn("bn_mod_u16_consttime", "div_extra.c", 72, "p <= 16");
}

void mod_u16_cold_1()
{
  __assert_rtn("mod_u16", "div_extra.c", 42, "n < d");
}

void ec_point_to_bytes_cold_1()
{
  __assert_rtn("ec_point_to_bytes", "oct.c", 107, "field_len == BN_num_bytes(&group->field)");
}

void ec_point_to_bytes_cold_2()
{
  __assert_rtn("ec_point_to_bytes", "oct.c", 103, "field_len == BN_num_bytes(&group->field)");
}

void ec_GFp_nistp256_point_mul_public_cold_1()
{
  __assert_rtn("ec_GFp_nistp256_point_mul_public", "p256.c", 656, "digit & 1");
}

void ec_GFp_nistp256_cmp_x_coordinate_cold_1()
{
  __assert_rtn("ec_GFp_nistp256_cmp_x_coordinate", "p256.c", 711, "group->field.width == group->order.width");
}

void HMAC_cold_1(void *a1, const EVP_MD *a2)
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = 136446722;
  v5 = "HMAC";
  v6 = 1024;
  v7 = 34;
  v8 = 1024;
  v9 = EVP_MD_type(a2);
  _os_log_error_impl(&dword_1B4F6D000, v3, OS_LOG_TYPE_ERROR, "%{public}s(%d) evp_to_ccdigest_info(%d) failed", (uint8_t *)&v4, 0x18u);

}

void HMAC_Init_ex_cold_1()
{
  __assert_rtn("HMAC_Init_ex", "boringssl_crypto_hmac.m", 97, "block_size <= sizeof(key_block)");
}

void bn_mont_n0_cold_1()
{
  __assert_rtn("bn_mont_n0", "montgomery_inv.c", 38, "BN_is_odd(n)");
}

void bn_mont_n0_cold_2()
{
  __assert_rtn("bn_neg_inv_mod_r_u64", "montgomery_inv.c", 105, "n % 2 == 1");
}

void bn_mont_n0_cold_3()
{
  __assert_rtn("bn_neg_inv_mod_r_u64", "montgomery_inv.c", 156, "1 == ((BN_ULLONG)u * 2 * alpha) - ((BN_ULLONG)v * beta)");
}

void bn_mont_n0_cold_4()
{
  __assert_rtn("bn_neg_inv_mod_r_u64", "montgomery_inv.c", 120, "(BN_ULLONG)(1) << (LG_LITTLE_R - i) == ((BN_ULLONG)u * 2 * alpha) - ((BN_ULLONG)v * beta)");
}

void bn_mont_n0_cold_5()
{
  __assert_rtn("bn_mont_n0", "montgomery_inv.c", 37, "!BN_is_negative(n)");
}

void bn_mont_n0_cold_6()
{
  __assert_rtn("bn_mont_n0", "montgomery_inv.c", 36, "!BN_is_zero(n)");
}

void bn_mod_exp_base_2_consttime_cold_1()
{
  __assert_rtn("bn_mod_exp_base_2_consttime", "montgomery_inv.c", 166, "BN_is_odd(n)");
}

void bn_mod_exp_base_2_consttime_cold_2()
{
  __assert_rtn("bn_mod_exp_base_2_consttime", "montgomery_inv.c", 171, "n_bits != 0");
}

void bn_mod_exp_base_2_consttime_cold_3()
{
  __assert_rtn("bn_mod_exp_base_2_consttime", "montgomery_inv.c", 172, "p > n_bits");
}

void bn_mod_exp_base_2_consttime_cold_4()
{
  __assert_rtn("bn_mod_exp_base_2_consttime", "montgomery_inv.c", 165, "!BN_is_negative(n)");
}

void bn_mod_exp_base_2_consttime_cold_5()
{
  __assert_rtn("bn_mod_exp_base_2_consttime", "montgomery_inv.c", 164, "!BN_is_zero(n)");
}

void RSA_padding_add_PKCS1_PSS_mgf1_cold_1()
{
  __assert_rtn("RSA_padding_add_PKCS1_PSS_mgf1", "padding.c", 619, "emLen >= 1");
}

void aes_init_key_cold_1(int a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = 136446722;
  v3 = "aes_init_key";
  v4 = 1024;
  v5 = 99;
  v6 = 1024;
  v7 = a1;
  _os_log_error_impl(&dword_1B4F6D000, a2, OS_LOG_TYPE_ERROR, "%{public}s(%d) Unsupported EVP mode: %d", (uint8_t *)&v2, 0x18u);
  OUTLINED_FUNCTION_2_1();
}

void aes_init_key_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) EVP_CIPH_CTR_MODE not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void aes_init_key_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) EVP_CIPH_ECB_MODE not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void aes_init_key_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) EVP_CIPH_ECB_MODE not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void aes_init_key_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) EVP_CIPH_ECB_MODE not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void aes_cipher_cold_1()
{
  __assert_rtn("aes_cbc_cipher", "boringssl_crypto_aes.m", 115, "len == 0 || (in != NULL && out != NULL)");
}

void aead_aes_gcm_seal_scatter_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccgcm_reset failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void aead_aes_gcm_seal_scatter_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccgcm_finalize failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void aead_aes_gcm_seal_scatter_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccgcm_update failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void aead_aes_gcm_seal_scatter_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccgcm_update failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void aead_aes_gcm_seal_scatter_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccgcm_aad failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void aead_aes_gcm_seal_scatter_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccgcm_set_iv failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void aead_aes_gcm_open_gather_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccgcm_finalize failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void aead_aes_gcm_open_gather_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccgcm_update failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void aead_aes_gcm_open_gather_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccgcm_aad failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void EVP_MD_CTX_cleanup_cold_1()
{
  __assert_rtn("EVP_MD_CTX_cleanup", "digest.c", 99, "ctx->pctx == NULL || ctx->pctx_ops != NULL");
}

void EVP_MD_CTX_copy_ex_cold_2()
{
  __assert_rtn("EVP_MD_CTX_copy_ex", "digest.c", 154, "in->digest->ctx_size != 0");
}

void EVP_MD_CTX_copy_ex_cold_3()
{
  __assert_rtn("EVP_MD_CTX_copy_ex", "digest.c", 143, "in->pctx == NULL || in->pctx_ops != NULL");
}

void EVP_DigestInit_ex_cold_1()
{
  __assert_rtn("EVP_DigestInit_ex", "digest.c", 216, "ctx->pctx == NULL || ctx->pctx_ops != NULL");
}

void EVP_DigestInit_ex_cold_2()
{
  __assert_rtn("EVP_DigestInit_ex", "digest.c", 205, "type->ctx_size != 0");
}

void EVP_DigestFinal_ex_cold_1()
{
  __assert_rtn("EVP_DigestFinal_ex", "digest.c", 233, "ctx->digest->md_size <= EVP_MAX_MD_SIZE");
}

void bssl::tls13_client_handshake()
{
  __assert_rtn("do_read_hello_retry_request", "tls13_client.cc", 177, "ssl->s3->have_version");
}

{
  __assert_rtn("do_send_second_client_hello", "tls13_client.cc", 344, "hs->ssl->s3->write_level == ssl_encryption_initial");
}

{
  __assert_rtn("do_read_encrypted_extensions", "tls13_client.cc", 568, "ssl->s3->session_reused");
}

{
  __assert_rtn("do_read_encrypted_extensions", "tls13_client.cc", 572, "ssl->s3->ech_status != ssl_ech_rejected");
}

{
  __assert_rtn("do_send_client_certificate_verify", "tls13_client.cc", 897, "0");
}

void bssl::close_early_data()
{
  __assert_rtn("close_early_data", "tls13_client.cc", 64, "hs->in_early_data");
}

{
  __assert_rtn("close_early_data", "tls13_client.cc", 95, "level == ssl_encryption_handshake");
}

{
  __assert_rtn("close_early_data", "tls13_client.cc", 104, "ssl->s3->write_level == level");
}

void BN_CTX_free_cold_1()
{
  __assert_rtn("BN_CTX_free", "ctx.c", 131, "ctx->used == 0 || ctx->error");
}

void BN_CTX_end_cold_1()
{
  __assert_rtn("BN_STACK_pop", "ctx.c", 231, "st->depth > 0");
}

void bssl::tls13_process_finished()
{
  __assert_rtn("tls13_process_finished", "tls13_both.cc", 455, "ssl->server");
}

void bssl::tls1_get_shared_group()
{
  __assert_rtn("tls1_get_shared_group", "extensions.cc", 327, "ssl->server");
}

void bssl::ssl_add_clienthello_tlsext()
{
  __assert_rtn("ssl_add_clienthello_tlsext", "extensions.cc", 3974, "psk_extension_len == CBB_len(&extensions) - len_before");
}

{
  __assert_rtn("ssl_add_clienthello_tlsext", "extensions.cc", 3870, "out_encoded == nullptr");
}

void bssl::ssl_decrypt_ticket_with_cb()
{
  __assert_rtn("ssl_decrypt_ticket_with_cb", "extensions.cc", 4298, "ticket.size() >= SSL_TICKET_KEY_NAME_LEN + EVP_MAX_IV_LENGTH");
}

void bssl::ssl_decrypt_ticket_with_ticket_keys()
{
  __assert_rtn("ssl_decrypt_ticket_with_ticket_keys", "extensions.cc", 4325, "ticket.size() >= SSL_TICKET_KEY_NAME_LEN + EVP_MAX_IV_LENGTH");
}

void bssl::ext_ri_add_clienthello()
{
  __assert_rtn("ext_ri_add_clienthello", "extensions.cc", 765, "ssl->s3->initial_handshake_complete == (ssl->s3->previous_client_finished_len != 0)");
}

void bssl::ext_ri_parse_serverhello()
{
  __assert_rtn("ext_ri_parse_serverhello", "extensions.cc", 812, "!expected_len || ssl->s3->previous_client_finished_len");
}

{
  __assert_rtn("ext_ri_parse_serverhello", "extensions.cc", 813, "!expected_len || ssl->s3->previous_server_finished_len");
}

{
  __assert_rtn("ext_ri_parse_serverhello", "extensions.cc", 815, "ssl->s3->initial_handshake_complete == (ssl->s3->previous_client_finished_len != 0)");
}

{
  __assert_rtn("ext_ri_parse_serverhello", "extensions.cc", 817, "ssl->s3->initial_handshake_complete == (ssl->s3->previous_server_finished_len != 0)");
}

void bssl::ext_ri_parse_clienthello()
{
  __assert_rtn("ext_ri_parse_clienthello", "extensions.cc", 868, "!ssl->s3->initial_handshake_complete");
}

void bssl::ext_ri_add_serverhello()
{
  __assert_rtn("ext_ri_add_serverhello", "extensions.cc", 902, "!ssl->s3->initial_handshake_complete");
}

void bssl::ext_ticket_parse_serverhello()
{
  __assert_rtn("ext_ticket_parse_serverhello", "extensions.cc", 1048, "(SSL_get_options(ssl) & SSL_OP_NO_TICKET) == 0");
}

void bssl::ext_ticket_add_serverhello()
{
  __assert_rtn("ext_ticket_add_serverhello", "extensions.cc", 1064, "(SSL_get_options(hs->ssl) & SSL_OP_NO_TICKET) == 0");
}

void bssl::ext_alpn_parse_serverhello()
{
  __assert_rtn("ext_alpn_parse_serverhello", "extensions.cc", 1470, "!hs->config->alpn_client_proto_list.empty()");
}

{
  __assert_rtn("ext_alpn_parse_serverhello", "extensions.cc", 1469, "!ssl->s3->initial_handshake_complete");
}

void bssl::ext_npn_parse_serverhello()
{
  __assert_rtn("ext_npn_parse_serverhello", "extensions.cc", 1241, "ssl->ctx->next_proto_select_cb != NULL");
}

{
  __assert_rtn("ext_npn_parse_serverhello", "extensions.cc", 1240, "!SSL_is_dtls(ssl)");
}

{
  __assert_rtn("ext_npn_parse_serverhello", "extensions.cc", 1239, "!ssl->s3->initial_handshake_complete");
}

void bssl::ext_sct_parse_serverhello()
{
  __assert_rtn("ext_sct_parse_serverhello", "extensions.cc", 1364, "hs->config->signed_cert_timestamps_enabled");
}

void bssl::ext_channel_id_parse_serverhello()
{
  __assert_rtn("ext_channel_id_parse_serverhello", "extensions.cc", 1690, "hs->config->channel_id_private");
}

{
  __assert_rtn("ext_channel_id_parse_serverhello", "extensions.cc", 1689, "!SSL_is_dtls(hs->ssl)");
}

void bssl::ext_srtp_parse_serverhello()
{
  __assert_rtn("ext_srtp_parse_serverhello", "extensions.cc", 1778, "SSL_is_dtls(ssl)");
}

void bssl::ext_srtp_add_serverhello()
{
  __assert_rtn("ext_srtp_add_serverhello", "extensions.cc", 1858, "SSL_is_dtls(ssl)");
}

void bssl::ext_key_share_add_clienthello()
{
  __assert_rtn("ext_key_share_add_clienthello", "extensions.cc", 2369, "!hs->key_share_bytes.empty()");
}

void bssl::ext_early_data_add_clienthello()
{
  __assert_rtn("ext_early_data_add_clienthello", "extensions.cc", 2199, "ssl->s3->early_data_reason != ssl_early_data_unknown");
}

void bssl::ext_early_data_parse_serverhello()
{
  __assert_rtn("ext_early_data_parse_serverhello", "extensions.cc", 2232, "ssl->s3->early_data_reason != ssl_early_data_unknown");
}

{
  __assert_rtn("ext_early_data_parse_serverhello", "extensions.cc", 2240, "!ssl->s3->used_hello_retry_request");
}

void bssl::ext_alps_parse_serverhello()
{
  __assert_rtn("ext_alps_parse_serverhello", "extensions.cc", 3023, "!hs->config->alpn_client_proto_list.empty()");
}

{
  __assert_rtn("ext_alps_parse_serverhello", "extensions.cc", 3024, "!hs->config->alps_configs.empty()");
}

{
  __assert_rtn("ext_alps_parse_serverhello", "extensions.cc", 3022, "!ssl->s3->initial_handshake_complete");
}

void bssl::ext_quic_transport_params_add_clienthello_impl()
{
  __assert_rtn("ext_quic_transport_params_add_clienthello_impl", "extensions.cc", 2653, "hs->min_version > TLS1_2_VERSION");
}

void bssl::ext_quic_transport_params_parse_serverhello_impl()
{
  __assert_rtn("ext_quic_transport_params_parse_serverhello_impl", "extensions.cc", 2706, "ssl->quic_method != nullptr");
}

{
  __assert_rtn("ext_quic_transport_params_parse_serverhello_impl", "extensions.cc", 2708, "used_legacy_codepoint == hs->config->quic_use_legacy_codepoint");
}

{
  __assert_rtn("ext_quic_transport_params_parse_serverhello_impl", "extensions.cc", 2707, "ssl_protocol_version(ssl) == TLS1_3_VERSION");
}

void bssl::ext_quic_transport_params_parse_clienthello_impl()
{
  __assert_rtn("ext_quic_transport_params_parse_clienthello_impl", "extensions.cc", 2758, "ssl_protocol_version(ssl) == TLS1_3_VERSION");
}

void bssl::ext_quic_transport_params_add_serverhello_impl()
{
  __assert_rtn("ext_quic_transport_params_add_serverhello_impl", "extensions.cc", 2786, "hs->ssl->quic_method != nullptr");
}

void bssl::internal::MutexLockBase<&(CRYPTO_MUTEX_lock_read),&(CRYPTO_MUTEX_unlock_read)>::MutexLockBase()
{
  __assert_rtn("MutexLockBase", "internal.h", 672, "mu_ != nullptr");
}

void bssl::tls_add_message()
{
  __assert_rtn("tls_add_message", "s3_both.cc", 220, "!chunk.empty()");
}

void bssl::add_record_to_flight()
{
  __assert_rtn("add_record_to_flight", "s3_both.cc", 142, "ssl->s3->pending_flight_offset == 0");
}

{
  __assert_rtn("add_record_to_flight", "s3_both.cc", 140, "!ssl->s3->pending_hs_data");
}

void bssl::read_v2_client_hello()
{
  __assert_rtn("read_v2_client_hello", "s3_both.cc", 358, "in.size() >= SSL3_RT_HEADER_LENGTH");
}

{
  __assert_rtn("read_v2_client_hello", "s3_both.cc", 407, "msg_type == SSL2_MT_CLIENT_HELLO");
}

void bssl::ssl_tls13_cipher_meets_policy()
{
  __assert_rtn("ssl_tls13_cipher_meets_policy", "s3_both.cc", 700, "false");
}

void bn_mul_impl_cold_1()
{
  __assert_rtn("bn_mul_impl", "mul.c", 477, "al >= j && bl >= j");
}

void bn_mul_impl_cold_2()
{
  __assert_rtn("bn_mul_impl", "mul.c", 465, "j <= al || j <= bl");
}

void bn_sqr_recursive_cold_1()
{
  __assert_rtn("bn_sqr_recursive", "mul.c", 593, "n2 != 0 && (n2 & (n2 - 1)) == 0");
}

void bn_sqr_recursive_cold_2()
{
  __assert_rtn("bn_sqr_recursive", "mul.c", 644, "c == 0");
}

void bn_sub_part_words_cold_1()
{
  __assert_rtn("bn_sub_part_words", "mul.c", 131, "cl >= 0");
}

void bn_mul_part_recursive_cold_1()
{
  __assert_rtn("bn_mul_part_recursive", "mul.c", 316, "0 <= tna && tna < n");
}

void bn_mul_part_recursive_cold_2()
{
  __assert_rtn("bn_mul_part_recursive", "mul.c", 317, "0 <= tnb && tnb < n");
}

void bn_mul_part_recursive_cold_3()
{
  __assert_rtn("bn_mul_part_recursive", "mul.c", 318, "-1 <= tna - tnb && tna - tnb <= 1");
}

void bn_mul_part_recursive_cold_4()
{
  __assert_rtn("bn_mul_part_recursive", "mul.c", 413, "c == 0");
}

void bn_mul_part_recursive_cold_5()
{
  __assert_rtn("bn_mul_part_recursive", "mul.c", 314, "n != 0 && (n & (n - 1)) == 0");
}

void bn_mul_recursive_cold_1()
{
  __assert_rtn("bn_mul_recursive", "mul.c", 215, "-BN_MUL_RECURSIVE_SIZE_NORMAL/2 <= dna && dna <= 0");
}

void bn_mul_recursive_cold_2()
{
  __assert_rtn("bn_mul_recursive", "mul.c", 216, "-BN_MUL_RECURSIVE_SIZE_NORMAL/2 <= dnb && dnb <= 0");
}

void bn_mul_recursive_cold_3()
{
  __assert_rtn("bn_mul_recursive", "mul.c", 299, "c == 0");
}

void bn_mul_recursive_cold_4()
{
  __assert_rtn("bn_mul_recursive", "mul.c", 213, "n2 != 0 && (n2 & (n2 - 1)) == 0");
}

void boringssl_session_state_create_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) Failed to allocate a boringssl session state object.", v2, v3, v4, v5, 2u);
}

void boringssl_session_state_create_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) SSL_SESSION_to_bytes failed", v2, v3, v4, v5, 2u);
}

void boringssl_session_state_copy_serialized_session_state_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x2Cu);
}

void boringssl_session_state_copy_serialized_session_state_cold_2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x36u);
}

void boringssl_session_state_copy_serialized_session_state_cold_3()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x40u);
}

void boringssl_session_state_copy_serialized_session_state_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  _WORD v2[10];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)v2 = 136446722;
  OUTLINED_FUNCTION_1_0();
  *(_DWORD *)&v2[7] = 86;
  v2[9] = 2048;
  v3 = v0;
  _os_log_error_impl(&dword_1B4F6D000, v1, OS_LOG_TYPE_ERROR, "%{public}s(%d) boringssl_memory_malloc(%zu) failed", (uint8_t *)v2, 0x1Cu);
}

void boringssl_session_state_create_from_dispatch_data_cold_1(uint64_t a1, NSObject *a2)
{
  char *v2;
  id WeakRetained;
  void *v5;
  id v6;
  uint64_t v7;
  _WORD v8[10];
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
  if (WeakRetained)
  {
    v2 = (char *)OUTLINED_FUNCTION_1_1();
    v5 = v2 + 391;
  }
  else
  {
    v5 = &unk_1B50022E3;
  }
  v6 = OUTLINED_FUNCTION_1_1();
  *(_DWORD *)v8 = 136446978;
  OUTLINED_FUNCTION_1_0();
  *(_DWORD *)&v8[7] = 194;
  v8[9] = 2082;
  v9 = v5;
  v10 = 2048;
  v11 = v7;
  _os_log_error_impl(&dword_1B4F6D000, a2, OS_LOG_TYPE_ERROR, "%{public}s(%d) %{public}s[%p] Failed to extract the SSL_SESSION bytes.", (uint8_t *)v8, 0x26u);

  if (WeakRetained)
}

void bssl::ssl_handle_open_record()
{
  __assert_rtn("ssl_handle_open_record", "ssl_buffer.cc", 270, "0");
}

void bssl::tls_write_app_data()
{
  __assert_rtn("tls_write_app_data", "s3_pkt.cc", 135, "!ssl->s3->aead_write_ctx->is_null_cipher()");
}

{
  __assert_rtn("tls_write_app_data", "s3_pkt.cc", 186, "bytes_written <= to_write");
}

{
  __assert_rtn("tls_write_app_data", "s3_pkt.cc", 134, "ssl_can_write(ssl)");
}

void bssl::ssl_send_alert_impl()
{
  __assert_rtn("ssl_send_alert_impl", "s3_pkt.cc", 420, "desc != SSL_AD_CLOSE_NOTIFY");
}

{
  __assert_rtn("ssl_send_alert_impl", "s3_pkt.cc", 419, "level == SSL3_AL_FATAL");
}

void bssl::tls_dispatch_alert()
{
  __assert_rtn("tls_dispatch_alert", "s3_pkt.cc", 451, "bytes_written == 2");
}

void bssl::`anonymous namespace'::ECKeyShare::Offer()
{
  __assert_rtn("Offer", "ssl_key_share.cc", 47, "!private_key_");
}

void bssl::`anonymous namespace'::ECKeyShare::Finish()
{
  __assert_rtn("Finish", "ssl_key_share.cc", 71, "group_");
}

{
  __assert_rtn("Finish", "ssl_key_share.cc", 72, "private_key_");
}

void bssl::`anonymous namespace'::ECKeyShare::SerializePrivateKey()
{
  __assert_rtn("SerializePrivateKey", "ssl_key_share.cc", 111, "group_");
}

{
  __assert_rtn("SerializePrivateKey", "ssl_key_share.cc", 112, "private_key_");
}

void bssl::`anonymous namespace'::ECKeyShare::DeserializePrivateKey()
{
  __assert_rtn("DeserializePrivateKey", "ssl_key_share.cc", 119, "!private_key_");
}

#error "1B4FFC17C: call analysis failed (funcsize=45)"

#error "1B4FFC248: call analysis failed (funcsize=45)"

#error "1B4FFC314: call analysis failed (funcsize=45)"

#error "1B4FFC3E8: call analysis failed (funcsize=47)"

#error "1B4FFC4B4: call analysis failed (funcsize=45)"

#error "1B4FFC580: call analysis failed (funcsize=45)"

#error "1B4FFC64C: call analysis failed (funcsize=45)"

void boringssl_helper_copy_identity_certificate_chain_from_identity_array_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) CFArrayCreateMutable failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_helper_copy_identity_certificate_chain_from_identity_array_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) The leaf of the certificate chain is not a SecIdentityRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_helper_copy_identity_certificate_chain_from_identity_array_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) Failed to extract the certificate from the leaf (first element of the certificate chain)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_helper_copy_identity_certificate_chain_from_identity_array_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
}

void boringssl_helper_copy_leaf_private_key_from_identity_array_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) The leaf of the certificate chain is not a SecIdentityRef", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_helper_copy_leaf_private_key_from_identity_array_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) Failed to extract the private key from the leaf certificate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_helper_copy_leaf_private_key_from_identity_array_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_2_1();
}

void bn_reduce_once_cold_1()
{
  __assert_rtn("bn_reduce_once", "div.c", 415, "r != a");
}

void bn_reduce_once_cold_2()
{
  __assert_rtn("bn_reduce_once", "div.c", 428, "carry == 0 || carry == (BN_ULONG)-1");
}

void bn_reduce_once_in_place_cold_1()
{
  __assert_rtn("bn_reduce_once_in_place", "div.c", 437, "carry == 0 || carry == (BN_ULONG)-1");
}

void bn_resized_from_ctx_cold_1()
{
  __assert_rtn("bn_resized_from_ctx", "div.c", 568, "bn_fits_in_words(bn, width)");
}

void ECDH_compute_key_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl_memory_malloc failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void ECDH_compute_key_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) point2o_ECPublicKey failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void ECDH_compute_key_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) X9.62 serialization of an ECDH public key failed on calculating size.", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void ECDH_compute_key_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) EC_POINT_point2oct failed: got %i, expected >0", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void ECDH_compute_key_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) get_cp_for_pub_size failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void ECDH_compute_key_cold_6()
{
  uint64_t v0;
  os_log_t v1;
  _WORD v2[10];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)v2 = 136446722;
  OUTLINED_FUNCTION_1_0();
  *(_DWORD *)&v2[7] = 16;
  v2[9] = 2048;
  v3 = v0;
  _os_log_error_impl(&dword_1B4F6D000, v1, OS_LOG_TYPE_ERROR, "%{public}s(%d) Key size %zui is not supported for ECDH.", (uint8_t *)v2, 0x1Cu);
}

void ECDH_compute_key_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl_memory_malloc failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void ECDH_compute_key_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccec_import_pub failed: got %i, expected 0", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void bn_rand_secret_range_cold_1()
{
  __assert_rtn("bn_rand_secret_range", "random.c", 313, "words > 0");
}

void bn_rand_secret_range_cold_2()
{
  __assert_rtn("bn_rand_secret_range", "random.c", 314, "mask != 0");
}

void bn_rand_secret_range_cold_3()
{
  __assert_rtn("bn_rand_secret_range", "random.c", 336, "bn_in_range_words(r->d, min_inclusive, max_exclusive->d, words)");
}

void ec_compute_wNAF_cold_1()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 91, "0 < w && w <= 7");
}

void ec_compute_wNAF_cold_2()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 92, "bits != 0");
}

void ec_compute_wNAF_cold_3()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 147, "window_val == 0");
}

void ec_compute_wNAF_cold_4()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 99, "0 <= window_val && window_val <= next_bit");
}

void ec_compute_wNAF_cold_5()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 143, "window_val <= next_bit");
}

void ec_compute_wNAF_cold_6()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 129, "-bit < digit && digit < bit");
}

void ec_compute_wNAF_cold_7()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 132, "digit & 1");
}

void ec_compute_wNAF_cold_8()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 128, "window_val == 0 || window_val == next_bit || window_val == bit");
}

void ec_compute_wNAF_cold_9()
{
  __assert_rtn("ec_compute_wNAF", "wnaf.c", 102, "0 < window_val && window_val < next_bit");
}

void ec_GFp_mont_mul_public_batch_cold_1()
{
  __assert_rtn("ec_GFp_mont_mul_public_batch", "wnaf.c", 216, "wNAF_len <= OPENSSL_ARRAY_SIZE(g_wNAF)");
}

void EVP_tls_cbc_copy_mac_cold_1()
{
  __assert_rtn("EVP_tls_cbc_copy_mac", "tls_cbc.c", 134, "orig_len >= in_len");
}

void EVP_tls_cbc_copy_mac_cold_2()
{
  __assert_rtn("EVP_tls_cbc_copy_mac", "tls_cbc.c", 135, "in_len >= md_size");
}

void EVP_tls_cbc_copy_mac_cold_3()
{
  __assert_rtn("EVP_tls_cbc_copy_mac", "tls_cbc.c", 136, "md_size <= EVP_MAX_MD_SIZE");
}

void EVP_tls_cbc_copy_mac_cold_4()
{
  __assert_rtn("EVP_tls_cbc_copy_mac", "tls_cbc.c", 137, "md_size > 0");
}

void EVP_tls_cbc_digest_record_cold_1()
{
  __assert_rtn("EVP_tls_cbc_digest_record", "tls_cbc.c", 285, "0");
}

void EVP_tls_cbc_digest_record_cold_2()
{
  __assert_rtn("EVP_tls_cbc_digest_record", "tls_cbc.c", 317, "0");
}

void EVP_tls_cbc_digest_record_cold_3()
{
  __assert_rtn("EVP_tls_cbc_digest_record", "tls_cbc.c", 391, "mac_secret_length <= sizeof(hmac_pad)");
}

void EVP_tls_cbc_digest_record_cold_4()
{
  __assert_rtn("EVP_tls_cbc_digest_record", "tls_cbc.c", 324, "md_block_size == (1u << md_block_shift)");
}

void SSL_get_extms_support_cold_1()
{
  __assert_rtn("SSL_get_extms_support", "ssl_lib.cc", 1971, "0");
}

void SSL_renegotiate_cold_1()
{
  __assert_rtn("SSL_renegotiate", "ssl_lib.cc", 2021, "!SSL_can_release_private_key(ssl)");
}

void bssl::ssl_can_renegotiate()
{
  __assert_rtn("ssl_can_renegotiate", "ssl_lib.cc", 447, "0");
}

void SSL_get_ciphers_cold_1()
{
  __assert_rtn("SSL_get_ciphers", "ssl_lib.cc", 2264, "ssl->config");
}

void SSL_get0_alpn_selected_cold_1()
{
  __assert_rtn("SSL_get0_alpn_selected", "ssl_lib.cc", 2559, "protocol.size() < UINT_MAX");
}

void SSL_CTX_add_cert_compression_alg_cold_1()
{
  __assert_rtn("SSL_CTX_add_cert_compression_alg", "ssl_lib.cc", 2601, "compress != nullptr || decompress != nullptr");
}

void SSL_set_shutdown_cold_1()
{
  __assert_rtn("SSL_set_shutdown", "ssl_lib.cc", 2756, "(SSL_get_shutdown(ssl) & mode) == SSL_get_shutdown(ssl)");
}

void SSL_get_psk_identity_hint_cold_1()
{
  __assert_rtn("SSL_get_psk_identity_hint", "ssl_lib.cc", 2955, "ssl->config");
}

void boringssl_ecdsa_get_cc_curve_parameters_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) Elliptic curve algorithm with NID %d is not supported", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_sign_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ECDSA_sign not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_do_sign_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ECDSA_do_sign not implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_verify_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) i2o_ECPublicKey failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_verify_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl_memory_malloc failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_verify_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccec_verify failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_verify_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccec_import_pub failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_size_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ecdsa_get_cc_curve_parameters(%d) failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_do_verify_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_0(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ecdsa_get_cc_curve_parameters(%d) failed", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_do_verify_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl_memory_malloc failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_do_verify_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) i2o_ECPublicKey failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_do_verify_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl_memory_malloc failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_do_verify_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) BN_bn2bin_padded failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_do_verify_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccec_verify_composite failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ECDSA_do_verify_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) ccec_import_pub failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void DTLSv1_get_timeout_cold_1()
{
  __assert_rtn("DTLSv1_get_timeout", "d1_lib.cc", 238, "0");
}

void HRSS_poly3_invert_cold_1()
{
  __assert_rtn("HRSS_poly3_invert", "hrss.c", 892, "delta == 0");
}

void HRSS_generate_key_cold_1()
{
  __assert_rtn("poly_invert_mod2", "hrss.c", 1590, "f.v[0] & 1");
}

void HRSS_generate_key_cold_2()
{
  __assert_rtn("poly_invert_mod2", "hrss.c", 1589, "delta == 0");
}

void HRSS_generate_key_cold_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_0_5("align_pointer", "internal.h", a3, "((uintptr_t)ptr & (alignment - 1)) == 0");
}

void poly_marshal_mod3_cold_1()
{
  __assert_rtn("poly_marshal_mod3", "hrss.c", 1731, "coeffs[N-1] == 0");
}

void poly_assert_normalized_cold_1()
{
  __assert_rtn("poly_assert_normalized", "hrss.c", 940, "x->v[N + 2] == 0");
}

void poly_assert_normalized_cold_2()
{
  __assert_rtn("poly_assert_normalized", "hrss.c", 939, "x->v[N + 1] == 0");
}

void poly_assert_normalized_cold_3()
{
  __assert_rtn("poly_assert_normalized", "hrss.c", 938, "x->v[N] == 0");
}

void dtls1_set_read_state()
{
  __assert_rtn("dtls1_set_read_state", "dtls_method.cc", 83, "secret_for_quic.empty()");
}

void dtls1_set_write_state()
{
  __assert_rtn("dtls1_set_write_state", "dtls_method.cc", 104, "secret_for_quic.empty()");
}

void boringssl_metrics_create_connection_event_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) xpc_dictionary_create failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_metrics_create_connection_failure_event_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) xpc_dictionary_create failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_metrics_create_ech_event_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) xpc_dictionary_create failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void boringssl_metrics_log_event_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) xpc_copy failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void __boringssl_metrics_log_metric_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) Failed to log metrics", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_1();
}

void ec_bignum_to_felem_cold_1()
{
  __assert_rtn("ec_bignum_to_felem", "felem.c", 29, "sizeof(bytes) >= len");
}

void ec_felem_neg_cold_1()
{
  __assert_rtn("ec_felem_neg", "felem.c", 62, "borrow == 0");
}

void sk_find_cold_1()
{
  __assert_rtn("sk_find", "stack.c", 296, "lo <= mid && mid < hi");
}

void sk_find_cold_2()
{
  __assert_rtn("sk_find", "stack.c", 319, "lo == hi");
}

void sk_find_cold_3()
{
  __assert_rtn("sk_find", "stack.c", 314, "mid + 1 < hi");
}

void lh_maybe_resize_cold_1()
{
  __assert_rtn("lh_maybe_resize", "lhash.c", 247, "lh->num_buckets >= kMinNumBuckets");
}

void get_error_values_cold_1()
{
  __assert_rtn("get_error_values", "err.c", 293, "!top");
}

void get_error_values_cold_2()
{
  __assert_rtn("get_error_values", "err.c", 243, "!inc");
}

void print_errors_to_file_cold_1()
{
  __assert_rtn("print_errors_to_file", "err.c", 630, "msg[msg_len] == '\\0'");
}

void ERR_add_error_data_cold_1()
{
  __assert_rtn("err_add_error_vdata", "err.c", 721, "0");
}

void ERR_save_state_cold_1()
{
  __assert_rtn("ERR_save_state", "err.c", 848, "num_errors < ERR_NUM_ERRORS");
}

void boringssl_context_state_create_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136446466;
  v2 = "boringssl_context_state_create";
  v3 = 1024;
  v4 = 35;
  _os_log_error_impl(&dword_1B4F6D000, log, OS_LOG_TYPE_ERROR, "%{public}s(%d) Failed to allocate a boringssl context state object.", (uint8_t *)&v1, 0x12u);
}

void BIO_printf_cold_1()
{
  __assert_rtn("BIO_printf", "printf.c", 91, "out_len == requested_len");
}

void cbs_convert_ber_cold_1()
{
  __assert_rtn("cbs_convert_ber", "ber.c", 115, "!(string_tag & CBS_ASN1_CONSTRUCTED)");
}

void CBS_get_asn1_implicit_string_cold_1()
{
  __assert_rtn("CBS_get_asn1_implicit_string", "ber.c", 228, "is_string_type(inner_tag)");
}

void CBS_get_asn1_implicit_string_cold_2()
{
  __assert_rtn("CBS_get_asn1_implicit_string", "ber.c", 227, "!(inner_tag & CBS_ASN1_CONSTRUCTED)");
}

void CBS_get_asn1_implicit_string_cold_3()
{
  __assert_rtn("CBS_get_asn1_implicit_string", "ber.c", 226, "!(outer_tag & CBS_ASN1_CONSTRUCTED)");
}

void CBB_flush_cold_1()
{
  __assert_rtn("CBB_flush", "cbb.c", 175, "cbb->child->is_child");
}

void CBB_flush_cold_2()
{
  __assert_rtn("CBB_flush", "cbb.c", 195, "child->pending_len_len == 1");
}

void CBB_flush_cold_3()
{
  __assert_rtn("CBB_flush", "cbb.c", 177, "child->base == base");
}

void CBB_data_cold_1()
{
  __assert_rtn("CBB_data", "cbb.c", 252, "cbb->child == NULL");
}

void CBB_len_cold_1()
{
  __assert_rtn("CBB_len", "cbb.c", 264, "cbb->u.child.offset + cbb->u.child.pending_len_len <= cbb->u.child.base->len");
}

void CBB_len_cold_2()
{
  __assert_rtn("CBB_len", "cbb.c", 261, "cbb->child == NULL");
}

void cbb_add_child_cold_1()
{
  __assert_rtn("cbb_add_child", "cbb.c", 274, "!is_asn1 || len_len == 1");
}

void CBB_discard_child_cold_1()
{
  __assert_rtn("CBB_discard_child", "cbb.c", 468, "cbb->child->is_child");
}

void cbs_get_any_asn1_element_cold_1()
{
  __assert_rtn("cbs_get_any_asn1_element", "cbs.c", 334, "out_indefinite == NULL");
}

void cbs_get_any_asn1_element_cold_2()
{
  __assert_rtn("cbs_get_any_asn1_element", "cbs.c", 333, "out_ber_found == NULL");
}

void cbs_get_asn1_cold_1()
{
  __assert_rtn("cbs_get_asn1", "cbs.c", 467, "0");
}

void CBS_get_optional_asn1_octet_string_cold_1()
{
  __assert_rtn("CBS_get_optional_asn1_octet_string", "cbs.c", 572, "out");
}

void ec_group_set_generator_cold_1()
{
  __assert_rtn("ec_group_set_generator", "ec.c", 338, "ec_felem_equal(group, &group->one, &group->generator->raw.Z)");
}

void ec_group_set_generator_cold_2()
{
  __assert_rtn("ec_group_set_generator", "ec.c", 344, "!is_zero");
}

void EC_GROUP_get0_order_cold_1()
{
  __assert_rtn("EC_GROUP_get0_order", "ec.c", 617, "!BN_is_zero(&group->order)");
}

void ec_point_set_affine_coordinates_cold_1()
{
  __assert_rtn("ec_point_set_affine_coordinates", "ec.c", 846, "ec_felem_equal(group, &group->one, &group->generator->raw.Z)");
}

void ec_get_x_coordinate_as_bytes_cold_1()
{
  __assert_rtn("ec_get_x_coordinate_as_bytes", "ec.c", 1206, "len <= EC_MAX_BYTES");
}

#error "1B4FFE3E4: call analysis failed (funcsize=43)"

#error "1B4FFE4A4: call analysis failed (funcsize=43)"

#error "1B4FFE564: call analysis failed (funcsize=43)"

#error "1B4FFE624: call analysis failed (funcsize=43)"

void boringssl_context_set_key_exchange_groups_from_list_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) No supported key exchange groups from the provided selection", v2, v3, v4, v5, v6);
}

#error "1B4FFE75C: call analysis failed (funcsize=43)"

#error "1B4FFE81C: call analysis failed (funcsize=43)"

#error "1B4FFE8DC: call analysis failed (funcsize=43)"

#error "1B4FFE99C: call analysis failed (funcsize=43)"

void boringssl_context_zlib_uncompress_data_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) boringssl_memory_malloc failed", v2, v3, v4, v5, v6);
}

#error "1B4FFEAF0: call analysis failed (funcsize=50)"

void boringssl_context_keylog_handler_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, int a10, int a11, int a12, __int128 a13, int a14, __int16 a15, __int16 a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27)
{
  NSObject *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id *v32;
  id v33;
  void *v34;
  id v35;

  OUTLINED_FUNCTION_18_0();
  a26 = v30;
  a27 = v31;
  OUTLINED_FUNCTION_14_1();
  v33 = OUTLINED_FUNCTION_15_1(v32);
  if (v33)
  {
    v28 = (char *)OUTLINED_FUNCTION_12_2();
    v34 = v28 + 391;
  }
  else
  {
    v34 = &unk_1B50022E3;
  }
  v35 = OUTLINED_FUNCTION_12_2();
  a9 = 136447235;
  OUTLINED_FUNCTION_1_0();
  *(int *)((char *)&a12 + 2) = 838;
  WORD1(a13) = 2082;
  *(_QWORD *)((char *)&a13 + 4) = v34;
  OUTLINED_FUNCTION_2();
  a16 = 2085;
  a17 = v29;
  _os_log_debug_impl(&dword_1B4F6D000, v27, OS_LOG_TYPE_DEBUG, "%{public}s(%d) %{public}s[%p] %{sensitive}s", (uint8_t *)&a9, 0x30u);

  if (v33)
  OUTLINED_FUNCTION_7_1();
}

#error "1B4FFECA4: call analysis failed (funcsize=43)"

#error "1B4FFED64: call analysis failed (funcsize=43)"

#error "1B4FFEE48: call analysis failed (funcsize=52)"

#error "1B4FFEF08: call analysis failed (funcsize=43)"

#error "1B4FFEFF4: call analysis failed (funcsize=54)"

#error "1B4FFF0E0: call analysis failed (funcsize=54)"

#error "1B4FFF1A0: call analysis failed (funcsize=43)"

#error "1B4FFF260: call analysis failed (funcsize=43)"

#error "1B4FFF320: call analysis failed (funcsize=43)"

#error "1B4FFF3E0: call analysis failed (funcsize=43)"

#error "1B4FFF4A0: call analysis failed (funcsize=43)"

#error "1B4FFF560: call analysis failed (funcsize=43)"

#error "1B4FFF62C: call analysis failed (funcsize=46)"

#error "1B4FFF6EC: call analysis failed (funcsize=43)"

#error "1B4FFF7C0: call analysis failed (funcsize=48)"

#error "1B4FFF898: call analysis failed (funcsize=49)"

#error "1B4FFF958: call analysis failed (funcsize=43)"

#error "1B4FFFA18: call analysis failed (funcsize=43)"

#error "1B4FFFAD8: call analysis failed (funcsize=43)"

#error "1B4FFFB98: call analysis failed (funcsize=43)"

void boringssl_context_message_handler_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24)
{
  id v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  id *v29;
  id v30;
  id v31;

  OUTLINED_FUNCTION_18_0();
  a23 = v25;
  a24 = v26;
  v28 = v27;
  v30 = OUTLINED_FUNCTION_15_1(v29);
  if (v30)
    v24 = OUTLINED_FUNCTION_12_2();
  v31 = OUTLINED_FUNCTION_12_2();
  a9 = 136447234;
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_17_1();
  _os_log_debug_impl(&dword_1B4F6D000, v28, OS_LOG_TYPE_DEBUG, "%{public}s(%d) %{public}s[%p] Skipping content type %d", (uint8_t *)&a9, 0x2Cu);

  if (v30)
  OUTLINED_FUNCTION_7_1();
}

#error "1B4FFFD34: call analysis failed (funcsize=43)"

#error "1B4FFFE04: call analysis failed (funcsize=47)"

#error "1B4FFFEE4: call analysis failed (funcsize=51)"

void fe_tobytes_cold_1()
{
  __assert_rtn("fe_tobytes", "curve25519.c", 167, "f->v[_assert_fe_i] <= UINT64_C(0x8cccccccccccc)");
}

void fe_sq_tt_cold_1()
{
  __assert_rtn("fe_sq_tt", "curve25519.c", 255, "f->v[_assert_fe_i] <= UINT64_C(0x1a666666666664)");
}

void fe_sq_tt_cold_2()
{
  __assert_rtn("fe_sq_tt", "curve25519.c", 257, "h->v[_assert_fe_i] <= UINT64_C(0x8cccccccccccc)");
}

void fe_sub_cold_1()
{
  __assert_rtn("fe_sub", "curve25519.c", 203, "f->v[_assert_fe_i] <= UINT64_C(0x8cccccccccccc)");
}

void fe_sub_cold_2()
{
  __assert_rtn("fe_sub", "curve25519.c", 204, "g->v[_assert_fe_i] <= UINT64_C(0x8cccccccccccc)");
}

void fe_sub_cold_3()
{
  __assert_rtn("fe_sub", "curve25519.c", 206, "h->v[_assert_fe_i] <= UINT64_C(0x1a666666666664)");
}

void fe_carry_cold_1()
{
  __assert_rtn("fe_carry", "curve25519.c", 210, "f->v[_assert_fe_i] <= UINT64_C(0x1a666666666664)");
}

void fe_carry_cold_2()
{
  __assert_rtn("fe_carry", "curve25519.c", 212, "h->v[_assert_fe_i] <= UINT64_C(0x8cccccccccccc)");
}

void fe_add_cold_1()
{
  __assert_rtn("fe_add", "curve25519.c", 194, "f->v[_assert_fe_i] <= UINT64_C(0x8cccccccccccc)");
}

void fe_add_cold_2()
{
  __assert_rtn("fe_add", "curve25519.c", 195, "g->v[_assert_fe_i] <= UINT64_C(0x8cccccccccccc)");
}

void fe_add_cold_3()
{
  __assert_rtn("fe_add", "curve25519.c", 197, "h->v[_assert_fe_i] <= UINT64_C(0x1a666666666664)");
}

void fe_neg_cold_1()
{
  __assert_rtn("fe_neg", "curve25519.c", 282, "f->v[_assert_fe_i] <= UINT64_C(0x8cccccccccccc)");
}

void fe_neg_cold_2()
{
  __assert_rtn("fe_neg", "curve25519.c", 284, "h->v[_assert_fe_i] <= UINT64_C(0x1a666666666664)");
}

void fe_frombytes_strict_cold_1()
{
  __assert_rtn("fe_frombytes_strict", "curve25519.c", 154, "(s[31] & 0x80) == 0");
}

void fe_frombytes_strict_cold_2()
{
  __assert_rtn("fe_frombytes_strict", "curve25519.c", 156, "h->v[_assert_fe_i] <= UINT64_C(0x8cccccccccccc)");
}

void X25519_cold_1()
{
  __assert_rtn("fe_mul121666", "curve25519.c", 275, "f->v[_assert_fe_i] <= UINT64_C(0x1a666666666664)");
}

void X25519_cold_2()
{
  __assert_rtn("fe_mul121666", "curve25519.c", 277, "h->v[_assert_fe_i] <= UINT64_C(0x8cccccccccccc)");
}

void fe_mul_impl_cold_1()
{
  __assert_rtn("fe_mul_impl", "curve25519.c", 218, "in1[_assert_fe_i] <= UINT64_C(0x1a666666666664)");
}

void fe_mul_impl_cold_2()
{
  __assert_rtn("fe_mul_impl", "curve25519.c", 219, "in2[_assert_fe_i] <= UINT64_C(0x1a666666666664)");
}

void fe_mul_impl_cold_3()
{
  __assert_rtn("fe_mul_impl", "curve25519.c", 221, "out[_assert_fe_i] <= UINT64_C(0x8cccccccccccc)");
}

void fe_sq_tl_cold_1()
{
  __assert_rtn("fe_sq_tl", "curve25519.c", 249, "f->v[_assert_fe_i] <= UINT64_C(0x1a666666666664)");
}

void fe_sq_tl_cold_2()
{
  __assert_rtn("fe_sq_tl", "curve25519.c", 251, "h->v[_assert_fe_i] <= UINT64_C(0x8cccccccccccc)");
}

void bn_big_endian_to_words_cold_1()
{
  __assert_rtn("bn_big_endian_to_words", "bytes.c", 85, "in_len == 0");
}

void BN_bin2bn_cold_1()
{
  __assert_rtn("BN_bin2bn", "bytes.c", 111, "num_words <= INT_MAX");
}

void bn_words_to_big_endian_cold_1()
{
  __assert_rtn("bn_words_to_big_endian", "bytes.c", 180, "fits_in_bytes(in, in_len, out_len)");
}

void hpke_nonce_cold_1()
{
  __assert_rtn("hpke_nonce", "hpke.c", 622, "nonce_len >= 8");
}

void bssl::ssl_session_protocol_version()
{
  __assert_rtn("ssl_session_protocol_version", "ssl_session.cc", 343, "0");
}

void bssl::ssl_get_prev_session()
{
  __assert_rtn("ssl_get_prev_session", "ssl_session.cc", 722, "hs->ssl->server");
}

void SSL_get_session_cold_1()
{
  __assert_rtn("SSL_get_session", "ssl_session.cc", 1219, "hs != nullptr");
}

void SSL_get_session_cold_2()
{
  __assert_rtn("SSL_get_session", "ssl_session.cc", 1220, "!ssl->s3->initial_handshake_complete");
}

void bssl::ssl_server_handshake()
{
  __assert_rtn("negotiate_version", "handshake_server.cc", 204, "!ssl->s3->have_version");
}

{
  __assert_rtn("do_select_certificate", "handshake_server.cc", 816, "ssl->s3->ech_status != ssl_ech_accepted");
}

{
  __assert_rtn("do_select_parameters", "handshake_server.cc", 867, "hs->session_id_len <= sizeof(hs->session_id)");
}

{
  __assert_rtn("do_finish_server_handshake", "handshake_server.cc", 1850, "ssl->session != nullptr");
}

{
  __assert_rtn("do_finish_server_handshake", "handshake_server.cc", 1846, "ssl->session == nullptr");
}

void bssl::get_write_aead()
{
  __assert_rtn("get_write_aead", "dtls_record.cc", 263, "ssl->d1->w_epoch >= 1");
}

void bssl::dtls_seal_record()
{
  __assert_rtn("dtls_seal_record", "dtls_record.cc", 295, "ssl->d1->w_epoch >= 1");
}

{
  __assert_rtn("dtls_seal_record", "dtls_record.cc", 337, "ciphertext_len == len_copy");
}

void bssl::ssl_get_handshake_digest()
{
  __assert_rtn("ssl_get_handshake_digest", "ssl_cipher.cc", 825, "0");
}

void bssl::ssl_cipher_get_record_split_len()
{
  __assert_rtn("ssl_cipher_get_record_split_len", "ssl_cipher.cc", 1499, "cipher->algorithm_mac == SSL_SHA1");
}

void SSL_CIPHER_get_protocol_id_cold_1()
{
  __assert_rtn("SSL_CIPHER_get_protocol_id", "ssl_cipher.cc", 1552, "(cipher->id & 0xff000000) == 0x03000000");
}

void SSL_CIPHER_get_cipher_nid_cold_1()
{
  __assert_rtn("SSL_CIPHER_get_cipher_nid", "ssl_cipher.cc", 1581, "0");
}

void SSL_CIPHER_get_digest_nid_cold_1()
{
  __assert_rtn("SSL_CIPHER_get_digest_nid", "ssl_cipher.cc", 1598, "0");
}

void SSL_CIPHER_get_kx_nid_cold_1()
{
  __assert_rtn("SSL_CIPHER_get_kx_nid", "ssl_cipher.cc", 1613, "0");
}

void SSL_CIPHER_get_auth_nid_cold_1()
{
  __assert_rtn("SSL_CIPHER_get_auth_nid", "ssl_cipher.cc", 1628, "0");
}

void SSL_CIPHER_get_prf_nid_cold_1()
{
  __assert_rtn("SSL_CIPHER_get_prf_nid", "ssl_cipher.cc", 1641, "0");
}

void SSL_CIPHER_get_bits_cold_1()
{
  __assert_rtn("SSL_CIPHER_get_bits", "ssl_cipher.cc", 1759, "0");
}

void boringssl_memory_copy_array_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) Input array is NULL", v2, v3, v4, v5, 2u);
}

void boringssl_memory_copy_array_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1B4F6D000, v0, v1, "%{public}s(%d) Input array length is 0 (empty)", v2, v3, v4, v5, 2u);
}

void boringssl_memory_copy_array_cold_3()
{
  uint64_t v0;
  os_log_t v1;
  _WORD v2[10];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)v2 = 136446722;
  OUTLINED_FUNCTION_1_0();
  *(_DWORD *)&v2[7] = 42;
  v2[9] = 2048;
  v3 = v0;
  _os_log_error_impl(&dword_1B4F6D000, v1, OS_LOG_TYPE_ERROR, "%{public}s(%d) boringssl_memory_malloc(%zu) failed", (uint8_t *)v2, 0x1Cu);
}

void aead_chacha20_poly1305_open_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_1B4F6D000, v0, v1, "chacha20 returned an unexpected value.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

void aead_chacha20_poly1305_open_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_1B4F6D000, v0, v1, "chachapoly tag calculation failed.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

void aead_chacha20_poly1305_seal_scatter_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_1B4F6D000, v0, v1, "calc_tag failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

void aead_chacha20_poly1305_seal_scatter_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_1B4F6D000, v0, v1, "chacha20 failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

void aead_chacha20_poly1305_seal_scatter_cold_3(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = 136446466;
  v2 = "aead_chacha20_poly1305_seal_scatter";
  v3 = 1024;
  v4 = 168;
  _os_log_error_impl(&dword_1B4F6D000, log, OS_LOG_TYPE_ERROR, "%{public}s(%d) ccchacha20 failed", (uint8_t *)&v1, 0x12u);
}

void calc_tag_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_1B4F6D000, v0, v1, "poly1305 failed to be finalized.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

void calc_tag_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_7(&dword_1B4F6D000, v0, v1, "poly1305 failed to be initialized.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_3();
}

void tls1_P_hash_cold_1()
{
  __assert_rtn("tls1_P_hash", "kdf.c", 107, "len == chunk");
}

void bssl::SSLAEADContext::ProtocolVersion()
{
  __assert_rtn("ProtocolVersion", "ssl_aead_ctx.cc", 162, "false");
}

void bssl::SSLAEADContext::RecordVersion()
{
  __assert_rtn("RecordVersion", "ssl_aead_ctx.cc", 170, "is_null_cipher()");
}

void bssl::SSLAEADContext::Open()
{
  __assert_rtn("Open", "ssl_aead_ctx.cc", 296, "nonce_len == fixed_nonce_len_");
}

{
  __assert_rtn("Open", "ssl_aead_ctx.cc", 289, "variable_nonce_len_ == 8");
}

void bssl::SSLAEADContext::SealScatter()
{
  __assert_rtn("SealScatter", "ssl_aead_ctx.cc", 393, "!result || written_suffix_len == suffix_len");
}

{
  __assert_rtn("SealScatter", "ssl_aead_ctx.cc", 383, "nonce_len == fixed_nonce_len_");
}

{
  __assert_rtn("SealScatter", "ssl_aead_ctx.cc", 372, "!xor_fixed_nonce_");
}

{
  __assert_rtn("SealScatter", "ssl_aead_ctx.cc", 365, "variable_nonce_len_ == 8");
}

{
  __assert_rtn("SealScatter", "ssl_aead_ctx.cc", 358, "variable_nonce_included_in_record_");
}

void METHOD_unref_cold_1()
{
  __assert_rtn("METHOD_unref", "engine.c", 96, "method->is_static");
}

void SSL_get_srtp_profiles_cold_1()
{
  __assert_rtn("SSL_get_srtp_profiles", "d1_srtp.cc", 211, "0");
}

void BN_primality_test_cold_1()
{
  __assert_rtn("BN_primality_test", "prime.c", 776, "uniform_iterations >= (crypto_word_t)checks");
}

void CRYPTO_free_ex_data_cold_1()
{
  __assert_rtn("CRYPTO_free_ex_data", "ex_data.c", 258, "sk_CRYPTO_EX_DATA_FUNCS_num(func_pointers) <= (size_t)(INT_MAX - ex_data_class->num_reserved)");
}

void bssl::ssl_parse_extensions()
{
  __assert_rtn("ssl_parse_extensions", "handshake.cc", 284, "!ignore_unknown");
}

void bssl::ssl_verify_peer_cert()
{
  __assert_rtn("ssl_verify_peer_cert", "handshake.cc", 338, "!ssl->server");
}

void bssl::ssl_reverify_peer_cert()
{
  __assert_rtn("ssl_reverify_peer_cert", "handshake.cc", 453, "hs->config->verify_mode != SSL_VERIFY_NONE");
}

{
  __assert_rtn("ssl_reverify_peer_cert", "handshake.cc", 452, "ssl->s3->established_session == nullptr");
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1E0C80098](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, cryptorRef);
}

uint64_t CCCryptorGetIV()
{
  return MEMORY[0x1E0C800F8]();
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1E0C80108](cryptorRef);
}

CCCryptorStatus CCCryptorReset(CCCryptorRef cryptorRef, const void *iv)
{
  return MEMORY[0x1E0C80110](cryptorRef, iv);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80118](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

uint64_t CCDigestFinal()
{
  return MEMORY[0x1E0C80140]();
}

uint64_t CCDigestInit()
{
  return MEMORY[0x1E0C80148]();
}

uint64_t CCDigestUpdate()
{
  return MEMORY[0x1E0C80158]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x1E0C98660](err);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1E0CD5F98](certificate);
}

uint64_t SecCertificateCreateWithBytes()
{
  return MEMORY[0x1E0CD6008]();
}

uint64_t SecCertificateGetSignatureHashAlgorithm()
{
  return MEMORY[0x1E0CD6040]();
}

uint64_t SecFrameworkIsDNSName()
{
  return MEMORY[0x1E0CD6258]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1E0CD6270](identityRef, certificateRef);
}

OSStatus SecIdentityCopyPrivateKey(SecIdentityRef identityRef, SecKeyRef *privateKeyRef)
{
  return MEMORY[0x1E0CD6278](identityRef, privateKeyRef);
}

CFTypeID SecIdentityGetTypeID(void)
{
  return MEMORY[0x1E0CD6288]();
}

uint64_t SecKeyCopySubjectPublicKeyInfo()
{
  return MEMORY[0x1E0CD6328]();
}

CFDataRef SecKeyCreateSignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef dataToSign, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0CD6390](key, algorithm, dataToSign, error);
}

OSStatus SecKeyDecrypt(SecKeyRef key, SecPadding padding, const uint8_t *cipherText, size_t cipherTextLen, uint8_t *plainText, size_t *plainTextLen)
{
  return MEMORY[0x1E0CD63A8](key, *(_QWORD *)&padding, cipherText, cipherTextLen, plainText, plainTextLen);
}

uint64_t SecKeyGetAlgorithmId()
{
  return MEMORY[0x1E0CD63D0]();
}

size_t SecKeyGetBlockSize(SecKeyRef key)
{
  return MEMORY[0x1E0CD63D8](key);
}

OSStatus SecKeyRawSign(SecKeyRef key, SecPadding padding, const uint8_t *dataToSign, size_t dataToSignLen, uint8_t *sig, size_t *sigLen)
{
  return MEMORY[0x1E0CD63F8](key, *(_QWORD *)&padding, dataToSign, dataToSignLen, sig, sigLen);
}

uint64_t SecPolicyCreateSSLWithKeyUsage()
{
  return MEMORY[0x1E0CD6530]();
}

CFDictionaryRef SecTrustCopyResult(SecTrustRef trust)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD6690](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

OSStatus SecTrustEvaluateAsyncWithError(SecTrustRef trust, dispatch_queue_t queue, SecTrustWithErrorCallback result)
{
  return MEMORY[0x1E0CD66B8](trust, queue, result);
}

uint64_t SecTrustReportNetworkingAnalytics()
{
  return MEMORY[0x1E0CD6700]();
}

OSStatus SecTrustSetOCSPResponse(SecTrustRef trust, CFTypeRef responseData)
{
  return MEMORY[0x1E0CD6738](trust, responseData);
}

OSStatus SecTrustSetSignedCertificateTimestamps(SecTrustRef trust, CFArrayRef sctArray)
{
  return MEMORY[0x1E0CD6750](trust, sctArray);
}

uint64_t SecTrustSetURLRequestAttribution()
{
  return MEMORY[0x1E0CD6758]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1E0C80B78]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t __udivti3()
{
  return MEMORY[0x1E0C80C80]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

void *__cdecl bsearch(const void *__key, const void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  return (void *)MEMORY[0x1E0C81738](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C81868]();
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

uint64_t ccchacha20()
{
  return MEMORY[0x1E0C81930]();
}

uint64_t cccurve25519_make_pub_with_rng()
{
  return MEMORY[0x1E0C819B8]();
}

uint64_t ccec_cp_224()
{
  return MEMORY[0x1E0C81C58]();
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

uint64_t ccec_get_cp()
{
  return MEMORY[0x1E0C81D18]();
}

uint64_t ccec_import_pub()
{
  return MEMORY[0x1E0C81D20]();
}

uint64_t ccec_keysize_is_supported()
{
  return MEMORY[0x1E0C81D28]();
}

uint64_t ccec_signature_r_s_size()
{
  return MEMORY[0x1E0C81DB8]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1E0C81DC8]();
}

uint64_t ccec_verify_composite()
{
  return MEMORY[0x1E0C81DD0]();
}

uint64_t ccec_x963_import_pub_size()
{
  return MEMORY[0x1E0C81E00]();
}

uint64_t ccecdh_compute_shared_secret()
{
  return MEMORY[0x1E0C81E20]();
}

uint64_t ccgcm_aad()
{
  return MEMORY[0x1E0C81EC0]();
}

uint64_t ccgcm_finalize()
{
  return MEMORY[0x1E0C81ED0]();
}

uint64_t ccgcm_init()
{
  return MEMORY[0x1E0C81EE8]();
}

uint64_t ccgcm_reset()
{
  return MEMORY[0x1E0C81F00]();
}

uint64_t ccgcm_set_iv()
{
  return MEMORY[0x1E0C81F08]();
}

uint64_t ccgcm_update()
{
  return MEMORY[0x1E0C81F10]();
}

uint64_t cchkdf_expand()
{
  return MEMORY[0x1E0C82098]();
}

uint64_t cchkdf_extract()
{
  return MEMORY[0x1E0C820A0]();
}

uint64_t cchmac_final()
{
  return MEMORY[0x1E0C820B0]();
}

uint64_t cchmac_init()
{
  return MEMORY[0x1E0C820B8]();
}

uint64_t cchmac_update()
{
  return MEMORY[0x1E0C820C0]();
}

uint64_t cchpke_initiator_export()
{
  return MEMORY[0x1E0C820D0]();
}

uint64_t cchpke_initiator_setup()
{
  return MEMORY[0x1E0C820D8]();
}

uint64_t cchpke_params_x25519_AESGCM128_HKDF_SHA256()
{
  return MEMORY[0x1E0C82108]();
}

uint64_t cchpke_responder_export()
{
  return MEMORY[0x1E0C82118]();
}

uint64_t cchpke_responder_setup()
{
  return MEMORY[0x1E0C82120]();
}

uint64_t ccmd5_di()
{
  return MEMORY[0x1E0C821F0]();
}

uint64_t ccn_read_uint()
{
  return MEMORY[0x1E0C82220]();
}

uint64_t ccn_write_uint_padded()
{
  return MEMORY[0x1E0C82258]();
}

uint64_t ccn_zero()
{
  return MEMORY[0x1E0C82270]();
}

uint64_t ccpoly1305_final()
{
  return MEMORY[0x1E0C82290]();
}

uint64_t ccpoly1305_init()
{
  return MEMORY[0x1E0C82298]();
}

uint64_t ccpoly1305_update()
{
  return MEMORY[0x1E0C822A0]();
}

uint64_t ccrng()
{
  return MEMORY[0x1E0C822A8]();
}

uint64_t ccrsa_block_size()
{
  return MEMORY[0x1E0C822C0]();
}

uint64_t ccrsa_encrypt_eme_pkcs1v15()
{
  return MEMORY[0x1E0C82308]();
}

uint64_t ccrsa_import_pub()
{
  return MEMORY[0x1E0C82340]();
}

uint64_t ccrsa_import_pub_n()
{
  return MEMORY[0x1E0C82348]();
}

uint64_t ccrsa_pub_crypt()
{
  return MEMORY[0x1E0C82378]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1E0C823D0]();
}

uint64_t ccsha224_di()
{
  return MEMORY[0x1E0C823D8]();
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

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92E0](strm, *(_QWORD *)&level, version, *(_QWORD *)&stream_size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

BOOL dispatch_data_apply(dispatch_data_t data, dispatch_data_applier_t applier)
{
  return MEMORY[0x1E0C82CA0](data, applier);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

uint64_t dispatch_data_create_alloc()
{
  return MEMORY[0x1E0C82CB8]();
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return MEMORY[0x1E0C82CE8](data);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uint64_t dispatch_workloop_copy_current()
{
  return MEMORY[0x1E0C82FD0]();
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int fflush(FILE *a1)
{
  return MEMORY[0x1E0C83370](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1E0C833A0](a1, *(_QWORD *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fseek(FILE *a1, uint64_t a2, int a3)
{
  return MEMORY[0x1E0C83530](a1, a2, *(_QWORD *)&a3);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x1E0C83580](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93D0](strm, version, *(_QWORD *)&stream_size);
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x1E0C83A10]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
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

uint64_t network_config_register_boringssl_log_debug_updates()
{
  return MEMORY[0x1E0CCEDA0]();
}

uint64_t nw_array_append()
{
  return MEMORY[0x1E0CCEE90]();
}

uint64_t nw_array_create()
{
  return MEMORY[0x1E0CCEEA0]();
}

uint64_t nw_association_get_cached_content_for_protocol()
{
  return MEMORY[0x1E0CCEEB8]();
}

uint64_t nw_association_set_cached_content_for_protocol()
{
  return MEMORY[0x1E0CCEEC0]();
}

uint64_t nw_context_copy_registered_endpoint()
{
  return MEMORY[0x1E0CCF288]();
}

uint64_t nw_context_get_scheduling_mode()
{
  return MEMORY[0x1E0CCF2B0]();
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return (char *)MEMORY[0x1E0CCF340](endpoint);
}

uint64_t nw_endpoint_copy_association()
{
  return MEMORY[0x1E0CCF348]();
}

uint64_t nw_endpoint_copy_ech_config()
{
  return MEMORY[0x1E0CCF358]();
}

uint64_t nw_endpoint_copy_original_endpoint()
{
  return MEMORY[0x1E0CCF368]();
}

uint64_t nw_endpoint_copy_parent_endpoint()
{
  return MEMORY[0x1E0CCF370]();
}

uint64_t nw_endpoint_copy_proxy_original_endpoint()
{
  return MEMORY[0x1E0CCF380]();
}

const sockaddr *__cdecl nw_endpoint_get_address(nw_endpoint_t endpoint)
{
  return (const sockaddr *)MEMORY[0x1E0CCF3D8](endpoint);
}

uint64_t nw_endpoint_get_bonjour_fullname()
{
  return MEMORY[0x1E0CCF3E0]();
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x1E0CCF410](endpoint);
}

uint64_t nw_endpoint_get_parent_endpoint_domain()
{
  return MEMORY[0x1E0CCF420]();
}

uint64_t nw_endpoint_get_srv_name()
{
  return MEMORY[0x1E0CCF438]();
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x1E0CCF440](endpoint);
}

uint64_t nw_frame_array_append()
{
  return MEMORY[0x1E0CCF4D8]();
}

uint64_t nw_frame_array_append_array()
{
  return MEMORY[0x1E0CCF4E0]();
}

uint64_t nw_frame_array_first()
{
  return MEMORY[0x1E0CCF4E8]();
}

uint64_t nw_frame_array_foreach()
{
  return MEMORY[0x1E0CCF4F0]();
}

uint64_t nw_frame_array_init()
{
  return MEMORY[0x1E0CCF4F8]();
}

uint64_t nw_frame_array_insert_after()
{
  return MEMORY[0x1E0CCF500]();
}

uint64_t nw_frame_array_is_empty()
{
  return MEMORY[0x1E0CCF508]();
}

uint64_t nw_frame_array_next()
{
  return MEMORY[0x1E0CCF510]();
}

uint64_t nw_frame_array_prepend_array()
{
  return MEMORY[0x1E0CCF518]();
}

uint64_t nw_frame_array_remove()
{
  return MEMORY[0x1E0CCF520]();
}

uint64_t nw_frame_array_unclaimed_length()
{
  return MEMORY[0x1E0CCF528]();
}

uint64_t nw_frame_buffer_get_manager()
{
  return MEMORY[0x1E0CCF530]();
}

uint64_t nw_frame_claim()
{
  return MEMORY[0x1E0CCF538]();
}

uint64_t nw_frame_collapse()
{
  return MEMORY[0x1E0CCF540]();
}

uint64_t nw_frame_create()
{
  return MEMORY[0x1E0CCF548]();
}

uint64_t nw_frame_create_external()
{
  return MEMORY[0x1E0CCF550]();
}

uint64_t nw_frame_finalize()
{
  return MEMORY[0x1E0CCF558]();
}

uint64_t nw_frame_get_buffer()
{
  return MEMORY[0x1E0CCF560]();
}

uint64_t nw_frame_get_buffer_manager_with_context()
{
  return MEMORY[0x1E0CCF568]();
}

uint64_t nw_frame_get_external_data()
{
  return MEMORY[0x1E0CCF570]();
}

uint64_t nw_frame_is_wake_packet()
{
  return MEMORY[0x1E0CCF578]();
}

uint64_t nw_frame_reset()
{
  return MEMORY[0x1E0CCF580]();
}

uint64_t nw_frame_set_buffer_used_malloc()
{
  return MEMORY[0x1E0CCF588]();
}

uint64_t nw_frame_set_buffer_used_manager()
{
  return MEMORY[0x1E0CCF590]();
}

uint64_t nw_frame_set_external_data()
{
  return MEMORY[0x1E0CCF598]();
}

uint64_t nw_frame_set_is_wake_packet()
{
  return MEMORY[0x1E0CCF5A0]();
}

uint64_t nw_frame_set_metadata()
{
  return MEMORY[0x1E0CCF5A8]();
}

uint64_t nw_frame_unclaim()
{
  return MEMORY[0x1E0CCF5B0]();
}

uint64_t nw_frame_unclaimed_bytes()
{
  return MEMORY[0x1E0CCF5B8]();
}

uint64_t nw_frame_unclaimed_length()
{
  return MEMORY[0x1E0CCF5C0]();
}

uint64_t nw_frame_uses_external_data()
{
  return MEMORY[0x1E0CCF5C8]();
}

uint64_t nw_mem_buffer_allocate()
{
  return MEMORY[0x1E0CCF838]();
}

uint64_t nw_mem_buffer_free()
{
  return MEMORY[0x1E0CCF840]();
}

uint64_t nw_parameters_copy_context()
{
  return MEMORY[0x1E0CCF8C0]();
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1E0CCF8C8](parameters);
}

uint64_t nw_parameters_copy_protocol_options_legacy()
{
  return MEMORY[0x1E0CCF918]();
}

nw_parameters_attribution_t nw_parameters_get_attribution(nw_parameters_t parameters)
{
  return MEMORY[0x1E0CCF9A0](parameters);
}

uint64_t nw_parameters_get_enable_tls_keylog()
{
  return MEMORY[0x1E0CCF9B8]();
}

uint64_t nw_parameters_get_is_probe()
{
  return MEMORY[0x1E0CCF9C8]();
}

uint64_t nw_parameters_get_logging_disabled()
{
  return MEMORY[0x1E0CCF9D0]();
}

uint64_t nw_parameters_get_sensitive_redacted_for_endpoint()
{
  return MEMORY[0x1E0CCF9F8]();
}

uint64_t nw_parameters_get_server_mode()
{
  return MEMORY[0x1E0CCFA00]();
}

uint64_t nw_protocol_copy_quic_connection_definition()
{
  return MEMORY[0x1E0CCFEB0]();
}

uint64_t nw_protocol_copy_quic_stream_definition()
{
  return MEMORY[0x1E0CCFEC0]();
}

nw_protocol_definition_t nw_protocol_copy_tcp_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x1E0CCFED8]();
}

nw_protocol_definition_t nw_protocol_copy_tls_definition(void)
{
  return (nw_protocol_definition_t)MEMORY[0x1E0CCFEE0]();
}

uint64_t nw_protocol_definition_create_with_identifier()
{
  return MEMORY[0x1E0CCFEF8]();
}

BOOL nw_protocol_definition_is_equal(nw_protocol_definition_t definition1, nw_protocol_definition_t definition2)
{
  return MEMORY[0x1E0CCFF08](definition1, definition2);
}

uint64_t nw_protocol_definition_set_cache_entry_deallocator()
{
  return MEMORY[0x1E0CCFF10]();
}

uint64_t nw_protocol_definition_set_metadata_allocator()
{
  return MEMORY[0x1E0CCFF18]();
}

uint64_t nw_protocol_definition_set_options_allocator()
{
  return MEMORY[0x1E0CCFF20]();
}

uint64_t nw_protocol_definition_set_options_comparator()
{
  return MEMORY[0x1E0CCFF28]();
}

uint64_t nw_protocol_definition_set_options_equality_check()
{
  return MEMORY[0x1E0CCFF30]();
}

uint64_t nw_protocol_establishment_report_create()
{
  return MEMORY[0x1E0CCFF38]();
}

uint64_t nw_protocol_metadata_access_handle()
{
  return MEMORY[0x1E0CCFF58]();
}

uint64_t nw_protocol_metadata_create_singleton()
{
  return MEMORY[0x1E0CCFF60]();
}

uint64_t nw_protocol_options_access_handle()
{
  return MEMORY[0x1E0CCFF78]();
}

nw_protocol_definition_t nw_protocol_options_copy_definition(nw_protocol_options_t options)
{
  return (nw_protocol_definition_t)MEMORY[0x1E0CCFF80](options);
}

uint64_t nw_protocol_options_get_log_id_str()
{
  return MEMORY[0x1E0CCFF88]();
}

uint64_t nw_protocol_register()
{
  return MEMORY[0x1E0CCFF90]();
}

uint64_t nw_protocol_set_default_one_to_one_callbacks()
{
  return MEMORY[0x1E0CCFFB8]();
}

uint64_t nw_protocol_stack_copy_original_proxied_transport_protocol()
{
  return MEMORY[0x1E0CCFFD8]();
}

nw_protocol_options_t nw_protocol_stack_copy_transport_protocol(nw_protocol_stack_t stack)
{
  return (nw_protocol_options_t)MEMORY[0x1E0CCFFE0](stack);
}

uint64_t nw_queue_activate_source()
{
  return MEMORY[0x1E0CD00E8]();
}

uint64_t nw_queue_cancel_source()
{
  return MEMORY[0x1E0CD00F0]();
}

uint64_t nw_queue_context_async()
{
  return MEMORY[0x1E0CD00F8]();
}

uint64_t nw_queue_context_async_if_needed()
{
  return MEMORY[0x1E0CD0100]();
}

uint64_t nw_queue_context_create_source()
{
  return MEMORY[0x1E0CD0108]();
}

uint64_t nw_queue_set_timer_values()
{
  return MEMORY[0x1E0CD0120]();
}

uint64_t nw_settings_get_signposts_enabled()
{
  return MEMORY[0x1E0CD0340]();
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

void *__cdecl pthread_getspecific(pthread_key_t a1)
{
  return (void *)MEMORY[0x1E0C84DC0](a1);
}

int pthread_key_create(pthread_key_t *a1, void (__cdecl *a2)(void *))
{
  return MEMORY[0x1E0C84DE0](a1, a2);
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

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84E90](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1E0C84E98](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

int pthread_setspecific(pthread_key_t a1, const void *a2)
{
  return MEMORY[0x1E0C84F18](a1, a2);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x1E0C84F88](__base, __nel, __width, __compar);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

uint64_t sec_array_append()
{
  return MEMORY[0x1E0CD7100]();
}

uint64_t sec_array_apply()
{
  return MEMORY[0x1E0CD7108]();
}

uint64_t sec_array_create()
{
  return MEMORY[0x1E0CD7110]();
}

uint64_t sec_array_get_count()
{
  return MEMORY[0x1E0CD7118]();
}

SecCertificateRef sec_certificate_copy_ref(sec_certificate_t certificate)
{
  return (SecCertificateRef)MEMORY[0x1E0CD7120](certificate);
}

sec_certificate_t sec_certificate_create(SecCertificateRef certificate)
{
  return (sec_certificate_t)MEMORY[0x1E0CD7128](certificate);
}

CFArrayRef sec_identity_copy_certificates_ref(sec_identity_t identity)
{
  return (CFArrayRef)MEMORY[0x1E0CD7138](identity);
}

SecIdentityRef sec_identity_copy_ref(sec_identity_t identity)
{
  return (SecIdentityRef)MEMORY[0x1E0CD7140](identity);
}

uint64_t sec_protocol_helper_ciphersuite_group_to_ciphersuite_list()
{
  return MEMORY[0x1E0CD7178]();
}

tls_protocol_version_t sec_protocol_metadata_get_negotiated_tls_protocol_version(sec_protocol_metadata_t metadata)
{
  return (unsigned __int16)MEMORY[0x1E0CD71F0](metadata);
}

uint64_t sec_protocol_options_contents_compare()
{
  return MEMORY[0x1E0CD7260]();
}

BOOL sec_protocol_options_get_enable_encrypted_client_hello(sec_protocol_options_t options)
{
  return MEMORY[0x1E0CD7280](options);
}

BOOL sec_protocol_options_get_quic_use_legacy_codepoint(sec_protocol_options_t options)
{
  return MEMORY[0x1E0CD7288](options);
}

sec_trust_t sec_trust_create(SecTrustRef trust)
{
  return (sec_trust_t)MEMORY[0x1E0CD7370](trust);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int strerror_r(int __errnum, char *__strerrbuf, size_t __buflen)
{
  return MEMORY[0x1E0C85550](*(_QWORD *)&__errnum, __strerrbuf, __buflen);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

void uuid_generate(uuid_t out)
{
  MEMORY[0x1E0C85A18](out);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

xpc_object_t xpc_array_get_array(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E20](xarray, index);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

uint64_t xpc_array_get_uint64(xpc_object_t xarray, size_t index)
{
  return MEMORY[0x1E0C85E78](xarray, index);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x1E0C85E90](xarray, index);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x1E0C85ED0](xarray, index, string);
}

void xpc_array_set_uint64(xpc_object_t xarray, size_t index, uint64_t value)
{
  MEMORY[0x1E0C85ED8](xarray, index, value);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
  MEMORY[0x1E0C85EE8](xarray, index, value);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C860E8](object);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1E0C86188](ddata);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1E0C86190](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_uuid(xpc_object_t xdict, const char *key, const unsigned __int8 *uuid)
{
  MEMORY[0x1E0C863B0](xdict, key, uuid);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return MEMORY[0x1E0C86420](object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

size_t xpc_string_get_length(xpc_object_t xstring)
{
  return MEMORY[0x1E0C86748](xstring);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

