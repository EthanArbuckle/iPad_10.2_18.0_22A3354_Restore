__int128 *cc_module_id(int a1)
{
  int v1;

  strcpy((char *)&cc_module_id_moduleProc, "Apple ARM");
  cc_module_id_moduleSecLevel = 3230803;
  switch(a1)
  {
    case 0:
      snprintf((char *)&cc_module_id_moduleID, 0x100uLL, "%s v%s [%s, %s, %s, %s]", "Apple corecrypto Module");
      break;
    case 1:
      strcpy((char *)&cc_module_id_moduleID, "Apple corecrypto Module");
      break;
    case 2:
      BYTE4(cc_module_id_moduleID) = 0;
      v1 = 808334385;
      goto LABEL_7;
    case 3:
      BYTE4(cc_module_id_moduleID) = 0;
      v1 = 1919251285;
LABEL_7:
      LODWORD(cc_module_id_moduleID) = v1;
      break;
    case 4:
      strcpy((char *)&cc_module_id_moduleID, "Software");
      break;
    case 5:
    case 6:
      snprintf((char *)&cc_module_id_moduleID, 0x100uLL, "%s");
      break;
    default:
      strcpy((char *)&cc_module_id_moduleID, "INVALID Module ID");
      break;
  }
  return &cc_module_id_moduleID;
}

uint64_t ccpolyzp_po2cyc_coeff_apply_galois(uint64_t *a1, unsigned int **a2, unsigned int a3)
{
  unsigned int *v6;
  unsigned int v7;
  uint8x8_t v8;
  BOOL v9;
  uint64_t result;
  uint64_t v11;
  unint64_t v12;
  unsigned int **v13;
  unsigned int v14;
  uint64_t *v15;
  int *v16;
  int v17;
  unsigned int *v18;
  unsigned int v19;
  int v21;
  int v22;
  uint64_t v23;
  unint64_t *v24;
  unsigned int v25;
  int v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;

  if (a1 == (uint64_t *)a2)
    return 4294967289;
  if (!ccpolyzp_po2cyc_ctx_eq(*a1, *a2))
    return 4294967289;
  v6 = *a2;
  v7 = **a2;
  v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
  v8.i16[0] = vaddlv_u8(v8);
  v9 = v7 <= 0x100000 && v8.i32[0] == 1;
  if (!v9)
    return 4294967289;
  result = 4294967289;
  if (a3 >= 2 && (a3 & 1) != 0 && 2 * v7 > a3)
  {
    v11 = v6[1];
    if ((_DWORD)v11)
    {
      v12 = 0;
      v13 = a2 + 1;
      v14 = 0x80000000 >> __clz(v7);
      v16 = (int *)*a1;
      v15 = a1 + 1;
      v17 = *v16;
      do
      {
        v18 = v6;
        if (v12 < (v11 - 1))
        {
          v19 = v11 - 2;
          v18 = v6;
          do
            v18 = (unsigned int *)*((_QWORD *)v18 + 14);
          while (v12 < v19--);
        }
        v21 = 0;
        v22 = 0;
        v23 = *((_QWORD *)v18 + 2);
        v24 = (unint64_t *)&v13[v7 * v12];
        v25 = v7;
        do
        {
          v9 = (v22 & v14) == 0;
          v22 += a3;
          v26 = v17 * v12 + v21;
          v28 = *v24++;
          v27 = v28;
          v29 = (v23 - v28) & -(uint64_t)(((v28 | HIDWORD(v28)) + 0xFFFFFFFF) >> 32);
          if (!v9)
            v27 = v29;
          v15[v26] = v27;
          v21 = v22 & (v7 - 1);
          --v25;
        }
        while (v25);
        ++v12;
      }
      while (v12 != v11);
    }
    return 0;
  }
  return result;
}

uint64_t ccpolyzp_po2cyc_eval_apply_galois(uint64_t *a1, unsigned int **a2, unsigned int a3)
{
  unsigned int v6;
  uint8x8_t v7;
  uint64_t result;
  int v10;
  char v11;
  unsigned int v12;
  int v13;
  uint64_t *v14;
  unsigned int v15;
  unsigned int v16;

  if (a1 == (uint64_t *)a2)
    return 4294967289;
  if (!ccpolyzp_po2cyc_ctx_eq(*a1, *a2))
    return 4294967289;
  v6 = **a2;
  v7 = (uint8x8_t)vcnt_s8((int8x8_t)v6);
  v7.i16[0] = vaddlv_u8(v7);
  if (v6 > 0x100000 || v7.i32[0] != 1)
    return 4294967289;
  result = 4294967289;
  if (a3 >= 2 && (a3 & 1) != 0 && 2 * v6 > a3)
  {
    v16 = (*a2)[1];
    if (v16)
    {
      v10 = 0;
      v11 = __clz(v6);
      v12 = a3;
      do
      {
        v13 = 0;
        v14 = &a1[(*(_DWORD *)*a1 * v10) + 1];
        do
        {
          v15 = __rbit32(v6 + v13++);
          ccn_set(1, v14++, &(&a2[(__rbit32((v6 - 1) & ((v12 * (unint64_t)(v15 >> v11)) >> 1)) >> (v11 + 1)) + 1])[**a2 * v10]);
        }
        while (v6 != v13);
        ++v10;
      }
      while (v10 != v16);
    }
    return 0;
  }
  return result;
}

uint64_t ccsiv_context_size(uint64_t *a1)
{
  char v1;
  uint64_t v7;
  char v9;

  v1 = 0;
  v9 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v1 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v1 = 1;
    }
  }
  v9 = v1;
  v7 = *a1;
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccsiv_block_size(uint64_t a1)
{
  char v1;
  uint64_t v7;
  char v9;

  v1 = 0;
  v9 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v1 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v1 = 1;
    }
  }
  v9 = v1;
  v7 = *(_QWORD *)(a1 + 8);
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccsiv_ciphertext_size(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v8;
  char v10;

  v2 = 0;
  v10 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v2 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v2 = 1;
    }
  }
  v10 = v2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + a2;
  cc_disable_dit(&v10);
  return v8;
}

unint64_t ccsiv_plaintext_size(uint64_t a1, unint64_t a2)
{
  char v2;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v12;

  v2 = 0;
  v12 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v2 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v2 = 1;
    }
  }
  v12 = v2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  _CF = a2 >= v8;
  v9 = a2 - v8;
  if (_CF)
    v10 = v9;
  else
    v10 = 0;
  cc_disable_dit(&v12);
  return v10;
}

uint64_t ccsiv_init(uint64_t a1)
{
  char v1;
  uint64_t v7;
  char v9;

  v1 = 0;
  v9 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v1 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v1 = 1;
    }
  }
  v9 = v1;
  v7 = (*(uint64_t (**)(void))(a1 + 16))();
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccsiv_set_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v4;
  uint64_t v10;
  char v12;

  v4 = 0;
  v12 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v4 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v4 = 1;
    }
  }
  v12 = v4;
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, a3, a4);
  cc_disable_dit(&v12);
  return v10;
}

uint64_t ccsiv_aad(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v4;
  uint64_t v10;
  char v12;

  v4 = 0;
  v12 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v4 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v4 = 1;
    }
  }
  v12 = v4;
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4);
  cc_disable_dit(&v12);
  return v10;
}

uint64_t ccsiv_crypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v5;
  uint64_t v11;
  char v13;

  v5 = 0;
  v13 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v5 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v5 = 1;
    }
  }
  v13 = v5;
  v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40))(a2, a3, a4, a5);
  cc_disable_dit(&v13);
  return v11;
}

uint64_t ccsiv_reset(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v8;
  char v10;

  v2 = 0;
  v10 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v2 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v2 = 1;
    }
  }
  v10 = v2;
  v8 = (*(uint64_t (**)(uint64_t))(a1 + 48))(a2);
  cc_disable_dit(&v10);
  return v8;
}

uint64_t ccsiv_one_shot(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  char v16;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  _BYTE v26[7];
  char v27;
  uint64_t v28;

  v16 = 0;
  v28 = *MEMORY[0x24BDB0D28];
  v27 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v16 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v16 = 1;
    }
  }
  v27 = v16;
  MEMORY[0x24BDB0C10](a1);
  v23 = &v26[-v22];
  v24 = (*(uint64_t (**)(uint64_t, _BYTE *))(a1 + 16))(a1, &v26[-v22]);
  if (!(_DWORD)v24)
  {
    v24 = (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t))(a1 + 24))(v23, a4, a5);
    if (!(_DWORD)v24)
    {
      v24 = (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t))(a1 + 32))(v23, a6, a7);
      if (!(_DWORD)v24)
      {
        v24 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(a1 + 40))(v23, a8, a9, a10);
        if (!(_DWORD)v24)
          cc_clear(*(_QWORD *)a1, v23);
      }
    }
  }
  cc_disable_dit(&v27);
  return v24;
}

uint64_t ccss_sizeof_shamir_share_generator_serialization(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(unsigned int *)(a1 + 8) + 2;
  v4 = 8 * cczp_n(*(_QWORD *)a1);
  if (!is_mul_ok(v3, v4))
    return 0;
  result = 0;
  v6 = v3 * v4;
  v7 = __CFADD__(v6, 9);
  v8 = v6 + 9;
  v9 = v7;
  v10 = v9 << 63 >> 63;
  if (v10 == v9 && (v10 & 0x8000000000000000) == 0)
  {
    *a2 = v8;
    return 1;
  }
  return result;
}

uint64_t ccss_shamir_share_generator_serialize(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v6;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  unsigned int v17;
  char *v18;
  unint64_t v20;
  char v21;

  v6 = 0;
  v21 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v6 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v6 = 1;
    }
  }
  v21 = v6;
  v20 = 0;
  v12 = 4294967289;
  if (ccss_sizeof_shamir_share_generator_serialization(a3, &v20) && v20 <= a1)
  {
    *(_BYTE *)a2 = 1;
    v13 = **(_QWORD **)a3;
    if ((v13 >> 29))
    {
      v12 = 4294967284;
    }
    else
    {
      v14 = 8 * v13;
      *(_DWORD *)(a2 + 1) = bswap32(8 * v13);
      v15 = *(_DWORD *)(a3 + 8);
      *(_DWORD *)(a2 + 5) = bswap32(v15);
      v16 = ccn_write_uint_padded_ct(v13, (unint64_t *)(*(_QWORD *)a3 + 24), 8 * v13, (char *)(a2 + 9));
      if ((v16 & 0x80000000) == 0)
      {
        v17 = 0;
        v18 = (char *)(v14 + a2 + 9);
        while (1)
        {
          v16 = ccn_write_uint_padded_ct(v13, (unint64_t *)(a3 + 8 * v13 * v17 + 16), 8 * v13, v18);
          if ((v16 & 0x80000000) != 0)
            break;
          ++v17;
          v18 += v14;
          if (v17 > v15)
          {
            v12 = 0;
            goto LABEL_13;
          }
        }
      }
      v12 = v16;
    }
  }
LABEL_13:
  cc_disable_dit(&v21);
  return v12;
}

uint64_t ccss_shamir_share_generator_deserialize(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  char v8;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  uint64_t uint;
  unint64_t *v19;
  unsigned int v20;
  unsigned __int8 *v21;
  unint64_t *v22;
  uint64_t v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t (*v27)(_QWORD *, uint64_t);
  void (*v28)(uint64_t);
  char v29;

  v8 = 0;
  v29 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v8 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v8 = 1;
    }
  }
  v29 = v8;
  v14 = *(_QWORD *)(a2 + 8);
  v25[0] = cc_malloc_clear(8 * v14);
  v25[1] = v14;
  v26 = 0;
  v27 = cc_ws_alloc;
  v28 = cc_ws_free;
  if (!v25[0])
  {
    v23 = 4294967283;
    goto LABEL_22;
  }
  ccss_shamir_init_share_poly(a1, (int *)a2);
  if (a3 >= 0xA && *(_BYTE *)a4 == 1)
  {
    v15 = bswap32(*(_DWORD *)(a4 + 1));
    if ((_DWORD)v15)
    {
      if (v14 == (v15 + 7) >> 3)
      {
        v16 = bswap32(*(_DWORD *)(a4 + 5));
        *(_DWORD *)(a1 + 8) = v16;
        if ((_DWORD)v16 != -1 && (_DWORD)v16 + 1 == *(_DWORD *)a2 && (v16 + 2) * v15 + 9 == a3)
        {
          v17 = (unint64_t *)cc_ws_alloc(v25, v14);
          uint = ccn_read_uint(v14, v17, v15, (unsigned __int8 *)(a4 + 9));
          if ((_DWORD)uint)
          {
            v23 = uint;
            goto LABEL_20;
          }
          v19 = (unint64_t *)cczp_prime(*(_QWORD *)a1);
          if (!ccn_cmp(v14, v17, v19))
          {
            v20 = 0;
            v21 = (unsigned __int8 *)(v15 + a4 + 9);
            while (!ccn_read_uint(v14, (_QWORD *)(a1 + 8 * v14 * v20 + 16), v15, v21))
            {
              v22 = (unint64_t *)cczp_prime(*(_QWORD *)a1);
              if (ccn_cmp(v14, (unint64_t *)(a1 + 8 * v14 * v20 + 16), v22) != -1)
                break;
              ++v20;
              v21 += v15;
              if (v20 > *(_DWORD *)(a1 + 8))
              {
                v23 = 0;
                goto LABEL_20;
              }
            }
          }
        }
      }
    }
  }
  v23 = 4294967289;
LABEL_20:
  v26 = 0;
  v28((uint64_t)v25);
LABEL_22:
  cc_disable_dit(&v29);
  return v23;
}

uint64_t ccmode_ccm_init(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 72);
  *a2 = v2;
  (*(void (**)(void))(v2 + 16))();
  return 0;
}

void ccrsa_pairwise_consistency_check_ws(uint64_t a1, uint64_t *a2, uint64_t (**a3)(_QWORD, uint64_t, uint64_t))
{
  unint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t *v10;
  unint64_t *v11;
  unsigned __int8 *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  char v18;

  v6 = (unint64_t *)ccrsa_ctx_public(a2);
  v7 = *a2;
  v8 = cczp_bitlen((uint64_t)v6);
  v18 = 0;
  v16 = *(_QWORD *)(a1 + 16);
  v9 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  v10 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  v11 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  v12 = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  v17 = (unint64_t)(v8 + 7) >> 3;
  v13 = ccsha256_di();
  if (!ccrsa_sign_pkcs1v15_msg_blinded_ws(a1, a3, (unint64_t *)a2, (uint64_t)v13, 0, &v18, &v17, v12))
  {
    v14 = ccsha256_di();
    ccrsa_verify_pkcs1v15_msg_ws(a1, v6, (uint64_t)v14, 0, &v18, v17, v12, 0);
    if (!v15)
    {
      ccn_seti(v7, v10, 42);
      ccn_set_bit((uint64_t)v10, v8 - 9, 1);
      if (!ccrsa_pub_crypt_ws(a1, (uint64_t *)v6, v9, v10)
        && ccn_cmp(v7, v10, (unint64_t *)v9)
        && !ccrsa_priv_crypt_blinded_ws(a1, a3, a2, (uint64_t *)v11, (unint64_t *)v9))
      {
        ccn_cmp(v7, v11, v10);
      }
    }
  }
  *(_QWORD *)(a1 + 16) = v16;
}

uint64_t ccpost(unsigned int *a1, int64x2_t *a2)
{
  char v3;
  int64x2_t *v9;
  uint64_t v10;
  _QWORD v12[3];
  char v13;

  v3 = 0;
  v13 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v3 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v3 = 1;
    }
  }
  v13 = v3;
  memset(v12, 0, sizeof(v12));
  if (a2)
    v9 = a2;
  else
    v9 = (int64x2_t *)v12;
  cc_clear(0x18uLL, v9);
  ccpost_internal(a1, v9);
  if (v9->i64[1])
    v10 = 4294967221;
  else
    v10 = 0;
  cc_disable_dit(&v13);
  return v10;
}

unsigned int *ccpost_internal(unsigned int *result, int64x2_t *a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = *result;
    if (v2 < 2)
    {
      return (unsigned int *)((uint64_t (*)(uint64_t, uint64_t))vector_handlers[v2])((uint64_t)result, (uint64_t)a2);
    }
    else
    {
      *a2 = vaddq_s64(*a2, vdupq_n_s64(1uLL));
      if (!a2[1].i64[0])
        a2[1].i64[0] = (uint64_t)result;
    }
  }
  return result;
}

uint64_t ccpost_report(uint64_t result, _QWORD *a2, int a3)
{
  uint64_t v3;

  ++*a2;
  if (a3)
  {
    v3 = a2[2];
    ++a2[1];
    if (!v3)
      a2[2] = result;
  }
  return result;
}

uint64_t ccaes_arm_encrypt_cbc(uint64_t result, int8x16_t *a2, uint64_t a3, uint64_t a4, int8x16_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  int8x16_t *v7;
  BOOL v15;
  int8x16_t v17;

  if (a3)
  {
    v5 = *(unsigned int *)(result + 240);
    if ((_DWORD)v5 == 160 || (_DWORD)v5 == 192 || (_DWORD)v5 == 224)
    {
      do
      {
        v6 = v5 - 16;
        a4 += 16;
        _Q2 = *(int8x16_t *)result;
        v7 = (int8x16_t *)(result + 16);
        do
        {
          __asm
          {
            AESE            V0.16B, V2.16B
            AESMC           V0.16B, V0.16B
          }
          _Q2 = *v7++;
          v15 = v6 <= 16;
          v6 -= 16;
        }
        while (!v15);
        __asm { AESE            V0.16B, V2.16B }
        v17 = veorq_s8(_Q0, *v7);
        result = (uint64_t)v7->i64 - v5;
        *a5++ = v17;
        v15 = a3-- <= 1;
      }
      while (!v15);
      result = 0;
      *a2 = v17;
    }
    else
    {
      return -1;
    }
  }
  return result;
}

unint64_t ccec_rfc6637_wrap_pub_size(uint64_t *a1, char a2)
{
  uint64_t v3;

  v3 = cczp_bitlen(*a1);
  if ((a2 & 1) != 0)
    return (unint64_t)(v3 + 7) >> 3;
  else
    return ((unint64_t)(v3 + 7) >> 2) | 1;
}

unint64_t ccec_rfc6637_wrap_key_size(uint64_t *a1, char a2, uint64_t a3)
{
  char v6;
  uint64_t v12;
  unint64_t v13;
  char v15;

  v6 = 0;
  v15 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v6 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v6 = 1;
    }
  }
  v15 = v6;
  v12 = cczp_bitlen(*a1);
  if ((a2 & 1) != 0)
    v13 = (unint64_t)(v12 + 7) >> 3;
  else
    v13 = ((unint64_t)(v12 + 7) >> 2) | 1;
  if ((a2 & 2) != 0)
    v13 += a3 + ((unint64_t)(cczp_bitlen(*a1) + 7) >> 3) + 2;
  cc_disable_dit(&v15);
  return v13 + 51;
}

uint64_t ccec_rfc6637_wrap_key(uint64_t *a1, _WORD *a2, uint64_t a3, char a4, size_t a5, unsigned __int8 *a6, char *a7, uint64_t (**a8)(void), char *a9, uint64_t (**a10)(_QWORD, uint64_t, uint64_t *))
{
  char v17;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t *v30;
  uint64_t **v31;
  uint64_t key_ws;
  uint64_t v33;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t (*v38)(_QWORD *, uint64_t);
  void (*v39)(uint64_t);
  char v40;

  v17 = 0;
  v40 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v17 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v17 = 1;
    }
  }
  v40 = v17;
  v23 = (uint64_t *)*a1;
  v24 = *(_QWORD *)*a1;
  v25 = sizeof_struct_cche_galois_key();
  v26 = sizeof_struct_ccpolyzp_po2cyc();
  v36[0] = cc_malloc_clear(248 * v24 + 16 * ((v25 + v26 + 4 * v24 * v26 - 1) / v26));
  v27 = *v23;
  v28 = sizeof_struct_cche_galois_key();
  v29 = sizeof_struct_ccpolyzp_po2cyc();
  v36[1] = 31 * v27 + 2 * ((v28 + v29 + 4 * v27 * v29 - 1) / v29);
  v37 = 0;
  v38 = cc_ws_alloc;
  v39 = cc_ws_free;
  if (v36[0])
  {
    v30 = (uint64_t *)*a1;
    v31 = (uint64_t **)cc_ws_alloc(v36, (4 * (*(_QWORD *)*a1 & 0x7FFFFFFFFFFFFFFLL)) | 2);
    key_ws = ccecdh_generate_key_ws((uint64_t)v36, v30, a10, v31);
    if (!(_DWORD)key_ws)
      key_ws = ccec_rfc6637_wrap_core_ws((uint64_t)v36, a1, (uint64_t *)v31, a2, a3, a4, a5, a6, a7, a8, a9, a10);
    v33 = key_ws;
    v37 = 0;
    v39((uint64_t)v36);
  }
  else
  {
    v33 = 4294967283;
  }
  cc_disable_dit(&v40);
  return v33;
}

uint64_t ccaes_vng_gcm_decrypt(uint64_t a1, unint64_t a2, int8x16_t *a3, int8x16_t *a4, double a5, double a6, double a7, double a8, double a9, int8x16_t a10)
{
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int8x16_t v20;
  uint64_t v21;
  uint64_t result;
  unsigned int v23;
  uint64_t v24;
  uint64_t v25;
  __int8 *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int8x16_t v36;
  uint64_t i;
  uint64_t j;
  uint64_t v39;
  __int8 *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;

  v14 = *(_QWORD *)(a1 + 96);
  ccmode_gcm_aad_finalize(a1, a5, a6, a7, a8, a9, a10);
  if (*(_WORD *)(a1 + 80) != 3)
    return 4294967228;
  v21 = *(_QWORD *)(a1 + 96);
  result = 4294967229;
  if (!__CFADD__(v21, a2) && v21 + a2 <= 0xFFFFFFFE0)
  {
    v23 = v14 & 0xF;
    if ((v14 & 0xF) != 0)
    {
      v24 = 16 - v23;
      if (a2 < v24)
      {
LABEL_19:
        if (!a2)
          return 0;
        v39 = v23;
        v40 = &a3[-1].i8[15];
        v41 = a1 + v23 + 15;
        v42 = a2;
        do
        {
          *(_BYTE *)(v41 + v42) ^= v40[v42];
          --v42;
        }
        while (v42);
        v43 = v39 + a1 + 63;
        v44 = a2;
        do
        {
          a4[-1].i8[v44 + 15] = *(_BYTE *)(v43 + v44) ^ v40[v44];
          --v44;
        }
        while (v44);
        result = 0;
        *(_QWORD *)(a1 + 96) += a2;
        return result;
      }
      v25 = v14 & 0xF;
      v26 = &a3[-1].i8[15];
      v27 = 16 - v23;
      do
      {
        *(_BYTE *)(v25 + a1 + 15 + v27) ^= v26[v27];
        --v27;
      }
      while (v27);
      ccmode_gcm_mult_h((uint64x2_t *)a1, (int8x16_t *)(a1 + 16), v15, v16, v17, v18, v19, v20);
      v28 = v24;
      do
      {
        a4[-1].i8[v28 + 15] = *(_BYTE *)(v25 + a1 + 63 + v28) ^ v26[v28];
        --v28;
      }
      while (v28);
      a2 -= v24;
      a3 = (int8x16_t *)((char *)a3 + v24);
      a4 = (int8x16_t *)((char *)a4 + v24);
      *(_QWORD *)(a1 + 96) += v24;
      ccmode_gcm_update_pad(a1);
    }
    if (a2 >= 0x10)
    {
      gcmDecrypt(a3, a4, (int8x16_t *)a1, a2 & 0xFFFFFFF0, (uint64x2_t *)(a1 + 128), *(int8x16_t **)(a1 + 112));
      v29 = a2 & 0xFFFFFFF0;
      a2 &= 0xFFFFFFFF0000000FLL;
      a3 = (int8x16_t *)((char *)a3 + v29);
      a4 = (int8x16_t *)((char *)a4 + v29);
      v30 = *(_QWORD *)(a1 + 104);
      *(_QWORD *)(a1 + 96) += v29;
      (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v30 + 24))(*(_QWORD *)(a1 + 112), 1, a1 + 32, a1 + 64);
      if (a2 >= 0x10)
      {
        do
        {
          for (i = 0; i != -16; --i)
            *(_BYTE *)(a1 + i + 31) ^= a3->u8[i + 15];
          ccmode_gcm_mult_h((uint64x2_t *)a1, (int8x16_t *)(a1 + 16), v31, v32, v33, v34, v35, v36);
          for (j = 0; j != -16; --j)
            a4->i8[j + 15] = *(_BYTE *)(a1 + j + 79) ^ a3->i8[j + 15];
          a2 -= 16;
          ++a3;
          ++a4;
          *(_QWORD *)(a1 + 96) += 16;
          ccmode_gcm_update_pad(a1);
        }
        while (a2 > 0xF);
      }
    }
    v23 = 0;
    goto LABEL_19;
  }
  return result;
}

uint64_t ccz_size()
{
  char v0;
  char v7;

  v0 = 0;
  v7 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v0 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v0 = 1;
    }
  }
  v7 = v0;
  cc_disable_dit(&v7);
  return 32;
}

_BYTE *ccdrbg_factory_nisthmac(_QWORD *a1, uint64_t a2)
{
  char v2;
  char v9;

  v2 = 0;
  v9 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v2 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v2 = 1;
    }
  }
  v9 = v2;
  *a1 = 160;
  a1[1] = init_1;
  a1[2] = reseed_0;
  a1[3] = generate_5;
  a1[4] = done_0;
  a1[5] = a2;
  a1[6] = must_reseed_0;
  return cc_disable_dit(&v9);
}

uint64_t init_1(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7)
{
  unint64_t **v7;
  uint64_t result;
  unint64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = *(unint64_t ***)(a1 + 40);
  *(_QWORD *)a2 = v7;
  result = 4294967233;
  if (a3 <= 0x10000)
  {
    v9 = **v7;
    if (v9 <= 0x40 && a7 <= 0x10000 && v9 >> 1 <= a3)
    {
      __memset_chk();
      __memset_chk();
      update_1((size_t ***)a2, 3, v12, v13, v14, v15, v16, v17, a3);
      result = 0;
      *(_QWORD *)(a2 + 136) = 1;
    }
  }
  return result;
}

uint64_t generate_5(size_t ***a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t *v8;
  size_t v9;
  uint64_t v10;
  char *v12;
  unint64_t v13;
  size_t v15;
  char v17[64];
  uint64_t v18;

  v18 = *MEMORY[0x24BDB0D28];
  v8 = **a1;
  v9 = *v8;
  v10 = 4294967233;
  if (a2 <= 0x10000 && a4 < 0x10001)
  {
    v12 = (char *)a3;
    v13 = a2;
    if (*((_DWORD *)*a1 + 2) && (unint64_t)a1[17] > 0x1000000000000)
    {
      v10 = 4294967234;
    }
    else
    {
      if (a4)
        update_1(a1, 1, a3, a4, a5, a6, a7, a8, a4);
      for (; v13; v13 -= v15)
      {
        __memcpy_chk();
        cchmac((uint64_t)v8, v9, (char *)a1 + 8, v9, (char *)a1 + 72, (uint64_t)(a1 + 9));
        if (!cc_cmp_safe(v9, v17, (char *)a1 + 72))
        {
          cc_clear(0x40uLL, a1 + 1);
          cc_clear(0x40uLL, a1 + 9);
          a1[17] = (size_t **)-1;
          cc_try_abort();
        }
        if (v13 >= v9)
          v15 = v9;
        else
          v15 = v13;
        memcpy(v12, a1 + 9, v15);
        v12 += v15;
      }
      update_1(a1, 1, a3, a4, a5, a6, a7, a8, a4);
      v10 = 0;
      a1[17] = (size_t **)((char *)a1[17] + 1);
    }
  }
  cc_clear(v9, v17);
  return v10;
}

uint64_t reseed_0(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;

  if (a2 > 0x10000)
    return 4294967233;
  result = 4294967233;
  if (a4 < 0x10001 && ***(_QWORD ***)a1 >> 1 <= a2)
  {
    update_1((size_t ***)a1, 2, a3, a4, a5, a6, a7, a8, a2);
    result = 0;
    *(_QWORD *)(a1 + 136) = 1;
  }
  return result;
}

uint64_t done_0(_QWORD *a1)
{
  uint64_t result;

  cc_clear(0x40uLL, a1 + 1);
  result = cc_clear(0x40uLL, a1 + 9);
  a1[17] = -1;
  return result;
}

BOOL must_reseed_0(_QWORD *a1)
{
  return *(_DWORD *)(*a1 + 8) && a1[17] > 0x1000000000000uLL;
}

uint64_t update_1(size_t ***a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char *v10;
  size_t *v11;
  size_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  int i;
  size_t *v19;
  size_t v20;
  uint64_t v22;
  unsigned __int8 v23;
  size_t *v24;
  uint64_t v25;

  v22 = (uint64_t)&v22;
  v25 = *MEMORY[0x24BDB0D28];
  v10 = (char *)(a1 + 9);
  v11 = **a1;
  v12 = *v11;
  v24 = 0;
  v13 = MEMORY[0x24BDB0C10](a1);
  v15 = (uint64_t *)((char *)&v22 - v14);
  v16 = 0;
  v23 = 0;
  v17 = (char *)(v13 + 8);
  do
  {
    cchmac_init((uint64_t)v11, v15, v12, v17);
    cchmac_update((uint64_t)v11, v15, v12, v10);
    cchmac_update((uint64_t)v11, v15, 1uLL, (char *)&v23);
    v24 = (size_t *)&a9;
    for (i = a2; i; --i)
    {
      v19 = v24++;
      v20 = *v19;
      v24 = v19 + 2;
      cchmac_update((uint64_t)v11, v15, v20, (char *)v19[1]);
      v16 += v20;
    }
    cchmac_final((uint64_t)v11, v15, (uint64_t)v17);
    cchmac((uint64_t)v11, v12, v17, v12, v10, (uint64_t)v10);
    if (!v16)
      break;
    ++v23;
  }
  while (v23 < 2u);
  return cc_clear(((v11[1] + v11[2] + 19) & 0xFFFFFFFFFFFFFFF8) + v11[1], v15);
}

unint64_t cche_relin_key_nof_n(uint64_t a1)
{
  unint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;

  v2 = sizeof_struct_ccpolyzp_po2cyc() + 7;
  v3 = cche_param_ctx_key_ctx_nmoduli(a1);
  if ((v3 - 1) <= 1)
    v4 = 1;
  else
    v4 = (v3 - 1);
  v5 = cche_param_ctx_polynomial_degree(a1);
  v6 = cche_ciphertext_fresh_npolys();
  v7 = sizeof_struct_ccrns_mul_modulus();
  v8 = sizeof_struct_ccpolyzp_po2cyc();
  return ((v7 + v8 - 1) / v8
        + ((v5 * v3) + ((unint64_t)(sizeof_struct_ccpolyzp_po2cyc() + 7) >> 3)) * v6)
       * v4
       + (v2 >> 3);
}

unint64_t cche_relin_key_ciphertext(uint64_t *a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  unint64_t v8;

  v4 = cche_param_ctx_chain_const(*a1);
  v5 = a2;
  v6 = cche_ciphertext_fresh_npolys();
  v7 = sizeof_struct_ccrns_mul_modulus();
  v8 = sizeof_struct_ccpolyzp_po2cyc();
  return (unint64_t)&a1[((v7 + v8 - 1) / v8
                              + ((*(_DWORD *)(v4 + 12) * *(_DWORD *)(v4 + 8))
                               + ((unint64_t)(sizeof_struct_ccpolyzp_po2cyc() + 7) >> 3))
                              * v6)
                             * v5
                             + 1];
}

uint64_t cche_relin_key_generate_ws(uint64_t a1, uint64_t *a2, unsigned int **a3, unsigned int *a4, int a5, uint64_t a6, uint64_t (**a7)(_QWORD, uint64_t, uint64_t))
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t (*v14)(uint64_t, unint64_t);
  uint64_t v15;
  uint64_t v16;
  unsigned int **v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  int v22;
  _QWORD *v23;
  unsigned int v24;
  BOOL v25;
  unint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unsigned int v35;
  unsigned int v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
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
  unsigned int **v51;
  unsigned int v53;

  v10 = cche_param_ctx_chain_const((uint64_t)a4);
  v11 = *(_DWORD *)(v10 + 12);
  if (v11 < 2)
    return 4294967289;
  v12 = v10;
  v13 = cche_param_ctx_ciphertext_ctx_nmoduli((uint64_t)a4);
  if (a5)
  {
    if (cche_rng_seed_sizeof() * v13 != a5)
      return 4294967289;
  }
  *a2 = (uint64_t)a4;
  v53 = cche_param_ctx_polynomial_degree((uint64_t)a4);
  v15 = *(_QWORD *)(a1 + 16);
  v14 = *(uint64_t (**)(uint64_t, unint64_t))(a1 + 24);
  v16 = sizeof_struct_ccpolyzp_po2cyc();
  v17 = (unsigned int **)v14(a1, *(_DWORD *)(v12 + 8) * v11 + ((unint64_t)(v16 + 7) >> 3));
  *v17 = *a3;
  v51 = v17;
  ccpolyzp_po2cyc_eval_mul(v17, a3, a3);
  v18 = *(_DWORD *)(v12 + 12) - 1;
  v19 = v12 + 8;
  if (v18 > v13)
  {
    v19 = v12 + 8;
    do
    {
      v19 = *(_QWORD *)(v19 + 112);
      --v18;
    }
    while (v18 > v13);
  }
  if (v13)
  {
    v50 = v15;
    v20 = 0;
    v21 = v13;
    while (1)
    {
      v22 = *(_DWORD *)(v12 + 12);
      v23 = (_QWORD *)(v12 + 8);
      if (v20 < (v22 - 1))
      {
        v24 = v22 - 2;
        v23 = (_QWORD *)(v12 + 8);
        do
        {
          v23 = (_QWORD *)v23[14];
          v25 = v20 >= v24--;
        }
        while (!v25);
      }
      v26 = cche_relin_key_ciphertext(a2, v20);
      v27 = *(_DWORD *)(v12 + 12);
      v28 = a6 ? a6 + cche_rng_seed_sizeof() * v20 : 0;
      result = cche_encrypt_zero_symmetric_eval_ws(a1, v26, a4, (uint64_t *)a3, v27, v28, a7);
      if ((_DWORD)result)
        break;
      if (v53)
      {
        v30 = v23[2];
        v31 = *(_QWORD *)(v19 + 16)
            - v30 * (((unint64_t)v23[3] * (unsigned __int128)*(unint64_t *)(v19 + 16)) >> 64);
        v32 = v31 - v30;
        if (v32 >= 0)
          v31 = v32;
        v33 = v26 + 32;
        v34 = v53;
        v35 = **v51 * v20;
        v36 = **(_DWORD **)(v26 + 24) * v20;
        do
        {
          v37 = (unint64_t)v51[v35 + 1];
          v38 = (v37 * (unsigned __int128)(unint64_t)v31) >> 64;
          v39 = v37 * v31;
          v40 = v23[4];
          v41 = ((unint64_t)v39 * (unsigned __int128)v40) >> 64;
          v42 = (v38 * (unsigned __int128)v40) >> 64;
          v43 = v38 * v40;
          v25 = __CFADD__(v41, v43);
          v44 = v41 + v43;
          v45 = v25;
          v46 = v45
              + __CFADD__(v39 * v23[5], v44)
              + v42
              + v23[5] * v38
              + (((unint64_t)v39 * (unsigned __int128)(unint64_t)v23[5]) >> 64);
          v47 = v23[2];
          v48 = v39 - v46 * v47;
          if (v48 - v47 >= 0)
            v48 -= v47;
          v49 = v48 + *(_QWORD *)(v33 + 8 * v36);
          if (v49 - v47 >= 0)
            v49 -= v47;
          *(_QWORD *)(v33 + 8 * v36) = v49;
          ++v35;
          ++v36;
          --v34;
        }
        while (v34);
      }
      if (++v20 == v21)
      {
        result = 0;
        break;
      }
    }
    v15 = v50;
  }
  else
  {
    result = 0;
  }
  *(_QWORD *)(a1 + 16) = v15;
  return result;
}

uint64_t cche_relin_key_generate(uint64_t *a1, unsigned int **a2, unsigned int *a3, int a4, uint64_t a5, uint64_t (**a6)(_QWORD, uint64_t, uint64_t))
{
  char v12;
  uint64_t v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t ws;
  _QWORD v30[4];
  void (*v31)(uint64_t);
  char v32;

  v12 = 0;
  v32 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v12 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v12 = 1;
    }
  }
  v32 = v12;
  v18 = cche_param_ctx_chain_const((uint64_t)a3);
  v19 = cche_param_ctx_polynomial_degree((uint64_t)a3);
  v20 = v19;
  v21 = *(unsigned int *)(v18 + 12);
  v22 = CCPOLYZP_PO2CYC_WORKSPACE_N(v19, *(_DWORD *)(v18 + 12));
  v23 = CCHE_ENCRYPT_ZERO_SYMMETRIC_EVAL_WORKSPACE_N(v20, v21);
  v30[0] = cc_malloc_clear(8 * (v23 + v22));
  v24 = cche_param_ctx_polynomial_degree((uint64_t)a3);
  v25 = v24;
  v26 = *(unsigned int *)(v18 + 12);
  v27 = CCPOLYZP_PO2CYC_WORKSPACE_N(v24, v26);
  v30[1] = CCHE_ENCRYPT_ZERO_SYMMETRIC_EVAL_WORKSPACE_N(v25, v26) + v27;
  v30[2] = 0;
  v30[3] = cc_ws_alloc;
  v31 = cc_ws_free;
  if (v30[0])
  {
    ws = cche_relin_key_generate_ws((uint64_t)v30, a1, a2, a3, a4, a5, a6);
    v31((uint64_t)v30);
  }
  else
  {
    ws = 4294967283;
  }
  cc_disable_dit(&v32);
  return ws;
}

uint64_t cche_relin_key_save_ws(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8;
  unsigned int *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unint64_t v14;
  uint64_t result;

  v8 = cche_param_ctx_chain_const(*a4);
  if (*(_DWORD *)(v8 + 12) < 2u)
    return 4294967289;
  v9 = (unsigned int *)(v8 + 8);
  v10 = cche_param_ctx_ciphertext_ctx_nmoduli(*a4);
  v11 = ccpolyzp_po2cyc_serialize_poly_nbytes(v9, 0);
  if (v11 * v10 != a2)
    return 4294967289;
  if (!v10)
    return 0;
  v12 = v11;
  v13 = 0;
  while (1)
  {
    v14 = cche_relin_key_ciphertext(a4, v13);
    result = ccpolyzp_po2cyc_serialize_poly_ws(a1, v12, a3, 0, (unsigned int **)(v14 + 24));
    if ((_DWORD)result)
      break;
    a3 += v12;
    if (v10 == ++v13)
      return 0;
  }
  return result;
}

uint64_t cche_relin_key_save(int a1, uint64_t a2, uint64_t *a3)
{
  char v6;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  uint64_t v15;
  _QWORD v17[4];
  void (*v18)(uint64_t);
  char v19;

  v6 = 0;
  v19 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v6 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v6 = 1;
    }
  }
  v19 = v6;
  v12 = cche_param_ctx_polynomial_degree(*a3);
  v13 = CCPOLYZP_PO2CYC_SERIALIZE_POLY_WORKSPACE_N(v12);
  v17[0] = cc_malloc_clear(8 * v13);
  v14 = cche_param_ctx_polynomial_degree(*a3);
  v17[1] = CCPOLYZP_PO2CYC_SERIALIZE_POLY_WORKSPACE_N(v14);
  v17[2] = 0;
  v17[3] = cc_ws_alloc;
  v18 = cc_ws_free;
  if (v17[0])
  {
    v15 = cche_relin_key_save_ws((uint64_t)v17, a1, a2, a3);
    v18((uint64_t)v17);
  }
  else
  {
    v15 = 4294967283;
  }
  cc_disable_dit(&v19);
  return v15;
}

uint64_t cche_relin_key_load_ws(uint64_t a1, uint64_t *a2, uint64_t a3, int a4, uint64_t a5, int a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  uint64_t v15;
  unsigned int v17;
  unint64_t v18;
  unsigned int v19;
  _DWORD **v20;
  uint64_t v21;
  uint64_t i;
  _DWORD *v23;
  uint64_t result;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;

  v11 = a3;
  v12 = cche_param_ctx_chain_const(a3);
  if (*(_DWORD *)(v12 + 12) < 2u)
    return 4294967289;
  v13 = (unsigned int *)(v12 + 8);
  v14 = cche_param_ctx_ciphertext_ctx_nmoduli(v11);
  v15 = ccpolyzp_po2cyc_serialize_poly_nbytes(v13, 0);
  v27 = cche_rng_seed_sizeof();
  if (v15 * v14 != a4 || v27 * v14 != a6)
    return 4294967289;
  *a2 = v11;
  if (!v14)
    return 0;
  v17 = 0;
  v26 = v14;
  v25 = v11;
  while (1)
  {
    v18 = cche_relin_key_ciphertext(a2, v17);
    v19 = cche_ciphertext_fresh_npolys();
    *(_QWORD *)v18 = v11;
    *(_DWORD *)(v18 + 8) = v19;
    *(_QWORD *)(v18 + 16) = 1;
    *(_QWORD *)(v18 + 24) = v13;
    v20 = (_DWORD **)(v18 + 24);
    if (v19 >= 2)
    {
      v21 = v19;
      for (i = 1; i != v21; ++i)
      {
        v23 = *v20;
        v20[((v23[1] * *v23) + ((unint64_t)(sizeof_struct_ccpolyzp_po2cyc() + 7) >> 3)) * i] = v13;
      }
    }
    result = cche_deserialize_seeded_ciphertext_eval_ws(a1, v18, v15, a5, a7);
    if ((_DWORD)result)
      break;
    a7 += v27;
    a5 += v15;
    ++v17;
    v11 = v25;
    if (v17 == v26)
      return 0;
  }
  return result;
}

uint64_t cche_relin_key_load(uint64_t *a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6)
{
  char v12;
  unsigned int v18;
  unint64_t v19;
  unsigned int v20;
  uint64_t ws;
  _QWORD v23[4];
  void (*v24)(uint64_t);
  char v25;

  v12 = 0;
  v25 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v12 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v12 = 1;
    }
  }
  v25 = v12;
  v18 = cche_param_ctx_polynomial_degree(a2);
  v19 = CCHE_DESERIALIZE_SEEDED_CIPHERTEXT_EVAL_WORKSPACE_N(v18);
  v23[0] = cc_malloc_clear(8 * v19);
  v20 = cche_param_ctx_polynomial_degree(a2);
  v23[1] = CCHE_DESERIALIZE_SEEDED_CIPHERTEXT_EVAL_WORKSPACE_N(v20);
  v23[2] = 0;
  v23[3] = cc_ws_alloc;
  v24 = cc_ws_free;
  if (v23[0])
  {
    ws = cche_relin_key_load_ws((uint64_t)v23, a1, a2, a3, a4, a5, a6);
    v24((uint64_t)v23);
  }
  else
  {
    ws = 4294967283;
  }
  cc_disable_dit(&v25);
  return ws;
}

_BYTE *ccz_lsr(uint64_t a1, uint64_t a2, unint64_t a3)
{
  char v6;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;

  v6 = 0;
  v21 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v6 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v6 = 1;
    }
  }
  v21 = v6;
  v12 = ccz_n(a2);
  v13 = ccn_bitlen(v12, *(unint64_t **)(a2 + 24));
  v14 = v13 - a3;
  if (v13 <= a3)
  {
    ccz_zero((_QWORD *)a1);
  }
  else
  {
    v15 = a3 >> 6;
    v16 = ccz_sign(a2);
    ccz_set_sign(a1, v16);
    v17 = ccz_n(a2);
    ccz_set_capacity(a1, v17 - (a3 >> 6));
    if ((a3 & 0x3F) != 0)
    {
      v18 = ccz_n(a2);
      ccn_shift_right(v18 - v15, *(int8x16_t **)(a1 + 24), (int8x16_t *)(*(_QWORD *)(a2 + 24) + 8 * v15), a3 & 0x3F);
    }
    else if (a1 != a2 || a3 >= 0x40)
    {
      v19 = ccz_n(a2);
      ccn_set(v19 - v15, *(void **)(a1 + 24), (void *)(*(_QWORD *)(a2 + 24) + 8 * v15));
    }
    ccz_set_n((_QWORD *)a1, (v14 + 63) >> 6);
  }
  return cc_disable_dit(&v21);
}

uint64_t ccrsa_pubkeylength(uint64_t a1)
{
  char v1;
  uint64_t v7;
  char v9;

  v1 = 0;
  v9 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v1 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v1 = 1;
    }
  }
  v9 = v1;
  v7 = cczp_bitlen(a1);
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccsiv_hmac_context_size(uint64_t *a1)
{
  char v1;
  uint64_t v7;
  char v9;

  v1 = 0;
  v9 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v1 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v1 = 1;
    }
  }
  v9 = v1;
  v7 = *a1;
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccsiv_hmac_block_size(uint64_t a1)
{
  char v1;
  uint64_t v7;
  char v9;

  v1 = 0;
  v9 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v1 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v1 = 1;
    }
  }
  v9 = v1;
  v7 = *(_QWORD *)(a1 + 8);
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccsiv_hmac_ciphertext_size(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v8;
  char v10;

  v2 = 0;
  v10 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v2 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v2 = 1;
    }
  }
  v10 = v2;
  v8 = *(_QWORD *)(a1 + 16) + a2;
  cc_disable_dit(&v10);
  return v8;
}

unint64_t ccsiv_hmac_plaintext_size(uint64_t a1, unint64_t a2)
{
  char v2;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  char v12;

  v2 = 0;
  v12 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v2 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v2 = 1;
    }
  }
  v12 = v2;
  v8 = *(_QWORD *)(a1 + 16);
  _CF = a2 >= v8;
  v9 = a2 - v8;
  if (_CF)
    v10 = v9;
  else
    v10 = 0;
  cc_disable_dit(&v12);
  return v10;
}

uint64_t ccsiv_hmac_init(uint64_t a1)
{
  char v1;
  uint64_t v7;
  char v9;

  v1 = 0;
  v9 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v1 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v1 = 1;
    }
  }
  v9 = v1;
  v7 = (*(uint64_t (**)(void))(a1 + 16))();
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccsiv_hmac_aad(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v4;
  uint64_t v10;
  char v12;

  v4 = 0;
  v12 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v4 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v4 = 1;
    }
  }
  v12 = v4;
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4);
  cc_disable_dit(&v12);
  return v10;
}

uint64_t ccsiv_hmac_set_nonce(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v4;
  uint64_t v10;
  char v12;

  v4 = 0;
  v12 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v4 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v4 = 1;
    }
  }
  v12 = v4;
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, a3, a4);
  cc_disable_dit(&v12);
  return v10;
}

uint64_t ccsiv_hmac_crypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v5;
  uint64_t v11;
  char v13;

  v5 = 0;
  v13 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v5 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v5 = 1;
    }
  }
  v13 = v5;
  v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40))(a2, a3, a4, a5);
  cc_disable_dit(&v13);
  return v11;
}

uint64_t ccsiv_hmac_reset(uint64_t a1, uint64_t a2)
{
  char v2;
  uint64_t v8;
  char v10;

  v2 = 0;
  v10 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v2 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v2 = 1;
    }
  }
  v10 = v2;
  v8 = (*(uint64_t (**)(uint64_t))(a1 + 48))(a2);
  cc_disable_dit(&v10);
  return v8;
}

uint64_t ccsiv_hmac_one_shot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, unsigned int a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  char v16;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  _BYTE v26[7];
  char v27;
  uint64_t v28;

  v16 = 0;
  v28 = *MEMORY[0x24BDB0D28];
  v27 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v16 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v16 = 1;
    }
  }
  v27 = v16;
  MEMORY[0x24BDB0C10](a1);
  v23 = &v26[-v22];
  v24 = (*(uint64_t (**)(uint64_t, _BYTE *))(a1 + 16))(a1, &v26[-v22]);
  if (!(_DWORD)v24)
  {
    if (!a7 || (v24 = (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t))(a1 + 32))(v23, a7, a8), !(_DWORD)v24))
    {
      if (!a5 || (v24 = (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t))(a1 + 24))(v23, a5, a6), !(_DWORD)v24))
      {
        v24 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(a1 + 40))(v23, a9, a10, a11);
        if (!(_DWORD)v24)
          cc_clear(*(_QWORD *)a1, v23);
      }
    }
  }
  cc_disable_dit(&v27);
  return v24;
}

uint64_t fipspost_post_aes_cmac(char a1)
{
  _QWORD *v2;
  char *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v12;
  int v13;
  int v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDB0D28];
  v2 = ccaes_cbc_encrypt_mode();
  v14 = 0;
  if (cccmac_one_shot_generate(v2, 16, (uint64_t)"\xE4\xB7\x64[/}c\xB4gL\xD0\x19p\xC9\xD1\xEC\xF2\x66\xA1\x87", 0, (char *)&unk_2218B304D, 4uLL, &v14))
  {
    mach_absolute_time();
    printf("FIPSPOST_USER [%llu] %s:%d: FAILED: failed cccmac_one_shot_generate COUNT #0: %d\n");
    return 4294967224;
  }
  v4 = "\x01\xF2\x66\xA1\x87";
  if ((a1 & 0x10) == 0)
    v4 = "\xF2\x66\xA1\x87";
  if (*(_DWORD *)v4 != v14)
  {
    v5 = mach_absolute_time();
    v6 = 56;
LABEL_8:
    printf("FIPSPOST_USER [%llu] %s:%d: FAILED: failed AES-CMAC KAT\n", v5, "fipspost_post_aes_cmac", v6);
    return 4294967221;
  }
  v13 = 0;
  {
    mach_absolute_time();
    printf("FIPSPOST_USER [%llu] %s:%d: FAILED: failed cccmac_one_shot_generate COUNT #32: %d\n");
    return 4294967224;
  }
  v7 = "\x01\xFB\xFE\xA4\x1B";
  if ((a1 & 0x10) == 0)
    v7 = "\xFB\xFE\xA4\x1B";
  if (*(_DWORD *)v7 != v13)
  {
    v5 = mach_absolute_time();
    v6 = 95;
    goto LABEL_8;
  }
  *(_QWORD *)((char *)v15 + 7) = 0;
  v15[0] = 0;
  if (cccmac_one_shot_generate(v2, 16, (uint64_t)"\x18tYlݽ\xF1\x8A\x10\xBCq\xD6\x0Ck\xB9=", 0x25uLL, "\x12\xA3@\xEF\x01\x5D\xC0\xA3\x86%\xA4\x84~\xB6\xCA\xC9ʹE\x05H\xE9\xF9\x64\x02ue1\xA6\xA5\xBF\x9C7\xC1\x46\xBB\x01", 0xFuLL, v15))
  {
    mach_absolute_time();
    printf("FIPSPOST_USER [%llu] %s:%d: FAILED: failed cccmac_one_shot_generate COUNT #79: %d\n");
    return 4294967224;
  }
  v8 = "\x01&\xA5\xFD%\x80Q)uk[\x1A\xC3\x3D\x87t";
  if ((a1 & 0x10) == 0)
    v8 = "&\xA5\xFD%\x80Q)uk[\x1A\xC3\x3D\x87t";
  v9 = *(_QWORD *)v8;
  v10 = *(_QWORD *)(v8 + 7);
  if (v9 != v15[0] || v10 != *(_QWORD *)((char *)v15 + 7))
  {
    v5 = mach_absolute_time();
    v6 = 134;
    goto LABEL_8;
  }
  if ((a1 & 0x10) != 0)
    v12 = "\x01\xD4\xD7\xFC\xC5\xF9y#\x0F";
  else
    v12 = "\xD4\xD7\xFC\xC5\xF9y#\x0F";
  if (cccmac_one_shot_verify(v2, 16, (uint64_t)"rV\xE3\x44\xF6\x8B>\x7F\x9D\xD6\xE0L\\e\x13\\", 0, (char *)&unk_2218B304D, 8, v12))
  {
    mach_absolute_time();
    printf("FIPSPOST_USER [%llu] %s:%d: FAILED: failed cccmac_one_shot_verify COUNT #2: %d\n");
    return 4294967224;
  }
  if (!cccmac_one_shot_verify(v2, 16, (uint64_t)"e\x83\xA4\xFF'\xB6\xE1\x09\x04m\x11\xB9w\xC8\x29=", 0x20uLL, "\xB6;\xE3\x20\xF9.\x01&\x0F\xBA71\"$IJ'd\xDF\xC9((|u\xDC\x1C\xAF\xEE\x7B\x69\x8DH",
                        8,
                        "\xFA\f\xCE\xD2.\x89k@"))
  {
    mach_absolute_time();
    printf("FIPSPOST_USER [%llu] %s:%d: FAILED: failed cccmac_one_shot_verify COUNT #47: %d\n");
    return 4294967224;
  }
  if (!cccmac_one_shot_verify(v2, 16, (uint64_t)"\xED\xFE\x2E\x15\xED\xF0\xB0\u0088ue\x1DK\xEC\xFC\xA5", 0x40uLL, aP_1, 8, "{ps\x02\x19\x90}\x18"))
  {
    mach_absolute_time();
    printf("FIPSPOST_USER [%llu] %s:%d: FAILED: failed cccmac_one_shot_verify COUNT #89: %d\n");
    return 4294967224;
  }
  return 0;
}

uint64_t ccn_read_uint(unint64_t a1, _QWORD *a2, unint64_t a3, unsigned __int8 *a4)
{
  char v4;
  unint64_t v10;
  int v11;
  unint64_t v12;
  unsigned __int8 *v13;
  int v14;
  uint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char v22;

  v4 = 0;
  v22 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v4 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v4 = 1;
    }
  }
  v22 = v4;
  v10 = 8 * a1;
  if (a3 > 8 * a1)
  {
    v11 = 0;
    v12 = a3 - v10;
    v13 = a4;
    do
    {
      v14 = *v13++;
      v11 |= v14;
      --a3;
    }
    while (a3 > v10);
    if (v11)
    {
      v15 = 4294967289;
      goto LABEL_24;
    }
    a4 += v12;
    a3 = 8 * a1;
  }
  if (a3 < 8)
  {
    v16 = 0;
  }
  else
  {
    v16 = ((a3 - 8) >> 3) + 1;
    v17 = a2;
    v18 = v16;
    do
    {
      *v17++ = bswap64(*(_QWORD *)&a4[a3 - 8]);
      a3 -= 8;
      --v18;
    }
    while (v18);
  }
  if (a3)
  {
    v19 = 0;
    v20 = -(uint64_t)a3;
    do
      v19 = a4[a3 + v20] | (v19 << 8);
    while (!__CFADD__(v20++, 1));
    a2[v16++] = v19;
  }
  if (v16 < a1)
    bzero(&a2[v16], v10 - 8 * v16);
  v15 = 0;
LABEL_24:
  cc_disable_dit(&v22);
  return v15;
}

void *ccaes_cfb_encrypt_mode()
{
  return &ccaes_arm_cfb_encrypt_mode;
}

uint64_t ccdh_ctx_init(uint64_t result, _QWORD *a2)
{
  *a2 = result;
  return result;
}

uint64_t ccdh_ccn_size(_QWORD *a1)
{
  return 8 * *a1;
}

uint64_t ccdh_export_pub_size(_QWORD **a1)
{
  return 8 * **a1;
}

uint64_t ccdh_gp_g(_QWORD *a1)
{
  return (uint64_t)&a1[*a1 + 4 + *a1];
}

uint64_t ccdh_gp_order(_QWORD *a1)
{
  return (uint64_t)&a1[*a1 + 4 + *a1 + *a1];
}

uint64_t ccdh_gp_l(_QWORD *a1)
{
  return a1[*a1 + 4 + *a1 + *a1 + *a1];
}

unint64_t ccdh_gp_order_bitlen(_QWORD *a1)
{
  uint64_t v2;

  v2 = cczp_n((uint64_t)a1);
  return ccn_bitlen(v2, &a1[*a1 + 4 + *a1 + *a1]);
}

double fe_0(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

double fe_1(uint64_t a1)
{
  double result;

  *(_DWORD *)a1 = 1;
  result = 0.0;
  *(_OWORD *)(a1 + 4) = 0u;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_DWORD *)(a1 + 36) = 0;
  return result;
}

int32x4_t fe_add(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int32x4_t result;
  int32x4_t v4;
  int32x2_t v5;

  result = vaddq_s32(*(int32x4_t *)a3, *(int32x4_t *)a2);
  v4 = vaddq_s32(*(int32x4_t *)(a3 + 16), *(int32x4_t *)(a2 + 16));
  v5 = vadd_s32(*(int32x2_t *)(a3 + 32), *(int32x2_t *)(a2 + 32));
  *(int32x4_t *)a1 = result;
  *(int32x4_t *)(a1 + 16) = v4;
  *(int32x2_t *)(a1 + 32) = v5;
  return result;
}

uint64_t fe_cmov(uint64_t *a1, uint64_t *a2, char a3)
{
  return ccn_mux(5, a3, a1, a2, a1);
}

__n128 fe_copy(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  uint64_t v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 32) = v4;
  return result;
}

uint64_t fe_invert(_DWORD *a1, int *a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  _OWORD v13[2];
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  _OWORD v17[2];
  uint64_t v18;
  _OWORD v19[2];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDB0D28];
  v20 = 0;
  memset(v19, 0, sizeof(v19));
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  v16 = 0;
  memset(v15, 0, sizeof(v15));
  fe_sq(v19, a2);
  fe_sq(v17, (int *)v19);
  fe_sq(v17, (int *)v17);
  fe_mul(v17, a2, (int *)v17);
  fe_mul(v19, (int *)v19, (int *)v17);
  fe_sq(v15, (int *)v19);
  fe_mul(v17, (int *)v17, (int *)v15);
  fe_sq(v15, (int *)v17);
  v4 = 4;
  do
  {
    fe_sq(v15, (int *)v15);
    --v4;
  }
  while (v4);
  fe_mul(v17, (int *)v15, (int *)v17);
  fe_sq(v15, (int *)v17);
  v5 = 9;
  do
  {
    fe_sq(v15, (int *)v15);
    --v5;
  }
  while (v5);
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  fe_mul(v15, (int *)v15, (int *)v17);
  fe_sq(v13, (int *)v15);
  v6 = 19;
  do
  {
    fe_sq(v13, (int *)v13);
    --v6;
  }
  while (v6);
  fe_mul(v15, (int *)v13, (int *)v15);
  fe_sq(v15, (int *)v15);
  v7 = 9;
  do
  {
    fe_sq(v15, (int *)v15);
    --v7;
  }
  while (v7);
  fe_mul(v17, (int *)v15, (int *)v17);
  fe_sq(v15, (int *)v17);
  v8 = 49;
  do
  {
    fe_sq(v15, (int *)v15);
    --v8;
  }
  while (v8);
  fe_mul(v15, (int *)v15, (int *)v17);
  fe_sq(v13, (int *)v15);
  v9 = 99;
  do
  {
    fe_sq(v13, (int *)v13);
    --v9;
  }
  while (v9);
  fe_mul(v15, (int *)v13, (int *)v15);
  fe_sq(v15, (int *)v15);
  v10 = 49;
  do
  {
    fe_sq(v15, (int *)v15);
    --v10;
  }
  while (v10);
  fe_mul(v17, (int *)v15, (int *)v17);
  fe_sq(v17, (int *)v17);
  v11 = 4;
  do
  {
    fe_sq(v17, (int *)v17);
    --v11;
  }
  while (v11);
  return fe_mul(a1, (int *)v17, (int *)v19);
}

_DWORD *fe_sq(_DWORD *result, int *a2)
{
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
  unint64_t v37;
  unint64_t v38;

  v3 = a2[4];
  v2 = a2[5];
  v5 = a2[6];
  v4 = a2[7];
  v6 = 19 * (int)v5;
  v7 = *a2;
  v8 = a2[1];
  v9 = 38 * (int)v4;
  v11 = a2[8];
  v10 = a2[9];
  v12 = 19 * (int)v11;
  v13 = a2[2];
  v14 = a2[3];
  v15 = 2 * v7;
  v16 = 2 * v13;
  v17 = 2 * v14;
  v18 = 38 * (int)v10;
  v19 = 2 * v7 * v8;
  v20 = 2 * v8 * v13;
  v21 = 38 * (int)v2 * (uint64_t)(int)v2
      + (int)v7 * (uint64_t)(int)v7
      + v6 * 2 * v3
      + v9 * 2 * v14
      + v12 * 2 * v13
      + v18 * 2 * v8;
  v22 = 2 * v8 * v8 + v13 * 2 * v7;
  v23 = 2 * v14 * 2 * v8 + (int)v13 * (uint64_t)(int)v13 + v3 * 2 * v7 + v9 * v4 + 2 * v5 * v12 + v18 * 2 * v2;
  v24 = v19 + v6 * 2 * v2 + v9 * v3 + v12 * 2 * v14 + v18 * v13 + ((v21 + 0x2000000) >> 26);
  v25 = 2 * v13 * v14 + v3 * 2 * v8 + v2 * v15 + v12 * 2 * v4 + v18 * v5 + ((v23 + 0x2000000) >> 26);
  v26 = v22 + v6 * v5 + v9 * 2 * v2 + v12 * 2 * v3 + v18 * 2 * v14 + ((v24 + 0x1000000) >> 25);
  v27 = v20 + v14 * v15;
  v28 = v3 * v16 + 2 * v14 * v14 + 2 * v2 * 2 * v8 + v5 * v15 + v12 * v11 + v18 * 2 * v4 + ((v25 + 0x1000000) >> 25);
  v29 = v27 + v9 * v5 + v12 * 2 * v2 + v18 * v3 + ((v26 + 0x2000000) >> 26);
  LODWORD(v12) = v26 - ((v26 + 0x2000000) & 0xFC000000);
  v30 = 2 * v3 * v2;
  v31 = v17 * v3 + v2 * v16;
  v32 = v5 * v16 + (int)v3 * (uint64_t)(int)v3 + 2 * v2 * v17;
  v33 = v31 + v5 * 2 * v8 + v4 * v15 + v18 * v11 + ((v28 + 0x2000000) >> 26);
  v34 = v30 + v5 * v17 + v4 * v16 + v11 * 2 * v8;
  v35 = v32 + 2 * v4 * 2 * v8 + v11 * v15 + v18 * v10 + ((v33 + 0x1000000) >> 25);
  v36 = v34 + v10 * v15 + ((v35 + 0x2000000) >> 26);
  v37 = v21 - ((v21 + 0x2000000) & 0xFFFFFFFFFC000000) + 19 * ((v36 + 0x1000000) >> 25);
  *result = v37 - ((v37 + 0x2000000) & 0xFC000000);
  result[1] = v24 - ((v24 + 0x1000000) & 0xFE000000) + ((v37 + 0x2000000) >> 26);
  v38 = v23 - ((v23 + 0x2000000) & 0xFFFFFFFFFC000000) + ((v29 + 0x1000000) >> 25);
  result[2] = v12;
  result[3] = v29 - ((v29 + 0x1000000) & 0xFE000000);
  result[4] = v38 - ((v38 + 0x2000000) & 0xFC000000);
  result[5] = v25 - ((v25 + 0x1000000) & 0xFE000000) + ((v38 + 0x2000000) >> 26);
  result[6] = v28 - ((v28 + 0x2000000) & 0xFC000000);
  result[7] = v33 - ((v33 + 0x1000000) & 0xFE000000);
  result[8] = v35 - ((v35 + 0x2000000) & 0xFC000000);
  result[9] = v36 - ((v36 + 0x1000000) & 0xFE000000);
  return result;
}

uint64_t fe_mul(_DWORD *a1, int *a2, int *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
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
  uint64_t result;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;

  v4 = a2[8];
  v5 = a3[1];
  v6 = 2 * a2[9];
  v7 = a2[9];
  v9 = a3[2];
  v8 = a3[3];
  v10 = 19 * v9;
  v11 = 19 * (int)v8;
  v12 = a3[4];
  v81 = a3[5];
  v13 = 19 * v12;
  v14 = 19 * (int)v81;
  v16 = a2[2];
  v15 = a2[3];
  v82 = a2[1];
  v17 = a2[4];
  v18 = a2[5];
  v19 = a2[6];
  v20 = a2[7];
  v71 = 2 * v15;
  v72 = 2 * v18;
  v21 = 19 * v5 * v6 + *a3 * (uint64_t)*a2 + v10 * v4 + v11 * 2 * v20;
  v22 = *a3 * (uint64_t)(int)v82 + (int)v5 * (uint64_t)*a2 + v10 * v7 + v11 * v4;
  v23 = v5 * 2 * v82 + *a3 * (uint64_t)(int)v16 + v9 * (uint64_t)*a2 + v11 * v6;
  v24 = v21 + v13 * v19 + v14 * 2 * v18;
  v25 = v5 * 2 * v15
      + *a3 * (uint64_t)(int)v17
      + v9 * (uint64_t)(int)v16
      + v8 * 2 * v82
      + v12 * (uint64_t)*a2
      + v14 * 2 * v7;
  v79 = v15;
  v26 = v22 + v13 * v20 + v14 * v19;
  v80 = v23 + v13 * v4 + v14 * 2 * v20;
  v27 = *a3 * (uint64_t)(int)v15
      + (int)v5 * (uint64_t)(int)v16
      + v9 * (uint64_t)(int)v82
      + (int)v8 * (uint64_t)*a2
      + v13 * v7
      + v14 * v4;
  LODWORD(v23) = a3[6];
  v28 = a3[7];
  v29 = 19 * (int)v23;
  v30 = v24 + v29 * v17;
  v31 = v25 + v29 * v4;
  v75 = v18;
  v32 = v26 + v29 * v18;
  v33 = *a3 * (uint64_t)(int)v18
      + (int)v5 * (uint64_t)(int)v17
      + v9 * (uint64_t)(int)v15
      + (int)v8 * (uint64_t)(int)v16
      + v12 * (uint64_t)(int)v82
      + (int)v81 * (uint64_t)*a2
      + v29 * a2[9];
  v34 = a2[9];
  v35 = v80 + v29 * v19;
  v36 = v27 + v29 * v20;
  v37 = 19 * (int)v28;
  v74 = v31 + v37 * 2 * v20;
  v76 = v32 + v37 * v17;
  v77 = v30 + v37 * v71;
  v38 = v33 + v37 * v4;
  v78 = v35 + v37 * v72;
  v39 = v5 * v72
      + *a3 * (uint64_t)(int)v19
      + v9 * (uint64_t)(int)v17
      + v8 * v71
      + v12 * (uint64_t)(int)v16
      + v81 * 2 * v82
      + (int)v23 * (uint64_t)*a2
      + v37 * 2 * v34;
  v73 = v36 + v37 * v19;
  LODWORD(v37) = a3[8];
  LODWORD(v80) = a3[9];
  v40 = 19 * (int)v37;
  v41 = 19 * (int)v80;
  v42 = v39 + v40 * v4 + v41 * 2 * v20;
  v43 = v5 * 2 * v20 + *a3 * (uint64_t)(int)v4;
  v44 = v38 + v40 * v20;
  v45 = *a3 * (uint64_t)(int)v34 + (int)v5 * (uint64_t)(int)v4 + v9 * (uint64_t)(int)v20;
  v46 = *a3 * (uint64_t)(int)v20 + (int)v5 * (uint64_t)(int)v19 + v9 * (uint64_t)(int)v75;
  v47 = v74 + v40 * v19 + v41 * v72;
  v48 = v43 + v9 * (uint64_t)(int)v19 + v8 * v72;
  v49 = v44 + v41 * v19;
  v50 = v45 + (int)v8 * (uint64_t)(int)v19;
  v51 = v46
      + (int)v8 * (uint64_t)(int)v17
      + v12 * (uint64_t)(int)v79
      + (int)v81 * (uint64_t)(int)v16
      + (int)v23 * (uint64_t)(int)v82
      + (int)v28 * (uint64_t)*a2
      + v40 * v34;
  v52 = v77 + v40 * v16;
  v53 = v76 + v40 * v79;
  v54 = v50 + v12 * (uint64_t)(int)v75;
  v55 = v78 + v40 * v17 + v41 * v71;
  v56 = v73 + v40 * v75 + v41 * v17;
  v57 = v51 + v41 * v4;
  v58 = v52 + v41 * 2 * v82;
  v59 = v48
      + v12 * (uint64_t)(int)v17
      + v81 * v71
      + (int)v23 * (uint64_t)(int)v16
      + v28 * 2 * v82
      + (int)v37 * (uint64_t)*a2
      + v41 * 2 * v34;
  result = 0x2000000;
  v61 = v53 + v41 * v16 + ((v58 + 0x2000000) >> 26);
  v62 = v49 + ((v47 + 0x2000000) >> 26);
  v63 = v55 + ((v61 + 0x1000000) >> 25);
  v64 = v42 + ((v62 + 0x1000000) >> 25);
  v65 = v56 + ((v63 + 0x2000000) >> 26);
  v66 = v57 + ((v64 + 0x2000000) >> 26);
  v67 = v59 + ((v66 + 0x1000000) >> 25);
  v68 = v54
      + (int)v81 * (uint64_t)(int)v17
      + (int)v23 * (uint64_t)(int)v79
      + (int)v28 * (uint64_t)(int)v16
      + (int)v37 * (uint64_t)(int)v82
      + (int)v80 * (uint64_t)*a2
      + ((v67 + 0x2000000) >> 26);
  v69 = v58 - ((v58 + 0x2000000) & 0xFFFFFFFFFC000000) + 19 * ((v68 + 0x1000000) >> 25);
  *a1 = v69 - ((v69 + 0x2000000) & 0xFC000000);
  a1[1] = v61 - ((v61 + 0x1000000) & 0xFE000000) + ((v69 + 0x2000000) >> 26);
  v70 = v47 - ((v47 + 0x2000000) & 0xFFFFFFFFFC000000) + ((v65 + 0x1000000) >> 25);
  a1[2] = v63 - ((v63 + 0x2000000) & 0xFC000000);
  a1[3] = v65 - ((v65 + 0x1000000) & 0xFE000000);
  a1[4] = v70 - ((v70 + 0x2000000) & 0xFC000000);
  a1[5] = v62 - ((v62 + 0x1000000) & 0xFE000000) + ((v70 + 0x2000000) >> 26);
  a1[6] = v64 - ((v64 + 0x2000000) & 0xFC000000);
  a1[7] = v66 - ((v66 + 0x1000000) & 0xFE000000);
  a1[8] = v67 - ((v67 + 0x2000000) & 0xFC000000);
  a1[9] = v68 - ((v68 + 0x1000000) & 0xFE000000);
  return result;
}

uint64_t fe_isnegative(_DWORD *a1)
{
  _BYTE v2[32];
  uint64_t v3;

  v3 = *MEMORY[0x24BDB0D28];
  fe_tobytes((uint64_t)v2, a1);
  return v2[0] & 1;
}

uint64_t fe_tobytes(uint64_t result, _DWORD *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;

  v2 = a2[1];
  v3 = a2[2];
  v4 = a2[3];
  v5 = a2[4];
  v6 = a2[5];
  v7 = a2[6];
  v8 = a2[7];
  v9 = a2[8];
  v10 = a2[9];
  v11 = *a2
      + 19
      * ((v10
        + ((v9
          + ((v8
            + ((v7
              + ((v6
                + ((v5 + ((v4 + ((v3 + ((v2 + ((*a2 + ((19 * v10 + 0x1000000) >> 25)) >> 26)) >> 25)) >> 26)) >> 25)) >> 26)) >> 25)) >> 26)) >> 25)) >> 26)) >> 25);
  v12 = v2 + (v11 >> 26);
  v13 = v3 + ((int)v12 >> 25);
  v14 = v4 + ((int)v13 >> 26);
  v15 = v5 + ((int)v14 >> 25);
  v16 = v6 + ((int)v15 >> 26);
  v17 = v7 + (v16 >> 25);
  v18 = v8 + ((int)v17 >> 26);
  v19 = v9 + ((int)v18 >> 25);
  v20 = v10 + ((int)v19 >> 26);
  *(_WORD *)result = v11;
  *(_BYTE *)(result + 2) = BYTE2(v11);
  *(_BYTE *)(result + 3) = HIBYTE(v11) & 3 | (4 * v12);
  *(_BYTE *)(result + 4) = v12 >> 6;
  *(_BYTE *)(result + 5) = v12 >> 14;
  *(_BYTE *)(result + 6) = (v12 >> 22) & 7 | (8 * v13);
  *(_BYTE *)(result + 7) = v13 >> 5;
  *(_BYTE *)(result + 8) = v13 >> 13;
  *(_BYTE *)(result + 9) = (v13 >> 21) & 0x1F | (32 * v14);
  *(_BYTE *)(result + 10) = v14 >> 3;
  *(_BYTE *)(result + 11) = v14 >> 11;
  *(_BYTE *)(result + 12) = (v14 >> 19) & 0x3F | ((_BYTE)v15 << 6);
  *(_BYTE *)(result + 13) = v15 >> 2;
  *(_BYTE *)(result + 14) = v15 >> 10;
  *(_BYTE *)(result + 15) = v15 >> 18;
  *(_WORD *)(result + 16) = v16;
  *(_BYTE *)(result + 18) = BYTE2(v16);
  *(_BYTE *)(result + 19) = HIBYTE(v16) & 1 | (2 * v17);
  *(_BYTE *)(result + 20) = v17 >> 7;
  *(_BYTE *)(result + 21) = v17 >> 15;
  *(_BYTE *)(result + 22) = (v17 >> 23) & 7 | (8 * v18);
  *(_BYTE *)(result + 23) = v18 >> 5;
  *(_BYTE *)(result + 24) = v18 >> 13;
  *(_BYTE *)(result + 25) = (v18 >> 21) & 0xF | (16 * v19);
  *(_BYTE *)(result + 26) = v19 >> 4;
  *(_BYTE *)(result + 27) = v19 >> 12;
  *(_BYTE *)(result + 28) = (v19 >> 20) & 0x3F | ((_BYTE)v20 << 6);
  *(_BYTE *)(result + 29) = v20 >> 2;
  *(_BYTE *)(result + 30) = v20 >> 10;
  *(_BYTE *)(result + 31) = (v20 >> 18) & 0x7F;
  return result;
}

uint64_t fe_isnonzero(_DWORD *a1)
{
  int8x16_t v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDB0D28];
  fe_tobytes((uint64_t)v2, a1);
  return crypto_verify_32(v2, zero);
}

uint64_t crypto_verify_32(int8x16_t *a1, int8x16_t *a2)
{
  int8x16_t v2;

  v2 = vorrq_s8(veorq_s8(*a2, *a1), veorq_s8(a2[1], a1[1]));
  *(int8x8_t *)v2.i8 = vorr_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
  return ((((v2.i8[0] | v2.i8[4] | ((v2.i32[0] | v2.i32[1]) >> 16) | ((unsigned __int16)(v2.i16[0] | v2.i16[2] | ((v2.i32[0] | v2.i32[1]) >> 16)) >> 8))
          - 1) >> 8) & 1)
       - 1;
}

_DWORD *fe_frombytes(_DWORD *result, unsigned int *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int v13;
  int v14;
  unint64_t v15;
  int v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  uint64_t v25;

  v2 = *((unsigned __int8 *)a2 + 6);
  v3 = (*((unsigned __int8 *)a2 + 4) << 6) | (*((unsigned __int8 *)a2 + 5) << 14) | ((_DWORD)v2 << 22);
  v4 = *((unsigned __int8 *)a2 + 12);
  v5 = *((unsigned __int8 *)a2 + 25);
  v6 = (unint64_t)(*((_BYTE *)a2 + 31) & 0x7F) << 18;
  v7 = v6 | (*((unsigned __int8 *)a2 + 30) << 10) | (4 * *((unsigned __int8 *)a2 + 29));
  v6 += 0x1000000;
  v8 = a2[4];
  v9 = *a2 + 19 * (v6 >> 25);
  v10 = (v2 << 22) + 0x1000000;
  v11 = v8 + 0x1000000;
  v12 = ((32 * *((unsigned __int8 *)a2 + 7)) | ((unint64_t)*((unsigned __int8 *)a2 + 8) << 13) | ((unint64_t)*((unsigned __int8 *)a2 + 9) << 21))
      + (v10 >> 25);
  LODWORD(v10) = v3 - (v10 & 0x7E000000) + ((unint64_t)(v9 + 0x2000000) >> 26);
  v13 = v9 - ((v9 + 0x2000000) & 0xFC000000);
  v14 = ((v12 + 0x2000000) >> 26)
      + ((8 * *((unsigned __int8 *)a2 + 10)) | (*((unsigned __int8 *)a2 + 11) << 11) | ((_DWORD)v4 << 19));
  v15 = (v4 << 19) + 0x1000000;
  v16 = v14 - (v15 & 0xE000000);
  v17 = ((4 * *((unsigned __int8 *)a2 + 13)) | ((unint64_t)*((unsigned __int8 *)a2 + 14) << 10) | ((unint64_t)*((unsigned __int8 *)a2 + 15) << 18))
      + (v15 >> 25);
  LODWORD(v9) = v8 - ((v8 + 0x1000000) & 0xFE000000) + ((v17 + 0x2000000) >> 26);
  v18 = *((unsigned __int8 *)a2 + 26);
  v19 = (((unint64_t)*((unsigned __int8 *)a2 + 20) << 7) | ((unint64_t)*((unsigned __int8 *)a2 + 21) << 15) | ((unint64_t)*((unsigned __int8 *)a2 + 22) << 23))
      + (v11 >> 25);
  v20 = ((v19 + 0x2000000) >> 26)
      + ((32 * *((unsigned __int8 *)a2 + 23)) | (*((unsigned __int8 *)a2 + 24) << 13) | ((_DWORD)v5 << 21));
  v21 = *((unsigned __int8 *)a2 + 27);
  v22 = *((unsigned __int8 *)a2 + 28);
  v23 = (v5 << 21) + 0x1000000;
  v24 = v20 - (v23 & 0x3E000000);
  *result = v13;
  result[1] = v10;
  v25 = ((16 * v18) | (v21 << 12) | (v22 << 20)) + (v23 >> 25);
  result[2] = v12 - ((v12 + 0x2000000) & 0xFC000000);
  result[3] = v16;
  result[4] = v17 - ((v17 + 0x2000000) & 0xFC000000);
  result[5] = v9;
  result[6] = v19 - ((v19 + 0x2000000) & 0xFC000000);
  result[7] = v24;
  result[8] = v25 - ((v25 + 0x2000000) & 0xFC000000);
  result[9] = v7 + ((unint64_t)(v25 + 0x2000000) >> 26) - (v6 & 0x2000000);
  return result;
}

int32x4_t fe_neg(uint64_t a1, uint64_t a2)
{
  int32x4_t result;
  int32x4_t v3;
  int32x2_t v4;

  result = vnegq_s32(*(int32x4_t *)a2);
  v3 = vnegq_s32(*(int32x4_t *)(a2 + 16));
  v4 = vneg_s32(*(int32x2_t *)(a2 + 32));
  *(int32x4_t *)a1 = result;
  *(int32x4_t *)(a1 + 16) = v3;
  *(int32x2_t *)(a1 + 32) = v4;
  return result;
}

uint64_t fe_pow22523(_DWORD *a1, int *a2)
{
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  _OWORD v12[2];
  uint64_t v13;
  _OWORD v14[2];
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDB0D28];
  v17 = 0;
  memset(v16, 0, sizeof(v16));
  v15 = 0;
  memset(v14, 0, sizeof(v14));
  fe_sq(v16, a2);
  fe_sq(v14, (int *)v16);
  fe_sq(v14, (int *)v14);
  fe_mul(v14, a2, (int *)v14);
  fe_mul(v16, (int *)v16, (int *)v14);
  fe_sq(v16, (int *)v16);
  fe_mul(v16, (int *)v14, (int *)v16);
  fe_sq(v14, (int *)v16);
  v4 = 4;
  do
  {
    fe_sq(v14, (int *)v14);
    --v4;
  }
  while (v4);
  fe_mul(v16, (int *)v14, (int *)v16);
  fe_sq(v14, (int *)v16);
  v5 = 9;
  do
  {
    fe_sq(v14, (int *)v14);
    --v5;
  }
  while (v5);
  v13 = 0;
  memset(v12, 0, sizeof(v12));
  fe_mul(v14, (int *)v14, (int *)v16);
  fe_sq(v12, (int *)v14);
  v6 = 19;
  do
  {
    fe_sq(v12, (int *)v12);
    --v6;
  }
  while (v6);
  fe_mul(v14, (int *)v12, (int *)v14);
  fe_sq(v14, (int *)v14);
  v7 = 9;
  do
  {
    fe_sq(v14, (int *)v14);
    --v7;
  }
  while (v7);
  fe_mul(v16, (int *)v14, (int *)v16);
  fe_sq(v14, (int *)v16);
  v8 = 49;
  do
  {
    fe_sq(v14, (int *)v14);
    --v8;
  }
  while (v8);
  fe_mul(v14, (int *)v14, (int *)v16);
  fe_sq(v12, (int *)v14);
  v9 = 99;
  do
  {
    fe_sq(v12, (int *)v12);
    --v9;
  }
  while (v9);
  fe_mul(v14, (int *)v12, (int *)v14);
  fe_sq(v14, (int *)v14);
  v10 = 49;
  do
  {
    fe_sq(v14, (int *)v14);
    --v10;
  }
  while (v10);
  fe_mul(v16, (int *)v14, (int *)v16);
  fe_sq(v16, (int *)v16);
  fe_sq(v16, (int *)v16);
  return fe_mul(a1, (int *)v16, a2);
}

_DWORD *fe_sq2(_DWORD *result, int *a2)
{
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
  unint64_t v50;
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
  unint64_t v62;
  unint64_t v63;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[4];
  v5 = a2[5];
  v7 = a2[6];
  v6 = a2[7];
  v8 = 19 * (int)v7;
  v9 = a2[2];
  v10 = a2[3];
  v12 = a2[8];
  v11 = a2[9];
  v13 = 2 * v2;
  v14 = 2 * v3;
  v15 = 2 * v9;
  v16 = 38 * (int)v6;
  v17 = 2 * v10;
  v18 = 2 * v5;
  v19 = 19 * (int)v12;
  v20 = 38 * (int)v11;
  v21 = 2 * v2 * v3;
  v22 = 38 * (int)v5 * (uint64_t)(int)v5 + (int)v2 * (uint64_t)(int)v2 + v8 * 2 * v4;
  v23 = 2 * v3 * v3 + v9 * v13 + v8 * v7;
  v24 = v21 + v8 * 2 * v5 + v16 * v4 + v19 * 2 * v10 + v20 * v9;
  v25 = 2 * v10 * v14 + (int)v9 * (uint64_t)(int)v9;
  v26 = v22 + v16 * 2 * v10;
  v27 = v23 + v16 * 2 * v5;
  v28 = v14 * v9 + v10 * v13 + v16 * v7;
  v29 = v25 + v4 * v13 + v16 * v6 + 2 * v7 * v19;
  v30 = v4 * v15 + 2 * v10 * v10;
  v31 = v27 + v19 * 2 * v4;
  v32 = v28 + v19 * 2 * v5;
  v33 = v15 * v10 + v4 * v14 + v5 * v13 + v19 * 2 * v6;
  v34 = v30 + 2 * v5 * v14 + v7 * v13 + v19 * v12;
  v35 = 2 * v4 * v5;
  v36 = v17 * v4 + v5 * v15;
  v37 = v32 + v20 * v4;
  v38 = v29 + v20 * v18;
  v39 = v7 * v15 + (int)v4 * (uint64_t)(int)v4 + v18 * v17;
  v40 = v31 + v20 * v17;
  v41 = v35 + v7 * v17;
  v42 = v33 + v20 * v7;
  v43 = v36 + v7 * v14;
  v44 = v26 + v19 * v15 + v20 * v14;
  v45 = v34 + v20 * 2 * v6;
  v46 = 2 * v44 + 0x2000000;
  v47 = (v46 >> 26) + 2 * v24;
  v48 = v43 + v6 * v13 + v20 * v12;
  v49 = v39 + 2 * v6 * v14 + v12 * v13;
  v50 = 2 * v44 - (v46 & 0xFFFFFFFFFC000000);
  v51 = 2 * v38 + 0x2000000;
  v52 = v49 + v20 * v11;
  v53 = (v51 >> 26) + 2 * v42;
  v54 = v41 + v6 * v15 + v12 * v14;
  v55 = ((v47 + 0x1000000) >> 25) + 2 * v40;
  v56 = v54 + v11 * v13;
  v57 = ((v53 + 0x1000000) >> 25) + 2 * v45;
  v58 = ((v55 + 0x2000000) >> 26) + 2 * v37;
  v59 = ((v57 + 0x2000000) >> 26) + 2 * v48;
  v60 = ((v59 + 0x1000000) >> 25) + 2 * v52;
  v61 = ((v60 + 0x2000000) >> 26) + 2 * v56;
  v62 = v50 + 19 * ((v61 + 0x1000000) >> 25);
  *result = v62 - ((v62 + 0x2000000) & 0xFC000000);
  result[1] = v47 - ((v47 + 0x1000000) & 0xFE000000) + ((v62 + 0x2000000) >> 26);
  v63 = 2 * v38 - (v51 & 0xFFFFFFFFFC000000) + ((v58 + 0x1000000) >> 25);
  result[2] = v55 - ((v55 + 0x2000000) & 0xFC000000);
  result[3] = v58 - ((v58 + 0x1000000) & 0xFE000000);
  result[4] = v63 - ((v63 + 0x2000000) & 0xFC000000);
  result[5] = v53 - ((v53 + 0x1000000) & 0xFE000000) + ((v63 + 0x2000000) >> 26);
  result[6] = v57 - ((v57 + 0x2000000) & 0xFC000000);
  result[7] = v59 - ((v59 + 0x1000000) & 0xFE000000);
  result[8] = v60 - ((v60 + 0x2000000) & 0xFC000000);
  result[9] = v61 - ((v61 + 0x1000000) & 0xFE000000);
  return result;
}

int32x4_t fe_sub(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int32x4_t result;
  int32x4_t v4;
  int32x2_t v5;

  result = vsubq_s32(*(int32x4_t *)a2, *(int32x4_t *)a3);
  v4 = vsubq_s32(*(int32x4_t *)(a2 + 16), *(int32x4_t *)(a3 + 16));
  v5 = vsub_s32(*(int32x2_t *)(a2 + 32), *(int32x2_t *)(a3 + 32));
  *(int32x4_t *)a1 = result;
  *(int32x4_t *)(a1 + 16) = v4;
  *(int32x2_t *)(a1 + 32) = v5;
  return result;
}

double ge_add(int *a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  double result;
  _OWORD v8[2];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDB0D28];
  v9 = 0;
  memset(v8, 0, sizeof(v8));
  v6 = a2 + 40;
  fe_add((uint64_t)a1, a2 + 40, a2);
  fe_sub((uint64_t)(a1 + 10), v6, a2);
  fe_mul(a1 + 20, a1, a3);
  fe_mul(a1 + 10, a1 + 10, a3 + 10);
  fe_mul(a1 + 30, a3 + 30, (int *)(a2 + 120));
  fe_mul(a1, (int *)(a2 + 80), a3 + 20);
  fe_add((uint64_t)v8, (uint64_t)a1, (uint64_t)a1);
  fe_sub((uint64_t)a1, (uint64_t)(a1 + 20), (uint64_t)(a1 + 10));
  fe_add((uint64_t)(a1 + 10), (uint64_t)(a1 + 20), (uint64_t)(a1 + 10));
  fe_add((uint64_t)(a1 + 20), (uint64_t)v8, (uint64_t)(a1 + 30));
  *(_QWORD *)&result = fe_sub((uint64_t)(a1 + 30), (uint64_t)v8, (uint64_t)(a1 + 30)).u64[0];
  return result;
}

uint64_t ge_p3_to_cached(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v4 = a2 + 40;
  fe_add(a1, a2 + 40, a2);
  fe_sub(a1 + 40, v4, a2);
  v5 = *(_OWORD *)(a2 + 96);
  v6 = *(_QWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v5;
  *(_QWORD *)(a1 + 112) = v6;
  return fe_mul((_DWORD *)(a1 + 120), (int *)(a2 + 120), d2);
}

double ge_p3_dbl(_DWORD *a1, uint64_t a2)
{
  _OWORD v4[7];
  uint64_t v5;

  v5 = 0;
  memset(v4, 0, sizeof(v4));
  ge_p3_to_p2((uint64_t)v4, a2);
  return ge_p2_dbl(a1, (int *)v4);
}

uint64_t ge_p1p1_to_p3(_DWORD *a1, int *a2)
{
  int *v4;

  v4 = a2 + 30;
  fe_mul(a1, a2, a2 + 30);
  fe_mul(a1 + 10, a2 + 10, a2 + 20);
  fe_mul(a1 + 20, a2 + 20, v4);
  return fe_mul(a1 + 30, a2, a2 + 10);
}

double ge_p2_dbl(_DWORD *a1, int *a2)
{
  double result;
  _OWORD v5[2];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDB0D28];
  v6 = 0;
  memset(v5, 0, sizeof(v5));
  fe_sq(a1, a2);
  fe_sq(a1 + 20, a2 + 10);
  fe_sq2(a1 + 30, a2 + 20);
  fe_add((uint64_t)(a1 + 10), (uint64_t)a2, (uint64_t)(a2 + 10));
  fe_sq(v5, a1 + 10);
  fe_add((uint64_t)(a1 + 10), (uint64_t)(a1 + 20), (uint64_t)a1);
  fe_sub((uint64_t)(a1 + 20), (uint64_t)(a1 + 20), (uint64_t)a1);
  fe_sub((uint64_t)a1, (uint64_t)v5, (uint64_t)(a1 + 10));
  *(_QWORD *)&result = fe_sub((uint64_t)(a1 + 30), (uint64_t)(a1 + 30), (uint64_t)(a1 + 20)).u64[0];
  return result;
}

double ge_sub(int *a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  double result;
  _OWORD v8[2];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDB0D28];
  v9 = 0;
  memset(v8, 0, sizeof(v8));
  v6 = a2 + 40;
  fe_add((uint64_t)a1, a2 + 40, a2);
  fe_sub((uint64_t)(a1 + 10), v6, a2);
  fe_mul(a1 + 20, a1, a3 + 10);
  fe_mul(a1 + 10, a1 + 10, a3);
  fe_mul(a1 + 30, a3 + 30, (int *)(a2 + 120));
  fe_mul(a1, (int *)(a2 + 80), a3 + 20);
  fe_add((uint64_t)v8, (uint64_t)a1, (uint64_t)a1);
  fe_sub((uint64_t)a1, (uint64_t)(a1 + 20), (uint64_t)(a1 + 10));
  fe_add((uint64_t)(a1 + 10), (uint64_t)(a1 + 20), (uint64_t)(a1 + 10));
  fe_sub((uint64_t)(a1 + 20), (uint64_t)v8, (uint64_t)(a1 + 30));
  *(_QWORD *)&result = fe_add((uint64_t)(a1 + 30), (uint64_t)v8, (uint64_t)(a1 + 30)).u64[0];
  return result;
}

double ge_madd(int *a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  double result;
  _OWORD v8[2];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDB0D28];
  v9 = 0;
  memset(v8, 0, sizeof(v8));
  v6 = a2 + 40;
  fe_add((uint64_t)a1, a2 + 40, a2);
  fe_sub((uint64_t)(a1 + 10), v6, a2);
  fe_mul(a1 + 20, a1, a3);
  fe_mul(a1 + 10, a1 + 10, a3 + 10);
  fe_mul(a1 + 30, a3 + 20, (int *)(a2 + 120));
  fe_add((uint64_t)v8, a2 + 80, a2 + 80);
  fe_sub((uint64_t)a1, (uint64_t)(a1 + 20), (uint64_t)(a1 + 10));
  fe_add((uint64_t)(a1 + 10), (uint64_t)(a1 + 20), (uint64_t)(a1 + 10));
  fe_add((uint64_t)(a1 + 20), (uint64_t)v8, (uint64_t)(a1 + 30));
  *(_QWORD *)&result = fe_sub((uint64_t)(a1 + 30), (uint64_t)v8, (uint64_t)(a1 + 30)).u64[0];
  return result;
}

uint64_t ge_p1p1_to_p2(_DWORD *a1, int *a2)
{
  int *v2;
  int *v4;
  int *v5;

  v2 = a2;
  v4 = a2 + 30;
  fe_mul(a1, a2, a2 + 30);
  v5 = v2 + 10;
  v2 += 20;
  fe_mul(a1 + 10, v5, v2);
  return fe_mul(a1 + 20, v2, v4);
}

__n128 ge_p3_to_p2(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  __n128 result;
  __int128 v7;
  uint64_t v8;

  v2 = *(_OWORD *)(a2 + 16);
  v3 = *(_QWORD *)(a2 + 32);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  *(_QWORD *)(a1 + 32) = v3;
  v4 = *(_OWORD *)(a2 + 56);
  v5 = *(_QWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v4;
  *(_QWORD *)(a1 + 72) = v5;
  result = *(__n128 *)(a2 + 80);
  v7 = *(_OWORD *)(a2 + 96);
  v8 = *(_QWORD *)(a2 + 112);
  *(__n128 *)(a1 + 80) = result;
  *(_OWORD *)(a1 + 96) = v7;
  *(_QWORD *)(a1 + 112) = v8;
  return result;
}

uint64_t ge_p3_tobytes(uint64_t a1, int *a2)
{
  uint64_t result;
  _OWORD v5[2];
  uint64_t v6;
  _OWORD v7[2];
  uint64_t v8;
  _OWORD v9[2];
  uint64_t v10;
  _BYTE v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x24BDB0D28];
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  v8 = 0;
  memset(v7, 0, sizeof(v7));
  v6 = 0;
  memset(v5, 0, sizeof(v5));
  fe_invert(v9, a2 + 20);
  fe_mul(v7, a2, (int *)v9);
  fe_mul(v5, a2 + 10, (int *)v9);
  fe_tobytes(a1, v5);
  result = fe_tobytes((uint64_t)v11, v7);
  *(_BYTE *)(a1 + 31) ^= v11[0] << 7;
  return result;
}

double ge_p3_0(uint64_t a1)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 40) = 1;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_OWORD *)(a1 + 60) = 0u;
  *(_QWORD *)(a1 + 76) = 0x100000000;
  *(_OWORD *)(a1 + 84) = 0u;
  *(_OWORD *)(a1 + 100) = 0u;
  *(_OWORD *)(a1 + 116) = 0u;
  *(_OWORD *)(a1 + 132) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  return result;
}

uint64_t ge_scalarmult_base(_DWORD *a1, int8x16_t *a2)
{
  *((_QWORD *)a1 + 4) = 0;
  *(_OWORD *)a1 = 0u;
  *((_OWORD *)a1 + 1) = 0u;
  a1[10] = 1;
  *(_OWORD *)(a1 + 11) = 0u;
  *(_OWORD *)(a1 + 15) = 0u;
  *(_QWORD *)(a1 + 19) = 0x100000000;
  *(_OWORD *)(a1 + 21) = 0u;
  *(_OWORD *)(a1 + 25) = 0u;
  *(_OWORD *)(a1 + 29) = 0u;
  *(_OWORD *)(a1 + 33) = 0u;
  *((_OWORD *)a1 + 9) = 0u;
  return ge_scalarmult_base_internal(a1, a2);
}

uint64_t ge_scalarmult_base_internal(_DWORD *a1, int8x16_t *a2)
{
  uint64_t v3;
  int8x16_t v4;
  int8x16_t v5;
  char *v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  unint64_t v11;
  BOOL v12;
  int v13;
  unint64_t v14;
  uint64_t result;
  _OWORD v16[7];
  uint64_t v17;
  _OWORD v18[7];
  uint64_t v19;
  _OWORD v20[10];
  _OWORD v21[7];
  uint64_t v22;
  _BYTE v23[63];
  char v24;
  uint64_t v25;
  int8x16x2_t v26;

  v3 = 0;
  v25 = *MEMORY[0x24BDB0D28];
  v4.i64[0] = 0xF0F0F0F0F0F0F0FLL;
  v4.i64[1] = 0xF0F0F0F0F0F0F0FLL;
  do
  {
    v5 = *a2++;
    v26.val[0] = vandq_s8(v5, v4);
    v26.val[1] = (int8x16_t)vshrq_n_u8((uint8x16_t)v5, 4uLL);
    v6 = &v23[v3];
    vst2q_s8(v6, v26);
    v3 += 32;
  }
  while (v3 != 64);
  v7 = 0;
  v8 = 0;
  do
  {
    v9 = v23[v7] + v8;
    v8 = (v9 + 8) << 24 >> 28;
    v23[v7++] = v9 - ((v9 + 8) & 0xF0);
  }
  while (v7 != 63);
  v10 = 0;
  memset(v20, 0, sizeof(v20));
  memset(v16, 0, sizeof(v16));
  v24 += v8;
  v11 = 1;
  v17 = 0;
  do
  {
    ge_select((uint64_t)v16, v10, (char)v23[v11]);
    ge_madd((int *)v20, (uint64_t)a1, (int *)v16);
    ge_p1p1_to_p3(a1, (int *)v20);
    ++v10;
    v12 = v11 >= 0x3E;
    v11 += 2;
  }
  while (!v12);
  v19 = 0;
  memset(v18, 0, sizeof(v18));
  v22 = 0;
  memset(v21, 0, sizeof(v21));
  ge_p3_to_p2((uint64_t)v21, (uint64_t)a1);
  ge_p2_dbl(v20, (int *)v21);
  ge_p1p1_to_p2(v18, (int *)v20);
  ge_p2_dbl(v20, (int *)v18);
  ge_p1p1_to_p2(v18, (int *)v20);
  ge_p2_dbl(v20, (int *)v18);
  ge_p1p1_to_p2(v18, (int *)v20);
  ge_p2_dbl(v20, (int *)v18);
  ge_p1p1_to_p3(a1, (int *)v20);
  v13 = 0;
  v14 = 0;
  do
  {
    ge_select((uint64_t)v16, v13, (char)v23[v14]);
    ge_madd((int *)v20, (uint64_t)a1, (int *)v16);
    result = ge_p1p1_to_p3(a1, (int *)v20);
    ++v13;
    v12 = v14 >= 0x3E;
    v14 += 2;
  }
  while (!v12);
  return result;
}

uint64_t ge_scalarmult_base_masked(uint64_t a1, int8x16_t *a2, void (**a3)(_QWORD, uint64_t, int8x16_t *))
{
  uint64_t v6;
  __int128 v7;
  uint64_t v9;
  int8x16_t v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDB0D28];
  v6 = frandom(v10, a3);
  if (!(_DWORD)v6)
  {
    v9 = 0;
    (*a3)(a3, 8, (int8x16_t *)&v9);
    ccn_mux_seed_mask(v9);
    fe_frombytes((_DWORD *)(a1 + 80), (unsigned int *)v10);
    *(_QWORD *)(a1 + 32) = 0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 120) = 0u;
    *(_OWORD *)(a1 + 136) = 0u;
    *(_QWORD *)(a1 + 152) = 0;
    v7 = *(_OWORD *)(a1 + 96);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(a1 + 56) = v7;
    *(_QWORD *)(a1 + 72) = *(_QWORD *)(a1 + 112);
    ge_scalarmult_base_internal((_DWORD *)a1, a2);
  }
  return v6;
}

_BYTE *sc_muladd(_BYTE *a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned __int16 *a4)
{
  unsigned int v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
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
  unsigned int v35;
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
  uint64_t v78;
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
  unint64_t v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  unint64_t v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  unint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  unint64_t v116;
  int64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int64_t v121;
  int64_t v122;
  int64_t v123;
  int64_t v124;
  int64_t v125;
  uint64_t v126;
  uint64_t v127;
  int64_t v128;
  uint64_t v129;
  _BYTE *result;
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
  unint64_t v141;
  unint64_t v142;
  unint64_t v143;
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
  unint64_t v154;
  unint64_t v155;
  unint64_t v156;
  unint64_t v157;
  unint64_t v158;
  unint64_t v159;
  unint64_t v161;
  unint64_t v162;

  v4 = *a2 | ((a2[1] & 0x1F) << 16);
  v5 = *(unsigned int *)((char *)a2 + 15);
  v6 = (v5 >> 24) | ((unint64_t)*((unsigned __int8 *)a2 + 19) << 8) | ((unint64_t)*((unsigned __int8 *)a2
                                                                                                + 20) << 16);
  v7 = *(unsigned __int16 *)((char *)a2 + 21) | ((*((_BYTE *)a2 + 23) & 0x1F) << 16);
  v8 = *a3 | ((a3[1] & 0x1F) << 16);
  v9 = *(unsigned int *)((char *)a3 + 15);
  v10 = (v9 >> 24) | ((unint64_t)*((unsigned __int8 *)a3 + 19) << 8) | ((unint64_t)*((unsigned __int8 *)a3
                                                                                                 + 20) << 16);
  v11 = *(unsigned __int16 *)((char *)a3 + 21) | ((*((_BYTE *)a3 + 23) & 0x1F) << 16);
  v12 = *(unsigned int *)((char *)a4 + 15);
  v152 = (v12 >> 24) | ((unint64_t)*((unsigned __int8 *)a4 + 19) << 8) | ((unint64_t)*((unsigned __int8 *)a4 + 20) << 16);
  v13 = ((unint64_t)*(unsigned int *)(a2 + 1) >> 5) & 0x1FFFFF;
  v14 = ((unint64_t)(HIBYTE(*(_DWORD *)(a2 + 1)) | (*((unsigned __int8 *)a2 + 6) << 8) | (*((unsigned __int8 *)a2
                                                                                                 + 7) << 16)) >> 2) & 0x1FFFFF;
  v15 = ((unint64_t)*(unsigned int *)(a3 + 1) >> 5) & 0x1FFFFF;
  v16 = ((unint64_t)(HIBYTE(*(_DWORD *)(a3 + 1)) | (*((unsigned __int8 *)a3 + 6) << 8) | (*((unsigned __int8 *)a3
                                                                                                 + 7) << 16)) >> 2) & 0x1FFFFF;
  v162 = v15 * v13
       + v8 * v14
       + v16 * v4
       + (((unint64_t)(HIBYTE(*(_DWORD *)(a4 + 1)) | (*((unsigned __int8 *)a4 + 6) << 8) | (*((unsigned __int8 *)a4 + 7) << 16)) >> 2) & 0x1FFFFF);
  v17 = ((unint64_t)*(unsigned int *)((char *)a2 + 7) >> 7) & 0x1FFFFF;
  v18 = ((unint64_t)*(unsigned int *)(a2 + 5) >> 4) & 0x1FFFFF;
  v19 = ((unint64_t)*(unsigned int *)((char *)a3 + 7) >> 7) & 0x1FFFFF;
  v20 = ((unint64_t)*(unsigned int *)(a3 + 5) >> 4) & 0x1FFFFF;
  v21 = v15 * (unint64_t)v17
      + v8 * (unint64_t)v18
      + v19 * (unint64_t)v13
      + v4 * (unint64_t)v20
      + v16 * v14
      + (((unint64_t)*(unsigned int *)(a4 + 5) >> 4) & 0x1FFFFF);
  v22 = ((unint64_t)(HIBYTE(*(_DWORD *)(a2 + 5)) | (*((unsigned __int8 *)a2 + 14) << 8) | (*((unsigned __int8 *)a2
                                                                                                  + 15) << 16)) >> 1) & 0x1FFFFF;
  v23 = (v5 >> 6) & 0x1FFFFF;
  v24 = (v9 >> 6) & 0x1FFFFF;
  v25 = ((unint64_t)(HIBYTE(*(_DWORD *)(a3 + 5)) | (*((unsigned __int8 *)a3 + 14) << 8) | (*((unsigned __int8 *)a3
                                                                                                  + 15) << 16)) >> 1) & 0x1FFFFF;
  v158 = v22 * v15
       + v8 * (unint64_t)v23
       + v19 * (unint64_t)v17
       + v14 * v20
       + v16 * (unint64_t)v18
       + v4 * (unint64_t)v24
       + v25 * (unint64_t)v13
       + ((v12 >> 6) & 0x1FFFFF);
  v26 = v6 >> 3;
  v10 >>= 3;
  v155 = (v6 >> 3) * (unint64_t)v15
       + v8 * (unint64_t)v7
       + v22 * (unint64_t)v19
       + v20 * (unint64_t)v18
       + v16 * (unint64_t)v23
       + v14 * v24
       + v25 * (unint64_t)v17
       + v10 * (unint64_t)v13
       + v11 * (unint64_t)v4
       + *(unsigned __int16 *)((char *)a4 + 21)
       + ((unint64_t)(*((_BYTE *)a4 + 23) & 0x1F) << 16);
  v27 = ((unint64_t)*(unsigned int *)((char *)a2 + 23) >> 5) & 0x1FFFFF;
  v28 = ((unint64_t)(HIBYTE(*(_DWORD *)((char *)a2 + 23)) | (*((unsigned __int8 *)a2 + 27) << 8) | (*((unsigned __int8 *)a2 + 28) << 16)) >> 2) & 0x1FFFFF;
  v29 = ((unint64_t)*(unsigned int *)((char *)a3 + 23) >> 5) & 0x1FFFFF;
  v30 = ((unint64_t)(HIBYTE(*(_DWORD *)((char *)a3 + 23)) | (*((unsigned __int8 *)a3 + 27) << 8) | (*((unsigned __int8 *)a3 + 28) << 16)) >> 2) & 0x1FFFFF;
  v154 = v15 * v27
       + v8 * v28
       + v26 * (unint64_t)v19
       + v20 * (unint64_t)v23
       + v16 * (unint64_t)v7
       + v24 * (unint64_t)v18
       + v25 * (unint64_t)v22
       + v10 * (unint64_t)v17
       + v29 * (unint64_t)v13
       + v11 * v14
       + v30 * v4
       + (((unint64_t)(HIBYTE(*(_DWORD *)((char *)a4 + 23)) | (*((unsigned __int8 *)a4 + 27) << 8) | (*((unsigned __int8 *)a4 + 28) << 16)) >> 2) & 0x1FFFFF);
  v31 = (*a4 | ((unint64_t)(a4[1] & 0x1F) << 16)) + v8 * (unint64_t)v4;
  v32 = v4 * (unint64_t)v15
      + v8 * (unint64_t)v13
      + (((unint64_t)*(unsigned int *)(a4 + 1) >> 5) & 0x1FFFFF)
      + ((v31 + 0x100000) >> 21);
  v159 = v31 - ((v31 + 0x100000) & 0xFFFFFE00000);
  v156 = v14 * (unint64_t)v15
       + v8 * (unint64_t)v17
       + v4 * (unint64_t)v19
       + v16 * (unint64_t)v13
       + (((unint64_t)*(unsigned int *)((char *)a4 + 7) >> 7) & 0x1FFFFF);
  v161 = v15 * (unint64_t)v18
       + v8 * (unint64_t)v22
       + v14 * (unint64_t)v19
       + v20 * (unint64_t)v13
       + v16 * (unint64_t)v17
       + v25 * (unint64_t)v4
       + (((unint64_t)(HIBYTE(*(_DWORD *)(a4 + 5)) | (*((unsigned __int8 *)a4 + 14) << 8) | (*((unsigned __int8 *)a4 + 15) << 16)) >> 1) & 0x1FFFFF)
       + ((v21 + 0x100000) >> 21);
  v149 = v15 * (unint64_t)v23
       + v8 * (unint64_t)v26
       + v19 * (unint64_t)v18
       + v20 * (unint64_t)v17
       + v16 * (unint64_t)v22
       + v24 * (unint64_t)v13
       + v25 * (unint64_t)v14
       + v10 * (unint64_t)v4
       + (v152 >> 3);
  v148 = v7 * (unint64_t)v15
       + v8 * (unint64_t)v27
       + v19 * (unint64_t)v23
       + v22 * (unint64_t)v20
       + v16 * (unint64_t)v26
       + v24 * (unint64_t)v17
       + v25 * (unint64_t)v18
       + v10 * (unint64_t)v14
       + v4 * (unint64_t)v29
       + v11 * (unint64_t)v13
       + (((unint64_t)*(unsigned int *)((char *)a4 + 23) >> 5) & 0x1FFFFF);
  v33 = (unint64_t)*((unsigned int *)a2 + 7) >> 7;
  v34 = (unint64_t)*((unsigned int *)a3 + 7) >> 7;
  v143 = v15 * (unint64_t)v33
       + v19 * (unint64_t)v27
       + v7 * (unint64_t)v20
       + v16 * (unint64_t)v28
       + v24 * (unint64_t)v23
       + v25 * (unint64_t)v26
       + v10 * (unint64_t)v22
       + v29 * (unint64_t)v17
       + v11 * (unint64_t)v18
       + v34 * (unint64_t)v13;
  v147 = v28 * (unint64_t)v15
       + v8 * (unint64_t)v33
       + v7 * (unint64_t)v19
       + v26 * (unint64_t)v20
       + v16 * (unint64_t)v27
       + v22 * (unint64_t)v24
       + v25 * (unint64_t)v23
       + v10 * (unint64_t)v18
       + v14 * (unint64_t)v29
       + v11 * (unint64_t)v17
       + v4 * (unint64_t)v34
       + v30 * (unint64_t)v13
       + ((unint64_t)*((unsigned int *)a4 + 7) >> 7);
  v144 = v28 * (unint64_t)v19
       + v20 * (unint64_t)v27
       + v16 * (unint64_t)v33;
  v35 = v11;
  v36 = v10 * (unint64_t)v33
      + v29 * (unint64_t)v27
      + v11 * (unint64_t)v28
      + v26 * (unint64_t)v34
      + v30 * (unint64_t)v7;
  v37 = v28 * (unint64_t)v29
      + v11 * (unint64_t)v33
      + v7 * (unint64_t)v34
      + v30 * (unint64_t)v27
      + ((v36 + 0x100000) >> 21);
  v142 = v36 - ((v36 + 0x100000) & 0xFFFFFFFFFFE00000);
  v38 = v29 * (unint64_t)v33
      + v34 * (unint64_t)v27
      + v30 * (unint64_t)v28;
  v39 = v28 * (unint64_t)v34
      + v30 * (unint64_t)v33
      + ((v38 + 0x100000) >> 21);
  v40 = v38 - ((v38 + 0x100000) & 0x1FFFFFFE00000);
  v41 = v34 * (unint64_t)v33;
  v150 = v32 + 0x100000;
  v151 = v32 - ((v32 + 0x100000) & 0xFFFFFFFFFFE00000);
  v42 = v156 + ((v162 + 0x100000) >> 21);
  v157 = v21 - ((v21 + 0x100000) & 0xFFFFFFFFFFE00000) + ((v42 + 0x100000) >> 21);
  v153 = v42 - ((v42 + 0x100000) & 0xFFFFFFFFFFE00000);
  v43 = v19 * (unint64_t)v33
      + v28 * (unint64_t)v20;
  v44 = v20 * (unint64_t)v33;
  v45 = v28 * (unint64_t)v24
      + v25 * (unint64_t)v33
      + v10 * (unint64_t)v27
      + v26 * (unint64_t)v29
      + v35 * (unint64_t)v7
      + v22 * (unint64_t)v34
      + v30 * (unint64_t)v23;
  LODWORD(v36) = v7;
  v46 = v24 * (unint64_t)v33
      + v10 * (unint64_t)v28
      + v7 * (unint64_t)v29
      + v35 * (unint64_t)v27
      + v34 * (unint64_t)v23
      + v30 * (unint64_t)v26
      + ((v45 + 0x100000) >> 21);
  v47 = v142 + ((v46 + 0x100000) >> 21);
  v146 = v46 - ((v46 + 0x100000) & 0xFFFFFFFFFFE00000);
  v48 = v43 + v7 * (unint64_t)v24 + v25 * (unint64_t)v27;
  v49 = v44 + v24 * (unint64_t)v27;
  v50 = v144 + v26 * (unint64_t)v24;
  v51 = v40 + ((v37 + 0x100000) >> 21);
  v52 = v37 - ((v37 + 0x100000) & 0xFFFFFFFFFFE00000);
  v53 = v41 - ((v41 + 0x100000) & 0x7FFFFFFE00000) + ((v39 + 0x100000) >> 21);
  v54 = v39 - ((v39 + 0x100000) & 0x1FFFFFFE00000);
  v55 = v50 + v25 * (unint64_t)v36;
  v56 = (v41 + 0x100000) >> 21;
  v145 = v45 - 683901 * (int)v56 - ((v45 + 0x100000) & 0xFFFFFFFFFFE00000);
  v57 = v55
      + v10 * (unint64_t)v23
      + v29 * (unint64_t)v18
      + v35 * (unint64_t)v22;
  v58 = v143 + v30 * (unint64_t)v14;
  v59 = v48
      + v10 * (unint64_t)v26
      + v22 * (unint64_t)v29
      + v35 * (unint64_t)v23
      + v34 * (unint64_t)v17
      + v30 * (unint64_t)v18;
  v60 = v49
      + v25 * (unint64_t)v28
      + v10 * (unint64_t)v36
      + v29 * (unint64_t)v23
      + v35 * (unint64_t)v26
      + v34 * (unint64_t)v18
      + v30 * (unint64_t)v22
      + ((v59 + 0x100000) >> 21);
  v61 = 654183 * v53 + 470296 * v56 - 997805 * v54 + v58;
  v58 += 0x100000;
  v62 = v57
      + v14 * (unint64_t)v34
      + v30 * (unint64_t)v17
      + (v58 >> 21);
  v63 = v61 + 136657 * v51 - 683901 * v52 - (v58 & 0xFFFFFFFFFFE00000);
  v64 = v149 + ((v158 + 0x100000) >> 21);
  v65 = v148 + ((v155 + 0x100000) >> 21);
  v66 = 666643 * v51
      + 470296 * v52
      + 654183 * v47
      + ((v64 + 0x100000) >> 21)
      + v155
      - ((v155 + 0x100000) & 0xFFFFFFFFFFE00000);
  v67 = v147 + ((v154 + 0x100000) >> 21);
  v68 = 666643 * v53
      + 470296 * v54
      + 654183 * v51
      - 997805 * v52
      + 136657 * v47
      + ((v65 + 0x100000) >> 21)
      + v154
      - ((v154 + 0x100000) & 0xFFFFFFFFFFE00000);
  v69 = v158 + 666643 * v47 - ((v158 + 0x100000) & 0xFFFFFFFFFFE00000) + ((v161 + 0x100000) >> 21);
  v70 = 666643 * v52
      + 470296 * v47
      + v64
      + ((uint64_t)(v69 + 0x100000) >> 21)
      - ((v64 + 0x100000) & 0xFFFFFFFFFFE00000);
  v71 = 666643 * v54 + 470296 * v51 + 654183 * v52 - 997805 * v47 + v65 - ((v65 + 0x100000) & 0xFFFFFFFFFFE00000);
  v72 = v63 + ((v67 + 0x100000) >> 21);
  v73 = 470296 * v53
      + 666643 * v56
      + 654183 * v54
      - 997805 * v51
      + 136657 * v52
      - 683901 * v47
      + v67
      - ((v67 + 0x100000) & 0xFFFFFFFFFFE00000);
  v74 = -997805 * v53 + 654183 * v56 + 136657 * v54 - 683901 * v51 + v62;
  v62 += 0x100000;
  v75 = v59
      - 997805 * (int)v56
      + 136657 * v53
      - 683901 * v54
      - ((v59 + 0x100000) & 0xFFFFFFFFFFE00000)
      + (v62 >> 21);
  v76 = v74 - (v62 & 0xFFFFFFFFFFE00000) + ((uint64_t)(v72 + 0x100000) >> 21);
  v77 = v72 - ((v72 + 0x100000) & 0xFFFFFFFFFFE00000);
  v78 = -683901 * v53 + 136657 * v56;
  v79 = v145 + ((v60 + 0x100000) >> 21);
  v80 = v73 + ((uint64_t)(v68 + 0x100000) >> 21);
  v81 = v78 + v60 - ((v60 + 0x100000) & 0xFFFFFFFFFFE00000) + ((uint64_t)(v75 + 0x100000) >> 21);
  v82 = v146 + ((uint64_t)(v79 + 0x100000) >> 21);
  v83 = v77 + ((uint64_t)(v80 + 0x100000) >> 21);
  v84 = v80 - ((v80 + 0x100000) & 0xFFFFFFFFFFE00000);
  v85 = v75 - ((v75 + 0x100000) & 0xFFFFFFFFFFE00000) + ((uint64_t)(v76 + 0x100000) >> 21);
  v86 = v76 - ((v76 + 0x100000) & 0xFFFFFFFFFFE00000);
  v87 = v79 - ((v79 + 0x100000) & 0xFFFFFFFFFFE00000) + ((uint64_t)(v81 + 0x100000) >> 21);
  v88 = v81 - ((v81 + 0x100000) & 0xFFFFFFFFFFE00000);
  v89 = v71 + ((uint64_t)(v66 + 0x100000) >> 21);
  v90 = -683901 * v82 + ((uint64_t)(v89 + 0x100000) >> 21) + v68 - ((v68 + 0x100000) & 0xFFFFFFFFFFE00000);
  v91 = -997805 * v82
      + 136657 * v87
      - 683901 * v88
      + ((uint64_t)(v70 + 0x100000) >> 21)
      + v66
      - ((v66 + 0x100000) & 0xFFFFFFFFFFE00000);
  v92 = v69 + 470296 * v82 - ((v69 + 0x100000) & 0xFFFFFFFFFFE00000);
  v93 = v159 + 666643 * v83;
  v94 = v151 + 470296 * v83 + 666643 * v86 + ((uint64_t)(v93 + 0x100000) >> 21);
  v95 = v161 + 666643 * v82 - ((v161 + 0x100000) & 0xFFFFFFFFFFE00000);
  v96 = v92 + 654183 * v87 - 997805 * v88 + 136657 * v85 - 683901 * v86;
  v97 = 654183 * v82
      - 997805 * v87
      + 136657 * v88
      + v70
      - ((v70 + 0x100000) & 0xFFFFFFFFFFE00000)
      - 683901 * v85
      + ((v96 + 0x100000) >> 21);
  v98 = 136657 * v82
      - 683901 * v87
      + v89
      - ((v89 + 0x100000) & 0xFFFFFFFFFFE00000)
      + ((uint64_t)(v91 + 0x100000) >> 21);
  v99 = v84 + ((uint64_t)(v90 + 0x100000) >> 21);
  v100 = v94 + 0x100000;
  v101 = v98 + 0x100000;
  v102 = v98 - ((v98 + 0x100000) & 0xFFFFFFFFFFE00000);
  v103 = (uint64_t)(v99 + 0x100000) >> 21;
  v104 = v94 + 470296 * v103 - ((v94 + 0x100000) & 0xFFFFFFFFFFE00000);
  v105 = v162 + (v150 >> 21) - ((v162 + 0x100000) & 0xFFFFFFFFFFE00000) + 654183 * v83 + 666643 * v85 + 470296 * v86;
  v106 = v153 + 666643 * v88 - 997805 * v83 + 470296 * v85 + 654183 * v86 + ((uint64_t)(v105 + 0x100000) >> 21);
  v107 = v106 + 0x100000;
  v108 = v105 + 654183 * v103 - ((v105 + 0x100000) & 0xFFFFFFFFFFE00000) + (v100 >> 21);
  v109 = v106 - 997805 * v103 - ((v106 + 0x100000) & 0xFFFFFFFFFFE00000);
  v110 = v157 + 666643 * v87;
  v111 = v95 + 470296 * v87 + 654183 * v88;
  v112 = v110 + 470296 * v88 + 136657 * v83;
  v113 = v111 - 683901 * v83 - 997805 * v85;
  v114 = v112 + 654183 * v85 - 997805 * v86;
  v115 = v113 + 136657 * v86 + ((v114 + 0x100000) >> 21);
  v116 = v90 + (v101 >> 21) - ((v90 + 0x100000) & 0xFFFFFFFFFFE00000);
  v117 = v93 - ((v93 + 0x100000) & 0xFFFFFFFFFFE00000) + 666643 * v103;
  v118 = v104 + (v117 >> 21);
  v119 = v108 + (v118 >> 21);
  v120 = v109 + (v119 >> 21);
  v121 = v114 + 136657 * v103 - ((v114 + 0x100000) & 0xFFFFFFFFFFE00000) + (v107 >> 21) + (v120 >> 21);
  v122 = v115 - 683901 * v103 - ((v115 + 0x100000) & 0xFFFFFFFFFFE00000) + (v121 >> 21);
  v123 = v96 - ((v96 + 0x100000) & 0xFFFFFFFFFFE00000) + ((v115 + 0x100000) >> 21) + (v122 >> 21);
  v124 = v97 - ((v97 + 0x100000) & 0xFFFFFFFFFFE00000) + (v123 >> 21);
  v125 = v91 - ((v91 + 0x100000) & 0xFFFFFFFFFFE00000) + ((uint64_t)(v97 + 0x100000) >> 21) + (v124 >> 21);
  v126 = v102 + (v125 >> 21);
  v127 = v116 + (v126 >> 21);
  v128 = v99 - ((v99 + 0x100000) & 0xFFFFFFFFFFE00000) + (v127 >> 21);
  v129 = (v117 & 0x1FFFFF) + 666643 * (v128 >> 21);
  result = a1;
  a1[1] = (unsigned __int16)(v117 + 11283 * (v128 >> 21)) >> 8;
  v131 = (v118 & 0x1FFFFF) + 470296 * (v128 >> 21) + (v129 >> 21);
  *a1 = v117 + 19 * (v128 >> 21);
  a1[2] = ((unint64_t)((v117 & 0x1FFFFF) + 666643 * (v128 >> 21)) >> 16) & 0x1F | (32 * (v118 + 24 * (v128 >> 21) + (v129 >> 21)));
  a1[3] = (unint64_t)v131 >> 3;
  a1[4] = (unint64_t)v131 >> 11;
  v132 = (v119 & 0x1FFFFF) + 654183 * (v128 >> 21) + (v131 >> 21);
  a1[5] = (v131 >> 19) & 3 | (4 * (v119 + 103 * (v128 >> 21) + (v131 >> 21)));
  a1[6] = (unint64_t)v132 >> 6;
  v133 = (v120 & 0x1FFFFF) - 997805 * (v128 >> 21) + (v132 >> 21);
  a1[7] = (v132 >> 14) & 0x7F | (((_BYTE)v120
                                              - -83 * (v128 >> 21)
                                              + (v132 >> 21)) << 7);
  a1[8] = (unint64_t)v133 >> 1;
  a1[9] = (unint64_t)v133 >> 9;
  v134 = (v121 & 0x1FFFFF) + 136657 * (v128 >> 21) + (v133 >> 21);
  a1[10] = (v133 >> 17) & 0xF | (16 * (v121 - 47 * (v128 >> 21) + (v133 >> 21)));
  a1[11] = (unint64_t)v134 >> 4;
  a1[12] = (unint64_t)v134 >> 12;
  v135 = (v122 & 0x1FFFFF) - 683901 * (v128 >> 21) + (v134 >> 21);
  a1[13] = ((v134 & 0x100000) != 0) | (2 * (v122 - 125 * (v128 >> 21) + (v134 >> 21)));
  a1[14] = (unint64_t)v135 >> 7;
  v136 = (v123 & 0x1FFFFF) + (v135 >> 21);
  a1[15] = (v135 >> 15) & 0x3F | (((_BYTE)v123 + (v135 >> 21)) << 6);
  a1[16] = (unint64_t)v136 >> 2;
  a1[17] = (unint64_t)v136 >> 10;
  v137 = (v124 & 0x1FFFFF) + (v136 >> 21);
  a1[18] = (v136 >> 18) & 7 | (8 * (v97 + (v123 >> 21) + (v136 >> 21)));
  a1[19] = (unint64_t)v137 >> 5;
  v138 = (v125 & 0x1FFFFF) + (v137 >> 21);
  a1[20] = (unint64_t)v137 >> 13;
  a1[22] = (unsigned __int16)(v125 + (v137 >> 21)) >> 8;
  v139 = (v126 & 0x1FFFFF) + (v138 >> 21);
  a1[21] = v138;
  a1[23] = BYTE2(v138) & 0x1F | (32 * (v126 + (v138 >> 21)));
  a1[24] = (unint64_t)v139 >> 3;
  a1[25] = (unint64_t)v139 >> 11;
  v140 = (v127 & 0x1FFFFF) + (v139 >> 21);
  a1[26] = (v139 >> 19) & 3 | (4 * (v127 + (v139 >> 21)));
  a1[27] = (unint64_t)v140 >> 6;
  v141 = (v128 & 0x1FFFFF) + (v140 >> 21);
  a1[28] = (v140 >> 14) & 0x7F | (((_BYTE)v99
                                               + (v127 >> 21)
                                               + (v140 >> 21)) << 7);
  a1[29] = v141 >> 1;
  a1[30] = v141 >> 9;
  a1[31] = v141 >> 17;
  return result;
}

unsigned __int16 *sc_reduce(unsigned __int16 *result)
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

uint64_t ge_select(uint64_t a1, int a2, int a3)
{
  int v4;
  int v5;
  uint64_t *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  int32x4_t v10;
  int32x4_t v11;
  _OWORD v13[7];
  int32x2_t v14;

  v4 = (a3 >> 7) & 1;
  v5 = a3 - 2 * (a3 & (a3 >> 31));
  *(_DWORD *)a1 = 1;
  *(_OWORD *)(a1 + 4) = 0u;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_QWORD *)(a1 + 36) = 0x100000000;
  *(_OWORD *)(a1 + 44) = 0u;
  *(_OWORD *)(a1 + 60) = 0u;
  *(_OWORD *)(a1 + 76) = 0u;
  *(_OWORD *)(a1 + 92) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  v6 = (uint64_t *)((char *)&base + 960 * a2);
  ge_cmov((uint64_t *)a1, v6, ((a3 - 2 * (a3 & (a3 >> 31))) ^ 1) - 1 < 0);
  ge_cmov((uint64_t *)a1, v6 + 15, (v5 ^ 2) - 1 < 0);
  ge_cmov((uint64_t *)a1, v6 + 30, (v5 ^ 3) - 1 < 0);
  ge_cmov((uint64_t *)a1, v6 + 45, (v5 ^ 4) - 1 < 0);
  ge_cmov((uint64_t *)a1, v6 + 60, (v5 ^ 5) - 1 < 0);
  ge_cmov((uint64_t *)a1, v6 + 75, (v5 ^ 6) - 1 < 0);
  ge_cmov((uint64_t *)a1, v6 + 90, (v5 ^ 7) - 1 < 0);
  ge_cmov((uint64_t *)a1, v6 + 105, (v5 ^ 8) - 1 < 0);
  *(_QWORD *)&v7 = *(_QWORD *)(a1 + 72);
  v8 = *(_OWORD *)(a1 + 56);
  v13[0] = *(_OWORD *)(a1 + 40);
  v13[1] = v8;
  *((_QWORD *)&v7 + 1) = *(_QWORD *)a1;
  v9 = *(_OWORD *)(a1 + 8);
  v13[2] = v7;
  v13[3] = v9;
  v10 = *(int32x4_t *)(a1 + 96);
  v11 = vnegq_s32(*(int32x4_t *)(a1 + 80));
  v13[4] = *(_OWORD *)(a1 + 24);
  v13[5] = v11;
  v13[6] = vnegq_s32(v10);
  v14 = vneg_s32(*(int32x2_t *)(a1 + 112));
  return ge_cmov((uint64_t *)a1, (uint64_t *)v13, v4);
}

uint64_t ge_cmov(uint64_t *a1, uint64_t *a2, char a3)
{
  ccn_mux(5, a3, a1, a2, a1);
  ccn_mux(5, a3, a1 + 5, a2 + 5, a1 + 5);
  return ccn_mux(5, a3, a1 + 10, a2 + 10, a1 + 10);
}

unsigned int *ccsha256_ltc_compress(unsigned int *result, uint64_t a2, const char *a3)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  uint64_t v11;
  uint16x8_t v12;
  uint16x8_t v13;
  int8x16_t v16;
  uint16x8_t v22;
  uint16x8_t v23;
  int8x16_t v24;
  uint16x8_t v25;
  __int32 v26;
  unint64_t v27;
  int v28;
  int *v29;
  unint64_t v30;
  int8x16_t *v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  unsigned int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  unint64_t v40;
  int v41;
  int v42;
  unint64_t v43;
  int v44;
  int v45;
  unsigned int v46;
  int v47;
  unint64_t v48;
  int v49;
  int v50;
  unsigned int v51;
  int v52;
  int v53;
  unint64_t v54;
  int v55;
  int v56;
  unsigned int v57;
  int v58;
  unint64_t v59;
  int v60;
  int v61;
  unsigned int v62;
  int v63;
  int v64;
  unint64_t v65;
  int v66;
  int v67;
  unint64_t v68;
  int v69;
  int v70;
  unint64_t v71;
  int v72;
  int v73;
  unint64_t v74;
  int v75;
  int8x16_t v76;
  int8x16_t v77;
  _OWORD v78[14];
  uint64_t v79;
  int8x16x4_t v80;

  v79 = *MEMORY[0x24BDB0D28];
  if (a2)
  {
    v3 = *result;
    v4 = result[1];
    v5 = result[2];
    v6 = result[3];
    v7 = result[4];
    v8 = result[5];
    v9 = result[6];
    v10 = result[7];
    do
    {
      v11 = 0;
      --a2;
      v80 = vld4q_s8(a3);
      v12 = vmovl_u8(*(uint8x8_t *)v80.val[0].i8);
      v13 = vmovl_high_u8((uint8x16_t)v80.val[0]);
      _Q16 = vmovl_high_u8((uint8x16_t)v80.val[1]);
      _Q17 = (int8x16_t)vmovl_u8(*(uint8x8_t *)v80.val[1].i8);
      v16 = (int8x16_t)vshll_n_s16(*(int16x4_t *)_Q17.i8, 0x10uLL);
      __asm
      {
        SHLL2           V19.4S, V16.8H, #0x10
        SHLL2           V17.4S, V17.8H, #0x10
      }
      v22 = vmovl_u8(*(uint8x8_t *)v80.val[2].i8);
      v23 = vmovl_high_u8((uint8x16_t)v80.val[2]);
      v24 = vorrq_s8(vorrq_s8((int8x16_t)vshll_n_s16(*(int16x4_t *)_Q16.i8, 0x10uLL), (int8x16_t)vshll_n_u16(*(uint16x4_t *)v23.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v13.i8), 0x18uLL));
      v25 = vmovl_u8(*(uint8x8_t *)v80.val[3].i8);
      v80.val[0] = (int8x16_t)vmovl_high_u8((uint8x16_t)v80.val[3]);
      v78[0] = vorrq_s8(v24, (int8x16_t)vmovl_u16(*(uint16x4_t *)v80.val[0].i8));
      v78[1] = vorrq_s8(vorrq_s8(vorrq_s8(_Q19, (int8x16_t)vshll_high_n_u16(v23, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v13), 0x18uLL)), (int8x16_t)vmovl_high_u16((uint16x8_t)v80.val[0]));
      v76 = vorrq_s8(vorrq_s8(vorrq_s8(v16, (int8x16_t)vshll_n_u16(*(uint16x4_t *)v22.i8, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_u16(*(uint16x4_t *)v12.i8), 0x18uLL)), (int8x16_t)vmovl_u16(*(uint16x4_t *)v25.i8));
      v77 = vorrq_s8(vorrq_s8(vorrq_s8(_Q17, (int8x16_t)vshll_high_n_u16(v22, 8uLL)), (int8x16_t)vshlq_n_s32((int32x4_t)vmovl_high_u16(v12), 0x18uLL)), (int8x16_t)vmovl_high_u16(v25));
      v26 = v76.i32[0];
      do
      {
        HIDWORD(v27) = *(_DWORD *)((char *)&v78[1] + v11 * 4 + 8);
        LODWORD(v27) = HIDWORD(v27);
        v28 = (v27 >> 17) ^ __ROR4__(HIDWORD(v27), 19) ^ (HIDWORD(v27) >> 10);
        HIDWORD(v27) = v76.i32[v11 + 1];
        LODWORD(v27) = HIDWORD(v27);
        *(_DWORD *)((char *)&v78[2] + v11 * 4) = v28
                                               + *(_DWORD *)((char *)v78 + v11 * 4 + 4)
                                               + v26
                                               + ((v27 >> 7) ^ __ROR4__(HIDWORD(v27), 18) ^ (HIDWORD(v27) >> 3));
        ++v11;
        v26 = HIDWORD(v27);
      }
      while (v11 != 48);
      v29 = &dword_2218B8FA0;
      v30 = -8;
      v31 = &v77;
      v32 = v3;
      v33 = v4;
      v34 = v5;
      v35 = v6;
      v36 = v7;
      v37 = v8;
      v38 = v9;
      v39 = v10;
      do
      {
        HIDWORD(v40) = v36;
        LODWORD(v40) = v36;
        v41 = (v40 >> 6) ^ __ROR4__(v36, 11);
        v43 = __PAIR64__(v32, __ROR4__(v36, 25));
        v42 = v41 ^ v43;
        LODWORD(v43) = v32;
        v44 = (v37 & v36 | v38 & ~v36) + v39 + *(v29 - 4) + v31[-1].i32[0] + v42;
        v45 = v44 + v35;
        v46 = ((v43 >> 2) ^ __ROR4__(v32, 13) ^ __ROR4__(v32, 22)) + ((v32 | v33) & v34 | v32 & v33) + v44;
        HIDWORD(v43) = v45;
        LODWORD(v43) = v45;
        v47 = (v43 >> 6) ^ __ROR4__(v45, 11);
        v48 = __PAIR64__(v46, __ROR4__(v45, 25));
        v49 = *(v29 - 3) + v38 + v31[-1].i32[1] + (v36 & v45 | v37 & ~v45) + (v47 ^ v48);
        LODWORD(v48) = v46;
        v50 = v49 + v34;
        v51 = ((v48 >> 2) ^ __ROR4__(v46, 13) ^ __ROR4__(v46, 22)) + ((v46 | v32) & v33 | v46 & v32) + v49;
        HIDWORD(v48) = v50;
        LODWORD(v48) = v50;
        v52 = (v48 >> 6) ^ __ROR4__(v50, 11);
        v54 = __PAIR64__(v51, __ROR4__(v50, 25));
        v53 = v52 ^ v54;
        LODWORD(v54) = v51;
        v55 = *(v29 - 2) + v37 + v31[-1].i32[2] + (v45 & v50 | v36 & ~v50) + v53;
        v56 = v55 + v33;
        v57 = ((v54 >> 2) ^ __ROR4__(v51, 13) ^ __ROR4__(v51, 22)) + ((v51 | v46) & v32 | v51 & v46) + v55;
        HIDWORD(v54) = v56;
        LODWORD(v54) = v56;
        v58 = (v54 >> 6) ^ __ROR4__(v56, 11);
        v59 = __PAIR64__(v57, __ROR4__(v56, 25));
        v60 = *(v29 - 1) + v36 + v31[-1].i32[3] + (v50 & v56 | v45 & ~v56) + (v58 ^ v59);
        LODWORD(v59) = v57;
        v61 = v60 + v32;
        v62 = ((v59 >> 2) ^ __ROR4__(v57, 13) ^ __ROR4__(v57, 22)) + ((v57 | v51) & v46 | v57 & v51) + v60;
        HIDWORD(v59) = v61;
        LODWORD(v59) = v61;
        v63 = (v59 >> 6) ^ __ROR4__(v61, 11);
        v65 = __PAIR64__(v62, __ROR4__(v61, 25));
        v64 = v63 ^ v65;
        LODWORD(v65) = v62;
        v66 = *v29 + v31->i32[0] + v45 + (v56 & v61 | v50 & ~v61) + v64;
        v39 = v66 + v46;
        v35 = ((v65 >> 2) ^ __ROR4__(v62, 13) ^ __ROR4__(v62, 22)) + ((v62 | v57) & v51 | v62 & v57) + v66;
        HIDWORD(v65) = v39;
        LODWORD(v65) = v39;
        v67 = (v65 >> 6) ^ __ROR4__(v39, 11);
        v68 = __PAIR64__(v35, __ROR4__(v39, 25));
        v69 = v50 + v29[1] + v31->i32[1] + (v61 & v39 | v56 & ~v39) + (v67 ^ v68);
        LODWORD(v68) = v35;
        v38 = v69 + v51;
        v34 = ((v68 >> 2) ^ __ROR4__(v35, 13) ^ __ROR4__(v35, 22)) + ((v35 | v62) & v57 | v35 & v62) + v69;
        HIDWORD(v68) = v38;
        LODWORD(v68) = v38;
        v70 = (v68 >> 6) ^ __ROR4__(v38, 11);
        v71 = __PAIR64__(v34, __ROR4__(v38, 25));
        v72 = v31->i32[2] + v29[2] + v56 + (v39 & v38 | v61 & ~v38) + (v70 ^ v71);
        LODWORD(v71) = v34;
        v37 = v72 + v57;
        v33 = ((v71 >> 2) ^ __ROR4__(v34, 13) ^ __ROR4__(v34, 22)) + ((v34 | v35) & v62 | v34 & v35) + v72;
        HIDWORD(v71) = v37;
        LODWORD(v71) = v37;
        v73 = (v71 >> 6) ^ __ROR4__(v37, 11);
        v74 = __PAIR64__(v33, __ROR4__(v37, 25));
        v75 = v31->i32[3] + v29[3] + v61 + (v38 & v37 | v39 & ~v37) + (v73 ^ v74);
        LODWORD(v74) = v33;
        v36 = v75 + v62;
        v32 = ((v74 >> 2) ^ __ROR4__(v33, 13) ^ __ROR4__(v33, 22)) + ((v33 | v34) & v35 | v33 & v34) + v75;
        v30 += 8;
        v31 += 2;
        v29 += 8;
      }
      while (v30 < 0x38);
      v3 += v32;
      v4 += v33;
      *result = v3;
      result[1] = v4;
      v5 += v34;
      v6 += v35;
      result[2] = v5;
      result[3] = v6;
      v7 += v36;
      v8 += v37;
      result[4] = v7;
      result[5] = v8;
      v9 += v38;
      v10 += v39;
      a3 += 64;
      result[6] = v9;
      result[7] = v10;
    }
    while (a2);
  }
  return result;
}

BOOL ccec25519_mul121666_ws(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4)
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t v8[5];

  v8[4] = *MEMORY[0x24BDB0D28];
  v6 = ccn_mul1(4, v8, a4, 121666);
  result = ccn_add1_ws(a1, 4, a3, v8, 38 * v6);
  *a3 += result ? 0x26uLL : 0;
  return result;
}

uint64_t ccec25519_inv_ws(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;

  v6 = *(_QWORD *)(a1 + 16);
  v7 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4);
  v8 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4);
  v9 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4);
  cczp_sqr_ws(a1, a2);
  ccn_set(4, v7, v8);
  cczp_sqr_ws(a1, a2);
  cczp_sqr_ws(a1, a2);
  cczp_mul_ws(a1, a2);
  cczp_mul_ws(a1, a2);
  cczp_sqr_ws(a1, a2);
  cczp_mul_ws(a1, a2);
  ccn_set(4, v7, v9);
  v10 = 5;
  do
  {
    cczp_sqr_ws(a1, a2);
    --v10;
  }
  while (v10);
  cczp_mul_ws(a1, a2);
  ccn_set(4, v7, v9);
  v11 = 10;
  do
  {
    cczp_sqr_ws(a1, a2);
    --v11;
  }
  while (v11);
  cczp_mul_ws(a1, a2);
  ccn_set(4, v7, a3);
  v12 = 20;
  do
  {
    cczp_sqr_ws(a1, a2);
    --v12;
  }
  while (v12);
  cczp_mul_ws(a1, a2);
  ccn_set(4, v7, v7);
  v13 = 10;
  do
  {
    cczp_sqr_ws(a1, a2);
    --v13;
  }
  while (v13);
  cczp_mul_ws(a1, a2);
  ccn_set(4, v7, v9);
  v14 = 50;
  do
  {
    cczp_sqr_ws(a1, a2);
    --v14;
  }
  while (v14);
  cczp_mul_ws(a1, a2);
  ccn_set(4, v7, a3);
  v15 = 100;
  do
  {
    cczp_sqr_ws(a1, a2);
    --v15;
  }
  while (v15);
  cczp_mul_ws(a1, a2);
  ccn_set(4, v7, v7);
  v16 = 50;
  do
  {
    cczp_sqr_ws(a1, a2);
    --v16;
  }
  while (v16);
  cczp_mul_ws(a1, a2);
  ccn_set(4, v7, v7);
  v17 = 5;
  do
  {
    cczp_sqr_ws(a1, a2);
    --v17;
  }
  while (v17);
  cczp_mul_ws(a1, a2);
  *(_QWORD *)(a1 + 16) = v6;
  return 0;
}

uint64_t ccec25519_from_ws(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  _BOOL8 v7;
  unint64_t *v8;
  int v9;
  unint64_t v11[5];

  v11[4] = *MEMORY[0x24BDB0D28];
  v7 = ccn_add1_ws(a1, 4, a3, a4, (a4[3] >> 63) & 0x13);
  ccn_set_bit((uint64_t)a3, 0xFFuLL, v7);
  v8 = (unint64_t *)cczp_prime(a2);
  v9 = ccn_sub_ws(a1, 4, v11, a3, v8);
  ccn_sub1(4, a3, v11, -v9 & 0x13);
  return ccn_set_bit((uint64_t)a3, 0xFFuLL, 0);
}

_QWORD *ccec25519_add_asm_ws(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4, uint64_t *a5)
{
  return ccn_addmod_p25519(a3, a4, a5);
}

_OWORD *ccec25519_sub_asm_ws(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t *a4, unint64_t *a5)
{
  return ccn_submod_p25519(a3, a4, a5);
}

_QWORD *ccec25519_mul_asm_ws(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t *a4, unint64_t *a5)
{
  return ccn_mulmod_p25519(a3, a4, a5);
}

void ccec25519_sqr_asm_ws()
{
  ccn_sqrmod_p25519();
}

uint64_t ccec_der_import_diversified_pub(unint64_t *a1, uint64_t a2, unsigned __int8 *a3, _DWORD *a4, unint64_t **a5, unint64_t **a6)
{
  char v10;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  unsigned __int8 *v17;
  unsigned __int8 *v18;
  unsigned __int8 *v19;
  uint64_t v20;
  unsigned __int8 *v21;
  unsigned __int8 *v22;
  uint64_t v23;
  uint64_t v24;
  unsigned __int8 *v25;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  unsigned __int8 *v32;
  char v33;

  v10 = 0;
  v33 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v10 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v10 = 1;
    }
  }
  v33 = v10;
  v15 = &a3[a2];
  v31 = 0;
  v32 = &a3[a2];
  v16 = ccder_decode_constructed_tl(0x2000000000000010, &v32, a3, &a3[a2]);
  v17 = ccder_decode_tl(4, (unint64_t *)&v31, v16, v32);
  v18 = v17;
  if (v17)
    v19 = &v17[v31];
  else
    v19 = 0;
  if (v17)
    v20 = v31;
  else
    v20 = 0;
  v21 = ccder_decode_tl(4, (unint64_t *)&v31, v19, v32);
  v22 = &v21[v31];
  if (v21)
  {
    v23 = v31;
  }
  else
  {
    v22 = 0;
    v23 = 0;
  }
  v24 = 0xFFFFFFFFLL;
  if (v18)
  {
    v25 = v21;
    if (v21 && v22 == v15)
    {
      v27 = ccec_compact_import_pub(a1, v20, v18, a5);
      if (v27)
      {
        v28 = ccec_import_pub(a1, v20, v18, a5);
        if ((_DWORD)v28)
        {
          v24 = v28;
          goto LABEL_27;
        }
        v29 = ccec_import_pub(a1, v23, v25, a6);
      }
      else
      {
        v29 = ccec_compact_import_pub(a1, v23, v25, a6);
      }
      v24 = v29;
      if (a4 && !(_DWORD)v29)
        *a4 = 4 * (v27 == 0);
    }
  }
LABEL_27:
  cc_disable_dit(&v33);
  return v24;
}

BOOL ccn_addn(uint64_t a1, _QWORD *a2, uint64_t *a3, _BOOL8 a4, uint64_t *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t *v7;
  _BOOL8 v8;

  v5 = a1 - a4;
  v6 = &a2[a4];
  v7 = &a3[a4];
  v8 = ccn_add_ws(0, a4, a2, a3, a5);
  return ccn_add1_ws(0, v5, v6, v7, v8);
}

uint64_t ccn_recode_ssw(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  uint64_t v20;

  v4 = result << 6;
  if (result << 6)
  {
    v5 = 0;
    do
    {
      *(_BYTE *)(a4 + v5) = (*(_QWORD *)(a2 + ((v5 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v5) & 1;
      ++v5;
    }
    while (v4 != v5);
    if ((int)v4 >= 1)
    {
      v6 = 0;
      v7 = 1 << (a3 - 1);
      v8 = 1 << a3;
      v9 = -(1 << a3);
      v10 = (int)((_DWORD)result << 6);
      v11 = a4 + 1;
      result = 1;
      do
      {
        if (*(_BYTE *)(a4 + v6))
          v12 = v7 < 3;
        else
          v12 = 1;
        if (!v12)
        {
          v13 = v11;
          v14 = 1;
          v15 = result;
          do
          {
            v16 = v14 + v6;
            if (v14 + v6 >= v10)
              break;
            if (*(_BYTE *)(a4 + v16))
            {
              v17 = *(char *)(a4 + v16) << v14;
              v18 = *(char *)(a4 + v6);
              if (v17 + v18 >= v8)
              {
                v19 = v18 - v17;
                if (v19 <= v9)
                  break;
                v20 = 0;
                *(_BYTE *)(a4 + v6) = v19;
                while (*(_BYTE *)(v13 + v20))
                {
                  *(_BYTE *)(v13 + v20++) = 0;
                  if (v15 + (int)v20 >= (int)v4)
                    goto LABEL_21;
                }
                *(_BYTE *)(v13 + v20) = 1;
              }
              else
              {
                *(_BYTE *)(a4 + v6) = v17 + v18;
                *(_BYTE *)(a4 + v16) = 0;
              }
            }
LABEL_21:
            ++v14;
            ++v15;
            ++v13;
          }
          while (v14 != v7 - 1);
        }
        ++v6;
        ++result;
        ++v11;
      }
      while (v6 != (v4 & 0xFFFFFFC0));
    }
  }
  return result;
}

uint64_t ltc_des3_ecb_encrypt(uint64_t a1, uint64_t a2, unsigned int *a3, _DWORD *a4)
{
  uint64_t v6;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDB0D28];
  if (a2)
  {
    v6 = a2;
    do
    {
      --v6;
      v8 = *a3;
      v9 = a3[1];
      a3 += 2;
      v12 = bswap32(v8);
      v13 = bswap32(v9);
      desfunc3(&v12, a1);
      v10 = bswap32(v13);
      *a4 = bswap32(v12);
      a4[1] = v10;
      a4 += 2;
    }
    while (v6);
  }
  return 0;
}

uint64_t ccec_sign_composite_msg_ws(uint64_t a1, uint64_t **a2, unint64_t *a3, size_t a4, char *a5, char *a6, char *a7, uint64_t (**a8)(_QWORD, unint64_t, void *))
{
  unsigned __int8 v15[64];
  uint64_t v16;

  v16 = *MEMORY[0x24BDB0D28];
  ccdigest((uint64_t)a3, a4, a5, (uint64_t)v15);
  return ccec_sign_composite_ws(a1, a2, *a3, v15, a6, a7, a8);
}

uint64_t ccec_sign_composite_ws(uint64_t a1, uint64_t **a2, unint64_t a3, unsigned __int8 *a4, char *a5, char *a6, uint64_t (**a7)(_QWORD, unint64_t, void *))
{
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;

  v14 = **a2;
  v15 = *(_QWORD *)(a1 + 16);
  v16 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v14);
  v17 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v14);
  v18 = ccec_sign_internal_ws(a1, (unint64_t **)a2, a3, a4, v16, v17, a7);
  if (!(_DWORD)v18)
  {
    v19 = **a2;
    v20 = ccec_signature_r_s_size((uint64_t *)a2);
    ccn_write_uint_padded_ct(v19, v16, v20, a5);
    v21 = **a2;
    v22 = ccec_signature_r_s_size((uint64_t *)a2);
    ccn_write_uint_padded_ct(v21, (unint64_t *)v17, v22, a6);
  }
  *(_QWORD *)(a1 + 16) = v15;
  return v18;
}

uint64_t ccec_sign_composite_msg(uint64_t **a1, unint64_t *a2, size_t a3, char *a4, char *a5, char *a6, uint64_t (**a7)(_QWORD, unint64_t, void *))
{
  char v14;
  uint64_t v20;
  _QWORD v22[4];
  void (*v23)(uint64_t);
  char v24;
  unsigned __int8 v25[64];
  uint64_t v26;

  v14 = 0;
  v26 = *MEMORY[0x24BDB0D28];
  v24 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v14 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v14 = 1;
    }
  }
  v24 = v14;
  v22[0] = cc_malloc_clear(280 * **a1);
  v22[1] = 35 * **a1;
  v22[2] = 0;
  v22[3] = cc_ws_alloc;
  v23 = cc_ws_free;
  if (v22[0])
  {
    ccdigest((uint64_t)a2, a3, a4, (uint64_t)v25);
    v20 = ccec_sign_composite_ws((uint64_t)v22, a1, *a2, v25, a5, a6, a7);
    v23((uint64_t)v22);
  }
  else
  {
    v20 = 4294967283;
  }
  cc_disable_dit(&v24);
  return v20;
}

uint64_t ccec_sign_composite(uint64_t **a1, unint64_t a2, unsigned __int8 *a3, char *a4, char *a5, uint64_t (**a6)(_QWORD, unint64_t, void *))
{
  char v12;
  uint64_t *v18;
  uint64_t v19;
  _QWORD v21[4];
  void (*v22)(uint64_t);
  char v23;

  v12 = 0;
  v23 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v12 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v12 = 1;
    }
  }
  v23 = v12;
  v18 = *a1;
  v21[0] = cc_malloc_clear(280 * **a1);
  v21[1] = 35 * *v18;
  v21[2] = 0;
  v21[3] = cc_ws_alloc;
  v22 = cc_ws_free;
  if (v21[0])
  {
    v19 = ccec_sign_composite_ws((uint64_t)v21, a1, a2, a3, a4, a5, a6);
    v22((uint64_t)v21);
  }
  else
  {
    v19 = 4294967283;
  }
  cc_disable_dit(&v23);
  return v19;
}

_BYTE *ccz_neg(uint64_t a1)
{
  char v2;
  int v8;
  char v10;

  v2 = 0;
  v10 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v2 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v2 = 1;
    }
  }
  v10 = v2;
  if (ccz_n(a1))
  {
    v8 = ccz_sign(a1);
    ccz_set_sign(a1, -v8);
  }
  return cc_disable_dit(&v10);
}

void *ccdh_gp_rfc2409group02()
{
  return &_ccdh_gp_rfc2409group02;
}

_BYTE *cc_atfork_prepare()
{
  char v0;
  char v7;

  v0 = 0;
  v7 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v0 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v0 = 1;
    }
  }
  v7 = v0;
  ccrng_atfork_prepare();
  return cc_disable_dit(&v7);
}

uint64_t ccder_blob_decode_len_strict(unsigned __int8 **a1, unint64_t *a2)
{
  return ccder_blob_decode_len_internal(a1, a2, 1);
}

uint64_t ccder_blob_decode_len_internal(unsigned __int8 **a1, unint64_t *a2, int a3)
{
  unint64_t v3;
  unsigned __int8 *v4;
  BOOL v5;
  unsigned __int8 *v7;
  unint64_t v8;
  uint64_t result;
  int v10;

  v4 = *a1;
  v3 = (unint64_t)a1[1];
  if (*a1)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (v5 || (unint64_t)v4 >= v3)
    goto LABEL_10;
  v7 = v4 + 1;
  v8 = *v4;
  if ((char)*v4 < 0)
  {
    switch(*v4)
    {
      case 0x81u:
        if ((uint64_t)(v3 - (_QWORD)v7) >= 1)
        {
          v7 = v4 + 2;
          v10 = (char)v4[1];
          v8 = v10;
          if (!a3 || v10 < 0)
            break;
        }
        goto LABEL_10;
      case 0x82u:
        if ((uint64_t)(v3 - (_QWORD)v7) >= 2)
        {
          v7 = v4 + 3;
          v8 = __rev16(*(unsigned __int16 *)(v4 + 1));
          if (!a3 || v8 >= 0x100)
            break;
        }
        goto LABEL_10;
      case 0x83u:
        if ((uint64_t)(v3 - (_QWORD)v7) >= 3)
        {
          v7 = v4 + 4;
          v8 = ((unint64_t)v4[1] << 16) | ((unint64_t)v4[2] << 8) | v4[3];
          if (!a3 || v8 >= 0x10000)
            break;
        }
        goto LABEL_10;
      case 0x84u:
        if ((uint64_t)(v3 - (_QWORD)v7) >= 4)
        {
          v7 = v4 + 5;
          v8 = bswap32(*(_DWORD *)(v4 + 1));
          if (!a3 || v8 >> 24)
            break;
        }
        goto LABEL_10;
      default:
        goto LABEL_10;
    }
  }
  if (v3 - (unint64_t)v7 < v8)
  {
LABEL_10:
    result = 0;
    *a2 = 0;
  }
  else
  {
    *a2 = v8;
    *a1 = v7;
    return 1;
  }
  return result;
}

uint64_t ccder_blob_decode_len(unsigned __int8 **a1, unint64_t *a2)
{
  return ccder_blob_decode_len_internal(a1, a2, 0);
}

uint64_t ccrng_schedule_read(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 8))
    return 3;
  result = (**(uint64_t (***)(uint64_t))a1)(a1);
  *(_BYTE *)(a1 + 8) = (_DWORD)result == 3;
  return result;
}

uint64_t ccrng_schedule_notify_reseed(_BYTE *a1)
{
  a1[8] = 0;
  return (*(uint64_t (**)(_BYTE *))(*(_QWORD *)a1 + 8))(a1);
}

uint64_t ccrng_schedule_atomic_flag_init(uint64_t result)
{
  *(_QWORD *)result = &ccrng_schedule_atomic_flag_info;
  *(_BYTE *)(result + 8) = 0;
  *(_DWORD *)(result + 16) = 1;
  return result;
}

uint64_t ccrng_schedule_atomic_flag_set(uint64_t result)
{
  *(_DWORD *)(result + 16) = 3;
  return result;
}

uint64_t ccrng_schedule_timer_init(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t result;

  *(_QWORD *)a1 = &ccrng_schedule_timer_info;
  *(_BYTE *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = a3;
  result = a2();
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

uint64_t ccrng_schedule_tree_init(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)result = &ccrng_schedule_tree_info;
  *(_BYTE *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = a3;
  return result;
}

uint64_t ccrng_schedule_atomic_flag_read(uint64_t a1)
{
  unsigned int *v1;
  uint64_t result;

  v1 = (unsigned int *)(a1 + 16);
  do
    result = __ldxr(v1);
  while (__stxr(1u, v1));
  return result;
}

uint64_t ccrng_schedule_timer_read(uint64_t a1)
{
  if ((unint64_t)((*(uint64_t (**)(void))(a1 + 16))() - *(_QWORD *)(a1 + 32)) < *(_QWORD *)(a1 + 24))
    return 1;
  else
    return 3;
}

uint64_t ccrng_schedule_timer_notify_reseed(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(a1 + 16))();
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

uint64_t ccrng_schedule_tree_read(uint64_t a1)
{
  uint64_t v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  if (*(_BYTE *)(v2 + 8))
  {
    v3 = 3;
  }
  else
  {
    v3 = (**(uint64_t (***)(_QWORD))v2)(*(_QWORD *)(a1 + 16));
    *(_BYTE *)(v2 + 8) = v3 == 3;
  }
  v4 = *(_QWORD *)(a1 + 24);
  if (*(_BYTE *)(v4 + 8))
  {
    LODWORD(result) = 3;
  }
  else
  {
    LODWORD(result) = (**(uint64_t (***)(uint64_t))v4)(v4);
    *(_BYTE *)(v4 + 8) = (_DWORD)result == 3;
  }
  if (v3 <= result)
    return result;
  else
    return v3;
}

uint64_t ccrng_schedule_tree_notify_reseed(uint64_t a1)
{
  _BYTE *v2;
  _BYTE *v3;

  v2 = *(_BYTE **)(a1 + 16);
  v2[8] = 0;
  (*(void (**)(_BYTE *))(*(_QWORD *)v2 + 8))(v2);
  v3 = *(_BYTE **)(a1 + 24);
  v3[8] = 0;
  return (*(uint64_t (**)(_BYTE *))(*(_QWORD *)v3 + 8))(v3);
}

unint64_t ccn_trailing_zeros(unint64_t result, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  if (result)
  {
    v2 = result;
    result = 0;
    v3 = v2 - 1;
    v4 = (v2 << 6) - 64;
    do
    {
      v5 = *(_QWORD *)(a2 + 8 * v3);
      result = ((((v5 | HIDWORD(v5)) + 0xFFFFFFFF) >> 32) - 1) & result | (__clz(__rbit64(v5 | 0x8000000000000000))
                                                                                       + v4) & -(uint64_t)(((v5 | HIDWORD(v5)) + 0xFFFFFFFF) >> 32);
      --v3;
      v4 -= 64;
    }
    while (v3 < v2);
  }
  return result;
}

uint64_t cc_clear(rsize_t a1, void *a2)
{
  if (fipspost_trace_is_active())
    fipspost_trace_call((uint64_t)"cc_clear");
  return memset_s(a2, a1, 0, a1);
}

uint64_t ccder_sizeof(uint64_t a1, unint64_t a2)
{
  uint64_t v3;

  v3 = ccder_sizeof_tag(a1);
  return v3 + a2 + ccder_sizeof_len(a2);
}

unint64_t ccder_sizeof_overflow(uint64_t a1, unint64_t a2, char *a3)
{
  unint64_t result;
  char v5;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  if (*a3)
  {
    result = 0;
    v5 = 1;
  }
  else
  {
    v7 = ccder_sizeof_tag(a1);
    v8 = ccder_sizeof_len(a2);
    v9 = __CFADD__(v8 + v7, a2);
    result = v8 + v7 + a2;
    v5 = v9;
  }
  *a3 = v5;
  return result;
}

uint64_t cczp_power_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v12;
  unint64_t *v13;
  uint64_t result;
  _QWORD *v15;
  uint64_t *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;

  v12 = cczp_n(a2);
  v13 = (unint64_t *)cczp_prime(a2);
  if ((ccn_cmp(v12, a4, v13) & 0x80000000) == 0)
    return 4294967289;
  v19 = *(_QWORD *)(a1 + 16);
  v15 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4 * v12);
  v16 = (uint64_t *)(*(uint64_t (**)(uint64_t))(a1 + 24))(a1);
  v17 = (unint64_t *)cczp_prime(a2);
  ccn_sub1(v12, v15, v17, 1uLL);
  cczp_to_ws(a1, a2);
  ccn_set(v12, &v15[v12], a4);
  cczp_sqr_ws(a1, a2);
  cczp_mul_ws(a1, a2);
  ccn_set(v12, a3, v15);
  v18 = (a5 & 1) + a5;
  if (v18 >= 2)
  {
    do
    {
      cczp_sqr_ws(a1, a2);
      cczp_sqr_ws(a1, a2);
      ccn_mux(2 * v12, (*(_QWORD *)((char *)a6 + (((v18 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v18 - 1)) & 1, v16, &v15[2 * v12], v15);
      v18 -= 2;
      ccn_mux(v12, (*(_QWORD *)((char *)a6 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v18) & 1, v16, &v16[v12], v16);
      cczp_mul_ws(a1, a2);
    }
    while (v18 > 1);
  }
  cczp_cond_negate(a2, (*a6 & 3) == 0, (uint64_t *)a3, (unint64_t *)a3);
  result = 0;
  *(_QWORD *)(a1 + 16) = v19;
  return result;
}

uint64_t ccccm_context_size(uint64_t *a1)
{
  char v1;
  uint64_t v7;
  char v9;

  v1 = 0;
  v9 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v1 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v1 = 1;
    }
  }
  v9 = v1;
  v7 = *a1;
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccccm_block_size(uint64_t a1)
{
  char v1;
  uint64_t v7;
  char v9;

  v1 = 0;
  v9 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v1 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v1 = 1;
    }
  }
  v9 = v1;
  v7 = *(_QWORD *)(a1 + 16);
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccccm_init(uint64_t a1)
{
  char v1;
  uint64_t v7;
  char v9;

  v1 = 0;
  v9 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v1 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v1 = 1;
    }
  }
  v9 = v1;
  v7 = (*(uint64_t (**)(void))(a1 + 24))();
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccccm_set_iv(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v14;
  char v16;

  v8 = 0;
  v16 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v8 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v8 = 1;
    }
  }
  v16 = v8;
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(a2, a3, a4, a5, a6, a7, a8);
  cc_disable_dit(&v16);
  return v14;
}

uint64_t ccccm_cbcmac(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v5;
  uint64_t v11;
  char v13;

  v5 = 0;
  v13 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v5 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v5 = 1;
    }
  }
  v13 = v5;
  v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40))(a2, a3, a4, a5);
  cc_disable_dit(&v13);
  return v11;
}

uint64_t ccccm_aad(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v5;
  uint64_t v11;
  char v13;

  v5 = 0;
  v13 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v5 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v5 = 1;
    }
  }
  v13 = v5;
  v11 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 40))(a2, a3, a4, a5);
  cc_disable_dit(&v13);
  return v11;
}

uint64_t ccccm_update(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v6;
  uint64_t v12;
  char v14;

  v6 = 0;
  v14 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v6 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v6 = 1;
    }
  }
  v14 = v6;
  v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48))(a2, a3, a4, a5, a6);
  cc_disable_dit(&v14);
  return v12;
}

uint64_t ccccm_encrypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v6;
  uint64_t v12;
  char v14;

  v6 = 0;
  v14 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v6 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v6 = 1;
    }
  }
  v14 = v6;
  if (*(_BYTE *)(a1 + 80))
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48))(a2, a3, a4, a5, a6);
  else
    v12 = 4294967228;
  cc_disable_dit(&v14);
  return v12;
}

uint64_t ccccm_decrypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  char v6;
  uint64_t v12;
  char v14;

  v6 = 0;
  v14 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v6 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v6 = 1;
    }
  }
  v14 = v6;
  if (*(_BYTE *)(a1 + 80))
    v12 = 4294967228;
  else
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 48))(a2, a3, a4, a5, a6);
  cc_disable_dit(&v14);
  return v12;
}

uint64_t ccccm_finalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v4;
  uint64_t v10;
  char v12;

  v4 = 0;
  v12 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v4 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v4 = 1;
    }
  }
  v12 = v4;
  v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 56))(a2, a3, a4);
  cc_disable_dit(&v12);
  return v10;
}

uint64_t ccccm_finalize_and_generate_tag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char v4;
  uint64_t v10;
  char v12;

  v4 = 0;
  v12 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v4 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v4 = 1;
    }
  }
  v12 = v4;
  if (*(_BYTE *)(a1 + 80))
    v10 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a1 + 56))(a2, a3, a4);
  else
    v10 = 4294967228;
  cc_disable_dit(&v12);
  return v10;
}

uint64_t ccccm_finalize_and_verify_tag(uint64_t a1, uint64_t a2, uint64_t a3, char *a4)
{
  char v6;
  uint64_t v12;
  uint64_t v13;
  char v15;
  char v16[16];
  uint64_t v17;

  v6 = 0;
  v17 = *MEMORY[0x24BDB0D28];
  v15 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v6 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v6 = 1;
    }
  }
  v15 = v6;
  if (*(_BYTE *)(a1 + 80))
  {
    v13 = 4294967228;
  }
  else
  {
    v12 = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 56))(a2, a3, v16);
    if ((_DWORD)v12)
    {
      v13 = v12;
    }
    else if (cc_cmp_safe(*(_QWORD *)(a3 + 88), v16, a4))
    {
      cc_clear(*(_QWORD *)(a3 + 88), v16);
      v13 = 4294967227;
    }
    else
    {
      v13 = 0;
    }
  }
  cc_disable_dit(&v15);
  return v13;
}

uint64_t ccccm_reset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v9;
  char v11;

  v3 = 0;
  v11 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v3 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v3 = 1;
    }
  }
  v11 = v3;
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 64))(a2, a3);
  cc_disable_dit(&v11);
  return v9;
}

uint64_t ccccm_one_shot(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  char v17;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v31 = a8;
  v17 = 0;
  v33 = *MEMORY[0x24BDB0D28];
  v32 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v17 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v17 = 1;
    }
  }
  v32 = v17;
  v23 = MEMORY[0x24BDB0C10](a1);
  v25 = (char *)&v30 - v24;
  MEMORY[0x24BDB0C10](v23);
  v27 = (char *)&v30 - v26;
  v28 = (*(uint64_t (**)(uint64_t, char *))(a1 + 24))(a1, v25);
  if (!(_DWORD)v28)
  {
    v28 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(v25, v27, a4, a5, a11, a9, a6);
    if (!(_DWORD)v28)
    {
      v28 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t))(a1 + 40))(v25, v27, a9, a10);
      if (!(_DWORD)v28)
      {
        v28 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t, uint64_t))(a1 + 48))(v25, v27, a6, a7, v31);
        if (!(_DWORD)v28)
          v28 = (*(uint64_t (**)(char *, char *, uint64_t))(a1 + 56))(v25, v27, a12);
      }
    }
  }
  cc_clear(*(_QWORD *)a1, v25);
  cc_clear(*(_QWORD *)(a1 + 8), v27);
  cc_disable_dit(&v32);
  return v28;
}

uint64_t ccccm_one_shot_encrypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  char v16;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v16 = 0;
  v33 = *MEMORY[0x24BDB0D28];
  v32 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v16 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v16 = 1;
    }
  }
  v32 = v16;
  if (*(_BYTE *)(a1 + 80))
  {
    v31 = a8;
    v23 = MEMORY[0x24BDB0C10](a1);
    v25 = (char *)&v30 - v24;
    MEMORY[0x24BDB0C10](v23);
    v27 = (char *)&v30 - v26;
    v28 = (*(uint64_t (**)(uint64_t, char *))(a1 + 24))(a1, v25);
    if (!(_DWORD)v28)
    {
      v28 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(v25, v27, a4, a5, a11, a9, a6);
      if (!(_DWORD)v28)
      {
        v28 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t))(a1 + 40))(v25, v27, a9, a10);
        if (!(_DWORD)v28)
        {
          v28 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t, uint64_t))(a1 + 48))(v25, v27, a6, a7, v31);
          if (!(_DWORD)v28)
            v28 = (*(uint64_t (**)(char *, char *, uint64_t))(a1 + 56))(v25, v27, a12);
        }
      }
    }
    cc_clear(*(_QWORD *)a1, v25);
    cc_clear(*(_QWORD *)(a1 + 8), v27);
  }
  else
  {
    v28 = 4294967228;
  }
  cc_disable_dit(&v32);
  return v28;
}

uint64_t ccccm_one_shot_decrypt(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char *a12)
{
  char v16;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v16 = 0;
  v33 = *MEMORY[0x24BDB0D28];
  v32 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v16 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v16 = 1;
    }
  }
  v32 = v16;
  if (*(_BYTE *)(a1 + 80))
  {
    v28 = 4294967228;
  }
  else
  {
    v31 = a8;
    v23 = MEMORY[0x24BDB0C10](a1);
    v25 = (char *)&v30 - v24;
    MEMORY[0x24BDB0C10](v23);
    v27 = (char *)&v30 - v26;
    v28 = (*(uint64_t (**)(uint64_t, char *))(a1 + 24))(a1, v25);
    if (!(_DWORD)v28)
    {
      v28 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 32))(v25, v27, a4, a5, a11, a9, a6);
      if (!(_DWORD)v28)
      {
        v28 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t))(a1 + 40))(v25, v27, a9, a10);
        if (!(_DWORD)v28)
        {
          v28 = (*(uint64_t (**)(char *, char *, uint64_t, uint64_t, uint64_t))(a1 + 48))(v25, v27, a6, a7, v31);
          if (!(_DWORD)v28)
            v28 = ccccm_finalize_and_verify_tag(a1, (uint64_t)v25, (uint64_t)v27, a12);
        }
      }
    }
    cc_clear(*(_QWORD *)a1, v25);
    cc_clear(*(_QWORD *)(a1 + 8), v27);
  }
  cc_disable_dit(&v32);
  return v28;
}

uint64_t ccec_extract_rs_ws(uint64_t a1, uint64_t *a2, uint64_t a3, unsigned __int8 *a4, char *a5, char *a6)
{
  unint64_t v12;
  uint64_t v13;
  unint64_t *v14;
  unint64_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t result;

  v12 = *(_QWORD *)*a2;
  v13 = *(_QWORD *)(a1 + 16);
  v14 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v12);
  v15 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v12);
  if (ccder_decode_seqii(v12, v14, v15, a4, &a4[a3]) != &a4[a3]
    || a5 && (v16 = ccec_signature_r_s_size(a2), (ccn_write_uint_padded_ct(v12, v14, v16, a5) & 0x80000000) != 0)
    || a6 && (v17 = ccec_signature_r_s_size(a2), (ccn_write_uint_padded_ct(v12, v15, v17, a6) & 0x80000000) != 0))
  {
    result = 4294967289;
  }
  else
  {
    result = 0;
  }
  *(_QWORD *)(a1 + 16) = v13;
  return result;
}

uint64_t ccec_extract_rs(uint64_t *a1, uint64_t a2, unsigned __int8 *a3, char *a4, char *a5)
{
  char v10;
  uint64_t rs_ws;
  _QWORD v18[4];
  void (*v19)(uint64_t);
  char v20;

  v10 = 0;
  v20 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v10 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v10 = 1;
    }
  }
  v20 = v10;
  v18[0] = cc_malloc_clear(16 * *(_QWORD *)*a1);
  v18[1] = 2 * *(_QWORD *)*a1;
  v18[2] = 0;
  v18[3] = cc_ws_alloc;
  v19 = cc_ws_free;
  if (v18[0])
  {
    rs_ws = ccec_extract_rs_ws((uint64_t)v18, a1, a2, a3, a4, a5);
    v19((uint64_t)v18);
  }
  else
  {
    rs_ws = 4294967283;
  }
  cc_disable_dit(&v20);
  return rs_ws;
}

uint64_t ccec_verify_digest(unint64_t **a1, unint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned __int8 *a5, _QWORD *a6)
{
  char v12;
  uint64_t v18;
  _QWORD v20[4];
  void (*v21)(uint64_t);
  char v22;

  v12 = 0;
  v22 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v12 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v12 = 1;
    }
  }
  v22 = v12;
  v20[0] = cc_malloc_clear(376 * **a1);
  v20[1] = 47 * **a1;
  v20[2] = 0;
  v20[3] = cc_ws_alloc;
  v21 = cc_ws_free;
  if (v20[0])
  {
    v18 = ccec_verify_digest_ws((uint64_t)v20, a1, a2, a3, a4, a5, a6);
    v21((uint64_t)v20);
  }
  else
  {
    v18 = 4294967283;
  }
  cc_disable_dit(&v22);
  return v18;
}

uint64_t ccec_verify_digest_ws(uint64_t a1, unint64_t **a2, unint64_t a3, unsigned __int8 *a4, uint64_t a5, unsigned __int8 *a6, _QWORD *a7)
{
  unint64_t v13;
  uint64_t v14;
  unint64_t *v15;
  unint64_t *v16;
  uint64_t result;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDB0D28];
  if (a7)
  {
    *a7 = 0;
    a7[1] = 0;
  }
  v19 = 0uLL;
  v13 = **a2;
  v14 = *(_QWORD *)(a1 + 16);
  v15 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v13);
  v16 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v13);
  if (ccder_decode_seqii(v13, v15, v16, a6, &a6[a5]) == &a6[a5])
  {
    result = ccec_verify_internal_ws(a1, a2, a3, a4, v15, v16, (uint64_t)&v19);
    if (a7 && !(_DWORD)result)
      *(_OWORD *)a7 = v19;
  }
  else
  {
    result = 4294967289;
  }
  *(_QWORD *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_verify_msg_ws(uint64_t a1, unint64_t **a2, unint64_t *a3, size_t a4, char *a5, uint64_t a6, unsigned __int8 *a7, _QWORD *a8)
{
  unsigned __int8 v15[64];
  uint64_t v16;

  v16 = *MEMORY[0x24BDB0D28];
  ccdigest((uint64_t)a3, a4, a5, (uint64_t)v15);
  return ccec_verify_digest_ws(a1, a2, *a3, v15, a6, a7, a8);
}

uint64_t ccec_verify_msg(unint64_t **a1, unint64_t *a2, size_t a3, char *a4, uint64_t a5, unsigned __int8 *a6, _QWORD *a7)
{
  char v14;
  unint64_t *v20;
  uint64_t v21;
  _QWORD v23[4];
  void (*v24)(uint64_t);
  char v25;
  unsigned __int8 v26[64];
  uint64_t v27;

  v14 = 0;
  v27 = *MEMORY[0x24BDB0D28];
  v25 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v14 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v14 = 1;
    }
  }
  v25 = v14;
  v20 = *a1;
  v23[0] = cc_malloc_clear(376 * **a1);
  v23[1] = 47 * *v20;
  v23[2] = 0;
  v23[3] = cc_ws_alloc;
  v24 = cc_ws_free;
  if (v23[0])
  {
    ccdigest((uint64_t)a2, a3, a4, (uint64_t)v26);
    v21 = ccec_verify_digest_ws((uint64_t)v23, a1, *a2, v26, a5, a6, a7);
    v24((uint64_t)v23);
  }
  else
  {
    v21 = 4294967283;
  }
  cc_disable_dit(&v25);
  return v21;
}

uint64_t ccec_verify(unint64_t **a1, unint64_t a2, unsigned __int8 *a3, uint64_t a4, unsigned __int8 *a5, BOOL *a6)
{
  char v7;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  char v17;

  v7 = 0;
  v17 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v7 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v7 = 1;
    }
  }
  v17 = v7;
  *a6 = 0;
  v13 = ccec_verify_digest(a1, a2, a3, a4, a5, 0);
  if (v13 == -146)
    v14 = 0;
  else
    v14 = v13;
  if (v13)
    v15 = v14;
  else
    v15 = 0;
  *a6 = v13 == 0;
  cc_disable_dit(&v17);
  return v15;
}

uint64_t ccec_x963_import_priv_size(uint64_t a1)
{
  char v1;
  uint64_t v7;
  char v9;

  v1 = 0;
  v9 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v1 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v1 = 1;
    }
  }
  v9 = v1;
  if (a1 <= 96)
  {
    if (a1 == 73)
    {
      v7 = 192;
      goto LABEL_17;
    }
    if (a1 == 85)
    {
      v7 = 224;
      goto LABEL_17;
    }
LABEL_16:
    v7 = 0;
    goto LABEL_17;
  }
  if (a1 == 97)
  {
    v7 = 256;
    goto LABEL_17;
  }
  if (a1 == 145)
  {
    v7 = 384;
    goto LABEL_17;
  }
  if (a1 != 199)
    goto LABEL_16;
  v7 = 521;
LABEL_17:
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccec_x963_import_priv_ws(uint64_t a1, unint64_t *a2, unint64_t a3, unsigned __int8 *a4, unint64_t **a5)
{
  unsigned int v5;
  BOOL v6;
  int v7;
  unint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  unint64_t v18;
  unint64_t **v19;
  unint64_t v20;
  uint64_t v21;

  v5 = *a4;
  v6 = v5 > 7;
  v7 = (1 << v5) & 0xD0;
  if (v6 || v7 == 0)
    return 4294967289;
  v14 = a2 + 4;
  if (a3 < (unint64_t)(cczp_bitlen((uint64_t)&a2[5 * *a2 + 4]) + 7) >> 3)
    return 4294967289;
  v15 = *(_QWORD *)(a1 + 16);
  v16 = cczp_bitlen((uint64_t)&v14[5 * *a2]);
  result = ccec_x963_import_pub_ws(a1, a2, a3 - ((unint64_t)(v16 + 7) >> 3), a4, a5);
  if (!(_DWORD)result)
  {
    v18 = *a2;
    v19 = &a5[3 * **a5 + 2];
    v20 = (unint64_t)(cczp_bitlen((uint64_t)&v14[5 * *a2]) + 7) >> 3;
    v21 = cczp_bitlen((uint64_t)a2);
    result = ccn_read_uint(v18, v19, v20, &a4[((unint64_t)(v21 + 7) >> 2) | 1]);
  }
  *(_QWORD *)(a1 + 16) = v15;
  return result;
}

uint64_t ccec_x963_import_priv(unint64_t *a1, unint64_t a2, unsigned __int8 *a3, unint64_t **a4)
{
  char v8;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];
  void (*v19)(uint64_t);
  char v20;

  v8 = 0;
  v20 = 0;
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if ((_ReadStatusReg(ARM64_SYSREG(3, 3, 4, 2, 5)) & 0x1000000) != 0)
    {
      v8 = 0;
    }
    else
    {
      __asm { MSR             DIT, #1 }
      v8 = 1;
    }
  }
  v20 = v8;
  v14 = cc_malloc_clear(160 * *a1);
  v15 = 20 * *a1;
  v18[0] = v14;
  v18[1] = v15;
  v18[2] = 0;
  v18[3] = cc_ws_alloc;
  v19 = cc_ws_free;
  if (v14)
  {
    v16 = ccec_x963_import_priv_ws((uint64_t)v18, a1, a2, a3, a4);
    v19((uint64_t)v18);
  }
  else
  {
    v16 = 4294967283;
  }
  cc_disable_dit(&v20);
  return v16;
}

uint64_t ccmode_siv_hmac_reset(uint64_t a1)
{
  cchmac_init(*(_QWORD *)(*(_QWORD *)a1 + 56), (_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 8) >> 1, (char *)(a1 + 32));
  *(_QWORD *)(a1 + 24) = 2;
  return 0;
}

uint64_t ccmode_ccm_macdata(uint64_t result, uint64_t a2, int a3, unint64_t a4, uint64_t a5)
{
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v8 = result;
  v9 = *(_DWORD *)(*(_QWORD *)result + 8);
  if (a3)
  {
    result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)result + 24))(result + 8, 1, a2 + 16, a2 + 16);
    v10 = 0;
    *(_DWORD *)(a2 + 72) = 0;
  }
  else
  {
    v10 = *(_DWORD *)(a2 + 72);
  }
  v17 = a2;
  if (a4)
  {
    v11 = 0;
    v12 = a2 + 16;
    v13 = a5 - 1;
    v14 = a2 + 15;
    do
    {
      if (a4 - v11 >= v9 - v10)
        v15 = v9 - v10;
      else
        v15 = a4 - v11;
      if (v15)
      {
        v16 = v15;
        do
        {
          *(_BYTE *)(v14 + v10 + v16) ^= *(_BYTE *)(v13 + v11 + v16);
          --v16;
        }
        while (v16);
      }
      v10 = (v10 + v15) % v9;
      if (!v10)
        result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)v8 + 24))(v8 + 8, 1, v12, v12);
      v11 += v15;
    }
    while (v11 < a4);
  }
  *(_DWORD *)(v17 + 72) = v10;
  return result;
}

uint64_t ccmode_ccm_cbcmac(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  if (a3 && *(_DWORD *)(a2 + 64) != 4)
    return 4294967228;
  ccmode_ccm_macdata(a1, a2, 0, a3, a4);
  return 0;
}

void cced25519_sign_with_rng_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_22182E000, log, OS_LOG_TYPE_FAULT, "cced25519_sign: pk != sk * G", v1, 2u);
}

void ccec_sign_internal_ws_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDB0D28];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_22182E000, a2, OS_LOG_TYPE_FAULT, "Digest should be at least 128 bits long: argument digest_len = %lu", (uint8_t *)&v2, 0xCu);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDB0D08]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x24BDB0D10]();
}

uint64_t __udivti3()
{
  return MEMORY[0x24BDB0C18]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDB12D0](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_once()
{
  return MEMORY[0x24BDB11D0]();
}

void abort(void)
{
  MEMORY[0x24BDB0D40]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDB0D68](a1, a2);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x24BDB0D70](*(_QWORD *)&__clock_id);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDB0DA8](a1, a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x24BDB0DB0](*(_QWORD *)&a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDB1128](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDB0DF8](__ptr, __size, __nitems, __stream);
}

int getentropy(void *buffer, size_t size)
{
  return MEMORY[0x24BDB0FD0](buffer, size);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDB1008]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDB1048](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDB1190](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDB0E20](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDB0E28](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDB0E30](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDB0E38](__b, *(_QWORD *)&__c, __len);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDB0E48](__s, __smax, *(_QWORD *)&__c, __n);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDB12E0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDB12E8](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDB1270](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDB1278](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDB1288](lock);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDB0E58](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDB0E60](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDB0E80](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDB0E98](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDB0EB8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDB0EC0](__s1, __s2, __n);
}

