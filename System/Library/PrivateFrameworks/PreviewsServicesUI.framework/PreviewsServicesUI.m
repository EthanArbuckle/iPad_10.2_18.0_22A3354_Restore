void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id UVPreviewsServicesError(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v9 = (objc_class *)MEMORY[0x24BDD17C8];
  v10 = a1;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithFormat:arguments:", v10, &a9);

  v15 = *MEMORY[0x24BDD0FC8];
  v16[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("UVErrorDomain"), -7201, v12);

  return v13;
}

uint64_t UVSuppressedPresentationFromCatalystErrorCode()
{
  return -1;
}

uint64_t UVSceneIdentifierToPersistenceIdentifier(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("UV-InjectedScene"), CFSTR("UV-Persistence"));
}

uint64_t UVPersistenceIdentifierToSceneIdentifier(void *a1, const char *a2)
{
  return objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:", CFSTR("UV-Persistence"), CFSTR("UV-InjectedScene"));
}

id _PreviewSceneSettingValueDescription(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CGSize v8;

  v3 = a2;
  v4 = v3;
  if (a1 == 1100102)
  {
    UVPreviewSceneLayoutDescription(objc_msgSend(v3, "integerValue"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a1 != 1100101)
    {
      v6 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "CGSizeValue");
    NSStringFromCGSize(v8);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

__CFString *UVPreviewSceneLayoutDescription(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("device");
  if (a1 == 1)
  {
    v1 = CFSTR("custom");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("unknown-%ld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

uint64_t sub_22AE45C6C(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_22AE45C74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_22AE45CFC(a1, &qword_255B533A0);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_22AE45CA0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22AE45CC0(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_22AE45CFC(a1, qword_255B533A8);
}

void sub_22AE45CFC(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_22AE45D40()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22AE45D48()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22AE45DC0(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 32 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    v10 = ((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v11 = ((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFFFF8;
    v12 = *(_QWORD *)(v11 + 24);
    *(_QWORD *)(v10 + 24) = v12;
    (**(void (***)(unint64_t, unint64_t))(v12 - 8))(v10, v11);
    v13 = *(_QWORD *)(((v11 + 39) & 0xFFFFFFFFFFFFFFF8) + 24);
    *(_QWORD *)(((v10 + 39) & 0xFFFFFFFFFFFFFFF8) + 24) = v13;
    (**(void (***)(void))(v13 - 8))();
  }
  return v4;
}

uint64_t sub_22AE45EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = (a1 + *(_QWORD *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8;
  __swift_destroy_boxed_opaque_existential_0(v4);
  return __swift_destroy_boxed_opaque_existential_0((v4 + 39) & 0xFFFFFFFFFFFFFFF8);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_22AE45F1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  v9 = *(_QWORD *)(v8 + 24);
  *(_QWORD *)(v7 + 24) = v9;
  (**(void (***)(unint64_t, unint64_t))(v9 - 8))(v7, v8);
  v10 = *(_QWORD *)(((v8 + 39) & 0xFFFFFFFFFFFFFFF8) + 24);
  *(_QWORD *)(((v7 + 39) & 0xFFFFFFFFFFFFFFF8) + 24) = v10;
  (**(void (***)(void))(v10 - 8))();
  return a1;
}

uint64_t sub_22AE45FB0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t *v8;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (uint64_t *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (uint64_t *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  __swift_assign_boxed_opaque_existential_0(v7, v8);
  __swift_assign_boxed_opaque_existential_0((uint64_t *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8), (uint64_t *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8));
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

uint64_t sub_22AE46184(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  __int128 v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  return a1;
}

uint64_t sub_22AE461F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  _OWORD *v8;
  __int128 v9;
  _OWORD *v10;
  _OWORD *v11;
  __int128 v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_OWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (_OWORD *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  v9 = v8[1];
  *v7 = *v8;
  v7[1] = v9;
  v10 = (_OWORD *)(((unint64_t)v7 + 39) & 0xFFFFFFFFFFFFFFF8);
  v11 = (_OWORD *)(((unint64_t)v8 + 39) & 0xFFFFFFFFFFFFFFF8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  return a1;
}

uint64_t sub_22AE4627C(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  unint64_t v12;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5 <= 0x7FFFFFFF)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v4 + 84);
  if (!a2)
    return 0;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 >= a2)
  {
    if (v5 < 0x7FFFFFFF)
    {
      v12 = *(_QWORD *)(((a1 + v7 + 7) & 0xFFFFFFFFFFFFF8) + 0x18);
      if (v12 >= 0xFFFFFFFF)
        LODWORD(v12) = -1;
      return (v12 + 1);
    }
    else
    {
      return (*(uint64_t (**)(void))(v4 + 48))();
    }
  }
  else
  {
    if (((((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 32) & 0xFFFFFFF8) != 0)
      v8 = 2;
    else
      v8 = a2 - v6 + 1;
    if (v8 >= 0x10000)
      v9 = 4;
    else
      v9 = 2;
    if (v8 < 0x100)
      v9 = 1;
    if (v8 >= 2)
      v10 = v9;
    else
      v10 = 0;
    return ((uint64_t (*)(void))((char *)&loc_22AE46300 + 4 * byte_22AE5EEA0[v10]))();
  }
}

void sub_22AE46384(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
    if (a2 <= v6)
      goto LABEL_17;
  }
  else
  {
    if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) == 0xFFFFFFE0)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
    if (a2 <= v6)
LABEL_17:
      __asm { BR              X12 }
  }
  if (((((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) + 39) & 0xFFFFFFF8) != 0xFFFFFFE0)
  {
    v10 = ~v6 + a2;
    bzero(a1, ((((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 39) & 0xFFFFFFFFFFFFFFF8) + 32);
    *a1 = v10;
  }
  __asm { BR              X10 }
}

void sub_22AE46480()
{
  uint64_t v0;
  uint64_t v1;
  char v2;

  *(_BYTE *)(v0 + v1) = v2;
  JUMPOUT(0x22AE464FCLL);
}

void sub_22AE46488(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 + v3) = 0;
  if (a2)
    JUMPOUT(0x22AE46490);
  JUMPOUT(0x22AE464FCLL);
}

void sub_22AE464D4()
{
  uint64_t v0;
  uint64_t v1;
  __int16 v2;

  *(_WORD *)(v0 + v1) = v2;
  JUMPOUT(0x22AE464FCLL);
}

void sub_22AE464DC()
{
  uint64_t v0;
  uint64_t v1;
  int v2;

  *(_DWORD *)(v0 + v1) = v2;
  JUMPOUT(0x22AE464FCLL);
}

uint64_t sub_22AE464E4(uint64_t a1, int a2, unsigned int a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *(_WORD *)(v6 + v7) = 0;
  if (!a2)
    goto LABEL_6;
  if (a3 < 0x7FFFFFFF)
  {
    if (a2 < 0)
      JUMPOUT(0x22AE464F0);
    *(_QWORD *)(((v6 + v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 24) = (a2 - 1);
LABEL_6:
    JUMPOUT(0x22AE464FCLL);
  }
  return (*(uint64_t (**)(uint64_t))(v4 + 56))(v6);
}

uint64_t type metadata accessor for InvalidObject(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for InvalidObject);
}

uint64_t sub_22AE46520()
{
  sub_22AE5E1BC();
  sub_22AE5E0FC();
  sub_22AE5E258();
  sub_22AE5E0FC();
  sub_22AE5E1E0();
  sub_22AE5E0FC();
  sub_22AE5E1E0();
  return 0;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22E2E929C](a1, v6, a5);
}

uint64_t sub_22AE4667C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return 0x657263736C6C7566;
  sub_22AE5E0FC();
  type metadata accessor for CGSize(0);
  sub_22AE5E1E0();
  return 0;
}

uint64_t sub_22AE4671C(uint64_t a1, uint64_t a2)
{
  int v3;
  unsigned int v4;
  uint64_t result;
  double v6;
  _BOOL4 v7;

  v3 = *(unsigned __int8 *)(a1 + 16);
  v4 = *(unsigned __int8 *)(a2 + 16);
  result = v3 & v4;
  if ((v3 & 1) == 0 && (v4 & 1) == 0)
  {
    v6 = *(double *)(a1 + 8);
    v7 = *(double *)a1 == *(double *)a2;
    return v6 == *(double *)(a2 + 8) && v7;
  }
  return result;
}

uint64_t sub_22AE46750()
{
  uint64_t v0;

  return sub_22AE4667C(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

void static InjectedScene.Layout.fullscreen.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_BYTE *)(a1 + 16) = 1;
}

void static InjectedScene.Layout.fixed(size:)(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(_BYTE *)(a1 + 16) = 0;
}

void static InjectedScene.Layout.flexible(maximumSize:)(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  *(_BYTE *)(a1 + 16) = 0;
}

uint64_t InjectedScene.Layout.description.getter()
{
  uint64_t v0;

  if ((*(_BYTE *)(v0 + 16) & 1) != 0)
    return 0x657263736C6C7566;
  sub_22AE5E0FC();
  type metadata accessor for CGSize(0);
  sub_22AE5E1E0();
  return 0;
}

BOOL static InjectedScene.Layout.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(a1 + 16) & 1) == 0)
    return (*(_BYTE *)(a2 + 16) & 1) == 0
        && *(double *)a1 == *(double *)a2
        && *(double *)(a1 + 8) == *(double *)(a2 + 8);
  return (*(_BYTE *)(a2 + 16) & 1) != 0;
}

uint64_t sub_22AE46860(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t result;
  double v5;
  _BOOL4 v6;

  v3 = *(_BYTE *)(a1 + 16);
  result = *(unsigned __int8 *)(a2 + 16);
  if ((v3 & 1) == 0)
  {
    if ((result & 1) != 0)
    {
      return 0;
    }
    else
    {
      v5 = *(double *)a1;
      v6 = *(double *)(a1 + 8) == *(double *)(a2 + 8);
      return v5 == *(double *)a2 && v6;
    }
  }
  return result;
}

uint64_t InjectedScene.sceneIdentifier.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_22AE468C8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t static InjectedScene.checkout(inRunningTarget:)()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6;
  id v7[2];

  v7[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_22AE5E0C0();
  v7[0] = 0;
  v2 = objc_msgSend(v0, sel_injectInRunningTarget_error_, v1, v7);

  v3 = v7[0];
  if (v2)
  {
    swift_allocObject();
    v4 = v3;
    return sub_22AE46AD4(v2);
  }
  else
  {
    v6 = v7[0];
    sub_22AE5DFE8();

    return swift_willThrow();
  }
}

uint64_t static InjectedScene.checkout(in:)(uint64_t a1)
{
  id v1;
  id v2;
  void *v3;
  id v4;
  id v6;
  id v7[2];

  v7[1] = *(id *)MEMORY[0x24BDAC8D0];
  v7[0] = 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_injectInProcess_error_, a1, v7);
  v2 = v7[0];
  if (v1)
  {
    v3 = v1;
    swift_allocObject();
    v4 = v2;
    return sub_22AE46AD4(v3);
  }
  else
  {
    v6 = v7[0];
    sub_22AE5DFE8();

    return swift_willThrow();
  }
}

uint64_t sub_22AE46AD4(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t (*v29)();
  _QWORD *v30;

  *(_QWORD *)(v1 + 56) = 0;
  *(_QWORD *)(v1 + 64) = 0;
  *(_WORD *)(v1 + 72) = 256;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53578);
  v3 = swift_allocObject();
  *(_DWORD *)(v3 + 24) = 0;
  v4 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v3 + 16) = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v1 + 80) = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53580);
  v5 = swift_allocObject();
  *(_DWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v1 + 88) = v5;
  v6 = swift_allocObject();
  *(_DWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 16) = v4;
  *(_QWORD *)(v1 + 96) = v6;
  v7 = swift_allocObject();
  *(_DWORD *)(v7 + 24) = 0;
  *(_QWORD *)(v7 + 16) = v4;
  *(_QWORD *)(v1 + 104) = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53588);
  v8 = swift_allocObject();
  *(_DWORD *)(v8 + 24) = 0;
  *(_QWORD *)(v8 + 16) = v4;
  *(_QWORD *)(v1 + 112) = v8;
  *(_QWORD *)(v1 + 32) = a1;
  v9 = a1;
  v10 = objc_msgSend(v9, sel_sceneIdentifier);
  v11 = sub_22AE5E0CC();
  v13 = v12;

  *(_QWORD *)(v1 + 16) = v11;
  *(_QWORD *)(v1 + 24) = v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53590);
  v14 = swift_allocObject();
  *(_DWORD *)(v14 + 40) = 0;
  v15 = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v14 + 16) = 1;
  *(_QWORD *)(v14 + 24) = v15;
  *(_DWORD *)(v14 + 32) = 0;
  *(_WORD *)(v14 + 36) = 1;
  *(_QWORD *)(v1 + 40) = v14;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53598);
  v17 = (_QWORD *)swift_allocObject();
  v17[4] = 0;
  v17[5] = 0;
  v17[2] = sub_22AE4ABF8;
  v17[3] = v16;
  *(_QWORD *)(v1 + 48) = v17;
  v29 = sub_22AE4AC0C;
  v30 = v17;
  v18 = MEMORY[0x24BDAC760];
  v25 = MEMORY[0x24BDAC760];
  v26 = 1107296256;
  v27 = sub_22AE47834;
  v28 = &block_descriptor_46;
  v19 = _Block_copy(&v25);
  v20 = v9;
  swift_retain();
  swift_release();
  objc_msgSend(v20, sel_setActionHandler_, v19);
  _Block_release(v19);
  v29 = sub_22AE4AC10;
  v30 = (_QWORD *)v1;
  v25 = v18;
  v26 = 1107296256;
  v27 = sub_22AE468C8;
  v28 = &block_descriptor_49;
  v21 = _Block_copy(&v25);
  swift_retain();
  swift_release();
  objc_msgSend(v20, sel_setInvalidationHandler_, v21);

  _Block_release(v21);
  v22 = *(_QWORD *)(v1 + 48);
  swift_beginAccess();
  v23 = *(_QWORD *)(v22 + 32);
  *(_QWORD *)(v22 + 32) = sub_22AE4AC14;
  *(_QWORD *)(v22 + 40) = v1;
  swift_retain();
  sub_22AE4A120(v23);
  return v1;
}

void sub_22AE46DAC(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unsigned __int8 v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  _QWORD *v22;
  NSObject *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  void *v29;
  uint64_t *v30;
  char v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  _QWORD *v40;
  _QWORD *v41;
  id v42;
  uint64_t v43;
  void *v44;
  _QWORD *v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  void (*v60)(_QWORD, _QWORD);
  uint64_t v61;
  id v62;
  uint64_t v63;
  void (*v64)(_QWORD, _QWORD);
  uint64_t v65;
  id v66[2];
  uint64_t v67;
  uint64_t v68[5];
  char v69;
  _BYTE v70[48];
  uint64_t v71;

  v3 = sub_22AE5E030();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v61 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)&v61 - v9;
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v61 - v11;
  swift_beginAccess();
  if (*(_QWORD *)(v1 + 32))
  {
    v64 = *(void (**)(_QWORD, _QWORD))(v1 + 32);
    v13 = *(_QWORD *)(v1 + 40);
    swift_retain();
    v14 = objc_msgSend(a1, sel_canSendResponse);
    v65 = v4;
    v63 = v13;
    if ((v14 & 1) != 0)
    {
      v15 = a1;
      v16 = a1;
    }
    else
    {
      v16 = 0;
    }
    v25 = sub_22AE4BAF0();
    v27 = v26;
    v62 = v16;
    swift_bridgeObjectRetain();
    v28 = _s18PreviewsServicesUI18ShellToHostMessageO0G4TypeO8rawValueAESgSS_tcfC_0();
    if (v28 == 7)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255B535B8);
      sub_22AE4AC6C(&qword_255B535C0, &qword_255B535B8, (uint64_t)&unk_22AE5FE24);
      v29 = (void *)swift_allocError();
      *v30 = v25;
      v30[1] = v27;
      swift_willThrow();
      v32 = v62;
      v33 = (void *)sub_22AE4BD48();
      objc_msgSend(v33, sel_invalidate);

      v34 = v29;
      sub_22AE5E018();
      v35 = v29;
      v36 = v29;
      v37 = sub_22AE5E024();
      v38 = sub_22AE5E138();
      if (os_log_type_enabled(v37, v38))
      {
        v61 = v3;
        v39 = (uint8_t *)swift_slowAlloc();
        v40 = (_QWORD *)swift_slowAlloc();
        v62 = v32;
        *(_DWORD *)v39 = 138543362;
        __swift_instantiateConcreteTypeFromMangledName(&qword_255B535A8);
        sub_22AE4AC6C(&qword_255B535B0, &qword_255B535A8, (uint64_t)&unk_22AE5FE64);
        swift_allocError();
        *v41 = v29;
        v42 = v29;
        v43 = _swift_stdlib_bridgeErrorToNSError();
        v71 = v43;
        v32 = v62;
        sub_22AE5E180();
        *v40 = v43;
        v3 = v61;

        _os_log_impl(&dword_22AE41000, v37, v38, "%{public}@", v39, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255B535A0);
        swift_arrayDestroy();
        MEMORY[0x22E2E9368](v40, -1, -1);
        MEMORY[0x22E2E9368](v39, -1, -1);
      }
      else
      {

      }
      (*(void (**)(char *, uint64_t))(v65 + 8))(v7, v3);
      if (v32)
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_255B535A8);
        sub_22AE4AC6C(&qword_255B535B0, &qword_255B535A8, (uint64_t)&unk_22AE5FE64);
        v44 = (void *)swift_allocError();
        *v45 = v29;
        v46 = v32;
        v47 = v29;
        v48 = v44;
        v49 = (void *)sub_22AE5DFDC();

        v50 = objc_msgSend((id)objc_opt_self(), sel_responseForError_, v49);
        sub_22AE4BE58((uint64_t)v50);

        sub_22AE4A120((uint64_t)v64);
        v51 = v44;
      }
      else
      {
        sub_22AE4A120((uint64_t)v64);

        v51 = v29;
      }

    }
    else
    {
      v31 = v28;
      swift_bridgeObjectRelease();
      sub_22AE4BD48();
      sub_22AE4BBEC();
      ShellToHostMessage.init(messageType:fenceHandle:payload:)(v31);
      sub_22AE5E018();
      sub_22AE4ACAC((uint64_t)v68, (uint64_t)v70);
      sub_22AE4AD04((uint64_t)v70, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22AE4ACE8);
      sub_22AE4AD04((uint64_t)v70, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22AE4ACE8);
      v52 = v62;
      v53 = v62;
      sub_22AE4AD04((uint64_t)v70, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22AE4ACE8);
      v54 = v53;
      v55 = sub_22AE5E024();
      v56 = sub_22AE5E12C();
      if (os_log_type_enabled(v55, v56))
      {
        v57 = swift_slowAlloc();
        v61 = swift_slowAlloc();
        v67 = v61;
        *(_DWORD *)v57 = 136446722;
        sub_22AE59790();
        v71 = sub_22AE53698(v58, v59, &v67);
        sub_22AE5E180();
        swift_bridgeObjectRelease();
        sub_22AE4AD04((uint64_t)v70, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22AE4AC50);
        *(_WORD *)(v57 + 12) = 2082;
        sub_22AE4ACAC((uint64_t)v70, (uint64_t)&v71);
        __asm { BR              X11 }
      }
      sub_22AE4AD04((uint64_t)v70, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22AE4AC50);
      sub_22AE4AD04((uint64_t)v70, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22AE4AC50);
      sub_22AE4AD04((uint64_t)v70, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_22AE4AC50);

      (*(void (**)(char *, uint64_t))(v65 + 8))(v10, v3);
      v66[0] = v52;
      v60 = v64;
      v64(v68, v66);
      sub_22AE4A120((uint64_t)v60);
      sub_22AE4AC50(v68[0], v68[1], v68[2], (void *)v68[3], (void *)v68[4], v69);

    }
  }
  else
  {
    sub_22AE5E018();
    v17 = a1;
    v18 = sub_22AE5E024();
    v19 = sub_22AE5E138();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v61 = v3;
      v22 = (_QWORD *)v21;
      v65 = v4;
      *(_DWORD *)v20 = 138543362;
      v71 = (uint64_t)v17;
      v23 = v17;
      v4 = v65;
      sub_22AE5E180();
      *v22 = v17;

      _os_log_impl(&dword_22AE41000, v18, v19, "Scene messenger has no receiver -- dropping message: %{public}@", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255B535A0);
      swift_arrayDestroy();
      v24 = v22;
      v3 = v61;
      MEMORY[0x22E2E9368](v24, -1, -1);
      MEMORY[0x22E2E9368](v20, -1, -1);
      v17 = v18;
    }
    else
    {

    }
    (*(void (**)(char *, uint64_t))(v4 + 8))(v12, v3);
  }
}

void sub_22AE47834(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

void sub_22AE47884()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t);
  uint64_t v8;

  v1 = *(_QWORD *)(v0 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 40));
  v2 = *(_QWORD *)(v1 + 24);
  if (v2)
  {
    *(_QWORD *)(v1 + 16) = 0;
    *(_QWORD *)(v1 + 24) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 40));
    v3 = *(_QWORD *)(v0 + 48);
    swift_beginAccess();
    v4 = *(_QWORD *)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;
    *(_QWORD *)(v3 + 40) = 0;
    sub_22AE4A120(v4);
    v5 = *(_QWORD *)(v2 + 16);
    if (v5)
    {
      swift_bridgeObjectRetain();
      v6 = v2 + 40;
      do
      {
        v7 = *(void (**)(uint64_t))(v6 - 8);
        v8 = swift_retain();
        v7(v8);
        swift_release();
        v6 += 16;
        --v5;
      }
      while (v5);
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 40));
  }
}

void sub_22AE47968(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_22AE5E030();
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = MEMORY[0x24BDAC7A8](v2);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  __asm { BR              X10 }
}

void sub_22AE47A5C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;

  if (v2)
  {
    v5 = v0;
    v6 = v2;
    sub_22AE490FC(v4, v2, 0);
    objc_msgSend(v6, sel_invalidate);
    sub_22AE4AC50(v5, v1, v3, v4, v2, 0);
  }
  else
  {
    sub_22AE490FC(v4, 0, 0);
  }
}

uint64_t sub_22AE481F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  double v9;
  double v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  id v15;
  void *v17;
  unsigned __int8 v18;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v9 = *(double *)a1;
  v10 = *(double *)(a1 + 8);
  v11 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)(v5 + 56) = *(_QWORD *)a1;
  *(double *)(v5 + 64) = v10;
  *(_WORD *)(v5 + 72) = v11;
  if ((v11 & 1) != 0)
  {
    v12 = *(void **)(v5 + 32);
    v21[0] = 0;
    v13 = objc_msgSend(v12, sel_setMaximizedWithParent_error_, a2, v21);
    v14 = (void *)v21[0];
    if ((v13 & 1) == 0)
    {
LABEL_3:
      v15 = v14;
      sub_22AE5DFE8();

      return swift_willThrow();
    }
  }
  else
  {
    v17 = *(void **)(v5 + 32);
    v21[0] = 0;
    v18 = objc_msgSend(v17, sel_setMinimizedWithParent_size_maximumSize_error_, a2, v21, v9, v10, v9, v10);
    v14 = (void *)v21[0];
    if ((v18 & 1) == 0)
      goto LABEL_3;
  }
  v19 = v14;
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = a4;
  *(_QWORD *)(v20 + 24) = a5;
  swift_retain();
  sub_22AE4839C(0, 0, 2, a3, (uint64_t)sub_22AE4A5D8, v20);
  return swift_release();
}

void sub_22AE4834C(id a1, char a2, void (*a3)(id, uint64_t))
{
  uint64_t v5;
  id v6;

  v5 = a2 & 1;
  if ((a2 & 1) != 0)
    v6 = a1;
  a3(a1, v5);
  sub_22AE4A944(a1, v5);
}

void sub_22AE4839C(void *a1, void *a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  NSObject *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  id v34;
  const char *v35;
  void *v36;
  id v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50[2];
  void *v51;
  char v52;

  v7 = v6;
  v45 = a5;
  v46 = a6;
  v43 = a4;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53550);
  MEMORY[0x24BDAC7A8](v11);
  v44 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_22AE5E030();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v38 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50[1] = (uint64_t)a1;
  v51 = a2;
  v52 = a3;
  sub_22AE5E018();
  sub_22AE4A8C4(a1, a2, a3);
  sub_22AE4A8C4(a1, a2, a3);
  sub_22AE4A8C4(a1, a2, a3);
  sub_22AE4A8C4(a1, a2, a3);
  v17 = sub_22AE5E024();
  v18 = sub_22AE5E12C();
  if (!os_log_type_enabled(v17, (os_log_type_t)v18))
  {
    sub_22AE4A8E0(a1, a2, a3);
    sub_22AE4A8E0(a1, a2, a3);
    sub_22AE4A8E0(a1, a2, a3);
    sub_22AE4A8E0(a1, a2, a3);

    (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
    goto LABEL_8;
  }
  v39 = v18;
  v41 = v7;
  v42 = v14;
  v40 = v13;
  v19 = swift_slowAlloc();
  v38 = swift_slowAlloc();
  v50[0] = v38;
  *(_DWORD *)v19 = 136446466;
  sub_22AE4A8C4(a1, a2, a3);
  v20 = sub_22AE59974();
  v22 = v21;
  sub_22AE4A8E0(a1, a2, a3);
  v48 = sub_22AE53698(v20, v22, v50);
  sub_22AE5E180();
  swift_bridgeObjectRelease();
  sub_22AE4A8E0(a1, a2, a3);
  sub_22AE4A8E0(a1, a2, a3);
  *(_WORD *)(v19 + 12) = 2082;
  if (!a3)
  {
    if (a2)
    {
      v48 = 0x3C6465636E6566;
      v49 = 0xE700000000000000;
      sub_22AE4A8C4(a1, a2, 0);
      v47 = objc_msgSend(a2, sel_fenceName);
      sub_22AE5E240();
      sub_22AE5E0FC();
      swift_bridgeObjectRelease();
      sub_22AE5E0FC();
      sub_22AE4A8E0(a1, a2, 0);
      v25 = v48;
      v23 = v49;
      v24 = v42;
      goto LABEL_7;
    }
    sub_22AE4A8E0(a1, 0, 0);
  }
  v23 = 0xE500000000000000;
  v24 = v42;
  v25 = 0x636E797361;
LABEL_7:
  v48 = sub_22AE53698(v25, v23, v50);
  sub_22AE5E180();
  swift_bridgeObjectRelease();
  sub_22AE4A8E0(a1, a2, a3);
  sub_22AE4A8E0(a1, a2, a3);
  _os_log_impl(&dword_22AE41000, v17, (os_log_type_t)v39, "Sending %{public}s (%{public}s, w/reply)", (uint8_t *)v19, 0x16u);
  v26 = v38;
  swift_arrayDestroy();
  MEMORY[0x22E2E9368](v26, -1, -1);
  MEMORY[0x22E2E9368](v19, -1, -1);

  (*(void (**)(char *, uint64_t))(v24 + 8))(v16, v40);
  v7 = v41;
LABEL_8:
  v28 = v45;
  v27 = v46;
  v29 = (uint64_t)v44;
  if (!v52)
  {
    v32 = 0xD000000000000013;
    v31 = v51;
    v30 = (void *)HostToShellMessage.payload.getter();
    v34 = v31;
    v35 = "preferencesResolved";
LABEL_13:
    v33 = (unint64_t)(v35 - 32) | 0x8000000000000000;
    goto LABEL_14;
  }
  if (v52 != 1)
  {
    v30 = (void *)HostToShellMessage.payload.getter();
    v31 = 0;
    v32 = 0xD000000000000026;
    v35 = "confirmReadyForDisplayAfterSceneResize";
    goto LABEL_13;
  }
  v30 = (void *)HostToShellMessage.payload.getter();
  v31 = 0;
  v32 = 0x6572617764726168;
  v33 = 0xED0000746E657645;
LABEL_14:
  sub_22AE4A8FC(v43, v29);
  sub_22AE4A000();
  swift_retain();
  v36 = (void *)sub_22AE5E15C();
  v37 = sub_22AE4C340(v32, v33, v30, v31, v29, v36, v28, v27);
  (*(void (**)(void))(v7 + 16))();

}

Swift::Void __swiftcall InjectedScene.ObservationToken.cancel()()
{
  os_unfair_lock_s **v0;
  uint64_t *v1;
  os_unfair_lock_s *v2;
  uint64_t (*v3)();
  uint64_t v4;
  uint64_t (*v5)();

  v1 = (uint64_t *)&(*v0)[4];
  v2 = *v0 + 8;
  os_unfair_lock_lock(v2);
  sub_22AE5C4D8(v1, &v5);
  os_unfair_lock_unlock(v2);
  v3 = v5;
  if (v5)
  {
    v4 = swift_retain();
    ((void (*)(uint64_t))v3)(v4);
    sub_22AE4A120((uint64_t)v3);
    sub_22AE4A120((uint64_t)v3);
  }
}

uint64_t InjectedScene.addSceneCrashedObserver(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v7 = *(_QWORD *)(v3 + 80);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  swift_retain();
  v9 = sub_22AE489A8((uint64_t)sub_22AE49F68, v8, v7);
  result = swift_release();
  *a3 = v9;
  return result;
}

uint64_t sub_22AE489A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  if (qword_255B53398 != -1)
    swift_once();
  v6 = (uint64_t *)(qword_255B53B38 + 16);
  v7 = (os_unfair_lock_s *)(qword_255B53B38 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_255B53B38 + 24));
  sub_22AE5C390(v6, &v12);
  os_unfair_lock_unlock(v7);
  v8 = v12;
  os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
  sub_22AE4A5E4((uint64_t *)(a3 + 16), v8, a1, a2, (uint64_t)&unk_24F539490, (uint64_t)sub_22AE4ABA0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22AE57C3C);
  os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 24));
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53560);
  v10 = swift_allocObject();
  *(_DWORD *)(v10 + 32) = 0;
  *(_QWORD *)(v10 + 16) = sub_22AE4AB78;
  *(_QWORD *)(v10 + 24) = v9;
  swift_retain();
  return v10;
}

uint64_t sub_22AE48AEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  if (qword_255B53398 != -1)
    swift_once();
  v6 = (uint64_t *)(qword_255B53B38 + 16);
  v7 = (os_unfair_lock_s *)(qword_255B53B38 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_255B53B38 + 24));
  sub_22AE5C390(v6, &v12);
  os_unfair_lock_unlock(v7);
  v8 = v12;
  os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
  sub_22AE4A5E4((uint64_t *)(a3 + 16), v8, a1, a2, (uint64_t)&unk_24F539440, (uint64_t)sub_22AE49F68, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22AE57C48);
  os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 24));
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53560);
  v10 = swift_allocObject();
  *(_DWORD *)(v10 + 32) = 0;
  *(_QWORD *)(v10 + 16) = sub_22AE4AB50;
  *(_QWORD *)(v10 + 24) = v9;
  swift_retain();
  return v10;
}

uint64_t sub_22AE48C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  if (qword_255B53398 != -1)
    swift_once();
  v6 = (uint64_t *)(qword_255B53B38 + 16);
  v7 = (os_unfair_lock_s *)(qword_255B53B38 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_255B53B38 + 24));
  sub_22AE5C390(v6, &v12);
  os_unfair_lock_unlock(v7);
  v8 = v12;
  os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
  sub_22AE4A5E4((uint64_t *)(a3 + 16), v8, a1, a2, (uint64_t)&unk_24F5393F0, (uint64_t)sub_22AE4A9E0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22AE57DB8);
  os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 24));
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53560);
  v10 = swift_allocObject();
  *(_DWORD *)(v10 + 32) = 0;
  *(_QWORD *)(v10 + 16) = sub_22AE4AB28;
  *(_QWORD *)(v10 + 24) = v9;
  swift_retain();
  return v10;
}

uint64_t sub_22AE48D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v6;
  os_unfair_lock_s *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  if (qword_255B53398 != -1)
    swift_once();
  v6 = (uint64_t *)(qword_255B53B38 + 16);
  v7 = (os_unfair_lock_s *)(qword_255B53B38 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_255B53B38 + 24));
  sub_22AE5C390(v6, &v12);
  os_unfair_lock_unlock(v7);
  v8 = v12;
  os_unfair_lock_lock((os_unfair_lock_t)(a3 + 24));
  sub_22AE4A5E4((uint64_t *)(a3 + 16), v8, a1, a2, (uint64_t)&unk_24F539378, (uint64_t)sub_22AE4A9E0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))sub_22AE57DC4);
  os_unfair_lock_unlock((os_unfair_lock_t)(a3 + 24));
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a3;
  *(_QWORD *)(v9 + 24) = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53560);
  v10 = swift_allocObject();
  *(_DWORD *)(v10 + 32) = 0;
  *(_QWORD *)(v10 + 16) = sub_22AE4A9B8;
  *(_QWORD *)(v10 + 24) = v9;
  swift_retain();
  return v10;
}

uint64_t InjectedScene.addSceneCrashedObserver(_:)@<X0>(void (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;

  v4 = v3;
  v8 = *(_QWORD *)(v4 + 40);
  v9 = (os_unfair_lock_s *)(v8 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(v8 + 40));
  v10 = *(unsigned int *)(v8 + 32);
  LOBYTE(v8) = *(_BYTE *)(v8 + 36);
  os_unfair_lock_unlock(v9);
  if ((v8 & 1) == 0)
    a1(v10);
  v11 = *(_QWORD *)(v4 + 80);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  swift_retain();
  v13 = sub_22AE489A8((uint64_t)sub_22AE49F88, v12, v11);
  result = swift_release();
  *a3 = v13;
  return result;
}

uint64_t InjectedScene.addSceneStoppedObserver(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v7 = *(_QWORD *)(v3 + 88);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  swift_retain();
  v9 = sub_22AE48AEC((uint64_t)sub_22AE49F68, v8, v7);
  result = swift_release();
  *a3 = v9;
  return result;
}

uint64_t sub_22AE48FF0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t InjectedScene.addSuppressedFeatureObserver(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;

  result = sub_22AE48C30(a1, a2, *(_QWORD *)(v3 + 112));
  *a3 = result;
  return result;
}

uint64_t InjectedScene.addZoomRequestObserver(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  v7 = *(_QWORD *)(v3 + 104);
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a1;
  *(_QWORD *)(v8 + 24) = a2;
  swift_retain();
  v9 = sub_22AE48AEC((uint64_t)sub_22AE4AEC0, v8, v7);
  result = swift_release();
  *a3 = v9;
  return result;
}

Swift::Void __swiftcall InjectedScene.sendHardwareEvent(_:)(UVHardwareEvent a1)
{
  objc_class *v2;

  v2 = a1.super.isa;
  sub_22AE490FC(a1.super.isa, 0, 1);

}

void sub_22AE490FC(void *a1, void *a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  const char *v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38[2];
  void *v39;
  unsigned __int8 v40;

  v4 = v3;
  v8 = sub_22AE5E030();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38[1] = (uint64_t)a1;
  v39 = a2;
  v40 = a3;
  sub_22AE5E018();
  sub_22AE4A8C4(a1, a2, a3);
  sub_22AE4A8C4(a1, a2, a3);
  sub_22AE4A8C4(a1, a2, a3);
  sub_22AE4A8C4(a1, a2, a3);
  v12 = sub_22AE5E024();
  v13 = sub_22AE5E12C();
  if (os_log_type_enabled(v12, (os_log_type_t)v13))
  {
    v31 = v13;
    v32 = v9;
    v33 = v8;
    v34 = v4;
    v14 = swift_slowAlloc();
    v30 = swift_slowAlloc();
    v38[0] = v30;
    *(_DWORD *)v14 = 136446466;
    sub_22AE4A8C4(a1, a2, a3);
    v15 = sub_22AE59974();
    v17 = v16;
    sub_22AE4A8E0(a1, a2, a3);
    v36 = sub_22AE53698(v15, v17, v38);
    sub_22AE5E180();
    swift_bridgeObjectRelease();
    sub_22AE4A8E0(a1, a2, a3);
    sub_22AE4A8E0(a1, a2, a3);
    *(_WORD *)(v14 + 12) = 2082;
    if (!a3)
    {
      if (a2)
      {
        v36 = 0x3C6465636E6566;
        v37 = 0xE700000000000000;
        sub_22AE4A8C4(a1, a2, 0);
        v35 = objc_msgSend(a2, sel_fenceName);
        sub_22AE5E240();
        sub_22AE5E0FC();
        swift_bridgeObjectRelease();
        sub_22AE5E0FC();
        sub_22AE4A8E0(a1, a2, 0);
        v19 = v36;
        v18 = v37;
LABEL_10:
        v36 = sub_22AE53698(v19, v18, v38);
        sub_22AE5E180();
        swift_bridgeObjectRelease();
        sub_22AE4A8E0(a1, a2, a3);
        sub_22AE4A8E0(a1, a2, a3);
        _os_log_impl(&dword_22AE41000, v12, (os_log_type_t)v31, "Sending %{public}s (%{public}s, one-way)", (uint8_t *)v14, 0x16u);
        v26 = v30;
        swift_arrayDestroy();
        MEMORY[0x22E2E9368](v26, -1, -1);
        MEMORY[0x22E2E9368](v14, -1, -1);

        (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v33);
        v4 = v34;
        v20 = v40;
        if (!v40)
          goto LABEL_11;
        goto LABEL_5;
      }
      sub_22AE4A8E0(a1, 0, 0);
    }
    v18 = 0xE500000000000000;
    v19 = 0x636E797361;
    goto LABEL_10;
  }
  sub_22AE4A8E0(a1, a2, a3);
  sub_22AE4A8E0(a1, a2, a3);
  sub_22AE4A8E0(a1, a2, a3);
  sub_22AE4A8E0(a1, a2, a3);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v20 = v40;
  if (!v40)
  {
LABEL_11:
    v23 = 0xD000000000000013;
    v22 = v39;
    v21 = (void *)HostToShellMessage.payload.getter();
    v27 = v22;
    v25 = "preferencesResolved";
    goto LABEL_12;
  }
LABEL_5:
  if (v20 != 1)
  {
    v21 = (void *)HostToShellMessage.payload.getter();
    v22 = 0;
    v23 = 0xD000000000000026;
    v25 = "confirmReadyForDisplayAfterSceneResize";
LABEL_12:
    v24 = (unint64_t)(v25 - 32) | 0x8000000000000000;
    goto LABEL_13;
  }
  v21 = (void *)HostToShellMessage.payload.getter();
  v22 = 0;
  v23 = 0x6572617764726168;
  v24 = 0xED0000746E657645;
LABEL_13:
  v28 = objc_allocWithZone((Class)type metadata accessor for UVPreviewSceneAction());
  v29 = sub_22AE4B63C(v23, v24, v21, v22, 0);
  (*(void (**)(void))(v4 + 16))();

}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> InjectedScene.checkout()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char v9;

  v2 = v0;
  v3 = *(os_unfair_lock_s **)(v0 + 40);
  v4 = v3 + 4;
  v5 = v3 + 10;
  os_unfair_lock_lock(v3 + 10);
  sub_22AE4963C(v4, &v9);
  if (v1)
  {
    os_unfair_lock_unlock(v5);
    __break(1u);
  }
  else
  {
    os_unfair_lock_unlock(v5);
    if ((v9 & 1) == 0)
    {
      v7 = *(_QWORD *)(v2 + 16);
      v6 = *(_QWORD *)(v2 + 24);
      sub_22AE49FAC();
      swift_allocError();
      *v8 = v7;
      v8[1] = v6;
      swift_bridgeObjectRetain();
      swift_willThrow();
    }
  }
}

uint64_t sub_22AE4963C@<X0>(_QWORD *a1@<X0>, char *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  char v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;

  v4 = sub_22AE5E030();
  v5 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1[1])
  {
    sub_22AE5E018();
    v10 = sub_22AE5E024();
    v11 = sub_22AE5E138();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_22AE41000, v10, v11, "Can't checkout invalidated scene", v12, 2u);
      MEMORY[0x22E2E9368](v12, -1, -1);
    }

    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v9 = 0;
    goto LABEL_7;
  }
  if (!__OFADD__(*a1, 1))
  {
    ++*a1;
    v9 = 1;
LABEL_7:
    *a2 = v9;
    return result;
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall InjectedScene.relinquish()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  os_unfair_lock_s *v9;
  uint64_t *v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t aBlock[7];

  v1 = v0;
  v2 = sub_22AE5E054();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_22AE5E06C();
  v6 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(os_unfair_lock_s **)(v0 + 40);
  v10 = (uint64_t *)&v9[4];
  v11 = v9 + 10;
  os_unfair_lock_lock(v9 + 10);
  sub_22AE49A30(v10, aBlock);
  os_unfair_lock_unlock(v11);
  v12 = aBlock[0];
  if (aBlock[0])
  {
    v13 = (void *)objc_opt_self();
    swift_retain_n();
    if (objc_msgSend(v13, sel_isMainThread))
    {
      objc_msgSend(*(id *)(v1 + 32), sel_invalidate);
    }
    else
    {
      sub_22AE4A000();
      v23 = sub_22AE5E15C();
      aBlock[4] = (uint64_t)sub_22AE49FF0;
      aBlock[5] = v1;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_22AE468C8;
      aBlock[3] = (uint64_t)&block_descriptor;
      v14 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      sub_22AE5E060();
      aBlock[0] = MEMORY[0x24BEE4AF8];
      sub_22AE4A054();
      v22 = v3;
      __swift_instantiateConcreteTypeFromMangledName(&qword_255B53448);
      sub_22AE4AC6C(&qword_255B53450, &qword_255B53448, MEMORY[0x24BEE12C8]);
      sub_22AE5E1A4();
      v15 = (void *)v23;
      MEMORY[0x22E2E8C6C](0, v8, v5, v14);
      _Block_release(v14);

      (*(void (**)(char *, uint64_t))(v22 + 8))(v5, v2);
      (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v24);
    }
    swift_release_n();
    v16 = *(_QWORD *)(v1 + 48);
    swift_beginAccess();
    v17 = *(_QWORD *)(v16 + 32);
    *(_QWORD *)(v16 + 32) = 0;
    *(_QWORD *)(v16 + 40) = 0;
    sub_22AE4A120(v17);
    v18 = *(_QWORD *)(v12 + 16);
    if (v18)
    {
      swift_bridgeObjectRetain();
      v19 = v12 + 40;
      do
      {
        v20 = *(void (**)(uint64_t))(v19 - 8);
        v21 = swift_retain();
        v20(v21);
        swift_release();
        v19 += 16;
        --v18;
      }
      while (v18);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_22AE49A30@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;

  v4 = sub_22AE5E030();
  v5 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1[1];
  if (!v9)
  {
    sub_22AE5E018();
    v11 = sub_22AE5E024();
    v12 = sub_22AE5E138();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_22AE41000, v11, v12, "Can't relinquish invalidated scene", v13, 2u);
      MEMORY[0x22E2E9368](v13, -1, -1);
    }

    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v9 = 0;
    goto LABEL_9;
  }
  v10 = *a1 - 1;
  if (!__OFSUB__(*a1, 1))
  {
    if (v10 <= 0)
    {
      *a1 = 0;
      a1[1] = 0;
    }
    else
    {
      v9 = 0;
      *a1 = v10;
    }
LABEL_9:
    *a2 = v9;
    return result;
  }
  __break(1u);
  return result;
}

void InjectedScene.onInvalidation(_:)(void (*a1)(void), uint64_t a2)
{
  uint64_t v2;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  os_unfair_lock_s *v7;
  char v8;

  v5 = *(os_unfair_lock_s **)(v2 + 40);
  v6 = v5 + 4;
  v7 = v5 + 10;
  os_unfair_lock_lock(v5 + 10);
  sub_22AE49BE8(v6, (uint64_t)a1, a2, &v8);
  os_unfair_lock_unlock(v7);
  if ((v8 & 1) == 0)
    a1();
}

_QWORD *sub_22AE49BE8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>)
{
  _QWORD *v5;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  char v14;

  v5 = (_QWORD *)result[1];
  if (v5)
  {
    v8 = result;
    v9 = *result;
    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = a2;
    *(_QWORD *)(v10 + 24) = a3;
    swift_bridgeObjectRetain();
    swift_retain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v5 = sub_22AE4A7B8(0, v5[2] + 1, 1, v5);
    v12 = v5[2];
    v11 = v5[3];
    if (v12 >= v11 >> 1)
      v5 = sub_22AE4A7B8((_QWORD *)(v11 > 1), v12 + 1, 1, v5);
    v5[2] = v12 + 1;
    v13 = &v5[2 * v12];
    v13[4] = sub_22AE4AA14;
    v13[5] = v10;
    result = (_QWORD *)swift_bridgeObjectRelease();
    *v8 = v9;
    v8[1] = v5;
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }
  *a4 = v14;
  return result;
}

uint64_t sub_22AE49CF4(uint64_t (*a1)(void))
{
  return a1();
}

unint64_t sub_22AE49D14()
{
  sub_22AE5E1BC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();
  return 0xD000000000000026;
}

unint64_t sub_22AE49DB0()
{
  return sub_22AE49D14();
}

uint64_t sub_22AE49DBC()
{
  return -7201;
}

uint64_t sub_22AE49DC4()
{
  return sub_22AE5D130();
}

uint64_t sub_22AE49DCC()
{
  sub_22AE4A550();
  return sub_22AE5E294();
}

uint64_t sub_22AE49DF4()
{
  sub_22AE4A550();
  return sub_22AE5E288();
}

uint64_t sub_22AE49E1C(uint64_t result)
{
  if ((*(_BYTE *)(result + 21) & 1) != 0)
  {
    sub_22AE4A950();
    swift_allocError();
    return swift_willThrow();
  }
  else
  {
    *(_BYTE *)(result + 21) = 1;
  }
  return result;
}

void sub_22AE49E78(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 40));
  *(_BYTE *)(v1 + 37) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 40));
}

BOOL static InjectedScene.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t InjectedScene.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t InjectedScene.__deallocating_deinit()
{
  InjectedScene.deinit();
  return swift_deallocClassInstance();
}

BOOL sub_22AE49F30(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22AE49F44()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22AE49F68()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_22AE49F88(unsigned int *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

unint64_t sub_22AE49FAC()
{
  unint64_t result;

  result = qword_255B53430;
  if (!qword_255B53430)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F250, &type metadata for InjectedScene.Invalidated);
    atomic_store(result, (unint64_t *)&qword_255B53430);
  }
  return result;
}

id sub_22AE49FF0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 32), sel_invalidate);
}

unint64_t sub_22AE4A000()
{
  unint64_t result;

  result = qword_255B53438;
  if (!qword_255B53438)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255B53438);
  }
  return result;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_22AE4A054()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255B53440;
  if (!qword_255B53440)
  {
    v1 = sub_22AE5E054();
    result = MEMORY[0x22E2E92D8](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_255B53440);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2E92C0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E2E92CC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_22AE4A120(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for InjectedScene()
{
  return objc_opt_self();
}

uint64_t method lookup function for InjectedScene()
{
  return swift_lookUpClassMethod();
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for InjectedScene.Layout.Value(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for InjectedScene.Layout(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 17) = v3;
  return result;
}

ValueMetadata *type metadata accessor for InjectedScene.Layout()
{
  return &type metadata for InjectedScene.Layout;
}

ValueMetadata *type metadata accessor for InjectedScene.ObservationToken()
{
  return &type metadata for InjectedScene.ObservationToken;
}

uint64_t storeEnumTagSinglePayload for InjectedScene.Layout.Value(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 17) = v3;
  return result;
}

uint64_t sub_22AE4A20C(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_22AE4A22C(uint64_t result, int a2)
{
  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    *(_BYTE *)(result + 16) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for InjectedScene.Layout.Value()
{
  return &type metadata for InjectedScene.Layout.Value;
}

uint64_t sub_22AE4A260(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_WORD *)(a1 + 20) = *(_WORD *)(a2 + 20);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for InjectedScene.State(uint64_t a1, uint64_t a2)
{
  int v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_DWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 21) = *(_BYTE *)(a2 + 21);
  return a1;
}

__n128 __swift_memcpy22_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_QWORD *)(a1 + 14) = *(_QWORD *)(a2 + 14);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for InjectedScene.State(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_DWORD *)(a1 + 16) = *(_DWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 20) = *(_BYTE *)(a2 + 20);
  *(_BYTE *)(a1 + 21) = *(_BYTE *)(a2 + 21);
  return a1;
}

uint64_t getEnumTagSinglePayload for InjectedScene.State(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 22))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for InjectedScene.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_WORD *)(result + 20) = 0;
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 22) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 22) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for InjectedScene.State()
{
  return &type metadata for InjectedScene.State;
}

_QWORD *initializeBufferWithCopyOfBuffer for InjectedScene.Invalidated(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for InjectedScene.Invalidated()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithTake for InjectedScene.Invalidated(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InjectedScene.Invalidated(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InjectedScene.Invalidated(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InjectedScene.Invalidated()
{
  return &type metadata for InjectedScene.Invalidated;
}

unint64_t sub_22AE4A524(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_22AE4A550();
  result = sub_22AE4A594();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_22AE4A550()
{
  unint64_t result;

  result = qword_255B53540;
  if (!qword_255B53540)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F17C, &type metadata for InjectedScene.Invalidated);
    atomic_store(result, (unint64_t *)&qword_255B53540);
  }
  return result;
}

unint64_t sub_22AE4A594()
{
  unint64_t result;

  result = qword_255B53548;
  if (!qword_255B53548)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F1BC, &type metadata for InjectedScene.Invalidated);
    atomic_store(result, (unint64_t *)&qword_255B53548);
  }
  return result;
}

void sub_22AE4A5D8(void *a1, char a2)
{
  uint64_t v2;

  sub_22AE4834C(a1, a2 & 1, *(void (**)(id, uint64_t))(v2 + 16));
}

uint64_t sub_22AE4A5E4(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v13;
  uint64_t isUniquelyReferenced_nonNull_native;
  uint64_t v16;

  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a3;
  *(_QWORD *)(v13 + 24) = a4;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v16 = *a1;
  *a1 = 0x8000000000000000;
  a7(a6, v13, a2, isUniquelyReferenced_nonNull_native);
  *a1 = v16;
  return swift_bridgeObjectRelease();
}

void sub_22AE4A69C(os_unfair_lock_s *a1, uint64_t a2, void (*a3)(void), void (*a4)(unint64_t, uint64_t))
{
  uint64_t *v7;
  os_unfair_lock_s *v8;

  v7 = (uint64_t *)&a1[4];
  v8 = a1 + 6;
  os_unfair_lock_lock(a1 + 6);
  sub_22AE4A704(v7, a2, a3, a4);
  os_unfair_lock_unlock(v8);
}

unint64_t sub_22AE4A704(uint64_t *a1, uint64_t a2, void (*a3)(void), void (*a4)(unint64_t, uint64_t))
{
  unint64_t result;
  char v8;
  unint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;

  result = sub_22AE56E64(a2);
  if ((v8 & 1) != 0)
  {
    v9 = result;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *a1;
    v12 = *a1;
    *a1 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      a3();
      v11 = v12;
    }
    a4(v9, v11);
    *a1 = v11;
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

_QWORD *sub_22AE4A7B8(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255B53568);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_22AE4AA1C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

id sub_22AE4A8C4(id result, void *a2, char a3)
{
  if (a3)
  {
    if (a3 != 1)
      return result;
    a2 = result;
  }
  return a2;
}

void sub_22AE4A8E0(void *a1, void *a2, char a3)
{
  if (a3)
  {
    if (a3 != 1)
      return;
    a2 = a1;
  }

}

uint64_t sub_22AE4A8FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53550);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_22AE4A944(id a1, char a2)
{
  if ((a2 & 1) != 0)

}

unint64_t sub_22AE4A950()
{
  unint64_t result;

  result = qword_255B53558;
  if (!qword_255B53558)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F2AC, &type metadata for InjectedScene.AlreadyHostedError);
    atomic_store(result, (unint64_t *)&qword_255B53558);
  }
  return result;
}

uint64_t sub_22AE4A994()
{
  swift_release();
  return swift_deallocObject();
}

void sub_22AE4A9B8()
{
  uint64_t v0;

  sub_22AE4A69C(*(os_unfair_lock_s **)(v0 + 16), *(_QWORD *)(v0 + 24), (void (*)(void))sub_22AE5845C, (void (*)(unint64_t, uint64_t))sub_22AE5790C);
}

uint64_t sub_22AE4A9E0(char *a1)
{
  uint64_t v1;
  uint64_t (*v2)(char *);
  char v4;

  v2 = *(uint64_t (**)(char *))(v1 + 16);
  v4 = *a1;
  return v2(&v4);
}

uint64_t sub_22AE4AA14()
{
  uint64_t v0;

  return sub_22AE49CF4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_22AE4AA1C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255B53570);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_22AE5E228();
  __break(1u);
  return result;
}

void sub_22AE4AB28()
{
  uint64_t v0;

  sub_22AE4A69C(*(os_unfair_lock_s **)(v0 + 16), *(_QWORD *)(v0 + 24), (void (*)(void))sub_22AE582C8, (void (*)(unint64_t, uint64_t))sub_22AE5790C);
}

void sub_22AE4AB50()
{
  uint64_t v0;

  sub_22AE4A69C(*(os_unfair_lock_s **)(v0 + 16), *(_QWORD *)(v0 + 24), (void (*)(void))sub_22AE582BC, (void (*)(unint64_t, uint64_t))sub_22AE5790C);
}

void sub_22AE4AB78()
{
  uint64_t v0;

  sub_22AE4A69C(*(os_unfair_lock_s **)(v0 + 16), *(_QWORD *)(v0 + 24), (void (*)(void))sub_22AE582B0, (void (*)(unint64_t, uint64_t))sub_22AE5790C);
}

uint64_t sub_22AE4ABA0(int *a1)
{
  uint64_t v1;
  uint64_t (*v2)(int *);
  int v4;

  v2 = *(uint64_t (**)(int *))(v1 + 16);
  v4 = *a1;
  return v2(&v4);
}

uint64_t sub_22AE4ABD4()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_22AE4ABF8(uint64_t a1)
{
  uint64_t v1;

  return objc_msgSend(*(id *)(v1 + 16), sel_sendAction_, a1);
}

void sub_22AE4AC14(uint64_t a1)
{
  uint64_t v1;
  char v2;
  __int128 v3;
  _OWORD v4[2];
  uint64_t v5;
  char v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_BYTE *)(a1 + 40);
  v3 = *(_OWORD *)(a1 + 16);
  v4[0] = *(_OWORD *)a1;
  v4[1] = v3;
  v5 = v1;
  v6 = v2;
  sub_22AE47968((uint64_t)v4);
}

void sub_22AE4AC50(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, char a6)
{
  if (a6)
  {
    if (a6 != 1)
      return;
    a5 = a4;
  }

}

uint64_t sub_22AE4AC6C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E2E92D8](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22AE4ACAC(uint64_t a1, uint64_t a2)
{
  __swift_memcpy41_8(a2, a1);
  return a2;
}

id sub_22AE4ACE8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, char a6)
{
  id result;

  if (a6)
  {
    if (a6 != 1)
      return result;
    a5 = a4;
  }
  return a5;
}

uint64_t sub_22AE4AD04(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
  return a1;
}

ValueMetadata *type metadata accessor for InjectedScene.AlreadyHostedError()
{
  return &type metadata for InjectedScene.AlreadyHostedError;
}

_QWORD *_s18PreviewsServicesUI13InjectedSceneC5StateV6StatusOwca_0(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for InjectedScene.State.Status(uint64_t a1, unsigned int a2)
{
  unint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for InjectedScene.State.Status(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

uint64_t sub_22AE4AE30(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_22AE4AE48(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for InjectedScene.State.Status()
{
  return &type metadata for InjectedScene.State.Status;
}

uint64_t sub_22AE4AEC8(char a1)
{
  return *(_QWORD *)&aMessagetpayloa[8 * a1];
}

uint64_t sub_22AE4AEE8(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[2];
  __int128 v9;
  uint64_t v10;

  sub_22AE4C77C(a1, (uint64_t)&v9);
  v4 = MEMORY[0x24BEE0D00];
  if ((swift_dynamicCast() & 1) != 0)
    return *(_QWORD *)&v8[0];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53610);
  *(_QWORD *)&v9 = v4;
  sub_22AE4C77C(a1, (uint64_t)v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53618);
  sub_22AE4C7B8();
  swift_allocError();
  v7 = v6;
  *(_BYTE *)v6 = a2;
  sub_22AE4C700(&v9, (_OWORD *)(v6 + 8));
  sub_22AE4C700(v8, (_OWORD *)(v7 + 40));
  return swift_willThrow();
}

uint64_t sub_22AE4AFCC(uint64_t a1, char a2, unint64_t *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  _OWORD v13[2];
  __int128 v14;
  uint64_t v15;

  sub_22AE4C77C(a1, (uint64_t)&v14);
  v9 = sub_22AE4C744(0, a3);
  if ((swift_dynamicCast() & 1) != 0)
    return *(_QWORD *)&v13[0];
  v15 = __swift_instantiateConcreteTypeFromMangledName(a5);
  *(_QWORD *)&v14 = v9;
  sub_22AE4C77C(a1, (uint64_t)v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53618);
  sub_22AE4C7B8();
  swift_allocError();
  v12 = v11;
  *(_BYTE *)v11 = a2;
  sub_22AE4C700(&v14, (_OWORD *)(v11 + 8));
  sub_22AE4C700(v13, (_OWORD *)(v12 + 40));
  return swift_willThrow();
}

uint64_t sub_22AE4B0CC(uint64_t a1, char a2)
{
  unint64_t *v3;
  __objc2_class **v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  uint64_t v12;
  _OWORD v13[2];

  if (a2)
  {
    if (a2 == 1)
    {
      v3 = &qword_255B53608;
      v4 = (__objc2_class **)0x24BE78718;
      v12 = sub_22AE4C744(0, &qword_255B53608);
      v5 = &qword_255B53628;
      v6 = a1;
      v7 = 1;
    }
    else
    {
      v3 = &qword_255B535F8;
      v4 = off_24F5384B8;
      v12 = sub_22AE4C744(0, &qword_255B535F8);
      v5 = &qword_255B53630;
      v6 = a1;
      v7 = 2;
    }
    *(_QWORD *)&v11 = sub_22AE4AFCC(v6, v7, v3, (uint64_t)v4, v5);
  }
  else
  {
    v12 = MEMORY[0x24BEE0D00];
    *(_QWORD *)&v11 = sub_22AE4AEE8(a1, 0);
    *((_QWORD *)&v11 + 1) = v8;
  }
  sub_22AE4C700(&v11, v13);
  *(_QWORD *)&v11 = 0;
  *((_QWORD *)&v11 + 1) = 0xE000000000000000;
  sub_22AE5E1E0();
  v9 = v11;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  return v9;
}

BOOL sub_22AE4B254(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22AE4B268()
{
  sub_22AE5E2D0();
  sub_22AE5E2DC();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE4B2AC()
{
  return sub_22AE5E2DC();
}

uint64_t sub_22AE4B2D4()
{
  sub_22AE5E2D0();
  sub_22AE5E2DC();
  return sub_22AE5E2F4();
}

uint64_t *sub_22AE4B314@<X0>(uint64_t *result@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  v2 = *result;
  if ((unint64_t)*result >= 3)
    LOBYTE(v2) = 3;
  *a2 = v2;
  return result;
}

void sub_22AE4B32C(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_22AE4B338()
{
  char *v0;

  return sub_22AE4AEC8(*v0);
}

void sub_22AE4B340(void *a1, void (*a2)(id, uint64_t))
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  id v11;
  __int128 v12;
  _OWORD v13[2];

  v4 = objc_msgSend(a1, sel_error);
  if (v4)
  {
    v5 = v4;
    v11 = v4;
    a2(v5, 1);

    return;
  }
  v6 = objc_msgSend(a1, sel_info);
  if (!v6)
    goto LABEL_7;
  v7 = v6;
  if (!objc_msgSend(v6, sel_objectForSetting_, 1))
  {

LABEL_7:
    v10 = sub_22AE4B508(MEMORY[0x24BEE4AF8]);
    v8 = 0;
    goto LABEL_8;
  }
  sub_22AE5E198();
  swift_unknownObjectRelease();
  sub_22AE4C700(&v12, v13);
  v8 = (void *)sub_22AE4AFCC((uint64_t)v13, 1, &qword_255B53608, 0x24BE78718, &qword_255B53628);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);

  v9 = objc_msgSend(v8, sel_dictionary);
  v10 = sub_22AE5E0B4();

LABEL_8:
  a2((id)v10, 0);
  swift_bridgeObjectRelease();

}

unint64_t sub_22AE4B508(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53638);
  v2 = sub_22AE5E21C();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22AE4C86C(v6, (uint64_t)&v15, &qword_255B53640);
    v7 = v15;
    v8 = v16;
    result = sub_22AE56E00(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_22AE4C700(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

id sub_22AE4B63C(uint64_t a1, uint64_t a2, id a3, void *a4, void *a5)
{
  void *v5;
  void *v6;
  objc_class *ObjectType;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  objc_super v19;
  uint64_t v20;
  uint64_t v21;

  v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType();
  v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BE40]), sel_init);
  v20 = a1;
  v21 = a2;
  swift_bridgeObjectRetain();
  objc_msgSend(v13, sel_setObject_forSetting_, sub_22AE5E270(), 0);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  if (a3)
  {
    v14 = objc_allocWithZone(MEMORY[0x24BE78718]);
    v15 = (void *)sub_22AE5E0A8();
    swift_bridgeObjectRelease();
    a3 = objc_msgSend(v14, sel_initWithDictionary_, v15);

  }
  objc_msgSend(v13, sel_setObject_forSetting_, a3, 1);

  objc_msgSend(v13, sel_setObject_forSetting_, a4, 2);
  v19.receiver = v6;
  v19.super_class = ObjectType;
  v16 = v13;
  v17 = objc_msgSendSuper2(&v19, sel_initWithInfo_responder_, v16, a5);

  return v17;
}

id sub_22AE4B7E8(void *a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v7, *a4, a3);
}

id UVPreviewSceneAction.__allocating_init(info:timeout:forResponseOn:withHandler:)(void *a1, void *a2, uint64_t a3, uint64_t a4, double a5)
{
  objc_class *v5;
  objc_class *v6;
  void *v10;
  id v11;
  _QWORD v13[6];

  v6 = v5;
  if (a3)
  {
    v13[4] = a3;
    v13[5] = a4;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 1107296256;
    v13[2] = sub_22AE47834;
    v13[3] = &block_descriptor_0;
    v10 = _Block_copy(v13);
    swift_release();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithInfo_timeout_forResponseOnQueue_withHandler_, a1, a2, v10, a5);

  _Block_release(v10);
  return v11;
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

void UVPreviewSceneAction.init(info:timeout:forResponseOn:withHandler:)()
{
  sub_22AE5E1F8();
  __break(1u);
}

void static UVPreviewSceneAction.new()()
{
  sub_22AE5E1F8();
  __break(1u);
}

id UVPreviewSceneAction.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void UVPreviewSceneAction.init()()
{
  sub_22AE5E1F8();
  __break(1u);
}

uint64_t sub_22AE4BAF0()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  _BYTE *v5;
  __int128 v7;
  _OWORD v8[2];

  v2 = v1;
  v3 = objc_msgSend(v0, sel_info);
  v4 = v3;
  if (!v3)
    goto LABEL_5;
  if (!objc_msgSend(v3, sel_objectForSetting_, 0))
  {

    LOBYTE(v4) = 1;
LABEL_5:
    sub_22AE4C8B0();
    swift_allocError();
    *v5 = (_BYTE)v4;
    swift_willThrow();
    return v2;
  }
  sub_22AE5E198();
  swift_unknownObjectRelease();
  sub_22AE4C700(&v7, v8);
  v2 = sub_22AE4AEE8((uint64_t)v8, 0);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);

  return v2;
}

unint64_t sub_22AE4BBEC()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  id v4;
  _BYTE *v5;
  __int128 v7;
  _OWORD v8[2];

  v2 = objc_msgSend(v0, sel_info);
  if (!v2)
  {
    sub_22AE4C8B0();
    swift_allocError();
    *v5 = 0;
    swift_willThrow();
    return (unint64_t)v0;
  }
  v0 = v2;
  if (objc_msgSend(v2, sel_objectForSetting_, 1))
  {
    sub_22AE5E198();
    swift_unknownObjectRelease();
    sub_22AE4C700(&v7, v8);
    v3 = (void *)sub_22AE4AFCC((uint64_t)v8, 1, &qword_255B53608, 0x24BE78718, &qword_255B53628);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);

    if (!v1)
    {
      v4 = objc_msgSend(v3, sel_dictionary);
      v0 = (void *)sub_22AE5E0B4();

    }
    return (unint64_t)v0;
  }

  return sub_22AE4B508(MEMORY[0x24BEE4AF8]);
}

uint64_t sub_22AE4BD48()
{
  void *v0;
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v7;
  __int128 v8;
  _OWORD v9[2];

  v2 = objc_msgSend(v0, sel_info);
  if (v2)
  {
    v3 = v2;
    if (objc_msgSend(v2, sel_objectForSetting_, 2))
    {
      sub_22AE5E198();
      swift_unknownObjectRelease();
      sub_22AE4C700(&v8, v9);
      v4 = sub_22AE4AFCC((uint64_t)v9, 2, &qword_255B535F8, (uint64_t)off_24F5384B8, &qword_255B53630);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);

      if (v1)
        return v5;
      else
        return v4;
    }
    else
    {

      return 0;
    }
  }
  else
  {
    sub_22AE4C8B0();
    swift_allocError();
    *v7 = 0;
    return swift_willThrow();
  }
}

id sub_22AE4BE58(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  NSObject *v13;
  _QWORD *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  NSObject *v18;

  v2 = v1;
  v4 = sub_22AE5E030();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (objc_msgSend(v2, sel_canSendResponse))
    return objc_msgSend(v2, sel_sendResponse_, a1);
  sub_22AE5E018();
  v9 = v2;
  v10 = sub_22AE5E024();
  v11 = sub_22AE5E144();
  if (os_log_type_enabled(v10, v11))
  {
    v17 = v4;
    v12 = (uint8_t *)swift_slowAlloc();
    v16 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138543362;
    v18 = v9;
    v13 = v9;
    sub_22AE5E180();
    v14 = v16;
    *v16 = v9;

    v4 = v17;
    _os_log_impl(&dword_22AE41000, v10, v11, "Attempt to reply to invalid or one-way scene action: '%{public}@'", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255B535A0);
    swift_arrayDestroy();
    MEMORY[0x22E2E9368](v14, -1, -1);
    MEMORY[0x22E2E9368](v12, -1, -1);
  }
  else
  {

    v10 = v9;
  }

  return (id)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

Swift::String_optional __swiftcall UVPreviewSceneAction.keyDescription(forSetting:)(Swift::Int forSetting)
{
  Swift::Int v1;
  uint64_t v2;
  void *v3;
  Swift::String_optional result;

  if ((unint64_t)forSetting > 2)
  {
    v2 = 0;
    v3 = 0;
  }
  else
  {
    v1 = 8 * forSetting;
    v2 = *(_QWORD *)&aMessagetpayloa[8 * forSetting];
    v3 = *(void **)&aFencehanype[v1 + 8];
  }
  result.value._object = v3;
  result.value._countAndFlagsBits = v2;
  return result;
}

uint64_t UVPreviewSceneAction.valueDescription(for:object:ofSetting:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  return sub_22AE4C638(a2, a3);
}

BOOL sub_22AE4C1A0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

unint64_t sub_22AE4C1B8()
{
  _BYTE *v0;

  if (*v0)
    return 0xD00000000000003FLL;
  else
    return 0xD000000000000037;
}

uint64_t sub_22AE4C1F8()
{
  char *v0;

  return sub_22AE5D24C(*v0);
}

uint64_t sub_22AE4C200()
{
  sub_22AE4CD00();
  return sub_22AE5E294();
}

uint64_t sub_22AE4C228()
{
  sub_22AE4CD00();
  return sub_22AE5E288();
}

id UVPreviewSceneAction.__allocating_init(info:responder:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithInfo_responder_, a1, a2);

  return v5;
}

void UVPreviewSceneAction.init(info:responder:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id UVPreviewSceneAction.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_22AE4C340(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  char *v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  _QWORD aBlock[6];

  v39 = a3;
  v40 = a4;
  v37 = a1;
  v38 = a2;
  v36 = sub_22AE5E090();
  v34 = *(_QWORD *)(v36 - 8);
  v12 = MEMORY[0x24BDAC7A8](v36);
  v14 = (char *)&v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v35 = (char *)&v34 - v15;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53550);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v34 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_22AE5E048();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v34 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = a7;
  *(_QWORD *)(v23 + 24) = a8;
  aBlock[4] = sub_22AE4C828;
  aBlock[5] = v23;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_22AE47834;
  aBlock[3] = &block_descriptor_3;
  v24 = _Block_copy(aBlock);
  v25 = (void *)objc_opt_self();
  v41 = a8;
  swift_retain();
  v26 = objc_msgSend(v25, sel_responderWithHandler_, v24);
  _Block_release(v24);
  swift_release();
  v42 = a6;
  objc_msgSend(v26, sel_setQueue_, a6);
  v43 = a5;
  sub_22AE4C86C(a5, (uint64_t)v18, &qword_255B53550);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
    sub_22AE4C830((uint64_t)v18, &qword_255B53550);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v22, v18, v19);
    sub_22AE5E078();
    v27 = v35;
    MEMORY[0x22E2E8BA0](v14, v22);
    v28 = *(void (**)(char *, uint64_t))(v34 + 8);
    v29 = v36;
    v28(v14, v36);
    objc_msgSend(v26, sel_setTimeout_, sub_22AE5E084());
    v28(v27, v29);
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  }
  v30 = objc_allocWithZone((Class)type metadata accessor for UVPreviewSceneAction());
  v31 = v26;
  v32 = sub_22AE4B63C(v37, v38, v39, v40, v26);

  swift_release();
  sub_22AE4C830(v43, &qword_255B53550);
  return v32;
}

uint64_t sub_22AE4C638(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  __int128 v5;
  uint64_t v6;
  _OWORD v7[2];

  sub_22AE4C86C(a1, (uint64_t)&v5, &qword_255B535F0);
  if (v6)
  {
    sub_22AE4C700(&v5, v7);
    if (a2 > 2)
      v3 = 0;
    else
      v3 = sub_22AE4B0CC((uint64_t)v7, a2);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  }
  else
  {
    sub_22AE4C830((uint64_t)&v5, &qword_255B535F0);
    return 0;
  }
  return v3;
}

uint64_t type metadata accessor for UVPreviewSceneAction()
{
  return objc_opt_self();
}

uint64_t method lookup function for UVPreviewSceneAction()
{
  return swift_lookUpClassMethod();
}

_OWORD *sub_22AE4C700(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t __swift_deallocate_boxed_opaque_existential_0(uint64_t result)
{
  if ((*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 24) - 8) + 80) & 0x20000) != 0)
    JUMPOUT(0x22E2E9368);
  return result;
}

uint64_t sub_22AE4C744(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_22AE4C77C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_22AE4C7B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255B53620;
  if (!qword_255B53620)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255B53618);
    result = MEMORY[0x22E2E92D8](&unk_22AE5EFC8, v1);
    atomic_store(result, (unint64_t *)&qword_255B53620);
  }
  return result;
}

uint64_t sub_22AE4C804()
{
  swift_release();
  return swift_deallocObject();
}

void sub_22AE4C828(void *a1)
{
  uint64_t v1;

  sub_22AE4B340(a1, *(void (**)(id, uint64_t))(v1 + 16));
}

uint64_t sub_22AE4C830(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22AE4C86C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_22AE4C8B0()
{
  unint64_t result;

  result = qword_255B53648;
  if (!qword_255B53648)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F538, &type metadata for UVPreviewSceneAction.MissingData);
    atomic_store(result, (unint64_t *)&qword_255B53648);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UVPreviewSceneAction.MissingData(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for UVPreviewSceneAction.MissingData(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_22AE4C9DC + 4 * byte_22AE5F2F5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22AE4CA10 + 4 * byte_22AE5F2F0[v4]))();
}

uint64_t sub_22AE4CA10(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE4CA18(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22AE4CA20);
  return result;
}

uint64_t sub_22AE4CA2C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22AE4CA34);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22AE4CA38(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE4CA40(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE4CA4C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22AE4CA54(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for UVPreviewSceneAction.MissingData()
{
  return &type metadata for UVPreviewSceneAction.MissingData;
}

uint64_t getEnumTagSinglePayload for UVPreviewSceneAction.Key(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for UVPreviewSceneAction.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_22AE4CB4C + 4 * byte_22AE5F2FF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22AE4CB80 + 4 * byte_22AE5F2FA[v4]))();
}

uint64_t sub_22AE4CB80(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE4CB88(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22AE4CB90);
  return result;
}

uint64_t sub_22AE4CB9C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22AE4CBA4);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22AE4CBA8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE4CBB0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_22AE4CBBC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UVPreviewSceneAction.Key()
{
  return &type metadata for UVPreviewSceneAction.Key;
}

uint64_t sub_22AE4CBD4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22AE4CCD0(a1, a2, a3, (uint64_t (*)(void))sub_22AE4CBE8, (uint64_t (*)(void))sub_22AE4CC2C);
}

unint64_t sub_22AE4CBE8()
{
  unint64_t result;

  result = qword_255B53650;
  if (!qword_255B53650)
  {
    result = MEMORY[0x22E2E92D8]("ɤm$8?", &type metadata for UVPreviewSceneAction.Key);
    atomic_store(result, (unint64_t *)&qword_255B53650);
  }
  return result;
}

unint64_t sub_22AE4CC2C()
{
  unint64_t result;

  result = qword_255B53658;
  if (!qword_255B53658)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F3AC, &type metadata for UVPreviewSceneAction.Key);
    atomic_store(result, (unint64_t *)&qword_255B53658);
  }
  return result;
}

unint64_t sub_22AE4CC74()
{
  unint64_t result;

  result = qword_255B53660;
  if (!qword_255B53660)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F424, &type metadata for UVPreviewSceneAction.Key);
    atomic_store(result, (unint64_t *)&qword_255B53660);
  }
  return result;
}

uint64_t sub_22AE4CCBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22AE4CCD0(a1, a2, a3, (uint64_t (*)(void))sub_22AE4CD00, (uint64_t (*)(void))sub_22AE4CD44);
}

uint64_t sub_22AE4CCD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void), uint64_t (*a5)(void))
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = a4();
  result = a5();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_22AE4CD00()
{
  unint64_t result;

  result = qword_255B53668;
  if (!qword_255B53668)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F44C, &type metadata for UVPreviewSceneAction.MissingData);
    atomic_store(result, (unint64_t *)&qword_255B53668);
  }
  return result;
}

unint64_t sub_22AE4CD44()
{
  unint64_t result;

  result = qword_255B53670;
  if (!qword_255B53670)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F48C, &type metadata for UVPreviewSceneAction.MissingData);
    atomic_store(result, (unint64_t *)&qword_255B53670);
  }
  return result;
}

unint64_t sub_22AE4CD8C()
{
  unint64_t result;

  result = qword_255B53678;
  if (!qword_255B53678)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F510, &type metadata for UVPreviewSceneAction.MissingData);
    atomic_store(result, (unint64_t *)&qword_255B53678);
  }
  return result;
}

void sub_22AE4CDD8(uint64_t a1)
{
  os_unfair_lock_s *v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  void (*v12)(uint64_t);
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  int64_t v16;

  v2 = (os_unfair_lock_s *)(a1 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
  v3 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v2);
  v4 = 0;
  v5 = v3 + 64;
  v6 = 1 << *(_BYTE *)(v3 + 32);
  v7 = -1;
  if (v6 < 64)
    v7 = ~(-1 << v6);
  v8 = v7 & *(_QWORD *)(v3 + 64);
  v9 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      v10 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v11 = v10 | (v4 << 6);
      goto LABEL_5;
    }
    v14 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v9)
      goto LABEL_23;
    v15 = *(_QWORD *)(v5 + 8 * v14);
    ++v4;
    if (!v15)
    {
      v4 = v14 + 1;
      if (v14 + 1 >= v9)
        goto LABEL_23;
      v15 = *(_QWORD *)(v5 + 8 * v4);
      if (!v15)
      {
        v4 = v14 + 2;
        if (v14 + 2 >= v9)
          goto LABEL_23;
        v15 = *(_QWORD *)(v5 + 8 * v4);
        if (!v15)
        {
          v4 = v14 + 3;
          if (v14 + 3 >= v9)
            goto LABEL_23;
          v15 = *(_QWORD *)(v5 + 8 * v4);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v8 = (v15 - 1) & v15;
    v11 = __clz(__rbit64(v15)) + (v4 << 6);
LABEL_5:
    v12 = *(void (**)(uint64_t))(*(_QWORD *)(v3 + 56) + 16 * v11);
    v13 = swift_retain();
    v12(v13);
    swift_release();
  }
  v16 = v14 + 4;
  if (v16 >= v9)
  {
LABEL_23:
    swift_release();
    return;
  }
  v15 = *(_QWORD *)(v5 + 8 * v16);
  if (v15)
  {
    v4 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v4 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v4 >= v9)
      goto LABEL_23;
    v15 = *(_QWORD *)(v5 + 8 * v4);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
}

void sub_22AE4CF50(int a1, uint64_t a2)
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  void (*v13)(int *);
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  int v17;

  v17 = a1;
  v3 = (os_unfair_lock_s *)(a2 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 24));
  v4 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v3);
  v5 = 0;
  v6 = v4 + 64;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(v4 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v10)
      goto LABEL_23;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v14 + 1;
      if (v14 + 1 >= v10)
        goto LABEL_23;
      v15 = *(_QWORD *)(v6 + 8 * v5);
      if (!v15)
      {
        v5 = v14 + 2;
        if (v14 + 2 >= v10)
          goto LABEL_23;
        v15 = *(_QWORD *)(v6 + 8 * v5);
        if (!v15)
        {
          v5 = v14 + 3;
          if (v14 + 3 >= v10)
            goto LABEL_23;
          v15 = *(_QWORD *)(v6 + 8 * v5);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v9 = (v15 - 1) & v15;
    v12 = __clz(__rbit64(v15)) + (v5 << 6);
LABEL_5:
    v13 = *(void (**)(int *))(*(_QWORD *)(v4 + 56) + 16 * v12);
    swift_retain();
    v13(&v17);
    swift_release();
  }
  v16 = v14 + 4;
  if (v16 >= v10)
  {
LABEL_23:
    swift_release();
    return;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v5 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v10)
      goto LABEL_23;
    v15 = *(_QWORD *)(v6 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
}

void sub_22AE4D0D8(char a1, uint64_t a2)
{
  os_unfair_lock_s *v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  void (*v13)(char *);
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  char v17;

  v17 = a1;
  v3 = (os_unfair_lock_s *)(a2 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(a2 + 24));
  v4 = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  os_unfair_lock_unlock(v3);
  v5 = 0;
  v6 = v4 + 64;
  v7 = 1 << *(_BYTE *)(v4 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(v4 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }
    v14 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v14 >= v10)
      goto LABEL_23;
    v15 = *(_QWORD *)(v6 + 8 * v14);
    ++v5;
    if (!v15)
    {
      v5 = v14 + 1;
      if (v14 + 1 >= v10)
        goto LABEL_23;
      v15 = *(_QWORD *)(v6 + 8 * v5);
      if (!v15)
      {
        v5 = v14 + 2;
        if (v14 + 2 >= v10)
          goto LABEL_23;
        v15 = *(_QWORD *)(v6 + 8 * v5);
        if (!v15)
        {
          v5 = v14 + 3;
          if (v14 + 3 >= v10)
            goto LABEL_23;
          v15 = *(_QWORD *)(v6 + 8 * v5);
          if (!v15)
            break;
        }
      }
    }
LABEL_22:
    v9 = (v15 - 1) & v15;
    v12 = __clz(__rbit64(v15)) + (v5 << 6);
LABEL_5:
    v13 = *(void (**)(char *))(*(_QWORD *)(v4 + 56) + 16 * v12);
    swift_retain();
    v13(&v17);
    swift_release();
  }
  v16 = v14 + 4;
  if (v16 >= v10)
  {
LABEL_23:
    swift_release();
    return;
  }
  v15 = *(_QWORD *)(v6 + 8 * v16);
  if (v15)
  {
    v5 = v16;
    goto LABEL_22;
  }
  while (1)
  {
    v5 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v5 >= v10)
      goto LABEL_23;
    v15 = *(_QWORD *)(v6 + 8 * v5);
    ++v16;
    if (v15)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
}

uint64_t sub_22AE4D260()
{
  uint64_t v0;
  char v1;

  v1 = *(_BYTE *)(v0 + 16);
  sub_22AE5E1BC();
  sub_22AE5E0FC();
  if ((v1 & 1) == 0)
  {
    sub_22AE5E0FC();
    type metadata accessor for CGSize(0);
    sub_22AE5E1E0();
  }
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();
  return 0;
}

uint64_t sub_22AE4D380()
{
  uint64_t v0;

  return sub_22AE5D328(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16));
}

uint64_t sub_22AE4D38C()
{
  sub_22AE50968();
  return sub_22AE5E294();
}

uint64_t sub_22AE4D3B4()
{
  sub_22AE50968();
  return sub_22AE5E288();
}

void sub_22AE4D3DC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

Swift::Void __swiftcall SceneHostingViewController.ObservationToken.cancel()()
{
  os_unfair_lock_s **v0;
  uint64_t *v1;
  os_unfair_lock_s *v2;
  uint64_t (*v3)();
  uint64_t v4;
  uint64_t (*v5)();

  v1 = (uint64_t *)&(*v0)[4];
  v2 = *v0 + 8;
  os_unfair_lock_lock(v2);
  sub_22AE5C4D8(v1, &v5);
  os_unfair_lock_unlock(v2);
  v3 = v5;
  if (v5)
  {
    v4 = swift_retain();
    ((void (*)(uint64_t))v3)(v4);
    sub_22AE4A120((uint64_t)v3);
    sub_22AE4A120((uint64_t)v3);
  }
}

uint64_t sub_22AE4D480@<X0>(_QWORD *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)();

  v3 = (uint64_t *)(*a1 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler);
  swift_beginAccess();
  v4 = *v3;
  v5 = v3[1];
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_22AE49F68;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = (uint64_t (*)())v6;
  return sub_22AE503C0(v4);
}

uint64_t sub_22AE4D514(uint64_t *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)();
  uint64_t *v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_22AE4AA14;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = (uint64_t *)(*a2 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler);
  swift_beginAccess();
  v8 = *v7;
  *v7 = (uint64_t)v6;
  v7[1] = v5;
  sub_22AE503C0(v3);
  return sub_22AE4A120(v8);
}

uint64_t SceneHostingViewController.deactivatedHandler.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler);
  swift_beginAccess();
  v2 = *v1;
  sub_22AE503C0(*v1);
  return v2;
}

uint64_t SceneHostingViewController.deactivatedHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;

  v5 = (uint64_t *)(v2 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a1;
  v5[1] = a2;
  return sub_22AE4A120(v6);
}

uint64_t (*SceneHostingViewController.deactivatedHandler.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t SceneHostingViewController.isUserActivePreview.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview);
  swift_beginAccess();
  return *v1;
}

void SceneHostingViewController.isUserActivePreview.setter(char a1)
{
  char *v1;
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  id v6;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = &v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview];
  swift_beginAccess();
  *v4 = a1;
  if ((a1 & 1) == 0)
  {
    v7.receiver = v1;
    v7.super_class = ObjectType;
    if ((objc_msgSendSuper2(&v7, sel_resignFirstResponder) & 1) != 0)
    {
      v5 = *(_QWORD *)&v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus];
      swift_retain();
      sub_22AE4D0D8(0, v5);
      swift_release();
    }
  }
  if (*v4 == 1)
  {
    v6 = objc_msgSend(v1, sel_traitCollection);
    objc_msgSend(v6, sel_activeAppearance);

  }
}

Swift::Bool __swiftcall SceneHostingViewController.resignFirstResponder()()
{
  return sub_22AE4DFE0((SEL *)&selRef_resignFirstResponder, 0);
}

void (*SceneHostingViewController.isUserActivePreview.modify(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t ObjectType;
  uint64_t v5;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  v3[5] = v1;
  ObjectType = swift_getObjectType();
  v5 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview;
  v3[6] = ObjectType;
  v3[7] = v5;
  swift_beginAccess();
  return sub_22AE4D864;
}

void sub_22AE4D864(uint64_t *a1, char a2)
{
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = *a1;
  swift_endAccess();
  if ((a2 & 1) == 0)
  {
    v4 = *(_BYTE **)(v3 + 40);
    if ((v4[*(_QWORD *)(v3 + 56)] & 1) != 0)
      goto LABEL_6;
    v5 = *(_QWORD *)(v3 + 48);
    *(_QWORD *)(v3 + 24) = v4;
    *(_QWORD *)(v3 + 32) = v5;
    if ((objc_msgSendSuper2((objc_super *)(v3 + 24), sel_resignFirstResponder) & 1) != 0)
    {
      v6 = *(_QWORD *)(*(_QWORD *)(v3 + 40)
                     + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus);
      swift_retain();
      sub_22AE4D0D8(0, v6);
      swift_release();
    }
    v4 = *(_BYTE **)(v3 + 40);
    if (v4[*(_QWORD *)(v3 + 56)] == 1)
    {
LABEL_6:
      v7 = objc_msgSend(v4, sel_traitCollection);
      objc_msgSend(v7, sel_activeAppearance);

    }
  }
  free((void *)v3);
}

unint64_t sub_22AE4D92C()
{
  sub_22AE5E1BC();
  swift_bridgeObjectRelease();
  sub_22AE5E240();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  return 0xD00000000000001CLL;
}

uint64_t SceneHostingViewController.readyForDisplay.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_readyForDisplay);
  swift_beginAccess();
  return *v1;
}

void SceneHostingViewController.layout.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  char v4;
  char v5;

  v2 = *(_QWORD *)(v1 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host);
  if (v2)
  {
    v3 = *(_OWORD *)(v2 + 56);
    v4 = *(_BYTE *)(v2 + 72);
    v5 = *(_BYTE *)(v2 + 73);
  }
  else
  {
    v4 = 0;
    v3 = 0uLL;
    v5 = 1;
  }
  *(_OWORD *)a1 = v3;
  *(_BYTE *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 17) = v5;
}

uint64_t SceneHostingViewController.sceneSize.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host);
  if (!v1)
    return 0;
  objc_msgSend(*(id *)(v1 + 32), sel_sceneSize);
  return v2;
}

BOOL SceneHostingViewController.activated.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host) != 0;
}

uint64_t SceneHostingViewController.observeFirstResponderStatus(_:)@<X0>(void (*a1)(id)@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  char *v3;
  char *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;

  v4 = v3;
  a1(objc_msgSend(v4, sel_isFirstResponder));
  v8 = *(_QWORD *)&v4[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus];
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  swift_retain();
  swift_retain();
  v10 = sub_22AE48D74((uint64_t)sub_22AE503F4, v9, v8);
  swift_release();
  result = swift_release();
  *a3 = v10;
  return result;
}

Swift::Void __swiftcall SceneHostingViewController.viewDidLoad()()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  objc_super v4;

  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v4, sel_viewDidLoad);
  v1 = objc_msgSend(v0, sel_view);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend((id)objc_opt_self(), sel_systemBackgroundColor);
    objc_msgSend(v2, sel_setBackgroundColor_, v3);

  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall SceneHostingViewController.viewDidLayoutSubviews()()
{
  char *v0;
  id v1;
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = v0;
  v12.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v12, sel_viewDidLayoutSubviews);
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host])
  {
    v1 = *(id *)&v0[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host + 8];
    v2 = objc_msgSend(v0, sel_view);
    if (v2)
    {
      v3 = v2;
      objc_msgSend(v2, sel_bounds);
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;

      objc_msgSend(v1, sel_setFrame_, v5, v7, v9, v11);
    }
    else
    {
      __break(1u);
    }
  }
}

Swift::Void __swiftcall SceneHostingViewController.viewDidAppear(_:)(Swift::Bool a1)
{
  char *v1;
  char *v3;
  id v4;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  objc_msgSendSuper2(&v5, sel_viewDidAppear_, a1);
  v3 = &v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview];
  swift_beginAccess();
  if (*v3 == 1)
  {
    v4 = objc_msgSend(v1, sel_traitCollection);
    objc_msgSend(v4, sel_activeAppearance);

  }
}

uint64_t SceneHostingViewController.canBecomeFirstResponder.getter()
{
  uint64_t v0;
  unsigned __int8 *v1;

  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host))
    return 0;
  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview);
  swift_beginAccess();
  return *v1;
}

Swift::Bool __swiftcall SceneHostingViewController.becomeFirstResponder()()
{
  return sub_22AE4DFE0((SEL *)&selRef_becomeFirstResponder, 1);
}

id sub_22AE4DFE0(SEL *a1, char a2)
{
  char *v2;
  char *v5;
  id v6;
  uint64_t v7;
  objc_super v9;

  v5 = v2;
  v9.receiver = v2;
  v9.super_class = (Class)swift_getObjectType();
  v6 = objc_msgSendSuper2(&v9, *a1);
  if ((_DWORD)v6)
  {
    v7 = *(_QWORD *)&v5[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus];
    swift_retain();
    sub_22AE4D0D8(a2 & 1, v7);
    swift_release();
  }
  return v6;
}

id sub_22AE4E080(void *a1, uint64_t a2, const char **a3, char a4)
{
  const char *v6;
  char *v7;
  id v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)swift_getObjectType();
  v6 = *a3;
  v7 = (char *)v11.receiver;
  v8 = objc_msgSendSuper2(&v11, v6);
  if ((_DWORD)v8)
  {
    v9 = *(_QWORD *)&v7[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus];
    swift_retain();
    sub_22AE4D0D8(a4 & 1, v9);

    swift_release();
  }
  else
  {

  }
  return v8;
}

Swift::Void __swiftcall SceneHostingViewController.traitCollectionDidChange(_:)(UITraitCollection_optional a1)
{
  char *v1;
  char *v2;
  id v3;

  v2 = &v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview];
  swift_beginAccess();
  if (*v2 == 1)
  {
    v3 = objc_msgSend(v1, sel_traitCollection);
    objc_msgSend(v3, sel_activeAppearance);

  }
}

id sub_22AE4E228()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;
  uint64_t v31;
  uint64_t v32;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = sub_22AE5E030();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v27 - v7;
  v9 = &v0[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview];
  swift_beginAccess();
  if (*v9 == 1)
  {
    sub_22AE5E018();
    v10 = v0;
    v11 = sub_22AE5E024();
    v12 = sub_22AE5E12C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v29 = v2;
      v15 = v14;
      v32 = v14;
      *(_DWORD *)v13 = 136446210;
      v28 = v3;
      v16 = sub_22AE4D92C();
      v31 = sub_22AE53698(v16, v17, &v32);
      sub_22AE5E180();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22AE41000, v11, v12, "%{public}s: honoring key status request from agent; becoming first responder",
        v13,
        0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E2E9368](v15, -1, -1);
      MEMORY[0x22E2E9368](v13, -1, -1);

      (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v29);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    }
    v30.receiver = v10;
    v30.super_class = ObjectType;
    result = objc_msgSendSuper2(&v30, sel_becomeFirstResponder);
    if ((_DWORD)result)
    {
      v26 = *(_QWORD *)&v10[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus];
      swift_retain();
      sub_22AE4D0D8(1, v26);
      return (id)swift_release();
    }
  }
  else
  {
    sub_22AE5E018();
    v18 = v0;
    v19 = sub_22AE5E024();
    v20 = sub_22AE5E12C();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v32 = v22;
      v29 = v2;
      *(_DWORD *)v21 = 136446210;
      v23 = sub_22AE4D92C();
      v31 = sub_22AE53698(v23, v24, &v32);
      sub_22AE5E180();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22AE41000, v19, v20, "%{public}s: ignoring key status request from agent (not user active preview)", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x22E2E9368](v22, -1, -1);
      MEMORY[0x22E2E9368](v21, -1, -1);

      return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v29);
    }
    else
    {

      return (id)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
    }
  }
  return result;
}

uint64_t SceneHostingViewController.activate(injectedScene:parentScene:layout:timeout:completion:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD, uint64_t), uint64_t a6)
{
  void *v6;
  uint64_t v8;
  void (**v9)(char *, uint64_t);
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  NSObject *v16;
  os_log_type_t v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  void (**v26)(char *, uint64_t);
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  os_unfair_lock_s *v31;
  uint64_t *v32;
  void (*v33)(void *, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void (**v48)(char *, uint64_t);
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  void (**v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void (**v65)(char *, uint64_t);
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  void (*v71)(_QWORD, uint64_t);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  unint64_t v79;
  char v80;

  v73 = a6;
  v71 = a5;
  v63 = a2;
  v64 = a4;
  v66 = a1;
  v8 = sub_22AE5E030();
  v9 = *(void (***)(char *, uint64_t))(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v62 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)a3;
  v13 = *(_QWORD *)(a3 + 8);
  v14 = *(unsigned __int8 *)(a3 + 16);
  sub_22AE5E018();
  v15 = v6;
  v16 = sub_22AE5E024();
  v17 = sub_22AE5E150();
  v18 = os_log_type_enabled(v16, v17);
  v68 = v14;
  v69 = v15;
  v70 = v12;
  v67 = v13;
  if (v18)
  {
    v65 = v9;
    v72 = v8;
    v19 = swift_slowAlloc();
    v20 = v15;
    v21 = swift_slowAlloc();
    v74 = v21;
    *(_DWORD *)v19 = 136446466;
    v22 = sub_22AE4D92C();
    v78 = sub_22AE53698(v22, v23, &v74);
    sub_22AE5E180();

    LOBYTE(v14) = v68;
    swift_bridgeObjectRelease();
    *(_WORD *)(v19 + 12) = 2082;
    if ((v14 & 1) != 0)
    {
      v24 = 0xEA00000000006E65;
      v25 = 0x657263736C6C7566;
    }
    else
    {
      v78 = 0;
      v79 = 0xE000000000000000;
      sub_22AE5E0FC();
      v75 = v70;
      v76 = v67;
      type metadata accessor for CGSize(0);
      sub_22AE5E1E0();
      v25 = v78;
      v24 = v79;
    }
    v26 = v65;
    v78 = sub_22AE53698(v25, v24, &v74);
    sub_22AE5E180();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22AE41000, v16, v17, "%{public}s: activating with layout '%{public}s'", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x22E2E9368](v21, -1, -1);
    MEMORY[0x22E2E9368](v19, -1, -1);

    v26[1](v11, v72);
    v15 = v69;
  }
  else
  {

    v9[1](v11, v8);
  }
  v27 = &v15[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_readyForDisplay];
  swift_beginAccess();
  *v27 = 0;
  v28 = qword_255B53398;
  v29 = v73;
  swift_retain();
  if (v28 != -1)
    swift_once();
  v30 = (uint64_t *)(qword_255B53B38 + 16);
  v31 = (os_unfair_lock_s *)(qword_255B53B38 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_255B53B38 + 24));
  sub_22AE5C390(v30, &v75);
  v65 = 0;
  os_unfair_lock_unlock(v31);
  v72 = v75;
  v80 = v14;
  v32 = (uint64_t *)&v15[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest];
  v33 = *(void (**)(void *, uint64_t))&v15[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest
                                                   + 32];
  if (v33)
  {
    v35 = v32[2];
    v34 = v32[3];
    v37 = *v32;
    v36 = v32[1];
    sub_22AE50418();
    v38 = (void *)swift_allocError();
    *(_QWORD *)v39 = v36;
    *(_QWORD *)(v39 + 8) = v35;
    *(_BYTE *)(v39 + 16) = v34 & 1;
    swift_retain();
    v33(v38, 1);
    v29 = v73;

    sub_22AE5045C(v37, v36, v35, v34, (uint64_t)v33);
    v40 = v32[4];
  }
  else
  {
    v40 = 0;
  }
  v41 = *v32;
  v42 = v32[1];
  v43 = v32[2];
  v44 = v32[3];
  v45 = v70;
  *v32 = v72;
  v32[1] = v45;
  v47 = v67;
  v46 = v68;
  v32[2] = v67;
  v32[3] = v46;
  v32[4] = (uint64_t)v71;
  v32[5] = v29;
  swift_retain();
  sub_22AE5045C(v41, v42, v43, v44, v40);
  v48 = v65;
  v49 = v69;
  sub_22AE4EB04(v66);
  if (v48)
  {
    if (v32[4] && *v32 == v72)
    {
      v55 = v48;
      v71(v48, 1);
      v56 = *v32;
      v57 = v32[1];
      v58 = v32[2];
      v59 = v32[3];
      v60 = v32[4];
      *(_OWORD *)v32 = 0u;
      *((_OWORD *)v32 + 1) = 0u;
      *((_OWORD *)v32 + 2) = 0u;
      sub_22AE5045C(v56, v57, v58, v59, v60);

    }
  }
  else
  {
    v50 = v70;
    v75 = v70;
    v76 = v47;
    v77 = v46;
    v51 = swift_allocObject();
    v52 = v72;
    *(_QWORD *)(v51 + 16) = v49;
    *(_QWORD *)(v51 + 24) = v52;
    *(_QWORD *)(v51 + 32) = v50;
    *(_QWORD *)(v51 + 40) = v47;
    *(_BYTE *)(v51 + 48) = v80;
    *(_DWORD *)(v51 + 49) = v74;
    *(_DWORD *)(v51 + 52) = *(_DWORD *)((char *)&v74 + 3);
    v53 = v73;
    *(_QWORD *)(v51 + 56) = v71;
    *(_QWORD *)(v51 + 64) = v53;
    v54 = v49;
    swift_retain();
    sub_22AE481F8((uint64_t)&v75, v63, v64, (uint64_t)sub_22AE50498, v51);
    swift_release();
  }
  return swift_release();
}

void sub_22AE4EB04(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t *v10;
  _QWORD *v11;
  BOOL v12;
  os_unfair_lock_s *v13;
  os_unfair_lock_s *v14;
  os_unfair_lock_s *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  os_unfair_lock_s *v31;
  NSObject *v32;
  os_log_type_t v33;
  int v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t v39;
  os_unfair_lock_s *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  id v44;
  os_unfair_lock_s *v45;
  uint64_t v46;
  char *v47;
  char *v48;
  int v49;
  void *v50;
  id v51;
  void *v52;
  os_unfair_lock_s *v53;
  os_unfair_lock_s *v54;
  void *v55;
  uint64_t v56;
  os_unfair_lock_s *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  id v62[4];

  v3 = v1;
  v62[3] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = sub_22AE5E030();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (uint64_t *)&v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  v11 = *(_QWORD **)&v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  if (v11)
    v12 = v11 == a1;
  else
    v12 = 0;
  if (v12)
    return;
  v60 = v7;
  sub_22AE4F828();
  v13 = (os_unfair_lock_s *)a1[5];
  v14 = v13 + 4;
  v15 = v13 + 10;
  os_unfair_lock_lock(v13 + 10);
  v16 = 0;
  sub_22AE4963C(v14, (char *)v62);
  if (v2)
  {
LABEL_21:
    os_unfair_lock_unlock(v15);
    __break(1u);
    swift_release();

    os_unfair_lock_unlock(v14);
    __break(1u);
    return;
  }
  os_unfair_lock_unlock(v15);
  if (((uint64_t)v62[0] & 1) == 0)
  {
    v42 = a1[2];
    v41 = a1[3];
    sub_22AE49FAC();
    swift_allocError();
    *v43 = v42;
    v43[1] = v41;
    swift_bridgeObjectRetain();
    swift_willThrow();
    return;
  }
  os_unfair_lock_lock(v15);
  sub_22AE49E1C((uint64_t)v14);
  os_unfair_lock_unlock(v15);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53560);
  v17 = swift_allocObject();
  *(_DWORD *)(v17 + 32) = 0;
  *(_QWORD *)(v17 + 16) = sub_22AE50AD4;
  *(_QWORD *)(v17 + 24) = a1;
  v59 = v17;
  v18 = (void *)objc_opt_self();
  v19 = a1[4];
  v62[0] = 0;
  swift_retain();
  v20 = objc_msgSend(v18, sel_createWithInjectedScene_error_, v19, v62);
  v21 = v62[0];
  if (!v20)
  {
    v44 = v62[0];
    sub_22AE5DFE8();

    swift_willThrow();
    swift_release();
    return;
  }
  v53 = v14;
  v54 = v15;
  v58 = v20;
  v22 = swift_allocObject();
  *(_QWORD *)(v22 + 16) = v3;
  v56 = a1[12];
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = sub_22AE50B00;
  *(_QWORD *)(v23 + 24) = v22;
  v57 = v3;
  swift_retain();
  v24 = v21;
  v16 = (void *)sub_22AE48AEC((uint64_t)sub_22AE50B20, v23, v56);
  swift_release();
  swift_release();
  v25 = *v10;
  v14 = (os_unfair_lock_s *)v10[2];
  v55 = (void *)v10[1];
  v56 = v25;
  v27 = v58;
  v26 = v59;
  *v10 = (uint64_t)a1;
  v10[1] = (uint64_t)v27;
  v10[2] = (uint64_t)v16;
  v10[3] = v26;
  swift_retain();
  swift_retain();
  v52 = v16;
  swift_retain();
  v28 = v27;
  sub_22AE50A38(v56, v55);
  v15 = v57;
  v29 = -[os_unfair_lock_s view](v57, sel_view);
  if (!v29)
  {
    __break(1u);
    goto LABEL_21;
  }
  v30 = v29;
  v58 = v28;
  objc_msgSend(v29, sel_addSubview_, v28);

  sub_22AE5E018();
  swift_retain_n();
  v31 = v15;
  v32 = sub_22AE5E024();
  v33 = sub_22AE5E150();
  v34 = v33;
  if (os_log_type_enabled(v32, v33))
  {
    v35 = swift_slowAlloc();
    v57 = (os_unfair_lock_s *)swift_slowAlloc();
    v62[0] = v57;
    *(_DWORD *)v35 = 136446466;
    v55 = (void *)(v35 + 4);
    LODWORD(v56) = v34;
    v36 = sub_22AE4D92C();
    v61 = sub_22AE53698(v36, v37, (uint64_t *)v62);
    sub_22AE5E180();

    swift_bridgeObjectRelease();
    *(_WORD *)(v35 + 12) = 2082;
    v55 = (void *)(v35 + 14);
    v39 = a1[2];
    v38 = a1[3];
    swift_bridgeObjectRetain();
    v61 = sub_22AE53698(v39, v38, (uint64_t *)v62);
    sub_22AE5E180();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_22AE41000, v32, (os_log_type_t)v56, "%{public}s: hosting scene %{public}s", (uint8_t *)v35, 0x16u);
    v40 = v57;
    swift_arrayDestroy();
    MEMORY[0x22E2E9368](v40, -1, -1);
    MEMORY[0x22E2E9368](v35, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v60);
  v45 = v54;
  v46 = swift_allocObject();
  *(_QWORD *)(v46 + 16) = v31;
  *(_QWORD *)(v46 + 24) = a1;
  swift_retain_n();
  v47 = v31;
  os_unfair_lock_lock(v45);
  sub_22AE49BE8(v53, (uint64_t)sub_22AE50B54, v46, (char *)v62);
  os_unfair_lock_unlock(v45);
  if (((uint64_t)v62[0] & 1) == 0)
    sub_22AE4FC9C(v47, (uint64_t)a1);

  swift_release();
  swift_release();
  v48 = &v47[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview];
  swift_beginAccess();
  v49 = *v48;
  v50 = v58;
  if (v49 == 1)
  {
    v51 = objc_msgSend(v47, sel_traitCollection);
    objc_msgSend(v51, sel_activeAppearance);
    swift_release();

    swift_release();
  }
  else
  {
    swift_release();

    swift_release();
  }
}

uint64_t sub_22AE4F130(void *a1, int a2, char *a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint8_t *v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(char *, uint64_t);
  id v26;
  char *v27;
  char *v28;
  NSObject *v29;
  os_log_type_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  id v34;
  uint64_t v35;
  _QWORD *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t result;
  char *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  _QWORD *v51;
  int v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56[3];
  uint64_t v57;

  LODWORD(v6) = a2;
  v8 = sub_22AE5E030();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v48 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v48 - v13;
  if ((v6 & 1) != 0)
  {
    v53 = v9;
    v26 = a1;
    sub_22AE5E018();
    v27 = a3;
    sub_22AE50AC8(a1, 1);
    v28 = v27;
    sub_22AE50AC8(a1, 1);
    v29 = sub_22AE5E024();
    v30 = sub_22AE5E150();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = swift_slowAlloc();
      v52 = v6;
      v6 = v31;
      v49 = (_QWORD *)swift_slowAlloc();
      v50 = swift_slowAlloc();
      v56[0] = v50;
      *(_DWORD *)v6 = 136446466;
      v51 = a4;
      v32 = sub_22AE4D92C();
      v57 = sub_22AE53698(v32, v33, v56);
      v54 = v8;
      sub_22AE5E180();

      swift_bridgeObjectRelease();
      *(_WORD *)(v6 + 12) = 2114;
      v34 = a1;
      v35 = _swift_stdlib_bridgeErrorToNSError();
      v57 = v35;
      sub_22AE5E180();
      v36 = v49;
      *v49 = v35;
      a4 = v51;
      sub_22AE4A944(a1, 1);
      sub_22AE4A944(a1, 1);
      _os_log_impl(&dword_22AE41000, v29, v30, "%{public}s: failed to activate: %{public}@", (uint8_t *)v6, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255B535A0);
      swift_arrayDestroy();
      MEMORY[0x22E2E9368](v36, -1, -1);
      v37 = v50;
      swift_arrayDestroy();
      MEMORY[0x22E2E9368](v37, -1, -1);
      v38 = v6;
      LOBYTE(v6) = v52;
      MEMORY[0x22E2E9368](v38, -1, -1);

      sub_22AE4A944(a1, 1);
      result = (*(uint64_t (**)(char *, uint64_t))(v53 + 8))(v12, v54);
      goto LABEL_10;
    }
    sub_22AE4A944(a1, 1);

    sub_22AE4A944(a1, 1);
    sub_22AE4A944(a1, 1);

    v25 = *(uint64_t (**)(char *, uint64_t))(v53 + 8);
    v40 = v12;
    v41 = v8;
  }
  else
  {
    v54 = v8;
    v15 = &a3[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_readyForDisplay];
    swift_beginAccess();
    *v15 = 1;
    sub_22AE5E018();
    v16 = a3;
    v17 = sub_22AE5E024();
    v18 = sub_22AE5E150();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = swift_slowAlloc();
      v53 = v9;
      v20 = (uint8_t *)v19;
      v21 = swift_slowAlloc();
      v52 = v6;
      v6 = v21;
      v57 = v21;
      v50 = (uint64_t)a3;
      v51 = a1;
      *(_DWORD *)v20 = 136446210;
      v22 = sub_22AE4D92C();
      v55 = sub_22AE53698(v22, v23, &v57);
      a3 = (char *)v50;
      a1 = v51;
      sub_22AE5E180();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22AE41000, v17, v18, "%{public}s: ready for display", v20, 0xCu);
      swift_arrayDestroy();
      v24 = v6;
      LOBYTE(v6) = v52;
      MEMORY[0x22E2E9368](v24, -1, -1);
      MEMORY[0x22E2E9368](v20, -1, -1);

      v25 = *(uint64_t (**)(char *, uint64_t))(v53 + 8);
    }
    else
    {

      v25 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
    }
    v40 = v14;
    v41 = v54;
  }
  result = v25(v40, v41);
LABEL_10:
  v42 = (uint64_t *)&a3[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest];
  if (*(_QWORD *)&a3[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest + 32])
  {
    if (*v42 == *a4)
    {
      ((void (*)(void *, uint64_t))a4[4])(a1, v6 & 1);
      v43 = *v42;
      v44 = v42[1];
      v45 = v42[2];
      v46 = v42[3];
      v47 = v42[4];
      *(_OWORD *)v42 = 0u;
      *((_OWORD *)v42 + 1) = 0u;
      *((_OWORD *)v42 + 2) = 0u;
      return sub_22AE5045C(v43, v44, v45, v46, v47);
    }
  }
  return result;
}

Swift::Void __swiftcall SceneHostingViewController.deactivate()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(uint64_t);
  uint64_t v18;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[3];

  v1 = sub_22AE5E030();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host;
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host])
  {
    sub_22AE5E018();
    v6 = v0;
    v7 = sub_22AE5E024();
    v8 = sub_22AE5E150();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = swift_slowAlloc();
      v20 = v1;
      v10 = (uint8_t *)v9;
      v11 = swift_slowAlloc();
      v21 = v5;
      v12 = v11;
      v23[0] = v11;
      *(_DWORD *)v10 = 136446210;
      v19[1] = v10 + 4;
      v13 = sub_22AE4D92C();
      v22 = sub_22AE53698(v13, v14, v23);
      sub_22AE5E180();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22AE41000, v7, v8, "%{public}s: deactivating (explicit request)", v10, 0xCu);
      swift_arrayDestroy();
      v15 = v12;
      v5 = v21;
      MEMORY[0x22E2E9368](v15, -1, -1);
      MEMORY[0x22E2E9368](v10, -1, -1);

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v20);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    }
    if (*(_QWORD *)&v0[v5])
    {
      sub_22AE4F828();
      v16 = &v6[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler];
      swift_beginAccess();
      v17 = *(void (**)(uint64_t))v16;
      if (*(_QWORD *)v16)
      {
        v18 = swift_retain();
        v17(v18);
        sub_22AE4A120((uint64_t)v17);
      }
    }
  }
}

uint64_t sub_22AE4F828()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  os_log_t v26;
  uint64_t (*v27)();
  uint64_t (*v28)();
  uint64_t v29;
  id v30;
  uint64_t (*v31)();
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char *v35;
  uint64_t result;
  uint64_t v37;
  os_log_t v38;
  uint64_t (*v39)();
  uint64_t v40;
  uint64_t v41;
  int v42;
  char *v43;
  id v44;
  char *v45;
  uint64_t v46;
  uint64_t (*v47)();
  objc_super v48;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  v3 = sub_22AE5E030();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48.receiver = v1;
  v48.super_class = ObjectType;
  if (objc_msgSendSuper2(&v48, sel_resignFirstResponder))
  {
    v7 = *(_QWORD *)&v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus];
    swift_retain();
    sub_22AE4D0D8(0, v7);
    swift_release();
  }
  v8 = (uint64_t *)&v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  v9 = *(_QWORD *)&v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  if (v9)
  {
    v11 = (void *)v8[1];
    v10 = v8[2];
    v12 = v8[3];
    swift_retain();
    v44 = v11;
    swift_retain();
    swift_retain();
    sub_22AE5E018();
    sub_22AE50A80(v9, v11);
    v13 = v1;
    sub_22AE50A80(v9, v11);
    v14 = v13;
    v15 = v6;
    v16 = v14;
    v43 = v15;
    v17 = sub_22AE5E024();
    v18 = sub_22AE5E150();
    v42 = v18;
    v19 = os_log_type_enabled(v17, v18);
    v45 = v1;
    if (v19)
    {
      v20 = swift_slowAlloc();
      v41 = v4;
      v21 = v20;
      v39 = (uint64_t (*)())swift_slowAlloc();
      v47 = v39;
      *(_DWORD *)v21 = 136446466;
      v40 = v3;
      v38 = v17;
      v22 = sub_22AE4D92C();
      v46 = sub_22AE53698(v22, v23, (uint64_t *)&v47);
      sub_22AE5E180();

      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2082;
      v24 = *(_QWORD *)(v9 + 16);
      v25 = *(_QWORD *)(v9 + 24);
      swift_bridgeObjectRetain();
      v46 = sub_22AE53698(v24, v25, (uint64_t *)&v47);
      sub_22AE5E180();
      swift_bridgeObjectRelease();
      sub_22AE50A38(v9, v11);
      sub_22AE50A38(v9, v11);
      v26 = v38;
      _os_log_impl(&dword_22AE41000, v38, (os_log_type_t)v42, "%{public}s: destroying host for scene %{public}s", (uint8_t *)v21, 0x16u);
      v27 = v39;
      swift_arrayDestroy();
      MEMORY[0x22E2E9368](v27, -1, -1);
      MEMORY[0x22E2E9368](v21, -1, -1);

      (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v40);
    }
    else
    {

      sub_22AE50A38(v9, v11);
      sub_22AE50A38(v9, v11);

      (*(void (**)(char *, uint64_t))(v4 + 8))(v43, v3);
    }
    os_unfair_lock_lock((os_unfair_lock_t)(v12 + 32));
    sub_22AE5C4D8((uint64_t *)(v12 + 16), &v47);
    os_unfair_lock_unlock((os_unfair_lock_t)(v12 + 32));
    v28 = v47;
    if (v47)
    {
      v29 = swift_retain();
      ((void (*)(uint64_t))v28)(v29);
      sub_22AE4A120((uint64_t)v28);
      sub_22AE4A120((uint64_t)v28);
    }
    v30 = v44;
    objc_msgSend(v44, sel_removeFromSuperview);
    objc_msgSend(v30, sel_invalidate);
    objc_msgSend(*(id *)(v9 + 32), sel_setSceneResizeHandler_, 0);
    InjectedScene.relinquish()();
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v10 + 32));
    sub_22AE5C4D8((uint64_t *)(v10 + 16), &v47);
    os_unfair_lock_unlock((os_unfair_lock_t)(v10 + 32));
    v31 = v47;
    if (v47)
    {
      v32 = swift_retain();
      ((void (*)(uint64_t))v31)(v32);
      sub_22AE4A120((uint64_t)v31);
      sub_22AE4A120((uint64_t)v31);
    }
    sub_22AE50A38(v9, v11);
    swift_release();
    v1 = v45;
  }
  v33 = *v8;
  v34 = (void *)v8[1];
  *(_OWORD *)v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  sub_22AE50A38(v33, v34);
  v35 = &v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_readyForDisplay];
  result = swift_beginAccess();
  *v35 = 0;
  return result;
}

uint64_t sub_22AE4FC9C(char *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  unint64_t v16;
  unint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  char *v20;
  void (*v21)(uint64_t);
  uint64_t v22;
  _QWORD v23[2];
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27[3];

  v4 = sub_22AE5E030();
  v5 = *(_QWORD *)(v4 - 8);
  result = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host;
  v10 = *(_QWORD *)&a1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  if (v10)
    v11 = v10 == a2;
  else
    v11 = 0;
  if (v11)
  {
    sub_22AE5E018();
    v12 = a1;
    v13 = sub_22AE5E024();
    v14 = sub_22AE5E150();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v25 = swift_slowAlloc();
      v27[0] = v25;
      v24 = v15;
      *(_DWORD *)v15 = 136446210;
      v23[1] = v15 + 4;
      v16 = sub_22AE4D92C();
      v26 = sub_22AE53698(v16, v17, v27);
      sub_22AE5E180();

      swift_bridgeObjectRelease();
      v18 = v24;
      _os_log_impl(&dword_22AE41000, v13, v14, "%{public}s: deactivating (scene invalidated)", v24, 0xCu);
      v19 = v25;
      swift_arrayDestroy();
      MEMORY[0x22E2E9368](v19, -1, -1);
      MEMORY[0x22E2E9368](v18, -1, -1);

    }
    else
    {

    }
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    if (*(_QWORD *)&a1[v9])
    {
      sub_22AE4F828();
      v20 = &v12[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler];
      result = swift_beginAccess();
      v21 = *(void (**)(uint64_t))v20;
      if (*(_QWORD *)v20)
      {
        v22 = swift_retain();
        v21(v22);
        return sub_22AE4A120((uint64_t)v21);
      }
    }
  }
  return result;
}

id SceneHostingViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_22AE5E0C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id SceneHostingViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  _BYTE *v3;
  objc_class *ObjectType;
  _QWORD *v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t *v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  objc_super v20;
  uint64_t v21;

  ObjectType = (objc_class *)swift_getObjectType();
  v7 = &v3[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler];
  *v7 = 0;
  v7[1] = 0;
  v3[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview] = 0;
  v8 = qword_255B53398;
  v9 = v3;
  if (v8 != -1)
    swift_once();
  v10 = (uint64_t *)(qword_255B53B38 + 16);
  v11 = (os_unfair_lock_s *)(qword_255B53B38 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_255B53B38 + 24));
  sub_22AE5C390(v10, &v21);
  v12 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_identifier;
  os_unfair_lock_unlock(v11);
  *(_QWORD *)&v9[v12] = v21;
  v13 = &v9[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  *v13 = 0u;
  v13[1] = 0u;
  v14 = &v9[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest];
  *v14 = 0u;
  v14[1] = 0u;
  v14[2] = 0u;
  v15 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B536C0);
  v16 = swift_allocObject();
  *(_DWORD *)(v16 + 24) = 0;
  *(_QWORD *)(v16 + 16) = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v9[v15] = v16;
  v9[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_readyForDisplay] = 0;

  if (a2)
  {
    v17 = (void *)sub_22AE5E0C0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }
  v20.receiver = v9;
  v20.super_class = ObjectType;
  v18 = objc_msgSendSuper2(&v20, sel_initWithNibName_bundle_, v17, a3);

  return v18;
}

id SceneHostingViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SceneHostingViewController.init(coder:)(void *a1)
{
  _BYTE *v1;
  objc_class *ObjectType;
  _QWORD *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t *v7;
  os_unfair_lock_s *v8;
  uint64_t v9;
  _OWORD *v10;
  _OWORD *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  objc_super v16;
  uint64_t v17;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = &v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler];
  *v4 = 0;
  v4[1] = 0;
  v1[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview] = 0;
  v5 = qword_255B53398;
  v6 = v1;
  if (v5 != -1)
    swift_once();
  v7 = (uint64_t *)(qword_255B53B38 + 16);
  v8 = (os_unfair_lock_s *)(qword_255B53B38 + 24);
  os_unfair_lock_lock((os_unfair_lock_t)(qword_255B53B38 + 24));
  sub_22AE5C390(v7, &v17);
  v9 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_identifier;
  os_unfair_lock_unlock(v8);
  *(_QWORD *)&v6[v9] = v17;
  v10 = &v6[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host];
  *v10 = 0u;
  v10[1] = 0u;
  v11 = &v6[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest];
  *v11 = 0u;
  v11[1] = 0u;
  v11[2] = 0u;
  v12 = OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_firstResponderStatus;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B536C0);
  v13 = swift_allocObject();
  *(_DWORD *)(v13 + 24) = 0;
  *(_QWORD *)(v13 + 16) = MEMORY[0x24BEE4B00];
  *(_QWORD *)&v6[v12] = v13;
  v6[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_readyForDisplay] = 0;

  v16.receiver = v6;
  v16.super_class = ObjectType;
  v14 = objc_msgSendSuper2(&v16, sel_initWithCoder_, a1);

  return v14;
}

id SceneHostingViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_22AE503C0(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_22AE503D0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22AE503F4(unsigned __int8 *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

unint64_t sub_22AE50418()
{
  unint64_t result;

  result = qword_255B536B0;
  if (!qword_255B536B0)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F720, &type metadata for SceneHostingViewController.ActivationRequest.Superseded);
    atomic_store(result, (unint64_t *)&qword_255B536B0);
  }
  return result;
}

uint64_t sub_22AE5045C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (a5)
    return swift_release();
  return result;
}

uint64_t sub_22AE5046C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22AE50498(void *a1, char a2)
{
  uint64_t v2;

  return sub_22AE4F130(a1, a2 & 1, *(char **)(v2 + 16), (_QWORD *)(v2 + 24));
}

uint64_t sub_22AE504B0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

void sub_22AE50500(char *a1)
{
  SceneHostingViewController.isUserActivePreview.setter(*a1);
}

uint64_t type metadata accessor for SceneHostingViewController()
{
  return objc_opt_self();
}

ValueMetadata *type metadata accessor for SceneHostingViewController.ObservationToken()
{
  return &type metadata for SceneHostingViewController.ObservationToken;
}

uint64_t initializeBufferWithCopyOfBuffer for ShellToHostMessage(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for SceneHostingViewController.ActivationRequest()
{
  return swift_release();
}

uint64_t initializeWithCopy for SceneHostingViewController.ActivationRequest(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for SceneHostingViewController.ActivationRequest(uint64_t a1, uint64_t a2)
{
  __int128 v3;
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v4;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for SceneHostingViewController.ActivationRequest(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneHostingViewController.ActivationRequest(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneHostingViewController.ActivationRequest(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 32) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneHostingViewController.ActivationRequest()
{
  return &type metadata for SceneHostingViewController.ActivationRequest;
}

uint64_t destroy for SceneHostingViewController.Host(uint64_t a1)
{
  swift_release();

  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for SceneHostingViewController.Host(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  v5 = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for SceneHostingViewController.Host(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v4 = (void *)a2[1];
  v5 = (void *)a1[1];
  a1[1] = v4;
  v6 = v4;

  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for SceneHostingViewController.Host(uint64_t a1, _OWORD *a2)
{
  void *v4;

  swift_release();
  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  swift_release();
  *(_OWORD *)(a1 + 16) = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SceneHostingViewController.Host(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SceneHostingViewController.Host(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SceneHostingViewController.Host()
{
  return &type metadata for SceneHostingViewController.Host;
}

ValueMetadata *type metadata accessor for SceneHostingViewController.ActivationRequest.Superseded()
{
  return &type metadata for SceneHostingViewController.ActivationRequest.Superseded;
}

unint64_t sub_22AE5093C(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_22AE50968();
  result = sub_22AE509AC();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_22AE50968()
{
  unint64_t result;

  result = qword_255B536F0;
  if (!qword_255B536F0)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F664, &type metadata for SceneHostingViewController.ActivationRequest.Superseded);
    atomic_store(result, (unint64_t *)&qword_255B536F0);
  }
  return result;
}

unint64_t sub_22AE509AC()
{
  unint64_t result;

  result = qword_255B536F8;
  if (!qword_255B536F8)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5F6A4, &type metadata for SceneHostingViewController.ActivationRequest.Superseded);
    atomic_store(result, (unint64_t *)&qword_255B536F8);
  }
  return result;
}

unint64_t sub_22AE509F4()
{
  unint64_t result;

  result = qword_255B53700;
  if (!qword_255B53700)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE6075C, &type metadata for Identifier);
    atomic_store(result, (unint64_t *)&qword_255B53700);
  }
  return result;
}

uint64_t sub_22AE50A38(uint64_t result, void *a2)
{
  if (result)
  {
    swift_release();

    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t sub_22AE50A80(uint64_t result, void *a2)
{
  id v3;

  if (result)
  {
    swift_retain();
    v3 = a2;
    swift_retain();
    return swift_retain();
  }
  return result;
}

id sub_22AE50AC8(id result, char a2)
{
  if ((a2 & 1) != 0)
    return result;
  return result;
}

void sub_22AE50AD4()
{
  uint64_t v0;

  sub_22AE49E78(v0);
}

uint64_t sub_22AE50ADC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_22AE50B00()
{
  return sub_22AE4E228();
}

uint64_t sub_22AE50B20(uint64_t a1)
{
  uint64_t v1;

  return sub_22AE48FF0(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_22AE50B28()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22AE50B54()
{
  uint64_t v0;

  return sub_22AE4FC9C(*(char **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

_QWORD *SceneMessenger.__allocating_init(actionSender:)(uint64_t a1, uint64_t a2)
{
  _QWORD *result;

  result = (_QWORD *)swift_allocObject();
  result[4] = 0;
  result[5] = 0;
  result[2] = a1;
  result[3] = a2;
  return result;
}

void SceneMessenger.receiveAction(_:)(NSObject *a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t AssociatedTypeWitness;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, NSObject **);
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  os_log_type_t v35;
  char *v36;
  uint8_t *v37;
  _QWORD *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  void (*v53)(char *, char *, uint64_t);
  char *v54;
  char *v55;
  NSObject *v56;
  NSObject *v57;
  os_log_type_t v58;
  int v59;
  uint64_t v60;
  char *v61;
  void (*v62)(char *, uint64_t);
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD v75[2];
  char *v76;
  char *v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(char *, NSObject **);
  NSObject *v85;
  uint64_t v86;
  NSObject *v87;
  uint64_t v88;
  NSObject *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSObject *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;

  v3 = *v1;
  v92 = sub_22AE5E030();
  v4 = *(_QWORD *)(v92 - 8);
  v5 = MEMORY[0x24BDAC7A8](v92);
  v89 = ((char *)v75 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v75 - v8;
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)v75 - v11;
  v78 = *(_QWORD *)(*(_QWORD *)(v3 + 88) - 8);
  v13 = MEMORY[0x24BDAC7A8](v10);
  v76 = (char *)v75 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v79 = (char *)v75 - v16;
  v17 = MEMORY[0x24BDAC7A8](v15);
  v77 = (char *)v75 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v80 = (char *)v75 - v19;
  v88 = v3;
  v93 = *(_QWORD *)(v3 + 104);
  v90 = v20;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v22 = sub_22AE5E174();
  v23 = *(_QWORD *)(v22 - 8);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v75 - v25;
  v82 = AssociatedTypeWitness;
  v86 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v27 = MEMORY[0x24BDAC7A8](v24);
  v29 = (char *)v75 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v27);
  v81 = (char *)v75 - v30;
  swift_beginAccess();
  v31 = (void (*)(char *, NSObject **))v1[4];
  v91 = v4;
  if (v31)
  {
    v83 = v1[5];
    v84 = v31;
    swift_retain();
    if (-[NSObject canSendResponse](a1, sel_canSendResponse))
    {
      v32 = a1;
      v85 = a1;
    }
    else
    {
      v85 = 0;
    }
    v87 = a1;
    v41 = sub_22AE4BAF0();
    v75[0] = v12;
    v75[1] = v41;
    v95 = v41;
    v96 = v42;
    v43 = v90;
    v44 = v82;
    swift_getAssociatedConformanceWitness();
    swift_bridgeObjectRetain();
    sub_22AE5E120();
    v45 = v86;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v86 + 48))(v26, 1, v44) == 1)
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v26, v22);
      v46 = *(_QWORD *)(v88 + 96);
      v95 = *(NSObject **)(v88 + 80);
      v96 = v43;
      v97 = v46;
      v98 = v93;
      type metadata accessor for SceneMessenger.DecodeError();
    }
    swift_bridgeObjectRelease();
    v47 = v81;
    (*(void (**)(char *, char *, uint64_t))(v45 + 32))(v81, v26, v44);
    (*(void (**)(char *, char *, uint64_t))(v45 + 16))(v29, v47, v44);
    v48 = sub_22AE4BD48();
    v49 = sub_22AE4BBEC();
    v50 = v80;
    v51 = v90;
    (*(void (**)(char *, uint64_t, unint64_t, uint64_t))(v93 + 56))(v29, v48, v49, v90);
    sub_22AE5E018();
    v52 = v78;
    v53 = *(void (**)(char *, char *, uint64_t))(v78 + 16);
    v54 = v77;
    v53(v77, v50, v51);
    v55 = v79;
    v53(v79, v50, v51);
    v56 = v85;
    v89 = v85;
    v57 = sub_22AE5E024();
    v58 = sub_22AE5E12C();
    v59 = v58;
    if (os_log_type_enabled(v57, v58))
    {
      v60 = swift_slowAlloc();
      v88 = swift_slowAlloc();
      v95 = v88;
      *(_DWORD *)v60 = 136446722;
      LODWORD(v87) = v59;
      v61 = v76;
      v53(v76, v54, v51);
      v62 = *(void (**)(char *, uint64_t))(v52 + 8);
      v62(v54, v51);
      v63 = v93;
      v64 = sub_22AE5E240();
      v66 = v65;
      v62(v61, v51);
      v94 = sub_22AE53698(v64, v66, (uint64_t *)&v95);
      sub_22AE5E180();
      swift_bridgeObjectRelease();
      *(_WORD *)(v60 + 12) = 2082;
      v67 = v63;
      v50 = v80;
      v68 = SceneMessage.timingDescription.getter(v51, v67);
      v94 = sub_22AE53698(v68, v69, (uint64_t *)&v95);
      v44 = v82;
      sub_22AE5E180();
      swift_bridgeObjectRelease();
      v62(v55, v51);
      *(_WORD *)(v60 + 22) = 2082;
      if (v85)
        v70 = 0x796C7065722F77;
      else
        v70 = 0x7961772D656E6FLL;
      v94 = sub_22AE53698(v70, 0xE700000000000000, (uint64_t *)&v95);
      sub_22AE5E180();
      v71 = v89;

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_22AE41000, v57, (os_log_type_t)v87, "Received %{public}s (%{public}s, %{public}s)", (uint8_t *)v60, 0x20u);
      v72 = v88;
      swift_arrayDestroy();
      MEMORY[0x22E2E9368](v72, -1, -1);
      v73 = v60;
      v56 = v85;
      MEMORY[0x22E2E9368](v73, -1, -1);

    }
    else
    {
      v62 = *(void (**)(char *, uint64_t))(v52 + 8);
      v62(v54, v51);
      v62(v55, v51);

      v71 = v89;
    }
    (*(void (**)(_QWORD, uint64_t))(v91 + 8))(v75[0], v92);
    v95 = v56;
    v74 = (uint64_t)v84;
    v84(v50, &v95);
    sub_22AE4A120(v74);
    v62(v50, v51);
    (*(void (**)(char *, uint64_t))(v86 + 8))(v81, v44);

  }
  else
  {
    sub_22AE5E018();
    v33 = a1;
    v34 = sub_22AE5E024();
    v35 = sub_22AE5E138();
    v36 = v9;
    if (os_log_type_enabled(v34, v35))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v38 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v37 = 138543362;
      v95 = v33;
      v39 = v33;
      v40 = v92;
      sub_22AE5E180();
      *v38 = v33;

      _os_log_impl(&dword_22AE41000, v34, v35, "Scene messenger has no receiver -- dropping message: %{public}@", v37, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255B535A0);
      swift_arrayDestroy();
      MEMORY[0x22E2E9368](v38, -1, -1);
      MEMORY[0x22E2E9368](v37, -1, -1);
    }
    else
    {

      v34 = v33;
      v40 = v92;
    }

    (*(void (**)(char *, uint64_t))(v91 + 8))(v36, v40);
  }
}

void SceneMessenger.send(message:replyTimeout:replyHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  void (*v25)(_BYTE *, uint64_t, uint64_t);
  NSObject *v26;
  os_log_type_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  void (*v33)(_BYTE *, uint64_t);
  uint64_t v34;
  unint64_t v35;
  os_log_t v36;
  uint64_t v37;
  void (*v38)(_BYTE *, uint64_t);
  _BYTE *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  _BYTE *v45;
  void *v46;
  id v47;
  _BYTE v48[12];
  int v49;
  os_log_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  _BYTE *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64[2];

  v5 = v4;
  v62 = a3;
  v60 = a2;
  v8 = *v4;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53550);
  MEMORY[0x24BDAC7A8](v9);
  v61 = &v48[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = *(_QWORD *)(v8 + 96);
  v12 = *(_QWORD *)(v8 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v57 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v58 = AssociatedTypeWitness;
  v14 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v56 = &v48[-v15];
  v16 = *(_QWORD *)(v12 - 8);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = &v48[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v17);
  v21 = &v48[-v20];
  v22 = sub_22AE5E030();
  v54 = *(_QWORD *)(v22 - 8);
  v55 = v22;
  MEMORY[0x24BDAC7A8](v22);
  v24 = &v48[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_22AE5E018();
  v25 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v16 + 16);
  v25(v21, a1, v12);
  v59 = a1;
  v25(v19, a1, v12);
  v26 = sub_22AE5E024();
  v27 = sub_22AE5E12C();
  v28 = v27;
  if (os_log_type_enabled(v26, v27))
  {
    v29 = swift_slowAlloc();
    v50 = v26;
    v30 = v29;
    v51 = swift_slowAlloc();
    v64[0] = v51;
    *(_DWORD *)v30 = 136446466;
    v53 = v5;
    v49 = v28;
    v31 = sub_22AE5E240();
    v63 = sub_22AE53698(v31, v32, v64);
    v52 = a4;
    v5 = v53;
    sub_22AE5E180();
    swift_bridgeObjectRelease();
    v33 = *(void (**)(_BYTE *, uint64_t))(v16 + 8);
    v33(v21, v12);
    *(_WORD *)(v30 + 12) = 2082;
    v34 = SceneMessage.timingDescription.getter(v12, v11);
    v63 = sub_22AE53698(v34, v35, v64);
    a4 = v52;
    sub_22AE5E180();
    swift_bridgeObjectRelease();
    v33(v19, v12);
    v36 = v50;
    _os_log_impl(&dword_22AE41000, v50, (os_log_type_t)v49, "Sending %{public}s (%{public}s, w/reply)", (uint8_t *)v30, 0x16u);
    v37 = v51;
    swift_arrayDestroy();
    MEMORY[0x22E2E9368](v37, -1, -1);
    MEMORY[0x22E2E9368](v30, -1, -1);

  }
  else
  {
    v38 = *(void (**)(_BYTE *, uint64_t))(v16 + 8);
    v38(v21, v12);
    v38(v19, v12);

  }
  (*(void (**)(_BYTE *, uint64_t))(v54 + 8))(v24, v55);
  v39 = v56;
  (*(void (**)(uint64_t, uint64_t))(v11 + 32))(v12, v11);
  v40 = v58;
  swift_getAssociatedConformanceWitness();
  sub_22AE5E114();
  (*(void (**)(_BYTE *, uint64_t))(v57 + 8))(v39, v40);
  v41 = v64[0];
  v42 = v64[1];
  v43 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 48))(v12, v11);
  v44 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v11 + 40))(v12, v11);
  v45 = v61;
  sub_22AE4A8FC(v60, (uint64_t)v61);
  sub_22AE4A000();
  swift_retain();
  v46 = (void *)sub_22AE5E15C();
  v47 = sub_22AE4C340(v41, v42, v43, v44, (uint64_t)v45, v46, v62, a4);
  ((void (*)(void))v5[2])();

}

void SceneMessenger.send(message:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t);
  NSObject *v19;
  os_log_type_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  unint64_t v28;
  os_log_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  os_log_t v41;
  int v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52[2];

  v2 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 96);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v49 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v7 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v48 = (char *)&v40 - v8;
  v9 = *(_QWORD *)(v5 - 8);
  v10 = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v40 - v13;
  v15 = sub_22AE5E030();
  v46 = *(_QWORD *)(v15 - 8);
  v47 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v40 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22AE5E018();
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
  v18(v14, a1, v5);
  v50 = a1;
  v18(v12, a1, v5);
  v19 = sub_22AE5E024();
  v20 = sub_22AE5E12C();
  v21 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    v22 = swift_slowAlloc();
    v44 = AssociatedTypeWitness;
    v23 = v22;
    v43 = swift_slowAlloc();
    v52[0] = v43;
    *(_DWORD *)v23 = 136446466;
    v42 = v21;
    v41 = v19;
    v24 = sub_22AE5E240();
    v51 = sub_22AE53698(v24, v25, v52);
    v45 = v2;
    sub_22AE5E180();
    swift_bridgeObjectRelease();
    v26 = *(void (**)(char *, uint64_t))(v9 + 8);
    v26(v14, v5);
    *(_WORD *)(v23 + 12) = 2082;
    v27 = SceneMessage.timingDescription.getter(v5, v4);
    v51 = sub_22AE53698(v27, v28, v52);
    v2 = v45;
    sub_22AE5E180();
    swift_bridgeObjectRelease();
    v26(v12, v5);
    v29 = v41;
    _os_log_impl(&dword_22AE41000, v41, (os_log_type_t)v42, "Sending %{public}s (%{public}s, one-way)", (uint8_t *)v23, 0x16u);
    v30 = v43;
    swift_arrayDestroy();
    MEMORY[0x22E2E9368](v30, -1, -1);
    v31 = v23;
    AssociatedTypeWitness = v44;
    MEMORY[0x22E2E9368](v31, -1, -1);

  }
  else
  {
    v32 = *(void (**)(char *, uint64_t))(v9 + 8);
    v32(v14, v5);
    v32(v12, v5);

  }
  (*(void (**)(char *, uint64_t))(v46 + 8))(v17, v47);
  v33 = v48;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v5, v4);
  swift_getAssociatedConformanceWitness();
  sub_22AE5E114();
  (*(void (**)(char *, uint64_t))(v49 + 8))(v33, AssociatedTypeWitness);
  v34 = v52[0];
  v35 = v52[1];
  v36 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 48))(v5, v4);
  v37 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v4 + 40))(v5, v4);
  v38 = objc_allocWithZone((Class)type metadata accessor for UVPreviewSceneAction());
  v39 = sub_22AE4B63C(v34, v35, v36, v37, 0);
  (*(void (**)(void))(v2 + 16))();

}

uint64_t sub_22AE51F5C()
{
  return 0;
}

uint64_t SceneMessage.payloadDescription.getter()
{
  return 0;
}

void SceneMessage.timing.getter(uint64_t a1@<X1>, BOOL *a2@<X8>)
{
  void *v3;

  v3 = (void *)(*(uint64_t (**)(void))(a1 + 40))();

  *a2 = v3 == 0;
}

uint64_t SceneMessage.timingDescription.getter(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = (void *)(*(uint64_t (**)(void))(a2 + 40))();
  if (!v2)
    return 0x636E797361;
  v3 = v2;
  objc_msgSend(v2, sel_fenceName);
  sub_22AE5E240();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();

  return 0x3C6465636E6566;
}

uint64_t SceneMessage.description.getter(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v7 = (char *)&v10 - v6;
  (*(void (**)(uint64_t, uint64_t))(a2 + 64))(a1, a2);
  if (v8)
  {
    v11 = 40;
    v12 = 0xE100000000000000;
    sub_22AE5E0FC();
    sub_22AE5E0FC();
    swift_bridgeObjectRelease();
  }
  v11 = 46;
  v12 = 0xE100000000000000;
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  swift_getAssociatedConformanceWitness();
  sub_22AE5E114();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t SceneUpdateTiming.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x636E797361;
  else
    return 0x6465636E6566;
}

uint64_t SceneUpdateTiming.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x636E797361;
  else
    return 0x6465636E6566;
}

uint64_t SceneUpdateTiming.unknownTimingError.getter()
{
  char *v0;
  char v1;
  uint64_t result;
  _BYTE *v3;

  v1 = *v0;
  sub_22AE53D58();
  result = swift_allocError();
  *v3 = v1;
  return result;
}

unint64_t sub_22AE52294()
{
  sub_22AE5E1BC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();
  return 0xD00000000000001ELL;
}

uint64_t sub_22AE52348()
{
  return sub_22AE5D3DC();
}

uint64_t sub_22AE52350()
{
  sub_22AE55060();
  return sub_22AE5E294();
}

uint64_t sub_22AE52378()
{
  sub_22AE55060();
  return sub_22AE5E288();
}

PreviewsServicesUI::SceneUpdateTiming_optional __swiftcall SceneUpdateTiming.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  PreviewsServicesUI::SceneUpdateTiming_optional result;
  char v5;

  v2 = v1;
  v3 = sub_22AE5E234();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t sub_22AE52400(char *a1, char *a2)
{
  return sub_22AE58E2C(*a1, *a2);
}

uint64_t sub_22AE5240C()
{
  return sub_22AE58EC4();
}

uint64_t sub_22AE52414()
{
  return sub_22AE59428();
}

uint64_t sub_22AE5241C()
{
  return sub_22AE59478();
}

PreviewsServicesUI::SceneUpdateTiming_optional sub_22AE52424(Swift::String *a1)
{
  return SceneUpdateTiming.init(rawValue:)(*a1);
}

uint64_t sub_22AE52430@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SceneUpdateTiming.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t SceneUpdateSeed.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

PreviewsServicesUI::SceneUpdateSeed __swiftcall SceneUpdateSeed.init(rawValue:)(PreviewsServicesUI::SceneUpdateSeed rawValue)
{
  PreviewsServicesUI::SceneUpdateSeed *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

uint64_t SceneUpdateSeed.description.getter()
{
  return sub_22AE5E240();
}

PreviewsServicesUI::SceneUpdateSeed __swiftcall SceneUpdateSeed.init()()
{
  _QWORD *v0;
  PreviewsServicesUI::SceneUpdateSeed result;

  *v0 = ++qword_255B53708;
  return result;
}

uint64_t sub_22AE524C0()
{
  sub_22AE5E2D0();
  sub_22AE5E2DC();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE52504()
{
  return sub_22AE5E2DC();
}

uint64_t sub_22AE5252C()
{
  sub_22AE5E2D0();
  sub_22AE5E2DC();
  return sub_22AE5E2F4();
}

_QWORD *sub_22AE5256C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_22AE5257C()
{
  sub_22AE5E0FC();
  sub_22AE5E240();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();
  return 0;
}

id static SceneMessage.require(_:for:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;

  if (a1)
    return a1;
  v6 = type metadata accessor for FenceError(0, a3, a4, a4);
  MEMORY[0x22E2E92D8](&unk_22AE5FDA4, v6);
  swift_allocError();
  v8 = v7;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(v8, a2, AssociatedTypeWitness);
  swift_storeEnumTagMultiPayload();
  return (id)swift_willThrow();
}

uint64_t static SceneMessage.requireNil(_:for:)(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;

  if (result)
  {
    v5 = type metadata accessor for FenceError(0, a3, a4, a4);
    MEMORY[0x22E2E92D8](&unk_22AE5FDA4, v5);
    swift_allocError();
    v7 = v6;
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(v7, a2, AssociatedTypeWitness);
    swift_storeEnumTagMultiPayload();
    return swift_willThrow();
  }
  return result;
}

uint64_t SceneMessage.unknownMessageError.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2, a1);
  v9 = type metadata accessor for UnknownMessageError(0, a1, a2, v8);
  MEMORY[0x22E2E92D8](&unk_22AE5FD64, v9);
  v10 = swift_allocError();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v11, v7, a1);
  return v10;
}

uint64_t sub_22AE52864(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  int EnumCaseMultiPayload;
  void (*v16)(char *, char *, uint64_t);
  uint64_t v17;
  uint64_t v19;
  unint64_t v20;

  v2 = v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)&v19 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v13, v2, a1);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v16 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
  if (EnumCaseMultiPayload == 1)
  {
    v16(v8, v13, AssociatedTypeWitness);
    v19 = 0;
    v20 = 0xE000000000000000;
    sub_22AE5E1BC();
    sub_22AE5E0FC();
    sub_22AE5E300();
    sub_22AE5E0FC();
    swift_bridgeObjectRelease();
    sub_22AE5E0FC();
    sub_22AE5E24C();
    sub_22AE5E0FC();
    v17 = v19;
    v11 = v8;
  }
  else
  {
    v16(v11, v13, AssociatedTypeWitness);
    v19 = 0;
    v20 = 0xE000000000000000;
    sub_22AE5E1BC();
    sub_22AE5E0FC();
    sub_22AE5E300();
    sub_22AE5E0FC();
    swift_bridgeObjectRelease();
    sub_22AE5E0FC();
    sub_22AE5E24C();
    sub_22AE5E0FC();
    v17 = v19;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v11, AssociatedTypeWitness);
  return v17;
}

uint64_t sub_22AE52AC8(uint64_t a1)
{
  MEMORY[0x22E2E92D8](&unk_22AE5FCC4, a1);
  return sub_22AE5C1AC();
}

uint64_t sub_22AE52AFC(uint64_t a1)
{
  uint64_t v2;

  v2 = MEMORY[0x22E2E92D8](&unk_22AE5FCC4, a1);
  return sub_22AE5C1D0(a1, v2);
}

uint64_t sub_22AE52B30(uint64_t a1)
{
  MEMORY[0x22E2E92D8](&unk_22AE5FC5C, a1);
  return sub_22AE5E294();
}

uint64_t sub_22AE52B64(uint64_t a1)
{
  MEMORY[0x22E2E92D8](&unk_22AE5FC5C, a1);
  return sub_22AE5E288();
}

uint64_t sub_22AE52B98(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD v8[2];

  v2 = *(_QWORD *)(a1 + 16);
  v1 = *(_QWORD *)(a1 + 24);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v6 = (char *)v8 - v5;
  v8[0] = 0;
  v8[1] = 0xE000000000000000;
  sub_22AE5E1BC();
  sub_22AE5E0FC();
  sub_22AE5E300();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();
  (*(void (**)(uint64_t, uint64_t))(v1 + 32))(v2, v1);
  sub_22AE5E24C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, AssociatedTypeWitness);
  return v8[0];
}

uint64_t sub_22AE52CC4(uint64_t a1)
{
  MEMORY[0x22E2E92D8](&unk_22AE5FD48, a1);
  return sub_22AE5C1AC();
}

uint64_t sub_22AE52CF8(uint64_t a1)
{
  uint64_t v2;

  v2 = MEMORY[0x22E2E92D8](&unk_22AE5FD48, a1);
  return sub_22AE5C1D0(a1, v2);
}

uint64_t sub_22AE52D2C(uint64_t a1)
{
  MEMORY[0x22E2E92D8](&unk_22AE5FCE0, a1);
  return sub_22AE5E294();
}

uint64_t sub_22AE52D60(uint64_t a1)
{
  MEMORY[0x22E2E92D8](&unk_22AE5FCE0, a1);
  return sub_22AE5E288();
}

Swift::Void __swiftcall SceneMessageResponder.reply(payload:)(Swift::OpaquePointer_optional payload)
{
  id v1;
  id v2;
  id v3;
  void *v4;
  id v5;
  id v6;

  if (payload.value._rawValue)
  {
    v1 = objc_allocWithZone(MEMORY[0x24BE0BE40]);
    swift_bridgeObjectRetain();
    v2 = objc_msgSend(v1, sel_init);
    v3 = objc_allocWithZone(MEMORY[0x24BE78718]);
    v4 = (void *)sub_22AE5E0A8();
    swift_bridgeObjectRelease();
    v5 = objc_msgSend(v3, sel_initWithDictionary_, v4);

    objc_msgSend(v2, sel_setObject_forSetting_, v5, 1);
    v6 = objc_msgSend((id)objc_opt_self(), sel_responseWithInfo_, v2);

  }
  else
  {
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BD90]), sel_init);
  }
  sub_22AE4BE58((uint64_t)v6);

}

void SceneMessageResponder.reply(error:)(void *a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = a1;
  v3 = (void *)sub_22AE5DFDC();

  v4 = objc_msgSend((id)objc_opt_self(), sel_responseForError_, v3);
  sub_22AE4BE58((uint64_t)v4);

}

void SceneMessageResponder.reply(result:)(void *a1, char a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;

  if ((a2 & 1) != 0)
  {
    v3 = a1;
    v4 = (void *)sub_22AE5DFDC();
    v5 = objc_msgSend((id)objc_opt_self(), sel_responseForError_, v4);

    sub_22AE4BE58((uint64_t)v5);
    sub_22AE4A944(a1, 1);
  }
  else
  {
    v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0BD90]), sel_init);
    sub_22AE4BE58((uint64_t)v6);

  }
}

uint64_t sub_22AE53008@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)()@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)();
  __int128 v11;
  __int128 v12;

  v11 = *(_OWORD *)(a3 + a2 - 16);
  v12 = *(_OWORD *)(a3 + a2 - 32);
  v5 = *a1;
  swift_beginAccess();
  v6 = *(_QWORD *)(v5 + 32);
  v7 = *(_QWORD *)(v5 + 40);
  if (v6)
  {
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = v12;
    *(_OWORD *)(v8 + 32) = v11;
    *(_QWORD *)(v8 + 48) = v6;
    *(_QWORD *)(v8 + 56) = v7;
    v9 = sub_22AE5519C;
  }
  else
  {
    v9 = 0;
    v8 = 0;
  }
  *a4 = v9;
  a4[1] = (uint64_t (*)())v8;
  return sub_22AE503C0(v6);
}

uint64_t sub_22AE530AC(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t (*v10)();
  uint64_t v11;
  uint64_t v12;

  v5 = *a1;
  v6 = a1[1];
  if (*a1)
  {
    v7 = a4 + a3;
    v8 = swift_allocObject();
    v9 = *(_OWORD *)(v7 - 16);
    *(_OWORD *)(v8 + 16) = *(_OWORD *)(v7 - 32);
    *(_OWORD *)(v8 + 32) = v9;
    *(_QWORD *)(v8 + 48) = v5;
    *(_QWORD *)(v8 + 56) = v6;
    v10 = sub_22AE5519C;
  }
  else
  {
    v10 = 0;
    v8 = 0;
  }
  v11 = *a2;
  swift_beginAccess();
  v12 = *(_QWORD *)(v11 + 32);
  *(_QWORD *)(v11 + 32) = v10;
  *(_QWORD *)(v11 + 40) = v8;
  sub_22AE503C0(v5);
  return sub_22AE4A120(v12);
}

uint64_t SceneMessenger.messageReceiver.getter()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 32);
  sub_22AE503C0(v1);
  return v1;
}

uint64_t SceneMessenger.messageReceiver.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 32);
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return sub_22AE4A120(v5);
}

uint64_t (*SceneMessenger.messageReceiver.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

_QWORD *SceneMessenger.init(actionSender:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;

  v2[4] = 0;
  v2[5] = 0;
  v2[2] = a1;
  v2[3] = a2;
  return v2;
}

unint64_t sub_22AE5324C()
{
  return sub_22AE53CD8();
}

uint64_t sub_22AE5325C(uint64_t a1)
{
  MEMORY[0x22E2E92D8](&unk_22AE5FB38, a1);
  return sub_22AE5C1AC();
}

uint64_t sub_22AE53290(uint64_t a1)
{
  uint64_t v2;

  v2 = MEMORY[0x22E2E92D8](&unk_22AE5FB38, a1);
  return sub_22AE5C1D0(a1, v2);
}

uint64_t sub_22AE532C4(uint64_t a1)
{
  MEMORY[0x22E2E92D8](&unk_22AE5FAD0, a1);
  return sub_22AE5E294();
}

uint64_t sub_22AE532F8(uint64_t a1)
{
  MEMORY[0x22E2E92D8](&unk_22AE5FAD0, a1);
  return sub_22AE5E288();
}

unint64_t sub_22AE5332C()
{
  sub_22AE5E1BC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();
  sub_22AE5E0FC();
  return 0xD000000000000011;
}

unint64_t sub_22AE533B8()
{
  return sub_22AE5332C();
}

uint64_t sub_22AE533CC(uint64_t a1)
{
  MEMORY[0x22E2E92D8](&unk_22AE5FBBC, a1);
  return sub_22AE5C1AC();
}

uint64_t sub_22AE53400(uint64_t a1)
{
  uint64_t v2;

  v2 = MEMORY[0x22E2E92D8](&unk_22AE5FBBC, a1);
  return sub_22AE5C1D0(a1, v2);
}

uint64_t sub_22AE53434(uint64_t a1)
{
  MEMORY[0x22E2E92D8](&unk_22AE5FB54, a1);
  return sub_22AE5E294();
}

uint64_t sub_22AE53468(uint64_t a1)
{
  MEMORY[0x22E2E92D8](&unk_22AE5FB54, a1);
  return sub_22AE5E288();
}

uint64_t SceneMessenger.deinit()
{
  uint64_t v0;

  swift_release();
  sub_22AE4A120(*(_QWORD *)(v0 + 32));
  return v0;
}

uint64_t SceneMessenger.__deallocating_deinit()
{
  uint64_t v0;

  swift_release();
  sub_22AE4A120(*(_QWORD *)(v0 + 32));
  return swift_deallocClassInstance();
}

uint64_t sub_22AE534EC(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_22AE534FC(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_22AE53530(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

_BYTE **sub_22AE53550(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_22AE53560(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_22AE5E180();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t sub_22AE53610(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_22AE53698(v6, v7, a3);
  v8 = *a1 + 8;
  sub_22AE5E180();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

void type metadata accessor for SceneMessenger.InvalidMessageError()
{
  JUMPOUT(0x22E2E929CLL);
}

void type metadata accessor for SceneMessenger.DecodeError()
{
  JUMPOUT(0x22E2E929CLL);
}

uint64_t sub_22AE53698(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_22AE53768(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22AE4C77C((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_22AE4C77C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_22AE53768(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_22AE5E18C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_22AE53920(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_22AE5E1D4();
  if (!v8)
  {
    sub_22AE5E1EC();
    __break(1u);
LABEL_17:
    result = sub_22AE5E228();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_22AE53920(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22AE539B4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_22AE53B8C(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_22AE53B8C(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22AE539B4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_22AE53B28(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_22AE5E1C8();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_22AE5E1EC();
      __break(1u);
LABEL_10:
      v2 = sub_22AE5E108();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_22AE5E228();
    __break(1u);
LABEL_14:
    result = sub_22AE5E1EC();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_22AE53B28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B539B8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22AE53B8C(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255B539B8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_22AE5E228();
  __break(1u);
  return result;
}

unint64_t sub_22AE53CD8()
{
  sub_22AE5E1BC();
  swift_bridgeObjectRelease();
  sub_22AE5E300();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  return 0xD000000000000011;
}

unint64_t sub_22AE53D58()
{
  unint64_t result;

  result = qword_255B53710;
  if (!qword_255B53710)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5FDE4, &type metadata for SceneUpdateTiming.UnknownTimingError);
    atomic_store(result, (unint64_t *)&qword_255B53710);
  }
  return result;
}

uint64_t type metadata accessor for FenceError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FenceError);
}

uint64_t type metadata accessor for UnknownMessageError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for UnknownMessageError);
}

unint64_t sub_22AE53DB8()
{
  unint64_t result;

  result = qword_255B53718;
  if (!qword_255B53718)
  {
    result = MEMORY[0x22E2E92D8](&protocol conformance descriptor for SceneUpdateTiming, &type metadata for SceneUpdateTiming);
    atomic_store(result, (unint64_t *)&qword_255B53718);
  }
  return result;
}

unint64_t sub_22AE53E00()
{
  unint64_t result;

  result = qword_255B53720[0];
  if (!qword_255B53720[0])
  {
    result = MEMORY[0x22E2E92D8](&protocol conformance descriptor for SceneUpdateSeed, &type metadata for SceneUpdateSeed);
    atomic_store(result, qword_255B53720);
  }
  return result;
}

uint64_t sub_22AE53E4C()
{
  return 32;
}

__n128 sub_22AE53E58(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t dispatch thunk of SceneMessage.messageType.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SceneMessage.fenceHandle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of SceneMessage.payload.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of SceneMessage.init(messageType:fenceHandle:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 56))();
}

uint64_t dispatch thunk of SceneMessage.payloadDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

ValueMetadata *type metadata accessor for SceneUpdateTiming()
{
  return &type metadata for SceneUpdateTiming;
}

ValueMetadata *type metadata accessor for SceneUpdateSeed()
{
  return &type metadata for SceneUpdateSeed;
}

ValueMetadata *type metadata accessor for SceneMessageResponder()
{
  return &type metadata for SceneMessageResponder;
}

uint64_t sub_22AE53ED8()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for SceneMessenger()
{
  JUMPOUT(0x22E2E929CLL);
}

uint64_t method lookup function for SceneMessenger()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SceneMessenger.__allocating_init(actionSender:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_22AE53F44()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_22AE53F4C()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_22AE53FB8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_22AE54028(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_22AE54038(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_22AE54068(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_22AE54098(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_22AE540C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_22AE540F8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_22AE541A8 + 4 * byte_22AE5F770[(v7 - 1)]))();
}

void sub_22AE541F8(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_22AE543A8()
{
  uint64_t result;
  unint64_t v1;

  result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t *sub_22AE54420(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if (v7 <= 7 && (unint64_t)(v6 + 1) <= 0x18 && (*(_DWORD *)(v5 + 80) & 0x100000) == 0)
  {
    v11 = *((unsigned __int8 *)a2 + v6);
    if (v11 >= 2)
    {
      if (v6 <= 3)
        v12 = v6;
      else
        v12 = 4;
      __asm { BR              X12 }
    }
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    *((_BYTE *)a1 + v6) = v11 == 1;
  }
  else
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v7 + 16) & ~v7));
    swift_retain();
  }
  return a1;
}

uint64_t sub_22AE54548(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(a1, AssociatedTypeWitness);
}

uint64_t sub_22AE54594(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  BOOL v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(unsigned __int8 *)(a2 + v6);
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v8 = v6;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  v9 = v7 == 1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
  *(_BYTE *)(a1 + v6) = v9;
  return a1;
}

uint64_t sub_22AE54674(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  BOOL v9;

  if (a1 != a2)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v6 = *(_QWORD *)(v5 + 64);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
    v7 = *(unsigned __int8 *)(a2 + v6);
    if (v7 >= 2)
    {
      if (v6 <= 3)
        v8 = v6;
      else
        v8 = 4;
      __asm { BR              X12 }
    }
    v9 = v7 == 1;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    *(_BYTE *)(a1 + v6) = v9;
  }
  return a1;
}

uint64_t sub_22AE54778(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  BOOL v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(unsigned __int8 *)(a2 + v6);
  if (v7 >= 2)
  {
    if (v6 <= 3)
      v8 = v6;
    else
      v8 = 4;
    __asm { BR              X13 }
  }
  v9 = v7 == 1;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
  *(_BYTE *)(a1 + v6) = v9;
  return a1;
}

uint64_t sub_22AE54858(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  BOOL v9;

  if (a1 != a2)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v6 = *(_QWORD *)(v5 + 64);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, AssociatedTypeWitness);
    v7 = *(unsigned __int8 *)(a2 + v6);
    if (v7 >= 2)
    {
      if (v6 <= 3)
        v8 = v6;
      else
        v8 = 4;
      __asm { BR              X12 }
    }
    v9 = v7 == 1;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, a2, AssociatedTypeWitness);
    *(_BYTE *)(a1 + v6) = v9;
  }
  return a1;
}

uint64_t sub_22AE5495C(uint64_t a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char v7;
  int v8;
  unsigned int v10;
  int v11;
  unsigned int v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (!a2)
    return 0;
  v5 = *(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64);
  if (a2 < 0xFF)
    goto LABEL_19;
  v6 = v5 + 1;
  v7 = 8 * (v5 + 1);
  if ((v5 + 1) <= 3)
  {
    v10 = ((a2 + ~(-1 << v7) - 254) >> v7) + 1;
    if (HIWORD(v10))
    {
      v8 = *(_DWORD *)(a1 + v6);
      if (!v8)
        goto LABEL_19;
      goto LABEL_12;
    }
    if (v10 > 0xFF)
    {
      v8 = *(unsigned __int16 *)(a1 + v6);
      if (!*(_WORD *)(a1 + v6))
        goto LABEL_19;
      goto LABEL_12;
    }
    if (v10 < 2)
    {
LABEL_19:
      v12 = *(unsigned __int8 *)(a1 + v5);
      if (v12 >= 2)
        return (v12 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v8 = *(unsigned __int8 *)(a1 + v6);
  if (!*(_BYTE *)(a1 + v6))
    goto LABEL_19;
LABEL_12:
  v11 = (v8 - 1) << v7;
  if (v6 > 3)
    v11 = 0;
  if ((_DWORD)v6)
  {
    if (v6 > 3)
      LODWORD(v6) = 4;
    __asm { BR              X11 }
  }
  return (v11 + 255);
}

void sub_22AE54A94(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  uint64_t v6;
  size_t v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  v6 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  v7 = v6 + 1;
  if (a3 < 0xFF)
  {
    v8 = 0;
  }
  else if (v7 <= 3)
  {
    v10 = ((a3 + ~(-1 << (8 * v7)) - 254) >> (8 * v7)) + 1;
    if (HIWORD(v10))
    {
      v8 = 4u;
    }
    else if (v10 >= 0x100)
    {
      v8 = 2;
    }
    else
    {
      v8 = v10 > 1;
    }
  }
  else
  {
    v8 = 1u;
  }
  if (a2 <= 0xFE)
    __asm { BR              X11 }
  v9 = a2 - 255;
  if (v7 < 4)
  {
    if ((_DWORD)v6 != -1)
    {
      v11 = v9 & ~(-1 << (8 * v7));
      bzero(a1, v7);
      if ((_DWORD)v7 == 3)
      {
        *(_WORD *)a1 = v11;
        a1[2] = BYTE2(v11);
      }
      else if ((_DWORD)v7 == 2)
      {
        *(_WORD *)a1 = v11;
      }
      else
      {
        *a1 = v11;
      }
    }
  }
  else
  {
    bzero(a1, v6 + 1);
    *(_DWORD *)a1 = v9;
  }
  __asm { BR              X10 }
}

uint64_t sub_22AE54C50(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  result = *(unsigned __int8 *)(a1 + v2);
  if (result >= 2)
  {
    if (v2 <= 3)
      v4 = v2;
    else
      v4 = 4;
    __asm { BR              X12 }
  }
  return result;
}

void sub_22AE54D04(_BYTE *a1, unsigned int a2)
{
  size_t v4;
  unsigned int v5;
  unsigned int v6;
  int v7;

  v4 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  if (a2 > 1)
  {
    v5 = a2 - 2;
    if (v4 < 4)
    {
      v6 = v5 >> (8 * v4);
      v7 = v5 & ~(-1 << (8 * v4));
      a1[v4] = v6 + 2;
      bzero(a1, v4);
      if ((_DWORD)v4 == 3)
      {
        *(_WORD *)a1 = v7;
        a1[2] = BYTE2(v7);
      }
      else if ((_DWORD)v4 == 2)
      {
        *(_WORD *)a1 = v7;
      }
      else
      {
        *a1 = v7;
      }
    }
    else
    {
      a1[v4] = 2;
      bzero(a1, v4);
      *(_DWORD *)a1 = v5;
    }
  }
  else
  {
    a1[v4] = a2;
  }
}

uint64_t _s18PreviewsServicesUI17SceneUpdateTimingOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_22AE54E28 + 4 * byte_22AE5F7AF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22AE54E5C + 4 * byte_22AE5F7AA[v4]))();
}

uint64_t sub_22AE54E5C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE54E64(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22AE54E6CLL);
  return result;
}

uint64_t sub_22AE54E78(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22AE54E80);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22AE54E84(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE54E8C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SceneUpdateTiming.UnknownTimingError()
{
  return &type metadata for SceneUpdateTiming.UnknownTimingError;
}

uint64_t sub_22AE54EA8()
{
  return 0;
}

uint64_t sub_22AE54EB0()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_22AE54EB8(_QWORD *a1, id *a2)
{
  id v3;
  id v4;

  v3 = *a2;
  v4 = *a2;
  *a1 = v3;
  return a1;
}

void sub_22AE54EE8(id *a1)
{

}

void **sub_22AE54EF0(void **a1, id *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = *a2;
  v4 = *a2;
  v5 = *a1;
  *a1 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void **sub_22AE54F34(void **a1, void **a2)
{
  void *v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t sub_22AE54F64(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 8))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_22AE54FAC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 8) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

void sub_22AE54FE8()
{
  JUMPOUT(0x22E2E92D8);
}

uint64_t sub_22AE54FF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22AE55130(a1, a2, a3, (uint64_t)&unk_22AE5FAD0, (uint64_t)&unk_22AE5FB10);
}

void sub_22AE5500C()
{
  JUMPOUT(0x22E2E92D8);
}

uint64_t sub_22AE5501C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22AE55130(a1, a2, a3, (uint64_t)&unk_22AE5FB54, (uint64_t)&unk_22AE5FB94);
}

unint64_t sub_22AE55034(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_22AE55060();
  result = sub_22AE550A4();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_22AE55060()
{
  unint64_t result;

  result = qword_255B539A8;
  if (!qword_255B539A8)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5FBD8, &type metadata for SceneUpdateTiming.UnknownTimingError);
    atomic_store(result, (unint64_t *)&qword_255B539A8);
  }
  return result;
}

unint64_t sub_22AE550A4()
{
  unint64_t result;

  result = qword_255B539B0;
  if (!qword_255B539B0)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE5FC18, &type metadata for SceneUpdateTiming.UnknownTimingError);
    atomic_store(result, (unint64_t *)&qword_255B539B0);
  }
  return result;
}

void sub_22AE550E8()
{
  JUMPOUT(0x22E2E92D8);
}

uint64_t sub_22AE550F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22AE55130(a1, a2, a3, (uint64_t)&unk_22AE5FC5C, (uint64_t)&unk_22AE5FC9C);
}

void sub_22AE5510C()
{
  JUMPOUT(0x22E2E92D8);
}

uint64_t sub_22AE5511C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22AE55130(a1, a2, a3, (uint64_t)&unk_22AE5FCE0, (uint64_t)&unk_22AE5FD20);
}

uint64_t sub_22AE55130(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x22E2E92D8](a4);
  result = MEMORY[0x22E2E92D8](a5, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_22AE55178()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_22AE5519C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 48))();
}

uint64_t previewImage(category:description:file:line:)()
{
  void *v0;

  v0 = (void *)sub_22AE5E00C();
  objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_, v0);

  return sub_22AE5E03C();
}

id previewImage(category:description:file:line:)()
{
  void *v0;
  id v1;

  v0 = (void *)sub_22AE5E00C();
  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_, v0);

  return v1;
}

uint64_t PreviewPreferences.InterfaceOrientation.description.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22AE5528C + 4 * byte_22AE5FEB0[*v0]))(0xD000000000000012, 0x800000022AE60F30);
}

uint64_t sub_22AE5528C()
{
  return 0x7469617274726F70;
}

uint64_t sub_22AE552A4()
{
  return 0x70616373646E616CLL;
}

uint64_t PreviewPreferences.InterfaceOrientation.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22AE55310 + 4 * byte_22AE5FEB4[*v0]))(0xD000000000000012, 0x800000022AE60F30);
}

uint64_t sub_22AE55310()
{
  return 0x7469617274726F70;
}

uint64_t sub_22AE55328()
{
  return 0x70616373646E616CLL;
}

PreviewsServicesUI::PreviewPreferences::InterfaceOrientation_optional __swiftcall PreviewPreferences.InterfaceOrientation.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  PreviewsServicesUI::PreviewPreferences::InterfaceOrientation_optional result;
  char v5;

  v2 = v1;
  v3 = sub_22AE5E234();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_22AE553B8(char *a1)
{
  sub_22AE58C3C(*a1);
}

void sub_22AE553C4()
{
  char *v0;

  sub_22AE58F3C(*v0);
}

void sub_22AE553CC(uint64_t a1)
{
  char *v1;

  sub_22AE5932C(a1, *v1);
}

void sub_22AE553D4(uint64_t a1)
{
  char *v1;

  sub_22AE59564(a1, *v1);
}

PreviewsServicesUI::PreviewPreferences::InterfaceOrientation_optional sub_22AE553DC(Swift::String *a1)
{
  return PreviewPreferences.InterfaceOrientation.init(rawValue:)(*a1);
}

uint64_t sub_22AE553E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PreviewPreferences.InterfaceOrientation.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t PreviewPreferences.preferredSize.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void PreviewPreferences.preferredOrientation.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 17);
}

PreviewsServicesUI::PreviewPreferences __swiftcall PreviewPreferences.init(preferredSize:preferredOrientation:)(CGSize_optional preferredSize, PreviewsServicesUI::PreviewPreferences::InterfaceOrientation preferredOrientation)
{
  char v2;
  char *v3;
  uint64_t v4;
  char v5;
  PreviewsServicesUI::PreviewPreferences result;

  v5 = *v3;
  *(_QWORD *)v4 = *(_QWORD *)&preferredSize.is_nil;
  *(_QWORD *)(v4 + 8) = preferredOrientation;
  *(_BYTE *)(v4 + 16) = v2 & 1;
  *(_BYTE *)(v4 + 17) = v5;
  result.preferredSize.value.height = preferredSize.value.height;
  result.preferredSize.value.width = preferredSize.value.width;
  result.preferredSize.is_nil = preferredSize.is_nil;
  return result;
}

void static PreviewPreferences.default.getter(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
}

uint64_t sub_22AE55450(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000014;
  else
    return 0x6572726566657270;
}

uint64_t sub_22AE55498(char *a1, char *a2)
{
  return sub_22AE58B8C(*a1, *a2);
}

uint64_t sub_22AE554A4()
{
  return sub_22AE59008();
}

uint64_t sub_22AE554AC()
{
  return sub_22AE592C4();
}

uint64_t sub_22AE554B4()
{
  return sub_22AE5962C();
}

uint64_t sub_22AE554BC@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_22AE5E234();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_22AE55518@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22AE55450(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

void PreviewPreferences.dictionaryValue.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(v0 + 17);
  sub_22AE55808(*(_QWORD *)v0, *(_QWORD *)(v0 + 8), *(_BYTE *)(v0 + 16), 0);
  __asm { BR              X10 }
}

uint64_t sub_22AE555BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v5[2];
  __int128 v6;

  *(_QWORD *)&v6 = 0x7469617274726F70;
  *((_QWORD *)&v6 + 1) = 0xE800000000000000;
  sub_22AE4C700(&v6, v5);
  v2 = *(_QWORD *)(v1 - 40);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22AE57AC8(v5, v0 + 2, 0x800000022AE61070, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_22AE55670(uint64_t a1, uint64_t a2, __int16 a3, char a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;

  v4 = 8 * a4;
  v5 = *(_QWORD *)&aPreferenseed[v4];
  v6 = *(_QWORD *)&aCes[v4];
  if ((a3 & 0xFF00) != 0x400)
  {
    v7 = HIBYTE(a3);
    sub_22AE55808(a1, a2, a3 & 1, 0);
    *((_QWORD *)&v10 + 1) = MEMORY[0x24BEE0D00];
    __asm { BR              X10 }
  }
  v9 = 0u;
  v10 = 0u;
  return sub_22AE55C4C((uint64_t)&v9, v5, v6);
}

uint64_t sub_22AE55808(uint64_t a1, uint64_t a2, char a3, char a4)
{
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  char v9;
  uint64_t v10;
  uint64_t v11;
  _OWORD v13[2];
  __int128 v14;
  __int128 v15;

  if ((a3 & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
  }
  else
  {
    v6 = MEMORY[0x24BEE50B0];
    *((_QWORD *)&v15 + 1) = MEMORY[0x24BEE50B0];
    *(_QWORD *)&v14 = a1;
    sub_22AE4C700(&v14, v13);
    v7 = MEMORY[0x24BEE4B00];
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_22AE57AC8(v13, 0x6874646977, 0xE500000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
    *((_QWORD *)&v15 + 1) = v6;
    *(_QWORD *)&v14 = a2;
    sub_22AE4C700(&v14, v13);
    v9 = swift_isUniquelyReferenced_nonNull_native();
    sub_22AE57AC8(v13, 0x746867696568, 0xE600000000000000, v9);
    swift_bridgeObjectRelease();
    *((_QWORD *)&v15 + 1) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B539F0);
    *(_QWORD *)&v14 = v7;
  }
  if ((a4 & 1) != 0)
    v10 = 0xD000000000000014;
  else
    v10 = 0x6572726566657270;
  if ((a4 & 1) != 0)
    v11 = 0x800000022AE61070;
  else
    v11 = 0xED0000657A695364;
  return sub_22AE55C4C((uint64_t)&v14, v10, v11);
}

PreviewsServicesUI::PreviewPreferences __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> PreviewPreferences.init(dictionaryValue:)(Swift::OpaquePointer dictionaryValue)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  PreviewsServicesUI::PreviewPreferences result;

  v4 = v1;
  v5 = sub_22AE5635C(0, (uint64_t)dictionaryValue._rawValue);
  if (!v2)
  {
    v9 = v5;
    if (v5)
    {
      v10 = sub_22AE5DB34(v5);
      v12 = v11;
    }
    else
    {
      v10 = 0.0;
      v12 = 0;
    }
    sub_22AE56B00(1, (uint64_t)dictionaryValue._rawValue, &v16);
    v13 = v16;
    if (v16 != 4)
    {
      v6 = swift_bridgeObjectRelease();
      *(double *)v4 = v10;
      *(_QWORD *)(v4 + 8) = v12;
      *(_BYTE *)(v4 + 16) = v9 == 0;
      *(_BYTE *)(v4 + 17) = v13;
      goto LABEL_9;
    }
    sub_22AE57BF8();
    swift_allocError();
    v15 = v14;
    *(_QWORD *)(v14 + 24) = &type metadata for PreviewPreferences.Key;
    *(_BYTE *)v14 = 1;
    *(_QWORD *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53610);
    *(_QWORD *)(v15 + 32) = MEMORY[0x24BEE0D00];
    *(_BYTE *)(v15 + 96) = 0;
    swift_willThrow();
  }
  v6 = swift_bridgeObjectRelease();
LABEL_9:
  result.preferredSize.value.height = v8;
  result.preferredSize.value.width = v7;
  *(_WORD *)&result.preferredSize.is_nil = v6;
  return result;
}

void PreviewPreferences.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = *((unsigned __int8 *)v0 + 17);
  if ((v0[2] & 1) != 0)
    __asm { BR              X9 }
  v2 = *v0;
  v3 = v0[1];
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B539C8);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_22AE60140;
  v5 = MEMORY[0x24BEE50B0];
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE50B0];
  v6 = sub_22AE58604();
  *(_QWORD *)(v4 + 64) = v6;
  *(_QWORD *)(v4 + 32) = v2;
  *(_QWORD *)(v4 + 96) = v5;
  *(_QWORD *)(v4 + 104) = v6;
  *(_QWORD *)(v4 + 72) = v3;
  sub_22AE5E0D8();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();
  __asm { BR              X9 }
}

uint64_t sub_22AE55BB8()
{
  uint64_t v1;

  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();
  return v1;
}

uint64_t sub_22AE55C4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _OWORD v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_22AE4C700((_OWORD *)a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_22AE57AC8(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_22AE589AC(a1);
    sub_22AE56D14(a2, a3, v9);
    sub_22AE589AC((uint64_t)v9);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_22AE55D04@<X0>(char a1@<W0>, uint64_t a2@<X1>, __int128 *a3@<X8>)
{
  char v4;
  uint64_t v5;
  uint64_t v7;
  unint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t result;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[2];

  v4 = a1 & 1;
  if ((a1 & 1) != 0)
    v5 = 0xE900000000000061;
  else
    v5 = 0xE400000000000000;
  if (!*(_QWORD *)(a2 + 16)
    || ((a1 & 1) != 0 ? (v7 = 0x746144746E657665) : (v7 = 1684366707), v8 = sub_22AE56E00(v7, v5), (v9 & 1) == 0))
  {
    v17 = 0u;
    v18 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_22AE4C77C(*(_QWORD *)(a2 + 56) + 32 * v8, (uint64_t)&v17);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v18 + 1))
  {
LABEL_13:
    result = sub_22AE589AC((uint64_t)&v17);
    v12 = xmmword_22AE60150;
    goto LABEL_14;
  }
  sub_22AE4C700(&v17, v19);
  sub_22AE4C77C((uint64_t)v19, (uint64_t)&v17);
  v10 = MEMORY[0x24BDCDDE8];
  if ((swift_dynamicCast() & 1) != 0)
  {
    result = __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
    v12 = v16;
LABEL_14:
    *a3 = v12;
    return result;
  }
  sub_22AE57BF8();
  swift_allocError();
  v14 = v13;
  v15 = v13 + 64;
  *(_QWORD *)(v13 + 24) = &type metadata for HostToShellMessage.Key;
  *(_BYTE *)v13 = v4;
  *(_QWORD *)(v13 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53A10);
  *(_QWORD *)(v14 + 32) = v10;
  sub_22AE4C77C((uint64_t)v19, v15);
  *(_BYTE *)(v14 + 96) = 1;
  swift_willThrow();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
}

uint64_t sub_22AE55E98(char a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[2];

  v2 = a1 & 1;
  if ((a1 & 1) != 0)
    v3 = 0xE900000000000061;
  else
    v3 = 0xE400000000000000;
  if (!*(_QWORD *)(a2 + 16)
    || ((a1 & 1) != 0 ? (v5 = 0x746144746E657665) : (v5 = 1684366707), v6 = sub_22AE56E00(v5, v3), (v7 & 1) == 0))
  {
    v14 = 0u;
    v15 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_22AE4C77C(*(_QWORD *)(a2 + 56) + 32 * v6, (uint64_t)&v14);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v15 + 1))
  {
LABEL_13:
    sub_22AE589AC((uint64_t)&v14);
    return 0;
  }
  sub_22AE4C700(&v14, v16);
  sub_22AE4C77C((uint64_t)v16, (uint64_t)&v14);
  v8 = MEMORY[0x24BEE1768];
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return v13;
  }
  else
  {
    sub_22AE57BF8();
    swift_allocError();
    v11 = v10;
    v12 = v10 + 64;
    *(_QWORD *)(v10 + 24) = &type metadata for HostToShellMessage.Key;
    *(_BYTE *)v10 = v2;
    *(_QWORD *)(v10 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B539E8);
    *(_QWORD *)(v11 + 32) = v8;
    sub_22AE4C77C((uint64_t)v16, v12);
    *(_BYTE *)(v11 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
}

uint64_t sub_22AE5602C(char a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[2];

  v2 = a1 & 1;
  if ((a1 & 1) != 0)
    v3 = 0xE600000000000000;
  else
    v3 = 0xE500000000000000;
  if (!*(_QWORD *)(a2 + 16)
    || ((a1 & 1) != 0 ? (v5 = 0x746867696568) : (v5 = 0x6874646977), v6 = sub_22AE56E00(v5, v3), (v7 & 1) == 0))
  {
    v14 = 0u;
    v15 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_22AE4C77C(*(_QWORD *)(a2 + 56) + 32 * v6, (uint64_t)&v14);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v15 + 1))
  {
LABEL_13:
    sub_22AE589AC((uint64_t)&v14);
    return 0;
  }
  sub_22AE4C700(&v14, v16);
  sub_22AE4C77C((uint64_t)v16, (uint64_t)&v14);
  v8 = MEMORY[0x24BEE50B0];
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return v13;
  }
  else
  {
    sub_22AE57BF8();
    swift_allocError();
    v11 = v10;
    v12 = v10 + 64;
    *(_QWORD *)(v10 + 24) = &_s3KeyON;
    *(_BYTE *)v10 = v2;
    *(_QWORD *)(v10 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53A18);
    *(_QWORD *)(v11 + 32) = v8;
    sub_22AE4C77C((uint64_t)v16, v12);
    *(_BYTE *)(v11 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
}

uint64_t sub_22AE561BC(char a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[2];

  v2 = a1 & 1;
  if ((a1 & 1) != 0)
    v3 = 0x800000022AE61070;
  else
    v3 = 0xED0000657A695364;
  if (!*(_QWORD *)(a2 + 16)
    || ((a1 & 1) != 0 ? (v5 = 0xD000000000000014) : (v5 = 0x6572726566657270),
        v6 = sub_22AE56E00(v5, v3),
        (v7 & 1) == 0))
  {
    v14 = 0u;
    v15 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_22AE4C77C(*(_QWORD *)(a2 + 56) + 32 * v6, (uint64_t)&v14);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v15 + 1))
  {
LABEL_13:
    sub_22AE589AC((uint64_t)&v14);
    return 0;
  }
  sub_22AE4C700(&v14, v16);
  sub_22AE4C77C((uint64_t)v16, (uint64_t)&v14);
  v8 = MEMORY[0x24BEE0D00];
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return v13;
  }
  else
  {
    sub_22AE57BF8();
    swift_allocError();
    v11 = v10;
    v12 = v10 + 64;
    *(_QWORD *)(v10 + 24) = &type metadata for PreviewPreferences.Key;
    *(_BYTE *)v10 = v2;
    *(_QWORD *)(v10 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53610);
    *(_QWORD *)(v11 + 32) = v8;
    sub_22AE4C77C((uint64_t)v16, v12);
    *(_BYTE *)(v11 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  }
}

uint64_t sub_22AE5635C(char a1, uint64_t a2)
{
  char v2;
  uint64_t v3;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];
  uint64_t v16;

  v2 = a1 & 1;
  if ((a1 & 1) != 0)
    v3 = 0x800000022AE61070;
  else
    v3 = 0xED0000657A695364;
  if (!*(_QWORD *)(a2 + 16)
    || ((a1 & 1) != 0 ? (v5 = 0xD000000000000014) : (v5 = 0x6572726566657270),
        v6 = sub_22AE56E00(v5, v3),
        (v7 & 1) == 0))
  {
    v13 = 0u;
    v14 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  sub_22AE4C77C(*(_QWORD *)(a2 + 56) + 32 * v6, (uint64_t)&v13);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v14 + 1))
  {
LABEL_13:
    sub_22AE589AC((uint64_t)&v13);
    return 0;
  }
  sub_22AE4C700(&v13, v15);
  sub_22AE4C77C((uint64_t)v15, (uint64_t)&v13);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B539F0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    return v16;
  }
  else
  {
    sub_22AE57BF8();
    swift_allocError();
    v11 = v10;
    v12 = v10 + 64;
    *(_QWORD *)(v10 + 24) = &type metadata for PreviewPreferences.Key;
    *(_BYTE *)v10 = v2;
    *(_QWORD *)(v10 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B539F8);
    *(_QWORD *)(v11 + 32) = v8;
    sub_22AE4C77C((uint64_t)v15, v12);
    *(_BYTE *)(v11 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  }
}

uint64_t sub_22AE56500(char a1, uint64_t a2)
{
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];

  if (!*(_QWORD *)(a2 + 16)
    || (v4 = sub_22AE56E00(*(_QWORD *)&aPreferenseed[8 * a1], *(_QWORD *)&aCes[8 * a1]), (v5 & 1) == 0))
  {
    v12 = 0u;
    v13 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_22AE4C77C(*(_QWORD *)(a2 + 56) + 32 * v4, (uint64_t)&v12);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v13 + 1))
  {
LABEL_7:
    sub_22AE589AC((uint64_t)&v12);
    return 0;
  }
  sub_22AE4C700(&v12, v14);
  sub_22AE4C77C((uint64_t)v14, (uint64_t)&v12);
  v6 = MEMORY[0x24BEE0D00];
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    return v11;
  }
  else
  {
    sub_22AE57BF8();
    swift_allocError();
    v9 = v8;
    v10 = v8 + 64;
    *(_QWORD *)(v8 + 24) = &type metadata for ShellToHostMessage.Key;
    *(_BYTE *)v8 = a1;
    *(_QWORD *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53610);
    *(_QWORD *)(v9 + 32) = v6;
    sub_22AE4C77C((uint64_t)v14, v10);
    *(_BYTE *)(v9 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
}

unint64_t sub_22AE56678(char a1, uint64_t a2)
{
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int8 v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  _OWORD v15[2];
  unsigned int v16;
  unsigned __int8 v17;

  if (!*(_QWORD *)(a2 + 16)
    || (v4 = sub_22AE56E00(*(_QWORD *)&aPreferenseed[8 * a1], *(_QWORD *)&aCes[8 * a1]), (v5 & 1) == 0))
  {
    v13 = 0u;
    v14 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_22AE4C77C(*(_QWORD *)(a2 + 56) + 32 * v4, (uint64_t)&v13);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v14 + 1))
  {
LABEL_7:
    sub_22AE589AC((uint64_t)&v13);
    v7 = 0;
    v8 = 1;
    goto LABEL_8;
  }
  sub_22AE4C700(&v13, v15);
  sub_22AE4C77C((uint64_t)v15, (uint64_t)&v13);
  v6 = MEMORY[0x24BEE3F88];
  if ((swift_dynamicCast() & 1) != 0)
  {
    v17 = 0;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
    v7 = v16;
    v8 = v17;
LABEL_8:
    LOBYTE(v15[0]) = v8;
    return v7 | ((unint64_t)v8 << 32);
  }
  sub_22AE57BF8();
  swift_allocError();
  v11 = v10;
  v12 = v10 + 64;
  *(_QWORD *)(v10 + 24) = &type metadata for ShellToHostMessage.Key;
  *(_BYTE *)v10 = a1;
  *(_QWORD *)(v10 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53A00);
  *(_QWORD *)(v11 + 32) = v6;
  sub_22AE4C77C((uint64_t)v15, v12);
  *(_BYTE *)(v11 + 96) = 1;
  swift_willThrow();
  return __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
}

uint64_t sub_22AE56804(char a1, uint64_t a2)
{
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  _OWORD v14[2];

  if (!*(_QWORD *)(a2 + 16)
    || (v4 = sub_22AE56E00(*(_QWORD *)&aPreferenseed[8 * a1], *(_QWORD *)&aCes[8 * a1]), (v5 & 1) == 0))
  {
    v12 = 0u;
    v13 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_22AE4C77C(*(_QWORD *)(a2 + 56) + 32 * v4, (uint64_t)&v12);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v13 + 1))
  {
LABEL_7:
    sub_22AE589AC((uint64_t)&v12);
    return 0;
  }
  sub_22AE4C700(&v12, v14);
  sub_22AE4C77C((uint64_t)v14, (uint64_t)&v12);
  v6 = MEMORY[0x24BEE1768];
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
    return v11;
  }
  else
  {
    sub_22AE57BF8();
    swift_allocError();
    v9 = v8;
    v10 = v8 + 64;
    *(_QWORD *)(v8 + 24) = &type metadata for ShellToHostMessage.Key;
    *(_BYTE *)v8 = a1;
    *(_QWORD *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B539E8);
    *(_QWORD *)(v9 + 32) = v6;
    sub_22AE4C77C((uint64_t)v14, v10);
    *(_BYTE *)(v9 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v14);
  }
}

uint64_t sub_22AE56984(char a1, uint64_t a2)
{
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  _OWORD v13[2];
  uint64_t v14;

  if (!*(_QWORD *)(a2 + 16)
    || (v4 = sub_22AE56E00(*(_QWORD *)&aPreferenseed[8 * a1], *(_QWORD *)&aCes[8 * a1]), (v5 & 1) == 0))
  {
    v11 = 0u;
    v12 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_22AE4C77C(*(_QWORD *)(a2 + 56) + 32 * v4, (uint64_t)&v11);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v12 + 1))
  {
LABEL_7:
    sub_22AE589AC((uint64_t)&v11);
    return 0;
  }
  sub_22AE4C700(&v11, v13);
  sub_22AE4C77C((uint64_t)v13, (uint64_t)&v11);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B539F0);
  if ((swift_dynamicCast() & 1) != 0)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
    return v14;
  }
  else
  {
    sub_22AE57BF8();
    swift_allocError();
    v9 = v8;
    v10 = v8 + 64;
    *(_QWORD *)(v8 + 24) = &type metadata for ShellToHostMessage.Key;
    *(_BYTE *)v8 = a1;
    *(_QWORD *)(v8 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B539F8);
    *(_QWORD *)(v9 + 32) = v6;
    sub_22AE4C77C((uint64_t)v13, v10);
    *(_BYTE *)(v9 + 96) = 1;
    swift_willThrow();
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
}

uint64_t sub_22AE56B00@<X0>(char a1@<W0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  char v5;
  uint64_t result;
  void *v7;
  void *v8;
  uint64_t v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v5 = a1 & 1;
  result = sub_22AE561BC(a1 & 1, a2);
  if (!v3)
  {
    v8 = v7;
    if (v7)
    {
      v9 = result;
      swift_bridgeObjectRetain();
      v10._countAndFlagsBits = v9;
      v10._object = v8;
      PreviewPreferences.InterfaceOrientation.init(rawValue:)(v10);
      if (v14 == 4)
      {
        sub_22AE57BF8();
        swift_allocError();
        v12 = v11;
        *(_QWORD *)(v11 + 24) = &type metadata for PreviewPreferences.Key;
        *(_BYTE *)v11 = v5;
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53A20);
        *(_QWORD *)(v12 + 32) = &type metadata for PreviewPreferences.InterfaceOrientation;
        *(_QWORD *)(v12 + 88) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v12 + 56) = v13;
        *(_QWORD *)(v12 + 64) = v9;
        *(_QWORD *)(v12 + 72) = v8;
        *(_BYTE *)(v12 + 96) = 2;
        return swift_willThrow();
      }
      else
      {
        result = swift_bridgeObjectRelease();
        *a3 = v14;
      }
    }
    else
    {
      *a3 = 4;
    }
  }
  return result;
}

uint64_t sub_22AE56C0C@<X0>(char a1@<W0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v3;
  uint64_t result;
  void *v7;
  void *v8;
  uint64_t v9;
  Swift::String v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  result = sub_22AE56500(a1, a2);
  if (!v3)
  {
    v8 = v7;
    if (v7)
    {
      v9 = result;
      swift_bridgeObjectRetain();
      v10._countAndFlagsBits = v9;
      v10._object = v8;
      SuppressedPresentation.init(rawValue:)(v10);
      if (v14 == 11)
      {
        sub_22AE57BF8();
        swift_allocError();
        v12 = v11;
        *(_QWORD *)(v11 + 24) = &type metadata for ShellToHostMessage.Key;
        *(_BYTE *)v11 = a1;
        v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53A08);
        *(_QWORD *)(v12 + 32) = &type metadata for SuppressedPresentation;
        *(_QWORD *)(v12 + 88) = MEMORY[0x24BEE0D00];
        *(_QWORD *)(v12 + 56) = v13;
        *(_QWORD *)(v12 + 64) = v9;
        *(_QWORD *)(v12 + 72) = v8;
        *(_BYTE *)(v12 + 96) = 2;
        return swift_willThrow();
      }
      else
      {
        result = swift_bridgeObjectRelease();
        *a3 = v14;
      }
    }
    else
    {
      *a3 = 11;
    }
  }
  return result;
}

double sub_22AE56D14@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;
  _OWORD v14[2];

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_22AE56E00(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_22AE580E4();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_22AE4C700((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), v14);
    sub_22AE57738(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    sub_22AE4C700(v14, a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

unint64_t sub_22AE56E00(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_22AE5E2D0();
  sub_22AE5E0F0();
  v4 = sub_22AE5E2F4();
  return sub_22AE57F68(a1, a2, v4);
}

unint64_t sub_22AE56E64(uint64_t a1)
{
  uint64_t v2;

  sub_22AE5E2D0();
  sub_22AE5E2E8();
  v2 = sub_22AE5E2F4();
  return sub_22AE58048(a1, v2);
}

uint64_t sub_22AE56EBC(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v21;
  int64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _OWORD *v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  _OWORD v36[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53638);
  v35 = a2;
  v6 = sub_22AE5E210();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v8 + 63) >> 6;
    v13 = v6 + 64;
    result = swift_retain();
    v15 = 0;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v15 << 6);
      }
      else
      {
        if (__OFADD__(v15++, 1))
          goto LABEL_39;
        if (v15 >= v12)
        {
LABEL_32:
          swift_release();
          v3 = v2;
          if ((v35 & 1) != 0)
          {
            v34 = 1 << *(_BYTE *)(v5 + 32);
            if (v34 >= 64)
              bzero((void *)(v5 + 64), ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
            else
              *v9 = -1 << v34;
            *(_QWORD *)(v5 + 16) = 0;
          }
          break;
        }
        v21 = v9[v15];
        if (!v21)
        {
          v22 = v15 + 1;
          if (v15 + 1 >= v12)
            goto LABEL_32;
          v21 = v9[v22];
          if (!v21)
          {
            while (1)
            {
              v15 = v22 + 1;
              if (__OFADD__(v22, 1))
                break;
              if (v15 >= v12)
                goto LABEL_32;
              v21 = v9[v15];
              ++v22;
              if (v21)
                goto LABEL_19;
            }
LABEL_38:
            __break(1u);
LABEL_39:
            __break(1u);
            return result;
          }
          ++v15;
        }
LABEL_19:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v15 << 6);
      }
      v23 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v19);
      v25 = *v23;
      v24 = v23[1];
      v26 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v19);
      if ((v35 & 1) != 0)
      {
        sub_22AE4C700(v26, v36);
      }
      else
      {
        sub_22AE4C77C((uint64_t)v26, (uint64_t)v36);
        swift_bridgeObjectRetain();
      }
      sub_22AE5E2D0();
      sub_22AE5E0F0();
      result = sub_22AE5E2F4();
      v27 = -1 << *(_BYTE *)(v7 + 32);
      v28 = result & ~v27;
      v29 = v28 >> 6;
      if (((-1 << v28) & ~*(_QWORD *)(v13 + 8 * (v28 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v28) & ~*(_QWORD *)(v13 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v30 = 0;
        v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v32 = v29 == v31;
          if (v29 == v31)
            v29 = 0;
          v30 |= v32;
          v33 = *(_QWORD *)(v13 + 8 * v29);
        }
        while (v33 == -1);
        v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      v17 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v16);
      *v17 = v25;
      v17[1] = v24;
      result = (uint64_t)sub_22AE4C700(v36, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v16));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_22AE571A0(uint64_t a1, char a2, uint64_t *a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  int64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v23;
  int64_t v24;
  uint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  __int128 v32;

  v4 = v3;
  v6 = *v3;
  __swift_instantiateConcreteTypeFromMangledName(a3);
  v31 = a2;
  result = sub_22AE5E210();
  v8 = result;
  if (*(_QWORD *)(v6 + 16))
  {
    v9 = 0;
    v10 = (_QWORD *)(v6 + 64);
    v11 = 1 << *(_BYTE *)(v6 + 32);
    if (v11 < 64)
      v12 = ~(-1 << v11);
    else
      v12 = -1;
    v13 = v12 & *(_QWORD *)(v6 + 64);
    v14 = (unint64_t)(v11 + 63) >> 6;
    v15 = result + 64;
    while (1)
    {
      if (v13)
      {
        v20 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v21 = v20 | (v9 << 6);
      }
      else
      {
        if (__OFADD__(v9++, 1))
          goto LABEL_40;
        if (v9 >= v14)
        {
LABEL_31:
          if ((v31 & 1) == 0)
          {
            result = swift_release();
            v4 = v3;
            goto LABEL_38;
          }
          v30 = 1 << *(_BYTE *)(v6 + 32);
          if (v30 >= 64)
            bzero((void *)(v6 + 64), ((unint64_t)(v30 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
          else
            *v10 = -1 << v30;
          v4 = v3;
          *(_QWORD *)(v6 + 16) = 0;
          break;
        }
        v23 = v10[v9];
        if (!v23)
        {
          v24 = v9 + 1;
          if (v9 + 1 >= v14)
            goto LABEL_31;
          v23 = v10[v24];
          if (!v23)
          {
            while (1)
            {
              v9 = v24 + 1;
              if (__OFADD__(v24, 1))
                break;
              if (v9 >= v14)
                goto LABEL_31;
              v23 = v10[v9];
              ++v24;
              if (v23)
                goto LABEL_20;
            }
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
            return result;
          }
          ++v9;
        }
LABEL_20:
        v13 = (v23 - 1) & v23;
        v21 = __clz(__rbit64(v23)) + (v9 << 6);
      }
      v25 = *(_QWORD *)(*(_QWORD *)(v6 + 48) + 8 * v21);
      v32 = *(_OWORD *)(*(_QWORD *)(v6 + 56) + 16 * v21);
      if ((v31 & 1) == 0)
        swift_retain();
      sub_22AE5E2D0();
      sub_22AE5E2E8();
      result = sub_22AE5E2F4();
      v16 = -1 << *(_BYTE *)(v8 + 32);
      v17 = result & ~v16;
      v18 = v17 >> 6;
      if (((-1 << v17) & ~*(_QWORD *)(v15 + 8 * (v17 >> 6))) != 0)
      {
        v19 = __clz(__rbit64((-1 << v17) & ~*(_QWORD *)(v15 + 8 * (v17 >> 6)))) | v17 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v26 = 0;
        v27 = (unint64_t)(63 - v16) >> 6;
        do
        {
          if (++v18 == v27 && (v26 & 1) != 0)
          {
            __break(1u);
            goto LABEL_39;
          }
          v28 = v18 == v27;
          if (v18 == v27)
            v18 = 0;
          v26 |= v28;
          v29 = *(_QWORD *)(v15 + 8 * v18);
        }
        while (v29 == -1);
        v19 = __clz(__rbit64(~v29)) + (v18 << 6);
      }
      *(_QWORD *)(v15 + ((v19 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v19;
      *(_QWORD *)(*(_QWORD *)(v8 + 48) + 8 * v19) = v25;
      *(_OWORD *)(*(_QWORD *)(v8 + 56) + 16 * v19) = v32;
      ++*(_QWORD *)(v8 + 16);
    }
  }
  result = swift_release();
LABEL_38:
  *v4 = v8;
  return result;
}

uint64_t sub_22AE57464(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  __int128 v30;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53A28);
  result = sub_22AE5E210();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v29 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v12 = (unint64_t)(v9 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v19 = v18 | (v8 << 6);
      }
      else
      {
        v20 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v12)
          goto LABEL_33;
        v21 = v29[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v12)
            goto LABEL_33;
          v21 = v29[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v12)
            {
LABEL_33:
              if ((a2 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v28 = 1 << *(_BYTE *)(v5 + 32);
              if (v28 >= 64)
                bzero(v29, ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v29 = -1 << v28;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v29[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_42;
                if (v8 >= v12)
                  goto LABEL_33;
                v21 = v29[v8];
                ++v22;
                if (v21)
                  goto LABEL_30;
              }
            }
            v8 = v22;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v19 = __clz(__rbit64(v21)) + (v8 << 6);
      }
      v27 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v19);
      v30 = *(_OWORD *)(*(_QWORD *)(v5 + 56) + 16 * v19);
      if ((a2 & 1) == 0)
        swift_retain();
      sub_22AE5E2D0();
      sub_22AE5E2E8();
      result = sub_22AE5E2F4();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v25 = v16 == v24;
          if (v16 == v24)
            v16 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v26 == -1);
        v17 = __clz(__rbit64(~v26)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v17) = v27;
      *(_OWORD *)(*(_QWORD *)(v7 + 56) + 16 * v17) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

unint64_t sub_22AE57738(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_22AE5E1B0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_22AE5E2D0();
        swift_bridgeObjectRetain();
        sub_22AE5E0F0();
        v10 = sub_22AE5E2F4();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_22AE57910(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  uint64_t v21;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_22AE5E1B0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_22AE5E2D0();
        sub_22AE5E2E8();
        result = sub_22AE5E2F4();
        v9 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v9 < v8)
            goto LABEL_5;
        }
        else if (v9 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v9)
        {
LABEL_11:
          v10 = *(_QWORD *)(a2 + 48);
          v11 = (_QWORD *)(v10 + 8 * v3);
          v12 = (_QWORD *)(v10 + 8 * v6);
          if (v3 != v6 || v11 >= v12 + 1)
            *v11 = *v12;
          v13 = *(_QWORD *)(a2 + 56);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v14 >= v15 + 1))
          {
            *v14 = *v15;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v16 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v17 = *v16;
    v18 = (-1 << v3) - 1;
  }
  else
  {
    v16 = (uint64_t *)(v4 + 8 * (result >> 6));
    v18 = *v16;
    v17 = (-1 << result) - 1;
  }
  *v16 = v18 & v17;
  v19 = *(_QWORD *)(a2 + 16);
  v20 = __OFSUB__(v19, 1);
  v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v21;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

_OWORD *sub_22AE57AC8(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_22AE56E00(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
        return sub_22AE4C700(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_22AE580E4();
      goto LABEL_7;
    }
    sub_22AE56EBC(v15, a4 & 1);
    v21 = sub_22AE56E00(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_22AE57F00(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_22AE5E27C();
  __break(1u);
  return result;
}

unint64_t sub_22AE57BF8()
{
  unint64_t result;

  result = qword_255B539C0;
  if (!qword_255B539C0)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE60A6C, &type metadata for UnarchiveError);
    atomic_store(result, (unint64_t *)&qword_255B539C0);
  }
  return result;
}

uint64_t sub_22AE57C3C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_22AE57C54(a1, a2, a3, a4, &qword_255B53A40);
}

uint64_t sub_22AE57C48(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_22AE57C54(a1, a2, a3, a4, &qword_255B53A38);
}

uint64_t sub_22AE57C54(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  _QWORD *v5;
  _QWORD *v7;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t result;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  char v22;
  _QWORD *v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v7 = v5;
  v12 = *v5;
  v14 = sub_22AE56E64(a3);
  v15 = *(_QWORD *)(v12 + 16);
  v16 = (v13 & 1) == 0;
  result = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v18 = v13;
  v19 = *(_QWORD *)(v12 + 24);
  if (v19 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v19 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_22AE582D4(a5);
LABEL_7:
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
    {
LABEL_8:
      v21 = (_QWORD *)(v20[7] + 16 * v14);
      *v21 = a1;
      v21[1] = a2;
      return swift_release();
    }
LABEL_11:
    v20[(v14 >> 6) + 8] |= 1 << v14;
    *(_QWORD *)(v20[6] + 8 * v14) = a3;
    v23 = (_QWORD *)(v20[7] + 16 * v14);
    *v23 = a1;
    v23[1] = a2;
    v24 = v20[2];
    v25 = __OFADD__(v24, 1);
    v26 = v24 + 1;
    if (!v25)
    {
      v20[2] = v26;
      return result;
    }
    goto LABEL_14;
  }
  sub_22AE571A0(result, a4 & 1, a5);
  result = sub_22AE56E64(a3);
  if ((v18 & 1) == (v22 & 1))
  {
    v14 = result;
    v20 = (_QWORD *)*v7;
    if ((v18 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_22AE5E27C();
  __break(1u);
  return result;
}

uint64_t sub_22AE57DB8(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  return sub_22AE57C54(a1, a2, a3, a4, &qword_255B53A30);
}

uint64_t sub_22AE57DC4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  char v20;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v10 = *v4;
  v12 = sub_22AE56E64(a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= result && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= result && (a4 & 1) == 0)
  {
    result = (uint64_t)sub_22AE5845C();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_QWORD *)(v18[7] + 16 * v12);
      result = swift_release();
      *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_QWORD *)(v18[6] + 8 * v12) = a3;
    v21 = (_QWORD *)(v18[7] + 16 * v12);
    *v21 = a1;
    v21[1] = a2;
    v22 = v18[2];
    v23 = __OFADD__(v22, 1);
    v24 = v22 + 1;
    if (!v23)
    {
      v18[2] = v24;
      return result;
    }
    goto LABEL_14;
  }
  sub_22AE57464(result, a4 & 1);
  result = sub_22AE56E64(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_22AE5E27C();
  __break(1u);
  return result;
}

_OWORD *sub_22AE57F00(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_22AE4C700(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

unint64_t sub_22AE57F68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22AE5E264() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_22AE5E264() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_22AE58048(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

void *sub_22AE580E4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53638);
  v2 = *v0;
  v3 = sub_22AE5E204();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_26:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1))
      goto LABEL_28;
    if (v9 >= v13)
    {
LABEL_24:
      result = (void *)swift_release();
      v1 = v25;
      goto LABEL_26;
    }
    v23 = *(_QWORD *)(v6 + 8 * v9);
    if (!v23)
      break;
LABEL_23:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_22AE4C77C(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_22AE4C700(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_23;
  }
  __break(1u);
LABEL_28:
  __break(1u);
  return result;
}

void *sub_22AE582B0()
{
  return sub_22AE582D4(&qword_255B53A40);
}

void *sub_22AE582BC()
{
  return sub_22AE582D4(&qword_255B53A38);
}

void *sub_22AE582C8()
{
  return sub_22AE582D4(&qword_255B53A30);
}

void *sub_22AE582D4(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  uint64_t v7;
  unint64_t v8;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  unint64_t v22;
  int64_t v23;

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(a1);
  v3 = *v1;
  v4 = sub_22AE5E204();
  v5 = v4;
  if (!*(_QWORD *)(v3 + 16))
  {
LABEL_24:
    result = (void *)swift_release();
    *v2 = v5;
    return result;
  }
  result = (void *)(v4 + 64);
  v7 = v3 + 64;
  v8 = (unint64_t)((1 << *(_BYTE *)(v5 + 32)) + 63) >> 6;
  if (v5 != v3 || (unint64_t)result >= v3 + 64 + 8 * v8)
    result = memmove(result, (const void *)(v3 + 64), 8 * v8);
  v10 = 0;
  *(_QWORD *)(v5 + 16) = *(_QWORD *)(v3 + 16);
  v11 = 1 << *(_BYTE *)(v3 + 32);
  v12 = -1;
  if (v11 < 64)
    v12 = ~(-1 << v11);
  v13 = v12 & *(_QWORD *)(v3 + 64);
  v14 = (unint64_t)(v11 + 63) >> 6;
  while (1)
  {
    if (v13)
    {
      v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      v16 = v15 | (v10 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v10++, 1))
      goto LABEL_26;
    if (v10 >= v14)
      goto LABEL_24;
    v22 = *(_QWORD *)(v7 + 8 * v10);
    if (!v22)
      break;
LABEL_23:
    v13 = (v22 - 1) & v22;
    v16 = __clz(__rbit64(v22)) + (v10 << 6);
LABEL_12:
    v17 = 8 * v16;
    v18 = *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v16);
    v19 = 16 * v16;
    v20 = *(_OWORD *)(*(_QWORD *)(v3 + 56) + v19);
    *(_QWORD *)(*(_QWORD *)(v5 + 48) + v17) = v18;
    *(_OWORD *)(*(_QWORD *)(v5 + 56) + v19) = v20;
    result = (void *)swift_retain();
  }
  v23 = v10 + 1;
  if (v10 + 1 >= v14)
    goto LABEL_24;
  v22 = *(_QWORD *)(v7 + 8 * v23);
  if (v22)
  {
    ++v10;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v10 >= v14)
      goto LABEL_24;
    v22 = *(_QWORD *)(v7 + 8 * v10);
    ++v23;
    if (v22)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_22AE5845C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53A28);
  v2 = *v0;
  v3 = sub_22AE5E204();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    v18 = 16 * v15;
    v19 = *(_OWORD *)(*(_QWORD *)(v2 + 56) + v18);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_OWORD *)(*(_QWORD *)(v4 + 56) + v18) = v19;
    result = (void *)swift_retain();
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

unint64_t sub_22AE58604()
{
  unint64_t result;

  result = qword_255B539D0;
  if (!qword_255B539D0)
  {
    result = MEMORY[0x22E2E92D8](MEMORY[0x24BEE5108], MEMORY[0x24BEE50B0]);
    atomic_store(result, (unint64_t *)&qword_255B539D0);
  }
  return result;
}

unint64_t sub_22AE5864C()
{
  unint64_t result;

  result = qword_255B539D8;
  if (!qword_255B539D8)
  {
    result = MEMORY[0x22E2E92D8](&protocol conformance descriptor for PreviewPreferences.InterfaceOrientation, &type metadata for PreviewPreferences.InterfaceOrientation);
    atomic_store(result, (unint64_t *)&qword_255B539D8);
  }
  return result;
}

__n128 __swift_memcpy18_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u16[0] = a2[1].n128_u16[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewPreferences(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 18))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 17);
  v4 = v3 >= 4;
  v5 = v3 - 4;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewPreferences(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_WORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 253;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 18) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 18) = 0;
    if (a2)
      *(_BYTE *)(result + 17) = a2 + 3;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewPreferences()
{
  return &type metadata for PreviewPreferences;
}

uint64_t getEnumTagSinglePayload for PreviewPreferences.InterfaceOrientation(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewPreferences.InterfaceOrientation(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_22AE58818 + 4 * byte_22AE5FECD[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22AE5884C + 4 * byte_22AE5FEC8[v4]))();
}

uint64_t sub_22AE5884C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE58854(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22AE5885CLL);
  return result;
}

uint64_t sub_22AE58868(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22AE58870);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22AE58874(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5887C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewPreferences.InterfaceOrientation()
{
  return &type metadata for PreviewPreferences.InterfaceOrientation;
}

uint64_t storeEnumTagSinglePayload for PreviewPreferences.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_22AE588E4 + 4 * byte_22AE5FED7[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22AE58918 + 4 * byte_22AE5FED2[v4]))();
}

uint64_t sub_22AE58918(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE58920(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22AE58928);
  return result;
}

uint64_t sub_22AE58934(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22AE5893CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22AE58940(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE58948(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewPreferences.Key()
{
  return &type metadata for PreviewPreferences.Key;
}

unint64_t sub_22AE58968()
{
  unint64_t result;

  result = qword_255B539E0;
  if (!qword_255B539E0)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE600D4, &type metadata for PreviewPreferences.Key);
    atomic_store(result, (unint64_t *)&qword_255B539E0);
  }
  return result;
}

uint64_t sub_22AE589AC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B535F0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22AE589EC(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x746867696568;
  else
    v3 = 0x6874646977;
  if (v2)
    v4 = 0xE500000000000000;
  else
    v4 = 0xE600000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x746867696568;
  else
    v5 = 0x6874646977;
  if ((a2 & 1) != 0)
    v6 = 0xE600000000000000;
  else
    v6 = 0xE500000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_22AE5E264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22AE58A84(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aColorpicfontpi[8 * a1] == *(_QWORD *)&aColorpicfontpi[8 * a2]
    && *(_QWORD *)&aKer[8 * a1] == *(_QWORD *)&aKer[8 * a2])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_22AE5E264();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22AE58B08(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aPreferenseed_0[8 * a1] == *(_QWORD *)&aPreferenseed_0[8 * a2]
    && *(_QWORD *)&aCes_0[8 * a1] == *(_QWORD *)&aCes_0[8 * a2])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_22AE5E264();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_22AE58B8C(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000014;
  else
    v3 = 0x6572726566657270;
  if (v2)
    v4 = 0xED0000657A695364;
  else
    v4 = 0x800000022AE61070;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000014;
  else
    v5 = 0x6572726566657270;
  if ((a2 & 1) != 0)
    v6 = 0x800000022AE61070;
  else
    v6 = 0xED0000657A695364;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_22AE5E264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_22AE58C3C(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_22AE58C88(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_22AE58CF4 + 4 * byte_22AE60164[a2]))(0x7469617274726F70);
}

uint64_t sub_22AE58CF4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x7469617274726F70 && v1 == 0xE800000000000000)
    v2 = 1;
  else
    v2 = sub_22AE5E264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_22AE58D90(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x746144746E657665;
  else
    v3 = 1684366707;
  if (v2)
    v4 = 0xE400000000000000;
  else
    v4 = 0xE900000000000061;
  if ((a2 & 1) != 0)
    v5 = 0x746144746E657665;
  else
    v5 = 1684366707;
  if ((a2 & 1) != 0)
    v6 = 0xE900000000000061;
  else
    v6 = 0xE400000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_22AE5E264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22AE58E2C(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x636E797361;
  else
    v3 = 0x6465636E6566;
  if (v2)
    v4 = 0xE600000000000000;
  else
    v4 = 0xE500000000000000;
  if ((a2 & 1) != 0)
    v5 = 0x636E797361;
  else
    v5 = 0x6465636E6566;
  if ((a2 & 1) != 0)
    v6 = 0xE500000000000000;
  else
    v6 = 0xE600000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_22AE5E264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_22AE58EC4()
{
  sub_22AE5E2D0();
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

void sub_22AE58F3C(char a1)
{
  sub_22AE5E2D0();
  __asm { BR              X10 }
}

uint64_t sub_22AE58F90()
{
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE59008()
{
  sub_22AE5E2D0();
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE59098()
{
  sub_22AE5E2D0();
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE59114()
{
  sub_22AE5E2D0();
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE5917C()
{
  sub_22AE5E2D0();
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE591F4()
{
  sub_22AE5E0F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22AE59244()
{
  sub_22AE5E0F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22AE59284()
{
  sub_22AE5E0F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22AE592C4()
{
  sub_22AE5E0F0();
  return swift_bridgeObjectRelease();
}

void sub_22AE5932C(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_22AE59370()
{
  sub_22AE5E0F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22AE593D4()
{
  sub_22AE5E0F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22AE59428()
{
  sub_22AE5E0F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22AE59478()
{
  sub_22AE5E2D0();
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE594EC()
{
  sub_22AE5E2D0();
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

void sub_22AE59564(uint64_t a1, char a2)
{
  sub_22AE5E2D0();
  __asm { BR              X10 }
}

uint64_t sub_22AE595B4()
{
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE5962C()
{
  sub_22AE5E2D0();
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE596B8()
{
  sub_22AE5E2D0();
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE5971C()
{
  sub_22AE5E2D0();
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

void sub_22AE59790()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v2[48];
  _QWORD v3[5];

  sub_22AE4ACAC(v0, (uint64_t)v2);
  ShellToHostMessage.payloadDescription.getter();
  if (v1)
  {
    v3[0] = 40;
    v3[1] = 0xE100000000000000;
    sub_22AE5E0FC();
    sub_22AE5E0FC();
    swift_bridgeObjectRelease();
  }
  sub_22AE4ACAC(v0, (uint64_t)v3);
  __asm { BR              X11 }
}

uint64_t sub_22AE59854()
{
  uint64_t v1;

  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t sub_22AE59974()
{
  uint64_t v0;

  HostToShellMessage.payloadDescription.getter();
  if (v0)
  {
    sub_22AE5E0FC();
    sub_22AE5E0FC();
    swift_bridgeObjectRelease();
  }
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return 46;
}

uint64_t sub_22AE59AA4(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;

  v2 = 8 * a2;
  v3 = *(_QWORD *)&aPreferenseed_0[v2];
  v4 = *(_QWORD *)&aCes_0[v2];
  if (a1 == 11)
  {
    v9 = 0u;
    v10 = 0u;
  }
  else
  {
    *((_QWORD *)&v10 + 1) = MEMORY[0x24BEE0D00];
    v5 = 8 * a1;
    v6 = *(_QWORD *)&aColorpicfontpi[v5];
    v7 = *(_QWORD *)&aKer[v5];
    *(_QWORD *)&v9 = v6;
    *((_QWORD *)&v9 + 1) = v7;
  }
  return sub_22AE55C4C((uint64_t)&v9, v3, v4);
}

void sub_22AE59B24(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = 0x10200u >> (8 * *(_BYTE *)(v1 + 16));
}

uint64_t HostToShellMessage.messageType.getter()
{
  uint64_t v0;

  return 0x10200u >> (8 * *(_BYTE *)(v0 + 16));
}

void *sub_22AE59B58()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (*(_BYTE *)(v0 + 16))
    return 0;
  v1 = *(void **)(v0 + 8);
  v2 = v1;
  return v1;
}

void *HostToShellMessage.fenceHandle.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  if (*(_BYTE *)(v0 + 16))
    return 0;
  v1 = *(void **)(v0 + 8);
  v2 = v1;
  return v1;
}

uint64_t HostToShellMessage.payload.getter()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  char v10;
  _OWORD v12[2];
  __int128 v13;
  uint64_t v14;

  v1 = *(void **)v0;
  if (*(_BYTE *)(v0 + 16))
  {
    if (*(_BYTE *)(v0 + 16) == 1)
    {
      v2 = *(void **)(v0 + 8);
      v3 = objc_msgSend(v1, sel_data);
      v4 = sub_22AE5E000();
      v6 = v5;

      v14 = MEMORY[0x24BDCDDE8];
      *(_QWORD *)&v13 = v4;
      *((_QWORD *)&v13 + 1) = v6;
      sub_22AE4C700(&v13, v12);
      v7 = MEMORY[0x24BEE4B00];
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_22AE57AC8(v12, 0x746144746E657665, 0xE900000000000061, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      sub_22AE4A8E0(v1, v2, 1);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v14 = MEMORY[0x24BEE1768];
    *(_QWORD *)&v13 = v1;
    sub_22AE4C700(&v13, v12);
    v9 = MEMORY[0x24BEE4B00];
    v10 = swift_isUniquelyReferenced_nonNull_native();
    sub_22AE57AC8(v12, 1684366707, 0xE400000000000000, v10);
    v7 = v9;
    swift_bridgeObjectRelease();
  }
  return v7;
}

void sub_22AE59D14(char *a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  HostToShellMessage.init(messageType:fenceHandle:payload:)(*a1, a2, a3, a4);
}

void HostToShellMessage.init(messageType:fenceHandle:payload:)(char a1@<W0>, void *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4;
  void *v5;
  _WORD *v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  _WORD *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  __int128 v20;

  v5 = a2;
  if (!a1)
  {
    v8 = sub_22AE55E98(0, a3);
    if (v4)
    {
LABEL_18:
      swift_bridgeObjectRelease();
      goto LABEL_19;
    }
    if ((v9 & 1) == 0)
    {
      v10 = v8;
      swift_bridgeObjectRelease();
      v11 = 0;
LABEL_11:
      *(_QWORD *)a4 = v10;
      *(_QWORD *)(a4 + 8) = v5;
      *(_BYTE *)(a4 + 16) = v11;
      return;
    }
    sub_22AE57BF8();
    swift_allocError();
    v17 = v16;
    *(_QWORD *)(v16 + 24) = &type metadata for HostToShellMessage.Key;
    *(_BYTE *)v16 = 0;
    *(_QWORD *)(v16 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B539E8);
    *(_QWORD *)(v17 + 32) = MEMORY[0x24BEE1768];
    *(_BYTE *)(v17 + 96) = 0;
LABEL_17:
    swift_willThrow();
    goto LABEL_18;
  }
  if (a1 != 1)
  {
    if (!a2)
    {
      sub_22AE55D04(1, a3, &v20);
      if (!v4)
      {
        v13 = *((_QWORD *)&v20 + 1);
        if (*((_QWORD *)&v20 + 1) >> 60 != 15)
        {
          v18 = v20;
          swift_bridgeObjectRelease();
          v19 = objc_allocWithZone((Class)UVHardwareEvent);
          v10 = (uint64_t)sub_22AE5B2D0();
          sub_22AE5B38C(v18, v13);
          v5 = 0;
          v11 = 1;
          goto LABEL_11;
        }
        sub_22AE57BF8();
        swift_allocError();
        v15 = v14;
        *(_QWORD *)(v14 + 24) = &type metadata for HostToShellMessage.Key;
        *(_BYTE *)v14 = 1;
        *(_QWORD *)(v14 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53A10);
        *(_QWORD *)(v15 + 32) = MEMORY[0x24BDCDDE8];
        *(_BYTE *)(v15 + 96) = 0;
        swift_willThrow();
      }
      swift_bridgeObjectRelease();
      return;
    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_255B53A48);
    sub_22AE5B3E4(&qword_255B53A50, &qword_255B53A48);
    swift_allocError();
    *v12 = 258;
    goto LABEL_17;
  }
  swift_bridgeObjectRelease();
  if (!v5)
  {
    v10 = 0;
    v11 = 2;
    goto LABEL_11;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53A48);
  sub_22AE5B3E4(&qword_255B53A50, &qword_255B53A48);
  swift_allocError();
  *v7 = 257;
  swift_willThrow();
LABEL_19:

}

unint64_t HostToShellMessage.payloadDescription.getter()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  unint64_t v6;

  v1 = *(void **)v0;
  if (!*(_BYTE *)(v0 + 16))
  {
    v6 = 0;
    sub_22AE5E0FC();
    sub_22AE5E240();
    sub_22AE5E0FC();
    swift_bridgeObjectRelease();
    return v6;
  }
  if (*(_BYTE *)(v0 + 16) == 1)
  {
    v2 = *(void **)(v0 + 8);
    v3 = v1;
    sub_22AE5E1BC();
    swift_bridgeObjectRelease();
    v6 = 0xD000000000000010;
    v4 = objc_msgSend(v3, sel_description);
    sub_22AE5E0CC();

    sub_22AE5E0FC();
    swift_bridgeObjectRelease();
    sub_22AE4A8E0(v1, v2, 1);
    return v6;
  }
  return 0;
}

uint64_t sub_22AE5A10C()
{
  return sub_22AE59974();
}

uint64_t sub_22AE5A118()
{
  uint64_t v0;

  return ((uint64_t (*)(void))((char *)sub_22AE5A138 + 4 * byte_22AE60179[*(unsigned __int8 *)(v0 + 40)]))();
}

void sub_22AE5A138(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

void sub_22AE5A144(_BYTE *a1@<X8>)
{
  *a1 = 3;
}

void sub_22AE5A150(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

void sub_22AE5A15C(char *a1@<X8>)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  char v8;

  v4 = v2[1];
  v3 = v2[2];
  v5 = v2[3] | v2[4];
  v6 = v5 | v1 | v3 | v4;
  if (v5 | v3 | v4)
    v7 = 0;
  else
    v7 = v1 == 1;
  if (v7)
    v8 = 4;
  else
    v8 = 5;
  if (!v6)
    v8 = 2;
  *a1 = v8;
}

uint64_t ShellToHostMessage.messageType.getter()
{
  uint64_t v0;

  return ((uint64_t (*)())((char *)sub_22AE5A1C0 + 4 * byte_22AE6017E[*(unsigned __int8 *)(v0 + 40)]))();
}

uint64_t sub_22AE5A1C0()
{
  return 1;
}

uint64_t sub_22AE5A1C8()
{
  return 3;
}

uint64_t sub_22AE5A1D0()
{
  return 6;
}

uint64_t sub_22AE5A1D8@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  unsigned int v7;

  v3 = v1[1];
  v2 = v1[2];
  v4 = v1[3] | v1[4];
  v5 = v4 | a1 | v2 | v3;
  if (v4 | v2 | v3)
    v6 = 0;
  else
    v6 = a1 == 1;
  if (v6)
    v7 = 4;
  else
    v7 = 5;
  if (v5)
    return v7;
  else
    return 2;
}

void sub_22AE5A218()
{
  __asm { BR              X11 }
}

void *sub_22AE5A250()
{
  void *v0;
  id v1;

  v1 = v0;
  return v0;
}

void ShellToHostMessage.fenceHandle.getter()
{
  __asm { BR              X11 }
}

void *sub_22AE5A2C8()
{
  void *v0;
  id v1;

  v1 = v0;
  return v0;
}

void ShellToHostMessage.payload.getter()
{
  __asm { BR              X11 }
}

uint64_t sub_22AE5A340@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int16 a3@<W8>)
{
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v6;
  _OWORD v7[2];
  __int128 v8;
  uint64_t v9;

  v6 = MEMORY[0x24BEE4B00];
  sub_22AE55670(a1, a2, a3 & 0xFF01, 0);
  v9 = MEMORY[0x24BEE1768];
  *(_QWORD *)&v8 = v3;
  sub_22AE4C700(&v8, v7);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22AE57AC8(v7, 1684366707, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  return v6;
}

void sub_22AE5A478(char *a1)
{
  ShellToHostMessage.init(messageType:fenceHandle:payload:)(*a1);
}

void ShellToHostMessage.init(messageType:fenceHandle:payload:)(char a1)
{
  __asm { BR              X10 }
}

void sub_22AE5A4D4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  unsigned __int16 v14;

  v4 = sub_22AE56984(0, v2);
  if (v0)
    goto LABEL_7;
  if (!v4)
    goto LABEL_5;
  PreviewPreferences.init(dictionaryValue:)((Swift::OpaquePointer)v4);
  if (v5)
  {
LABEL_7:
    swift_bridgeObjectRelease();

    return;
  }
  if ((v14 & 0xFF00) == 0x400)
  {
LABEL_5:
    sub_22AE57BF8();
    swift_allocError();
    v7 = v6;
    *(_QWORD *)(v6 + 24) = &type metadata for ShellToHostMessage.Key;
    *(_BYTE *)v6 = 0;
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B539F0);
    *(_QWORD *)(v7 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B539F8);
    *(_QWORD *)(v7 + 32) = v8;
LABEL_6:
    *(_BYTE *)(v7 + 96) = 0;
    swift_willThrow();
    goto LABEL_7;
  }
  v9 = sub_22AE56804(1, v2);
  if ((v10 & 1) != 0)
  {
    sub_22AE57BF8();
    swift_allocError();
    v7 = v12;
    *(_QWORD *)(v12 + 24) = &type metadata for ShellToHostMessage.Key;
    *(_BYTE *)v12 = 1;
    *(_QWORD *)(v12 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B539E8);
    *(_QWORD *)(v7 + 32) = MEMORY[0x24BEE1768];
    goto LABEL_6;
  }
  v11 = v9;
  swift_bridgeObjectRelease();
  *(_OWORD *)v3 = v13;
  *(_QWORD *)(v3 + 16) = v14 & 0xFF01;
  *(_QWORD *)(v3 + 24) = v11;
  *(_QWORD *)(v3 + 32) = v1;
  *(_BYTE *)(v3 + 40) = 0;
}

void ShellToHostMessage.payloadDescription.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_22AE5AAF4()
{
  sub_22AE5E1BC();
  sub_22AE5E0FC();
  PreviewPreferences.description.getter();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();
  sub_22AE5E240();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  return 0;
}

void sub_22AE5AC90()
{
  uint64_t v0;
  uint64_t v1;

  sub_22AE4ACAC(v0, (uint64_t)&v1);
  sub_22AE59790();
}

uint64_t HostToShellMessage.MessageType.rawValue.getter(char a1)
{
  uint64_t result;

  result = 0xD000000000000013;
  if (a1)
  {
    if (a1 == 1)
      return 0xD000000000000026;
    else
      return 0x6572617764726168;
  }
  return result;
}

uint64_t sub_22AE5AD34(char a1)
{
  if ((a1 & 1) != 0)
    return 0x746144746E657665;
  else
    return 1684366707;
}

uint64_t sub_22AE5AD68(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  return sub_22AE5AF78(a1, a2, a3, a4, (uint64_t (*)(uint64_t))HostToShellMessage.MessageType.rawValue.getter);
}

uint64_t sub_22AE5AD74(uint64_t a1, uint64_t a2)
{
  return sub_22AE5B010(a1, a2, (void (*)(uint64_t))HostToShellMessage.MessageType.rawValue.getter);
}

uint64_t sub_22AE5AD80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22AE5B080(a1, a2, a3, (void (*)(_QWORD))HostToShellMessage.MessageType.rawValue.getter);
}

uint64_t sub_22AE5AD8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22AE5B0CC(a1, a2, a3, (void (*)(uint64_t))HostToShellMessage.MessageType.rawValue.getter);
}

uint64_t sub_22AE5AD98@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s18PreviewsServicesUI18HostToShellMessageO0G4TypeO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22AE5ADC4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = HostToShellMessage.MessageType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22AE5ADEC(char *a1, char *a2)
{
  return sub_22AE58D90(*a1, *a2);
}

uint64_t sub_22AE5ADF8()
{
  return sub_22AE59098();
}

uint64_t sub_22AE5AE00()
{
  return sub_22AE593D4();
}

uint64_t sub_22AE5AE08()
{
  return sub_22AE594EC();
}

uint64_t sub_22AE5AE10@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_22AE5E234();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_22AE5AE6C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22AE5AD34(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t ShellToHostMessage.MessageType.rawValue.getter(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_22AE5AED4 + 4 * byte_22AE6019E[a1]))(0xD000000000000017, 0x800000022AE60E70);
}

unint64_t sub_22AE5AED4()
{
  return 0xD000000000000010;
}

uint64_t sub_22AE5AF14()
{
  return 0x5A74736575716572;
}

uint64_t sub_22AE5AF34()
{
  uint64_t v0;

  return v0 + 6;
}

uint64_t sub_22AE5AF4C(char a1)
{
  return *(_QWORD *)&aPreferenseed_0[8 * a1];
}

uint64_t sub_22AE5AF6C(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  return sub_22AE5AF78(a1, a2, a3, a4, (uint64_t (*)(uint64_t))ShellToHostMessage.MessageType.rawValue.getter);
}

uint64_t sub_22AE5AF78(unsigned __int8 *a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  v6 = *a2;
  v7 = a5(*a1);
  v9 = v8;
  if (v7 == a5(v6) && v9 == v10)
    v12 = 1;
  else
    v12 = sub_22AE5E264();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12 & 1;
}

uint64_t sub_22AE5B004(uint64_t a1, uint64_t a2)
{
  return sub_22AE5B010(a1, a2, (void (*)(uint64_t))ShellToHostMessage.MessageType.rawValue.getter);
}

uint64_t sub_22AE5B010(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  unsigned __int8 *v3;
  uint64_t v5;

  v5 = *v3;
  sub_22AE5E2D0();
  a3(v5);
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE5B074(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22AE5B080(a1, a2, a3, (void (*)(_QWORD))ShellToHostMessage.MessageType.rawValue.getter);
}

uint64_t sub_22AE5B080(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD))
{
  unsigned __int8 *v4;

  a4(*v4);
  sub_22AE5E0F0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_22AE5B0C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_22AE5B0CC(a1, a2, a3, (void (*)(uint64_t))ShellToHostMessage.MessageType.rawValue.getter);
}

uint64_t sub_22AE5B0CC(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t))
{
  unsigned __int8 *v4;
  uint64_t v6;

  v6 = *v4;
  sub_22AE5E2D0();
  a4(v6);
  sub_22AE5E0F0();
  swift_bridgeObjectRelease();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE5B12C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = _s18PreviewsServicesUI18ShellToHostMessageO0G4TypeO8rawValueAESgSS_tcfC_0();
  *a1 = result;
  return result;
}

uint64_t sub_22AE5B158@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = ShellToHostMessage.MessageType.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_22AE5B180(char *a1, char *a2)
{
  return sub_22AE58B08(*a1, *a2);
}

uint64_t sub_22AE5B18C()
{
  return sub_22AE59114();
}

uint64_t sub_22AE5B194()
{
  return sub_22AE59284();
}

uint64_t sub_22AE5B19C()
{
  return sub_22AE596B8();
}

uint64_t sub_22AE5B1A4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_22AE5B288();
  *a1 = result;
  return result;
}

uint64_t sub_22AE5B1D0@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22AE5AF4C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t _s18PreviewsServicesUI18ShellToHostMessageO0G4TypeO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_22AE5E234();
  swift_bridgeObjectRelease();
  if (v0 >= 7)
    return 7;
  else
    return v0;
}

uint64_t _s18PreviewsServicesUI18HostToShellMessageO0G4TypeO8rawValueAESgSS_tcfC_0()
{
  unint64_t v0;

  v0 = sub_22AE5E234();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_22AE5B288()
{
  unint64_t v0;

  v0 = sub_22AE5E234();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

id sub_22AE5B2D0()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_22AE5DFF4();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithData_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_22AE5DFE8();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_22AE5B38C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_22AE5B3A0(a1, a2);
  return a1;
}

uint64_t sub_22AE5B3A0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_22AE5B3E4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22E2E92D8](&unk_22AE5FDA4, v4);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_22AE5B428()
{
  unint64_t result;

  result = qword_255B53A68;
  if (!qword_255B53A68)
  {
    result = MEMORY[0x22E2E92D8](&protocol conformance descriptor for HostToShellMessage.MessageType, &type metadata for HostToShellMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_255B53A68);
  }
  return result;
}

unint64_t sub_22AE5B46C(uint64_t a1)
{
  unint64_t result;

  result = sub_22AE5B490();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22AE5B490()
{
  unint64_t result;

  result = qword_255B53AB8;
  if (!qword_255B53AB8)
  {
    result = MEMORY[0x22E2E92D8](&protocol conformance descriptor for HostToShellMessage, &type metadata for HostToShellMessage);
    atomic_store(result, (unint64_t *)&qword_255B53AB8);
  }
  return result;
}

unint64_t sub_22AE5B4D8()
{
  unint64_t result;

  result = qword_255B53AC0;
  if (!qword_255B53AC0)
  {
    result = MEMORY[0x22E2E92D8](&protocol conformance descriptor for ShellToHostMessage.MessageType, &type metadata for ShellToHostMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_255B53AC0);
  }
  return result;
}

unint64_t sub_22AE5B51C(uint64_t a1)
{
  unint64_t result;

  result = sub_22AE5B540();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_22AE5B540()
{
  unint64_t result;

  result = qword_255B53B10;
  if (!qword_255B53B10)
  {
    result = MEMORY[0x22E2E92D8](&protocol conformance descriptor for ShellToHostMessage, &type metadata for ShellToHostMessage);
    atomic_store(result, (unint64_t *)&qword_255B53B10);
  }
  return result;
}

unint64_t sub_22AE5B588()
{
  unint64_t result;

  result = qword_255B53B18;
  if (!qword_255B53B18)
  {
    result = MEMORY[0x22E2E92D8](&protocol conformance descriptor for HostToShellMessage.MessageType, &type metadata for HostToShellMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_255B53B18);
  }
  return result;
}

unint64_t sub_22AE5B5D0()
{
  unint64_t result;

  result = qword_255B53B20;
  if (!qword_255B53B20)
  {
    result = MEMORY[0x22E2E92D8](&protocol conformance descriptor for ShellToHostMessage.MessageType, &type metadata for ShellToHostMessage.MessageType);
    atomic_store(result, (unint64_t *)&qword_255B53B20);
  }
  return result;
}

void destroy for HostToShellMessage(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 16);
  if (v1 >= 2)
    v1 = *(_DWORD *)a1 + 2;
  if (v1 != 1)
  {
    if (v1)
      return;
    a1 += 8;
  }

}

uint64_t _s18PreviewsServicesUI18HostToShellMessageOwCP_0(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(unsigned __int8 *)(a2 + 16);
  if (v3 >= 2)
    v3 = *(_DWORD *)a2 + 2;
  if (v3 == 1)
  {
    v6 = *(void **)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_BYTE *)(a1 + 16) = 1;
    v7 = v6;
  }
  else if (v3)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  }
  else
  {
    v4 = *(void **)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v4;
    *(_BYTE *)(a1 + 16) = 0;
    v5 = v4;
  }
  return a1;
}

uint64_t assignWithCopy for HostToShellMessage(uint64_t a1, __int128 *a2)
{
  unsigned int v4;
  id *v5;
  unsigned int v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  __int128 v11;

  if ((__int128 *)a1 == a2)
    return a1;
  v4 = *(unsigned __int8 *)(a1 + 16);
  if (v4 >= 2)
    v4 = *(_DWORD *)a1 + 2;
  v5 = (id *)a1;
  if (v4 == 1)
    goto LABEL_7;
  if (!v4)
  {
    v5 = (id *)(a1 + 8);
LABEL_7:

  }
  v6 = *((unsigned __int8 *)a2 + 16);
  if (v6 >= 2)
    v6 = *(_DWORD *)a2 + 2;
  if (v6 == 1)
  {
    v9 = *(void **)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_BYTE *)(a1 + 16) = 1;
    v10 = v9;
  }
  else if (v6)
  {
    v11 = *a2;
    *(_BYTE *)(a1 + 16) = *((_BYTE *)a2 + 16);
    *(_OWORD *)a1 = v11;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    v7 = (void *)*((_QWORD *)a2 + 1);
    *(_QWORD *)(a1 + 8) = v7;
    *(_BYTE *)(a1 + 16) = 0;
    v8 = v7;
  }
  return a1;
}

uint64_t assignWithTake for HostToShellMessage(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  id *v5;
  unsigned int v6;
  char v7;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 16);
    if (v4 >= 2)
      v4 = *(_DWORD *)a1 + 2;
    v5 = (id *)a1;
    if (v4 != 1)
    {
      if (v4)
        goto LABEL_8;
      v5 = (id *)(a1 + 8);
    }

LABEL_8:
    v6 = *(unsigned __int8 *)(a2 + 16);
    if (v6 >= 2)
      v6 = *(_DWORD *)a2 + 2;
    if (v6 == 1)
    {
      *(_QWORD *)a1 = *(_QWORD *)a2;
      v7 = 1;
    }
    else
    {
      if (!v6)
      {
        *(_OWORD *)a1 = *(_OWORD *)a2;
        *(_BYTE *)(a1 + 16) = 0;
        return a1;
      }
      *(_OWORD *)a1 = *(_OWORD *)a2;
      v7 = *(_BYTE *)(a2 + 16);
    }
    *(_BYTE *)(a1 + 16) = v7;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for HostToShellMessage(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 >= 3)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for HostToShellMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_BYTE *)(result + 16) = 0;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_22AE5B8B4(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 16);
  if (result >= 2)
    return (*(_DWORD *)a1 + 2);
  return result;
}

uint64_t sub_22AE5B8D0(uint64_t result, unsigned int a2)
{
  if (a2 > 1)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for HostToShellMessage()
{
  return &type metadata for HostToShellMessage;
}

void destroy for ShellToHostMessage(uint64_t a1)
{
  unsigned int v1;

  v1 = *(unsigned __int8 *)(a1 + 40);
  if (v1 >= 4)
    v1 = *(_DWORD *)a1 + 4;
  if (v1 == 1)
  {

  }
  else if (!v1)
  {

  }
}

uint64_t initializeWithCopy for ShellToHostMessage(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  void *v4;
  id v5;
  __int128 v6;
  void *v7;
  id v8;
  char v9;

  v3 = *(unsigned __int8 *)(a2 + 40);
  if (v3 >= 4)
    v3 = *(_DWORD *)a2 + 4;
  switch(v3)
  {
    case 0u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
      v4 = *(void **)(a2 + 32);
      *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 32) = v4;
      *(_BYTE *)(a1 + 40) = 0;
      v5 = v4;
      break;
    case 1u:
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_WORD *)(a1 + 16) = *(_WORD *)(a2 + 16);
      v7 = *(void **)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v7;
      *(_BYTE *)(a1 + 40) = 1;
      v8 = v7;
      break;
    case 2u:
      *(_DWORD *)a1 = *(_DWORD *)a2;
      v9 = 2;
      goto LABEL_9;
    case 3u:
      *(_BYTE *)a1 = *(_BYTE *)a2;
      v9 = 3;
LABEL_9:
      *(_BYTE *)(a1 + 40) = v9;
      break;
    default:
      v6 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v6;
      *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
      break;
  }
  return a1;
}

uint64_t assignWithCopy for ShellToHostMessage(uint64_t a1, __int128 *a2)
{
  unsigned int v4;
  id *v5;
  unsigned int v6;
  __int128 v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  void *v13;
  id v14;
  char v15;

  if ((__int128 *)a1 == a2)
    return a1;
  v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 >= 4)
    v4 = *(_DWORD *)a1 + 4;
  if (v4 == 1)
  {
    v5 = (id *)(a1 + 24);
    goto LABEL_8;
  }
  if (!v4)
  {
    v5 = (id *)(a1 + 32);
LABEL_8:

  }
  v6 = *((unsigned __int8 *)a2 + 40);
  if (v6 >= 4)
    v6 = *(_DWORD *)a2 + 4;
  switch(v6)
  {
    case 0u:
      v7 = *a2;
      *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
      *(_OWORD *)a1 = v7;
      *(_QWORD *)(a1 + 24) = *((_QWORD *)a2 + 3);
      v8 = (void *)*((_QWORD *)a2 + 4);
      *(_QWORD *)(a1 + 32) = v8;
      *(_BYTE *)(a1 + 40) = 0;
      v9 = v8;
      break;
    case 1u:
      v12 = *a2;
      *(_WORD *)(a1 + 16) = *((_WORD *)a2 + 8);
      *(_OWORD *)a1 = v12;
      v13 = (void *)*((_QWORD *)a2 + 3);
      *(_QWORD *)(a1 + 24) = v13;
      *(_BYTE *)(a1 + 40) = 1;
      v14 = v13;
      break;
    case 2u:
      *(_DWORD *)a1 = *(_DWORD *)a2;
      v15 = 2;
      goto LABEL_17;
    case 3u:
      *(_BYTE *)a1 = *(_BYTE *)a2;
      v15 = 3;
LABEL_17:
      *(_BYTE *)(a1 + 40) = v15;
      break;
    default:
      v10 = *a2;
      v11 = a2[1];
      *(_OWORD *)(a1 + 25) = *(__int128 *)((char *)a2 + 25);
      *(_OWORD *)a1 = v10;
      *(_OWORD *)(a1 + 16) = v11;
      break;
  }
  return a1;
}

__n128 __swift_memcpy41_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for ShellToHostMessage(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  id *v5;
  unsigned int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  char v10;

  if (a1 == a2)
    return a1;
  v4 = *(unsigned __int8 *)(a1 + 40);
  if (v4 >= 4)
    v4 = *(_DWORD *)a1 + 4;
  if (v4 == 1)
  {
    v5 = (id *)(a1 + 24);
    goto LABEL_8;
  }
  if (!v4)
  {
    v5 = (id *)(a1 + 32);
LABEL_8:

  }
  v6 = *(unsigned __int8 *)(a2 + 40);
  if (v6 >= 4)
    v6 = *(_DWORD *)a2 + 4;
  switch(v6)
  {
    case 0u:
      v7 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
      *(_BYTE *)(a1 + 40) = 0;
      return a1;
    case 1u:
      v9 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v9;
      v10 = 1;
      goto LABEL_17;
    case 2u:
      *(_DWORD *)a1 = *(_DWORD *)a2;
      v10 = 2;
      goto LABEL_17;
    case 3u:
      *(_BYTE *)a1 = *(_BYTE *)a2;
      v10 = 3;
LABEL_17:
      *(_BYTE *)(a1 + 40) = v10;
      break;
    default:
      v8 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v8;
      *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
      break;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellToHostMessage(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 41))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (v3 >= 5)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ShellToHostMessage(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_OWORD *)(result + 25) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 41) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 41) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = -(char)a2;
  }
  return result;
}

uint64_t sub_22AE5BCC4(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 40);
  if (result >= 4)
    return (*(_DWORD *)a1 + 4);
  return result;
}

uint64_t sub_22AE5BCE0(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(_QWORD *)(result + 32) = 0;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 40) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ShellToHostMessage()
{
  return &type metadata for ShellToHostMessage;
}

uint64_t storeEnumTagSinglePayload for HostToShellMessage.MessageType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_22AE5BD64 + 4 * byte_22AE601B6[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_22AE5BD98 + 4 * byte_22AE601B1[v4]))();
}

uint64_t sub_22AE5BD98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5BDA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22AE5BDA8);
  return result;
}

uint64_t sub_22AE5BDB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22AE5BDBCLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_22AE5BDC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5BDC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HostToShellMessage.MessageType()
{
  return &type metadata for HostToShellMessage.MessageType;
}

uint64_t getEnumTagSinglePayload for ShellToHostMessage.MessageType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ShellToHostMessage.MessageType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_22AE5BEC0 + 4 * byte_22AE601C0[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_22AE5BEF4 + 4 * byte_22AE601BB[v4]))();
}

uint64_t sub_22AE5BEF4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5BEFC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22AE5BF04);
  return result;
}

uint64_t sub_22AE5BF10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22AE5BF18);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_22AE5BF1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5BF24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ShellToHostMessage.MessageType()
{
  return &type metadata for ShellToHostMessage.MessageType;
}

uint64_t storeEnumTagSinglePayload for ShellToHostMessage.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_22AE5BF8C + 4 * byte_22AE601CA[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22AE5BFC0 + 4 * byte_22AE601C5[v4]))();
}

uint64_t sub_22AE5BFC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5BFC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22AE5BFD0);
  return result;
}

uint64_t sub_22AE5BFDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22AE5BFE4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22AE5BFE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5BFF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ShellToHostMessage.Key()
{
  return &type metadata for ShellToHostMessage.Key;
}

uint64_t storeEnumTagSinglePayload for HostToShellMessage.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_22AE5C058 + 4 * byte_22AE601D4[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22AE5C08C + 4 * byte_22AE601CF[v4]))();
}

uint64_t sub_22AE5C08C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5C094(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22AE5C09CLL);
  return result;
}

uint64_t sub_22AE5C0A8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22AE5C0B0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22AE5C0B4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5C0BC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HostToShellMessage.Key()
{
  return &type metadata for HostToShellMessage.Key;
}

unint64_t sub_22AE5C0DC()
{
  unint64_t result;

  result = qword_255B53B28;
  if (!qword_255B53B28)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE6048C, &type metadata for HostToShellMessage.Key);
    atomic_store(result, (unint64_t *)&qword_255B53B28);
  }
  return result;
}

unint64_t sub_22AE5C124()
{
  unint64_t result;

  result = qword_255B53B30;
  if (!qword_255B53B30)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE6052C, &type metadata for ShellToHostMessage.Key);
    atomic_store(result, (unint64_t *)&qword_255B53B30);
  }
  return result;
}

ValueMetadata *type metadata accessor for CancelationToken()
{
  return &type metadata for CancelationToken;
}

uint64_t sub_22AE5C180()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for ObservationStream(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ObservationStream);
}

ValueMetadata *type metadata accessor for Identifier()
{
  return &type metadata for Identifier;
}

uint64_t sub_22AE5C1A4()
{
  return 0;
}

uint64_t sub_22AE5C1AC()
{
  return 0x44726F7272455655;
}

uint64_t sub_22AE5C1D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *boxed_opaque_existential_0;
  char v17;
  uint64_t v19;
  _OWORD v20[2];
  __int128 v21;
  uint64_t v22;

  v4 = sub_22AE5E0CC();
  v6 = v5;
  v7 = sub_22AE5E240();
  v22 = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v21 = v7;
  *((_QWORD *)&v21 + 1) = v8;
  sub_22AE4C700(&v21, v20);
  v9 = MEMORY[0x24BEE4B00];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22AE57AC8(v20, v4, v6, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 24))(a1, a2);
  if (v11)
  {
    v12 = (void *)v11;
    v13 = sub_22AE5E0CC();
    v15 = v14;
    swift_getErrorValue();
    v22 = v19;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)&v21);
    (*(void (**)(uint64_t *))(*(_QWORD *)(v19 - 8) + 16))(boxed_opaque_existential_0);
    sub_22AE4C700(&v21, v20);
    v17 = swift_isUniquelyReferenced_nonNull_native();
    sub_22AE57AC8(v20, v13, v15, v17);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  return v9;
}

uint64_t sub_22AE5C344()
{
  uint64_t v0;
  uint64_t result;

  v0 = arc4random_uniform(0x3E8u);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255B53BC8);
  result = swift_allocObject();
  *(_DWORD *)(result + 24) = 0;
  *(_QWORD *)(result + 16) = v0;
  qword_255B53B38 = result;
  return result;
}

uint64_t *sub_22AE5C390@<X0>(uint64_t *result@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  v2 = *result + 1;
  *result = v2;
  *a2 = v2;
  return result;
}

uint64_t sub_22AE5C3A4()
{
  sub_22AE5E2D0();
  sub_22AE5E2E8();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE5C3E8()
{
  return sub_22AE5E2E8();
}

uint64_t sub_22AE5C410()
{
  sub_22AE5E2D0();
  sub_22AE5E2E8();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE5C450()
{
  return sub_22AE5E240();
}

unint64_t sub_22AE5C494()
{
  unint64_t result;

  result = qword_255B53BC0;
  if (!qword_255B53BC0)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE6070C, &type metadata for Identifier);
    atomic_store(result, (unint64_t *)&qword_255B53BC0);
  }
  return result;
}

uint64_t sub_22AE5C4D8@<X0>(uint64_t *a1@<X0>, uint64_t (**a2)()@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  NSObject *v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;

  v4 = sub_22AE5E030();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  if (*a1)
  {
    v9 = a1[1];
    *a1 = 0;
    a1[1] = 0;
    result = swift_allocObject();
    *(_QWORD *)(result + 16) = v8;
    *(_QWORD *)(result + 24) = v9;
    *a2 = sub_22AE4AA14;
    a2[1] = (uint64_t (*)())result;
  }
  else
  {
    sub_22AE5E018();
    v11 = sub_22AE5E024();
    v12 = sub_22AE5E144();
    if (os_log_type_enabled(v11, (os_log_type_t)v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_22AE41000, v11, (os_log_type_t)v12, "ObservationStream.Token canceled twice", v13, 2u);
      MEMORY[0x22E2E9368](v13, -1, -1);
    }

    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *a2 = 0;
    a2[1] = 0;
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_22AE5C650()
{
  swift_release();
  return swift_deallocObject();
}

_QWORD *destroy for CancelationToken.State(_QWORD *result)
{
  if (*result >= 0xFFFFFFFFuLL)
    return (_QWORD *)swift_release();
  return result;
}

uint64_t _s18PreviewsServicesUI16CancelationTokenV5StateOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_retain();
  }
  return a1;
}

unint64_t *assignWithCopy for CancelationToken.State(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_QWORD *assignWithTake for CancelationToken.State(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  if (*a1 < 0xFFFFFFFFuLL)
    goto LABEL_5;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    swift_release();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for CancelationToken.State(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for CancelationToken.State(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_22AE5C874(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_22AE5C88C(_QWORD *result, int a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2)
      return result;
    v2 = (a2 - 1);
  }
  *result = v2;
  return result;
}

ValueMetadata *type metadata accessor for CancelationToken.State()
{
  return &type metadata for CancelationToken.State;
}

PreviewsServicesUI::SuppressedPresentation_optional __swiftcall SuppressedPresentation.init(catalystErrorCode:)(Swift::Int catalystErrorCode)
{
  char *v1;
  char *v2;
  uint64_t v3;
  char v4;

  v2 = v1;
  v3 = UVSuppressedPresentationFromCatalystErrorCode();
  if ((unint64_t)(v3 + 1) >= 8)
    v4 = 10;
  else
    v4 = 0x60504030201000AuLL >> (8 * (v3 + 1));
  *v2 = v4;
  return (PreviewsServicesUI::SuppressedPresentation_optional)v3;
}

PreviewsServicesUI::SuppressedPresentation_optional __swiftcall SuppressedPresentation.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  PreviewsServicesUI::SuppressedPresentation_optional result;
  char v5;

  v2 = v1;
  v3 = sub_22AE5E234();
  result.value = swift_bridgeObjectRelease();
  v5 = 11;
  if (v3 < 0xB)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t SuppressedPresentation.rawValue.getter()
{
  char *v0;

  return *(_QWORD *)&aColorpicfontpi_0[8 * *v0];
}

uint64_t sub_22AE5C984(char *a1, char *a2)
{
  return sub_22AE58A84(*a1, *a2);
}

unint64_t sub_22AE5C994()
{
  unint64_t result;

  result = qword_255B53BD0;
  if (!qword_255B53BD0)
  {
    result = MEMORY[0x22E2E92D8](&protocol conformance descriptor for SuppressedPresentation, &type metadata for SuppressedPresentation);
    atomic_store(result, (unint64_t *)&qword_255B53BD0);
  }
  return result;
}

uint64_t sub_22AE5C9D8()
{
  sub_22AE5E2D0();
  sub_22AE59244();
  return sub_22AE5E2F4();
}

uint64_t sub_22AE5CA1C()
{
  return sub_22AE59244();
}

uint64_t sub_22AE5CA24()
{
  sub_22AE5E2D0();
  sub_22AE59244();
  return sub_22AE5E2F4();
}

PreviewsServicesUI::SuppressedPresentation_optional sub_22AE5CA64(Swift::String *a1)
{
  return SuppressedPresentation.init(rawValue:)(*a1);
}

uint64_t sub_22AE5CA70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = SuppressedPresentation.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for SuppressedPresentation(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF6)
    goto LABEL_17;
  if (a2 + 10 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 10) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 10;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 10;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 10;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xB;
  v8 = v6 - 11;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SuppressedPresentation(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 10 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 10) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF6)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF5)
    return ((uint64_t (*)(void))((char *)&loc_22AE5CB70 + 4 * byte_22AE607B5[v4]))();
  *a1 = a2 + 10;
  return ((uint64_t (*)(void))((char *)sub_22AE5CBA4 + 4 * asc_22AE607B0[v4]))();
}

uint64_t sub_22AE5CBA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5CBAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22AE5CBB4);
  return result;
}

uint64_t sub_22AE5CBC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22AE5CBC8);
  *(_BYTE *)result = a2 + 10;
  return result;
}

uint64_t sub_22AE5CBCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5CBD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SuppressedPresentation()
{
  return &type metadata for SuppressedPresentation;
}

uint64_t sub_22AE5CBF0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_22AE5CBF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t destroy for UnarchiveError(uint64_t a1)
{
  unsigned int v2;

  v2 = *(unsigned __int8 *)(a1 + 96);
  if (v2 >= 3)
    v2 = *(_DWORD *)a1 + 3;
  if (v2 == 2 || v2 == 1)
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    __swift_destroy_boxed_opaque_existential_0(a1 + 32);
    return __swift_destroy_boxed_opaque_existential_0(a1 + 64);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_0(a1);
    return __swift_destroy_boxed_opaque_existential_0(a1 + 32);
  }
}

uint64_t initializeWithCopy for UnarchiveError(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v4 = *(unsigned __int8 *)(a2 + 96);
  if (v4 >= 3)
    v4 = *(_DWORD *)a2 + 3;
  if (v4 == 2)
  {
    v9 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 24) = v9;
    (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1, a2);
    v10 = *(_QWORD *)(a2 + 56);
    *(_QWORD *)(a1 + 56) = v10;
    (**(void (***)(uint64_t, uint64_t))(v10 - 8))(a1 + 32, a2 + 32);
    v11 = *(_QWORD *)(a2 + 88);
    *(_QWORD *)(a1 + 88) = v11;
    (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1 + 64, a2 + 64);
    v8 = 2;
  }
  else
  {
    v5 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a1 + 24) = v5;
    if (v4 == 1)
    {
      (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
      v6 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 56) = v6;
      (**(void (***)(uint64_t, uint64_t))(v6 - 8))(a1 + 32, a2 + 32);
      v7 = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 88) = v7;
      (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1 + 64, a2 + 64);
      v8 = 1;
    }
    else
    {
      (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1, a2);
      v12 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 56) = v12;
      (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 32, a2 + 32);
      v8 = 0;
    }
  }
  *(_BYTE *)(a1 + 96) = v8;
  return a1;
}

uint64_t assignWithCopy for UnarchiveError(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 96);
    if (v4 >= 3)
      v4 = *(_DWORD *)a1 + 3;
    if (v4 == 2 || v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_0(a1);
      __swift_destroy_boxed_opaque_existential_0(a1 + 32);
      v5 = a1 + 64;
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0(a1);
      v5 = a1 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0(v5);
    v6 = *(unsigned __int8 *)(a2 + 96);
    if (v6 >= 3)
      v6 = *(_DWORD *)a2 + 3;
    if (v6 == 2)
    {
      v11 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v11;
      (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1, a2);
      v12 = *(_QWORD *)(a2 + 56);
      *(_QWORD *)(a1 + 56) = v12;
      (**(void (***)(uint64_t, uint64_t))(v12 - 8))(a1 + 32, a2 + 32);
      v13 = *(_QWORD *)(a2 + 88);
      *(_QWORD *)(a1 + 88) = v13;
      (**(void (***)(uint64_t, uint64_t))(v13 - 8))(a1 + 64, a2 + 64);
      v10 = 2;
    }
    else
    {
      v7 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 24) = v7;
      if (v6 == 1)
      {
        (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
        v8 = *(_QWORD *)(a2 + 56);
        *(_QWORD *)(a1 + 56) = v8;
        (**(void (***)(uint64_t, uint64_t))(v8 - 8))(a1 + 32, a2 + 32);
        v9 = *(_QWORD *)(a2 + 88);
        *(_QWORD *)(a1 + 88) = v9;
        (**(void (***)(uint64_t, uint64_t))(v9 - 8))(a1 + 64, a2 + 64);
        v10 = 1;
      }
      else
      {
        (**(void (***)(uint64_t, uint64_t))(v7 - 8))(a1, a2);
        v14 = *(_QWORD *)(a2 + 56);
        *(_QWORD *)(a1 + 56) = v14;
        (**(void (***)(uint64_t, uint64_t))(v14 - 8))(a1 + 32, a2 + 32);
        v10 = 0;
      }
    }
    *(_BYTE *)(a1 + 96) = v10;
  }
  return a1;
}

__n128 __swift_memcpy97_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_BYTE *)(a1 + 96) = *((_BYTE *)a2 + 96);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for UnarchiveError(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 96);
    if (v4 >= 3)
      v4 = *(_DWORD *)a1 + 3;
    if (v4 == 2 || v4 == 1)
    {
      __swift_destroy_boxed_opaque_existential_0(a1);
      __swift_destroy_boxed_opaque_existential_0(a1 + 32);
      v5 = a1 + 64;
    }
    else
    {
      __swift_destroy_boxed_opaque_existential_0(a1);
      v5 = a1 + 32;
    }
    __swift_destroy_boxed_opaque_existential_0(v5);
    v6 = *(unsigned __int8 *)(a2 + 96);
    if (v6 >= 3)
      v6 = *(_DWORD *)a2 + 3;
    if (v6 == 2 || v6 == 1)
    {
      v7 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = v7;
      v8 = *(_OWORD *)(a2 + 80);
      *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
      *(_OWORD *)(a1 + 80) = v8;
      v9 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v9;
    }
    else
    {
      LOBYTE(v6) = 0;
      v10 = *(_OWORD *)(a2 + 16);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *(_OWORD *)(a1 + 16) = v10;
      v11 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
      *(_OWORD *)(a1 + 48) = v11;
    }
    *(_BYTE *)(a1 + 96) = v6;
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for UnarchiveError(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 97))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 96);
  if (v3 >= 3)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for UnarchiveError(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 96) = 0;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_DWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 97) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 97) = 0;
    if (a2)
      *(_BYTE *)(result + 96) = -(char)a2;
  }
  return result;
}

uint64_t sub_22AE5D0D4(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 96);
  if (result >= 3)
    return (*(_DWORD *)a1 + 3);
  return result;
}

uint64_t sub_22AE5D0F0(uint64_t result, unsigned int a2)
{
  unsigned int v2;

  if (a2 > 2)
  {
    v2 = a2 - 3;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 80) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)result = 0u;
    *(_OWORD *)(result + 16) = 0u;
    LOBYTE(a2) = 3;
    *(_DWORD *)result = v2;
  }
  *(_BYTE *)(result + 96) = a2;
  return result;
}

ValueMetadata *type metadata accessor for UnarchiveError()
{
  return &type metadata for UnarchiveError;
}

uint64_t sub_22AE5D130()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;

  v0 = sub_22AE5E0CC();
  v2 = v1;
  sub_22AE5E1BC();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7 = 0xD000000000000026;
  *((_QWORD *)&v7 + 1) = 0x800000022AE611E0;
  swift_bridgeObjectRetain();
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();
  v8 = MEMORY[0x24BEE0D00];
  sub_22AE4C700(&v7, v6);
  v3 = MEMORY[0x24BEE4B00];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22AE57AC8(v6, v0, v2, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_22AE5D24C(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v10[2];
  __int128 v11;
  uint64_t v12;

  v2 = sub_22AE5E0CC();
  v4 = v3;
  v5 = 0xD000000000000037;
  if ((a1 & 1) != 0)
    v5 = 0xD00000000000003FLL;
  v6 = 0x800000022AE61420;
  v12 = MEMORY[0x24BEE0D00];
  if ((a1 & 1) == 0)
    v6 = 0x800000022AE61460;
  *(_QWORD *)&v11 = v5;
  *((_QWORD *)&v11 + 1) = v6;
  sub_22AE4C700(&v11, v10);
  v7 = MEMORY[0x24BEE4B00];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22AE57AC8(v10, v2, v4, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_22AE5D328(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v11[2];
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v14 = a1;
  v15 = a2;
  v16 = a3 & 1;
  v3 = sub_22AE5E0CC();
  v5 = v4;
  v6 = sub_22AE4D260();
  v13 = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v12 = v6;
  *((_QWORD *)&v12 + 1) = v7;
  sub_22AE4C700(&v12, v11);
  v8 = MEMORY[0x24BEE4B00];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22AE57AC8(v11, v3, v5, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_22AE5D3DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v6[2];
  __int128 v7;
  uint64_t v8;

  v0 = sub_22AE5E0CC();
  v2 = v1;
  sub_22AE5E1BC();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v7 = 0xD00000000000001ELL;
  *((_QWORD *)&v7 + 1) = 0x800000022AE616D0;
  sub_22AE5E0FC();
  swift_bridgeObjectRelease();
  sub_22AE5E0FC();
  v8 = MEMORY[0x24BEE0D00];
  sub_22AE4C700(&v7, v6);
  v3 = MEMORY[0x24BEE4B00];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22AE57AC8(v6, v0, v2, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3;
}

uint64_t sub_22AE5D50C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char isUniquelyReferenced_nonNull_native;
  _OWORD v8[2];
  __int128 v9;
  uint64_t v10;

  v0 = sub_22AE5E0CC();
  v2 = v1;
  v3 = sub_22AE5D5B0();
  v10 = MEMORY[0x24BEE0D00];
  *(_QWORD *)&v9 = v3;
  *((_QWORD *)&v9 + 1) = v4;
  sub_22AE4C700(&v9, v8);
  v5 = MEMORY[0x24BEE4B00];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  sub_22AE57AC8(v8, v0, v2, isUniquelyReferenced_nonNull_native);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_22AE5D5B0()
{
  uint64_t v0;
  _OWORD v2[2];
  _OWORD v3[2];
  _OWORD v4[2];
  _OWORD v5[2];
  _OWORD v6[2];
  __int128 v7;
  char v8;

  sub_22AE5DA58(v0, (uint64_t)v5);
  if (v8)
  {
    sub_22AE4C700(v5, v4);
    sub_22AE4C700(v6, v3);
    sub_22AE4C700(&v7, v2);
    sub_22AE5E1BC();
    sub_22AE5E0FC();
    sub_22AE5E1E0();
    sub_22AE5E0FC();
    sub_22AE5E1E0();
    sub_22AE5E0FC();
    sub_22AE5E1E0();
    sub_22AE5E0FC();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v2);
  }
  else
  {
    sub_22AE4C700(v5, v4);
    sub_22AE4C700(v6, v3);
    *(_QWORD *)&v2[0] = 0;
    *((_QWORD *)&v2[0] + 1) = 0xE000000000000000;
    sub_22AE5E1BC();
    sub_22AE5E0FC();
    sub_22AE5E1E0();
    sub_22AE5E0FC();
    sub_22AE5E1E0();
    sub_22AE5E0FC();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  return 0;
}

uint64_t sub_22AE5D91C(char a1)
{
  if ((a1 & 1) != 0)
    return 0x746867696568;
  else
    return 0x6874646977;
}

unint64_t sub_22AE5D954(uint64_t a1)
{
  unint64_t result;

  *(_QWORD *)(a1 + 8) = sub_22AE5D980();
  result = sub_22AE5D9C4();
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_22AE5D980()
{
  unint64_t result;

  result = qword_255B53BD8;
  if (!qword_255B53BD8)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE609E8, &type metadata for UnarchiveError);
    atomic_store(result, (unint64_t *)&qword_255B53BD8);
  }
  return result;
}

unint64_t sub_22AE5D9C4()
{
  unint64_t result;

  result = qword_255B53BE0;
  if (!qword_255B53BE0)
  {
    result = MEMORY[0x22E2E92D8]("١m$p.", &type metadata for UnarchiveError);
    atomic_store(result, (unint64_t *)&qword_255B53BE0);
  }
  return result;
}

uint64_t sub_22AE5DA08()
{
  sub_22AE5D980();
  return sub_22AE5E294();
}

uint64_t sub_22AE5DA30()
{
  sub_22AE5D980();
  return sub_22AE5E288();
}

uint64_t sub_22AE5DA58(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for UnarchiveError(a2, a1);
  return a2;
}

uint64_t sub_22AE5DA8C(char *a1, char *a2)
{
  return sub_22AE589EC(*a1, *a2);
}

uint64_t sub_22AE5DA98()
{
  return sub_22AE5917C();
}

uint64_t sub_22AE5DAA0()
{
  return sub_22AE591F4();
}

uint64_t sub_22AE5DAA8()
{
  return sub_22AE5971C();
}

uint64_t sub_22AE5DAB0@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_22AE5E234();
  result = swift_bridgeObjectRelease();
  if (v2 == 1)
    v4 = 1;
  else
    v4 = 2;
  if (!v2)
    v4 = 0;
  *a1 = v4;
  return result;
}

uint64_t sub_22AE5DB0C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_22AE5D91C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

double sub_22AE5DB34(uint64_t a1)
{
  uint64_t v1;
  double v2;
  uint64_t v4;
  char v5;
  double v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = sub_22AE5602C(0, a1);
  if (v1)
    goto LABEL_8;
  if ((v5 & 1) != 0)
  {
    sub_22AE57BF8();
    swift_allocError();
    v9 = v8;
    *(_QWORD *)(v8 + 24) = &_s3KeyON;
    *(_BYTE *)v8 = 0;
LABEL_7:
    *(_QWORD *)(v9 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_255B53A18);
    *(_QWORD *)(v9 + 32) = MEMORY[0x24BEE50B0];
    *(_BYTE *)(v9 + 96) = 0;
    swift_willThrow();
LABEL_8:
    swift_bridgeObjectRelease();
    return v2;
  }
  v6 = *(double *)&v4;
  sub_22AE5602C(1, a1);
  if ((v7 & 1) != 0)
  {
    sub_22AE57BF8();
    swift_allocError();
    v9 = v11;
    *(_QWORD *)(v11 + 24) = &_s3KeyON;
    *(_BYTE *)v11 = 1;
    goto LABEL_7;
  }
  v2 = v6;
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t _s3KeyOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_22AE5DCA4 + 4 * byte_22AE60985[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_22AE5DCD8 + 4 * byte_22AE60980[v4]))();
}

uint64_t sub_22AE5DCD8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5DCE0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22AE5DCE8);
  return result;
}

uint64_t sub_22AE5DCF4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22AE5DCFCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_22AE5DD00(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22AE5DD08(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s3KeyOMa()
{
  return &_s3KeyON;
}

unint64_t sub_22AE5DD28()
{
  unint64_t result;

  result = qword_255B53BE8;
  if (!qword_255B53BE8)
  {
    result = MEMORY[0x22E2E92D8](&unk_22AE60B28, &_s3KeyON);
    atomic_store(result, (unint64_t *)&qword_255B53BE8);
  }
  return result;
}

uint64_t sub_22AE5DFDC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_22AE5DFE8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_22AE5DFF4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_22AE5E000()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_22AE5E00C()
{
  return MEMORY[0x24BDC6D10]();
}

uint64_t sub_22AE5E018()
{
  return MEMORY[0x24BE78708]();
}

uint64_t sub_22AE5E024()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22AE5E030()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22AE5E03C()
{
  return MEMORY[0x24BDF3F58]();
}

uint64_t sub_22AE5E048()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_22AE5E054()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_22AE5E060()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_22AE5E06C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_22AE5E078()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_22AE5E084()
{
  return MEMORY[0x24BEE5588]();
}

uint64_t sub_22AE5E090()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_22AE5E09C()
{
  return MEMORY[0x24BEE5620]();
}

uint64_t sub_22AE5E0A8()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22AE5E0B4()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22AE5E0C0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22AE5E0CC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22AE5E0D8()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_22AE5E0E4()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22AE5E0F0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_22AE5E0FC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22AE5E108()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22AE5E114()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_22AE5E120()
{
  return MEMORY[0x24BEE0FE8]();
}

uint64_t sub_22AE5E12C()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_22AE5E138()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22AE5E144()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_22AE5E150()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22AE5E15C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_22AE5E168()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_22AE5E174()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22AE5E180()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22AE5E18C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22AE5E198()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_22AE5E1A4()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_22AE5E1B0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_22AE5E1BC()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22AE5E1C8()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22AE5E1D4()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22AE5E1E0()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22AE5E1EC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22AE5E1F8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22AE5E204()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_22AE5E210()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_22AE5E21C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_22AE5E228()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22AE5E234()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_22AE5E240()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22AE5E24C()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_22AE5E258()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_22AE5E264()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_22AE5E270()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_22AE5E27C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_22AE5E288()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_22AE5E294()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_22AE5E2A0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22AE5E2AC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22AE5E2B8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22AE5E2C4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22AE5E2D0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22AE5E2DC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22AE5E2E8()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_22AE5E2F4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22AE5E300()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x24BE0BC20]();
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t UVLog()
{
  return MEMORY[0x24BE78720]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

