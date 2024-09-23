uint64_t variable initialization expression of Contexts.UIKit.queue()
{
  sub_2308DC334();
  return sub_2308E64B8();
}

unint64_t sub_2308DC334()
{
  unint64_t result;

  result = qword_255E82858;
  if (!qword_255E82858)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255E82858);
  }
  return result;
}

uint64_t variable initialization expression of StateObservingNSObject.cancellableSubs()
{
  return MEMORY[0x24BEE4AF8];
}

double variable initialization expression of StateObservingNSObject.configuration@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t variable initialization expression of StateValue._lastAccessedValue@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1);
}

uint64_t variable initialization expression of PublishedValue.$__lazy_storage_$_valueDidChange()
{
  return 0;
}

uint64_t variable initialization expression of PublishedValue._previousValue@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, 1, 1);
}

double variable initialization expression of StateObserver.configuration@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)(a1 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t variable initialization expression of StateObserver.cancellableSubs()
{
  return MEMORY[0x24BEE4AF8];
}

void type metadata accessor for os_unfair_lock_s()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_255E82860)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_255E82860);
  }
}

void StateObserver.__allocating_init()()
{
  swift_deletedMethodError();
  __break(1u);
}

_QWORD *sub_2308DC44C(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v2 = result[2];
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v6 = result;
  result = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)result && v5 <= v3[3] >> 1)
  {
    if (v6[2])
      goto LABEL_5;
    goto LABEL_13;
  }
  if (v4 <= v5)
    v10 = v4 + v2;
  else
    v10 = v4;
  result = sub_2308DC544(result, v10, 1, v3);
  v3 = result;
  if (!v6[2])
  {
LABEL_13:
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
LABEL_5:
  if ((v3[3] >> 1) - v3[2] < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E82870);
  result = (_QWORD *)swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    result = (_QWORD *)swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v7 = v3[2];
  v8 = __OFADD__(v7, v2);
  v9 = v7 + v2;
  if (!v8)
  {
    v3[2] = v9;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

_QWORD *sub_2308DC544(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_255E82880);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E82870);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

_QWORD *sub_2308DC664(_QWORD *a1, int64_t a2, char a3)
{
  _QWORD **v3;
  _QWORD *result;

  result = sub_2308DC680(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

_QWORD *sub_2308DC680(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_255E82880);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v10 + 4 >= &a4[2 * v8 + 4])
      memmove(v10 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E82870);
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_2308DC7A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  _QWORD *v22;
  uint64_t (*v23)(_QWORD, _QWORD, _QWORD);
  _QWORD *v24;
  uint64_t v25;
  int v26;
  uint64_t result;
  _QWORD *v28;
  unint64_t v29;
  unint64_t v30;
  __int128 v31;
  _QWORD *v32;
  uint64_t v33;
  __int128 *v34;
  uint64_t ObjectType;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(_QWORD, _QWORD, _QWORD);
  char *v43;
  char *v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  _OWORD *v50;
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  _OWORD v56[2];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD *v60;

  v2 = sub_2308E65E4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v41 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82868);
  v9 = MEMORY[0x24BDAC7A8](v7, v8);
  v49 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v14 = (char *)&v41 - v13;
  v16 = MEMORY[0x24BDAC7A8](v12, v15);
  v18 = (char *)&v41 - v17;
  MEMORY[0x24BDAC7A8](v16, v19);
  v21 = (char *)&v41 - v20;
  *((_QWORD *)&v58 + 1) = swift_getObjectType();
  *(_QWORD *)&v57 = a1;
  swift_unknownObjectRetain();
  sub_2308E65CC();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v21, 0, 1, v2);
  v22 = (_QWORD *)MEMORY[0x24BEE4AF8];
  v60 = (_QWORD *)MEMORY[0x24BEE4AF8];
  sub_2308DCD28((uint64_t)v21, (uint64_t)v18);
  v23 = *(uint64_t (**)(_QWORD, _QWORD, _QWORD))(v3 + 48);
  if (v23(v18, 1, v2) == 1)
  {
LABEL_29:
    sub_2308DCDF4((uint64_t)v18, &qword_255E82868);
    sub_2308DCDF4((uint64_t)v21, &qword_255E82868);
    return (uint64_t)v22;
  }
  else
  {
    v50 = v56;
    v48 = v2;
    v47 = v3;
    v46 = v6;
    v45 = v18;
    v44 = v14;
    v43 = v21;
    v42 = v23;
    while (1)
    {
      sub_2308DCDF4((uint64_t)v18, &qword_255E82868);
      sub_2308DCD28((uint64_t)v21, (uint64_t)v14);
      result = v23(v14, 1, v2);
      if ((_DWORD)result == 1)
        break;
      (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v14, v2);
      sub_2308E65D8();
      sub_2308E6554();
      sub_2308E6584();
      if (*((_QWORD *)&v59 + 1))
      {
        v28 = v22;
        do
        {
          v55 = v57;
          v56[0] = v58;
          v56[1] = v59;
          v52 = v57;
          sub_2308DCDB8((uint64_t)v50, (uint64_t)&v53);
          __swift_instantiateConcreteTypeFromMangledName(&qword_255E82870);
          if ((swift_dynamicCast() & 1) == 0)
            v54 = 0uLL;
          sub_2308DCDF4((uint64_t)&v55, &qword_255E82878);
          if ((_QWORD)v54)
          {
            v51 = v54;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v28 = sub_2308DC544(0, v28[2] + 1, 1, v28);
            v30 = v28[2];
            v29 = v28[3];
            v31 = v51;
            if (v30 >= v29 >> 1)
            {
              v32 = sub_2308DC544((_QWORD *)(v29 > 1), v30 + 1, 1, v28);
              v31 = v51;
              v28 = v32;
            }
            v28[2] = v30 + 1;
            *(_OWORD *)&v28[2 * v30 + 4] = v31;
          }
          sub_2308E6584();
        }
        while (*((_QWORD *)&v59 + 1));
      }
      else
      {
        v28 = v22;
      }
      swift_release();
      swift_release();
      *(_QWORD *)&v57 = v22;
      v33 = v28[2];
      if (v33)
      {
        v24 = v22;
        v34 = (__int128 *)(v28 + 4);
        do
        {
          v51 = *v34;
          ObjectType = swift_getObjectType();
          v36 = *((_QWORD *)&v51 + 1);
          v37 = *(uint64_t (**)(uint64_t, uint64_t))(*((_QWORD *)&v51 + 1) + 8);
          swift_unknownObjectRetain();
          if ((v37(ObjectType, v36) & 1) != 0)
          {
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *(_QWORD *)&v57 = v24;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              sub_2308DC664(0, v24[2] + 1, 1);
              v24 = (_QWORD *)v57;
            }
            v40 = v24[2];
            v39 = v24[3];
            if (v40 >= v39 >> 1)
            {
              sub_2308DC664((_QWORD *)(v39 > 1), v40 + 1, 1);
              v24 = (_QWORD *)v57;
            }
            v24[2] = v40 + 1;
            *(_OWORD *)&v24[2 * v40 + 4] = v51;
          }
          else
          {
            swift_unknownObjectRelease();
          }
          ++v34;
          --v33;
        }
        while (v33);
      }
      else
      {
        v24 = v22;
      }
      swift_bridgeObjectRelease();
      sub_2308DC44C(v24);
      v25 = (uint64_t)v49;
      v6 = v46;
      sub_2308E65C0();
      v3 = v47;
      v2 = v48;
      (*(void (**)(char *, uint64_t))(v47 + 8))(v6, v48);
      v21 = v43;
      sub_2308DCDF4((uint64_t)v43, &qword_255E82868);
      sub_2308DCD70(v25, (uint64_t)v21);
      v18 = v45;
      sub_2308DCD28((uint64_t)v21, (uint64_t)v45);
      v23 = v42;
      v26 = v42(v18, 1, v2);
      v14 = v44;
      v22 = (_QWORD *)MEMORY[0x24BEE4AF8];
      if (v26 == 1)
      {
        v22 = v60;
        goto LABEL_29;
      }
    }
    __break(1u);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348BC6DC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2308DCD28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82868);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2308DCD70(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82868);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2308DCDB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2308DCDF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2308DCE38()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_getAssociatedTypeWitness();
      swift_getAssociatedConformanceWitness();
      sub_2308E62FC();
      result = sub_2308E64F4();
      if (v3 <= 0x3F)
        return swift_initClassMetadata2();
    }
  }
  return result;
}

void sub_2308DCF98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = MEMORY[0x24BDAC7A8](a1, a2);
  MEMORY[0x24BDAC7A8](v2, v3);
  _s16CollectByTriggerV5InnerCMa();
}

uint64_t sub_2308DD04C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;

  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 16))(v7, *(_QWORD *)(v9 - 152), v3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v2, v1 + *(int *)(v4 + 52), v6);
  v11 = *(_BYTE *)(v1 + *(int *)(v4 + 56));
  swift_allocObject();
  *(_QWORD *)(v9 - 128) = sub_2308DD15C(v7, v2, v11);
  MEMORY[0x2348BC6F4](&unk_2308E6B48, a1);
  sub_2308E63E0();
  return swift_release();
}

uint64_t *sub_2308DD10C(uint64_t a1, uint64_t a2, char a3)
{
  swift_allocObject();
  return sub_2308DD15C(a1, a2, a3);
}

uint64_t *sub_2308DD15C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  uint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v7 = *v3;
  v8 = *(_QWORD *)(*v3 + 152);
  v9 = (_DWORD *)swift_slowAlloc();
  *v9 = 0;
  *(uint64_t *)((char *)v3 + v8) = (uint64_t)v9;
  v10 = *(_QWORD *)(*v3 + 160);
  v11 = (_DWORD *)swift_slowAlloc();
  *v11 = 0;
  *(uint64_t *)((char *)v3 + v10) = (uint64_t)v11;
  v12 = *(_QWORD *)(*v3 + 168);
  swift_getAssociatedTypeWitness();
  *(uint64_t *)((char *)v3 + v12) = sub_2308E647C();
  v13 = (uint64_t)v3 + *(_QWORD *)(*v3 + 176);
  *(_QWORD *)(v13 + 32) = 0;
  *(_OWORD *)v13 = 0u;
  *(_OWORD *)(v13 + 16) = 0u;
  *(uint64_t *)((char *)v3 + *(_QWORD *)(*v3 + 184)) = 0;
  *(uint64_t *)((char *)v3 + *(_QWORD *)(*v3 + 192)) = 0;
  v14 = (uint64_t)v3 + *(_QWORD *)(*v3 + 200);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v15 = sub_2308E62FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v7 + 96) - 8) + 32))((uint64_t)v3 + *(_QWORD *)(*v3 + 128), a1);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v7 + 88) - 8) + 32))((uint64_t)v3 + *(_QWORD *)(*v3 + 136), a2);
  *((_BYTE *)v3 + *(_QWORD *)(*v3 + 144)) = a3;
  return v3;
}

uint64_t *sub_2308DD310()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  MEMORY[0x2348BC778](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 152)), -1, -1);
  MEMORY[0x2348BC778](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 160)), -1, -1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 96) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 128));
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 88) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 136));
  swift_bridgeObjectRelease();
  sub_2308DED24((uint64_t)v0 + *(_QWORD *)(*v0 + 176));
  swift_release();
  v2 = (uint64_t)v0 + *(_QWORD *)(*v0 + 200);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_2308E62FC();
  v3 = sub_2308E64F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  return v0;
}

uint64_t sub_2308DD45C()
{
  sub_2308DD310();
  return swift_deallocClassInstance();
}

void _s16CollectByTriggerV5InnerCMa()
{
  JUMPOUT(0x2348BC6A0);
}

uint64_t sub_2308DD488()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2308DD490()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_2308DD524(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;

  v4 = a1;
  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v7 = *(_QWORD *)(v5 - 8);
  v8 = *(_DWORD *)(v7 + 80);
  v9 = *(_QWORD *)(v6 + 64) + v8;
  v10 = *(_QWORD *)(v7 + 64);
  v11 = (*(_BYTE *)(v6 + 80) | *(_BYTE *)(v7 + 80));
  if (v11 > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) != 0
    || v10 + (v9 & (unint64_t)~v8) + 1 > 0x18)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v11 + 16) & ~v11));
    swift_retain();
  }
  else
  {
    v15 = ~v8;
    (*(void (**)(uint64_t *, uint64_t *))(v6 + 16))(a1, a2);
    v16 = ((unint64_t)a2 + v9) & v15;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)v4 + v9) & v15, v16, v5);
    *(_BYTE *)((((unint64_t)v4 + v9) & v15) + v10) = *(_BYTE *)(v16 + v10);
  }
  return v4;
}

uint64_t sub_2308DD610(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  (*(void (**)(void))(v4 + 8))();
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 8))((*(_QWORD *)(v4 + 64) + a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 80));
}

uint64_t sub_2308DD668(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 16))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v11, v12);
  *(_BYTE *)(v11 + *(_QWORD *)(v8 + 64)) = *(_BYTE *)(v12 + *(_QWORD *)(v8 + 64));
  return a1;
}

uint64_t sub_2308DD6E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 24))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 24))(v11, v12);
  *(_BYTE *)(v11 + *(_QWORD *)(v8 + 64)) = *(_BYTE *)(v12 + *(_QWORD *)(v8 + 64));
  return a1;
}

uint64_t sub_2308DD768(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 32))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v11, v12);
  *(_BYTE *)(v11 + *(_QWORD *)(v8 + 64)) = *(_BYTE *)(v12 + *(_QWORD *)(v8 + 64));
  return a1;
}

uint64_t sub_2308DD7E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(void))(v6 + 40))();
  v7 = *(_QWORD *)(v6 + 64);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = v7 + v9;
  v11 = (v10 + a1) & ~v9;
  v12 = (v10 + a2) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v8 + 40))(v11, v12);
  *(_BYTE *)(v11 + *(_QWORD *)(v8 + 64)) = *(_BYTE *)(v12 + *(_QWORD *)(v8 + 64));
  return a1;
}

uint64_t sub_2308DD868(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  char v14;
  int v15;
  unsigned int v16;
  int v17;
  int v18;
  uint64_t v20;
  unsigned int v21;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= v5)
    v8 = *(_DWORD *)(v4 + 84);
  else
    v8 = *(_DWORD *)(v6 + 84);
  if (v8 <= 0xFE)
    v8 = 254;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v6 + 80);
  v10 = *(_QWORD *)(v4 + 64) + v9;
  v11 = *(_QWORD *)(v6 + 64);
  v12 = a2 - v8;
  if (a2 <= v8)
    goto LABEL_25;
  v13 = v11 + (v10 & ~v9) + 1;
  v14 = 8 * v13;
  if (v13 > 3)
    goto LABEL_9;
  v16 = ((v12 + ~(-1 << v14)) >> v14) + 1;
  if (HIWORD(v16))
  {
    v15 = *(_DWORD *)(a1 + v13);
    if (v15)
      goto LABEL_16;
  }
  else
  {
    if (v16 <= 0xFF)
    {
      if (v16 < 2)
        goto LABEL_25;
LABEL_9:
      v15 = *(unsigned __int8 *)(a1 + v13);
      if (!*(_BYTE *)(a1 + v13))
        goto LABEL_25;
LABEL_16:
      v17 = (v15 - 1) << v14;
      if (v13 > 3)
        v17 = 0;
      if ((_DWORD)v11 + (v10 & ~(_DWORD)v9) == -1)
        return v8 + v17 + 1;
      if (v13 <= 3)
        v18 = v11 + (v10 & ~(_DWORD)v9) + 1;
      else
        v18 = 4;
      return ((uint64_t (*)(void))((char *)&loc_2308DD94C + 4 * byte_2308E69E0[v18 - 1]))();
    }
    v15 = *(unsigned __int16 *)(a1 + v13);
    if (*(_WORD *)(a1 + v13))
      goto LABEL_16;
  }
LABEL_25:
  if (v5 == v8)
    return (*(uint64_t (**)(void))(v4 + 48))();
  v20 = (v10 + a1) & ~v9;
  if (v7 == v8)
    return (*(uint64_t (**)(uint64_t))(v6 + 48))(v20);
  v21 = *(unsigned __int8 *)(v20 + v11);
  if (v21 < 2)
    return 0;
  return ((v21 + 2147483646) & 0x7FFFFFFF) + 1;
}

void sub_2308DD9EC(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  unsigned int v8;
  size_t v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  int v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  if (*(_DWORD *)(v6 + 84) <= *(_DWORD *)(v5 + 84))
    v7 = *(_DWORD *)(v5 + 84);
  else
    v7 = *(_DWORD *)(v6 + 84);
  if (v7 <= 0xFE)
    v8 = 254;
  else
    v8 = v7;
  v9 = *(_QWORD *)(v6 + 64)
     + ((*(_QWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80))
     + 1;
  if (a3 > v8)
  {
    if (v9 <= 3)
    {
      v12 = ((a3 - v8 + ~(-1 << (8 * v9))) >> (8 * v9)) + 1;
      if (HIWORD(v12))
      {
        v10 = 4u;
      }
      else if (v12 >= 0x100)
      {
        v10 = 2;
      }
      else
      {
        v10 = v12 > 1;
      }
    }
    else
    {
      v10 = 1u;
    }
  }
  else
  {
    v10 = 0;
  }
  if (v8 < a2)
  {
    v11 = ~v8 + a2;
    if (v9 < 4)
    {
      if (*(_DWORD *)(v6 + 64)
         + ((*(_DWORD *)(v5 + 64) + *(unsigned __int8 *)(v6 + 80)) & ~*(unsigned __int8 *)(v6 + 80)) != -1)
      {
        v13 = v11 & ~(-1 << (8 * v9));
        bzero(a1, v9);
        if ((_DWORD)v9 == 3)
        {
          *a1 = v13;
          *((_BYTE *)a1 + 2) = BYTE2(v13);
        }
        else if ((_DWORD)v9 == 2)
        {
          *a1 = v13;
        }
        else
        {
          *(_BYTE *)a1 = v13;
        }
      }
    }
    else
    {
      bzero(a1, v9);
      *(_DWORD *)a1 = v11;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X0 }
}

void _s16CollectByTriggerVMa()
{
  JUMPOUT(0x2348BC6A0);
}

void sub_2308DDC18(uint64_t a1)
{
  uint64_t v1;
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
  char *v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char *v28;
  os_unfair_lock_s *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  os_unfair_lock_t v35;
  uint64_t v36;
  uint64_t v37;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 104);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  swift_getAssociatedTypeWitness();
  v34 = v4;
  swift_getAssociatedConformanceWitness();
  v5 = sub_2308E62FC();
  v6 = sub_2308E64F4();
  v7 = *(_QWORD *)(v6 - 8);
  v9 = MEMORY[0x24BDAC7A8](v6, v8);
  v33 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9, v11);
  v14 = (char *)&v30 - v13;
  v15 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v12, v16);
  v18 = (char *)&v30 - v17;
  sub_2308E6344();
  if ((sub_2308E632C() & 1) == 0)
  {
    if (a1 < 0)
    {
      __break(1u);
    }
    else if (a1)
    {
      goto LABEL_4;
    }
    __break(1u);
    goto LABEL_20;
  }
LABEL_4:
  v32 = v3;
  v35 = *(os_unfair_lock_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 152));
  v36 = v7;
  os_unfair_lock_lock(v35);
  v19 = (uint64_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 192));
  swift_beginAccess();
  v20 = *v19;
  sub_2308E6344();
  if ((sub_2308E632C() & 1) != 0)
    goto LABEL_14;
  v31 = v5;
  sub_2308E6344();
  v21 = sub_2308E632C();
  v22 = sub_2308E6344();
  if ((v21 & 1) == 0)
  {
    v23 = sub_2308E632C();
    v5 = v31;
    if ((v23 & 1) != 0)
      goto LABEL_11;
    if (((v20 | a1) & 0x8000000000000000) == 0)
    {
      v22 = v20 + a1;
      if (!__OFADD__(v20, a1))
      {
        if ((v22 & 0x8000000000000000) == 0)
          goto LABEL_13;
LABEL_21:
        __break(1u);
        return;
      }
LABEL_11:
      v22 = sub_2308E6344();
      goto LABEL_13;
    }
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v5 = v31;
LABEL_13:
  *v19 = v22;
LABEL_14:
  swift_endAccess();
  v24 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 200);
  swift_beginAccess();
  v25 = v36;
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v14, v24, v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v14, 1, v5) == 1)
  {
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v6);
    os_unfair_lock_unlock(v35);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v14, v5);
    v26 = (uint64_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 168));
    swift_beginAccess();
    v27 = *v26;
    swift_getAssociatedTypeWitness();
    swift_bridgeObjectRetain();
    *v26 = sub_2308E647C();
    swift_bridgeObjectRelease();
    v28 = v33;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v33, 1, 1, v5);
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v36 + 40))(v24, v28, v6);
    swift_endAccess();
    os_unfair_lock_unlock(v35);
    v29 = *(os_unfair_lock_s **)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 160));
    os_unfair_lock_lock(v29);
    v37 = v27;
    sub_2308E62E4();
    swift_bridgeObjectRelease();
    sub_2308E62CC();
    os_unfair_lock_unlock(v29);
    (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v5);
  }
}

void sub_2308DE014()
{
  uint64_t v0;
  os_unfair_lock_s *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v10[4];

  v1 = *(os_unfair_lock_s **)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 152));
  os_unfair_lock_lock(v1);
  v2 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 176);
  swift_beginAccess();
  sub_2308DECDC(v2, (uint64_t)&v7);
  if (*((_QWORD *)&v8 + 1))
  {
    sub_2308DF094(&v7, (uint64_t)v10);
    v3 = *(_QWORD *)(*(_QWORD *)v0 + 184);
    v4 = *(_QWORD *)(v0 + v3);
    swift_getAssociatedTypeWitness();
    swift_retain();
    v5 = sub_2308E647C();
    v6 = (uint64_t *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 168));
    swift_beginAccess();
    *v6 = v5;
    swift_bridgeObjectRelease();
    v9 = 0;
    v7 = 0u;
    v8 = 0u;
    swift_beginAccess();
    sub_2308DEC94((uint64_t)&v7, v2);
    swift_endAccess();
    *(_QWORD *)(v0 + v3) = 0;
    swift_release();
    os_unfair_lock_unlock(v1);
    __swift_project_boxed_opaque_existential_1(v10, v10[3]);
    sub_2308E62F0();
    if (v4)
    {
      swift_retain();
      sub_2308E6314();
      swift_release_n();
    }
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  }
  else
  {
    sub_2308DED24((uint64_t)&v7);
    os_unfair_lock_unlock(v1);
  }
}

uint64_t sub_2308DE1B8(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  os_unfair_lock_s *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  os_unfair_lock_s *v14;
  _QWORD v15[3];
  _QWORD *v16;
  uint64_t v17;

  v2 = v1;
  v4 = *(_QWORD **)v1;
  v5 = *(os_unfair_lock_s **)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 152));
  os_unfair_lock_lock(v5);
  v6 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 176);
  swift_beginAccess();
  sub_2308DECDC(v6, (uint64_t)v15);
  v7 = v16;
  sub_2308DED24((uint64_t)v15);
  if (v7)
  {
    os_unfair_lock_unlock(v5);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    return sub_2308E62F0();
  }
  else
  {
    sub_2308DED64((uint64_t)a1, (uint64_t)v15);
    swift_beginAccess();
    sub_2308DEC94((uint64_t)v15, v6);
    swift_endAccess();
    v9 = v4[14];
    v10 = v4[11];
    swift_getAssociatedTypeWitness();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    v11 = sub_2308E6320();
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = v4[10];
    v12[3] = v10;
    v12[4] = v4[12];
    v12[5] = v4[13];
    v12[6] = v9;
    v12[7] = v4[15];
    swift_retain();
    v13 = sub_2308E6308();
    *(_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 184)) = v13;
    swift_retain();
    swift_release();
    v15[0] = v13;
    MEMORY[0x2348BC6F4](MEMORY[0x24BDB9AA0], v11);
    sub_2308E63E0();
    os_unfair_lock_unlock(v5);
    v14 = *(os_unfair_lock_s **)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 160));
    os_unfair_lock_lock(v14);
    v16 = v4;
    v17 = MEMORY[0x2348BC6F4](&unk_2308E6B10, v4);
    v15[0] = v2;
    swift_retain();
    sub_2308E62D8();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v15);
    os_unfair_lock_unlock(v14);
    __swift_project_boxed_opaque_existential_1(a1, a1[3]);
    sub_2308E6344();
    sub_2308E635C();
    return swift_release();
  }
}

uint64_t sub_2308DE488(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[24];
  uint64_t v14;

  v3 = *v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v6);
  v8 = &v13[-v7];
  v9 = *(os_unfair_lock_s **)((char *)v1 + *(_QWORD *)(v3 + 152));
  os_unfair_lock_lock(v9);
  v10 = (uint64_t)v1 + *(_QWORD *)(*v1 + 176);
  swift_beginAccess();
  sub_2308DECDC(v10, (uint64_t)v13);
  v11 = v14;
  sub_2308DED24((uint64_t)v13);
  if (v11)
  {
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v5 + 16))(v8, a1, AssociatedTypeWitness);
    swift_beginAccess();
    sub_2308E6494();
    sub_2308E6488();
    swift_endAccess();
  }
  os_unfair_lock_unlock(v9);
  return sub_2308E6338();
}

void sub_2308DE5C0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
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
  os_unfair_lock_s *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  os_unfair_lock_s *v19;
  void (*v20)(char *, uint64_t, uint64_t);
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _OWORD v41[2];
  uint64_t v42;

  v2 = v1;
  v38 = a1;
  v3 = *v1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v5 = sub_2308E62FC();
  v6 = sub_2308E64F4();
  v35 = *(_QWORD *)(v6 - 8);
  v36 = v6;
  v8 = MEMORY[0x24BDAC7A8](v6, v7);
  v34 = (char *)&v33 - v9;
  v37 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v33 - v11;
  v13 = *(_QWORD *)(v3 + 184);
  v14 = v3;
  if (*(uint64_t *)((char *)v1 + v13))
  {
    swift_retain();
    sub_2308E6314();
    swift_release();
    v14 = *v1;
  }
  v15 = *(os_unfair_lock_s **)((char *)v1 + *(_QWORD *)(v14 + 152));
  os_unfair_lock_lock(v15);
  v42 = 0;
  memset(v41, 0, sizeof(v41));
  v16 = (uint64_t)v1 + *(_QWORD *)(*v1 + 176);
  swift_beginAccess();
  sub_2308DEC94((uint64_t)v41, v16);
  swift_endAccess();
  *(uint64_t *)((char *)v2 + v13) = 0;
  swift_release();
  v17 = (uint64_t *)((char *)v2 + *(_QWORD *)(*v2 + 168));
  swift_beginAccess();
  v40 = *v17;
  swift_getAssociatedTypeWitness();
  v18 = sub_2308E6494();
  MEMORY[0x2348BC6F4](MEMORY[0x24BEE12E0], v18);
  if ((sub_2308E64A0() & 1) != 0)
  {
    os_unfair_lock_unlock(v15);
    v19 = *(os_unfair_lock_s **)((char *)v2 + *(_QWORD *)(*v2 + 160));
    os_unfair_lock_lock(v19);
LABEL_10:
    sub_2308E62CC();
    os_unfair_lock_unlock(v19);
    return;
  }
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v37 + 16);
  v20(v12, v38, v5);
  v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 48))(v12, 1, AssociatedTypeWitness);
  v22 = *v2;
  if (v21 != 1)
  {
    if (*((_BYTE *)v2 + *(_QWORD *)(v22 + 144)) == 1)
    {
      v26 = (uint64_t *)((char *)v2 + *(_QWORD *)(v22 + 192));
      swift_beginAccess();
      v27 = *v26;
      sub_2308E6344();
      if ((sub_2308E632C() & 1) == 0)
      {
        if (v27 < 0)
        {
LABEL_23:
          __break(1u);
          return;
        }
        if (!v27)
        {
          v31 = v34;
          v20(v34, v38, v5);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v31, 0, 1, v5);
          v32 = (uint64_t)v2 + *(_QWORD *)(*v2 + 200);
          swift_beginAccess();
          (*(void (**)(uint64_t, char *, uint64_t))(v35 + 40))(v32, v31, v36);
          swift_endAccess();
          goto LABEL_18;
        }
      }
      v28 = *v17;
      swift_bridgeObjectRetain();
      *v17 = sub_2308E647C();
      swift_bridgeObjectRelease();
      os_unfair_lock_unlock(v15);
      v15 = *(os_unfair_lock_s **)((char *)v2 + *(_QWORD *)(*v2 + 160));
      os_unfair_lock_lock(v15);
      v39 = v28;
      sub_2308E62E4();
      swift_bridgeObjectRelease();
    }
    else
    {
      *v17 = sub_2308E647C();
      swift_bridgeObjectRelease();
      os_unfair_lock_unlock(v15);
      v15 = *(os_unfair_lock_s **)((char *)v2 + *(_QWORD *)(*v2 + 160));
      os_unfair_lock_lock(v15);
    }
    sub_2308E62CC();
LABEL_18:
    os_unfair_lock_unlock(v15);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v12, v5);
    return;
  }
  v23 = (uint64_t *)((char *)v2 + *(_QWORD *)(v22 + 192));
  swift_beginAccess();
  v24 = *v23;
  sub_2308E6344();
  if ((sub_2308E632C() & 1) != 0)
  {
LABEL_9:
    v25 = *v17;
    swift_bridgeObjectRetain();
    *v17 = sub_2308E647C();
    swift_bridgeObjectRelease();
    os_unfair_lock_unlock(v15);
    v19 = *(os_unfair_lock_s **)((char *)v2 + *(_QWORD *)(*v2 + 160));
    os_unfair_lock_lock(v19);
    v39 = v25;
    sub_2308E62E4();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  if (v24 < 0)
  {
    __break(1u);
    goto LABEL_23;
  }
  if (v24)
    goto LABEL_9;
  v29 = v34;
  v20(v34, v38, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v29, 0, 1, v5);
  v30 = (uint64_t)v2 + *(_QWORD *)(*v2 + 200);
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v35 + 40))(v30, v29, v36);
  swift_endAccess();
  os_unfair_lock_unlock(v15);
}

uint64_t sub_2308DEB44(_QWORD *a1)
{
  return sub_2308DE1B8(a1);
}

uint64_t sub_2308DEB64(uint64_t a1)
{
  return sub_2308DE488(a1);
}

void sub_2308DEB84(uint64_t a1)
{
  sub_2308DE5C0(a1);
}

void sub_2308DEBA4(uint64_t a1)
{
  sub_2308DDC18(a1);
}

unint64_t sub_2308DEBC4()
{
  return 0xD000000000000010;
}

uint64_t sub_2308DEBE0()
{
  return sub_2308E629C();
}

void sub_2308DEC00()
{
  sub_2308DE014();
}

void sub_2308DEC20()
{
  JUMPOUT(0x2348BC6F4);
}

void sub_2308DEC30()
{
  JUMPOUT(0x2348BC6F4);
}

uint64_t sub_2308DEC40()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_2308DEC60()
{
  return swift_getAssociatedConformanceWitness();
}

void sub_2308DEC80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_2308DCF98(a1, a4);
}

uint64_t sub_2308DEC94(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2308DECDC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82988);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2308DED24(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82988);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2308DED64(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2308DEDA8()
{
  return swift_deallocObject();
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

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_2308DEE04()
{
  uint64_t v0;
  uint64_t v1;
  os_unfair_lock_s *v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  os_unfair_lock_s *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;

  v1 = v0;
  v2 = *(os_unfair_lock_s **)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 152));
  os_unfair_lock_lock(v2);
  v3 = (uint64_t *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 192));
  swift_beginAccess();
  v4 = *v3;
  sub_2308E6344();
  if ((sub_2308E632C() & 1) == 0)
  {
    if (v4 < 0)
    {
      __break(1u);
      goto LABEL_24;
    }
    if (!v4)
      goto LABEL_22;
  }
  v5 = (uint64_t *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 168));
  swift_beginAccess();
  swift_getAssociatedTypeWitness();
  v6 = sub_2308E6494();
  MEMORY[0x2348BC6F4](MEMORY[0x24BEE12E0], v6);
  if ((sub_2308E64A0() & 1) != 0)
  {
LABEL_22:
    os_unfair_lock_unlock(v2);
    return;
  }
  swift_beginAccess();
  v7 = *v3;
  sub_2308E6344();
  if ((sub_2308E632C() & 1) != 0)
    goto LABEL_12;
  sub_2308E6344();
  if ((sub_2308E632C() & 1) == 0)
  {
    if ((v7 & 0x8000000000000000) == 0)
    {
      if (v7)
      {
        v8 = v7 - 1;
        goto LABEL_11;
      }
LABEL_25:
      __break(1u);
      goto LABEL_26;
    }
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  v8 = sub_2308E6344();
LABEL_11:
  *v3 = v8;
LABEL_12:
  swift_endAccess();
  swift_bridgeObjectRetain();
  *v5 = sub_2308E647C();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v2);
  v9 = *(os_unfair_lock_s **)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 160));
  os_unfair_lock_lock(v9);
  v10 = sub_2308E62E4();
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock(v9);
  os_unfair_lock_lock(v2);
  swift_beginAccess();
  v11 = *v3;
  sub_2308E6344();
  if ((sub_2308E632C() & 1) != 0)
  {
LABEL_21:
    swift_endAccess();
    goto LABEL_22;
  }
  sub_2308E6344();
  v12 = sub_2308E632C();
  v13 = sub_2308E6344();
  if ((v12 & 1) != 0)
  {
LABEL_20:
    *v3 = v13;
    goto LABEL_21;
  }
  if ((sub_2308E632C() & 1) != 0)
  {
LABEL_18:
    v13 = sub_2308E6344();
    goto LABEL_20;
  }
  if ((v11 | v10) < 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  v13 = v11 + v10;
  if (__OFADD__(v11, v10))
    goto LABEL_18;
  if ((v13 & 0x8000000000000000) == 0)
    goto LABEL_20;
LABEL_27:
  __break(1u);
}

uint64_t sub_2308DF094(__int128 *a1, uint64_t a2)
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

uint64_t Context.description.getter(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v6;

  swift_getMetatypeMetadata();
  v6 = sub_2308E65F0();
  sub_2308E6470();
  v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
  sub_2308E64D0();

  sub_2308E6470();
  swift_bridgeObjectRelease();
  return v6;
}

ValueMetadata *type metadata accessor for Contexts()
{
  return &type metadata for Contexts;
}

uint64_t Configurations.AsyncDispatchedOnTrigger.composedConfiguration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2308DF160(v1, a1);
}

uint64_t sub_2308DF160(uint64_t a1, uint64_t a2)
{
  _s9CompositeVwcp(a2, a1);
  return a2;
}

uint64_t Configurations.AsyncDispatchedOnTrigger.init(asyncDispatched:triggered:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  a3[3] = &type metadata for Configurations.TriggeredUpdates;
  a3[4] = &protocol witness table for Configurations.TriggeredUpdates;
  *a3 = a2;
  a3[8] = &type metadata for Configurations.AsyncDispatched;
  a3[9] = &protocol witness table for Configurations.AsyncDispatched;
  a3[5] = result;
  return result;
}

uint64_t Configurations.AsyncDispatchedOnTrigger.stateDidChange(from:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v1[8]);
  v4 = v1[3];
  v5 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(a1, v4, v5);
  v6 = (*(uint64_t (**)(void))(v3 + 8))();
  swift_release();
  return v6;
}

uint64_t sub_2308DF268(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v1[8]);
  v4 = v1[3];
  v5 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(a1, v4, v5);
  v6 = (*(uint64_t (**)(void))(v3 + 8))();
  swift_release();
  return v6;
}

uint64_t _s9CompositeVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t _s9CompositeVwxx(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_1(a1);
  return __swift_destroy_boxed_opaque_existential_1(a1 + 40);
}

uint64_t _s9CompositeVwcp(uint64_t a1, uint64_t a2)
{
  __int128 v4;
  __int128 v5;

  v4 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 64) = v5;
  (**(void (***)(uint64_t, uint64_t))(v5 - 8))(a1 + 40, a2 + 40);
  return a1;
}

uint64_t *_s9CompositeVwca(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
  __swift_assign_boxed_opaque_existential_1(a1 + 5, a2 + 5);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
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
      result[4] = a2[4];
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

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t _s9CompositeVwta(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  __swift_destroy_boxed_opaque_existential_1(a1 + 40);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  return a1;
}

uint64_t _s9CompositeVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s9CompositeVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Configurations.AsyncDispatchedOnTrigger()
{
  return &type metadata for Configurations.AsyncDispatchedOnTrigger;
}

uint64_t Log.category.getter(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t Log.enabledInDebugKey.getter()
{
  return swift_retain();
}

void sub_2308DF6A8()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v0 = objc_msgSend((id)objc_opt_self(), sel_mainBundle);
  v1 = objc_msgSend(v0, sel_bundleIdentifier);

  if (v1)
  {
    v2 = sub_2308E6434();
    v4 = v3;

    qword_255E82990 = v2;
    *(_QWORD *)algn_255E82998 = v4;
  }
  else
  {
    __break(1u);
  }
}

_DWORD *sub_2308DF730()
{
  _DWORD *result;

  result = (_DWORD *)swift_slowAlloc();
  *result = 0;
  qword_255E829A0 = (uint64_t)result;
  return result;
}

void sub_2308DF758()
{
  off_255E829A8 = (_UNKNOWN *)MEMORY[0x24BEE4B00];
}

Swift::Void __swiftcall Log.default(_:isPrivate:)(Swift::String _, Swift::Bool isPrivate)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_2308DF794(_._countAndFlagsBits, (uint64_t)_._object, isPrivate, v2, v3, v4, MEMORY[0x24BEE7928]);
}

Swift::Void __swiftcall Log.debug(_:isPrivate:)(Swift::String _, Swift::Bool isPrivate)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_2308DF794(_._countAndFlagsBits, (uint64_t)_._object, isPrivate, v2, v3, v4, MEMORY[0x24BEE7908]);
}

Swift::Void __swiftcall Log.error(_:isPrivate:)(Swift::String _, Swift::Bool isPrivate)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_2308DF794(_._countAndFlagsBits, (uint64_t)_._object, isPrivate, v2, v3, v4, MEMORY[0x24BEE7910]);
}

uint64_t sub_2308DF794(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(void))
{
  uint64_t v12;

  v12 = a7();
  return _s8Stateful3LogV3log_4type9isPrivateySS_So03os_c1_D2_taSbtF_0(a1, a2, v12, a3, a4, a5);
}

unint64_t sub_2308DF7EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_2308E65A8();
  sub_2308E6464();
  v4 = sub_2308E65B4();
  return sub_2308DF850(a1, a2, v4);
}

unint64_t sub_2308DF850(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_2308E6590() & 1) == 0)
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
      while (!v14 && (sub_2308E6590() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_2308DF930(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E829C8);
  v38 = a2;
  v6 = sub_2308E6578();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_2308E65A8();
    sub_2308E6464();
    result = sub_2308E65B4();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

void sub_2308DFC3C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v5 = v4;
  v10 = *v4;
  v12 = sub_2308DF7EC(a2, a3);
  v13 = *(_QWORD *)(v10 + 16);
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v16 = v11;
  v17 = *(_QWORD *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0)
    goto LABEL_7;
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_2308DFD98();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7];

      *(_QWORD *)(v19 + 8 * v12) = a1;
      return;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    v22 = (uint64_t *)(v18[6] + 16 * v12);
    *v22 = a2;
    v22[1] = a3;
    *(_QWORD *)(v18[7] + 8 * v12) = a1;
    v23 = v18[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (!v24)
    {
      v18[2] = v25;
      swift_bridgeObjectRetain();
      return;
    }
    goto LABEL_14;
  }
  sub_2308DF930(v15, a4 & 1);
  v20 = sub_2308DF7EC(a2, a3);
  if ((v16 & 1) == (v21 & 1))
  {
    v12 = v20;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_2308E659C();
  __break(1u);
}

id sub_2308DFD98()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E829C8);
  v2 = *v0;
  v3 = sub_2308E656C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = v17[1];
    v19 = 8 * v15;
    v20 = *(void **)(*(_QWORD *)(v2 + 56) + v19);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = *v17;
    v21[1] = v18;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    result = v20;
  }
  v24 = v22 + 2;
  if (v24 >= v13)
    goto LABEL_26;
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t _s8Stateful3LogV3log_4type9isPrivateySS_So03os_c1_D2_taSbtF_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v18;
  void *v20;

  v10 = qword_255E82848;
  swift_bridgeObjectRetain();
  if (v10 != -1)
    swift_once();
  os_unfair_lock_lock((os_unfair_lock_t)qword_255E829A0);
  if (qword_255E82850 != -1)
    swift_once();
  swift_beginAccess();
  v11 = off_255E829A8;
  if (*((_QWORD *)off_255E829A8 + 2))
  {
    swift_bridgeObjectRetain();
    v12 = sub_2308DF7EC(a5, a6);
    if ((v13 & 1) != 0)
    {
      v14 = *(void **)(v11[7] + 8 * v12);
      swift_endAccess();
      v15 = v14;
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
  sub_2308E03CC();
  if (qword_255E82840 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v16 = (void *)sub_2308E64E8();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  v15 = v16;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v20 = off_255E829A8;
  off_255E829A8 = (_UNKNOWN *)0x8000000000000000;
  sub_2308DFC3C((uint64_t)v15, a5, a6, isUniquelyReferenced_nonNull_native);
  off_255E829A8 = v20;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();
LABEL_12:
  swift_bridgeObjectRelease();
  os_unfair_lock_unlock((os_unfair_lock_t)qword_255E829A0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E829B8);
  v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_2308E6C40;
  *(_QWORD *)(v18 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v18 + 64) = sub_2308E0408();
  *(_QWORD *)(v18 + 32) = a1;
  *(_QWORD *)(v18 + 40) = a2;
  swift_bridgeObjectRetain();
  sub_2308E6290();

  return swift_bridgeObjectRelease();
}

uint64_t destroy for Log()
{
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *_s8Stateful3LogVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for Log(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for Log(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for Log(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for Log(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
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
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

unint64_t sub_2308E03CC()
{
  unint64_t result;

  result = qword_255E829B0;
  if (!qword_255E829B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_255E829B0);
  }
  return result;
}

unint64_t sub_2308E0408()
{
  unint64_t result;

  result = qword_255E829C0;
  if (!qword_255E829C0)
  {
    result = MEMORY[0x2348BC6F4](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_255E829C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for Configurations.Default()
{
  return &type metadata for Configurations.Default;
}

uint64_t Contexts.UIKit.init()()
{
  sub_2308DC334();
  return sub_2308E64B8();
}

id sub_2308E0494()
{
  id *v0;

  return *v0;
}

unint64_t sub_2308E049C(uint64_t a1)
{
  unint64_t result;

  result = sub_2308E04C0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2308E04C0()
{
  unint64_t result;

  result = qword_255E829D0;
  if (!qword_255E829D0)
  {
    result = MEMORY[0x2348BC6F4](&protocol conformance descriptor for Contexts.UIKit, &type metadata for Contexts.UIKit);
    atomic_store(result, (unint64_t *)&qword_255E829D0);
  }
  return result;
}

uint64_t sub_2308E0504()
{
  void **v0;
  void *v1;
  id v2;
  uint64_t v4;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(qword_255E829D8);
  v4 = sub_2308E65F0();
  sub_2308E6470();
  v2 = v1;
  sub_2308E64D0();

  sub_2308E6470();
  swift_bridgeObjectRelease();
  return v4;
}

ValueMetadata *type metadata accessor for Contexts.UIKit()
{
  return &type metadata for Contexts.UIKit;
}

uint64_t sub_2308E059C()
{
  return 0;
}

void (*MutableStateValue.wrappedValue.modify(_QWORD *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 344);
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v7 = malloc(v6);
  v3[4] = v7;
  StateValue.wrappedValue.getter((uint64_t)v7, v8, (uint64_t)v7);
  return sub_2308E062C;
}

void sub_2308E062C(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, uint64_t);

  v2 = *(void **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 24);
  v4 = *(void **)(*(_QWORD *)a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)a1 + 8);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, void *, uint64_t))(v6 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 24), v4, v5);
    sub_2308E44D4((uint64_t)v3, v7);
    v8 = *(void (**)(void *, uint64_t))(v6 + 8);
    v8(v3, v5);
  }
  else
  {
    sub_2308E44D4(*(_QWORD *)(*(_QWORD *)a1 + 32), a2);
    v8 = *(void (**)(void *, uint64_t))(v6 + 8);
  }
  v8(v4, v5);
  free(v4);
  free(v3);
  free(v2);
}

uint64_t MutableStateValue.projectedValue.getter()
{
  return swift_retain();
}

_QWORD *MutableStateValue.__allocating_init(_:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 376) + 8))();
  swift_allocObject();
  return sub_2308E308C(a1, v3);
}

_QWORD *sub_2308E0734(uint64_t a1, uint64_t a2)
{
  swift_allocObject();
  return sub_2308E308C(a1, a2);
}

void sub_2308E0788()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t MutableStateValue.__deallocating_deinit()
{
  StateValue.deinit();
  return swift_deallocClassInstance();
}

uint64_t _s8Stateful17MutableStateValueC07wrappedD0xvs_0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  sub_2308E0814();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 344) - 8) + 8))(a1);
}

uint64_t sub_2308E0818()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for MutableStateValue()
{
  JUMPOUT(0x2348BC6A0);
}

uint64_t Configurations.TriggeredUpdates.stateDidChange(from:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82A60);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[1] = a1;
  v11[2] = a2;
  v12 = 0;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E82A68);
  sub_2308E0B5C(&qword_255E82A70, &qword_255E82A68, (uint64_t)&unk_2308E6BA0);
  sub_2308E63B0();
  sub_2308E0B5C(&qword_255E82A78, &qword_255E82A60, MEMORY[0x24BDB96C0]);
  v9 = sub_2308E6398();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  swift_release();
  swift_release();
  return v9;
}

uint64_t sub_2308E09A0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82A60);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3, v5);
  v7 = (char *)v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v11[1] = a1;
  v11[2] = v8;
  v12 = 0;
  swift_retain();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E82A68);
  sub_2308E0B5C(&qword_255E82A70, &qword_255E82A68, (uint64_t)&unk_2308E6BA0);
  sub_2308E63B0();
  sub_2308E0B5C(&qword_255E82A78, &qword_255E82A60, MEMORY[0x24BDB96C0]);
  v9 = sub_2308E6398();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  swift_release();
  swift_release();
  return v9;
}

uint64_t sub_2308E0AE0@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = *a1;
  a2[3] = __swift_instantiateConcreteTypeFromMangledName(qword_255E82A80);
  *a2 = v3;
  return swift_bridgeObjectRetain();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2348BC6E8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2308E0B5C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2348BC6F4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

ValueMetadata *type metadata accessor for Configurations.TriggeredUpdates()
{
  return &type metadata for Configurations.TriggeredUpdates;
}

uint64_t sub_2308E0BAC()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_2308E0C28(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + *(_QWORD *)(*v1 + 96)));
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 16))(a1, v4);
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + *(_QWORD *)(*v1 + 96)));
}

uint64_t sub_2308E0CAC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _DWORD *v5;

  v2 = swift_allocObject();
  v3 = *(_QWORD *)v2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 96);
  v5 = (_DWORD *)swift_slowAlloc();
  *v5 = 0;
  *(_QWORD *)(v2 + v4) = v5;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 32))(v2 + *(_QWORD *)(*(_QWORD *)v2 + 88), a1);
  return v2;
}

uint64_t sub_2308E0D24()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  MEMORY[0x2348BC778](*(uint64_t *)((char *)v0 + *(_QWORD *)(*v0 + 96)), -1, -1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 88));
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for Synchronized(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Synchronized);
}

void sub_2308E0D8C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1;
  os_unfair_lock_lock(*(os_unfair_lock_t *)((char *)v1 + *(_QWORD *)(*v1 + 96)));
  v4 = (uint64_t)v1 + *(_QWORD *)(*v1 + 88);
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 24))(v4, a1);
  swift_endAccess();
  os_unfair_lock_unlock(*(os_unfair_lock_t *)((char *)v1 + *(_QWORD *)(*v1 + 96)));
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x2348BC6A0](a1, v6, a5);
}

unint64_t sub_2308E0E4C(uint64_t a1)
{
  unint64_t result;

  result = sub_2308E0E70();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_2308E0E70()
{
  unint64_t result;

  result = qword_255E82B08;
  if (!qword_255E82B08)
  {
    result = MEMORY[0x2348BC6F4](&protocol conformance descriptor for Contexts.PrivateQueue, &type metadata for Contexts.PrivateQueue);
    atomic_store(result, (unint64_t *)&qword_255E82B08);
  }
  return result;
}

uint64_t sub_2308E0EB4()
{
  void **v0;
  void *v1;
  id v2;
  uint64_t v4;

  v1 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B10);
  v4 = sub_2308E65F0();
  sub_2308E6470();
  v2 = v1;
  sub_2308E64D0();

  sub_2308E6470();
  swift_bridgeObjectRelease();
  return v4;
}

ValueMetadata *type metadata accessor for Contexts.PrivateQueue()
{
  return &type metadata for Contexts.PrivateQueue;
}

uint64_t Configurations.Print.stateDidChange(from:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _OWORD v14[2];
  uint64_t v15;
  uint64_t v16;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B18);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B20);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = 0;
  v16 = a1;
  memset(v14, 0, sizeof(v14));
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B28);
  sub_2308E0B5C(&qword_255E82B30, &qword_255E82B28, MEMORY[0x24BDB9AF8]);
  sub_2308E63C8();
  sub_2308E1110((uint64_t)v14);
  sub_2308E0B5C(&qword_255E82B40, &qword_255E82B20, MEMORY[0x24BDB97A8]);
  sub_2308E63B0();
  sub_2308E0B5C(&qword_255E82B48, &qword_255E82B18, MEMORY[0x24BDB96C0]);
  v12 = sub_2308E6398();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v12;
}

uint64_t sub_2308E1110(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B38);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2308E1150(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _OWORD v14[2];
  uint64_t v15;
  uint64_t v16;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B18);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B20);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7, v9);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = 0;
  v16 = a1;
  memset(v14, 0, sizeof(v14));
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B28);
  sub_2308E0B5C(&qword_255E82B30, &qword_255E82B28, MEMORY[0x24BDB9AF8]);
  sub_2308E63C8();
  sub_2308E1110((uint64_t)v14);
  sub_2308E0B5C(&qword_255E82B40, &qword_255E82B20, MEMORY[0x24BDB97A8]);
  sub_2308E63B0();
  sub_2308E0B5C(&qword_255E82B48, &qword_255E82B18, MEMORY[0x24BDB96C0]);
  v12 = sub_2308E6398();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  return v12;
}

uint64_t sub_2308E1310@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;

  a2[3] = MEMORY[0x24BEE4AD8] + 8;
  v4 = swift_allocObject();
  *a2 = v4;
  return sub_2308DCDB8(a1, v4 + 16);
}

_QWORD *_s5PrintVwCP(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t _s5PrintVwxx()
{
  return swift_bridgeObjectRelease();
}

_QWORD *_s5PrintVwca(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *_s5PrintVwta(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s5PrintVwet(uint64_t a1, int a2)
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

uint64_t _s5PrintVwst(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for Configurations.Print()
{
  return &type metadata for Configurations.Print;
}

uint64_t sub_2308E14A4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_2308E14CC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_2308E14F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_2308E1518(NSObject *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t isEscapingClosureAtFileLocation;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  uint64_t result;
  void *v32;
  char v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  uint64_t v43;
  uint64_t v44;
  uint64_t aBlock;
  uint64_t v46;
  uint64_t (*v47)(uint64_t);
  void *v48;
  uint64_t (*v49)();
  char *v50;

  v42 = a2;
  v43 = a3;
  v4 = sub_2308E6404();
  v41 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = sub_2308E641C();
  isEscapingClosureAtFileLocation = *(_QWORD *)(v40 - 8);
  MEMORY[0x24BDAC7A8](v40, v9);
  v11 = (char *)&v39 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2308E6458();
  MEMORY[0x24BDAC7A8](v12, v13);
  dispatch_queue_get_label(0);
  sub_2308E644C();
  v14 = sub_2308E6440();
  v16 = v15;
  v17 = a1;
  v18 = sub_2308E64D0();
  if (v16)
  {
    if (v14 == v18 && v16 == v19)
    {
      swift_bridgeObjectRelease();
      v22 = swift_bridgeObjectRelease();
      return v42(v22);
    }
    v21 = sub_2308E6590();
    swift_bridgeObjectRelease();
    v22 = swift_bridgeObjectRelease();
    if ((v21 & 1) != 0)
      return v42(v22);
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_2308DC334();
  v23 = (_QWORD *)sub_2308E64B8();
  dispatch_queue_get_label(0);
  sub_2308E644C();
  v24 = sub_2308E6440();
  v26 = v25;
  v27 = sub_2308E64D0();
  if (v26)
  {
    if (v24 == v27 && v26 == v28)
    {
LABEL_22:

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_23;
    }
    v30 = sub_2308E6590();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v30 & 1) != 0)
      goto LABEL_23;
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  v32 = (void *)sub_2308E64B8();
  v33 = sub_2308E64DC();

  if ((v33 & 1) == 0)
  {
    v23 = (_QWORD *)swift_allocObject();
    v34 = v43;
    v23[2] = v42;
    v23[3] = v34;
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = sub_2308E1998;
    *(_QWORD *)(v4 + 24) = v23;
    v49 = sub_2308E1998;
    v50 = (char *)v4;
    aBlock = MEMORY[0x24BDAC760];
    v46 = 1107296256;
    v47 = sub_2308E14F8;
    v48 = &block_descriptor;
    v35 = _Block_copy(&aBlock);
    v7 = v50;
    swift_retain();
    swift_retain();
    swift_release();
    dispatch_sync(v17, v35);
    _Block_release(v35);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((isEscapingClosureAtFileLocation & 1) == 0)
      return result;
    __break(1u);
    goto LABEL_22;
  }
LABEL_23:
  v36 = swift_allocObject();
  v37 = v43;
  *(_QWORD *)(v36 + 16) = v42;
  *(_QWORD *)(v36 + 24) = v37;
  v49 = sub_2308E1A80;
  v50 = (char *)v36;
  aBlock = MEMORY[0x24BDAC760];
  v46 = 1107296256;
  v47 = sub_2308E14CC;
  v48 = &block_descriptor_9;
  v38 = _Block_copy(&aBlock);
  swift_retain();
  sub_2308E6410();
  v44 = MEMORY[0x24BEE4AF8];
  sub_2308E19E0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B58);
  sub_2308E1A28();
  sub_2308E6500();
  MEMORY[0x2348BC334](0, v11, v7, v38);
  _Block_release(v38);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(isEscapingClosureAtFileLocation + 8))(v11, v40);
  return swift_release();
}

uint64_t sub_2308E1974()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2308E1998()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2308E19B8()
{
  return swift_deallocObject();
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

unint64_t sub_2308E19E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255E82B50;
  if (!qword_255E82B50)
  {
    v1 = sub_2308E6404();
    result = MEMORY[0x2348BC6F4](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_255E82B50);
  }
  return result;
}

unint64_t sub_2308E1A28()
{
  unint64_t result;
  uint64_t v1;

  result = qword_255E82B60;
  if (!qword_255E82B60)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_255E82B58);
    result = MEMORY[0x2348BC6F4](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_255E82B60);
  }
  return result;
}

ValueMetadata *type metadata accessor for Configurations()
{
  return &type metadata for Configurations;
}

uint64_t Configurations.AsyncDispatched.stateDidChange(from:)(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B68);
  v22 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B70);
  MEMORY[0x24BDAC7A8](v8, v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B78);
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12, v14);
  v16 = (char *)&v21 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = a2;
  v24 = a1;
  v17 = sub_2308E64AC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v11, 1, 1, v17);
  v18 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B28);
  sub_2308DC334();
  sub_2308E0B5C(&qword_255E82B30, &qword_255E82B28, MEMORY[0x24BDB9AF8]);
  sub_2308E1CD8();
  sub_2308E63D4();
  sub_2308E1D20((uint64_t)v11);

  sub_2308E0B5C(&qword_255E82B88, &qword_255E82B78, MEMORY[0x24BDB9A08]);
  sub_2308E63B0();
  sub_2308E0B5C(&qword_255E82B90, &qword_255E82B68, MEMORY[0x24BDB96C0]);
  v19 = sub_2308E6398();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v12);
  return v19;
}

unint64_t sub_2308E1CD8()
{
  unint64_t result;
  unint64_t v1;

  result = qword_255E82B80;
  if (!qword_255E82B80)
  {
    v1 = sub_2308DC334();
    result = MEMORY[0x2348BC6F4](MEMORY[0x24BEE5670], v1);
    atomic_store(result, (unint64_t *)&qword_255E82B80);
  }
  return result;
}

uint64_t sub_2308E1D20(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B70);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2308E1D60(uint64_t a1)
{
  void **v1;

  return Configurations.AsyncDispatched.stateDidChange(from:)(a1, *v1);
}

ValueMetadata *type metadata accessor for Configurations.AsyncDispatched()
{
  return &type metadata for Configurations.AsyncDispatched;
}

void static StateObservingNSObject.context.getter()
{
  sub_2308E650C();
  swift_bridgeObjectRelease();
  swift_getMetatypeMetadata();
  sub_2308E65F0();
  sub_2308E6470();
  swift_bridgeObjectRelease();
  sub_2308E6560();
  __break(1u);
}

uint64_t StateObservingNSObject.cancellableSubs.getter()
{
  sub_2308E23CC();
  return swift_bridgeObjectRetain();
}

uint64_t StateObservingNSObject.cancellableSubs.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + direct field offset for StateObservingNSObject.cancellableSubs);
  swift_beginAccess();
  *v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*StateObservingNSObject.cancellableSubs.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t StateObservingNSObject.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + direct field offset for StateObservingNSObject.configuration;
  swift_beginAccess();
  return sub_2308E2410(v3, a1);
}

uint64_t StateObservingNSObject.configuration.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + direct field offset for StateObservingNSObject.configuration;
  swift_beginAccess();
  sub_2308E2458(a1, v3);
  return swift_endAccess();
}

uint64_t (*StateObservingNSObject.configuration.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

void StateObservingNSObject.__allocating_init(configuration:)()
{
  objc_class *v0;
  id v1;

  v1 = objc_allocWithZone(v0);
  StateObservingNSObject.init(configuration:)();
}

void StateObservingNSObject.init(configuration:)()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + direct field offset for StateObservingNSObject.cancellableSubs) = MEMORY[0x24BEE4AF8];
  v1 = v0 + direct field offset for StateObservingNSObject.configuration;
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_QWORD *)(v1 + 32) = 0;
  type metadata accessor for StateObservingNSObject();
}

id sub_2308E2054(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v6;
  uint64_t v7;
  id v8;
  _BYTE v10[112];

  *(_QWORD *)(v4 - 48) = v2;
  *(_QWORD *)(v4 - 40) = a1;
  v6 = objc_msgSendSuper2((objc_super *)(v4 - 48), sel_init);
  sub_2308DED64(v1, (uint64_t)v10);
  v7 = (uint64_t)v6 + *(_QWORD *)(v3 + 2976);
  swift_beginAccess();
  v8 = v6;
  sub_2308E2458((uint64_t)v10, v7);
  swift_endAccess();
  MEMORY[0x2348BC6F4](&protocol conformance descriptor for StateObservingNSObject<A, B>, a1);
  StateObserving.setup()();

  __swift_destroy_boxed_opaque_existential_1(v1);
  return v8;
}

id StateObservingNSObject.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void StateObservingNSObject.init()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + direct field offset for StateObservingNSObject.cancellableSubs) = MEMORY[0x24BEE4AF8];
  v1 = v0 + direct field offset for StateObservingNSObject.configuration;
  *(_OWORD *)v1 = 0u;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_QWORD *)(v1 + 32) = 0;
  type metadata accessor for StateObservingNSObject();
}

id sub_2308E2178(objc_class *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, objc_super a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  id v19;
  objc_super v21;

  v21.receiver = v17;
  v21.super_class = a1;
  v19 = -[objc_class init](&v21, sel_init);
  MEMORY[0x2348BC6F4](&protocol conformance descriptor for StateObservingNSObject<A, B>, a1);
  StateObserving.setup()();

  return v19;
}

void sub_2308E21CC()
{
  StateObservingNSObject.init()();
}

Swift::Void __swiftcall StateObservingNSObject.update()()
{
  sub_2308E6560();
  __break(1u);
}

void StateObservingNSObject.__deallocating_deinit()
{
  type metadata accessor for StateObservingNSObject();
}

id sub_2308E2278(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 - 16) = v1;
  *(_QWORD *)(v2 - 8) = a1;
  return objc_msgSendSuper2((objc_super *)(v2 - 16), sel_dealloc);
}

uint64_t sub_2308E2298(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return sub_2308E2508(a1 + direct field offset for StateObservingNSObject.configuration);
}

uint64_t sub_2308E22D0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t (*sub_2308E22E0(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = StateObservingNSObject.configuration.modify();
  return sub_2308E2324;
}

uint64_t sub_2308E2328()
{
  sub_2308E23CC();
  return swift_bridgeObjectRetain();
}

uint64_t (*sub_2308E2340(_QWORD *a1))()
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = StateObservingNSObject.cancellableSubs.modify();
  return sub_2308E2324;
}

void sub_2308E2384(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t sub_2308E23B0()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t sub_2308E23CC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + direct field offset for StateObservingNSObject.cancellableSubs;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_2308E2410(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_255E82BA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2308E2458(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_255E82BA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void type metadata accessor for StateObservingNSObject()
{
  JUMPOUT(0x2348BC6A0);
}

uint64_t sub_2308E24AC(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 96);
}

uint64_t sub_2308E24B4(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 104);
}

uint64_t sub_2308E24BC()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2308E2508(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_255E82BA8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

Swift::Void __swiftcall StateObserving.setup()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = v1;
  v3 = v0;
  v4 = sub_2308E25A0();
  if (v4)
  {
    sub_2308E28D4(v4, v3, v2);
    swift_release();
  }
}

uint64_t sub_2308E25A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t ObjectType;
  void (*v17)(uint64_t, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v24[2];
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82CA8);
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1, v3);
  v5 = (char *)v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_255E82CB0);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2308DC7A0(v0);
  v12 = *(_QWORD *)(v11 + 16);
  v28 = v7;
  if (v12)
  {
    v26 = v1;
    v27 = v6;
    v13 = v2;
    v30 = MEMORY[0x24BEE4AF8];
    sub_2308E6530();
    v14 = (uint64_t *)(v11 + 40);
    do
    {
      v15 = *v14;
      ObjectType = swift_getObjectType();
      v17 = *(void (**)(uint64_t, uint64_t))(v15 + 16);
      swift_unknownObjectRetain();
      v17(ObjectType, v15);
      swift_unknownObjectRelease();
      sub_2308E6518();
      sub_2308E653C();
      sub_2308E6548();
      sub_2308E6524();
      v14 += 2;
      --v12;
    }
    while (v12);
    v18 = v30;
    swift_bridgeObjectRelease();
    v2 = v13;
    v1 = v26;
    v6 = v27;
    v19 = *(_QWORD *)(v18 + 16);
    if (v19)
      goto LABEL_5;
LABEL_8:
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_bridgeObjectRelease();
  v18 = MEMORY[0x24BEE4AF8];
  v19 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
  if (!v19)
    goto LABEL_8;
LABEL_5:
  v20 = v19 - 1;
  if (v20)
  {
    v21 = *(_QWORD *)(v18 + 32);
    v27 = v20;
    sub_2308E0B5C(&qword_255E82B30, &qword_255E82B28, MEMORY[0x24BDB9AF8]);
    swift_retain_n();
    swift_bridgeObjectRetain();
    v22 = 0;
    v25 = v2;
    v26 = MEMORY[0x24BEE4AD8] + 8;
    v24[1] = v21;
    do
    {
      v29 = *(_QWORD *)(v18 + 8 * v22 + 40);
      v30 = v21;
      swift_retain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B28);
      sub_2308E63A4();
      sub_2308E0B5C(&qword_255E82CB8, &qword_255E82CA8, MEMORY[0x24BDB9450]);
      sub_2308E63B0();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v5, v1);
      sub_2308E0B5C(&qword_255E82CC0, &qword_255E82CB0, MEMORY[0x24BDB96C0]);
      v21 = sub_2308E6398();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v6);
      swift_release();
      swift_release();
      ++v22;
    }
    while (v27 != v22);
    swift_release();
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v21 = *(_QWORD *)(v18 + 32);
    swift_retain();
    swift_bridgeObjectRelease();
  }
  return v21;
}

_QWORD *sub_2308E28D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v6)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v7;
  _QWORD *result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  void (*v13)(_QWORD *, _QWORD);
  _QWORD v14[3];
  uint64_t v15;
  uint64_t v16;

  v6 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(a3 + 48);
  v6(v14, a2, a3);
  v7 = v15;
  sub_2308E2508((uint64_t)v14);
  if (!v7)
  {
    swift_retain();
    goto LABEL_5;
  }
  result = ((_QWORD *(*)(_QWORD *__return_ptr, uint64_t, uint64_t))v6)(v14, a2, a3);
  v9 = v15;
  if (v15)
  {
    v10 = v16;
    __swift_project_boxed_opaque_existential_1(v14, v15);
    a1 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 8))(a1, v9, v10);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v14);
LABEL_5:
    v14[0] = a1;
    v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = a2;
    v12[3] = a3;
    v12[4] = v11;
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E82B28);
    sub_2308E0B5C(&qword_255E82B30, &qword_255E82B28, MEMORY[0x24BDB9AF8]);
    sub_2308E63F8();
    swift_release();
    v13 = (void (*)(_QWORD *, _QWORD))(*(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(a3 + 88))(v14, a2, a3);
    __swift_instantiateConcreteTypeFromMangledName(&qword_255E82C98);
    sub_2308E0B5C(&qword_255E82CA0, &qword_255E82C98, MEMORY[0x24BEE12E8]);
    sub_2308E6368();
    swift_release();
    v13(v14, 0);
    return (_QWORD *)swift_release();
  }
  __break(1u);
  return result;
}

uint64_t sub_2308E2AB8()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2308E2ADC(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t AssociatedConformanceWitness;
  uint64_t v10;
  uint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v6);
  v8 = (char *)&v12 - v7;
  swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(a2 + 40))(a1, a2);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, AssociatedTypeWitness);
  return v10;
}

uint64_t sub_2308E2BCC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;

  a2[3] = __swift_instantiateConcreteTypeFromMangledName(qword_255E82CC8);
  v4 = swift_allocObject();
  *a2 = v4;
  return sub_2308E2D84(a1, v4 + 16);
}

uint64_t sub_2308E2C1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  NSObject *v9;
  _QWORD *v10;

  v6 = a2 + 16;
  swift_beginAccess();
  result = MEMORY[0x2348BC7B4](v6);
  if (result)
  {
    v8 = result;
    v9 = sub_2308E2ADC(a3, a4);
    v10 = (_QWORD *)swift_allocObject();
    v10[2] = a3;
    v10[3] = a4;
    v10[4] = v8;
    swift_unknownObjectRetain();
    sub_2308E1518(v9, (uint64_t (*)(uint64_t))sub_2308E2D30, (uint64_t)v10);
    swift_unknownObjectRelease();

    return swift_release();
  }
  return result;
}

uint64_t sub_2308E2CDC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2308E2D00(uint64_t a1)
{
  uint64_t *v1;

  return sub_2308E2C1C(a1, v1[4], v1[2], v1[3]);
}

uint64_t sub_2308E2D0C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2308E2D30()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 24) + 96))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2308E2D58()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 16);
  __swift_destroy_boxed_opaque_existential_1(v0 + 48);
  return swift_deallocObject();
}

uint64_t sub_2308E2D84(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_255E82CC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t Publisher<>.toStateChangedPublisher()(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = sub_2308E62B4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v12 - v7;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  sub_2308E63B0();
  swift_release();
  MEMORY[0x2348BC6F4](MEMORY[0x24BDB96C0], v4);
  v10 = sub_2308E6398();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v10;
}

uint64_t sub_2308E2ED0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t *boxed_opaque_existential_0;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  a2[3] = AssociatedTypeWitness;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(boxed_opaque_existential_0, a1, AssociatedTypeWitness);
}

uint64_t sub_2308E2F3C()
{
  return swift_deallocObject();
}

uint64_t sub_2308E2F4C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2308E2ED0(a1, a2);
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

uint64_t StateValue.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = *(_QWORD *)(*(_QWORD *)v3 + 80);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2308E3DB8();
  PublishedValue.wrappedValue.getter((uint64_t)v8);
  swift_release();
  sub_2308E4054((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_2308E3DB8();
  PublishedValue.wrappedValue.getter(a3);
  return swift_release();
}

uint64_t sub_2308E3044(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  sub_2308E44D4(a1, a2);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v4 + 80) - 8) + 8))(a1);
}

uint64_t StateValue.previous.getter()
{
  return sub_2308E3E14((void (*)(void))sub_2308E4758);
}

_QWORD *sub_2308E308C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v5 = *(_QWORD *)(*v2 + 80);
  v6 = sub_2308E64F4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6, v8);
  v10 = (char *)&v13 - v9;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))((char *)&v13 - v9, 1, 1, v5);
  v11 = sub_2308E45A4((uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  v2[2] = a1;
  v2[3] = v11;
  v2[4] = a2;
  return v2;
}

uint64_t StateValue.ifUpdated(_:)(void (*a1)(uint64_t), uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  void (*v28)(char *, char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  char *v33;
  void (*v34)(char *, char *, uint64_t);
  unsigned int (*v35)(char *, uint64_t, uint64_t);
  void (*v36)(uint64_t, uint64_t);
  unsigned int v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  char *v40;
  char v41;
  void (*v42)(char *, uint64_t);
  void (*v43)(uint64_t, uint64_t);
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(uint64_t);
  _QWORD *v51;
  char *v52;
  char *v53;
  uint64_t TupleTypeMetadata2;

  v49 = a2;
  v50 = a1;
  v47 = *v2;
  v3 = *(_QWORD *)(v47 + 80);
  v4 = sub_2308E64F4();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v48 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v6 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2, v5);
  v8 = (char *)&v45 - v7;
  v9 = *(_QWORD *)(v4 - 8);
  v11 = MEMORY[0x24BDAC7A8](v6, v10);
  v53 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11, v13);
  v16 = (char *)&v45 - v15;
  v18 = MEMORY[0x24BDAC7A8](v14, v17);
  v20 = (char *)&v45 - v19;
  v21 = *(_QWORD *)(v3 - 8);
  v23 = MEMORY[0x24BDAC7A8](v18, v22);
  v46 = (char *)&v45 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v23, v25);
  v27 = (char *)&v45 - v26;
  sub_2308E3DB8();
  PublishedValue.wrappedValue.getter((uint64_t)v27);
  swift_release();
  v28 = *(void (**)(char *, char *, uint64_t))(v21 + 16);
  v52 = v27;
  v29 = v27;
  v30 = v21;
  v31 = (uint64_t)v16;
  v32 = v8;
  v28(v20, v29, v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v20, 0, 1, v3);
  v51 = v2;
  swift_retain();
  sub_2308E0C28(v31);
  swift_release();
  v33 = &v8[*(int *)(TupleTypeMetadata2 + 48)];
  v34 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v34(v32, v20, v4);
  v34(v33, (char *)v31, v4);
  v35 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48);
  if (v35(v32, 1, v3) != 1)
  {
    v34(v53, v32, v4);
    if (v35(v33, 1, v3) != 1)
    {
      v40 = v46;
      (*(void (**)(char *, char *, uint64_t))(v30 + 32))(v46, v33, v3);
      v41 = sub_2308E6428();
      v42 = *(void (**)(char *, uint64_t))(v30 + 8);
      v42(v40, v3);
      v43 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
      v43(v31, v4);
      v43((uint64_t)v20, v4);
      v42(v53, v3);
      v43((uint64_t)v32, v4);
      v38 = (uint64_t)v52;
      if ((v41 & 1) != 0)
        return (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8))(v38, v3);
LABEL_8:
      v50(v38);
      sub_2308E4054(v38);
      return (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8))(v38, v3);
    }
    v39 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
    v39(v31, v4);
    v39((uint64_t)v20, v4);
    (*(void (**)(char *, uint64_t))(v30 + 8))(v53, v3);
    v38 = (uint64_t)v52;
LABEL_6:
    (*(void (**)(char *, uint64_t))(v48 + 8))(v32, TupleTypeMetadata2);
    goto LABEL_8;
  }
  v36 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v36(v31, v4);
  v36((uint64_t)v20, v4);
  v37 = v35(v33, 1, v3);
  v38 = (uint64_t)v52;
  if (v37 != 1)
    goto LABEL_6;
  v36((uint64_t)v32, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v30 + 8))(v38, v3);
}

uint64_t StateValue.ifUpdated<A>(_:_:)(_QWORD *a1, void (*a2)(uint64_t, char *), uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v5;
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
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  void (*v50)(char *, uint64_t, uint64_t);
  _QWORD *v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  void (*v56)(char *, char *, uint64_t);
  unsigned int (*v57)(uint64_t, uint64_t, uint64_t);
  void (*v58)(char *, uint64_t);
  char *v59;
  uint64_t v60;
  char *v61;
  void (*v62)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char v66;
  void (*v67)(char *, uint64_t);
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  char *v74;
  void (*v75)(char *, char *, uint64_t);
  char *v76;
  uint64_t v77;
  unsigned int (*v78)(char *, uint64_t, uint64_t);
  void (*v79)(char *, uint64_t);
  char *v80;
  void (*v81)(char *, uint64_t);
  uint64_t v82;
  char *v83;
  char v84;
  void (*v85)(char *, uint64_t);
  void (*v86)(char *, uint64_t);
  char *v87;
  _QWORD v89[2];
  void (*v90)(char *, uint64_t, uint64_t);
  uint64_t v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(uint64_t, char *);
  uint64_t v96;
  uint64_t v97;
  char *v98;
  char *v99;
  char *v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  uint64_t TupleTypeMetadata2;
  uint64_t v106;
  char *v107;
  _QWORD *v108;
  char *v109;
  _QWORD *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;

  v5 = v4;
  v89[1] = a4;
  v94 = a3;
  v95 = a2;
  v6 = *v4;
  v110 = a1;
  v7 = *(_QWORD *)(*MEMORY[0x24BEE46A8] + *a1 + 8);
  v114 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](a1, v7);
  v99 = (char *)v89 - v8;
  v112 = v9;
  v10 = sub_2308E64F4();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v93 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v12 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2, v11);
  v100 = (char *)v89 - v13;
  v101 = v10;
  v104 = *(_QWORD *)(v10 - 8);
  v15 = MEMORY[0x24BDAC7A8](v12, v14);
  v92 = (char *)v89 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x24BDAC7A8](v15, v17);
  v107 = (char *)v89 - v19;
  MEMORY[0x24BDAC7A8](v18, v20);
  v103 = (char *)v89 - v21;
  v91 = v6;
  v22 = *(_QWORD *)(v6 + 80);
  v23 = sub_2308E64F4();
  v24 = swift_getTupleTypeMetadata2();
  v96 = *(_QWORD *)(v24 - 8);
  v26 = MEMORY[0x24BDAC7A8](v24, v25);
  v28 = (char *)v89 - v27;
  v106 = *(_QWORD *)(v23 - 8);
  v30 = MEMORY[0x24BDAC7A8](v26, v29);
  v102 = (char *)v89 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = MEMORY[0x24BDAC7A8](v30, v32);
  v109 = (char *)v89 - v34;
  v36 = MEMORY[0x24BDAC7A8](v33, v35);
  v38 = (char *)v89 - v37;
  v40 = MEMORY[0x24BDAC7A8](v36, v39);
  v42 = (char *)v89 - v41;
  v43 = *(_QWORD *)(v22 - 8);
  v45 = MEMORY[0x24BDAC7A8](v40, v44);
  v98 = (char *)v89 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v45, v47);
  v49 = (char *)v89 - v48;
  sub_2308E3DB8();
  PublishedValue.wrappedValue.getter((uint64_t)v49);
  swift_release();
  v50 = *(void (**)(char *, uint64_t, uint64_t))(v43 + 16);
  v111 = v49;
  v90 = v50;
  v50(v42, (uint64_t)v49, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v43 + 56))(v42, 0, 1, v22);
  v51 = v5;
  v52 = v28;
  v108 = v51;
  swift_retain();
  sub_2308E0C28((uint64_t)v38);
  swift_release();
  v97 = v24;
  v53 = *(int *)(v24 + 48);
  v54 = v106;
  v55 = &v28[v53];
  v56 = *(void (**)(char *, char *, uint64_t))(v106 + 16);
  v56(v28, v42, v23);
  v56(v55, v38, v23);
  v113 = v43;
  v57 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v43 + 48);
  if (v57((uint64_t)v52, 1, v22) != 1)
  {
    v56(v109, v52, v23);
    if (v57((uint64_t)v55, 1, v22) != 1)
    {
      v64 = v113;
      v65 = v98;
      (*(void (**)(char *, char *, uint64_t))(v113 + 32))(v98, v55, v22);
      v66 = sub_2308E6428();
      v67 = *(void (**)(char *, uint64_t))(v64 + 8);
      v67(v65, v22);
      v58 = *(void (**)(char *, uint64_t))(v54 + 8);
      v58(v38, v23);
      v58(v42, v23);
      v67(v109, v22);
      v58(v52, v23);
      v68 = (uint64_t)v111;
      v59 = v107;
      v60 = (uint64_t)v102;
      if ((v66 & 1) != 0)
        return (*(uint64_t (**)(uint64_t, uint64_t))(v113 + 8))(v68, v22);
LABEL_7:
      v61 = v103;
      swift_getAtKeyPath();
      v62 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v114 + 56);
      v62(v61, 0, 1, v112);
      swift_retain();
      sub_2308E0C28(v60);
      swift_release();
      if (v57(v60, 1, v22))
      {
        v58((char *)v60, v23);
        v63 = 1;
      }
      else
      {
        v69 = v98;
        v90(v98, v60, v22);
        v58((char *)v60, v23);
        swift_getAtKeyPath();
        (*(void (**)(char *, uint64_t))(v113 + 8))(v69, v22);
        v63 = 0;
      }
      v70 = v104;
      v71 = v112;
      v62(v59, v63, 1, v112);
      v73 = v100;
      v72 = v101;
      v74 = &v100[*(int *)(TupleTypeMetadata2 + 48)];
      v75 = *(void (**)(char *, char *, uint64_t))(v70 + 16);
      v75(v100, v61, v101);
      v75(v74, v59, v72);
      v76 = v61;
      v77 = v70;
      v78 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v114 + 48);
      if (v78(v73, 1, v71) == 1)
      {
        v79 = *(void (**)(char *, uint64_t))(v77 + 8);
        v79(v59, v72);
        v79(v76, v72);
        if (v78(v74, 1, v71) == 1)
        {
          v79(v73, v72);
          goto LABEL_15;
        }
      }
      else
      {
        v80 = v92;
        v75(v92, v73, v72);
        if (v78(v74, 1, v71) != 1)
        {
          v82 = v114;
          v83 = v99;
          (*(void (**)(char *, char *, uint64_t))(v114 + 32))(v99, v74, v71);
          v84 = sub_2308E6428();
          v85 = *(void (**)(char *, uint64_t))(v82 + 8);
          v85(v83, v71);
          v86 = *(void (**)(char *, uint64_t))(v104 + 8);
          v86(v107, v72);
          v86(v103, v72);
          v85(v80, v71);
          v86(v73, v72);
          v68 = (uint64_t)v111;
          if ((v84 & 1) != 0)
            return (*(uint64_t (**)(uint64_t, uint64_t))(v113 + 8))(v68, v22);
LABEL_20:
          v87 = v99;
          swift_getAtKeyPath();
          v95(v68, v87);
          (*(void (**)(char *, uint64_t))(v114 + 8))(v87, v112);
          sub_2308E4054(v68);
          return (*(uint64_t (**)(uint64_t, uint64_t))(v113 + 8))(v68, v22);
        }
        v81 = *(void (**)(char *, uint64_t))(v104 + 8);
        v81(v107, v72);
        v81(v103, v72);
        (*(void (**)(char *, uint64_t))(v114 + 8))(v80, v71);
      }
      (*(void (**)(char *, uint64_t))(v93 + 8))(v73, TupleTypeMetadata2);
      v68 = (uint64_t)v111;
      goto LABEL_20;
    }
    v58 = *(void (**)(char *, uint64_t))(v54 + 8);
    v58(v38, v23);
    v58(v42, v23);
    (*(void (**)(char *, uint64_t))(v113 + 8))(v109, v22);
LABEL_6:
    v59 = v107;
    v60 = (uint64_t)v102;
    (*(void (**)(char *, uint64_t))(v96 + 8))(v52, v97);
    goto LABEL_7;
  }
  v58 = *(void (**)(char *, uint64_t))(v54 + 8);
  v58(v38, v23);
  v58(v42, v23);
  if (v57((uint64_t)v55, 1, v22) != 1)
    goto LABEL_6;
  v58(v52, v23);
LABEL_15:
  v68 = (uint64_t)v111;
  return (*(uint64_t (**)(uint64_t, uint64_t))(v113 + 8))(v68, v22);
}

uint64_t _s8Stateful17MutableStateValueC16mutateAtomicallyyyyxzcF_0(void (*a1)(char *), uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2308E3DB8();
  PublishedValue.wrappedValue.getter((uint64_t)v7);
  swift_release();
  a1(v7);
  sub_2308E4444((uint64_t)v7, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t StateValue.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t StateValue.publisher.getter()
{
  uint64_t v0;

  sub_2308E3DB8();
  v0 = PublishedValue.publisher.getter();
  swift_release();
  return v0;
}

uint64_t sub_2308E3DB8()
{
  uint64_t v1;

  swift_unknownObjectRetain();
  swift_getAtKeyPath();
  swift_unknownObjectRelease();
  return v1;
}

uint64_t sub_2308E3E08()
{
  return sub_2308E3E14((void (*)(void))PublishedValue.wrappedValue.getter);
}

uint64_t sub_2308E3E14(void (*a1)(void))
{
  sub_2308E3DB8();
  a1();
  return swift_release();
}

uint64_t StateValue.mutateImmediatelyNotifyAsync(_:)(void (*a1)(char *))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char v17;
  void (*v18)(char *, uint64_t);
  uint64_t AssociatedConformanceWitness;
  void *v20;
  uint64_t v22;
  void (*v23)(char *);

  v23 = a1;
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 96);
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v22 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v5);
  v8 = (char *)&v22 - v7;
  v9 = *(_QWORD *)(v3 - 8);
  v11 = MEMORY[0x24BDAC7A8](v6, v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11, v14);
  v16 = (char *)&v22 - v15;
  sub_2308E3DB8();
  PublishedValue.wrappedValue.getter((uint64_t)v16);
  swift_release();
  v23(v16);
  sub_2308E3DB8();
  PublishedValue.wrappedValue.getter((uint64_t)v13);
  swift_release();
  v17 = sub_2308E6428();
  v18 = *(void (**)(char *, uint64_t))(v9 + 8);
  v18(v13, v3);
  if ((v17 & 1) == 0)
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v13, v16, v3);
    (*(void (**)(uint64_t, uint64_t))(v2 + 32))(v3, v2);
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v20 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(AssociatedTypeWitness, AssociatedConformanceWitness);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v8, AssociatedTypeWitness);
    sub_2308E4638((uint64_t)v13);

    v18(v13, v3);
  }
  return ((uint64_t (*)(char *, uint64_t))v18)(v16, v3);
}

uint64_t sub_2308E4054(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v4 = sub_2308E64F4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v11 - v7;
  v9 = *(_QWORD *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v11 - v7, a1, v3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v8, 0, 1, v3);
  swift_retain();
  sub_2308E0D8C((uint64_t)v8);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

uint64_t StateValue.keyPath.getter()
{
  return swift_retain();
}

uint64_t sub_2308E4130(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  MEMORY[0x24BDAC7A8](a1, a1);
  v4 = (char *)&v7 - v3;
  (*(void (**)(char *))(v5 + 16))((char *)&v7 - v3);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 152))(v4);
}

uint64_t property wrapper backing initializer of StateValue.lastAccessedValue(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_2308E45A4(a1);
  v3 = sub_2308E64F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return v2;
}

uint64_t StateValue.projectedValue.getter()
{
  return swift_retain();
}

uint64_t StateValue.__allocating_init(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 104) + 8))();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 272))(a1, v3);
}

uint64_t sub_2308E4250(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  sub_2308E308C(a1, a2);
  return v4;
}

uint64_t StateValue.__deallocating_deinit()
{
  StateValue.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2308E42BC()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v1 = *v0;
  v2 = *(_QWORD *)(*v0 + 80);
  v3 = sub_2308E6350();
  MEMORY[0x2348BC6F4](MEMORY[0x24BDB9AF8], v3);
  v4 = sub_2308E62B4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)v13 - v7;
  sub_2308E3DB8();
  v9 = PublishedValue.publisher.getter();
  swift_release();
  v13[1] = v9;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v2;
  *(_OWORD *)(v10 + 24) = *(_OWORD *)(v1 + 88);
  *(_QWORD *)(v10 + 40) = *(_QWORD *)(v1 + 104);
  sub_2308E63B0();
  swift_release();
  swift_release();
  MEMORY[0x2348BC6F4](MEMORY[0x24BDB96C0], v4);
  v11 = sub_2308E6398();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  return v11;
}

uint64_t sub_2308E4438()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_2308E4444(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2308E3DB8();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_2308E4A74((uint64_t)v7);
  return swift_release();
}

uint64_t sub_2308E44D4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2308E3DB8();
  PublishedValue.wrappedValue.getter((uint64_t)v7);
  swift_release();
  v8 = sub_2308E6428();
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
    sub_2308E4054(a1);
    return sub_2308E4444(a1, v10);
  }
  return result;
}

uint64_t sub_2308E45A4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = sub_2308E64F4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2, v4);
  v6 = (char *)&v10 - v5;
  type metadata accessor for Synchronized(0, v2, v7, v8);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, v2);
  return sub_2308E0CAC((uint64_t)v6);
}

uint64_t sub_2308E4638(uint64_t a1)
{
  sub_2308E4054(a1);
  sub_2308E3DB8();
  sub_2308E55F0(a1);
  return swift_release();
}

uint64_t sub_2308E466C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 144))();
}

uint64_t sub_2308E4698()
{
  return 32;
}

__n128 sub_2308E46A4(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_2308E46B0()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for StateValue()
{
  JUMPOUT(0x2348BC6A0);
}

uint64_t sub_2308E470C()
{
  return swift_deallocObject();
}

uint64_t sub_2308E471C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t *boxed_opaque_existential_0;

  v4 = *(_QWORD *)(v2 + 16);
  a2[3] = v4;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a2);
  return (*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(boxed_opaque_existential_0, a1, v4);
}

uint64_t sub_2308E4758@<X0>(uint64_t a1@<X8>)
{
  swift_retain();
  sub_2308E0C28(a1);
  return swift_release();
}

uint64_t PublishedValue.publisher.getter()
{
  uint64_t *v0;
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
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v26;
  char *v27;
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

  v32 = *v0;
  v1 = sub_2308E6380();
  v2 = MEMORY[0x2348BC6F4](MEMORY[0x24BDB9D10], v1);
  v3 = sub_2308E62A8();
  v28 = *(_QWORD *)(v3 - 8);
  v29 = v3;
  MEMORY[0x24BDAC7A8](v3, v4);
  v27 = (char *)&v26 - v5;
  v6 = sub_2308E6350();
  v7 = MEMORY[0x2348BC6F4](MEMORY[0x24BDB9AF8], v6);
  v34 = v1;
  v35 = v6;
  v30 = v7;
  v31 = v2;
  v36 = v2;
  v37 = v7;
  v8 = sub_2308E62C0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8, v10);
  v12 = (char *)&v26 - v11;
  MEMORY[0x2348BC6F4](MEMORY[0x24BDB9798], v8);
  v13 = sub_2308E62A8();
  v15 = MEMORY[0x24BDAC7A8](v13, v14);
  v18 = (char *)&v26 - v17;
  v19 = v0[3];
  if (v19)
  {
    v29 = v16;
    v20 = swift_retain();
    v21 = sub_2308E4D68(v20);
    v28 = v9;
    v33 = v19;
    v34 = v21;
    sub_2308E63BC();
    swift_release();
    sub_2308E63EC();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v12, v8);
    MEMORY[0x2348BC6F4](MEMORY[0x24BDB9658], v13);
    v22 = sub_2308E6398();
    swift_release();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v18, v13);
  }
  else
  {
    v34 = sub_2308E4D68(v15);
    v23 = v27;
    sub_2308E63EC();
    swift_release();
    v24 = v29;
    MEMORY[0x2348BC6F4](MEMORY[0x24BDB9658], v29);
    v22 = sub_2308E6398();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v23, v24);
  }
  return v22;
}

uint64_t PublishedValue.wrappedValue.getter@<X0>(uint64_t a1@<X8>)
{
  swift_retain();
  sub_2308E0C28(a1);
  return swift_release();
}

uint64_t sub_2308E4A74(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v23;
  uint64_t v24;
  void *v25;
  char v27;
  void (*v28)(char *, uint64_t);
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = a1;
  v2 = *v1;
  v3 = *(_QWORD *)(v2 + 80);
  v4 = sub_2308E64F4();
  v32 = *(_QWORD *)(v4 - 8);
  v33 = v4;
  v6 = MEMORY[0x24BDAC7A8](v4, v5);
  v8 = (char *)&v31 - v7;
  v9 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v6, v10);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2308E6458();
  MEMORY[0x24BDAC7A8](v13, v14);
  v15 = *(_QWORD *)(v2 + 88);
  v16 = (void *)sub_2308E54E0(v3, v15);
  dispatch_queue_get_label(0);
  sub_2308E644C();
  v17 = sub_2308E6440();
  v19 = v18;
  v20 = sub_2308E64D0();
  if (!v19)
  {

    swift_bridgeObjectRelease();
    v24 = v34;
    goto LABEL_9;
  }
  if (v17 != v20 || v19 != v21)
  {
    v23 = sub_2308E6590();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v24 = v34;
    if ((v23 & 1) != 0)
      goto LABEL_11;
LABEL_9:
    v25 = (void *)sub_2308E54E0(v3, v15);
    sub_2308E55F0(v24);

    return (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 8))(v24, v3);
  }

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v24 = v34;
LABEL_11:
  swift_retain();
  sub_2308E0C28((uint64_t)v12);
  swift_release();
  v27 = sub_2308E6428();
  v28 = *(void (**)(char *, uint64_t))(v9 + 8);
  v28(v12, v3);
  if ((v27 & 1) != 0)
  {
    v29 = (char *)v24;
  }
  else
  {
    swift_retain();
    sub_2308E0C28((uint64_t)v8);
    swift_release();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v8, 0, 1, v3);
    sub_2308E55BC((uint64_t)v8);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v8, v33);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, v24, v3);
    swift_retain();
    sub_2308E0D8C((uint64_t)v12);
    swift_release();
    v30 = ((uint64_t (*)(char *, uint64_t))v28)(v12, v3);
    sub_2308E4D68(v30);
    PublishedValue.wrappedValue.getter((uint64_t)v12);
    sub_2308E6374();
    swift_release();
    v28((char *)v24, v3);
    v29 = v12;
  }
  return ((uint64_t (*)(char *, uint64_t))v28)(v29, v3);
}

uint64_t sub_2308E4D68(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = v1;
  MEMORY[0x24BDAC7A8](a1, *(_QWORD *)(*v1 + 80));
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v1[2])
  {
    v5 = v1[2];
  }
  else
  {
    sub_2308E6380();
    PublishedValue.wrappedValue.getter((uint64_t)v4);
    v5 = sub_2308E638C();
    v2[2] = v5;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v5;
}

uint64_t property wrapper backing initializer of PublishedValue.value(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2308E56C8(a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t property wrapper backing initializer of PublishedValue.previousValue(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_2308E45A4(a1);
  v3 = sub_2308E64F4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return v2;
}

uint64_t sub_2308E4EC4(uint64_t a1)
{
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v5;

  MEMORY[0x24BDAC7A8](a1, a1);
  v2 = (char *)&v5 - v1;
  (*(void (**)(char *))(v3 + 16))((char *)&v5 - v1);
  return sub_2308E4A74((uint64_t)v2);
}

uint64_t PublishedValue.projectedValue.getter()
{
  return swift_retain();
}

_QWORD *PublishedValue.__allocating_init(wrappedValue:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  swift_allocObject();
  v4 = sub_2308E5754(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v2 + 80) - 8) + 8))(a1);
  return v4;
}

_QWORD *PublishedValue.init(wrappedValue:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  _QWORD *v4;

  v3 = *v1;
  v4 = sub_2308E5754(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v3 + 80) - 8) + 8))(a1);
  return v4;
}

uint64_t PublishedValue.perform<A>(ifChanged:action:)(_QWORD *a1, void (*a2)(char *), uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  void (*v40)(char *, uint64_t);
  void (*v41)(char *, char *, uint64_t);
  char *v42;
  char *v43;
  void (*v44)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v45;
  char *v46;
  char *v47;
  char *v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(char *, char *, uint64_t);
  uint64_t (*v53)(char *, uint64_t, uint64_t);
  int v54;
  char *v55;
  void (*v56)(char *, uint64_t);
  int v57;
  char *v58;
  uint64_t v59;
  void (*v60)(char *, uint64_t);
  uint64_t v61;
  char v62;
  void (*v63)(uint64_t, uint64_t);
  void (*v64)(char *, uint64_t);
  _QWORD v66[3];
  uint64_t v67;
  uint64_t v68;
  void (*v69)(char *);
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  char *v77;
  uint64_t TupleTypeMetadata2;
  uint64_t v79;

  v66[1] = a4;
  v68 = a3;
  v69 = a2;
  v6 = *v4;
  v7 = *(_QWORD *)(*MEMORY[0x24BEE46A8] + *a1 + 8);
  v8 = sub_2308E64F4();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v67 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  MEMORY[0x24BDAC7A8](TupleTypeMetadata2, v9);
  v76 = (char *)v66 - v10;
  v11 = *(_QWORD *)(v6 + 80);
  v12 = sub_2308E64F4();
  v70 = *(_QWORD *)(v12 - 8);
  v71 = v12;
  v14 = MEMORY[0x24BDAC7A8](v12, v13);
  v16 = (char *)v66 - v15;
  v17 = *(_QWORD *)(v8 - 8);
  v72 = v8;
  v73 = v17;
  v19 = MEMORY[0x24BDAC7A8](v14, v18);
  v74 = (char *)v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x24BDAC7A8](v19, v21);
  v77 = (char *)v66 - v23;
  v25 = MEMORY[0x24BDAC7A8](v22, v24);
  v27 = (char *)v66 - v26;
  v28 = *(_QWORD *)(v11 - 8);
  v30 = MEMORY[0x24BDAC7A8](v25, v29);
  v32 = (char *)v66 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  v33 = *(_QWORD *)(v7 - 8);
  v35 = MEMORY[0x24BDAC7A8](v30, v34);
  v66[0] = (char *)v66 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v35, v37);
  v39 = (char *)v66 - v38;
  PublishedValue.wrappedValue.getter((uint64_t)v32);
  v66[2] = a1;
  swift_getAtKeyPath();
  v40 = *(void (**)(char *, uint64_t))(v28 + 8);
  v40(v32, v11);
  v41 = *(void (**)(char *, char *, uint64_t))(v33 + 16);
  v75 = v39;
  v42 = v39;
  v43 = v27;
  v41(v27, v42, v7);
  v79 = v33;
  v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56);
  v44(v27, 0, 1, v7);
  sub_2308E4758((uint64_t)v16);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v16, 1, v11))
  {
    (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v71);
    v45 = 1;
    v46 = v77;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v28 + 16))(v32, v16, v11);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v16, v71);
    v47 = v77;
    swift_getAtKeyPath();
    v40(v32, v11);
    v45 = 0;
    v46 = v47;
  }
  v44(v46, v45, 1, v7);
  v48 = v76;
  v49 = &v76[*(int *)(TupleTypeMetadata2 + 48)];
  v50 = v72;
  v51 = v73;
  v52 = *(void (**)(char *, char *, uint64_t))(v73 + 16);
  v52(v76, v43, v72);
  v52(v49, v46, v50);
  v53 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v79 + 48);
  v54 = v53(v48, 1, v7);
  v55 = v74;
  if (v54 != 1)
  {
    v71 = (uint64_t)v43;
    v52(v74, v48, v50);
    if (v53(v49, 1, v7) != 1)
    {
      v59 = v79;
      v61 = v66[0];
      (*(void (**)(_QWORD, char *, uint64_t))(v79 + 32))(v66[0], v49, v7);
      v62 = sub_2308E6428();
      v63 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
      v63(v61, v7);
      v64 = *(void (**)(char *, uint64_t))(v51 + 8);
      v64(v77, v50);
      v64((char *)v71, v50);
      v63((uint64_t)v55, v7);
      v64(v48, v50);
      v58 = v75;
      if ((v62 & 1) != 0)
        return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v58, v7);
LABEL_11:
      v69(v58);
      return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v58, v7);
    }
    v60 = *(void (**)(char *, uint64_t))(v51 + 8);
    v60(v77, v50);
    v60((char *)v71, v50);
    v59 = v79;
    (*(void (**)(char *, uint64_t))(v79 + 8))(v55, v7);
    v58 = v75;
LABEL_9:
    (*(void (**)(char *, uint64_t))(v67 + 8))(v48, TupleTypeMetadata2);
    goto LABEL_11;
  }
  v56 = *(void (**)(char *, uint64_t))(v51 + 8);
  v56(v46, v50);
  v56(v43, v50);
  v57 = v53(v49, 1, v7);
  v58 = v75;
  v59 = v79;
  if (v57 != 1)
    goto LABEL_9;
  v56(v48, v50);
  return (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v58, v7);
}

uint64_t PublishedValue.deinit()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return v0;
}

uint64_t PublishedValue.__deallocating_deinit()
{
  PublishedValue.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2308E54E0(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t AssociatedConformanceWitness;
  uint64_t v10;
  uint64_t v12;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness, v6);
  v8 = (char *)&v12 - v7;
  (*(void (**)(uint64_t, uint64_t))(a2 + 32))(a1, a2);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 16))(AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, AssociatedTypeWitness);
  return v10;
}

uint64_t sub_2308E55BC(uint64_t a1)
{
  swift_retain();
  sub_2308E0D8C(a1);
  return swift_release();
}

uint64_t sub_2308E55F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(char *, uint64_t);
  uint64_t v7;
  uint64_t v9;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](a1, a1);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v3 + 16))(v5);
  swift_retain();
  sub_2308E0D8C((uint64_t)v5);
  swift_release();
  v6 = *(uint64_t (**)(char *, uint64_t))(v3 + 8);
  v7 = v6(v5, v2);
  sub_2308E4D68(v7);
  PublishedValue.wrappedValue.getter((uint64_t)v5);
  sub_2308E6374();
  swift_release();
  return v6(v5, v2);
}

uint64_t sub_2308E56C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1, a2);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Synchronized(0, v7, v8, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  return sub_2308E0CAC((uint64_t)v6);
}

_QWORD *sub_2308E5754(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = *(_QWORD *)(*v1 + 80);
  v4 = sub_2308E64F4();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v12 - v7;
  v1[2] = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))((char *)&v12 - v7, 1, 1, v3);
  v9 = sub_2308E45A4((uint64_t)v8);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  v1[5] = v9;
  v10 = sub_2308E56C8(a1, v3);
  v1[3] = 0;
  v1[4] = v10;
  return v1;
}

uint64_t sub_2308E5830@<X0>(uint64_t a1@<X8>)
{
  return PublishedValue.wrappedValue.getter(a1);
}

uint64_t sub_2308E5854()
{
  return 16;
}

__n128 sub_2308E5860(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t sub_2308E586C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PublishedValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PublishedValue);
}

void static StateObserver.context.getter()
{
  sub_2308E650C();
  swift_bridgeObjectRelease();
  swift_getMetatypeMetadata();
  sub_2308E65F0();
  sub_2308E6470();
  swift_bridgeObjectRelease();
  sub_2308E6560();
  __break(1u);
}

uint64_t StateObserver.configuration.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_beginAccess();
  return sub_2308E2410(v1 + 16, a1);
}

uint64_t StateObserver.configuration.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  sub_2308E2458(a1, v1 + 16);
  return swift_endAccess();
}

uint64_t (*StateObserver.configuration.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t StateObserver.cancellableSubs.getter()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t StateObserver.cancellableSubs.setter(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 56) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*StateObserver.cancellableSubs.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void StateObserver.__allocating_init(configuration:)(uint64_t a1)
{
  swift_allocObject();
  StateObserver.init(configuration:)(a1);
}

uint64_t sub_2308E5B24()
{
  uint64_t v0;

  return v0;
}

void StateObserver.init(configuration:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _OWORD v5[3];

  v2 = *v1;
  *((_OWORD *)v1 + 2) = 0u;
  *((_OWORD *)v1 + 1) = 0u;
  v3 = MEMORY[0x24BEE4AF8];
  v1[6] = 0;
  v1[7] = v3;
  sub_2308DED64(a1, (uint64_t)v5);
  swift_beginAccess();
  sub_2308E2458((uint64_t)v5, (uint64_t)(v1 + 2));
  swift_endAccess();
  v4 = *(_OWORD *)(v2 + 96);
  v5[0] = *(_OWORD *)(v2 + 80);
  v5[1] = v4;
  type metadata accessor for StateObserver();
}

uint64_t sub_2308E5BB0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  MEMORY[0x2348BC6F4](&protocol conformance descriptor for StateObserver<A, B>, a1);
  StateObserving.setup()();
  __swift_destroy_boxed_opaque_existential_1(v1);
  return v2;
}

void type metadata accessor for StateObserver()
{
  JUMPOUT(0x2348BC6A0);
}

Swift::Void __swiftcall StateObserver.update()()
{
  sub_2308E6560();
  __break(1u);
}

uint64_t StateObserver.deinit()
{
  uint64_t v0;

  sub_2308E2508(v0 + 16);
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t StateObserver.__deallocating_deinit()
{
  uint64_t v0;

  sub_2308E2508(v0 + 16);
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_2308E5CA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  swift_beginAccess();
  return sub_2308E2410(v1 + 16, a1);
}

uint64_t sub_2308E5CEC(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  sub_2308E2458(a1, v1 + 16);
  return swift_endAccess();
}

uint64_t (*sub_2308E5D3C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2308E5D78()
{
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2308E5DAC(uint64_t a1)
{
  uint64_t v1;

  swift_beginAccess();
  *(_QWORD *)(v1 + 56) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_2308E5DF0())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_2308E5E2C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t sub_2308E5E38()
{
  return swift_initClassMetadata2();
}

uint64_t sub_2308E5E84()
{
  return 1;
}

void (*MutableStateBinding.wrappedValue.modify(_QWORD *a1))(uint64_t a1, uint64_t a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  void *v7;
  uint64_t v8;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  *v3 = v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 344);
  v3[1] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[2] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[3] = malloc(v6);
  v7 = malloc(v6);
  v3[4] = v7;
  StateValue.wrappedValue.getter((uint64_t)v7, v8, (uint64_t)v7);
  return sub_2308E062C;
}

uint64_t MutableStateBinding.projectedValue.getter()
{
  return swift_retain();
}

_QWORD *MutableStateBinding.__allocating_init(_:_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 376) + 8))();
  swift_allocObject();
  return sub_2308E308C(a1, v3);
}

void sub_2308E5F94()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t MutableStateBinding.__deallocating_deinit()
{
  StateValue.deinit();
  return swift_deallocClassInstance();
}

void type metadata accessor for MutableStateBinding()
{
  JUMPOUT(0x2348BC6A0);
}

uint64_t Configurations.Composite.init(inner:outer:)@<X0>(__int128 *a1@<X0>, __int128 *a2@<X1>, uint64_t a3@<X8>)
{
  sub_2308DF094(a1, a3);
  return sub_2308DF094(a2, a3 + 40);
}

uint64_t Configurations.Composite.stateDidChange(from:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = v1[9];
  __swift_project_boxed_opaque_existential_1(v1 + 5, v1[8]);
  v4 = v1[3];
  v5 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(a1, v4, v5);
  v6 = (*(uint64_t (**)(void))(v3 + 8))();
  swift_release();
  return v6;
}

uint64_t Configurations.Composite.inner.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2308DED64(v1, a1);
}

uint64_t Configurations.Composite.outer.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2308DED64(v1 + 40, a1);
}

ValueMetadata *type metadata accessor for Configurations.Composite()
{
  return &type metadata for Configurations.Composite;
}

void sub_2308E60E0()
{
  sub_2308E650C();
  swift_bridgeObjectRelease();
  sub_2308E65F0();
  sub_2308E6470();
  swift_bridgeObjectRelease();
  sub_2308E6560();
  __break(1u);
}

uint64_t StateBinding.projectedValue.getter()
{
  return swift_retain();
}

uint64_t StateBinding.__deallocating_deinit()
{
  StateValue.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2308E61BC()
{
  return swift_initClassMetadata2();
}

void type metadata accessor for StateBinding()
{
  JUMPOUT(0x2348BC6A0);
}

uint64_t static Optional<A>.mutationContext.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_2308E6220()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_2308E6240(uint64_t a1, uint64_t a2)
{
  return static Optional<A>.mutationContext.getter(*(_QWORD *)(a1 + 16), *(_QWORD *)(a2 - 8));
}

uint64_t sub_2308E624C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)a3 + 8);
  result = MEMORY[0x2348BC6F4](MEMORY[0x24BEE4AB8], a2, &v5);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2308E6290()
{
  return MEMORY[0x24BEE76E8]();
}

uint64_t sub_2308E629C()
{
  return MEMORY[0x24BDB9410]();
}

uint64_t sub_2308E62A8()
{
  return MEMORY[0x24BDB9648]();
}

uint64_t sub_2308E62B4()
{
  return MEMORY[0x24BDB96B0]();
}

uint64_t sub_2308E62C0()
{
  return MEMORY[0x24BDB9780]();
}

uint64_t sub_2308E62CC()
{
  return MEMORY[0x24BDB9A28]();
}

uint64_t sub_2308E62D8()
{
  return MEMORY[0x24BDB9A30]();
}

uint64_t sub_2308E62E4()
{
  return MEMORY[0x24BDB9A38]();
}

uint64_t sub_2308E62F0()
{
  return MEMORY[0x24BDB9A50]();
}

uint64_t sub_2308E62FC()
{
  return MEMORY[0x24BDB9A68]();
}

uint64_t sub_2308E6308()
{
  return MEMORY[0x24BDB9A78]();
}

uint64_t sub_2308E6314()
{
  return MEMORY[0x24BDB9A88]();
}

uint64_t sub_2308E6320()
{
  return MEMORY[0x24BDB9A90]();
}

uint64_t sub_2308E632C()
{
  return MEMORY[0x24BDB9AB0]();
}

uint64_t sub_2308E6338()
{
  return MEMORY[0x24BDB9AB8]();
}

uint64_t sub_2308E6344()
{
  return MEMORY[0x24BDB9AC0]();
}

uint64_t sub_2308E6350()
{
  return MEMORY[0x24BDB9AE0]();
}

uint64_t sub_2308E635C()
{
  return MEMORY[0x24BDB9B20]();
}

uint64_t sub_2308E6368()
{
  return MEMORY[0x24BDB9B48]();
}

uint64_t sub_2308E6374()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_2308E6380()
{
  return MEMORY[0x24BDB9CE0]();
}

uint64_t sub_2308E638C()
{
  return MEMORY[0x24BDB9CF8]();
}

uint64_t sub_2308E6398()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_2308E63A4()
{
  return MEMORY[0x24BDB9F68]();
}

uint64_t sub_2308E63B0()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_2308E63BC()
{
  return MEMORY[0x24BDB9FD8]();
}

uint64_t sub_2308E63C8()
{
  return MEMORY[0x24BDBA008]();
}

uint64_t sub_2308E63D4()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_2308E63E0()
{
  return MEMORY[0x24BDBA0E0]();
}

uint64_t sub_2308E63EC()
{
  return MEMORY[0x24BDBA0E8]();
}

uint64_t sub_2308E63F8()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2308E6404()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2308E6410()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2308E641C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2308E6428()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2308E6434()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_2308E6440()
{
  return MEMORY[0x24BDCFA80]();
}

uint64_t sub_2308E644C()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_2308E6458()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_2308E6464()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2308E6470()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2308E647C()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2308E6488()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_2308E6494()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2308E64A0()
{
  return MEMORY[0x24BEE19B8]();
}

uint64_t sub_2308E64AC()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_2308E64B8()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_2308E64C4()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2308E64D0()
{
  return MEMORY[0x24BEE57A8]();
}

uint64_t sub_2308E64DC()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2308E64E8()
{
  return MEMORY[0x24BEE79A0]();
}

uint64_t sub_2308E64F4()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2308E6500()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2308E650C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2308E6518()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2308E6524()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2308E6530()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2308E653C()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2308E6548()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2308E6554()
{
  return MEMORY[0x24BEE2B80]();
}

uint64_t sub_2308E6560()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2308E656C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2308E6578()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2308E6584()
{
  return MEMORY[0x24BEE30D0]();
}

uint64_t sub_2308E6590()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2308E659C()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2308E65A8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2308E65B4()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2308E65C0()
{
  return MEMORY[0x24BEE4350]();
}

uint64_t sub_2308E65CC()
{
  return MEMORY[0x24BEE4358]();
}

uint64_t sub_2308E65D8()
{
  return MEMORY[0x24BEE43D0]();
}

uint64_t sub_2308E65E4()
{
  return MEMORY[0x24BEE43D8]();
}

uint64_t sub_2308E65F0()
{
  return MEMORY[0x24BEE4A98]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
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

uint64_t swift_deletedMethodError()
{
  return MEMORY[0x24BEE4C28]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

