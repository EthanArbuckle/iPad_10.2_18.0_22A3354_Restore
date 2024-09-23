size_t ffi_java_raw_size(ffi_cif *cif)
{
  unsigned int nargs;
  size_t result;
  ffi_type **i;
  unsigned int type;
  uint64_t v6;

  nargs = cif->nargs;
  if ((int)(nargs - 1) >= 0)
  {
    result = 0;
    for (i = cif->arg_types; ; ++i)
    {
      type = (*i)->type;
      if (type <= 0xA)
      {
        v6 = 16;
        if (type != 3)
          goto LABEL_9;
      }
      else
      {
        v6 = 16;
        if (type - 11 >= 2)
        {
          if (type == 15 || type == 13)
            abort();
LABEL_9:
          v6 = 8;
        }
      }
      result += v6;
      if ((int)--nargs <= 0)
        return result;
    }
  }
  return 0;
}

void ffi_java_raw_to_ptrarray(ffi_cif *cif, ffi_java_raw *raw, void **args)
{
  unsigned int nargs;
  ffi_type **arg_types;
  int type;

  nargs = cif->nargs;
  if (nargs)
  {
    arg_types = cif->arg_types;
    do
    {
      type = (*arg_types)->type;
      if ((type - 11) < 2 || type == 3)
      {
        *args = raw;
        raw += 2;
      }
      else
      {
        if (type == 15)
          abort();
        *args = raw++;
      }
      ++arg_types;
      ++args;
      --nargs;
    }
    while (nargs);
  }
}

void ffi_java_ptrarray_to_raw(ffi_cif *cif, void **args, ffi_java_raw *raw)
{
  uint64_t v3;
  ffi_type **arg_types;
  ffi_sarg v5;

  if (cif->nargs)
  {
    v3 = 0;
    arg_types = cif->arg_types;
    do
    {
      switch(arg_types[v3]->type)
      {
        case 2u:
          raw->flt = *(float *)args[v3];
          ++raw;
          break;
        case 3u:
        case 0xBu:
        case 0xCu:
          raw->sint = *(ffi_sarg *)args[v3];
          raw += 2;
          break;
        case 5u:
          v5 = *(unsigned __int8 *)args[v3];
          goto LABEL_13;
        case 6u:
          v5 = *(char *)args[v3];
          goto LABEL_13;
        case 7u:
          v5 = *(unsigned __int16 *)args[v3];
          goto LABEL_13;
        case 8u:
          v5 = *(__int16 *)args[v3];
          goto LABEL_13;
        case 9u:
          v5 = *(unsigned int *)args[v3];
          goto LABEL_13;
        case 0xAu:
          v5 = *(int *)args[v3];
          goto LABEL_13;
        case 0xEu:
          v5 = *(_QWORD *)args[v3];
LABEL_13:
          raw->sint = v5;
          ++raw;
          break;
        default:
          break;
      }
      ++v3;
    }
    while (v3 < cif->nargs);
  }
}

void ffi_java_raw_call(ffi_cif *cif, void (*fn)(void), void *rvalue, ffi_java_raw *avalue)
{
  size_t v8;
  char *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v10 - ((v8 + 15) & 0xFFFFFFFF0);
  bzero(v9, v8);
  ffi_java_raw_to_ptrarray(cif, avalue, (void **)v9);
  ffi_call(cif, fn, rvalue, (void **)v9);
}

ffi_status ffi_prep_java_raw_closure_loc(ffi_java_raw_closure *a1, ffi_cif *cif, void (__cdecl *fun)(ffi_cif *, void *, ffi_java_raw *, void *), void *user_data, void *codeloc)
{
  ffi_status result;

  result = ffi_prep_closure_loc((ffi_closure *)a1, cif, (void (__cdecl *)(ffi_cif *, void *, void **, void *))ffi_java_translate_args, codeloc, codeloc);
  if (result == FFI_OK)
  {
    a1->fun = fun;
    a1->user_data = user_data;
  }
  return result;
}

uint64_t ffi_java_translate_args(ffi_cif *a1, uint64_t a2, void **a3, uint64_t a4)
{
  ffi_java_raw *v8;
  size_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  ffi_java_raw_size(a1);
  v8 = (ffi_java_raw *)((char *)v11 - ((MEMORY[0x24BDAC7A8]() + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v8, v9);
  ffi_java_ptrarray_to_raw(a1, a3, v8);
  return (*(uint64_t (**)(ffi_cif *, uint64_t, ffi_java_raw *, _QWORD))(a4 + 40))(a1, a2, v8, *(_QWORD *)(a4 + 48));
}

ffi_status ffi_prep_java_raw_closure(ffi_java_raw_closure *a1, ffi_cif *cif, void (__cdecl *fun)(ffi_cif *, void *, ffi_java_raw *, void *), void *user_data)
{
  ffi_status result;

  result = ffi_prep_closure_loc((ffi_closure *)a1, cif, (void (__cdecl *)(ffi_cif *, void *, void **, void *))ffi_java_translate_args, a1, a1);
  if (result == FFI_OK)
  {
    a1->fun = fun;
    a1->user_data = user_data;
  }
  return result;
}

size_t ffi_raw_size(ffi_cif *cif)
{
  signed int nargs;
  size_t result;
  ffi_type **arg_types;

  nargs = cif->nargs;
  if (nargs - 1 < 0)
    return 0;
  result = 0;
  arg_types = cif->arg_types;
  do
  {
    if ((*arg_types)->type == 13)
      result += 8;
    else
      result += (((*arg_types)->size - 1) | 7) + 1;
    ++arg_types;
    --nargs;
  }
  while (nargs > 0);
  return result;
}

void ffi_raw_to_ptrarray(ffi_cif *cif, ffi_raw *raw, void **args)
{
  unsigned int nargs;
  ffi_type **arg_types;
  int type;
  void *sint;

  nargs = cif->nargs;
  if (nargs)
  {
    arg_types = cif->arg_types;
    do
    {
      type = (*arg_types)->type;
      if (type == 15 || type == 13)
      {
        sint = (void *)raw->sint;
        ++raw;
        *args = sint;
      }
      else
      {
        *args = raw;
        raw = (ffi_raw *)((char *)raw + (((*arg_types)->size - 1) | 7) + 1);
      }
      ++arg_types;
      ++args;
      --nargs;
    }
    while (nargs);
  }
}

void ffi_ptrarray_to_raw(ffi_cif *cif, void **args, ffi_raw *raw)
{
  uint64_t v6;
  ffi_type **arg_types;
  ffi_type *v8;
  ffi_sarg v9;

  if (cif->nargs)
  {
    v6 = 0;
    arg_types = cif->arg_types;
    do
    {
      v8 = arg_types[v6];
      switch(v8->type)
      {
        case 5u:
          v9 = *(unsigned __int8 *)args[v6];
          goto LABEL_13;
        case 6u:
          v9 = *(char *)args[v6];
          goto LABEL_13;
        case 7u:
          v9 = *(unsigned __int16 *)args[v6];
          goto LABEL_13;
        case 8u:
          v9 = *(__int16 *)args[v6];
          goto LABEL_13;
        case 9u:
          v9 = *(unsigned int *)args[v6];
          goto LABEL_13;
        case 0xAu:
          v9 = *(int *)args[v6];
          goto LABEL_13;
        case 0xDu:
        case 0xFu:
          v9 = (ffi_sarg)args[v6];
          goto LABEL_13;
        case 0xEu:
          v9 = *(_QWORD *)args[v6];
LABEL_13:
          raw->sint = v9;
          ++raw;
          break;
        default:
          memcpy(raw, args[v6], v8->size);
          raw = (ffi_raw *)((char *)raw + ((arg_types[v6]->size - 1) | 7) + 1);
          break;
      }
      ++v6;
    }
    while (v6 < cif->nargs);
  }
}

void ffi_raw_call(ffi_cif *cif, void (*fn)(void), void *rvalue, ffi_raw *avalue)
{
  size_t v8;
  char *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)v10 - ((v8 + 15) & 0xFFFFFFFF0);
  bzero(v9, v8);
  ffi_raw_to_ptrarray(cif, avalue, (void **)v9);
  ffi_call(cif, fn, rvalue, (void **)v9);
}

ffi_status ffi_prep_raw_closure_loc(ffi_raw_closure *a1, ffi_cif *cif, void (__cdecl *fun)(ffi_cif *, void *, ffi_raw *, void *), void *user_data, void *codeloc)
{
  ffi_status result;

  result = ffi_prep_closure_loc((ffi_closure *)a1, cif, (void (__cdecl *)(ffi_cif *, void *, void **, void *))ffi_translate_args, codeloc, codeloc);
  if (result == FFI_OK)
  {
    a1->fun = fun;
    a1->user_data = user_data;
  }
  return result;
}

uint64_t ffi_translate_args(ffi_cif *a1, uint64_t a2, void **a3, uint64_t a4)
{
  ffi_raw *v8;
  size_t v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  ffi_raw_size(a1);
  v8 = (ffi_raw *)((char *)v11 - ((MEMORY[0x24BDAC7A8]() + 15) & 0xFFFFFFFFFFFFFFF0));
  bzero(v8, v9);
  ffi_ptrarray_to_raw(a1, a3, v8);
  return (*(uint64_t (**)(ffi_cif *, uint64_t, ffi_raw *, _QWORD))(a4 + 40))(a1, a2, v8, *(_QWORD *)(a4 + 48));
}

ffi_status ffi_prep_raw_closure(ffi_raw_closure *a1, ffi_cif *cif, void (__cdecl *fun)(ffi_cif *, void *, ffi_raw *, void *), void *user_data)
{
  ffi_status result;

  result = ffi_prep_closure_loc((ffi_closure *)a1, cif, (void (__cdecl *)(ffi_cif *, void *, void **, void *))ffi_translate_args, a1, a1);
  if (result == FFI_OK)
  {
    a1->fun = fun;
    a1->user_data = user_data;
  }
  return result;
}

uint64_t ffi_prep_cif_core(uint64_t a1, int a2, int a3, int a4, int a5, uint64_t a6, uint64_t **a7)
{
  uint64_t **v7;
  int v11;
  int i;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  int v16;

  if ((a2 - 1) > 1)
    return 2;
  v7 = a7;
  *(_DWORD *)a1 = a2;
  *(_DWORD *)(a1 + 4) = a5;
  *(_QWORD *)(a1 + 8) = a7;
  *(_QWORD *)(a1 + 16) = a6;
  *(_DWORD *)(a1 + 28) = 0;
  if (*(_QWORD *)a6)
  {
    v11 = a5;
  }
  else
  {
    if (initialize_aggregate(a6, 0))
      return 1;
    v7 = *(uint64_t ***)(a1 + 8);
    a6 = *(_QWORD *)(a1 + 16);
    v11 = *(_DWORD *)(a1 + 4);
  }
  for (i = 8 * (*(_WORD *)(a6 + 10) == 13); v11; --v11)
  {
    v13 = *v7;
    v14 = **v7;
    if (!v14)
    {
      if (initialize_aggregate((uint64_t)v13, 0))
        return 1;
      v13 = *v7;
      v14 = **v7;
    }
    v15 = *((unsigned __int16 *)v13 + 4) - 1;
    if ((v15 & i) != 0)
      v16 = (v15 | (i - 1)) + 1;
    else
      v16 = i;
    i = ((v14 - 1) | 7) + v16 + 1;
    ++v7;
  }
  *(_DWORD *)(a1 + 24) = i;
  if (a3)
    return ffi_prep_cif_machdep_var(a1, a4);
  else
    return ffi_prep_cif_machdep(a1);
}

BOOL initialize_aggregate(uint64_t a1, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!a1)
    return 1;
  v3 = *(uint64_t **)(a1 + 16);
  if (!v3)
    return 1;
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 0;
  v4 = *v3;
  if (*v3)
  {
    v6 = 0;
    v7 = v3 + 1;
    do
    {
      if (!*(_QWORD *)v4)
      {
        if (initialize_aggregate())
          return 1;
        v6 = *(_QWORD *)a1;
        v4 = *(v7 - 1);
      }
      v8 = *(unsigned __int16 *)(v4 + 8);
      v9 = ((v8 - 1) | (v6 - 1)) + 1;
      *(_QWORD *)a1 = v9;
      if (a2)
      {
        *a2++ = v9;
        v9 = *(_QWORD *)a1;
      }
      v6 = v9 + *(_QWORD *)v4;
      *(_QWORD *)a1 = v6;
      if (*(unsigned __int16 *)(a1 + 8) <= v8)
        v8 = v8;
      else
        v8 = *(unsigned __int16 *)(a1 + 8);
      *(_WORD *)(a1 + 8) = v8;
      v10 = *v7++;
      v4 = v10;
    }
    while (v10);
    v11 = ((v8 - 1) | (v6 - 1)) + 1;
  }
  else
  {
    v11 = 0;
  }
  *(_QWORD *)a1 = v11;
  return v11 == 0;
}

ffi_status ffi_prep_cif (ffi_cif *cif, ffi_abi abi, unsigned int nargs, ffi_type *rtype, ffi_type **atypes)
{
  return ffi_prep_cif_core((uint64_t)cif, abi, 0, nargs, nargs, (uint64_t)rtype, (uint64_t **)atypes);
}

ffi_status ffi_prep_cif_var(ffi_cif *cif, ffi_abi abi, unsigned int nfixedargs, unsigned int ntotalargs, ffi_type *rtype, ffi_type **atypes)
{
  ffi_status result;
  ffi_type **v9;
  uint64_t v10;
  ffi_type *v11;

  result = ffi_prep_cif_core((uint64_t)cif, abi, 1, nfixedargs, ntotalargs, (uint64_t)rtype, (uint64_t **)atypes);
  if (result == FFI_OK)
  {
    if (ntotalargs < 2)
    {
      return 0;
    }
    else
    {
      v9 = atypes + 1;
      v10 = ntotalargs - 1;
      while (1)
      {
        v11 = *v9;
        if (*v9 == &ffi_type_float || (v11->type | 2) != 0xF && v11->size < 4)
          break;
        ++v9;
        if (!--v10)
          return 0;
      }
      return 3;
    }
  }
  return result;
}

ffi_status ffi_get_struct_offsets(ffi_abi abi, ffi_type *struct_type, size_t *offsets)
{
  if (abi - 1 > 1)
    return 2;
  if (struct_type->type == 13)
    return initialize_aggregate((uint64_t)struct_type, (uint64_t *)offsets);
  return 1;
}

uint64_t ffi_call_SYSV(uint64_t a1, _QWORD *a2, uint64_t (*a3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  _QWORD v10[24];

  *a2 = v5;
  a2[1] = v6;
  a2[4] = v10;
  a2[2] = a4;
  a2[3] = a5;
  v8 = a3(v10[16], v10[17], v10[18], v10[19], v10[20], v10[21], v10[22], v10[23]);
  return ((uint64_t (*)(uint64_t))((char *)sub_2291F8070 + 8 * (a2[3] & 0x1FLL)))(v8);
}

void ffi_closure_SYSV_V()
{
  JUMPOUT(0x2291F81A4);
}

void ffi_closure_SYSV(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>, char a10)
{
  uint64_t v10;
  char *v11;
  _BYTE v12[128];
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE v21[64];

  v13 = a1;
  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v11 = (char *)sub_2291F81F0
      + 8
      * (ffi_closure_SYSV_inner(*(_QWORD *)(v10 + 16), *(void (**)(uint64_t, uint64_t, char *, uint64_t))(v10 + 24), *(_QWORD *)(v10 + 32), (uint64_t)v12, (uint64_t)&a10, (uint64_t)v21, a9) & 0x1F);
  __asm { BR              X1 }
}

void ffi_closure_trampoline_table_page()
{
  __asm { BR              X16 }
}

void sub_2291FC010()
{
  __asm { BR              X16 }
}

void sub_2291FC020()
{
  __asm { BR              X16 }
}

void sub_2291FC030()
{
  __asm { BR              X16 }
}

void sub_2291FC040()
{
  __asm { BR              X16 }
}

void sub_2291FC050()
{
  __asm { BR              X16 }
}

void sub_2291FC060()
{
  __asm { BR              X16 }
}

void sub_2291FC070()
{
  __asm { BR              X16 }
}

void sub_2291FC080()
{
  __asm { BR              X16 }
}

void sub_2291FC090()
{
  __asm { BR              X16 }
}

void sub_2291FC0A0()
{
  __asm { BR              X16 }
}

void sub_2291FC0B0()
{
  __asm { BR              X16 }
}

void sub_2291FC0C0()
{
  __asm { BR              X16 }
}

void sub_2291FC0D0()
{
  __asm { BR              X16 }
}

void sub_2291FC0E0()
{
  __asm { BR              X16 }
}

void sub_2291FC0F0()
{
  __asm { BR              X16 }
}

void sub_2291FC100()
{
  __asm { BR              X16 }
}

void sub_2291FC110()
{
  __asm { BR              X16 }
}

void sub_2291FC120()
{
  __asm { BR              X16 }
}

void sub_2291FC130()
{
  __asm { BR              X16 }
}

void sub_2291FC140()
{
  __asm { BR              X16 }
}

void sub_2291FC150()
{
  __asm { BR              X16 }
}

void sub_2291FC160()
{
  __asm { BR              X16 }
}

void sub_2291FC170()
{
  JUMPOUT(0xD503201FD503201ELL);
}

void sub_2291FC180()
{
  __asm { BR              X16 }
}

void sub_2291FC190()
{
  JUMPOUT(0xD503201FD503201ELL);
}

void sub_2291FC1A0()
{
  __asm { BR              X16 }
}

void sub_2291FC1B0()
{
  __asm { BR              X16 }
}

void sub_2291FC1C0()
{
  __asm { BR              X16 }
}

void sub_2291FC1D0()
{
  __asm { BR              X16 }
}

void sub_2291FC1E0()
{
  JUMPOUT(0xD503201FD503201ELL);
}

void sub_2291FC1F0()
{
  __asm { BR              X16 }
}

void sub_2291FC200()
{
  __asm { BR              X16 }
}

void sub_2291FC210()
{
  __asm { BR              X16 }
}

void sub_2291FC220()
{
  __asm { BR              X16 }
}

void sub_2291FC230()
{
  __asm { BR              X16 }
}

void sub_2291FC240()
{
  __asm { BR              X16 }
}

void sub_2291FC250()
{
  __asm { BR              X16 }
}

void sub_2291FC260()
{
  __asm { BR              X16 }
}

void sub_2291FC270()
{
  __asm { BR              X16 }
}

void sub_2291FC280()
{
  __asm { BR              X16 }
}

void sub_2291FC290()
{
  __asm { BR              X16 }
}

void sub_2291FC2A0()
{
  __asm { BR              X16 }
}

void sub_2291FC2B0()
{
  __asm { BR              X16 }
}

void sub_2291FC2C0()
{
  __asm { BR              X16 }
}

void sub_2291FC2D0()
{
  __asm { BR              X16 }
}

void sub_2291FC2E0()
{
  __asm { BR              X16 }
}

void sub_2291FC2F0()
{
  __asm { BR              X16 }
}

void sub_2291FC300()
{
  __asm { BR              X16 }
}

void sub_2291FC310()
{
  __asm { BR              X16 }
}

void sub_2291FC320()
{
  __asm { BR              X16 }
}

void sub_2291FC330()
{
  __asm { BR              X16 }
}

void sub_2291FC340()
{
  __asm { BR              X16 }
}

void sub_2291FC350()
{
  __asm { BR              X16 }
}

void sub_2291FC360()
{
  __asm { BR              X16 }
}

void sub_2291FC370()
{
  __asm { BR              X16 }
}

void sub_2291FC380()
{
  __asm { BR              X16 }
}

void sub_2291FC390()
{
  __asm { BR              X16 }
}

void sub_2291FC3A0()
{
  __asm { BR              X16 }
}

void sub_2291FC3B0()
{
  __asm { BR              X16 }
}

void sub_2291FC3C0()
{
  __asm { BR              X16 }
}

void sub_2291FC3D0()
{
  __asm { BR              X16 }
}

void sub_2291FC3E0()
{
  __asm { BR              X16 }
}

void sub_2291FC3F0()
{
  __asm { BR              X16 }
}

void sub_2291FC400()
{
  __asm { BR              X16 }
}

void sub_2291FC410()
{
  __asm { BR              X16 }
}

void sub_2291FC420()
{
  __asm { BR              X16 }
}

void sub_2291FC430()
{
  __asm { BR              X16 }
}

void sub_2291FC440()
{
  __asm { BR              X16 }
}

void sub_2291FC450()
{
  __asm { BR              X16 }
}

void sub_2291FC460()
{
  __asm { BR              X16 }
}

void sub_2291FC470()
{
  __asm { BR              X16 }
}

void sub_2291FC480()
{
  __asm { BR              X16 }
}

void sub_2291FC490()
{
  __asm { BR              X16 }
}

void sub_2291FC4A0()
{
  __asm { BR              X16 }
}

void sub_2291FC4B0()
{
  __asm { BR              X16 }
}

void sub_2291FC4C0()
{
  __asm { BR              X16 }
}

void sub_2291FC4D0()
{
  __asm { BR              X16 }
}

void sub_2291FC4E0()
{
  __asm { BR              X16 }
}

void sub_2291FC4F0()
{
  __asm { BR              X16 }
}

void sub_2291FC500()
{
  __asm { BR              X16 }
}

void sub_2291FC510()
{
  __asm { BR              X16 }
}

void sub_2291FC520()
{
  __asm { BR              X16 }
}

void sub_2291FC530()
{
  __asm { BR              X16 }
}

void sub_2291FC540()
{
  __asm { BR              X16 }
}

void sub_2291FC550()
{
  __asm { BR              X16 }
}

void sub_2291FC560()
{
  __asm { BR              X16 }
}

void sub_2291FC570()
{
  __asm { BR              X16 }
}

void sub_2291FC580()
{
  __asm { BR              X16 }
}

void sub_2291FC590()
{
  __asm { BR              X16 }
}

void sub_2291FC5A0()
{
  __asm { BR              X16 }
}

void sub_2291FC5B0()
{
  __asm { BR              X16 }
}

void sub_2291FC5C0()
{
  __asm { BR              X16 }
}

void sub_2291FC5D0()
{
  __asm { BR              X16 }
}

void sub_2291FC5E0()
{
  __asm { BR              X16 }
}

void sub_2291FC5F0()
{
  __asm { BR              X16 }
}

void sub_2291FC600()
{
  __asm { BR              X16 }
}

void sub_2291FC610()
{
  __asm { BR              X16 }
}

void sub_2291FC620()
{
  __asm { BR              X16 }
}

void sub_2291FC630()
{
  __asm { BR              X16 }
}

void sub_2291FC640()
{
  __asm { BR              X16 }
}

void sub_2291FC650()
{
  __asm { BR              X16 }
}

void sub_2291FC660()
{
  __asm { BR              X16 }
}

void sub_2291FC670()
{
  __asm { BR              X16 }
}

void sub_2291FC680()
{
  __asm { BR              X16 }
}

void sub_2291FC690()
{
  __asm { BR              X16 }
}

void sub_2291FC6A0()
{
  __asm { BR              X16 }
}

void sub_2291FC6B0()
{
  __asm { BR              X16 }
}

void sub_2291FC6C0()
{
  __asm { BR              X16 }
}

void sub_2291FC6D0()
{
  __asm { BR              X16 }
}

void sub_2291FC6E0()
{
  __asm { BR              X16 }
}

void sub_2291FC6F0()
{
  __asm { BR              X16 }
}

void sub_2291FC700()
{
  __asm { BR              X16 }
}

void sub_2291FC710()
{
  __asm { BR              X16 }
}

void sub_2291FC720()
{
  __asm { BR              X16 }
}

void sub_2291FC730()
{
  __asm { BR              X16 }
}

void sub_2291FC740()
{
  __asm { BR              X16 }
}

void sub_2291FC750()
{
  __asm { BR              X16 }
}

void sub_2291FC760()
{
  __asm { BR              X16 }
}

void sub_2291FC770()
{
  __asm { BR              X16 }
}

void sub_2291FC780()
{
  __asm { BR              X16 }
}

void sub_2291FC790()
{
  __asm { BR              X16 }
}

void sub_2291FC7A0()
{
  __asm { BR              X16 }
}

void sub_2291FC7B0()
{
  __asm { BR              X16 }
}

void sub_2291FC7C0()
{
  __asm { BR              X16 }
}

void sub_2291FC7D0()
{
  __asm { BR              X16 }
}

void sub_2291FC7E0()
{
  __asm { BR              X16 }
}

void sub_2291FC7F0()
{
  __asm { BR              X16 }
}

void sub_2291FC800()
{
  __asm { BR              X16 }
}

void sub_2291FC810()
{
  __asm { BR              X16 }
}

void sub_2291FC820()
{
  __asm { BR              X16 }
}

void sub_2291FC830()
{
  __asm { BR              X16 }
}

void sub_2291FC840()
{
  __asm { BR              X16 }
}

void sub_2291FC850()
{
  __asm { BR              X16 }
}

void sub_2291FC860()
{
  __asm { BR              X16 }
}

void sub_2291FC870()
{
  __asm { BR              X16 }
}

void sub_2291FC880()
{
  __asm { BR              X16 }
}

void sub_2291FC890()
{
  __asm { BR              X16 }
}

void sub_2291FC8A0()
{
  __asm { BR              X16 }
}

void sub_2291FC8B0()
{
  __asm { BR              X16 }
}

void sub_2291FC8C0()
{
  __asm { BR              X16 }
}

void sub_2291FC8D0()
{
  __asm { BR              X16 }
}

void sub_2291FC8E0()
{
  __asm { BR              X16 }
}

void sub_2291FC8F0()
{
  __asm { BR              X16 }
}

void sub_2291FC900()
{
  __asm { BR              X16 }
}

void sub_2291FC910()
{
  __asm { BR              X16 }
}

void sub_2291FC920()
{
  __asm { BR              X16 }
}

void sub_2291FC930()
{
  __asm { BR              X16 }
}

void sub_2291FC940()
{
  __asm { BR              X16 }
}

void sub_2291FC950()
{
  __asm { BR              X16 }
}

void sub_2291FC960()
{
  __asm { BR              X16 }
}

void sub_2291FC970()
{
  __asm { BR              X16 }
}

void sub_2291FC980()
{
  __asm { BR              X16 }
}

void sub_2291FC990()
{
  __asm { BR              X16 }
}

void sub_2291FC9A0()
{
  __asm { BR              X16 }
}

void sub_2291FC9B0()
{
  __asm { BR              X16 }
}

void sub_2291FC9C0()
{
  __asm { BR              X16 }
}

void sub_2291FC9D0()
{
  __asm { BR              X16 }
}

void sub_2291FC9E0()
{
  __asm { BR              X16 }
}

void sub_2291FC9F0()
{
  __asm { BR              X16 }
}

void sub_2291FCA00()
{
  __asm { BR              X16 }
}

void sub_2291FCA10()
{
  __asm { BR              X16 }
}

void sub_2291FCA20()
{
  __asm { BR              X16 }
}

void sub_2291FCA30()
{
  __asm { BR              X16 }
}

void sub_2291FCA40()
{
  __asm { BR              X16 }
}

void sub_2291FCA50()
{
  __asm { BR              X16 }
}

void sub_2291FCA60()
{
  __asm { BR              X16 }
}

void sub_2291FCA70()
{
  __asm { BR              X16 }
}

void sub_2291FCA80()
{
  __asm { BR              X16 }
}

void sub_2291FCA90()
{
  __asm { BR              X16 }
}

void sub_2291FCAA0()
{
  __asm { BR              X16 }
}

void sub_2291FCAB0()
{
  __asm { BR              X16 }
}

void sub_2291FCAC0()
{
  __asm { BR              X16 }
}

void sub_2291FCAD0()
{
  __asm { BR              X16 }
}

void sub_2291FCAE0()
{
  __asm { BR              X16 }
}

void sub_2291FCAF0()
{
  __asm { BR              X16 }
}

void sub_2291FCB00()
{
  __asm { BR              X16 }
}

void sub_2291FCB10()
{
  __asm { BR              X16 }
}

void sub_2291FCB20()
{
  __asm { BR              X16 }
}

void sub_2291FCB30()
{
  __asm { BR              X16 }
}

void sub_2291FCB40()
{
  __asm { BR              X16 }
}

void sub_2291FCB50()
{
  __asm { BR              X16 }
}

void sub_2291FCB60()
{
  __asm { BR              X16 }
}

void sub_2291FCB70()
{
  __asm { BR              X16 }
}

void sub_2291FCB80()
{
  __asm { BR              X16 }
}

void sub_2291FCB90()
{
  __asm { BR              X16 }
}

void sub_2291FCBA0()
{
  __asm { BR              X16 }
}

void sub_2291FCBB0()
{
  __asm { BR              X16 }
}

void sub_2291FCBC0()
{
  __asm { BR              X16 }
}

void sub_2291FCBD0()
{
  __asm { BR              X16 }
}

void sub_2291FCBE0()
{
  __asm { BR              X16 }
}

void sub_2291FCBF0()
{
  __asm { BR              X16 }
}

void sub_2291FCC00()
{
  __asm { BR              X16 }
}

void sub_2291FCC10()
{
  __asm { BR              X16 }
}

void sub_2291FCC20()
{
  __asm { BR              X16 }
}

void sub_2291FCC30()
{
  __asm { BR              X16 }
}

void sub_2291FCC40()
{
  __asm { BR              X16 }
}

void sub_2291FCC50()
{
  __asm { BR              X16 }
}

void sub_2291FCC60()
{
  __asm { BR              X16 }
}

void sub_2291FCC70()
{
  __asm { BR              X16 }
}

void sub_2291FCC80()
{
  __asm { BR              X16 }
}

void sub_2291FCC90()
{
  __asm { BR              X16 }
}

void sub_2291FCCA0()
{
  __asm { BR              X16 }
}

void sub_2291FCCB0()
{
  __asm { BR              X16 }
}

void sub_2291FCCC0()
{
  __asm { BR              X16 }
}

void sub_2291FCCD0()
{
  __asm { BR              X16 }
}

void sub_2291FCCE0()
{
  __asm { BR              X16 }
}

void sub_2291FCCF0()
{
  __asm { BR              X16 }
}

void sub_2291FCD00()
{
  __asm { BR              X16 }
}

void sub_2291FCD10()
{
  __asm { BR              X16 }
}

void sub_2291FCD20()
{
  __asm { BR              X16 }
}

void sub_2291FCD30()
{
  __asm { BR              X16 }
}

void sub_2291FCD40()
{
  __asm { BR              X16 }
}

void sub_2291FCD50()
{
  __asm { BR              X16 }
}

void sub_2291FCD60()
{
  __asm { BR              X16 }
}

void sub_2291FCD70()
{
  __asm { BR              X16 }
}

void sub_2291FCD80()
{
  __asm { BR              X16 }
}

void sub_2291FCD90()
{
  __asm { BR              X16 }
}

void sub_2291FCDA0()
{
  __asm { BR              X16 }
}

void sub_2291FCDB0()
{
  __asm { BR              X16 }
}

void sub_2291FCDC0()
{
  __asm { BR              X16 }
}

void sub_2291FCDD0()
{
  __asm { BR              X16 }
}

void sub_2291FCDE0()
{
  __asm { BR              X16 }
}

void sub_2291FCDF0()
{
  __asm { BR              X16 }
}

void sub_2291FCE00()
{
  __asm { BR              X16 }
}

void sub_2291FCE10()
{
  __asm { BR              X16 }
}

void sub_2291FCE20()
{
  __asm { BR              X16 }
}

void sub_2291FCE30()
{
  __asm { BR              X16 }
}

void sub_2291FCE40()
{
  __asm { BR              X16 }
}

void sub_2291FCE50()
{
  __asm { BR              X16 }
}

void sub_2291FCE60()
{
  __asm { BR              X16 }
}

void sub_2291FCE70()
{
  __asm { BR              X16 }
}

void sub_2291FCE80()
{
  __asm { BR              X16 }
}

void sub_2291FCE90()
{
  __asm { BR              X16 }
}

void sub_2291FCEA0()
{
  __asm { BR              X16 }
}

void sub_2291FCEB0()
{
  __asm { BR              X16 }
}

void sub_2291FCEC0()
{
  __asm { BR              X16 }
}

void sub_2291FCED0()
{
  __asm { BR              X16 }
}

void sub_2291FCEE0()
{
  __asm { BR              X16 }
}

void sub_2291FCEF0()
{
  __asm { BR              X16 }
}

void sub_2291FCF00()
{
  __asm { BR              X16 }
}

void sub_2291FCF10()
{
  __asm { BR              X16 }
}

void sub_2291FCF20()
{
  __asm { BR              X16 }
}

void sub_2291FCF30()
{
  __asm { BR              X16 }
}

void sub_2291FCF40()
{
  __asm { BR              X16 }
}

void sub_2291FCF50()
{
  __asm { BR              X16 }
}

void sub_2291FCF60()
{
  __asm { BR              X16 }
}

void sub_2291FCF70()
{
  __asm { BR              X16 }
}

void sub_2291FCF80()
{
  __asm { BR              X16 }
}

void sub_2291FCF90()
{
  __asm { BR              X16 }
}

void sub_2291FCFA0()
{
  __asm { BR              X16 }
}

void sub_2291FCFB0()
{
  __asm { BR              X16 }
}

void sub_2291FCFC0()
{
  __asm { BR              X16 }
}

void sub_2291FCFD0()
{
  __asm { BR              X16 }
}

void sub_2291FCFE0()
{
  __asm { BR              X16 }
}

void sub_2291FCFF0()
{
  __asm { BR              X16 }
}

void sub_2291FD000()
{
  __asm { BR              X16 }
}

void sub_2291FD010()
{
  __asm { BR              X16 }
}

void sub_2291FD020()
{
  __asm { BR              X16 }
}

void sub_2291FD030()
{
  __asm { BR              X16 }
}

void sub_2291FD040()
{
  __asm { BR              X16 }
}

void sub_2291FD050()
{
  __asm { BR              X16 }
}

void sub_2291FD060()
{
  __asm { BR              X16 }
}

void sub_2291FD070()
{
  __asm { BR              X16 }
}

void sub_2291FD080()
{
  __asm { BR              X16 }
}

void sub_2291FD090()
{
  __asm { BR              X16 }
}

void sub_2291FD0A0()
{
  __asm { BR              X16 }
}

void sub_2291FD0B0()
{
  __asm { BR              X16 }
}

void sub_2291FD0C0()
{
  __asm { BR              X16 }
}

void sub_2291FD0D0()
{
  __asm { BR              X16 }
}

void sub_2291FD0E0()
{
  __asm { BR              X16 }
}

void sub_2291FD0F0()
{
  __asm { BR              X16 }
}

void sub_2291FD100()
{
  __asm { BR              X16 }
}

void sub_2291FD110()
{
  __asm { BR              X16 }
}

void sub_2291FD120()
{
  __asm { BR              X16 }
}

void sub_2291FD130()
{
  __asm { BR              X16 }
}

void sub_2291FD140()
{
  __asm { BR              X16 }
}

void sub_2291FD150()
{
  __asm { BR              X16 }
}

void sub_2291FD160()
{
  __asm { BR              X16 }
}

void sub_2291FD170()
{
  __asm { BR              X16 }
}

void sub_2291FD180()
{
  __asm { BR              X16 }
}

void sub_2291FD190()
{
  __asm { BR              X16 }
}

void sub_2291FD1A0()
{
  __asm { BR              X16 }
}

void sub_2291FD1B0()
{
  __asm { BR              X16 }
}

void sub_2291FD1C0()
{
  __asm { BR              X16 }
}

void sub_2291FD1D0()
{
  __asm { BR              X16 }
}

void sub_2291FD1E0()
{
  __asm { BR              X16 }
}

void sub_2291FD1F0()
{
  __asm { BR              X16 }
}

void sub_2291FD200()
{
  __asm { BR              X16 }
}

void sub_2291FD210()
{
  __asm { BR              X16 }
}

void sub_2291FD220()
{
  __asm { BR              X16 }
}

void sub_2291FD230()
{
  __asm { BR              X16 }
}

void sub_2291FD240()
{
  __asm { BR              X16 }
}

void sub_2291FD250()
{
  __asm { BR              X16 }
}

void sub_2291FD260()
{
  __asm { BR              X16 }
}

void sub_2291FD270()
{
  __asm { BR              X16 }
}

void sub_2291FD280()
{
  __asm { BR              X16 }
}

void sub_2291FD290()
{
  __asm { BR              X16 }
}

void sub_2291FD2A0()
{
  __asm { BR              X16 }
}

void sub_2291FD2B0()
{
  __asm { BR              X16 }
}

void sub_2291FD2C0()
{
  __asm { BR              X16 }
}

void sub_2291FD2D0()
{
  __asm { BR              X16 }
}

void sub_2291FD2E0()
{
  __asm { BR              X16 }
}

void sub_2291FD2F0()
{
  __asm { BR              X16 }
}

void sub_2291FD300()
{
  __asm { BR              X16 }
}

void sub_2291FD310()
{
  __asm { BR              X16 }
}

void sub_2291FD320()
{
  __asm { BR              X16 }
}

void sub_2291FD330()
{
  __asm { BR              X16 }
}

void sub_2291FD340()
{
  __asm { BR              X16 }
}

void sub_2291FD350()
{
  __asm { BR              X16 }
}

void sub_2291FD360()
{
  __asm { BR              X16 }
}

void sub_2291FD370()
{
  __asm { BR              X16 }
}

void sub_2291FD380()
{
  __asm { BR              X16 }
}

void sub_2291FD390()
{
  __asm { BR              X16 }
}

void sub_2291FD3A0()
{
  __asm { BR              X16 }
}

void sub_2291FD3B0()
{
  __asm { BR              X16 }
}

void sub_2291FD3C0()
{
  __asm { BR              X16 }
}

void sub_2291FD3D0()
{
  __asm { BR              X16 }
}

void sub_2291FD3E0()
{
  __asm { BR              X16 }
}

void sub_2291FD3F0()
{
  __asm { BR              X16 }
}

void sub_2291FD400()
{
  __asm { BR              X16 }
}

void sub_2291FD410()
{
  __asm { BR              X16 }
}

void sub_2291FD420()
{
  __asm { BR              X16 }
}

void sub_2291FD430()
{
  __asm { BR              X16 }
}

void sub_2291FD440()
{
  __asm { BR              X16 }
}

void sub_2291FD450()
{
  __asm { BR              X16 }
}

void sub_2291FD460()
{
  __asm { BR              X16 }
}

void sub_2291FD470()
{
  __asm { BR              X16 }
}

void sub_2291FD480()
{
  __asm { BR              X16 }
}

void sub_2291FD490()
{
  __asm { BR              X16 }
}

void sub_2291FD4A0()
{
  __asm { BR              X16 }
}

void sub_2291FD4B0()
{
  __asm { BR              X16 }
}

void sub_2291FD4C0()
{
  __asm { BR              X16 }
}

void sub_2291FD4D0()
{
  __asm { BR              X16 }
}

void sub_2291FD4E0()
{
  __asm { BR              X16 }
}

void sub_2291FD4F0()
{
  __asm { BR              X16 }
}

void sub_2291FD500()
{
  __asm { BR              X16 }
}

void sub_2291FD510()
{
  __asm { BR              X16 }
}

void sub_2291FD520()
{
  __asm { BR              X16 }
}

void sub_2291FD530()
{
  __asm { BR              X16 }
}

void sub_2291FD540()
{
  __asm { BR              X16 }
}

void sub_2291FD550()
{
  __asm { BR              X16 }
}

void sub_2291FD560()
{
  __asm { BR              X16 }
}

void sub_2291FD570()
{
  __asm { BR              X16 }
}

void sub_2291FD580()
{
  __asm { BR              X16 }
}

void sub_2291FD590()
{
  __asm { BR              X16 }
}

void sub_2291FD5A0()
{
  __asm { BR              X16 }
}

void sub_2291FD5B0()
{
  __asm { BR              X16 }
}

void sub_2291FD5C0()
{
  __asm { BR              X16 }
}

void sub_2291FD5D0()
{
  __asm { BR              X16 }
}

void sub_2291FD5E0()
{
  __asm { BR              X16 }
}

void sub_2291FD5F0()
{
  __asm { BR              X16 }
}

void sub_2291FD600()
{
  __asm { BR              X16 }
}

void sub_2291FD610()
{
  __asm { BR              X16 }
}

void sub_2291FD620()
{
  __asm { BR              X16 }
}

void sub_2291FD630()
{
  __asm { BR              X16 }
}

void sub_2291FD640()
{
  __asm { BR              X16 }
}

void sub_2291FD650()
{
  __asm { BR              X16 }
}

void sub_2291FD660()
{
  __asm { BR              X16 }
}

void sub_2291FD670()
{
  __asm { BR              X16 }
}

void sub_2291FD680()
{
  __asm { BR              X16 }
}

void sub_2291FD690()
{
  __asm { BR              X16 }
}

void sub_2291FD6A0()
{
  __asm { BR              X16 }
}

void sub_2291FD6B0()
{
  __asm { BR              X16 }
}

void sub_2291FD6C0()
{
  __asm { BR              X16 }
}

void sub_2291FD6D0()
{
  __asm { BR              X16 }
}

void sub_2291FD6E0()
{
  __asm { BR              X16 }
}

void sub_2291FD6F0()
{
  __asm { BR              X16 }
}

void sub_2291FD700()
{
  __asm { BR              X16 }
}

void sub_2291FD710()
{
  __asm { BR              X16 }
}

void sub_2291FD720()
{
  __asm { BR              X16 }
}

void sub_2291FD730()
{
  __asm { BR              X16 }
}

void sub_2291FD740()
{
  __asm { BR              X16 }
}

void sub_2291FD750()
{
  __asm { BR              X16 }
}

void sub_2291FD760()
{
  __asm { BR              X16 }
}

void sub_2291FD770()
{
  __asm { BR              X16 }
}

void sub_2291FD780()
{
  __asm { BR              X16 }
}

void sub_2291FD790()
{
  __asm { BR              X16 }
}

void sub_2291FD7A0()
{
  __asm { BR              X16 }
}

void sub_2291FD7B0()
{
  __asm { BR              X16 }
}

void sub_2291FD7C0()
{
  __asm { BR              X16 }
}

void sub_2291FD7D0()
{
  __asm { BR              X16 }
}

void sub_2291FD7E0()
{
  __asm { BR              X16 }
}

void sub_2291FD7F0()
{
  __asm { BR              X16 }
}

void sub_2291FD800()
{
  __asm { BR              X16 }
}

void sub_2291FD810()
{
  __asm { BR              X16 }
}

void sub_2291FD820()
{
  __asm { BR              X16 }
}

void sub_2291FD830()
{
  __asm { BR              X16 }
}

void sub_2291FD840()
{
  __asm { BR              X16 }
}

void sub_2291FD850()
{
  __asm { BR              X16 }
}

void sub_2291FD860()
{
  __asm { BR              X16 }
}

void sub_2291FD870()
{
  __asm { BR              X16 }
}

void sub_2291FD880()
{
  __asm { BR              X16 }
}

void sub_2291FD890()
{
  __asm { BR              X16 }
}

void sub_2291FD8A0()
{
  __asm { BR              X16 }
}

void sub_2291FD8B0()
{
  __asm { BR              X16 }
}

void sub_2291FD8C0()
{
  __asm { BR              X16 }
}

void sub_2291FD8D0()
{
  __asm { BR              X16 }
}

void sub_2291FD8E0()
{
  __asm { BR              X16 }
}

void sub_2291FD8F0()
{
  __asm { BR              X16 }
}

void sub_2291FD900()
{
  __asm { BR              X16 }
}

void sub_2291FD910()
{
  __asm { BR              X16 }
}

void sub_2291FD920()
{
  __asm { BR              X16 }
}

void sub_2291FD930()
{
  __asm { BR              X16 }
}

void sub_2291FD940()
{
  __asm { BR              X16 }
}

void sub_2291FD950()
{
  __asm { BR              X16 }
}

void sub_2291FD960()
{
  __asm { BR              X16 }
}

void sub_2291FD970()
{
  __asm { BR              X16 }
}

void sub_2291FD980()
{
  __asm { BR              X16 }
}

void sub_2291FD990()
{
  __asm { BR              X16 }
}

void sub_2291FD9A0()
{
  __asm { BR              X16 }
}

void sub_2291FD9B0()
{
  __asm { BR              X16 }
}

void sub_2291FD9C0()
{
  __asm { BR              X16 }
}

void sub_2291FD9D0()
{
  __asm { BR              X16 }
}

void sub_2291FD9E0()
{
  __asm { BR              X16 }
}

void sub_2291FD9F0()
{
  __asm { BR              X16 }
}

void sub_2291FDA00()
{
  __asm { BR              X16 }
}

void sub_2291FDA10()
{
  __asm { BR              X16 }
}

void sub_2291FDA20()
{
  __asm { BR              X16 }
}

void sub_2291FDA30()
{
  __asm { BR              X16 }
}

void sub_2291FDA40()
{
  __asm { BR              X16 }
}

void sub_2291FDA50()
{
  __asm { BR              X16 }
}

void sub_2291FDA60()
{
  __asm { BR              X16 }
}

void sub_2291FDA70()
{
  __asm { BR              X16 }
}

void sub_2291FDA80()
{
  __asm { BR              X16 }
}

void sub_2291FDA90()
{
  __asm { BR              X16 }
}

void sub_2291FDAA0()
{
  __asm { BR              X16 }
}

void sub_2291FDAB0()
{
  __asm { BR              X16 }
}

void sub_2291FDAC0()
{
  __asm { BR              X16 }
}

void sub_2291FDAD0()
{
  __asm { BR              X16 }
}

void sub_2291FDAE0()
{
  __asm { BR              X16 }
}

void sub_2291FDAF0()
{
  __asm { BR              X16 }
}

void sub_2291FDB00()
{
  __asm { BR              X16 }
}

void sub_2291FDB10()
{
  __asm { BR              X16 }
}

void sub_2291FDB20()
{
  __asm { BR              X16 }
}

void sub_2291FDB30()
{
  __asm { BR              X16 }
}

void sub_2291FDB40()
{
  __asm { BR              X16 }
}

void sub_2291FDB50()
{
  __asm { BR              X16 }
}

void sub_2291FDB60()
{
  __asm { BR              X16 }
}

void sub_2291FDB70()
{
  __asm { BR              X16 }
}

void sub_2291FDB80()
{
  __asm { BR              X16 }
}

void sub_2291FDB90()
{
  __asm { BR              X16 }
}

void sub_2291FDBA0()
{
  __asm { BR              X16 }
}

void sub_2291FDBB0()
{
  __asm { BR              X16 }
}

void sub_2291FDBC0()
{
  __asm { BR              X16 }
}

void sub_2291FDBD0()
{
  __asm { BR              X16 }
}

void sub_2291FDBE0()
{
  __asm { BR              X16 }
}

void sub_2291FDBF0()
{
  __asm { BR              X16 }
}

void sub_2291FDC00()
{
  __asm { BR              X16 }
}

void sub_2291FDC10()
{
  __asm { BR              X16 }
}

void sub_2291FDC20()
{
  __asm { BR              X16 }
}

void sub_2291FDC30()
{
  __asm { BR              X16 }
}

void sub_2291FDC40()
{
  __asm { BR              X16 }
}

void sub_2291FDC50()
{
  __asm { BR              X16 }
}

void sub_2291FDC60()
{
  __asm { BR              X16 }
}

void sub_2291FDC70()
{
  __asm { BR              X16 }
}

void sub_2291FDC80()
{
  __asm { BR              X16 }
}

void sub_2291FDC90()
{
  __asm { BR              X16 }
}

void sub_2291FDCA0()
{
  __asm { BR              X16 }
}

void sub_2291FDCB0()
{
  __asm { BR              X16 }
}

void sub_2291FDCC0()
{
  __asm { BR              X16 }
}

void sub_2291FDCD0()
{
  __asm { BR              X16 }
}

void sub_2291FDCE0()
{
  __asm { BR              X16 }
}

void sub_2291FDCF0()
{
  __asm { BR              X16 }
}

void sub_2291FDD00()
{
  __asm { BR              X16 }
}

void sub_2291FDD10()
{
  __asm { BR              X16 }
}

void sub_2291FDD20()
{
  __asm { BR              X16 }
}

void sub_2291FDD30()
{
  __asm { BR              X16 }
}

void sub_2291FDD40()
{
  __asm { BR              X16 }
}

void sub_2291FDD50()
{
  __asm { BR              X16 }
}

void sub_2291FDD60()
{
  __asm { BR              X16 }
}

void sub_2291FDD70()
{
  __asm { BR              X16 }
}

void sub_2291FDD80()
{
  __asm { BR              X16 }
}

void sub_2291FDD90()
{
  __asm { BR              X16 }
}

void sub_2291FDDA0()
{
  __asm { BR              X16 }
}

void sub_2291FDDB0()
{
  __asm { BR              X16 }
}

void sub_2291FDDC0()
{
  __asm { BR              X16 }
}

void sub_2291FDDD0()
{
  __asm { BR              X16 }
}

void sub_2291FDDE0()
{
  __asm { BR              X16 }
}

void sub_2291FDDF0()
{
  __asm { BR              X16 }
}

void sub_2291FDE00()
{
  __asm { BR              X16 }
}

void sub_2291FDE10()
{
  __asm { BR              X16 }
}

void sub_2291FDE20()
{
  __asm { BR              X16 }
}

void sub_2291FDE30()
{
  __asm { BR              X16 }
}

void sub_2291FDE40()
{
  __asm { BR              X16 }
}

void sub_2291FDE50()
{
  __asm { BR              X16 }
}

void sub_2291FDE60()
{
  __asm { BR              X16 }
}

void sub_2291FDE70()
{
  __asm { BR              X16 }
}

void sub_2291FDE80()
{
  __asm { BR              X16 }
}

void sub_2291FDE90()
{
  __asm { BR              X16 }
}

void sub_2291FDEA0()
{
  __asm { BR              X16 }
}

void sub_2291FDEB0()
{
  __asm { BR              X16 }
}

void sub_2291FDEC0()
{
  __asm { BR              X16 }
}

void sub_2291FDED0()
{
  __asm { BR              X16 }
}

void sub_2291FDEE0()
{
  __asm { BR              X16 }
}

void sub_2291FDEF0()
{
  __asm { BR              X16 }
}

void sub_2291FDF00()
{
  __asm { BR              X16 }
}

void sub_2291FDF10()
{
  __asm { BR              X16 }
}

void sub_2291FDF20()
{
  __asm { BR              X16 }
}

void sub_2291FDF30()
{
  __asm { BR              X16 }
}

void sub_2291FDF40()
{
  __asm { BR              X16 }
}

void sub_2291FDF50()
{
  __asm { BR              X16 }
}

void sub_2291FDF60()
{
  __asm { BR              X16 }
}

void sub_2291FDF70()
{
  __asm { BR              X16 }
}

void sub_2291FDF80()
{
  __asm { BR              X16 }
}

void sub_2291FDF90()
{
  __asm { BR              X16 }
}

void sub_2291FDFA0()
{
  __asm { BR              X16 }
}

void sub_2291FDFB0()
{
  __asm { BR              X16 }
}

void sub_2291FDFC0()
{
  __asm { BR              X16 }
}

void sub_2291FDFD0()
{
  __asm { BR              X16 }
}

void sub_2291FDFE0()
{
  __asm { BR              X16 }
}

void sub_2291FDFF0()
{
  __asm { BR              X16 }
}

void sub_2291FE000()
{
  __asm { BR              X16 }
}

void sub_2291FE010()
{
  __asm { BR              X16 }
}

void sub_2291FE020()
{
  __asm { BR              X16 }
}

void sub_2291FE030()
{
  __asm { BR              X16 }
}

void sub_2291FE040()
{
  __asm { BR              X16 }
}

void sub_2291FE050()
{
  __asm { BR              X16 }
}

void sub_2291FE060()
{
  __asm { BR              X16 }
}

void sub_2291FE070()
{
  __asm { BR              X16 }
}

void sub_2291FE080()
{
  __asm { BR              X16 }
}

void sub_2291FE090()
{
  __asm { BR              X16 }
}

void sub_2291FE0A0()
{
  __asm { BR              X16 }
}

void sub_2291FE0B0()
{
  __asm { BR              X16 }
}

void sub_2291FE0C0()
{
  __asm { BR              X16 }
}

void sub_2291FE0D0()
{
  __asm { BR              X16 }
}

void sub_2291FE0E0()
{
  __asm { BR              X16 }
}

void sub_2291FE0F0()
{
  __asm { BR              X16 }
}

void sub_2291FE100()
{
  __asm { BR              X16 }
}

void sub_2291FE110()
{
  __asm { BR              X16 }
}

void sub_2291FE120()
{
  __asm { BR              X16 }
}

void sub_2291FE130()
{
  __asm { BR              X16 }
}

void sub_2291FE140()
{
  __asm { BR              X16 }
}

void sub_2291FE150()
{
  __asm { BR              X16 }
}

void sub_2291FE160()
{
  __asm { BR              X16 }
}

void sub_2291FE170()
{
  __asm { BR              X16 }
}

void sub_2291FE180()
{
  __asm { BR              X16 }
}

void sub_2291FE190()
{
  __asm { BR              X16 }
}

void sub_2291FE1A0()
{
  __asm { BR              X16 }
}

void sub_2291FE1B0()
{
  __asm { BR              X16 }
}

void sub_2291FE1C0()
{
  __asm { BR              X16 }
}

void sub_2291FE1D0()
{
  __asm { BR              X16 }
}

void sub_2291FE1E0()
{
  __asm { BR              X16 }
}

void sub_2291FE1F0()
{
  __asm { BR              X16 }
}

void sub_2291FE200()
{
  __asm { BR              X16 }
}

void sub_2291FE210()
{
  __asm { BR              X16 }
}

void sub_2291FE220()
{
  __asm { BR              X16 }
}

void sub_2291FE230()
{
  __asm { BR              X16 }
}

void sub_2291FE240()
{
  __asm { BR              X16 }
}

void sub_2291FE250()
{
  __asm { BR              X16 }
}

void sub_2291FE260()
{
  __asm { BR              X16 }
}

void sub_2291FE270()
{
  __asm { BR              X16 }
}

void sub_2291FE280()
{
  __asm { BR              X16 }
}

void sub_2291FE290()
{
  __asm { BR              X16 }
}

void sub_2291FE2A0()
{
  __asm { BR              X16 }
}

void sub_2291FE2B0()
{
  __asm { BR              X16 }
}

void sub_2291FE2C0()
{
  __asm { BR              X16 }
}

void sub_2291FE2D0()
{
  __asm { BR              X16 }
}

void sub_2291FE2E0()
{
  __asm { BR              X16 }
}

void sub_2291FE2F0()
{
  __asm { BR              X16 }
}

void sub_2291FE300()
{
  __asm { BR              X16 }
}

void sub_2291FE310()
{
  __asm { BR              X16 }
}

void sub_2291FE320()
{
  __asm { BR              X16 }
}

void sub_2291FE330()
{
  __asm { BR              X16 }
}

void sub_2291FE340()
{
  __asm { BR              X16 }
}

void sub_2291FE350()
{
  __asm { BR              X16 }
}

void sub_2291FE360()
{
  __asm { BR              X16 }
}

void sub_2291FE370()
{
  __asm { BR              X16 }
}

void sub_2291FE380()
{
  __asm { BR              X16 }
}

void sub_2291FE390()
{
  __asm { BR              X16 }
}

void sub_2291FE3A0()
{
  __asm { BR              X16 }
}

void sub_2291FE3B0()
{
  __asm { BR              X16 }
}

void sub_2291FE3C0()
{
  __asm { BR              X16 }
}

void sub_2291FE3D0()
{
  __asm { BR              X16 }
}

void sub_2291FE3E0()
{
  __asm { BR              X16 }
}

void sub_2291FE3F0()
{
  __asm { BR              X16 }
}

void sub_2291FE400()
{
  __asm { BR              X16 }
}

void sub_2291FE410()
{
  __asm { BR              X16 }
}

void sub_2291FE420()
{
  __asm { BR              X16 }
}

void sub_2291FE430()
{
  __asm { BR              X16 }
}

void sub_2291FE440()
{
  __asm { BR              X16 }
}

void sub_2291FE450()
{
  __asm { BR              X16 }
}

void sub_2291FE460()
{
  __asm { BR              X16 }
}

void sub_2291FE470()
{
  __asm { BR              X16 }
}

void sub_2291FE480()
{
  __asm { BR              X16 }
}

void sub_2291FE490()
{
  __asm { BR              X16 }
}

void sub_2291FE4A0()
{
  __asm { BR              X16 }
}

void sub_2291FE4B0()
{
  __asm { BR              X16 }
}

void sub_2291FE4C0()
{
  __asm { BR              X16 }
}

void sub_2291FE4D0()
{
  __asm { BR              X16 }
}

void sub_2291FE4E0()
{
  __asm { BR              X16 }
}

void sub_2291FE4F0()
{
  __asm { BR              X16 }
}

void sub_2291FE500()
{
  __asm { BR              X16 }
}

void sub_2291FE510()
{
  __asm { BR              X16 }
}

void sub_2291FE520()
{
  __asm { BR              X16 }
}

void sub_2291FE530()
{
  __asm { BR              X16 }
}

void sub_2291FE540()
{
  __asm { BR              X16 }
}

void sub_2291FE550()
{
  __asm { BR              X16 }
}

void sub_2291FE560()
{
  __asm { BR              X16 }
}

void sub_2291FE570()
{
  __asm { BR              X16 }
}

void sub_2291FE580()
{
  __asm { BR              X16 }
}

void sub_2291FE590()
{
  __asm { BR              X16 }
}

void sub_2291FE5A0()
{
  __asm { BR              X16 }
}

void sub_2291FE5B0()
{
  __asm { BR              X16 }
}

void sub_2291FE5C0()
{
  __asm { BR              X16 }
}

void sub_2291FE5D0()
{
  __asm { BR              X16 }
}

void sub_2291FE5E0()
{
  __asm { BR              X16 }
}

void sub_2291FE5F0()
{
  __asm { BR              X16 }
}

void sub_2291FE600()
{
  __asm { BR              X16 }
}

void sub_2291FE610()
{
  __asm { BR              X16 }
}

void sub_2291FE620()
{
  __asm { BR              X16 }
}

void sub_2291FE630()
{
  __asm { BR              X16 }
}

void sub_2291FE640()
{
  __asm { BR              X16 }
}

void sub_2291FE650()
{
  __asm { BR              X16 }
}

void sub_2291FE660()
{
  __asm { BR              X16 }
}

void sub_2291FE670()
{
  __asm { BR              X16 }
}

void sub_2291FE680()
{
  __asm { BR              X16 }
}

void sub_2291FE690()
{
  __asm { BR              X16 }
}

void sub_2291FE6A0()
{
  __asm { BR              X16 }
}

void sub_2291FE6B0()
{
  __asm { BR              X16 }
}

void sub_2291FE6C0()
{
  __asm { BR              X16 }
}

void sub_2291FE6D0()
{
  __asm { BR              X16 }
}

void sub_2291FE6E0()
{
  __asm { BR              X16 }
}

void sub_2291FE6F0()
{
  __asm { BR              X16 }
}

void sub_2291FE700()
{
  __asm { BR              X16 }
}

void sub_2291FE710()
{
  __asm { BR              X16 }
}

void sub_2291FE720()
{
  __asm { BR              X16 }
}

void sub_2291FE730()
{
  __asm { BR              X16 }
}

void sub_2291FE740()
{
  __asm { BR              X16 }
}

void sub_2291FE750()
{
  __asm { BR              X16 }
}

void sub_2291FE760()
{
  __asm { BR              X16 }
}

void sub_2291FE770()
{
  __asm { BR              X16 }
}

void sub_2291FE780()
{
  __asm { BR              X16 }
}

void sub_2291FE790()
{
  __asm { BR              X16 }
}

void sub_2291FE7A0()
{
  __asm { BR              X16 }
}

void sub_2291FE7B0()
{
  __asm { BR              X16 }
}

void sub_2291FE7C0()
{
  __asm { BR              X16 }
}

void sub_2291FE7D0()
{
  __asm { BR              X16 }
}

void sub_2291FE7E0()
{
  __asm { BR              X16 }
}

void sub_2291FE7F0()
{
  __asm { BR              X16 }
}

void sub_2291FE800()
{
  __asm { BR              X16 }
}

void sub_2291FE810()
{
  __asm { BR              X16 }
}

void sub_2291FE820()
{
  __asm { BR              X16 }
}

void sub_2291FE830()
{
  __asm { BR              X16 }
}

void sub_2291FE840()
{
  __asm { BR              X16 }
}

void sub_2291FE850()
{
  __asm { BR              X16 }
}

void sub_2291FE860()
{
  __asm { BR              X16 }
}

void sub_2291FE870()
{
  __asm { BR              X16 }
}

void sub_2291FE880()
{
  __asm { BR              X16 }
}

void sub_2291FE890()
{
  __asm { BR              X16 }
}

void sub_2291FE8A0()
{
  __asm { BR              X16 }
}

void sub_2291FE8B0()
{
  __asm { BR              X16 }
}

void sub_2291FE8C0()
{
  __asm { BR              X16 }
}

void sub_2291FE8D0()
{
  __asm { BR              X16 }
}

void sub_2291FE8E0()
{
  __asm { BR              X16 }
}

void sub_2291FE8F0()
{
  __asm { BR              X16 }
}

void sub_2291FE900()
{
  __asm { BR              X16 }
}

void sub_2291FE910()
{
  __asm { BR              X16 }
}

void sub_2291FE920()
{
  __asm { BR              X16 }
}

void sub_2291FE930()
{
  __asm { BR              X16 }
}

void sub_2291FE940()
{
  __asm { BR              X16 }
}

void sub_2291FE950()
{
  __asm { BR              X16 }
}

void sub_2291FE960()
{
  __asm { BR              X16 }
}

void sub_2291FE970()
{
  __asm { BR              X16 }
}

void sub_2291FE980()
{
  __asm { BR              X16 }
}

void sub_2291FE990()
{
  __asm { BR              X16 }
}

void sub_2291FE9A0()
{
  __asm { BR              X16 }
}

void sub_2291FE9B0()
{
  __asm { BR              X16 }
}

void sub_2291FE9C0()
{
  __asm { BR              X16 }
}

void sub_2291FE9D0()
{
  __asm { BR              X16 }
}

void sub_2291FE9E0()
{
  __asm { BR              X16 }
}

void sub_2291FE9F0()
{
  __asm { BR              X16 }
}

void sub_2291FEA00()
{
  __asm { BR              X16 }
}

void sub_2291FEA10()
{
  __asm { BR              X16 }
}

void sub_2291FEA20()
{
  __asm { BR              X16 }
}

void sub_2291FEA30()
{
  __asm { BR              X16 }
}

void sub_2291FEA40()
{
  __asm { BR              X16 }
}

void sub_2291FEA50()
{
  __asm { BR              X16 }
}

void sub_2291FEA60()
{
  __asm { BR              X16 }
}

void sub_2291FEA70()
{
  __asm { BR              X16 }
}

void sub_2291FEA80()
{
  __asm { BR              X16 }
}

void sub_2291FEA90()
{
  __asm { BR              X16 }
}

void sub_2291FEAA0()
{
  __asm { BR              X16 }
}

void sub_2291FEAB0()
{
  __asm { BR              X16 }
}

void sub_2291FEAC0()
{
  __asm { BR              X16 }
}

void sub_2291FEAD0()
{
  __asm { BR              X16 }
}

void sub_2291FEAE0()
{
  __asm { BR              X16 }
}

void sub_2291FEAF0()
{
  __asm { BR              X16 }
}

void sub_2291FEB00()
{
  __asm { BR              X16 }
}

void sub_2291FEB10()
{
  __asm { BR              X16 }
}

void sub_2291FEB20()
{
  __asm { BR              X16 }
}

void sub_2291FEB30()
{
  __asm { BR              X16 }
}

void sub_2291FEB40()
{
  __asm { BR              X16 }
}

void sub_2291FEB50()
{
  __asm { BR              X16 }
}

void sub_2291FEB60()
{
  __asm { BR              X16 }
}

void sub_2291FEB70()
{
  __asm { BR              X16 }
}

void sub_2291FEB80()
{
  __asm { BR              X16 }
}

void sub_2291FEB90()
{
  __asm { BR              X16 }
}

void sub_2291FEBA0()
{
  __asm { BR              X16 }
}

void sub_2291FEBB0()
{
  __asm { BR              X16 }
}

void sub_2291FEBC0()
{
  __asm { BR              X16 }
}

void sub_2291FEBD0()
{
  __asm { BR              X16 }
}

void sub_2291FEBE0()
{
  __asm { BR              X16 }
}

void sub_2291FEBF0()
{
  __asm { BR              X16 }
}

void sub_2291FEC00()
{
  __asm { BR              X16 }
}

void sub_2291FEC10()
{
  __asm { BR              X16 }
}

void sub_2291FEC20()
{
  __asm { BR              X16 }
}

void sub_2291FEC30()
{
  __asm { BR              X16 }
}

void sub_2291FEC40()
{
  __asm { BR              X16 }
}

void sub_2291FEC50()
{
  __asm { BR              X16 }
}

void sub_2291FEC60()
{
  __asm { BR              X16 }
}

void sub_2291FEC70()
{
  __asm { BR              X16 }
}

void sub_2291FEC80()
{
  __asm { BR              X16 }
}

void sub_2291FEC90()
{
  __asm { BR              X16 }
}

void sub_2291FECA0()
{
  __asm { BR              X16 }
}

void sub_2291FECB0()
{
  __asm { BR              X16 }
}

void sub_2291FECC0()
{
  __asm { BR              X16 }
}

void sub_2291FECD0()
{
  __asm { BR              X16 }
}

void sub_2291FECE0()
{
  __asm { BR              X16 }
}

void sub_2291FECF0()
{
  __asm { BR              X16 }
}

void sub_2291FED00()
{
  __asm { BR              X16 }
}

void sub_2291FED10()
{
  __asm { BR              X16 }
}

void sub_2291FED20()
{
  __asm { BR              X16 }
}

void sub_2291FED30()
{
  __asm { BR              X16 }
}

void sub_2291FED40()
{
  __asm { BR              X16 }
}

void sub_2291FED50()
{
  __asm { BR              X16 }
}

void sub_2291FED60()
{
  __asm { BR              X16 }
}

void sub_2291FED70()
{
  __asm { BR              X16 }
}

void sub_2291FED80()
{
  __asm { BR              X16 }
}

void sub_2291FED90()
{
  __asm { BR              X16 }
}

void sub_2291FEDA0()
{
  __asm { BR              X16 }
}

void sub_2291FEDB0()
{
  __asm { BR              X16 }
}

void sub_2291FEDC0()
{
  __asm { BR              X16 }
}

void sub_2291FEDD0()
{
  __asm { BR              X16 }
}

void sub_2291FEDE0()
{
  __asm { BR              X16 }
}

void sub_2291FEDF0()
{
  __asm { BR              X16 }
}

void sub_2291FEE00()
{
  __asm { BR              X16 }
}

void sub_2291FEE10()
{
  __asm { BR              X16 }
}

void sub_2291FEE20()
{
  __asm { BR              X16 }
}

void sub_2291FEE30()
{
  __asm { BR              X16 }
}

void sub_2291FEE40()
{
  __asm { BR              X16 }
}

void sub_2291FEE50()
{
  __asm { BR              X16 }
}

void sub_2291FEE60()
{
  __asm { BR              X16 }
}

void sub_2291FEE70()
{
  __asm { BR              X16 }
}

void sub_2291FEE80()
{
  __asm { BR              X16 }
}

void sub_2291FEE90()
{
  __asm { BR              X16 }
}

void sub_2291FEEA0()
{
  __asm { BR              X16 }
}

void sub_2291FEEB0()
{
  __asm { BR              X16 }
}

void sub_2291FEEC0()
{
  __asm { BR              X16 }
}

void sub_2291FEED0()
{
  __asm { BR              X16 }
}

void sub_2291FEEE0()
{
  __asm { BR              X16 }
}

void sub_2291FEEF0()
{
  __asm { BR              X16 }
}

void sub_2291FEF00()
{
  __asm { BR              X16 }
}

void sub_2291FEF10()
{
  __asm { BR              X16 }
}

void sub_2291FEF20()
{
  __asm { BR              X16 }
}

void sub_2291FEF30()
{
  __asm { BR              X16 }
}

void sub_2291FEF40()
{
  __asm { BR              X16 }
}

void sub_2291FEF50()
{
  __asm { BR              X16 }
}

void sub_2291FEF60()
{
  __asm { BR              X16 }
}

void sub_2291FEF70()
{
  __asm { BR              X16 }
}

void sub_2291FEF80()
{
  __asm { BR              X16 }
}

void sub_2291FEF90()
{
  __asm { BR              X16 }
}

void sub_2291FEFA0()
{
  __asm { BR              X16 }
}

void sub_2291FEFB0()
{
  __asm { BR              X16 }
}

void sub_2291FEFC0()
{
  __asm { BR              X16 }
}

void sub_2291FEFD0()
{
  __asm { BR              X16 }
}

void sub_2291FEFE0()
{
  __asm { BR              X16 }
}

void sub_2291FEFF0()
{
  __asm { BR              X16 }
}

void sub_2291FF000()
{
  __asm { BR              X16 }
}

void sub_2291FF010()
{
  __asm { BR              X16 }
}

void sub_2291FF020()
{
  __asm { BR              X16 }
}

void sub_2291FF030()
{
  __asm { BR              X16 }
}

void sub_2291FF040()
{
  __asm { BR              X16 }
}

void sub_2291FF050()
{
  __asm { BR              X16 }
}

void sub_2291FF060()
{
  __asm { BR              X16 }
}

void sub_2291FF070()
{
  __asm { BR              X16 }
}

void sub_2291FF080()
{
  __asm { BR              X16 }
}

void sub_2291FF090()
{
  __asm { BR              X16 }
}

void sub_2291FF0A0()
{
  __asm { BR              X16 }
}

void sub_2291FF0B0()
{
  __asm { BR              X16 }
}

void sub_2291FF0C0()
{
  __asm { BR              X16 }
}

void sub_2291FF0D0()
{
  __asm { BR              X16 }
}

void sub_2291FF0E0()
{
  __asm { BR              X16 }
}

void sub_2291FF0F0()
{
  __asm { BR              X16 }
}

void sub_2291FF100()
{
  __asm { BR              X16 }
}

void sub_2291FF110()
{
  __asm { BR              X16 }
}

void sub_2291FF120()
{
  __asm { BR              X16 }
}

void sub_2291FF130()
{
  __asm { BR              X16 }
}

void sub_2291FF140()
{
  __asm { BR              X16 }
}

void sub_2291FF150()
{
  __asm { BR              X16 }
}

void sub_2291FF160()
{
  __asm { BR              X16 }
}

void sub_2291FF170()
{
  __asm { BR              X16 }
}

void sub_2291FF180()
{
  __asm { BR              X16 }
}

void sub_2291FF190()
{
  __asm { BR              X16 }
}

void sub_2291FF1A0()
{
  __asm { BR              X16 }
}

void sub_2291FF1B0()
{
  __asm { BR              X16 }
}

void sub_2291FF1C0()
{
  __asm { BR              X16 }
}

void sub_2291FF1D0()
{
  __asm { BR              X16 }
}

void sub_2291FF1E0()
{
  __asm { BR              X16 }
}

void sub_2291FF1F0()
{
  __asm { BR              X16 }
}

void sub_2291FF200()
{
  __asm { BR              X16 }
}

void sub_2291FF210()
{
  __asm { BR              X16 }
}

void sub_2291FF220()
{
  __asm { BR              X16 }
}

void sub_2291FF230()
{
  __asm { BR              X16 }
}

void sub_2291FF240()
{
  __asm { BR              X16 }
}

void sub_2291FF250()
{
  __asm { BR              X16 }
}

void sub_2291FF260()
{
  __asm { BR              X16 }
}

void sub_2291FF270()
{
  __asm { BR              X16 }
}

void sub_2291FF280()
{
  __asm { BR              X16 }
}

void sub_2291FF290()
{
  __asm { BR              X16 }
}

void sub_2291FF2A0()
{
  __asm { BR              X16 }
}

void sub_2291FF2B0()
{
  __asm { BR              X16 }
}

void sub_2291FF2C0()
{
  __asm { BR              X16 }
}

void sub_2291FF2D0()
{
  __asm { BR              X16 }
}

void sub_2291FF2E0()
{
  __asm { BR              X16 }
}

void sub_2291FF2F0()
{
  __asm { BR              X16 }
}

void sub_2291FF300()
{
  __asm { BR              X16 }
}

void sub_2291FF310()
{
  __asm { BR              X16 }
}

void sub_2291FF320()
{
  __asm { BR              X16 }
}

void sub_2291FF330()
{
  __asm { BR              X16 }
}

void sub_2291FF340()
{
  __asm { BR              X16 }
}

void sub_2291FF350()
{
  __asm { BR              X16 }
}

void sub_2291FF360()
{
  __asm { BR              X16 }
}

void sub_2291FF370()
{
  __asm { BR              X16 }
}

void sub_2291FF380()
{
  __asm { BR              X16 }
}

void sub_2291FF390()
{
  __asm { BR              X16 }
}

void sub_2291FF3A0()
{
  __asm { BR              X16 }
}

void sub_2291FF3B0()
{
  __asm { BR              X16 }
}

void sub_2291FF3C0()
{
  __asm { BR              X16 }
}

void sub_2291FF3D0()
{
  __asm { BR              X16 }
}

void sub_2291FF3E0()
{
  __asm { BR              X16 }
}

void sub_2291FF3F0()
{
  __asm { BR              X16 }
}

void sub_2291FF400()
{
  __asm { BR              X16 }
}

void sub_2291FF410()
{
  __asm { BR              X16 }
}

void sub_2291FF420()
{
  __asm { BR              X16 }
}

void sub_2291FF430()
{
  __asm { BR              X16 }
}

void sub_2291FF440()
{
  __asm { BR              X16 }
}

void sub_2291FF450()
{
  __asm { BR              X16 }
}

void sub_2291FF460()
{
  __asm { BR              X16 }
}

void sub_2291FF470()
{
  __asm { BR              X16 }
}

void sub_2291FF480()
{
  __asm { BR              X16 }
}

void sub_2291FF490()
{
  __asm { BR              X16 }
}

void sub_2291FF4A0()
{
  __asm { BR              X16 }
}

void sub_2291FF4B0()
{
  __asm { BR              X16 }
}

void sub_2291FF4C0()
{
  __asm { BR              X16 }
}

void sub_2291FF4D0()
{
  __asm { BR              X16 }
}

void sub_2291FF4E0()
{
  __asm { BR              X16 }
}

void sub_2291FF4F0()
{
  __asm { BR              X16 }
}

void sub_2291FF500()
{
  __asm { BR              X16 }
}

void sub_2291FF510()
{
  __asm { BR              X16 }
}

void sub_2291FF520()
{
  __asm { BR              X16 }
}

void sub_2291FF530()
{
  __asm { BR              X16 }
}

void sub_2291FF540()
{
  __asm { BR              X16 }
}

void sub_2291FF550()
{
  __asm { BR              X16 }
}

void sub_2291FF560()
{
  __asm { BR              X16 }
}

void sub_2291FF570()
{
  __asm { BR              X16 }
}

void sub_2291FF580()
{
  __asm { BR              X16 }
}

void sub_2291FF590()
{
  __asm { BR              X16 }
}

void sub_2291FF5A0()
{
  __asm { BR              X16 }
}

void sub_2291FF5B0()
{
  __asm { BR              X16 }
}

void sub_2291FF5C0()
{
  __asm { BR              X16 }
}

void sub_2291FF5D0()
{
  __asm { BR              X16 }
}

void sub_2291FF5E0()
{
  __asm { BR              X16 }
}

void sub_2291FF5F0()
{
  __asm { BR              X16 }
}

void sub_2291FF600()
{
  __asm { BR              X16 }
}

void sub_2291FF610()
{
  __asm { BR              X16 }
}

void sub_2291FF620()
{
  __asm { BR              X16 }
}

void sub_2291FF630()
{
  __asm { BR              X16 }
}

void sub_2291FF640()
{
  __asm { BR              X16 }
}

void sub_2291FF650()
{
  __asm { BR              X16 }
}

void sub_2291FF660()
{
  __asm { BR              X16 }
}

void sub_2291FF670()
{
  __asm { BR              X16 }
}

void sub_2291FF680()
{
  __asm { BR              X16 }
}

void sub_2291FF690()
{
  __asm { BR              X16 }
}

void sub_2291FF6A0()
{
  __asm { BR              X16 }
}

void sub_2291FF6B0()
{
  __asm { BR              X16 }
}

void sub_2291FF6C0()
{
  __asm { BR              X16 }
}

void sub_2291FF6D0()
{
  __asm { BR              X16 }
}

void sub_2291FF6E0()
{
  __asm { BR              X16 }
}

void sub_2291FF6F0()
{
  __asm { BR              X16 }
}

void sub_2291FF700()
{
  __asm { BR              X16 }
}

void sub_2291FF710()
{
  __asm { BR              X16 }
}

void sub_2291FF720()
{
  __asm { BR              X16 }
}

void sub_2291FF730()
{
  __asm { BR              X16 }
}

void sub_2291FF740()
{
  __asm { BR              X16 }
}

void sub_2291FF750()
{
  __asm { BR              X16 }
}

void sub_2291FF760()
{
  __asm { BR              X16 }
}

void sub_2291FF770()
{
  __asm { BR              X16 }
}

void sub_2291FF780()
{
  __asm { BR              X16 }
}

void sub_2291FF790()
{
  __asm { BR              X16 }
}

void sub_2291FF7A0()
{
  __asm { BR              X16 }
}

void sub_2291FF7B0()
{
  __asm { BR              X16 }
}

void sub_2291FF7C0()
{
  __asm { BR              X16 }
}

void sub_2291FF7D0()
{
  __asm { BR              X16 }
}

void sub_2291FF7E0()
{
  __asm { BR              X16 }
}

void sub_2291FF7F0()
{
  __asm { BR              X16 }
}

void sub_2291FF800()
{
  __asm { BR              X16 }
}

void sub_2291FF810()
{
  __asm { BR              X16 }
}

void sub_2291FF820()
{
  __asm { BR              X16 }
}

void sub_2291FF830()
{
  __asm { BR              X16 }
}

void sub_2291FF840()
{
  __asm { BR              X16 }
}

void sub_2291FF850()
{
  __asm { BR              X16 }
}

void sub_2291FF860()
{
  __asm { BR              X16 }
}

void sub_2291FF870()
{
  __asm { BR              X16 }
}

void sub_2291FF880()
{
  __asm { BR              X16 }
}

void sub_2291FF890()
{
  __asm { BR              X16 }
}

void sub_2291FF8A0()
{
  __asm { BR              X16 }
}

void sub_2291FF8B0()
{
  __asm { BR              X16 }
}

void sub_2291FF8C0()
{
  __asm { BR              X16 }
}

void sub_2291FF8D0()
{
  __asm { BR              X16 }
}

void sub_2291FF8E0()
{
  __asm { BR              X16 }
}

void sub_2291FF8F0()
{
  __asm { BR              X16 }
}

void sub_2291FF900()
{
  __asm { BR              X16 }
}

void sub_2291FF910()
{
  __asm { BR              X16 }
}

void sub_2291FF920()
{
  __asm { BR              X16 }
}

void sub_2291FF930()
{
  __asm { BR              X16 }
}

void sub_2291FF940()
{
  __asm { BR              X16 }
}

void sub_2291FF950()
{
  __asm { BR              X16 }
}

void sub_2291FF960()
{
  __asm { BR              X16 }
}

void sub_2291FF970()
{
  __asm { BR              X16 }
}

void sub_2291FF980()
{
  __asm { BR              X16 }
}

void sub_2291FF990()
{
  __asm { BR              X16 }
}

void sub_2291FF9A0()
{
  __asm { BR              X16 }
}

void sub_2291FF9B0()
{
  __asm { BR              X16 }
}

void sub_2291FF9C0()
{
  __asm { BR              X16 }
}

void sub_2291FF9D0()
{
  __asm { BR              X16 }
}

void sub_2291FF9E0()
{
  __asm { BR              X16 }
}

void sub_2291FF9F0()
{
  __asm { BR              X16 }
}

void sub_2291FFA00()
{
  __asm { BR              X16 }
}

void sub_2291FFA10()
{
  __asm { BR              X16 }
}

void sub_2291FFA20()
{
  __asm { BR              X16 }
}

void sub_2291FFA30()
{
  __asm { BR              X16 }
}

void sub_2291FFA40()
{
  __asm { BR              X16 }
}

void sub_2291FFA50()
{
  __asm { BR              X16 }
}

void sub_2291FFA60()
{
  __asm { BR              X16 }
}

void sub_2291FFA70()
{
  __asm { BR              X16 }
}

void sub_2291FFA80()
{
  __asm { BR              X16 }
}

void sub_2291FFA90()
{
  __asm { BR              X16 }
}

void sub_2291FFAA0()
{
  __asm { BR              X16 }
}

void sub_2291FFAB0()
{
  __asm { BR              X16 }
}

void sub_2291FFAC0()
{
  __asm { BR              X16 }
}

void sub_2291FFAD0()
{
  __asm { BR              X16 }
}

void sub_2291FFAE0()
{
  __asm { BR              X16 }
}

void sub_2291FFAF0()
{
  __asm { BR              X16 }
}

void sub_2291FFB00()
{
  __asm { BR              X16 }
}

void sub_2291FFB10()
{
  __asm { BR              X16 }
}

void sub_2291FFB20()
{
  __asm { BR              X16 }
}

void sub_2291FFB30()
{
  __asm { BR              X16 }
}

void sub_2291FFB40()
{
  __asm { BR              X16 }
}

void sub_2291FFB50()
{
  __asm { BR              X16 }
}

void sub_2291FFB60()
{
  __asm { BR              X16 }
}

void sub_2291FFB70()
{
  __asm { BR              X16 }
}

void sub_2291FFB80()
{
  __asm { BR              X16 }
}

void sub_2291FFB90()
{
  __asm { BR              X16 }
}

void sub_2291FFBA0()
{
  __asm { BR              X16 }
}

void sub_2291FFBB0()
{
  __asm { BR              X16 }
}

void sub_2291FFBC0()
{
  __asm { BR              X16 }
}

void sub_2291FFBD0()
{
  __asm { BR              X16 }
}

void sub_2291FFBE0()
{
  __asm { BR              X16 }
}

void sub_2291FFBF0()
{
  __asm { BR              X16 }
}

void sub_2291FFC00()
{
  __asm { BR              X16 }
}

void sub_2291FFC10()
{
  __asm { BR              X16 }
}

void sub_2291FFC20()
{
  __asm { BR              X16 }
}

void sub_2291FFC30()
{
  __asm { BR              X16 }
}

void sub_2291FFC40()
{
  __asm { BR              X16 }
}

void sub_2291FFC50()
{
  __asm { BR              X16 }
}

void sub_2291FFC60()
{
  __asm { BR              X16 }
}

void sub_2291FFC70()
{
  __asm { BR              X16 }
}

void sub_2291FFC80()
{
  __asm { BR              X16 }
}

void sub_2291FFC90()
{
  __asm { BR              X16 }
}

void sub_2291FFCA0()
{
  __asm { BR              X16 }
}

void sub_2291FFCB0()
{
  __asm { BR              X16 }
}

void sub_2291FFCC0()
{
  __asm { BR              X16 }
}

void sub_2291FFCD0()
{
  __asm { BR              X16 }
}

void sub_2291FFCE0()
{
  __asm { BR              X16 }
}

void sub_2291FFCF0()
{
  __asm { BR              X16 }
}

void sub_2291FFD00()
{
  __asm { BR              X16 }
}

void sub_2291FFD10()
{
  __asm { BR              X16 }
}

void sub_2291FFD20()
{
  __asm { BR              X16 }
}

void sub_2291FFD30()
{
  __asm { BR              X16 }
}

void sub_2291FFD40()
{
  __asm { BR              X16 }
}

void sub_2291FFD50()
{
  __asm { BR              X16 }
}

void sub_2291FFD60()
{
  __asm { BR              X16 }
}

void sub_2291FFD70()
{
  __asm { BR              X16 }
}

void sub_2291FFD80()
{
  __asm { BR              X16 }
}

void sub_2291FFD90()
{
  __asm { BR              X16 }
}

void sub_2291FFDA0()
{
  __asm { BR              X16 }
}

void sub_2291FFDB0()
{
  __asm { BR              X16 }
}

void sub_2291FFDC0()
{
  __asm { BR              X16 }
}

void sub_2291FFDD0()
{
  __asm { BR              X16 }
}

void sub_2291FFDE0()
{
  __asm { BR              X16 }
}

void sub_2291FFDF0()
{
  __asm { BR              X16 }
}

void sub_2291FFE00()
{
  __asm { BR              X16 }
}

void sub_2291FFE10()
{
  __asm { BR              X16 }
}

void sub_2291FFE20()
{
  __asm { BR              X16 }
}

void sub_2291FFE30()
{
  __asm { BR              X16 }
}

void sub_2291FFE40()
{
  __asm { BR              X16 }
}

void sub_2291FFE50()
{
  __asm { BR              X16 }
}

void sub_2291FFE60()
{
  __asm { BR              X16 }
}

void sub_2291FFE70()
{
  __asm { BR              X16 }
}

void sub_2291FFE80()
{
  __asm { BR              X16 }
}

void sub_2291FFE90()
{
  __asm { BR              X16 }
}

void sub_2291FFEA0()
{
  __asm { BR              X16 }
}

void sub_2291FFEB0()
{
  __asm { BR              X16 }
}

void sub_2291FFEC0()
{
  __asm { BR              X16 }
}

void sub_2291FFED0()
{
  __asm { BR              X16 }
}

void sub_2291FFEE0()
{
  __asm { BR              X16 }
}

void sub_2291FFEF0()
{
  __asm { BR              X16 }
}

void sub_2291FFF00()
{
  __asm { BR              X16 }
}

void sub_2291FFF10()
{
  __asm { BR              X16 }
}

void sub_2291FFF20()
{
  __asm { BR              X16 }
}

void sub_2291FFF30()
{
  __asm { BR              X16 }
}

void sub_2291FFF40()
{
  __asm { BR              X16 }
}

void sub_2291FFF50()
{
  __asm { BR              X16 }
}

void sub_2291FFF60()
{
  __asm { BR              X16 }
}

void sub_2291FFF70()
{
  __asm { BR              X16 }
}

void sub_2291FFF80()
{
  __asm { BR              X16 }
}

void sub_2291FFF90()
{
  __asm { BR              X16 }
}

void sub_2291FFFA0()
{
  __asm { BR              X16 }
}

void sub_2291FFFB0()
{
  __asm { BR              X16 }
}

void sub_2291FFFC0()
{
  __asm { BR              X16 }
}

void sub_2291FFFD0()
{
  __asm { BR              X16 }
}

void sub_2291FFFE0()
{
  __asm { BR              X16 }
}

void sub_2291FFFF0()
{
  __asm { BR              X16 }
}

void *__cdecl ffi_closure_alloc(size_t size, void **code)
{
  _QWORD *v3;
  _QWORD *v4;
  char *v5;
  uint64_t v6;
  vm_map_t *v7;
  vm_address_t v9;
  char *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  vm_address_t target_address;
  vm_prot_t cur_protection[2];
  vm_address_t address;

  v3 = malloc_type_malloc(size, 0xDB544668uLL);
  if (v3)
  {
    pthread_mutex_lock(&ffi_trampoline_lock);
    v4 = (_QWORD *)ffi_trampoline_tables;
    if (ffi_trampoline_tables)
    {
      v5 = *(char **)(ffi_trampoline_tables + 16);
      if (v5)
      {
        LOWORD(v6) = *(_WORD *)(ffi_trampoline_tables + 8);
LABEL_5:
        v4[2] = *((_QWORD *)v5 + 1);
        *((_WORD *)v4 + 4) = v6 - 1;
        *((_QWORD *)v5 + 1) = 0;
        pthread_mutex_unlock(&ffi_trampoline_lock);
        *code = *(void **)v5;
        *v3 = v4;
        v3[1] = v5;
        return v3;
      }
    }
    *(_QWORD *)cur_protection = 0;
    address = 0;
    v7 = (vm_map_t *)MEMORY[0x24BDAEC58];
    if (!vm_allocate(*MEMORY[0x24BDAEC58], &address, 0xC000uLL, 1))
    {
      if (ffi_trampoline_table_alloc_trampoline_template_init_once != -1)
        dispatch_once(&ffi_trampoline_table_alloc_trampoline_template_init_once, &__block_literal_global);
      target_address = address + 0x4000;
      if (!vm_remap(*v7, &target_address, 0x8000uLL, 0, 0x4000, *v7, ffi_trampoline_table_alloc_trampoline_table_page - 0x4000, 0, &cur_protection[1], cur_protection, 0)&& (cur_protection[1] & 4) != 0)
      {
        v9 = target_address;
        v4 = malloc_type_calloc(1uLL, 0x30uLL, 0x102004042DA13E7uLL);
        *((_WORD *)v4 + 4) = 1024;
        *v4 = address;
        v10 = (char *)malloc_type_calloc(0x400uLL, 0x10uLL, 0xA0040BD48D6D6uLL);
        v5 = v10;
        v4[3] = v10;
        v6 = *((unsigned __int16 *)v4 + 4);
        if (*((_WORD *)v4 + 4))
        {
          v11 = 0;
          v12 = 0;
          do
          {
            *(_QWORD *)&v10[v11] = v9 + 0x4000 + v11;
            if ((v6 - 1) > v12)
              *(_QWORD *)&v10[v11 + 8] = &v10[v11 + 16];
            v11 += 16;
            ++v12;
          }
          while (16 * v6 != v11);
        }
        v4[2] = v10;
        v13 = ffi_trampoline_tables;
        v4[5] = ffi_trampoline_tables;
        if (v13)
          *(_QWORD *)(v13 + 32) = v4;
        ffi_trampoline_tables = (uint64_t)v4;
        goto LABEL_5;
      }
      MEMORY[0x22E2C5018](*v7, address, 49152);
    }
    pthread_mutex_unlock(&ffi_trampoline_lock);
    free(v3);
    return 0;
  }
  return v3;
}

void ffi_closure_free(void *a1)
{
  uint64_t v2;
  _QWORD *v3;
  int v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;

  pthread_mutex_lock(&ffi_trampoline_lock);
  v3 = *(_QWORD **)a1;
  v2 = *((_QWORD *)a1 + 1);
  *(_QWORD *)(v2 + 8) = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v3[2] = v2;
  v4 = (unsigned __int16)(*((_WORD *)v3 + 4))++ + 1;
  v5 = ffi_trampoline_tables;
  if (v4 != 1024 || ffi_trampoline_tables == (_QWORD)v3)
  {
    if ((_QWORD *)ffi_trampoline_tables != v3)
    {
      v3[4] = 0;
      v3[5] = v5;
      if (v5)
        *(_QWORD *)(v5 + 32) = v3;
      ffi_trampoline_tables = (uint64_t)v3;
    }
  }
  else
  {
    v7 = v3[4];
    if (v7)
      *(_QWORD *)(v7 + 40) = v3[5];
    v8 = v3[5];
    if (v8)
      *(_QWORD *)(v8 + 32) = v7;
    MEMORY[0x22E2C5018](*MEMORY[0x24BDAEC58], *v3, 0x8000);
    free((void *)v3[3]);
    free(v3);
  }
  pthread_mutex_unlock(&ffi_trampoline_lock);
  free(a1);
}

void *__ffi_trampoline_table_alloc_block_invoke()
{
  void *v0;
  void *result;

  v0 = dlopen("/usr/lib/libffi-trampolines.dylib", 262);
  if (!v0)
    __ffi_trampoline_table_alloc_block_invoke_cold_1();
  result = dlsym(v0, "ffi_closure_trampoline_table_page");
  ffi_trampoline_table_alloc_trampoline_table_page = (uint64_t)result;
  if (!result)
    __ffi_trampoline_table_alloc_block_invoke_cold_2();
  return result;
}

uint64_t ffi_prep_cif_machdep(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v4;
  unint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  unint64_t **v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = *(unsigned __int16 *)(v1 + 10);
  v4 = *(_DWORD *)(a1 + 24);
  switch(*(_WORD *)(v1 + 10))
  {
    case 0:
      break;
    case 1:
    case 0xA:
      v2 = 30;
      break;
    case 2:
    case 3:
    case 4:
    case 0xD:
    case 0xF:
      v2 = is_vfp_type(*(unint64_t **)(a1 + 16));
      if (!v2)
      {
        v5 = *(_QWORD *)v1;
        if (*(_QWORD *)v1 == 8)
          v6 = 1;
        else
          v6 = 66;
        if (v5 == 16)
          v7 = 2;
        else
          v7 = v6;
        if (v5 < 0x11)
        {
          v2 = v7;
        }
        else
        {
          v4 += 8;
          v2 = 32;
        }
      }
      break;
    case 5:
      v2 = 20;
      break;
    case 6:
      v2 = 26;
      break;
    case 7:
      v2 = 22;
      break;
    case 8:
      v2 = 28;
      break;
    case 9:
      v2 = 24;
      break;
    case 0xB:
    case 0xC:
    case 0xE:
      v2 = 1;
      break;
    default:
      abort();
  }
  v8 = *(unsigned int *)(a1 + 4);
  if ((int)v8 >= 1)
  {
    v9 = *(unint64_t ***)(a1 + 8);
    while (!is_vfp_type(*v9))
    {
      ++v9;
      if (!--v8)
        goto LABEL_25;
    }
    v2 |= 0x80u;
  }
LABEL_25:
  *(_DWORD *)(a1 + 24) = ((v4 - 1) | 0xF) + 1;
  *(_DWORD *)(a1 + 28) = v2;
  *(_DWORD *)(a1 + 32) = 0;
  return 0;
}

uint64_t is_vfp_type(unint64_t *a1)
{
  int v1;
  unint64_t v2;
  uint64_t result;
  unint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;
  uint64_t *v10;
  int v11;
  uint64_t v12;

  v1 = *((unsigned __int16 *)a1 + 5);
  if ((v1 - 2) < 3)
  {
    LODWORD(v2) = 1;
    return (4 * v1 - v2 + 4);
  }
  if (v1 == 13)
  {
    v4 = *a1;
    if (*a1 - 65 >= 0xFFFFFFFFFFFFFFC3)
    {
      v5 = (uint64_t *)a1[2];
      v6 = *v5;
      v1 = *(unsigned __int16 *)(*v5 + 10);
      if ((v1 & 0xFFFFFFFD) == 0xD)
      {
        v7 = (uint64_t *)a1[2];
        do
        {
          v8 = *v7++;
          v9 = is_hfa0(v8);
        }
        while (v9 < 0);
        v1 = v9;
      }
      if (v1 == 4 || v1 == 3)
      {
        if ((v4 & 7) != 0)
          return 0;
        v2 = v4 >> 3;
      }
      else
      {
        if (v1 != 2 || (v4 & 3) != 0)
          return 0;
        v2 = v4 >> 2;
      }
      if (v2 <= 4)
      {
        if (v6)
        {
          v10 = v5 + 1;
          do
          {
            v11 = *(unsigned __int16 *)(v6 + 10);
            if ((v11 & 0xFFFFFFFD) == 0xD)
            {
              result = is_hfa1(v6, v1);
              if (!(_DWORD)result)
                return result;
            }
            else if (v1 != v11)
            {
              return 0;
            }
            v12 = *v10++;
            v6 = v12;
          }
          while (v12);
        }
        return (4 * v1 - v2 + 4);
      }
    }
  }
  else if (v1 == 15)
  {
    v1 = *(unsigned __int16 *)(*(_QWORD *)a1[2] + 10);
    if ((v1 - 2) <= 2)
    {
      LODWORD(v2) = 2;
      return (4 * v1 - v2 + 4);
    }
  }
  return 0;
}

uint64_t ffi_prep_cif_machdep_var(uint64_t a1, int a2)
{
  ffi_prep_cif_machdep(a1);
  *(_DWORD *)(a1 + 32) = a2;
  return 0;
}

void *ffi_call_int(uint64_t a1, uint64_t (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD), void *a3, int **a4)
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  size_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  int v22;
  uint64_t v23;
  size_t v24;
  int *v25;
  int v26;
  int v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  unint64_t v36;
  uint64_t v37;
  BOOL v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  const void *v47;
  char v48;
  void *result;
  uint64_t v50;
  size_t v51;
  void *v52;
  char *v53;
  _QWORD *v54;
  unsigned int v55;
  uint64_t (*v56)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  unint64_t v57;
  char *v58;
  char *v59;
  size_t v60;
  uint64_t v61;

  v56 = a2;
  v61 = *MEMORY[0x24BDAC8D0];
  v7 = **(_QWORD **)(a1 + 16);
  v9 = *(unsigned int *)(a1 + 24);
  v8 = *(unsigned int *)(a1 + 28);
  v10 = v8 & 0xFFFFFEFF;
  v11 = (v8 >> 2) & 0x10;
  v12 = *(_DWORD *)(a1 + 28) & 0x80;
  if (a3)
    v12 = v8 & 0xFFFFFEFF;
  else
    v11 = 0;
  v51 = **(_QWORD **)(a1 + 16);
  if (a3)
    v7 = 0;
  v57 = v8;
  if ((v8 & 0x20) != 0)
    v13 = v7;
  else
    v13 = v11;
  if ((v8 & 0x20) == 0)
    v10 = v12;
  v55 = v10;
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v50 - v14;
  bzero((char *)&v50 - v14, v16);
  v58 = v15 + 192;
  v59 = v15;
  v52 = a3;
  v53 = &v15[v9 + 192];
  v17 = v53 + 40;
  if (!v13)
    v17 = a3;
  v54 = v17;
  v18 = *(unsigned int *)(a1 + 4);
  if ((int)v18 >= 1)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    v60 = 0;
    v22 = 0;
    while (1)
    {
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v19);
      v24 = *(_QWORD *)v23;
      v25 = *a4;
      switch(*(_WORD *)(v23 + 10))
      {
        case 0:
          goto LABEL_58;
        case 1:
        case 0xA:
          v28 = *v25;
          goto LABEL_39;
        case 2:
        case 3:
        case 4:
        case 0xD:
        case 0xF:
          v26 = is_vfp_type(*(unint64_t **)(*(_QWORD *)(a1 + 8) + 8 * v19));
          if (v26)
          {
            v27 = 4 - (v26 & 3);
            if ((v57 & 0x100) != 0 && *(_DWORD *)a1 == 2)
            {
              if (v27 + v20 <= 8)
                __asm { BR              X11 }
            }
            else if ((v27 + v22) <= 8)
            {
              __asm { BR              X11 }
            }
            v29 = *(unsigned __int16 *)(v23 + 8);
            v30 = v29 - 1;
            v31 = v29 >= 8 || v21 == 0;
            v32 = 7;
            if (v31)
              v32 = v30;
            v33 = (v32 | (v60 - 1)) + 1;
            v60 = v33 + v24;
            v34 = &v58[v33];
            v22 = 8;
LABEL_57:
            memcpy(v34, v25, v24);
            goto LABEL_58;
          }
          if (v24 <= 0x10)
          {
            v41 = (v24 + 7) >> 3;
            if (v41 + v20 > 8)
            {
              v42 = *(unsigned __int16 *)(v23 + 8);
              v43 = v42 - 1;
              v44 = v42 >= 8 || v21 == 0;
              v45 = 7;
              if (v44)
                v45 = v43;
              v46 = (v45 | (v60 - 1)) + 1;
              v60 = v46 + v24;
              v34 = &v58[v46];
              v20 = 8;
            }
            else
            {
              v34 = &v59[8 * v20 + 128];
              v20 += v41;
            }
            goto LABEL_57;
          }
          v25 = (int *)a4;
          v24 = 8;
LABEL_24:
          v28 = *(_QWORD *)v25;
LABEL_39:
          if (v20 > 7)
          {
            v36 = *(unsigned __int16 *)(v23 + 8);
            v37 = v36 - 1;
            v38 = v36 >= 8 || v21 == 0;
            v39 = 7;
            if (v38)
              v39 = v37;
            v40 = (v39 | (v60 - 1)) + 1;
            v60 = v40 + v24;
            memcpy(&v58[v40], v25, v24);
            v20 = 8;
          }
          else
          {
            v35 = &v59[8 * v20++];
            *((_QWORD *)v35 + 16) = v28;
          }
LABEL_58:
          if (++v19 == *(_DWORD *)(a1 + 32))
          {
            v22 = 8;
            v21 = 1;
            v20 = 8;
          }
          ++a4;
          if (v18 == v19)
            goto LABEL_61;
          break;
        case 5:
          v28 = *(unsigned __int8 *)v25;
          goto LABEL_39;
        case 6:
          v28 = *(char *)v25;
          goto LABEL_39;
        case 7:
          v28 = *(unsigned __int16 *)v25;
          goto LABEL_39;
        case 8:
          v28 = *(__int16 *)v25;
          goto LABEL_39;
        case 9:
          v28 = *v25;
          goto LABEL_39;
        case 0xB:
        case 0xC:
        case 0xE:
          goto LABEL_24;
        default:
          abort();
      }
    }
  }
LABEL_61:
  v47 = v54;
  v48 = v55;
  result = (void *)ffi_call_SYSV((uint64_t)v59, v53, v56, (uint64_t)v54, v55);
  if ((v48 & 0x40) != 0)
    return memcpy(v52, v47, v51);
  return result;
}

ffi_status ffi_prep_closure_loc(ffi_closure *a1, ffi_cif *a2, void (__cdecl *fun)(ffi_cif *, void *, void **, void *), void *user_data, void *codeloc)
{
  ffi_status result;
  void *v7;
  unsigned int flags;

  if (a2->abi - 1 > 1)
    return 2;
  result = FFI_OK;
  v7 = ffi_closure_SYSV_V;
  flags = a2->flags;
  *((_QWORD *)codeloc - 4096) = a1;
  if ((flags & 0x80) == 0)
    v7 = ffi_closure_SYSV;
  *((_QWORD *)codeloc - 4095) = v7;
  a1->cif = a2;
  a1->fun = fun;
  a1->user_data = user_data;
  return result;
}

ffi_closure *__cdecl ffi_find_closure_for_code_np(void *code)
{
  return (ffi_closure *)*((_QWORD *)code - 4096);
}

uint64_t ffi_closure_SYSV_inner(uint64_t a1, void (*a2)(uint64_t, uint64_t, char *, uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  size_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  int v14;
  unint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned int v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  int v28;
  int v29;
  uint64_t v30;
  _DWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  _QWORD *v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  BOOL v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  BOOL v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void (*v61)(uint64_t, uint64_t, char *, uint64_t);
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v58 = a6;
  v59 = a7;
  v64 = a4;
  v65 = a5;
  v60 = a3;
  v61 = a2;
  v66 = *MEMORY[0x24BDAC8D0];
  v8 = *(unsigned int *)(a1 + 4);
  MEMORY[0x24BDAC7A8]();
  v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFF0);
  bzero(v10, v9);
  v11 = v8;
  v62 = *(_DWORD *)(a1 + 28);
  if ((int)v8 >= 1)
  {
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v63 = v11;
    while (1)
    {
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8 * v12);
      v18 = *(unsigned __int16 *)(v17 + 10);
      if (v18 > 0xF)
        abort();
      v19 = *(_QWORD *)v17;
      v20 = 1 << v18;
      if ((v20 & 0x5FE2) != 0)
      {
        v21 = v19 - 1;
        if (v19 < 8 && v14 != 0)
          v21 = 7;
        v23 = (v21 | (v15 - 1)) + 1;
        v24 = v23 + v19;
        v25 = v65 + v23;
        v26 = v64 + 8 * v13 + 128;
        v27 = v13 > 7;
        if (v13 <= 7)
        {
          ++v13;
        }
        else
        {
          v15 = v24;
          v13 = 8;
        }
        if (!v27)
          v25 = v26;
        *(_QWORD *)&v10[8 * v12] = v25;
        goto LABEL_50;
      }
      if ((v20 & 0xA01C) != 0)
        break;
LABEL_50:
      if (++v12 == *(_DWORD *)(a1 + 32))
      {
        v16 = 8;
        v14 = 1;
        v13 = 8;
      }
      if (v11 == v12)
        goto LABEL_61;
    }
    v28 = is_vfp_type(*(unint64_t **)(*(_QWORD *)(a1 + 8) + 8 * v12));
    if (!v28)
    {
      v11 = v63;
      if (v19 < 0x11)
      {
        v38 = (v19 + 7) >> 3;
        if (v38 + v13 > 8)
        {
          v49 = *(unsigned __int16 *)(v17 + 8);
          v50 = v49 - 1;
          v51 = v49 >= 8 || v14 == 0;
          v52 = 7;
          if (v51)
            v52 = v50;
          v53 = (v52 | (v15 - 1)) + 1;
          v15 = v53 + v19;
          *(_QWORD *)&v10[8 * v12] = v65 + v53;
          v13 = 8;
        }
        else
        {
          *(_QWORD *)&v10[8 * v12] = v64 + 8 * v13 + 128;
          v13 += v38;
        }
      }
      else
      {
        v32 = (v15 - 1) | 7;
        v33 = v32 + v65;
        v34 = v32 + 9;
        v35 = v64 + 8 * v13 + 128;
        v36 = v13 > 7;
        if (v13 <= 7)
        {
          ++v13;
        }
        else
        {
          v15 = v34;
          v13 = 8;
        }
        if (v36)
          v37 = (_QWORD *)(v33 + 1);
        else
          v37 = (_QWORD *)v35;
        *(_QWORD *)&v10[8 * v12] = *v37;
      }
      goto LABEL_50;
    }
    v29 = v28;
    v30 = 4 - (v28 & 3u);
    if ((v62 & 0x100) != 0 && *(_DWORD *)a1 == 2)
    {
      if (v30 + (unint64_t)v13 > 8)
      {
        v39 = *(unsigned __int16 *)(v17 + 8);
        v40 = v39 - 1;
        v41 = v39 >= 8 || v14 == 0;
        v42 = 7;
        if (v41)
          v42 = v40;
        v43 = (v42 | (v15 - 1)) + 1;
        v15 = v43 + v19;
        *(_QWORD *)&v10[8 * v12] = v65 + v43;
        v16 = 8;
        v13 = 8;
        goto LABEL_49;
      }
      v31 = (_DWORD *)(v64 + 8 * v13 + 128);
      v13 += v30;
    }
    else
    {
      if (v30 + (unint64_t)v16 > 8)
      {
        v44 = *(unsigned __int16 *)(v17 + 8);
        v45 = v44 - 1;
        v46 = v44 >= 8 || v14 == 0;
        v47 = 7;
        if (v46)
          v47 = v45;
        v48 = (v47 | (v15 - 1)) + 1;
        v15 = v48 + v19;
        *(_QWORD *)&v10[8 * v12] = v65 + v48;
        v16 = 8;
        goto LABEL_49;
      }
      v31 = (_DWORD *)(v64 + 16 * v16);
      v16 += v30;
    }
    *(_QWORD *)&v10[8 * v12] = compress_hfa_type(v31, v31, v29);
LABEL_49:
    v11 = v63;
    goto LABEL_50;
  }
LABEL_61:
  v54 = v62;
  if ((v62 & 0x20) != 0)
    v55 = v59;
  else
    v55 = v58;
  v61(a1, v55, v10, v60);
  return v54 & 0xFFFFFEFF;
}

_DWORD *compress_hfa_type(_DWORD *__dst, _OWORD *a2, int a3)
{
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

  switch(a3)
  {
    case 8:
      v4 = a2[1];
      v5 = a2[2];
      v6 = a2[3];
      *__dst = *a2;
      __dst[1] = v4;
      __dst[2] = v5;
      __dst[3] = v6;
      break;
    case 9:
      v7 = a2[1];
      v8 = a2[2];
      *__dst = *a2;
      __dst[1] = v7;
      __dst[2] = v8;
      break;
    case 10:
      v9 = a2[1];
      *__dst = *a2;
      __dst[1] = v9;
      break;
    case 11:
      if (__dst != (_DWORD *)a2)
        *__dst = *(_DWORD *)a2;
      break;
    case 12:
      v10 = a2[1];
      v11 = a2[2];
      v12 = a2[3];
      *(_QWORD *)__dst = *(_QWORD *)a2;
      *((_QWORD *)__dst + 1) = v10;
      *((_QWORD *)__dst + 2) = v11;
      *((_QWORD *)__dst + 3) = v12;
      break;
    case 13:
      v13 = a2[1];
      v14 = a2[2];
      *(_QWORD *)__dst = *(_QWORD *)a2;
      *((_QWORD *)__dst + 1) = v13;
      *((_QWORD *)__dst + 2) = v14;
      break;
    case 14:
      v15 = a2[1];
      *(_QWORD *)__dst = *(_QWORD *)a2;
      *((_QWORD *)__dst + 1) = v15;
      break;
    case 15:
      if (__dst != (_DWORD *)a2)
        *(_QWORD *)__dst = *(_QWORD *)a2;
      break;
    default:
      if (__dst != (_DWORD *)a2)
        memcpy(__dst, a2, 64 - 16 * (a3 & 3u));
      break;
  }
  return __dst;
}

uint64_t is_hfa0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t *i;
  uint64_t result;
  uint64_t v5;

  v1 = *(uint64_t **)(a1 + 16);
  if (!v1)
    return 0xFFFFFFFFLL;
  v2 = *v1;
  if (!*v1)
    return 0xFFFFFFFFLL;
  for (i = v1 + 1; ; ++i)
  {
    result = *(unsigned __int16 *)(v2 + 10);
    if ((result & 0xFFFFFFFD) != 0xD)
      break;
    result = is_hfa0(v2);
    if ((result & 0x80000000) == 0)
      break;
    v5 = *i;
    v2 = v5;
    if (!v5)
      return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t is_hfa1(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t *i;
  int v6;
  uint64_t result;
  uint64_t v8;

  v2 = *(uint64_t **)(a1 + 16);
  if (!v2)
    return 1;
  v3 = *v2;
  if (!*v2)
    return 1;
  for (i = v2 + 1; ; ++i)
  {
    v6 = *(unsigned __int16 *)(v3 + 10);
    if ((v6 & 0xFFFFFFFD) == 0xD)
    {
      result = is_hfa1();
      if (!(_DWORD)result)
        return result;
      goto LABEL_8;
    }
    if (v6 != a2)
      break;
LABEL_8:
    v8 = *i;
    v3 = v8;
    if (!v8)
      return 1;
  }
  return 0;
}

int ffi_tramp_is_supported(void)
{
  return 0;
}

void *__cdecl ffi_tramp_alloc(int flags)
{
  return 0;
}

void *__cdecl ffi_tramp_get_addr(void *tramp)
{
  return 0;
}

void __ffi_trampoline_table_alloc_block_invoke_cold_1()
{
  __assert_rtn("ffi_trampoline_table_alloc_block_invoke", "closures.c", 258, "trampoline_handle");
}

void __ffi_trampoline_table_alloc_block_invoke_cold_2()
{
  __assert_rtn("ffi_trampoline_table_alloc_block_invoke", "closures.c", 261, "trampoline_table_page");
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
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

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x24BDB0380](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x24BDB0390](*(_QWORD *)&target_task, address, size);
}

