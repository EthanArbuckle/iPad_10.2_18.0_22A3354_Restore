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

uint64_t ccentropy_rng_init(_QWORD *a1, uint64_t a2)
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
  *a1 = &off_1000348A0;
  a1[1] = a2;
  cc_disable_dit(&v9);
  return 0;
}

uint64_t sub_100004EE0(uint64_t a1)
{
  return (**(uint64_t (***)(void))(a1 + 8))();
}

uint64_t sub_100004EF0(unint64_t *a1, uint64_t a2, int a3, int a4)
{
  char *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t *v7;
  int v8;
  unint64_t v9;
  uint64_t result;
  unsigned int v11;
  uint64_t v12;
  BOOL v13;
  uint64_t *v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t *v19;
  int v20;
  unint64_t v21;
  unsigned int v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t *v31;
  int v32;
  unint64_t v33;
  unsigned int v34;
  uint64_t v35;
  unint64_t *v36;
  int v37;
  uint64_t v38;

  v4 = &byte_100029E80;
  *(_DWORD *)(a2 + 240) = 16 * a4;
  if (a3 == 6)
  {
    v15 = *a1;
    v16 = a1[1];
    v14 = (uint64_t *)(a1 + 2);
    *(_QWORD *)a2 = v15;
    *(_QWORD *)(a2 + 8) = v16;
    v17 = (uint64_t *)(a2 + 16);
    v18 = *v14;
    *v17 = *v14;
    v19 = (unint64_t *)(v17 + 1);
    v20 = 4 * a4 - 2;
    do
    {
      HIDWORD(v21) = HIDWORD(v18);
      LODWORD(v21) = HIDWORD(v18);
      v22 = *v4++;
      result = v22;
      v23 = (byte_100029E8C[BYTE5(v18)] | (byte_100029E8C[(v21 >> 8) >> 24] << 24) | (byte_100029E8C[((v21 >> 8) >> 16)] << 16) | (byte_100029E8C[(unsigned __int16)(HIDWORD(v18) >> 8) >> 8] << 8)) ^ v22;
      v15 ^= v23 ^ ((v15 ^ v23) << 32);
      v16 ^= HIDWORD(v15) ^ ((v16 ^ HIDWORD(v15)) << 32);
      v18 ^= HIDWORD(v16) ^ ((v18 ^ HIDWORD(v16)) << 32);
      *v19 = v15;
      v19[1] = v16;
      v24 = v19 + 2;
      *v24 = v18;
      v19 = v24 + 1;
      v13 = __OFSUB__(v20, 6);
      v20 -= 6;
    }
    while (!((v20 < 0) ^ v13 | (v20 == 0)));
  }
  else if (a3 == 8)
  {
    v26 = *a1;
    v27 = a1[1];
    v25 = a1 + 2;
    *(_QWORD *)a2 = v26;
    *(_QWORD *)(a2 + 8) = v27;
    v28 = (unint64_t *)(a2 + 16);
    v29 = *v25;
    v30 = v25[1];
    *v28 = *v25;
    v28[1] = v30;
    v31 = v28 + 2;
    v32 = 4 * a4 - 4;
    do
    {
      HIDWORD(v33) = HIDWORD(v30);
      LODWORD(v33) = HIDWORD(v30);
      v34 = *v4++;
      result = v34;
      v35 = (byte_100029E8C[BYTE5(v30)] | (byte_100029E8C[(v33 >> 8) >> 24] << 24) | (byte_100029E8C[((v33 >> 8) >> 16)] << 16) | (byte_100029E8C[(unsigned __int16)(HIDWORD(v30) >> 8) >> 8] << 8)) ^ v34;
      v26 ^= v35 ^ ((v26 ^ v35) << 32);
      v27 ^= HIDWORD(v26) ^ ((v27 ^ HIDWORD(v26)) << 32);
      *v31 = v26;
      v31[1] = v27;
      v36 = v31 + 2;
      v37 = v32 - 4;
      if (!v37)
        break;
      result = byte_100029E8C[HIBYTE(HIDWORD(v27))];
      v38 = byte_100029E8C[BYTE4(v27)] | ((_DWORD)result << 24) | (byte_100029E8C[BYTE6(v27)] << 16) | (byte_100029E8C[BYTE5(v27)] << 8);
      v29 ^= v38 ^ ((v29 ^ v38) << 32);
      v30 ^= HIDWORD(v29) ^ ((v30 ^ HIDWORD(v29)) << 32);
      *v36 = v29;
      v36[1] = v30;
      v31 = v36 + 2;
      v13 = __OFSUB__(v37, 4);
      v32 = v37 - 4;
    }
    while (!((v32 < 0) ^ v13 | (v32 == 0)));
  }
  else
  {
    v5 = *a1;
    v6 = a1[1];
    *(_QWORD *)a2 = *a1;
    *(_QWORD *)(a2 + 8) = v6;
    v7 = (unint64_t *)(a2 + 16);
    v8 = 4 * a4;
    do
    {
      HIDWORD(v9) = HIDWORD(v6);
      LODWORD(v9) = HIDWORD(v6);
      v11 = *v4++;
      result = v11;
      v12 = (byte_100029E8C[BYTE5(v6)] | (byte_100029E8C[(v9 >> 8) >> 24] << 24) | (byte_100029E8C[((v9 >> 8) >> 16)] << 16) | (byte_100029E8C[(unsigned __int16)(HIDWORD(v6) >> 8) >> 8] << 8)) ^ v11;
      v5 ^= v12 ^ ((v5 ^ v12) << 32);
      v6 ^= HIDWORD(v5) ^ ((v6 ^ HIDWORD(v5)) << 32);
      *v7 = v5;
      v7[1] = v6;
      v7 += 2;
      v13 = __OFSUB__(v8, 4);
      v8 -= 4;
    }
    while (!((v8 < 0) ^ v13 | (v8 == 0)));
  }
  return result;
}

uint64_t ccaes_arm_encrypt_key128(unint64_t *a1, uint64_t a2)
{
  return sub_100004EF0(a1, a2, 4, 10);
}

uint64_t ccaes_arm_encrypt_key192(unint64_t *a1, uint64_t a2)
{
  return sub_100004EF0(a1, a2, 6, 12);
}

uint64_t ccaes_arm_encrypt_key256(unint64_t *a1, uint64_t a2)
{
  return sub_100004EF0(a1, a2, 8, 14);
}

__n128 sub_100005110(unint64_t *a1, uint64_t a2, int a3, uint64_t a4)
{
  __n128 *v4;
  uint64_t v5;
  __n128 result;

  sub_100004EF0(a1, a2, a3, a4);
  v4 = (__n128 *)(a2 + 16);
  v5 = a4 - 1;
  do
  {
    --v5;
    _Q0 = *v4;
    __asm { AESIMC          V0.16B, V0.16B }
    *v4++ = result;
  }
  while (!(_NF ^ _VF | _ZF));
  return result;
}

double ccaes_arm_decrypt_key128(unint64_t *a1, uint64_t a2)
{
  double result;

  *(_QWORD *)&result = sub_100005110(a1, a2, 4, 10).n128_u64[0];
  return result;
}

double ccaes_arm_decrypt_key192(unint64_t *a1, uint64_t a2)
{
  double result;

  *(_QWORD *)&result = sub_100005110(a1, a2, 6, 12).n128_u64[0];
  return result;
}

double ccaes_arm_decrypt_key256(unint64_t *a1, uint64_t a2)
{
  double result;

  *(_QWORD *)&result = sub_100005110(a1, a2, 8, 14).n128_u64[0];
  return result;
}

uint64_t ccaes_arm_encrypt_key(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6;
  unint64_t v8;

  v6 = a2;
  v8 = a3;
  if (a3 > 32)
    v8 = (unint64_t)a3 >> 3;
  switch(v8)
  {
    case 0x10uLL:
      ccaes_arm_encrypt_key128(a4, v6);
      break;
    case 0x18uLL:
      ccaes_arm_encrypt_key192(a4, v6);
      break;
    case 0x20uLL:
      ccaes_arm_encrypt_key256(a4, v6);
      break;
    default:
      return -1;
  }
  return 0;
}

uint64_t ccaes_arm_decrypt_key(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v6;
  unint64_t v8;

  v6 = a2;
  v8 = a3;
  if (a3 > 32)
    v8 = (unint64_t)a3 >> 3;
  switch(v8)
  {
    case 0x10uLL:
      ccaes_arm_decrypt_key128(a4, v6);
      break;
    case 0x18uLL:
      ccaes_arm_decrypt_key192(a4, v6);
      break;
    case 0x20uLL:
      ccaes_arm_decrypt_key256(a4, v6);
      break;
    default:
      return -1;
  }
  return 0;
}

uint64_t *ccrng_prng(_DWORD *a1)
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
  pthread_once(&stru_100039AA0, (void (*)(void))sub_100005310);
  if (a1)
    *a1 = 0;
  cc_disable_dit(&v9);
  return &qword_100039BB0;
}

uint64_t sub_100005310()
{
  uint64_t result;

  if (ccrng_process_init((uint64_t)&off_100039BC0, sub_1000053A4, (uint64_t (**)(_QWORD, uint64_t, _OWORD *))&ccrng_getentropy))cc_abort();
  result = pthread_atfork((void (*)(void))sub_1000053EC, (void (*)(void))sub_100005418, (void (*)(void))sub_100005444);
  if ((_DWORD)result)
    cc_abort();
  qword_100039BB0 = (uint64_t)sub_100005470;
  return result;
}

uint64_t *ccrng(_DWORD *a1)
{
  ccrng_prng(a1);
  return &qword_100039BB0;
}

uint64_t sub_1000053A4()
{
  timespec v1;

  v1.tv_sec = 0;
  v1.tv_nsec = 0;
  if (clock_gettime(_CLOCK_MONOTONIC, &v1))
    cc_abort();
  return v1.tv_nsec + 1000000000 * v1.tv_sec;
}

uint64_t sub_1000053EC()
{
  uint64_t result;

  result = ccrng_process_atfork_prepare((os_unfair_lock_s *)&off_100039BC0);
  if ((_DWORD)result)
    cc_abort();
  return result;
}

uint64_t sub_100005418()
{
  uint64_t result;

  result = ccrng_process_atfork_parent((os_unfair_lock_s *)&off_100039BC0);
  if ((_DWORD)result)
    cc_abort();
  return result;
}

uint64_t sub_100005444()
{
  uint64_t result;

  result = ccrng_process_atfork_child((uint64_t)&off_100039BC0);
  if ((_DWORD)result)
    cc_abort();
  return result;
}

uint64_t sub_100005470()
{
  uint64_t result;

  result = off_100039BC0();
  if ((_DWORD)result)
    cc_abort();
  return result;
}

uint64_t sub_1000054A0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a3 > 127)
  {
    if (a3 != 128 && a3 != 256 && a3 != 192)
      return 4294967289;
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }
  if ((unint64_t)a3 <= 0x20 && ((1 << a3) & 0x101010000) != 0)
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  return 4294967289;
}

uint64_t ccec_mult_blinded_ws(uint64_t a1, uint64_t *a2, uint64_t a3, unint64_t *a4, uint64_t a5, uint64_t (**a6)(_QWORD, uint64_t, uint64_t *))
{
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v10 = *a2;
  v11 = ccn_bitlen(*a2, a4);
  if (v11 > cczp_bitlen((uint64_t)a2))
    return 4294967289;
  v17 = 1;
  if (a6)
  {
    result = (*a6)(a6, 8, &v17);
    if ((_DWORD)result)
      return result;
    v13 = v17 | 0x80000000;
  }
  else
  {
    v13 = 2147483649;
  }
  v17 = v13;
  v14 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * v10);
  v15 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v10);
  ccn_mux_seed_mask(v17);
  v17 = v17;
  result = ccec_mult_ws(a1, (uint64_t)a2);
  if (!(_DWORD)result)
  {
    v16 = 0;
    ccn_divmod_ws(a1, v10, (uint64_t)a4, v10, v15, 1, (char *)&v16, (uint64_t)&v17);
    cczp_bitlen((uint64_t)a2);
    result = ccec_mult_ws(a1, (uint64_t)a2);
    if (!(_DWORD)result)
    {
      result = ccec_mult_ws(a1, (uint64_t)a2);
      if (!(_DWORD)result)
      {
        ccec_full_add_ws(a1, (uint64_t)a2);
        result = 0;
      }
    }
  }
  *(_QWORD *)(a1 + 16) = v14;
  return result;
}

uint64_t sub_1000056C0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  if (a3 > 127)
  {
    if (a3 != 128 && a3 != 256 && a3 != 192)
      return 4294967289;
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  }
  if ((unint64_t)a3 <= 0x20 && ((1 << a3) & 0x101010000) != 0)
    return ccaes_arm_encrypt_key(a1, a2, a3, a4);
  return 4294967289;
}

uint64_t ccecdh_compute_shared_secret_ws(uint64_t a1, _QWORD **a2, _QWORD *a3, unint64_t *a4, char *a5, uint64_t (**a6)(_QWORD, uint64_t, uint64_t *))
{
  _QWORD *v11;
  uint64_t v12;
  unint64_t *v13;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v21;

  v11 = *a2;
  v21 = *(_QWORD *)(a1 + 16);
  v12 = 3 * **a2;
  v13 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  v15 = *a4;
  *a4 = 0;
  v16 = ccn_write_uint_size(*v11, v11 + 3);
  if (v15 < v16
    || *a2 != (_QWORD *)*a3
    || (v17 = v16, ccec_validate_point_and_projectify_ws(a1, v11, (uint64_t)v14, a3 + 2))
    || ccec_validate_scalar(v11, (unint64_t *)&a2[3 * **a2 + 2])
    || ccec_mult_blinded_ws(a1, v11, (uint64_t)v13, (unint64_t *)&a2[3 * **a2 + 2], (uint64_t)v14, a6)|| !ccec_is_point_projective_ws(a1, v11)|| ccec_affinify_x_only_ws(a1, v11, (uint64_t)v13, (uint64_t)v13))
  {
    v18 = 0xFFFFFFFFLL;
  }
  else
  {
    ccn_write_uint_padded_ct(*v11, v13, v17, a5);
    v18 = 0;
    *a4 = v17;
  }
  cc_clear(24 * *v11, v13);
  cc_clear(24 * *v11, v14);
  *(_QWORD *)(a1 + 16) = v21;
  return v18;
}

void *ccaes_cbc_encrypt_mode()
{
  return &ccaes_arm_cbc_encrypt_mode;
}

uint64_t ccec_generate_scalar_fips_retry_ws(uint64_t a1, _QWORD *a2, uint64_t (**a3)(_QWORD, unint64_t, void *), _QWORD *a4)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;

  v8 = a2 + 4;
  v9 = (uint64_t)&a2[5 * *a2 + 4];
  v10 = cczp_n(v9);
  v11 = *(_QWORD *)(a1 + 16);
  v12 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v10);
  v13 = (void *)cczp_prime(v9);
  ccn_set(v10, v12, v13);
  *v12 &= ~1uLL;
  v14 = 100;
  while (1)
  {
    v15 = cczp_bitlen((uint64_t)&v8[5 * *a2]);
    result = ccn_random_bits_fips(v15, a4, a3);
    if ((_DWORD)result)
      break;
    if ((ccn_cmp(v10, a4, v12) & 0x80000000) != 0)
    {
      ccn_add1_ws(a1, v10, a4, a4, 1);
      result = 0;
      break;
    }
    if (!--v14)
    {
      result = 4294967281;
      break;
    }
  }
  *(_QWORD *)(a1 + 16) = v11;
  return result;
}

uint64_t ccn_cond_swap(uint64_t a1, char a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  result = ccn_mux_next_mask();
  for (i = __ROR8__(0x5555555555555555, a2 | (2 * result)); a1; --a1)
  {
    v10 = *a4 ^ *a3;
    *a3 ^= result;
    v11 = *a4 ^ result;
    *a4 = v11;
    v12 = *a3 ^ v10 & 0x5555555555555555;
    v13 = v11 ^ v10 & 0x5555555555555555;
    v14 = v10 & i;
    *a3++ = v12 ^ v14 ^ result;
    *a4++ = v13 ^ v14 ^ result;
  }
  return result;
}

uint64_t *ccaes_ctr_crypt_mode()
{
  unint64_t v0;
  void *v1;

  v0 = ((*(_QWORD *)ccaes_ecb_encrypt_mode() + 7) & 0xFFFFFFFFFFFFFFF8) + 48;
  v1 = ccaes_ecb_encrypt_mode();
  qword_10003A500 = v0;
  unk_10003A508 = xmmword_100029F90;
  qword_10003A518 = (uint64_t)ccmode_ctr_init;
  unk_10003A520 = ccmode_ctr_setctr;
  qword_10003A528 = (uint64_t)ccaes_vng_ctr_crypt;
  unk_10003A530 = v1;
  return &qword_10003A500;
}

void *ccaes_ecb_encrypt_mode()
{
  return &ccaes_arm_ecb_encrypt_mode;
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
  *(_QWORD *)result = off_100034910;
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

  *(_QWORD *)a1 = off_100034920;
  *(_BYTE *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = a3;
  result = a2();
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

uint64_t ccrng_schedule_tree_init(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)result = off_100034930;
  *(_BYTE *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = a2;
  *(_QWORD *)(result + 24) = a3;
  return result;
}

uint64_t sub_100005BA4(uint64_t a1)
{
  unsigned int *v1;
  uint64_t result;

  v1 = (unsigned int *)(a1 + 16);
  do
    result = __ldxr(v1);
  while (__stxr(1u, v1));
  return result;
}

uint64_t sub_100005BC0(uint64_t a1)
{
  if ((unint64_t)((*(uint64_t (**)(void))(a1 + 16))() - *(_QWORD *)(a1 + 32)) < *(_QWORD *)(a1 + 24))
    return 1;
  else
    return 3;
}

uint64_t sub_100005BF8(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(a1 + 16))();
  *(_QWORD *)(a1 + 32) = result;
  return result;
}

uint64_t sub_100005C20(uint64_t a1)
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

uint64_t sub_100005CB0(uint64_t a1)
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

uint64_t ccn_n_asm(uint64_t result, uint64_t *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (result)
  {
    v2 = result;
    result = 0;
    v3 = 0;
    do
    {
      v4 = *a2++;
      ++v3;
      if (v4)
        result = v3;
    }
    while (v3 < v2);
  }
  return result;
}

uint64_t ccaes_vng_ctr_crypt(_QWORD *a1, unint64_t a2, int8x16_t *a3, int8x16_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  int8x16_t *v14;
  int8x16_t *v15;
  _QWORD *v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;

  v7 = a1[1];
  if (a2)
  {
    v10 = a2;
    v11 = *a1;
    v12 = (unint64_t)(*(_QWORD *)(*a1 + 8) + 7) >> 3;
    v13 = a1 + 2;
    v14 = (int8x16_t *)&a1[2 * v12 + 2];
    v15 = (int8x16_t *)&a1[v12 + 2];
    v16 = &a1[v12];
    while (1)
    {
      if (v7 == 16)
      {
        if (v10 >= 0x10)
        {
          aes_ctr_crypt(a3, a4, v10 & 0xFFFFFFFFFFFFFFF0, v15, v14, a6);
          a4 = (int8x16_t *)((char *)a4 + (v10 & 0xFFFFFFFFFFFFFFF0));
          a3 = (int8x16_t *)((char *)a3 + (v10 & 0xFFFFFFFFFFFFFFF0));
          v10 &= 0xFu;
        }
        (*(void (**)(int8x16_t *, uint64_t, int8x16_t *, _QWORD *))(v11 + 24))(v14, 1, v15, a1 + 2);
        v17 = 31;
        do
        {
          if ((unint64_t)(v17 - 15) < 9)
            break;
          v18 = (*((_BYTE *)v16 + v17--))++ + 1;
        }
        while ((v18 & 0x100) != 0);
        v7 = 0;
        v19 = 0;
        if (!v10)
          break;
      }
      v20 = 0;
      do
      {
        v21 = v20 + 1;
        a4->i8[v20] = *((_BYTE *)v13 + v7 + v20) ^ a3->i8[v20];
        v22 = (unint64_t)(v20 + 1 + v7) > 0xF || v10 - 1 == v20;
        ++v20;
      }
      while (!v22);
      v7 += v21;
      a3 = (int8x16_t *)((char *)a3 + v21);
      a4 = (int8x16_t *)((char *)a4 + v21);
      v10 -= v21;
      if (!v10)
        goto LABEL_17;
    }
  }
  else
  {
LABEL_17:
    v19 = v7;
  }
  a1[1] = v19;
  return 0;
}

void *cczp_to_default_ws(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;

  v6 = cczp_n(a2);
  return ccn_set(v6, a3, a4);
}

uint64_t cczp_to_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 56))();
}

void cc_try_abort()
{
  cc_abort();
}

uint64_t cc_try_abort_if (uint64_t result)
{
  if ((_DWORD)result)
    cc_abort();
  return result;
}

uint64_t sizeof_struct_ccec_full_ctx()
{
  return 16;
}

unint64_t cczp_negate(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v6;
  _BOOL8 v7;
  uint64_t *v8;

  v6 = cczp_n(a1);
  v7 = ccn_n(v6, a3) != 0;
  v8 = (uint64_t *)cczp_prime(a1);
  return ccn_cond_rsub(v6, v7, a2, a3, v8);
}

unint64_t cczp_cond_negate(uint64_t a1, unsigned __int8 a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;

  v8 = cczp_n(a1);
  v9 = (ccn_n(v8, a4) != 0) & a2;
  v10 = (uint64_t *)cczp_prime(a1);
  return ccn_cond_rsub(v8, v9, a3, a4, v10);
}

void *cczp_from_default_ws(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;

  v6 = cczp_n(a2);
  return ccn_set(v6, a3, a4);
}

uint64_t cczp_from_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 64))();
}

unint64_t ccn_mul1_asm(uint64_t a1, _QWORD *a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int128 v8;
  BOOL v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t v12;
  unsigned __int128 v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  BOOL v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = 0;
  if ((a1 & 1) != 0)
  {
    v5 = *a3++;
    v4 = (v5 * (unsigned __int128)a4) >> 64;
    *a2++ = v5 * a4;
    --a1;
  }
  if ((a1 & 2) != 0)
  {
    v6 = *a3;
    v7 = a3[1];
    a3 += 2;
    v8 = v6 * (unsigned __int128)a4 + __PAIR128__(v7 * a4, v4);
    v4 = (__CFADD__(__CFADD__(v6 * a4, v4), (v6 * (unsigned __int128)a4) >> 64) | __CFADD__(v7 * a4, *((_QWORD *)&v8 + 1)))+ ((v7 * (unsigned __int128)a4) >> 64);
    *(_OWORD *)a2 = v8;
    a2 += 2;
    a1 -= 2;
  }
  while (1)
  {
    v9 = a1 < 4;
    a1 -= 4;
    if (v9)
      break;
    v11 = *a3;
    v12 = a3[1];
    v10 = a3 + 2;
    v14 = *v10;
    v15 = v10[1];
    a3 = v10 + 2;
    v16 = (v12 * (unsigned __int128)a4) >> 64;
    v17 = __CFADD__(__CFADD__(v11 * a4, v4), (v11 * (unsigned __int128)a4) >> 64);
    v13 = v11 * (unsigned __int128)a4 + __PAIR128__(v12 * a4, v4);
    *(_OWORD *)a2 = v13;
    v18 = a2 + 2;
    v19 = (v14 * (unsigned __int128)a4) >> 64;
    v20 = v16 + (v17 | __CFADD__(v12 * a4, *((_QWORD *)&v13 + 1))) + v14 * a4;
    v22 = __CFADD__(v17 | __CFADD__(v12 * a4, *((_QWORD *)&v13 + 1)), v14 * a4) | __CFADD__(v16, (v17 | __CFADD__(v12 * a4, *((_QWORD *)&v13 + 1))) + v14 * a4);
    v17 = __CFADD__(v22, v19);
    v21 = v22 + v19;
    v4 = (v17 | __CFADD__(v15 * a4, v21)) + ((v15 * (unsigned __int128)a4) >> 64);
    *v18 = v20;
    v18[1] = v15 * a4 + v21;
    a2 = v18 + 2;
  }
  return v4;
}

_BYTE *ccdigest(uint64_t a1, size_t a2, char *a3, uint64_t a4)
{
  char v8;
  size_t v14;
  char *v15;
  uint64_t v17;

  v8 = 0;
  HIBYTE(v17) = 0;
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
  HIBYTE(v17) = v8;
  v14 = (*(_QWORD *)(a1 + 8) + *(_QWORD *)(a1 + 16) + 19) & 0xFFFFFFFFFFFFFFF8;
  v15 = (char *)&v17 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v15, v14);
  ccdigest_init(a1, v15);
  ccdigest_update(a1, v15, a2, a3);
  (*(void (**)(uint64_t, char *, uint64_t))(a1 + 56))(a1, v15, a4);
  cc_clear(*(_QWORD *)(a1 + 8) + *(_QWORD *)(a1 + 16) + 12, v15);
  return cc_disable_dit((_BYTE *)&v17 + 7);
}

uint64_t ccdigest_final_64be(uint64_t a1, const void *a2, uint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  _QWORD *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v17;
  unsigned int v18;
  uint64_t v20;

  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  v8 = (uint64_t)a2 + v7 + 8;
  if (v6 <= *(unsigned int *)(v8 + v6))
    *(_DWORD *)(v8 + v6) = 0;
  v9 = (v7 + v6 + 19) & 0xFFFFFFFFFFFFFFF8;
  v10 = (uint64_t *)((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v10, v9);
  memcpy(v10, a2, v7 + v6 + 12);
  v11 = (char *)v10 + v7;
  v12 = (uint64_t)v10 + v7 + 8;
  v13 = (char *)(v12 + v6);
  v14 = *(unsigned int *)(v12 + v6);
  *v10 += (8 * v14);
  *(_DWORD *)(v12 + v6) = v14 + 1;
  *(_BYTE *)(v12 + v14) = 0x80;
  v15 = *(unsigned int *)(v12 + v6);
  if (v15 < 0x39)
  {
    if (v15 == 56)
      goto LABEL_9;
  }
  else
  {
    if (v15 <= 0x3F)
    {
      do
      {
        *(_DWORD *)v13 = v15 + 1;
        *(_BYTE *)(v12 + v15) = 0;
        v15 = *(unsigned int *)v13;
      }
      while (v15 < 0x40);
    }
    (*(void (**)(_QWORD *, uint64_t))(a1 + 48))(v10 + 1, 1);
    v15 = 0;
    v11 = (char *)v10 + *(_QWORD *)(a1 + 8);
    v12 = (uint64_t)(v11 + 8);
    v13 = &v11[*(_QWORD *)(a1 + 16) + 8];
    *(_DWORD *)v13 = 0;
  }
  do
  {
    *(_DWORD *)v13 = v15 + 1;
    *(_BYTE *)(v12 + v15) = 0;
    v15 = *(unsigned int *)v13;
  }
  while (v15 < 0x38);
LABEL_9:
  *((_QWORD *)v11 + 8) = bswap64(*v10);
  (*(void (**)(_QWORD *, uint64_t))(a1 + 48))(v10 + 1, 1);
  if (*(_QWORD *)a1 >= 4uLL)
  {
    v16 = 0;
    v17 = 0;
    v18 = 1;
    do
    {
      *(_DWORD *)(a3 + v16) = bswap32(*((_DWORD *)v10 + v17 + 2));
      v17 = v18++;
      v16 += 4;
    }
    while (v17 < *(_QWORD *)a1 >> 2);
  }
  return cc_clear(*(_QWORD *)(a1 + 8) + *(_QWORD *)(a1 + 16) + 12, v10);
}

_BYTE *ccdigest_init(uint64_t a1, _QWORD *a2)
{
  char v4;
  char v11;

  v4 = 0;
  v11 = 0;
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
  v11 = v4;
  memcpy(a2 + 1, *(const void **)(a1 + 40), *(_QWORD *)(a1 + 8));
  *a2 = 0;
  *(_DWORD *)((char *)a2 + *(_QWORD *)(a1 + 8) + *(_QWORD *)(a1 + 16) + 8) = 0;
  return cc_disable_dit(&v11);
}

_BYTE *ccdigest_update(uint64_t a1, _QWORD *a2, size_t a3, char *__src)
{
  size_t v5;
  char v8;
  unint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  char *v17;
  uint64_t v18;
  size_t v20;
  size_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  size_t v27;
  char v29;

  v5 = a3;
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
  v13 = *(_QWORD *)(a1 + 16);
  v14 = (uint64_t)a2 + *(_QWORD *)(a1 + 8) + 8;
  if (v13 <= *(unsigned int *)(v14 + v13))
    *(_DWORD *)(v14 + v13) = 0;
  if (a3)
  {
    v15 = a2 + 1;
    do
    {
      v16 = *(_QWORD *)(a1 + 16);
      v17 = (char *)v15 + *(_QWORD *)(a1 + 8);
      v18 = *(unsigned int *)&v17[v16];
      if (v5 > v16 && (_DWORD)v18 == 0)
      {
        if (v16 == 128)
        {
          v27 = v5 >> 7;
          v21 = v5 & 0xFFFFFFFFFFFFFF80;
        }
        else if (v16 == 64)
        {
          v27 = v5 >> 6;
          v21 = v5 & 0xFFFFFFFFFFFFFFC0;
        }
        else
        {
          v27 = v5 / v16;
          v21 = v5 / v16 * v16;
        }
        (*(void (**)(_QWORD *, size_t, char *))(a1 + 48))(a2 + 1, v27, __src);
        *a2 += 8 * v21;
      }
      else
      {
        v20 = v16 - v18;
        if (v20 >= v5)
          v21 = v5;
        else
          v21 = v20;
        memcpy(&v17[v18], __src, v21);
        v22 = *(_QWORD *)(a1 + 16);
        v23 = (char *)v15 + *(_QWORD *)(a1 + 8);
        v24 = (*(_DWORD *)&v23[v22] + v21);
        *(_DWORD *)&v23[v22] = v24;
        if (v22 == v24)
        {
          (*(void (**)(_QWORD *, uint64_t))(a1 + 48))(a2 + 1, 1);
          v25 = *(_QWORD *)(a1 + 16);
          v26 = (char *)v15 + *(_QWORD *)(a1 + 8);
          *a2 += (8 * *(_DWORD *)&v26[v25]);
          *(_DWORD *)&v26[v25] = 0;
        }
      }
      __src += v21;
      v5 -= v21;
    }
    while (v5);
  }
  return cc_disable_dit(&v29);
}

_BYTE *ccdrbg_factory_nistctr(_QWORD *a1, uint64_t a2)
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
  *a1 = 88;
  a1[1] = sub_10000661C;
  a1[2] = sub_100006A5C;
  a1[3] = sub_100006818;
  a1[4] = sub_100006BA4;
  a1[5] = a2;
  a1[6] = sub_100006BE0;
  return cc_disable_dit(&v9);
}

uint64_t sub_10000661C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8)
{
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  rsize_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v27;
  __int128 __s;
  __int128 v29;
  __int128 v30;

  v13 = *(uint64_t **)(a1 + 40);
  cc_clear(0x58uLL, (void *)a2);
  v19 = *v13;
  v20 = v13[1];
  *(_QWORD *)(a2 + 56) = *v13;
  *(_QWORD *)(a2 + 64) = v20;
  *(_DWORD *)(a2 + 72) = *((_DWORD *)v13 + 4);
  v21 = v13[3];
  *(_QWORD *)(a2 + 80) = v21;
  if (v20 >= 0x21 || *(_QWORD *)(v19 + 16) != 16)
    cc_try_abort();
  if (!v21)
  {
    if (v20 + 16 >= a7 && v20 + 16 == a3)
    {
      v29 = 0u;
      v30 = 0u;
      __s = 0u;
      __memcpy_chk(&__s, a4, a3, 48);
      for (; a7; --a7)
        *((_BYTE *)&v27 + a7 + 7) ^= *(_BYTE *)(a8 - 1 + a7);
      goto LABEL_8;
    }
    v22 = 4294967233;
LABEL_16:
    cc_clear(0x20uLL, (void *)a2);
    cc_clear(0x10uLL, (void *)(a2 + 32));
    v24 = -1;
    goto LABEL_9;
  }
  v22 = 4294967233;
  if ((unint64_t)(a3 - 65537) < 0xFFFFFFFFFFFF000FLL || a7 > 0x10000)
    goto LABEL_16;
  v29 = 0u;
  v30 = 0u;
  __s = 0u;
  HIBYTE(v27) = HIBYTE(a8);
  v23 = sub_100006C04(a2, &__s, 3u, v14, v15, v16, v17, v18, a3);
  if ((_DWORD)v23)
  {
    v22 = v23;
    goto LABEL_16;
  }
  v20 = *(_QWORD *)(a2 + 64);
LABEL_8:
  cc_clear(v20, (void *)a2);
  cc_clear(0x10uLL, (void *)(a2 + 32));
  sub_100006CC4(a2, (uint64_t)&__s);
  v22 = 0;
  v24 = 1;
LABEL_9:
  *(_QWORD *)(a2 + 48) = v24;
  cc_clear(0x30uLL, &__s);
  return v22;
}

uint64_t sub_100006818(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  size_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  _OWORD *v21;
  rsize_t v22;
  _QWORD v24[2];
  _QWORD v25[2];
  _OWORD __s[3];

  memset(__s, 0, sizeof(__s));
  v25[0] = 0;
  v25[1] = 0;
  v10 = (ccctr_context_size(*(uint64_t **)(a1 + 56)) + 15) & 0xFFFFFFFFFFFFFFF0;
  v11 = (char *)v24 - v10;
  bzero((char *)v24 - v10, v10);
  if (a2 > 0x10000)
    goto LABEL_22;
  if (*(_DWORD *)(a1 + 72) && *(_QWORD *)(a1 + 48) > 0x1000000000000uLL)
  {
    v18 = 4294967234;
    goto LABEL_21;
  }
  if (!a4)
    goto LABEL_12;
  if (*(_QWORD *)(a1 + 80))
  {
    if (a4 <= 0x10000)
    {
      v17 = sub_100006C04(a1, __s, 1u, v12, v13, v14, v15, v16, a4);
      if ((_DWORD)v17)
      {
        v18 = v17;
        goto LABEL_21;
      }
      goto LABEL_11;
    }
LABEL_22:
    v18 = 4294967233;
    goto LABEL_21;
  }
  if (*(_QWORD *)(a1 + 64) + 16 < a4)
    goto LABEL_22;
  cc_clear(0x30uLL, __s);
  __memcpy_chk(__s, a5, a4, 48);
LABEL_11:
  sub_100006CC4(a1, (uint64_t)__s);
LABEL_12:
  v24[1] = v24;
  inc_uint(a1 + 40, 8uLL);
  ccctr_init(*(_QWORD *)(a1 + 56));
  for (i = -(int)a2 & 0xFLL; a2; a2 -= v20)
  {
    if (a2 >= 0x80)
      v20 = 128;
    else
      v20 = a2;
    ccctr_update(*(_QWORD *)(a1 + 56), (uint64_t)v11, v20, (uint64_t)&unk_100029FA0, a3);
    a3 += v20;
  }
  ccctr_update(*(_QWORD *)(a1 + 56), (uint64_t)v11, i, (uint64_t)&unk_100029FA0, (uint64_t)v25);
  cc_clear(i, v25);
  if (a4)
    v21 = __s;
  else
    v21 = &unk_100029FA0;
  sub_100006D88(a1, (uint64_t)v11, (uint64_t)v21);
  v22 = ccctr_context_size(*(uint64_t **)(a1 + 56));
  cc_clear(v22, v11);
  v18 = 0;
  ++*(_QWORD *)(a1 + 48);
LABEL_21:
  cc_clear(0x30uLL, __s);
  return v18;
}

uint64_t sub_100006A5C(_QWORD *a1, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  unint64_t v14;
  uint64_t v16;
  _OWORD __s[3];

  v9 = a4;
  memset(__s, 0, sizeof(__s));
  if (!a1[10])
  {
    v14 = a1[8] + 16;
    if (v14 < a4 || v14 != a2)
      return 4294967233;
    __memcpy_chk(__s, a3, a2, 48);
    for (; v9; --v9)
      *((_BYTE *)&v16 + v9 + 7) ^= *(_BYTE *)(a5 - 1 + v9);
    goto LABEL_6;
  }
  v11 = 4294967233;
  if (a2 <= 0x10000 && a4 <= 0x10000 && *(_QWORD *)(a1[7] + 16) <= a2)
  {
    HIBYTE(v16) = HIBYTE(a5);
    v12 = sub_100006C04((uint64_t)a1, __s, 2u, a4, a5, a6, a7, a8, a2);
    if ((_DWORD)v12)
    {
      v11 = v12;
      goto LABEL_7;
    }
LABEL_6:
    sub_100006CC4((uint64_t)a1, (uint64_t)__s);
    v11 = 0;
    a1[6] = 1;
LABEL_7:
    cc_clear(a1[8] + 16, __s);
  }
  return v11;
}

uint64_t sub_100006BA4(char *__s)
{
  uint64_t result;

  cc_clear(0x20uLL, __s);
  result = cc_clear(0x10uLL, __s + 32);
  *((_QWORD *)__s + 6) = -1;
  return result;
}

BOOL sub_100006BE0(uint64_t a1)
{
  return *(_DWORD *)(a1 + 72) && *(_QWORD *)(a1 + 48) > 0x1000000000000uLL;
}

uint64_t sub_100006C04(uint64_t a1, void *a2, unsigned int a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t *v15;
  _OWORD v16[3];

  memset(v16, 0, sizeof(v16));
  v15 = &a9;
  if (a3)
  {
    v10 = a3;
    v11 = (uint64_t *)v16 + 1;
    v12 = a3;
    do
    {
      v13 = v15;
      *v11 = *v15;
      v15 += 2;
      *(v11 - 1) = v13[1];
      v11 += 2;
      --v12;
    }
    while (v12);
  }
  else
  {
    v10 = 0;
  }
  return ccdrbg_df_derive_keys(*(uint64_t (***)(void))(a1 + 80), v10, (uint64_t)v16, *(_QWORD *)(a1 + 64) + 16, a2);
}

uint64_t sub_100006CC4(uint64_t a1, uint64_t a2)
{
  size_t v4;
  char *v5;
  rsize_t v6;
  uint64_t v8;

  v4 = (ccctr_context_size(*(uint64_t **)(a1 + 56)) + 15) & 0xFFFFFFFFFFFFFFF0;
  v5 = (char *)&v8 - v4;
  bzero((char *)&v8 - v4, v4);
  inc_uint(a1 + 40, 8uLL);
  ccctr_init(*(_QWORD *)(a1 + 56));
  sub_100006D88(a1, (uint64_t)v5, a2);
  v6 = ccctr_context_size(*(uint64_t **)(a1 + 56));
  return cc_clear(v6, v5);
}

uint64_t sub_100006D88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  ccctr_update(*(_QWORD *)(a1 + 56), a2, *(_QWORD *)(a1 + 64), a3, a1);
  return ccctr_update(*(_QWORD *)(a1 + 56), a2, 16, a3 + *(_QWORD *)(a1 + 64), a1 + 32);
}

uint64_t ccec_affinify_jacobian_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v6 = *a2;
  if (ccec_is_point_at_infinity(a2, a4))
    return 4294967289;
  v8 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  v9 = cczp_inv_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  *(_QWORD *)(a1 + 16) = v8;
  return v9;
}

uint64_t ccec_affinify_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 80))();
}

uint64_t ccec_affinify_x_only_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v6 = *a2;
  if (ccec_is_point_at_infinity(a2, a4))
    return 4294967289;
  v8 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  cczp_sqr_ws(a1, (uint64_t)a2);
  v9 = cczp_inv_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_from_ws(a1, (uint64_t)a2);
  *(_QWORD *)(a1 + 16) = v8;
  return v9;
}

uint64_t ccn_sqr_ws(uint64_t a1, unint64_t a2, _QWORD *a3, unint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  __int128 v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;

  v8 = *(_QWORD *)(a1 + 16);
  v9 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * a2);
  result = ccn_mul1(a2 - 1, v9 + 8, a4 + 1, *a4);
  *(_QWORD *)(v9 + 8 * a2) = result;
  v11 = *a4;
  *a3 = *a4 * *a4;
  v12 = *(_QWORD *)(v9 + 8);
  if (__CFADD__((unsigned __int128)(v11 * v11) >> 64, 2 * v12))
    v13 = (v12 >> 63) + 1;
  else
    v13 = v12 >> 63;
  a3[1] = (__PAIR128__(2, v11) * v11) >> 64;
  v14 = a2 - 2;
  if (a2 >= 2)
  {
    v15 = 0;
    v16 = v9 + 8 * a2 + 8;
    v17 = (unint64_t *)(v9 + 24);
    v18 = a3 + 3;
    do
    {
      result = ccn_addmul1(v14, v17, &a4[v15 + 2], a4[v15 + 1]);
      *(_QWORD *)(v16 + v15 * 8) = result;
      v19 = a4[v15 + 1];
      v20 = (v19 * (unsigned __int128)v19) >> 64;
      v21 = v19 * v19;
      v22 = __CFADD__(v21, v13);
      v23 = v21 + v13;
      if (v22)
        ++v20;
      v24 = *(v17 - 1);
      *(v18 - 1) = v23 + 2 * v24;
      v25 = *v17;
      v17 += 2;
      v26 = v25 >> 63;
      v22 = __CFADD__(v20, 2 * v25);
      v27 = v20 + 2 * v25;
      if (v22)
        v28 = v26 + 1;
      else
        v28 = v26;
      v22 = __CFADD__(__CFADD__(v23, 2 * v24), v27) | __CFADD__(v24 >> 63, __CFADD__(v23, 2 * v24) + v27);
      v29 = (v24 >> 63) + __CFADD__(v23, 2 * v24) + v27;
      if (v22)
        v13 = v28 + 1;
      else
        v13 = v28;
      *v18 = v29;
      v18 += 2;
      ++v15;
      --v14;
    }
    while (v14 != -1);
  }
  *(_QWORD *)(a1 + 16) = v8;
  return result;
}

uint64_t ccn_p256_to_ws(uint64_t a1, uint64_t a2)
{
  return cczp_mul_ws(a1, a2);
}

uint64_t ccec_double_ws(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *a2;
  v5 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _QWORD))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  result = cczp_sub_ws(a1, (uint64_t)a2);
  *(_QWORD *)(a1 + 16) = v5;
  return result;
}

uint64_t ccec_export_pub(uint64_t a1, char *a2)
{
  char v4;
  uint64_t *v10;
  uint64_t v11;
  unint64_t v13;
  char v14;

  v4 = 0;
  v14 = 0;
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
  v14 = v4;
  v10 = *(uint64_t **)a1;
  v13 = ((unint64_t)(cczp_bitlen(*(_QWORD *)a1) + 7) >> 2) | 1;
  v11 = ccec_export_affine_point(v10, 1, (unint64_t *)(a1 + 16), &v13, a2);
  cc_disable_dit(&v14);
  return v11;
}

uint64_t ccec_add_normalized_ws(uint64_t a1, uint64_t *a2, _QWORD *a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v14;

  v9 = *a2;
  v14 = *(_QWORD *)(a1 + 16);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, *a2);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  if (a6)
    cczp_add_ws(a1, (uint64_t)a2);
  else
    cczp_sub_ws(a1, (uint64_t)a2);
  if (ccn_n(v9, v10) || ccn_n(v9, v11))
  {
    if (ccn_n(v9, v10) || !ccn_n(v9, v11))
    {
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      result = cczp_div2_ws(a1, (uint64_t)a2, (int8x16_t *)&a3[v9], &a3[v9]);
    }
    else
    {
      ccn_seti(v9, a3, 1);
      cczp_to_ws(a1, (uint64_t)a2);
      ccn_set(v9, &a3[v9], a3);
      result = cc_clear(8 * v9, &a3[2 * v9]);
    }
  }
  else
  {
    result = ccec_double_ws(a1, a2);
  }
  *(_QWORD *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_full_add_normalized_ws(uint64_t a1, uint64_t *a2, char *a3, uint64_t a4, char *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v10 = *(_QWORD *)(a1 + 16);
  v11 = *a2;
  if (ccec_is_point_at_infinity(a2, a4))
  {
    ccn_set(v11, a3, a5);
    ccn_set(v11, &a3[8 * *a2], &a5[8 * *a2]);
    result = (uint64_t)ccn_set(v11, &a3[16 * *a2], &a5[16 * *a2]);
  }
  else
  {
    result = ccec_add_normalized_ws(a1, a2, a3, a4, (uint64_t)a5, 0);
  }
  *(_QWORD *)(a1 + 16) = v10;
  return result;
}

uint64_t ccec_full_add_default_ws(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  void *v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t *v13;
  char v14;
  uint64_t result;
  uint64_t v16;

  v6 = cczp_n((uint64_t)a2);
  v16 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  sub_100007F8C(a1, (uint64_t)a2);
  sub_100007F8C(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  v7 = cczp_n((uint64_t)a2);
  v8 = *a2;
  v9 = &a3[*a2];
  v10 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  v11 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  ccn_set(v7, v10, v9);
  cczp_from_ws(a1, (uint64_t)a2);
  v12 = ccn_n(v7, v11) == 1 && *v11 == 1;
  v13 = &a3[2 * v8];
  if (ccn_n(v7, a3))
    v12 = 0;
  v14 = v12 & (ccn_n(v7, v13) == 0);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  ccn_mux(v7, v14, a3, (uint64_t *)v10, a3);
  result = ccn_mux(v7, v14, v9, (uint64_t *)v10, v9);
  *(_QWORD *)(a1 + 16) = v16;
  return result;
}

uint64_t sub_100007F8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = cczp_n(a2);
  v5 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_mul_ws(a1, a2);
  cczp_sqr_ws(a1, a2);
  result = cczp_mul_ws(a1, a2);
  *(_QWORD *)(a1 + 16) = v5;
  return result;
}

uint64_t ccec_full_add_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 88))();
}

int8x16_t *aes_ctr_crypt(int8x16_t *a1, int8x16_t *a2, uint64_t a3, int8x16_t *a4, int8x16_t *a5, uint64_t a6)
{
  int v6;
  BOOL v7;
  BOOL v8;
  uint64_t v9;

  v6 = a5[15].i32[0];
  v8 = __OFSUB__(a3, 128);
  v7 = a3 - 128 < 0;
  v9 = a3 - 128;
  if (v7 != v8)
    return sub_10000854C(a1, a2, v9, a4, a5, a6, v6);
  else
    return (int8x16_t *)sub_100008100(a1, a2, v9, (uint64_t)a4, a5, a6, v6);
}

uint64_t sub_100008100(_OWORD *a1, int8x16_t *a2, uint64_t a3, uint64_t a4, int8x16_t *a5, uint64_t a6, int a7)
{
  int64x2_t v7;
  int64x2_t v8;
  int8x16_t v167;
  _OWORD *v234;
  int8x16_t v235;
  int8x16_t v236;
  int8x16_t v237;
  int8x16_t v238;
  int8x16_t v243;
  int8x16_t v244;
  int8x16_t v245;
  int8x16_t v246;
  int8x16_t v247;
  int8x16_t v248;
  int8x16_t v249;
  int8x16_t v250;
  int8x16_t *v255;

  do
  {
    v8 = vaddq_s64(v7, vaddq_s64(v7, vaddq_s64(v7, vaddq_s64(v7, v8))));
    _Q20 = *a5;
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[1];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[2];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[3];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[4];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[5];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[6];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[7];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[8];
    __asm
    {
      AESE            V22.16B, V20.16B
      AESMC           V22.16B, V22.16B
      AESE            V23.16B, V20.16B
      AESMC           V23.16B, V23.16B
      AESE            V24.16B, V20.16B
      AESMC           V24.16B, V24.16B
      AESE            V25.16B, V20.16B
      AESMC           V25.16B, V25.16B
      AESE            V26.16B, V20.16B
      AESMC           V26.16B, V26.16B
      AESE            V27.16B, V20.16B
      AESMC           V27.16B, V27.16B
      AESE            V28.16B, V20.16B
      AESMC           V28.16B, V28.16B
      AESE            V29.16B, V20.16B
      AESMC           V29.16B, V29.16B
    }
    _Q20 = a5[9];
    v167 = a5[10];
    if (a7 > 160)
    {
      __asm
      {
        AESE            V22.16B, V20.16B
        AESMC           V22.16B, V22.16B
        AESE            V23.16B, V20.16B
        AESMC           V23.16B, V23.16B
        AESE            V24.16B, V20.16B
        AESMC           V24.16B, V24.16B
        AESE            V25.16B, V20.16B
        AESMC           V25.16B, V25.16B
        AESE            V26.16B, V20.16B
        AESMC           V26.16B, V26.16B
        AESE            V27.16B, V20.16B
        AESMC           V27.16B, V27.16B
        AESE            V28.16B, V20.16B
        AESMC           V28.16B, V28.16B
        AESE            V29.16B, V20.16B
        AESMC           V29.16B, V29.16B
      }
      _Q20 = a5[10];
      __asm
      {
        AESE            V22.16B, V20.16B
        AESMC           V22.16B, V22.16B
        AESE            V23.16B, V20.16B
        AESMC           V23.16B, V23.16B
        AESE            V24.16B, V20.16B
        AESMC           V24.16B, V24.16B
        AESE            V25.16B, V20.16B
        AESMC           V25.16B, V25.16B
        AESE            V26.16B, V20.16B
        AESMC           V26.16B, V26.16B
        AESE            V27.16B, V20.16B
        AESMC           V27.16B, V27.16B
        AESE            V28.16B, V20.16B
        AESMC           V28.16B, V28.16B
        AESE            V29.16B, V20.16B
        AESMC           V29.16B, V29.16B
      }
      _Q20 = a5[11];
      v167 = a5[12];
      if (a7 > 192)
      {
        __asm
        {
          AESE            V22.16B, V20.16B
          AESMC           V22.16B, V22.16B
          AESE            V23.16B, V20.16B
          AESMC           V23.16B, V23.16B
          AESE            V24.16B, V20.16B
          AESMC           V24.16B, V24.16B
          AESE            V25.16B, V20.16B
          AESMC           V25.16B, V25.16B
          AESE            V26.16B, V20.16B
          AESMC           V26.16B, V26.16B
          AESE            V27.16B, V20.16B
          AESMC           V27.16B, V27.16B
          AESE            V28.16B, V20.16B
          AESMC           V28.16B, V28.16B
          AESE            V29.16B, V20.16B
          AESMC           V29.16B, V29.16B
        }
        _Q20 = a5[12];
        __asm
        {
          AESE            V22.16B, V20.16B
          AESMC           V22.16B, V22.16B
          AESE            V23.16B, V20.16B
          AESMC           V23.16B, V23.16B
          AESE            V24.16B, V20.16B
          AESMC           V24.16B, V24.16B
          AESE            V25.16B, V20.16B
          AESMC           V25.16B, V25.16B
          AESE            V26.16B, V20.16B
          AESMC           V26.16B, V26.16B
          AESE            V27.16B, V20.16B
          AESMC           V27.16B, V27.16B
          AESE            V28.16B, V20.16B
          AESMC           V28.16B, V28.16B
          AESE            V29.16B, V20.16B
          AESMC           V29.16B, V29.16B
        }
        _Q20 = a5[13];
        v167 = a5[14];
      }
    }
    v235 = *(int8x16_t *)a1;
    v236 = *((int8x16_t *)a1 + 1);
    v237 = *((int8x16_t *)a1 + 2);
    v238 = *((int8x16_t *)a1 + 3);
    v234 = a1 + 4;
    __asm
    {
      AESE            V22.16B, V20.16B
      AESE            V23.16B, V20.16B
      AESE            V24.16B, V20.16B
      AESE            V25.16B, V20.16B
    }
    v243 = veorq_s8(v235, veorq_s8(_Q22, v167));
    v244 = veorq_s8(v236, veorq_s8(_Q23, v167));
    v245 = veorq_s8(v237, veorq_s8(_Q24, v167));
    v246 = veorq_s8(v238, veorq_s8(_Q25, v167));
    v247 = *(int8x16_t *)v234;
    v248 = *((int8x16_t *)v234 + 1);
    v249 = *((int8x16_t *)v234 + 2);
    v250 = *((int8x16_t *)v234 + 3);
    a1 = v234 + 4;
    __asm
    {
      AESE            V26.16B, V20.16B
      AESE            V27.16B, V20.16B
      AESE            V28.16B, V20.16B
      AESE            V29.16B, V20.16B
    }
    *a2 = v243;
    a2[1] = v244;
    a2[2] = v245;
    a2[3] = v246;
    v255 = a2 + 4;
    *v255 = veorq_s8(v247, veorq_s8(_Q26, v167));
    v255[1] = veorq_s8(v248, veorq_s8(_Q27, v167));
    v255[2] = veorq_s8(v249, veorq_s8(_Q28, v167));
    v255[3] = veorq_s8(v250, veorq_s8(_Q29, v167));
    a2 = v255 + 4;
    _VF = __OFSUB__(a3, 128);
    _NF = a3 - 128 < 0;
    a3 -= 128;
  }
  while (_NF == _VF);
  return sub_10000854C();
}

int8x16_t *sub_10000854C(int8x16_t *result, int8x16_t *a2, uint64_t a3, int8x16_t *a4, int8x16_t *a5, uint64_t a6, int a7)
{
  int64x2_t v7;
  int8x16_t v8;
  int64x2_t v9;
  BOOL v10;
  uint64_t i;
  int8x16_t v54;

  v10 = a3 < -112;
  for (i = a3 + 112; !v10; i -= 16)
  {
    _Q4 = *a5;
    _Q5 = a5[1];
    _Q6 = a5[2];
    v9 = vaddq_s64(v7, v9);
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }
    _Q4 = a5[3];
    _Q5 = a5[4];
    _Q6 = a5[5];
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }
    _Q4 = a5[6];
    _Q5 = a5[7];
    _Q6 = a5[8];
    __asm
    {
      AESE            V7.16B, V4.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V5.16B
      AESMC           V7.16B, V7.16B
      AESE            V7.16B, V6.16B
      AESMC           V7.16B, V7.16B
    }
    _Q20 = a5[9];
    _Q21 = a5[10];
    if (a7 > 160)
    {
      __asm
      {
        AESE            V7.16B, V20.16B
        AESMC           V7.16B, V7.16B
        AESE            V7.16B, V21.16B
        AESMC           V7.16B, V7.16B
      }
      _Q20 = a5[11];
      _Q21 = a5[12];
      if (a7 > 192)
      {
        __asm
        {
          AESE            V7.16B, V20.16B
          AESMC           V7.16B, V7.16B
          AESE            V7.16B, V21.16B
          AESMC           V7.16B, V7.16B
        }
        _Q20 = a5[13];
        _Q21 = a5[14];
      }
    }
    __asm { AESE            V7.16B, V20.16B }
    v54 = *result++;
    *a2++ = veorq_s8(v54, veorq_s8(_Q7, _Q21));
    v10 = i < 16;
  }
  *a4 = vqtbl1q_s8((int8x16_t)v9, v8);
  return result;
}

uint64_t ccec_affine_point_from_x_ws(uint64_t a1, _QWORD *a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _QWORD))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
  if ((ccn_cmp(*a2, a4, a2 + 3) & 0x80000000) != 0)
  {
    cczp_to_ws(a1, (uint64_t)a2);
    cczp_sqr_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    cczp_sub_ws(a1, (uint64_t)a2);
    cczp_add_ws(a1, (uint64_t)a2);
    result = cczp_sqrt_ws(a1, (uint64_t)a2);
    if (!(_DWORD)result)
    {
      cczp_from_ws(a1, (uint64_t)a2);
      cczp_from_ws(a1, (uint64_t)a2);
      result = 0;
    }
  }
  else
  {
    result = 4294967289;
  }
  *(_QWORD *)(a1 + 16) = v8;
  return result;
}

uint64_t ccec_mult_default_ws(uint64_t a1, unint64_t *a2, uint64_t *a3, _BYTE *a4, unint64_t a5, uint64_t *a6)
{
  _QWORD *v12;
  uint64_t result;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  int8x16_t *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  int8x16_t *v27;
  unint64_t v28;
  char v29;
  unsigned __int8 v30;
  unint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t *v34;
  uint64_t *v35;
  unint64_t *v36;
  unsigned __int8 v37;
  BOOL is_point_at_infinity;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  _QWORD *__dst;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t *v51;
  _BYTE *__src;
  uint64_t v53;
  _QWORD *v54;
  _BOOL8 v55;
  uint64_t v56;
  unint64_t *v57;

  v12 = a2 + 4;
  if (cczp_bitlen((uint64_t)&a2[5 * *a2 + 4]) < a5)
    return 4294967289;
  v51 = a3;
  __src = a4;
  v54 = v12;
  v14 = *a2;
  v15 = (a5 + 63) >> 6;
  v53 = *(_QWORD *)(a1 + 16);
  v16 = 3 * *a2;
  v17 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v16);
  v18 = (int8x16_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v14);
  v55 = ccn_n(v14, a6) == 0;
  if (a5 + 63 >= 0x40)
    ccn_set((a5 + 63) >> 6, v18, a4);
  ccn_zero(v14 - v15, (char *)v18 + 8 * v15);
  v18->i64[v15 - 1] &= 0xFFFFFFFFFFFFFFFFLL >> -(char)a5;
  v50 = (a5 + 63) >> 6;
  v57 = (unint64_t *)v18;
  ccn_shift_right(v50, v18, v18, v55);
  ccec_double_ws(a1, a2);
  ccn_mux(3 * v14, !v55, v17, a6, v17);
  if (!ccn_n(v14, v17))
  {
LABEL_13:
    result = 0xFFFFFFFFLL;
    goto LABEL_16;
  }
  if (cczp_bitlen((uint64_t)&v54[5 * *a2]) >= a5)
  {
    v19 = *a2;
    if (ccn_n(*a2, v17))
    {
      v47 = v16;
      v45 = *(_QWORD *)(a1 + 16);
      v20 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v19);
      v49 = v19;
      v21 = (uint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v19);
      v56 = 2 * v19;
      v22 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v19);
      v23 = *a2;
      v42 = *(_QWORD *)(a1 + 16);
      __dst = (_QWORD *)v22;
      (*(void (**)(uint64_t, unint64_t))(a1 + 24))(a1, *a2);
      (*(void (**)(uint64_t, unint64_t))(a1 + 24))(a1, v23);
      (*(void (**)(uint64_t, unint64_t))(a1 + 24))(a1, v23);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      cczp_add_ws(a1, (uint64_t)a2);
      v46 = v17;
      cczp_mul_ws(a1, (uint64_t)a2);
      cczp_sqr_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      cczp_sub_ws(a1, (uint64_t)a2);
      v24 = a1;
      v25 = a1;
      v26 = (uint64_t *)v20;
      cczp_sub_ws(v24, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_sqr_ws(v25, (uint64_t)a2);
      cczp_add_ws(v25, (uint64_t)a2);
      cczp_sub_ws(v25, (uint64_t)a2);
      v48 = v25;
      *(_QWORD *)(v25 + 16) = v42;
      v27 = v18;
      v28 = *(unint64_t *)((char *)v18->i64 + (((a5 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (a5
                                                                                                 - 1);
      v29 = v28 & 1;
      v30 = !(v28 & 1);
      v31 = a5 - 2;
      if (a5 == 2)
      {
        v43 = !(v28 & 1);
        LOBYTE(v32) = v28 & 1;
      }
      else
      {
        LOBYTE(v32) = v28 & 1;
        do
        {
          v33 = v32;
          v32 = (*(unint64_t *)((char *)v27->i64 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v31) & 1;
          cczp_cond_negate((uint64_t)a2, v30, &v21[v49], (unint64_t *)&v21[v49]);
          ccn_cond_swap(v56, v32 ^ v33 | v29 ^ 1, v26, v21);
          sub_100008FD4(v25, a2);
          sub_100009220(v25, a2);
          v30 = v32 & (v29 ^ 1);
          v27 = v18;
          v29 |= v32;
          --v31;
        }
        while (v31);
        v43 = v29 ^ 1;
      }
      cczp_cond_negate((uint64_t)a2, v30, &v21[v49], (unint64_t *)&v21[v49]);
      ccn_cond_swap(v56, v27->i8[0] & 1 ^ v32, v26, v21);
      sub_100008FD4(v25, a2);
      ccn_set(v56, __dst, v21);
      v41 = v27->i64[0] & 1;
      ccn_cond_swap(v56, v27->i8[0] & 1, v26, v21);
      v34 = v26;
      a1 = v25;
      v35 = v51;
      v40 = *(_QWORD *)(v25 + 16);
      cczp_sub_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_sqr_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      *(_QWORD *)(v25 + 16) = v40;
      ccn_cond_swap(v56, v41, v34, v21);
      sub_100009220(v25, a2);
      ccn_mux(v56, v41, v34, v21, v34);
      cczp_mul_ws(v25, (uint64_t)a2);
      cczp_mul_ws(v25, (uint64_t)a2);
      v36 = (unint64_t *)cczp_prime((uint64_t)&v54[5 * *a2]);
      ccn_sub1(v49, __dst, v36, 1uLL);
      v37 = (ccn_cmpn(v50, v57, v49, __dst) & 1) == 0;
      is_point_at_infinity = ccec_is_point_at_infinity(a2, (uint64_t)v46);
      ccn_mux(3 * v49, v43 | is_point_at_infinity | v37, v35, v46, v35);
      cczp_cond_negate((uint64_t)a2, v37, &v35[*a2], (unint64_t *)&v35[*a2]);
      v39 = v43 & ~*(_DWORD *)v57 & 1;
      ccn_cond_clear(v49, v39, &v51[2 * *a2]);
      ccn_seti(v49, v34, 1);
      cczp_to_ws(v48, (uint64_t)a2);
      ccn_mux(v49, v39, v35, v34, v35);
      ccn_mux(v49, v39, &v35[*a2], v34, &v35[*a2]);
      *(_QWORD *)(v48 + 16) = v45;
      ccec_full_add_ws(v48, (uint64_t)a2);
      ccn_mux(v47, *__src & v55, v35, v46, v35);
      result = 0;
      goto LABEL_16;
    }
    goto LABEL_13;
  }
  result = 4294967289;
LABEL_16:
  *(_QWORD *)(a1 + 16) = v53;
  return result;
}

uint64_t ccec_mult_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 96))();
}

uint64_t sub_100008FD4(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *a2;
  v5 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _QWORD))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  result = cczp_sub_ws(a1, (uint64_t)a2);
  *(_QWORD *)(a1 + 16) = v5;
  return result;
}

uint64_t sub_100009220(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  v4 = *a2;
  v5 = *(_QWORD *)(a1 + 16);
  (*(void (**)(uint64_t, _QWORD))(a1 + 24))(a1, *a2);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  result = cczp_sub_ws(a1, (uint64_t)a2);
  *(_QWORD *)(a1 + 16) = v5;
  return result;
}

unint64_t ccn_addmul1_asm(uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int128 v8;
  unsigned __int128 v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unsigned __int128 v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  _BOOL8 v23;
  uint64_t v24;
  unsigned __int128 v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v4 = 0;
  if ((a1 & 1) != 0)
  {
    v5 = *a3++;
    v4 = (v5 * (unsigned __int128)a4 + *a2) >> 64;
    *a2++ += v5 * a4;
    --a1;
  }
  if ((a1 & 2) != 0)
  {
    v6 = *a3;
    v7 = a3[1];
    a3 += 2;
    v8 = *(_OWORD *)a2 + __PAIR128__(v7 * a4, v4);
    v9 = v8 + v6 * (unsigned __int128)a4;
    v4 = (__CFADD__(__CFADD__((_QWORD)v8, v6 * a4), *((_QWORD *)&v8 + 1)) | __CFADD__((v6* (unsigned __int128)a4) >> 64, *((_QWORD *)&v9 + 1)))+ (__CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v7 * a4, *((_QWORD *)&v8 + 1)))+ ((v7 * (unsigned __int128)a4) >> 64);
    *(_OWORD *)a2 = v9;
    a2 += 2;
    a1 -= 2;
  }
  while (1)
  {
    v10 = a1 < 4;
    a1 -= 4;
    if (v10)
      break;
    v11 = a2[2];
    v12 = a2[3];
    v14 = *a3;
    v15 = a3[1];
    v13 = a3 + 2;
    v16 = *v13;
    v17 = v13[1];
    a3 = v13 + 2;
    v18 = (v15 * (unsigned __int128)a4) >> 64;
    v19 = *(_OWORD *)a2 + __PAIR128__(v15 * a4, v4);
    v20 = __CFADD__(__CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v15 * a4, *((_QWORD *)&v19 + 1)), v11);
    v21 = (__CFADD__(__CFADD__(*a2, v4), a2[1]) | __CFADD__(v15 * a4, *((_QWORD *)&v19 + 1))) + v11;
    v20 |= __CFADD__(v18, v21);
    v21 += v18;
    v23 = v20;
    v20 = __CFADD__(v20, v12);
    v22 = v23 + v12;
    v20 |= __CFADD__(v17 * a4, v22);
    v22 += v17 * a4;
    v24 = v20 + ((v17 * (unsigned __int128)a4) >> 64);
    v25 = v19 + v14 * (unsigned __int128)a4;
    *(_OWORD *)a2 = v25;
    v26 = a2 + 2;
    v27 = (v16 * (unsigned __int128)a4) >> 64;
    v29 = __CFADD__(__CFADD__((_QWORD)v19, v14 * a4), *((_QWORD *)&v19 + 1)) | __CFADD__((v14* (unsigned __int128)a4) >> 64, *((_QWORD *)&v25 + 1));
    v20 = __CFADD__(v29, v21);
    v28 = v29 + v21;
    v31 = v20 | __CFADD__(v16 * a4, v28);
    v20 = __CFADD__(v31, v22);
    v30 = v31 + v22;
    v4 = (v20 | __CFADD__(v27, v30)) + v24;
    *v26 = v16 * a4 + v28;
    v26[1] = v27 + v30;
    a2 = v26 + 2;
  }
  return v4;
}

uint64_t (**ccec_projectify_jacobian_ws(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4, uint64_t (**a5)(_QWORD, unint64_t, uint64_t)))(_QWORD, unint64_t, uint64_t)
{
  uint64_t (**v5)(_QWORD, unint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;

  v5 = a5;
  v9 = *(_QWORD *)(a1 + 16);
  if (a5)
  {
    v10 = cczp_bitlen((uint64_t)a2);
    v5 = (uint64_t (**)(_QWORD, unint64_t, uint64_t))ccn_random_bits(v10 - 1, a3 + 16 * *a2, v5);
    ccn_set_bit(a3 + 16 * *a2, v10 - 2, 1);
    cczp_sqr_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
    cczp_mul_ws(a1, (uint64_t)a2);
  }
  else
  {
    ccn_seti(*a2, (_QWORD *)(a3 + 16 * *a2), 1);
    cczp_to_ws(a1, (uint64_t)a2);
  }
  cczp_to_ws(a1, (uint64_t)a2);
  cczp_to_ws(a1, (uint64_t)a2);
  *(_QWORD *)(a1 + 16) = v9;
  return v5;
}

uint64_t ccec_projectify_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 72))();
}

unint64_t cc_cmp_safe(uint64_t a1, char *a2, char *a3)
{
  char v3;
  unsigned __int8 v9;
  char v10;
  char v11;
  char v12;
  unint64_t v13;
  char v15;

  v3 = 0;
  v15 = 0;
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
  v15 = v3;
  if (a1)
  {
    v9 = 0;
    do
    {
      v11 = *a2++;
      v10 = v11;
      v12 = *a3++;
      v9 |= v12 ^ v10;
      --a1;
    }
    while (a1);
    v13 = ((unint64_t)v9 + 0xFFFFFFFF) >> 32;
  }
  else
  {
    v13 = 1;
  }
  cc_disable_dit(&v15);
  return v13;
}

uint64_t ccec_x963_export(int a1, char *a2, uint64_t **a3)
{
  char v6;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  int v18;
  char v20;

  v6 = 0;
  v20 = 0;
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
  v20 = v6;
  v12 = ccec_export_pub((uint64_t)a3, a2);
  v13 = v12;
  if (a1 && !(_DWORD)v12)
  {
    v14 = *a3;
    v15 = **a3;
    v16 = (unint64_t)(cczp_bitlen((uint64_t)&(*a3)[5 * v15 + 4]) + 7) >> 3;
    v17 = cczp_bitlen((uint64_t)v14);
    v18 = ccn_write_uint_padded_ct(v15, (unint64_t *)&a3[3 * v15 + 2], v16, &a2[((unint64_t)(v17 + 7) >> 2) | 1]);
    v13 = v18 & (v18 >> 31);
  }
  cc_disable_dit(&v20);
  return v13;
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

uint64_t ccec_x963_import_pub_ws(uint64_t a1, unint64_t *a2, uint64_t a3, unsigned __int8 *a4, unint64_t **a5)
{
  int v10;
  uint64_t result;
  unsigned int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  if (!a3)
    return 4294967289;
  if (a3 == 1)
  {
    v10 = *a4;
    if (!*a4)
      return 4294967136;
  }
  else
  {
    v10 = *a4;
  }
  v12 = v10 - 2;
  if (v12 > 5 || ((0x37u >> v12) & 1) == 0)
    return 4294967289;
  v13 = dword_10002A020[(char)v12];
  v14 = *(_QWORD *)(a1 + 16);
  *a5 = a2;
  result = ccec_import_affine_point_ws(a1, a2, v13, a3, a4, (unint64_t *)a5 + 2);
  if (!(_DWORD)result)
  {
    ccn_seti(*a2, &a5[2 * **a5 + 2], 1);
    v15 = (*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 3 * *a2);
    result = ccec_validate_point_and_projectify_ws(a1, (uint64_t *)a2, v15, (unint64_t *)a5 + 2);
  }
  *(_QWORD *)(a1 + 16) = v14;
  return result;
}

uint64_t ccec_x963_import_pub(unint64_t *a1, uint64_t a2, unsigned __int8 *a3, unint64_t **a4)
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
    v16 = ccec_x963_import_pub_ws((uint64_t)v18, a1, a2, a3, a4);
    v19((uint64_t)v18);
  }
  else
  {
    v16 = 4294967283;
  }
  cc_disable_dit(&v20);
  return v16;
}

uint64_t ccrng_crypto_generate(uint64_t a1, rsize_t a2, char *a3)
{
  rsize_t v6;
  char *v7;
  os_unfair_lock_s *v8;
  const os_unfair_lock *v9;
  rsize_t v10;
  int v11;
  int v12;
  uint64_t seed;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  const os_unfair_lock *v17;
  unint64_t v18;
  uint64_t v19;
  os_unfair_lock_s *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  size_t v26;
  os_unfair_lock_s *v28;
  _OWORD v29[4];

  if (!a2)
    return 0;
  v6 = a2;
  v7 = a3;
  while (1)
  {
    v8 = *(os_unfair_lock_s **)(a1 + 24);
    if (v8)
    {
      os_unfair_lock_lock(v8);
      v9 = *(const os_unfair_lock **)(a1 + 24);
      if (v9)
        os_unfair_lock_assert_owner(v9);
    }
    memset(v29, 0, sizeof(v29));
    v10 = *(_QWORD *)(a1 + 56);
    v11 = ccrng_schedule_read(*(_QWORD *)(a1 + 16));
    if (v11 == 1)
      goto LABEL_13;
    v12 = v11;
    seed = ccentropy_get_seed(*(uint64_t (****)(_QWORD))(a1 + 8));
    if ((_DWORD)seed == -10)
      break;
    v14 = seed;
    if ((_DWORD)seed)
      goto LABEL_40;
    v15 = sub_100009DC8((_QWORD *)a1, v10, (uint64_t)v29, 0, 0);
    if ((_DWORD)v15)
    {
      v14 = v15;
LABEL_40:
      cc_clear(v10, v29);
      goto LABEL_36;
    }
    ccrng_schedule_notify_reseed(*(_BYTE **)(a1 + 16));
    cc_clear(v10, v29);
LABEL_13:
    if (v6 >= *(_QWORD *)(a1 + 48))
      v16 = *(_QWORD *)(a1 + 48);
    else
      v16 = v6;
    v17 = *(const os_unfair_lock **)(a1 + 24);
    if (v17)
      os_unfair_lock_assert_owner(v17);
    if (a2 <= 0xB && (v18 = *(_QWORD *)(a1 + 64), v18 >= v16))
    {
      v21 = *(_QWORD *)(a1 + 72);
      v22 = *(_QWORD *)(a1 + 80);
      v23 = (void *)(v21 + v22);
      v24 = v21 + v18;
      v25 = v24 - (v21 + v22);
      if (v25 >= v16)
        v26 = v16;
      else
        v26 = v24 - (v21 + v22);
      memcpy(v7, (const void *)(v21 + v22), v26);
      cc_clear(v26, v23);
      *(_QWORD *)(a1 + 80) += v26;
      if (v25 < v16)
      {
        v19 = sub_100009E78((_QWORD *)a1, *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
        if ((_DWORD)v19)
        {
LABEL_41:
          v14 = v19;
          goto LABEL_36;
        }
        memcpy(&v7[v26], *(const void **)(a1 + 72), v16 - v26);
        cc_clear(v16 - v26, *(void **)(a1 + 72));
        *(_QWORD *)(a1 + 80) = v16 - v26;
      }
    }
    else
    {
      v19 = sub_100009E78((_QWORD *)a1, v16, (uint64_t)v7);
      if ((_DWORD)v19)
        goto LABEL_41;
    }
    v20 = *(os_unfair_lock_s **)(a1 + 24);
    if (v20)
      os_unfair_lock_unlock(v20);
    v7 += v16;
    v6 -= v16;
    if (!v6)
      return 0;
  }
  if (v12 == 2)
    goto LABEL_13;
  if (v12 == 3)
    v14 = 4294967134;
  else
    v14 = 0xFFFFFFFFLL;
LABEL_36:
  v28 = *(os_unfair_lock_s **)(a1 + 24);
  if (v28)
    os_unfair_lock_unlock(v28);
  cc_clear(a2, a3);
  return v14;
}

uint64_t sub_100009DC8(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const os_unfair_lock *v10;
  uint64_t result;

  v10 = (const os_unfair_lock *)a1[3];
  if (v10)
    os_unfair_lock_assert_owner(v10);
  result = ccdrbg_reseed(a1[4], a1[5], a2, a3, a4, a5);
  if (!(_DWORD)result)
    a1[10] = a1[8];
  return result;
}

uint64_t ccrng_crypto_init(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t result;

  if (a8 > 0x40)
    return 4294967291;
  result = 0;
  *a1 = j__ccrng_crypto_generate;
  a1[1] = a2;
  a1[2] = a3;
  a1[3] = a4;
  a1[4] = a5;
  a1[5] = a6;
  a1[6] = a7;
  a1[7] = a8;
  a1[8] = a9;
  a1[9] = a10;
  a1[10] = a9;
  return result;
}

uint64_t sub_100009E78(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  const os_unfair_lock *v6;

  v6 = (const os_unfair_lock *)a1[3];
  if (v6)
    os_unfair_lock_assert_owner(v6);
  return ccdrbg_generate(a1[4], a1[5], a2, a3, 0, 0);
}

uint64_t cczp_inv_default_ws(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v6;
  unint64_t v8;
  unint64_t *v9;
  uint64_t result;
  _QWORD *v11;
  _QWORD *v12;
  void *v13;
  unint64_t *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  char v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t __n;
  uint64_t v46;
  void *__s;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  void *v52;
  unint64_t *v53;
  unint64_t *v54;
  uint64_t v55;
  uint64_t v56;

  v6 = a2;
  v8 = cczp_n(a2);
  v9 = (unint64_t *)cczp_prime(v6);
  if ((ccn_cmp(v8, a4, v9) & 0x80000000) == 0)
    return 4294967289;
  v46 = *(_QWORD *)(a1 + 16);
  __s = a3;
  v11 = (_QWORD *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  v12 = (_QWORD *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  cczp_from_ws(a1, v6);
  v13 = (void *)cczp_prime(v6);
  ccn_set(v8, v12, v13);
  v14 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  v15 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  v53 = v14;
  ccn_seti(v8, v14, 1);
  __n = 8 * v8;
  v54 = v15;
  cc_clear(8 * v8, v15);
  v52 = (void *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v8);
  v16 = (v8 << 7) | 0x1E;
  if (v16 != 30)
  {
    v17 = 0;
    v49 = v8 - 1;
    v50 = v16 / 0x1F;
    v48 = v8 - 2;
    v51 = (_QWORD *)v6;
    v56 = v8;
    do
    {
      v18 = v11[v49];
      v19 = v12[v49];
      v55 = v17;
      if (v8 >= 2)
      {
        v20 = v48;
        do
        {
          v21 = __clz(v19 | v18 | 1);
          v22 = (((v19 | v18) >> 63) - v21 + 64) & -(uint64_t)(((v19 | v18 | ((v19 | (unint64_t)v18) >> 32))
                                                             + 0xFFFFFFFF) >> 32);
          v18 = (v11[v20] >> v22) | (v18 << v21);
          v19 = (v12[v20--] >> v22) | (v19 << v21);
        }
        while (v20 < v8);
      }
      v23 = 0;
      v24 = 0;
      v25 = v18 & 0xFFFFFFFF80000000 | *v11 & 0x7FFFFFFFLL;
      v26 = v19 & 0xFFFFFFFF80000000 | *v12 & 0x7FFFFFFFLL;
      v27 = 31;
      v28 = 0x80000000;
      v29 = 0x80000000;
      do
      {
        v30 = v25 & 1;
        v31 = v25 >> !(v25 & 1);
        v32 = v31 ^ v26;
        v33 = v25 & ((((v31 - v26) ^ v31 | v31 ^ v26) ^ v31) >> 63);
        v34 = -(uint64_t)v33;
        v35 = v26 & -(uint64_t)v33--;
        v36 = v33 & v31 | v35;
        v26 = v32 ^ v36;
        v37 = v33 & v29 | v24 & v34;
        v24 ^= v29 ^ v37;
        v38 = v33 & v23 | v28 & v34;
        v28 ^= v23 ^ v38;
        v25 = (v36 - (v26 & -(uint64_t)v30)) >> v30;
        v29 = (v37 - (v24 & -(uint64_t)v30)) & 0x8000000000000000 | ((v37 - (v24 & -(uint64_t)v30)) >> 1);
        v23 = (v38 - (v28 & -(uint64_t)v30)) & 0x8000000000000000 | ((v38 - (v28 & -(uint64_t)v30)) >> 1);
        --v27;
      }
      while (v27);
      v39 = a1;
      v40 = sub_10000A2F8(a1, v8, v52, v11, (v37 - (v24 & -(uint64_t)v30)) & 0x8000000000000000 | ((v37 - (v24 & -(uint64_t)v30)) >> 1), v12, (v38 - (v28 & -(uint64_t)v30)) & 0x8000000000000000 | ((v38 - (v28 & -(uint64_t)v30)) >> 1));
      v41 = sub_10000A2F8(v39, v56, v12, v11, v24, v12, v28);
      ccn_set(v56, v11, v52);
      v42 = v40 - 1;
      v43 = -(uint64_t)v40;
      a1 = v39;
      v44 = v42 & v23 | v43 & -(uint64_t)v23;
      v6 = (uint64_t)v51;
      v8 = v56;
      sub_10000A474(v39, v51, v52, v53, v42 & v29 | v43 & -(uint64_t)v29, v54, v44);
      sub_10000A474(v39, v51, v54, v53, (v41 - 1) & v24 | -(uint64_t)v41 & -v24, v54, (v41 - 1) & v28 | -(uint64_t)v41 & -v28);
      ccn_set(v56, v53, v52);
      v17 = v55 + 1;
    }
    while (v55 + 1 != v50);
  }
  if (ccn_n(v8, v12) == 1 && *v12 == 1)
  {
    cczp_to_ws(a1, v6);
    result = 0;
  }
  else
  {
    cc_clear(__n, __s);
    result = 4294967289;
  }
  *(_QWORD *)(a1 + 16) = v46;
  return result;
}

unint64_t sub_10000A2F8(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7)
{
  uint64_t v13;
  int8x16_t *v14;
  char *v15;
  unint64_t v16;
  uint64_t v19;

  v19 = *(_QWORD *)(a1 + 16);
  v13 = a2 + 1;
  v14 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, a2 + 1);
  v15 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v13);
  if (a2)
    ccn_set(a2, v14, a4);
  ccn_zero(1, (char *)v14 + 8 * a2);
  ccn_cond_neg(v13, a5 < 0, v14->i64, v14->i64);
  if (a2)
    ccn_set(a2, v15, a6);
  ccn_zero(1, &v15[8 * a2]);
  ccn_cond_neg(v13, a7 < 0, (uint64_t *)v15, (uint64_t *)v15);
  ccn_mul1(v13, v14, v14, (a5 ^ (a5 >> 63)) + ((unint64_t)a5 >> 63));
  ccn_addmul1(v13, v14, v15, (a7 ^ (a7 >> 63)) + ((unint64_t)a7 >> 63));
  v16 = (unint64_t)v14->i64[a2] >> 63;
  ccn_cond_neg(v13, v14->i64[a2] < 0, v14->i64, v14->i64);
  ccn_shift_right(v13, v14, v14, 31);
  ccn_set(a2, a3, v14);
  *(_QWORD *)(a1 + 16) = v19;
  return v16;
}

uint64_t sub_10000A474(uint64_t a1, _QWORD *a2, void *a3, unint64_t *a4, uint64_t a5, unint64_t *a6, uint64_t a7)
{
  uint64_t v12;
  int8x16_t *v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t *v16;
  char v17;
  uint64_t result;
  uint64_t v21;

  v12 = cczp_n((uint64_t)a2);
  v21 = *(_QWORD *)(a1 + 16);
  v13 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  v14 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  cczp_cond_negate((uint64_t)a2, a5 < 0, v13->i64, a4);
  cczp_cond_negate((uint64_t)a2, a7 < 0, v14, a6);
  v13->i64[v12] = ccn_mul1(v12, v13, v13, (a5 ^ (a5 >> 63)) + ((unint64_t)a5 >> 63));
  v13->i64[v12] += ccn_addmul1(v12, v13, v14, (a7 ^ (a7 >> 63)) + ((unint64_t)a7 >> 63));
  v15 = cczp_prime((uint64_t)a2);
  v13->i64[v12] += ccn_addmul1(v12, v13, v15, (LODWORD(a2[*a2 + 3]) * v13->i32[0]) & 0x7FFFFFFF);
  ccn_shift_right(v12 + 1, v13, v13, 31);
  ccn_set(v12, a3, v13);
  v16 = (unint64_t *)cczp_prime((uint64_t)a2);
  v17 = ccn_subn(v12 + 1, v13, v13->i64, v12, v16);
  result = ccn_mux(v12, v17, (uint64_t *)a3, (uint64_t *)a3, v13->i64);
  *(_QWORD *)(a1 + 16) = v21;
  return result;
}

uint64_t cczp_inv_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 40))();
}

uint64_t cczp_n(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t cczp_bitlen(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

uint64_t ccn_mul(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int128 v11;
  uint64_t v12;
  unint64_t v13;
  unsigned __int128 v14;

  if (result)
  {
    result *= -8;
    v4 = (unint64_t *)(a2 - result);
    v5 = a3 - result;
    v6 = a4 - result;
    v7 = result;
    v8 = result;
    v9 = 0;
    v10 = *(_QWORD *)(v6 + result);
    do
    {
      v11 = *(unint64_t *)(v5 + v8) * (unsigned __int128)v10 + v9;
      *(unint64_t *)((char *)v4 + v8) = v11;
      v9 = *((_QWORD *)&v11 + 1);
      v8 += 8;
    }
    while (v8);
    while (1)
    {
      *v4 = v9;
      v7 += 8;
      if (!v7)
        break;
      ++v4;
      v12 = result;
      v9 = 0;
      v13 = *(_QWORD *)(v6 + v7);
      do
      {
        v14 = *(unint64_t *)(v5 + v12) * (unsigned __int128)v13 + v9 + *(unint64_t *)((char *)v4 + v12);
        *(unint64_t *)((char *)v4 + v12) = v14;
        v9 = *((_QWORD *)&v14 + 1);
        v12 += 8;
      }
      while (v12);
    }
  }
  return result;
}

uint64_t ccmode_ctr_init(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;

  v8 = *(_QWORD *)(a1 + 48);
  *a2 = v8;
  v9 = (*(uint64_t (**)(void))(v8 + 16))();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(a1 + 32))(a1, a2, a5);
  return v9;
}

uint64_t ccn_cmpn(unint64_t a1, unint64_t *a2, unint64_t a3, unint64_t *a4)
{
  char v4;
  uint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;
  char v17;

  v4 = 0;
  v17 = 0;
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
  v17 = v4;
  if (a1 >= a3)
    v10 = a3;
  else
    v10 = a1;
  if (a1 >= a3)
    v11 = a2;
  else
    v11 = a4;
  if (a1 <= a3)
    v12 = a3;
  else
    v12 = a1;
  if (a1 < a3)
    v13 = -1;
  else
    v13 = 1;
  v14 = ccn_cmp(v10, a2, a4);
  if (ccn_n(v12 - v10, &v11[v10]))
    v15 = v13;
  else
    v15 = v14;
  cc_disable_dit(&v17);
  return v15;
}

uint64_t cczp_sqrt_tonelli_shanks_precomp_ws(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4, unint64_t a5, unint64_t *a6, void *a7)
{
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t *v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v23;
  unint64_t *v25;

  v12 = cczp_n(a2);
  v23 = *(_QWORD *)(a1 + 16);
  v13 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  v14 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  v15 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  v16 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12);
  result = cczp_power_fast_ws(a1, a2, a3, a4, a6);
  v18 = v23;
  if (!(_DWORD)result)
  {
    ccn_seti(v12, v16, 1);
    v25 = v16;
    cczp_to_ws(a1, a2);
    ccn_set(v12, v15, a7);
    cczp_sqr_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    if (a5 >= 2)
    {
      while (1)
      {
        ccn_set(v12, v14, v13);
        if (a5 - 1 < 2)
          break;
        v19 = 2;
        do
        {
          cczp_sqr_ws(a1, a2);
          ++v19;
        }
        while (a5 != v19);
        v20 = ccn_cmp(v12, (unint64_t *)v14, v25) & 1;
        cczp_mul_ws(a1, a2);
        ccn_mux(v12, v20, a3, (uint64_t *)v14, a3);
        cczp_sqr_ws(a1, a2);
        cczp_mul_ws(a1, a2);
        ccn_mux(v12, v20, (uint64_t *)v13, (uint64_t *)v14, (uint64_t *)v13);
        --a5;
      }
      v21 = ccn_cmp(v12, (unint64_t *)v14, v25) & 1;
      cczp_mul_ws(a1, a2);
      ccn_mux(v12, v21, a3, (uint64_t *)v14, a3);
      cczp_sqr_ws(a1, a2);
      cczp_mul_ws(a1, a2);
      ccn_mux(v12, v21, (uint64_t *)v13, (uint64_t *)v14, (uint64_t *)v13);
    }
    cczp_sqr_ws(a1, a2);
    if (ccn_cmp(v12, (unint64_t *)v14, (unint64_t *)a4))
      result = 4294967289;
    else
      result = 0;
    v18 = v23;
  }
  *(_QWORD *)(a1 + 16) = v18;
  return result;
}

uint64_t cczp_sqrt_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int8x16_t *v11;
  void *v12;
  uint64_t result;
  unint64_t v14;
  int8x16_t *v15;
  uint64_t *v16;

  v8 = ~*(_DWORD *)cczp_prime(a2) & 3;
  v9 = cczp_n(a2);
  v10 = *(_QWORD *)(a1 + 16);
  v11 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
  v12 = (void *)cczp_prime(a2);
  if (v8)
  {
    ccn_set(v9, v11, v12);
    v11->i64[0] &= ~1uLL;
    v14 = ccn_trailing_zeros(v9, (uint64_t)v11);
    ccn_shift_right_multi(v9, v11, v11, v14);
    v15 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
    ccn_sub1(v9, v15, (unint64_t *)v11, 1uLL);
    ccn_shift_right(v9, v15, v15, 1);
    v16 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v9);
    ccn_seti(v9, v16, 1);
    while (cczp_is_quadratic_residue_ws(a1, a2, v16) == 1)
      ccn_add1_ws(a1, v9, v16, v16, 1);
    result = cczp_power_fast_ws(a1, a2, v16, v16, (unint64_t *)v11);
    if (!(_DWORD)result)
      result = cczp_sqrt_tonelli_shanks_precomp_ws(a1, a2, a3, a4, v14, (unint64_t *)v15, v16);
  }
  else
  {
    ccn_add1_ws(a1, v9, v11, (uint64_t *)v12, 1);
    ccn_shift_right(v9, v11, v11, 2);
    result = cczp_power_fast_ws(a1, a2, a3, a4, (unint64_t *)v11);
    if (!(_DWORD)result)
    {
      cczp_sqr_ws(a1, a2);
      if (ccn_cmp(v9, (unint64_t *)v11, (unint64_t *)a4))
        result = 4294967289;
      else
        result = 0;
    }
  }
  *(_QWORD *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_sqrt_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 48))();
}

BOOL ccec_is_point_projective_ws(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t *v6;
  unint64_t *v7;
  _BOOL8 result;

  v4 = *a2;
  v5 = *(_QWORD *)(a1 + 16);
  v6 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, *a2);
  v7 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  (*(void (**)(uint64_t, uint64_t))(a1 + 24))(a1, v4);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sub_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  cczp_mul_ws(a1, (uint64_t)a2);
  cczp_add_ws(a1, (uint64_t)a2);
  cczp_sqr_ws(a1, (uint64_t)a2);
  result = ccn_cmp(v4, v7, v6) == 0;
  *(_QWORD *)(a1 + 16) = v5;
  return result;
}

BOOL ccec_is_point_at_infinity(_QWORD *a1, uint64_t a2)
{
  return ccn_n(*a1, a2 + 16 * *a1) == 0;
}

uint64_t ccentropy_get_seed(uint64_t (***a1)(_QWORD))
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
  v7 = (**a1)(a1);
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccec_make_pub_from_priv_ws(uint64_t a1, uint64_t *a2, uint64_t (**a3)(_QWORD, uint64_t, uint64_t *), unint64_t *a4, unint64_t *a5, uint64_t **a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  *a6 = a2;
  v12 = *a2;
  v13 = *(_QWORD *)(a1 + 16);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * *a2);
  if (ccec_validate_scalar(a2, a4))
  {
    result = 4294967274;
    goto LABEL_10;
  }
  if (a5)
  {
    result = ccec_validate_point_and_projectify_ws(a1, a2, v14, a5);
    if ((_DWORD)result)
      goto LABEL_10;
  }
  else
  {
    result = ccec_projectify_ws(a1, (uint64_t)a2);
    if ((_DWORD)result)
      goto LABEL_10;
  }
  if (ccec_mult_blinded_ws(a1, a2, (uint64_t)(a6 + 2), a4, v14, a3))
  {
    result = 4294967280;
  }
  else if (ccec_is_point_projective_ws(a1, a2))
  {
    if (ccec_affinify_ws(a1, (uint64_t)a2))
    {
      result = 4294967279;
    }
    else
    {
      ccn_seti(v12, &a6[2 * **a6 + 2], 1);
      result = 0;
    }
  }
  else
  {
    result = 4294967277;
  }
LABEL_10:
  *(_QWORD *)(a1 + 16) = v13;
  return result;
}

BOOL ccn_add_ws(uint64_t a1, _BOOL8 a2, _QWORD *a3, uint64_t *a4, uint64_t *a5)
{
  return ccn_add_asm(a2, a3, a4, a5);
}

BOOL ccn_add_asm(_BOOL8 result, _QWORD *a2, uint64_t *a3, uint64_t *a4)
{
  BOOL v4;
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
  _BOOL4 v15;
  int v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;

  v4 = 0;
  if (result)
  {
    if (result)
    {
      v6 = *a3++;
      v5 = v6;
      v7 = *a4++;
      v4 = __CFADD__(v5, v7);
      *a2++ = v5 + v7;
    }
    if (result & 2)
    {
      v8 = *a3;
      v9 = a3[1];
      a3 += 2;
      v10 = *a4;
      v11 = a4[1];
      a4 += 2;
      v13 = v4 + v8;
      v4 = __CFADD__(v4, v8) | __CFADD__(v10, v13);
      v12 = v10 + v13;
      v14 = v4 + v9;
      v4 = __CFADD__(v4, v9) | __CFADD__(v11, v14);
      *a2 = v12;
      a2[1] = v11 + v14;
      a2 += 2;
    }
    v15 = result & 0xFFFFFFFC;
    if (v15)
    {
      v16 = v15 - 4;
      v18 = *a3;
      v19 = a3[1];
      v17 = a3 + 2;
      v21 = *a4;
      v22 = a4[1];
      v20 = a4 + 2;
      v24 = *v17;
      v25 = v17[1];
      v23 = v17 + 2;
      v27 = *v20;
      v28 = v20[1];
      for (i = v20 + 2; v16; i = v38 + 2)
      {
        v30 = v4 + v18;
        v4 = __CFADD__(v4, v18) | __CFADD__(v21, v30);
        v29 = v21 + v30;
        v32 = v4 + v19;
        v4 = __CFADD__(v4, v19) | __CFADD__(v22, v32);
        v31 = v22 + v32;
        v18 = *v23;
        v19 = v23[1];
        v33 = v23 + 2;
        v35 = v4 + v24;
        v4 = __CFADD__(v4, v24) | __CFADD__(v27, v35);
        v34 = v27 + v35;
        *a2 = v29;
        a2[1] = v31;
        v36 = a2 + 2;
        v37 = v4 + v25;
        v4 = __CFADD__(v4, v25) | __CFADD__(v28, v37);
        v21 = *i;
        v22 = i[1];
        v38 = i + 2;
        *v36 = v34;
        v36[1] = v28 + v37;
        a2 = v36 + 2;
        v16 -= 4;
        v24 = *v33;
        v25 = v33[1];
        v23 = v33 + 2;
        v27 = *v38;
        v28 = v38[1];
      }
      v40 = v4 + v18;
      v4 = __CFADD__(v4, v18) | __CFADD__(v21, v40);
      v39 = v21 + v40;
      v42 = v4 + v19;
      v4 = __CFADD__(v4, v19) | __CFADD__(v22, v42);
      v41 = v22 + v42;
      v44 = v4 + v24;
      v4 = __CFADD__(v4, v24) | __CFADD__(v27, v44);
      v43 = v27 + v44;
      v45 = v4 + v25;
      v4 = __CFADD__(v4, v25) | __CFADD__(v28, v45);
      *a2 = v39;
      a2[1] = v41;
      v46 = a2 + 2;
      *v46 = v43;
      v46[1] = v28 + v45;
    }
    return v4;
  }
  return result;
}

BOOL ccn_add1_ws(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4, uint64_t a5)
{
  if (a2)
    return ccn_add1_asm(a2, a3, a4, a5);
  else
    return a5;
}

unint64_t ccecdh_pairwise_consistency_check_ws(uint64_t a1, uint64_t **a2, uint64_t a3, uint64_t (**a4)(_QWORD, uint64_t, uint64_t *))
{
  uint64_t *v6;
  uint64_t v7;
  unint64_t **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t result;
  unint64_t **v15;
  unint64_t v16;
  unsigned __int8 *v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  unint64_t *v25;
  uint64_t v26;
  uint64_t v28;
  unint64_t v29;

  v6 = *a2;
  v7 = **a2;
  v28 = *(_QWORD *)(a1 + 16);
  v8 = (unint64_t **)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, (4 * (v7 & 0x7FFFFFFFFFFFFFFLL)) | 2);
  *v8 = (unint64_t *)v6;
  v9 = *v6;
  v10 = (uint64_t)&v8[3 * *v6 + 2];
  ccn_set(1, (void *)v10, &unk_10002A038);
  ccn_zero(v9 - 1, (void *)(v10 + 8));
  v11 = *(_QWORD *)(a1 + 16);
  v12 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * *v6);
  v13 = v28;
  result = sub_10000B414(a1, v6, v12, (unint64_t *)&v8[3 * **v8 + 2]);
  if (!(_DWORD)result)
  {
    result = ccec_affinify_ws(a1, (uint64_t)v6);
    *(_QWORD *)(a1 + 16) = v11;
    if ((_DWORD)result)
      goto LABEL_13;
    v15 = v8 + 2;
    v16 = (unint64_t)(cczp_bitlen((uint64_t)v6) + 7) >> 3;
    v29 = v16;
    v17 = (unsigned __int8 *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
    v18 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v7);
    cc_clear(v16, v17);
    cc_clear(v16, v18);
    result = ccecdh_compute_shared_secret_ws(a1, a2, v8, &v29, (char *)v17, a4);
    if ((_DWORD)result)
      goto LABEL_13;
    if (!v29)
      goto LABEL_12;
    v19 = 0;
    v20 = 0;
    do
      v20 |= v17[v19++];
    while (v29 != v19);
    if (!v20)
    {
LABEL_12:
      result = 4294967278;
LABEL_13:
      v13 = v28;
      goto LABEL_14;
    }
    v21 = (uint64_t *)*v8;
    v22 = **v8;
    v23 = *(_QWORD *)(a1 + 16);
    v24 = (void *)(*(uint64_t (**)(uint64_t))(a1 + 24))(a1);
    result = sub_10000B414(a1, v21, v24, (unint64_t *)&v15[3 * v22]);
    v13 = v28;
    if (!(_DWORD)result)
    {
      v25 = (unint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v22);
      result = ccec_affinify_x_only_ws(a1, v21, (uint64_t)v25, (uint64_t)v24);
      if (!(_DWORD)result)
      {
        v26 = cczp_bitlen((uint64_t)v21);
        ccn_write_uint_padded(v22, v25, (unint64_t)(v26 + 7) >> 3, (char *)v18);
        *(_QWORD *)(a1 + 16) = v23;
        if (v29 == v16)
        {
          result = cc_cmp_safe(v16, (char *)v17, (char *)v18);
          if (!(_DWORD)result)
            goto LABEL_13;
        }
        goto LABEL_12;
      }
    }
  }
LABEL_14:
  *(_QWORD *)(a1 + 16) = v13;
  return result;
}

uint64_t sub_10000B414(uint64_t a1, uint64_t *a2, void *a3, unint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v8 = *a2;
  v9 = *(_QWORD *)(a1 + 16);
  v10 = 3 * *a2;
  v11 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v10);
  v12 = ccec_projectify_ws(a1, (uint64_t)a2);
  if (!(_DWORD)v12)
  {
    ccn_set(v10, a3, v11);
    v13 = ccn_bitlen(v8, a4);
    if (v13 != 1)
    {
      v14 = v13 - 2;
      do
      {
        ccec_double_ws(a1, a2);
        if (((*(unint64_t *)((char *)a4 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
          ccec_full_add_normalized_ws(a1, a2, (char *)a3, (uint64_t)a3, (char *)v11);
        --v14;
      }
      while (v14 != -1);
    }
  }
  *(_QWORD *)(a1 + 16) = v9;
  return v12;
}

uint64_t ccn_mux(uint64_t result, char a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = qword_100039AB0 ^ (qword_100039AB0 << 13) ^ ((qword_100039AB0 ^ (unint64_t)(qword_100039AB0 << 13)) >> 7);
  v6 = v5 ^ (v5 << 17);
  qword_100039AB0 = v6;
  for (i = __ROR8__(0x5555555555555555, a2 | (2 * v6)); result; --result)
  {
    v9 = *a4++;
    v8 = v9;
    v10 = *a5++;
    *a3 = v10 ^ v6;
    *a3++ = (v10 ^ v8) & 0x5555555555555555 ^ v10 ^ v6 ^ (v10 ^ v8) & i ^ v6;
  }
  return result;
}

uint64_t ccn_mux_next_mask()
{
  unint64_t v0;
  uint64_t result;

  v0 = qword_100039AB0 ^ (qword_100039AB0 << 13) ^ ((qword_100039AB0 ^ (unint64_t)(qword_100039AB0 << 13)) >> 7);
  result = v0 ^ (v0 << 17);
  qword_100039AB0 = result;
  return result;
}

uint64_t ccn_mux_seed_mask(uint64_t result)
{
  qword_100039AB0 ^= result;
  return result;
}

uint64_t cczp_power_fast_ws(uint64_t a1, uint64_t a2, _QWORD *a3, void *a4, unint64_t *a5)
{
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;

  v10 = cczp_n(a2);
  v11 = ccn_bitlen(v10, a5);
  if (v11)
  {
    v12 = v11;
    v17 = *(_QWORD *)(a1 + 16);
    v13 = (char *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 3 * v10);
    ccn_set(v10, v13, a4);
    cczp_sqr_ws(a1, a2);
    cczp_mul_ws(a1, a2);
    v14 = (*(unint64_t *)((char *)a5 + (((v12 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v12 - 1)) & 1;
    if ((v12 & 1) == 0)
      v14 = (*(unint64_t *)((char *)a5 + (((v12 - 2) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v12 - 2)) & 1 | (2 * v14);
    ccn_set(v10, a3, &v13[8 * (v14 - 1) * v10]);
    if ((v12 | 0xFFFFFFFFFFFFFFFELL) + v12)
    {
      v15 = v12 + (v12 | 0xFFFFFFFFFFFFFFFELL) - 1;
      do
      {
        cczp_sqr_ws(a1, a2);
        cczp_sqr_ws(a1, a2);
        if ((*(unint64_t *)((char *)a5 + (((v15 - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> (v15 - 1)) & 1 | (2 * ((*(unint64_t *)((char *)a5 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v15) & 1)))
          cczp_mul_ws(a1, a2);
        v15 -= 2;
      }
      while (v15 != -1);
    }
    *(_QWORD *)(a1 + 16) = v17;
  }
  else
  {
    ccn_seti(v10, a3, 1);
    cczp_to_ws(a1, a2);
  }
  return 0;
}

unint64_t ccn_bitlen(uint64_t a1, unint64_t *a2)
{
  char v2;
  unint64_t v8;
  uint64_t v9;
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
  v8 = 0;
  if (a1)
  {
    v9 = 64;
    do
    {
      v10 = *a2++;
      v8 = ((((v10 | HIDWORD(v10)) + 0xFFFFFFFF) >> 32) - 1) & v8 | (v9 - __clz(v10 | 1)) & -(uint64_t)(((v10 | HIDWORD(v10)) + 0xFFFFFFFF) >> 32);
      v9 += 64;
      --a1;
    }
    while (a1);
  }
  cc_disable_dit(&v12);
  return v8;
}

uint64_t ccn_cmp(uint64_t a1, unint64_t *a2, unint64_t *a3)
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
  v9 = ccn_cmp_asm(a1, a2, a3);
  cc_disable_dit(&v11);
  return v9;
}

void cc_abort()
{
  abort();
}

uint64_t ccn_mul_ws(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return ccn_mul(a2, a3, a4, a5);
}

uint64_t ccn_divmod_ws(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, char *a7, uint64_t a8)
{
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  int8x16_t *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64x2_t v19;
  int v20;
  unint64_t v21;
  uint64x2_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unsigned __int128 v32;
  unint64_t v33;
  uint64_t v34;
  __int128 v35;
  _QWORD *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  _BOOL8 v43;
  _BOOL8 v44;
  unint64_t v45;
  _BOOL8 v46;
  uint64_t v47;
  uint64_t result;
  uint64_t v50;
  size_t v52;
  uint64_t v53;
  char v54;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v62;
  uint64_t v63;
  uint64_t v64[2];
  uint64_t v65[2];

  v12 = ccn_n(a6, a8);
  v13 = a2 - v12;
  v50 = *(_QWORD *)(a1 + 16);
  v14 = v12 + 1;
  v15 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  v16 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  v59 = a1;
  v17 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v12 + 1);
  v15[v12] = 0;
  v57 = v12 - 1;
  v18 = __clz(*(_QWORD *)(a8 + 8 * (v12 - 1)));
  ccn_shift_left(v12, (uint64_t)v15, a8, v18, v19);
  v20 = -(int)v18;
  v60 = v18;
  v21 = v18 + 0xFFFFFFFF;
  if (v12)
    ccn_set(v12, v16, (void *)(a3 + 8 * v13));
  v53 = -(uint64_t)HIDWORD(v21);
  v54 = v20 & 0x3F;
  ccn_zero(1, (char *)v16 + 8 * v12);
  ccn_shift_left(v14, (uint64_t)v16, (uint64_t)v16, v60, v22);
  v23 = 0;
  v24 = 0;
  v25 = 0;
  v26 = v15[v57];
  v27 = -v26;
  v29 = (unsigned __int128)-(__int128)__PAIR128__(v28, v26) >> 64;
  v30 = 65;
  v31 = v26;
  do
  {
    v32 = __PAIR128__(v29, v27) - __PAIR128__(v31, v23);
    v33 = (unint64_t)((__PAIR128__(v29, v27) - __PAIR128__(v31, v23)) >> 64) >> 63;
    v34 = v29 & ((uint64_t)((__PAIR128__(v29, v27) - __PAIR128__(v31, v23)) >> 64) >> 63);
    v27 = (v33 - 1) & v32 | v27 & (*((uint64_t *)&v32 + 1) >> 63);
    *((_QWORD *)&v35 + 1) = v25;
    *(_QWORD *)&v35 = v24;
    v25 = v35 >> 63;
    *((_QWORD *)&v35 + 1) = v24;
    *(_QWORD *)&v35 = *((_QWORD *)&v32 + 1);
    v29 = (v33 != 0 ? 0 : *((_QWORD *)&v32 + 1)) | v34;
    v24 = (v35 >> 63) ^ 1;
    *((_QWORD *)&v35 + 1) = v31;
    *(_QWORD *)&v35 = v23;
    v23 = v35 >> 1;
    v31 >>= 1;
    --v30;
  }
  while (v30);
  v56 = (v24 + 2) | ((((HIDWORD(v15[v57]) ^ 0x80000000 | v15[v57]) + 0xFFFFFFFF) >> 32) - 1);
  v52 = 8 * v12;
  v58 = v12;
  v36 = (_QWORD *)(a3 - 8 * v12 + 8 * a2);
  v37 = v13;
  do
  {
    v38 = v13;
    v39 = *v36 << v60;
    v16->i64[0] = v39;
    if (v37)
      v16->i64[0] = ((*(v36 - 1) & (unint64_t)v53) >> v54) | v39;
    v40 = v16->u64[v58];
    v41 = v16->i64[v57];
    v63 = v15[v57];
    v42 = ((__PAIR128__(v40, v41) - (unint64_t)v63) >> 64) + ((v40 * (unsigned __int128)v56) >> 64) + 2;
    if (v42 < v40)
      v42 = -1;
    v62 = v42;
    v65[0] = 0;
    v65[1] = 0;
    ccn_mul(1, (uint64_t)v65, (uint64_t)&v62, (uint64_t)&v63);
    v64[0] = v41;
    v64[1] = v40;
    v43 = ccn_sub_ws(0, 2, v65, v64, (unint64_t *)v65);
    v62 -= 2 * v43;
    v44 = ccn_add1_ws(0, 2, v65, v65, v63);
    v45 = v62 + v44;
    v17[v58] = ccn_mul1(v58, v17, v15, v62 + v44);
    v46 = ccn_sub_ws(v59, v14, v16, v16->i64, v17);
    v47 = v46 - ccn_cond_add(v14, v46, v16->i64, v16->i64, v15);
    result = ccn_cond_add(v14, v47, v16->i64, v16->i64, v15);
    if (a5 && v37 < a4)
      *(_QWORD *)(a5 + 8 * v37) = v45 - (v46 + v47);
    if (v37)
      result = (uint64_t)memmove(&v16->u64[1], v16, v52);
    --v37;
    --v36;
    v13 = v38;
  }
  while (v37 <= v38);
  if (a5 && a4 > v38 + 1)
    result = cc_clear(8 * (a4 - (v38 + 1)), (void *)(a5 + 8 * (v38 + 1)));
  if (a7)
  {
    ccn_shift_right(v58, v16, v16, v60);
    if (v58)
      ccn_set(v58, a7, v16);
    result = ccn_zero(a6 - v58, &a7[8 * v58]);
  }
  *(_QWORD *)(v59 + 16) = v50;
  return result;
}

uint64_t cccbc_init(uint64_t a1)
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

uint64_t cccbc_update(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
  v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, a3, a4, a5, a6);
  cc_disable_dit(&v14);
  return v12;
}

uint64_t ccmode_ctr_setctr(int a1, _QWORD *a2, void *__src)
{
  uint64_t v3;

  v3 = *a2;
  a2[1] = *(_QWORD *)(*a2 + 8);
  memcpy((char *)a2 + ((*(_QWORD *)(v3 + 8) + 7) & 0xFFFFFFFFFFFFFFF8) + 16, __src, *(_QWORD *)(v3 + 8));
  return 0;
}

uint64_t ccn_random_bits(uint64_t a1, uint64_t a2, uint64_t (**a3)(_QWORD, unint64_t, uint64_t))
{
  char v4;
  unint64_t v5;
  uint64_t result;

  v4 = a1;
  v5 = (unint64_t)(a1 + 63) >> 6;
  result = (*a3)(a3, 8 * v5, a2);
  if (!(_DWORD)result)
    *(_QWORD *)(a2 + 8 * v5 - 8) &= 0xFFFFFFFFFFFFFFFFLL >> -(((((unint64_t)(v4 & 0x3F) + 0xFFFFFFFF) >> 32) - 1) & 0x40 | v4 & 0x3F);
  return result;
}

uint64_t ccn_random_bits_fips(uint64_t a1, void *a2, uint64_t (**a3)(_QWORD, unint64_t, void *))
{
  char v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t __src;
  int v9;

  v4 = a1;
  v5 = (unint64_t)(a1 + 63) >> 6;
  if ((unint64_t)(a1 + 63) > 0x7F)
  {
    v6 = (*a3)(a3, 8 * v5, a2);
  }
  else
  {
    v9 = 0;
    __src = 0;
    v6 = (*a3)(a3, 12uLL, &__src);
    memcpy(a2, &__src, 8 * v5);
    cc_clear(8 * v5, &__src);
  }
  if (!(_DWORD)v6)
    *((_QWORD *)a2 + v5 - 1) &= 0xFFFFFFFFFFFFFFFFLL >> -(((((unint64_t)(v4 & 0x3F) + 0xFFFFFFFF) >> 32) - 1) & 0x40 | v4 & 0x3F);
  return v6;
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

void *ccn_set(uint64_t a1, void *__dst, void *__src)
{
  return memmove(__dst, __src, 8 * a1);
}

uint64_t ccrng_process_init(uint64_t a1, uint64_t (*a2)(void), uint64_t (**a3)(_QWORD, uint64_t, _OWORD *))
{
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;
  uint64_t *v9;
  __int128 v10;
  uint64_t v11;
  char v12[32];
  _OWORD v13[2];

  v6 = a1 + 128;
  ccrng_schedule_timer_init(a1 + 128, a2, 5000000000);
  ccrng_schedule_atomic_flag_init(a1 + 168);
  ccrng_schedule_tree_init(a1 + 96, v6, a1 + 168);
  result = cc_lock_init((_DWORD *)(a1 + 208));
  if (!(_DWORD)result)
  {
    result = ccentropy_rng_init((_QWORD *)(a1 + 192), (uint64_t)a3);
    if (!(_DWORD)result)
    {
      v8 = ccaes_cbc_encrypt_mode();
      result = ccdrbg_df_bc_init((_QWORD *)(a1 + 224), v8, 0x20uLL);
      if (!(_DWORD)result)
      {
        v9 = ccaes_ctr_crypt_mode();
        v10 = xmmword_10002A040;
        DWORD2(v10) = 1;
        v11 = a1 + 224;
        ccdrbg_factory_nistctr((_QWORD *)(a1 + 768), (uint64_t)&v9);
        memset(v13, 0, sizeof(v13));
        result = (*a3)(a3, 32, v13);
        if (!(_DWORD)result)
        {
          a2();
          strcpy(v12, "corecrypto process rng");
          result = ccdrbg_init(a1 + 768);
          if (!(_DWORD)result)
          {
            result = ccrng_crypto_init((_QWORD *)(a1 + 8), a1 + 192, a1 + 96, a1 + 208, a1 + 768, a1 + 824, 4096, 0x20uLL, 256, a1 + 2104);
            if (!(_DWORD)result)
              *(_QWORD *)a1 = sub_10000C29C;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_10000C29C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 8))(a1 + 8);
}

uint64_t ccrng_process_atfork_prepare(os_unfair_lock_s *a1)
{
  os_unfair_lock_lock(a1 + 52);
  ccrng_schedule_atomic_flag_set((uint64_t)&a1[42]);
  return 0;
}

uint64_t ccrng_process_atfork_parent(os_unfair_lock_s *a1)
{
  os_unfair_lock_unlock(a1 + 52);
  return 0;
}

uint64_t ccrng_process_atfork_child(uint64_t a1)
{
  return cc_lock_init((_DWORD *)(a1 + 208));
}

uint64_t ccn_shift_right(uint64_t result, int8x16_t *a2, int8x16_t *a3, uint64_t a4)
{
  if (result)
    return ccn_shift_right_asm(result, a2, a3, a4);
  return result;
}

uint64_t ccn_shift_right_multi(uint64_t a1, int8x16_t *a2, int8x16_t *a3, unint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  result = ccn_shift_right(a1, a2, a3, a4 & 0x3F);
  if (a1)
  {
    v8 = 0;
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        v9 |= ((((v10 ^ ((_DWORD)v8 + (a4 >> 6)) | ((v10 ^ (v8 + (a4 >> 6))) >> 32))
               + 0xFFFFFFFF) >> 32)
             - 1) & a2->i64[v10];
        ++v10;
      }
      while (a1 != v10);
      a2->i64[v8++] = v9;
    }
    while (v8 != a1);
  }
  return result;
}

BOOL ccn_sub_ws(uint64_t a1, _BOOL8 a2, _QWORD *a3, uint64_t *a4, unint64_t *a5)
{
  return ccn_sub_asm(a2, a3, a4, a5);
}

BOOL ccn_sub_asm(_BOOL8 result, _QWORD *a2, uint64_t *a3, unint64_t *a4)
{
  _BOOL1 v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL1 v13;
  _BOOL1 v14;
  _BOOL4 v15;
  int v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *i;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL1 v30;
  uint64_t v31;
  _BOOL1 v32;
  uint64_t *v33;
  uint64_t v34;
  _BOOL1 v35;
  _QWORD *v36;
  _BOOL1 v37;
  uint64_t *v38;
  uint64_t v39;
  _BOOL1 v40;
  uint64_t v41;
  _BOOL1 v42;
  uint64_t v43;
  _BOOL1 v44;
  _BOOL1 v45;
  _QWORD *v46;

  v4 = 1;
  if (result)
  {
    if (result)
    {
      v6 = *a3++;
      v5 = v6;
      v7 = *a4++;
      v4 = v5 >= v7;
      *a2++ = v5 - v7;
    }
    if (result & 2)
    {
      v8 = *a3;
      v9 = a3[1];
      a3 += 2;
      v10 = *a4;
      v11 = a4[1];
      a4 += 2;
      v13 = v4;
      v4 = __CFSUB__(v8, v10, v4);
      v12 = v8 - (v10 + !v13);
      v14 = v4;
      v4 = __CFSUB__(v9, v11, v4);
      *a2 = v12;
      a2[1] = v9 - (v11 + !v14);
      a2 += 2;
    }
    v15 = result & 0xFFFFFFFC;
    if (v15)
    {
      v16 = v15 - 4;
      v18 = *a3;
      v19 = a3[1];
      v17 = a3 + 2;
      v21 = *a4;
      v22 = a4[1];
      v20 = (uint64_t *)(a4 + 2);
      v24 = *v17;
      v25 = v17[1];
      v23 = v17 + 2;
      v27 = *v20;
      v28 = v20[1];
      for (i = v20 + 2; v16; i = v38 + 2)
      {
        v30 = v4;
        v4 = __CFSUB__(v18, v21, v4);
        v29 = v18 - (v21 + !v30);
        v32 = v4;
        v4 = __CFSUB__(v19, v22, v4);
        v31 = v19 - (v22 + !v32);
        v18 = *v23;
        v19 = v23[1];
        v33 = v23 + 2;
        v35 = v4;
        v4 = __CFSUB__(v24, v27, v4);
        v34 = v24 - (v27 + !v35);
        *a2 = v29;
        a2[1] = v31;
        v36 = a2 + 2;
        v37 = v4;
        v4 = __CFSUB__(v25, v28, v4);
        v21 = *i;
        v22 = i[1];
        v38 = i + 2;
        *v36 = v34;
        v36[1] = v25 - (v28 + !v37);
        a2 = v36 + 2;
        v16 -= 4;
        v24 = *v33;
        v25 = v33[1];
        v23 = v33 + 2;
        v27 = *v38;
        v28 = v38[1];
      }
      v40 = v4;
      v4 = __CFSUB__(v18, v21, v4);
      v39 = v18 - (v21 + !v40);
      v42 = v4;
      v4 = __CFSUB__(v19, v22, v4);
      v41 = v19 - (v22 + !v42);
      v44 = v4;
      v4 = __CFSUB__(v24, v27, v4);
      v43 = v24 - (v27 + !v44);
      v45 = v4;
      v4 = __CFSUB__(v25, v28, v4);
      *a2 = v39;
      a2[1] = v41;
      v46 = a2 + 2;
      *v46 = v43;
      v46[1] = v25 - (v28 + !v45);
    }
    return !v4;
  }
  return result;
}

unint64_t ccn_sub1(uint64_t a1, _QWORD *a2, unint64_t *a3, unint64_t a4)
{
  unint64_t v4;
  unsigned __int128 v5;

  for (; a1; --a1)
  {
    v4 = *a3++;
    v5 = v4 - (unsigned __int128)a4;
    *a2++ = v5;
    a4 = *((_QWORD *)&v5 + 1) >> 63;
  }
  return a4;
}

unint64_t ccn_write_uint_size(uint64_t a1, unint64_t *a2)
{
  char v2;
  unint64_t v8;
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
  v8 = (ccn_bitlen(a1, a2) + 7) >> 3;
  cc_disable_dit(&v10);
  return v8;
}

uint64_t ccn_write_uint_padded_ct(uint64_t a1, unint64_t *a2, unint64_t a3, char *__s)
{
  char *v4;
  unint64_t v5;
  char v8;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v19;
  unint64_t *v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  char *v24;
  char v25;

  v4 = __s;
  v5 = a3;
  v8 = 0;
  v25 = 0;
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
  v25 = v8;
  if (a3 <= 0x7FFFFFFE
    && (v14 = 8 * a1, (unint64_t)(8 * a1) <= 0x7FFFFFFE)
    && ((v15 = a3 - v14, a3 <= v14) ? (LODWORD(v15) = 0) : (cc_clear(a3 - v14, __s), v4 += v15, v5 = 8 * a1),
        v16 = ccn_write_uint_size(a1, a2),
        v5 >= v16))
  {
    v17 = (v15 + v5 - v16);
    if (v5 < 8)
    {
      v19 = 0;
    }
    else
    {
      v19 = ((v5 - 8) >> 3) + 1;
      v20 = a2;
      v21 = v19;
      do
      {
        v22 = *v20++;
        *(_QWORD *)&v4[v5 - 8] = bswap64(v22);
        v5 -= 8;
        --v21;
      }
      while (v21);
    }
    if (v5)
    {
      v23 = a2[v19];
      v24 = &v4[v5 - 1];
      do
      {
        *v24-- = v23;
        v23 >>= 8;
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    v17 = 4294967289;
  }
  cc_disable_dit(&v25);
  return v17;
}

_BYTE *ccn_write_uint(unint64_t a1, unint64_t *a2, unint64_t a3, uint64_t a4)
{
  char v8;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  char v24;

  v8 = 0;
  v24 = 0;
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
  v24 = v8;
  v14 = ccn_write_uint_size(a1, a2);
  if (v14 >= a3)
    v15 = a3;
  else
    v15 = v14;
  v16 = a4 + v15;
  v17 = (v14 - v15) >> 3;
  v18 = (v14 - v15) & 7;
  v19 = a2[v17] >> (8 * v18);
  if (v15 >= 8)
  {
    do
    {
      v20 = v15 - 8;
      v21 = v18 - 8;
      do
      {
        *(_BYTE *)--v16 = v19;
        v19 >>= 8;
      }
      while (!__CFADD__(v21++, 1));
      if (v17 + 1 < a1)
        v19 = a2[++v17];
      v15 = v20 + v18;
      v18 = 0;
    }
    while (v15 > 7);
  }
  if (v15)
  {
    v22 = (_BYTE *)(v16 - 1);
    do
    {
      *v22-- = v19;
      v19 >>= 8;
      --v15;
    }
    while (v15);
  }
  return cc_disable_dit(&v24);
}

BOOL ccn_add1_asm(uint64_t a1, _QWORD *a2, uint64_t *a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v5;
  BOOL v6;
  _QWORD *i;
  uint64_t v8;
  _BOOL8 v9;

  if (!a1)
    return a4;
  v5 = *a3;
  v4 = a3 + 1;
  v6 = __CFADD__(v5, a4);
  *a2 = v5 + a4;
  for (i = a2 + 1; --a1; ++i)
  {
    v8 = *v4++;
    v9 = v6;
    v6 = __CFADD__(v6, v8);
    *i = v9 + v8;
  }
  return v6;
}

uint64_t ccn_cond_neg(uint64_t a1, char a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t result;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;

  result = ccn_mux_next_mask();
  v9 = __ROR8__(0x5555555555555555, a2 | (2 * result));
  if (a1)
  {
    v10 = 1;
    do
    {
      v12 = *a4++;
      v11 = v12;
      v13 = v10 + ~v12;
      v10 = __CFADD__(v10, ~v12);
      v14 = v11 ^ v13;
      v15 = v11 ^ result;
      *a3 = v15;
      *a3++ = v14 & v9 ^ v14 & 0x5555555555555555 ^ v15 ^ result;
      --a1;
    }
    while (a1);
  }
  return result;
}

unint64_t ccec_compressed_x962_export_pub_size(uint64_t a1)
{
  char v1;
  unint64_t v7;
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
  v7 = ((unint64_t)(cczp_bitlen(a1) + 7) >> 3) + 1;
  cc_disable_dit(&v9);
  return v7;
}

uint64_t sizeof_cc_unit()
{
  return 8;
}

BOOL ccec_validate_pub(uint64_t **a1)
{
  char v2;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;
  _BOOL8 v19;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t (*v23)(_QWORD *, uint64_t);
  void (*v24)(uint64_t);
  char v25;

  v2 = 0;
  v25 = 0;
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
  v25 = v2;
  v8 = *a1;
  v9 = **a1;
  v10 = sizeof_cc_unit();
  v11 = 5 * v9 + (v10 + 7) / v10 + 3;
  if (v11 <= 7 * v9)
    v11 = 7 * v9;
  v12 = cc_malloc_clear(8 * (v11 + 3 * v9));
  v21[0] = v12;
  v13 = *v8;
  v14 = sizeof_cc_unit();
  v15 = 5 * v13 + (v14 + 7) / v14 + 3;
  if (v15 <= 7 * v13)
    v15 = 7 * v13;
  v21[1] = v15 + 3 * v13;
  v22 = 0;
  v23 = cc_ws_alloc;
  v24 = cc_ws_free;
  if (v12)
  {
    v16 = *a1;
    v17 = cc_ws_alloc(v21, 3 * **a1);
    v18 = ccec_validate_point_and_projectify_ws((uint64_t)v21, v16, v17, (unint64_t *)a1 + 2);
    v22 = 0;
    v24((uint64_t)v21);
    v19 = v18 == 0;
  }
  else
  {
    v19 = 0;
  }
  cc_disable_dit(&v25);
  return v19;
}

uint64_t cc_lock_init(_DWORD *a1)
{
  *a1 = 0;
  return 0;
}

unint64_t ccn_subn(uint64_t a1, _QWORD *a2, uint64_t *a3, _BOOL8 a4, unint64_t *a5)
{
  uint64_t v5;
  _QWORD *v6;
  unint64_t *v7;
  unint64_t v8;

  v5 = a1 - a4;
  v6 = &a2[a4];
  v7 = (unint64_t *)&a3[a4];
  v8 = ccn_sub_ws(0, a4, a2, a3, a5);
  return ccn_sub1(v5, v6, v7, v8);
}

uint64_t ccec_validate_scalar(uint64_t *a1, unint64_t *a2)
{
  uint64_t v4;
  unint64_t *v5;

  v4 = *a1;
  v5 = (unint64_t *)cczp_prime((uint64_t)&a1[5 * *a1 + 4]);
  if ((ccn_cmp(v4, a2, v5) & 0x80000000) == 0)
    return 0xFFFFFFFFLL;
  if (ccn_n(*a1, a2))
    return 0;
  return 0xFFFFFFFFLL;
}

int32x4_t *AccelerateCrypto_SHA256_compress(int32x4_t *result, uint64_t a2, int8x16_t *a3)
{
  int8x16_t *v3;
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  int8x16_t v7;
  int32x4_t v9;
  __int128 *v19;
  int v20;
  int32x4_t v22;
  int32x4_t v28;
  int32x4_t v30;
  int32x4_t v32;
  BOOL v44;
  uint64_t v45;
  int32x4_t *v46;
  int8x16_t v49;
  int8x16_t v50;
  int8x16_t v52;

  if (a2)
  {
    v4 = *a3;
    v5 = a3[1];
    v6 = a3[2];
    v7 = a3[3];
    v3 = a3 + 4;
    _Q1 = (int32x4_t)vrev32q_s8(v5);
    v9 = *result;
    _Q2 = (int32x4_t)vrev32q_s8(v6);
    _Q17 = result[1];
    _Q3 = (int32x4_t)vrev32q_s8(v7);
    _Q18 = *result;
    _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(v4), (int32x4_t)xmmword_10000CAA0);
    _Q5 = vaddq_s32(_Q1, (int32x4_t)xmmword_10000CAB0);
    _Q19 = _Q17;
    _Q6 = vaddq_s32(_Q2, (int32x4_t)xmmword_10000CAC0);
    _Q7 = vaddq_s32(_Q3, (int32x4_t)xmmword_10000CAD0);
    v19 = &xmmword_10000CAE0;
    v20 = 3;
    do
    {
      _Q20 = _Q18;
      v22 = (int32x4_t)*v19;
      __asm { SHA256SU0       V0.4S, V1.4S }
      v28 = (int32x4_t)v19[1];
      __asm { SHA256H         Q18, Q19, V4.4S }
      v30 = (int32x4_t)v19[2];
      __asm { SHA256SU1       V0.4S, V2.4S, V3.4S }
      v32 = (int32x4_t)v19[3];
      __asm { SHA256H2        Q19, Q20, V4.4S }
      v19 += 4;
      _Q4 = vaddq_s32(_Q0, v22);
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V1.4S, V2.4S
        SHA256H         Q18, Q19, V5.4S
        SHA256SU1       V1.4S, V3.4S, V0.4S
        SHA256H2        Q19, Q20, V5.4S
      }
      _Q5 = vaddq_s32(_Q1, v28);
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V2.4S, V3.4S
        SHA256H         Q18, Q19, V6.4S
        SHA256SU1       V2.4S, V0.4S, V1.4S
        SHA256H2        Q19, Q20, V6.4S
      }
      _Q6 = vaddq_s32(_Q2, v30);
      --v20;
      _Q20 = _Q18;
      __asm
      {
        SHA256SU0       V3.4S, V0.4S
        SHA256H         Q18, Q19, V7.4S
        SHA256SU1       V3.4S, V1.4S, V2.4S
        SHA256H2        Q19, Q20, V7.4S
      }
      _Q7 = vaddq_s32(_Q3, v32);
    }
    while (!(_NF ^ _VF | _ZF));
    v44 = a2 <= 1;
    v45 = a2 - 1;
    if (!v44)
    {
      v46 = (int32x4_t *)(v19 - 16);
      do
      {
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V4.4S }
        v49 = v3[1];
        v50 = v3[2];
        __asm { SHA256H2        Q19, Q20, V4.4S }
        v52 = v3[3];
        _Q4 = vaddq_s32((int32x4_t)vrev32q_s8(*v3), *v46);
        _Q20 = _Q18;
        v3 += 4;
        __asm { SHA256H         Q18, Q19, V5.4S }
        _Q1 = (int32x4_t)vrev32q_s8(v49);
        __asm { SHA256H2        Q19, Q20, V5.4S }
        _Q5 = vaddq_s32(_Q1, v46[1]);
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V6.4S }
        _Q2 = (int32x4_t)vrev32q_s8(v50);
        __asm { SHA256H2        Q19, Q20, V6.4S }
        _Q6 = vaddq_s32(_Q2, v46[2]);
        _Q20 = _Q18;
        __asm { SHA256H         Q18, Q19, V7.4S }
        _Q3 = (int32x4_t)vrev32q_s8(v52);
        __asm { SHA256H2        Q19, Q20, V7.4S }
        _Q7 = vaddq_s32(_Q3, v46[3]);
        v9 = vaddq_s32(v9, _Q18);
        _Q17 = vaddq_s32(_Q17, _Q19);
        _Q20 = v9;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }
        _Q4 = vaddq_s32(_Q0, v46[4]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }
        _Q5 = vaddq_s32(_Q1, v46[5]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }
        _Q6 = vaddq_s32(_Q2, v46[6]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }
        _Q7 = vaddq_s32(_Q3, v46[7]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }
        _Q4 = vaddq_s32(_Q0, v46[8]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }
        _Q5 = vaddq_s32(_Q1, v46[9]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }
        _Q6 = vaddq_s32(_Q2, v46[10]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }
        _Q7 = vaddq_s32(_Q3, v46[11]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V0.4S, V1.4S
          SHA256H         Q18, Q19, V4.4S
          SHA256SU1       V0.4S, V2.4S, V3.4S
          SHA256H2        Q19, Q20, V4.4S
        }
        _Q4 = vaddq_s32(_Q0, v46[12]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V1.4S, V2.4S
          SHA256H         Q18, Q19, V5.4S
          SHA256SU1       V1.4S, V3.4S, V0.4S
          SHA256H2        Q19, Q20, V5.4S
        }
        _Q5 = vaddq_s32(_Q1, v46[13]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V2.4S, V3.4S
          SHA256H         Q18, Q19, V6.4S
          SHA256SU1       V2.4S, V0.4S, V1.4S
          SHA256H2        Q19, Q20, V6.4S
        }
        _Q6 = vaddq_s32(_Q2, v46[14]);
        _Q20 = _Q18;
        __asm
        {
          SHA256SU0       V3.4S, V0.4S
          SHA256H         Q18, Q19, V7.4S
          SHA256SU1       V3.4S, V1.4S, V2.4S
          SHA256H2        Q19, Q20, V7.4S
        }
        _Q7 = vaddq_s32(_Q3, v46[15]);
        v44 = v45-- <= 1;
      }
      while (!v44);
    }
    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V4.4S
      SHA256H2        Q19, Q20, V4.4S
    }
    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V5.4S
      SHA256H2        Q19, Q20, V5.4S
    }
    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V6.4S
      SHA256H2        Q19, Q20, V6.4S
    }
    _Q20 = _Q18;
    __asm
    {
      SHA256H         Q18, Q19, V7.4S
      SHA256H2        Q19, Q20, V7.4S
    }
    *result = vaddq_s32(v9, _Q18);
    result[1] = vaddq_s32(_Q17, _Q19);
  }
  return result;
}

uint64_t ccec_import_affine_point_ws(uint64_t a1, unint64_t *a2, int a3, uint64_t a4, unsigned __int8 *a5, unint64_t *a6)
{
  unint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t *v15;
  unsigned __int8 *v16;
  uint64_t v17;
  uint64_t uint;
  unint64_t *v19;
  unsigned int v20;
  unsigned __int8 *v21;
  unint64_t *v22;
  uint64_t v23;

  if (!a4)
    return 4294967289;
  v11 = *a2;
  if (a4 == 1 && !*a5)
    return 4294967136;
  switch(a3)
  {
    case 4:
      v12 = 4294967124;
      if (a4 != (unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 3)
        return v12;
      goto LABEL_20;
    case 1:
      if ((((unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 2) | 1) != a4)
        return 4294967126;
      v12 = 4294967126;
      if (*a5 != 4)
        return v12;
LABEL_20:
      v14 = *(_QWORD *)(a1 + 16);
      v15 = (uint64_t *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, v11);
      if (a3 == 4)
        v16 = a5;
      else
        v16 = a5 + 1;
      v17 = cczp_bitlen((uint64_t)a2);
      uint = ccn_read_uint(v11, a6, (unint64_t)(v17 + 7) >> 3, v16);
      if ((_DWORD)uint)
        goto LABEL_38;
      if (ccn_cmp(v11, a6, a2 + 3) == -1)
      {
        if ((a3 - 3) <= 1)
        {
          uint = ccec_affine_point_from_x_ws(a1, a2, (uint64_t)a6, a6);
          if (!(_DWORD)uint)
          {
            cczp_negate((uint64_t)a2, v15, &a6[*a2]);
            v19 = &a6[*a2];
            if (a3 == 4)
              v20 = ccn_cmp(v11, (unint64_t *)v15, v19) >> 31;
            else
              LOBYTE(v20) = (*v19 & 1) != (*a5 & 1);
            ccn_mux(v11, v20, (uint64_t *)v19, v15, (uint64_t *)v19);
            goto LABEL_35;
          }
LABEL_38:
          v12 = uint;
          goto LABEL_36;
        }
        v21 = &a5[((unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 3) + 1];
        v22 = &a6[*a2];
        v23 = cczp_bitlen((uint64_t)a2);
        v12 = ccn_read_uint(v11, v22, (unint64_t)(v23 + 7) >> 3, v21);
        if (!(_DWORD)v12)
        {
          if (a3 != 2 || (a6[*a2] & 1) == (*a5 & 1))
          {
LABEL_35:
            v12 = 0;
            goto LABEL_36;
          }
          v12 = 4294967125;
        }
      }
LABEL_36:
      *(_QWORD *)(a1 + 16) = v14;
      return v12;
    case 2:
      if ((((unint64_t)(cczp_bitlen((uint64_t)a2) + 7) >> 2) | 1) != a4)
        return 4294967125;
      v13 = *a5 - 8;
      v12 = 4294967125;
      goto LABEL_19;
  }
  if (a3 != 3)
    return 4294967289;
  if (ccec_compressed_x962_export_pub_size((uint64_t)a2) != a4)
    return 4294967135;
  v13 = *a5 - 4;
  v12 = 4294967135;
LABEL_19:
  if (v13 >= 0xFFFFFFFE)
    goto LABEL_20;
  return v12;
}

int8x16_t gcm_init(int8x16_t *a1, int8x16_t *a2, double a3, double a4, double a5, double a6, double a7, int8x16_t a8)
{
  int32x4_t v8;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  int8x16_t v19;
  int8x16_t v20;
  int8x16_t v21;
  int8x16_t v22;
  int8x16_t v23;
  int8x16_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int8x16_t v28;
  int8x16_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;
  int8x16_t v33;
  int8x16_t v34;
  int8x16_t v35;
  int8x16_t v36;
  int8x16_t v37;
  int8x16_t v38;
  int8x16_t v39;
  int8x16_t v40;
  int8x16_t v41;
  int8x16_t v42;
  int8x16_t v43;
  int8x16_t v44;
  int8x16_t v45;
  int8x16_t v46;
  int8x16_t v47;
  int8x16_t v48;
  int8x16_t v49;
  int8x16_t v50;
  int8x16_t v51;
  int8x16_t result;

  v8 = (int32x4_t)vqtbl1q_s8(*a2, *(int8x16_t *)qword_10000D7C0);
  v9 = veorq_s8(a8, a8);
  v10 = veorq_s8(vandq_s8(vextq_s8(*(int8x16_t *)&qword_10000D7C0[2], *(int8x16_t *)&qword_10000D7C0[2], 8uLL), (int8x16_t)vshrq_n_s32(vdupq_laneq_s32(v8, 3), 0x1FuLL)), vorrq_s8(vextq_s8(v9, (int8x16_t)vshrq_n_u64((uint64x2_t)v8, 0x3FuLL), 8uLL), (int8x16_t)vshlq_n_s64((int64x2_t)v8, 1uLL)));
  *a1 = v10;
  a1[8] = veorq_s8(v10, vextq_s8(v10, v10, 8uLL));
  v11 = (int8x16_t)vmull_high_p64((uint64x2_t)v10, (uint64x2_t)v10);
  v12 = (int8x16_t)vmull_p64(v10.u64[0], v10.u64[0]);
  v13 = veorq_s8(v12, veorq_s8(v11, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0])));
  v14 = veorq_s8(vextq_s8(v9, v13, 8uLL), v12);
  v15 = veorq_s8(vextq_s8(v14, v14, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v14.u64[0]));
  v16 = veorq_s8(veorq_s8(vextq_s8(v13, v9, 8uLL), v11), veorq_s8(vextq_s8(v15, v15, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v15.u64[0])));
  a1[1] = v16;
  a1[9] = veorq_s8(v16, vextq_s8(v16, v16, 8uLL));
  v13.i64[0] = veorq_s8(v16, vextq_s8(v16, v16, 8uLL)).u64[0];
  v17 = (int8x16_t)vmull_high_p64((uint64x2_t)v16, (uint64x2_t)v10);
  v18 = (int8x16_t)vmull_p64(v16.u64[0], v10.u64[0]);
  v19 = veorq_s8(v18, veorq_s8(v17, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v13.u64[0])));
  v20 = veorq_s8(vextq_s8(v9, v19, 8uLL), v18);
  v21 = veorq_s8(vextq_s8(v20, v20, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v20.u64[0]));
  v22 = veorq_s8(veorq_s8(vextq_s8(v19, v9, 8uLL), v17), veorq_s8(vextq_s8(v21, v21, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v21.u64[0])));
  a1[2] = v22;
  a1[10] = veorq_s8(v22, vextq_s8(v22, v22, 8uLL));
  v19.i64[0] = veorq_s8(v22, vextq_s8(v22, v22, 8uLL)).u64[0];
  v23 = (int8x16_t)vmull_high_p64((uint64x2_t)v22, (uint64x2_t)v10);
  v24 = (int8x16_t)vmull_p64(v22.u64[0], v10.u64[0]);
  v25 = veorq_s8(v24, veorq_s8(v23, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v19.u64[0])));
  v26 = veorq_s8(vextq_s8(v9, v25, 8uLL), v24);
  v27 = veorq_s8(vextq_s8(v26, v26, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v26.u64[0]));
  v28 = veorq_s8(veorq_s8(vextq_s8(v25, v9, 8uLL), v23), veorq_s8(vextq_s8(v27, v27, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v27.u64[0])));
  a1[3] = v28;
  a1[11] = veorq_s8(v28, vextq_s8(v28, v28, 8uLL));
  v25.i64[0] = veorq_s8(v28, vextq_s8(v28, v28, 8uLL)).u64[0];
  v29 = (int8x16_t)vmull_high_p64((uint64x2_t)v28, (uint64x2_t)v10);
  v30 = (int8x16_t)vmull_p64(v28.u64[0], v10.u64[0]);
  v31 = veorq_s8(v30, veorq_s8(v29, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v25.u64[0])));
  v32 = veorq_s8(vextq_s8(v9, v31, 8uLL), v30);
  v33 = veorq_s8(vextq_s8(v32, v32, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v32.u64[0]));
  v34 = veorq_s8(veorq_s8(vextq_s8(v31, v9, 8uLL), v29), veorq_s8(vextq_s8(v33, v33, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v33.u64[0])));
  a1[4] = v34;
  a1[12] = veorq_s8(v34, vextq_s8(v34, v34, 8uLL));
  v31.i64[0] = veorq_s8(v34, vextq_s8(v34, v34, 8uLL)).u64[0];
  v35 = (int8x16_t)vmull_high_p64((uint64x2_t)v34, (uint64x2_t)v10);
  v36 = (int8x16_t)vmull_p64(v34.u64[0], v10.u64[0]);
  v37 = veorq_s8(v36, veorq_s8(v35, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v31.u64[0])));
  v38 = veorq_s8(vextq_s8(v9, v37, 8uLL), v36);
  v39 = veorq_s8(vextq_s8(v38, v38, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v38.u64[0]));
  v40 = veorq_s8(veorq_s8(vextq_s8(v37, v9, 8uLL), v35), veorq_s8(vextq_s8(v39, v39, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v39.u64[0])));
  a1[5] = v40;
  a1[13] = veorq_s8(v40, vextq_s8(v40, v40, 8uLL));
  v37.i64[0] = veorq_s8(v40, vextq_s8(v40, v40, 8uLL)).u64[0];
  v41 = (int8x16_t)vmull_high_p64((uint64x2_t)v40, (uint64x2_t)v10);
  v42 = (int8x16_t)vmull_p64(v40.u64[0], v10.u64[0]);
  v43 = veorq_s8(v42, veorq_s8(v41, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v37.u64[0])));
  v44 = veorq_s8(vextq_s8(v9, v43, 8uLL), v42);
  v45 = veorq_s8(vextq_s8(v44, v44, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v44.u64[0]));
  v46 = veorq_s8(veorq_s8(vextq_s8(v43, v9, 8uLL), v41), veorq_s8(vextq_s8(v45, v45, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v45.u64[0])));
  a1[6] = v46;
  a1[14] = veorq_s8(v46, vextq_s8(v46, v46, 8uLL));
  v43.i64[0] = veorq_s8(v46, vextq_s8(v46, v46, 8uLL)).u64[0];
  v47 = (int8x16_t)vmull_high_p64((uint64x2_t)v46, (uint64x2_t)v10);
  v48 = (int8x16_t)vmull_p64(v46.u64[0], v10.u64[0]);
  v49 = veorq_s8(v48, veorq_s8(v47, (int8x16_t)vmull_p64(veorq_s8(v10, vextq_s8(v10, v10, 8uLL)).u64[0], v43.u64[0])));
  v50 = veorq_s8(vextq_s8(v9, v49, 8uLL), v48);
  v51 = veorq_s8(vextq_s8(v50, v50, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v50.u64[0]));
  result = veorq_s8(veorq_s8(vextq_s8(v49, v9, 8uLL), v47), veorq_s8(vextq_s8(v51, v51, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v51.u64[0])));
  a1[7] = result;
  a1[15] = veorq_s8(result, vextq_s8(result, result, 8uLL));
  return result;
}

int8x16_t gcm_gmult(int8x16_t *a1, uint64x2_t *a2, int8x16_t *a3, double a4, double a5, double a6, double a7, double a8, int8x16_t a9)
{
  int8x16_t v9;
  int8x16_t v10;
  unint64_t v11;
  int8x16_t v12;
  int8x16_t v13;
  int8x16_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t result;

  v9 = vqtbl1q_s8(*a1, *(int8x16_t *)qword_10000D7C0);
  v10 = veorq_s8(a9, a9);
  v11 = veorq_s8(v9, vextq_s8(v9, v9, 8uLL)).u64[0];
  v12 = (int8x16_t)vmull_high_p64((uint64x2_t)v9, *a2);
  v13 = (int8x16_t)vmull_p64(v9.u64[0], a2->i64[0]);
  v14 = veorq_s8(v13, veorq_s8(v12, (int8x16_t)vmull_p64(veorq_s8(*(int8x16_t *)a2, vextq_s8(*(int8x16_t *)a2, *(int8x16_t *)a2, 8uLL)).u64[0], v11)));
  v15 = veorq_s8(vextq_s8(v10, v14, 8uLL), v13);
  v16 = veorq_s8(vextq_s8(v15, v15, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v15.u64[0]));
  result = vqtbl1q_s8(veorq_s8(veorq_s8(vextq_s8(v14, v10, 8uLL), v12), veorq_s8(vextq_s8(v16, v16, 8uLL), (int8x16_t)vmull_p64(0xC200000000000000, v16.u64[0]))), *(int8x16_t *)qword_10000D7C0);
  *a3 = result;
  return result;
}

int8x16_t gcm_ghash(int8x16_t *a1, uint64x2_t *a2, int8x16_t *a3, uint64_t a4)
{
  int8x16_t v4;
  int8x16_t v5;
  int8x16_t v6;
  BOOL v7;
  uint64_t i;
  int8x16_t v9;
  int8x16_t v10;
  int8x16_t v11;
  int8x16_t v12;
  int8x16_t v13;
  uint64x2_t v14;
  int8x16_t v15;
  int8x16_t v16;
  int8x16_t v17;
  int8x16_t v18;
  uint64x2_t v19;
  int8x16_t v20;
  int8x16_t v21;
  int8x16_t v22;
  int8x16_t v23;
  uint64x2_t v24;
  int8x16_t v25;
  int8x16_t v26;
  int8x16_t v27;
  int8x16_t v28;
  uint64x2_t v29;
  int8x16_t v30;
  int8x16_t v31;
  int8x16_t v32;
  int8x16_t v33;
  uint64x2_t v34;
  int8x16_t v35;
  int8x16_t v36;
  int8x16_t v37;
  int8x16_t v38;
  uint64x2_t v39;
  int8x16_t v40;
  int8x16_t v41;
  int8x16_t v42;
  uint64x2_t v43;
  int8x16_t v44;
  int8x16_t v45;
  int8x16_t v46;
  int8x16_t v47;
  int8x16_t v48;
  int8x16_t v49;
  uint64_t v50;
  int8x16_t *v51;
  int8x16_t v52;
  int8x16_t v53;
  uint64x2_t *v54;
  uint64x2_t v55;
  int8x16_t v56;
  int8x16_t v57;
  int8x16_t v58;
  uint64_t j;
  int8x16_t v60;
  int8x16_t v61;
  int8x16_t v62;
  int8x16_t v63;
  int8x16_t v64;
  int8x16_t result;

  v5 = veorq_s8(v4, v4);
  v6 = vqtbl1q_s8(*a1, *(int8x16_t *)qword_10000D7C0);
  v7 = a4 < 128;
  for (i = a4 - 128; !v7; i -= 128)
  {
    v9 = vqtbl1q_s8(a3[7], *(int8x16_t *)qword_10000D7C0);
    v10 = (int8x16_t)vmull_p64(a2->i64[0], v9.u64[0]);
    v11 = (int8x16_t)vmull_high_p64(*a2, (uint64x2_t)v9);
    v12 = (int8x16_t)vmull_p64(a2[8].u64[0], veorq_s8(v9, vextq_s8(v9, v9, 8uLL)).u64[0]);
    v13 = vqtbl1q_s8(a3[6], *(int8x16_t *)qword_10000D7C0);
    v14 = a2[1];
    v15 = veorq_s8(v10, (int8x16_t)vmull_p64(v14.u64[0], v13.u64[0]));
    v16 = veorq_s8(v11, (int8x16_t)vmull_high_p64(v14, (uint64x2_t)v13));
    v17 = veorq_s8(v12, (int8x16_t)vmull_p64(a2[9].u64[0], veorq_s8(v13, vextq_s8(v13, v13, 8uLL)).u64[0]));
    v18 = vqtbl1q_s8(a3[5], *(int8x16_t *)qword_10000D7C0);
    v19 = a2[2];
    v20 = veorq_s8(v15, (int8x16_t)vmull_p64(v19.u64[0], v18.u64[0]));
    v21 = veorq_s8(v16, (int8x16_t)vmull_high_p64(v19, (uint64x2_t)v18));
    v22 = veorq_s8(v17, (int8x16_t)vmull_p64(a2[10].u64[0], veorq_s8(v18, vextq_s8(v18, v18, 8uLL)).u64[0]));
    v23 = vqtbl1q_s8(a3[4], *(int8x16_t *)qword_10000D7C0);
    v24 = a2[3];
    v25 = veorq_s8(v20, (int8x16_t)vmull_p64(v24.u64[0], v23.u64[0]));
    v26 = veorq_s8(v21, (int8x16_t)vmull_high_p64(v24, (uint64x2_t)v23));
    v27 = veorq_s8(v22, (int8x16_t)vmull_p64(a2[11].u64[0], veorq_s8(v23, vextq_s8(v23, v23, 8uLL)).u64[0]));
    v28 = vqtbl1q_s8(a3[3], *(int8x16_t *)qword_10000D7C0);
    v29 = a2[4];
    v30 = veorq_s8(v25, (int8x16_t)vmull_p64(v29.u64[0], v28.u64[0]));
    v31 = veorq_s8(v26, (int8x16_t)vmull_high_p64(v29, (uint64x2_t)v28));
    v32 = veorq_s8(v27, (int8x16_t)vmull_p64(a2[12].u64[0], veorq_s8(v28, vextq_s8(v28, v28, 8uLL)).u64[0]));
    v33 = vqtbl1q_s8(a3[2], *(int8x16_t *)qword_10000D7C0);
    v34 = a2[5];
    v35 = veorq_s8(v30, (int8x16_t)vmull_p64(v34.u64[0], v33.u64[0]));
    v36 = veorq_s8(v31, (int8x16_t)vmull_high_p64(v34, (uint64x2_t)v33));
    v37 = veorq_s8(v32, (int8x16_t)vmull_p64(a2[13].u64[0], veorq_s8(v33, vextq_s8(v33, v33, 8uLL)).u64[0]));
    v38 = vqtbl1q_s8(a3[1], *(int8x16_t *)qword_10000D7C0);
    v39 = a2[6];
    v40 = veorq_s8(v35, (int8x16_t)vmull_p64(v39.u64[0], v38.u64[0]));
    v41 = veorq_s8(v36, (int8x16_t)vmull_high_p64(v39, (uint64x2_t)v38));
    v42 = veorq_s8(v37, (int8x16_t)vmull_p64(a2[14].u64[0], veorq_s8(v38, vextq_s8(v38, v38, 8uLL)).u64[0]));
    v43 = a2[7];
    v44 = veorq_s8(vqtbl1q_s8(*a3, *(int8x16_t *)qword_10000D7C0), v6);
    v45 = veorq_s8(v40, (int8x16_t)vmull_p64(v43.u64[0], v44.u64[0]));
    v46 = veorq_s8(v41, (int8x16_t)vmull_high_p64(v43, (uint64x2_t)v44));
    v47 = veorq_s8(v46, veorq_s8(v45, veorq_s8(v42, (int8x16_t)vmull_p64(a2[15].u64[0], veorq_s8(v44, vextq_s8(v44, v44, 8uLL)).u64[0]))));
    v48 = veorq_s8(v45, vextq_s8(v5, v47, 8uLL));
    v49 = veorq_s8((int8x16_t)vmull_p64(0xC200000000000000, v48.u64[0]), vextq_s8(v48, v48, 8uLL));
    v6 = veorq_s8(veorq_s8(v46, vextq_s8(v47, v5, 8uLL)), veorq_s8((int8x16_t)vmull_p64(0xC200000000000000, v49.u64[0]), vextq_s8(v49, v49, 8uLL)));
    a3 += 8;
    v7 = i < 128;
  }
  v7 = i < -112;
  v50 = i + 112;
  if (!v7)
  {
    v52 = *a3;
    v51 = a3 + 1;
    v53 = veorq_s8(v6, vqtbl1q_s8(v52, *(int8x16_t *)qword_10000D7C0));
    v54 = (uint64x2_t *)((char *)a2 + v50);
    v55 = *(uint64x2_t *)((char *)a2 + v50);
    v56 = (int8x16_t)vmull_p64(v53.u64[0], v55.u64[0]);
    v57 = (int8x16_t)vmull_high_p64((uint64x2_t)v53, v55);
    v58 = (int8x16_t)vmull_p64(veorq_s8(v53, vextq_s8(v53, v53, 8uLL)).u64[0], *(unint64_t *)((char *)a2[8].u64 + v50));
    v7 = v50 < 16;
    for (j = v50 - 16; !v7; j -= 16)
    {
      --v54;
      v60 = *v51++;
      v61 = vqtbl1q_s8(v60, *(int8x16_t *)qword_10000D7C0);
      v56 = veorq_s8(v56, (int8x16_t)vmull_p64(v61.u64[0], v54->i64[0]));
      v57 = veorq_s8(v57, (int8x16_t)vmull_high_p64((uint64x2_t)v61, *v54));
      v58 = veorq_s8(v58, (int8x16_t)vmull_p64(veorq_s8(v61, vextq_s8(v61, v61, 8uLL)).u64[0], v54[8].u64[0]));
      v7 = j < 16;
    }
    v62 = veorq_s8(v57, veorq_s8(v56, v58));
    v63 = veorq_s8(v56, vextq_s8(v5, v62, 8uLL));
    v64 = veorq_s8((int8x16_t)vmull_p64(0xC200000000000000, v63.u64[0]), vextq_s8(v63, v63, 8uLL));
    v6 = veorq_s8(veorq_s8(v57, vextq_s8(v62, v5, 8uLL)), veorq_s8((int8x16_t)vmull_p64(0xC200000000000000, v64.u64[0]), vextq_s8(v64, v64, 8uLL)));
  }
  result = vqtbl1q_s8(v6, *(int8x16_t *)qword_10000D7C0);
  *a1 = result;
  return result;
}

void *ccec_cp_256_asm()
{
  return &unk_100034988;
}

_OWORD *sub_10000D7EC(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t *a4, unint64_t *a5)
{
  return ccn_mulmod_p256(a3, a4, a5);
}

_OWORD *sub_10000D7FC(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t *a4)
{
  return ccn_mulmod_p256(a3, a4, a4);
}

uint64_t sub_10000D80C(uint64_t a1, uint64_t a2, void *a3, unint64_t *a4)
{
  uint64_t v7;
  int v8;
  unint64_t *v9;
  unint64_t *v10;
  unint64_t *v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t result;
  _OWORD v19[2];

  v7 = *(_QWORD *)(a1 + 16);
  v8 = 4;
  v9 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4);
  v10 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4);
  v11 = (unint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 4);
  ccn_mulmod_p256(v11, a4, a4);
  ccn_mulmod_p256(v10, v11, a4);
  ccn_mulmod_p256(v10, v10, v10);
  ccn_mulmod_p256(v10, v10, v10);
  ccn_mulmod_p256(v9, v10, a4);
  ccn_mulmod_p256(v10, v9, v11);
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v8;
  }
  while (v8);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  v12 = 8;
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v12;
  }
  while (v12);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  v13 = 16;
  do
  {
    ccn_mulmod_p256(v10, v10, v10);
    --v13;
  }
  while (v13);
  ccn_mulmod_p256(v9, v9, v10);
  ccn_mulmod_p256(v10, v9, v11);
  ccn_set(4, v11, v10);
  v14 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v14;
  }
  while (v14);
  ccn_mulmod_p256(v11, v11, a4);
  v15 = 128;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v15;
  }
  while (v15);
  ccn_mulmod_p256(v11, v11, v10);
  v16 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v16;
  }
  while (v16);
  ccn_mulmod_p256(v11, v11, v10);
  v17 = 32;
  do
  {
    ccn_mulmod_p256(v11, v11, v11);
    --v17;
  }
  while (v17);
  ccn_mulmod_p256(v10, v11, v9);
  ccn_mulmod_p256(v9, v10, a4);
  v19[0] = xmmword_10002A050;
  v19[1] = unk_10002A060;
  ccn_mulmod_p256(v9, v9, (unint64_t *)v19);
  if (ccn_n(4, v9) == 1 && *v9 == 1)
  {
    ccn_set(4, a3, v10);
    result = 0;
  }
  else
  {
    result = 4294967254;
  }
  *(_QWORD *)(a1 + 16) = v7;
  return result;
}

_OWORD *sub_10000DAF4(uint64_t a1, uint64_t a2, _QWORD *a3, unint64_t *a4)
{
  _OWORD v5[2];

  v5[0] = xmmword_10002A050;
  v5[1] = unk_10002A060;
  return ccn_mulmod_p256(a3, a4, (unint64_t *)v5);
}

uint64_t cczp_mm_redc_ws(uint64_t a1, _QWORD *a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  unint64_t *v15;
  char v16;

  v8 = cczp_n((uint64_t)a2);
  v9 = v8;
  if (v8)
  {
    v10 = a2[*a2 + 3];
    v11 = a4;
    v12 = v8;
    do
    {
      v13 = cczp_prime((uint64_t)a2);
      *v11 = ccn_addmul1(v9, v11, v13, *v11 * v10);
      ++v11;
      --v12;
    }
    while (v12);
  }
  v14 = ccn_add_ws(a1, v9, &a4[v9], &a4[v9], a4);
  v15 = (unint64_t *)cczp_prime((uint64_t)a2);
  v16 = ccn_sub_ws(a1, v9, a4, &a4[v9], v15) ^ v14;
  return ccn_mux(v9, v16, a3, &a4[v9], a4);
}

uint64_t inc_uint(uint64_t result, unint64_t a2)
{
  _BYTE *v2;
  unint64_t v3;
  BOOL v5;

  if (a2)
  {
    v2 = (_BYTE *)(a2 + result - 1);
    v3 = 2;
    do
    {
      if (++*v2--)
        v5 = 1;
      else
        v5 = v3 > a2;
      ++v3;
    }
    while (!v5);
  }
  return result;
}

uint64_t ccn_cond_clear(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t result;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;

  result = ccn_mux_next_mask();
  for (i = __ROR8__(0x5555555555555555, a2 | (2 * result)); a1; --a1)
  {
    v8 = *a3;
    v9 = *a3 ^ result;
    *a3 = v9;
    *a3++ = v9 ^ v8 & 0x5555555555555555 ^ v8 & i ^ result;
  }
  return result;
}

uint64_t ccn_shift_right_asm(uint64_t result, int8x16_t *a2, int8x16_t *a3, uint64_t a4)
{
  unint64_t v4;
  char v5;
  uint64x2_t v6;
  uint64x2_t v7;
  BOOL v8;
  BOOL v9;
  int8x16_t v10;
  int8x16_t v11;
  uint64x2_t v12;
  int8x16_t v13;
  uint64_t v14;
  unint64_t *v15;
  BOOL v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;

  if (result)
  {
    v4 = a3->i64[0];
    v5 = 64 - a4;
    v6 = (uint64x2_t)vdupq_n_s64(64 - a4);
    v7 = (uint64x2_t)vdupq_n_s64(-a4);
    v8 = result == 4;
    v9 = result < 4;
    result -= 4;
    if (!v9)
    {
      if (v8)
      {
        v13 = a3[1];
        *a2 = veorq_s8((int8x16_t)vshlq_u64(*(uint64x2_t *)a3, v7), (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(*a3, v13, 8uLL), v6));
        a2[1] = veorq_s8((int8x16_t)vshlq_u64((uint64x2_t)v13, v7), (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(v13, v13, 8uLL).u64[0], v6));
        return result;
      }
      do
      {
        v10 = *a3;
        v11 = a3[1];
        a3 += 2;
        v4 = a3->i64[0];
        v12.i64[0] = vextq_s8(v11, v11, 8uLL).u64[0];
        v12.i64[1] = a3->i64[0];
        *a2 = veorq_s8((int8x16_t)vshlq_u64((uint64x2_t)v10, v7), (int8x16_t)vshlq_u64((uint64x2_t)vextq_s8(v10, v11, 8uLL), v6));
        a2[1] = veorq_s8((int8x16_t)vshlq_u64((uint64x2_t)v11, v7), (int8x16_t)vshlq_u64(v12, v6));
        a2 += 2;
        v9 = result <= 4;
        result -= 4;
      }
      while (!v9);
    }
    v14 = result + 4;
    v15 = &a3->u64[1];
    v16 = v14 == 2;
    v9 = v14 < 2;
    result = v14 - 2;
    if (!v9)
    {
      if (v16)
      {
        v19 = *v15 >> a4;
        a2->i64[0] = (v4 >> a4) | (*v15 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        a2->i64[1] = v19;
        return result;
      }
      do
      {
        v17 = *v15;
        v18 = v15[1];
        v15 += 2;
        a2->i64[0] = (v4 >> a4) | (v17 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        a2->i64[1] = (v17 >> a4) | (v18 << v5) & (((unint64_t)(64 - a4) >> 6) - 1);
        ++a2;
        v4 = v18;
        v9 = result <= 2;
        result -= 2;
      }
      while (!v9);
    }
    a2->i64[0] = v4 >> a4;
  }
  return result;
}

uint64_t ccn_set_bit(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = 1 << a2;
  v4 = (a2 >> 3) & 0x1FFFFFFFFFFFFFF8;
  if (a3)
    v5 = *(_QWORD *)(result + v4) | v3;
  else
    v5 = *(_QWORD *)(result + v4) & ~v3;
  *(_QWORD *)(result + v4) = v5;
  return result;
}

uint64_t ccn_write_uint_padded(unint64_t a1, unint64_t *a2, unint64_t a3, char *a4)
{
  uint64_t result;

  LODWORD(result) = ccn_write_uint_padded_ct(a1, a2, a3, a4);
  if ((result & 0x80000000) == 0)
    return result;
  ccn_write_uint(a1, a2, a3, (uint64_t)a4);
  return 0;
}

uint64_t ccn_zero(uint64_t a1, void *a2)
{
  return cc_clear(8 * a1, a2);
}

uint64_t ccn_seti(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  *a2 = a3;
  return cc_clear(8 * a1 - 8, a2 + 1);
}

unint64_t ccn_cond_rsub(uint64_t a1, uint64_t a2, uint64_t *a3, unint64_t *a4, uint64_t *a5)
{
  uint64_t mask;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;

  mask = ccn_mux_next_mask();
  v11 = __ROR8__(0x5555555555555555, a2 | (2 * mask));
  if (a1)
  {
    v12 = 0;
    do
    {
      v14 = *a4++;
      v13 = v14;
      v15 = *a5++;
      v16 = __PAIR128__(v12, v12) - v13;
      v17 = v16 + v15;
      if (__CFADD__((_QWORD)v16, v15))
        v18 = *((_QWORD *)&v16 + 1) + 1;
      else
        v18 = (__PAIR128__(v12, v12) - v13) >> 64;
      v12 = v18 >> 63;
      v19 = v13 ^ v17;
      v20 = v13 ^ mask;
      *a3 = v20;
      *a3++ = v19 & v11 ^ v19 & 0x5555555555555555 ^ v20 ^ mask;
      --a1;
    }
    while (a1);
    v21 = (unint64_t)v18 >> 63;
  }
  else
  {
    v21 = 0;
  }
  return v21 & a2;
}

uint64_t AccelerateCrypto_ecb_AES_encrypt(__int128 *a1, int a2, uint64_t a3, int8x16_t *a4)
{
  uint64_t v4;
  int v6;
  int8x16_t i;
  uint64_t v9;
  int v25;
  uint64_t v27;

  v4 = *((unsigned int *)a1 + 60);
  _VF = __OFSUB__(a2, 4);
  v6 = a2 - 4;
  for (i = *(int8x16_t *)((char *)a1 + v4); v6 < 0 == _VF; v6 -= 4)
  {
    _Q4 = *a1;
    v9 = 16;
    a3 += 64;
    do
    {
      __asm
      {
        AESE            V0.16B, V4.16B
        AESMC           V0.16B, V0.16B
        AESE            V1.16B, V4.16B
        AESMC           V1.16B, V1.16B
        AESE            V2.16B, V4.16B
        AESMC           V2.16B, V2.16B
        AESE            V3.16B, V4.16B
        AESMC           V3.16B, V3.16B
      }
      _Q4 = a1[(unint64_t)v9 / 0x10];
      v9 += 16;
    }
    while (v9 < v4);
    __asm
    {
      AESE            V0.16B, V4.16B
      AESE            V1.16B, V4.16B
      AESE            V2.16B, V4.16B
      AESE            V3.16B, V4.16B
    }
    *a4 = veorq_s8(_Q0, i);
    a4[1] = veorq_s8(_Q1, i);
    a4[2] = veorq_s8(_Q2, i);
    a4[3] = veorq_s8(_Q3, i);
    a4 += 4;
    _VF = __OFSUB__(v6, 4);
  }
  v25 = v6 & 3;
  if (v25)
  {
    do
    {
      _Q4 = *a1;
      v27 = 16;
      a3 += 16;
      do
      {
        __asm
        {
          AESE            V0.16B, V4.16B
          AESMC           V0.16B, V0.16B
        }
        _Q4 = a1[(unint64_t)v27 / 0x10];
        v27 += 16;
      }
      while (v27 < v4);
      __asm { AESE            V0.16B, V4.16B }
      *a4++ = veorq_s8(_Q0, i);
      _VF = __OFSUB__(v25--, 1);
    }
    while (!((v25 < 0) ^ _VF | (v25 == 0)));
  }
  return 0;
}

unint64_t ccec_export_affine_point_size(uint64_t a1, int a2)
{
  char v2;
  unint64_t v8;
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
  switch(a2)
  {
    case 1:
    case 2:
      v8 = ((unint64_t)(cczp_bitlen(a1) + 7) >> 2) | 1;
      break;
    case 3:
      v8 = ccec_compressed_x962_export_pub_size(a1);
      break;
    case 4:
      v8 = (unint64_t)(cczp_bitlen(a1) + 7) >> 3;
      break;
    default:
      v8 = 0;
      break;
  }
  cc_disable_dit(&v10);
  return v8;
}

uint64_t ccec_export_affine_point(uint64_t *a1, int a2, unint64_t *a3, unint64_t *a4, char *a5)
{
  char v10;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  unint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  char v26;

  v10 = 0;
  v26 = 0;
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
  v26 = v10;
  v16 = ccec_export_affine_point_size((uint64_t)a1, a2);
  if (v16)
  {
    if (*a4 < v16)
    {
      v24 = 4294967133;
    }
    else
    {
      *a4 = v16;
      v17 = a2 - 1;
      if ((a2 - 1) <= 2)
        *a5 = 0x20604u >> (8 * v17);
      v18 = *a1;
      if (a2 == 4)
        v19 = a5;
      else
        v19 = a5 + 1;
      v20 = cczp_bitlen((uint64_t)a1);
      if ((ccn_write_uint_padded_ct(v18, a3, (unint64_t)(v20 + 7) >> 3, v19) & 0x80000000) != 0
        || v17 <= 1
        && (v21 = &v19[(unint64_t)(cczp_bitlen((uint64_t)a1) + 7) >> 3],
            v22 = &a3[*a1],
            v23 = cczp_bitlen((uint64_t)a1),
            (ccn_write_uint_padded_ct(v18, v22, (unint64_t)(v23 + 7) >> 3, v21) & 0x80000000) != 0))
      {
        v24 = 0xFFFFFFFFLL;
      }
      else if ((a2 & 0xFFFFFFFE) == 2)
      {
        v24 = 0;
        *a5 |= a3[*a1] & 1;
      }
      else
      {
        v24 = 0;
      }
    }
  }
  else
  {
    v24 = 4294967289;
  }
  cc_disable_dit(&v26);
  return v24;
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

double ccn_shift_left(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64x2_t a5)
{
  uint64_t v5;
  uint64x2_t v6;
  uint64x2_t v7;
  unint64_t *v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  uint64x2_t v12;
  uint64x2_t v13;
  uint64x2_t v14;
  uint64x2_t v15;
  uint64x2_t v16;
  int8x16_t v17;
  uint64_t v18;
  uint64x2_t v19;

  v5 = a2 + 8 * a1;
  v6 = (uint64x2_t)vdupq_n_s64(a4);
  v7 = (uint64x2_t)vdupq_n_s64(a4 - 64);
  v8 = (unint64_t *)(a3 + 8 * a1 - 8);
  v9 = a1 == 4;
  v10 = a1 < 4;
  v11 = a1 - 4;
  if (!v10)
  {
    if (v9)
    {
      v16.i64[0] = 0;
      v16.i64[1] = *(v8 - 3);
      a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(v16, v7), (int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 3), v6));
      v17 = veorq_s8((int8x16_t)vshlq_u64(*((uint64x2_t *)v8 - 1), v7), (int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 1), v6));
      *(uint64x2_t *)(v5 - 32) = a5;
      *(int8x16_t *)(v5 - 16) = v17;
      return *(double *)a5.i64;
    }
    do
    {
      v12 = *(uint64x2_t *)(v8 - 3);
      v13 = *(uint64x2_t *)(v8 - 1);
      v14 = *((uint64x2_t *)v8 - 2);
      v15 = *((uint64x2_t *)v8 - 1);
      v8 -= 4;
      a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(v14, v7), (int8x16_t)vshlq_u64(v12, v6));
      *(uint64x2_t *)(v5 - 32) = a5;
      *(int8x16_t *)(v5 - 16) = veorq_s8((int8x16_t)vshlq_u64(v15, v7), (int8x16_t)vshlq_u64(v13, v6));
      v5 -= 32;
      v10 = v11 <= 4;
      v11 -= 4;
    }
    while (!v10);
  }
  v18 = v11 & 3;
  if (!v18)
    return *(double *)a5.i64;
  if (v18 == 3)
  {
    v19 = *((uint64x2_t *)v8 - 1);
  }
  else
  {
    if ((v18 & 2) == 0)
      goto LABEL_13;
    v19.i64[0] = 0;
    v19.i64[1] = *(v8 - 1);
  }
  a5 = (uint64x2_t)veorq_s8((int8x16_t)vshlq_u64(*(uint64x2_t *)(v8 - 1), v6), (int8x16_t)vshlq_u64(v19, v7));
  v8 -= 2;
  *(uint64x2_t *)(v5 - 16) = a5;
  v5 -= 16;
LABEL_13:
  if ((v18 & 1) != 0)
  {
    a5.i64[0] = *v8;
    a5.i64[0] = vshlq_u64(a5, v6).u64[0];
    *(_QWORD *)(v5 - 8) = a5.i64[0];
  }
  return *(double *)a5.i64;
}

uint64_t cc_clear(rsize_t __n, void *__s)
{
  return memset_s(__s, __n, 0, __n);
}

uint64_t ccn_cond_add(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t mask;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  mask = ccn_mux_next_mask();
  v11 = __ROR8__(0x5555555555555555, a2 | (2 * mask));
  v12 = 0;
  if (a1)
  {
    v13 = 0;
    do
    {
      v15 = *a4++;
      v14 = v15;
      v17 = *a5++;
      v16 = v17;
      v18 = __CFADD__(v12, v14);
      v19 = v12 + v14;
      if (v18)
        v13 = 1;
      v18 = __CFADD__(v19, v16);
      v20 = v19 + v16;
      if (v18)
        v12 = v13 + 1;
      else
        v12 = v13;
      v21 = v14 ^ v20;
      v22 = v14 ^ mask;
      *a3 = v22;
      *a3++ = v21 & v11 ^ v21 & 0x5555555555555555 ^ v22 ^ mask;
      v13 = 0;
      --a1;
    }
    while (a1);
  }
  return v12 & a2;
}

uint64_t cczp_is_quadratic_residue_ws(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  int8x16_t *v8;
  void *v9;
  int8x16_t *v10;
  _QWORD *v11;
  unsigned int v12;
  _BOOL4 v13;
  uint64_t result;

  v6 = cczp_n(a2);
  v7 = *(_QWORD *)(a1 + 16);
  v8 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  v9 = (void *)cczp_prime(a2);
  ccn_set(v6, v8, v9);
  v8->i64[0] &= ~1uLL;
  v10 = (int8x16_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  ccn_shift_right(v6, v10, v8, 1);
  v11 = (_QWORD *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v6);
  v12 = cczp_power_fast_ws(a1, a2, v11, a3, (unint64_t *)v10);
  cczp_from_ws(a1, a2);
  v13 = ccn_n(v6, v11) == 1 && *v11 == 1;
  result = v13 & ~(((v12 | ((unint64_t)(int)v12 >> 32)) + 0xFFFFFFFF) >> 32);
  *(_QWORD *)(a1 + 16) = v7;
  return result;
}

uint64_t ccdrbg_init(uint64_t a1)
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
  v7 = (*(uint64_t (**)(void))(a1 + 8))();
  cc_disable_dit(&v9);
  return v7;
}

uint64_t ccdrbg_reseed(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
  v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 16))(a2, a3, a4, a5, a6);
  cc_disable_dit(&v14);
  return v12;
}

uint64_t ccdrbg_generate(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
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
  v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 24))(a2, a3, a4, a5, a6);
  cc_disable_dit(&v14);
  return v12;
}

uint64_t cczp_add_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  unint64_t *v13;
  BOOL v14;
  uint64_t result;

  v10 = *(_QWORD *)(a1 + 16);
  v11 = cczp_n(a2);
  v12 = (uint64_t *)(*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v11);
  LOBYTE(a5) = ccn_add_ws(a1, v11, a3, a4, a5);
  v13 = (unint64_t *)cczp_prime(a2);
  v14 = ccn_sub_ws(a1, v11, v12, a3, v13);
  result = ccn_mux(v11, !v14 | a5, a3, v12, a3);
  *(_QWORD *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_add_ws(uint64_t a1, uint64_t a2)
{
  return (**(uint64_t (***)(void))(a2 + 16))();
}

uint64_t cczp_div2_ws(uint64_t a1, uint64_t a2, int8x16_t *a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t result;

  v7 = cczp_n(a2);
  v8 = *a4 & 1;
  v9 = (uint64_t *)cczp_prime(a2);
  v10 = ccn_cond_add(v7, v8, a3->i64, a4, v9);
  result = ccn_shift_right(v7, a3, a3, 1);
  a3->i64[v7 - 1] |= v10 << 63;
  return result;
}

uint64_t cczp_modn_ws(uint64_t a1, _QWORD *a2, uint64_t *a3, uint64_t a4, char *a5)
{
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t v14;
  char *v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  char *v19;

  v10 = cczp_n((uint64_t)a2);
  v11 = v10;
  if ((a4 - 1) / v10 <= 1)
    v12 = 1;
  else
    v12 = (a4 - 1) / v10;
  v17 = a4;
  v18 = *(_QWORD *)(a1 + 16);
  v13 = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v10);
  v19 = a5;
  ccn_set(v11, v13, a5);
  v14 = v12 - 1;
  if (v12 != 1)
  {
    v15 = &v19[8 * v11];
    do
    {
      ccn_set(v11, &v13[8 * v11], v15);
      cczp_mm_redc_ws(a1, a2, (uint64_t *)v13, (uint64_t *)v13);
      v15 += 8 * v11;
      --v14;
    }
    while (v14);
  }
  if (v17 != v12 * v11)
    ccn_set(v17 - v12 * v11, &v13[8 * v11], &v19[8 * v12 * v11]);
  ccn_zero(v11 - (v17 - v12 * v11), &v13[8 * v11 + 8 * (v17 - v12 * v11)]);
  cczp_mm_redc_ws(a1, a2, a3, (uint64_t *)v13);
  do
  {
    ccn_mul_ws(a1, v11, (uint64_t)v13, (uint64_t)a3, (uint64_t)&a2[*a2 + 4]);
    result = cczp_mm_redc_ws(a1, a2, a3, (uint64_t *)v13);
    --v12;
  }
  while (v12);
  *(_QWORD *)(a1 + 16) = v18;
  return result;
}

uint64_t cczp_mod_default_ws(uint64_t a1, _QWORD *a2, uint64_t *a3, char *a4)
{
  uint64_t v8;

  v8 = 2 * cczp_n((uint64_t)a2);
  return cczp_modn_ws(a1, a2, a3, v8, a4);
}

uint64_t cczp_mod_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 32))();
}

uint64_t cczp_mul_default_ws(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  v9 = *(_QWORD *)(a1 + 16);
  v10 = cczp_n(a2);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, 2 * v10);
  v12 = cczp_n(a2);
  ccn_mul_ws(a1, v12, v11, a4, a5);
  result = cczp_mod_ws(a1, a2);
  *(_QWORD *)(a1 + 16) = v9;
  return result;
}

uint64_t cczp_mul_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 16))();
}

_OWORD *ccn_mulmod_p256(_QWORD *a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  _BOOL1 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL8 v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  _BOOL8 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _BOOL8 v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL8 v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  _BOOL8 v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BOOL8 v52;
  uint64_t v53;
  uint64_t v54;
  _BOOL8 v55;
  uint64_t v56;
  _BOOL8 v57;
  _BOOL8 v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  _BOOL8 v62;
  uint64_t v63;
  uint64_t v64;
  _BOOL8 v65;
  uint64_t v66;
  _BOOL8 v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BOOL8 v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _BOOL8 v77;
  uint64_t v78;
  _BOOL8 v79;
  uint64_t v80;
  _BOOL8 v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  _BOOL8 v85;
  uint64_t v86;
  _BOOL8 v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  _BOOL8 v91;
  uint64_t v92;
  _BOOL8 v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  _BOOL8 v97;
  uint64_t v98;
  _BOOL8 v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _BOOL8 v103;
  uint64_t v104;
  _BOOL8 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _BOOL8 v109;
  unint64_t v110;
  _BOOL8 v111;
  uint64_t v112;
  _BOOL8 v113;
  _BOOL8 v114;
  uint64_t v115;
  unint64_t v116;
  _BOOL8 v117;
  uint64_t v118;
  uint64_t v119;
  _OWORD *result;

  v4 = *a2;
  v5 = a2[1];
  v3 = a2 + 2;
  v6 = *v3;
  v7 = v3[1];
  v9 = *a3;
  v10 = a3[1];
  v8 = a3 + 2;
  v11 = *v8;
  v12 = v8[1];
  v13 = v4 * v9;
  v14 = (v5 * (unsigned __int128)v9) >> 64;
  v15 = *v3 * v9;
  v16 = (v6 * (unsigned __int128)v9) >> 64;
  v18 = v9;
  v17 = (__PAIR128__(v5, v4) * v9) >> 64;
  v19 = __CFADD__(__CFADD__((v4 * (unsigned __int128)v9) >> 64, v5 * v9), v14);
  v20 = __CFADD__((v4 * (unsigned __int128)v9) >> 64, v5 * v9) + v14;
  v19 |= __CFADD__(v15, v20);
  v20 += v15;
  v21 = (v7 * (unsigned __int128)v9) >> 64;
  v22 = (v7 * (unsigned __int128)v10) >> 64;
  v24 = v19;
  v19 = __CFADD__(v19, v16);
  v23 = v24 + v16;
  v19 |= __CFADD__(v7 * v9, v23);
  v23 += v7 * v9;
  v26 = v19;
  v19 = __CFADD__(v19, v21);
  v25 = v26 + v21;
  v19 |= __CFADD__(v7 * v10, v25);
  v25 += v7 * v10;
  v27 = v7 * *v8;
  v28 = (v7 * (unsigned __int128)v11) >> 64;
  v30 = v19;
  v19 = __CFADD__(v19, v22);
  v29 = v30 + v22;
  v19 |= __CFADD__(v27, v29);
  v29 += v27;
  v32 = v19;
  v19 = __CFADD__(v19, v28);
  v31 = v32 + v28;
  v19 |= __CFADD__(v7 * v12, v31);
  v31 += v7 * v12;
  v33 = v19 + ((v7 * (unsigned __int128)v12) >> 64);
  v34 = (v4 * (unsigned __int128)v10) >> 64;
  v19 = __CFADD__(v17, v4 * v10);
  v35 = (__PAIR128__(v10, v18) * __PAIR128__(v5, v4)) >> 64;
  v37 = v19;
  v19 = __CFADD__(v19, v20);
  v36 = v37 + v20;
  v19 |= __CFADD__(v34, v36);
  v36 += v34;
  v38 = (v6 * (unsigned __int128)v10) >> 64;
  v40 = v19;
  v19 = __CFADD__(v19, v23);
  v39 = v40 + v23;
  v19 |= __CFADD__(v6 * v10, v39);
  v39 += v6 * v10;
  v42 = v19;
  v19 = __CFADD__(v19, v25);
  v41 = v42 + v25;
  v19 |= __CFADD__(v38, v41);
  v41 += v38;
  v43 = (v6 * (unsigned __int128)v12) >> 64;
  v45 = v19;
  v19 = __CFADD__(v19, v29);
  v44 = v45 + v29;
  v19 |= __CFADD__(v6 * v12, v44);
  v44 += v6 * v12;
  v47 = v19;
  v19 = __CFADD__(v19, v31);
  v46 = v47 + v31;
  v19 |= __CFADD__(v43, v46);
  v46 += v43;
  v48 = v19 + v33;
  v49 = (v5 * (unsigned __int128)v10) >> 64;
  v19 = __CFADD__(v36, v5 * v10);
  v50 = v36 + v5 * v10;
  v52 = v19;
  v19 = __CFADD__(v19, v39);
  v51 = v52 + v39;
  v19 |= __CFADD__(v49, v51);
  v51 += v49;
  v53 = (v6 * (unsigned __int128)v11) >> 64;
  v55 = v19;
  v19 = __CFADD__(v19, v41);
  v54 = v55 + v41;
  v19 |= __CFADD__(v6 * v11, v54);
  v54 += v6 * v11;
  v57 = v19;
  v19 = __CFADD__(v19, v44);
  v56 = v57 + v44;
  v19 |= __CFADD__(v53, v56);
  v56 += v53;
  v58 = v19;
  v59 = (v4 * (unsigned __int128)v11) >> 64;
  v19 = __CFADD__(v50, v4 * v11);
  v60 = v50 + v4 * v11;
  v62 = v19;
  v19 = __CFADD__(v19, v51);
  v61 = v62 + v51;
  v19 |= __CFADD__(v59, v61);
  v61 += v59;
  v63 = (v5 * (unsigned __int128)v12) >> 64;
  v65 = v19;
  v19 = __CFADD__(v19, v54);
  v64 = v65 + v54;
  v19 |= __CFADD__(v5 * v12, v64);
  v64 += v5 * v12;
  v67 = v19;
  v19 = __CFADD__(v19, v56);
  v66 = v67 + v56;
  v19 |= __CFADD__(v63, v66);
  v66 += v63;
  v68 = v19 + v58;
  v69 = (v5 * (unsigned __int128)v11) >> 64;
  v19 = __CFADD__(v61, v5 * v11);
  v70 = v61 + v5 * v11;
  v72 = v19;
  v19 = __CFADD__(v19, v64);
  v71 = v72 + v64;
  v19 |= __CFADD__(v69, v71);
  v71 += v69;
  v73 = v19;
  v74 = (v4 * (unsigned __int128)v12) >> 64;
  v19 = __CFADD__(v70, v4 * v12);
  v75 = v70 + v4 * v12;
  v77 = v19;
  v19 = __CFADD__(v19, v71);
  v76 = v77 + v71;
  v19 |= __CFADD__(v74, v76);
  v76 += v74;
  v79 = v19;
  v19 = __CFADD__(v19, v66);
  v78 = v79 + v66;
  v19 |= __CFADD__(v73, v78);
  v78 += v73;
  v81 = v19;
  v19 = __CFADD__(v19, v46);
  v80 = v81 + v46;
  v19 |= __CFADD__(v68, v80);
  v80 += v68;
  v82 = v19 + v48;
  v19 = __CFADD__(v35, v13 << 32);
  v83 = v35 + (v13 << 32);
  v85 = v19;
  v19 = __CFADD__(v19, v60);
  v84 = v85 + v60;
  v19 |= __CFADD__(HIDWORD(v13), v84);
  v84 += HIDWORD(v13);
  v87 = v19;
  v19 = __CFADD__(v19, v75);
  v86 = v87 + v75;
  v19 |= __CFADD__(0xFFFFFFFF00000001 * v13, v86);
  v86 += 0xFFFFFFFF00000001 * v13;
  v88 = v19 + ((v13 * (unsigned __int128)0xFFFFFFFF00000001) >> 64);
  v19 = __CFADD__(v84, v83 << 32);
  v89 = v84 + (v83 << 32);
  v91 = v19;
  v19 = __CFADD__(v19, v86);
  v90 = v91 + v86;
  v19 |= __CFADD__(HIDWORD(v83), v90);
  v90 += HIDWORD(v83);
  v93 = v19;
  v19 = __CFADD__(v19, v76);
  v92 = v93 + v76;
  v19 |= __CFADD__(0xFFFFFFFF00000001 * v83, v92);
  v92 += 0xFFFFFFFF00000001 * v83;
  v94 = v19 + ((v83 * (unsigned __int128)0xFFFFFFFF00000001) >> 64);
  v19 = __CFADD__(v90, v89 << 32);
  v95 = v90 + (v89 << 32);
  v97 = v19;
  v19 = __CFADD__(v19, v92);
  v96 = v97 + v92;
  v19 |= __CFADD__(HIDWORD(v89), v96);
  v96 += HIDWORD(v89);
  v99 = v19;
  v19 = __CFADD__(v19, v78);
  v98 = v99 + v78;
  v19 |= __CFADD__(0xFFFFFFFF00000001 * v89, v98);
  v98 += 0xFFFFFFFF00000001 * v89;
  v100 = v19 + ((v89 * (unsigned __int128)0xFFFFFFFF00000001) >> 64);
  v19 = __CFADD__(v96, v95 << 32);
  v101 = v96 + (v95 << 32);
  v103 = v19;
  v19 = __CFADD__(v19, v98);
  v102 = v103 + v98;
  v19 |= __CFADD__(HIDWORD(v95), v102);
  v102 += HIDWORD(v95);
  v105 = v19;
  v19 = __CFADD__(v19, v80);
  v104 = v105 + v80;
  v19 |= __CFADD__(0xFFFFFFFF00000001 * v95, v104);
  v104 += 0xFFFFFFFF00000001 * v95;
  v106 = v19 + ((v95 * (unsigned __int128)0xFFFFFFFF00000001) >> 64);
  v19 = __CFADD__(v88, v101);
  v107 = v88 + v101;
  v109 = v19;
  v19 = __CFADD__(v19, v94);
  v108 = v109 + v94;
  v19 |= __CFADD__(v102, v108);
  v108 += v102;
  v111 = v19;
  v19 = __CFADD__(v19, v100);
  v110 = v111 + v100;
  v19 |= __CFADD__(v104, v110);
  v110 += v104;
  v113 = v19;
  v19 = __CFADD__(v19, v106);
  v112 = v113 + v106;
  v19 |= __CFADD__(v82, v112);
  v112 += v82;
  v114 = v19;
  v19 = __CFADD__(v107++, 1);
  LOBYTE(v113) = v19;
  v19 = __CFSUB__(v108, 0xFFFFFFFFLL, v19);
  v115 = v108 - (!v113 + 0xFFFFFFFFLL);
  LOBYTE(v113) = v19;
  v19 = v110 >= !v19;
  v116 = v110 - !v113;
  LOBYTE(v113) = v19;
  v19 = __CFSUB__(v112, 0xFFFFFFFF00000001, v19);
  v117 = v114 - !v19;
  v118 = v114 - !v19;
  v19 = __CFADD__(__CFADD__(v107, v117), v115);
  v119 = __CFADD__(v107, v117) + v115;
  *a1 = v107 + v117;
  a1[1] = v118 + v119;
  result = a1 + 2;
  *result = __PAIR128__(v117 & 0xFFFFFFFF00000001, v19 | __CFADD__(v118, v119))
          + __PAIR128__(v112 - ((unint64_t)!v113 - 0xFFFFFFFF), v116);
  return result;
}

uint64_t cczp_sqr_default_ws(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t result;

  v7 = *(_QWORD *)(a1 + 16);
  v8 = cczp_n(a2);
  v9 = (_QWORD *)(*(uint64_t (**)(uint64_t, unint64_t))(a1 + 24))(a1, 2 * v8);
  ccn_sqr_ws(a1, v8, v9, a4);
  result = cczp_mod_ws(a1, a2);
  *(_QWORD *)(a1 + 16) = v7;
  return result;
}

uint64_t cczp_sqr_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 24))();
}

uint64_t cczp_prime(uint64_t a1)
{
  return a1 + 24;
}

uint64_t cczp_sub_default_ws(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4, unint64_t *a5)
{
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t *v13;
  uint64_t result;

  v10 = *(_QWORD *)(a1 + 16);
  v11 = cczp_n(a2);
  v12 = ccn_sub_ws(a1, v11, a3, a4, a5);
  v13 = (uint64_t *)cczp_prime(a2);
  result = ccn_cond_add(v11, v12, a3, a3, v13);
  *(_QWORD *)(a1 + 16) = v10;
  return result;
}

uint64_t cczp_sub_ws(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a2 + 16) + 8))();
}

uint64_t sub_10000EDF8(int a1, unint64_t a2, char *buffer)
{
  unint64_t v4;
  size_t v5;

  if (a2)
  {
    v4 = a2;
    do
    {
      if (v4 >= 0x100)
        v5 = 256;
      else
        v5 = v4;
      if (getentropy(buffer, v5) == -1)
        cc_abort();
      buffer += v5;
      v4 -= v5;
    }
    while (v4);
  }
  return 0;
}

uint64_t ccecdh_generate_key_ws(uint64_t a1, uint64_t *a2, uint64_t (**a3)(_QWORD, uint64_t, uint64_t *), uint64_t **a4)
{
  uint64_t v7;
  uint64_t result;

  v7 = *(_QWORD *)(a1 + 16);
  result = ccec_generate_key_internal_fips_ws(a1, a2, a3, a4);
  if (!(_DWORD)result)
  {
    if (ccecdh_pairwise_consistency_check_ws(a1, a4, 0, a3))
      result = 4294967278;
    else
      result = 0;
  }
  *(_QWORD *)(a1 + 16) = v7;
  return result;
}

uint64_t ccecdh_generate_key(uint64_t *a1, uint64_t (**a2)(_QWORD, uint64_t, uint64_t *), uint64_t **a3)
{
  char v6;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t key_ws;
  _QWORD v20[4];
  void (*v21)(uint64_t);
  char v22;

  v6 = 0;
  v22 = 0;
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
  v22 = v6;
  v12 = *a1;
  v13 = sizeof_struct_ccec_full_ctx();
  v14 = sizeof_cc_unit();
  v20[0] = cc_malloc_clear(8 * ((v13 + v14 + 4 * v12 * v14 - 1) / v14 - v12 + 32 * v12));
  v15 = *a1;
  v16 = sizeof_struct_ccec_full_ctx();
  v17 = sizeof_cc_unit();
  v20[1] = (v16 + v17 + 4 * v15 * v17 - 1) / v17 - v15 + 32 * v15;
  v20[2] = 0;
  v20[3] = cc_ws_alloc;
  v21 = cc_ws_free;
  if (v20[0])
  {
    key_ws = ccecdh_generate_key_ws((uint64_t)v20, a1, a2, a3);
    v21((uint64_t)v20);
  }
  else
  {
    key_ws = 4294967283;
  }
  cc_disable_dit(&v22);
  return key_ws;
}

void *ccsha256_di()
{
  return &ccsha256_vng_arm_di;
}

uint64_t ccdrbg_df_derive_keys(uint64_t (**a1)(void), uint64_t a2, uint64_t a3, rsize_t a4, void *a5)
{
  uint64_t v7;

  v7 = (*a1)();
  if ((_DWORD)v7)
    cc_clear(a4, a5);
  return v7;
}

uint64_t ccdrbg_df_bc_derive_keys(uint64_t a1, uint64_t a2, uint64_t a3, size_t a4, _QWORD *a5)
{
  _QWORD *v9;
  size_t v10;
  size_t v11;
  char *v12;
  unsigned int v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  uint64_t v20;
  size_t *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  _QWORD *v32;
  char *v33;
  size_t v34;
  size_t *v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD v39[2];
  _OWORD v40[3];
  __int128 v41;
  _QWORD __src[2];
  unsigned int v43;
  unsigned int v44;

  v32 = a5;
  v9 = *(_QWORD **)(a1 + 8);
  v10 = (*v9 + 15) & 0xFFFFFFFFFFFFFFF0;
  v33 = (char *)&v31 - v10;
  bzero((char *)&v31 - v10, v10);
  v11 = (v9[1] + 15) & 0xFFFFFFFFFFFFFFF0;
  v12 = (char *)&v31 - v11;
  v13 = 0;
  if (a2)
  {
    v14 = (uint64_t *)(a3 + 8);
    v15 = a2;
    do
    {
      v16 = *v14;
      v14 += 2;
      v13 += v16;
      --v15;
    }
    while (v15);
  }
  bzero(v12, v11);
  __src[0] = 0;
  __src[1] = 0;
  v43 = bswap32(v13);
  v44 = bswap32(a4);
  v41 = xmmword_10002A090;
  memset(v40, 0, sizeof(v40));
  v17 = *(_QWORD *)(a1 + 16);
  v39[0] = 0;
  v39[1] = 0;
  v37 = v17 + 16;
  if (v17 == -16)
  {
LABEL_13:
    v23 = v33;
    v24 = cccbc_init((uint64_t)v9);
    v25 = v32;
    if (!(_DWORD)v24)
    {
      if (!a4)
      {
LABEL_26:
        v29 = 0;
        goto LABEL_27;
      }
      v26 = (_QWORD *)((char *)v40 + *(_QWORD *)(a1 + 16));
      while (1)
      {
        v27 = (uint64_t)v26;
        cc_clear(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8), v12);
        v26 = a4 <= 0xF ? v39 : v25;
        v24 = cccbc_update(*(_QWORD *)(a1 + 8), (uint64_t)v23, (uint64_t)v12, 1, v27, (uint64_t)v26);
        if ((_DWORD)v24)
          break;
        if (a4 <= 0xF)
          memcpy(v25, v26, a4);
        if (a4 >= 0x10)
          v28 = 16;
        else
          v28 = a4;
        v25 = (_QWORD *)((char *)v25 + v28);
        a4 -= v28;
        if (!a4)
          goto LABEL_26;
      }
    }
    v29 = v24;
    goto LABEL_27;
  }
  v36 = a2;
  v18 = 0;
  v19 = 0;
  v34 = 16 - (((_BYTE)v13 + 8) & 0xF);
  v35 = (size_t *)(a3 + 8);
  while (1)
  {
    cc_clear(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8), v12);
    LODWORD(__src[0]) = bswap32(v18);
    v38 = 0;
    v20 = sub_10000F330(*(_QWORD *)(a1 + 8), a1 + 32, (uint64_t)v12, (uint64_t)&v40[v19 / 0x10], &v38, 0x18uLL, (char *)__src);
    if ((_DWORD)v20)
      break;
    v21 = v35;
    v22 = v36;
    if (v36)
    {
      do
      {
        v20 = sub_10000F330(*(_QWORD *)(a1 + 8), a1 + 32, (uint64_t)v12, (uint64_t)&v40[v19 / 0x10], &v38, *v21, (char *)*(v21 - 1));
        if ((_DWORD)v20)
          goto LABEL_28;
        v21 += 2;
      }
      while (--v22);
    }
    v20 = sub_10000F330(*(_QWORD *)(a1 + 8), a1 + 32, (uint64_t)v12, (uint64_t)&v40[v19 / 0x10], &v38, v34, (char *)&v41);
    if ((_DWORD)v20)
      break;
    ++v18;
    v19 += 16;
    if (v19 >= v37)
    {
      v9 = *(_QWORD **)(a1 + 8);
      goto LABEL_13;
    }
  }
LABEL_28:
  v29 = v20;
  v23 = v33;
LABEL_27:
  cc_clear(**(_QWORD **)(a1 + 8), v23);
  cc_clear(*(_QWORD *)(*(_QWORD *)(a1 + 8) + 8), v12);
  return v29;
}

uint64_t sub_10000F330(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, size_t __n, char *__src)
{
  char *v7;
  size_t v8;
  unint64_t v14;
  BOOL v15;
  uint64_t result;

  v7 = __src;
  v8 = __n;
  v14 = 16 - *a5;
  if (*a5)
    v15 = __n >= v14;
  else
    v15 = 0;
  if (v15)
  {
    memcpy((void *)(a4 + *a5), __src, 16 - *a5);
    result = cccbc_update(a1, a2, a3, 1, a4, a4);
    if ((_DWORD)result)
      return result;
    v8 -= v14;
    v7 += v14;
    *a5 = 0;
  }
  if (v8 < 0x10)
  {
LABEL_11:
    if (v8)
    {
      memcpy((void *)(a4 + *a5), v7, v8);
      result = 0;
      *a5 += v8;
    }
    else
    {
      return 0;
    }
  }
  else
  {
    while (1)
    {
      result = cccbc_update(a1, a2, a3, 1, (uint64_t)v7, a4);
      if ((_DWORD)result)
        break;
      v8 -= 16;
      v7 += 16;
      if (v8 <= 0xF)
        goto LABEL_11;
    }
  }
  return result;
}

uint64_t ccdrbg_df_bc_init(_QWORD *a1, _QWORD *a2, unint64_t a3)
{
  char v3;
  uint64_t v9;
  char v11;
  __int128 v12;
  __int128 v13;

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
  v12 = xmmword_10002A0A0;
  v13 = unk_10002A0B0;
  v9 = 4294967291;
  if (a3 <= 0x20 && *a2 <= 0x200uLL && a2[1] == 16)
  {
    *a1 = ccdrbg_df_bc_derive_keys;
    a1[1] = a2;
    a1[2] = a3;
    v9 = cccbc_init((uint64_t)a2);
  }
  cc_disable_dit(&v11);
  return v9;
}

void *cc_malloc_clear(size_t a1)
{
  void *v2;
  void *v3;

  v2 = malloc(a1);
  v3 = v2;
  if (v2)
    bzero(v2, a1);
  return v3;
}

uint64_t cc_ws_alloc(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = a1[1];
  v2 = a1[2];
  v4 = *a1 + 8 * v2;
  v5 = v2 + a2;
  a1[2] = v5;
  cc_try_abort_if (v5 > v3);
  return v4;
}

void cc_ws_free(uint64_t a1)
{
  cc_try_abort_if (*(_QWORD *)(a1 + 16) > *(_QWORD *)(a1 + 8));
  cc_clear(8 * *(_QWORD *)(a1 + 8), *(void **)a1);
  free(*(void **)a1);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
}

uint64_t ccctr_context_size(uint64_t *a1)
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

uint64_t ccctr_init(uint64_t a1)
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

uint64_t ccctr_update(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
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

uint64_t ccec_generate_key_internal_fips_ws(uint64_t a1, uint64_t *a2, uint64_t (**a3)(_QWORD, uint64_t, uint64_t *), uint64_t **a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;

  v8 = *a2;
  *a4 = a2;
  v9 = *(_QWORD *)(a1 + 16);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 24))(a1, v8);
  v11 = cczp_bitlen((uint64_t)a2);
  result = (*a3)(a3, ((unint64_t)(v11 + 62) >> 3) & 0x1FFFFFFFFFFFFFF8, (uint64_t *)v10);
  if (!(_DWORD)result)
  {
    result = ccec_generate_scalar_fips_retry_ws(a1, a2, (uint64_t (**)(_QWORD, unint64_t, void *))a3, &a4[3 * **a4 + 2]);
    if (!(_DWORD)result)
      result = ccec_make_pub_from_priv_ws(a1, a2, a3, (unint64_t *)&a4[3 * **a4 + 2], 0, a4);
  }
  *(_QWORD *)(a1 + 16) = v9;
  return result;
}

uint64_t ccec_validate_point_and_projectify_ws(uint64_t a1, uint64_t *a2, uint64_t a3, unint64_t *a4)
{
  uint64_t v8;
  unint64_t *v9;
  uint64_t v10;
  unint64_t *v11;
  unint64_t *v12;
  uint64_t result;

  v8 = *a2;
  v9 = (unint64_t *)cczp_prime((uint64_t)a2);
  if ((int)ccn_cmp(v8, v9, a4) < 1)
    return 0xFFFFFFFFLL;
  v10 = *a2;
  v11 = &a4[*a2];
  v12 = (unint64_t *)cczp_prime((uint64_t)a2);
  if ((int)ccn_cmp(v10, v12, v11) < 1)
    return 0xFFFFFFFFLL;
  result = ccec_projectify_ws(a1, (uint64_t)a2);
  if (!(_DWORD)result)
  {
    if (ccec_is_point_ws(a1, a2, a3))
      return 0;
    else
      return 4294967289;
  }
  return result;
}

uint64_t ccn_cmp_asm(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;

  if (result)
  {
    v3 = result;
    result = 0;
    do
    {
      v5 = *a2++;
      v4 = v5;
      v6 = *a3++;
      v7 = v4 >= v6;
      if (v4 > v6)
        result = 1;
      if (!v7)
        result = -1;
    }
    while (v3-- > 1);
  }
  return result;
}

_BYTE *cc_disable_dit(_BYTE *result)
{
  if ((MEMORY[0xFFFFFC010] & 0x200000000000000) != 0)
  {
    if (*result)
      __asm { MSR             DIT, #0 }
  }
  return result;
}

void sub_10000F924(id a1, int a2)
{
  unsigned int v2;

  v2 = MKBGetDeviceLockState(0, *(_QWORD *)&a2);
  if (v2 <= 7 && ((1 << v2) & 0xB9) != 0)
    dispatch_semaphore_signal((dispatch_semaphore_t)qword_10003A538);
}

id sub_10000F968(void *a1, void *a2, double a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a1;
  v6 = a2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, kOSALogOptionOverridePath);

  }
  if (a3 != 0.0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, kOSALogOptionCaptureTime);

  }
  if (v6)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, kOSALogOptionOverrideFilePrefix);
  objc_msgSend(v7, "setObject:forKeyedSubscript:", CFSTR("ips"), kOSALogOptionOverrideFileExtension);

  return v7;
}

uint64_t sub_10000FA6C(uint64_t a1, const char *a2, _DWORD *a3)
{
  io_registry_entry_t v5;
  const __CFString *v6;
  CFTypeRef CFProperty;
  void *v8;
  CFTypeID v9;
  id v10;
  NSObject *v11;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  const char *v18;
  char path[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;

  if (!a1)
  {
    v14 = _os_assert_log(0);
    _os_crash(v14);
    __break(1u);
    goto LABEL_18;
  }
  if (!a2)
  {
LABEL_18:
    v15 = _os_assert_log(0);
    _os_crash(v15);
    __break(1u);
LABEL_19:
    v16 = _os_assert_log(0);
    _os_crash(v16);
    __break(1u);
  }
  if (!a3)
    goto LABEL_19;
  *a3 = 0;
  *(_OWORD *)path = *(_OWORD *)"IODeviceTree:/";
  v20 = unk_10002A1C0;
  v21 = xmmword_10002A1D0;
  v22 = unk_10002A1E0;
  __strlcat_chk(path, a1, 64, 64);
  v5 = IORegistryEntryFromPath(kIOMainPortDefault, path);
  v6 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
  if (!v6)
  {
    v11 = qword_10003A5C0;
    if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315138;
      v18 = a2;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Error creating CFString %s", (uint8_t *)&v17, 0xCu);
    }
    return 0xFFFFFFFFLL;
  }
  CFProperty = IORegistryEntryCreateCFProperty(v5, v6, kCFAllocatorDefault, 0);
  if (!CFProperty)
  {
    IOObjectRelease(v5);
    return 0xFFFFFFFFLL;
  }
  v8 = (void *)CFProperty;
  v9 = CFGetTypeID(CFProperty);
  if (v9 == CFDataGetTypeID())
    v10 = objc_msgSend(v8, "mutableCopy");
  else
    v10 = 0;
  CFRelease(v8);
  IOObjectRelease(v5);
  if (v10)
  {
    v13 = objc_retainAutorelease(v10);
    *a3 = *(_DWORD *)objc_msgSend(v13, "bytes");

  }
  return 0;
}

BOOL sub_10000FC44(void *a1, void *a2)
{
  id v3;
  id v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFUserNotification *v9;
  _BOOL8 v10;
  SInt32 v11;
  SInt32 v12;
  SInt32 v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v17;
  uint64_t v18;
  SInt32 error;
  uint8_t buf[4];
  SInt32 v21;
  CFOptionFlags responseFlags;
  _QWORD v23[3];
  _QWORD v24[3];

  v3 = a1;
  v4 = a2;
  v5 = CFSTR("OK");
  v6 = CFSTR("Cancel");
  if (!v3)
  {
    v17 = _os_assert_log(0);
    _os_crash(v17);
    __break(1u);
LABEL_16:
    v18 = _os_assert_log(0);
    _os_crash(v18);
    __break(1u);
  }
  if (!v4)
    goto LABEL_16;
  v23[0] = kCFUserNotificationAlertHeaderKey;
  v23[1] = kCFUserNotificationAlertMessageKey;
  v24[0] = v3;
  v24[1] = v4;
  v23[2] = kCFUserNotificationDefaultButtonTitleKey;
  v24[2] = CFSTR("OK");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v7));

  objc_msgSend(v8, "setObject:forKeyedSubscript:", CFSTR("Cancel"), kCFUserNotificationAlternateButtonTitleKey);
  error = 0;
  v9 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 1uLL, &error, (CFDictionaryRef)v8);
  v10 = (_BOOL8)v9;
  v11 = error;
  if (v9 && !error)
  {
    responseFlags = 0;
    v12 = CFUserNotificationReceiveResponse(v9, 0.0, &responseFlags);
    if (!v12)
    {
      CFRelease((CFTypeRef)v10);
      v10 = (responseFlags & 3) == 0;
      goto LABEL_12;
    }
    v13 = v12;
    v14 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to get response for tap to radar notification with error: %d", buf, 8u);
    }
    goto LABEL_10;
  }
  v15 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    LODWORD(responseFlags) = 67109120;
    HIDWORD(responseFlags) = v11;
    _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to display tap to radar notification with error: %d", (uint8_t *)&responseFlags, 8u);
    if (!v10)
      goto LABEL_12;
    goto LABEL_10;
  }
  if (v10)
  {
LABEL_10:
    CFRelease((CFTypeRef)v10);
    v10 = 0;
  }
LABEL_12:

  return v10;
}

void sub_10000FEC8(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, unsigned __int8 a9)
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *j;
  void *v41;
  void *v42;
  id v43;
  NSObject *v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  id v66;
  _BYTE v67[128];
  _BYTE v68[128];

  v16 = a1;
  v17 = a2;
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  if (!v16)
  {
    v46 = _os_assert_log(0);
    _os_crash(v46);
    __break(1u);
    goto LABEL_29;
  }
  if (!v17)
  {
LABEL_29:
    v47 = _os_assert_log(0);
    _os_crash(v47);
    __break(1u);
LABEL_30:
    v48 = _os_assert_log(0);
    _os_crash(v48);
    __break(1u);
  }
  if (!v18)
    goto LABEL_30;
  v24 = v23;
  if (objc_opt_class(TapToRadarService))
  {
    v54 = v16;
    v55 = v24;
    v25 = (void *)objc_opt_new(RadarDraft);
    v51 = v17;
    objc_msgSend(v25, "setTitle:", v17);
    objc_msgSend(v25, "setProblemDescription:", v18);
    v26 = v22;
    v53 = v21;
    v49 = v20;
    v50 = v19;
    v27 = objc_msgSend(objc_alloc((Class)RadarComponent), "initWithName:version:identifier:", v19, v20, objc_msgSend(v21, "integerValue"));
    objc_msgSend(v25, "setComponent:", v27);

    objc_msgSend(v25, "setClassification:", 2);
    objc_msgSend(v25, "setAutoDiagnostics:", 1);
    objc_msgSend(v25, "setIsUserInitiated:", a9);
    v28 = objc_alloc_init((Class)NSMutableArray);
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v52 = v26;
    v29 = v26;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v32)
            objc_enumerationMutation(v29);
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i)));
          objc_msgSend(v28, "addObject:", v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v61, v68, 16);
      }
      while (v31);
    }

    objc_msgSend(v25, "setAttachments:", v28);
    v35 = objc_alloc_init((Class)NSMutableArray);
    v57 = 0u;
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v36 = v55;
    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
    if (v37)
    {
      v38 = v37;
      v39 = *(_QWORD *)v58;
      do
      {
        for (j = 0; j != v38; j = (char *)j + 1)
        {
          if (*(_QWORD *)v58 != v39)
            objc_enumerationMutation(v36);
          v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)j), "intValue")));
          objc_msgSend(v35, "addObject:", v41);

        }
        v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v57, v67, 16);
      }
      while (v38);
    }

    objc_msgSend(v25, "setKeywords:", v35);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](TapToRadarService, "shared"));
    v56 = 0;
    v16 = v54;
    objc_msgSend(v42, "createDraft:forProcessNamed:withDisplayReason:error:", v25, 0, v54, &v56);
    v43 = v56;

    v44 = qword_10003A5D8;
    if (v43)
    {
      v19 = v50;
      v17 = v51;
      v20 = v49;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v66 = v43;
        _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to create draft in Tap-to-Radar: %@", buf, 0xCu);
      }
    }
    else
    {
      v19 = v50;
      v17 = v51;
      v20 = v49;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Received confirmation that a Tap-to-Radar draft has been started", buf, 2u);
      }
    }

    v22 = v52;
    v21 = v53;
    v24 = v55;
  }
  else
  {
    v45 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "TapToRadarService does not exist and thus we cannot start a radar", buf, 2u);
    }
  }

}

uint64_t sub_100010368(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100010378(uint64_t a1)
{

}

void sub_100010380(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;

  v3 = a2;
  v4 = qword_10003A5D8;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v5 = 138412290;
      v6 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to launch DR with error: %@.", (uint8_t *)&v5, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v5) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "DR launched.", (uint8_t *)&v5, 2u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

}

uint64_t sub_100010480()
{
  __CFString *v0;
  CFTypeRef CFProperty;
  NSObject *v3;
  uint8_t v4[16];

  v0 = CFSTR("stress-rack");
  if (qword_10003A548 != -1)
    dispatch_once(&qword_10003A548, &stru_100034B98);
  if (dword_10003A544)
  {
    CFProperty = IORegistryEntryCreateCFProperty(dword_10003A544, CFSTR("stress-rack"), 0, 0);

    if (CFProperty)
    {
      CFRelease(CFProperty);
      return 1;
    }
  }
  else
  {
    v3 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "NVRAM is not supported on this system", v4, 2u);
    }

  }
  return 0;
}

void sub_100010568(id a1)
{
  dword_10003A544 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
}

id sub_100010598()
{
  int v0;
  int v1;
  uint64_t v2;
  void *v3;
  void *v5;
  void *v6;
  int v7;
  int v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  uint32_t v12;
  size_t size;
  uint8_t buf[4];
  int v15;

  size = 0;
  v0 = sysctlbyname("kern.bootargs", 0, &size, 0, 0);
  if (v0)
  {
    v1 = v0;
    v2 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    *(_DWORD *)buf = 67109120;
    v15 = v1;
    v9 = "Failed to query the size of the boot-args. Error: %d";
    goto LABEL_14;
  }
  if (!size)
    goto LABEL_3;
  v5 = malloc_type_malloc(size, 0x8EFEDAF2uLL);
  if (!v5)
  {
    v10 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      goto LABEL_3;
    *(_WORD *)buf = 0;
    v9 = "Failed to allocate memory for the boot-args";
    v11 = v10;
    v12 = 2;
LABEL_15:
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, v9, buf, v12);
    goto LABEL_3;
  }
  v6 = v5;
  v7 = sysctlbyname("kern.bootargs", v5, &size, 0, 0);
  if (!v7)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v6));
    free(v6);
    return v3;
  }
  v8 = v7;
  free(v6);
  v2 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v15 = v8;
    v9 = "Failed to query the boot-args. Error: %d";
LABEL_14:
    v11 = v2;
    v12 = 8;
    goto LABEL_15;
  }
LABEL_3:
  v3 = 0;
  return v3;
}

uint64_t sub_10001074C(void *a1, void *a2, unint64_t *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  char *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v24;
  uint64_t v25;
  char *__endptr;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  char *v31;

  v5 = a1;
  v6 = a2;
  if (!v6)
  {
    v24 = _os_assert_log(0);
    _os_crash(v24);
    __break(1u);
LABEL_25:
    v25 = _os_assert_log(0);
    _os_crash(v25);
    __break(1u);
  }
  v7 = v6;

  if (!a3)
    goto LABEL_25;
  *a3 = 0;
  if (v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(?:^|[ \t\r\n])%@=(0x[a-fA-F0-9]+|-?[0-9]+)(?:[ \t\r\n]|$)"), v7));
    v27 = 0;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", v8, 0, &v27));
    v10 = v27;
    if (v10)
    {
      v11 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v10;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create a regex matching expression: %@", buf, 0xCu);
      }
      v12 = 0;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length")));
      v15 = v14;
      if (v14)
      {
        v16 = objc_msgSend(v14, "rangeAtIndex:", 1);
        __endptr = 0;
        v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "substringWithRange:", v16, v17)));
        v19 = strtoull((const char *)objc_msgSend(v18, "UTF8String"), &__endptr, 0);
        v20 = __endptr;
        if (*__endptr)
        {
          v21 = qword_10003A5D8;
          if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v29 = v7;
            v30 = 2080;
            v31 = v20;
            _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Failed to parse the value of the '%@' boot-arg as an integer. Remainder = '%s'", buf, 0x16u);
          }
          v12 = 0;
        }
        else
        {
          *a3 = v19;
          v12 = 1;
        }

      }
      else
      {
        v22 = qword_10003A5D8;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v29 = v7;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "boot-args NVRAM variable does not have a '%@'=<value> arg", buf, 0xCu);
        }
        v12 = 0;
      }

    }
  }
  else
  {
    v13 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "boot-args NVRAM variable is either not set or inaccessible", buf, 2u);
    }
    v12 = 0;
  }

  return v12;
}

void sub_100010A4C(id a1)
{
  size_t v1;
  int v2;

  v2 = 0;
  v1 = 4;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0))
    dword_10003A550 = v2 != 0;
}

uint64_t sub_100010AA4(uint64_t a1)
{
  uint64_t result;

  if (*(unsigned __int8 *)(a1 + 32) | byte_10003A540)
    result = 0;
  else
    result = _os_feature_enabled_impl("DumpPanic", "EnablePanicPatternMatching");
  byte_10003A568 = result;
  return result;
}

void sub_100010AEC(void *a1, _BYTE *a2, uint64_t a3)
{
  NSObject *v5;
  unint64_t v6;
  int v7;
  _BYTE *v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  _BYTE *v12;

  v5 = a1;
  if (a3 >= 1)
  {
    v6 = (unint64_t)&a2[a3];
    v7 = (int)a2;
    v8 = a2;
    do
    {
      if (*v8 == 10)
      {
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 68157954;
          v10 = v7 - (_DWORD)a2;
          v11 = 2080;
          v12 = a2;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%.*s", buf, 0x12u);
        }
        a2 = v8 + 1;
      }
      else if (!*v8)
      {
        break;
      }
      ++v8;
      ++v7;
    }
    while ((unint64_t)v8 < v6);
  }

}

BOOL sub_100010C04(void *a1)
{
  id v1;
  id v2;
  id v3;
  int v4;
  void *v5;
  NSObject *v7;
  int v8;
  _DWORD v9[2];

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");

  v4 = sysctlbyname("kern.coredump_encryption_key", 0, 0, v2, (size_t)v3);
  if (v4)
  {
    v5 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v7 = v5;
      v8 = *__error();
      v9[0] = 67109120;
      v9[1] = v8;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Failed to notify kernel of new public encryption key. Error: %{errno}d", (uint8_t *)v9, 8u);

    }
  }
  return v4 == 0;
}

void sub_100010D10(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  _BOOL4 v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  id v23;
  int v24;
  void *v25;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByDeletingLastPathComponent"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = objc_msgSend(v4, "fileExistsAtPath:", v2);

    v6 = v2;
    if ((v5 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Retired")));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "lastPathComponent"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", v8));

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = objc_msgSend(v9, "fileExistsAtPath:", v6);

    if ((v10 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingString:", CFSTR(".synced")));

      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v13 = objc_msgSend(v12, "fileExistsAtPath:", v11);

      if ((v13 & 1) != 0)
      {
        v6 = v11;
      }
      else
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Retired")));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingPathComponent:", v15));

      }
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v17 = objc_msgSend(v16, "fileExistsAtPath:", v6);

    v18 = qword_10003A5D8;
    v19 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        v24 = 138412290;
        v25 = v6;
        v20 = "attempting to discard safe log at %@";
        v21 = v18;
        v22 = 12;
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v24, v22);
      }
    }
    else if (v19)
    {
      LOWORD(v24) = 0;
      v20 = "no safe log will be discarded";
      v21 = v18;
      v22 = 2;
      goto LABEL_13;
    }
    v23 = objc_retainAutorelease(v6);
    unlink((const char *)objc_msgSend(v23, "UTF8String"));

  }
}

void sub_100010F74(id a1)
{
  const __CFString *v1;
  const __CFString *v2;
  CFTypeID v3;
  BOOL v4;
  uint64_t v5;

  v1 = (const __CFString *)MGCopyAnswer(CFSTR("+3Uf0Pm5F8Xy7Onyvko0vA"), 0);
  if (!v1)
  {
    v4 = 0;
    goto LABEL_5;
  }
  v2 = v1;
  v3 = CFGetTypeID(v1);
  if (v3 == CFStringGetTypeID())
  {
    v4 = CFStringCompare(v2, CFSTR("AppleDisplay"), 0) == kCFCompareEqualTo;
LABEL_5:
    byte_10003A569 = v4;
    return;
  }
  v5 = _os_assert_log(0);
  _os_crash(v5);
  __break(1u);
}

__CFString *sub_100010FF4(const char *a1, unsigned int a2)
{
  __CFString *v2;
  __CFString *result;
  uint64_t v4;

  if (a1)
  {
    if (a2)
      v2 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a1, strnlen(a1, a2), 4, 0);
    else
      v2 = &stru_100035420;
    return v2;
  }
  else
  {
    v4 = _os_assert_log(0);
    result = (__CFString *)_os_crash(v4);
    __break(1u);
  }
  return result;
}

void sub_100011344(id *a1)
{

}

void sub_10001138C(io_registry_entry_t a1)
{
  kern_return_t v1;
  kern_return_t v2;
  NSObject *v3;
  _DWORD v4[2];

  if (a1)
  {
    v1 = IORegistryEntrySetCFProperty(a1, CFSTR("IOPMUBootErrorClear"), &off_100037870);
    if (v1)
    {
      v2 = v1;
      v3 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        v4[0] = 67109120;
        v4[1] = v2;
        _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "failed to clear PMU boot-properties with error: %d", (uint8_t *)v4, 8u);
      }
      if (qword_10003A558 != -1)
        dispatch_once(&qword_10003A558, &stru_100034BB8);
      if (!dword_10003A550)
      {
        if (os_variant_has_internal_diagnostics("com.apple.dumppanic"))
        {
          _os_crash("failed to clear PMU boot properties");
          __break(1u);
        }
      }
    }
  }
}

id sub_10001149C(_QWORD *a1, id *a2)
{
  id result;

  *a1 = *a2;
  a1[1] = a2[1];
  a1[2] = a2[2];
  a1[3] = a2[3];
  a1[4] = a2[4];
  result = a2[5];
  a1[5] = result;
  return result;
}

id sub_100011504(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[2];

  v1 = *(_QWORD *)(a1 + 56);
  v4[0] = CFSTR("bootStage");
  v4[1] = CFSTR("type");
  v2 = *(_QWORD *)(a1 + 32);
  v5[0] = v1;
  v5[1] = v2;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 2));
}

id sub_100011584(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  void *v36;

  v1 = *(void **)(a1 + 80);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v4 = *(void **)(a1 + 56);
  v5 = *(id *)(a1 + 32);
  v6 = v1;
  v7 = v2;
  v8 = v3;
  v9 = v4;
  v10 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("bootStage"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, CFSTR("panicCount"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("otherResetCount"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("bootStage"));

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v5, CFSTR("resetType"));
  objc_msgSend(v10, "setObject:forKeyedSubscript:", off_100039B48, CFSTR("bootAppHash"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("backpow")))
    v11 = &__kCFBooleanTrue;
  else
    v11 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("backpow"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("btn_rst")))
    v12 = &__kCFBooleanTrue;
  else
    v12 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("btn_rst"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("btn_shdn")))
    v13 = &__kCFBooleanTrue;
  else
    v13 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("btn_shdn"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("chg_pok_fall")))
    v14 = &__kCFBooleanTrue;
  else
    v14 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("chg_pok_fall"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("cpu_therm")))
    v15 = &__kCFBooleanTrue;
  else
    v15 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("cpu_therm"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("crash")))
    v16 = &__kCFBooleanTrue;
  else
    v16 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("crash"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("dbg_rst")))
    v17 = &__kCFBooleanTrue;
  else
    v17 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v17, CFSTR("dbg_rst"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("force_off")))
    v18 = &__kCFBooleanTrue;
  else
    v18 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("force_off"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("gpu_therm")))
    v19 = &__kCFBooleanTrue;
  else
    v19 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v19, CFSTR("gpu_therm"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("ntc_shdn")))
    v20 = &__kCFBooleanTrue;
  else
    v20 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, CFSTR("ntc_shdn"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("oc")))
    v21 = &__kCFBooleanTrue;
  else
    v21 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("oc"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("ot")))
    v22 = &__kCFBooleanTrue;
  else
    v22 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, CFSTR("ot"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("ov")))
    v23 = &__kCFBooleanTrue;
  else
    v23 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v23, CFSTR("ov"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("por")))
    v24 = &__kCFBooleanTrue;
  else
    v24 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v24, CFSTR("por"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("remote_pmic")))
    v25 = &__kCFBooleanTrue;
  else
    v25 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v25, CFSTR("remote_pmic"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("rst")))
    v26 = &__kCFBooleanTrue;
  else
    v26 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v26, CFSTR("rst"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("sgpio")))
    v27 = &__kCFBooleanTrue;
  else
    v27 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v27, CFSTR("sgpio"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("sochot")))
    v28 = &__kCFBooleanTrue;
  else
    v28 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v28, CFSTR("sochot"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("spmi")))
    v29 = &__kCFBooleanTrue;
  else
    v29 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v29, CFSTR("spmi"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("sstate")))
    v30 = &__kCFBooleanTrue;
  else
    v30 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v30, CFSTR("sstate"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("timeout")))
    v31 = &__kCFBooleanTrue;
  else
    v31 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v31, CFSTR("timeout"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("upc_reset")))
    v32 = &__kCFBooleanTrue;
  else
    v32 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v32, CFSTR("upc_reset"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("uv")))
    v33 = &__kCFBooleanTrue;
  else
    v33 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v33, CFSTR("uv"));
  if (objc_msgSend(v6, "containsObject:", CFSTR("vdd_hi_and_chg_pok")))
    v34 = &__kCFBooleanTrue;
  else
    v34 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v34, CFSTR("vdd_hi_and_chg_pok"));
  v35 = objc_msgSend(v6, "containsObject:", CFSTR("wdog"));

  if (v35)
    v36 = &__kCFBooleanTrue;
  else
    v36 = &__kCFBooleanFalse;
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v36, CFSTR("wdog"));
  return v10;
}

void sub_100011A88(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[OSASystemConfiguration sharedInstance](OSASystemConfiguration, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crashReporterKey"));
  v7 = OSADateFormat(1, *(double *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 72), "componentsJoinedByString:", CFSTR(" ")));
  v12 = objc_msgSend(*(id *)(a1 + 64), "unsignedIntValue");
  v14 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Incident Identifier: %@\nCrashReporter Key:   %@\nDate: %@\nReset count: %@\nBoot failure count: %@\nBoot faults: %@\nBoot stage: 0x%x\nBoot app: %@\nsocId: %x\nsocRevision: %x"), v3, v6, v8, v9, v10, v11, v12, off_100039B48, *(unsigned int *)(a1 + 96), *(unsigned int *)(a1 + 100)));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataUsingEncoding:allowLossyConversion:", 4, 1));
  objc_msgSend(v4, "writeData:", v13);

}

id sub_100011BB4(uint64_t a1, uint64_t a2)
{
  return sub_10001149C((_QWORD *)(a1 + 48), (id *)(a2 + 48));
}

void sub_100011BC0(uint64_t a1)
{
  sub_100011344((id *)(a1 + 48));
}

id sub_100011BC8(uint64_t a1, uint64_t a2)
{
  return sub_10001149C((_QWORD *)(a1 + 40), (id *)(a2 + 40));
}

void sub_100011BD4(uint64_t a1)
{
  sub_100011344((id *)(a1 + 40));
}

uint64_t sub_100011BDC()
{
  if (qword_10003A588 != -1)
    dispatch_once(&qword_10003A588, &stru_100034CF0);
  return qword_10003A578;
}

void sub_100011C20(id a1)
{
  id v1;
  void *v2;
  void *v3;
  unsigned __int8 v4;
  id v5;
  NSObject *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  int v12;
  char v13;
  BOOL v14;
  id v15;
  id v16;
  unint64_t v17;
  _BYTE buf[12];
  __int16 v19;
  id v20;

  LOWORD(qword_10003A578) = 0;
  BYTE2(qword_10003A578) = 0;
  qword_10003A580 = 0;
  if (os_variant_has_internal_diagnostics("com.apple.DumpPanic"))
  {
    v17 = 0;
    v1 = sub_100010598();
    v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
    sub_10001074C(v2, CFSTR("dumppanic"), &v17);

    LOBYTE(qword_10003A578) = v17 & 1;
    if ((v17 & 1) != 0)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      if (objc_msgSend(v3, "fileExistsAtPath:", CFSTR("/var/tmp/dumppanic")))
      {
        v16 = 0;
        v4 = objc_msgSend(v3, "removeItemAtPath:error:", CFSTR("/var/tmp/dumppanic"), &v16);
        v5 = v16;
        if ((v4 & 1) == 0)
        {
          v6 = qword_10003A5D8;
          if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = CFSTR("/var/tmp/dumppanic");
            v19 = 2112;
            v20 = v5;
            _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "Failed to remove directory: %@ -> %@", buf, 0x16u);
          }
        }
      }
      else
      {
        v5 = 0;
      }
      v15 = v5;
      v7 = objc_msgSend(v3, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", CFSTR("/var/tmp/dumppanic"), 1, 0, &v15);
      v8 = v15;

      if ((v7 & 1) == 0)
      {
        v9 = qword_10003A5D8;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = CFSTR("/var/tmp/dumppanic");
          v19 = 2112;
          v20 = v8;
          _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to create directory: %@ -> %@", buf, 0x16u);
        }
      }

    }
    *(_QWORD *)buf = 0;
    v10 = sub_100010598();
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = sub_10001074C(v11, CFSTR("BATS_TESTPLAN_ID"), (unint64_t *)buf);

    if (v12)
      qword_10003A580 = *(_QWORD *)buf;
    if (sub_100010480())
    {
      v13 = 1;
    }
    else
    {
      if (v12)
        v14 = *(_QWORD *)buf == 0;
      else
        v14 = 1;
      v13 = !v14;
    }
    BYTE1(qword_10003A578) = v13;
    BYTE2(qword_10003A578) = (v17 & 2) != 0;
  }
}

BOOL sub_100011EA8(void *a1, const void *a2, size_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  FILE *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  size_t v16;

  v5 = a1;
  if (!v5)
  {
    v12 = _os_assert_log(0);
    _os_crash(v12);
    __break(1u);
    goto LABEL_14;
  }
  v6 = v5;

  if (!a2)
  {
LABEL_14:
    v13 = _os_assert_log(0);
    _os_crash(v13);
    __break(1u);
LABEL_15:
    v14 = _os_assert_log(0);
    _os_crash(v14);
    __break(1u);
  }
  if (!a3)
    goto LABEL_15;
  if (a3 > 0x240000)
  {
    v7 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 134217984;
      v16 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Paniclog data size (%llu bytes) size greater than max buffer size. Truncating.", (uint8_t *)&v15, 0xCu);
    }
    a3 = 2359296;
  }
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "path")));
  v9 = fopen((const char *)objc_msgSend(v8, "UTF8String"), "w");

  if (v9)
  {
    fwrite(a2, a3, 1uLL, v9);
    fclose(v9);
  }
  else
  {
    v10 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = (size_t)v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Unable to open file: %@", (uint8_t *)&v15, 0xCu);
    }
  }

  return v9 != 0;
}

uint64_t sub_100012058(uint64_t a1)
{
  int v1;
  NSObject *v3;
  id v4;
  uint8_t buf[4];
  int v6;

  v1 = a1;
  if ((a1 - 101) <= 0xFFFFFF9B)
  {
    v4 = objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Implausible embedded panic header version: %d"), a1))), "UTF8String");
    _os_crash(v4);
    __break(1u);
  }
  if ((a1 - 1) < 6)
    return *(unsigned int *)&asc_10002A1F0[4 * (a1 - 1)];
  v3 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v6 = v1;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Unknown embedded panic header version: %d", buf, 8u);
  }
  return 177;
}

__CFString *sub_100012150(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v4;
  __CFString *v5;
  void *v6;
  __CFString *v7;

  v2 = a2 & 0xFFFFFFFFFFFFFFFELL;
  if ((a2 & 0xFFFFFFFFFFFFFFFELL) != 0)
  {
    v4 = 0;
    v5 = &stru_100035420;
    do
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%02hhx%02hhx"), *(unsigned __int8 *)(a1 + v4), *(unsigned __int8 *)(a1 + v4 + 1)));
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v5, "stringByAppendingString:", v6));

      v4 += 2;
      v5 = v7;
    }
    while (v2 > v4);
  }
  else
  {
    v7 = &stru_100035420;
  }
  return v7;
}

void sub_10001220C(_DWORD *a1, uint64_t a2, unint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  NSObject *v12;
  unsigned int v13;
  int v14;
  unsigned int v15;
  unint64_t v16;
  NSObject *v17;
  uint64_t v19;
  int v20;
  unsigned int v21;
  __int16 v22;
  int v23;

  if (a1[2] <= 4u)
  {
    *a4 = 0;
    v5 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      return;
    LOWORD(v20) = 0;
    v6 = "Extensible Paniclog not supported. Skipping.";
    v7 = v5;
    v8 = 2;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v20, v8);
    return;
  }
  v12 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(_DWORD *)((char *)a1 + 161);
    v14 = *(_DWORD *)((char *)a1 + 165);
    v20 = 67109376;
    v21 = v13;
    v22 = 1024;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Extensible Paniclog offset %u Length %u", (uint8_t *)&v20, 0xEu);
  }
  v15 = *(_DWORD *)((char *)a1 + 165);
  if ((v15 - 1) >> 15)
  {
    v19 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      return;
    v20 = 67109120;
    v21 = v15;
    v6 = "Did not find a valid ext paniclog. Found with length: %d";
    v7 = v19;
    v8 = 8;
    goto LABEL_15;
  }
  v16 = *(unsigned int *)((char *)a1 + 161);
  v17 = qword_10003A5D8;
  if (v16 < a3 && v16 >= a1[6] + a1[5])
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 67109120;
      v21 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "found ext paniclog with %u bytes", (uint8_t *)&v20, 8u);
      v16 = *(unsigned int *)((char *)a1 + 161);
      v15 = *(_DWORD *)((char *)a1 + 165);
    }
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", a2 + v16, v15, 0));
  }
  else if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    v20 = 67109376;
    v21 = v15;
    v22 = 1024;
    v23 = v16;
    _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "invalid extensible paniclog eph_ext_paniclog_len %u eph_ext_paniclog_offset %u,", (uint8_t *)&v20, 0xEu);
  }
}

void sub_100012468(_DWORD *a1, uint64_t a2, unint64_t a3, _QWORD *a4)
{
  unsigned int v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  unint64_t v17;
  NSObject *v18;
  uint64_t v20;
  __CFString *v21;
  int v22;
  unsigned int v23;
  __int16 v24;
  int v25;

  v8 = a1[2];
  v9 = qword_10003A5D8;
  v10 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
  if (v8 <= 5)
  {
    if (!v10)
      return;
    LOWORD(v22) = 0;
    v11 = "Panic Initiator not supported. Skipping.";
    v12 = v9;
    v13 = 2;
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v22, v13);
    return;
  }
  if (v10)
  {
    v14 = *(_DWORD *)((char *)a1 + 169);
    v15 = *(_DWORD *)((char *)a1 + 173);
    v22 = 67109376;
    v23 = v14;
    v24 = 1024;
    v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Panic Initiator offset %u Length %u", (uint8_t *)&v22, 0xEu);
  }
  v16 = *(_DWORD *)((char *)a1 + 173);
  if (v16 - 1 > 0xFF)
  {
    v20 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      return;
    v22 = 67109120;
    v23 = v16;
    v11 = "Did not find a valid panic initiator. Found with length: %d";
    v12 = v20;
    v13 = 8;
    goto LABEL_15;
  }
  v17 = *(unsigned int *)((char *)a1 + 169);
  v18 = qword_10003A5D8;
  if (v17 < a3 && v17 >= a1[6] + a1[5])
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 67109120;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "found panic initiator with %u bytes", (uint8_t *)&v22, 8u);
      v17 = *(unsigned int *)((char *)a1 + 169);
      v16 = *(_DWORD *)((char *)a1 + 173);
    }
    v21 = sub_100010FF4((const char *)(a2 + v17), v16);
    *a4 = (id)objc_claimAutoreleasedReturnValue(v21);
  }
  else if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    v22 = 67109376;
    v23 = v16;
    v24 = 1024;
    v25 = v17;
    _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "invalid panic initiator eph_panic_initiator_len %u eph_panic_initiator_offset %u,", (uint8_t *)&v22, 0xEu);
  }
}

void sub_1000126A0(unsigned int *a1, unint64_t a2, void *a3, void *a4, void *a5, PanicReport *a6, uint64_t *a7, void *a8, double a9, void *a10)
{
  id v14;
  id *v15;
  id v16;
  __CFString *v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  Bytef **v22;
  unint64_t v23;
  unsigned int *v24;
  id v25;
  Bytef *v26;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  char v30;
  char v31;
  Bytef *v32;
  __CFString *v33;
  NSObject *v34;
  NSObject *v35;
  Bytef *v36;
  Bytef *v37;
  NSObject *v38;
  int v39;
  Bytef *v40;
  void *v41;
  int v42;
  unsigned int *v43;
  void *v44;
  NSObject *v45;
  Bytef *v46;
  void *v47;
  __CFString *v48;
  Bytef *v49;
  uint64_t v50;
  Bytef *v51;
  id v52;
  Bytef *v53;
  Bytef *v54;
  id v55;
  NSObject *v56;
  uint64_t v57;
  id v58;
  void *v59;
  __CFString *v60;
  id *v61;
  id v62;
  __CFString *v63;
  const __CFString *v64;
  NSObject *v65;
  __CFString *v66;
  uInt v67;
  unsigned int v68;
  Bytef *v69;
  const char *v70;
  unsigned int v71;
  NSObject *v72;
  __CFString *v73;
  internal_state *v74;
  __CFString *v75;
  voidpf (__cdecl *v76)(voidpf, uInt, uInt);
  __CFString *v77;
  void *v78;
  uint64_t v79;
  id *v80;
  __CFString *v81;
  __CFString *v82;
  id v83;
  unsigned int *v84;
  unsigned int v85;
  uint64_t v86;
  NSObject *v87;
  unsigned int v88;
  uint64_t v89;
  unsigned int v90;
  int v91;
  Bytef **v92;
  int v93;
  NSObject *v94;
  Bytef *v95;
  NSObject *v96;
  Bytef *v97;
  NSObject *v98;
  Bytef *v99;
  NSObject *v100;
  int v101;
  Bytef *v102;
  NSObject *v103;
  void *v104;
  void *v105;
  unint64_t v106;
  void *v107;
  void *v108;
  void *v109;
  unsigned int *v110;
  int v111;
  uint64_t v112;
  void *v113;
  NSObject *v114;
  NSObject *v115;
  uInt v116;
  Bytef *v117;
  void *v118;
  __CFString *v119;
  id v120;
  __CFString *v121;
  PanicReport *v122;
  void *v123;
  PanicReport *v124;
  id v125;
  uint64_t v126;
  unsigned int *v127;
  NSObject *v128;
  void *v129;
  id v130;
  id v131;
  id v132;
  uint64_t v133;
  void *i;
  void *v135;
  id v136;
  __CFString *v137;
  void *v138;
  int v139;
  void *v140;
  unsigned int *v141;
  unsigned int *v142;
  int v143;
  id v144;
  void *v145;
  const __CFString *v146;
  _UNKNOWN **v147;
  unsigned int v148;
  NSObject *v149;
  NSObject *v150;
  Bytef **v151;
  __CFString *v152;
  id v153;
  int v154;
  NSObject *v155;
  void *v156;
  PanicReport *v157;
  int v158;
  void *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  void *v163;
  uint64_t v164;
  unsigned int v165;
  NSObject *v166;
  NSObject *v167;
  __CFString *v168;
  __CFString *v169;
  void *v170;
  uint64_t v171;
  char v172;
  id v173;
  NSObject *v174;
  unsigned int v175;
  unsigned int v176;
  uint64_t v177;
  void *v178;
  void *v179;
  id v180;
  void *v181;
  void *v182;
  PanicReport *v183;
  void *v184;
  void *v185;
  uint64_t v186;
  void *v187;
  NSObject *v188;
  unsigned int v189;
  NSObject *v190;
  const char *v191;
  id v192;
  _DWORD *v193;
  id v194;
  int v195;
  NSObject *v196;
  id v197;
  Bytef *v198;
  NSObject *v199;
  Bytef *v200;
  uInt *v201;
  id v202;
  uInt v203;
  unsigned int v204;
  uint64_t v205;
  unint64_t v206;
  unint64_t v207;
  int v208;
  unint64_t v209;
  unint64_t v210;
  NSObject *v211;
  uint64_t v212;
  int v213;
  unsigned int v214;
  Bytef *v215;
  Bytef *v216;
  int v217;
  int v218;
  NSObject *v219;
  unsigned int v220;
  uInt v221;
  NSObject *v222;
  uInt v223;
  void *v224;
  void *v225;
  uint64_t v226;
  NSObject *v227;
  void *v228;
  uint64_t v229;
  uint64_t v230;
  NSObject *v231;
  void *v232;
  NSObject *v233;
  unsigned int *v234;
  Bytef *v235;
  NSObject *v236;
  Bytef *v237;
  void *v238;
  unsigned int v239;
  uint64_t v240;
  __CFString *v241;
  void *v242;
  void *v243;
  unint64_t v244;
  unsigned int v245;
  NSObject *v246;
  NSObject *v247;
  unsigned int *v248;
  void *v249;
  uint64_t v250;
  id v251;
  char *v252;
  uint64_t v253;
  NSObject *v254;
  const char *v255;
  NSObject *v256;
  uint32_t v257;
  NSObject *v258;
  unsigned int v259;
  NSObject *v260;
  NSObject *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  NSObject *v265;
  unint64_t v266;
  size_t v267;
  NSObject *v268;
  int v269;
  uint64_t v270;
  int v271;
  void *v272;
  __CFString *v273;
  Bytef *v274;
  id *v275;
  unsigned int v276;
  __CFString *v277;
  int v278;
  unsigned int v279;
  Bytef *v280;
  id *v281;
  void *v282;
  __CFString *v283;
  __CFString *v284;
  Bytef **v286;
  Bytef **v287;
  id v288;
  unsigned int *v290;
  uInt *v291;
  void *v292;
  unint64_t v293;
  id v294;
  Bytef *v295;
  Bytef *v296;
  void *v298;
  Bytef *v300;
  NSMutableArray *v301;
  unsigned int *v302;
  Bytef *v303;
  int v304;
  id v305;
  id v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  id v311;
  id v312;
  id v313;
  uint8_t v314[128];
  uint8_t v315[8];
  z_stream buf;

  v14 = a3;
  v15 = a5;
  v16 = a8;
  v17 = a10;
  v18 = objc_opt_new(NSMutableArray);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Source: %@"), 0));
  -[NSMutableArray addObject:](v18, "addObject:", v19);

  if (v15)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("OTA UUID: %.*s\n"), objc_msgSend(v15, "length"), objc_msgSend(objc_retainAutorelease(v15), "bytes")));
    -[NSMutableArray addObject:](v18, "addObject:", v20);

  }
  v298 = v16;
  v283 = v17;
  v301 = v18;
  v302 = a1;
  if (a1 && a2 >= 0xB1 && *a1 == 1179995723)
  {
    v21 = (unint64_t)v14;
    v286 = 0;
    v287 = 0;
    v22 = 0;
    v23 = a2;
    v24 = a1;
    goto LABEL_15;
  }
  v21 = (unint64_t)v14;
  v22 = 0;
  v286 = 0;
  v23 = 0;
  v24 = 0;
  if (!a1)
  {
    v287 = 0;
    goto LABEL_15;
  }
  v287 = 0;
  if (a2 >= 8)
  {
    if (*a1 != 1346717008)
    {
      v26 = (Bytef *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("iBoot panic header magic invalid: found 0x%x, expected 0x%x"), *a1, 1346717008));
      v65 = qword_10003A5D8;
      v25 = (id)v21;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.next_in) = 138412290;
        *(Bytef **)((char *)&buf.next_in + 4) = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
      }
      -[NSMutableArray addObject:](v18, "addObject:", v26);
      if (byte_10003A598)
        v66 = CFSTR("iBoot header contained bad magic (possible legacy panic data)");
      else
        v66 = CFSTR("iBoot header contained bad magic");
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v21, "path"));
      sub_100014F50(v66, v18, (uint64_t)a4, v29, a6, a7, a9);
      v28 = v298;
      goto LABEL_189;
    }
    v25 = (id)v21;
    if (a1[1] - 6 <= 0xFFFFFFFA)
    {
      v26 = (Bytef *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("iBoot panic header indicates invalid number of logs available (%d)"), a1[1]));
      v27 = qword_10003A5D8;
      v28 = v298;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf.next_in) = 138412290;
        *(Bytef **)((char *)&buf.next_in + 4) = v26;
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
      }
      -[NSMutableArray addObject:](v18, "addObject:", v26);
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path"));
      sub_100014F50(CFSTR("iBoot header contains invalid number of logs"), v18, (uint64_t)a4, v29, a6, a7, a9);
      goto LABEL_189;
    }
    v87 = (id)qword_10003A5D8;
    v28 = v298;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      v88 = a1[1];
      LODWORD(buf.next_in) = 67109120;
      HIDWORD(buf.next_in) = v88;
      _os_log_impl((void *)&_mh_execute_header, v87, OS_LOG_TYPE_DEFAULT, "iBoot panic header indicates %d panic logs available", (uint8_t *)&buf, 8u);
    }

    v89 = a1[1];
    if (!(_DWORD)v89)
      goto LABEL_199;
    v293 = (unint64_t)v25;
    v90 = 0;
    v91 = 0;
    v22 = 0;
    v286 = 0;
    v287 = 0;
    v92 = (Bytef **)(a1 + 6);
    while (1)
    {
      v93 = *((_DWORD *)v92 - 4);
      switch(v93)
      {
        case 4:
          v96 = (id)qword_10003A5D8;
          if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
          {
            v97 = *v92;
            LODWORD(buf.next_in) = 134217984;
            *(Bytef **)((char *)&buf.next_in + 4) = v97;
            _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_DEFAULT, "Found SOCD container with length 0x%llx", (uint8_t *)&buf, 0xCu);
          }

          ++v91;
          v286 = v92 - 2;
          break;
        case 2:
          v98 = (id)qword_10003A5D8;
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
          {
            v99 = *v92;
            LODWORD(buf.next_in) = 134217984;
            *(Bytef **)((char *)&buf.next_in + 4) = v99;
            _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "Found storage dump log of length 0x%llx", (uint8_t *)&buf, 0xCu);
          }

          ++v91;
          v287 = v92 - 2;
          break;
        case 0:
          v94 = (id)qword_10003A5D8;
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            v95 = *v92;
            LODWORD(buf.next_in) = 134217984;
            *(Bytef **)((char *)&buf.next_in + 4) = v95;
            _os_log_impl((void *)&_mh_execute_header, v94, OS_LOG_TYPE_DEFAULT, "Found embedded panic log of length 0x%llx", (uint8_t *)&buf, 0xCu);
          }

          ++v91;
          v22 = v92 - 2;
          goto LABEL_85;
        default:
          v100 = (id)qword_10003A5D8;
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            v101 = *((_DWORD *)v92 - 4);
            v102 = *v92;
            LODWORD(buf.next_in) = 67109376;
            HIDWORD(buf.next_in) = v101;
            LOWORD(buf.avail_in) = 2048;
            *(_QWORD *)((char *)&buf.avail_in + 2) = v102;
            _os_log_error_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "Found panic log of unknown type (%d) length 0x%llx", (uint8_t *)&buf, 0x12u);
          }

          break;
      }
      a1 = v302;
LABEL_85:
      v89 = a1[1];
      ++v90;
      v92 += 3;
      if (v90 >= v89)
      {
        v28 = v298;
        if (v91)
        {
          v23 = 0;
          v24 = 0;
          v21 = v293;
          v17 = v283;
          break;
        }
        v17 = v283;
        v18 = v301;
LABEL_199:
        v26 = (Bytef *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to find usable panic log after traversing %d iBoot metadata logs"), v89));
        v199 = qword_10003A5D8;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.next_in) = 138412290;
          *(Bytef **)((char *)&buf.next_in + 4) = v26;
          _os_log_error_impl((void *)&_mh_execute_header, v199, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);
        }
        -[NSMutableArray addObject:](v18, "addObject:", v26);
        v29 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path"));
        sub_100014F50(CFSTR("No usable panic logs available from iBoot headers"), v18, (uint64_t)a4, v29, a6, a7, a9);
LABEL_189:

        return;
      }
    }
  }
LABEL_15:
  v295 = (Bytef *)v23;
  v30 = sub_100011BDC();
  v31 = v30;
  if (v17 && (v30 & 1) != 0)
  {
    v32 = (Bytef *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", &off_100037B88));
    v33 = objc_retainAutorelease(v17);
    if (!sub_100011EA8(v32, -[__CFString bytes](v33, "bytes"), (size_t)-[__CFString length](v33, "length")))
    {
      v34 = (id)qword_10003A5D8;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.next_in) = 138412290;
        *(Bytef **)((char *)&buf.next_in + 4) = v32;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "failed to write fallback data to file: %@", (uint8_t *)&buf, 0xCu);
      }

    }
    a1 = v302;
  }
  v294 = objc_alloc_init((Class)NSMutableDictionary);
  if (v22)
  {
    v35 = (id)qword_10003A5D8;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v22[2];
      LODWORD(buf.next_in) = 134217984;
      *(Bytef **)((char *)&buf.next_in + 4) = v36;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Found embedded panic log of length 0x%llx", (uint8_t *)&buf, 0xCu);
    }

    if ((v31 & 1) != 0)
    {
      v37 = (Bytef *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", &off_100037BA0));
      if (!sub_100011EA8(v37, &v22[1][(_QWORD)a1], (size_t)v22[2]))
      {
        v38 = (id)qword_10003A5D8;
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.next_in) = 138412290;
          *(Bytef **)((char *)&buf.next_in + 4) = v37;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "failed to write embedded panic data to file: %@", (uint8_t *)&buf, 0xCu);
        }

      }
    }
    v39 = *((_DWORD *)v22 + 1);
    if ((v39 & 2) != 0)
    {
      v17 = CFSTR("BAD MAGIC! (flag set in iBoot panic header), no panic log available");
      v40 = (Bytef *)v301;
    }
    else
    {
      v40 = (Bytef *)v301;
      if ((v39 & 4) != 0)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("iBoot indicates CRC mismatch")));
        -[NSMutableArray addObject:](v301, "addObject:", v41);

      }
      v313 = 0;
      v42 = sub_1000150F0((unsigned int *)v22, a2, &v313);
      v17 = (__CFString *)v313;
      if (!v42)
      {
        v295 = v22[2];
        v43 = (unsigned int *)&v22[1][(_QWORD)v302];
LABEL_42:
        v25 = (id)v21;
        *(_QWORD *)a6->OSAStackShotReport_opaque = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v17, 0));
        v50 = 1;
        v284 = CFSTR("panic");
LABEL_43:
        v49 = v295;
        goto LABEL_44;
      }
    }
    v43 = v24;
    goto LABEL_42;
  }
  if (!v17)
  {
    v50 = 0;
    v284 = CFSTR("panic");
    v40 = (Bytef *)v301;
    v43 = v24;
    v25 = (id)v21;
    goto LABEL_43;
  }
  v44 = (void *)qword_10003A5D8;
  v40 = (Bytef *)v301;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    v45 = v44;
    v46 = (Bytef *)-[__CFString length](v17, "length");
    LODWORD(buf.next_in) = 134217984;
    *(Bytef **)((char *)&buf.next_in + 4) = v46;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Falling back to corefile embedded panic log of length 0x%lx", (uint8_t *)&buf, 0xCu);

  }
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("DRAM panic log missing; corefile fallback log in use")));
  -[NSMutableArray addObject:](v301, "addObject:", v47);

  v48 = objc_retainAutorelease(v17);
  v43 = (unsigned int *)-[__CFString bytes](v48, "bytes");
  v49 = (Bytef *)-[__CFString length](v48, "length");
  v17 = 0;
  v50 = 1;
  v284 = CFSTR("interrupted coredump panic");
  v25 = (id)v21;
LABEL_44:
  v290 = v43;
  v292 = v25;
  v296 = v49;
  v281 = v15;
  v271 = v50;
  if (!v43 || !v49)
  {

    v278 = 0;
    v61 = 0;
    v57 = 0;
    v25 = 0;
    v40 = 0;
    v62 = 0;
    v15 = 0;
    v63 = 0;
    v64 = CFSTR("embedded panic data not available");
    goto LABEL_105;
  }
  v311 = 0;
  v51 = v40;
  v52 = v294;
  v53 = v51;
  if (!v53)
  {
    v262 = _os_assert_log(0);
    v55 = (id)_os_crash(v262);
    __break(1u);
    goto LABEL_294;
  }
  v54 = v53;

  v55 = v52;
  if (!v55)
  {
LABEL_294:
    v263 = _os_assert_log(v55);
    v121 = (__CFString *)_os_crash(v263);
    __break(1u);
    goto LABEL_295;
  }
  v282 = v55;

  v312 = 0;
  v56 = qword_10003A5D8;
  v277 = v17;
  if ((unint64_t)v296 <= 0xB0)
  {
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "rejecting implausible buffer!", (uint8_t *)&buf, 2u);
    }
    v278 = 0;
    v275 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    v50 = 0;
    v60 = 0;
LABEL_91:
    v105 = v282;
    goto LABEL_103;
  }
  v274 = v54;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    v67 = *v43;
    v68 = v43[2];
    v69 = *(Bytef **)(v43 + 3);
    LODWORD(v273) = v43[5];
    v276 = v43[6];
    v70 = (const char *)(v43 + 13);
    v71 = v43[9];
    v279 = v290[10];
    v72 = v56;
    v73 = sub_100010FF4(v70, 0x20u);
    v74 = (internal_state *)objc_claimAutoreleasedReturnValue(v73);
    v75 = sub_100010FF4((const char *)v290 + 84, 0x20u);
    v76 = (voidpf (__cdecl *)(voidpf, uInt, uInt))objc_claimAutoreleasedReturnValue(v75);
    v77 = sub_100010FF4((const char *)v290 + 116, 0x25u);
    v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
    v79 = *(_QWORD *)((char *)v290 + 153);
    LODWORD(buf.next_in) = 134220802;
    *(Bytef **)((char *)&buf.next_in + 4) = v296;
    *((_WORD *)&buf.avail_in + 2) = 1024;
    *(uInt *)((char *)&buf.avail_in + 6) = v67;
    WORD1(buf.total_in) = 1024;
    HIDWORD(buf.total_in) = v68;
    LOWORD(buf.next_out) = 2048;
    *(Bytef **)((char *)&buf.next_out + 2) = v69;
    HIWORD(buf.avail_out) = 1024;
    *(&buf.avail_out + 1) = v273;
    LOWORD(buf.total_out) = 1024;
    *(_DWORD *)((char *)&buf.total_out + 2) = v276;
    HIWORD(buf.total_out) = 1024;
    LODWORD(buf.msg) = v71;
    v43 = v290;
    WORD2(buf.msg) = 1024;
    *(_DWORD *)((char *)&buf.msg + 6) = v279;
    WORD1(buf.state) = 2112;
    *(internal_state **)((char *)&buf.state + 4) = v74;
    WORD2(buf.zalloc) = 2112;
    *(alloc_func *)((char *)&buf.zalloc + 6) = v76;
    HIWORD(buf.zfree) = 2112;
    buf.opaque = v78;
    LOWORD(buf.data_type) = 2048;
    *(_QWORD *)((char *)&buf.data_type + 2) = v79;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "(embedded) length: %zu eph: magic %08X vers %u flags 0x%016llX panic_log offset %u, len %u, other_log offset %u, len %u, osversion: %@, macosversion: %@, bootsessionuuid: %@, roots_installed: %lld", (uint8_t *)&buf, 0x62u);

  }
  v21 = *v43;
  if ((_DWORD)v21 != 1179995723)
  {
    v103 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.next_in) = 67109120;
      HIDWORD(buf.next_in) = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_ERROR, "invalid eph_magic 0x%08X", (uint8_t *)&buf, 8u);
      v21 = *v43;
    }
    v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Embedded panic header contains invalid magic, expected 0x%x found 0x%x"), 1179995723, v21));
    -[Bytef addObject:](v54, "addObject:", v104);

    v278 = 0;
    v275 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    v50 = 0;
    v60 = CFSTR("Embedded panic log header contained bad magic");
    goto LABEL_91;
  }
  v80 = *(id **)(v43 + 3);
  v81 = sub_100010FF4((const char *)v43 + 116, 0x25u);
  v273 = (__CFString *)(id)objc_claimAutoreleasedReturnValue(v81);
  v82 = sub_100010FF4((const char *)v43 + 52, 0x20u);
  v83 = (id)objc_claimAutoreleasedReturnValue(v82);
  v57 = *(_QWORD *)((char *)v43 + 153);
  v275 = v80;
  if (!v43[6])
  {
    v86 = 0;
    goto LABEL_99;
  }
  v84 = v43;
  v85 = v43[5];
  if (v85 < sub_100012058(v84[2]))
  {
    v86 = v84[6];
    v43 = v84;
    v54 = v274;
LABEL_99:
    v115 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      v116 = v43[5];
      LODWORD(buf.next_in) = 67109632;
      HIDWORD(buf.next_in) = v86;
      LOWORD(buf.avail_in) = 1024;
      *(uInt *)((char *)&buf.avail_in + 2) = v116;
      *((_WORD *)&buf.avail_in + 3) = 2048;
      buf.total_in = (uLong)v296;
      _os_log_impl((void *)&_mh_execute_header, v115, OS_LOG_TYPE_DEFAULT, "invalid eph_panic_log_len %u eph_panic_log_offset %u, embedded_panic_length %lu", (uint8_t *)&buf, 0x18u);
      v117 = v296;
      v54 = v274;
      v86 = v43[6];
    }
    else
    {
      v117 = v296;
    }
    v50 = (uint64_t)v273;
    v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Embedded panic header doesn't contain valid panic log: eph_panic_log_len %u eph_panic_log_offset %u embedded_panic_length %lu"), v86, v43[5], v117));
    -[Bytef addObject:](v54, "addObject:", v118);

    v278 = 0;
    v58 = 0;
    v60 = CFSTR("Embedded panic log header contains invalid panic log offset");
    v105 = v282;
    v59 = v83;
    goto LABEL_103;
  }
  v106 = v84[5];
  v86 = v84[6];
  v43 = v84;
  v54 = v274;
  if ((unint64_t)v296 <= v106)
    goto LABEL_99;
  v107 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v86));
  objc_msgSend(v282, "setObject:forKey:", v107, CFSTR("PanicLogLengthInBytes"));

  v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v43[10]));
  objc_msgSend(v282, "setObject:forKey:", v108, CFSTR("OtherLogLengthInBytes"));

  v109 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v43[8]));
  objc_msgSend(v282, "setObject:forKey:", v109, CFSTR("StackshotLengthInBytes"));

  v110 = v43;
  v111 = v43[10] + v43[6] + v43[8];
  v112 = v111 + sub_100012058(v110[2]);
  v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v112));
  objc_msgSend(v282, "setObject:forKey:", v113, CFSTR("UsedSizeInBytes"));

  *(_QWORD *)v315 = 0;
  if (sub_10000FA6C((uint64_t)"chosen", "embedded-panic-log-size", v315))
  {
    v114 = qword_10003A5D8;
    v54 = v274;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_impl((void *)&_mh_execute_header, v114, OS_LOG_TYPE_DEFAULT, "WARNING: unable to calculate panic region utilization", (uint8_t *)&buf, 2u);
    }
  }
  else
  {
    if (*(_QWORD *)v315)
    {
      v224 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", 100 * (unint64_t)v112 / *(_QWORD *)v315));
      v225 = v282;
      objc_msgSend(v282, "setObject:forKey:", v224, CFSTR("PercentUsed"));

      v226 = *(_QWORD *)v315;
    }
    else
    {
      v226 = 0;
      v225 = v282;
    }
    v228 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v226));
    objc_msgSend(v225, "setObject:forKey:", v228, CFSTR("PanicRegionSizeInBytes"));

    v54 = v274;
  }
  v229 = v290[5];
  v21 = v290[6];
  if ((unint64_t)&v296[-v229] < v21)
  {
    v230 = ((_DWORD)v296 - v229);
    v231 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.next_in) = 67109376;
      HIDWORD(buf.next_in) = v229;
      LOWORD(buf.avail_in) = 1024;
      *(uInt *)((char *)&buf.avail_in + 2) = v21;
      _os_log_error_impl((void *)&_mh_execute_header, v231, OS_LOG_TYPE_ERROR, "truncating eph_panic_log_offset %u, eph_panic_log_len %u (ignoring other log)", (uint8_t *)&buf, 0xEu);
      v21 = v290[6];
    }
    v59 = v83;
    v232 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Truncated panic string from 0x%x to 0x%x bytes (ignoring other log)"), v21, v230));
    -[Bytef addObject:](v54, "addObject:", v232);

    v60 = (__CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", (char *)v290 + v290[5], v230, 4, 0);
    v278 = 0;
    v58 = 0;
    goto LABEL_278;
  }
  v233 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.next_in) = 67109120;
    HIDWORD(buf.next_in) = v21;
    _os_log_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_DEFAULT, "found embedded panic log with %u bytes", (uint8_t *)&buf, 8u);
  }
  v234 = v290;
  v235 = (Bytef *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", (char *)v290 + v290[5], v290[6], 4, 0);
  v59 = v83;
  if (v235)
  {
    v280 = v235;
    v236 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.next_in) = 138412290;
      *(Bytef **)((char *)&buf.next_in + 4) = v280;
      _os_log_impl((void *)&_mh_execute_header, v236, OS_LOG_TYPE_DEFAULT, "embedded panic string decoded: %@", (uint8_t *)&buf, 0xCu);
    }
    v234 = v290;
    v237 = v274;
  }
  else
  {
    v238 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Parsed empty panic string from panic log buffer even though expected non-zero length: eph_panic_log_len %u eph_panic_log_offset %u embedded_panic_length %lu"), v290[6], v290[5], v296));
    -[Bytef addObject:](v274, "addObject:", v238);

    if (v290[6] < 0xF1)
    {
      v280 = 0;
      v237 = v274;
    }
    else
    {
      v237 = v274;
      v280 = (Bytef *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytesNoCopy:length:encoding:freeWhenDone:", (char *)v290 + v290[5], 240, 4, 0);
      if (v280)
        goto LABEL_257;
    }
    v239 = v290[6];
    if (v239 >= 0x64)
      v240 = 100;
    else
      v240 = v239;
    v241 = sub_100012150((uint64_t)v290 + v290[5], v240);
    v242 = (void *)objc_claimAutoreleasedReturnValue(v241);
    v243 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Prefix of panic string dumped as hex: %@"), v242));
    -[Bytef addObject:](v237, "addObject:", v243);

  }
LABEL_257:
  v21 = v234[10];
  if (!(_DWORD)v21)
  {
    v247 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_impl((void *)&_mh_execute_header, v247, OS_LOG_TYPE_DEFAULT, "no 'other' log found in embedded panic log", (uint8_t *)&buf, 2u);
    }
    v58 = 0;
    v248 = v290;
    goto LABEL_277;
  }
  v244 = v234[9];
  v245 = v234[6];
  if (v244 >= v245 + v234[5])
  {
    v246 = qword_10003A5D8;
    if ((unint64_t)v296 > v244)
    {
      if ((unint64_t)&v296[-v244] >= v21)
      {
        v59 = v83;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(buf.next_in) = 67109120;
          HIDWORD(buf.next_in) = v21;
          _os_log_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_DEFAULT, "found other log with %u bytes", (uint8_t *)&buf, 8u);
        }
        v251 = objc_alloc((Class)NSString);
        v248 = v290;
        v253 = v290[10];
        v252 = (char *)v290 + v290[9];
      }
      else
      {
        v59 = v83;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.next_in) = 67109376;
          HIDWORD(buf.next_in) = v244;
          LOWORD(buf.avail_in) = 1024;
          *(uInt *)((char *)&buf.avail_in + 2) = v21;
          _os_log_error_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_ERROR, "truncating eph_other_log_offset %u, eph_other_log_len %u", (uint8_t *)&buf, 0xEu);
        }
        v249 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("truncated other string")));
        -[Bytef addObject:](v237, "addObject:", v249);

        v250 = v296 - v290[9];
        v248 = v290;
        v251 = objc_alloc((Class)NSString);
        v252 = (char *)v248 + v248[9];
        v253 = v250;
      }
      v58 = objc_msgSend(v251, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v252, v253, 4, 0);
      goto LABEL_277;
    }
  }
  else
  {
    v246 = qword_10003A5D8;
  }
  if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf.next_in) = 67109376;
    HIDWORD(buf.next_in) = v245;
    LOWORD(buf.avail_in) = 1024;
    *(uInt *)((char *)&buf.avail_in + 2) = v244;
    _os_log_error_impl((void *)&_mh_execute_header, v246, OS_LOG_TYPE_ERROR, "invalid eph_panic_log_len %u eph_other_log_offset %u,", (uint8_t *)&buf, 0xEu);
  }
  v58 = 0;
  v248 = v290;
  v59 = v83;
LABEL_277:
  v60 = (__CFString *)v280;
  sub_10001220C(v248, (uint64_t)v248, (unint64_t)v296, &v312);
  sub_100012468(v248, (uint64_t)v248, (unint64_t)v296, &v311);
  v278 = 1;
  v54 = v274;
LABEL_278:
  if (!v60)
    v60 = CFSTR("embedded panic data was failed to be parsed from panic buffer, check notes for more details");
  v105 = v282;
  v50 = (uint64_t)v273;
LABEL_103:

  v119 = v60;
  v120 = v58;
  v63 = (__CFString *)v312;
  v15 = (id *)v311;
  v40 = v59;
  v25 = (id)v50;
  v121 = v119;
  if (!v121)
  {
LABEL_295:
    v264 = _os_assert_log(v121);
    _os_crash(v264);
    __break(1u);
LABEL_296:
    v265 = v15[187];
    if (os_log_type_enabled(v265, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf.next_in) = 134217984;
      *(Bytef **)((char *)&buf.next_in + 4) = v40;
      _os_log_error_impl((void *)&_mh_execute_header, v265, OS_LOG_TYPE_ERROR, "Couldn't allocate a large enough (%zu bytes) buffer for inflating the compressed panic stackshot", (uint8_t *)&buf, 0xCu);
    }
LABEL_298:
    v200 = v296;
    v198 = v296;
    goto LABEL_236;
  }
  v64 = v121;

  *(_QWORD *)a6->OSAStackShotReport_opaque = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@\n%@"), v64, v120));
  v62 = v120;
  v61 = v275;
LABEL_105:
  v122 = [PanicReport alloc];
  v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v57));
  v273 = (__CFString *)v64;
  v274 = v40;
  v282 = v62;
  v124 = -[PanicReport initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:](v122, "initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:", v64, v62, v40, v61, v284, v25, v123);

  v125 = sub_10000F968(v292, 0, a9);
  v126 = objc_claimAutoreleasedReturnValue(v125);
  -[PanicReport setSOCIdAndRev](v124, "setSOCIdAndRev");
  -[PanicReport setUtilizationInfo:](v124, "setUtilizationInfo:", v294);
  -[PanicReport useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:](v124, "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:", 0, 0, 0, a4, 0xFFFFFFFFLL, a9);
  -[PanicReport addNotes:](v124, "addNotes:", v301);
  -[NSMutableArray removeAllObjects](v301, "removeAllObjects");
  -[PanicReport useExtPaniclog:](v124, "useExtPaniclog:", v63);
  v275 = v15;
  -[PanicReport setPanicInitiator:](v124, "setPanicInitiator:", v15);
  a4 = (void *)v126;
  v28 = v298;
  v127 = v302;
  if ((-[PanicReport saveWithOptions:](v124, "saveWithOptions:", v126) & 1) == 0)
  {
    v128 = (id)qword_10003A5D8;
    if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_ERROR, "Failed to write initial safe panic log", (uint8_t *)&buf, 2u);
    }

  }
  v272 = v25;
  v277 = v63;
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport logfile](v124, "logfile"));
  v284 = (__CFString *)objc_msgSend(v129, "copy");

  v50 = (uint64_t)objc_alloc_init((Class)NSMutableArray);
  v307 = 0u;
  v308 = 0u;
  v309 = 0u;
  v310 = 0u;
  v130 = v298;
  v131 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v307, v314, 16);
  a6 = v124;
  if (v131)
  {
    v132 = v131;
    v133 = *(_QWORD *)v308;
    do
    {
      for (i = 0; i != v132; i = (char *)i + 1)
      {
        if (*(_QWORD *)v308 != v133)
          objc_enumerationMutation(v130);
        v135 = *(void **)(*((_QWORD *)&v307 + 1) + 8 * (_QWORD)i);
        v136 = objc_alloc_init((Class)NSMutableArray);
        v137 = sub_10001671C(v135);
        v138 = (void *)objc_claimAutoreleasedReturnValue(v137);
        v139 = sub_1000166AC(v135);
        v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v135, "base64EncodedStringWithOptions:", 0));
        if (v140)
          objc_msgSend(v136, "addObject:", v140);
        if (v138)
          objc_msgSend(v136, "addObject:", v138);
        objc_msgSend((id)v50, "addObject:", v136);

      }
      v132 = objc_msgSend(v130, "countByEnumeratingWithState:objects:count:", &v307, v314, 16);
    }
    while (v132);
    v25 = v292;
    v124 = a6;
    v28 = v298;
    v127 = v302;
  }
  else
  {
    v139 = 0;
    v25 = v292;
  }

  v141 = v290;
  if (v286)
  {
    if ((*((_BYTE *)v286 + 4) & 2) == 0)
    {
      v142 = v127;
      v306 = 0;
      v143 = sub_1000150F0((unsigned int *)v286, a2, &v306);
      v144 = v306;
      v145 = v144;
      if (v143)
      {
        v286 = (Bytef **)v144;
        -[PanicReport useSocdContainer:](v124, "useSocdContainer:", v50);
        v28 = v298;
        v25 = v292;
        if (!v139)
          goto LABEL_131;
      }
      else
      {
        v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", &v286[1][(_QWORD)v142], *((unsigned int *)v286 + 4), 0));
        v160 = objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "base64EncodedStringWithOptions:", 0));

        v161 = v160;
        if (!v160)
          v161 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to base64 encode SOCD container of length %u"), v286[2]));
        v286 = (Bytef **)v161;
        if (v271)
        {
          v124 = a6;
          -[PanicReport useSocdNandContainer:](a6, "useSocdNandContainer:", v161);

          -[PanicReport useSocdContainer:](a6, "useSocdContainer:", v50);
          v28 = v298;
          v25 = v292;
          if ((v139 & 1) == 0)
            goto LABEL_131;
        }
        else
        {
          objc_msgSend(v130, "addObject:", v159);
          v169 = sub_10001671C(v159);
          v170 = (void *)objc_claimAutoreleasedReturnValue(v169);
          v171 = v161;
          v172 = sub_1000166AC(v159);
          v173 = objc_alloc_init((Class)NSMutableArray);
          objc_msgSend(v173, "addObject:", v171);
          objc_msgSend(v173, "addObject:", v170);
          objc_msgSend((id)v50, "addObject:", v173);
          -[PanicReport setPanicString:](a6, "setPanicString:", v170);

          v28 = v298;
          v141 = v290;

          v124 = a6;
          -[PanicReport useSocdContainer:](a6, "useSocdContainer:", v50);
          v25 = v292;
          if ((v172 & 1) == 0)
            goto LABEL_131;
        }
      }
      goto LABEL_130;
    }
    -[PanicReport useSocdContainer:](v124, "useSocdContainer:", v50);
    v146 = CFSTR("BAD MAGIC! (flag set in iBoot panic header), no SOCD container available");
  }
  else
  {
    -[PanicReport useSocdContainer:](v124, "useSocdContainer:", v50);
    v146 = CFSTR("No valid SOCD nand container present");
  }
  v286 = (Bytef **)v146;
  if ((v139 & 1) != 0)
  {
LABEL_130:
    v147 = off_100039B48;
    -[PanicReport setForegroundAppHash:](v124, "setForegroundAppHash:", v147);

  }
LABEL_131:
  -[PanicReport addNotes:](v124, "addNotes:", v301);
  -[NSMutableArray removeAllObjects](v301, "removeAllObjects");
  v148 = -[PanicReport saveWithOptions:](v124, "saveWithOptions:", a4);
  v15 = (id *)&unk_10003A000;
  v149 = (id)qword_10003A5D8;
  v150 = v149;
  if (v148)
  {
    v17 = v283;
    v151 = v287;
    if (os_log_type_enabled(v149, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_DEFAULT, "Wrote log with SOCD data, discarding initial safe log", (uint8_t *)&buf, 2u);
    }

    sub_100010D10(v284);
    v150 = objc_claimAutoreleasedReturnValue(-[PanicReport logfile](a6, "logfile"));
    v152 = -[NSObject copy](v150, "copy");

    v284 = v152;
  }
  else
  {
    v17 = v283;
    v151 = v287;
    if (os_log_type_enabled(v149, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf.next_in) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_ERROR, "Failed to write panic log with SOCD data", (uint8_t *)&buf, 2u);
    }
  }

  if (v151)
  {
    v153 = v25;
    if ((*((_BYTE *)v151 + 4) & 2) != 0)
    {
      v155 = (id)qword_10003A5D8;
      v158 = v278;
      if (os_log_type_enabled(v155, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.next_in) = 0;
        _os_log_impl((void *)&_mh_execute_header, v155, OS_LOG_TYPE_DEFAULT, "No valid storage dump data found", (uint8_t *)&buf, 2u);
      }
      v156 = v282;
      v157 = a6;
    }
    else
    {
      v305 = 0;
      v154 = sub_1000150F0((unsigned int *)v151, a2, &v305);
      v155 = v305;
      if (v154)
      {
        -[NSMutableArray addObject:](v301, "addObject:", v155);
        v156 = v282;
        v157 = a6;
      }
      else
      {
        if ((*((_BYTE *)v151 + 4) & 4) != 0)
        {
          v162 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("iBoot indicates storage dump CRC mismatch")));
          -[NSMutableArray addObject:](v301, "addObject:", v162);

        }
        v163 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", &v151[1][(_QWORD)v302], *((int *)v151 + 4), 0));
        v164 = objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "base64EncodedStringWithOptions:", 0));

        v155 = v164;
        if (!v164)
          v155 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Failed to base64 encode storage dump of length %llu"), v151[2]);
        -[PanicReport useStoragePanicData:](a6, "useStoragePanicData:", v155);
        -[PanicReport addNotes:](a6, "addNotes:", v301);
        -[NSMutableArray removeAllObjects](v301, "removeAllObjects");
        v165 = -[PanicReport saveWithOptions:](a6, "saveWithOptions:", a4);
        v166 = (id)qword_10003A5D8;
        v167 = v166;
        if (v165)
        {
          v156 = v282;
          if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(buf.next_in) = 0;
            _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_DEFAULT, "Wrote log with storage data, discarding initial safe log", (uint8_t *)&buf, 2u);
          }

          sub_100010D10(v284);
          v167 = objc_claimAutoreleasedReturnValue(-[PanicReport logfile](a6, "logfile"));
          v168 = -[NSObject copy](v167, "copy");

          v284 = v168;
          v157 = a6;
          v15 = (id *)&unk_10003A000;
        }
        else
        {
          v156 = v282;
          if (os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.next_in) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_ERROR, "Failed to write panic log with storage data", (uint8_t *)&buf, 2u);
          }
          v157 = a6;
        }

        v17 = v283;
      }
      v158 = v278;
    }

    v25 = v153;
    v141 = v290;
    if (!v158)
      goto LABEL_168;
  }
  else
  {
    v156 = v282;
    v157 = a6;
    if (!v278)
    {
LABEL_168:
      v174 = v15[187];
      if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf.next_in) = 0;
        _os_log_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_DEFAULT, "no stackshot found", (uint8_t *)&buf, 2u);
      }
LABEL_175:

      v178 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport logfile](v157, "logfile"));
      *a7 = (uint64_t)objc_msgSend(v178, "copy");

      if (byte_10003A568)
      {
        v179 = v28;
        v180 = -[PanicPatternMatchingSupport init:]([PanicPatternMatchingSupport alloc], "init:", 0);
        v181 = (void *)qword_10003A590;
        qword_10003A590 = (uint64_t)v180;

        v182 = (void *)qword_10003A590;
        if (qword_10003A590)
        {
          v183 = v157;
          v184 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport incidentID](v157, "incidentID"));
          v185 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport logType](v183, "logType"));
          v186 = *a7;
          v187 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport panicString](v183, "panicString"));
          v188 = objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "createPanicCriterials::::", v184, v185, v186, v187));

          if (v188)
          {
            v189 = objc_msgSend((id)qword_10003A590, "lookForKnownPanic:", v188);
            v190 = v15[187];
            if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
            {
              v191 = "Cannot find";
              if (v189)
                v191 = "Found";
              LODWORD(buf.next_in) = 136315138;
              *(Bytef **)((char *)&buf.next_in + 4) = (Bytef *)v191;
              _os_log_impl((void *)&_mh_execute_header, v190, OS_LOG_TYPE_INFO, "%s matched panic pattern", (uint8_t *)&buf, 0xCu);
            }
          }
          else
          {
            v190 = v15[187];
            if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
            {
              LOWORD(buf.next_in) = 0;
              _os_log_error_impl((void *)&_mh_execute_header, v190, OS_LOG_TYPE_ERROR, "Failed to create Panic Criterials object, bailing out pattern matching", (uint8_t *)&buf, 2u);
            }
          }
          v156 = v282;
          v17 = v283;
          v157 = a6;

        }
        else
        {
          v188 = v15[187];
          if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR))
          {
            LOWORD(buf.next_in) = 0;
            _os_log_error_impl((void *)&_mh_execute_header, v188, OS_LOG_TYPE_ERROR, "Failed to create PanicPatternMatchingSupport object, bailing out pattern matching", (uint8_t *)&buf, 2u);
          }
        }

        v28 = v179;
      }

      v15 = v281;
      v18 = v301;
      v29 = v277;
      v26 = (Bytef *)v286;
      goto LABEL_189;
    }
  }
  if ((v141[3] & 2) == 0)
    goto LABEL_168;
  v175 = v141[7];
  if (v175 < sub_100012058(v141[2])
    || (v176 = v141[8]) == 0
    || (v177 = v141[7], (unint64_t)v296 < v177 + v176))
  {
    v174 = v15[187];
    if (os_log_type_enabled(v174, OS_LOG_TYPE_ERROR))
    {
      v220 = v141[7];
      v221 = v141[8];
      LODWORD(buf.next_in) = 67109376;
      HIDWORD(buf.next_in) = v220;
      LOWORD(buf.avail_in) = 1024;
      *(uInt *)((char *)&buf.avail_in + 2) = v221;
      _os_log_error_impl((void *)&_mh_execute_header, v174, OS_LOG_TYPE_ERROR, "invalid eph_stackshot_offset %u, eph_stackshot_len %u", (uint8_t *)&buf, 0xEu);
    }
    goto LABEL_175;
  }
  v192 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:freeWhenDone:](NSData, "dataWithBytesNoCopy:length:freeWhenDone:", (char *)v141 + v177)));
  v193 = objc_msgSend(v192, "bytes");
  v194 = objc_msgSend(v192, "length");

  v195 = 0;
  if ((unint64_t)v194 >= 5)
  {
    if (*v193 == 1503811591)
      v195 = 1;
    else
      v195 = 2 * (*v193 == 1129270608);
  }
  v196 = v15[187];
  if (os_log_type_enabled(v196, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.next_in) = 67109120;
    HIDWORD(buf.next_in) = v195;
    _os_log_impl((void *)&_mh_execute_header, v196, OS_LOG_TYPE_INFO, "panic stackshot is type %d", (uint8_t *)&buf, 8u);
  }

  v197 = v192;
  v21 = (unint64_t)v197;
  v156 = v282;
  if (v195 != 2)
  {
    v198 = (Bytef *)v197;
LABEL_285:

    v174 = objc_retainAutorelease(v198);
    -[PanicReport useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:](a6, "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:", -[NSObject bytes](v174, "bytes"), -[NSObject length](v174, "length"), 0, mach_absolute_time(), 1, a9);
    -[PanicReport addNotes:](a6, "addNotes:", v301);
    -[NSMutableArray removeAllObjects](v301, "removeAllObjects");
    v259 = -[PanicReport saveWithOptions:](a6, "saveWithOptions:", a4);
    v260 = v15[187];
    v261 = v260;
    if (v259)
    {
      v28 = v298;
      if (os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.next_in) = 138412290;
        *(Bytef **)((char *)&buf.next_in + 4) = (Bytef *)v284;
        _os_log_impl((void *)&_mh_execute_header, v261, OS_LOG_TYPE_DEFAULT, "Discarding 'safe' log %@", (uint8_t *)&buf, 0xCu);
      }

      sub_100010D10(v284);
    }
    else
    {
      v28 = v298;
      if (os_log_type_enabled(v260, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.next_in) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v261, OS_LOG_TYPE_ERROR, "Failed to write full panic log", (uint8_t *)&buf, 2u);
      }

    }
    v157 = a6;
    goto LABEL_175;
  }
  v200 = (Bytef *)objc_retainAutorelease(v197);
  v201 = (uInt *)-[Bytef bytes](v200, "bytes");
  v202 = -[Bytef length](v200, "length");
  v203 = *v201;
  v204 = *v201 & 0xFFFFFFF0;
  if (*v201 != 1129270608 || v204 == 32)
  {
    v222 = v15[187];
    if (os_log_type_enabled(v222, OS_LOG_TYPE_ERROR))
    {
      if (v204 == 32)
        v223 = 17;
      else
        v223 = v203;
      LODWORD(buf.next_in) = 136315394;
      *(Bytef **)((char *)&buf.next_in + 4) = (Bytef *)"decompress_stackshot";
      *((_WORD *)&buf.avail_in + 2) = 1024;
      *(uInt *)((char *)&buf.avail_in + 6) = v223;
      _os_log_error_impl((void *)&_mh_execute_header, v222, OS_LOG_TYPE_ERROR, "invalid kcdata iter type in %s(): %d", (uint8_t *)&buf, 0x12u);
    }
LABEL_283:
    v198 = v200;
    goto LABEL_284;
  }
  v296 = v200;
  v303 = 0;
  v205 = 0;
  v300 = 0;
  v288 = v202;
  v206 = (unint64_t)v201 + (_QWORD)v202;
  v291 = v201;
  v207 = (unint64_t)v201 + v201[1] + 16;
  v208 = 3;
  do
  {
    if (v207 + 16 > v206 || (v209 = v207, v207 += 16 + *(unsigned int *)(v207 + 4), v207 > v206))
    {
      v227 = v15[187];
      if (os_log_type_enabled(v227, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf.next_in) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v227, OS_LOG_TYPE_ERROR, "kcdata iterator was invalid while collecting compression metadata", (uint8_t *)&buf, 2u);
      }
      v200 = v296;
      v198 = v296;
      v25 = v292;
LABEL_236:
      v156 = v282;
      v17 = v283;
      goto LABEL_284;
    }
    v210 = v209 + 16;
    if (!strcmp((const char *)(v209 + 16), "kcd_c_type"))
    {
      v303 = *(Bytef **)(v210 + 32);
    }
    else if (!strcmp((const char *)v210, "kcd_c_totalout"))
    {
      v205 = *(_QWORD *)(v210 + 32);
    }
    else if (!strcmp((const char *)v210, "kcd_c_totalin"))
    {
      v300 = *(Bytef **)(v210 + 32);
    }
    --v208;
  }
  while (v208);
  v211 = v15[187];
  if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.next_in) = 134218496;
    *(Bytef **)((char *)&buf.next_in + 4) = v303;
    *((_WORD *)&buf.avail_in + 2) = 2048;
    *(_QWORD *)((char *)&buf.avail_in + 6) = v205;
    HIWORD(buf.total_in) = 2048;
    buf.next_out = v300;
    _os_log_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_INFO, "Compressed stackshot metadata: type: %lld totalout: %lld totalin %lld", (uint8_t *)&buf, 0x20u);
  }
  v25 = v292;
  v156 = v282;
  v17 = v283;
  if (v303 != (Bytef *)1 || !v205 || !v300)
  {
    v254 = v15[187];
    if (!os_log_type_enabled(v254, OS_LOG_TYPE_ERROR))
    {
LABEL_282:
      v200 = v296;
      goto LABEL_283;
    }
    LODWORD(buf.next_in) = 134218496;
    *(Bytef **)((char *)&buf.next_in + 4) = v303;
    *((_WORD *)&buf.avail_in + 2) = 2048;
    *(_QWORD *)((char *)&buf.avail_in + 6) = v205;
    HIWORD(buf.total_in) = 2048;
    buf.next_out = v300;
    v255 = "Required metadata from compressed panic stackshot is unexpected: type: %lld totalout %lld totalin %lld";
    v256 = v254;
    v257 = 32;
LABEL_309:
    _os_log_error_impl((void *)&_mh_execute_header, v256, OS_LOG_TYPE_ERROR, v255, (uint8_t *)&buf, v257);
    goto LABEL_282;
  }
  v212 = v205;
  v213 = *(_DWORD *)v207;
  v214 = *(_DWORD *)v207 & 0xFFFFFFF0;
  if (*(_DWORD *)v207 != 1503811591 || v214 == 32)
  {
    v258 = v15[187];
    if (!os_log_type_enabled(v258, OS_LOG_TYPE_ERROR))
      goto LABEL_282;
    if (v214 == 32)
      v269 = 17;
    else
      v269 = v213;
    LODWORD(buf.next_in) = 67109120;
    HIDWORD(buf.next_in) = v269;
    v255 = "Compressed kcdata buffer doesn't contain a stackshot, iter_type is %d";
    v256 = v258;
    v257 = 8;
    goto LABEL_309;
  }
  v40 = &v300[(unint64_t)v300 >> 3];
  v215 = (Bytef *)malloc_type_malloc((size_t)v40, 0x1CC7306DuLL);
  if (!v215)
    goto LABEL_296;
  v216 = v215;
  memset(&buf, 0, sizeof(buf));
  v217 = inflateInit_(&buf, "1.2.12", 112);
  if (v217)
  {
    v218 = v217;
    v219 = v15[187];
    if (os_log_type_enabled(v219, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v315 = 67109120;
      *(_DWORD *)&v315[4] = v218;
      _os_log_error_impl((void *)&_mh_execute_header, v219, OS_LOG_TYPE_ERROR, "Failed to initialize the z_stream for this panic stackshot: rc = %d", v315, 8u);
    }
    free(v216);
    goto LABEL_298;
  }
  *(_QWORD *)v216 = 1503811591;
  *((_QWORD *)v216 + 1) = 0;
  v266 = v207 + 16;
  buf.next_in = (Bytef *)(v207 + 16);
  buf.avail_in = v212;
  buf.next_out = v216 + 16;
  buf.avail_out = (_DWORD)v40 - 16;
  v304 = inflate(&buf, 4);
  if (v304 != 1)
  {
    v268 = v15[187];
    if (os_log_type_enabled(v268, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v315 = 67109120;
      *(_DWORD *)&v315[4] = v304;
      _os_log_error_impl((void *)&_mh_execute_header, v268, OS_LOG_TYPE_ERROR, "Failed to inflate the compresssed panic stackshot buffer: rc = %d", v315, 8u);
    }
    free(v216);
    v200 = v296;
    v198 = v296;
    v25 = v292;
    v156 = v282;
    v17 = v283;
LABEL_284:

    goto LABEL_285;
  }
  inflateEnd(&buf);
  v267 = (size_t)v288 + (_QWORD)v291 - v266 - v212;
  if (v267 <= (unint64_t)&v40[-buf.total_out - 16])
  {
    memcpy(&v216[buf.total_out + 16], (const void *)(v266 + v212), v267);
    v198 = (Bytef *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytesNoCopy:length:](NSData, "dataWithBytesNoCopy:length:", v216, v40));
    v25 = v292;
    v156 = v282;
    v17 = v283;
    v200 = v296;
    goto LABEL_284;
  }
  v270 = _os_assert_log(0);
  _os_crash(v270);
  __break(1u);
}

void sub_100014F50(void *a1, void *a2, uint64_t a3, void *a4, _QWORD *a5, _QWORD *a6, double a7)
{
  id v13;
  id v14;
  id v15;
  PanicReport *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  uint8_t buf[16];

  v13 = a1;
  v14 = a4;
  v15 = a2;
  v16 = -[PanicReport initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:]([PanicReport alloc], "initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:", v13, 0, 0, 0, CFSTR("corrupt data"), 0, 0);
  -[PanicReport useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:](v16, "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:", 0, 0, 0, a3, 0xFFFFFFFFLL, a7);
  -[PanicReport addNotes:](v16, "addNotes:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v14));
  v18 = sub_10000F968(v17, 0, a7);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  LOBYTE(v15) = -[PanicReport saveWithOptions:](v16, "saveWithOptions:", v19);

  if ((v15 & 1) == 0)
  {
    v20 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to write out error panic log", buf, 2u);
    }
  }
  *a5 = objc_msgSend(v13, "copy");
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport logfile](v16, "logfile"));
  *a6 = objc_msgSend(v21, "copy");

}

uint64_t sub_1000150F0(unsigned int *a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  uint64_t result;
  uint8_t buf[4];
  id v13;

  *a3 = 0;
  v4 = *a1;
  if ((_DWORD)v4)
  {
    if ((_DWORD)v4 == 2)
    {
      v5 = 8;
    }
    else
    {
      if ((_DWORD)v4 != 4)
      {
        result = _os_crash("check_log_metadata called with invalid log_type");
        __break(1u);
        return result;
      }
      v5 = 20;
    }
  }
  else
  {
    v5 = 44;
  }
  v6 = *((_QWORD *)a1 + 2);
  if (v6 < v5)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("invalid iBoot log metadata: (type %d) size invalid, found %llu, expected at least %lu"), v4, v6, v5));
    *a3 = v7;
    v8 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v7;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
      return 0xFFFFFFFFLL;
    }
    return 0xFFFFFFFFLL;
  }
  v9 = *((_QWORD *)a1 + 1);
  if (v9 + v6 > a2)
  {
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("invalid iBoot log metadata: (type %d) points outside of panic buffer : offset: %llu, size: %llu, bytes_read: %llu"), v4, v9, v6, a2));
    *a3 = v10;
    v8 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      goto LABEL_13;
    }
    return 0xFFFFFFFFLL;
  }
  return 0;
}

size_t sub_100015288(uint64_t a1, void *__dst, size_t a3)
{
  size_t v3;
  uint64_t v5;
  size_t v8;
  const void *v9;
  int v10;
  vm_size_t v11;
  size_t v12;
  unint64_t v13;
  size_t v14;
  NSObject *v16;
  uint8_t v17[16];

  v3 = 0;
  if (!a3)
    return v3;
  v5 = *(_QWORD *)(a1 + 8);
  if (!v5)
    return v3;
  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
  {
    v9 = *(const void **)(a1 + 32);
LABEL_12:
    if (v8 >= a3)
      v3 = a3;
    else
      v3 = v8;
    memcpy(__dst, v9, v3);
    v14 = *(_QWORD *)(a1 + 40) - v3;
    *(_QWORD *)(a1 + 32) += v3;
    *(_QWORD *)(a1 + 40) = v14;
    *(_QWORD *)(a1 + 8) -= v3;
    return v3;
  }
  v10 = *(_DWORD *)a1;
  v11 = (vm_page_size + v5 - 1) / vm_page_size * vm_page_size;
  if (*(_QWORD *)(a1 + 24) >= v11)
    v12 = v11;
  else
    v12 = *(_QWORD *)(a1 + 24);
  v13 = read(v10, *(void **)(a1 + 16), v12);
  if (v13 != -1)
  {
    v8 = *(_QWORD *)(a1 + 8);
    v9 = *(const void **)(a1 + 16);
    if (v13 < v8)
      v8 = v13;
    *(_QWORD *)(a1 + 32) = v9;
    *(_QWORD *)(a1 + 40) = v8;
    goto LABEL_12;
  }
  v16 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v17 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Failed to read from kernelcore file.", v17, 2u);
  }
  return -1;
}

uint64_t sub_1000153A4(void *a1)
{
  free(a1);
  return 0;
}

ssize_t sub_1000153BC(uint64_t a1, void *a2, size_t a3)
{
  ssize_t v3;
  NSObject *v4;
  uint8_t v6[16];

  v3 = AAByteStreamRead(*(AAByteStream *)(a1 + 8), a2, a3);
  if (v3 == -1)
  {
    v4 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "Failed to read from AEA decrypt stream source.", v6, 2u);
    }
  }
  return v3;
}

uint64_t sub_100015438(AEAContext *a1)
{
  uint64_t v2;
  NSObject *v3;
  uint8_t v5[16];

  v2 = AAByteStreamClose(a1[1]);
  if ((_DWORD)v2 == -1)
  {
    v3 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to close AEA decrypt stream source.", v5, 2u);
    }
  }
  AEAContextDestroy(*a1);
  free(a1);
  return v2;
}

uint64_t sub_1000154D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  _BOOL4 v6;
  ssize_t v7;
  compression_status v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  uint8_t buf[2];

  result = 0;
  if (!a3 || *(_BYTE *)(a1 + 48))
    return result;
  *(_QWORD *)(a1 + 8) = a2;
  *(_QWORD *)(a1 + 16) = a3;
  while (1)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v6 = 0;
      goto LABEL_8;
    }
    v7 = AAByteStreamRead(*(AAByteStream *)a1, *(void **)(a1 + 56), 8uLL);
    if (v7 == -1)
      break;
    *(_QWORD *)(a1 + 24) = *(_QWORD *)(a1 + 56);
    *(_QWORD *)(a1 + 32) = v7;
    v6 = v7 == 0;
LABEL_8:
    v8 = compression_stream_process((compression_stream *)(a1 + 8), v6);
    if (v8)
    {
      if (v8 == COMPRESSION_STATUS_END)
      {
        *(_BYTE *)(a1 + 48) = 1;
      }
      else if (v8 == COMPRESSION_STATUS_ERROR)
      {
        v9 = qword_10003A5A8;
        if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
        {
          v12 = 0;
          v10 = "Failed to decode from lz4 stream source.";
          v11 = (uint8_t *)&v12;
          goto LABEL_21;
        }
        return -1;
      }
      return a3 - *(_QWORD *)(a1 + 16);
    }
    if (*(_QWORD *)(a1 + 16) != a3)
      return a3 - *(_QWORD *)(a1 + 16);
  }
  v9 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v10 = "Failed to read from lz4 decode stream source.";
    v11 = buf;
LABEL_21:
    _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, v11, 2u);
  }
  return -1;
}

uint64_t sub_10001560C(uint64_t a1)
{
  compression_stream_destroy((compression_stream *)(a1 + 8));
  free(*(void **)(a1 + 56));
  free((void *)a1);
  return 0;
}

z_size_t sub_100015644(gzFile *a1, voidpc buf, z_size_t nitems)
{
  z_size_t v3;
  void *v5;
  int *v6;
  void *v7;
  NSObject *v8;
  int errnum;
  uint8_t bufa[4];
  void *v12;

  v3 = nitems;
  if (nitems && gzfwrite(buf, 1uLL, nitems, *a1) != nitems)
  {
    errnum = 0;
    v5 = (void *)gzerror(*a1, &errnum);
    if (errnum == -1)
    {
      v6 = __error();
      v5 = strerror(*v6);
    }
    v7 = v5;
    v8 = qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)bufa = 136315138;
      v12 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to write to gzip output file with error: %s.", bufa, 0xCu);
    }
    return -1;
  }
  return v3;
}

uint64_t sub_10001573C(gzFile *a1)
{
  gzclose(*a1);
  free(a1);
  return 0;
}

uint64_t sub_100015A64(void *a1, _QWORD *a2, int a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  int v9;
  int v10;
  int *v11;
  const __CFString *v12;
  id v13;
  uint64_t v14;
  int *v15;
  NSString *v16;
  int *v17;
  uint64_t result;
  int *v19;
  int *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char *v24;
  stat v25;

  v5 = a1;
  if (a2)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, "length");
    if (v7)
    {
      *a2 = 0;
      v8 = objc_retainAutorelease(v6);
      v9 = open((const char *)objc_msgSend(v8, "UTF8String"), 0x20000000);
      if (v9 < 0)
      {
        if (*__error() == 2)
        {
          v13 = objc_retainAutorelease(v8);
          if (mkdir((const char *)objc_msgSend(v13, "UTF8String"), a3) != -1)
          {
            v14 = 1;
LABEL_18:

            return v14;
          }
          v17 = __error();
          v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Error creating directory at : %@ : %s"), v13, strerror(*v17));
        }
        else
        {
          v15 = __error();
          v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to open directory at path : %@ with error : %s"), v8, strerror(*v15));
        }
        v14 = 0;
        *a2 = (id)objc_claimAutoreleasedReturnValue(v16);
        goto LABEL_18;
      }
      v10 = v9;
      memset(&v25, 0, sizeof(v25));
      if (fstat(v9, &v25))
      {
        v11 = __error();
        v23 = v8;
        v24 = strerror(*v11);
        v12 = CFSTR("fstat of %@ failed with error: %s");
      }
      else
      {
        if ((v25.st_mode & 0xF000) == 0x4000)
        {
          if (v25.st_mode != a3)
          {
            if (fchmod(v10, a3))
            {
              v19 = __error();
              v23 = v8;
              v24 = strerror(*v19);
              v12 = CFSTR("fchmod of path : %@ failed with error : %s");
              goto LABEL_14;
            }
            if (fchown(v10, 0, 0) == -1)
            {
              v20 = __error();
              v23 = v8;
              v24 = strerror(*v20);
              v12 = CFSTR("fchown of path : %@ failed with error : %s");
              goto LABEL_14;
            }
          }
          v14 = 1;
LABEL_15:
          close(v10);
          goto LABEL_18;
        }
        v23 = v8;
        v12 = CFSTR("path exists but is not directory : %@");
      }
LABEL_14:
      v14 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v23, v24));
      goto LABEL_15;
    }
  }
  else
  {
    v21 = _os_assert_log(0);
    v7 = (id)_os_crash(v21);
    __break(1u);
  }
  v22 = _os_assert_log(v7);
  result = _os_crash(v22);
  __break(1u);
  return result;
}

id sub_100015C98(void *a1)
{
  id v1;
  NSDateFormatter *v2;
  id v3;
  void *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  unsigned int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  int v15;
  void *v16;

  v1 = a1;
  v2 = objc_opt_new(NSDateFormatter);
  v3 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  -[NSDateFormatter setLocale:](v2, "setLocale:", v3);
  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "lastPathComponent"));
  if (objc_msgSend(v4, "containsString:", CFSTR(".core")))
  {
    v5 = (char *)objc_msgSend(v1, "rangeOfString:", CFSTR(".core"));
    if (v5 == (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v14 = _os_assert_log(0);
      _os_crash(v14);
      __break(1u);
    }
    v6 = v5;
    v7 = 0;
    do
    {
      v8 = v7;
      v9 = objc_msgSend(v4, "characterAtIndex:", v7);
      if (v6 == v8)
        break;
      v7 = v8 + 1;
    }
    while (v9 != 46);
    if (v8 != v6)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "substringToIndex:", v8));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter dateFromString:](v2, "dateFromString:", v12));

      goto LABEL_14;
    }
    v10 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v4;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "unable to parse date from filename %@, skipping", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    v10 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v4;
      goto LABEL_11;
    }
  }
  v11 = 0;
LABEL_14:

  return v11;
}

void sub_100015E94(id a1)
{
  int v1;
  int v2;
  uint64_t v3;
  char *v4;
  char *v5;
  int v6;
  int v7;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  uint32_t v11;
  size_t size;
  uint8_t buf[4];
  int v14;

  size = 0;
  v1 = sysctlbyname("kern.kdp_corefile", 0, &size, 0, 0);
  if (v1)
  {
    v2 = v1;
    v3 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      return;
    *(_DWORD *)buf = 67109120;
    v14 = v2;
    v8 = "Failed to query the size of kdp_corefile. Error: %d";
    goto LABEL_13;
  }
  if (size)
  {
    v4 = (char *)malloc_type_malloc(size, 0x79A79D99uLL);
    if (v4)
    {
      v5 = v4;
      v6 = sysctlbyname("kern.kdp_corefile", v4, &size, 0, 0);
      if (!v6)
      {
        off_100039BA0 = v5;
        return;
      }
      v7 = v6;
      free(v5);
      v3 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v14 = v7;
        v8 = "Failed to query kdp_corefile. Error: %d";
LABEL_13:
        v10 = v3;
        v11 = 8;
        goto LABEL_14;
      }
    }
    else
    {
      v9 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v8 = "Failed to allocate memory for kdp_corefile buffer";
        v10 = v9;
        v11 = 2;
LABEL_14:
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v8, buf, v11);
      }
    }
  }
}

id sub_100016028(const char *a1, const char *a2, char *a3, const char *a4, unsigned int a5)
{
  CFMutableDictionaryRef v10;
  __CFDictionary *v11;
  void *v12;
  kern_return_t MatchingServices;
  kern_return_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  uint64_t v19;
  int v21;
  io_object_t v22;
  io_registry_entry_t v23;
  NSObject *v24;
  const __CFString *v25;
  int v26;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v28;
  CFTypeID v29;
  int Value;
  NSObject *v31;
  _BOOL4 v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  void *v36;
  const __CFString *v37;
  const __CFString *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint32_t v45;
  uint64_t v46;
  NSObject *v47;
  CFTypeID v48;
  kern_return_t v49;
  kern_return_t v50;
  NSObject *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  char *cStr;
  int v57;
  io_iterator_t existing;
  void *v59;
  uint8_t buf[4];
  void *v61;
  __int16 v62;
  CFTypeID v63;

  if (!a1)
  {
    v52 = _os_assert_log(0);
    _os_crash(v52);
    __break(1u);
    goto LABEL_65;
  }
  if (!a2)
  {
LABEL_65:
    v53 = _os_assert_log(0);
    _os_crash(v53);
    __break(1u);
LABEL_66:
    v54 = _os_assert_log(0);
    _os_crash(v54);
    __break(1u);
  }
  if (!a3)
    goto LABEL_66;
  v10 = IOServiceMatching(a1);
  if (!v10)
  {
    v19 = qword_10003A5C0;
    if (!os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v16 = "Failed to create matching dict";
LABEL_62:
    v17 = v19;
    v18 = 2;
    goto LABEL_63;
  }
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a3));
  v59 = v12;
  CFDictionarySetValue(v11, CFSTR("IOPropertyExistsMatch"), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v59, 1));

  existing = 0;
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v11, &existing);
  if (MatchingServices)
  {
    v14 = MatchingServices;
    v15 = qword_10003A5C0;
    if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v61) = v14;
      v16 = "Failed to get matching socd ioservices: 0x%x";
      v17 = v15;
      v18 = 8;
LABEL_63:
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);
    }
LABEL_9:
    v55 = 0;
    return v55;
  }
  if (!existing)
  {
    v19 = qword_10003A5C0;
    if (!os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v16 = "IOService match returned an empty iterator";
    goto LABEL_62;
  }
  cStr = a3;
  v55 = objc_alloc_init((Class)NSMutableArray);
  if (a5 <= 1)
    v21 = 1;
  else
    v21 = a5;
  v57 = v21;
LABEL_16:
  if (IOIteratorIsValid(existing))
  {
    while (1)
    {
      v22 = IOIteratorNext(existing);
      if (!v22)
      {
        if (!IOIteratorIsValid(existing))
        {
          IOIteratorReset(existing);
          objc_msgSend(v55, "removeAllObjects");
          goto LABEL_16;
        }
        goto LABEL_56;
      }
      v23 = v22;
      if (a4)
      {
        v24 = qword_10003A5C0;
        if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Waiting for SOCD data collection to complete", buf, 2u);
        }
        v25 = CFStringCreateWithCString(kCFAllocatorDefault, a4, 0x8000100u);
        v26 = v57;
        if (v25)
        {
          while (1)
          {
            CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v23, v25, kCFAllocatorDefault, 0);
            if (!CFProperty)
              goto LABEL_36;
            v28 = CFProperty;
            v29 = CFGetTypeID(CFProperty);
            if (v29 != CFBooleanGetTypeID())
              break;
            Value = CFBooleanGetValue(v28);
            CFRelease(v28);
            v31 = qword_10003A5C0;
            v32 = os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_DEFAULT);
            if (!Value)
            {
              if (v32)
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "SOCD data collection is complete. Checking for data", buf, 2u);
              }
LABEL_36:
              CFRelease(v25);
              goto LABEL_37;
            }
            if (v32)
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "SOCD data collection still in progress", buf, 2u);
            }
            usleep(0x186A0u);
            if (!(_BYTE)--v26)
              goto LABEL_36;
          }
          v36 = (void *)qword_10003A5C0;
          if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
          {
            v47 = v36;
            v48 = CFGetTypeID(v28);
            *(_DWORD *)buf = 136315394;
            v61 = (void *)a4;
            v62 = 2048;
            v63 = v48;
            _os_log_error_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%s of unexpected type %lu", buf, 0x16u);

          }
          CFRelease(v28);
          CFRelease(v25);
        }
        else
        {
          v33 = qword_10003A5C0;
          if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v61 = (void *)a4;
            v34 = v33;
            v35 = "Error creating CFString for key %s";
            goto LABEL_49;
          }
        }
        goto LABEL_51;
      }
LABEL_37:
      v37 = CFStringCreateWithCString(kCFAllocatorDefault, a2, 0x8000100u);
      if (!v37)
        break;
      v38 = v37;
      v39 = (void *)IORegistryEntryCreateCFProperty(v23, v37, kCFAllocatorDefault, 0);
      CFRelease(v38);
      if (!v39)
      {
        v44 = qword_10003A5C0;
        if (!os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
          goto LABEL_51;
        *(_DWORD *)buf = 136315394;
        v61 = (void *)a2;
        v62 = 2080;
        v63 = (CFTypeID)a1;
        v34 = v44;
        v35 = "Failed to read %s in %s. This most probably means there's just no SOCD data";
        v45 = 22;
        goto LABEL_50;
      }
      v40 = CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
      if (!v40)
      {
        v46 = qword_10003A5C0;
        if (!os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
          goto LABEL_51;
        *(_DWORD *)buf = 136315138;
        v61 = cStr;
        v34 = v46;
        v35 = "Error creating CFString for key %s";
        goto LABEL_49;
      }
      v41 = v40;
      if (IORegistryEntrySetCFProperty(v23, v40, &off_100037888))
      {
        v42 = qword_10003A5C0;
        if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v61 = cStr;
          v34 = v42;
          v35 = "Failed to write %s";
          goto LABEL_49;
        }
LABEL_51:
        v39 = 0;
        goto LABEL_52;
      }
      CFRelease(v41);
      objc_msgSend(v55, "addObject:", v39);
LABEL_52:
      IOObjectRelease(v23);

    }
    v43 = qword_10003A5C0;
    if (!os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
      goto LABEL_51;
    *(_DWORD *)buf = 136315138;
    v61 = (void *)a2;
    v34 = v43;
    v35 = "Error creating CFString for key %s";
LABEL_49:
    v45 = 12;
LABEL_50:
    _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, v35, buf, v45);
    goto LABEL_51;
  }
LABEL_56:
  v49 = IOObjectRelease(existing);
  if (v49)
  {
    v50 = v49;
    v51 = qword_10003A5C0;
    if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v61 = (void *)a1;
      v62 = 1024;
      LODWORD(v63) = v50;
      _os_log_error_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Failed to release socd ioservice (%s) iterator: 0x%x", buf, 0x12u);
    }
  }
  return v55;
}

uint64_t sub_1000166AC(void *a1)
{
  id v1;
  void *v2;
  _BOOL8 v3;
  uint64_t result;
  uint64_t v5;

  v1 = a1;
  if (v1)
  {
    v2 = v1;

    v3 = (unint64_t)objc_msgSend(v2, "length") >= 0x14
      && (*((_BYTE *)objc_msgSend(objc_retainAutorelease(v2), "bytes") + 6) & 0x18) != 0;

    return v3;
  }
  else
  {
    v5 = _os_assert_log(0);
    result = _os_crash(v5);
    __break(1u);
  }
  return result;
}

__CFString *sub_10001671C(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;
  id v4;
  _BYTE *v5;
  char v6;
  char v7;
  int v8;
  const __CFString *v9;
  __CFString *result;
  uint64_t v11;

  v1 = a1;
  if (v1)
  {
    v2 = v1;

    if ((unint64_t)objc_msgSend(v2, "length") < 0x14)
    {
      v3 = CFSTR("SOCD report detected: socd buffer doesn't accommodate the socd header");
LABEL_17:

      return v3;
    }
    v4 = objc_retainAutorelease(v2);
    v5 = objc_msgSend(v4, "bytes");
    v6 = v5[6];
    v7 = v5[5];
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("SOCD report detected:")));
    if (sub_1000166AC(v4))
    {
      -[__CFString appendString:](v3, "appendString:", CFSTR(" (AP watchdog expired)"));
      v8 = 1;
    }
    else
    {
      v8 = 0;
    }
    if ((v6 & 6) != 0)
    {
      -[__CFString appendString:](v3, "appendString:", CFSTR(" (SMC panic)"));
      v8 = 1;
    }
    if ((v7 & 0x18) != 0)
    {
      -[__CFString appendString:](v3, "appendString:", CFSTR(" (iBoot async abort)"));
      v8 = 1;
    }
    if ((v7 & 6) != 0)
    {
      -[__CFString appendString:](v3, "appendString:", CFSTR(" (iBoot sync abort)"));
      if ((v7 & 0x60) == 0)
        goto LABEL_17;
    }
    else if ((v7 & 0x60) == 0)
    {
      if (v8)
        goto LABEL_17;
      v9 = CFSTR(" (Unknown)");
      goto LABEL_16;
    }
    v9 = CFSTR(" (iBoot panic)");
LABEL_16:
    -[__CFString appendString:](v3, "appendString:", v9);
    goto LABEL_17;
  }
  v11 = _os_assert_log(0);
  result = (__CFString *)_os_crash(v11);
  __break(1u);
  return result;
}

uint64_t sub_100016868(void *a1, _QWORD *a2, _QWORD *a3, void *a4, double a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __CFString *v24;
  int v25;
  uint64_t v26;
  PanicReport *v27;
  id v28;
  void *v29;
  __CFString *v30;
  id v31;
  _BYTE *v32;
  char v33;
  char v34;
  unsigned int v35;
  const __CFString *v36;
  unsigned int v37;
  __CFString *v38;
  PanicReport *v39;
  _UNKNOWN **v40;
  id v41;
  void *v42;
  void *v43;
  NSObject *v44;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  _QWORD *v51;
  _QWORD *v52;
  void *v53;
  id obj;
  id v55;
  uint8_t buf[16];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _BYTE v61[128];

  v9 = a1;
  v10 = a4;
  if (!a2)
  {
    v46 = _os_assert_log(0);
    _os_crash(v46);
    __break(1u);
    goto LABEL_41;
  }
  if (!a3)
  {
LABEL_41:
    v47 = _os_assert_log(0);
    v11 = (id)_os_crash(v47);
    __break(1u);
    goto LABEL_42;
  }
  v11 = v10;
  if (!v11)
  {
LABEL_42:
    v48 = _os_assert_log(v11);
    v28 = (id)_os_crash(v48);
    __break(1u);
    goto LABEL_43;
  }
  v12 = v11;

  *a2 = 0;
  *a3 = 0;
  if (!objc_msgSend(v12, "count"))
  {
    v26 = 1;
    goto LABEL_39;
  }
  v51 = a2;
  v52 = a3;
  v55 = objc_alloc_init((Class)NSMutableArray);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v53 = v12;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
  if (v13)
  {
    v14 = v13;
    v50 = v9;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)v58;
    do
    {
      v19 = 0;
      v20 = v15;
      v21 = v16;
      v22 = v17;
      do
      {
        if (*(_QWORD *)v58 != v18)
          objc_enumerationMutation(obj);
        v17 = *(id *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)v19);

        v23 = objc_alloc_init((Class)NSMutableArray);
        v24 = sub_10001671C(v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v24);

        v25 = sub_1000166AC(v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "base64EncodedStringWithOptions:", 0));

        objc_msgSend(v23, "addObject:", v16);
        objc_msgSend(v23, "addObject:", v15);
        objc_msgSend(v55, "addObject:", v23);

        v19 = (char *)v19 + 1;
        v20 = v15;
        v21 = v16;
        v22 = v17;
      }
      while (v14 != v19);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v57, v61, 16);
    }
    while (v14);

    v9 = v50;
  }
  else
  {
    v15 = 0;
    v16 = 0;
    v25 = 0;
  }

  v27 = [PanicReport alloc];
  v28 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "lastObject"));
  if (!v28)
  {
LABEL_43:
    v49 = _os_assert_log(v28);
    _os_crash(v49);
    __break(1u);
  }
  v29 = v28;

  v30 = CFSTR("socd");
  if ((unint64_t)objc_msgSend(v29, "length") >= 0x14)
  {
    v31 = objc_retainAutorelease(v29);
    v32 = objc_msgSend(v31, "bytes");
    v33 = v32[6];
    v34 = v32[5];
    v35 = sub_1000166AC(v31);
    v36 = CFSTR("socd-ap watchdog");
    if (v35)
    {
      v37 = 2;
    }
    else
    {
      v36 = CFSTR("socd");
      v37 = 1;
    }
    if ((v33 & 6) != 0)
      v36 = CFSTR("socd-smc panic");
    else
      v37 = v35;
    if ((v34 & 0x18) != 0)
    {
      v36 = CFSTR("socd-iboot async abort");
      ++v37;
    }
    if ((v34 & 6) != 0)
    {
      v36 = CFSTR("socd-iboot sync abort");
      ++v37;
    }
    if ((v34 & 0x60) != 0)
    {
      v36 = CFSTR("socd-iboot panic");
      ++v37;
    }
    if (v37 <= 1)
      v30 = (__CFString *)v36;
    else
      v30 = CFSTR("socd-multi");
  }

  v38 = v30;
  v39 = -[PanicReport initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:](v27, "initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:", v15, &stru_100035420, &stru_100035420, 0, v38, 0, 0);

  -[PanicReport useSocdContainer:](v39, "useSocdContainer:", v55);
  -[PanicReport setSOCIdAndRev](v39, "setSOCIdAndRev");
  if (v25)
  {
    v40 = off_100039B48;
    -[PanicReport setForegroundAppHash:](v39, "setForegroundAppHash:", v40);

  }
  v41 = sub_10000F968(v9, 0, a5);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  v26 = (uint64_t)-[PanicReport saveWithOptions:](v39, "saveWithOptions:", v42);
  if ((v26 & 1) != 0)
  {
    *v51 = objc_retainAutorelease(v15);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport logfile](v39, "logfile"));
    *v52 = objc_msgSend(v43, "copy");

  }
  else
  {
    v44 = qword_10003A5C0;
    if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Failed to write panic file", buf, 2u);
    }
  }

  v12 = v53;
LABEL_39:

  return v26;
}

NSMutableArray *sub_100017AFC(void *a1, void *a2)
{
  id v3;
  id v4;
  NSDateFormatter *v5;
  NSMutableOrderedSet *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSMutableArray *v10;
  NSMutableArray *v11;
  NSMutableArray *v12;
  uint64_t v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSDateFormatter *v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  unint64_t v36;
  id v37;
  void *v38;
  _BOOL4 v39;
  NSObject *v40;
  id v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSMutableArray *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  void *i;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  NSMutableArray *v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  NSMutableArray *v66;
  id v67;
  id v68;
  void *v69;
  id v70;
  void *j;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  unsigned __int8 v77;
  NSObject *v78;
  NSObject *v80;
  id v81;
  id v82;
  NSObject *v83;
  id v84;
  id v85;
  void *v86;
  NSMutableArray *v87;
  void *v88;
  NSDateFormatter *v89;
  NSMutableArray *v90;
  void *v91;
  NSMutableArray *v92;
  NSMutableOrderedSet *v93;
  uint64_t v94;
  id v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  _BYTE v113[128];
  _BYTE v114[128];
  uint8_t v115[128];
  uint8_t buf[4];
  id v117;
  __int16 v118;
  id v119;
  __int16 v120;
  int v121;
  __int16 v122;
  id v123;
  _BYTE v124[128];

  v3 = a1;
  v4 = a2;
  v5 = objc_opt_new(NSDateFormatter);
  v85 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  -[NSDateFormatter setLocale:](v5, "setLocale:");
  v89 = v5;
  -[NSDateFormatter setDateFormat:](v5, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
  v6 = objc_opt_new(NSMutableOrderedSet);
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("staged")));
  v7 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v117 = v4;
    v118 = 2112;
    v119 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Prune %@ core files in %@", buf, 0x16u);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "enumeratorAtPath:", v3));

  v10 = objc_opt_new(NSMutableArray);
  v92 = objc_opt_new(NSMutableArray);
  v11 = v10;
  v12 = objc_opt_new(NSMutableArray);
  v91 = v9;
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextObject"));
  v93 = v6;
  if (v13)
  {
    v14 = (void *)v13;
    while (!objc_msgSend(v14, "containsString:", v4))
    {
LABEL_14:
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "nextObject"));

      v14 = (void *)v20;
      if (!v20)
        goto LABEL_15;
    }
    v15 = objc_msgSend(v14, "containsString:", CFSTR("staged"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", v14));
    if (v15)
    {
      -[NSMutableArray addObject:](v12, "addObject:", v16);
    }
    else
    {
      -[NSMutableArray addObject:](v11, "addObject:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "lastPathComponent"));
      v18 = sub_100015C98(v17);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v18);

      if (v16)
      {
        v19 = qword_10003A5D8;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v117 = v16;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "found timestamp %@", buf, 0xCu);
        }
        v6 = v93;
        -[NSMutableOrderedSet addObject:](v93, "addObject:", v16);
        goto LABEL_13;
      }
    }
    v6 = v93;
LABEL_13:

    goto LABEL_14;
  }
LABEL_15:
  v87 = v11;
  v88 = v4;
  v95 = v3;
  if ((unint64_t)-[NSMutableArray count](v12, "count") < 2)
  {
    v22 = v89;
  }
  else
  {
    v21 = (void *)qword_10003A5D8;
    v22 = v89;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v83 = v21;
      v84 = -[NSMutableArray count](v12, "count");
      *(_DWORD *)buf = 134217984;
      v117 = v84;
      _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "Found %lu sets of cores under staged folder", buf, 0xCu);

    }
    v23 = sub_100017AFC(v86, v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

    v111 = 0u;
    v112 = 0u;
    v109 = 0u;
    v110 = 0u;
    v12 = v24;
    v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v110;
      do
      {
        v29 = 0;
        v30 = v27;
        do
        {
          if (*(_QWORD *)v110 != v28)
            objc_enumerationMutation(v12);
          v27 = *(id *)(*((_QWORD *)&v109 + 1) + 8 * (_QWORD)v29);

          v31 = qword_10003A5D8;
          if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v117 = v27;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@ left in pull in list", buf, 0xCu);
          }
          v29 = (char *)v29 + 1;
          v30 = v27;
        }
        while (v26 != v29);
        v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
      }
      while (v26);

      v22 = v89;
    }

    v6 = v93;
  }
  -[NSMutableOrderedSet sortUsingComparator:](v6, "sortUsingComparator:", &stru_100034D30);
  if (-[NSMutableArray count](v12, "count") && -[NSMutableOrderedSet count](v6, "count"))
  {
    v32 = (void *)qword_10003A5D8;
    v90 = v12;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      v34 = -[NSMutableOrderedSet count](v6, "count");
      v35 = -[NSMutableArray count](v12, "count");
      *(_DWORD *)buf = 138413058;
      v117 = v4;
      v118 = 2048;
      v119 = v34;
      v120 = 1024;
      v121 = 1;
      v122 = 2048;
      v123 = v35;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Removing prior %@ corefiles, found %lu sets (policy limit %u, %lu set staged)", buf, 0x26u);

    }
    v36 = 0;
LABEL_38:
    while ((unint64_t)-[NSMutableOrderedSet count](v6, "count") > v36)
    {
      v42 = (void *)qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        v43 = v42;
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet objectAtIndex:](v6, "objectAtIndex:", 0));
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v22, "stringFromDate:", v44));
        *(_DWORD *)buf = 138412290;
        v117 = v45;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Removing cores from time %@", buf, 0xCu);

        v6 = v93;
      }
      -[NSMutableOrderedSet removeObjectAtIndex:](v6, "removeObjectAtIndex:", 0);
    }
    v107 = 0u;
    v108 = 0u;
    v105 = 0u;
    v106 = 0u;
    v46 = v87;
    v47 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
    v48 = v95;
    if (v47)
    {
      v49 = v47;
      v50 = 0;
      v51 = *(_QWORD *)v106;
      do
      {
        for (i = 0; i != v49; i = (char *)i + 1)
        {
          v53 = v50;
          if (*(_QWORD *)v106 != v51)
            objc_enumerationMutation(v46);
          v50 = *(id *)(*((_QWORD *)&v105 + 1) + 8 * (_QWORD)i);

          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "lastPathComponent"));
          v55 = sub_100015C98(v54);
          v56 = (void *)objc_claimAutoreleasedReturnValue(v55);

          if (v56 && (-[NSMutableOrderedSet containsObject:](v93, "containsObject:", v56) & 1) == 0)
            -[NSMutableArray addObject:](v92, "addObject:", v50);

        }
        v49 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v46, "countByEnumeratingWithState:objects:count:", &v105, v115, 16);
      }
      while (v49);

      v22 = v89;
    }

    -[NSMutableArray removeObjectsInArray:](v46, "removeObjectsInArray:", v92);
    v103 = 0u;
    v104 = 0u;
    v101 = 0u;
    v102 = 0u;
    v57 = v92;
    v58 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
    if (v58)
    {
      v59 = v58;
      v60 = 0;
      v61 = *(_QWORD *)v102;
      do
      {
        v62 = 0;
        v63 = v60;
        do
        {
          if (*(_QWORD *)v102 != v61)
            objc_enumerationMutation(v57);
          v60 = *(id *)(*((_QWORD *)&v101 + 1) + 8 * (_QWORD)v62);

          v64 = qword_10003A5D8;
          if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v117 = v60;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Removing file %@", buf, 0xCu);
          }
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          objc_msgSend(v65, "removeItemAtPath:error:", v60, 0);

          v62 = (char *)v62 + 1;
          v63 = v60;
        }
        while (v59 != v62);
        v59 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v57, "countByEnumeratingWithState:objects:count:", &v101, v114, 16);
      }
      while (v59);

      v22 = v89;
    }

    v12 = v90;
    goto LABEL_64;
  }
  v37 = -[NSMutableOrderedSet count](v6, "count");
  v38 = (void *)qword_10003A5D8;
  v39 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
  if ((unint64_t)v37 >= 2)
  {
    v90 = v12;
    v36 = 1;
    if (v39)
    {
      v40 = v38;
      v41 = -[NSMutableOrderedSet count](v6, "count");
      *(_DWORD *)buf = 138412802;
      v117 = v4;
      v118 = 2048;
      v119 = v41;
      v120 = 1024;
      v121 = 1;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Removing prior %@ corefiles, found %lu sets (policy limit %u)", buf, 0x1Cu);

    }
    goto LABEL_38;
  }
  v48 = v95;
  if (v39)
  {
    v80 = v38;
    v81 = -[NSMutableOrderedSet count](v6, "count");
    v82 = -[NSMutableArray count](v12, "count");
    *(_DWORD *)buf = 134218754;
    v117 = v81;
    v118 = 2112;
    v119 = v88;
    v120 = 1024;
    v121 = 1;
    v122 = 2048;
    v123 = v82;
    _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "Found %lu sets of %@ corefiles (policy limit %u, %lu set staged), not cleaning up", buf, 0x26u);

  }
LABEL_64:
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  v66 = v12;
  v67 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
  if (v67)
  {
    v68 = v67;
    v69 = 0;
    v70 = 0;
    v94 = *(_QWORD *)v98;
    do
    {
      for (j = 0; j != v68; j = (char *)j + 1)
      {
        v72 = v70;
        if (*(_QWORD *)v98 != v94)
          objc_enumerationMutation(v66);
        v73 = *(id *)(*((_QWORD *)&v97 + 1) + 8 * (_QWORD)j);

        v69 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndex:](v66, "objectAtIndex:", 0));
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "lastPathComponent"));
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "stringByAppendingPathComponent:", v75));
        v96 = v72;
        v77 = objc_msgSend(v74, "moveItemAtPath:toPath:error:", v69, v76, &v96);
        v70 = v96;

        if ((v77 & 1) == 0)
        {
          v78 = qword_10003A5D8;
          if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v117 = v69;
            v118 = 2114;
            v119 = v70;
            _os_log_error_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "Cannot move staged '%{public}@' to panics folder : %{public}@", buf, 0x16u);
          }
        }
        v48 = v95;
      }
      v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
    }
    while (v68);

    v22 = v89;
  }

  return v87;
}

int64_t sub_100018658(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a2, "compare:", a3);
}

id sub_10001D3B0(double a1)
{
  NSDateFormatter *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = objc_opt_new(NSDateFormatter);
  v3 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  if (qword_10003A570 != -1)
    dispatch_once(&qword_10003A570, &stru_100034BF8);
  if (byte_10003A569)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimeZone timeZoneWithName:](NSTimeZone, "timeZoneWithName:", CFSTR("UTC")));
    -[NSDateFormatter setTimeZone:](v2, "setTimeZone:", v4);

  }
  -[NSDateFormatter setLocale:](v2, "setLocale:", v3);
  -[NSDateFormatter setDateFormat:](v2, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", a1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](v2, "stringFromDate:", v5));

  return v6;
}

id sub_10001D4C0(void *a1, unsigned int a2)
{
  id v3;
  NSDateFormatter *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSMutableOrderedSet *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  NSMutableArray *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  NSMutableArray *v30;
  unint64_t v31;
  void *v32;
  NSObject *v33;
  id v34;
  id v35;
  const char *v36;
  NSObject *v37;
  uint32_t v38;
  id v39;
  void *v40;
  _BOOL4 v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  NSMutableArray *v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  NSObject *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  uint64_t v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint64_t v71;
  void *i;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  unsigned __int8 v78;
  NSObject *v79;
  NSObject *v81;
  id v82;
  id v83;
  NSDateFormatter *v84;
  void *v85;
  NSMutableOrderedSet *v86;
  void *v87;
  id obj;
  void *v89;
  void *v90;
  uint64_t v91;
  id v92;
  uint64_t v93;
  NSMutableArray *v94;
  unsigned int v95;
  NSMutableArray *v96;
  NSMutableArray *v97;
  void *v98;
  id v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _BYTE v116[128];
  _BYTE v117[128];
  _BYTE v118[128];
  uint8_t v119[128];
  uint8_t buf[4];
  id v121;
  __int16 v122;
  _BYTE v123[14];

  v3 = a1;
  v4 = objc_opt_new(NSDateFormatter);
  v83 = objc_msgSend(objc_alloc((Class)NSLocale), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  -[NSDateFormatter setLocale:](v4, "setLocale:");
  v84 = v4;
  -[NSDateFormatter setDateFormat:](v4, "setDateFormat:", CFSTR("yyyy-MM-dd-HHmmss"));
  v86 = objc_opt_new(NSMutableOrderedSet);
  v98 = v3;
  v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("staged")));
  v5 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v121 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Prune core files in %@", buf, 0xCu);
  }
  if (a2)
  {
    v95 = a2;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enumeratorAtPath:", v3));

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v94 = objc_opt_new(NSMutableArray);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v87 = v7;
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));
    if (v10)
    {
      v11 = (void *)v10;
      v96 = 0;
      v12 = v86;
      do
      {
        v13 = objc_msgSend(v11, "containsString:", CFSTR("staged"));
        if ((v13 & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastPathComponent"));
          v15 = sub_100015C98(v14);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

          v17 = v9;
        }
        else
        {
          v18 = sub_100015C98(v11);
          v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
          v17 = v8;
        }
        v19 = v17;
        v20 = v19;
        if (v16)
        {
          v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v16));

          v22 = (NSMutableArray *)v21;
          if (!v21)
            v22 = objc_opt_new(NSMutableArray);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "stringByAppendingPathComponent:", v11));
          -[NSMutableArray addObject:](v22, "addObject:", v23);

          v96 = v22;
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, v16);
          if ((v13 & 1) == 0)
            -[NSMutableOrderedSet addObject:](v86, "addObject:", v16);
        }

        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "nextObject"));
        v11 = (void *)v24;
      }
      while (v24);
    }
    else
    {
      v96 = 0;
      v12 = v86;
    }
    v26 = v9;
    if ((unint64_t)objc_msgSend(v9, "count") < 2)
    {
      v28 = v95;
    }
    else
    {
      v27 = (void *)qword_10003A5A8;
      v28 = v95;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
      {
        v81 = v27;
        v82 = objc_msgSend(v9, "count");
        *(_DWORD *)buf = 134217984;
        v121 = v82;
        _os_log_error_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_ERROR, "Found %lu sets of cores under staged folder", buf, 0xCu);

      }
      v29 = sub_10001D4C0(v85, 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v29);

    }
    -[NSMutableOrderedSet sortUsingComparator:](v12, "sortUsingComparator:", &stru_100034DB8);
    v90 = v26;
    v30 = v96;
    if (objc_msgSend(v26, "count")
      && (v31 = v28 - 1, (unint64_t)-[NSMutableOrderedSet count](v12, "count") > v31))
    {
      v32 = (void *)qword_10003A5A8;
      if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
      {
        v33 = v32;
        v34 = -[NSMutableOrderedSet count](v12, "count");
        v35 = objc_msgSend(v90, "count");
        *(_DWORD *)buf = 134218496;
        v121 = v34;
        v122 = 1024;
        *(_DWORD *)v123 = v28;
        *(_WORD *)&v123[4] = 2048;
        *(_QWORD *)&v123[6] = v35;
        v36 = "Removing prior corefiles, found %lu sets (policy limit %u, %lu set staged)";
        v37 = v33;
        v38 = 28;
LABEL_32:
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);

      }
    }
    else
    {
      v39 = -[NSMutableOrderedSet count](v12, "count");
      v40 = (void *)qword_10003A5A8;
      v41 = os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT);
      if ((unint64_t)v39 <= v28)
      {
        if (v41)
        {
          v61 = v40;
          v62 = -[NSMutableOrderedSet count](v12, "count");
          v63 = objc_msgSend(v90, "count");
          *(_DWORD *)buf = 134218496;
          v121 = v62;
          v122 = 1024;
          *(_DWORD *)v123 = v28;
          *(_WORD *)&v123[4] = 2048;
          *(_QWORD *)&v123[6] = v63;
          _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Found %lu sets of corefiles (policy limit %u, %lu set staged), not cleaning up", buf, 0x1Cu);

        }
        goto LABEL_56;
      }
      v31 = v28;
      if (v41)
      {
        v33 = v40;
        v42 = -[NSMutableOrderedSet count](v12, "count");
        *(_DWORD *)buf = 134218240;
        v121 = v42;
        v122 = 1024;
        *(_DWORD *)v123 = v28;
        v36 = "Removing prior corefiles, found %lu sets (policy limit %u)";
        v37 = v33;
        v38 = 18;
        goto LABEL_32;
      }
    }
    while ((unint64_t)-[NSMutableOrderedSet count](v12, "count") > v31)
    {
      v114 = 0uLL;
      v115 = 0uLL;
      v112 = 0uLL;
      v113 = 0uLL;
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet objectAtIndex:](v12, "objectAtIndex:", 0));
      v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v43));

      v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v112, v119, 16);
      if (v45)
      {
        v46 = v45;
        v47 = 0;
        v48 = *(_QWORD *)v113;
        do
        {
          v49 = 0;
          v50 = v47;
          do
          {
            if (*(_QWORD *)v113 != v48)
              objc_enumerationMutation(v44);
            v47 = *(id *)(*((_QWORD *)&v112 + 1) + 8 * (_QWORD)v49);

            -[NSMutableArray addObject:](v94, "addObject:", v47);
            v49 = (char *)v49 + 1;
            v50 = v47;
          }
          while (v46 != v49);
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v112, v119, 16);
        }
        while (v46);

        v12 = v86;
      }

      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableOrderedSet objectAtIndex:](v12, "objectAtIndex:", 0));
      objc_msgSend(v8, "removeObjectForKey:", v51);

      -[NSMutableOrderedSet removeObjectAtIndex:](v12, "removeObjectAtIndex:", 0);
    }
    v110 = 0uLL;
    v111 = 0uLL;
    v108 = 0uLL;
    v109 = 0uLL;
    v52 = v94;
    v53 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
    if (v53)
    {
      v54 = v53;
      v55 = 0;
      v56 = *(_QWORD *)v109;
      do
      {
        v57 = 0;
        v58 = v55;
        do
        {
          if (*(_QWORD *)v109 != v56)
            objc_enumerationMutation(v52);
          v55 = *(id *)(*((_QWORD *)&v108 + 1) + 8 * (_QWORD)v57);

          v59 = qword_10003A5A8;
          if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v121 = v55;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Removing file %@", buf, 0xCu);
          }
          v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
          objc_msgSend(v60, "removeItemAtPath:error:", v55, 0);

          v57 = (char *)v57 + 1;
          v58 = v55;
        }
        while (v54 != v57);
        v54 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v52, "countByEnumeratingWithState:objects:count:", &v108, v118, 16);
      }
      while (v54);

    }
    v30 = v96;
LABEL_56:
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    v64 = v90;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "allValues"));
    v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v117, 16);
    v65 = 0;
    if (v92)
    {
      v91 = *(_QWORD *)v105;
      v89 = v8;
      do
      {
        v66 = 0;
        do
        {
          if (*(_QWORD *)v105 != v91)
            objc_enumerationMutation(obj);
          v93 = v66;
          v67 = *(id *)(*((_QWORD *)&v104 + 1) + 8 * v66);

          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          v30 = (NSMutableArray *)v67;
          v68 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
          if (v68)
          {
            v69 = v68;
            v97 = v30;
            v70 = 0;
            v71 = *(_QWORD *)v101;
            do
            {
              for (i = 0; i != v69; i = (char *)i + 1)
              {
                v73 = v65;
                v74 = v70;
                if (*(_QWORD *)v101 != v71)
                  objc_enumerationMutation(v97);
                v70 = *(id *)(*((_QWORD *)&v100 + 1) + 8 * (_QWORD)i);

                v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "lastPathComponent"));
                v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v98, "stringByAppendingPathComponent:", v76));
                v99 = v73;
                v78 = objc_msgSend(v75, "moveItemAtPath:toPath:error:", v70, v77, &v99);
                v65 = v99;

                v79 = qword_10003A5A8;
                if ((v78 & 1) != 0)
                {
                  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138543362;
                    v121 = v70;
                    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "Moved staged '%{public}@ to panics folder", buf, 0xCu);
                  }
                }
                else if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543618;
                  v121 = v70;
                  v122 = 2114;
                  *(_QWORD *)v123 = v65;
                  _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "Cannot move staged '%{public}@' to panics folder : %{public}@", buf, 0x16u);
                }
              }
              v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v97, "countByEnumeratingWithState:objects:count:", &v100, v116, 16);
            }
            while (v69);

            v8 = v89;
            v64 = v90;
            v30 = v97;
          }

          v66 = v93 + 1;
        }
        while ((id)(v93 + 1) != v92);
        v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v104, v117, 16);
      }
      while (v92);
    }

    goto LABEL_77;
  }
  v25 = qword_10003A5A8;
  if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Not pruning because the policy limit is set to 0", buf, 2u);
  }
  v8 = 0;
LABEL_77:

  return v8;
}

id sub_10001DF5C(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[3];
  _QWORD v11[3];

  v8 = 0;
  v9 = 0;
  v7 = 0;
  objc_msgSend(*(id *)(a1 + 32), "getCoreDumpInfoWithIndex::::", *(_QWORD *)(a1 + 40) - 1, &v9, &v8, &v7);
  v10[0] = CFSTR("CorefileDataSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (unint64_t)(v8 + v9) >> 20));
  v11[0] = v2;
  v10[1] = CFSTR("NumCores");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40)));
  v11[1] = v3;
  v10[2] = CFSTR("DRAMSizeMB");
  if (qword_10003A5B8 != -1)
    dispatch_once(&qword_10003A5B8, &stru_100034DD8);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", dword_10003A5B0));
  v11[2] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 3));

  return v5;
}

id sub_10001E0B0(uint64_t a1)
{
  void *v2;
  unsigned int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];

  v9[0] = CFSTR("coreName");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *(_QWORD *)(a1 + 32)));
  v10[0] = v2;
  v9[1] = CFSTR("coreSize");
  v3 = *(_DWORD *)(a1 + 40);
  if (v3 <= 1)
    v4 = 1;
  else
    v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v4));
  v10[1] = v5;
  v9[2] = CFSTR("DRAMSizeMB");
  if (qword_10003A5B8 != -1)
    dispatch_once(&qword_10003A5B8, &stru_100034DD8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", dword_10003A5B0));
  v10[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));

  return v7;
}

void sub_10001E1E4(id a1)
{
  void *v1;
  NSObject *v2;
  int *v3;
  char *v4;
  size_t v5;
  unint64_t v6;
  uint8_t buf[4];
  char *v8;

  v5 = 8;
  v6 = 0;
  if (sysctlbyname("hw.memsize", &v6, &v5, 0, 0))
  {
    v1 = (void *)qword_10003A5A8;
    if (os_log_type_enabled((os_log_t)qword_10003A5A8, OS_LOG_TYPE_ERROR))
    {
      v2 = v1;
      v3 = __error();
      v4 = strerror(*v3);
      *(_DWORD *)buf = 136315138;
      v8 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "failed to query sysct hw.memsize: %s", buf, 0xCu);

    }
  }
  else
  {
    dword_10003A5B0 = v6 >> 20;
  }
}

int64_t sub_10001E2D0(id a1, id a2, id a3)
{
  return (int64_t)objc_msgSend(a2, "compare:", a3);
}

uint64_t start_0(uint64_t a1, uint64_t a2)
{
  CFAllocatorRef v2;
  __CFString *v3;
  double Current;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  int v8;
  os_log_t v9;
  void *v10;
  void *v11;
  BOOL v12;
  BOOL v13;
  NSObject *v15;
  dispatch_semaphore_t v16;
  void *v17;
  dispatch_queue_global_t global_queue;
  NSObject *v19;
  uint32_t v20;
  NSObject *v21;
  void *v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  io_registry_entry_t v26;
  CFTypeRef CFProperty;
  void *v28;
  CFTypeID v29;
  id v30;
  NSObject *v31;
  NSObject *v32;
  os_log_t v33;
  void *v34;
  NSObject *v35;
  os_log_t v36;
  char *v37;
  NSObject *v38;
  NSObject *v39;
  unsigned __int8 v40;
  id v41;
  id v42;
  void *v43;
  NSObject *v44;
  id v45;
  void *v46;
  NSObject *v47;
  BOOL v48;
  NSObject *v49;
  _BOOL4 v50;
  id v51;
  id v52;
  NSObject *v53;
  id v54;
  id v55;
  uint64_t v56;
  void *i;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  __CFDictionary *v67;
  const __CFDictionary *v68;
  __CFDictionary *v69;
  const __CFDictionary *v70;
  kern_return_t MatchingServices;
  uint64_t v72;
  const char *v73;
  NSObject *v74;
  uint32_t v75;
  NSObject *v76;
  uint64_t v77;
  void *v78;
  NSObject *v79;
  int *v80;
  char *v81;
  const char *v82;
  NSObject *v83;
  const char *v84;
  NSObject *v85;
  int *v86;
  char *v87;
  int v88;
  int v89;
  __darwin_ino64_t v90;
  int v91;
  const char *v92;
  dev_t v93;
  int v94;
  const char *v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  const void *Value;
  const void *v101;
  const void *v102;
  const void *v103;
  _UNKNOWN **v104;
  _UNKNOWN **v105;
  const void *v106;
  void *v107;
  NSObject *v108;
  NSObject *v109;
  _BOOL4 v110;
  void *v111;
  id v112;
  id v113;
  id v114;
  __darwin_ino64_t v115;
  id v116;
  id v117;
  id v118;
  id v119;
  id v120;
  __darwin_time_t v121;
  void *v122;
  void *v123;
  void *v124;
  unsigned __int8 v125;
  NSObject *v126;
  const char *v127;
  NSObject *v128;
  io_registry_entry_t v129;
  void *v130;
  io_object_t v131;
  _BYTE *v132;
  CFTypeRef v133;
  NSObject *v134;
  int v135;
  _BOOL4 v136;
  const char *v137;
  NSObject *v138;
  int Size;
  size_t v140;
  const __CFAllocator *v141;
  CFAllocatorRef v142;
  int PanicLogData;
  NSObject *v144;
  CFIndex AppIntegerValue;
  uint64_t v146;
  uint64_t v147;
  __CFDictionary *v148;
  io_service_t MatchingService;
  io_object_t v150;
  const __CFString *v151;
  const __CFBoolean *v152;
  NSObject *v153;
  NSObject *v154;
  id v155;
  unsigned __int8 *v156;
  int v157;
  id v158;
  NSObject *v159;
  _BOOL4 v160;
  const char *v161;
  NSObject *v162;
  uint32_t v163;
  NSObject *v164;
  int v165;
  NSObject *v166;
  NSObject *v167;
  NSObject *v168;
  int *v169;
  char *v170;
  NSObject *v171;
  _BOOL4 v172;
  NSObject *v173;
  __CFString *v174;
  void *v175;
  __CFDictionary *v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  void *v181;
  __CFDictionary *v182;
  NSFileAttributeType v183;
  BOOL v184;
  NSObject *v185;
  unsigned __int8 v186;
  uint64_t v187;
  NSObject *v188;
  const char *v189;
  NSObject *v190;
  unsigned __int8 v191;
  uint64_t v192;
  NSObject *v193;
  NSObject *v194;
  void *v195;
  int v196;
  const char *v197;
  uint64_t v198;
  void *v199;
  void *v200;
  unsigned int *v201;
  unint64_t v202;
  void *v203;
  void *v204;
  unsigned int v205;
  int v206;
  unsigned int v207;
  uint64_t v208;
  id v209;
  const __CFString *v210;
  id v211;
  double v212;
  const __CFUUID *v213;
  __CFString *v214;
  void *v215;
  id v216;
  void *v217;
  void *v218;
  NSObject *v219;
  NSObject *v220;
  void *v221;
  void *v222;
  id v223;
  id v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  PanicReport *v232;
  id v233;
  id v234;
  unsigned int v235;
  unsigned int v236;
  unsigned int v237;
  unsigned int v238;
  id v239;
  _BOOL4 v240;
  char v241;
  int v242;
  BOOL v243;
  unsigned int v244;
  id v245;
  unint64_t v246;
  int v247;
  NSObject *v248;
  BOOL v249;
  int *v250;
  char *v251;
  NSObject *v252;
  void *v253;
  void *v254;
  const __CFAllocator *v255;
  const __CFAllocator *v256;
  void *v257;
  NSObject *v258;
  void *v259;
  id v260;
  CFAllocatorRef v261;
  ssize_t v262;
  void *v263;
  NSObject *v264;
  void *v265;
  NSObject *v266;
  int v267;
  int *v268;
  char *v269;
  io_iterator_t v270;
  uint64_t v271;
  const char *v272;
  NSObject *v273;
  uint32_t v274;
  NSObject *v275;
  void *v276;
  void *v277;
  const __CFString *v278;
  uint64_t v279;
  const __CFString *v280;
  id v281;
  void *v282;
  unsigned int v283;
  void *v284;
  NSObject *v285;
  NSObject *v286;
  id v287;
  id v288;
  void *v289;
  void *v290;
  unsigned int v291;
  id v292;
  void *v293;
  void *v294;
  id v295;
  void *v296;
  id v297;
  uint64_t v298;
  void *v299;
  BOOL v300;
  NSObject *v301;
  void *v302;
  id v303;
  void *v304;
  int v305;
  dev_t st_dev;
  NSObject *v307;
  _BOOL4 v308;
  void *v309;
  NSObject *v310;
  id v311;
  id v312;
  NSObject *v313;
  void *v314;
  id v315;
  const __CFString *v316;
  id v317;
  NSObject *v318;
  uint64_t v319;
  void *v320;
  id v321;
  id v322;
  void *v323;
  void *v324;
  id v325;
  void *v326;
  uint64_t v327;
  uint64_t j;
  char v329;
  char v330;
  UserCoreFileHandler *v331;
  UserCoreFileHandler *v332;
  NSObject *v333;
  id v334;
  FILE *v335;
  const __CFAllocator *v336;
  int *v337;
  void *v338;
  int v339;
  NSObject *v340;
  char *v341;
  NSObject *v342;
  id v343;
  const __CFString *v344;
  const __CFString *v345;
  int v346;
  id v347;
  uint64_t v348;
  void *k;
  int v350;
  __CFString *v351;
  void *v352;
  uint64_t v353;
  const __CFAllocator *v354;
  id v355;
  id v356;
  void *v357;
  NSObject *v358;
  void *v359;
  void *v360;
  void *v361;
  NSObject *v362;
  NSObject *v363;
  int v364;
  void *v365;
  KeyStore *v366;
  id v367;
  void *v368;
  NSObject *v369;
  uint64_t result;
  void *v371;
  const char *v372;
  const __CFString *v373;
  __CFString *v374;
  void *v375;
  unsigned int v376;
  NSObject *v377;
  id v378;
  id v379;
  void *v380;
  _BOOL4 v381;
  CFAllocatorRef v382;
  NSObject *v383;
  int *v384;
  char *v385;
  int *v386;
  char *v387;
  NSObject *v388;
  int *v389;
  char *v390;
  NSObject *v391;
  int *v392;
  char *v393;
  void *v394;
  NSObject *v395;
  void *v396;
  void *v397;
  NSObject *v398;
  int v399;
  NSObject *v400;
  void *v401;
  char v402;
  id v403;
  NSObject *v404;
  NSObject *v405;
  id v406;
  id v407;
  const void *v408;
  uint64_t v409;
  NSObject *v410;
  id v411;
  uint64_t v412;
  id v413;
  void *v414;
  void *v415;
  NSObject *v416;
  unsigned int v417;
  unsigned int v418;
  unsigned int v419;
  unsigned int v420;
  int *v421;
  void *v422;
  int v423;
  NSObject *v424;
  char *v425;
  NSObject *v426;
  id v427;
  id v428;
  NSObject *v429;
  int *v430;
  char *v431;
  const char *v432;
  int *v433;
  char *v434;
  uint64_t v435;
  void *v436;
  id v437;
  id v438;
  id v439;
  uint64_t v440;
  void *m;
  void *v442;
  void *v443;
  void *v444;
  __CFString *v445;
  __CFString *v446;
  __CFString *v447;
  __CFString *v448;
  __CFString *v449;
  uint64_t v450;
  void *v451;
  const __CFString *v452;
  const __CFString *v453;
  NSObject *v454;
  NSObject *v455;
  int *v456;
  char *v457;
  void *v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  NSObject *v466;
  int v467;
  int *v468;
  char *v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  void *v477;
  __CFString *v478;
  void *v479;
  id v480;
  id v481;
  unsigned int v482;
  void *v483;
  __CFString *v484;
  id v485;
  id v486;
  CFAllocatorRef v487;
  unsigned int *v488;
  __CFString *v489;
  void *v490;
  id v491;
  void *v492;
  void *v493;
  void *v494;
  void *v495;
  uint64_t v496;
  id v497;
  id v498;
  id obj;
  id obja;
  id objb;
  id v502;
  id v503;
  id v504;
  id v505;
  id v506;
  id v507;
  void *v508;
  id v509;
  id v510;
  id v511[6];
  _UNKNOWN **v512;
  _UNKNOWN **v513;
  _UNKNOWN **v514;
  void *v515;
  uint64_t v516;
  id v517;
  __CFDictionary *v518;
  uint8_t v519[12];
  unsigned int v520;
  CFMutableDictionaryRef properties[6];
  stat block;
  __int128 v523;
  __int128 v524;
  __int128 v525;
  __int128 v526;
  __int128 v527;
  _BYTE v528[31];
  id v529[2];
  id v530[2];
  _BYTE v531[26];
  __int16 v532;
  void *v533;
  __int16 v534;
  _BYTE v535[10];
  uint8_t buf[32];
  __int128 v537;
  __int128 v538;

  v494 = (void *)objc_claimAutoreleasedReturnValue(+[DumpPanicArgParser withArgs:count:](DumpPanicArgParser, "withArgs:count:", a2, a1));
  v6 = v494;
  if (objc_msgSend(v494, "help"))
  {
    objc_msgSend(v494, "usage");
    goto LABEL_3;
  }
  v8 = pthread_set_qos_class_self_np(QOS_CLASS_UTILITY, 0);
  if (v8)
  {
    v459 = _os_assert_log(v8);
    _os_crash(v459);
    __break(1u);
    goto LABEL_697;
  }
  v9 = os_log_create("com.apple.DumpPanic", "panicprocessing");
  v10 = (void *)qword_10003A5D8;
  qword_10003A5D8 = (uint64_t)v9;

  if (!qword_10003A5D8)
  {
LABEL_697:
    v460 = _os_assert_log(0);
    _os_crash(v460);
    __break(1u);
    goto LABEL_698;
  }
  v527 = 0u;
  memset(v528, 0, sizeof(v528));
  v525 = 0u;
  v526 = 0u;
  v523 = 0u;
  v524 = 0u;
  memset(&block, 0, sizeof(block));
  *(_QWORD *)v531 = 255;
  if (sysctlbyname("hw.osenvironment", &block, (size_t *)v531, 0, 0))
  {
    v11 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v85 = v11;
      v86 = __error();
      v87 = strerror(*v86);
      v88 = *__error();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v87;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v88;
      _os_log_error_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_ERROR, "failed to look up hw.osenvironment: %s(%d)", buf, 0x12u);

    }
    v12 = 0;
  }
  else
  {
    v13 = *(_QWORD *)&block.st_dev == 0x797265766F636572
       && *(_QWORD *)((char *)&block.st_dev + 3) == 0x736F797265766FLL;
    v12 = v13 || *(_QWORD *)&block.st_dev == 0x74736F6E67616964 && LODWORD(block.st_ino) == 7562089;
    v15 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = &block;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "found hw.osenvironment: %s", buf, 0xCu);
    }
  }
  byte_10003A540 = v12;
  v16 = dispatch_semaphore_create(0);
  v17 = (void *)qword_10003A538;
  qword_10003A538 = (uint64_t)v16;

  if (&_MKBGetDeviceLockState)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v19 = objc_claimAutoreleasedReturnValue(global_queue);
    v20 = notify_register_dispatch("com.apple.mobile.keybagd.lock_status", (int *)&unk_100039AC0, v19, &stru_100034B78);

    if (v20)
    {
      v21 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(block.st_dev) = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Unable to register for device lock state notification.", (uint8_t *)&block, 2u);
      }
    }
  }
  v22 = v494;
  if ((objc_msgSend(v494, "force_run") & 1) == 0)
  {
    memset(&block, 0, sizeof(block));
    if (!lstat("/var/run/com.apple.DumpPanic.finishedThisBoot", &block))
    {
      v25 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "DumpPanic has already finished running for current boot", buf, 2u);
        v25 = qword_10003A5D8;
      }
      v7 = 0;
      v6 = v494;
      if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        goto LABEL_571;
      LOWORD(block.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Use '-f/--force' to run DumpPanic manually", (uint8_t *)&block, 2u);
LABEL_3:
      v7 = 0;
LABEL_571:

      return v7;
    }
    v23 = *__error();
    v24 = qword_10003A5D8;
    if (v23 == 2)
    {
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No previous DumpPanic finish cookie", buf, 2u);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v391 = v24;
      v392 = __error();
      v393 = strerror(*v392);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "/var/run/com.apple.DumpPanic.finishedThisBoot";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v393;
      _os_log_error_impl((void *)&_mh_execute_header, v391, OS_LOG_TYPE_ERROR, "Failed to stat %s with error %s", buf, 0x16u);

    }
    v22 = v494;
  }
  if (!objc_msgSend(v22, "restoreos"))
    goto LABEL_44;
  v26 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/options");
  if (!v26)
  {
    v31 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(block.st_dev) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Error getting a reference to IODeviceTree:/options", (uint8_t *)&block, 2u);
    }
    v7 = 1;
LABEL_570:
    v6 = v494;
    goto LABEL_571;
  }
  CFProperty = IORegistryEntryCreateCFProperty(v26, CFSTR("ota-uuid"), kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    v28 = (void *)CFProperty;
    v29 = CFGetTypeID(CFProperty);
    if (v29 == CFDataGetTypeID())
    {
      v30 = objc_msgSend(v28, "mutableCopy");
      objc_msgSend(v30, "appendBytes:length:", &unk_10002A208, 1);
      v486 = v30;

    }
    else
    {
      v486 = 0;
    }
    CFRelease(v28);
  }
  else
  {
LABEL_44:
    v486 = 0;
  }
  v32 = (id)qword_10003A5D8;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(block.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "DumpPanic launched after boot to check for device panic data", (uint8_t *)&block, 2u);
  }

  Current = CFAbsoluteTimeGetCurrent();
  v487 = (CFAllocatorRef)mach_absolute_time();
  v33 = os_log_create("com.apple.DumpPanic", "socd");
  v34 = (void *)qword_10003A5C0;
  qword_10003A5C0 = (uint64_t)v33;

  if (qword_10003A5C0)
  {
    *(_QWORD *)buf = 0;
    v35 = os_log_create("com.apple.osanalytics.preoslog", "default");
    v36 = os_log_create("com.apple.osanalytics.preoslog", "buffer");
    v531[0] = 1;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(block.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Flush preoslog", (uint8_t *)&block, 2u);
    }
    if (sysctlbyname("kern.preoslog", 0, (size_t *)buf, v531, 1uLL))
    {
      if (*__error() == 2)
      {
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(block.st_dev) = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "kern.preoslog is not supported by this kernel", (uint8_t *)&block, 2u);
        }
      }
      else
      {
        v39 = v35;
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v386 = __error();
          v387 = strerror(*v386);
          block.st_dev = 136315138;
          *(_QWORD *)&block.st_mode = v387;
          _os_log_error_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "Couldn't obtain preoslog buffer size, result %s", (uint8_t *)&block, 0xCu);
        }

      }
      __error();
LABEL_69:

      rollAppleCareLogs();
      v496 = sub_100011BDC();
      v40 = objc_msgSend(v494, "restoreos");
      *(_QWORD *)&block.st_dev = _NSConcreteStackBlock;
      v5 = 3221225472;
      block.st_ino = 3221225472;
      *(_QWORD *)&block.st_uid = sub_100010AA4;
      *(_QWORD *)&block.st_rdev = &unk_100034BD8;
      LOBYTE(block.st_atimespec.tv_sec) = v40;
      if (qword_10003A560 == -1)
        goto LABEL_70;
      goto LABEL_699;
    }
    if (*(_QWORD *)buf)
    {
      v37 = (char *)malloc_type_malloc(*(size_t *)buf, 0x891CCA11uLL);
      if (v37)
      {
        if (sysctlbyname("kern.preoslog", v37, (size_t *)buf, 0, 0))
        {
          v38 = v35;
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v433 = __error();
            v434 = strerror(*v433);
            block.st_dev = 136315138;
            *(_QWORD *)&block.st_mode = v434;
            _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "Couldn't obtain preoslog buffer, sysctl failed with result %s", (uint8_t *)&block, 0xCu);
          }

          goto LABEL_599;
        }
        v89 = *(_DWORD *)v37;
        if (*(_DWORD *)v37 == 1280528208)
        {
          v90 = *(_QWORD *)buf;
          if (*(_QWORD *)buf == *((_DWORD *)v37 + 1))
          {
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              v91 = v37[12];
              v92 = "UNKNOWN";
              v93 = *((_DWORD *)v37 + 2);
              if (v91 == 1)
                v92 = "macefi";
              v94 = v37[13];
              v13 = v91 == 0;
              block.st_dev = 134284547;
              v95 = "iboot";
              if (!v13)
                v95 = v92;
              *(_QWORD *)&block.st_mode = v37;
              WORD2(block.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = v90;
              HIWORD(block.st_gid) = 1024;
              block.st_rdev = v93;
              *((_WORD *)&block.st_rdev + 2) = 2080;
              *(_QWORD *)((char *)&block.st_rdev + 6) = v95;
              HIWORD(block.st_atimespec.tv_sec) = 1024;
              LODWORD(block.st_atimespec.tv_nsec) = v94;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Found a valid preoslog buffer at va %{private}p, size %zu bytes, write offset %d, source %s, wrapped %d", (uint8_t *)&block, 0x2Cu);
            }
            v96 = v37 + 14;
            v97 = (*((_DWORD *)v37 + 2) + 1);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              block.st_dev = 134218240;
              *(_QWORD *)&block.st_mode = v37 + 14;
              WORD2(block.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = v97;
              _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Lower buffer is at va %p, size %zu bytes", (uint8_t *)&block, 0x16u);
            }
            v2 = (CFAllocatorRef)(*((unsigned int *)v37 + 1) - v97 - 14);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            {
              block.st_dev = 134218240;
              *(_QWORD *)&block.st_mode = &v96[v97];
              WORD2(block.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v2;
              _os_log_debug_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEBUG, "Upper buffer is at va %p, size %zu bytes", (uint8_t *)&block, 0x16u);
            }
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block.st_dev) = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Warning: preoslog log timestamps are not original, they are assigned later when the buffer is being flushed", (uint8_t *)&block, 2u);
            }
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block.st_dev) = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "preoslog dump begin", (uint8_t *)&block, 2u);
            }
            if (v37[13])
              sub_100010AEC(v36, &v96[v97], (uint64_t)v2);
            sub_100010AEC(v36, v37 + 14, v97);
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(block.st_dev) = 0;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "preoslog dump end", (uint8_t *)&block, 2u);
            }
            goto LABEL_599;
          }
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
LABEL_599:
            free(v37);
            goto LABEL_69;
          }
          LOWORD(block.st_dev) = 0;
          v272 = "Buffer size returned by sysctl doesn't match buffer size recorded in the header, preoslog buffer is corrupted";
          v273 = v35;
          v274 = 2;
        }
        else
        {
          if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            goto LABEL_599;
          block.st_dev = 67109376;
          *(_DWORD *)&block.st_mode = 1280528208;
          LOWORD(block.st_ino) = 1024;
          *(_DWORD *)((char *)&block.st_ino + 2) = v89;
          v272 = "Magic for preoslog buffer doesn't match, expected %08X, given %08X";
          v273 = v35;
          v274 = 14;
        }
        _os_log_error_impl((void *)&_mh_execute_header, v273, OS_LOG_TYPE_ERROR, v272, (uint8_t *)&block, v274);
        goto LABEL_599;
      }
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        goto LABEL_69;
      LOWORD(block.st_dev) = 0;
      v82 = "Failed to allocate memory for preoslog buffer";
    }
    else
    {
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        goto LABEL_69;
      LOWORD(block.st_dev) = 0;
      v82 = "preoslog buffer size is 0";
    }
    _os_log_error_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, v82, (uint8_t *)&block, 2u);
    goto LABEL_69;
  }
LABEL_698:
  v461 = _os_assert_log(0);
  _os_crash(v461);
  __break(1u);
LABEL_699:
  dispatch_once(&qword_10003A560, &block);
LABEL_70:
  v41 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  if (!v41)
  {
    v462 = _os_assert_log(0);
    _os_crash(v462);
    __break(1u);
    goto LABEL_701;
  }
  v493 = v41;

  v42 = sub_100016028("AppleDialogSPMIPMU", "IOPMUBootSOCD", "IOPMUBootSOCDClear", 0, 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
  if (v43)
  {
    objc_msgSend(v493, "addObjectsFromArray:", v43);
    v44 = qword_10003A5C0;
    if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_DEFAULT))
    {
      block.st_dev = 138412290;
      *(_QWORD *)&block.st_mode = CFSTR("AppleDialogSPMIPMU");
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "loaded socd data from: %@", (uint8_t *)&block, 0xCu);
    }
  }
  v45 = sub_100016028("AppleSMC", "socd-data", "remove-socd-data", "socd-data-in-progress", 0x32u);
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);

  if (v46)
  {
    objc_msgSend(v493, "addObjectsFromArray:", v46);
    v47 = qword_10003A5C0;
    if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_DEFAULT))
    {
      block.st_dev = 138412290;
      *(_QWORD *)&block.st_mode = CFSTR("AppleSMC");
      _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "loaded socd data from: %@", (uint8_t *)&block, 0xCu);
    }
  }
  v48 = objc_msgSend(v493, "count") == 0;

  v49 = (id)qword_10003A5D8;
  v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
  if (v48)
  {
    if (v50)
    {
      LOWORD(block.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "No socd data found in local device", (uint8_t *)&block, 2u);
    }
LABEL_98:

    goto LABEL_99;
  }
  if (v50)
  {
    LOWORD(block.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "socd data found in local device", (uint8_t *)&block, 2u);
  }

  if ((v496 & 1) != 0)
  {
    v51 = (id)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", &off_100037BE8));
    v52 = v493;
    v53 = v51;
    if (!v53)
    {
      v470 = _os_assert_log(0);
      v112 = (id)_os_crash(v470);
      __break(1u);
      goto LABEL_708;
    }
    v49 = v53;

    v54 = v52;
    v537 = 0u;
    v538 = 0u;
    memset(buf, 0, sizeof(buf));
    obj = v54;
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", buf, &block, 16);
    if (v55)
    {
      v56 = **(_QWORD **)&buf[16];
      while (2)
      {
        for (i = 0; i != v55; i = (char *)i + 1)
        {
          if (**(_QWORD **)&buf[16] != v56)
            objc_enumerationMutation(obj);
          v58 = *(void **)(*(_QWORD *)&buf[8] + 8 * (_QWORD)i);
          v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v49, "path"));
          v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
          v2 = (CFAllocatorRef)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "stringValue"));
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "stringByAppendingString:", v2));
          LOBYTE(v58) = objc_msgSend(v58, "writeToFile:atomically:", v61, 1);

          if ((v58 & 1) == 0)
          {
            v62 = qword_10003A5C0;
            if (os_log_type_enabled((os_log_t)qword_10003A5C0, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v531 = 138412290;
              *(_QWORD *)&v531[4] = v49;
              _os_log_error_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_ERROR, "unable to write socd data to file: %@", v531, 0xCu);
            }

            v63 = (id)qword_10003A5D8;
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              block.st_dev = 138412290;
              *(_QWORD *)&block.st_mode = v49;
              _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "failed to write socd data to file: %@", (uint8_t *)&block, 0xCu);
            }

            goto LABEL_98;
          }
        }
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", buf, &block, 16);
        if (v55)
          continue;
        break;
      }
    }

    goto LABEL_98;
  }
LABEL_99:
  v512 = &off_100037858;
  v513 = &off_100037858;
  v514 = &off_100037858;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v515 = v64;
  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v516 = (uint64_t)v65;
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", 0));
  v517 = v66;
  if (!access("/var/run/com.apple.DumpPanic.finishedPMUFaultHandling", 0))
  {
    v76 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(block.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "PMU fault data already processed this boot", (uint8_t *)&block, 2u);
    }
    goto LABEL_109;
  }
  if (*__error() != 2)
  {
    v78 = (void *)qword_10003A5D8;
    v77 = 0;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_154;
    v79 = v78;
    v80 = __error();
    v81 = strerror(*v80);
    block.st_dev = 136315394;
    *(_QWORD *)&block.st_mode = "/var/run/com.apple.DumpPanic.finishedPMUFaultHandling";
    WORD2(block.st_ino) = 2080;
    *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v81;
    _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "failed to check whether PMU fault data has been processed using access(%s, O_RDONLY) returned: %s", (uint8_t *)&block, 0x16u);

    goto LABEL_120;
  }
  v67 = IOServiceMatching("IOService");
  v68 = v67;
  if (!v67)
  {
    v83 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
LABEL_120:
      v77 = 0;
      goto LABEL_154;
    }
    LOWORD(block.st_dev) = 0;
    v84 = "Failed to allocate matching dictionary to match against PMU";
LABEL_651:
    _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, v84, (uint8_t *)&block, 2u);
    goto LABEL_120;
  }
  CFDictionarySetValue(v67, CFSTR("IOPropertyMatch"), &off_100037A98);
  LODWORD(obj) = IOServiceGetMatchingService(kIOMainPortDefault, v68);
  if (!(_DWORD)obj)
  {
    v83 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      goto LABEL_120;
    LOWORD(block.st_dev) = 0;
    v84 = "Failed to locate primary PMU service";
    goto LABEL_651;
  }
  v69 = IOServiceMatching("IOService");
  v70 = v69;
  if (!v69)
  {
    v98 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      goto LABEL_142;
    LOWORD(block.st_dev) = 0;
    v73 = "Failed to allocate matching dictionary to match against PMU";
    goto LABEL_684;
  }
  CFDictionarySetValue(v69, CFSTR("IOPropertyMatch"), &off_100037AC0);
  *(_DWORD *)buf = 0;
  MatchingServices = IOServiceGetMatchingServices(kIOMainPortDefault, v70, (io_iterator_t *)buf);
  if (!MatchingServices)
  {
    v270 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
    {
      while (IOIteratorIsValid(v270))
      {
        while (1)
        {
          v271 = IOIteratorNext(*(io_iterator_t *)buf);
          v77 = v271;
          if (!(_DWORD)v271)
            break;
          if ((_DWORD)v271 != (_DWORD)obj)
            goto LABEL_143;
        }
        if (IOIteratorIsValid(*(io_iterator_t *)buf))
          break;
        IOIteratorReset(*(io_iterator_t *)buf);
        v270 = *(_DWORD *)buf;
      }
      goto LABEL_142;
    }
    v98 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
      goto LABEL_142;
    LOWORD(block.st_dev) = 0;
    v73 = "IOService match returned an empty iterator for PMU services";
LABEL_684:
    v74 = v98;
    v75 = 2;
    goto LABEL_685;
  }
  v72 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    block.st_dev = 67109120;
    *(_DWORD *)&block.st_mode = MatchingServices;
    v73 = "Failed to get matching PMU ioservices: 0x%x";
    v74 = v72;
    v75 = 8;
LABEL_685:
    _os_log_error_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, v73, (uint8_t *)&block, v75);
  }
LABEL_142:
  v77 = 0;
LABEL_143:
  properties[0] = 0;
  v2 = kCFAllocatorDefault;
  if (!IORegistryEntryCreateCFProperties((io_registry_entry_t)obj, properties, kCFAllocatorDefault, 0))
  {
    Value = CFDictionaryGetValue(properties[0], CFSTR("IOPMUBootErrorPanicCount"));
    v512 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(Value);

    v101 = CFDictionaryGetValue(properties[0], CFSTR("IOPMUBootErrorFailCount"));
    v513 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v101);

    v102 = CFDictionaryGetValue(properties[0], CFSTR("IOPMUBootErrorStage"));
    v514 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v102);

    v103 = CFDictionaryGetValue(properties[0], CFSTR("IOPMUBootErrorAppName"));
    v104 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(v103);
    v105 = off_100039B48;
    off_100039B48 = v104;

    v106 = CFDictionaryGetValue(properties[0], CFSTR("IOPMUBootFaultInfo"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(v106);
    v515 = v107;

    if ((_DWORD)v77)
    {
      *(_QWORD *)buf = 0;
      if (IORegistryEntryCreateCFProperties(v77, (CFMutableDictionaryRef *)buf, kCFAllocatorDefault, 0))
      {
        v108 = qword_10003A5D8;
        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
        {
          LOWORD(block.st_dev) = 0;
          _os_log_error_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_ERROR, "unable to read out auxiliary PMU properties", (uint8_t *)&block, 2u);
        }
        IOObjectRelease((io_object_t)obj);
        IOObjectRelease(v77);
        goto LABEL_153;
      }
      v408 = CFDictionaryGetValue(*(CFDictionaryRef *)buf, CFSTR("IOPMUBootFaultInfo"));
      v409 = objc_claimAutoreleasedReturnValue(v408);
      v516 = v409;

      v410 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        block.st_dev = 138412290;
        *(_QWORD *)&block.st_mode = v409;
        _os_log_impl((void *)&_mh_execute_header, v410, OS_LOG_TYPE_DEFAULT, "read out auxiliary PMU fault data: boot fault info: %@", (uint8_t *)&block, 0xCu);
      }
    }
    v411 = objc_alloc_init((Class)NSMutableArray);
    v517 = v411;

    v537 = 0u;
    v538 = 0u;
    memset(buf, 0, sizeof(buf));
    v374 = v107;
    v343 = -[__CFString countByEnumeratingWithState:objects:count:](v374, "countByEnumeratingWithState:objects:count:", buf, &block, 16);
    if (v343)
    {
      v2 = 0;
      v412 = **(_QWORD **)&buf[16];
      do
      {
        for (j = 0; (id)j != v343; ++j)
        {
          if (**(_QWORD **)&buf[16] != v412)
            objc_enumerationMutation(v374);
          v194 = *(id *)(*(_QWORD *)&buf[8] + 8 * j);

          v2 = (CFAllocatorRef)v194;
          if ((-[NSObject containsString:](v194, "containsString:", CFSTR(",")) & 1) != 0)
          {
            v413 = -[NSObject rangeOfString:](v194, "rangeOfString:", CFSTR(","));
            if (v413 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v435 = _os_assert_log(0);
              _os_crash(v435);
              __break(1u);
              goto LABEL_655;
            }
            v411 = v517;
            v414 = (void *)objc_claimAutoreleasedReturnValue(-[__CFAllocator substringToIndex:](v2, "substringToIndex:", v413));
            objc_msgSend(v517, "addObject:", v414);

          }
          else
          {
            v411 = v517;
            objc_msgSend(v517, "addObject:", v2);
          }
        }
        v343 = -[__CFString countByEnumeratingWithState:objects:count:](v374, "countByEnumeratingWithState:objects:count:", buf, &block, 16);
      }
      while (v343);

    }
    sub_10001138C((io_registry_entry_t)obj);
    sub_10001138C(v77);
    IOObjectRelease((io_object_t)obj);
    if ((_DWORD)v77)
      IOObjectRelease(v77);
    v415 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      v416 = v415;
      v417 = objc_msgSend(v512, "intValue");
      v418 = objc_msgSend(v513, "intValue");
      v419 = objc_msgSend(v514, "intValue");
      v420 = objc_msgSend(off_100039B48, "intValue");
      *(_DWORD *)v531 = 67110402;
      *(_DWORD *)&v531[4] = v417;
      *(_WORD *)&v531[8] = 1024;
      *(_DWORD *)&v531[10] = v418;
      *(_WORD *)&v531[14] = 1024;
      *(_DWORD *)&v531[16] = v419;
      *(_WORD *)&v531[20] = 1024;
      *(_DWORD *)&v531[22] = v420;
      v532 = 2112;
      v533 = v515;
      v534 = 2112;
      *(_QWORD *)v535 = v411;
      _os_log_impl((void *)&_mh_execute_header, v416, OS_LOG_TYPE_DEFAULT, "read out PMU fault data: resetCount: %d, bootFailCount: %d, boot stage: 0x%x, boot app hash: %d, boot faults: %@, universal boot faults: %@:", v531, 0x2Eu);

    }
    if ((creat("/var/run/com.apple.DumpPanic.finishedPMUFaultHandling", 0x100u) & 0x80000000) == 0)
      goto LABEL_634;
    v421 = __error();
    v422 = (void *)qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      v423 = *v421;
      v424 = v422;
      v425 = strerror(v423);
      *(_DWORD *)v531 = 136315394;
      *(_QWORD *)&v531[4] = "/var/run/com.apple.DumpPanic.finishedPMUFaultHandling";
      *(_WORD *)&v531[12] = 2080;
      *(_QWORD *)&v531[14] = v425;
      _os_log_error_impl((void *)&_mh_execute_header, v424, OS_LOG_TYPE_ERROR, "failed to creat() PMU fault data processed cookie at path %s with error %s", v531, 0x16u);

LABEL_634:
      v77 = 1;
      goto LABEL_154;
    }
LABEL_109:
    v77 = 1;
    goto LABEL_154;
  }
  v99 = qword_10003A5D8;
  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
  {
    LOWORD(block.st_dev) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_ERROR, "unable to read out primary PMU properties", (uint8_t *)&block, 2u);
  }
  IOObjectRelease((io_object_t)obj);
  if ((_DWORD)v77)
  {
    IOObjectRelease(v77);
LABEL_153:
    v77 = 0;
  }
LABEL_154:
  v109 = (id)qword_10003A5D8;
  v110 = os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT);
  if (!(_DWORD)v77)
  {
    if (v110)
    {
      LOWORD(block.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "No boot fault data found in local device", (uint8_t *)&block, 2u);
    }
    goto LABEL_177;
  }
  if (v110)
  {
    LOWORD(block.st_dev) = 0;
    _os_log_impl((void *)&_mh_execute_header, v109, OS_LOG_TYPE_DEFAULT, "boot fault data found in local device", (uint8_t *)&block, 2u);
  }

  if ((v496 & 1) != 0)
  {
    v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", &off_100037C00));
    sub_10001149C(v511, (id *)&v512);
    v109 = v111;
    v112 = v511[0];
    if (v112)
    {
      v113 = v112;

      v114 = v511[1];
      if (v114)
      {
        v115 = (__darwin_ino64_t)v114;

        v116 = v511[2];
        if (v116)
        {
          v117 = v116;

          v118 = v511[3];
          if (v118)
          {
            v119 = v118;

            v120 = v511[5];
            if (v120)
            {
              v121 = (__darwin_time_t)v120;

              *(_QWORD *)buf = CFSTR("resetCount");
              *(_QWORD *)&buf[8] = CFSTR("bootFailCount");
              *(_QWORD *)&block.st_dev = v113;
              block.st_ino = v115;
              *(_QWORD *)&buf[16] = CFSTR("bootStage");
              *(_QWORD *)&buf[24] = CFSTR("rawBootFaults");
              *(_QWORD *)&block.st_uid = v117;
              *(_QWORD *)&block.st_rdev = v119;
              *(_QWORD *)&v537 = CFSTR("universalBootFaults");
              block.st_atimespec.tv_sec = v121;
              v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &block, buf, 5));
              properties[0] = 0;
              v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization dataWithJSONObject:options:error:](NSJSONSerialization, "dataWithJSONObject:options:error:", v122, 0, properties));
              v77 = properties[0];
              if (v77 || !v123)
              {
                v126 = qword_10003A5D8;
                if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                  goto LABEL_174;
                *(_DWORD *)v531 = 138412290;
                *(_QWORD *)&v531[4] = v77;
                v127 = "unable to serialize json: %@";
              }
              else
              {
                v124 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject path](v109, "path"));
                v125 = objc_msgSend(v123, "writeToFile:atomically:", v124, 1);

                v126 = qword_10003A5D8;
                if ((v125 & 1) != 0)
                {
                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)v531 = 138412290;
                    *(_QWORD *)&v531[4] = v109;
                    _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEFAULT, "wrote boot fault data to: %@", v531, 0xCu);
                  }

                  sub_100011344(v511);
LABEL_177:

                  goto LABEL_178;
                }
                if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                {
LABEL_174:

                  sub_100011344(v511);
                  v128 = (id)qword_10003A5D8;
                  if (os_log_type_enabled(v128, OS_LOG_TYPE_DEFAULT))
                  {
                    block.st_dev = 138412290;
                    *(_QWORD *)&block.st_mode = v109;
                    _os_log_impl((void *)&_mh_execute_header, v128, OS_LOG_TYPE_DEFAULT, "failed to write boot fault data to file: %@", (uint8_t *)&block, 0xCu);
                  }

                  goto LABEL_177;
                }
                *(_DWORD *)v531 = 138412290;
                *(_QWORD *)&v531[4] = v109;
                v127 = "unable to write json to file: %@";
              }
              _os_log_error_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_ERROR, v127, v531, 0xCu);
              goto LABEL_174;
            }
LABEL_712:
            v475 = _os_assert_log(v120);
            _os_crash(v475);
            __break(1u);
            goto LABEL_713;
          }
LABEL_711:
          v474 = _os_assert_log(v118);
          v120 = (id)_os_crash(v474);
          __break(1u);
          goto LABEL_712;
        }
LABEL_710:
        v473 = _os_assert_log(v116);
        v118 = (id)_os_crash(v473);
        __break(1u);
        goto LABEL_711;
      }
LABEL_709:
      v472 = _os_assert_log(v114);
      v116 = (id)_os_crash(v472);
      __break(1u);
      goto LABEL_710;
    }
LABEL_708:
    v471 = _os_assert_log(v112);
    v114 = (id)_os_crash(v471);
    __break(1u);
    goto LABEL_709;
  }
LABEL_178:
  memset(&block, 0, sizeof(block));
  v129 = IORegistryEntryFromPath(kIOMainPortDefault, "IODeviceTree:/defaults");
  v130 = &unk_10003A000;
  v131 = v129;
  v132 = &unk_10003A000;
  if (!v129)
  {
    v134 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_ERROR, "Error getting a reference to IODeviceTree:/defaults", buf, 2u);
    }
    goto LABEL_194;
  }
  v133 = IORegistryEntryCreateCFProperty(v129, CFSTR("supported-legacy-panic-flow"), kCFAllocatorDefault, 0);
  if (v133)
  {
    byte_10003A598 = 1;
    CFRelease(v133);
  }
  IOObjectRelease(v131);
  if ((byte_10003A598 & 1) == 0)
  {
    v134 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_194;
    *(_WORD *)buf = 0;
    v137 = "Device tree indicates that device never supported legacy panic path";
LABEL_192:
    v138 = v134;
    goto LABEL_193;
  }
  v134 = "/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed";
  if (!lstat("/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed", &block))
  {
    v134 = qword_10003A5D8;
    if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      goto LABEL_194;
    *(_WORD *)buf = 0;
    v137 = "Device supported legacy panic path, file marker found";
    goto LABEL_192;
  }
  v135 = *__error();
  v77 = qword_10003A5D8;
  v136 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
  if (v135 != 2)
  {
    if (v136)
    {
      v77 = (uint64_t)(id)v77;
      v250 = __error();
      v251 = strerror(*v250);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed";
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v251;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v77, OS_LOG_TYPE_DEFAULT, "Failed to stat %s with error %s", buf, 0x16u);

    }
    goto LABEL_194;
  }
  if (v136)
  {
    *(_WORD *)buf = 0;
    v137 = "Device supported legacy panic path, no existing marker file found";
    v138 = v77;
LABEL_193:
    _os_log_impl((void *)&_mh_execute_header, v138, OS_LOG_TYPE_DEFAULT, v137, buf, 2u);
  }
LABEL_194:
  if (!AppleNVMeDeviceSupportsPanicLogAccess())
  {
    v530[0] = 0;
    AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("PanicDev"), CFSTR("com.apple.DumpPanic"), 0);
    if (AppIntegerValue >= 1)
      v146 = AppIntegerValue;
    else
      v146 = 15;
    v147 = 1;
    while (1)
    {
      v148 = IOServiceMatching("IOMedia");
      *(_QWORD *)v531 = CFSTR("IOPropertyMatch");
      *(_QWORD *)buf = &off_100037AE8;
      CFDictionarySetValue(v148, CFSTR("IOParentMatch"), +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v531, 1));
      MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v148);
      v150 = MatchingService;
      if (MatchingService)
      {
        properties[0] = 0;
        if (IORegistryEntryCreateCFProperties(MatchingService, properties, kCFAllocatorDefault, 0))
        {
          IOObjectRelease(v150);
        }
        else
        {
          v151 = (const __CFString *)CFDictionaryGetValue(properties[0], CFSTR("BSD Name"));
          v152 = (const __CFBoolean *)CFDictionaryGetValue(properties[0], CFSTR("Whole"));
          if (v151 && v152 == kCFBooleanTrue)
          {
            CFStringGetCString(v151, &aDevRdiskx[6], 74, 0x8000100u);
            v132 = (_BYTE *)&unk_10003A000;
            v252 = qword_10003A5D8;
            if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
            {
              block.st_dev = 136315138;
              *(_QWORD *)&block.st_mode = aDevRdiskx;
              _os_log_impl((void *)&_mh_execute_header, v252, OS_LOG_TYPE_DEFAULT, "Matched registered panic device: %s", (uint8_t *)&block, 0xCu);
            }
            CFRelease(properties[0]);
            IOObjectRelease(v150);
            v253 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", aDevRdiskx));
            v254 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v253));

            if (!v254)
            {
LABEL_217:
              v130 = &unk_10003A000;
              v154 = qword_10003A5D8;
              if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
              {
                LOWORD(block.st_dev) = 0;
                _os_log_impl((void *)&_mh_execute_header, v154, OS_LOG_TYPE_DEFAULT, "This device does not support the AppleNVMeDevice API and no paniclog block device was found.", (uint8_t *)&block, 2u);
              }
              v142 = 0;
              goto LABEL_220;
            }
            v77 = v254;

            v530[0] = 0;
            v255 = (const __CFAllocator *)malloc_type_valloc(0x240000uLL, 0x5D8CBCE0uLL);
            v256 = v255;
            if (v255)
            {
              bzero(v255, 0x240000uLL);
              v530[0] = 0;
              v257 = (void *)qword_10003A5D8;
              v2 = v256;
              if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
              {
                v258 = v257;
                v259 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v77, "path"));
                block.st_dev = 138412290;
                *(_QWORD *)&block.st_mode = v259;
                _os_log_impl((void *)&_mh_execute_header, v258, OS_LOG_TYPE_DEFAULT, "Opening paniclog path '%@'\n", (uint8_t *)&block, 0xCu);

              }
              v260 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v77, "path")));
              LODWORD(v140) = open((const char *)objc_msgSend(v260, "UTF8String"), 0);

              if ((v140 & 0x80000000) != 0)
              {
                v380 = (void *)qword_10003A5D8;
                v381 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR);
                v382 = v2;
                if (v381)
                {
                  v455 = v380;
                  v456 = __error();
                  v457 = strerror(*v456);
                  v458 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v77, "path"));
                  block.st_dev = 136315394;
                  *(_QWORD *)&block.st_mode = v457;
                  WORD2(block.st_ino) = 2112;
                  *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v458;
                  _os_log_error_impl((void *)&_mh_execute_header, v455, OS_LOG_TYPE_ERROR, "ERROR: '%s' when opening '%@'", (uint8_t *)&block, 0x16u);

                  v382 = v2;
                }
                free(v382);
                v261 = 0;
                goto LABEL_649;
              }
              v261 = v2;
              v262 = pread(v140, v2, 0x240000uLL, 0);
              v263 = (void *)v262;
              if (v262 == -1)
              {
                if (*__error() == 22)
                {
                  v394 = (void *)qword_10003A5D8;
                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                  {
                    v395 = v394;
                    v396 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v77, "path"));
                    block.st_dev = 138412290;
                    *(_QWORD *)&block.st_mode = v396;
                    _os_log_impl((void *)&_mh_execute_header, v395, OS_LOG_TYPE_DEFAULT, "No panic data detected from '%@'", (uint8_t *)&block, 0xCu);

                    v261 = v2;
                  }
                  free(v261);
                  v261 = 0;
                  goto LABEL_648;
                }
              }
              else if ((v262 & 0x8000000000000000) == 0)
              {
                v264 = qword_10003A5D8;
                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                {
                  block.st_dev = 134217984;
                  *(_QWORD *)&block.st_mode = v263;
                  _os_log_impl((void *)&_mh_execute_header, v264, OS_LOG_TYPE_DEFAULT, "Read %ld bytes from panic device", (uint8_t *)&block, 0xCu);
                }
                v530[0] = v263;
                LODWORD(properties[0]) = 0;
                if (ioctl(v140, 0x40046418uLL, properties))
                {
                  v265 = (void *)qword_10003A5D8;
                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                  {
                    v266 = v265;
                    v267 = *__error();
                    v268 = __error();
                    v269 = strerror(*v268);
                    block.st_dev = 67109378;
                    *(_DWORD *)&block.st_mode = v267;
                    LOWORD(block.st_ino) = 2080;
                    *(__darwin_ino64_t *)((char *)&block.st_ino + 2) = (__darwin_ino64_t)v269;
                    _os_log_error_impl((void *)&_mh_execute_header, v266, OS_LOG_TYPE_ERROR, "Failed to query disk block size -- DKIOCGETBLOCKSIZE failed with %d : %s", (uint8_t *)&block, 0x12u);

                    goto LABEL_597;
                  }
LABEL_648:
                  close(v140);
LABEL_649:

                  v130 = &unk_10003A000;
                  v142 = v261;
LABEL_220:
                  v155 = v530[0];
                  if (v530[0])
                  {
                    v156 = 0;
                    v157 = 0;
                    do
                      v157 |= (v156++)[(_QWORD)v142];
                    while (v530[0] != v156);
                    if (v530[0] >= (id)8 && v157)
                      goto LABEL_235;
                  }
                  free(v142);
                  v158 = v530[0];
                  if (v530[0])
                  {
                    v159 = *((_QWORD *)v130 + 187);
                    v160 = os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT);
                    if ((unint64_t)v158 <= 7)
                    {
                      if (v160)
                      {
                        block.st_dev = 134218240;
                        *(_QWORD *)&block.st_mode = v158;
                        WORD2(block.st_ino) = 2048;
                        *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = 8;
                        v161 = "%llu bytes were read from the file or device, but at least %lu are required to fit the iB"
                               "oot panic header.";
                        v162 = v159;
                        v163 = 22;
                        goto LABEL_233;
                      }
LABEL_234:
                      v142 = 0;
                      v155 = 0;
LABEL_235:
                      v488 = (unsigned int *)v142;
                      v491 = v155;
                      if (v132[1432] == 1)
                      {
                        if (mkdir("/var/root/Library/Application Support/DumpPanic/", 0x1A4u) && *__error() != 17)
                        {
                          v167 = *((_QWORD *)v130 + 187);
                          if (!os_log_type_enabled(v167, OS_LOG_TYPE_ERROR))
                            goto LABEL_245;
                          v168 = v167;
                          v169 = __error();
                          v170 = strerror(*v169);
                          block.st_dev = 136315394;
                          *(_QWORD *)&block.st_mode = "/var/root/Library/Application Support/DumpPanic/";
                          WORD2(block.st_ino) = 2080;
                          *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v170;
                          _os_log_error_impl((void *)&_mh_execute_header, v168, OS_LOG_TYPE_ERROR, "Failed to create directory: %s with error: %s", (uint8_t *)&block, 0x16u);

                        }
                        else
                        {
                          v165 = open_dprotected_np("/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed", 520, 4, 0, 420);
                          v166 = *((_QWORD *)v130 + 187);
                          if (v165 != -1)
                          {
                            if (os_log_type_enabled(v166, OS_LOG_TYPE_DEFAULT))
                            {
                              block.st_dev = 136315138;
                              *(_QWORD *)&block.st_mode = "/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed";
                              _os_log_impl((void *)&_mh_execute_header, v166, OS_LOG_TYPE_DEFAULT, "Created legacy panic data marker file: %s", (uint8_t *)&block, 0xCu);
                            }
                            close(v165);
                            goto LABEL_245;
                          }
                          if (!os_log_type_enabled(v166, OS_LOG_TYPE_ERROR))
                            goto LABEL_245;
                          v429 = v166;
                          v430 = __error();
                          v431 = strerror(*v430);
                          block.st_dev = 136315394;
                          *(_QWORD *)&block.st_mode = "/var/root/Library/Application Support/DumpPanic/LegacyDataProcessed";
                          WORD2(block.st_ino) = 2080;
                          *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v431;
                          _os_log_error_impl((void *)&_mh_execute_header, v429, OS_LOG_TYPE_ERROR, "Failed to create file: %s with error: %s", (uint8_t *)&block, 0x16u);

                        }
                        v130 = &unk_10003A000;
                      }
LABEL_245:
                      v171 = *((id *)v130 + 187);
                      v172 = os_log_type_enabled(v171, OS_LOG_TYPE_DEFAULT);
                      if (v142)
                      {
                        if (v172)
                        {
                          block.st_dev = 134217984;
                          *(_QWORD *)&block.st_mode = v155;
                          _os_log_impl((void *)&_mh_execute_header, v171, OS_LOG_TYPE_DEFAULT, "0x%llx bytes of paniclog data found in local device", (uint8_t *)&block, 0xCu);
                        }

                        if ((v496 & 1) != 0 && v155)
                        {
                          v171 = objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPathComponents:](NSURL, "fileURLWithPathComponents:", &off_100037C18));
                          if (!sub_100011EA8(v171, v142, (size_t)v155))
                          {
                            v173 = (id)qword_10003A5D8;
                            if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                            {
                              block.st_dev = 138412290;
                              *(_QWORD *)&block.st_mode = v171;
                              _os_log_impl((void *)&_mh_execute_header, v173, OS_LOG_TYPE_DEFAULT, "failed to write paniclog data to file: %@", (uint8_t *)&block, 0xCu);
                            }

                          }
                          goto LABEL_256;
                        }
                      }
                      else
                      {
                        if (v172)
                        {
                          LOWORD(block.st_dev) = 0;
                          _os_log_impl((void *)&_mh_execute_header, v171, OS_LOG_TYPE_DEFAULT, "No paniclog data found in local device", (uint8_t *)&block, 2u);
                        }
LABEL_256:

                      }
                      v495 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                      v174 = CFSTR("/private/var/db/DumpPanic");
                      v175 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                      properties[0] = 0;
                      v492 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "contentsOfDirectoryAtPath:error:", CFSTR("/private/var/db/DumpPanic"), properties));
                      v176 = properties[0];
                      if (!v492)
                      {
                        v193 = qword_10003A5D8;
                        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                        {
                          block.st_dev = 138412290;
                          *(_QWORD *)&block.st_mode = v176;
                          _os_log_error_impl((void *)&_mh_execute_header, v193, OS_LOG_TYPE_ERROR, "Failed to enumerate the contents of the sandbox directory: %@", (uint8_t *)&block, 0xCu);
                        }
                        goto LABEL_282;
                      }
                      v537 = 0u;
                      v538 = 0u;
                      memset(buf, 0, sizeof(buf));
                      obja = v492;
                      v177 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", buf, &block, 16);
                      if (!v177)
                        goto LABEL_279;
                      v178 = **(_QWORD **)&buf[16];
                      while (2)
                      {
                        v179 = 0;
LABEL_261:
                        if (**(_QWORD **)&buf[16] != v178)
                          objc_enumerationMutation(obja);
                        v180 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@/%@"), CFSTR("/private/var/db/DumpPanic"), *(_QWORD *)(*(_QWORD *)&buf[8] + 8 * v179)));
                        v530[0] = v176;
                        v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v175, "attributesOfItemAtPath:error:", v180, v530));
                        v182 = (__CFDictionary *)v530[0];

                        if (v181)
                        {
                          v183 = (NSFileAttributeType)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "fileType"));
                          v184 = v183 == NSFileTypeDirectory;

                          if (v184)
                          {
                            v176 = v182;
                          }
                          else
                          {
                            v185 = qword_10003A5D8;
                            if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                            {
                              *(_DWORD *)v531 = 138412290;
                              *(_QWORD *)&v531[4] = v180;
                              _os_log_impl((void *)&_mh_execute_header, v185, OS_LOG_TYPE_DEFAULT, "Removing non-directory entry '%@'", v531, 0xCu);
                            }
                            v518 = v182;
                            v186 = objc_msgSend(v175, "removeItemAtPath:error:", v180, &v518);
                            v176 = v518;

                            if ((v186 & 1) == 0)
                            {
                              v187 = qword_10003A5D8;
                              if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                              {
                                *(_DWORD *)v531 = 138412546;
                                *(_QWORD *)&v531[4] = v180;
                                *(_WORD *)&v531[12] = 2112;
                                *(_QWORD *)&v531[14] = v176;
                                v188 = v187;
                                v189 = "Failed to remove non-directory entry '%@'. Error: %@";
                                goto LABEL_275;
                              }
                            }
                          }
                        }
                        else
                        {
                          v190 = qword_10003A5D8;
                          if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)v531 = 138412546;
                            *(_QWORD *)&v531[4] = v180;
                            *(_WORD *)&v531[12] = 2112;
                            *(_QWORD *)&v531[14] = v182;
                            _os_log_error_impl((void *)&_mh_execute_header, v190, OS_LOG_TYPE_ERROR, "Failed to gather the file attributes for '%@'. Error: %@", v531, 0x16u);
                          }
                          v529[0] = v182;
                          v191 = objc_msgSend(v175, "removeItemAtPath:error:", v180, v529);
                          v176 = (__CFDictionary *)v529[0];

                          if ((v191 & 1) == 0)
                          {
                            v192 = qword_10003A5D8;
                            if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                            {
                              *(_DWORD *)v531 = 138412546;
                              *(_QWORD *)&v531[4] = v180;
                              *(_WORD *)&v531[12] = 2112;
                              *(_QWORD *)&v531[14] = v176;
                              v188 = v192;
                              v189 = "Failed to remove inaccessible entry '%@'. Error: %@";
LABEL_275:
                              _os_log_error_impl((void *)&_mh_execute_header, v188, OS_LOG_TYPE_ERROR, v189, v531, 0x16u);
                            }
                          }
                        }

                        if (v177 == (id)++v179)
                        {
                          v177 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", buf, &block, 16);
                          if (!v177)
                          {
LABEL_279:

LABEL_282:
                            if (!v492)
                            {
                              v490 = 0;
                              v200 = &unk_10003A000;
                              v201 = v488;
                              v202 = (unint64_t)v155;
                              goto LABEL_302;
                            }
                            v194 = objc_autoreleasePoolPush();
                            if (qword_10003A5A0 != -1)
                              goto LABEL_704;
                            while (2)
                            {
                              v195 = (void *)objc_claimAutoreleasedReturnValue(+[CoreFileHandler coreFileWithCoreFilePath::::](CoreFileHandler, "coreFileWithCoreFilePath::::", off_100039BA0, 1, 0, qword_10003A5D8));
                              if (v195)
                              {
                                v196 = _os_feature_enabled_impl("OSAnalytics", "forceSeedFeedbackPrompting");
                                if (v196)
                                  v197 = "/private/var/db/DumpPanic/Coredumps";
                                else
                                  v197 = "/private/var/mobile/Library/Logs/CrashReporter/Panics";
                                if (v196)
                                  v198 = 1;
                                else
                                  v198 = 3;
                                v199 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "saveKernelCoreToDisk:::::", v197, v198, 0, 0, Current));
                                if (v199)
                                  objc_msgSend(v495, "addObjectsFromArray:", v199);
                                if (v491
                                  || sub_100010480()
                                  && !os_parse_boot_arg_int("-interrupted_coredump_paniclog", 0))
                                {
                                  v490 = 0;
                                }
                                else
                                {
                                  free(v488);
                                  v490 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "getPanicRegion"));
                                  v488 = 0;
                                }

                              }
                              else
                              {
                                v490 = 0;
                              }

                              objc_autoreleasePoolPop(v194);
                              v200 = &unk_10003A000;
                              v201 = v488;
                              v202 = (unint64_t)v491;
LABEL_302:
                              if (v202 || v490)
                              {
                                v203 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v494, "output_dir"));
                                v509 = 0;
                                v510 = 0;
                                sub_1000126A0(v201, v202, v203, v487, v486, (PanicReport *)&v510, (uint64_t *)&v509, v493, Current, v490);
                                v498 = v510;
                                v497 = v509;

                              }
                              else
                              {
                                v498 = 0;
                                v497 = 0;
                              }
                              sub_10001149C(&v504, (id *)&v512);
                              objb = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v494, "output_dir"));
                              sub_10001149C(v531, &v504);
                              v204 = *(void **)v531;
                              v205 = objc_msgSend(*(id *)v531, "intValue");
                              v206 = objc_msgSend(*(id *)&v531[8], "intValue") + v205;
                              if (v206 > 1)
                              {
                                v207 = 8;
                                goto LABEL_318;
                              }
                              v208 = *(_QWORD *)&v535[2];
                              if (objc_msgSend(*(id *)&v535[2], "count"))
                              {
                                v209 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithArray:", v208);
                                if (objc_msgSend(v209, "containsObject:", CFSTR("rst")))
                                  objc_msgSend(v209, "removeObject:", CFSTR("rst"));
                                if (objc_msgSend(v209, "count") && (unint64_t)objc_msgSend(v209, "count") <= 1)
                                {
                                  if (objc_msgSend(v209, "containsObject:", CFSTR("wdog")))
                                  {
                                    v207 = objc_msgSend(*(id *)&v531[16], "intValue") == 227;
                                  }
                                  else if ((objc_msgSend(v209, "containsObject:", CFSTR("uv")) & 1) != 0)
                                  {
                                    v207 = 2;
                                  }
                                  else if ((objc_msgSend(v209, "containsObject:", CFSTR("ov")) & 1) != 0)
                                  {
                                    v207 = 3;
                                  }
                                  else if ((objc_msgSend(v209, "containsObject:", CFSTR("ot")) & 1) != 0)
                                  {
                                    v207 = 5;
                                  }
                                  else if ((objc_msgSend(v209, "containsObject:", CFSTR("crash")) & 1) != 0)
                                  {
                                    v207 = 4;
                                  }
                                  else
                                  {
                                    if (v206)
                                    {
                                      v454 = qword_10003A5D8;
                                      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                      {
                                        block.st_dev = 138412290;
                                        *(_QWORD *)&block.st_mode = v208;
                                        _os_log_error_impl((void *)&_mh_execute_header, v454, OS_LOG_TYPE_ERROR, "bootFaults contained uncategorized PMU fault(s) : %@", (uint8_t *)&block, 0xCu);
                                      }
                                      goto LABEL_313;
                                    }
                                    v207 = 7;
                                  }
                                }
                                else
                                {
LABEL_313:
                                  v207 = 8;
                                }

                              }
                              else if (objc_msgSend(v204, "intValue") == 1)
                              {
                                v207 = 6;
                              }
                              else
                              {
                                v207 = 8;
                              }
LABEL_318:
                              sub_100011344((id *)v531);
                              sub_10001149C(properties, &v504);
                              if (&_AnalyticsSendEventLazy)
                              {
                                if (v207 > 7)
                                  v210 = CFSTR("unknown");
                                else
                                  v210 = *(&off_100034CB0 + v207);
                                *(_QWORD *)&block.st_dev = _NSConcreteStackBlock;
                                block.st_ino = 3254779904;
                                *(_QWORD *)&block.st_uid = sub_100011504;
                                *(_QWORD *)&block.st_rdev = &unk_100034C80;
                                sub_10001149C(&block.st_atimespec.tv_nsec, (id *)properties);
                                block.st_atimespec.tv_sec = (__darwin_time_t)v210;
                                AnalyticsSendEventLazy(CFSTR("com.apple.coreOS.restartReason"), &block);
                                *(_QWORD *)buf = _NSConcreteStackBlock;
                                *(_QWORD *)&buf[8] = 3254779904;
                                *(_QWORD *)&buf[16] = sub_100011584;
                                *(_QWORD *)&buf[24] = &unk_100034C80;
                                *(_QWORD *)&v537 = v210;
                                sub_10001149C((_QWORD *)&v537 + 1, (id *)properties);
                                AnalyticsSendEventLazy(CFSTR("com.apple.coreOS.resetTelemetry"), buf);
                                sub_100011344((id *)&v537 + 1);

                                sub_100011344((id *)&block.st_atimespec.tv_nsec);
                                v200 = &unk_10003A000;
                              }
                              sub_100011344((id *)properties);
                              v211 = v504;
                              if (objc_msgSend(v504, "intValue")
                                || objc_msgSend(v505, "intValue"))
                              {
                                v212 = CFAbsoluteTimeGetCurrent();
                                v213 = CFUUIDCreate(kCFAllocatorDefault);
                                v214 = (__CFString *)CFUUIDCreateString(kCFAllocatorDefault, v213);
                                CFRelease(v213);
                                LODWORD(v518) = 0;
                                v520 = 0;
                                sub_10000FA6C((uint64_t)"chosen", "chip-id", &v518);
                                sub_10000FA6C((uint64_t)"arm-io", "chip-revision", &v520);
                                v529[0] = (id)kOSALogMetadataAppName;
                                v529[1] = (id)kOSALogMetadataIncidentID;
                                v530[0] = CFSTR("Reset count");
                                v530[1] = v214;
                                v215 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v530, v529, 2));
                                v216 = sub_10000F968(objb, CFSTR("ResetCounter"), 0.0);
                                v217 = (void *)objc_claimAutoreleasedReturnValue(v216);
                                *(_QWORD *)&block.st_dev = _NSConcreteStackBlock;
                                block.st_ino = 3254779904;
                                *(_QWORD *)&block.st_uid = sub_100011A88;
                                *(_QWORD *)&block.st_rdev = &unk_100034C48;
                                v489 = v214;
                                block.st_atimespec.tv_sec = (__darwin_time_t)v489;
                                *(double *)&block.st_atimespec.tv_nsec = v212;
                                sub_10001149C(&block.st_mtimespec.tv_sec, &v504);
                                block.st_size = __PAIR64__(v520, v518);
                                v218 = (void *)objc_claimAutoreleasedReturnValue(+[OSALog createForSubmission:metadata:options:error:writing:](OSALog, "createForSubmission:metadata:options:error:writing:", CFSTR("115"), v215, v217, 0, &block));

                                v219 = qword_10003A5D8;
                                if (v218)
                                {
                                  v220 = (id)qword_10003A5D8;
                                  if (os_log_type_enabled(v220, OS_LOG_TYPE_INFO))
                                  {
                                    v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v218, "filepath"));
                                    *(_DWORD *)buf = 138412290;
                                    *(_QWORD *)&buf[4] = v221;
                                    _os_log_impl((void *)&_mh_execute_header, v220, OS_LOG_TYPE_INFO, "wrote ResetCounter log to disk: %@", buf, 0xCu);

                                  }
                                  v222 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v218, "filepath"));
                                  v491 = objc_msgSend(v222, "copy");

                                }
                                else
                                {
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                  {
                                    *(_WORD *)buf = 0;
                                    _os_log_error_impl((void *)&_mh_execute_header, v219, OS_LOG_TYPE_ERROR, "failed to write ResetCounter log to disk", buf, 2u);
                                  }
                                  v491 = 0;
                                }
                                if (MGGetBoolAnswer(CFSTR("3kmXfug8VcxLI5yEmsqQKw")))
                                {
                                  v223 = v505;
                                  v224 = v506;
                                }
                                else
                                {
                                  *(_QWORD *)buf = CFSTR("115");
                                  *(_QWORD *)&buf[8] = v489;
                                  v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v211, "stringValue"));
                                  *(_QWORD *)&buf[16] = v225;
                                  v223 = v505;
                                  v226 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v505, "stringValue"));
                                  *(_QWORD *)&buf[24] = v226;
                                  v224 = v506;
                                  v227 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v506, "stringValue"));
                                  *(_QWORD *)&v537 = v227;
                                  v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(off_100039B48, "stringValue"));
                                  *((_QWORD *)&v537 + 1) = v228;
                                  v229 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v507, "componentsJoinedByString:", CFSTR(";")));
                                  *(_QWORD *)&v538 = v229;
                                  v230 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", buf, 7));
                                  logForAppleCare(v212);

                                }
                                v231 = v508;
                                v232 = (PanicReport *)v224;
                                v233 = v231;
                                v234 = v223;
                                v235 = objc_msgSend(v211, "intValue");
                                v236 = objc_msgSend(v234, "intValue");

                                v237 = objc_msgSend(v233, "containsObject:", CFSTR("wdog"));
                                v238 = objc_msgSend(v233, "containsObject:", CFSTR("spmi"));
                                v239 = objc_msgSend(v233, "count");
                                v240 = -[PanicReport intValue](v232, "intValue") == 224
                                    || -[PanicReport intValue](v232, "intValue") == 225
                                    || -[PanicReport intValue](v232, "intValue") == 229
                                    || -[PanicReport intValue](v232, "intValue") == 230
                                    || -[PanicReport intValue](v232, "intValue") == 231;
                                if (v239 == (id)1)
                                  v241 = v237;
                                else
                                  v241 = 0;
                                if ((v241 & 1) != 0
                                  || v237
                                  && (objc_msgSend(v233, "count") == (id)2
                                   && (objc_msgSend(v233, "containsObject:", CFSTR("rst")) & 1) != 0
                                   || objc_msgSend(v233, "count") == (id)2
                                   && (objc_msgSend(v233, "containsObject:", CFSTR("btn_shdn")) & 1) != 0))
                                {
                                  v242 = 0;
                                }
                                else
                                {
                                  v242 = v238 ^ 1 | v237;
                                }
                                if (v235)
                                  v243 = 0;
                                else
                                  v243 = v236 == 1;
                                if (!v243)
                                  v242 = 1;
                                if ((v242 ^ 1 | v240) == 1)
                                {
                                  v244 = -[PanicReport intValue](v232, "intValue");
                                  v245 = 0;
                                  v246 = 0;
                                  switch(v244)
                                  {
                                    case '@':
                                      v247 = 2;
                                      goto LABEL_414;
                                    case 'A':
                                      v247 = 8;
                                      goto LABEL_414;
                                    case 'B':
                                      v247 = 3;
                                      goto LABEL_414;
                                    case 'C':
                                      v247 = 5;
                                      goto LABEL_414;
                                    case 'D':
                                      v247 = 6;
                                      goto LABEL_414;
                                    case 'E':
                                      v247 = 9;
                                      goto LABEL_414;
                                    case 'F':
                                      v247 = 4;
                                      goto LABEL_414;
                                    case 'G':
                                      v247 = 7;
                                      goto LABEL_414;
                                    case 'H':
                                    case 'I':
                                    case 'J':
                                    case 'K':
                                    case 'L':
                                    case 'M':
                                    case 'N':
                                    case 'O':
                                      break;
                                    case 'P':
                                      v247 = 15;
LABEL_414:

                                      v275 = (id)qword_10003A5D8;
                                      if (os_log_type_enabled(v275, OS_LOG_TYPE_INFO))
                                      {
                                        *(_WORD *)v519 = 0;
                                        _os_log_impl((void *)&_mh_execute_header, v275, OS_LOG_TYPE_INFO, "detected interesting reset, promoting to panic", v519, 2u);
                                      }

                                      v276 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("sys watchdog")));
                                      v277 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("Unexpected uncategorized reset occurred")));
                                      if ((objc_msgSend(v233, "containsObject:", CFSTR("wdog")) & 1) != 0)
                                      {
                                        v278 = CFSTR("Unexpected SoC (system) watchdog reset occurred");
                                      }
                                      else
                                      {
                                        if (!objc_msgSend(v233, "containsObject:", CFSTR("spmi")))
                                          goto LABEL_421;
                                        v278 = CFSTR("Unexpected SPMI fault reset occurred");
                                      }
                                      v279 = objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", v278));

                                      v277 = (void *)v279;
LABEL_421:
                                      switch(v247)
                                      {
                                        case 2:
                                          objc_msgSend(v276, "appendString:", CFSTR(" panic start"));
                                          v280 = CFSTR(" after panic called");
                                          goto LABEL_438;
                                        case 3:
                                          objc_msgSend(v276, "appendString:", CFSTR(" panic diags"));
                                          v280 = CFSTR(" while panic diagnostics being saved");
                                          goto LABEL_438;
                                        case 4:
                                          objc_msgSend(v276, "appendString:", CFSTR(" panic diags complete"));
                                          v280 = CFSTR(" after panic diagnostics were completed");
                                          goto LABEL_438;
                                        case 5:
                                          objc_msgSend(v276, "appendString:", CFSTR(" x86 panic diags"));
                                          v280 = CFSTR(" while x86 panic diagnostics being saved");
                                          goto LABEL_438;
                                        case 6:
                                          objc_msgSend(v276, "appendString:", CFSTR(" panic DRAM flush"));
                                          v280 = CFSTR(" while panic DRAM flush in progress");
                                          goto LABEL_438;
                                        case 7:
                                          objc_msgSend(v276, "appendString:", CFSTR(" panic save CE trigger"));
                                          v280 = CFSTR(" after panic save CE trigger");
                                          goto LABEL_438;
                                        case 8:
                                          objc_msgSend(v276, "appendString:", CFSTR(" panic save chip reset"));
                                          v280 = CFSTR(" after panic save chip reset initiated");
                                          goto LABEL_438;
                                        case 9:
                                          objc_msgSend(v276, "appendString:", CFSTR(" panic save x86 panic diags interrupted"));
                                          v280 = CFSTR(" after panic save chip reset initiated and x86 panic diagnostics were interrupted");
                                          goto LABEL_438;
                                        case 10:
                                          objc_msgSend(v276, "appendString:", CFSTR(" iBoot panic save entry"));
                                          v280 = CFSTR(" after iBoot panic save entry");
                                          goto LABEL_438;
                                        case 11:
                                          objc_msgSend(v276, "appendString:", CFSTR(" iBoot panic save reboot"));
                                          v280 = CFSTR(" during iBoot panic save reboot");
                                          goto LABEL_438;
                                        case 12:
                                          objc_msgSend(v276, "appendString:", CFSTR(" iBoot panic save power init"));
                                          v280 = CFSTR(" after iBoot panic save power init");
                                          goto LABEL_438;
                                        case 13:
                                          objc_msgSend(v276, "appendString:", CFSTR(" iBoot panic save memory init"));
                                          v280 = CFSTR(" after iBoot panic save memory init");
                                          goto LABEL_438;
                                        case 14:
                                          objc_msgSend(v276, "appendString:", CFSTR(" iBoot panic save storage init"));
                                          v280 = CFSTR(" after iBoot panic save storage init");
                                          goto LABEL_438;
                                        case 15:
                                          objc_msgSend(v276, "appendString:", CFSTR(" sleep/wake transition"));
                                          v280 = CFSTR(" during sleep/wake transition");
                                          goto LABEL_438;
                                        case 16:
                                          objc_msgSend(v276, "appendString:", CFSTR(" AP Watchdog reboot"));
                                          v280 = CFSTR(" after AP Watchdog reboot");
                                          goto LABEL_438;
                                        case 17:
                                          objc_msgSend(v276, "appendString:", CFSTR(" AP Watchdog expired"));
                                          v280 = CFSTR(" after AP Watchdog expired");
LABEL_438:
                                          objc_msgSend(v277, "appendString:", v280);
                                          break;
                                        default:
                                          break;
                                      }
                                      v245 = objc_retainAutorelease(v277);
                                      v232 = -[PanicReport initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:]([PanicReport alloc], "initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:", v245, 0, 0, 0, v276, 0, 0);
                                      -[PanicReport useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:](v232, "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:", 0, 0, 0, v487, 0xFFFFFFFFLL, Current);
                                      -[PanicReport setForegroundAppHash:](v232, "setForegroundAppHash:", off_100039B48);
                                      -[PanicReport setSOCIdAndRev](v232, "setSOCIdAndRev");
                                      v281 = sub_10000F968(objb, 0, Current);
                                      v282 = (void *)objc_claimAutoreleasedReturnValue(v281);
                                      v283 = -[PanicReport saveWithOptions:](v232, "saveWithOptions:", v282);

                                      if (v283)
                                      {
                                        v284 = (void *)objc_claimAutoreleasedReturnValue(-[PanicReport logfile](v232, "logfile"));
                                        v246 = (unint64_t)objc_msgSend(v284, "copy");

                                      }
                                      else
                                      {
                                        v285 = qword_10003A5D8;
                                        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                        {
                                          *(_WORD *)v519 = 0;
                                          _os_log_error_impl((void *)&_mh_execute_header, v285, OS_LOG_TYPE_ERROR, "failed to write system watchdog reset panic log", v519, 2u);
                                        }
                                        v246 = 0;
                                      }

                                      v233 = v276;
                                      break;
                                    default:
                                      v246 = 0;
                                      switch(v244)
                                      {
                                        case 0xE0u:
                                          v247 = 10;
                                          goto LABEL_414;
                                        case 0xE1u:
                                          v247 = 11;
                                          goto LABEL_414;
                                        case 0xE2u:
                                          goto LABEL_445;
                                        case 0xE3u:
                                          if (!v238)
                                            goto LABEL_409;
                                          v247 = 16;
                                          goto LABEL_414;
                                        case 0xE4u:
                                          v247 = 17;
                                          goto LABEL_414;
                                        case 0xE5u:
                                          v247 = 12;
                                          goto LABEL_414;
                                        case 0xE6u:
                                          v247 = 13;
                                          goto LABEL_414;
                                        case 0xE7u:
                                          v247 = 14;
                                          goto LABEL_414;
                                        default:
                                          if (v244 == 255)
                                          {
                                            v247 = 1;
                                            goto LABEL_414;
                                          }
                                          v246 = 0;
                                          break;
                                      }
                                      break;
                                  }
                                }
                                else
                                {
LABEL_409:
                                  v245 = 0;
                                  v246 = 0;
                                }
LABEL_445:

                                v249 = ((unint64_t)v491 | v246) != 0;
                                sub_100011344((id *)&block.st_mtimespec);

                              }
                              else
                              {
                                v248 = *((_QWORD *)v200 + 187);
                                if (os_log_type_enabled(v248, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_impl((void *)&_mh_execute_header, v248, OS_LOG_TYPE_DEFAULT, "Skipping writing ResetCounter log as no unexpected resets detected", (uint8_t *)&block, 2u);
                                }
                                v245 = 0;
                                v491 = 0;
                                v246 = 0;
                                v249 = 1;
                              }

                              sub_100011344(&v504);
                              v485 = v245;
                              v481 = v491;
                              v488 = (unsigned int *)(id)v246;

                              if (!v249)
                              {
                                v286 = (id)qword_10003A5D8;
                                if (os_log_type_enabled(v286, OS_LOG_TYPE_ERROR))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_error_impl((void *)&_mh_execute_header, v286, OS_LOG_TYPE_ERROR, "Failed to write boot fault report", (uint8_t *)&block, 2u);
                                }

                              }
                              if (v497)
                                v482 = objc_msgSend(v497, "containsString:", CFSTR("forceReset"));
                              else
                                v482 = 0;
                              if (objc_msgSend(v498, "length")
                                || objc_msgSend(v497, "length")
                                || !objc_msgSend(v493, "count"))
                              {
LABEL_455:
                                v287 = v497;
                              }
                              else
                              {
                                if (os_variant_has_internal_diagnostics("com.apple.DumpPanic"))
                                {
                                  *(_QWORD *)&block.st_dev = 0;
                                  v303 = sub_100010598();
                                  v304 = (void *)objc_claimAutoreleasedReturnValue(v303);
                                  v305 = sub_10001074C(v304, CFSTR("debug"), (unint64_t *)&block);

                                  if (v305)
                                  {
                                    st_dev = block.st_dev;
                                    v307 = qword_10003A5D8;
                                    v308 = os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT);
                                    if ((st_dev & 0x100000) == 0)
                                    {
                                      if (v308)
                                      {
                                        *(_WORD *)buf = 0;
                                        _os_log_impl((void *)&_mh_execute_header, v307, OS_LOG_TYPE_DEFAULT, "Machine configured to NOT reboot on a panic", buf, 2u);
                                      }
                                      goto LABEL_455;
                                    }
                                    if (v308)
                                    {
                                      *(_WORD *)buf = 0;
                                      _os_log_impl((void *)&_mh_execute_header, v307, OS_LOG_TYPE_DEFAULT, "Machine configured to reboot on a panic", buf, 2u);
                                    }
                                  }
                                }
                                v400 = (id)qword_10003A5C0;
                                if (os_log_type_enabled(v400, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_impl((void *)&_mh_execute_header, v400, OS_LOG_TYPE_DEFAULT, "Write a standalone socd panic report", (uint8_t *)&block, 2u);
                                }

                                v401 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v494, "output_dir"));
                                v502 = v497;
                                v503 = v498;
                                v402 = sub_100016868(v401, &v503, &v502, v493, Current);
                                v403 = v503;

                                v287 = v502;
                                if ((v402 & 1) == 0)
                                {
                                  v404 = (id)qword_10003A5C0;
                                  if (os_log_type_enabled(v404, OS_LOG_TYPE_ERROR))
                                  {
                                    LOWORD(block.st_dev) = 0;
                                    _os_log_error_impl((void *)&_mh_execute_header, v404, OS_LOG_TYPE_ERROR, "Failed to write standalone socd panic report", (uint8_t *)&block, 2u);
                                  }

                                }
                                v498 = v403;
                              }
                              v3 = (__CFString *)v287;
                              if (qword_10003A5D0 != -1)
LABEL_701:
                                dispatch_once(&qword_10003A5D0, &stru_100034E58);
                              v288 = (id)qword_10003A5C8;
                              v289 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                              v290 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), "/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb"));
                              v291 = objc_msgSend(v289, "fileExistsAtPath:", v290);

                              if (v291)
                              {
                                v292 = v288;
                                v293 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", CFSTR("/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb")));
                                *(_QWORD *)buf = 0;
                                v294 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v293, 0, buf));
                                v295 = *(id *)buf;

                                if (v294)
                                {
                                  *(_QWORD *)v531 = 0;
                                  v296 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v294, 0, 0, v531));
                                  v297 = *(id *)v531;

                                  if (v296)
                                  {
                                    v298 = objc_opt_class(NSDictionary);
                                    if ((objc_opt_isKindOfClass(v296, v298) & 1) != 0)
                                    {
                                      v299 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v296, "objectForKey:", v292));
                                      v300 = v299 == 0;

                                      if (!v300)
                                      {

                                        v301 = qword_10003A5D8;
                                        if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                        {
                                          LOWORD(block.st_dev) = 0;
                                          _os_log_error_impl((void *)&_mh_execute_header, v301, OS_LOG_TYPE_ERROR, "Found panic log breadcrumb with duplicated boot session uuid", (uint8_t *)&block, 2u);
                                        }
                                        goto LABEL_478;
                                      }
                                    }
                                    else
                                    {
                                      v313 = qword_10003A5D8;
                                      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                      {
                                        LOWORD(block.st_dev) = 0;
                                        _os_log_error_impl((void *)&_mh_execute_header, v313, OS_LOG_TYPE_ERROR, "Breadcrumb file contains invalid data", (uint8_t *)&block, 2u);
                                      }
                                    }
                                  }
                                  else
                                  {
                                    v309 = (void *)qword_10003A5D8;
                                    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                    {
                                      v310 = v309;
                                      v311 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v297, "description")));
                                      v312 = objc_msgSend(v311, "UTF8String");
                                      block.st_dev = 136315138;
                                      *(_QWORD *)&block.st_mode = v312;
                                      _os_log_error_impl((void *)&_mh_execute_header, v310, OS_LOG_TYPE_ERROR, "Failed to parse breadcrumb with error : %s", (uint8_t *)&block, 0xCu);

                                    }
                                  }

                                  goto LABEL_478;
                                }
                                v302 = (void *)qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                {
                                  v405 = v302;
                                  v406 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v295, "description")));
                                  v407 = objc_msgSend(v406, "UTF8String");
                                  block.st_dev = 136315138;
                                  *(_QWORD *)&block.st_mode = v407;
                                  _os_log_error_impl((void *)&_mh_execute_header, v405, OS_LOG_TYPE_ERROR, "Read from panic log breadcrumb failed due to %s", (uint8_t *)&block, 0xCu);

                                }
LABEL_478:
                                if (unlink("/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb"))
                                {
                                  v314 = (void *)qword_10003A5D8;
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                  {
                                    v388 = v314;
                                    v389 = __error();
                                    v390 = strerror(*v389);
                                    block.st_dev = 136315138;
                                    *(_QWORD *)&block.st_mode = v390;
                                    _os_log_error_impl((void *)&_mh_execute_header, v388, OS_LOG_TYPE_ERROR, "Failed to unlink prior stashed panic log breadcrumb %s", (uint8_t *)&block, 0xCu);

                                  }
                                }
                              }
                              v315 = objc_alloc((Class)NSDictionary);
                              if (v3)
                                v316 = v3;
                              else
                                v316 = &stru_100035420;
                              v317 = objc_msgSend(v315, "initWithObjectsAndKeys:", v316, v288, 0);
                              v318 = qword_10003A5D8;
                              if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                              {
                                block.st_dev = 138412546;
                                *(_QWORD *)&block.st_mode = v317;
                                WORD2(block.st_ino) = 2080;
                                *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)"/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb";
                                _os_log_impl((void *)&_mh_execute_header, v318, OS_LOG_TYPE_DEFAULT, "write %@ to %s", (uint8_t *)&block, 0x16u);
                              }
                              v319 = open("/var/db/com.apple.DumpPanic.panicLogPathBreadcrumb", 2561, 420);
                              if ((v319 & 0x80000000) != 0)
                              {
                                v324 = (void *)qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                {
                                  v383 = v324;
                                  v384 = __error();
                                  v385 = strerror(*v384);
                                  block.st_dev = 136315138;
                                  *(_QWORD *)&block.st_mode = v385;
                                  _os_log_error_impl((void *)&_mh_execute_header, v383, OS_LOG_TYPE_ERROR, "Failed to safely open file : %s", (uint8_t *)&block, 0xCu);

                                }
                                v322 = 0;
                              }
                              else
                              {
                                *(_QWORD *)buf = 0;
                                v320 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v317, 100, 0, buf));
                                v321 = *(id *)buf;
                                if (v321)
                                {
                                  v322 = v321;
                                  v323 = (void *)qword_10003A5D8;
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                  {
                                    v377 = v323;
                                    v378 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v322, "description")));
                                    v379 = objc_msgSend(v378, "UTF8String");
                                    block.st_dev = 136315138;
                                    *(_QWORD *)&block.st_mode = v379;
                                    _os_log_error_impl((void *)&_mh_execute_header, v377, OS_LOG_TYPE_ERROR, "Failed to construct panic log breadcrumb: %s", (uint8_t *)&block, 0xCu);

                                  }
                                  close(v319);
                                }
                                else
                                {
                                  v325 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v319, 0);
                                  *(_QWORD *)v531 = 0;
                                  objc_msgSend(v325, "writeData:error:", v320, v531);
                                  v322 = *(id *)v531;
                                  if (v322)
                                  {
                                    v326 = (void *)qword_10003A5D8;
                                    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                    {
                                      v426 = v326;
                                      v427 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v322, "description")));
                                      v428 = objc_msgSend(v427, "UTF8String");
                                      block.st_dev = 136315138;
                                      *(_QWORD *)&block.st_mode = v428;
                                      _os_log_error_impl((void *)&_mh_execute_header, v426, OS_LOG_TYPE_ERROR, "Faled to write panic log breadcrumb: %s", (uint8_t *)&block, 0xCu);

                                    }
                                  }
                                  close(v319);

                                }
                              }

                              v327 = 0;
                              j = 0;
                              v329 = 1;
                              do
                              {
                                v330 = v329;

                                v331 = -[UserCoreFileHandler initWithCoreFilePath::]([UserCoreFileHandler alloc], "initWithCoreFilePath::", "launchd", *((_QWORD *)&unk_100034DF8 + 4 * v327 + 2));
                                v332 = v331;
                                if (v331)
                                {
                                  j = objc_claimAutoreleasedReturnValue(-[UserCoreFileHandler saveUserSpaceCoreToDisk:](v331, "saveUserSpaceCoreToDisk:", Current));
                                  if (j)
                                  {
                                    objc_msgSend(v495, "addObject:", j);
                                    v333 = (id)qword_10003A5D8;
                                    if (os_log_type_enabled(v333, OS_LOG_TYPE_DEFAULT))
                                    {
                                      v334 = objc_msgSend(objc_retainAutorelease((id)j), "UTF8String");
                                      block.st_dev = 136315138;
                                      *(_QWORD *)&block.st_mode = v334;
                                      _os_log_impl((void *)&_mh_execute_header, v333, OS_LOG_TYPE_DEFAULT, "ready to submit %s", (uint8_t *)&block, 0xCu);
                                    }

                                  }
                                }
                                else
                                {
                                  j = 0;
                                }

                                v329 = 0;
                                v327 = 1;
                              }
                              while ((v330 & 1) != 0);
                              v2 = v3;
                              if (creat("/var/run/com.apple.DumpPanic.finishedThisBoot", 0x100u) < 0)
                              {
                                v337 = __error();
                                v338 = (void *)qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                {
                                  v339 = *v337;
                                  v340 = v338;
                                  v341 = strerror(v339);
                                  block.st_dev = 136315394;
                                  *(_QWORD *)&block.st_mode = "/var/run/com.apple.DumpPanic.finishedThisBoot";
                                  WORD2(block.st_ino) = 2080;
                                  *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v341;
                                  _os_log_error_impl((void *)&_mh_execute_header, v340, OS_LOG_TYPE_ERROR, "failed to creat() DumpPanicDone cookie at path %s with error %s", (uint8_t *)&block, 0x16u);

                                }
                              }
                              else
                              {
                                v335 = fopen("/var/run/com.apple.DumpPanic.finishedThisBoot", "w");
                                if (v335)
                                {
                                  v336 = objc_retainAutorelease(v2);
                                  fwrite(-[__CFAllocator UTF8String](v336, "UTF8String"), (size_t)-[__CFAllocator length](v336, "length"), 1uLL, v335);
                                  fclose(v335);
                                }
                                else
                                {
                                  v342 = qword_10003A5D8;
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                  {
                                    block.st_dev = 136315138;
                                    *(_QWORD *)&block.st_mode = "/var/run/com.apple.DumpPanic.finishedThisBoot";
                                    _os_log_error_impl((void *)&_mh_execute_header, v342, OS_LOG_TYPE_ERROR, "Unable to open DumpPanicDone cookie at path: %s", (uint8_t *)&block, 0xCu);
                                  }
                                }
                              }
                              v194 = (v3 == 0);

                              if (v488)
                                LODWORD(v343) = v3 == 0;
                              else
                                LODWORD(v343) = 0;
                              if ((_DWORD)v343 == 1)
                              {
                                v2 = v488;
                                v194 = v485;

                                v498 = v194;
                              }
                              v496 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                              v344 = CFSTR("864503");
                              if ((_DWORD)v343)
                                v344 = CFSTR("1111324");
                              if (v482)
                                v345 = CFSTR("864502");
                              else
                                v345 = v344;
                              objc_msgSend((id)v496, "addObject:", v345);
                              if (!v2 && !objc_msgSend(v495, "count"))
                              {
LABEL_561:
                                if (v492)
                                {
                                  v365 = objc_autoreleasePoolPush();
                                  v366 = [KeyStore alloc];
                                  v367 = -[ReadOnlyKeyStore init:](v366, "init:", qword_10003A5D8);
                                  v368 = v367;
                                  if (v367 && objc_msgSend(v367, "unlock"))
                                  {
                                    objc_msgSend(v368, "RotateKeys:", sub_100010C04);
                                  }
                                  else
                                  {
                                    v369 = (id)qword_10003A5D8;
                                    if (os_log_type_enabled(v369, OS_LOG_TYPE_ERROR))
                                    {
                                      LOWORD(block.st_dev) = 0;
                                      _os_log_error_impl((void *)&_mh_execute_header, v369, OS_LOG_TYPE_ERROR, "Failed to unlock a keystore. Encryption not vailable.", (uint8_t *)&block, 2u);
                                    }

                                  }
                                  objc_autoreleasePoolPop(v365);
                                }

                                sub_100011344((id *)&v512);
                                v7 = 0;
                                goto LABEL_570;
                              }
                              v346 = pthread_set_qos_class_self_np(QOS_CLASS_USER_INITIATED, 0);
                              if (v346)
                              {
                                v463 = _os_assert_log(v346);
                                v364 = _os_crash(v463);
                                __break(1u);
                                goto LABEL_703;
                              }
                              v487 = v2;
                              v484 = (__CFString *)v498;
                              v194 = v495;
                              v480 = (id)v496;
                              obj = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
                              if (v2)
                                objc_msgSend(obj, "addObject:", v487);
                              if (v194)
                                objc_msgSend(obj, "addObjectsFromArray:", v194);
                              v491 = v194;
                              if (MGGetBoolAnswer(CFSTR("ExclaveCapability")))
                              {
                                v537 = 0u;
                                v538 = 0u;
                                memset(buf, 0, sizeof(buf));
                                v194 = v491;
                                v347 = -[NSObject countByEnumeratingWithState:objects:count:](v194, "countByEnumeratingWithState:objects:count:", buf, &block, 16);
                                if (v347)
                                {
                                  v348 = **(_QWORD **)&buf[16];
                                  while (2)
                                  {
                                    for (k = 0; k != v347; k = (char *)k + 1)
                                    {
                                      if (**(_QWORD **)&buf[16] != v348)
                                        objc_enumerationMutation(v194);
                                      if (objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 8 * (_QWORD)k), "rangeOfString:options:", CFSTR("secure"), 1) != (id)0x7FFFFFFFFFFFFFFFLL)
                                      {
                                        v350 = 1;
                                        goto LABEL_543;
                                      }
                                    }
                                    v347 = -[NSObject countByEnumeratingWithState:objects:count:](v194, "countByEnumeratingWithState:objects:count:", buf, &block, 16);
                                    if (v347)
                                      continue;
                                    break;
                                  }
                                }
                                v350 = 0;
LABEL_543:

                              }
                              else
                              {
                                v350 = 0;
                              }

                              if (_os_feature_enabled_impl("OSAnalytics", "forceSeedFeedbackPrompting"))
                              {
                                v351 = v484;
                                v352 = v351;
                                if (v350)
                                {
                                  v353 = objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingFormat:](v351, "stringByAppendingFormat:", CFSTR("\n\n%@"), CFSTR("[Warning: The attachments may contain privacy-sensitive sensor data.]")));

                                  v352 = (void *)v353;
                                }
                                v194 = obj;
                                v354 = v487;
                                v355 = v352;
                                if (objc_opt_class(OSADiagnosticsReporter))
                                {
                                  v356 = objc_alloc_init((Class)DiagnosticsReporterLaunchOptions);
                                  objc_msgSend(v356, "setFiles_to_attach:", v194);
                                  objc_msgSend(v356, "setLog_path:", v354);
                                  objc_msgSend(v356, "setPanic_string:", v355);
                                  v357 = (void *)qword_10003A5D8;
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                  {
                                    v358 = v357;
                                    v359 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v356, "files_to_attach"));
                                    v360 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v356, "log_path"));
                                    v361 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v356, "panic_string"));
                                    block.st_dev = 138412802;
                                    *(_QWORD *)&block.st_mode = v359;
                                    WORD2(block.st_ino) = 2112;
                                    *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = (__darwin_ino64_t)v360;
                                    HIWORD(block.st_gid) = 2112;
                                    *(_QWORD *)&block.st_rdev = v361;
                                    _os_log_impl((void *)&_mh_execute_header, v358, OS_LOG_TYPE_DEFAULT, "Launching DiagnosticsReporter with files to attach: %@, log_path: %@, and panic string: %@", (uint8_t *)&block, 0x20u);

                                  }
                                  *(_QWORD *)&block.st_dev = 0;
                                  block.st_ino = (__darwin_ino64_t)&block;
                                  *(_QWORD *)&block.st_uid = 0x3032000000;
                                  *(_QWORD *)&block.st_rdev = sub_100010368;
                                  block.st_atimespec.tv_sec = (__darwin_time_t)sub_100010378;
                                  block.st_atimespec.tv_nsec = (uint64_t)dispatch_group_create();
                                  dispatch_group_enter(*(dispatch_group_t *)(block.st_ino + 40));
                                  *(_QWORD *)buf = _NSConcreteStackBlock;
                                  *(_QWORD *)&buf[8] = v5;
                                  *(_QWORD *)&buf[16] = sub_100010380;
                                  *(_QWORD *)&buf[24] = &unk_100034C20;
                                  *(_QWORD *)&v537 = &block;
                                  +[OSADiagnosticsReporter launchAppWith:options:completion:](OSADiagnosticsReporter, "launchAppWith:options:completion:", 0, v356, buf);
                                  v362 = qword_10003A5D8;
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                  {
                                    *(_WORD *)v531 = 0;
                                    _os_log_impl((void *)&_mh_execute_header, v362, OS_LOG_TYPE_DEFAULT, "Waiting for DR to launch.", v531, 2u);
                                  }
                                  dispatch_group_wait(*(dispatch_group_t *)(block.st_ino + 40), 0xFFFFFFFFFFFFFFFFLL);
                                  _Block_object_dispose(&block, 8);

                                }
                                else
                                {
                                  v363 = qword_10003A5D8;
                                  if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                  {
                                    LOWORD(block.st_dev) = 0;
                                    _os_log_error_impl((void *)&_mh_execute_header, v363, OS_LOG_TYPE_ERROR, "OSADiagnosticsReporter does not exist and thus we cannot launch DR", (uint8_t *)&block, 2u);
                                  }
                                }

                                goto LABEL_560;
                              }
                              if (!os_variant_has_internal_diagnostics("com.apple.DumpPanic"))
                                goto LABEL_560;
                              if (sub_100010480())
                              {
                                v194 = qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_impl((void *)&_mh_execute_header, v194, OS_LOG_TYPE_DEFAULT, "Detected stress rack device, skipping prompting user for panic", (uint8_t *)&block, 2u);
                                }
                                goto LABEL_560;
                              }
                              if (!objc_opt_class(TapToRadarServiceSettings))
                              {
                                v194 = qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  _os_log_error_impl((void *)&_mh_execute_header, v194, OS_LOG_TYPE_ERROR, "TapToRadarServiceSettings does not exist and thus we cannot start a radar", (uint8_t *)&block, 2u);
                                }
                                goto LABEL_560;
                              }
                              v371 = (void *)objc_claimAutoreleasedReturnValue(+[TapToRadarService shared](TapToRadarService, "shared"));
                              v479 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v371, "serviceSettings"));

                              if (objc_msgSend(v479, "authorizationStatus") == (id)1)
                              {
                                v194 = qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  v372 = "TapToRadarService reports the user has turned off DumpPanic prompts, skipping p"
                                         "rompting user for panic";
                                  goto LABEL_586;
                                }
                                goto LABEL_692;
                              }
                              v373 = CFSTR("Your device has recovered from a panic");
                              if ((_DWORD)v343)
                                v373 = CFSTR("Your device has rebooted after an unexpected reset");
                              if (v482)
                                v374 = CFSTR("Your device has rebooted after a force reset");
                              else
                                v374 = (__CFString *)v373;
                              v375 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
                              v376 = objc_msgSend(v375, "BOOLForKey:", CFSTR("skipTTR"));

                              if (v376)
                              {
                                v194 = qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  v372 = "skipping launching TTR because of user defaults...";
LABEL_586:
                                  _os_log_impl((void *)&_mh_execute_header, v194, OS_LOG_TYPE_DEFAULT, v372, (uint8_t *)&block, 2u);
                                }
LABEL_692:

LABEL_560:
                                v364 = pthread_set_qos_class_self_np(QOS_CLASS_UTILITY, 0);
                                if (!v364)
                                  goto LABEL_561;
LABEL_703:
                                v464 = _os_assert_log(v364);
                                _os_crash(v464);
                                __break(1u);
LABEL_704:
                                dispatch_once(&qword_10003A5A0, &stru_100034D10);
                                continue;
                              }
                              break;
                            }
                            v194 = objc_msgSend(v479, "authorizationStatus");
                            if (v350)
                              v478 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("File a radar now?"), "stringByAppendingFormat:", CFSTR("\n%@"), CFSTR("[Warning: The attachments may contain privacy-sensitive sensor data.]")));
                            else
                              v478 = CFSTR("File a radar now?");
                            if (v194 == 2)
                            {
                              if (MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL) == 7)
                              {
                                v194 = qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  v432 = "skipping launching TTR because DumpPanic is currently rate limited...";
                                  goto LABEL_690;
                                }
                                goto LABEL_691;
                              }
LABEL_655:
                              if (!sub_10000FC44(v374, v478))
                              {
                                v194 = qword_10003A5D8;
                                if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                                {
                                  LOWORD(block.st_dev) = 0;
                                  v432 = "skipping launching TTR...";
LABEL_690:
                                  _os_log_impl((void *)&_mh_execute_header, v194, OS_LOG_TYPE_DEFAULT, v432, (uint8_t *)&block, 2u);
                                }
LABEL_691:

                                goto LABEL_692;
                              }
                            }
                            if ((v482 & 1) != 0)
                            {
                              v436 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
                              *(_QWORD *)v531 = 0;
                              v483 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v436, "contentsOfDirectoryAtPath:error:", CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins"), v531));
                              v437 = *(id *)v531;
                              if (!v437)
                              {
                                v537 = 0u;
                                v538 = 0u;
                                memset(buf, 0, sizeof(buf));
                                v438 = v483;
                                v439 = objc_msgSend(v438, "countByEnumeratingWithState:objects:count:", buf, &block, 16);
                                v477 = v436;
                                if (v439)
                                {
                                  v440 = **(_QWORD **)&buf[16];
                                  do
                                  {
                                    for (m = 0; m != v439; m = (char *)m + 1)
                                    {
                                      if (**(_QWORD **)&buf[16] != v440)
                                        objc_enumerationMutation(v438);
                                      v442 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/ForceResetTailspins"), "stringByAppendingPathComponent:", *(_QWORD *)(*(_QWORD *)&buf[8] + 8 * (_QWORD)m)));
                                      objc_msgSend(obj, "addObject:", v442);

                                    }
                                    v439 = objc_msgSend(v438, "countByEnumeratingWithState:objects:count:", buf, &block, 16);
                                  }
                                  while (v439);
                                }

                                v436 = v477;
                              }
                              v443 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "componentsJoinedByString:", CFSTR("\n")));
                              v444 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("I force reset my device while …\n\nExpected attachments:\n (sysdiagnose)\n%@"), v443));

                              v445 = CFSTR("1028387");
                              v446 = CFSTR("Triage");
                              v447 = CFSTR("Force Resets");
                              v448 = CFSTR("it rebooted after a force reset");
                              v449 = CFSTR("device force reset");
                            }
                            else
                            {
                              if ((_DWORD)v343)
                                v449 = CFSTR("device unexpected reset");
                              else
                                v449 = CFSTR("device panic");
                              if ((_DWORD)v343)
                                v448 = CFSTR("it rebooted after an unexpected reset");
                              else
                                v448 = CFSTR("it recovered from a panic");
                              v450 = objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "componentsJoinedByString:", CFSTR("\n")));
                              v451 = (void *)v450;
                              v452 = CFSTR("No panic log found");
                              if (v484)
                                v452 = v484;
                              if ((_DWORD)v343)
                                v453 = CFSTR("My device unexpectedly reset while …\n\n%@\n\nExpected attachments:\n (sysdiagnose)\n%@");
                              else
                                v453 = CFSTR("My device panicked while …\n\n%@\n\nExpected attachments:\n (sysdiagnose)\n%@");
                              v444 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v453, v452, v450));

                              if ((v343 & 1) != 0)
                              {
                                v445 = CFSTR("1176064");
                                v446 = CFSTR("Triage");
                                v447 = CFSTR("Unexpected Resets");
                              }
                              else
                              {
                                v445 = CFSTR("609970");
                                v446 = CFSTR("iOS");
                                v447 = CFSTR("Panic Triage");
                              }
                            }
                            sub_10000FEC8(v448, v449, v444, v447, v446, v445, obj, v480, v194 == 2);

                            goto LABEL_691;
                          }
                          continue;
                        }
                        goto LABEL_261;
                      }
                    }
                    if (!v160)
                      goto LABEL_234;
                    block.st_dev = 134217984;
                    *(_QWORD *)&block.st_mode = v158;
                    v161 = "%llu bytes were read from the file or device, but it did not contain any paniclog data (buffe"
                           "r was all zeros).";
                    v162 = v159;
                    v163 = 12;
                  }
                  else
                  {
                    v164 = *((_QWORD *)v130 + 187);
                    if (!os_log_type_enabled(v164, OS_LOG_TYPE_DEFAULT))
                      goto LABEL_234;
                    LOWORD(block.st_dev) = 0;
                    v161 = "No data was read from the file or device (buffer length was zero).";
                    v162 = v164;
                    v163 = 2;
                  }
LABEL_233:
                  _os_log_impl((void *)&_mh_execute_header, v162, OS_LOG_TYPE_DEFAULT, v161, (uint8_t *)&block, v163);
                  goto LABEL_234;
                }
                *(_QWORD *)buf = 0;
                *(_QWORD *)&buf[8] = LODWORD(properties[0]);
                *(_QWORD *)v531 = buf;
                *(_QWORD *)&v531[8] = 1;
                if (!ioctl(v140, 0x8010641FuLL, v531))
                  goto LABEL_648;
                v134 = qword_10003A5D8;
                if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_ERROR))
                  goto LABEL_648;
LABEL_706:
                v466 = v134;
                v467 = *__error();
                v468 = __error();
                v469 = strerror(*v468);
                block.st_dev = 67109378;
                *(_DWORD *)&block.st_mode = v467;
                LOWORD(block.st_ino) = 2080;
                *(__darwin_ino64_t *)((char *)&block.st_ino + 2) = (__darwin_ino64_t)v469;
                _os_log_error_impl((void *)&_mh_execute_header, v466, OS_LOG_TYPE_ERROR, "Failed to unlink panic data -- DKIOCUNMAP failed with %d : %s", (uint8_t *)&block, 0x12u);

LABEL_597:
                v261 = v2;
                goto LABEL_648;
              }
              v397 = (void *)qword_10003A5D8;
              if (!os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
                goto LABEL_648;
              v398 = v397;
              v399 = *__error();
              block.st_dev = 134218754;
              *(_QWORD *)&block.st_mode = v263;
              WORD2(block.st_ino) = 2048;
              *(__darwin_ino64_t *)((char *)&block.st_ino + 6) = 2359296;
              HIWORD(block.st_gid) = 2112;
              *(_QWORD *)&block.st_rdev = v77;
              LOWORD(block.st_atimespec.tv_sec) = 1024;
              *(_DWORD *)((char *)&block.st_atimespec.tv_sec + 2) = v399;
              _os_log_impl((void *)&_mh_execute_header, v398, OS_LOG_TYPE_DEFAULT, "Unexpected pread result (%zd of %zu bytes) of panic data (%@): errno %d", (uint8_t *)&block, 0x26u);

              goto LABEL_597;
            }
LABEL_713:
            v476 = _os_assert_log(0);
            PanicLogData = _os_crash(v476);
            __break(1u);
LABEL_714:
            switch(PanicLogData)
            {
              case 1:
                _os_crash("AppleNVMeReadPanicLogData could not find panic log namespace service in registry.");
                __break(1u);
                return result;
              case 2:
                goto LABEL_723;
              case 3:
                goto LABEL_724;
              case 4:
                goto LABEL_725;
              case 5:
                goto LABEL_726;
              case 6:
                goto LABEL_727;
              case 7:
                goto LABEL_728;
              default:
                goto LABEL_722;
            }
          }
          CFRelease(properties[0]);
          IOObjectRelease(v150);
        }
      }
      v153 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        block.st_dev = 134217984;
        *(_QWORD *)&block.st_mode = v147;
        _os_log_impl((void *)&_mh_execute_header, v153, OS_LOG_TYPE_DEFAULT, "searching IORegistry again after %lds sleep", (uint8_t *)&block, 0xCu);
      }
      sleep(v147);
      v147 *= 2;
      if (v147 > v146)
      {
        v132 = &unk_10003A000;
        goto LABEL_217;
      }
    }
  }
  *(_QWORD *)&block.st_dev = 0;
  Size = AppleNVMePanicLogGetSize(&block);
  if (!Size)
  {
    if (*(_QWORD *)&block.st_dev <= 0x240000uLL)
      v140 = 2359296;
    else
      v140 = *(_QWORD *)&block.st_dev;
    v530[0] = 0;
    v141 = (const __CFAllocator *)malloc_type_valloc(v140, 0x2C8BCAC2uLL);
    v142 = v141;
    if (!v141)
    {
      v465 = _os_assert_log(0);
      _os_crash(v465);
      __break(1u);
      goto LABEL_706;
    }
    bzero(v141, v140);
    PanicLogData = AppleNVMeReadPanicLogData(0, v142, v140, v530);
    if (!PanicLogData)
    {
      v144 = qword_10003A5D8;
      if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
      {
        block.st_dev = 134217984;
        *(id *)&block.st_mode = v530[0];
        _os_log_impl((void *)&_mh_execute_header, v144, OS_LOG_TYPE_DEFAULT, "AppleNVMeReadPanicLogData successfully extracted %llu bytes of data.", (uint8_t *)&block, 0xCu);
      }
      goto LABEL_220;
    }
    goto LABEL_714;
  }
  switch(Size)
  {
    case 1:
      _os_crash("AppleNVMePanicLogGetSize could not find panic log namespace service in registry.");
      __break(1u);
      goto LABEL_718;
    case 2:
LABEL_718:
      _os_crash("AppleNVMePanicLogGetSize could not connect to panic log namespace service.");
      __break(1u);
      goto LABEL_719;
    case 3:
LABEL_719:
      _os_crash("AppleNVMePanicLogGetSize failed to query panic log namespace size.");
      __break(1u);
      goto LABEL_720;
    case 6:
LABEL_720:
      _os_crash("AppleNVMePanicLogGetSize received an invalid argument.");
      __break(1u);
      goto LABEL_721;
    case 7:
LABEL_721:
      _os_crash("AppleNVMePanicLogGetSize suffered from an internal error.");
      __break(1u);
LABEL_722:
      _os_crash("AppleNVMeReadPanicLogData suffered from an unknown error.");
      __break(1u);
LABEL_723:
      _os_crash("AppleNVMeReadPanicLogData could not connect to panic log namespace service.");
      __break(1u);
LABEL_724:
      _os_crash("AppleNVMeReadPanicLogData failed to query panic log namespace size.");
      __break(1u);
LABEL_725:
      _os_crash("AppleNVMeReadPanicLogData failed to read data from panic log namespace.");
      __break(1u);
LABEL_726:
      _os_crash("AppleNVMeReadPanicLogData failed to unmap data from panic log namespace.");
      __break(1u);
LABEL_727:
      _os_crash("AppleNVMeReadPanicLogData received an invalid argument.");
      __break(1u);
LABEL_728:
      _os_crash("AppleNVMeReadPanicLogData suffered from an internal error.");
      __break(1u);
      break;
    default:
      break;
  }
  result = _os_crash("AppleNVMePanicLogGetSize suffered from an unknown error.");
  __break(1u);
  return result;
}

void sub_10002454C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,id a52)
{
  sub_100011344(&a52);
  _Unwind_Resume(a1);
}

void sub_100024770(id a1)
{
  NSObject *v1;
  uint64_t v2;
  void *v3;
  uint8_t v4[8];
  size_t v5;
  _BYTE v6[37];

  memset(v6, 0, sizeof(v6));
  v5 = 37;
  if (sysctlbyname("kern.bootsessionuuid", v6, &v5, 0, 0))
  {
    v1 = qword_10003A5D8;
    if (os_log_type_enabled((os_log_t)qword_10003A5D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Failed to get kern.bootsessionuuid", v4, 2u);
    }
  }
  else
  {
    v2 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 4));
    v3 = (void *)qword_10003A5C8;
    qword_10003A5C8 = v2;

  }
}

void sub_100026098(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, __int128 buf)
{
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;

  if (a2 == 1)
  {
    v19 = objc_begin_catch(a1);
    v20 = (id)qword_10003A5D8;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v22;
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&buf, 0xCu);

    }
    v21 = (id)qword_10003A5D8;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "reason"));
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v23;
      _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Reason: %@", (uint8_t *)&buf, 0xCu);

    }
    objc_end_catch();
    JUMPOUT(0x100025F80);
  }
  _Unwind_Resume(a1);
}

id sub_100026EE4(uint64_t a1)
{
  uint64_t v1;
  const __CFString *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 + 32);
  v3 = CFSTR("type");
  v4 = v1;
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v4, &v3, 1));
}

NSDictionary *__cdecl sub_100026F54(id a1)
{
  return (NSDictionary *)&off_100037B10;
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_RotateKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "RotateKeys:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend_addNotes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotes:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendBytes:length:");
}

id objc_msgSend_appendNotesTo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendNotesTo:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_authorizationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorizationStatus");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_codeSigningMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "codeSigningMonitor");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_contentsOfDirectoryAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "contentsOfDirectoryAtPath:error:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_coreFileWithCoreFilePath__::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreFileWithCoreFilePath::::");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_crashReporterKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "crashReporterKey");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDraft_forProcessNamed_withDisplayReason_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDraft:forProcessNamed:withDisplayReason:error:");
}

id objc_msgSend_createForSubmission_metadata_options_error_writing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createForSubmission:metadata:options:error:writing:");
}

id objc_msgSend_createPanicCriterials__::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPanicCriterials::::");
}

id objc_msgSend_createUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createUUIDString:");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataUsingEncoding_allowLossyConversion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:allowLossyConversion:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:");
}

id objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_dataWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:");
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfFile:options:error:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataWithJSONObject_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithJSONObject:options:error:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithPropertyList:format:options:error:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateFromString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateFromString:");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_decodeKCDataWithBlock_withTuning_usingCatalog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeKCDataWithBlock:withTuning:usingCatalog:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dictionaryWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjectsAndKeys:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileCreationDate");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSize");
}

id objc_msgSend_fileType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileType");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_fileURLWithPathComponents_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPathComponents:");
}

id objc_msgSend_filepath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filepath");
}

id objc_msgSend_files_to_attach(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "files_to_attach");
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstMatchInString:options:range:");
}

id objc_msgSend_force_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "force_run");
}

id objc_msgSend_getBuildVersionString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBuildVersionString");
}

id objc_msgSend_getCoreDumpContentsWithOffset_AndLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCoreDumpContentsWithOffset:AndLength:");
}

id objc_msgSend_getCoreDumpEncryptionKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCoreDumpEncryptionKey:");
}

id objc_msgSend_getCoreDumpInfoWithIndex__::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCoreDumpInfoWithIndex::::");
}

id objc_msgSend_getCoreDumpNameWithIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCoreDumpNameWithIndex:");
}

id objc_msgSend_getCorefileLogEncryptionKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCorefileLogEncryptionKey");
}

id objc_msgSend_getCorefileLogInfo_::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCorefileLogInfo:::");
}

id objc_msgSend_getCorefileZeroRanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCorefileZeroRanges");
}

id objc_msgSend_getEccFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getEccFormat:");
}

id objc_msgSend_getMatchingPrivateKey::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMatchingPrivateKey::");
}

id objc_msgSend_getNumCoreDumps(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNumCoreDumps");
}

id objc_msgSend_getPanicCriterials(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPanicCriterials");
}

id objc_msgSend_getPanicRegion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPanicRegion");
}

id objc_msgSend_getStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getStatus");
}

id objc_msgSend_get_paniclog_json(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "get_paniclog_json");
}

id objc_msgSend_hasMatchingPrivateKey::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasMatchingPrivateKey::");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_help(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "help");
}

id objc_msgSend_incidentID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "incidentID");
}

id objc_msgSend_init_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init:");
}

id objc_msgSend_initForPid_process_withReason_exceptionCode_exceptionCodeCount_stackshotFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForPid:process:withReason:exceptionCode:exceptionCodeCount:stackshotFlags:");
}

id objc_msgSend_initWithArgs_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArgs:count:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:encoding:freeWhenDone:");
}

id objc_msgSend_initWithCoreFilePath::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoreFilePath::");
}

id objc_msgSend_initWithCoreFilePath_::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoreFilePath:::");
}

id objc_msgSend_initWithCoreFilePath____::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoreFilePath::::::");
}

id objc_msgSend_initWithCriterials__::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCriterials::::");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithFileDescriptor_closeOnDealloc_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileDescriptor:closeOnDealloc:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithKeyStorePath::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithKeyStorePath::");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLocaleIdentifier:");
}

id objc_msgSend_initWithName_version_identifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:version:identifier:");
}

id objc_msgSend_initWithObjectsAndKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjectsAndKeys:");
}

id objc_msgSend_initWithPanicString_otherString_buildVersion_panicFlags_panicType_incidentID_rootsInstalled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPanicString:otherString:buildVersion:panicFlags:panicType:incidentID:rootsInstalled:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToDictionary:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isPatternPayloadAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPatternPayloadAvailable");
}

id objc_msgSend_isZeroes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isZeroes:");
}

id objc_msgSend_kernelVersionDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kernelVersionDescription");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_launchAppWith_options_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "launchAppWith:options:completion:");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_logType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logType");
}

id objc_msgSend_log_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "log_path");
}

id objc_msgSend_logfile(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "logfile");
}

id objc_msgSend_lookForKnownPanic_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookForKnownPanic:");
}

id objc_msgSend_lookForPattern::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookForPattern::");
}

id objc_msgSend_modelCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelCode");
}

id objc_msgSend_moveItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtPath:toPath:error:");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_output_dir(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "output_dir");
}

id objc_msgSend_panicString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "panicString");
}

id objc_msgSend_panic_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "panic_string");
}

id objc_msgSend_parseExtPaniclog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseExtPaniclog");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_patternMatching(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "patternMatching");
}

id objc_msgSend_privateKeyChecking(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "privateKeyChecking");
}

id objc_msgSend_problemType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "problemType");
}

id objc_msgSend_processExtPaniclogFlags_data_id_data_additionalBuffers_addToExtPaniclog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processExtPaniclogFlags:data_id:data:additionalBuffers:addToExtPaniclog:");
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productName");
}

id objc_msgSend_productNameVersionBuildString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productNameVersionBuildString");
}

id objc_msgSend_propertyListWithData_options_format_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "propertyListWithData:options:format:error:");
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeAtIndex:");
}

id objc_msgSend_rangeOfData_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfData:options:range:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rangeOfString:options:");
}

id objc_msgSend_readKeyFile___::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readKeyFile:::::");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reason");
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regularExpressionWithPattern:options:error:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_reportUsedImages(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportUsedImages");
}

id objc_msgSend_restoreos(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreos");
}

id objc_msgSend_saveCoreDumpAtOffset_withLength_named_encryptedWithPublicKey_toFileName_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCoreDumpAtOffset:withLength:named:encryptedWithPublicKey:toFileName:flags:");
}

id objc_msgSend_saveCoreDumpWithIndex_named_toFileName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveCoreDumpWithIndex:named:toFileName:");
}

id objc_msgSend_saveKernelCoreToDisk___::(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveKernelCoreToDisk:::::");
}

id objc_msgSend_saveUserSpaceCoreToDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveUserSpaceCoreToDisk:");
}

id objc_msgSend_saveWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveWithOptions:");
}

id objc_msgSend_serviceSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceSettings");
}

id objc_msgSend_setAttachments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAttachments:");
}

id objc_msgSend_setAutoDiagnostics_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAutoDiagnostics:");
}

id objc_msgSend_setClassification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClassification:");
}

id objc_msgSend_setComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponent:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setFiles_to_attach_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFiles_to_attach:");
}

id objc_msgSend_setForce_run_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForce_run:");
}

id objc_msgSend_setForegroundAppHash_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForegroundAppHash:");
}

id objc_msgSend_setHelp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHelp:");
}

id objc_msgSend_setIncidentID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIncidentID:");
}

id objc_msgSend_setIsUserInitiated_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsUserInitiated:");
}

id objc_msgSend_setKeywords_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeywords:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLog_path_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLog_path:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOutput_dir_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOutput_dir:");
}

id objc_msgSend_setPanicInitiator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPanicInitiator:");
}

id objc_msgSend_setPanicString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPanicString:");
}

id objc_msgSend_setPanic_string_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPanic_string:");
}

id objc_msgSend_setPatternMatching_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPatternMatching:");
}

id objc_msgSend_setProblemDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProblemDescription:");
}

id objc_msgSend_setRestoreos_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRestoreos:");
}

id objc_msgSend_setSOCIdAndRev(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSOCIdAndRev");
}

id objc_msgSend_setSourcePath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSourcePath:");
}

id objc_msgSend_setTakeAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTakeAction:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUtilizationInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUtilizationInfo:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sourcePath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourcePath");
}

id objc_msgSend_ss_sequence(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ss_sequence");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingCharactersInRange:withString:");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithString:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subdataWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subdataWithRange:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringWithRange:");
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeZoneWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneWithName:");
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unlock");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "usage");
}

id objc_msgSend_useExtPaniclog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useExtPaniclog:");
}

id objc_msgSend_useSocdContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useSocdContainer:");
}

id objc_msgSend_useSocdNandContainer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useSocdNandContainer:");
}

id objc_msgSend_useStackshotBuffer_size_frontmostPids_atTime_machTime_sequence_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useStackshotBuffer:size:frontmostPids:atTime:machTime:sequence:");
}

id objc_msgSend_useStoragePanicData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "useStoragePanicData:");
}

id objc_msgSend_validate_paniclog_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validate_paniclog:");
}

id objc_msgSend_validate_prologue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validate_prologue:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_withArgs_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withArgs:count:");
}

id objc_msgSend_withURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "withURL:");
}

id objc_msgSend_writeData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:");
}

id objc_msgSend_writeData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeData:error:");
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:atomically:");
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToFile:options:error:");
}
