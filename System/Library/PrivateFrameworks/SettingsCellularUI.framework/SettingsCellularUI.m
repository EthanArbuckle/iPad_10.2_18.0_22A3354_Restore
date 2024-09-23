id sub_2161C9714(void *a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id result;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t inited;
  void **v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD aBlock[6];

  v6 = sub_21623E1C4();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21623E1DC();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v38 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, sel_specifier);
  if (result)
  {
    v15 = result;
    v16 = objc_msgSend(result, sel_target);

    v42 = v10;
    v43 = v7;
    v40 = a2;
    v41 = v11;
    if (v16)
    {
      objc_opt_self();
      v17 = (void *)swift_dynamicCastObjCClass();
      if (v17)
      {
        v39 = v17;
        v16 = objc_msgSend(v17, sel_navigationItem);
LABEL_7:
        v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
        v19 = (void *)objc_opt_self();
        v20 = (void *)sub_21623E218();
        v21 = objc_msgSend(v19, sel_preferredFontForTextStyle_, v20);

        objc_msgSend(v18, sel_setFont_, v21);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254E349B0);
        inited = swift_initStackObject();
        v23 = (void **)MEMORY[0x24BEBB368];
        *(_OWORD *)(inited + 16) = xmmword_216246290;
        v24 = *v23;
        *(_QWORD *)(inited + 32) = *v23;
        v25 = (void *)objc_opt_self();
        v26 = v18;
        swift_bridgeObjectRetain();
        v27 = v24;
        v28 = objc_msgSend(v25, sel_labelColor);
        v29 = objc_msgSend(v28, sel_colorWithAlphaComponent_, a3);

        *(_QWORD *)(inited + 64) = sub_2161CAD48(0, &qword_254E349B8);
        *(_QWORD *)(inited + 40) = v29;
        sub_2161C9C00(inited, &qword_254E349E8, &qword_254E349F0, (uint64_t (*)(uint64_t))sub_2161CA508);
        v30 = objc_allocWithZone(MEMORY[0x24BDD1458]);
        v31 = (void *)sub_21623E218();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_2161CAD08(&qword_254E349C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_2162465A4);
        v32 = (void *)sub_21623E1F4();
        swift_bridgeObjectRelease();
        v33 = objc_msgSend(v30, sel_initWithString_attributes_, v31, v32);

        objc_msgSend(v26, sel_setAttributedText_, v33);
        sub_2161CAD48(0, &qword_254E349C8);
        v34 = (void *)sub_21623E26C();
        v35 = swift_allocObject();
        *(_QWORD *)(v35 + 16) = v16;
        *(_QWORD *)(v35 + 24) = v26;
        aBlock[4] = sub_2161CADAC;
        aBlock[5] = v35;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_2161C9D28;
        aBlock[3] = &block_descriptor;
        v36 = _Block_copy(aBlock);
        v37 = v16;
        swift_release();
        sub_21623E1D0();
        aBlock[0] = MEMORY[0x24BEE4AF8];
        sub_2161CAD08(&qword_254E349D0, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254E349D8);
        sub_2161CADE0(&qword_254E349E0, &qword_254E349D8, MEMORY[0x24BEE12C8]);
        sub_21623E284();
        MEMORY[0x2199F5E4C](0, v13, v9, v36);

        _Block_release(v36);
        (*(void (**)(char *, uint64_t))(v43 + 8))(v9, v6);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v41 + 8))(v13, v42);
      }
      swift_unknownObjectRelease();
      v16 = 0;
    }
    v39 = 0;
    goto LABEL_7;
  }
  __break(1u);
  return result;
}

unint64_t sub_2161C9C00(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = sub_21623E290();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2161CAE20(v11, (uint64_t)&v18, a3);
    v12 = v18;
    result = a4(v18);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v8[6] + 8 * result) = v12;
    result = (unint64_t)sub_2161CACA0(&v19, (_OWORD *)(v8[7] + 32 * result));
    v15 = v8[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
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

uint64_t sub_2161C9D28(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_2161C9D54()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v1 = (void *)sub_21623E17C();
  sub_2161C9C00(MEMORY[0x24BEE4AF8], &qword_254E349A0, &qword_254E349A8, (uint64_t (*)(uint64_t))sub_2161CA508);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_2161CAD08(&qword_254E34998, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_2162465E8);
  v2 = (id)sub_21623E1F4();
  swift_bridgeObjectRelease();
  objc_msgSend(v0, sel_openURL_options_completionHandler_, v1, v2, 0);

}

id sub_2161C9E98(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  objc_class *ObjectType;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v10 = (void *)sub_21623E218();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  v12 = v11;
  if (v12)

  return v12;
}

id sub_2161CA088()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2161CA0BC(uint64_t a1, uint64_t a2)
{
  return sub_2161CA218(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2161CA0D4(uint64_t a1, uint64_t a2)
{
  return sub_2161CA218(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2161CA0E8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_21623E224();
  *a2 = 0;
  return result;
}

uint64_t sub_2161CA15C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_21623E230();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2161CA1D8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_21623E23C();
  v2 = sub_21623E218();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2161CA218(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_21623E23C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2161CA254()
{
  sub_21623E23C();
  sub_21623E254();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2161CA294()
{
  uint64_t v0;

  sub_21623E23C();
  sub_21623E2B4();
  sub_21623E254();
  v0 = sub_21623E2C0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_2161CA308()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_21623E23C();
  v2 = v1;
  if (v0 == sub_21623E23C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_21623E2A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2161CA394@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_21623E23C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2161CA3BC()
{
  sub_2161CAD08(&qword_254E349C0, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_2162465A4);
  sub_2161CAD08(&qword_254E34A38, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_2162464F8);
  return sub_21623E29C();
}

uint64_t sub_2161CA440@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_21623E218();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2161CA484()
{
  sub_2161CAD08(&qword_254E34998, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_2162465E8);
  sub_2161CAD08(&qword_254E34A40, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_2162463D8);
  return sub_21623E29C();
}

unint64_t sub_2161CA508(uint64_t a1)
{
  uint64_t v2;

  sub_21623E23C();
  sub_21623E2B4();
  sub_21623E254();
  v2 = sub_21623E2C0();
  swift_bridgeObjectRelease();
  return sub_2161CA588(a1, v2);
}

unint64_t sub_2161CA588(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_21623E23C();
    v8 = v7;
    if (v6 == sub_21623E23C() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_21623E2A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_21623E23C();
          v15 = v14;
          if (v13 == sub_21623E23C() && v15 == v16)
            break;
          v18 = sub_21623E2A8();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_2161CA6FC()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  uint64_t ObjCClassFromMetadata;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21[6];
  _QWORD v22[2];

  v1 = v0;
  swift_getObjectType();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254E34978);
  v19 = *(_QWORD *)(v2 - 8);
  v20 = v2;
  MEMORY[0x24BDAC7A8]();
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21623E194();
  MEMORY[0x24BDAC7A8]();
  sub_21623E20C();
  MEMORY[0x24BDAC7A8]();
  objc_msgSend(v1, sel_setSelectionStyle_, 0);
  v5 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  objc_msgSend(v5, sel_sf_isChinaRegionCellularDevice);

  sub_21623E200();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v7 = (void *)objc_opt_self();
  v8 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_21623E188();
  v9 = sub_21623E248();
  v11 = v10;
  sub_21623E200();
  v12 = objc_msgSend(v7, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_21623E188();
  v22[0] = sub_21623E248();
  v22[1] = v13;
  v14 = (_QWORD *)swift_allocObject();
  v14[2] = v1;
  v14[3] = v9;
  v14[4] = v11;
  v15 = MEMORY[0x24BDAC7A8]();
  *(&v18 - 6) = v9;
  *(&v18 - 5) = v11;
  *(&v18 - 4) = (uint64_t)v22;
  *(&v18 - 3) = (uint64_t)sub_2161CAB58;
  *(&v18 - 2) = v15;
  v1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254E34980);
  sub_2161CADE0(&qword_254E34988, &qword_254E34980, MEMORY[0x24BE855C8]);
  sub_21623E1AC();
  swift_bridgeObjectRelease();
  sub_21623E1B8();
  v16 = v20;
  v21[3] = v20;
  v21[4] = sub_2161CADE0(&qword_254E34990, &qword_254E34978, MEMORY[0x24BDEFEA0]);
  __swift_allocate_boxed_opaque_existential_1(v21);
  sub_21623E1A0();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v16);
  MEMORY[0x2199F5E34](v21);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t type metadata accessor for SettingsCellularUIPlacardCell()
{
  return objc_opt_self();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199F65A8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_2161CAB2C()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_2161CAB58(double a1)
{
  uint64_t v1;

  return sub_2161C9714(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_2161CAB64()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return sub_21623E1E8();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199F65B4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
  sub_2161CACC4(a1, &qword_254E34A00);
}

_OWORD *sub_2161CACA0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_2161CACC4(a1, &qword_254E349F8);
}

void sub_2161CACC4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2161CAD08(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199F65C0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2161CAD48(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2161CAD80()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_2161CADAC()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + 16);
  if (result)
    return objc_msgSend(result, sel_setTitleView_, *(_QWORD *)(v0 + 24));
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

uint64_t sub_2161CADE0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199F65C0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2161CAE20(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2161CAE64()
{
  return sub_2161CAD08(&qword_254E34A08, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21624639C);
}

uint64_t sub_2161CAE90()
{
  return sub_2161CAD08(&qword_254E34A10, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_216246370);
}

uint64_t sub_2161CAEBC()
{
  return sub_2161CAD08(&qword_254E34A18, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_2162464BC);
}

uint64_t sub_2161CAEE8()
{
  return sub_2161CAD08(&qword_254E34A20, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_216246490);
}

uint64_t sub_2161CAF14()
{
  return sub_2161CAD08(&qword_254E34A28, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21624652C);
}

uint64_t sub_2161CAF40()
{
  return sub_2161CAD08(&qword_254E34A30, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21624640C);
}

uint64_t sub_2161CAF74()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void sub_2161CC238(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2161CC65C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_2161CE830(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161CE944(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161CEA9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161CEB4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161CEDE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161CEEF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161CF128(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161D3560(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_2161D43F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2161D521C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161D55F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161D5668(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161D7820(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2161D79E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161D8374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_253E970E0)
  {
    v2 = (void *)qword_253E970E0;
  }
  else
  {
    qword_253E970E0 = _sl_dlopen();
    v2 = (void *)qword_253E970E0;
    if (!qword_253E970E0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AnalyticsSendEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_1 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2161D8A3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161D9DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventSymbolLoc_block_invoke_0(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_253E96FD8)
  {
    v2 = (void *)qword_253E96FD8;
  }
  else
  {
    qword_253E96FD8 = _sl_dlopen();
    v2 = (void *)qword_253E96FD8;
    if (!qword_253E96FD8)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AnalyticsSendEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_253E96FD0 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2161E2B9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2161E33E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2161E3FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PSIsDataRoamingOptionAvailable()
{
  void *v0;
  uint64_t v1;

  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isCellularDataEnabled");

  return v1;
}

uint64_t PSIsCDMARoamingOptionAvailable()
{
  uint64_t v0;
  const void *v1;

  v0 = _CTServerConnectionCreate();
  if (v0)
  {
    v1 = (const void *)v0;
    _CTServerConnectionIsCDMAInternationalRoamingSettingAllowed();
    CFRelease(v1);
  }
  return 0;
}

uint64_t PSIsVoiceRoamingOptionAvailable()
{
  void *v0;
  uint64_t v1;

  +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "shouldShowVoiceRoamingSwitchForDefaultVoicePlan");

  return v1;
}

uint64_t PSIsDataRoamingEnabled()
{
  void *v0;
  uint64_t v1;

  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "getInternationalDataAccessStatus");

  return v1;
}

uint64_t PSIsVoiceRoamingEnabled()
{
  uint64_t v0;
  const void *v1;

  v0 = _CTServerConnectionCreate();
  if (v0)
  {
    v1 = (const void *)v0;
    _CTServerConnectionGetEnableOnlyHomeNetwork();
    CFRelease(v1);
  }
  return 1;
}

void PSSetVoiceRoamingEnabled()
{
  uint64_t v0;
  const void *v1;

  v0 = _CTServerConnectionCreate();
  if (v0)
  {
    v1 = (const void *)v0;
    _CTServerConnectionSetEnableOnlyHomeNetwork();
    CFRelease(v1);
  }
}

uint64_t PSIsDataRoamingEnabledForService(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "getInternationalDataAccessStatus:", v1);

  return v3;
}

void PSSetDataRoamingEnabled(uint64_t a1)
{
  id v2;

  CFPreferencesSetAppValue(CFSTR("DeferredSMSMessageCount"), 0, CFSTR("com.apple.springboard"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInternationalDataAccessStatus:", a1);

}

void PSSetDataRoamingEnabledForService(void *a1, uint64_t a2)
{
  id v3;
  id v4;

  v3 = a1;
  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternationalDataAccessStatus:status:", v3, a2);

}

void PSSetCDMARoamingEnabled()
{
  uint64_t v0;
  const void *v1;

  v0 = _CTServerConnectionCreate();
  if (v0)
  {
    v1 = (const void *)v0;
    _CTServerConnectionSetCDMAInternationalRoaming();
    CFRelease(v1);
  }
}

uint64_t PSShouldIncludeMMSFooterNote()
{
  void *v0;
  int v1;

  +[PSUICoreTelephonyCarrierBundleCache sharedInstance](PSUICoreTelephonyCarrierBundleCache, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isMMSOnWhileRoamingForActiveDataPlan");

  if (CPCanSendMMS())
    return v1 ^ 1u;
  else
    return 0;
}

id PSDataRoamingSpecifiers(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v1 = (void *)MEMORY[0x24BE75590];
  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = a1;
  objc_msgSend(v2, "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DATA_ROAMING_TOGGLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v5, v3, sel_setDataRoamingEnabled_specifier_, sel_getDataRoamingStatus_, 0, 6, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIdentifier:", CFSTR("DATA_ROAMING"));
  v7 = (void *)MEMORY[0x24BDD16E0];
  +[PSUICoreTelephonyDataCache sharedInstance](PSUICoreTelephonyDataCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SettingsCellularUtils singleSIMUIServiceDescriptor](SettingsCellularUtils, "singleSIMUIServiceDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "hideDataRoaming:", v9) ^ 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v10, *MEMORY[0x24BE75A18]);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObjects:", v6, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id PSCDMARoamingSpecifiers(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v1 = (void *)MEMORY[0x24BE75590];
  v2 = a1;
  objc_msgSend(v1, "groupSpecifierWithName:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", CFSTR("CDMA_ROAMING_GROUP"), *MEMORY[0x24BE75AC0]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CDMA_ROAMING_EXPLANATION"), &stru_24D5028C8, CFSTR("Cellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", v5, *MEMORY[0x24BE75A68]);

  +[PSUICellularPlanManagerCache sharedInstance](PSUICellularPlanManagerCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedPlanItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isBackedByCellularPlan") ^ 1;

  v9 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CDMA_ROAMING_TOGGLE"), &stru_24D5028C8, CFSTR("Cellular"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v11, v2, sel_setCDMARoamingEnabled_specifier_, sel_getCDMARoamingStatus_, 0, 6, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setIdentifier:", CFSTR("CDMA_ROAMING"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProperty:forKey:", v13, *MEMORY[0x24BE75A18]);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v3, v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id PSRoamingSubMenuSpecifiers(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = (void *)MEMORY[0x24BE75590];
  v2 = a1;
  objc_msgSend(v1, "emptyGroupSpecifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ROAMING_LINK"), &stru_24D5028C8, CFSTR("Cellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v6, v2, 0, sel_roamingSettingsDescription_, objc_opt_class(), 2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setIdentifier:", CFSTR("ROAMING_LINK"));
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v3, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_2161E877C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161EA8F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2161EBF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCLLocationManagerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLLocationManagerClass_softClass;
  v7 = getCLLocationManagerClass_softClass;
  if (!getCLLocationManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke;
    v3[3] = &unk_24D5018D0;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2161EBFC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2161EC48C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CoreLocationLibrary()
{
  uint64_t v0;
  void *v2;

  if (CoreLocationLibraryCore_frameworkLibrary)
    return CoreLocationLibraryCore_frameworkLibrary;
  CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CoreLocationLibraryCore_frameworkLibrary;
  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

PSUISubscriptionContextMenusGroup *__getCLLocationManagerClass_block_invoke(uint64_t a1)
{
  PSUISubscriptionContextMenusGroup *result;
  PSUISubscriptionContextMenusGroup *v3;
  SEL v4;
  id v5;

  CoreLocationLibrary();
  result = (PSUISubscriptionContextMenusGroup *)objc_getClass("CLLocationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLLocationManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (PSUISubscriptionContextMenusGroup *)abort_report_np();
    return -[PSUISubscriptionContextMenusGroup initWithFactory:](v3, v4, v5);
  }
  return result;
}

void sub_2161EE378(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_2161F1A90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161F1B70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161F1BFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161F1EC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161F1FA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161F2080(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161F2338(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161F2E34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2161F2FA0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161F3254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_2161F39D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2161F40E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161F44FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161F4900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PSAnalyticsSendEvent(void *a1)
{
  id v1;
  void (*v2)(id, _QWORD);
  _Unwind_Exception *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v1 = a1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = (void (*)(id, _QWORD))_MergedGlobals_61;
  v8 = _MergedGlobals_61;
  if (!_MergedGlobals_61)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __getAnalyticsSendEventSymbolLoc_block_invoke_1;
    v4[3] = &unk_24D5018D0;
    v4[4] = &v5;
    __getAnalyticsSendEventSymbolLoc_block_invoke_1((uint64_t)v4);
    v2 = (void (*)(id, _QWORD))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    dlerror();
    v3 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  v2(v1, MEMORY[0x24BDBD1B8]);

}

void sub_2161F4EBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventSymbolLoc_block_invoke_1(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_253E97008)
  {
    v2 = (void *)qword_253E97008;
  }
  else
  {
    qword_253E97008 = _sl_dlopen();
    v2 = (void *)qword_253E97008;
    if (!qword_253E97008)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AnalyticsSendEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_61 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t MobileStoreUILibrary()
{
  uint64_t v0;
  void *v2;

  if (qword_253E97010)
    return qword_253E97010;
  qword_253E97010 = _sl_dlopen();
  v0 = qword_253E97010;
  if (!qword_253E97010)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_2161F560C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2161F752C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2161FB630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_2161FBA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  uint64_t v29;

  _Block_object_dispose((const void *)(v29 - 136), 8);
  _Unwind_Resume(a1);
}

Class __getRemoteUIControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_253E97040)
  {
    qword_253E97040 = _sl_dlopen();
    if (!qword_253E97040)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("RemoteUIController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  _MergedGlobals_63 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2161FDB60(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

Class __getSUUIItemOfferButtonClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!_MergedGlobals_1_2)
  {
    _MergedGlobals_1_2 = _sl_dlopen();
    if (!_MergedGlobals_1_2)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SUUIItemOfferButton");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_253E97110 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2161FF81C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id getCLLocationManagerClass_0()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLLocationManagerClass_softClass_0;
  v7 = getCLLocationManagerClass_softClass_0;
  if (!getCLLocationManagerClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke_0;
    v3[3] = &unk_24D5018D0;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_216203F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2162060D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  id *v27;
  uint64_t v28;

  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v28 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_2162078C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CoreLocationLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (CoreLocationLibraryCore_frameworkLibrary_0)
    return CoreLocationLibraryCore_frameworkLibrary_0;
  CoreLocationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = CoreLocationLibraryCore_frameworkLibrary_0;
  if (!CoreLocationLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

PSUIPlanPendingTransferDetailController *__getCLLocationManagerClass_block_invoke_0(uint64_t a1)
{
  PSUIPlanPendingTransferDetailController *result;
  PSUIPlanPendingTransferDetailController *v3;
  SEL v4;

  CoreLocationLibrary_0();
  result = (PSUIPlanPendingTransferDetailController *)objc_getClass("CLLocationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLLocationManagerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (PSUIPlanPendingTransferDetailController *)abort_report_np();
    return -[PSUIPlanPendingTransferDetailController init](v3, v4);
  }
  return result;
}

void sub_216209068(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_2162099B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216209B74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216209E70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216209FC8(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_21620A18C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21620A2E4(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_21620A638(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21620A958(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216210460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_216211118(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getCTCarrierSpaceClientClass_block_invoke(uint64_t a1)
{
  Class result;

  CTCarrierSpaceLibrary();
  result = objc_getClass("CTCarrierSpaceClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCTCarrierSpaceClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)CTCarrierSpaceLibrary();
  }
  return result;
}

uint64_t CTCarrierSpaceLibrary()
{
  uint64_t v0;
  void *v2;

  if (CTCarrierSpaceLibraryCore_frameworkLibrary)
    return CTCarrierSpaceLibraryCore_frameworkLibrary;
  CTCarrierSpaceLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = CTCarrierSpaceLibraryCore_frameworkLibrary;
  if (!CTCarrierSpaceLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_216214850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_216214B24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getCLLocationManagerClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_253E97080)
  {
    qword_253E97080 = _sl_dlopen();
    if (!qword_253E97080)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CLLocationManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  _MergedGlobals_67 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void PSAnalyticsSendEvent_0(void *a1, void *a2)
{
  id v3;
  id v4;
  void (*v5)(id, id);
  _Unwind_Exception *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v3 = a1;
  v4 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v5 = (void (*)(id, id))_MergedGlobals_1_3;
  v11 = _MergedGlobals_1_3;
  if (!_MergedGlobals_1_3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __getAnalyticsSendEventSymbolLoc_block_invoke_2;
    v7[3] = &unk_24D5018D0;
    v7[4] = &v8;
    __getAnalyticsSendEventSymbolLoc_block_invoke_2((uint64_t)v7);
    v5 = (void (*)(id, id))v9[3];
  }
  _Block_object_dispose(&v8, 8);
  if (!v5)
  {
    dlerror();
    v6 = (_Unwind_Exception *)abort_report_np();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  v5(v3, v4);

}

void *__getAnalyticsSendEventSymbolLoc_block_invoke_2(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_253E97120)
  {
    v2 = (void *)qword_253E97120;
  }
  else
  {
    qword_253E97120 = _sl_dlopen();
    v2 = (void *)qword_253E97120;
    if (!qword_253E97120)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AnalyticsSendEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_1_3 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21621668C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_216216710(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2162167A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21621680C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_216216A30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_216216B3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_216216C5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_216216EA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_216217308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2162174A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2162182B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCTCarrierSpaceClientClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_253E97130)
  {
    qword_253E97130 = _sl_dlopen();
    if (!qword_253E97130)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CTCarrierSpaceClient");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  _MergedGlobals_1_4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getAnalyticsSendEventSymbolLoc_block_invoke_3(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_253E97140)
  {
    v2 = (void *)qword_253E97140;
  }
  else
  {
    qword_253E97140 = _sl_dlopen();
    v2 = (void *)qword_253E97140;
    if (!qword_253E97140)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AnalyticsSendEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  off_253E97138 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRemoteUIControllerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!qword_253E97150)
  {
    qword_253E97150 = _sl_dlopen();
    if (!qword_253E97150)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("RemoteUIController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  qword_253E97148 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_216219278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_216219498(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21621A6BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;

  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_21621AA40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_21621AC7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621B57C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621B6C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621BAD4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621BBD0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621BCC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621C030(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621C12C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621C24C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621C568(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621C648(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621C98C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621CA6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621CD94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621CE84(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621D124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21621D218(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621D524(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621D604(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21621D88C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216228F48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventSymbolLoc_block_invoke_4(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (qword_253E97160)
  {
    v2 = (void *)qword_253E97160;
  }
  else
  {
    qword_253E97160 = _sl_dlopen();
    v2 = (void *)qword_253E97160;
    if (!qword_253E97160)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "AnalyticsSendEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  _MergedGlobals_1_5 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id PSUIGetPlanSubscriptionStatus(int a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(a1)
  {
    case 0:
    case 8:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("CELLULAR_ACCOUNT_ACTIVE");
      goto LABEL_6;
    case 1:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("CELLULAR_ACCOUNT_EXPIRED");
      goto LABEL_6;
    case 2:
    case 6:
    case 7:
    case 9:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("CELLULAR_ACCOUNT_ACTIVATING");
      goto LABEL_6;
    case 3:
    case 4:
    case 5:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("CELLULAR_ACCOUNT_INVALIDPLAN");
LABEL_6:
      objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_24D5028C8, CFSTR("Cellular"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

id PSUIFormatDataUsage(double a1, double a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE85668], "loggerWithCategory:", CFSTR("PlanManagerCache"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v5;
    v21 = 2112;
    v22 = v6;
    _os_log_impl(&dword_2161C6000, v4, OS_LOG_TYPE_DEFAULT, "DataUsage: data: %@ bytes left for %@ seconds", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BE856B8], "usageSizeString:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2 <= 86400.0)
  {
    if (a2 <= 3600.0)
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (a2 <= 0.0)
      {
        v17 = CFSTR("CELLULAR_PLAN_DATA_USAGE_%@_LEFT");
        goto LABEL_14;
      }
    }
    else
    {
      v8 = (int)(a2 / 3600.0);
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if ((int)v8 >= 2)
      {
        v11 = CFSTR("CELLULAR_PLAN_DATA_USAGE_%@_LEFT_FOR_%@_HOURS");
        goto LABEL_9;
      }
    }
    v17 = CFSTR("CELLULAR_PLAN_DATA_USAGE_%@_LEFT_FOR_ONE_HOUR");
LABEL_14:
    objc_msgSend(v10, "localizedStringForKey:value:table:", v17, &stru_24D5028C8, CFSTR("Cellular"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v12, v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v8 = (int)(a2 / 86400.0);
  v9 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((int)v8 < 2)
  {
    v17 = CFSTR("CELLULAR_PLAN_DATA_USAGE_%@_LEFT_FOR_ONE_DAY");
    goto LABEL_14;
  }
  v11 = CFSTR("CELLULAR_PLAN_DATA_USAGE_%@_LEFT_FOR_%@_DAYS");
LABEL_9:
  objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_24D5028C8, CFSTR("Cellular"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDD16F0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringFromNumber:numberStyle:", v14, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v12, v7, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_15:
  return v16;
}

id PSUIFormatPlanStatusForPlan(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  uint64_t v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "plan");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "plan");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dataUsage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "plan");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "status") || !v4)
    {

    }
    else
    {
      v6 = objc_msgSend(v4, "count");

      if (v6)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        v7 = v4;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        v9 = 0.0;
        v10 = 0.0;
        v11 = 0.0;
        if (v8)
        {
          v12 = v8;
          v13 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v35 != v13)
                objc_enumerationMutation(v7);
              v15 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              objc_msgSend(v15, "dataCapacity");
              v11 = v11 + v16;
              objc_msgSend(v15, "dataUsed");
              v10 = v10 + v17;
            }
            v12 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          }
          while (v12);
        }

        if (v11 - v10 >= 0.0)
          v9 = v11 - v10;
        objc_msgSend(v1, "plan");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timestamp");
        if (v19 > 0.0)
        {
          objc_msgSend(v1, "plan");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "billingEndDate");
          if (v21 <= 0.0)
          {
            PSUIFormatDataUsage(v9, 0.0);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v1, "plan");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "billingEndDate");
            v24 = v23;
            objc_msgSend(v1, "plan");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "timestamp");
            PSUIFormatDataUsage(v9, v24 - v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

          }
          goto LABEL_21;
        }
        PSUIFormatDataUsage(v9, 0.0);
        v28 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v27 = (void *)v28;
LABEL_21:

        goto LABEL_22;
      }
    }
    objc_msgSend(v1, "plan");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PSUIGetPlanSubscriptionStatus(objc_msgSend(v18, "status"));
    v28 = objc_claimAutoreleasedReturnValue();
    goto LABEL_20;
  }
  v27 = 0;
LABEL_22:
  if (objc_msgSend(v1, "type") == 2 || objc_msgSend(v1, "type") == 3)
  {
    v29 = v27;
  }
  else
  {
    v30 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_STATUS_SIM_CARD_AND_STATUS"), &stru_24D5028C8, CFSTR("Cellular"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", v32, v27);
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v29;
}

void sub_21622BE58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21622C300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21622CA30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21622DF98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21622E078(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21622E198(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21622E380(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21622E6D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21622EC38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21622EEC4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21622F500(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21622F888(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21622F9EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21622FB3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21622FD50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21622FE58(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21623016C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_216230344(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getCLLocationManagerClass_1()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getCLLocationManagerClass_softClass_1;
  v7 = getCLLocationManagerClass_softClass_1;
  if (!getCLLocationManagerClass_softClass_1)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getCLLocationManagerClass_block_invoke_2;
    v3[3] = &unk_24D5018D0;
    v3[4] = &v4;
    __getCLLocationManagerClass_block_invoke_2((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_216230D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCLLocationManagerClass_block_invoke_2(uint64_t a1)
{
  Class result;

  CoreLocationLibrary_1();
  result = objc_getClass("CLLocationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCLLocationManagerClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    return (Class)CoreLocationLibrary_1();
  }
  return result;
}

uint64_t CoreLocationLibrary_1()
{
  uint64_t v0;
  void *v2;

  if (CoreLocationLibraryCore_frameworkLibrary_1)
    return CoreLocationLibraryCore_frameworkLibrary_1;
  CoreLocationLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  v0 = CoreLocationLibraryCore_frameworkLibrary_1;
  if (!CoreLocationLibraryCore_frameworkLibrary_1)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_2162367F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2162383B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21623B9F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void __getTUCallCapabilitiesClass_block_invoke(uint64_t a1)
{
  TelephonyUtilitiesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("TUCallCapabilities");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    _MergedGlobals_1_6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    TelephonyUtilitiesLibrary();
  }
}

void TelephonyUtilitiesLibrary()
{
  void *v0;

  if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
  {
    TelephonyUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!TelephonyUtilitiesLibraryCore_frameworkLibrary)
    {
      v0 = (void *)abort_report_np();
      free(v0);
    }
  }
}

Class __getTUHandleClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  TelephonyUtilitiesLibrary();
  result = objc_getClass("TUHandle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_253E97170 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__getTUCallProviderManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getTUCallProviderManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  TelephonyUtilitiesLibrary();
  result = objc_getClass("TUCallProviderManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_253E97178 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = abort_report_np();
    return (Class)__getTUDialRequestClass_block_invoke(v3);
  }
  return result;
}

PSUICarrierSpaceMyAccountWebViewController *__getTUDialRequestClass_block_invoke(uint64_t a1)
{
  PSUICarrierSpaceMyAccountWebViewController *result;
  PSUICarrierSpaceMyAccountWebViewController *v3;
  SEL v4;
  id v5;

  TelephonyUtilitiesLibrary();
  result = (PSUICarrierSpaceMyAccountWebViewController *)objc_getClass("TUDialRequest");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    qword_253E97180 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (PSUICarrierSpaceMyAccountWebViewController *)abort_report_np();
    return -[PSUICarrierSpaceMyAccountWebViewController initWithURLString:](v3, v4, v5);
  }
  return result;
}

uint64_t sub_21623E17C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_21623E188()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_21623E194()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_21623E1A0()
{
  return MEMORY[0x24BDEFE58]();
}

uint64_t sub_21623E1AC()
{
  return MEMORY[0x24BDEFE68]();
}

uint64_t sub_21623E1B8()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_21623E1C4()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21623E1D0()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21623E1DC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21623E1E8()
{
  return MEMORY[0x24BE855A8]();
}

uint64_t sub_21623E1F4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21623E200()
{
  return MEMORY[0x24BDCF8D8]();
}

uint64_t sub_21623E20C()
{
  return MEMORY[0x24BDCF978]();
}

uint64_t sub_21623E218()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21623E224()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_21623E230()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_21623E23C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21623E248()
{
  return MEMORY[0x24BDCFB20]();
}

uint64_t sub_21623E254()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21623E260()
{
  return MEMORY[0x24BEBCBF0]();
}

uint64_t sub_21623E26C()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21623E278()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21623E284()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21623E290()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21623E29C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_21623E2A8()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21623E2B4()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21623E2C0()
{
  return MEMORY[0x24BEE4328]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

uint64_t CFPhoneNumberCreate()
{
  return MEMORY[0x24BE1FA98]();
}

uint64_t CFPhoneNumberCreateString()
{
  return MEMORY[0x24BE1FAA0]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CPCanSendMMS()
{
  return MEMORY[0x24BE04640]();
}

uint64_t CTDataRateAsString()
{
  return MEMORY[0x24BDC25C8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67160]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x24BDD0FE0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

uint64_t PSAbbreviatedFormattedTimeStringWithDays()
{
  return MEMORY[0x24BE75848]();
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return MEMORY[0x24BE758F0]();
}

uint64_t PSFormattedTimeStringWithDays()
{
  return MEMORY[0x24BE75A80]();
}

uint64_t PSIsTelephonyDead()
{
  return MEMORY[0x24BE75B38]();
}

uint64_t PSSimIsRequired()
{
  return MEMORY[0x24BE75C70]();
}

uint64_t PSTimeStringIsShortened()
{
  return MEMORY[0x24BE75D48]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x24BE85770]();
}

uint64_t SFRuntimeAbsoluteFilePathForPath()
{
  return MEMORY[0x24BE857A0]();
}

uint64_t ScreenScale()
{
  return MEMORY[0x24BE75DE0]();
}

uint64_t SpecifiersFromPlist()
{
  return MEMORY[0x24BE75DF8]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BEBE2E0](image);
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x24BE679D8]();
}

uint64_t WiFiManagerClientSetProperty()
{
  return MEMORY[0x24BE67B38]();
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

uint64_t _CTServerConnectionCopyReliableNetworkFallbackSettings()
{
  return MEMORY[0x24BDC2860]();
}

uint64_t _CTServerConnectionCopyStartDateOfCellularDataUsageRecords()
{
  return MEMORY[0x24BDC2868]();
}

uint64_t _CTServerConnectionCreate()
{
  return MEMORY[0x24BDC2878]();
}

uint64_t _CTServerConnectionCreateOnTargetQueue()
{
  return MEMORY[0x24BDC2888]();
}

uint64_t _CTServerConnectionEraseCellularDataUsageRecords()
{
  return MEMORY[0x24BDC28B8]();
}

uint64_t _CTServerConnectionGetCDMAInternationalRoaming()
{
  return MEMORY[0x24BDC28C8]();
}

uint64_t _CTServerConnectionGetCellularDataIsEnabled()
{
  return MEMORY[0x24BDC28D0]();
}

uint64_t _CTServerConnectionGetEnableOnlyHomeNetwork()
{
  return MEMORY[0x24BDC28E8]();
}

uint64_t _CTServerConnectionIsCDMAInternationalRoamingSettingAllowed()
{
  return MEMORY[0x24BDC2918]();
}

uint64_t _CTServerConnectionSetCDMAInternationalRoaming()
{
  return MEMORY[0x24BDC2950]();
}

uint64_t _CTServerConnectionSetCellularDataIsEnabled()
{
  return MEMORY[0x24BDC2958]();
}

uint64_t _CTServerConnectionSetEnableOnlyHomeNetwork()
{
  return MEMORY[0x24BDC2968]();
}

uint64_t _CTServerConnectionSetReliableNetworkFallbackToCellular()
{
  return MEMORY[0x24BDC2970]();
}

uint64_t _CTServerConnectionUnregisterForAllNotifications()
{
  return MEMORY[0x24BDC2988]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x24BDD19C0](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
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

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

