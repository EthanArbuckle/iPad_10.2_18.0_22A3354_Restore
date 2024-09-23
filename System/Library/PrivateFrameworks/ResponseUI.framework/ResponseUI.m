uint64_t sub_2454A8D68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_2454AA3E0();
  __swift_allocate_value_buffer(v0, qword_257477D00);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_257477D00);
  if (qword_257477C88 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_257477D18);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_2454A8E50()
{
  uint64_t result;

  sub_2454A8F2C();
  result = sub_2454AA41C();
  qword_257477C80 = result;
  return result;
}

uint64_t sub_2454A8EAC()
{
  uint64_t v0;
  id v1;

  v0 = sub_2454AA3E0();
  __swift_allocate_value_buffer(v0, qword_257477D18);
  __swift_project_value_buffer(v0, (uint64_t)qword_257477D18);
  if (qword_257477C78 != -1)
    swift_once();
  v1 = (id)qword_257477C80;
  return sub_2454AA3EC();
}

unint64_t sub_2454A8F2C()
{
  unint64_t result;

  result = qword_257477C90;
  if (!qword_257477C90)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257477C90);
  }
  return result;
}

id CodableCard.wrappedValue.getter()
{
  id *v0;

  return *v0;
}

void CodableCard.wrappedValue.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*CodableCard.wrappedValue.modify())()
{
  return nullsub_1;
}

uint64_t CodableCard.init(wrappedValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t CodableCard.init(from:)@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint8_t *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29[3];

  v28 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257477C98);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2454A93C4();
  sub_2454AA4F4();
  v8 = v2;
  v9 = 0x24BE84000uLL;
  if (!v2)
  {
    sub_2454A9E5C();
    sub_2454AA47C();
    v27 = 0;
    v10 = v29[0];
    v11 = v29[1];
    v12 = objc_allocWithZone(MEMORY[0x24BE850A0]);
    sub_2454A9EA0(v10, v11);
    v13 = (void *)sub_2454AA3BC();
    sub_2454A9EE4(v10, v11);
    v14 = objc_msgSend(v12, sel_initWithData_, v13);

    if (v14)
    {
      v15 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE84D80]), sel_initWithProtobuf_, v14);

      if (v15)
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        sub_2454A9EE4(v10, v11);
        goto LABEL_12;
      }
    }
    sub_2454A9F28();
    v8 = (void *)swift_allocError();
    swift_willThrow();
    sub_2454A9EE4(v10, v11);
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  if (qword_257477C70 != -1)
    swift_once();
  v16 = sub_2454AA3E0();
  __swift_project_value_buffer(v16, (uint64_t)qword_257477D00);
  v17 = v8;
  v18 = v8;
  v19 = sub_2454AA3D4();
  v20 = sub_2454AA410();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = swift_slowAlloc();
    v27 = 0;
    v22 = (uint8_t *)v21;
    v23 = swift_slowAlloc();
    v29[0] = v23;
    *(_DWORD *)v22 = 136315138;
    swift_getErrorValue();
    v24 = sub_2454AA494();
    v29[2] = sub_2454A981C(v24, v25, v29);
    v9 = 0x24BE84000;
    sub_2454AA428();
    swift_bridgeObjectRelease();
    MEMORY[0x2495353A4](v8);
    MEMORY[0x2495353A4](v8);
    _os_log_impl(&dword_2454A7000, v19, v20, "Failed to decode SFCard; creating an empty Object instead. Error: %s",
      v22,
      0xCu);
    swift_arrayDestroy();
    MEMORY[0x249535440](v23, -1, -1);
    MEMORY[0x249535440](v22, -1, -1);
  }
  else
  {
    MEMORY[0x2495353A4](v8);
    MEMORY[0x2495353A4](v8);
  }

  v15 = objc_msgSend(objc_allocWithZone(*(Class *)(v9 + 3456)), sel_init);
  MEMORY[0x2495353A4](v8);
LABEL_12:
  *v28 = v15;
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495353E0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2454A93C4()
{
  unint64_t result;

  result = qword_257477CA0;
  if (!qword_257477CA0)
  {
    result = MEMORY[0x2495353F8](&unk_2454AA94C, &type metadata for CodableCard.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257477CA0);
  }
  return result;
}

uint64_t CodableCard.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD v13[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257477CB8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE850A0]), sel_initWithFacade_, *v1);
  v8 = v7;
  if (!v7)
    goto LABEL_5;
  v9 = objc_msgSend(v7, sel_data);

  if (!v9)
  {
    v8 = 0;
LABEL_5:
    v11 = 0xF000000000000000;
    goto LABEL_6;
  }
  v8 = (void *)sub_2454AA3C8();
  v11 = v10;

LABEL_6:
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2454A93C4();
  sub_2454AA500();
  v13[0] = v8;
  v13[1] = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257477CC0);
  sub_2454A9F6C();
  sub_2454AA488();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_2454AA058((uint64_t)v8, v11);
}

uint64_t sub_2454A959C@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2454AA470();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2454A95EC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2454AA2B0();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2454A9614@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_2454AA470();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

uint64_t sub_2454A9668()
{
  return 0;
}

void sub_2454A9674(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2454A9680()
{
  sub_2454A93C4();
  return sub_2454AA50C();
}

uint64_t sub_2454A96A8()
{
  sub_2454A93C4();
  return sub_2454AA518();
}

uint64_t static CodableCard.Error.== infix(_:_:)()
{
  return 1;
}

uint64_t CodableCard.Error.hash(into:)()
{
  return sub_2454AA4DC();
}

uint64_t CodableCard.Error.hashValue.getter()
{
  sub_2454AA4D0();
  sub_2454AA4DC();
  return sub_2454AA4E8();
}

uint64_t sub_2454A973C()
{
  return 1;
}

uint64_t sub_2454A9744()
{
  sub_2454AA4D0();
  sub_2454AA4DC();
  return sub_2454AA4E8();
}

uint64_t sub_2454A9784()
{
  return sub_2454AA4DC();
}

uint64_t sub_2454A97A8()
{
  sub_2454AA4D0();
  sub_2454AA4DC();
  return sub_2454AA4E8();
}

uint64_t sub_2454A97F4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return CodableCard.init(from:)(a1, a2);
}

uint64_t sub_2454A9808(_QWORD *a1)
{
  return CodableCard.encode(to:)(a1);
}

uint64_t sub_2454A981C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_2454A98EC(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_2454AA37C((uint64_t)v12, *a3);
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
      sub_2454AA37C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2454A98EC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_2454AA434();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_2454A9AA4(a5, a6);
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
  v8 = sub_2454AA44C();
  if (!v8)
  {
    sub_2454AA458();
    __break(1u);
LABEL_17:
    result = sub_2454AA464();
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

uint64_t sub_2454A9AA4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_2454A9B38(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_2454A9D10(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_2454A9D10(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2454A9B38(uint64_t a1, unint64_t a2)
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
      v3 = sub_2454A9CAC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_2454AA440();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_2454AA458();
      __break(1u);
LABEL_10:
      v2 = sub_2454AA404();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_2454AA464();
    __break(1u);
LABEL_14:
    result = sub_2454AA458();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_2454A9CAC(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_257477CF8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2454A9D10(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257477CF8);
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
  result = sub_2454AA464();
  __break(1u);
  return result;
}

unint64_t sub_2454A9E5C()
{
  unint64_t result;

  result = qword_257477CA8;
  if (!qword_257477CA8)
  {
    result = MEMORY[0x2495353F8](MEMORY[0x24BDCDE38], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_257477CA8);
  }
  return result;
}

uint64_t sub_2454A9EA0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_2454A9EE4(uint64_t a1, unint64_t a2)
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

unint64_t sub_2454A9F28()
{
  unint64_t result;

  result = qword_257477CB0;
  if (!qword_257477CB0)
  {
    result = MEMORY[0x2495353F8](&protocol conformance descriptor for CodableCard.Error, &type metadata for CodableCard.Error);
    atomic_store(result, (unint64_t *)&qword_257477CB0);
  }
  return result;
}

unint64_t sub_2454A9F6C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_257477CC8;
  if (!qword_257477CC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257477CC0);
    v2 = sub_2454AA014();
    result = MEMORY[0x2495353F8](MEMORY[0x24BEE4AA8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257477CC8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495353EC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_2454AA014()
{
  unint64_t result;

  result = qword_257477CD0;
  if (!qword_257477CD0)
  {
    result = MEMORY[0x2495353F8](MEMORY[0x24BDCDDF8], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_257477CD0);
  }
  return result;
}

uint64_t sub_2454AA058(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_2454A9EE4(a1, a2);
  return a1;
}

unint64_t sub_2454AA070()
{
  unint64_t result;

  result = qword_257477CD8;
  if (!qword_257477CD8)
  {
    result = MEMORY[0x2495353F8](&protocol conformance descriptor for CodableCard.Error, &type metadata for CodableCard.Error);
    atomic_store(result, (unint64_t *)&qword_257477CD8);
  }
  return result;
}

ValueMetadata *type metadata accessor for CodableCard()
{
  return &type metadata for CodableCard;
}

uint64_t sub_2454AA0D4()
{
  return 0;
}

ValueMetadata *type metadata accessor for CodableCard.Error()
{
  return &type metadata for CodableCard.Error;
}

uint64_t _s10ResponseUI11CodableCardV5ErrorOwet_0(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t _s10ResponseUI11CodableCardV5ErrorOwst_0(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_2454AA17C + 4 * byte_2454AA720[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_2454AA19C + 4 * byte_2454AA725[v4]))();
}

_BYTE *sub_2454AA17C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_2454AA19C(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2454AA1A4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2454AA1AC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_2454AA1B4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_2454AA1BC(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for CodableCard.CodingKeys()
{
  return &type metadata for CodableCard.CodingKeys;
}

unint64_t sub_2454AA1DC()
{
  unint64_t result;

  result = qword_257477CE0;
  if (!qword_257477CE0)
  {
    result = MEMORY[0x2495353F8](&unk_2454AA924, &type metadata for CodableCard.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257477CE0);
  }
  return result;
}

unint64_t sub_2454AA224()
{
  unint64_t result;

  result = qword_257477CE8;
  if (!qword_257477CE8)
  {
    result = MEMORY[0x2495353F8](&unk_2454AA85C, &type metadata for CodableCard.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257477CE8);
  }
  return result;
}

unint64_t sub_2454AA26C()
{
  unint64_t result;

  result = qword_257477CF0;
  if (!qword_257477CF0)
  {
    result = MEMORY[0x2495353F8](&unk_2454AA884, &type metadata for CodableCard.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257477CF0);
  }
  return result;
}

uint64_t sub_2454AA2B0()
{
  return 1635017060;
}

uint64_t sub_2454AA2C0()
{
  sub_2454AA4D0();
  sub_2454AA3F8();
  return sub_2454AA4E8();
}

uint64_t sub_2454AA308()
{
  return sub_2454AA3F8();
}

uint64_t sub_2454AA318()
{
  sub_2454AA4D0();
  sub_2454AA3F8();
  return sub_2454AA4E8();
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_2454AA37C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2454AA3BC()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_2454AA3C8()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_2454AA3D4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2454AA3E0()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2454AA3EC()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2454AA3F8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2454AA404()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2454AA410()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2454AA41C()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2454AA428()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2454AA434()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2454AA440()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2454AA44C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2454AA458()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2454AA464()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2454AA470()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2454AA47C()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2454AA488()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2454AA494()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_2454AA4A0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2454AA4AC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2454AA4B8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2454AA4C4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2454AA4D0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2454AA4DC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2454AA4E8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2454AA4F4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2454AA500()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2454AA50C()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2454AA518()
{
  return MEMORY[0x24BEE4A10]();
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

