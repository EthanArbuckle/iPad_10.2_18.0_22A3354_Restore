uint64_t sub_2487872F4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24959AEB4](MEMORY[0x24BDD0238], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_248787334()
{
  return MEMORY[0x24BEE0D10];
}

char *keypath_get_selector_favoritePhrases()
{
  return sel_favoritePhrases;
}

char *keypath_get_selector_liveSpeechMaxRecentsCount()
{
  return sel_liveSpeechMaxRecentsCount;
}

ValueMetadata *type metadata accessor for TTSVBLiveSpeechSupport()
{
  return &type metadata for TTSVBLiveSpeechSupport;
}

uint64_t type metadata accessor for LiveSpeechCategory(uint64_t a1)
{
  return sub_24870A34C(a1, qword_25778E0F8);
}

uint64_t sub_24878737C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_248787388()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t storeEnumTagSinglePayload for SystemCategory(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2487873F8 + 4 * byte_2487BFEE5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24878742C + 4 * byte_2487BFEE0[v4]))();
}

uint64_t sub_24878742C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_248787434(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24878743CLL);
  return result;
}

uint64_t sub_248787448(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x248787450);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_248787454(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24878745C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for SystemCategory()
{
  return &type metadata for SystemCategory;
}

uint64_t sub_248787478()
{
  return sub_24871869C(&qword_25777D898, &qword_25777D8A0, MEMORY[0x24BEE12E0]);
}

unint64_t sub_2487874A8()
{
  unint64_t result;

  result = qword_25778E200[0];
  if (!qword_25778E200[0])
  {
    result = MEMORY[0x24959AEB4](&unk_2487C00B8, &type metadata for SystemCategory);
    atomic_store(result, qword_25778E200);
  }
  return result;
}

uint64_t sub_248787508()
{
  uint64_t *v0;
  id v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  if (*v0)
    return sub_2487875E8(*v0);
  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_entity);
  v3 = objc_msgSend(v2, sel_attributesByName);
  sub_24870A34C(0, &qword_25445F160);
  v4 = sub_2487B5474();

  v5 = sub_248788AF8(v4);
  swift_bridgeObjectRelease();
  v6 = sub_2487875E8((uint64_t)v5);

  swift_release();
  return v6;
}

uint64_t sub_2487875E8(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v9 = MEMORY[0x24BEE4AF8];
    sub_248788CA0(0, v1, 0);
    v2 = v9;
    v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_248788CA0(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_248788CA0(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      v4 += 16;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_24870A40C(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

id static DSO<>.entity.getter()
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_entity);
}

void static DSO<>.entityName.getter(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = (void *)(*(uint64_t (**)(void))(a2 + 8))();
  v3 = objc_msgSend(v2, sel_name);

  if (v3)
  {
    sub_2487B5528();

  }
  else
  {
    __break(1u);
  }
}

uint64_t static DSO<>.count(in:configure:)(uint64_t a1, void (*a2)(void), uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v8;
  id v9;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25445F148);
  (*(void (**)(uint64_t, uint64_t))(a5 + 16))(a4, a5);
  v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v9 = sub_248788AA4();
  a2();
  v10 = sub_2487B58AC();

  return v10;
}

void static DSO<>.hydrated(in:matching:)(void *a1, void *a2)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  int64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v2 = objc_msgSend(a1, sel_registeredObjects);
  sub_24870A34C(0, &qword_25777D8A8);
  sub_248788BDC();
  v3 = sub_2487B5750();

  if ((v3 & 0xC000000000000001) != 0)
  {
    sub_2487B5A20();
    sub_2487B575C();
    v3 = v22;
    v20 = v23;
    v4 = v24;
    v5 = v25;
    v6 = v26;
  }
  else
  {
    v5 = 0;
    v7 = -1 << *(_BYTE *)(v3 + 32);
    v20 = v3 + 56;
    v4 = ~v7;
    v8 = -v7;
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v6 = v9 & *(_QWORD *)(v3 + 56);
  }
  v10 = (unint64_t)(v4 + 64) >> 6;
  while (v3 < 0)
  {
    if (!sub_2487B5A44())
      goto LABEL_33;
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v14 = v21;
    swift_unknownObjectRelease();
    v13 = v5;
    v11 = v6;
    if (!v21)
      goto LABEL_33;
LABEL_30:
    if ((objc_msgSend(v14, sel_isFault) & 1) == 0)
    {
      v18 = swift_dynamicCastUnknownClass();
      if (v18)
      {
        if (objc_msgSend(a2, sel_evaluateWithObject_, v18))
          goto LABEL_33;
      }
    }

    v5 = v13;
    v6 = v11;
  }
  if (v6)
  {
    v11 = (v6 - 1) & v6;
    v12 = __clz(__rbit64(v6)) | (v5 << 6);
    v13 = v5;
LABEL_29:
    v14 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v12);
    if (!v14)
      goto LABEL_33;
    goto LABEL_30;
  }
  v15 = v5 + 1;
  if (!__OFADD__(v5, 1))
  {
    if (v15 >= v10)
      goto LABEL_33;
    v16 = *(_QWORD *)(v20 + 8 * v15);
    v13 = v5 + 1;
    if (!v16)
    {
      v13 = v5 + 2;
      if (v5 + 2 >= v10)
        goto LABEL_33;
      v16 = *(_QWORD *)(v20 + 8 * v13);
      if (!v16)
      {
        v13 = v5 + 3;
        if (v5 + 3 >= v10)
          goto LABEL_33;
        v16 = *(_QWORD *)(v20 + 8 * v13);
        if (!v16)
        {
          v13 = v5 + 4;
          if (v5 + 4 >= v10)
            goto LABEL_33;
          v16 = *(_QWORD *)(v20 + 8 * v13);
          if (!v16)
          {
            v17 = v5 + 5;
            while (v10 != v17)
            {
              v16 = *(_QWORD *)(v20 + 8 * v17++);
              if (v16)
              {
                v13 = v17 - 1;
                goto LABEL_28;
              }
            }
LABEL_33:
            sub_248750938();
            return;
          }
        }
      }
    }
LABEL_28:
    v11 = (v16 - 1) & v16;
    v12 = __clz(__rbit64(v16)) + (v13 << 6);
    goto LABEL_29;
  }
  __break(1u);
}

uint64_t (*sub_248787BD4(uint64_t a1, uint64_t a2))()
{
  uint64_t v4;

  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a2;
  return nullsub_1;
}

uint64_t static DSO<>.fetch(in:config:)(uint64_t a1, void (*a2)(id), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;

  v8 = sub_2487B533C();
  MEMORY[0x24BDAC7A8](v8);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445F148);
  (*(void (**)(uint64_t, uint64_t))(a5 + 16))(a4, a5);
  v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v10 = sub_248788AA4();
  objc_msgSend(v10, sel_setReturnsObjectsAsFaults_, 1);
  a2(v10);
  v11 = sub_2487B58B8();

  return v11;
}

uint64_t static DSO<>.fetch(properties:in:config:)(uint64_t a1, uint64_t a2, void (*a3)(id), uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v18 = sub_2487B533C();
  MEMORY[0x24BDAC7A8](v18);
  (*(void (**)(uint64_t, uint64_t))(a6 + 16))(a5, a6);
  v9 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v10 = (void *)sub_2487B5504();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v9, sel_initWithEntityName_, v10);

  objc_msgSend(v11, sel_setResultType_, 2);
  type metadata accessor for DSOFetchProperties(0, a5, v12, v13);
  sub_248787508();
  v14 = (void *)sub_2487B566C();
  swift_bridgeObjectRelease();
  objc_msgSend(v11, sel_setPropertiesToFetch_, v14);

  a3(v11);
  sub_24870A34C(0, &qword_25777D8B8);
  v15 = sub_2487B58B8();
  v16 = sub_2487881EC(v15);
  swift_bridgeObjectRelease();

  if (v16)
    return v16;
  else
    return MEMORY[0x24BEE4AF8];
}

uint64_t sub_2487881EC(unint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v10;

  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_2487B5B64();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v10 = MEMORY[0x24BEE4AF8];
  sub_248788CBC(0, v3 & ~(v3 >> 63), 0);
  v4 = v10;
  if (v2)
  {
    swift_bridgeObjectRetain();
    v6 = sub_2487B5B64();
    swift_bridgeObjectRelease();
    if (!v6)
      return v4;
  }
  else if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    return v4;
  }
  if ((a1 & 0xC000000000000001) != 0)
    v7 = (id)MEMORY[0x24959A434](0, a1);
  else
    v7 = *(id *)(a1 + 32);
  v8 = v7;
  sub_2487B5468();

  swift_release();
  return 0;
}

void static DSO<>.findOrFetch(in:matching:)(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[7];

  static DSO<>.hydrated(in:matching:)(a1, a2);
  if (!v8)
  {
    MEMORY[0x24BDAC7A8](0);
    v10[2] = a3;
    v10[3] = a4;
    v10[4] = a2;
    v10[6] = static DSO<>.fetch(in:config:)((uint64_t)a1, (void (*)(id))sub_248788C50, (uint64_t)v10, a3, a4);
    v9 = sub_2487B56CC();
    MEMORY[0x24959AEB4](MEMORY[0x24BEE12E0], v9);
    sub_2487B5774();
    swift_bridgeObjectRelease();
  }
}

uint64_t static DSO<>.findOrCreate(in:matching:config:)(void *a1, void *a2, void (*a3)(void), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;

  static DSO<>.findOrFetch(in:matching:)(a1, a2, a5, a6);
  if (v9)
    return v9;
  v10 = NSManagedObjectContext.insertDSO<A>(_:)(0, a5, a6);
  a3();
  return v10;
}

uint64_t NSManagedObjectContext.insertDSO<A>(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v7;
  void *v8;
  id v9;
  uint64_t result;

  v4 = v3;
  v7 = (void *)objc_opt_self();
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  v8 = (void *)sub_2487B5504();
  swift_bridgeObjectRelease();
  v9 = objc_msgSend(v7, sel_insertNewObjectForEntityForName_inManagedObjectContext_, v8, v4);

  result = swift_dynamicCastUnknownClass();
  if (!result)
  {

    result = sub_2487B5B58();
    __break(1u);
  }
  return result;
}

void DSO<>.refresh(_:)(char a1)
{
  void *v1;
  id v3;

  v3 = objc_msgSend(v1, sel_managedObjectContext);
  objc_msgSend(v3, sel_refreshObject_mergeChanges_, v1, a1 & 1);

}

uint64_t DSO<>.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  void *v3;
  id v7;
  uint64_t v8;
  unint64_t v9;
  char v10;

  v7 = objc_msgSend(v3, sel_changedValues);
  v8 = sub_2487B5474();

  if (*(_QWORD *)(v8 + 16))
  {
    swift_bridgeObjectRetain();
    v9 = sub_248709700(a1, a2);
    if ((v10 & 1) != 0)
    {
      sub_2486F0814(*(_QWORD *)(v8 + 56) + 32 * v9, (uint64_t)a3);
    }
    else
    {
      *a3 = 0u;
      a3[1] = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    *a3 = 0u;
    a3[1] = 0u;
  }
  return swift_bridgeObjectRelease();
}

{
  void *v3;
  void *v4;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  char v13;

  v4 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445F1A8);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2487B72B0;
  *(_QWORD *)(v8 + 32) = a1;
  *(_QWORD *)(v8 + 40) = a2;
  swift_bridgeObjectRetain();
  v9 = (void *)sub_2487B566C();
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v4, sel_committedValuesForKeys_, v9);

  v11 = sub_2487B5474();
  if (*(_QWORD *)(v11 + 16))
  {
    swift_bridgeObjectRetain();
    v12 = sub_248709700(a1, a2);
    if ((v13 & 1) != 0)
    {
      sub_2486F0814(*(_QWORD *)(v11 + 56) + 32 * v12, (uint64_t)a3);
    }
    else
    {
      *a3 = 0u;
      a3[1] = 0u;
    }
    swift_bridgeObjectRelease();
  }
  else
  {
    *a3 = 0u;
    a3[1] = 0u;
  }
  return swift_bridgeObjectRelease();
}

Swift::Bool __swiftcall NSManagedObjectContext.saveOrRollback()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unsigned int v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v16[2];

  v1 = v0;
  v16[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = sub_2487B533C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[0] = 0;
  v6 = objc_msgSend(v1, sel_save_, v16);
  if (v6)
  {
    v7 = v16[0];
  }
  else
  {
    v8 = v16[0];
    v9 = (void *)sub_2487B4F64();

    swift_willThrow();
    v10 = sub_2487B0D54();
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v10, v2);
    v11 = sub_2487B5324();
    v12 = sub_2487B57D4();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2486E6000, v11, v12, "CoreData save failed! Rolling back context", v13, 2u);
      MEMORY[0x24959AF80](v13, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    objc_msgSend(v1, sel_rollback);

  }
  return v6;
}

Swift::Void __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> NSManagedObjectContext.trySave()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  _BYTE v4[16];
  uint64_t v5;
  __int128 v6;
  char v7;

  v1 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v4[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = v0;
  v6 = xmmword_2487C00E0;
  v7 = 3;
  swift_storeEnumTagMultiPayload();
  static TTSVBError.perform<A>(_:problem:reason:)((void (*)(uint64_t))sub_248788FCC, (uint64_t)v4, (uint64_t)&v6, (uint64_t)v3);
  sub_248789040((uint64_t)v3);
}

id sub_248788AA4()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_2487B5504();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

_QWORD *sub_248788AF8(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25445F1A8);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 17;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 4);
  v6 = sub_248789218((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_248750938();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

unint64_t sub_248788BDC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25777D8B0;
  if (!qword_25777D8B0)
  {
    v1 = sub_24870A34C(255, &qword_25777D8A8);
    result = MEMORY[0x24959AEB4](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_25777D8B0);
  }
  return result;
}

uint64_t sub_248788C34()
{
  return swift_deallocObject();
}

uint64_t type metadata accessor for DSOFetchProperties(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for DSOFetchProperties);
}

id sub_248788C50(void *a1)
{
  uint64_t v1;

  objc_msgSend(a1, sel_setPredicate_, *(_QWORD *)(v1 + 32));
  objc_msgSend(a1, sel_setReturnsObjectsAsFaults_, 1);
  return objc_msgSend(a1, sel_setFetchLimit_, 1);
}

uint64_t sub_248788CA0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_248788CD8(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_248788CBC(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_248788E44(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_248788CD8(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25777D8C0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2487B5B94();
  __break(1u);
  return result;
}

uint64_t sub_248788E44(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25777D888);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v13 = (unint64_t)(v10 + 4);
  v14 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= v14 + 8 * v8)
      memmove(v10 + 4, a4 + 4, 8 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 8 * v8 || v13 >= v14 + 8 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445F120);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2487B5B94();
  __break(1u);
  return result;
}

id sub_248788FCC()
{
  uint64_t v0;
  void *v1;
  id v3;
  id v4;

  v1 = *(void **)(v0 + 16);
  v4 = 0;
  if (objc_msgSend(v1, sel_save_, &v4))
    return v4;
  v3 = v4;
  sub_2487B4F64();

  return (id)swift_willThrow();
}

uint64_t sub_248789040(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TTSVBError.Reason(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t dispatch thunk of static DSO.entity.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of static DSO.entityName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_24878908C()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_248789094(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_2487890C0()
{
  return swift_bridgeObjectRelease();
}

_QWORD *sub_2487890C8(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

_QWORD *sub_24878910C(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_24878913C(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 8))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t sub_24878918C(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t sub_2487891E0(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_2487891F8(_QWORD *result, int a2)
{
  unsigned int v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
  }
  else
  {
    if (!a2)
      return result;
    v2 = a2 - 1;
  }
  *result = v2;
  return result;
}

uint64_t sub_248789218(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  _QWORD *v20;
  uint64_t v21;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    v20 = (_QWORD *)(*(_QWORD *)(a4 + 48) + 16 * v16);
    v21 = v20[1];
    *v11 = *v20;
    v11[1] = v21;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 2;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24959AE30](a1, v6, a5);
}

TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional __swiftcall TTSVBTrainingScriptItem.CodingKeys.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2487B5BAC();
  result.value = swift_bridgeObjectRelease();
  v5 = 9;
  if (v3 < 9)
    v5 = v3;
  *v2 = v5;
  return result;
}

TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional __swiftcall TTSVBTrainingScriptItem.CodingKeys.init(stringValue:)(Swift::String stringValue)
{
  _BYTE *v1;
  _BYTE *v2;
  TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional result;
  char v4;

  v2 = v1;
  result.value = TTSVBTrainingScriptItem.CodingKeys.init(rawValue:)(stringValue).value;
  *v2 = v4;
  return result;
}

TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional __swiftcall TTSVBTrainingScriptItem.CodingKeys.init(intValue:)(Swift::Int intValue)
{
  _BYTE *v1;

  *v1 = 9;
  return (TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional)intValue;
}

uint64_t TTSVBTrainingScriptItem.CodingKeys.intValue.getter()
{
  return 0;
}

uint64_t TTSVBTrainingScriptItem.CodingKeys.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_248789524 + 4 * byte_2487C0140[*v0]))(0x636E617265747475, 0xEE00656D616E5F65);
}

uint64_t sub_248789524()
{
  return 0x697263736E617274;
}

uint64_t sub_248789548()
{
  return 0x7364726F77;
}

uint64_t sub_24878955C()
{
  return 0x65735F656E6F6870;
}

uint64_t sub_248789580()
{
  return 0x745F747069726373;
}

uint64_t sub_2487895A0()
{
  return 0x7061726761726170;
}

uint64_t sub_2487895C4()
{
  return 0x65636E65746E6573;
}

unint64_t sub_2487895E4()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_248789600()
{
  return 0x656C61636F6CLL;
}

uint64_t TTSVBTrainingScriptItem.CodingKeys.stringValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_248789650 + 4 * byte_2487C0149[*v0]))(0x636E617265747475, 0xEE00656D616E5F65);
}

uint64_t sub_248789650()
{
  return 0x697263736E617274;
}

uint64_t sub_248789674()
{
  return 0x7364726F77;
}

uint64_t sub_248789688()
{
  return 0x65735F656E6F6870;
}

uint64_t sub_2487896AC()
{
  return 0x745F747069726373;
}

uint64_t sub_2487896CC()
{
  return 0x7061726761726170;
}

uint64_t sub_2487896F0()
{
  return 0x65636E65746E6573;
}

unint64_t sub_248789710()
{
  return 0xD00000000000001BLL;
}

uint64_t sub_24878972C()
{
  return 0x656C61636F6CLL;
}

void sub_248789740(char *a1)
{
  sub_24878974C(*a1);
}

void sub_24878974C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_2487897B8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_2487898C0 + 4 * byte_2487C015B[a2]))(0x697263736E617274);
}

uint64_t sub_2487898C0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x697263736E617274 && v1 == 0xED00006E6F697470)
    v2 = 1;
  else
    v2 = sub_2487B5CE4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_248789A1C()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_2487B5D5C();
  sub_248789A68((uint64_t)v3, v1);
  return sub_2487B5D98();
}

void sub_248789A60(uint64_t a1)
{
  char *v1;

  sub_248789A68(a1, *v1);
}

void sub_248789A68(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_248789AB4()
{
  sub_2487B557C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_248789BB8()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_2487B5D5C();
  sub_248789A68((uint64_t)v3, v1);
  return sub_2487B5D98();
}

TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional sub_248789BF8(Swift::String *a1)
{
  return TTSVBTrainingScriptItem.CodingKeys.init(rawValue:)(*a1);
}

uint64_t sub_248789C04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = TTSVBTrainingScriptItem.CodingKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional sub_248789C2C@<W0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem::CodingKeys_optional result;
  char v5;

  result.value = TTSVBTrainingScriptItem.CodingKeys.init(rawValue:)(*(Swift::String *)&a1).value;
  *a2 = v5;
  return result;
}

void sub_248789C60(_BYTE *a1@<X8>)
{
  *a1 = 9;
}

uint64_t sub_248789C6C()
{
  sub_248791194();
  return sub_2487B5DBC();
}

uint64_t sub_248789C94()
{
  sub_248791194();
  return sub_2487B5DC8();
}

void __swiftcall TTSVBTrainingScriptItem.init(id:transcript:phrase:phonemes:bookTitle:paragraphIndex:sentenceIndex:estimatedDuration:locale:)(TextToSpeechVoiceBankingSupport::TTSVBTrainingScriptItem *__return_ptr retstr, Swift::String id, Swift::String transcript, Swift::String phrase, Swift::String phonemes, Swift::String bookTitle, Swift::Int paragraphIndex, Swift::Int sentenceIndex, Swift::Double estimatedDuration, Swift::String locale)
{
  retstr->id = id;
  retstr->transcript = transcript;
  retstr->phrase = phrase;
  retstr->phonemes = phonemes;
  retstr->bookTitle = bookTitle;
  retstr->paragraphIndex = paragraphIndex;
  retstr->sentenceIndex = sentenceIndex;
  retstr->estimatedDuration = estimatedDuration;
  retstr->locale = locale;
}

uint64_t TTSVBTrainingScriptItem.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBTrainingScriptItem.transcript.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBTrainingScriptItem.phrase.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBTrainingScriptItem.phonemes.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBTrainingScriptItem.bookTitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBTrainingScriptItem.paragraphIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 80);
}

uint64_t TTSVBTrainingScriptItem.sentenceIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 88);
}

double TTSVBTrainingScriptItem.estimatedDuration.getter()
{
  uint64_t v0;

  return *(double *)(v0 + 96);
}

uint64_t TTSVBTrainingScriptItem.locale.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 104);
  swift_bridgeObjectRetain();
  return v1;
}

unint64_t TTSVBTrainingScriptItem.description.getter()
{
  sub_2487B5AA4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  sub_2487B55AC();
  swift_bridgeObjectRetain();
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  sub_2487B55AC();
  return 0xD000000000000018;
}

uint64_t TTSVBTrainingScriptItem.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  sub_2487B5D68();
  sub_2487B5D68();
  sub_2487B5D8C();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  return swift_bridgeObjectRelease();
}

uint64_t TTSVBTrainingScriptItem.encode(to:)(_QWORD *a1)
{
  _QWORD *v1;
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
  _QWORD v15[14];
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777D8C8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[2];
  v15[11] = v1[3];
  v15[12] = v7;
  v8 = v1[4];
  v15[9] = v1[5];
  v15[10] = v8;
  v9 = v1[6];
  v15[7] = v1[7];
  v15[8] = v9;
  v10 = v1[8];
  v15[5] = v1[9];
  v15[6] = v10;
  v11 = v1[10];
  v15[3] = v1[11];
  v15[4] = v11;
  v12 = v1[13];
  v15[1] = v1[14];
  v15[2] = v12;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_248791194();
  sub_2487B5DB0();
  v24 = 0;
  v13 = v15[13];
  sub_2487B5C6C();
  if (!v13)
  {
    v23 = 1;
    sub_2487B5C6C();
    v22 = 2;
    sub_2487B5C6C();
    v21 = 3;
    sub_2487B5C6C();
    v20 = 4;
    sub_2487B5C6C();
    v19 = 5;
    sub_2487B5C9C();
    v18 = 6;
    sub_2487B5C9C();
    v17 = 7;
    sub_2487B5C84();
    v16 = 8;
    sub_2487B5C6C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t TTSVBTrainingScriptItem.hashValue.getter()
{
  sub_2487B5D5C();
  TTSVBTrainingScriptItem.hash(into:)();
  return sub_2487B5D98();
}

uint64_t TTSVBTrainingScriptItem.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
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
  char v41;
  char v42;
  char v43;
  char v44;
  char v45;
  char v46;
  char v47;
  char v48;
  char v49;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777D8D8);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_248791194();
  sub_2487B5DA4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v49 = 0;
  v10 = sub_2487B5BE8();
  v12 = v11;
  v48 = 1;
  swift_bridgeObjectRetain();
  v37 = sub_2487B5BE8();
  v38 = v10;
  v47 = 2;
  v14 = v13;
  swift_bridgeObjectRetain();
  v15 = sub_2487B5BE8();
  v40 = v14;
  v36 = v15;
  v46 = 3;
  v39 = v16;
  swift_bridgeObjectRetain();
  v17 = sub_2487B5BE8();
  v19 = v18;
  v35 = v17;
  v45 = 4;
  swift_bridgeObjectRetain();
  v33 = sub_2487B5BE8();
  v34 = v20;
  v44 = 5;
  swift_bridgeObjectRetain();
  v32 = sub_2487B5C18();
  v43 = 6;
  v31 = sub_2487B5C18();
  v42 = 7;
  sub_2487B5C00();
  v30 = v21;
  v41 = 8;
  v29 = sub_2487B5BE8();
  v23 = v22;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  swift_bridgeObjectRetain();
  v24 = v40;
  swift_bridgeObjectRetain();
  v25 = v39;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a2 = v38;
  a2[1] = v12;
  a2[2] = v37;
  a2[3] = v24;
  a2[4] = v36;
  a2[5] = v25;
  v26 = v34;
  a2[6] = v35;
  a2[7] = v19;
  a2[8] = v33;
  a2[9] = v26;
  v27 = v31;
  a2[10] = v32;
  a2[11] = v27;
  a2[12] = v30;
  a2[13] = v29;
  a2[14] = v23;
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24878A848@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return TTSVBTrainingScriptItem.init(from:)(a1, a2);
}

uint64_t sub_24878A85C(_QWORD *a1)
{
  return TTSVBTrainingScriptItem.encode(to:)(a1);
}

uint64_t sub_24878A870()
{
  sub_2487B5D5C();
  TTSVBTrainingScriptItem.hash(into:)();
  return sub_2487B5D98();
}

uint64_t sub_24878A8EC()
{
  sub_2487B5D5C();
  TTSVBTrainingScriptItem.hash(into:)();
  return sub_2487B5D98();
}

uint64_t sub_24878A960@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t TTSVBTrainingScript.items.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t static TTSVBTrainingScript.parseScript(fromMetadatFile:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[2];
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _BYTE v35[16];
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  char v40;
  uint64_t v41;

  v34 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED50);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = type metadata accessor for TTSVBError(0);
  v7 = *(_QWORD *)(v41 - 8);
  MEMORY[0x24BDAC7A8](v41);
  v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = a1;
  v39 = xmmword_2487BE620;
  v40 = 3;
  v13 = sub_2487B50CC();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v12, a1, v13);
  swift_storeEnumTagMultiPayload();
  static TTSVBError.perform<A>(_:problem:reason:)((void (*)(uint64_t))sub_2487911D8, (uint64_t)v35, (uint64_t)&v39, (uint64_t)v12);
  result = sub_2486EDA68((uint64_t)v12, type metadata accessor for TTSVBError.Reason);
  if (!v2)
  {
    v29 = v9;
    v16 = v37;
    v15 = v38;
    sub_2487B4E2C();
    swift_allocObject();
    v17 = sub_2487B4E20();
    v18 = swift_allocObject();
    *(_QWORD *)(v18 + 16) = MEMORY[0x24BEE4AF8];
    v28[1] = v18 + 16;
    v19 = swift_allocBox();
    v21 = v20;
    v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56);
    v30 = v7;
    v23 = v41;
    v22(v20, 1, 1, v41);
    *(_QWORD *)&v39 = v16;
    *((_QWORD *)&v39 + 1) = v15;
    v24 = (_QWORD *)swift_allocObject();
    v24[2] = v17;
    v24[3] = v18;
    v24[4] = v19;
    sub_2486ED9E0();
    v32 = v17;
    swift_retain();
    v31 = v18;
    swift_retain();
    v33 = v19;
    swift_retain();
    sub_2487B5960();
    swift_bridgeObjectRelease();
    swift_release();
    swift_beginAccess();
    sub_248791254(v21, (uint64_t)v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v6, 1, v23) == 1)
    {
      swift_release();
      sub_24875D67C((uint64_t)v6);
      swift_beginAccess();
      v25 = *(_QWORD *)(v31 + 16);
      swift_bridgeObjectRetain();
      swift_release();
      result = swift_release();
      *v34 = v25;
    }
    else
    {
      v26 = (uint64_t)v29;
      sub_248761C5C((uint64_t)v6, (uint64_t)v29);
      sub_2486EDB24();
      swift_allocError();
      sub_2486F4994(v26, v27);
      swift_willThrow();
      swift_release();
      sub_2486EDA68(v26, type metadata accessor for TTSVBError);
      swift_release();
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_24878ACFC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;

  v3 = sub_2487B5558();
  MEMORY[0x24BDAC7A8](v3);
  sub_2487B554C();
  result = sub_2487B54E0();
  if (!v1)
  {
    *a1 = result;
    a1[1] = v5;
  }
  return result;
}

uint64_t sub_24878AD80(uint64_t a1, uint64_t a2, _BYTE *a3, uint64_t a4, uint64_t a5)
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
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  __int128 v23;
  unsigned __int8 v24;
  uint64_t v25;
  uint64_t result;
  char **v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v36;
  unint64_t v37;
  char *v38;
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
  _BYTE *v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  _BYTE *v57;
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
  __int128 v68;
  char v69;

  v52 = a5;
  v53 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED50);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v44 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = swift_projectBox();
  v13 = sub_2487B5558();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487B554C();
  v17 = sub_2487B5534();
  v19 = v18;
  v20 = (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  if (v19 >> 60 == 15)
  {
    v54 = xmmword_2487BE620;
    LOBYTE(v55) = 3;
    swift_storeEnumTagMultiPayload();
    type metadata accessor for TTSVBError(0);
    sub_2486EDB24();
    v21 = (void *)swift_allocError();
    TTSVBError.init(_:_:_:)((uint64_t)&v54, (uint64_t)v11, 0, v22);
    swift_willThrow();
    sub_2486F8E48((uint64_t)&v54);
    v23 = v54;
    v24 = v55;
    v68 = v54;
    v69 = v55;
    static TTSVBError.map(_:_:)(v21, (uint64_t)&v68, (uint64_t)v8);

    sub_2486F507C(v23, *((uint64_t *)&v23 + 1), v24);
    v25 = type metadata accessor for TTSVBError(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v8, 0, 1, v25);
    swift_beginAccess();
    result = sub_2487626F4((uint64_t)v8, v12);
    *v53 = 1;
  }
  else
  {
    MEMORY[0x24BDAC7A8](v20);
    *(&v44 - 4) = a4;
    *(&v44 - 3) = v17;
    *(&v44 - 2) = v19;
    static TTSVBError.perform<A>(_:errorTransform:)((void (*)(void))sub_248791F88, (uint64_t)(&v44 - 6), (void (*)(void *))sub_24878B1E0);
    v27 = (char **)(v52 + 16);
    v28 = v54;
    v29 = v55;
    v30 = v56;
    v31 = v57;
    v32 = v58;
    v51 = v59;
    v50 = v60;
    v49 = v61;
    v48 = v62;
    v47 = v63;
    v46 = v64;
    v33 = v65;
    v45 = v66;
    v44 = v67;
    swift_beginAccess();
    v34 = *v27;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *v27 = v34;
    v53 = v31;
    v52 = v32;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v34 = sub_24878C760(0, *((_QWORD *)v34 + 2) + 1, 1, v34);
      *v27 = v34;
    }
    v37 = *((_QWORD *)v34 + 2);
    v36 = *((_QWORD *)v34 + 3);
    if (v37 >= v36 >> 1)
    {
      v34 = sub_24878C760((char *)(v36 > 1), v37 + 1, 1, v34);
      *v27 = v34;
    }
    *((_QWORD *)v34 + 2) = v37 + 1;
    v38 = &v34[120 * v37];
    *((_OWORD *)v38 + 2) = v28;
    *((_QWORD *)v38 + 6) = v29;
    *((_QWORD *)v38 + 7) = v30;
    v39 = v52;
    *((_QWORD *)v38 + 8) = v53;
    *((_QWORD *)v38 + 9) = v39;
    v40 = v50;
    *((_QWORD *)v38 + 10) = v51;
    *((_QWORD *)v38 + 11) = v40;
    v41 = v48;
    *((_QWORD *)v38 + 12) = v49;
    *((_QWORD *)v38 + 13) = v41;
    v42 = v46;
    *((_QWORD *)v38 + 14) = v47;
    *((_QWORD *)v38 + 15) = v42;
    *((_QWORD *)v38 + 16) = v33;
    v43 = v44;
    *((_QWORD *)v38 + 17) = v45;
    *((_QWORD *)v38 + 18) = v43;
    return sub_2486F4A14(v17, v19);
  }
  return result;
}

uint64_t sub_24878B1E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  __int128 v6;
  char v7;

  v2 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = xmmword_2487BE620;
  v7 = 3;
  swift_storeEnumTagMultiPayload();
  return TTSVBError.init(_:_:_:)((uint64_t)&v6, (uint64_t)v4, 0, a1);
}

unint64_t TTSVBTrainingScript.description.getter()
{
  sub_2487B5AA4();
  swift_bridgeObjectRelease();
  sub_2487B5CCC();
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  sub_2487B55AC();
  return 0xD000000000000010;
}

uint64_t static TTSVBTrainingScript.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_24878B328(*a1, *a2);
}

uint64_t sub_24878B328(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t result;
  char v16;
  uint64_t v17;
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

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 != *(_QWORD *)(a2 + 16))
    return 0;
  if (v2)
  {
    v3 = a2;
    if (a1 != a2)
    {
      v4 = 0;
      v17 = a1;
      while (1)
      {
        v6 = *(_QWORD *)(a1 + v4 + 48);
        v5 = *(_QWORD *)(a1 + v4 + 56);
        v7 = *(_QWORD *)(a1 + v4 + 64);
        v33 = *(_QWORD *)(a1 + v4 + 80);
        v34 = *(_QWORD *)(a1 + v4 + 72);
        v32 = *(_QWORD *)(a1 + v4 + 88);
        v29 = *(_QWORD *)(a1 + v4 + 104);
        v30 = *(_QWORD *)(a1 + v4 + 96);
        v26 = *(_QWORD *)(a1 + v4 + 112);
        v24 = *(_QWORD *)(a1 + v4 + 120);
        v8 = *(double *)(a1 + v4 + 128);
        v21 = *(_QWORD *)(a1 + v4 + 144);
        v22 = *(_QWORD *)(a1 + v4 + 136);
        v10 = *(_QWORD *)(v3 + v4 + 48);
        v9 = *(_QWORD *)(v3 + v4 + 56);
        v11 = *(_QWORD *)(v3 + v4 + 64);
        v12 = *(_QWORD *)(v3 + v4 + 72);
        v13 = *(_QWORD *)(v3 + v4 + 80);
        v31 = *(_QWORD *)(v3 + v4 + 88);
        v27 = *(_QWORD *)(v3 + v4 + 104);
        v28 = *(_QWORD *)(v3 + v4 + 96);
        v25 = *(_QWORD *)(v3 + v4 + 112);
        v23 = *(_QWORD *)(v3 + v4 + 120);
        v14 = *(double *)(v3 + v4 + 128);
        v19 = *(_QWORD *)(v3 + v4 + 144);
        v20 = *(_QWORD *)(v3 + v4 + 136);
        if ((*(_QWORD *)(a1 + v4 + 32) != *(_QWORD *)(v3 + v4 + 32)
           || *(_QWORD *)(a1 + v4 + 40) != *(_QWORD *)(v3 + v4 + 40))
          && (sub_2487B5CE4() & 1) == 0)
        {
          break;
        }
        if ((v6 != v10 || v5 != v9) && (sub_2487B5CE4() & 1) == 0
          || (v7 != v11 || v34 != v12) && (sub_2487B5CE4() & 1) == 0
          || (v33 != v13 || v32 != v31) && (sub_2487B5CE4() & 1) == 0)
        {
          break;
        }
        if (v30 == v28 && v29 == v27)
        {
          result = 0;
        }
        else
        {
          v16 = sub_2487B5CE4();
          result = 0;
          if ((v16 & 1) == 0)
            return result;
        }
        if (v26 != v25 || v24 != v23 || v8 != v14)
          return result;
        if ((v22 != v20 || v21 != v19) && (sub_2487B5CE4() & 1) == 0)
          return 0;
        v4 += 120;
        --v2;
        a1 = v17;
        v3 = a2;
        if (!v2)
          return 1;
      }
      return 0;
    }
  }
  return 1;
}

uint64_t sub_24878B558()
{
  sub_2487B5AA4();
  sub_2487B55AC();
  sub_2487B5CCC();
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  sub_2487B55AC();
  return 0;
}

uint64_t sub_24878B608(uint64_t *a1, uint64_t *a2)
{
  return sub_24878B328(*a1, *a2);
}

uint64_t TTSVBTrainingBook.TTSVBTrainingParagraph.paragraphIndex.getter()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t v2;
  char v3;

  v1 = *v0;
  if (*(_QWORD *)(v1 + 16) && (v2 = sub_24878C878(0), (v3 & 1) != 0))
    return *(_QWORD *)(*(_QWORD *)(v1 + 56) + 120 * v2 + 80);
  else
    return -1;
}

unint64_t sub_24878B660(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  _OWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  __int128 v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777D918);
  v2 = (_QWORD *)sub_2487B5B88();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_OWORD *)(a1 + 56);
  while (1)
  {
    v5 = *((_QWORD *)v4 - 3);
    v6 = *((_QWORD *)v4 - 2);
    v7 = *((_QWORD *)v4 - 1);
    v15 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_248709700(v5, v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    v11 = v2[7] + 24 * result;
    *(_QWORD *)v11 = v7;
    *(_OWORD *)(v11 + 8) = v15;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v4 = (_OWORD *)((char *)v4 + 40);
    v2[2] = v14;
    if (!--v3)
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

uint64_t TTSVBTrainingBook.TTSVBTrainingParagraph.items.getter()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;

  v1 = *v0;
  swift_bridgeObjectRetain_n();
  v2 = sub_24878C9BC(v1);
  swift_bridgeObjectRelease();
  v4 = v2;
  sub_24878C944((uint64_t *)&v4, (uint64_t (*)(uint64_t))sub_248790F34, sub_24878CC88);
  swift_bridgeObjectRelease();
  return (uint64_t)v4;
}

uint64_t TTSVBTrainingBook.TTSVBTrainingParagraph.hash(into:)(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  swift_bridgeObjectRetain();
  sub_2487904A0(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t static TTSVBTrainingBook.TTSVBTrainingParagraph.== infix(_:_:)(uint64_t *a1, uint64_t *a2)
{
  return sub_24878BA10(*a1, *a2);
}

uint64_t sub_24878B874(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  char v18;

  if (result == a2)
    return 1;
  v2 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v3 = 0;
  v4 = result + 64;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v10 = v9 | (v3 << 6);
      goto LABEL_22;
    }
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v11 >= v8)
      return 1;
    v12 = *(_QWORD *)(v4 + 8 * v11);
    ++v3;
    if (!v12)
    {
      v3 = v11 + 1;
      if (v11 + 1 >= v8)
        return 1;
      v12 = *(_QWORD *)(v4 + 8 * v3);
      if (!v12)
      {
        v3 = v11 + 2;
        if (v11 + 2 >= v8)
          return 1;
        v12 = *(_QWORD *)(v4 + 8 * v3);
        if (!v12)
          break;
      }
    }
LABEL_21:
    v7 = (v12 - 1) & v12;
    v10 = __clz(__rbit64(v12)) + (v3 << 6);
LABEL_22:
    v14 = 8 * v10;
    v15 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v14);
    sub_24878C878(*(_QWORD *)(*(_QWORD *)(v2 + 48) + v14));
    if ((v16 & 1) != 0)
    {
      swift_bridgeObjectRetain();
      v17 = swift_bridgeObjectRetain();
      v18 = sub_24878BA10(v17, v15);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      if ((v18 & 1) != 0)
        continue;
    }
    return 0;
  }
  v13 = v11 + 3;
  if (v13 >= v8)
    return 1;
  v12 = *(_QWORD *)(v4 + 8 * v13);
  if (v12)
  {
    v3 = v13;
    goto LABEL_21;
  }
  while (1)
  {
    v3 = v13 + 1;
    if (__OFADD__(v13, 1))
      break;
    if (v3 >= v8)
      return 1;
    v12 = *(_QWORD *)(v4 + 8 * v3);
    ++v13;
    if (v12)
      goto LABEL_21;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_24878BA10(uint64_t result, uint64_t a2)
{
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  int64_t v10;
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
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  int64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _QWORD v65[11];
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70[17];

  if (result == a2)
    return 1;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v2 = 0;
  v43 = result + 64;
  v3 = 1 << *(_BYTE *)(result + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(result + 64);
  v44 = (unint64_t)(v3 + 63) >> 6;
  v45 = result;
  while (1)
  {
    if (v5)
    {
      v48 = (v5 - 1) & v5;
      v49 = v2;
      v7 = __clz(__rbit64(v5)) | (v2 << 6);
      goto LABEL_24;
    }
    v8 = v2 + 1;
    if (__OFADD__(v2, 1))
    {
      __break(1u);
      goto LABEL_50;
    }
    if (v8 >= v44)
      return 1;
    v9 = *(_QWORD *)(v43 + 8 * v8);
    v10 = v2 + 1;
    if (!v9)
    {
      v10 = v2 + 2;
      if (v2 + 2 >= v44)
        return 1;
      v9 = *(_QWORD *)(v43 + 8 * v10);
      if (!v9)
      {
        v10 = v2 + 3;
        if (v2 + 3 >= v44)
          return 1;
        v9 = *(_QWORD *)(v43 + 8 * v10);
        if (!v9)
          break;
      }
    }
LABEL_23:
    v48 = (v9 - 1) & v9;
    v49 = v10;
    v7 = __clz(__rbit64(v9)) + (v10 << 6);
LABEL_24:
    v12 = *(_QWORD *)(*(_QWORD *)(result + 48) + 8 * v7);
    v13 = *(_QWORD *)(result + 56) + 120 * v7;
    v15 = *(_QWORD *)v13;
    v14 = *(_QWORD *)(v13 + 8);
    v17 = *(_QWORD *)(v13 + 16);
    v16 = *(_QWORD *)(v13 + 24);
    v19 = *(_QWORD *)(v13 + 32);
    v18 = *(_QWORD *)(v13 + 40);
    v21 = *(_QWORD *)(v13 + 48);
    v20 = *(_QWORD *)(v13 + 56);
    v22 = *(_QWORD *)(v13 + 64);
    v23 = *(_QWORD *)(v13 + 72);
    v24 = *(_QWORD *)(v13 + 96);
    v25 = *(_QWORD *)(v13 + 104);
    v26 = *(_QWORD *)(v13 + 112);
    v27 = *(_OWORD *)(v13 + 80);
    v65[0] = v12;
    v65[1] = v15;
    v65[2] = v14;
    v65[3] = v17;
    v65[4] = v16;
    v65[5] = v19;
    v65[6] = v18;
    v65[7] = v21;
    v65[8] = v20;
    v65[9] = v22;
    v65[10] = v23;
    v66 = v27;
    v67 = v24;
    v68 = v25;
    v69 = v26;
    nullsub_1(v65);
    sub_248791ECC((uint64_t)v65, (uint64_t)v70);
    v28 = v70[1];
    v29 = v70[3];
    v64 = v70[2];
    v30 = v70[5];
    v63 = v70[4];
    v31 = v70[7];
    v62 = v70[6];
    v32 = v70[9];
    v61 = v70[8];
    v33 = v70[11];
    v60 = v70[10];
    v55 = v70[12];
    v34 = *(double *)&v70[13];
    v54 = v70[14];
    v57 = v70[15];
    v35 = sub_24878C878(v70[0]);
    if ((v36 & 1) == 0)
      goto LABEL_47;
    v37 = *(_QWORD *)(a2 + 56) + 120 * v35;
    v38 = *(_QWORD *)(v37 + 16);
    v39 = *(_QWORD *)(v37 + 24);
    v40 = *(_QWORD *)(v37 + 32);
    v41 = *(_QWORD *)(v37 + 40);
    v58 = *(_QWORD *)(v37 + 56);
    v59 = *(_QWORD *)(v37 + 48);
    v52 = *(_QWORD *)(v37 + 72);
    v53 = *(_QWORD *)(v37 + 64);
    v50 = *(_QWORD *)(v37 + 88);
    v51 = *(_QWORD *)(v37 + 80);
    v42 = *(double *)(v37 + 96);
    v46 = *(_QWORD *)(v37 + 112);
    v47 = *(_QWORD *)(v37 + 104);
    if ((*(_QWORD *)v37 != v28 || *(_QWORD *)(v37 + 8) != v64) && (sub_2487B5CE4() & 1) == 0)
      goto LABEL_47;
    if ((v38 != v29 || v39 != v63) && (sub_2487B5CE4() & 1) == 0
      || (v40 != v30 || v41 != v62) && (sub_2487B5CE4() & 1) == 0
      || (v59 != v31 || v58 != v61) && (sub_2487B5CE4() & 1) == 0
      || (v53 != v32 || v52 != v60) && (sub_2487B5CE4() & 1) == 0
      || v51 != v33
      || v50 != v55
      || v42 != v34)
    {
LABEL_47:
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return 0;
    }
    if (v47 == v54 && v46 == v57)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      v6 = sub_2487B5CE4();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v6 & 1) == 0)
        return 0;
    }
    result = v45;
    v5 = v48;
    v2 = v49;
  }
  v11 = v2 + 4;
  if (v2 + 4 >= v44)
    return 1;
  v9 = *(_QWORD *)(v43 + 8 * v11);
  if (v9)
  {
    v10 = v2 + 4;
    goto LABEL_23;
  }
  while (1)
  {
    v10 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v10 >= v44)
      return 1;
    v9 = *(_QWORD *)(v43 + 8 * v10);
    ++v11;
    if (v9)
      goto LABEL_23;
  }
LABEL_50:
  __break(1u);
  return result;
}

uint64_t TTSVBTrainingBook.TTSVBTrainingParagraph.hashValue.getter()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_2487B5D5C();
  sub_2487904A0((uint64_t)v3, v1);
  return sub_2487B5D98();
}

uint64_t sub_24878BF6C()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_2487B5D5C();
  sub_2487904A0((uint64_t)v3, v1);
  return sub_2487B5D98();
}

uint64_t sub_24878BFB0(uint64_t a1)
{
  uint64_t *v1;

  return sub_2487904A0(a1, *v1);
}

uint64_t sub_24878BFB8()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_2487B5D5C();
  sub_2487904A0((uint64_t)v3, v1);
  return sub_2487B5D98();
}

BOOL sub_24878BFFC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v4 = *a2;
  v5 = v2;
  return !_s31TextToSpeechVoiceBankingSupport17TTSVBTrainingBookV0G9ParagraphV1loiySbAE_AEtFZ_0(&v4, &v5);
}

BOOL sub_24878C034(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v4 = *a2;
  v5 = v2;
  return !_s31TextToSpeechVoiceBankingSupport17TTSVBTrainingBookV0G9ParagraphV1loiySbAE_AEtFZ_0(&v5, &v4);
}

BOOL sub_24878C06C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v2 = *a1;
  v4 = *a2;
  v5 = v2;
  return _s31TextToSpeechVoiceBankingSupport17TTSVBTrainingBookV0G9ParagraphV1loiySbAE_AEtFZ_0(&v4, &v5);
}

uint64_t sub_24878C0A0(uint64_t *a1, uint64_t *a2)
{
  return sub_24878BA10(*a1, *a2);
}

uint64_t TTSVBTrainingBook.paragraphsByIndex.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t TTSVBTrainingBook.paragraphsByIndex.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 16) = a1;
  return result;
}

uint64_t (*TTSVBTrainingBook.paragraphsByIndex.modify())()
{
  return nullsub_1;
}

uint64_t TTSVBTrainingBook.paragraphs.getter()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v4;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain_n();
  v2 = sub_24878CAB0(v1);
  swift_bridgeObjectRelease();
  v4 = v2;
  sub_24878C944((uint64_t *)&v4, (uint64_t (*)(uint64_t))sub_248790F48, sub_24878D460);
  swift_bridgeObjectRelease();
  return (uint64_t)v4;
}

uint64_t TTSVBTrainingBook.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t static TTSVBTrainingBook.booksWithScriptItems(_:)(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char isUniquelyReferenced_nonNull_native;
  char v8;
  char v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _OWORD v30[4];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v2 = sub_24878B660(MEMORY[0x24BEE4AF8]);
  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    swift_bridgeObjectRetain();
    v4 = 32;
    v27 = a1;
    while (1)
    {
      v10 = *(_OWORD *)(a1 + v4 + 80);
      v31 = *(_OWORD *)(a1 + v4 + 64);
      v32 = v10;
      v33 = *(_OWORD *)(a1 + v4 + 96);
      v34 = *(_QWORD *)(a1 + v4 + 112);
      v11 = *(_OWORD *)(a1 + v4 + 48);
      v30[2] = *(_OWORD *)(a1 + v4 + 32);
      v30[3] = v11;
      v12 = *(_OWORD *)(a1 + v4 + 16);
      v30[0] = *(_OWORD *)(a1 + v4);
      v30[1] = v12;
      v13 = v31;
      v14 = *(_QWORD *)(v2 + 16);
      sub_248791598((uint64_t)v30);
      if (v14)
      {
        swift_bridgeObjectRetain();
        v15 = sub_248709700(v13, *((uint64_t *)&v13 + 1));
        if ((v16 & 1) != 0)
        {
          v17 = (uint64_t *)(*(_QWORD *)(v2 + 56) + 24 * v15);
          v18 = v17[1];
          v28 = *v17;
          v19 = v17[2];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          goto LABEL_10;
        }
        swift_bridgeObjectRelease();
      }
      v19 = sub_24879149C(MEMORY[0x24BEE4AF8]);
      swift_bridgeObjectRetain();
      v18 = *((_QWORD *)&v13 + 1);
      v28 = v13;
LABEL_10:
      v20 = v32;
      if (*(_QWORD *)(v19 + 16) && (v21 = sub_24878C878(v32), (v22 & 1) != 0))
      {
        v5 = *(_QWORD *)(*(_QWORD *)(v19 + 56) + 8 * v21);
        swift_bridgeObjectRetain();
      }
      else
      {
        v5 = sub_248791330(MEMORY[0x24BEE4AF8]);
      }
      v6 = *((_QWORD *)&v32 + 1);
      sub_248791598((uint64_t)v30);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_24878F8B4((uint64_t)v30, v6, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
      v8 = swift_isUniquelyReferenced_nonNull_native();
      sub_24878F77C(v5, v20, v8);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v9 = swift_isUniquelyReferenced_nonNull_native();
      v29 = (_QWORD *)v2;
      sub_24878F5F0(v28, v18, v19, v13, *((uint64_t *)&v13 + 1), v9);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      sub_24879160C((uint64_t)v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v4 += 120;
      --v3;
      a1 = v27;
      if (!v3)
      {
        swift_bridgeObjectRelease();
        break;
      }
    }
  }
  v23 = swift_bridgeObjectRetain();
  v24 = sub_24878CB94(v23);
  swift_bridgeObjectRelease();
  v29 = v24;
  swift_retain();
  sub_24878C944((uint64_t *)&v29, (uint64_t (*)(uint64_t))sub_248790F5C, sub_24878DBEC);
  swift_release();
  v25 = (uint64_t)v29;
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t TTSVBTrainingBook.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_248790308(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t static TTSVBTrainingBook.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_2487B5CE4() & 1) != 0)
    return sub_24878B874(v2, v3);
  else
    return 0;
}

uint64_t TTSVBTrainingBook.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 16);
  sub_2487B5D5C();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_248790308((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_2487B5D98();
}

uint64_t sub_24878C5A0()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 16);
  sub_2487B5D5C();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_248790308((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_2487B5D98();
}

uint64_t sub_24878C620(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 + 16);
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_248790308(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_24878C684()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE v3[72];

  v1 = *(_QWORD *)(v0 + 16);
  sub_2487B5D5C();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_248790308((uint64_t)v3, v1);
  swift_bridgeObjectRelease();
  return sub_2487B5D98();
}

uint64_t sub_24878C700(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  BOOL v4;

  v2 = a1[2];
  v3 = a2[2];
  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (sub_2487B5CE4() & 1) != 0)
    return sub_24878B874(v2, v3);
  else
    return 0;
}

char *sub_24878C760(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25777D940);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 120);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[120 * v8])
      memmove(v12, v13, 120 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_24878C878(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2487B5D50();
  return sub_24878C8A8(a1, v2);
}

unint64_t sub_24878C8A8(uint64_t a1, uint64_t a2)
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

uint64_t sub_24878C944(uint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t (*a3)(_QWORD *))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  _QWORD v9[2];

  v6 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v6 = a2(v6);
  v7 = *(_QWORD *)(v6 + 16);
  v9[0] = v6 + 32;
  v9[1] = v7;
  result = a3(v9);
  *a1 = v6;
  return result;
}

_QWORD *sub_24878C9BC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777D940);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 120);
  v5 = sub_248790854(&v7, (uint64_t)(v3 + 4), v1, a1);
  swift_bridgeObjectRetain();
  sub_248750938();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_24878CAB0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777D930);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v5 = v4 - 32;
  if (v4 < 32)
    v5 = v4 - 25;
  v3[2] = v1;
  v3[3] = 2 * (v5 >> 3);
  v6 = sub_248790B20((uint64_t)&v8, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_248750938();
  if (v6 != v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

_QWORD *sub_24878CB94(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  size_t v4;
  _QWORD *v5;
  uint64_t v7;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777D910);
  v3 = (_QWORD *)swift_allocObject();
  v4 = _swift_stdlib_malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 24);
  v5 = sub_248790D18(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_248750938();
  if (v5 != (_QWORD *)v1)
  {
    __break(1u);
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  return v3;
}

uint64_t sub_24878CC88(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
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
  unint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  BOOL v43;
  unint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  BOOL v53;
  uint64_t v54;
  char v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  _OWORD *v81;
  uint64_t v82;
  uint64_t v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t i;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  _QWORD *v118;
  unint64_t v119;
  uint64_t v120;
  _QWORD *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;

  v2 = a1;
  v3 = a1[1];
  result = sub_2487B5CC0();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_139;
    if ((unint64_t)v3 >= 2)
    {
      v94 = 0;
      v95 = *v2;
      for (i = 1; i != v3; ++i)
      {
        v97 = *(_QWORD *)(v95 + 120 * i + 88);
        v98 = v94;
        do
        {
          v99 = v95 + v98;
          if (v97 >= *(_QWORD *)(v95 + v98 + 88))
            break;
          if (!v95)
            goto LABEL_143;
          v100 = *(_QWORD *)(v99 + 120);
          v101 = v95 + v98;
          v102 = *(_OWORD *)(v95 + v98 + 128);
          v103 = *(_OWORD *)(v95 + v98 + 144);
          v104 = *(_OWORD *)(v95 + v98 + 160);
          v105 = *(_OWORD *)(v95 + v98 + 176);
          v106 = *(_QWORD *)(v95 + v98 + 192);
          result = *(_QWORD *)(v95 + v98 + 200);
          v107 = *(_QWORD *)(v95 + v98 + 216);
          v108 = *(_QWORD *)(v95 + v98 + 224);
          v109 = *(_QWORD *)(v95 + v98 + 232);
          v110 = *(_OWORD *)(v99 + 80);
          *(_OWORD *)(v99 + 184) = *(_OWORD *)(v99 + 64);
          *(_OWORD *)(v99 + 200) = v110;
          *(_OWORD *)(v99 + 216) = *(_OWORD *)(v99 + 96);
          *(_QWORD *)(v99 + 232) = *(_QWORD *)(v99 + 112);
          v111 = *(_OWORD *)(v99 + 16);
          *(_OWORD *)(v99 + 120) = *(_OWORD *)v99;
          *(_OWORD *)(v99 + 136) = v111;
          v112 = *(_OWORD *)(v99 + 48);
          *(_OWORD *)(v99 + 152) = *(_OWORD *)(v99 + 32);
          *(_OWORD *)(v99 + 168) = v112;
          *(_QWORD *)v101 = v100;
          *(_OWORD *)(v101 + 8) = v102;
          *(_OWORD *)(v101 + 24) = v103;
          *(_OWORD *)(v101 + 40) = v104;
          *(_OWORD *)(v101 + 56) = v105;
          *(_QWORD *)(v101 + 72) = v106;
          *(_QWORD *)(v101 + 80) = result;
          *(_QWORD *)(v99 + 88) = v97;
          *(_QWORD *)(v101 + 96) = v107;
          v98 -= 120;
          *(_QWORD *)(v101 + 104) = v108;
          *(_QWORD *)(v101 + 112) = v109;
        }
        while (v98 != -120);
        v94 += 120;
      }
    }
  }
  else
  {
    if (v3 >= 0)
      v5 = v3;
    else
      v5 = v3 + 1;
    if (v3 < -1)
      goto LABEL_138;
    v123 = result;
    v134 = v1;
    if (v3 > 1)
    {
      v6 = v5 >> 1;
      result = sub_2487B56B4();
      *(_QWORD *)(result + 16) = v6;
      v122 = result;
      v132 = (char *)(result + 32);
LABEL_13:
      v8 = 0;
      v121 = v2;
      v9 = *v2;
      v133 = MEMORY[0x24BEE4AF8];
      v124 = v3;
      while (1)
      {
        v11 = v8++;
        if (v8 < v3)
        {
          v12 = *(_QWORD *)(v9 + 120 * v8 + 88);
          v13 = *(_QWORD *)(v9 + 120 * v11 + 88);
          v8 = v11 + 2;
          if (v11 + 2 < v3)
          {
            v14 = (uint64_t *)(v9 + 328 + 120 * v11);
            v15 = v12;
            while (1)
            {
              v17 = *v14;
              v14 += 15;
              v16 = v17;
              if (v12 < v13 == v17 >= v15)
                break;
              ++v8;
              v15 = v16;
              if (v3 == v8)
              {
                v8 = v3;
                break;
              }
            }
          }
          if (v12 < v13)
          {
            if (v8 < v11)
              goto LABEL_140;
            if (v11 < v8)
            {
              v18 = 120 * v8;
              v19 = v8;
              v20 = v11;
              v120 = v11;
              v21 = 120 * v11;
              do
              {
                if (v20 != --v19)
                {
                  if (!v9)
                    goto LABEL_146;
                  v22 = v9 + v18;
                  v128 = *(_OWORD *)(v9 + v21 + 16);
                  v129 = *(_OWORD *)(v9 + v21);
                  v126 = *(_OWORD *)(v9 + v21 + 48);
                  v127 = *(_OWORD *)(v9 + v21 + 32);
                  v23 = *(_QWORD *)(v9 + v21 + 64);
                  v24 = *(_QWORD *)(v9 + v21 + 72);
                  v25 = *(_QWORD *)(v9 + v21 + 96);
                  v130 = *(_QWORD *)(v9 + v21 + 112);
                  v131 = *(_QWORD *)(v9 + v21 + 104);
                  v125 = *(_OWORD *)(v9 + v21 + 80);
                  result = (uint64_t)memmove((void *)(v9 + v21), (const void *)(v9 + v18 - 120), 0x78uLL);
                  *(_OWORD *)(v22 - 120) = v129;
                  *(_OWORD *)(v22 - 104) = v128;
                  *(_OWORD *)(v22 - 88) = v127;
                  *(_OWORD *)(v22 - 72) = v126;
                  *(_QWORD *)(v22 - 56) = v23;
                  *(_QWORD *)(v22 - 48) = v24;
                  *(_OWORD *)(v22 - 40) = v125;
                  *(_QWORD *)(v22 - 24) = v25;
                  *(_QWORD *)(v22 - 16) = v131;
                  *(_QWORD *)(v22 - 8) = v130;
                }
                ++v20;
                v18 -= 120;
                v21 += 120;
              }
              while (v20 < v19);
              v3 = v124;
              v11 = v120;
            }
          }
        }
        if (v8 >= v3)
          goto LABEL_39;
        if (__OFSUB__(v8, v11))
          goto LABEL_137;
        if (v8 - v11 >= v123)
          goto LABEL_39;
        v26 = v11 + v123;
        if (__OFADD__(v11, v123))
          goto LABEL_141;
        if (v26 >= v3)
          v26 = v3;
        if (v26 < v11)
        {
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
          return result;
        }
        if (v8 == v26)
        {
LABEL_39:
          v27 = v133;
          if (v8 < v11)
            goto LABEL_132;
        }
        else
        {
          v77 = v9 + 112 + 120 * v8;
          v27 = v133;
          do
          {
            v78 = *(_QWORD *)(v9 + 120 * v8 + 88);
            v79 = v11;
            v80 = (_QWORD *)v77;
            do
            {
              if (v78 >= *(v80 - 18))
                break;
              if (!v9)
                goto LABEL_144;
              v81 = v80 - 14;
              v82 = *(v80 - 14);
              v83 = *(v80 - 13);
              v84 = *((_OWORD *)v80 - 6);
              v85 = *((_OWORD *)v80 - 5);
              v86 = *((_OWORD *)v80 - 4);
              v87 = *((_OWORD *)v80 - 3);
              v88 = *(v80 - 4);
              v89 = *(v80 - 2);
              v90 = *(v80 - 1);
              result = *v80;
              v91 = *(_OWORD *)(v80 - 19);
              v81[4] = *(_OWORD *)(v80 - 21);
              v81[5] = v91;
              v81[6] = *(_OWORD *)(v80 - 17);
              *v80 = *(v80 - 15);
              v92 = *(_OWORD *)(v80 - 27);
              *v81 = *(_OWORD *)(v80 - 29);
              v81[1] = v92;
              v93 = *(_OWORD *)(v80 - 23);
              v81[2] = *(_OWORD *)(v80 - 25);
              v81[3] = v93;
              *(v80 - 15) = result;
              v80 -= 15;
              *(v80 - 14) = v82;
              *(v80 - 13) = v83;
              *((_OWORD *)v80 - 6) = v84;
              *((_OWORD *)v80 - 5) = v85;
              *((_OWORD *)v80 - 4) = v86;
              *((_OWORD *)v80 - 3) = v87;
              *(v80 - 4) = v88;
              *(v80 - 3) = v78;
              *(v80 - 2) = v89;
              ++v79;
              *(v80 - 1) = v90;
            }
            while (v8 != v79);
            ++v8;
            v77 += 120;
          }
          while (v8 != v26);
          v8 = v26;
          if (v26 < v11)
            goto LABEL_132;
        }
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_248764AAC(0, *(_QWORD *)(v27 + 16) + 1, 1, (char *)v27);
          v27 = result;
        }
        v29 = *(_QWORD *)(v27 + 16);
        v28 = *(_QWORD *)(v27 + 24);
        v10 = v29 + 1;
        if (v29 >= v28 >> 1)
        {
          result = (uint64_t)sub_248764AAC((char *)(v28 > 1), v29 + 1, 1, (char *)v27);
          v27 = result;
        }
        *(_QWORD *)(v27 + 16) = v10;
        v30 = v27 + 32;
        v31 = (uint64_t *)(v27 + 32 + 16 * v29);
        *v31 = v11;
        v31[1] = v8;
        v133 = v27;
        if (v29)
        {
          while (1)
          {
            v32 = v10 - 1;
            if (v10 >= 4)
            {
              v37 = v30 + 16 * v10;
              v38 = *(_QWORD *)(v37 - 64);
              v39 = *(_QWORD *)(v37 - 56);
              v43 = __OFSUB__(v39, v38);
              v40 = v39 - v38;
              if (v43)
                goto LABEL_121;
              v42 = *(_QWORD *)(v37 - 48);
              v41 = *(_QWORD *)(v37 - 40);
              v43 = __OFSUB__(v41, v42);
              v35 = v41 - v42;
              v36 = v43;
              if (v43)
                goto LABEL_122;
              v44 = v10 - 2;
              v45 = (uint64_t *)(v30 + 16 * (v10 - 2));
              v47 = *v45;
              v46 = v45[1];
              v43 = __OFSUB__(v46, v47);
              v48 = v46 - v47;
              if (v43)
                goto LABEL_123;
              v43 = __OFADD__(v35, v48);
              v49 = v35 + v48;
              if (v43)
                goto LABEL_125;
              if (v49 >= v40)
              {
                v67 = (uint64_t *)(v30 + 16 * v32);
                v69 = *v67;
                v68 = v67[1];
                v43 = __OFSUB__(v68, v69);
                v70 = v68 - v69;
                if (v43)
                  goto LABEL_131;
                v60 = v35 < v70;
                goto LABEL_76;
              }
            }
            else
            {
              if (v10 != 3)
              {
                v61 = *(_QWORD *)(v27 + 32);
                v62 = *(_QWORD *)(v27 + 40);
                v43 = __OFSUB__(v62, v61);
                v54 = v62 - v61;
                v55 = v43;
                goto LABEL_70;
              }
              v34 = *(_QWORD *)(v27 + 32);
              v33 = *(_QWORD *)(v27 + 40);
              v43 = __OFSUB__(v33, v34);
              v35 = v33 - v34;
              v36 = v43;
            }
            if ((v36 & 1) != 0)
              goto LABEL_124;
            v44 = v10 - 2;
            v50 = (uint64_t *)(v30 + 16 * (v10 - 2));
            v52 = *v50;
            v51 = v50[1];
            v53 = __OFSUB__(v51, v52);
            v54 = v51 - v52;
            v55 = v53;
            if (v53)
              goto LABEL_126;
            v56 = (uint64_t *)(v30 + 16 * v32);
            v58 = *v56;
            v57 = v56[1];
            v43 = __OFSUB__(v57, v58);
            v59 = v57 - v58;
            if (v43)
              goto LABEL_128;
            if (__OFADD__(v54, v59))
              goto LABEL_130;
            if (v54 + v59 >= v35)
            {
              v60 = v35 < v59;
LABEL_76:
              if (v60)
                v32 = v44;
              goto LABEL_78;
            }
LABEL_70:
            if ((v55 & 1) != 0)
              goto LABEL_127;
            v63 = (uint64_t *)(v30 + 16 * v32);
            v65 = *v63;
            v64 = v63[1];
            v43 = __OFSUB__(v64, v65);
            v66 = v64 - v65;
            if (v43)
              goto LABEL_129;
            if (v66 < v54)
              goto LABEL_15;
LABEL_78:
            v71 = v32 - 1;
            if (v32 - 1 >= v10)
            {
              __break(1u);
LABEL_118:
              __break(1u);
LABEL_119:
              __break(1u);
LABEL_120:
              __break(1u);
LABEL_121:
              __break(1u);
LABEL_122:
              __break(1u);
LABEL_123:
              __break(1u);
LABEL_124:
              __break(1u);
LABEL_125:
              __break(1u);
LABEL_126:
              __break(1u);
LABEL_127:
              __break(1u);
LABEL_128:
              __break(1u);
LABEL_129:
              __break(1u);
LABEL_130:
              __break(1u);
LABEL_131:
              __break(1u);
LABEL_132:
              __break(1u);
LABEL_133:
              __break(1u);
LABEL_134:
              __break(1u);
LABEL_135:
              __break(1u);
LABEL_136:
              __break(1u);
LABEL_137:
              __break(1u);
LABEL_138:
              __break(1u);
LABEL_139:
              __break(1u);
LABEL_140:
              __break(1u);
LABEL_141:
              __break(1u);
              goto LABEL_142;
            }
            if (!v9)
              goto LABEL_145;
            v72 = (uint64_t *)(v30 + 16 * v71);
            v73 = *v72;
            v74 = (_QWORD *)(v30 + 16 * v32);
            v75 = v74[1];
            result = sub_24878E4BC((char *)(v9 + 120 * *v72), (char *)(v9 + 120 * *v74), v9 + 120 * v75, v132);
            if (v134)
              goto LABEL_95;
            if (v75 < v73)
              goto LABEL_118;
            if (v32 > *(_QWORD *)(v133 + 16))
              goto LABEL_119;
            *v72 = v73;
            *(_QWORD *)(v30 + 16 * v71 + 8) = v75;
            v76 = *(_QWORD *)(v133 + 16);
            if (v32 >= v76)
              goto LABEL_120;
            v27 = v133;
            v10 = v76 - 1;
            result = (uint64_t)memmove((void *)(v30 + 16 * v32), v74 + 2, 16 * (v76 - 1 - v32));
            *(_QWORD *)(v133 + 16) = v76 - 1;
            if (v76 <= 2)
              goto LABEL_15;
          }
        }
        v10 = 1;
LABEL_15:
        v3 = v124;
        if (v8 >= v124)
        {
          v7 = v122;
          result = v133;
          v2 = v121;
          goto LABEL_104;
        }
      }
    }
    v7 = MEMORY[0x24BEE4AF8];
    v132 = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 == 1)
    {
      v122 = MEMORY[0x24BEE4AF8];
      goto LABEL_13;
    }
    v10 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
    result = MEMORY[0x24BEE4AF8];
LABEL_104:
    v122 = v7;
    if (v10 >= 2)
    {
      v113 = *v2;
      do
      {
        v114 = v10 - 2;
        if (v10 < 2)
          goto LABEL_133;
        if (!v113)
          goto LABEL_147;
        v115 = result;
        v116 = *(_QWORD *)(result + 32 + 16 * v114);
        v117 = *(_QWORD *)(result + 32 + 16 * (v10 - 1) + 8);
        result = sub_24878E4BC((char *)(v113 + 120 * v116), (char *)(v113 + 120 * *(_QWORD *)(result + 32 + 16 * (v10 - 1))), v113 + 120 * v117, v132);
        if (v134)
          break;
        if (v117 < v116)
          goto LABEL_134;
        result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          result = (uint64_t)sub_248764C54(v115);
          v115 = result;
        }
        if (v114 >= *(_QWORD *)(v115 + 16))
          goto LABEL_135;
        v118 = (_QWORD *)(v115 + 32 + 16 * v114);
        *v118 = v116;
        v118[1] = v117;
        v119 = *(_QWORD *)(v115 + 16);
        if (v10 > v119)
          goto LABEL_136;
        memmove((void *)(v115 + 32 + 16 * (v10 - 1)), (const void *)(v115 + 32 + 16 * v10), 16 * (v119 - v10));
        result = v115;
        *(_QWORD *)(v115 + 16) = v119 - 1;
        v10 = v119 - 1;
      }
      while (v119 > 2);
    }
LABEL_95:
    swift_bridgeObjectRelease();
    *(_QWORD *)(v122 + 16) = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_24878D460(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  char v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  unint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  char v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  _QWORD *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  _QWORD *v98;
  unint64_t v99;
  uint64_t *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  char *__dst;

  v3 = a1[1];
  result = sub_2487B5CC0();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_158;
    if (v3)
      return sub_24878E2C4(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_157;
  v104 = result;
  v100 = a1;
  if (v3 <= 1)
  {
    v7 = MEMORY[0x24BEE4AF8];
    __dst = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v10 = MEMORY[0x24BEE4AF8];
LABEL_123:
      result = v10;
      v103 = v7;
      if (v11 >= 2)
      {
        v93 = *v100;
        do
        {
          v94 = v11 - 2;
          if (v11 < 2)
            goto LABEL_152;
          if (!v93)
            goto LABEL_165;
          v95 = result;
          v96 = *(_QWORD *)(result + 32 + 16 * v94);
          v97 = *(_QWORD *)(result + 32 + 16 * (v11 - 1) + 8);
          result = sub_24878E714((char *)(v93 + 8 * v96), (char *)(v93 + 8 * *(_QWORD *)(result + 32 + 16 * (v11 - 1))), v93 + 8 * v97, __dst);
          if (v1)
            break;
          if (v97 < v96)
            goto LABEL_153;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_248764C54(v95);
            v95 = result;
          }
          if (v94 >= *(_QWORD *)(v95 + 16))
            goto LABEL_154;
          v98 = (_QWORD *)(v95 + 32 + 16 * v94);
          *v98 = v96;
          v98[1] = v97;
          v99 = *(_QWORD *)(v95 + 16);
          if (v11 > v99)
            goto LABEL_155;
          memmove((void *)(v95 + 32 + 16 * (v11 - 1)), (const void *)(v95 + 32 + 16 * v11), 16 * (v99 - v11));
          result = v95;
          *(_QWORD *)(v95 + 16) = v99 - 1;
          v11 = v99 - 1;
        }
        while (v99 > 2);
      }
LABEL_120:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v103 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v103 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    result = sub_2487B56B4();
    *(_QWORD *)(result + 16) = v6;
    v103 = result;
    __dst = (char *)(result + 32);
  }
  v8 = 0;
  v9 = *a1;
  v101 = v9 - 8;
  v102 = v9 + 16;
  v10 = MEMORY[0x24BEE4AF8];
  v106 = v3;
  while (2)
  {
    v12 = v8++;
    v107 = v12;
    if (v8 >= v3)
      goto LABEL_47;
    v13 = *(_QWORD *)(v9 + 8 * v8);
    v14 = *(_QWORD *)(v9 + 8 * v12);
    if (*(_QWORD *)(v13 + 16) && (result = sub_24878C878(0), (v15 & 1) != 0))
    {
      v16 = *(_QWORD *)(*(_QWORD *)(v13 + 56) + 120 * result + 80);
      if (!*(_QWORD *)(v14 + 16))
        goto LABEL_24;
    }
    else
    {
      v16 = -1;
      if (!*(_QWORD *)(v14 + 16))
      {
LABEL_24:
        v18 = -1;
        goto LABEL_25;
      }
    }
    result = sub_24878C878(0);
    if ((v17 & 1) == 0)
      goto LABEL_24;
    v18 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 120 * result + 80);
LABEL_25:
    v8 = v12 + 2;
    if (v12 + 2 >= v3)
      goto LABEL_39;
    v19 = v102 + 8 * v12;
    do
    {
      v21 = *(_QWORD *)(v19 - 8);
      v20 = *(_QWORD *)v19;
      if (*(_QWORD *)(*(_QWORD *)v19 + 16) && (result = sub_24878C878(0), (v22 & 1) != 0))
      {
        v23 = *(_QWORD *)(*(_QWORD *)(v20 + 56) + 120 * result + 80);
        if (!*(_QWORD *)(v21 + 16))
          goto LABEL_27;
      }
      else
      {
        v23 = -1;
        if (!*(_QWORD *)(v21 + 16))
          goto LABEL_27;
      }
      result = sub_24878C878(0);
      if ((v24 & 1) == 0)
      {
LABEL_27:
        if (v16 < v18 == v23 > -2)
          goto LABEL_36;
        goto LABEL_28;
      }
      if (v16 < v18 == v23 >= *(_QWORD *)(*(_QWORD *)(v21 + 56) + 120 * result + 80))
      {
LABEL_36:
        v3 = v106;
        goto LABEL_38;
      }
LABEL_28:
      ++v8;
      v19 += 8;
      v3 = v106;
    }
    while (v106 != v8);
    v8 = v106;
LABEL_38:
    v12 = v107;
LABEL_39:
    if (v16 < v18)
    {
      if (v8 < v12)
        goto LABEL_159;
      if (v12 < v8)
      {
        v25 = (uint64_t *)(v101 + 8 * v8);
        v26 = v8;
        v27 = v12;
        v28 = (uint64_t *)(v9 + 8 * v12);
        do
        {
          if (v27 != --v26)
          {
            if (!v9)
              goto LABEL_164;
            v29 = *v28;
            *v28 = *v25;
            *v25 = v29;
          }
          ++v27;
          --v25;
          ++v28;
        }
        while (v27 < v26);
      }
    }
LABEL_47:
    if (v8 >= v3)
      goto LABEL_72;
    if (__OFSUB__(v8, v12))
      goto LABEL_156;
    if (v8 - v12 >= v104)
      goto LABEL_72;
    if (__OFADD__(v12, v104))
      goto LABEL_160;
    if (v12 + v104 >= v3)
      v30 = v3;
    else
      v30 = v12 + v104;
    if (v30 >= v12)
    {
      if (v8 == v30)
        goto LABEL_72;
      v31 = (uint64_t *)(v101 + 8 * v8);
      v105 = v30;
      while (2)
      {
        v32 = *(_QWORD *)(v9 + 8 * v8);
        v33 = v31;
        while (2)
        {
          v34 = *v33;
          if (*(_QWORD *)(v32 + 16) && (result = sub_24878C878(0), (v35 & 1) != 0))
          {
            v36 = *(_QWORD *)(*(_QWORD *)(v32 + 56) + 120 * result + 80);
            if (!*(_QWORD *)(v34 + 16))
              goto LABEL_67;
LABEL_64:
            result = sub_24878C878(0);
            if ((v37 & 1) != 0)
            {
              if (v36 >= *(_QWORD *)(*(_QWORD *)(v34 + 56) + 120 * result + 80))
                break;
              goto LABEL_68;
            }
          }
          else
          {
            v36 = -1;
            if (*(_QWORD *)(v34 + 16))
              goto LABEL_64;
          }
LABEL_67:
          if (v36 >= -1)
            break;
LABEL_68:
          if (!v9)
            goto LABEL_162;
          v38 = *v33;
          v32 = v33[1];
          *v33 = v32;
          v33[1] = v38;
          --v33;
          if (v8 != ++v12)
            continue;
          break;
        }
        ++v8;
        ++v31;
        v12 = v107;
        if (v8 != v105)
          continue;
        break;
      }
      v8 = v105;
LABEL_72:
      if (v8 < v12)
        goto LABEL_151;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_248764AAC(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
        v10 = result;
      }
      v40 = *(_QWORD *)(v10 + 16);
      v39 = *(_QWORD *)(v10 + 24);
      v11 = v40 + 1;
      if (v40 >= v39 >> 1)
      {
        result = (uint64_t)sub_248764AAC((char *)(v39 > 1), v40 + 1, 1, (char *)v10);
        v10 = result;
      }
      *(_QWORD *)(v10 + 16) = v11;
      v41 = v10 + 32;
      v42 = (uint64_t *)(v10 + 32 + 16 * v40);
      *v42 = v12;
      v42[1] = v8;
      if (v40)
      {
        v108 = v8;
        while (1)
        {
          v43 = v11 - 1;
          if (v11 >= 4)
          {
            v48 = v41 + 16 * v11;
            v49 = *(_QWORD *)(v48 - 64);
            v50 = *(_QWORD *)(v48 - 56);
            v54 = __OFSUB__(v50, v49);
            v51 = v50 - v49;
            if (v54)
              goto LABEL_140;
            v53 = *(_QWORD *)(v48 - 48);
            v52 = *(_QWORD *)(v48 - 40);
            v54 = __OFSUB__(v52, v53);
            v46 = v52 - v53;
            v47 = v54;
            if (v54)
              goto LABEL_141;
            v55 = v11 - 2;
            v56 = (uint64_t *)(v41 + 16 * (v11 - 2));
            v58 = *v56;
            v57 = v56[1];
            v54 = __OFSUB__(v57, v58);
            v59 = v57 - v58;
            if (v54)
              goto LABEL_142;
            v54 = __OFADD__(v46, v59);
            v60 = v46 + v59;
            if (v54)
              goto LABEL_144;
            if (v60 >= v51)
            {
              v78 = (uint64_t *)(v41 + 16 * v43);
              v80 = *v78;
              v79 = v78[1];
              v54 = __OFSUB__(v79, v80);
              v81 = v79 - v80;
              if (v54)
                goto LABEL_150;
              v71 = v46 < v81;
              goto LABEL_110;
            }
          }
          else
          {
            if (v11 != 3)
            {
              v72 = *(_QWORD *)(v10 + 32);
              v73 = *(_QWORD *)(v10 + 40);
              v54 = __OFSUB__(v73, v72);
              v65 = v73 - v72;
              v66 = v54;
              goto LABEL_104;
            }
            v45 = *(_QWORD *)(v10 + 32);
            v44 = *(_QWORD *)(v10 + 40);
            v54 = __OFSUB__(v44, v45);
            v46 = v44 - v45;
            v47 = v54;
          }
          if ((v47 & 1) != 0)
            goto LABEL_143;
          v55 = v11 - 2;
          v61 = (uint64_t *)(v41 + 16 * (v11 - 2));
          v63 = *v61;
          v62 = v61[1];
          v64 = __OFSUB__(v62, v63);
          v65 = v62 - v63;
          v66 = v64;
          if (v64)
            goto LABEL_145;
          v67 = (uint64_t *)(v41 + 16 * v43);
          v69 = *v67;
          v68 = v67[1];
          v54 = __OFSUB__(v68, v69);
          v70 = v68 - v69;
          if (v54)
            goto LABEL_147;
          if (__OFADD__(v65, v70))
            goto LABEL_149;
          if (v65 + v70 >= v46)
          {
            v71 = v46 < v70;
LABEL_110:
            if (v71)
              v43 = v55;
            goto LABEL_112;
          }
LABEL_104:
          if ((v66 & 1) != 0)
            goto LABEL_146;
          v74 = (uint64_t *)(v41 + 16 * v43);
          v76 = *v74;
          v75 = v74[1];
          v54 = __OFSUB__(v75, v76);
          v77 = v75 - v76;
          if (v54)
            goto LABEL_148;
          if (v77 < v65)
            goto LABEL_15;
LABEL_112:
          v82 = v43 - 1;
          if (v43 - 1 >= v11)
          {
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
LABEL_151:
            __break(1u);
LABEL_152:
            __break(1u);
LABEL_153:
            __break(1u);
LABEL_154:
            __break(1u);
LABEL_155:
            __break(1u);
LABEL_156:
            __break(1u);
LABEL_157:
            __break(1u);
LABEL_158:
            __break(1u);
LABEL_159:
            __break(1u);
LABEL_160:
            __break(1u);
            goto LABEL_161;
          }
          v83 = v9;
          if (!v9)
            goto LABEL_163;
          v84 = v10;
          v85 = (uint64_t *)(v41 + 16 * v82);
          v86 = *v85;
          v87 = v41;
          v88 = v43;
          v89 = (_QWORD *)(v41 + 16 * v43);
          v90 = v89[1];
          v91 = v83;
          result = sub_24878E714((char *)(v83 + 8 * *v85), (char *)(v83 + 8 * *v89), v83 + 8 * v90, __dst);
          if (v1)
            goto LABEL_120;
          if (v90 < v86)
            goto LABEL_137;
          if (v88 > *(_QWORD *)(v84 + 16))
            goto LABEL_138;
          *v85 = v86;
          *(_QWORD *)(v87 + 16 * v82 + 8) = v90;
          v92 = *(_QWORD *)(v84 + 16);
          if (v88 >= v92)
            goto LABEL_139;
          v10 = v84;
          v11 = v92 - 1;
          result = (uint64_t)memmove(v89, v89 + 2, 16 * (v92 - 1 - v88));
          v41 = v87;
          *(_QWORD *)(v84 + 16) = v92 - 1;
          v9 = v91;
          v8 = v108;
          if (v92 <= 2)
            goto LABEL_15;
        }
      }
      v11 = 1;
LABEL_15:
      v3 = v106;
      if (v8 >= v106)
      {
        v7 = v103;
        goto LABEL_123;
      }
      continue;
    }
    break;
  }
LABEL_161:
  __break(1u);
LABEL_162:
  __break(1u);
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  __break(1u);
  return result;
}

uint64_t sub_24878DBEC(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  int v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t *v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  unint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  BOOL v66;
  uint64_t v67;
  char v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  _QWORD *v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _QWORD *v96;
  unint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;

  v3 = a1[1];
  result = sub_2487B5CC0();
  if (result >= v3)
  {
    if (v3 < 0)
      goto LABEL_152;
    if (v3)
      return sub_24878E3D8(0, v3, 1, a1);
    return result;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_151;
  v102 = result;
  v99 = a1;
  if (v3 <= 1)
  {
    v7 = MEMORY[0x24BEE4AF8];
    v105 = (char *)(MEMORY[0x24BEE4AF8] + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      v10 = MEMORY[0x24BEE4AF8];
LABEL_117:
      result = v10;
      v101 = v7;
      if (v11 >= 2)
      {
        v91 = *v99;
        do
        {
          v92 = v11 - 2;
          if (v11 < 2)
            goto LABEL_146;
          if (!v91)
            goto LABEL_159;
          v93 = result;
          v94 = *(_QWORD *)(result + 32 + 16 * v92);
          v95 = *(_QWORD *)(result + 32 + 16 * (v11 - 1) + 8);
          result = sub_24878EA30((char *)(v91 + 24 * v94), (char *)(v91 + 24 * *(_QWORD *)(result + 32 + 16 * (v11 - 1))), v91 + 24 * v95, v105);
          if (v1)
            break;
          if (v95 < v94)
            goto LABEL_147;
          result = swift_isUniquelyReferenced_nonNull_native();
          if ((result & 1) == 0)
          {
            result = (uint64_t)sub_248764C54(v93);
            v93 = result;
          }
          if (v92 >= *(_QWORD *)(v93 + 16))
            goto LABEL_148;
          v96 = (_QWORD *)(v93 + 32 + 16 * v92);
          *v96 = v94;
          v96[1] = v95;
          v97 = *(_QWORD *)(v93 + 16);
          if (v11 > v97)
            goto LABEL_149;
          memmove((void *)(v93 + 32 + 16 * (v11 - 1)), (const void *)(v93 + 32 + 16 * v11), 16 * (v97 - v11));
          result = v93;
          *(_QWORD *)(v93 + 16) = v97 - 1;
          v11 = v97 - 1;
        }
        while (v97 > 2);
      }
LABEL_114:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v101 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
    v101 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v6 = v5 >> 1;
    result = sub_2487B56B4();
    *(_QWORD *)(result + 16) = v6;
    v101 = result;
    v105 = (char *)(result + 32);
  }
  v8 = 0;
  v9 = *a1;
  v100 = *a1 + 8;
  v98 = *a1 - 24;
  v10 = MEMORY[0x24BEE4AF8];
  v103 = v3;
  v104 = v9;
  while (1)
  {
    v12 = v8++;
    if (v8 >= v3)
      goto LABEL_45;
    v13 = (uint64_t *)(v9 + 24 * v8);
    result = *v13;
    v14 = v13[1];
    v15 = (_QWORD *)(v9 + 24 * v12);
    if (result == *v15 && v14 == v15[1])
    {
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_44;
      v17 = 0;
    }
    else
    {
      result = sub_2487B5CE4();
      v17 = result;
      v18 = v12 + 2;
      if (v12 + 2 >= v3)
        goto LABEL_36;
    }
    v19 = (_QWORD *)(v100 + 24 * v18);
    do
    {
      result = *(v19 - 1);
      v21 = (_QWORD *)(v9 + 24 * v8);
      if (result == *v21 && *v19 == v21[1])
      {
        if ((v17 & 1) != 0)
          goto LABEL_37;
      }
      else
      {
        result = sub_2487B5CE4();
        if (((v17 ^ result) & 1) != 0)
          goto LABEL_36;
      }
      v19 += 3;
      v20 = v18 + 1;
      v8 = v18;
      v18 = v20;
    }
    while (v20 < v3);
    v18 = v20;
LABEL_36:
    v8 = v18;
    if ((v17 & 1) != 0)
    {
LABEL_37:
      if (v18 < v12)
        goto LABEL_155;
      if (v12 < v18)
      {
        v23 = 24 * v18;
        v24 = 24 * v12;
        v25 = v18;
        v26 = v12;
        do
        {
          if (v26 != --v25)
          {
            if (!v9)
              goto LABEL_158;
            v27 = v9 + v24;
            v28 = v9 + v23;
            v29 = *(_QWORD *)(v9 + v24);
            v30 = *(_OWORD *)(v9 + v24 + 8);
            v31 = *(_OWORD *)(v9 + v23 - 24);
            *(_QWORD *)(v27 + 16) = *(_QWORD *)(v9 + v23 - 8);
            *(_OWORD *)v27 = v31;
            *(_QWORD *)(v28 - 24) = v29;
            *(_OWORD *)(v28 - 16) = v30;
          }
          ++v26;
          v23 -= 24;
          v24 += 24;
        }
        while (v26 < v25);
      }
LABEL_44:
      v8 = v18;
    }
LABEL_45:
    if (v8 < v3)
    {
      if (__OFSUB__(v8, v12))
        goto LABEL_150;
      if (v8 - v12 < v102)
        break;
    }
LABEL_66:
    if (v8 < v12)
      goto LABEL_145;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_248764AAC(0, *(_QWORD *)(v10 + 16) + 1, 1, (char *)v10);
      v10 = result;
    }
    v42 = *(_QWORD *)(v10 + 16);
    v41 = *(_QWORD *)(v10 + 24);
    v11 = v42 + 1;
    if (v42 >= v41 >> 1)
    {
      result = (uint64_t)sub_248764AAC((char *)(v41 > 1), v42 + 1, 1, (char *)v10);
      v10 = result;
    }
    *(_QWORD *)(v10 + 16) = v11;
    v43 = v10 + 32;
    v44 = (uint64_t *)(v10 + 32 + 16 * v42);
    *v44 = v12;
    v44[1] = v8;
    if (v42)
    {
      v9 = v104;
      while (1)
      {
        v45 = v11 - 1;
        if (v11 >= 4)
        {
          v50 = v43 + 16 * v11;
          v51 = *(_QWORD *)(v50 - 64);
          v52 = *(_QWORD *)(v50 - 56);
          v56 = __OFSUB__(v52, v51);
          v53 = v52 - v51;
          if (v56)
            goto LABEL_134;
          v55 = *(_QWORD *)(v50 - 48);
          v54 = *(_QWORD *)(v50 - 40);
          v56 = __OFSUB__(v54, v55);
          v48 = v54 - v55;
          v49 = v56;
          if (v56)
            goto LABEL_135;
          v57 = v11 - 2;
          v58 = (uint64_t *)(v43 + 16 * (v11 - 2));
          v60 = *v58;
          v59 = v58[1];
          v56 = __OFSUB__(v59, v60);
          v61 = v59 - v60;
          if (v56)
            goto LABEL_136;
          v56 = __OFADD__(v48, v61);
          v62 = v48 + v61;
          if (v56)
            goto LABEL_138;
          if (v62 >= v53)
          {
            v80 = (uint64_t *)(v43 + 16 * v45);
            v82 = *v80;
            v81 = v80[1];
            v56 = __OFSUB__(v81, v82);
            v83 = v81 - v82;
            if (v56)
              goto LABEL_144;
            v73 = v48 < v83;
            goto LABEL_104;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v74 = *(_QWORD *)(v10 + 32);
            v75 = *(_QWORD *)(v10 + 40);
            v56 = __OFSUB__(v75, v74);
            v67 = v75 - v74;
            v68 = v56;
            goto LABEL_98;
          }
          v47 = *(_QWORD *)(v10 + 32);
          v46 = *(_QWORD *)(v10 + 40);
          v56 = __OFSUB__(v46, v47);
          v48 = v46 - v47;
          v49 = v56;
        }
        if ((v49 & 1) != 0)
          goto LABEL_137;
        v57 = v11 - 2;
        v63 = (uint64_t *)(v43 + 16 * (v11 - 2));
        v65 = *v63;
        v64 = v63[1];
        v66 = __OFSUB__(v64, v65);
        v67 = v64 - v65;
        v68 = v66;
        if (v66)
          goto LABEL_139;
        v69 = (uint64_t *)(v43 + 16 * v45);
        v71 = *v69;
        v70 = v69[1];
        v56 = __OFSUB__(v70, v71);
        v72 = v70 - v71;
        if (v56)
          goto LABEL_141;
        if (__OFADD__(v67, v72))
          goto LABEL_143;
        if (v67 + v72 >= v48)
        {
          v73 = v48 < v72;
LABEL_104:
          if (v73)
            v45 = v57;
          goto LABEL_106;
        }
LABEL_98:
        if ((v68 & 1) != 0)
          goto LABEL_140;
        v76 = (uint64_t *)(v43 + 16 * v45);
        v78 = *v76;
        v77 = v76[1];
        v56 = __OFSUB__(v77, v78);
        v79 = v77 - v78;
        if (v56)
          goto LABEL_142;
        if (v79 < v67)
          goto LABEL_15;
LABEL_106:
        v84 = v45 - 1;
        if (v45 - 1 >= v11)
        {
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
LABEL_143:
          __break(1u);
LABEL_144:
          __break(1u);
LABEL_145:
          __break(1u);
LABEL_146:
          __break(1u);
LABEL_147:
          __break(1u);
LABEL_148:
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
LABEL_153:
          __break(1u);
          goto LABEL_154;
        }
        if (!v9)
          goto LABEL_157;
        v85 = v9;
        v86 = (uint64_t *)(v43 + 16 * v84);
        v87 = *v86;
        v88 = (_QWORD *)(v43 + 16 * v45);
        v89 = v88[1];
        result = sub_24878EA30((char *)(v85 + 24 * *v86), (char *)(v85 + 24 * *v88), v85 + 24 * v89, v105);
        if (v1)
          goto LABEL_114;
        if (v89 < v87)
          goto LABEL_131;
        if (v45 > *(_QWORD *)(v10 + 16))
          goto LABEL_132;
        *v86 = v87;
        *(_QWORD *)(v43 + 16 * v84 + 8) = v89;
        v90 = *(_QWORD *)(v10 + 16);
        if (v45 >= v90)
          goto LABEL_133;
        v11 = v90 - 1;
        result = (uint64_t)memmove((void *)(v43 + 16 * v45), v88 + 2, 16 * (v90 - 1 - v45));
        *(_QWORD *)(v10 + 16) = v90 - 1;
        v73 = v90 > 2;
        v9 = v104;
        if (!v73)
          goto LABEL_15;
      }
    }
    v11 = 1;
    v9 = v104;
LABEL_15:
    v3 = v103;
    if (v8 >= v103)
    {
      v7 = v101;
      goto LABEL_117;
    }
  }
  if (__OFADD__(v12, v102))
    goto LABEL_153;
  if (v12 + v102 >= v3)
    v32 = v3;
  else
    v32 = v12 + v102;
  if (v32 >= v12)
  {
    if (v8 != v32)
    {
      v33 = v98 + 24 * v8;
      do
      {
        v34 = (uint64_t *)(v9 + 24 * v8);
        result = *v34;
        v35 = v34[1];
        v36 = v12;
        v37 = v33;
        do
        {
          if (result == *(_QWORD *)v37 && v35 == *(_QWORD *)(v37 + 8))
            break;
          result = sub_2487B5CE4();
          if ((result & 1) == 0)
            break;
          if (!v9)
            goto LABEL_156;
          v39 = *(_OWORD *)(v37 + 32);
          v40 = *(_QWORD *)(v37 + 16);
          result = *(_QWORD *)(v37 + 24);
          *(_OWORD *)(v37 + 24) = *(_OWORD *)v37;
          *(_QWORD *)(v37 + 40) = v40;
          *(_QWORD *)v37 = result;
          *(_OWORD *)(v37 + 8) = v39;
          v35 = v39;
          v37 -= 24;
          ++v36;
        }
        while (v8 != v36);
        ++v8;
        v33 += 24;
      }
      while (v8 != v32);
      v8 = v32;
    }
    goto LABEL_66;
  }
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  __break(1u);
LABEL_159:
  __break(1u);
  return result;
}

unint64_t sub_24878E2C4(unint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  unint64_t v16;

  v16 = result;
  if (a3 != a2)
  {
    v4 = a3;
    v5 = *a4;
    v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    v7 = *(_QWORD *)(v5 + 8 * v4);
    v8 = v16;
    v9 = (uint64_t *)v6;
    while (1)
    {
      v10 = *v9;
      if (*(_QWORD *)(v7 + 16) && (result = sub_24878C878(0), (v11 & 1) != 0))
      {
        v12 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 120 * result + 80);
        if (!*(_QWORD *)(v10 + 16))
          goto LABEL_14;
      }
      else
      {
        v12 = -1;
        if (!*(_QWORD *)(v10 + 16))
          goto LABEL_14;
      }
      result = sub_24878C878(0);
      if ((v13 & 1) != 0)
      {
        if (v12 >= *(_QWORD *)(*(_QWORD *)(v10 + 56) + 120 * result + 80))
          goto LABEL_4;
        goto LABEL_15;
      }
LABEL_14:
      if (v12 >= -1)
        goto LABEL_4;
LABEL_15:
      if (!v5)
      {
        __break(1u);
        return result;
      }
      v14 = *v9;
      v7 = v9[1];
      *v9 = v7;
      v9[1] = v14;
      --v9;
      if (v4 == ++v8)
      {
LABEL_4:
        ++v4;
        v6 += 8;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
    }
  }
  return result;
}

uint64_t sub_24878E3D8(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  __int128 v14;
  uint64_t v15;

  if (a3 != a2)
  {
    v4 = a3;
    v6 = result;
    v7 = *a4;
    v8 = *a4 + 24 * a3 - 24;
LABEL_5:
    v9 = (uint64_t *)(v7 + 24 * v4);
    result = *v9;
    v10 = v9[1];
    v11 = v6;
    v12 = v8;
    while (1)
    {
      v13 = result == *(_QWORD *)v12 && v10 == *(_QWORD *)(v12 + 8);
      if (v13 || (result = sub_2487B5CE4(), (result & 1) == 0))
      {
LABEL_4:
        ++v4;
        v8 += 24;
        if (v4 == a2)
          return result;
        goto LABEL_5;
      }
      if (!v7)
        break;
      v14 = *(_OWORD *)(v12 + 32);
      v15 = *(_QWORD *)(v12 + 16);
      result = *(_QWORD *)(v12 + 24);
      *(_OWORD *)(v12 + 24) = *(_OWORD *)v12;
      *(_QWORD *)(v12 + 40) = v15;
      *(_QWORD *)v12 = result;
      *(_OWORD *)(v12 + 8) = v14;
      v10 = v14;
      v12 -= 24;
      if (v4 == ++v11)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_24878E4BC(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  BOOL v19;
  uint64_t v20;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = (__src - __dst) / 120;
  v10 = a3 - (_QWORD)__src;
  v11 = (uint64_t)(a3 - (_QWORD)__src) / 120;
  if (v9 >= v11)
  {
    if (a4 != __src || &__src[120 * v11] <= a4)
      memmove(a4, __src, 120 * v11);
    v12 = &v4[120 * v11];
    if (v7 >= v6 || v10 < 120)
      goto LABEL_39;
    v16 = (char *)(a3 - 120);
    while (1)
    {
      v17 = v16 + 120;
      if (*((_QWORD *)v12 - 4) >= *((_QWORD *)v6 - 4))
      {
        v18 = v12 - 120;
        if (v17 != v12)
        {
          v12 -= 120;
          goto LABEL_36;
        }
        v19 = v16 >= v12;
        v12 -= 120;
        if (v19)
          goto LABEL_36;
      }
      else
      {
        v18 = v6 - 120;
        if (v17 != v6)
        {
          v6 -= 120;
LABEL_36:
          memmove(v16, v18, 0x78uLL);
          goto LABEL_37;
        }
        v19 = v16 >= v6;
        v6 -= 120;
        if (v19)
          goto LABEL_36;
      }
LABEL_37:
      if (v6 > v7)
      {
        v16 -= 120;
        if (v12 > v4)
          continue;
      }
      goto LABEL_39;
    }
  }
  if (a4 != __dst || &__dst[120 * v9] <= a4)
    memmove(a4, __dst, 120 * v9);
  v12 = &v4[120 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 120)
  {
    while (1)
    {
      if (*((_QWORD *)v6 + 11) >= *((_QWORD *)v4 + 11))
      {
        v15 = v4 + 120;
        v14 = v4;
        v13 = v6;
        if (v7 == v4)
        {
          v4 += 120;
          if (v7 < v15)
            goto LABEL_16;
        }
        else
        {
          v4 += 120;
        }
      }
      else
      {
        v13 = v6 + 120;
        v14 = v6;
        if (v7 == v6 && v7 < v13)
          goto LABEL_16;
      }
      memmove(v7, v14, 0x78uLL);
LABEL_16:
      v7 += 120;
      if (v4 < v12)
      {
        v6 = v13;
        if ((unint64_t)v13 < a3)
          continue;
      }
      break;
    }
  }
  v6 = v7;
LABEL_39:
  v20 = (v12 - v4) / 120;
  if (v6 != v4 || v6 >= &v4[120 * v20])
    memmove(v6, v4, 120 * v20);
  return 1;
}

uint64_t sub_24878E714(char *__src, char *a2, unint64_t a3, char *__dst)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  char *v22;
  BOOL v23;
  char *v24;
  char *v25;
  uint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  unint64_t v35;
  char v36;
  BOOL v37;
  char *__srca;
  char *__dsta;

  v4 = __dst;
  v6 = a2;
  v7 = __src;
  v8 = a2 - __src;
  v9 = a2 - __src + 7;
  if (a2 - __src >= 0)
    v9 = a2 - __src;
  v10 = v9 >> 3;
  v11 = a3 - (_QWORD)a2;
  v12 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v12 = a3 - (_QWORD)a2;
  v13 = v12 >> 3;
  if (v10 >= v12 >> 3)
  {
    if (__dst != a2 || &a2[8 * v13] <= __dst)
      memmove(__dst, a2, 8 * v13);
    v24 = &v4[8 * v13];
    if (v7 >= v6 || v11 < 8)
    {
      v14 = &v4[8 * v13];
      goto LABEL_57;
    }
    v25 = (char *)(a3 - 8);
    __srca = v4;
    v14 = v24;
    while (1)
    {
      v27 = v14 - 8;
      v26 = *((_QWORD *)v14 - 1);
      v28 = v6 - 8;
      v29 = *((_QWORD *)v6 - 1);
      __dsta = v6;
      if (*(_QWORD *)(v26 + 16) && (v30 = sub_24878C878(0), (v31 & 1) != 0))
      {
        v32 = (unint64_t)v14;
        v33 = *(_QWORD *)(*(_QWORD *)(v26 + 56) + 120 * v30 + 80);
      }
      else
      {
        v32 = (unint64_t)v14;
        v33 = -1;
      }
      v34 = v25 + 8;
      if (*(_QWORD *)(v29 + 16) && (v35 = sub_24878C878(0), (v36 & 1) != 0))
      {
        if (v33 < *(_QWORD *)(*(_QWORD *)(v29 + 56) + 120 * v35 + 80))
          goto LABEL_45;
      }
      else if (v33 < -1)
      {
LABEL_45:
        v4 = __srca;
        if (v34 == __dsta)
        {
          v14 = (char *)v32;
          v6 = v28;
          if (v25 < __dsta)
            goto LABEL_51;
        }
        else
        {
          v14 = (char *)v32;
          v6 = v28;
        }
        goto LABEL_50;
      }
      v4 = __srca;
      v28 = v27;
      if (v34 != (char *)v32)
      {
        v14 = v27;
        v6 = __dsta;
LABEL_50:
        *(_QWORD *)v25 = *(_QWORD *)v28;
        goto LABEL_51;
      }
      v37 = (unint64_t)v25 >= v32;
      v14 = v27;
      v6 = __dsta;
      if (v37)
        goto LABEL_50;
LABEL_51:
      if (v6 > v7)
      {
        v25 -= 8;
        if (v14 > v4)
          continue;
      }
      goto LABEL_57;
    }
  }
  if (__dst != __src || &__src[8 * v10] <= __dst)
    memmove(__dst, __src, 8 * v10);
  v14 = &v4[8 * v10];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    do
    {
      v15 = *(_QWORD *)v6;
      v16 = *(_QWORD *)v4;
      if (*(_QWORD *)(*(_QWORD *)v6 + 16) && (v17 = sub_24878C878(0), (v18 & 1) != 0))
      {
        v19 = *(_QWORD *)(*(_QWORD *)(v15 + 56) + 120 * v17 + 80);
        if (!*(_QWORD *)(v16 + 16))
          goto LABEL_23;
      }
      else
      {
        v19 = -1;
        if (!*(_QWORD *)(v16 + 16))
          goto LABEL_23;
      }
      v20 = sub_24878C878(0);
      if ((v21 & 1) != 0)
      {
        if (v19 >= *(_QWORD *)(*(_QWORD *)(v16 + 56) + 120 * v20 + 80))
          goto LABEL_18;
        goto LABEL_24;
      }
LABEL_23:
      if (v19 >= -1)
      {
LABEL_18:
        v22 = v4;
        v23 = v7 == v4;
        v4 += 8;
        if (v23)
          goto LABEL_20;
LABEL_19:
        *(_QWORD *)v7 = *(_QWORD *)v22;
        goto LABEL_20;
      }
LABEL_24:
      v22 = v6;
      v23 = v7 == v6;
      v6 += 8;
      if (!v23)
        goto LABEL_19;
LABEL_20:
      v7 += 8;
    }
    while (v4 < v14 && (unint64_t)v6 < a3);
  }
  v6 = v7;
LABEL_57:
  if (v6 != v4 || v6 >= &v4[(v14 - v4 + (v14 - v4 < 0 ? 7uLL : 0)) & 0xFFFFFFFFFFFFFFF8])
    memmove(v6, v4, 8 * ((v14 - v4) / 8));
  return 1;
}

uint64_t sub_24878EA30(char *__dst, char *__src, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  BOOL v13;
  char *v14;
  __int128 v15;
  unint64_t v16;
  char *v17;
  char *v18;
  BOOL v19;
  BOOL v20;
  __int128 v21;
  uint64_t v22;

  v4 = a4;
  v6 = __src;
  v7 = __dst;
  v8 = __src - __dst;
  v9 = (__src - __dst) / 24;
  v10 = a3 - (_QWORD)__src;
  v11 = (uint64_t)(a3 - (_QWORD)__src) / 24;
  if (v9 >= v11)
  {
    if (a4 != __src || &__src[24 * v11] <= a4)
      memmove(a4, __src, 24 * v11);
    v12 = &v4[24 * v11];
    if (v7 >= v6 || v10 < 24)
      goto LABEL_44;
    v16 = a3 - 24;
    while (1)
    {
      v17 = (char *)(v16 + 24);
      v18 = v6 - 24;
      v19 = *((_QWORD *)v12 - 3) == *((_QWORD *)v6 - 3) && *((_QWORD *)v12 - 2) == *((_QWORD *)v6 - 2);
      if (v19 || (sub_2487B5CE4() & 1) == 0)
      {
        v18 = v12 - 24;
        if (v17 != v12)
        {
          v12 -= 24;
LABEL_41:
          v21 = *(_OWORD *)v18;
          *(_QWORD *)(v16 + 16) = *((_QWORD *)v18 + 2);
          *(_OWORD *)v16 = v21;
          goto LABEL_42;
        }
        v20 = v16 >= (unint64_t)v12;
        v12 -= 24;
        if (v20)
          goto LABEL_41;
      }
      else
      {
        if (v17 != v6)
        {
          v6 -= 24;
          goto LABEL_41;
        }
        v20 = v16 >= (unint64_t)v6;
        v6 -= 24;
        if (v20)
          goto LABEL_41;
      }
LABEL_42:
      if (v6 > v7)
      {
        v16 -= 24;
        if (v12 > v4)
          continue;
      }
      goto LABEL_44;
    }
  }
  if (a4 != __dst || &__dst[24 * v9] <= a4)
    memmove(a4, __dst, 24 * v9);
  v12 = &v4[24 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 24)
  {
    while (1)
    {
      v13 = *(_QWORD *)v6 == *(_QWORD *)v4 && *((_QWORD *)v6 + 1) == *((_QWORD *)v4 + 1);
      if (v13 || (sub_2487B5CE4() & 1) == 0)
        break;
      v14 = v6;
      v13 = v7 == v6;
      v6 += 24;
      if (!v13)
        goto LABEL_16;
LABEL_17:
      v7 += 24;
      if (v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_19;
    }
    v14 = v4;
    v13 = v7 == v4;
    v4 += 24;
    if (v13)
      goto LABEL_17;
LABEL_16:
    v15 = *(_OWORD *)v14;
    *((_QWORD *)v7 + 2) = *((_QWORD *)v14 + 2);
    *(_OWORD *)v7 = v15;
    goto LABEL_17;
  }
LABEL_19:
  v6 = v7;
LABEL_44:
  v22 = (v12 - v4) / 24;
  if (v6 != v4 || v6 >= &v4[24 * v22])
    memmove(v6, v4, 24 * v22);
  return 1;
}

uint64_t sub_24878EC94(uint64_t a1, char a2)
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
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  int64_t v37;
  uint64_t v38;
  char v39;
  __int128 v40;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777D918);
  v39 = a2;
  v6 = sub_2487B5B7C();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v38 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v36 = v2;
  v37 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v13 << 6);
      goto LABEL_31;
    }
    v22 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v37)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v38 + 8 * v22);
    ++v13;
    if (!v24)
    {
      v13 = v22 + 1;
      if (v22 + 1 >= v37)
        goto LABEL_33;
      v24 = *(_QWORD *)(v38 + 8 * v13);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v37)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((v39 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v38 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v13 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v13 >= v37)
              goto LABEL_33;
            v24 = *(_QWORD *)(v38 + 8 * v13);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v13 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v13 << 6);
LABEL_31:
    v30 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v32 = *v30;
    v31 = v30[1];
    v33 = *(_QWORD *)(v5 + 56) + 24 * v21;
    v34 = *(_QWORD *)v33;
    v40 = *(_OWORD *)(v33 + 8);
    if ((v39 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_2487B5D5C();
    sub_2487B557C();
    result = sub_2487B5D98();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v16 == v27;
        if (v16 == v27)
          v16 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v29 == -1);
      v17 = __clz(__rbit64(~v29)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v32;
    v18[1] = v31;
    v19 = *(_QWORD *)(v7 + 56) + 24 * v17;
    *(_QWORD *)v19 = v34;
    *(_OWORD *)(v19 + 8) = v40;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((v39 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_24878EFD4(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  int64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777D920);
  result = sub_2487B5B7C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v9 = (uint64_t *)(v5 + 64);
    v10 = 1 << *(_BYTE *)(v5 + 32);
    v31 = -1 << v10;
    v32 = v10;
    if (v10 < 64)
      v11 = ~(-1 << v10);
    else
      v11 = -1;
    v12 = v11 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v10 + 63) >> 6;
    v13 = result + 64;
    while (1)
    {
      if (v12)
      {
        v19 = __clz(__rbit64(v12));
        v12 &= v12 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v33)
          goto LABEL_33;
        v22 = v9[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v33)
            goto LABEL_33;
          v22 = v9[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v33)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v32 >= 64)
                  bzero((void *)(v5 + 64), 8 * v33);
                else
                  *v9 = v31;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v22 = v9[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v8 >= v33)
                  goto LABEL_33;
                v22 = v9[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v12 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = 8 * v20;
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + v28);
      v30 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + v28);
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      result = sub_2487B5D50();
      v14 = -1 << *(_BYTE *)(v7 + 32);
      v15 = result & ~v14;
      v16 = v15 >> 6;
      if (((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v13 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v14) >> 6;
        do
        {
          if (++v16 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v26 = v16 == v25;
          if (v16 == v25)
            v16 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v13 + 8 * v16);
        }
        while (v27 == -1);
        v17 = __clz(__rbit64(~v27)) + (v16 << 6);
      }
      *(_QWORD *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = 8 * v17;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + v18) = v29;
      *(_QWORD *)(*(_QWORD *)(v7 + 56) + v18) = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_24878F288(uint64_t a1, char a2)
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
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  char v24;
  unint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  uint64_t *v42;
  uint64_t v43;
  char v44;
  int64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777D928);
  v44 = a2;
  result = sub_2487B5B7C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v40 = v3;
    v8 = 0;
    v42 = (uint64_t *)(v5 + 64);
    v43 = v5;
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v38 = -1 << v9;
    v39 = v9;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v41 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v18 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v45 = v8;
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
        result = (uint64_t)v42;
        if (v20 >= v41)
          goto LABEL_33;
        v21 = v42[v20];
        v22 = v8 + 1;
        if (!v21)
        {
          v22 = v20 + 1;
          if (v20 + 1 >= v41)
            goto LABEL_33;
          v21 = v42[v22];
          if (!v21)
          {
            v23 = v20 + 2;
            if (v23 >= v41)
            {
LABEL_33:
              if ((v44 & 1) == 0)
              {
                result = swift_release();
                v3 = v40;
                goto LABEL_40;
              }
              if (v39 >= 64)
                bzero(v42, 8 * v41);
              else
                *v42 = v38;
              v3 = v40;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v21 = v42[v23];
            if (!v21)
            {
              while (1)
              {
                v22 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_42;
                if (v22 >= v41)
                  goto LABEL_33;
                v21 = v42[v22];
                ++v23;
                if (v21)
                  goto LABEL_30;
              }
            }
            v22 = v23;
          }
        }
LABEL_30:
        v11 = (v21 - 1) & v21;
        v45 = v22;
        v19 = __clz(__rbit64(v21)) + (v22 << 6);
      }
      v28 = *(_QWORD *)(v5 + 56);
      v29 = *(_QWORD *)(*(_QWORD *)(v5 + 48) + 8 * v19);
      v30 = (uint64_t *)(v28 + 120 * v19);
      v31 = v30[1];
      v32 = v30[3];
      v50 = v30[2];
      v51 = *v30;
      v33 = v30[5];
      v34 = v30[7];
      v48 = v30[6];
      v49 = v30[4];
      v35 = v30[9];
      v52 = *((_OWORD *)v30 + 5);
      v36 = v30[12];
      v37 = v30[14];
      v46 = v30[13];
      v47 = v30[8];
      if ((v44 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
      }
      result = sub_2487B5D50();
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v24 = 0;
        v25 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_41;
          }
          v26 = v15 == v25;
          if (v15 == v25)
            v15 = 0;
          v24 |= v26;
          v27 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v27 == -1);
        v16 = __clz(__rbit64(~v27)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_QWORD *)(*(_QWORD *)(v7 + 48) + 8 * v16) = v29;
      v17 = *(_QWORD *)(v7 + 56) + 120 * v16;
      *(_QWORD *)v17 = v51;
      *(_QWORD *)(v17 + 8) = v31;
      *(_QWORD *)(v17 + 16) = v50;
      *(_QWORD *)(v17 + 24) = v32;
      *(_QWORD *)(v17 + 32) = v49;
      *(_QWORD *)(v17 + 40) = v33;
      *(_QWORD *)(v17 + 48) = v48;
      *(_QWORD *)(v17 + 56) = v34;
      *(_QWORD *)(v17 + 64) = v47;
      *(_QWORD *)(v17 + 72) = v35;
      *(_OWORD *)(v17 + 80) = v52;
      *(_QWORD *)(v17 + 96) = v36;
      v8 = v45;
      *(_QWORD *)(v17 + 104) = v46;
      *(_QWORD *)(v17 + 112) = v37;
      ++*(_QWORD *)(v7 + 16);
      v5 = v43;
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_24878F5F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t result;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;

  v7 = v6;
  v14 = *v6;
  v16 = sub_248709700(a4, a5);
  v17 = *(_QWORD *)(v14 + 16);
  v18 = (v15 & 1) == 0;
  v19 = v17 + v18;
  if (__OFADD__(v17, v18))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v20 = v15;
  v21 = *(_QWORD *)(v14 + 24);
  if (v21 >= v19 && (a6 & 1) != 0)
    goto LABEL_7;
  if (v21 >= v19 && (a6 & 1) == 0)
  {
    sub_24878FA24();
LABEL_7:
    v22 = (_QWORD *)*v7;
    if ((v20 & 1) != 0)
    {
LABEL_8:
      v23 = (_QWORD *)(v22[7] + 24 * v16);
      swift_bridgeObjectRelease();
      result = swift_bridgeObjectRelease();
      *v23 = a1;
      v23[1] = a2;
      v23[2] = a3;
      return result;
    }
LABEL_11:
    v22[(v16 >> 6) + 8] |= 1 << v16;
    v27 = (uint64_t *)(v22[6] + 16 * v16);
    *v27 = a4;
    v27[1] = a5;
    v28 = (_QWORD *)(v22[7] + 24 * v16);
    *v28 = a1;
    v28[1] = a2;
    v28[2] = a3;
    v29 = v22[2];
    v30 = __OFADD__(v29, 1);
    v31 = v29 + 1;
    if (!v30)
    {
      v22[2] = v31;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_24878EC94(v19, a6 & 1);
  v25 = sub_248709700(a4, a5);
  if ((v20 & 1) == (v26 & 1))
  {
    v16 = v25;
    v22 = (_QWORD *)*v7;
    if ((v20 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2487B5D14();
  __break(1u);
  return result;
}

uint64_t sub_24878F77C(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v8 = *v3;
  v10 = sub_24878C878(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_24878FC08();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];
      result = swift_bridgeObjectRelease();
      *(_QWORD *)(v17 + 8 * v10) = a1;
      return result;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    v19 = 8 * v10;
    *(_QWORD *)(v16[6] + v19) = a2;
    *(_QWORD *)(v16[7] + v19) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return result;
    }
    goto LABEL_14;
  }
  sub_24878EFD4(result, a3 & 1);
  result = sub_24878C878(a2);
  if ((v14 & 1) == (v18 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2487B5D14();
  __break(1u);
  return result;
}

uint64_t sub_24878F8B4(uint64_t a1, uint64_t a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t result;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;

  v4 = v3;
  v8 = *v3;
  v10 = sub_24878C878(a2);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  result = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= result && (a3 & 1) == 0)
  {
    result = (uint64_t)sub_24878FDA8();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      return sub_248791EBC(a1, v16[7] + 120 * v10);
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_QWORD *)(v16[6] + 8 * v10) = a2;
    v18 = v16[7] + 120 * v10;
    v19 = *(_OWORD *)a1;
    v20 = *(_OWORD *)(a1 + 16);
    v21 = *(_OWORD *)(a1 + 48);
    *(_OWORD *)(v18 + 32) = *(_OWORD *)(a1 + 32);
    *(_OWORD *)(v18 + 48) = v21;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    v22 = *(_OWORD *)(a1 + 64);
    v23 = *(_OWORD *)(a1 + 80);
    v24 = *(_OWORD *)(a1 + 96);
    *(_QWORD *)(v18 + 112) = *(_QWORD *)(a1 + 112);
    *(_OWORD *)(v18 + 80) = v23;
    *(_OWORD *)(v18 + 96) = v24;
    *(_OWORD *)(v18 + 64) = v22;
    v25 = v16[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (!v26)
    {
      v16[2] = v27;
      return result;
    }
    goto LABEL_14;
  }
  sub_24878F288(result, a3 & 1);
  result = sub_24878C878(a2);
  if ((v14 & 1) == (v17 & 1))
  {
    v10 = result;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      return sub_248791EBC(a1, v16[7] + 120 * v10);
    goto LABEL_11;
  }
LABEL_15:
  result = sub_2487B5D14();
  __break(1u);
  return result;
}

void *sub_24878FA24()
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
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  __int128 v24;
  uint64_t v25;
  int64_t v26;
  unint64_t v27;
  int64_t v28;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777D918);
  v2 = *v0;
  v3 = sub_2487B5B70();
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
    v26 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v26 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v26);
    ++v9;
    if (!v27)
    {
      v9 = v26 + 1;
      if (v26 + 1 >= v13)
        goto LABEL_26;
      v27 = *(_QWORD *)(v6 + 8 * v9);
      if (!v27)
        break;
    }
LABEL_25:
    v12 = (v27 - 1) & v27;
    v15 = __clz(__rbit64(v27)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 24 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v24 = *(_OWORD *)(v21 + 8);
    *v23 = v19;
    v23[1] = v18;
    v25 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v25 = v22;
    *(_OWORD *)(v25 + 8) = v24;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v28 = v26 + 2;
  if (v28 >= v13)
    goto LABEL_26;
  v27 = *(_QWORD *)(v6 + 8 * v28);
  if (v27)
  {
    v9 = v28;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v27 = *(_QWORD *)(v6 + 8 * v9);
    ++v28;
    if (v27)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24878FC08()
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
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777D920);
  v2 = *v0;
  v3 = sub_2487B5B70();
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
    v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v18 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_26;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
        break;
    }
LABEL_25:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = *(_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v17;
    result = (void *)swift_bridgeObjectRetain();
  }
  v20 = v18 + 2;
  if (v20 >= v13)
    goto LABEL_26;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_24878FDA8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *result;
  unint64_t v5;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
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
  __int128 v31;
  uint64_t v32;
  int64_t v33;
  unint64_t v34;
  int64_t v35;
  uint64_t *v36;
  uint64_t v37;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25777D928);
  v36 = v0;
  v1 = *v0;
  v2 = sub_2487B5B70();
  v3 = v2;
  if (!*(_QWORD *)(v1 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v36 = v3;
    return result;
  }
  result = (void *)(v2 + 64);
  v5 = (unint64_t)((1 << *(_BYTE *)(v3 + 32)) + 63) >> 6;
  if (v3 != v1 || (unint64_t)result >= v1 + 64 + 8 * v5)
    result = memmove(result, (const void *)(v1 + 64), 8 * v5);
  v37 = v1 + 64;
  v7 = 0;
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(v1 + 16);
  v8 = 1 << *(_BYTE *)(v1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(v1 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  while (1)
  {
    if (v10)
    {
      v12 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v13 = v12 | (v7 << 6);
      goto LABEL_12;
    }
    v33 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v33 >= v11)
      goto LABEL_26;
    v34 = *(_QWORD *)(v37 + 8 * v33);
    ++v7;
    if (!v34)
    {
      v7 = v33 + 1;
      if (v33 + 1 >= v11)
        goto LABEL_26;
      v34 = *(_QWORD *)(v37 + 8 * v7);
      if (!v34)
        break;
    }
LABEL_25:
    v10 = (v34 - 1) & v34;
    v13 = __clz(__rbit64(v34)) + (v7 << 6);
LABEL_12:
    v14 = 8 * v13;
    v15 = *(_QWORD *)(*(_QWORD *)(v1 + 48) + 8 * v13);
    v16 = 120 * v13;
    v17 = *(_QWORD *)(v1 + 56) + v16;
    v19 = *(_QWORD *)v17;
    v18 = *(_QWORD *)(v17 + 8);
    v20 = *(_QWORD *)(v17 + 16);
    v21 = *(_QWORD *)(v17 + 24);
    v22 = *(_QWORD *)(v17 + 32);
    v23 = *(_QWORD *)(v17 + 40);
    v24 = *(_QWORD *)(v17 + 48);
    v25 = *(_QWORD *)(v17 + 56);
    v26 = *(_QWORD *)(v17 + 64);
    v27 = *(_QWORD *)(v17 + 72);
    v28 = *(_QWORD *)(v17 + 96);
    v29 = *(_QWORD *)(v17 + 104);
    v30 = *(_QWORD *)(v17 + 112);
    v31 = *(_OWORD *)(v17 + 80);
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + v14) = v15;
    v32 = *(_QWORD *)(v3 + 56) + v16;
    *(_QWORD *)v32 = v19;
    *(_QWORD *)(v32 + 8) = v18;
    *(_QWORD *)(v32 + 16) = v20;
    *(_QWORD *)(v32 + 24) = v21;
    *(_QWORD *)(v32 + 32) = v22;
    *(_QWORD *)(v32 + 40) = v23;
    *(_QWORD *)(v32 + 48) = v24;
    *(_QWORD *)(v32 + 56) = v25;
    *(_QWORD *)(v32 + 64) = v26;
    *(_QWORD *)(v32 + 72) = v27;
    *(_OWORD *)(v32 + 80) = v31;
    *(_QWORD *)(v32 + 96) = v28;
    *(_QWORD *)(v32 + 104) = v29;
    *(_QWORD *)(v32 + 112) = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v35 = v33 + 2;
  if (v35 >= v11)
    goto LABEL_26;
  v34 = *(_QWORD *)(v37 + 8 * v35);
  if (v34)
  {
    v7 = v35;
    goto LABEL_25;
  }
  while (1)
  {
    v7 = v35 + 1;
    if (__OFADD__(v35, 1))
      break;
    if (v7 >= v11)
      goto LABEL_26;
    v34 = *(_QWORD *)(v37 + 8 * v7);
    ++v35;
    if (v34)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

char *sub_24878FFD8(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25777D940);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 120);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[120 * v8])
      memmove(v12, v13, 120 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_2487900F0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25777D930);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

char *sub_2487901F0(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25777D910);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8])
      memmove(v12, v13, 24 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_248790308(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  uint64_t v10;
  int64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  _OWORD v21[4];
  uint64_t v22;

  v4 = a2 + 64;
  v5 = 1 << *(_BYTE *)(a2 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(a2 + 64);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v10 = 0;
  v11 = 0;
  while (1)
  {
    if (v7)
    {
      v12 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v13 = v12 | (v11 << 6);
      goto LABEL_5;
    }
    v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v18 >= v8)
      goto LABEL_19;
    v19 = *(_QWORD *)(v4 + 8 * v18);
    ++v11;
    if (!v19)
    {
      v11 = v18 + 1;
      if (v18 + 1 >= v8)
        goto LABEL_19;
      v19 = *(_QWORD *)(v4 + 8 * v11);
      if (!v19)
        break;
    }
LABEL_18:
    v7 = (v19 - 1) & v19;
    v13 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_5:
    v14 = *(_QWORD *)(*(_QWORD *)(a2 + 56) + 8 * v13);
    v15 = *(_QWORD *)(a1 + 64);
    v16 = *(_OWORD *)(a1 + 16);
    v21[0] = *(_OWORD *)a1;
    v21[1] = v16;
    v17 = *(_OWORD *)(a1 + 48);
    v21[2] = *(_OWORD *)(a1 + 32);
    v21[3] = v17;
    v22 = v15;
    sub_2487B5D68();
    swift_bridgeObjectRetain();
    sub_2487904A0((uint64_t)v21, v14);
    swift_bridgeObjectRelease();
    result = sub_2487B5D98();
    v10 ^= result;
  }
  v20 = v18 + 2;
  if (v20 >= v8)
  {
LABEL_19:
    swift_release();
    return sub_2487B5D68();
  }
  v19 = *(_QWORD *)(v4 + 8 * v20);
  if (v19)
  {
    v11 = v20;
    goto LABEL_18;
  }
  while (1)
  {
    v11 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v11 >= v8)
      goto LABEL_19;
    v19 = *(_QWORD *)(v4 + 8 * v11);
    ++v20;
    if (v19)
      goto LABEL_18;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_2487904A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  int64_t i;
  unint64_t v8;
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
  __int128 v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t v28;
  uint64_t v29;
  int64_t v30;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  _QWORD v35[11];
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v29 = a2 + 64;
  v2 = 1 << *(_BYTE *)(a2 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a2 + 64);
  v30 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v6 = 0;
  for (i = 0; ; i = v33)
  {
    v34 = v6;
    if (v4)
    {
      v32 = (v4 - 1) & v4;
      v33 = i;
      v8 = __clz(__rbit64(v4)) | (i << 6);
      goto LABEL_5;
    }
    v25 = i + 1;
    if (__OFADD__(i, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v25 >= v30)
      goto LABEL_19;
    v26 = *(_QWORD *)(v29 + 8 * v25);
    v27 = i + 1;
    if (!v26)
    {
      v27 = i + 2;
      if (i + 2 >= v30)
        goto LABEL_19;
      v26 = *(_QWORD *)(v29 + 8 * v27);
      if (!v26)
        break;
    }
LABEL_18:
    v32 = (v26 - 1) & v26;
    v33 = v27;
    v8 = __clz(__rbit64(v26)) + (v27 << 6);
LABEL_5:
    v9 = *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * v8);
    v10 = *(_QWORD *)(a2 + 56) + 120 * v8;
    v11 = *(_QWORD *)v10;
    v12 = *(_QWORD *)(v10 + 8);
    v13 = *(_QWORD *)(v10 + 16);
    v14 = *(_QWORD *)(v10 + 24);
    v15 = *(_QWORD *)(v10 + 32);
    v16 = *(_QWORD *)(v10 + 40);
    v17 = *(_QWORD *)(v10 + 48);
    v18 = *(_QWORD *)(v10 + 56);
    v19 = *(_QWORD *)(v10 + 64);
    v20 = *(_QWORD *)(v10 + 72);
    v21 = *(_QWORD *)(v10 + 96);
    v22 = *(_QWORD *)(v10 + 104);
    v23 = *(_QWORD *)(v10 + 112);
    v24 = *(_OWORD *)(v10 + 80);
    v35[0] = v9;
    v35[1] = v11;
    v35[2] = v12;
    v35[3] = v13;
    v35[4] = v14;
    v35[5] = v15;
    v35[6] = v16;
    v35[7] = v17;
    v35[8] = v18;
    v35[9] = v19;
    v35[10] = v20;
    v36 = v24;
    v37 = v21;
    v38 = v22;
    v39 = v23;
    nullsub_1(v35);
    sub_248791ECC((uint64_t)v35, (uint64_t)&v40);
    sub_2487B5D68();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_2487B557C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2487B557C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2487B557C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2487B557C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_2487B557C();
    swift_bridgeObjectRelease();
    sub_2487B5D68();
    sub_2487B5D68();
    sub_2487B5D8C();
    swift_bridgeObjectRetain();
    sub_2487B557C();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    result = sub_2487B5D98();
    v6 = result ^ v34;
    v4 = v32;
  }
  v28 = i + 3;
  if (i + 3 >= v30)
  {
LABEL_19:
    swift_release();
    return sub_2487B5D68();
  }
  v26 = *(_QWORD *)(v29 + 8 * v28);
  if (v26)
  {
    v27 = i + 3;
    goto LABEL_18;
  }
  while (1)
  {
    v27 = v28 + 1;
    if (__OFADD__(v28, 1))
      break;
    if (v27 >= v30)
      goto LABEL_19;
    v26 = *(_QWORD *)(v29 + 8 * v27);
    ++v28;
    if (v26)
      goto LABEL_18;
  }
LABEL_21:
  __break(1u);
  return result;
}

_QWORD *sub_248790854(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
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
  __int128 v32;
  uint64_t v33;
  _QWORD *v34;
  int64_t v35;
  uint64_t v36;

  v6 = *(_QWORD *)(a4 + 64);
  v4 = a4 + 64;
  v5 = v6;
  v36 = v4;
  v7 = -1 << *(_BYTE *)(v4 - 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & v5;
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_39:
    *result = a4;
    result[1] = v36;
    result[2] = ~v7;
    result[3] = v12;
    result[4] = v9;
    return (_QWORD *)v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v11 = a2;
  v33 = -1 << *(_BYTE *)(v4 - 32);
  v34 = result;
  v12 = 0;
  v13 = 0;
  v35 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v14 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v15 = v14 | (v12 << 6);
  while (1)
  {
    ++v13;
    v19 = *(_QWORD *)(a4 + 56) + 120 * v15;
    v20 = *(_QWORD *)(v19 + 8);
    v21 = *(_QWORD *)(v19 + 16);
    v22 = *(_QWORD *)(v19 + 24);
    v23 = *(_QWORD *)(v19 + 32);
    v24 = *(_QWORD *)(v19 + 40);
    v25 = *(_QWORD *)(v19 + 48);
    v26 = *(_QWORD *)(v19 + 56);
    v27 = *(_QWORD *)(v19 + 64);
    v28 = *(_QWORD *)(v19 + 72);
    v29 = *(_QWORD *)(v19 + 96);
    v30 = *(_QWORD *)(v19 + 104);
    v31 = *(_QWORD *)(v19 + 112);
    v32 = *(_OWORD *)(v19 + 80);
    *(_QWORD *)v11 = *(_QWORD *)v19;
    *(_QWORD *)(v11 + 8) = v20;
    *(_QWORD *)(v11 + 16) = v21;
    *(_QWORD *)(v11 + 24) = v22;
    *(_QWORD *)(v11 + 32) = v23;
    *(_QWORD *)(v11 + 40) = v24;
    *(_QWORD *)(v11 + 48) = v25;
    *(_QWORD *)(v11 + 56) = v26;
    *(_QWORD *)(v11 + 64) = v27;
    *(_QWORD *)(v11 + 72) = v28;
    *(_OWORD *)(v11 + 80) = v32;
    *(_QWORD *)(v11 + 96) = v29;
    *(_QWORD *)(v11 + 104) = v30;
    *(_QWORD *)(v11 + 112) = v31;
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v11 += 120;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (_QWORD *)swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v16 >= v35)
      goto LABEL_33;
    v17 = *(_QWORD *)(v36 + 8 * v16);
    if (!v17)
    {
      v12 += 2;
      if (v16 + 1 >= v35)
      {
        v9 = 0;
        v12 = v16;
      }
      else
      {
        v17 = *(_QWORD *)(v36 + 8 * v12);
        if (v17)
          goto LABEL_14;
        v18 = v16 + 2;
        if (v16 + 2 >= v35)
          goto LABEL_33;
        v17 = *(_QWORD *)(v36 + 8 * v18);
        if (v17)
        {
LABEL_17:
          v16 = v18;
          goto LABEL_18;
        }
        v12 = v16 + 3;
        if (v16 + 3 < v35)
        {
          v17 = *(_QWORD *)(v36 + 8 * v12);
          if (v17)
          {
LABEL_14:
            v16 = v12;
            goto LABEL_18;
          }
          v18 = v16 + 4;
          if (v16 + 4 >= v35)
          {
LABEL_33:
            v9 = 0;
            goto LABEL_37;
          }
          v17 = *(_QWORD *)(v36 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v16 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_42;
              if (v16 >= v35)
              {
                v9 = 0;
                v12 = v35 - 1;
                goto LABEL_37;
              }
              v17 = *(_QWORD *)(v36 + 8 * v16);
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v9 = 0;
        v12 = v16 + 2;
      }
LABEL_37:
      v10 = v13;
LABEL_38:
      v7 = v33;
      result = v34;
      goto LABEL_39;
    }
LABEL_18:
    v9 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v16 << 6);
    v12 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

uint64_t sub_248790B20(uint64_t result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v5 = (_QWORD *)result;
  v6 = a4 + 64;
  v7 = -1 << *(_BYTE *)(a4 + 32);
  if (-v7 < 64)
    v8 = ~(-1 << -(char)v7);
  else
    v8 = -1;
  v9 = v8 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v12 = 0;
    v10 = 0;
LABEL_38:
    *v5 = a4;
    v5[1] = v6;
    v5[2] = ~v7;
    v5[3] = v12;
    v5[4] = v9;
    return v10;
  }
  v10 = a3;
  if (!a3)
  {
    v12 = 0;
    goto LABEL_38;
  }
  if (a3 < 0)
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = a2;
  v12 = 0;
  v13 = 0;
  v14 = (unint64_t)(63 - v7) >> 6;
  if (!v9)
    goto LABEL_9;
LABEL_8:
  v15 = __clz(__rbit64(v9));
  v9 &= v9 - 1;
  v16 = v15 | (v12 << 6);
  while (1)
  {
    ++v13;
    *v11 = *(_QWORD *)(*(_QWORD *)(a4 + 56) + 8 * v16);
    if (v13 == v10)
    {
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    ++v11;
    result = swift_bridgeObjectRetain();
    if (v9)
      goto LABEL_8;
LABEL_9:
    v17 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_40;
    }
    if (v17 >= v14)
      goto LABEL_33;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    if (!v18)
      break;
LABEL_18:
    v9 = (v18 - 1) & v18;
    v16 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
  }
  v12 += 2;
  if (v17 + 1 >= v14)
  {
    v9 = 0;
    v12 = v17;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
    goto LABEL_14;
  v19 = v17 + 2;
  if (v17 + 2 >= v14)
    goto LABEL_33;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
    goto LABEL_17;
  v12 = v17 + 3;
  if (v17 + 3 >= v14)
  {
    v9 = 0;
    v12 = v17 + 2;
    goto LABEL_37;
  }
  v18 = *(_QWORD *)(v6 + 8 * v12);
  if (v18)
  {
LABEL_14:
    v17 = v12;
    goto LABEL_18;
  }
  v19 = v17 + 4;
  if (v17 + 4 >= v14)
  {
LABEL_33:
    v9 = 0;
LABEL_37:
    v10 = v13;
    goto LABEL_38;
  }
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
LABEL_17:
    v17 = v19;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v14)
    {
      v9 = 0;
      v12 = v14 - 1;
      goto LABEL_37;
    }
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_18;
  }
LABEL_41:
  __break(1u);
  return result;
}

_QWORD *sub_248790D18(_QWORD *result, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  v5 = a4 + 64;
  v6 = -1 << *(_BYTE *)(a4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(a4 + 64);
  if (!a2)
  {
    v11 = 0;
    v9 = 0;
LABEL_39:
    *result = a4;
    result[1] = v5;
    result[2] = ~v6;
    result[3] = v11;
    result[4] = v8;
    return (_QWORD *)v9;
  }
  v9 = a3;
  if (!a3)
  {
    v11 = 0;
    goto LABEL_39;
  }
  if (a3 < 0)
    goto LABEL_41;
  v10 = a2;
  v22 = -1 << *(_BYTE *)(a4 + 32);
  v23 = result;
  v11 = 0;
  v12 = 0;
  v13 = (unint64_t)(63 - v6) >> 6;
  if (!v8)
    goto LABEL_9;
LABEL_8:
  v14 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  v15 = v14 | (v11 << 6);
  while (1)
  {
    ++v12;
    v19 = (_QWORD *)(*(_QWORD *)(a4 + 56) + 24 * v15);
    v20 = v19[1];
    v21 = v19[2];
    *v10 = *v19;
    v10[1] = v20;
    v10[2] = v21;
    if (v12 == v9)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      goto LABEL_38;
    }
    v10 += 3;
    swift_bridgeObjectRetain();
    result = (_QWORD *)swift_bridgeObjectRetain();
    if (v8)
      goto LABEL_8;
LABEL_9:
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v16 >= v13)
      goto LABEL_33;
    v17 = *(_QWORD *)(v5 + 8 * v16);
    if (!v17)
    {
      v11 += 2;
      if (v16 + 1 >= v13)
      {
        v8 = 0;
        v11 = v16;
      }
      else
      {
        v17 = *(_QWORD *)(v5 + 8 * v11);
        if (v17)
          goto LABEL_14;
        v18 = v16 + 2;
        if (v16 + 2 >= v13)
          goto LABEL_33;
        v17 = *(_QWORD *)(v5 + 8 * v18);
        if (v17)
        {
LABEL_17:
          v16 = v18;
          goto LABEL_18;
        }
        v11 = v16 + 3;
        if (v16 + 3 < v13)
        {
          v17 = *(_QWORD *)(v5 + 8 * v11);
          if (v17)
          {
LABEL_14:
            v16 = v11;
            goto LABEL_18;
          }
          v18 = v16 + 4;
          if (v16 + 4 >= v13)
          {
LABEL_33:
            v8 = 0;
            goto LABEL_37;
          }
          v17 = *(_QWORD *)(v5 + 8 * v18);
          if (!v17)
          {
            while (1)
            {
              v16 = v18 + 1;
              if (__OFADD__(v18, 1))
                goto LABEL_42;
              if (v16 >= v13)
              {
                v8 = 0;
                v11 = v13 - 1;
                goto LABEL_37;
              }
              v17 = *(_QWORD *)(v5 + 8 * v16);
              ++v18;
              if (v17)
                goto LABEL_18;
            }
          }
          goto LABEL_17;
        }
        v8 = 0;
        v11 = v16 + 2;
      }
LABEL_37:
      v9 = v12;
LABEL_38:
      v6 = v22;
      result = v23;
      goto LABEL_39;
    }
LABEL_18:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v16 << 6);
    v11 = v16;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

char *sub_248790F34(uint64_t a1)
{
  return sub_24878FFD8(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_248790F48(uint64_t a1)
{
  return sub_2487900F0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

char *sub_248790F5C(uint64_t a1)
{
  return sub_2487901F0(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t _s31TextToSpeechVoiceBankingSupport23TTSVBTrainingScriptItemV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  char v14;
  uint64_t result;
  char v16;
  char v17;
  char v18;
  char v19;
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

  v2 = *(_QWORD *)(a1 + 16);
  v4 = *(_QWORD *)(a1 + 24);
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v32 = *(_QWORD *)(a1 + 56);
  v33 = *(_QWORD *)(a1 + 48);
  v30 = *(_QWORD *)(a1 + 72);
  v31 = *(_QWORD *)(a1 + 64);
  v25 = *(_QWORD *)(a1 + 88);
  v6 = *(double *)(a1 + 96);
  v22 = *(_QWORD *)(a1 + 112);
  v23 = *(_QWORD *)(a1 + 104);
  v8 = *(_QWORD *)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 24);
  v10 = *(_QWORD *)(a2 + 32);
  v9 = *(_QWORD *)(a2 + 40);
  v12 = *(_QWORD *)(a2 + 48);
  v11 = *(_QWORD *)(a2 + 56);
  v29 = *(_QWORD *)(a2 + 64);
  v27 = *(_QWORD *)(a1 + 80);
  v28 = *(_QWORD *)(a2 + 72);
  v26 = *(_QWORD *)(a2 + 80);
  v24 = *(_QWORD *)(a2 + 88);
  v13 = *(double *)(a2 + 96);
  v20 = *(_QWORD *)(a2 + 112);
  v21 = *(_QWORD *)(a2 + 104);
  if (*(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8)
    || (v14 = sub_2487B5CE4(), result = 0, (v14 & 1) != 0))
  {
    if (v2 == v8 && v4 == v7 || (v16 = sub_2487B5CE4(), result = 0, (v16 & 1) != 0))
    {
      if (v3 == v10 && v5 == v9 || (v17 = sub_2487B5CE4(), result = 0, (v17 & 1) != 0))
      {
        if (v33 == v12 && v32 == v11 || (v18 = sub_2487B5CE4(), result = 0, (v18 & 1) != 0))
        {
          if (v31 == v29 && v30 == v28)
          {
            result = 0;
          }
          else
          {
            v19 = sub_2487B5CE4();
            result = 0;
            if ((v19 & 1) == 0)
              return result;
          }
          if (v27 == v26 && v25 == v24 && v6 == v13)
          {
            if (v23 == v21 && v22 == v20)
              return 1;
            else
              return sub_2487B5CE4();
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_248791194()
{
  unint64_t result;

  result = qword_25777D8D0;
  if (!qword_25777D8D0)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBTrainingScriptItem.CodingKeys, &type metadata for TTSVBTrainingScriptItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25777D8D0);
  }
  return result;
}

uint64_t sub_2487911D8@<X0>(uint64_t *a1@<X8>)
{
  return sub_24878ACFC(a1);
}

uint64_t sub_2487911F0()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_248791214()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_248791248(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v3;

  return sub_24878AD80(a1, a2, a3, *(_QWORD *)(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t sub_248791254(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

BOOL _s31TextToSpeechVoiceBankingSupport17TTSVBTrainingBookV0G9ParagraphV1loiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;

  v2 = *a1;
  v3 = *a2;
  if (*(_QWORD *)(*a1 + 16) && (v4 = sub_24878C878(0), (v5 & 1) != 0))
  {
    v6 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + 120 * v4 + 80);
    if (!*(_QWORD *)(v3 + 16))
      goto LABEL_8;
  }
  else
  {
    v6 = -1;
    if (!*(_QWORD *)(v3 + 16))
    {
LABEL_8:
      v9 = -1;
      return v6 < v9;
    }
  }
  v7 = sub_24878C878(0);
  if ((v8 & 1) == 0)
    goto LABEL_8;
  v9 = *(_QWORD *)(*(_QWORD *)(v3 + 56) + 120 * v7 + 80);
  return v6 < v9;
}

unint64_t sub_248791330(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  _OWORD *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[80];
  _BYTE v30[32];
  __int128 v31;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777D928);
  v3 = (_QWORD *)sub_2487B5B88();
  v4 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)&v29[64] = *(_OWORD *)(a1 + 96);
  *(_OWORD *)v30 = v4;
  v5 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)&v30[16] = *(_OWORD *)(a1 + 128);
  v31 = v5;
  v6 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)v29 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)&v29[16] = v6;
  v7 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&v29[32] = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&v29[48] = v7;
  v8 = *(_QWORD *)v29;
  result = sub_24878C878(*(uint64_t *)v29);
  if ((v10 & 1) != 0)
  {
LABEL_7:
    __break(1u);
    return MEMORY[0x24BEE4B00];
  }
  v11 = (_OWORD *)(a1 + 160);
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v8;
    v12 = v3[7] + 120 * result;
    v13 = *(_OWORD *)&v29[24];
    v14 = *(_OWORD *)&v29[40];
    v15 = *(_OWORD *)&v29[56];
    v16 = *(_QWORD *)&v29[72];
    v17 = *(_QWORD *)v30;
    v18 = *(_QWORD *)&v30[24];
    v19 = v31;
    v20 = *(_OWORD *)&v30[8];
    *(_OWORD *)v12 = *(_OWORD *)&v29[8];
    *(_OWORD *)(v12 + 16) = v13;
    *(_OWORD *)(v12 + 32) = v14;
    *(_OWORD *)(v12 + 48) = v15;
    *(_QWORD *)(v12 + 64) = v16;
    *(_QWORD *)(v12 + 72) = v17;
    *(_OWORD *)(v12 + 80) = v20;
    *(_QWORD *)(v12 + 96) = v18;
    *(_OWORD *)(v12 + 104) = v19;
    v21 = v3[2];
    v22 = __OFADD__(v21, 1);
    v23 = v21 + 1;
    if (v22)
      break;
    v3[2] = v23;
    sub_248791F14((uint64_t)v29);
    if (!--v1)
      return (unint64_t)v3;
    v24 = v11[5];
    *(_OWORD *)&v29[64] = v11[4];
    *(_OWORD *)v30 = v24;
    v25 = v11[7];
    *(_OWORD *)&v30[16] = v11[6];
    v31 = v25;
    v26 = v11[1];
    *(_OWORD *)v29 = *v11;
    *(_OWORD *)&v29[16] = v26;
    v27 = v11[3];
    *(_OWORD *)&v29[32] = v11[2];
    *(_OWORD *)&v29[48] = v27;
    v8 = *(_QWORD *)v29;
    result = sub_24878C878(*(uint64_t *)v29);
    v11 += 8;
    if ((v28 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_24879149C(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x24BEE4B00];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777D920);
  v3 = (_QWORD *)sub_2487B5B88();
  v5 = a1[4];
  v4 = a1[5];
  result = sub_24878C878(v5);
  if ((v7 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v8 = a1 + 7;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v9 = 8 * result;
    *(_QWORD *)(v3[6] + v9) = v5;
    *(_QWORD *)(v3[7] + v9) = v4;
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      break;
    v3[2] = v12;
    if (!--v1)
      goto LABEL_8;
    v13 = v8 + 2;
    v5 = *(v8 - 1);
    v14 = *v8;
    swift_bridgeObjectRetain();
    result = sub_24878C878(v5);
    v8 = v13;
    v4 = v14;
    if ((v15 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

uint64_t sub_248791598(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_24879160C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_248791684()
{
  unint64_t result;

  result = qword_25777D8E0;
  if (!qword_25777D8E0)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBTrainingScriptItem.CodingKeys, &type metadata for TTSVBTrainingScriptItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25777D8E0);
  }
  return result;
}

unint64_t sub_2487916CC()
{
  unint64_t result;

  result = qword_25777D8E8;
  if (!qword_25777D8E8)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBTrainingScriptItem.CodingKeys, &type metadata for TTSVBTrainingScriptItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25777D8E8);
  }
  return result;
}

unint64_t sub_248791714()
{
  unint64_t result;

  result = qword_25777D8F0;
  if (!qword_25777D8F0)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBTrainingScriptItem.CodingKeys, &type metadata for TTSVBTrainingScriptItem.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25777D8F0);
  }
  return result;
}

unint64_t sub_24879175C()
{
  unint64_t result;

  result = qword_25777D8F8;
  if (!qword_25777D8F8)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBTrainingScriptItem, &type metadata for TTSVBTrainingScriptItem);
    atomic_store(result, (unint64_t *)&qword_25777D8F8);
  }
  return result;
}

unint64_t sub_2487917A4()
{
  unint64_t result;

  result = qword_25777D900;
  if (!qword_25777D900)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBTrainingBook.TTSVBTrainingParagraph, &type metadata for TTSVBTrainingBook.TTSVBTrainingParagraph);
    atomic_store(result, (unint64_t *)&qword_25777D900);
  }
  return result;
}

unint64_t sub_2487917EC()
{
  unint64_t result;

  result = qword_25777D908;
  if (!qword_25777D908)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBTrainingBook, &type metadata for TTSVBTrainingBook);
    atomic_store(result, (unint64_t *)&qword_25777D908);
  }
  return result;
}

uint64_t destroy for TTSVBTrainingScriptItem()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TTSVBTrainingScriptItem(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  v7 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v7;
  v8 = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 96) = v8;
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TTSVBTrainingScriptItem(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  a1[7] = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[8] = a2[8];
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[10] = a2[10];
  a1[11] = a2[11];
  a1[12] = a2[12];
  a1[13] = a2[13];
  a1[14] = a2[14];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy120_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __n128 result;
  __int128 v6;
  __int128 v7;

  v2 = *a2;
  v3 = a2[1];
  v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  result = (__n128)a2[4];
  v6 = a2[5];
  v7 = a2[6];
  *(_QWORD *)(a1 + 112) = *((_QWORD *)a2 + 14);
  *(_OWORD *)(a1 + 80) = v6;
  *(_OWORD *)(a1 + 96) = v7;
  *(__n128 *)(a1 + 64) = result;
  return result;
}

uint64_t assignWithTake for TTSVBTrainingScriptItem(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v8;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  v9 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v9;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBTrainingScriptItem(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 120))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TTSVBTrainingScriptItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 120) = 1;
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
    *(_BYTE *)(result + 120) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSVBTrainingScriptItem()
{
  return &type metadata for TTSVBTrainingScriptItem;
}

uint64_t getEnumTagSinglePayload for TTSVBTrainingScriptItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF8)
    goto LABEL_17;
  if (a2 + 8 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 8) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 8;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 8;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 8;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 9;
  v8 = v6 - 9;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TTSVBTrainingScriptItem.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 8 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 8) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF8)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF7)
    return ((uint64_t (*)(void))((char *)&loc_248791C60 + 4 * byte_2487C0172[v4]))();
  *a1 = a2 + 8;
  return ((uint64_t (*)(void))((char *)sub_248791C94 + 4 * byte_2487C016D[v4]))();
}

uint64_t sub_248791C94(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_248791C9C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x248791CA4);
  return result;
}

uint64_t sub_248791CB0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x248791CB8);
  *(_BYTE *)result = a2 + 8;
  return result;
}

uint64_t sub_248791CBC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248791CC4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TTSVBTrainingScriptItem.CodingKeys()
{
  return &type metadata for TTSVBTrainingScriptItem.CodingKeys;
}

ValueMetadata *type metadata accessor for TTSVBTrainingScript()
{
  return &type metadata for TTSVBTrainingScript;
}

uint64_t destroy for TTSVBTrainingBook()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s31TextToSpeechVoiceBankingSupport17TTSVBTrainingBookVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TTSVBTrainingBook(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
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

uint64_t assignWithTake for TTSVBTrainingBook(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBTrainingBook(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TTSVBTrainingBook(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TTSVBTrainingBook()
{
  return &type metadata for TTSVBTrainingBook;
}

ValueMetadata *type metadata accessor for TTSVBTrainingBook.TTSVBTrainingParagraph()
{
  return &type metadata for TTSVBTrainingBook.TTSVBTrainingParagraph;
}

uint64_t sub_248791EBC(uint64_t a1, uint64_t a2)
{
  return assignWithTake for TTSVBTrainingScriptItem(a2, a1);
}

uint64_t sub_248791ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777D938);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_248791F14(uint64_t a1)
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_248791F88()
{
  sub_248791FEC();
  return sub_2487B4E14();
}

unint64_t sub_248791FEC()
{
  unint64_t result;

  result = qword_25777D948;
  if (!qword_25777D948)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBTrainingScriptItem, &type metadata for TTSVBTrainingScriptItem);
    atomic_store(result, (unint64_t *)&qword_25777D948);
  }
  return result;
}

uint64_t TTSVBVoiceSampleTrainingValidity.rawValue.getter()
{
  unsigned int *v0;

  return *v0;
}

uint64_t TTSVBVoiceSampleTrainingValidity.init(rawValue:)@<X0>(uint64_t result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void static TTSVBVoiceSampleTrainingValidity.valid.getter(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

void *sub_24879204C()
{
  return &unk_2487C0664;
}

void static TTSVBVoiceSampleTrainingValidity.invalidASRUserEditScore.getter(_DWORD *a1@<X8>)
{
  *a1 = 1;
}

void *sub_248792064()
{
  return &unk_2487C0668;
}

void static TTSVBVoiceSampleTrainingValidity.invalidSNR.getter(_DWORD *a1@<X8>)
{
  *a1 = 2;
}

void *sub_24879207C()
{
  return &unk_2487C066C;
}

void static TTSVBVoiceSampleTrainingValidity.invalidSPL.getter(_DWORD *a1@<X8>)
{
  *a1 = 4;
}

_QWORD *static TTSVBVoiceSampleTrainingValidity.evaluate(userScore:spl:splThreshold:snr:snrThreshold:)@<X0>(_QWORD *result@<X0>, _DWORD *a2@<X8>, float a3@<S0>, float a4@<S1>, float a5@<S2>, float a6@<S3>)
{
  int v10;
  int v12;

  LOWORD(v10) = (_WORD)result;
  if (((unsigned __int16)result & 0x8000) != 0 && (v10 = -(__int16)result, (__int16)result + (__int16)-(__int16)result))
  {
    __break(1u);
  }
  else
  {
    result = sub_248728F24();
    v12 = *result < (__int16)v10;
    if (a4 < a3)
      v12 |= 4u;
    if (a5 < a6)
      v12 |= 2u;
    *a2 = v12;
  }
  return result;
}

BOOL TTSVBVoiceSampleTrainingValidity.isValid.getter()
{
  _DWORD *v0;

  return *v0 == 0;
}

unint64_t TTSVBVoiceSampleTrainingValidity.stringValue.getter()
{
  int *v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v11;

  v1 = *v0;
  if (*v0)
  {
    v2 = MEMORY[0x24BEE4AF8];
    if ((v1 & 2) != 0)
    {
      v11 = MEMORY[0x24BEE4AF8];
      sub_248792784(0, 1, 1);
      v2 = v11;
      v5 = *(_QWORD *)(v11 + 16);
      v4 = *(_QWORD *)(v11 + 24);
      if (v5 >= v4 >> 1)
      {
        sub_248792784((char *)(v4 > 1), v5 + 1, 1);
        v2 = v11;
      }
      *(_QWORD *)(v2 + 16) = v5 + 1;
      *(_DWORD *)(v2 + 4 * v5 + 32) = 2;
      if ((v1 & 4) == 0)
      {
LABEL_4:
        if ((v1 & 1) == 0)
        {
LABEL_20:
          sub_2487923A0(v2);
          swift_release();
          __swift_instantiateConcreteTypeFromMangledName(&qword_25445F138);
          sub_24872A050();
          v3 = sub_2487B5498();
          swift_bridgeObjectRelease();
          return v3;
        }
LABEL_15:
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          sub_248792784(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v9 = *(_QWORD *)(v2 + 16);
        v8 = *(_QWORD *)(v2 + 24);
        if (v9 >= v8 >> 1)
          sub_248792784((char *)(v8 > 1), v9 + 1, 1);
        *(_QWORD *)(v2 + 16) = v9 + 1;
        *(_DWORD *)(v2 + 4 * v9 + 32) = 1;
        goto LABEL_20;
      }
    }
    else if ((v1 & 4) == 0)
    {
      goto LABEL_4;
    }
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      sub_248792784(0, *(_QWORD *)(v2 + 16) + 1, 1);
    v7 = *(_QWORD *)(v2 + 16);
    v6 = *(_QWORD *)(v2 + 24);
    if (v7 >= v6 >> 1)
      sub_248792784((char *)(v6 > 1), v7 + 1, 1);
    *(_QWORD *)(v2 + 16) = v7 + 1;
    *(_DWORD *)(v2 + 4 * v7 + 32) = 4;
    if ((v1 & 1) == 0)
      goto LABEL_20;
    goto LABEL_15;
  }
  return 0xD000000000000012;
}

unint64_t TTSVBVoiceSampleTrainingValidity.debugDescription.getter()
{
  int *v0;
  unint64_t v1;
  int v2;
  unint64_t v3;

  v1 = 0xD000000000000014;
  v2 = *v0;
  if ((*v0 & 4) != 0)
    v3 = 0xD000000000000015;
  else
    v3 = 0;
  if ((v2 & 2) == 0)
    v1 = v3;
  if ((v2 & 1) != 0)
    return 0xD000000000000022;
  else
    return v1;
}

uint64_t sub_2487923A0(uint64_t a1)
{
  int64_t v2;
  uint64_t result;
  int *v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  int v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v19 = MEMORY[0x24BEE4AF8];
    sub_24872A4C0(0, v2, 0);
    result = v19;
    v4 = (int *)(a1 + 32);
    v5 = 0x80000002487C75A0;
    v6 = 0x80000002487C7580;
    do
    {
      v8 = *v4++;
      v7 = v8;
      v9 = (v8 & 4) == 0;
      if ((v8 & 4) != 0)
        v10 = 0xD000000000000015;
      else
        v10 = 0;
      if (v9)
        v11 = 0xE000000000000000;
      else
        v11 = 0x80000002487C7560;
      if ((v7 & 2) != 0)
      {
        v10 = 0xD000000000000014;
        v11 = v6;
      }
      if ((v7 & 1) != 0)
        v12 = 0xD000000000000022;
      else
        v12 = v10;
      if ((v7 & 1) != 0)
        v13 = v5;
      else
        v13 = v11;
      v20 = result;
      v15 = *(_QWORD *)(result + 16);
      v14 = *(_QWORD *)(result + 24);
      if (v15 >= v14 >> 1)
      {
        v17 = v6;
        v18 = v5;
        sub_24872A4C0((char *)(v14 > 1), v15 + 1, 1);
        v6 = v17;
        v5 = v18;
        result = v20;
      }
      *(_QWORD *)(result + 16) = v15 + 1;
      v16 = result + 16 * v15;
      *(_QWORD *)(v16 + 32) = v12;
      *(_QWORD *)(v16 + 40) = v13;
      --v2;
    }
    while (v2);
  }
  return result;
}

uint64_t TTSVBVoiceSampleTrainingValidity.localizedValidTitle.getter()
{
  _DWORD *v0;
  uint64_t v1;
  void *v2;
  id v3;

  if ((*v0 & 1) == 0 && (*v0 & 4) == 0)
    return 0;
  v2 = (void *)sub_2487B5504();
  v3 = TTSVBSupportLocString(v2);

  v1 = sub_2487B5528();
  return v1;
}

uint64_t TTSVBVoiceSampleTrainingValidity.localizedInvalidTitle.getter()
{
  int *v0;
  int v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *v0;
  if ((*v0 & 1) == 0 && (v1 & 2) == 0 && (v1 & 4) == 0)
    return 0;
  v3 = (void *)sub_2487B5504();
  v4 = TTSVBSupportLocString(v3);

  v2 = sub_2487B5528();
  return v2;
}

uint64_t TTSVBVoiceSampleTrainingValidity.localizedValidDescription.getter()
{
  int *v0;
  int v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *v0;
  if ((*v0 & 1) == 0 && (v1 & 2) == 0 && (v1 & 4) == 0)
    return 0;
  v3 = (void *)sub_2487B5504();
  v4 = TTSVBSupportLocString(v3);

  v2 = sub_2487B5528();
  return v2;
}

uint64_t TTSVBVoiceSampleTrainingValidity.localizedInvalidDescription.getter()
{
  int *v0;
  int v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *v0;
  if ((*v0 & 1) == 0 && (v1 & 2) == 0 && (v1 & 4) == 0)
    return 0;
  v3 = (void *)sub_2487B5504();
  v4 = TTSVBSupportLocString(v3);

  v2 = sub_2487B5528();
  return v2;
}

char *sub_248792784(char *a1, int64_t a2, char a3)
{
  char **v3;
  char *result;

  result = sub_24879288C(a1, a2, a3, *v3);
  *v3 = result;
  return result;
}

unint64_t sub_2487927A4()
{
  unint64_t result;

  result = qword_25777D950;
  if (!qword_25777D950)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBVoiceSampleTrainingValidity, &type metadata for TTSVBVoiceSampleTrainingValidity);
    atomic_store(result, (unint64_t *)&qword_25777D950);
  }
  return result;
}

unint64_t sub_2487927F0()
{
  unint64_t result;

  result = qword_25777D958;
  if (!qword_25777D958)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBVoiceSampleTrainingValidity, &type metadata for TTSVBVoiceSampleTrainingValidity);
    atomic_store(result, (unint64_t *)&qword_25777D958);
  }
  return result;
}

unint64_t sub_248792838()
{
  unint64_t result;

  result = qword_25777D960;
  if (!qword_25777D960)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBVoiceSampleTrainingValidity, &type metadata for TTSVBVoiceSampleTrainingValidity);
    atomic_store(result, (unint64_t *)&qword_25777D960);
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSVBVoiceSampleTrainingValidity()
{
  return &type metadata for TTSVBVoiceSampleTrainingValidity;
}

char *sub_24879288C(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25777D968);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

id *static String.tccService_voicebanking.getter()
{
  return sub_2487929B4(MEMORY[0x24BEB3988]);
}

id *static String.tccService_liverpool.getter()
{
  return sub_2487929B4(MEMORY[0x24BEB38B0]);
}

id *static String.tccInfoKey_bundle.getter()
{
  return sub_2487929B4(MEMORY[0x24BEB3810]);
}

id *static String.tccInfoKey_granted.getter()
{
  return sub_2487929B4(MEMORY[0x24BEB3818]);
}

id *sub_2487929B4(id *result)
{
  id v1;
  uint64_t v2;

  if (*result)
  {
    v1 = *result;
    v2 = sub_2487B5528();

    return (id *)v2;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t TTSVBTCCInfo.localizedName.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBTCCInfo.granted.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 32);
}

uint64_t TTSVBTCCInfo.granted.setter(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 32) = result;
  return result;
}

uint64_t (*TTSVBTCCInfo.granted.modify())()
{
  return nullsub_1;
}

_QWORD *static TTSVBTCCInfo.query(service:)(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char v20;
  CFBundleRef v21;
  const __CFString *v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char v39;
  char v40;
  id v41;
  void *v42;
  _QWORD *v43;
  unint64_t v44;
  unint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  NSObject *v48;
  os_log_type_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _QWORD *v57;
  uint64_t v58;
  CFBundleRef v59;
  __int128 v60;
  __int128 v61;
  _OWORD v62[2];
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = sub_2487B533C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (void *)sub_2487B5504();
  v9 = (void *)TCCAccessCopyInformation();

  if (v9)
  {
    *(_QWORD *)&v62[0] = 0;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445F120);
    sub_2487B5678();

    v10 = *(_QWORD *)&v62[0];
    if (*(_QWORD *)&v62[0])
    {
      v11 = *(_QWORD *)(*(_QWORD *)&v62[0] + 16);
      if (v11)
      {
        v12 = 0;
        v57 = (_QWORD *)MEMORY[0x24BEE4AF8];
        v13 = (id *)MEMORY[0x24BEB3810];
        v58 = MEMORY[0x24BEE4AD8] + 8;
        v54 = v11;
        v55 = *(_QWORD *)&v62[0];
        while (1)
        {
          if (!*v13)
          {
            __break(1u);
LABEL_43:
            __break(1u);
          }
          v14 = *(_QWORD *)(v10 + 8 * v12 + 32);
          v15 = *v13;
          v16 = sub_2487B5528();
          v18 = v17;
          swift_bridgeObjectRetain();

          if (*(_QWORD *)(v14 + 16) && (v19 = sub_248709700(v16, v18), (v20 & 1) != 0))
          {
            sub_2486F0814(*(_QWORD *)(v14 + 56) + 32 * v19, (uint64_t)&v60);
          }
          else
          {
            v60 = 0u;
            v61 = 0u;
          }
          swift_bridgeObjectRelease();
          if (*((_QWORD *)&v61 + 1))
          {
            sub_24870A40C(&v60, v62);
            sub_2486F0814((uint64_t)v62, (uint64_t)&v60);
            type metadata accessor for CFBundle();
            swift_dynamicCast();
            v21 = v59;
            v22 = (id)CFBundleGetIdentifier(v59);
            if (v22)
            {
              v23 = (__CFString *)v22;
              v60 = 0uLL;
              sub_2487B551C();

              v24 = *((_QWORD *)&v60 + 1);
              if (*((_QWORD *)&v60 + 1))
              {
                v25 = v60;
                v26 = objc_allocWithZone(MEMORY[0x24BDC1540]);
                swift_bridgeObjectRetain();
                v27 = (void *)sub_2487B5504();
                swift_bridgeObjectRelease();
                *(_QWORD *)&v60 = 0;
                v28 = objc_msgSend(v26, sel_initWithBundleIdentifier_allowPlaceholder_error_, v27, 0, &v60);

                if (v28)
                {
                  v56 = v25;
                  v29 = (id)v60;
                  v30 = objc_msgSend(v28, sel_localizedName);
                  v31 = sub_2487B5528();
                  v33 = v32;

                  if (!*MEMORY[0x24BEB3818])
                    goto LABEL_43;
                  v34 = (id)*MEMORY[0x24BEB3818];
                  v35 = sub_2487B5528();
                  v37 = v36;

                  if (*(_QWORD *)(v14 + 16) && (v38 = sub_248709700(v35, v37), (v39 & 1) != 0))
                  {
                    sub_2486F0814(*(_QWORD *)(v14 + 56) + 32 * v38, (uint64_t)&v60);
                  }
                  else
                  {
                    v60 = 0u;
                    v61 = 0u;
                  }
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  if (*((_QWORD *)&v61 + 1))
                  {
                    if (swift_dynamicCast())
                    {
                      v40 = (char)v59;
                      goto LABEL_28;
                    }
                  }
                  else
                  {
                    sub_248728374((uint64_t)&v60);
                  }
                  v40 = 0;
LABEL_28:
                  if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
                    v43 = v57;
                  else
                    v43 = sub_248793400(0, v57[2] + 1, 1, v57);
                  v45 = v43[2];
                  v44 = v43[3];
                  if (v45 >= v44 >> 1)
                    v43 = sub_248793400((_QWORD *)(v44 > 1), v45 + 1, 1, v43);
                  v43[2] = v45 + 1;
                  v57 = v43;
                  v46 = &v43[5 * v45];
                  v46[4] = v31;
                  v46[5] = v33;
                  v46[6] = v56;
                  v46[7] = v24;
                  *((_BYTE *)v46 + 64) = v40;

                  __swift_destroy_boxed_opaque_existential_0((uint64_t)v62);
                  v11 = v54;
                  v10 = v55;
                }
                else
                {
                  v41 = (id)v60;
                  v42 = (void *)sub_2487B4F64();

                  swift_willThrow();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();

                  __swift_destroy_boxed_opaque_existential_0((uint64_t)v62);
                }
                v13 = (id *)MEMORY[0x24BEB3810];
                goto LABEL_6;
              }
            }

            swift_bridgeObjectRelease();
            __swift_destroy_boxed_opaque_existential_0((uint64_t)v62);
          }
          else
          {
            swift_bridgeObjectRelease();
            sub_248728374((uint64_t)&v60);
          }
LABEL_6:
          if (v11 == ++v12)
          {
            swift_bridgeObjectRelease();
            return v57;
          }
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v47 = sub_2487B0B90();
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v47, v4);
    swift_bridgeObjectRetain_n();
    v48 = sub_2487B5324();
    v49 = sub_2487B57D4();
    if (os_log_type_enabled(v48, v49))
    {
      v50 = (uint8_t *)swift_slowAlloc();
      v51 = swift_slowAlloc();
      *(_QWORD *)&v62[0] = v51;
      *(_DWORD *)v50 = 136315138;
      v58 = (uint64_t)(v50 + 4);
      swift_bridgeObjectRetain();
      *(_QWORD *)&v60 = sub_2486EDE5C(a1, a2, (uint64_t *)v62);
      sub_2487B593C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2486E6000, v48, v49, "No TCC service for %s", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959AF80](v51, -1, -1);
      MEMORY[0x24959AF80](v50, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return (_QWORD *)MEMORY[0x24BEE4AF8];
}

uint64_t TTSVBTCCInfo.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

Swift::Void __swiftcall TTSVBTCCInfo.updateStatus(_:)(Swift::Bool a1)
{
  uint64_t v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (*MEMORY[0x24BEB3988])
  {
    v3 = (id)*MEMORY[0x24BEB3988];
    sub_2487B5528();

    v4 = (void *)sub_2487B5504();
    swift_bridgeObjectRelease();
    v5 = *(_QWORD *)(v1 + 16);
    v6 = *(_QWORD *)(v1 + 24);
    v7 = (void *)sub_2487B5504();
    TCCAccessSetForBundleId();

    *(_QWORD *)(v1 + 16) = v5;
    *(_QWORD *)(v1 + 24) = v6;
    *(_BYTE *)(v1 + 32) = a1;
  }
  else
  {
    __break(1u);
  }
}

uint64_t TTSVBTCCInfo.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  return sub_2487B5D74();
}

uint64_t TTSVBTCCInfo.hashValue.getter()
{
  sub_2487B5D5C();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  sub_2487B5D74();
  return sub_2487B5D98();
}

uint64_t sub_248793238()
{
  sub_2487B5D5C();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  sub_2487B5D74();
  return sub_2487B5D98();
}

uint64_t sub_2487932D4()
{
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  return sub_2487B5D74();
}

uint64_t sub_248793358()
{
  sub_2487B5D5C();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  sub_2487B5D74();
  return sub_2487B5D98();
}

uint64_t sub_2487933F0@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 24);
  *a1 = *(_QWORD *)(v1 + 16);
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

_QWORD *sub_248793400(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25777D980);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_248793570(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

void type metadata accessor for CFBundle()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_25777D978)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_25777D978);
  }
}

uint64_t sub_248793570(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2487B5B94();
  __break(1u);
  return result;
}

uint64_t _s31TextToSpeechVoiceBankingSupport12TTSVBTCCInfoV2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  BOOL v8;
  char v9;
  uint64_t result;
  char v12;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(unsigned __int8 *)(a1 + 32);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_QWORD *)(a2 + 24);
  v7 = *(unsigned __int8 *)(a2 + 32);
  v8 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v8 || (v9 = sub_2487B5CE4(), result = 0, (v9 & 1) != 0))
  {
    if (v2 == v5 && v3 == v6)
      return v4 ^ v7 ^ 1u;
    v12 = sub_2487B5CE4();
    result = 0;
    if ((v12 & 1) != 0)
      return v4 ^ v7 ^ 1u;
  }
  return result;
}

unint64_t sub_24879370C()
{
  unint64_t result;

  result = qword_25777D970;
  if (!qword_25777D970)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBTCCInfo, &type metadata for TTSVBTCCInfo);
    atomic_store(result, (unint64_t *)&qword_25777D970);
  }
  return result;
}

uint64_t destroy for TTSVBTCCInfo()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for TTSVBTCCInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for TTSVBTCCInfo(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

__n128 __swift_memcpy33_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for TTSVBTCCInfo(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBTCCInfo(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 33))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TTSVBTCCInfo(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 33) = 1;
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
    *(_BYTE *)(result + 33) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSVBTCCInfo()
{
  return &type metadata for TTSVBTCCInfo;
}

uint64_t TTSVBVoiceSample.url.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for TTSVBVoiceSample();
  return sub_2486F4E74(v1 + *(int *)(v3 + 20), a1, &qword_25445ED28);
}

uint64_t type metadata accessor for TTSVBVoiceSample()
{
  uint64_t result;

  result = qword_25778F520;
  if (!qword_25778F520)
    return swift_getSingletonMetadata();
  return result;
}

double TTSVBVoiceSample.recordingDuration.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 24));
}

uint64_t TTSVBVoiceSample.phonemes.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 28));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.phrase.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.transcript.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 36));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.bookTitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 40));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.paragraphIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 44));
}

uint64_t TTSVBVoiceSample.sentenceIndex.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 48));
}

double TTSVBVoiceSample.estimatedDuration.getter()
{
  uint64_t v0;

  return *(double *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 52));
}

uint64_t TTSVBVoiceSample.locale.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 56));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.recordingDate.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = type metadata accessor for TTSVBVoiceSample();
  return sub_2486F4E74(v1 + *(int *)(v3 + 60), a1, &qword_25445ED38);
}

uint64_t TTSVBVoiceSample.userPhrase.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 64));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.userScore.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 68));
}

float TTSVBVoiceSample.spl.getter()
{
  uint64_t v0;

  return *(float *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 72));
}

float TTSVBVoiceSample.snr.getter()
{
  uint64_t v0;

  return *(float *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 76));
}

float TTSVBVoiceSample.splThreshold.getter()
{
  uint64_t v0;

  return *(float *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 80));
}

float TTSVBVoiceSample.snrThreshold.getter()
{
  uint64_t v0;

  return *(float *)(v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 84));
}

uint64_t TTSVBVoiceSample.flags.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = type metadata accessor for TTSVBVoiceSample();
  *a1 = *(_DWORD *)(v1 + *(int *)(result + 88));
  return result;
}

uint64_t TTSVBVoiceSample.hasVoiceRecording.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unsigned __int8 v9;
  _QWORD v11[2];

  v1 = sub_2487B50CC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0 + *(int *)(type metadata accessor for TTSVBVoiceSample() + 20);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486F4E74(v5, (uint64_t)v8, &qword_25445ED28);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v8, 1, v1) == 1)
  {
    sub_2486F5008((uint64_t)v8, &qword_25445ED28);
    v9 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 32))(v4, v8, v1);
    v11[1] = *sub_24876D91C();
    v9 = _TTSVBFileManager.fileExists(_:)();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  return v9 & 1;
}

uint64_t TTSVBVoiceSample.trainingValidity.getter@<X0>(_DWORD *a1@<X8>)
{
  uint64_t v1;
  int *v3;
  uint64_t result;

  v3 = (int *)type metadata accessor for TTSVBVoiceSample();
  result = *(_QWORD *)(v1 + v3[17]);
  if (result < -32768)
  {
    __break(1u);
  }
  else if (result < 0x8000)
  {
    return (uint64_t)static TTSVBVoiceSampleTrainingValidity.evaluate(userScore:spl:splThreshold:snr:snrThreshold:)((_QWORD *)result, a1, *(float *)(v1 + v3[18]), *(float *)(v1 + v3[20]), *(float *)(v1 + v3[19]), *(float *)(v1 + v3[21]));
  }
  __break(1u);
  return result;
}

uint64_t TTSVBVoiceSample.init(sampleID:url:recordingDuration:phonemes:phrase:transcript:bookTitle:paragraphIndex:sentenceIndex:estimatedDuration:locale:recordingDate:userPhrase:userScore:spl:snr:splThreshold:snrThreshold:flags:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, _QWORD *a9@<X8>, double a10@<D0>, double a11@<D1>, float a12@<S2>, float a13@<S3>, float a14@<S4>, float a15@<S5>, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,int *a27)
{
  int *v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  uint64_t result;
  _QWORD *v44;
  int v48;

  v48 = *a27;
  *a9 = a1;
  a9[1] = a2;
  v37 = (int *)type metadata accessor for TTSVBVoiceSample();
  sub_2486F4F70(a3, (uint64_t)a9 + v37[5], &qword_25445ED28);
  *(double *)((char *)a9 + v37[6]) = a10;
  v38 = (_QWORD *)((char *)a9 + v37[7]);
  *v38 = a4;
  v38[1] = a5;
  v39 = (_QWORD *)((char *)a9 + v37[8]);
  *v39 = a6;
  v39[1] = a7;
  v40 = (_QWORD *)((char *)a9 + v37[9]);
  *v40 = a8;
  v40[1] = a16;
  v41 = (_QWORD *)((char *)a9 + v37[10]);
  *v41 = a17;
  v41[1] = a18;
  *(_QWORD *)((char *)a9 + v37[11]) = a19;
  *(_QWORD *)((char *)a9 + v37[12]) = a20;
  *(double *)((char *)a9 + v37[13]) = a11;
  v42 = (_QWORD *)((char *)a9 + v37[14]);
  *v42 = a21;
  v42[1] = a22;
  result = sub_2486F4F70(a23, (uint64_t)a9 + v37[15], &qword_25445ED38);
  v44 = (_QWORD *)((char *)a9 + v37[16]);
  *v44 = a24;
  v44[1] = a25;
  *(_QWORD *)((char *)a9 + v37[17]) = a26;
  *(float *)((char *)a9 + v37[18]) = a12;
  *(float *)((char *)a9 + v37[19]) = a13;
  *(float *)((char *)a9 + v37[20]) = a14;
  *(float *)((char *)a9 + v37[21]) = a15;
  *(_DWORD *)((char *)a9 + v37[22]) = v48;
  return result;
}

uint64_t TTSVBVoiceSample.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoiceSample.description.getter()
{
  swift_bridgeObjectRetain();
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  return 0x4449656C706D6153;
}

uint64_t TTSVBVoiceSample.hash(into:)()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  char *v22;
  _DWORD v24[4];

  v1 = v0;
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  v2 = (int *)type metadata accessor for TTSVBVoiceSample();
  v3 = v0 + v2[5];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486F4E74(v3, (uint64_t)v6, &qword_25445ED28);
  v7 = sub_2487B50CC();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7);
  if ((_DWORD)v9 == 1)
  {
    sub_2487B5D74();
  }
  else
  {
    v10 = MEMORY[0x24BDAC7A8](v9);
    v12 = (char *)v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t, double))(v8 + 32))(v12, v6, v7, v10);
    sub_2487B5D74();
    sub_2486F4CA0(&qword_25777C460, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAB8], MEMORY[0x24BDCDAE8]);
    sub_2487B5480();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v12, v7);
  }
  sub_2487B5D8C();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  sub_2487B5D68();
  sub_2487B5D68();
  sub_2487B5D8C();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  v13 = v1 + v2[15];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2486F4E74(v13, (uint64_t)v16, &qword_25445ED38);
  v17 = sub_2487B51D4();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17);
  if ((_DWORD)v19 == 1)
  {
    sub_2487B5D74();
  }
  else
  {
    v20 = MEMORY[0x24BDAC7A8](v19);
    v22 = (char *)v24 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t, double))(v18 + 32))(v22, v16, v17, v20);
    sub_2487B5D74();
    sub_2486F4CA0(&qword_25777CA80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], MEMORY[0x24BDCE938]);
    sub_2487B5480();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v22, v17);
  }
  if (*(_QWORD *)(v1 + v2[16] + 8))
  {
    sub_2487B5D74();
    swift_bridgeObjectRetain();
    sub_2487B557C();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_2487B5D74();
  }
  sub_2487B5D68();
  sub_2487B5D80();
  sub_2487B5D80();
  sub_2487B5D80();
  sub_2487B5D80();
  v24[3] = *(_DWORD *)(v1 + v2[22]);
  sub_248795A24();
  return sub_2487B5480();
}

uint64_t sub_248794568(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_24879459C + 4 * aK[a1]))(0x4449656C706D6173, 0xE800000000000000);
}

uint64_t sub_24879459C()
{
  return 7107189;
}

unint64_t sub_2487945B0()
{
  return 0xD000000000000011;
}

uint64_t sub_24879467C()
{
  return 0x656C61636F6CLL;
}

uint64_t sub_248794690()
{
  return 0x6E6964726F636572;
}

uint64_t sub_2487946B4()
{
  return 0x6172685072657375;
}

uint64_t sub_2487946EC()
{
  return 7106675;
}

uint64_t sub_2487946FC()
{
  return 7499379;
}

uint64_t sub_24879470C()
{
  return 0x73657268546C7073;
}

uint64_t sub_248794738()
{
  return 0x7367616C66;
}

uint64_t sub_24879474C()
{
  unsigned __int8 *v0;

  return sub_248794568(*v0);
}

uint64_t sub_248794754@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_24879784C(a1, a2);
  *a3 = result;
  return result;
}

void sub_248794778(_BYTE *a1@<X8>)
{
  *a1 = 19;
}

uint64_t sub_248794784()
{
  sub_2487963A0();
  return sub_2487B5DBC();
}

uint64_t sub_2487947AC()
{
  sub_2487963A0();
  return sub_2487B5DC8();
}

uint64_t TTSVBVoiceSample.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE v11[12];
  int v12;

  v3 = v1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777D990);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2487963A0();
  sub_2487B5DB0();
  LOBYTE(v12) = 0;
  sub_2487B5C6C();
  if (!v2)
  {
    v9 = type metadata accessor for TTSVBVoiceSample();
    LOBYTE(v12) = 1;
    sub_2487B50CC();
    sub_2486F4CA0(&qword_25777C660, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAB8], MEMORY[0x24BDCDAD8]);
    sub_2487B5C60();
    LOBYTE(v12) = 2;
    sub_2487B5C84();
    LOBYTE(v12) = 3;
    sub_2487B5C6C();
    LOBYTE(v12) = 4;
    sub_2487B5C6C();
    LOBYTE(v12) = 5;
    sub_2487B5C6C();
    LOBYTE(v12) = 6;
    sub_2487B5C6C();
    LOBYTE(v12) = 7;
    sub_2487B5C9C();
    LOBYTE(v12) = 8;
    sub_2487B5C9C();
    LOBYTE(v12) = 9;
    sub_2487B5C84();
    LOBYTE(v12) = 10;
    sub_2487B5C6C();
    LOBYTE(v12) = 11;
    sub_2487B51D4();
    sub_2486F4CA0(&qword_25777CAA8, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], MEMORY[0x24BDCE928]);
    sub_2487B5C60();
    LOBYTE(v12) = 12;
    sub_2487B5C54();
    LOBYTE(v12) = 13;
    sub_2487B5C9C();
    LOBYTE(v12) = 14;
    sub_2487B5C90();
    LOBYTE(v12) = 15;
    sub_2487B5C90();
    LOBYTE(v12) = 16;
    sub_2487B5C90();
    LOBYTE(v12) = 17;
    sub_2487B5C90();
    v12 = *(_DWORD *)(v3 + *(int *)(v9 + 88));
    v11[11] = 18;
    sub_2487963E4();
    sub_2487B5CA8();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t TTSVBVoiceSample.hashValue.getter()
{
  sub_2487B5D5C();
  TTSVBVoiceSample.hash(into:)();
  return sub_2487B5D98();
}

uint64_t TTSVBVoiceSample.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  int *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  int v40;
  int v41;
  int v42;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  char v48;
  int v49;

  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777D9A0);
  v5 = *(_QWORD *)(v46 - 8);
  MEMORY[0x24BDAC7A8](v46);
  v7 = (char *)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (int *)type metadata accessor for TTSVBVoiceSample();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = a1[3];
  v47 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v11);
  sub_2487963A0();
  sub_2487B5DA4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
  v44 = a2;
  v45 = v5;
  LOBYTE(v49) = 0;
  *v10 = sub_2487B5BE8();
  v10[1] = v12;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v44 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487B50CC();
  LOBYTE(v49) = 1;
  sub_2486F4CA0(&qword_25777C860, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAB8], MEMORY[0x24BDCDB08]);
  sub_2487B5BDC();
  sub_2486F4F70((uint64_t)v15, (uint64_t)v10 + v8[5], &qword_25445ED28);
  LOBYTE(v49) = 2;
  sub_2487B5C00();
  *(uint64_t *)((char *)v10 + v8[6]) = v16;
  LOBYTE(v49) = 3;
  v17 = sub_2487B5BE8();
  v18 = (uint64_t *)((char *)v10 + v8[7]);
  *v18 = v17;
  v18[1] = v19;
  LOBYTE(v49) = 4;
  v20 = sub_2487B5BE8();
  v21 = (uint64_t *)((char *)v10 + v8[8]);
  *v21 = v20;
  v21[1] = v22;
  LOBYTE(v49) = 5;
  v23 = sub_2487B5BE8();
  v24 = (uint64_t *)((char *)v10 + v8[9]);
  *v24 = v23;
  v24[1] = v25;
  LOBYTE(v49) = 6;
  v26 = sub_2487B5BE8();
  v27 = (uint64_t *)((char *)v10 + v8[10]);
  *v27 = v26;
  v27[1] = v28;
  LOBYTE(v49) = 7;
  *(uint64_t *)((char *)v10 + v8[11]) = sub_2487B5C18();
  LOBYTE(v49) = 8;
  *(uint64_t *)((char *)v10 + v8[12]) = sub_2487B5C18();
  LOBYTE(v49) = 9;
  sub_2487B5C00();
  *(uint64_t *)((char *)v10 + v8[13]) = v29;
  LOBYTE(v49) = 10;
  v30 = sub_2487B5BE8();
  v31 = (uint64_t *)((char *)v10 + v8[14]);
  *v31 = v30;
  v31[1] = v32;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
  MEMORY[0x24BDAC7A8](v33);
  v35 = (char *)&v44 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487B51D4();
  LOBYTE(v49) = 11;
  sub_2486F4CA0(&qword_25777CA48, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], MEMORY[0x24BDCE968]);
  sub_2487B5BDC();
  sub_2486F4F70((uint64_t)v35, (uint64_t)v10 + v8[15], &qword_25445ED38);
  LOBYTE(v49) = 12;
  v36 = sub_2487B5BD0();
  v37 = (uint64_t *)((char *)v10 + v8[16]);
  *v37 = v36;
  v37[1] = v38;
  LOBYTE(v49) = 13;
  *(uint64_t *)((char *)v10 + v8[17]) = sub_2487B5C18();
  LOBYTE(v49) = 14;
  sub_2487B5C0C();
  *(_DWORD *)((char *)v10 + v8[18]) = v39;
  LOBYTE(v49) = 15;
  sub_2487B5C0C();
  *(_DWORD *)((char *)v10 + v8[19]) = v40;
  LOBYTE(v49) = 16;
  sub_2487B5C0C();
  *(_DWORD *)((char *)v10 + v8[20]) = v41;
  LOBYTE(v49) = 17;
  sub_2487B5C0C();
  *(_DWORD *)((char *)v10 + v8[21]) = v42;
  v48 = 18;
  sub_248796428();
  sub_2487B5C24();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v7, v46);
  *(_DWORD *)((char *)v10 + v8[22]) = v49;
  sub_24879646C((uint64_t)v10, v44);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v47);
  return sub_2487964B0((uint64_t)v10);
}

uint64_t sub_248795534@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TTSVBVoiceSample.init(from:)(a1, a2);
}

uint64_t sub_248795548(_QWORD *a1)
{
  return TTSVBVoiceSample.encode(to:)(a1);
}

uint64_t sub_24879555C()
{
  sub_2487B5D5C();
  TTSVBVoiceSample.hash(into:)();
  return sub_2487B5D98();
}

uint64_t sub_24879559C()
{
  sub_2487B5D5C();
  TTSVBVoiceSample.hash(into:)();
  return sub_2487B5D98();
}

BOOL sub_2487955DC(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v4 = (int *)type metadata accessor for TTSVBVoiceSample();
  v5 = v4[10];
  v6 = *(_QWORD *)((char *)a2 + v5);
  v7 = *(_QWORD *)((char *)a2 + v5 + 8);
  v8 = (_QWORD *)((char *)a1 + v5);
  v9 = v6 == *v8 && v7 == v8[1];
  if (!v9 && (sub_2487B5CE4() & 1) == 0)
    goto LABEL_14;
  v10 = v4[11];
  v11 = *(_QWORD *)((char *)a2 + v10);
  v12 = *(_QWORD *)((char *)a1 + v10);
  v13 = v11 < v12;
  if (v11 == v12)
  {
    v14 = v4[12];
    v15 = *(_QWORD *)((char *)a2 + v14);
    v16 = *(_QWORD *)((char *)a1 + v14);
    v13 = v15 < v16;
    if (v15 == v16)
    {
      if (*a2 == *a1 && a2[1] == a1[1])
      {
        v17 = 0;
        return (v17 & 1) == 0;
      }
LABEL_14:
      v17 = sub_2487B5CE4();
      return (v17 & 1) == 0;
    }
  }
  v17 = v13;
  return (v17 & 1) == 0;
}

BOOL sub_2487956D0(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v4 = (int *)type metadata accessor for TTSVBVoiceSample();
  v5 = v4[10];
  v6 = *(_QWORD *)((char *)a1 + v5);
  v7 = *(_QWORD *)((char *)a1 + v5 + 8);
  v8 = (_QWORD *)((char *)a2 + v5);
  v9 = v6 == *v8 && v7 == v8[1];
  if (!v9 && (sub_2487B5CE4() & 1) == 0)
    goto LABEL_14;
  v10 = v4[11];
  v11 = *(_QWORD *)((char *)a1 + v10);
  v12 = *(_QWORD *)((char *)a2 + v10);
  v13 = v11 < v12;
  if (v11 == v12)
  {
    v14 = v4[12];
    v15 = *(_QWORD *)((char *)a1 + v14);
    v16 = *(_QWORD *)((char *)a2 + v14);
    v13 = v15 < v16;
    if (v15 == v16)
    {
      if (*a1 == *a2 && a1[1] == a2[1])
      {
        v17 = 0;
        return (v17 & 1) == 0;
      }
LABEL_14:
      v17 = sub_2487B5CE4();
      return (v17 & 1) == 0;
    }
  }
  v17 = v13;
  return (v17 & 1) == 0;
}

uint64_t sub_2487957C4(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = (int *)type metadata accessor for TTSVBVoiceSample();
  v5 = v4[10];
  v6 = *(_QWORD *)((char *)a2 + v5);
  v7 = *(_QWORD *)((char *)a2 + v5 + 8);
  v8 = (_QWORD *)((char *)a1 + v5);
  v9 = v6 == *v8 && v7 == v8[1];
  if (!v9 && (sub_2487B5CE4() & 1) == 0)
    return sub_2487B5CE4();
  v10 = v4[11];
  v11 = *(_QWORD *)((char *)a2 + v10);
  v12 = *(_QWORD *)((char *)a1 + v10);
  v13 = v11 < v12;
  if (v11 == v12)
  {
    v14 = v4[12];
    v15 = *(_QWORD *)((char *)a2 + v14);
    v16 = *(_QWORD *)((char *)a1 + v14);
    v13 = v15 < v16;
    if (v15 == v16)
    {
      if (*a2 == *a1 && a2[1] == a1[1])
        return 0;
      return sub_2487B5CE4();
    }
  }
  return v13;
}

uint64_t sub_2487958BC()
{
  swift_bridgeObjectRetain();
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  return 0x4449656C706D6153;
}

uint64_t _s31TextToSpeechVoiceBankingSupport16TTSVBVoiceSampleV1loiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  int *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = (int *)type metadata accessor for TTSVBVoiceSample();
  v5 = v4[10];
  v6 = *(_QWORD *)((char *)a1 + v5);
  v7 = *(_QWORD *)((char *)a1 + v5 + 8);
  v8 = (_QWORD *)((char *)a2 + v5);
  v9 = v6 == *v8 && v7 == v8[1];
  if (!v9 && (sub_2487B5CE4() & 1) == 0)
    return sub_2487B5CE4();
  v10 = v4[11];
  v11 = *(_QWORD *)((char *)a1 + v10);
  v12 = *(_QWORD *)((char *)a2 + v10);
  v13 = v11 < v12;
  if (v11 == v12)
  {
    v14 = v4[12];
    v15 = *(_QWORD *)((char *)a1 + v14);
    v16 = *(_QWORD *)((char *)a2 + v14);
    v13 = v15 < v16;
    if (v15 == v16)
    {
      if (*a1 == *a2 && a1[1] == a2[1])
        return 0;
      return sub_2487B5CE4();
    }
  }
  return v13;
}

unint64_t sub_248795A24()
{
  unint64_t result;

  result = qword_25777D988;
  if (!qword_25777D988)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBVoiceSampleFlags, &type metadata for TTSVBVoiceSampleFlags);
    atomic_store(result, (unint64_t *)&qword_25777D988);
  }
  return result;
}

BOOL _s31TextToSpeechVoiceBankingSupport16TTSVBVoiceSampleV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  char v5;
  _BOOL8 result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(char *, uint64_t, uint64_t);
  uint64_t v24;
  char *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  char *v29;
  char v30;
  void (*v31)(char *, uint64_t);
  _QWORD *v32;
  int *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  char v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _QWORD *v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  _QWORD *v58;
  char v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t (*v74)(char *, uint64_t, uint64_t);
  uint64_t v75;
  char *v76;
  uint64_t v77;
  double v78;
  uint64_t v79;
  char *v80;
  char v81;
  void (*v82)(char *, uint64_t);
  _QWORD *v83;
  int *v84;
  uint64_t v85;
  _QWORD *v86;
  uint64_t v87;
  _QWORD *v88;
  _QWORD *v89;
  uint64_t v90;
  char v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t *v96;
  int *v97;
  _QWORD *v98;
  _QWORD *v99;
  uint64_t *v100;
  uint64_t *v101;
  int v102;
  int v103;
  int v104;
  int v105;

  if (*a1 != *a2 || a1[1] != a2[1])
  {
    v5 = sub_2487B5CE4();
    result = 0;
    if ((v5 & 1) == 0)
      return result;
  }
  v7 = type metadata accessor for TTSVBVoiceSample();
  v8 = *(int *)(v7 + 20);
  v98 = a1;
  v9 = (uint64_t)a1 + v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  v101 = &v94;
  v11 = *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (v11 + 15) & 0xFFFFFFFFFFFFFFF0;
  v13 = (char *)&v94 - v12;
  sub_2486F4E74(v9, (uint64_t)&v94 - v12, &qword_25445ED28);
  v99 = a2;
  v100 = &v94;
  v97 = (int *)v7;
  MEMORY[0x24BDAC7A8]((char *)a2 + *(int *)(v7 + 20));
  v14 = (char *)&v94 - v12;
  sub_2486F4E74(v15, (uint64_t)&v94 - v12, &qword_25445ED28);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777DA80);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v94 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = (uint64_t)&v18[*(int *)(v19 + 48)];
  sub_2486F4E74((uint64_t)&v94 - v12, (uint64_t)v18, &qword_25445ED28);
  sub_2486F4E74((uint64_t)&v94 - v12, v20, &qword_25445ED28);
  v21 = sub_2487B50CC();
  v22 = *(_QWORD *)(v21 - 8);
  v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48);
  v24 = v23(v18, 1, v21);
  if ((_DWORD)v24 == 1)
  {
    sub_2486F5008((uint64_t)&v94 - v12, &qword_25445ED28);
    sub_2486F5008((uint64_t)&v94 - v12, &qword_25445ED28);
    if (v23((char *)v20, 1, v21) == 1)
    {
      sub_2486F5008((uint64_t)v18, &qword_25445ED28);
      goto LABEL_14;
    }
LABEL_11:
    sub_2486F5008((uint64_t)v18, &qword_25777DA80);
    return 0;
  }
  v96 = &v94;
  MEMORY[0x24BDAC7A8](v24);
  v25 = (char *)&v94 - v12;
  sub_2486F4E74((uint64_t)v18, (uint64_t)&v94 - v12, &qword_25445ED28);
  v26 = v23((char *)v20, 1, v21);
  if ((_DWORD)v26 == 1)
  {
    sub_2486F5008((uint64_t)&v94 - v12, &qword_25445ED28);
    sub_2486F5008((uint64_t)&v94 - v12, &qword_25445ED28);
    (*(void (**)(char *, uint64_t))(v22 + 8))((char *)&v94 - v12, v21);
    goto LABEL_11;
  }
  v95 = &v94;
  v27 = MEMORY[0x24BDAC7A8](v26);
  v29 = (char *)&v94 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v22 + 32))(v29, v20, v21, v27);
  sub_2486F4CA0(&qword_25777DA88, (uint64_t (*)(uint64_t))MEMORY[0x24BDCDAB8], MEMORY[0x24BDCDAF8]);
  v30 = sub_2487B54D4();
  v31 = *(void (**)(char *, uint64_t))(v22 + 8);
  v31(v29, v21);
  sub_2486F5008((uint64_t)v14, &qword_25445ED28);
  sub_2486F5008((uint64_t)v13, &qword_25445ED28);
  v31(v25, v21);
  sub_2486F5008((uint64_t)v18, &qword_25445ED28);
  if ((v30 & 1) == 0)
    return 0;
LABEL_14:
  v33 = v97;
  v32 = v98;
  v34 = v99;
  if (*(double *)((char *)v98 + v97[6]) != *(double *)((char *)v99 + v97[6]))
    return 0;
  v35 = v97[7];
  v36 = *(_QWORD *)((char *)v98 + v35);
  v37 = *(_QWORD *)((char *)v98 + v35 + 8);
  v38 = (_QWORD *)((char *)v99 + v35);
  if (v36 == *v38 && v37 == v38[1] || (v39 = sub_2487B5CE4(), result = 0, (v39 & 1) != 0))
  {
    if ((v40 = v33[8],
          v41 = *(_QWORD *)((char *)v32 + v40),
          v42 = *(_QWORD *)((char *)v32 + v40 + 8),
          v43 = (_QWORD *)((char *)v34 + v40),
          v41 == *v43)
      && v42 == v43[1]
      || (v44 = sub_2487B5CE4(), result = 0, (v44 & 1) != 0))
    {
      if ((v45 = v33[9],
            v46 = *(_QWORD *)((char *)v32 + v45),
            v47 = *(_QWORD *)((char *)v32 + v45 + 8),
            v48 = (_QWORD *)((char *)v34 + v45),
            v46 == *v48)
        && v47 == v48[1]
        || (v49 = sub_2487B5CE4(), result = 0, (v49 & 1) != 0))
      {
        if ((v50 = v33[10],
              v51 = *(_QWORD *)((char *)v32 + v50),
              v52 = *(_QWORD *)((char *)v32 + v50 + 8),
              v53 = (_QWORD *)((char *)v34 + v50),
              v51 == *v53)
          && v52 == v53[1]
          || (v54 = sub_2487B5CE4(), result = 0, (v54 & 1) != 0))
        {
          if (*(_QWORD *)((char *)v32 + v33[11]) != *(_QWORD *)((char *)v34 + v33[11])
            || *(_QWORD *)((char *)v32 + v33[12]) != *(_QWORD *)((char *)v34 + v33[12])
            || *(double *)((char *)v32 + v33[13]) != *(double *)((char *)v34 + v33[13]))
          {
            return 0;
          }
          if ((v55 = v33[14],
                v56 = *(_QWORD *)((char *)v32 + v55),
                v57 = *(_QWORD *)((char *)v32 + v55 + 8),
                v58 = (_QWORD *)((char *)v34 + v55),
                v56 == *v58)
            && v57 == v58[1]
            || (v59 = sub_2487B5CE4(), result = 0, (v59 & 1) != 0))
          {
            v60 = (uint64_t)v32 + v33[15];
            v61 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
            v101 = &v94;
            v62 = *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64);
            MEMORY[0x24BDAC7A8](v61);
            v63 = (v62 + 15) & 0xFFFFFFFFFFFFFFF0;
            v64 = (char *)&v94 - v63;
            sub_2486F4E74(v60, (uint64_t)&v94 - v63, &qword_25445ED38);
            v100 = &v94;
            MEMORY[0x24BDAC7A8]((char *)v34 + v33[15]);
            v65 = (char *)&v94 - v63;
            sub_2486F4E74(v66, (uint64_t)&v94 - v63, &qword_25445ED38);
            v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777CAF8);
            MEMORY[0x24BDAC7A8](v67);
            v69 = (char *)&v94 - ((v68 + 15) & 0xFFFFFFFFFFFFFFF0);
            v71 = (uint64_t)&v69[*(int *)(v70 + 48)];
            sub_2486F4E74((uint64_t)&v94 - v63, (uint64_t)v69, &qword_25445ED38);
            sub_2486F4E74((uint64_t)&v94 - v63, v71, &qword_25445ED38);
            v72 = sub_2487B51D4();
            v73 = *(_QWORD *)(v72 - 8);
            v74 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v73 + 48);
            v75 = v74(v69, 1, v72);
            if ((_DWORD)v75 == 1)
            {
              sub_2486F5008((uint64_t)&v94 - v63, &qword_25445ED38);
              sub_2486F5008((uint64_t)&v94 - v63, &qword_25445ED38);
              if (v74((char *)v71, 1, v72) == 1)
              {
                sub_2486F5008((uint64_t)v69, &qword_25445ED38);
LABEL_40:
                v84 = v97;
                v83 = v98;
                v85 = v97[16];
                v86 = (_QWORD *)((char *)v98 + v85);
                v87 = *(_QWORD *)((char *)v98 + v85 + 8);
                v88 = v99;
                v89 = (_QWORD *)((char *)v99 + v85);
                v90 = v89[1];
                if (v87)
                {
                  if (v90)
                  {
                    if (*v86 != *v89 || v87 != v90)
                    {
                      v91 = sub_2487B5CE4();
                      result = 0;
                      if ((v91 & 1) == 0)
                        return result;
                    }
                    goto LABEL_47;
                  }
                }
                else if (!v90)
                {
LABEL_47:
                  if (*(_QWORD *)((char *)v83 + v84[17]) == *(_QWORD *)((char *)v88 + v84[17])
                    && *(float *)((char *)v83 + v84[18]) == *(float *)((char *)v88 + v84[18])
                    && *(float *)((char *)v83 + v84[19]) == *(float *)((char *)v88 + v84[19])
                    && *(float *)((char *)v83 + v84[20]) == *(float *)((char *)v88 + v84[20])
                    && *(float *)((char *)v83 + v84[21]) == *(float *)((char *)v88 + v84[21]))
                  {
                    v92 = v84[22];
                    v93 = *(_DWORD *)((char *)v83 + v92);
                    v104 = *(_DWORD *)((char *)v88 + v92);
                    v105 = v93;
                    sub_24871C3D0();
                    sub_2487B5624();
                    sub_2487B5624();
                    return v103 == v102;
                  }
                }
                return 0;
              }
            }
            else
            {
              v96 = &v94;
              MEMORY[0x24BDAC7A8](v75);
              v76 = (char *)&v94 - v63;
              sub_2486F4E74((uint64_t)v69, (uint64_t)&v94 - v63, &qword_25445ED38);
              v77 = v74((char *)v71, 1, v72);
              if ((_DWORD)v77 != 1)
              {
                v95 = &v94;
                v78 = MEMORY[0x24BDAC7A8](v77);
                v80 = (char *)&v94 - ((v79 + 15) & 0xFFFFFFFFFFFFFFF0);
                (*(void (**)(char *, uint64_t, uint64_t, double))(v73 + 32))(v80, v71, v72, v78);
                sub_2486F4CA0(&qword_25777CB08, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], MEMORY[0x24BDCE950]);
                v81 = sub_2487B54D4();
                v82 = *(void (**)(char *, uint64_t))(v73 + 8);
                v82(v80, v72);
                sub_2486F5008((uint64_t)v65, &qword_25445ED38);
                sub_2486F5008((uint64_t)v64, &qword_25445ED38);
                v82(v76, v72);
                sub_2486F5008((uint64_t)v69, &qword_25445ED38);
                if ((v81 & 1) == 0)
                  return 0;
                goto LABEL_40;
              }
              sub_2486F5008((uint64_t)&v94 - v63, &qword_25445ED38);
              sub_2486F5008((uint64_t)&v94 - v63, &qword_25445ED38);
              (*(void (**)(char *, uint64_t))(v73 + 8))((char *)&v94 - v63, v72);
            }
            sub_2486F5008((uint64_t)v69, &qword_25777CAF8);
            return 0;
          }
        }
      }
    }
  }
  return result;
}

unint64_t sub_2487963A0()
{
  unint64_t result;

  result = qword_25778F190[0];
  if (!qword_25778F190[0])
  {
    result = MEMORY[0x24959AEB4](&unk_2487C0C4C, &type metadata for TTSVBVoiceSample.CodingKeys);
    atomic_store(result, qword_25778F190);
  }
  return result;
}

unint64_t sub_2487963E4()
{
  unint64_t result;

  result = qword_25777D998;
  if (!qword_25777D998)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBVoiceSampleFlags, &type metadata for TTSVBVoiceSampleFlags);
    atomic_store(result, (unint64_t *)&qword_25777D998);
  }
  return result;
}

unint64_t sub_248796428()
{
  unint64_t result;

  result = qword_25777D9A8;
  if (!qword_25777D9A8)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBVoiceSampleFlags, &type metadata for TTSVBVoiceSampleFlags);
    atomic_store(result, (unint64_t *)&qword_25777D9A8);
  }
  return result;
}

uint64_t sub_24879646C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TTSVBVoiceSample();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2487964B0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TTSVBVoiceSample();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_2487964F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25777D9B0;
  if (!qword_25777D9B0)
  {
    v1 = type metadata accessor for TTSVBVoiceSample();
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBVoiceSample, v1);
    atomic_store(result, (unint64_t *)&qword_25777D9B0);
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for TTSVBVoiceSample(uint64_t *a1, uint64_t *a2, int *a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  _QWORD *v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unsigned int (*v50)(char *, uint64_t, uint64_t);
  uint64_t v51;
  char *__dst;

  v4 = a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2487B50CC();
    v12 = *(_QWORD *)(v11 - 8);
    v13 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48);
    swift_bridgeObjectRetain();
    if (v13(v10, 1, v11))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
    v16 = a3[7];
    *(uint64_t *)((char *)v4 + a3[6]) = *(uint64_t *)((char *)a2 + a3[6]);
    v17 = (uint64_t *)((char *)v4 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v51 = v18[1];
    *v17 = *v18;
    v17[1] = v51;
    v19 = a3[8];
    v20 = a3[9];
    v21 = (uint64_t *)((char *)v4 + v19);
    v22 = (uint64_t *)((char *)a2 + v19);
    v23 = v22[1];
    *v21 = *v22;
    v21[1] = v23;
    v24 = (uint64_t *)((char *)v4 + v20);
    v25 = (uint64_t *)((char *)a2 + v20);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    v27 = a3[10];
    v28 = a3[11];
    v29 = (uint64_t *)((char *)v4 + v27);
    v30 = (uint64_t *)((char *)a2 + v27);
    v31 = v30[1];
    *v29 = *v30;
    v29[1] = v31;
    *(uint64_t *)((char *)v4 + v28) = *(uint64_t *)((char *)a2 + v28);
    v32 = a3[13];
    *(uint64_t *)((char *)v4 + a3[12]) = *(uint64_t *)((char *)a2 + a3[12]);
    *(uint64_t *)((char *)v4 + v32) = *(uint64_t *)((char *)a2 + v32);
    v33 = a3[14];
    v34 = a3[15];
    v35 = (uint64_t *)((char *)v4 + v33);
    v36 = (uint64_t *)((char *)a2 + v33);
    v37 = v36[1];
    *v35 = *v36;
    v35[1] = v37;
    __dst = (char *)v4 + v34;
    v38 = (char *)a2 + v34;
    v39 = sub_2487B51D4();
    v40 = *(_QWORD *)(v39 - 8);
    v50 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v50(v38, 1, v39))
    {
      v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
      memcpy(__dst, v38, *(_QWORD *)(*(_QWORD *)(v41 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(__dst, v38, v39);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v40 + 56))(__dst, 0, 1, v39);
    }
    v42 = a3[16];
    v43 = a3[17];
    v44 = (uint64_t *)((char *)v4 + v42);
    v45 = (uint64_t *)((char *)a2 + v42);
    v46 = v45[1];
    *v44 = *v45;
    v44[1] = v46;
    *(uint64_t *)((char *)v4 + v43) = *(uint64_t *)((char *)a2 + v43);
    v47 = a3[19];
    *(_DWORD *)((char *)v4 + a3[18]) = *(_DWORD *)((char *)a2 + a3[18]);
    *(_DWORD *)((char *)v4 + v47) = *(_DWORD *)((char *)a2 + v47);
    v48 = a3[21];
    *(_DWORD *)((char *)v4 + a3[20]) = *(_DWORD *)((char *)a2 + a3[20]);
    *(_DWORD *)((char *)v4 + v48) = *(_DWORD *)((char *)a2 + v48);
    *(_DWORD *)((char *)v4 + a3[22]) = *(_DWORD *)((char *)a2 + a3[22]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TTSVBVoiceSample(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_2487B50CC();
  v6 = *(_QWORD *)(v5 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v7 = a1 + *(int *)(a2 + 60);
  v8 = sub_2487B51D4();
  v9 = *(_QWORD *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TTSVBVoiceSample(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unsigned int (*v48)(char *, uint64_t, uint64_t);
  uint64_t v49;
  char *__dst;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2487B50CC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  swift_bridgeObjectRetain();
  if (v12(v9, 1, v10))
  {
    v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  v14 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  v15 = (_QWORD *)((char *)a1 + v14);
  v16 = (_QWORD *)((char *)a2 + v14);
  v49 = v16[1];
  *v15 = *v16;
  v15[1] = v49;
  v17 = a3[8];
  v18 = a3[9];
  v19 = (_QWORD *)((char *)a1 + v17);
  v20 = (_QWORD *)((char *)a2 + v17);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  v22 = (_QWORD *)((char *)a1 + v18);
  v23 = (_QWORD *)((char *)a2 + v18);
  v24 = v23[1];
  *v22 = *v23;
  v22[1] = v24;
  v25 = a3[10];
  v26 = a3[11];
  v27 = (_QWORD *)((char *)a1 + v25);
  v28 = (_QWORD *)((char *)a2 + v25);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  *(_QWORD *)((char *)a1 + v26) = *(_QWORD *)((char *)a2 + v26);
  v30 = a3[13];
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  *(_QWORD *)((char *)a1 + v30) = *(_QWORD *)((char *)a2 + v30);
  v31 = a3[14];
  v32 = a3[15];
  v33 = (_QWORD *)((char *)a1 + v31);
  v34 = (_QWORD *)((char *)a2 + v31);
  v35 = v34[1];
  *v33 = *v34;
  v33[1] = v35;
  __dst = (char *)a1 + v32;
  v36 = (char *)a2 + v32;
  v37 = sub_2487B51D4();
  v38 = *(_QWORD *)(v37 - 8);
  v48 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v48(v36, 1, v37))
  {
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
    memcpy(__dst, v36, *(_QWORD *)(*(_QWORD *)(v39 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v38 + 16))(__dst, v36, v37);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v38 + 56))(__dst, 0, 1, v37);
  }
  v40 = a3[16];
  v41 = a3[17];
  v42 = (_QWORD *)((char *)a1 + v40);
  v43 = (_QWORD *)((char *)a2 + v40);
  v44 = v43[1];
  *v42 = *v43;
  v42[1] = v44;
  *(_QWORD *)((char *)a1 + v41) = *(_QWORD *)((char *)a2 + v41);
  v45 = a3[19];
  *(_DWORD *)((char *)a1 + a3[18]) = *(_DWORD *)((char *)a2 + a3[18]);
  *(_DWORD *)((char *)a1 + v45) = *(_DWORD *)((char *)a2 + v45);
  v46 = a3[21];
  *(_DWORD *)((char *)a1 + a3[20]) = *(_DWORD *)((char *)a2 + a3[20]);
  *(_DWORD *)((char *)a1 + v46) = *(_DWORD *)((char *)a2 + v46);
  *(_DWORD *)((char *)a1 + a3[22]) = *(_DWORD *)((char *)a2 + a3[22]);
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TTSVBVoiceSample(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;
  _QWORD *v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(char *, uint64_t, uint64_t);
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  _QWORD *v41;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2487B50CC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(char *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  v15 = a3[7];
  v16 = (_QWORD *)((char *)a1 + v15);
  v17 = (_QWORD *)((char *)a2 + v15);
  *v16 = *v17;
  v16[1] = v17[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v18 = a3[8];
  v19 = (_QWORD *)((char *)a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  *v19 = *v20;
  v19[1] = v20[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v21 = a3[9];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  *v22 = *v23;
  v22[1] = v23[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v24 = a3[10];
  v25 = (_QWORD *)((char *)a1 + v24);
  v26 = (_QWORD *)((char *)a2 + v24);
  *v25 = *v26;
  v25[1] = v26[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  v27 = a3[14];
  v28 = (_QWORD *)((char *)a1 + v27);
  v29 = (_QWORD *)((char *)a2 + v27);
  *v28 = *v29;
  v28[1] = v29[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v30 = a3[15];
  v31 = (char *)a1 + v30;
  v32 = (char *)a2 + v30;
  v33 = sub_2487B51D4();
  v34 = *(_QWORD *)(v33 - 8);
  v35 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v34 + 48);
  v36 = v35(v31, 1, v33);
  v37 = v35(v32, 1, v33);
  if (!v36)
  {
    if (!v37)
    {
      (*(void (**)(char *, char *, uint64_t))(v34 + 24))(v31, v32, v33);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v34 + 8))(v31, v33);
    goto LABEL_12;
  }
  if (v37)
  {
LABEL_12:
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
    memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v34 + 16))(v31, v32, v33);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
LABEL_13:
  v39 = a3[16];
  v40 = (_QWORD *)((char *)a1 + v39);
  v41 = (_QWORD *)((char *)a2 + v39);
  *v40 = *v41;
  v40[1] = v41[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)((char *)a1 + a3[17]) = *(_QWORD *)((char *)a2 + a3[17]);
  *(_DWORD *)((char *)a1 + a3[18]) = *(_DWORD *)((char *)a2 + a3[18]);
  *(_DWORD *)((char *)a1 + a3[19]) = *(_DWORD *)((char *)a2 + a3[19]);
  *(_DWORD *)((char *)a1 + a3[20]) = *(_DWORD *)((char *)a2 + a3[20]);
  *(_DWORD *)((char *)a1 + a3[21]) = *(_DWORD *)((char *)a2 + a3[21]);
  *(_DWORD *)((char *)a1 + a3[22]) = *(_DWORD *)((char *)a2 + a3[22]);
  return a1;
}

_OWORD *initializeWithTake for TTSVBVoiceSample(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2487B50CC();
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v12 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  *(_OWORD *)((char *)a1 + v12) = *(_OWORD *)((char *)a2 + v12);
  v13 = a3[9];
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  *(_OWORD *)((char *)a1 + v13) = *(_OWORD *)((char *)a2 + v13);
  v14 = a3[11];
  *(_OWORD *)((char *)a1 + a3[10]) = *(_OWORD *)((char *)a2 + a3[10]);
  *(_QWORD *)((char *)a1 + v14) = *(_QWORD *)((char *)a2 + v14);
  v15 = a3[13];
  *(_QWORD *)((char *)a1 + a3[12]) = *(_QWORD *)((char *)a2 + a3[12]);
  *(_QWORD *)((char *)a1 + v15) = *(_QWORD *)((char *)a2 + v15);
  v16 = a3[15];
  *(_OWORD *)((char *)a1 + a3[14]) = *(_OWORD *)((char *)a2 + a3[14]);
  v17 = (char *)a1 + v16;
  v18 = (char *)a2 + v16;
  v19 = sub_2487B51D4();
  v20 = *(_QWORD *)(v19 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19))
  {
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v17, v18, v19);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v20 + 56))(v17, 0, 1, v19);
  }
  v22 = a3[17];
  *(_OWORD *)((char *)a1 + a3[16]) = *(_OWORD *)((char *)a2 + a3[16]);
  *(_QWORD *)((char *)a1 + v22) = *(_QWORD *)((char *)a2 + v22);
  v23 = a3[19];
  *(_DWORD *)((char *)a1 + a3[18]) = *(_DWORD *)((char *)a2 + a3[18]);
  *(_DWORD *)((char *)a1 + v23) = *(_DWORD *)((char *)a2 + v23);
  v24 = a3[21];
  *(_DWORD *)((char *)a1 + a3[20]) = *(_DWORD *)((char *)a2 + a3[20]);
  *(_DWORD *)((char *)a1 + v24) = *(_DWORD *)((char *)a2 + v24);
  *(_DWORD *)((char *)a1 + a3[22]) = *(_DWORD *)((char *)a2 + a3[22]);
  return a1;
}

_QWORD *assignWithTake for TTSVBVoiceSample(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(char *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (*v47)(char *, uint64_t, uint64_t);
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  _QWORD *v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2487B50CC();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (v13)
  {
    if (!v14)
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v8, v9, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v14)
  {
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 40))(v8, v9, v10);
LABEL_7:
  v16 = a3[7];
  *(_QWORD *)((char *)a1 + a3[6]) = *(_QWORD *)((char *)a2 + a3[6]);
  v17 = (_QWORD *)((char *)a1 + v16);
  v18 = (_QWORD *)((char *)a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  v21 = a3[8];
  v22 = (_QWORD *)((char *)a1 + v21);
  v23 = (_QWORD *)((char *)a2 + v21);
  v25 = *v23;
  v24 = v23[1];
  *v22 = v25;
  v22[1] = v24;
  swift_bridgeObjectRelease();
  v26 = a3[9];
  v27 = (_QWORD *)((char *)a1 + v26);
  v28 = (_QWORD *)((char *)a2 + v26);
  v30 = *v28;
  v29 = v28[1];
  *v27 = v30;
  v27[1] = v29;
  swift_bridgeObjectRelease();
  v31 = a3[10];
  v32 = (_QWORD *)((char *)a1 + v31);
  v33 = (_QWORD *)((char *)a2 + v31);
  v35 = *v33;
  v34 = v33[1];
  *v32 = v35;
  v32[1] = v34;
  swift_bridgeObjectRelease();
  v36 = a3[12];
  *(_QWORD *)((char *)a1 + a3[11]) = *(_QWORD *)((char *)a2 + a3[11]);
  *(_QWORD *)((char *)a1 + v36) = *(_QWORD *)((char *)a2 + v36);
  v37 = a3[14];
  *(_QWORD *)((char *)a1 + a3[13]) = *(_QWORD *)((char *)a2 + a3[13]);
  v38 = (_QWORD *)((char *)a1 + v37);
  v39 = (_QWORD *)((char *)a2 + v37);
  v41 = *v39;
  v40 = v39[1];
  *v38 = v41;
  v38[1] = v40;
  swift_bridgeObjectRelease();
  v42 = a3[15];
  v43 = (char *)a1 + v42;
  v44 = (char *)a2 + v42;
  v45 = sub_2487B51D4();
  v46 = *(_QWORD *)(v45 - 8);
  v47 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v46 + 48);
  v48 = v47(v43, 1, v45);
  v49 = v47(v44, 1, v45);
  if (!v48)
  {
    if (!v49)
    {
      (*(void (**)(char *, char *, uint64_t))(v46 + 40))(v43, v44, v45);
      goto LABEL_13;
    }
    (*(void (**)(char *, uint64_t))(v46 + 8))(v43, v45);
    goto LABEL_12;
  }
  if (v49)
  {
LABEL_12:
    v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
    memcpy(v43, v44, *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(char *, char *, uint64_t))(v46 + 32))(v43, v44, v45);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v46 + 56))(v43, 0, 1, v45);
LABEL_13:
  v51 = a3[16];
  v52 = (_QWORD *)((char *)a1 + v51);
  v53 = (_QWORD *)((char *)a2 + v51);
  v55 = *v53;
  v54 = v53[1];
  *v52 = v55;
  v52[1] = v54;
  swift_bridgeObjectRelease();
  v56 = a3[18];
  *(_QWORD *)((char *)a1 + a3[17]) = *(_QWORD *)((char *)a2 + a3[17]);
  *(_DWORD *)((char *)a1 + v56) = *(_DWORD *)((char *)a2 + v56);
  v57 = a3[20];
  *(_DWORD *)((char *)a1 + a3[19]) = *(_DWORD *)((char *)a2 + a3[19]);
  *(_DWORD *)((char *)a1 + v57) = *(_DWORD *)((char *)a2 + v57);
  v58 = a3[22];
  *(_DWORD *)((char *)a1 + a3[21]) = *(_DWORD *)((char *)a2 + a3[21]);
  *(_DWORD *)((char *)a1 + v58) = *(_DWORD *)((char *)a2 + v58);
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBVoiceSample()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2487973CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 60);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(a1 + v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for TTSVBVoiceSample()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_248797480(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 20);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 60);
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(v5 + v11, a2, a2, v10);
  }
  return result;
}

void sub_248797524()
{
  unint64_t v0;
  unint64_t v1;

  sub_24877BE14(319, (unint64_t *)&qword_25445ED30, (void (*)(uint64_t))MEMORY[0x24BDCDAB8]);
  if (v0 <= 0x3F)
  {
    sub_24877BE14(319, (unint64_t *)&qword_25445F398, (void (*)(uint64_t))MEMORY[0x24BDCE908]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

uint64_t getEnumTagSinglePayload for TTSVBVoiceSample.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xEE)
    goto LABEL_17;
  if (a2 + 18 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 18) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 18;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 18;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 18;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0x13;
  v8 = v6 - 19;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for TTSVBVoiceSample.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 18 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 18) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xEE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xED)
    return ((uint64_t (*)(void))((char *)&loc_2487976F4 + 4 * byte_2487C0938[v4]))();
  *a1 = a2 + 18;
  return ((uint64_t (*)(void))((char *)sub_248797728 + 4 * byte_2487C0933[v4]))();
}

uint64_t sub_248797728(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_248797730(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x248797738);
  return result;
}

uint64_t sub_248797744(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24879774CLL);
  *(_BYTE *)result = a2 + 18;
  return result;
}

uint64_t sub_248797750(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_248797758(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TTSVBVoiceSample.CodingKeys()
{
  return &type metadata for TTSVBVoiceSample.CodingKeys;
}

unint64_t sub_248797778()
{
  unint64_t result;

  result = qword_25778F630[0];
  if (!qword_25778F630[0])
  {
    result = MEMORY[0x24959AEB4](&unk_2487C0C24, &type metadata for TTSVBVoiceSample.CodingKeys);
    atomic_store(result, qword_25778F630);
  }
  return result;
}

unint64_t sub_2487977C0()
{
  unint64_t result;

  result = qword_25778F740;
  if (!qword_25778F740)
  {
    result = MEMORY[0x24959AEB4](&unk_2487C0B94, &type metadata for TTSVBVoiceSample.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25778F740);
  }
  return result;
}

unint64_t sub_248797808()
{
  unint64_t result;

  result = qword_25778F748[0];
  if (!qword_25778F748[0])
  {
    result = MEMORY[0x24959AEB4](&unk_2487C0BBC, &type metadata for TTSVBVoiceSample.CodingKeys);
    atomic_store(result, qword_25778F748);
  }
  return result;
}

uint64_t sub_24879784C(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x4449656C706D6173 && a2 == 0xE800000000000000;
  if (v2 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 7107189 && a2 == 0xE300000000000000 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002487C5D70 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x73656D656E6F6870 && a2 == 0xE800000000000000 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x657361726870 && a2 == 0xE600000000000000 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x697263736E617274 && a2 == 0xEA00000000007470 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else if (a1 == 0x6C7469546B6F6F62 && a2 == 0xE900000000000065 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 6;
  }
  else if (a1 == 0x7061726761726170 && a2 == 0xEE007865646E4968 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 7;
  }
  else if (a1 == 0x65636E65746E6573 && a2 == 0xED00007865646E49 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 8;
  }
  else if (a1 == 0xD000000000000011 && a2 == 0x80000002487C5D30 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 9;
  }
  else if (a1 == 0x656C61636F6CLL && a2 == 0xE600000000000000 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 10;
  }
  else if (a1 == 0x6E6964726F636572 && a2 == 0xED00006574614467 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 11;
  }
  else if (a1 == 0x6172685072657375 && a2 == 0xEA00000000006573 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 12;
  }
  else if (a1 == 0x726F635372657375 && a2 == 0xE900000000000065 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 13;
  }
  else if (a1 == 7106675 && a2 == 0xE300000000000000 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 14;
  }
  else if (a1 == 7499379 && a2 == 0xE300000000000000 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 15;
  }
  else if (a1 == 0x73657268546C7073 && a2 == 0xEC000000646C6F68 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 16;
  }
  else if (a1 == 0x7365726854726E73 && a2 == 0xEC000000646C6F68 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 17;
  }
  else if (a1 == 0x7367616C66 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 18;
  }
  else
  {
    v6 = sub_2487B5CE4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 18;
    else
      return 19;
  }
}

id TTSVBAudioService.RecordingResult.measurement.getter()
{
  id *v0;

  return *v0;
}

uint64_t TTSVBAudioService.RecordingResult.audioFileURL.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TTSVBAudioService.RecordingResult(0) + 20);
  v4 = sub_2487B50CC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t type metadata accessor for TTSVBAudioService.RecordingResult(uint64_t a1)
{
  return sub_2487095AC(a1, (uint64_t *)&unk_25778FE50);
}

uint64_t TTSVBAudioService.RecordingResult.userPhrase.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBAudioService.RecordingResult(0) + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBAudioService.RecordingResult.userScore.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBAudioService.RecordingResult(0) + 28));
}

uint64_t TTSVBAudioService.RecordingResult.sampleID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBAudioService.RecordingResult(0) + 32));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBAudioService.RecordingResult.spl.getter()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0xA0))();
}

uint64_t TTSVBAudioService.RecordingResult.splEnd.getter()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0xB8))();
}

uint64_t TTSVBAudioService.RecordingResult.splUnnormalized.getter()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0xD0))();
}

uint64_t TTSVBAudioService.RecordingResult.splEndUnnormalized.getter()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0xE8))();
}

uint64_t TTSVBAudioService.RecordingResult.splThreshold.getter()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x100))();
}

uint64_t TTSVBAudioService.RecordingResult.snr.getter()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x118))();
}

uint64_t TTSVBAudioService.RecordingResult.snrEnd.getter()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x130))();
}

uint64_t TTSVBAudioService.RecordingResult.snrUnnormalized.getter()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x148))();
}

uint64_t TTSVBAudioService.RecordingResult.snrEndUnnormalized.getter()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x160))();
}

uint64_t TTSVBAudioService.RecordingResult.snrThreshold.getter()
{
  _QWORD **v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & **v0) + 0x178))();
}

BOOL TTSVBAudioService.RecordingResult.hasErrors.getter()
{
  _QWORD **v0;
  uint64_t v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  float v8;
  float v9;
  uint64_t v10;
  _BOOL8 v11;
  _QWORD *v12;
  float v13;
  uint64_t v15;

  v1 = (uint64_t)v0;
  v2 = type metadata accessor for TTSVBAudioService.RecordingResult(0);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (uint64_t *)((char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *v0;
  v7 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v8 = (*(float (**)(double))((*MEMORY[0x24BEE4EA0] & *v6) + 0xA0))(v3);
  v9 = (*(float (**)(void))((*v7 & *v6) + 0x100))();
  v10 = sub_248709554(v1, (uint64_t)v5, type metadata accessor for TTSVBAudioService.RecordingResult);
  if (v9 >= v8)
  {
    v12 = (_QWORD *)*v5;
    v13 = (*(float (**)(uint64_t))((*v7 & *(_QWORD *)*v5) + 0x118))(v10);
    v11 = v13 < (*(float (**)(void))((*v7 & *v12) + 0x178))();
  }
  else
  {
    v11 = 1;
  }
  sub_2486EDA68((uint64_t)v5, type metadata accessor for TTSVBAudioService.RecordingResult);
  return v11;
}

TextToSpeechVoiceBankingSupport::TTSVBAudioService::SoundEffect_optional __swiftcall TTSVBAudioService.SoundEffect.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  TextToSpeechVoiceBankingSupport::TTSVBAudioService::SoundEffect_optional result;
  char v5;

  v2 = v1;
  v3 = sub_2487B5BAC();
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

unint64_t TTSVBAudioService.SoundEffect.rawValue.getter()
{
  return 0xD000000000000012;
}

uint64_t sub_248798510(char *a1, char *a2)
{
  return sub_24879851C(*a1, *a2);
}

uint64_t sub_24879851C(char a1, char a2)
{
  unint64_t v2;
  unint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 0x80000002487C7710;
  else
    v2 = 0x80000002487C76F0;
  if ((a2 & 1) != 0)
    v3 = 0x80000002487C7710;
  else
    v3 = 0x80000002487C76F0;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_2487B5CE4();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

TextToSpeechVoiceBankingSupport::TTSVBAudioService::SoundEffect_optional sub_2487985B8(Swift::String *a1)
{
  return TTSVBAudioService.SoundEffect.init(rawValue:)(*a1);
}

void sub_2487985C4(_QWORD *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;

  v2 = 0x80000002487C76F0;
  if (*v1)
    v2 = 0x80000002487C7710;
  *a1 = 0xD000000000000012;
  a1[1] = v2;
}

uint64_t sub_248798600()
{
  return sub_248798608();
}

uint64_t sub_248798608()
{
  sub_2487B5D5C();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  return sub_2487B5D98();
}

uint64_t sub_248798684()
{
  sub_2487B557C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2487986DC()
{
  return sub_2487986E4();
}

uint64_t sub_2487986E4()
{
  sub_2487B5D5C();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  return sub_2487B5D98();
}

uint64_t type metadata accessor for TTSVBAudioService.State(uint64_t a1)
{
  return sub_2487095AC(a1, qword_25778FE90);
}

id sub_248798770()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine);
  }
  else
  {
    v4 = sub_2487987CC();
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_2487987CC()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _BYTE v13[16];

  v1 = v0;
  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1800]), sel_init);
  v3 = sub_2487B50CC();
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v13[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13[15] = 0;
  sub_24879BCC8((uint64_t)v5);
  v6 = objc_allocWithZone(MEMORY[0x24BDB1810]);
  v7 = sub_2487614A8((uint64_t)v5);
  v8 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode;
  objc_msgSend(v2, sel_attachNode_, *(_QWORD *)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode));
  v9 = *(id *)(v1 + v8);
  v10 = objc_msgSend(v2, sel_outputNode);
  v11 = objc_msgSend(v7, sel_processingFormat);
  objc_msgSend(v2, sel_connect_to_format_, v9, v10, v11);

  return v2;
}

id sub_248798934()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___playbackPlayer;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___playbackPlayer);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___playbackPlayer);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB2610]), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

uint64_t TTSVBAudioService.numberOfAudioMagnitudes.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_numberOfAudioMagnitudes;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t TTSVBAudioService.numberOfAudioMagnitudes.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_numberOfAudioMagnitudes);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*TTSVBAudioService.numberOfAudioMagnitudes.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id TTSVBAudioService.speechRecognitionService.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_speechRecognitionService));
}

id TTSVBAudioService.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

char *TTSVBAudioService.init()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  id v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  unint64_t v44;
  id v45;
  id v46;
  char *v47;
  void (*v48)(int64_t, uint64_t);
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  id v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  id v64;
  uint64_t v65;
  char *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  id v75;
  char *v76;
  void (*v77)(char *, uint64_t, uint64_t, char *);
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  char *v84;
  id v85;
  uint64_t v86;
  id v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  void (*v91)(char *, uint64_t);
  uint64_t v92;
  char *v93;
  uint64_t v94;
  char *v95;
  id v96;
  void (*v97)(char *, uint64_t, uint64_t, char *);
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  unint64_t v104;
  id v105;
  uint64_t v106;
  id v107;
  uint64_t v108;
  uint64_t v109;
  void (*v110)(char *, uint64_t);
  uint64_t v111;
  char *v112;
  uint64_t v113;
  char *v114;
  void *v115;
  id v116;
  uint64_t v117;
  id v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  char *v126;
  id v127;
  id v128;
  uint64_t v129;
  void *v130;
  void *v131;
  char *v132;
  void *v133;
  char *v135;
  char *v136;
  id v137;
  uint64_t v138;
  uint64_t v139;
  void (*v140)(char *, uint64_t, uint64_t, char *);
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  char *v145;
  void (*v146)(char *, uint64_t);
  uint64_t v147;
  char *v148;
  objc_class *ObjectType;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  id v153;
  objc_super v154;

  ObjectType = (objc_class *)swift_getObjectType();
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777DAA0);
  MEMORY[0x24BDAC7A8](v1);
  v136 = (char *)&v135 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v150 = sub_2487B5828();
  v3 = *(_QWORD *)(v150 - 8);
  MEMORY[0x24BDAC7A8](v150);
  v148 = (char *)&v135 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2487B5804();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v5);
  v7 = sub_2487B5408();
  MEMORY[0x24BDAC7A8](v7);
  v144 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue;
  v8 = sub_24870A34C(0, (unint64_t *)&qword_25445F6C0);
  v9 = v0;
  sub_2487B53F0();
  v153 = (id)MEMORY[0x24BEE4AF8];
  v10 = sub_2486F4CA0((unint64_t *)&unk_25445F6B0, v6, MEMORY[0x24BEE5698]);
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F360);
  v151 = sub_24871869C((unint64_t *)&unk_25445F6A0, (uint64_t *)&unk_25445F360, MEMORY[0x24BEE12C8]);
  v146 = (void (*)(char *, uint64_t))v11;
  v147 = v10;
  v142 = v5;
  sub_2487B59FC();
  LODWORD(v141) = *MEMORY[0x24BEE5758];
  v12 = *(char **)(v3 + 104);
  v13 = v148;
  v14 = v150;
  ((void (*)(char *))v12)(v148);
  v145 = v12;
  v152 = v8;
  *(_QWORD *)(v143 + v144) = sub_2487B584C();
  v144 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue;
  sub_2487B53F0();
  v153 = (id)MEMORY[0x24BEE4AF8];
  sub_2487B59FC();
  v15 = v13;
  v16 = v13;
  v17 = v141;
  ((void (*)(char *, _QWORD, uint64_t))v12)(v16, v141, v14);
  *(_QWORD *)&v9[v144] = sub_2487B584C();
  v18 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state;
  type metadata accessor for TTSVBAudioService.State(0);
  v19 = swift_allocObject();
  sub_2487A8DB0();
  *(_QWORD *)&v9[v18] = v19;
  v20 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode;
  *(_QWORD *)&v9[v20] = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1850]), sel_init);
  *(_QWORD *)&v9[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___playbackPlayer] = 0;
  *(_QWORD *)&v9[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_cancellables] = MEMORY[0x24BEE4B08];
  v21 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioIOQueue;
  sub_2487B53F0();
  v22 = MEMORY[0x24BEE4AF8];
  v153 = (id)MEMORY[0x24BEE4AF8];
  sub_2487B59FC();
  ((void (*)(char *, uint64_t, uint64_t))v145)(v15, v17, v150);
  *(_QWORD *)&v9[v21] = sub_2487B584C();
  *(_QWORD *)&v9[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_numberOfAudioMagnitudes] = 0;
  v23 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_speechRecognitionService;
  type metadata accessor for TTSVBSpeechRecognitionService();
  *(_QWORD *)&v9[v23] = sub_2487595F0();
  v24 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_cachedSoundEffects;
  *(_QWORD *)&v9[v24] = sub_2487A218C(v22);
  v25 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  *(_QWORD *)&v9[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession] = v25;

  v154.receiver = v9;
  v154.super_class = ObjectType;
  v26 = objc_msgSendSuper2(&v154, sel_init);
  v27 = (void *)objc_opt_self();
  v28 = (char *)v26;
  v137 = objc_msgSend(v27, sel_defaultCenter);
  v139 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777DAF8);
  v142 = *(_QWORD *)(v139 - 8);
  ObjectType = *(objc_class **)(v142 + 64);
  MEMORY[0x24BDAC7A8](v139);
  v145 = (char *)((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = (char *)((char *)&v135 - v145);
  v31 = sub_2487B5870();
  v32 = *(_QWORD *)(v31 - 8);
  v150 = *(_QWORD *)(v32 + 64);
  MEMORY[0x24BDAC7A8](v31);
  v141 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
  v34 = (char *)&v135 - v141;
  v35 = sub_248798934();
  sub_2487B587C();

  v143 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue;
  v153 = *(id *)&v28[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  v36 = v153;
  v148 = (char *)sub_2487B581C();
  v140 = *(void (**)(char *, uint64_t, uint64_t, char *))(*((_QWORD *)v148 - 1) + 56);
  v37 = (uint64_t)v136;
  v140(v136, 1, 1, v148);
  v147 = sub_2486F4CA0(&qword_25777DB00, (uint64_t (*)(uint64_t))MEMORY[0x24BDD0080], MEMORY[0x24BDD0068]);
  v144 = sub_2487A8F84();
  v38 = v36;
  sub_2487B53B4();
  sub_2486F5008(v37, &qword_25777DAA0);

  v146 = *(void (**)(char *, uint64_t))(v32 + 8);
  v146(v34, v31);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  v151 = sub_24871869C(&qword_25777DB10, &qword_25777DAF8, MEMORY[0x24BDB9A08]);
  v39 = v139;
  sub_2487B53C0();
  swift_release();
  v142 = *(_QWORD *)(v142 + 8);
  ((void (*)(char *, uint64_t))v142)(v30, v39);
  v40 = &v28[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_cancellables];
  swift_beginAccess();
  sub_2487B5354();
  swift_endAccess();
  v41 = swift_release();
  MEMORY[0x24BDAC7A8](v41);
  v42 = (char *)((char *)&v135 - v145);
  MEMORY[0x24BDAC7A8](v43);
  v44 = v141;
  sub_2487B587C();
  v153 = *(id *)&v28[v143];
  v45 = v153;
  v140((char *)v37, 1, 1, v148);
  v46 = v45;
  v138 = v31;
  sub_2487B53B4();
  sub_2486F5008(v37, &qword_25777DAA0);

  v146((char *)&v135 - v44, v31);
  swift_allocObject();
  v47 = v28;
  swift_unknownObjectWeakInit();
  sub_2487B53C0();
  swift_release();
  v48 = (void (*)(int64_t, uint64_t))v142;
  ((void (*)(char *, uint64_t))v142)(v42, v39);
  v135 = v40;
  swift_beginAccess();
  sub_2487B5354();
  swift_endAccess();
  v49 = swift_release();
  MEMORY[0x24BDAC7A8](v49);
  v50 = v145;
  MEMORY[0x24BDAC7A8](v51);
  v52 = (char *)&v135 - v44;
  sub_2487B587C();
  v53 = v143;
  v153 = *(id *)&v47[v143];
  v54 = v153;
  v55 = (uint64_t)v136;
  v140(v136, 1, 1, v148);
  v56 = v54;
  v57 = v138;
  sub_2487B53B4();
  sub_2486F5008(v55, &qword_25777DAA0);

  v146(v52, v57);
  swift_allocObject();
  v58 = v47;
  swift_unknownObjectWeakInit();
  v59 = v139;
  sub_2487B53C0();
  swift_release();
  v48((char *)&v135 - v50, v59);
  swift_beginAccess();
  sub_2487B5354();
  swift_endAccess();
  v60 = swift_release();
  MEMORY[0x24BDAC7A8](v60);
  v61 = (char *)((char *)&v135 - v50);
  MEMORY[0x24BDAC7A8](v62);
  v63 = (char *)&v135 - v141;
  sub_2487B587C();
  v153 = *(id *)&v47[v53];
  v64 = v153;
  v65 = (uint64_t)v136;
  v66 = v148;
  v140(v136, 1, 1, v148);
  v67 = v64;
  v68 = v138;
  sub_2487B53B4();
  sub_2486F5008(v65, &qword_25777DAA0);

  v146(v63, v68);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  v69 = v139;
  sub_2487B53C0();
  swift_release();
  ((void (*)(char *, uint64_t))v142)(v61, v69);
  swift_beginAccess();
  sub_2487B5354();
  swift_endAccess();
  v70 = swift_release();
  MEMORY[0x24BDAC7A8](v70);
  v71 = (char *)((char *)&v135 - v145);
  MEMORY[0x24BDAC7A8](v72);
  v73 = (char *)&v135 - v141;
  sub_2487B587C();
  v74 = v143;
  v153 = *(id *)&v58[v143];
  v75 = v153;
  v76 = v66;
  v77 = v140;
  v140((char *)v65, 1, 1, v76);
  v78 = v75;
  v79 = v138;
  sub_2487B53B4();
  sub_2486F5008(v65, &qword_25777DAA0);

  v146(v73, v79);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  v80 = v139;
  sub_2487B53C0();
  swift_release();
  ((void (*)(char *, uint64_t))v142)(v71, v80);
  swift_beginAccess();
  sub_2487B5354();
  swift_endAccess();
  v81 = swift_release();
  MEMORY[0x24BDAC7A8](v81);
  v82 = v145;
  MEMORY[0x24BDAC7A8](v83);
  v84 = (char *)&v135 - v141;
  sub_2487B587C();
  v153 = *(id *)&v58[v74];
  v85 = v153;
  v86 = (uint64_t)v136;
  v77(v136, 1, 1, v148);
  v87 = v85;
  v88 = v138;
  sub_2487B53B4();
  sub_2486F5008(v86, &qword_25777DAA0);

  v146(v84, v88);
  swift_allocObject();
  v89 = v58;
  swift_unknownObjectWeakInit();
  v90 = v139;
  sub_2487B53C0();
  swift_release();
  v91 = (void (*)(char *, uint64_t))v142;
  ((void (*)(int64_t, uint64_t))v142)((char *)&v135 - v82, v90);
  swift_beginAccess();
  sub_2487B5354();
  swift_endAccess();
  v92 = swift_release();
  MEMORY[0x24BDAC7A8](v92);
  v93 = (char *)((char *)&v135 - v82);
  MEMORY[0x24BDAC7A8](v94);
  v95 = (char *)&v135 - v141;
  sub_2487B587C();
  v153 = *(id *)&v89[v143];
  v96 = v153;
  v97 = v140;
  v140((char *)v86, 1, 1, v148);
  v98 = v96;
  v99 = v138;
  sub_2487B53B4();
  sub_2486F5008(v86, &qword_25777DAA0);

  v146(v95, v99);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  v100 = v139;
  sub_2487B53C0();
  swift_release();
  v91(v93, v100);
  swift_beginAccess();
  sub_2487B5354();
  swift_endAccess();
  v101 = swift_release();
  MEMORY[0x24BDAC7A8](v101);
  v102 = (char *)((char *)&v135 - v145);
  MEMORY[0x24BDAC7A8](v103);
  v104 = v141;
  sub_2487B587C();
  v153 = *(id *)&v89[v143];
  v105 = v153;
  v106 = (uint64_t)v136;
  v97(v136, 1, 1, v148);
  v107 = v105;
  v108 = v138;
  sub_2487B53B4();
  sub_2486F5008(v106, &qword_25777DAA0);

  v109 = v108;
  v110 = v146;
  v146((char *)&v135 - v104, v109);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_2487B53C0();
  swift_release();
  ((void (*)(char *, uint64_t))v142)(v102, v100);
  swift_beginAccess();
  sub_2487B5354();
  swift_endAccess();
  v111 = swift_release();
  MEMORY[0x24BDAC7A8](v111);
  v112 = (char *)((char *)&v135 - v145);
  MEMORY[0x24BDAC7A8](v113);
  v114 = (char *)&v135 - v104;
  v115 = v137;
  sub_2487B587C();
  v153 = *(id *)&v89[v143];
  v116 = v153;
  v117 = v106;
  v140((char *)v106, 1, 1, v148);
  v118 = v116;
  v119 = v138;
  sub_2487B53B4();
  v120 = v117;
  sub_2486F5008(v117, &qword_25777DAA0);

  v121 = v119;
  v110(v114, v119);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  v122 = v139;
  sub_2487B53C0();
  swift_release();
  ((void (*)(char *, uint64_t))v142)(v112, v122);
  swift_beginAccess();
  sub_2487B5354();
  swift_endAccess();
  v123 = swift_release();
  MEMORY[0x24BDAC7A8](v123);
  v124 = (char *)((char *)&v135 - v145);
  MEMORY[0x24BDAC7A8](v125);
  v126 = (char *)&v135 - v141;
  sub_2487B587C();
  v153 = *(id *)&v89[v143];
  v127 = v153;
  v140((char *)v120, 1, 1, v148);
  v128 = v127;
  sub_2487B53B4();
  sub_2486F5008(v120, &qword_25777DAA0);

  v110(v126, v121);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_2487B53C0();
  swift_release();
  ((void (*)(char *, uint64_t))v142)(v124, v122);
  swift_beginAccess();
  sub_2487B5354();
  swift_endAccess();
  swift_release();
  v129 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession;
  v130 = *(void **)&v89[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession];
  swift_retain();
  LOBYTE(v153) = objc_msgSend(v130, sel_isInputAvailable);
  sub_2487B5384();
  swift_release();
  v131 = *(void **)&v89[v129];
  v132 = v89;
  v133 = (void *)sub_2487B5504();
  objc_msgSend(v131, sel_addObserver_forKeyPath_options_context_, v132, v133, 0, 0);

  return v132;
}

void sub_248799F18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v7;
  uint64_t v8;
  void (*v9)(char *);
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint8_t *v14;
  uint8_t *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  _QWORD v20[2];
  __int128 v21;

  v1 = v0;
  v2 = sub_2487B533C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v20 - v5;
  swift_retain();
  sub_2487B5378();
  swift_release();
  v7 = v21;
  v8 = sub_2487B0C04();
  v9 = *(void (**)(char *))(v3 + 16);
  v20[1] = v8;
  v9(v6);
  v10 = sub_2487B5324();
  v11 = sub_2487B57E0();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    v20[0] = v9;
    v13 = v2;
    v14 = v12;
    *(_DWORD *)v12 = 67109120;
    LODWORD(v21) = v7;
    sub_2487B593C();
    _os_log_impl(&dword_2486E6000, v10, v11, "Got audio engine config change. wasRunning=%{BOOL}d. Restarting audio engine.", v14, 8u);
    v15 = v14;
    v2 = v13;
    MEMORY[0x24959AF80](v15, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  sub_24879C844();
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB1850]), sel_init);
  v17 = *(void **)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode) = v16;

  v18 = sub_2487987CC();
  v19 = *(void **)(v1
                 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine);
  *(_QWORD *)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService____lazy_storage___audioEngine) = v18;

  sub_24879C240();
}

void sub_24879A2F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  void *v25;
  id v26;
  char v27;
  int *v28;
  uint64_t v29;
  char *v30;
  char *v31;
  id v32;
  uint64_t v33;
  int v34;
  id v35;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[2];
  __int128 v42;
  __int128 v43;

  v3 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  v6 = MEMORY[0x24959B01C](a2 + 16);
  if (v6)
  {
    v7 = (char *)v6;
    sub_2487B4E98();
    if (*((_QWORD *)&v43 + 1))
    {
      sub_24870A40C(&v42, v41);
      sub_24870A34C(0, &qword_25777DFD8);
      swift_dynamicCast();
      v8 = (void *)v39;
      if ((_QWORD)v39 != *(_QWORD *)&v7[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession])
      {

        return;
      }
      v9 = sub_2487B4EA4();
      if (v9)
      {
        v10 = v9;
        *(_QWORD *)&v42 = sub_2487B5528();
        *((_QWORD *)&v42 + 1) = v11;
        swift_bridgeObjectRetain();
        sub_2487B5A68();
        if (*(_QWORD *)(v10 + 16) && (v12 = sub_248779390((uint64_t)v41), (v13 & 1) != 0))
        {
          sub_2486F0814(*(_QWORD *)(v10 + 56) + 32 * v12, (uint64_t)&v39);
        }
        else
        {
          v39 = 0u;
          v40 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((_QWORD *)&v40 + 1))
        {
          sub_2487799E0((uint64_t)v41);
          swift_bridgeObjectRelease();
          sub_24870A40C(&v39, &v42);
          sub_24870A34C(0, &qword_25445F178);
          swift_dynamicCast();
          v37 = v38;
          v36 = objc_msgSend(v38, sel_unsignedIntegerValue);
          v14 = sub_2487B4EA4();
          if (v14)
          {
            v15 = v14;
            *(_QWORD *)&v39 = sub_2487B5528();
            *((_QWORD *)&v39 + 1) = v16;
            sub_2487B5A68();
            if (*(_QWORD *)(v15 + 16) && (v17 = sub_248779390((uint64_t)v41), (v18 & 1) != 0))
            {
              sub_2486F0814(*(_QWORD *)(v15 + 56) + 32 * v17, (uint64_t)&v42);
            }
            else
            {
              v42 = 0u;
              v43 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_2487799E0((uint64_t)v41);
            if (*((_QWORD *)&v43 + 1))
            {
              if ((swift_dynamicCast() & 1) != 0)
              {
                v19 = *(void **)&v41[0];
                v35 = objc_msgSend(*(id *)&v41[0], sel_unsignedIntegerValue);

                v34 = 0;
                goto LABEL_22;
              }
LABEL_21:
              v35 = 0;
              v34 = 1;
LABEL_22:
              v20 = sub_2487B4EA4();
              if (v20)
              {
                v21 = v20;
                *(_QWORD *)&v39 = sub_2487B5528();
                *((_QWORD *)&v39 + 1) = v22;
                sub_2487B5A68();
                if (*(_QWORD *)(v21 + 16) && (v23 = sub_248779390((uint64_t)v41), (v24 & 1) != 0))
                {
                  sub_2486F0814(*(_QWORD *)(v21 + 56) + 32 * v23, (uint64_t)&v42);
                }
                else
                {
                  v42 = 0u;
                  v43 = 0u;
                }
                swift_bridgeObjectRelease();
                sub_2487799E0((uint64_t)v41);
                if (*((_QWORD *)&v43 + 1))
                {
                  if ((swift_dynamicCast() & 1) != 0)
                  {
                    v25 = *(void **)&v41[0];
                    v26 = objc_msgSend(*(id *)&v41[0], sel_unsignedIntegerValue);

                    v27 = 0;
LABEL_33:
                    v28 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_25777DB70);
                    v29 = v28[16];
                    v30 = (char *)v5 + v28[20];
                    v31 = (char *)v5 + v28[24];
                    *v5 = v8;
                    v32 = v8;
                    sub_2487B51C8();
                    *(_QWORD *)((char *)v5 + v29) = v36;
                    *(_QWORD *)v30 = v35;
                    v30[8] = v34;
                    *(_QWORD *)v31 = v26;
                    v31[8] = v27;
                    swift_storeEnumTagMultiPayload();
                    sub_24879A788((uint64_t)v5);

                    sub_2486EDA68((uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
                    return;
                  }
LABEL_32:
                  v26 = 0;
                  v27 = 1;
                  goto LABEL_33;
                }
              }
              else
              {
                v42 = 0u;
                v43 = 0u;
              }
              sub_2486F5008((uint64_t)&v42, (uint64_t *)&unk_25777CBD0);
              goto LABEL_32;
            }
          }
          else
          {
            v42 = 0u;
            v43 = 0u;
          }
          sub_2486F5008((uint64_t)&v42, (uint64_t *)&unk_25777CBD0);
          goto LABEL_21;
        }
LABEL_37:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_37;
  }
}

void sub_24879A788(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  id *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  _QWORD *v16;
  void *v17;
  id v18;
  uint64_t v19;
  char *v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  id v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  os_log_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  os_log_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;

  v3 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (id *)((char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v50 - v7;
  v9 = sub_2487B533C();
  v55 = *(_QWORD *)(v9 - 8);
  v56 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v50 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2487B542C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x24BDAC7A8](v12);
  v16 = (os_log_t *)((char *)&v50 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  v17 = *(void **)&v1[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  *v16 = v17;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v13 + 104))(v16, *MEMORY[0x24BEE5610], v12, v14);
  v18 = v17;
  LOBYTE(v17) = sub_2487B5444();
  (*(void (**)(_QWORD *, uint64_t))(v13 + 8))(v16, v12);
  if ((v17 & 1) != 0)
  {
    v19 = sub_2487B0C04();
    (*(void (**)(char *, uint64_t, uint64_t))(v55 + 16))(v11, v19, v56);
    sub_248709554(a1, (uint64_t)v8, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
    v20 = v1;
    v21 = sub_2487B5324();
    v22 = sub_2487B57BC();
    v23 = v22;
    if (os_log_type_enabled(v21, v22))
    {
      v24 = swift_slowAlloc();
      v54 = v3;
      v25 = v24;
      v52 = swift_slowAlloc();
      v63 = v52;
      *(_DWORD *)v25 = 136316162;
      v51 = v23;
      v50 = v21;
      v26 = sub_2487A8AF0();
      v61 = sub_2486EDE5C(v26, v27, &v63);
      sub_2487B593C();
      swift_bridgeObjectRelease();
      sub_2486EDA68((uint64_t)v8, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
      *(_WORD *)(v25 + 12) = 2080;
      v28 = *(void **)&v20[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession];
      v29 = objc_msgSend(v28, sel_category);
      v30 = sub_2487B5528();
      v53 = a1;
      v61 = v30;
      v62 = v31;
      v59 = 0xD000000000000016;
      v60 = 0x80000002487C77C0;
      v57 = 0;
      v58 = 0xE000000000000000;
      sub_2486ED9E0();
      v32 = sub_2487B5984();
      v34 = v33;

      swift_bridgeObjectRelease();
      v61 = sub_2486EDE5C(v32, v34, &v63);
      sub_2487B593C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 22) = 2080;
      v35 = sub_2487A5354((char)objc_msgSend(v28, sel_categoryOptions));
      v61 = sub_2486EDE5C(v35, v36, &v63);
      sub_2487B593C();

      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 32) = 2080;
      v37 = objc_msgSend(v28, sel_mode);
      v38 = sub_2487B5528();
      v40 = v39;

      v61 = sub_2486EDE5C(v38, v40, &v63);
      sub_2487B593C();

      a1 = v53;
      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 42) = 2080;
      v41 = objc_msgSend(v28, sel_currentRoute);
      v42 = sub_2487A7AD4();
      v44 = v43;

      v61 = sub_2486EDE5C(v42, v44, &v63);
      sub_2487B593C();

      swift_bridgeObjectRelease();
      v45 = v50;
      _os_log_impl(&dword_2486E6000, v50, (os_log_type_t)v51, "Got audio sesseion event: %s. CurrentCategory=%s CurrentOptions=%s CurrentMode=%s CurrentRoute=%s", (uint8_t *)v25, 0x34u);
      v46 = v52;
      swift_arrayDestroy();
      MEMORY[0x24959AF80](v46, -1, -1);
      MEMORY[0x24959AF80](v25, -1, -1);

    }
    else
    {
      sub_2486EDA68((uint64_t)v8, type metadata accessor for TTSVBAudioService.AudioSessionEvent);

    }
    (*(void (**)(char *, uint64_t))(v55 + 8))(v11, v56);
    sub_248709554(a1, (uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
    if (swift_getEnumCaseMultiPayload() == 1)
    {

      v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777DB68);
      v48 = (char *)v5 + *(int *)(v47 + 48);

      v49 = sub_2487B51D4();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v49 - 8) + 8))(v48, v49);
      sub_2487A78F8();
    }
    else
    {
      sub_2486EDA68((uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_24879AD4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];
  __int128 v34;
  uint64_t v35;

  v3 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (id *)((char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  v6 = MEMORY[0x24959B01C](a2 + 16);
  if (v6)
  {
    v7 = (char *)v6;
    sub_2487B4E98();
    if (v35)
    {
      sub_24870A40C(&v34, v33);
      sub_24870A34C(0, &qword_25777DFD8);
      swift_dynamicCast();
      v8 = (void *)v31;
      if ((_QWORD)v31 != *(_QWORD *)&v7[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession])
      {

        return;
      }
      v9 = sub_2487B4EA4();
      if (v9)
      {
        v10 = v9;
        *(_QWORD *)&v34 = sub_2487B5528();
        *((_QWORD *)&v34 + 1) = v11;
        swift_bridgeObjectRetain();
        sub_2487B5A68();
        if (*(_QWORD *)(v10 + 16) && (v12 = sub_248779390((uint64_t)v33), (v13 & 1) != 0))
        {
          sub_2486F0814(*(_QWORD *)(v10 + 56) + 32 * v12, (uint64_t)&v31);
        }
        else
        {
          v31 = 0u;
          v32 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((_QWORD *)&v32 + 1))
        {
          sub_2487799E0((uint64_t)v33);
          swift_bridgeObjectRelease();
          sub_24870A40C(&v31, &v34);
          sub_24870A34C(0, &qword_25445F178);
          swift_dynamicCast();
          v14 = v30;
          v15 = objc_msgSend(v30, sel_unsignedIntegerValue);
          v16 = sub_2487B4EA4();
          if (v16)
          {
            v17 = v16;
            *(_QWORD *)&v34 = sub_2487B5528();
            *((_QWORD *)&v34 + 1) = v18;
            swift_bridgeObjectRetain();
            sub_2487B5A68();
            v19 = *(_QWORD *)(v17 + 16);
            v29 = v14;
            if (v19 && (v20 = sub_248779390((uint64_t)v33), (v21 & 1) != 0))
            {
              sub_2486F0814(*(_QWORD *)(v17 + 56) + 32 * v20, (uint64_t)&v31);
            }
            else
            {
              v31 = 0u;
              v32 = 0u;
            }
            v22 = v15;
            swift_bridgeObjectRelease();
            if (*((_QWORD *)&v32 + 1))
            {
              sub_2487799E0((uint64_t)v33);
              swift_bridgeObjectRelease();
              sub_24870A40C(&v31, &v34);
              sub_24870A34C(0, &qword_25777DFE0);
              swift_dynamicCast();
              v23 = v30;
              v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777DB68);
              v25 = *(int *)(v24 + 64);
              v26 = *(int *)(v24 + 80);
              *v5 = v8;
              v27 = v8;
              sub_2487B51C8();
              *(_QWORD *)((char *)v5 + v25) = v22;
              *(_QWORD *)((char *)v5 + v26) = v23;
              swift_storeEnumTagMultiPayload();
              v28 = v23;
              sub_24879A788((uint64_t)v5);

              sub_2486EDA68((uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
              return;
            }
LABEL_23:
            __break(1u);
            return;
          }
LABEL_22:
          __break(1u);
          goto LABEL_23;
        }
LABEL_21:
        __break(1u);
        goto LABEL_22;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_21;
  }
}

void sub_24879B0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[2];
  __int128 v23;
  uint64_t v24;

  v3 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  v6 = MEMORY[0x24959B01C](a2 + 16);
  if (v6)
  {
    v7 = (char *)v6;
    sub_2487B4E98();
    if (v24)
    {
      sub_24870A40C(&v23, v22);
      sub_24870A34C(0, &qword_25777DFD8);
      swift_dynamicCast();
      v8 = (void *)v20;
      if ((_QWORD)v20 != *(_QWORD *)&v7[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession])
      {

        return;
      }
      v9 = sub_2487B4EA4();
      if (v9)
      {
        v10 = v9;
        *(_QWORD *)&v23 = sub_2487B5528();
        *((_QWORD *)&v23 + 1) = v11;
        swift_bridgeObjectRetain();
        sub_2487B5A68();
        if (*(_QWORD *)(v10 + 16) && (v12 = sub_248779390((uint64_t)v22), (v13 & 1) != 0))
        {
          sub_2486F0814(*(_QWORD *)(v10 + 56) + 32 * v12, (uint64_t)&v20);
        }
        else
        {
          v20 = 0u;
          v21 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((_QWORD *)&v21 + 1))
        {
          sub_2487799E0((uint64_t)v22);
          swift_bridgeObjectRelease();
          sub_24870A40C(&v20, &v23);
          sub_24870A34C(0, &qword_25445F178);
          swift_dynamicCast();
          v14 = v19;
          v15 = objc_msgSend(v19, sel_unsignedIntegerValue);
          v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25777DB60) + 64);
          *v5 = v8;
          v17 = v8;
          sub_2487B51C8();
          *(_QWORD *)((char *)v5 + v16) = v15;
          swift_storeEnumTagMultiPayload();
          sub_24879A788((uint64_t)v5);

          sub_2486EDA68((uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
          return;
        }
LABEL_15:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
}

void sub_24879B350(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  id v14;
  unsigned __int8 v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  __int128 v20;
  __int128 v21;
  _OWORD v22[2];
  __int128 v23;
  uint64_t v24;

  v3 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  v6 = MEMORY[0x24959B01C](a2 + 16);
  if (v6)
  {
    v7 = (char *)v6;
    sub_2487B4E98();
    if (v24)
    {
      sub_24870A40C(&v23, v22);
      sub_24870A34C(0, &qword_25777DFD8);
      swift_dynamicCast();
      v8 = (void *)v20;
      if ((_QWORD)v20 != *(_QWORD *)&v7[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession])
      {

        return;
      }
      v9 = sub_2487B4EA4();
      if (v9)
      {
        v10 = v9;
        *(_QWORD *)&v23 = sub_2487B5528();
        *((_QWORD *)&v23 + 1) = v11;
        swift_bridgeObjectRetain();
        sub_2487B5A68();
        if (*(_QWORD *)(v10 + 16) && (v12 = sub_248779390((uint64_t)v22), (v13 & 1) != 0))
        {
          sub_2486F0814(*(_QWORD *)(v10 + 56) + 32 * v12, (uint64_t)&v20);
        }
        else
        {
          v20 = 0u;
          v21 = 0u;
        }
        swift_bridgeObjectRelease();
        if (*((_QWORD *)&v21 + 1))
        {
          sub_2487799E0((uint64_t)v22);
          swift_bridgeObjectRelease();
          sub_24870A40C(&v20, &v23);
          sub_24870A34C(0, &qword_25445F178);
          swift_dynamicCast();
          v14 = v19;
          v15 = objc_msgSend(v19, sel_BOOLValue);

          v16 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25777DB58) + 64);
          *v5 = v8;
          v17 = v8;
          sub_2487B51C8();
          *((_BYTE *)v5 + v16) = v15;
          swift_storeEnumTagMultiPayload();
          sub_24879A788((uint64_t)v5);

          sub_2486EDA68((uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
          return;
        }
LABEL_15:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_15;
  }
}

void sub_24879B5C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  void *v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;

  v3 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (void **)((char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  swift_beginAccess();
  v6 = MEMORY[0x24959B01C](a2 + 16);
  if (v6)
  {
    v7 = (char *)v6;
    sub_2487B4E98();
    if (v12)
    {
      sub_24870A40C(&v11, &v13);
      sub_24870A34C(0, &qword_25777DFD8);
      swift_dynamicCast();
      v8 = v10;
      if (v10 == *(void **)&v7[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession])
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_25777DB50);
        *v5 = v8;
        v9 = v8;
        sub_2487B51C8();
        swift_storeEnumTagMultiPayload();
        sub_24879A788((uint64_t)v5);

        sub_2486EDA68((uint64_t)v5, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
      }
      else
      {

      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t TTSVBAudioService.isAudioEngineRunning.getter()
{
  return sub_24879B8F4();
}

uint64_t TTSVBAudioService.isAudioEngineRunningPublisher.getter()
{
  return sub_24879BB40(&qword_25777DB18);
}

uint64_t TTSVBAudioService.isRecording.getter()
{
  return sub_24879B8F4();
}

uint64_t TTSVBAudioService.isRecordingPublisher.getter()
{
  return sub_24879BB40(&qword_25777DB18);
}

uint64_t sub_24879B79C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777DFB8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10[1] = *(_QWORD *)(*(_QWORD *)(a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state)
                     + 24);
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DFC0);
  sub_24871869C(&qword_25777DFC8, &qword_25777DFC0, MEMORY[0x24BDB9D10]);
  sub_2487B53A8();
  swift_release();
  sub_24871869C(&qword_25777DFD0, &qword_25777DFB8, MEMORY[0x24BDB96C0]);
  v8 = sub_2487B539C();
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  *a2 = v8;
  return result;
}

uint64_t sub_24879B8D4@<X0>(uint64_t result@<X0>, BOOL *a2@<X8>)
{
  *a2 = *(_BYTE *)(result + 16) == 0;
  return result;
}

uint64_t TTSVBAudioService.isPlaying.getter()
{
  return sub_24879B8F4();
}

uint64_t sub_24879B8F4()
{
  unsigned __int8 v1;

  sub_2487B5834();
  return v1;
}

uint64_t TTSVBAudioService.isPlayingPublisher.getter()
{
  return sub_24879BB40(&qword_25777DB18);
}

uint64_t TTSVBAudioService.audioMagnitudes.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DB20);
  sub_2487B5834();
  return v1;
}

uint64_t TTSVBAudioService.audioMagnitudesPublisher.getter()
{
  return sub_24879BB40(&qword_25777DB28);
}

double TTSVBAudioService.audioLevel.getter()
{
  double v1;

  sub_2487B5834();
  return v1;
}

uint64_t TTSVBAudioService.audioLevelPublisher.getter()
{
  return sub_24879BB40(&qword_25777DB30);
}

uint64_t TTSVBAudioService.inputSource.getter()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DB38);
  sub_2487B5834();
  return v1;
}

uint64_t TTSVBAudioService.inputSourcePublisher.getter()
{
  return sub_24879BB40(&qword_25777DB40);
}

uint64_t TTSVBAudioService.isInputAvailable.getter()
{
  unsigned __int8 v1;

  sub_2487B5834();
  return v1;
}

uint64_t TTSVBAudioService.isInputAvailablePublisher.getter()
{
  return sub_24879BB40(&qword_25777DB18);
}

uint64_t sub_24879BB40(uint64_t *a1)
{
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(a1);
  sub_2487B5834();
  return v2;
}

uint64_t sub_24879BCC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t ObjCClassFromMetadata;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t result;
  uint64_t v16;
  uint64_t v17;

  swift_getObjectType();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v4 = (void *)sub_2487B5504();
  swift_bridgeObjectRelease();
  v5 = (void *)sub_2487B5504();
  v6 = objc_msgSend(v3, sel_URLForResource_withExtension_, v4, v5);

  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v6)
  {
    v10 = sub_2487B50CC();
    v11 = *(_QWORD *)(v10 - 8);
    MEMORY[0x24BDAC7A8](v10);
    v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2487B509C();

    v14 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v14(v9, v13, v10);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v9, 0, 1, v10);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
    if ((_DWORD)result != 1)
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(a1, v9, v10);
  }
  else
  {
    v16 = sub_2487B50CC();
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v9, 1, 1, v16);
  }
  __break(1u);
  return result;
}

uint64_t TTSVBAudioService.startAudio(_:)(uint64_t a1, uint64_t a2)
{
  return sub_2487A4DF8(a1, a2, (uint64_t)&unk_251996110, (uint64_t)sub_2487AB7DC, (uint64_t)&block_descriptor_7);
}

uint64_t sub_24879BEEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[7];

  v5 = sub_2487B53D8();
  v16 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2487B5408();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24879C240();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  aBlock[4] = sub_248750F0C;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2486F1008;
  aBlock[3] = &block_descriptor_183;
  v13 = _Block_copy(aBlock);
  swift_retain();
  sub_2487B53E4();
  v17 = MEMORY[0x24BEE4AF8];
  sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
  sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
  sub_2487B59FC();
  MEMORY[0x24959A1AC](0, v11, v7, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

void sub_24879C240()
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
  double v12;
  uint64_t v13;
  _QWORD *v14;
  void *v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void (*v24)(uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  __int128 v35;
  char v36;
  uint64_t v37;

  v2 = v0;
  v33 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x24BDAC7A8](v33);
  v34 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = sub_2487B533C();
  v4 = *(_QWORD *)(v37 - 8);
  MEMORY[0x24BDAC7A8](v37);
  v6 = (char *)&v33 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v33 - v8;
  v10 = sub_2487B542C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (uint64_t *)((char *)&v33 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = *(void **)(v2 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *v14 = v15;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v11 + 104))(v14, *MEMORY[0x24BEE5610], v10, v12);
  v16 = v15;
  LOBYTE(v15) = sub_2487B5444();
  (*(void (**)(_QWORD *, uint64_t))(v11 + 8))(v14, v10);
  if ((v15 & 1) != 0)
  {
    sub_2487A2764(*MEMORY[0x24BDB1620]);
    if (!v1)
    {
      v17 = sub_248798770();
      v18 = objc_msgSend(v17, sel_isRunning, v33);

      if ((v18 & 1) != 0)
      {
        v19 = sub_2487B0C04();
        v20 = v37;
        (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v19, v37);
        v21 = sub_2487B5324();
        v22 = sub_2487B57E0();
        if (os_log_type_enabled(v21, v22))
        {
          v23 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v23 = 0;
          _os_log_impl(&dword_2486E6000, v21, v22, "Will not start audio engine. Aready running", v23, 2u);
          MEMORY[0x24959AF80](v23, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v20);
      }
      else
      {
        v24 = *(void (**)(uint64_t))(**(_QWORD **)(*(_QWORD *)(v2
                                                                       + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state)
                                                           + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_bufferHistory)
                                             + 248);
        v25 = swift_retain();
        v24(v25);
        swift_release();
        sub_2487A3AF0();
        v26 = sub_2487B0C04();
        v27 = v37;
        (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v9, v26, v37);
        v28 = sub_2487B5324();
        v29 = sub_2487B57E0();
        if (os_log_type_enabled(v28, v29))
        {
          v30 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v30 = 0;
          _os_log_impl(&dword_2486E6000, v28, v29, "Will start audio engine", v30, 2u);
          v27 = v37;
          MEMORY[0x24959AF80](v30, -1, -1);
        }

        v31 = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v9, v27);
        MEMORY[0x24BDAC7A8](v31);
        *(&v33 - 2) = v2;
        v35 = xmmword_2487C0CC0;
        v36 = 3;
        v32 = (uint64_t)v34;
        swift_storeEnumTagMultiPayload();
        static TTSVBError.perform<A>(_:problem:reason:)((void (*)(uint64_t))sub_2487AE188, (uint64_t)(&v33 - 4), (uint64_t)&v35, v32);
        sub_2486EDA68(v32, type metadata accessor for TTSVBError.Reason);
        LOBYTE(v35) = 1;
        swift_retain();
        sub_2487B5384();
        swift_release();
      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t TTSVBAudioService.stopAudio(_:)(uint64_t a1, uint64_t a2)
{
  return sub_2487A4DF8(a1, a2, (uint64_t)&unk_251996160, (uint64_t)sub_2487AB804, (uint64_t)&block_descriptor_18_2);
}

uint64_t sub_24879C644(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[2];
  _QWORD aBlock[6];

  v6 = sub_2487B53D8();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2487B5408();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24879C844();
  v18[0] = *(_QWORD *)(a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a2;
  *(_QWORD *)(v15 + 24) = a3;
  aBlock[4] = sub_248750F0C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2486F1008;
  aBlock[3] = &block_descriptor_171;
  v16 = _Block_copy(aBlock);
  swift_retain();
  sub_2487B53E4();
  v18[1] = MEMORY[0x24BEE4AF8];
  sub_2486F4CA0((unint64_t *)&unk_25445F670, v7, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
  sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
  sub_2487B59FC();
  MEMORY[0x24959A1AC](0, v14, v10, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release();
}

uint64_t sub_24879C844()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  uint64_t result;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  void (*v19)(uint64_t);
  uint64_t v20;
  _BYTE v21[16];

  v1 = v0;
  v2 = sub_2487B533C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = &v21[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_2487B542C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = &v21[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v11 = *(void **)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *v10 = v11;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v7 + 104))(v10, *MEMORY[0x24BEE5610], v6, v8);
  v12 = v11;
  LOBYTE(v11) = sub_2487B5444();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v7 + 8))(v10, v6);
  if ((v11 & 1) != 0)
  {
    objc_msgSend(*(id *)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode), sel_stop);
    v14 = sub_2487B0C04();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
    v15 = sub_2487B5324();
    v16 = sub_2487B57E0();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_2486E6000, v15, v16, "Will stop audio engine", v17, 2u);
      MEMORY[0x24959AF80](v17, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v3 + 8))(v5, v2);
    v18 = sub_248798770();
    objc_msgSend(v18, sel_stop);

    v19 = *(void (**)(uint64_t))(**(_QWORD **)(*(_QWORD *)(v1
                                                                   + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state)
                                                       + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_bufferHistory)
                                         + 248);
    v20 = swift_retain();
    v19(v20);
    swift_release();
    sub_2487A4314();
    v21[15] = 0;
    swift_retain();
    sub_2487B5384();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t TTSVBAudioService.playAudioFile(_:completion:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  char *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  void *v21;
  char *v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD aBlock[6];

  v25 = a2;
  v26 = a3;
  v5 = sub_2487B53D8();
  v30 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2487B5408();
  v28 = *(_QWORD *)(v8 - 8);
  v29 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = *(_QWORD *)&v3[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  v11 = sub_2487B50CC();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v12 + 16))(v15, a1, v11, v14);
  v16 = (*(unsigned __int8 *)(v12 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v17 = (v13 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = v3;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v18 + v16, v15, v11);
  v19 = (_QWORD *)(v18 + v17);
  v20 = v26;
  *v19 = v25;
  v19[1] = v20;
  aBlock[4] = sub_2487AB8A4;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2486F1008;
  aBlock[3] = &block_descriptor_24_2;
  v21 = _Block_copy(aBlock);
  v22 = v3;
  swift_retain();
  sub_2487B53E4();
  v31 = MEMORY[0x24BEE4AF8];
  sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
  sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
  sub_2487B59FC();
  MEMORY[0x24959A1AC](0, v10, v7, v21);
  _Block_release(v21);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v10, v29);
  return swift_release();
}

uint64_t sub_24879CCF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t (*v8)(uint64_t);
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[2];
  _QWORD aBlock[6];

  v7 = sub_2487B53D8();
  v8 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v18[0] = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2487B5408();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24879CF00(a2);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a3;
  *(_QWORD *)(v15 + 24) = a4;
  aBlock[4] = sub_248750F0C;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2486F1008;
  aBlock[3] = &block_descriptor_159;
  v16 = _Block_copy(aBlock);
  swift_retain();
  sub_2487B53E4();
  v18[1] = MEMORY[0x24BEE4AF8];
  sub_2486F4CA0((unint64_t *)&unk_25445F670, v8, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
  sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
  sub_2487B59FC();
  MEMORY[0x24959A1AC](0, v14, v10, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v18[0] + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release();
}

void sub_24879CF00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  char *v19;
  NSObject *v20;
  os_log_type_t v21;
  _BOOL4 v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  void (*v45)(char *, char *, uint64_t);
  id v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void (*v55)(char *, uint64_t);
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63[3];

  v3 = sub_2487B533C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_2487B542C();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (uint64_t *)((char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  v12 = *(void **)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *v11 = v12;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v8 + 104))(v11, *MEMORY[0x24BEE5610], v7, v9);
  v13 = v12;
  LOBYTE(v12) = sub_2487B5444();
  (*(void (**)(_QWORD *, uint64_t))(v8 + 8))(v11, v7);
  if ((v12 & 1) != 0)
  {
    v59 = v1;
    v14 = sub_2487B0C04();
    v57 = v4;
    v58 = v3;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v14, v3);
    v15 = sub_2487B50CC();
    v16 = *(_QWORD *)(v15 - 8);
    v17 = MEMORY[0x24BDAC7A8](v15);
    v61 = v18;
    v19 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, double))(v16 + 16))(v19, a1, v15, v17);
    v20 = sub_2487B5324();
    v21 = sub_2487B57E0();
    v22 = os_log_type_enabled(v20, v21);
    v60 = a1;
    if (v22)
    {
      v23 = swift_slowAlloc();
      v54 = (uint64_t)&v54;
      v24 = (uint8_t *)v23;
      v25 = swift_slowAlloc();
      v56 = v16;
      v26 = v25;
      v63[0] = v25;
      *(_DWORD *)v24 = 136315138;
      v27 = sub_2487B50B4();
      v62 = sub_2486EDE5C(v27, v28, v63);
      sub_2487B593C();
      swift_bridgeObjectRelease();
      v29 = v15;
      v55 = *(void (**)(char *, uint64_t))(v56 + 8);
      v55(v19, v15);
      _os_log_impl(&dword_2486E6000, v20, v21, "Will play audio file: %s", v24, 0xCu);
      swift_arrayDestroy();
      v30 = v26;
      v16 = v56;
      MEMORY[0x24959AF80](v30, -1, -1);
      MEMORY[0x24959AF80](v24, -1, -1);
    }
    else
    {
      v29 = v15;
      v55 = *(void (**)(char *, uint64_t))(v16 + 8);
      v55(v19, v15);
    }

    v31 = (*(uint64_t (**)(char *, uint64_t))(v57 + 8))(v6, v58);
    MEMORY[0x24BDAC7A8](v31);
    v33 = (char *)&v54 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
    MEMORY[0x24BDAC7A8](v34);
    v36 = (char *)&v54 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
    v37 = sub_248798934();
    v38 = objc_msgSend(v37, sel_currentItem);

    if (v38)
    {
      v39 = objc_msgSend(v38, sel_asset);

      if (v39)
      {
        objc_opt_self();
        v40 = (void *)swift_dynamicCastObjCClass();
        if (v40)
        {
          v41 = objc_msgSend(v40, sel_URL);

          MEMORY[0x24BDAC7A8](v42);
          v44 = (char *)&v54 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
          sub_2487B509C();

          v45 = *(void (**)(char *, char *, uint64_t))(v16 + 32);
          v45(v36, v44, v29);
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v36, 0, 1, v29);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v36, 1, v29) != 1)
          {
            v45(v33, v36, v29);
            if ((MEMORY[0x2495999F0](v33, v60) & 1) != 0)
            {
              v46 = sub_248798934();
              v47 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
              v63[0] = *MEMORY[0x24BDC0D88];
              v63[1] = *(_QWORD *)(MEMORY[0x24BDC0D88] + 8);
              v63[2] = v47;
              objc_msgSend(v46, sel_seekToTime_, v63);

              v48 = sub_248798934();
              objc_msgSend(v48, sel_play);

              v55(v33, v29);
              return;
            }
            v55(v33, v29);
            goto LABEL_14;
          }
LABEL_13:
          sub_2486F5008((uint64_t)v36, &qword_25445ED28);
LABEL_14:
          v49 = (void *)sub_2487B503C();
          v50 = objc_msgSend((id)objc_opt_self(), sel_assetWithURL_, v49);

          v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDB2618]), sel_initWithAsset_, v50);
          v52 = sub_248798934();
          objc_msgSend(v52, sel_replaceCurrentItemWithPlayerItem_, v51);

          v53 = sub_248798934();
          objc_msgSend(v53, sel_play);

          return;
        }

      }
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v16 + 56))(v36, 1, 1, v29);
    goto LABEL_13;
  }
  __break(1u);
}

uint64_t TTSVBAudioService.stopRecording(completion:)(uint64_t a1, uint64_t a2)
{
  return sub_2487A4DF8(a1, a2, (uint64_t)&unk_251996200, (uint64_t)sub_2487AB8F0, (uint64_t)&block_descriptor_30_2);
}

uint64_t sub_24879D4FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[2];
  _QWORD aBlock[6];

  v6 = sub_2487B53D8();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2487B5408();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24879D6FC();
  v18[0] = *(_QWORD *)(a1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_calloutQueue);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a2;
  *(_QWORD *)(v15 + 24) = a3;
  aBlock[4] = sub_24874E4D0;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2486F1008;
  aBlock[3] = &block_descriptor_147;
  v16 = _Block_copy(aBlock);
  swift_retain();
  sub_2487B53E4();
  v18[1] = MEMORY[0x24BEE4AF8];
  sub_2486F4CA0((unint64_t *)&unk_25445F670, v7, MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
  sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
  sub_2487B59FC();
  MEMORY[0x24959A1AC](0, v14, v10, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release();
}

uint64_t sub_24879D6FC()
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
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  _QWORD *v13;
  void *v14;
  id v15;
  uint64_t result;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  int v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  double v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[2];
  unsigned __int8 v44;
  Swift::UInt64_optional v45;
  Swift::UInt64_optional v46;

  v1 = v0;
  v2 = sub_2487B533C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v40 - v7;
  v9 = sub_2487B542C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v13 = (uint8_t **)((char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = *(void **)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *v13 = v14;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v10 + 104))(v13, *MEMORY[0x24BEE5610], v9, v11);
  v15 = v14;
  LOBYTE(v14) = sub_2487B5444();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v10 + 8))(v13, v9);
  if ((v14 & 1) != 0)
  {
    v17 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state;
    swift_retain();
    sub_2487B5378();
    swift_release();
    if (v44)
    {
      v18 = sub_2487B0C04();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v18, v2);
      v19 = sub_2487B5324();
      v20 = sub_2487B57D4();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_2486E6000, v19, v20, "Cannot stop recording. isRecording already false", v21, 2u);
        MEMORY[0x24959AF80](v21, -1, -1);
      }

      return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    }
    else
    {
      (*(void (**)(_QWORD))((*MEMORY[0x24BEE4EA0] & **(_QWORD **)(v1
                                                                           + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_speechRecognitionService))
                                     + 0x1B0))(0);
      swift_retain();
      sub_2487B5378();
      v22 = v43[0];
      v23 = v44;
      v45.value = 0;
      v45.is_nil = 1;
      v24 = TTSVBTimestampInSeconds(when:)(v45);
      if (!v23 || (v25 = 0, v23 == 1))
        v25 = v22;
      v43[0] = v25;
      *(double *)&v43[1] = v24;
      v44 = 1;
      sub_2487B5384();
      swift_release();
      v26 = sub_2487B0C04();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v8, v26, v2);
      v27 = sub_2487B5324();
      v28 = sub_2487B57E0();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        v41 = swift_slowAlloc();
        v43[0] = v41;
        *(_DWORD *)v29 = 136315138;
        v40 = v29 + 4;
        v46.value = 0;
        v46.is_nil = 1;
        v30 = TTSVBTimestampInSeconds(when:)(v46);
        v31 = sub_248729E14(v30);
        v42 = sub_2486EDE5C(v31, v32, v43);
        sub_2487B593C();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2486E6000, v27, v28, "StopRecording. hostTime=%s", v29, 0xCu);
        v33 = v41;
        swift_arrayDestroy();
        MEMORY[0x24959AF80](v33, -1, -1);
        MEMORY[0x24959AF80](v29, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v34 = *(_QWORD *)(v1 + v17);
      v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
      MEMORY[0x24BDAC7A8](v35);
      v37 = (char *)&v40 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
      v38 = sub_2487B50CC();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v37, 1, 1, v38);
      v39 = v34
          + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioFileURL;
      swift_beginAccess();
      swift_retain();
      sub_2487ADFB4((uint64_t)v37, v39);
      swift_endAccess();
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t TTSVBAudioService.beginNewRecording(expectedSpeech:localeInfo:recordingEnvironment:audioFileURL:completion:)(uint64_t a1, uint64_t a2, __int128 *a3, unsigned __int8 *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  double v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  unint64_t v29;
  _QWORD *v30;
  void (*v31)(char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t);
  void *v36;
  uint64_t v37;
  double v38;
  char *v39;
  _QWORD *v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  char *v47;
  __int128 v48;
  __int128 v49;
  _QWORD *v50;
  uint64_t v51;
  void *v52;
  id v53;
  char *v54;
  char *v55;
  uint64_t v56;
  _QWORD v58[2];
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t, uint64_t, double);
  _QWORD *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t aBlock[6];
  __int128 v78;
  __int128 v79;
  __int128 v80;

  v69 = a7;
  v66 = a6;
  v67 = a2;
  v65 = a1;
  v10 = sub_2487B53D8();
  v74 = *(_QWORD *)(v10 - 8);
  v75 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v73 = (char *)v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2487B5408();
  v71 = *(_QWORD *)(v12 - 8);
  v72 = v12;
  MEMORY[0x24BDAC7A8](v12);
  v70 = (char *)v58 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2487B533C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v58 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a3[1];
  v78 = *a3;
  v79 = v18;
  v80 = a3[2];
  v64 = *a4;
  v19 = sub_2487B0C04();
  v63 = (_QWORD *)v15;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, v19, v14);
  v20 = sub_2487B50CC();
  v21 = *(_QWORD **)(v20 - 8);
  v22 = v21[8];
  v23 = MEMORY[0x24BDAC7A8](v20);
  v62 = (void (*)(char *, uint64_t, uint64_t, double))v21[2];
  v62((char *)v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), a5, v20, v23);
  v24 = sub_2487B5324();
  v25 = sub_2487B57E0();
  if (os_log_type_enabled(v24, v25))
  {
    v26 = swift_slowAlloc();
    v60 = v14;
    v27 = (uint8_t *)v26;
    v59 = swift_slowAlloc();
    aBlock[0] = v59;
    v61 = a5;
    *(_DWORD *)v27 = 136315138;
    v58[1] = v27 + 4;
    v28 = sub_2487B5018();
    v76 = sub_2486EDE5C(v28, v29, aBlock);
    a5 = v61;
    sub_2487B593C();
    swift_bridgeObjectRelease();
    v30 = v21;
    v31 = (void (*)(char *, uint64_t))v21[1];
    v32 = v20;
    v31((char *)v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v20);
    _os_log_impl(&dword_2486E6000, v24, v25, "Will begin new recording: %s", v27, 0xCu);
    v33 = v59;
    swift_arrayDestroy();
    MEMORY[0x24959AF80](v33, -1, -1);
    MEMORY[0x24959AF80](v27, -1, -1);

    v34 = ((uint64_t (*)(char *, uint64_t))v63[1])(v17, v60);
  }
  else
  {
    v30 = v21;
    v35 = (void (*)(char *, uint64_t))v21[1];
    v32 = v20;
    v35((char *)v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0), v20);

    v34 = ((uint64_t (*)(char *, uint64_t))v63[1])(v17, v14);
  }
  v63 = v58;
  v36 = v68;
  v61 = *(_QWORD *)&v68[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  v37 = *(_QWORD *)&v68[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state];
  v38 = MEMORY[0x24BDAC7A8](v34);
  v39 = (char *)v58 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62(v39, a5, v32, v38);
  v40 = v30;
  v41 = (*((unsigned __int8 *)v30 + 80) + 24) & ~(unint64_t)*((unsigned __int8 *)v30 + 80);
  v42 = (v22 + v41 + 7) & 0xFFFFFFFFFFFFFFF8;
  v43 = (v42 + 15) & 0xFFFFFFFFFFFFFFF8;
  v62 = (void (*)(char *, uint64_t, uint64_t, double))((v43 + 23) & 0xFFFFFFFFFFFFFFF8);
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = v37;
  ((void (*)(unint64_t, char *, uint64_t))v40[4])(v44 + v41, v39, v32);
  *(_QWORD *)(v44 + v42) = v36;
  v45 = (_QWORD *)(v44 + v43);
  v46 = v67;
  *v45 = v65;
  v45[1] = v46;
  v47 = (char *)v62 + v44;
  v48 = v80;
  v49 = v78;
  *((_OWORD *)v47 + 1) = v79;
  *((_OWORD *)v47 + 2) = v48;
  *(_OWORD *)v47 = v49;
  v47[48] = v64;
  v50 = (_QWORD *)(v44 + ((v43 + 79) & 0xFFFFFFFFFFFFFFF8));
  v51 = v69;
  *v50 = v66;
  v50[1] = v51;
  aBlock[4] = (uint64_t)sub_2487AB9E0;
  aBlock[5] = v44;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_2486F1008;
  aBlock[3] = (uint64_t)&block_descriptor_36;
  v52 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain_n();
  v53 = v36;
  sub_24875D240((uint64_t)&v78);
  swift_retain();
  v54 = v70;
  sub_2487B53E4();
  v76 = MEMORY[0x24BEE4AF8];
  sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
  sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
  v55 = v73;
  v56 = v75;
  sub_2487B59FC();
  MEMORY[0x24959A1AC](0, v54, v55, v52);
  _Block_release(v52);
  swift_release();
  (*(void (**)(char *, uint64_t))(v74 + 8))(v55, v56);
  (*(void (**)(char *, uint64_t))(v71 + 8))(v54, v72);
  return swift_release();
}

void sub_24879E124(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, __int128 *a6, int a7, uint64_t a8, uint64_t a9)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
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
  void (*v28)(char *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  char *v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void (*v41)(char *);
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  unint64_t v53;
  void (*v54)(char *, uint64_t, uint64_t, uint64_t, double);
  uint64_t v55;
  uint64_t v56;
  double v57;
  id v58;
  char *v59;
  char *v60;
  uint64_t v61;
  char v62;
  NSObject *v63;
  os_log_type_t v64;
  uint8_t *v65;
  _QWORD *v66;
  __int128 v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  void *v71;
  id v72;
  char *v73;
  char *v74;
  uint64_t v75;
  id v76;
  id v77;
  unint64_t v78;
  id v79;
  void *v80;
  id v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  _QWORD *v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  _QWORD v89[2];
  uint64_t v90;
  _QWORD *v91;
  void (*v92)(char *, uint64_t, uint64_t);
  void (*v93)(char *, uint64_t, uint64_t, double);
  uint64_t v94;
  int v95;
  __int128 *v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  __int128 aBlock;
  __int128 v114;
  __int128 v115;

  v108 = a8;
  v95 = a7;
  v96 = a6;
  v98 = a5;
  v97 = a4;
  v111 = a2;
  v107 = a9;
  v11 = sub_2487B53D8();
  v104 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v103 = (char *)v89 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_2487B5408();
  v101 = *(_QWORD *)(v13 - 8);
  v102 = v13;
  MEMORY[0x24BDAC7A8](v13);
  v100 = (char *)v89 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)v89 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2487B533C();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v99 = (char *)v89 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v89 - v22;
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)v89 - v25;
  v106 = a1;
  swift_retain();
  sub_2487B5378();
  swift_release();
  LODWORD(a1) = v114;
  v27 = sub_2487B0C04();
  v109 = v19;
  v110 = a3;
  v28 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v105 = v11;
  if (!(_DWORD)a1)
  {
    v43 = v108;
    v28(v26, v27, v18);
    v44 = sub_2487B5324();
    v45 = sub_2487B57D4();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_2486E6000, v44, v45, "Cannot begin recording. isRecording already true", v46, 2u);
      MEMORY[0x24959AF80](v46, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v109 + 8))(v26, v18);
    aBlock = xmmword_2487C0CD0;
    LOBYTE(v114) = 3;
    swift_storeEnumTagMultiPayload();
    type metadata accessor for TTSVBError(0);
    sub_2486F4CA0((unint64_t *)&qword_25445ED48, type metadata accessor for TTSVBError, (uint64_t)&protocol conformance descriptor for TTSVBError);
    v47 = (void *)swift_allocError();
    TTSVBError.init(_:_:_:)((uint64_t)&aBlock, (uint64_t)v17, 0, v48);
    swift_willThrow();
    v69 = (_QWORD *)swift_allocObject();
    v70 = v107;
    v69[2] = v43;
    v69[3] = v70;
    v69[4] = v47;
    *(_QWORD *)&v115 = sub_2487AE9F0;
    *((_QWORD *)&v115 + 1) = v69;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    *(_QWORD *)&v114 = sub_2486F1008;
    *((_QWORD *)&v114 + 1) = &block_descriptor_132;
    v71 = _Block_copy(&aBlock);
    swift_retain();
    v72 = v47;
    v73 = v100;
    sub_2487B53E4();
    v112 = MEMORY[0x24BEE4AF8];
    sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
    sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
    v74 = v103;
    v75 = v105;
    sub_2487B59FC();
    MEMORY[0x24959A1AC](0, v73, v74, v71);
    _Block_release(v71);

    (*(void (**)(char *, uint64_t))(v104 + 8))(v74, v75);
    (*(void (**)(char *, uint64_t))(v101 + 8))(v73, v102);
    goto LABEL_21;
  }
  v94 = v27;
  v92 = v28;
  ((void (*)(char *))v28)(v23);
  v29 = sub_2487B50CC();
  v30 = *(_QWORD *)(v29 - 8);
  v31 = MEMORY[0x24BDAC7A8](v29);
  v33 = (char *)v89 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = *(void (**)(char *, uint64_t, uint64_t, double))(v30 + 16);
  v93(v33, v111, v29, v31);
  v34 = sub_2487B5324();
  v35 = sub_2487B57BC();
  if (os_log_type_enabled(v34, v35))
  {
    v36 = swift_slowAlloc();
    v90 = v18;
    v91 = v89;
    v37 = (uint8_t *)v36;
    v38 = swift_slowAlloc();
    *(_QWORD *)&aBlock = v38;
    *(_DWORD *)v37 = 136315138;
    v89[1] = v37 + 4;
    v39 = sub_2487B50B4();
    v112 = sub_2486EDE5C(v39, v40, (uint64_t *)&aBlock);
    sub_2487B593C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v29);
    _os_log_impl(&dword_2486E6000, v34, v35, "Will begin new audio recording: %s", v37, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24959AF80](v38, -1, -1);
    MEMORY[0x24959AF80](v37, -1, -1);

    v41 = *(void (**)(char *))(v109 + 8);
    v42 = v90;
    v41(v23);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v30 + 8))(v33, v29);

    v42 = v18;
    v49 = v18;
    v41 = *(void (**)(char *))(v109 + 8);
    ((void (*)(char *, uint64_t))v41)(v23, v49);
  }
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  v51 = *(_QWORD *)(*(_QWORD *)(v50 - 8) + 64);
  v52 = MEMORY[0x24BDAC7A8](v50);
  v53 = (v51 + 15) & 0xFFFFFFFFFFFFFFF0;
  v54 = *(void (**)(char *, uint64_t, uint64_t, uint64_t, double))(v30 + 56);
  v54((char *)v89 - v53, 1, 1, v29, v52);
  v55 = v106
      + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioFileURL;
  swift_beginAccess();
  v56 = sub_2487ADFB4((uint64_t)v89 - v53, v55);
  v57 = MEMORY[0x24BDAC7A8](v56);
  v93((char *)v89 - v53, v111, v29, v57);
  ((void (*)(char *, _QWORD, uint64_t, uint64_t))v54)((char *)v89 - v53, 0, 1, v29);
  sub_2486F5008(v55, &qword_25445ED28);
  sub_2486F4F70((uint64_t)v89 - v53, v55, &qword_25445ED28);
  swift_endAccess();
  v58 = (id)*sub_2487274FC();
  NSUserDefaults.ttsvb_recordingMode.getter();

  if (aBlock == 2)
  {
    v59 = v110;
    v60 = v99;
    v61 = v94;
  }
  else
  {
    v59 = v110;
    v60 = v99;
    v61 = v94;
    if ((aBlock & 1) != 0)
      goto LABEL_14;
  }
  v62 = v95 & 1;
  v92(v60, v61, v42);
  v63 = sub_2487B5324();
  v64 = sub_2487B57BC();
  if (os_log_type_enabled(v63, v64))
  {
    v65 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v65 = 0;
    _os_log_impl(&dword_2486E6000, v63, v64, "Will generate new speech recognition task", v65, 2u);
    MEMORY[0x24959AF80](v65, -1, -1);
  }

  ((void (*)(char *, uint64_t))v41)(v60, v42);
  v66 = *(_QWORD **)&v59[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_speechRecognitionService];
  v67 = v96[1];
  aBlock = *v96;
  v114 = v67;
  v115 = v96[2];
  LOBYTE(v112) = v62;
  (*(void (**)(uint64_t, uint64_t, __int128 *, uint64_t *))((*MEMORY[0x24BEE4EA0] & *v66) + 0x1A0))(v97, v98, &aBlock, &v112);
LABEL_14:
  sub_24879C240();
  v68 = v108;
  v76 = objc_msgSend(*(id *)&v59[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession], sel_currentRoute);
  v77 = objc_msgSend(v76, sel_inputs);

  sub_24870A34C(0, &qword_25777DB48);
  v78 = sub_2487B5684();

  if (v78 >> 62)
  {
    swift_bridgeObjectRetain();
    v88 = sub_2487B5B64();
    swift_bridgeObjectRelease();
    if (!v88)
      goto LABEL_20;
  }
  else if (!*(_QWORD *)((v78 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_20:
    swift_bridgeObjectRelease();
    LOBYTE(aBlock) = 0;
    v85 = (_QWORD *)swift_allocObject();
    v86 = v107;
    v85[2] = v106;
    v85[3] = v59;
    v85[4] = v68;
    v85[5] = v86;
    swift_retain();
    v87 = v59;
    swift_retain();
    sub_24879EF48((unsigned __int8 *)&aBlock, (uint64_t)sub_2487AE608, (uint64_t)v85);
LABEL_21:
    swift_release();
    return;
  }
  if ((v78 & 0xC000000000000001) != 0)
  {
    v79 = (id)MEMORY[0x24959A434](0, v78);
    goto LABEL_19;
  }
  if (*(_QWORD *)((v78 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v79 = *(id *)(v78 + 32);
LABEL_19:
    v80 = v79;
    swift_bridgeObjectRelease();
    v81 = objc_msgSend(v80, sel_portType);
    v82 = sub_2487B5528();
    v84 = v83;

    static TTSVBAnalytics.beganRecording(inputSourceName:)(v82, v84);
    goto LABEL_20;
  }
  __break(1u);
}

uint64_t sub_24879EB6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  double v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  void *v28;
  char *v29;
  char *v30;
  _QWORD v32[2];
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  double aBlock;
  uint64_t v42;
  uint64_t (*v43)(uint64_t);
  void *v44;
  uint64_t (*v45)();
  uint64_t v46;
  Swift::UInt64_optional v47;

  v7 = sub_2487B53D8();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v39 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2487B5408();
  v37 = *(_QWORD *)(v10 - 8);
  v38 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v36 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2487B533C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47.value = 0;
  v47.is_nil = 1;
  v16 = TTSVBTimestampInSeconds(when:)(v47);
  aBlock = v16;
  v42 = 0;
  LOBYTE(v43) = 0;
  swift_retain();
  sub_2487B5384();
  swift_release();
  v17 = sub_2487B0C04();
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v17, v12);
  v18 = sub_2487B5324();
  v19 = sub_2487B57E0();
  if (os_log_type_enabled(v18, v19))
  {
    v33 = a3;
    v20 = swift_slowAlloc();
    v35 = v7;
    v21 = (uint8_t *)v20;
    v22 = swift_slowAlloc();
    v32[1] = a2;
    v23 = v22;
    aBlock = *(double *)&v22;
    v34 = v8;
    *(_DWORD *)v21 = 136315138;
    v24 = sub_248729E14(v16);
    v32[0] = v12;
    v40 = sub_2486EDE5C(v24, v25, (uint64_t *)&aBlock);
    a3 = v33;
    v8 = v34;
    sub_2487B593C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2486E6000, v18, v19, "StartRecording. hostTime=%s", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24959AF80](v23, -1, -1);
    v26 = v21;
    v7 = v35;
    MEMORY[0x24959AF80](v26, -1, -1);

    (*(void (**)(char *, _QWORD))(v13 + 8))(v15, v32[0]);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  }
  v27 = swift_allocObject();
  *(_QWORD *)(v27 + 16) = a3;
  *(_QWORD *)(v27 + 24) = a4;
  v45 = sub_248750F0C;
  v46 = v27;
  aBlock = MEMORY[0x24BDAC760];
  v42 = 1107296256;
  v43 = sub_2486F1008;
  v44 = &block_descriptor_141;
  v28 = _Block_copy(&aBlock);
  swift_retain();
  v29 = v36;
  sub_2487B53E4();
  v40 = MEMORY[0x24BEE4AF8];
  sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
  sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
  v30 = v39;
  sub_2487B59FC();
  MEMORY[0x24959A1AC](0, v29, v30, v28);
  _Block_release(v28);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v30, v7);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v29, v38);
  return swift_release();
}

void sub_24879EF48(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  void *v26;
  id v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  void *v32;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v34;
  _BYTE *v35;
  uint64_t v36;
  char *v37;
  NSObject *v38;
  os_log_type_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  _BYTE v54[32];
  uint64_t v55;
  _BYTE *v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  _BYTE *v60;
  _BYTE *v61;
  uint64_t v62;
  _BYTE *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t aBlock[8];

  v4 = v3;
  v68 = a2;
  v66 = (_QWORD *)sub_2487B53D8();
  v64 = *(v66 - 1);
  MEMORY[0x24BDAC7A8](v66);
  v63 = &v54[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v65 = sub_2487B5408();
  v62 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v61 = &v54[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v69 = sub_2487B533C();
  v9 = *(_QWORD *)(v69 - 8);
  MEMORY[0x24BDAC7A8](v69);
  v60 = &v54[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v11);
  MEMORY[0x24BDAC7A8](v12);
  v14 = &v54[-v13];
  v15 = sub_2487B542C();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x24BDAC7A8](v15);
  v19 = &v54[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v20 = *(void **)&v4[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  LODWORD(v67) = *a1;
  *v19 = v20;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v16 + 104))(v19, *MEMORY[0x24BEE5610], v15, v17);
  v21 = v20;
  LOBYTE(a1) = sub_2487B5444();
  (*(void (**)(_QWORD *, uint64_t))(v16 + 8))(v19, v15);
  if ((a1 & 1) != 0)
  {
    sub_24879C240();
    v56 = v14;
    v22 = (uint64_t *)&v4[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_cachedSoundEffects];
    swift_beginAccess();
    v23 = *v22;
    if (*(_QWORD *)(*v22 + 16) && (v24 = sub_2487AA614(v67), (v25 & 1) != 0))
    {
      v26 = *(void **)(*(_QWORD *)(v23 + 56) + 8 * v24);
      swift_endAccess();
      v27 = v26;
      v28 = v67;
    }
    else
    {
      v59 = v21;
      v55 = a3;
      swift_endAccess();
      v57 = sub_2487B50CC();
      v29 = *(_QWORD *)(v57 - 8);
      v30 = *(_QWORD *)(v29 + 64);
      MEMORY[0x24BDAC7A8](v57);
      v31 = v67;
      LOBYTE(aBlock[0]) = v67;
      sub_24879BCC8((uint64_t)&v54[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)]);
      v32 = (void *)static TTSVBAudioTools.readPCMBuffer(fromAudioFile:)((uint64_t)&v54[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)]);
      (*(void (**)(_BYTE *, uint64_t))(v29 + 8))(&v54[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)], v57);
      swift_beginAccess();
      v27 = v32;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v70 = *v22;
      *v22 = 0x8000000000000000;
      sub_2487AAAE4((uint64_t)v27, v31, isUniquelyReferenced_nonNull_native);
      *v22 = v70;
      swift_bridgeObjectRelease();
      swift_endAccess();
      v28 = v31;
      a3 = v55;
    }
    v66 = v27;
    v34 = sub_2487B0C04();
    v35 = v56;
    v36 = v69;
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 16))(v56, v34, v69);
    v37 = v4;
    v38 = sub_2487B5324();
    v39 = sub_2487B57BC();
    v40 = &unk_25777D000;
    if (os_log_type_enabled(v38, v39))
    {
      v41 = swift_slowAlloc();
      v42 = swift_slowAlloc();
      aBlock[0] = v42;
      v43 = "recordingWillStart";
      *(_DWORD *)v41 = 136315394;
      if (v28)
        v43 = "recordingDidFinish";
      v58 = v9;
      v70 = sub_2486EDE5C(0xD000000000000012, (unint64_t)(v43 - 32) | 0x8000000000000000, aBlock);
      LOBYTE(v28) = v67;
      sub_2487B593C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v41 + 12) = 1024;
      v44 = objc_msgSend(*(id *)&v37[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioPlayerNode], sel_isPlaying);

      LODWORD(v70) = v44;
      sub_2487B593C();

      _os_log_impl(&dword_2486E6000, v38, v39, "Asked to play sound effect '%s'. Scheduling audio file. isPlaying=%{BOOL}d", (uint8_t *)v41, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x24959AF80](v42, -1, -1);
      v45 = v41;
      v40 = (_QWORD *)&unk_25777D000;
      MEMORY[0x24959AF80](v45, -1, -1);

      (*(void (**)(_BYTE *, uint64_t))(v58 + 8))(v35, v69);
    }
    else
    {

      (*(void (**)(_BYTE *, uint64_t))(v9 + 8))(v35, v36);
    }
    v46 = v68;
    v47 = v40[344];
    v48 = *(void **)&v37[v47];
    v49 = swift_allocObject();
    swift_unknownObjectWeakInit();
    v50 = swift_allocObject();
    *(_BYTE *)(v50 + 16) = v28;
    *(_QWORD *)(v50 + 24) = v49;
    *(_QWORD *)(v50 + 32) = 0;
    *(_QWORD *)(v50 + 40) = v46;
    *(_QWORD *)(v50 + 48) = a3;
    aBlock[4] = (uint64_t)sub_2487AE174;
    aBlock[5] = v50;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_248725E5C;
    aBlock[3] = (uint64_t)&block_descriptor_116_0;
    v51 = _Block_copy(aBlock);
    swift_retain();
    v52 = v48;
    swift_release();
    v53 = v66;
    objc_msgSend(v52, sel_scheduleBuffer_atTime_options_completionCallbackType_completionHandler_, v66, 0, 0, 2, v51);

    _Block_release(v51);
    objc_msgSend(*(id *)&v37[v47], sel_play);

  }
  else
  {
    __break(1u);
  }
}

uint64_t TTSVBAudioService.finishCurrentRecording(outputFormat:audioOverrides:userPhrase:userScore:sampleID:completion:)(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  char *v9;
  char *v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  int v24;
  uint64_t v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint8_t *v32;
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  char *v41;
  uint64_t v42;
  char *v44;
  int v45;
  int v46;
  void *v47;
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
  _QWORD aBlock[7];

  v10 = v9;
  v50 = a6;
  v51 = a8;
  v48 = a3;
  v49 = a5;
  v52 = a4;
  v13 = a9;
  v14 = sub_2487B53D8();
  v55 = *(_QWORD *)(v14 - 8);
  v56 = v14;
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v44 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_2487B5408();
  v53 = *(_QWORD *)(v17 - 8);
  v54 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v44 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_2487B533C();
  v21 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v44 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = *a2;
  v45 = a2[1];
  v46 = v24;
  v47 = (void *)*((_QWORD *)a2 + 1);
  v25 = sub_2487B0C04();
  (*(void (**)(char *, uint64_t, uint64_t))(v21 + 16))(v23, v25, v20);
  v26 = sub_2487B5324();
  v27 = sub_2487B57E0();
  if (os_log_type_enabled(v26, v27))
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v44 = v10;
    v29 = v19;
    v30 = v16;
    v31 = a7;
    v32 = v28;
    *(_WORD *)v28 = 0;
    _os_log_impl(&dword_2486E6000, v26, v27, "Will finish current recording", v28, 2u);
    v33 = v32;
    a7 = v31;
    v16 = v30;
    v19 = v29;
    v13 = a9;
    v10 = v44;
    MEMORY[0x24959AF80](v33, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  v34 = *(_QWORD *)&v10[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state];
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = v34;
  *(_QWORD *)(v35 + 24) = v10;
  *(_BYTE *)(v35 + 32) = v46;
  *(_BYTE *)(v35 + 33) = v45;
  v37 = v47;
  v36 = v48;
  *(_QWORD *)(v35 + 40) = v47;
  *(_QWORD *)(v35 + 48) = v36;
  v38 = v49;
  *(_QWORD *)(v35 + 56) = v52;
  *(_QWORD *)(v35 + 64) = v38;
  *(_QWORD *)(v35 + 72) = v50;
  *(_QWORD *)(v35 + 80) = a7;
  *(_QWORD *)(v35 + 88) = v51;
  *(_QWORD *)(v35 + 96) = v13;
  aBlock[4] = sub_2487ABAB0;
  aBlock[5] = v35;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2486F1008;
  aBlock[3] = &block_descriptor_42;
  v39 = _Block_copy(aBlock);
  v40 = v37;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain_n();
  v41 = v10;
  sub_2487B53E4();
  v57 = MEMORY[0x24BEE4AF8];
  sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
  sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
  v42 = v56;
  sub_2487B59FC();
  MEMORY[0x24959A1AC](0, v19, v16, v39);
  _Block_release(v39);
  swift_release();
  (*(void (**)(char *, uint64_t))(v55 + 8))(v16, v42);
  (*(void (**)(char *, uint64_t))(v53 + 8))(v19, v54);
  return swift_release();
}

uint64_t sub_24879FF38(uint64_t a1, char *a2, unsigned int a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t (*a9)(uint64_t, uint64_t, uint64_t), uint64_t a10, uint64_t a11)
{
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE *v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  int v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  _BYTE *v45;
  NSObject *v46;
  os_log_type_t v47;
  uint64_t v48;
  uint8_t *v49;
  uint64_t v50;
  double v51;
  uint64_t v52;
  unint64_t v53;
  _QWORD *v54;
  _BYTE *v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t (*v58)(uint64_t, double, double);
  uint64_t v59;
  unint64_t v60;
  NSObject *v61;
  int v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t result;
  uint64_t v68;
  double v69;
  id v70;
  void *v71;
  id v72;
  double v73;
  double v74;
  os_log_t v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  NSObject *v80;
  os_log_type_t v81;
  uint64_t v82;
  uint64_t v83;
  id v84;
  id v85;
  void (*v86)(_QWORD, _QWORD, _QWORD);
  void *v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t, uint64_t);
  uint64_t v97;
  uint64_t v98;
  double v99;
  uint64_t v100;
  _QWORD *v101;
  void (*v102)(_BYTE *, _QWORD *);
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  int64_t v108;
  uint64_t v109;
  uint64_t v110;
  _BYTE *v111;
  uint64_t (*v112)(uint64_t, uint64_t, uint64_t);
  uint64_t v113;
  double v114;
  uint64_t v115;
  _BYTE *v116;
  NSObject *v117;
  _QWORD *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  _QWORD *v122;
  void *v123;
  id v124;
  _BYTE *v125;
  _BYTE *v126;
  uint64_t v127;
  _BYTE *v128;
  _QWORD *v129;
  uint64_t v130;
  unint64_t v131;
  double v132;
  _BYTE *v133;
  unint64_t v134;
  unint64_t v135;
  unint64_t v136;
  unint64_t v137;
  unint64_t v138;
  unint64_t v139;
  uint64_t v140;
  id v141;
  uint64_t *v142;
  uint64_t v143;
  void *v144;
  _QWORD *v145;
  uint64_t v146;
  _QWORD *v147;
  uint64_t (*v148)(uint64_t, uint64_t, uint64_t);
  _QWORD *v149;
  uint64_t v150;
  void *v151;
  id v152;
  id v153;
  void (*v154)(_BYTE *, uint64_t, _BYTE *);
  id v155;
  _BYTE *v156;
  _BYTE *v157;
  uint64_t v158;
  _BYTE v159[12];
  unsigned int v160;
  uint64_t (*v161)(_BYTE *, int64_t, _QWORD *);
  unint64_t v162;
  uint64_t v163;
  void (*v164)(_BYTE *, uint64_t, _QWORD *, double);
  _BYTE *v165;
  uint64_t (*v166)(uint64_t, uint64_t, uint64_t);
  id v167;
  os_log_t v168;
  uint64_t v169;
  _QWORD *v170;
  unint64_t v171;
  _BYTE *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  unsigned int v177;
  id v178;
  _BYTE *v179;
  void (*v180)(_BYTE *, uint64_t, _BYTE *);
  uint64_t v181;
  uint64_t v182;
  _BYTE *v183;
  uint64_t v184;
  uint64_t v185;
  _BYTE *v186;
  uint64_t v187;
  _BYTE *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  char *v192;
  uint64_t v193;
  uint64_t v194;
  __int128 aBlock;
  uint64_t (*v196)(uint64_t);
  void *v197;
  uint64_t (*v198)();
  _QWORD *v199;
  Swift::UInt64_optional v200;
  Swift::UInt64_optional v201;

  v175 = a8;
  v174 = a7;
  v176 = a6;
  v173 = a5;
  v178 = a4;
  v177 = a3;
  v192 = a2;
  v185 = a11;
  v184 = a10;
  v191 = sub_2487B53D8();
  v189 = *(_QWORD *)(v191 - 8);
  MEMORY[0x24BDAC7A8](v191);
  v13 = &v159[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v190 = sub_2487B5408();
  v14 = *(_QWORD *)(v190 - 8);
  MEMORY[0x24BDAC7A8](v190);
  v186 = &v159[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v182 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x24BDAC7A8](v182);
  v183 = &v159[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v17 = sub_2487B533C();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = &v159[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v21);
  v23 = &v159[-v22];
  MEMORY[0x24BDAC7A8](v24);
  v26 = &v159[-v25];
  MEMORY[0x24BDAC7A8](v27);
  v29 = &v159[-v28];
  swift_retain();
  sub_2487B5378();
  swift_release();
  v187 = v14;
  v188 = v13;
  if ((_BYTE)v196)
  {
    v30 = sub_2487B0C04();
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v18 + 16))(v29, v30, v17);
    v31 = sub_2487B5324();
    v32 = sub_2487B57D4();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_2486E6000, v31, v32, "Cannot stop recording. isRecording already false", v33, 2u);
      MEMORY[0x24959AF80](v33, -1, -1);
    }

    (*(void (**)(_BYTE *, uint64_t))(v18 + 8))(v29, v17);
    aBlock = xmmword_2487C0CE0;
    LOBYTE(v196) = 3;
    v34 = (uint64_t)v183;
    swift_storeEnumTagMultiPayload();
    type metadata accessor for TTSVBError(0);
    sub_2486F4CA0((unint64_t *)&qword_25445ED48, type metadata accessor for TTSVBError, (uint64_t)&protocol conformance descriptor for TTSVBError);
    v35 = (void *)swift_allocError();
    TTSVBError.init(_:_:_:)((uint64_t)&aBlock, v34, 0, v36);
    swift_willThrow();
    v37 = v189;
    v38 = v191;
    goto LABEL_41;
  }
  v171 = (unint64_t)v23;
  v179 = v20;
  v172 = (_BYTE *)v17;
  swift_retain();
  sub_2487B5378();
  swift_release();
  v39 = *(double *)&aBlock;
  v40 = v196;
  v200.value = 0;
  v200.is_nil = 1;
  v41 = TTSVBTimestampInSeconds(when:)(v200);
  v42 = v41;
  if (!v40 || (v43 = 0.0, v40 == 1))
    v43 = v39;
  v181 = a1;
  *(double *)&aBlock = v43;
  *((double *)&aBlock + 1) = v41;
  LOBYTE(v196) = 1;
  swift_retain();
  sub_2487B5384();
  swift_release();
  v44 = sub_2487B0C04();
  v45 = v172;
  v180 = *(void (**)(_BYTE *, uint64_t, _BYTE *))(v18 + 16);
  v180(v26, v44, v172);
  v46 = sub_2487B5324();
  v47 = sub_2487B57E0();
  if (os_log_type_enabled(v46, v47))
  {
    v48 = swift_slowAlloc();
    v170 = (_QWORD *)v18;
    v49 = (uint8_t *)v48;
    v50 = swift_slowAlloc();
    *(_QWORD *)&aBlock = v50;
    *(_DWORD *)v49 = 136315138;
    v201.value = 0;
    v201.is_nil = 1;
    v51 = TTSVBTimestampInSeconds(when:)(v201);
    v52 = sub_248729E14(v51);
    v193 = sub_2486EDE5C(v52, v53, (uint64_t *)&aBlock);
    sub_2487B593C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2486E6000, v46, v47, "FinishRecording. hostTime=%s", v49, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24959AF80](v50, -1, -1);
    MEMORY[0x24959AF80](v49, -1, -1);

    v54 = (_QWORD *)v170[1];
  }
  else
  {

    v54 = *(_QWORD **)(v18 + 8);
  }
  ((void (*)(_BYTE *, _BYTE *))v54)(v26, v45);
  v55 = v179;
  v56 = v171;
  LOBYTE(aBlock) = 1;
  sub_24879EF48((unsigned __int8 *)&aBlock, (uint64_t)nullsub_1, 0);
  v57 = v181;
  v58 = *(uint64_t (**)(uint64_t, double, double))(**(_QWORD **)(v181
                                                                        + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_bufferHistory)
                                                          + 272);
  v59 = swift_retain();
  v60 = v58(v59, v43, v42);
  swift_release();
  v180((_BYTE *)v56, v44, v45);
  swift_bridgeObjectRetain_n();
  v61 = sub_2487B5324();
  v62 = sub_2487B57E0();
  v63 = os_log_type_enabled(v61, (os_log_type_t)v62);
  v170 = v54;
  if (v63)
  {
    v168 = v61;
    v169 = v44;
    v64 = swift_slowAlloc();
    *(_DWORD *)v64 = 134218240;
    if (v60 >> 62)
    {
      swift_bridgeObjectRetain();
      v65 = sub_2487B5B64();
      swift_bridgeObjectRelease();
    }
    else
    {
      v65 = *(_QWORD *)((v60 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)&aBlock = v65;
    sub_2487B593C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v64 + 12) = 2048;
    LODWORD(v167) = v62;
    if (v60 >> 62)
    {
      swift_bridgeObjectRetain();
      result = sub_2487B5B64();
      v66 = result;
      if (result)
        goto LABEL_16;
    }
    else
    {
      v66 = *(_QWORD *)((v60 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v66)
      {
LABEL_16:
        if (v66 < 1)
        {
          __break(1u);
          return result;
        }
        v68 = 0;
        v69 = 0.0;
        do
        {
          if ((v60 & 0xC000000000000001) != 0)
            v70 = (id)MEMORY[0x24959A434](v68, v60);
          else
            v70 = *(id *)(v60 + 8 * v68 + 32);
          v71 = v70;
          ++v68;
          v72 = objc_msgSend(v70, sel_format);
          objc_msgSend(v72, sel_sampleRate);
          v74 = v73;

          LODWORD(v72) = objc_msgSend(v71, sel_frameLength);
          v69 = v69 + (double)v72 / v74;
        }
        while (v66 != v68);
        goto LABEL_25;
      }
    }
    v69 = 0.0;
LABEL_25:
    swift_bridgeObjectRelease();
    *(double *)&aBlock = v69;
    sub_2487B593C();
    swift_bridgeObjectRelease_n();
    v75 = v168;
    _os_log_impl(&dword_2486E6000, v168, (os_log_type_t)v167, "Will compute audio assessment of %ld buffers. Duration=%f", (uint8_t *)v64, 0x16u);
    MEMORY[0x24959AF80](v64, -1, -1);

    v57 = v181;
    v45 = v172;
    v55 = v179;
    v54 = v170;
    v56 = v171;
    v44 = v169;
    goto LABEL_26;
  }

  swift_bridgeObjectRelease_n();
LABEL_26:
  ((void (*)(unint64_t, _BYTE *))v54)(v56, v45);
  v76 = (void *)objc_opt_self();
  sub_24870A34C(0, &qword_25777D4E8);
  v77 = (void *)sub_2487B566C();
  v78 = objc_msgSend(v76, sel_assessAudioForBuffers_, v77);

  v180(v55, v44, v45);
  swift_bridgeObjectRetain_n();
  v79 = v78;
  v80 = sub_2487B5324();
  v81 = sub_2487B57E0();
  if (os_log_type_enabled(v80, v81))
  {
    v82 = swift_slowAlloc();
    v180 = (void (*)(_BYTE *, uint64_t, _BYTE *))swift_slowAlloc();
    *(_DWORD *)v82 = 134218242;
    if (v60 >> 62)
    {
      swift_bridgeObjectRetain();
      v83 = sub_2487B5B64();
      swift_bridgeObjectRelease();
    }
    else
    {
      v83 = *(_QWORD *)((v60 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    *(_QWORD *)&aBlock = v83;
    sub_2487B593C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v82 + 12) = 2112;
    *(_QWORD *)&aBlock = v79;
    v84 = v79;
    v85 = v79;
    sub_2487B593C();
    v86 = (void (*)(_QWORD, _QWORD, _QWORD))v180;
    *(_QWORD *)v180 = v84;

    v79 = v84;
    _os_log_impl(&dword_2486E6000, v80, v81, "Did compute audio assessment of %ld buffers: %@", (uint8_t *)v82, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445F350);
    swift_arrayDestroy();
    MEMORY[0x24959AF80](v86, -1, -1);
    MEMORY[0x24959AF80](v82, -1, -1);

    v57 = v181;
    ((void (*)(_BYTE *, _BYTE *))v170)(v179, v45);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    ((void (*)(_BYTE *, _BYTE *))v54)(v55, v45);
  }
  v87 = *(void **)(v57
                 + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_recordingFormat);
  if (!v87)
  {
    swift_bridgeObjectRelease();
LABEL_40:
    aBlock = xmmword_2487C0CE0;
    LOBYTE(v196) = 3;
    v119 = (uint64_t)v183;
    swift_storeEnumTagMultiPayload();
    type metadata accessor for TTSVBError(0);
    sub_2486F4CA0((unint64_t *)&qword_25445ED48, type metadata accessor for TTSVBError, (uint64_t)&protocol conformance descriptor for TTSVBError);
    v35 = (void *)swift_allocError();
    TTSVBError.init(_:_:_:)((uint64_t)&aBlock, v119, 0, v120);
    swift_willThrow();

    v38 = v191;
    v37 = v189;
LABEL_41:
    v121 = v185;
    v122 = (_QWORD *)swift_allocObject();
    v122[2] = v184;
    v122[3] = v121;
    v122[4] = v35;
    v198 = sub_2487AE9EC;
    v199 = v122;
    *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
    *((_QWORD *)&aBlock + 1) = 1107296256;
    v196 = sub_2486F1008;
    v197 = &block_descriptor_67_0;
    v123 = _Block_copy(&aBlock);
    swift_retain();
    v124 = v35;
    v125 = v186;
    sub_2487B53E4();
    v194 = MEMORY[0x24BEE4AF8];
    sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
    sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
    v126 = v188;
    sub_2487B59FC();
    MEMORY[0x24959A1AC](0, v125, v126, v123);
    _Block_release(v123);

    (*(void (**)(_BYTE *, uint64_t))(v37 + 8))(v126, v38);
    (*(void (**)(_BYTE *, uint64_t))(v187 + 8))(v125, v190);
    return swift_release();
  }
  v180 = (void (*)(_BYTE *, uint64_t, _BYTE *))v79;
  v88 = sub_2487B50CC();
  v179 = v159;
  v89 = *(_QWORD *)(v88 - 8);
  MEMORY[0x24BDAC7A8](v88);
  v171 = v90;
  v91 = (v90 + 15) & 0xFFFFFFFFFFFFFFF0;
  v92 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  v172 = v159;
  v93 = *(_QWORD *)(*(_QWORD *)(v92 - 8) + 64);
  MEMORY[0x24BDAC7A8](v92);
  v168 = (os_log_t)((v93 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = v159 - (_BYTE *)v168;
  v95 = v57
      + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioFileURL;
  swift_beginAccess();
  sub_2487ADC1C(v95, v94);
  v169 = v89;
  v96 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v89 + 48);
  v170 = (_QWORD *)v88;
  v97 = v96(v94, 1, v88);
  if ((_DWORD)v97)
  {
    swift_bridgeObjectRelease();
    v98 = v94;
LABEL_39:
    sub_2486F5008(v98, &qword_25445ED28);
    v79 = v180;
    goto LABEL_40;
  }
  v165 = v159;
  v99 = MEMORY[0x24BDAC7A8](v97);
  v166 = v96;
  v100 = v169;
  v101 = v170;
  v164 = *(void (**)(_BYTE *, uint64_t, _QWORD *, double))(v169 + 16);
  v164(&v159[-v91], v94, v170, v99);
  v167 = v87;
  sub_2486F5008(v94, &qword_25445ED28);
  sub_2487B5048();
  v102 = *(void (**)(_BYTE *, _QWORD *))(v100 + 8);
  v102(&v159[-v91], v101);
  v103 = sub_2487B5018();
  v105 = v104;
  v106 = ((uint64_t (*)(_BYTE *, _QWORD *))v102)(&v159[-v91], v101);
  v179 = v159;
  MEMORY[0x24BDAC7A8](v106);
  v172 = v159;
  MEMORY[0x24BDAC7A8](v107);
  v108 = v159 - (_BYTE *)v168;
  MEMORY[0x24BDAC7A8](v109);
  v111 = &v159[-v110];
  sub_2487ADC1C(v95, (uint64_t)&v159[-v110]);
  v112 = v166;
  v113 = v166((uint64_t)v111, 1, (uint64_t)v101);
  if ((_DWORD)v113)
  {
    sub_2486F5008((uint64_t)v111, &qword_25445ED28);
    (*(void (**)(int64_t, uint64_t, uint64_t, _QWORD *))(v169 + 56))(v108, 1, 1, v170);
LABEL_38:
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    v98 = v108;
    goto LABEL_39;
  }
  v163 = v103;
  v165 = &v159[-v91];
  v114 = MEMORY[0x24BDAC7A8](v113);
  v162 = (v115 + 15) & 0xFFFFFFFFFFFFFFF0;
  v116 = &v159[-v162];
  v117 = v102;
  v118 = v170;
  v164(&v159[-v162], (uint64_t)v111, v170, v114);
  sub_2486F5008((uint64_t)v111, &qword_25445ED28);
  sub_2487B5078();
  v168 = v117;
  ((void (*)(_BYTE *, _QWORD *))v117)(v116, v118);
  (*(void (**)(int64_t, _QWORD, uint64_t, _QWORD *))(v169 + 56))(v108, 0, 1, v118);
  if (v112(v108, 1, (uint64_t)v118) == 1)
    goto LABEL_38;
  v166 = a9;
  v160 = v177 >> 8;
  v127 = v169;
  v161 = *(uint64_t (**)(_BYTE *, int64_t, _QWORD *))(v169 + 32);
  v128 = v165;
  v129 = v170;
  v130 = v161(v165, v108, v170);
  v183 = v159;
  v182 = *(_QWORD *)&v192[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioIOQueue];
  v131 = v171;
  v132 = MEMORY[0x24BDAC7A8](v130);
  v133 = &v159[-v162];
  v164(&v159[-v162], (uint64_t)v128, v129, v132);
  v134 = (*(unsigned __int8 *)(v127 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v127 + 80);
  v171 = (v131 + v134 + 7) & 0xFFFFFFFFFFFFFFF8;
  v172 = (_BYTE *)((v171 + 23) & 0xFFFFFFFFFFFFFFF8);
  v135 = (unint64_t)(v172 + 15) & 0xFFFFFFFFFFFFFFF8;
  v136 = (v135 + 15) & 0xFFFFFFFFFFFFFFF8;
  v137 = (v136 + 15) & 0xFFFFFFFFFFFFFFF8;
  v169 = v105;
  v138 = (v137 + 23) & 0xFFFFFFFFFFFFFFF8;
  v139 = (v138 + 15) & 0xFFFFFFFFFFFFFFF8;
  v140 = swift_allocObject();
  v141 = v167;
  *(_QWORD *)(v140 + 16) = v60;
  *(_QWORD *)(v140 + 24) = v141;
  *(_BYTE *)(v140 + 32) = v177;
  *(_BYTE *)(v140 + 33) = v160;
  *(_QWORD *)(v140 + 40) = v178;
  v161((_BYTE *)(v140 + v134), (int64_t)v133, v170);
  v142 = (uint64_t *)(v140 + v171);
  v143 = v169;
  *v142 = v163;
  v142[1] = v143;
  v144 = v192;
  *(_QWORD *)&v172[v140] = v192;
  *(_QWORD *)(v140 + v135) = v180;
  *(_QWORD *)(v140 + v136) = v181;
  v145 = (_QWORD *)(v140 + v137);
  v146 = v176;
  *v145 = v173;
  v145[1] = v146;
  *(_QWORD *)(v140 + v138) = v174;
  v147 = (_QWORD *)(v140 + v139);
  v148 = v166;
  *v147 = v175;
  v147[1] = v148;
  v149 = (_QWORD *)(v140 + ((v139 + 23) & 0xFFFFFFFFFFFFFFF8));
  v150 = v185;
  *v149 = v184;
  v149[1] = v150;
  v198 = sub_2487ADD94;
  v199 = (_QWORD *)v140;
  *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v196 = sub_2486F1008;
  v197 = &block_descriptor_73;
  v151 = _Block_copy(&aBlock);
  v152 = v178;
  v153 = v144;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  v154 = v180;
  v155 = v167;
  v156 = v186;
  sub_2487B53E4();
  v194 = MEMORY[0x24BEE4AF8];
  sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
  sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
  v157 = v188;
  v158 = v191;
  sub_2487B59FC();
  MEMORY[0x24959A1AC](0, v156, v157, v151);
  _Block_release(v151);

  (*(void (**)(_BYTE *, uint64_t))(v189 + 8))(v157, v158);
  (*(void (**)(_BYTE *, uint64_t))(v187 + 8))(v156, v190);
  ((void (*)(_BYTE *, _QWORD *))v168)(v165, v170);
  return swift_release();
}

uint64_t sub_2487A13A0(unint64_t a1, void *a2, unsigned int a3, uint64_t a4, uint64_t a5, char *a6, char *a7, char *a8, void *a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t a14, void *a15, uint64_t a16, uint64_t a17)
{
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t, uint64_t, double);
  uint64_t v32;
  double v33;
  unint64_t v34;
  unint64_t v35;
  char *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  void *v40;
  char *v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  char *v46;
  char *v47;
  uint64_t v48;
  _QWORD v50[2];
  void *v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  unint64_t v55;
  void *v56;
  char *v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t aBlock;
  uint64_t v70;
  uint64_t (*v71)(uint64_t);
  void *v72;
  uint64_t (*v73)();
  char *v74;

  v67 = a8;
  v57 = a6;
  v58 = a7;
  v19 = a3;
  v55 = a1;
  v56 = a2;
  v59 = a16;
  v60 = a17;
  v20 = a3 >> 8;
  v66 = sub_2487B53D8();
  v64 = *(_QWORD *)(v66 - 8);
  MEMORY[0x24BDAC7A8](v66);
  v63 = (char *)v50 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = sub_2487B5408();
  v62 = *(_QWORD *)(v65 - 8);
  MEMORY[0x24BDAC7A8](v65);
  v61 = (char *)v50 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_2487B50CC();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = *(_QWORD *)(v24 + 64);
  MEMORY[0x24BDAC7A8](v23);
  v26 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
  LOBYTE(aBlock) = v19;
  BYTE1(aBlock) = v20;
  v70 = a4;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  v28 = MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)v50 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = *(void (**)(char *, uint64_t, uint64_t, double))(v24 + 16);
  v31(v30, a5, v23, v28);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v30, 0, 1, v23);
  static TTSVBAudioTools.createAudioFileFromBuffers(_:convertFrom:audioOverrides:saveTo:filename:)(v55, v56, (unsigned __int8 *)&aBlock, (uint64_t)v30, v57, v58, (uint64_t)v50 - v26);
  v55 = a14;
  v56 = a15;
  v53 = a13;
  v50[1] = a12;
  v52 = a11;
  v50[0] = a10;
  v51 = a9;
  v32 = sub_2486F5008((uint64_t)v30, &qword_25445ED28);
  v58 = (char *)v50;
  v57 = *(char **)&v67[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  v33 = MEMORY[0x24BDAC7A8](v32);
  v54 = (char *)v50 - v26;
  v31((char *)v50 - v26, (uint64_t)v50 - v26, v23, v33);
  v34 = (*(unsigned __int8 *)(v24 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
  v35 = (v25 + v34 + 7) & 0xFFFFFFFFFFFFFFF8;
  v36 = (char *)swift_allocObject();
  v37 = v51;
  *((_QWORD *)v36 + 2) = v51;
  *((_QWORD *)v36 + 3) = a10;
  *((_QWORD *)v36 + 4) = v52;
  *((_QWORD *)v36 + 5) = a12;
  v38 = v55;
  v39 = v56;
  *((_QWORD *)v36 + 6) = v53;
  *((_QWORD *)v36 + 7) = v38;
  *((_QWORD *)v36 + 8) = v39;
  (*(void (**)(char *, char *, uint64_t))(v24 + 32))(&v36[v34], (char *)v50 - v26, v23);
  v40 = v67;
  *(_QWORD *)&v36[v35] = v67;
  v41 = &v36[(v35 + 15) & 0xFFFFFFFFFFFFFFF8];
  v42 = v60;
  *(_QWORD *)v41 = v59;
  *((_QWORD *)v41 + 1) = v42;
  v73 = sub_2487ADF40;
  v74 = v36;
  aBlock = MEMORY[0x24BDAC760];
  v70 = 1107296256;
  v71 = sub_2486F1008;
  v72 = &block_descriptor_85;
  v43 = _Block_copy(&aBlock);
  v44 = v37;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v45 = v40;
  swift_retain();
  v46 = v61;
  sub_2487B53E4();
  v68 = MEMORY[0x24BEE4AF8];
  sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
  sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
  v47 = v63;
  v48 = v66;
  sub_2487B59FC();
  MEMORY[0x24959A1AC](0, v46, v47, v43);
  _Block_release(v43);
  (*(void (**)(char *, uint64_t))(v64 + 8))(v47, v48);
  (*(void (**)(char *, uint64_t))(v62 + 8))(v46, v65);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v54, v23);
  return swift_release();
}

uint64_t sub_2487A1970(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7, char *a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t result;
  uint64_t v34;
  char *v35;
  char *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  char *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint64_t v45;
  uint8_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  double v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  _QWORD v69[2];
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  _QWORD *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t aBlock[6];

  v76 = a8;
  v75 = a6;
  v74 = a5;
  v73 = a3;
  v85 = sub_2487B53D8();
  v15 = *(_QWORD *)(v85 - 8);
  MEMORY[0x24BDAC7A8](v85);
  v17 = (char *)v69 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2487B5408();
  v83 = *(_QWORD *)(v18 - 8);
  v84 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v82 = (char *)v69 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_2487B533C();
  v87 = *(_QWORD *)(v20 - 8);
  v88 = v20;
  MEMORY[0x24BDAC7A8](v20);
  v86 = (char *)v69 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = (int *)type metadata accessor for TTSVBAudioService.RecordingResult(0);
  v79 = *((_QWORD *)v22 - 1);
  MEMORY[0x24BDAC7A8](v22);
  v80 = v23;
  v81 = (char *)v69 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)v69 - v25;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  MEMORY[0x24BDAC7A8](v27);
  v77 = v28;
  v29 = (char *)v69 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = a2
      + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioFileURL;
  swift_beginAccess();
  v78 = v30;
  sub_2487ADC1C(v30, (uint64_t)v29);
  v31 = sub_2487B50CC();
  v32 = *(_QWORD *)(v31 - 8);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v32 + 48))(v29, 1, v31);
  if ((_DWORD)result == 1)
  {
    __break(1u);
  }
  else
  {
    v71 = v17;
    v72 = v15;
    v34 = a11;
    v70 = a10;
    v69[1] = a9;
    *(_QWORD *)v26 = a1;
    (*(void (**)(char *, char *, uint64_t))(v32 + 32))(&v26[v22[5]], v29, v31);
    v35 = &v26[v22[6]];
    *(_QWORD *)v35 = v73;
    *((_QWORD *)v35 + 1) = a4;
    *(_QWORD *)&v26[v22[7]] = v74;
    v36 = &v26[v22[8]];
    *(_QWORD *)v36 = v75;
    *((_QWORD *)v36 + 1) = a7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v37 = a1;
    v38 = sub_2487B0C04();
    v39 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v87 + 16))(v86, v38, v88);
    v40 = MEMORY[0x24BDAC7A8](v39);
    v42 = (char *)v69 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t, double))(v32 + 16))(v42, v76, v31, v40);
    v43 = sub_2487B5324();
    v44 = sub_2487B57BC();
    if (os_log_type_enabled(v43, v44))
    {
      v74 = v69;
      v45 = swift_slowAlloc();
      v75 = a11;
      v46 = (uint8_t *)v45;
      v47 = swift_slowAlloc();
      v76 = v26;
      v48 = v47;
      aBlock[0] = v47;
      *(_DWORD *)v46 = 136315138;
      v49 = sub_2487B50B4();
      v89 = sub_2486EDE5C(v49, v50, aBlock);
      sub_2487B593C();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v42, v31);
      _os_log_impl(&dword_2486E6000, v43, v44, "Will end audio recording: %s", v46, 0xCu);
      swift_arrayDestroy();
      v51 = v48;
      v26 = v76;
      MEMORY[0x24959AF80](v51, -1, -1);
      v52 = v46;
      v34 = v75;
      MEMORY[0x24959AF80](v52, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v32 + 8))(v42, v31);
    }

    v53 = (*(uint64_t (**)(char *, uint64_t))(v87 + 8))(v86, v88);
    v54 = v83;
    v55 = (uint64_t)v81;
    v56 = v79;
    v57 = MEMORY[0x24BDAC7A8](v53);
    v59 = (char *)v69 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, double))(v32 + 56))(v59, 1, 1, v31, v57);
    v60 = v78;
    swift_beginAccess();
    sub_2487ADFB4((uint64_t)v59, v60);
    swift_endAccess();
    sub_248709554((uint64_t)v26, v55, type metadata accessor for TTSVBAudioService.RecordingResult);
    v61 = *(unsigned __int8 *)(v56 + 80);
    v62 = (uint64_t)v26;
    v63 = (v61 + 32) & ~v61;
    v64 = swift_allocObject();
    *(_QWORD *)(v64 + 16) = v70;
    *(_QWORD *)(v64 + 24) = v34;
    sub_2487AE0B0(v55, v64 + v63);
    aBlock[4] = (uint64_t)sub_2487AE0F4;
    aBlock[5] = v64;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2486F1008;
    aBlock[3] = (uint64_t)&block_descriptor_91;
    v65 = _Block_copy(aBlock);
    swift_retain();
    v66 = v82;
    sub_2487B53E4();
    v89 = MEMORY[0x24BEE4AF8];
    sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
    sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
    v67 = v71;
    v68 = v85;
    sub_2487B59FC();
    MEMORY[0x24959A1AC](0, v66, v67, v65);
    _Block_release(v65);
    (*(void (**)(char *, uint64_t))(v72 + 8))(v67, v68);
    (*(void (**)(char *, uint64_t))(v54 + 8))(v66, v84);
    sub_2486EDA68(v62, type metadata accessor for TTSVBAudioService.RecordingResult);
    return swift_release();
  }
  return result;
}

uint64_t sub_2487A2018(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF68);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248709554(a3, (uint64_t)v7, type metadata accessor for TTSVBAudioService.RecordingResult);
  swift_storeEnumTagMultiPayload();
  a1(v7);
  return sub_2486F5008((uint64_t)v7, &qword_25777DF68);
}

uint64_t sub_2487A20C8(void (*a1)(char *), uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  __int128 v9;
  char v10;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF68);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = xmmword_2487C0CE0;
  v10 = 3;
  static TTSVBError.map(_:_:)(a3, (uint64_t)&v9, (uint64_t)v7);
  swift_storeEnumTagMultiPayload();
  a1(v7);
  return sub_2486F5008((uint64_t)v7, &qword_25777DF68);
}

unint64_t sub_2487A218C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  id *v4;
  char v5;
  id v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF70);
  v2 = (_QWORD *)sub_2487B5B88();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (id *)(a1 + 40);
  while (1)
  {
    v5 = *((_BYTE *)v4 - 8);
    v6 = *v4;
    result = sub_2487AA614(v5);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_BYTE *)(v2[6] + result) = v5;
    *(_QWORD *)(v2[7] + 8 * result) = v6;
    v9 = v2[2];
    v10 = __OFADD__(v9, 1);
    v11 = v9 + 1;
    if (v10)
      goto LABEL_11;
    v2[2] = v11;
    v4 += 2;
    if (!--v3)
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

uint64_t sub_2487A228C(int a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5)
{
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint64_t v25;
  uint8_t *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint8_t *v30;
  uint64_t result;
  void *v32;
  id v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(char *, uint64_t);
  uint64_t v46;
  char *v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t aBlock[10];

  v46 = a4;
  LODWORD(v45) = a1;
  v8 = sub_2487B53D8();
  v50 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v47 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_2487B5408();
  v52 = *(_QWORD *)(v10 - 8);
  v53 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v51 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v49 = sub_2487B5420();
  v12 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v14 = (char *)&v41 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v48 = (char *)&v41 - v16;
  v17 = sub_2487B533C();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v41 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = a2 + 16;
  v22 = sub_2487B0C04();
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v22, v17);
  v23 = sub_2487B5324();
  v24 = sub_2487B57BC();
  if (os_log_type_enabled(v23, v24))
  {
    v44 = v8;
    v25 = swift_slowAlloc();
    v43 = a3;
    v26 = (uint8_t *)v25;
    v27 = swift_slowAlloc();
    v41 = v27;
    v42 = v21;
    *(_DWORD *)v26 = 136315138;
    aBlock[0] = v27;
    if ((v45 & 1) != 0)
      v28 = 0x80000002487C7710;
    else
      v28 = 0x80000002487C76F0;
    v45 = (void (*)(char *, uint64_t))v17;
    aBlock[6] = sub_2486EDE5C(0xD000000000000012, v28, aBlock);
    v21 = v42;
    sub_2487B593C();
    v8 = v44;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2486E6000, v23, v24, "Did finish playing sound effect '%s'. Calling completion", v26, 0xCu);
    v29 = v41;
    swift_arrayDestroy();
    MEMORY[0x24959AF80](v29, -1, -1);
    v30 = v26;
    a3 = v43;
    MEMORY[0x24959AF80](v30, -1, -1);

    (*(void (**)(char *, _QWORD))(v18 + 8))(v20, v45);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  }
  swift_beginAccess();
  result = MEMORY[0x24959B01C](v21);
  if (result)
  {
    v32 = (void *)result;
    v33 = *(id *)(result + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);

    sub_2487B5414();
    v34 = v48;
    MEMORY[0x249599DA4](v14, a5);
    v45 = *(void (**)(char *, uint64_t))(v12 + 8);
    v35 = v49;
    v45(v14, v49);
    v36 = swift_allocObject();
    v37 = v46;
    *(_QWORD *)(v36 + 16) = a3;
    *(_QWORD *)(v36 + 24) = v37;
    aBlock[4] = (uint64_t)sub_248750F08;
    aBlock[5] = v36;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_2486F1008;
    aBlock[3] = (uint64_t)&block_descriptor_122_0;
    v38 = _Block_copy(aBlock);
    swift_retain();
    v39 = v51;
    sub_2487B53E4();
    v54 = MEMORY[0x24BEE4AF8];
    sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
    sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
    v40 = v47;
    sub_2487B59FC();
    MEMORY[0x24959A17C](v34, v39, v40, v38);
    _Block_release(v38);

    (*(void (**)(char *, uint64_t))(v50 + 8))(v40, v8);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v39, v53);
    v45(v34, v35);
    return swift_release();
  }
  return result;
}

void sub_2487A2764(NSObject *a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
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
  uint64_t v20;
  double v21;
  uint64_t v22;
  _QWORD *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  double v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  char *v53;
  id v54;
  char *v55;
  NSObject *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  unint64_t v63;
  double v64;
  id v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t v69;
  void (*v70)(char *, uint64_t, uint64_t);
  void *v71;
  os_log_t v72;
  uint64_t v73;
  char *v74;
  id v75;
  char *v76;
  id v77;
  NSObject *v78;
  NSObject *v79;
  id v80;
  char *v81;
  NSObject *v82;
  NSObject *v83;
  os_log_t v84;
  NSObject *v85;
  NSObject *v86;
  int v87;
  _BOOL4 v88;
  uint64_t v89;
  uint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  NSObject *v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  unint64_t v99;
  id v100;
  void *v101;
  id v102;
  uint64_t v103;
  unint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  void *v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  NSObject *v118;
  uint64_t v119;
  unint64_t v120;
  double v121;
  id v122;
  uint64_t v123;
  unint64_t v124;
  unint64_t v125;
  uint64_t v126;
  os_log_t v127;
  uint64_t v128;
  unint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  id v133;
  id v134;
  NSObject *v135;
  os_log_type_t v136;
  uint8_t *v137;
  void *v138;
  double v139;
  uint64_t v140;
  unsigned __int8 v141;
  uint64_t v142;
  uint64_t v143;
  unint64_t v144;
  unint64_t v145;
  id v146;
  char *v147;
  uint64_t v148;
  NSObject *v149;
  id v150;
  void *v151;
  char *v152;
  os_log_t v153;
  uint64_t v154;
  char *v155;
  NSObject *v156;
  NSObject *v157;
  os_log_type_t v158;
  uint64_t v159;
  id v160;
  float v161;
  double v162;
  uint64_t v163;
  NSObject *v164;
  char *v165;
  unint64_t v166;
  unint64_t v167;
  uint64_t v168;
  uint64_t v169;
  id v170;
  uint64_t v171;
  int v172;
  os_log_t v173;
  char *v174;
  char *v175;
  unint64_t v176;
  NSObject *v177;
  char *v178;
  id v179;
  uint64_t v180;
  void (*v181)(char *, uint64_t, uint64_t);
  char *v182;
  uint64_t v183;
  void *v184;
  char *v185;
  os_log_t v186;
  char *v187;
  NSObject *v188;
  id v189;
  NSObject *v190;
  uint64_t v191;
  uint64_t v192;
  id v193;
  id v194;
  unint64_t v195;
  double v196;
  unint64_t v197;
  unsigned __int8 v198;
  double v199;
  uint64_t v200;
  unsigned __int8 v201;
  uint64_t v202;

  v2 = v1;
  v188 = a1;
  v3 = type metadata accessor for TTSVBError(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v169 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v183 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x24BDAC7A8](v183);
  v178 = (char *)&v169 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v182 = (char *)&v169 - v8;
  v9 = sub_2487B533C();
  v191 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v169 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v174 = (char *)&v169 - v13;
  MEMORY[0x24BDAC7A8](v14);
  v186 = (os_log_t)((char *)&v169 - v15);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v169 - v17;
  v19 = sub_2487B542C();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = MEMORY[0x24BDAC7A8](v19);
  v23 = (uint64_t *)((char *)&v169 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  v24 = *(void **)&v2[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  *v23 = v24;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v20 + 104))(v23, *MEMORY[0x24BEE5610], v19, v21);
  v25 = v24;
  LOBYTE(v24) = sub_2487B5444();
  (*(void (**)(_QWORD *, uint64_t))(v20 + 8))(v23, v19);
  if ((v24 & 1) == 0)
  {
    __break(1u);
    return;
  }
  v26 = (void *)*MEMORY[0x24BDB15A0];
  v27 = *(void **)&v2[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession];
  v28 = objc_msgSend(v27, sel_category);
  v187 = (char *)objc_msgSend(v27, sel_categoryOptions);
  v190 = objc_msgSend(v27, sel_mode);
  v179 = v27;
  v29 = objc_msgSend(v27, sel_preferredInput);
  v192 = v9;
  if (v29)
  {
    v30 = v29;
    v189 = objc_msgSend(v29, sel_portType);

  }
  else
  {
    v189 = 0;
  }
  v31 = sub_2487B5528();
  v33 = v32;
  v193 = v26;
  if (v31 == sub_2487B5528() && v33 == v34)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v35 = sub_2487B5CE4();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v35 & 1) == 0)
      goto LABEL_28;
  }
  if (v187 == (char *)44)
  {
    v36 = sub_2487B5528();
    v38 = v37;
    if (v36 == sub_2487B5528() && v38 == v39)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v40 = sub_2487B5CE4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v40 & 1) == 0)
        goto LABEL_28;
    }
    v41 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state;
    swift_retain();
    sub_2487B5378();
    swift_release();
    v42 = v199;
    if (v199 == 0.0)
    {
      if (!v189)
        goto LABEL_25;
    }
    else
    {
      v43 = objc_msgSend(*(id *)&v199, sel_portType);

      if (v189)
      {
        if (v43)
        {
          v181 = (void (*)(char *, uint64_t, uint64_t))v41;
          v44 = sub_2487B5528();
          v46 = v45;
          if (v44 == sub_2487B5528() && v46 == v47)
          {

            swift_bridgeObjectRelease_n();
            v41 = (uint64_t)v181;
            goto LABEL_25;
          }
          v48 = sub_2487B5CE4();

          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v41 = (uint64_t)v181;
          if ((v48 & 1) != 0)
          {
LABEL_25:
            v181 = (void (*)(char *, uint64_t, uint64_t))v41;
            v49 = sub_2487B0C04();
            v51 = v191;
            v50 = v192;
            (*(void (**)(char *, uint64_t, uint64_t))(v191 + 16))(v18, v49, v192);
            v52 = v193;
            v53 = v2;
            v54 = v52;
            v55 = v53;
            v56 = sub_2487B5324();
            LODWORD(v188) = sub_2487B57E0();
            if (os_log_type_enabled(v56, (os_log_type_t)v188))
            {
              v185 = v55;
              v186 = v56;
              v187 = v18;
              v57 = swift_slowAlloc();
              v183 = swift_slowAlloc();
              v202 = v183;
              *(_DWORD *)v57 = 136315650;
              v199 = COERCE_DOUBLE(sub_2487B5528());
              v200 = v58;
              v196 = -2.31584178e77;
              v197 = 0x80000002487C77C0;
              v194 = 0;
              v195 = 0xE000000000000000;
              v167 = sub_2486ED9E0();
              v168 = v167;
              v165 = (char *)MEMORY[0x24BEE0D00];
              v166 = v167;
              v59 = sub_2487B5984();
              v61 = v60;
              swift_bridgeObjectRelease();
              v199 = COERCE_DOUBLE(sub_2486EDE5C(v59, v61, &v202));
              sub_2487B593C();

              swift_bridgeObjectRelease();
              *(_WORD *)(v57 + 12) = 2080;
              v62 = sub_2487A5354(44);
              v199 = COERCE_DOUBLE(sub_2486EDE5C(v62, v63, &v202));
              sub_2487B593C();
              swift_bridgeObjectRelease();
              *(_WORD *)(v57 + 22) = 2080;
              swift_retain();
              sub_2487B5378();
              swift_release();
              v64 = v199;
              if (v199 == 0.0)
              {
                v66 = 7104878;
                v68 = 0xE300000000000000;
              }
              else
              {
                v65 = objc_msgSend(*(id *)&v199, sel_portName);

                v66 = sub_2487B5528();
                v68 = v67;

              }
              v199 = COERCE_DOUBLE(sub_2486EDE5C(v66, v68, &v202));
              sub_2487B593C();
              v152 = v185;

              swift_bridgeObjectRelease();
              v153 = v186;
              _os_log_impl(&dword_2486E6000, v186, (os_log_type_t)v188, "Will not reconfigure audio session. Already in expected configuration category=%s options=%s portType=%s", (uint8_t *)v57, 0x20u);
              v154 = v183;
              swift_arrayDestroy();
              MEMORY[0x24959AF80](v154, -1, -1);
              MEMORY[0x24959AF80](v57, -1, -1);

              (*(void (**)(char *, uint64_t))(v51 + 8))(v187, v192);
            }
            else
            {

              (*(void (**)(char *, uint64_t))(v51 + 8))(v18, v50);
            }
            return;
          }
        }
      }
      else
      {
        if (!v43)
          goto LABEL_25;

      }
    }
  }
LABEL_28:
  v175 = v5;
  v185 = v11;
  v69 = sub_2487B0C04();
  v70 = *(void (**)(char *, uint64_t, uint64_t))(v191 + 16);
  v71 = v28;
  v72 = v186;
  v180 = v69;
  v73 = v192;
  v181 = v70;
  ((void (*)(os_log_t))v70)(v186);
  v74 = v2;
  v75 = v193;
  v76 = v74;
  v176 = (unint64_t)v71;
  v77 = v71;
  v78 = v190;
  v79 = v188;
  v80 = v75;
  v81 = v76;
  v82 = v77;
  v83 = v78;
  v84 = v72;
  v85 = v79;
  v86 = sub_2487B5324();
  v87 = sub_2487B57E0();
  v88 = os_log_type_enabled(v86, (os_log_type_t)v87);
  v190 = v82;
  v188 = v83;
  if (v88)
  {
    v172 = v87;
    v173 = v86;
    v177 = v85;
    v170 = v80;
    v89 = swift_slowAlloc();
    v171 = swift_slowAlloc();
    v202 = v171;
    *(_DWORD *)v89 = 136316930;
    v199 = COERCE_DOUBLE(sub_2487B5528());
    v200 = v90;
    v196 = -2.31584178e77;
    v197 = 0x80000002487C77C0;
    v176 = 0x80000002487C77C0;
    v194 = 0;
    v195 = 0xE000000000000000;
    v91 = sub_2486ED9E0();
    v167 = v91;
    v168 = v91;
    v165 = (char *)MEMORY[0x24BEE0D00];
    v166 = v91;
    v92 = sub_2487B5984();
    v94 = v93;
    swift_bridgeObjectRelease();
    v199 = COERCE_DOUBLE(sub_2486EDE5C(v92, v94, &v202));
    v95 = v190;
    sub_2487B593C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v89 + 12) = 2080;
    v96 = sub_2487A5354((char)v187);
    v199 = COERCE_DOUBLE(sub_2486EDE5C(v96, v97, &v202));
    sub_2487B593C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v89 + 22) = 2080;
    v98 = sub_2487B5528();
    v199 = COERCE_DOUBLE(sub_2486EDE5C(v98, v99, &v202));
    sub_2487B593C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v89 + 32) = 2080;
    v100 = objc_msgSend(v179, sel_preferredInput);
    if (v100)
    {
      v101 = v100;
      v102 = objc_msgSend(v100, sel_portName);

      v103 = sub_2487B5528();
      v105 = v104;

    }
    else
    {
      v105 = 0xE300000000000000;
      v103 = 7104878;
    }
    v109 = v170;
    v199 = COERCE_DOUBLE(sub_2486EDE5C(v103, v105, &v202));
    sub_2487B593C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v89 + 42) = 2080;
    v199 = COERCE_DOUBLE(sub_2487B5528());
    v200 = v112;
    v196 = -2.31584178e77;
    v197 = v176;
    v194 = 0;
    v195 = 0xE000000000000000;
    v167 = v91;
    v168 = v91;
    v166 = v91;
    v165 = (char *)MEMORY[0x24BEE0D00];
    v113 = sub_2487B5984();
    v115 = v114;
    swift_bridgeObjectRelease();
    v199 = COERCE_DOUBLE(sub_2486EDE5C(v113, v115, &v202));
    sub_2487B593C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v89 + 52) = 2080;
    v116 = sub_2487A5354(44);
    v199 = COERCE_DOUBLE(sub_2486EDE5C(v116, v117, &v202));
    sub_2487B593C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v89 + 62) = 2080;
    v118 = v177;
    v119 = sub_2487B5528();
    v199 = COERCE_DOUBLE(sub_2486EDE5C(v119, v120, &v202));
    sub_2487B593C();

    swift_bridgeObjectRelease();
    *(_WORD *)(v89 + 72) = 2080;
    swift_retain();
    sub_2487B5378();
    swift_release();
    v121 = v199;
    if (v199 == 0.0)
    {
      v125 = 0xE300000000000000;
      v126 = v192;
      v111 = v185;
      v108 = (uint64_t)v182;
      v123 = 7104878;
    }
    else
    {
      v122 = objc_msgSend(*(id *)&v199, sel_portName);

      v123 = sub_2487B5528();
      v125 = v124;

      v126 = v192;
      v111 = v185;
      v108 = (uint64_t)v182;
    }
    v199 = COERCE_DOUBLE(sub_2486EDE5C(v123, v125, &v202));
    sub_2487B593C();

    swift_bridgeObjectRelease();
    v127 = v173;
    _os_log_impl(&dword_2486E6000, v173, (os_log_type_t)v172, "Will reconfigure audio session from [category=%s options=%s mode=%s portType=%s] to [category=%s options=%s mode=%s] portType=%s", (uint8_t *)v89, 0x52u);
    v128 = v171;
    swift_arrayDestroy();
    MEMORY[0x24959AF80](v128, -1, -1);
    MEMORY[0x24959AF80](v89, -1, -1);

    v191 = *(_QWORD *)(v191 + 8);
    v106 = ((uint64_t (*)(os_log_t, uint64_t))v191)(v186, v126);
    v110 = v184;
    v107 = v126;
  }
  else
  {

    v191 = *(_QWORD *)(v191 + 8);
    v106 = ((uint64_t (*)(os_log_t, uint64_t))v191)(v84, v73);
    v107 = v73;
    v108 = (uint64_t)v182;
    v109 = v80;
    v110 = v184;
    v111 = v185;
  }
  MEMORY[0x24BDAC7A8](v106);
  v165 = v81;
  v166 = (unint64_t)v109;
  v167 = v129;
  v168 = 44;
  v199 = COERCE_DOUBLE(sub_2487B5528());
  v200 = v130;
  v201 = 1;
  swift_storeEnumTagMultiPayload();
  static TTSVBError.perform<A>(_:problem:reason:)((void (*)(uint64_t))sub_2487ADAE8, (uint64_t)(&v169 - 6), (uint64_t)&v199, v108);
  if (v110)
  {
    sub_2486EDA68(v108, type metadata accessor for TTSVBError.Reason);
    sub_2486F507C(*(uint64_t *)&v199, v200, v201);
    v181(v111, v180, v107);
    v133 = v110;
    v134 = v110;
    v135 = sub_2487B5324();
    v136 = sub_2487B57D4();
    if (os_log_type_enabled(v135, v136))
    {
      v137 = (uint8_t *)swift_slowAlloc();
      v193 = (id)swift_slowAlloc();
      v194 = v193;
      *(_DWORD *)v137 = 136315138;
      v187 = (char *)(v137 + 4);
      sub_2486F8E48((uint64_t)&v199);
      v138 = v110;
      v139 = v199;
      v140 = v200;
      v141 = v201;
      v196 = v199;
      v197 = v200;
      v198 = v201;
      v142 = (uint64_t)v175;
      static TTSVBError.map(_:_:)(v138, (uint64_t)&v196, (uint64_t)v175);
      sub_2486F507C(*(uint64_t *)&v139, v140, v141);
      v143 = TTSVBError.description.getter();
      v145 = v144;
      sub_2486EDA68(v142, type metadata accessor for TTSVBError);
      v199 = COERCE_DOUBLE(sub_2486EDE5C(v143, v145, (uint64_t *)&v194));
      sub_2487B593C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2486E6000, v135, v136, "%s", v137, 0xCu);
      v146 = v193;
      swift_arrayDestroy();
      MEMORY[0x24959AF80](v146, -1, -1);
      MEMORY[0x24959AF80](v137, -1, -1);

      v147 = v185;
      v148 = v192;
    }
    else
    {

      v147 = v111;
      v148 = v107;
    }
    ((void (*)(char *, uint64_t))v191)(v147, v148);
    v149 = v190;
    swift_willThrow();

  }
  else
  {
    sub_2486EDA68(v108, type metadata accessor for TTSVBError.Reason);
    v131 = sub_2486F507C(*(uint64_t *)&v199, v200, v201);
    MEMORY[0x24BDAC7A8](v131);
    v167 = (unint64_t)v81;
    v199 = -2.31584178e77;
    v200 = 0x80000002487C7D10;
    v201 = 0;
    v132 = (uint64_t)v178;
    sub_2487186E0();
    static TTSVBError.perform<A>(_:problem:reason:)((void (*)(uint64_t))sub_2487ADB6C, (uint64_t)&v165, (uint64_t)&v199, v132);
    sub_2486EDA68(v132, type metadata accessor for TTSVBError.Reason);
    sub_2486F507C(*(uint64_t *)&v199, v200, v201);
    v150 = sub_2487A58A8();
    v151 = v150;
    if (v150)
    {
      sub_2487A6630(v150);

    }
    sub_2487A78F8();
    v155 = v174;
    v181(v174, v180, v107);
    v156 = v81;
    v157 = sub_2487B5324();
    v158 = sub_2487B57E0();
    if (os_log_type_enabled(v157, v158))
    {
      v159 = swift_slowAlloc();
      *(_DWORD *)v159 = 67109632;
      v160 = v179;
      LODWORD(v199) = objc_msgSend(v179, sel_isInputGainSettable);
      sub_2487B593C();

      *(_WORD *)(v159 + 8) = 2048;
      objc_msgSend(v160, sel_inputGain);
      v199 = v161;
      sub_2487B593C();

      *(_WORD *)(v159 + 18) = 2048;
      v107 = v192;
      objc_msgSend(v160, sel_sampleRate);
      v199 = v162;
      sub_2487B593C();

      _os_log_impl(&dword_2486E6000, v157, v158, "isInputGainSettable=%{BOOL}d inputGain%f sampleRate=%f", (uint8_t *)v159, 0x1Cu);
      v163 = v159;
      v155 = v174;
      MEMORY[0x24959AF80](v163, -1, -1);
      v156 = v190;
      v164 = v188;
    }
    else
    {

      v157 = v188;
      v164 = v190;
    }

    ((void (*)(char *, uint64_t))v191)(v155, v107);
  }
}

void sub_2487A3AF0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  void (*v20)(_QWORD);
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint8_t *v25;
  void (*v26)(_BYTE *, uint64_t);
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  id v31;
  id v32;
  id v33;
  double v34;
  uint64_t v35;
  uint64_t v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  _BYTE *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  NSObject *v51;
  os_log_type_t v52;
  int v53;
  uint64_t v54;
  id v55;
  id v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  id v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  os_log_t v67;
  uint64_t v68;
  _BYTE *v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  void *v73;
  id v74;
  _BYTE v75[4];
  int v76;
  os_log_t v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v81;
  void (*v82)(_BYTE *, uint64_t);
  _QWORD *v83;
  uint64_t v84;
  __int128 aBlock;
  void (*v86)(uint64_t, void *, void *);
  void *v87;
  void (*v88)(void *, void *);
  uint64_t v89;

  v82 = (void (*)(_BYTE *, uint64_t))type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x24BDAC7A8](v82);
  v83 = &v75[-((v1 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v2 = sub_2487B533C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v81 = &v75[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v75[-v6];
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v75[-v9];
  v11 = sub_2487B542C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = &v75[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = *(void **)((char *)v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *v15 = v16;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v12 + 104))(v15, *MEMORY[0x24BEE5610], v11, v13);
  v17 = v16;
  LOBYTE(v16) = sub_2487B5444();
  (*(void (**)(_QWORD *, uint64_t))(v12 + 8))(v15, v11);
  if ((v16 & 1) != 0)
  {
    if (objc_msgSend(*(id *)((char *)v0+ OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession), sel_isInputAvailable))
    {
      v18 = v0;
      v19 = sub_2487B0C04();
      v20 = *(void (**)(_QWORD))(v3 + 16);
      v79 = v19;
      v80 = (void (*)(_BYTE *, uint64_t, uint64_t))v20;
      v21 = v2;
      v20(v10);
      v22 = sub_2487B5324();
      v23 = sub_2487B57E0();
      if (os_log_type_enabled(v22, v23))
      {
        v24 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v24 = 0;
        _os_log_impl(&dword_2486E6000, v22, v23, "Will install audio tap", v24, 2u);
        v25 = v24;
        v21 = v2;
        MEMORY[0x24959AF80](v25, -1, -1);
      }

      v26 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
      v26(v10, v21);
      v27 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state;
      if (*(_BYTE *)(*(_QWORD *)((char *)v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state)
                    + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioEngineTapInstalled) == 1)
      {
        v80(v7, v79, v21);
        v28 = sub_2487B5324();
        v29 = sub_2487B57E0();
        if (os_log_type_enabled(v28, v29))
        {
          v30 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v30 = 0;
          _os_log_impl(&dword_2486E6000, v28, v29, "An old audio tap appears to be installed already. Will remove it first", v30, 2u);
          MEMORY[0x24959AF80](v30, -1, -1);
        }

        v26(v7, v21);
        sub_2487A4314();
      }
      v31 = sub_248798770();
      v32 = objc_msgSend(v31, sel_inputNode);

      v33 = objc_msgSend(v32, sel_inputFormatForBus_, 0);
      objc_msgSend(v33, sel_sampleRate);
      if (v34 == 0.0 || !objc_msgSend(v33, sel_channelCount))
      {
        aBlock = xmmword_2487C0CF0;
        LOBYTE(v86) = 3;
        objc_msgSend(v33, sel_sampleRate);
        v36 = v35;
        v37 = objc_msgSend(v33, sel_channelCount);
        v38 = (uint64_t)v83;
        *v83 = v36;
        *(_DWORD *)(v38 + 8) = v37;
        swift_storeEnumTagMultiPayload();
        type metadata accessor for TTSVBError(0);
        sub_2486F4CA0((unint64_t *)&qword_25445ED48, type metadata accessor for TTSVBError, (uint64_t)&protocol conformance descriptor for TTSVBError);
        swift_allocError();
        TTSVBError.init(_:_:_:)((uint64_t)&aBlock, v38, 0, v39);
        swift_willThrow();

      }
      else
      {
        v82 = v26;
        v83 = v18;
        v42 = *(_QWORD *)((char *)v18 + v27);
        v43 = *(void **)(v42
                       + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_recordingFormat);
        *(_QWORD *)(v42
                  + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_recordingFormat) = v33;
        v44 = v33;

        v45 = v81;
        v80(v81, v79, v21);
        v46 = v32;
        v47 = v44;
        v48 = v46;
        v49 = v47;
        v50 = v48;
        v51 = sub_2487B5324();
        v52 = sub_2487B57E0();
        v53 = v52;
        if (os_log_type_enabled(v51, v52))
        {
          v54 = swift_slowAlloc();
          v79 = swift_slowAlloc();
          *(_QWORD *)&aBlock = v79;
          *(_DWORD *)v54 = 136315650;
          v77 = v51;
          v55 = objc_msgSend(v50, sel_debugDescription);
          v76 = v53;
          v56 = v55;
          v57 = sub_2487B5528();
          v78 = v21;
          v59 = v58;

          v84 = sub_2486EDE5C(v57, v59, (uint64_t *)&aBlock);
          v80 = (void (*)(_BYTE *, uint64_t, uint64_t))v27;
          sub_2487B593C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v54 + 12) = 2080;
          v60 = objc_msgSend(v50, sel_AUAudioUnit);
          v61 = objc_msgSend(v60, sel_debugDescription);

          v62 = sub_2487B5528();
          v64 = v63;

          v84 = sub_2486EDE5C(v62, v64, (uint64_t *)&aBlock);
          sub_2487B593C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v54 + 22) = 2080;
          v65 = sub_2487A4518();
          v84 = sub_2486EDE5C(v65, v66, (uint64_t *)&aBlock);
          v27 = (uint64_t)v80;
          sub_2487B593C();

          swift_bridgeObjectRelease();
          v67 = v77;
          _os_log_impl(&dword_2486E6000, v77, (os_log_type_t)v76, "Installing audio tap input=[%s - %s] format=[%s]", (uint8_t *)v54, 0x20u);
          v68 = v79;
          swift_arrayDestroy();
          MEMORY[0x24959AF80](v68, -1, -1);
          MEMORY[0x24959AF80](v54, -1, -1);

          v69 = v81;
          v70 = v78;
        }
        else
        {

          v69 = v45;
          v70 = v21;
        }
        v82(v69, v70);
        v71 = swift_allocObject();
        v72 = v83;
        swift_unknownObjectWeakInit();
        v88 = sub_2487AE20C;
        v89 = v71;
        *(_QWORD *)&aBlock = MEMORY[0x24BDAC760];
        *((_QWORD *)&aBlock + 1) = 1107296256;
        v86 = sub_2487A4D70;
        v87 = &block_descriptor_126_0;
        v73 = _Block_copy(&aBlock);
        v74 = v49;
        swift_release();
        objc_msgSend(v50, sel_installTapOnBus_bufferSize_format_block_, 0, 1024, v74, v73);

        _Block_release(v73);
        *(_BYTE *)(*(_QWORD *)((char *)v72 + v27)
                 + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioEngineTapInstalled) = 1;
      }
    }
    else
    {
      aBlock = xmmword_2487C0CF0;
      LOBYTE(v86) = 3;
      v40 = (uint64_t)v83;
      swift_storeEnumTagMultiPayload();
      type metadata accessor for TTSVBError(0);
      sub_2486F4CA0((unint64_t *)&qword_25445ED48, type metadata accessor for TTSVBError, (uint64_t)&protocol conformance descriptor for TTSVBError);
      swift_allocError();
      TTSVBError.init(_:_:_:)((uint64_t)&aBlock, v40, 0, v41);
      swift_willThrow();
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_2487A4314()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  id v18;
  id v19;
  uint64_t v20;

  v1 = v0;
  v2 = sub_2487B533C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2487B542C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (uint64_t *)((char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = *(void **)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *v10 = v11;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v7 + 104))(v10, *MEMORY[0x24BEE5610], v6, v8);
  v12 = v11;
  LOBYTE(v11) = sub_2487B5444();
  (*(void (**)(_QWORD *, uint64_t))(v7 + 8))(v10, v6);
  if ((v11 & 1) != 0)
  {
    v13 = OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state;
    if (*(_BYTE *)(*(_QWORD *)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state)
                  + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioEngineTapInstalled) == 1)
    {
      v14 = sub_2487B0C04();
      (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v14, v2);
      v15 = sub_2487B5324();
      v16 = sub_2487B57E0();
      if (os_log_type_enabled(v15, v16))
      {
        v17 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_2486E6000, v15, v16, "Removing audio tap", v17, 2u);
        MEMORY[0x24959AF80](v17, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      v18 = sub_248798770();
      v19 = objc_msgSend(v18, sel_inputNode);

      objc_msgSend(v19, sel_removeTapOnBus_, 0);
      *(_BYTE *)(*(_QWORD *)(v1 + v13)
               + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioEngineTapInstalled) = 0;
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_2487A4518()
{
  void *v0;
  id v1;
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  unsigned int v19;
  uint64_t v21;
  int64_t v22;
  id v23;
  uint64_t v24;
  unint64_t v25;
  __int128 v26;
  _OWORD v27[2];
  uint64_t v28;
  unint64_t v29;
  __int128 v30;
  uint64_t v31;
  unint64_t v32;

  v28 = 0;
  v29 = 0xE000000000000000;
  sub_2487B5AA4();
  sub_2487B55AC();
  objc_msgSend(v0, sel_isStandard);
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  sub_2487B55AC();
  LODWORD(v26) = objc_msgSend(v0, sel_channelCount);
  sub_2487B5CCC();
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  sub_2487B55AC();
  objc_msgSend(v0, sel_sampleRate);
  sub_2487B5714();
  sub_2487B55AC();
  objc_msgSend(v0, sel_isInterleaved);
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  sub_2487B55AC();
  objc_msgSend(v0, sel_commonFormat);
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  v31 = 0;
  v32 = 0xE000000000000000;
  v1 = objc_msgSend(v0, sel_settings);
  v2 = sub_2487B5474();

  v3 = 0;
  v21 = v2 + 64;
  v4 = 1 << *(_BYTE *)(v2 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(v2 + 64);
  v22 = (unint64_t)(v4 + 63) >> 6;
  while (1)
  {
    if (v6)
    {
      v7 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      v8 = v7 | (v3 << 6);
LABEL_7:
      v9 = *(_QWORD *)(v2 + 56);
      v10 = (_QWORD *)(*(_QWORD *)(v2 + 48) + 16 * v8);
      v11 = v10[1];
      *(_QWORD *)&v26 = *v10;
      *((_QWORD *)&v26 + 1) = v11;
      sub_2486F0814(v9 + 32 * v8, (uint64_t)v27);
      swift_bridgeObjectRetain();
      goto LABEL_26;
    }
    v12 = v3 + 1;
    if (__OFADD__(v3, 1))
    {
      __break(1u);
LABEL_37:
      __break(1u);
      JUMPOUT(0x2487A4B78);
    }
    if (v12 < v22)
    {
      v13 = *(_QWORD *)(v21 + 8 * v12);
      if (v13)
        goto LABEL_11;
      v14 = v3 + 2;
      ++v3;
      if (v12 + 1 < v22)
      {
        v13 = *(_QWORD *)(v21 + 8 * v14);
        if (v13)
          goto LABEL_14;
        v3 = v12 + 1;
        if (v12 + 2 < v22)
        {
          v13 = *(_QWORD *)(v21 + 8 * (v12 + 2));
          if (v13)
          {
            v12 += 2;
            goto LABEL_11;
          }
          v14 = v12 + 3;
          v3 = v12 + 2;
          if (v12 + 3 < v22)
          {
            v13 = *(_QWORD *)(v21 + 8 * v14);
            if (v13)
            {
LABEL_14:
              v12 = v14;
LABEL_11:
              v6 = (v13 - 1) & v13;
              v8 = __clz(__rbit64(v13)) + (v12 << 6);
              v3 = v12;
              goto LABEL_7;
            }
            while (1)
            {
              v12 = v14 + 1;
              if (__OFADD__(v14, 1))
                goto LABEL_37;
              if (v12 >= v22)
                break;
              v13 = *(_QWORD *)(v21 + 8 * v12);
              ++v14;
              if (v13)
                goto LABEL_11;
            }
            v3 = v22 - 1;
          }
        }
      }
    }
    v6 = 0;
    memset(v27, 0, sizeof(v27));
    v26 = 0u;
LABEL_26:
    sub_2486F4F70((uint64_t)&v26, (uint64_t)&v28, &qword_25777D3F0);
    v15 = v29;
    if (!v29)
      break;
    v16 = v28;
    sub_24870A40C(&v30, &v26);
    if (v16 == sub_2487B5528() && v17 == v15)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v18 = sub_2487B5CE4();
      swift_bridgeObjectRelease();
      if ((v18 & 1) == 0)
      {
        v24 = 0;
        v25 = 0xE000000000000000;
        sub_2487B55AC();
        sub_2487B55AC();
        swift_bridgeObjectRelease();
        sub_2487B55AC();
        sub_2487B5B40();
        goto LABEL_34;
      }
    }
    sub_2486F0814((uint64_t)&v26, (uint64_t)&v24);
    sub_24870A34C(0, &qword_25445F178);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_4;
    v19 = objc_msgSend(v23, sel_unsignedIntValue);

    v24 = 32;
    v25 = 0xE100000000000000;
    sub_2487B55AC();
    swift_bridgeObjectRelease();
    sub_2487B55AC();
    sub_2487A9870(v19);
    sub_2487B55AC();
    swift_bridgeObjectRelease();
LABEL_34:
    sub_2487B55AC();
LABEL_4:
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)&v26);
  }
  swift_release();
  return v31;
}

uint64_t sub_2487A4B8C(int64_t a1, int64_t a2, uint64_t a3, uint64_t a4)
{
  int64_t v7;
  int64_t v8;
  int64_t v9;
  _BOOL4 v10;
  BOOL v11;
  uint64_t result;
  BOOL v13;
  int v14;
  int64_t v15;
  unint64_t v16;
  unint64_t v17;
  BOOL v18;
  unint64_t v19;
  int64_t v20;
  int v21;
  unint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v7 = a1;
  v8 = 0;
  v9 = a1;
  while (1)
  {
    v10 = v9 <= a2;
    if (a3 > 0)
      v10 = v9 >= a2;
    if (v10)
      break;
    v11 = __OFADD__(v9, a3);
    v9 += a3;
    if (v11)
      v9 = (v9 >> 63) ^ 0x8000000000000000;
    v11 = __OFADD__(v8++, 1);
    if (v11)
    {
      __break(1u);
      break;
    }
  }
  v24 = MEMORY[0x24BEE4AF8];
  sub_2487AADB8(0, v8, 0);
  result = v24;
  if (v8)
  {
    while (1)
    {
      v13 = v7 <= a2;
      if (a3 > 0)
        v13 = v7 >= a2;
      if (v13)
        break;
      v14 = *(_DWORD *)(a4 + 4 * v7);
      if (__OFADD__(v7, a3))
        v15 = ((v7 + a3) >> 63) ^ 0x8000000000000000;
      else
        v15 = v7 + a3;
      v25 = result;
      v17 = *(_QWORD *)(result + 16);
      v16 = *(_QWORD *)(result + 24);
      if (v17 >= v16 >> 1)
      {
        sub_2487AADB8(v16 > 1, v17 + 1, 1);
        result = v25;
      }
      *(_QWORD *)(result + 16) = v17 + 1;
      *(_DWORD *)(result + 4 * v17 + 32) = v14;
      v7 = v15;
      if (!--v8)
        goto LABEL_22;
    }
    __break(1u);
  }
  else
  {
    v15 = v7;
LABEL_22:
    v18 = v15 <= a2;
    if (a3 > 0)
      v18 = v15 >= a2;
    if (!v18)
    {
      v19 = *(_QWORD *)(result + 16);
      do
      {
        if (__OFADD__(v15, a3))
          v20 = ((v15 + a3) >> 63) ^ 0x8000000000000000;
        else
          v20 = v15 + a3;
        v21 = *(_DWORD *)(a4 + 4 * v15);
        v26 = result;
        v22 = *(_QWORD *)(result + 24);
        if (v19 >= v22 >> 1)
        {
          sub_2487AADB8(v22 > 1, v19 + 1, 1);
          result = v26;
        }
        *(_QWORD *)(result + 16) = v19 + 1;
        *(_DWORD *)(result + 4 * v19 + 32) = v21;
        v23 = v20 <= a2;
        if (a3 > 0)
          v23 = v20 >= a2;
        ++v19;
        v15 = v20;
      }
      while (!v23);
    }
  }
  return result;
}

void sub_2487A4D70(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, id);
  id v6;
  id v7;

  v5 = *(void (**)(id, id))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, v6);
  swift_release();

}

uint64_t TTSVBAudioService.configureAudioSessionForAudioFilePlayback(completion:)(uint64_t a1, uint64_t a2)
{
  return sub_2487A4DF8(a1, a2, (uint64_t)&unk_2519962F0, (uint64_t)sub_2487ABAF4, (uint64_t)&block_descriptor_48);
}

uint64_t sub_2487A4DF8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  _QWORD *v16;
  void *v17;
  char *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];

  v10 = sub_2487B53D8();
  v22 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_2487B5408();
  v13 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = *(_QWORD *)&v5[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = v5;
  v16[3] = a1;
  v16[4] = a2;
  aBlock[4] = a4;
  aBlock[5] = v16;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2486F1008;
  aBlock[3] = a5;
  v17 = _Block_copy(aBlock);
  v18 = v5;
  swift_retain();
  sub_2487B53E4();
  v23 = MEMORY[0x24BEE4AF8];
  sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
  sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
  sub_2487B59FC();
  MEMORY[0x24959A1AC](0, v15, v12, v17);
  _Block_release(v17);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v10);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v21);
  return swift_release();
}

uint64_t sub_2487A4FF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[7];

  v5 = sub_2487B53D8();
  v16 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2487B5408();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487A2764(*MEMORY[0x24BDB1618]);
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a3;
  aBlock[4] = sub_248750B50;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2486F1008;
  aBlock[3] = &block_descriptor_61_0;
  v13 = _Block_copy(aBlock);
  swift_retain();
  sub_2487B53E4();
  v17 = MEMORY[0x24BEE4AF8];
  sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
  sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
  sub_2487B59FC();
  MEMORY[0x24959A1AC](0, v11, v7, v13);
  _Block_release(v13);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v7, v5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return swift_release();
}

uint64_t sub_2487A5354(char a1)
{
  char *v2;
  unint64_t v3;
  unint64_t v4;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t v20;
  unint64_t v21;
  char *v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  unint64_t v26;
  unint64_t v27;
  char *v28;

  if ((a1 & 1) == 0)
  {
    v2 = (char *)MEMORY[0x24BEE4AF8];
    if ((a1 & 2) == 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v2 = sub_248709428(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v4 = *((_QWORD *)v2 + 2);
  v3 = *((_QWORD *)v2 + 3);
  if (v4 >= v3 >> 1)
    v2 = sub_248709428((char *)(v3 > 1), v4 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v4 + 1;
  v5 = &v2[16 * v4];
  strcpy(v5 + 32, "mixWithOthers");
  *((_WORD *)v5 + 23) = -4864;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_248709428(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v7 = *((_QWORD *)v2 + 2);
    v6 = *((_QWORD *)v2 + 3);
    if (v7 >= v6 >> 1)
      v2 = sub_248709428((char *)(v6 > 1), v7 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v7 + 1;
    v8 = &v2[16 * v7];
    *((_QWORD *)v8 + 4) = 0x6568744F6B637564;
    *((_QWORD *)v8 + 5) = 0xEA00000000007372;
  }
LABEL_12:
  if ((a1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_248709428(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v10 = *((_QWORD *)v2 + 2);
    v9 = *((_QWORD *)v2 + 3);
    if (v10 >= v9 >> 1)
      v2 = sub_248709428((char *)(v9 > 1), v10 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v10 + 1;
    v11 = &v2[16 * v10];
    strcpy(v11 + 32, "allowBluetooth");
    v11[47] = -18;
  }
  if ((a1 & 8) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_248709428(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v13 = *((_QWORD *)v2 + 2);
    v12 = *((_QWORD *)v2 + 3);
    if (v13 >= v12 >> 1)
      v2 = sub_248709428((char *)(v12 > 1), v13 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v13 + 1;
    v14 = &v2[16 * v13];
    *((_QWORD *)v14 + 4) = 0xD000000000000010;
    *((_QWORD *)v14 + 5) = 0x80000002487C7860;
  }
  if ((~a1 & 0x11) != 0)
  {
    if ((a1 & 0x20) == 0)
      goto LABEL_26;
  }
  else
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_248709428(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v18 = *((_QWORD *)v2 + 2);
    v17 = *((_QWORD *)v2 + 3);
    if (v18 >= v17 >> 1)
      v2 = sub_248709428((char *)(v17 > 1), v18 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v18 + 1;
    v19 = &v2[16 * v18];
    *((_QWORD *)v19 + 4) = 0xD000000000000024;
    *((_QWORD *)v19 + 5) = 0x80000002487C7830;
    if ((a1 & 0x20) == 0)
    {
LABEL_26:
      if ((a1 & 0x40) == 0)
        goto LABEL_27;
      goto LABEL_41;
    }
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_248709428(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v21 = *((_QWORD *)v2 + 2);
  v20 = *((_QWORD *)v2 + 3);
  if (v21 >= v20 >> 1)
    v2 = sub_248709428((char *)(v20 > 1), v21 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v21 + 1;
  v22 = &v2[16 * v21];
  *((_QWORD *)v22 + 4) = 0xD000000000000012;
  *((_QWORD *)v22 + 5) = 0x80000002487C7810;
  if ((a1 & 0x40) == 0)
  {
LABEL_27:
    if ((a1 & 0x80) == 0)
      goto LABEL_28;
LABEL_46:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_248709428(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
    v27 = *((_QWORD *)v2 + 2);
    v26 = *((_QWORD *)v2 + 3);
    v15 = v27 + 1;
    if (v27 >= v26 >> 1)
      v2 = sub_248709428((char *)(v26 > 1), v27 + 1, 1, v2);
    *((_QWORD *)v2 + 2) = v15;
    v28 = &v2[16 * v27];
    *((_QWORD *)v28 + 4) = 0xD000000000000023;
    *((_QWORD *)v28 + 5) = 0x80000002487C77E0;
    if (v27)
      goto LABEL_29;
LABEL_51:
    v16 = *((_QWORD *)v2 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return v16;
  }
LABEL_41:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_248709428(0, *((_QWORD *)v2 + 2) + 1, 1, v2);
  v24 = *((_QWORD *)v2 + 2);
  v23 = *((_QWORD *)v2 + 3);
  if (v24 >= v23 >> 1)
    v2 = sub_248709428((char *)(v23 > 1), v24 + 1, 1, v2);
  *((_QWORD *)v2 + 2) = v24 + 1;
  v25 = &v2[16 * v24];
  strcpy(v25 + 32, "allowAirPlay");
  v25[45] = 0;
  *((_WORD *)v25 + 23) = -5120;
  if (a1 < 0)
    goto LABEL_46;
LABEL_28:
  v15 = *((_QWORD *)v2 + 2);
  if (v15 == 1)
    goto LABEL_51;
LABEL_29:
  if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445F138);
    sub_24871869C((unint64_t *)&qword_25445F140, &qword_25445F138, MEMORY[0x24BEE12B0]);
    sub_2487B5498();
    swift_bridgeObjectRelease();
    sub_2487B55AC();
    swift_bridgeObjectRelease();
    sub_2487B55AC();
    return 91;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 1701736270;
  }
}

id sub_2487A58A8()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  _QWORD *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t inited;
  void **v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  void *v33;
  id v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char v40;
  uint64_t v41;
  void *v42;
  id v43;
  id v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  BOOL v55;
  char v56;
  _BYTE *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  char v67;
  uint64_t v68;
  NSObject *v69;
  NSObject *v70;
  os_log_type_t v71;
  _BOOL4 v72;
  uint8_t *v73;
  uint64_t v74;
  id v75;
  unint64_t v76;
  id v77;
  uint64_t v78;
  unint64_t v79;
  unint64_t v80;
  void (*v81)(_BYTE *, unint64_t);
  id v82;
  unsigned __int8 v83;
  _QWORD *v84;
  id v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  NSObject *v90;
  int v91;
  void *v92;
  uint64_t v93;
  id v94;
  id v95;
  uint64_t v96;
  unint64_t v97;
  unint64_t v98;
  _QWORD *v99;
  unint64_t v100;
  void *v101;
  void *v102;
  id v103;
  uint64_t v104;
  unint64_t v105;
  unint64_t v106;
  os_log_t v107;
  void *v108;
  _BYTE v110[16];
  unint64_t v111;
  _QWORD *v112;
  id v113;
  char *v114;
  _BYTE *v115;
  unint64_t v116;
  uint64_t v117;
  uint64_t v118;
  _BYTE *v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  void *v123;
  unint64_t v124;
  os_log_t v125;
  uint64_t v126;
  id v127;
  uint64_t v128[3];
  id v129;
  uint64_t v130;

  v130 = *MEMORY[0x24BDAC8D0];
  v1 = sub_2487B533C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v110[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v110[-v6];
  v8 = sub_2487B542C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = &v110[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = *(void **)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *v12 = v13;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v9 + 104))(v12, *MEMORY[0x24BEE5610], v8, v10);
  v14 = v13;
  LOBYTE(v13) = sub_2487B5444();
  (*(void (**)(_QWORD *, uint64_t))(v9 + 8))(v12, v8);
  if ((v13 & 1) == 0)
    goto LABEL_106;
  v129 = 0;
  v113 = *(id *)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession);
  v15 = objc_msgSend(v113, sel_availableInputs);
  v112 = v4;
  v118 = v2;
  if (v15)
  {
    v16 = v15;
    sub_24870A34C(0, &qword_25777DB48);
    sub_2487B5684();

  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF58);
  inited = swift_initStackObject();
  v18 = (void **)MEMORY[0x24BDB16F8];
  *(_OWORD *)(inited + 16) = xmmword_2487BE660;
  v19 = *v18;
  v20 = (void *)*MEMORY[0x24BDB1700];
  *(_QWORD *)(inited + 32) = *v18;
  *(_QWORD *)(inited + 40) = v20;
  v21 = (void *)*MEMORY[0x24BDB1718];
  v22 = (void *)*MEMORY[0x24BDB1710];
  *(_QWORD *)(inited + 48) = *MEMORY[0x24BDB1718];
  *(_QWORD *)(inited + 56) = v22;
  v23 = (id)*MEMORY[0x24BDB16C8];
  v24 = v19;
  v25 = v20;
  v26 = v21;
  v27 = v22;
  v4 = sub_2487AA3FC((_QWORD *)1, 5, 1, (_QWORD *)inited);
  v4[2] = 5;
  v4[8] = v23;

  v28 = objc_msgSend(v113, sel_availableInputs);
  if (v28)
  {
    v29 = v28;
    sub_24870A34C(0, &qword_25777DB48);
    v0 = sub_2487B5684();

  }
  else
  {
    v0 = MEMORY[0x24BEE4AF8];
  }
  v2 = v118;
  if (v0 >> 62)
    goto LABEL_107;
  v30 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v119 = v7;
    if (!v30)
      break;
    v111 = v1;
    v1 = 0;
    v31 = v4[2];
    v123 = 0;
    v124 = v0 & 0xC000000000000001;
    v117 = v0 & 0xFFFFFFFFFFFFFF8;
    v116 = v0 + 32;
    v125 = v31;
    v114 = (char *)&v31[-1].isa + 6;
    v121 = v0;
    v120 = v30;
    while (1)
    {
      if (v124)
      {
        v32 = (id)MEMORY[0x24959A434](v1, v0);
      }
      else
      {
        if (v1 >= *(_QWORD *)(v117 + 16))
          goto LABEL_101;
        v32 = *(id *)(v116 + 8 * v1);
      }
      v33 = v32;
      if (__OFADD__(v1++, 1))
        break;
      swift_bridgeObjectRetain();
      v35 = objc_msgSend(v33, sel_portType);
      if (!v125)
      {
        swift_bridgeObjectRelease();
        goto LABEL_27;
      }
      if (!v4[2])
        goto LABEL_100;
      v36 = sub_2487B5528();
      v0 = v37;
      if (v36 == sub_2487B5528() && v0 == v38)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease_n();
        goto LABEL_29;
      }
      v40 = sub_2487B5CE4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v40 & 1) != 0)
      {
        swift_bridgeObjectRelease();

LABEL_29:
        v41 = 0;
        goto LABEL_30;
      }
      if (v125 == (os_log_t)1)
      {
        swift_bridgeObjectRelease();
        goto LABEL_39;
      }
      if (v4[2] < 2uLL)
        goto LABEL_105;
      v52 = sub_2487B5528();
      v0 = v53;
      if (v52 == sub_2487B5528() && v0 == v54)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease_n();
LABEL_58:
        v41 = 1;
        goto LABEL_30;
      }
      v56 = sub_2487B5CE4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v56 & 1) != 0)
      {
        swift_bridgeObjectRelease();

        goto LABEL_58;
      }
      v62 = 0;
      while (1)
      {
        v2 = v62;
        if (v114 == (char *)v62)
        {
          swift_bridgeObjectRelease();
          v2 = v118;
LABEL_39:
          v0 = v121;
          v30 = v120;
LABEL_27:

          goto LABEL_55;
        }
        if ((unint64_t)(v62 + 2) >= v4[2])
          goto LABEL_103;
        v63 = sub_2487B5528();
        v0 = v64;
        if (v63 == sub_2487B5528() && v0 == v65)
          break;
        v67 = sub_2487B5CE4();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        v62 = v2 + 1;
        if ((v67 & 1) != 0)
        {
          swift_bridgeObjectRelease();

          goto LABEL_80;
        }
      }
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease_n();
LABEL_80:
      v41 = v2 + 2;
      v2 = v118;
LABEL_30:
      v42 = v123;
      if (!v123)
      {
        v129 = v33;
        v123 = v33;
        v7 = v119;
        v0 = v121;
        v30 = v120;
        goto LABEL_12;
      }
      v122 = v41;
      swift_bridgeObjectRetain();
      v43 = v42;
      v44 = objc_msgSend(v43, sel_portType);
      v7 = (_BYTE *)v4[2];
      if (!v7)
        goto LABEL_108;
      v45 = sub_2487B5528();
      v0 = v46;
      if (v45 == sub_2487B5528() && v0 == v47)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease_n();
        v48 = 0;
        goto LABEL_52;
      }
      v2 = sub_2487B5CE4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v2 & 1) != 0)
      {
        swift_bridgeObjectRelease();

        v48 = 0;
        goto LABEL_52;
      }
      if (v7 == (_BYTE *)1)
      {
LABEL_108:
        swift_bridgeObjectRelease();

        __break(1u);
      }
      if (v4[2] < 2uLL)
        goto LABEL_104;
      v49 = sub_2487B5528();
      v0 = v50;
      if (v49 == sub_2487B5528() && v0 == v51)
      {
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease_n();
        goto LABEL_51;
      }
      v2 = sub_2487B5CE4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v2 & 1) != 0)
      {
        swift_bridgeObjectRelease();

LABEL_51:
        v48 = 1;
      }
      else
      {
        v57 = 0;
        v115 = v7 - 2;
        while (1)
        {
          v7 = v57;
          if (v115 == v57)
            goto LABEL_108;
          if ((unint64_t)(v57 + 2) >= v4[2])
            goto LABEL_102;
          v58 = sub_2487B5528();
          v0 = v59;
          if (v58 == sub_2487B5528() && v0 == v60)
            break;
          v2 = sub_2487B5CE4();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v57 = v7 + 1;
          if ((v2 & 1) != 0)
          {
            swift_bridgeObjectRelease();

            v48 = (uint64_t)(v7 + 2);
            goto LABEL_52;
          }
        }
        swift_bridgeObjectRelease();

        swift_bridgeObjectRelease_n();
        v48 = (uint64_t)(v7 + 2);
      }
LABEL_52:

      v55 = v122 < v48;
      v2 = v118;
      v7 = v119;
      v0 = v121;
      v30 = v120;
      if (v55)
      {

        v129 = v33;
        v123 = v33;
      }
      else
      {
LABEL_55:

      }
LABEL_12:
      if (v1 == v30)
      {
        swift_bridgeObjectRelease();
        v1 = v111;
        goto LABEL_83;
      }
    }
    __break(1u);
LABEL_100:
    __break(1u);
LABEL_101:
    __break(1u);
LABEL_102:
    __break(1u);
LABEL_103:
    __break(1u);
LABEL_104:
    __break(1u);
LABEL_105:
    __break(1u);
LABEL_106:
    __break(1u);
LABEL_107:
    swift_bridgeObjectRetain();
    v30 = sub_2487B5B64();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
LABEL_83:
  swift_bridgeObjectRelease();
  v68 = sub_2487B0C04();
  v69 = *(NSObject **)(v2 + 16);
  ((void (*)(_BYTE *, uint64_t, unint64_t))v69)(v7, v68, v1);
  v70 = sub_2487B5324();
  v71 = sub_2487B57E0();
  v72 = os_log_type_enabled(v70, v71);
  v124 = v68;
  v125 = v69;
  if (v72)
  {
    v73 = (uint8_t *)swift_slowAlloc();
    v74 = swift_slowAlloc();
    v128[0] = v74;
    *(_DWORD *)v73 = 136315138;
    swift_beginAccess();
    if (v129)
    {
      v75 = v129;
      v76 = v1;
      v77 = objc_msgSend(v75, sel_portName);
      v78 = sub_2487B5528();
      v80 = v79;

      v1 = v76;
    }
    else
    {
      v78 = 7104878;
      v80 = 0xE300000000000000;
    }
    v127 = (id)sub_2486EDE5C(v78, v80, v128);
    sub_2487B593C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2486E6000, v70, v71, "Will set preferred input: %s", v73, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24959AF80](v74, -1, -1);
    MEMORY[0x24959AF80](v73, -1, -1);

    v81 = *(void (**)(_BYTE *, unint64_t))(v118 + 8);
    v81(v119, v1);
  }
  else
  {

    v81 = *(void (**)(_BYTE *, unint64_t))(v2 + 8);
    v81(v7, v1);
  }
  swift_beginAccess();
  v82 = v129;
  v127 = 0;
  v83 = objc_msgSend(v113, sel_setPreferredInput_error_, v129, &v127);
  v84 = v112;
  if ((v83 & 1) != 0)
  {
    v85 = v127;
  }
  else
  {
    v86 = v127;
    v87 = (void *)sub_2487B4F64();

    swift_willThrow();
    ((void (*)(_QWORD *, unint64_t, unint64_t))v125)(v84, v124, v1);
    v88 = v87;
    v89 = v87;
    v90 = sub_2487B5324();
    v91 = sub_2487B57D4();
    if (os_log_type_enabled(v90, (os_log_type_t)v91))
    {
      LODWORD(v124) = v91;
      v111 = v1;
      v92 = v87;
      v93 = swift_slowAlloc();
      v123 = (void *)swift_slowAlloc();
      v127 = v123;
      *(_DWORD *)v93 = 136315394;
      v125 = v90;
      if (v129)
      {
        v94 = v129;
        v95 = objc_msgSend(v94, sel_portName);
        v96 = sub_2487B5528();
        v98 = v97;

      }
      else
      {
        v96 = 7104878;
        v98 = 0xE300000000000000;
      }
      v126 = sub_2486EDE5C(v96, v98, (uint64_t *)&v127);
      sub_2487B593C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v93 + 12) = 2080;
      v101 = v92;
      v102 = (void *)sub_2487B4F58();
      v103 = objc_msgSend(v102, sel_description);

      v104 = sub_2487B5528();
      v106 = v105;

      v126 = sub_2486EDE5C(v104, v106, (uint64_t *)&v127);
      sub_2487B593C();
      swift_bridgeObjectRelease();

      v107 = v125;
      _os_log_impl(&dword_2486E6000, v125, (os_log_type_t)v124, "Could not set preferred input: %s. Error=%s", (uint8_t *)v93, 0x16u);
      v108 = v123;
      swift_arrayDestroy();
      MEMORY[0x24959AF80](v108, -1, -1);
      MEMORY[0x24959AF80](v93, -1, -1);

      v99 = v112;
      v100 = v111;
    }
    else
    {

      v99 = v84;
      v100 = v1;
    }
    v81(v99, v100);
    swift_willThrow();

  }
  return v82;
}

void sub_2487A6630(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
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
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  unint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  _QWORD *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  int v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  char *v37;
  id v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  void *v46;
  void (*v47)(NSObject *, char *);
  id v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  char *v52;
  NSObject *v53;
  NSObject *v54;
  os_log_type_t v55;
  _BOOL4 v56;
  uint64_t v57;
  uint8_t *v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  void (*v62)(NSObject *, char *);
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char v68;
  id v69;
  void *v70;
  NSObject *v71;
  NSObject *v72;
  os_log_type_t v73;
  uint8_t *v74;
  uint64_t v75;
  __int128 v76;
  NSObject *v77;
  NSObject *v78;
  id v79;
  void *v80;
  id v81;
  NSObject *v82;
  os_log_type_t v83;
  uint64_t v84;
  void *v85;
  id v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  uint64_t v97;
  NSObject *v98;
  NSObject *v99;
  os_log_type_t v100;
  uint8_t *v101;
  void *v102;
  uint64_t v103;
  id v104;
  NSObject *v105;
  os_log_type_t v106;
  uint8_t *v107;
  void *v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  unint64_t v113;
  NSObject *v114;
  char *v115;
  id v116;
  char v117;
  uint64_t v118;
  char *v119;
  NSObject *v120;
  id v121;
  id v122;
  NSObject *v123;
  NSObject *v124;
  char *v125;
  id v126;
  NSObject *v127;
  os_log_type_t v128;
  int v129;
  _BOOL4 v130;
  void *v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  unint64_t v135;
  id v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t v139;
  unint64_t v140;
  id v141;
  uint64_t v142;
  unint64_t v143;
  unint64_t v144;
  uint64_t v145;
  NSObject *v146;
  unint64_t v147;
  char *v148;
  NSObject *v149;
  os_log_type_t v150;
  uint8_t *v151;
  NSObject *v152;
  NSObject *v153;
  char *v154;
  unsigned int v155;
  id v156;
  void (*v157)(char *, uint64_t, char *);
  uint64_t v158;
  id v159;
  unsigned int v160;
  id v161;
  id v162;
  void *v163;
  char *v164;
  id v165;
  char *v166;
  id v167;
  NSObject *v168;
  os_log_type_t v169;
  uint64_t v170;
  uint64_t v171;
  unint64_t v172;
  void *v173;
  id v174;
  id v175;
  uint64_t v176;
  unint64_t v177;
  unint64_t v178;
  void *v179;
  NSObject *v180;
  NSObject *v181;
  char *v182;
  id v183;
  uint64_t v184;
  NSObject *v185;
  char *v186;
  char *v187;
  NSObject *v188;
  id v189;
  NSObject *v190;
  void *v191;
  id v192;
  uint64_t v193;
  __int128 v194;
  uint64_t v195;
  unint64_t v196;
  NSObject *v197;
  char *v198;
  uint64_t v199;
  char *v200;
  NSObject *v201;
  void (*v202)(NSObject *, char *);
  uint64_t v203;
  id v204[3];

  v192 = a1;
  v204[1] = *(id *)MEMORY[0x24BDAC8D0];
  v199 = sub_2487B533C();
  v2 = *(_QWORD *)(v199 - 8);
  MEMORY[0x24BDAC7A8](v199);
  v4 = (char *)&v184 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v184 - v6;
  MEMORY[0x24BDAC7A8](v8);
  v185 = (char *)&v184 - v9;
  MEMORY[0x24BDAC7A8](v10);
  v188 = ((char *)&v184 - v11);
  MEMORY[0x24BDAC7A8](v12);
  v187 = (char *)&v184 - v13;
  MEMORY[0x24BDAC7A8](v14);
  v197 = ((char *)&v184 - v15);
  MEMORY[0x24BDAC7A8](v16);
  v201 = ((char *)&v184 - v17);
  MEMORY[0x24BDAC7A8](v18);
  v20 = ((char *)&v184 - v19);
  MEMORY[0x24BDAC7A8](v21);
  v23 = ((char *)&v184 - v22);
  v24 = sub_2487B542C();
  v25 = *(_QWORD *)(v24 - 8);
  v26 = MEMORY[0x24BDAC7A8](v24);
  v28 = (uint64_t *)((char *)&v184 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0));
  v29 = *(void **)(v1 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *v28 = v29;
  (*(void (**)(_QWORD *, _QWORD, unint64_t, double))(v25 + 104))(v28, *MEMORY[0x24BEE5610], v24, v26);
  v30 = v29;
  LOBYTE(v29) = sub_2487B5444();
  (*(void (**)(_QWORD *, unint64_t))(v25 + 8))(v28, v24);
  if ((v29 & 1) == 0)
  {
    __break(1u);
    goto LABEL_62;
  }
  v31 = (id)*sub_2487274FC();
  v32 = NSUserDefaults.ttsvb_overrideBuiltInMicPolarPattern.getter();

  v33 = TTSVBIsInternalUIBuild();
  v189 = v32;
  v186 = v4;
  if (v33 && v32)
  {
    v34 = sub_2487B0C04();
    v35 = *(char **)(v2 + 16);
    v36 = v2;
    v37 = (char *)v199;
    v198 = v35;
    ((void (*)(NSObject *, uint64_t, uint64_t))v35)(v23, v34, v199);
    v38 = v32;
    v39 = sub_2487B5324();
    v40 = sub_2487B57BC();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = (void *)swift_slowAlloc();
      v200 = v7;
      v43 = v42;
      v204[0] = v42;
      v202 = (void (*)(NSObject *, char *))v36;
      *(_DWORD *)v41 = 136315138;
      v196 = (unint64_t)(v41 + 4);
      v44 = sub_2487B5528();
      v203 = sub_2486EDE5C(v44, v45, (uint64_t *)v204);
      sub_2487B593C();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2486E6000, v39, v40, "Will consider override polar pattern: %s", v41, 0xCu);
      swift_arrayDestroy();
      v46 = v43;
      v7 = v200;
      MEMORY[0x24959AF80](v46, -1, -1);
      MEMORY[0x24959AF80](v41, -1, -1);

      v47 = (void (*)(NSObject *, char *))*((_QWORD *)v202 + 1);
    }
    else
    {

      v47 = *(void (**)(NSObject *, char *))(v36 + 8);
    }
    v202 = v47;
    v47(v23, v37);
    v20 = v37;
    v190 = v38;
  }
  else
  {
    v48 = (id)*MEMORY[0x24BDB1690];
    v49 = sub_2487B0C04();
    v50 = *(char **)(v2 + 16);
    v51 = v2;
    v52 = (char *)v199;
    v198 = v50;
    ((void (*)(NSObject *, uint64_t, uint64_t))v50)(v20, v49, v199);
    v53 = v48;
    v54 = sub_2487B5324();
    v55 = sub_2487B57BC();
    v56 = os_log_type_enabled(v54, v55);
    v190 = v53;
    if (v56)
    {
      v200 = v7;
      v57 = swift_slowAlloc();
      v202 = (void (*)(NSObject *, char *))v51;
      v58 = (uint8_t *)v57;
      v59 = (void *)swift_slowAlloc();
      v204[0] = v59;
      *(_DWORD *)v58 = 136315138;
      v196 = (unint64_t)(v58 + 4);
      v60 = sub_2487B5528();
      v203 = sub_2486EDE5C(v60, v61, (uint64_t *)v204);
      sub_2487B593C();

      v7 = v200;
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2486E6000, v54, v55, "Will consider default polar pattern: %s", v58, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959AF80](v59, -1, -1);
      MEMORY[0x24959AF80](v58, -1, -1);

      v62 = (void (*)(NSObject *, char *))*((_QWORD *)v202 + 1);
    }
    else
    {

      v62 = *(void (**)(NSObject *, char *))(v51 + 8);
    }
    v202 = v62;
    v62(v20, v52);
    v20 = v52;
  }
  v63 = objc_msgSend(v192, sel_portType);
  v64 = sub_2487B5528();
  v66 = v65;
  if (v64 == sub_2487B5528() && v66 == v67)
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  v68 = sub_2487B5CE4();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v68 & 1) != 0)
  {
LABEL_16:
    v69 = objc_msgSend(v192, sel_dataSources);
    v23 = v198;
    if (v69)
    {
      v70 = v69;
      sub_24870A34C(0, &qword_25777DF50);
      v196 = sub_2487B5684();

    }
    else
    {
      v196 = MEMORY[0x24BEE4AF8];
    }
    v71 = v201;
    v2 = sub_2487B0C04();
    ((void (*)(NSObject *, uint64_t, NSObject *))v23)(v71, v2, v20);
    v72 = sub_2487B5324();
    v73 = sub_2487B57C8();
    if (os_log_type_enabled(v72, v73))
    {
      v74 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v74 = 0;
      _os_log_impl(&dword_2486E6000, v72, v73, "Available datasources for built-in mic:", v74, 2u);
      MEMORY[0x24959AF80](v74, -1, -1);
    }

    v202(v71, (char *)v20);
    v24 = v196;
    if (!(v196 >> 62))
    {
      v75 = *(_QWORD *)((v196 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      goto LABEL_23;
    }
LABEL_62:
    swift_bridgeObjectRetain();
    v75 = sub_2487B5B64();
LABEL_23:
    v77 = v197;
    v195 = v2;
    if (v75)
    {
      if (v75 < 1)
        __break(1u);
      v78 = 0;
      v200 = (char *)(v24 & 0xC000000000000001);
      *(_QWORD *)&v76 = 136315138;
      v194 = v76;
      v193 = MEMORY[0x24BEE4AD8] + 8;
      v201 = v75;
      do
      {
        if (v200)
          v79 = (id)MEMORY[0x24959A434](v78, v24);
        else
          v79 = *(id *)(v24 + 8 * (_QWORD)v78 + 32);
        v80 = v79;
        ((void (*)(NSObject *, uint64_t, NSObject *))v23)(v77, v2, v20);
        v81 = v80;
        v82 = sub_2487B5324();
        v83 = sub_2487B57C8();
        if (os_log_type_enabled(v82, v83))
        {
          v84 = swift_slowAlloc();
          v85 = (void *)swift_slowAlloc();
          v204[0] = v85;
          *(_DWORD *)v84 = v194;
          v86 = objc_msgSend(v81, sel_dataSourceName);
          v87 = sub_2487B5528();
          v89 = v88;

          v2 = v195;
          v90 = v87;
          v20 = v199;
          *(_QWORD *)(v84 + 4) = sub_2486EDE5C(v90, v89, (uint64_t *)v204);

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2486E6000, v82, v83, "  - %s", (uint8_t *)v84, 0xCu);
          swift_arrayDestroy();
          v91 = v85;
          v24 = v196;
          v77 = v197;
          MEMORY[0x24959AF80](v91, -1, -1);
          v92 = v84;
          v23 = v198;
          MEMORY[0x24959AF80](v92, -1, -1);

        }
        else
        {

        }
        v202(v77, (char *)v20);
        v78 = ((char *)v78 + 1);
      }
      while (v201 != v78);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v93 = v191;
    v94 = sub_2487AB308(v24, 0x746E6F7246, 0xE500000000000000);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v94)
    {
      v95 = objc_msgSend(v94, sel_supportedPolarPatterns);
      v191 = v93;
      if (v95)
      {
        v96 = v95;
        type metadata accessor for PolarPattern(0);
        v97 = sub_2487B5684();

      }
      else
      {
        v97 = MEMORY[0x24BEE4AF8];
      }
      v116 = (id)*MEMORY[0x24BDB1690];
      v117 = sub_2487A7C58((uint64_t)v116, v97);
      swift_bridgeObjectRelease();

      if ((v117 & 1) != 0)
      {
        v118 = v2;
        v119 = v187;
        ((void (*)(char *, uint64_t, NSObject *))v23)(v187, v118, v20);
        v120 = v190;
        v121 = v192;
        v122 = v94;
        v123 = v120;
        v124 = (char *)v121;
        v125 = v119;
        v126 = v122;
        v127 = sub_2487B5324();
        v128 = sub_2487B57E0();
        v129 = v128;
        v201 = v127;
        v130 = os_log_type_enabled(v127, v128);
        v197 = v124;
        if (v130)
        {
          v131 = v124;
          v132 = swift_slowAlloc();
          v196 = swift_slowAlloc();
          v204[0] = (id)v196;
          *(_DWORD *)v132 = 136315650;
          v133 = sub_2487B5528();
          v200 = (char *)v123;
          v134 = v126;
          v203 = sub_2486EDE5C(v133, v135, (uint64_t *)v204);
          sub_2487B593C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v132 + 12) = 2080;
          v136 = objc_msgSend(v131, sel_portName);
          v137 = sub_2487B5528();
          LODWORD(v194) = v129;
          v138 = v137;
          v140 = v139;

          v203 = sub_2486EDE5C(v138, v140, (uint64_t *)v204);
          sub_2487B593C();

          swift_bridgeObjectRelease();
          *(_WORD *)(v132 + 22) = 2080;
          v141 = objc_msgSend(v134, sel_dataSourceName);
          v142 = sub_2487B5528();
          v144 = v143;

          v145 = v142;
          v20 = v199;
          v203 = sub_2486EDE5C(v145, v144, (uint64_t *)v204);
          sub_2487B593C();

          v126 = v134;
          v123 = v200;
          swift_bridgeObjectRelease();
          v146 = v201;
          _os_log_impl(&dword_2486E6000, v201, (os_log_type_t)v194, "Will set preferred polor pattern to %s: input=%s datasource=%s", (uint8_t *)v132, 0x20u);
          v147 = v196;
          swift_arrayDestroy();
          MEMORY[0x24959AF80](v147, -1, -1);
          MEMORY[0x24959AF80](v132, -1, -1);

          v148 = v187;
        }
        else
        {

          v148 = v125;
        }
        v202(v148, (char *)v20);
        v154 = v186;
        v204[0] = 0;
        v155 = objc_msgSend(v126, sel_setPreferredPolarPattern_error_, v116, v204);
        v156 = v204[0];
        v157 = (void (*)(char *, uint64_t, char *))v198;
        v158 = v195;
        if (v155
          && (v204[0] = 0,
              v159 = v156,
              v160 = -[NSObject setPreferredDataSource:error:](v197, sel_setPreferredDataSource_error_, v126, v204), v156 = v204[0], v160))
        {
          v161 = v204[0];

        }
        else
        {
          v162 = v156;
          v163 = (void *)sub_2487B4F64();

          swift_willThrow();
          v157(v154, v158, (char *)v20);
          v164 = v123;
          v165 = v163;
          v166 = v164;
          v167 = v163;
          v168 = sub_2487B5324();
          v169 = sub_2487B57D4();
          if (os_log_type_enabled(v168, v169))
          {
            v170 = swift_slowAlloc();
            v201 = swift_slowAlloc();
            v204[0] = v201;
            *(_DWORD *)v170 = 136315394;
            v191 = v163;
            v171 = sub_2487B5528();
            v203 = sub_2486EDE5C(v171, v172, (uint64_t *)v204);
            sub_2487B593C();

            swift_bridgeObjectRelease();
            *(_WORD *)(v170 + 12) = 2080;
            v200 = (char *)(v170 + 14);
            v173 = (void *)sub_2487B4F58();
            v174 = v126;
            v175 = objc_msgSend(v173, sel_description);

            v176 = sub_2487B5528();
            v178 = v177;

            v126 = v174;
            v203 = sub_2486EDE5C(v176, v178, (uint64_t *)v204);
            v179 = v191;
            sub_2487B593C();
            swift_bridgeObjectRelease();

            _os_log_impl(&dword_2486E6000, v168, v169, "Could not set polar pattern to %s. Error=%s", (uint8_t *)v170, 0x16u);
            v180 = v201;
            swift_arrayDestroy();
            MEMORY[0x24959AF80](v180, -1, -1);
            MEMORY[0x24959AF80](v170, -1, -1);

            v181 = v186;
            v182 = (char *)v199;
          }
          else
          {

            v181 = v154;
            v182 = (char *)v20;
          }
          v202(v181, v182);
          v183 = v189;
          swift_willThrow();

        }
        return;
      }
      ((void (*)(NSObject *, uint64_t, NSObject *))v23)(v188, v2, v20);
      v149 = sub_2487B5324();
      v150 = sub_2487B57C8();
      if (os_log_type_enabled(v149, v150))
      {
        v151 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v151 = 0;
        _os_log_impl(&dword_2486E6000, v149, v150, "Will not set polar pattern. Datasource does not support this pattern", v151, 2u);
        MEMORY[0x24959AF80](v151, -1, -1);
        v152 = v190;
      }
      else
      {
        v152 = v149;
        v149 = v190;
      }

      v153 = v188;
    }
    else
    {
      v98 = v185;
      ((void (*)(NSObject *, uint64_t, NSObject *))v23)(v185, v2, v20);
      swift_bridgeObjectRetain_n();
      v99 = sub_2487B5324();
      v100 = sub_2487B57C8();
      if (os_log_type_enabled(v99, v100))
      {
        v101 = (uint8_t *)swift_slowAlloc();
        v102 = (void *)swift_slowAlloc();
        v204[0] = v102;
        *(_DWORD *)v101 = 136315138;
        swift_bridgeObjectRetain();
        v203 = sub_2486EDE5C(0x746E6F7246, 0xE500000000000000, (uint64_t *)v204);
        sub_2487B593C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2486E6000, v99, v100, "Will not set polar pattern. No datasource name matching '%s'", v101, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24959AF80](v102, -1, -1);
        MEMORY[0x24959AF80](v101, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }

      v153 = v98;
    }
    v202(v153, (char *)v20);
    return;
  }
  v103 = sub_2487B0C04();
  ((void (*)(char *, uint64_t, NSObject *))v198)(v7, v103, v20);
  v104 = v192;
  v105 = sub_2487B5324();
  v106 = sub_2487B57C8();
  if (os_log_type_enabled(v105, v106))
  {
    v107 = (uint8_t *)swift_slowAlloc();
    v108 = (void *)swift_slowAlloc();
    v204[0] = v108;
    *(_DWORD *)v107 = 136315138;
    v201 = (v107 + 4);
    v109 = objc_msgSend(v104, sel_portName);
    v110 = sub_2487B5528();
    v200 = v7;
    v111 = v110;
    v113 = v112;

    v203 = sub_2486EDE5C(v111, v113, (uint64_t *)v204);
    sub_2487B593C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2486E6000, v105, v106, "Will not set polar pattern. input is not built-in mic: %s", v107, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24959AF80](v108, -1, -1);
    MEMORY[0x24959AF80](v107, -1, -1);

    v115 = (char *)v199;
    v114 = v200;
  }
  else
  {

    v114 = v7;
    v115 = (char *)v20;
  }
  v202(v114, v115);
}

void sub_2487A78F8()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  double v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[2];

  v1 = sub_2487B542C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (_QWORD *)((char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = *(void **)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue);
  *v5 = v6;
  (*(void (**)(_QWORD *, _QWORD, unint64_t, double))(v2 + 104))(v5, *MEMORY[0x24BEE5610], v1, v3);
  v7 = v6;
  LOBYTE(v6) = sub_2487B5444();
  (*(void (**)(_QWORD *, unint64_t))(v2 + 8))(v5, v1);
  if ((v6 & 1) == 0)
  {
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v11 = sub_2487B5B64();
    swift_bridgeObjectRelease();
    if (!v11)
      goto LABEL_8;
    goto LABEL_4;
  }
  v8 = *(void **)(v0 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession);
  swift_retain();
  v9 = objc_msgSend(v8, sel_currentRoute);
  v10 = objc_msgSend(v9, sel_inputs);

  sub_24870A34C(0, &qword_25777DB48);
  v1 = sub_2487B5684();

  if (v1 >> 62)
    goto LABEL_10;
  v11 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v11)
  {
LABEL_8:
    swift_bridgeObjectRelease();
    v13[1] = v11;
    sub_2487B5384();
    swift_release();
    return;
  }
LABEL_4:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v12 = (id)MEMORY[0x24959A434](0, v1);
    goto LABEL_7;
  }
  if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v12 = *(id *)(v1 + 32);
LABEL_7:
    v11 = (uint64_t)v12;
    goto LABEL_8;
  }
  __break(1u);
}

uint64_t sub_2487A7AD4()
{
  void *v0;
  void *v1;
  id v2;
  unint64_t v3;
  id v4;
  unint64_t v5;

  v1 = v0;
  sub_2487B5AA4();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_inputs);
  sub_24870A34C(0, &qword_25777DB48);
  v3 = sub_2487B5684();

  sub_2487A9BF0(v3);
  swift_bridgeObjectRelease();
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  sub_2487B55AC();
  v4 = objc_msgSend(v1, sel_outputs);
  v5 = sub_2487B5684();

  sub_2487A9BF0(v5);
  swift_bridgeObjectRelease();
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  sub_2487B55AC();
  return 0x6E492D6574756F52;
}

uint64_t sub_2487A7C58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v17;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  v3 = sub_2487B5528();
  v5 = v4;
  if (v3 == sub_2487B5528() && v5 == v6)
  {
LABEL_20:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  v8 = sub_2487B5CE4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    return 1;
  }
  if (v2 == 1)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    return 0;
  }
  v10 = 5;
  while (1)
  {
    v11 = v10 - 3;
    if (__OFADD__(v10 - 4, 1))
      break;
    v12 = sub_2487B5528();
    v14 = v13;
    if (v12 == sub_2487B5528() && v14 == v15)
    {
      swift_bridgeObjectRelease();
      goto LABEL_20;
    }
    v17 = sub_2487B5CE4();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if ((v17 & 1) != 0)
      goto LABEL_7;
    ++v10;
    if (v11 == v2)
      goto LABEL_17;
  }
  __break(1u);
  return result;
}

id TTSVBAudioService.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void sub_2487A7EA8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  char *v4;
  uint64_t v5;

  v1 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x24BDAC7A8](v1);
  sub_248709554(v0, (uint64_t)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  v4 = (char *)sub_2487A7F34 + 4 * byte_2487C0D09[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2487A7F34()
{
  uint64_t v0;
  id *v1;
  char *v2;
  uint64_t v3;

  v2 = (char *)v1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25777DB50) + 48);
  v3 = sub_2487B51D4();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v0, v2, v3);
}

void sub_2487A7F84()
{
  id *v0;

  JUMPOUT(0x2487A7F44);
}

void sub_2487A7F98()
{
  id *v0;

  sub_2487B51D4();
  JUMPOUT(0x2487A7F6CLL);
}

void sub_2487A7FE0()
{
  id *v0;

  JUMPOUT(0x2487A7F44);
}

void sub_2487A7FF4()
{
  id *v0;

  JUMPOUT(0x2487A7F44);
}

void sub_2487A8008()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  char *v4;
  uint64_t v5;

  v1 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x24BDAC7A8](v1);
  sub_248709554(v0, (uint64_t)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  v4 = (char *)sub_2487A808C + 4 * byte_2487C0D12[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2487A808C()
{
  id *v0;
  char *v1;
  uint64_t v2;

  v1 = (char *)v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25777DB70) + 48);
  v2 = sub_2487B51D4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return 0x7075727265746E49;
}

void sub_2487A838C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(_QWORD);
  char *v4;
  uint64_t v5;

  v1 = type metadata accessor for TTSVBAudioService.AudioSessionEvent(0);
  MEMORY[0x24BDAC7A8](v1);
  sub_248709554(v0, (uint64_t)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), v3);
  v4 = (char *)sub_2487A8420 + 4 * byte_2487C0D1B[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_2487A8420()
{
  id *v0;
  char *v1;
  uint64_t v2;

  v1 = (char *)v0 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25777DB50) + 48);
  v2 = sub_2487B51D4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return 0;
}

unint64_t sub_2487A8AF0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;

  sub_2487B5AA4();
  swift_bridgeObjectRelease();
  v18 = 0xD000000000000013;
  v19 = 0x80000002487C7A30;
  v0 = sub_2487B51D4();
  v14 = *(_QWORD *)(v0 - 8);
  v15 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487A7EA8();
  v3 = sub_2487B5150();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487B5144();
  v7 = sub_2487B5138();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487B512C();
  sub_2487B51B0();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v2, v15);
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  sub_2487B55AC();
  sub_2487A8008();
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  sub_2487A838C();
  if (v11)
  {
    v16 = 2108704;
    v17 = 0xE300000000000000;
    sub_2487B55AC();
    swift_bridgeObjectRelease();
  }
  sub_2487B55AC();
  swift_bridgeObjectRelease();
  return v18;
}

uint64_t sub_2487A8D20()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  sub_2486F5008(v0+ OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioFileURL, &qword_25445ED28);
  swift_release();
  objc_release(*(id *)(v0
                     + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_recordingFormat));
  return swift_deallocClassInstance();
}

_QWORD *sub_2487A8DB0()
{
  _QWORD *v0;
  _QWORD *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF78);
  swift_allocObject();
  v0[2] = sub_2487B5390();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DFC0);
  swift_allocObject();
  v0[3] = sub_2487B5390();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF98);
  swift_allocObject();
  v0[4] = sub_2487B5390();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DFA8);
  swift_allocObject();
  v0[5] = sub_2487B5390();
  swift_allocObject();
  v0[6] = sub_2487B5390();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF88);
  swift_allocObject();
  v0[7] = sub_2487B5390();
  swift_allocObject();
  v0[8] = sub_2487B5390();
  v2 = (char *)v0
     + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioFileURL;
  v3 = sub_2487B50CC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
  v4 = OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_bufferHistory;
  type metadata accessor for TTSVBAudioBufferHistory();
  *(_QWORD *)((char *)v1 + v4) = sub_24872C1A4(300);
  *((_BYTE *)v1
  + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_audioEngineTapInstalled) = 0;
  *(_QWORD *)((char *)v1
            + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_recordingFormat) = 0;
  return v1;
}

unint64_t sub_2487A8F84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25777DB08;
  if (!qword_25777DB08)
  {
    v1 = sub_24870A34C(255, (unint64_t *)&qword_25445F6C0);
    result = MEMORY[0x24959AEB4](MEMORY[0x24BEE5670], v1);
    atomic_store(result, (unint64_t *)&qword_25777DB08);
  }
  return result;
}

uint64_t sub_2487A8FDC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_2487A9000()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;

  v1 = v0 + 16;
  v2 = sub_2487B4EA4();
  if (!v2)
  {
    v11 = 0u;
    v12 = 0u;
LABEL_11:
    sub_2486F5008((uint64_t)&v11, (uint64_t *)&unk_25777CBD0);
    v7 = 0;
    goto LABEL_12;
  }
  v3 = v2;
  *(_QWORD *)&v11 = sub_2487B5528();
  *((_QWORD *)&v11 + 1) = v4;
  sub_2487B5A68();
  if (*(_QWORD *)(v3 + 16) && (v5 = sub_248779390((uint64_t)v10), (v6 & 1) != 0))
  {
    sub_2486F0814(*(_QWORD *)(v3 + 56) + 32 * v5, (uint64_t)&v11);
  }
  else
  {
    v11 = 0u;
    v12 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_2487799E0((uint64_t)v10);
  if (!*((_QWORD *)&v12 + 1))
    goto LABEL_11;
  type metadata accessor for RateDidChangeReason(0);
  if (swift_dynamicCast())
    v7 = (void *)v10[0];
  else
    v7 = 0;
LABEL_12:
  swift_beginAccess();
  v8 = MEMORY[0x24959B01C](v1);
  if (v8)
  {
    v9 = (void *)v8;
    sub_2487AAF68();

  }
}

void sub_2487A9138()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;

  swift_beginAccess();
  v1 = MEMORY[0x24959B01C](v0 + 16);
  if (v1)
  {
    v2 = (void *)v1;
    sub_2487B4E98();
    if (v7)
    {
      sub_24870A40C(&v6, &v8);
      sub_24870A34C(0, &qword_25777DFE8);
      swift_dynamicCast();
      v3 = v5;
      v4 = sub_248798770();

      if (v3 == v4)
        sub_248799F18();

    }
    else
    {
      __break(1u);
    }
  }
}

void sub_2487A9220(uint64_t a1)
{
  uint64_t v1;

  sub_24879A2F4(a1, v1);
}

void sub_2487A9228(uint64_t a1)
{
  uint64_t v1;

  sub_24879AD4C(a1, v1);
}

void sub_2487A9230(uint64_t a1)
{
  uint64_t v1;

  sub_24879B5C8(a1, v1);
}

void sub_2487A924C(uint64_t a1)
{
  uint64_t v1;

  sub_24879B5C8(a1, v1);
}

void sub_2487A9268(uint64_t a1)
{
  uint64_t v1;

  sub_24879B0D8(a1, v1);
}

void sub_2487A9270(uint64_t a1)
{
  uint64_t v1;

  sub_24879B350(a1, v1);
}

void sub_2487A9278(uint64_t a1)
{
  uint64_t v1;

  sub_24879B5C8(a1, v1);
}

void sub_2487A9294(uint64_t a1)
{
  uint64_t v1;

  sub_24879B5C8(a1, v1);
}

uint64_t sub_2487A92B0()
{
  swift_retain();
  sub_2487B5378();
  return swift_release();
}

uint64_t sub_2487A9300@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF78);
  sub_24871869C(&qword_25777DF80, &qword_25777DF78, MEMORY[0x24BDB9D10]);
  result = sub_2487B539C();
  *a1 = result;
  return result;
}

uint64_t sub_2487A938C@<X0>(BOOL *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_retain();
  sub_2487B5378();
  result = swift_release();
  *a1 = v3 == 0;
  return result;
}

uint64_t sub_2487A93FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_24879B79C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_2487A9424()
{
  swift_retain();
  sub_2487B5378();
  return swift_release();
}

uint64_t sub_2487A9474@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF78);
  sub_24871869C(&qword_25777DF80, &qword_25777DF78, MEMORY[0x24BDB9D10]);
  result = sub_2487B539C();
  *a1 = result;
  return result;
}

uint64_t sub_2487A9500()
{
  swift_retain();
  sub_2487B5378();
  return swift_release();
}

uint64_t sub_2487A9550@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DFA8);
  sub_24871869C(&qword_25777DFB0, &qword_25777DFA8, MEMORY[0x24BDB9D10]);
  result = sub_2487B539C();
  *a1 = result;
  return result;
}

uint64_t sub_2487A95DC()
{
  swift_retain();
  sub_2487B5378();
  return swift_release();
}

uint64_t sub_2487A962C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF98);
  sub_24871869C(&qword_25777DFA0, &qword_25777DF98, MEMORY[0x24BDB9D10]);
  result = sub_2487B539C();
  *a1 = result;
  return result;
}

uint64_t sub_2487A96B8()
{
  swift_retain();
  sub_2487B5378();
  return swift_release();
}

uint64_t sub_2487A9708@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF88);
  sub_24871869C(&qword_25777DF90, &qword_25777DF88, MEMORY[0x24BDB9D10]);
  result = sub_2487B539C();
  *a1 = result;
  return result;
}

uint64_t sub_2487A9794()
{
  swift_retain();
  sub_2487B5378();
  return swift_release();
}

uint64_t sub_2487A97E4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF78);
  sub_24871869C(&qword_25777DF80, &qword_25777DF78, MEMORY[0x24BDB9D10]);
  result = sub_2487B539C();
  *a1 = result;
  return result;
}

uint64_t sub_2487A9870(unsigned int a1)
{
  unsigned int v2;
  char *v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  int v18;
  unsigned int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD v28[2];
  char v29;
  char v30;
  uint64_t v31;
  unint64_t v32;

  v31 = 0;
  v32 = 0xE000000000000000;
  v2 = HIBYTE(a1);
  v30 = 0;
  v29 = 0;
  v3 = sub_2487AA508(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v5 = *((_QWORD *)v3 + 2);
  v4 = *((_QWORD *)v3 + 3);
  if (v5 >= v4 >> 1)
    v3 = sub_2487AA508((char *)(v4 > 1), v5 + 1, 1, v3);
  *((_QWORD *)v3 + 2) = v5 + 1;
  *(_DWORD *)&v3[4 * v5 + 32] = v2;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_2487AA508(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
  v7 = *((_QWORD *)v3 + 2);
  v6 = *((_QWORD *)v3 + 3);
  v8 = v7 + 1;
  if (v7 >= v6 >> 1)
    v3 = sub_2487AA508((char *)(v6 > 1), v7 + 1, 1, v3);
  *((_QWORD *)v3 + 2) = v8;
  *(_DWORD *)&v3[4 * v7 + 32] = BYTE2(a1);
  if ((v30 & 1) == 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v3 = sub_2487AA508(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
    v10 = *((_QWORD *)v3 + 2);
    v9 = *((_QWORD *)v3 + 3);
    v8 = v10 + 1;
    if (v10 >= v9 >> 1)
      v3 = sub_2487AA508((char *)(v9 > 1), v10 + 1, 1, v3);
    *((_QWORD *)v3 + 2) = v8;
    *(_DWORD *)&v3[4 * v10 + 32] = BYTE1(a1);
  }
  if ((v29 & 1) == 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v3 = sub_2487AA508(0, *((_QWORD *)v3 + 2) + 1, 1, v3);
    v12 = *((_QWORD *)v3 + 2);
    v11 = *((_QWORD *)v3 + 3);
    v8 = v12 + 1;
    if (v12 >= v11 >> 1)
      v3 = sub_2487AA508((char *)(v11 > 1), v12 + 1, 1, v3);
    *((_QWORD *)v3 + 2) = v8;
    *(_DWORD *)&v3[4 * v12 + 32] = a1;
  }
  v13 = 0;
  do
  {
    v14 = *(_DWORD *)&v3[4 * v13 + 32];
    if (v14 >= 0x80)
    {
      v16 = (*(_DWORD *)&v3[4 * v13 + 32] & 0x3F) << 8;
      if (v14 >= 0x800)
      {
        v17 = v14 >> 12;
        v18 = (v16 | (v14 >> 6) & 0x3F) << 8;
        v19 = HIWORD(v14);
        v15 = (((v18 | (v14 >> 12) & 0x3F) << 8) | (v14 >> 18)) - 2122219023;
        v20 = (v18 | v17) + 8487393;
        if (!v19)
          v15 = v20;
      }
      else
      {
        v15 = (v16 | (v14 >> 6)) + 33217;
      }
    }
    else
    {
      v15 = v14 + 1;
    }
    ++v13;
    v28[0] = (v15 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * (4 - (__clz(v15) >> 3))));
    MEMORY[0x249599EDC](v28);
    sub_2487B55AC();
    swift_bridgeObjectRelease();
  }
  while (v8 != v13);
  swift_bridgeObjectRelease();
  v28[0] = v31;
  v28[1] = v32;
  v21 = sub_2487B4E74();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v28[-1] - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2487B4E5C();
  sub_2486ED9E0();
  v25 = sub_2487B5978();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  swift_bridgeObjectRelease();
  return v25;
}

uint64_t sub_2487A9BF0(unint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_2487B5B64();
    v2 = result;
    if (result)
      goto LABEL_3;
LABEL_15:
    v5 = (char *)MEMORY[0x24BEE4AF8];
    goto LABEL_16;
  }
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v2)
    goto LABEL_15;
LABEL_3:
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  v4 = 0;
  v5 = (char *)MEMORY[0x24BEE4AF8];
  do
  {
    if ((a1 & 0xC000000000000001) != 0)
      v6 = (id)MEMORY[0x24959A434](v4, a1);
    else
      v6 = *(id *)(a1 + 8 * v4 + 32);
    v7 = v6;
    v8 = objc_msgSend(v6, sel_portName);
    v9 = sub_2487B5528();
    v11 = v10;

    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v5 = sub_248709428(0, *((_QWORD *)v5 + 2) + 1, 1, v5);
    v13 = *((_QWORD *)v5 + 2);
    v12 = *((_QWORD *)v5 + 3);
    if (v13 >= v12 >> 1)
      v5 = sub_248709428((char *)(v12 > 1), v13 + 1, 1, v5);
    ++v4;
    *((_QWORD *)v5 + 2) = v13 + 1;
    v14 = &v5[16 * v13];
    *((_QWORD *)v14 + 4) = v9;
    *((_QWORD *)v14 + 5) = v11;

  }
  while (v2 != v4);
LABEL_16:
  swift_bridgeObjectRelease();
  v15 = *((_QWORD *)v5 + 2);
  if (v15 == 1)
  {
    v16 = *((_QWORD *)v5 + 4);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else if (v15)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25445F138);
    sub_24871869C((unint64_t *)&qword_25445F140, &qword_25445F138, MEMORY[0x24BEE12B0]);
    sub_2487B5498();
    swift_bridgeObjectRelease();
    sub_2487B55AC();
    swift_bridgeObjectRelease();
    sub_2487B55AC();
    return 91;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 1701736270;
  }
  return v16;
}

uint64_t RecordingMode.localizedTitle.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v0 = (void *)sub_2487B5504();
  v1 = TTSVBSupportLocString(v0);

  v2 = sub_2487B5528();
  return v2;
}

TextToSpeechVoiceBankingSupport::RecordingMode_optional __swiftcall RecordingMode.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  if (rawValue == 1)
    v2 = 1;
  else
    v2 = 2;
  if (!rawValue)
    v2 = 0;
  *v1 = v2;
  return (TextToSpeechVoiceBankingSupport::RecordingMode_optional)rawValue;
}

void *static RecordingMode.allCases.getter()
{
  return &unk_251996088;
}

uint64_t RecordingMode.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

void sub_2487A9F08(_QWORD *a1@<X8>)
{
  *a1 = &unk_2519960B0;
}

BOOL static RecordingState.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t RecordingState.hash(into:)()
{
  return sub_2487B5D68();
}

uint64_t RecordingState.hashValue.getter()
{
  sub_2487B5D5C();
  sub_2487B5D68();
  return sub_2487B5D98();
}

BOOL static RecordingEnvironment.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t RecordingEnvironment.hash(into:)()
{
  return sub_2487B5D68();
}

uint64_t RecordingEnvironment.hashValue.getter()
{
  sub_2487B5D5C();
  sub_2487B5D68();
  return sub_2487B5D98();
}

_QWORD *sub_2487AA01C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_2487AA028(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_2487AA030@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_2487AA044@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_2487AA058@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_2487AA06C(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_2487AA09C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_2487AA0C8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_2487AA0EC(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_2487AA100(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_2487AA114(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_2487AA128@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_2487AA13C(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_2487AA150(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_2487AA164(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_2487AA178()
{
  _QWORD *v0;

  return *v0 == 0;
}

_QWORD *sub_2487AA188(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_2487AA19C()
{
  sub_2486F4CA0(&qword_25777E070, (uint64_t (*)(uint64_t))type metadata accessor for RateDidChangeReason, (uint64_t)&unk_2487C19C0);
  sub_2486F4CA0(&qword_25777E078, (uint64_t (*)(uint64_t))type metadata accessor for RateDidChangeReason, (uint64_t)&unk_2487C1968);
  return sub_2487B5BA0();
}

uint64_t sub_2487AA220()
{
  sub_2486F4CA0(&qword_25777DF48, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_2487C1A48);
  sub_2486F4CA0(&qword_25777E0A0, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_2487C15DC);
  return sub_2487B5BA0();
}

uint64_t sub_2487AA2A4()
{
  sub_2486F4CA0(&qword_25777E080, (uint64_t (*)(uint64_t))type metadata accessor for Port, (uint64_t)&unk_2487C1880);
  sub_2486F4CA0(&qword_25777E088, (uint64_t (*)(uint64_t))type metadata accessor for Port, (uint64_t)&unk_2487C1828);
  return sub_2487B5BA0();
}

uint64_t sub_2487AA328()
{
  sub_2486F4CA0(&qword_25777E090, (uint64_t (*)(uint64_t))type metadata accessor for PolarPattern, (uint64_t)&unk_2487C1740);
  sub_2486F4CA0(&qword_25777E098, (uint64_t (*)(uint64_t))type metadata accessor for PolarPattern, (uint64_t)&unk_2487C16E8);
  return sub_2487B5BA0();
}

BOOL sub_2487AA3AC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2487AA3C0@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_2487AAF30(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

_QWORD *sub_2487AA3FC(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF58);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 25;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 3);
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
        if (v10 != a4 || v13 >= &a4[v8 + 4])
          memmove(v13, a4 + 4, 8 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_2487AB204(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

char *sub_2487AA508(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = *((_QWORD *)a4 + 3);
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = *((_QWORD *)a4 + 2);
    if (v7 <= v8)
      v9 = *((_QWORD *)a4 + 2);
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF60);
      v10 = (char *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 29;
      *((_QWORD *)v10 + 2) = v8;
      *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
      v13 = v10 + 32;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (char *)MEMORY[0x24BEE4AF8];
      v13 = (char *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 32])
          memmove(v13, a4 + 32, 4 * v8);
        *((_QWORD *)a4 + 2) = 0;
        goto LABEL_24;
      }
    }
    sub_2487AB4AC(0, v8, v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_2487AA614(char a1)
{
  uint64_t v2;

  sub_2487B5D5C();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  v2 = sub_2487B5D98();
  return sub_2487AA6A4(a1 & 1, v2);
}

unint64_t sub_2487AA6A4(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char *v7;
  char v8;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    if ((a1 & 1) != 0)
      v6 = 0x80000002487C7710;
    else
      v6 = 0x80000002487C76F0;
    while (1)
    {
      v7 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? "recordingDidFinish" : "recordingWillStart";
      if (((unint64_t)(v7 - 32) | 0x8000000000000000) == v6)
        break;
      v8 = sub_2487B5CE4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v8 & 1) == 0)
      {
        v4 = (v4 + 1) & v5;
        if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
          continue;
      }
      return v4;
    }
    swift_bridgeObjectRelease_n();
  }
  return v4;
}

uint64_t sub_2487AA7C8(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
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
  char v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  int64_t v34;
  uint64_t v35;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF70);
  v6 = a2;
  v7 = sub_2487B5B7C();
  v8 = v7;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v9 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v5 + 64;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  else
    v10 = -1;
  v11 = v10 & *(_QWORD *)(v5 + 64);
  v33 = v2;
  v34 = (unint64_t)(v9 + 63) >> 6;
  v12 = v7 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v11)
    {
      v19 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      v20 = v19 | (v14 << 6);
      goto LABEL_31;
    }
    v21 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v34)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v35 + 8 * v21);
    ++v14;
    if (!v23)
    {
      v14 = v21 + 1;
      if (v21 + 1 >= v34)
        goto LABEL_33;
      v23 = *(_QWORD *)(v35 + 8 * v14);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v34)
        {
LABEL_33:
          swift_release();
          v3 = v33;
          if ((v6 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v35 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v14 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v14 >= v34)
              goto LABEL_33;
            v23 = *(_QWORD *)(v35 + 8 * v14);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v14 = v24;
      }
    }
LABEL_30:
    v11 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v14 << 6);
LABEL_31:
    v29 = *(_BYTE *)(*(_QWORD *)(v5 + 48) + v20);
    v30 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v6 & 1) == 0)
      v31 = v30;
    sub_2487B5D5C();
    sub_2487B557C();
    swift_bridgeObjectRelease();
    result = sub_2487B5D98();
    v15 = -1 << *(_BYTE *)(v8 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v17 == v26;
        if (v17 == v26)
          v17 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v28 == -1);
      v18 = __clz(__rbit64(~v28)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    *(_BYTE *)(*(_QWORD *)(v8 + 48) + v18) = v29;
    *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v18) = v30;
    ++*(_QWORD *)(v8 + 16);
  }
  swift_release();
  v3 = v33;
  v22 = (_QWORD *)(v5 + 64);
  if ((v6 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v32 = 1 << *(_BYTE *)(v5 + 32);
  if (v32 >= 64)
    bzero(v22, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v32;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v8;
  return result;
}

void sub_2487AAAE4(uint64_t a1, char a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  char v7;
  uint64_t v8;
  char v9;
  unint64_t v10;
  uint64_t v11;
  _BOOL8 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v4 = v3;
  v7 = a2 & 1;
  v8 = *v3;
  v10 = sub_2487AA614(a2 & 1);
  v11 = *(_QWORD *)(v8 + 16);
  v12 = (v9 & 1) == 0;
  v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v14 = v9;
  v15 = *(_QWORD *)(v8 + 24);
  if (v15 >= v13 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v15 >= v13 && (a3 & 1) == 0)
  {
    sub_2487AAC18();
LABEL_7:
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
    {
LABEL_8:
      v17 = v16[7];

      *(_QWORD *)(v17 + 8 * v10) = a1;
      return;
    }
LABEL_11:
    v16[(v10 >> 6) + 8] |= 1 << v10;
    *(_BYTE *)(v16[6] + v10) = v7;
    *(_QWORD *)(v16[7] + 8 * v10) = a1;
    v20 = v16[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v16[2] = v22;
      return;
    }
    goto LABEL_14;
  }
  sub_2487AA7C8(v13, a3 & 1);
  v18 = sub_2487AA614(v7);
  if ((v14 & 1) == (v19 & 1))
  {
    v10 = v18;
    v16 = (_QWORD *)*v4;
    if ((v14 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_2487B5D14();
  __break(1u);
}

id sub_2487AAC18()
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
  void *v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777DF70);
  v2 = *v0;
  v3 = sub_2487B5B70();
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
    v17 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v17 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v17);
    ++v9;
    if (!v18)
    {
      v9 = v17 + 1;
      if (v17 + 1 >= v13)
        goto LABEL_26;
      v18 = *(_QWORD *)(v6 + 8 * v9);
      if (!v18)
        break;
    }
LABEL_25:
    v12 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v9 << 6);
LABEL_12:
    v16 = *(void **)(*(_QWORD *)(v2 + 56) + 8 * v15);
    *(_BYTE *)(*(_QWORD *)(v4 + 48) + v15) = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v15);
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + 8 * v15) = v16;
    result = v16;
  }
  v19 = v17 + 2;
  if (v19 >= v13)
    goto LABEL_26;
  v18 = *(_QWORD *)(v6 + 8 * v19);
  if (v18)
  {
    v9 = v19;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v18 = *(_QWORD *)(v6 + 8 * v9);
    ++v19;
    if (v18)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_2487AADB8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2487AADD4(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2487AADD4(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25777CF48);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 29;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8])
      memmove(v13, v14, 4 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[4 * v8] || v13 >= &v14[4 * v8])
  {
    memcpy(v13, v14, 4 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_2487B5B94();
  __break(1u);
  return result;
}

uint64_t sub_2487AAF30(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_2487AAF68()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  _QWORD *v9;
  void *v10;
  id v11;
  uint64_t result;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_log_type_t v16;
  char **v17;
  uint8_t *v18;
  id v19;
  float v20;
  float v21;
  uint8_t *v22;
  id v23;
  float v24;
  float v25;
  id v26;
  double v27;
  BOOL v28;

  v1 = sub_2487B533C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v27 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_2487B542C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (_QWORD *)((char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = *(void **)&v0[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
  *v9 = v10;
  (*(void (**)(_QWORD *, _QWORD, uint64_t, double))(v6 + 104))(v9, *MEMORY[0x24BEE5610], v5, v7);
  v11 = v10;
  LOBYTE(v10) = sub_2487B5444();
  result = (*(uint64_t (**)(_QWORD *, uint64_t))(v6 + 8))(v9, v5);
  if ((v10 & 1) != 0)
  {
    v13 = sub_2487B0C04();
    (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v13, v1);
    v14 = v0;
    v15 = sub_2487B5324();
    v16 = sub_2487B57E0();
    v17 = &selRef_setPredicate_;
    if (os_log_type_enabled(v15, v16))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v18 = 134217984;
      v19 = sub_248798934();
      objc_msgSend(v19, sel_rate);
      v21 = v20;

      v27 = v21;
      sub_2487B593C();

      _os_log_impl(&dword_2486E6000, v15, v16, "Got player rate change: %f", v18, 0xCu);
      v22 = v18;
      v17 = &selRef_setPredicate_;
      MEMORY[0x24959AF80](v22, -1, -1);
    }
    else
    {

      v15 = v14;
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v23 = sub_248798934();
    objc_msgSend(v23, v17[306]);
    v25 = v24;

    if (v25 == 0.0)
    {
      v26 = sub_248798934();
      objc_msgSend(v26, sel_replaceCurrentItemWithPlayerItem_, 0);

    }
    v28 = v25 != 0.0;
    swift_retain();
    sub_2487B5384();
    return swift_release();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2487AB204(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 8 * a1 + 32;
    v6 = a3 + 8 * v4;
    if (v5 >= v6 || v5 + 8 * v4 <= a3)
    {
      type metadata accessor for Port(0);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_2487B5B94();
  __break(1u);
  return result;
}

void *sub_2487AB308(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  char v20;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v4 = v3;
  v7 = a1;
  if (a1 >> 62)
  {
LABEL_20:
    swift_bridgeObjectRetain();
    v8 = sub_2487B5B64();
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v8 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v8)
    {
LABEL_3:
      v22 = v4;
      v23 = v7;
      v24 = v7 & 0xC000000000000001;
      v4 = 4;
      do
      {
        v9 = v4 - 4;
        if (v24)
        {
          v10 = (id)MEMORY[0x24959A434](v4 - 4, v7);
          v11 = v4 - 3;
          if (__OFADD__(v9, 1))
            goto LABEL_19;
        }
        else
        {
          v10 = *(id *)(v7 + 8 * v4);
          v11 = v4 - 3;
          if (__OFADD__(v9, 1))
          {
LABEL_19:
            __break(1u);
            goto LABEL_20;
          }
        }
        v12 = v8;
        v13 = v10;
        v14 = a3;
        v15 = objc_msgSend(v10, sel_dataSourceName, v22);
        v16 = sub_2487B5528();
        v18 = v17;

        a3 = v14;
        v19 = v16 == a2 && v18 == v14;
        if (v19)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v13;
        }
        v20 = sub_2487B5CE4();
        swift_bridgeObjectRelease();
        if ((v20 & 1) != 0)
          goto LABEL_18;

        ++v4;
        v8 = v12;
        v19 = v11 == v12;
        v7 = v23;
      }
      while (!v19);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

char *sub_2487AB4AC(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4;
  char *v5;
  size_t v6;
  char *v7;
  char *result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = (char *)(a4 + 4 * a1 + 32);
    v6 = 4 * v4;
    v7 = &__dst[v6];
    if (v5 >= &__dst[v6] || &v5[v6] <= __dst)
    {
      memcpy(__dst, v5, v6);
      return v7;
    }
  }
  result = (char *)sub_2487B5B94();
  __break(1u);
  return result;
}

void _s31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyj6ChangeL0aypGSgSvSgtF_0(uint64_t a1, uint64_t a2)
{
  char *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  _QWORD v16[2];
  _QWORD aBlock[6];

  v5 = sub_2487B53D8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2487B5408();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2 && (a1 == 0xD000000000000010 && a2 == 0x80000002487C77A0 || (sub_2487B5CE4() & 1) != 0))
  {
    v16[0] = *(_QWORD *)&v2[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioQueue];
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = v2;
    aBlock[4] = sub_2487AE668;
    aBlock[5] = v13;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_2486F1008;
    aBlock[3] = &block_descriptor_189;
    v14 = _Block_copy(aBlock);
    v15 = v2;
    sub_2487B53E4();
    v16[1] = MEMORY[0x24BEE4AF8];
    sub_2486F4CA0((unint64_t *)&unk_25445F670, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25445F680);
    sub_24871869C((unint64_t *)&unk_25445F690, (uint64_t *)&unk_25445F680, MEMORY[0x24BEE12C8]);
    sub_2487B59FC();
    MEMORY[0x24959A1AC](0, v12, v8, v14);
    _Block_release(v14);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    swift_release();
  }
}

uint64_t sub_2487AB7DC()
{
  uint64_t *v0;

  return sub_24879BEEC(v0[2], v0[3], v0[4]);
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_2487AB804()
{
  uint64_t *v0;

  return sub_24879C644(v0[2], v0[3], v0[4]);
}

uint64_t sub_2487AB810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_2487B50CC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2487AB8A4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t *v3;

  v1 = *(_QWORD *)(sub_2487B50CC() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (uint64_t *)(v0 + ((*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8));
  return sub_24879CCF0(*(_QWORD *)(v0 + 16), v0 + v2, *v3, v3[1]);
}

uint64_t sub_2487AB8F0()
{
  uint64_t *v0;

  return sub_24879D4FC(v0[2], v0[3], v0[4]);
}

uint64_t sub_2487AB8FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_2487B50CC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

void sub_2487AB9E0()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = *(_QWORD *)(sub_2487B50CC() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  v4 = (v3 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_24879E124(*(_QWORD *)(v0 + 16), v0 + v2, *(char **)(v0 + v3), *(_QWORD *)(v0 + v4), *(_QWORD *)(v0 + v4 + 8), (__int128 *)(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8)), *(unsigned __int8 *)(v0 + ((v4 + 23) & 0xFFFFFFFFFFFFFFF8) + 48), *(_QWORD *)(v0 + ((v4 + 79) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v4 + 79) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_2487ABA64()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2487ABAB0()
{
  uint64_t v0;

  return sub_24879FF38(*(_QWORD *)(v0 + 16), *(char **)(v0 + 24), *(unsigned __int16 *)(v0 + 32), *(void **)(v0 + 40), *(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), *(_QWORD *)(v0 + 72), *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 80), *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
}

uint64_t sub_2487ABAF4()
{
  uint64_t *v0;

  return sub_2487A4FF4(v0[2], v0[3], v0[4]);
}

uint64_t type metadata accessor for TTSVBAudioService.AudioSessionEvent(uint64_t a1)
{
  return sub_2487095AC(a1, (uint64_t *)&unk_25778FE60);
}

unint64_t sub_2487ABB18()
{
  unint64_t result;

  result = qword_25777DB78;
  if (!qword_25777DB78)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for TTSVBAudioService.SoundEffect, &type metadata for TTSVBAudioService.SoundEffect);
    atomic_store(result, (unint64_t *)&qword_25777DB78);
  }
  return result;
}

uint64_t sub_2487ABB5C()
{
  return sub_2486F4CA0(&qword_25777CA80, (uint64_t (*)(uint64_t))MEMORY[0x24BDCE908], MEMORY[0x24BDCE938]);
}

unint64_t sub_2487ABB8C()
{
  unint64_t result;

  result = qword_25777DB80;
  if (!qword_25777DB80)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for RecordingMode, &type metadata for RecordingMode);
    atomic_store(result, (unint64_t *)&qword_25777DB80);
  }
  return result;
}

uint64_t sub_2487ABBD0()
{
  return sub_24871869C(&qword_25777DB88, &qword_25777DB90, MEMORY[0x24BEE12E0]);
}

unint64_t sub_2487ABC00()
{
  unint64_t result;

  result = qword_25777DB98;
  if (!qword_25777DB98)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for RecordingState, &type metadata for RecordingState);
    atomic_store(result, (unint64_t *)&qword_25777DB98);
  }
  return result;
}

unint64_t sub_2487ABC48()
{
  unint64_t result;

  result = qword_25777DBA0;
  if (!qword_25777DBA0)
  {
    result = MEMORY[0x24959AEB4](&protocol conformance descriptor for RecordingEnvironment, &type metadata for RecordingEnvironment);
    atomic_store(result, (unint64_t *)&qword_25777DBA0);
  }
  return result;
}

uint64_t type metadata accessor for TTSVBAudioService()
{
  return objc_opt_self();
}

void **initializeBufferWithCopyOfBuffer for TTSVBAudioService.RecordingResult(void **a1, void **a2, int *a3)
{
  int v3;
  char *v4;
  void **v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  char *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;

  v3 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain();
  }
  else
  {
    v7 = a1;
    v8 = a3[5];
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2487B50CC();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v13 = v4;
    v12(v9, v10, v11);
    v14 = a3[6];
    v15 = a3[7];
    v16 = (void **)((char *)v7 + v14);
    v17 = (void **)((char *)a2 + v14);
    v18 = v17[1];
    *v16 = *v17;
    v16[1] = v18;
    *(void **)((char *)v7 + v15) = *(void **)((char *)a2 + v15);
    v19 = a3[8];
    v20 = (void **)((char *)v7 + v19);
    v21 = (void **)((char *)a2 + v19);
    v22 = v21[1];
    *v20 = *v21;
    v20[1] = v22;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return v7;
}

uint64_t destroy for TTSVBAudioService.RecordingResult(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = sub_2487B50CC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void **initializeWithCopy for TTSVBAudioService.RecordingResult(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t v21;

  v6 = *a2;
  *a1 = *a2;
  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2487B50CC();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v12 = v6;
  v11(v8, v9, v10);
  v13 = a3[6];
  v14 = a3[7];
  v15 = (void **)((char *)a1 + v13);
  v16 = (void **)((char *)a2 + v13);
  v17 = v16[1];
  *v15 = *v16;
  v15[1] = v17;
  *(void **)((char *)a1 + v14) = *(void **)((char *)a2 + v14);
  v18 = a3[8];
  v19 = (void **)((char *)a1 + v18);
  v20 = (void **)((char *)a2 + v18);
  v21 = v20[1];
  *v19 = *v20;
  v19[1] = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void **assignWithCopy for TTSVBAudioService.RecordingResult(void **a1, void **a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = a3[5];
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = sub_2487B50CC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = a3[6];
  v14 = (void **)((char *)a1 + v13);
  v15 = (void **)((char *)a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  v16 = a3[8];
  v17 = (void **)((char *)a1 + v16);
  v18 = (void **)((char *)a2 + v16);
  *v17 = *v18;
  v17[1] = v18[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *initializeWithTake for TTSVBAudioService.RecordingResult(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  *a1 = *a2;
  v6 = a3[5];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2487B50CC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  v10 = a3[7];
  *(_OWORD *)((char *)a1 + a3[6]) = *(_OWORD *)((char *)a2 + a3[6]);
  *(_QWORD *)((char *)a1 + v10) = *(_QWORD *)((char *)a2 + v10);
  *(_OWORD *)((char *)a1 + a3[8]) = *(_OWORD *)((char *)a2 + a3[8]);
  return a1;
}

void **assignWithTake for TTSVBAudioService.RecordingResult(void **a1, void **a2, int *a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = *a1;
  *a1 = *a2;

  v7 = a3[5];
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2487B50CC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = a3[6];
  v12 = (void **)((char *)a1 + v11);
  v13 = (uint64_t *)((char *)a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  v16 = a3[8];
  *(void **)((char *)a1 + a3[7]) = *(void **)((char *)a2 + a3[7]);
  v17 = (void **)((char *)a1 + v16);
  v18 = (uint64_t *)((char *)a2 + v16);
  v20 = *v18;
  v19 = v18[1];
  *v17 = v20;
  v17[1] = v19;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBAudioService.RecordingResult()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2487AC0DC(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2487B50CC();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for TTSVBAudioService.RecordingResult()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_2487AC164(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v7 = sub_2487B50CC();
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_2487AC1D8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2487B50CC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for TTSVBAudioService.SoundEffect()
{
  return &type metadata for TTSVBAudioService.SoundEffect;
}

uint64_t sub_2487AC27C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_2487AC2D0 + 4 * byte_2487C0D3E[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

void sub_2487AC684(id *a1)
{
  uint64_t *v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;

  switch(swift_getEnumCaseMultiPayload())
  {
    case 0u:

      v2 = &qword_25777DB70;
      goto LABEL_3;
    case 1u:

      v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777DB68);
      v6 = (char *)a1 + *(int *)(v5 + 48);
      v7 = sub_2487B51D4();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);

      return;
    case 2u:
    case 3u:
    case 6u:
    case 7u:
    case 8u:

      v2 = &qword_25777DB50;
      goto LABEL_3;
    case 4u:

      v2 = &qword_25777DB60;
      goto LABEL_3;
    case 5u:

      v2 = &qword_25777DB58;
LABEL_3:
      v3 = (char *)a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(v2) + 48);
      v4 = sub_2487B51D4();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
      break;
    default:
      return;
  }
}

void sub_2487AC7A4()
{
  char *v0;

  v0 = (char *)sub_2487AC7F4 + 4 * byte_2487C0D50[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

void **sub_2487AC7F4()
{
  void **v0;
  void **v1;
  void *v2;
  id v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  v2 = *v1;
  *v0 = *v1;
  v3 = v2;
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25777DB50) + 48);
  v5 = (char *)v0 + v4;
  v6 = (char *)v1 + v4;
  v7 = sub_2487B51D4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  swift_storeEnumTagMultiPayload();
  return v0;
}

void sub_2487AC864()
{
  void **v0;
  void **v1;
  void *v2;
  id v3;
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v2 = *v1;
  *v0 = *v1;
  v3 = v2;
  v4 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_25777DB70);
  v5 = v4[12];
  v6 = (char *)v0 + v5;
  v7 = (char *)v1 + v5;
  v8 = sub_2487B51D4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  *(void **)((char *)v0 + v4[16]) = *(void **)((char *)v1 + v4[16]);
  v9 = v4[20];
  v10 = (char *)v0 + v9;
  v11 = (char *)v1 + v9;
  v10[8] = v11[8];
  *(_QWORD *)v10 = *(_QWORD *)v11;
  v12 = v4[24];
  v13 = (char *)v0 + v12;
  v14 = (char *)v1 + v12;
  v13[8] = v14[8];
  *(_QWORD *)v13 = *(_QWORD *)v14;
  JUMPOUT(0x2487AC838);
}

void sub_2487AC8F4()
{
  void **v0;
  void **v1;
  void *v2;
  id v3;
  int *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = *v1;
  *v0 = *v1;
  v3 = v2;
  v4 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_25777DB68);
  v5 = v4[12];
  v6 = (char *)v0 + v5;
  v7 = (char *)v1 + v5;
  v8 = sub_2487B51D4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  *(void **)((char *)v0 + v4[16]) = *(void **)((char *)v1 + v4[16]);
  v9 = v4[20];
  v10 = *(void **)((char *)v1 + v9);
  *(void **)((char *)v0 + v9) = v10;
  v11 = v10;
  JUMPOUT(0x2487AC838);
}

void sub_2487AC95C()
{
  void **v0;
  void **v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v2 = *v1;
  *v0 = *v1;
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777DB60);
  v5 = *(int *)(v4 + 48);
  v6 = (char *)v0 + v5;
  v7 = (char *)v1 + v5;
  v8 = sub_2487B51D4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  *(void **)((char *)v0 + *(int *)(v4 + 64)) = *(void **)((char *)v1 + *(int *)(v4 + 64));
  JUMPOUT(0x2487AC838);
}

void sub_2487AC9B4()
{
  void **v0;
  void **v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;

  v2 = *v1;
  *v0 = *v1;
  v3 = v2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777DB58);
  v5 = *(int *)(v4 + 48);
  v6 = (char *)v0 + v5;
  v7 = (char *)v1 + v5;
  v8 = sub_2487B51D4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  *((_BYTE *)v0 + *(int *)(v4 + 64)) = *((_BYTE *)v1 + *(int *)(v4 + 64));
  JUMPOUT(0x2487AC838);
}

uint64_t sub_2487ACA0C(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_2486EDA68(result, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
    v2 = (char *)&loc_2487ACA6C + 4 * byte_2487C0D59[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

void sub_2487ACE00()
{
  char *v0;

  v0 = (char *)sub_2487ACE50 + 4 * byte_2487C0D62[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

_QWORD *sub_2487ACE50()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  char *v3;
  char *v4;
  uint64_t v5;

  *v0 = *v1;
  v2 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25777DB50) + 48);
  v3 = (char *)v0 + v2;
  v4 = (char *)v1 + v2;
  v5 = sub_2487B51D4();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(v3, v4, v5);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t sub_2487AD048(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_2486EDA68(result, type metadata accessor for TTSVBAudioService.AudioSessionEvent);
    v2 = (char *)&loc_2487AD0A8 + 4 * byte_2487C0D6B[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_2487AD414()
{
  uint64_t v0;
  uint64_t result;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  char v8;
  char v9;
  char v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  char v18;
  char *v19;
  char *v20;
  char *v21;
  char *v22;
  char *v23;
  char *v24;
  char *v25;
  char *v26;
  uint64_t *v27;

  v0 = MEMORY[0x24BEE0150] + 64;
  v13 = MEMORY[0x24BEE0150] + 64;
  result = sub_2487B51D4();
  if (v2 <= 0x3F)
  {
    v3 = *(_QWORD *)(result - 8) + 64;
    v4 = MEMORY[0x24BEE0178] + 64;
    v17 = "\t";
    swift_getTupleTypeLayout();
    v19 = &v18;
    v13 = v0;
    v14 = v3;
    v15 = v4;
    v16 = v0;
    swift_getTupleTypeLayout();
    v20 = &v12;
    swift_getTupleTypeLayout2();
    v21 = &v11;
    swift_getTupleTypeLayout2();
    v22 = &v10;
    swift_getTupleTypeLayout3();
    v23 = &v9;
    swift_getTupleTypeLayout3();
    v24 = &v8;
    swift_getTupleTypeLayout2();
    v25 = &v7;
    swift_getTupleTypeLayout2();
    v26 = &v6;
    swift_getTupleTypeLayout2();
    v27 = &v5;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_2487AD5A4()
{
  return type metadata accessor for TTSVBAudioService.State(0);
}

void sub_2487AD5AC()
{
  unint64_t v0;

  sub_2487AD648();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

void sub_2487AD648()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_25445ED30)
  {
    sub_2487B50CC();
    v0 = sub_2487B5924();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_25445ED30);
  }
}

ValueMetadata *type metadata accessor for RecordingMode()
{
  return &type metadata for RecordingMode;
}

uint64_t getEnumTagSinglePayload for RecordingState(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RecordingState(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_2487AD788 + 4 * byte_2487C0D79[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_2487AD7BC + 4 * byte_2487C0D74[v4]))();
}

uint64_t sub_2487AD7BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2487AD7C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2487AD7CCLL);
  return result;
}

uint64_t sub_2487AD7D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2487AD7E0);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_2487AD7E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2487AD7EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RecordingState()
{
  return &type metadata for RecordingState;
}

uint64_t _s31TextToSpeechVoiceBankingSupport20RecordingEnvironmentOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2487AD854 + 4 * byte_2487C0D83[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2487AD888 + 4 * byte_2487C0D7E[v4]))();
}

uint64_t sub_2487AD888(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2487AD890(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2487AD898);
  return result;
}

uint64_t sub_2487AD8A4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2487AD8ACLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2487AD8B0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2487AD8B8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RecordingEnvironment()
{
  return &type metadata for RecordingEnvironment;
}

uint64_t getEnumTagSinglePayload for TTSVBAudioService.RecordingStatus(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TTSVBAudioService.RecordingStatus(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
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

uint64_t sub_2487AD960(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 16) <= 1u)
    return *(unsigned __int8 *)(a1 + 16);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_2487AD978(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    *(_QWORD *)(result + 8) = 0;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 16) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TTSVBAudioService.RecordingStatus()
{
  return &type metadata for TTSVBAudioService.RecordingStatus;
}

void type metadata accessor for InterruptionReason(uint64_t a1)
{
  sub_24871F99C(a1, &qword_25777DF00);
}

void type metadata accessor for InterruptionOptions(uint64_t a1)
{
  sub_24871F99C(a1, &qword_25777DF08);
}

void type metadata accessor for InterruptionType(uint64_t a1)
{
  sub_24871F99C(a1, &qword_25777DF10);
}

void type metadata accessor for RouteChangeReason(uint64_t a1)
{
  sub_24871F99C(a1, &qword_25777DF18);
}

void type metadata accessor for SilenceSecondaryAudioHintType(uint64_t a1)
{
  sub_24871F99C(a1, &qword_25777DF20);
}

uint64_t sub_2487ADA04()
{
  return sub_2486F4CA0(&qword_25777DF28, (uint64_t (*)(uint64_t))type metadata accessor for InterruptionOptions, (uint64_t)&unk_2487C135C);
}

uint64_t sub_2487ADA30()
{
  return sub_2486F4CA0(&qword_25777DF30, (uint64_t (*)(uint64_t))type metadata accessor for InterruptionOptions, (uint64_t)&unk_2487C132C);
}

uint64_t sub_2487ADA5C()
{
  return sub_2486F4CA0(&qword_25777DF38, (uint64_t (*)(uint64_t))type metadata accessor for InterruptionOptions, (uint64_t)&unk_2487C1384);
}

uint64_t sub_2487ADA88()
{
  return sub_2486F4CA0(&qword_25777DF40, (uint64_t (*)(uint64_t))type metadata accessor for InterruptionOptions, (uint64_t)&unk_2487C13BC);
}

void type metadata accessor for NSKeyValueChangeKey(uint64_t a1)
{
  sub_24871F99C(a1, &qword_25777E008);
}

uint64_t sub_2487ADACC()
{
  uint64_t v0;

  return sub_248776DA4(*(void (**)(char *))(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

id sub_2487ADAE8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v6;
  id v7;

  v1 = v0[3];
  v2 = v0[4];
  v3 = v0[5];
  v4 = *(void **)(v0[2] + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession);
  v7 = 0;
  if (objc_msgSend(v4, sel_setCategory_mode_options_error_, v1, v2, v3, &v7))
    return v7;
  v6 = v7;
  sub_2487B4F64();

  return (id)swift_willThrow();
}

id sub_2487ADB6C()
{
  uint64_t v0;
  void *v1;
  id v3;
  id v4;

  v1 = *(void **)(*(_QWORD *)(v0 + 16)
                + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession);
  v4 = 0;
  if (objc_msgSend(v1, sel_setActive_error_, 1, &v4))
    return v4;
  v3 = v4;
  sub_2487B4F64();

  return (id)swift_willThrow();
}

void type metadata accessor for PolarPattern(uint64_t a1)
{
  sub_24871F99C(a1, &qword_25777E000);
}

void type metadata accessor for Port(uint64_t a1)
{
  sub_24871F99C(a1, &qword_25777DFF8);
}

uint64_t sub_2487ADC1C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2487ADC64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_2487B50CC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 23) & 0xFFFFFFFFFFFFFFF8;
  swift_bridgeObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2487ADD94()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v1 = *(_QWORD *)(sub_2487B50CC() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  v4 = (v3 + 23) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 23) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  return sub_2487A13A0(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(unsigned __int16 *)(v0 + 32), *(_QWORD *)(v0 + 40), v0 + v2, *(char **)(v0 + v3), *(char **)(v0 + v3 + 8), *(char **)(v0 + v4), *(void **)(v0 + v5), *(_QWORD *)(v0 + v6), *(_QWORD *)(v0 + v7), *(_QWORD *)(v0 + v7 + 8), *(_QWORD *)(v0 + v8), *(_QWORD *)(v0 + v9), *(void **)(v0 + v9 + 8), *(_QWORD *)(v0 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v9 + 23) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_2487ADE68()
{
  uint64_t v0;

  return sub_2487A20C8(*(void (**)(char *))(v0 + 16), *(_QWORD *)(v0 + 24), *(void **)(v0 + 32));
}

uint64_t sub_2487ADE84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v1 = sub_2487B50CC();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;

  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2487ADF40()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(sub_2487B50CC() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = (*(_QWORD *)(v1 + 64) + v2 + 7) & 0xFFFFFFFFFFFFFFF8;
  return sub_2487A1970(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_QWORD *)(v0 + 40), *(_QWORD **)(v0 + 48), *(_QWORD *)(v0 + 56), *(_QWORD *)(v0 + 64), (char *)(v0 + v2), *(_QWORD *)(v0 + v3), *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8) + 8));
}

uint64_t sub_2487ADFB4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_2487ADFFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = type metadata accessor for TTSVBAudioService.RecordingResult(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  swift_release();

  v4 = v0 + v3 + *(int *)(v1 + 20);
  v5 = sub_2487B50CC();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2487AE0B0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TTSVBAudioService.RecordingResult(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2487AE0F4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TTSVBAudioService.RecordingResult(0) - 8) + 80);
  return sub_2487A2018(*(void (**)(char *))(v0 + 16), *(_QWORD *)(v0 + 24), v0 + ((v1 + 32) & ~v1));
}

uint64_t sub_2487AE124()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2487AE148()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2487AE174()
{
  uint64_t v0;

  return sub_2487A228C(*(unsigned __int8 *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 40), *(_QWORD *)(v0 + 48), *(double *)(v0 + 32));
}

id sub_2487AE188()
{
  id v0;
  unsigned int v1;
  id v3;
  id v4;

  v0 = sub_248798770();
  v4 = 0;
  v1 = objc_msgSend(v0, sel_startAndReturnError_, &v4);

  if (v1)
    return v4;
  v3 = v4;
  sub_2487B4F64();

  return (id)swift_willThrow();
}

void sub_2487AE20C(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  void (*v8)(void *);
  _QWORD *v9;
  uint64_t v10;
  Swift::Double v11;
  uint64_t *v12;
  uint64_t v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  float v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  float v25;
  float *v26;
  uint64_t v27;
  uint64_t v28;
  float *v29;
  float v30;
  char *v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  Swift::UInt64_optional v35;

  swift_beginAccess();
  v5 = MEMORY[0x24959B01C](v2 + 16);
  if (v5)
  {
    v6 = (char *)v5;
    v7 = *(_QWORD **)(v5 + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_speechRecognitionService);
    v8 = *(void (**)(void *))((*MEMORY[0x24BEE4EA0] & *v7) + 0x1A8);
    v9 = v7;
    v8(a1);

    v10 = *(_QWORD *)(*(_QWORD *)&v6[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_state]
                    + OBJC_IVAR____TtCC31TextToSpeechVoiceBankingSupport17TTSVBAudioServiceP33_2F288AB684677915D8A6F8C1A2A5794F5State_bufferHistory);
    swift_retain();
    v35.value = (Swift::UInt64)objc_msgSend(a2, sel_hostTime);
    v35.is_nil = 0;
    v11 = TTSVBTimestampInSeconds(when:)(v35);
    (*(void (**)(void *, Swift::Double))(*(_QWORD *)v10 + 264))(a1, v11);
    swift_release();
    v12 = (uint64_t *)objc_msgSend(a1, sel_floatChannelData);
    if (!v12)
    {
LABEL_22:

      return;
    }
    v13 = *v12;
    v14 = objc_msgSend(a1, sel_frameLength);
    v15 = objc_msgSend(a1, sel_stride);
    if (!v15)
    {
      __break(1u);
      return;
    }
    v16 = sub_2487A4B8C(0, v14, (uint64_t)v15, v13);
    v17 = *(_QWORD *)(v16 + 16);
    if (v17)
    {
      v34 = MEMORY[0x24BEE4AF8];
      sub_2487AADB8(0, v17, 0);
      v18 = 0;
      v19 = v34;
      v20 = *(_QWORD *)(v34 + 16);
      do
      {
        v21 = *(float *)(v16 + 4 * v18 + 32);
        v22 = *(_QWORD *)(v34 + 24);
        if (v20 >= v22 >> 1)
          sub_2487AADB8(v22 > 1, v20 + 1, 1);
        ++v18;
        *(_QWORD *)(v34 + 16) = v20 + 1;
        *(float *)(v34 + 4 * v20++ + 32) = v21 * v21;
      }
      while (v17 != v18);
      swift_bridgeObjectRelease();
      v23 = *(_QWORD *)(v34 + 16);
      if (v23)
      {
LABEL_10:
        if (v23 == 1)
        {
          v24 = 0;
          v25 = 0.0;
        }
        else
        {
          v24 = v23 & 0x7FFFFFFFFFFFFFFELL;
          v26 = (float *)(v19 + 36);
          v25 = 0.0;
          v27 = v23 & 0x7FFFFFFFFFFFFFFELL;
          do
          {
            v25 = (float)(v25 + *(v26 - 1)) + *v26;
            v26 += 2;
            v27 -= 2;
          }
          while (v27);
          if (v23 == v24)
          {
LABEL_19:
            swift_bridgeObjectRelease();
            log10f(sqrtf(v25 / (float)objc_msgSend(a1, sel_frameLength)));
            v31 = &v6[OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_numberOfAudioMagnitudes];
            swift_beginAccess();
            if (*(uint64_t *)v31 > 0)
            {
              type metadata accessor for AudioPowerLevelNormalizer();
              swift_retain();
              v32 = sub_24872BABC();
              (*(void (**)(uint64_t, id, _QWORD))(*(_QWORD *)v33 + 496))(v13, objc_msgSend(a1, sel_frameLength, v32), *(_QWORD *)v31);
              swift_release();
              sub_2487B5384();
              swift_release();
            }
            swift_retain();
            sub_2487B5384();
            swift_release();
            goto LABEL_22;
          }
        }
        v28 = v23 - v24;
        v29 = (float *)(v19 + 4 * v24 + 32);
        do
        {
          v30 = *v29++;
          v25 = v25 + v30;
          --v28;
        }
        while (v28);
        goto LABEL_19;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
      v19 = MEMORY[0x24BEE4AF8];
      v23 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
      if (v23)
        goto LABEL_10;
    }
    v25 = 0.0;
    goto LABEL_19;
  }
}

uint64_t sub_2487AE5D4()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2487AE608()
{
  uint64_t *v0;

  return sub_24879EB6C(v0[2], v0[3], v0[4], v0[5]);
}

uint64_t objectdestroy_51Tm()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2487AE644()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2487AE668()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(*(_QWORD *)(v0 + 16)
                + OBJC_IVAR____TtC31TextToSpeechVoiceBankingSupport17TTSVBAudioService_audioSession);
  swift_retain();
  objc_msgSend(v1, sel_isInputAvailable);
  sub_2487B5384();
  return swift_release();
}

void type metadata accessor for RateDidChangeReason(uint64_t a1)
{
  sub_24871F99C(a1, &qword_25777DFF0);
}

uint64_t sub_2487AE6E8()
{
  return sub_2486F4CA0(&qword_25777E010, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_2487C15A0);
}

uint64_t sub_2487AE714()
{
  return sub_2486F4CA0(&qword_25777E018, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_2487C1574);
}

uint64_t sub_2487AE740()
{
  return sub_2486F4CA0(&qword_25777E020, (uint64_t (*)(uint64_t))type metadata accessor for PolarPattern, (uint64_t)&unk_2487C16B0);
}

uint64_t sub_2487AE76C()
{
  return sub_2486F4CA0(&qword_25777E028, (uint64_t (*)(uint64_t))type metadata accessor for PolarPattern, (uint64_t)&unk_2487C1688);
}

uint64_t sub_2487AE798()
{
  return sub_2486F4CA0(&qword_25777E030, (uint64_t (*)(uint64_t))type metadata accessor for PolarPattern, (uint64_t)&unk_2487C1718);
}

uint64_t sub_2487AE7C4()
{
  return sub_2486F4CA0(&qword_25777E038, (uint64_t (*)(uint64_t))type metadata accessor for Port, (uint64_t)&unk_2487C17F0);
}

uint64_t sub_2487AE7F0()
{
  return sub_2486F4CA0(&qword_25777E040, (uint64_t (*)(uint64_t))type metadata accessor for Port, (uint64_t)&unk_2487C17C8);
}

uint64_t sub_2487AE81C()
{
  return sub_2486F4CA0(&qword_25777E048, (uint64_t (*)(uint64_t))type metadata accessor for Port, (uint64_t)&unk_2487C1858);
}

uint64_t sub_2487AE848()
{
  return sub_2486F4CA0(&qword_25777E050, (uint64_t (*)(uint64_t))type metadata accessor for RateDidChangeReason, (uint64_t)&unk_2487C1930);
}

uint64_t sub_2487AE874()
{
  return sub_2486F4CA0(&qword_25777E058, (uint64_t (*)(uint64_t))type metadata accessor for RateDidChangeReason, (uint64_t)&unk_2487C1908);
}

uint64_t sub_2487AE8A0()
{
  return sub_2486F4CA0(&qword_25777E060, (uint64_t (*)(uint64_t))type metadata accessor for RateDidChangeReason, (uint64_t)&unk_2487C1998);
}

uint64_t sub_2487AE8CC()
{
  return sub_2486F4CA0(&qword_25777E068, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_2487C1610);
}

uint64_t static TTSVBLocalVoiceModelMO.findOrFetch(modelID:moc:)(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25777C9B0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2487BD7B0;
  sub_24870A34C(0, &qword_25777C9A8);
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v3 + 64) = sub_2487189D4();
  *(_QWORD *)(v3 + 32) = 0x44496C65646F6DLL;
  *(_QWORD *)(v3 + 40) = 0xE700000000000000;
  v4 = sub_2487B51F8();
  *(_QWORD *)(v3 + 96) = sub_24870A34C(0, &qword_25777C9C0);
  *(_QWORD *)(v3 + 104) = sub_248718A18();
  *(_QWORD *)(v3 + 72) = v4;
  v5 = (void *)sub_2487B578C();
  v6 = type metadata accessor for TTSVBLocalVoiceModelMO();
  static DSO<>.findOrFetch(in:matching:)(a2, v5, v6, (uint64_t)&protocol witness table for TTSVBLocalVoiceModelMO);
  v8 = v7;

  return v8;
}

uint64_t type metadata accessor for TTSVBLocalVoiceModelMO()
{
  return objc_opt_self();
}

uint64_t static TTSVBLocalVoiceModelMO.requireModelWithID(_:moc:)(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v17[2];
  char v18;

  v4 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777C9B0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2487BD7B0;
  sub_24870A34C(0, &qword_25777C9A8);
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 64) = sub_2487189D4();
  *(_QWORD *)(v7 + 32) = 0x44496C65646F6DLL;
  *(_QWORD *)(v7 + 40) = 0xE700000000000000;
  v8 = sub_2487B51F8();
  *(_QWORD *)(v7 + 96) = sub_24870A34C(0, &qword_25777C9C0);
  *(_QWORD *)(v7 + 104) = sub_248718A18();
  *(_QWORD *)(v7 + 72) = v8;
  v9 = (void *)sub_2487B578C();
  v10 = type metadata accessor for TTSVBLocalVoiceModelMO();
  static DSO<>.findOrFetch(in:matching:)(a2, v9, v10, (uint64_t)&protocol witness table for TTSVBLocalVoiceModelMO);
  v12 = v11;

  if (!v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    v18 = 3;
    v13 = sub_2487B5228();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v6, a1, v13);
    swift_storeEnumTagMultiPayload();
    v12 = type metadata accessor for TTSVBError(0);
    sub_248757374((unint64_t *)&qword_25445ED48, 255, type metadata accessor for TTSVBError, (uint64_t)&protocol conformance descriptor for TTSVBError);
    swift_allocError();
    TTSVBError.init(_:_:_:)((uint64_t)v17, (uint64_t)v6, 0, v14);
    swift_willThrow();
  }
  return v12;
}

id sub_2487AED40()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_2487B5504();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

void sub_2487AEDA8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24871916C(a1, (SEL *)&selRef_creationDeviceModel, a2);
}

void sub_2487AEDB4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2487191D8(a1, a2, a3, a4, (SEL *)&selRef_setCreationDeviceModel_);
}

void sub_2487AEDC0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24871916C(a1, (SEL *)&selRef_creationDeviceName, a2);
}

void sub_2487AEDCC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2487191D8(a1, a2, a3, a4, (SEL *)&selRef_setCreationDeviceName_);
}

void sub_2487AEDD8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24871916C(a1, (SEL *)&selRef_creationDeviceUDID, a2);
}

void sub_2487AEDE4(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2487191D8(a1, a2, a3, a4, (SEL *)&selRef_setCreationDeviceUDID_);
}

void sub_2487AEDF0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24871916C(a1, (SEL *)&selRef_creationOSBuild, a2);
}

void sub_2487AEDFC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2487191D8(a1, a2, a3, a4, (SEL *)&selRef_setCreationOSBuild_);
}

id sub_2487AEE08@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isDownloaded);
  *a2 = result;
  return result;
}

id sub_2487AEE40(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsDownloaded_, *a1);
}

uint64_t sub_2487AEE54@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_248754004(a1, (SEL *)&selRef_modelID, (void (*)(void))MEMORY[0x24BDCE9F0], MEMORY[0x24BDCEA50], a2);
}

void sub_2487AEE70(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2487540B8(a1, a2, a3, a4, &qword_25445ED40, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA50], MEMORY[0x24BDCE9C8], (SEL *)&selRef_setModelID_);
}

void sub_2487AEE94(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24871916C(a1, (SEL *)&selRef_trainingLocaleID, a2);
}

void sub_2487AEEA0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2487191D8(a1, a2, a3, a4, (SEL *)&selRef_setTrainingLocaleID_);
}

id sub_2487AEEAC@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_status_);
  *a2 = (_WORD)result;
  return result;
}

id sub_2487AEEDC(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setStatus__, *a1);
}

uint64_t sub_2487AEEF0@<X0>(id *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_248754004(a1, (SEL *)&selRef_trainingFinishedDate, (void (*)(void))MEMORY[0x24BDCE870], MEMORY[0x24BDCE908], a2);
}

void sub_2487AEF0C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2487540B8(a1, a2, a3, a4, &qword_25445ED38, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE908], MEMORY[0x24BDCE5D0], (SEL *)&selRef_setTrainingFinishedDate_);
}

void sub_2487AEF30(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24871916C(a1, (SEL *)&selRef_trainingMode, a2);
}

void sub_2487AEF3C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2487191D8(a1, a2, a3, a4, (SEL *)&selRef_setTrainingMode_);
}

id sub_2487AEF48@<X0>(id *a1@<X0>, _WORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_trainingStatus_);
  *a2 = (_WORD)result;
  return result;
}

id sub_2487AEF78(__int16 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrainingStatus__, *a1);
}

id sub_2487AEF8C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;
  uint64_t v4;

  result = objc_msgSend(*a1, sel_trainingTaskProgress);
  *a2 = v4;
  return result;
}

id sub_2487AEFBC(double *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setTrainingTaskProgress_, *a1);
}

void sub_2487AEFD0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_24871916C(a1, (SEL *)&selRef_version, a2);
}

void sub_2487AEFDC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_2487191D8(a1, a2, a3, a4, (SEL *)&selRef_setVersion_);
}

id sub_2487AEFE8@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_files);
  *a2 = result;
  return result;
}

id sub_2487AF020(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setFiles_, *a1);
}

uint64_t sub_2487AF034@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char *v36;

  v5 = sub_2487B533C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v10 = a1;
    goto LABEL_5;
  }
  v11 = (char *)objc_msgSend(v2, sel_voice, v7);
  if (v11)
  {
    v10 = v11;
LABEL_5:
    v12 = a1;
    v13 = objc_msgSend(v10, sel_name);
    if (v13)
    {
      v14 = v13;
      v35 = v2;
      v36 = a2;
      v15 = sub_2487B5528();
      v17 = v16;

      v18 = objc_msgSend(v10, sel_voiceID);
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED40);
      MEMORY[0x24BDAC7A8](v19);
      a1 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v18)
      {
        v21 = sub_2487B5228();
        v22 = *(_QWORD *)(v21 - 8);
        MEMORY[0x24BDAC7A8](v21);
        v24 = (char *)&v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_2487B5210();

        (*(void (**)(char *, char *, uint64_t))(v22 + 32))(a1, v24, v21);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(a1, 0, 1, v21);
        result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(a1, 1, v21);
        if ((_DWORD)result != 1)
        {
          v26 = type metadata accessor for TTSVBLocalVoiceModelMO();
          v28 = sub_248757374(&qword_25777D138, v27, (uint64_t (*)(uint64_t))type metadata accessor for TTSVBLocalVoiceModelMO, (uint64_t)&protocol conformance descriptor for TTSVBLocalVoiceModelMO);
          TTSVBCommonVoiceModelMO.immutableModel(voiceName:voiceID:)(v15, v17, v26, v28, v36);

          swift_bridgeObjectRelease();
          return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(a1, v21);
        }
LABEL_15:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    v34 = sub_2487B5228();
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(a1, 1, 1, v34);
    goto LABEL_15;
  }
  v29 = sub_2487B0D54();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v29, v5);
  v30 = sub_2487B5324();
  v31 = sub_2487B57D4();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_2486E6000, v30, v31, "Cannot return immutableModel. no related voice was found.", v32, 2u);
    MEMORY[0x24959AF80](v32, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v33 = type metadata accessor for TTSVBVoiceModel();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(a2, 1, 1, v33);
}

id TTSVBLocalVoiceModelMO.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TTSVBLocalVoiceModelMO.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for TTSVBLocalVoiceModelMO();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TTSVBLocalVoiceModelMO.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTSVBLocalVoiceModelMO();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2487AF48C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for TTSVBLocalVoiceModelMO();
  result = sub_2487B5ABC();
  *a1 = result;
  return result;
}

uint64_t sub_2487AF4C8@<X0>(uint64_t a1@<X8>)
{
  return sub_2487AFE9C((SEL *)&selRef_creationDate, (void (*)(void))MEMORY[0x24BDCE870], MEMORY[0x24BDCE908], a1);
}

void sub_2487AF4E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2487AFF48(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE908], MEMORY[0x24BDCE5D0], (SEL *)&selRef_setCreationDate_);
}

void (*sub_2487AF500(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2487AF544(v2);
  return sub_248719B1C;
}

void (*sub_2487AF544(_QWORD *a1))(uint64_t a1, char a2)
{
  void *v1;
  size_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38) - 8) + 64);
  a1[1] = v3;
  v4 = malloc(v3);
  a1[2] = v4;
  v5 = objc_msgSend(v1, sel_creationDate);
  v6 = malloc(v3);
  a1[3] = v6;
  if (v5)
  {
    sub_2487B51A4();

    v7 = sub_2487B51D4();
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    v8 = sub_2487B51D4();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  sub_2486F4F70((uint64_t)v6, (uint64_t)v4, &qword_25445ED38);
  return sub_2487AF640;
}

void sub_2487AF640(uint64_t a1, char a2)
{
  sub_2487AFC44(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE908], MEMORY[0x24BDCE5D0], (SEL *)&selRef_setCreationDate_, &qword_25445ED38);
}

uint64_t sub_2487AF664(uint64_t a1, uint64_t a2)
{
  return sub_248719BAC(a1, a2, (SEL *)&selRef_creationDeviceModel);
}

void sub_2487AF670(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_248719C18(a1, a2, a3, a4, (SEL *)&selRef_setCreationDeviceModel_);
}

void (*sub_2487AF67C(uint64_t **a1))(_QWORD *)
{
  uint64_t *v2;

  v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_2487AF6C0(v2);
  return sub_248719B1C;
}

void (*sub_2487AF6C0(uint64_t *a1))(uint64_t a1, char a2)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a1[2] = (uint64_t)v1;
  v3 = objc_msgSend(v1, sel_creationDeviceModel);
  if (v3)
  {
    v4 = v3;
    v5 = sub_2487B5528();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_2487AF734;
}

void sub_2487AF734(uint64_t a1, char a2)
{
  sub_248719D3C(a1, a2, (SEL *)&selRef_setCreationDeviceModel_);
}

uint64_t sub_2487AF740(uint64_t a1, uint64_t a2)
{
  return sub_248719BAC(a1, a2, (SEL *)&selRef_creationDeviceName);
}

void sub_2487AF74C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_248719C18(a1, a2, a3, a4, (SEL *)&selRef_setCreationDeviceName_);
}

void (*sub_2487AF758(uint64_t **a1))(_QWORD *)
{
  uint64_t *v2;

  v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_2487AF79C(v2);
  return sub_248719B1C;
}

void (*sub_2487AF79C(uint64_t *a1))(uint64_t a1, char a2)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a1[2] = (uint64_t)v1;
  v3 = objc_msgSend(v1, sel_creationDeviceName);
  if (v3)
  {
    v4 = v3;
    v5 = sub_2487B5528();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_2487AF810;
}

void sub_2487AF810(uint64_t a1, char a2)
{
  sub_248719D3C(a1, a2, (SEL *)&selRef_setCreationDeviceName_);
}

uint64_t sub_2487AF81C(uint64_t a1, uint64_t a2)
{
  return sub_248719BAC(a1, a2, (SEL *)&selRef_creationDeviceUDID);
}

void sub_2487AF828(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_248719C18(a1, a2, a3, a4, (SEL *)&selRef_setCreationDeviceUDID_);
}

void (*sub_2487AF834(uint64_t **a1))(_QWORD *)
{
  uint64_t *v2;

  v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_2487AF878(v2);
  return sub_248719B1C;
}

void (*sub_2487AF878(uint64_t *a1))(uint64_t a1, char a2)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a1[2] = (uint64_t)v1;
  v3 = objc_msgSend(v1, sel_creationDeviceUDID);
  if (v3)
  {
    v4 = v3;
    v5 = sub_2487B5528();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_2487AF8EC;
}

void sub_2487AF8EC(uint64_t a1, char a2)
{
  sub_248719D3C(a1, a2, (SEL *)&selRef_setCreationDeviceUDID_);
}

uint64_t sub_2487AF8F8(uint64_t a1, uint64_t a2)
{
  return sub_248719BAC(a1, a2, (SEL *)&selRef_creationOSBuild);
}

void sub_2487AF904(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_248719C18(a1, a2, a3, a4, (SEL *)&selRef_setCreationOSBuild_);
}

void (*sub_2487AF910(uint64_t **a1))(_QWORD *)
{
  uint64_t *v2;

  v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_2487AF954(v2);
  return sub_248719B1C;
}

void (*sub_2487AF954(uint64_t *a1))(uint64_t a1, char a2)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a1[2] = (uint64_t)v1;
  v3 = objc_msgSend(v1, sel_creationOSBuild);
  if (v3)
  {
    v4 = v3;
    v5 = sub_2487B5528();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_2487AF9C8;
}

void sub_2487AF9C8(uint64_t a1, char a2)
{
  sub_248719D3C(a1, a2, (SEL *)&selRef_setCreationOSBuild_);
}

id sub_2487AF9D4()
{
  void *v0;

  return objc_msgSend(v0, sel_isDownloaded);
}

void sub_2487AF9F8(void *a1)
{
  void *v1;

  objc_msgSend(v1, sel_setIsDownloaded_, a1);

}

void (*sub_2487AFA2C(_QWORD *a1))(id *a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_isDownloaded);
  return sub_2487AFA74;
}

void sub_2487AFA74(id *a1)
{
  id v1;

  v1 = *a1;
  objc_msgSend(a1[1], sel_setIsDownloaded_);

}

uint64_t sub_2487AFAA8@<X0>(uint64_t a1@<X8>)
{
  return sub_2487AFE9C((SEL *)&selRef_modelID, (void (*)(void))MEMORY[0x24BDCE9F0], MEMORY[0x24BDCEA50], a1);
}

void sub_2487AFAC4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2487AFF48(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA50], MEMORY[0x24BDCE9C8], (SEL *)&selRef_setModelID_);
}

void (*sub_2487AFAE0(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2487AFB24(v2);
  return sub_248719B1C;
}

void (*sub_2487AFB24(_QWORD *a1))(uint64_t a1, char a2)
{
  void *v1;
  size_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445ED40) - 8) + 64);
  a1[1] = v3;
  v4 = malloc(v3);
  a1[2] = v4;
  v5 = objc_msgSend(v1, sel_modelID);
  v6 = malloc(v3);
  a1[3] = v6;
  if (v5)
  {
    sub_2487B5210();

    v7 = sub_2487B5228();
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    v8 = sub_2487B5228();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  sub_2486F4F70((uint64_t)v6, (uint64_t)v4, &qword_25445ED40);
  return sub_2487AFC20;
}

void sub_2487AFC20(uint64_t a1, char a2)
{
  sub_2487AFC44(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCEA50], MEMORY[0x24BDCE9C8], (SEL *)&selRef_setModelID_, &qword_25445ED40);
}

void sub_2487AFC44(uint64_t a1, char a2, uint64_t (*a3)(_QWORD), uint64_t (*a4)(void), SEL *a5, uint64_t *a6)
{
  void *v10;
  uint64_t v12;
  char *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v10 = *(void **)(a1 + 16);
  if ((a2 & 1) != 0)
  {
    MEMORY[0x24BDAC7A8](a1);
    v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    sub_2486F4E74((uint64_t)v10, (uint64_t)v13, v14);
    v15 = a3(0);
    v16 = *(_QWORD *)(v15 - 8);
    v17 = 0;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v13, 1, v15) != 1)
    {
      v17 = (void *)a4();
      (*(void (**)(char *, uint64_t))(v16 + 8))(v13, v15);
      v10 = *(void **)(a1 + 16);
    }
    v18 = *(void **)(a1 + 24);
    objc_msgSend(*(id *)a1, *a5, v17);

    free(v18);
    sub_2486F5008((uint64_t)v10, a6);
    free(v10);
  }
  else
  {
    v19 = a3(0);
    v20 = *(_QWORD *)(v19 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v20 + 48))(v10, 1, v19) == 1)
    {
      v21 = 0;
    }
    else
    {
      v21 = (void *)a4();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v10, v19);
      v10 = *(void **)(a1 + 16);
    }
    v22 = *(void **)(a1 + 24);
    objc_msgSend(*(id *)a1, *a5, v21);

    free(v22);
    free(v10);
  }
}

id sub_2487AFDF4()
{
  void *v0;

  return objc_msgSend(v0, sel_status_);
}

id sub_2487AFE14(__int16 a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setStatus__, a1);
}

id (*sub_2487AFE28(uint64_t a1))(uint64_t a1)
{
  void *v1;

  *(_QWORD *)a1 = v1;
  *(_WORD *)(a1 + 8) = (unsigned __int16)objc_msgSend(v1, sel_status_);
  return sub_2487AFE68;
}

id sub_2487AFE68(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setStatus__, *(__int16 *)(a1 + 8));
}

uint64_t sub_2487AFE80@<X0>(uint64_t a1@<X8>)
{
  return sub_2487AFE9C((SEL *)&selRef_trainingFinishedDate, (void (*)(void))MEMORY[0x24BDCE870], MEMORY[0x24BDCE908], a1);
}

uint64_t sub_2487AFE9C@<X0>(SEL *a1@<X2>, void (*a2)(void)@<X3>, uint64_t (*a3)(void)@<X4>, uint64_t a4@<X8>)
{
  void *v4;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;

  v8 = objc_msgSend(v4, *a1);
  if (v8)
  {
    v9 = v8;
    a2();

    v10 = ((uint64_t (*)(_QWORD))a3)(0);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
    v12 = a4;
    v13 = 0;
  }
  else
  {
    v10 = a3();
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
    v12 = a4;
    v13 = 1;
  }
  return v11(v12, v13, 1, v10);
}

void sub_2487AFF2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2487AFF48(a1, a2, a3, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE908], MEMORY[0x24BDCE5D0], (SEL *)&selRef_setTrainingFinishedDate_);
}

void sub_2487AFF48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(_QWORD), uint64_t (*a5)(void), SEL *a6)
{
  void *v6;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id v14;
  id v15;
  id v16;

  v9 = v6;
  v11 = a4(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11);
  v14 = 0;
  if (v13 != 1)
  {
    v15 = (id)a5();
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(a1, v11);
    v14 = v15;
  }
  v16 = v14;
  objc_msgSend(v9, *a6);

}

void (*sub_2487AFFE8(_QWORD *a1))(_QWORD *)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_2487B002C(v2);
  return sub_248719B1C;
}

void (*sub_2487B002C(_QWORD *a1))(uint64_t a1, char a2)
{
  void *v1;
  size_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  *a1 = v1;
  v3 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38) - 8) + 64);
  a1[1] = v3;
  v4 = malloc(v3);
  a1[2] = v4;
  v5 = objc_msgSend(v1, sel_trainingFinishedDate);
  v6 = malloc(v3);
  a1[3] = v6;
  if (v5)
  {
    sub_2487B51A4();

    v7 = sub_2487B51D4();
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    v8 = sub_2487B51D4();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  sub_2486F4F70((uint64_t)v6, (uint64_t)v4, &qword_25445ED38);
  return sub_2487B0128;
}

void sub_2487B0128(uint64_t a1, char a2)
{
  sub_2487AFC44(a1, a2, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE908], MEMORY[0x24BDCE5D0], (SEL *)&selRef_setTrainingFinishedDate_, &qword_25445ED38);
}

uint64_t sub_2487B014C(uint64_t a1, uint64_t a2)
{
  return sub_248719BAC(a1, a2, (SEL *)&selRef_trainingMode);
}

void sub_2487B0158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_248719C18(a1, a2, a3, a4, (SEL *)&selRef_setTrainingMode_);
}

void (*sub_2487B0164(uint64_t **a1))(_QWORD *)
{
  uint64_t *v2;

  v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_2487B01A8(v2);
  return sub_248719B1C;
}

void (*sub_2487B01A8(uint64_t *a1))(uint64_t a1, char a2)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a1[2] = (uint64_t)v1;
  v3 = objc_msgSend(v1, sel_trainingMode);
  if (v3)
  {
    v4 = v3;
    v5 = sub_2487B5528();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_2487B021C;
}

void sub_2487B021C(uint64_t a1, char a2)
{
  sub_248719D3C(a1, a2, (SEL *)&selRef_setTrainingMode_);
}

id sub_2487B0228()
{
  void *v0;

  return objc_msgSend(v0, sel_trainingStatus_);
}

id sub_2487B0248(__int16 a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setTrainingStatus__, a1);
}

id (*sub_2487B025C(uint64_t a1))(uint64_t a1)
{
  void *v1;

  *(_QWORD *)a1 = v1;
  *(_WORD *)(a1 + 8) = (unsigned __int16)objc_msgSend(v1, sel_trainingStatus_);
  return sub_2487B029C;
}

id sub_2487B029C(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setTrainingStatus__, *(__int16 *)(a1 + 8));
}

id sub_2487B02B4()
{
  void *v0;

  return objc_msgSend(v0, sel_trainingTaskProgress);
}

id sub_2487B02C4()
{
  void *v0;

  return objc_msgSend(v0, sel_setTrainingTaskProgress_);
}

id (*sub_2487B02D4(_QWORD *a1))(uint64_t a1)
{
  void *v1;
  uint64_t v3;

  a1[1] = v1;
  objc_msgSend(v1, sel_trainingTaskProgress);
  *a1 = v3;
  return sub_2487B0314;
}

id sub_2487B0314(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setTrainingTaskProgress_, *(double *)a1);
}

uint64_t sub_2487B032C(uint64_t a1, uint64_t a2)
{
  return sub_248719BAC(a1, a2, (SEL *)&selRef_version);
}

void sub_2487B0338(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_248719C18(a1, a2, a3, a4, (SEL *)&selRef_setVersion_);
}

void (*sub_2487B0344(uint64_t **a1))(_QWORD *)
{
  uint64_t *v2;

  v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_2487B0388(v2);
  return sub_248719B1C;
}

void (*sub_2487B0388(uint64_t *a1))(uint64_t a1, char a2)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a1[2] = (uint64_t)v1;
  v3 = objc_msgSend(v1, sel_version);
  if (v3)
  {
    v4 = v3;
    v5 = sub_2487B5528();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_2487B03FC;
}

void sub_2487B03FC(uint64_t a1, char a2)
{
  sub_248719D3C(a1, a2, (SEL *)&selRef_setVersion_);
}

uint64_t sub_2487B0408(uint64_t a1, uint64_t a2)
{
  return sub_248719BAC(a1, a2, (SEL *)&selRef_trainingLocaleID);
}

void sub_2487B0414(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_248719C18(a1, a2, a3, a4, (SEL *)&selRef_setTrainingLocaleID_);
}

void (*sub_2487B0420(uint64_t **a1))(_QWORD *)
{
  uint64_t *v2;

  v2 = (uint64_t *)malloc(0x28uLL);
  *a1 = v2;
  v2[4] = (uint64_t)sub_2487B0464(v2);
  return sub_248719B1C;
}

void (*sub_2487B0464(uint64_t *a1))(uint64_t a1, char a2)
{
  void *v1;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  a1[2] = (uint64_t)v1;
  v3 = objc_msgSend(v1, sel_trainingLocaleID);
  if (v3)
  {
    v4 = v3;
    v5 = sub_2487B5528();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a1 = v5;
  a1[1] = v7;
  return sub_2487B04D8;
}

void sub_2487B04D8(uint64_t a1, char a2)
{
  sub_248719D3C(a1, a2, (SEL *)&selRef_setTrainingLocaleID_);
}

uint64_t sub_2487B04E4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_248757374(&qword_25777D140, a2, (uint64_t (*)(uint64_t))type metadata accessor for TTSVBLocalVoiceModelMO, MEMORY[0x24BEE5BD8]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

char *keypath_get_selector_creationDeviceModel()
{
  return sel_creationDeviceModel;
}

char *keypath_get_selector_creationDeviceName()
{
  return sel_creationDeviceName;
}

char *keypath_get_selector_creationDeviceUDID()
{
  return sel_creationDeviceUDID;
}

char *keypath_get_selector_creationOSBuild()
{
  return sel_creationOSBuild;
}

char *keypath_get_selector_isDownloaded()
{
  return sel_isDownloaded;
}

char *keypath_get_selector_modelID()
{
  return sel_modelID;
}

char *keypath_get_selector_trainingLocaleID()
{
  return sel_trainingLocaleID;
}

char *keypath_get_selector_status_()
{
  return sel_status_;
}

char *keypath_get_selector_trainingFinishedDate()
{
  return sel_trainingFinishedDate;
}

char *keypath_get_selector_trainingMode()
{
  return sel_trainingMode;
}

char *keypath_get_selector_trainingStatus_()
{
  return sel_trainingStatus_;
}

char *keypath_get_selector_trainingTaskProgress()
{
  return sel_trainingTaskProgress;
}

char *keypath_get_selector_version()
{
  return sel_version;
}

char *keypath_get_selector_files()
{
  return sel_files;
}

uint64_t method lookup function for TTSVBLocalVoiceModelMO()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static TTSVBLocalVoiceModelMO.fetchRequest()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

id sub_2487B05DC()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_2487B5504();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t static TTSVBCloudVoiceSampleMO.requireSampleWithID(_:voiceID:moc:)(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[2];
  char v16;

  v8 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (_QWORD *)((char *)&v15[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = _s31TextToSpeechVoiceBankingSupport010TTSVBCloudD8SampleMOC11findOrFetch8sampleID05voiceN03mocACSgSS_10Foundation4UUIDVSo22NSManagedObjectContextCtFZ_0(a1, a2, a3, a4);
  if (!result)
  {
    v15[0] = 0;
    v15[1] = 0;
    v16 = 3;
    *v10 = a1;
    v10[1] = a2;
    swift_storeEnumTagMultiPayload();
    type metadata accessor for TTSVBError(0);
    sub_248757374((unint64_t *)&qword_25445ED48, 255, type metadata accessor for TTSVBError, (uint64_t)&protocol conformance descriptor for TTSVBError);
    swift_allocError();
    v13 = v12;
    swift_bridgeObjectRetain();
    TTSVBError.init(_:_:_:)((uint64_t)v15, (uint64_t)v10, 0, v13);
    return swift_willThrow();
  }
  return result;
}

id sub_2487B0774@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_audioFuture);
  *a2 = result;
  return result;
}

id sub_2487B07AC(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setAudioFuture_, *a1);
}

id TTSVBCloudVoiceSampleMO.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TTSVBCloudVoiceSampleMO.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for TTSVBCloudVoiceSampleMO();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TTSVBCloudVoiceSampleMO.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTSVBCloudVoiceSampleMO();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2487B08F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for TTSVBCloudVoiceSampleMO();
  result = sub_2487B5ABC();
  *a1 = result;
  return result;
}

uint64_t _s31TextToSpeechVoiceBankingSupport010TTSVBCloudD8SampleMOC11findOrFetch8sampleID05voiceN03mocACSgSS_10Foundation4UUIDVSo22NSManagedObjectContextCtFZ_0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25777C9B0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2487BE660;
  v8 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  v9 = sub_2487189D4();
  *(_QWORD *)(v7 + 32) = 0x4449656C706D6173;
  *(_QWORD *)(v7 + 40) = 0xE800000000000000;
  *(_QWORD *)(v7 + 96) = v8;
  *(_QWORD *)(v7 + 104) = v9;
  *(_QWORD *)(v7 + 64) = v9;
  *(_QWORD *)(v7 + 72) = a1;
  *(_QWORD *)(v7 + 80) = a2;
  sub_24870A34C(0, &qword_25777C9A8);
  *(_QWORD *)(v7 + 136) = v8;
  *(_QWORD *)(v7 + 144) = v9;
  strcpy((char *)(v7 + 112), "voice.voiceID");
  *(_WORD *)(v7 + 126) = -4864;
  swift_bridgeObjectRetain();
  v10 = sub_2487B51F8();
  *(_QWORD *)(v7 + 176) = sub_24870A34C(0, &qword_25777C9C0);
  *(_QWORD *)(v7 + 184) = sub_248718A18();
  *(_QWORD *)(v7 + 152) = v10;
  v11 = (void *)sub_2487B578C();
  v12 = type metadata accessor for TTSVBCloudVoiceSampleMO();
  static DSO<>.findOrFetch(in:matching:)(a4, v11, v12, (uint64_t)&protocol witness table for TTSVBCloudVoiceSampleMO);
  v14 = v13;

  return v14;
}

uint64_t type metadata accessor for TTSVBCloudVoiceSampleMO()
{
  return objc_opt_self();
}

uint64_t sub_2487B0AC4(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_248757374(&qword_25777D1D8, a2, (uint64_t (*)(uint64_t))type metadata accessor for TTSVBCloudVoiceSampleMO, MEMORY[0x24BEE5BD8]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

char *keypath_get_selector_audioFuture()
{
  return sel_audioFuture;
}

uint64_t method lookup function for TTSVBCloudVoiceSampleMO()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static TTSVBCloudVoiceSampleMO.fetchRequest()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of TTSVBCloudVoiceSampleMO.voiceID.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t sub_2487B0B3C()
{
  uint64_t result;
  uint64_t v1;

  result = *MEMORY[0x24BDFE1A8];
  if (*MEMORY[0x24BDFE1A8])
  {
    result = sub_2487B55B8();
    qword_25445FBD0 = result;
    qword_25445FBD8 = v1;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2487B0B74(uint64_t a1)
{
  return sub_2487B0F4C(a1, qword_25445F938);
}

uint64_t sub_2487B0B90()
{
  return sub_2487B0C20(&qword_25445F950, (uint64_t)qword_25445F938);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static TTSVBLog.common.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2487B0C7C(&qword_25445F950, (uint64_t)qword_25445F938, a1);
}

uint64_t sub_2487B0BE0(uint64_t a1)
{
  return sub_2487B0F4C(a1, qword_257790F28);
}

uint64_t sub_2487B0C04()
{
  return sub_2487B0C20(&qword_257790F20, (uint64_t)qword_257790F28);
}

uint64_t sub_2487B0C20(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = sub_2487B533C();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static TTSVBLog.audio.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2487B0C7C(&qword_257790F20, (uint64_t)qword_257790F28, a1);
}

uint64_t sub_2487B0C7C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_2487B533C();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_2487B0CE4(uint64_t a1)
{
  return sub_2487B0F4C(a1, qword_257790F48);
}

uint64_t static TTSVBLog.speech.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2487B0C7C(&qword_257790F40, (uint64_t)qword_257790F48, a1);
}

uint64_t sub_2487B0D28(uint64_t a1)
{
  return sub_2487B0F4C(a1, qword_25445F970);
}

uint64_t sub_2487B0D54()
{
  return sub_2487B0C20(&qword_25445F988, (uint64_t)qword_25445F970);
}

uint64_t static TTSVBLog.coredata.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2487B0C7C(&qword_25445F988, (uint64_t)qword_25445F970, a1);
}

uint64_t sub_2487B0D8C(uint64_t a1)
{
  return sub_2487B0F4C(a1, qword_25445F900);
}

uint64_t sub_2487B0DB0()
{
  return sub_2487B0C20(&qword_25445F768, (uint64_t)qword_25445F900);
}

uint64_t static TTSVBLog.sync.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2487B0C7C(&qword_25445F768, (uint64_t)qword_25445F900, a1);
}

uint64_t sub_2487B0DE8(uint64_t a1)
{
  return sub_2487B0E48(a1, qword_25445F918, (uint64_t (*)(void))LogTTSVBTrain);
}

uint64_t sub_2487B0DFC()
{
  return sub_2487B0C20(&qword_25445F930, (uint64_t)qword_25445F918);
}

uint64_t static TTSVBLog.train.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2487B0C7C(&qword_25445F930, (uint64_t)qword_25445F918, a1);
}

uint64_t sub_2487B0E34(uint64_t a1)
{
  return sub_2487B0E48(a1, qword_257790F68, (uint64_t (*)(void))LogTTSVBSiri);
}

uint64_t sub_2487B0E48(uint64_t a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t v5;
  id v6;

  v5 = sub_2487B533C();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  v6 = (id)a3();
  return sub_2487B5348();
}

uint64_t static TTSVBLog.siri.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2487B0C7C(&qword_257790F60, (uint64_t)qword_257790F68, a1);
}

uint64_t sub_2487B0EC4(uint64_t a1)
{
  return sub_2487B0F4C(a1, qword_25445F958);
}

uint64_t sub_2487B0EEC()
{
  return sub_2487B0C20(&qword_25445F770, (uint64_t)qword_25445F958);
}

uint64_t static TTSVBLog.daemon.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2487B0C7C(&qword_25445F770, (uint64_t)qword_25445F958, a1);
}

uint64_t sub_2487B0F24(uint64_t a1)
{
  return sub_2487B0F4C(a1, qword_25445F778);
}

uint64_t sub_2487B0F4C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2487B533C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  if (qword_25445FBE0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_2487B5330();
}

uint64_t sub_2487B0FFC()
{
  return sub_2487B0C20(&qword_25445F760, (uint64_t)qword_25445F778);
}

uint64_t static TTSVBLog.service.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2487B0C7C(&qword_25445F760, (uint64_t)qword_25445F778, a1);
}

id sub_2487B1034()
{
  uint64_t v0;
  id result;

  v0 = sub_2487B533C();
  __swift_allocate_value_buffer(v0, qword_257790F88);
  __swift_project_value_buffer(v0, (uint64_t)qword_257790F88);
  result = (id)AXLogTemp();
  if (result)
    return (id)sub_2487B5348();
  __break(1u);
  return result;
}

uint64_t static TTSVBLog.TMP.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2487B0C7C(&qword_257790F80, (uint64_t)qword_257790F88, a1);
}

uint64_t sub_2487B10B0()
{
  uint64_t v0;

  v0 = sub_2487B533C();
  __swift_allocate_value_buffer(v0, qword_257790FA8);
  __swift_project_value_buffer(v0, (uint64_t)qword_257790FA8);
  return sub_2487B5330();
}

uint64_t sub_2487B1130()
{
  return sub_2487B0C20(&qword_257790FA0, (uint64_t)qword_257790FA8);
}

uint64_t static TTSVBLog.liveSpeech.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257790FA0 != -1)
    swift_once();
  v2 = sub_2487B533C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257790FA8);
  swift_beginAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t static TTSVBLog.liveSpeech.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (qword_257790FA0 != -1)
    swift_once();
  v2 = sub_2487B533C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257790FA8);
  swift_beginAccess();
  v4 = *(_QWORD *)(v2 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 24))(v3, a1, v2);
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, v2);
}

uint64_t (*static TTSVBLog.liveSpeech.modify())()
{
  uint64_t v0;

  if (qword_257790FA0 != -1)
    swift_once();
  v0 = sub_2487B533C();
  __swift_project_value_buffer(v0, (uint64_t)qword_257790FA8);
  swift_beginAccess();
  return j__swift_endAccess;
}

ValueMetadata *type metadata accessor for TTSVBLog()
{
  return &type metadata for TTSVBLog;
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

unint64_t TTSVBVoiceStatus.description.getter(uint64_t a1)
{
  unint64_t result;

  result = 0x616974696E696E55;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
    case 2:
      result = 0xD000000000000016;
      break;
    case 3:
      result = 0xD000000000000014;
      break;
    case 4:
      result = 0xD000000000000012;
      break;
    case 5:
      result = 0x676E696E69617254;
      break;
    case 6:
      result = 0x646573756150;
      break;
    case 7:
      result = 0x7964616552;
      break;
    default:
      result = 0x6E776F6E6B6E55;
      break;
  }
  return result;
}

uint64_t TTSVBVoiceStatus.localizedTitle.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v0 = (void *)sub_2487B5504();
  v1 = TTSVBSupportLocString(v0);

  v2 = sub_2487B5528();
  return v2;
}

BOOL TTSVBVoiceStatus.isFinal.getter(uint64_t a1)
{
  return a1 == 4 || a1 == 7;
}

uint64_t sub_2487B15F4()
{
  sub_2487B1794(&qword_25777E0B0, (uint64_t)&unk_2487C1CA0);
  return sub_2487B5648();
}

uint64_t sub_2487B1660()
{
  sub_2487B1794(&qword_25777E0B0, (uint64_t)&unk_2487C1CA0);
  return sub_2487B5630();
}

uint64_t sub_2487B16BC()
{
  return sub_2487B1794(&qword_25777E0A8, (uint64_t)&unk_2487C1CDC);
}

uint64_t sub_2487B16E0()
{
  sub_2487B5D5C();
  sub_2487B5D68();
  return sub_2487B5D98();
}

uint64_t sub_2487B1724()
{
  return sub_2487B5D68();
}

uint64_t sub_2487B174C()
{
  sub_2487B5D5C();
  sub_2487B5D68();
  return sub_2487B5D98();
}

unint64_t sub_2487B178C()
{
  uint64_t *v0;

  return TTSVBVoiceStatus.description.getter(*v0);
}

uint64_t sub_2487B1794(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for TTSVBVoiceStatus(255);
    result = MEMORY[0x24959AEB4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t TTSVBVoice.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t type metadata accessor for TTSVBVoice()
{
  uint64_t result;

  result = qword_257791550;
  if (!qword_257791550)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t TTSVBVoice.localeID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + *(int *)(type metadata accessor for TTSVBVoice() + 24));
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t TTSVBVoice.init(name:voiceID:localeID:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, _QWORD *a6@<X8>)
{
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  _QWORD *v14;

  *a6 = a1;
  a6[1] = a2;
  v10 = type metadata accessor for TTSVBVoice();
  v11 = (char *)a6 + *(int *)(v10 + 20);
  v12 = sub_2487B5228();
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v11, a3, v12);
  v14 = (_QWORD *)((char *)a6 + *(int *)(v10 + 24));
  *v14 = a4;
  v14[1] = a5;
  return result;
}

uint64_t TTSVBVoice.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  char v40;
  char v41;
  char v42;

  v38 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777E0B8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for TTSVBVoice();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (uint64_t *)((char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  v11 = a1[3];
  v39 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v11);
  sub_2487B1C04();
  sub_2487B5DA4();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
  v36 = v10;
  v37 = v5;
  v35 = v8;
  v42 = 0;
  v12 = sub_2487B5BE8();
  v13 = v4;
  v15 = v36;
  *v36 = v12;
  v15[1] = v16;
  v17 = sub_2487B5228();
  v34 = (uint64_t)&v34;
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = 1;
  sub_2487B252C(&qword_25777C858, MEMORY[0x24BDCEAA0]);
  sub_2487B5C24();
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))((char *)v15 + *(int *)(v35 + 20), v20, v17);
  v40 = 2;
  v21 = sub_2487B5BD0();
  v23 = v22;
  v24 = v7;
  v25 = v13;
  v26 = v37;
  if (v22)
  {
    v27 = v21;
  }
  else
  {
    v28 = sub_2486F5254();
    v27 = *(_QWORD *)v28;
    v23 = *((_QWORD *)v28 + 1);
    swift_bridgeObjectRetain();
  }
  v29 = v35;
  v30 = v38;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v24, v25);
  v31 = *(int *)(v29 + 24);
  v32 = (uint64_t)v36;
  v33 = (uint64_t *)((char *)v36 + v31);
  *v33 = v27;
  v33[1] = v23;
  sub_2487B1C48(v32, v30);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
  return sub_2487B1C8C(v32);
}

unint64_t sub_2487B1C04()
{
  unint64_t result;

  result = qword_2577912C0[0];
  if (!qword_2577912C0[0])
  {
    result = MEMORY[0x24959AEB4](&unk_2487C1F1C, &type metadata for TTSVBVoice.CodingKeys);
    atomic_store(result, qword_2577912C0);
  }
  return result;
}

uint64_t sub_2487B1C48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TTSVBVoice();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2487B1C8C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TTSVBVoice();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t _s31TextToSpeechVoiceBankingSupport10TTSVBVoiceV7voiceID10Foundation4UUIDVvg_0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(int *)(type metadata accessor for TTSVBVoice() + 20);
  v4 = sub_2487B5228();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t TTSVBVoice.convertToData()()
{
  uint64_t v0;

  sub_2487B4E50();
  swift_allocObject();
  sub_2487B4E44();
  type metadata accessor for TTSVBVoice();
  sub_2487B2590(&qword_25777C1C8, (uint64_t)&protocol conformance descriptor for TTSVBVoice);
  v0 = sub_2487B4E38();
  swift_release();
  return v0;
}

uint64_t TTSVBVoice.init(data:)(uint64_t a1, unint64_t a2)
{
  sub_2487B4E2C();
  swift_allocObject();
  sub_2487B4E20();
  type metadata accessor for TTSVBVoice();
  sub_2487B2590(&qword_25777C1C0, (uint64_t)&protocol conformance descriptor for TTSVBVoice);
  sub_2487B4E14();
  sub_2486F4A28(a1, a2);
  return swift_release();
}

uint64_t TTSVBVoice.hash(into:)()
{
  swift_bridgeObjectRetain();
  sub_2487B557C();
  swift_bridgeObjectRelease();
  type metadata accessor for TTSVBVoice();
  sub_2487B5228();
  sub_2487B252C((unint64_t *)&qword_25777C458, MEMORY[0x24BDCEA80]);
  sub_2487B5480();
  swift_bridgeObjectRetain();
  sub_2487B557C();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2487B1F68()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x44496563696F76;
  if (*v0 != 1)
    v1 = 0x4449656C61636F6CLL;
  if (*v0)
    return v1;
  else
    return 1701667182;
}

uint64_t sub_2487B1FBC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_2487B2C88(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_2487B1FE0()
{
  sub_2487B1C04();
  return sub_2487B5DBC();
}

uint64_t sub_2487B2008()
{
  sub_2487B1C04();
  return sub_2487B5DC8();
}

uint64_t TTSVBVoice.encode(to:)(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  _BYTE v8[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777E0C0);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2487B1C04();
  sub_2487B5DB0();
  v8[15] = 0;
  sub_2487B5C6C();
  if (!v1)
  {
    type metadata accessor for TTSVBVoice();
    v8[14] = 1;
    sub_2487B5228();
    sub_2487B252C(&qword_25777C658, MEMORY[0x24BDCEA78]);
    sub_2487B5CA8();
    v8[13] = 2;
    sub_2487B5C6C();
  }
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t TTSVBVoice.hashValue.getter()
{
  sub_2487B5D5C();
  sub_2487B557C();
  type metadata accessor for TTSVBVoice();
  sub_2487B5228();
  sub_2487B252C((unint64_t *)&qword_25777C458, MEMORY[0x24BDCEA80]);
  sub_2487B5480();
  sub_2487B557C();
  return sub_2487B5D98();
}

uint64_t sub_2487B2254@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return TTSVBVoice.init(from:)(a1, a2);
}

uint64_t sub_2487B2268(_QWORD *a1)
{
  return TTSVBVoice.encode(to:)(a1);
}

uint64_t sub_2487B227C()
{
  sub_2487B5D5C();
  sub_2487B557C();
  sub_2487B5228();
  sub_2487B252C((unint64_t *)&qword_25777C458, MEMORY[0x24BDCEA80]);
  sub_2487B5480();
  sub_2487B557C();
  return sub_2487B5D98();
}

uint64_t sub_2487B2318()
{
  sub_2487B557C();
  sub_2487B5228();
  sub_2487B252C((unint64_t *)&qword_25777C458, MEMORY[0x24BDCEA80]);
  sub_2487B5480();
  return sub_2487B557C();
}

uint64_t sub_2487B239C()
{
  sub_2487B5D5C();
  sub_2487B557C();
  sub_2487B5228();
  sub_2487B252C((unint64_t *)&qword_25777C458, MEMORY[0x24BDCEA80]);
  sub_2487B5480();
  sub_2487B557C();
  return sub_2487B5D98();
}

uint64_t sub_2487B2434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  v4 = v2 + *(int *)(a1 + 20);
  v5 = sub_2487B5228();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

uint64_t _s31TextToSpeechVoiceBankingSupport10TTSVBVoiceV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
  BOOL v4;
  char v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *a1 == *a2 && a1[1] == a2[1];
  if (v4 || (v5 = sub_2487B5CE4(), result = 0, (v5 & 1) != 0))
  {
    v7 = type metadata accessor for TTSVBVoice();
    if ((sub_2487B5204() & 1) != 0)
    {
      v8 = *(int *)(v7 + 24);
      v9 = *(_QWORD *)((char *)a1 + v8);
      v10 = *(_QWORD *)((char *)a1 + v8 + 8);
      v11 = (_QWORD *)((char *)a2 + v8);
      if (v9 == *v11 && v10 == v11[1])
        return 1;
      else
        return sub_2487B5CE4();
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t sub_2487B252C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2487B5228();
    result = MEMORY[0x24959AEB4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2487B256C()
{
  return sub_2487B2590(&qword_25777E0C8, (uint64_t)&protocol conformance descriptor for TTSVBVoice);
}

uint64_t sub_2487B2590(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for TTSVBVoice();
    result = MEMORY[0x24959AEB4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2487B25D0()
{
  return sub_2487B252C((unint64_t *)&qword_25777C458, MEMORY[0x24BDCEA80]);
}

uint64_t *initializeBufferWithCopyOfBuffer for TTSVBVoice(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v17 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_2487B5228();
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    swift_bridgeObjectRetain();
    v12(v9, v10, v11);
    v13 = *(int *)(a3 + 24);
    v14 = (uint64_t *)((char *)v4 + v13);
    v15 = (uint64_t *)((char *)a2 + v13);
    v16 = v15[1];
    *v14 = *v15;
    v14[1] = v16;
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t destroy for TTSVBVoice(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_2487B5228();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for TTSVBVoice(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2487B5228();
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  swift_bridgeObjectRetain();
  v11(v8, v9, v10);
  v12 = *(int *)(a3 + 24);
  v13 = (_QWORD *)((char *)a1 + v12);
  v14 = (_QWORD *)((char *)a2 + v12);
  v15 = v14[1];
  *v13 = *v14;
  v13[1] = v15;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TTSVBVoice(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2487B5228();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 24))(v7, v8, v9);
  v10 = *(int *)(a3 + 24);
  v11 = (_QWORD *)((char *)a1 + v10);
  v12 = (_QWORD *)((char *)a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_OWORD *initializeWithTake for TTSVBVoice(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = sub_2487B5228();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_OWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_OWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *assignWithTake for TTSVBVoice(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = sub_2487B5228();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = (_QWORD *)((char *)a1 + v11);
  v13 = (_QWORD *)((char *)a2 + v11);
  v15 = *v13;
  v14 = v13[1];
  *v12 = v15;
  v12[1] = v14;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTSVBVoice()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2487B2974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = sub_2487B5228();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 20), a2, v8);
  }
}

uint64_t storeEnumTagSinglePayload for TTSVBVoice()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2487B29FC(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = sub_2487B5228();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 20), a2, a2, v7);
  }
  return result;
}

uint64_t sub_2487B2A70()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2487B5228();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for TTSVBVoice.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2487B2B30 + 4 * byte_2487C1D15[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_2487B2B64 + 4 * byte_2487C1D10[v4]))();
}

uint64_t sub_2487B2B64(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2487B2B6C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2487B2B74);
  return result;
}

uint64_t sub_2487B2B80(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2487B2B88);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_2487B2B8C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2487B2B94(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for TTSVBVoice.CodingKeys()
{
  return &type metadata for TTSVBVoice.CodingKeys;
}

unint64_t sub_2487B2BB4()
{
  unint64_t result;

  result = qword_257791660[0];
  if (!qword_257791660[0])
  {
    result = MEMORY[0x24959AEB4](&unk_2487C1EF4, &type metadata for TTSVBVoice.CodingKeys);
    atomic_store(result, qword_257791660);
  }
  return result;
}

unint64_t sub_2487B2BFC()
{
  unint64_t result;

  result = qword_257791770;
  if (!qword_257791770)
  {
    result = MEMORY[0x24959AEB4](&unk_2487C1E64, &type metadata for TTSVBVoice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257791770);
  }
  return result;
}

unint64_t sub_2487B2C44()
{
  unint64_t result;

  result = qword_257791778;
  if (!qword_257791778)
  {
    result = MEMORY[0x24959AEB4](&unk_2487C1E8C, &type metadata for TTSVBVoice.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257791778);
  }
  return result;
}

uint64_t sub_2487B2C88(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 1701667182 && a2 == 0xE400000000000000;
  if (v2 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x44496563696F76 && a2 == 0xE700000000000000 || (sub_2487B5CE4() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x4449656C61636F6CLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    v6 = sub_2487B5CE4();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 2;
    else
      return 3;
  }
}

uint64_t sub_2487B2DCC()
{
  uint64_t v0;

  v0 = sub_2487B52DC();
  __swift_allocate_value_buffer(v0, qword_257791808);
  __swift_project_value_buffer(v0, (uint64_t)qword_257791808);
  return sub_2487B52D0();
}

uint64_t sub_2487B2E4C()
{
  uint64_t v0;

  if (qword_257791800 != -1)
    swift_once();
  v0 = sub_2487B52DC();
  return __swift_project_value_buffer(v0, (uint64_t)qword_257791808);
}

uint64_t static TTSVBSignposter.download.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257791800 != -1)
    swift_once();
  v2 = sub_2487B52DC();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257791808);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

char **sub_2487B2F04()
{
  return &off_2519977F8;
}

const char *static StaticString.TTSVBDownloadASRInterval.getter()
{
  return "DownloadASRInterval";
}

ValueMetadata *type metadata accessor for TTSVBSignposter()
{
  return &type metadata for TTSVBSignposter;
}

_QWORD *TTSVBCommonVoiceSampleMO.trainingValidity.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _DWORD *a3@<X8>)
{
  _QWORD *v6;
  float v7;
  float v8;
  float v9;
  float v10;

  v6 = (_QWORD *)(*(uint64_t (**)(void))(a2 + 328))();
  v7 = (*(float (**)(uint64_t, uint64_t))(a2 + 352))(a1, a2);
  v8 = (*(float (**)(uint64_t, uint64_t))(a2 + 400))(a1, a2);
  v9 = (*(float (**)(uint64_t, uint64_t))(a2 + 376))(a1, a2);
  v10 = (*(float (**)(uint64_t, uint64_t))(a2 + 424))(a1, a2);
  return static TTSVBVoiceSampleTrainingValidity.evaluate(userScore:spl:splThreshold:snr:snrThreshold:)(v6, a3, v7, v8, v9, v10);
}

uint64_t TTSVBCommonVoiceSampleMO.flags.getter@<X0>(uint64_t a1@<X1>, _DWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = (*(uint64_t (**)(void))(a1 + 448))();
  return TTSVBVoiceSampleFlags.init(rawValue:)(v3, a2);
}

uint64_t sub_2487B3010@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, _DWORD *a3@<X8>)
{
  uint64_t result;
  int v5;

  result = TTSVBCommonVoiceSampleMO.flags.getter(*(_QWORD *)(a2 + a1 - 8), &v5);
  *a3 = v5;
  return result;
}

uint64_t sub_2487B3054(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v7;

  v5 = *(_QWORD *)(a4 + a3 - 16);
  v4 = *(_QWORD *)(a4 + a3 - 8);
  v7 = *a1;
  return TTSVBCommonVoiceSampleMO.flags.setter(&v7, v5, v4);
}

uint64_t TTSVBCommonVoiceSampleMO.flags.setter(unsigned int *a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD))(a3 + 456))(*a1);
}

uint64_t (*TTSVBCommonVoiceSampleMO.flags.modify(_QWORD *a1, uint64_t a2, uint64_t a3))(uint64_t a1)
{
  uint64_t v3;
  _DWORD *v4;
  uint64_t v5;

  v4 = a1 + 3;
  a1[1] = a3;
  a1[2] = v3;
  *a1 = a2;
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 448))(a2, a3);
  TTSVBVoiceSampleFlags.init(rawValue:)(v5, v4);
  return sub_2487B30E8;
}

uint64_t sub_2487B30E8(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 8) + 456))(*(unsigned int *)(a1 + 24), *(_QWORD *)a1);
}

uint64_t TTSVBCommonVoiceSampleMO.hasVoiceRecording.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  unsigned __int8 v11;
  _QWORD v13[2];

  v4 = sub_2487B50CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  TTSVBCommonVoiceSampleMO.url.getter(a1, a2, (uint64_t)v10);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4) == 1)
  {
    sub_2486F5008((uint64_t)v10, &qword_25445ED28);
    v11 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v7, v10, v4);
    v13[1] = *sub_24876D91C();
    v11 = _TTSVBFileManager.fileExists(_:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  return v11 & 1;
}

uint64_t TTSVBCommonVoiceSampleMO.url.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
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
  char *v17;
  uint64_t v18;
  unsigned int (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  _QWORD *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  char *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  _BOOL4 v47;
  char *v48;
  uint64_t v49;
  uint8_t *v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint8_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;

  v58 = a3;
  v5 = sub_2487B533C();
  v6 = *(_QWORD *)(v5 - 8);
  v56 = v5;
  v57 = v6;
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v55 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TTSVBPath();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v55 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2487B5228();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v60 = (char *)&v55 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED40);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v55 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = a1;
  (*(void (**)(uint64_t, uint64_t))(a2 + 472))(a1, a2);
  v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48);
  v59 = v12;
  if (v19(v17, 1, v12) == 1)
  {
    sub_2486F5008((uint64_t)v17, &qword_25445ED40);
    v20 = sub_2487B50CC();
    v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
    v22 = v58;
  }
  else
  {
    v55 = (uint8_t *)v9;
    v23 = v56;
    v24 = v57;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v60, v17, v59);
    v25 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 208))(v18, a2);
    if (v26)
    {
      v27 = v25;
      v28 = v26;
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_25777C180);
      v30 = &v11[*(int *)(v29 + 48)];
      v31 = &v11[*(int *)(v29 + 64)];
      v33 = v59;
      v32 = v60;
      (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v11, v60, v59);
      *(_QWORD *)v30 = v27;
      *((_QWORD *)v30 + 1) = v28;
      v34 = sub_248755234();
      v35 = (void *)v34[1];
      *(_WORD *)v31 = *(_WORD *)v34;
      *((_QWORD *)v31 + 1) = v35;
      swift_storeEnumTagMultiPayload();
      v36 = v35;
      v37 = v58;
      TTSVBPath.url.getter(v58);
      sub_2487B3D24((uint64_t)v11);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v32, v33);
      v38 = sub_2487B50CC();
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v38 - 8) + 56))(v37, 0, 1, v38);
    }
    v40 = sub_2487B0D54();
    v41 = v24;
    v42 = v8;
    v43 = v8;
    v44 = v23;
    (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v43, v40, v23);
    v45 = sub_2487B5324();
    v46 = sub_2487B57D4();
    v47 = os_log_type_enabled(v45, v46);
    v49 = v59;
    v48 = v60;
    if (v47)
    {
      v50 = (uint8_t *)swift_slowAlloc();
      v51 = swift_slowAlloc();
      v62 = v51;
      *(_DWORD *)v50 = 136315138;
      v55 = v50 + 4;
      v52 = sub_2487B5DE0();
      v61 = sub_2486EDE5C(v52, v53, &v62);
      sub_2487B593C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2486E6000, v45, v46, "'sampleID' property on %s was unexpectedly nil", v50, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24959AF80](v51, -1, -1);
      MEMORY[0x24959AF80](v50, -1, -1);

      (*(void (**)(char *, uint64_t))(v57 + 8))(v42, v44);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v60, v59);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v41 + 8))(v42, v44);
      (*(void (**)(char *, uint64_t))(v13 + 8))(v48, v49);
    }
    v54 = v58;
    v20 = sub_2487B50CC();
    v21 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56);
    v22 = v54;
  }
  return v21(v22, 1, 1, v20);
}

uint64_t TTSVBCommonVoiceSampleMO.displayPhrase.getter(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v3;

  result = (*(uint64_t (**)(void))(a2 + 160))();
  if (!v3)
    return 0;
  return result;
}

uint64_t TTSVBCommonVoiceSampleMO.immutableSample()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  float v35;
  float v36;
  float v37;
  float v38;
  uint64_t v39;
  uint64_t v40[2];
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53[3];

  result = (*(uint64_t (**)(void))(a2 + 208))();
  if (!v7)
  {
    __break(1u);
    goto LABEL_9;
  }
  v8 = result;
  v9 = v7;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED28);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  TTSVBCommonVoiceSampleMO.url.getter(a1, a2, (uint64_t)v12);
  v13 = (*(double (**)(uint64_t, uint64_t))(a2 + 184))(a1, a2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 136))(a1, a2);
  if (!v14)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v15 = result;
  v16 = v14;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 160))(a1, a2);
  v52 = v17;
  if (!v17)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v18 = result;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 256))(a1, a2);
  v50 = v19;
  v51 = result;
  if (!v19)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v48 = v18;
  v49 = v16;
  result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 40))(a1, a2);
  v47 = result;
  if (!v20)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v21 = v20;
  v42 = v15;
  v43 = v12;
  v44 = v9;
  v45 = v8;
  v46 = a3;
  v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 112))(a1, a2);
  v23 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 232))(a1, a2);
  v24 = (*(double (**)(uint64_t, uint64_t))(a2 + 64))(a1, a2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 88))(a1, a2);
  v41 = result;
  if (v25)
  {
    v26 = v25;
    v40[0] = v22;
    v27 = v23;
    v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
    v40[1] = (uint64_t)v40;
    MEMORY[0x24BDAC7A8](v28);
    v30 = (char *)v40 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(uint64_t, uint64_t))(a2 + 304))(a1, a2);
    v31 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 280))(a1, a2);
    v33 = v32;
    v34 = (*(__int16 (**)(uint64_t, uint64_t))(a2 + 328))(a1, a2);
    v35 = (*(float (**)(uint64_t, uint64_t))(a2 + 352))(a1, a2);
    v36 = (*(float (**)(uint64_t, uint64_t))(a2 + 376))(a1, a2);
    v37 = (*(float (**)(uint64_t, uint64_t))(a2 + 400))(a1, a2);
    v38 = (*(float (**)(uint64_t, uint64_t))(a2 + 424))(a1, a2);
    v39 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 448))(a1, a2);
    TTSVBVoiceSampleFlags.init(rawValue:)(v39, v53);
    return TTSVBVoiceSample.init(sampleID:url:recordingDuration:phonemes:phrase:transcript:bookTitle:paragraphIndex:sentenceIndex:estimatedDuration:locale:recordingDate:userPhrase:userScore:spl:snr:splThreshold:snrThreshold:flags:)(v45, v44, (uint64_t)v43, v42, v49, v48, v52, v51, v46, v13, v24, v35, v36, v37, v38, v50, v47, v21, v40[0],
             v27,
             v41,
             v26,
             (uint64_t)v30,
             v31,
             v33,
             v34,
             v53);
  }
LABEL_13:
  __break(1u);
  return result;
}

uint64_t TTSVBCommonVoiceSampleMO.shallowUpdate(fromSample:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType;
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;

  ObjectType = swift_getObjectType();
  v8 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 24))(v8, a3, a4);
  v9 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 40))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 48))(v9);
  (*(void (**)(uint64_t, uint64_t))(a2 + 64))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a4 + 72))(a3, a4);
  v10 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 88))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 96))(v10);
  v11 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 112))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 120))(v11, a3, a4);
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 136))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 144))(v12);
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 160))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 168))(v13);
  (*(void (**)(uint64_t, uint64_t))(a2 + 184))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a4 + 192))(a3, a4);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 208))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 216))(v14);
  v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 232))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 240))(v15, a3, a4);
  v16 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 256))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 264))(v16);
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 280))(ObjectType, a2);
  (*(void (**)(uint64_t))(a4 + 288))(v17);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED38);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(uint64_t, uint64_t))(a2 + 304))(ObjectType, a2);
  (*(void (**)(char *, uint64_t, uint64_t))(a4 + 312))(v20, a3, a4);
  v21 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 328))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 336))(v21, a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a2 + 352))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a4 + 360))(a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a2 + 376))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a4 + 384))(a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a2 + 400))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a4 + 408))(a3, a4);
  (*(void (**)(uint64_t, uint64_t))(a2 + 424))(ObjectType, a2);
  (*(void (**)(uint64_t, uint64_t))(a4 + 432))(a3, a4);
  v22 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 448))(ObjectType, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a4 + 456))(v22, a3, a4);
}

uint64_t sub_2487B3D24(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TTSVBPath();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2487B3D60()
{
  return 16;
}

__n128 sub_2487B3D6C(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.apiVersion.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.apiVersion.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.apiVersion.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.bookTitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.bookTitle.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.bookTitle.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.estimatedDuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.estimatedDuration.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.estimatedDuration.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.locale.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 88))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.locale.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 96))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.locale.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 104))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.paragraphIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.paragraphIndex.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.paragraphIndex.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 128))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.phonemes.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 136))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.phonemes.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 144))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.phonemes.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 152))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.phrase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 160))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.phrase.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 168))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.phrase.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 176))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.recordingDuration.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 184))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.recordingDuration.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 192))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.recordingDuration.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 200))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.sampleID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 208))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.sampleID.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 216))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.sampleID.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 224))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.sentenceIndex.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 232))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.sentenceIndex.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 240))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.sentenceIndex.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 248))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.transcript.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 256))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.transcript.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 264))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.transcript.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 272))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.userPhrase.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 280))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.userPhrase.setter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 288))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.userPhrase.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 296))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.recordingDate.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 304))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.recordingDate.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 312))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.recordingDate.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 320))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.userScore.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 328))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.userScore.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 336))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.userScore.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 344))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.spl.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 352))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.spl.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 360))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.spl.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 368))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.snr.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 376))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.snr.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 384))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.snr.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 392))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.splThreshold.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 400))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.splThreshold.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 408))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.splThreshold.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 416))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.snrThreshold.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 424))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.snrThreshold.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 432))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.snrThreshold.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 440))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.flags_.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 448))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.flags_.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 456))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.flags_.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 464))();
}

uint64_t dispatch thunk of TTSVBCommonVoiceSampleMO.voiceID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 472))();
}

unint64_t TTSVBVoiceTrainingStatus.description.getter(uint64_t a1)
{
  unint64_t result;

  result = 0x656E696665646E55;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x65636F7270657250;
      break;
    case 2:
      result = 0xD000000000000017;
      break;
    case 3:
      result = 0xD000000000000013;
      break;
    case 4:
      result = 0x64656873696E6946;
      break;
    default:
      result = 0x6E776F6E6B6E55;
      break;
  }
  return result;
}

uint64_t TTSVBVoiceTrainingStatus.localizedTitle.getter()
{
  void *v0;
  id v1;
  uint64_t v2;

  v0 = (void *)sub_2487B5504();
  v1 = TTSVBSupportLocString(v0);

  v2 = sub_2487B5528();
  return v2;
}

uint64_t sub_2487B414C()
{
  sub_2487B4240((unint64_t *)&unk_25777E160, (uint64_t)&unk_2487BDF10);
  return sub_2487B5648();
}

uint64_t sub_2487B41B8()
{
  sub_2487B4240((unint64_t *)&unk_25777E160, (uint64_t)&unk_2487BDF10);
  return sub_2487B5630();
}

uint64_t sub_2487B4214()
{
  return sub_2487B4240(&qword_25777E158, (uint64_t)&unk_2487C207C);
}

unint64_t sub_2487B4238()
{
  uint64_t *v0;

  return TTSVBVoiceTrainingStatus.description.getter(*v0);
}

uint64_t sub_2487B4240(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for TTSVBVoiceTrainingStatus(255);
    result = MEMORY[0x24959AEB4](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t static TTSVBCloudVoiceModelMO.findOrFetch(modelID:moc:)(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25777C9B0);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2487BD7B0;
  sub_24870A34C(0, &qword_25777C9A8);
  *(_QWORD *)(v3 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v3 + 64) = sub_2487189D4();
  *(_QWORD *)(v3 + 32) = 0x44496C65646F6DLL;
  *(_QWORD *)(v3 + 40) = 0xE700000000000000;
  v4 = sub_2487B51F8();
  *(_QWORD *)(v3 + 96) = sub_24870A34C(0, &qword_25777C9C0);
  *(_QWORD *)(v3 + 104) = sub_248718A18();
  *(_QWORD *)(v3 + 72) = v4;
  v5 = (void *)sub_2487B578C();
  v6 = type metadata accessor for TTSVBCloudVoiceModelMO();
  static DSO<>.findOrFetch(in:matching:)(a2, v5, v6, (uint64_t)&protocol witness table for TTSVBCloudVoiceModelMO);
  v8 = v7;

  return v8;
}

uint64_t type metadata accessor for TTSVBCloudVoiceModelMO()
{
  return objc_opt_self();
}

uint64_t static TTSVBCloudVoiceModelMO.requireModelWithID(_:moc:)(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v17[2];
  char v18;

  v4 = type metadata accessor for TTSVBError.Reason(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v17[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25777C9B0);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_2487BD7B0;
  sub_24870A34C(0, &qword_25777C9A8);
  *(_QWORD *)(v7 + 56) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v7 + 64) = sub_2487189D4();
  *(_QWORD *)(v7 + 32) = 0x44496C65646F6DLL;
  *(_QWORD *)(v7 + 40) = 0xE700000000000000;
  v8 = sub_2487B51F8();
  *(_QWORD *)(v7 + 96) = sub_24870A34C(0, &qword_25777C9C0);
  *(_QWORD *)(v7 + 104) = sub_248718A18();
  *(_QWORD *)(v7 + 72) = v8;
  v9 = (void *)sub_2487B578C();
  v10 = type metadata accessor for TTSVBCloudVoiceModelMO();
  static DSO<>.findOrFetch(in:matching:)(a2, v9, v10, (uint64_t)&protocol witness table for TTSVBCloudVoiceModelMO);
  v12 = v11;

  if (!v12)
  {
    v17[0] = 0;
    v17[1] = 0;
    v18 = 3;
    v13 = sub_2487B5228();
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v6, a1, v13);
    swift_storeEnumTagMultiPayload();
    v12 = type metadata accessor for TTSVBError(0);
    sub_248757374((unint64_t *)&qword_25445ED48, 255, type metadata accessor for TTSVBError, (uint64_t)&protocol conformance descriptor for TTSVBError);
    swift_allocError();
    TTSVBError.init(_:_:_:)((uint64_t)v17, (uint64_t)v6, 0, v14);
    swift_willThrow();
  }
  return v12;
}

id sub_2487B45CC()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone(MEMORY[0x24BDBB678]);
  v1 = (void *)sub_2487B5504();
  v2 = objc_msgSend(v0, sel_initWithEntityName_, v1);

  return v2;
}

uint64_t sub_2487B4634()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  v1 = objc_msgSend(v0, sel_files);
  if (!v1
    || (v2 = v1,
        v3 = objc_msgSend(v1, sel_allObjects),
        v2,
        v4 = sub_2487B5684(),
        v3,
        v5 = sub_2487B46D8(v4),
        swift_bridgeObjectRelease(),
        !v5))
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x24BEE4AF8];
  }
  return v5;
}

uint64_t sub_2487B46D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;
  _BYTE v5[32];
  uint64_t v6;

  v6 = MEMORY[0x24BEE4AF8];
  v2 = *(_QWORD *)(a1 + 16);
  sub_2487B5B1C();
  if (!v2)
    return v6;
  for (i = a1 + 32; ; i += 32)
  {
    sub_2486F0814(i, (uint64_t)v5);
    type metadata accessor for TTSVBCloudVoiceModelFileMO();
    if (!swift_dynamicCast())
      break;
    sub_2487B5B04();
    sub_2487B5B28();
    sub_2487B5B34();
    sub_2487B5B10();
    if (!--v2)
      return v6;
  }
  swift_release();

  return 0;
}

uint64_t sub_2487B47D0@<X0>(char *a1@<X0>, char *a2@<X8>)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  char *v36;

  v5 = sub_2487B533C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v10 = a1;
    goto LABEL_5;
  }
  v11 = (char *)objc_msgSend(v2, sel_voice, v7);
  if (v11)
  {
    v10 = v11;
LABEL_5:
    v12 = a1;
    v13 = objc_msgSend(v10, sel_name);
    if (v13)
    {
      v14 = v13;
      v35 = v2;
      v36 = a2;
      v15 = sub_2487B5528();
      v17 = v16;

      v18 = objc_msgSend(v10, sel_voiceID);
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_25445ED40);
      MEMORY[0x24BDAC7A8](v19);
      a1 = (char *)&v35 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v18)
      {
        v21 = sub_2487B5228();
        v22 = *(_QWORD *)(v21 - 8);
        MEMORY[0x24BDAC7A8](v21);
        v24 = (char *)&v35 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
        sub_2487B5210();

        (*(void (**)(char *, char *, uint64_t))(v22 + 32))(a1, v24, v21);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v22 + 56))(a1, 0, 1, v21);
        result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(a1, 1, v21);
        if ((_DWORD)result != 1)
        {
          v26 = type metadata accessor for TTSVBCloudVoiceModelMO();
          v28 = sub_248757374(&qword_25777C9D0, v27, (uint64_t (*)(uint64_t))type metadata accessor for TTSVBCloudVoiceModelMO, (uint64_t)&protocol conformance descriptor for TTSVBCloudVoiceModelMO);
          TTSVBCommonVoiceModelMO.immutableModel(voiceName:voiceID:)(v15, v17, v26, v28, v36);

          swift_bridgeObjectRelease();
          return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(a1, v21);
        }
LABEL_15:
        __break(1u);
        return result;
      }
    }
    else
    {
      __break(1u);
    }
    v34 = sub_2487B5228();
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(a1, 1, 1, v34);
    goto LABEL_15;
  }
  v29 = sub_2487B0D54();
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v29, v5);
  v30 = sub_2487B5324();
  v31 = sub_2487B57D4();
  if (os_log_type_enabled(v30, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_2486E6000, v30, v31, "Cannot return immutableModel. no related voice was found.", v32, 2u);
    MEMORY[0x24959AF80](v32, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
  v33 = type metadata accessor for TTSVBVoiceModel();
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(a2, 1, 1, v33);
}

id TTSVBCloudVoiceModelMO.__allocating_init(entity:insertInto:)(void *a1, void *a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(v2), sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TTSVBCloudVoiceModelMO.init(entity:insertInto:)(void *a1, void *a2)
{
  void *v2;
  id v5;
  objc_super v7;

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for TTSVBCloudVoiceModelMO();
  v5 = objc_msgSendSuper2(&v7, sel_initWithEntity_insertIntoManagedObjectContext_, a1, a2);

  return v5;
}

id TTSVBCloudVoiceModelMO.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTSVBCloudVoiceModelMO();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2487B4C28@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  type metadata accessor for TTSVBCloudVoiceModelMO();
  result = sub_2487B5ABC();
  *a1 = result;
  return result;
}

uint64_t sub_2487B4C64(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = sub_248757374(&qword_25777D1E0, a2, (uint64_t (*)(uint64_t))type metadata accessor for TTSVBCloudVoiceModelMO, MEMORY[0x24BEE5BD8]);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t method lookup function for TTSVBCloudVoiceModelMO()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static TTSVBCloudVoiceModelMO.fetchRequest()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of TTSVBCloudVoiceModelMO.fileFutures.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t __getSiriTTSTrainerTaskClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSiriTTSTrainerAudioQualityHelperClass_block_invoke_cold_1(v0);
}

uint64_t __getSiriTTSTrainerAudioQualityHelperClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_cold_1(v0);
}

void __getSiriTTSTrainerSessionClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_2487B4E14();
}

uint64_t sub_2487B4E14()
{
  return MEMORY[0x24BDCB228]();
}

uint64_t sub_2487B4E20()
{
  return MEMORY[0x24BDCB258]();
}

uint64_t sub_2487B4E2C()
{
  return MEMORY[0x24BDCB270]();
}

uint64_t sub_2487B4E38()
{
  return MEMORY[0x24BDCB3C0]();
}

uint64_t sub_2487B4E44()
{
  return MEMORY[0x24BDCB408]();
}

uint64_t sub_2487B4E50()
{
  return MEMORY[0x24BDCB418]();
}

uint64_t sub_2487B4E5C()
{
  return MEMORY[0x24BDCB618]();
}

uint64_t sub_2487B4E68()
{
  return MEMORY[0x24BDCB6B8]();
}

uint64_t sub_2487B4E74()
{
  return MEMORY[0x24BDCB748]();
}

uint64_t sub_2487B4E80()
{
  return MEMORY[0x24BDCB8D0]();
}

uint64_t sub_2487B4E8C()
{
  return MEMORY[0x24BDCB8E0]();
}

uint64_t sub_2487B4E98()
{
  return MEMORY[0x24BDCB908]();
}

uint64_t sub_2487B4EA4()
{
  return MEMORY[0x24BDCB920]();
}

uint64_t sub_2487B4EB0()
{
  return MEMORY[0x24BDCB938]();
}

uint64_t sub_2487B4EBC()
{
  return MEMORY[0x24BDCBE58]();
}

uint64_t sub_2487B4EC8()
{
  return MEMORY[0x24BDCBE88]();
}

uint64_t sub_2487B4ED4()
{
  return MEMORY[0x24BDCBEE0]();
}

uint64_t sub_2487B4EE0()
{
  return MEMORY[0x24BDCBF00]();
}

uint64_t sub_2487B4EEC()
{
  return MEMORY[0x24BDCC708]();
}

uint64_t sub_2487B4EF8()
{
  return MEMORY[0x24BDCC740]();
}

uint64_t sub_2487B4F04()
{
  return MEMORY[0x24BDCC770]();
}

uint64_t sub_2487B4F10()
{
  return MEMORY[0x24BDCC798]();
}

uint64_t sub_2487B4F1C()
{
  return MEMORY[0x24BDCC7B0]();
}

uint64_t sub_2487B4F28()
{
  return MEMORY[0x24BDCC7E0]();
}

uint64_t sub_2487B4F34()
{
  return MEMORY[0x24BDCC800]();
}

uint64_t sub_2487B4F40()
{
  return MEMORY[0x24BDCC810]();
}

uint64_t sub_2487B4F4C()
{
  return MEMORY[0x24BDCD260]();
}

uint64_t sub_2487B4F58()
{
  return MEMORY[0x24BDCD2E8]();
}

uint64_t sub_2487B4F64()
{
  return MEMORY[0x24BDCD300]();
}

uint64_t sub_2487B4F70()
{
  return MEMORY[0x24BDCD440]();
}

uint64_t sub_2487B4F7C()
{
  return MEMORY[0x24BDCD458]();
}

uint64_t sub_2487B4F88()
{
  return MEMORY[0x24BDCD510]();
}

uint64_t sub_2487B4F94()
{
  return MEMORY[0x24BDCD518]();
}

uint64_t sub_2487B4FA0()
{
  return MEMORY[0x24BDCD5A0]();
}

uint64_t sub_2487B4FAC()
{
  return MEMORY[0x24BDCD658]();
}

uint64_t sub_2487B4FB8()
{
  return MEMORY[0x24BDCD670]();
}

uint64_t sub_2487B4FC4()
{
  return MEMORY[0x24BDCD720]();
}

uint64_t sub_2487B4FD0()
{
  return MEMORY[0x24BDCD740]();
}

uint64_t sub_2487B4FDC()
{
  return MEMORY[0x24BDCD780]();
}

uint64_t sub_2487B4FE8()
{
  return MEMORY[0x24BDCD7C0]();
}

uint64_t sub_2487B4FF4()
{
  return MEMORY[0x24BDCD828]();
}

uint64_t sub_2487B5000()
{
  return MEMORY[0x24BDCD840]();
}

uint64_t sub_2487B500C()
{
  return MEMORY[0x24BDCD868]();
}

uint64_t sub_2487B5018()
{
  return MEMORY[0x24BDCD890]();
}

uint64_t sub_2487B5024()
{
  return MEMORY[0x24BDCD8A8]();
}

uint64_t sub_2487B5030()
{
  return MEMORY[0x24BDCD8C8]();
}

uint64_t sub_2487B503C()
{
  return MEMORY[0x24BDCD8D8]();
}

uint64_t sub_2487B5048()
{
  return MEMORY[0x24BDCD900]();
}

uint64_t sub_2487B5054()
{
  return MEMORY[0x24BDCD920]();
}

uint64_t sub_2487B5060()
{
  return MEMORY[0x24BDCD930]();
}

uint64_t sub_2487B506C()
{
  return MEMORY[0x24BDCD950]();
}

uint64_t sub_2487B5078()
{
  return MEMORY[0x24BDCD960]();
}

uint64_t sub_2487B5084()
{
  return MEMORY[0x24BDCD990]();
}

uint64_t sub_2487B5090()
{
  return MEMORY[0x24BDCD998]();
}

uint64_t sub_2487B509C()
{
  return MEMORY[0x24BDCD9B8]();
}

uint64_t sub_2487B50A8()
{
  return MEMORY[0x24BDCD9F0]();
}

uint64_t sub_2487B50B4()
{
  return MEMORY[0x24BDCDA00]();
}

uint64_t sub_2487B50C0()
{
  return MEMORY[0x24BDCDA98]();
}

uint64_t sub_2487B50CC()
{
  return MEMORY[0x24BDCDAB8]();
}

uint64_t sub_2487B50D8()
{
  return MEMORY[0x24BDCDB70]();
}

uint64_t sub_2487B50E4()
{
  return MEMORY[0x24BDCDC98]();
}

uint64_t sub_2487B50F0()
{
  return MEMORY[0x24BDCDCD0]();
}

uint64_t sub_2487B50FC()
{
  return MEMORY[0x24BDCDCE8]();
}

uint64_t sub_2487B5108()
{
  return MEMORY[0x24BDCDD28]();
}

uint64_t sub_2487B5114()
{
  return MEMORY[0x24BDCDE88]();
}

uint64_t sub_2487B5120()
{
  return MEMORY[0x24BDCDEA0]();
}

uint64_t sub_2487B512C()
{
  return MEMORY[0x24BDCDED8]();
}

uint64_t sub_2487B5138()
{
  return MEMORY[0x24BDCDEE0]();
}

uint64_t sub_2487B5144()
{
  return MEMORY[0x24BDCDF20]();
}

uint64_t sub_2487B5150()
{
  return MEMORY[0x24BDCDF28]();
}

uint64_t sub_2487B515C()
{
  return MEMORY[0x24BDCE2E0]();
}

uint64_t sub_2487B5168()
{
  return MEMORY[0x24BDCE338]();
}

uint64_t sub_2487B5174()
{
  return MEMORY[0x24BDCE5D0]();
}

uint64_t sub_2487B5180()
{
  return MEMORY[0x24BDCE5F8]();
}

uint64_t sub_2487B518C()
{
  return MEMORY[0x24BDCE618]();
}

uint64_t sub_2487B5198()
{
  return MEMORY[0x24BDCE850]();
}

uint64_t sub_2487B51A4()
{
  return MEMORY[0x24BDCE870]();
}

uint64_t sub_2487B51B0()
{
  return MEMORY[0x24BDCE8B8]();
}

uint64_t sub_2487B51BC()
{
  return MEMORY[0x24BDCE8D0]();
}

uint64_t sub_2487B51C8()
{
  return MEMORY[0x24BDCE8F0]();
}

uint64_t sub_2487B51D4()
{
  return MEMORY[0x24BDCE908]();
}

uint64_t sub_2487B51E0()
{
  return MEMORY[0x24BDCE9A0]();
}

uint64_t sub_2487B51EC()
{
  return MEMORY[0x24BDCE9A8]();
}

uint64_t sub_2487B51F8()
{
  return MEMORY[0x24BDCE9C8]();
}

uint64_t sub_2487B5204()
{
  return MEMORY[0x24BDCE9E8]();
}

uint64_t sub_2487B5210()
{
  return MEMORY[0x24BDCE9F0]();
}

uint64_t sub_2487B521C()
{
  return MEMORY[0x24BDCEA48]();
}

uint64_t sub_2487B5228()
{
  return MEMORY[0x24BDCEA50]();
}

uint64_t sub_2487B5234()
{
  return MEMORY[0x24BDCEB10]();
}

uint64_t sub_2487B5240()
{
  return MEMORY[0x24BDCEB28]();
}

uint64_t sub_2487B524C()
{
  return MEMORY[0x24BDCEC98]();
}

uint64_t sub_2487B5258()
{
  return MEMORY[0x24BDCECA8]();
}

uint64_t sub_2487B5264()
{
  return MEMORY[0x24BDCECE8]();
}

uint64_t sub_2487B5270()
{
  return MEMORY[0x24BDCEEB0]();
}

uint64_t sub_2487B527C()
{
  return MEMORY[0x24BEE5BB0]();
}

uint64_t sub_2487B5288()
{
  return MEMORY[0x24BEDF408]();
}

uint64_t sub_2487B5294()
{
  return MEMORY[0x24BEE73C0]();
}

uint64_t sub_2487B52A0()
{
  return MEMORY[0x24BEE7738]();
}

uint64_t sub_2487B52AC()
{
  return MEMORY[0x24BEE7748]();
}

uint64_t sub_2487B52B8()
{
  return MEMORY[0x24BEE7758]();
}

uint64_t sub_2487B52C4()
{
  return MEMORY[0x24BEE77C0]();
}

uint64_t sub_2487B52D0()
{
  return MEMORY[0x24BEE77C8]();
}

uint64_t sub_2487B52DC()
{
  return MEMORY[0x24BEE77F0]();
}

uint64_t sub_2487B52E8()
{
  return MEMORY[0x24BEE7818]();
}

uint64_t sub_2487B52F4()
{
  return MEMORY[0x24BEE7848]();
}

uint64_t sub_2487B5300()
{
  return MEMORY[0x24BEE7868]();
}

uint64_t sub_2487B530C()
{
  return MEMORY[0x24BEE7870]();
}

uint64_t sub_2487B5318()
{
  return MEMORY[0x24BEE78A0]();
}

uint64_t sub_2487B5324()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_2487B5330()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_2487B533C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_2487B5348()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_2487B5354()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_2487B5360()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_2487B536C()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_2487B5378()
{
  return MEMORY[0x24BDB9CD0]();
}

uint64_t sub_2487B5384()
{
  return MEMORY[0x24BDB9CD8]();
}

uint64_t sub_2487B5390()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_2487B539C()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_2487B53A8()
{
  return MEMORY[0x24BDB9F90]();
}

uint64_t sub_2487B53B4()
{
  return MEMORY[0x24BDBA090]();
}

uint64_t sub_2487B53C0()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_2487B53CC()
{
  return MEMORY[0x24BDBA128]();
}

uint64_t sub_2487B53D8()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_2487B53E4()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_2487B53F0()
{
  return MEMORY[0x24BEE54D0]();
}

uint64_t sub_2487B53FC()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_2487B5408()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_2487B5414()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_2487B5420()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_2487B542C()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_2487B5438()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_2487B5444()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_2487B5450()
{
  return MEMORY[0x24BDCF7F8]();
}

uint64_t sub_2487B545C()
{
  return MEMORY[0x24BDCF800]();
}

uint64_t sub_2487B5468()
{
  return MEMORY[0x24BDCF820]();
}

uint64_t sub_2487B5474()
{
  return MEMORY[0x24BDCF838]();
}

uint64_t sub_2487B5480()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2487B548C()
{
  return MEMORY[0x24BEE06F0]();
}

uint64_t sub_2487B5498()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2487B54A4()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_2487B54B0()
{
  return MEMORY[0x24BEE07F8]();
}

uint64_t sub_2487B54BC()
{
  return MEMORY[0x24BEE0800]();
}

uint64_t sub_2487B54C8()
{
  return MEMORY[0x24BEE0808]();
}

uint64_t sub_2487B54D4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2487B54E0()
{
  return MEMORY[0x24BDCF868]();
}

uint64_t sub_2487B54EC()
{
  return MEMORY[0x24BDCF998]();
}

uint64_t sub_2487B54F8()
{
  return MEMORY[0x24BDCF9C0]();
}

uint64_t sub_2487B5504()
{
  return MEMORY[0x24BDCF9E8]();
}

uint64_t sub_2487B5510()
{
  return MEMORY[0x24BDCFA00]();
}

uint64_t sub_2487B551C()
{
  return MEMORY[0x24BDCFA10]();
}

uint64_t sub_2487B5528()
{
  return MEMORY[0x24BDCFA20]();
}

uint64_t sub_2487B5534()
{
  return MEMORY[0x24BDCFA30]();
}

uint64_t sub_2487B5540()
{
  return MEMORY[0x24BDCFA70]();
}

uint64_t sub_2487B554C()
{
  return MEMORY[0x24BDCFAD0]();
}

uint64_t sub_2487B5558()
{
  return MEMORY[0x24BDCFAF0]();
}

uint64_t sub_2487B5564()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2487B5570()
{
  return MEMORY[0x24BEE0AD8]();
}

uint64_t sub_2487B557C()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2487B5588()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_2487B5594()
{
  return MEMORY[0x24BEE0B70]();
}

uint64_t sub_2487B55A0()
{
  return MEMORY[0x24BEE0B88]();
}

uint64_t sub_2487B55AC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2487B55B8()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_2487B55C4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2487B55D0()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_2487B55DC()
{
  return MEMORY[0x24BEE0D58]();
}

uint64_t sub_2487B55E8()
{
  return MEMORY[0x24BEE0D98]();
}

uint64_t sub_2487B55F4()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_2487B5600()
{
  return MEMORY[0x24BDCFB68]();
}

uint64_t sub_2487B560C()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_2487B5618()
{
  return MEMORY[0x24BEE0EA0]();
}

uint64_t sub_2487B5624()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_2487B5630()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_2487B563C()
{
  return MEMORY[0x24BEE1038]();
}

uint64_t sub_2487B5648()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_2487B5654()
{
  return MEMORY[0x24BEE10B8]();
}

uint64_t sub_2487B5660()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2487B566C()
{
  return MEMORY[0x24BDCFBA0]();
}

uint64_t sub_2487B5678()
{
  return MEMORY[0x24BDCFBB8]();
}

uint64_t sub_2487B5684()
{
  return MEMORY[0x24BDCFBD0]();
}

uint64_t sub_2487B5690()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_2487B569C()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_2487B56A8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_2487B56B4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_2487B56C0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_2487B56CC()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_2487B56D8()
{
  return MEMORY[0x24BDCFC10]();
}

uint64_t sub_2487B56E4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2487B56F0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2487B56FC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2487B5708()
{
  return MEMORY[0x24BDCFC50]();
}

uint64_t sub_2487B5714()
{
  return MEMORY[0x24BEE13A8]();
}

uint64_t sub_2487B5720()
{
  return MEMORY[0x24BDCFC88]();
}

uint64_t sub_2487B572C()
{
  return MEMORY[0x24BEE14C8]();
}

uint64_t sub_2487B5738()
{
  return MEMORY[0x24BDCFCB8]();
}

uint64_t sub_2487B5744()
{
  return MEMORY[0x24BDCFCD8]();
}

uint64_t sub_2487B5750()
{
  return MEMORY[0x24BDCFCE0]();
}

uint64_t sub_2487B575C()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_2487B5768()
{
  return MEMORY[0x24BDCFD20]();
}

uint64_t sub_2487B5774()
{
  return MEMORY[0x24BEE1980]();
}

uint64_t sub_2487B5780()
{
  return MEMORY[0x24BEE7660]();
}

uint64_t sub_2487B578C()
{
  return MEMORY[0x24BDCFDD0]();
}

uint64_t sub_2487B5798()
{
  return MEMORY[0x24BDCFE20]();
}

uint64_t sub_2487B57A4()
{
  return MEMORY[0x24BDCFE80]();
}

uint64_t sub_2487B57B0()
{
  return MEMORY[0x24BDCFF48]();
}

uint64_t sub_2487B57BC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_2487B57C8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_2487B57D4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_2487B57E0()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_2487B57EC()
{
  return MEMORY[0x24BDCFF80]();
}

uint64_t sub_2487B57F8()
{
  return MEMORY[0x24BDCFFA8]();
}

uint64_t sub_2487B5804()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_2487B5810()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_2487B581C()
{
  return MEMORY[0x24BEE56F0]();
}

uint64_t sub_2487B5828()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_2487B5834()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_2487B5840()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_2487B584C()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_2487B5858()
{
  return MEMORY[0x24BEE7940]();
}

uint64_t sub_2487B5864()
{
  return MEMORY[0x24BEE7948]();
}

uint64_t sub_2487B5870()
{
  return MEMORY[0x24BDD0080]();
}

uint64_t sub_2487B587C()
{
  return MEMORY[0x24BDD00A0]();
}

uint64_t sub_2487B5888()
{
  return MEMORY[0x24BEE5920]();
}

uint64_t sub_2487B5894()
{
  return MEMORY[0x24BEE5928]();
}

uint64_t sub_2487B58A0()
{
  return MEMORY[0x24BDBB360]();
}

uint64_t sub_2487B58AC()
{
  return MEMORY[0x24BDBB388]();
}

uint64_t sub_2487B58B8()
{
  return MEMORY[0x24BDBB390]();
}

uint64_t sub_2487B58C4()
{
  return MEMORY[0x24BEDF468]();
}

uint64_t sub_2487B58D0()
{
  return MEMORY[0x24BEDF488]();
}

uint64_t sub_2487B58DC()
{
  return MEMORY[0x24BDD0168]();
}

uint64_t sub_2487B58E8()
{
  return MEMORY[0x24BDD01E8]();
}

uint64_t sub_2487B58F4()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_2487B5900()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_2487B590C()
{
  return MEMORY[0x24BEE5BC8]();
}

uint64_t sub_2487B5918()
{
  return MEMORY[0x24BEE7968]();
}

uint64_t sub_2487B5924()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_2487B5930()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_2487B593C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_2487B5948()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_2487B5954()
{
  return MEMORY[0x24BDD04C0]();
}

uint64_t sub_2487B5960()
{
  return MEMORY[0x24BDD0500]();
}

uint64_t sub_2487B596C()
{
  return MEMORY[0x24BDD0528]();
}

uint64_t sub_2487B5978()
{
  return MEMORY[0x24BDD0540]();
}

uint64_t sub_2487B5984()
{
  return MEMORY[0x24BDD0560]();
}

uint64_t sub_2487B5990()
{
  return MEMORY[0x24BDD0598]();
}

uint64_t sub_2487B599C()
{
  return MEMORY[0x24BDD05C0]();
}

uint64_t sub_2487B59A8()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2487B59B4()
{
  return MEMORY[0x24BEE2200]();
}

uint64_t sub_2487B59C0()
{
  return MEMORY[0x24BEE2210]();
}

uint64_t sub_2487B59CC()
{
  return MEMORY[0x24BEE2238]();
}

uint64_t sub_2487B59D8()
{
  return MEMORY[0x24BEE2270]();
}

uint64_t sub_2487B59E4()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_2487B59F0()
{
  return MEMORY[0x24BEE22B8]();
}

uint64_t sub_2487B59FC()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2487B5A08()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2487B5A14()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_2487B5A20()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2487B5A2C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2487B5A38()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_2487B5A44()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2487B5A50()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_2487B5A5C()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_2487B5A68()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_2487B5A74()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2487B5A80()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2487B5A8C()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_2487B5A98()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_2487B5AA4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_2487B5AB0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_2487B5ABC()
{
  return MEMORY[0x24BEE2578]();
}

uint64_t sub_2487B5AC8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_2487B5AD4()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_2487B5AE0()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_2487B5AEC()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_2487B5AF8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_2487B5B04()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_2487B5B10()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_2487B5B1C()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2487B5B28()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2487B5B34()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2487B5B40()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2487B5B4C()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_2487B5B58()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_2487B5B64()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_2487B5B70()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_2487B5B7C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_2487B5B88()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2487B5B94()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_2487B5BA0()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_2487B5BAC()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2487B5BB8()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_2487B5BC4()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_2487B5BD0()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_2487B5BDC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2487B5BE8()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2487B5BF4()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2487B5C00()
{
  return MEMORY[0x24BEE3360]();
}

uint64_t sub_2487B5C0C()
{
  return MEMORY[0x24BEE3368]();
}

uint64_t sub_2487B5C18()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_2487B5C24()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2487B5C30()
{
  return MEMORY[0x24BEE33B8]();
}

uint64_t sub_2487B5C3C()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_2487B5C48()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_2487B5C54()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_2487B5C60()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_2487B5C6C()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_2487B5C78()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_2487B5C84()
{
  return MEMORY[0x24BEE34B0]();
}

uint64_t sub_2487B5C90()
{
  return MEMORY[0x24BEE34B8]();
}

uint64_t sub_2487B5C9C()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_2487B5CA8()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_2487B5CB4()
{
  return MEMORY[0x24BEE3508]();
}

uint64_t sub_2487B5CC0()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_2487B5CCC()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2487B5CD8()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_2487B5CE4()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2487B5CF0()
{
  return MEMORY[0x24BEE3D50]();
}

uint64_t sub_2487B5CFC()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_2487B5D08()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2487B5D14()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2487B5D20()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2487B5D2C()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2487B5D38()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2487B5D44()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2487B5D50()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_2487B5D5C()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2487B5D68()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2487B5D74()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_2487B5D80()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_2487B5D8C()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_2487B5D98()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_2487B5DA4()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_2487B5DB0()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_2487B5DBC()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_2487B5DC8()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_2487B5DD4()
{
  return MEMORY[0x24BEE4A18]();
}

uint64_t sub_2487B5DE0()
{
  return MEMORY[0x24BEE4A98]();
}

uint64_t AXDeviceGetType()
{
  return MEMORY[0x24BDFDFC0]();
}

uint64_t AXDeviceSupportsVoiceBankingSpeech()
{
  return MEMORY[0x24BDFE038]();
}

uint64_t AXDeviceSupportsVoiceBankingTraining()
{
  return MEMORY[0x24BDFE040]();
}

uint64_t AXLogTemp()
{
  return MEMORY[0x24BDFE1C0]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x24BDC0490](time);
  return result;
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

uint64_t MobileGestalt_copy_computerName_obj()
{
  return MEMORY[0x24BED84F0]();
}

uint64_t MobileGestalt_copy_hwModelStr_obj()
{
  return MEMORY[0x24BED8518]();
}

uint64_t MobileGestalt_copy_uniqueDeviceID_obj()
{
  return MEMORY[0x24BED8560]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

uint64_t MobileGestalt_get_wapiCapability()
{
  return MEMORY[0x24BED8680]();
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x24BEB3770]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x24BEB3780]();
}

uint64_t TCCAccessResetForBundleId()
{
  return MEMORY[0x24BEB37D0]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x24BEB37F0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int clonefile(const char *a1, const char *a2, uint32_t a3)
{
  return MEMORY[0x24BDAD9C8](a1, a2, *(_QWORD *)&a3);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

float log10f(float a1)
{
  float result;

  MEMORY[0x24BDAEAB8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x24BDAF4E0]();
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x24BDAF690](a1, a2);
  return result;
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x24BEE4BA8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x24BEE4BB0]();
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x24BEE4C88]();
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

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeLayout()
{
  return MEMORY[0x24BEE4DD8]();
}

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x24BEE4E68]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
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

uint64_t swift_projectBox()
{
  return MEMORY[0x24BEE4ED0]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
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

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x24BEE4F68]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x24BDB31A0](__Log2n, *(_QWORD *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
  MEMORY[0x24BDB31A8](__C, __IC, __Z, __IZ, __N);
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
  MEMORY[0x24BDB31C0](__setup);
}

void vDSP_fft_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
  MEMORY[0x24BDB31F8](__Setup, __C, __IC, __Log2N, *(_QWORD *)&__Direction);
}

void vDSP_hann_window(float *__C, vDSP_Length __N, int __Flag)
{
  MEMORY[0x24BDB3208](__C, __N, *(_QWORD *)&__Flag);
}

void vDSP_meamgv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
  MEMORY[0x24BDB3240](__A, __IA, __C, __N);
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB3430](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB34F0](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x24BDB35C0](__A, __IA, __C, __IC, __N);
}

void vvsqrtf(float *a1, const float *a2, const int *a3)
{
  MEMORY[0x24BDB3B90](a1, a2, a3);
}

