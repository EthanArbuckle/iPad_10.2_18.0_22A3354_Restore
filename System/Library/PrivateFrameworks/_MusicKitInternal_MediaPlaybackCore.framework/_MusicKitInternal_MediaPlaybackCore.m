void sub_22E22FD0C(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_22E22FD3C();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

uint64_t sub_22E22FD44@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

void type metadata accessor for MPCPlaybackIntentRepeatMode(uint64_t a1)
{
  sub_22E22FD98(a1, &qword_255DFBF10);
}

void type metadata accessor for MPCPlaybackIntentShuffleMode(uint64_t a1)
{
  sub_22E22FD98(a1, &qword_255DFBF18);
}

void sub_22E22FD98(uint64_t a1, unint64_t *a2)
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

uint64_t MPCPlaybackEngine.state<A>(for:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _OWORD v8[2];
  uint64_t v9;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E242060();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  sub_22E241E50();
  memset(v8, 0, sizeof(v8));
  v9 = 0;
  sub_22E241E44();
  return sub_22E24206C();
}

uint64_t MusicPlayerPath.init(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4920);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E241D60();
  v4 = sub_22E241D6C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4))
  {
    sub_22E22FFA8((uint64_t)v3);
    v5 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, v3, v4);
    v5 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a1, v5, 1, v4);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E328FE0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_22E22FFA8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4920);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t MusicRoute.init(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF20);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E241E14();
  v4 = sub_22E241E20();
  if (__swift_getEnumTagSinglePayload((uint64_t)v3, 1, v4))
  {
    sub_22E2300C0((uint64_t)v3);
    v5 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, v3, v4);
    v5 = 0;
  }
  return __swift_storeEnumTagSinglePayload(a1, v5, 1, v4);
}

uint64_t sub_22E2300C0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF20);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void destroy for MusicPlaybackIntentDonationDescriptor(uint64_t a1)
{
  uint64_t v1;

  v1 = a1;
  switch(*(_BYTE *)(a1 + 80))
  {
    case 0:

      break;
    case 1:
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v1 + 32))
      {
        a1 = v1 + 8;
        goto LABEL_8;
      }
      break;
    case 2:
      __swift_destroy_boxed_opaque_existential_1(a1);
      if (*(_QWORD *)(v1 + 64))
      {
        a1 = v1 + 40;
        goto LABEL_8;
      }
      break;
    case 3:
LABEL_8:
      __swift_destroy_boxed_opaque_existential_1(a1);
      break;
    default:
      return;
  }
}

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

void initializeWithCopy for MusicPlaybackIntentDonationDescriptor(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_22E2301E8()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v2 = *v1;
  *(_QWORD *)v0 = *v1;
  *(_BYTE *)(v0 + 80) = 0;
  v3 = v2;
  return v0;
}

uint64_t assignWithCopy for MusicPlaybackIntentDonationDescriptor(uint64_t result, uint64_t a2)
{
  if (result != a2)
  {
    sub_22E230458(result);
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_22E230458(uint64_t a1)
{
  destroy for MusicPlaybackIntentDonationDescriptor.Kind(a1);
  return a1;
}

void *__swift_memcpy81_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x51uLL);
}

void *assignWithTake for MusicPlaybackIntentDonationDescriptor(void *a1, const void *a2)
{
  if (a1 != a2)
  {
    sub_22E230458((uint64_t)a1);
    memcpy(a1, a2, 0x51uLL);
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicPlaybackIntentDonationDescriptor(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int v3;

  if (a2)
  {
    if (a2 >= 0xFD && *(_BYTE *)(a1 + 81))
    {
      v2 = *(_DWORD *)a1 + 252;
    }
    else
    {
      v3 = *(unsigned __int8 *)(a1 + 80);
      if (v3 <= 3)
        v2 = -1;
      else
        v2 = v3 ^ 0xFF;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicPlaybackIntentDonationDescriptor(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 80) = 0;
    *(_QWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_BYTE *)(result + 80) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicPlaybackIntentDonationDescriptor()
{
  return &type metadata for MusicPlaybackIntentDonationDescriptor;
}

uint64_t initializeBufferWithCopyOfBuffer for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

void destroy for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t a1)
{
  uint64_t v1;
  int v2;

  v1 = a1;
  v2 = *(unsigned __int8 *)(a1 + 80);
  while (2)
  {
    switch(v2)
    {
      case 0:

        return;
      case 1:
        swift_bridgeObjectRelease();
        if (*(_QWORD *)(v1 + 32))
          __swift_destroy_boxed_opaque_existential_1(v1 + 8);
        return;
      case 2:
        __swift_destroy_boxed_opaque_existential_1(a1);
        if (!*(_QWORD *)(v1 + 64))
          return;
        a1 = v1 + 40;
LABEL_9:
        __swift_destroy_boxed_opaque_existential_1(a1);
        return;
      case 3:
        goto LABEL_9;
      default:
        v2 = *(_DWORD *)a1 + 4;
        continue;
    }
  }
}

uint64_t initializeWithCopy for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  id v6;
  _OWORD *v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  char v17;
  __int128 v18;
  __int128 v19;

  v4 = *(unsigned __int8 *)(a2 + 80);
  while (2)
  {
    switch(v4)
    {
      case 0:
        v5 = *(void **)a2;
        *(_QWORD *)a1 = *(_QWORD *)a2;
        *(_BYTE *)(a1 + 80) = 0;
        v6 = v5;
        return a1;
      case 1:
        *(_QWORD *)a1 = *(_QWORD *)a2;
        v7 = (_OWORD *)(a1 + 8);
        v8 = (_OWORD *)(a2 + 8);
        v9 = *(_QWORD *)(a2 + 32);
        swift_bridgeObjectRetain();
        if (v9)
        {
          v10 = *(_QWORD *)(a2 + 40);
          *(_QWORD *)(a1 + 32) = v9;
          *(_QWORD *)(a1 + 40) = v10;
          (**(void (***)(uint64_t, uint64_t, uint64_t))(v9 - 8))(a1 + 8, a2 + 8, v9);
        }
        else
        {
          v18 = *(_OWORD *)(a2 + 24);
          *v7 = *v8;
          *(_OWORD *)(a1 + 24) = v18;
          *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
        }
        v17 = 1;
        goto LABEL_14;
      case 2:
        v11 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v11;
        (**(void (***)(uint64_t, uint64_t))(v11 - 8))(a1, a2);
        v12 = (_OWORD *)(a1 + 40);
        v13 = (_OWORD *)(a2 + 40);
        v14 = *(_QWORD *)(a2 + 64);
        if (v14)
        {
          v15 = *(_QWORD *)(a2 + 72);
          *(_QWORD *)(a1 + 64) = v14;
          *(_QWORD *)(a1 + 72) = v15;
          (**(void (***)(_OWORD *, _OWORD *))(v14 - 8))(v12, v13);
        }
        else
        {
          v19 = *(_OWORD *)(a2 + 56);
          *v12 = *v13;
          *(_OWORD *)(a1 + 56) = v19;
          *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
        }
        v17 = 2;
        goto LABEL_14;
      case 3:
        v16 = *(_OWORD *)(a2 + 24);
        *(_OWORD *)(a1 + 24) = v16;
        (**(void (***)(uint64_t, uint64_t))(v16 - 8))(a1, a2);
        v17 = 3;
LABEL_14:
        *(_BYTE *)(a1 + 80) = v17;
        return a1;
      default:
        v4 = *(_DWORD *)a2 + 4;
        continue;
    }
  }
}

uint64_t assignWithCopy for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  __int128 *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v2 = a1;
  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 80);
    while (2)
    {
      switch(v4)
      {
        case 0:

          goto LABEL_11;
        case 1:
          swift_bridgeObjectRelease();
          if (!*(_QWORD *)(v2 + 32))
            goto LABEL_11;
          a1 = v2 + 8;
          break;
        case 2:
          __swift_destroy_boxed_opaque_existential_1(a1);
          if (!*(_QWORD *)(v2 + 64))
            goto LABEL_11;
          a1 = v2 + 40;
          break;
        case 3:
          break;
        default:
          v4 = *(_DWORD *)a1 + 4;
          continue;
      }
      break;
    }
    __swift_destroy_boxed_opaque_existential_1(a1);
LABEL_11:
    v5 = *(unsigned __int8 *)(a2 + 80);
    while (2)
    {
      switch(v5)
      {
        case 0:
          v6 = *(void **)a2;
          *(_QWORD *)v2 = *(_QWORD *)a2;
          *(_BYTE *)(v2 + 80) = 0;
          v7 = v6;
          return v2;
        case 1:
          *(_QWORD *)v2 = *(_QWORD *)a2;
          v8 = *(_QWORD *)(a2 + 32);
          swift_bridgeObjectRetain();
          if (v8)
          {
            *(_QWORD *)(v2 + 32) = v8;
            *(_QWORD *)(v2 + 40) = *(_QWORD *)(a2 + 40);
            (**(void (***)(uint64_t, uint64_t, uint64_t))(v8 - 8))(v2 + 8, a2 + 8, v8);
          }
          else
          {
            v17 = *(_OWORD *)(a2 + 8);
            v18 = *(_OWORD *)(a2 + 24);
            *(_QWORD *)(v2 + 40) = *(_QWORD *)(a2 + 40);
            *(_OWORD *)(v2 + 8) = v17;
            *(_OWORD *)(v2 + 24) = v18;
          }
          v14 = 1;
          goto LABEL_24;
        case 2:
          v9 = *(_QWORD *)(a2 + 24);
          *(_QWORD *)(v2 + 24) = v9;
          *(_QWORD *)(v2 + 32) = *(_QWORD *)(a2 + 32);
          (**(void (***)(uint64_t, uint64_t))(v9 - 8))(v2, a2);
          v10 = (_OWORD *)(v2 + 40);
          v11 = (__int128 *)(a2 + 40);
          v12 = *(_QWORD *)(a2 + 64);
          if (v12)
          {
            *(_QWORD *)(v2 + 64) = v12;
            *(_QWORD *)(v2 + 72) = *(_QWORD *)(a2 + 72);
            (**(void (***)(_OWORD *, __int128 *))(v12 - 8))(v10, v11);
          }
          else
          {
            v15 = *v11;
            v16 = *(_OWORD *)(a2 + 56);
            *(_QWORD *)(v2 + 72) = *(_QWORD *)(a2 + 72);
            *v10 = v15;
            *(_OWORD *)(v2 + 56) = v16;
          }
          v14 = 2;
          goto LABEL_24;
        case 3:
          v13 = *(_QWORD *)(a2 + 24);
          *(_QWORD *)(v2 + 24) = v13;
          *(_QWORD *)(v2 + 32) = *(_QWORD *)(a2 + 32);
          (**(void (***)(uint64_t, uint64_t))(v13 - 8))(v2, a2);
          v14 = 3;
LABEL_24:
          *(_BYTE *)(v2 + 80) = v14;
          break;
        default:
          v5 = *(_DWORD *)a2 + 4;
          continue;
      }
      break;
    }
  }
  return v2;
}

uint64_t assignWithTake for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v4;
  int v5;
  char v6;
  __int128 v7;
  __int128 v8;

  v2 = a1;
  if (a1 != a2)
  {
    v4 = *(unsigned __int8 *)(a1 + 80);
    while (2)
    {
      switch(v4)
      {
        case 0:

          goto LABEL_11;
        case 1:
          swift_bridgeObjectRelease();
          if (!*(_QWORD *)(v2 + 32))
            goto LABEL_11;
          a1 = v2 + 8;
          break;
        case 2:
          __swift_destroy_boxed_opaque_existential_1(a1);
          if (!*(_QWORD *)(v2 + 64))
            goto LABEL_11;
          a1 = v2 + 40;
          break;
        case 3:
          break;
        default:
          v4 = *(_DWORD *)a1 + 4;
          continue;
      }
      break;
    }
    __swift_destroy_boxed_opaque_existential_1(a1);
LABEL_11:
    v5 = *(unsigned __int8 *)(a2 + 80);
    while (2)
    {
      switch(v5)
      {
        case 0:
          v6 = 0;
          *(_QWORD *)v2 = *(_QWORD *)a2;
          break;
        case 1:
          v7 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)v2 = *(_OWORD *)a2;
          *(_OWORD *)(v2 + 16) = v7;
          *(_OWORD *)(v2 + 32) = *(_OWORD *)(a2 + 32);
          v6 = 1;
          break;
        case 2:
          memcpy((void *)v2, (const void *)a2, 0x50uLL);
          v6 = 2;
          break;
        case 3:
          v8 = *(_OWORD *)(a2 + 16);
          *(_OWORD *)v2 = *(_OWORD *)a2;
          *(_OWORD *)(v2 + 16) = v8;
          *(_QWORD *)(v2 + 32) = *(_QWORD *)(a2 + 32);
          v6 = 3;
          break;
        default:
          v5 = *(_DWORD *)a2 + 4;
          continue;
      }
      break;
    }
    *(_BYTE *)(v2 + 80) = v6;
  }
  return v2;
}

uint64_t getEnumTagSinglePayload for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xFD && *(_BYTE *)(a1 + 81))
    return (*(_DWORD *)a1 + 253);
  v3 = *(unsigned __int8 *)(a1 + 80);
  if (v3 >= 4)
    return (v3 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for MusicPlaybackIntentDonationDescriptor.Kind(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFC)
  {
    *(_BYTE *)(result + 80) = 0;
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 253;
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 81) = 1;
  }
  else
  {
    if (a3 >= 0xFD)
      *(_BYTE *)(result + 81) = 0;
    if (a2)
      *(_BYTE *)(result + 80) = -(char)a2;
  }
  return result;
}

uint64_t sub_22E230B3C(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned __int8 *)(a1 + 80);
  if (result >= 4)
    return (*(_DWORD *)a1 + 4);
  return result;
}

uint64_t sub_22E230B58(uint64_t result, unsigned int a2)
{
  if (a2 > 3)
  {
    *(_OWORD *)(result + 48) = 0u;
    *(_OWORD *)(result + 64) = 0u;
    *(_OWORD *)(result + 16) = 0u;
    *(_OWORD *)(result + 32) = 0u;
    *(_OWORD *)result = 0u;
    *(_DWORD *)result = a2 - 4;
    LOBYTE(a2) = 4;
  }
  *(_BYTE *)(result + 80) = a2;
  return result;
}

ValueMetadata *type metadata accessor for MusicPlaybackIntentDonationDescriptor.Kind()
{
  return &type metadata for MusicPlaybackIntentDonationDescriptor.Kind;
}

uint64_t sub_22E230B94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3[14] = a2;
  v3[15] = v2;
  v3[13] = a1;
  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF30) - 8);
  v3[16] = v4;
  v3[17] = *(_QWORD *)(v4 + 64);
  v3[18] = OUTLINED_FUNCTION_81();
  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF38) - 8);
  v3[19] = v5;
  v3[20] = *(_QWORD *)(v5 + 64);
  v3[21] = OUTLINED_FUNCTION_81();
  OUTLINED_FUNCTION_85();
  return OUTLINED_FUNCTION_20();
}

uint64_t sub_22E230C0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD *)(v0 + 160);
  v1 = *(_QWORD *)(v0 + 168);
  v3 = *(_QWORD *)(v0 + 144);
  v4 = *(_QWORD *)(v0 + 152);
  v5 = *(_QWORD *)(v0 + 128);
  v6 = *(_QWORD *)(v0 + 112);
  v7 = *(_QWORD *)(v0 + 104);
  sub_22E232428(*(_QWORD *)(v0 + 120), v0 + 16);
  sub_22E2326E0(v7, v1, &qword_255DFBF38);
  sub_22E2326E0(v6, v3, &qword_255DFBF30);
  v8 = (*(unsigned __int8 *)(v4 + 80) + 97) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v9 = (v2 + *(unsigned __int8 *)(v5 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v10 = swift_allocObject();
  memcpy((void *)(v10 + 16), (const void *)(v0 + 16), 0x51uLL);
  sub_22E232790(v1, v10 + v8, &qword_255DFBF38);
  sub_22E232790(v3, v10 + v9, &qword_255DFBF30);
  sub_22E241DFC();
  sub_22E241D78();
  swift_release();
  OUTLINED_FUNCTION_30();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22E230D48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[86] = a4;
  v4[85] = a3;
  v4[84] = a2;
  v4[83] = a1;
  v5 = sub_22E241EB0();
  v4[87] = v5;
  v4[88] = *(_QWORD *)(v5 - 8);
  v4[89] = swift_task_alloc();
  v6 = sub_22E241DFC();
  v4[90] = v6;
  v4[91] = *(_QWORD *)(v6 - 8);
  v4[92] = swift_task_alloc();
  v4[93] = swift_task_alloc();
  v4[94] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF50);
  v4[95] = swift_task_alloc();
  v4[96] = swift_task_alloc();
  v4[97] = swift_task_alloc();
  v4[98] = swift_task_alloc();
  v4[99] = swift_task_alloc();
  return swift_task_switch();
}

void sub_22E230E50()
{
  uint64_t v0;

  sub_22E232668(*(_QWORD *)(v0 + 672), v0 + 16);
  __asm { BR              X10 }
}

uint64_t sub_22E230EB4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, int a14, os_log_type_t type, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,unint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33)
{
  _QWORD *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int EnumTagSinglePayload;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  NSObject *v45;
  os_log_type_t v46;
  BOOL v47;
  uint64_t v48;
  uint8_t *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSObject *v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  unint64_t v68;
  unsigned __int16 v69;
  uint64_t v70;
  char v71;
  unint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t (*v75)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v84;
  os_log_type_t typea;
  uint64_t v86;
  void (*v87)(_QWORD, uint64_t, _QWORD);

  v36 = v33[99];
  v37 = v33[90];
  v38 = v33[2];
  a22 = sub_22E2327F4();
  a19 = v38;
  sub_22E241DC0();
  __swift_storeEnumTagSinglePayload(v36, 0, 1, v37);
  v39 = v33[95];
  v40 = v33[90];
  sub_22E2326E0(v33[99], v39, &qword_255DFBF50);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v39, 1, v40);
  v42 = v33[95];
  if (EnumTagSinglePayload == 1)
  {
    OUTLINED_FUNCTION_64(&qword_255DFBF50, v42);
    if (qword_255DFBF00 != -1)
      swift_once();
    v43 = OUTLINED_FUNCTION_54();
    v44 = __swift_project_value_buffer(v43, (uint64_t)qword_255DFC358);
    sub_22E232428(v39, v34);
    v45 = v44;
    sub_22E241E98();
    v46 = OUTLINED_FUNCTION_41();
    v47 = os_log_type_enabled(v44, v46);
    v48 = v33[99];
    if (v47)
    {
      v49 = (uint8_t *)OUTLINED_FUNCTION_3();
      a19 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v49 = 136446210;
      sub_22E232668(v34, v35);
      v50 = sub_22E242180();
      v33[77] = sub_22E238D88(v50, v51, &a19);
      sub_22E2422DC();
      swift_bridgeObjectRelease();
      sub_22E2326B4(v34);
      _os_log_impl(&dword_22E22E000, v45, v46, "Unable to create MusicPlaybackIntentDonation from %{public}s).", v49, 0xCu);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    sub_22E2326B4(v34);
    sub_22E2327BC(v48, &qword_255DFBF50);
    v74 = 1;
  }
  else
  {
    v87 = *(void (**)(_QWORD, uint64_t, _QWORD))(v33[91] + 32);
    v87(v33[94], v42, v33[90]);
    if (qword_255DFBF00 != -1)
      swift_once();
    v52 = v33[93];
    v53 = v33[92];
    v54 = v33[89];
    v55 = v33[88];
    v56 = v33[87];
    v57 = __swift_project_value_buffer(v56, (uint64_t)qword_255DFC358);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v55 + 16))(v54, v57, v56);
    OUTLINED_FUNCTION_67(v52);
    OUTLINED_FUNCTION_67(v53);
    v58 = sub_22E241E98();
    typea = sub_22E2422A0();
    v59 = os_log_type_enabled(v58, typea);
    v60 = v33[99];
    v61 = v33[93];
    v62 = v33[92];
    v63 = v33[89];
    v86 = v33[88];
    v64 = v33[87];
    if (v59)
    {
      v65 = OUTLINED_FUNCTION_3();
      v84 = (_QWORD *)OUTLINED_FUNCTION_3();
      a19 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v65 = 136446466;
      v66 = (void *)sub_22E241DCC();
      sub_22E23270C(v66);
      OUTLINED_FUNCTION_72();
      v70 = v69 | 0x746E656469200000;
      if (v71)
      {
        v67 = v70;
        v72 = 0xED00007265696669;
      }
      else
      {
        v72 = v68;
      }
      v33[82] = sub_22E238D88(v67, v72, &a19);
      sub_22E2422DC();
      OUTLINED_FUNCTION_46();
      OUTLINED_FUNCTION_61(v61);
      *(_WORD *)(v65 + 12) = 2114;
      v73 = sub_22E241DCC();
      v33[79] = v73;
      sub_22E2422DC();
      *v84 = v73;
      OUTLINED_FUNCTION_61(v62);
      _os_log_impl(&dword_22E22E000, v58, typea, "Created MusicPlaybackIntentDonation<%{public}s)>: %{public}@).", (uint8_t *)v65, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF60);
      OUTLINED_FUNCTION_12();
      OUTLINED_FUNCTION_0();
    }

    OUTLINED_FUNCTION_61(v62);
    OUTLINED_FUNCTION_61(v61);
    (*(void (**)(uint64_t, uint64_t))(v86 + 8))(v63, v64);
    sub_22E2327BC(v60, &qword_255DFBF50);
    v87(v33[83], v33[94], v33[90]);
    v74 = 0;
  }
  __swift_storeEnumTagSinglePayload(v33[83], v74, 1, v33[90]);
  swift_task_dealloc();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_39();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_40();
  return v75(v75, v76, v77, v78, v79, v80, v81, v82, a9, a10, a11, a12, a13);
}

uint64_t sub_22E2314F0()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_53();
  *v2 = *v1;
  *(_QWORD *)(v3 + 816) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_85();
  return swift_task_switch();
}

#error "22E231628: call analysis failed (funcsize=161)"

uint64_t sub_22E231878()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_53();
  *v2 = *v1;
  *(_QWORD *)(v3 + 832) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_85();
  return OUTLINED_FUNCTION_20();
}

#error "22E231BA4: call analysis failed (funcsize=174)"

uint64_t sub_22E231C20()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;

  OUTLINED_FUNCTION_53();
  *v2 = *v1;
  *(_QWORD *)(v3 + 848) = v0;
  swift_task_dealloc();
  OUTLINED_FUNCTION_85();
  return OUTLINED_FUNCTION_20();
}

#error "22E231D3C: call analysis failed (funcsize=160)"

uint64_t sub_22E231F8C()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_66();
  sub_22E2327BC(v1 + 456, &qword_2540E4940);
  if (qword_255DFBF00 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_42(v2, (uint64_t)qword_255DFC358);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_71();
  v3 = OUTLINED_FUNCTION_41();
  if (OUTLINED_FUNCTION_7(v3))
  {
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_27(4.8752e-34);
    v4 = OUTLINED_FUNCTION_74();
    v8 = OUTLINED_FUNCTION_51(v4, v5, v6, v7);
    OUTLINED_FUNCTION_17(v8);
    OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_16();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF58);
    v9 = OUTLINED_FUNCTION_60();
    v13 = OUTLINED_FUNCTION_51(v9, v10, v11, v12);
    OUTLINED_FUNCTION_14(v13);
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_22(&dword_22E22E000, v14, v15, "Unable to create MusicPlaybackIntentDonation from %{public}s) due to error: %{public}s).");
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6();

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_39();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_22E232114()
{
  uint64_t v0;
  uint64_t v1;
  os_log_type_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  OUTLINED_FUNCTION_66();
  sub_22E2327BC(v0 + 496, &qword_2540E4940);
  __swift_destroy_boxed_opaque_existential_1(v0 + 536);
  if (qword_255DFBF00 != -1)
    swift_once();
  v1 = OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_42(v1, (uint64_t)qword_255DFC358);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_71();
  v2 = OUTLINED_FUNCTION_41();
  if (OUTLINED_FUNCTION_7(v2))
  {
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_27(4.8752e-34);
    v3 = OUTLINED_FUNCTION_74();
    v7 = OUTLINED_FUNCTION_51(v3, v4, v5, v6);
    OUTLINED_FUNCTION_17(v7);
    OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_16();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF58);
    v8 = OUTLINED_FUNCTION_60();
    v12 = OUTLINED_FUNCTION_51(v8, v9, v10, v11);
    OUTLINED_FUNCTION_14(v12);
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_22(&dword_22E22E000, v13, v14, "Unable to create MusicPlaybackIntentDonation from %{public}s) due to error: %{public}s).");
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6();

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_39();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_22E2322A8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  os_log_type_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_66();
  __swift_destroy_boxed_opaque_existential_1(v1 + 576);
  if (qword_255DFBF00 != -1)
    swift_once();
  v2 = OUTLINED_FUNCTION_54();
  OUTLINED_FUNCTION_42(v2, (uint64_t)qword_255DFC358);
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_71();
  v3 = OUTLINED_FUNCTION_41();
  if (OUTLINED_FUNCTION_7(v3))
  {
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_27(4.8752e-34);
    v4 = OUTLINED_FUNCTION_74();
    v8 = OUTLINED_FUNCTION_51(v4, v5, v6, v7);
    OUTLINED_FUNCTION_17(v8);
    OUTLINED_FUNCTION_73();
    OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_16();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF58);
    v9 = OUTLINED_FUNCTION_60();
    v13 = OUTLINED_FUNCTION_51(v9, v10, v11, v12);
    OUTLINED_FUNCTION_14(v13);
    OUTLINED_FUNCTION_46();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_6();
    OUTLINED_FUNCTION_22(&dword_22E22E000, v14, v15, "Unable to create MusicPlaybackIntentDonation from %{public}s) due to error: %{public}s).");
    OUTLINED_FUNCTION_48();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_56();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_6();

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_44();
  OUTLINED_FUNCTION_32();
  OUTLINED_FUNCTION_33();
  OUTLINED_FUNCTION_34();
  OUTLINED_FUNCTION_45();
  OUTLINED_FUNCTION_47();
  OUTLINED_FUNCTION_39();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_22E232428(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for MusicPlaybackIntentDonationDescriptor(a2, a1);
  return a2;
}

uint64_t sub_22E23245C()
{
  uint64_t v0;
  id *v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF38);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF30);
  v1 = (id *)(v0 + 16);
  switch(*(_BYTE *)(v0 + 96))
  {
    case 0:

      break;
    case 1:
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(v0 + 48))
      {
        v1 = (id *)(v0 + 24);
        goto LABEL_7;
      }
      break;
    case 2:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
      if (*(_QWORD *)(v0 + 80))
      {
        v1 = (id *)(v0 + 56);
        goto LABEL_7;
      }
      break;
    case 3:
LABEL_7:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v1);
      break;
    default:
      break;
  }
  sub_22E241E2C();
  if (!OUTLINED_FUNCTION_43())
    OUTLINED_FUNCTION_58();
  sub_22E241E38();
  if (!OUTLINED_FUNCTION_43())
    OUTLINED_FUNCTION_58();
  return swift_deallocObject();
}

uint64_t sub_22E232578(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;

  v4 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF38) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 97) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(_QWORD *)(v4 + 64);
  v7 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF30) - 8) + 80);
  v8 = v5 + v6 + v7;
  v9 = v1 + 16;
  v10 = v1 + v5;
  v11 = v1 + (v8 & ~v7);
  v12 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v12;
  *v12 = v2;
  v12[1] = sub_22E232628;
  return sub_22E230D48(a1, v9, v10, v11);
}

uint64_t sub_22E232628()
{
  uint64_t *v0;
  uint64_t v2;

  OUTLINED_FUNCTION_53();
  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_22E232668(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for MusicPlaybackIntentDonationDescriptor.Kind(a2, a1);
  return a2;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_22E2326B4(uint64_t a1)
{
  destroy for MusicPlaybackIntentDonationDescriptor(a1);
  return a1;
}

void sub_22E2326E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_62(a1, a2, a3);
  OUTLINED_FUNCTION_80(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16));
  OUTLINED_FUNCTION_77();
}

uint64_t sub_22E23270C(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_identifier);

  if (!v2)
    return 0;
  v3 = sub_22E242174();

  return v3;
}

uint64_t sub_22E232778(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void sub_22E232790(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_62(a1, a2, a3);
  OUTLINED_FUNCTION_80(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32));
  OUTLINED_FUNCTION_77();
}

void sub_22E2327BC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_77();
}

unint64_t sub_22E2327F4()
{
  unint64_t result;

  result = qword_255DFBF68;
  if (!qword_255DFBF68)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DFBF68);
  }
  return result;
}

void OUTLINED_FUNCTION_0()
{
  JUMPOUT(0x22E329064);
}

uint64_t OUTLINED_FUNCTION_1()
{
  uint64_t v0;

  __swift_storeEnumTagSinglePayload(*(_QWORD *)(v0 + 664), 1, 1, *(_QWORD *)(v0 + 720));
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  __swift_storeEnumTagSinglePayload(*(_QWORD *)(v2 + 664), a2, 1, *(_QWORD *)(v2 + 720));
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_5(uint64_t (*a1)(void))
{
  return a1();
}

void OUTLINED_FUNCTION_6()
{
  void *v0;

}

BOOL OUTLINED_FUNCTION_7(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_10@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;

  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(v1[91] + 32))(v1[94], a1, v1[90]);
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 632) = a1;
  return sub_22E2422DC();
}

uint64_t OUTLINED_FUNCTION_12()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_14(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 648) = a1;
  return sub_22E2422DC();
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 616) = a1;
  return sub_22E2422DC();
}

id OUTLINED_FUNCTION_16()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  *(_WORD *)(v2 + 12) = 2082;
  *(_QWORD *)(v1 + 624) = v0;
  return v0;
}

uint64_t OUTLINED_FUNCTION_17(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 640) = a1;
  return sub_22E2422DC();
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = __swift_project_value_buffer(v3, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v5, v3);
}

uint64_t OUTLINED_FUNCTION_19(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 656) = a1;
  return sub_22E2422DC();
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_21(float a1)
{
  uint64_t v1;
  float *v2;
  uint64_t v3;

  *v2 = a1;
  return sub_22E232668(v1, v3);
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0x16u);
}

void OUTLINED_FUNCTION_23(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;

  _os_log_impl(a1, v4, v5, a4, v6, 0xCu);
}

uint64_t OUTLINED_FUNCTION_24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _QWORD *a11)
{
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;

  *a11 = v11;
  return v12(v14, v13);
}

void OUTLINED_FUNCTION_25(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_26()
{
  uint64_t v0;

  *(_WORD *)(v0 + 12) = 2114;
  return sub_22E241DCC();
}

uint64_t OUTLINED_FUNCTION_27(float a1)
{
  uint64_t v1;
  float *v2;
  uint64_t v3;

  *v2 = a1;
  return sub_22E232668(v1, v3);
}

id OUTLINED_FUNCTION_28()
{
  void *v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_29(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t (*a18)(_QWORD, _QWORD, _QWORD))
{
  _QWORD *v18;

  return a18(v18[83], v18[94], v18[90]);
}

uint64_t OUTLINED_FUNCTION_30()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_31(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a16 + 8))(a15, a17);
}

uint64_t OUTLINED_FUNCTION_32()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_34()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_35()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_36(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  unint64_t v11;
  va_list va;

  va_start(va, a11);
  return sub_22E238D88(a1, v11, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_37()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22E232428(v1, v0);
}

BOOL OUTLINED_FUNCTION_38(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_39()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return sub_22E242294();
}

uint64_t OUTLINED_FUNCTION_42(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  __swift_project_value_buffer(a1, a2);
  return sub_22E232428(v2, v3);
}

uint64_t OUTLINED_FUNCTION_43()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v0, 1, v1);
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_46()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_47()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_48()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_49(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  uint64_t v17;

  return (*(uint64_t (**)(uint64_t, uint64_t))(a16 + 8))(v17, a17);
}

uint64_t OUTLINED_FUNCTION_50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_51(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  return sub_22E238D88(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_52(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

void OUTLINED_FUNCTION_53()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_54()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 696);
}

uint64_t OUTLINED_FUNCTION_55()
{
  uint64_t v0;

  return sub_22E2326B4(v0);
}

uint64_t OUTLINED_FUNCTION_56()
{
  uint64_t v0;

  return sub_22E2326B4(v0);
}

void OUTLINED_FUNCTION_57()
{
  uint64_t *v0;
  uint64_t v1;

  sub_22E2326E0(*(_QWORD *)(v1 + 792), *(_QWORD *)(v1 + 760), v0);
}

uint64_t OUTLINED_FUNCTION_58()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_59(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  return sub_22E238D88(a1, a2, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_60()
{
  return sub_22E242180();
}

uint64_t OUTLINED_FUNCTION_61(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_62(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return __swift_instantiateConcreteTypeFromMangledName(a3);
}

void OUTLINED_FUNCTION_63()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t *v2;

  sub_22E232790(v0, v1, v2);
}

void OUTLINED_FUNCTION_64(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  sub_22E2327BC(a2, a1);
}

uint64_t OUTLINED_FUNCTION_67(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_68()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_69(float a1)
{
  float *v1;

  *v1 = a1;
  return sub_22E241DCC();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return sub_22E2422A0();
}

uint64_t OUTLINED_FUNCTION_71()
{
  return sub_22E241E98();
}

uint64_t OUTLINED_FUNCTION_73()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_74()
{
  return sub_22E242180();
}

uint64_t OUTLINED_FUNCTION_75()
{
  return sub_22E241E98();
}

uint64_t OUTLINED_FUNCTION_78()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_79()
{
  uint64_t v0;
  __int128 *v1;

  return sub_22E232778(v1, v0);
}

uint64_t OUTLINED_FUNCTION_80@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_81()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_82(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22E2327BC(v2, a2);
}

uint64_t OUTLINED_FUNCTION_83()
{
  return sub_22E242180();
}

uint64_t OUTLINED_FUNCTION_84()
{
  return sub_22E241E98();
}

void MPCPlaybackIntent.init<A>(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (**v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *boxed_opaque_existential_1;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t inited;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  void (**v54)(uint64_t, uint64_t, void *);
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;

  OUTLINED_FUNCTION_9_0();
  v55 = (void *)v0;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4938);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38_0(v10);
  *(_QWORD *)&v52 = sub_22E241D9C();
  v51 = *(_QWORD *)(v52 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_22_0(v12, v48);
  v13 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))*(v6 - 1);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v48 - v17;
  v19 = sub_22E241DB4();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_89();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_111();
  sub_22E241EC8();
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v20 + 88))(v2, v19) == *MEMORY[0x24BE69718])
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540E49A0);
    v22 = OUTLINED_FUNCTION_147();
    *(_OWORD *)(v22 + 16) = xmmword_22E2429B0;
    *(_QWORD *)(v22 + 56) = v6;
    *(_QWORD *)(v22 + 64) = v4;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v22 + 32));
    OUTLINED_FUNCTION_141((uint64_t)boxed_opaque_existential_1, v8, v13[2]);
    v64 = 0;
    v63 = 0u;
    v62 = 0u;
    v24 = v55;
    sub_22E233CD4();
    v25 = OUTLINED_FUNCTION_136();
    OUTLINED_FUNCTION_134(v25, &qword_2540E4940);
    v26 = v8;
    v27 = v6;
    goto LABEL_10;
  }
  v54 = (void (**)(uint64_t, uint64_t, void *))v13;
  v27 = v6;
  OUTLINED_FUNCTION_170();
  if (v28 != *MEMORY[0x24BE69720])
  {
    v54[2](v48, v8, v6);
    *(_QWORD *)&v62 = 0;
    *((_QWORD *)&v62 + 1) = 0xE000000000000000;
    sub_22E242318();
    OUTLINED_FUNCTION_29_0();
    sub_22E241EC8();
    sub_22E242378();
    OUTLINED_FUNCTION_48_0(v1, *(uint64_t (**)(uint64_t, uint64_t))(v20 + 8));
    OUTLINED_FUNCTION_146();
    OUTLINED_FUNCTION_102();
    sub_22E242414();
    OUTLINED_FUNCTION_74_0();
    OUTLINED_FUNCTION_35_0();
    v48 = 40;
    goto LABEL_13;
  }
  v26 = v8;
  OUTLINED_FUNCTION_97((uint64_t)v18, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4928);
  if ((OUTLINED_FUNCTION_16_0() & 1) != 0)
  {
    sub_22E232778(&v59, (uint64_t)&v62);
    v61 = 0;
    v59 = 0u;
    v60 = 0u;
    __swift_project_boxed_opaque_existential_1(&v62, *((uint64_t *)&v63 + 1));
    OUTLINED_FUNCTION_31_0(v49, 1);
    v29 = v50;
    v30 = sub_22E241D54();
    OUTLINED_FUNCTION_174(v30, &qword_2540E4938);
    sub_22E241D84();
    objc_opt_self();
    v31 = swift_dynamicCastObjCClass();
    if (v31)
    {
      v24 = (void *)v31;
      (*(void (**)(uint64_t, _QWORD))(v51 + 8))(v29, v52);
      sub_22E2327BC((uint64_t)&v59, &qword_2540E4940);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v62);
      v13 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))v54;
      goto LABEL_10;
    }
    swift_unknownObjectRelease();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_78_0();
LABEL_13:
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_44_0();
  }
  v61 = 0;
  v59 = 0u;
  v60 = 0u;
  sub_22E2327BC((uint64_t)&v59, &qword_2540E4930);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E49A0);
  inited = swift_initStackObject();
  v52 = xmmword_22E2429B0;
  *(_OWORD *)(inited + 16) = xmmword_22E2429B0;
  *(_QWORD *)(inited + 56) = v6;
  *(_QWORD *)(inited + 64) = v4;
  v33 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 32));
  OUTLINED_FUNCTION_97((uint64_t)v33, v26);
  v64 = 0;
  v13 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))&v62;
  OUTLINED_FUNCTION_140();
  sub_22E23335C(inited, v34, v35, v36, v37, v38, v39, v40, v48, v49, v50, v51, v52, *((uint64_t *)&v52 + 1), v53, (uint64_t)v54, (uint64_t)v55, v56, v57,
    v58);
  v24 = v41;
  v42 = swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_134(v42, &qword_2540E4940);
  v43 = v53;
  OUTLINED_FUNCTION_97(v53, v26);
  if (!v24)
  {
    v44 = OUTLINED_FUNCTION_147();
    *(_OWORD *)(v44 + 16) = v52;
    *(_QWORD *)(v44 + 56) = v6;
    *(_QWORD *)(v44 + 64) = v4;
    v45 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v44 + 32));
    OUTLINED_FUNCTION_97((uint64_t)v45, v43);
    v64 = 0;
    OUTLINED_FUNCTION_140();
    v24 = v6;
    sub_22E233CD4();
    v46 = OUTLINED_FUNCTION_136();
    OUTLINED_FUNCTION_134(v46, &qword_2540E4940);
  }
  OUTLINED_FUNCTION_60_0();
LABEL_10:
  v47 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  OUTLINED_FUNCTION_112(v47, sel_initWithPlaybackIntent_);

  ((void (*)(uint64_t, _QWORD *))v13[1])(v26, v27);
  OUTLINED_FUNCTION_0_0();
}

void sub_22E23335C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  char *v51;
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
  void (*v64)(char *, uint64_t);
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  uint64_t v82;
  char v83;
  int64_t v84;
  char v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99[2];
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  _QWORD v119[3];
  uint64_t v120;

  OUTLINED_FUNCTION_9_0();
  a19 = v22;
  a20 = v23;
  v25 = v24;
  v27 = v26;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4970);
  OUTLINED_FUNCTION_115(v28, (uint64_t)&a16);
  v101 = v29;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v30);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_27_0(v31);
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4968);
  v99[1] = *(_QWORD *)(v100 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_22_0(v33, v99[0]);
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4978);
  v102 = *(_QWORD *)(v103 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_27_0((uint64_t)v99 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0));
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4960);
  v105 = *(_QWORD *)(v36 - 8);
  v106 = v36;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v37);
  OUTLINED_FUNCTION_91(v38, v99[0]);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4988);
  v108 = *(_QWORD *)(v39 - 8);
  v109 = v39;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_6_0();
  v107 = v41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4948);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_39_0();
  v43 = sub_22E241FA0();
  OUTLINED_FUNCTION_127();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_3_0();
  v117 = v45;
  OUTLINED_FUNCTION_7_0();
  v47 = MEMORY[0x24BDAC7A8](v46);
  v49 = (char *)v99 - v48;
  MEMORY[0x24BDAC7A8](v47);
  v51 = (char *)v99 - v50;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4958);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v52);
  OUTLINED_FUNCTION_120();
  v55 = v54 - v53;
  v56 = sub_22E242024();
  v115 = *(_QWORD *)(v56 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v57);
  OUTLINED_FUNCTION_3_0();
  v110 = v58;
  OUTLINED_FUNCTION_7_0();
  MEMORY[0x24BDAC7A8](v59);
  OUTLINED_FUNCTION_52_0();
  v111 = v60;
  OUTLINED_FUNCTION_7_0();
  MEMORY[0x24BDAC7A8](v61);
  v116 = (uint64_t)v99 - v62;
  v114 = v27;
  sub_22E2383CC(v27, (uint64_t)v119);
  if (!v120)
  {
    OUTLINED_FUNCTION_66_0(v63, &qword_2540E4940);
    v67 = OUTLINED_FUNCTION_172(v55, 1);
    goto LABEL_24;
  }
  v113 = v25;
  __swift_project_boxed_opaque_existential_1(v119, v120);
  OUTLINED_FUNCTION_55_0();
  sub_22E241F94();
  v64 = *(void (**)(char *, uint64_t))(v20 + 8);
  v64(v51, v43);
  OUTLINED_FUNCTION_172(v55, 0);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v119);
  v65 = OUTLINED_FUNCTION_123();
  v67 = OUTLINED_FUNCTION_20_0(v65, v66, v56);
  if (v68)
  {
LABEL_24:
    OUTLINED_FUNCTION_124(v67, &qword_2540E4958);
    OUTLINED_FUNCTION_35_0();
    v99[0] = 274;
    OUTLINED_FUNCTION_78_0();
    goto LABEL_25;
  }
  v69 = v43;
  v70 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v115 + 32);
  v112 = v56;
  OUTLINED_FUNCTION_141(v116, v55, v70);
  v71 = *(_QWORD *)(v114 + 16);
  if (!v71)
    goto LABEL_16;
  v72 = v114 + 32;
  swift_bridgeObjectRetain();
  v73 = MEMORY[0x24BEE4AF8];
  v118 = v43;
  do
  {
    sub_22E23B040(v72, (uint64_t)v119);
    OUTLINED_FUNCTION_36_0();
    OUTLINED_FUNCTION_55_0();
    sub_22E241F1C();
    v64(v49, v69);
    v74 = sub_22E241EEC();
    OUTLINED_FUNCTION_20_0(v21, 1, v74);
    if (v68)
    {
      sub_22E2327BC(v21, &qword_2540E4948);
      OUTLINED_FUNCTION_36_0();
      v75 = v117;
      OUTLINED_FUNCTION_55_0();
      v77 = sub_22E241F88();
      v79 = v76;
      v64(v75, v69);
      if (!v79)
      {
        OUTLINED_FUNCTION_30_0();
        goto LABEL_14;
      }
    }
    else
    {
      v77 = sub_22E241EE0();
      v79 = v78;
      OUTLINED_FUNCTION_48_0(v21, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 8));
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v119);
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      v83 = OUTLINED_FUNCTION_101();
      sub_22E2411E0(v83, v84, v85, v86);
      v73 = v87;
    }
    v81 = *(_QWORD *)(v73 + 16);
    v80 = *(_QWORD *)(v73 + 24);
    if (v81 >= v80 >> 1)
    {
      sub_22E2411E0(v80 > 1, v81 + 1, 1, v73);
      v73 = v88;
    }
    *(_QWORD *)(v73 + 16) = v81 + 1;
    v82 = v73 + 16 * v81;
    *(_QWORD *)(v82 + 32) = v77;
    *(_QWORD *)(v82 + 40) = v79;
    v69 = v118;
LABEL_14:
    v72 += 40;
    --v71;
  }
  while (v71);
  swift_bridgeObjectRelease();
LABEL_16:
  v89 = v111;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v115 + 16))(v111, v116, v112);
  v90 = v110;
  sub_22E24200C();
  sub_22E2394C8(&qword_2540E4950, (void (*)(uint64_t))MEMORY[0x24BDDEA30]);
  v91 = OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_11_0(v90);
  if ((v91 & 1) == 0)
  {
    sub_22E242018();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_5_0();
    sub_22E241FF4();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_5_0();
    sub_22E241FC4();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_5_0();
    if ((v91 & 1) != 0)
    {
      OUTLINED_FUNCTION_11_0(v89);
      sub_22E241E08();
      sub_22E2394C8(&qword_255DFC078, (void (*)(uint64_t))MEMORY[0x24BE69DF8]);
      v92 = v104;
      OUTLINED_FUNCTION_42_0();
      swift_getKeyPath();
      v97 = v106;
      OUTLINED_FUNCTION_95();
      OUTLINED_FUNCTION_73_0();
      OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_34_0();
      v120 = v97;
      sub_22E23B2AC(&qword_255DFC080, &qword_2540E4960);
      v95 = OUTLINED_FUNCTION_33_0(v98);
      v96 = v105;
      goto LABEL_19;
    }
    sub_22E242000();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_5_0();
    sub_22E241FAC();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_5_0();
    sub_22E241FB8();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_5_0();
    sub_22E241FE8();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_5_0();
    sub_22E241FD0();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_5_0();
    sub_22E241FDC();
    OUTLINED_FUNCTION_1_0();
    OUTLINED_FUNCTION_5_0();
    OUTLINED_FUNCTION_109();
    sub_22E242318();
    OUTLINED_FUNCTION_146();
    OUTLINED_FUNCTION_102();
    sub_22E2394C8(&qword_255DFC040, (void (*)(uint64_t))MEMORY[0x24BDDEA30]);
    sub_22E2423FC();
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_35_0();
    v99[0] = 317;
LABEL_25:
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_44_0();
  }
  OUTLINED_FUNCTION_11_0(v89);
  sub_22E2420FC();
  v92 = v107;
  sub_22E242048();
  swift_getKeyPath();
  v93 = v109;
  OUTLINED_FUNCTION_95();
  OUTLINED_FUNCTION_73_0();
  OUTLINED_FUNCTION_28_0();
  OUTLINED_FUNCTION_34_0();
  v120 = v93;
  sub_22E23B2AC(&qword_2540E4980, &qword_2540E4988);
  v95 = OUTLINED_FUNCTION_33_0(v94);
  v96 = v108;
LABEL_19:
  OUTLINED_FUNCTION_128((uint64_t)v95, v92, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v96 + 32));
  __swift_project_boxed_opaque_existential_1(v119, v120);
  _s16MusicKitInternal0A15PlayableRequestP01_abC18_MediaPlaybackCoreE14playbackIntent16withStartingItemSo011MPCPlaybackJ0CSg0aB00daM0_pSg_tF_0();
  OUTLINED_FUNCTION_11_0(v116);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v119);
  OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_0_0();
}

void sub_22E233CD4()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t (**v24)(uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t (**v27)(uint64_t, uint64_t, uint64_t);
  uint64_t v28;
  uint64_t (**v29)(uint64_t, uint64_t, uint64_t);
  uint64_t (**v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t v55;
  _QWORD v56[2];
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t (**v60)(uint64_t, uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[8];
  uint64_t v65;
  _QWORD v66[3];
  uint64_t v67;

  OUTLINED_FUNCTION_9_0();
  v61 = v0;
  v62 = v2;
  v4 = v3;
  v59 = OUTLINED_FUNCTION_87();
  v58 = *(_QWORD *)(v59 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_38_0((uint64_t)v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v63 = *(_QWORD *)(sub_22E241FA0() - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_23_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC020);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_21_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF98);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v56 - v11;
  v13 = sub_22E242114();
  v60 = *(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v13 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v56 - v16;
  v66[0] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC088);
  sub_22E23B2AC(&qword_255DFC090, &qword_255DFC088);
  if ((OUTLINED_FUNCTION_116() & 1) == 0)
  {
LABEL_7:
    v66[0] = v4;
    if ((OUTLINED_FUNCTION_116() & 1) == 0)
      goto LABEL_16;
    sub_22E2383CC(v4, (uint64_t)v64);
    if (v64[3])
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC0A0);
      v25 = OUTLINED_FUNCTION_16_0();
      if ((v25 & 1) != 0)
      {
        if (v65)
        {
          OUTLINED_FUNCTION_76_0();
          sub_22E241EBC();
          __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
          v26 = v56[1];
          if ((OUTLINED_FUNCTION_16_0() & 1) != 0)
          {
            OUTLINED_FUNCTION_31_0(v26, 0);
            v27 = v60;
            v28 = v56[0];
            OUTLINED_FUNCTION_114(v60[4]);
            OUTLINED_FUNCTION_156();
            OUTLINED_FUNCTION_48_0(v28, (uint64_t (*)(uint64_t, uint64_t))v27[1]);
            OUTLINED_FUNCTION_30_0();
            goto LABEL_37;
          }
          v55 = OUTLINED_FUNCTION_31_0(v26, 1);
          OUTLINED_FUNCTION_124(v55, &qword_255DFBF98);
          OUTLINED_FUNCTION_30_0();
LABEL_16:
          v29 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))OUTLINED_FUNCTION_137(objc_allocWithZone(MEMORY[0x24BE64D50]));
          v30 = v29;
          v31 = *(_QWORD *)(v4 + 16);
          if (v31)
          {
            v60 = v29;
            v61 = v4;
            v32 = v4 + 32;
            swift_bridgeObjectRetain();
            v33 = MEMORY[0x24BEE4AF8];
            do
            {
              sub_22E23B040(v32, (uint64_t)v66);
              OUTLINED_FUNCTION_36_0();
              OUTLINED_FUNCTION_55_0();
              sub_22E241F70();
              OUTLINED_FUNCTION_49_0(*(uint64_t (**)(uint64_t, uint64_t))(v63 + 8));
              v34 = sub_22E24209C();
              OUTLINED_FUNCTION_20_0(v1, 1, v34);
              if (v23)
              {
                sub_22E2327BC(v1, &qword_255DFC020);
                OUTLINED_FUNCTION_30_0();
              }
              else
              {
                v35 = sub_22E242090();
                v37 = v36;
                (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 8))(v1, v34);
                OUTLINED_FUNCTION_30_0();
                isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
                if ((isUniquelyReferenced_nonNull_native & 1) == 0)
                {
                  OUTLINED_FUNCTION_173(0, *(_QWORD *)(v33 + 16) + 1);
                  v33 = v42;
                }
                v40 = *(_QWORD *)(v33 + 16);
                v39 = *(_QWORD *)(v33 + 24);
                if (v40 >= v39 >> 1)
                {
                  OUTLINED_FUNCTION_173(v39 > 1, v40 + 1);
                  v33 = v43;
                }
                *(_QWORD *)(v33 + 16) = v40 + 1;
                v41 = v33 + 16 * v40;
                *(_QWORD *)(v41 + 32) = v35;
                *(_QWORD *)(v41 + 40) = v37;
              }
              v32 += 40;
              --v31;
            }
            while (v31);
            swift_bridgeObjectRelease();
            v30 = v60;
          }
          else
          {
            v33 = MEMORY[0x24BEE4AF8];
          }
          sub_22E23B2E0(v33, v30);
          v44 = OUTLINED_FUNCTION_137(objc_allocWithZone(MEMORY[0x24BE64D48]));
          objc_msgSend(v44, sel_setRequest_, v30);
          sub_22E23B000(v62, (uint64_t)v66, &qword_2540E4940);
          if (v67)
          {
            v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFB8);
            OUTLINED_FUNCTION_131();
            v47 = OUTLINED_FUNCTION_16_0();
            if ((v47 & 1) != 0)
            {
              if (v65)
              {
                OUTLINED_FUNCTION_76_0();
                v48 = v58;
                v49 = v57;
                v50 = v59;
                (*(void (**)(uint64_t, _QWORD, uint64_t))(v58 + 104))(v57, *MEMORY[0x24BDDF380], v59);
                v51 = sub_22E23D6EC(v49, v46);
                (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v50);
                v52 = objc_msgSend(v51, sel__underlyingModelObject);
                v53 = objc_msgSend(v52, sel_identifiers);
                objc_msgSend(v44, sel_setStartItemIdentifiers_, v53);

                OUTLINED_FUNCTION_30_0();
LABEL_36:
                v54 = OUTLINED_FUNCTION_137(objc_allocWithZone(MEMORY[0x24BE64D58]));
                objc_msgSend(v54, sel_setTracklistToken_, v44);
                objc_msgSend(v54, sel_setTracklistSource_, 3);

                goto LABEL_37;
              }
            }
            else
            {
              OUTLINED_FUNCTION_13_0();
            }
          }
          else
          {
            OUTLINED_FUNCTION_66_0(v45, &qword_2540E4940);
            OUTLINED_FUNCTION_19_0();
          }
          OUTLINED_FUNCTION_63_0(v47, &qword_255DFBFC0);
          goto LABEL_36;
        }
      }
      else
      {
        OUTLINED_FUNCTION_13_0();
      }
    }
    else
    {
      sub_22E2327BC((uint64_t)v64, &qword_2540E4940);
      OUTLINED_FUNCTION_19_0();
    }
    OUTLINED_FUNCTION_63_0(v25, &qword_255DFC098);
    goto LABEL_16;
  }
  sub_22E2383CC(v4, (uint64_t)v66);
  if (!v67)
  {
    OUTLINED_FUNCTION_66_0(v18, &qword_2540E4940);
    v22 = OUTLINED_FUNCTION_31_0((uint64_t)v12, 1);
    goto LABEL_6;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
  OUTLINED_FUNCTION_118();
  v19 = OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_31_0((uint64_t)v12, v19 ^ 1u);
  v20 = OUTLINED_FUNCTION_123();
  v22 = OUTLINED_FUNCTION_20_0(v20, v21, v13);
  if (v23)
  {
LABEL_6:
    OUTLINED_FUNCTION_124(v22, &qword_255DFBF98);
    goto LABEL_7;
  }
  v24 = v60;
  OUTLINED_FUNCTION_114(v60[4]);
  OUTLINED_FUNCTION_156();
  OUTLINED_FUNCTION_48_0((uint64_t)v17, (uint64_t (*)(uint64_t, uint64_t))v24[1]);
LABEL_37:
  OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_0_0();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
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

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void MPCPlaybackIntent.init<A, B>(for:startingAt:)()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39[2];
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[3];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  OUTLINED_FUNCTION_125();
  v38 = v0;
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = sub_22E2422C4();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v37 - v17;
  v40 = v9;
  v41 = v7;
  v42 = v5;
  v43 = v3;
  v37 = v3;
  v19 = v16;
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
  v47 = v9;
  v21 = v9;
  v22 = v13;
  v24 = sub_22E234560((void (*)(char *, char *))sub_22E23454C, (uint64_t)v39, v21, v20, MEMORY[0x24BEE4078], v5, MEMORY[0x24BEE40A8], v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, v11, v19);
  OUTLINED_FUNCTION_20_0((uint64_t)v18, 1, v7);
  if (v25)
  {
    OUTLINED_FUNCTION_25_0((uint64_t)v18, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    OUTLINED_FUNCTION_37_0();
  }
  else
  {
    v45 = v7;
    v46 = v37;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v44);
    (*(void (**)(uint64_t *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(boxed_opaque_existential_1, v18, v7);
  }
  sub_22E234A70(v24, (uint64_t)v44, v27, v28, v29, v30, v31, v32, v37, v38, v39[0], v39[1], v40, v41, v42, v43, v44[0], v44[1], v44[2],
    v45);
  if (v1)
  {
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_25_0(v11, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    v34 = OUTLINED_FUNCTION_84_0();
    OUTLINED_FUNCTION_66_0(v34, &qword_2540E4940);
  }
  else
  {
    v35 = v33;
    v36 = swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_66_0(v36, &qword_2540E4940);
    objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_56_0()), sel_initWithPlaybackIntent_, v35);

    OUTLINED_FUNCTION_25_0(v11, *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8));
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v47 - 8) + 8))(v22, v47);
  }
  OUTLINED_FUNCTION_14_0();
}

uint64_t sub_22E23454C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22E235184(a1, a2);
}

uint64_t sub_22E234560(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  char *v31;
  uint64_t v32;
  int EnumTagSinglePayload;
  char *v34;
  uint64_t v35;
  _QWORD v36[2];
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  char *v51;
  void (*v52)(char *, char *);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;

  v38 = a8;
  v39 = a5;
  v9 = v8;
  v52 = a1;
  v53 = a2;
  v37 = *(_QWORD *)(a5 - 8);
  v11 = MEMORY[0x24BDAC7A8](a1);
  v51 = (char *)v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v50 = (char *)v36 - v13;
  v15 = v14;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v54 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v42 = (char *)v36 - v17;
  v18 = sub_22E2422C4();
  v40 = *(_QWORD *)(v18 - 8);
  v41 = v18;
  v19 = MEMORY[0x24BDAC7A8](v18);
  v48 = (char *)v36 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (char *)v36 - v22;
  v24 = MEMORY[0x24BDAC7A8](v21);
  v36[1] = (char *)v36 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v47 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v46 = (char *)v36 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v45 = a6;
  v55 = swift_getAssociatedTypeWitness();
  v43 = *(_QWORD *)(v55 - 8);
  MEMORY[0x24BDAC7A8](v55);
  v49 = (char *)v36 - v28;
  v29 = sub_22E242228();
  v56 = sub_22E242354();
  sub_22E242360();
  sub_22E24233C();
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 16))(v46, v44, v15);
  v47 = v15;
  result = sub_22E242204();
  if (v29 < 0)
  {
    __break(1u);
LABEL_18:
    __break(1u);
    return result;
  }
  if (v29)
  {
    swift_getAssociatedConformanceWitness();
    v31 = v49;
    while (1)
    {
      sub_22E2422D0();
      result = __swift_getEnumTagSinglePayload((uint64_t)v23, 1, AssociatedTypeWitness);
      if ((_DWORD)result == 1)
        goto LABEL_18;
      v52(v23, v51);
      if (v9)
      {
        (*(void (**)(char *, uint64_t))(v43 + 8))(v31, v55);
        swift_release();
        (*(void (**)(uint64_t, char *, uint64_t))(v37 + 32))(v38, v51, v39);
        return (*(uint64_t (**)(char *, uint64_t))(v54 + 8))(v23, AssociatedTypeWitness);
      }
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v23, AssociatedTypeWitness);
      sub_22E242348();
      if (!--v29)
      {
        v32 = (uint64_t)v48;
        goto LABEL_9;
      }
    }
  }
  swift_getAssociatedConformanceWitness();
  v32 = (uint64_t)v48;
  v31 = v49;
LABEL_9:
  sub_22E2422D0();
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v32, 1, AssociatedTypeWitness);
  v34 = v42;
  if (EnumTagSinglePayload == 1)
  {
    v35 = (uint64_t)v48;
LABEL_14:
    (*(void (**)(char *, uint64_t))(v43 + 8))(v31, v55);
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v35, v41);
    return v56;
  }
  else
  {
    v51 = *(char **)(v54 + 32);
    v35 = (uint64_t)v48;
    while (1)
    {
      ((void (*)(char *, uint64_t, uint64_t))v51)(v34, v35, AssociatedTypeWitness);
      v52(v34, v50);
      if (v9)
        break;
      v9 = 0;
      (*(void (**)(char *, uint64_t))(v54 + 8))(v34, AssociatedTypeWitness);
      sub_22E242348();
      sub_22E2422D0();
      if (__swift_getEnumTagSinglePayload(v35, 1, AssociatedTypeWitness) == 1)
        goto LABEL_14;
    }
    (*(void (**)(char *, uint64_t))(v54 + 8))(v34, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v31, v55);
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v37 + 32))(v38, v50, v39);
  }
}

void sub_22E234A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  char v47;
  void (*v48)(uint64_t, uint64_t);
  __int128 *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int EnumTagSinglePayload;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  id v65;
  _BYTE *v66;
  uint64_t v67[2];
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unsigned int v78;
  uint64_t v79;
  uint64_t v80;
  __int128 v81[2];
  _QWORD v82[3];
  uint64_t v83;
  uint64_t v84;

  OUTLINED_FUNCTION_125();
  a19 = v23;
  a20 = v24;
  v26 = v25;
  v28 = v27;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC020);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38_0(v30);
  v31 = sub_22E241FA0();
  OUTLINED_FUNCTION_115(v31, (uint64_t)&a14);
  v72 = v32;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_27_0((uint64_t)v67 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0));
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4938);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v35);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_38_0(v36);
  v37 = sub_22E241DB4();
  OUTLINED_FUNCTION_62_0();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_90();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_27_0((uint64_t)v67 - v40);
  v41 = sub_22E241DA8();
  v42 = sub_22E238100(v41);
  v84 = v42;
  v43 = *(_QWORD *)(v28 + 16);
  v68 = v20;
  v69 = v28;
  if (v43)
  {
    v75 = v22;
    v67[0] = v26;
    v44 = v28 + 32;
    v78 = *MEMORY[0x24BE69720];
    HIDWORD(v70) = *MEMORY[0x24BE69718];
    swift_bridgeObjectRetain();
    v45 = v76;
    while (1)
    {
      sub_22E23B040(v44, (uint64_t)v82);
      __swift_project_boxed_opaque_existential_1(v82, v83);
      sub_22E241EC8();
      v46 = v75;
      OUTLINED_FUNCTION_71_0(v21, v78);
      sub_22E2394C8(&qword_255DFC028, (void (*)(uint64_t))MEMORY[0x24BE69730]);
      v47 = sub_22E24215C();
      v48 = *(void (**)(uint64_t, uint64_t))(v46 + 8);
      OUTLINED_FUNCTION_82_0();
      sub_22E23B040((uint64_t)v82, (uint64_t)v81);
      v49 = v81;
      if ((v47 & 1) == 0)
        goto LABEL_6;
      sub_22E232778(v81, (uint64_t)&v80);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4928);
      if (OUTLINED_FUNCTION_16_0())
        break;
LABEL_7:
      __swift_project_boxed_opaque_existential_1(v82, v83);
      v50 = v71;
      sub_22E242054();
      v51 = v74;
      sub_22E241F70();
      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v50, v73);
      v52 = sub_22E24209C();
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v51, 1, v52);
      sub_22E2327BC(v51, &qword_255DFC020);
      if (EnumTagSinglePayload == 1)
      {
        OUTLINED_FUNCTION_71_0(v21, HIDWORD(v70));
        OUTLINED_FUNCTION_69_0();
        OUTLINED_FUNCTION_82_0();
        sub_22E2327BC(v50, &qword_2540E4938);
      }
      v45 = v76;
      v48(v76, v37);
      OUTLINED_FUNCTION_30_0();
      v44 += 40;
      if (!--v43)
      {
        swift_bridgeObjectRelease();
        v54 = v84;
        v26 = v67[0];
        v55 = v78;
        goto LABEL_12;
      }
    }
    v49 = (__int128 *)&v79;
LABEL_6:
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v49);
    OUTLINED_FUNCTION_71_0(v21, v78);
    OUTLINED_FUNCTION_69_0();
    OUTLINED_FUNCTION_82_0();
    sub_22E2327BC(v45, &qword_2540E4938);
    goto LABEL_7;
  }
  v54 = v42;
  v55 = *MEMORY[0x24BE69720];
LABEL_12:
  OUTLINED_FUNCTION_71_0(v21, v55);
  swift_bridgeObjectRetain();
  v56 = sub_22E238248(v21, v54);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_151();
  if ((v56 & 1) == 0)
  {
    OUTLINED_FUNCTION_71_0(v21, *MEMORY[0x24BE69718]);
    v64 = sub_22E238248(v21, v84);
    OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_151();
    if ((v64 & 1) == 0)
    {
      sub_22E23948C();
      OUTLINED_FUNCTION_51_0();
      *v66 = 0;
      swift_willThrow();
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  OUTLINED_FUNCTION_28_0();
  sub_22E23335C(v69, v26, v57, v58, v59, v60, v61, v62, v67[0], v67[1], v68, v69, v70, v71, v72, v73, v74, v75, v76,
    v77);
  if (!v63)
LABEL_16:
    sub_22E233CD4();
  v65 = objc_allocWithZone((Class)OUTLINED_FUNCTION_56_0());
  OUTLINED_FUNCTION_104(v65, sel_initWithPlaybackIntent_);
  OUTLINED_FUNCTION_135();
LABEL_19:
  OUTLINED_FUNCTION_14_0();
}

void MPCPlaybackIntent.init<A, B>(_:startingAt:)()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  _QWORD v23[6];
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_9_0();
  v2 = v0;
  v4 = v3;
  v23[4] = v5;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = sub_22E2422C4();
  OUTLINED_FUNCTION_62_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_3_0();
  v23[1] = v14;
  OUTLINED_FUNCTION_7_0();
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)v23 - v17;
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_120();
  v24 = v21;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v21 + 16))(v20 - v19, v11, v7);
  v25 = v1;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v1 + 16);
  v23[5] = v9;
  v22(v18, v9, v12);
  v23[2] = v2;
  v23[3] = v4;
  MPCPlaybackIntent.init<A, B>(for:startingAt:)();
  OUTLINED_FUNCTION_49_0(*(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
  OUTLINED_FUNCTION_81_0(v11, *(uint64_t (**)(uint64_t, uint64_t))(v24 + 8));
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_22E235184@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t *boxed_opaque_existential_1;

  v5 = *(_QWORD *)(v2 + 24);
  v6 = *(_QWORD *)(v2 + 40);
  a2[3] = v5;
  a2[4] = v6;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(boxed_opaque_existential_1, a1, v5);
}

void MPCPlaybackIntent.init<A>(container:startingAt:playbackSource:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  OUTLINED_FUNCTION_9_0();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v7 = sub_22E241D9C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_39_0();
  sub_22E241D54();
  sub_22E241D84();
  objc_opt_self();
  v9 = OUTLINED_FUNCTION_58_0();
  if (!v9)
  {
    OUTLINED_FUNCTION_68_0();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_78_0();
    sub_22E2423C0();
    OUTLINED_FUNCTION_44_0();
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v9);
  OUTLINED_FUNCTION_68_0();
  sub_22E2327BC(v4, &qword_2540E4938);
  OUTLINED_FUNCTION_174(v10, &qword_2540E4940);
  OUTLINED_FUNCTION_81_0(v6, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8));
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v0, v7);
  OUTLINED_FUNCTION_0_0();
}

void MPCPlaybackIntent.init(_:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v7[48];

  OUTLINED_FUNCTION_9_0();
  v2 = v1;
  OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_62_0();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_89();
  MEMORY[0x24BDAC7A8](v4);
  v6 = &v7[-v5];
  OUTLINED_FUNCTION_149((uint64_t)&v7[-v5]);
  MPCPlaybackIntent.init(for:)(v6);
  OUTLINED_FUNCTION_143(v2, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  OUTLINED_FUNCTION_0_0();
}

#error "22E235674: call analysis failed (funcsize=63)"

void sub_22E2356B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, unint64_t);
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
  char *v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, uint64_t);
  int v59;
  char v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  uint64_t v65;
  int v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  __int128 *v88;
  uint64_t v89;
  unint64_t v90;
  char v91;
  int64_t v92;
  char v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  NSObject *v99;
  os_log_type_t v100;
  uint8_t *v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  char v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  id v119;
  _BYTE *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  NSObject *v124;
  os_log_type_t v125;
  uint8_t *v126;
  uint64_t v127;
  unint64_t v128;
  uint64_t v129;
  char v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  _BYTE *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint8_t *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  __int128 v158[2];
  uint64_t v159;
  uint64_t v160;
  __int128 v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;

  OUTLINED_FUNCTION_125();
  a19 = v24;
  a20 = v25;
  v153 = v21;
  v154 = (uint8_t *)v20;
  v155 = v26;
  v28 = v27;
  v29 = OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_115(v29, (uint64_t)&a17);
  v157 = v30;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v32);
  OUTLINED_FUNCTION_111();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4938);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_6_0();
  v35 = OUTLINED_FUNCTION_117(v34);
  v144 = *(_QWORD *)(v35 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_27_0(v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF90);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_22_0(v39, v139);
  v40 = sub_22E242108();
  OUTLINED_FUNCTION_115(v40, (uint64_t)&a12);
  v147 = v41;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v42);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_27_0((uint64_t)&v139 - v44);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF80);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v46);
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v47);
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_4_0();
  v49 = MEMORY[0x24BDAC7A8](v48);
  v51 = (char *)&v139 - v50;
  MEMORY[0x24BDAC7A8](v49);
  v53 = (unint64_t)&v139 - v52;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF98);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v54);
  OUTLINED_FUNCTION_40_0();
  v55 = sub_22E242114();
  v146 = *(_QWORD *)(v55 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v56);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_27_0(v57);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC008);
  sub_22E23B2AC(&qword_255DFC010, &qword_255DFC008);
  if ((OUTLINED_FUNCTION_59_0() & 1) != 0)
  {
    v139 = v35;
    OUTLINED_FUNCTION_83_0();
    OUTLINED_FUNCTION_20_0(v53, 1, v156);
    if (v60)
    {
      sub_22E2327BC(v53, &qword_255DFBF80);
      v61 = OUTLINED_FUNCTION_31_0((uint64_t)v22, 1);
    }
    else
    {
      v20 = v53;
      sub_22E241D3C();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_25_0(v53, v58);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
      OUTLINED_FUNCTION_118();
      v59 = OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_31_0((uint64_t)v22, v59 ^ 1u);
      v61 = OUTLINED_FUNCTION_20_0((uint64_t)v22, 1, v55);
      if (!v60)
      {
        v73 = v146;
        v74 = v145;
        OUTLINED_FUNCTION_103(v145, (uint64_t)v22, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v146 + 32));
        v75 = objc_allocWithZone((Class)OUTLINED_FUNCTION_56_0());
        v76 = (void *)static MPCPlaybackIntent.radioPlaybackIntent(for:)();
        OUTLINED_FUNCTION_112(v75, sel_initWithPlaybackIntent_);

        OUTLINED_FUNCTION_72_0(v77, &qword_255DFBF80);
        OUTLINED_FUNCTION_43_0();
        (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v74, v55);
        goto LABEL_55;
      }
    }
    OUTLINED_FUNCTION_113(v61, &qword_255DFBF98);
    v35 = v139;
  }
  OUTLINED_FUNCTION_59_0();
  OUTLINED_FUNCTION_170();
  if ((v62 & 1) != 0)
  {
    OUTLINED_FUNCTION_83_0();
    v63 = OUTLINED_FUNCTION_20_0((uint64_t)v51, 1, v53);
    if (v60)
    {
      OUTLINED_FUNCTION_174(v63, &qword_255DFBF80);
      v20 = v151;
      v68 = __swift_storeEnumTagSinglePayload(v151, 1, 1, v152);
    }
    else
    {
      sub_22E241D3C();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_130((uint64_t)v51, v64);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
      OUTLINED_FUNCTION_118();
      v20 = v151;
      v65 = v152;
      v66 = OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_31_0(v20, v66 ^ 1u);
      v68 = OUTLINED_FUNCTION_20_0(v20, 1, v65);
      if (!v67)
      {
        v78 = v147;
        v79 = v148;
        OUTLINED_FUNCTION_103(v148, v20, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v147 + 32));
        v80 = sub_22E237168(v79);
        if (v80)
        {
          v81 = v80;
          objc_msgSend(objc_allocWithZone((Class)OUTLINED_FUNCTION_56_0()), sel_initWithPlaybackIntent_, v80);

          OUTLINED_FUNCTION_72_0(v82, &qword_255DFBF80);
          OUTLINED_FUNCTION_43_0();
          (*(void (**)(uint64_t, uint64_t))(v78 + 8))(v79, v65);
        }
        else
        {
          if (qword_255DFBF08 != -1)
            swift_once();
          v122 = OUTLINED_FUNCTION_158();
          __swift_project_value_buffer(v122, (uint64_t)qword_255DFC370);
          v123 = v140;
          OUTLINED_FUNCTION_103(v140, v79, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v78 + 16));
          v124 = sub_22E241E98();
          v125 = sub_22E242294();
          if (os_log_type_enabled(v124, v125))
          {
            v126 = (uint8_t *)OUTLINED_FUNCTION_53_0();
            v164 = OUTLINED_FUNCTION_3();
            *(_DWORD *)v126 = 136315138;
            sub_22E2394C8(&qword_255DFBFB0, (void (*)(uint64_t))MEMORY[0x24BDDF7E0]);
            v127 = sub_22E2423FC();
            v129 = OUTLINED_FUNCTION_171(v127, v128);
            OUTLINED_FUNCTION_64_0(v129);
            sub_22E2422DC();
            OUTLINED_FUNCTION_121();
            OUTLINED_FUNCTION_132();
            OUTLINED_FUNCTION_148(v123);
            OUTLINED_FUNCTION_154(&dword_22E22E000, v124, v125, "Unable to create artist station playback intent from artist: %s.", v126);
            OUTLINED_FUNCTION_50_0();
            OUTLINED_FUNCTION_0();
          }
          OUTLINED_FUNCTION_148(v123);

          sub_22E23948C();
          OUTLINED_FUNCTION_51_0();
          v138 = OUTLINED_FUNCTION_85_0(v137, 2);
          OUTLINED_FUNCTION_113(v138, &qword_255DFBF80);
          OUTLINED_FUNCTION_43_0();
          OUTLINED_FUNCTION_148(v79);
        }
        goto LABEL_55;
      }
    }
    OUTLINED_FUNCTION_93(v68, &qword_255DFBF90);
  }
  if ((OUTLINED_FUNCTION_59_0() & 1) != 0)
  {
    v69 = v150;
    OUTLINED_FUNCTION_83_0();
    v70 = OUTLINED_FUNCTION_20_0(v69, 1, v53);
    if (v60)
    {
      OUTLINED_FUNCTION_174(v70, &qword_255DFBF80);
      OUTLINED_FUNCTION_19_0();
    }
    else
    {
      v20 = v69;
      sub_22E241D3C();
      v22 = *(void (**)(uint64_t, unint64_t))(v157 + 8);
      v22(v69, v53);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4928);
      v71 = OUTLINED_FUNCTION_12_0();
      if ((v71 & 1) != 0)
      {
        if (v162)
        {
          OUTLINED_FUNCTION_77_0();
          OUTLINED_FUNCTION_57_0(v155, &qword_255DFBF80, (uint64_t)&v163);
          v72 = OUTLINED_FUNCTION_20_0(v69, 1, v53);
          if (v60)
          {
            OUTLINED_FUNCTION_93(v72, &qword_255DFBF80);
            OUTLINED_FUNCTION_19_0();
            OUTLINED_FUNCTION_161();
          }
          else
          {
            sub_22E241D3C();
            v22(v69, v53);
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
            OUTLINED_FUNCTION_12_0();
            OUTLINED_FUNCTION_161();
            if ((v130 & 1) == 0)
              OUTLINED_FUNCTION_13_0();
          }
          v131 = v143;
          v132 = OUTLINED_FUNCTION_79_0();
          v133 = v142;
          __swift_storeEnumTagSinglePayload(v142, 1, 1, v132);
          OUTLINED_FUNCTION_126();
          sub_22E2327BC(v133, &qword_2540E4938);
          sub_22E241D84();
          objc_opt_self();
          if (!swift_dynamicCastObjCClass())
          {
            swift_unknownObjectRelease();
            OUTLINED_FUNCTION_18_0();
            OUTLINED_FUNCTION_78_0();
            OUTLINED_FUNCTION_45_0();
            OUTLINED_FUNCTION_44_0();
          }
          v134 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          OUTLINED_FUNCTION_104(v134, sel_initWithPlaybackIntent_);
          v135 = swift_unknownObjectRelease();
          OUTLINED_FUNCTION_174(v135, &qword_255DFBF80);
          OUTLINED_FUNCTION_43_0();
          v136 = (*(uint64_t (**)(uint64_t, uint64_t))(v144 + 8))(v131, v35);
          OUTLINED_FUNCTION_63_0(v136, &qword_2540E4940);
          OUTLINED_FUNCTION_30_0();
          goto LABEL_55;
        }
      }
      else
      {
        OUTLINED_FUNCTION_13_0();
      }
    }
    OUTLINED_FUNCTION_63_0(v71, &qword_2540E4930);
  }
  v83 = *(_QWORD *)(v28 + 16);
  if (v83)
  {
    v84 = v28 + ((*(unsigned __int8 *)(v157 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v157 + 80));
    v85 = *(_QWORD *)(v157 + 72);
    v22 = *(void (**)(uint64_t, unint64_t))(v157 + 16);
    v152 = v28;
    swift_bridgeObjectRetain();
    v86 = MEMORY[0x24BEE4AF8];
    while (1)
    {
      ((void (*)(uint64_t, unint64_t, unint64_t))v22)(v23, v84, v53);
      sub_22E241D3C();
      v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
      if (!OUTLINED_FUNCTION_16_0())
        break;
      sub_22E232778(v158, (uint64_t)&v161);
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_130(v23, v87);
      if (v162)
      {
        OUTLINED_FUNCTION_77_0();
        v88 = (__int128 *)OUTLINED_FUNCTION_163();
        sub_22E232778(v88, v89);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          v91 = OUTLINED_FUNCTION_101();
          sub_22E2412FC(v91, v92, v93, v94);
          v86 = v95;
        }
        v53 = *(_QWORD *)(v86 + 16);
        v90 = *(_QWORD *)(v86 + 24);
        v20 = v53 + 1;
        if (v53 >= v90 >> 1)
        {
          sub_22E2412FC(v90 > 1, v53 + 1, 1, v86);
          v86 = v96;
        }
        *(_QWORD *)(v86 + 16) = v20;
        sub_22E232778(&v161, v86 + 40 * v53 + 32);
        OUTLINED_FUNCTION_170();
      }
      else
      {
        sub_22E2327BC((uint64_t)&v161, &qword_2540E4940);
      }
      v84 += v85;
      if (!--v83)
      {
        OUTLINED_FUNCTION_167();
        goto LABEL_45;
      }
    }
    v159 = 0;
    memset(v158, 0, sizeof(v158));
    sub_22E2327BC((uint64_t)v158, &qword_2540E4940);
    if (qword_255DFBF08 != -1)
      swift_once();
    v97 = OUTLINED_FUNCTION_158();
    __swift_project_value_buffer(v97, (uint64_t)qword_255DFC370);
    v98 = v149;
    ((void (*)(uint64_t, uint64_t, unint64_t))v22)(v149, v23, v53);
    v99 = sub_22E241E98();
    v100 = sub_22E242294();
    if (os_log_type_enabled(v99, v100))
    {
      v101 = (uint8_t *)OUTLINED_FUNCTION_53_0();
      v160 = OUTLINED_FUNCTION_3();
      *(_DWORD *)v101 = 136315138;
      v154 = v101 + 4;
      sub_22E2394C8(&qword_255DFBF78, (void (*)(uint64_t))MEMORY[0x24BE695D0]);
      v102 = sub_22E2423FC();
      *(_QWORD *)&v158[0] = sub_22E238D88(v102, v103, &v160);
      OUTLINED_FUNCTION_170();
      sub_22E2422DC();
      OUTLINED_FUNCTION_121();
      OUTLINED_FUNCTION_132();
      OUTLINED_FUNCTION_129(v98);
      OUTLINED_FUNCTION_154(&dword_22E22E000, v99, v100, "Non playable item %s passed to create a playback intent.", v101);
      OUTLINED_FUNCTION_50_0();
      OUTLINED_FUNCTION_0();
    }
    OUTLINED_FUNCTION_132();
    OUTLINED_FUNCTION_129(v98);

    sub_22E23948C();
    OUTLINED_FUNCTION_51_0();
    OUTLINED_FUNCTION_85_0(v120, 3);
    OUTLINED_FUNCTION_129(v23);
    OUTLINED_FUNCTION_28_0();
    v121 = OUTLINED_FUNCTION_167();
    OUTLINED_FUNCTION_72_0(v121, &qword_255DFBF80);
    OUTLINED_FUNCTION_43_0();
  }
  else
  {
    v86 = MEMORY[0x24BEE4AF8];
LABEL_45:
    OUTLINED_FUNCTION_133();
    OUTLINED_FUNCTION_57_0((uint64_t)v22, v104, (uint64_t)&a13);
    v105 = OUTLINED_FUNCTION_20_0(v20, 1, v53);
    v106 = v153;
    if (v60)
    {
      OUTLINED_FUNCTION_93(v105, &qword_255DFBF80);
      OUTLINED_FUNCTION_100();
    }
    else
    {
      sub_22E241D3C();
      OUTLINED_FUNCTION_67_0();
      OUTLINED_FUNCTION_130(v20, v107);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
      OUTLINED_FUNCTION_163();
      v108 = OUTLINED_FUNCTION_16_0();
      if ((v108 & 1) == 0)
        OUTLINED_FUNCTION_37_0();
    }
    sub_22E234A70(v86, (uint64_t)&v164, v109, v110, v111, v112, v113, v114, v139, v140, v141, v142, v143, v144, v145, v146, v147, v148, v149,
      v150);
    if (v106)
    {
      v116 = OUTLINED_FUNCTION_28_0();
    }
    else
    {
      v118 = v115;
      OUTLINED_FUNCTION_28_0();
      v119 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
      OUTLINED_FUNCTION_112(v119, sel_initWithPlaybackIntent_);

    }
    OUTLINED_FUNCTION_113(v116, &qword_255DFBF80);
    v117 = OUTLINED_FUNCTION_43_0();
    OUTLINED_FUNCTION_66_0(v117, &qword_2540E4940);
  }
LABEL_55:
  OUTLINED_FUNCTION_14_0();
}

void MPCPlaybackIntent.init<A>(for:startingAt:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
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
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  char v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void (*v78)(uint64_t, uint64_t);
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  os_log_type_t v105;
  uint8_t *v106;
  uint64_t v107;
  uint64_t v108;
  unint64_t v109;
  uint64_t v110;
  char v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  uint64_t v116;
  void (*v117)(uint64_t, uint64_t);
  _BYTE *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;

  OUTLINED_FUNCTION_125();
  a19 = v25;
  a20 = v26;
  v135 = v20;
  v136 = v21;
  v28 = v27;
  v139 = v29;
  v31 = v30;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4938);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v32);
  v34 = OUTLINED_FUNCTION_117((uint64_t)&v120 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  OUTLINED_FUNCTION_115(v34, (uint64_t)&a15);
  v127 = v35;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_27_0(v37);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF90);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v38);
  OUTLINED_FUNCTION_91(v39, v120);
  v134 = sub_22E242108();
  v129 = *(_QWORD *)(v134 - 8);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v40);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_27_0((uint64_t)&v120 - v42);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF80);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v44);
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v45);
  OUTLINED_FUNCTION_52_0();
  v132 = v46;
  OUTLINED_FUNCTION_7_0();
  v48 = MEMORY[0x24BDAC7A8](v47);
  v50 = (char *)&v120 - v49;
  MEMORY[0x24BDAC7A8](v48);
  v52 = (char *)&v120 - v51;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF98);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v53);
  OUTLINED_FUNCTION_92();
  v54 = sub_22E242114();
  OUTLINED_FUNCTION_119();
  MEMORY[0x24BDAC7A8](v55);
  OUTLINED_FUNCTION_40_0();
  if ((OUTLINED_FUNCTION_152() & 1) != 0)
  {
    v123 = v28;
    v121 = v31;
    sub_22E24221C();
    v56 = OUTLINED_FUNCTION_65_0();
    v57 = OUTLINED_FUNCTION_123();
    v59 = OUTLINED_FUNCTION_20_0(v57, v58, v56);
    if (v61)
    {
      OUTLINED_FUNCTION_124(v59, &qword_255DFBF80);
      OUTLINED_FUNCTION_31_0(v24, 1);
    }
    else
    {
      sub_22E241D3C();
      OUTLINED_FUNCTION_25_0((uint64_t)v52, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 8));
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
      OUTLINED_FUNCTION_118();
      v60 = OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_31_0(v24, v60 ^ 1u);
      OUTLINED_FUNCTION_20_0(v24, 1, v54);
      if (!v61)
      {
        OUTLINED_FUNCTION_103(v22, v24, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 32));
        v82 = objc_allocWithZone((Class)OUTLINED_FUNCTION_56_0());
        v83 = (void *)static MPCPlaybackIntent.radioPlaybackIntent(for:)();
        objc_msgSend(v82, sel_initWithPlaybackIntent_, v83);

        OUTLINED_FUNCTION_96(v84, &qword_255DFBF80);
        (*(void (**)(uint64_t))(*(_QWORD *)(v123 - 8) + 8))(v121);
        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v54);
        goto LABEL_36;
      }
    }
    sub_22E2327BC(v24, &qword_255DFBF98);
    v28 = v123;
    v31 = v121;
  }
  v62 = OUTLINED_FUNCTION_152();
  v63 = v136;
  if ((v62 & 1) != 0)
  {
    OUTLINED_FUNCTION_110();
    v64 = OUTLINED_FUNCTION_65_0();
    v65 = OUTLINED_FUNCTION_20_0((uint64_t)v50, 1, v64);
    if (v61)
    {
      OUTLINED_FUNCTION_107(v65, &qword_255DFBF80);
      v72 = __swift_storeEnumTagSinglePayload(v133, 1, 1, v134);
    }
    else
    {
      sub_22E241D3C();
      OUTLINED_FUNCTION_84_0();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
      OUTLINED_FUNCTION_118();
      v66 = v133;
      v67 = v134;
      v68 = OUTLINED_FUNCTION_16_0();
      __swift_storeEnumTagSinglePayload(v66, v68 ^ 1u, 1, v67);
      v69 = OUTLINED_FUNCTION_123();
      v72 = OUTLINED_FUNCTION_20_0(v69, v70, v67);
      if (!v71)
      {
        OUTLINED_FUNCTION_133();
        v85 = v130;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v130, v66, v67);
        if (sub_22E237168(v85))
        {
          v86 = objc_allocWithZone((Class)OUTLINED_FUNCTION_56_0());
          OUTLINED_FUNCTION_104(v86, sel_initWithPlaybackIntent_);
          OUTLINED_FUNCTION_135();
          OUTLINED_FUNCTION_96(v87, &qword_255DFBF80);
          OUTLINED_FUNCTION_8_0();
          (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v85, v67);
        }
        else
        {
          if (qword_255DFBF08 != -1)
            swift_once();
          v102 = OUTLINED_FUNCTION_158();
          __swift_project_value_buffer(v102, (uint64_t)qword_255DFC370);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 16))(v122, v85, v67);
          v103 = v22;
          v104 = sub_22E241E98();
          v105 = sub_22E242294();
          if (os_log_type_enabled(v104, v105))
          {
            v106 = (uint8_t *)OUTLINED_FUNCTION_53_0();
            v107 = OUTLINED_FUNCTION_3();
            v123 = v28;
            v138 = v107;
            *(_DWORD *)v106 = 136315138;
            sub_22E2394C8(&qword_255DFBFB0, (void (*)(uint64_t))MEMORY[0x24BDDF7E0]);
            v108 = sub_22E2423FC();
            v110 = OUTLINED_FUNCTION_171(v108, v109);
            OUTLINED_FUNCTION_64_0(v110);
            sub_22E2422DC();
            OUTLINED_FUNCTION_121();
            OUTLINED_FUNCTION_132();
            OUTLINED_FUNCTION_150();
            OUTLINED_FUNCTION_154(&dword_22E22E000, v104, v105, "Unable to create artist station playback intent from artist: %s.", v106);
            OUTLINED_FUNCTION_50_0();
            OUTLINED_FUNCTION_0();
          }
          v117 = *(void (**)(uint64_t, uint64_t))(v103 + 8);
          OUTLINED_FUNCTION_150();

          sub_22E23948C();
          OUTLINED_FUNCTION_51_0();
          v119 = OUTLINED_FUNCTION_85_0(v118, 2);
          OUTLINED_FUNCTION_124(v119, &qword_255DFBF80);
          OUTLINED_FUNCTION_8_0();
          v117(v85, v67);
        }
        goto LABEL_36;
      }
    }
    OUTLINED_FUNCTION_124(v72, &qword_255DFBF90);
  }
  if ((sub_22E242210() & 1) != 0)
  {
    v73 = v132;
    OUTLINED_FUNCTION_110();
    v74 = OUTLINED_FUNCTION_65_0();
    v75 = OUTLINED_FUNCTION_123();
    v77 = OUTLINED_FUNCTION_20_0(v75, v76, v74);
    if (v61)
    {
      OUTLINED_FUNCTION_124(v77, &qword_255DFBF80);
      OUTLINED_FUNCTION_19_0();
    }
    else
    {
      sub_22E241D3C();
      v78 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v74 - 8) + 8);
      v78(v73, v74);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4928);
      v79 = OUTLINED_FUNCTION_12_0();
      if ((v79 & 1) != 0)
      {
        if (v137)
        {
          OUTLINED_FUNCTION_77_0();
          OUTLINED_FUNCTION_57_0(v139, &qword_255DFBF80, (uint64_t)&a11);
          v80 = OUTLINED_FUNCTION_20_0(v73, 1, v74);
          if (v61)
          {
            OUTLINED_FUNCTION_93(v80, &qword_255DFBF80);
            OUTLINED_FUNCTION_19_0();
            v81 = v126;
          }
          else
          {
            sub_22E241D3C();
            v78(v73, v74);
            __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
            v111 = OUTLINED_FUNCTION_12_0();
            v81 = v126;
            if ((v111 & 1) == 0)
              OUTLINED_FUNCTION_13_0();
          }
          v112 = OUTLINED_FUNCTION_79_0();
          __swift_storeEnumTagSinglePayload(v125, 1, 1, v112);
          v113 = OUTLINED_FUNCTION_126();
          OUTLINED_FUNCTION_107(v113, &qword_2540E4938);
          sub_22E241D84();
          objc_opt_self();
          if (!swift_dynamicCastObjCClass())
          {
            swift_unknownObjectRelease();
            OUTLINED_FUNCTION_18_0();
            OUTLINED_FUNCTION_78_0();
            OUTLINED_FUNCTION_45_0();
            OUTLINED_FUNCTION_44_0();
          }
          v114 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          OUTLINED_FUNCTION_112(v114, sel_initWithPlaybackIntent_);
          v115 = swift_unknownObjectRelease();
          OUTLINED_FUNCTION_96(v115, &qword_255DFBF80);
          OUTLINED_FUNCTION_8_0();
          v116 = (*(uint64_t (**)(uint64_t, uint64_t))(v127 + 8))(v81, v128);
          OUTLINED_FUNCTION_63_0(v116, &qword_2540E4940);
          OUTLINED_FUNCTION_30_0();
          goto LABEL_36;
        }
      }
      else
      {
        OUTLINED_FUNCTION_13_0();
      }
    }
    OUTLINED_FUNCTION_63_0(v79, &qword_2540E4930);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
  v88 = sub_22E242234();
  if (v63)
  {
    OUTLINED_FUNCTION_96(v88, &qword_255DFBF80);
    OUTLINED_FUNCTION_8_0();
  }
  else
  {
    v89 = v88;
    OUTLINED_FUNCTION_57_0(v139, &qword_255DFBF80, (uint64_t)&a18);
    v90 = OUTLINED_FUNCTION_65_0();
    v91 = OUTLINED_FUNCTION_20_0(v31, 1, v90);
    if (v61)
    {
      OUTLINED_FUNCTION_93(v91, &qword_255DFBF80);
      OUTLINED_FUNCTION_100();
    }
    else
    {
      sub_22E241D3C();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v90 - 8) + 8))(v31, v90);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
      OUTLINED_FUNCTION_163();
      v92 = OUTLINED_FUNCTION_16_0();
      if ((v92 & 1) == 0)
        OUTLINED_FUNCTION_37_0();
    }
    sub_22E234A70(v89, (uint64_t)&v138, v93, v94, v95, v96, v97, v98, v120, v121, v122, v123, v124, v125, v126, v127, v128, v129, v130,
      v131);
    swift_bridgeObjectRelease();
    v99 = objc_allocWithZone((Class)OUTLINED_FUNCTION_56_0());
    OUTLINED_FUNCTION_104(v99, sel_initWithPlaybackIntent_);
    OUTLINED_FUNCTION_135();
    OUTLINED_FUNCTION_107(v100, &qword_255DFBF80);
    v101 = OUTLINED_FUNCTION_8_0();
    OUTLINED_FUNCTION_66_0(v101, &qword_2540E4940);
  }
LABEL_36:
  OUTLINED_FUNCTION_14_0();
}

#error "22E236E34: call analysis failed (funcsize=181)"

uint64_t static MPCPlaybackIntent.radioPlaybackIntent(for:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *ObjCClassFromMetadata;
  id v6;

  v3 = OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_119();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_40_0();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BDDF380], v3);
  sub_22E242114();
  sub_22E241E80();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v6 = OUTLINED_FUNCTION_112(ObjCClassFromMetadata, sel_radioPlaybackIntentWithStation_);
  OUTLINED_FUNCTION_138();
  return v0;
}

id sub_22E237168(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  uint64_t v13;

  v2 = sub_22E2420C0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_22E242108();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDDF380], v2);
  v10 = (void *)sub_22E241E80();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v11 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_radioPlaybackIntentFromArtist_, v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  return v11;
}

void static MPCPlaybackIntent.radioPlaybackIntent<A>(from:)()
{
  uint64_t v0;
  uint64_t v1;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *ObjCClassFromMetadata;
  id v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;

  OUTLINED_FUNCTION_9_0();
  v51 = v2;
  v52 = v0;
  v4 = v3;
  v5 = sub_22E2420E4();
  v47 = *(_QWORD *)(v5 - 8);
  v48 = v5;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3_0();
  v46 = v7;
  OUTLINED_FUNCTION_7_0();
  MEMORY[0x24BDAC7A8](v8);
  v44 = (char *)&v42 - v9;
  v10 = sub_22E242108();
  v11 = *(_QWORD *)(v10 - 8);
  v49 = v10;
  v50 = v11;
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_3_0();
  v45 = v13;
  OUTLINED_FUNCTION_7_0();
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v42 - v15;
  OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_127();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_23_0();
  v18 = sub_22E2420F0();
  v19 = *(_QWORD *)(v18 - 8);
  OUTLINED_FUNCTION_2_0();
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v42 - v25;
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_21_0();
  v53 = v27;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v27 + 16))(v1, v51, v4);
  if (OUTLINED_FUNCTION_142())
  {
    v43 = v19;
    v28 = OUTLINED_FUNCTION_128((uint64_t)v23, (uint64_t)v26, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 32));
    OUTLINED_FUNCTION_46_0(v28, *MEMORY[0x24BDDF380]);
    v29 = (void *)sub_22E241E80();
    OUTLINED_FUNCTION_47_0();
    objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_radioPlaybackIntentFromAlbum_, v29);

    (*(void (**)(char *, uint64_t))(v43 + 8))(v23, v18);
  }
  else
  {
    v30 = v49;
    if (OUTLINED_FUNCTION_142())
    {
      v31 = v45;
      v32 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v50 + 32))(v45, v16, v30);
      OUTLINED_FUNCTION_46_0(v32, *MEMORY[0x24BDDF380]);
      OUTLINED_FUNCTION_106();
      OUTLINED_FUNCTION_47_0();
      ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
      v34 = OUTLINED_FUNCTION_112(ObjCClassFromMetadata, sel_radioPlaybackIntentFromArtist_);
      OUTLINED_FUNCTION_138();
      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v31, v30);
    }
    else
    {
      v35 = v44;
      v51 = v1;
      v36 = v48;
      if (!OUTLINED_FUNCTION_142())
      {
        v54 = 0;
        v55 = 0xE000000000000000;
        sub_22E242318();
        swift_bridgeObjectRelease();
        v54 = 0xD00000000000001ELL;
        v55 = 0x800000022E2436E0;
        sub_22E24248C();
        sub_22E242198();
        OUTLINED_FUNCTION_28_0();
        OUTLINED_FUNCTION_74_0();
        OUTLINED_FUNCTION_35_0();
        v42 = 158;
        OUTLINED_FUNCTION_10_0();
        OUTLINED_FUNCTION_44_0();
      }
      v38 = v46;
      v37 = v47;
      v39 = (*(uint64_t (**)(uint64_t, char *, uint64_t))(v47 + 32))(v46, v35, v36);
      OUTLINED_FUNCTION_46_0(v39, *MEMORY[0x24BDDF380]);
      OUTLINED_FUNCTION_106();
      OUTLINED_FUNCTION_47_0();
      v40 = (void *)swift_getObjCClassFromMetadata();
      v41 = OUTLINED_FUNCTION_112(v40, sel_radioPlaybackIntentFromSong_);
      OUTLINED_FUNCTION_138();
      (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v38, v36);
      v1 = v51;
    }
  }
  (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v1, v4);
  OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_22E237674@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _BYTE *v16;
  __int128 v17[2];
  uint64_t v18;
  uint64_t v19[7];

  v4 = sub_22E241D48();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E241D3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
  if ((swift_dynamicCast() & 1) != 0)
    return sub_22E232778(v17, a2);
  v18 = 0;
  memset(v17, 0, sizeof(v17));
  sub_22E2327BC((uint64_t)v17, &qword_2540E4940);
  if (qword_255DFBF08 != -1)
    swift_once();
  v9 = sub_22E241EB0();
  __swift_project_value_buffer(v9, (uint64_t)qword_255DFC370);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v10 = sub_22E241E98();
  v11 = sub_22E242294();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v13 = swift_slowAlloc();
    v19[0] = v13;
    *(_DWORD *)v12 = 136315138;
    v19[6] = (uint64_t)(v12 + 4);
    sub_22E2394C8(&qword_255DFBF78, (void (*)(uint64_t))MEMORY[0x24BE695D0]);
    v14 = sub_22E2423FC();
    *(_QWORD *)&v17[0] = sub_22E238D88(v14, v15, v19);
    sub_22E2422DC();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    _os_log_impl(&dword_22E22E000, v10, v11, "Non playable item %s passed to create a playback intent.", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22E329064](v13, -1, -1);
    MEMORY[0x22E329064](v12, -1, -1);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }

  sub_22E23948C();
  swift_allocError();
  *v16 = 3;
  return swift_willThrow();
}

void MPCPlaybackIntent.init(container:startingAt:playbackSource:)()
{
  uint64_t v0;
  uint64_t v1;
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
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21[2];
  uint64_t v22;
  _QWORD v23[6];

  OUTLINED_FUNCTION_9_0();
  v20 = v2;
  v4 = v3;
  v6 = v5;
  v7 = OUTLINED_FUNCTION_65_0();
  OUTLINED_FUNCTION_127();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_92();
  v9 = sub_22E241D9C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_23_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF80);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_120();
  v14 = v13 - v12;
  sub_22E241D3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4928);
  if (!OUTLINED_FUNCTION_16_0())
  {
    v22 = 0;
    memset(v21, 0, sizeof(v21));
    sub_22E2327BC((uint64_t)v21, &qword_2540E4930);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v1, v6, v7);
    OUTLINED_FUNCTION_109();
    sub_22E242318();
    OUTLINED_FUNCTION_29_0();
    sub_22E2394C8(&qword_255DFBF78, (void (*)(uint64_t))MEMORY[0x24BE695D0]);
    sub_22E2423FC();
    OUTLINED_FUNCTION_155();
    OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_146();
    OUTLINED_FUNCTION_102();
    OUTLINED_FUNCTION_35_0();
    goto LABEL_11;
  }
  sub_22E232778(v21, (uint64_t)v23);
  sub_22E23B000(v4, v14, &qword_255DFBF80);
  OUTLINED_FUNCTION_20_0(v14, 1, v7);
  if (v15)
  {
    sub_22E2327BC(v14, &qword_255DFBF80);
    OUTLINED_FUNCTION_19_0();
  }
  else
  {
    sub_22E241D3C();
    OUTLINED_FUNCTION_81_0(v14, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
    OUTLINED_FUNCTION_131();
    v16 = OUTLINED_FUNCTION_16_0();
    if ((v16 & 1) == 0)
      OUTLINED_FUNCTION_13_0();
  }
  __swift_project_boxed_opaque_existential_1(v23, v23[3]);
  sub_22E241D54();
  sub_22E241D84();
  objc_opt_self();
  v17 = OUTLINED_FUNCTION_58_0();
  if (!v17)
  {
    OUTLINED_FUNCTION_68_0();
    OUTLINED_FUNCTION_18_0();
    OUTLINED_FUNCTION_78_0();
LABEL_11:
    OUTLINED_FUNCTION_10_0();
    OUTLINED_FUNCTION_44_0();
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithPlaybackIntent_, v17);
  OUTLINED_FUNCTION_68_0();
  sub_22E2327BC(v20, &qword_2540E4938);
  OUTLINED_FUNCTION_174(v18, &qword_255DFBF80);
  OUTLINED_FUNCTION_81_0(v6, *(uint64_t (**)(uint64_t, uint64_t))(v0 + 8));
  v19 = OUTLINED_FUNCTION_49_0(*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  OUTLINED_FUNCTION_63_0(v19, &qword_2540E4940);
  OUTLINED_FUNCTION_30_0();
  OUTLINED_FUNCTION_0_0();
}

void MPCPlaybackIntent.applyStartTime<A>(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22E237C70(a1, a2, a3, (SEL *)&selRef_startTimeModifications, (SEL *)&selRef_setStartTimeModifications_);
}

void MPCPlaybackIntent.applyEndTime<A>(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_22E237C70(a1, a2, a3, (SEL *)&selRef_endTimeModifications, (SEL *)&selRef_setEndTimeModifications_);
}

void sub_22E237C70(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4, SEL *a5)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v11;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  __int128 v31;
  _QWORD v32[3];
  uint64_t v33;

  v11 = v5;
  v14 = OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_62_0();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_23_0();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_21_0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v7, a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFB8);
  OUTLINED_FUNCTION_131();
  if ((OUTLINED_FUNCTION_16_0() & 1) != 0)
  {
    sub_22E232778(&v31, (uint64_t)v32);
    v18 = v33;
    __swift_project_boxed_opaque_existential_1(v32, v33);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v6, *MEMORY[0x24BDDF3C0], v14);
    v19 = sub_22E23D6EC(v6, v18);
    OUTLINED_FUNCTION_49_0(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    v20 = objc_msgSend(v19, sel__underlyingModelObject);
    v21 = objc_msgSend(v20, sel_identifiers);

    v22 = objc_msgSend(v11, *a4);
    OUTLINED_FUNCTION_160((uint64_t)v22, &qword_2540E4998);
    OUTLINED_FUNCTION_160(v23, &qword_255DFBFC8);
    sub_22E239530();
    v24 = sub_22E242144();

    v25 = v21;
    v26 = sub_22E24227C();
    if ((v24 & 0xC000000000000001) == 0)
    {
LABEL_8:
      swift_isUniquelyReferenced_nonNull_native();
      *(_QWORD *)&v31 = v24;
      sub_22E23AC80(v26, v25);

      swift_bridgeObjectRelease();
      v29 = (void *)sub_22E242138();
      OUTLINED_FUNCTION_121();
      objc_msgSend(v11, *a5, v29);

      __swift_destroy_boxed_opaque_existential_1((uint64_t)v32);
      return;
    }
    if (v24 < 0)
      v27 = v24;
    else
      v27 = v24 & 0xFFFFFFFFFFFFFF8;
    v28 = sub_22E24239C();
    if (!__OFADD__(v28, 1))
    {
      v24 = sub_22E23A754(v27, v28 + 1);
      goto LABEL_8;
    }
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_63_0(v30, &qword_255DFBFC0);
  }
}

id MPCPlaybackIntent.isInGroupSession.getter()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  id v5;

  if (!objc_msgSend(v0, sel_tracklistToken))
    return 0;
  objc_opt_self();
  v1 = (void *)OUTLINED_FUNCTION_168();
  if (!v1)
  {
    OUTLINED_FUNCTION_122();
    return 0;
  }
  v2 = objc_msgSend(v1, sel_request);
  if (v2)
  {
    objc_opt_self();
    v3 = OUTLINED_FUNCTION_58_0();
    if (v3)
    {
      v4 = (void *)v3;
      v5 = v2;
      v2 = objc_msgSend(v4, sel_isInGroupSession);

      goto LABEL_6;
    }
    OUTLINED_FUNCTION_122();

    return 0;
  }
LABEL_6:
  OUTLINED_FUNCTION_122();
  return v2;
}

void MPCPlaybackIntent.isInGroupSession.setter(char a1)
{
  void *v1;
  void *v2;
  void *v4;
  void *v5;
  id v6;

  v2 = v1;
  if (objc_msgSend(v2, sel_tracklistToken))
  {
    objc_opt_self();
    v4 = (void *)OUTLINED_FUNCTION_168();
    if (v4)
    {
      v6 = objc_msgSend(v4, sel_request);
      if (v6)
      {
        objc_opt_self();
        v5 = (void *)swift_dynamicCastObjCClass();
        if (v5)
        {
          objc_msgSend(v5, sel_setInGroupSession_, a1 & 1);
          OUTLINED_FUNCTION_122();

          return;
        }

      }
    }
    swift_unknownObjectRelease();
  }
}

void MPCPlaybackIntent.isInGroupSession.modify(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = MPCPlaybackIntent.isInGroupSession.getter() & 1;
  OUTLINED_FUNCTION_77();
}

void sub_22E2380E0(uint64_t a1)
{
  MPCPlaybackIntent.isInGroupSession.setter(*(_BYTE *)(a1 + 8));
  OUTLINED_FUNCTION_77();
}

uint64_t sub_22E238100(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v2 = sub_22E241DB4();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - v7;
  sub_22E2394C8(&qword_255DFC030, v9);
  v10 = sub_22E242288();
  v18 = v10;
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
  {
    v12 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v13 = *(_QWORD *)(v3 + 72);
    v14 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v14(v6, v12, v2);
      sub_22E239580((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v12 += v13;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease();
    return v18;
  }
  else
  {
    v15 = v10;
    swift_bridgeObjectRelease();
  }
  return v15;
}

uint64_t sub_22E238248(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_22E241DB4();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (sub_22E2394C8(&qword_255DFC030, (void (*)(uint64_t))MEMORY[0x24BE69730]),
        v6 = sub_22E242150(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0))
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v15 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    do
    {
      v11(v5, *(_QWORD *)(a2 + 48) + v10 * v8, v3);
      sub_22E2394C8(&qword_255DFC028, (void (*)(uint64_t))MEMORY[0x24BE69730]);
      v12 = sub_22E24215C();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
      if ((v12 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

double sub_22E2383CC@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;

  if (*(_QWORD *)(a1 + 16))
  {
    sub_22E23B040(a1 + 32, a2);
  }
  else
  {
    *(_QWORD *)(a2 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  return result;
}

uint64_t sub_22E2383F0@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  result = a2(v5, v6);
  *a3 = result;
  a3[1] = v8;
  return result;
}

uint64_t MusicPlayableRequest.playbackIntent()()
{
  uint64_t v0;
  uint64_t v1;
  _OWORD v3[2];
  uint64_t v4;

  v4 = 0;
  memset(v3, 0, sizeof(v3));
  _s16MusicKitInternal0A15PlayableRequestP01_abC18_MediaPlaybackCoreE14playbackIntent16withStartingItemSo011MPCPlaybackJ0CSg0aB00daM0_pSg_tF_0();
  v1 = v0;
  sub_22E2327BC((uint64_t)v3, &qword_2540E4940);
  return v1;
}

void _s16MusicKitInternal0A15PlayableRequestP01_abC18_MediaPlaybackCoreE14playbackIntent16withStartingItemSo011MPCPlaybackJ0CSg0aB00daM0_pSg_tF_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23[2];
  __int128 v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  _QWORD v30[6];

  OUTLINED_FUNCTION_9_0();
  v3 = v2;
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_52_0();
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_111();
  v6 = OUTLINED_FUNCTION_87();
  OUTLINED_FUNCTION_119();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E23B000(v3, (uint64_t)&v27, &qword_2540E4940);
  if (v29)
  {
    OUTLINED_FUNCTION_77_0();
    sub_22E23B040((uint64_t)v30, (uint64_t)&v26);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFB8);
    if (!OUTLINED_FUNCTION_16_0())
    {
      v25 = 0;
      memset(v24, 0, sizeof(v24));
      sub_22E2327BC((uint64_t)v24, &qword_255DFBFC0);
      v27 = 0;
      v28 = 0xE000000000000000;
      sub_22E242318();
      OUTLINED_FUNCTION_29_0();
      OUTLINED_FUNCTION_163();
      sub_22E242378();
      OUTLINED_FUNCTION_74_0();
      OUTLINED_FUNCTION_35_0();
      v22 = 351;
LABEL_22:
      v23[0] = v22;
      OUTLINED_FUNCTION_10_0();
      OUTLINED_FUNCTION_44_0();
    }
    sub_22E232778(v24, (uint64_t)&v27);
    v11 = v29;
    __swift_project_boxed_opaque_existential_1(&v27, v29);
    (*(void (**)(char *, _QWORD, uint64_t))(v0 + 104))(v9, *MEMORY[0x24BDDF388], v6);
    v12 = sub_22E23D6EC((uint64_t)v9, v11);
    (*(void (**)(char *, uint64_t))(v0 + 8))(v9, v6);
    OUTLINED_FUNCTION_30_0();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)&v27);
  }
  else
  {
    OUTLINED_FUNCTION_63_0(v10, &qword_2540E4940);
    v12 = 0;
  }
  OUTLINED_FUNCTION_80_0(v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4990);
  OUTLINED_FUNCTION_131();
  if (!OUTLINED_FUNCTION_16_0())
  {
LABEL_19:
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_63_0(v21, &qword_255DFBFF0);
    OUTLINED_FUNCTION_80_0(v23[0]);
    OUTLINED_FUNCTION_109();
    sub_22E242318();
    sub_22E242414();
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_35_0();
    v22 = 357;
    goto LABEL_22;
  }
  OUTLINED_FUNCTION_77_0();
  __swift_project_boxed_opaque_existential_1(v30, v30[3]);
  sub_22E2420A8();
  objc_opt_self();
  v13 = (void *)OUTLINED_FUNCTION_58_0();
  if (!v13)
  {
    OUTLINED_FUNCTION_68_0();
    OUTLINED_FUNCTION_80_0(v23[1]);
    v27 = 0;
    v28 = 0xE000000000000000;
    sub_22E242318();
    OUTLINED_FUNCTION_146();
    OUTLINED_FUNCTION_102();
    sub_22E242414();
    OUTLINED_FUNCTION_29_0();
    OUTLINED_FUNCTION_35_0();
    v22 = 361;
    goto LABEL_22;
  }
  v14 = v13;
  v15 = objc_msgSend(v13, sel_allowedItemIdentifiers);
  if (v15)
  {
    v16 = v15;
    OUTLINED_FUNCTION_160((uint64_t)v15, &qword_2540E4998);
    v17 = sub_22E24224C();

    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      v18 = sub_22E2423CC();
      OUTLINED_FUNCTION_28_0();
    }
    else
    {
      v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    OUTLINED_FUNCTION_28_0();
    if (v18 >= 2)
    {
      objc_msgSend(v14, sel_setItemSortDescriptors_, 0);
      objc_msgSend(v14, sel_setSortUsingAllowedItemIdentifiers_, 1);
    }
  }
  if (!v12)
  {
    v20 = 0;
    goto LABEL_16;
  }
  if ((objc_msgSend(v12, sel_respondsToSelector_, sel__underlyingModelObject) & 1) == 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  v19 = objc_msgSend(v12, sel__underlyingModelObject);
  v20 = objc_msgSend(v19, sel_identifiers);

LABEL_16:
  objc_msgSend(v14, sel_playbackIntentWithStartItemIdentifiers_, v20);

  OUTLINED_FUNCTION_68_0();
  OUTLINED_FUNCTION_30_0();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_0_0();
}

void MusicPlayableRequest.playbackIntent(withStartingItem:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char v14;
  char v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27[11];

  OUTLINED_FUNCTION_9_0();
  v2 = v1;
  v3 = OUTLINED_FUNCTION_65_0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v24 - v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF80);
  OUTLINED_FUNCTION_2_0();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_90();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v24 - v12;
  sub_22E23B000(v2, (uint64_t)v24 - v12, &qword_255DFBF80);
  OUTLINED_FUNCTION_20_0((uint64_t)v13, 1, v3);
  if (v14)
  {
    sub_22E2327BC((uint64_t)v13, &qword_255DFBF80);
    OUTLINED_FUNCTION_100();
  }
  else
  {
    sub_22E241D3C();
    OUTLINED_FUNCTION_143((uint64_t)v13, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
    v15 = OUTLINED_FUNCTION_16_0();
    if ((v15 & 1) == 0)
      OUTLINED_FUNCTION_37_0();
  }
  sub_22E23B000(v2, v0, &qword_255DFBF80);
  OUTLINED_FUNCTION_20_0(v0, 1, v3);
  if (v14)
  {
    sub_22E2327BC(v0, &qword_255DFBF80);
  }
  else
  {
    OUTLINED_FUNCTION_128((uint64_t)v9, v0, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 32));
    if (v27[8])
    {
      OUTLINED_FUNCTION_143((uint64_t)v9, *(uint64_t (**)(uint64_t, uint64_t))(v4 + 8));
    }
    else
    {
      if (qword_255DFBF08 != -1)
        swift_once();
      v16 = OUTLINED_FUNCTION_158();
      __swift_project_value_buffer(v16, (uint64_t)qword_255DFC370);
      OUTLINED_FUNCTION_128((uint64_t)v7, (uint64_t)v9, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
      v17 = sub_22E241E98();
      v18 = sub_22E2422A0();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = (uint8_t *)OUTLINED_FUNCTION_3();
        v26 = OUTLINED_FUNCTION_3();
        v27[0] = v26;
        v25 = v19;
        *(_DWORD *)v19 = 136315138;
        v24[1] = v19 + 4;
        sub_22E2394C8(&qword_255DFBF78, (void (*)(uint64_t))MEMORY[0x24BE695D0]);
        v20 = sub_22E2423FC();
        v22 = sub_22E238D88(v20, v21, v27);
        OUTLINED_FUNCTION_64_0(v22);
        sub_22E2422DC();
        OUTLINED_FUNCTION_121();
        OUTLINED_FUNCTION_75_0((uint64_t)v7);
        _os_log_impl(&dword_22E22E000, v17, v18, "Ignoring start item for non-playable item %s for new playback intent.", v25, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_75_0((uint64_t)v7);
      OUTLINED_FUNCTION_75_0((uint64_t)v9);
    }
  }
  _s16MusicKitInternal0A15PlayableRequestP01_abC18_MediaPlaybackCoreE14playbackIntent16withStartingItemSo011MPCPlaybackJ0CSg0aB00daM0_pSg_tF_0();
  OUTLINED_FUNCTION_66_0(v23, &qword_2540E4940);
  OUTLINED_FUNCTION_165();
  OUTLINED_FUNCTION_0_0();
}

BOOL static MusicPlaybackError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

void MusicPlaybackError.hash(into:)()
{
  sub_22E242474();
  OUTLINED_FUNCTION_77();
}

void *static MusicPlaybackError.allCases.getter()
{
  return &unk_24FA1A7F8;
}

uint64_t MusicPlaybackError.hashValue.getter()
{
  sub_22E242468();
  sub_22E242474();
  return sub_22E242480();
}

void sub_22E238D2C(_QWORD *a1@<X8>)
{
  *a1 = &unk_24FA1A7F8;
}

uint64_t sub_22E238D48()
{
  sub_22E242468();
  sub_22E242474();
  return sub_22E242480();
}

uint64_t sub_22E238D88(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_22E238E58(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_22E23B1E0((uint64_t)v12, *a3);
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
      sub_22E23B1E0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_22E238E58(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_22E238FAC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_22E2422E8();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_22E239070(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_22E242330();
    if (!v8)
    {
      result = sub_22E2423B4();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_22E238FAC(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_22E2423F0();
  __break(1u);
  return result;
}

uint64_t sub_22E239070(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_22E239104(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_22E239274(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_22E239274((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22E239104(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_22E2421A4();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_22E23EE68(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_22E242324();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_22E2423F0();
  __break(1u);
LABEL_14:
  result = sub_22E2423B4();
  __break(1u);
  return result;
}

char *sub_22E239274(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC018);
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
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_22E23940C(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_22E239348(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_22E239348(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_22E2423F0();
  __break(1u);
  return result;
}

char *sub_22E23940C(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_22E2423F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_22E23948C()
{
  unint64_t result;

  result = qword_255DFBFA8;
  if (!qword_255DFBFA8)
  {
    result = MEMORY[0x22E328FF8](&protocol conformance descriptor for MusicPlaybackError, &type metadata for MusicPlaybackError);
    atomic_store(result, (unint64_t *)&qword_255DFBFA8);
  }
  return result;
}

void sub_22E2394C8(_QWORD *a1, void (*a2)(uint64_t))
{
  if (!*a1)
  {
    a2(255);
    OUTLINED_FUNCTION_169();
  }
  OUTLINED_FUNCTION_77();
}

void sub_22E2394FC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    objc_opt_self();
    atomic_store(swift_getObjCClassMetadata(), a2);
  }
  OUTLINED_FUNCTION_77();
}

unint64_t sub_22E239530()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DFBFD0;
  if (!qword_255DFBFD0)
  {
    sub_22E2394FC(255, &qword_2540E4998);
    result = MEMORY[0x22E328FF8](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_255DFBFD0);
  }
  return result;
}

uint64_t sub_22E239580(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  char *v25;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;

  v3 = v2;
  v6 = sub_22E241DB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_22E2394C8(&qword_255DFC030, v11);
  swift_bridgeObjectRetain();
  v31 = a2;
  v12 = sub_22E242150();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  v15 = v10;
  v16 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v27 = v3;
    v28 = a1;
    v29 = ~v13;
    v30 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v19 = v15;
      v20 = v18;
      v18(v9, *(_QWORD *)(v15 + 48) + v17 * v14, v6);
      sub_22E2394C8(&qword_255DFC028, (void (*)(uint64_t))MEMORY[0x24BE69730]);
      v21 = sub_22E24215C();
      v22 = *(void (**)(char *, uint64_t))(v30 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v14 = (v14 + 1) & v29;
      v15 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v16 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v27;
        a1 = v28;
        v23 = v30;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v31, v6);
    v20(v28, *(_QWORD *)(*v27 + 48) + v17 * v14, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    v23 = v7;
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v25 = v31;
    v18(v9, v31, v6);
    v32 = *v3;
    *v3 = 0x8000000000000000;
    sub_22E23A550((uint64_t)v9, v14, isUniquelyReferenced_nonNull_native);
    *v3 = v32;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a1, v25, v6);
    return 1;
  }
}

uint64_t sub_22E2397DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t *v20;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = v2;
  v6 = sub_22E241DB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v3;
  sub_22E2394C8(&qword_255DFC030, v11);
  swift_bridgeObjectRetain();
  v29 = a1;
  v12 = sub_22E242150();
  v13 = -1 << *(_BYTE *)(v10 + 32);
  v14 = v12 & ~v13;
  if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) != 0)
  {
    v26 = v3;
    v27 = a2;
    v15 = ~v13;
    v16 = *(_QWORD *)(v7 + 72);
    v28 = v7;
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    while (1)
    {
      v17(v9, *(_QWORD *)(v10 + 48) + v16 * v14, v6);
      sub_22E2394C8(&qword_255DFC028, (void (*)(uint64_t))MEMORY[0x24BE69730]);
      v18 = sub_22E24215C();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        break;
      v14 = (v14 + 1) & v15;
      if (((*(_QWORD *)(v10 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFF8)) >> v14) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v19 = 1;
        a2 = v27;
        return __swift_storeEnumTagSinglePayload(a2, v19, 1, v6);
      }
    }
    swift_bridgeObjectRelease();
    v20 = v26;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v20;
    v30 = *v20;
    *v20 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_22E239A0C();
      v22 = v30;
    }
    v23 = *(_QWORD *)(v22 + 48) + v16 * v14;
    a2 = v27;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v28 + 32))(v27, v23, v6);
    sub_22E23A2C0(v14);
    *v20 = v30;
    swift_bridgeObjectRelease();
    v19 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v19 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v19, 1, v6);
}

void *sub_22E239A0C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *result;
  uint64_t v10;
  unint64_t v11;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t i;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t *v26;

  v1 = v0;
  v2 = sub_22E241DB4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC038);
  v6 = *v0;
  v7 = sub_22E242300();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v26 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = *(_QWORD *)(v6 + 56);
  v16 = -1;
  if (v14 < 64)
    v16 = ~(-1 << v14);
  v17 = v16 & v15;
  v18 = (unint64_t)(v14 + 63) >> 6;
  if ((v16 & v15) == 0)
    goto LABEL_12;
LABEL_11:
  v19 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  for (i = v19 | (v13 << 6); ; i = __clz(__rbit64(v22)) + (v13 << 6))
  {
    v24 = *(_QWORD *)(v3 + 72) * i;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v24, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v24, v5, v2);
    if (v17)
      goto LABEL_11;
LABEL_12:
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v18)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v18)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v18)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_25:
    v17 = (v22 - 1) & v22;
  }
  v23 = v21 + 3;
  if (v23 >= v18)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v26;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v18)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_22E239C34()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t result;
  int64_t v15;
  unint64_t v16;
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;

  v1 = v0;
  v2 = sub_22E241DB4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC038);
  v7 = sub_22E24230C();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_34:
    *v1 = v8;
    return result;
  }
  v9 = 1 << *(_BYTE *)(v6 + 32);
  v10 = *(_QWORD *)(v6 + 56);
  v31 = v0;
  v32 = v6 + 56;
  if (v9 < 64)
    v11 = ~(-1 << v9);
  else
    v11 = -1;
  v12 = v11 & v10;
  v33 = (unint64_t)(v9 + 63) >> 6;
  v13 = v7 + 56;
  result = swift_retain();
  v15 = 0;
  if (!v12)
    goto LABEL_7;
LABEL_6:
  v16 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (i = v16 | (v15 << 6); ; i = __clz(__rbit64(v19)) + (v15 << 6))
  {
    v21 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v21 * i, v2);
    sub_22E2394C8(&qword_255DFC030, (void (*)(uint64_t))MEMORY[0x24BE69730]);
    result = sub_22E242150();
    v22 = -1 << *(_BYTE *)(v8 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6))) == 0)
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v22) >> 6;
      while (++v24 != v27 || (v26 & 1) == 0)
      {
        v28 = v24 == v27;
        if (v24 == v27)
          v24 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v24);
        if (v29 != -1)
        {
          v25 = __clz(__rbit64(~v29)) + (v24 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    v25 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v13 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(_QWORD *)(v13 + ((v25 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v25;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v25 * v21, v5, v2);
    ++*(_QWORD *)(v8 + 16);
    if (v12)
      goto LABEL_6;
LABEL_7:
    v18 = v15 + 1;
    if (__OFADD__(v15, 1))
      goto LABEL_36;
    if (v18 >= v33)
      goto LABEL_32;
    v19 = *(_QWORD *)(v32 + 8 * v18);
    ++v15;
    if (!v19)
    {
      v15 = v18 + 1;
      if (v18 + 1 >= v33)
        goto LABEL_32;
      v19 = *(_QWORD *)(v32 + 8 * v15);
      if (!v19)
      {
        v15 = v18 + 2;
        if (v18 + 2 >= v33)
          goto LABEL_32;
        v19 = *(_QWORD *)(v32 + 8 * v15);
        if (!v19)
          break;
      }
    }
LABEL_20:
    v12 = (v19 - 1) & v19;
  }
  v20 = v18 + 3;
  if (v20 >= v33)
  {
LABEL_32:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_34;
  }
  v19 = *(_QWORD *)(v32 + 8 * v20);
  if (v19)
  {
    v15 = v20;
    goto LABEL_20;
  }
  while (1)
  {
    v15 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v15 >= v33)
      goto LABEL_32;
    v19 = *(_QWORD *)(v32 + 8 * v15);
    ++v20;
    if (v19)
      goto LABEL_20;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_22E239F58()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, unint64_t, uint64_t);
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  _QWORD *v35;
  uint64_t v36;

  v1 = v0;
  v2 = sub_22E241DB4();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC038);
  v6 = sub_22E24230C();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v9 = *(_QWORD *)(v5 + 56);
    v35 = (_QWORD *)(v5 + 56);
    if (v8 < 64)
      v10 = ~(-1 << v8);
    else
      v10 = -1;
    v11 = v10 & v9;
    v33 = v0;
    v34 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 56;
    result = swift_retain();
    v14 = 0;
    if (!v11)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v18)) + (v14 << 6))
    {
      v20 = v5;
      v21 = *(_QWORD *)(v5 + 48);
      v22 = *(_QWORD *)(v36 + 72);
      v23 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v23(v4, v21 + v22 * i, v2);
      sub_22E2394C8(&qword_255DFC030, (void (*)(uint64_t))MEMORY[0x24BE69730]);
      result = sub_22E242150();
      v24 = -1 << *(_BYTE *)(v7 + 32);
      v25 = result & ~v24;
      v26 = v25 >> 6;
      if (((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6))) == 0)
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v24) >> 6;
        while (++v26 != v29 || (v28 & 1) == 0)
        {
          v30 = v26 == v29;
          if (v26 == v29)
            v26 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v26);
          if (v31 != -1)
          {
            v27 = __clz(__rbit64(~v31)) + (v26 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      v27 = __clz(__rbit64((-1 << v25) & ~*(_QWORD *)(v12 + 8 * (v25 >> 6)))) | v25 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v12 + ((v27 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v27;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v23)(*(_QWORD *)(v7 + 48) + v27 * v22, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v20;
      if (v11)
        goto LABEL_6;
LABEL_7:
      v17 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_38;
      if (v17 >= v34)
        goto LABEL_32;
      v18 = v35[v17];
      ++v14;
      if (!v18)
      {
        v14 = v17 + 1;
        if (v17 + 1 >= v34)
          goto LABEL_32;
        v18 = v35[v14];
        if (!v18)
        {
          v14 = v17 + 2;
          if (v17 + 2 >= v34)
            goto LABEL_32;
          v18 = v35[v14];
          if (!v18)
          {
            v19 = v17 + 3;
            if (v19 >= v34)
            {
LABEL_32:
              swift_release();
              v1 = v33;
              v32 = 1 << *(_BYTE *)(v5 + 32);
              if (v32 > 63)
                sub_22E23A534(0, (unint64_t)(v32 + 63) >> 6, v35);
              else
                *v35 = -1 << v32;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v18 = v35[v19];
            if (!v18)
            {
              while (1)
              {
                v14 = v19 + 1;
                if (__OFADD__(v19, 1))
                  goto LABEL_39;
                if (v14 >= v34)
                  goto LABEL_32;
                v18 = v35[v14];
                ++v19;
                if (v18)
                  goto LABEL_20;
              }
            }
            v14 = v19;
          }
        }
      }
LABEL_20:
      v11 = (v18 - 1) & v18;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_22E23A2C0(int64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v20;
  int64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  void (*v30)(char *, unint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;

  v3 = sub_22E241DB4();
  v32 = *(_QWORD *)(v3 - 8);
  result = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = *v1 + 56;
  v9 = -1 << *(_BYTE *)(*v1 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    v29 = v1;
    v11 = ~v9;
    swift_retain();
    v12 = sub_22E2422F4();
    v31 = v8;
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v13 = (v12 + 1) & v11;
      v14 = *(_QWORD *)(v32 + 72);
      v30 = *(void (**)(char *, unint64_t, uint64_t))(v32 + 16);
      while (1)
      {
        v15 = v14 * v10;
        v30(v6, *(_QWORD *)(v7 + 48) + v14 * v10, v3);
        sub_22E2394C8(&qword_255DFC030, (void (*)(uint64_t))MEMORY[0x24BE69730]);
        v16 = sub_22E242150();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v6, v3);
        v17 = v16 & v11;
        if (a1 >= (uint64_t)v13)
        {
          if (v17 < v13 || a1 < (uint64_t)v17)
            goto LABEL_24;
        }
        else if (v17 < v13 && a1 < (uint64_t)v17)
        {
          goto LABEL_24;
        }
        v20 = *(_QWORD *)(v7 + 48);
        v21 = v14 * a1;
        v22 = v20 + v14 * a1;
        v23 = v20 + v15 + v14;
        if (v14 * a1 < v15 || v22 >= v23)
          break;
        a1 = v10;
        if (v21 != v15)
        {
          swift_arrayInitWithTakeBackToFront();
          goto LABEL_23;
        }
LABEL_24:
        v10 = (v10 + 1) & v11;
        if (((*(_QWORD *)(v31 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
          goto LABEL_25;
      }
      swift_arrayInitWithTakeFrontToBack();
LABEL_23:
      a1 = v10;
      goto LABEL_24;
    }
LABEL_25:
    *(_QWORD *)(v31 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    result = swift_release();
    v1 = v29;
  }
  else
  {
    *(_QWORD *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  v25 = *v1;
  v26 = *(_QWORD *)(*v1 + 16);
  v27 = __OFSUB__(v26, 1);
  v28 = v26 - 1;
  if (v27)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v25 + 16) = v28;
    ++*(_DWORD *)(v25 + 36);
  }
  return result;
}

uint64_t sub_22E23A534(uint64_t result, uint64_t a2, _QWORD *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_22E23A550(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, unint64_t, uint64_t);
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;

  v26 = a1;
  v6 = sub_22E241DB4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_22E239F58();
  }
  else
  {
    if (v11 > v10)
    {
      sub_22E239A0C();
      goto LABEL_12;
    }
    sub_22E239C34();
  }
  v12 = *v3;
  sub_22E2394C8(&qword_255DFC030, (void (*)(uint64_t))MEMORY[0x24BE69730]);
  v13 = sub_22E242150();
  v14 = -1 << *(_BYTE *)(v12 + 32);
  a2 = v13 & ~v14;
  if (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    v15 = ~v14;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    do
    {
      v17(v9, *(_QWORD *)(v12 + 48) + v16 * a2, v6);
      sub_22E2394C8(&qword_255DFC028, (void (*)(uint64_t))MEMORY[0x24BE69730]);
      v18 = sub_22E24215C();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      if ((v18 & 1) != 0)
        goto LABEL_15;
      a2 = (a2 + 1) & v15;
    }
    while (((*(_QWORD *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  v19 = v26;
  v20 = *v25;
  *(_QWORD *)(*v25 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v7 + 32))(*(_QWORD *)(v20 + 48) + *(_QWORD *)(v7 + 72) * a2, v19, v6);
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (!v23)
  {
    *(_QWORD *)(v20 + 16) = v24;
    return result;
  }
  __break(1u);
LABEL_15:
  result = sub_22E242420();
  __break(1u);
  return result;
}

uint64_t sub_22E23A754(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (!a2)
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC000);
  v2 = sub_22E2423E4();
  v17 = v2;
  sub_22E242390();
  v3 = sub_22E2423A8();
  if (!v3)
  {
LABEL_16:
    swift_release();
    return v2;
  }
  v4 = v3;
  sub_22E2394FC(0, &qword_2540E4998);
  while (1)
  {
    swift_dynamicCast();
    sub_22E2394FC(0, &qword_255DFBFC8);
    swift_dynamicCast();
    v2 = v17;
    v5 = *(_QWORD *)(v17 + 16);
    if (*(_QWORD *)(v17 + 24) <= v5)
    {
      sub_22E23A9C0(v5 + 1, 1);
      v2 = v17;
    }
    result = sub_22E2422AC();
    v7 = v2 + 64;
    v8 = -1 << *(_BYTE *)(v2 + 32);
    v9 = result & ~v8;
    v10 = v9 >> 6;
    if (((-1 << v9) & ~*(_QWORD *)(v2 + 64 + 8 * (v9 >> 6))) == 0)
      break;
    v11 = __clz(__rbit64((-1 << v9) & ~*(_QWORD *)(v2 + 64 + 8 * (v9 >> 6)))) | v9 & 0x7FFFFFFFFFFFFFC0;
LABEL_15:
    *(_QWORD *)(v7 + ((v11 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v11;
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v11) = v16;
    *(_QWORD *)(*(_QWORD *)(v2 + 56) + 8 * v11) = v4;
    ++*(_QWORD *)(v2 + 16);
    v4 = sub_22E2423A8();
    if (!v4)
      goto LABEL_16;
  }
  v12 = 0;
  v13 = (unint64_t)(63 - v8) >> 6;
  while (++v10 != v13 || (v12 & 1) == 0)
  {
    v14 = v10 == v13;
    if (v10 == v13)
      v10 = 0;
    v12 |= v14;
    v15 = *(_QWORD *)(v7 + 8 * v10);
    if (v15 != -1)
    {
      v11 = __clz(__rbit64(~v15)) + (v10 << 6);
      goto LABEL_15;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_22E23A990(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_22E2422AC();
  return sub_22E23B0C8(a1, v2);
}

uint64_t sub_22E23A9C0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  unint64_t v15;
  unint64_t i;
  int64_t v17;
  _QWORD *v18;
  unint64_t v19;
  int64_t v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC000);
  v6 = sub_22E2423D8();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = v2;
    v35 = v5 + 64;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v11 = (unint64_t)(v8 + 63) >> 6;
    v12 = v6 + 64;
    result = swift_retain();
    v14 = 0;
    if (!v10)
      goto LABEL_7;
LABEL_6:
    v15 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    for (i = v15 | (v14 << 6); ; i = __clz(__rbit64(v19)) + (v14 << 6))
    {
      v21 = *(void **)(*(_QWORD *)(v5 + 48) + 8 * i);
      v22 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * i);
      if ((a2 & 1) == 0)
      {
        v23 = v21;
        v24 = v22;
      }
      result = sub_22E2422AC();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) == 0)
      {
        v29 = 0;
        v30 = (unint64_t)(63 - v25) >> 6;
        while (++v27 != v30 || (v29 & 1) == 0)
        {
          v31 = v27 == v30;
          if (v27 == v30)
            v27 = 0;
          v29 |= v31;
          v32 = *(_QWORD *)(v12 + 8 * v27);
          if (v32 != -1)
          {
            v28 = __clz(__rbit64(~v32)) + (v27 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        return result;
      }
      v28 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(_QWORD *)(v12 + ((v28 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v28;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v28) = v21;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v28) = v22;
      ++*(_QWORD *)(v7 + 16);
      if (v10)
        goto LABEL_6;
LABEL_7:
      v17 = v14 + 1;
      if (__OFADD__(v14, 1))
        goto LABEL_41;
      if (v17 >= v11)
        break;
      v18 = (_QWORD *)(v5 + 64);
      v19 = *(_QWORD *)(v35 + 8 * v17);
      ++v14;
      if (!v19)
      {
        v14 = v17 + 1;
        if (v17 + 1 >= v11)
          goto LABEL_32;
        v19 = *(_QWORD *)(v35 + 8 * v14);
        if (!v19)
        {
          v20 = v17 + 2;
          if (v20 >= v11)
          {
LABEL_32:
            swift_release();
            v3 = v34;
            if ((a2 & 1) == 0)
              goto LABEL_39;
            goto LABEL_35;
          }
          v19 = *(_QWORD *)(v35 + 8 * v20);
          if (!v19)
          {
            while (1)
            {
              v14 = v20 + 1;
              if (__OFADD__(v20, 1))
                goto LABEL_42;
              if (v14 >= v11)
                goto LABEL_32;
              v19 = *(_QWORD *)(v35 + 8 * v14);
              ++v20;
              if (v19)
                goto LABEL_18;
            }
          }
          v14 = v20;
        }
      }
LABEL_18:
      v10 = (v19 - 1) & v19;
    }
    swift_release();
    v3 = v34;
    v18 = (_QWORD *)(v5 + 64);
    if ((a2 & 1) == 0)
      goto LABEL_39;
LABEL_35:
    v33 = 1 << *(_BYTE *)(v5 + 32);
    if (v33 >= 64)
      sub_22E23A534(0, (unint64_t)(v33 + 63) >> 6, v18);
    else
      *v18 = -1 << v33;
    *(_QWORD *)(v5 + 16) = 0;
  }
LABEL_39:
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_22E23AC80(uint64_t a1, void *a2)
{
  _QWORD *v2;
  _QWORD **v3;
  _QWORD *v5;
  unint64_t v6;
  char v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  char v11;
  _QWORD *v12;
  uint64_t v13;
  id v14;

  v3 = (_QWORD **)v2;
  v5 = (_QWORD *)*v2;
  v6 = sub_22E23A990((uint64_t)a2);
  if (__OFADD__(v5[2], (v7 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v8 = v6;
  v9 = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFF8);
  if ((sub_22E242384() & 1) == 0)
    goto LABEL_5;
  v10 = sub_22E23A990((uint64_t)a2);
  if ((v9 & 1) != (v11 & 1))
  {
LABEL_9:
    sub_22E2394FC(0, &qword_2540E4998);
    sub_22E24242C();
    __break(1u);
    return;
  }
  v8 = v10;
LABEL_5:
  v12 = *v3;
  if ((v9 & 1) != 0)
  {
    v13 = v12[7];

    *(_QWORD *)(v13 + 8 * v8) = a1;
  }
  else
  {
    sub_22E23B084(v8, (uint64_t)a2, a1, v12);
    v14 = a2;
  }
}

void sub_22E23AD94()
{
  sub_22E23B2AC(&qword_255DFBFD8, &qword_255DFBFE0);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22E328FEC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_22E23AE08()
{
  unint64_t result;

  result = qword_255DFBFE8;
  if (!qword_255DFBFE8)
  {
    result = MEMORY[0x22E328FF8](&protocol conformance descriptor for MusicPlaybackError, &type metadata for MusicPlaybackError);
    atomic_store(result, (unint64_t *)&qword_255DFBFE8);
  }
  return result;
}

void sub_22E23AE44(_BYTE *a1@<X8>)
{
  *a1 = MPCPlaybackIntent.isInGroupSession.getter() & 1;
  OUTLINED_FUNCTION_77();
}

void sub_22E23AE6C(char *a1)
{
  MPCPlaybackIntent.isInGroupSession.setter(*a1);
  OUTLINED_FUNCTION_77();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MusicPlaybackError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicPlaybackError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_22E23AF70 + 4 * byte_22E2429D5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_22E23AFA4 + 4 * byte_22E2429D0[v4]))();
}

uint64_t sub_22E23AFA4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_22E23AFAC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x22E23AFB4);
  return result;
}

uint64_t sub_22E23AFC0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x22E23AFC8);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_22E23AFCC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22E23AFD4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_22E23AFE0(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_22E23AFE8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MusicPlaybackError()
{
  return &type metadata for MusicPlaybackError;
}

void sub_22E23B000(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_77();
}

uint64_t sub_22E23B040(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_22E23B084(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

unint64_t sub_22E23B0C8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_22E2394FC(0, &qword_2540E4998);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_22E2422B8();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_22E2422B8();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_22E23B1E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22E23B220@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22E2383F0(a1, MEMORY[0x24BE6A450], a2);
}

uint64_t sub_22E23B23C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22E2383F0(a1, MEMORY[0x24BE6A438], a2);
}

uint64_t sub_22E23B258@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22E2383F0(a1, MEMORY[0x24BE6A420], a2);
}

uint64_t sub_22E23B274@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22E2383F0(a1, MEMORY[0x24BE69608], a2);
}

uint64_t sub_22E23B290@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_22E2383F0(a1, MEMORY[0x24BDDF198], a2);
}

void sub_22E23B2AC(_QWORD *a1, uint64_t *a2)
{
  if (!*a1)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    OUTLINED_FUNCTION_169();
  }
  OUTLINED_FUNCTION_77();
}

void sub_22E23B2E0(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)sub_22E242240();
  swift_bridgeObjectRelease();
  objc_msgSend(a2, sel_setStoreIDs_, v3);

}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return sub_22E24215C();
}

void OUTLINED_FUNCTION_4_0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_5_0()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_8_0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return sub_22E2423C0();
}

uint64_t OUTLINED_FUNCTION_11_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_dynamicCast();
}

double OUTLINED_FUNCTION_13_0()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 - 144) = 0;
  result = 0.0;
  *(_OWORD *)(v0 - 176) = 0u;
  *(_OWORD *)(v0 - 160) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_dynamicCast();
}

void OUTLINED_FUNCTION_17_0()
{
  void *v0;

}

double OUTLINED_FUNCTION_19_0()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 - 176) = 0u;
  *(_OWORD *)(v0 - 160) = 0u;
  *(_QWORD *)(v0 - 144) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_20_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

void OUTLINED_FUNCTION_22_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 320) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_25_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

void OUTLINED_FUNCTION_27_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_29_0()
{
  return sub_22E242198();
}

uint64_t OUTLINED_FUNCTION_30_0()
{
  uint64_t v0;

  return __swift_destroy_boxed_opaque_existential_1(v0 - 128);
}

uint64_t OUTLINED_FUNCTION_31_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t *OUTLINED_FUNCTION_33_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 96) = a1;
  return __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v1 - 128));
}

uint64_t OUTLINED_FUNCTION_34_0()
{
  return sub_22E242030();
}

_QWORD *OUTLINED_FUNCTION_36_0()
{
  uint64_t v0;

  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 - 128), *(_QWORD *)(v0 - 104));
}

double OUTLINED_FUNCTION_37_0()
{
  uint64_t v0;
  double result;

  *(_QWORD *)(v0 - 96) = 0;
  result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_38_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return 0;
}

uint64_t OUTLINED_FUNCTION_42_0()
{
  return sub_22E242048();
}

uint64_t OUTLINED_FUNCTION_43_0()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_44_0()
{
  __break(1u);
}

uint64_t OUTLINED_FUNCTION_45_0()
{
  return sub_22E2423C0();
}

uint64_t OUTLINED_FUNCTION_46_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 104))(v3, a2, v4);
}

uint64_t OUTLINED_FUNCTION_47_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v1, v2);
}

uint64_t OUTLINED_FUNCTION_48_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_49_0@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_50_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_51_0()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_53_0()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_54_0()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_55_0()
{
  return sub_22E242054();
}

uint64_t OUTLINED_FUNCTION_56_0()
{
  return swift_getObjCClassFromMetadata();
}

void OUTLINED_FUNCTION_57_0(uint64_t a1@<X0>, uint64_t *a2@<X2>, uint64_t a3@<X8>)
{
  sub_22E23B000(a1, *(_QWORD *)(a3 - 256), a2);
}

uint64_t OUTLINED_FUNCTION_58_0()
{
  return swift_dynamicCastObjCClass();
}

uint64_t OUTLINED_FUNCTION_59_0()
{
  return sub_22E242210();
}

uint64_t OUTLINED_FUNCTION_60_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 280) + 8))(v0, v1);
}

id OUTLINED_FUNCTION_61_0()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_63_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22E2327BC(v2 - 176, a2);
}

uint64_t OUTLINED_FUNCTION_64_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 176) = a1;
  return v1 - 176;
}

uint64_t OUTLINED_FUNCTION_65_0()
{
  return sub_22E241D48();
}

void OUTLINED_FUNCTION_66_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22E2327BC(v2 - 128, a2);
}

uint64_t OUTLINED_FUNCTION_68_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_69_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_22E2397DC(v0, *(_QWORD *)(v1 - 264));
}

uint64_t OUTLINED_FUNCTION_71_0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

void OUTLINED_FUNCTION_72_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22E2327BC(*(_QWORD *)(v2 - 280), a2);
}

uint64_t OUTLINED_FUNCTION_73_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_74_0()
{
  return sub_22E242198();
}

uint64_t OUTLINED_FUNCTION_75_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

_QWORD *OUTLINED_FUNCTION_76_0()
{
  uint64_t v0;

  sub_22E232778((__int128 *)(v0 - 176), v0 - 128);
  return __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 - 128), *(_QWORD *)(v0 - 104));
}

uint64_t OUTLINED_FUNCTION_77_0()
{
  uint64_t v0;

  return sub_22E232778((__int128 *)(v0 - 176), v0 - 128);
}

uint64_t OUTLINED_FUNCTION_79_0()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 - 128), *(_QWORD *)(v0 - 104));
  return sub_22E241DB4();
}

uint64_t OUTLINED_FUNCTION_80_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

uint64_t OUTLINED_FUNCTION_81_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_82_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

uint64_t OUTLINED_FUNCTION_83_0()
{
  return sub_22E24221C();
}

uint64_t OUTLINED_FUNCTION_84_0()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_85_0@<X0>(_BYTE *a1@<X1>, char a2@<W8>)
{
  *a1 = a2;
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_87()
{
  return sub_22E2420C0();
}

void OUTLINED_FUNCTION_91(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 248) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_92()
{
  return 0;
}

void OUTLINED_FUNCTION_93(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22E2327BC(v2, a2);
}

uint64_t OUTLINED_FUNCTION_95()
{
  return sub_22E24203C();
}

void OUTLINED_FUNCTION_96(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22E2327BC(*(_QWORD *)(v2 - 72), a2);
}

uint64_t OUTLINED_FUNCTION_97(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

double OUTLINED_FUNCTION_100()
{
  uint64_t v0;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 - 128) = 0u;
  *(_OWORD *)(v0 - 112) = 0u;
  *(_QWORD *)(v0 - 96) = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_101()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_102()
{
  return sub_22E242198();
}

uint64_t OUTLINED_FUNCTION_103@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

id OUTLINED_FUNCTION_104(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_106()
{
  return sub_22E241E80();
}

void OUTLINED_FUNCTION_107(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22E2327BC(v2, a2);
}

void OUTLINED_FUNCTION_109()
{
  uint64_t v0;

  *(_QWORD *)(v0 - 128) = 0;
  *(_QWORD *)(v0 - 120) = 0xE000000000000000;
}

uint64_t OUTLINED_FUNCTION_110()
{
  return sub_22E24221C();
}

id OUTLINED_FUNCTION_112(id a1, SEL a2)
{
  uint64_t v2;

  return objc_msgSend(a1, a2, v2);
}

void OUTLINED_FUNCTION_113(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22E2327BC(v2, a2);
}

uint64_t OUTLINED_FUNCTION_114@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v2, v1, v3);
}

uint64_t OUTLINED_FUNCTION_115@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)(a2 - 256) = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_116()
{
  return sub_22E242210();
}

uint64_t OUTLINED_FUNCTION_117@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return sub_22E241D9C();
}

uint64_t OUTLINED_FUNCTION_121()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_122()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_123()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_124(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22E2327BC(v2, a2);
}

uint64_t OUTLINED_FUNCTION_126()
{
  return sub_22E241D54();
}

uint64_t OUTLINED_FUNCTION_128@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_129(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_130@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_131()
{
  uint64_t v0;

  return v0 - 176;
}

void OUTLINED_FUNCTION_134(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22E2327BC(v2 - 144, a2);
}

void OUTLINED_FUNCTION_135()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_136()
{
  return swift_bridgeObjectRelease();
}

id OUTLINED_FUNCTION_137(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, (SEL)(v1 + 3528));
}

void OUTLINED_FUNCTION_138()
{
  void *v0;

}

double OUTLINED_FUNCTION_140()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  result = 0.0;
  *(_OWORD *)(v0 + 16) = 0u;
  *(_OWORD *)(v1 - 144) = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_141@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_142()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_143@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_144(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_147()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_148(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_149(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v1, v2);
}

uint64_t OUTLINED_FUNCTION_150()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_151()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_152()
{
  return sub_22E242210();
}

void OUTLINED_FUNCTION_154(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0xCu);
}

uint64_t OUTLINED_FUNCTION_155()
{
  return sub_22E242198();
}

uint64_t OUTLINED_FUNCTION_156()
{
  return static MPCPlaybackIntent.radioPlaybackIntent(for:)();
}

uint64_t OUTLINED_FUNCTION_158()
{
  return sub_22E241EB0();
}

void OUTLINED_FUNCTION_160(uint64_t a1, unint64_t *a2)
{
  sub_22E2394FC(0, a2);
}

uint64_t OUTLINED_FUNCTION_163()
{
  uint64_t v0;

  return v0 - 128;
}

uint64_t OUTLINED_FUNCTION_165()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_167()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_168()
{
  return swift_dynamicCastObjCClass();
}

void OUTLINED_FUNCTION_169()
{
  JUMPOUT(0x22E328FF8);
}

uint64_t OUTLINED_FUNCTION_171(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_22E238D88(a1, a2, (uint64_t *)(v2 - 128));
}

uint64_t OUTLINED_FUNCTION_172(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_173(char a1, int64_t a2)
{
  uint64_t v2;

  sub_22E2411FC(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_174(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_22E2327BC(v2, a2);
}

uint64_t sub_22E23BBAC(uint64_t a1)
{
  return sub_22E23BC38(a1, qword_255DFC358);
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_22E23BC18(uint64_t a1)
{
  return sub_22E23BC38(a1, qword_255DFC370);
}

uint64_t sub_22E23BC38(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_22E241EB0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_22E241EA4();
}

id MusicPlaybackIntentDescriptor.playbackIntent.getter()
{
  id *v0;

  return *v0;
}

uint64_t MusicPlaybackIntentDescriptor.donate()()
{
  uint64_t v0;
  _QWORD *v1;

  v1[4] = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF30);
  v1[5] = OUTLINED_FUNCTION_12_1();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF38);
  v1[6] = OUTLINED_FUNCTION_12_1();
  return OUTLINED_FUNCTION_20();
}

uint64_t sub_22E23BD0C()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;

  v1 = **(void ***)(v0 + 32);
  objc_msgSend(v1, sel_repeatMode);
  sub_22E23C04C();
  objc_msgSend(v1, sel_shuffleMode);
  sub_22E23C1D8();
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v2;
  *v2 = v0;
  v2[1] = sub_22E23BDA4;
  return sub_22E230B94(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 40));
}

uint64_t sub_22E23BDA4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_20();
}

uint64_t sub_22E23BE00()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  sub_22E2327BC(*(_QWORD *)(v0 + 40), &qword_255DFBF30);
  sub_22E2327BC(v1, &qword_255DFBF38);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_22E23BE60()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint8_t *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  if (qword_255DFBF00 != -1)
    swift_once();
  v1 = *(void **)(v0 + 64);
  v2 = OUTLINED_FUNCTION_158();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_255DFC358);
  v4 = v1;
  v5 = v1;
  v6 = v3;
  sub_22E241E98();
  v7 = OUTLINED_FUNCTION_41();
  v8 = os_log_type_enabled(v3, v7);
  v9 = *(void **)(v0 + 64);
  if (v8)
  {
    v10 = (uint8_t *)OUTLINED_FUNCTION_3();
    v17 = OUTLINED_FUNCTION_3();
    *(_DWORD *)v10 = 136315138;
    *(_QWORD *)(v0 + 16) = v9;
    v11 = v9;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF58);
    v12 = sub_22E242180();
    *(_QWORD *)(v0 + 24) = sub_22E238D88(v12, v13, &v17);
    sub_22E2422DC();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_17_1();
    OUTLINED_FUNCTION_17_1();
    _os_log_impl(&dword_22E22E000, v6, v7, "Unable to donate playback event due to %s", v10, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0();
  }
  OUTLINED_FUNCTION_17_1();
  OUTLINED_FUNCTION_17_1();

  v14 = *(_QWORD *)(v0 + 40);
  v15 = *(_QWORD *)(v0 + 48);
  swift_willThrow();
  sub_22E2327BC(v14, &qword_255DFBF30);
  sub_22E2327BC(v15, &qword_255DFBF38);
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_22E23C04C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  void *v9;
  os_log_type_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_24_0();
  sub_22E241E2C();
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_1();
  if ((v3 & 1) != 0)
  {
LABEL_11:
    v6 = 1;
  }
  else
  {
    v5 = v2 + 1;
    v6 = 1;
    v7 = (unsigned int *)MEMORY[0x24BE69F08];
    switch(v5)
    {
      case 0:
        break;
      case 1:
        goto LABEL_9;
      case 2:
        v7 = (unsigned int *)MEMORY[0x24BE69F00];
        goto LABEL_9;
      case 3:
        v7 = (unsigned int *)MEMORY[0x24BE69F10];
LABEL_9:
        OUTLINED_FUNCTION_10_1(v7);
        OUTLINED_FUNCTION_8_1();
        v6 = 0;
        break;
      default:
        if (qword_255DFBF00 != -1)
          swift_once();
        v8 = OUTLINED_FUNCTION_158();
        v9 = (void *)__swift_project_value_buffer(v8, (uint64_t)qword_255DFC358);
        sub_22E241E98();
        v10 = OUTLINED_FUNCTION_41();
        if (OUTLINED_FUNCTION_14_1(v10))
        {
          OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_19_1(4.8149e-34);
          __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC0D0);
          v11 = OUTLINED_FUNCTION_15_0();
          v13 = OUTLINED_FUNCTION_28_1(v11, v12);
          OUTLINED_FUNCTION_6_1(v13);
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_13_1(&dword_22E22E000, v14, v15, "Unhandled value of MPCPlaybackIntentRepeatMode: %s.");
          OUTLINED_FUNCTION_11_1();
          OUTLINED_FUNCTION_0();
        }

        goto LABEL_11;
    }
  }
  __swift_storeEnumTagSinglePayload(v0, v6, 1, v1);
  OUTLINED_FUNCTION_0_0();
}

void sub_22E23C1D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  void *v9;
  os_log_type_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  OUTLINED_FUNCTION_24_0();
  sub_22E241E38();
  OUTLINED_FUNCTION_22_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_2_1();
  if ((v3 & 1) != 0)
  {
LABEL_11:
    v6 = 1;
  }
  else
  {
    v5 = v2 + 1;
    v6 = 1;
    v7 = (unsigned int *)MEMORY[0x24BE69F30];
    switch(v5)
    {
      case 0:
        break;
      case 1:
        goto LABEL_9;
      case 2:
        v7 = (unsigned int *)MEMORY[0x24BE69F38];
        goto LABEL_9;
      case 3:
        v7 = (unsigned int *)MEMORY[0x24BE69F28];
LABEL_9:
        OUTLINED_FUNCTION_10_1(v7);
        OUTLINED_FUNCTION_8_1();
        v6 = 0;
        break;
      default:
        if (qword_255DFBF00 != -1)
          swift_once();
        v8 = OUTLINED_FUNCTION_158();
        v9 = (void *)__swift_project_value_buffer(v8, (uint64_t)qword_255DFC358);
        sub_22E241E98();
        v10 = OUTLINED_FUNCTION_41();
        if (OUTLINED_FUNCTION_14_1(v10))
        {
          OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_3();
          OUTLINED_FUNCTION_19_1(4.8149e-34);
          __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC0C8);
          v11 = OUTLINED_FUNCTION_15_0();
          v13 = OUTLINED_FUNCTION_28_1(v11, v12);
          OUTLINED_FUNCTION_6_1(v13);
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_13_1(&dword_22E22E000, v14, v15, "Unhandled value of MPCPlaybackIntentShuffleMode: %s.");
          OUTLINED_FUNCTION_11_1();
          OUTLINED_FUNCTION_0();
        }

        goto LABEL_11;
    }
  }
  __swift_storeEnumTagSinglePayload(v0, v6, 1, v1);
  OUTLINED_FUNCTION_0_0();
}

void MusicPlaybackIntentDescriptor.init<A>(item:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v8 = sub_22E2422C4();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v16 - v9;
  sub_22E23CD0C(a2, a2);
  v11 = *(_QWORD *)(a2 - 8);
  swift_allocObject();
  v12 = sub_22E242258();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v13, a1, a2);
  v14 = sub_22E242264();
  v17 = v12;
  __swift_storeEnumTagSinglePayload((uint64_t)v10, 1, 1, a2);
  v15 = MEMORY[0x22E328FF8](MEMORY[0x24BEE12C8], v14);
  MusicPlaybackIntentDescriptor.init<A, B>(items:startingAt:)((uint64_t)&v17, (uint64_t)v10, v14, a2, v15, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, a2);
  OUTLINED_FUNCTION_14_0();
}

void MusicPlaybackIntentDescriptor.init<A, B>(items:startingAt:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, _QWORD *a7@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(char *, uint64_t, uint64_t);
  void (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int EnumTagSinglePayload;
  _QWORD *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t);
  uint64_t *v36;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  _QWORD *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[9];
  char v52;
  uint64_t v53;

  v48 = a6;
  v46 = a5;
  v53 = a2;
  v41 = a7;
  v10 = sub_22E2422C4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_3_0();
  v42 = v12;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v38 - v15;
  v17 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_3_0();
  v40 = v18;
  MEMORY[0x24BDAC7A8](v19);
  v21 = (char *)&v38 - v20;
  sub_22E23CD4C();
  v43 = v17;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v49 = a1;
  v22(v21, a1, a3);
  v44 = v11;
  v45 = v10;
  v23 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v23(v16, v53, v10);
  v24 = a4;
  v25 = v47;
  MPCPlaybackIntent.init<A, B>(for:startingAt:)();
  if (v25)
  {
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v53, v45);
    OUTLINED_FUNCTION_7_1(*(uint64_t (**)(_QWORD, uint64_t))(v43 + 8));
  }
  else
  {
    v39 = v26;
    v47 = v51;
    v22(v40, v49, a3);
    sub_22E242270();
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
    v27 = sub_22E24236C();
    swift_bridgeObjectRelease();
    v50 = v27;
    v28 = v42;
    v29 = v53;
    v30 = v45;
    v23((char *)v42, v53, v45);
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v28, 1, v24);
    v32 = v41;
    v34 = v43;
    v33 = v44;
    if (EnumTagSinglePayload == 1)
    {
      v35 = *(void (**)(uint64_t, uint64_t))(v44 + 8);
      v35(v29, v30);
      OUTLINED_FUNCTION_7_1(*(uint64_t (**)(_QWORD, uint64_t))(v34 + 8));
      v35(v42, v30);
      v36 = v47;
      v47[4] = 0;
      *(_OWORD *)v36 = 0u;
      *((_OWORD *)v36 + 1) = 0u;
    }
    else
    {
      v51[3] = v24;
      v51[4] = v48;
      boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v47);
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 32))(boxed_opaque_existential_1, v42, v24);
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v29, v30);
      OUTLINED_FUNCTION_7_1(*(uint64_t (**)(_QWORD, uint64_t))(v34 + 8));
    }
    v52 = 1;
    sub_22E23CD88(&v50, v32 + 1);
    *v32 = v39;
  }
  OUTLINED_FUNCTION_14_0();
}

void MusicPlaybackIntentDescriptor.init(container:startingAt:playbackSource:)(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v22;
  _BYTE v23[80];

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4938);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_2_1();
  v10 = a1[3];
  v11 = __swift_project_boxed_opaque_existential_1(a1, v10);
  v12 = sub_22E23CD4C();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_39_0();
  (*(void (**)(uint64_t, _QWORD *, uint64_t))(v13 + 16))(v5, v11, v10);
  sub_22E23B000(a2, (uint64_t)&v22, &qword_2540E4940);
  sub_22E23B000(a3, v4, &qword_2540E4938);
  MPCPlaybackIntent.init<A>(container:startingAt:playbackSource:)();
  v15 = v14;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E49A0);
  v16 = OUTLINED_FUNCTION_147();
  *(_OWORD *)(v16 + 16) = xmmword_22E2429B0;
  v18 = a1[3];
  v17 = a1[4];
  v19 = __swift_project_boxed_opaque_existential_1(a1, v18);
  *(_QWORD *)(v16 + 56) = v18;
  *(_QWORD *)(v16 + 64) = *(_QWORD *)(v17 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v16 + 32));
  (*(void (**)(uint64_t *, _QWORD *, uint64_t))(*(_QWORD *)(v18 - 8) + 16))(boxed_opaque_existential_1, v19, v18);
  sub_22E2327BC(a3, &qword_2540E4938);
  v22 = v16;
  sub_22E23CDC4(a2, (uint64_t)v23);
  v23[72] = 1;
  sub_22E23CD88(&v22, a4 + 1);
  *a4 = v15;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_0_0();
}

double MusicPlaybackIntentDescriptor.init(station:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *boxed_opaque_existential_1;
  double result;

  sub_22E23CD4C();
  v4 = static MPCPlaybackIntent.radioPlaybackIntent(for:)();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2540E49A0);
  v5 = OUTLINED_FUNCTION_147();
  *(_OWORD *)(v5 + 16) = xmmword_22E2429B0;
  v6 = sub_22E242114();
  v7 = MEMORY[0x24BDDF990];
  *(_QWORD *)(v5 + 56) = v6;
  *(_QWORD *)(v5 + 64) = v7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v5 + 32));
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(boxed_opaque_existential_1, a1, v6);
  result = 0.0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_QWORD *)(a2 + 48) = 0;
  *(_BYTE *)(a2 + 88) = 1;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v5;
  return result;
}

void MusicPlaybackIntentDescriptor.init(stationSeed:)(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_22E23CD4C();
  static MPCPlaybackIntent.radioPlaybackIntent<A>(from:)();
  if (v4)
  {
    v5 = v4;
    sub_22E23CE0C((uint64_t)a1, a2 + 8);
    *(_BYTE *)(a2 + 88) = 3;
    *(_QWORD *)a2 = v5;
  }
  else
  {
    sub_22E23948C();
    OUTLINED_FUNCTION_51_0();
    *v6 = 2;
    OUTLINED_FUNCTION_23_1();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_18_1();
}

void MusicPlaybackIntentDescriptor.init(from:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE __src[72];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC0B8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &__src[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v8 = sub_22E241D9C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_39_0();
  sub_22E241D90();
  if (__swift_getEnumTagSinglePayload((uint64_t)v7, 1, v8) == 1)
  {
    sub_22E2327BC((uint64_t)v7, &qword_255DFC0B8);
    sub_22E23948C();
    OUTLINED_FUNCTION_51_0();
    *v10 = 1;
    OUTLINED_FUNCTION_23_1();

  }
  else
  {
    (*(void (**)(uint64_t, _BYTE *, uint64_t))(v9 + 32))(v2, v7, v8);
    v11 = a1;
    sub_22E241D84();
    objc_opt_self();
    v12 = swift_dynamicCastObjCClass();
    if (v12)
    {
      v13 = v12;

      (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v2, v8);
      *(_QWORD *)a2 = v13;
      *(_QWORD *)(a2 + 8) = v11;
      memcpy((void *)(a2 + 16), __src, 0x48uLL);
      *(_BYTE *)(a2 + 88) = 0;
    }
    else
    {
      swift_unknownObjectRelease();
      sub_22E2423C0();
      __break(1u);
    }
  }
}

void MusicPlaybackIntentDescriptor.init(request:startingAt:)(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;

  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  _s16MusicKitInternal0A15PlayableRequestP01_abC18_MediaPlaybackCoreE14playbackIntent16withStartingItemSo011MPCPlaybackJ0CSg0aB00daM0_pSg_tF_0();
  if (v6)
  {
    v7 = v6;
    sub_22E23CE0C((uint64_t)a1, a3 + 8);
    sub_22E23CDC4(a2, a3 + 48);
    *(_BYTE *)(a3 + 88) = 2;
    *(_QWORD *)a3 = v7;
  }
  else
  {
    sub_22E23948C();
    OUTLINED_FUNCTION_51_0();
    *v8 = 1;
    OUTLINED_FUNCTION_23_1();
    sub_22E2327BC(a2, &qword_2540E4940);
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  OUTLINED_FUNCTION_18_1();
}

uint64_t sub_22E23CD0C(uint64_t a1, uint64_t a2)
{
  if (dynamic_cast_existential_0_class_conditional(a2))
    return __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC0C0);
  else
    return sub_22E242408();
}

unint64_t sub_22E23CD4C()
{
  unint64_t result;

  result = qword_255DFC0B0;
  if (!qword_255DFC0B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DFC0B0);
  }
  return result;
}

void *sub_22E23CD88(const void *a1, void *a2)
{
  __swift_memcpy81_8(a2, a1);
  return a2;
}

uint64_t sub_22E23CDC4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4940);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_22E23CE0C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v2;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v2 - 8))(a2, a1);
  OUTLINED_FUNCTION_77();
}

void destroy for MusicPlaybackIntentDescriptor(uint64_t a1)
{
  id *v2;

  v2 = (id *)(a1 + 8);
  switch(*(_BYTE *)(a1 + 88))
  {
    case 0:

      break;
    case 1:
      swift_bridgeObjectRelease();
      if (*(_QWORD *)(a1 + 40))
        __swift_destroy_boxed_opaque_existential_1(a1 + 16);
      break;
    case 2:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
      if (*(_QWORD *)(a1 + 72))
      {
        v2 = (id *)(a1 + 48);
        goto LABEL_7;
      }
      break;
    case 3:
LABEL_7:
      __swift_destroy_boxed_opaque_existential_1((uint64_t)v2);
      break;
    default:
      return;
  }
}

void initializeWithCopy for MusicPlaybackIntentDescriptor(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)a2;
  *a1 = *(_QWORD *)a2;
  v3 = *(unsigned __int8 *)(a2 + 88);
  v4 = v2;
  __asm { BR              X9 }
}

uint64_t sub_22E23CF28()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v2 = *v1;
  *(_QWORD *)(v0 + 8) = *v1;
  *(_BYTE *)(v0 + 88) = 0;
  v3 = v2;
  return v0;
}

void **assignWithCopy for MusicPlaybackIntentDescriptor(void **a1, void **a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v4 = *a2;
  v5 = *a1;
  *a1 = *a2;
  v6 = (uint64_t)(a1 + 1);
  v7 = v4;

  if (a1 != a2)
  {
    sub_22E230458(v6);
    __asm { BR              X10 }
  }
  return a1;
}

void *__swift_memcpy89_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x59uLL);
}

void **assignWithTake for MusicPlaybackIntentDescriptor(void **a1, void **a2)
{
  void *v4;

  v4 = *a1;
  *a1 = *a2;

  if (a1 != a2)
  {
    sub_22E230458((uint64_t)(a1 + 1));
    memcpy(a1 + 1, a2 + 1, 0x51uLL);
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for MusicPlaybackIntentDescriptor(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 89))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MusicPlaybackIntentDescriptor(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 88) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 89) = 1;
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
    *(_BYTE *)(result + 89) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MusicPlaybackIntentDescriptor()
{
  return &type metadata for MusicPlaybackIntentDescriptor;
}

uint64_t dynamic_cast_existential_0_class_conditional(uint64_t a1)
{
  if (swift_isClassType())
    return a1;
  else
    return 0;
}

uint64_t OUTLINED_FUNCTION_6_1(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 104) = a1;
  return sub_22E2422DC();
}

uint64_t OUTLINED_FUNCTION_7_1@<X0>(uint64_t (*a1)(_QWORD, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(*(_QWORD *)(v2 - 184), v1);
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v0, v1, v2);
}

uint64_t OUTLINED_FUNCTION_10_1@<X0>(unsigned int *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v1, *a1, v2);
}

uint64_t OUTLINED_FUNCTION_11_1()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  return swift_task_alloc();
}

void OUTLINED_FUNCTION_13_1(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;
  os_log_type_t v6;

  _os_log_impl(a1, v4, v6, a4, v5, 0xCu);
}

BOOL OUTLINED_FUNCTION_14_1(os_log_type_t a1)
{
  NSObject *v1;

  return os_log_type_enabled(v1, a1);
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  return sub_22E242180();
}

void OUTLINED_FUNCTION_17_1()
{
  void *v0;

}

void OUTLINED_FUNCTION_19_1(float a1)
{
  uint64_t v1;
  float *v2;
  uint64_t v3;

  *v2 = a1;
  *(_QWORD *)(v3 - 104) = v1;
  *(_BYTE *)(v3 - 96) = 0;
}

uint64_t OUTLINED_FUNCTION_23_1()
{
  return swift_willThrow();
}

uint64_t OUTLINED_FUNCTION_24_0()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_28_1(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_22E238D88(a1, a2, (uint64_t *)(v2 - 88));
}

id sub_22E23D420()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id result;
  uint64_t v9;

  v0 = sub_22E242078();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E242084();
  v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  v5 = 0;
  if (v4 == *MEMORY[0x24BDDEF30])
    goto LABEL_16;
  if (v4 == *MEMORY[0x24BDDEF40])
  {
    v5 = 1;
LABEL_16:
    sub_22E23D638();
    v6 = sub_22E242090();
    return sub_22E23D674(v6, v7, v5);
  }
  if (v4 == *MEMORY[0x24BDDEF10])
  {
    v5 = 2;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x24BDDEF28])
  {
    v5 = 3;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x24BDDEF18])
  {
    v5 = 4;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x24BDDEF08])
  {
    v5 = 5;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x24BDDEF20])
  {
    v5 = 6;
    goto LABEL_16;
  }
  if (v4 == *MEMORY[0x24BDDEF00])
  {
    v5 = 7;
    goto LABEL_16;
  }
  result = (id)sub_22E2423C0();
  __break(1u);
  return result;
}

unint64_t sub_22E23D638()
{
  unint64_t result;

  result = qword_255DFC0D8;
  if (!qword_255DFC0D8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DFC0D8);
  }
  return result;
}

id sub_22E23D674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v5 = (void *)sub_22E242168();
  swift_bridgeObjectRelease();
  v6 = objc_msgSend(v4, sel_initWithValue_kind_, v5, a3);

  return v6;
}

id sub_22E23D6EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v5 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_120();
  v8 = v7 - v6;
  v9 = sub_22E2420C0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_120();
  v13 = v12 - v11;
  v14 = sub_22E23D7D4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v13, a1, v9);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v8, v2, a2);
  return sub_22E23DF64(v8, v13, v14, a2);
}

unint64_t sub_22E23D7D4()
{
  unint64_t result;

  result = qword_255DFC0E0;
  if (!qword_255DFC0E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DFC0E0);
  }
  return result;
}

uint64_t sub_22E23D810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t result;

  v1 = sub_22E2420B4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8]();
  OUTLINED_FUNCTION_120();
  v5 = v4 - v3;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v4 - v3, v0, v1);
  v6 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v5, v1);
  v7 = 0;
  if (v6 == *MEMORY[0x24BDDF2E8])
    return v7;
  if (v6 == *MEMORY[0x24BDDF268])
    return 1;
  if (v6 == *MEMORY[0x24BDDF300])
    return 2;
  if (v6 == *MEMORY[0x24BDDF328])
    return 3;
  if (v6 == *MEMORY[0x24BDDF270])
    return 4;
  if (v6 == *MEMORY[0x24BDDF318])
    return 5;
  if (v6 == *MEMORY[0x24BDDF278])
    return 6;
  if (v6 == *MEMORY[0x24BDDF280])
    return 7;
  if (v6 == *MEMORY[0x24BDDF2F0])
    return 9;
  if (v6 == *MEMORY[0x24BDDF2D8])
    return 11;
  if (v6 == *MEMORY[0x24BDDF308])
    return 12;
  if (v6 == *MEMORY[0x24BDDF250])
    return 13;
  if (v6 == *MEMORY[0x24BDDF258])
    return 14;
  if (v6 == *MEMORY[0x24BDDF330])
    return 15;
  if (v6 == *MEMORY[0x24BDDF2B8])
    return 16;
  if (v6 == *MEMORY[0x24BDDF288])
    return 17;
  if (v6 == *MEMORY[0x24BDDF2D0])
    return 18;
  if (v6 == *MEMORY[0x24BDDF2C0])
    return 19;
  if (v6 == *MEMORY[0x24BDDF2C8])
    return 20;
  if (v6 == *MEMORY[0x24BDDF340])
    return 22;
  if (v6 == *MEMORY[0x24BDDF290])
    return 23;
  if (v6 == *MEMORY[0x24BDDF260])
    return 24;
  if (v6 == *MEMORY[0x24BDDF298])
    return 25;
  if (v6 == *MEMORY[0x24BDDF2E0])
    return 26;
  if (v6 == *MEMORY[0x24BDDF320])
    return 27;
  if (v6 == *MEMORY[0x24BDDF2A0])
    return 29;
  if (v6 == *MEMORY[0x24BDDF2F8])
    return 30;
  if (v6 == *MEMORY[0x24BDDF348])
    return 31;
  if (v6 == *MEMORY[0x24BDDF338])
    return 32;
  if (v6 == *MEMORY[0x24BDDF310])
    return 33;
  if (v6 == *MEMORY[0x24BDDF2A8])
    return 34;
  if (v6 == *MEMORY[0x24BDDF2B0])
    return 35;
  result = OUTLINED_FUNCTION_2_2();
  __break(1u);
  return result;
}

uint64_t sub_22E23DC50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  int v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[2];

  v0 = sub_22E2420C0();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)v10 - v5;
  OUTLINED_FUNCTION_1_1((uint64_t)v10 - v5);
  v7 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v6, v0);
  v8 = 0;
  if (v7 == *MEMORY[0x24BDDF3D0])
    return v8;
  if (v7 == *MEMORY[0x24BDDF380])
    return 1;
  if (v7 == *MEMORY[0x24BDDF360])
    return 2;
  if (v7 == *MEMORY[0x24BDDF398])
    return 3;
  if (v7 == *MEMORY[0x24BDDF388])
    return 4;
  if (v7 == *MEMORY[0x24BDDF370])
    return 5;
  if (v7 == *MEMORY[0x24BDDF390])
    return 6;
  if (v7 == *MEMORY[0x24BDDF368])
    return 7;
  if (v7 == *MEMORY[0x24BDDF378])
    return 8;
  if (v7 == *MEMORY[0x24BDDF3C0])
    return 9;
  if (v7 == *MEMORY[0x24BDDF3B8])
    return 10;
  if (v7 == *MEMORY[0x24BDDF3B0])
    return 11;
  if (v7 == *MEMORY[0x24BDDF358])
    return 12;
  if (v7 == *MEMORY[0x24BDDF3A0])
    return 13;
  if (v7 == *MEMORY[0x24BDDF3C8])
    return 14;
  if (v7 == *MEMORY[0x24BDDF3A8])
    return 15;
  OUTLINED_FUNCTION_1_1((uint64_t)v4);
  v10[0] = 0;
  v10[1] = 0xE000000000000000;
  sub_22E242318();
  sub_22E242198();
  sub_22E242378();
  sub_22E242198();
  result = OUTLINED_FUNCTION_2_2();
  __break(1u);
  return result;
}

id sub_22E23DF64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  uint64_t v23;
  _QWORD v25[2];
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v28 = a3;
  v7 = sub_22E241FA0();
  v26 = *(_QWORD *)(v7 - 8);
  v27 = v7;
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_22E2420B4();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 32))(v16, a1, a4);
  v25[1] = sub_22E2420D8();
  sub_22E2420CC();
  v18 = (void *)sub_22E23D810();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  sub_22E242054();
  v19 = sub_22E23E1A8(v18);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v27);
  v20 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v21 = (void *)sub_22E242138();
  swift_bridgeObjectRelease();
  v22 = objc_msgSend(v20, sel_initWithIdentifierSet_modelObjectType_storageDictionary_, v19, v18, v21);
  swift_unknownObjectRelease();

  v23 = sub_22E2420C0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(a2, v23);
  (*(void (**)(char *, uint64_t))(v29 + 8))(v16, a4);
  return v22;
}

uint64_t OUTLINED_FUNCTION_1_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return sub_22E2423C0();
}

id sub_22E23E1A8(id a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2540E4948);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v46 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC020);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E241F70();
  v11 = sub_22E24209C();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
  {
    sub_22E23E594((uint64_t)v10, &qword_255DFC020);
    v52 = 0;
  }
  else
  {
    v52 = sub_22E23D420();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  }
  sub_22E241F88();
  if (v12)
  {
    v53 = (id)OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_28_0();
  }
  else
  {
    v53 = 0;
  }
  sub_22E241F40();
  if (v13)
  {
    v50 = (void *)OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_28_0();
  }
  else
  {
    v50 = 0;
  }
  sub_22E241F64();
  if (v14)
  {
    v49 = (void *)OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_28_0();
  }
  else
  {
    v49 = 0;
  }
  sub_22E241F34();
  if (v15)
  {
    v48 = (void *)OUTLINED_FUNCTION_2_3();
    OUTLINED_FUNCTION_28_0();
  }
  else
  {
    v48 = 0;
  }
  sub_22E241F28();
  if (v16)
  {
    v17 = OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_121();
  }
  else
  {
    v17 = 0;
  }
  sub_22E241F04();
  if (v18)
  {
    v47 = (void *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_121();
  }
  else
  {
    v47 = 0;
  }
  sub_22E241F1C();
  v19 = sub_22E241EEC();
  v20 = OUTLINED_FUNCTION_5_1((uint64_t)v7);
  v51 = a1;
  if (v20 == 1)
  {
    sub_22E23E594((uint64_t)v7, &qword_2540E4948);
    v46 = 0;
  }
  else
  {
    v46 = (void *)sub_22E23EB6C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v7, v19);
  }
  sub_22E241F10();
  if (v21)
  {
    v22 = OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_121();
  }
  else
  {
    v22 = 0;
  }
  sub_22E241F4C();
  v23 = (void *)v17;
  if (OUTLINED_FUNCTION_5_1((uint64_t)v5) == 1)
  {
    sub_22E23E594((uint64_t)v5, &qword_2540E4948);
    v24 = 0;
  }
  else
  {
    v24 = sub_22E23EB6C();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v5, v19);
  }
  sub_22E241F58();
  if (v25)
  {
    v26 = OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_121();
  }
  else
  {
    v26 = 0;
  }
  sub_22E241EF8();
  if (v27)
  {
    v28 = (void *)OUTLINED_FUNCTION_1_2();
    OUTLINED_FUNCTION_121();
  }
  else
  {
    v28 = 0;
  }
  v29 = objc_opt_self();
  v30 = sub_22E241F7C();
  v31 = sub_22E23E5D0(v30);
  OUTLINED_FUNCTION_121();
  v32 = sub_22E23DC50();
  v45 = (void *)v29;
  v44 = v31;
  v43 = v26;
  *(_QWORD *)&v42 = v22;
  *((_QWORD *)&v42 + 1) = v24;
  v33 = v50;
  v34 = (void *)v22;
  v35 = v49;
  v36 = (void *)v24;
  v37 = v48;
  v38 = (void *)v26;
  v40 = v46;
  v39 = v47;
  v51 = sub_22E23E8F4((uint64_t)v52, (uint64_t)v53, (uint64_t)v50, (uint64_t)v49, (uint64_t)v48, (uint64_t)v23, (uint64_t)v47, (uint64_t)v46, v42, v43, (uint64_t)v28, v44, (uint64_t)v51, v32, v45);

  return v51;
}

uint64_t sub_22E23E594(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22E23E5D0(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  int64_t v5;
  int v6;
  int v7;
  char v8;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (!v1)
    return v2;
  v19 = MEMORY[0x24BEE4AF8];
  sub_22E23E7F8(0, v1, 0);
  v2 = v19;
  result = sub_22E23EAB0(a1);
  v5 = result;
  v7 = v6;
  v9 = v8 & 1;
  while ((v5 & 0x8000000000000000) == 0 && v5 < 1 << *(_BYTE *)(a1 + 32))
  {
    if (((*(_QWORD *)(a1 + 56 + (((unint64_t)v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) == 0)
      goto LABEL_13;
    if (*(_DWORD *)(a1 + 36) != v7)
      goto LABEL_14;
    v18 = v9;
    v10 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v5);
    v11 = *v10;
    v12 = v10[1];
    v14 = *(_QWORD *)(v19 + 16);
    v13 = *(_QWORD *)(v19 + 24);
    swift_bridgeObjectRetain();
    if (v14 >= v13 >> 1)
      sub_22E23E7F8((char *)(v13 > 1), v14 + 1, 1);
    *(_QWORD *)(v19 + 16) = v14 + 1;
    v15 = v19 + 16 * v14;
    *(_QWORD *)(v15 + 32) = v11;
    *(_QWORD *)(v15 + 40) = v12;
    result = sub_22E23E9CC(v5, v7, v18 & 1, a1);
    v5 = result;
    v7 = v16;
    v9 = v17 & 1;
    if (!--v1)
    {
      sub_22E23EB30(result, v16, v9);
      return v2;
    }
  }
  __break(1u);
LABEL_13:
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t sub_22E23E744(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  OUTLINED_FUNCTION_4_1();
  result = sub_22E2423F0();
  __break(1u);
  return result;
}

char *sub_22E23E7F8(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_22E23E814(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

char *sub_22E23E814(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC0E8);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_22E2416E0(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_22E23E744((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

id sub_22E23E8F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, __int128 a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v18;
  id v19;

  v18 = (void *)sub_22E242240();
  swift_bridgeObjectRelease();
  v19 = objc_msgSend(a15, sel_identifierSetWithCatalogID_libraryID_cloudAlbumLibraryID_cloudID_reportingAdamID_purchasedAdamID_assetAdamID_deviceLocalID_occurrenceID_containedDeviceLocalID_syncID_playbackID_formerIDs_modelObjectType_source_, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, v18, a13, a14);

  return v19;
}

int64_t sub_22E23E9CC(int64_t result, int a2, char a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  if ((a3 & 1) != 0)
    goto LABEL_20;
  v4 = result;
  if (result < 0 || (result = 1 << *(_BYTE *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  v5 = v4 >> 6;
  v6 = a4 + 56;
  v7 = *(_QWORD *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8)
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  v9 = v5 + 1;
  if (v5 + 1 < (unint64_t)(result + 63) >> 6)
  {
    v10 = *(_QWORD *)(v6 + 8 * v9);
    if (v10)
      return __clz(__rbit64(v10)) + (v9 << 6);
    v11 = (unint64_t)(result + 63) >> 6;
    v9 = v5 + 2;
    if (v5 + 2 < v11)
    {
      v10 = *(_QWORD *)(v6 + 8 * v9);
      if (v10)
        return __clz(__rbit64(v10)) + (v9 << 6);
      while (v5 + 3 < v11)
      {
        v10 = *(_QWORD *)(a4 + 80 + 8 * v5++);
        if (v10)
        {
          v9 = v5 + 2;
          return __clz(__rbit64(v10)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

uint64_t sub_22E23EAB0(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  uint64_t i;

  v1 = *(_QWORD *)(a1 + 56);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v2 = 64;
  for (i = 9; i - 7 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    v1 = *(_QWORD *)(a1 + 8 * i);
    v2 += 64;
    if (v1)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

uint64_t sub_22E23EB30(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t OUTLINED_FUNCTION_1_2()
{
  return sub_22E242168();
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return sub_22E242168();
}

uint64_t OUTLINED_FUNCTION_5_1(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

uint64_t sub_22E23EB6C()
{
  char v0;
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  char v9;
  char v10;
  uint64_t v11;
  unsigned __int8 v12;
  char v13;
  char v14;
  uint64_t v15;
  unsigned __int8 v16;
  uint64_t v17;
  unsigned __int8 v18;
  unsigned __int8 v19;
  uint64_t v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 v26;
  uint64_t v27;
  char v28;

  result = sub_22E241EE0();
  v3 = v2;
  v4 = HIBYTE(v2) & 0xF;
  v5 = result & 0xFFFFFFFFFFFFLL;
  if ((v3 & 0x2000000000000000) != 0)
    v6 = v4;
  else
    v6 = result & 0xFFFFFFFFFFFFLL;
  if (!v6)
  {
    swift_bridgeObjectRelease();
    v25 = 0;
LABEL_49:
    sub_22E23F008();
    sub_22E241ED4();
    return (uint64_t)sub_22E23EDF0(v25);
  }
  if ((v3 & 0x1000000000000000) != 0)
  {
    v8 = (uint64_t)sub_22E23EF24(result, v3, 10);
    v0 = v28;
LABEL_46:
    swift_bridgeObjectRelease();
    if ((v0 & 1) != 0)
      v25 = 0;
    else
      v25 = v8;
    goto LABEL_49;
  }
  if ((v3 & 0x2000000000000000) == 0)
  {
    if ((result & 0x1000000000000000) != 0)
      v7 = (unsigned __int8 *)((v3 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v7 = (unsigned __int8 *)sub_22E242330();
    v8 = (uint64_t)sub_22E23F044(v7, v5, 10);
    v0 = v9 & 1;
    goto LABEL_46;
  }
  if (result == 43)
  {
    if (!v4)
      goto LABEL_61;
    if (v4 == 1)
      goto LABEL_32;
    OUTLINED_FUNCTION_1_3();
    if (!v14 & v13)
      goto LABEL_32;
    v8 = v16;
    if (v15 != 2)
    {
      OUTLINED_FUNCTION_1_3();
      if (!v14 & v13)
        goto LABEL_32;
      v8 = 10 * v8 + v18;
      if (v17 != 3)
      {
        while (1)
        {
          OUTLINED_FUNCTION_3_1();
          if (!v14 & v13)
            goto LABEL_32;
          OUTLINED_FUNCTION_0_1();
          if (!v14)
            goto LABEL_32;
          v8 = v20 + v19;
          if (__OFADD__(v20, v19))
            goto LABEL_32;
          OUTLINED_FUNCTION_2_4();
          if (v14)
            goto LABEL_46;
        }
      }
    }
LABEL_45:
    v0 = 0;
    goto LABEL_46;
  }
  if (result != 45)
  {
    if (!v4 || (result - 48) > 9u)
      goto LABEL_32;
    v8 = (result - 48);
    if (v4 != 1)
    {
      OUTLINED_FUNCTION_1_3();
      if (!v14 & v13)
        goto LABEL_32;
      v8 = 10 * v8 + v22;
      if (v21 != 2)
      {
        while (1)
        {
          OUTLINED_FUNCTION_3_1();
          if (!v14 & v13)
            goto LABEL_32;
          OUTLINED_FUNCTION_0_1();
          if (!v14)
            goto LABEL_32;
          v8 = v24 + v23;
          if (__OFADD__(v24, v23))
            goto LABEL_32;
          OUTLINED_FUNCTION_2_4();
          if (v14)
            goto LABEL_46;
        }
      }
    }
    goto LABEL_45;
  }
  if (v4)
  {
    if (v4 != 1)
    {
      OUTLINED_FUNCTION_1_3();
      if (!(!v14 & v13))
      {
        if (v11 == 2)
        {
          v0 = 0;
          v8 = -(uint64_t)v12;
          goto LABEL_46;
        }
        if ((v10 - 48) <= 9u)
        {
          v8 = -10 * v12 - (v10 - 48);
          if (v11 == 3)
            goto LABEL_45;
          while (1)
          {
            OUTLINED_FUNCTION_3_1();
            if (!v14 & v13)
              break;
            OUTLINED_FUNCTION_0_1();
            if (!v14)
              break;
            v8 = v27 - v26;
            if (__OFSUB__(v27, v26))
              break;
            OUTLINED_FUNCTION_2_4();
            if (v14)
              goto LABEL_46;
          }
        }
      }
    }
LABEL_32:
    v8 = 0;
    v0 = 1;
    goto LABEL_46;
  }
  __break(1u);
LABEL_61:
  __break(1u);
  return result;
}

id sub_22E23EDF0(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_22E242168();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithValue_databaseID_, a1, v3);

  return v4;
}

_QWORD *sub_22E23EE68(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC018);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22E23EECC(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;

  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v6 = sub_22E2421E0();
    OUTLINED_FUNCTION_4_2(v6);
    return v7 | 4;
  }
  else
  {
    v3 = MEMORY[0x22E328A94](15, a1 >> 16);
    OUTLINED_FUNCTION_4_2(v3);
    return v4 | 8;
  }
}

unsigned __int8 *sub_22E23EF24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_22E2421EC();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_22E23F2C0();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_22E242330();
  }
LABEL_7:
  v11 = sub_22E23F044(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

unint64_t sub_22E23F008()
{
  unint64_t result;

  result = qword_255DFC0F0;
  if (!qword_255DFC0F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255DFC0F0);
  }
  return result;
}

unsigned __int8 *sub_22E23F044(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 v18;
  unsigned __int8 *v19;
  unsigned int v20;
  char v21;
  uint64_t v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  uint64_t v26;
  unsigned int v27;
  char v28;
  uint64_t v29;

  v3 = a2;
  v4 = *result;
  if (v4 == 43)
  {
    if (a2 >= 1)
    {
      v15 = a2 - 1;
      if (a2 != 1)
      {
        v16 = a3 + 48;
        v17 = a3 + 55;
        v18 = a3 + 87;
        if (a3 > 10)
        {
          v16 = 58;
        }
        else
        {
          v18 = 97;
          v17 = 65;
        }
        if (result)
        {
          v9 = 0;
          v19 = result + 1;
          do
          {
            v20 = *v19;
            if (v20 < 0x30 || v20 >= v16)
            {
              if (v20 < 0x41 || v20 >= v17)
              {
                v13 = 0;
                if (v20 < 0x61 || v20 >= v18)
                  return (unsigned __int8 *)v13;
                v21 = -87;
              }
              else
              {
                v21 = -55;
              }
            }
            else
            {
              v21 = -48;
            }
            v22 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
              return 0;
            v9 = v22 + (v20 + v21);
            if (__OFADD__(v22, (v20 + v21)))
              return 0;
            ++v19;
            --v15;
          }
          while (v15);
          return (unsigned __int8 *)v9;
        }
        return 0;
      }
      return 0;
    }
  }
  else
  {
    if (v4 != 45)
    {
      if (a2)
      {
        v23 = a3 + 48;
        v24 = a3 + 55;
        v25 = a3 + 87;
        if (a3 > 10)
        {
          v23 = 58;
        }
        else
        {
          v25 = 97;
          v24 = 65;
        }
        if (result)
        {
          v26 = 0;
          do
          {
            v27 = *result;
            if (v27 < 0x30 || v27 >= v23)
            {
              if (v27 < 0x41 || v27 >= v24)
              {
                v13 = 0;
                if (v27 < 0x61 || v27 >= v25)
                  return (unsigned __int8 *)v13;
                v28 = -87;
              }
              else
              {
                v28 = -55;
              }
            }
            else
            {
              v28 = -48;
            }
            v29 = v26 * a3;
            if ((unsigned __int128)(v26 * (__int128)a3) >> 64 != (v26 * a3) >> 63)
              return 0;
            v26 = v29 + (v27 + v28);
            if (__OFADD__(v29, (v27 + v28)))
              return 0;
            ++result;
            --v3;
          }
          while (v3);
          return (unsigned __int8 *)(v29 + (v27 + v28));
        }
        return 0;
      }
      return 0;
    }
    if (a2 >= 1)
    {
      v5 = a2 - 1;
      if (a2 != 1)
      {
        v6 = a3 + 48;
        v7 = a3 + 55;
        v8 = a3 + 87;
        if (a3 > 10)
        {
          v6 = 58;
        }
        else
        {
          v8 = 97;
          v7 = 65;
        }
        if (result)
        {
          v9 = 0;
          for (i = result + 1; ; ++i)
          {
            v11 = *i;
            if (v11 < 0x30 || v11 >= v6)
            {
              if (v11 < 0x41 || v11 >= v7)
              {
                v13 = 0;
                if (v11 < 0x61 || v11 >= v8)
                  return (unsigned __int8 *)v13;
                v12 = -87;
              }
              else
              {
                v12 = -55;
              }
            }
            else
            {
              v12 = -48;
            }
            v14 = v9 * a3;
            if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
              return 0;
            v9 = v14 - (v11 + v12);
            if (__OFSUB__(v14, (v11 + v12)))
              return 0;
            if (!--v5)
              return (unsigned __int8 *)v9;
          }
        }
        return 0;
      }
      return 0;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_22E23F2C0()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_22E23F31C();
  v4 = sub_22E23F350(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22E23F31C()
{
  return sub_22E2421F8();
}

uint64_t sub_22E23F350(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_22E23F494(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_22E23EE68(v9, 0);
      v12 = sub_22E23F580((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x24BEE4AF8];
    }
    v13 = MEMORY[0x22E328A64](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x22E328A64);
LABEL_9:
      sub_22E242330();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x22E328A64]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_22E23F494(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_22E23EECC(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_22E23EECC(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_22E2421C8();
  }
  __break(1u);
  return result;
}

unint64_t sub_22E23F580(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_35;
  }
  if (a3 < 0)
    goto LABEL_38;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_35:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    result = v12;
    if ((v12 & 0xC) == v15)
      result = sub_22E23EECC(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_22E2421D4();
      v19 = result;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_22E242330();
        v19 = *(_BYTE *)(result + v18);
      }
    }
    if ((v12 & 0xC) == v15)
    {
      result = sub_22E23EECC(v12, a6, a7);
      v12 = result;
      if ((a7 & 0x1000000000000000) == 0)
      {
LABEL_27:
        v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
        goto LABEL_31;
      }
    }
    else if ((a7 & 0x1000000000000000) == 0)
    {
      goto LABEL_27;
    }
    if (v23 <= v12 >> 16)
      goto LABEL_37;
    v12 = sub_22E2421B0();
LABEL_31:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_35;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_35;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
  return result;
}

unint64_t OUTLINED_FUNCTION_4_2(uint64_t a1)
{
  char v1;

  return a1 & 0xFFFFFFFFFFFFFFFCLL | v1 & 3;
}

uint64_t MPCPlayerResponse.playState(for:)(uint64_t a1)
{
  return sub_22E23FB74(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BDDF500], MEMORY[0x24BDDF6C8]);
}

{
  return sub_22E23FB74(a1, MEMORY[0x24BDDEE48], MEMORY[0x24BDDF6A0]);
}

void MPCPlayerResponse.playState(for:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  unsigned int v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  unsigned __int8 v29;
  uint64_t v30;
  uint64_t v31;

  v2 = OUTLINED_FUNCTION_87();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_39_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC0F8);
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_6_2();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v31 - v7;
  v9 = OUTLINED_FUNCTION_2_5(v6, sel_tracklist);
  v10 = objc_msgSend(v9, sel_playingItem);

  if (v10)
  {
    v12 = OUTLINED_FUNCTION_11_2(v11, sel_metadataObject);

    if (v12)
    {
      v14 = OUTLINED_FUNCTION_2_5(v13, sel_tracklist);
      v15 = objc_msgSend(v14, sel_playingItemIndexPath);

      if (v15)
      {
        sub_22E241D18();

        v16 = OUTLINED_FUNCTION_1_4();
        v17 = v1;
        v18 = 0;
      }
      else
      {
        v16 = OUTLINED_FUNCTION_1_4();
        v17 = v1;
        v18 = 1;
      }
      OUTLINED_FUNCTION_172(v17, v18);
      sub_22E23FAD8(v1, (uint64_t)v8);
      OUTLINED_FUNCTION_1_4();
      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v16) == 1)
      {

        sub_22E23FB20((uint64_t)v8);
      }
      else
      {
        sub_22E241D24();
        (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v8, v16);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v0, *MEMORY[0x24BDDF3A8], v2);
        OUTLINED_FUNCTION_13_2();
        v19 = (void *)sub_22E241E80();
        v20 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v0, v2);
        v21 = OUTLINED_FUNCTION_5_2(v20, sel_identifiers);
        v22 = OUTLINED_FUNCTION_4_3((uint64_t)v21, sel_identifiers);
        v23 = OUTLINED_FUNCTION_17_2((uint64_t)v22, sel_intersectsSet_);

        if (v23)
        {
          OUTLINED_FUNCTION_2_5(v24, sel_state);
          OUTLINED_FUNCTION_16_1();

        }
        else
        {
          v25 = OUTLINED_FUNCTION_5_2(v24, sel_flattenedGenericObject);
          if (v25)
          {
            v26 = v25;
            v27 = objc_msgSend(v25, sel_identifiers);
            v28 = OUTLINED_FUNCTION_4_3((uint64_t)v27, sel_identifiers);
            v29 = OUTLINED_FUNCTION_15_1((uint64_t)v28, sel_intersectsSet_);

            if ((v29 & 1) != 0)
            {
              OUTLINED_FUNCTION_2_5(v30, sel_state);
              OUTLINED_FUNCTION_16_1();

              goto LABEL_16;
            }

          }
        }
      }
    }
  }
LABEL_16:
  OUTLINED_FUNCTION_0_0();
}

uint64_t sub_22E23FAD8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC0F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E23FB20(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC0F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22E23FB74(uint64_t a1, uint64_t (*a2)(_QWORD), unsigned int *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v7 = OUTLINED_FUNCTION_13_2();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_39_0();
  v9 = a2(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v3, a1, v9);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 104))(v3, *a3, v7);
  MPCPlayerResponse.playState(for:)();
  v11 = v10;
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v3, v7);
  return v11;
}

void MPCPlayerResponse.playState(for:in:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  unsigned int v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  unsigned __int8 v38;
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = a1;
  v3 = OUTLINED_FUNCTION_87();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_39_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC0F8);
  OUTLINED_FUNCTION_9_1();
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)v40 - v9;
  v11 = OUTLINED_FUNCTION_2_5(v8, sel_tracklist);
  v12 = objc_msgSend(v11, sel_playingItem);

  if (v12)
  {
    v13 = objc_msgSend(v12, sel_metadataObject);

    if (v13)
    {
      v40[0] = a2;
      v15 = OUTLINED_FUNCTION_2_5(v14, sel_tracklist);
      v16 = objc_msgSend(v15, sel_playingItemIndexPath);

      if (v16)
      {
        sub_22E241D18();

        v17 = OUTLINED_FUNCTION_1_4();
        v18 = (uint64_t)v7;
        v19 = 0;
      }
      else
      {
        v17 = OUTLINED_FUNCTION_1_4();
        v18 = (uint64_t)v7;
        v19 = 1;
      }
      __swift_storeEnumTagSinglePayload(v18, v19, 1, v17);
      sub_22E23FAD8((uint64_t)v7, (uint64_t)v10);
      OUTLINED_FUNCTION_1_4();
      if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v17) == 1)
      {

        sub_22E23FB20((uint64_t)v10);
        goto LABEL_19;
      }
      v20 = sub_22E241D24();
      v21 = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v10, v17);
      v22 = OUTLINED_FUNCTION_2_5(v21, sel_tracklist);
      v23 = objc_msgSend(v22, sel_items);

      v24 = objc_msgSend(v23, sel_sectionAtIndex_, v20);
      v26 = OUTLINED_FUNCTION_4_3(v25, sel_metadataObject);

      OUTLINED_FUNCTION_8_2();
      OUTLINED_FUNCTION_13_2();
      v27 = (void *)sub_22E241E80();
      OUTLINED_FUNCTION_14_2();
      OUTLINED_FUNCTION_8_2();
      sub_22E2420F0();
      v28 = (void *)sub_22E241E80();
      v29 = OUTLINED_FUNCTION_14_2();
      v30 = OUTLINED_FUNCTION_5_2(v29, sel_identifiers);
      v31 = objc_msgSend(v27, sel_identifiers);
      v32 = OUTLINED_FUNCTION_17_2((uint64_t)v31, sel_intersectsSet_);

      if (v32)
      {
        if (!v26)
        {

LABEL_18:
          goto LABEL_19;
        }
        if (OUTLINED_FUNCTION_11_2(v33, sel_type) == (id)2)
        {
          v34 = OUTLINED_FUNCTION_11_2(2, sel_album);
          if (!v34)
          {

            goto LABEL_19;
          }
          v35 = v34;
          v36 = objc_msgSend(v34, sel_identifiers);
          v37 = OUTLINED_FUNCTION_4_3((uint64_t)v36, sel_identifiers);
          v38 = OUTLINED_FUNCTION_15_1((uint64_t)v37, sel_intersectsSet_);

          if ((v38 & 1) != 0)
          {
            OUTLINED_FUNCTION_2_5(v39, sel_state);
            OUTLINED_FUNCTION_16_1();

            goto LABEL_19;
          }

        }
      }

      goto LABEL_18;
    }
  }
LABEL_19:
  OUTLINED_FUNCTION_0_0();
}

void MPCPlayerResponse.playState(for:in:)()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  unsigned __int8 v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int EnumTagSinglePayload;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  unsigned __int8 v36;
  uint64_t v37;
  id v38;
  uint64_t v39;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC0F8);
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_6_2();
  MEMORY[0x24BDAC7A8](v3);
  v39 = (uint64_t)&v38 - v4;
  v5 = OUTLINED_FUNCTION_87();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_7_2();
  sub_22E242120();
  v6 = (void *)sub_22E241E80();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_2();
  sub_22E24212C();
  v7 = (void *)sub_22E241E80();
  OUTLINED_FUNCTION_10_2();
  v8 = objc_msgSend(v0, sel_tracklist);
  v9 = objc_msgSend(v8, sel_playingItem);

  if (v9
    && (v11 = OUTLINED_FUNCTION_4_3(v10, sel_metadataObject), v9, v11))
  {
    v38 = v7;
    v12 = objc_msgSend(v11, sel_identifiers);
    v13 = OUTLINED_FUNCTION_5_2((uint64_t)v12, sel_identifiers);
    v14 = objc_msgSend(v12, sel_intersectsSet_, v13);

    if ((v14 & 1) != 0)
    {
      v16 = OUTLINED_FUNCTION_2_5(v15, sel_tracklist);
      v17 = objc_msgSend(v16, sel_playingItemIndexPath);

      if (v17)
      {
        sub_22E241D18();

        v18 = OUTLINED_FUNCTION_1_4();
        v19 = v1;
        v20 = 0;
      }
      else
      {
        v18 = OUTLINED_FUNCTION_1_4();
        v19 = v1;
        v20 = 1;
      }
      OUTLINED_FUNCTION_172(v19, v20);
      v21 = v1;
      v22 = v39;
      sub_22E23FAD8(v21, v39);
      OUTLINED_FUNCTION_1_4();
      EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v22, 1, v18);
      v24 = v38;
      if (EnumTagSinglePayload != 1)
      {
        v25 = sub_22E241D24();
        v26 = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v22, v18);
        v27 = OUTLINED_FUNCTION_5_2(v26, sel_tracklist);
        v28 = objc_msgSend(v27, sel_items);

        v29 = objc_msgSend(v28, sel_sectionAtIndex_, v25);
        v30 = objc_msgSend(v29, sel_metadataObject);

        if (v30)
        {
          if (OUTLINED_FUNCTION_4_3(v31, sel_type) == (id)4
            && (v32 = OUTLINED_FUNCTION_4_3(4, sel_playlist)) != 0)
          {
            v33 = v32;
            v34 = objc_msgSend(v32, (SEL)0x24FA1AFC8);
            v35 = objc_msgSend(v24, (SEL)0x24FA1AFC8);
            v36 = objc_msgSend(v34, sel_intersectsSet_, v35);

            if ((v36 & 1) != 0)
            {
              OUTLINED_FUNCTION_5_2(v37, sel_state);

              goto LABEL_20;
            }

          }
          else
          {

          }
        }
        else
        {

        }
        goto LABEL_20;
      }

      sub_22E23FB20(v22);
    }
    else
    {

    }
  }
  else
  {

  }
LABEL_20:
  OUTLINED_FUNCTION_0_0();
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return sub_22E241D30();
}

id OUTLINED_FUNCTION_2_5(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_4_3(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_5_2(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_7_2()
{
  uint64_t (*v0)(uint64_t, uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v0(v2, v3, v1);
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v1, v0);
}

id OUTLINED_FUNCTION_11_2(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t OUTLINED_FUNCTION_13_2()
{
  return sub_22E2420FC();
}

uint64_t OUTLINED_FUNCTION_14_2()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

id OUTLINED_FUNCTION_15_1(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

void OUTLINED_FUNCTION_16_1()
{
  void *v0;

}

id OUTLINED_FUNCTION_17_2(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

uint64_t MusicPlaybackIntentDescriptor.init(item:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF80);
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF88);
  v7 = OUTLINED_FUNCTION_65_0();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_22E2429B0;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v8 + 16))(v10 + v9, a1, v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  sub_22E240608(v10, (uint64_t)v6, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(a1, v7);
}

uint64_t sub_22E240608@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  void (*v28)(char *, unint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  int EnumTagSinglePayload;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;

  v44 = a3;
  v5 = sub_22E241D48();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF80);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v39 - v13;
  sub_22E23CD4C();
  sub_22E240CE4(a2, (uint64_t)v14, &qword_255DFBF80);
  v15 = swift_bridgeObjectRetain();
  v16 = v52;
  sub_22E2356B4(v15, (uint64_t)v14, v17, v18, v19, v20, v21, v22, v39, (uint64_t)v40, v41, v42, v43, v44, v45, *((uint64_t *)&v45 + 1), v46, *((uint64_t *)&v46 + 1), v47,
    v48);
  if (v16)
  {
    sub_22E23E594(a2, &qword_255DFBF80);
    return swift_bridgeObjectRelease();
  }
  else
  {
    v40 = v12;
    v41 = a2;
    v52 = v6;
    v42 = v23;
    v43 = a1;
    v25 = *(_QWORD *)(a1 + 16);
    if (v25)
    {
      v39 = 0;
      v26 = a1 + ((*(unsigned __int8 *)(v52 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v52 + 80));
      v27 = *(_QWORD *)(v52 + 72);
      v28 = *(void (**)(char *, unint64_t, uint64_t))(v52 + 16);
      v29 = v52;
      swift_bridgeObjectRetain();
      v30 = MEMORY[0x24BEE4AF8];
      do
      {
        v28(v8, v26, v5);
        sub_22E241D3C();
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
        __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
        if ((swift_dynamicCast() & 1) == 0)
        {
          v47 = 0;
          v45 = 0u;
          v46 = 0u;
        }
        (*(void (**)(char *, uint64_t))(v29 + 8))(v8, v5);
        if (*((_QWORD *)&v46 + 1))
        {
          sub_22E232778(&v45, (uint64_t)&v49);
          sub_22E232778(&v49, (uint64_t)&v45);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_22E2412FC(0, *(_QWORD *)(v30 + 16) + 1, 1, v30);
            v30 = v33;
          }
          v32 = *(_QWORD *)(v30 + 16);
          v31 = *(_QWORD *)(v30 + 24);
          if (v32 >= v31 >> 1)
          {
            sub_22E2412FC(v31 > 1, v32 + 1, 1, v30);
            v30 = v34;
          }
          *(_QWORD *)(v30 + 16) = v32 + 1;
          sub_22E232778(&v45, v30 + 40 * v32 + 32);
          v29 = v52;
        }
        else
        {
          sub_22E23E594((uint64_t)&v45, &qword_2540E4940);
        }
        v26 += v27;
        --v25;
      }
      while (v25);
      swift_bridgeObjectRelease();
    }
    else
    {
      v30 = MEMORY[0x24BEE4AF8];
      v29 = v52;
    }
    v35 = (uint64_t)v40;
    v36 = v41;
    sub_22E240CE4(v41, (uint64_t)v40, &qword_255DFBF80);
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v35, 1, v5);
    v38 = v44;
    if (EnumTagSinglePayload == 1)
    {
      sub_22E23E594(v36, &qword_255DFBF80);
      swift_bridgeObjectRelease();
      sub_22E23E594(v35, &qword_255DFBF80);
      v49 = 0u;
      v50 = 0u;
      v51 = 0;
    }
    else
    {
      sub_22E241D3C();
      sub_22E23E594(v36, &qword_255DFBF80);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v35, v5);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v51 = 0;
        v49 = 0u;
        v50 = 0u;
      }
    }
    *(_QWORD *)(v38 + 8) = v30;
    sub_22E240CE4((uint64_t)&v49, v38 + 16, &qword_2540E4940);
    *(_BYTE *)(v38 + 88) = 1;
    *(_QWORD *)v38 = v42;
    return sub_22E23E594((uint64_t)&v49, &qword_2540E4940);
  }
}

void MusicPlaybackIntentDescriptor.init<A>(items:startingAt:)(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void (*v20)(char *, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int EnumTagSinglePayload;
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
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  uint64_t v44;

  v34 = a5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF80);
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_2_6();
  v35 = v11 - v12;
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v31 - v15;
  v17 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E23CD4C();
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v17 + 16);
  v44 = a1;
  v20(v19, a1, a3);
  sub_22E240CE4(a2, (uint64_t)v16, &qword_255DFBF80);
  MPCPlaybackIntent.init<A>(for:startingAt:)((uint64_t)v19, (uint64_t)v16, a3, a4, v21, v22, v23, v24, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41,
    *((uint64_t *)&v41 + 1));
  if (v5)
  {
    sub_22E23E594(a2, &qword_255DFBF80);
    OUTLINED_FUNCTION_0_2();
  }
  else
  {
    v26 = v25;
    v27 = v34;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
    v32 = sub_22E242234();
    v28 = v35;
    sub_22E240CE4(a2, v35, &qword_255DFBF80);
    v29 = OUTLINED_FUNCTION_65_0();
    EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v28, 1, v29);
    v33 = v26;
    if (EnumTagSinglePayload == 1)
    {
      OUTLINED_FUNCTION_7_3(a2);
      OUTLINED_FUNCTION_0_2();
      OUTLINED_FUNCTION_7_3(v28);
      v41 = 0u;
      v42 = 0u;
      v43 = 0;
    }
    else
    {
      sub_22E241D3C();
      sub_22E23E594(a2, &qword_255DFBF80);
      OUTLINED_FUNCTION_0_2();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8))(v28, v29);
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
      if ((swift_dynamicCast() & 1) == 0)
      {
        v43 = 0;
        v41 = 0u;
        v42 = 0u;
      }
    }
    *(_QWORD *)(v27 + 8) = v32;
    sub_22E240CE4((uint64_t)&v41, v27 + 16, &qword_2540E4940);
    *(_BYTE *)(v27 + 88) = 1;
    *(_QWORD *)v27 = v33;
    OUTLINED_FUNCTION_7_3((uint64_t)&v41);
  }
  OUTLINED_FUNCTION_14_0();
}

double sub_22E240C60@<D0>(uint64_t a1@<X8>)
{
  double result;

  sub_22E241D3C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
  if ((swift_dynamicCast() & 1) == 0)
  {
    *(_QWORD *)(a1 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_22E240CE4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void MusicPlaybackIntentDescriptor.init(request:startingAt:)(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  _QWORD v30[2];
  uint8_t *v31;
  uint64_t v32;
  int v33;
  void *v34;
  _BYTE v35[40];
  _QWORD v36[4];
  uint64_t __src[12];
  __int128 v38;
  __int128 v39;
  uint64_t v40;

  v34 = a3;
  v5 = OUTLINED_FUNCTION_65_0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2_6();
  v9 = v7 - v8;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v30 - v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF80);
  OUTLINED_FUNCTION_9_1();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_2_6();
  v16 = v14 - v15;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)v30 - v18;
  sub_22E240CE4(a2, (uint64_t)v30 - v18, &qword_255DFBF80);
  if (__swift_getEnumTagSinglePayload((uint64_t)v19, 1, v5) == 1)
  {
    sub_22E23E594((uint64_t)v19, &qword_255DFBF80);
    v38 = 0u;
    v39 = 0u;
    v40 = 0;
  }
  else
  {
    sub_22E241D3C();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v19, v5);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBFA0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
    if ((swift_dynamicCast() & 1) == 0)
    {
      v40 = 0;
      v38 = 0u;
      v39 = 0u;
    }
  }
  sub_22E240CE4(a2, v16, &qword_255DFBF80);
  if (__swift_getEnumTagSinglePayload(v16, 1, v5) == 1)
  {
    sub_22E23E594(v16, &qword_255DFBF80);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 32))(v12, v16, v5);
    if (*((_QWORD *)&v39 + 1))
    {
      (*(void (**)(char *, uint64_t))(v6 + 8))(v12, v5);
    }
    else
    {
      if (qword_255DFBF08 != -1)
        swift_once();
      v20 = sub_22E241EB0();
      __swift_project_value_buffer(v20, (uint64_t)qword_255DFC370);
      (*(void (**)(uint64_t, char *, uint64_t))(v6 + 16))(v9, v12, v5);
      v21 = sub_22E241E98();
      v22 = sub_22E2422A0();
      v23 = v22;
      if (os_log_type_enabled(v21, v22))
      {
        v33 = v23;
        v24 = (uint8_t *)swift_slowAlloc();
        v32 = swift_slowAlloc();
        __src[0] = v32;
        v31 = v24;
        *(_DWORD *)v24 = 136315138;
        v30[1] = v24 + 4;
        sub_22E2417F0();
        v25 = sub_22E2423FC();
        v36[0] = sub_22E238D88(v25, v26, __src);
        sub_22E2422DC();
        swift_bridgeObjectRelease();
        OUTLINED_FUNCTION_4_4();
        _os_log_impl(&dword_22E22E000, v21, (os_log_type_t)v33, "Ignoring start item for non-playable item %s for new playback intent.", v31, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_0();
      }

      OUTLINED_FUNCTION_4_4();
      ((void (*)(char *, uint64_t))v6)(v12, v5);
    }
  }
  sub_22E23B040(a1, (uint64_t)v36);
  sub_22E240CE4((uint64_t)&v38, (uint64_t)v35, &qword_2540E4940);
  __swift_project_boxed_opaque_existential_1(v36, v36[3]);
  _s16MusicKitInternal0A15PlayableRequestP01_abC18_MediaPlaybackCoreE14playbackIntent16withStartingItemSo011MPCPlaybackJ0CSg0aB00daM0_pSg_tF_0();
  if (v27)
  {
    v28 = v27;
    sub_22E23B040((uint64_t)v36, (uint64_t)&__src[1]);
    sub_22E23CDC4((uint64_t)v35, (uint64_t)&__src[6]);
    LOBYTE(__src[11]) = 2;
    __src[0] = v28;
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    sub_22E23E594(a2, &qword_255DFBF80);
    __swift_destroy_boxed_opaque_existential_1(a1);
    memcpy(v34, __src, 0x59uLL);
  }
  else
  {
    sub_22E23948C();
    swift_allocError();
    *v29 = 1;
    swift_willThrow();
    sub_22E23E594((uint64_t)v35, &qword_2540E4940);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v36);
    sub_22E23E594(a2, &qword_255DFBF80);
    __swift_destroy_boxed_opaque_existential_1(a1);
  }
  sub_22E23E594((uint64_t)&v38, &qword_2540E4940);
  OUTLINED_FUNCTION_14_0();
}

void sub_22E2411E0(char a1, int64_t a2, char a3, uint64_t a4)
{
  sub_22E241218(a1, a2, a3, a4, &qword_2540E49A8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_22E2413DC, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22E2416E0);
}

void sub_22E2411FC(char a1, int64_t a2, char a3, uint64_t a4)
{
  sub_22E241218(a1, a2, a3, a4, &qword_255DFC0E8, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_22E2414D0, (void (*)(uint64_t, uint64_t, _QWORD *))sub_22E2416E0);
}

void sub_22E241218(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD, uint64_t, _QWORD *, uint64_t), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  _QWORD *v17;

  if ((a3 & 1) != 0)
  {
    v11 = *(_QWORD *)(a4 + 24);
    v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v12 = a2;
    }
  }
  else
  {
    v12 = a2;
  }
  v13 = *(_QWORD *)(a4 + 16);
  if (v12 <= v13)
    v14 = *(_QWORD *)(a4 + 16);
  else
    v14 = v12;
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v15 = (_QWORD *)swift_allocObject();
    v16 = _swift_stdlib_malloc_size(v15);
    v15[2] = v13;
    v15[3] = 2 * ((uint64_t)(v16 - 32) / 16);
  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v17 = v15 + 4;
  if ((a1 & 1) != 0)
  {
    a7(a4 + 32, v13, v17);
    OUTLINED_FUNCTION_6_3();
  }
  else
  {
    a6(0, v13, v17, a4);
  }
  OUTLINED_FUNCTION_5_3();
}

void sub_22E2412FC(char a1, int64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2540E49A0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((a1 & 1) != 0)
  {
    sub_22E241764((char *)(a4 + 32), v8, v12);
    OUTLINED_FUNCTION_6_3();
  }
  else
  {
    sub_22E2415C4(0, v8, (unint64_t)v12, a4);
  }
  OUTLINED_FUNCTION_5_3();
}

uint64_t sub_22E2413DC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_22E2423F0();
  __break(1u);
  return result;
}

uint64_t sub_22E2414D0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_22E2423F0();
  __break(1u);
  return result;
}

uint64_t sub_22E2415C4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_255DFBF70);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_22E2423F0();
  __break(1u);
  return result;
}

char *sub_22E2416E0(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_22E2423F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

char *sub_22E241764(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_22E2423F0();
    __break(1u);
  }
  else if (__dst != __src || &__src[40 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 40 * a2);
  }
  return __src;
}

unint64_t sub_22E2417F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255DFBF78;
  if (!qword_255DFBF78)
  {
    v1 = sub_22E241D48();
    result = MEMORY[0x22E328FF8](MEMORY[0x24BE695F0], v1);
    atomic_store(result, (unint64_t *)&qword_255DFBF78);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, uint64_t))(v1 + 8))(*(_QWORD *)(v2 - 72), v0);
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_6_3()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_7_3(uint64_t a1)
{
  uint64_t *v1;

  return sub_22E23E594(a1, v1);
}

id sub_22E241884()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_22E2418D8()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for MusicKitInternal_MediaPlaybackCore_FinalClass()
{
  return objc_opt_self();
}

uint64_t MPCReportingLyricsViewEvent.song.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  uint64_t v4;

  v3 = objc_msgSend(v1, sel_modelSong);
  v4 = sub_22E2420E4();
  if (v3)
    return sub_22E241E8C();
  else
    return __swift_storeEnumTagSinglePayload(a1, 1, 1, v4);
}

uint64_t sub_22E2419BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC128);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E241BA4(a1, (uint64_t)v4);
  return MPCReportingLyricsViewEvent.song.setter((uint64_t)v4);
}

uint64_t MPCReportingLyricsViewEvent.song.setter(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v2 = v1;
  v4 = sub_22E2420C0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC128);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22E241BA4(a1, (uint64_t)v10);
  v11 = sub_22E2420E4();
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v11) == 1)
  {
    sub_22E241BEC((uint64_t)v10);
    v12 = 0;
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDDF390], v4);
    v12 = (void *)sub_22E241E80();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  }
  objc_msgSend(v2, sel_setModelSong_, v12);

  return sub_22E241BEC(a1);
}

uint64_t sub_22E241BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22E241BEC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255DFC128);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void (*MPCReportingLyricsViewEvent.song.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  size_t v3;
  void *v4;

  *a1 = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_255DFC128) - 8) + 64);
  a1[1] = malloc(v3);
  v4 = malloc(v3);
  a1[2] = v4;
  MPCReportingLyricsViewEvent.song.getter((uint64_t)v4);
  return sub_22E241C98;
}

void sub_22E241C98(uint64_t a1, char a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 8);
  v3 = *(void **)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    sub_22E241BA4((uint64_t)v3, (uint64_t)v2);
    MPCReportingLyricsViewEvent.song.setter((uint64_t)v2);
    sub_22E241BEC((uint64_t)v3);
  }
  else
  {
    MPCReportingLyricsViewEvent.song.setter((uint64_t)v3);
  }
  free(v3);
  free(v2);
}

uint64_t sub_22E241CF4@<X0>(uint64_t a1@<X8>)
{
  return MPCReportingLyricsViewEvent.song.getter(a1);
}

uint64_t sub_22E241D18()
{
  return MEMORY[0x24BDCF650]();
}

uint64_t sub_22E241D24()
{
  return MEMORY[0x24BEBBEB8]();
}

uint64_t sub_22E241D30()
{
  return MEMORY[0x24BDCF678]();
}

uint64_t sub_22E241D3C()
{
  return MEMORY[0x24BE694F0]();
}

uint64_t sub_22E241D48()
{
  return MEMORY[0x24BE695D0]();
}

uint64_t sub_22E241D54()
{
  return MEMORY[0x24BE69650]();
}

uint64_t sub_22E241D60()
{
  return MEMORY[0x24BE69658]();
}

uint64_t sub_22E241D6C()
{
  return MEMORY[0x24BE69660]();
}

uint64_t sub_22E241D78()
{
  return MEMORY[0x24BE696F0]();
}

uint64_t sub_22E241D84()
{
  return MEMORY[0x24BE696F8]();
}

uint64_t sub_22E241D90()
{
  return MEMORY[0x24BE69700]();
}

uint64_t sub_22E241D9C()
{
  return MEMORY[0x24BE69708]();
}

uint64_t sub_22E241DA8()
{
  return MEMORY[0x24BE69728]();
}

uint64_t sub_22E241DB4()
{
  return MEMORY[0x24BE69730]();
}

uint64_t sub_22E241DC0()
{
  return MEMORY[0x24BE69AB8]();
}

uint64_t sub_22E241DCC()
{
  return MEMORY[0x24BE69AC0]();
}

uint64_t sub_22E241DD8()
{
  return MEMORY[0x24BE69AC8]();
}

uint64_t sub_22E241DE4()
{
  return MEMORY[0x24BE69AD8]();
}

uint64_t sub_22E241DF0()
{
  return MEMORY[0x24BE69AE8]();
}

uint64_t sub_22E241DFC()
{
  return MEMORY[0x24BE69B00]();
}

uint64_t sub_22E241E08()
{
  return MEMORY[0x24BE69DF8]();
}

uint64_t sub_22E241E14()
{
  return MEMORY[0x24BE69E10]();
}

uint64_t sub_22E241E20()
{
  return MEMORY[0x24BE69E18]();
}

uint64_t sub_22E241E2C()
{
  return MEMORY[0x24BE69F18]();
}

uint64_t sub_22E241E38()
{
  return MEMORY[0x24BE69F40]();
}

uint64_t sub_22E241E44()
{
  return MEMORY[0x24BE69F50]();
}

uint64_t sub_22E241E50()
{
  return MEMORY[0x24BE6A138]();
}

uint64_t sub_22E241E5C()
{
  return MEMORY[0x24BE6A2D0]();
}

uint64_t sub_22E241E68()
{
  return MEMORY[0x24BE6A348]();
}

uint64_t sub_22E241E74()
{
  return MEMORY[0x24BE6A698]();
}

uint64_t sub_22E241E80()
{
  return MEMORY[0x24BEC67C0]();
}

uint64_t sub_22E241E8C()
{
  return MEMORY[0x24BEC67C8]();
}

uint64_t sub_22E241E98()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_22E241EA4()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_22E241EB0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_22E241EBC()
{
  return MEMORY[0x24BDDE748]();
}

uint64_t sub_22E241EC8()
{
  return MEMORY[0x24BE6A6D8]();
}

uint64_t sub_22E241ED4()
{
  return MEMORY[0x24BDDE858]();
}

uint64_t sub_22E241EE0()
{
  return MEMORY[0x24BDDE870]();
}

uint64_t sub_22E241EEC()
{
  return MEMORY[0x24BDDE878]();
}

uint64_t sub_22E241EF8()
{
  return MEMORY[0x24BDDE8B0]();
}

uint64_t sub_22E241F04()
{
  return MEMORY[0x24BDDE8C0]();
}

uint64_t sub_22E241F10()
{
  return MEMORY[0x24BDDE8D8]();
}

uint64_t sub_22E241F1C()
{
  return MEMORY[0x24BDDE8E8]();
}

uint64_t sub_22E241F28()
{
  return MEMORY[0x24BDDE900]();
}

uint64_t sub_22E241F34()
{
  return MEMORY[0x24BDDE910]();
}

uint64_t sub_22E241F40()
{
  return MEMORY[0x24BDDE928]();
}

uint64_t sub_22E241F4C()
{
  return MEMORY[0x24BDDE940]();
}

uint64_t sub_22E241F58()
{
  return MEMORY[0x24BDDE958]();
}

uint64_t sub_22E241F64()
{
  return MEMORY[0x24BDDE968]();
}

uint64_t sub_22E241F70()
{
  return MEMORY[0x24BDDE980]();
}

uint64_t sub_22E241F7C()
{
  return MEMORY[0x24BDDE990]();
}

uint64_t sub_22E241F88()
{
  return MEMORY[0x24BDDE9A8]();
}

uint64_t sub_22E241F94()
{
  return MEMORY[0x24BDDE9B8]();
}

uint64_t sub_22E241FA0()
{
  return MEMORY[0x24BDDE9C0]();
}

uint64_t sub_22E241FAC()
{
  return MEMORY[0x24BDDE9D8]();
}

uint64_t sub_22E241FB8()
{
  return MEMORY[0x24BE6A710]();
}

uint64_t sub_22E241FC4()
{
  return MEMORY[0x24BE6A718]();
}

uint64_t sub_22E241FD0()
{
  return MEMORY[0x24BE6A720]();
}

uint64_t sub_22E241FDC()
{
  return MEMORY[0x24BE6A728]();
}

uint64_t sub_22E241FE8()
{
  return MEMORY[0x24BE6A730]();
}

uint64_t sub_22E241FF4()
{
  return MEMORY[0x24BDDE9E8]();
}

uint64_t sub_22E242000()
{
  return MEMORY[0x24BDDE9F0]();
}

uint64_t sub_22E24200C()
{
  return MEMORY[0x24BDDEA08]();
}

uint64_t sub_22E242018()
{
  return MEMORY[0x24BDDEA20]();
}

uint64_t sub_22E242024()
{
  return MEMORY[0x24BDDEA30]();
}

uint64_t sub_22E242030()
{
  return MEMORY[0x24BE6A758]();
}

uint64_t sub_22E24203C()
{
  return MEMORY[0x24BDDEB70]();
}

uint64_t sub_22E242048()
{
  return MEMORY[0x24BDDEB88]();
}

uint64_t sub_22E242054()
{
  return MEMORY[0x24BDDEDC8]();
}

uint64_t sub_22E242060()
{
  return MEMORY[0x24BE6A8A0]();
}

uint64_t sub_22E24206C()
{
  return MEMORY[0x24BE6A8B0]();
}

uint64_t sub_22E242078()
{
  return MEMORY[0x24BDDEF48]();
}

uint64_t sub_22E242084()
{
  return MEMORY[0x24BDDEF50]();
}

uint64_t sub_22E242090()
{
  return MEMORY[0x24BDDEF60]();
}

uint64_t sub_22E24209C()
{
  return MEMORY[0x24BDDEF68]();
}

uint64_t sub_22E2420A8()
{
  return MEMORY[0x24BDDF248]();
}

uint64_t sub_22E2420B4()
{
  return MEMORY[0x24BDDF350]();
}

uint64_t sub_22E2420C0()
{
  return MEMORY[0x24BDDF3D8]();
}

uint64_t sub_22E2420CC()
{
  return MEMORY[0x24BDDF3E8]();
}

uint64_t sub_22E2420D8()
{
  return MEMORY[0x24BDDF3F8]();
}

uint64_t sub_22E2420E4()
{
  return MEMORY[0x24BDDF500]();
}

uint64_t sub_22E2420F0()
{
  return MEMORY[0x24BDDF618]();
}

uint64_t sub_22E2420FC()
{
  return MEMORY[0x24BDDF718]();
}

uint64_t sub_22E242108()
{
  return MEMORY[0x24BDDF7E0]();
}

uint64_t sub_22E242114()
{
  return MEMORY[0x24BDDF9A8]();
}

uint64_t sub_22E242120()
{
  return MEMORY[0x24BDDFAD0]();
}

uint64_t sub_22E24212C()
{
  return MEMORY[0x24BDDFB58]();
}

uint64_t sub_22E242138()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_22E242144()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_22E242150()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_22E24215C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_22E242168()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_22E242174()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_22E242180()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_22E24218C()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_22E242198()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_22E2421A4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_22E2421B0()
{
  return MEMORY[0x24BEE0C18]();
}

uint64_t sub_22E2421BC()
{
  return MEMORY[0x24BEE0C30]();
}

uint64_t sub_22E2421C8()
{
  return MEMORY[0x24BEE0C38]();
}

uint64_t sub_22E2421D4()
{
  return MEMORY[0x24BEE0C40]();
}

uint64_t sub_22E2421E0()
{
  return MEMORY[0x24BEE0CA0]();
}

uint64_t sub_22E2421EC()
{
  return MEMORY[0x24BEE0DD0]();
}

uint64_t sub_22E2421F8()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_22E242204()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_22E242210()
{
  return MEMORY[0x24BE6B048]();
}

uint64_t sub_22E24221C()
{
  return MEMORY[0x24BE6B050]();
}

uint64_t sub_22E242228()
{
  return MEMORY[0x24BEE0DF8]();
}

uint64_t sub_22E242234()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_22E242240()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_22E24224C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_22E242258()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_22E242264()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_22E242270()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_22E24227C()
{
  return MEMORY[0x24BDCFC58]();
}

uint64_t sub_22E242288()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_22E242294()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_22E2422A0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_22E2422AC()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_22E2422B8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_22E2422C4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_22E2422D0()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_22E2422DC()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_22E2422E8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_22E2422F4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_22E242300()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_22E24230C()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_22E242318()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_22E242324()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_22E242330()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_22E24233C()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_22E242348()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_22E242354()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_22E242360()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_22E24236C()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_22E242378()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_22E242384()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_22E242390()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_22E24239C()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_22E2423A8()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_22E2423B4()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_22E2423C0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_22E2423CC()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_22E2423D8()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_22E2423E4()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_22E2423F0()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_22E2423FC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_22E242408()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_22E242414()
{
  return MEMORY[0x24BEE3930]();
}

uint64_t sub_22E242420()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_22E24242C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_22E242438()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_22E242444()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_22E242450()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_22E24245C()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_22E242468()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_22E242474()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_22E242480()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_22E24248C()
{
  return MEMORY[0x24BEE4A98]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
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

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
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

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
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

