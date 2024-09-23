uint64_t __gen2_der_heim_oid_cmp(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *a1;
  if (*a1 == *(_QWORD *)a2)
    return memcmp((const void *)a1[1], *(const void **)(a2 + 8), 4 * v2);
  else
    return v2 - *(_QWORD *)a2;
}

uint64_t __gen2_der_heim_octet_string_cmp(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)a1;
  if (*(_QWORD *)a1 == *(_QWORD *)a2)
    return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v2);
  else
    return v2 - *(_QWORD *)a2;
}

uint64_t __gen2_der_printable_string_cmp(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)a1;
  if (*(_QWORD *)a1 == *(_QWORD *)a2)
    return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v2);
  else
    return v2 - *(_QWORD *)a2;
}

uint64_t __gen2_der_ia5_string_cmp(uint64_t a1, uint64_t a2)
{
  size_t v2;

  v2 = *(_QWORD *)a1;
  if (*(_QWORD *)a1 == *(_QWORD *)a2)
    return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v2);
  else
    return v2 - *(_QWORD *)a2;
}

uint64_t __gen2_der_heim_bit_string_cmp(unint64_t *a1, _QWORD *a2)
{
  unint64_t v2;
  char *v3;
  unsigned __int8 *v4;
  unint64_t v5;
  uint64_t result;
  unsigned __int8 *v7;

  v2 = *a1;
  if (*a1 != *a2)
    return v2 - *a2;
  if (!v2)
    return 0;
  v3 = (char *)a1[1];
  v4 = (unsigned __int8 *)a2[1];
  v5 = v2 >> 3;
  result = memcmp(v3, v4, v2 >> 3);
  if ((_DWORD)result)
    return result;
  if ((v2 & 7) == 0)
    return 0;
  v7 = (unsigned __int8 *)&v3[v5];
  if (&v3[v5] < &v3[(v2 + 7) >> 3] && v7 >= (unsigned __int8 *)v3)
    return (*v7 >> (8 - (v2 & 7))) - (v4[v5] >> (8 - (v2 & 7)));
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_heim_integer_cmp(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  size_t v3;

  v2 = (*(_DWORD *)(a2 + 16) - *(_DWORD *)(a1 + 16));
  if (!(_DWORD)v2)
  {
    v3 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 == *(_QWORD *)a2)
      return memcmp(*(const void **)(a1 + 8), *(const void **)(a2 + 8), v3);
    return v3 - *(_QWORD *)a2;
  }
  return v2;
}

uint64_t __gen2_der_heim_bmp_string_cmp(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *a1;
  if (*a1 == *(_QWORD *)a2)
    return memcmp((const void *)a1[1], *(const void **)(a2 + 8), 2 * v2);
  else
    return v2 - *(_QWORD *)a2;
}

uint64_t __gen2_der_heim_universal_string_cmp(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *a1;
  if (*a1 == *(_QWORD *)a2)
    return memcmp((const void *)a1[1], *(const void **)(a2 + 8), 4 * v2);
  else
    return v2 - *(_QWORD *)a2;
}

uint64_t __gen2_heim_len_unsigned(unsigned int a1)
{
  uint64_t v1;
  unsigned int v2;

  v1 = 1;
  do
  {
    v2 = a1;
    a1 >>= 8;
    ++v1;
  }
  while (v2 > 0xFF);
  if (v2 <= 0x7F)
    return v1 - 1;
  else
    return v1;
}

uint64_t __gen2_heim_len_unsigned64(unint64_t a1)
{
  uint64_t v1;
  unint64_t v2;

  v1 = 1;
  do
  {
    v2 = a1;
    a1 >>= 8;
    ++v1;
  }
  while (v2 > 0xFF);
  if (v2 <= 0x7F)
    return v1 - 1;
  else
    return v1;
}

uint64_t __gen2_heim_len_int(unsigned int a1)
{
  uint64_t v1;
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;

  if ((a1 & 0x80000000) != 0)
  {
    v3 = ~a1;
    v1 = -1;
    do
    {
      v2 = v3;
      v3 >>= 8;
      ++v1;
    }
    while (v2 >= 0x100);
  }
  else
  {
    v1 = -1;
    do
    {
      v2 = a1;
      a1 >>= 8;
      ++v1;
    }
    while (v2 >= 0x100);
  }
  v4 = v1 + 1;
  v5 = v1 + 2;
  if (v2 >= 0x80)
    return v5;
  else
    return v4;
}

uint64_t _heim_len_int64(unint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((a1 & 0x8000000000000000) != 0)
  {
    v3 = ~a1;
    v1 = -1;
    do
    {
      v2 = v3;
      v3 >>= 8;
      ++v1;
    }
    while (v2 >= 0x100);
  }
  else
  {
    v1 = -1;
    do
    {
      v2 = a1;
      a1 >>= 8;
      ++v1;
    }
    while (v2 >= 0x100);
  }
  v4 = v1 + 1;
  v5 = v1 + 2;
  if (v2 >= 0x80)
    return v5;
  else
    return v4;
}

uint64_t __gen2_der_length_len(unint64_t a1)
{
  uint64_t result;
  unint64_t v2;
  BOOL v3;

  if (a1 < 0x80)
    return 1;
  v2 = a1;
  result = 1;
  do
  {
    ++result;
    v3 = v2 > 0xFF;
    v2 >>= 8;
  }
  while (v3);
  return result;
}

uint64_t __gen2_der_length_tag(unsigned int a1)
{
  uint64_t result;
  unsigned int v2;
  BOOL v3;

  if (a1 < 0x1F)
    return 1;
  v2 = a1;
  result = 1;
  do
  {
    ++result;
    v3 = v2 > 0x7F;
    v2 >>= 7;
  }
  while (v3);
  return result;
}

uint64_t __gen2_der_length_integer(unsigned int *a1)
{
  unsigned int v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *a1;
  if ((*a1 & 0x80000000) != 0)
  {
    v4 = ~v1;
    v2 = -1;
    do
    {
      v3 = v4;
      v4 >>= 8;
      ++v2;
    }
    while (v3 >= 0x100);
  }
  else
  {
    v2 = -1;
    do
    {
      v3 = v1;
      v1 >>= 8;
      ++v2;
    }
    while (v3 >= 0x100);
  }
  v5 = v2 + 1;
  v6 = v2 + 2;
  if (v3 >= 0x80)
    return v6;
  else
    return v5;
}

uint64_t __gen2_der_length_integer64(unint64_t *a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *a1;
  if ((*a1 & 0x8000000000000000) != 0)
  {
    v4 = ~v1;
    v2 = -1;
    do
    {
      v3 = v4;
      v4 >>= 8;
      ++v2;
    }
    while (v3 >= 0x100);
  }
  else
  {
    v2 = -1;
    do
    {
      v3 = v1;
      v1 >>= 8;
      ++v2;
    }
    while (v3 >= 0x100);
  }
  v5 = v2 + 1;
  v6 = v2 + 2;
  if (v3 >= 0x80)
    return v6;
  else
    return v5;
}

uint64_t __gen2_der_length_unsigned(unsigned int *a1)
{
  unsigned int v1;
  uint64_t v2;
  unsigned int v3;

  v1 = *a1;
  v2 = 1;
  do
  {
    v3 = v1;
    v1 >>= 8;
    ++v2;
  }
  while (v3 > 0xFF);
  if (v3 <= 0x7F)
    return v2 - 1;
  else
    return v2;
}

uint64_t __gen2_der_length_unsigned64(unint64_t *a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *a1;
  v2 = 1;
  do
  {
    v3 = v1;
    v1 >>= 8;
    ++v2;
  }
  while (v3 > 0xFF);
  if (v3 <= 0x7F)
    return v2 - 1;
  else
    return v2;
}

uint64_t __gen2_der_length_enumerated(unsigned int *a1)
{
  unsigned int v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *a1;
  if ((*a1 & 0x80000000) != 0)
  {
    v4 = ~v1;
    v2 = -1;
    do
    {
      v3 = v4;
      v4 >>= 8;
      ++v2;
    }
    while (v3 >= 0x100);
  }
  else
  {
    v2 = -1;
    do
    {
      v3 = v1;
      v1 >>= 8;
      ++v2;
    }
    while (v3 >= 0x100);
  }
  v5 = v2 + 1;
  v6 = v2 + 2;
  if (v3 >= 0x80)
    return v6;
  else
    return v5;
}

size_t __gen2_der_length_general_string(const char **a1)
{
  return strlen(*a1);
}

size_t __gen2_der_length_utf8string(const char **a1)
{
  return strlen(*a1);
}

uint64_t __gen2_der_length_printable_string(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t __gen2_der_length_ia5_string(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t __gen2_der_length_bmp_string(_QWORD *a1)
{
  return 2 * *a1;
}

uint64_t __gen2_der_length_universal_string(_QWORD *a1)
{
  return 4 * *a1;
}

size_t __gen2_der_length_visible_string(const char **a1)
{
  return strlen(*a1);
}

uint64_t __gen2_der_length_octet_string(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t __gen2_der_length_heim_integer(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  unsigned __int8 *v4;
  unsigned int v5;

  v1 = *a1;
  if (!*a1)
    return 1;
  v2 = *((_DWORD *)a1 + 4);
  if (v1 == 1 && v2 != 0)
  {
    v5 = *(unsigned __int8 *)a1[1];
    if (v5 == 1)
      return 1;
    return v1 + (v5 >> 7);
  }
  v4 = (unsigned __int8 *)a1[1];
  if (v2)
  {
    v5 = *v4;
    return v1 + (v5 >> 7);
  }
  return v1 + ((unint64_t)*v4 >> 7);
}

uint64_t __gen2_der_length_oid(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t result;
  unsigned int *v5;
  unsigned int v6;
  BOOL v7;

  v1 = *a1;
  if ((unint64_t)*a1 < 3)
    return 1;
  v2 = a1[1];
  v3 = 2;
  result = 1;
  while (1)
  {
    v5 = (unsigned int *)(v2 + 4 * v3);
    if ((unint64_t)v5 < v2)
      break;
    v6 = *v5;
    do
    {
      ++result;
      v7 = v6 > 0x7F;
      v6 >>= 7;
    }
    while (v7);
    if (++v3 == v1)
      return result;
  }
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_length_generalized_time(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v3 = 0;
  v4 = 0;
  __gen2_heim_time2generalizedtime(*a1, &v3, 1);
  v1 = v3;
  free(v4);
  return v1;
}

uint64_t __gen2_der_length_utctime(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;

  v3 = 0;
  v4 = 0;
  __gen2_heim_time2generalizedtime(*a1, &v3, 0);
  v1 = v3;
  free(v4);
  return v1;
}

uint64_t __gen2_der_length_BOOLean()
{
  return 1;
}

unint64_t __gen2_der_length_bit_string(_QWORD *a1)
{
  return ((unint64_t)(*a1 + 7) >> 3) + 1;
}

uint64_t __gen2_der_copy_general_string(const char **a1, char **a2)
{
  char *v3;

  v3 = strdup(*a1);
  *a2 = v3;
  if (v3)
    return 0;
  else
    return 12;
}

uint64_t __gen2_der_copy_integer(_DWORD *a1, _DWORD *a2)
{
  *a2 = *a1;
  return 0;
}

uint64_t __gen2_der_copy_integer64(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return 0;
}

uint64_t __gen2_der_copy_unsigned(_DWORD *a1, _DWORD *a2)
{
  *a2 = *a1;
  return 0;
}

uint64_t __gen2_der_copy_unsigned64(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return 0;
}

uint64_t __gen2_der_copy_generalized_time(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return 0;
}

uint64_t __gen2_der_copy_utctime(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return 0;
}

uint64_t __gen2_der_copy_utf8string(const char **a1, char **a2)
{
  char *v3;

  v3 = strdup(*a1);
  *a2 = v3;
  if (v3)
    return 0;
  else
    return 12;
}

uint64_t __gen2_der_copy_printable_string(uint64_t a1, unint64_t *a2)
{
  size_t v4;
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  _BYTE *v8;

  v4 = *(_QWORD *)a1 + 1;
  result = (uint64_t)malloc_type_malloc(v4, 0xFBB76D0CuLL);
  if (!result)
    return 12;
  if ((v4 & 0x8000000000000000) != 0
    || (v6 = *(_QWORD *)a1 + 1, v6 > v4)
    || (*a2 = v6, a2[1] = result, *(_QWORD *)a1 > v6)
    || (result = (uint64_t)memcpy((void *)result, *(const void **)(a1 + 8), *(_QWORD *)a1),
        v7 = a2[1],
        v8 = (_BYTE *)(v7 + *(_QWORD *)a1),
        (unint64_t)v8 >= v7 + *a2)
    || (unint64_t)v8 < v7)
  {
    __break(0x5519u);
  }
  else
  {
    result = 0;
    *v8 = 0;
  }
  return result;
}

unint64_t __gen2_der_copy_bmp_string(uint64_t a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t result;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = *(_QWORD *)a1;
  result = (unint64_t)malloc_type_malloc(2 * *(_QWORD *)a1, 0x1000040BDFB0063uLL);
  if (result)
    v6 = result + 2 * v4;
  else
    v6 = 0;
  v7 = *(_QWORD *)a1;
  if (result)
    v8 = 1;
  else
    v8 = v7 == 0;
  if (!v8)
    return 12;
  if (result > v6 || v7 > (uint64_t)(v6 - result) >> 1 || (*a2 = v7, a2[1] = result, 2 * v7 > 2 * *(_QWORD *)a1))
  {
    __break(0x5519u);
  }
  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), 2 * v7);
    return 0;
  }
  return result;
}

unint64_t __gen2_der_copy_universal_string(uint64_t a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t result;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = *(_QWORD *)a1;
  result = (unint64_t)malloc_type_malloc(4 * *(_QWORD *)a1, 0x100004052888210uLL);
  if (result)
    v6 = result + 4 * v4;
  else
    v6 = 0;
  v7 = *(_QWORD *)a1;
  if (result)
    v8 = 1;
  else
    v8 = v7 == 0;
  if (!v8)
    return 12;
  if (result > v6 || v7 > (uint64_t)(v6 - result) >> 2 || (*a2 = v7, a2[1] = result, 4 * v7 > 4 * *(_QWORD *)a1))
  {
    __break(0x5519u);
  }
  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), 4 * v7);
    return 0;
  }
  return result;
}

uint64_t __gen2_der_copy_visible_string(const char **a1, char **a2)
{
  char *v3;

  v3 = strdup(*a1);
  *a2 = v3;
  if (v3)
    return 0;
  else
    return 12;
}

unint64_t __gen2_der_copy_octet_string(uint64_t a1, size_t *a2)
{
  size_t v4;
  unint64_t result;
  size_t v6;
  BOOL v7;
  unint64_t v8;
  BOOL v9;
  size_t v10;
  BOOL v11;

  if (*(_QWORD *)(a1 + 8))
  {
    v4 = *(_QWORD *)a1;
    result = (unint64_t)malloc_type_malloc(*(_QWORD *)a1, 0xE7E96A63uLL);
    v6 = *(_QWORD *)a1;
    if (*(_QWORD *)a1)
      v7 = result == 0;
    else
      v7 = 0;
    if (v7)
    {
      return 12;
    }
    else
    {
      v8 = result + v4;
      if (!result)
        v8 = 0;
      v9 = v8 >= result;
      v10 = v8 - result;
      v11 = !v9 || v6 > v10;
      if (v11 || (*a2 = v6, a2[1] = result, v6 > *(_QWORD *)a1))
      {
        __break(0x5519u);
      }
      else
      {
        memcpy((void *)result, *(const void **)(a1 + 8), v6);
        return 0;
      }
    }
  }
  else
  {
    result = 0;
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

unint64_t __gen2_der_copy_heim_integer(uint64_t a1, uint64_t a2)
{
  size_t v4;
  unint64_t result;
  size_t v6;
  BOOL v7;
  unint64_t v8;
  BOOL v9;
  size_t v10;
  BOOL v11;

  v4 = *(_QWORD *)a1;
  result = (unint64_t)malloc_type_malloc(*(_QWORD *)a1, 0xC932F669uLL);
  v6 = *(_QWORD *)a1;
  if (result)
    v7 = 1;
  else
    v7 = v6 == 0;
  if (!v7)
    return 12;
  v8 = result + v4;
  if (!result)
    v8 = 0;
  v9 = v8 >= result;
  v10 = v8 - result;
  v11 = !v9 || v6 > v10;
  if (v11 || (*(_QWORD *)a2 = v6, *(_QWORD *)(a2 + 8) = result, v6 > *(_QWORD *)a1))
  {
    __break(0x5519u);
  }
  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), v6);
    result = 0;
    *(_DWORD *)(a2 + 16) = *(_DWORD *)(a1 + 16);
  }
  return result;
}

unint64_t __gen2_der_copy_oid(uint64_t a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t result;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = *(_QWORD *)a1;
  result = (unint64_t)malloc_type_malloc(4 * *(_QWORD *)a1, 0x100004052888210uLL);
  if (result)
    v6 = result + 4 * v4;
  else
    v6 = 0;
  v7 = *(_QWORD *)a1;
  if (result)
    v8 = 1;
  else
    v8 = v7 == 0;
  if (!v8)
    return 12;
  if (result > v6 || v7 > (uint64_t)(v6 - result) >> 2 || (*a2 = v7, a2[1] = result, 4 * v7 > 4 * *(_QWORD *)a1))
  {
    __break(0x5519u);
  }
  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), 4 * v7);
    return 0;
  }
  return result;
}

unint64_t __gen2_der_copy_bit_string(uint64_t a1, _QWORD *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t result;
  unint64_t v7;
  unint64_t v9;

  v4 = *(_QWORD *)a1 + 7;
  v5 = v4 >> 3;
  result = (unint64_t)malloc_type_malloc(v4 >> 3, 0xA15C12B6uLL);
  v7 = result + (v4 >> 3);
  if (!result)
    v7 = 0;
  if (v4 >= 8 && result == 0)
    return 12;
  if (result > v7
    || (v9 = (unint64_t)(*(_QWORD *)a1 + 7) >> 3, v9 > v7 - result)
    || (*a2 = *(_QWORD *)a1, a2[1] = result, v5 > v9)
    || v5 > (unint64_t)(*(_QWORD *)a1 + 7) >> 3)
  {
    __break(0x5519u);
  }
  else
  {
    memcpy((void *)result, *(const void **)(a1 + 8), v4 >> 3);
    return 0;
  }
  return result;
}

unint64_t __gen2_decode_heim_any(_BYTE *a1, unint64_t a2, size_t *a3, _QWORD *a4)
{
  unint64_t result;
  size_t v11;
  size_t v12;
  int v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;

  v16 = 0;
  v17 = 0;
  v14 = 0;
  v15 = 0;
  v13 = 0;
  *a3 = 0;
  a3[1] = 0;
  result = __gen2_der_get_tag(a1, a2, (int *)&v14 + 1, (int *)&v14, &v13, (uint64_t *)&v15);
  if (!(_DWORD)result)
  {
    result = 1859794436;
    if (a2 >= v15)
    {
      result = (unint64_t)&a1[v15];
      if (&a1[a2] < &a1[v15] || result < (unint64_t)a1)
        goto LABEL_23;
      result = __gen2_der_get_length((char *)result, a2 - v15, &v16, &v17);
      if ((_DWORD)result)
        return result;
      if (v16 == 3705724653)
      {
        result = 1859794436;
        if (a2 < v15 + v17)
          return result;
        v16 = a2 - (v15 + v17);
        v11 = a2;
      }
      else
      {
        v11 = v17 + v16 + v15;
        result = 1859794436;
        if (v11 > a2)
          return result;
      }
      result = (unint64_t)malloc_type_malloc(v11, 0xEA45D230uLL);
      if (!result)
        return 12;
      if ((v11 & 0x8000000000000000) != 0
        || (v12 = v17 + v16 + v15, v12 > v11)
        || (*a3 = v12, a3[1] = result, v12 > a2))
      {
LABEL_23:
        __break(0x5519u);
        return result;
      }
      memcpy((void *)result, a1, v12);
      result = 0;
      if (a4)
        *a4 = v17 + v16 + v15;
    }
  }
  return result;
}

uint64_t __gen2_length_heim_any(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t __gen2_length_heim_any_set(uint64_t a1)
{
  return *(_QWORD *)a1;
}

unint64_t __gen2_der_parse_hex_heim_integer(char *__s, uint64_t a2)
{
  const char *v3;
  int64_t v4;
  size_t v5;
  _BYTE *v6;
  size_t v7;
  unint64_t result;
  unint64_t v9;
  const void *v10;
  _BYTE *v11;

  v3 = __s;
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  if (*__s == 45)
  {
    v3 = __s + 1;
    *(_DWORD *)(a2 + 16) = 1;
  }
  v4 = strlen(v3);
  if (v4 <= 0)
    goto LABEL_15;
  v5 = ((unint64_t)v4 >> 1) + 1;
  v6 = malloc_type_malloc(v5, 0xEA67EB40uLL);
  if (!v6)
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    return 12;
  }
  *(_QWORD *)a2 = v5;
  *(_QWORD *)(a2 + 8) = v6;
  v7 = rk_hex_decode(v3, v6, v5);
  result = *(_QWORD *)(a2 + 8);
  if ((v7 & 0x8000000000000000) != 0)
  {
    free((void *)result);
LABEL_15:
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    return 22;
  }
  v9 = result + *(_QWORD *)a2;
  if (v7)
  {
    v10 = (const void *)(result + v7);
    v11 = *(_BYTE **)(a2 + 8);
    while ((unint64_t)v11 < v9 && (unint64_t)v11 >= result)
    {
      if (*v11)
      {
        v10 = v11;
        goto LABEL_18;
      }
      ++v11;
      if (!--v7)
        goto LABEL_18;
    }
  }
  else
  {
    v10 = *(const void **)(a2 + 8);
LABEL_18:
    if (v7 <= *(_QWORD *)a2
      && (unint64_t)v10 <= v9
      && result <= (unint64_t)v10
      && v7 <= v9 - (unint64_t)v10)
    {
      result = (unint64_t)memmove((void *)result, v10, v7);
      if (v7 <= *(_QWORD *)a2)
      {
        result = 0;
        *(_QWORD *)a2 = v7;
        return result;
      }
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_print_hex_heim_integer(uint64_t a1, char **a2)
{
  int v4;
  uint64_t result;
  char *v6;

  v6 = 0;
  if (((unint64_t)rk_hex_encode(*(_BYTE **)(a1 + 8), *(_QWORD *)a1, a2) & 0x8000000000000000) != 0)
    return 12;
  if (*(_DWORD *)(a1 + 16))
  {
    v4 = asprintf(&v6, "-%s", *a2);
    free(*a2);
    if ((v4 & 0x80000000) == 0)
    {
      result = 0;
      *a2 = v6;
      return result;
    }
    return 12;
  }
  return 0;
}

uint64_t __gen2_der_print_heim_oid(unint64_t *a1, char a2, char **a3)
{
  unint64_t v5;
  uint64_t v6;
  int v7;
  size_t v8;
  unsigned int v9;
  uint64_t result;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  char __source[2];
  char __str[25];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  __source[0] = a2;
  __source[1] = 0;
  if (!*a1)
    return 22;
  v5 = 0;
  v6 = 0;
  do
  {
    v7 = *(_DWORD *)(a1[1] + 4 * v6);
    v8 = v5 + 2;
    do
    {
      v9 = v7 + 9;
      v7 /= 10;
      ++v8;
    }
    while (v9 > 0x12);
    v5 = v8 - 1;
    ++v6;
  }
  while (v6 != *a1);
  result = (uint64_t)malloc_type_malloc(v8, 0x986FF779uLL);
  if (result)
  {
    if (v5 > 0x7FFFFFFFFFFFFFFELL)
    {
      __break(0x5519u);
      return result;
    }
    v11 = (char *)result;
    *(_BYTE *)result = 0;
    if (!*a1)
    {
LABEL_15:
      result = 0;
      *a3 = v11;
      return result;
    }
    v12 = 0;
    while (1)
    {
      snprintf(__str, 0x19uLL, "%d", *(_DWORD *)(a1[1] + 4 * v12));
      if (strlcat(v11, __str, v8) >= v8)
        break;
      v13 = *a1;
      if (v12 < *a1 - 1)
      {
        if (strlcat(v11, __source, v8) >= v8)
          break;
        v13 = *a1;
      }
      if (++v12 >= v13)
        goto LABEL_15;
    }
    free(v11);
  }
  return 12;
}

uint64_t __gen2_der_parse_heim_oid(const char *a1, const char *a2, uint64_t a3)
{
  const char *v4;
  char *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t result;
  char *v12;
  char *v14;
  char *__lasts;

  __lasts = 0;
  if (a2)
    v4 = a2;
  else
    v4 = ".";
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  v5 = strdup(a1);
  v6 = (uint64_t)strtok_r(v5, v4, &__lasts);
  if (v6)
  {
    v14 = 0;
    while (1)
    {
      v7 = *(_QWORD *)a3;
      v8 = *(_QWORD *)a3 + 1;
      v9 = (char *)malloc_type_realloc(*(void **)(a3 + 8), 4 * v8, 0x61F13AC1uLL);
      if (!v9)
      {
        v6 = 12;
LABEL_20:
        __gen2_der_free_oid(a3);
        goto LABEL_21;
      }
      v10 = v9;
      result = strtol((const char *)v6, &v14, 10);
      v6 = 22;
      if (*v14 || result < 0 || result > 0x7FFFFFFF)
        goto LABEL_20;
      v12 = &v10[4 * *(_QWORD *)a3];
      if (v12 >= &v10[4 * v8] || v12 < v10)
        break;
      *(_DWORD *)v12 = result;
      if (4 * v8 < 0 || v7 >= (v8 & 0x3FFFFFFFFFFFFFFFuLL))
        break;
      *(_QWORD *)a3 = v8;
      *(_QWORD *)(a3 + 8) = v10;
      v6 = (uint64_t)strtok_r(0, v4, &__lasts);
      if (!v6)
        goto LABEL_21;
    }
    __break(0x5519u);
  }
  else
  {
LABEL_21:
    free(v5);
    return v6;
  }
  return result;
}

unint64_t __gen2_der_put_unsigned(unint64_t result, uint64_t a2, unsigned int *a3, uint64_t *a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  _BYTE *v9;
  unsigned int v10;
  uint64_t v11;

  v4 = a2 - 1;
  if (!a2)
    v4 = 0;
  v5 = result - v4;
  v6 = result - v4 + a2;
  if (result - v4 <= v6)
  {
    v7 = *a3;
    if (*a3)
    {
      v8 = 1859794436;
      if (a2)
      {
        v9 = (_BYTE *)result;
        do
        {
          if ((unint64_t)v9 >= v6)
            goto LABEL_26;
          if ((unint64_t)v9 < v5)
            goto LABEL_26;
          v10 = v7;
          *v9 = v7;
          if (a2 < 0)
            goto LABEL_26;
          --v9;
          if (!--a2)
            break;
          v7 >>= 8;
        }
        while (v10 > 0xFF);
        if (v10 > 0xFF)
          return v8;
        if ((v10 & 0x80) == 0)
        {
LABEL_18:
          v11 = result - (_QWORD)v9;
          goto LABEL_23;
        }
        if (!a2)
          return v8;
        if ((unint64_t)v9 < v6 && (unint64_t)v9 >= v5)
        {
          *v9-- = 0;
          goto LABEL_18;
        }
        goto LABEL_26;
      }
      return v8;
    }
    if (!a2)
      return 1859794436;
    if (v4 >= 0 && v6 > result)
    {
      *(_BYTE *)result = 0;
      v11 = 1;
LABEL_23:
      v8 = 0;
      *a4 = v11;
      return v8;
    }
  }
LABEL_26:
  __break(0x5519u);
  return result;
}

unint64_t __gen2_der_put_unsigned64(unint64_t result, uint64_t a2, unint64_t *a3, uint64_t *a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  unint64_t v10;
  uint64_t v11;

  v4 = a2 - 1;
  if (!a2)
    v4 = 0;
  v5 = result - v4;
  v6 = result - v4 + a2;
  if (result - v4 <= v6)
  {
    v7 = *a3;
    if (*a3)
    {
      v8 = 1859794436;
      if (a2)
      {
        v9 = (_BYTE *)result;
        do
        {
          if ((unint64_t)v9 >= v6)
            goto LABEL_26;
          if ((unint64_t)v9 < v5)
            goto LABEL_26;
          v10 = v7;
          *v9 = v7;
          if (a2 < 0)
            goto LABEL_26;
          --v9;
          if (!--a2)
            break;
          v7 >>= 8;
        }
        while (v10 > 0xFF);
        if (v10 > 0xFF)
          return v8;
        if (((char)v10 & 0x80000000) == 0)
        {
LABEL_18:
          v11 = result - (_QWORD)v9;
          goto LABEL_23;
        }
        if (!a2)
          return v8;
        if ((unint64_t)v9 < v6 && (unint64_t)v9 >= v5)
        {
          *v9-- = 0;
          goto LABEL_18;
        }
        goto LABEL_26;
      }
      return v8;
    }
    if (!a2)
      return 1859794436;
    if (v4 >= 0 && v6 > result)
    {
      *(_BYTE *)result = 0;
      v11 = 1;
LABEL_23:
      v8 = 0;
      *a4 = v11;
      return v8;
    }
  }
LABEL_26:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_put_integer(uint64_t result, uint64_t a2, unsigned int *a3, _QWORD *a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  _BYTE *v8;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;

  v4 = a2 - 1;
  if (!a2)
    v4 = 0;
  v5 = result - v4;
  v6 = v5 + a2;
  if (v5 > v5 + a2)
    goto LABEL_30;
  v7 = *a3;
  if ((*a3 & 0x80000000) != 0)
  {
    v10 = ~v7;
    v8 = (_BYTE *)result;
    do
    {
      if (!a2)
        return 1859794436;
      if ((unint64_t)v8 >= v6)
        goto LABEL_30;
      if ((unint64_t)v8 < v5)
        goto LABEL_30;
      v11 = v10;
      *v8 = ~(_BYTE)v10;
      if (a2 < 0)
        goto LABEL_30;
      --v8;
      --a2;
      v10 >>= 8;
    }
    while (v11 > 0xFF);
    if ((v11 & 0x80) == 0)
    {
LABEL_27:
      v12 = 0;
      *a4 = result - (_QWORD)v8;
      return v12;
    }
    if (!a2)
      return 1859794436;
    if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
    {
      *v8-- = -1;
      goto LABEL_27;
    }
LABEL_30:
    __break(0x5519u);
    return result;
  }
  v8 = (_BYTE *)result;
  while (a2)
  {
    if ((unint64_t)v8 >= v6)
      goto LABEL_30;
    if ((unint64_t)v8 < v5)
      goto LABEL_30;
    v9 = v7;
    *v8 = v7;
    if (a2 < 0)
      goto LABEL_30;
    --v8;
    --a2;
    v7 >>= 8;
    if (v9 <= 0xFF)
    {
      if ((v9 & 0x80) == 0)
        goto LABEL_27;
      if (!a2)
        return 1859794436;
      if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
      {
        *v8-- = 0;
        goto LABEL_27;
      }
      goto LABEL_30;
    }
  }
  return 1859794436;
}

uint64_t __gen2_der_put_integer64(uint64_t result, uint64_t a2, unint64_t *a3, _QWORD *a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE *v8;
  char v9;
  BOOL v10;
  unint64_t v11;
  char v12;
  uint64_t v13;

  v4 = a2 - 1;
  if (!a2)
    v4 = 0;
  v5 = result - v4;
  v6 = v5 + a2;
  if (v5 > v5 + a2)
    goto LABEL_30;
  v7 = *a3;
  if ((*a3 & 0x8000000000000000) != 0)
  {
    v11 = ~v7;
    v8 = (_BYTE *)result;
    do
    {
      if (!a2)
        return 1859794436;
      if ((unint64_t)v8 >= v6)
        goto LABEL_30;
      if ((unint64_t)v8 < v5)
        goto LABEL_30;
      *v8 = ~(_BYTE)v11;
      if (a2 < 0)
        goto LABEL_30;
      v12 = v11;
      --v8;
      --a2;
      v10 = v11 > 0xFF;
      v11 >>= 8;
    }
    while (v10);
    if ((v12 & 0x80000000) == 0)
    {
LABEL_27:
      v13 = 0;
      *a4 = result - (_QWORD)v8;
      return v13;
    }
    if (!a2)
      return 1859794436;
    if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
    {
      *v8-- = -1;
      goto LABEL_27;
    }
LABEL_30:
    __break(0x5519u);
    return result;
  }
  v8 = (_BYTE *)result;
  while (a2)
  {
    if ((unint64_t)v8 >= v6)
      goto LABEL_30;
    if ((unint64_t)v8 < v5)
      goto LABEL_30;
    *v8 = v7;
    if (a2 < 0)
      goto LABEL_30;
    v9 = v7;
    --v8;
    --a2;
    v10 = v7 > 0xFF;
    v7 >>= 8;
    if (!v10)
    {
      if ((v9 & 0x80000000) == 0)
        goto LABEL_27;
      if (!a2)
        return 1859794436;
      if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
      {
        *v8-- = 0;
        goto LABEL_27;
      }
      goto LABEL_30;
    }
  }
  return 1859794436;
}

_BYTE *__gen2_der_put_length(_BYTE *result, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  BOOL v11;

  if (a2)
    v4 = a2 - 1;
  else
    v4 = 0;
  v5 = &result[-v4];
  v6 = &result[a2 - v4];
  if (&result[-v4] <= v6)
  {
    v7 = 1859794436;
    if (!a2)
      return (_BYTE *)v7;
    if (a3 >= 0x80)
    {
      v9 = 0;
      while (1 - a2 != v9)
      {
        v10 = &result[v9];
        if (&result[v9] >= v6)
          goto LABEL_24;
        if (v10 < v5)
          goto LABEL_24;
        *v10 = a3;
        if (~a2 == v9)
          goto LABEL_24;
        --v9;
        v11 = a3 > 0xFF;
        a3 >>= 8;
        if (!v11)
        {
          if (&result[v9] >= v6 || &result[v9] < v5)
            goto LABEL_24;
          result[v9] = -(char)v9 | 0x80;
          if (a4)
          {
            v8 = 1 - v9;
            goto LABEL_21;
          }
          return 0;
        }
      }
      return (_BYTE *)v7;
    }
    if ((-v4 < 0 || v4 == 0) && v6 > result)
    {
      *result = a3;
      v8 = 1;
LABEL_21:
      v7 = 0;
      *a4 = v8;
      return (_BYTE *)v7;
    }
  }
LABEL_24:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_put_BOOLean(char *a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  uint64_t result;
  char v6;

  if (!a2)
    return 1859794436;
  result = 0;
  if (*a3)
    v6 = -1;
  else
    v6 = 0;
  *a1 = v6;
  *a4 = 1;
  return result;
}

unint64_t __gen2_der_put_general_string(unint64_t result, size_t a2, const char **a3, size_t *a4)
{
  size_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v9;
  const char *v10;
  size_t v11;
  size_t v12;
  BOOL v13;
  BOOL v14;

  v4 = a2 - 1;
  if (!a2)
    v4 = 0;
  v5 = result - v4;
  v6 = result - v4 + a2;
  if (result - v4 > v6)
    goto LABEL_17;
  v9 = result;
  v10 = *a3;
  v11 = strlen(*a3);
  if (v11 > a2)
    return 1859794436;
  v12 = v11;
  result = v9 - v11 + 1;
  v13 = v10 > &v10[v12] || result > v6;
  v14 = !v13 && result >= v5;
  if (!v14 || v12 > v6 - result)
  {
LABEL_17:
    __break(0x5519u);
  }
  else
  {
    memcpy((void *)result, v10, v12);
    result = 0;
    *a4 = v12;
  }
  return result;
}

unint64_t __gen2_der_put_octet_string(unint64_t result, size_t a2, uint64_t a3, size_t *a4)
{
  size_t v4;
  unint64_t v5;
  unint64_t v6;
  size_t v8;
  BOOL v10;
  size_t v12;

  v4 = a2 - 1;
  if (!a2)
    v4 = 0;
  v5 = result - v4;
  v6 = v5 + a2;
  if (v5 <= v5 + a2)
  {
    v8 = *(_QWORD *)a3;
    if (v8 > a2)
      return 1859794436;
    if (!v8)
    {
      v12 = 0;
      goto LABEL_17;
    }
    if ((v8 & 0x8000000000000000) == 0)
    {
      result = result - v8 + 1;
      v10 = result <= v6 && result >= v5;
      if (v10 && v8 <= v6 - result)
      {
        memcpy((void *)result, *(const void **)(a3 + 8), v8);
        v12 = *(_QWORD *)a3;
LABEL_17:
        result = 0;
        *a4 = v12;
        return result;
      }
    }
  }
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_put_bmp_string(uint64_t result, unint64_t a2, unint64_t *a3, uint64_t *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE *v10;
  _BYTE *v11;
  unint64_t v13;
  BOOL v14;
  BOOL v15;
  uint64_t v17;

  v4 = a2 - 1;
  if (!a2)
    v4 = 0;
  v5 = result - v4;
  v6 = v5 + a2;
  if (v5 > v5 + a2)
  {
LABEL_30:
    __break(0x5519u);
    return result;
  }
  v7 = *a3;
  if (*a3 > a2 >> 1)
    return 1859794436;
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = (_BYTE *)(result - 2 * v7 + 2);
    while (1)
    {
      v11 = v10 - 1;
      if ((unint64_t)(v10 - 1) >= v6 || (unint64_t)v11 < v5)
        goto LABEL_30;
      *v11 = *(_BYTE *)(a3[1] + 2 * v9 + 1);
      v13 = a3[1];
      v14 = v13 + v8 < v13 + 2 * *a3 && v13 + v8 >= v13;
      v15 = !v14 || (unint64_t)v10 >= v6;
      if (v15 || (unint64_t)v10 < v5)
        goto LABEL_30;
      *v10 = *(_BYTE *)(v13 + 2 * v9);
      v10 += 2;
      ++v9;
      v8 += 2;
      if (v9 >= *a3)
      {
        v17 = 2 * *a3;
        goto LABEL_27;
      }
    }
  }
  v17 = 0;
LABEL_27:
  result = 0;
  if (a4)
    *a4 = v17;
  return result;
}

uint64_t __gen2_der_put_universal_string(uint64_t result, unint64_t a2, unint64_t *a3, uint64_t *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  _BYTE *v16;
  BOOL v17;
  unint64_t v19;
  _DWORD *v20;
  BOOL v21;
  _BYTE *v22;
  BOOL v23;
  unint64_t v25;
  _DWORD *v26;
  _BYTE *v27;
  uint64_t v28;

  v4 = a2 - 1;
  if (!a2)
    v4 = 0;
  v5 = result - v4;
  v6 = v5 + a2;
  if (v5 > v5 + a2)
  {
LABEL_45:
    __break(0x5519u);
    return result;
  }
  v7 = *a3;
  if (*a3 > a2 >> 2)
    return 1859794436;
  if (v7)
  {
    v8 = 0;
    v9 = 0;
    v10 = result - 4 * v7;
    while (1)
    {
      v11 = (_BYTE *)(v10 + v8 + 1);
      if ((unint64_t)v11 >= v6 || (unint64_t)v11 < v5)
        goto LABEL_45;
      *v11 = *(_BYTE *)(a3[1] + v8 + 3);
      v13 = a3[1];
      v14 = v13 + v8;
      v15 = v13 + v8 < v13 + 4 * *a3 && v14 >= v13;
      v16 = (_BYTE *)(v10 + v8 + 2);
      v17 = !v15 || (unint64_t)v16 >= v6;
      if (v17 || (unint64_t)v16 < v5)
        goto LABEL_45;
      *v16 = *(_WORD *)(v14 + 2);
      v19 = a3[1];
      v20 = (_DWORD *)(v19 + v8);
      v21 = v19 + v8 < v19 + 4 * *a3 && (unint64_t)v20 >= v19;
      v22 = (_BYTE *)(v10 + v8 + 3);
      v23 = !v21 || (unint64_t)v22 >= v6;
      if (v23 || (unint64_t)v22 < v5)
        goto LABEL_45;
      *v22 = BYTE1(*v20);
      v25 = a3[1];
      v26 = (_DWORD *)(v25 + v8);
      if (v25 + v8 >= v25 + 4 * *a3)
        goto LABEL_45;
      if ((unint64_t)v26 < v25)
        goto LABEL_45;
      v27 = (_BYTE *)(v10 + v8 + 4);
      if ((unint64_t)v27 >= v6 || (unint64_t)v27 < v5)
        goto LABEL_45;
      *v27 = *v26;
      ++v9;
      v8 += 4;
      if (v9 >= *a3)
      {
        v28 = 4 * *a3;
        goto LABEL_42;
      }
    }
  }
  v28 = 0;
LABEL_42:
  result = 0;
  if (a4)
    *a4 = v28;
  return result;
}

unint64_t __gen2_der_put_heim_integer(unint64_t result, size_t a2, uint64_t a3, uint64_t *a4)
{
  size_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v10;
  size_t v11;
  uint64_t v12;
  unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  _BOOL4 v17;
  size_t v18;
  unsigned __int8 *v19;
  BOOL v20;
  int v21;
  _BYTE *v22;
  char *v23;

  v4 = a2 - 1;
  if (!a2)
    v4 = 0;
  v5 = result - v4;
  v6 = result - v4 + a2;
  if (result - v4 > v6)
    goto LABEL_54;
  v10 = -(uint64_t)v4;
  v11 = *(_QWORD *)a3;
  if (!*(_QWORD *)a3)
  {
    if (a2)
    {
      if (v10 > 0 || v6 <= result)
        goto LABEL_54;
      *(_BYTE *)result = 0;
      if (a4)
      {
        v15 = 1;
LABEL_46:
        v12 = 0;
        *a4 = v15;
        return v12;
      }
      return 0;
    }
    return 1859794436;
  }
  v12 = 1859794436;
  if (v11 > a2)
    return v12;
  v13 = *(unsigned __int8 **)(a3 + 8);
  if (!*(_DWORD *)(a3 + 16))
  {
    v22 = (_BYTE *)(result - v11);
    v23 = (char *)(result - v11 + 1);
    if (v6 < (unint64_t)v23 || (unint64_t)v23 < v5 || v11 > v6 - (unint64_t)v23)
      goto LABEL_54;
    result = (unint64_t)memcpy((void *)(result - v11 + 1), v13, *(_QWORD *)a3);
    if ((unint64_t)v23 >= v6)
      goto LABEL_54;
    if (*v23 < 0)
    {
      if (v11 == a2)
        return v12;
      if ((unint64_t)v22 >= v6 || (unint64_t)v22 < v5)
        goto LABEL_54;
      *v22 = 0;
LABEL_51:
      v14 = 1;
      if (!a4)
        return 0;
LABEL_45:
      v15 = *(_QWORD *)a3 + v14;
      goto LABEL_46;
    }
LABEL_44:
    v14 = 0;
    if (a4)
      goto LABEL_45;
    return 0;
  }
  if (v11 == 1 && *v13 == 1)
  {
    if (v10 <= 0 && v6 > result)
    {
      v14 = 0;
      *(_BYTE *)result = -1;
      if (!a4)
        return 0;
      goto LABEL_45;
    }
  }
  else
  {
    v16 = v13 - 1;
    v17 = 1;
    v18 = *(_QWORD *)a3;
    while (1)
    {
      v19 = &v16[v18];
      v20 = &v16[v18] < &v13[v11] && v19 >= v13;
      if (!v20 || result >= v6 || result < v5)
        break;
      v21 = *v19;
      LOBYTE(v19) = ~(_BYTE)v21;
      *(_BYTE *)result = ~(_BYTE)v21;
      if (v17)
      {
        LODWORD(v19) = -v21;
        *(_BYTE *)result = -(char)v21;
        v17 = v21 == 0;
      }
      --v18;
      --result;
      if (v18 + 1 <= 1)
      {
        if ((v19 & 0x80) != 0)
          goto LABEL_44;
        if (v11 == a2)
          return v12;
        if (result < v6 && result >= v5)
        {
          *(_BYTE *)result = -1;
          goto LABEL_51;
        }
        break;
      }
    }
  }
LABEL_54:
  __break(0x5519u);
  return result;
}

unint64_t __gen2_der_put_generalized_time(unint64_t a1, size_t a2, uint64_t *a3, _QWORD *a4)
{
  unint64_t v7;
  size_t v9;
  uint64_t v10;
  void *v11;

  v10 = 0;
  v11 = 0;
  v7 = __gen2_heim_time2generalizedtime(*a3, &v10, 1);
  if (!(_DWORD)v7)
  {
    v9 = 0;
    v7 = __gen2_der_put_octet_string(a1, a2, (uint64_t)&v10, &v9);
    free(v11);
    if (!(_DWORD)v7)
    {
      v7 = 0;
      if (a4)
        *a4 = v9;
    }
  }
  return v7;
}

uint64_t __gen2_heim_time2generalizedtime(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v5;
  char *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = 0;
  v9 = 0u;
  v10 = 0u;
  v8 = 0u;
  if (a3)
    v5 = 15;
  else
    v5 = 13;
  *a2 = 0;
  a2[1] = 0;
  if (!__gen2_der_gmtime(a1, (uint64_t)&v8))
    return 1859794432;
  v6 = (char *)malloc_type_malloc(v5 + 1, 0x63EB7E03uLL);
  if (!v6)
    return 12;
  *a2 = v5;
  a2[1] = (uint64_t)v6;
  if (a3)
    snprintf(v6, v5 + 1, "%04d%02d%02d%02d%02d%02dZ", (DWORD1(v9) + 1900));
  else
    snprintf(v6, v5 + 1, "%02d%02d%02d%02d%02d%02dZ", (SDWORD1(v9) % 100));
  return 0;
}

unint64_t __gen2_der_put_utctime(unint64_t a1, size_t a2, uint64_t *a3, _QWORD *a4)
{
  unint64_t v7;
  size_t v9;
  uint64_t v10;
  void *v11;

  v10 = 0;
  v11 = 0;
  v7 = __gen2_heim_time2generalizedtime(*a3, &v10, 0);
  if (!(_DWORD)v7)
  {
    v9 = 0;
    v7 = __gen2_der_put_octet_string(a1, a2, (uint64_t)&v10, &v9);
    free(v11);
    if (!(_DWORD)v7)
    {
      v7 = 0;
      if (a4)
        *a4 = v9;
    }
  }
  return v7;
}

uint64_t __gen2_der_put_oid(uint64_t result, unint64_t a2, _QWORD *a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _BYTE *v8;
  unint64_t v9;
  unsigned int *v10;
  BOOL v11;
  unsigned int v12;
  _DWORD *v13;
  BOOL v14;
  uint64_t v16;

  v4 = a2 - 1;
  if (!a2)
    v4 = 0;
  v5 = result - v4;
  v6 = v5 + a2;
  if (v5 > v5 + a2)
    goto LABEL_37;
  v7 = *a3 - 1;
  v8 = (_BYTE *)result;
  while (v7 >= 2)
  {
    v9 = a3[1];
    v10 = (unsigned int *)(v9 + 4 * v7);
    v11 = (unint64_t)v10 < v9 + 4 * *a3 && (unint64_t)v10 >= v9;
    if (!v11)
      goto LABEL_37;
    if (!a2)
      return 1859794436;
    if ((unint64_t)v8 >= v6)
      goto LABEL_37;
    if ((unint64_t)v8 < v5)
      goto LABEL_37;
    v12 = *v10;
    *v8 = v12 & 0x7F;
    if ((a2 & 0x8000000000000000) != 0)
      goto LABEL_37;
    --v8;
    --a2;
    while (v12 >= 0x80)
    {
      if (!a2)
        return 1859794436;
      if ((unint64_t)v8 < v6 && (unint64_t)v8 >= v5)
      {
        v12 >>= 7;
        *v8-- = v12 | 0x80;
        v11 = a2 - 1 >= a2;
        --a2;
        if (!v11)
          continue;
      }
      goto LABEL_37;
    }
    --v7;
  }
  if (!a2)
    return 1859794436;
  if (*a3)
  {
    v13 = (_DWORD *)a3[1];
    v14 = v13 + 1 >= &v13[*a3] || (unint64_t)v8 >= v6;
    if (!v14 && (unint64_t)v8 >= v5)
    {
      v16 = 0;
      *v8 = v13[1] + 40 * *v13;
      *a4 = result - (_QWORD)v8 + 1;
      return v16;
    }
  }
LABEL_37:
  __break(0x5519u);
  return result;
}

unint64_t __gen2_der_put_tag(unint64_t result, uint64_t a2, char a3, char a4, unsigned int a5, uint64_t *a6)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _BYTE *v12;
  BOOL v13;
  _BYTE *v14;

  if (a2)
    v6 = a2 - 1;
  else
    v6 = 0;
  v7 = result - v6;
  v8 = result - v6 + a2;
  if (result - v6 > v8)
    goto LABEL_22;
  if (a5 >= 0x1F)
  {
    v10 = 0;
    v11 = 0;
    while (-a2 != v10)
    {
      v12 = (_BYTE *)(result + v10);
      if (result + v10 >= v8)
        goto LABEL_22;
      if ((unint64_t)v12 < v7)
        goto LABEL_22;
      *v12 = a5 & 0x7F | v11;
      if (~a2 == v10)
        goto LABEL_22;
      --v10;
      v11 = 0x80;
      v13 = a5 > 0x7F;
      a5 >>= 7;
      if (!v13)
      {
        if (!(a2 + v10))
          return 1859794436;
        v14 = (_BYTE *)(result + v10);
        if (result + v10 < v8 && (unint64_t)v14 >= v7)
        {
          *v14 = (32 * a4) | (a3 << 6) | 0x1F;
          v9 = 1 - v10;
          goto LABEL_21;
        }
        goto LABEL_22;
      }
    }
    return 1859794436;
  }
  if (!a2)
    return 1859794436;
  if (v6 < 0 || v8 <= result)
  {
LABEL_22:
    __break(0x5519u);
    return result;
  }
  *(_BYTE *)result = (32 * a4) | (a3 << 6) | a5;
  v9 = 1;
LABEL_21:
  result = 0;
  *a6 = v9;
  return result;
}

_BYTE *__gen2_der_put_length_and_tag(_BYTE *result, unint64_t a2, unint64_t a3, char a4, char a5, unsigned int a6, _QWORD *a7)
{
  unint64_t v7;
  _BYTE *v13;
  unint64_t v14;
  unint64_t v15;

  v7 = a2 - 1;
  if (!a2)
    v7 = 0;
  if (&result[-v7] > &result[a2 - v7])
    goto LABEL_9;
  v13 = result;
  v15 = 0;
  result = __gen2_der_put_length(result, a2, a3, (uint64_t *)&v15);
  if ((_DWORD)result)
    return result;
  v14 = v15;
  if (a2 < v15)
  {
LABEL_9:
    __break(0x5519u);
    return result;
  }
  result = (_BYTE *)__gen2_der_put_tag((unint64_t)&v13[-v15], a2 - v15, a4, a5, a6, (uint64_t *)&v15);
  if (!(_DWORD)result)
    *a7 = v15 + v14;
  return result;
}

unint64_t __gen2_der_put_bit_string(unint64_t result, unint64_t a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v8;
  BOOL v9;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v16;

  v4 = a2 - 1;
  if (!a2)
    v4 = 0;
  v5 = result - v4;
  v6 = result - v4 + a2;
  if (result - v4 > v6)
    goto LABEL_28;
  v8 = (unint64_t)(*(_QWORD *)a3 + 7) >> 3;
  if (v8 >= a2)
    return 1859794436;
  result = a2 + v5 - v8;
  v9 = v6 >= result && result >= v5;
  if (!v9 || v8 > v6 - result)
    goto LABEL_28;
  v12 = a2 + v5 + ~v8 - 1;
  result = (unint64_t)memcpy((void *)result, *(const void **)(a3 + 8), (unint64_t)(*(_QWORD *)a3 + 7) >> 3);
  if (!*(_QWORD *)a3 || (v13 = *(_QWORD *)a3 & 7) == 0)
  {
    v16 = (_BYTE *)(v12 + 1);
    if (v12 + 1 >= v6 || (unint64_t)v16 < v5)
      goto LABEL_28;
    *v16 = 0;
LABEL_27:
    result = 0;
    *a4 = v8 + 1;
    return result;
  }
  v14 = (_BYTE *)(v12 + 1);
  if (v12 + 1 < v6 && (unint64_t)v14 >= v5)
  {
    *v14 = 8 - v13;
    goto LABEL_27;
  }
LABEL_28:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_heim_der_set_sort(size_t *a1, size_t *a2)
{
  const void *v2;
  size_t v3;
  const void *v4;
  size_t v5;
  size_t v6;
  uint64_t result;

  v3 = *a1;
  v2 = (const void *)a1[1];
  v5 = *a2;
  v4 = (const void *)a2[1];
  if (v3 >= v5)
    v6 = v5;
  else
    v6 = v3;
  LODWORD(result) = memcmp(v2, v4, v6);
  if ((_DWORD)result)
    return result;
  else
    return (v3 - v5);
}

char *__gen2_der_get_class_name(unsigned int a1)
{
  if (a1 <= 3)
    return class_names[a1];
  else
    return 0;
}

uint64_t __gen2_der_get_class_num(char *a1)
{
  uint64_t v2;
  const char *v3;

  v2 = 0;
  while (1)
  {
    v3 = class_names[v2];
    if (v3)
    {
      if (!strcasecmp(v3, a1))
        break;
    }
    if (++v2 == 4)
      return 0xFFFFFFFFLL;
  }
  return v2;
}

char *__gen2_der_get_type_name(unsigned int a1)
{
  if (a1 <= 1)
    return type_names[a1];
  else
    return 0;
}

uint64_t __gen2_der_get_type_num(char *a1)
{
  uint64_t v2;
  const char *v3;

  v2 = 0;
  while (1)
  {
    v3 = type_names[v2];
    if (v3)
    {
      if (!strcasecmp(v3, a1))
        break;
    }
    if (++v2 == 2)
      return 0xFFFFFFFFLL;
  }
  return v2;
}

char *__gen2_der_get_tag_name(unsigned int a1)
{
  if (a1 <= 0x1E)
    return tag_names[a1];
  else
    return 0;
}

uint64_t __gen2_der_get_tag_num(char *a1)
{
  uint64_t v2;
  const char *v3;

  v2 = 0;
  while (1)
  {
    v3 = tag_names[v2];
    if (v3)
    {
      if (!strcasecmp(v3, a1))
        break;
    }
    if (++v2 == 31)
      return 0xFFFFFFFFLL;
  }
  return v2;
}

uint64_t __gen2_der_timegm(uint64_t result)
{
  int v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  int v5;
  _BOOL4 v6;
  unint64_t v7;
  unint64_t v8;
  char *v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  unsigned int v18;
  BOOL v19;
  uint64_t v20;
  unint64_t v21;
  BOOL v22;
  unsigned int v23;
  unsigned int v26;
  char *v27;
  char *i;
  unsigned int v29;

  v1 = *(_DWORD *)(result + 20);
  if (v1 > 2000)
    return 0;
  if (v1 < 0)
    return -1;
  v2 = *(unsigned int *)(result + 16);
  if (v2 > 0xB)
    return -1;
  v3 = *(int *)(result + 12);
  if ((int)v3 < 1)
    return -1;
  v4 = v1 + 1900;
  v5 = *(_DWORD *)(result + 20) & 3;
  if ((v1 & 3) != 0)
  {
    v6 = 0;
  }
  else
  {
    HIDWORD(v7) = -1030792151 * (unsigned __int16)(v1 + 1900);
    LODWORD(v7) = HIDWORD(v7);
    if ((v7 >> 2) <= 0x28F5C28)
    {
      HIDWORD(v8) = -1030792151 * (unsigned __int16)(v1 + 1900);
      LODWORD(v8) = HIDWORD(v8);
      v6 = (v8 >> 4) < 0xA3D70B;
    }
    else
    {
      v6 = 1;
    }
  }
  v9 = (char *)&ndays + 48 * v6;
  v10 = &v9[4 * v2];
  if (v10 >= v9 + 48 || v10 < v9)
    goto LABEL_49;
  if ((int)v3 > *(_DWORD *)v10)
    return -1;
  v12 = *(int *)(result + 8);
  if (v12 > 0x17)
    return -1;
  v13 = *(int *)(result + 4);
  if (v13 > 0x3B)
    return -1;
  v14 = *(int *)result;
  if (v14 > 0x3C)
    return -1;
  if (v1 < 0x47)
  {
    v15 = 0;
  }
  else
  {
    v15 = 0;
    v16 = 70;
    v17 = -1970;
    v18 = 1970;
    do
    {
      if ((v16 & 3) == 0 && (!(v17 + 100 * (v18 / 0x64)) ? (v19 = v17 + 400 * (v18 / 0x190) == 0) : (v19 = 1), v19))
        v20 = 366;
      else
        v20 = 365;
      v15 += v20;
      ++v16;
      --v17;
      ++v18;
    }
    while (v1 != v16);
  }
  if ((int)v2 < 1)
    return v14 + 60 * (v13 + 60 * (v12 + 24 * (v3 + v15)) - 1440);
  HIDWORD(v21) = -1030792151 * v4;
  LODWORD(v21) = -1030792151 * v4;
  result = 42949672;
  v22 = (v21 >> 2) > 0x28F5C28;
  HIDWORD(v21) = -1030792151 * v4;
  LODWORD(v21) = -1030792151 * v4;
  v23 = v21 >> 4;
  v26 = (v22 || v23 < 0xA3D70B) && v5 == 0;
  v27 = (char *)&ndays + 48 * v26;
  for (i = v27; i < v27 + 48 && i >= v27; i += 4)
  {
    v29 = *(_DWORD *)i;
    v15 += v29;
    if (!--v2)
      return v14 + 60 * (v13 + 60 * (v12 + 24 * (v3 + v15)) - 1440);
  }
LABEL_49:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_gmtime(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  unsigned int v8;
  int v9;
  int v10;
  unsigned int i;
  BOOL v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  unsigned int v16;
  unsigned int v19;
  char *v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;

  result = 0;
  v4 = a1 / 86400;
  v5 = a1 % 86400;
  v6 = v5 % 60;
  v7 = v5 / 3600;
  v8 = v5 % 3600 + ((-30583 * (v5 % 3600)) >> 16);
  *(_QWORD *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  *(_DWORD *)a2 = v6;
  *(_DWORD *)(a2 + 4) = ((__int16)v8 >> 5) + ((unsigned __int16)(v8 & 0x8000) >> 15);
  *(_DWORD *)(a2 + 8) = v7;
  if (a1 <= 0xEAF63A97FLL)
  {
    v9 = 0;
    *(_DWORD *)(a2 + 20) = 70;
    v10 = -1970;
    for (i = 1970; ; ++i)
    {
      if ((((_BYTE)v9 + 70) & 3) == 0
        && (!(v10 + 100 * (i / 0x64)) ? (v12 = v10 + 400 * (i / 0x190) == 0) : (v12 = 1), v12))
      {
        v13 = 366;
      }
      else
      {
        v13 = 365;
      }
      v14 = __OFSUB__(v4, v13);
      v15 = v4 - v13;
      if (v15 < 0 != v14)
        break;
      *(_DWORD *)(a2 + 20) = v9 + 71;
      --v10;
      ++v9;
      v4 = v15;
    }
    v12 = v10 + 100 * (i / 0x64) == 0;
    v16 = v10 + 400 * (i / 0x190);
    v19 = (!v12 || v16 == 0) && (((_BYTE)v9 + 70) & 3) == 0;
    v20 = (char *)&ndays + 48 * v19;
    *(_DWORD *)(a2 + 16) = 0;
    v21 = (unint64_t)(v20 + 4);
    v22 = 1;
    while (1)
    {
      v23 = *(unsigned int *)(v21 - 4);
      v14 = __OFSUB__(v4, v23);
      v24 = v4 - v23;
      if (v24 < 0 != v14)
        break;
      *(_DWORD *)(a2 + 16) = v22;
      if (v21 < (unint64_t)(v20 + 48))
      {
        ++v22;
        v4 = v24;
        v25 = v21 >= (unint64_t)v20;
        v21 += 4;
        if (v25)
          continue;
      }
      __break(0x5519u);
      break;
    }
    *(_DWORD *)(a2 + 12) = v4 + 1;
    return a2;
  }
  return result;
}

uint64_t __gen2_der_get_unsigned(_BYTE *a1, unint64_t a2, int *a3, unint64_t *a4)
{
  uint64_t v4;
  int v5;
  unint64_t v6;
  int v7;

  v4 = 1859794437;
  if (a2 == 5)
  {
    if (*a1)
      return v4;
  }
  else
  {
    if (a2 > 4)
      return v4;
    if (!a2)
    {
      v5 = 0;
      goto LABEL_10;
    }
  }
  v5 = 0;
  v6 = a2;
  do
  {
    v7 = *a1++;
    v5 = v7 | (v5 << 8);
    --v6;
  }
  while (v6);
LABEL_10:
  *a3 = v5;
  v4 = 0;
  if (a4)
    *a4 = a2;
  return v4;
}

uint64_t __gen2_der_get_unsigned64(_BYTE *a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;

  v4 = 1859794437;
  if (a2 == 9)
  {
    if (*a1)
      return v4;
  }
  else
  {
    if (a2 > 8)
      return v4;
    if (!a2)
    {
      v5 = 0;
      goto LABEL_10;
    }
  }
  v5 = 0;
  v6 = a2;
  do
  {
    v7 = *a1++;
    v5 = v7 | (v5 << 8);
    --v6;
  }
  while (v6);
LABEL_10:
  *a3 = v5;
  v4 = 0;
  if (a4)
    *a4 = a2;
  return v4;
}

uint64_t __gen2_der_get_integer(_BYTE *a1, unint64_t a2, int *a3, unint64_t *a4)
{
  int v4;
  uint64_t result;
  unsigned __int8 *v6;
  unint64_t v7;
  BOOL v8;

  if (a2 == 5)
  {
    v4 = *a1;
    if (*a1 && v4 != 255)
      return 1859794437;
  }
  else
  {
    if (a2 > 4)
      return 1859794437;
    if (!a2)
      goto LABEL_17;
    LOBYTE(v4) = *a1;
  }
  v6 = a1 + 1;
  if (a1 + 1 >= a1 && v6 <= &a1[a2])
  {
    v4 = (char)v4;
    v7 = a2 - 1;
    while (v7)
    {
      if (v6 + 1 <= &a1[a2])
      {
        v4 = *v6 | (v4 << 8);
        --v7;
        v8 = v6 >= v6 + 1;
        ++v6;
        if (!v8)
          continue;
      }
      goto LABEL_16;
    }
    goto LABEL_18;
  }
LABEL_16:
  __break(0x5519u);
LABEL_17:
  v4 = 0;
LABEL_18:
  *a3 = v4;
  result = 0;
  if (a4)
    *a4 = a2;
  return result;
}

uint64_t __gen2_der_get_integer64(char *a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t result;
  unsigned __int8 *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  if (a2 > 8)
    return 1859794437;
  if (a2)
  {
    v5 = (unsigned __int8 *)(a1 + 1);
    if (a1 + 1 >= a1 && v5 <= (unsigned __int8 *)&a1[a2])
    {
      v6 = *a1;
      v7 = a2 - 1;
      while (v7)
      {
        if (v5 + 1 <= (unsigned __int8 *)&a1[a2])
        {
          v6 = *v5 | (v6 << 8);
          --v7;
          v8 = v5 >= v5 + 1;
          ++v5;
          if (!v8)
            continue;
        }
        goto LABEL_11;
      }
      goto LABEL_13;
    }
LABEL_11:
    __break(0x5519u);
  }
  v6 = 0;
LABEL_13:
  *a3 = v6;
  result = 0;
  if (a4)
    *a4 = a2;
  return result;
}

uint64_t __gen2_der_get_length(char *a1, uint64_t a2, _QWORD *a3, uint64_t *a4)
{
  uint64_t v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unsigned int v12;

  v4 = 1859794437;
  if (a2)
  {
    v6 = *a1;
    v5 = a1 + 1;
    v7 = v6;
    if ((v6 & 0x80000000) == 0)
    {
      *a3 = v7;
      if (!a4)
        return 0;
      goto LABEL_7;
    }
    if ((_DWORD)v7 == 128)
    {
      *a3 = 3705724653;
      if (a4)
      {
LABEL_7:
        v8 = 1;
LABEL_8:
        v4 = 0;
        *a4 = v8;
        return v4;
      }
      return 0;
    }
    v9 = v7 & 0x7F;
    if (a2 - 1 < v9)
      return v4;
    if (v9 == 5)
    {
      if (*v5)
        return v4;
    }
    else
    {
      if (v9 > 4)
        return v4;
      if (!v9)
      {
        v10 = 0;
        goto LABEL_19;
      }
    }
    LODWORD(v10) = 0;
    v11 = v9;
    do
    {
      v12 = *v5++;
      v10 = v12 | ((_DWORD)v10 << 8);
      --v11;
    }
    while (v11);
LABEL_19:
    *a3 = v10;
    if (a4)
    {
      v8 = v9 + 1;
      goto LABEL_8;
    }
    return 0;
  }
  return v4;
}

uint64_t __gen2_der_get_BOOLean(unsigned __int8 *a1, uint64_t a2, _DWORD *a3, _QWORD *a4)
{
  uint64_t result;

  if (!a2)
    return 1859794437;
  result = 0;
  *a3 = *a1 != 0;
  *a4 = 1;
  return result;
}

unint64_t __gen2_der_get_general_string(char *a1, size_t __n, unint64_t *a3, _QWORD *a4)
{
  unint64_t result;
  unint64_t v9;
  char *v10;
  size_t v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;

  result = (unint64_t)memchr(a1, 0, __n);
  if (!result)
    goto LABEL_12;
  v9 = result - (_QWORD)a1;
  if (result - (unint64_t)a1 < __n)
  {
    while (1)
    {
      v10 = &a1[v9];
      if (&a1[__n] <= &a1[v9] || v10 < a1)
        break;
      if (*v10)
        goto LABEL_11;
      if (++v9 >= __n)
        goto LABEL_12;
    }
LABEL_23:
    __break(0x5519u);
    return result;
  }
LABEL_11:
  if (v9 != __n)
  {
    *a3 = 0;
    return 1859794443;
  }
  else
  {
LABEL_12:
    v12 = __n + 1;
    result = (unint64_t)malloc_type_malloc(__n + 1, 0x8F5DE157uLL);
    if (!result)
    {
      *a3 = 0;
      return 12;
    }
    if ((v12 & 0x8000000000000000) != 0)
      goto LABEL_23;
    v13 = result;
    v14 = result + v12;
    result = (unint64_t)memcpy((void *)result, a1, __n);
    v15 = (_BYTE *)(v13 + __n);
    if (v13 + __n >= v14)
      goto LABEL_23;
    if ((unint64_t)v15 < v13)
      goto LABEL_23;
    *v15 = 0;
    if (v15 + 1 < v15 || (unint64_t)(v15 + 1) > v14)
      goto LABEL_23;
    *a3 = v13;
    result = 0;
    if (a4)
      *a4 = __n;
  }
  return result;
}

uint64_t __gen2_der_get_printable_string(const void *a1, size_t a2, size_t *a3, size_t *a4)
{
  size_t v8;
  uint64_t result;
  unint64_t v10;
  _BYTE *v11;
  BOOL v12;

  if (a2 == -1)
  {
    *a3 = 0;
    a3[1] = 0;
    return 1859794439;
  }
  else
  {
    v8 = a2 + 1;
    result = (uint64_t)malloc_type_malloc(a2 + 1, 0xD3AB9DE5uLL);
    if (result)
    {
      if ((v8 & 0x8000000000000000) == 0
        && ((*a3 = v8,
             a3[1] = result,
             result = (uint64_t)memcpy((void *)result, a1, a2),
             v10 = a3[1],
             v11 = (_BYTE *)(v10 + a2),
             v10 + a2 < v10 + *a3)
          ? (v12 = (unint64_t)v11 >= v10)
          : (v12 = 0),
            v12))
      {
        *v11 = 0;
        result = 0;
        if (a4)
          *a4 = a2;
      }
      else
      {
        __break(0x5519u);
      }
    }
    else
    {
      *a3 = 0;
      a3[1] = 0;
      return 12;
    }
  }
  return result;
}

unint64_t __gen2_der_get_bmp_string(unint64_t a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  unint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  BOOL v16;
  unsigned int v18;
  BOOL v19;

  if (!a2)
  {
    result = 0;
LABEL_7:
    *a3 = 0;
    a3[1] = 0;
    return result;
  }
  if ((a2 & 1) != 0)
  {
    result = 1859794440;
    goto LABEL_7;
  }
  if (HIDWORD(a2))
  {
    *a3 = 0;
    a3[1] = 0;
    return 34;
  }
  result = (unint64_t)malloc_type_malloc(a2 & 0xFFFFFFFFFFFFFFFELL, 0x1000040BDFB0063uLL);
  v9 = result + (a2 & 0xFFFFFFFFFFFFFFFELL);
  if (!result)
    v9 = 0;
  if (a2 >= 2 && !result)
  {
    *a3 = 0;
    a3[1] = 0;
    return 12;
  }
  if (result > v9)
    goto LABEL_39;
  v10 = a2 >> 1;
  if (a2 >> 1 > (uint64_t)(v9 - result) >> 1)
    goto LABEL_39;
  *a3 = v10;
  a3[1] = result;
  if (a2 >= 2)
  {
    v11 = 0;
    v12 = a1 + a2;
    v13 = v10 - 1;
    if (v10 <= 1)
      v10 = 1;
    v14 = a1 + 1;
    while (1)
    {
      v15 = v14 - 1 < v12 && v14 - 1 >= a1;
      v16 = !v15 || v14 >= v12;
      if (v16 || v14 < a1)
        break;
      v18 = __rev16(*(unsigned __int16 *)(v14 - 1));
      *(_WORD *)(result + 2 * v11) = v18;
      if (v18)
        v19 = 1;
      else
        v19 = v13 == v11;
      if (!v19)
      {
        free((void *)result);
        *a3 = 0;
        a3[1] = 0;
        return 1859794443;
      }
      ++v11;
      v14 += 2;
      if (v10 == v11)
        goto LABEL_37;
    }
LABEL_39:
    __break(0x5519u);
    return result;
  }
LABEL_37:
  result = 0;
  if (a4)
    *a4 = a2;
  return result;
}

unint64_t __gen2_der_get_universal_string(unint64_t a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  unint64_t result;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unsigned __int8 *v14;
  BOOL v15;
  unsigned __int8 *v16;
  BOOL v17;
  BOOL v18;
  unsigned __int8 *v19;
  BOOL v20;
  BOOL v21;
  unsigned __int8 *v22;
  BOOL v23;
  int v25;
  BOOL v26;

  if (!a2)
  {
    result = 0;
    goto LABEL_5;
  }
  if ((a2 & 3) != 0)
  {
    result = 1859794440;
LABEL_5:
    *a3 = 0;
    a3[1] = 0;
    return result;
  }
  if (HIDWORD(a2))
  {
    *a3 = 0;
    a3[1] = 0;
    return 34;
  }
  result = (unint64_t)malloc_type_malloc(a2 & 0xFFFFFFFFFFFFFFFCLL, 0x100004052888210uLL);
  v9 = result + (a2 & 0xFFFFFFFFFFFFFFFCLL);
  if (!result)
    v9 = 0;
  if (a2 >= 4 && !result)
  {
    *a3 = 0;
    a3[1] = 0;
    return 12;
  }
  if (result > v9 || (v10 = a2 >> 2, a2 >> 2 > (uint64_t)(v9 - result) >> 2))
  {
LABEL_50:
    __break(0x5519u);
    return result;
  }
  *a3 = v10;
  a3[1] = result;
  if (a2 >= 4)
  {
    v11 = 0;
    v12 = a1 + a2;
    v13 = v10 - 1;
    if (v10 <= 1)
      v10 = 1;
    do
    {
      v14 = (unsigned __int8 *)(a1 + v11);
      v15 = a1 + v11 < v12 && (unint64_t)v14 >= a1;
      v16 = v14 + 1;
      v17 = !v15 || (unint64_t)v16 >= v12;
      v18 = !v17 && (unint64_t)v16 >= a1;
      v19 = v14 + 2;
      v20 = !v18 || (unint64_t)v19 >= v12;
      v21 = !v20 && (unint64_t)v19 >= a1;
      v22 = v14 + 3;
      v23 = !v21 || (unint64_t)v22 >= v12;
      if (v23 || (unint64_t)v22 < a1)
        goto LABEL_50;
      v25 = *v22 | (*v19 << 8) | (*v16 << 16) | (*v14 << 24);
      *(_DWORD *)(result + v11) = v25;
      if (v25)
        v26 = 1;
      else
        v26 = v13 == 0;
      if (!v26)
      {
        free((void *)result);
        *a3 = 0;
        a3[1] = 0;
        return 1859794443;
      }
      v11 += 4;
      --v13;
    }
    while (--v10);
  }
  result = 0;
  if (a4)
    *a4 = a2;
  return result;
}

uint64_t __gen2_der_get_octet_string(const void *a1, size_t size, _QWORD *a3, _QWORD *a4)
{
  uint64_t result;

  if (size)
  {
    result = (uint64_t)malloc_type_malloc(size, 0x1E3DEEAEuLL);
    if (!result)
      return 12;
    if ((size & 0x8000000000000000) != 0)
    {
      __break(0x5519u);
      return result;
    }
    *a3 = size;
    a3[1] = result;
    memcpy((void *)result, a1, size);
  }
  else
  {
    *a3 = 0;
    a3[1] = 0;
  }
  result = 0;
  if (a4)
    *a4 = size;
  return result;
}

uint64_t __gen2_der_get_octet_string_ber(_BYTE *a1, unint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  unint64_t v8;
  char *tag;
  int v10;
  unint64_t v11;
  _BYTE *v12;
  unint64_t v13;
  unint64_t v14;
  size_t v15;
  unint64_t v16;
  size_t v17;
  char *v18;
  char *v19;
  char *v20;
  BOOL v21;
  size_t v22;
  size_t v23;
  unint64_t v24;
  int v27;
  size_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;

  v27 = 0;
  v31 = 0;
  v30 = 0;
  v7 = 1859794438;
  v28 = 0;
  v29 = 0;
  v8 = a2;
  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  while (1)
  {
    if (!v8)
    {
      if (v27)
        return 1859794447;
      goto LABEL_39;
    }
    tag = (char *)__gen2_der_get_tag(a1, v8, (int *)&v31, (int *)&v31 + 1, &v30, &v29);
    if ((_DWORD)tag)
      goto LABEL_31;
    if ((_DWORD)v31)
      goto LABEL_35;
    v10 = HIDWORD(v31);
    if (!(HIDWORD(v31) | v30))
      break;
    if (v30 != 4)
      goto LABEL_35;
    v11 = (unint64_t)&a1[v8];
    v12 = &a1[v29];
    v13 = v8 - v29;
    if (&a1[v8] < &a1[v29])
      goto LABEL_30;
    if (a1 > v12)
      goto LABEL_30;
    v14 = v8 - v29;
    if (v14 > v13)
      goto LABEL_30;
    tag = (char *)__gen2_der_get_length(&a1[v29], v14, &v28, &v29);
    if ((_DWORD)tag)
      goto LABEL_31;
    a1 = &v12[v29];
    if (v11 < (unint64_t)&v12[v29] || v12 > a1 || (v8 = v14 - v29, v8 > v11 - (unint64_t)&v12[v29]))
    {
LABEL_30:
      __break(0x5519u);
LABEL_31:
      v7 = (uint64_t)tag;
LABEL_35:
      free(*(void **)(a3 + 8));
      *(_QWORD *)a3 = 0;
      *(_QWORD *)(a3 + 8) = 0;
      return v7;
    }
    v15 = v28;
    if (v28 == 3705724653)
      return 1859794452;
    v16 = v8 - v28;
    if (v8 < v28)
      return 1859794437;
    if (v10)
    {
      ++v27;
      goto LABEL_27;
    }
    v17 = *(_QWORD *)a3 + v28;
    if (v17)
    {
      v18 = (char *)malloc_type_realloc(*(void **)(a3 + 8), *(_QWORD *)a3 + v28, 0x52F787E0uLL);
      if (!v18)
      {
        v7 = 12;
        goto LABEL_35;
      }
      v19 = v18;
      v20 = &v18[v17];
      tag = &v18[*(_QWORD *)a3];
      v21 = v20 >= tag;
      v22 = v20 - tag;
      if (!v21)
        goto LABEL_30;
      if (v19 > tag)
        goto LABEL_30;
      if (v15 > v22)
        goto LABEL_30;
      tag = (char *)memcpy(tag, a1, v15);
      if ((v17 & 0x8000000000000000) != 0)
        goto LABEL_30;
      v23 = *(_QWORD *)a3 + v15;
      if (v23 > v17)
        goto LABEL_30;
      *(_QWORD *)a3 = v23;
      *(_QWORD *)(a3 + 8) = v19;
LABEL_27:
      v24 = v11 - (_QWORD)&a1[v15];
      if (v11 < (unint64_t)&a1[v15])
        goto LABEL_30;
      if (a1 > &a1[v15])
        goto LABEL_30;
      v8 = v16;
      a1 += v15;
      if (v16 > v24)
        goto LABEL_30;
    }
  }
  if (v27)
    goto LABEL_35;
LABEL_39:
  v7 = 0;
  if (a4)
    *a4 = a2 - v8;
  return v7;
}

uint64_t __gen2_der_get_tag(_BYTE *a1, uint64_t a2, int *a3, int *a4, _DWORD *a5, uint64_t *a6)
{
  uint64_t result;
  int v8;
  unsigned int v9;
  uint64_t v10;
  char v11;
  unsigned int v12;
  unint64_t v13;

  result = 1859794437;
  if (a2)
  {
    *a3 = *a1 >> 6;
    *a4 = (*a1 >> 5) & 1;
    v8 = *a1 & 0x1F;
    *a5 = v8;
    if (v8 == 31)
    {
      v9 = 0;
      *a5 = 0;
      v10 = 1;
      while (a2 != v10)
      {
        v11 = a1[v10];
        v12 = v11 & 0x7F | (v9 << 7);
        if (v12 < v9)
          return 1859794436;
        *a5 = v12;
        v13 = (unint64_t)&a1[v10 + 1];
        if (v13 > (unint64_t)&a1[a2] || (unint64_t)&a1[v10] > v13)
        {
          __break(0x5519u);
          return result;
        }
        ++v10;
        v9 = v12;
        if ((v11 & 0x80000000) == 0)
          goto LABEL_11;
      }
    }
    else
    {
      v10 = 1;
LABEL_11:
      result = 0;
      if (a6)
        *a6 = v10;
    }
  }
  return result;
}

unint64_t __gen2_der_get_heim_integer(unsigned __int8 *a1, size_t size, uint64_t a3, size_t *a4)
{
  size_t v6;
  int v8;
  _BOOL8 v10;
  size_t v11;
  void *v12;
  unint64_t result;
  size_t v14;
  char *v15;
  _BYTE *v16;
  _BYTE *v17;
  unsigned __int8 *v18;
  _BYTE *v19;
  _BOOL4 v20;
  int v21;

  *(_QWORD *)a3 = 0;
  *(_QWORD *)(a3 + 8) = 0;
  *(_DWORD *)(a3 + 16) = 0;
  if (!size)
  {
    result = 0;
    if (!a4)
      return result;
    v6 = 0;
    goto LABEL_35;
  }
  v6 = size;
  v8 = (char)*a1;
  if ((v8 & 0x80000000) == 0)
  {
    v10 = size > 1 && v8 == 0;
    v11 = size - v10;
    v12 = malloc_type_malloc(size - v10, 0xBAF1374EuLL);
    if (v12)
    {
      *(_QWORD *)a3 = v11;
      *(_QWORD *)(a3 + 8) = v12;
      memcpy(v12, &a1[v10], v6 - v10);
      goto LABEL_11;
    }
    goto LABEL_34;
  }
  *(_DWORD *)(a3 + 16) = 1;
  v14 = size;
  v15 = (char *)a1;
  if (*a1 != 255)
  {
LABEL_21:
    result = (unint64_t)malloc_type_malloc(v14, 0xE077C3E0uLL);
    if (result)
    {
      *(_QWORD *)a3 = v14;
      *(_QWORD *)(a3 + 8) = result;
      v18 = (unsigned __int8 *)&v15[v14 - 1];
      if (v18 < (unsigned __int8 *)&v15[v14] && v15 <= (char *)v18)
      {
        v19 = (_BYTE *)(result + v14 - 1);
        if ((unint64_t)v19 < result)
        {
LABEL_11:
          result = 0;
          if (!a4)
            return result;
          goto LABEL_35;
        }
        v20 = 1;
        while (v18 < &a1[v6] && v18 >= a1 && (unint64_t)v19 < result + v14 && (unint64_t)v19 >= result)
        {
          v21 = *v18;
          *v19 = ~(_BYTE)v21;
          if (v20)
          {
            *v19 = -(char)v21;
            v20 = v21 == 0;
          }
          --v18;
          if ((unint64_t)--v19 < *(_QWORD *)(a3 + 8))
            goto LABEL_11;
        }
      }
      __break(0x5519u);
      return result;
    }
LABEL_34:
    v6 = 0;
    *(_QWORD *)a3 = 0;
    *(_QWORD *)(a3 + 8) = 0;
    result = 12;
    if (!a4)
      return result;
    goto LABEL_35;
  }
  v14 = size - 1;
  if (size != 1)
  {
    v15 = (char *)(a1 + 1);
    goto LABEL_21;
  }
  v16 = malloc_type_malloc(1uLL, 0xE541E682uLL);
  if (!v16)
    return 12;
  v17 = v16;
  result = 0;
  *v17 = 1;
  *(_QWORD *)a3 = 1;
  *(_QWORD *)(a3 + 8) = v17;
  if (a4)
LABEL_35:
    *a4 = v6;
  return result;
}

uint64_t __gen2_der_get_time(const void *a1, size_t a2, uint64_t *a3, size_t *a4)
{
  uint64_t v4;
  size_t v9;
  uint64_t result;
  char *v11;
  unint64_t v12;
  char *v13;
  int v14;
  uint64_t *v15;
  uint64_t *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v4 = 1859794432;
  if (!a2)
    return 1859794439;
  v9 = a2 + 1;
  result = (uint64_t)malloc_type_malloc(a2 + 1, 0x934C4CDDuLL);
  if (!result)
    return 12;
  v16 = a3;
  if (((v9 | a2) & 0x8000000000000000) == 0)
  {
    v11 = (char *)result;
    v12 = result + v9;
    result = (uint64_t)memcpy((void *)result, a1, a2);
    v13 = &v11[a2];
    if ((unint64_t)&v11[a2] < v12 && v13 >= v11)
    {
      *v13 = 0;
      if (v13 + 1 >= v13 && (unint64_t)(v13 + 1) <= v12)
      {
        v20 = 0;
        v18 = 0u;
        v19 = 0u;
        v17 = 0u;
        if (sscanf(v11, "%04d%02d%02d%02d%02d%02dZ", (char *)&v18 + 4, &v18, (unint64_t)&v17 | 0xC, (char *)&v17 + 8, (char *)&v17 + 4, &v17) == 6)
        {
          v14 = DWORD1(v18);
          v15 = v16;
        }
        else
        {
          if (sscanf(v11, "%02d%02d%02d%02d%02d%02dZ", (char *)&v18 + 4, &v18, (unint64_t)&v17 | 0xC, (char *)&v17 + 8, (char *)&v17 + 4, &v17) != 6)goto LABEL_17;
          v15 = v16;
          if (SDWORD1(v18) > 49)
            v14 = DWORD1(v18) + 1900;
          else
            v14 = DWORD1(v18) + 2000;
        }
        LODWORD(v18) = v18 - 1;
        DWORD1(v18) = v14 - 1900;
        v4 = 0;
        *v15 = __gen2_der_timegm((uint64_t)&v17);
LABEL_17:
        free(v11);
        if (a4)
          *a4 = a2;
        return v4;
      }
    }
  }
  __break(0x5519u);
  return result;
}

unint64_t __gen2_der_get_oid(_BYTE *a1, unint64_t a2, unint64_t *a3, unint64_t *a4)
{
  uint64_t v4;
  unint64_t v9;
  unint64_t result;
  unsigned int *v11;
  unint64_t v12;
  _BYTE *v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  _BYTE *v21;
  unsigned int v23;
  int v24;
  unsigned int *v25;

  v4 = 1859794437;
  if (!a2)
    return v4;
  if (a2 == -1)
    return 1859794439;
  if (a2 > 0x3FFFFFFE)
    return 34;
  v9 = a2 + 1;
  result = (unint64_t)malloc_type_malloc(4 * (a2 + 1), 0x100004052888210uLL);
  if (!result)
    return 12;
  *a3 = v9;
  a3[1] = result;
  *(_DWORD *)result = *a1 / 0x28u;
  v11 = (unsigned int *)(result + 4);
  v12 = result + 4 * v9;
  if (result + 4 < v12 && (unint64_t)v11 >= result)
  {
    v14 = a1 + 1;
    *v11 = *a1 % 0x28u;
    if (a1 + 1 >= a1 && v14 <= &a1[a2])
    {
      v15 = 2;
      v16 = a2 - 1;
      if (a2 != 1)
      {
        while (2)
        {
          v17 = 0;
          v18 = (unint64_t)&v14[v16];
          v19 = &v14[v16 - 1];
          v20 = v16 - 1;
          v21 = v14;
          while (1)
          {
            v14 = v21 + 1;
            if ((unint64_t)(v21 + 1) > v18 || v21 > v14)
              goto LABEL_37;
            v16 = v20;
            v23 = *v21 & 0x7F | (v17 << 7);
            if (v23 < v17)
              goto LABEL_35;
            if (!v20)
              break;
            v24 = (char)*v21;
            --v20;
            v17 = *v21++ & 0x7F | (v17 << 7);
            if ((v24 & 0x80000000) == 0)
            {
              v19 = v14 - 1;
              goto LABEL_25;
            }
          }
          v14 = (_BYTE *)v18;
LABEL_25:
          v25 = (unsigned int *)(result + 4 * v15);
          if ((unint64_t)v25 >= v12 || (unint64_t)v25 < result)
            goto LABEL_37;
          *v25 = v23;
          ++v15;
          if (v16)
            continue;
          break;
        }
        if (v15 >= 3)
        {
          if ((unint64_t)v19 >= v18)
            goto LABEL_37;
          if (*v19 < 0)
          {
LABEL_35:
            __gen2_der_free_oid((uint64_t)a3);
            return v4;
          }
        }
      }
      if (v15 <= v9)
      {
        *a3 = v15;
        v4 = 0;
        if (a4)
          *a4 = a2;
        return v4;
      }
    }
  }
LABEL_37:
  __break(0x5519u);
  return result;
}

uint64_t __gen2_der_match_tag(_BYTE *a1, uint64_t a2, int a3, int a4, unsigned int a5, _QWORD *a6)
{
  uint64_t result;
  unsigned int v8;
  int v9;

  v9 = 0;
  LODWORD(result) = __gen2_der_match_tag2(a1, a2, a3, &v9, a5, a6);
  if (v9 == a4)
    v8 = 0;
  else
    v8 = 1859794438;
  if ((_DWORD)result)
    return result;
  else
    return v8;
}

uint64_t __gen2_der_match_tag2(_BYTE *a1, uint64_t a2, int a3, int *a4, unsigned int a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  result = __gen2_der_get_tag(a1, a2, (int *)&v10 + 1, a4, &v10, &v11);
  if (!(_DWORD)result)
  {
    result = 1859794433;
    if (HIDWORD(v10) == a3)
    {
      if (v10 >= a5)
      {
        if (v10 <= a5)
        {
          result = 0;
          if (a6)
            *a6 = v11;
        }
      }
      else
      {
        return 1859794434;
      }
    }
    else
    {
      return 1859794438;
    }
  }
  return result;
}

char *__gen2_der_match_tag_and_length(char *a1, uint64_t a2, int a3, int *a4, unsigned int a5, _QWORD *a6, _QWORD *a7)
{
  char *result;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v16;
  BOOL v17;
  uint64_t v18;

  v18 = 0;
  result = (char *)__gen2_der_match_tag2(a1, a2, a3, a4, a5, &v18);
  if (!(_DWORD)result)
  {
    v12 = v18;
    result = &a1[v18];
    v13 = a2 - v18;
    v14 = a2 - v18;
    if (&a1[a2] >= &a1[v18] && result >= a1)
    {
      v16 = v13 >= v14;
      v17 = v13 == v14;
    }
    else
    {
      v16 = 1;
      v17 = 0;
    }
    if (!v17 && v16)
    {
      __break(0x5519u);
    }
    else
    {
      result = (char *)__gen2_der_get_length(result, v13, a6, &v18);
      if (!(_DWORD)result)
      {
        result = 0;
        if (a7)
          *a7 = v18 + v12;
      }
    }
  }
  return result;
}

uint64_t __gen2_heim_fix_dce(unint64_t a1, unint64_t *a2)
{
  uint64_t result;

  if (a1 == 3705724653)
    return 1;
  if (*a2 < a1)
    return 0xFFFFFFFFLL;
  result = 0;
  *a2 = a1;
  return result;
}

uint64_t __gen2_der_get_bit_string(unsigned __int8 *a1, unint64_t a2, _QWORD *a3, unint64_t *a4)
{
  uint64_t result;
  unint64_t v9;
  void *v10;
  uint64_t v11;

  result = 1859794437;
  if (a2)
  {
    if (a2 <= 0x2000000000000000)
    {
      result = 1859794440;
      if (*a1 <= 7u)
      {
        v9 = a2 - 1;
        if (a2 != 1 || !*a1)
        {
          if (a2 != 1)
          {
            v10 = malloc_type_malloc(a2 - 1, 0xFB2DB160uLL);
            if (!v10)
              return 12;
            *a3 = 8 * v9;
            a3[1] = v10;
            memcpy(v10, a1 + 1, a2 - 1);
            v11 = *a3 - *a1;
            if ((unint64_t)(v11 + 7) >> 3 <= (unint64_t)(*a3 + 7) >> 3)
              goto LABEL_11;
            __break(0x5519u);
          }
          v11 = 0;
          a3[1] = 0;
LABEL_11:
          *a3 = v11;
          result = 0;
          if (a4)
            *a4 = a2;
        }
      }
    }
  }
  return result;
}

void __gen2_der_free_general_string(void **a1)
{
  free(*a1);
  *a1 = 0;
}

_DWORD *__gen2_der_free_integer(_DWORD *result)
{
  *result = 0;
  return result;
}

_QWORD *__gen2_der_free_integer64(_QWORD *result)
{
  *result = 0;
  return result;
}

_DWORD *__gen2_der_free_unsigned(_DWORD *result)
{
  *result = 0;
  return result;
}

_QWORD *__gen2_der_free_unsigned64(_QWORD *result)
{
  *result = 0;
  return result;
}

_QWORD *__gen2_der_free_generalized_time(_QWORD *result)
{
  *result = 0;
  return result;
}

_QWORD *__gen2_der_free_utctime(_QWORD *result)
{
  *result = 0;
  return result;
}

void __gen2_der_free_utf8string(void **a1)
{
  free(*a1);
  *a1 = 0;
}

void __gen2_der_free_printable_string(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

void __gen2_der_free_octet_string(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

void __gen2_der_free_ia5_string(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

void __gen2_der_free_bmp_string(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

void __gen2_der_free_universal_string(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

void __gen2_der_free_visible_string(void **a1)
{
  free(*a1);
  *a1 = 0;
}

void __gen2_der_free_heim_integer(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

void __gen2_der_free_oid(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

void __gen2_der_free_bit_string(uint64_t a1)
{
  free(*(void **)(a1 + 8));
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

void asn1_abort(char *__format, ...)
{
  char *i;
  va_list va;

  va_start(va, __format);
  vsnprintf(crashreporter_info, 0x64uLL, __format, va);
  for (i = &crashreporter_info[1]; (unint64_t)i <= 0x2579BA07CLL; ++i)
  {
    if (!*(i - 1))
    {
      __crashreporter_info__ = (uint64_t)crashreporter_info;
      abort();
    }
  }
  __break(0x5519u);
}

uint64_t __gen2_asn1_sizeofType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 4);
}

uint64_t __gen2_asn1_bmember_isset_bit(_DWORD *a1, char a2)
{
  return (*a1 >> a2) & 1;
}

_BYTE *__gen2_asn1_bmember_put_bit(_BYTE *result, _DWORD *a2, char a3, uint64_t a4, _DWORD *a5)
{
  if (((*a2 >> a3) & 1) != 0)
  {
    *result |= 1 << (a3 & 7 ^ 7);
    if (!*a5)
      *a5 = 8 - (a3 & 7);
  }
  return result;
}

uint64_t __gen2_asn1_decode(unint64_t a1, unsigned int a2, unsigned __int8 *a3, size_t a4, char *a5, size_t *a6)
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _DWORD *v12;
  unsigned __int8 *v13;
  size_t v14;
  unsigned __int8 *v15;
  unsigned __int8 *v16;
  uint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  size_t v22;
  unint64_t v23;
  _BOOL4 v25;
  char *v26;
  char *v27;
  char *v28;
  char *v29;
  uint64_t result;
  unsigned __int8 *v33;
  size_t v34;
  unsigned int *v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  unint64_t v41;
  unsigned int *v42;
  char *v43;
  uint64_t v45;
  unsigned int *v47;
  char *v48;
  BOOL v49;
  unsigned int v50;
  uint64_t (*v51)();
  char *v52;
  unint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  size_t v57;
  uint64_t v58;
  BOOL v59;
  unint64_t v60;
  BOOL v61;
  unint64_t v62;
  BOOL v63;
  unsigned __int8 *v65;
  uint64_t v66;
  unsigned __int8 *v67;
  BOOL v69;
  char v70;
  char *v71;
  void **v72;
  void **v73;
  char *v74;
  void **v75;
  unsigned __int8 *v78;
  unsigned __int8 *v79;
  unsigned __int8 *v80;
  unint64_t v81;
  unint64_t v82;
  unsigned int v83;
  uint64_t v84;
  unint64_t v85;
  unint64_t v86;
  unint64_t v87;
  uint64_t v88;
  size_t v89;
  char *v90;
  uint64_t octet_string;
  unsigned __int8 *v92;
  size_t v93;
  char *v94;
  char *v95;
  size_t v96;
  int64_t v97;
  unint64_t v98;
  uint64_t v99;
  unsigned __int8 *v100;
  unint64_t v101;
  char *v102;
  unint64_t v103;
  size_t v104;
  size_t v105;
  void *v106;
  unsigned int *v107;
  char *v108;
  unsigned __int8 *v110;
  int v111;
  unint64_t v112;
  int v113;
  unsigned __int8 *__src;
  char *v116;
  unsigned int v118;
  unint64_t v119;
  unsigned int *v121;
  unint64_t v122;
  unint64_t v123;
  uint64_t v125;
  unint64_t v126;
  int v127;
  _QWORD v128[2];

  v6 = *(_QWORD *)(a1 + 8);
  v7 = a1 + 16 * (v6 + 1);
  v8 = *(unsigned int *)(a1 + 4);
  LODWORD(v9) = (_DWORD)a5 + v8;
  v10 = &a5[v8] >= a5 && v7 >= a1;
  v122 = v6 + 1;
  if (!v10 || v6 + 1 > (uint64_t)(16 * (v6 + 1)) >> 4)
    goto LABEL_242;
  v12 = (_DWORD *)a1;
  v9 = a1 + 16;
  v119 = a1 + 16 * (v6 + 1);
  if (a1 + 16 > v7)
    goto LABEL_242;
  if (v9 < a1)
    goto LABEL_242;
  v9 = 16 * v122 - 16;
  if (v6 > v9 >> 4)
    goto LABEL_242;
  v13 = a3;
  v14 = a4;
  v15 = &a3[a4];
  v113 = *(_DWORD *)a1;
  if ((*(_DWORD *)a1 & 1) == 0)
    v15 = 0;
  v112 = (unint64_t)v15;
  if ((*(_DWORD *)a1 & 1) != 0)
    v16 = a3;
  else
    v16 = 0;
  __src = v16;
  if (!v6)
  {
LABEL_209:
    if ((v113 & 2) != 0)
      v104 = 0;
    else
      v104 = v14;
    v105 = a4 - v104;
    if (a6)
      *a6 = v105;
    if (!__src)
      return 0;
    v106 = malloc_type_malloc(v105, 0xC350CA29uLL);
    if (!v106)
      return 12;
    if ((v105 & 0x8000000000000000) != 0)
      goto LABEL_242;
    LODWORD(v9) = (_DWORD)a5 + 16;
    if (a5 + 16 > &a5[v8])
      goto LABEL_242;
    *(_QWORD *)a5 = v105;
    *((_QWORD *)a5 + 1) = v106;
    LODWORD(v9) = v112;
    if (v112 < (unint64_t)__src)
      goto LABEL_242;
    if (v105 > v112 - (unint64_t)__src)
      goto LABEL_242;
    memcpy(v106, __src, v105);
    if (v105 > *(_QWORD *)a5)
      goto LABEL_242;
    result = 0;
    *(_QWORD *)a5 = v105;
    return result;
  }
  v116 = a5 + 16;
  v118 = a2 & 0xFFFFFFFA;
  v111 = a2 & 1;
LABEL_18:
  v123 = v6;
  LODWORD(v9) = v119;
  if ((unint64_t)(v12 + 8) > v119)
    goto LABEL_242;
  v121 = v12 + 4;
  LODWORD(v9) = v12[4];
  switch((v9 >> 28) ^ 8)
  {
    case 0u:
      v35 = (unsigned int *)*((_QWORD *)v12 + 3);
      v36 = *((_QWORD *)v35 + 1);
      LODWORD(v9) = (_DWORD)v35 + 16;
      v37 = (unint64_t)&v35[4 * v36 + 4];
      if ((unint64_t)(v35 + 4) > v37)
        goto LABEL_242;
      v9 = v35[1];
      v38 = &a5[v8];
      v39 = &a5[v9];
      v128[0] = 0;
      if (&a5[v9] >= &a5[v8] || v39 < a5)
        goto LABEL_242;
      *(_DWORD *)v39 = 1;
      v41 = 1;
      if ((unint64_t)(v36 - 1) > 0xFFFFFFFFFFFFFFFDLL)
        goto LABEL_170;
      while (2)
      {
        v42 = &v35[4 * v41];
        LODWORD(v9) = (_DWORD)a5;
        v43 = &a5[v42[1]];
        if (v43)
        {
          if (v43 >= v38 || v43 < a5)
            goto LABEL_242;
        }
        v45 = __gen2_asn1_decode(*((_QWORD *)v42 + 1), 0, v13);
        LODWORD(v9) = 35;
        if ((v45 - 1859794433) <= 5 && ((1 << (v45 - 1)) & 0x23) != 0)
        {
          if ((unint64_t)v42 < v37)
          {
            v47 = &v35[4 * v41];
            LODWORD(v9) = (_DWORD)a5;
            v48 = &a5[v47[1]];
            if (!v48 || (v48 < v38 ? (v49 = v48 >= a5) : (v49 = 0), v49))
            {
              __gen2_asn1_free_top(*((_QWORD *)v47 + 1), v48);
              v41 = (v41 + 1);
              v36 = *((_QWORD *)v35 + 1);
              if (v36 + 1 <= v41)
                goto LABEL_170;
              continue;
            }
          }
          goto LABEL_242;
        }
        break;
      }
      v88 = v45;
      if ((_DWORD)v45)
      {
        if ((unint64_t)v42 >= v37)
          goto LABEL_242;
        v107 = &v35[4 * v41];
        LODWORD(v9) = (_DWORD)a5;
        v108 = &a5[v107[1]];
        if (v108)
        {
          if (v108 >= v38 || v108 < a5)
            goto LABEL_242;
        }
        __gen2_asn1_free_top(*((_QWORD *)v107 + 1), v108);
      }
      else
      {
        *(_DWORD *)v39 = v41;
        v9 = (uint64_t)&v13[v128[0]];
        v89 = v14 - v128[0];
        if (&v13[v14] < &v13[v128[0]])
          goto LABEL_242;
        if ((unint64_t)v13 > v9)
          goto LABEL_242;
        v14 -= v128[0];
        if (v14 > v89)
          goto LABEL_242;
        v36 = *((_QWORD *)v35 + 1);
        v13 += v128[0];
LABEL_170:
        if (v36 + 1 > v41)
          goto LABEL_182;
        if (*v35)
        {
          *(_DWORD *)v39 = -1;
          LODWORD(v9) = (_DWORD)a5;
          v90 = &a5[*v35];
          if (v90 && (v90 >= v38 || v90 < a5))
            goto LABEL_242;
          octet_string = __gen2_der_get_octet_string(v13, v14, v90, v128);
          if (!(_DWORD)octet_string)
          {
LABEL_176:
            v78 = &v13[v14];
            v9 = v128[0];
LABEL_177:
            v92 = &v13[v9];
            v10 = v78 >= &v13[v9];
            v93 = v78 - &v13[v9];
            if (!v10)
              goto LABEL_242;
            goto LABEL_179;
          }
          return octet_string;
        }
        else
        {
          return 1859794438;
        }
      }
      return v88;
    case 9u:
    case 0xAu:
      v128[0] = 0;
      v17 = *((_QWORD *)v12 + 3);
      if (v9 >> 28 == 1)
        v18 = *(unsigned int *)(v17 + 4);
      else
        v18 = *(_QWORD *)(v17 + 40);
      v71 = a5;
      v72 = (void **)&a5[v8];
      v73 = (void **)&a5[v12[5]];
      v74 = &a5[v8];
      v75 = v73;
      if ((v9 & 0x1000000) == 0)
        goto LABEL_139;
      v71 = (char *)malloc_type_calloc(1uLL, v18, 0xC6278757uLL);
      if (!v71)
        return 12;
      if (v18 < 1 || v73 >= v72 || v73 < (void **)a5)
        goto LABEL_242;
      v74 = &v71[v18];
      *v73 = v71;
      LODWORD(v9) = *v121;
      v75 = (void **)v71;
LABEL_139:
      LODWORD(v9) = v9 >> 28;
      if ((_DWORD)v9 == 1)
      {
        if (v75 && (v75 >= (void **)v74 || v75 < (void **)v71))
          goto LABEL_242;
        result = __gen2_asn1_decode(*((_QWORD *)v12 + 3), a2, v13);
        if ((_DWORD)result)
        {
LABEL_144:
          if ((*((_BYTE *)v12 + 19) & 1) != 0)
          {
            if (v73 < v72 && v73 >= (void **)a5)
            {
              free(*v73);
              *v73 = 0;
              goto LABEL_182;
            }
            goto LABEL_242;
          }
          return result;
        }
      }
      else
      {
        if (v75 && (v75 >= (void **)v74 || v75 < (void **)v71))
          goto LABEL_242;
        result = (*(uint64_t (**)(unsigned __int8 *, size_t, void **, _QWORD *))(*((_QWORD *)v12 + 3) + 8))(v13, v14, v75, v128);
        if ((_DWORD)result)
          goto LABEL_144;
      }
      v9 = v128[0];
      v78 = &v13[v14];
      goto LABEL_177;
    case 0xBu:
      v127 = 0;
      v128[0] = 0;
      v125 = 0;
      v126 = 0;
      result = (uint64_t)__gen2_der_match_tag_and_length((char *)v13, v14, (v9 >> 22) & 3, &v127, v9 & 0x1FFFFF, &v126, &v125);
      if ((_DWORD)result)
      {
        if ((*v121 & 0x1000000) != 0)
          goto LABEL_182;
        return result;
      }
      v79 = &v13[v14];
      v80 = &v13[v125];
      if (&v13[v125] > &v13[v14])
        goto LABEL_242;
      if (v13 > v80)
        goto LABEL_242;
      v81 = v14 - v125;
      v82 = v79 - v80;
      if (v14 - v125 > v79 - v80)
        goto LABEL_242;
      v83 = *v121;
      v84 = a2;
      if ((a2 & 2) != 0)
      {
        v84 = a2;
        if (v127 != ((v83 >> 21) & 1))
        {
          v85 = *((_QWORD *)v12 + 3);
          v9 = v85 + 16;
          if (v85 >= v85 + 16 || v85 + 32 > v9 + 16 * *(_QWORD *)(v85 + 8))
            goto LABEL_242;
          v84 = ((*(_DWORD *)v9 & 0xF0000FFF) == 1073741831) | a2;
        }
      }
      v86 = v126;
      if (v126 != 3705724653)
      {
        v87 = v126;
        if (v126 <= v81)
          goto LABEL_186;
        return 1859794437;
      }
      if ((a2 & 2) == 0)
        return 1859794449;
      v87 = v81 - 2;
      if (v81 < 2)
        return 1859794437;
      v84 = v84 | 4;
      v126 = v81 - 2;
LABEL_186:
      v94 = &a5[v8];
      v9 = v12[5];
      v95 = &a5[v9];
      if (&a5[v8] < &a5[v9] || v95 < a5)
        goto LABEL_242;
      v96 = v8 - v9;
      if ((v83 & 0x1000000) != 0)
      {
        v110 = &v13[v125];
        v97 = v79 - v80;
        v98 = v81;
        v99 = v8;
        v100 = v79;
        v101 = v86;
        v96 = *(unsigned int *)(*((_QWORD *)v12 + 3) + 4);
        v102 = (char *)malloc_type_calloc(1uLL, v96, 0x74E89CD4uLL);
        if (!v102)
          return 12;
        v82 = v97;
        v80 = v110;
        if (!(_DWORD)v96 || v95 >= v94)
          goto LABEL_242;
        v86 = v101;
        v79 = v100;
        v8 = v99;
        v81 = v98;
        *(_QWORD *)v95 = v102;
        v87 = v126;
        v95 = v102;
      }
      if (v87 > v82 || !v96 && v95)
        goto LABEL_242;
      v103 = v86;
      result = __gen2_asn1_decode(*((_QWORD *)v12 + 3), v84, v80);
      if (!(_DWORD)result)
      {
        if (v103 == 3705724653)
        {
          v126 = v128[0];
        }
        else if (v128[0] != v126)
        {
          return 1859794442;
        }
        v13 = &v80[v128[0]];
        v9 = v79 - &v80[v128[0]];
        if (v79 < &v80[v128[0]])
          goto LABEL_242;
        if (v80 > v13)
          goto LABEL_242;
        v14 = v81 - v128[0];
        if (v81 - v128[0] > v9)
          goto LABEL_242;
        if (v103 != 3705724653)
          goto LABEL_182;
        result = (uint64_t)__gen2_der_match_tag_and_length((char *)&v80[v128[0]], v81 - v128[0], 0, &v127, 0, &v126, &v125);
        if (!(_DWORD)result)
        {
          if (v127)
          {
            return 1859794438;
          }
          else
          {
            if (!v126)
            {
              v9 = v125;
              v92 = &v13[v125];
              v93 = v79 - &v13[v125];
              if (v79 < &v13[v125])
                goto LABEL_242;
LABEL_179:
              if (v13 <= v92)
              {
                v14 -= v9;
                if (v14 <= v93)
                {
                  v13 = v92;
                  goto LABEL_182;
                }
              }
              goto LABEL_242;
            }
            return 1859794450;
          }
        }
      }
      return result;
    case 0xCu:
      v128[0] = 0;
      v50 = (v9 & 0xFFF) + v111;
      if (v50 >= 0x15)
        asn1_abort("type larger then asn1_template_prim: %d", v50);
      v9 = (uint64_t)&asn1_template_prim[6 * v50];
      if (v9 < (unint64_t)asn1_template_prim)
        goto LABEL_242;
      v51 = asn1_template_prim[6 * v50 + 1];
      v52 = &a5[v12[5]];
      if (v52)
      {
        LODWORD(v9) = (_DWORD)a5 + v8;
        if (v52 >= &a5[v8])
          goto LABEL_242;
        LODWORD(v9) = (_DWORD)a5;
        if (v52 < a5)
          goto LABEL_242;
      }
      result = ((uint64_t (*)(unsigned __int8 *, size_t))v51)(v13, v14);
      if ((_DWORD)result)
        return result;
      goto LABEL_176;
    case 0xDu:
    case 0xEu:
      LODWORD(v9) = (_DWORD)v116;
      if (v116 < a5)
        goto LABEL_242;
      v19 = v12[5];
      v128[0] = 0;
      if (!v14)
        goto LABEL_51;
      v20 = 0;
      v21 = &a5[v19];
      v22 = *(unsigned int *)(*((_QWORD *)v12 + 3) + 4);
      v23 = (unint64_t)&a5[v19 + 16];
      LODWORD(v9) = (_DWORD)v116;
      v25 = v21 >= a5 && v23 <= (unint64_t)v116;
      while (1)
      {
        if ((a2 & 4) != 0)
        {
          v127 = 0;
          v125 = 0;
          v126 = 0;
          if (!__gen2_der_match_tag_and_length((char *)v13, v14, 0, &v127, 0, &v126, &v125))
            goto LABEL_51;
        }
        if (__CFADD__(v22, v20))
          return 1859794436;
        if (!v25)
          goto LABEL_242;
        v26 = (char *)malloc_type_realloc(*((void **)v21 + 1), v22 + v20, 0x6465CBE9uLL);
        if (!v26)
          return 12;
        v27 = v26;
        v28 = &v26[v22 + v20];
        v29 = &v26[v20];
        if (&v26[v20] > v28 || v26 > v29)
          goto LABEL_242;
        bzero(&v26[v20], v22);
        if (v27 >= v28)
          goto LABEL_242;
        *((_QWORD *)v21 + 1) = v27;
        ++*(_DWORD *)v21;
        if (v29 >= v28)
          goto LABEL_242;
        result = __gen2_asn1_decode(*((_QWORD *)v12 + 3), v118, v13);
        if ((_DWORD)result)
          return result;
        LODWORD(v9) = v128[0];
        v33 = &v13[v128[0]];
        v34 = v14 - v128[0];
        if (&v13[v14] < &v13[v128[0]])
          goto LABEL_242;
        if (v13 > v33)
          goto LABEL_242;
        v14 -= v128[0];
        if (v14 > v34)
          goto LABEL_242;
        v20 += v22;
        v13 += v128[0];
        if (!v14)
        {
          v13 = v33;
LABEL_51:
          v8 = 16;
LABEL_182:
          v9 = 16 * v123 - 16;
          if (v122 - 2 <= v9 >> 4)
          {
            v12 = v121;
            v122 = v123;
            v6 = v123 - 1;
            if (v123 == 1)
              goto LABEL_209;
            goto LABEL_18;
          }
LABEL_242:
          __break(0x5519u);
LABEL_243:
          asn1_abort("unknown opcode: %d", v9 & 0xF0000000);
        }
      }
    case 0xFu:
      v53 = *((_QWORD *)v12 + 3);
      v54 = *(_QWORD *)(v53 + 8);
      v55 = v53 + 16;
      v56 = v53 + 16 + 16 * v54;
      if (v53 + 16 > v56)
        goto LABEL_242;
      v57 = *(unsigned int *)(v53 + 4);
      if (v8 < v57)
        goto LABEL_242;
      bzero(a5, v57);
      if (!v14)
        return 1859794437;
      ++v13;
      v58 = v14 - 1;
      if (v54)
        v59 = v14 == 1;
      else
        v59 = 1;
      if (v59)
        goto LABEL_126;
      v60 = 0;
      if (a5)
        v61 = v8 < 1;
      else
        v61 = 0;
      LODWORD(v9) = v61;
      do
      {
        if (v53 > v55 || v55 + 16 > v56)
          goto LABEL_242;
        v62 = *(unsigned int *)(v55 + 4);
        v63 = v58 == 0;
        if (v62 >> 3 > v60 >> 3 && v58 != 0)
        {
          v65 = &v13[v58];
          v66 = v58;
          while (1)
          {
            v67 = v13++;
            if (v13 > v65 || v67 > v13)
              goto LABEL_242;
            v58 = v66 - 1;
            v60 += 8;
            v63 = v66 == 1;
            if (v62 >> 3 > v60 >> 3)
            {
              if (--v66)
                continue;
            }
            break;
          }
        }
        if (v63)
          goto LABEL_126;
        if (v13)
          v69 = v58 < 1;
        else
          v69 = 0;
        if (v69)
          v70 = 1;
        else
          v70 = v9;
        if ((v70 & 1) != 0)
          goto LABEL_242;
        if (((*v13 >> (~(_BYTE)v62 & 7)) & 1) != 0)
          *(_DWORD *)a5 |= 1 << v62;
        v55 += 16;
        --v54;
      }
      while (v54);
      if ((v58 & 0x8000000000000000) == 0)
      {
LABEL_126:
        v14 = 0;
        goto LABEL_182;
      }
      goto LABEL_242;
    default:
      goto LABEL_243;
  }
}

uint64_t __gen2_asn1_encode(unint64_t a1, _BYTE *a2, size_t a3, char *a4, _QWORD *a5)
{
  uint64_t v5;
  unint64_t v6;
  size_t v7;
  uint64_t v8;
  BOOL v10;
  size_t v12;
  unint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int v18;
  int v19;
  char *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  unsigned int *v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  BOOL v29;
  unsigned int *v30;
  char *v32;
  uint64_t result;
  uint64_t v35;
  char *v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  char *v40;
  char *v41;
  uint64_t v42;
  unsigned int v43;
  int v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  uint64_t v48;
  char *v49;
  size_t v50;
  void **v51;
  void **v52;
  void **v53;
  unint64_t v54;
  size_t v55;
  void **v56;
  char *v57;
  size_t v58;
  size_t v59;
  char *v60;
  char *v61;
  size_t v62;
  uint64_t v66;
  void *v67;
  BOOL v68;
  int *v69;
  uint64_t v70;
  int v71;
  unint64_t v72;
  unint64_t v73;
  size_t v74;
  BOOL v76;
  int v77;
  int v78;
  _BOOL4 v80;
  char v81;
  BOOL v82;
  int v83;
  unint64_t i;
  _BOOL4 v85;
  int v86;
  int v87;
  int v88;
  int v89;
  unint64_t v90;
  uint64_t v91;
  const void **v92;
  size_t v94;
  void *v95;
  BOOL v96;
  unint64_t v98;
  void **v99;
  void *v100;
  uint64_t v102;
  unint64_t v103;
  char *v104;
  unint64_t v105;
  char *v106;
  unint64_t v108;
  uint64_t v110;
  unint64_t v112;
  unint64_t v113;
  size_t v114;

  v5 = *(_QWORD *)(a1 + 8);
  v6 = a1 + 16 * (v5 + 1);
  v7 = a3 - 1;
  if (!a3)
    v7 = 0;
  v8 = *(unsigned int *)(a1 + 4);
  v112 = (unint64_t)&a2[-v7];
  v113 = (unint64_t)&a2[a3 - v7];
  v10 = &a4[v8] >= a4 && &a2[-v7] <= &a2[a3 - v7] && v6 >= a1;
  if (!v10 || v5 + 1 > (unint64_t)((16 * (v5 + 1)) >> 4))
    goto LABEL_236;
  v108 = a1 + 16 * (v5 + 1);
  if (a1 + 16 > v6)
    goto LABEL_236;
  v12 = a3;
  v13 = a1;
  if (!v5)
    goto LABEL_221;
  v14 = a2;
  v15 = *(_QWORD *)(a1 + 8);
  v16 = 0;
  v17 = a1 + 16 * v5;
  v105 = (unint64_t)(a4 + 16);
  v12 = a3;
LABEL_16:
  v110 = v15;
  if (v17 < v13 || v17 + 16 > v108)
    goto LABEL_236;
  v18 = *(_DWORD *)v17;
  v19 = *(_DWORD *)v17 >> 28;
  switch(v19 ^ 8)
  {
    case 0:
      v24 = *(unsigned int **)(v17 + 8);
      v25 = *((_QWORD *)v24 + 1);
      v26 = (unint64_t)&v24[4 * v25 + 4];
      if ((unint64_t)(v24 + 4) > v26)
        goto LABEL_236;
      v27 = &a4[v8];
      v6 = (unint64_t)&a4[v24[1]];
      v114 = 0;
      if (v6 >= (unint64_t)&a4[v8] || v6 < (unint64_t)a4)
        goto LABEL_236;
      LODWORD(v6) = *(_DWORD *)v6;
      if ((_DWORD)v6)
        v29 = (int)v6 <= (int)v25;
      else
        v29 = 0;
      if (!v29)
        goto LABEL_237;
      if ((_DWORD)v6 == -1)
      {
        v90 = (unint64_t)&a4[*v24];
        if (v90 && (v90 >= (unint64_t)v27 || v90 < (unint64_t)a4))
          goto LABEL_236;
        v16 = __gen2_der_put_octet_string((unint64_t)v14, v12, v90, &v114) + v16;
      }
      else
      {
        v30 = &v24[4 * (int)v6];
        v6 = (unint64_t)(v30 + 4);
        if (v24 > v30 || v6 > v26)
          goto LABEL_236;
        v32 = &a4[v30[1]];
        if (v32)
        {
          if (v32 >= v27 || v32 < a4)
            goto LABEL_236;
        }
        result = __gen2_asn1_encode(*((_QWORD *)v30 + 1), v14);
        if ((_DWORD)result)
          return result;
        v16 = 0;
      }
      v74 = v114;
      v10 = v12 >= v114;
      v12 -= v114;
      if (!v10)
        goto LABEL_236;
      goto LABEL_196;
    case 9:
    case 0xA:
      v114 = 0;
      LODWORD(v6) = (_DWORD)a4;
      v20 = &a4[v8];
      v21 = &a4[*(unsigned int *)(v17 + 4)];
      v22 = *(_QWORD *)(v17 + 8);
      if ((v18 & 0x1000000) != 0)
      {
        if (v21 >= v20 || v21 < a4)
          goto LABEL_236;
        v23 = *(char **)v21;
        if (!*(_QWORD *)v21)
          goto LABEL_220;
        v20 = &v23[*(unsigned int *)(v22 + 4)];
        v21 = *(char **)v21;
      }
      else
      {
        v23 = a4;
      }
      if (v19 == 1)
      {
        if (v21 && (v21 >= v20 || v21 < v23))
          goto LABEL_236;
        result = __gen2_asn1_encode(v22, v14);
        if ((_DWORD)result)
          return result;
      }
      else
      {
        if (v21 && (v21 >= v20 || v21 < v23))
          goto LABEL_236;
        result = (*(uint64_t (**)(_BYTE *, size_t, char *, size_t *))v22)(v14, v12, v21, &v114);
        if ((_DWORD)result)
          return result;
      }
      goto LABEL_134;
    case 0xB:
      v114 = 0;
      v35 = *(unsigned int *)(v17 + 4);
      v36 = &a4[v35];
      v37 = v8 - v35;
      if (&a4[v8] < &a4[v35])
        goto LABEL_236;
      LODWORD(v6) = (_DWORD)a4;
      if (v36 < a4)
        goto LABEL_236;
      v38 = v8 - v35;
      if (v38 > v37)
        goto LABEL_236;
      if ((v18 & 0x1000000) != 0)
      {
        if (v36 >= &a4[v8])
          goto LABEL_236;
        v36 = *(char **)v36;
        if (!v36)
          goto LABEL_220;
        v39 = *(_QWORD *)(v17 + 8);
        v38 = *(unsigned int *)(v39 + 4);
        if (v36 > &v36[v38])
          goto LABEL_236;
      }
      else
      {
        v39 = *(_QWORD *)(v17 + 8);
      }
      if (!v38 && v36)
        goto LABEL_236;
      result = __gen2_asn1_encode(v39, v14);
      if (!(_DWORD)result)
      {
        result = (uint64_t)__gen2_der_put_length_and_tag(v14, v12, 0, (*(_DWORD *)v17 >> 22) & 3, (*(_DWORD *)v17 & 0x200000) != 0, *(_DWORD *)v17 & 0x1FFFFF, &v114);
        if (!(_DWORD)result)
        {
LABEL_134:
          v74 = v114;
          v10 = v12 >= v114;
          v12 -= v114;
          if (v10)
          {
            v16 = 0;
LABEL_196:
            v14 -= v74;
            goto LABEL_220;
          }
LABEL_236:
          __break(0x5519u);
LABEL_237:
          asn1_abort("invalid choice: %d", v6);
        }
      }
      return result;
    case 0xC:
      v114 = 0;
      if ((v18 & 0xFFFu) >= 0x15)
        asn1_abort("type larger then asn1_template_prim: %d", v18 & 0xFFF);
      v40 = &a4[*(unsigned int *)(v17 + 4)];
      if (v40 && (v40 >= &a4[v8] || v40 < a4))
        goto LABEL_236;
      result = ((uint64_t (*)(_BYTE *, size_t))asn1_template_prim[6 * (v18 & 0xFFF)])(v14, v12);
      if ((_DWORD)result)
        return result;
      goto LABEL_134;
    case 0xD:
      if (v105 < (unint64_t)a4)
        goto LABEL_236;
      v41 = &a4[*(unsigned int *)(v17 + 4)];
      v42 = *(unsigned int *)(*(_QWORD *)(v17 + 8) + 4);
      v114 = 0;
      if (v41 < a4 || (unint64_t)(v41 + 16) > v105)
        goto LABEL_236;
      v43 = *(_DWORD *)v41;
      if (!*(_DWORD *)v41)
        goto LABEL_219;
      v44 = 0;
      v45 = *((_QWORD *)v41 + 1);
      v46 = v45 + v43 * (unint64_t)v42;
      v47 = v45 + v42 * (unint64_t)(v43 - 1);
      v48 = -v42;
      while (!v47 || v47 < v46 && v47 >= v45)
      {
        result = __gen2_asn1_encode(*(_QWORD *)(v17 + 8), v14);
        if ((_DWORD)result)
          return result;
        v10 = v12 >= v114;
        v12 -= v114;
        if (!v10)
          break;
        v14 -= v114;
        v47 += v48;
        if (++v44 >= *(_DWORD *)v41)
          goto LABEL_218;
      }
      goto LABEL_236;
    case 0xE:
      if (v105 < (unint64_t)a4)
        goto LABEL_236;
      v106 = &a4[*(unsigned int *)(v17 + 4)];
      if (v106 < a4 || (unint64_t)(v106 + 16) > v105)
        goto LABEL_236;
      v49 = &a4[*(unsigned int *)(v17 + 4)];
      v50 = *(unsigned int *)v106;
      if (!(_DWORD)v50)
        goto LABEL_219;
      if (v50 >> 28)
        return 34;
      v102 = *(unsigned int *)(*(_QWORD *)(v17 + 8) + 4);
      v104 = (char *)*((_QWORD *)v106 + 1);
      v51 = (void **)malloc_type_calloc(v50, 0x10uLL, 0x108004057E67DB5uLL);
      if (v51)
        v52 = &v51[2 * v50];
      else
        v52 = 0;
      if (!v51)
        return 12;
      v53 = v51;
      if (!*(_DWORD *)v106)
      {
        v55 = 0;
        v68 = 0;
        goto LABEL_201;
      }
      v54 = 0;
      v55 = 0;
      v103 = (unint64_t)&v104[v50 * (unint64_t)v102];
      v56 = v51;
      v57 = v104;
      while (1)
      {
        v114 = 0;
        if (v57 && ((unint64_t)v57 >= v103 || v57 < v104))
          goto LABEL_236;
        v58 = __gen2_asn1_length(*(_QWORD *)(v17 + 8), v57);
        if (v58)
        {
          v59 = v58;
          v60 = (char *)malloc_type_malloc(v58, 0xEE4ECCE9uLL);
          v61 = &v60[v59];
          if (!v60)
            v61 = 0;
          v10 = v61 >= v60;
          v62 = v61 - v60;
          if (!v10 || v59 > v62 || v56 >= v52 || v56 < v53)
            goto LABEL_236;
          *v56 = (void *)v59;
          v56[1] = v60;
          if (!v60)
            break;
        }
        if (v56 >= v52 || v56 < v53 || v57 && ((unint64_t)v57 >= v103 || v57 < v104))
          goto LABEL_236;
        v66 = __gen2_asn1_encode(*(_QWORD *)(v17 + 8), (char *)*v56 + (_QWORD)v56[1] - 1);
        if ((_DWORD)v66)
        {
          v16 = v66;
          goto LABEL_228;
        }
        if (&v57[v102] < v57)
        {
          v16 = 1859794436;
          goto LABEL_228;
        }
        v67 = *v56;
        v56 += 2;
        v55 += (size_t)v67;
        ++v54;
        v49 = v106;
        v57 += v102;
        if (v54 >= *(unsigned int *)v106)
        {
          v68 = v55 > v12;
          if (v55 <= v12)
            v16 = 0;
          else
            v16 = 1859794436;
LABEL_201:
          if ((_DWORD)v16)
            goto LABEL_229;
          if (v68)
            goto LABEL_236;
          v12 -= v55;
          qsort(v53, *(unsigned int *)v106, 0x10uLL, (int (__cdecl *)(const void *, const void *))__gen2_heim_der_set_sort);
          v91 = 2 * (*(_DWORD *)v106 - 1);
          do
          {
            v92 = (const void **)&v53[v91];
            if (&v53[v91] >= v52 || v92 < (const void **)v53)
              goto LABEL_236;
            v94 = (size_t)*v92;
            v14 -= (unint64_t)*v92;
            v95 = v14 + 1;
            v96 = v113 >= (unint64_t)(v14 + 1) && (unint64_t)v95 >= v112;
            if (!v96 || v94 > v113 - (unint64_t)(v14 + 1))
              goto LABEL_236;
            memcpy(v95, v92[1], v94);
            free((void *)v92[1]);
            v91 -= 2;
          }
          while (v91 != -2);
          free(v53);
LABEL_218:
          v16 = 0;
LABEL_219:
          v8 = 16;
LABEL_220:
          v13 = a1;
          v17 -= 16;
          v15 = v110 - 1;
          if (v110 == 1)
          {
LABEL_221:
            result = 0;
            if (a5)
              *a5 = a3 - v12;
            return result;
          }
          goto LABEL_16;
        }
      }
      v16 = 12;
LABEL_228:
      v49 = v106;
LABEL_229:
      if (*(_DWORD *)v49)
      {
        v98 = 0;
        v99 = v53 + 1;
        do
        {
          v100 = *v99;
          v99 += 2;
          free(v100);
          ++v98;
        }
        while (v98 < *(unsigned int *)v49);
      }
      free(v53);
      return v16;
    case 0xF:
      v69 = *(int **)(v17 + 8);
      v70 = *((_QWORD *)v69 + 1);
      v6 = (unint64_t)&v69[4 * v70 + 4];
      if ((unint64_t)(v69 + 4) > v6)
        goto LABEL_236;
      v71 = *v69;
      v72 = (unint64_t)&v69[4 * v70];
      if ((*v69 & 1) != 0)
      {
        v73 = 31;
      }
      else
      {
        if ((unint64_t)v69 > v72 || v72 + 16 > v6)
          goto LABEL_236;
        v73 = v69[4 * v70 + 1];
      }
      if (v70)
        v76 = v12 == 0;
      else
        v76 = 1;
      if (v76)
      {
        LOBYTE(v77) = 0;
        v78 = 0;
LABEL_148:
        result = 1859794436;
        if (v71 & 1 | v78)
        {
          if (!v12)
            return result;
          if ((unint64_t)v14 >= v113 || (unint64_t)v14 < v112)
            goto LABEL_236;
          *v14-- = v77;
          --v12;
        }
        if (!v12)
          return result;
        v80 = (unint64_t)v14 < v113 && (unint64_t)v14 >= v112;
        if ((v71 & 1) != 0 || !v78)
        {
          if (!v80)
            goto LABEL_236;
          v81 = 0;
        }
        else
        {
          if (!v80)
            goto LABEL_236;
          v81 = v78 - 1;
        }
        *v14-- = v81;
        --v12;
        goto LABEL_220;
      }
      v78 = 0;
      v77 = 0;
      if (a4)
        v82 = v8 <= 0;
      else
        v82 = 0;
      v83 = !v82;
      while ((unint64_t)v69 <= v72 && v72 + 16 <= v6)
      {
        for (i = *(unsigned int *)(v72 + 4); v73 >> 3 > i >> 3; i = *(unsigned int *)(v72 + 4))
        {
          if (v77)
            v85 = 1;
          else
            v85 = (v71 & 1 | v78) != 0;
          if (v85)
          {
            if (!v12)
              return 1859794436;
            if ((unint64_t)v14 >= v113 || (unint64_t)v14 < v112)
              goto LABEL_236;
            *v14-- = v77;
            --v12;
          }
          v77 = 0;
          v73 -= 8;
        }
        if (!v83)
          break;
        v86 = *(_DWORD *)a4 >> i;
        v87 = i & 7;
        v88 = v77 | (1 << (v87 ^ 7));
        v89 = 8 - v87;
        if (v78)
          v89 = v78;
        if ((v86 & 1) != 0)
        {
          v77 = v88;
          v78 = v89;
        }
        if (--v70)
        {
          v72 -= 16;
          if (v12)
            continue;
        }
        goto LABEL_148;
      }
      goto LABEL_236;
    default:
      asn1_abort("unknown opcode: %d", v18 & 0xF0000000);
  }
}

uint64_t __gen2_asn1_length(unint64_t a1, char *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  BOOL v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  int v12;
  unsigned int **v13;
  unsigned int **v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  unsigned int v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  int *v26;
  int v28;
  BOOL v29;
  unsigned int *v30;
  char *v32;
  uint64_t v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t (*v39)();
  char *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v50;
  unint64_t v51;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = a1 + 16 * (v2 + 1);
  v4 = *(unsigned int *)(a1 + 4);
  LODWORD(v5) = (_DWORD)a2 + v4;
  v7 = &a2[v4] < a2 || v3 < a1 || v2 + 1 > (unint64_t)((16 * (v2 + 1)) >> 4);
  if (v7 || (v51 = a1 + 16 * (v2 + 1), a1 + 16 > v3))
  {
LABEL_100:
    __break(0x5519u);
LABEL_101:
    asn1_abort("unknown opcode: %d", v5 & 0xF0000000);
  }
  if (v2)
  {
    v9 = 0;
    v50 = (unint64_t)(a2 + 16);
    v10 = a1;
    v11 = a1 + 16 * v2;
    while (1)
    {
      if (v11 < v10)
        goto LABEL_100;
      LODWORD(v5) = v51;
      if (v11 + 16 > v51)
        goto LABEL_100;
      LODWORD(v5) = *(_DWORD *)v11;
      v12 = *(_DWORD *)v11 >> 28;
      switch(v12 ^ 8)
      {
        case 0:
          v5 = *(_QWORD *)(v11 + 8);
          v23 = *(_QWORD *)(v5 + 8);
          v24 = v5 + 16 + 16 * v23;
          if (v5 + 16 > v24)
            goto LABEL_100;
          v25 = &a2[v4];
          v26 = (int *)&a2[*(unsigned int *)(v5 + 4)];
          if (v26 >= (int *)&a2[v4] || v26 < (int *)a2)
            goto LABEL_100;
          v28 = *v26;
          if (*v26)
            v29 = v28 <= (int)v23;
          else
            v29 = 0;
          if (!v29)
            asn1_abort("invalid choice: %d", v28);
          if (v28 == -1)
          {
            v5 = *(unsigned int *)v5;
            v48 = (unint64_t)&a2[v5];
            if (&a2[v5] && (v48 >= (unint64_t)v25 || v48 < (unint64_t)a2))
              goto LABEL_100;
            v45 = __gen2_der_length_octet_string(v48);
          }
          else
          {
            v30 = (unsigned int *)(v5 + 16 * v28);
            if (v5 > (unint64_t)v30 || (unint64_t)(v30 + 4) > v24)
              goto LABEL_100;
            v15 = *((_QWORD *)v30 + 1);
            v5 = v30[1];
            v32 = &a2[v5];
            if (&a2[v5])
            {
              if (v32 >= v25 || v32 < a2)
                goto LABEL_100;
            }
LABEL_77:
            v45 = __gen2_asn1_length(v15);
          }
          goto LABEL_83;
        case 9:
        case 0xA:
          v13 = (unsigned int **)&a2[v4];
          v14 = (unsigned int **)&a2[*(unsigned int *)(v11 + 4)];
          v15 = *(_QWORD *)(v11 + 8);
          if ((v5 & 0x1000000) == 0)
          {
            v5 = (unint64_t)a2;
            goto LABEL_73;
          }
          if (v14 >= v13 || v14 < (unsigned int **)a2)
            goto LABEL_100;
          v5 = (unint64_t)*v14;
          if (!*v14)
            goto LABEL_84;
          v13 = (unsigned int **)(v5 + *(unsigned int *)(v15 + 4));
          v14 = (unsigned int **)*v14;
LABEL_73:
          if (v12 == 1)
          {
            if (v14 && (v14 >= v13 || (unint64_t)v14 < v5))
              goto LABEL_100;
            goto LABEL_77;
          }
          v39 = *(uint64_t (**)())(v15 + 16);
          if (v14 && (v14 >= v13 || (unint64_t)v14 < v5))
            goto LABEL_100;
          v40 = (char *)v14;
LABEL_82:
          v45 = ((uint64_t (*)(char *))v39)(v40);
LABEL_83:
          v9 += v45;
          goto LABEL_84;
        case 0xB:
          v34 = *(unsigned int *)(v11 + 4);
          v35 = &a2[v34];
          v36 = v4 - v34;
          if (&a2[v4] < &a2[v34])
            goto LABEL_100;
          if (v35 < a2)
            goto LABEL_100;
          v37 = v4 - v34;
          if (v37 > v36)
            goto LABEL_100;
          if ((v5 & 0x1000000) != 0)
          {
            if (v35 >= &a2[v4])
              goto LABEL_100;
            v35 = *(char **)v35;
            if (!v35)
              goto LABEL_84;
            v38 = *(_QWORD *)(v11 + 8);
            v37 = *(unsigned int *)(v38 + 4);
            LODWORD(v5) = (_DWORD)v35 + v37;
            if (v35 > &v35[v37])
              goto LABEL_100;
          }
          else
          {
            v38 = *(_QWORD *)(v11 + 8);
          }
          if (!v37 && v35)
            goto LABEL_100;
          v46 = __gen2_asn1_length(v38);
          v47 = __gen2_der_length_tag(*(_DWORD *)v11 & 0x1FFFFF);
          v9 += v46 + v47 + __gen2_der_length_len(v46);
LABEL_84:
          v10 = a1;
          v11 -= 16;
          if (!--v2)
            return v9;
          break;
        case 0xC:
          if ((*(_DWORD *)v11 & 0xFFFu) >= 0x15)
            asn1_abort("type larger then asn1_template_prim: %d", *(_DWORD *)v11 & 0xFFF);
          v39 = asn1_template_prim[6 * (v5 & 0xFFF) + 2];
          v40 = &a2[*(unsigned int *)(v11 + 4)];
          if (v40)
          {
            LODWORD(v5) = (_DWORD)a2 + v4;
            if (v40 >= &a2[v4] || v40 < a2)
              goto LABEL_100;
          }
          goto LABEL_82;
        case 0xD:
        case 0xE:
          if (v50 < (unint64_t)a2)
            goto LABEL_100;
          v16 = *(unsigned int *)(v11 + 4);
          v17 = &a2[v16];
          if (&a2[v16] < a2)
            goto LABEL_100;
          LODWORD(v5) = v50;
          if ((unint64_t)(v17 + 16) > v50)
            goto LABEL_100;
          if (!*(_DWORD *)v17)
            goto LABEL_25;
          v18 = 0;
          v5 = *(_QWORD *)(v11 + 8);
          v19 = *(unsigned int *)(v5 + 4);
          v20 = *((_QWORD *)v17 + 1);
          v21 = v20 + v19 * (unint64_t)*(unsigned int *)v17;
          v22 = v20;
          do
          {
            if (v22 && (v22 >= v21 || v22 < v20))
              goto LABEL_100;
            v9 += __gen2_asn1_length(*(_QWORD *)(v11 + 8));
            v22 += v19;
            ++v18;
          }
          while (v18 < *(_DWORD *)v17);
LABEL_25:
          v4 = 16;
          goto LABEL_84;
        case 0xF:
          v41 = *(_QWORD *)(v11 + 8);
          v5 = *(_QWORD *)(v41 + 8);
          v42 = v41 + 16 + 16 * v5;
          if (v41 + 16 > v42)
            goto LABEL_100;
          if ((*(_BYTE *)v41 & 1) != 0)
          {
            v9 += 5;
          }
          else
          {
            ++v9;
            if (v5)
            {
              if (a2 && v4 < 1)
                goto LABEL_100;
              v43 = v41 + 16 * v5;
              while (1)
              {
                if (v41 > v43 || v43 + 16 > v42)
                  goto LABEL_100;
                v44 = *(unsigned int *)(v43 + 4);
                if (((*(_DWORD *)a2 >> v44) & 1) != 0)
                  break;
                v43 -= 16;
                if (!--v5)
                  goto LABEL_84;
              }
              v9 += (v44 >> 3) + 1;
            }
          }
          goto LABEL_84;
        default:
          goto LABEL_101;
      }
    }
  }
  return 0;
}

void __gen2_asn1_free(unint64_t a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  unint64_t v12;
  unint64_t *v13;
  uint64_t v14;
  unsigned int *v15;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  int *v25;
  uint64_t v27;
  unint64_t v28;
  unint64_t v30;
  unint64_t *v32;
  void (*v33)(void);
  unint64_t v34;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = v2 + 1;
  v4 = a1 + 16 * (v2 + 1);
  v5 = *(unsigned int *)(a1 + 4);
  v6 = (uint64_t)(16 * (v2 + 1)) >> 4;
  if (a2 + v5 < a2 || v4 < a1 || v3 > v6)
    goto LABEL_99;
  v9 = a1;
  v10 = a1 + 16;
  v39 = a1 + 16 * (v2 + 1);
  if (a1 + 16 > v4)
    goto LABEL_99;
  if ((*(_BYTE *)a1 & 1) != 0)
  {
    if (a2 && !(_DWORD)v5)
      goto LABEL_99;
    __gen2_der_free_octet_string(a2);
  }
  if (v10 < v9 || v2 > (uint64_t)(16 * v3 - 16) >> 4)
  {
LABEL_99:
    __break(0x5519u);
LABEL_100:
    asn1_abort("unknown opcode: %d", v6 & 0xF0000000);
  }
  if (v2)
  {
    v38 = a2 + 16;
    while (1)
    {
      LODWORD(v6) = v39;
      if (v9 + 32 > v39)
        goto LABEL_99;
      LODWORD(v6) = *(_DWORD *)(v9 + 16);
      v11 = v6 >> 28;
      switch((v6 >> 28) ^ 8)
      {
        case 0u:
          v6 = *(_QWORD *)(v9 + 24);
          v22 = *(_QWORD *)(v6 + 8);
          v23 = v6 + 16 + 16 * v22;
          if (v6 + 16 > v23)
            goto LABEL_99;
          v24 = a2 + v5;
          v25 = (int *)(a2 + *(unsigned int *)(v6 + 4));
          if ((unint64_t)v25 >= a2 + v5 || (unint64_t)v25 < a2)
            goto LABEL_99;
          v27 = *v25;
          if (!(_DWORD)v27)
            goto LABEL_91;
          if ((int)v27 > (int)v22)
            asn1_abort("invalid choice: %d", v27);
          if ((_DWORD)v27 == -1)
          {
            v6 = *(unsigned int *)v6;
            v37 = a2 + v6;
            if (a2 + v6 && (v37 >= v24 || v37 < a2))
              goto LABEL_99;
            __gen2_der_free_octet_string(v37);
          }
          else
          {
            v28 = v6 + 16 * v27;
            if (v6 > v28 || v28 + 16 > v23)
              goto LABEL_99;
            v6 = *(unsigned int *)(v28 + 4);
            v30 = a2 + v6;
            if (a2 + v6)
            {
              if (v30 >= v24 || v30 < a2)
                goto LABEL_99;
            }
            __gen2_asn1_free(*(_QWORD *)(v28 + 8), v30);
          }
          goto LABEL_91;
        case 9u:
        case 0xAu:
          v12 = a2 + v5;
          v13 = (unint64_t *)(a2 + *(unsigned int *)(v9 + 20));
          v14 = *(_QWORD *)(v9 + 24);
          if ((v6 & 0x1000000) != 0)
          {
            if ((unint64_t)v13 >= v12 || (unint64_t)v13 < a2)
              goto LABEL_99;
            v6 = *v13;
            if (!*v13)
              goto LABEL_91;
            v12 = v6 + *(unsigned int *)(v14 + 4);
            v13 = (unint64_t *)*v13;
          }
          else
          {
            v6 = a2;
          }
          if (v11 != 1)
          {
            if (v13 && ((unint64_t)v13 >= v12 || (unint64_t)v13 < v6))
              goto LABEL_99;
            (*(void (**)(unint64_t *))(v14 + 32))(v13);
            goto LABEL_89;
          }
          if (!v13)
            goto LABEL_88;
          if ((unint64_t)v13 >= v12)
            goto LABEL_99;
          goto LABEL_87;
        case 0xBu:
          v32 = (unint64_t *)(a2 + v5);
          v13 = (unint64_t *)(a2 + *(unsigned int *)(v9 + 20));
          v14 = *(_QWORD *)(v9 + 24);
          if ((v6 & 0x1000000) == 0)
          {
            v6 = a2;
            if (v13)
              goto LABEL_86;
            goto LABEL_88;
          }
          if (v13 >= v32 || (unint64_t)v13 < a2)
            goto LABEL_99;
          v13 = (unint64_t *)*v13;
          if (v13)
          {
            v32 = (unint64_t *)((char *)v13 + *(unsigned int *)(v14 + 4));
            v6 = (unint64_t)v13;
LABEL_86:
            if (v13 >= v32)
              goto LABEL_99;
LABEL_87:
            if ((unint64_t)v13 < v6)
              goto LABEL_99;
LABEL_88:
            __gen2_asn1_free(v14, v13);
LABEL_89:
            if ((*(_BYTE *)(v9 + 19) & 1) != 0)
              free(v13);
          }
LABEL_91:
          v6 = 16 * v2 - 16;
          if (v3 - 2 > (uint64_t)v6 >> 4)
            goto LABEL_99;
          v9 += 16;
          v3 = v2--;
          if (!v2)
            return;
          break;
        case 0xCu:
          if ((*(_DWORD *)(v9 + 16) & 0xFFFu) >= 0x15)
            asn1_abort("type larger then asn1_template_prim: %d", *(_DWORD *)(v9 + 16) & 0xFFF);
          v33 = (void (*)(void))asn1_template_prim[6 * (v6 & 0xFFF) + 4];
          v34 = a2 + *(unsigned int *)(v9 + 20);
          if (v34)
          {
            LODWORD(v6) = a2 + v5;
            if (v34 >= a2 + v5)
              goto LABEL_99;
            LODWORD(v6) = a2;
            if (v34 < a2)
              goto LABEL_99;
          }
          v33();
          goto LABEL_91;
        case 0xDu:
        case 0xEu:
          LODWORD(v6) = a2 + 16;
          if (v38 < a2)
            goto LABEL_99;
          LODWORD(v6) = a2;
          v15 = (unsigned int *)(a2 + *(unsigned int *)(v9 + 20));
          if ((unint64_t)v15 >= v38 || (unint64_t)v15 < a2)
            goto LABEL_99;
          if (!*v15)
            goto LABEL_35;
          LODWORD(v6) = (_DWORD)v15 + 16;
          if ((unint64_t)(v15 + 4) > v38)
            goto LABEL_99;
          v17 = 0;
          v6 = *(_QWORD *)(v9 + 24);
          v18 = *(unsigned int *)(v6 + 4);
          v19 = *((_QWORD *)v15 + 1);
          v20 = v19 + *v15 * (unint64_t)v18;
          v21 = v19;
          do
          {
            if (v21 && (v21 >= v20 || v21 < v19))
              goto LABEL_99;
            __gen2_asn1_free(*(_QWORD *)(v9 + 24), v21);
            v21 += v18;
            ++v17;
          }
          while (v17 < *v15);
          free(*((void **)v15 + 1));
          *((_QWORD *)v15 + 1) = 0;
          *v15 = 0;
LABEL_35:
          v5 = 16;
          goto LABEL_91;
        case 0xFu:
          goto LABEL_91;
        default:
          goto LABEL_100;
      }
    }
  }
}

uint64_t __gen2_asn1_copy(unint64_t a1, unint64_t a2, size_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v11;
  unint64_t v12;
  BOOL v14;
  uint64_t v15;
  int64_t v16;
  uint64_t v17;
  unsigned int *v18;
  unsigned int *v19;
  size_t v20;
  size_t v21;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v28;
  unint64_t v29;
  uint64_t v31;
  unsigned int v32;
  uint64_t (*v33)(void);
  unint64_t v34;
  unint64_t v35;
  unsigned int *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  int *v40;
  int v42;
  BOOL v43;
  unint64_t v44;
  int *v45;
  uint64_t v46;
  unsigned int *v47;
  uint64_t v49;
  unint64_t v50;
  unint64_t v52;
  unint64_t v54;
  uint64_t v55;
  void **v56;
  unint64_t v57;
  unint64_t v58;
  size_t v59;
  unint64_t v60;
  void **v61;
  uint64_t v62;
  size_t v63;
  char *v64;
  _QWORD *v65;
  uint64_t v66;
  unint64_t v67;
  _QWORD *v68;
  unint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  size_t *v77;
  unint64_t v79;
  BOOL v80;
  unint64_t v81;
  __int128 v82;

  v3 = *(_QWORD *)(a1 + 8);
  v4 = v3 + 1;
  v5 = a1 + 16 * (v3 + 1);
  v6 = *(unsigned int *)(a1 + 4);
  v7 = a2 + v6;
  *(_QWORD *)&v82 = a2;
  *((_QWORD *)&v82 + 1) = a3;
  v8 = (size_t *)((char *)a3 + v6) >= a3 && v7 >= a2;
  if (!v8 || v5 < a1 || v4 > (uint64_t)(16 * (v3 + 1)) >> 4)
    goto LABEL_168;
  v11 = a1;
  v7 = a1 + 16;
  if (a1 + 16 > v5 || v7 < a1 || v3 > (uint64_t)(16 * v4 - 16) >> 4)
    goto LABEL_168;
  if ((*(_DWORD *)a1 & 1) != 0)
  {
    LODWORD(v7) = v82;
    if (v82 != 0 && !(_DWORD)v6)
      goto LABEL_168;
    v12 = __gen2_der_copy_octet_string(a2, a3);
    if ((_DWORD)v12)
      return v12;
  }
  if (!v3)
    return 0;
  v79 = *((_QWORD *)&v82 + 1) + 16;
  v14 = (uint64_t)v82 + 16 < (unint64_t)v82
     || (unint64_t)(*((_QWORD *)&v82 + 1) + 16) < *((_QWORD *)&v82 + 1);
  v80 = v14;
  v81 = v11 + 16 * v3 + 16;
  while (2)
  {
    LODWORD(v7) = v81;
    if (v11 + 32 > v81)
      goto LABEL_168;
    LODWORD(v7) = *(_DWORD *)(v11 + 16);
    switch((v7 >> 28) ^ 8)
    {
      case 0u:
        v36 = *(unsigned int **)(v11 + 24);
        v37 = *((_QWORD *)v36 + 1);
        LODWORD(v7) = (_DWORD)v36 + 16;
        v38 = (unint64_t)&v36[4 * v37 + 4];
        if ((unint64_t)(v36 + 4) > v38)
          goto LABEL_168;
        v39 = v36[1];
        v7 = v82 + v6;
        v40 = (int *)(v82 + v39);
        if ((uint64_t)v82 + v39 >= (unint64_t)v82 + v6 || (unint64_t)v40 < (unint64_t)v82)
          goto LABEL_168;
        v42 = *v40;
        if (*v40)
          v43 = v42 <= (int)v37;
        else
          v43 = 0;
        if (!v43)
          return 1859794451;
        v44 = *((_QWORD *)&v82 + 1) + v6;
        v45 = (int *)(*((_QWORD *)&v82 + 1) + v39);
        if ((unint64_t)v45 >= *((_QWORD *)&v82 + 1) + v6 || (unint64_t)v45 < *((_QWORD *)&v82 + 1))
          goto LABEL_168;
        *v45 = v42;
        v46 = *v40;
        if ((_DWORD)v46 == -1)
        {
          v75 = *v36;
          v76 = v82 + v75;
          if ((_QWORD)v82 + v75)
          {
            if (v76 >= v7)
              goto LABEL_168;
            LODWORD(v7) = v82;
            if (v76 < (unint64_t)v82)
              goto LABEL_168;
          }
          LODWORD(v7) = DWORD2(v82);
          v77 = (size_t *)(*((_QWORD *)&v82 + 1) + v75);
          if (*((_QWORD *)&v82 + 1) + v75)
          {
            if ((unint64_t)v77 >= v44 || (unint64_t)v77 < *((_QWORD *)&v82 + 1))
              goto LABEL_168;
          }
          v54 = __gen2_der_copy_octet_string(v76, v77);
        }
        else
        {
          v47 = &v36[4 * v46];
          if (v36 > v47 || (unint64_t)(v47 + 4) > v38)
            goto LABEL_168;
          v49 = v47[1];
          v50 = v82 + v49;
          if ((_QWORD)v82 + v49)
          {
            v8 = v50 >= v7;
            LODWORD(v7) = v82;
            if (v8 || v50 < (unint64_t)v82)
              goto LABEL_168;
          }
          LODWORD(v7) = DWORD2(v82);
          v52 = *((_QWORD *)&v82 + 1) + v49;
          if (*((_QWORD *)&v82 + 1) + v49)
          {
            if (v52 >= v44 || v52 < *((_QWORD *)&v82 + 1))
              goto LABEL_168;
          }
          v54 = __gen2_asn1_copy(*((_QWORD *)v47 + 1), v50, v52);
        }
        v12 = v54;
        if ((_DWORD)v54)
          return v12;
        goto LABEL_156;
      case 9u:
      case 0xAu:
        v15 = *(_QWORD *)(v11 + 24);
        if (v7 >> 28 == 1)
          v16 = *(unsigned int *)(v15 + 4);
        else
          v16 = *(_QWORD *)(v15 + 40);
        v64 = (char *)*((_QWORD *)&v82 + 1);
        v65 = (_QWORD *)v82;
        v66 = *(unsigned int *)(v11 + 20);
        v67 = v82 + v6;
        v68 = (_QWORD *)(v82 + v66);
        v69 = *((_QWORD *)&v82 + 1) + v6;
        v61 = (void **)(*((_QWORD *)&v82 + 1) + v66);
        if ((v7 & 0x1000000) != 0)
        {
          if ((unint64_t)v68 >= v67 || (unint64_t)v68 < (unint64_t)v82)
            goto LABEL_168;
          v65 = (_QWORD *)*v68;
          if (!*v68)
            goto LABEL_156;
          v64 = (char *)malloc_type_calloc(1uLL, v16, 0x7732D8BEuLL);
          if (!v64)
            return 12;
          if (v16 < 1 || (unint64_t)v61 >= v69 || (unint64_t)v61 < *((_QWORD *)&v82 + 1))
            goto LABEL_168;
          v67 = (unint64_t)v65 + v16;
          v70 = &v64[v16];
          *v61 = v64;
          LODWORD(v7) = *(_DWORD *)(v11 + 16);
          v71 = v64;
          v68 = v65;
        }
        else
        {
          v70 = (char *)(*((_QWORD *)&v82 + 1) + v6);
          v71 = (char *)(*((_QWORD *)&v82 + 1) + v66);
        }
        LODWORD(v7) = v7 >> 28;
        if ((_DWORD)v7 == 1)
        {
          if (v68 && ((unint64_t)v68 >= v67 || v68 < v65) || v71 && (v71 >= v70 || v71 < v64))
            goto LABEL_168;
          v72 = __gen2_asn1_copy(*(_QWORD *)(v11 + 24), v68, v71);
        }
        else
        {
          if (v68 && ((unint64_t)v68 >= v67 || v68 < v65) || v71 && (v71 >= v70 || v71 < v64))
            goto LABEL_168;
          v72 = (*(uint64_t (**)(_QWORD *, char *))(*(_QWORD *)(v11 + 24) + 24))(v68, v71);
        }
        v12 = v72;
        if ((_DWORD)v72)
        {
          if ((*(_BYTE *)(v11 + 19) & 1) == 0)
            return v12;
          if ((unint64_t)v61 < v69 && (unint64_t)v61 >= *((_QWORD *)&v82 + 1))
          {
LABEL_165:
            free(*v61);
            *v61 = 0;
            return v12;
          }
LABEL_168:
          __break(0x5519u);
LABEL_169:
          asn1_abort("unknown opcode: %d", v7 & 0xF0000000);
        }
        goto LABEL_156;
      case 0xBu:
        v55 = *(unsigned int *)(v11 + 20);
        v56 = (void **)(*((_QWORD *)&v82 + 1) + v55);
        if ((unint64_t)(*((_QWORD *)&v82 + 1) + v55) < *((_QWORD *)&v82 + 1))
          goto LABEL_168;
        v57 = v82 + v6;
        v58 = v82 + v55;
        if ((uint64_t)v82 + v55 > (unint64_t)v82 + v6)
          goto LABEL_168;
        if (v58 < (unint64_t)v82)
          goto LABEL_168;
        v59 = v6 - v55;
        if (v6 - v55 > v57 - v58)
          goto LABEL_168;
        v60 = *((_QWORD *)&v82 + 1) + v6;
        if ((unint64_t)v56 > *((_QWORD *)&v82 + 1) + v6 || v59 > v60 - (unint64_t)v56)
          goto LABEL_168;
        if ((v7 & 0x1000000) != 0)
        {
          if (v58 >= v57)
            goto LABEL_168;
          if (!*(_QWORD *)v58)
            goto LABEL_156;
          v59 = *(unsigned int *)(*(_QWORD *)(v11 + 24) + 4);
          v73 = malloc_type_calloc(1uLL, v59, 0x77DE9D74uLL);
          if (!v73)
            return 12;
          if (!(_DWORD)v59)
            goto LABEL_168;
          if ((unint64_t)v56 >= v60)
            goto LABEL_168;
          *v56 = v73;
          v58 = *(_QWORD *)v58;
          if (v58 > v58 + v59)
            goto LABEL_168;
          v61 = v56;
          v56 = (void **)v73;
        }
        else
        {
          v60 = 0;
          v61 = 0;
        }
        if (!v59 && (unint64_t)v56 | v58)
          goto LABEL_168;
        v74 = __gen2_asn1_copy(*(_QWORD *)(v11 + 24), v58, v56);
        if ((_DWORD)v74)
        {
          v12 = v74;
          if (!v61)
            return v12;
          if ((unint64_t)v61 < v60)
            goto LABEL_165;
          goto LABEL_168;
        }
        goto LABEL_156;
      case 0xCu:
        v32 = *(_DWORD *)(v11 + 16) & 0xFFF;
        if (v32 >= 0x15)
          asn1_abort("type larger then asn1_template_prim: %d", *(_DWORD *)(v11 + 16) & 0xFFF);
        v7 = *(unsigned int *)(v11 + 20);
        v33 = asn1_template_prim[6 * v32 + 3];
        v34 = v82 + v7;
        if ((_QWORD)v82 + v7 && (v34 >= (unint64_t)v82 + v6 || v34 < (unint64_t)v82))
          goto LABEL_168;
        v35 = *((_QWORD *)&v82 + 1) + v7;
        if (*((_QWORD *)&v82 + 1) + v7)
        {
          LODWORD(v7) = DWORD2(v82) + v6;
          if (v35 >= *((_QWORD *)&v82 + 1) + v6)
            goto LABEL_168;
          LODWORD(v7) = DWORD2(v82);
          if (v35 < *((_QWORD *)&v82 + 1))
            goto LABEL_168;
        }
        v31 = v33();
        if ((_DWORD)v31)
          return v31;
        goto LABEL_156;
      case 0xDu:
      case 0xEu:
        if (v80)
          goto LABEL_168;
        v17 = *(unsigned int *)(v11 + 20);
        LODWORD(v7) = v82;
        v18 = (unsigned int *)(v82 + v17);
        if ((uint64_t)v82 + v17 < (unint64_t)v82)
          goto LABEL_168;
        LODWORD(v7) = (_DWORD)v18 + 16;
        if ((unint64_t)(v18 + 4) > (uint64_t)v82 + 16)
          goto LABEL_168;
        LODWORD(v7) = DWORD2(v82);
        v19 = (unsigned int *)(*((_QWORD *)&v82 + 1) + v17);
        v20 = *v18;
        if (!(_DWORD)v20)
        {
          if ((unint64_t)v19 < *((_QWORD *)&v82 + 1))
            goto LABEL_168;
          LODWORD(v7) = DWORD2(v82) + 16;
          if ((unint64_t)(v19 + 4) > v79)
            goto LABEL_168;
          *((_QWORD *)v19 + 1) = 0;
          *v19 = 0;
LABEL_136:
          v6 = 16;
LABEL_156:
          v7 = 16 * v3 - 16;
          if (v4 - 2 > (uint64_t)v7 >> 4)
            goto LABEL_168;
          v11 += 16;
          v4 = v3--;
          if (!v3)
            return 0;
          continue;
        }
        v21 = *(unsigned int *)(*(_QWORD *)(v11 + 24) + 4);
        v22 = malloc_type_calloc(v20, v21, 0x976FAD9CuLL);
        if (!v22)
          return 12;
        if (!(_DWORD)v21)
          goto LABEL_168;
        if ((unint64_t)v19 < *((_QWORD *)&v82 + 1))
          goto LABEL_168;
        LODWORD(v7) = DWORD2(v82) + 16;
        if ((unint64_t)(v19 + 4) > v79)
          goto LABEL_168;
        *((_QWORD *)v19 + 1) = v22;
        *v19 = *v18;
        v23 = *v18;
        if (!(_DWORD)v23)
          goto LABEL_136;
        v24 = 0;
        v25 = 0;
        while (1)
        {
          v7 = *((_QWORD *)v18 + 1);
          v26 = v7 + v24;
          if (v7 + v24)
          {
            if (v26 >= v7 + v23 * v21 || v26 < v7)
              goto LABEL_168;
          }
          v28 = *((_QWORD *)v19 + 1);
          v29 = v28 + v24;
          if (v28 + v24)
          {
            v7 = v28 + *v19 * (unint64_t)v21;
            if (v29 < v28 || v29 >= v7)
              goto LABEL_168;
          }
          v31 = __gen2_asn1_copy(*(_QWORD *)(v11 + 24), v26, v29);
          if ((_DWORD)v31)
            return v31;
          ++v25;
          v23 = *v18;
          v24 += v21;
          if (v25 >= v23)
            goto LABEL_136;
        }
      case 0xFu:
        v62 = *(_QWORD *)(v11 + 24);
        v7 = v62 + 16 + 16 * *(_QWORD *)(v62 + 8);
        if (v62 + 16 > v7)
          goto LABEL_168;
        v63 = *(unsigned int *)(v62 + 4);
        if (v6 < v63)
          goto LABEL_168;
        memcpy(*((void **)&v82 + 1), (const void *)v82, v63);
        goto LABEL_156;
      default:
        goto LABEL_169;
    }
  }
}

unint64_t __gen2_asn1_decode_top(unint64_t result, unsigned int a2, unsigned __int8 *a3, size_t a4, char *a5, size_t *a6)
{
  size_t v7;
  unint64_t v12;
  uint64_t v13;

  v7 = *(unsigned int *)(result + 4);
  if (&a5[v7] < a5)
  {
    __break(0x5519u);
  }
  else
  {
    v12 = result;
    bzero(a5, v7);
    v13 = __gen2_asn1_decode(v12, a2, a3, a4, a5, a6);
    if ((_DWORD)v13)
      __gen2_asn1_free_top(v12, a5);
    return v13;
  }
  return result;
}

void __gen2_asn1_free_top(unint64_t a1, char *a2)
{
  size_t v4;

  __gen2_asn1_free(a1, (unint64_t)a2);
  v4 = *(unsigned int *)(a1 + 4);
  if (&a2[v4] < a2)
    __break(0x5519u);
  else
    bzero(a2, v4);
}

unint64_t __gen2_asn1_copy_top(unint64_t result, unint64_t a2, char *a3)
{
  size_t v4;
  unint64_t v6;
  uint64_t v7;

  v4 = *(unsigned int *)(result + 4);
  if (&a3[v4] < a3)
  {
    __break(0x5519u);
  }
  else
  {
    v6 = result;
    bzero(a3, v4);
    v7 = __gen2_asn1_copy(v6, a2, (size_t *)a3);
    if ((_DWORD)v7)
      __gen2_asn1_free_top(v6, a3);
    return v7;
  }
  return result;
}

char *rk_hex_encode(_BYTE *a1, uint64_t a2, char **a3)
{
  uint64_t v4;
  size_t v6;
  char *result;
  unint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  char *v14;
  char *v15;
  char *v16;

  v4 = a2;
  v6 = (2 * a2) | 1;
  result = (char *)malloc_type_malloc(v6, 0x23700864uLL);
  if (result)
    v8 = (unint64_t)&result[v6];
  else
    v8 = 0;
  if (!result)
  {
    v10 = -1;
    goto LABEL_30;
  }
  if (!v4)
  {
    v10 = 0;
LABEL_23:
    v16 = &result[v10];
    if ((unint64_t)&result[v10] >= v8 || v16 < result)
      goto LABEL_31;
    *v16 = 0;
    if (v16 + 1 < v16 || (unint64_t)(v16 + 1) > v8)
      goto LABEL_31;
LABEL_30:
    *a3 = result;
    return (char *)v10;
  }
  v9 = &a1[v4];
  v10 = 2 * v4;
  v11 = result + 1;
  while (a1 < v9)
  {
    v12 = &hexchar[(unint64_t)*a1 >> 4];
    if (v12 >= byte_24BA6DE88 || v12 < hexchar)
      break;
    v14 = v11 - 1;
    if ((unint64_t)(v11 - 1) >= v8)
      break;
    if (v14 < result)
      break;
    *v14 = *v12;
    v15 = &hexchar[*a1 & 0xF];
    if (v15 >= byte_24BA6DE88 || v15 < hexchar || (unint64_t)v11 >= v8 || v11 < result)
      break;
    *v11 = *v15;
    v11 += 2;
    ++a1;
    if (!--v4)
      goto LABEL_23;
  }
LABEL_31:
  __break(0x5519u);
  return result;
}

size_t rk_hex_decode(const char *a1, _BYTE *a2, size_t a3)
{
  unsigned __int8 *v5;
  size_t v6;
  size_t v7;
  size_t result;
  unint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  unint64_t v13;
  unsigned __int8 *v14;
  uint64_t v15;
  char v17;

  v5 = (unsigned __int8 *)a1;
  v6 = strlen(a1);
  v7 = v6 & 1;
  if (v7 + (v6 >> 1) > a3)
    return -1;
  v9 = v6;
  if ((v6 & 1) != 0)
  {
    result = pos(*v5);
    if (!a3 || (*a2 = result, !*v5))
    {
LABEL_25:
      __break(0x5519u);
      return result;
    }
    ++v5;
    v10 = a2 + 1;
  }
  else
  {
    v10 = a2;
  }
  result = strlen((const char *)v5);
  if (v9 >= 2)
  {
    v12 = &a2[a3];
    v13 = (unint64_t)&v5[result + 1];
    if (v9 >> 1 <= 1)
      v11 = 1;
    else
      v11 = v9 >> 1;
    v14 = v5 + 1;
    v15 = v11;
    while ((unint64_t)(v14 - 1) < v13 && v14 - 1 >= v5)
    {
      result = pos(*(v14 - 1));
      if ((unint64_t)v14 >= v13)
        break;
      if (v14 < v5)
        break;
      v17 = result;
      result = pos(*v14);
      if (v10 >= v12 || v10 < a2)
        break;
      *v10++ = result | (16 * v17);
      v14 += 2;
      if (!--v15)
        return v11 + v7;
    }
    goto LABEL_25;
  }
  v11 = 0;
  return v11 + v7;
}

uint64_t pos(unsigned __int8 a1)
{
  char v1;
  uint64_t result;

  v1 = __toupper(a1);
  result = 0;
  while (hexchar[result])
  {
    if (v1 == hexchar[result])
      return result;
    if (&hexchar[++result] >= byte_24BA6DE88)
    {
      __break(0x5519u);
      return 0xFFFFFFFFLL;
    }
  }
  return 0xFFFFFFFFLL;
}

__darwin_ct_rune_t __toupper(__darwin_ct_rune_t a1)
{
  return MEMORY[0x24BDAC938](*(_QWORD *)&a1);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE70](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void qsort(void *__base, size_t __nel, size_t __width, int (__cdecl *__compar)(const void *, const void *))
{
  MEMORY[0x24BDAFA18](__base, __nel, __width, __compar);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAFEA0](a1, a2);
}

int strcasecmp(const char *a1, const char *a2)
{
  return MEMORY[0x24BDAFED0](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x24BDAFFF8](__str, __sep, __lasts);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x24BDB0000](__str, __endptr, *(_QWORD *)&__base);
}

