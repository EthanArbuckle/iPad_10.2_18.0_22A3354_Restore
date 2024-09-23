ValueMetadata *type metadata accessor for InsertTextBridge_UIKit()
{
  return &type metadata for InsertTextBridge_UIKit;
}

uint64_t sub_2494CCEDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_257866EE0 + dword_257866EE0);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2494CCF48;
  return v7(a1, a2);
}

uint64_t sub_2494CCF48()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2494CCF90(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_2494CCFA8()
{
  uint64_t v0;

  sub_2494DC9E4();
  *(_QWORD *)(v0 + 32) = sub_2494DC9D8();
  sub_2494DC9CC();
  return swift_task_switch();
}

id sub_2494CD010()
{
  uint64_t v0;
  id result;
  void *v2;
  id v3;
  void *v4;
  _BYTE *v5;

  swift_release();
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_inputDelegate);

    if (v3)
    {
      v4 = (void *)sub_2494DC99C();
      objc_msgSend(v3, sel_insertText_, v4);

    }
    else
    {
      sub_2494CD0F8();
      swift_allocError();
      *v5 = 1;
      swift_willThrow();
    }
    return (id)(*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_2494CD0F8()
{
  unint64_t result;

  result = qword_257866EE8;
  if (!qword_257866EE8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DDEE0, &type metadata for InsertTextBridge.BridgeError);
    atomic_store(result, (unint64_t *)&qword_257866EE8);
  }
  return result;
}

uint64_t sub_2494CD13C()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for WritingTools_UIKit()
{
  return objc_opt_self();
}

unint64_t sub_2494CD184()
{
  unint64_t result;

  result = qword_257866FB8;
  if (!qword_257866FB8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DCEA0, &type metadata for RunIntelligenceCommandResultEntity);
    atomic_store(result, (unint64_t *)&qword_257866FB8);
  }
  return result;
}

uint64_t sub_2494CD1C8()
{
  uint64_t v0;

  v0 = sub_2494DC7F8();
  __swift_allocate_value_buffer(v0, qword_257867708);
  __swift_project_value_buffer(v0, (uint64_t)qword_257867708);
  return sub_2494DC7EC();
}

unint64_t sub_2494CD230()
{
  unint64_t result;

  result = qword_257866FC0;
  if (!qword_257866FC0)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DCEF8, &type metadata for RunIntelligenceCommandResultEntity);
    atomic_store(result, (unint64_t *)&qword_257866FC0);
  }
  return result;
}

unint64_t sub_2494CD278()
{
  unint64_t result;

  result = qword_257866FC8;
  if (!qword_257866FC8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DCF30, &type metadata for RunIntelligenceCommandResultEntity);
    atomic_store(result, (unint64_t *)&qword_257866FC8);
  }
  return result;
}

unint64_t sub_2494CD2C0()
{
  unint64_t result;

  result = qword_257866FD0;
  if (!qword_257866FD0)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DCF60, &type metadata for RunIntelligenceCommandResultEntity);
    atomic_store(result, (unint64_t *)&qword_257866FD0);
  }
  return result;
}

uint64_t sub_2494CD304()
{
  return sub_2494CD5FC(&qword_257866FD8, &qword_257866FE0, MEMORY[0x24BDB4B08]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495B1EC0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2494CD374()
{
  return MEMORY[0x24BDB65D8];
}

uint64_t sub_2494CD380()
{
  sub_2494CD8E4();
  return sub_2494DC540();
}

unint64_t sub_2494CD3BC()
{
  unint64_t result;

  result = qword_257866FE8;
  if (!qword_257866FE8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DCF98, &type metadata for RunIntelligenceCommandResultEntity);
    atomic_store(result, (unint64_t *)&qword_257866FE8);
  }
  return result;
}

unint64_t sub_2494CD404()
{
  unint64_t result;

  result = qword_257866FF0;
  if (!qword_257866FF0)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DCFC0, &type metadata for RunIntelligenceCommandResultEntity);
    atomic_store(result, (unint64_t *)&qword_257866FF0);
  }
  return result;
}

unint64_t sub_2494CD44C()
{
  unint64_t result;

  result = qword_257866FF8;
  if (!qword_257866FF8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DCFE8, &type metadata for RunIntelligenceCommandResultEntity);
    atomic_store(result, (unint64_t *)&qword_257866FF8);
  }
  return result;
}

unint64_t sub_2494CD494()
{
  unint64_t result;

  result = qword_257867000;
  if (!qword_257867000)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD040, &type metadata for RunIntelligenceCommandResultEntity);
    atomic_store(result, (unint64_t *)&qword_257867000);
  }
  return result;
}

unint64_t sub_2494CD4DC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257867008;
  if (!qword_257867008)
  {
    v1 = sub_2494DC834();
    result = MEMORY[0x2495B1ECC](MEMORY[0x24BDCEA88], v1);
    atomic_store(result, (unint64_t *)&qword_257867008);
  }
  return result;
}

uint64_t sub_2494CD524()
{
  sub_2494CD8E4();
  return sub_2494DC54C();
}

uint64_t sub_2494CD560@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257866E70 != -1)
    swift_once();
  v2 = sub_2494DC7F8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257867708);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2494CD5D0()
{
  return sub_2494CD5FC(&qword_257867010, &qword_257867018, MEMORY[0x24BDB6250]);
}

uint64_t sub_2494CD5FC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2495B1ECC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2494CD63C()
{
  sub_2494CD184();
  return sub_2494DC564();
}

unint64_t sub_2494CD678()
{
  unint64_t result;

  result = qword_257867020;
  if (!qword_257867020)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD070, &type metadata for RunIntelligenceCommandResultEntity);
    atomic_store(result, (unint64_t *)&qword_257867020);
  }
  return result;
}

uint64_t sub_2494CD6BC()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257867028);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v8 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  MEMORY[0x24BDAC7A8]();
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2494DC828();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8]();
  sub_2494DC810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = sub_2494DC750();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v1, 1, 1, v6);
  return sub_2494DC75C();
}

uint64_t sub_2494CD804()
{
  sub_2494CD494();
  return sub_2494DC804();
}

ValueMetadata *type metadata accessor for RunIntelligenceCommandResultEntity()
{
  return &type metadata for RunIntelligenceCommandResultEntity;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2495B1EB4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
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

unint64_t sub_2494CD8E4()
{
  unint64_t result;

  result = qword_257867038;
  if (!qword_257867038)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DCE70, &type metadata for RunIntelligenceCommandResultEntity);
    atomic_store(result, (unint64_t *)&qword_257867038);
  }
  return result;
}

uint64_t sub_2494CD928()
{
  return sub_2494CDEFC(qword_257867040, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntityID, (uint64_t)&unk_2494DD160);
}

uint64_t type metadata accessor for IntelligenceCommandEntityID()
{
  uint64_t result;

  result = qword_2578670A0;
  if (!qword_2578670A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2494CD990()
{
  sub_2494DCAE0();
  sub_2494DC84C();
  sub_2494CDEFC(&qword_2578670E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEBB6E8], MEMORY[0x24BEBB700]);
  sub_2494DC93C();
  return sub_2494DCAF8();
}

uint64_t sub_2494CD9FC()
{
  sub_2494DC84C();
  sub_2494CDEFC(&qword_2578670E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEBB6E8], MEMORY[0x24BEBB700]);
  return sub_2494DC93C();
}

uint64_t sub_2494CDA54()
{
  sub_2494DCAE0();
  sub_2494DC84C();
  sub_2494CDEFC(&qword_2578670E8, (uint64_t (*)(uint64_t))MEMORY[0x24BEBB6E8], MEMORY[0x24BEBB700]);
  sub_2494DC93C();
  return sub_2494DCAF8();
}

uint64_t sub_2494CDABC()
{
  sub_2494DC84C();
  sub_2494CDEFC(&qword_2578670E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBB6E8], MEMORY[0x24BEBB718]);
  return sub_2494DCA74();
}

uint64_t sub_2494CDB04@<X0>(uint64_t a1@<X2>, char *a2@<X8>)
{
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  uint64_t v13;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2578670D8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2494DC84C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_2494DC858();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_2494CDEBC((uint64_t)v5);
    v10 = 1;
  }
  else
  {
    v11 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    v11(v9, v5, v6);
    v11(a2, v9, v6);
    v10 = 0;
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 56))(a2, v10, 1, a1);
}

uint64_t sub_2494CDC40(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2494DC84C();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_2494CDC7C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_2494DC84C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_2494CDCB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2494DC84C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_2494CDCF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2494DC84C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_2494CDD38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2494DC84C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_2494CDD7C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2494DC84C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_2494CDDC0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2494CDDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2494DC84C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t sub_2494CDE08()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2494CDE14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_2494DC84C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_2494CDE54()
{
  uint64_t result;
  unint64_t v1;

  result = sub_2494DC84C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_2494CDEBC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578670D8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2494CDEFC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2495B1ECC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2494CDF40()
{
  unint64_t result;

  result = qword_2578670F0;
  if (!qword_2578670F0)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD258, &type metadata for IntelligenceCommandQuery);
    atomic_store(result, (unint64_t *)&qword_2578670F0);
  }
  return result;
}

unint64_t sub_2494CDF88()
{
  unint64_t result;

  result = qword_2578670F8;
  if (!qword_2578670F8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD2B8, &type metadata for IntelligenceCommandQuery);
    atomic_store(result, (unint64_t *)&qword_2578670F8);
  }
  return result;
}

uint64_t sub_2494CDFCC()
{
  return sub_2494CE2EC(qword_257867100, (uint64_t)&unk_2494DD670);
}

uint64_t sub_2494CDFF0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2494CE008()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_257866EA8 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_2494CE084;
  return sub_2494D5C64(*(_QWORD *)(v0 + 16));
}

uint64_t sub_2494CE084(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_2494CE0D8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2494CE0F0()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 16) = MEMORY[0x24BEE4AF8];
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2494CE110()
{
  unint64_t result;

  result = qword_257867118;
  if (!qword_257867118)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD1D0, &type metadata for IntelligenceCommandQuery);
    atomic_store(result, (unint64_t *)&qword_257867118);
  }
  return result;
}

uint64_t sub_2494CE154(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = a3;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2494CE170()
{
  uint64_t *v0;
  _QWORD *v1;

  if (qword_257866EA8 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  v0[5] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_2494CE1EC;
  return sub_2494D6398(v0[3], v0[4]);
}

uint64_t sub_2494CE1EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = *v2;
  swift_task_dealloc();
  if (v1)
    return (*(uint64_t (**)(void))(v5 + 8))();
  *(_QWORD *)(v4 + 48) = a1;
  return swift_task_switch();
}

uint64_t sub_2494CE268()
{
  uint64_t v0;

  **(_QWORD **)(v0 + 16) = *(_QWORD *)(v0 + 48);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2494CE284()
{
  unint64_t result;

  result = qword_257867128;
  if (!qword_257867128)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD2E0, &type metadata for IntelligenceCommandQuery);
    atomic_store(result, (unint64_t *)&qword_257867128);
  }
  return result;
}

uint64_t sub_2494CE2C8()
{
  return sub_2494CE2EC((unint64_t *)&qword_257867130, (uint64_t)&unk_2494DD7E0);
}

uint64_t sub_2494CE2EC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = type metadata accessor for IntelligenceCommandEntity();
    result = MEMORY[0x2495B1ECC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2494CE330()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_257867138;
  if (!qword_257867138)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_257867140);
    v2 = sub_2494CE2EC((unint64_t *)&qword_257867130, (uint64_t)&unk_2494DD7E0);
    result = MEMORY[0x2495B1ECC](MEMORY[0x24BDB6638], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_257867138);
  }
  return result;
}

uint64_t sub_2494CE3A4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_2494CE110();
  *v1 = v0;
  v1[1] = sub_2494CCF48;
  return sub_2494DC5B8();
}

uint64_t sub_2494CE410()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2494CCF48;
  return sub_2494DC774();
}

ValueMetadata *type metadata accessor for IntelligenceCommandQuery()
{
  return &type metadata for IntelligenceCommandQuery;
}

unint64_t sub_2494CE494()
{
  unint64_t result;

  result = qword_257867158;
  if (!qword_257867158)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD390, &type metadata for RunIntelligenceCommandForKey);
    atomic_store(result, (unint64_t *)&qword_257867158);
  }
  return result;
}

uint64_t sub_2494CE4D8()
{
  uint64_t v0;

  v0 = sub_2494DC828();
  __swift_allocate_value_buffer(v0, qword_257867720);
  __swift_project_value_buffer(v0, (uint64_t)qword_257867720);
  return sub_2494DC810();
}

uint64_t sub_2494CE538()
{
  return sub_2494DC63C();
}

uint64_t sub_2494CE558()
{
  return sub_2494DC63C();
}

uint64_t sub_2494CE578()
{
  return sub_2494DC63C();
}

uint64_t sub_2494CE598@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v14 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v13 - v5;
  v7 = sub_2494DC828();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  sub_2494DC810();
  sub_2494DC810();
  v9 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56);
  v9(v6, 0, 1, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671E8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2494DD340;
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  v9(v4, 0, 1, v7);
  v10 = v14;
  sub_2494DC738();
  v11 = sub_2494DC72C();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
}

uint64_t sub_2494CE830()
{
  uint64_t v0;
  uint64_t v1;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671F0);
  MEMORY[0x24BDAC7A8](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671F8);
  MEMORY[0x24BDAC7A8](v1);
  sub_2494CF9E4();
  sub_2494DC7B0();
  sub_2494DC7A4();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867200);
  sub_2494DC798();
  swift_release();
  sub_2494DC7A4();
  swift_getKeyPath();
  sub_2494DC798();
  swift_release();
  sub_2494DC7A4();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867208);
  sub_2494DC798();
  swift_release();
  sub_2494DC7A4();
  sub_2494DC7BC();
  return sub_2494DC78C();
}

uint64_t sub_2494CEA1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[17] = a3;
  v4[18] = a4;
  v4[16] = a1;
  v5 = type metadata accessor for IntelligenceCommandEntity();
  v4[19] = v5;
  v4[20] = *(_QWORD *)(v5 - 8);
  v4[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578670D8);
  v4[22] = swift_task_alloc();
  v6 = sub_2494DC84C();
  v4[23] = v6;
  v4[24] = *(_QWORD *)(v6 - 8);
  v4[25] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671C8);
  v4[26] = swift_task_alloc();
  v7 = type metadata accessor for IntelligenceCommandEntityID();
  v4[27] = v7;
  v4[28] = *(_QWORD *)(v7 - 8);
  v4[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671D0);
  v4[30] = swift_task_alloc();
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  v4[33] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2494CEB64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t (*v38)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 152);
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 160) + 56);
  *(_QWORD *)(v0 + 272) = v3;
  v3(v1, 1, 1, v2);
  sub_2494DC624();
  if (*(_QWORD *)(v0 + 104))
  {
    v4 = *(_QWORD *)(v0 + 184);
    v5 = *(_QWORD *)(v0 + 192);
    v6 = *(_QWORD *)(v0 + 176);
    swift_bridgeObjectRetain();
    sub_2494DC858();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4) == 1)
    {
      sub_2494D033C(*(_QWORD *)(v0 + 176), &qword_2578670D8);
      v7 = 1;
    }
    else
    {
      v13 = *(_QWORD *)(v0 + 200);
      v12 = *(_QWORD *)(v0 + 208);
      v14 = *(_QWORD *)(v0 + 184);
      v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 192) + 32);
      v15(v13, *(_QWORD *)(v0 + 176), v14);
      v15(v12, v13, v14);
      v7 = 0;
    }
    v17 = (uint64_t *)(v0 + 208);
    v16 = *(_QWORD *)(v0 + 208);
    v18 = *(_QWORD *)(v0 + 216);
    v19 = *(_QWORD *)(v0 + 224);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v16, v7, 1, v18);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v16, 1, v18) == 1)
    {
      v20 = &qword_2578671C8;
LABEL_11:
      v21 = *(_QWORD *)(v0 + 264);
      sub_2494D033C(*v17, v20);
      sub_2494D021C();
      swift_allocError();
      *v22 = 2;
      swift_willThrow();
      sub_2494D033C(v21, &qword_2578671D0);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(void))(v0 + 8))();
    }
    sub_2494D0378(*(_QWORD *)(v0 + 208), *(_QWORD *)(v0 + 232), (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntityID);
    if (qword_257866EA8 != -1)
      swift_once();
    v24 = *(_QWORD *)(v0 + 224);
    v23 = *(_QWORD *)(v0 + 232);
    sub_2494D0260((uint64_t)&unk_2578677C0, v0 + 56);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2578671E0);
    v25 = *(_DWORD *)(v24 + 80);
    *(_DWORD *)(v0 + 360) = v25;
    v26 = (v25 + 32) & ~(unint64_t)v25;
    v27 = swift_allocObject();
    *(_QWORD *)(v0 + 280) = v27;
    *(_OWORD *)(v27 + 16) = xmmword_2494DD350;
    sub_2494D03BC(v23, v27 + v26, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntityID);
    v28 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 288) = v28;
    *v28 = v0;
    v28[1] = sub_2494CEFE8;
    return sub_2494D5C64(v27);
  }
  else
  {
    sub_2494DC624();
    v9 = *(_QWORD *)(v0 + 112);
    v8 = *(_QWORD *)(v0 + 120);
    *(_QWORD *)(v0 + 312) = v8;
    if (v8)
    {
      if (qword_257866EA8 != -1)
        swift_once();
      v10 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 320) = v10;
      *v10 = v0;
      v10[1] = sub_2494CF334;
      return sub_2494D6398(v9, v8);
    }
    else
    {
      v17 = (uint64_t *)(v0 + 240);
      v29 = *(_QWORD *)(v0 + 240);
      v30 = *(_QWORD *)(v0 + 152);
      v31 = *(_QWORD *)(v0 + 160);
      sub_2494D01D4(*(_QWORD *)(v0 + 264), v29);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30) == 1)
      {
        v20 = &qword_2578671D0;
        goto LABEL_11;
      }
      sub_2494D0378(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 168), (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntity);
      if (qword_257866EA8 != -1)
        swift_once();
      v32 = *(_QWORD *)(v0 + 168);
      v33 = *(_QWORD *)(v0 + 152);
      sub_2494D0260((uint64_t)&unk_2578677C0, v0 + 16);
      v34 = v32 + *(int *)(v33 + 36);
      v35 = *(_QWORD *)(v0 + 40);
      v36 = *(_QWORD *)(v0 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v35);
      v38 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v36 + 8) + *(_QWORD *)(v36 + 8));
      v37 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 344) = v37;
      *v37 = v0;
      v37[1] = sub_2494CF61C;
      return v38(v34, v35, v36);
    }
  }
}

uint64_t sub_2494CEFE8(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *v2;
  v4 = *v2 + 56;
  *(_QWORD *)(v3 + 296) = a1;
  *(_QWORD *)(v3 + 304) = v1;
  swift_task_dealloc();
  sub_2494D02C0(v4);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  return swift_task_switch();
}

uint64_t sub_2494CF0B0()
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
  _BYTE *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 296);
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = *(unsigned __int8 *)(*(_QWORD *)(v0 + 160) + 80);
    sub_2494D03BC(v1 + ((v2 + 32) & ~v2), *(_QWORD *)(v0 + 256), (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntity);
    v3 = 0;
  }
  else
  {
    v3 = 1;
  }
  v4 = *(_QWORD *)(v0 + 232);
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v0 + 272))(*(_QWORD *)(v0 + 256), v3, 1, *(_QWORD *)(v0 + 152));
  swift_bridgeObjectRelease();
  sub_2494D0400(v4, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntityID);
  v6 = *(_QWORD *)(v0 + 256);
  v5 = *(_QWORD *)(v0 + 264);
  sub_2494D033C(v5, &qword_2578671D0);
  sub_2494D02F4(v6, v5);
  v7 = *(_QWORD *)(v0 + 240);
  v8 = *(_QWORD *)(v0 + 152);
  v9 = *(_QWORD *)(v0 + 160);
  sub_2494D01D4(*(_QWORD *)(v0 + 264), v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    v10 = *(_QWORD *)(v0 + 264);
    sub_2494D033C(*(_QWORD *)(v0 + 240), &qword_2578671D0);
    sub_2494D021C();
    swift_allocError();
    *v11 = 2;
    swift_willThrow();
    sub_2494D033C(v10, &qword_2578671D0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    sub_2494D0378(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 168), (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntity);
    if (qword_257866EA8 != -1)
      swift_once();
    v13 = *(_QWORD *)(v0 + 168);
    v14 = *(_QWORD *)(v0 + 152);
    sub_2494D0260((uint64_t)&unk_2578677C0, v0 + 16);
    v15 = v13 + *(int *)(v14 + 36);
    v16 = *(_QWORD *)(v0 + 40);
    v17 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v16);
    v19 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v17 + 8) + *(_QWORD *)(v17 + 8));
    v18 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 344) = v18;
    *v18 = v0;
    v18[1] = sub_2494CF61C;
    return v19(v15, v16, v17);
  }
}

uint64_t sub_2494CF334(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 328) = a1;
  *(_QWORD *)(v3 + 336) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_2494CF3A8()
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
  _BYTE *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t (*v18)(uint64_t, uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 328);
  if (*(_QWORD *)(v1 + 16))
  {
    v2 = *(unsigned __int8 *)(*(_QWORD *)(v0 + 160) + 80);
    sub_2494D03BC(v1 + ((v2 + 32) & ~v2), *(_QWORD *)(v0 + 248), (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntity);
    v3 = 0;
  }
  else
  {
    v3 = 1;
  }
  (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(v0 + 272))(*(_QWORD *)(v0 + 248), v3, 1, *(_QWORD *)(v0 + 152));
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 264);
  sub_2494D033C(v5, &qword_2578671D0);
  sub_2494D02F4(v4, v5);
  v6 = *(_QWORD *)(v0 + 240);
  v7 = *(_QWORD *)(v0 + 152);
  v8 = *(_QWORD *)(v0 + 160);
  sub_2494D01D4(*(_QWORD *)(v0 + 264), v6);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    v9 = *(_QWORD *)(v0 + 264);
    sub_2494D033C(*(_QWORD *)(v0 + 240), &qword_2578671D0);
    sub_2494D021C();
    swift_allocError();
    *v10 = 2;
    swift_willThrow();
    sub_2494D033C(v9, &qword_2578671D0);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    sub_2494D0378(*(_QWORD *)(v0 + 240), *(_QWORD *)(v0 + 168), (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntity);
    if (qword_257866EA8 != -1)
      swift_once();
    v12 = *(_QWORD *)(v0 + 168);
    v13 = *(_QWORD *)(v0 + 152);
    sub_2494D0260((uint64_t)&unk_2578677C0, v0 + 16);
    v14 = v12 + *(int *)(v13 + 36);
    v15 = *(_QWORD *)(v0 + 40);
    v16 = *(_QWORD *)(v0 + 48);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v15);
    v18 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v16 + 8) + *(_QWORD *)(v16 + 8));
    v17 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 344) = v17;
    *v17 = v0;
    v17[1] = sub_2494CF61C;
    return v18(v14, v15, v16);
  }
}

uint64_t sub_2494CF61C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 352) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2494CF680()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 168);
  sub_2494D02C0(v0 + 16);
  sub_2494CD44C();
  sub_2494DC5DC();
  sub_2494D0400(v2, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntity);
  sub_2494D033C(v1, &qword_2578671D0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494CF770()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 168);
  sub_2494D02C0(v0 + 16);
  sub_2494D0400(v2, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntity);
  sub_2494D033C(v1, &qword_2578671D0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494CF844()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 264);
  sub_2494D0400(*(_QWORD *)(v0 + 232), (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntityID);
  sub_2494D033C(v1, &qword_2578671D0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494CF90C()
{
  uint64_t v0;

  sub_2494D033C(*(_QWORD *)(v0 + 264), &qword_2578671D0);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494CF9C0()
{
  return sub_2494DC624();
}

unint64_t sub_2494CF9E4()
{
  unint64_t result;

  result = qword_257867160;
  if (!qword_257867160)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD3B8, &type metadata for RunIntelligenceCommandForKey);
    atomic_store(result, (unint64_t *)&qword_257867160);
  }
  return result;
}

unint64_t sub_2494CFA2C()
{
  unint64_t result;

  result = qword_257867168;
  if (!qword_257867168)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD448, &type metadata for RunIntelligenceCommandForKey);
    atomic_store(result, (unint64_t *)&qword_257867168);
  }
  return result;
}

unint64_t sub_2494CFA74()
{
  unint64_t result;

  result = qword_257867170;
  if (!qword_257867170)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD470, &type metadata for RunIntelligenceCommandForKey);
    atomic_store(result, (unint64_t *)&qword_257867170);
  }
  return result;
}

uint64_t sub_2494CFAB8()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_2494CFADC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2494CFAEC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257866E78 != -1)
    swift_once();
  v2 = sub_2494DC828();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257867720);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2494CFB70(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;

  v5 = *(_QWORD *)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v6;
  *v6 = v2;
  v6[1] = sub_2494CCF48;
  return sub_2494CEA1C(a1, v7, v5, v4);
}

uint64_t sub_2494CFBD4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = sub_2494CFE68();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_2494CFBFC()
{
  sub_2494CF9E4();
  return sub_2494DC5AC();
}

uint64_t destroy for RunIntelligenceCommandForKey()
{
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *_s21UIIntelligenceIntents28RunIntelligenceCommandForKeyVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  sub_2494DC684();
  sub_2494DC684();
  sub_2494DC684();
  return a1;
}

_QWORD *assignWithCopy for RunIntelligenceCommandForKey(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_2494DC684();
  swift_release();
  a1[1] = a2[1];
  sub_2494DC684();
  swift_release();
  a1[2] = a2[2];
  sub_2494DC684();
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

uint64_t assignWithTake for RunIntelligenceCommandForKey(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RunIntelligenceCommandForKey(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RunIntelligenceCommandForKey(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RunIntelligenceCommandForKey()
{
  return &type metadata for RunIntelligenceCommandForKey;
}

uint64_t sub_2494CFE10()
{
  return sub_2494CD5FC(&qword_257867180, &qword_257867188, MEMORY[0x24BDB5F68]);
}

uint64_t sub_2494CFE3C()
{
  return sub_2494CD5FC(&qword_257867190, &qword_257867198, MEMORY[0x24BDB5E60]);
}

uint64_t sub_2494CFE68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  void (*v15)(char *);
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v19;
  void (*v21)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  char *v28;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  uint64_t v32;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671A0);
  MEMORY[0x24BDAC7A8](v0);
  v28 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_2494DC7C8();
  v2 = *(_QWORD *)(v29 - 8);
  MEMORY[0x24BDAC7A8](v29);
  v4 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671A8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2494DC828();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671B0);
  sub_2494DC810();
  v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56);
  v24 = v11;
  v13(v10, 1, 1, v11);
  v25 = v13;
  v14 = sub_2494DC5D0();
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v22 = v14;
  v26(v7, 1, 1, v14);
  v30 = *MEMORY[0x24BDB6090];
  v15 = *(void (**)(char *))(v2 + 104);
  v15(v4);
  v27 = sub_2494DC660();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671B8);
  sub_2494DC810();
  v13(v10, 1, 1, v11);
  v16 = sub_2494DC960();
  v31 = 0;
  v32 = 0;
  v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v17 = v28;
  v21(v28, 1, 1, v16);
  v18 = v26;
  v26(v7, 1, 1, v14);
  v19 = v29;
  ((void (*)(char *, _QWORD, uint64_t))v15)(v4, v30, v29);
  v23 = sub_2494DC66C();
  sub_2494DC810();
  v25(v10, 1, 1, v24);
  v31 = 0;
  v32 = 0;
  v21(v17, 1, 1, v16);
  v18(v7, 1, 1, v22);
  ((void (*)(char *, _QWORD, uint64_t))v15)(v4, v30, v19);
  sub_2494DC66C();
  return v27;
}

uint64_t sub_2494D01D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2494D021C()
{
  unint64_t result;

  result = qword_2578671D8;
  if (!qword_2578671D8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE03C, &type metadata for IntelligenceCommandBridge.BridgeError);
    atomic_store(result, (unint64_t *)&qword_2578671D8);
  }
  return result;
}

uint64_t sub_2494D0260(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for InsertTextBridge(a2, a1);
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_2494D02C0(uint64_t a1)
{
  destroy for InsertTextBridge();
  return a1;
}

uint64_t sub_2494D02F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2494D033C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2494D0378(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_2494D03BC(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2494D0400(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2494D043C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2494DC63C();
  *a1 = result;
  return result;
}

uint64_t sub_2494D0464@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2494DC63C();
  *a1 = result;
  return result;
}

uint64_t sub_2494D048C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2494DC63C();
  *a1 = result;
  return result;
}

uint64_t sub_2494D04B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867248);
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_2494DC690();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867250);
  MEMORY[0x24BDAC7A8](v8);
  sub_2494D0C10();
  sub_2494DC6E4();
  sub_2494DC6D8();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x24BDB56D0], v4);
  sub_2494DC6C0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_2494DC6D8();
  sub_2494DC6F0();
  v9 = sub_2494DC6A8();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867258);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_2494DD350;
  *(_QWORD *)(v10 + 32) = v9;
  v11 = sub_2494DC69C();
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_2494D06B0()
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
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867228);
  v12 = *(_QWORD *)(v0 - 8);
  v13 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_2494DC690();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867230);
  MEMORY[0x24BDAC7A8](v7);
  sub_2494D0C54();
  sub_2494DC6E4();
  sub_2494DC6D8();
  swift_getKeyPath();
  sub_2494D0D04();
  sub_2494DC684();
  swift_release();
  sub_2494DC6CC();
  swift_release();
  sub_2494DC6D8();
  (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BDB56D0], v3);
  sub_2494DC6C0();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  sub_2494DC6D8();
  sub_2494DC6F0();
  v8 = sub_2494DC6A8();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v2, v13);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867240);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_2494DD350;
  *(_QWORD *)(v9 + 32) = v8;
  v10 = sub_2494DC69C();
  swift_bridgeObjectRelease();
  return v10;
}

ValueMetadata *type metadata accessor for WritingToolsAssistantIntentsProvider()
{
  return &type metadata for WritingToolsAssistantIntentsProvider;
}

uint64_t sub_2494D0938()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v0 = sub_2494DC7C8();
  v25 = *(_QWORD *)(v0 - 8);
  v26 = v0;
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671A8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_2494DC828();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v11 = sub_2494DC714();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671B0);
  sub_2494DC810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v8, 1, 1, v9);
  v15 = sub_2494DC5D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v5, 1, 1, v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v25 + 104))(v2, *MEMORY[0x24BDB6090], v26);
  v27 = sub_2494DC660();
  sub_2494D0C10();
  sub_2494DC720();
  v16 = sub_2494DC708();
  v17 = *(void (**)(char *, uint64_t))(v12 + 8);
  v17(v14, v11);
  v27 = sub_2494DBF68();
  v28 = v18;
  v29 = v19;
  sub_2494D0C54();
  sub_2494DC720();
  v20 = sub_2494DC708();
  v17(v14, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867220);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_2494DD550;
  *(_QWORD *)(v21 + 32) = v16;
  *(_QWORD *)(v21 + 40) = v20;
  v22 = sub_2494DC6FC();
  swift_bridgeObjectRelease();
  return v22;
}

unint64_t sub_2494D0C10()
{
  unint64_t result;

  result = qword_257867210;
  if (!qword_257867210)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE39C, &type metadata for WritingToolsProofreadIntent);
    atomic_store(result, (unint64_t *)&qword_257867210);
  }
  return result;
}

unint64_t sub_2494D0C54()
{
  unint64_t result;

  result = qword_257867218;
  if (!qword_257867218)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE4C8, &type metadata for WritingToolsRewriteIntent);
    atomic_store(result, (unint64_t *)&qword_257867218);
  }
  return result;
}

uint64_t sub_2494D0C98@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_2494DC624();
  *a1 = v3;
  return result;
}

uint64_t sub_2494D0CD0()
{
  return sub_2494DC630();
}

unint64_t sub_2494D0D04()
{
  unint64_t result;

  result = qword_257867238;
  if (!qword_257867238)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE734, &type metadata for RewriteType);
    atomic_store(result, (unint64_t *)&qword_257867238);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCommandBridge_UIKit()
{
  return &type metadata for IntelligenceCommandBridge_UIKit;
}

uint64_t sub_2494D0D5C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_257867270 + dword_257867270);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_2494CCF48;
  return v5(a1);
}

uint64_t sub_2494D0DBC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_2494D0DD4()
{
  _QWORD *v0;

  v0[3] = sub_2494DC924();
  v0[4] = sub_2494DC9E4();
  v0[5] = sub_2494DC9D8();
  sub_2494DC9CC();
  return swift_task_switch();
}

uint64_t sub_2494D0E4C()
{
  uint64_t v0;

  swift_release();
  *(_QWORD *)(v0 + 48) = sub_2494DC918();
  return swift_task_switch();
}

uint64_t sub_2494D0E94()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 56) = sub_2494DC9D8();
  sub_2494DC9CC();
  return swift_task_switch();
}

uint64_t sub_2494D0EF4()
{
  uint64_t v0;
  uint64_t v1;

  swift_release();
  v1 = sub_2494DC8F4();
  swift_release();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_2494D0F44(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[3] = a1;
  v2 = sub_2494DC8E8();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = swift_task_alloc();
  v3 = sub_2494DC900();
  v1[7] = v3;
  v1[8] = *(_QWORD *)(v3 - 8);
  v1[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2494D0FCC()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 80) = sub_2494DC924();
  sub_2494DC9E4();
  *(_QWORD *)(v0 + 88) = sub_2494DC9D8();
  sub_2494DC9CC();
  return swift_task_switch();
}

uint64_t sub_2494D1040()
{
  uint64_t v0;
  _QWORD *v1;

  swift_release();
  *(_QWORD *)(v0 + 96) = sub_2494DC918();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v1;
  *v1 = v0;
  v1[1] = sub_2494D10A8;
  return sub_2494DC90C();
}

uint64_t sub_2494D10A8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_release();
  return swift_task_switch();
}

uint64_t sub_2494D1114()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494D1164()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  char *v3;
  char v4;

  v1 = *(_QWORD *)(v0 + 112);
  swift_release();
  *(_QWORD *)(v0 + 16) = v1;
  MEMORY[0x2495B1E6C](v1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867278);
  if (!swift_dynamicCast())
    goto LABEL_8;
  v2 = (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 88))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
  if (v2 != *MEMORY[0x24BEBC890])
  {
    if (v2 == *MEMORY[0x24BEBC888])
    {
      MEMORY[0x2495B1E60](*(_QWORD *)(v0 + 112));
      sub_2494D021C();
      swift_allocError();
      v4 = 3;
      goto LABEL_6;
    }
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 40) + 8))(*(_QWORD *)(v0 + 48), *(_QWORD *)(v0 + 32));
LABEL_8:
    MEMORY[0x2495B1E60](*(_QWORD *)(v0 + 16));
    swift_willThrow();
    goto LABEL_9;
  }
  MEMORY[0x2495B1E60](*(_QWORD *)(v0 + 112));
  sub_2494D021C();
  swift_allocError();
  v4 = 2;
LABEL_6:
  *v3 = v4;
  swift_willThrow();
  MEMORY[0x2495B1E60](*(_QWORD *)(v0 + 16));
LABEL_9:
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494D12CC()
{
  return sub_2494CDEFC(&qword_257867280, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity, (uint64_t)&unk_2494DD6F0);
}

uint64_t type metadata accessor for IntelligenceCommandEntity()
{
  uint64_t result;

  result = qword_257867330;
  if (!qword_257867330)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_2494D1334()
{
  return sub_2494CDEFC(&qword_257867288, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity, (uint64_t)&unk_2494DD728);
}

uint64_t sub_2494D1360()
{
  return sub_2494CDEFC(&qword_257867290, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity, (uint64_t)&unk_2494DD758);
}

uint64_t sub_2494D138C()
{
  return sub_2494CDEFC(&qword_257867298, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntityID, (uint64_t)&unk_2494DD130);
}

uint64_t sub_2494D13B8()
{
  uint64_t v0;

  v0 = sub_2494DC7F8();
  __swift_allocate_value_buffer(v0, qword_257867738);
  __swift_project_value_buffer(v0, (uint64_t)qword_257867738);
  return sub_2494DC7EC();
}

uint64_t sub_2494D1418@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;

  v38 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867028);
  MEMORY[0x24BDAC7A8](v1);
  v37 = (char *)&v35 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2494DC828();
  v35 = *(_QWORD *)(v6 - 8);
  v36 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v7 = sub_2494DC990();
  MEMORY[0x24BDAC7A8](v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867390);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_2494DD350;
  sub_2494DC84C();
  sub_2494CDEFC(&qword_2578670E0, (uint64_t (*)(uint64_t))MEMORY[0x24BEBB6E8], MEMORY[0x24BEBB718]);
  *(_QWORD *)(v8 + 32) = sub_2494DCA74();
  *(_QWORD *)(v8 + 40) = v9;
  type metadata accessor for IntelligenceCommandEntity();
  sub_2494DC5F4();
  v10 = v40;
  if (v40)
  {
    v11 = v39;
    v12 = HIBYTE(v40) & 0xF;
    if ((v40 & 0x2000000000000000) == 0)
      v12 = v39 & 0xFFFFFFFFFFFFLL;
    if (v12)
    {
      v14 = *(_QWORD *)(v8 + 16);
      v13 = *(_QWORD *)(v8 + 24);
      if (v14 >= v13 >> 1)
        v8 = (uint64_t)sub_2494D25D0((char *)(v13 > 1), v14 + 1, 1, (char *)v8);
      *(_QWORD *)(v8 + 16) = v14 + 1;
      v15 = v8 + 16 * v14;
      *(_QWORD *)(v15 + 32) = v11;
      *(_QWORD *)(v15 + 40) = v10;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_2494DC5F4();
  v16 = v40;
  if (v40)
  {
    v17 = v39;
    v18 = HIBYTE(v40) & 0xF;
    if ((v40 & 0x2000000000000000) == 0)
      v18 = v39 & 0xFFFFFFFFFFFFLL;
    if (v18)
    {
      v20 = *(_QWORD *)(v8 + 16);
      v19 = *(_QWORD *)(v8 + 24);
      if (v20 >= v19 >> 1)
        v8 = (uint64_t)sub_2494D25D0((char *)(v19 > 1), v20 + 1, 1, (char *)v8);
      *(_QWORD *)(v8 + 16) = v20 + 1;
      v21 = v8 + 16 * v20;
      *(_QWORD *)(v21 + 32) = v17;
      *(_QWORD *)(v21 + 40) = v16;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_2494DC5F4();
  if (v39)
  {
    if (*(_QWORD *)(v39 + 16))
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257867398);
      sub_2494CD5FC(&qword_2578673A0, &qword_257867398, MEMORY[0x24BEE12B0]);
      v22 = sub_2494DC948();
      v24 = v23;
      swift_bridgeObjectRelease();
      v26 = *(_QWORD *)(v8 + 16);
      v25 = *(_QWORD *)(v8 + 24);
      if (v26 >= v25 >> 1)
        v8 = (uint64_t)sub_2494D25D0((char *)(v25 > 1), v26 + 1, 1, (char *)v8);
      *(_QWORD *)(v8 + 16) = v26 + 1;
      v27 = v8 + 16 * v26;
      *(_QWORD *)(v27 + 32) = v22;
      *(_QWORD *)(v27 + 40) = v24;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  sub_2494DC5F4();
  if (v39 != 2)
  {
    v39 = 0;
    v40 = 0xE000000000000000;
    sub_2494DC9B4();
    swift_bridgeObjectRelease();
    v28 = v39;
    v29 = v40;
    v31 = *(_QWORD *)(v8 + 16);
    v30 = *(_QWORD *)(v8 + 24);
    if (v31 >= v30 >> 1)
      v8 = (uint64_t)sub_2494D25D0((char *)(v30 > 1), v31 + 1, 1, (char *)v8);
    *(_QWORD *)(v8 + 16) = v31 + 1;
    v32 = v8 + 16 * v31;
    *(_QWORD *)(v32 + 32) = v28;
    *(_QWORD *)(v32 + 40) = v29;
  }
  sub_2494DC984();
  sub_2494DC978();
  v39 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867398);
  sub_2494CD5FC(&qword_2578673A0, &qword_257867398, MEMORY[0x24BEE12B0]);
  sub_2494DC948();
  swift_bridgeObjectRelease();
  sub_2494DC96C();
  swift_bridgeObjectRelease();
  sub_2494DC978();
  sub_2494DC81C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v35 + 56))(v5, 1, 1, v36);
  v33 = sub_2494DC750();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v37, 1, 1, v33);
  return sub_2494DC75C();
}

uint64_t sub_2494D1900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  char *v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  sub_2494DC828();
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (int *)type metadata accessor for IntelligenceCommandEntity();
  v7 = v6[5];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867378);
  sub_2494DC810();
  *(_QWORD *)(a2 + v7) = MEMORY[0x2495B1824](v5);
  v8 = v6[6];
  sub_2494DC810();
  *(_QWORD *)(a2 + v8) = MEMORY[0x2495B1824](v5);
  v9 = v6[7];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867380);
  sub_2494DC810();
  *(_QWORD *)(a2 + v9) = MEMORY[0x2495B1824](v5);
  v10 = v6[8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867388);
  sub_2494DC810();
  *(_QWORD *)(a2 + v10) = MEMORY[0x2495B1830](v5);
  v11 = a2 + v6[9];
  v12 = sub_2494DC8A0();
  v13 = *(_QWORD *)(v12 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v13 + 16))(v11, a1, v12);
  sub_2494DC864();
  v17 = sub_2494DC894();
  v18 = v14;
  sub_2494DC600();
  v17 = sub_2494DC87C();
  v18 = v15;
  sub_2494DC600();
  v17 = sub_2494DC888();
  sub_2494DC600();
  LOBYTE(v17) = sub_2494DC870() & 1;
  sub_2494DC600();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(a1, v12);
}

uint64_t sub_2494D1B38()
{
  return sub_2494CDEFC(&qword_2578672A0, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity, (uint64_t)&unk_2494DD790);
}

uint64_t sub_2494D1B64()
{
  return sub_2494CDEFC(&qword_2578672A8, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity, (uint64_t)&unk_2494DD7B8);
}

uint64_t sub_2494D1B90()
{
  return sub_2494CDEFC((unint64_t *)&qword_257867130, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity, (uint64_t)&unk_2494DD7E0);
}

uint64_t sub_2494D1BBC()
{
  return sub_2494CDEFC(&qword_2578672B0, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity, (uint64_t)&unk_2494DD838);
}

uint64_t sub_2494D1BE8()
{
  return sub_2494CDEFC(&qword_2578672B8, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntityID, (uint64_t)&unk_2494DD0F0);
}

uint64_t sub_2494D1C14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_2494D26D4(v1, a1);
}

uint64_t sub_2494D1C20@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257866E80 != -1)
    swift_once();
  v2 = sub_2494DC7F8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257867738);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2494D1C90()
{
  return sub_2494CD5FC(&qword_2578672C0, &qword_2578672C8, MEMORY[0x24BDB6250]);
}

uint64_t sub_2494D1CBC()
{
  sub_2494CDEFC(qword_257867100, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity, (uint64_t)&unk_2494DD670);
  return sub_2494DC564();
}

uint64_t sub_2494D1D0C()
{
  return sub_2494CDEFC(qword_2578672D0, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity, (uint64_t)&unk_2494DD868);
}

uint64_t sub_2494D1D3C()
{
  sub_2494CDEFC(&qword_2578672B0, (uint64_t (*)(uint64_t))type metadata accessor for IntelligenceCommandEntity, (uint64_t)&unk_2494DD838);
  return sub_2494DC804();
}

uint64_t *sub_2494D1D8C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    sub_2494DC684();
  }
  else
  {
    v7 = sub_2494DC84C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *(uint64_t *)((char *)a1 + a3[5]) = *(uint64_t *)((char *)a2 + a3[5]);
    *(uint64_t *)((char *)a1 + v8) = *(uint64_t *)((char *)a2 + v8);
    v9 = a3[8];
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    *(uint64_t *)((char *)a1 + v9) = *(uint64_t *)((char *)a2 + v9);
    v10 = a3[9];
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    v13 = sub_2494DC8A0();
    v14 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
    sub_2494DC684();
    sub_2494DC684();
    sub_2494DC684();
    sub_2494DC684();
    v14(v11, v12, v13);
  }
  return a1;
}

uint64_t sub_2494D1E98(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = sub_2494DC84C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v5 = a1 + *(int *)(a2 + 36);
  v6 = sub_2494DC8A0();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
}

uint64_t sub_2494D1F24(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);

  v6 = sub_2494DC84C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[9];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_2494DC8A0();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
  sub_2494DC684();
  sub_2494DC684();
  sub_2494DC684();
  sub_2494DC684();
  v13(v10, v11, v12);
  return a1;
}

uint64_t sub_2494D2004(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_2494DC84C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  sub_2494DC684();
  swift_release();
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  sub_2494DC684();
  swift_release();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  sub_2494DC684();
  swift_release();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  sub_2494DC684();
  swift_release();
  v7 = a3[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2494DC8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t sub_2494D20F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_2494DC84C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  *(_QWORD *)(a1 + v8) = *(_QWORD *)(a2 + v8);
  v9 = a3[9];
  v10 = a1 + v9;
  v11 = a2 + v9;
  v12 = sub_2494DC8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

uint64_t sub_2494D2194(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = sub_2494DC84C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_QWORD *)(a1 + a3[5]) = *(_QWORD *)(a2 + a3[5]);
  swift_release();
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  swift_release();
  *(_QWORD *)(a1 + a3[7]) = *(_QWORD *)(a2 + a3[7]);
  swift_release();
  *(_QWORD *)(a1 + a3[8]) = *(_QWORD *)(a2 + a3[8]);
  swift_release();
  v7 = a3[9];
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = sub_2494DC8A0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t sub_2494D2260()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_2494D226C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = type metadata accessor for IntelligenceCommandEntityID();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_2494DC8A0();
    v10 = a1 + *(int *)(a3 + 36);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_2494D2314()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_2494D2320(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = type metadata accessor for IntelligenceCommandEntityID();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return result;
    }
    v10 = sub_2494DC8A0();
    v12 = a1 + *(int *)(a4 + 36);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t sub_2494D23C4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_2494DC84C();
  if (v1 <= 0x3F)
  {
    result = sub_2494DC8A0();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

size_t sub_2494D245C(size_t result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  unint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578673A8);
  v10 = *(_QWORD *)(sub_2494DC84C() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_29;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(_QWORD *)(sub_2494DC84C() - 8);
  if ((v5 & 1) != 0)
  {
    if (v13 < a4
      || (v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(_QWORD *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

char *sub_2494D25D0(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_257867390);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_2494D26D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for IntelligenceCommandEntityID();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_2494D271C()
{
  unint64_t result;

  result = qword_2578673B0;
  if (!qword_2578673B0)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD900, &type metadata for RunIntelligenceCommand);
    atomic_store(result, (unint64_t *)&qword_2578673B0);
  }
  return result;
}

uint64_t sub_2494D2760()
{
  uint64_t v0;

  v0 = sub_2494DC828();
  __swift_allocate_value_buffer(v0, qword_257867750);
  __swift_project_value_buffer(v0, (uint64_t)qword_257867750);
  return sub_2494DC810();
}

uint64_t sub_2494D27C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v14 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v13 - v5;
  v7 = sub_2494DC828();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  sub_2494DC810();
  sub_2494DC810();
  v9 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56);
  v9(v6, 0, 1, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671E8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2494DD340;
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  v9(v4, 0, 1, v7);
  v10 = v14;
  sub_2494DC738();
  v11 = sub_2494DC72C();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
}

uint64_t sub_2494D2A58()
{
  uint64_t v0;
  uint64_t v1;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578673F8);
  MEMORY[0x24BDAC7A8](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867400);
  MEMORY[0x24BDAC7A8](v1);
  sub_2494D2E60();
  sub_2494DC7B0();
  sub_2494DC7A4();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867408);
  sub_2494DC798();
  swift_release();
  sub_2494DC7A4();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867410);
  sub_2494DC798();
  swift_release();
  sub_2494DC7A4();
  sub_2494DC7BC();
  return sub_2494DC78C();
}

uint64_t sub_2494D2C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[7] = a1;
  v3[8] = a3;
  v3[9] = type metadata accessor for IntelligenceCommandEntity();
  v3[10] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2494D2C64()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t);

  if (qword_257866EA8 != -1)
    swift_once();
  v2 = v0[9];
  v1 = v0[10];
  sub_2494D0260((uint64_t)&unk_2578677C0, (uint64_t)(v0 + 2));
  sub_2494DC624();
  v3 = v1 + *(int *)(v2 + 36);
  v4 = v0[5];
  v5 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v4);
  v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(v5 + 8) + *(_QWORD *)(v5 + 8));
  v6 = (_QWORD *)swift_task_alloc();
  v0[11] = v6;
  *v6 = v0;
  v6[1] = sub_2494D2D3C;
  return v8(v3, v4, v5);
}

uint64_t sub_2494D2D3C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2494D2DA0()
{
  uint64_t v0;

  sub_2494D3644(*(_QWORD *)(v0 + 80));
  sub_2494D02C0(v0 + 16);
  sub_2494CD44C();
  sub_2494DC5DC();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494D2E10()
{
  uint64_t v0;

  sub_2494D3644(*(_QWORD *)(v0 + 80));
  sub_2494D02C0(v0 + 16);
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2494D2E60()
{
  unint64_t result;

  result = qword_2578673B8;
  if (!qword_2578673B8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD928, &type metadata for RunIntelligenceCommand);
    atomic_store(result, (unint64_t *)&qword_2578673B8);
  }
  return result;
}

unint64_t sub_2494D2EA8()
{
  unint64_t result;

  result = qword_2578673C0;
  if (!qword_2578673C0)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD9B8, &type metadata for RunIntelligenceCommand);
    atomic_store(result, (unint64_t *)&qword_2578673C0);
  }
  return result;
}

unint64_t sub_2494D2EF0()
{
  unint64_t result;

  result = qword_2578673C8;
  if (!qword_2578673C8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DD9E0, &type metadata for RunIntelligenceCommand);
    atomic_store(result, (unint64_t *)&qword_2578673C8);
  }
  return result;
}

uint64_t sub_2494D2F34()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_2494D2F58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2494D2F68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257866E88 != -1)
    swift_once();
  v2 = sub_2494DC828();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257867750);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2494D2FE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v4 = *(_QWORD *)(v1 + 8);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2494CCF48;
  return sub_2494D2C08(a1, v6, v4);
}

uint64_t sub_2494D3038@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2494D3274();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2494D305C()
{
  sub_2494D2E60();
  return sub_2494DC5AC();
}

uint64_t destroy for RunIntelligenceCommand()
{
  swift_release();
  return swift_release();
}

_QWORD *_s21UIIntelligenceIntents22RunIntelligenceCommandVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_2494DC684();
  sub_2494DC684();
  return a1;
}

_QWORD *assignWithCopy for RunIntelligenceCommand(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_2494DC684();
  swift_release();
  a1[1] = a2[1];
  sub_2494DC684();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for RunIntelligenceCommand(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RunIntelligenceCommand(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RunIntelligenceCommand(uint64_t result, int a2, int a3)
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
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for RunIntelligenceCommand()
{
  return &type metadata for RunIntelligenceCommand;
}

uint64_t sub_2494D321C()
{
  return sub_2494CD5FC(&qword_2578673D8, &qword_2578673E0, MEMORY[0x24BDB5F68]);
}

uint64_t sub_2494D3248()
{
  return sub_2494CD5FC(&qword_257867190, &qword_257867198, MEMORY[0x24BDB5E60]);
}

uint64_t sub_2494D3274()
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
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  char *v23;
  char *v24;
  char *v25;
  uint64_t v26;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671D0);
  MEMORY[0x24BDAC7A8](v0);
  v25 = (char *)&v21 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = sub_2494DC7C8();
  v2 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v23 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671A8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v24 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v21 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2494DC828();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671B0);
  sub_2494DC810();
  sub_2494DC810();
  v14 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56);
  v14(v11, 0, 1, v12);
  sub_2494DC5C4();
  v15 = sub_2494DC5D0();
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56);
  v16(v8, 0, 1, v15);
  v17 = *MEMORY[0x24BDB6090];
  v21 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  v18 = v23;
  v21(v23, v17, v26);
  v22 = sub_2494DC660();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578673E8);
  sub_2494DC810();
  sub_2494DC810();
  v14(v11, 0, 1, v12);
  v19 = type metadata accessor for IntelligenceCommandEntity();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v25, 1, 1, v19);
  sub_2494DC5C4();
  v16(v8, 0, 1, v15);
  v16(v24, 1, 1, v15);
  v21(v18, v17, v26);
  sub_2494D35FC();
  sub_2494DC654();
  return v22;
}

unint64_t sub_2494D35FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257867100[0];
  if (!qword_257867100[0])
  {
    v1 = type metadata accessor for IntelligenceCommandEntity();
    result = MEMORY[0x2495B1ECC](&unk_2494DD670, v1);
    atomic_store(result, qword_257867100);
  }
  return result;
}

uint64_t sub_2494D3644(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IntelligenceCommandEntity();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2494D3680@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2494DC63C();
  *a1 = result;
  return result;
}

uint64_t sub_2494D36A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2494DC63C();
  *a1 = result;
  return result;
}

unint64_t sub_2494D36D4()
{
  unint64_t result;

  result = qword_257867418;
  if (!qword_257867418)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DDAD0, &type metadata for InsertIntelligenceText);
    atomic_store(result, (unint64_t *)&qword_257867418);
  }
  return result;
}

uint64_t sub_2494D3718()
{
  uint64_t v0;

  v0 = sub_2494DC828();
  __swift_allocate_value_buffer(v0, qword_257867768);
  __swift_project_value_buffer(v0, (uint64_t)qword_257867768);
  return sub_2494DC810();
}

uint64_t sub_2494D3778@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v14 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v13 - v5;
  v7 = sub_2494DC828();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  sub_2494DC810();
  sub_2494DC810();
  v9 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56);
  v9(v6, 0, 1, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671E8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2494DDA90;
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  v9(v4, 0, 1, v7);
  v10 = v14;
  sub_2494DC738();
  v11 = sub_2494DC72C();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
}

uint64_t sub_2494D39C4()
{
  uint64_t v0;
  uint64_t v1;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867470);
  MEMORY[0x24BDAC7A8](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867478);
  MEMORY[0x24BDAC7A8](v1);
  sub_2494D3D60();
  sub_2494DC7B0();
  sub_2494DC7A4();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867480);
  sub_2494DC798();
  swift_release();
  sub_2494DC7A4();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867488);
  sub_2494DC798();
  swift_release();
  sub_2494DC7A4();
  sub_2494DC7BC();
  return sub_2494DC78C();
}

uint64_t sub_2494D3B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 72) = a1;
  *(_QWORD *)(v3 + 80) = a3;
  return swift_task_switch();
}

uint64_t sub_2494D3B8C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t, uint64_t);

  if (qword_257866EA0 != -1)
    swift_once();
  sub_2494D432C((uint64_t)&unk_257867798, (uint64_t)(v0 + 2));
  sub_2494DC624();
  v1 = v0[7];
  v2 = v0[8];
  v0[11] = v2;
  v3 = v0[5];
  v4 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v3);
  v7 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v4 + 8) + *(_QWORD *)(v4 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  v0[12] = v5;
  *v5 = v0;
  v5[1] = sub_2494D3C6C;
  return v7(v1, v2, v3, v4);
}

uint64_t sub_2494D3C6C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2494D3CD0()
{
  uint64_t v0;

  sub_2494D4368(v0 + 16);
  swift_bridgeObjectRelease();
  sub_2494DC5E8();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494D3D1C()
{
  uint64_t v0;

  sub_2494D4368(v0 + 16);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2494D3D60()
{
  unint64_t result;

  result = qword_257867420;
  if (!qword_257867420)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DDAF8, &type metadata for InsertIntelligenceText);
    atomic_store(result, (unint64_t *)&qword_257867420);
  }
  return result;
}

unint64_t sub_2494D3DA8()
{
  unint64_t result;

  result = qword_257867428;
  if (!qword_257867428)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DDB88, &type metadata for InsertIntelligenceText);
    atomic_store(result, (unint64_t *)&qword_257867428);
  }
  return result;
}

unint64_t sub_2494D3DF0()
{
  unint64_t result;

  result = qword_257867430;
  if (!qword_257867430)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DDBB0, &type metadata for InsertIntelligenceText);
    atomic_store(result, (unint64_t *)&qword_257867430);
  }
  return result;
}

uint64_t sub_2494D3E34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2494D3E44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2494D3E54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257866E90 != -1)
    swift_once();
  v2 = sub_2494DC828();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257867768);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2494D3ECC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 8);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_2494CCF48;
  v5[9] = a1;
  v5[10] = v4;
  return swift_task_switch();
}

uint64_t sub_2494D3F30@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_2494D3FE4();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2494D3F54()
{
  sub_2494D3D60();
  return sub_2494DC5AC();
}

ValueMetadata *type metadata accessor for InsertIntelligenceText()
{
  return &type metadata for InsertIntelligenceText;
}

uint64_t sub_2494D3F8C()
{
  return sub_2494CD5FC(&qword_257867440, &qword_257867448, MEMORY[0x24BDB5F68]);
}

uint64_t sub_2494D3FB8()
{
  return sub_2494CD5FC(&qword_257867450, &qword_257867458, MEMORY[0x24BDB5E58]);
}

uint64_t sub_2494D3FE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  void (*v21)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671A0);
  MEMORY[0x24BDAC7A8](v0);
  v24 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_2494DC7C8();
  v2 = *(_QWORD *)(v23 - 8);
  MEMORY[0x24BDAC7A8](v23);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671A8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_2494DC828();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671B0);
  sub_2494DC810();
  sub_2494DC810();
  v13 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56);
  v13(v10, 0, 1, v11);
  sub_2494DC5C4();
  v14 = sub_2494DC5D0();
  v21 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56);
  v21(v7, 0, 1, v14);
  v15 = *MEMORY[0x24BDB6090];
  v20 = *(void (**)(char *, uint64_t, uint64_t))(v2 + 104);
  v16 = v23;
  v20(v4, v15, v23);
  v22 = sub_2494DC660();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867460);
  sub_2494DC810();
  sub_2494DC810();
  v13(v10, 0, 1, v11);
  v17 = sub_2494DC960();
  v25 = 0;
  v26 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v24, 1, 1, v17);
  sub_2494DC5C4();
  v21(v7, 0, 1, v14);
  v20(v4, v15, v16);
  sub_2494DC66C();
  return v22;
}

uint64_t sub_2494D432C(uint64_t a1, uint64_t a2)
{
  initializeWithCopy for InsertTextBridge(a2, a1);
  return a2;
}

uint64_t sub_2494D4368(uint64_t a1)
{
  destroy for InsertTextBridge();
  return a1;
}

uint64_t sub_2494D439C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2494DC63C();
  *a1 = result;
  return result;
}

uint64_t sub_2494D43C4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_2494DC63C();
  *a1 = result;
  return result;
}

unint64_t sub_2494D43F0()
{
  unint64_t result;

  result = qword_257867490;
  if (!qword_257867490)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DDC90, &type metadata for FetchIntelligenceCommands);
    atomic_store(result, (unint64_t *)&qword_257867490);
  }
  return result;
}

uint64_t sub_2494D4434()
{
  uint64_t v0;

  v0 = sub_2494DC828();
  __swift_allocate_value_buffer(v0, qword_257867780);
  __swift_project_value_buffer(v0, (uint64_t)qword_257867780);
  return sub_2494DC810();
}

uint64_t sub_2494D4494@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v14 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v13 - v5;
  v7 = sub_2494DC828();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  sub_2494DC810();
  sub_2494DC810();
  v9 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56);
  v9(v6, 0, 1, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671E8);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_2494DD340;
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  sub_2494DC810();
  v9(v4, 0, 1, v7);
  v10 = v14;
  sub_2494DC738();
  v11 = sub_2494DC72C();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 0, 1, v11);
}

uint64_t sub_2494D4728(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[5] = a4;
  v5[6] = a5;
  v5[3] = a1;
  v5[4] = a3;
  v6 = sub_2494DC8DC();
  v5[7] = v6;
  v5[8] = *(_QWORD *)(v6 - 8);
  v5[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2494D478C()
{
  uint64_t v0;
  _QWORD *v1;

  sub_2494DC8D0();
  sub_2494DC624();
  if (*(_BYTE *)(v0 + 104) == 1)
    sub_2494DC8B8();
  sub_2494DC624();
  if (*(_BYTE *)(v0 + 105) == 1)
    sub_2494DC8AC();
  sub_2494DC624();
  if (*(_BYTE *)(v0 + 106) == 1)
    sub_2494DC8C4();
  if (qword_257866EA8 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v1;
  *v1 = v0;
  v1[1] = sub_2494D4890;
  return sub_2494D6A10(*(_QWORD *)(v0 + 72));
}

uint64_t sub_2494D4890(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;

  v4 = *v2;
  *(_QWORD *)(*v2 + 88) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v4 + 96) = a1;
  return swift_task_switch();
}

uint64_t sub_2494D4904()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 56);
  *(_QWORD *)(v0 + 16) = *(_QWORD *)(v0 + 96);
  __swift_instantiateConcreteTypeFromMangledName(qword_257867140);
  sub_2494D533C();
  sub_2494DC5DC();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494D49A8()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 64) + 8))(*(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 56));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2494D49F4()
{
  unint64_t result;

  result = qword_257867498;
  if (!qword_257867498)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DDCB8, &type metadata for FetchIntelligenceCommands);
    atomic_store(result, (unint64_t *)&qword_257867498);
  }
  return result;
}

unint64_t sub_2494D4A3C()
{
  unint64_t result;

  result = qword_2578674A0;
  if (!qword_2578674A0)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DDD48, &type metadata for FetchIntelligenceCommands);
    atomic_store(result, (unint64_t *)&qword_2578674A0);
  }
  return result;
}

unint64_t sub_2494D4A84()
{
  unint64_t result;

  result = qword_2578674A8;
  if (!qword_2578674A8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DDD70, &type metadata for FetchIntelligenceCommands);
    atomic_store(result, (unint64_t *)&qword_2578674A8);
  }
  return result;
}

uint64_t sub_2494D4AC8()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_2494D4AEC()
{
  sub_2494D49F4();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_2494D4B2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_257866E98 != -1)
    swift_once();
  v2 = sub_2494DC828();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_257867780);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_2494D4BA4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v4 = v1[1];
  v5 = v1[2];
  v6 = v1[3];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2494CCF48;
  return sub_2494D4728(a1, v8, v4, v5, v6);
}

uint64_t sub_2494D4C10@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = sub_2494D4EF0();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return result;
}

uint64_t sub_2494D4C38()
{
  sub_2494D49F4();
  return sub_2494DC5AC();
}

uint64_t initializeBufferWithCopyOfBuffer for FetchIntelligenceCommands(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  sub_2494DC684();
  return v3;
}

uint64_t destroy for FetchIntelligenceCommands()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for FetchIntelligenceCommands(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  sub_2494DC684();
  sub_2494DC684();
  sub_2494DC684();
  sub_2494DC684();
  return a1;
}

_QWORD *assignWithCopy for FetchIntelligenceCommands(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_2494DC684();
  swift_release();
  a1[1] = a2[1];
  sub_2494DC684();
  swift_release();
  a1[2] = a2[2];
  sub_2494DC684();
  swift_release();
  a1[3] = a2[3];
  sub_2494DC684();
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

_OWORD *assignWithTake for FetchIntelligenceCommands(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for FetchIntelligenceCommands(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for FetchIntelligenceCommands(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for FetchIntelligenceCommands()
{
  return &type metadata for FetchIntelligenceCommands;
}

unint64_t sub_2494D4EA4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2578674B8;
  if (!qword_2578674B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2578674C0);
    result = MEMORY[0x2495B1ECC](MEMORY[0x24BDB5E60], v1);
    atomic_store(result, (unint64_t *)&qword_2578674B8);
  }
  return result;
}

uint64_t sub_2494D4EF0()
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
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  char *v26;
  void (*v27)(char *, uint64_t, uint64_t, uint64_t);
  char *v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v33;
  char *v34;
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v48;
  void (*v49)(char *);
  char v50;
  char v51;
  char v52;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578674C8);
  MEMORY[0x24BDAC7A8](v0);
  v43 = (char *)&v33 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_2494DC7C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671A8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2494DC828();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671B0);
  sub_2494DC810();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v14(v11, 1, 1, v12);
  v15 = v14;
  v40 = v14;
  v46 = sub_2494DC5D0();
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v46 - 8) + 56);
  v16(v8, 1, 1, v46);
  v41 = *MEMORY[0x24BDB6090];
  v49 = *(void (**)(char *))(v3 + 104);
  v49(v5);
  v17 = v11;
  v18 = v5;
  v44 = sub_2494DC660();
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578674D0);
  sub_2494DC810();
  v19 = v17;
  v34 = v17;
  v20 = v12;
  v38 = v12;
  v15(v19, 1, 1, v12);
  v52 = 2;
  v21 = sub_2494DC9C0();
  v47 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56);
  v48 = v21;
  v22 = v43;
  v47(v43, 1, 1, v21);
  v35 = v8;
  v23 = v46;
  v24 = v16;
  v16(v8, 1, 1, v46);
  v36 = v18;
  v37 = v2;
  v25 = v41;
  ((void (*)(char *, _QWORD, uint64_t))v49)(v18, v41, v2);
  v42 = sub_2494DC678();
  sub_2494DC810();
  v26 = v34;
  v27 = v40;
  v40(v34, 1, 1, v20);
  v51 = 2;
  v47(v22, 1, 1, v48);
  v28 = v35;
  v24(v35, 1, 1, v23);
  v29 = v36;
  v30 = v2;
  v31 = (void (*)(char *, uint64_t, uint64_t))v49;
  ((void (*)(char *, uint64_t, uint64_t))v49)(v36, v25, v30);
  v39 = sub_2494DC678();
  sub_2494DC810();
  v27(v26, 1, 1, v38);
  v50 = 2;
  v47(v22, 1, 1, v48);
  v24(v28, 1, 1, v46);
  v31(v29, v25, v37);
  sub_2494DC678();
  return v44;
}

unint64_t sub_2494D533C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_2578674E0;
  if (!qword_2578674E0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_257867140);
    v2 = sub_2494D53A0();
    result = MEMORY[0x2495B1ECC](MEMORY[0x24BDB6630], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2578674E0);
  }
  return result;
}

unint64_t sub_2494D53A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257867130;
  if (!qword_257867130)
  {
    v1 = type metadata accessor for IntelligenceCommandEntity();
    result = MEMORY[0x2495B1ECC](&unk_2494DD7E0, v1);
    atomic_store(result, (unint64_t *)&qword_257867130);
  }
  return result;
}

uint64_t sub_2494D53E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_2494CCF48;
  return v11(a1, a2, a3, a4);
}

BOOL sub_2494D546C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_2494D5484()
{
  sub_2494DCAE0();
  sub_2494DCAEC();
  return sub_2494DCAF8();
}

uint64_t sub_2494D54C8()
{
  return sub_2494DCAEC();
}

uint64_t sub_2494D54F0()
{
  sub_2494DCAE0();
  sub_2494DCAEC();
  return sub_2494DCAF8();
}

uint64_t sub_2494D5540()
{
  return sub_2494DC810();
}

void sub_2494D5584()
{
  qword_2578677B0 = (uint64_t)&type metadata for InsertTextBridge_UIKit;
  *(_QWORD *)algn_2578677B8 = &off_251A9A048;
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

uint64_t initializeWithCopy for InsertTextBridge(uint64_t a1, uint64_t a2)
{
  __int128 v3;

  v3 = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 24) = v3;
  (**(void (***)(void))(v3 - 8))();
  return a1;
}

uint64_t *assignWithCopy for InsertTextBridge(uint64_t *a1, uint64_t *a2)
{
  __swift_assign_boxed_opaque_existential_1(a1, a2);
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
        sub_2494DC684();
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
          sub_2494DC684();
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
          sub_2494DC684();
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

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for InsertTextBridge(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_1(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  return a1;
}

uint64_t getEnumTagSinglePayload for InsertTextBridge(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InsertTextBridge(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
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
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for InsertTextBridge()
{
  return &type metadata for InsertTextBridge;
}

uint64_t sub_2494D5878(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_2494D5894()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[4];
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v6 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
  v4 = (_QWORD *)swift_task_alloc();
  v0[5] = v4;
  *v4 = v0;
  v4[1] = sub_2494D5914;
  return v6(v0[2], v0[3], v2, v3);
}

uint64_t sub_2494D5914()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for InsertTextBridge.BridgeError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for InsertTextBridge.BridgeError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2494D5A48 + 4 * byte_2494DDDD5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2494D5A7C + 4 * asc_2494DDDD0[v4]))();
}

uint64_t sub_2494D5A7C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2494D5A84(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2494D5A8CLL);
  return result;
}

uint64_t sub_2494D5A98(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2494D5AA0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2494D5AA4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2494D5AAC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2494D5AB8(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_2494D5AC0(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for InsertTextBridge.BridgeError()
{
  return &type metadata for InsertTextBridge.BridgeError;
}

unint64_t sub_2494D5AE0()
{
  unint64_t result;

  result = qword_2578674F8[0];
  if (!qword_2578674F8[0])
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DDEB8, &type metadata for InsertTextBridge.BridgeError);
    atomic_store(result, qword_2578674F8);
  }
  return result;
}

uint64_t sub_2494D5B24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 8) + *(_QWORD *)(a3 + 8));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2494CCF48;
  return v9(a1, a2, a3);
}

uint64_t sub_2494D5B9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))(**(int **)(a3 + 16) + *(_QWORD *)(a3 + 16));
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_2494D5C14;
  return v9(a1, a2, a3);
}

uint64_t sub_2494D5C14(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_2494D5C64(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_2494DC8A0();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  v2[8] = *(_QWORD *)(type metadata accessor for IntelligenceCommandEntity() - 8);
  v2[9] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578670D8);
  v2[10] = swift_task_alloc();
  v4 = sub_2494DC84C();
  v2[11] = v4;
  v2[12] = *(_QWORD *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v2[15] = *(_QWORD *)(type metadata accessor for IntelligenceCommandEntityID() - 8);
  v2[16] = swift_task_alloc();
  v5 = sub_2494DC8DC();
  v2[17] = v5;
  v2[18] = *(_QWORD *)(v5 - 8);
  v2[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2494D5DA0()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[3];
  sub_2494DC8D0();
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v6 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v3 + 16) + *(_QWORD *)(v3 + 16));
  v4 = (_QWORD *)swift_task_alloc();
  v0[20] = v4;
  *v4 = v0;
  v4[1] = sub_2494D5E2C;
  return v6(v0[19], v2, v3);
}

uint64_t sub_2494D5E2C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 168) = a1;
  *(_QWORD *)(v3 + 176) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2494D5E98()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  void (*v15)(char *, char *, uint64_t);
  unint64_t v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void (*v27)(unint64_t, unint64_t, uint64_t);
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v1 = *(_QWORD *)(v0 + 16);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136));
  v2 = *(_QWORD *)(v1 + 16);
  v3 = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v4 = *(_QWORD *)(v0 + 120);
    v5 = *(_QWORD *)(v0 + 96);
    v6 = *(_QWORD *)(v0 + 16)
       + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v7 = *(_QWORD *)(v4 + 72);
    swift_bridgeObjectRetain();
    v8 = (char *)MEMORY[0x24BEE4AF8];
    do
    {
      v9 = *(_QWORD *)(v0 + 128);
      v11 = *(_QWORD *)(v0 + 80);
      v10 = *(_QWORD *)(v0 + 88);
      sub_2494D26D4(v6, v9);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v11, v9, v10);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v5 + 56))(v11, 0, 1, v10);
      sub_2494D778C(v9);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v11, 1, v10) == 1)
      {
        sub_2494D033C(*(_QWORD *)(v0 + 80), &qword_2578670D8);
      }
      else
      {
        v13 = *(char **)(v0 + 104);
        v12 = *(char **)(v0 + 112);
        v14 = *(_QWORD *)(v0 + 88);
        v15 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
        v15(v12, *(char **)(v0 + 80), v14);
        v15(v13, v12, v14);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v8 = (char *)sub_2494D245C(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
        v17 = *((_QWORD *)v8 + 2);
        v16 = *((_QWORD *)v8 + 3);
        if (v17 >= v16 >> 1)
          v8 = (char *)sub_2494D245C(v16 > 1, v17 + 1, 1, v8);
        v18 = *(char **)(v0 + 104);
        v19 = *(_QWORD *)(v0 + 88);
        *((_QWORD *)v8 + 2) = v17 + 1;
        v15(&v8[((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(_QWORD *)(v5 + 72) * v17], v18, v19);
      }
      v6 += v7;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
    v3 = MEMORY[0x24BEE4AF8];
  }
  else
  {
    v8 = (char *)MEMORY[0x24BEE4AF8];
  }
  v20 = *(_QWORD *)(v0 + 168);
  v21 = sub_2494D83D8((uint64_t)v8);
  swift_bridgeObjectRelease();
  v22 = sub_2494D84F8(v20, v21);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v23 = *(_QWORD *)(v22 + 16);
  if (v23)
  {
    v24 = *(_QWORD *)(v0 + 64);
    v25 = *(_QWORD *)(v0 + 40);
    v40 = v3;
    sub_2494D7734(0, v23, 0);
    v26 = v22 + ((*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80));
    v38 = *(_QWORD *)(v25 + 72);
    v39 = v25;
    v27 = *(void (**)(unint64_t, unint64_t, uint64_t))(v25 + 16);
    v28 = v3;
    do
    {
      v29 = *(_QWORD *)(v0 + 72);
      v31 = *(_QWORD *)(v0 + 48);
      v30 = *(_QWORD *)(v0 + 56);
      v32 = *(_QWORD *)(v0 + 32);
      v27(v30, v26, v32);
      v27(v31, v30, v32);
      sub_2494D1900(v31, v29);
      (*(void (**)(unint64_t, uint64_t))(v39 + 8))(v30, v32);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2494D7734(0, *(_QWORD *)(v28 + 16) + 1, 1);
        v28 = v40;
      }
      v34 = *(_QWORD *)(v28 + 16);
      v33 = *(_QWORD *)(v28 + 24);
      if (v34 >= v33 >> 1)
      {
        sub_2494D7734(v33 > 1, v34 + 1, 1);
        v28 = v40;
      }
      v35 = *(_QWORD *)(v0 + 72);
      *(_QWORD *)(v28 + 16) = v34 + 1;
      sub_2494D0378(v35, v28+ ((*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80))+ *(_QWORD *)(v24 + 72) * v34, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntity);
      v26 += v38;
      --v23;
    }
    while (v23);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v28);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2494D021C();
    swift_allocError();
    *v37 = 2;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2494D62F4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 144) + 8))(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 136));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494D6398(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  v4 = sub_2494DC8A0();
  v3[5] = v4;
  v3[6] = *(_QWORD *)(v4 - 8);
  v3[7] = swift_task_alloc();
  v3[8] = swift_task_alloc();
  v3[9] = *(_QWORD *)(type metadata accessor for IntelligenceCommandEntity() - 8);
  v3[10] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578670D8);
  v3[11] = swift_task_alloc();
  v5 = sub_2494DC84C();
  v3[12] = v5;
  v3[13] = *(_QWORD *)(v5 - 8);
  v3[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671C8);
  v3[15] = swift_task_alloc();
  v6 = sub_2494DC8DC();
  v3[16] = v6;
  v3[17] = *(_QWORD *)(v6 - 8);
  v3[18] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2494D64C8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[4];
  sub_2494DC8D0();
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v6 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v3 + 16) + *(_QWORD *)(v3 + 16));
  v4 = (_QWORD *)swift_task_alloc();
  v0[19] = v4;
  *v4 = v0;
  v4[1] = sub_2494D6554;
  return v6(v0[18], v2, v3);
}

uint64_t sub_2494D6554(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 160) = a1;
  *(_QWORD *)(v3 + 168) = v1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2494D65C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(unint64_t, unint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(_QWORD *)(v0 + 88);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
  swift_bridgeObjectRetain();
  sub_2494DC858();
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1);
  v5 = *(_QWORD *)(v0 + 120);
  if (v4 == 1)
  {
    sub_2494D033C(*(_QWORD *)(v0 + 88), &qword_2578670D8);
    v6 = type metadata accessor for IntelligenceCommandEntityID();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  }
  else
  {
    v7 = *(_QWORD *)(v0 + 112);
    v8 = *(_QWORD *)(v0 + 96);
    v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 + 104) + 32);
    v9(v7, *(_QWORD *)(v0 + 88), v8);
    v9(v5, v7, v8);
    v10 = type metadata accessor for IntelligenceCommandEntityID();
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 0, 1, v10);
  }
  v11 = *(_QWORD *)(v0 + 160);
  v12 = *(_QWORD *)(v0 + 120);
  v32 = *(_OWORD *)(v0 + 16);
  v13 = swift_task_alloc();
  *(_OWORD *)(v13 + 16) = v32;
  *(_QWORD *)(v13 + 32) = v12;
  v14 = sub_2494D6E44(sub_2494D88A8, v13, v11);
  swift_task_dealloc();
  v15 = *(_QWORD *)(v14 + 16);
  if (v15)
  {
    v16 = *(_QWORD *)(v0 + 72);
    v17 = *(_QWORD *)(v0 + 48);
    v34 = MEMORY[0x24BEE4AF8];
    sub_2494D7734(0, v15, 0);
    v18 = v14 + ((*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80));
    v31 = *(_QWORD *)(v17 + 72);
    v33 = v17;
    v19 = *(void (**)(unint64_t, unint64_t, uint64_t))(v17 + 16);
    v20 = v34;
    do
    {
      v21 = *(_QWORD *)(v0 + 80);
      v23 = *(_QWORD *)(v0 + 56);
      v22 = *(_QWORD *)(v0 + 64);
      v24 = *(_QWORD *)(v0 + 40);
      v19(v22, v18, v24);
      v19(v23, v22, v24);
      sub_2494D1900(v23, v21);
      (*(void (**)(unint64_t, uint64_t))(v33 + 8))(v22, v24);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2494D7734(0, *(_QWORD *)(v20 + 16) + 1, 1);
        v20 = v34;
      }
      v26 = *(_QWORD *)(v20 + 16);
      v25 = *(_QWORD *)(v20 + 24);
      if (v26 >= v25 >> 1)
      {
        sub_2494D7734(v25 > 1, v26 + 1, 1);
        v20 = v34;
      }
      v27 = *(_QWORD *)(v0 + 80);
      *(_QWORD *)(v20 + 16) = v26 + 1;
      sub_2494D0378(v27, v20+ ((*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80))+ *(_QWORD *)(v16 + 72) * v26, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntity);
      v18 += v31;
      --v15;
    }
    while (v15);
    sub_2494D033C(*(_QWORD *)(v0 + 120), &qword_2578671C8);
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v20);
  }
  else
  {
    v29 = *(_QWORD *)(v0 + 120);
    swift_bridgeObjectRelease();
    sub_2494D021C();
    swift_allocError();
    *v30 = 2;
    swift_willThrow();
    sub_2494D033C(v29, &qword_2578671C8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_2494D6978()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 136) + 8))(*(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 128));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494D6A10(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_2494DC8A0();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  v2[7] = swift_task_alloc();
  v2[8] = *(_QWORD *)(type metadata accessor for IntelligenceCommandEntity() - 8);
  v2[9] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2494D6AA4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[3];
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v6 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v3 + 16) + *(_QWORD *)(v3 + 16));
  v4 = (_QWORD *)swift_task_alloc();
  v0[10] = v4;
  *v4 = v0;
  v4[1] = sub_2494D6B24;
  return v6(v0[2], v2, v3);
}

uint64_t sub_2494D6B24(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 88) = a1;
  swift_task_dealloc();
  if (!v1)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_2494D6BC0()
{
  uint64_t v0;
  uint64_t v1;
  int64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v1 = *(_QWORD *)(v0 + 88);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    v3 = *(_QWORD *)(v0 + 64);
    v4 = *(_QWORD *)(v0 + 40);
    v18 = MEMORY[0x24BEE4AF8];
    sub_2494D7734(0, v2, 0);
    v5 = v1 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
    v16 = *(_QWORD *)(v4 + 72);
    v17 = v4;
    v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
    v7 = v18;
    do
    {
      v8 = *(_QWORD *)(v0 + 72);
      v10 = *(_QWORD *)(v0 + 48);
      v9 = *(_QWORD *)(v0 + 56);
      v11 = *(_QWORD *)(v0 + 32);
      v6(v9, v5, v11);
      v6(v10, v9, v11);
      sub_2494D1900(v10, v8);
      (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v9, v11);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_2494D7734(0, *(_QWORD *)(v7 + 16) + 1, 1);
        v7 = v18;
      }
      v13 = *(_QWORD *)(v7 + 16);
      v12 = *(_QWORD *)(v7 + 24);
      if (v13 >= v12 >> 1)
      {
        sub_2494D7734(v12 > 1, v13 + 1, 1);
        v7 = v18;
      }
      v14 = *(_QWORD *)(v0 + 72);
      *(_QWORD *)(v7 + 16) = v13 + 1;
      sub_2494D0378(v14, v7+ ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))+ *(_QWORD *)(v3 + 72) * v13, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntity);
      v5 += v16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v7);
}

uint64_t sub_2494D6D80(unsigned __int8 a1)
{
  return ((uint64_t (*)())((char *)sub_2494D6D9C + 4 * byte_2494DDF20[a1]))();
}

uint64_t sub_2494D6D9C()
{
  return sub_2494DC810();
}

BOOL sub_2494D6E08(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2494D6E1C()
{
  unsigned __int8 *v0;

  return sub_2494D6D80(*v0);
}

void sub_2494D6E24()
{
  qword_2578677D8 = (uint64_t)&type metadata for IntelligenceCommandBridge_UIKit;
  unk_2578677E0 = &off_251A9A490;
}

uint64_t sub_2494D6E44(uint64_t (*a1)(_QWORD), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(_QWORD);
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;

  v27 = sub_2494DC8A0();
  v7 = *(_QWORD *)(v27 - 8);
  v8 = MEMORY[0x24BDAC7A8](v27);
  v26 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v20 - v11;
  v13 = MEMORY[0x24BEE4AF8];
  v28 = MEMORY[0x24BEE4AF8];
  v25 = *(_QWORD *)(a3 + 16);
  if (v25)
  {
    v14 = 0;
    v22 = a2;
    v23 = a3;
    v21 = a1;
    while (v14 < *(_QWORD *)(a3 + 16))
    {
      v15 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v13 = *(_QWORD *)(v7 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v7 + 16))(v12, a3 + v15 + v13 * v14, v27);
      v16 = a1(v12);
      if (v3)
      {
        (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v27);
        swift_bridgeObjectRelease();
        swift_release();
        return v13;
      }
      if ((v16 & 1) != 0)
      {
        v24 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
        v24(v26, v12, v27);
        v17 = v28;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2494D7760(0, *(_QWORD *)(v17 + 16) + 1, 1);
          v17 = v28;
        }
        v19 = *(_QWORD *)(v17 + 16);
        v18 = *(_QWORD *)(v17 + 24);
        if (v19 >= v18 >> 1)
        {
          sub_2494D7760(v18 > 1, v19 + 1, 1);
          v17 = v28;
        }
        *(_QWORD *)(v17 + 16) = v19 + 1;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(v17 + v15 + v19 * v13, v26, v27);
        v28 = v17;
        a3 = v23;
        a1 = v21;
      }
      else
      {
        result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v27);
      }
      if (v25 == ++v14)
      {
        v13 = v28;
        goto LABEL_15;
      }
    }
    __break(1u);
  }
  else
  {
LABEL_15:
    swift_bridgeObjectRelease();
    return v13;
  }
  return result;
}

uint64_t sub_2494D7054(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v23;
  uint64_t v24;
  char v25;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v36 = a4;
  v8 = sub_2494DC84C();
  v32 = *(_QWORD *)(v8 - 8);
  v33 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v31 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671C8);
  MEMORY[0x24BDAC7A8](v10);
  v35 = (uint64_t)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = type metadata accessor for IntelligenceCommandEntityID();
  v12 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v30 = (uint64_t)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2494DC8A0();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_2494DC894();
  v37 = v4;
  if (v18 == a2 && v19 == a3)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
LABEL_13:
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    goto LABEL_14;
  }
  v20 = sub_2494DCA80();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
  if ((v20 & 1) != 0)
    goto LABEL_13;
  if (sub_2494DC87C() == a2 && v21 == a3)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v23 = sub_2494DCA80();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  if ((v23 & 1) != 0)
  {
LABEL_14:
    v25 = 1;
    return v25 & 1;
  }
  v24 = v35;
  sub_2494D88C8(v36, v35);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v24, 1, v34) == 1)
  {
    sub_2494D033C(v24, &qword_2578671C8);
    v25 = 0;
  }
  else
  {
    v27 = v30;
    sub_2494D0378(v24, v30, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntityID);
    v28 = v31;
    sub_2494DC864();
    v25 = sub_2494DC840();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v28, v33);
    sub_2494D778C(v27);
  }
  return v25 & 1;
}

uint64_t sub_2494D7314(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_2494D732C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[3];
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v6 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
  v4 = (_QWORD *)swift_task_alloc();
  v0[4] = v4;
  *v4 = v0;
  v4[1] = sub_2494D73AC;
  return v6(v0[2], v2, v3);
}

uint64_t sub_2494D73AC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_2494D73F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = v1;
  return swift_task_switch();
}

uint64_t sub_2494D740C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, uint64_t, uint64_t);

  v1 = (_QWORD *)v0[3];
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v6 = (uint64_t (*)(_QWORD, uint64_t, uint64_t))(**(int **)(v3 + 16) + *(_QWORD *)(v3 + 16));
  v4 = (_QWORD *)swift_task_alloc();
  v0[4] = v4;
  *v4 = v0;
  v4[1] = sub_2494D748C;
  return v6(v0[2], v2, v3);
}

uint64_t sub_2494D748C(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_2494D74E0(uint64_t a1, char *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD);
  uint64_t v19;
  void (*v20)(_QWORD, _QWORD, _QWORD);
  char v21;
  void (*v22)(char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  char *v24;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;

  v3 = v2;
  v6 = sub_2494DC84C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  sub_2494D8868(&qword_2578670E8, MEMORY[0x24BEBB700]);
  swift_bridgeObjectRetain();
  v30 = a2;
  v11 = sub_2494DC930();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  v13 = v11 & ~v12;
  v14 = v10;
  v15 = v10 + 56;
  if (((*(_QWORD *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v26 = v2;
    v27 = a1;
    v28 = ~v12;
    v16 = v7;
    v17 = *(_QWORD *)(v7 + 72);
    v29 = v16;
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v16 + 16);
    while (1)
    {
      v19 = v14;
      v20 = v18;
      v18(v9, *(_QWORD *)(v14 + 48) + v17 * v13, v6);
      sub_2494D8868(&qword_257867528, MEMORY[0x24BEBB708]);
      v21 = sub_2494DC954();
      v22 = *(void (**)(char *, uint64_t))(v29 + 8);
      v22(v9, v6);
      if ((v21 & 1) != 0)
        break;
      v13 = (v13 + 1) & v28;
      v14 = v19;
      v18 = v20;
      if (((*(_QWORD *)(v15 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v26;
        a1 = v27;
        v7 = v29;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v30, v6);
    v20(v27, *(_QWORD *)(*v26 + 48) + v17 * v13, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v24 = v30;
    v18(v9, v30, v6);
    v31 = *v3;
    *v3 = 0x8000000000000000;
    sub_2494D7CA0((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *v3 = v31;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

size_t sub_2494D7734(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_2494D77C8(a1, a2, a3, (_QWORD *)*v3, &qword_257867518, (uint64_t (*)(_QWORD))type metadata accessor for IntelligenceCommandEntity);
  *v3 = result;
  return result;
}

size_t sub_2494D7760(size_t a1, int64_t a2, char a3)
{
  size_t *v3;
  size_t result;

  result = sub_2494D77C8(a1, a2, a3, (_QWORD *)*v3, &qword_257867530, (uint64_t (*)(_QWORD))MEMORY[0x24BEBB770]);
  *v3 = result;
  return result;
}

uint64_t sub_2494D778C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for IntelligenceCommandEntityID();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

size_t sub_2494D77C8(size_t result, int64_t a2, char a3, _QWORD *a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  char v8;
  unint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  uint64_t v18;
  unint64_t v19;

  v8 = result;
  if ((a3 & 1) != 0)
  {
    v9 = a4[3];
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v10 = a2;
    }
  }
  else
  {
    v10 = a2;
  }
  v11 = a4[2];
  if (v10 <= v11)
    v12 = a4[2];
  else
    v12 = v10;
  if (!v12)
  {
    v16 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(a5);
  v13 = *(_QWORD *)(a6(0) - 8);
  v14 = *(_QWORD *)(v13 + 72);
  v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  v16 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1)
    goto LABEL_29;
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  v18 = *(_QWORD *)(a6(0) - 8);
  if ((v8 & 1) != 0)
  {
    if (v16 < a4
      || (v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(_QWORD *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v16;
}

uint64_t sub_2494D793C()
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
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void (*v24)(char *, unint64_t, uint64_t);
  uint64_t v25;
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
  v2 = sub_2494DC84C();
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867538);
  v6 = sub_2494DCA20();
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
    result = sub_2494DC684();
    v14 = 0;
    while (1)
    {
      if (v11)
      {
        v16 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v17 = v16 | (v14 << 6);
      }
      else
      {
        v18 = v14 + 1;
        if (__OFADD__(v14, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v18 >= v34)
          goto LABEL_33;
        v19 = v35[v18];
        ++v14;
        if (!v19)
        {
          v14 = v18 + 1;
          if (v18 + 1 >= v34)
            goto LABEL_33;
          v19 = v35[v14];
          if (!v19)
          {
            v14 = v18 + 2;
            if (v18 + 2 >= v34)
              goto LABEL_33;
            v19 = v35[v14];
            if (!v19)
            {
              v20 = v18 + 3;
              if (v20 >= v34)
              {
LABEL_33:
                swift_release();
                v1 = v33;
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 > 63)
                  bzero(v35, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v35 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
                break;
              }
              v19 = v35[v20];
              if (!v19)
              {
                while (1)
                {
                  v14 = v20 + 1;
                  if (__OFADD__(v20, 1))
                    goto LABEL_39;
                  if (v14 >= v34)
                    goto LABEL_33;
                  v19 = v35[v14];
                  ++v20;
                  if (v19)
                    goto LABEL_23;
                }
              }
              v14 = v20;
            }
          }
        }
LABEL_23:
        v11 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v14 << 6);
      }
      v21 = v5;
      v22 = *(_QWORD *)(v36 + 72);
      v23 = *(_QWORD *)(v5 + 48) + v22 * v17;
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v23, v2);
      sub_2494D8868(&qword_2578670E8, MEMORY[0x24BEBB700]);
      result = sub_2494DC930();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6))) != 0)
      {
        v15 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v12 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v12 + 8 * v27);
        }
        while (v31 == -1);
        v15 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v12 + ((v15 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v15;
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v22, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_2494D7CA0(uint64_t a1, unint64_t a2, char a3)
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
  v6 = sub_2494DC84C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(_QWORD *)(*v3 + 16);
  v11 = *(_QWORD *)(*v3 + 24);
  v25 = v3;
  if (v11 > v10 && (a3 & 1) != 0)
    goto LABEL_12;
  if ((a3 & 1) != 0)
  {
    sub_2494D793C();
  }
  else
  {
    if (v11 > v10)
    {
      sub_2494D7E94();
      goto LABEL_12;
    }
    sub_2494D80B8();
  }
  v12 = *v3;
  sub_2494D8868(&qword_2578670E8, MEMORY[0x24BEBB700]);
  v13 = sub_2494DC930();
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
      sub_2494D8868(&qword_257867528, MEMORY[0x24BEBB708]);
      v18 = sub_2494DC954();
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
  result = sub_2494DCA8C();
  __break(1u);
  return result;
}

void *sub_2494D7E94()
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
  unint64_t v16;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;

  v1 = v0;
  v2 = sub_2494DC84C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867538);
  v6 = *v0;
  v7 = sub_2494DCA14();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_30:
    *v1 = v8;
    return result;
  }
  v25 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v13 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v14 = 1 << *(_BYTE *)(v6 + 32);
  v15 = -1;
  if (v14 < 64)
    v15 = ~(-1 << v14);
  v16 = v15 & *(_QWORD *)(v6 + 56);
  v17 = (unint64_t)(v14 + 63) >> 6;
  while (1)
  {
    if (v16)
    {
      v18 = __clz(__rbit64(v16));
      v16 &= v16 - 1;
      v19 = v18 | (v13 << 6);
      goto LABEL_12;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_32;
    }
    if (v21 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v17)
        goto LABEL_28;
      v22 = *(_QWORD *)(v10 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v17)
          goto LABEL_28;
        v22 = *(_QWORD *)(v10 + 8 * v13);
        if (!v22)
          break;
      }
    }
LABEL_27:
    v16 = (v22 - 1) & v22;
    v19 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_12:
    v20 = *(_QWORD *)(v3 + 72) * v19;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v20, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v20, v5, v2);
  }
  v23 = v21 + 3;
  if (v23 >= v17)
  {
LABEL_28:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_30;
  }
  v22 = *(_QWORD *)(v10 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_27;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v17)
      goto LABEL_28;
    v22 = *(_QWORD *)(v10 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_27;
  }
LABEL_32:
  __break(1u);
  return result;
}

uint64_t sub_2494D80B8()
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
  unint64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
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
  v2 = sub_2494DC84C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867538);
  v7 = sub_2494DCA20();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = swift_release();
LABEL_35:
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
  result = sub_2494DC684();
  v15 = 0;
  while (1)
  {
    if (v12)
    {
      v17 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v18 = v17 | (v15 << 6);
      goto LABEL_24;
    }
    v19 = v15 + 1;
    if (__OFADD__(v15, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v19);
    ++v15;
    if (!v20)
    {
      v15 = v19 + 1;
      if (v19 + 1 >= v33)
        goto LABEL_33;
      v20 = *(_QWORD *)(v32 + 8 * v15);
      if (!v20)
      {
        v15 = v19 + 2;
        if (v19 + 2 >= v33)
          goto LABEL_33;
        v20 = *(_QWORD *)(v32 + 8 * v15);
        if (!v20)
          break;
      }
    }
LABEL_23:
    v12 = (v20 - 1) & v20;
    v18 = __clz(__rbit64(v20)) + (v15 << 6);
LABEL_24:
    v22 = *(_QWORD *)(v3 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v22 * v18, v2);
    sub_2494D8868(&qword_2578670E8, MEMORY[0x24BEBB700]);
    result = sub_2494DC930();
    v23 = -1 << *(_BYTE *)(v8 + 32);
    v24 = result & ~v23;
    v25 = v24 >> 6;
    if (((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6))) != 0)
    {
      v16 = __clz(__rbit64((-1 << v24) & ~*(_QWORD *)(v13 + 8 * (v24 >> 6)))) | v24 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v23) >> 6;
      do
      {
        if (++v25 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v28 = v25 == v27;
        if (v25 == v27)
          v25 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v13 + 8 * v25);
      }
      while (v29 == -1);
      v16 = __clz(__rbit64(~v29)) + (v25 << 6);
    }
    *(_QWORD *)(v13 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v16 * v22, v5, v2);
    ++*(_QWORD *)(v8 + 16);
  }
  v21 = v19 + 3;
  if (v21 >= v33)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v31;
    goto LABEL_35;
  }
  v20 = *(_QWORD *)(v32 + 8 * v21);
  if (v20)
  {
    v15 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    v15 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v15 >= v33)
      goto LABEL_33;
    v20 = *(_QWORD *)(v32 + 8 * v15);
    ++v21;
    if (v20)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2494D83D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;

  v2 = sub_2494DC84C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  sub_2494D8868(&qword_2578670E8, MEMORY[0x24BEBB700]);
  result = sub_2494DCA08();
  v15 = result;
  if (v9)
  {
    v11 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v12 = *(_QWORD *)(v3 + 72);
    v13 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    do
    {
      v13(v6, v11, v2);
      sub_2494D74E0((uint64_t)v8, v6);
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      v11 += v12;
      --v9;
    }
    while (v9);
    return v15;
  }
  return result;
}

uint64_t sub_2494D84F8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
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
  char *v15;
  uint64_t result;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, unint64_t, uint64_t);
  uint64_t v26;
  char v27;
  void (*v28)(char *, uint64_t);
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD v32[2];
  unint64_t v33;
  void (*v34)(char *, char *, uint64_t);
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(char *, uint64_t, uint64_t);
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  char *v46;
  uint64_t v47;

  v5 = sub_2494DC84C();
  v45 = *(_QWORD **)(v5 - 8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v46 = (char *)v32 - v9;
  v10 = sub_2494DC8A0();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v35 = (char *)v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)v32 - v14;
  result = MEMORY[0x24BEE4AF8];
  v47 = MEMORY[0x24BEE4AF8];
  v41 = *(_QWORD *)(a1 + 16);
  if (v41)
  {
    v17 = 0;
    v18 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
    v42 = *(_QWORD *)(v11 + 72);
    v32[1] = v2;
    v33 = v18;
    v40 = a1 + v18;
    v19 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
    v38 = v10;
    v39 = v19;
    v44 = a2 + 56;
    v36 = (char *)v32 - v14;
    v37 = v11;
    do
    {
      v43 = v17;
      v39(v15, v40 + v42 * v17, v10);
      sub_2494DC864();
      if (*(_QWORD *)(a2 + 16)
        && (sub_2494D8868(&qword_2578670E8, MEMORY[0x24BEBB700]),
            v20 = sub_2494DC930(),
            v21 = -1 << *(_BYTE *)(a2 + 32),
            v22 = v20 & ~v21,
            ((*(_QWORD *)(v44 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) != 0))
      {
        v23 = ~v21;
        v24 = v45[9];
        v25 = (void (*)(char *, unint64_t, uint64_t))v45[2];
        while (1)
        {
          v26 = a2;
          v25(v8, *(_QWORD *)(a2 + 48) + v24 * v22, v5);
          sub_2494D8868(&qword_257867528, MEMORY[0x24BEBB708]);
          v27 = sub_2494DC954();
          v28 = (void (*)(char *, uint64_t))v45[1];
          v28(v8, v5);
          if ((v27 & 1) != 0)
            break;
          v22 = (v22 + 1) & v23;
          a2 = v26;
          if (((*(_QWORD *)(v44 + ((v22 >> 3) & 0xFFFFFFFFFFFFF8)) >> v22) & 1) == 0)
            goto LABEL_3;
        }
        v28(v46, v5);
        v15 = v36;
        v10 = v38;
        v34 = *(void (**)(char *, char *, uint64_t))(v37 + 32);
        v34(v35, v36, v38);
        v29 = v47;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_2494D7760(0, *(_QWORD *)(v29 + 16) + 1, 1);
          v29 = v47;
        }
        a2 = v26;
        v31 = *(_QWORD *)(v29 + 16);
        v30 = *(_QWORD *)(v29 + 24);
        if (v31 >= v30 >> 1)
        {
          sub_2494D7760(v30 > 1, v31 + 1, 1);
          v29 = v47;
        }
        *(_QWORD *)(v29 + 16) = v31 + 1;
        v34((char *)(v29 + v33 + v31 * v42), v35, v10);
        v47 = v29;
      }
      else
      {
LABEL_3:
        ((void (*)(char *, uint64_t))v45[1])(v46, v5);
        v15 = v36;
        v10 = v38;
        (*(void (**)(char *, uint64_t))(v37 + 8))(v36, v38);
      }
      v17 = v43 + 1;
    }
    while (v43 + 1 != v41);
    return v47;
  }
  return result;
}

uint64_t sub_2494D8868(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_2494DC84C();
    result = MEMORY[0x2495B1ECC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2494D88A8(uint64_t a1)
{
  uint64_t *v1;

  return sub_2494D7054(a1, v1[2], v1[3], v1[4]) & 1;
}

uint64_t sub_2494D88C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for IntelligenceCommandBridge.BridgeError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for IntelligenceCommandBridge.BridgeError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2494D89EC + 4 * byte_2494DDF29[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_2494D8A20 + 4 * byte_2494DDF24[v4]))();
}

uint64_t sub_2494D8A20(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2494D8A28(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2494D8A30);
  return result;
}

uint64_t sub_2494D8A3C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2494D8A44);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_2494D8A48(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2494D8A50(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_2494D8A5C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for IntelligenceCommandBridge.BridgeError()
{
  return &type metadata for IntelligenceCommandBridge.BridgeError;
}

ValueMetadata *type metadata accessor for IntelligenceCommandBridge()
{
  return &type metadata for IntelligenceCommandBridge;
}

unint64_t sub_2494D8A88()
{
  unint64_t result;

  result = qword_257867558;
  if (!qword_257867558)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE014, &type metadata for IntelligenceCommandBridge.BridgeError);
    atomic_store(result, (unint64_t *)&qword_257867558);
  }
  return result;
}

uint64_t sub_2494D8ACC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_2494D8B08 + 4 * byte_2494DE080[a1]))(0xD00000000000001ALL, 0x80000002494DE8D0);
}

uint64_t sub_2494D8B08()
{
  uint64_t v0;

  return v0 + 1;
}

uint64_t sub_2494D8BA8()
{
  unsigned __int8 v1;

  sub_2494DC624();
  return v1;
}

uint64_t sub_2494D8BD8()
{
  uint64_t v0;

  v0 = sub_2494DC7F8();
  __swift_allocate_value_buffer(v0, qword_2578677E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_2578677E8);
  return sub_2494DC7EC();
}

unint64_t sub_2494D8C38()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2578676F0);
  v0 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2578676F8) - 8);
  v1 = *(_QWORD *)(v0 + 72);
  v2 = (*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_2494DD550;
  v4 = (_BYTE *)(v3 + v2);
  *v4 = 0;
  sub_2494DC744();
  v4[v1] = 1;
  sub_2494DC744();
  result = sub_2494D8D1C(v3);
  qword_257867800 = result;
  return result;
}

unint64_t sub_2494D8D1C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578676F8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867700);
  v6 = sub_2494DCA5C();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  sub_2494DC684();
  while (1)
  {
    sub_2494DC4E0(v12, (uint64_t)v5, &qword_2578676F8);
    v14 = *v5;
    result = sub_2494DBA04(*v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v7[6] + result) = v14;
    v18 = v7[7];
    v19 = sub_2494DC768();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v9, v19);
    v20 = v7[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_11;
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
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

unint64_t sub_2494D8EB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  unint64_t result;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  _QWORD v23[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867690);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(_QWORD *)(a1 + 16))
  {
    v7 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867698);
  v6 = sub_2494DCA5C();
  v7 = (_QWORD *)v6;
  v8 = *(_QWORD *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  v9 = &v5[*(int *)(v2 + 48)];
  v10 = v6 + 64;
  v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v23[1] = a1;
  v12 = a1 + v11;
  v13 = *(_QWORD *)(v3 + 72);
  sub_2494DC684();
  while (1)
  {
    sub_2494DC4E0(v12, (uint64_t)v5, &qword_257867690);
    v14 = *v5;
    result = sub_2494DBAA0(*v5);
    if ((v16 & 1) != 0)
      break;
    v17 = result;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_BYTE *)(v7[6] + result) = v14;
    v18 = v7[7];
    v19 = sub_2494DC768();
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v18 + *(_QWORD *)(*(_QWORD *)(v19 - 8) + 72) * v17, v9, v19);
    v20 = v7[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (v21)
      goto LABEL_11;
    v7[2] = v22;
    v12 += v13;
    if (!--v8)
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

uint64_t sub_2494D904C(char *a1, char *a2)
{
  return sub_2494D90A0(*a1, *a2);
}

unint64_t sub_2494D905C()
{
  unint64_t result;

  result = qword_257867560;
  if (!qword_257867560)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE0B4, &type metadata for WritingToolsResult);
    atomic_store(result, (unint64_t *)&qword_257867560);
  }
  return result;
}

uint64_t sub_2494D90A0(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x6F70707553746F6ELL;
  else
    v3 = 0x73736563637573;
  if (v2)
    v4 = 0xE700000000000000;
  else
    v4 = 0xEC00000064657472;
  if ((a2 & 1) != 0)
    v5 = 0x6F70707553746F6ELL;
  else
    v5 = 0x73736563637573;
  if ((a2 & 1) != 0)
    v6 = 0xEC00000064657472;
  else
    v6 = 0xE700000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_2494DCA80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_2494D914C()
{
  sub_2494DCAE0();
  sub_2494DC9A8();
  swift_bridgeObjectRelease();
  return sub_2494DCAF8();
}

uint64_t sub_2494D91D4()
{
  sub_2494DC9A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2494D9238()
{
  sub_2494DCAE0();
  sub_2494DC9A8();
  swift_bridgeObjectRelease();
  return sub_2494DCAF8();
}

uint64_t sub_2494D92BC@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_2494DCA68();
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

void sub_2494D9318(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x73736563637573;
  if (*v1)
    v2 = 0x6F70707553746F6ELL;
  v3 = 0xE700000000000000;
  if (*v1)
    v3 = 0xEC00000064657472;
  *a1 = v2;
  a1[1] = v3;
}

unint64_t sub_2494D9364()
{
  unint64_t result;

  result = qword_257867568;
  if (!qword_257867568)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE194, &type metadata for WritingToolsResult);
    atomic_store(result, (unint64_t *)&qword_257867568);
  }
  return result;
}

unint64_t sub_2494D93AC()
{
  unint64_t result;

  result = qword_257867570;
  if (!qword_257867570)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE1CC, &type metadata for WritingToolsResult);
    atomic_store(result, (unint64_t *)&qword_257867570);
  }
  return result;
}

unint64_t sub_2494D93F4()
{
  unint64_t result;

  result = qword_257867578;
  if (!qword_257867578)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE11C, &type metadata for WritingToolsResult);
    atomic_store(result, (unint64_t *)&qword_257867578);
  }
  return result;
}

uint64_t sub_2494D9438()
{
  return MEMORY[0x24BEE0D78];
}

unint64_t sub_2494D9448()
{
  unint64_t result;

  result = qword_257867580;
  if (!qword_257867580)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE1FC, &type metadata for WritingToolsResult);
    atomic_store(result, (unint64_t *)&qword_257867580);
  }
  return result;
}

unint64_t sub_2494D9490()
{
  unint64_t result;

  result = qword_257867588;
  if (!qword_257867588)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE224, &type metadata for WritingToolsResult);
    atomic_store(result, (unint64_t *)&qword_257867588);
  }
  return result;
}

unint64_t sub_2494D94D8()
{
  unint64_t result;

  result = qword_257867590;
  if (!qword_257867590)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE24C, &type metadata for WritingToolsResult);
    atomic_store(result, (unint64_t *)&qword_257867590);
  }
  return result;
}

unint64_t sub_2494D9520()
{
  unint64_t result;

  result = qword_257867598;
  if (!qword_257867598)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE2A4, &type metadata for WritingToolsResult);
    atomic_store(result, (unint64_t *)&qword_257867598);
  }
  return result;
}

uint64_t sub_2494D9564@<X0>(uint64_t a1@<X8>)
{
  return sub_2494D9D64(&qword_257866EB0, (uint64_t (*)(_QWORD))MEMORY[0x24BDB6200], (uint64_t)qword_2578677E8, a1);
}

uint64_t sub_2494D9588(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2494DB28C(a1, a2, a3, (void (*)(void))sub_2494D959C);
}

unint64_t sub_2494D959C()
{
  unint64_t result;

  result = qword_2578675A0;
  if (!qword_2578675A0)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE154, &type metadata for WritingToolsResult);
    atomic_store(result, (unint64_t *)&qword_2578675A0);
  }
  return result;
}

uint64_t sub_2494D95E0()
{
  sub_2494D959C();
  return sub_2494DC558();
}

unint64_t sub_2494D961C()
{
  unint64_t result;

  result = qword_2578675A8;
  if (!qword_2578675A8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE2E4, &type metadata for WritingToolsResult);
    atomic_store(result, (unint64_t *)&qword_2578675A8);
  }
  return result;
}

unint64_t sub_2494D9664()
{
  unint64_t result;

  result = qword_2578675B0;
  if (!qword_2578675B0)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE30C, &type metadata for WritingToolsResult);
    atomic_store(result, (unint64_t *)&qword_2578675B0);
  }
  return result;
}

unint64_t sub_2494D96AC()
{
  unint64_t result;

  result = qword_2578675B8;
  if (!qword_2578675B8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE0DC, &type metadata for WritingToolsResult);
    atomic_store(result, (unint64_t *)&qword_2578675B8);
  }
  return result;
}

uint64_t sub_2494D96F0(uint64_t a1, uint64_t a2)
{
  return sub_2494DB43C(a1, a2, &qword_257866EB8);
}

uint64_t sub_2494D970C()
{
  sub_2494D9520();
  return sub_2494DC7D4();
}

uint64_t sub_2494D9744()
{
  return sub_2494CD5FC(&qword_2578675C0, &qword_2578675C8, MEMORY[0x24BEE12E0]);
}

void sub_2494D9770(_QWORD *a1@<X8>)
{
  *a1 = &unk_251A99E18;
}

unint64_t sub_2494D9784()
{
  unint64_t result;

  result = qword_2578675D0;
  if (!qword_2578675D0)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE374, &type metadata for WritingToolsProofreadIntent);
    atomic_store(result, (unint64_t *)&qword_2578675D0);
  }
  return result;
}

uint64_t sub_2494D97C8(uint64_t a1)
{
  return sub_2494D97EC(a1, qword_257867808);
}

uint64_t sub_2494D97EC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_2494DC828();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_2494DC810();
}

uint64_t sub_2494D9848()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = sub_2494DCA44();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = swift_task_alloc();
  sub_2494DC9E4();
  v0[5] = sub_2494DC9D8();
  v0[6] = sub_2494DC9CC();
  v0[7] = v2;
  return swift_task_switch();
}

uint64_t sub_2494D98D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  sub_2494DCA38();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2578676C8 + dword_2578676C8);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v1;
  *v1 = v0;
  v1[1] = sub_2494D9958;
  return v3(1000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_2494D9958()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 32);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_2494D99E0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  id v4;
  void *v5;

  swift_release();
  type metadata accessor for WritingTools_UIKit();
  v1 = swift_allocObject();
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v3 = objc_msgSend(v2, sel__responderForKeyEvents);

  if (v3)
  {
    *(_QWORD *)(v1 + 16) = v3;
    if ((objc_msgSend(v3, sel__supportsWritingTools) & 1) != 0)
    {
      v4 = *(id *)(v1 + 16);
      v5 = (void *)sub_2494DC99C();
      objc_msgSend(v4, sel__startWritingToolsWithTool_prompt_sender_, v5, 0, 0);

    }
    swift_release();
  }
  else
  {
    swift_deallocPartialClassInstance();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494D9B0C()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494D9B48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_2494DC9FC();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_2494DC9F0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_2494DC418(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_2494DC9CC();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

unint64_t sub_2494D9C7C()
{
  unint64_t result;

  result = qword_2578675D8;
  if (!qword_2578675D8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE42C, &type metadata for WritingToolsProofreadIntent);
    atomic_store(result, (unint64_t *)&qword_2578675D8);
  }
  return result;
}

unint64_t sub_2494D9CC4()
{
  unint64_t result;

  result = qword_2578675E0;
  if (!qword_2578675E0)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE454, &type metadata for WritingToolsProofreadIntent);
    atomic_store(result, (unint64_t *)&qword_2578675E0);
  }
  return result;
}

uint64_t sub_2494D9D08()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_2494D9D2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2494DB28C(a1, a2, a3, (void (*)(void))sub_2494D0C10);
}

uint64_t sub_2494D9D40@<X0>(uint64_t a1@<X8>)
{
  return sub_2494D9D64(&qword_257866EC0, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_257867808, a1);
}

uint64_t sub_2494D9D64@<X0>(_QWORD *a1@<X2>, uint64_t (*a2)(_QWORD)@<X3>, uint64_t a3@<X4>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;

  if (*a1 != -1)
    swift_once();
  v7 = a2(0);
  v8 = __swift_project_value_buffer(v7, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a4, v8, v7);
}

uint64_t sub_2494D9DD4()
{
  return 1;
}

uint64_t sub_2494D9DE0(uint64_t a1)
{
  _QWORD *v1;

  v1[2] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578676B0);
  v1[3] = swift_task_alloc();
  v1[4] = sub_2494DC9E4();
  v1[5] = sub_2494DC9D8();
  sub_2494DC9CC();
  return swift_task_switch();
}

uint64_t sub_2494D9E74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 24);
  swift_release();
  v2 = sub_2494DC9FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = sub_2494DC9D8();
  v4 = swift_allocObject();
  v5 = MEMORY[0x24BEE6930];
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v5;
  sub_2494D9B48(v1, (uint64_t)&unk_2578676E8, v4);
  swift_release();
  *(_BYTE *)(v0 + 48) = 0;
  sub_2494D94D8();
  sub_2494DC5DC();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494D9F44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v2 = sub_2494DC7C8();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671A8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_2494DC828();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671B0);
  sub_2494DC810();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  v14 = sub_2494DC5D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v8, 1, 1, v14);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x24BDB6090], v2);
  result = sub_2494DC660();
  *a1 = result;
  return result;
}

uint64_t sub_2494DA0FC()
{
  sub_2494D0C10();
  return sub_2494DC5AC();
}

unint64_t sub_2494DA128()
{
  unint64_t result;

  result = qword_2578675F0;
  if (!qword_2578675F0)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE4A0, &type metadata for WritingToolsRewriteIntent);
    atomic_store(result, (unint64_t *)&qword_2578675F0);
  }
  return result;
}

uint64_t sub_2494DA16C(uint64_t a1)
{
  return sub_2494D97EC(a1, qword_257867820);
}

uint64_t sub_2494DA18C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578676B0);
  v4[6] = swift_task_alloc();
  v4[7] = sub_2494DC9E4();
  v4[8] = sub_2494DC9D8();
  sub_2494DC9CC();
  return swift_task_switch();
}

uint64_t sub_2494DA224()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v4 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  swift_release();
  v5 = sub_2494DC9FC();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v1, 1, 1, v5);
  sub_2494DC684();
  sub_2494DC684();
  sub_2494DC684();
  v6 = sub_2494DC9D8();
  v7 = (_QWORD *)swift_allocObject();
  v8 = MEMORY[0x24BEE6930];
  v7[2] = v6;
  v7[3] = v8;
  v7[4] = v4;
  v7[5] = v3;
  v7[6] = v2;
  sub_2494D9B48(v1, (uint64_t)&unk_2578676C0, (uint64_t)v7);
  swift_release();
  *(_BYTE *)(v0 + 72) = 0;
  sub_2494D94D8();
  sub_2494DC5DC();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494DA324(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[4] = a5;
  v6[5] = a6;
  v7 = sub_2494DCA44();
  v6[6] = v7;
  v6[7] = *(_QWORD *)(v7 - 8);
  v6[8] = swift_task_alloc();
  sub_2494DC9E4();
  v6[9] = sub_2494DC9D8();
  v6[10] = sub_2494DC9CC();
  v6[11] = v8;
  return swift_task_switch();
}

uint64_t sub_2494DA3B8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, uint64_t, char);

  sub_2494DCA38();
  v3 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, char))((char *)&dword_2578676C8 + dword_2578676C8);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 96) = v1;
  *v1 = v0;
  v1[1] = sub_2494DA438;
  return v3(1000000000000000000, 0, 0, 0, 1);
}

uint64_t sub_2494DA438()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 48);
  *(_QWORD *)(*(_QWORD *)v1 + 104) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_2494DA4C0()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  id v3;
  unsigned __int8 v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  swift_release();
  type metadata accessor for WritingTools_UIKit();
  v1 = swift_allocObject();
  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v3 = objc_msgSend(v2, sel__responderForKeyEvents);

  if (v3)
  {
    *(_QWORD *)(v1 + 16) = v3;
    if ((objc_msgSend(v3, sel__supportsWritingTools) & 1) != 0)
    {
      sub_2494DC624();
      v4 = *(_BYTE *)(v0 + 112);
      sub_2494DC624();
      v5 = *(_QWORD *)(v0 + 24);
      v6 = *(void **)(v1 + 16);
      sub_2494D8ACC(v4);
      v7 = v6;
      v8 = (void *)sub_2494DC99C();
      swift_bridgeObjectRelease();
      if (v5)
        v9 = (void *)sub_2494DC99C();
      else
        v9 = 0;
      objc_msgSend(v7, sel__startWritingToolsWithTool_prompt_sender_, v8, v9, 0);

      swift_bridgeObjectRelease();
    }
    swift_release();
  }
  else
  {
    swift_deallocPartialClassInstance();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2494DA648()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2494DA68C()
{
  unint64_t result;

  result = qword_2578675F8;
  if (!qword_2578675F8)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE558, &type metadata for WritingToolsRewriteIntent);
    atomic_store(result, (unint64_t *)&qword_2578675F8);
  }
  return result;
}

unint64_t sub_2494DA6D4()
{
  unint64_t result;

  result = qword_257867600;
  if (!qword_257867600)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE580, &type metadata for WritingToolsRewriteIntent);
    atomic_store(result, (unint64_t *)&qword_257867600);
  }
  return result;
}

uint64_t sub_2494DA718()
{
  return *(_QWORD *)(swift_getOpaqueTypeConformance2() + 8);
}

uint64_t sub_2494DA73C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2494DB28C(a1, a2, a3, (void (*)(void))sub_2494D0C54);
}

uint64_t sub_2494DA750@<X0>(uint64_t a1@<X8>)
{
  return sub_2494D9D64(&qword_257866EC8, (uint64_t (*)(_QWORD))MEMORY[0x24BDCD380], (uint64_t)qword_257867820, a1);
}

uint64_t sub_2494DA774(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = *v1;
  v5 = v1[1];
  v6 = v1[2];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_2494CCF48;
  return sub_2494DA18C(a1, v4, v5, v6);
}

uint64_t sub_2494DA7E0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = sub_2494DBF68();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_2494DA808()
{
  sub_2494D0C54();
  return sub_2494DC5AC();
}

unint64_t sub_2494DA830()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void (*v14)(char *, uint64_t, uint64_t, uint64_t);
  void (*v15)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  uint64_t v18;
  _BYTE *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE *v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  _BYTE *v29;
  void (*v30)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v43;
  unint64_t result;
  _BYTE *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v51;
  uint64_t v52;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867028);
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v45 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_2494DC828();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257867688);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867690);
  v9 = *(_QWORD *)(v8 - 8);
  v52 = v8;
  v10 = *(_QWORD *)(v9 + 72);
  v11 = (*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v12 = swift_allocObject();
  v46 = v12;
  *(_OWORD *)(v12 + 16) = xmmword_2494DE8C0;
  *(_BYTE *)(v12 + v11) = 0;
  v13 = v12 + v11;
  sub_2494DC810();
  v14 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v14(v5, 1, 1, v6);
  v15 = v14;
  v50 = v14;
  v16 = sub_2494DC750();
  v17 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v18 = v16;
  v17(v2, 1, 1);
  sub_2494DC75C();
  v19 = (_BYTE *)(v13 + v10);
  v20 = v13;
  v47 = v13;
  v51 = v10;
  v21 = v52;
  v45 = &v19[*(int *)(v52 + 48)];
  *v19 = 1;
  sub_2494DC810();
  v15(v5, 1, 1, v6);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v17)(v2, 1, 1, v18);
  sub_2494DC75C();
  v22 = 2 * v10;
  v23 = (_BYTE *)(v20 + 2 * v10);
  v24 = v21;
  *v23 = 2;
  sub_2494DC810();
  v49 = v6;
  v25 = v50;
  v50(v5, 1, 1, v6);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v17)(v2, 1, 1, v18);
  sub_2494DC75C();
  v26 = v51;
  v27 = v22 + v51;
  v28 = v47;
  v29 = (_BYTE *)(v47 + v27);
  v45 = &v29[*(int *)(v24 + 48)];
  *v29 = 3;
  sub_2494DC810();
  v30 = v25;
  v25(v5, 1, 1, v6);
  v48 = v18;
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v17)(v2, 1, 1, v18);
  sub_2494DC75C();
  v31 = 4 * v26;
  v32 = v26;
  v33 = (_BYTE *)(v28 + 4 * v26);
  v45 = &v33[*(int *)(v52 + 48)];
  *v33 = 4;
  sub_2494DC810();
  v34 = v49;
  v30(v5, 1, 1, v49);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v17)(v2, 1, 1, v18);
  sub_2494DC75C();
  *(_BYTE *)(v28 + v31 + v32) = 5;
  sub_2494DC810();
  v30(v5, 1, 1, v34);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v17)(v2, 1, 1, v48);
  v35 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v17;
  sub_2494DC75C();
  v36 = v51;
  *(_BYTE *)(v28 + 6 * v51) = 6;
  sub_2494DC810();
  v37 = v49;
  v30(v5, 1, 1, v49);
  v38 = v48;
  v35(v2, 1, 1, v48);
  sub_2494DC75C();
  v39 = v36;
  v36 *= 8;
  v40 = v47;
  *(_BYTE *)(v47 + v36 - v39) = 7;
  sub_2494DC810();
  v41 = v37;
  v42 = v50;
  v50(v5, 1, 1, v41);
  v35(v2, 1, 1, v38);
  sub_2494DC75C();
  *(_BYTE *)(v40 + v36) = 8;
  sub_2494DC810();
  v43 = v49;
  v42(v5, 1, 1, v49);
  v35(v2, 1, 1, v38);
  sub_2494DC75C();
  *(_BYTE *)(v40 + v36 + v51) = 9;
  sub_2494DC810();
  v50(v5, 1, 1, v43);
  v35(v2, 1, 1, v38);
  sub_2494DC75C();
  result = sub_2494D8EB4(v46);
  qword_257867838 = result;
  return result;
}

uint64_t sub_2494DAE84(unsigned __int8 *a1, unsigned __int8 *a2)
{
  unsigned __int8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;

  v2 = *a2;
  v3 = sub_2494D8ACC(*a1);
  v5 = v4;
  if (v3 == sub_2494D8ACC(v2) && v5 == v6)
    v8 = 1;
  else
    v8 = sub_2494DCA80();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

unint64_t sub_2494DAF10()
{
  unint64_t result;

  result = qword_257867610;
  if (!qword_257867610)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE59C, &type metadata for RewriteType);
    atomic_store(result, (unint64_t *)&qword_257867610);
  }
  return result;
}

uint64_t sub_2494DAF54()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_2494DCAE0();
  sub_2494D8ACC(v1);
  sub_2494DC9A8();
  swift_bridgeObjectRelease();
  return sub_2494DCAF8();
}

uint64_t sub_2494DAFB4()
{
  unsigned __int8 *v0;

  sub_2494D8ACC(*v0);
  sub_2494DC9A8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2494DAFF4()
{
  unsigned __int8 *v0;
  unsigned __int8 v1;

  v1 = *v0;
  sub_2494DCAE0();
  sub_2494D8ACC(v1);
  sub_2494DC9A8();
  swift_bridgeObjectRelease();
  return sub_2494DCAF8();
}

uint64_t sub_2494DB050@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2494DC314();
  *a1 = result;
  return result;
}

uint64_t sub_2494DB07C@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2494D8ACC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

unint64_t sub_2494DB0A8()
{
  unint64_t result;

  result = qword_257867618;
  if (!qword_257867618)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE67C, &type metadata for RewriteType);
    atomic_store(result, (unint64_t *)&qword_257867618);
  }
  return result;
}

unint64_t sub_2494DB0F0()
{
  unint64_t result;

  result = qword_257867620;
  if (!qword_257867620)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE6B4, &type metadata for RewriteType);
    atomic_store(result, (unint64_t *)&qword_257867620);
  }
  return result;
}

unint64_t sub_2494DB138()
{
  unint64_t result;

  result = qword_257867628;
  if (!qword_257867628)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE604, &type metadata for RewriteType);
    atomic_store(result, (unint64_t *)&qword_257867628);
  }
  return result;
}

unint64_t sub_2494DB180()
{
  unint64_t result;

  result = qword_257867630;
  if (!qword_257867630)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE6E4, &type metadata for RewriteType);
    atomic_store(result, (unint64_t *)&qword_257867630);
  }
  return result;
}

unint64_t sub_2494DB1C8()
{
  unint64_t result;

  result = qword_257867638;
  if (!qword_257867638)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE70C, &type metadata for RewriteType);
    atomic_store(result, (unint64_t *)&qword_257867638);
  }
  return result;
}

unint64_t sub_2494DB214()
{
  unint64_t result;

  result = qword_257867640;
  if (!qword_257867640)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE78C, &type metadata for RewriteType);
    atomic_store(result, (unint64_t *)&qword_257867640);
  }
  return result;
}

uint64_t sub_2494DB258()
{
  return sub_2494DC7EC();
}

uint64_t sub_2494DB278(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2494DB28C(a1, a2, a3, (void (*)(void))sub_2494DB2CC);
}

uint64_t sub_2494DB28C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(void))
{
  a4();
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_2494DB2CC()
{
  unint64_t result;

  result = qword_257867648;
  if (!qword_257867648)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE63C, &type metadata for RewriteType);
    atomic_store(result, (unint64_t *)&qword_257867648);
  }
  return result;
}

uint64_t sub_2494DB310()
{
  sub_2494DB2CC();
  return sub_2494DC558();
}

unint64_t sub_2494DB34C()
{
  unint64_t result;

  result = qword_257867650;
  if (!qword_257867650)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE7CC, &type metadata for RewriteType);
    atomic_store(result, (unint64_t *)&qword_257867650);
  }
  return result;
}

unint64_t sub_2494DB394()
{
  unint64_t result;

  result = qword_257867658;
  if (!qword_257867658)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE7F4, &type metadata for RewriteType);
    atomic_store(result, (unint64_t *)&qword_257867658);
  }
  return result;
}

unint64_t sub_2494DB3DC()
{
  unint64_t result;

  result = qword_257867660;
  if (!qword_257867660)
  {
    result = MEMORY[0x2495B1ECC](&unk_2494DE5C4, &type metadata for RewriteType);
    atomic_store(result, (unint64_t *)&qword_257867660);
  }
  return result;
}

uint64_t sub_2494DB420(uint64_t a1, uint64_t a2)
{
  return sub_2494DB43C(a1, a2, &qword_257866ED0);
}

uint64_t sub_2494DB43C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  if (*a3 != -1)
    swift_once();
  return swift_bridgeObjectRetain();
}

uint64_t sub_2494DB478()
{
  sub_2494DB214();
  return sub_2494DC7D4();
}

uint64_t sub_2494DB4B0()
{
  return sub_2494CD5FC(&qword_257867668, &qword_257867670, MEMORY[0x24BEE12E0]);
}

void sub_2494DB4DC(_QWORD *a1@<X8>)
{
  *a1 = &unk_251A99D98;
}

uint64_t getEnumTagSinglePayload for RewriteType(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RewriteType(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_2494DB5C8 + 4 * byte_2494DE08F[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_2494DB5FC + 4 * byte_2494DE08A[v4]))();
}

uint64_t sub_2494DB5FC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2494DB604(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2494DB60CLL);
  return result;
}

uint64_t sub_2494DB618(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2494DB620);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_2494DB624(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2494DB62C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RewriteType()
{
  return &type metadata for RewriteType;
}

ValueMetadata *type metadata accessor for WritingToolsRewriteIntent()
{
  return &type metadata for WritingToolsRewriteIntent;
}

ValueMetadata *type metadata accessor for WritingToolsProofreadIntent()
{
  return &type metadata for WritingToolsProofreadIntent;
}

uint64_t storeEnumTagSinglePayload for WritingToolsResult(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_2494DB6B4 + 4 * byte_2494DE099[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_2494DB6E8 + 4 * byte_2494DE094[v4]))();
}

uint64_t sub_2494DB6E8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_2494DB6F0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x2494DB6F8);
  return result;
}

uint64_t sub_2494DB704(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x2494DB70CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_2494DB710(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_2494DB718(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for WritingToolsResult()
{
  return &type metadata for WritingToolsResult;
}

uint64_t sub_2494DB734()
{
  return sub_2494CD5FC(&qword_257867678, &qword_257867680, MEMORY[0x24BDB5E60]);
}

uint64_t sub_2494DB760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v12;

  *(_QWORD *)(v6 + 56) = v5;
  v12 = sub_2494DCA2C();
  *(_QWORD *)(v6 + 64) = v12;
  *(_QWORD *)(v6 + 72) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 80) = swift_task_alloc();
  *(_QWORD *)(v6 + 88) = swift_task_alloc();
  *(_QWORD *)(v6 + 40) = a1;
  *(_QWORD *)(v6 + 48) = a2;
  *(_QWORD *)(v6 + 16) = a3;
  *(_QWORD *)(v6 + 24) = a4;
  *(_BYTE *)(v6 + 32) = a5 & 1;
  return swift_task_switch();
}

uint64_t sub_2494DB804()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  _QWORD *v5;

  v1 = v0[10];
  v2 = v0[8];
  v3 = v0[9];
  sub_2494DCA44();
  sub_2494CDEFC(&qword_2578676D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6E10], MEMORY[0x24BEE6E20]);
  sub_2494DCA98();
  sub_2494CDEFC(&qword_2578676D8, (uint64_t (*)(uint64_t))MEMORY[0x24BEE6DC8], MEMORY[0x24BEE6E00]);
  sub_2494DCA50();
  v4 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[12] = v4;
  v4(v1, v2);
  v5 = (_QWORD *)swift_task_alloc();
  v0[13] = v5;
  *v5 = v0;
  v5[1] = sub_2494DB91C;
  return sub_2494DCAA4();
}

uint64_t sub_2494DB91C()
{
  uint64_t v0;
  uint64_t *v1;
  void (*v2)(uint64_t, uint64_t);
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *(void (**)(uint64_t, uint64_t))(*v1 + 96);
  v3 = *(_QWORD *)(*v1 + 88);
  v4 = *(_QWORD *)(*v1 + 64);
  v5 = *v1;
  *(_QWORD *)(v5 + 112) = v0;
  swift_task_dealloc();
  v2(v3, v4);
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_2494DB9C8()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_2494DBA04(char a1)
{
  uint64_t v2;

  sub_2494DCAE0();
  sub_2494DC9A8();
  swift_bridgeObjectRelease();
  v2 = sub_2494DCAF8();
  return sub_2494DBB14(a1 & 1, v2);
}

uint64_t sub_2494DBAA0(uint64_t a1)
{
  uint64_t v2;

  sub_2494DCAE0();
  sub_2494D8ACC(a1);
  sub_2494DC9A8();
  swift_bridgeObjectRelease();
  v2 = sub_2494DCAF8();
  return sub_2494DBC5C(a1, v2);
}

unint64_t sub_2494DBB14(char a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char v11;

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v5 = ~v3;
    if ((a1 & 1) != 0)
      v6 = 0x6F70707553746F6ELL;
    else
      v6 = 0x73736563637573;
    if ((a1 & 1) != 0)
      v7 = 0xEC00000064657472;
    else
      v7 = 0xE700000000000000;
    while (1)
    {
      v8 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? 0x6F70707553746F6ELL : 0x73736563637573;
      v9 = *(_BYTE *)(*(_QWORD *)(v2 + 48) + v4) ? 0xEC00000064657472 : 0xE700000000000000;
      if (v8 == v6 && v9 == v7)
        break;
      v11 = sub_2494DCA80();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v11 & 1) == 0)
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

uint64_t sub_2494DBC5C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_2494DBF68()
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
  char *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *);
  uint64_t v21;
  char *v22;
  void (*v23)(char *, uint64_t, uint64_t, uint64_t);
  char *v24;
  uint64_t v25;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  void (*v36)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671A0);
  MEMORY[0x24BDAC7A8](v0);
  v35 = (char *)&v27 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_2494DC7C8();
  v3 = *(_QWORD *)(v2 - 8);
  v32 = v2;
  v33 = v3;
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671A8);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v34 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v27 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_257867030);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_2494DC828();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578671B0);
  sub_2494DC810();
  v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56);
  v30 = v14;
  v16(v13, 1, 1, v14);
  v17 = sub_2494DC5D0();
  v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56);
  v27 = v10;
  v36(v10, 1, 1, v17);
  v18 = *MEMORY[0x24BDB6090];
  v19 = v32;
  v20 = *(void (**)(char *))(v33 + 104);
  v28 = v5;
  v21 = v18;
  v31 = v18;
  v20(v5);
  v33 = sub_2494DC660();
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578676A0);
  sub_2494DC810();
  v16(v13, 1, 1, v14);
  LOBYTE(v37) = 10;
  v22 = v27;
  v23 = v36;
  v36(v27, 1, 1, v17);
  v23(v34, 1, 1, v17);
  v24 = v28;
  ((void (*)(char *, uint64_t, uint64_t))v20)(v28, v21, v19);
  sub_2494DB2CC();
  v34 = (char *)sub_2494DC648();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2578671B8);
  sub_2494DC810();
  v16(v13, 1, 1, v30);
  v25 = sub_2494DC960();
  v37 = 0;
  v38 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v35, 1, 1, v25);
  v36(v22, 1, 1, v17);
  ((void (*)(char *, _QWORD, uint64_t))v20)(v24, v31, v19);
  sub_2494DC66C();
  return v33;
}

uint64_t sub_2494DC314()
{
  unint64_t v0;

  v0 = sub_2494DCA68();
  swift_bridgeObjectRelease();
  if (v0 >= 0xA)
    return 10;
  else
    return v0;
}

uint64_t sub_2494DC35C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2494DC398(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_2494CCF48;
  return sub_2494DA324(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_2494DC418(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2578676B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2494DC458()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2494DC47C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_2494DC524;
  return sub_2494D9848();
}

uint64_t sub_2494DC4E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2494DC528()
{
  return MEMORY[0x24BDB4AF0]();
}

uint64_t sub_2494DC534()
{
  return MEMORY[0x24BDB4AF8]();
}

uint64_t sub_2494DC540()
{
  return MEMORY[0x24BDB4B68]();
}

uint64_t sub_2494DC54C()
{
  return MEMORY[0x24BDB4B70]();
}

uint64_t sub_2494DC558()
{
  return MEMORY[0x24BDB4D88]();
}

uint64_t sub_2494DC564()
{
  return MEMORY[0x24BDB4DB8]();
}

uint64_t sub_2494DC570()
{
  return MEMORY[0x24BDB4DD8]();
}

uint64_t sub_2494DC57C()
{
  return MEMORY[0x24BDB4DF8]();
}

uint64_t sub_2494DC588()
{
  return MEMORY[0x24BDB4E08]();
}

uint64_t sub_2494DC594()
{
  return MEMORY[0x24BDB4E10]();
}

uint64_t sub_2494DC5A0()
{
  return MEMORY[0x24BDB4E60]();
}

uint64_t sub_2494DC5AC()
{
  return MEMORY[0x24BDB4E68]();
}

uint64_t sub_2494DC5B8()
{
  return MEMORY[0x24BDB4F98]();
}

uint64_t sub_2494DC5C4()
{
  return MEMORY[0x24BDB5010]();
}

uint64_t sub_2494DC5D0()
{
  return MEMORY[0x24BDB5028]();
}

uint64_t sub_2494DC5DC()
{
  return MEMORY[0x24BDB51B0]();
}

uint64_t sub_2494DC5E8()
{
  return MEMORY[0x24BDB51C0]();
}

uint64_t sub_2494DC5F4()
{
  return MEMORY[0x24BDB52D0]();
}

uint64_t sub_2494DC600()
{
  return MEMORY[0x24BDB52D8]();
}

uint64_t sub_2494DC60C()
{
  return MEMORY[0x24BDB5328]();
}

uint64_t sub_2494DC618()
{
  return MEMORY[0x24BDB5330]();
}

uint64_t sub_2494DC624()
{
  return MEMORY[0x24BDB5460]();
}

uint64_t sub_2494DC630()
{
  return MEMORY[0x24BDB5468]();
}

uint64_t sub_2494DC63C()
{
  return MEMORY[0x24BDB5470]();
}

uint64_t sub_2494DC648()
{
  return MEMORY[0x24BDB5508]();
}

uint64_t sub_2494DC654()
{
  return MEMORY[0x24BDB5518]();
}

uint64_t sub_2494DC660()
{
  return MEMORY[0x24BDB5520]();
}

uint64_t sub_2494DC66C()
{
  return MEMORY[0x24BDB5580]();
}

uint64_t sub_2494DC678()
{
  return MEMORY[0x24BDB5588]();
}

uint64_t sub_2494DC684()
{
  return MEMORY[0x24BDB56C8]();
}

uint64_t sub_2494DC690()
{
  return MEMORY[0x24BDB56D8]();
}

uint64_t sub_2494DC69C()
{
  return MEMORY[0x24BDB56E0]();
}

uint64_t sub_2494DC6A8()
{
  return MEMORY[0x24BDB56E8]();
}

uint64_t sub_2494DC6B4()
{
  return MEMORY[0x24BDB5700]();
}

uint64_t sub_2494DC6C0()
{
  return MEMORY[0x24BDB5738]();
}

uint64_t sub_2494DC6CC()
{
  return MEMORY[0x24BDB5740]();
}

uint64_t sub_2494DC6D8()
{
  return MEMORY[0x24BDB5748]();
}

uint64_t sub_2494DC6E4()
{
  return MEMORY[0x24BDB5750]();
}

uint64_t sub_2494DC6F0()
{
  return MEMORY[0x24BDB5760]();
}

uint64_t sub_2494DC6FC()
{
  return MEMORY[0x24BDB5770]();
}

uint64_t sub_2494DC708()
{
  return MEMORY[0x24BDB5778]();
}

uint64_t sub_2494DC714()
{
  return MEMORY[0x24BDB5780]();
}

uint64_t sub_2494DC720()
{
  return MEMORY[0x24BDB5790]();
}

uint64_t sub_2494DC72C()
{
  return MEMORY[0x24BDB5800]();
}

uint64_t sub_2494DC738()
{
  return MEMORY[0x24BDB5808]();
}

uint64_t sub_2494DC744()
{
  return MEMORY[0x24BDB5D40]();
}

uint64_t sub_2494DC750()
{
  return MEMORY[0x24BDB5DB0]();
}

uint64_t sub_2494DC75C()
{
  return MEMORY[0x24BDB5DD8]();
}

uint64_t sub_2494DC768()
{
  return MEMORY[0x24BDB5DF0]();
}

uint64_t sub_2494DC774()
{
  return MEMORY[0x24BDB5EF0]();
}

uint64_t sub_2494DC780()
{
  return MEMORY[0x24BDB5F00]();
}

uint64_t sub_2494DC78C()
{
  return MEMORY[0x24BDB5F50]();
}

uint64_t sub_2494DC798()
{
  return MEMORY[0x24BDB5FF0]();
}

uint64_t sub_2494DC7A4()
{
  return MEMORY[0x24BDB5FF8]();
}

uint64_t sub_2494DC7B0()
{
  return MEMORY[0x24BDB6000]();
}

uint64_t sub_2494DC7BC()
{
  return MEMORY[0x24BDB6018]();
}

uint64_t sub_2494DC7C8()
{
  return MEMORY[0x24BDB6098]();
}

uint64_t sub_2494DC7D4()
{
  return MEMORY[0x24BDB6150]();
}

uint64_t sub_2494DC7E0()
{
  return MEMORY[0x24BDB6168]();
}

uint64_t sub_2494DC7EC()
{
  return MEMORY[0x24BDB61F0]();
}

uint64_t sub_2494DC7F8()
{
  return MEMORY[0x24BDB6200]();
}

uint64_t sub_2494DC804()
{
  return MEMORY[0x24BDB63B0]();
}

uint64_t sub_2494DC810()
{
  return MEMORY[0x24BDCD320]();
}

uint64_t sub_2494DC81C()
{
  return MEMORY[0x24BDCD348]();
}

uint64_t sub_2494DC828()
{
  return MEMORY[0x24BDCD380]();
}

uint64_t sub_2494DC834()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_2494DC840()
{
  return MEMORY[0x24BEBB6E0]();
}

uint64_t sub_2494DC84C()
{
  return MEMORY[0x24BEBB6E8]();
}

uint64_t sub_2494DC858()
{
  return MEMORY[0x24BEBB720]();
}

uint64_t sub_2494DC864()
{
  return MEMORY[0x24BEBB728]();
}

uint64_t sub_2494DC870()
{
  return MEMORY[0x24BEBB738]();
}

uint64_t sub_2494DC87C()
{
  return MEMORY[0x24BEBB740]();
}

uint64_t sub_2494DC888()
{
  return MEMORY[0x24BEBB750]();
}

uint64_t sub_2494DC894()
{
  return MEMORY[0x24BEBB760]();
}

uint64_t sub_2494DC8A0()
{
  return MEMORY[0x24BEBB770]();
}

uint64_t sub_2494DC8AC()
{
  return MEMORY[0x24BEBBB70]();
}

uint64_t sub_2494DC8B8()
{
  return MEMORY[0x24BEBBB78]();
}

uint64_t sub_2494DC8C4()
{
  return MEMORY[0x24BEBBB80]();
}

uint64_t sub_2494DC8D0()
{
  return MEMORY[0x24BEBBB90]();
}

uint64_t sub_2494DC8DC()
{
  return MEMORY[0x24BEBBB98]();
}

uint64_t sub_2494DC8E8()
{
  return MEMORY[0x24BEBC898]();
}

uint64_t sub_2494DC8F4()
{
  return MEMORY[0x24BEBC8A0]();
}

uint64_t sub_2494DC900()
{
  return MEMORY[0x24BEBC8A8]();
}

uint64_t sub_2494DC90C()
{
  return MEMORY[0x24BEBC8B0]();
}

uint64_t sub_2494DC918()
{
  return MEMORY[0x24BEBC8C0]();
}

uint64_t sub_2494DC924()
{
  return MEMORY[0x24BEBC8C8]();
}

uint64_t sub_2494DC930()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_2494DC93C()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_2494DC948()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_2494DC954()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_2494DC960()
{
  return MEMORY[0x24BDB6620]();
}

uint64_t sub_2494DC96C()
{
  return MEMORY[0x24BDCF910]();
}

uint64_t sub_2494DC978()
{
  return MEMORY[0x24BDCF930]();
}

uint64_t sub_2494DC984()
{
  return MEMORY[0x24BDCF938]();
}

uint64_t sub_2494DC990()
{
  return MEMORY[0x24BDCF948]();
}

uint64_t sub_2494DC99C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_2494DC9A8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2494DC9B4()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_2494DC9C0()
{
  return MEMORY[0x24BDB6650]();
}

uint64_t sub_2494DC9CC()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_2494DC9D8()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_2494DC9E4()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_2494DC9F0()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_2494DC9FC()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_2494DCA08()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_2494DCA14()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_2494DCA20()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_2494DCA2C()
{
  return MEMORY[0x24BEE6DC8]();
}

uint64_t sub_2494DCA38()
{
  return MEMORY[0x24BEE6E08]();
}

uint64_t sub_2494DCA44()
{
  return MEMORY[0x24BEE6E10]();
}

uint64_t sub_2494DCA50()
{
  return MEMORY[0x24BEE2AE0]();
}

uint64_t sub_2494DCA5C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_2494DCA68()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_2494DCA74()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_2494DCA80()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_2494DCA8C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2494DCA98()
{
  return MEMORY[0x24BEE7110]();
}

uint64_t sub_2494DCAA4()
{
  return MEMORY[0x24BEE7118]();
}

uint64_t sub_2494DCAB0()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2494DCABC()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2494DCAC8()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2494DCAD4()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2494DCAE0()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2494DCAEC()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2494DCAF8()
{
  return MEMORY[0x24BEE4328]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
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

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

