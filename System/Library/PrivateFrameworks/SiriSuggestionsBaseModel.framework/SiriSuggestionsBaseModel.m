uint64_t sub_2472A0E8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v0 = sub_2472A85EC();
  v1 = *(_QWORD *)(v0 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = (char *)&v17 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257685F40);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (uint64_t *)((char *)&v17 - v7);
  sub_2472A85C8();
  v9 = sub_2472A7DDC();
  if (v9 == 52)
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEA7408], v0);
    v10 = sub_2472A85E0();
    v12 = v11;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    *v8 = v10;
    v8[1] = v12;
  }
  else
  {
    *v8 = sub_2472A7E2C(v9);
    v8[1] = v13;
  }
  v14 = *MEMORY[0x24BEA75E8];
  v15 = sub_2472A8640();
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v8, v14, v15);
  OUTLINED_FUNCTION_0((uint64_t)v8, 0);
  OUTLINED_FUNCTION_0((uint64_t)v6, 1);
  return sub_2472A864C();
}

uint64_t sub_2472A1010()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BaseSuggestionsAssetProvider()
{
  return objc_opt_self();
}

uint64_t sub_2472A1040()
{
  return sub_2472A0E8C();
}

uint64_t sub_2472A1054()
{
  _QWORD *v0;
  uint64_t v1;

  v1 = sub_2472A86DC();
  v0[7] = v1;
  v0[8] = *(_QWORD *)(v1 - 8);
  v0[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2472A10B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unsigned __int8 *v4;
  unsigned __int8 v5;
  unsigned __int8 v6;
  NSObject *v7;
  os_log_type_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char *v17;
  uint64_t v18[5];

  if (qword_257685DF0 != -1)
    swift_once();
  v1 = qword_257687590;
  v18[3] = sub_2472A85B0();
  v18[4] = sub_2472A140C();
  v18[0] = v1;
  sub_2472A8634();
  swift_allocObject();
  swift_retain();
  sub_2472A8628();
  v17 = (char *)sub_2472A7EDC();
  v2 = *((_QWORD *)v17 + 2);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 64);
    v4 = (unsigned __int8 *)(v17 + 32);
    do
    {
      v6 = *v4++;
      v5 = v6;
      sub_2472A8658();
      v7 = sub_2472A86D0();
      v8 = sub_2472A87CC();
      v9 = os_log_type_enabled(v7, v8);
      v10 = *(_QWORD *)(v0 + 72);
      v11 = *(_QWORD *)(v0 + 56);
      if (v9)
      {
        v12 = swift_slowAlloc();
        v18[0] = swift_slowAlloc();
        *(_DWORD *)v12 = 136315138;
        v13 = sub_2472A7EE8(v5);
        *(_QWORD *)(v12 + 4) = sub_2472A148C(v13, v14, v18);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24729F000, v7, v8, "BaseSuggestionsOwnerDefinitionFactory:: '%s' not added due to 'addToSuggestionPool' is false", (uint8_t *)v12, 0xCu);
        swift_arrayDestroy();
        OUTLINED_FUNCTION_1();
      }

      (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v10, v11);
      --v2;
    }
    while (v2);
  }
  swift_bridgeObjectRelease();
  sub_2472A861C();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257685F58);
  v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_2472A8A60;
  sub_2472A144C((__int128 *)(v0 + 16), v15 + 32);
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v15);
}

uint64_t type metadata accessor for BaseSuggestionsOwnerDefinitionFactory()
{
  return objc_opt_self();
}

uint64_t sub_2472A1324()
{
  return sub_2472A8610();
}

uint64_t sub_2472A132C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2472A1370;
  return sub_2472A1054();
}

uint64_t sub_2472A1370(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x249576040]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

unint64_t sub_2472A140C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257685F50;
  if (!qword_257685F50)
  {
    v1 = sub_2472A85B0();
    result = MEMORY[0x24957604C](MEMORY[0x24BEA6F70], v1);
    atomic_store(result, (unint64_t *)&qword_257685F50);
  }
  return result;
}

uint64_t sub_2472A144C(__int128 *a1, uint64_t a2)
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

uint64_t sub_2472A1464@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

uint64_t sub_2472A148C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_2472A155C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2472A1C14((uint64_t)v12, *a3);
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
      sub_2472A1C14((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_2472A155C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
      sub_2472A16B0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_2472A87D8();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_2472A1774(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_2472A87FC();
    if (!v8)
    {
      result = sub_2472A8808();
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

void *sub_2472A16B0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2472A8814();
  __break(1u);
  return result;
}

uint64_t sub_2472A1774(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2472A1808(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_2472A19DC(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_2472A19DC((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2472A1808(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_2472A879C();
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
  v3 = sub_2472A1978(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_2472A87F0();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_2472A8814();
  __break(1u);
LABEL_14:
  result = sub_2472A8808();
  __break(1u);
  return result;
}

_QWORD *sub_2472A1978(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257685F60);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2472A19DC(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257685F60);
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
    sub_2472A1B74(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2472A1AB0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_2472A1AB0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_2472A8814();
  __break(1u);
  return result;
}

char *sub_2472A1B74(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_2472A8814();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
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

uint64_t sub_2472A1C14(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

void OUTLINED_FUNCTION_1()
{
  JUMPOUT(0x2495760A0);
}

uint64_t sub_2472A1C70()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_2472A8574();
  v0[3] = v1;
  v0[4] = *(_QWORD *)(v1 - 8);
  v0[5] = OUTLINED_FUNCTION_0_0();
  v2 = sub_2472A858C();
  v0[6] = v2;
  v0[7] = *(_QWORD *)(v2 - 8);
  v0[8] = OUTLINED_FUNCTION_0_0();
  v3 = sub_2472A85A4();
  v0[9] = v3;
  v0[10] = *(_QWORD *)(v3 - 8);
  v0[11] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_2472A1CEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 24);
  v6 = *(_QWORD *)(v0 + 32);
  sub_2472A8580();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BDCF240], v3);
  sub_2472A8568();
  v7 = sub_2472A8598();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  result = OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 80);
    __swift_instantiateConcreteTypeFromMangledName(&qword_257686498);
    v10 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v10 + 16) = xmmword_2472A8A60;
    *(_QWORD *)(v0 + 16) = v7 - 1;
    v11 = sub_2472A8820();
    *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v10 + 32) = v11;
    *(_QWORD *)(v10 + 40) = v12;
    OUTLINED_FUNCTION_9(*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8));
    OUTLINED_FUNCTION_20();
    OUTLINED_FUNCTION_49();
    OUTLINED_FUNCTION_44();
    return OUTLINED_FUNCTION_21(v10, *(uint64_t (**)(void))(v0 + 8));
  }
  return result;
}

uint64_t type metadata accessor for PreviousYearResolver()
{
  return objc_opt_self();
}

uint64_t sub_2472A1E2C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2472A4E04;
  return sub_2472A1C70();
}

uint64_t sub_2472A1E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;

  v5[2] = a4;
  v5[3] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576864A8);
  v5[4] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_2472A1EB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = sub_2472A1F9C(*(_QWORD **)(v0 + 16), *(_QWORD *)(*(_QWORD *)(v0 + 24) + 32), *(_QWORD *)(*(_QWORD *)(v0 + 24) + 40), *(_QWORD *)(*(_QWORD *)(v0 + 24) + 48), *(_QWORD *)(*(_QWORD *)(v0 + 24) + 56));
  sub_2472A26A0(v2, (uint64_t (*)(_QWORD))MEMORY[0x24BEBA4B0], v1);
  OUTLINED_FUNCTION_28();
  v3 = sub_2472A8778();
  if (OUTLINED_FUNCTION_25() == 1)
  {
    sub_2472A4D0C(*(_QWORD *)(v0 + 32), &qword_2576864A8);
    v4 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v5 = sub_2472A876C();
    v7 = v6;
    OUTLINED_FUNCTION_17(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8));
    __swift_instantiateConcreteTypeFromMangledName(&qword_257686498);
    v4 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v4 + 16) = xmmword_2472A8A60;
    *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v4 + 32) = v5;
    *(_QWORD *)(v4 + 40) = v7;
  }
  swift_task_dealloc();
  return OUTLINED_FUNCTION_21(v4, *(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_2472A1F9C(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t result;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  char v36;
  void (*v37)(char *, uint64_t);
  void (*v38)(char *, uint64_t);
  void (*v39)(char *, char *, uint64_t);
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void (*v52)(char *, unint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void (*v56)(char *, char *, uint64_t);
  char *v57;
  unint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  unsigned int v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  v63 = a5;
  v62 = a4;
  v61 = a3;
  v60 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576864B0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576864A8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = sub_2472A8778();
  v73 = *(_QWORD *)(v77 - 8);
  v12 = MEMORY[0x24BDAC7A8](v77);
  v72 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v64 = (char *)&v60 - v14;
  v70 = sub_2472A86A0();
  v15 = *(_QWORD *)(v70 - 8);
  v16 = MEMORY[0x24BDAC7A8](v70);
  v18 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v60 - v19;
  v21 = sub_2472A86C4();
  v82 = *(_QWORD *)(v21 - 8);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v80 = (char *)&v60 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = MEMORY[0x24BDAC7A8](v22);
  v74 = (char *)&v60 - v25;
  MEMORY[0x24BDAC7A8](v24);
  v79 = (char *)&v60 - v26;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2472A8604();
  v27 = sub_2472A87B4();
  result = swift_bridgeObjectRelease();
  v29 = MEMORY[0x24BEE4AF8];
  v87 = MEMORY[0x24BEE4AF8];
  v30 = *(_QWORD *)(v27 + 16);
  v75 = v11;
  v76 = v8;
  v81 = v21;
  v71 = v30;
  if (v30)
  {
    v31 = 0;
    v69 = *MEMORY[0x24BE572E8];
    v68 = v15;
    v67 = v18;
    v66 = v20;
    v65 = v27;
    while (1)
    {
      if (v31 >= *(_QWORD *)(v27 + 16))
      {
        __break(1u);
        return result;
      }
      v32 = (*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80);
      v33 = *(_QWORD *)(v82 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v82 + 16))(v79, v27 + v32 + v33 * v31, v21);
      sub_2472A86B8();
      v34 = v70;
      (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v18, v69, v70);
      sub_2472A4A68(&qword_2576864B8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE57320], MEMORY[0x24BE57348]);
      sub_2472A87A8();
      sub_2472A87A8();
      v35 = v85 == v83 && v86 == v84;
      v78 = v32;
      if (v35)
        break;
      v36 = sub_2472A882C();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v37 = *(void (**)(char *, uint64_t))(v15 + 8);
      v37(v18, v34);
      v37(v20, v34);
      if ((v36 & 1) != 0)
        goto LABEL_11;
      result = (*(uint64_t (**)(char *, uint64_t))(v82 + 8))(v79, v21);
      v11 = v75;
      v8 = v76;
      v15 = v68;
      v18 = v67;
      v20 = v66;
LABEL_16:
      v27 = v65;
      if (v71 == ++v31)
      {
        v29 = v87;
        goto LABEL_18;
      }
    }
    swift_bridgeObjectRelease_n();
    v38 = *(void (**)(char *, uint64_t))(v15 + 8);
    v38(v18, v34);
    v38(v20, v34);
LABEL_11:
    v39 = *(void (**)(char *, char *, uint64_t))(v82 + 32);
    v39(v74, v79, v21);
    v40 = v87;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      sub_2472A4A24(0, *(_QWORD *)(v40 + 16) + 1, 1);
      v40 = v87;
    }
    v18 = v67;
    v20 = v66;
    v41 = v78;
    v43 = *(_QWORD *)(v40 + 16);
    v42 = *(_QWORD *)(v40 + 24);
    if (v43 >= v42 >> 1)
    {
      sub_2472A4A24(v42 > 1, v43 + 1, 1);
      v40 = v87;
    }
    *(_QWORD *)(v40 + 16) = v43 + 1;
    v44 = v40 + v41 + v43 * v33;
    v21 = v81;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v39)(v44, v74, v81);
    v87 = v40;
    v11 = v75;
    v8 = v76;
    v15 = v68;
    goto LABEL_16;
  }
LABEL_18:
  swift_bridgeObjectRelease();
  v45 = v61;
  swift_bridgeObjectRetain();
  v46 = v63;
  swift_bridgeObjectRetain();
  v47 = sub_2472A3178(v29, v60, v45, v62, v46);
  v48 = *(_QWORD *)(v47 + 16);
  if (v48)
  {
    v49 = (*(unsigned __int8 *)(v82 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80);
    v79 = (char *)v47;
    v50 = v47 + v49;
    v51 = *(_QWORD *)(v82 + 72);
    v52 = *(void (**)(char *, unint64_t, uint64_t))(v82 + 16);
    v53 = MEMORY[0x24BEE4AF8];
    do
    {
      v52(v80, v50, v21);
      sub_2472A86AC();
      v54 = sub_2472A8754();
      if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v54) == 1)
      {
        sub_2472A4D0C((uint64_t)v8, &qword_2576864B0);
        v55 = v77;
        __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v77);
      }
      else
      {
        sub_2472A873C();
        (*(void (**)(char *, uint64_t))(*(_QWORD *)(v54 - 8) + 8))(v8, v54);
        v55 = v77;
      }
      v21 = v81;
      (*(void (**)(char *, uint64_t))(v82 + 8))(v80, v81);
      if (__swift_getEnumTagSinglePayload((uint64_t)v11, 1, v55) == 1)
      {
        sub_2472A4D0C((uint64_t)v11, &qword_2576864A8);
      }
      else
      {
        v56 = *(void (**)(char *, char *, uint64_t))(v73 + 32);
        v57 = v64;
        v56(v64, v11, v55);
        v56(v72, v57, v55);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v53 = sub_2472A43E4(0, *(_QWORD *)(v53 + 16) + 1, 1, v53);
        v59 = *(_QWORD *)(v53 + 16);
        v58 = *(_QWORD *)(v53 + 24);
        v21 = v81;
        if (v59 >= v58 >> 1)
          v53 = sub_2472A43E4(v58 > 1, v59 + 1, 1, v53);
        *(_QWORD *)(v53 + 16) = v59 + 1;
        v56((char *)(v53+ ((*(unsigned __int8 *)(v73 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v73 + 80))+ *(_QWORD *)(v73 + 72) * v59), v72, v77);
        v11 = v75;
        v8 = v76;
      }
      v50 += v51;
      --v48;
    }
    while (v48);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v53;
}

uint64_t sub_2472A2694@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_2472A26A0(a1, (uint64_t (*)(_QWORD))MEMORY[0x24BE577B0], a2);
}

uint64_t sub_2472A26A0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_QWORD *)(a1 + 16);
  v6 = a2(0);
  v7 = v6;
  if (v5)
  {
    (*(void (**)(uint64_t, unint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, a1+ ((*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v6 - 8) + 80)), v6);
    v8 = 0;
  }
  else
  {
    v8 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a3, v8, 1, v7);
}

uint64_t sub_2472A2718()
{
  uint64_t v0;

  OUTLINED_FUNCTION_41();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2472A2740()
{
  sub_2472A2718();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AppEntityResolver()
{
  return objc_opt_self();
}

uint64_t sub_2472A2780(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_2472A4E04;
  return sub_2472A1E74((uint64_t)v6, v7, v8, a4);
}

uint64_t sub_2472A27D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;

  v4[6] = a4;
  v5 = sub_2472A8778();
  v4[7] = v5;
  v4[8] = *(_QWORD *)(v5 - 8);
  v4[9] = OUTLINED_FUNCTION_0_0();
  v6 = sub_2472A85EC();
  v4[10] = v6;
  v4[11] = *(_QWORD *)(v6 - 8);
  v4[12] = OUTLINED_FUNCTION_1_0();
  v4[13] = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_2472A283C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _QWORD *a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  _QWORD *v41;
  uint64_t v42;
  unint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  _QWORD *v51;
  uint64_t result;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  void (*v69)(uint64_t);
  void (*v70)(uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  uint64_t v75;

  OUTLINED_FUNCTION_34();
  v18 = *(_QWORD *)(v17 + 96);
  v19 = *(_QWORD *)(v17 + 104);
  v20 = *(_QWORD *)(v17 + 80);
  v21 = *(_QWORD *)(v17 + 88);
  v22 = *(_QWORD **)(v17 + 48);
  OUTLINED_FUNCTION_46(v19);
  v23 = sub_2472A85E0();
  v25 = v24;
  v26 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
  v26(v19, v20);
  v27 = sub_2472A1F9C(v22, v23, v25, 0x6E457265646C6F46, 0xEC00000079746974);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_46(v18);
  v28 = sub_2472A85E0();
  v30 = v29;
  v26(v18, v20);
  v31 = sub_2472A1F9C(v22, v28, v30, 0x7469746E45676154, 0xE900000000000079);
  swift_bridgeObjectRelease();
  v32 = *(_QWORD *)(v27 + 16);
  v67 = v31;
  if (v32)
  {
    OUTLINED_FUNCTION_11();
    v33 = v27 + ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
    v73 = *(_QWORD *)(v27 + 72);
    v34 = v27;
    v70 = *(void (**)(uint64_t))(v27 + 16);
    v35 = a17;
    do
    {
      v36 = OUTLINED_FUNCTION_26();
      v70(v36);
      v37 = sub_2472A876C();
      v39 = v38;
      OUTLINED_FUNCTION_35(*(uint64_t (**)(uint64_t, uint64_t))(v34 + 8));
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_24(v35[2]);
        v35 = a17;
      }
      v27 = v35[2];
      v40 = v35[3];
      if (v27 >= v40 >> 1)
      {
        OUTLINED_FUNCTION_15(v40);
        v35 = a17;
      }
      v35[2] = v27 + 1;
      v41 = &v35[2 * v27];
      v41[4] = v37;
      v41[5] = v39;
      v33 += v73;
      --v32;
    }
    while (v32);
    swift_bridgeObjectRelease();
    v31 = v67;
  }
  else
  {
    OUTLINED_FUNCTION_28();
    v35 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v42 = *(_QWORD *)(v31 + 16);
  if (v42)
  {
    OUTLINED_FUNCTION_11();
    v43 = v31 + ((*(unsigned __int8 *)(v27 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v27 + 80));
    v71 = *(_QWORD *)(v27 + 72);
    v74 = v27;
    v69 = *(void (**)(uint64_t))(v27 + 16);
    v44 = a17;
    do
    {
      v45 = OUTLINED_FUNCTION_26();
      v69(v45);
      v46 = sub_2472A876C();
      v48 = v47;
      OUTLINED_FUNCTION_35(*(uint64_t (**)(uint64_t, uint64_t))(v74 + 8));
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        OUTLINED_FUNCTION_24(v44[2]);
        v44 = a17;
      }
      v50 = v44[2];
      v49 = v44[3];
      if (v50 >= v49 >> 1)
      {
        OUTLINED_FUNCTION_15(v49);
        v44 = a17;
      }
      v44[2] = v50 + 1;
      v51 = &v44[2 * v50];
      v51[4] = v46;
      v51[5] = v48;
      v43 += v71;
      --v42;
    }
    while (v42);
    result = swift_bridgeObjectRelease();
  }
  else
  {
    result = OUTLINED_FUNCTION_42();
    v44 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v53 = v44[2];
  if (v53)
  {
    v54 = 0;
    v55 = v35[2];
    v56 = v44 + 4;
    v57 = v35 + 5;
    v65 = v55;
    v66 = v44[2];
    while (1)
    {
      if (v54 >= v44[2])
      {
        __break(1u);
        return result;
      }
      if (v55)
        break;
LABEL_27:
      if (++v54 == v53)
        goto LABEL_28;
    }
    v68 = v54;
    v58 = &v56[2 * v54];
    v59 = v58[1];
    v72 = *v58;
    sub_2472A4CD0();
    v75 = v59;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v60 = v55;
    while (1)
    {
      v62 = *(v57 - 1);
      v61 = *v57;
      *(_QWORD *)(v17 + 16) = v62;
      *(_QWORD *)(v17 + 24) = v61;
      *(_QWORD *)(v17 + 32) = v72;
      *(_QWORD *)(v17 + 40) = v75;
      swift_bridgeObjectRetain();
      if (!sub_2472A87E4())
        break;
      v57 += 2;
      swift_bridgeObjectRelease();
      if (!--v60)
      {
        OUTLINED_FUNCTION_28();
        result = swift_bridgeObjectRelease();
        v53 = v66;
        v54 = v68;
        v56 = v44 + 4;
        v55 = v65;
        v57 = v35 + 5;
        goto LABEL_27;
      }
    }
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_33();
    __swift_instantiateConcreteTypeFromMangledName(&qword_257686498);
    v63 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v63 + 16) = xmmword_2472A8A60;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576864F8);
    v64 = OUTLINED_FUNCTION_6();
    *(_OWORD *)(v64 + 16) = xmmword_2472A8B40;
    *(_QWORD *)(v64 + 32) = v72;
    *(_QWORD *)(v64 + 40) = v75;
    *(_QWORD *)(v64 + 48) = v62;
    *(_QWORD *)(v64 + 56) = v61;
    *(_QWORD *)(v63 + 56) = __swift_instantiateConcreteTypeFromMangledName(&qword_257686500);
    *(_QWORD *)(v63 + 32) = v64;
  }
  else
  {
LABEL_28:
    OUTLINED_FUNCTION_33();
    OUTLINED_FUNCTION_28();
    v63 = MEMORY[0x24BEE4AF8];
  }
  swift_task_dealloc();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_29();
  return OUTLINED_FUNCTION_3(v63, *(uint64_t (**)(void))(v17 + 8));
}

uint64_t type metadata accessor for NotesTagAndFolderResolver()
{
  return objc_opt_self();
}

uint64_t sub_2472A2C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_2472A4E04;
  return sub_2472A27D0((uint64_t)v6, v7, v8, a4);
}

uint64_t sub_2472A2CC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[6] = a4;
  v5 = sub_2472A8754();
  v4[7] = v5;
  v4[8] = *(_QWORD *)(v5 - 8);
  v4[9] = OUTLINED_FUNCTION_1_0();
  v4[10] = OUTLINED_FUNCTION_5();
  v6 = sub_2472A86A0();
  v4[11] = v6;
  v4[12] = *(_QWORD *)(v6 - 8);
  v4[13] = OUTLINED_FUNCTION_1_0();
  v4[14] = OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257686510);
  v4[15] = OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576864B0);
  v4[16] = OUTLINED_FUNCTION_1_0();
  v4[17] = OUTLINED_FUNCTION_5();
  v7 = sub_2472A86C4();
  v4[18] = v7;
  v4[19] = *(_QWORD *)(v7 - 8);
  v4[20] = OUTLINED_FUNCTION_1_0();
  v4[21] = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_2();
}

#error "2472A2E1C: call analysis failed (funcsize=239)"

uint64_t sub_2472A3178(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v31 = a2;
  v32 = a4;
  v33 = sub_2472A86C4();
  v9 = *(_QWORD *)(v33 - 8);
  v10 = MEMORY[0x24BDAC7A8](v33);
  v30 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v24 - v13;
  v15 = MEMORY[0x24BEE4AF8];
  v34 = MEMORY[0x24BEE4AF8];
  v27 = a1;
  v29 = *(_QWORD *)(a1 + 16);
  if (v29)
  {
    v16 = 0;
    v25 = a3;
    v26 = a5;
    v17 = v27;
    while (v16 < *(_QWORD *)(v17 + 16))
    {
      v18 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
      v19 = *(_QWORD *)(v9 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v14, v17 + v18 + v19 * v16, v33);
      v20 = sub_2472A3F90((uint64_t)v14, v31, a3, v32, a5);
      if (v5)
      {
        (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v33);
        swift_bridgeObjectRelease();
        v15 = v34;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        swift_release();
        return v15;
      }
      if ((v20 & 1) != 0)
      {
        v28 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
        v28(v30, v14, v33);
        v21 = v34;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2472A4A24(0, *(_QWORD *)(v21 + 16) + 1, 1);
          v21 = v34;
        }
        v23 = *(_QWORD *)(v21 + 16);
        v22 = *(_QWORD *)(v21 + 24);
        if (v23 >= v22 >> 1)
        {
          sub_2472A4A24(v22 > 1, v23 + 1, 1);
          v21 = v34;
        }
        *(_QWORD *)(v21 + 16) = v23 + 1;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v28)(v21 + v18 + v23 * v19, v30, v33);
        v34 = v21;
        a3 = v25;
        a5 = v26;
        v17 = v27;
      }
      else
      {
        result = (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v33);
      }
      if (v29 == ++v16)
      {
        v15 = v34;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t type metadata accessor for DestinationResolver()
{
  return objc_opt_self();
}

uint64_t sub_2472A33E8(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7465736E7553;
  else
    return 0x657369726E7553;
}

uint64_t sub_2472A341C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_2472A4E04;
  return sub_2472A2CC0((uint64_t)v6, v7, v8, a4);
}

uint64_t sub_2472A3468()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_2472A858C();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = OUTLINED_FUNCTION_0_0();
  v2 = sub_2472A85A4();
  v0[5] = v2;
  v0[6] = *(_QWORD *)(v2 - 8);
  v0[7] = OUTLINED_FUNCTION_0_0();
  v3 = sub_2472A8574();
  v0[8] = v3;
  v0[9] = *(_QWORD *)(v3 - 8);
  v0[10] = OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_2472A34E4()
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
  unint64_t v13;
  uint64_t v15;

  v2 = *(_QWORD *)(v0 + 72);
  v1 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 56);
  v15 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(v0 + 48);
  v7 = *(_QWORD *)(v0 + 24);
  v6 = *(_QWORD *)(v0 + 32);
  v8 = *(_QWORD *)(v0 + 16);
  sub_2472A8568();
  sub_2472A8580();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 104))(v6, *MEMORY[0x24BDCF230], v8);
  v9 = sub_2472A8598();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257686498);
  v10 = OUTLINED_FUNCTION_6();
  v11 = v10;
  *(_OWORD *)(v10 + 16) = xmmword_2472A8A60;
  v12 = 0x7465736E7553;
  if (v9 < 9)
    v12 = 0x657369726E7553;
  v13 = 0xE600000000000000;
  if (v9 < 9)
    v13 = 0xE700000000000000;
  *(_QWORD *)(v10 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v10 + 32) = v12;
  *(_QWORD *)(v10 + 40) = v13;
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v15);
  OUTLINED_FUNCTION_29();
  OUTLINED_FUNCTION_36();
  OUTLINED_FUNCTION_20();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v11);
}

BOOL sub_2472A3620(uint64_t a1)
{
  return a1 > 8;
}

uint64_t sub_2472A362C()
{
  return sub_2472A3C80();
}

uint64_t type metadata accessor for SunStageResolver()
{
  return objc_opt_self();
}

uint64_t sub_2472A3654()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2472A3684()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2472A1370;
  return sub_2472A3468();
}

uint64_t sub_2472A36C8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4[6] = a4;
  v5 = sub_2472A8718();
  v4[7] = v5;
  v4[8] = *(_QWORD *)(v5 - 8);
  v4[9] = OUTLINED_FUNCTION_0_0();
  v6 = sub_2472A870C();
  v4[10] = v6;
  v4[11] = *(_QWORD *)(v6 - 8);
  v4[12] = OUTLINED_FUNCTION_0_0();
  v7 = sub_2472A86A0();
  v4[13] = v7;
  v4[14] = *(_QWORD *)(v7 - 8);
  v4[15] = OUTLINED_FUNCTION_1_0();
  v4[16] = OUTLINED_FUNCTION_5();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257686510);
  v4[17] = OUTLINED_FUNCTION_0_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576864B0);
  v4[18] = OUTLINED_FUNCTION_0_0();
  v8 = sub_2472A8754();
  v4[19] = v8;
  v4[20] = *(_QWORD *)(v8 - 8);
  v4[21] = OUTLINED_FUNCTION_1_0();
  v4[22] = OUTLINED_FUNCTION_5();
  v9 = sub_2472A86C4();
  v4[23] = v9;
  v4[24] = *(_QWORD *)(v9 - 8);
  v4[25] = OUTLINED_FUNCTION_1_0();
  v4[26] = OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_2();
}

#error "2472A3854: call analysis failed (funcsize=266)"

uint64_t type metadata accessor for PlaceNameResolver()
{
  return objc_opt_self();
}

uint64_t sub_2472A3C20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_2472A4E04;
  return sub_2472A36C8((uint64_t)v6, v7, v8, a4);
}

uint64_t sub_2472A3C6C()
{
  uint64_t v0;

  return sub_2472A4DF0(*(uint64_t (**)(uint64_t))(v0 + 8), v0, MEMORY[0x24BEE4AF8]);
}

uint64_t sub_2472A3C80()
{
  OUTLINED_FUNCTION_41();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for DoNotResolveResolver()
{
  return objc_opt_self();
}

uint64_t sub_2472A3CCC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2472A4E04;
  return sub_2472A1370(MEMORY[0x24BEE4AF8]);
}

void sub_2472A3D1C(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68((unint64_t *)&unk_2576863E8, a2, (uint64_t (*)(uint64_t))type metadata accessor for DoNotResolveResolver, (uint64_t)&unk_2472A8C88);
}

void sub_2472A3D48(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68(&qword_2576863F8, a2, (uint64_t (*)(uint64_t))type metadata accessor for DoNotResolveResolver, (uint64_t)&unk_2472A8CB0);
}

void sub_2472A3D74(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68((unint64_t *)&unk_257686400, a2, (uint64_t (*)(uint64_t))type metadata accessor for PlaceNameResolver, (uint64_t)&unk_2472A8D10);
}

void sub_2472A3DA0(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68(&qword_257686410, a2, (uint64_t (*)(uint64_t))type metadata accessor for PlaceNameResolver, (uint64_t)&unk_2472A8D38);
}

void sub_2472A3DCC(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68((unint64_t *)&unk_257686418, a2, (uint64_t (*)(uint64_t))type metadata accessor for SunStageResolver, (uint64_t)&unk_2472A8D98);
}

void sub_2472A3DF8(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68(&qword_257686428, a2, (uint64_t (*)(uint64_t))type metadata accessor for SunStageResolver, (uint64_t)&unk_2472A8DC0);
}

void sub_2472A3E24(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68((unint64_t *)&unk_257686430, a2, (uint64_t (*)(uint64_t))type metadata accessor for DestinationResolver, (uint64_t)&unk_2472A8E20);
}

void sub_2472A3E50(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68(&qword_257686440, a2, (uint64_t (*)(uint64_t))type metadata accessor for DestinationResolver, (uint64_t)&unk_2472A8E48);
}

void sub_2472A3E7C(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68((unint64_t *)&unk_257686448, a2, (uint64_t (*)(uint64_t))type metadata accessor for NotesTagAndFolderResolver, (uint64_t)&unk_2472A8EA8);
}

void sub_2472A3EA8(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68(&qword_257686458, a2, (uint64_t (*)(uint64_t))type metadata accessor for NotesTagAndFolderResolver, (uint64_t)&unk_2472A8ED0);
}

void sub_2472A3ED4(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68((unint64_t *)&unk_257686460, a2, (uint64_t (*)(uint64_t))type metadata accessor for AppEntityResolver, (uint64_t)&unk_2472A8F30);
}

void sub_2472A3F00(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68(&qword_257686470, a2, (uint64_t (*)(uint64_t))type metadata accessor for AppEntityResolver, (uint64_t)&unk_2472A8F58);
}

void sub_2472A3F2C(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68((unint64_t *)&unk_257686478, a2, (uint64_t (*)(uint64_t))type metadata accessor for PreviousYearResolver, (uint64_t)&unk_2472A8FB8);
}

void sub_2472A3F58(uint64_t a1, uint64_t a2)
{
  sub_2472A4A68(&qword_257686488, a2, (uint64_t (*)(uint64_t))type metadata accessor for PreviousYearResolver, (uint64_t)&unk_2472A8FE0);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_2472A3F90(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  char v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v38 = a5;
  v36 = a2;
  v7 = sub_2472A8760();
  v37 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v33 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576864C8);
  MEMORY[0x24BDAC7A8](v35);
  v10 = (char *)&v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576864B0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576864D0);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v34 = (uint64_t)&v33 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = (char **)((char *)&v33 - v18);
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v33 - v20;
  sub_2472A86AC();
  v22 = sub_2472A8754();
  if (__swift_getEnumTagSinglePayload((uint64_t)v13, 1, v22) == 1)
  {
    sub_2472A4D0C((uint64_t)v13, &qword_2576864B0);
    v23 = 1;
  }
  else
  {
    sub_2472A8730();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v13, v22);
    v23 = 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v21, v23, 1, v7);
  v24 = (_QWORD *)swift_allocObject();
  v25 = v37;
  v24[2] = v36;
  v24[3] = a3;
  v24[4] = a4;
  v24[5] = v38;
  *v19 = v24;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v25 + 104))(v19, *MEMORY[0x24BEB9CF8], v7);
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, v7);
  v26 = (uint64_t)&v10[*(int *)(v35 + 48)];
  v27 = &qword_2576864D0;
  sub_2472A4D44((uint64_t)v21, (uint64_t)v10, &qword_2576864D0);
  sub_2472A4D44((uint64_t)v19, v26, &qword_2576864D0);
  if (__swift_getEnumTagSinglePayload((uint64_t)v10, 1, v7) == 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2472A4D0C((uint64_t)v19, &qword_2576864D0);
    sub_2472A4D0C((uint64_t)v21, &qword_2576864D0);
    if (__swift_getEnumTagSinglePayload(v26, 1, v7) == 1)
    {
      v28 = -1;
    }
    else
    {
      v27 = &qword_2576864C8;
      v28 = 0;
    }
  }
  else
  {
    v29 = v34;
    sub_2472A4D44((uint64_t)v10, v34, &qword_2576864D0);
    if (__swift_getEnumTagSinglePayload(v26, 1, v7) == 1)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      sub_2472A4D0C((uint64_t)v19, &qword_2576864D0);
      sub_2472A4D0C((uint64_t)v21, &qword_2576864D0);
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v29, v7);
      v28 = 0;
      v27 = &qword_2576864C8;
    }
    else
    {
      v30 = v33;
      (*(void (**)(char *, uint64_t, uint64_t))(v25 + 32))(v33, v26, v7);
      sub_2472A4A68(&qword_2576864D8, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9D20], MEMORY[0x24BEB9D40]);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v28 = sub_2472A8784();
      v31 = *(void (**)(char *, uint64_t))(v25 + 8);
      v31(v30, v7);
      v27 = &qword_2576864D0;
      sub_2472A4D0C((uint64_t)v19, &qword_2576864D0);
      sub_2472A4D0C((uint64_t)v21, &qword_2576864D0);
      v31((char *)v29, v7);
    }
  }
  sub_2472A4D0C((uint64_t)v10, v27);
  return v28 & 1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2472A43E4(char a1, int64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_24;
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576864C0);
  v10 = *(_QWORD *)(sub_2472A8778() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_24:
    result = sub_2472A8808();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(unsigned __int8 *)(*(_QWORD *)(sub_2472A8778() - 8) + 80);
  v17 = (v16 + 32) & ~v16;
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    sub_2472A4760(a4 + v17, v8, v18, (void (*)(_QWORD))MEMORY[0x24BEBA4B0]);
    *(_QWORD *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2472A45BC(0, v8, v18, a4);
  }
  return (uint64_t)v13;
}

uint64_t sub_2472A45BC(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(sub_2472A8778() - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v13;
    }
  }
  result = sub_2472A8814();
  __break(1u);
  return result;
}

char *sub_2472A46DC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_2472A8814();
    __break(1u);
  }
  else if (__dst != __src || &__src[16 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 16 * a2);
  }
  return __src;
}

uint64_t sub_2472A4760(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(_QWORD))
{
  uint64_t result;

  if (a2 < 0)
  {
    result = sub_2472A8814();
    __break(1u);
  }
  else if (a3 < a1
         || (result = ((uint64_t (*)(_QWORD))a4)(0),
             a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    a4(0);
    OUTLINED_FUNCTION_48();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    OUTLINED_FUNCTION_48();
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

uint64_t sub_2472A4848(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 16 * a2 <= a1 || a1 + 16 * a2 <= a3))
    return swift_arrayInitWithCopy();
  result = sub_2472A8814();
  __break(1u);
  return result;
}

uint64_t sub_2472A4914(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(sub_2472A86C4() - 8) + 72) * a2;
    v6 = a3 + v5;
    v7 = a1 + v5;
    if (v6 <= a1 || v7 <= a3)
      return swift_arrayInitWithCopy();
  }
  result = sub_2472A8814();
  __break(1u);
  return result;
}

char *sub_2472A4A08(char *a1, int64_t a2, char a3)
{
  uint64_t *v3;
  char *result;

  result = sub_2472A4AA4(a1, a2, a3, *v3);
  *v3 = (uint64_t)result;
  return result;
}

size_t sub_2472A4A24(size_t a1, int64_t a2, char a3)
{
  uint64_t *v3;
  size_t result;

  result = sub_2472A4B84(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

uint64_t sub_2472A4A40()
{
  OUTLINED_FUNCTION_41();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2472A4A68(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t v6;

  if (!*a1)
  {
    v6 = a3(a2);
    atomic_store(MEMORY[0x24957604C](a4, v6), a1);
  }
  OUTLINED_FUNCTION_37();
}

char *sub_2472A4AA4(char *result, int64_t a2, char a3, uint64_t a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2576864F8);
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
    sub_2472A46DC(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2472A4848((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

size_t sub_2472A4B84(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576864E0);
  v10 = *(_QWORD *)(sub_2472A86C4() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_2472A86C4() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  v17 = (unint64_t)v13 + v16;
  v18 = a4 + v16;
  if ((v5 & 1) != 0)
  {
    sub_2472A4760(v18, v8, v17, (void (*)(_QWORD))MEMORY[0x24BE577B0]);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_2472A4914(v18, v8, v17);
  }
  swift_release();
  return (size_t)v13;
}

unint64_t sub_2472A4CD0()
{
  unint64_t result;

  result = qword_2576864F0;
  if (!qword_2576864F0)
  {
    result = MEMORY[0x24957604C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_2576864F0);
  }
  return result;
}

void sub_2472A4D0C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_37();
}

void sub_2472A4D44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_37();
}

uint64_t sub_2472A4D84(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_name);

  if (!v2)
    return 0;
  v3 = sub_2472A8790();

  return v3;
}

uint64_t sub_2472A4DF0(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_3(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return sub_2472A3C80();
}

uint64_t OUTLINED_FUNCTION_5()
{
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, unint64_t))(v0 + 16))(v1, v2+ ((*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80))+ *(_QWORD *)(v0 + 72) * v3);
}

uint64_t OUTLINED_FUNCTION_9@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_10(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

char *OUTLINED_FUNCTION_11()
{
  int64_t v0;

  return sub_2472A4A08(0, v0, 0);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_2472A87A8();
}

size_t OUTLINED_FUNCTION_13()
{
  uint64_t v0;

  return sub_2472A4A24(0, *(_QWORD *)(v0 + 16) + 1, 1);
}

uint64_t OUTLINED_FUNCTION_14()
{
  uint64_t v0;

  __swift_project_boxed_opaque_existential_1(*(_QWORD **)(v0 + 48), *(_QWORD *)(*(_QWORD *)(v0 + 48) + 24));
  return sub_2472A8604();
}

char *OUTLINED_FUNCTION_15@<X0>(unint64_t a1@<X8>)
{
  int64_t v1;

  return sub_2472A4A08((char *)(a1 > 1), v1, 1);
}

size_t OUTLINED_FUNCTION_16@<X0>(unint64_t a1@<X8>)
{
  int64_t v1;

  return sub_2472A4A24(a1 > 1, v1, 1);
}

uint64_t OUTLINED_FUNCTION_17@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;

  *(_QWORD *)(v18 + 16) = v16;
  return v17(v18 + a16 + v19 * a15);
}

uint64_t OUTLINED_FUNCTION_19()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_20()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9, unsigned int a10)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v12 + 104))(v10, a10, v11);
}

char *OUTLINED_FUNCTION_24@<X0>(uint64_t a1@<X8>)
{
  return sub_2472A4A08(0, a1 + 1, 1);
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t v0;
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(v1, 1, v0);
}

uint64_t OUTLINED_FUNCTION_26()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 72);
}

uint64_t OUTLINED_FUNCTION_27@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_28()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_29()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_31()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_32()
{
  return sub_2472A882C();
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_35@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_36()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_39(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(void))(a10 + 32))();
}

uint64_t OUTLINED_FUNCTION_40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  return (*(uint64_t (**)(void))(a10 + 8))();
}

uint64_t OUTLINED_FUNCTION_41()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_42()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_43()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_44()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_45()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_46(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, v2, v1);
}

uint64_t OUTLINED_FUNCTION_47(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v2;
  uint64_t v3;

  return sub_2472A26A0(v3, a2, v2);
}

uint64_t OUTLINED_FUNCTION_48()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_49()
{
  return swift_task_dealloc();
}

uint64_t sub_2472A5104(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_63(a1, a2);
  *(_QWORD *)(v2 + 48) = OUTLINED_FUNCTION_21_0(v3);
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_2472A5138()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;

  OUTLINED_FUNCTION_33_0();
  sub_2472A5188();
  v4 = v3;
  OUTLINED_FUNCTION_29_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  swift_task_dealloc();
  return OUTLINED_FUNCTION_14_0(v4 & 1, *(uint64_t (**)(void))(v1 + 8));
}

void sub_2472A5188()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
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
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  char v34;
  void (*v35)(char *, uint64_t, uint64_t);
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  size_t v40;
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
  void (*v57)(uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unsigned int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  char *v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  OUTLINED_FUNCTION_40_0();
  v2 = v1;
  v63 = v3;
  v64 = OUTLINED_FUNCTION_37_0();
  v61 = *(_QWORD *)(v64 - 8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_1_1();
  v59 = v5;
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_24_0();
  v60 = v7;
  v71 = sub_2472A858C();
  v68 = *(_QWORD *)(v71 - 8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v8);
  v70 = OUTLINED_FUNCTION_13_0(v9, v58);
  v66 = *(_QWORD *)(v70 - 8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_5_0();
  v69 = v11;
  v76 = OUTLINED_FUNCTION_17_0();
  v12 = *(_QWORD *)(v76 - 8);
  MEMORY[0x24BDAC7A8](v76);
  v78 = (char *)&v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_24_0();
  v77 = v15;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257686510);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_27_0(v17, v58);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576864B0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_1_1();
  v67 = v19;
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_24_0();
  v22 = OUTLINED_FUNCTION_19_0(v21);
  v23 = *(_QWORD *)(v22 - 8);
  MEMORY[0x24BDAC7A8](v22);
  v79 = (char *)&v58 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_45_0();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2472A8604();
  v26 = OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_12_0();
  v27 = MEMORY[0x24BEE4AF8];
  v87 = MEMORY[0x24BEE4AF8];
  v75 = *(_QWORD *)(v26 + 16);
  if (!v75)
  {
LABEL_18:
    swift_bridgeObjectRelease();
    v41 = v65;
    sub_2472A2694(v27, v65);
    OUTLINED_FUNCTION_54();
    v42 = OUTLINED_FUNCTION_7_0(v41, 1, v22);
    if (v33)
    {
      OUTLINED_FUNCTION_39_0(v42, &qword_257686510);
      v46 = v62;
      OUTLINED_FUNCTION_53();
      v47 = v64;
      __swift_storeEnumTagSinglePayload(v43, v44, v45, v64);
    }
    else
    {
      v46 = v62;
      sub_2472A86AC();
      OUTLINED_FUNCTION_20_0(v41, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
      v47 = v64;
    }
    v48 = v69;
    v49 = OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_67(v49, *MEMORY[0x24BDCF230]);
    v82 = OUTLINED_FUNCTION_69();
    OUTLINED_FUNCTION_68();
    OUTLINED_FUNCTION_43_0(v48);
    v50 = OUTLINED_FUNCTION_56();
    OUTLINED_FUNCTION_67(v50, *MEMORY[0x24BDCF278]);
    v51 = OUTLINED_FUNCTION_69();
    OUTLINED_FUNCTION_68();
    OUTLINED_FUNCTION_43_0(v48);
    v52 = v67;
    sub_2472A4D44(v46, v67, &qword_2576864B0);
    OUTLINED_FUNCTION_7_0(v52, 1, v47);
    if (v33)
    {
      sub_2472A4D0C(v46, &qword_2576864B0);
    }
    else
    {
      v54 = v61;
      v55 = v60;
      OUTLINED_FUNCTION_30_0(v60, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v61 + 32));
      if ((unint64_t)(v82 - 5) <= 4 && (unint64_t)(v51 - 7) >= 0xFFFFFFFFFFFFFFFBLL)
      {
        v56 = v59;
        sub_2472A8724();
        sub_2472A8748();
        v57 = *(void (**)(uint64_t, uint64_t))(v54 + 8);
        v57(v56, v47);
        v57(v55, v47);
        sub_2472A4D0C(v46, &qword_2576864B0);
        goto LABEL_28;
      }
      v53 = (*(uint64_t (**)(uint64_t, uint64_t))(v54 + 8))(v55, v47);
    }
    OUTLINED_FUNCTION_39_0(v53, &qword_2576864B0);
LABEL_28:
    OUTLINED_FUNCTION_3_0();
    return;
  }
  v28 = 0;
  v73 = *MEMORY[0x24BE57290];
  v72 = v12;
  v29 = (uint64_t)v78;
  v82 = v22;
  v74 = v26;
  while (v28 < *(_QWORD *)(v26 + 16))
  {
    v30 = (*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
    v80 = *(_QWORD *)(v23 + 72);
    v81 = v30;
    OUTLINED_FUNCTION_57(v0, v26 + v30 + v80 * v28, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v23 + 16));
    v31 = v77;
    v32 = v0;
    sub_2472A86B8();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v12 + 104))(v29, v73, v76);
    sub_2472A79E0(&qword_2576864B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE57320], MEMORY[0x24BE57348]);
    OUTLINED_FUNCTION_41_0();
    OUTLINED_FUNCTION_41_0();
    v33 = v85 == v83 && v86 == v84;
    if (v33)
    {
      OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_48_0(v29);
      OUTLINED_FUNCTION_48_0(v31);
LABEL_11:
      v35 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 32);
      v0 = v32;
      v35(v79, v32, v82);
      v36 = v87;
      if ((OUTLINED_FUNCTION_32_0() & 1) == 0)
      {
        OUTLINED_FUNCTION_8_0();
        v36 = v87;
      }
      v26 = v74;
      v38 = *(_QWORD *)(v36 + 16);
      v37 = *(_QWORD *)(v36 + 24);
      if (v38 >= v37 >> 1)
      {
        v40 = OUTLINED_FUNCTION_42_0(v37);
        OUTLINED_FUNCTION_10_0(v40, v38 + 1);
        v36 = v87;
      }
      *(_QWORD *)(v36 + 16) = v38 + 1;
      v39 = v36 + v81 + v38 * v80;
      v22 = v82;
      v35((char *)v39, (uint64_t)v79, v82);
      v87 = v36;
      v12 = v72;
      goto LABEL_16;
    }
    v34 = OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_48_0(v29);
    OUTLINED_FUNCTION_48_0(v31);
    if ((v34 & 1) != 0)
      goto LABEL_11;
    v0 = v32;
    v22 = v82;
    OUTLINED_FUNCTION_20_0(v32, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
    v26 = v74;
LABEL_16:
    ++v28;
    v29 = (uint64_t)v78;
    if (v75 == v28)
    {
      v27 = v87;
      goto LABEL_18;
    }
  }
  __break(1u);
}

uint64_t type metadata accessor for MapsCreateRoutePlanFilter()
{
  return objc_opt_self();
}

uint64_t sub_2472A57B8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2472A7A1C;
  return sub_2472A5104((uint64_t)v4, a2);
}

uint64_t sub_2472A5808(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v3 = OUTLINED_FUNCTION_63(a1, a2);
  *(_QWORD *)(v2 + 48) = OUTLINED_FUNCTION_21_0(v3);
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_2472A583C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  char v4;

  OUTLINED_FUNCTION_33_0();
  sub_2472A588C();
  v4 = v3;
  OUTLINED_FUNCTION_29_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  swift_task_dealloc();
  return OUTLINED_FUNCTION_14_0(v4 & 1, *(uint64_t (**)(void))(v1 + 8));
}

void sub_2472A588C()
{
  _QWORD *v0;
  _QWORD *v1;
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
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  BOOL v28;
  char v29;
  void (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  size_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[4];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;

  OUTLINED_FUNCTION_40_0();
  v1 = v0;
  v44[1] = v2;
  v3 = sub_2472A858C();
  v49 = *(_QWORD *)(v3 - 8);
  v50 = v3;
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v4);
  v6 = OUTLINED_FUNCTION_13_0(v5, v44[0]);
  v46 = *(_QWORD *)(v6 - 8);
  v47 = v6;
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_5_0();
  v45 = v8;
  v9 = OUTLINED_FUNCTION_17_0();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v56 = (char *)v44 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v44 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257686510);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_6_0(v16, v44[0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576864B0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_18_0(v18, v44[0]);
  v19 = sub_2472A86C4();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v57 = (char *)v44 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_24_0();
  v60 = v23;
  __swift_project_boxed_opaque_existential_1(v1, v1[3]);
  sub_2472A8604();
  v24 = OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_12_0();
  v65 = MEMORY[0x24BEE4AF8];
  v55 = *(_QWORD *)(v24 + 16);
  if (v55)
  {
    v25 = 0;
    v51 = *MEMORY[0x24BE57290];
    v53 = v14;
    v54 = v10;
    v26 = (uint64_t)v56;
    v52 = v24;
    while (1)
    {
      if (v25 >= *(_QWORD *)(v24 + 16))
      {
        __break(1u);
        return;
      }
      v27 = (*(unsigned __int8 *)(v20 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
      v58 = *(_QWORD *)(v20 + 72);
      v59 = v27;
      (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 16))(v60, v24 + v27 + v58 * v25, v19);
      sub_2472A86B8();
      (*(void (**)(uint64_t, _QWORD, uint64_t))(v54 + 104))(v26, v51, v9);
      sub_2472A79E0(&qword_2576864B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE57320], MEMORY[0x24BE57348]);
      OUTLINED_FUNCTION_58();
      OUTLINED_FUNCTION_58();
      v28 = v63 == v61 && v64 == v62;
      if (v28)
        break;
      v29 = OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_12_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_46_0(v26);
      OUTLINED_FUNCTION_46_0((uint64_t)v14);
      if ((v29 & 1) != 0)
        goto LABEL_11;
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v60, v19);
      v24 = v52;
LABEL_16:
      ++v25;
      v26 = (uint64_t)v56;
      v14 = v53;
      if (v55 == v25)
        goto LABEL_17;
    }
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_46_0(v26);
    OUTLINED_FUNCTION_46_0((uint64_t)v14);
LABEL_11:
    v30 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 32);
    v30(v57, v60, v19);
    v31 = v65;
    if ((OUTLINED_FUNCTION_32_0() & 1) == 0)
    {
      OUTLINED_FUNCTION_8_0();
      v31 = v65;
    }
    v24 = v52;
    v33 = *(_QWORD *)(v31 + 16);
    v32 = *(_QWORD *)(v31 + 24);
    if (v33 >= v32 >> 1)
    {
      v34 = OUTLINED_FUNCTION_42_0(v32);
      OUTLINED_FUNCTION_10_0(v34, v33 + 1);
      v31 = v65;
    }
    *(_QWORD *)(v31 + 16) = v33 + 1;
    v30((char *)(v31 + v59 + v33 * v58), (uint64_t)v57, v19);
    v65 = v31;
    goto LABEL_16;
  }
LABEL_17:
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_35_0();
  OUTLINED_FUNCTION_54();
  v35 = OUTLINED_FUNCTION_7_0(v24, 1, v19);
  v36 = v44[3];
  if (v28)
  {
    OUTLINED_FUNCTION_49_0(v35, &qword_257686510);
    OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_53();
    __swift_storeEnumTagSinglePayload(v37, v38, v39, v40);
  }
  else
  {
    sub_2472A86AC();
    (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v24, v19);
  }
  v41 = v45;
  OUTLINED_FUNCTION_56();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v49 + 104))(v48, *MEMORY[0x24BDCF230], v50);
  v42 = sub_2472A8598();
  OUTLINED_FUNCTION_11_0();
  (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v41, v47);
  if ((unint64_t)(v42 - 12) <= 7)
  {
    v43 = OUTLINED_FUNCTION_37_0();
    OUTLINED_FUNCTION_7_0(v36, 1, v43);
  }
  sub_2472A4D0C(v36, &qword_2576864B0);
  OUTLINED_FUNCTION_3_0();
}

uint64_t type metadata accessor for MapsSearchNearbyFilter()
{
  return objc_opt_self();
}

uint64_t sub_2472A5D24(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2472A7A1C;
  return sub_2472A5808((uint64_t)v4, a2);
}

uint64_t sub_2472A5D74(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = v2;
  return OUTLINED_FUNCTION_26_0();
}

uint64_t sub_2472A5D84()
{
  uint64_t v0;
  char v1;

  sub_2472A5DB4();
  return OUTLINED_FUNCTION_25_0(v1 & 1, *(uint64_t (**)(void))(v0 + 8));
}

void sub_2472A5DB4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;
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
  char *v20;
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
  unint64_t v32;
  unint64_t v33;
  BOOL v34;
  char v35;
  void (*v36)(uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  size_t v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t, uint64_t, uint64_t);
  uint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  void (*v69)(uint64_t, uint64_t);
  uint64_t v70;
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
  unsigned int v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;

  OUTLINED_FUNCTION_40_0();
  v2 = v1;
  v72 = v3;
  v70 = v4;
  v74 = sub_2472A86F4();
  v73 = *(_QWORD *)(v74 - 8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_5_0();
  v71 = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257686510);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_6_0(v8, v70);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576864B0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_18_0(v10, v70);
  v80 = sub_2472A8754();
  v77 = *(_QWORD *)(v80 - 8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v11);
  v75 = (uint64_t)&v70 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_24_0();
  v76 = v14;
  v90 = OUTLINED_FUNCTION_17_0();
  v15 = *(_QWORD *)(v90 - 8);
  v16 = MEMORY[0x24BDAC7A8](v90);
  v18 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v70 - v19;
  v21 = sub_2472A86C4();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_1_1();
  v88 = v23;
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_62();
  v81 = v25;
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v26);
  OUTLINED_FUNCTION_62();
  v92 = v27;
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v28);
  OUTLINED_FUNCTION_45_0();
  __swift_project_boxed_opaque_existential_1(v2, v2[3]);
  sub_2472A8604();
  v29 = sub_2472A87B4();
  swift_bridgeObjectRelease();
  v30 = MEMORY[0x24BEE4AF8];
  v99 = MEMORY[0x24BEE4AF8];
  v31 = *(_QWORD *)(v29 + 16);
  v91 = v21;
  v89 = v31;
  if (v31)
  {
    v32 = 0;
    v82 = *MEMORY[0x24BE572E8];
    v86 = v18;
    v87 = v15;
    v84 = v22;
    v85 = v20;
    v83 = v29;
    while (1)
    {
      if (v32 >= *(_QWORD *)(v29 + 16))
      {
        __break(1u);
        goto LABEL_47;
      }
      v33 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
      v93 = *(_QWORD *)(v22 + 72);
      v94 = v33;
      OUTLINED_FUNCTION_57(v0, v29 + v33 + v93 * v32, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 16));
      sub_2472A86B8();
      (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v18, v82, v90);
      sub_2472A79E0(&qword_2576864B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE57320], MEMORY[0x24BE57348]);
      OUTLINED_FUNCTION_59();
      OUTLINED_FUNCTION_59();
      v34 = v97 == v95 && v98 == v96;
      if (v34)
        break;
      v35 = OUTLINED_FUNCTION_28_0();
      OUTLINED_FUNCTION_12_0();
      swift_bridgeObjectRelease();
      OUTLINED_FUNCTION_47_0((uint64_t)v18);
      OUTLINED_FUNCTION_47_0((uint64_t)v20);
      if ((v35 & 1) != 0)
        goto LABEL_11;
      v22 = v84;
      OUTLINED_FUNCTION_20_0(v0, *(uint64_t (**)(uint64_t, uint64_t))(v84 + 8));
      v20 = v85;
      v18 = v86;
      v29 = v83;
LABEL_16:
      ++v32;
      v15 = v87;
      if (v89 == v32)
      {
        v42 = v99;
        v30 = MEMORY[0x24BEE4AF8];
        goto LABEL_19;
      }
    }
    OUTLINED_FUNCTION_16_0();
    OUTLINED_FUNCTION_47_0((uint64_t)v18);
    OUTLINED_FUNCTION_47_0((uint64_t)v20);
LABEL_11:
    v22 = v84;
    v36 = *(void (**)(uint64_t, uint64_t, uint64_t))(v84 + 32);
    v36(v92, v0, v21);
    v37 = v99;
    if ((OUTLINED_FUNCTION_32_0() & 1) == 0)
    {
      OUTLINED_FUNCTION_8_0();
      v37 = v99;
    }
    v20 = v85;
    v18 = v86;
    v29 = v83;
    v39 = *(_QWORD *)(v37 + 16);
    v38 = *(_QWORD *)(v37 + 24);
    if (v39 >= v38 >> 1)
    {
      v41 = OUTLINED_FUNCTION_42_0(v38);
      OUTLINED_FUNCTION_10_0(v41, v39 + 1);
      v37 = v99;
    }
    *(_QWORD *)(v37 + 16) = v39 + 1;
    v40 = v37 + v94 + v39 * v93;
    v21 = v91;
    v36(v40, v92, v91);
    v99 = v37;
    goto LABEL_16;
  }
  v42 = MEMORY[0x24BEE4AF8];
LABEL_19:
  swift_bridgeObjectRelease();
  v97 = v30;
  v43 = *(_QWORD *)(v42 + 16);
  v44 = v81;
  if (!v43)
  {
LABEL_31:
    OUTLINED_FUNCTION_23_0();
    v53 = v78;
    sub_2472A2694(v30, v78);
    swift_release();
    OUTLINED_FUNCTION_7_0(v53, 1, v21);
    if (v34)
    {
      sub_2472A4D0C(v53, &qword_257686510);
      OUTLINED_FUNCTION_53();
      v60 = __swift_storeEnumTagSinglePayload(v54, v55, v56, v80);
    }
    else
    {
      v57 = v79;
      sub_2472A86AC();
      OUTLINED_FUNCTION_15_0();
      v58 = v80;
      v60 = OUTLINED_FUNCTION_7_0(v57, 1, v80);
      if (!v59)
      {
        v61 = v57;
        v62 = v77;
        v63 = v76;
        OUTLINED_FUNCTION_66(v76, v61, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v77 + 32));
        v64 = v75;
        OUTLINED_FUNCTION_66(v75, v63, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v62 + 16));
        v65 = (*(uint64_t (**)(uint64_t, uint64_t))(v62 + 88))(v64, v58);
        if (v65 == *MEMORY[0x24BEB99B0])
        {
          OUTLINED_FUNCTION_52(v64, *(uint64_t (**)(uint64_t, uint64_t))(v62 + 96));
          v66 = swift_projectBox();
          OUTLINED_FUNCTION_64(v71, v66, *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v73 + 16));
          OUTLINED_FUNCTION_23_0();
          if (sub_2472A86E8() != v70 || v67 != v72)
            OUTLINED_FUNCTION_28_0();
          swift_bridgeObjectRelease();
          OUTLINED_FUNCTION_11_0();
          (*(void (**)(uint64_t, uint64_t))(v77 + 8))(v76, v80);
        }
        else
        {
          v69 = *(void (**)(uint64_t, uint64_t))(v62 + 8);
          v69(v63, v58);
          v69(v64, v58);
        }
        goto LABEL_37;
      }
    }
    OUTLINED_FUNCTION_39_0(v60, &qword_2576864B0);
LABEL_37:
    OUTLINED_FUNCTION_3_0();
    return;
  }
  v45 = 0;
  v94 = *(_QWORD *)(v42 + 16);
  while (v45 < *(_QWORD *)(v42 + 16))
  {
    v46 = (*(unsigned __int8 *)(v22 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
    v47 = *(_QWORD *)(v22 + 72);
    OUTLINED_FUNCTION_57(v44, v42 + v46 + v47 * v45, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v22 + 16));
    if ((sub_2472A64A0() & 1) != 0)
    {
      v48 = *(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32);
      v48(v88, v44, v21);
      v49 = v97;
      if ((OUTLINED_FUNCTION_32_0() & 1) == 0)
      {
        OUTLINED_FUNCTION_10_0(0, *(_QWORD *)(v49 + 16) + 1);
        v49 = v97;
      }
      v51 = *(_QWORD *)(v49 + 16);
      v50 = *(_QWORD *)(v49 + 24);
      if (v51 >= v50 >> 1)
      {
        OUTLINED_FUNCTION_10_0(v50 > 1, v51 + 1);
        v49 = v97;
      }
      *(_QWORD *)(v49 + 16) = v51 + 1;
      v52 = v49 + v46 + v51 * v47;
      v21 = v91;
      v48(v52, v88, v91);
      v97 = v49;
      v44 = v81;
      v43 = v94;
    }
    else
    {
      OUTLINED_FUNCTION_15_0();
    }
    if (v43 == ++v45)
    {
      v30 = v97;
      goto LABEL_31;
    }
  }
LABEL_47:
  __break(1u);
  OUTLINED_FUNCTION_15_0();
  OUTLINED_FUNCTION_23_0();
  swift_release();
  __break(1u);
}

uint64_t sub_2472A64A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  char v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v0 = sub_2472A8760();
  v37 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v34 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576864C8);
  MEMORY[0x24BDAC7A8](v36);
  v38 = (uint64_t)&v33 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2472A85EC();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576864B0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576864D0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v35 = (uint64_t)&v33 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (uint64_t *)((char *)&v33 - v14);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v33 - v16;
  sub_2472A86AC();
  v18 = sub_2472A8754();
  if (__swift_getEnumTagSinglePayload((uint64_t)v9, 1, v18) == 1)
  {
    sub_2472A4D0C((uint64_t)v9, &qword_2576864B0);
    v19 = 1;
  }
  else
  {
    sub_2472A8730();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v9, v18);
    v19 = 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v17, v19, 1, v0);
  v20 = (_QWORD *)swift_allocObject();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BEA7428], v3);
  v21 = sub_2472A85E0();
  v23 = v22;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v20[2] = v21;
  v20[3] = v23;
  v20[4] = 0xD000000000000017;
  v20[5] = 0x80000002472A9F50;
  *v15 = v20;
  v24 = v37;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v37 + 104))(v15, *MEMORY[0x24BEB9CF8], v0);
  __swift_storeEnumTagSinglePayload((uint64_t)v15, 0, 1, v0);
  v25 = v38;
  v26 = v38 + *(int *)(v36 + 48);
  v27 = &qword_2576864D0;
  sub_2472A4D44((uint64_t)v17, v38, &qword_2576864D0);
  sub_2472A4D44((uint64_t)v15, v26, &qword_2576864D0);
  if (__swift_getEnumTagSinglePayload(v25, 1, v0) == 1)
  {
    sub_2472A4D0C((uint64_t)v15, &qword_2576864D0);
    sub_2472A4D0C((uint64_t)v17, &qword_2576864D0);
    if (__swift_getEnumTagSinglePayload(v26, 1, v0) == 1)
    {
      v28 = -1;
    }
    else
    {
      v27 = &qword_2576864C8;
      v28 = 0;
    }
  }
  else
  {
    v29 = v35;
    sub_2472A4D44(v25, v35, &qword_2576864D0);
    if (__swift_getEnumTagSinglePayload(v26, 1, v0) == 1)
    {
      sub_2472A4D0C((uint64_t)v15, &qword_2576864D0);
      sub_2472A4D0C((uint64_t)v17, &qword_2576864D0);
      (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v29, v0);
      v28 = 0;
      v27 = &qword_2576864C8;
    }
    else
    {
      v30 = v34;
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 32))(v34, v26, v0);
      sub_2472A79E0(&qword_2576864D8, (uint64_t (*)(uint64_t))MEMORY[0x24BEB9D20], MEMORY[0x24BEB9D40]);
      v28 = sub_2472A8784();
      v31 = *(void (**)(char *, uint64_t))(v24 + 8);
      v31(v30, v0);
      v27 = &qword_2576864D0;
      sub_2472A4D0C((uint64_t)v15, &qword_2576864D0);
      sub_2472A4D0C((uint64_t)v17, &qword_2576864D0);
      v31((char *)v29, v0);
    }
  }
  sub_2472A4D0C(v25, v27);
  return v28 & 1;
}

uint64_t sub_2472A6910()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WeatherLocationEntityCurrentFilter()
{
  return objc_opt_self();
}

uint64_t sub_2472A6954(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;

  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2472A7A1C;
  return sub_2472A5D74((uint64_t)v4, a2);
}

uint64_t sub_2472A69A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[18] = a2;
  v3[19] = v2;
  v3[17] = a1;
  return OUTLINED_FUNCTION_26_0();
}

uint64_t sub_2472A69B8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (_QWORD *)v0[17];
  v2 = v1[3];
  v0[20] = v2;
  v0[21] = v1[4];
  v0[22] = __swift_project_boxed_opaque_existential_1(v1, v2);
  v0[23] = sub_2472A85F8();
  swift_getObjectType();
  v3 = (_QWORD *)swift_task_alloc();
  v0[24] = v3;
  *v3 = v0;
  v3[1] = sub_2472A6A60;
  return sub_2472A867C();
}

uint64_t sub_2472A6A60()
{
  OUTLINED_FUNCTION_38_0();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_2();
}

uint64_t sub_2472A6AA4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *boxed_opaque_existential_1;

  v0[25] = sub_2472A85F8();
  v0[26] = v1;
  v2 = v0[5];
  v3 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v2);
  v0[10] = v2;
  v0[11] = *(_QWORD *)(v3 + 8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v0 + 7);
  OUTLINED_FUNCTION_30_0((uint64_t)boxed_opaque_existential_1, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16));
  v0[27] = swift_getObjectType();
  sub_2472A87C0();
  return OUTLINED_FUNCTION_36_0();
}

uint64_t sub_2472A6B58()
{
  uint64_t v0;

  sub_2472A8688();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0(v0 + 56);
  OUTLINED_FUNCTION_22();
  return OUTLINED_FUNCTION_36_0();
}

uint64_t sub_2472A6BC8()
{
  uint64_t v0;
  char v1;
  char v2;

  if (*(_QWORD *)(v0 + 120))
  {
    sub_2472A8670();
    swift_dynamicCast();
  }
  else
  {
    sub_2472A4D0C(v0 + 96, &qword_2576867E0);
  }
  sub_2472A6C78();
  v2 = v1;
  OUTLINED_FUNCTION_23_0();
  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v2 & 1);
}

void sub_2472A6C78()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
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
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  void (*v52)(char *, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t, uint64_t);
  uint64_t v63;
  char v64;
  void (*v65)(uint64_t, uint64_t);
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  uint64_t v73;
  unint64_t v74;
  char v76;
  void (*v77)(uint64_t, uint64_t, uint64_t);
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  uint64_t v101;
  void (*v102)(uint64_t, uint64_t);
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
  _QWORD *v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
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

  OUTLINED_FUNCTION_40_0();
  v104 = v0;
  v117 = v2;
  v4 = v3;
  v110 = sub_2472A8718();
  v108 = *(_QWORD *)(v110 - 8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_5_0();
  v109 = v6;
  v107 = sub_2472A870C();
  v106 = *(_QWORD *)(v107 - 8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_5_0();
  v105 = v8;
  v9 = OUTLINED_FUNCTION_17_0();
  v120 = *(_QWORD *)(v9 - 8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_1_1();
  v127 = v11;
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v103 - v13;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257686510);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_6_0(v16, v103);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576864B0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v17);
  OUTLINED_FUNCTION_27_0(v18, v103);
  v118 = OUTLINED_FUNCTION_37_0();
  v113 = *(_QWORD *)(v118 - 8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v19);
  OUTLINED_FUNCTION_1_1();
  v111 = v20;
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v21);
  OUTLINED_FUNCTION_24_0();
  v126 = OUTLINED_FUNCTION_19_0(v22);
  v130 = *(_QWORD *)(v126 - 8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v23);
  OUTLINED_FUNCTION_1_1();
  v128 = v24;
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v25);
  OUTLINED_FUNCTION_24_0();
  v129 = v26;
  v27 = sub_2472A85D4();
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_5_0();
  v115 = v29;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_2576867E8);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v31);
  OUTLINED_FUNCTION_1_1();
  v122 = v32;
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v33);
  OUTLINED_FUNCTION_45_0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2576867F0);
  OUTLINED_FUNCTION_0_1();
  MEMORY[0x24BDAC7A8](v34);
  v114 = (uint64_t)&v103 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  OUTLINED_FUNCTION_4_0();
  MEMORY[0x24BDAC7A8](v36);
  OUTLINED_FUNCTION_62();
  v124 = (char *)v37;
  OUTLINED_FUNCTION_4_0();
  v39 = MEMORY[0x24BDAC7A8](v38);
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_62();
  v41 = v40;
  OUTLINED_FUNCTION_4_0();
  v43 = MEMORY[0x24BDAC7A8](v42);
  v45 = (char *)&v103 - v44;
  MEMORY[0x24BDAC7A8](v43);
  v47 = (char *)&v103 - v46;
  v125 = v48;
  if (v4)
  {
    sub_2472A8664();
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257686800);
    v49 = swift_dynamicCast() ^ 1;
    v50 = v47;
  }
  else
  {
    v50 = (char *)&v103 - v46;
    v49 = 1;
  }
  OUTLINED_FUNCTION_34_0((uint64_t)v50, v49);
  v51 = *MEMORY[0x24BEA71A0];
  v123 = v28;
  v52 = *(void (**)(char *, uint64_t, uint64_t))(v28 + 104);
  v52(v45, v51, v27);
  OUTLINED_FUNCTION_34_0((uint64_t)v45, 0);
  v121 = v30;
  v53 = v1 + *(int *)(v30 + 48);
  v119 = v47;
  sub_2472A4D44((uint64_t)v47, v1, &qword_2576867F0);
  sub_2472A4D44((uint64_t)v45, v53, &qword_2576867F0);
  v54 = OUTLINED_FUNCTION_2_0(v1);
  if (v59)
  {
    OUTLINED_FUNCTION_49_0(v54, &qword_2576867F0);
    OUTLINED_FUNCTION_2_0(v53);
    if (v59)
    {
      sub_2472A4D0C(v1, &qword_2576867F0);
      v55 = v125;
      sub_2472A4D44((uint64_t)v119, v125, &qword_2576867F0);
      v56 = v120;
      v57 = v127;
      v58 = v118;
LABEL_20:
      sub_2472A4D0C(v55, &qword_2576867F0);
      goto LABEL_21;
    }
    goto LABEL_12;
  }
  sub_2472A4D44(v1, v41, &qword_2576867F0);
  v60 = OUTLINED_FUNCTION_2_0(v53);
  if (v59)
  {
    OUTLINED_FUNCTION_49_0(v60, &qword_2576867F0);
    OUTLINED_FUNCTION_29_0(v41, *(uint64_t (**)(uint64_t, uint64_t))(v123 + 8));
LABEL_12:
    sub_2472A4D0C(v1, &qword_2576867E8);
    v55 = v125;
    sub_2472A4D44((uint64_t)v119, v125, &qword_2576867F0);
    v57 = v127;
    v58 = v118;
    goto LABEL_15;
  }
  v61 = v123;
  v62 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v123 + 32);
  v103 = v41;
  v63 = v115;
  OUTLINED_FUNCTION_51(v115, v62);
  sub_2472A79E0(&qword_2576867F8, (uint64_t (*)(uint64_t))MEMORY[0x24BEA71D8], MEMORY[0x24BEA71E8]);
  v64 = OUTLINED_FUNCTION_65();
  v65 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
  v65(v63, v27);
  sub_2472A4D0C((uint64_t)v45, &qword_2576867F0);
  v65(v103, v27);
  v58 = v118;
  sub_2472A4D0C(v1, &qword_2576867F0);
  v55 = v125;
  sub_2472A4D44((uint64_t)v119, v125, &qword_2576867F0);
  v57 = v127;
  if ((v64 & 1) != 0)
  {
    v56 = v120;
    goto LABEL_20;
  }
LABEL_15:
  v66 = (uint64_t)v124;
  v52(v124, *MEMORY[0x24BEA71B0], v27);
  v67 = v66;
  OUTLINED_FUNCTION_34_0(v66, 0);
  v68 = v122;
  v69 = v122 + *(int *)(v121 + 48);
  sub_2472A4D44(v55, v122, &qword_2576867F0);
  sub_2472A4D44(v67, v69, &qword_2576867F0);
  OUTLINED_FUNCTION_2_0(v68);
  if (v59)
  {
    OUTLINED_FUNCTION_31_0(v67);
    OUTLINED_FUNCTION_31_0(v55);
    OUTLINED_FUNCTION_2_0(v69);
    v56 = v120;
    if (v59)
    {
      v55 = v68;
      goto LABEL_20;
    }
LABEL_41:
    sub_2472A4D0C(v68, &qword_2576867E8);
    goto LABEL_49;
  }
  v81 = v114;
  sub_2472A4D44(v68, v114, &qword_2576867F0);
  OUTLINED_FUNCTION_2_0(v69);
  if (v82)
  {
    sub_2472A4D0C((uint64_t)v124, &qword_2576867F0);
    sub_2472A4D0C(v55, &qword_2576867F0);
    OUTLINED_FUNCTION_29_0(v81, *(uint64_t (**)(uint64_t, uint64_t))(v123 + 8));
    goto LABEL_41;
  }
  v90 = v115;
  OUTLINED_FUNCTION_51(v115, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v123 + 32));
  sub_2472A79E0(&qword_2576867F8, (uint64_t (*)(uint64_t))MEMORY[0x24BEA71D8], MEMORY[0x24BEA71E8]);
  LODWORD(v121) = OUTLINED_FUNCTION_65();
  OUTLINED_FUNCTION_43_0(v90);
  OUTLINED_FUNCTION_31_0((uint64_t)v124);
  OUTLINED_FUNCTION_31_0(v125);
  OUTLINED_FUNCTION_43_0(v81);
  OUTLINED_FUNCTION_31_0(v68);
  v56 = v120;
  if ((v121 & 1) == 0)
    goto LABEL_49;
LABEL_21:
  v70 = v117[4];
  __swift_project_boxed_opaque_existential_1(v117, v117[3]);
  sub_2472A8604();
  v71 = OUTLINED_FUNCTION_50();
  OUTLINED_FUNCTION_12_0();
  v133 = MEMORY[0x24BEE4AF8];
  v125 = *(_QWORD *)(v71 + 16);
  if (!v125)
  {
LABEL_42:
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_35_0();
    OUTLINED_FUNCTION_54();
    v83 = OUTLINED_FUNCTION_2_0(v70);
    if (v59)
    {
      OUTLINED_FUNCTION_49_0(v83, &qword_257686510);
      OUTLINED_FUNCTION_53();
      v89 = __swift_storeEnumTagSinglePayload(v84, v85, v86, v58);
    }
    else
    {
      v87 = v116;
      sub_2472A86AC();
      OUTLINED_FUNCTION_20_0(v70, *(uint64_t (**)(uint64_t, uint64_t))(v130 + 8));
      v89 = OUTLINED_FUNCTION_7_0(v87, 1, v58);
      if (!v88)
      {
        v91 = v113;
        v92 = v112;
        OUTLINED_FUNCTION_30_0(v112, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v113 + 32));
        v93 = v111;
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v91 + 16))(v111, v92, v58);
        v94 = (*(uint64_t (**)(uint64_t, uint64_t))(v91 + 88))(v93, v58);
        if (v94 == *MEMORY[0x24BEB9A00])
        {
          (*(void (**)(uint64_t, uint64_t))(v91 + 96))(v93, v58);
          v95 = swift_projectBox();
          v96 = v108;
          v97 = v109;
          v98 = v110;
          OUTLINED_FUNCTION_66(v109, v95, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v108 + 16));
          if ((*(unsigned int (**)(uint64_t, uint64_t))(v96 + 88))(v97, v98) == *MEMORY[0x24BEB9968])
          {
            OUTLINED_FUNCTION_52(v97, *(uint64_t (**)(uint64_t, uint64_t))(v96 + 96));
            OUTLINED_FUNCTION_64(v105, v97, *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(v106 + 32));
            OUTLINED_FUNCTION_23_0();
            v99 = (void *)sub_2472A8700();
            v100 = sub_2472A7974(v99);
            if (v101)
            {
              sub_2472A7768(v100, v101, *(_QWORD **)(v104 + 16));
              OUTLINED_FUNCTION_11_0();
              OUTLINED_FUNCTION_22_0();
              OUTLINED_FUNCTION_12_0();
            }
            else
            {
              OUTLINED_FUNCTION_11_0();
              OUTLINED_FUNCTION_22_0();
            }
          }
          else
          {
            OUTLINED_FUNCTION_22_0();
            OUTLINED_FUNCTION_52(v97, *(uint64_t (**)(uint64_t, uint64_t))(v96 + 8));
            OUTLINED_FUNCTION_23_0();
          }
        }
        else
        {
          v102 = *(void (**)(uint64_t, uint64_t))(v91 + 8);
          v102(v92, v58);
          v102(v93, v58);
        }
        goto LABEL_49;
      }
    }
    OUTLINED_FUNCTION_39_0(v89, &qword_2576864B0);
LABEL_49:
    sub_2472A4D0C((uint64_t)v119, &qword_2576867F0);
    OUTLINED_FUNCTION_3_0();
    return;
  }
  v72 = 0;
  LODWORD(v121) = *MEMORY[0x24BE57270];
  v123 = v9;
  v124 = v14;
  v73 = v126;
  v122 = v71;
  while (v72 < *(_QWORD *)(v71 + 16))
  {
    v74 = (*(unsigned __int8 *)(v130 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v130 + 80);
    v70 = *(_QWORD *)(v130 + 72);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v130 + 16))(v129, v71 + v74 + v70 * v72, v73);
    sub_2472A86B8();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v56 + 104))(v57, v121, v9);
    sub_2472A79E0(&qword_2576864B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE57320], MEMORY[0x24BE57348]);
    OUTLINED_FUNCTION_41_0();
    OUTLINED_FUNCTION_41_0();
    if (v134 == v131 && v135 == v132)
    {
      OUTLINED_FUNCTION_16_0();
      OUTLINED_FUNCTION_44_0();
      OUTLINED_FUNCTION_55();
LABEL_31:
      v77 = *(void (**)(uint64_t, uint64_t, uint64_t))(v130 + 32);
      v73 = v126;
      v77(v128, v129, v126);
      v78 = v133;
      if ((OUTLINED_FUNCTION_32_0() & 1) == 0)
      {
        OUTLINED_FUNCTION_10_0(0, *(_QWORD *)(v78 + 16) + 1);
        v78 = v133;
      }
      v9 = v123;
      v80 = *(_QWORD *)(v78 + 16);
      v79 = *(_QWORD *)(v78 + 24);
      if (v80 >= v79 >> 1)
      {
        OUTLINED_FUNCTION_10_0(v79 > 1, v80 + 1);
        v78 = v133;
      }
      *(_QWORD *)(v78 + 16) = v80 + 1;
      v77(v78 + v74 + v80 * v70, v128, v73);
      v133 = v78;
      v56 = v120;
      goto LABEL_36;
    }
    v76 = OUTLINED_FUNCTION_28_0();
    OUTLINED_FUNCTION_12_0();
    OUTLINED_FUNCTION_70();
    OUTLINED_FUNCTION_44_0();
    OUTLINED_FUNCTION_55();
    if ((v76 & 1) != 0)
      goto LABEL_31;
    v73 = v126;
    OUTLINED_FUNCTION_29_0(v129, *(uint64_t (**)(uint64_t, uint64_t))(v130 + 8));
    v9 = v123;
LABEL_36:
    v71 = v122;
    ++v72;
    v57 = v127;
    if (v125 == v72)
    {
      v58 = v118;
      goto LABEL_42;
    }
  }
  __break(1u);
}

uint64_t sub_2472A7768(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_2472A882C();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_2472A882C() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_2472A782C()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PointOfInterestFilter()
{
  return objc_opt_self();
}

uint64_t sub_2472A7870(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2472A78D0;
  return sub_2472A69A4(a1, a2);
}

uint64_t sub_2472A78D0(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_38_0();
  return OUTLINED_FUNCTION_25_0(a1, *(uint64_t (**)(void))(v1 + 8));
}

uint64_t sub_2472A790C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
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

uint64_t sub_2472A7974(void *a1)
{
  id v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, sel_category);

  if (!v2)
    return 0;
  v3 = sub_2472A8790();

  return v3;
}

void sub_2472A79E0(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x24957604C](a3, v5), a1);
  }
  OUTLINED_FUNCTION_37();
}

uint64_t OUTLINED_FUNCTION_2_0(uint64_t a1)
{
  uint64_t v1;

  return __swift_getEnumTagSinglePayload(a1, 1, v1);
}

void OUTLINED_FUNCTION_6_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 272) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_7_0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

size_t OUTLINED_FUNCTION_8_0()
{
  uint64_t v0;

  return sub_2472A4A24(0, *(_QWORD *)(v0 + 16) + 1, 1);
}

size_t OUTLINED_FUNCTION_10_0(size_t a1, int64_t a2)
{
  return sub_2472A4A24(a1, a2, 1);
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_12_0()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_13_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 232) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return sub_2472A85A4();
}

uint64_t OUTLINED_FUNCTION_14_0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_15_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return sub_2472A86A0();
}

uint64_t OUTLINED_FUNCTION_18_0@<X0>(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 264) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
  return 0;
}

uint64_t OUTLINED_FUNCTION_19_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
  return sub_2472A86C4();
}

uint64_t OUTLINED_FUNCTION_20_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_21_0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  *(_QWORD *)(v1 + 40) = *(_QWORD *)(a1 - 8);
  return swift_task_alloc();
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_23_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_25_0(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return swift_task_switch();
}

void OUTLINED_FUNCTION_27_0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 280) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t OUTLINED_FUNCTION_28_0()
{
  return sub_2472A882C();
}

uint64_t OUTLINED_FUNCTION_29_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_30_0@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v2, v3);
}

void OUTLINED_FUNCTION_31_0(uint64_t a1)
{
  uint64_t *v1;

  sub_2472A4D0C(a1, v1);
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_33_0()
{
  return sub_2472A8568();
}

uint64_t OUTLINED_FUNCTION_34_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_35_0()
{
  uint64_t v0;
  uint64_t v1;

  return sub_2472A2694(v0, *(_QWORD *)(v1 - 272));
}

uint64_t OUTLINED_FUNCTION_36_0()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_37_0()
{
  return sub_2472A8754();
}

uint64_t OUTLINED_FUNCTION_38_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_39_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_2472A4D0C(v2, a2);
}

uint64_t OUTLINED_FUNCTION_41_0()
{
  return sub_2472A87A8();
}

BOOL OUTLINED_FUNCTION_42_0@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_43_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_44_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v2, v0);
}

uint64_t OUTLINED_FUNCTION_46_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_47_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

uint64_t OUTLINED_FUNCTION_48_0(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t);
  uint64_t v2;

  return v1(a1, v2);
}

void OUTLINED_FUNCTION_49_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_2472A4D0C(v2, a2);
}

uint64_t OUTLINED_FUNCTION_50()
{
  return sub_2472A87B4();
}

uint64_t OUTLINED_FUNCTION_51@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_52@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_54()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_55()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_56()
{
  return sub_2472A8580();
}

uint64_t OUTLINED_FUNCTION_57@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_58()
{
  return sub_2472A87A8();
}

uint64_t OUTLINED_FUNCTION_59()
{
  return sub_2472A87A8();
}

uint64_t OUTLINED_FUNCTION_63(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a2;
  *(_QWORD *)(v3 + 24) = v2;
  return sub_2472A8574();
}

uint64_t OUTLINED_FUNCTION_64@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, _QWORD)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, *(_QWORD *)(v3 - 256));
}

uint64_t OUTLINED_FUNCTION_65()
{
  return sub_2472A8784();
}

uint64_t OUTLINED_FUNCTION_66@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_67(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;

  return v2(v4, a2, v3);
}

uint64_t OUTLINED_FUNCTION_68()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_69()
{
  return sub_2472A8598();
}

uint64_t OUTLINED_FUNCTION_70()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_2472A7DD4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_2472A7DDC()
{
  unint64_t v0;

  v0 = sub_2472A8838();
  swift_bridgeObjectRelease();
  if (v0 >= 0x34)
    return 52;
  else
    return v0;
}

uint64_t sub_2472A7E2C(char a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v2 = sub_2472A85EC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, **((unsigned int **)&unk_251883288 + a1), v2);
  v6 = sub_2472A85E0();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return v6;
}

void *sub_2472A7EDC()
{
  return &unk_251883038;
}

uint64_t sub_2472A7EE8(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2472A7F24 + 4 * byte_2472A9190[a1]))(0xD000000000000017, 0x80000002472A9220);
}

uint64_t sub_2472A7F24()
{
  return 0x704F5F736B6F6F42;
}

uint64_t sub_2472A7F40()
{
  return 0x6C505F736B6F6F42;
}

uint64_t sub_2472A7F64()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_2472A8288()
{
  return 0x6F4D77654E5F5654;
}

void sub_2472A82A8()
{
  JUMPOUT(0x2472A82C4);
}

uint64_t sub_2472A82CC()
{
  return 0x65726168535F5654;
}

uint64_t sub_2472A82EC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2472A8324 + 4 * byte_2472A91C4[a1]))(0xD000000000000011, 0x80000002472AA070);
}

uint64_t sub_2472A8324()
{
  return 0x457070416B6F6F42;
}

uint64_t sub_2472A83E8()
{
  return 0x69746E4565746F4ELL;
}

uint64_t sub_2472A83F4()
{
  return 0x6E457265646C6F46;
}

uint64_t sub_2472A8404(uint64_t a1)
{
  return a1 - 1;
}

uint64_t sub_2472A8414()
{
  return 0x7469746E45676154;
}

uint64_t sub_2472A8430()
{
  return 0x746E457465737341;
}

uint64_t sub_2472A847C(uint64_t a1)
{
  return a1 + 1;
}

uint64_t sub_2472A84CC(uint64_t a1)
{
  return a1 + 4;
}

void sub_2472A84FC()
{
  JUMPOUT(0x2472A8508);
}

uint64_t sub_2472A8514()
{
  uint64_t result;

  sub_2472A85B0();
  swift_allocObject();
  result = MEMORY[0x249575CA4](0xD000000000000018, 0x80000002472A91D0);
  qword_257687590 = result;
  return result;
}

uint64_t sub_2472A8568()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_2472A8574()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_2472A8580()
{
  return MEMORY[0x24BDCF1B0]();
}

uint64_t sub_2472A858C()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_2472A8598()
{
  return MEMORY[0x24BDCF2D0]();
}

uint64_t sub_2472A85A4()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2472A85B0()
{
  return MEMORY[0x24BEA6F78]();
}

uint64_t sub_2472A85BC()
{
  return MEMORY[0x24BEA6F80]();
}

uint64_t sub_2472A85C8()
{
  return MEMORY[0x24BEA6FB8]();
}

uint64_t sub_2472A85D4()
{
  return MEMORY[0x24BEA71D8]();
}

uint64_t sub_2472A85E0()
{
  return MEMORY[0x24BEA7438]();
}

uint64_t sub_2472A85EC()
{
  return MEMORY[0x24BEA7440]();
}

uint64_t sub_2472A85F8()
{
  return MEMORY[0x24BEA7468]();
}

uint64_t sub_2472A8604()
{
  return MEMORY[0x24BEA7498]();
}

uint64_t sub_2472A8610()
{
  return MEMORY[0x24BEA7570]();
}

uint64_t sub_2472A861C()
{
  return MEMORY[0x24BEA75A0]();
}

uint64_t sub_2472A8628()
{
  return MEMORY[0x24BEA75A8]();
}

uint64_t sub_2472A8634()
{
  return MEMORY[0x24BEA75B0]();
}

uint64_t sub_2472A8640()
{
  return MEMORY[0x24BEA75F0]();
}

uint64_t sub_2472A864C()
{
  return MEMORY[0x24BEA7670]();
}

uint64_t sub_2472A8658()
{
  return MEMORY[0x24BEA76E0]();
}

uint64_t sub_2472A8664()
{
  return MEMORY[0x24BEA7728]();
}

uint64_t sub_2472A8670()
{
  return MEMORY[0x24BEA7750]();
}

uint64_t sub_2472A867C()
{
  return MEMORY[0x24BEA77E8]();
}

uint64_t sub_2472A8688()
{
  return MEMORY[0x24BEA77F8]();
}

uint64_t sub_2472A8694()
{
  return MEMORY[0x24BEA7870]();
}

uint64_t sub_2472A86A0()
{
  return MEMORY[0x24BE57320]();
}

uint64_t sub_2472A86AC()
{
  return MEMORY[0x24BE57778]();
}

uint64_t sub_2472A86B8()
{
  return MEMORY[0x24BE57790]();
}

uint64_t sub_2472A86C4()
{
  return MEMORY[0x24BE577B0]();
}

uint64_t sub_2472A86D0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2472A86DC()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2472A86E8()
{
  return MEMORY[0x24BEB9740]();
}

uint64_t sub_2472A86F4()
{
  return MEMORY[0x24BEB9760]();
}

uint64_t sub_2472A8700()
{
  return MEMORY[0x24BEB98B0]();
}

uint64_t sub_2472A870C()
{
  return MEMORY[0x24BEB98B8]();
}

uint64_t sub_2472A8718()
{
  return MEMORY[0x24BEB9970]();
}

uint64_t sub_2472A8724()
{
  return MEMORY[0x24BEB9998]();
}

uint64_t sub_2472A8730()
{
  return MEMORY[0x24BEB99A0]();
}

uint64_t sub_2472A873C()
{
  return MEMORY[0x24BEB99B8]();
}

uint64_t sub_2472A8748()
{
  return MEMORY[0x24BEB99D0]();
}

uint64_t sub_2472A8754()
{
  return MEMORY[0x24BEB9A18]();
}

uint64_t sub_2472A8760()
{
  return MEMORY[0x24BEB9D20]();
}

uint64_t sub_2472A876C()
{
  return MEMORY[0x24BEBA480]();
}

uint64_t sub_2472A8778()
{
  return MEMORY[0x24BEBA4B0]();
}

uint64_t sub_2472A8784()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2472A8790()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2472A879C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2472A87A8()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2472A87B4()
{
  return MEMORY[0x24BEA7888]();
}

uint64_t sub_2472A87C0()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2472A87CC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2472A87D8()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2472A87E4()
{
  return MEMORY[0x24BDD0580]();
}

uint64_t sub_2472A87F0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2472A87FC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2472A8808()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2472A8814()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2472A8820()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2472A882C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2472A8838()
{
  return MEMORY[0x24BEE3D50]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
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

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
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

