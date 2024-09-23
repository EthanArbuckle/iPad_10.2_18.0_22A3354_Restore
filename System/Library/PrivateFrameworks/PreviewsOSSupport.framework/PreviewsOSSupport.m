id UVShellConnectionInterface(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE0F9F8], "interfaceWithIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2557DD7E8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setServer:", v2);

  objc_msgSend(MEMORY[0x24BE0BE50], "protocolForProtocol:", &unk_2557DD7E8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setClient:", v3);

  return v1;
}

uint64_t ClientRole.handleActivation(_:)(void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (_QWORD *)((char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = objc_msgSend(a1, sel_remoteToken);
  v7 = *(int *)(v3 + 48);
  v8 = (char *)v5 + v7;
  v9 = (char *)v1 + v7;
  *v5 = *v1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7208);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
  if (v6)
  {
    v13[1] = v6;
    sub_224D5C9C0(&qword_2557D7218, &qword_2557D7208, MEMORY[0x24BE76D88]);
    sub_224D822C4();
  }
  else
  {
    sub_224D5A5F4();
    v6 = (id)swift_allocError();
    sub_224D5C9C0(&qword_2557D7218, &qword_2557D7208, MEMORY[0x24BE76D88]);
    sub_224D822B8();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v8, v10);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22768C8FC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_224D5A5F4()
{
  unint64_t result;

  result = qword_2557D7210;
  if (!qword_2557D7210)
  {
    result = MEMORY[0x22768C914](&unk_224D83180, &type metadata for ClientRole.NoRemoteTokenAfterActivation);
    atomic_store(result, (unint64_t *)&qword_2557D7210);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x22768C908](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

Swift::Void __swiftcall ClientRole.handleInvalidation()()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200);
  v1 = MEMORY[0x24BDAC7A8]();
  v3 = (uint64_t *)((char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = *(int *)(v1 + 48);
  v5 = (char *)v3 + v4;
  v6 = (char *)v0 + v4;
  *v3 = *v0;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7208);
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  sub_224D5C9C0(&qword_2557D7218, &qword_2557D7208, MEMORY[0x24BE76D88]);
  sub_224D822AC();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
}

uint64_t sub_224D5A79C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200);
  v1 = MEMORY[0x24BDAC7A8]();
  v3 = (uint64_t *)((char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = *(int *)(v1 + 48);
  v5 = (char *)v3 + v4;
  v6 = (char *)v0 + v4;
  *v3 = *v0;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7208);
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  sub_224D5C9C0(&qword_2557D7218, &qword_2557D7208, MEMORY[0x24BE76D88]);
  sub_224D822AC();
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v5, v7);
}

uint64_t ServerRole.clientContext.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_224D82264();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

id ServerRole.clientAuditToken.getter()
{
  uint64_t v0;

  return *(id *)(v0 + *(int *)(type metadata accessor for ServerRole(0) + 20));
}

uint64_t ShellConnection<>.serverAuditToken.getter()
{
  uint64_t v0;
  _QWORD *v1;

  v1[3] = v0;
  v1[4] = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200);
  v1[5] = swift_task_alloc();
  type metadata accessor for ClientRole(0);
  v1[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_224D5A994()
{
  uint64_t v0;
  uint64_t *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v2 = *(_QWORD **)(v0 + 40);
  v1 = *(uint64_t **)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  sub_224D5C910(*(_QWORD *)(v0 + 24) + *(_QWORD *)(**(_QWORD **)(v0 + 24) + 136), (uint64_t)v1, type metadata accessor for ClientRole);
  v4 = *(int *)(v3 + 48);
  *(_DWORD *)(v0 + 96) = v4;
  v5 = (char *)v1 + v4;
  v6 = (char *)v2 + v4;
  v7 = *v1;
  *(_QWORD *)(v0 + 56) = v7;
  *v2 = v7;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7208);
  *(_QWORD *)(v0 + 64) = v8;
  v9 = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v0 + 72) = v9;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v6, v5, v8);
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v10;
  sub_224D5BE18(0, &qword_2557D7228);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7230);
  *v10 = v0;
  v10[1] = sub_224D5AAA0;
  return sub_224D82720();
}

uint64_t sub_224D5AAA0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_224D5AB10()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 40) + *(int *)(v0 + 96), *(_QWORD *)(v0 + 64));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_224D5AB74()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 72) + 8))(*(_QWORD *)(v0 + 40) + *(int *)(v0 + 96), *(_QWORD *)(v0 + 64));
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t static ShellConnection<>.createByMachLookup(for:variant:clientContext:)(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  return sub_224D5BA60(a1, a2, a3);
}

uint64_t static ShellConnection<>.createByEndpoint(_:for:clientContext:)(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  return sub_224D5B79C(a1, a2, a3);
}

void sub_224D5ABF0(void *a1)
{
  void *v2;
  id v3;

  v2 = (void *)sub_224D821E0();
  v3 = (id)sub_224D82600();
  objc_msgSend(a1, sel_encodeObject_forKey_, v2, v3);

}

uint64_t sub_224D5AC64(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);
  return swift_unknownObjectRelease();
}

unint64_t sub_224D5ACA0()
{
  sub_224D827D4();
  swift_bridgeObjectRelease();
  ShellService.description.getter();
  sub_224D8263C();
  swift_bridgeObjectRelease();
  sub_224D8263C();
  sub_224D5CA3C(0, &qword_2557D7540, (uint64_t (*)(_QWORD))_s17MachLookupFailureVMa);
  sub_224D81F88();
  sub_224D5D0F4();
  sub_224D82840();
  sub_224D8263C();
  swift_bridgeObjectRelease();
  sub_224D8263C();
  return 0xD000000000000022;
}

uint64_t sub_224D5AD9C()
{
  uint64_t v0;
  uint64_t v1;

  sub_224D5CA3C(0, &qword_2557D7540, (uint64_t (*)(_QWORD))_s17MachLookupFailureVMa);
  ShellService.Domain.machName(for:)(v0 + *(int *)(v1 + 20));
  sub_224D8263C();
  swift_bridgeObjectRelease();
  return 0x6D616E206863614DLL;
}

uint64_t sub_224D5AE50()
{
  return 0;
}

uint64_t sub_224D5AE80()
{
  sub_224D5CA88(&qword_2557D7678, &qword_2557D7540, (uint64_t (*)(_QWORD))_s17MachLookupFailureVMa, (uint64_t)&unk_224D833D0);
  return sub_224D82354();
}

uint64_t sub_224D5AED4()
{
  sub_224D5CA88(&qword_2557D7678, &qword_2557D7540, (uint64_t (*)(_QWORD))_s17MachLookupFailureVMa, (uint64_t)&unk_224D833D0);
  return sub_224D82330();
}

unint64_t sub_224D5AF1C()
{
  sub_224D827D4();
  swift_bridgeObjectRelease();
  ShellService.description.getter();
  sub_224D8263C();
  swift_bridgeObjectRelease();
  return 0xD00000000000002FLL;
}

uint64_t sub_224D5AF9C()
{
  uint64_t v0;
  id v1;
  id v2;

  v1 = *(id *)(v0 + 8);
  v2 = objc_msgSend(v1, sel_description);
  sub_224D8260C();

  sub_224D8263C();
  swift_bridgeObjectRelease();
  return 0x746E696F70646E45;
}

uint64_t sub_224D5B040()
{
  sub_224D5CA88((unint64_t *)&unk_2557D7680, &qword_2557D7520, (uint64_t (*)(_QWORD))_s25EndpointConnectionFailureVMa, (uint64_t)&unk_224D832C8);
  return sub_224D82354();
}

uint64_t sub_224D5B088()
{
  sub_224D5CA88((unint64_t *)&unk_2557D7680, &qword_2557D7520, (uint64_t (*)(_QWORD))_s25EndpointConnectionFailureVMa, (uint64_t)&unk_224D832C8);
  return sub_224D82330();
}

_QWORD *ShellConnection<>.init(connection:context:service:)(void *a1, void *a2, unsigned __int8 *a3)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t ObjCClassFromMetadata;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  int v31;
  void *v32;
  id v33;
  _OWORD v34[2];
  _BYTE v35[24];
  uint64_t v36;

  v29 = a1;
  v30 = type metadata accessor for ServerRole(0);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_224D8209C();
  v27 = *(_QWORD *)(v7 - 8);
  v28 = v7;
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7238);
  MEMORY[0x24BDAC7A8]();
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_224D82264();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8]();
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = *a3;
  sub_224D5BE18(0, (unint64_t *)&unk_2557D7240);
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v17 = (void *)sub_224D82600();
  v32 = a2;
  v18 = objc_msgSend(a2, sel_decodeObjectOfClass_forKey_, ObjCClassFromMetadata, v17);

  if (v18)
  {
    sub_224D827A4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v34, 0, sizeof(v34));
  }
  v19 = v30;
  sub_224D5BE50((uint64_t)v34, (uint64_t)v35);
  if (!v36)
  {
    sub_224D5BE98((uint64_t)v35, (uint64_t *)&unk_2557D8350);
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_10:
    v25 = v29;
    v20 = 0;
    goto LABEL_11;
  }
  v20 = v33;
  if (!v33)
  {
    v25 = v29;
LABEL_11:
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
    _s17PreviewsOSSupport15JITSetupPayloadV17propertyListValue0A12FoundationOS08PropertyF0Vvg_0();
    sub_224D5BE98((uint64_t)v11, &qword_2557D7238);
    goto LABEL_12;
  }
  v21 = v33;
  sub_224D82768();

  sub_224D82084();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v9, v28);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v11, 0, 1, v12);
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
  v25 = v29;
LABEL_12:
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v6, v15, v12);
  v22 = v25;
  *(_QWORD *)&v6[*(int *)(v19 + 20)] = objc_msgSend(v22, sel_remoteToken);
  swift_allocObject();
  v23 = sub_224D5BED4(v22, v31, (uint64_t)v6, type metadata accessor for ServerRole, &qword_2557D74A8, (uint64_t *)&unk_2557D74B0, (uint64_t)sub_224D5C954);
  swift_unknownObjectRelease();

  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  return v23;
}

id ShellConnection<>.clientAuditToken.getter()
{
  uint64_t v0;

  return objc_retain(*(id *)(v0
                           + *(_QWORD *)(*(_QWORD *)v0 + 136)
                           + *(int *)(type metadata accessor for ServerRole(0) + 20)));
}

uint64_t ShellConnection<>.clientContext.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 136);
  v4 = sub_224D82264();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_224D5B4D8(uint64_t a1, id *a2)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200);
  MEMORY[0x24BDAC7A8]();
  v5 = (uint64_t *)((char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  objc_msgSend(a2[4], sel_invalidate);
  v6 = (id *)((char *)a2 + *((_QWORD *)*a2 + 17));
  v7 = *(int *)(v3 + 48);
  v8 = (char *)v5 + v7;
  v9 = (char *)v6 + v7;
  *v5 = *v6;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7208);
  v11 = *(_QWORD *)(v10 - 8);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
  v12 = MEMORY[0x24BE76D88];
  sub_224D5C9C0(&qword_2557D7218, &qword_2557D7208, MEMORY[0x24BE76D88]);
  sub_224D822AC();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D74A0);
  sub_224D5C9C0(qword_2557D7ED0, &qword_2557D74A0, v12);
  return sub_224D822AC();
}

uint64_t sub_224D5B670(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a2 + 32), sel_invalidate);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D74A0);
  sub_224D5C9C0(qword_2557D7ED0, &qword_2557D74A0, MEMORY[0x24BE76D88]);
  return sub_224D822AC();
}

uint64_t _s17PreviewsOSSupport10ClientRoleV11descriptionSSvgZ_0()
{
  return 0x746E65696C63;
}

uint64_t type metadata accessor for ServerRole(uint64_t a1)
{
  return sub_224D5B768(a1, qword_2557D7340);
}

uint64_t _s17PreviewsOSSupport10ServerRoleV11descriptionSSvgZ_0()
{
  return 0x726576726573;
}

uint64_t type metadata accessor for ClientRole(uint64_t a1)
{
  return sub_224D5B768(a1, (uint64_t *)&unk_2557D72A8);
}

uint64_t sub_224D5B768(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_224D5B79C(void *a1, unsigned __int8 *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t result;
  id v14;
  uint64_t v15;
  id v16;
  _BYTE v17[16];
  uint64_t v18;
  _QWORD aBlock[6];

  type metadata accessor for ClientRole(0);
  MEMORY[0x24BDAC7A8]();
  v7 = (uint64_t *)&v17[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = (_QWORD *)*a2;
  v18 = a3;
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = sub_224D5C95C;
  *(_QWORD *)(v9 + 24) = v17;
  aBlock[4] = sub_224D5C974;
  aBlock[5] = v9;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_224D5AC64;
  aBlock[3] = &block_descriptor;
  v10 = _Block_copy(aBlock);
  v11 = (void *)objc_opt_self();
  swift_retain();
  v12 = objc_msgSend(v11, sel_connectionWithEndpoint_clientContextBuilder_, a1, v10);
  _Block_release(v10);
  swift_release();
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v10 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    if (v12)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200);
      sub_224D5BE18(0, &qword_2557D7228);
      v14 = v12;
      *v7 = sub_224D82708();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D7530);
      swift_allocObject();
      v8 = sub_224D5BED4(v14, (int)v8, (uint64_t)v7, type metadata accessor for ClientRole, &qword_2557D8390, (uint64_t *)&unk_2557D7530, (uint64_t)sub_224D5C9B8);

    }
    else
    {
      sub_224D5CA3C(0, &qword_2557D7520, (uint64_t (*)(_QWORD))_s25EndpointConnectionFailureVMa);
      sub_224D5CA88(&qword_2557D7528, &qword_2557D7520, (uint64_t (*)(_QWORD))_s25EndpointConnectionFailureVMa, (uint64_t)&unk_224D834A8);
      swift_allocError();
      *(_BYTE *)v15 = (_BYTE)v8;
      *(_QWORD *)(v15 + 8) = a1;
      v16 = a1;
      swift_willThrow();
    }
    return (uint64_t)v8;
  }
  return result;
}

uint64_t sub_224D5BA60(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unsigned __int8 v28;
  char v29;

  v27 = a3;
  v25 = *(_QWORD *)(sub_224D81F88() - 8);
  v5 = MEMORY[0x24BDAC7A8]();
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *a1;
  v26 = v5;
  v24 = a2;
  if (v8 <= 9)
  {
    v9 = 1;
    if (((1 << v8) & 0x3CC) != 0)
    {
      v10 = 0;
      goto LABEL_4;
    }
    if ((_DWORD)v8 == 4)
    {
LABEL_8:
      v29 = v9;
      ShellService.Domain.machName(for:)(a2);
LABEL_9:
      v11 = 1;
      goto LABEL_12;
    }
    if ((_DWORD)v8 == 5)
    {
      v9 = 2;
      goto LABEL_8;
    }
  }
  v10 = 3;
LABEL_4:
  v29 = v10;
  ShellService.Domain.machName(for:)(a2);
  v11 = 1;
  switch((int)v8)
  {
    case 2:
    case 3:
    case 6:
    case 7:
    case 8:
    case 9:
      break;
    case 4:
    case 5:
      goto LABEL_9;
    default:
      v11 = 0;
      break;
  }
LABEL_12:
  v12 = (void *)sub_224D82600();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_224D82600();
  swift_bridgeObjectRelease();
  if ((v11 & 1) != 0)
  {
    v14 = 0;
  }
  else
  {
    v14 = (void *)sub_224D82600();
    swift_bridgeObjectRelease();
  }
  v15 = objc_msgSend((id)objc_opt_self(), sel_endpointForMachName_service_instance_, v12, v13, v14);

  if (v15)
  {
    v28 = v8;
    v16 = v15;
    v8 = sub_224D5B79C(v16, &v28, v27);

  }
  else
  {
    v17 = v25;
    v18 = v26;
    (*(void (**)(char *, uint64_t, uint64_t))(v25 + 16))(v7, v24, v26);
    sub_224D5CA3C(0, &qword_2557D7540, (uint64_t (*)(_QWORD))_s17MachLookupFailureVMa);
    v20 = v19;
    sub_224D5CA88(qword_2557D7548, &qword_2557D7540, (uint64_t (*)(_QWORD))_s17MachLookupFailureVMa, (uint64_t)&unk_224D83468);
    swift_allocError();
    *v21 = v8;
    (*(void (**)(_BYTE *, char *, uint64_t))(v17 + 32))(&v21[*(int *)(v20 + 20)], v7, v18);
    swift_willThrow();
  }
  return v8;
}

uint64_t sub_224D5BE18(uint64_t a1, unint64_t *a2)
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

uint64_t sub_224D5BE50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D8350);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_224D5BE98(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_QWORD *sub_224D5BED4(void *a1, int a2, uint64_t a3, uint64_t (*a4)(_QWORD), unint64_t *a5, uint64_t *a6, uint64_t a7)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t (*v17)(_QWORD);
  id v18;
  uint64_t v20;
  int v21;
  uint64_t (*v22)(_QWORD);
  unint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;

  v23 = a5;
  v24 = a6;
  v22 = a4;
  v8 = v7;
  v21 = a2;
  v25 = *v7;
  v26 = a7;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D74A0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8]();
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D82480();
  swift_allocObject();
  v7[2] = sub_224D82474();
  v15 = (char *)v7 + qword_2557D7DA0;
  v16 = sub_224D82708();
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v15, v14, v11);
  v8[4] = a1;
  v8[5] = v16;
  *((_BYTE *)v8 + 24) = v21;
  v17 = v22;
  sub_224D5C910(a3, (uint64_t)v8 + *(_QWORD *)(*v8 + 136), v22);
  v27 = v8;
  sub_224D5C9C0(v23, v24, (uint64_t)&protocol conformance descriptor for ShellConnection<A>);
  v18 = a1;
  swift_retain();
  sub_224D82420();
  swift_release();
  sub_224D5CA00(a3, v17);
  return v8;
}

uint64_t *initializeBufferWithCopyOfBuffer for ClientRole(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200);
  v5 = *(_DWORD *)(*(_QWORD *)(v4 - 8) + 80);
  v6 = *a2;
  *a1 = *a2;
  if ((v5 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v6 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = *(int *)(v4 + 48);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    swift_retain();
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7208);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  }
  return a1;
}

uint64_t destroy for ClientRole(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  swift_release();
  v2 = a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200) + 48);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7208);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_QWORD *initializeWithCopy for ClientRole(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  swift_retain();
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200) + 48);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7208);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithCopy for ClientRole(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  swift_retain();
  swift_release();
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200) + 48);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7208);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_QWORD *initializeWithTake for ClientRole(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200) + 48);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7208);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_QWORD *assignWithTake for ClientRole(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;

  *a1 = *a2;
  swift_release();
  v4 = *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200) + 48);
  v5 = (char *)a1 + v4;
  v6 = (char *)a2 + v4;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7208);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for ClientRole()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_224D5C38C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ClientRole()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_224D5C3D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7200);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

void sub_224D5C41C()
{
  unint64_t v0;
  char v1;
  char *v2;

  sub_224D5C4A8();
  if (v0 <= 0x3F)
  {
    swift_getTupleTypeLayout2();
    v2 = &v1;
    swift_initStructMetadata();
  }
}

void sub_224D5C4A8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2557D72B8[0])
  {
    sub_224D5BE18(255, &qword_2557D7228);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557D7230);
    v0 = sub_224D82714();
    if (!v1)
      atomic_store(v0, qword_2557D72B8);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for ServerRole(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v11 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v11 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_224D82264();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = *(void **)((char *)a2 + v8);
    *(uint64_t *)((char *)a1 + v8) = (uint64_t)v9;
    v10 = v9;
  }
  return a1;
}

void destroy for ServerRole(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_224D82264();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);

}

uint64_t initializeWithCopy for ServerRole(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v6 = sub_224D82264();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v9 = v8;
  return a1;
}

uint64_t assignWithCopy for ServerRole(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v6 = sub_224D82264();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a2 + v7);
  v9 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = v8;
  v10 = v8;

  return a1;
}

uint64_t initializeWithTake for ServerRole(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_224D82264();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_QWORD *)(a1 + *(int *)(a3 + 20)) = *(_QWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for ServerRole(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v6 = sub_224D82264();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = *(void **)(a1 + v7);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);

  return a1;
}

uint64_t getEnumTagSinglePayload for ServerRole()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_224D5C78C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = sub_224D82264();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t storeEnumTagSinglePayload for ServerRole()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_224D5C814(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = sub_224D82264();
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1, a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  return result;
}

uint64_t sub_224D5C88C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_224D82264();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientRole.NoRemoteTokenAfterActivation()
{
  return &type metadata for ClientRole.NoRemoteTokenAfterActivation;
}

uint64_t sub_224D5C910(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_224D5C954(uint64_t a1)
{
  uint64_t v1;

  return sub_224D5B670(a1, v1);
}

void sub_224D5C95C(void *a1)
{
  sub_224D5ABF0(a1);
}

uint64_t sub_224D5C964()
{
  return swift_deallocObject();
}

uint64_t sub_224D5C974()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
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

uint64_t _s25EndpointConnectionFailureVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s25EndpointConnectionFailureVMn);
}

uint64_t sub_224D5C9B8(uint64_t a1)
{
  id *v1;

  return sub_224D5B4D8(a1, v1);
}

uint64_t sub_224D5C9C0(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x22768C914](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_224D5CA00(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_224D5CA3C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(_QWORD))
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    v4 = a3(0);
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t _s17MachLookupFailureVMa(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&_s17MachLookupFailureVMn);
}

uint64_t sub_224D5CA88(unint64_t *a1, unint64_t *a2, uint64_t (*a3)(_QWORD), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    sub_224D5CA3C(255, a2, a3);
    result = MEMORY[0x22768C914](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_224D5CAC8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_224D5CAD0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_224D81F88();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_224D5CB44(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_224D81F88();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_224D5CBCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_224D81F88();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_BYTE *sub_224D5CC04(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_224D81F88();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_BYTE *sub_224D5CC60(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_224D81F88();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_BYTE *sub_224D5CCBC(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_224D81F88();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_BYTE *sub_224D5CD18(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_224D81F88();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_224D5CD74()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_224D5CD80(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  int v4;
  unsigned int v5;
  uint64_t v9;

  if ((_DWORD)a2 == 246)
  {
    if (*a1 <= 9u)
      v4 = 9;
    else
      v4 = *a1;
    v5 = v4 - 9;
    if (*a1 >= 2u)
      return v5;
    else
      return 0;
  }
  else
  {
    v9 = sub_224D81F88();
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v9);
  }
}

uint64_t sub_224D5CE00()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_224D5CE0C(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 246)
  {
    *result = a2 + 9;
  }
  else
  {
    v7 = sub_224D81F88();
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_224D5CE7C(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  v4 = v3;
  return a1;
}

void sub_224D5CEB0(uint64_t a1)
{

}

uint64_t sub_224D5CEB8(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a2 + 8);
  v4 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v3;
  v5 = v3;

  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_224D5CF00(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);

  return a1;
}

uint64_t sub_224D5CF38(uint64_t a1, int a2)
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

uint64_t sub_224D5CF80(uint64_t result, int a2, int a3)
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

uint64_t sub_224D5CFBC()
{
  return sub_224D5CA88(&qword_2557D7528, &qword_2557D7520, (uint64_t (*)(_QWORD))_s25EndpointConnectionFailureVMa, (uint64_t)&unk_224D834A8);
}

uint64_t sub_224D5CFF0()
{
  return sub_224D5CA88(&qword_2557D7650, &qword_2557D7520, (uint64_t (*)(_QWORD))_s25EndpointConnectionFailureVMa, (uint64_t)&unk_224D83280);
}

uint64_t sub_224D5D024()
{
  return sub_224D5CA88(&qword_2557D7658, &qword_2557D7520, (uint64_t (*)(_QWORD))_s25EndpointConnectionFailureVMa, (uint64_t)&unk_224D83258);
}

uint64_t sub_224D5D058()
{
  return sub_224D5CA88(qword_2557D7548, &qword_2557D7540, (uint64_t (*)(_QWORD))_s17MachLookupFailureVMa, (uint64_t)&unk_224D83468);
}

uint64_t sub_224D5D08C()
{
  return sub_224D5CA88(&qword_2557D7660, &qword_2557D7540, (uint64_t (*)(_QWORD))_s17MachLookupFailureVMa, (uint64_t)&unk_224D83388);
}

uint64_t sub_224D5D0C0()
{
  return sub_224D5CA88(&qword_2557D7668, &qword_2557D7540, (uint64_t (*)(_QWORD))_s17MachLookupFailureVMa, (uint64_t)&unk_224D83360);
}

unint64_t sub_224D5D0F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557D7670;
  if (!qword_2557D7670)
  {
    v1 = sub_224D81F88();
    result = MEMORY[0x22768C914](MEMORY[0x24BE78648], v1);
    atomic_store(result, (unint64_t *)&qword_2557D7670);
  }
  return result;
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x22768C890](a1, v6, a5);
}

BOOL sub_224D5D16C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_224D5D184()
{
  sub_224D828E8();
  sub_224D828F4();
  return sub_224D8290C();
}

uint64_t sub_224D5D1C8()
{
  return sub_224D828F4();
}

uint64_t sub_224D5D1F0()
{
  sub_224D828E8();
  sub_224D828F4();
  return sub_224D8290C();
}

uint64_t sub_224D5D230()
{
  sub_224D828E8();
  sub_224D82900();
  sub_224D828F4();
  return sub_224D8290C();
}

uint64_t sub_224D5D28C()
{
  sub_224D82900();
  return sub_224D828F4();
}

uint64_t sub_224D5D2C8()
{
  sub_224D828E8();
  sub_224D82900();
  sub_224D828F4();
  return sub_224D8290C();
}

uint64_t sub_224D5D320(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)a1 == *(_DWORD *)a2)
    return (*(unsigned __int8 *)(a2 + 4) ^ *(unsigned __int8 *)(a1 + 4) ^ 1) & 1;
  else
    return 0;
}

unint64_t sub_224D5D350(char a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  char v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v5 = a1 & 1;
  v6 = *v2;
  if (!*(_QWORD *)(v6 + 16)
    || (v7 = a2 | (unint64_t)(v5 << 32), result = sub_224D81940(v7), (v9 & 1) == 0))
  {
    v16 = (void *)sub_224D82600();
    v17 = (void *)sub_224D82600();
    v18 = objc_msgSend((id)objc_opt_self(), sel_attributeWithDomain_name_, v16, v17);

    v19 = objc_msgSend((id)objc_opt_self(), sel_targetWithPid_, a2);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557D77B0);
    v20 = swift_allocObject();
    *(_OWORD *)(v20 + 16) = xmmword_224D834F0;
    *(_QWORD *)(v20 + 32) = v18;
    sub_224D82660();
    v21 = objc_allocWithZone(MEMORY[0x24BE80B10]);
    v22 = v18;
    v23 = (void *)sub_224D82600();
    swift_bridgeObjectRelease();
    sub_224D5E2B0();
    v24 = (void *)sub_224D82654();
    swift_bridgeObjectRelease();
    v25 = objc_msgSend(v21, sel_initWithExplanation_target_attributes_, v23, v19, v24);

    v15 = v25;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v3;
    *v3 = 0x8000000000000000;
    sub_224D7EC6C((uint64_t)v15, 1, a2 | (unint64_t)(v5 << 32), isUniquelyReferenced_nonNull_native);
    *v3 = v28;

    swift_bridgeObjectRelease();
    return (unint64_t)v15;
  }
  v10 = *(_QWORD *)(v6 + 56);
  v11 = *(_QWORD *)(v10 + 16 * result + 8);
  v12 = v11 + 1;
  if (!__OFADD__(v11, 1))
  {
    v13 = *(id *)(v10 + 16 * result);
    v14 = swift_isUniquelyReferenced_nonNull_native();
    v27 = *v3;
    *v3 = 0x8000000000000000;
    sub_224D7EC6C((uint64_t)v13, v12, v7, v14);
    *v3 = v27;

    swift_bridgeObjectRelease();
    return 0;
  }
  __break(1u);
  return result;
}

id sub_224D5D66C(char a1, unsigned int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  char isUniquelyReferenced_nonNull_native;
  id v14;
  unint64_t v16;
  char v17;
  char v18;
  char v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v3 = v2;
  v4 = *v2;
  if (!*(_QWORD *)(v4 + 16))
    return 0;
  v5 = a2 | ((unint64_t)(a1 & 1) << 32);
  v6 = sub_224D81940(v5);
  if ((v7 & 1) == 0)
    return 0;
  v8 = *(_QWORD *)(v4 + 56) + 16 * v6;
  v10 = *(void **)v8;
  v9 = *(_QWORD *)(v8 + 8);
  if (v9 >= 2)
  {
    v11 = v9 - 1;
    v12 = v10;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v22 = *v3;
    *v3 = 0x8000000000000000;
    sub_224D7EC6C((uint64_t)v12, v11, v5, isUniquelyReferenced_nonNull_native);
    *v3 = v22;

    swift_bridgeObjectRelease();
    return 0;
  }
  v16 = sub_224D81940(v5);
  v18 = v17;
  v14 = v10;
  if ((v18 & 1) != 0)
  {
    v19 = swift_isUniquelyReferenced_nonNull_native();
    v20 = *v3;
    v23 = *v3;
    *v3 = 0x8000000000000000;
    if ((v19 & 1) == 0)
    {
      sub_224D7F424();
      v20 = v23;
    }
    v21 = *(void **)(*(_QWORD *)(v20 + 56) + 16 * v16);
    sub_224D7E2D8(v16, v20);
    *v3 = v20;

    swift_bridgeObjectRelease();
  }
  return v14;
}

unint64_t sub_224D5D7B4(unint64_t result, char a2, unsigned int a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char v8;
  char v9;
  unint64_t v10;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v4 = v3;
  v5 = *v3;
  if (*(_QWORD *)(v5 + 16))
  {
    v6 = result;
    v7 = a3 | ((unint64_t)(a2 & 1) << 32);
    result = sub_224D81940(v7);
    if ((v8 & 1) != 0 && *(_QWORD *)(*(_QWORD *)(v5 + 56) + 16 * result) == v6)
    {
      result = sub_224D81940(v7);
      if ((v9 & 1) != 0)
      {
        v10 = result;
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v12 = *v4;
        v14 = *v4;
        *v4 = 0x8000000000000000;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_224D7F424();
          v12 = v14;
        }
        v13 = *(void **)(*(_QWORD *)(v12 + 56) + 16 * v10);
        sub_224D7E2D8(v10, v12);
        *v4 = v12;

        return swift_bridgeObjectRelease();
      }
    }
  }
  return result;
}

uint64_t sub_224D5D888()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for PreviewAssertionManager();
  v0 = swift_allocObject();
  result = sub_224D8257C();
  *(_QWORD *)(v0 + 16) = result;
  qword_2557D76F0 = v0;
  return result;
}

uint64_t static PreviewAssertionManager.shared.getter()
{
  if (qword_2557D71D0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t PreviewAssertionManager.takeActivePreviewAssertion(for:)(int a1)
{
  uint64_t v1;
  uint64_t v3;

  sub_224D5D9D0(0, a1);
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v1;
  *(_DWORD *)(v3 + 24) = a1;
  swift_retain();
  return sub_224D822F4();
}

void sub_224D5D9D0(char a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  _BYTE v15[20];
  int v16;
  _QWORD aBlock[8];

  v3 = v2;
  aBlock[7] = *(_QWORD *)(v2 + 16);
  v5 = a1 & 1;
  v15[16] = a1 & 1;
  v16 = a2;
  swift_retain();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7798);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D77A0);
  v14 = sub_224D5E19C();
  v12 = v6;
  LOBYTE(v11) = 2;
  sub_224D82468();
  swift_release();
  v7 = (void *)aBlock[0];
  if (aBlock[0])
  {
    v8 = swift_allocObject();
    *(_DWORD *)(v8 + 16) = a2;
    *(_QWORD *)(v8 + 24) = v3;
    *(_BYTE *)(v8 + 32) = v5;
    aBlock[4] = sub_224D5E250;
    aBlock[5] = v8;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_224D5E068;
    aBlock[3] = &block_descriptor_0;
    v9 = _Block_copy(aBlock);
    v10 = v7;
    swift_retain();
    swift_release();
    objc_msgSend(v10, sel_acquireWithInvalidationHandler_, v9, v11, sub_224D5E1E8, v15, v12, v13, v14);

    _Block_release(v9);
  }
}

void sub_224D5DB58(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  _BYTE v8[16];
  int v9;
  uint64_t v10;
  id v11;

  v10 = *(_QWORD *)(a1 + 16);
  v9 = a2;
  swift_retain();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7798);
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D77A0);
  v7 = sub_224D5E19C();
  v6 = v2;
  LOBYTE(v5) = 2;
  sub_224D82468();
  swift_release();
  v4 = v11;
  objc_msgSend(v11, sel_invalidate, v5, sub_224D5E158, v8, v6, v3, v7);

}

uint64_t sub_224D5DC30()
{
  swift_release();
  return swift_deallocObject();
}

void sub_224D5DC54()
{
  uint64_t v0;

  sub_224D5DB58(*(_QWORD *)(v0 + 16), *(_DWORD *)(v0 + 24));
}

Swift::Void __swiftcall PreviewAssertionManager.takeSubordinateProcessAssertion(for:)(Swift::Int32 a1)
{
  sub_224D5D9D0(1, a1);
}

uint64_t sub_224D5DC6C(uint64_t a1, void *a2, int a3, uint64_t a4, int a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  uint64_t v32;
  _QWORD v34[4];
  uint64_t v35;
  int v36;
  int v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v9 = sub_224D825B8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v35 - v14;
  if (a2)
  {
    v38 = v9;
    v16 = a2;
    sub_224D82588();
    v17 = a2;
    v18 = a2;
    v19 = sub_224D825A0();
    v20 = sub_224D82750();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = swift_slowAlloc();
      v37 = a3;
      v22 = v21;
      v23 = swift_slowAlloc();
      v35 = v10;
      v24 = v23;
      v40 = v23;
      *(_DWORD *)v22 = 67240450;
      LODWORD(v39) = v37;
      sub_224D8278C();
      *(_WORD *)(v22 + 8) = 2080;
      v36 = a5;
      swift_getErrorValue();
      v25 = sub_224D82894();
      v39 = sub_224D60EC8(v25, v26, &v40);
      sub_224D8278C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_224D58000, v19, v20, "Assertion error for pid %{public}d: %s", (uint8_t *)v22, 0x12u);
      swift_arrayDestroy();
      MEMORY[0x22768C9BC](v24, -1, -1);
      MEMORY[0x22768C9BC](v22, -1, -1);

      v27 = *(void (**)(char *, uint64_t))(v35 + 8);
    }
    else
    {

      v27 = *(void (**)(char *, uint64_t))(v10 + 8);
    }
    v27(v13, v38);
  }
  else
  {
    v28 = v10;
    sub_224D82588();
    v29 = sub_224D825A0();
    v30 = sub_224D82744();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v31 = 67240192;
      LODWORD(v40) = a3;
      sub_224D8278C();
      _os_log_impl(&dword_224D58000, v29, v30, "Assertion invalidated for pid %{public}d", v31, 8u);
      MEMORY[0x22768C9BC](v31, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v9);
  }
  v40 = *(_QWORD *)(a4 + 16);
  MEMORY[0x24BDAC7A8](v40);
  swift_retain();
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7798);
  v34[3] = sub_224D5E19C();
  v34[1] = v32;
  v34[2] = MEMORY[0x24BEE4AE0] + 8;
  v34[0] = v34;
  sub_224D82468();
  return swift_release();
}

void sub_224D5E068(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(id, void *);
  id v6;
  id v7;

  v5 = *(void (**)(id, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(v7, a3);
  swift_release();

}

uint64_t PreviewAssertionManager.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t PreviewAssertionManager.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for PreviewAssertionManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for PreviewAssertionManager()
{
  return swift_lookUpClassMethod();
}

ValueMetadata *type metadata accessor for PreviewAssertionManager.Storage()
{
  return &type metadata for PreviewAssertionManager.Storage;
}

id sub_224D5E158@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  id result;

  result = sub_224D5D66C(0, *(_DWORD *)(v1 + 16));
  *a1 = result;
  return result;
}

unint64_t sub_224D5E19C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557D77A8;
  if (!qword_2557D77A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557D7798);
    result = MEMORY[0x22768C914](MEMORY[0x24BE76C78], v1);
    atomic_store(result, (unint64_t *)&qword_2557D77A8);
  }
  return result;
}

unint64_t sub_224D5E1E8@<X0>(unint64_t *a1@<X8>)
{
  uint64_t v1;
  unint64_t result;

  result = sub_224D5D350(*(_BYTE *)(v1 + 16), *(unsigned int *)(v1 + 20));
  *a1 = result;
  return result;
}

uint64_t sub_224D5E22C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D5E250(uint64_t a1, void *a2)
{
  uint64_t v2;

  return sub_224D5DC6C(a1, a2, *(_DWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(unsigned __int8 *)(v2 + 32));
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

unint64_t sub_224D5E278()
{
  uint64_t v0;

  return sub_224D5D7B4(*(_QWORD *)(v0 + 16), *(_BYTE *)(v0 + 24), *(_DWORD *)(v0 + 28));
}

unint64_t sub_224D5E2B0()
{
  unint64_t result;

  result = qword_2557D77B8;
  if (!qword_2557D77B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2557D77B8);
  }
  return result;
}

_QWORD *initializeBufferWithCopyOfBuffer for PreviewAssertionManager.Storage.CountedAssertion(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  return a1;
}

void destroy for PreviewAssertionManager.Storage.CountedAssertion(id *a1)
{

}

uint64_t assignWithCopy for PreviewAssertionManager.Storage.CountedAssertion(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for PreviewAssertionManager.Storage.CountedAssertion(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewAssertionManager.Storage.CountedAssertion(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for PreviewAssertionManager.Storage.CountedAssertion(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for PreviewAssertionManager.Storage.CountedAssertion()
{
  return &type metadata for PreviewAssertionManager.Storage.CountedAssertion;
}

uint64_t __swift_memcpy5_4(uint64_t result, int *a2)
{
  int v2;

  v2 = *a2;
  *(_BYTE *)(result + 4) = *((_BYTE *)a2 + 4);
  *(_DWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for PreviewAssertionManager.Storage.Key(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 5))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 4);
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PreviewAssertionManager.Storage.Key(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 4) = 0;
    *(_DWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 5) = 0;
    if (a2)
      *(_BYTE *)(result + 4) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewAssertionManager.Storage.Key()
{
  return &type metadata for PreviewAssertionManager.Storage.Key;
}

unint64_t sub_224D5E4EC()
{
  unint64_t result;

  result = qword_2557D77C0;
  if (!qword_2557D77C0)
  {
    result = MEMORY[0x22768C914](&unk_224D835A4, &type metadata for PreviewAssertionManager.Storage.Key);
    atomic_store(result, (unint64_t *)&qword_2557D77C0);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ShellService.Instance(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for PreviewAssertionManager.AssertionType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D5E618 + 4 * byte_224D83515[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_224D5E64C + 4 * byte_224D83510[v4]))();
}

uint64_t sub_224D5E64C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D5E654(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D5E65CLL);
  return result;
}

uint64_t sub_224D5E668(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D5E670);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_224D5E674(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D5E67C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D5E688(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_224D5E690(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewAssertionManager.AssertionType()
{
  return &type metadata for PreviewAssertionManager.AssertionType;
}

unint64_t sub_224D5E6B0()
{
  unint64_t result;

  result = qword_2557D77C8;
  if (!qword_2557D77C8)
  {
    result = MEMORY[0x22768C914](&unk_224D8364C, &type metadata for PreviewAssertionManager.AssertionType);
    atomic_store(result, (unint64_t *)&qword_2557D77C8);
  }
  return result;
}

void ShellConnectionMessage<>.reply.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = (char *)sub_224D5E77C + 4 * byte_224D83680[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_224D5E77C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t TupleTypeMetadata2;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = sub_224D8203C();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 32))(v0, v1 + *(int *)(TupleTypeMetadata2 + 48), v3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v1, AssociatedTypeWitness);
}

void sub_224D5E8E8()
{
  sub_224D82864();
  __break(1u);
}

uint64_t ShellConnectionMessage<>.body.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  char *v8;
  uint64_t result;
  uint64_t v10;

  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v5 + 16))(v4);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v7 = sub_224D8203C();
    v8 = &v4[*(int *)(swift_getTupleTypeMetadata2() + 48)];
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a2, v4, AssociatedTypeWitness);
    return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v8, v7);
  }
  else
  {
    result = sub_224D82864();
    __break(1u);
  }
  return result;
}

uint64_t ShellConnectionSender.transportDescription.getter()
{
  uint64_t v0;

  v0 = sub_224D61508();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t ShellConnectionSender.messageRelay.getter()
{
  uint64_t v0;

  v0 = sub_224D61510();
  swift_retain();
  return v0;
}

uint64_t sub_224D5EA78@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;

  v9 = type metadata accessor for ShellConnection(0, *(_QWORD *)(*(_QWORD *)a1 + 80), *(_QWORD *)(*(_QWORD *)a1 + 88), a4);
  MEMORY[0x22768C914](&protocol conformance descriptor for ShellConnection<A>, v9);
  sub_224D82858();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a2;
  v10[3] = a3;
  v10[4] = a1;
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = a2;
  v11[3] = a3;
  v11[4] = a1;
  v12 = (_QWORD *)swift_allocObject();
  v12[2] = a2;
  v12[3] = a3;
  v12[4] = a1;
  *a5 = 0;
  a5[1] = 0xE000000000000000;
  a5[2] = sub_224D63DFC;
  a5[3] = v10;
  a5[4] = sub_224D63DDC;
  a5[5] = v11;
  a5[6] = sub_224D63DBC;
  a5[7] = v12;
  return swift_retain_n();
}

uint64_t sub_224D5EB98()
{
  uint64_t v0;

  v0 = sub_224D61508();
  swift_bridgeObjectRetain();
  return v0;
}

uint64_t sub_224D5EBCC()
{
  uint64_t v0;

  v0 = sub_224D61510();
  swift_retain();
  return v0;
}

uint64_t sub_224D5EC00()
{
  return sub_224D82108();
}

uint64_t ShellConnectionSender<>.send(endpoint:context:reply:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  unint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  os_log_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  os_log_t v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, char *, uint64_t);
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, char *, uint64_t);
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52[2];

  v45 = a5;
  v50 = a3;
  v48 = a1;
  v49 = sub_224D8209C();
  v47 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v46 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_224D82264();
  v42 = *(_QWORD *)(v8 - 8);
  v43 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v41 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v12 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v36 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v32 - v14;
  v16 = sub_224D825B8();
  v38 = *(_QWORD *)(v16 - 8);
  v39 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v32 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = v5[1];
  v34 = *v5;
  v40 = (void (*)(uint64_t, char *, uint64_t))v5[4];
  sub_224D82594();
  v37 = v11;
  v20 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
  v44 = a2;
  v35 = v20;
  v20(v15, a2, AssociatedTypeWitness);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  v21 = sub_224D825A0();
  v22 = sub_224D82738();
  v23 = v22;
  if (os_log_type_enabled(v21, v22))
  {
    v24 = swift_slowAlloc();
    v33 = swift_slowAlloc();
    v52[0] = v33;
    *(_DWORD *)v24 = 136446466;
    v32 = v21;
    swift_bridgeObjectRetain();
    v51 = sub_224D60EC8(v34, v19, v52);
    LODWORD(v34) = v23;
    sub_224D8278C();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v24 + 12) = 2082;
    v35(v36, v15, AssociatedTypeWitness);
    v25 = sub_224D82618();
    v51 = sub_224D60EC8(v25, v26, v52);
    sub_224D8278C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v15, AssociatedTypeWitness);
    v27 = v32;
    _os_log_impl(&dword_224D58000, v32, (os_log_type_t)v34, "%{public}s sending xpc endpoint: %{public}s", (uint8_t *)v24, 0x16u);
    v28 = v33;
    swift_arrayDestroy();
    MEMORY[0x22768C9BC](v28, -1, -1);
    MEMORY[0x22768C9BC](v24, -1, -1);

  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v37 + 8))(v15, AssociatedTypeWitness);

  }
  (*(void (**)(char *, uint64_t))(v38 + 8))(v18, v39);
  v29 = v41;
  sub_224D8242C();
  v30 = v46;
  sub_224D821D4();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v29, v43);
  v40(v48, v30, v50);
  return (*(uint64_t (**)(char *, uint64_t))(v47 + 8))(v30, v49);
}

uint64_t ShellConnectionSender<>.send(endpoint:context:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_224D5F48C(a1, a2, a3, a4, 76, 80, (void (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t))ShellConnectionSender<>.send(endpoint:context:reply:));
}

{
  return sub_224D5F48C(a1, a2, a3, a4, 110, 114, (void (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t))ShellConnectionSender<>.send(endpoint:context:reply:));
}

uint64_t ShellConnectionSender<>.send<A>(endpoint:context:expecting:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return sub_224D5F6E8(a1, a2, a3, a4, a5, a6, a7, 90, 94, (void (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t))ShellConnectionSender<>.send(endpoint:context:reply:));
}

{
  return sub_224D5F6E8(a1, a2, a3, a4, a5, a6, a7, 124, 128, (void (*)(uint64_t, uint64_t, char *, uint64_t, uint64_t))ShellConnectionSender<>.send(endpoint:context:reply:));
}

uint64_t ShellConnectionSender<>.send(endpoint:context:reply:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t, uint64_t);
  NSObject *v23;
  os_log_type_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  os_log_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  char *v34;
  os_log_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, char *, uint64_t);
  char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56[2];

  v49 = a5;
  v52 = a1;
  v53 = a3;
  v7 = sub_224D8209C();
  v51 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v50 = (char *)&v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_224D82264();
  v46 = *(_QWORD *)(v9 - 8);
  v47 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v45 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v40 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v36 - v15;
  v17 = sub_224D825B8();
  v42 = *(_QWORD *)(v17 - 8);
  v43 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = v5[1];
  v39 = *v5;
  v44 = (void (*)(uint64_t, char *, uint64_t))v5[6];
  v21 = v5[7];
  sub_224D82594();
  v41 = v12;
  v22 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v48 = a2;
  v22(v16, a2, AssociatedTypeWitness);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  v54 = v21;
  swift_retain();
  v23 = sub_224D825A0();
  v24 = sub_224D82738();
  v25 = v24;
  if (os_log_type_enabled(v23, v24))
  {
    v26 = swift_slowAlloc();
    v38 = v7;
    v27 = v26;
    v37 = swift_slowAlloc();
    v56[0] = v37;
    *(_DWORD *)v27 = 136446466;
    v36 = v23;
    swift_bridgeObjectRetain();
    v55 = sub_224D60EC8(v39, v20, v56);
    LODWORD(v39) = v25;
    sub_224D8278C();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v27 + 12) = 2082;
    v22(v40, (uint64_t)v16, AssociatedTypeWitness);
    v28 = sub_224D82618();
    v55 = sub_224D60EC8(v28, v29, v56);
    sub_224D8278C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v16, AssociatedTypeWitness);
    v30 = v36;
    _os_log_impl(&dword_224D58000, v36, (os_log_type_t)v39, "%{public}s sending bs endpoint: %{public}s", (uint8_t *)v27, 0x16u);
    v31 = v37;
    swift_arrayDestroy();
    MEMORY[0x22768C9BC](v31, -1, -1);
    v32 = v27;
    v7 = v38;
    MEMORY[0x22768C9BC](v32, -1, -1);

  }
  else
  {
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v16, AssociatedTypeWitness);

  }
  (*(void (**)(char *, uint64_t))(v42 + 8))(v19, v43);
  v33 = v45;
  sub_224D8242C();
  v34 = v50;
  sub_224D821D4();
  (*(void (**)(char *, uint64_t))(v46 + 8))(v33, v47);
  v44(v52, v34, v53);
  return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v34, v7);
}

uint64_t sub_224D5F48C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t, uint64_t, char *, uint64_t, uint64_t))
{
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  _QWORD v27[2];
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, char *, uint64_t, uint64_t);
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v32 = a4;
  v33 = a7;
  v27[1] = a6;
  v30 = a2;
  v31 = a3;
  v29 = a1;
  v28 = sub_224D8203C();
  v8 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D77E0);
  v12 = MEMORY[0x24BDAC7A8](v11);
  v14 = (_QWORD *)((char *)v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v15 = MEMORY[0x24BDAC7A8](v12);
  v17 = (_QWORD *)((char *)v27 - v16);
  v18 = *v7;
  v19 = v7[7];
  v20 = (char *)v27 + *(int *)(v15 + 48) - v16;
  *v17 = sub_224D82708();
  v34 = v18;
  v35 = *(_OWORD *)(v7 + 1);
  v36 = *(_OWORD *)(v7 + 3);
  v37 = *(_OWORD *)(v7 + 5);
  v38 = v19;
  v21 = (char *)v14 + *(int *)(v11 + 48);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D74A0);
  v23 = *(_QWORD *)(v22 - 8);
  (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v21, v20, v22);
  sub_224D82024();
  v33(v29, v30, v10, v31, v32);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v28);
  v24 = (char *)v14 + *(int *)(v11 + 48);
  v25 = *v17;
  *v14 = *v17;
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v24, v20, v22);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v24, v22);
  return v25;
}

uint64_t sub_224D5F6E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void (*a10)(uint64_t, uint64_t, char *, uint64_t, uint64_t))
{
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t TupleTypeMetadata2;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  _QWORD v29[3];
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t, uint64_t, char *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v29[0] = a8;
  v29[1] = a6;
  v35 = a4;
  v36 = a7;
  v32 = a1;
  v33 = a10;
  v34 = a2;
  v29[2] = a9;
  v11 = sub_224D8203C();
  v30 = *(_QWORD *)(v11 - 8);
  v31 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557D7230);
  sub_224D8272C();
  v14 = sub_224D82714();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v16 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v18 = (char *)v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x24BDAC7A8](v16);
  v21 = (_QWORD *)((char *)v29 - v20);
  v22 = *v10;
  v23 = v10[7];
  v24 = (char *)v29 + *(int *)(v19 + 48) - v20;
  *v21 = sub_224D82708();
  v37 = v22;
  v38 = *(_OWORD *)(v10 + 1);
  v39 = *(_OWORD *)(v10 + 3);
  v40 = *(_OWORD *)(v10 + 5);
  v41 = v23;
  v25 = *(_QWORD *)(v14 - 8);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(&v18[*(int *)(TupleTypeMetadata2 + 48)], v24, v14);
  sub_224D82018();
  v33(v32, v34, v13, v35, v36);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v31);
  v26 = &v18[*(int *)(TupleTypeMetadata2 + 48)];
  v27 = *v21;
  *(_QWORD *)v18 = *v21;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v26, v24, v14);
  (*(void (**)(char *, uint64_t))(v25 + 8))(v26, v14);
  return v27;
}

uint64_t ShellConnection.makeSender<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;

  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a1;
  v5[4] = a3;
  v6 = *v4;
  v5[2] = v4;
  v7 = (_QWORD *)swift_task_alloc();
  v5[7] = v7;
  MEMORY[0x22768C914](&protocol conformance descriptor for ShellConnection<A>, v6);
  *v7 = v5;
  v7[1] = sub_224D5F9EC;
  return sub_224D8215C();
}

uint64_t sub_224D5F9EC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_224D5FA50()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD **)(v0 + 24);
  v2 = *(_QWORD *)(v0 + 32);
  v4 = swift_retain();
  sub_224D5EA78(v4, v2, v1, v5, v3);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D5FAA0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ShellConnection.activate<A>(forReceiving:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v13[16];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  type metadata accessor for ShellConnectionMessage(255, a2, a3, a4);
  v7 = sub_224D826B4();
  MEMORY[0x24BDAC7A8](v7);
  v9 = &v13[-v8];
  v14 = a2;
  v15 = a3;
  v16 = v4;
  swift_checkMetadataState();
  v10 = *MEMORY[0x24BEE6A10];
  v11 = sub_224D826B4();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v9, v10, v11);
  return sub_224D826FC();
}

uint64_t sub_224D5FB90(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t, uint64_t);
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t, uint64_t);
  uint64_t v54;

  v8 = *a2;
  v32 = a4;
  type metadata accessor for ShellConnectionMessage(255, a3, a4, a4);
  v9 = sub_224D826D8();
  v40 = *(_QWORD *)(v9 - 8);
  v41 = v9;
  v42 = *(_QWORD *)(v40 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v39 = (char *)&v31 - v10;
  *(_QWORD *)&v46 = 0;
  *((_QWORD *)&v46 + 1) = 0xE000000000000000;
  v45 = a2;
  MEMORY[0x22768C914](&protocol conformance descriptor for ShellConnection<A>, v8);
  sub_224D82858();
  v43 = *((_QWORD *)&v46 + 1);
  v38 = v46;
  v48 = v8;
  v11 = MEMORY[0x22768C914](&protocol conformance descriptor for ShellConnection<A>, v8);
  v49 = v11;
  *(_QWORD *)&v46 = a2;
  swift_retain();
  v36 = sub_224D5FEE0((uint64_t)&v46, a1, a3, a4, (uint64_t)&unk_24ECEAE60, (uint64_t)sub_224D63CA0, MEMORY[0x24BE779C0]);
  v44 = v12;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v46);
  v48 = v8;
  v49 = v11;
  *(_QWORD *)&v46 = a2;
  swift_retain();
  v13 = sub_224D5FEE0((uint64_t)&v46, a1, a3, a4, (uint64_t)&unk_24ECEAE38, (uint64_t)sub_224D63CA0, MEMORY[0x24BE779C8]);
  v33 = v13;
  v31 = v14;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v46);
  v48 = v8;
  v49 = v11;
  *(_QWORD *)&v46 = a2;
  v15 = sub_224D60000((uint64_t)&v46, a1, a3, a4);
  v35 = v15;
  v17 = v16;
  v34 = v16;
  swift_retain();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v46);
  v48 = v8;
  v49 = v11;
  *(_QWORD *)&v46 = a2;
  v18 = a1;
  v19 = sub_224D60164((uint64_t)&v46, a1, a3, a4);
  v37 = v19;
  v21 = v20;
  swift_retain();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v46);
  *(_QWORD *)&v46 = v38;
  *((_QWORD *)&v46 + 1) = v43;
  v22 = v36;
  v47 = v36;
  v48 = v44;
  v49 = v13;
  v50 = v31;
  v51 = v15;
  v52 = v17;
  v53 = v19;
  v54 = v21;
  sub_224D6A7A4(&v46);
  v45 = a2;
  v24 = v39;
  v23 = v40;
  v25 = v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v39, v18, v41);
  v26 = v23;
  v27 = (*(unsigned __int8 *)(v23 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80);
  v28 = (char *)swift_allocObject();
  *((_QWORD *)v28 + 2) = *(_QWORD *)(v8 + 80);
  *((_QWORD *)v28 + 3) = a3;
  v29 = v32;
  *((_QWORD *)v28 + 4) = *(_QWORD *)(v8 + 88);
  *((_QWORD *)v28 + 5) = v29;
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(&v28[v27], v24, v25);
  MEMORY[0x22768C914](&protocol conformance descriptor for ShellConnection<A>, v8);
  sub_224D82420();
  swift_bridgeObjectRelease();
  sub_224D63AD8(v22);
  sub_224D63AD8(v33);
  sub_224D63AD8((uint64_t)v35);
  sub_224D63AD8((uint64_t)v37);
  return swift_release();
}

uint64_t sub_224D5FEE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t (*a7)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);

  v19 = a6;
  v20 = a7;
  type metadata accessor for ShellConnectionMessage(255, a3, a4, a4);
  v11 = sub_224D826D8();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v19 - v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))((char *)&v19 - v13, a2, v11);
  v15 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a3;
  *(_QWORD *)(v16 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v12 + 32))(v16 + v15, v14, v11);
  v17 = v20(a1, v19, v16, a3, *(_QWORD *)(a4 + 8));
  swift_release();
  return v17;
}

uint64_t (*sub_224D60000(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  __int128 v19[2];

  type metadata accessor for ShellConnectionMessage(255, a3, a4, a4);
  v9 = sub_224D826D8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - v12;
  if (swift_getAssociatedTypeWitness() == MEMORY[0x24BEE4078])
    return 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a2, v9);
  sub_224D63AE8(a1, (uint64_t)v19);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = (v11 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a3;
  *(_QWORD *)(v16 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v16 + v14, v13, v9);
  *(_QWORD *)(v16 + v15) = v4;
  sub_224D63B30(v19, v16 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_224D63BE4;
}

uint64_t (*sub_224D60164(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v18;
  __int128 v19[2];

  type metadata accessor for ShellConnectionMessage(255, a3, a4, a4);
  v9 = sub_224D826D8();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v18 - v12;
  if (swift_getAssociatedTypeWitness() == MEMORY[0x24BEE4078])
    return 0;
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v13, a2, v9);
  sub_224D63AE8(a1, (uint64_t)v19);
  v14 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v15 = (v11 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a3;
  *(_QWORD *)(v16 + 24) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v16 + v14, v13, v9);
  *(_QWORD *)(v16 + v15) = v4;
  sub_224D63B30(v19, v16 + ((v15 + 15) & 0xFFFFFFFFFFFFFFF8));
  return sub_224D63B48;
}

Swift::Void __swiftcall ShellConnection.activate()()
{
  uint64_t *v0;
  uint64_t v1;
  _OWORD v2[5];

  v1 = *v0;
  *(_QWORD *)&v2[0] = 0;
  *((_QWORD *)&v2[0] + 1) = 0xE000000000000000;
  MEMORY[0x22768C914](&protocol conformance descriptor for ShellConnection<A>, v1);
  sub_224D82858();
  memset(&v2[1], 0, 64);
  sub_224D6A7A4(v2);
  swift_bridgeObjectRelease();
}

uint64_t sub_224D60350()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_224D6037C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_224D643A0(v1);
  return v1;
}

uint64_t sub_224D603AC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  sub_224D643A0(v1);
  return v1;
}

uint64_t sub_224D603DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  int EnumCaseMultiPayload;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t TupleTypeMetadata2;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v7, v9, a1);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  v11 = *(_QWORD *)(a1 + 16);
  if (EnumCaseMultiPayload == 1)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v13 = sub_224D8203C();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    v15 = &v7[*(int *)(TupleTypeMetadata2 + 48)];
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a3, v7, AssociatedTypeWitness);
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a3 + *(int *)(TupleTypeMetadata2 + 48), v15, v13);
  }
  else
  {
    v17 = swift_getAssociatedTypeWitness();
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(a3, v7, v17);
  }
  type metadata accessor for ShellConnectionMessage(0, v11, a2, v16);
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_224D6055C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v5 = type metadata accessor for ShellConnectionMessage(0, a3, a4, a4);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - v6;
  v8 = sub_224D826A8();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - v10;
  v12 = sub_224D820B4();
  sub_224D603DC(v12, a4, (uint64_t)v7);
  sub_224D826D8();
  sub_224D826C0();
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_224D60674(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t TupleTypeMetadata3;
  id v21;
  char *v22;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v33 = a6;
  v34 = a5;
  v28 = a4;
  v35 = a3;
  v32 = a2;
  v11 = sub_224D825B8();
  v30 = *(_QWORD *)(v11 - 8);
  v31 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v29 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for ShellConnectionMessage(0, a7, a8, v13);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v24 - v15;
  v17 = sub_224D826A8();
  v26 = *(_QWORD *)(v17 - 8);
  v27 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v25 = (char *)&v24 - v18;
  sub_224D5BE18(255, &qword_2557D77D8);
  swift_getAssociatedTypeWitness();
  v19 = sub_224D8203C();
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  *(_QWORD *)v16 = a1;
  v21 = a1;
  sub_224D820F0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(&v16[*(int *)(TupleTypeMetadata3 + 64)], v35, v19);
  swift_storeEnumTagMultiPayload();
  sub_224D826D8();
  v22 = v25;
  sub_224D826C0();
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v22, v27);
}

uint64_t sub_224D60A2C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t TupleTypeMetadata3;
  id v21;
  char *v22;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v33 = a6;
  v34 = a5;
  v28 = a4;
  v35 = a3;
  v32 = a2;
  v11 = sub_224D825B8();
  v30 = *(_QWORD *)(v11 - 8);
  v31 = v11;
  MEMORY[0x24BDAC7A8](v11);
  v29 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for ShellConnectionMessage(0, a7, a8, v13);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v24 - v15;
  v17 = sub_224D826A8();
  v26 = *(_QWORD *)(v17 - 8);
  v27 = v17;
  MEMORY[0x24BDAC7A8](v17);
  v25 = (char *)&v24 - v18;
  sub_224D5BE18(255, &qword_2557D77D0);
  swift_getAssociatedTypeWitness();
  v19 = sub_224D8203C();
  TupleTypeMetadata3 = swift_getTupleTypeMetadata3();
  *(_QWORD *)v16 = a1;
  v21 = a1;
  sub_224D820F0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(&v16[*(int *)(TupleTypeMetadata3 + 64)], v35, v19);
  swift_storeEnumTagMultiPayload();
  sub_224D826D8();
  v22 = v25;
  sub_224D826C0();
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v22, v27);
}

uint64_t sub_224D60DE4(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_224D60DF4(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

_BYTE **sub_224D60E28(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_224D60E38(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_224D60E58(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_224D60EC8(v6, v7, a3);
  v8 = *a1 + 8;
  sub_224D8278C();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_224D60EC8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_224D60F98(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_224D63E3C((uint64_t)v12, *a3);
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
      sub_224D63E3C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_224D60F98(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_224D82798();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_224D61150(a5, a6);
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
  v8 = sub_224D827EC();
  if (!v8)
  {
    sub_224D82804();
    __break(1u);
LABEL_17:
    result = sub_224D82828();
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

uint64_t sub_224D61150(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_224D611E4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_224D613BC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_224D613BC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_224D611E4(uint64_t a1, unint64_t a2)
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
      v3 = sub_224D61358(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_224D827E0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_224D82804();
      __break(1u);
LABEL_10:
      v2 = sub_224D82648();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_224D82828();
    __break(1u);
LABEL_14:
    result = sub_224D82804();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_224D61358(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D78F0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_224D613BC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557D78F0);
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
  result = sub_224D82828();
  __break(1u);
  return result;
}

uint64_t sub_224D61508()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_224D61510()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t type metadata accessor for ShellConnectionMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ShellConnectionMessage);
}

uint64_t sub_224D61524(uint64_t a1)
{
  uint64_t v1;

  return sub_224D5FB90(a1, *(_QWORD **)(v1 + 32), *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_224D61530(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)(a2 + 24) + 8);
}

uint64_t sub_224D6153C()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_224D61544()
{
  uint64_t AssociatedTypeWitness;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v9;
  char v10;
  char v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t *v15;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v1 = AssociatedTypeWitness;
  if (v2 <= 0x3F)
  {
    v12 = *(_QWORD *)(AssociatedTypeWitness - 8) + 64;
    v1 = swift_getAssociatedTypeWitness();
    if (v3 <= 0x3F)
    {
      v4 = sub_224D8203C();
      if (v5 > 0x3F)
      {
        return v4;
      }
      else
      {
        swift_getTupleTypeLayout2();
        v13 = &v11;
        v1 = swift_getAssociatedTypeWitness();
        if (v6 <= 0x3F)
        {
          swift_getTupleTypeLayout3();
          v14 = &v10;
          v1 = swift_getAssociatedTypeWitness();
          if (v7 <= 0x3F)
          {
            swift_getTupleTypeLayout3();
            v15 = &v9;
            swift_initEnumMetadataMultiPayload();
            return 0;
          }
        }
      }
    }
  }
  return v1;
}

char *sub_224D616F0(char *a1, char **a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  unsigned int v23;
  char *v26;
  char *result;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t);
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, uint64_t, uint64_t);
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t AssociatedTypeWitness;
  uint64_t v50;
  uint64_t v51;
  int v52;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = *(_QWORD *)(v2 + 64);
  v48 = swift_getAssociatedTypeWitness();
  v4 = *(_QWORD *)(v48 - 8);
  v5 = *(_QWORD *)(v4 + 64);
  v6 = sub_224D8203C();
  v7 = *(_QWORD *)(v6 - 8);
  v51 = v6;
  v52 = *(_DWORD *)(v7 + 80);
  v47 = v5 + v52;
  v50 = v7;
  v8 = *(_QWORD *)(v7 + 64);
  if ((v47 & ~(unint64_t)v52) + v8 <= v3)
    v9 = v3;
  else
    v9 = (v47 & ~(unint64_t)*(_DWORD *)(v7 + 80)) + v8;
  v10 = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_DWORD *)(v11 + 80);
  v13 = v12;
  v44 = v11;
  v14 = *(_QWORD *)(v11 + 64) + v52;
  v45 = v14;
  v46 = v10;
  if (((v14 + ((v13 + 8) & ~v13)) & ~(unint64_t)v52) + v8 > v9)
    v9 = ((v14 + ((v12 + 8) & ~(unint64_t)v12)) & ~(unint64_t)v52)
       + v8;
  v15 = swift_getAssociatedTypeWitness();
  v16 = v2;
  v17 = *(_QWORD *)(v15 - 8);
  v18 = *(_DWORD *)(v17 + 80);
  v19 = *(_QWORD *)(v17 + 64);
  v20 = v19 + v52;
  if (((v20 + ((v18 + 8) & ~v18)) & ~(unint64_t)v52) + v8 <= v9)
    v21 = v9;
  else
    v21 = ((v19 + v52 + ((v18 + 8) & ~v18)) & ~(unint64_t)v52) + v8;
  v22 = *(_DWORD *)(v16 + 80) | *(_DWORD *)(v4 + 80) | v52;
  v23 = v12 | v52 | v18 | v22 & 0xF8;
  if (v23 > 7 || ((*(_DWORD *)(v17 + 80) | v12 | v22) & 0x100000) != 0 || v21 + 1 > 0x18)
  {
    v26 = *a2;
    *(_QWORD *)a1 = *a2;
    v29 = &v26[((v23 | 7) + 16) & ~(unint64_t)(v23 | 7)];
    swift_retain();
  }
  else
  {
    v28 = v15;
    v29 = a1;
    v31 = ~(unint64_t)v52;
    v32 = ~(unint64_t)v12;
    v33 = ~v18;
    switch(*((_BYTE *)a2 + v21))
    {
      case 0:
        (*(void (**)(char *, char **, uint64_t))(v16 + 16))(a1, a2, AssociatedTypeWitness);
        a1[v21] = 0;
        break;
      case 1:
        (*(void (**)(char *, char **, uint64_t))(v4 + 16))(a1, a2, v48);
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v50 + 16))((unint64_t)&a1[v47] & v31, ((unint64_t)a2 + v47) & v31, v51);
        a1[v21] = 1;
        break;
      case 2:
        v34 = *a2;
        *(_QWORD *)a1 = *a2;
        v35 = (unint64_t)&a1[v12 + 8] & v32;
        v36 = ((unint64_t)a2 + v13 + 8) & v32;
        v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v44 + 16);
        v38 = v34;
        v37(v35, v36, v46);
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v50 + 16))((v45 + v35) & v31, (v45 + v36) & v31, v51);
        a1[v21] = 2;
        break;
      case 3:
        v39 = *a2;
        *(_QWORD *)a1 = *a2;
        v40 = (unint64_t)&a1[v18 + 8] & v33;
        v41 = ((unint64_t)a2 + v18 + 8) & v33;
        v42 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
        v43 = v39;
        v42(v40, v41, v28);
        (*(void (**)(unint64_t, unint64_t, uint64_t))(v50 + 16))((v20 + v40) & v31, (v20 + v41) & v31, v51);
        a1[v21] = 3;
        break;
      default:
        if (v21 <= 3)
          v30 = v21;
        else
          v30 = 4;
        __asm { BR              X14 }
        return result;
    }
  }
  return v29;
}

uint64_t sub_224D61AC4(id *a1)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v3;
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
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(id *, uint64_t);
  id *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t result;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v36 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v37 = AssociatedTypeWitness;
  v3 = *(_QWORD *)(v36 + 64);
  v4 = swift_getAssociatedTypeWitness();
  v34 = *(_QWORD *)(v4 - 8);
  v35 = v4;
  v5 = *(_QWORD *)(v34 + 64);
  v6 = sub_224D8203C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v33 = v5 + v8;
  v38 = v7;
  v39 = v6;
  v9 = *(_QWORD *)(v7 + 64);
  if (((v5 + v8) & (unint64_t)~v8) + v9 > v3)
    v3 = ((v5 + v8) & ~v8) + v9;
  v10 = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned __int8 *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 64) + v8;
  v31 = v13;
  v32 = v10;
  if (((v13 + ((v12 + 8) & ~v12)) & (unint64_t)~v8) + v9 <= v3)
    v14 = v3;
  else
    v14 = ((v13 + ((v12 + 8) & ~v12)) & ~v8) + v9;
  v15 = swift_getAssociatedTypeWitness();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned __int8 *)(v16 + 80);
  v18 = *(_QWORD *)(v16 + 64);
  v19 = v18 + v8;
  v20 = ((v18 + v8 + ((v17 + 8) & ~v17)) & ~v8) + v9;
  if (v20 <= v14)
    v20 = v14;
  v22 = ~v8;
  switch(*((_BYTE *)a1 + v20))
  {
    case 0:
      v23 = v37;
      v24 = *(uint64_t (**)(id *, uint64_t))(v36 + 8);
      v25 = a1;
      return v24(v25, v23);
    case 1:
      (*(void (**)(id *, uint64_t))(v34 + 8))(a1, v35);
      v26 = v33;
      goto LABEL_17;
    case 2:

      a1 = (id *)(((unint64_t)a1 + v12 + 8) & ~v12);
      (*(void (**)(id *, uint64_t))(v11 + 8))(a1, v32);
      v26 = v31;
LABEL_17:
      v27 = (uint64_t)a1 + v26;
      break;
    case 3:
      v28 = v15;

      v29 = ((unint64_t)a1 + v17 + 8) & ~v17;
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v29, v28);
      v27 = v19 + v29;
      break;
    default:
      if (*((unsigned __int8 *)a1 + v20) <= 3u)
        v21 = *((unsigned __int8 *)a1 + v20);
      else
        v21 = 4;
      __asm { BR              X13 }
      return result;
  }
  v25 = (id *)(v27 & v22);
  v23 = v39;
  v24 = *(uint64_t (**)(id *, uint64_t))(v38 + 8);
  return v24(v25, v23);
}

void **sub_224D61D74(void **a1, void **a2)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v4;
  uint64_t v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  void *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, uint64_t);
  id v31;
  void *v32;
  char *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t);
  id v38;
  void **result;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v45 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v46 = AssociatedTypeWitness;
  v4 = *(_QWORD *)(v45 + 64);
  v5 = swift_getAssociatedTypeWitness();
  v43 = *(_QWORD *)(v5 - 8);
  v44 = v5;
  v6 = *(_QWORD *)(v43 + 64);
  v47 = sub_224D8203C();
  v7 = *(_QWORD *)(v47 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v42 = v6 + v8;
  v9 = *(_QWORD *)(v7 + 64);
  if (((v6 + v8) & (unint64_t)~v8) + v9 <= v4)
    v10 = v4;
  else
    v10 = ((v6 + v8) & ~v8) + v9;
  v11 = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 64) + v8;
  v40 = v14;
  v41 = v11;
  if (((v14 + ((v13 + 8) & ~v13)) & (unint64_t)~v8) + v9 > v10)
    v10 = ((v14 + ((v13 + 8) & ~v13)) & ~v8) + v9;
  v15 = swift_getAssociatedTypeWitness();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned __int8 *)(v16 + 80);
  v18 = *(_QWORD *)(v16 + 64);
  v19 = v18 + v8;
  if (((v18 + v8 + ((v17 + 8) & ~v17)) & (unint64_t)~v8) + v9 <= v10)
    v20 = v10;
  else
    v20 = ((v18 + v8 + ((v17 + 8) & ~v17)) & ~v8) + v9;
  v22 = ~v8;
  v23 = ~v13;
  v24 = ~v17;
  switch(*((_BYTE *)a2 + v20))
  {
    case 0:
      (*(void (**)(void **, void **, uint64_t))(v45 + 16))(a1, a2, v46);
      v25 = 0;
      break;
    case 1:
      (*(void (**)(void **, void **, uint64_t))(v43 + 16))(a1, a2, v44);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 16))(((unint64_t)a1 + v42) & v22, ((unint64_t)a2 + v42) & v22, v47);
      v25 = 1;
      break;
    case 2:
      v26 = *a2;
      *a1 = *a2;
      v27 = (char *)a2 + v13;
      v28 = ((unint64_t)a1 + v13 + 8) & v23;
      v29 = (unint64_t)(v27 + 8) & v23;
      v30 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
      v31 = v26;
      v30(v28, v29, v41);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))((v40 + v28) & v22, (v40 + v29) & v22, v47);
      v25 = 2;
      break;
    case 3:
      v32 = *a2;
      *a1 = *a2;
      v33 = (char *)a1 + v17;
      v34 = (char *)a2 + v17;
      v35 = (unint64_t)(v33 + 8) & v24;
      v36 = (unint64_t)(v34 + 8) & v24;
      v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16);
      v38 = v32;
      v37(v35, v36, v15);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))((v19 + v35) & v22, (v19 + v36) & v22, v47);
      v25 = 3;
      break;
    default:
      if (v20 <= 3)
        v21 = v20;
      else
        v21 = 4;
      __asm { BR              X14 }
      return result;
  }
  *((_BYTE *)a1 + v20) = v25;
  return a1;
}

id *sub_224D620C0(id *a1, void **a2)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v4;
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
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void **v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  void *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
  id v36;
  void *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t, uint64_t);
  id v42;
  id *result;
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
  uint64_t v56;
  uint64_t v57;

  if (a1 != a2)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v53 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v54 = AssociatedTypeWitness;
    v4 = *(_QWORD *)(v53 + 64);
    v5 = swift_getAssociatedTypeWitness();
    v51 = *(_QWORD *)(v5 - 8);
    v52 = v5;
    v6 = *(_QWORD *)(v51 + 64);
    v57 = sub_224D8203C();
    v7 = *(_QWORD *)(v57 - 8);
    v8 = *(unsigned __int8 *)(v7 + 80);
    v50 = v6 + v8;
    v9 = v7;
    v10 = *(_QWORD *)(v7 + 64);
    if (((v6 + v8) & (unint64_t)~v8) + v10 <= v4)
      v11 = v4;
    else
      v11 = ((v6 + v8) & ~v8) + v10;
    v12 = swift_getAssociatedTypeWitness();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned __int8 *)(v13 + 80);
    v47 = v13;
    v15 = *(_QWORD *)(v13 + 64) + v8;
    v48 = v15;
    v49 = v12;
    if (((v15 + ((v14 + 8) & ~v14)) & (unint64_t)~v8) + v10 <= v11)
      v16 = v11;
    else
      v16 = ((v15 + ((v14 + 8) & ~v14)) & ~v8) + v10;
    v17 = swift_getAssociatedTypeWitness();
    v18 = *(_QWORD *)(v17 - 8);
    v19 = *(unsigned __int8 *)(v18 + 80);
    v45 = v18;
    v46 = v17;
    v20 = *(_QWORD *)(v18 + 64);
    v21 = v20 + v8;
    if (((v20 + v8 + ((v19 + 8) & ~v19)) & (unint64_t)~v8) + v10 <= v16)
      v22 = v16;
    else
      v22 = ((v20 + v8 + ((v19 + 8) & ~v19)) & ~v8) + v10;
    v24 = v9;
    v25 = a2;
    v26 = ~v8;
    v56 = ~v14;
    v44 = ~v19;
    switch(*((_BYTE *)a1 + v22))
    {
      case 0:
        (*(void (**)(id *, uint64_t))(v53 + 8))(a1, v54);
        goto LABEL_28;
      case 1:
        (*(void (**)(id *, uint64_t))(v51 + 8))(a1, v52);
        v27 = (uint64_t)a1 + v50;
        goto LABEL_22;
      case 2:

        v28 = v21;
        (*(void (**)(unint64_t, uint64_t))(v47 + 8))(((unint64_t)a1 + v14 + 8) & v56, v49);
        v27 = v48 + (((unint64_t)a1 + v14 + 8) & v56);
        goto LABEL_21;
      case 3:

        v28 = v21;
        (*(void (**)(unint64_t, uint64_t))(v45 + 8))(((unint64_t)a1 + v19 + 8) & v44, v46);
        v27 = v21 + (((unint64_t)a1 + v19 + 8) & v44);
LABEL_21:
        v21 = v28;
LABEL_22:
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v27 & v26, v57);
LABEL_28:
        switch(*((_BYTE *)v25 + v22))
        {
          case 0:
            (*(void (**)(id *, void **, uint64_t))(v53 + 16))(a1, v25, v54);
            v30 = 0;
            break;
          case 1:
            (*(void (**)(id *, void **, uint64_t))(v51 + 16))(a1, v25, v52);
            (*(void (**)(unint64_t, unint64_t, uint64_t))(v24 + 16))(((unint64_t)a1 + v50) & v26, ((unint64_t)v25 + v50) & v26, v57);
            v30 = 1;
            break;
          case 2:
            v31 = *v25;
            *a1 = *v25;
            v32 = (char *)v25 + v14;
            v33 = ((unint64_t)a1 + v14 + 8) & v56;
            v34 = (unint64_t)(v32 + 8) & v56;
            v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v47 + 16);
            v36 = v31;
            v35(v33, v34, v49);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))((v48 + v33) & v26, (v48 + v34) & v26, v57);
            v30 = 2;
            break;
          case 3:
            v37 = *v25;
            *a1 = *v25;
            v38 = (char *)v25 + v19;
            v39 = ((unint64_t)a1 + v19 + 8) & v44;
            v40 = (unint64_t)(v38 + 8) & v44;
            v41 = *(void (**)(uint64_t, uint64_t, uint64_t))(v45 + 16);
            v42 = v37;
            v41(v39, v40, v46);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 16))((v21 + v39) & v26, (v21 + v40) & v26, v57);
            v30 = 3;
            break;
          default:
            if (v22 <= 3)
              v29 = v22;
            else
              v29 = 4;
            __asm { BR              X12 }
            return result;
        }
        *((_BYTE *)a1 + v22) = v30;
        break;
      default:
        if (v22 <= 3)
          v23 = v22;
        else
          v23 = 4;
        __asm { BR              X12 }
        return result;
    }
  }
  return a1;
}

_QWORD *sub_224D62590(_QWORD *a1, _QWORD *a2)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v4;
  uint64_t v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v39 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v40 = AssociatedTypeWitness;
  v4 = *(_QWORD *)(v39 + 64);
  v5 = swift_getAssociatedTypeWitness();
  v37 = *(_QWORD *)(v5 - 8);
  v38 = v5;
  v6 = *(_QWORD *)(v37 + 64);
  v41 = sub_224D8203C();
  v7 = *(_QWORD *)(v41 - 8);
  v8 = *(unsigned __int8 *)(v7 + 80);
  v36 = v6 + v8;
  v9 = *(_QWORD *)(v7 + 64);
  if (((v6 + v8) & (unint64_t)~v8) + v9 <= v4)
    v10 = v4;
  else
    v10 = ((v6 + v8) & ~v8) + v9;
  v11 = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(unsigned __int8 *)(v12 + 80);
  v14 = *(_QWORD *)(v12 + 64) + v8;
  v34 = v14;
  v35 = v11;
  if (((v14 + ((v13 + 8) & ~v13)) & (unint64_t)~v8) + v9 > v10)
    v10 = ((v14 + ((v13 + 8) & ~v13)) & ~v8) + v9;
  v15 = swift_getAssociatedTypeWitness();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(unsigned __int8 *)(v16 + 80);
  v18 = *(_QWORD *)(v16 + 64);
  v19 = v18 + v8;
  if (((v18 + v8 + ((v17 + 8) & ~v17)) & (unint64_t)~v8) + v9 <= v10)
    v20 = v10;
  else
    v20 = ((v18 + v8 + ((v17 + 8) & ~v17)) & ~v8) + v9;
  v22 = ~v8;
  v23 = ~v13;
  v24 = ~v17;
  switch(*((_BYTE *)a2 + v20))
  {
    case 0:
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v39 + 32))(a1, a2, v40);
      v25 = 0;
      break;
    case 1:
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v37 + 32))(a1, a2, v38);
      (*(void (**)(unint64_t, unint64_t, uint64_t))(v7 + 32))(((unint64_t)a1 + v36) & v22, ((unint64_t)a2 + v36) & v22, v41);
      v25 = 1;
      break;
    case 2:
      *a1 = *a2;
      v26 = (char *)a2 + v13;
      v27 = ((unint64_t)a1 + v13 + 8) & v23;
      v28 = (unint64_t)(v26 + 8) & v23;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 32))(v27, v28, v35);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))((v34 + v27) & v22, (v34 + v28) & v22, v41);
      v25 = 2;
      break;
    case 3:
      *a1 = *a2;
      v29 = (char *)a1 + v17;
      v30 = (char *)a2 + v17;
      v31 = (unint64_t)(v29 + 8) & v24;
      v32 = (unint64_t)(v30 + 8) & v24;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 32))(v31, v32, v15);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))((v19 + v31) & v22, (v19 + v32) & v22, v41);
      v25 = 3;
      break;
    default:
      if (v20 <= 3)
        v21 = v20;
      else
        v21 = 4;
      __asm { BR              X14 }
      return result;
  }
  *((_BYTE *)a1 + v20) = v25;
  return a1;
}

id *sub_224D628D0(id *a1, id *a2)
{
  uint64_t AssociatedTypeWitness;
  unint64_t v4;
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
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  id *result;
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
  uint64_t v47;
  uint64_t v48;

  if (a1 != a2)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    v44 = *(_QWORD *)(AssociatedTypeWitness - 8);
    v45 = AssociatedTypeWitness;
    v4 = *(_QWORD *)(v44 + 64);
    v5 = swift_getAssociatedTypeWitness();
    v42 = *(_QWORD *)(v5 - 8);
    v43 = v5;
    v6 = *(_QWORD *)(v42 + 64);
    v48 = sub_224D8203C();
    v7 = *(_QWORD *)(v48 - 8);
    v8 = *(unsigned __int8 *)(v7 + 80);
    v41 = v6 + v8;
    v9 = v7;
    v10 = *(_QWORD *)(v7 + 64);
    if (((v6 + v8) & (unint64_t)~v8) + v10 <= v4)
      v11 = v4;
    else
      v11 = ((v6 + v8) & ~v8) + v10;
    v12 = swift_getAssociatedTypeWitness();
    v13 = *(_QWORD *)(v12 - 8);
    v14 = *(unsigned __int8 *)(v13 + 80);
    v38 = v13;
    v15 = *(_QWORD *)(v13 + 64) + v8;
    v39 = v15;
    v40 = v12;
    if (((v15 + ((v14 + 8) & ~v14)) & (unint64_t)~v8) + v10 <= v11)
      v16 = v11;
    else
      v16 = ((v15 + ((v14 + 8) & ~v14)) & ~v8) + v10;
    v17 = swift_getAssociatedTypeWitness();
    v18 = *(_QWORD *)(v17 - 8);
    v19 = *(unsigned __int8 *)(v18 + 80);
    v36 = v18;
    v37 = v17;
    v20 = *(_QWORD *)(v18 + 64);
    v21 = v20 + v8;
    if (((v20 + v8 + ((v19 + 8) & ~v19)) & (unint64_t)~v8) + v10 <= v16)
      v22 = v16;
    else
      v22 = ((v20 + v8 + ((v19 + 8) & ~v19)) & ~v8) + v10;
    v24 = v9;
    v25 = a2;
    v26 = ~v8;
    v47 = ~v14;
    v35 = ~v19;
    switch(*((_BYTE *)a1 + v22))
    {
      case 0:
        (*(void (**)(id *, uint64_t))(v44 + 8))(a1, v45);
        goto LABEL_28;
      case 1:
        (*(void (**)(id *, uint64_t))(v42 + 8))(a1, v43);
        v27 = (uint64_t)a1 + v41;
        goto LABEL_22;
      case 2:

        v28 = v21;
        (*(void (**)(unint64_t, uint64_t))(v38 + 8))(((unint64_t)a1 + v14 + 8) & v47, v40);
        v27 = v39 + (((unint64_t)a1 + v14 + 8) & v47);
        goto LABEL_21;
      case 3:

        v28 = v21;
        (*(void (**)(unint64_t, uint64_t))(v36 + 8))(((unint64_t)a1 + v19 + 8) & v35, v37);
        v27 = v21 + (((unint64_t)a1 + v19 + 8) & v35);
LABEL_21:
        v21 = v28;
LABEL_22:
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v27 & v26, v48);
LABEL_28:
        switch(*((_BYTE *)v25 + v22))
        {
          case 0:
            (*(void (**)(id *, id *, uint64_t))(v44 + 32))(a1, v25, v45);
            v30 = 0;
            break;
          case 1:
            (*(void (**)(id *, id *, uint64_t))(v42 + 32))(a1, v25, v43);
            (*(void (**)(unint64_t, unint64_t, uint64_t))(v24 + 32))(((unint64_t)a1 + v41) & v26, ((unint64_t)v25 + v41) & v26, v48);
            v30 = 1;
            break;
          case 2:
            *a1 = *v25;
            v31 = (char *)v25 + v14;
            v32 = ((unint64_t)a1 + v14 + 8) & v47;
            v33 = (unint64_t)(v31 + 8) & v47;
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 32))(v32, v33, v40);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v24 + 32))((v39 + v32) & v26, (v39 + v33) & v26, v48);
            v30 = 2;
            break;
          case 3:
            *a1 = *v25;
            (*(void (**)(unint64_t, unint64_t, uint64_t))(v36 + 32))(((unint64_t)a1 + v19 + 8) & v35, ((unint64_t)v25 + v19 + 8) & v35, v37);
            (*(void (**)(unint64_t, unint64_t, uint64_t))(v24 + 32))((v21 + (((unint64_t)a1 + v19 + 8) & v35)) & v26, (v21 + (((unint64_t)v25 + v19 + 8) & v35)) & v26, v48);
            v30 = 3;
            break;
          default:
            if (v22 <= 3)
              v29 = v22;
            else
              v29 = 4;
            __asm { BR              X12 }
            return result;
        }
        *((_BYTE *)a1 + v22) = v30;
        break;
      default:
        if (v22 <= 3)
          v23 = v22;
        else
          v23 = 4;
        __asm { BR              X12 }
        return result;
    }
  }
  return a1;
}

uint64_t sub_224D62D94(uint64_t a1, unsigned int a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char v14;
  int v15;
  unsigned int v17;
  int v18;
  unsigned int v19;

  v4 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  v5 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  v6 = *(_QWORD *)(sub_224D8203C() - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = (v5 + v7) & ~v7;
  v9 = *(_QWORD *)(v6 + 64);
  if (v8 + v9 > v4)
    v4 = v8 + v9;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64)
       + v7
       + ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))) & ~v7)
     + v9 > v4)
    v4 = ((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64)
         + v7
         + ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))) & ~v7)
       + v9;
  v11 = swift_getAssociatedTypeWitness();
  if (((*(_QWORD *)(*(_QWORD *)(v11 - 8) + 64)
       + v7
       + ((*(unsigned __int8 *)(*(_QWORD *)(v11 - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v11 - 8) + 80))) & ~v7)
     + v9 <= v4)
    v12 = v4;
  else
    v12 = ((*(_QWORD *)(*(_QWORD *)(v11 - 8) + 64)
          + v7
          + ((*(unsigned __int8 *)(*(_QWORD *)(v11 - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v11 - 8) + 80))) & ~v7)
        + v9;
  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_26;
  v13 = v12 + 1;
  v14 = 8 * (v12 + 1);
  if ((v12 + 1) <= 3)
  {
    v17 = ((a2 + ~(-1 << v14) - 252) >> v14) + 1;
    if (HIWORD(v17))
    {
      v15 = *(_DWORD *)(a1 + v13);
      if (!v15)
        goto LABEL_26;
      goto LABEL_19;
    }
    if (v17 > 0xFF)
    {
      v15 = *(unsigned __int16 *)(a1 + v13);
      if (!*(_WORD *)(a1 + v13))
        goto LABEL_26;
      goto LABEL_19;
    }
    if (v17 < 2)
    {
LABEL_26:
      v19 = *(unsigned __int8 *)(a1 + v12);
      if (v19 >= 4)
        return (v19 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v15 = *(unsigned __int8 *)(a1 + v13);
  if (!*(_BYTE *)(a1 + v13))
    goto LABEL_26;
LABEL_19:
  v18 = (v15 - 1) << v14;
  if (v13 > 3)
    v18 = 0;
  if ((_DWORD)v13)
  {
    if (v13 > 3)
      LODWORD(v13) = 4;
    __asm { BR              X11 }
  }
  return (v18 + 253);
}

void sub_224D62FD8(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  unint64_t v14;
  size_t v15;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  int v19;

  v6 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  v7 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  v8 = *(_QWORD *)(sub_224D8203C() - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (v7 + v9) & ~v9;
  v11 = *(_QWORD *)(v8 + 64);
  if (v10 + v11 > v6)
    v6 = v10 + v11;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64)
       + v9
       + ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))) & ~v9)
     + v11 > v6)
    v6 = ((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64)
         + v9
         + ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))) & ~v9)
       + v11;
  v13 = swift_getAssociatedTypeWitness();
  v14 = ((*(_QWORD *)(*(_QWORD *)(v13 - 8) + 64)
        + v9
        + ((*(unsigned __int8 *)(*(_QWORD *)(v13 - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v13 - 8) + 80))) & ~v9)
      + v11;
  if (v14 <= v6)
    v14 = v6;
  v15 = v14 + 1;
  if (a3 < 0xFD)
  {
    v16 = 0;
  }
  else if (v15 <= 3)
  {
    v18 = ((a3 + ~(-1 << (8 * v15)) - 252) >> (8 * v15)) + 1;
    if (HIWORD(v18))
    {
      v16 = 4u;
    }
    else if (v18 >= 0x100)
    {
      v16 = 2;
    }
    else
    {
      v16 = v18 > 1;
    }
  }
  else
  {
    v16 = 1u;
  }
  if (a2 <= 0xFC)
    __asm { BR              X11 }
  v17 = a2 - 253;
  if (v15 < 4)
  {
    if ((_DWORD)v14 != -1)
    {
      v19 = v17 & ~(-1 << (8 * v15));
      bzero(a1, v15);
      if ((_DWORD)v15 == 3)
      {
        *(_WORD *)a1 = v19;
        a1[2] = BYTE2(v19);
      }
      else if ((_DWORD)v15 == 2)
      {
        *(_WORD *)a1 = v19;
      }
      else
      {
        *a1 = v19;
      }
    }
  }
  else
  {
    bzero(a1, v14 + 1);
    *(_DWORD *)a1 = v17;
  }
  __asm { BR              X10 }
}

uint64_t sub_224D63298(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  unint64_t v10;
  uint64_t result;
  uint64_t v12;

  v2 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  v3 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
  v4 = *(_QWORD *)(sub_224D8203C() - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  v6 = (v3 + v5) & ~v5;
  v7 = *(_QWORD *)(v4 + 64);
  if (v6 + v7 > v2)
    v2 = v6 + v7;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  if (((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64)
       + v5
       + ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))) & ~v5)
     + v7 > v2)
    v2 = ((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64)
         + v5
         + ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))) & ~v5)
       + v7;
  v9 = swift_getAssociatedTypeWitness();
  v10 = ((*(_QWORD *)(*(_QWORD *)(v9 - 8) + 64)
        + v5
        + ((*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v9 - 8) + 80))) & ~v5)
      + v7;
  if (v10 <= v2)
    v10 = v2;
  result = *(unsigned __int8 *)(a1 + v10);
  if (result >= 4)
  {
    if (v10 <= 3)
      v12 = v10;
    else
      v12 = 4;
    __asm { BR              X12 }
  }
  return result;
}

void sub_224D6346C(_BYTE *a1, unsigned int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  size_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t AssociatedTypeWitness;
  uint64_t v21;
  size_t v22;
  unsigned int v23;
  unsigned int v24;
  int v25;

  if (a2 > 3)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
    v15 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
    v16 = *(_QWORD *)(sub_224D8203C() - 8);
    v17 = *(unsigned __int8 *)(v16 + 80);
    v18 = (v15 + v17) & ~v17;
    v19 = *(_QWORD *)(v16 + 64);
    if (v18 + v19 > v14)
      v14 = v18 + v19;
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64)
         + v17
         + ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))) & ~v17)
       + v19 > v14)
      v14 = ((*(_QWORD *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 64)
            + v17
            + ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80))) & ~v17)
          + v19;
    v21 = swift_getAssociatedTypeWitness();
    if (((*(_QWORD *)(*(_QWORD *)(v21 - 8) + 64)
         + v17
         + ((*(unsigned __int8 *)(*(_QWORD *)(v21 - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v21 - 8) + 80))) & ~v17)
       + v19 <= v14)
      v22 = v14;
    else
      v22 = ((*(_QWORD *)(*(_QWORD *)(v21 - 8) + 64)
            + v17
            + ((*(unsigned __int8 *)(*(_QWORD *)(v21 - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v21 - 8) + 80))) & ~v17)
          + v19;
    v23 = a2 - 4;
    if (v22 < 4)
    {
      v24 = v23 >> (8 * v22);
      v25 = v23 & ~(-1 << (8 * v22));
      a1[v22] = v24 + 4;
      bzero(a1, v22);
      if ((_DWORD)v22 == 3)
      {
        *(_WORD *)a1 = v25;
        a1[2] = BYTE2(v25);
      }
      else if ((_DWORD)v22 == 2)
      {
        *(_WORD *)a1 = v25;
      }
      else
      {
        *a1 = v25;
      }
    }
    else
    {
      a1[v22] = 4;
      bzero(a1, v22);
      *(_DWORD *)a1 = v23;
    }
  }
  else
  {
    v4 = sub_224D8203C();
    v5 = swift_getAssociatedTypeWitness();
    v6 = *(_QWORD *)(v4 - 8);
    v7 = *(unsigned __int8 *)(v6 + 80);
    v8 = *(_QWORD *)(v6 + 64);
    v9 = ((((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80))
         + *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64)
         + v7) & ~v7)
       + v8;
    v10 = swift_getAssociatedTypeWitness();
    v11 = ((*(_QWORD *)(*(_QWORD *)(v10 - 8) + 64)
          + v7
          + ((*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v10 - 8) + 80))) & ~v7)
        + v8;
    v12 = ((*(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64) + v7) & ~v7) + v8;
    v13 = *(_QWORD *)(*(_QWORD *)(swift_getAssociatedTypeWitness() - 8) + 64);
    if (v12 > v13)
      v13 = v12;
    if (v11 > v13)
      v13 = v11;
    if (v9 > v13)
      v13 = v9;
    a1[v13] = a2;
  }
}

uint64_t sub_224D63770()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t _s12PayloadErrorVwCP(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_224D637A8()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t sub_224D637E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_224D63860(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_retain();
  swift_release();
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_retain();
  swift_release();
  v6 = a2[7];
  a1[6] = a2[6];
  a1[7] = v6;
  swift_retain();
  swift_release();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t sub_224D63908(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  v4 = *(_QWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = v4;
  swift_release();
  return a1;
}

uint64_t sub_224D63974(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_224D639BC(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
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
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for ShellConnectionSender(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ShellConnectionSender);
}

uint64_t sub_224D63A18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  type metadata accessor for ShellConnectionMessage(255, *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 40), a4);
  v5 = sub_224D826D8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
  return swift_deallocObject();
}

uint64_t sub_224D63A8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for ShellConnectionMessage(255, *(_QWORD *)(v4 + 24), *(_QWORD *)(v4 + 40), a4);
  sub_224D826D8();
  return sub_224D826CC();
}

uint64_t sub_224D63AD8(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_224D63AE8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_224D63B30(__int128 *a1, uint64_t a2)
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

uint64_t sub_224D63B48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_224D63BF0(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, _QWORD, unint64_t, uint64_t, uint64_t))sub_224D60A2C);
}

uint64_t objectdestroy_4Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  type metadata accessor for ShellConnectionMessage(255, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v5 = sub_224D826D8();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v8 = (((*(_QWORD *)(v6 + 64) + v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  (*(void (**)(unint64_t, uint64_t))(v6 + 8))(v4 + v7, v5);
  __swift_destroy_boxed_opaque_existential_1Tm(v4 + v8);
  return swift_deallocObject();
}

uint64_t sub_224D63BE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_224D63BF0(a1, a2, a3, (uint64_t (*)(uint64_t, uint64_t, uint64_t, unint64_t, _QWORD, unint64_t, uint64_t, uint64_t))sub_224D60674);
}

uint64_t sub_224D63BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t, uint64_t, uint64_t, unint64_t, _QWORD, unint64_t, uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v8 = *(_QWORD *)(v4 + 16);
  v9 = *(_QWORD *)(v4 + 24);
  type metadata accessor for ShellConnectionMessage(255, v8, v9, (uint64_t)a4);
  v10 = *(_QWORD *)(sub_224D826D8() - 8);
  v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v12 = (*(_QWORD *)(v10 + 64) + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  return a4(a1, a2, a3, v4 + v11, *(_QWORD *)(v4 + v12), v4 + ((v12 + 15) & 0xFFFFFFFFFFFFFFF8), v8, v9);
}

uint64_t sub_224D63CA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_224D63D28(a1, a2, a3, a4);
}

uint64_t objectdestroy_10Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  type metadata accessor for ShellConnectionMessage(255, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24), a4);
  v5 = sub_224D826D8();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4+ ((*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v5 - 8) + 80)), v5);
  return swift_deallocObject();
}

uint64_t sub_224D63D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *(_QWORD *)(v4 + 16);
  v7 = *(_QWORD *)(v4 + 24);
  type metadata accessor for ShellConnectionMessage(255, v6, v7, a4);
  v8 = *(unsigned __int8 *)(*(_QWORD *)(sub_224D826D8() - 8) + 80);
  return sub_224D6055C(a1, v4 + ((v8 + 32) & ~v8), v6, v7);
}

uint64_t sub_224D63D98()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D63DBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_224D6A528(a1, a2, a3);
}

uint64_t sub_224D63DDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_224D6A2AC(a1, a2, a3);
}

uint64_t sub_224D63DFC(uint64_t a1, uint64_t a2)
{
  return sub_224D69FAC(a1, a2);
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

uint64_t sub_224D63E3C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t destroy for ShellConnectionReceiver(_QWORD *a1)
{
  uint64_t result;

  result = swift_bridgeObjectRelease();
  if (a1[2])
    result = swift_release();
  if (a1[4])
    result = swift_release();
  if (a1[6])
    result = swift_release();
  if (a1[8])
    return swift_release();
  return result;
}

_QWORD *initializeWithCopy for ShellConnectionReceiver(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2 + 2;
  v5 = a2[2];
  swift_bridgeObjectRetain();
  if (v5)
  {
    v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  v8 = a2[4];
  if (v8)
  {
    v9 = a2[5];
    a1[4] = v8;
    a1[5] = v9;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
  }
  v10 = a2[6];
  if (v10)
  {
    v11 = a2[7];
    a1[6] = v10;
    a1[7] = v11;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
  }
  v12 = a2[8];
  if (v12)
  {
    v13 = a2[9];
    a1[8] = v12;
    a1[9] = v13;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
  }
  return a1;
}

_QWORD *assignWithCopy for ShellConnectionReceiver(_QWORD *a1, _QWORD *a2)
{
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

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[2];
  if (a1[2])
  {
    if (v4)
    {
      v5 = a2[3];
      a1[2] = v4;
      a1[3] = v5;
      swift_retain();
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v4)
  {
    v6 = a2[3];
    a1[2] = v4;
    a1[3] = v6;
    swift_retain();
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  v7 = a2[4];
  if (a1[4])
  {
    if (v7)
    {
      v8 = a2[5];
      a1[4] = v7;
      a1[5] = v8;
      swift_retain();
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v7)
  {
    v9 = a2[5];
    a1[4] = v7;
    a1[5] = v9;
    swift_retain();
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  v10 = a2[6];
  if (a1[6])
  {
    if (v10)
    {
      v11 = a2[7];
      a1[6] = v10;
      a1[7] = v11;
      swift_retain();
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v10)
  {
    v12 = a2[7];
    a1[6] = v10;
    a1[7] = v12;
    swift_retain();
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  v13 = a2[8];
  if (!a1[8])
  {
    if (v13)
    {
      v15 = a2[9];
      a1[8] = v13;
      a1[9] = v15;
      swift_retain();
      return a1;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    return a1;
  }
  if (!v13)
  {
    swift_release();
    goto LABEL_28;
  }
  v14 = a2[9];
  a1[8] = v13;
  a1[9] = v14;
  swift_retain();
  swift_release();
  return a1;
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

_QWORD *assignWithTake for ShellConnectionReceiver(_QWORD *a1, _QWORD *a2)
{
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

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[2];
  if (a1[2])
  {
    if (v5)
    {
      v6 = a2[3];
      a1[2] = v5;
      a1[3] = v6;
      swift_release();
      goto LABEL_8;
    }
    swift_release();
  }
  else if (v5)
  {
    v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    goto LABEL_8;
  }
  *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
LABEL_8:
  v8 = a2[4];
  if (a1[4])
  {
    if (v8)
    {
      v9 = a2[5];
      a1[4] = v8;
      a1[5] = v9;
      swift_release();
      goto LABEL_15;
    }
    swift_release();
  }
  else if (v8)
  {
    v10 = a2[5];
    a1[4] = v8;
    a1[5] = v10;
    goto LABEL_15;
  }
  *((_OWORD *)a1 + 2) = *((_OWORD *)a2 + 2);
LABEL_15:
  v11 = a2[6];
  if (a1[6])
  {
    if (v11)
    {
      v12 = a2[7];
      a1[6] = v11;
      a1[7] = v12;
      swift_release();
      goto LABEL_22;
    }
    swift_release();
  }
  else if (v11)
  {
    v13 = a2[7];
    a1[6] = v11;
    a1[7] = v13;
    goto LABEL_22;
  }
  *((_OWORD *)a1 + 3) = *((_OWORD *)a2 + 3);
LABEL_22:
  v14 = a2[8];
  if (!a1[8])
  {
    if (v14)
    {
      v16 = a2[9];
      a1[8] = v14;
      a1[9] = v16;
      return a1;
    }
LABEL_28:
    *((_OWORD *)a1 + 4) = *((_OWORD *)a2 + 4);
    return a1;
  }
  if (!v14)
  {
    swift_release();
    goto LABEL_28;
  }
  v15 = a2[9];
  a1[8] = v14;
  a1[9] = v15;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellConnectionReceiver(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ShellConnectionReceiver(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellConnectionReceiver()
{
  return &type metadata for ShellConnectionReceiver;
}

uint64_t sub_224D643A0(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_224D643BC()
{
  return sub_224D82078();
}

uint64_t sub_224D643C8()
{
  return sub_224D8206C();
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.streamID.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_224D81F7C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.agentPid.getter()
{
  uint64_t v0;

  return *(unsigned int *)(v0 + *(int *)(type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity() + 20));
}

uint64_t type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity()
{
  uint64_t result;

  result = qword_2557D79A0;
  if (!qword_2557D79A0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.init(streamID:agentPid:)@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t result;

  v6 = sub_224D81F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  result = type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity();
  *(_DWORD *)(a3 + *(int *)(result + 20)) = a2;
  return result;
}

uint64_t sub_224D644CC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x646950746E656761;
  else
    return 0x44496D6165727473;
}

uint64_t sub_224D644FC(char *a1, char *a2)
{
  return sub_224D75F54(*a1, *a2);
}

uint64_t sub_224D64508()
{
  return sub_224D76388();
}

uint64_t sub_224D64510()
{
  return sub_224D76DDC();
}

uint64_t sub_224D64518()
{
  return sub_224D77234();
}

uint64_t sub_224D64520@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_224D82834();
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

uint64_t sub_224D6457C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D644CC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D645A4()
{
  char *v0;

  return sub_224D644CC(*v0);
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.propertyListValue.getter()
{
  return sub_224D82240();
}

uint64_t sub_224D645D8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  int v16;
  char *v17;
  uint64_t v18;
  _DWORD v20[3];
  char v21;
  char v22;
  char v23;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D79E0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D79E8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v20 - v10;
  v12 = (char *)v20 + *(int *)(v9 + 48) - v10;
  *((_BYTE *)v20 - v10) = 0;
  v13 = sub_224D81F7C();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = *(void (**)(char *, uint64_t, uint64_t))(v14 + 16);
  v15(v12, a1, v13);
  v16 = *(_DWORD *)(a1 + *(int *)(type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity() + 20));
  v17 = &v8[*(int *)(v5 + 48)];
  *v8 = 0;
  v15(v17, (uint64_t)v12, v13);
  (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v4, v17, v13);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v4, 0, 1, v13);
  v23 = 0;
  v22 = 1;
  v20[2] = v16;
  v21 = 0;
  sub_224D64960();
  v18 = sub_224D823D8();
  sub_224D5BE98((uint64_t)v4, &qword_2557D79E0);
  sub_224D5BE98((uint64_t)v11, &qword_2557D79E8);
  return v18;
}

uint64_t sub_224D647C0()
{
  uint64_t v0;

  return sub_224D645D8(*(_QWORD *)(v0 + 16));
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  int v13;
  _DWORD v14[2];
  _BYTE v15[24];
  ValueMetadata *v16;
  unint64_t v17;

  v5 = sub_224D81F7C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = &type metadata for ShellAgentSystem.AgentEndpoint.Identity.Key;
  v9 = sub_224D64960();
  v17 = v9;
  v15[0] = 0;
  sub_224D821F8();
  if (v2)
  {
    v10 = sub_224D82264();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(a1, v10);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
    v16 = &type metadata for ShellAgentSystem.AgentEndpoint.Identity.Key;
    v17 = v9;
    v15[0] = 1;
    sub_224D821F8();
    v12 = sub_224D82264();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
    v13 = v14[1];
    (*(void (**)(uint64_t, char *, uint64_t))(v6 + 32))(a2, v8, v5);
    result = type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity();
    *(_DWORD *)(a2 + *(int *)(result + 20)) = v13;
  }
  return result;
}

unint64_t sub_224D64960()
{
  unint64_t result;

  result = qword_2557D7908;
  if (!qword_2557D7908)
  {
    result = MEMORY[0x22768C914](&unk_224D83B2C, &type metadata for ShellAgentSystem.AgentEndpoint.Identity.Key);
    atomic_store(result, (unint64_t *)&qword_2557D7908);
  }
  return result;
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.hash(into:)()
{
  sub_224D81F7C();
  sub_224D6503C(&qword_2557D7910, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_224D825E8();
  type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity();
  return sub_224D82900();
}

BOOL static ShellAgentSystem.AgentEndpoint.Identity.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if ((sub_224D81F70() & 1) == 0)
    return 0;
  v4 = type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity();
  return *(_DWORD *)(a1 + *(int *)(v4 + 20)) == *(_DWORD *)(a2 + *(int *)(v4 + 20));
}

uint64_t ShellAgentSystem.AgentEndpoint.Identity.hashValue.getter()
{
  sub_224D828E8();
  sub_224D81F7C();
  sub_224D6503C(&qword_2557D7910, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_224D825E8();
  type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity();
  sub_224D82900();
  return sub_224D8290C();
}

uint64_t sub_224D64AE8()
{
  sub_224D828E8();
  sub_224D81F7C();
  sub_224D6503C(&qword_2557D7910, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_224D825E8();
  sub_224D82900();
  return sub_224D8290C();
}

uint64_t sub_224D64B70()
{
  sub_224D81F7C();
  sub_224D6503C(&qword_2557D7910, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_224D825E8();
  return sub_224D82900();
}

uint64_t sub_224D64BE0()
{
  sub_224D828E8();
  sub_224D81F7C();
  sub_224D6503C(&qword_2557D7910, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
  sub_224D825E8();
  sub_224D82900();
  return sub_224D8290C();
}

uint64_t sub_224D64C64()
{
  return sub_224D82240();
}

uint64_t sub_224D64C90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ShellAgentSystem.AgentEndpoint.Identity.init(propertyListValue:)(a1, a2);
}

BOOL sub_224D64CA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (sub_224D81F70() & 1) != 0 && *(_DWORD *)(a1 + *(int *)(a3 + 20)) == *(_DWORD *)(a2 + *(int *)(a3 + 20));
}

void sub_224D64CF4()
{
  qword_2557D78F8 = 0x747865746E6F63;
  unk_2557D7900 = 0xE700000000000000;
}

uint64_t static ShellAgentSystem.AgentEndpoint.encode(context:)()
{
  sub_224D820C0();
  sub_224D6503C(&qword_2557D7918, (uint64_t (*)(uint64_t))MEMORY[0x24BE777F0], MEMORY[0x24BE777E8]);
  return sub_224D8224C();
}

uint64_t sub_224D64D94(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (qword_2557D71D8 != -1)
    swift_once();
  v6 = unk_2557D7900;
  *a1 = qword_2557D78F8;
  a1[1] = v6;
  v7 = sub_224D820C0();
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a2, a3, v7);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v8 + 56))(a2, 0, 1, v7);
  return swift_bridgeObjectRetain();
}

uint64_t sub_224D64E40(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_224D64D94(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t static ShellAgentSystem.AgentEndpoint.decode(context:)()
{
  _QWORD v1[5];

  if (qword_2557D71D8 != -1)
    swift_once();
  v1[3] = MEMORY[0x24BEE0D00];
  v1[4] = MEMORY[0x24BE76CB0];
  v1[0] = qword_2557D78F8;
  v1[1] = unk_2557D7900;
  sub_224D820C0();
  sub_224D6503C(&qword_2557D7918, (uint64_t (*)(uint64_t))MEMORY[0x24BE777F0], MEMORY[0x24BE777E8]);
  swift_bridgeObjectRetain();
  sub_224D821F8();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v1);
}

uint64_t sub_224D64F2C()
{
  return MEMORY[0x24BE76190];
}

uint64_t sub_224D64F38()
{
  return sub_224D6503C(&qword_2557D7910, (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58], MEMORY[0x24BDCEA88]);
}

unint64_t sub_224D64F68()
{
  unint64_t result;

  result = qword_2557D7920;
  if (!qword_2557D7920)
  {
    result = MEMORY[0x22768C914](&protocol conformance descriptor for ShellAgentSystem.AgentEndpoint, &type metadata for ShellAgentSystem.AgentEndpoint);
    atomic_store(result, (unint64_t *)&qword_2557D7920);
  }
  return result;
}

uint64_t sub_224D64FAC()
{
  return sub_224D6503C(&qword_2557D7928, (uint64_t (*)(uint64_t))type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity, (uint64_t)&protocol conformance descriptor for ShellAgentSystem.AgentEndpoint.Identity);
}

uint64_t sub_224D64FD8()
{
  return MEMORY[0x24BE76520];
}

uint64_t sub_224D64FE4()
{
  return sub_224D6503C(&qword_2557D7930, (uint64_t (*)(uint64_t))type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity, (uint64_t)&protocol conformance descriptor for ShellAgentSystem.AgentEndpoint.Identity);
}

uint64_t sub_224D65010()
{
  return sub_224D6503C(&qword_2557D7938, (uint64_t (*)(uint64_t))type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity, (uint64_t)&protocol conformance descriptor for ShellAgentSystem.AgentEndpoint.Identity);
}

uint64_t sub_224D6503C(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x22768C914](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_224D65080()
{
  unint64_t result;

  result = qword_2557D7940;
  if (!qword_2557D7940)
  {
    result = MEMORY[0x22768C914](&protocol conformance descriptor for ShellAgentSystem.ShellEndpoint, &type metadata for ShellAgentSystem.ShellEndpoint);
    atomic_store(result, (unint64_t *)&qword_2557D7940);
  }
  return result;
}

uint64_t sub_224D650C4()
{
  sub_224D820C0();
  sub_224D6503C(&qword_2557D7918, (uint64_t (*)(uint64_t))MEMORY[0x24BE777F0], MEMORY[0x24BE777E8]);
  return sub_224D8224C();
}

uint64_t sub_224D65140()
{
  _QWORD v1[5];

  if (qword_2557D71D8 != -1)
    swift_once();
  v1[3] = MEMORY[0x24BEE0D00];
  v1[4] = MEMORY[0x24BE76CB0];
  v1[0] = qword_2557D78F8;
  v1[1] = unk_2557D7900;
  sub_224D820C0();
  sub_224D6503C(&qword_2557D7918, (uint64_t (*)(uint64_t))MEMORY[0x24BE777F0], MEMORY[0x24BE777E8]);
  swift_bridgeObjectRetain();
  sub_224D821F8();
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v1);
}

ValueMetadata *type metadata accessor for ShellAgentSystem()
{
  return &type metadata for ShellAgentSystem;
}

ValueMetadata *type metadata accessor for ShellAgentSystem.ShellEndpoint()
{
  return &type metadata for ShellAgentSystem.ShellEndpoint;
}

ValueMetadata *type metadata accessor for ShellAgentSystem.AgentEndpoint()
{
  return &type metadata for ShellAgentSystem.AgentEndpoint;
}

uint64_t *initializeBufferWithCopyOfBuffer for ShellAgentSystem.AgentEndpoint.Identity(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_224D81F7C();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    *(_DWORD *)((char *)a1 + *(int *)(a3 + 20)) = *(_DWORD *)((char *)a2 + *(int *)(a3 + 20));
  }
  return a1;
}

uint64_t destroy for ShellAgentSystem.AgentEndpoint.Identity(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_224D81F7C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for ShellAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_224D81F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithCopy for ShellAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_224D81F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t initializeWithTake for ShellAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_224D81F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for ShellAgentSystem.AgentEndpoint.Identity(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = sub_224D81F7C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  *(_DWORD *)(a1 + *(int *)(a3 + 20)) = *(_DWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellAgentSystem.AgentEndpoint.Identity()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_224D6548C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_224D81F7C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for ShellAgentSystem.AgentEndpoint.Identity()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_224D654D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_224D81F7C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, a2, v4);
}

uint64_t sub_224D65514()
{
  uint64_t result;
  unint64_t v1;

  result = sub_224D81F7C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for ShellAgentSystem.AgentEndpoint.Identity.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D655D4 + 4 * byte_224D83875[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_224D65608 + 4 * byte_224D83870[v4]))();
}

uint64_t sub_224D65608(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D65610(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D65618);
  return result;
}

uint64_t sub_224D65624(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D6562CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_224D65630(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D65638(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ShellAgentSystem.AgentEndpoint.Identity.Key()
{
  return &type metadata for ShellAgentSystem.AgentEndpoint.Identity.Key;
}

unint64_t sub_224D65658()
{
  unint64_t result;

  result = qword_2557D79D8;
  if (!qword_2557D79D8)
  {
    result = MEMORY[0x22768C914](&unk_224D83B04, &type metadata for ShellAgentSystem.AgentEndpoint.Identity.Key);
    atomic_store(result, (unint64_t *)&qword_2557D79D8);
  }
  return result;
}

unint64_t sub_224D656A4(uint64_t a1)
{
  unint64_t result;

  result = sub_224D656C8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_224D656C8()
{
  unint64_t result;

  result = qword_2557D79F0;
  if (!qword_2557D79F0)
  {
    result = MEMORY[0x22768C914](MEMORY[0x24BE77610], MEMORY[0x24BE77620]);
    atomic_store(result, (unint64_t *)&qword_2557D79F0);
  }
  return result;
}

unint64_t sub_224D6570C(uint64_t a1)
{
  unint64_t result;

  result = sub_224D65730();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_224D65730()
{
  unint64_t result;

  result = qword_2557D79F8;
  if (!qword_2557D79F8)
  {
    result = MEMORY[0x22768C914](MEMORY[0x24BE77640], MEMORY[0x24BE77650]);
    atomic_store(result, (unint64_t *)&qword_2557D79F8);
  }
  return result;
}

uint64_t sub_224D65774(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_224D65780()
{
  return swift_initClassMetadata2();
}

uint64_t sub_224D657C8(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  id v10;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BA0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_224D82690();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  v9[6] = a2;
  v10 = v2;
  swift_retain();
  sub_224D660B8((uint64_t)v7, (uint64_t)&unk_2557D7C90, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_224D658A0(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v6[9] = a5;
  v6[10] = a6;
  v6[8] = a4;
  v7 = *MEMORY[0x24BEE4EA0];
  v6[11] = *a4;
  v6[12] = v7;
  v8 = sub_224D825B8();
  v6[13] = v8;
  v6[14] = *(_QWORD *)(v8 - 8);
  v6[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_224D65918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = v4[11] & v4[12];
  v6 = *(_QWORD *)(v4[8] + qword_2557D7A08);
  v4[16] = v6;
  v7 = type metadata accessor for ServiceHubPipeService.ServiceHubTransport(0, *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), a4);
  v4[5] = v7;
  v4[6] = MEMORY[0x22768C914](&unk_224D83CF0, v7);
  v4[2] = v6;
  swift_retain();
  v8 = (_QWORD *)swift_task_alloc();
  v4[17] = v8;
  *v8 = v4;
  v8[1] = sub_224D659CC;
  return sub_224D81F94();
}

uint64_t sub_224D659CC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 144) = v0;
  swift_task_dealloc();
  if (!v0)
    __swift_destroy_boxed_opaque_existential_1Tm(v2 + 16);
  return swift_task_switch();
}

uint64_t sub_224D65A38()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t (*)(void *), uint64_t);

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(void (**)(uint64_t (*)(void *), uint64_t))(v0 + 72);
  swift_retain();
  v2(sub_224D67FCC, v1);
  swift_release();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D65A98()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  _QWORD *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v1 = *(void **)(v0 + 144);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  sub_224D82588();
  v2 = v1;
  v3 = v1;
  v4 = sub_224D825A0();
  v5 = sub_224D82750();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 144);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v7 = 138412290;
    v9 = v6;
    v10 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 56) = v10;
    sub_224D8278C();
    *v8 = v10;

    _os_log_impl(&dword_224D58000, v4, v5, "Failed to attach host transport to message pipe: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D7E40);
    swift_arrayDestroy();
    MEMORY[0x22768C9BC](v8, -1, -1);
    MEMORY[0x22768C9BC](v7, -1, -1);
  }
  else
  {
    v11 = *(void **)(v0 + 144);

  }
  v12 = *(void **)(v0 + 144);
  v14 = *(_QWORD *)(v0 + 112);
  v13 = *(_QWORD *)(v0 + 120);
  v15 = *(_QWORD *)(v0 + 104);

  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
  sub_224D65EFC();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D65C58(void *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t result;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[3];
  uint64_t v32;

  v28 = *v1;
  v29 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BD0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v26 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7CA0);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = v1;
  v9 = (char *)v1 + qword_2557D7AF8;
  v10 = *(int *)(v2 + 48);
  v11 = &v4[v10];
  v12 = &v9[v10];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BE0);
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, char *, uint64_t))(v14 + 16))(v4, v9, v13);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BE8);
  v16 = *(_QWORD *)(v15 - 8);
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v11, v12, v15);
  v31[0] = v29;
  v29;
  sub_224D826C0();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v11, v15);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v4, v13);
  LODWORD(v11) = (*(uint64_t (**)(char *, uint64_t))(v6 + 88))(v8, v5);
  LODWORD(v16) = *MEMORY[0x24BEE69D0];
  result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if ((_DWORD)v11 == (_DWORD)v16)
  {
    v30 = v27;
    MEMORY[0x22768C914](&unk_224D83CF0, v28);
    sub_224D82168();
    v18 = v32;
    v19 = __swift_project_boxed_opaque_existential_1(v31, v32);
    v20 = *(_QWORD *)(v18 - 8);
    MEMORY[0x24BDAC7A8](v19);
    v22 = (char *)&v26 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v20 + 16))(v22);
    v23 = sub_224D8284C();
    if (v23)
    {
      v24 = (void *)v23;
      (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v18);
    }
    else
    {
      v24 = (void *)swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(v25, v22, v18);
    }
    sub_224D73434(v24);

    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v31);
  }
  return result;
}

uint64_t sub_224D65EFC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  id v14;
  _QWORD v16[2];

  v1 = v0;
  v2 = *MEMORY[0x24BEE4EA0] & *v0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BA0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_224D8230C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16[1] = *(_QWORD *)((char *)v0 + qword_2557D7A08);
  v11 = type metadata accessor for ServiceHubPipeService.ServiceHubTransport(0, *(_QWORD *)(v2 + 80), *(_QWORD *)(v2 + 88), v10);
  swift_retain();
  MEMORY[0x22768C914](&unk_224D83C70, v11);
  sub_224D82300();
  sub_224D822E8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  v12 = sub_224D82690();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v5, 1, 1, v12);
  v13 = (_QWORD *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = v1;
  v14 = v1;
  sub_224D660B8((uint64_t)v5, (uint64_t)&unk_2557D7C80, (uint64_t)v13);
  return swift_release();
}

uint64_t sub_224D660B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_224D82690();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_224D82684();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_224D5BE98(a1, &qword_2557D7BA0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_224D82678();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_224D66204(void *a1, int a2, void *a3)
{
  return sub_224D6642C(a1, a2, a3, (uint64_t)&unk_24ECEB4D0, (uint64_t)sub_224D67F10, (void (*)(uint64_t, uint64_t))sub_224D657C8);
}

uint64_t sub_224D66224(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_224D6623C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_224D662C0;
  return sub_224D81FAC();
}

uint64_t sub_224D662C0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void sub_224D66308(void *a1)
{
  id v1;

  v1 = a1;
  sub_224D65EFC();

}

uint64_t sub_224D6633C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = *MEMORY[0x24BEE4EA0] & *v2;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  v8 = type metadata accessor for ServiceHubPipeService.ServiceHubTransport(0, *(_QWORD *)(v5 + 80), *(_QWORD *)(v5 + 88), v7);
  swift_retain();
  swift_retain();
  MEMORY[0x22768C914](&unk_224D83CC0, v8);
  sub_224D82420();
  swift_release();
  return swift_release();
}

uint64_t sub_224D66410(void *a1, int a2, void *a3)
{
  return sub_224D6642C(a1, a2, a3, (uint64_t)&unk_24ECEB458, (uint64_t)sub_224D67E7C, (void (*)(uint64_t, uint64_t))sub_224D6633C);
}

uint64_t sub_224D6642C(void *a1, int a2, void *aBlock, uint64_t a4, uint64_t a5, void (*a6)(uint64_t, uint64_t))
{
  void *v9;
  uint64_t v10;
  id v11;

  v9 = _Block_copy(aBlock);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  v11 = a1;
  a6(a5, v10);

  return swift_release();
}

void sub_224D664A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  _QWORD v14[2];

  v14[0] = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BC8);
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v14 - v7;
  v9 = sub_224D8209C();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)v14 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D6727C();
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a1, v9);
  sub_224D67FD0(a2, (uint64_t)v8, &qword_2557D7BC8);
  v13 = sub_224D66698((uint64_t)v12, (uint64_t)v8);
  ((void (*)(void))v14[0])();

}

char *sub_224D66698(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  char *v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  void *v32;
  char *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD aBlock[6];
  uint64_t v39;

  v39 = a2;
  v4 = sub_224D8203C();
  v5 = *(_QWORD *)(v4 - 8);
  v35 = v4;
  v36 = v5;
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](v4);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BC8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_224D82264();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v37 = a1;
  sub_224D82084();
  if (v2)
  {

    sub_224D5BE98(v39, &qword_2557D7BC8);
    v15 = sub_224D8209C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v37, v15);
  }
  else
  {
    v33 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = v14;
    sub_224D8221C();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    v16 = (void *)sub_224D825C4();
    swift_bridgeObjectRelease();
    v17 = v39;
    sub_224D67FD0(v39, (uint64_t)v9, &qword_2557D7BC8);
    v18 = v35;
    v19 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v36 + 48))(v9, 1, v35);
    v20 = v37;
    if (v19 == 1)
    {
      sub_224D5BE98((uint64_t)v9, &qword_2557D7BC8);
      v21 = 0;
    }
    else
    {
      v22 = v36;
      v23 = *(void (**)(char *, char *, uint64_t))(v36 + 16);
      v32 = v16;
      v24 = v33;
      v23(v33, v9, v18);
      v25 = v20;
      v26 = (*(unsigned __int8 *)(v22 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v22 + 80);
      v27 = swift_allocObject();
      v28 = v27 + v26;
      v20 = v25;
      v29 = v24;
      v16 = v32;
      (*(void (**)(unint64_t, char *, uint64_t))(v22 + 32))(v28, v29, v18);
      v17 = v39;
      (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v18);
      aBlock[4] = sub_224D68074;
      aBlock[5] = v27;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_224D67358;
      aBlock[3] = &block_descriptor_1;
      v21 = _Block_copy(aBlock);
      swift_release();
    }
    v13 = (char *)objc_msgSend(v34, sel_initWithMessageType_payload_replyHandler_, 0, v16, v21);
    _Block_release(v21);

    sub_224D5BE98(v17, &qword_2557D7BC8);
    v30 = sub_224D8209C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 8))(v20, v30);
  }
  return v13;
}

uint64_t sub_224D669B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[10] = a5;
  v6[11] = a6;
  v6[9] = a4;
  v7 = sub_224D82264();
  v6[12] = v7;
  v6[13] = *(_QWORD *)(v7 - 8);
  v6[14] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BC8);
  v6[15] = swift_task_alloc();
  v8 = sub_224D8209C();
  v6[16] = v8;
  v6[17] = *(_QWORD *)(v8 - 8);
  v6[18] = swift_task_alloc();
  v6[19] = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BD0);
  v6[20] = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BD8);
  v6[21] = v9;
  v6[22] = *(_QWORD *)(v9 - 8);
  v6[23] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_224D66AB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = v0[20];
  v2 = v0[9] + qword_2557D7AF8;
  v3 = *(int *)(v0[19] + 48);
  v4 = v1 + v3;
  v5 = v2 + v3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BE0);
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v1, v2, v6);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BE8);
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v4, v5, v8);
  sub_224D826E4();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v4, v8);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v6);
  v10 = (_QWORD *)swift_task_alloc();
  v0[24] = v10;
  *v10 = v0;
  v10[1] = sub_224D66BE0;
  return sub_224D826F0();
}

uint64_t sub_224D66BE0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_224D66C34()
{
  uint64_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;

  v1 = *(void **)(v0 + 48);
  if (v1)
  {
    v2 = objc_msgSend(*(id *)(v0 + 48), sel_payload);
    if (v2
      && (*(_QWORD *)(v0 + 56) = v2,
          __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7C60),
          __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7C68),
          swift_dynamicCast()))
    {
      v4 = *(_QWORD *)(v0 + 104);
      v3 = *(_QWORD *)(v0 + 112);
      v5 = *(_QWORD *)(v0 + 96);
      sub_224D82210();
      sub_224D821D4();
      (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
      v6 = objc_msgSend(v1, sel_replyHandler);
      v7 = *(_QWORD *)(v0 + 120);
      if (v6)
      {
        v8 = v6;
        v9 = swift_allocObject();
        *(_QWORD *)(v9 + 16) = v8;
        v10 = swift_allocObject();
        *(_QWORD *)(v10 + 16) = sub_224D67D9C;
        *(_QWORD *)(v10 + 24) = v9;
        v11 = swift_allocObject();
        *(_QWORD *)(v11 + 16) = sub_224D67DC8;
        *(_QWORD *)(v11 + 24) = v10;
        v12 = swift_allocObject();
        *(_QWORD *)(v12 + 16) = sub_224D67DF0;
        *(_QWORD *)(v12 + 24) = v11;
        swift_retain();
        sub_224D81FF4();
        v13 = sub_224D8203C();
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 0, 1, v13);
        swift_release();
      }
      else
      {
        v20 = sub_224D8203C();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v7, 1, 1, v20);
      }
      v22 = *(_QWORD *)(v0 + 136);
      v21 = *(_QWORD *)(v0 + 144);
      v24 = *(_QWORD *)(v0 + 120);
      v23 = *(_QWORD *)(v0 + 128);
      (*(void (**)(uint64_t, uint64_t))(v0 + 80))(v21, v24);

      sub_224D5BE98(v24, &qword_2557D7BC8);
      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    }
    else
    {
      v14 = objc_msgSend(v1, sel_payload);
      if (v14)
      {
        v15 = v14;
        *(_QWORD *)(v0 + 40) = swift_getObjectType();
        *(_QWORD *)(v0 + 16) = v15;
      }
      else
      {
        *(_OWORD *)(v0 + 16) = 0u;
        *(_OWORD *)(v0 + 32) = 0u;
      }
      sub_224D67D34();
      v17 = (void *)swift_allocError();
      v19 = v18;
      sub_224D680D8(v0 + 16, v18, (uint64_t *)&unk_2557D8350);
      *(_BYTE *)(v19 + 32) = 0;
      swift_willThrow();
      sub_224D73434(v17);

    }
    v25 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 192) = v25;
    *v25 = v0;
    v25[1] = sub_224D66BE0;
    return sub_224D826F0();
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 176) + 8))(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 168));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_224D66F98()
{
  uint64_t v0;

  swift_release();
  swift_release();
  sub_224D5BE98(v0 + qword_2557D7AF8, &qword_2557D7BD0);
  return v0;
}

uint64_t sub_224D66FD4()
{
  sub_224D66F98();
  return swift_deallocClassInstance();
}

uint64_t sub_224D66FF4(uint64_t a1, uint64_t a2)
{
  return sub_224D67AEC(a1, a2);
}

uint64_t sub_224D67014()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);

  v2 = *v0;
  v4 = *(_QWORD *)(*v0 + 24);
  v3 = *(_QWORD *)(v2 + 32);
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8);
  swift_retain();
  return sub_224D67340(v5, v1, v4, v3);
}

uint64_t sub_224D6706C()
{
  return swift_retain();
}

unint64_t sub_224D67078()
{
  return 0xD00000000000001ALL;
}

uint64_t sub_224D67094(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22768C914](&unk_224D83CC0, a3);
  return sub_224D82414();
}

void sub_224D670E0()
{
  sub_224D67E50();
}

id _s17PreviewsOSSupport19CrashReportListenerCfD_0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_224D67130()
{
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t type metadata accessor for ServiceHubPipeService(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ServiceHubPipeService);
}

uint64_t sub_224D67184()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  char v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;

  v7 = MEMORY[0x24BEE0190] + 64;
  v8 = MEMORY[0x24BEE4AF0] + 64;
  sub_224D672B8(319, &qword_2557D7B80, MEMORY[0x24BEE6A98]);
  v1 = v0;
  if (v2 <= 0x3F)
  {
    sub_224D672B8(319, (unint64_t *)&unk_2557D7B90, (uint64_t (*)(uint64_t, unint64_t))MEMORY[0x24BEE6A40]);
    if (v4 > 0x3F)
    {
      return v3;
    }
    else
    {
      swift_getTupleTypeLayout2();
      v9 = &v6;
      return swift_initClassMetadata2();
    }
  }
  return v1;
}

uint64_t type metadata accessor for ServiceHubPipeService.ServiceHubTransport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ServiceHubPipeService.ServiceHubTransport);
}

unint64_t sub_224D6727C()
{
  unint64_t result;

  result = qword_2557D7B88;
  if (!qword_2557D7B88)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2557D7B88);
  }
  return result;
}

void sub_224D672B8(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, unint64_t))
{
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;

  if (!*a2)
  {
    v6 = sub_224D6727C();
    v7 = a3(a1, v6);
    if (!v8)
      atomic_store(v7, a2);
  }
}

void sub_224D67310()
{
  JUMPOUT(0x22768C914);
}

void sub_224D67320()
{
  JUMPOUT(0x22768C914);
}

void sub_224D67330()
{
  JUMPOUT(0x22768C914);
}

uint64_t sub_224D67340(uint64_t (*a1)(uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1(a3, a4);
}

uint64_t sub_224D67358(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

  return swift_unknownObjectRelease();
}

void sub_224D673C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_224D81EEC();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_224D67418(uint64_t a1, void *a2)
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
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v18;
  uint64_t v19;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7CA8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D7CB0);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v18 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v18 - v15;
  sub_224D675F0(a1, a2, &v19);
  swift_storeEnumTagMultiPayload();
  sub_224D680D8((uint64_t)v11, (uint64_t)v14, (uint64_t *)&unk_2557D7CB0);
  sub_224D680D8((uint64_t)v14, (uint64_t)v16, (uint64_t *)&unk_2557D7CB0);
  sub_224D8200C();
  sub_224D821C8();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return sub_224D5BE98((uint64_t)v16, (uint64_t *)&unk_2557D7CB0);
}

uint64_t sub_224D675F0(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  id v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;

  v6 = sub_224D82264();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    *(_QWORD *)&v23 = a1;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7C60);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7C68);
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_224D82210();
      sub_224D821D4();
      return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    }
    if (a2)
      goto LABEL_7;
    *((_QWORD *)&v24 + 1) = swift_getObjectType();
    *(_QWORD *)&v23 = a1;
  }
  else
  {
    if (a2)
    {
LABEL_7:
      swift_getErrorValue();
      v11 = a2;
      sub_224D828A0();
      v12 = *((_QWORD *)&v24 + 1);
      v13 = __swift_project_boxed_opaque_existential_1(&v23, *((uint64_t *)&v24 + 1));
      v14 = *(_QWORD *)(v12 - 8);
      MEMORY[0x24BDAC7A8](v13);
      v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v14 + 16))(v16);
      v17 = sub_224D8284C();
      if (v17)
      {
        v18 = v17;
        (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v12);
      }
      else
      {
        v18 = swift_allocError();
        (*(void (**)(uint64_t, char *, uint64_t))(v14 + 32))(v19, v16, v12);
      }
      swift_willThrow();

      result = __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v23);
      goto LABEL_13;
    }
    v23 = 0u;
    v24 = 0u;
  }
  sub_224D67D34();
  v18 = swift_allocError();
  v21 = v20;
  sub_224D680D8((uint64_t)&v23, v20, (uint64_t *)&unk_2557D8350);
  *(_BYTE *)(v21 + 32) = 1;
  swift_unknownObjectRetain();
  result = swift_willThrow();
LABEL_13:
  *a3 = v18;
  return result;
}

uint64_t sub_224D67870(uint64_t a1, void (*a2)(void *, void *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void **v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v16[4];

  v4 = sub_224D82264();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7C70);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (void **)((char *)&v16[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_224D67FD0(a1, (uint64_t)v10, &qword_2557D7C70);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v11 = *v10;
    swift_getErrorValue();
    sub_224D828A0();
    __swift_project_boxed_opaque_existential_1(v16, v16[3]);
    v12 = (void *)sub_224D82384();
    a2(0, v12);

    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  }
  else
  {
    (*(void (**)(char *, void **, uint64_t))(v5 + 32))(v7, v10, v4);
    sub_224D8221C();
    v14 = (void *)sub_224D825C4();
    swift_bridgeObjectRelease();
    a2(v14, 0);

    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_224D67A3C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_224D67AA0;
  return v6(a1);
}

uint64_t sub_224D67AA0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_224D67AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BA0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_224D82690();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = 0;
  v9[3] = 0;
  v9[4] = v2;
  v9[5] = a1;
  v9[6] = a2;
  swift_retain();
  swift_retain();
  sub_224D660B8((uint64_t)v7, (uint64_t)&unk_2557D7BB0, (uint64_t)v9);
  return swift_release();
}

uint64_t sub_224D67BC8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D67BFC(uint64_t a1)
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
  v9[1] = sub_224D67C7C;
  return sub_224D669B4(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_224D67C7C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_224D67CC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_224D67C7C;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2557D7BB8 + dword_2557D7BB8))(a1, v4);
}

unint64_t sub_224D67D34()
{
  unint64_t result;

  result = qword_2557D7BF0;
  if (!qword_2557D7BF0)
  {
    result = MEMORY[0x22768C914](&unk_224D85540, &_s12PayloadErrorVN);
    atomic_store(result, (unint64_t *)&qword_2557D7BF0);
  }
  return result;
}

uint64_t sub_224D67D78()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_224D67D9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_224D673C0(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_224D67DA4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D67DC8(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v2 + 16))(*a1, *a2);
}

uint64_t sub_224D67DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *, uint64_t *);
  uint64_t v5;
  uint64_t v6;

  v3 = *(uint64_t (**)(uint64_t *, uint64_t *))(v2 + 16);
  v5 = a2;
  v6 = a1;
  return v3(&v6, &v5);
}

uint64_t sub_224D67E24(uint64_t a1)
{
  uint64_t v1;

  return sub_224D67870(a1, *(void (**)(void *, void *))(v1 + 16));
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_224D67E50()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_224D67E7C()
{
  uint64_t v0;

  return sub_224D7342C(*(_QWORD *)(v0 + 16));
}

uint64_t sub_224D67E84()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_224D67EB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_224D6811C;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_224D67F10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_224D73394(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_224D67F18()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D67F4C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (_QWORD *)v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_224D6811C;
  return sub_224D658A0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_224D67FD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_224D68014()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_224D8203C();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_224D68074(uint64_t a1, void *a2)
{
  sub_224D8203C();
  return sub_224D67418(a1, a2);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_224D680D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void ShellService.Domain.machName(for:)(uint64_t a1)
{
  unsigned __int8 *v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7CC0);
  v3 = MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v1;
  v7 = &v5[*(int *)(v3 + 48)];
  *v5 = v6;
  v8 = sub_224D81F88();
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v7, a1, v8);
  __asm { BR              X9 }
}

uint64_t sub_224D681D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;

  v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 88))(v0, v1);
  if (v4 == *MEMORY[0x24BE78630])
    return 0xD000000000000027;
  if (v4 == *MEMORY[0x24BE78628])
    return 0xD00000000000002BLL;
  sub_224D6837C(v2);
  return 0x6E776F6E6B6E75;
}

uint64_t sub_224D6837C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7CC0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t ShellService.serviceIdentifier.getter()
{
  _BYTE *v0;
  unint64_t result;

  result = 0xD000000000000022;
  switch(*v0)
  {
    case 2:
    case 7:
      return result;
    case 3:
      result = 0xD000000000000023;
      break;
    case 6:
    case 8:
    case 9:
      result = 0xD000000000000028;
      break;
    default:
      result = 0xD000000000000019;
      break;
  }
  return result;
}

uint64_t ShellService.instanceIdentifier.getter()
{
  unsigned __int8 *v0;
  int v1;
  unsigned int v2;
  BOOL v3;
  uint64_t v4;

  v1 = *v0;
  v2 = v1 - 2;
  v3 = (v1 & 1) == 0;
  v4 = 0x65732D746E656761;
  if (v3)
    v4 = 0x7265732D74736F68;
  if (v2 >= 8)
    return v4;
  else
    return 0;
}

BOOL static ShellService.Instance.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ShellService.Instance.hash(into:)()
{
  return sub_224D828F4();
}

uint64_t ShellService.Instance.hashValue.getter()
{
  sub_224D828E8();
  sub_224D828F4();
  return sub_224D8290C();
}

unint64_t ShellService.description.getter()
{
  _BYTE *v0;
  unint64_t result;

  result = 0xD000000000000015;
  switch(*v0)
  {
    case 2:
    case 7:
      return result;
    case 3:
      result = 0xD000000000000016;
      break;
    case 4:
      result = 0xD00000000000001ALL;
      break;
    case 5:
    case 6:
    case 8:
    case 9:
      result = 0xD00000000000001BLL;
      break;
    default:
      sub_224D827D4();
      swift_bridgeObjectRelease();
      sub_224D8263C();
      swift_bridgeObjectRelease();
      result = 0xD00000000000001CLL;
      break;
  }
  return result;
}

BOOL static ShellService.Domain.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ShellService.Domain.hash(into:)()
{
  return sub_224D828F4();
}

uint64_t ShellService.Domain.hashValue.getter()
{
  sub_224D828E8();
  sub_224D828F4();
  return sub_224D8290C();
}

BOOL sub_224D68738(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

unint64_t ShellService.domainIdentifier.getter()
{
  unsigned __int8 *v0;
  unsigned int v1;
  unint64_t v2;
  unint64_t v3;

  v1 = *v0;
  if (v1 == 5)
    v2 = 0xD000000000000028;
  else
    v2 = 0xD000000000000027;
  if (v1 == 4)
    v2 = 0xD000000000000027;
  if (((1 << v1) & 0x3CC) != 0)
    v3 = 0xD00000000000001ELL;
  else
    v3 = v2;
  if (v1 <= 9)
    return v3;
  else
    return 0xD000000000000027;
}

uint64_t ShellService.Instance.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x697320746E656761;
  else
    return 0x6469732074736F68;
}

unint64_t sub_224D68828()
{
  unint64_t result;

  result = qword_2557D7CC8;
  if (!qword_2557D7CC8)
  {
    result = MEMORY[0x22768C914](&protocol conformance descriptor for ShellService.Instance, &type metadata for ShellService.Instance);
    atomic_store(result, (unint64_t *)&qword_2557D7CC8);
  }
  return result;
}

unint64_t sub_224D68870()
{
  unint64_t result;

  result = qword_2557D7CD0;
  if (!qword_2557D7CD0)
  {
    result = MEMORY[0x22768C914](&protocol conformance descriptor for ShellService.Domain, &type metadata for ShellService.Domain);
    atomic_store(result, (unint64_t *)&qword_2557D7CD0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for ShellService(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  unsigned int v6;
  unsigned int v7;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
  {
    v6 = *a1;
    if (v6 >= 2)
      v7 = v6 - 1;
    else
      v7 = 0;
    if (v7 >= 9)
      return v7 - 8;
    else
      return 0;
  }
  else
  {
    v2 = a2 + 9;
    if (a2 + 9 >= 0xFFFF00)
      v3 = 4;
    else
      v3 = 2;
    if (v2 >> 8 < 0xFF)
      v3 = 1;
    if (v2 >= 0x100)
      v4 = v3;
    else
      v4 = 0;
    return ((uint64_t (*)(void))((char *)&loc_224D68904 + 4 * byte_224D83D64[v4]))();
  }
}

uint64_t storeEnumTagSinglePayload for ShellService(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 9;
  if (a3 + 9 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xF7)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_224D689B0 + 4 * byte_224D83D6E[v5]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_224D689E4 + 4 * byte_224D83D69[v5]))();
}

uint64_t sub_224D689E4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D689EC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D689F4);
  return result;
}

uint64_t sub_224D68A00(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D68A08);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_224D68A0C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D68A14(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D68A20(unsigned __int8 *a1)
{
  unsigned int v1;

  v1 = *a1;
  if (v1 >= 2)
    return v1 - 1;
  else
    return 0;
}

_BYTE *sub_224D68A34(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for ShellService()
{
  return &type metadata for ShellService;
}

uint64_t storeEnumTagSinglePayload for ShellService.Instance(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D68AA0 + 4 * byte_224D83D78[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_224D68AD4 + 4 * byte_224D83D73[v4]))();
}

uint64_t sub_224D68AD4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D68ADC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D68AE4);
  return result;
}

uint64_t sub_224D68AF0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D68AF8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_224D68AFC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D68B04(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ShellService.Instance()
{
  return &type metadata for ShellService.Instance;
}

uint64_t getEnumTagSinglePayload for ShellService.Domain(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ShellService.Domain(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D68BFC + 4 * byte_224D83D82[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_224D68C30 + 4 * byte_224D83D7D[v4]))();
}

uint64_t sub_224D68C30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D68C38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D68C40);
  return result;
}

uint64_t sub_224D68C4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D68C54);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_224D68C58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D68C60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_224D68C6C(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ShellService.Domain()
{
  return &type metadata for ShellService.Domain;
}

uint64_t static JITSetupPayload.== infix(_:_:)()
{
  return 1;
}

uint64_t JITSetupPayload.hashValue.getter()
{
  sub_224D828E8();
  return sub_224D8290C();
}

uint64_t sub_224D68CD4(uint64_t a1)
{
  return sub_224D68D90(a1);
}

uint64_t JITSetupPayload.init(propertyListValue:)(uint64_t a1)
{
  return sub_224D68D90(a1);
}

uint64_t sub_224D68CFC()
{
  sub_224D828E8();
  return sub_224D8290C();
}

uint64_t sub_224D68D30()
{
  sub_224D828E8();
  return sub_224D8290C();
}

uint64_t sub_224D68D60()
{
  return 1;
}

uint64_t sub_224D68D68()
{
  return sub_224D8266C();
}

uint64_t JITSetupReply.init(propertyListValue:)(uint64_t a1)
{
  return sub_224D68D90(a1);
}

uint64_t sub_224D68D90(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_224D82264();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

unint64_t sub_224D68DD0(uint64_t a1)
{
  unint64_t result;

  result = sub_224D68DF4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_224D68DF4()
{
  unint64_t result;

  result = qword_2557D7CF8;
  if (!qword_2557D7CF8)
  {
    result = MEMORY[0x22768C914](&protocol conformance descriptor for ShellToJITBootstrapAgentInterface, &type metadata for ShellToJITBootstrapAgentInterface);
    atomic_store(result, (unint64_t *)&qword_2557D7CF8);
  }
  return result;
}

unint64_t sub_224D68E3C()
{
  unint64_t result;

  result = qword_2557D7D00;
  if (!qword_2557D7D00)
  {
    result = MEMORY[0x22768C914](&protocol conformance descriptor for JITSetupPayload, &type metadata for JITSetupPayload);
    atomic_store(result, (unint64_t *)&qword_2557D7D00);
  }
  return result;
}

unint64_t sub_224D68E84()
{
  unint64_t result;

  result = qword_2557D7D08;
  if (!qword_2557D7D08)
  {
    result = MEMORY[0x22768C914](&protocol conformance descriptor for JITSetupPayload, &type metadata for JITSetupPayload);
    atomic_store(result, (unint64_t *)&qword_2557D7D08);
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToJITBootstrapAgentInterface()
{
  return &type metadata for ShellToJITBootstrapAgentInterface;
}

ValueMetadata *type metadata accessor for JITSetupPayload()
{
  return &type metadata for JITSetupPayload;
}

ValueMetadata *type metadata accessor for JITSetupReply()
{
  return &type metadata for JITSetupReply;
}

uint64_t sub_224D68EF8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = a1;
  v2 = sub_224D82264();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v3 = sub_224D81F88();
  v1[6] = v3;
  v1[7] = *(_QWORD *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_224D68F80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unsigned __int8 v10[9];

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 24);
  v6 = *(_QWORD *)(v0 + 32);
  v10[0] = 0;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE78630], v3);
  _s17PreviewsOSSupport15JITSetupPayloadV17propertyListValue0A12FoundationOS08PropertyF0Vvg_0();
  v7 = sub_224D5BA60(v10, v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v8 = *(uint64_t **)(v0 + 16);
  v8[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D7530);
  v8[4] = sub_224D5C9C0(&qword_2557D8320, (uint64_t *)&unk_2557D7530, (uint64_t)&protocol conformance descriptor for ShellConnection<A>);
  *v8 = v7;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D690AC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[2] = a1;
  v2 = sub_224D82264();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  v3 = sub_224D81F88();
  v1[6] = v3;
  v1[7] = *(_QWORD *)(v3 - 8);
  v1[8] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_224D69134()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  unsigned __int8 v10[9];

  v2 = *(_QWORD *)(v0 + 56);
  v1 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 48);
  v5 = *(_QWORD *)(v0 + 24);
  v6 = *(_QWORD *)(v0 + 32);
  v10[0] = 4;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v1, *MEMORY[0x24BE78630], v3);
  _s17PreviewsOSSupport15JITSetupPayloadV17propertyListValue0A12FoundationOS08PropertyF0Vvg_0();
  v7 = sub_224D5BA60(v10, v1, v4);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v8 = *(uint64_t **)(v0 + 16);
  v8[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D7530);
  v8[4] = sub_224D5C9C0(&qword_2557D8320, (uint64_t *)&unk_2557D7530, (uint64_t)&protocol conformance descriptor for ShellConnection<A>);
  *v8 = v7;
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

_QWORD *sub_224D69264(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD *v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7D78);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D82480();
  swift_allocObject();
  v2[2] = sub_224D82474();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BD0);
  sub_224D6727C();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE6A10], v5);
  sub_224D8269C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  v2[3] = sub_224D69FA4;
  v2[4] = v9;
  v12 = v2;
  sub_224D5C9C0(&qword_2557D7D88, &qword_2557D7D18, (uint64_t)&unk_224D83CC0);
  swift_retain();
  swift_retain();
  sub_224D82420();
  swift_release();
  swift_release();
  return v2;
}

_QWORD *sub_224D69448(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD *v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7D78);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D82480();
  swift_allocObject();
  v2[2] = sub_224D82474();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BD0);
  sub_224D6727C();
  (*(void (**)(char *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BEE6A10], v5);
  sub_224D8269C();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  v2[3] = sub_224D69F58;
  v2[4] = v9;
  v12 = v2;
  sub_224D5C9C0(&qword_2557D7D80, &qword_2557D7D38, (uint64_t)&unk_224D83CC0);
  swift_retain();
  swift_retain();
  sub_224D82420();
  swift_release();
  swift_release();
  return v2;
}

uint64_t sub_224D6962C(uint64_t a1, uint64_t a2)
{
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
  uint64_t v16;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BD0);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a2 + qword_2557D7AF8;
  v8 = *(int *)(v4 + 48);
  v9 = &v6[v8];
  v10 = v7 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BE0);
  v12 = *(_QWORD *)(v11 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v6, v7, v11);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BE8);
  v14 = *(_QWORD *)(v13 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))(v9, v10, v13);
  sub_224D826CC();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v13);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v6, v11);
}

id static _UVServiceHubServiceFactory.makeAgentPipeService(messageHandler:)(uint64_t a1, uint64_t a2)
{
  objc_class *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  char v10;
  objc_super v11;

  v4 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_2557D7D10);
  v5 = (char *)objc_allocWithZone(v4);
  v6 = qword_2557D7A00;
  sub_224D823CC();
  swift_allocObject();
  swift_retain();
  v7 = v5;
  v10 = 2;
  *(_QWORD *)&v5[v6] = sub_224D823C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7D18);
  swift_allocObject();
  swift_retain();
  *(_QWORD *)&v7[qword_2557D7A08] = sub_224D69264(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7D20);
  *(_QWORD *)&v7[qword_2557D7A10] = sub_224D81FA0();

  v11.receiver = v7;
  v11.super_class = v4;
  v8 = objc_msgSendSuper2(&v11, sel_init, v10, 0, 0);
  swift_release();
  return v8;
}

id static _UVServiceHubServiceFactory.makeShellPipeService(messageHandler:)(uint64_t a1, uint64_t a2)
{
  objc_class *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  char v10;
  objc_super v11;

  v4 = (objc_class *)__swift_instantiateConcreteTypeFromMangledName(&qword_2557D7D30);
  v5 = (char *)objc_allocWithZone(v4);
  v6 = qword_2557D7A00;
  sub_224D823CC();
  swift_allocObject();
  swift_retain();
  v7 = v5;
  v10 = 2;
  *(_QWORD *)&v5[v6] = sub_224D823C0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7D38);
  swift_allocObject();
  swift_retain();
  *(_QWORD *)&v7[qword_2557D7A08] = sub_224D69448(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7D40);
  *(_QWORD *)&v7[qword_2557D7A10] = sub_224D81FA0();

  v11.receiver = v7;
  v11.super_class = v4;
  v8 = objc_msgSendSuper2(&v11, sel_init, v10, 0, 0);
  swift_release();
  return v8;
}

id static _UVServiceHubServiceFactory.makePreviewService()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v11;
  id v12;
  _BYTE v13[15];
  unsigned __int8 v14;

  v1 = sub_224D82264();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_224D81F88();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = 2;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BE78630], v5);
  _s17PreviewsOSSupport15JITSetupPayloadV17propertyListValue0A12FoundationOS08PropertyF0Vvg_0();
  v9 = sub_224D5BA60(&v14, (uint64_t)v8, (uint64_t)v4);
  if (v0)
  {
    (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
    return (id)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    v11 = v9;
    (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    v12 = objc_allocWithZone((Class)type metadata accessor for ServiceHubPreviewService());
    return sub_224D73DC8(v11);
  }
}

id _UVServiceHubServiceFactory.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id _UVServiceHubServiceFactory.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_init);
}

id _UVServiceHubServiceFactory.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id sub_224D69DB8(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(uint64_t, uint64_t), uint64_t *a5)
{
  char *v5;
  uint64_t v11;
  char *v12;
  char v14;
  objc_class *ObjectType;
  objc_super v16;

  ObjectType = (objc_class *)swift_getObjectType();
  v11 = qword_2557D7A00;
  sub_224D823CC();
  swift_allocObject();
  v12 = v5;
  v14 = 2;
  *(_QWORD *)&v5[v11] = sub_224D823C0();
  __swift_instantiateConcreteTypeFromMangledName(a3);
  swift_allocObject();
  swift_retain();
  *(_QWORD *)&v12[qword_2557D7A08] = a4(a1, a2);
  __swift_instantiateConcreteTypeFromMangledName(a5);
  *(_QWORD *)&v12[qword_2557D7A10] = sub_224D81FA0();

  v16.receiver = v12;
  v16.super_class = ObjectType;
  return objc_msgSendSuper2(&v16, sel_init, v14, 0, 0);
}

uint64_t type metadata accessor for _UVServiceHubServiceFactory()
{
  return objc_opt_self();
}

uint64_t sub_224D69F24()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_224D69F48()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

void sub_224D69F58(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_224D664A8(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_224D69F60(uint64_t a1)
{
  uint64_t v1;

  return sub_224D6962C(a1, v1);
}

uint64_t sub_224D69F78()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D69FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BC8);
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_224D825B8();
  MEMORY[0x24BDAC7A8](v4);
  sub_224D6B75C();
  swift_getObjectType();
  sub_224D6B874(a1, a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_224D6A2AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t ObjectType;

  v6 = sub_224D825B8();
  MEMORY[0x24BDAC7A8](v6);
  sub_224D6B75C();
  ObjectType = swift_getObjectType();
  sub_224D6BA80(a1, a2, a3, ObjectType, 158, 104, (uint64_t)&block_descriptor_5, (SEL *)&selRef_sendXPCEndpoint_context_replyHandler_);
  return swift_unknownObjectRelease();
}

uint64_t sub_224D6A528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t ObjectType;

  v6 = sub_224D825B8();
  MEMORY[0x24BDAC7A8](v6);
  sub_224D6B75C();
  ObjectType = swift_getObjectType();
  sub_224D6BA80(a1, a2, a3, ObjectType, 162, 103, (uint64_t)&block_descriptor_2, (SEL *)&selRef_sendBSEndpoint_context_replyHandler_);
  return swift_unknownObjectRelease();
}

void sub_224D6A7A4(_OWORD *a1)
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];
  __int128 v25;

  sub_224D6C75C();
  v2 = (_OWORD *)swift_allocObject();
  v3 = a1[3];
  v2[3] = a1[2];
  v2[4] = v3;
  v2[5] = a1[4];
  v5 = *a1;
  v4 = a1[1];
  v2[1] = *a1;
  v2[2] = v4;
  v25 = v5;
  v6 = *((_QWORD *)a1 + 2);
  v7 = *((_QWORD *)a1 + 4);
  v8 = *((_QWORD *)a1 + 6);
  v21 = *((_QWORD *)a1 + 8);
  v22 = (uint64_t)v2;
  v9 = (_OWORD *)swift_allocObject();
  v10 = a1[3];
  v9[3] = a1[2];
  v9[4] = v10;
  v9[5] = a1[4];
  v11 = a1[1];
  v9[1] = *a1;
  v9[2] = v11;
  v12 = (_OWORD *)swift_allocObject();
  v13 = a1[3];
  v12[3] = a1[2];
  v12[4] = v13;
  v12[5] = a1[4];
  v14 = a1[1];
  v12[1] = *a1;
  v12[2] = v14;
  sub_224D6C880((uint64_t)&v25);
  sub_224D643A0(v6);
  sub_224D643A0(v7);
  sub_224D643A0(v8);
  sub_224D643A0(v21);
  sub_224D6C880((uint64_t)&v25);
  sub_224D643A0(v6);
  sub_224D643A0(v7);
  sub_224D643A0(v8);
  sub_224D643A0(v21);
  sub_224D6C880((uint64_t)&v25);
  sub_224D643A0(v6);
  sub_224D643A0(v7);
  sub_224D643A0(v8);
  sub_224D643A0(v21);
  v15 = sub_224D6AF58((uint64_t)sub_224D6C79C, v22, (uint64_t)sub_224D6C808, (uint64_t)v9, (uint64_t)sub_224D6C878, (uint64_t)v12);
  v16 = *(void **)(v23 + 32);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v23;
  *(_QWORD *)(v17 + 24) = v15;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = sub_224D6C8D4;
  *(_QWORD *)(v18 + 24) = v17;
  aBlock[4] = sub_224D6C8EC;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_224D5AC64;
  aBlock[3] = &block_descriptor_66;
  v19 = _Block_copy(aBlock);
  swift_retain();
  v20 = v15;
  swift_retain();
  swift_release();
  objc_msgSend(v16, sel_configureConnection_, v19);
  _Block_release(v19);
  LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v19 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(v16, sel_activate);
    swift_release();

  }
}

uint64_t ShellConnection.invalidationHandle.getter()
{
  sub_224D6C3A0();
  return swift_retain();
}

void ShellConnection.service.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 24);
}

uint64_t sub_224D6AAB4(uint64_t a1, void (*a2)(uint64_t, char *))
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BC8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_224D8203C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  a2(a1, v6);
  return sub_224D5BE98((uint64_t)v6, &qword_2557D7BC8);
}

uint64_t sub_224D6AB64(uint64_t a1, uint64_t a2, void (*a3)(uint64_t, char *))
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BC8);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_224D8203C();
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v8, a2, v9);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
  a3(a1, v8);
  return sub_224D5BE98((uint64_t)v8, &qword_2557D7BC8);
}

uint64_t sub_224D6AC38()
{
  sub_224D6C704();
  return sub_224D82120();
}

uint64_t sub_224D6ACA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[5];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BC8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 48);
  if (v11)
  {
    swift_retain();
    v11(a1, a2, a3);
    return sub_224D63AD8((uint64_t)v11);
  }
  else
  {
    v13 = *(_OWORD *)(a4 + 48);
    v17[2] = *(_OWORD *)(a4 + 32);
    v17[3] = v13;
    v17[4] = *(_OWORD *)(a4 + 64);
    v14 = *(_OWORD *)(a4 + 16);
    v17[0] = *(_OWORD *)a4;
    v17[1] = v14;
    v15 = sub_224D8203C();
    v16 = *(_QWORD *)(v15 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v10, a3, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    sub_224D6C704();
    sub_224D8212C();
    return sub_224D5BE98((uint64_t)v10, &qword_2557D7BC8);
  }
}

uint64_t sub_224D6AE00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void (*v11)(uint64_t, uint64_t, uint64_t);
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  _OWORD v17[5];

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BC8);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t))(a4 + 64);
  if (v11)
  {
    swift_retain();
    v11(a1, a2, a3);
    return sub_224D63AD8((uint64_t)v11);
  }
  else
  {
    v13 = *(_OWORD *)(a4 + 48);
    v17[2] = *(_OWORD *)(a4 + 32);
    v17[3] = v13;
    v17[4] = *(_OWORD *)(a4 + 64);
    v14 = *(_OWORD *)(a4 + 16);
    v17[0] = *(_OWORD *)a4;
    v17[1] = v14;
    v15 = sub_224D8203C();
    v16 = *(_QWORD *)(v15 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v10, a3, v15);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v10, 0, 1, v15);
    sub_224D6C704();
    sub_224D8212C();
    return sub_224D5BE98((uint64_t)v10, &qword_2557D7BC8);
  }
}

id sub_224D6AF58(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;

  v12 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  v26 = sub_224D6C6C0;
  v27 = v13;
  v14 = MEMORY[0x24BDAC760];
  v22 = MEMORY[0x24BDAC760];
  v23 = 1107296256;
  v24 = sub_224D6C104;
  v25 = &block_descriptor_11;
  v15 = _Block_copy(&v22);
  swift_retain();
  swift_release();
  v16 = swift_allocObject();
  *(_QWORD *)(v16 + 16) = a3;
  *(_QWORD *)(v16 + 24) = a4;
  v26 = sub_224D6C6C8;
  v27 = v16;
  v22 = v14;
  v23 = 1107296256;
  v24 = sub_224D6C1A0;
  v25 = &block_descriptor_17;
  v17 = _Block_copy(&v22);
  swift_retain();
  swift_release();
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a5;
  *(_QWORD *)(v18 + 24) = a6;
  v26 = sub_224D6C984;
  v27 = v18;
  v22 = v14;
  v23 = 1107296256;
  v24 = sub_224D6C2D4;
  v25 = &block_descriptor_23;
  v19 = _Block_copy(&v22);
  swift_retain();
  swift_release();
  v20 = objc_msgSend(v12, sel_initWithMessageHandler_xpcEndpointHandler_bsEndpointHandler_, v15, v17, v19);
  swift_release();
  swift_release();
  swift_release();
  _Block_release(v19);
  _Block_release(v17);
  _Block_release(v15);
  return v20;
}

void sub_224D6B150(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)();
  void *v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;

  v6 = (void *)sub_224D82600();
  swift_bridgeObjectRelease();
  v7 = UVShellConnectionInterface((uint64_t)v6);

  objc_msgSend(a1, sel_setInterface_, v7);
  v8 = objc_msgSend((id)objc_opt_self(), sel_userInteractive);
  objc_msgSend(a1, sel_setServiceQuality_, v8);

  objc_msgSend(a1, sel_setInterfaceTarget_, a3);
  v16 = sub_224D6C8F4;
  v17 = a2;
  v9 = MEMORY[0x24BDAC760];
  v12 = MEMORY[0x24BDAC760];
  v13 = 1107296256;
  v14 = sub_224D73428;
  v15 = &block_descriptor_69;
  v10 = _Block_copy(&v12);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v10);
  _Block_release(v10);
  v16 = sub_224D6C8FC;
  v17 = a2;
  v12 = v9;
  v13 = 1107296256;
  v14 = sub_224D73428;
  v15 = &block_descriptor_72;
  v11 = _Block_copy(&v12);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setActivationHandler_, v11);
  _Block_release(v11);
}

uint64_t sub_224D6B3C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _QWORD v9[2];

  v3 = *a2;
  v4 = sub_224D8230C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[1] = a2;
  MEMORY[0x22768C914](&protocol conformance descriptor for ShellConnection<A>, v3);
  sub_224D66220();
  sub_224D822E8();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_224D6B4A8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D74A0);
  sub_224D6C904();
  sub_224D822D0();
  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v3 + 88) + 8))(a1, *(_QWORD *)(v3 + 80));
}

uint64_t ShellConnection.sender.getter()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_224D6B56C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7230);
  *v1 = v0;
  v1[1] = sub_224D6B5E8;
  return sub_224D82720();
}

uint64_t sub_224D6B5E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_224D6B64C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v3)(_QWORD, uint64_t);

  v1 = *(_QWORD *)(v0 + 16);
  v3 = *(uint64_t (**)(_QWORD, uint64_t))(v0 + 8);
  swift_retain();
  return v3(sub_224D6C748, v1);
}

uint64_t sub_224D6B694()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ShellConnection.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *v0;
  sub_224D827D4();
  v2 = (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 88) + 24))();
  swift_bridgeObjectRelease();
  sub_224D8263C();
  ShellService.description.getter();
  sub_224D8263C();
  swift_bridgeObjectRelease();
  return v2;
}

uint64_t sub_224D6B75C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t **v5;
  _OWORD v6[2];
  _BYTE v7[24];
  uint64_t v8;
  uint64_t v9;

  v1 = *v0;
  if (objc_msgSend((id)v0[4], sel_remoteTarget))
  {
    sub_224D827A4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
  }
  sub_224D5BE50((uint64_t)v6, (uint64_t)v7);
  if (v8)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D7E50);
    if ((swift_dynamicCast() & 1) != 0)
      return v9;
  }
  else
  {
    sub_224D5BE98((uint64_t)v7, (uint64_t *)&unk_2557D8350);
  }
  v4 = type metadata accessor for ShellConnection.RemoteTargetError(0, *(_QWORD *)(v1 + 80), *(_QWORD *)(v1 + 88), v2);
  MEMORY[0x22768C914](&unk_224D84428, v4);
  swift_allocError();
  *v5 = v0;
  swift_retain();
  return swift_willThrow();
}

void sub_224D6B874(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD aBlock[6];

  v3 = v2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BC8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_224D8203C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)aBlock - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D6C654(a2, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_224D5BE98((uint64_t)v7, &qword_2557D7BC8);
    v12 = (void *)sub_224D82090();
    objc_msgSend(v3, sel_sendMessage_, v12);

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v7, v8);
    v13 = (void *)sub_224D82090();
    aBlock[4] = sub_224D81FE8();
    aBlock[5] = v14;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_224D6BEBC;
    aBlock[3] = &block_descriptor_8;
    v15 = _Block_copy(aBlock);
    swift_release();
    objc_msgSend(v3, sel_sendMessage_replyHandler_, v13, v15);
    _Block_release(v15);

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  }
}

void sub_224D6BA48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_224D6BA80(a1, a2, a3, a4, 158, 104, (uint64_t)&block_descriptor_5, (SEL *)&selRef_sendXPCEndpoint_context_replyHandler_);
}

void sub_224D6BA64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_224D6BA80(a1, a2, a3, a4, 162, 103, (uint64_t)&block_descriptor_2, (SEL *)&selRef_sendBSEndpoint_context_replyHandler_);
}

void sub_224D6BA80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, SEL *a8)
{
  void *v8;
  void *v11;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];

  v11 = v8;
  v13 = (void *)sub_224D82090();
  v16[4] = sub_224D81FE8();
  v16[5] = v14;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 1107296256;
  v16[2] = sub_224D6BEBC;
  v16[3] = a7;
  v15 = _Block_copy(v16);
  swift_release();
  objc_msgSend(v11, *a8, a1, v13, v15);
  _Block_release(v15);

}

uint64_t sub_224D6BB78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  sub_224D827D4();
  v6 = type metadata accessor for ShellConnection(0, a2, a3, v5);
  MEMORY[0x22768C914](&protocol conformance descriptor for ShellConnection<A>, v6);
  sub_224D82858();
  sub_224D8263C();
  return 0;
}

uint64_t sub_224D6BC28(uint64_t a1)
{
  uint64_t *v1;

  return sub_224D6BB78(*v1, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24));
}

uint64_t sub_224D6BC38(uint64_t a1)
{
  MEMORY[0x22768C914](&unk_224D84390, a1);
  return sub_224D82354();
}

uint64_t sub_224D6BC6C(uint64_t a1)
{
  MEMORY[0x22768C914](&unk_224D84390, a1);
  return sub_224D82330();
}

id *ShellConnection.deinit()
{
  id *v0;
  _QWORD *v1;
  char *v2;
  uint64_t v3;

  v1 = *v0;
  swift_release();

  swift_release();
  v2 = (char *)v0 + qword_2557D7DA0;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D74A0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  (*(void (**)(char *))(*(_QWORD *)(v1[10] - 8) + 8))((char *)v0 + *((_QWORD *)*v0 + 17));
  return v0;
}

uint64_t ShellConnection.__deallocating_deinit()
{
  ShellConnection.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_224D6BD4C(uint64_t a1, uint64_t a2)
{
  return _s17PreviewsOSSupport15ShellConnectionC8activate8receiver19interruptionHandleryy0A11MessagingOS16LazyPropertyListO_AG14TransportReplyVSgtYbc_yyYbctF_0(a1, a2);
}

uint64_t sub_224D6BD6C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_224D6BDCC;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_224D6BDCC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = *v3;
  v7 = swift_task_dealloc();
  if (!v2)
  {
    v7 = a1;
    v8 = a2;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
}

uint64_t sub_224D6BE30()
{
  sub_224D6C3A0();
  return swift_retain();
}

uint64_t sub_224D6BE50()
{
  return ShellConnection.description.getter();
}

uint64_t sub_224D6BE70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x22768C914](&protocol conformance descriptor for ShellConnection<A>, a3);
  return sub_224D82414();
}

void sub_224D6BEBC(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_224D6BF30(void *a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, _QWORD), uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD);
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[2];

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BC8);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_224D8209C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D82768();
  if (a2)
  {
    v17 = swift_allocObject();
    v25[1] = a5;
    v18 = a4;
    v19 = v17;
    *(_QWORD *)(v17 + 16) = a2;
    *(_QWORD *)(v17 + 24) = a3;
    v20 = swift_allocObject();
    *(_QWORD *)(v20 + 16) = sub_224D67DC8;
    *(_QWORD *)(v20 + 24) = v19;
    sub_224D643A0(a2);
    swift_retain();
    v21 = a1;
    sub_224D82000();
    v22 = sub_224D8203C();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v12, 0, 1, v22);
    a4 = v18;
    swift_release();
  }
  else
  {
    v23 = sub_224D8203C();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v12, 1, 1, v23);
  }
  a4(v16, v12);
  sub_224D5BE98((uint64_t)v12, &qword_2557D7BC8);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_224D6C104(uint64_t a1, void *a2, void *aBlock)
{
  void (*v4)(void);
  uint64_t (*v5)();
  id v6;

  v4 = *(void (**)(void))(a1 + 32);
  v5 = (uint64_t (*)())_Block_copy(aBlock);
  if (v5)
  {
    *(_QWORD *)(swift_allocObject() + 16) = v5;
    v5 = sub_224D6C980;
  }
  swift_retain();
  v6 = a2;
  v4();

  sub_224D63AD8((uint64_t)v5);
  return swift_release();
}

void sub_224D6C1A0(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_224D6C2E8(a1, a2, a3, a4, (uint64_t)&unk_24ECEBBF0, (uint64_t)sub_224D6C980);
}

uint64_t sub_224D6C1B4(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void (*a5)(uint64_t, char *, char *), uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v18;
  void (*v19)(uint64_t, char *, char *);

  v18 = a6;
  v19 = a5;
  v8 = sub_224D8203C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_224D8209C();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D82768();
  swift_retain();
  v16 = a2;
  sub_224D82000();
  v19(a1, v15, v11);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

void sub_224D6C2D4(uint64_t a1, void *a2, void *a3, void *a4)
{
  sub_224D6C2E8(a1, a2, a3, a4, (uint64_t)&unk_24ECEBBC8, (uint64_t)sub_224D67D9C);
}

void sub_224D6C2E8(uint64_t a1, void *a2, void *a3, void *aBlock, uint64_t a5, uint64_t a6)
{
  void (*v9)(id, id, uint64_t, uint64_t);
  void *v10;
  uint64_t v11;
  id v12;
  id v13;

  v9 = *(void (**)(id, id, uint64_t, uint64_t))(a1 + 32);
  v10 = _Block_copy(aBlock);
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  swift_retain();
  v13 = a2;
  v12 = a3;
  v9(v13, v12, a6, v11);
  swift_release();
  swift_release();

}

uint64_t sub_224D6C3A0()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t _s17PreviewsOSSupport15ShellConnectionC8activate8receiver19interruptionHandleryy0A11MessagingOS16LazyPropertyListO_AG14TransportReplyVSgtYbc_yyYbctF_0(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t v12;
  __int128 v13;
  __int128 v14;

  MEMORY[0x22768C914](&protocol conformance descriptor for ShellConnection<A>, *v2);
  sub_224D82858();
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a1;
  *(_QWORD *)(v6 + 24) = a2;
  *(_QWORD *)&v8 = 0;
  *((_QWORD *)&v8 + 1) = 0xE000000000000000;
  v9 = sub_224D6C74C;
  v10 = v5;
  v11 = sub_224D6C754;
  v12 = v6;
  v13 = 0u;
  v14 = 0u;
  swift_retain_n();
  sub_224D6A7A4(&v8);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

void sub_224D6C4B0()
{
  JUMPOUT(0x22768C914);
}

void sub_224D6C4C0()
{
  JUMPOUT(0x22768C914);
}

void sub_224D6C4D0()
{
  JUMPOUT(0x22768C914);
}

uint64_t dispatch thunk of ShellConnectionRole.handleActivation(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 8))();
}

uint64_t dispatch thunk of ShellConnectionRole.handleInvalidation()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of static ShellConnectionRole.description.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

void sub_224D6C4F8()
{
  unint64_t v0;
  unint64_t v1;

  sub_224D6C5C4();
  if (v0 <= 0x3F)
  {
    swift_checkMetadataState();
    if (v1 <= 0x3F)
      swift_initClassMetadata2();
  }
}

uint64_t type metadata accessor for ShellConnection(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ShellConnection);
}

uint64_t method lookup function for ShellConnection()
{
  return swift_lookUpClassMethod();
}

void sub_224D6C5C4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2557D7E38)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557D7230);
    v0 = sub_224D82714();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2557D7E38);
  }
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t type metadata accessor for ShellConnection.RemoteTargetError(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ShellConnection.RemoteTargetError);
}

uint64_t sub_224D6C654(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_224D6C69C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D6C6C0(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_224D6BF30(a1, a2, a3, *(void (**)(_QWORD, _QWORD))(v3 + 16), *(_QWORD *)(v3 + 24));
}

uint64_t sub_224D6C6C8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_224D6C1B4(a1, a2, a3, a4, *(void (**)(uint64_t, char *, char *))(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_224D6C6E0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

unint64_t sub_224D6C704()
{
  unint64_t result;

  result = qword_2557D7E60;
  if (!qword_2557D7E60)
  {
    result = MEMORY[0x22768C914](&unk_224D83828, &type metadata for ShellConnectionReceiver);
    atomic_store(result, (unint64_t *)&qword_2557D7E60);
  }
  return result;
}

uint64_t sub_224D6C74C(uint64_t a1)
{
  uint64_t v1;

  return sub_224D6AAB4(a1, *(void (**)(uint64_t, char *))(v1 + 16));
}

uint64_t sub_224D6C754(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_224D6AB64(a1, a2, *(void (**)(uint64_t, char *))(v2 + 16));
}

unint64_t sub_224D6C75C()
{
  unint64_t result;

  result = qword_2557D8380;
  if (!qword_2557D8380)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2557D8380);
  }
  return result;
}

uint64_t sub_224D6C79C()
{
  sub_224D6C704();
  return sub_224D82120();
}

uint64_t sub_224D6C808(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_224D6ACA0(a1, a2, a3, v3 + 16);
}

uint64_t objectdestroy_50Tm()
{
  _QWORD *v0;

  swift_bridgeObjectRelease();
  if (v0[4])
    swift_release();
  if (v0[6])
    swift_release();
  if (v0[8])
    swift_release();
  if (v0[10])
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D6C878(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return sub_224D6AE00(a1, a2, a3, v3 + 16);
}

uint64_t sub_224D6C880(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_224D6C8A8()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_224D6C8D4(void *a1)
{
  uint64_t v1;

  sub_224D6B150(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_224D6C8DC()
{
  return swift_deallocObject();
}

uint64_t sub_224D6C8EC(uint64_t a1)
{
  uint64_t v1;

  return sub_224D73C0C(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_224D6C8F4(uint64_t a1)
{
  uint64_t *v1;

  return sub_224D6B3C0(a1, v1);
}

uint64_t sub_224D6C8FC(uint64_t a1)
{
  uint64_t *v1;

  return sub_224D6B4A8(a1, v1);
}

unint64_t sub_224D6C904()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557D7ED0[0];
  if (!qword_2557D7ED0[0])
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557D74A0);
    result = MEMORY[0x22768C914](MEMORY[0x24BE76D88], v1);
    atomic_store(result, qword_2557D7ED0);
  }
  return result;
}

void sub_224D6C950()
{
  JUMPOUT(0x22768C914);
}

void sub_224D6C960()
{
  JUMPOUT(0x22768C914);
}

void sub_224D6C970()
{
  JUMPOUT(0x22768C914);
}

uint64_t sub_224D6C9E8(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000016;
  else
    return 0x4C525579706F63;
}

uint64_t sub_224D6CA24(char *a1, char *a2)
{
  return sub_224D75EB0(*a1, *a2);
}

uint64_t sub_224D6CA30()
{
  return sub_224D763FC();
}

uint64_t sub_224D6CA38()
{
  return sub_224D76D80();
}

uint64_t sub_224D6CA40()
{
  return sub_224D772A4();
}

uint64_t sub_224D6CA48@<X0>(char *a1@<X8>)
{
  return sub_224D6D450(a1);
}

uint64_t sub_224D6CA54@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D6C9E8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D6CA7C()
{
  sub_224D6E248();
  return sub_224D82444();
}

uint64_t sub_224D6CAC4()
{
  sub_224D6E248();
  return sub_224D82450();
}

uint64_t sub_224D6CB28(char a1)
{
  if ((a1 & 1) != 0)
    return 7107189;
  else
    return 0x696D697263736964;
}

uint64_t sub_224D6CB60(char *a1, char *a2)
{
  return sub_224D75E10(*a1, *a2);
}

uint64_t sub_224D6CB6C()
{
  return sub_224D76480();
}

uint64_t sub_224D6CB74()
{
  return sub_224D76D28();
}

uint64_t sub_224D6CB7C()
{
  return sub_224D77324();
}

uint64_t sub_224D6CB84@<X0>(char *a1@<X8>)
{
  return sub_224D6D450(a1);
}

uint64_t sub_224D6CB90@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D6CB28(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D6CBB8()
{
  char *v0;

  return sub_224D6CB28(*v0);
}

uint64_t ShellToControlAgent.TwoWayMessage.propertyListValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  _BYTE v13[16];
  uint64_t v14;
  char v15[24];
  ValueMetadata *v16;
  unint64_t v17;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7F60);
  MEMORY[0x24BDAC7A8](v1);
  v3 = &v13[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_224D82114();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for ShellToControlAgent.TwoWayMessage();
  MEMORY[0x24BDAC7A8](v8);
  v10 = &v13[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = v0;
  v11 = sub_224D6CE8C();
  sub_224D6CED0();
  sub_224D8224C();
  sub_224D6CF14(v0, (uint64_t)v10);
  swift_getEnumCaseMultiPayload();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v7, v10, v4);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 16))(v3, v7, v4);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v3, 0, 1, v4);
  v16 = &type metadata for ShellToControlAgent.TwoWayMessage.Key;
  v17 = v11;
  v15[0] = 1;
  sub_224D6CF58();
  sub_224D821EC();
  sub_224D6CFA0((uint64_t)v3);
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
}

uint64_t type metadata accessor for ShellToControlAgent.TwoWayMessage()
{
  uint64_t result;

  result = qword_2557D8028;
  if (!qword_2557D8028)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_224D6CDD0(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;

  v6 = type metadata accessor for ShellToControlAgent.TwoWayMessage();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_224D6CF14(a3, (uint64_t)v8);
  LOBYTE(a3) = swift_getEnumCaseMultiPayload() == 1;
  v9 = sub_224D82114();
  result = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  *a2 = a3;
  return result;
}

uint64_t sub_224D6CE84(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;

  return sub_224D6CDD0(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_224D6CE8C()
{
  unint64_t result;

  result = qword_2557D7F68;
  if (!qword_2557D7F68)
  {
    result = MEMORY[0x22768C914](&unk_224D848FC, &type metadata for ShellToControlAgent.TwoWayMessage.Key);
    atomic_store(result, (unint64_t *)&qword_2557D7F68);
  }
  return result;
}

unint64_t sub_224D6CED0()
{
  unint64_t result;

  result = qword_2557D7F70;
  if (!qword_2557D7F70)
  {
    result = MEMORY[0x22768C914](&unk_224D848BC, &type metadata for ShellToControlAgent.TwoWayMessage.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2557D7F70);
  }
  return result;
}

uint64_t sub_224D6CF14(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ShellToControlAgent.TwoWayMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_224D6CF58()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557D7F78;
  if (!qword_2557D7F78)
  {
    v1 = sub_224D82114();
    result = MEMORY[0x22768C914](MEMORY[0x24BE77C38], v1);
    atomic_store(result, (unint64_t *)&qword_2557D7F78);
  }
  return result;
}

uint64_t sub_224D6CFA0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7F60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ShellToControlAgent.TwoWayMessage.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[24];
  ValueMetadata *v17;
  unint64_t v18;
  char v19;

  v5 = type metadata accessor for ShellToControlAgent.TwoWayMessage();
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v6);
  v10 = &v16[-v9];
  v17 = &type metadata for ShellToControlAgent.TwoWayMessage.Key;
  v11 = sub_224D6CE8C();
  v18 = v11;
  v16[0] = 0;
  sub_224D6CED0();
  sub_224D821F8();
  if (v2)
  {
    v12 = sub_224D82264();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
    v17 = &type metadata for ShellToControlAgent.TwoWayMessage.Key;
    v18 = v11;
    v16[0] = 1;
    if ((v19 & 1) != 0)
    {
      sub_224D82114();
      sub_224D6CF58();
      sub_224D821F8();
      v14 = sub_224D82264();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a1, v14);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
      swift_storeEnumTagMultiPayload();
      v10 = v8;
    }
    else
    {
      sub_224D82114();
      sub_224D6CF58();
      sub_224D821F8();
      v15 = sub_224D82264();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(a1, v15);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v16);
      swift_storeEnumTagMultiPayload();
    }
    return sub_224D6D1EC((uint64_t)v10, a2);
  }
}

uint64_t sub_224D6D1EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for ShellToControlAgent.TwoWayMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_224D6D230(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_224D6D268 + 4 * byte_224D84470[a1]))(0xD000000000000017, 0x8000000224D85B00);
}

uint64_t sub_224D6D29C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return ShellToControlAgent.TwoWayMessage.init(propertyListValue:)(a1, a2);
}

void sub_224D6D2B0(char *a1)
{
  sub_224D75CF8(*a1);
}

void sub_224D6D2BC()
{
  char *v0;

  sub_224D76500(*v0);
}

void sub_224D6D2C4(uint64_t a1)
{
  char *v1;

  sub_224D76CA0(a1, *v1);
}

void sub_224D6D2CC(uint64_t a1)
{
  char *v1;

  sub_224D773A0(a1, *v1);
}

uint64_t sub_224D6D2D4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_224D6D710();
  *a1 = result;
  return result;
}

uint64_t sub_224D6D300@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D6D230(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D6D328()
{
  sub_224D6E28C();
  return sub_224D82444();
}

uint64_t sub_224D6D370()
{
  sub_224D6E28C();
  return sub_224D82450();
}

uint64_t sub_224D6D3D4(char a1)
{
  if ((a1 & 1) != 0)
    return 0x656449656E656373;
  else
    return 0x696D697263736964;
}

uint64_t sub_224D6D420(char *a1, char *a2)
{
  return sub_224D75C44(*a1, *a2);
}

uint64_t sub_224D6D42C()
{
  return sub_224D765B8();
}

uint64_t sub_224D6D434()
{
  return sub_224D76C34();
}

uint64_t sub_224D6D43C()
{
  return sub_224D77454();
}

uint64_t sub_224D6D444@<X0>(char *a1@<X8>)
{
  return sub_224D6D450(a1);
}

uint64_t sub_224D6D450@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;
  char v4;

  v2 = sub_224D82834();
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

uint64_t sub_224D6D4A8@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D6D3D4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D6D4D0()
{
  char *v0;

  return sub_224D6D3D4(*v0);
}

uint64_t ShellToControlAgent.BSEndpointContext.propertyListValue.getter(uint64_t a1, unint64_t a2)
{
  unint64_t v4;
  uint64_t result;
  char v6[24];
  ValueMetadata *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v4 = sub_224D6D594();
  sub_224D6D5D8();
  result = sub_224D8224C();
  if (a2 >= 3)
  {
    v9 = a1;
    v10 = a2;
    v7 = &type metadata for ShellToControlAgent.BSEndpointContext.Key;
    v8 = v4;
    v6[0] = 1;
    sub_224D821EC();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
  }
  return result;
}

unint64_t sub_224D6D594()
{
  unint64_t result;

  result = qword_2557D7F80;
  if (!qword_2557D7F80)
  {
    result = MEMORY[0x22768C914](&unk_224D84894, &type metadata for ShellToControlAgent.BSEndpointContext.Key);
    atomic_store(result, (unint64_t *)&qword_2557D7F80);
  }
  return result;
}

unint64_t sub_224D6D5D8()
{
  unint64_t result;

  result = qword_2557D7F88;
  if (!qword_2557D7F88)
  {
    result = MEMORY[0x22768C914](&unk_224D84854, &type metadata for ShellToControlAgent.BSEndpointContext.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2557D7F88);
  }
  return result;
}

uint64_t ShellToControlAgent.BSEndpointContext.init(propertyListValue:)(uint64_t a1)
{
  return sub_224D6D758(a1);
}

uint64_t sub_224D6D630()
{
  uint64_t *v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t result;
  char v5[24];
  ValueMetadata *v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;

  v2 = *v0;
  v1 = v0[1];
  v3 = sub_224D6D594();
  sub_224D6D5D8();
  result = sub_224D8224C();
  if (v1 >= 3)
  {
    v8 = v2;
    v9 = v1;
    v6 = &type metadata for ShellToControlAgent.BSEndpointContext.Key;
    v7 = v3;
    v5[0] = 1;
    sub_224D821EC();
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v5);
  }
  return result;
}

uint64_t sub_224D6D6E8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;

  result = sub_224D6D758(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
  }
  return result;
}

uint64_t sub_224D6D710()
{
  unint64_t v0;

  v0 = sub_224D82834();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_224D6D758(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  _BYTE v6[24];
  ValueMetadata *v7;
  unint64_t v8;

  v7 = &type metadata for ShellToControlAgent.BSEndpointContext.Key;
  v8 = sub_224D6D594();
  v6[0] = 0;
  sub_224D6D5D8();
  sub_224D821F8();
  if (!v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
    __asm { BR              X10 }
  }
  v3 = sub_224D82264();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v6);
}

void sub_224D6D818()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_224D82264();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
  JUMPOUT(0x224D6D7DCLL);
}

void sub_224D6D840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  a12 = 1;
  sub_224D821F8();
  if (!v12)
  {
    v14 = sub_224D82264();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v13, v14);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&a12);
    JUMPOUT(0x224D6D7DCLL);
  }
  JUMPOUT(0x224D6D7B8);
}

void sub_224D6D8A0()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_224D82264();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
  JUMPOUT(0x224D6D7DCLL);
}

void sub_224D6D8C8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = sub_224D82264();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0, v1);
  JUMPOUT(0x224D6D7DCLL);
}

unint64_t sub_224D6D8F0(uint64_t a1)
{
  unint64_t result;

  result = sub_224D6D914();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_224D6D914()
{
  unint64_t result;

  result = qword_2557D7FB0;
  if (!qword_2557D7FB0)
  {
    result = MEMORY[0x22768C914](&protocol conformance descriptor for ShellToControlAgent, &type metadata for ShellToControlAgent);
    atomic_store(result, (unint64_t *)&qword_2557D7FB0);
  }
  return result;
}

ValueMetadata *type metadata accessor for ShellToControlAgent()
{
  return &type metadata for ShellToControlAgent;
}

uint64_t *initializeBufferWithCopyOfBuffer for ShellToControlAgent.TwoWayMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v7 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v7 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    v6 = sub_224D82114();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t destroy for ShellToControlAgent.TwoWayMessage(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_224D82114();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t initializeWithCopy for ShellToControlAgent.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getEnumCaseMultiPayload();
  v4 = sub_224D82114();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for ShellToControlAgent.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_224D6DB40(a1);
    swift_getEnumCaseMultiPayload();
    v4 = sub_224D82114();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_224D6DB40(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ShellToControlAgent.TwoWayMessage();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t initializeWithTake for ShellToControlAgent.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getEnumCaseMultiPayload();
  v4 = sub_224D82114();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for ShellToControlAgent.TwoWayMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  if (a1 != a2)
  {
    sub_224D6DB40(a1);
    swift_getEnumCaseMultiPayload();
    v4 = sub_224D82114();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellToControlAgent.TwoWayMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for ShellToControlAgent.TwoWayMessage(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_224D6DC90()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_224D6DCA0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_224D82114();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

unint64_t destroy for ShellToControlAgent.BSEndpointContext(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s17PreviewsOSSupport19ShellToControlAgentO17BSEndpointContextOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for ShellToControlAgent.BSEndpointContext(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ShellToControlAgent.BSEndpointContext(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ShellToControlAgent.BSEndpointContext(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFD && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483645);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 2;
  if (v4 >= 4)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ShellToControlAgent.BSEndpointContext(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 >= 0x7FFFFFFD)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483645;
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFD)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 2;
  }
  return result;
}

uint64_t sub_224D6DF14(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_224D6DF2C(_QWORD *result, int a2)
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

ValueMetadata *type metadata accessor for ShellToControlAgent.BSEndpointContext()
{
  return &type metadata for ShellToControlAgent.BSEndpointContext;
}

uint64_t storeEnumTagSinglePayload for ShellToControlAgent.BSEndpointContext.Discriminant(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D6DFA8 + 4 * byte_224D8447D[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_224D6DFDC + 4 * byte_224D84478[v4]))();
}

uint64_t sub_224D6DFDC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D6DFE4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D6DFECLL);
  return result;
}

uint64_t sub_224D6DFF8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D6E000);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_224D6E004(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D6E00C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ShellToControlAgent.BSEndpointContext.Discriminant()
{
  return &type metadata for ShellToControlAgent.BSEndpointContext.Discriminant;
}

ValueMetadata *type metadata accessor for ShellToControlAgent.BSEndpointContext.Key()
{
  return &type metadata for ShellToControlAgent.BSEndpointContext.Key;
}

ValueMetadata *type metadata accessor for ShellToControlAgent.TwoWayMessage.Discriminant()
{
  return &type metadata for ShellToControlAgent.TwoWayMessage.Discriminant;
}

uint64_t _s17PreviewsOSSupport19ShellToControlAgentO17BSEndpointContextO3KeyOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D6E09C + 4 * byte_224D84487[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_224D6E0D0 + 4 * byte_224D84482[v4]))();
}

uint64_t sub_224D6E0D0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D6E0D8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D6E0E0);
  return result;
}

uint64_t sub_224D6E0EC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D6E0F4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_224D6E0F8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D6E100(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ShellToControlAgent.TwoWayMessage.Key()
{
  return &type metadata for ShellToControlAgent.TwoWayMessage.Key;
}

unint64_t sub_224D6E120()
{
  unint64_t result;

  result = qword_2557D8060;
  if (!qword_2557D8060)
  {
    result = MEMORY[0x22768C914](&unk_224D8464C, &type metadata for ShellToControlAgent.TwoWayMessage.Key);
    atomic_store(result, (unint64_t *)&qword_2557D8060);
  }
  return result;
}

unint64_t sub_224D6E168()
{
  unint64_t result;

  result = qword_2557D8068;
  if (!qword_2557D8068)
  {
    result = MEMORY[0x22768C914](&unk_224D846EC, &type metadata for ShellToControlAgent.TwoWayMessage.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2557D8068);
  }
  return result;
}

unint64_t sub_224D6E1B0()
{
  unint64_t result;

  result = qword_2557D8070;
  if (!qword_2557D8070)
  {
    result = MEMORY[0x22768C914](&unk_224D8478C, &type metadata for ShellToControlAgent.BSEndpointContext.Key);
    atomic_store(result, (unint64_t *)&qword_2557D8070);
  }
  return result;
}

unint64_t sub_224D6E1F8()
{
  unint64_t result;

  result = qword_2557D8078;
  if (!qword_2557D8078)
  {
    result = MEMORY[0x22768C914](&unk_224D8482C, &type metadata for ShellToControlAgent.BSEndpointContext.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2557D8078);
  }
  return result;
}

uint64_t sub_224D6E23C()
{
  return MEMORY[0x24BE76CB8];
}

unint64_t sub_224D6E248()
{
  unint64_t result;

  result = qword_2557D8080;
  if (!qword_2557D8080)
  {
    result = MEMORY[0x22768C914](&unk_224D84674, &type metadata for ShellToControlAgent.TwoWayMessage.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2557D8080);
  }
  return result;
}

unint64_t sub_224D6E28C()
{
  unint64_t result;

  result = qword_2557D8088;
  if (!qword_2557D8088)
  {
    result = MEMORY[0x22768C914](&unk_224D847B4, &type metadata for ShellToControlAgent.BSEndpointContext.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2557D8088);
  }
  return result;
}

_BYTE *sub_224D6E2D0(_BYTE *result, _BYTE *a2)
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  unsigned int v5;

  v3 = *(_QWORD *)(v2 + 24);
  *result = 0;
  v4 = v3 >= 3;
  v5 = 0x30200u >> (8 * v3);
  if (v4)
    LOBYTE(v5) = 1;
  *a2 = v5;
  return result;
}

unint64_t static LSBundleRecord.playgroundsBundleID.getter()
{
  return 0xD000000000000015;
}

unint64_t static LSBundleRecord.playgroundsManagementDomain.getter()
{
  return 0xD000000000000011;
}

uint64_t static LSBundleRecord.canLaunch(agentBundle:)(uint64_t a1)
{
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
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  void (*v16)(char *, uint64_t, uint64_t);
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  void (*v25)(char *, uint8_t *);
  uint8_t *v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  char v29;
  char *v30;
  void (*v31)(char *, uint64_t, uint64_t);
  char *v32;
  char v34;
  char *v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  void (*v48)(char *, uint64_t, uint64_t);
  char *v49;
  uint64_t v50;
  char *v51;
  uint8_t *v52;
  uint64_t v53;
  uint64_t v54;

  v2 = sub_224D82060();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v51 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v49 = (char *)&v45 - v7;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v45 - v8;
  v10 = sub_224D825B8();
  v47 = *(_QWORD *)(v10 - 8);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v45 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v45 - v14;
  sub_224D82588();
  v16 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v50 = a1;
  v48 = v16;
  v16(v9, a1, v2);
  v17 = sub_224D825A0();
  v18 = sub_224D82744();
  v19 = os_log_type_enabled(v17, v18);
  v46 = v13;
  if (v19)
  {
    v20 = swift_slowAlloc();
    v52 = (uint8_t *)v2;
    v21 = (uint8_t *)v20;
    v22 = swift_slowAlloc();
    v54 = v22;
    *(_DWORD *)v21 = 136315138;
    v45 = v10;
    sub_224D6EF34();
    v23 = sub_224D82840();
    v53 = sub_224D60EC8(v23, v24, &v54);
    v10 = v45;
    sub_224D8278C();
    swift_bridgeObjectRelease();
    v25 = *(void (**)(char *, uint8_t *))(v3 + 8);
    v25(v9, v52);
    _os_log_impl(&dword_224D58000, v17, v18, "Checking if %s is a valid development process", v21, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22768C9BC](v22, -1, -1);
    v26 = v21;
    v2 = (uint64_t)v52;
    MEMORY[0x22768C9BC](v26, -1, -1);
  }
  else
  {
    v25 = *(void (**)(char *, uint8_t *))(v3 + 8);
    v25(v9, (uint8_t *)v2);
  }

  v27 = *(void (**)(char *, uint64_t))(v47 + 8);
  v27(v15, v10);
  v28 = v50;
  v29 = sub_224D6EC70();
  v31 = v48;
  v30 = v49;
  v48(v49, v28, v2);
  v32 = v51;
  if ((v29 & 1) != 0)
  {
    v25(v30, (uint8_t *)v2);
    return 1;
  }
  else
  {
    v34 = sub_224D6EE34();
    v25(v30, (uint8_t *)v2);
    if ((v34 & 1) != 0)
    {
      return 1;
    }
    else
    {
      v35 = v46;
      sub_224D82588();
      v36 = v2;
      v31(v32, v28, v2);
      v37 = sub_224D825A0();
      v38 = sub_224D82750();
      if (os_log_type_enabled(v37, v38))
      {
        v39 = (uint8_t *)swift_slowAlloc();
        v40 = swift_slowAlloc();
        v54 = v40;
        v45 = v10;
        *(_DWORD *)v39 = 136315138;
        v52 = v39 + 4;
        sub_224D6EF34();
        v41 = sub_224D82840();
        v53 = sub_224D60EC8(v41, v42, &v54);
        sub_224D8278C();
        swift_bridgeObjectRelease();
        v25(v32, (uint8_t *)v36);
        _os_log_impl(&dword_224D58000, v37, v38, "can't do anything with non-development agent %s", v39, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x22768C9BC](v40, -1, -1);
        MEMORY[0x22768C9BC](v39, -1, -1);

        v44 = v45;
        v43 = v46;
      }
      else
      {
        v25(v32, (uint8_t *)v36);

        v43 = v35;
        v44 = v10;
      }
      v27(v43, v44);
      return 0;
    }
  }
}

id sub_224D6E784()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v6;
  _OWORD v7[2];
  _BYTE v8[24];
  uint64_t v9;

  v1 = objc_msgSend(v0, sel_entitlements);
  v2 = (void *)sub_224D82600();
  sub_224D6EF7C();
  v3 = objc_msgSend(v1, sel_objectForKey_ofClass_, v2, swift_getObjCClassFromMetadata());

  if (v3)
  {
    sub_224D827A4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v7, 0, sizeof(v7));
  }
  sub_224D5BE50((uint64_t)v7, (uint64_t)v8);
  if (!v9)
  {
    sub_224D6EFB8((uint64_t)v8);
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  v4 = objc_msgSend(v6, sel_BOOLValue);

  return v4;
}

id sub_224D6E8B8(uint64_t a1, char a2)
{
  void *v2;
  void *v3;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  id v11;
  id v12;
  uint64_t v13;
  id v15[2];

  v3 = v2;
  v15[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = (void *)sub_224D81F1C();
  v15[0] = 0;
  v7 = objc_msgSend(v3, sel_initWithURL_allowPlaceholder_error_, v6, a2 & 1, v15);

  v8 = v15[0];
  if (v7)
  {
    v9 = sub_224D81F34();
    v10 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8);
    v11 = v8;
    v10(a1, v9);
  }
  else
  {
    v12 = v15[0];
    sub_224D81EF8();

    swift_willThrow();
    v13 = sub_224D81F34();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(a1, v13);
  }
  return v7;
}

id sub_224D6E9C8(uint64_t a1, uint64_t a2, char a3)
{
  void *v3;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = (void *)sub_224D82600();
  swift_bridgeObjectRelease();
  v10[0] = 0;
  v6 = objc_msgSend(v3, sel_initWithBundleIdentifier_allowPlaceholder_error_, v5, a3 & 1, v10);

  if (v6)
  {
    v7 = v10[0];
  }
  else
  {
    v8 = v10[0];
    sub_224D81EF8();

    swift_willThrow();
  }
  return v6;
}

id sub_224D6EAA0(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  id v10;
  uint64_t v11;
  id v13[2];

  v2 = v1;
  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = (void *)sub_224D81F1C();
  v13[0] = 0;
  v5 = objc_msgSend(v2, sel_initWithURL_error_, v4, v13);

  v6 = v13[0];
  if (v5)
  {
    v7 = sub_224D81F34();
    v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
    v9 = v6;
    v8(a1, v7);
  }
  else
  {
    v10 = v13[0];
    sub_224D81EF8();

    swift_willThrow();
    v11 = sub_224D81F34();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(a1, v11);
  }
  return v5;
}

id sub_224D6EBA8()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v6[2];

  v6[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = (void *)sub_224D82600();
  swift_bridgeObjectRelease();
  v6[0] = 0;
  v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_error_, v1, v6);

  if (v2)
  {
    v3 = v6[0];
  }
  else
  {
    v4 = v6[0];
    sub_224D81EF8();

    swift_willThrow();
  }
  return v2;
}

uint64_t sub_224D6EC70()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  id v4;
  id v5;
  unsigned __int8 v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  id v18;
  uint64_t v19;

  v0 = sub_224D81F34();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v19 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D82048();
  if (v3)
  {
    sub_224D81F10();
    swift_bridgeObjectRelease();
    v4 = objc_allocWithZone(MEMORY[0x24BDC1540]);
    v5 = sub_224D6E8B8((uint64_t)v2, 0);
  }
  else
  {
    v8 = sub_224D82054();
    v10 = v9;
    v11 = objc_allocWithZone(MEMORY[0x24BDC1540]);
    v5 = sub_224D6E9C8(v8, v10, 0);
  }
  if (v5)
  {
    v12 = v5;
    v13 = objc_msgSend(v12, sel_managementDomain);
    v14 = sub_224D8260C();
    v16 = v15;

    if (v14 == 0xD000000000000011 && v16 == 0x8000000224D86E10)
    {

      swift_bridgeObjectRelease();
      v6 = 1;
    }
    else
    {
      v17 = sub_224D82870();
      swift_bridgeObjectRelease();
      if ((v17 & 1) != 0)
      {

        v6 = 1;
      }
      else
      {
        v18 = v12;
        v6 = sub_224D6E784();

      }
    }
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_224D6EE34()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  id v4;
  id v5;
  unsigned __int8 v6;
  id v7;
  id v8;
  uint64_t v10;

  v0 = sub_224D81F34();
  MEMORY[0x24BDAC7A8](v0);
  v2 = (char *)&v10 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D82048();
  if (v3)
  {
    sub_224D81F10();
    swift_bridgeObjectRelease();
    v4 = objc_allocWithZone(MEMORY[0x24BDC1528]);
    v5 = sub_224D6EAA0((uint64_t)v2);
  }
  else
  {
    sub_224D82054();
    v7 = objc_allocWithZone(MEMORY[0x24BDC1528]);
    v5 = sub_224D6EBA8();
  }
  if (v5)
  {
    v8 = v5;
    v6 = sub_224D6E784();

  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

unint64_t sub_224D6EF34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557D8090;
  if (!qword_2557D8090)
  {
    v1 = sub_224D82060();
    result = MEMORY[0x22768C914](MEMORY[0x24BE77520], v1);
    atomic_store(result, (unint64_t *)&qword_2557D8090);
  }
  return result;
}

unint64_t sub_224D6EF7C()
{
  unint64_t result;

  result = qword_2557D8098;
  if (!qword_2557D8098)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2557D8098);
  }
  return result;
}

uint64_t sub_224D6EFB8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D8350);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t RefinedPreviewPayload.previewPayload.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_224D81FC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t RefinedPreviewPayload.previewPayload.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_224D81FC4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 40))(v1, a1, v3);
}

uint64_t (*RefinedPreviewPayload.previewPayload.modify())()
{
  return nullsub_1;
}

uint64_t RefinedPreviewPayload.requestedGroupIndex.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for RefinedPreviewPayload(0) + 20);
  return sub_224D6F0BC(v3, a1);
}

uint64_t type metadata accessor for RefinedPreviewPayload(uint64_t a1)
{
  return sub_224D5B768(a1, (uint64_t *)&unk_2557D8170);
}

uint64_t sub_224D6F0BC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t RefinedPreviewPayload.requestedGroupIndex.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for RefinedPreviewPayload(0) + 20);
  return sub_224D6F134(a1, v3);
}

uint64_t sub_224D6F134(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*RefinedPreviewPayload.requestedGroupIndex.modify())()
{
  type metadata accessor for RefinedPreviewPayload(0);
  return nullsub_1;
}

uint64_t RefinedPreviewPayload.init(previewPayload:requestedGroupIndex:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = a3 + *(int *)(type metadata accessor for RefinedPreviewPayload(0) + 20);
  v7 = sub_224D82150();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = sub_224D81FC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a3, a1, v8);
  return sub_224D6F134(a2, v6);
}

uint64_t sub_224D6F22C(char a1)
{
  if ((a1 & 1) != 0)
    return 0xD000000000000013;
  else
    return 0x5077656976657270;
}

uint64_t sub_224D6F274(char *a1, char *a2)
{
  return sub_224D75B94(*a1, *a2);
}

uint64_t sub_224D6F280()
{
  return sub_224D7664C();
}

uint64_t sub_224D6F288()
{
  return sub_224D76BCC();
}

uint64_t sub_224D6F290()
{
  return sub_224D774E4();
}

uint64_t sub_224D6F298@<X0>(char *a1@<X8>)
{
  return sub_224D6D450(a1);
}

uint64_t sub_224D6F2A4@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D6F22C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D6F2CC()
{
  char *v0;

  return sub_224D6F22C(*v0);
}

void sub_224D6F2D4(_QWORD *a1@<X8>)
{
  *a1 = &unk_24ECEA4C8;
}

uint64_t RefinedPreviewPayload.propertyListValue.getter()
{
  return sub_224D82240();
}

uint64_t sub_224D6F310(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  uint64_t v28;
  char *v30;
  uint64_t v31;
  char *v32;
  char v33;
  char v34;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8290);
  MEMORY[0x24BDAC7A8](v2);
  v30 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8298);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v30 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D82A0);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = MEMORY[0x24BDAC7A8](v11);
  v31 = (uint64_t)&v30 - v15;
  v16 = (char *)&v30 + *(int *)(v14 + 48) - v15;
  *((_BYTE *)&v30 - v15) = 0;
  v17 = sub_224D81FC4();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v18 + 16);
  v19(v16, a1, v17);
  v20 = *(int *)(v4 + 48);
  v21 = v9;
  v32 = v9;
  v22 = (uint64_t)&v9[v20];
  *v21 = 1;
  v23 = type metadata accessor for RefinedPreviewPayload(0);
  sub_224D6F0BC(a1 + *(int *)(v23 + 20), v22);
  v24 = &v13[*(int *)(v10 + 48)];
  *v13 = 0;
  v19(v24, (uint64_t)v16, v17);
  v25 = (uint64_t)v30;
  (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v30, v24, v17);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v25, 0, 1, v17);
  v34 = 0;
  v26 = (uint64_t)&v7[*(int *)(v4 + 48)];
  *v7 = 1;
  sub_224D6F0BC(v22, v26);
  v33 = 1;
  sub_224D82150();
  v27 = (uint64_t (*)(uint64_t))MEMORY[0x24BE77F48];
  sub_224D6F97C();
  sub_224D6503C(&qword_2557D80B0, (uint64_t (*)(uint64_t))MEMORY[0x24BE773E0], MEMORY[0x24BE773C8]);
  sub_224D6503C(&qword_2557D80B8, v27, MEMORY[0x24BE77F20]);
  v28 = sub_224D823D8();
  sub_224D5BE98(v25, &qword_2557D8290);
  sub_224D5BE98((uint64_t)v32, &qword_2557D8298);
  sub_224D5BE98(v31, (uint64_t *)&unk_2557D82A0);
  sub_224D5BE98(v26, &qword_2557D80A0);
  return v28;
}

uint64_t sub_224D6F5E8()
{
  uint64_t v0;

  return sub_224D6F310(*(_QWORD *)(v0 + 16));
}

uint64_t RefinedPreviewPayload.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t, uint64_t, uint64_t);
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[24];
  ValueMetadata *v33;
  unint64_t v34;
  char *v35;

  v31 = sub_224D82264();
  v29 = *(_QWORD *)(v31 - 8);
  MEMORY[0x24BDAC7A8](v31);
  v26 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80A0);
  MEMORY[0x24BDAC7A8](v6);
  v25 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_224D81FC4();
  v9 = (uint64_t (*)(uint64_t))MEMORY[0x24BE773E0];
  v27 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v35 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v23 - v12;
  v14 = *(int *)(type metadata accessor for RefinedPreviewPayload(0) + 20);
  v28 = a2;
  v15 = a2 + v14;
  v16 = sub_224D82150();
  v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56);
  v24(v15, 1, 1, v16);
  v33 = &type metadata for RefinedPreviewPayload.Key;
  v17 = sub_224D6F97C();
  v34 = v17;
  v32[0] = 0;
  sub_224D6503C(&qword_2557D80B0, v9, MEMORY[0x24BE773C8]);
  sub_224D821F8();
  v30 = v15;
  if (v2)
  {
    v25 = (char *)v16;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
    v19 = v29;
    v20 = v31;
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 16))(v26, a1, v31);
    sub_224D82438();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a1, v20);

    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v28, v35, v8);
    v21 = v30;
    sub_224D5BE98(v30, &qword_2557D80A0);
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, char *))v24)(v21, 1, 1, v25);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
    (*(void (**)(uint64_t, char *, uint64_t))(v27 + 32))(v28, v13, v8);
    v33 = &type metadata for RefinedPreviewPayload.Key;
    v34 = v17;
    v32[0] = 1;
    sub_224D6503C(&qword_2557D80B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE77F48], MEMORY[0x24BE77F20]);
    v18 = (uint64_t)v25;
    sub_224D82228();
    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(a1, v31);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
    return sub_224D6F134(v18, v30);
  }
}

unint64_t sub_224D6F97C()
{
  unint64_t result;

  result = qword_2557D80A8;
  if (!qword_2557D80A8)
  {
    result = MEMORY[0x22768C914](&unk_224D8501C, &type metadata for RefinedPreviewPayload.Key);
    atomic_store(result, (unint64_t *)&qword_2557D80A8);
  }
  return result;
}

uint64_t sub_224D6F9C0()
{
  return sub_224D82240();
}

uint64_t sub_224D6F9EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return RefinedPreviewPayload.init(propertyListValue:)(a1, a2);
}

BOOL PreviewStructure.previewCount.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v14;

  v1 = type metadata accessor for PreviewStructure(0);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D6FB50(v0, (uint64_t)v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  v5 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(v3, 2, v4);
  if (v5)
    return v5 == 1;
  v7 = &v3[*(int *)(v4 + 48)];
  v8 = sub_224D82570();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v11, v3, v8);
  v6 = PreviewGroupMetadata.previewCount.getter();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = sub_224D82150();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v7, v12);
  return v6;
}

uint64_t type metadata accessor for PreviewStructure(uint64_t a1)
{
  return sub_224D5B768(a1, (uint64_t *)&unk_2557D8220);
}

uint64_t sub_224D6FB50(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreviewStructure(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t PreviewGroupMetadata.previewCount.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void (*v9)(char *, unint64_t, uint64_t);
  uint64_t v10;
  uint64_t result;
  BOOL v12;
  _QWORD v13[2];

  v0 = sub_224D82528();
  v1 = sub_224D82564();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  MEMORY[0x24BDAC7A8](v1);
  sub_224D8251C();
  v4 = sub_224D82540();
  v5 = *(void (**)(char *, uint64_t))(v2 + 8);
  v5((char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
  v6 = *(_QWORD *)(v0 + 16);
  if (v6)
  {
    v7 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
    v8 = *(_QWORD *)(v2 + 72);
    v9 = *(void (**)(char *, unint64_t, uint64_t))(v2 + 16);
    v13[1] = v0;
    v10 = swift_bridgeObjectRetain();
    while (1)
    {
      MEMORY[0x24BDAC7A8](v10);
      v9((char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v7, v1);
      result = sub_224D82540();
      v12 = __OFADD__(v4, result);
      v4 += result;
      if (v12)
        break;
      v10 = ((uint64_t (*)(char *, uint64_t))v5)((char *)v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v1);
      v7 += v8;
      if (!--v6)
      {
        swift_bridgeObjectRelease_n();
        return v4;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease();
    return v4;
  }
  return result;
}

uint64_t sub_224D6FCEC(char a1)
{
  if ((a1 & 1) != 0)
    return 0x77656976657270;
  else
    return 0x6E6F6974636573;
}

uint64_t sub_224D6FD1C(char *a1, char *a2)
{
  return sub_224D75B18(*a1, *a2);
}

uint64_t sub_224D6FD28()
{
  return sub_224D766DC();
}

uint64_t sub_224D6FD30()
{
  return sub_224D76B88();
}

uint64_t sub_224D6FD38()
{
  return sub_224D77570();
}

uint64_t sub_224D6FD40@<X0>(char *a1@<X8>)
{
  return sub_224D6D450(a1);
}

uint64_t sub_224D6FD4C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D6FCEC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D6FD74()
{
  char *v0;

  return sub_224D6FCEC(*v0);
}

uint64_t PreviewGroupIndex.propertyListValue.getter()
{
  return sub_224D82240();
}

uint64_t sub_224D6FDA8()
{
  sub_224D82504();
  sub_224D824EC();
  sub_224D7143C();
  return sub_224D823D8();
}

uint64_t PreviewGroupIndex.init(propertyListValue:)(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v7[24];
  ValueMetadata *v8;
  unint64_t v9;

  v8 = &_s3KeyON_1;
  v3 = sub_224D7143C();
  v9 = v3;
  v7[0] = 0;
  sub_224D821F8();
  if (v1)
  {
    v4 = sub_224D82264();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    v8 = &_s3KeyON_1;
    v9 = v3;
    v7[0] = 1;
    sub_224D821F8();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    sub_224D824F8();
    v5 = sub_224D82264();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(a1, v5);
  }
}

uint64_t sub_224D6FF54(char a1)
{
  if ((a1 & 1) != 0)
    return 0x7463655365726F6DLL;
  else
    return 0x6365537473726966;
}

uint64_t sub_224D6FF9C()
{
  return sub_224D82240();
}

uint64_t sub_224D6FFC8(uint64_t a1)
{
  return PreviewGroupIndex.init(propertyListValue:)(a1);
}

uint64_t sub_224D6FFDC(char *a1, char *a2)
{
  return sub_224D75A68(*a1, *a2);
}

uint64_t sub_224D6FFE8()
{
  return sub_224D76750();
}

uint64_t sub_224D6FFF0()
{
  return sub_224D76B20();
}

uint64_t sub_224D6FFF8()
{
  return sub_224D775E0();
}

uint64_t sub_224D70000@<X0>(char *a1@<X8>)
{
  return sub_224D6D450(a1);
}

uint64_t sub_224D7000C@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D6FF54(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D70034()
{
  char *v0;

  return sub_224D6FF54(*v0);
}

uint64_t PreviewGroupMetadata.propertyListValue.getter()
{
  return sub_224D82240();
}

uint64_t sub_224D70068()
{
  uint64_t v0;
  _BYTE *v1;
  _BYTE *v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;
  char v14;
  char v15;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8278);
  v1 = (char *)&v13 - ((*(_QWORD *)(*(_QWORD *)(v0 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = &v1[*(int *)(MEMORY[0x24BDAC7A8](v0) + 48)];
  *v1 = 0;
  sub_224D8251C();
  v3 = sub_224D82528();
  MEMORY[0x24BDAC7A8](v3);
  v4 = &v1[*(int *)(v0 + 48)];
  *v1 = 0;
  v5 = sub_224D82564();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC6EC0];
  v7 = *(_QWORD *)(v5 - 8);
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v7 + 16))(v4, v2, v5);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8280);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, _BYTE *, uint64_t))(v7 + 32))(v10, v4, v5);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v5);
  v15 = 0;
  v14 = 1;
  v13 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80E0);
  sub_224D71488();
  sub_224D6503C(&qword_2557D80D8, v6, (uint64_t)&protocol conformance descriptor for PreviewGroupMetadata.Section);
  sub_224D714CC();
  v11 = sub_224D823D8();
  swift_bridgeObjectRelease();
  sub_224D5BE98((uint64_t)v10, &qword_2557D8280);
  sub_224D5BE98((uint64_t)v1, &qword_2557D8278);
  return v11;
}

uint64_t PreviewGroupMetadata.init(propertyListValue:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;
  _BYTE v9[24];
  ValueMetadata *v10;
  unint64_t v11;

  v3 = sub_224D82564();
  v4 = (uint64_t (*)(uint64_t))MEMORY[0x24BDC6EC0];
  MEMORY[0x24BDAC7A8](v3);
  v10 = &_s3KeyON_0;
  v5 = sub_224D71488();
  v11 = v5;
  v9[0] = 0;
  sub_224D6503C(&qword_2557D80D8, v4, (uint64_t)&protocol conformance descriptor for PreviewGroupMetadata.Section);
  sub_224D821F8();
  if (v1)
  {
    v6 = sub_224D82264();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    v10 = &_s3KeyON_0;
    v11 = v5;
    v9[0] = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80E0);
    sub_224D714CC();
    sub_224D821F8();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    sub_224D82510();
    v8 = sub_224D82264();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
  }
}

uint64_t sub_224D70420(char a1)
{
  if ((a1 & 1) != 0)
    return 0x4377656976657270;
  else
    return 0x656C746974;
}

uint64_t sub_224D7045C()
{
  return sub_224D82240();
}

uint64_t sub_224D70488(uint64_t a1)
{
  return PreviewGroupMetadata.init(propertyListValue:)(a1);
}

uint64_t sub_224D7049C(char *a1, char *a2)
{
  return sub_224D759C4(*a1, *a2);
}

uint64_t sub_224D704A8()
{
  return sub_224D767E0();
}

uint64_t sub_224D704B0()
{
  return sub_224D76AC4();
}

uint64_t sub_224D704B8()
{
  return sub_224D7766C();
}

uint64_t sub_224D704C0@<X0>(char *a1@<X8>)
{
  return sub_224D6D450(a1);
}

uint64_t sub_224D704CC@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D70420(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D704F4()
{
  char *v0;

  return sub_224D70420(*v0);
}

uint64_t PreviewGroupMetadata.Section.propertyListValue.getter()
{
  return sub_224D82240();
}

uint64_t sub_224D70528()
{
  uint64_t v0;

  sub_224D82558();
  sub_224D82540();
  sub_224D71550();
  v0 = sub_224D823D8();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PreviewGroupMetadata.Section.init(propertyListValue:)(uint64_t a1)
{
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;
  uint64_t v6;
  _BYTE v7[24];
  ValueMetadata *v8;
  unint64_t v9;

  v8 = &_s3KeyON;
  v3 = sub_224D71550();
  v9 = v3;
  v7[0] = 0;
  sub_224D82228();
  if (v1)
  {
    v4 = sub_224D82264();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    v8 = &_s3KeyON;
    v9 = v3;
    v7[0] = 1;
    sub_224D821F8();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v7);
    sub_224D8254C();
    v6 = sub_224D82264();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
}

uint64_t sub_224D7072C(char a1)
{
  if (!a1)
    return 0x7250656C676E6973;
  if (a1 == 1)
    return 0x4777656976657270;
  return 0xD000000000000011;
}

uint64_t sub_224D7079C()
{
  return sub_224D82240();
}

uint64_t sub_224D707C8(uint64_t a1)
{
  return PreviewGroupMetadata.Section.init(propertyListValue:)(a1);
}

uint64_t sub_224D707DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_224D76054(*a1, *a2);
}

uint64_t sub_224D707E8()
{
  return sub_224D76864();
}

uint64_t sub_224D707F0()
{
  return sub_224D76E60();
}

uint64_t sub_224D707F8()
{
  return sub_224D7711C();
}

uint64_t sub_224D70800@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_224D72A98();
  *a1 = result;
  return result;
}

uint64_t sub_224D70834@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D7072C(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D7085C()
{
  sub_224D72A54();
  return sub_224D82444();
}

uint64_t sub_224D708A4()
{
  sub_224D72A54();
  return sub_224D82450();
}

uint64_t sub_224D70908(char a1)
{
  return *(_QWORD *)&aDiscrimimetada[8 * a1];
}

uint64_t sub_224D70928(char *a1, char *a2)
{
  return sub_224D75FD0(*a1, *a2);
}

uint64_t sub_224D70934()
{
  return sub_224D7691C();
}

uint64_t sub_224D7093C()
{
  return sub_224D76E20();
}

uint64_t sub_224D70944()
{
  return sub_224D771D0();
}

uint64_t sub_224D7094C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_224D72A98();
  *a1 = result;
  return result;
}

uint64_t sub_224D70980@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D70908(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D709A8()
{
  char *v0;

  return sub_224D70908(*v0);
}

uint64_t PreviewStructure.propertyListValue.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t result;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  void (*v22)(void);
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  _QWORD v27[2];
  char *v28;
  _QWORD *v29;
  uint64_t v30;
  _BYTE v31[24];
  ValueMetadata *v32;
  unint64_t v33;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80A0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_224D82150();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for PreviewStructure(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = v2;
  v14 = sub_224D7159C();
  sub_224D715E0();
  sub_224D8224C();
  sub_224D6FB50(v2, (uint64_t)v13);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 48))(v13, 2, v15);
  if (!(_DWORD)result)
  {
    v17 = &v13[*(int *)(v15 + 48)];
    v18 = sub_224D82570();
    v29 = v27;
    v19 = *(_QWORD *)(v18 - 8);
    MEMORY[0x24BDAC7A8](v18);
    v21 = (char *)v27 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
    v22 = *(void (**)(void))(v19 + 32);
    v27[1] = a1;
    v28 = v21;
    v23 = v21;
    v22();
    (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v10, v17, v7);
    v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8108);
    v27[0] = v27;
    MEMORY[0x24BDAC7A8](v24);
    v26 = (char *)v27 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v26, v23, v18);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v19 + 56))(v26, 0, 1, v18);
    v32 = &type metadata for PreviewStructure.Key;
    v33 = v14;
    v31[0] = 1;
    sub_224D6503C(&qword_2557D8110, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6ED0], (uint64_t)&protocol conformance descriptor for PreviewGroupMetadata);
    sub_224D821EC();
    sub_224D5BE98((uint64_t)v26, &qword_2557D8108);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v31);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
    v32 = &type metadata for PreviewStructure.Key;
    v33 = v14;
    v31[0] = 2;
    sub_224D6503C(&qword_2557D80B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE77F48], MEMORY[0x24BE77F20]);
    sub_224D821EC();
    sub_224D5BE98((uint64_t)v6, &qword_2557D80A0);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    (*(void (**)(char *, uint64_t))(v19 + 8))(v28, v18);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v31);
  }
  return result;
}

uint64_t sub_224D70D08(_BYTE *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t result;
  char v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v6 = type metadata accessor for PreviewStructure(0);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  *a1 = 0;
  sub_224D6FB50(a3, (uint64_t)v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 2, v9);
  if ((_DWORD)result)
  {
    v11 = 0;
    if ((_DWORD)result != 1)
      v11 = 2;
  }
  else
  {
    v12 = &v8[*(int *)(v9 + 48)];
    v13 = sub_224D82150();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
    v14 = sub_224D82570();
    result = (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(v8, v14);
    v11 = 1;
  }
  *a2 = v11;
  return result;
}

uint64_t PreviewStructure.init(propertyListValue:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE v18[24];
  ValueMetadata *v19;
  unint64_t v20;
  char v21;

  v5 = type metadata accessor for PreviewStructure(0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v19 = &type metadata for PreviewStructure.Key;
  v8 = sub_224D7159C();
  v20 = v8;
  v18[0] = 0;
  sub_224D715E0();
  sub_224D821F8();
  if (v2)
  {
    v9 = sub_224D82264();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a1, v9);
    return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
    if (v21)
    {
      if (v21 == 1)
      {
        v19 = &type metadata for PreviewStructure.Key;
        v20 = v8;
        v18[0] = 1;
        sub_224D82570();
        sub_224D6503C(&qword_2557D8110, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6ED0], (uint64_t)&protocol conformance descriptor for PreviewGroupMetadata);
        sub_224D821F8();
        v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
        v19 = &type metadata for PreviewStructure.Key;
        v20 = v8;
        v18[0] = 2;
        sub_224D82150();
        sub_224D6503C(&qword_2557D80B8, (uint64_t (*)(uint64_t))MEMORY[0x24BE77F48], MEMORY[0x24BE77F20]);
        sub_224D821F8();
        v16 = sub_224D82264();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a1, v16);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
        (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v7, 0, 2, v11);
        return sub_224D71624((uint64_t)v7, a2);
      }
      else
      {
        v14 = sub_224D82264();
        (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 8))(a1, v14);
        v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(a2, 2, 2, v15);
      }
    }
    else
    {
      v12 = sub_224D82264();
      (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(a1, v12);
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(a2, 1, 2, v13);
    }
  }
}

uint64_t sub_224D710E0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PreviewStructure.init(propertyListValue:)(a1, a2);
}

uint64_t _s17PreviewsOSSupport16PreviewStructureO2eeoiySbAC_ACtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(char *, uint64_t, uint64_t);
  int v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(char *, char *, uint64_t);
  void (*v31)(char *, uint64_t);
  void (*v32)(char *, uint64_t);
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  char *v35;
  uint64_t *v36;
  char *v37;

  v4 = sub_224D82150();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v34 - v9;
  v11 = type metadata accessor for PreviewStructure(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8288);
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = (uint64_t)&v17[*(int *)(v15 + 48)];
  sub_224D6FB50(a1, (uint64_t)v17);
  sub_224D6FB50(a2, v18);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  v20 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48);
  v21 = v20(v17, 2, v19);
  if (!v21)
  {
    sub_224D6FB50((uint64_t)v17, (uint64_t)v13);
    v22 = *(int *)(v19 + 48);
    v37 = &v13[v22];
    if (!v20((char *)v18, 2, v19))
    {
      v35 = (char *)(v18 + v22);
      v26 = sub_224D82570();
      v36 = &v34;
      v27 = *(_QWORD *)(v26 - 8);
      MEMORY[0x24BDAC7A8](v26);
      v29 = (char *)&v34 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v29, v18, v26);
      v30 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
      v30(v10, v37, v4);
      v30(v8, v35, v4);
      LOBYTE(v30) = MEMORY[0x22768C11C](v13, v29);
      v31 = *(void (**)(char *, uint64_t))(v27 + 8);
      v31(v13, v26);
      if ((v30 & 1) != 0)
      {
        v24 = sub_224D82144();
        v32 = *(void (**)(char *, uint64_t))(v5 + 8);
        v32(v8, v4);
        v32(v10, v4);
        v31(v29, v26);
        sub_224D72ADC((uint64_t)v17);
        return v24 & 1;
      }
      v33 = *(void (**)(char *, uint64_t))(v5 + 8);
      v33(v8, v4);
      v33(v10, v4);
      v31(v29, v26);
      sub_224D72ADC((uint64_t)v17);
      goto LABEL_10;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v37, v4);
    v23 = sub_224D82570();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v23 - 8) + 8))(v13, v23);
    goto LABEL_9;
  }
  if (v21 != 1)
  {
    if (v20((char *)v18, 2, v19) == 2)
      goto LABEL_8;
LABEL_9:
    sub_224D5BE98((uint64_t)v17, &qword_2557D8288);
LABEL_10:
    v24 = 0;
    return v24 & 1;
  }
  if (v20((char *)v18, 2, v19) != 1)
    goto LABEL_9;
LABEL_8:
  sub_224D72ADC((uint64_t)v17);
  v24 = 1;
  return v24 & 1;
}

uint64_t sub_224D71434()
{
  return sub_224D6FDA8();
}

unint64_t sub_224D7143C()
{
  unint64_t result;

  result = qword_2557D80C8;
  if (!qword_2557D80C8)
  {
    result = MEMORY[0x22768C914](&unk_224D84FF4, &_s3KeyON_1);
    atomic_store(result, (unint64_t *)&qword_2557D80C8);
  }
  return result;
}

uint64_t sub_224D71480()
{
  return sub_224D70068();
}

unint64_t sub_224D71488()
{
  unint64_t result;

  result = qword_2557D80D0;
  if (!qword_2557D80D0)
  {
    result = MEMORY[0x22768C914](&unk_224D84FCC, &_s3KeyON_0);
    atomic_store(result, (unint64_t *)&qword_2557D80D0);
  }
  return result;
}

unint64_t sub_224D714CC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_2557D80E8;
  if (!qword_2557D80E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557D80E0);
    v2 = sub_224D6503C(&qword_2557D80D8, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6EC0], (uint64_t)&protocol conformance descriptor for PreviewGroupMetadata.Section);
    result = MEMORY[0x22768C914](MEMORY[0x24BE76D10], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_2557D80E8);
  }
  return result;
}

uint64_t sub_224D71548()
{
  return sub_224D70528();
}

unint64_t sub_224D71550()
{
  unint64_t result;

  result = qword_2557D80F0;
  if (!qword_2557D80F0)
  {
    result = MEMORY[0x22768C914](&unk_224D84FA4, &_s3KeyON);
    atomic_store(result, (unint64_t *)&qword_2557D80F0);
  }
  return result;
}

uint64_t sub_224D71594(_BYTE *a1, char *a2)
{
  uint64_t v2;

  return sub_224D70D08(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_224D7159C()
{
  unint64_t result;

  result = qword_2557D80F8;
  if (!qword_2557D80F8)
  {
    result = MEMORY[0x22768C914](&unk_224D84F7C, &type metadata for PreviewStructure.Key);
    atomic_store(result, (unint64_t *)&qword_2557D80F8);
  }
  return result;
}

unint64_t sub_224D715E0()
{
  unint64_t result;

  result = qword_2557D8100;
  if (!qword_2557D8100)
  {
    result = MEMORY[0x22768C914](&unk_224D84F3C, &type metadata for PreviewStructure.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2557D8100);
  }
  return result;
}

uint64_t sub_224D71624(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for PreviewStructure(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t *initializeBufferWithCopyOfBuffer for RefinedPreviewPayload(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_224D81FC4();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = sub_224D82150();
    v12 = *(_QWORD *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80A0);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t destroy for RefinedPreviewPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v4 = sub_224D81FC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  v5 = a1 + *(int *)(a2 + 20);
  v6 = sub_224D82150();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

uint64_t initializeWithCopy for RefinedPreviewPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_224D81FC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_224D82150();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80A0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithCopy for RefinedPreviewPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = sub_224D81FC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_224D82150();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80A0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t initializeWithTake for RefinedPreviewPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v6 = sub_224D81FC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (const void *)(a2 + v7);
  v10 = sub_224D82150();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80A0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t assignWithTake for RefinedPreviewPayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = sub_224D81FC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = (void *)(a1 + v7);
  v9 = (void *)(a2 + v7);
  v10 = sub_224D82150();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  v13 = v12(v8, 1, v10);
  v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80A0);
    memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for RefinedPreviewPayload()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_224D71C14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_224D81FC4();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80A0);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for RefinedPreviewPayload()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_224D71C98(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_224D81FC4();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80A0);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_224D71D18()
{
  unint64_t v0;
  unint64_t v1;

  sub_224D81FC4();
  if (v0 <= 0x3F)
  {
    sub_224D71D9C();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_224D71D9C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_2557D8180)
  {
    sub_224D82150();
    v0 = sub_224D82780();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_2557D8180);
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for PreviewStructure(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;

  v5 = *(_QWORD *)(a3 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  if ((v6 & 0x20000) != 0)
  {
    v9 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v9 + ((v6 + 16) & ~(unint64_t)v6));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 2, v7))
    {
      memcpy(a1, a2, *(_QWORD *)(v5 + 64));
    }
    else
    {
      v10 = sub_224D82570();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(a1, a2, v10);
      v11 = *(int *)(v7 + 48);
      v12 = (char *)a1 + v11;
      v13 = (char *)a2 + v11;
      v14 = sub_224D82150();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 2, v7);
    }
  }
  return a1;
}

uint64_t destroy for PreviewStructure(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 2, v2);
  if (!(_DWORD)result)
  {
    v4 = sub_224D82570();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
    v5 = a1 + *(int *)(v2 + 48);
    v6 = sub_224D82150();
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  }
  return result;
}

char *initializeWithCopy for PreviewStructure(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_224D82570();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(a1, a2, v8);
    v9 = *(int *)(v6 + 48);
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = sub_224D82150();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

char *assignWithCopy for PreviewStructure(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      v17 = sub_224D82570();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 24))(a1, a2, v17);
      v18 = *(int *)(v6 + 48);
      v19 = &a1[v18];
      v20 = &a2[v18];
      v21 = sub_224D82150();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 24))(v19, v20, v21);
      return a1;
    }
    sub_224D5BE98((uint64_t)a1, &qword_2557D80C0);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_224D82570();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a1, a2, v11);
  v12 = *(int *)(v6 + 48);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_224D82150();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

char *initializeWithTake for PreviewStructure(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 2, v6))
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  else
  {
    v8 = sub_224D82570();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
    v9 = *(int *)(v6 + 48);
    v10 = &a1[v9];
    v11 = &a2[v9];
    v12 = sub_224D82150();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  }
  return a1;
}

char *assignWithTake for PreviewStructure(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 2, v6);
  v10 = v8(a2, 2, v6);
  if (!v9)
  {
    if (!v10)
    {
      v17 = sub_224D82570();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 40))(a1, a2, v17);
      v18 = *(int *)(v6 + 48);
      v19 = &a1[v18];
      v20 = &a2[v18];
      v21 = sub_224D82150();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v21 - 8) + 40))(v19, v20, v21);
      return a1;
    }
    sub_224D5BE98((uint64_t)a1, &qword_2557D80C0);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    return a1;
  }
  v11 = sub_224D82570();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(a1, a2, v11);
  v12 = *(int *)(v6 + 48);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_224D82150();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v13, v14, v15);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 2, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for PreviewStructure()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_224D72418(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unsigned int v5;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))(a1, a2, v4);
  if (v5 >= 3)
    return v5 - 2;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PreviewStructure()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_224D72474(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  if (a2)
    v5 = (a2 + 2);
  else
    v5 = 0;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(a1, v5, a3, v6);
}

uint64_t sub_224D724CC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(a1, 2, v2);
}

uint64_t sub_224D72508(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D80C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(a1, a2, 2, v4);
}

uint64_t sub_224D7254C()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v0 = sub_224D82570();
  if (v1 <= 0x3F)
  {
    v2 = sub_224D82150();
    if (v3 > 0x3F)
    {
      return v2;
    }
    else
    {
      swift_getTupleTypeLayout2();
      swift_initEnumMetadataSinglePayload();
      return 0;
    }
  }
  return v0;
}

ValueMetadata *type metadata accessor for PreviewStructure.Discriminant()
{
  return &type metadata for PreviewStructure.Discriminant;
}

uint64_t getEnumTagSinglePayload for DaemonToShell.TwoWayMessage.Key(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s17PreviewsOSSupport16PreviewStructureO12DiscriminantOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D726D4 + 4 * byte_224D84935[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_224D72708 + 4 * byte_224D84930[v4]))();
}

uint64_t sub_224D72708(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D72710(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D72718);
  return result;
}

uint64_t sub_224D72724(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D7272CLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_224D72730(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D72738(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PreviewStructure.Key()
{
  return &type metadata for PreviewStructure.Key;
}

ValueMetadata *_s3KeyOMa()
{
  return &_s3KeyON;
}

ValueMetadata *_s3KeyOMa_0()
{
  return &_s3KeyON_0;
}

ValueMetadata *_s3KeyOMa_1()
{
  return &_s3KeyON_1;
}

uint64_t _s3KeyOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D727D4 + 4 * byte_224D8493F[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_224D72808 + 4 * byte_224D8493A[v4]))();
}

uint64_t sub_224D72808(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D72810(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D72818);
  return result;
}

uint64_t sub_224D72824(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D7282CLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_224D72830(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D72838(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RefinedPreviewPayload.Key()
{
  return &type metadata for RefinedPreviewPayload.Key;
}

unint64_t sub_224D72858()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557D8230;
  if (!qword_2557D8230)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557D8238);
    result = MEMORY[0x22768C914](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_2557D8230);
  }
  return result;
}

unint64_t sub_224D728A8()
{
  unint64_t result;

  result = qword_2557D8240;
  if (!qword_2557D8240)
  {
    result = MEMORY[0x22768C914](&unk_224D84BF4, &type metadata for RefinedPreviewPayload.Key);
    atomic_store(result, (unint64_t *)&qword_2557D8240);
  }
  return result;
}

unint64_t sub_224D728F0()
{
  unint64_t result;

  result = qword_2557D8248;
  if (!qword_2557D8248)
  {
    result = MEMORY[0x22768C914](&unk_224D84C94, &_s3KeyON_1);
    atomic_store(result, (unint64_t *)&qword_2557D8248);
  }
  return result;
}

unint64_t sub_224D72938()
{
  unint64_t result;

  result = qword_2557D8250;
  if (!qword_2557D8250)
  {
    result = MEMORY[0x22768C914](&unk_224D84D34, &_s3KeyON_0);
    atomic_store(result, (unint64_t *)&qword_2557D8250);
  }
  return result;
}

unint64_t sub_224D72980()
{
  unint64_t result;

  result = qword_2557D8258;
  if (!qword_2557D8258)
  {
    result = MEMORY[0x22768C914](&unk_224D84DD4, &_s3KeyON);
    atomic_store(result, (unint64_t *)&qword_2557D8258);
  }
  return result;
}

unint64_t sub_224D729C8()
{
  unint64_t result;

  result = qword_2557D8260;
  if (!qword_2557D8260)
  {
    result = MEMORY[0x22768C914](&unk_224D84E74, &type metadata for PreviewStructure.Key);
    atomic_store(result, (unint64_t *)&qword_2557D8260);
  }
  return result;
}

unint64_t sub_224D72A10()
{
  unint64_t result;

  result = qword_2557D8268;
  if (!qword_2557D8268)
  {
    result = MEMORY[0x22768C914](&unk_224D84F14, &type metadata for PreviewStructure.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2557D8268);
  }
  return result;
}

unint64_t sub_224D72A54()
{
  unint64_t result;

  result = qword_2557D8270;
  if (!qword_2557D8270)
  {
    result = MEMORY[0x22768C914](&unk_224D84E9C, &type metadata for PreviewStructure.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2557D8270);
  }
  return result;
}

uint64_t sub_224D72A98()
{
  unint64_t v0;

  v0 = sub_224D82834();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_224D72ADC(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for PreviewStructure(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_224D72B2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BC8);
  MEMORY[0x24BDAC7A8](v3);
  v4 = sub_224D825B8();
  MEMORY[0x24BDAC7A8](v4);
  sub_224D73CB0();
  swift_getObjectType();
  sub_224D6B874(a1, a2);
  return swift_unknownObjectRelease();
}

uint64_t sub_224D72E34(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t))
{
  uint64_t v8;
  uint64_t ObjectType;

  v8 = sub_224D825B8();
  MEMORY[0x24BDAC7A8](v8);
  sub_224D73CB0();
  ObjectType = swift_getObjectType();
  a4(a1, a2, a3, ObjectType);
  return swift_unknownObjectRelease();
}

void sub_224D730A8(_OWORD *a1)
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  __int128 v10;
  __int128 v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD aBlock[6];
  __int128 v25;

  sub_224D6C75C();
  v2 = (_OWORD *)swift_allocObject();
  v3 = a1[3];
  v2[3] = a1[2];
  v2[4] = v3;
  v2[5] = a1[4];
  v5 = *a1;
  v4 = a1[1];
  v2[1] = *a1;
  v2[2] = v4;
  v25 = v5;
  v6 = *((_QWORD *)a1 + 2);
  v7 = *((_QWORD *)a1 + 4);
  v8 = *((_QWORD *)a1 + 6);
  v21 = *((_QWORD *)a1 + 8);
  v22 = (uint64_t)v2;
  v9 = (_OWORD *)swift_allocObject();
  v10 = a1[3];
  v9[3] = a1[2];
  v9[4] = v10;
  v9[5] = a1[4];
  v11 = a1[1];
  v9[1] = *a1;
  v9[2] = v11;
  v12 = (_OWORD *)swift_allocObject();
  v13 = a1[3];
  v12[3] = a1[2];
  v12[4] = v13;
  v12[5] = a1[4];
  v14 = a1[1];
  v12[1] = *a1;
  v12[2] = v14;
  sub_224D6C880((uint64_t)&v25);
  sub_224D643A0(v6);
  sub_224D643A0(v7);
  sub_224D643A0(v8);
  sub_224D643A0(v21);
  sub_224D6C880((uint64_t)&v25);
  sub_224D643A0(v6);
  sub_224D643A0(v7);
  sub_224D643A0(v8);
  sub_224D643A0(v21);
  sub_224D6C880((uint64_t)&v25);
  sub_224D643A0(v6);
  sub_224D643A0(v7);
  sub_224D643A0(v8);
  sub_224D643A0(v21);
  v15 = sub_224D6AF58((uint64_t)sub_224D750B0, v22, (uint64_t)sub_224D6C808, (uint64_t)v9, (uint64_t)sub_224D6C878, (uint64_t)v12);
  v16 = *(void **)(v23 + 32);
  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = v23;
  *(_QWORD *)(v17 + 24) = v15;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = sub_224D750EC;
  *(_QWORD *)(v18 + 24) = v17;
  aBlock[4] = sub_224D5C974;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_224D5AC64;
  aBlock[3] = &block_descriptor_3;
  v19 = _Block_copy(aBlock);
  swift_retain();
  v20 = v15;
  swift_retain();
  swift_release();
  objc_msgSend(v16, sel_configureConnection_, v19);
  _Block_release(v19);
  LOBYTE(v19) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  if ((v19 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    objc_msgSend(v16, sel_activate);
    swift_release();

  }
}

uint64_t sub_224D73394(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void (*v5)(uint64_t, void *);
  _QWORD v7[6];

  v7[4] = a1;
  v7[5] = a2;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_224D73428;
  v7[3] = &block_descriptor_43;
  v4 = _Block_copy(v7);
  v5 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v5(a3, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_224D7342C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 16))();
}

uint64_t sub_224D73434(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  uint64_t v22;
  id v23;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  void *v26;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[3];
  uint64_t v35;
  _QWORD v36[4];

  v2 = v1;
  v4 = sub_224D825B8();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D74DE4();
  sub_224D82348();
  sub_224D82588();
  sub_224D63AE8((uint64_t)v36, (uint64_t)v34);
  v8 = a1;
  v9 = a1;
  v10 = sub_224D825A0();
  v11 = sub_224D82750();
  if (os_log_type_enabled(v10, v11))
  {
    v30 = v5;
    v31 = v4;
    v32 = v2;
    v12 = swift_slowAlloc();
    v29 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v12 = 138543618;
    v13 = v35;
    v14 = __swift_project_boxed_opaque_existential_1(v34, v35);
    v28 = (uint64_t)&v28;
    v15 = *(_QWORD *)(v13 - 8);
    MEMORY[0x24BDAC7A8](v14);
    v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v15 + 16))(v17);
    if (sub_224D8284C())
    {
      (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v13);
    }
    else
    {
      swift_allocError();
      (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v18, v17, v13);
    }
    v19 = _swift_stdlib_bridgeErrorToNSError();
    v33 = v19;
    sub_224D8278C();
    v20 = v29;
    *v29 = v19;
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);
    *(_WORD *)(v12 + 12) = 2114;
    v21 = a1;
    v22 = _swift_stdlib_bridgeErrorToNSError();
    v34[0] = v22;
    sub_224D8278C();
    v20[1] = v22;

    _os_log_impl(&dword_224D58000, v10, v11, "%{public}@: %{public}@", (uint8_t *)v12, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D7E40);
    swift_arrayDestroy();
    MEMORY[0x22768C9BC](v20, -1, -1);
    MEMORY[0x22768C9BC](v12, -1, -1);

    v4 = v31;
    v2 = v32;
    v5 = v30;
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v34);

  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v23 = objc_msgSend(v2, sel_replyHandler);
  if (v23)
  {
    v24 = (void (**)(_QWORD, _QWORD, _QWORD))v23;
    __swift_project_boxed_opaque_existential_1(v36, v36[3]);
    v25 = (void *)sub_224D82384();
    v26 = (void *)sub_224D81EEC();
    ((void (**)(_QWORD, _QWORD, void *))v24)[2](v24, 0, v26);

    _Block_release(v24);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v36);
}

void sub_224D737AC(void *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)();
  void *v15;
  void *v16;
  uint64_t v17;

  v6 = (void *)sub_224D82600();
  swift_bridgeObjectRelease();
  v7 = UVShellConnectionInterface((uint64_t)v6);

  objc_msgSend(a1, sel_setInterface_, v7);
  v8 = objc_msgSend((id)objc_opt_self(), sel_userInteractive);
  objc_msgSend(a1, sel_setServiceQuality_, v8);

  objc_msgSend(a1, sel_setInterfaceTarget_, a3);
  v16 = sub_224D7511C;
  v17 = a2;
  v9 = MEMORY[0x24BDAC760];
  v12 = MEMORY[0x24BDAC760];
  v13 = 1107296256;
  v14 = sub_224D73428;
  v15 = &block_descriptor_37;
  v10 = _Block_copy(&v12);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setInvalidationHandler_, v10);
  _Block_release(v10);
  v16 = sub_224D75124;
  v17 = a2;
  v12 = v9;
  v13 = 1107296256;
  v14 = sub_224D73428;
  v15 = &block_descriptor_40;
  v11 = _Block_copy(&v12);
  swift_retain();
  swift_release();
  objc_msgSend(a1, sel_setActivationHandler_, v11);
  _Block_release(v11);
}

uint64_t sub_224D73A1C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD v8[2];

  v3 = sub_224D8230C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8[1] = a2;
  sub_224D82300();
  sub_224D5C9C0(&qword_2557D8388, (uint64_t *)&unk_2557D7530, (uint64_t)&protocol conformance descriptor for ShellConnection<A>);
  sub_224D822E8();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

void sub_224D73B04(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

uint64_t sub_224D73B54(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D74A0);
  sub_224D5C9C0(qword_2557D7ED0, &qword_2557D74A0, MEMORY[0x24BE76D88]);
  sub_224D822D0();
  return ClientRole.handleActivation(_:)(a1);
}

uint64_t sub_224D73C0C(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

unint64_t sub_224D73C2C()
{
  sub_224D827D4();
  swift_bridgeObjectRelease();
  ShellService.description.getter();
  sub_224D8263C();
  swift_bridgeObjectRelease();
  return 0xD000000000000015;
}

uint64_t sub_224D73CB0()
{
  uint64_t v0;
  _QWORD *v2;
  uint64_t v3;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  if (objc_msgSend(*(id *)(v0 + 32), sel_remoteTarget))
  {
    sub_224D827A4();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_224D5BE50((uint64_t)v4, (uint64_t)v5);
  if (v6)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D7E50);
    if ((swift_dynamicCast() & 1) != 0)
      return v3;
  }
  else
  {
    sub_224D5BE98((uint64_t)v5, (uint64_t *)&unk_2557D8350);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8370);
  sub_224D5C9C0(&qword_2557D8378, &qword_2557D8370, (uint64_t)&unk_224D84428);
  swift_allocError();
  *v2 = v0;
  swift_retain();
  return swift_willThrow();
}

id sub_224D73DC8(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  char v9;
  _QWORD v10[6];
  objc_super v11;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC17PreviewsOSSupport24ServiceHubPreviewService_invalidationHandle;
  sub_224D823CC();
  swift_allocObject();
  v5 = v1;
  v9 = 2;
  *(_QWORD *)&v1[v4] = sub_224D823C0();
  *(_QWORD *)&v5[OBJC_IVAR____TtC17PreviewsOSSupport24ServiceHubPreviewService_connection] = a1;
  swift_retain();

  v11.receiver = v5;
  v11.super_class = ObjectType;
  v6 = objc_msgSendSuper2(&v11, sel_init, v9, 0, 0);
  v10[5] = v6;
  v10[3] = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D7530);
  v10[4] = sub_224D5C9C0(&qword_2557D8390, (uint64_t *)&unk_2557D7530, (uint64_t)&protocol conformance descriptor for ShellConnection<A>);
  v10[0] = a1;
  sub_224D74F7C((unint64_t *)&unk_2557D82F8, v7, (uint64_t (*)(uint64_t))type metadata accessor for ServiceHubPreviewService, (uint64_t)&unk_224D850CC);
  sub_224D822A0();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v10);
  return v6;
}

uint64_t sub_224D73F18(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7BA0);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_224D82690();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v2;
  v10[5] = a1;
  v10[6] = a2;
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  v11 = v2;
  swift_retain();
  if ((_DWORD)a1 == 1)
  {
    sub_224D5BE98((uint64_t)v7, &qword_2557D7BA0);
  }
  else
  {
    sub_224D82684();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (v10[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v12 = sub_224D82678();
      v14 = v13;
      swift_unknownObjectRelease();
      if (v14 | v12)
      {
        v16[0] = 0;
        v16[1] = 0;
        v16[2] = v12;
        v16[3] = v14;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_224D740E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[14] = a5;
  v6[15] = a6;
  v6[13] = a4;
  return swift_task_switch();
}

uint64_t sub_224D74104()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(v0 + 104) + OBJC_IVAR____TtC17PreviewsOSSupport24ServiceHubPreviewService_connection);
  *(_QWORD *)(v0 + 128) = v1;
  *(_QWORD *)(v0 + 16) = sub_224D73C2C();
  *(_QWORD *)(v0 + 24) = v2;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_OWORD *)(v0 + 48) = 0u;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  sub_224D730A8((_OWORD *)(v0 + 16));
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 96) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D7530);
  sub_224D5C9C0(&qword_2557D8320, (uint64_t *)&unk_2557D7530, (uint64_t)&protocol conformance descriptor for ShellConnection<A>);
  *v3 = v0;
  v3[1] = sub_224D741DC;
  return sub_224D8215C();
}

uint64_t sub_224D741DC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 144) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_224D74240()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(uint64_t (*)(uint64_t), _QWORD *);
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(void (**)(uint64_t (*)(uint64_t), _QWORD *))(v0 + 112);
  swift_retain();
  v3 = sub_224D73C2C();
  v5 = v4;
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = v3;
  v6[3] = v5;
  v6[4] = sub_224D74EF4;
  v6[5] = v1;
  v6[6] = sub_224D74EF8;
  v6[7] = v1;
  v6[8] = sub_224D74F18;
  v6[9] = v1;
  swift_bridgeObjectRetain();
  swift_retain_n();
  v2(sub_224D74F74, v6);
  swift_release();
  swift_bridgeObjectRelease();
  swift_release_n();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D74320()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_224D7432C(uint64_t a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  __int128 v11;
  __int128 v12;
  _OWORD v14[5];

  v3 = sub_224D8203C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_224D81FDC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D744A8();
  v11 = a2[1];
  v14[0] = *a2;
  v14[1] = v11;
  v12 = a2[3];
  v14[2] = a2[2];
  v14[3] = v12;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8328);
  sub_224D5C9C0(&qword_2557D8330, &qword_2557D8328, (uint64_t)&protocol conformance descriptor for ShellConnectionSender<A>);
  sub_224D74F7C(&qword_2557D8338, 255, (uint64_t (*)(uint64_t))MEMORY[0x24BE77460], MEMORY[0x24BE77440]);
  sub_224D820FC();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_224D744A8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v19;
  __int128 v20;
  __int128 v21;

  v2 = sub_224D82264();
  MEMORY[0x24BDAC7A8](v2);
  v3 = objc_msgSend(v0, sel_messageType);
  if (!v3)
  {
    sub_224D74FBC();
    swift_allocError();
    *v14 = 0;
    return swift_willThrow();
  }
  v4 = v3;
  v5 = sub_224D8260C();
  v7 = v6;

  v8 = objc_msgSend(v0, sel_payload);
  if (!v8
    || (*(_QWORD *)&v20 = v8,
        __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7C60),
        __swift_instantiateConcreteTypeFromMangledName(&qword_2557D7C68),
        (swift_dynamicCast() & 1) == 0))
  {
    swift_bridgeObjectRelease();
    v12 = objc_msgSend(v0, sel_payload);
    if (v12)
    {
      v13 = v12;
      *((_QWORD *)&v21 + 1) = swift_getObjectType();
      *(_QWORD *)&v20 = v13;
    }
    else
    {
      v20 = 0u;
      v21 = 0u;
    }
    sub_224D67D34();
    swift_allocError();
    v16 = v15;
    sub_224D5BE50((uint64_t)&v20, v15);
    *(_BYTE *)(v16 + 32) = 0;
    return swift_willThrow();
  }
  v9 = objc_msgSend(v0, sel_replyHandler, (_QWORD)v20);
  if (!v9)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_224D74FBC();
    swift_allocError();
    *v17 = 1;
    return swift_willThrow();
  }
  v10 = v9;
  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = v10;
  *(_QWORD *)&v20 = v5;
  *((_QWORD *)&v20 + 1) = v7;
  sub_224D75000();
  sub_224D75044();
  sub_224D82450();
  if (v1)
  {
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    sub_224D82210();
    sub_224D81FD0();
    v19 = swift_allocObject();
    *(_QWORD *)(v19 + 16) = sub_224D67D9C;
    *(_QWORD *)(v19 + 24) = v11;
    return sub_224D81FF4();
  }
}

uint64_t type metadata accessor for ServiceHubPreviewService()
{
  return objc_opt_self();
}

uint64_t sub_224D749C8()
{
  return swift_retain();
}

unint64_t sub_224D749DC()
{
  _BYTE *v0;

  if (*v0)
    return 0xD000000000000015;
  else
    return 0xD000000000000014;
}

uint64_t sub_224D74A1C()
{
  return 0;
}

uint64_t sub_224D74A24()
{
  sub_224D7590C();
  return sub_224D82354();
}

uint64_t sub_224D74A4C()
{
  sub_224D7590C();
  return sub_224D82330();
}

unint64_t sub_224D74A74()
{
  return 0xD000000000000025;
}

uint64_t sub_224D74A90()
{
  sub_224D74DE4();
  return sub_224D82354();
}

uint64_t sub_224D74AB8()
{
  sub_224D74DE4();
  return sub_224D82330();
}

uint64_t sub_224D74AE0()
{
  uint64_t v0;
  _BYTE v2[24];
  uint64_t v3;
  unint64_t v4;

  v3 = 0;
  v4 = 0xE000000000000000;
  sub_224D67FD0(v0, (uint64_t)v2, (uint64_t *)&unk_2557D8350);
  sub_224D5BE98((uint64_t)v2, (uint64_t *)&unk_2557D8350);
  sub_224D8263C();
  swift_bridgeObjectRelease();
  sub_224D8263C();
  sub_224D8263C();
  swift_bridgeObjectRelease();
  sub_224D8263C();
  return v3;
}

uint64_t sub_224D74BF0()
{
  uint64_t v0;
  _OWORD v2[2];
  __int128 v3;
  uint64_t v4;

  sub_224D67FD0(v0, (uint64_t)&v3, (uint64_t *)&unk_2557D8350);
  if (v4)
  {
    sub_224D75950(&v3, v2);
    sub_224D827D4();
    sub_224D8263C();
    sub_224D827F8();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
  }
  return 0;
}

uint64_t sub_224D74CC4()
{
  sub_224D75960();
  return sub_224D82354();
}

uint64_t sub_224D74CEC()
{
  sub_224D75960();
  return sub_224D82330();
}

uint64_t sub_224D74D14(void (*a1)(void))
{
  a1();
  return _swift_stdlib_bridgeErrorToNSError();
}

void sub_224D74D34(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_224D8278C();
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

unint64_t sub_224D74DE4()
{
  unint64_t result;

  result = qword_2557D82E8;
  if (!qword_2557D82E8)
  {
    result = MEMORY[0x22768C914](&unk_224D854A8, &_s13WrappingErrorVN);
    atomic_store(result, (unint64_t *)&qword_2557D82E8);
  }
  return result;
}

uint64_t sub_224D74E28()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_224D74E4C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_224D74E58()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D74E8C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_224D67C7C;
  *(_QWORD *)(v3 + 120) = v2;
  *(_OWORD *)(v3 + 104) = v4;
  return swift_task_switch();
}

uint64_t sub_224D74EF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_224D72E34(a1, a2, a3, sub_224D6BA48);
}

uint64_t sub_224D74F18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_224D72E34(a1, a2, a3, sub_224D6BA64);
}

uint64_t sub_224D74F38()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D74F74(uint64_t a1)
{
  uint64_t v1;

  return sub_224D7432C(a1, (_OWORD *)(v1 + 16));
}

uint64_t sub_224D74F7C(unint64_t *a1, uint64_t a2, uint64_t (*a3)(uint64_t), uint64_t a4)
{
  uint64_t result;
  uint64_t v7;

  result = *a1;
  if (!result)
  {
    v7 = a3(a2);
    result = MEMORY[0x22768C914](a4, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_224D74FBC()
{
  unint64_t result;

  result = qword_2557D8340;
  if (!qword_2557D8340)
  {
    result = MEMORY[0x22768C914](&unk_224D85468, &_s19ServiceMessageErrorON);
    atomic_store(result, (unint64_t *)&qword_2557D8340);
  }
  return result;
}

unint64_t sub_224D75000()
{
  unint64_t result;

  result = qword_2557D8360;
  if (!qword_2557D8360)
  {
    result = MEMORY[0x22768C914](MEMORY[0x24BE77428], MEMORY[0x24BE77430]);
    atomic_store(result, (unint64_t *)&qword_2557D8360);
  }
  return result;
}

unint64_t sub_224D75044()
{
  unint64_t result;

  result = qword_2557D8368;
  if (!qword_2557D8368)
  {
    result = MEMORY[0x22768C914](MEMORY[0x24BE77438], MEMORY[0x24BE77430]);
    atomic_store(result, (unint64_t *)&qword_2557D8368);
  }
  return result;
}

uint64_t sub_224D75088()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D750B0()
{
  return sub_224D6AC38();
}

uint64_t sub_224D750C0()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_224D750EC(void *a1)
{
  uint64_t v1;

  sub_224D737AC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_224D750F4()
{
  return swift_deallocObject();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_224D7511C(uint64_t a1)
{
  uint64_t v1;

  return sub_224D73A1C(a1, v1);
}

uint64_t sub_224D75124(void *a1)
{
  return sub_224D73B54(a1);
}

id sub_224D7512C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v11;
  id v12;
  _BYTE v13[15];
  unsigned __int8 v14;

  v1 = sub_224D82264();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = &v13[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_224D81F88();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = &v13[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v14 = 2;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v6 + 104))(v8, *MEMORY[0x24BE78630], v5);
  _s17PreviewsOSSupport15JITSetupPayloadV17propertyListValue0A12FoundationOS08PropertyF0Vvg_0();
  v9 = sub_224D5BA60(&v14, (uint64_t)v8, (uint64_t)v4);
  if (v0)
  {
    (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
    return (id)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
  }
  else
  {
    v11 = v9;
    (*(void (**)(_BYTE *, uint64_t))(v2 + 8))(v4, v1);
    (*(void (**)(_BYTE *, uint64_t))(v6 + 8))(v8, v5);
    v12 = objc_allocWithZone((Class)type metadata accessor for ServiceHubPreviewService());
    return sub_224D73DC8(v11);
  }
}

uint64_t _s19ServiceMessageErrorOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D752CC + 4 * byte_224D85085[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_224D75300 + 4 * byte_224D85080[v4]))();
}

uint64_t sub_224D75300(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D75308(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D75310);
  return result;
}

uint64_t sub_224D7531C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D75324);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_224D75328(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D75330(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s19ServiceMessageErrorOMa()
{
  return &_s19ServiceMessageErrorON;
}

ValueMetadata *_s13WrappingErrorVMa()
{
  return &_s13WrappingErrorVN;
}

uint64_t _s12PayloadErrorVwxx(uint64_t result)
{
  if (*(_QWORD *)(result + 24))
    return __swift_destroy_boxed_opaque_existential_1Tm(result);
  return result;
}

uint64_t _s12PayloadErrorVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 24);
  if (v4)
  {
    *(_QWORD *)(a1 + 24) = v4;
    (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
  }
  else
  {
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
  }
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t _s12PayloadErrorVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int128 v5;

  v4 = *(_QWORD *)(a2 + 24);
  if (!*(_QWORD *)(a1 + 24))
  {
    if (v4)
    {
      *(_QWORD *)(a1 + 24) = v4;
      (**(void (***)(uint64_t, uint64_t))(v4 - 8))(a1, a2);
      goto LABEL_8;
    }
LABEL_7:
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
    goto LABEL_8;
  }
  if (!v4)
  {
    __swift_destroy_boxed_opaque_existential_1Tm(a1);
    goto LABEL_7;
  }
  __swift_assign_boxed_opaque_existential_0((uint64_t *)a1, (uint64_t *)a2);
LABEL_8:
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
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

uint64_t _s12PayloadErrorVwta(uint64_t a1, uint64_t a2)
{
  __int128 v4;

  if (*(_QWORD *)(a1 + 24))
    __swift_destroy_boxed_opaque_existential_1Tm(a1);
  v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  return a1;
}

uint64_t _s12PayloadErrorVwet(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 33))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 24);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t _s12PayloadErrorVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_BYTE *)(result + 32) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 33) = 0;
    if (a2)
      *(_QWORD *)(result + 24) = a2;
  }
  return result;
}

ValueMetadata *_s12PayloadErrorVMa()
{
  return &_s12PayloadErrorVN;
}

unint64_t sub_224D756CC()
{
  unint64_t result;

  result = qword_2557D8398;
  if (!qword_2557D8398)
  {
    result = MEMORY[0x22768C914](&unk_224D85168, &_s12PayloadErrorVN);
    atomic_store(result, (unint64_t *)&qword_2557D8398);
  }
  return result;
}

unint64_t sub_224D75714()
{
  unint64_t result;

  result = qword_2557D83A0;
  if (!qword_2557D83A0)
  {
    result = MEMORY[0x22768C914](&unk_224D85140, &_s12PayloadErrorVN);
    atomic_store(result, (unint64_t *)&qword_2557D83A0);
  }
  return result;
}

unint64_t sub_224D7575C()
{
  unint64_t result;

  result = qword_2557D83A8;
  if (!qword_2557D83A8)
  {
    result = MEMORY[0x22768C914](&unk_224D85248, &_s13WrappingErrorVN);
    atomic_store(result, (unint64_t *)&qword_2557D83A8);
  }
  return result;
}

unint64_t sub_224D757A8()
{
  unint64_t result;

  result = qword_2557D83B0;
  if (!qword_2557D83B0)
  {
    result = MEMORY[0x22768C914](&unk_224D85320, &_s19ServiceMessageErrorON);
    atomic_store(result, (unint64_t *)&qword_2557D83B0);
  }
  return result;
}

unint64_t sub_224D757F0()
{
  unint64_t result;

  result = qword_2557D83B8;
  if (!qword_2557D83B8)
  {
    result = MEMORY[0x22768C914](&unk_224D852F8, &_s19ServiceMessageErrorON);
    atomic_store(result, (unint64_t *)&qword_2557D83B8);
  }
  return result;
}

unint64_t sub_224D75838()
{
  unint64_t result;

  result = qword_2557D83C0;
  if (!qword_2557D83C0)
  {
    result = MEMORY[0x22768C914](&unk_224D85440, &_s19ServiceMessageErrorON);
    atomic_store(result, (unint64_t *)&qword_2557D83C0);
  }
  return result;
}

unint64_t sub_224D75880()
{
  unint64_t result;

  result = qword_2557D83C8;
  if (!qword_2557D83C8)
  {
    result = MEMORY[0x22768C914](&unk_224D852B0, &_s13WrappingErrorVN);
    atomic_store(result, (unint64_t *)&qword_2557D83C8);
  }
  return result;
}

unint64_t sub_224D758C8()
{
  unint64_t result;

  result = qword_2557D83D0;
  if (!qword_2557D83D0)
  {
    result = MEMORY[0x22768C914](&unk_224D85288, &_s13WrappingErrorVN);
    atomic_store(result, (unint64_t *)&qword_2557D83D0);
  }
  return result;
}

unint64_t sub_224D7590C()
{
  unint64_t result;

  result = qword_2557D83D8;
  if (!qword_2557D83D8)
  {
    result = MEMORY[0x22768C914](&unk_224D85368, &_s19ServiceMessageErrorON);
    atomic_store(result, (unint64_t *)&qword_2557D83D8);
  }
  return result;
}

_OWORD *sub_224D75950(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_224D75960()
{
  unint64_t result;

  result = qword_2557D83E0;
  if (!qword_2557D83E0)
  {
    result = MEMORY[0x22768C914](&unk_224D851B0, &_s12PayloadErrorVN);
    atomic_store(result, (unint64_t *)&qword_2557D83E0);
  }
  return result;
}

uint64_t sub_224D759C4(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x4377656976657270;
  else
    v3 = 0x656C746974;
  if (v2)
    v4 = 0xE500000000000000;
  else
    v4 = 0xEC000000746E756FLL;
  if ((a2 & 1) != 0)
    v5 = 0x4377656976657270;
  else
    v5 = 0x656C746974;
  if ((a2 & 1) != 0)
    v6 = 0xEC000000746E756FLL;
  else
    v6 = 0xE500000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_224D82870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_224D75A68(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x7463655365726F6DLL;
  else
    v3 = 0x6365537473726966;
  if (v2)
    v4 = 0xEC0000006E6F6974;
  else
    v4 = 0xEC000000736E6F69;
  if ((a2 & 1) != 0)
    v5 = 0x7463655365726F6DLL;
  else
    v5 = 0x6365537473726966;
  if ((a2 & 1) != 0)
    v6 = 0xEC000000736E6F69;
  else
    v6 = 0xEC0000006E6F6974;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_224D82870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_224D75B18(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 0x77656976657270;
  else
    v2 = 0x6E6F6974636573;
  if ((a2 & 1) != 0)
    v3 = 0x77656976657270;
  else
    v3 = 0x6E6F6974636573;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_224D82870();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_224D75B94(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000013;
  else
    v3 = 0x5077656976657270;
  if (v2)
    v4 = 0xEE0064616F6C7961;
  else
    v4 = 0x8000000224D85BA0;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000013;
  else
    v5 = 0x5077656976657270;
  if ((a2 & 1) != 0)
    v6 = 0x8000000224D85BA0;
  else
    v6 = 0xEE0064616F6C7961;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_224D82870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_224D75C44(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x656449656E656373;
  else
    v3 = 0x696D697263736964;
  if (v2)
    v4 = 0xEC000000746E616ELL;
  else
    v4 = 0xEF7265696669746ELL;
  if ((a2 & 1) != 0)
    v5 = 0x656449656E656373;
  else
    v5 = 0x696D697263736964;
  if ((a2 & 1) != 0)
    v6 = 0xEF7265696669746ELL;
  else
    v6 = 0xEC000000746E616ELL;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_224D82870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

void sub_224D75CF8(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_224D75D44(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(void))((char *)sub_224D75D90 + 4 * byte_224D85584[a2]))();
}

uint64_t sub_224D75D90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;

  if (a1 == a3 && v3 == 0x8000000224D85B20)
    v4 = 1;
  else
    v4 = sub_224D82870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v4 & 1;
}

uint64_t sub_224D75E10(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 7107189;
  else
    v3 = 0x696D697263736964;
  if (v2)
    v4 = 0xEC000000746E616ELL;
  else
    v4 = 0xE300000000000000;
  if ((a2 & 1) != 0)
    v5 = 7107189;
  else
    v5 = 0x696D697263736964;
  if ((a2 & 1) != 0)
    v6 = 0xE300000000000000;
  else
    v6 = 0xEC000000746E616ELL;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_224D82870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_224D75EB0(char a1, char a2)
{
  BOOL v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0xD000000000000016;
  else
    v3 = 0x4C525579706F63;
  if (v2)
    v4 = 0xE700000000000000;
  else
    v4 = 0x8000000224D85AD0;
  if ((a2 & 1) != 0)
    v5 = 0xD000000000000016;
  else
    v5 = 0x4C525579706F63;
  if ((a2 & 1) != 0)
    v6 = 0x8000000224D85AD0;
  else
    v6 = 0xE700000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_224D82870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_224D75F54(char a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  if ((a1 & 1) != 0)
    v2 = 0x646950746E656761;
  else
    v2 = 0x44496D6165727473;
  if ((a2 & 1) != 0)
    v3 = 0x646950746E656761;
  else
    v3 = 0x44496D6165727473;
  if (v2 == v3)
    v4 = 1;
  else
    v4 = sub_224D82870();
  swift_bridgeObjectRelease_n();
  return v4 & 1;
}

uint64_t sub_224D75FD0(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aDiscrimimetada_0[8 * a1] == *(_QWORD *)&aDiscrimimetada_0[8 * a2]
    && *(_QWORD *)&aDiscrimimetada_0[8 * a1 + 24] == *(_QWORD *)&aDiscrimimetada_0[8 * a2 + 24])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_224D82870();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

uint64_t sub_224D76054(unsigned __int8 a1, unsigned __int8 a2)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  unint64_t v7;
  char v8;

  v2 = a1;
  if (a1)
  {
    if (a1 == 1)
      v3 = 0x4777656976657270;
    else
      v3 = 0xD000000000000011;
    if (v2 == 1)
      v4 = 0xEC00000070756F72;
    else
      v4 = 0x8000000224D85C10;
    v5 = a2;
    if (a2)
    {
LABEL_9:
      if (v5 == 1)
        v6 = 0x4777656976657270;
      else
        v6 = 0xD000000000000011;
      if (v5 == 1)
        v7 = 0xEC00000070756F72;
      else
        v7 = 0x8000000224D85C10;
      if (v3 != v6)
        goto LABEL_21;
      goto LABEL_19;
    }
  }
  else
  {
    v3 = 0x7250656C676E6973;
    v4 = 0xED00007765697665;
    v5 = a2;
    if (a2)
      goto LABEL_9;
  }
  v7 = 0xED00007765697665;
  if (v3 != 0x7250656C676E6973)
  {
LABEL_21:
    v8 = sub_224D82870();
    goto LABEL_22;
  }
LABEL_19:
  if (v4 != v7)
    goto LABEL_21;
  v8 = 1;
LABEL_22:
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_224D76188(char a1, char a2)
{
  char v3;

  if (*(_QWORD *)&aDiscrimimessag[8 * a1] == *(_QWORD *)&aDiscrimimessag[8 * a2]
    && *(_QWORD *)&aNant[8 * a1] == *(_QWORD *)&aNant[8 * a2])
  {
    v3 = 1;
  }
  else
  {
    v3 = sub_224D82870();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

void sub_224D7620C(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_224D76258(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_224D762D0 + 4 * byte_224D8558C[a2]))(0x5377656976657270);
}

uint64_t sub_224D762D0(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x5377656976657270 && v1 == 0xEE00656369767265)
    v2 = 1;
  else
    v2 = sub_224D82870();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_224D76388()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D763FC()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D76480()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

void sub_224D76500(char a1)
{
  sub_224D828E8();
  __asm { BR              X10 }
}

uint64_t sub_224D76558()
{
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D765B8()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D7664C()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D766DC()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D76750()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D767E0()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D76864()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D7691C()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

void sub_224D76984(char a1)
{
  sub_224D828E8();
  __asm { BR              X10 }
}

uint64_t sub_224D769DC()
{
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D76A5C()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D76AC4()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D76B20()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D76B88()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D76BCC()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D76C34()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

void sub_224D76CA0(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_224D76CE4()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D76D28()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D76D80()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D76DDC()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D76E20()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D76E60()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D76EF0()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

void sub_224D76F30(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_224D76F78()
{
  sub_224D82630();
  return swift_bridgeObjectRelease();
}

void sub_224D76FE4(uint64_t a1, char a2)
{
  sub_224D828E8();
  __asm { BR              X10 }
}

uint64_t sub_224D77038()
{
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D770B8()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D7711C()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D771D0()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D77234()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D772A4()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D77324()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

void sub_224D773A0(uint64_t a1, char a2)
{
  sub_224D828E8();
  __asm { BR              X10 }
}

uint64_t sub_224D773F4()
{
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D77454()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D774E4()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D77570()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D775E0()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D7766C()
{
  sub_224D828E8();
  sub_224D82630();
  swift_bridgeObjectRelease();
  return sub_224D8290C();
}

uint64_t sub_224D776EC(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_224D77728 + 4 * byte_224D855A8[a1]))(0xD000000000000016, 0x8000000224D85AD0);
}

uint64_t sub_224D77728()
{
  return 0x5377656976657270;
}

unint64_t sub_224D7774C()
{
  return 0xD000000000000010;
}

uint64_t sub_224D77768()
{
  return 0x4C525579706F63;
}

void sub_224D77780(char *a1)
{
  sub_224D7620C(*a1);
}

void sub_224D7778C()
{
  char *v0;

  sub_224D76984(*v0);
}

void sub_224D77794(uint64_t a1)
{
  char *v1;

  sub_224D76F30(a1, *v1);
}

void sub_224D7779C(uint64_t a1)
{
  char *v1;

  sub_224D76FE4(a1, *v1);
}

uint64_t sub_224D777A4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_224D78DE8();
  *a1 = result;
  return result;
}

uint64_t sub_224D777D0@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D776EC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D777F8()
{
  sub_224D78DA4();
  return sub_224D82444();
}

uint64_t sub_224D77840()
{
  sub_224D78DA4();
  return sub_224D82450();
}

uint64_t sub_224D778A4(char a1)
{
  return *(_QWORD *)&aDiscrimimessag[8 * a1];
}

uint64_t sub_224D778C4(char *a1, char *a2)
{
  return sub_224D76188(*a1, *a2);
}

uint64_t sub_224D778D0()
{
  return sub_224D76A5C();
}

uint64_t sub_224D778D8()
{
  return sub_224D76EF0();
}

uint64_t sub_224D778E0()
{
  return sub_224D770B8();
}

uint64_t sub_224D778E8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_224D78E30();
  *a1 = result;
  return result;
}

uint64_t sub_224D77914@<X0>(uint64_t *a1@<X8>)
{
  char *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_224D778A4(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_224D7793C()
{
  char *v0;

  return sub_224D778A4(*v0);
}

void DaemonToShell.TwoWayMessage.propertyListValue.getter(uint64_t a1@<X8>)
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  _QWORD v20[12];
  uint64_t v21;

  v20[11] = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D83F0);
  MEMORY[0x24BDAC7A8](v2);
  v20[10] = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_224D820A8();
  v20[8] = *(_QWORD *)(v4 - 8);
  v20[9] = v4;
  MEMORY[0x24BDAC7A8](v4);
  v20[7] = (char *)v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D83F8);
  MEMORY[0x24BDAC7A8](v6);
  v20[6] = (char *)v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_224D82138();
  v20[4] = *(_QWORD *)(v8 - 8);
  v20[5] = v8;
  MEMORY[0x24BDAC7A8](v8);
  v20[3] = (char *)v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8400);
  MEMORY[0x24BDAC7A8](v10);
  v20[2] = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_224D81FB8();
  MEMORY[0x24BDAC7A8](v12);
  v20[1] = (char *)v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8408);
  MEMORY[0x24BDAC7A8](v14);
  v15 = sub_224D81FDC();
  MEMORY[0x24BDAC7A8](v15);
  v16 = type metadata accessor for DaemonToShell.TwoWayMessage();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)v20 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = v1;
  sub_224D78004();
  sub_224D78048();
  sub_224D8224C();
  sub_224D7808C(v1, (uint64_t)v18);
  v19 = (char *)sub_224D77BE8 + 4 * byte_224D855AC[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_224D77BE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v4, v3, v1);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v0, v4, v1);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v0, 0, 1, v1);
  *(_QWORD *)(v6 - 104) = &type metadata for DaemonToShell.TwoWayMessage.Key;
  *(_QWORD *)(v6 - 96) = v5;
  *(_BYTE *)(v6 - 128) = 1;
  sub_224D6503C(&qword_2557D8338, (uint64_t (*)(uint64_t))MEMORY[0x24BE77460], MEMORY[0x24BE77440]);
  sub_224D821EC();
  sub_224D5BE98(v0, &qword_2557D8408);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v4, v1);
  return __swift_destroy_boxed_opaque_existential_1Tm(v6 - 128);
}

uint64_t type metadata accessor for DaemonToShell.TwoWayMessage()
{
  uint64_t result;

  result = qword_2557D84F8;
  if (!qword_2557D84F8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_224D77EF4(_BYTE *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;

  v5 = type metadata accessor for DaemonToShell.TwoWayMessage();
  MEMORY[0x24BDAC7A8](v5);
  *a1 = 0;
  sub_224D7808C(a3, (uint64_t)&v8 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = (char *)sub_224D77F84 + 4 * byte_224D855B0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_224D77F84()
{
  _BYTE *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  v2 = sub_224D81FDC();
  result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1);
  *v0 = 0;
  return result;
}

void sub_224D77FFC(_BYTE *a1, uint64_t a2)
{
  uint64_t v2;

  sub_224D77EF4(a1, a2, *(_QWORD *)(v2 + 16));
}

unint64_t sub_224D78004()
{
  unint64_t result;

  result = qword_2557D8410;
  if (!qword_2557D8410)
  {
    result = MEMORY[0x22768C914](&unk_224D85894, &type metadata for DaemonToShell.TwoWayMessage.Key);
    atomic_store(result, (unint64_t *)&qword_2557D8410);
  }
  return result;
}

unint64_t sub_224D78048()
{
  unint64_t result;

  result = qword_2557D8418;
  if (!qword_2557D8418)
  {
    result = MEMORY[0x22768C914](&unk_224D85854, &type metadata for DaemonToShell.TwoWayMessage.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2557D8418);
  }
  return result;
}

uint64_t sub_224D7808C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DaemonToShell.TwoWayMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t DaemonToShell.TwoWayMessage.init(propertyListValue:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE v9[24];
  ValueMetadata *v10;
  unint64_t v11;

  v3 = type metadata accessor for DaemonToShell.TwoWayMessage();
  v4 = MEMORY[0x24BDAC7A8](v3);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v6 = MEMORY[0x24BDAC7A8](v5);
  MEMORY[0x24BDAC7A8](v6);
  v10 = &type metadata for DaemonToShell.TwoWayMessage.Key;
  v11 = sub_224D78004();
  v9[0] = 0;
  sub_224D78048();
  sub_224D821F8();
  if (!v1)
  {
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
    __asm { BR              X10 }
  }
  v7 = sub_224D82264();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
}

void sub_224D78238()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(v5 - 96) = v2;
  *(_QWORD *)(v5 - 88) = v4;
  *(_BYTE *)(v5 - 120) = 1;
  sub_224D81FDC();
  sub_224D6503C(&qword_2557D8338, (uint64_t (*)(uint64_t))MEMORY[0x24BE77460], MEMORY[0x24BE77440]);
  sub_224D821F8();
  if (!v0)
  {
    v6 = sub_224D82264();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v1, v6);
    __swift_destroy_boxed_opaque_existential_1Tm(v5 - 120);
    swift_storeEnumTagMultiPayload();
    sub_224D7848C(v3, *(_QWORD *)(v5 - 128));
    JUMPOUT(0x224D781F0);
  }
  JUMPOUT(0x224D781CCLL);
}

uint64_t sub_224D7848C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for DaemonToShell.TwoWayMessage();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_224D784D0(uint64_t a1)
{
  unint64_t result;

  result = sub_224D784F4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_224D784F4()
{
  unint64_t result;

  result = qword_2557D8458;
  if (!qword_2557D8458)
  {
    result = MEMORY[0x22768C914](&protocol conformance descriptor for DaemonToShell, &type metadata for DaemonToShell);
    atomic_store(result, (unint64_t *)&qword_2557D8458);
  }
  return result;
}

unint64_t sub_224D78538(uint64_t a1)
{
  unint64_t result;

  result = sub_224D7855C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_224D7855C()
{
  unint64_t result;

  result = qword_2557D8480;
  if (!qword_2557D8480)
  {
    result = MEMORY[0x22768C914](&protocol conformance descriptor for ServiceHubToShell, &type metadata for ServiceHubToShell);
    atomic_store(result, (unint64_t *)&qword_2557D8480);
  }
  return result;
}

uint64_t sub_224D785A4(uint64_t a1)
{
  return DaemonToShell.TwoWayMessage.init(propertyListValue:)(a1);
}

ValueMetadata *type metadata accessor for DaemonToShell()
{
  return &type metadata for DaemonToShell;
}

uint64_t initializeBufferWithCopyOfBuffer for DaemonToShell.TwoWayMessage(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) == 0)
  {
    v5 = (char *)&loc_224D78618 + 4 * byte_224D855B8[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v6 = *a2;
  *a1 = *a2;
  v7 = v6 + ((v4 + 16) & ~(unint64_t)v4);
  swift_retain();
  return v7;
}

uint64_t destroy for DaemonToShell.TwoWayMessage(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = swift_getEnumCaseMultiPayload();
  switch((int)result)
  {
    case 0:
      v3 = sub_224D81FDC();
      goto LABEL_6;
    case 1:
      v3 = sub_224D81FB8();
      goto LABEL_6;
    case 2:
      v3 = sub_224D82138();
      goto LABEL_6;
    case 3:
      v3 = sub_224D820A8();
LABEL_6:
      result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
      break;
    default:
      return result;
  }
  return result;
}

void initializeWithCopy for DaemonToShell.TwoWayMessage()
{
  char *v0;

  v0 = (char *)sub_224D787E0 + 4 * byte_224D855C0[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_224D787E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_224D81FDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithCopy for DaemonToShell.TwoWayMessage(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_224D78908(result);
    v2 = (char *)&loc_224D788A0 + 4 * byte_224D855C4[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_224D78908(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for DaemonToShell.TwoWayMessage();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void initializeWithTake for DaemonToShell.TwoWayMessage()
{
  char *v0;

  v0 = (char *)sub_224D7898C + 4 * byte_224D855C8[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_224D7898C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = sub_224D81FDC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 32))(v0, v1, v2);
  swift_storeEnumTagMultiPayload();
  return v0;
}

uint64_t assignWithTake for DaemonToShell.TwoWayMessage(uint64_t result, uint64_t a2)
{
  char *v2;

  if (result != a2)
  {
    sub_224D78908(result);
    v2 = (char *)&loc_224D78A4C + 4 * byte_224D855CC[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  return result;
}

uint64_t sub_224D78AB4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  result = sub_224D81FDC();
  if (v1 <= 0x3F)
  {
    result = sub_224D81FB8();
    if (v2 <= 0x3F)
    {
      result = sub_224D82138();
      if (v3 <= 0x3F)
      {
        result = sub_224D820A8();
        if (v4 <= 0x3F)
        {
          swift_initEnumMetadataMultiPayload();
          return 0;
        }
      }
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ServiceHubToShell()
{
  return &type metadata for ServiceHubToShell;
}

uint64_t storeEnumTagSinglePayload for DaemonToShell.TwoWayMessage.Discriminant(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D78BC8 + 4 * byte_224D855D5[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_224D78BFC + 4 * byte_224D855D0[v4]))();
}

uint64_t sub_224D78BFC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D78C04(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D78C0CLL);
  return result;
}

uint64_t sub_224D78C18(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D78C20);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_224D78C24(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D78C2C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DaemonToShell.TwoWayMessage.Discriminant()
{
  return &type metadata for DaemonToShell.TwoWayMessage.Discriminant;
}

uint64_t storeEnumTagSinglePayload for DaemonToShell.TwoWayMessage.Key(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_224D78C94 + 4 * byte_224D855DF[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_224D78CC8 + 4 * byte_224D855DA[v4]))();
}

uint64_t sub_224D78CC8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D78CD0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x224D78CD8);
  return result;
}

uint64_t sub_224D78CE4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x224D78CECLL);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_224D78CF0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_224D78CF8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for DaemonToShell.TwoWayMessage.Key()
{
  return &type metadata for DaemonToShell.TwoWayMessage.Key;
}

unint64_t sub_224D78D18()
{
  unint64_t result;

  result = qword_2557D8530;
  if (!qword_2557D8530)
  {
    result = MEMORY[0x22768C914](&unk_224D8578C, &type metadata for DaemonToShell.TwoWayMessage.Key);
    atomic_store(result, (unint64_t *)&qword_2557D8530);
  }
  return result;
}

unint64_t sub_224D78D60()
{
  unint64_t result;

  result = qword_2557D8538;
  if (!qword_2557D8538)
  {
    result = MEMORY[0x22768C914](&unk_224D8582C, &type metadata for DaemonToShell.TwoWayMessage.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2557D8538);
  }
  return result;
}

unint64_t sub_224D78DA4()
{
  unint64_t result;

  result = qword_2557D8540;
  if (!qword_2557D8540)
  {
    result = MEMORY[0x22768C914](&unk_224D857B4, &type metadata for DaemonToShell.TwoWayMessage.Discriminant);
    atomic_store(result, (unint64_t *)&qword_2557D8540);
  }
  return result;
}

uint64_t sub_224D78DE8()
{
  unint64_t v0;

  v0 = sub_224D82834();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_224D78E30()
{
  unint64_t v0;

  v0 = sub_224D82834();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_224D78E78()
{
  uint64_t v0;
  uint64_t result;

  type metadata accessor for TransactionManager();
  v0 = swift_allocObject();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8608);
  result = sub_224D8257C();
  *(_QWORD *)(v0 + 16) = result;
  qword_2557D8550 = v0;
  return result;
}

uint64_t static TransactionManager.shared.getter()
{
  if (qword_2557D71E0 != -1)
    swift_once();
  return swift_retain();
}

uint64_t sub_224D78F1C()
{
  uint64_t *v0;
  uint64_t result;

  result = *v0;
  sub_224D7A800();
  return result;
}

uint64_t TransactionManager.currentState.getter()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8558);
  sub_224D82264();
  sub_224D79018();
  sub_224D8245C();
  return swift_release();
}

uint64_t sub_224D78FD8(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  sub_224D82258();
  return sub_224D79064(v1);
}

unint64_t sub_224D79018()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557D8560;
  if (!qword_2557D8560)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2557D8558);
    result = MEMORY[0x22768C914](MEMORY[0x24BE76C78], v1);
    atomic_store(result, (unint64_t *)&qword_2557D8560);
  }
  return result;
}

uint64_t sub_224D79064(uint64_t a1)
{
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t result;
  int64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int64_t v19;
  unint64_t v20;
  int64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;

  v26 = sub_224D82264();
  v25 = *(_QWORD *)(v26 - 8);
  MEMORY[0x24BDAC7A8](v26);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *(_QWORD *)(a1 + 64);
  v23 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & v4;
  v24 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v7)
    {
      v10 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v11 = v10 | (v9 << 6);
      goto LABEL_5;
    }
    v19 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v19 >= v24)
      return swift_release();
    v20 = *(_QWORD *)(v23 + 8 * v19);
    ++v9;
    if (!v20)
    {
      v9 = v19 + 1;
      if (v19 + 1 >= v24)
        return swift_release();
      v20 = *(_QWORD *)(v23 + 8 * v9);
      if (!v20)
      {
        v9 = v19 + 2;
        if (v19 + 2 >= v24)
          return swift_release();
        v20 = *(_QWORD *)(v23 + 8 * v9);
        if (!v20)
        {
          v9 = v19 + 3;
          if (v19 + 3 >= v24)
            return swift_release();
          v20 = *(_QWORD *)(v23 + 8 * v9);
          if (!v20)
            break;
        }
      }
    }
LABEL_22:
    v7 = (v20 - 1) & v20;
    v11 = __clz(__rbit64(v20)) + (v9 << 6);
LABEL_5:
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v11 + 8);
    v13 = *(_QWORD *)(a1 + 56) + 32 * v11;
    v14 = *(_QWORD *)(v13 + 8);
    v15 = *(_QWORD *)(v13 + 16);
    MEMORY[0x24BDAC7A8](result);
    *(&v22 - 6) = v16;
    *(&v22 - 5) = v12;
    *(&v22 - 4) = v17;
    *(&v22 - 3) = v14;
    *(&v22 - 2) = v15;
    *(&v22 - 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    sub_224D8224C();
    sub_224D82204();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v3, v26);
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
  }
  v21 = v19 + 4;
  if (v21 >= v24)
    return swift_release();
  v20 = *(_QWORD *)(v23 + 8 * v21);
  if (v20)
  {
    v9 = v21;
    goto LABEL_22;
  }
  while (1)
  {
    v9 = v21 + 1;
    if (__OFADD__(v21, 1))
      break;
    if (v9 >= v24)
      return swift_release();
    v20 = *(_QWORD *)(v23 + 8 * v9);
    ++v21;
    if (v20)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_224D792FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  int64_t v7;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;

  v2 = a1 + 64;
  v3 = 1 << *(_BYTE *)(a1 + 32);
  v4 = -1;
  if (v3 < 64)
    v4 = ~(-1 << v3);
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v12 = (unint64_t)(v3 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v7 = 0;
  if (!v5)
    goto LABEL_5;
LABEL_4:
  for (v5 &= v5 - 1; ; v5 = (v9 - 1) & v9)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    sub_224D79608();
    if (v1)
    {
      swift_release();
      swift_unknownObjectRelease();
      swift_bridgeObjectRelease();
      return swift_bridgeObjectRelease();
    }
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    result = swift_bridgeObjectRelease();
    if (v5)
      goto LABEL_4;
LABEL_5:
    if (__OFADD__(v7++, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v7 >= v12)
      return swift_release();
    v9 = *(_QWORD *)(v2 + 8 * v7);
    if (!v9)
    {
      v10 = v7 + 1;
      if (v7 + 1 >= v12)
        return swift_release();
      v9 = *(_QWORD *)(v2 + 8 * v10);
      if (v9)
        goto LABEL_14;
      v10 = v7 + 2;
      if (v7 + 2 >= v12)
        return swift_release();
      v9 = *(_QWORD *)(v2 + 8 * v10);
      if (v9)
        goto LABEL_14;
      v10 = v7 + 3;
      if (v7 + 3 >= v12)
        return swift_release();
      v9 = *(_QWORD *)(v2 + 8 * v10);
      if (v9)
      {
LABEL_14:
        v7 = v10;
        continue;
      }
      v11 = v7 + 4;
      if (v7 + 4 >= v12)
        return swift_release();
      v9 = *(_QWORD *)(v2 + 8 * v11);
      v7 += 4;
      if (!v9)
        break;
    }
LABEL_15:
    ;
  }
  while (1)
  {
    v7 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v7 >= v12)
      return swift_release();
    v9 = *(_QWORD *)(v2 + 8 * v7);
    ++v11;
    if (v9)
      goto LABEL_15;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t TransactionManager.debugDescription.getter()
{
  uint64_t v1;

  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8558);
  sub_224D79018();
  sub_224D8245C();
  swift_release();
  return v1;
}

uint64_t sub_224D795B4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  result = sub_224D792FC(*a1);
  *a2 = 0xD000000000000014;
  a2[1] = 0x8000000224D87140;
  return result;
}

uint64_t sub_224D79608()
{
  swift_bridgeObjectRetain();
  sub_224D8263C();
  sub_224D7A800();
  sub_224D8263C();
  swift_bridgeObjectRelease();
  sub_224D8263C();
  sub_224D8263C();
  return swift_bridgeObjectRelease();
}

uint64_t TransactionManager.takeTransaction(for:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t (*v21)();
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v26 = a3;
  v5 = sub_224D825B8();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D82588();
  swift_bridgeObjectRetain_n();
  v9 = sub_224D825A0();
  v10 = sub_224D82744();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = swift_slowAlloc();
    v24 = a1;
    v12 = (uint8_t *)v11;
    v13 = swift_slowAlloc();
    v28 = v13;
    *(_DWORD *)v12 = 136315138;
    swift_bridgeObjectRetain();
    v27 = sub_224D60EC8(v24, a2, &v28);
    sub_224D8278C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_224D58000, v9, v10, "Taking transaction for %s", v12, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22768C9BC](v13, -1, -1);
    v14 = v12;
    a1 = v24;
    MEMORY[0x22768C9BC](v14, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v15 = v25;
  v28 = *(_QWORD *)(v25 + 16);
  MEMORY[0x24BDAC7A8](v28);
  swift_retain();
  v16 = a1;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8558);
  v23 = sub_224D79018();
  v21 = (uint64_t (*)())v17;
  v22 = MEMORY[0x24BEE4AE0] + 8;
  v20 = (uint64_t)&v20;
  sub_224D82468();
  swift_release();
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = v16;
  v18[3] = a2;
  v18[4] = v15;
  swift_bridgeObjectRetain();
  swift_retain();
  v21 = sub_224D7A1DC;
  v22 = (uint64_t)v18;
  LOBYTE(v20) = 2;
  return sub_224D822F4();
}

uint64_t sub_224D799B4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint8_t *v43;
  uint64_t v44;
  char v45;
  uint8_t *v46;
  uint8_t *v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57[4];
  uint64_t v58;

  v6 = sub_224D825B8();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v46 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v46 - v11;
  v13 = *a1;
  if (*(_QWORD *)(*a1 + 16))
  {
    swift_bridgeObjectRetain();
    v14 = sub_224D819A4(a2, a3);
    if ((v15 & 1) != 0)
    {
      v51 = v7;
      v52 = v6;
      v16 = (uint64_t *)(*(_QWORD *)(v13 + 56) + 32 * v14);
      v17 = *v16;
      v18 = v16[1];
      v20 = v16[2];
      v19 = v16[3];
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      result = swift_bridgeObjectRelease();
      v57[0] = v17;
      v57[1] = v18;
      v57[2] = v20;
      if (__OFADD__(v19, 1))
      {
        __break(1u);
      }
      else
      {
        v57[3] = v19 + 1;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v56 = *a1;
        *a1 = 0x8000000000000000;
        sub_224D7ED88(v17, v18, v20, v19 + 1, a2, a3, isUniquelyReferenced_nonNull_native);
        *a1 = v56;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_224D82588();
        v23 = sub_224D825A0();
        v24 = sub_224D82744();
        if (os_log_type_enabled(v23, v24))
        {
          v25 = (uint8_t *)swift_slowAlloc();
          v54 = swift_slowAlloc();
          v58 = v54;
          *(_DWORD *)v25 = 136315138;
          v53 = v25 + 4;
          swift_beginAccess();
          v26 = v57[0];
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain();
          sub_224D7A800();
          v28 = v27;
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          v55 = sub_224D60EC8(v26, v28, &v58);
          sub_224D8278C();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_224D58000, v23, v24, "Transaction now %s", v25, 0xCu);
          v29 = v54;
          swift_arrayDestroy();
          MEMORY[0x22768C9BC](v29, -1, -1);
          MEMORY[0x22768C9BC](v25, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v51 + 8))(v10, v52);
        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }
      return result;
    }
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  v53 = (uint8_t *)a2;
  v30 = sub_224D7A8CC(a2);
  v32 = v31;
  v34 = v33;
  v54 = v35;
  sub_224D82588();
  swift_bridgeObjectRetain_n();
  swift_unknownObjectRetain_n();
  v36 = sub_224D825A0();
  v37 = sub_224D82744();
  v50 = v37;
  if (os_log_type_enabled(v36, v37))
  {
    v52 = v6;
    v38 = (uint8_t *)swift_slowAlloc();
    v48 = swift_slowAlloc();
    v57[0] = v48;
    v49 = v30;
    *(_DWORD *)v38 = 136315138;
    v46 = v38 + 4;
    v47 = v38;
    swift_bridgeObjectRetain();
    swift_unknownObjectRetain();
    v39 = v49;
    sub_224D7A800();
    v51 = v7;
    v40 = v39;
    v42 = v41;
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    v56 = sub_224D60EC8(v40, v42, v57);
    v30 = v49;
    sub_224D8278C();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    v43 = v47;
    _os_log_impl(&dword_224D58000, v36, (os_log_type_t)v50, "Transaction now %s", v47, 0xCu);
    v44 = v48;
    swift_arrayDestroy();
    MEMORY[0x22768C9BC](v44, -1, -1);
    MEMORY[0x22768C9BC](v43, -1, -1);

    (*(void (**)(char *, uint64_t))(v51 + 8))(v12, v52);
  }
  else
  {

    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, v6);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  v45 = swift_isUniquelyReferenced_nonNull_native();
  v57[0] = *a1;
  *a1 = 0x8000000000000000;
  sub_224D7ED88(v30, v32, v34, v54, (uint64_t)v53, a3, v45);
  *a1 = v57[0];
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_224D79F18(uint64_t *a1)
{
  uint64_t v1;

  return sub_224D799B4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_224D79F30(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[4];
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = sub_224D825B8();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D82588();
  swift_bridgeObjectRetain_n();
  v10 = sub_224D825A0();
  v11 = sub_224D82744();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v22 = a1;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc();
    v21 = a3;
    v15 = v14;
    v24 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    v23 = sub_224D60EC8(v22, a2, &v24);
    sub_224D8278C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_224D58000, v10, v11, "Cancelling transaction for %s", v13, 0xCu);
    swift_arrayDestroy();
    v16 = v15;
    a3 = v21;
    MEMORY[0x22768C9BC](v16, -1, -1);
    MEMORY[0x22768C9BC](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v24 = *(_QWORD *)(a3 + 16);
  MEMORY[0x24BDAC7A8](v24);
  swift_retain();
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8558);
  v19[3] = sub_224D79018();
  v19[1] = v17;
  v19[2] = MEMORY[0x24BEE4AE0] + 8;
  v19[0] = v19;
  sub_224D82468();
  return swift_release();
}

uint64_t sub_224D7A1B0()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D7A1DC()
{
  uint64_t v0;

  return sub_224D79F30(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32));
}

uint64_t sub_224D7A1E8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  int v22;
  uint64_t v23;
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];
  uint8_t *v38;
  int v39;
  uint64_t v40;
  os_log_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44[3];
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;

  v7 = sub_224D825B8();
  v8 = *(_QWORD *)(v7 - 8);
  result = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  if (*(_QWORD *)(*a1 + 16))
  {
    swift_bridgeObjectRetain();
    v13 = sub_224D819A4(a2, a3);
    if ((v14 & 1) != 0)
    {
      v42 = a2;
      v43 = v3;
      v15 = (uint64_t *)(*(_QWORD *)(v12 + 56) + 32 * v13);
      v17 = *v15;
      v16 = v15[1];
      v18 = v15[2];
      v19 = v15[3];
      swift_bridgeObjectRetain();
      swift_unknownObjectRetain();
      result = swift_bridgeObjectRelease();
      v45 = v17;
      v46 = v16;
      v47 = v18;
      if (__OFSUB__(v19, 1))
      {
        __break(1u);
      }
      else
      {
        v48 = v19 - 1;
        sub_224D82588();
        v20 = sub_224D825A0();
        v21 = sub_224D82744();
        v22 = v21;
        if (os_log_type_enabled(v20, v21))
        {
          v41 = v20;
          v23 = swift_slowAlloc();
          v39 = v22;
          v24 = (uint8_t *)v23;
          v40 = swift_slowAlloc();
          v44[0] = v40;
          *(_DWORD *)v24 = 136315138;
          v37[1] = v24 + 12;
          v38 = v24;
          v37[0] = v24 + 4;
          swift_beginAccess();
          v25 = v45;
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain();
          sub_224D7A800();
          v27 = v26;
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          v49 = sub_224D60EC8(v25, v27, v44);
          sub_224D8278C();
          swift_bridgeObjectRelease();
          v20 = v41;
          v28 = v38;
          _os_log_impl(&dword_224D58000, v41, (os_log_type_t)v39, "Transaction now %s", v38, 0xCu);
          v29 = v40;
          swift_arrayDestroy();
          MEMORY[0x22768C9BC](v29, -1, -1);
          MEMORY[0x22768C9BC](v28, -1, -1);
        }

        (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
        swift_beginAccess();
        v30 = v48;
        if (v48 < 1)
        {
          v35 = sub_224D7D084(v42, a3);
          sub_224D7A89C(v35, v36);
        }
        else
        {
          v31 = v45;
          v32 = v46;
          v33 = v47;
          swift_bridgeObjectRetain();
          swift_bridgeObjectRetain();
          swift_unknownObjectRetain();
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v49 = *a1;
          *a1 = 0x8000000000000000;
          sub_224D7ED88(v31, v32, v33, v30, v42, a3, isUniquelyReferenced_nonNull_native);
          *a1 = v49;
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
        return swift_unknownObjectRelease();
      }
    }
    else
    {
      return swift_bridgeObjectRelease();
    }
  }
  return result;
}

uint64_t TransactionManager.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t TransactionManager.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_224D7A564()
{
  uint64_t v1;

  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8558);
  sub_224D79018();
  sub_224D8245C();
  swift_release();
  return v1;
}

uint64_t type metadata accessor for TransactionManager()
{
  return objc_opt_self();
}

uint64_t method lookup function for TransactionManager()
{
  return swift_lookUpClassMethod();
}

uint64_t destroy for TransactionManager.Transaction()
{
  swift_bridgeObjectRelease();
  return swift_unknownObjectRelease();
}

_QWORD *initializeWithCopy for TransactionManager.Transaction(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for TransactionManager.Transaction(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[3] = a2[3];
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

uint64_t assignWithTake for TransactionManager.Transaction(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t getEnumTagSinglePayload for TransactionManager.Transaction(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TransactionManager.Transaction(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for TransactionManager.Transaction()
{
  return &type metadata for TransactionManager.Transaction;
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> sub_224D7A800()
{
  swift_bridgeObjectRetain();
  sub_224D8263C();
  sub_224D82840();
  sub_224D8263C();
  swift_bridgeObjectRelease();
  sub_224D8263C();
}

uint64_t sub_224D7A884(uint64_t *a1)
{
  uint64_t v1;

  return sub_224D7A1E8(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_224D7A89C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_224D7A8CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  swift_bridgeObjectRetain();
  sub_224D827D4();
  swift_bridgeObjectRelease();
  sub_224D8263C();
  swift_bridgeObjectRelease();
  sub_224D82624();
  swift_bridgeObjectRelease();
  v2 = os_transaction_create();
  result = swift_release();
  if (v2)
    return a1;
  __break(1u);
  return result;
}

uint64_t sub_224D7A998(_QWORD *a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v4 = v2[3];
  v5 = v2[4];
  *a1 = v2[2];
  a1[1] = v4;
  swift_bridgeObjectRetain();
  result = v5;
  sub_224D7A800();
  *a2 = v5;
  a2[1] = v7;
  return result;
}

uint64_t sub_224D7A9E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t *v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8750);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_224D821B0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_224D5BE98(a1, &qword_2557D8750);
    sub_224D7D228(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_224D5BE98((uint64_t)v10, &qword_2557D8750);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v18 = *v4;
    *v4 = 0x8000000000000000;
    sub_224D7F060((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_224D7AB5C(void (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t result;
  int64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  int64_t v24;
  void (*v25)(char *);

  v25 = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8720);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v23 - v10;
  v12 = *(_QWORD *)(a3 + 56);
  v23 = a3 + 56;
  v13 = 1 << *(_BYTE *)(a3 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & v12;
  v24 = (unint64_t)(v13 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v17 = 0;
  while (v15)
  {
    v18 = __clz(__rbit64(v15));
    v15 &= v15 - 1;
    v19 = v18 | (v17 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v6 + 16))(v11, *(_QWORD *)(a3 + 48) + *(_QWORD *)(v6 + 72) * v19, v5);
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v9, v11, v5);
    v25(v9);
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    if (v3)
      return swift_release();
  }
  if (__OFADD__(v17++, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v17 >= v24)
    return swift_release();
  v21 = *(_QWORD *)(v23 + 8 * v17);
  if (v21)
  {
LABEL_19:
    v15 = (v21 - 1) & v21;
    v19 = __clz(__rbit64(v21)) + (v17 << 6);
    goto LABEL_5;
  }
  v22 = v17 + 1;
  if (v17 + 1 >= v24)
    return swift_release();
  v21 = *(_QWORD *)(v23 + 8 * v22);
  if (v21)
    goto LABEL_18;
  v22 = v17 + 2;
  if (v17 + 2 >= v24)
    return swift_release();
  v21 = *(_QWORD *)(v23 + 8 * v22);
  if (v21)
    goto LABEL_18;
  v22 = v17 + 3;
  if (v17 + 3 >= v24)
    return swift_release();
  v21 = *(_QWORD *)(v23 + 8 * v22);
  if (v21)
    goto LABEL_18;
  v22 = v17 + 4;
  if (v17 + 4 >= v24)
    return swift_release();
  v21 = *(_QWORD *)(v23 + 8 * v22);
  if (v21)
  {
LABEL_18:
    v17 = v22;
    goto LABEL_19;
  }
  while (1)
  {
    v17 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v17 >= v24)
      return swift_release();
    v21 = *(_QWORD *)(v23 + 8 * v17);
    ++v22;
    if (v21)
      goto LABEL_19;
  }
LABEL_26:
  __break(1u);
  return result;
}

char *sub_224D7ADA4()
{
  id v0;
  uint64_t v1;
  char *result;

  if (qword_2557D71F0 != -1)
    swift_once();
  v0 = objc_allocWithZone((Class)type metadata accessor for CrashReportListener());
  v1 = swift_bridgeObjectRetain();
  result = sub_224D7AE98(v1);
  qword_2557D8610 = (uint64_t)result;
  return result;
}

id static CrashReportListener.default.getter()
{
  if (qword_2557D71E8 != -1)
    swift_once();
  return (id)qword_2557D8610;
}

double sub_224D7AE4C()
{
  uint64_t v0;
  double result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D87A8);
  v0 = swift_allocObject();
  *(_QWORD *)&result = 1;
  *(_OWORD *)(v0 + 16) = xmmword_224D859F0;
  *(_QWORD *)(v0 + 32) = 3747891;
  *(_QWORD *)(v0 + 40) = 0xE300000000000000;
  qword_2557D8618 = v0;
  return result;
}

char *sub_224D7AE98(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (**v12)(uint64_t, uint64_t, uint64_t);
  objc_super v14;
  objc_super v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_state;
  v16 = 0;
  v17 = MEMORY[0x24BEE4B00];
  v18 = MEMORY[0x24BEE4B00];
  v19 = MEMORY[0x24BEE4B00];
  v5 = v1;
  *(_QWORD *)&v1[v4] = sub_224D8257C();
  *(_QWORD *)&v5[OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_types] = a1;
  v6 = (objc_class *)type metadata accessor for CrashReportListener.ObserverProxy();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR____TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy_diagnosticsLogHandler];
  *(_QWORD *)v8 = nullsub_1;
  *((_QWORD *)v8 + 1) = 0;
  v15.receiver = v7;
  v15.super_class = v6;
  *(_QWORD *)&v5[OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_observerProxy] = objc_msgSendSuper2(&v15, sel_init);

  v14.receiver = v5;
  v14.super_class = ObjectType;
  v9 = (char *)objc_msgSendSuper2(&v14, sel_init);
  v10 = *(_QWORD *)&v9[OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_observerProxy];
  v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v12 = (void (**)(uint64_t, uint64_t, uint64_t))(v10
                                                        + OBJC_IVAR____TtCC17PreviewsOSSupport19CrashReportListener13ObserverProxy_diagnosticsLogHandler);
  *v12 = sub_224D81030;
  v12[1] = (void (*)(uint64_t, uint64_t, uint64_t))v11;
  swift_release();
  return v9;
}

void sub_224D7AFC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = a4 + 16;
  swift_beginAccess();
  v5 = MEMORY[0x22768CA58](v4);
  if (v5)
  {
    v6 = (void *)v5;
    sub_224D81038();

  }
}

Swift::Void __swiftcall CrashReportListener.startListeningIfNeeded()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v1 = v0;
  swift_retain();
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8640);
  v13 = sub_224D5C9C0(&qword_2557D8648, &qword_2557D8640, MEMORY[0x24BE76C78]);
  v11 = v2;
  v12 = MEMORY[0x24BEE1328];
  LOBYTE(v10) = 2;
  sub_224D82468();
  swift_release();
  if (v14 == 1)
  {
    if (qword_2557D71F8 != -1)
      swift_once();
    v3 = sub_224D825B8();
    __swift_project_value_buffer(v3, (uint64_t)qword_2557D8620);
    v4 = sub_224D825A0();
    v5 = sub_224D8275C();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_224D58000, v4, v5, "Request to start monitoring", v6, 2u);
      MEMORY[0x22768C9BC](v6, -1, -1);
    }

    v7 = objc_msgSend((id)objc_opt_self(), sel_sharedClient, v10, sub_224D7B228, 0, v11, v12, v13);
    v8 = *(id *)(v1 + OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_observerProxy);
    v9 = (void *)sub_224D82654();
    objc_msgSend(v7, sel_addObserver_forTypes_, v8, v9);

  }
}

_BYTE *sub_224D7B228@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  if ((*result & 1) != 0)
  {
    *a2 = 0;
  }
  else
  {
    *result = 1;
    *a2 = 1;
  }
  return result;
}

uint64_t sub_224D7B248@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  swift_bridgeObjectRetain();
  sub_224D82180();
  v2 = sub_224D821B0();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 0, 1, v2);
}

uint64_t sub_224D7B47C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X8>)
{
  unint64_t v10;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v22;
  char v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;

  if ((a3 & 1) == 0)
  {
    if (*(_QWORD *)(a5 + 16))
    {
      v10 = sub_224D81A08(a1);
      if ((v11 & 1) != 0)
      {
        if (*(_QWORD *)(a4 + 16))
        {
          v12 = (uint64_t *)(*(_QWORD *)(a5 + 56) + 16 * v10);
          v13 = *v12;
          v14 = v12[1];
          swift_bridgeObjectRetain();
          v15 = sub_224D819A4(v13, v14);
          if ((v16 & 1) != 0)
          {
            v17 = v15;
            v18 = *(_QWORD *)(a4 + 56);
            v19 = sub_224D821B0();
            v20 = *(_QWORD *)(v19 - 8);
            (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 16))(a6, v18 + *(_QWORD *)(v20 + 72) * v17, v19);
            (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v20 + 56))(a6, 0, 1, v19);
          }
          else
          {
            v31 = sub_224D821B0();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(a6, 1, 1, v31);
          }
          return swift_bridgeObjectRelease();
        }
      }
    }
LABEL_10:
    v28 = sub_224D821B0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(a6, 1, 1, v28);
  }
  if (!*(_QWORD *)(a4 + 16))
    goto LABEL_10;
  swift_bridgeObjectRetain();
  v22 = sub_224D819A4(a1, a2);
  if ((v23 & 1) != 0)
  {
    v24 = v22;
    v25 = *(_QWORD *)(a4 + 56);
    v26 = sub_224D821B0();
    v27 = *(_QWORD *)(v26 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v27 + 16))(a6, v25 + *(_QWORD *)(v27 + 72) * v24, v26);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v27 + 56))(a6, 0, 1, v26);
  }
  else
  {
    v30 = sub_224D821B0();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(a6, 1, 1, v30);
  }
  return sub_224D7CB0C(a1, a2, 1);
}

uint64_t sub_224D7B664(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  uint64_t v11;
  char *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8720);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x24BDAC7A8](v4);
  v9 = (char *)&v24 - v8;
  result = MEMORY[0x24BDAC7A8](v7);
  v12 = (char *)&v24 - v11;
  v13 = 0;
  v14 = *(_QWORD *)(a1 + 56);
  v25 = a1 + 56;
  v15 = 1 << *(_BYTE *)(a1 + 32);
  v16 = -1;
  if (v15 < 64)
    v16 = ~(-1 << v15);
  v17 = v16 & v14;
  v18 = (unint64_t)(v15 + 63) >> 6;
  while (1)
  {
    if (v17)
    {
      v19 = __clz(__rbit64(v17));
      v17 &= v17 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_5;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
      __break(1u);
      goto LABEL_25;
    }
    if (v21 >= v18)
      return swift_release();
    v22 = *(_QWORD *)(v25 + 8 * v21);
    ++v13;
    if (!v22)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v18)
        return swift_release();
      v22 = *(_QWORD *)(v25 + 8 * v13);
      if (!v22)
      {
        v13 = v21 + 2;
        if (v21 + 2 >= v18)
          return swift_release();
        v22 = *(_QWORD *)(v25 + 8 * v13);
        if (!v22)
        {
          v13 = v21 + 3;
          if (v21 + 3 >= v18)
            return swift_release();
          v22 = *(_QWORD *)(v25 + 8 * v13);
          if (!v22)
            break;
        }
      }
    }
LABEL_22:
    v17 = (v22 - 1) & v22;
    v20 = __clz(__rbit64(v22)) + (v13 << 6);
LABEL_5:
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v12, *(_QWORD *)(a1 + 48) + *(_QWORD *)(v3 + 72) * v20, v2);
    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v12, v2);
    sub_224D7FD90((uint64_t)v9, v6);
    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v9, v2);
  }
  v23 = v21 + 4;
  if (v23 >= v18)
    return swift_release();
  v22 = *(_QWORD *)(v25 + 8 * v23);
  if (v22)
  {
    v13 = v23;
    goto LABEL_22;
  }
  while (1)
  {
    v13 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v13 >= v18)
      return swift_release();
    v22 = *(_QWORD *)(v25 + 8 * v13);
    ++v23;
    if (v22)
      goto LABEL_22;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_224D7B88C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v21;
  unint64_t v22;
  char v23;
  void (*v24)(uint64_t, _QWORD, uint64_t, uint64_t);
  char *v25;
  uint64_t v26;
  char *v27;
  char v28;
  void (*v29)(char *, uint64_t);
  char *v30;
  uint64_t v31;
  unsigned int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(char *, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char isUniquelyReferenced_nonNull_native;
  uint64_t result;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v47;
  char *v48;
  uint64_t *v49;
  uint64_t v50;

  v49 = a3;
  v5 = sub_224D81F64();
  v44 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  v6 = MEMORY[0x24BDAC7A8](v5);
  v43 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v43 - v8;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8750);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v48 = (char *)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v43 - v13;
  v15 = sub_224D821B0();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_224D82198();
  v21 = *(_QWORD *)(a1 + 8);
  v47 = a1 + 8;
  if (*(_QWORD *)(v21 + 16) && (v22 = sub_224D819A4(v19, v20), (v23 & 1) != 0))
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v16 + 16))(v14, *(_QWORD *)(v21 + 56) + *(_QWORD *)(v16 + 72) * v22, v15);
    v24 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v16 + 56);
    v25 = v14;
    v26 = 0;
  }
  else
  {
    v24 = *(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v16 + 56);
    v25 = v14;
    v26 = 1;
  }
  v46 = v24;
  v24((uint64_t)v25, v26, 1, v15);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_224D5BE98((uint64_t)v14, &qword_2557D8750);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    sub_224D821A4();
    v27 = v43;
    sub_224D821A4();
    v28 = sub_224D81F4C();
    v29 = *(void (**)(char *, uint64_t))(v44 + 8);
    v30 = v27;
    v31 = v45;
    v29(v30, v45);
    v29(v9, v31);
    if ((v28 & 1) == 0)
    {
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      result = MEMORY[0x24BEE4B08];
      goto LABEL_11;
    }
    v32 = sub_224D8218C();
    sub_224D7D180(v32);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  v33 = sub_224D82198();
  v35 = v34;
  v36 = *(void (**)(char *, uint64_t, uint64_t))(v16 + 16);
  v37 = (uint64_t)v48;
  v36(v48, a2, v15);
  v46(v37, 0, 1, v15);
  sub_224D7A9E8(v37, v33, v35);
  LODWORD(v33) = sub_224D8218C();
  v38 = sub_224D82198();
  v40 = v39;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v50 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = 0x8000000000000000;
  sub_224D7EF24(v38, v40, v33, isUniquelyReferenced_nonNull_native);
  *(_QWORD *)(a1 + 16) = v50;
  swift_bridgeObjectRelease();
  result = sub_224D81550(a2, a1);
LABEL_11:
  *v49 = result;
  return result;
}

uint64_t sub_224D7BBDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v8;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8788);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8720);
  sub_224D8248C();
  v6 = sub_224D821B0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v5, a2, v6);
  swift_storeEnumTagMultiPayload();
  sub_224D824E0();
  swift_release();
  return sub_224D5BE98((uint64_t)v5, &qword_2557D8788);
}

id CrashReportListener.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void CrashReportListener.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t CrashReportListener.nextCrashReport(for:timeout:)(uint64_t a1, uint64_t a2, char a3)
{
  char *v3;
  uint64_t ObjectType;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v29;
  uint64_t (*v30)@<X0>(uint64_t *@<X0>, uint64_t *@<X8>);
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  ObjectType = swift_getObjectType();
  v8 = a3 & 1;
  v9 = sub_224D81F64();
  v37 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v38 = v3;
  v39 = (char *)v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  CrashReportListener.startListeningIfNeeded()();
  if (qword_2557D71F8 != -1)
    swift_once();
  v11 = sub_224D825B8();
  __swift_project_value_buffer(v11, (uint64_t)qword_2557D8620);
  sub_224D7CAFC(a1, a2, a3 & 1);
  sub_224D7CAFC(a1, a2, a3 & 1);
  v12 = sub_224D825A0();
  v13 = sub_224D82744();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v15 = swift_slowAlloc();
    v35[1] = ObjectType;
    v16 = v15;
    v41 = v15;
    v36 = v9;
    *(_DWORD *)v14 = 136315138;
    v35[0] = v14 + 4;
    sub_224D7CAFC(a1, a2, v8);
    v17 = sub_224D820CC();
    v19 = v18;
    sub_224D7CB0C(a1, a2, v8);
    v40 = sub_224D60EC8(v17, v19, &v41);
    v9 = v36;
    sub_224D8278C();
    swift_bridgeObjectRelease();
    sub_224D7CB0C(a1, a2, v8);
    sub_224D7CB0C(a1, a2, v8);
    _os_log_impl(&dword_224D58000, v12, v13, "Requested next crash for: %s", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x22768C9BC](v16, -1, -1);
    MEMORY[0x22768C9BC](v14, -1, -1);
  }
  else
  {
    sub_224D7CB0C(a1, a2, a3 & 1);
    sub_224D7CB0C(a1, a2, a3 & 1);
  }

  sub_224D81F58();
  v20 = v38;
  v40 = *(_QWORD *)&v38[OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_state];
  MEMORY[0x24BDAC7A8](v40);
  v35[-8] = v20;
  v35[-7] = a1;
  v29 = a2;
  swift_retain();
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8640);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8660);
  v23 = sub_224D5C9C0(&qword_2557D8648, &qword_2557D8640, MEMORY[0x24BE76C78]);
  v33 = v22;
  v34 = v23;
  v31 = &v35[-10];
  v32 = v21;
  v30 = sub_224D7CB1C;
  LOBYTE(v29) = 2;
  sub_224D82468();
  swift_release();
  v24 = v41;
  v25 = v42;
  if (v42)
  {
    v26 = swift_allocObject();
    *(_QWORD *)(v26 + 16) = v20;
    *(_QWORD *)(v26 + 24) = a1;
    *(_QWORD *)(v26 + 32) = a2;
    *(_BYTE *)(v26 + 40) = v8 != 0;
    *(_QWORD *)(v26 + 48) = v25;
    sub_224D7CAFC(a1, a2, v8);
    swift_retain();
    v27 = v20;
    sub_224D824A4();
    swift_release();
    swift_release();
  }
  (*(void (**)(char *, uint64_t))(v37 + 8))(v39, v9);
  return v24;
}

uint64_t sub_224D7C1A0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t result;
  uint64_t *v32;
  char v33;
  BOOL v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  BOOL v59;
  uint64_t v60;

  v56 = a7;
  v48 = a6;
  v55 = a2;
  v10 = a5 & 1;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8720);
  v51 = *(_QWORD *)(v11 - 8);
  v52 = v11;
  v12 = MEMORY[0x24BDAC7A8](v11);
  v50 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v49 = (uint64_t)&v45 - v14;
  v15 = sub_224D81F64();
  v46 = *(_QWORD *)(v15 - 8);
  v47 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v45 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8750);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_224D821B0();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v45 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = a1[1];
  v26 = a1[2];
  v27 = a1 + 3;
  v53 = a3;
  v54 = a4;
  sub_224D7B47C(a3, a4, v10, v25, v26, (uint64_t)v20);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    sub_224D5BE98((uint64_t)v20, &qword_2557D8750);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v24, v20, v21);
    sub_224D821A4();
    sub_224D81F40();
    v29 = v28;
    (*(void (**)(char *, uint64_t))(v46 + 8))(v17, v47);
    if (v29 < 1.0)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8758);
      v30 = sub_224D824D4();
      result = (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v24, v21);
      v32 = v56;
      *v56 = v30;
      v32[1] = 0;
      return result;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  }
  v33 = v10;
  v34 = v10 != 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8758);
  v55 = sub_224D824B0();
  v36 = v35;
  v38 = v53;
  v37 = v54;
  v57 = v53;
  v58 = v54;
  v59 = v34;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8760);
  sub_224D5C9C0(&qword_2557D8768, &qword_2557D8760, MEMORY[0x24BE76CA0]);
  sub_224D821BC();
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8770);
  v39 = v50;
  sub_224D82498();
  v40 = v49;
  sub_224D7FD90(v49, v39);
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v40, v52);
  v41 = v60;
  sub_224D7CAFC(v38, v37, v33);
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v57 = *v27;
  *v27 = 0x8000000000000000;
  sub_224D7F19C(v41, v38, v37, v33, isUniquelyReferenced_nonNull_native);
  *v27 = v57;
  swift_bridgeObjectRelease();
  sub_224D7CB0C(v38, v37, v33);
  sub_224D824BC();
  v43 = sub_224D824C8();
  swift_release();
  result = swift_release();
  v44 = v56;
  *v56 = v43;
  v44[1] = v36;
  return result;
}

void sub_224D7C634(_QWORD *a1@<X8>)
{
  *a1 = MEMORY[0x24BEE4B08];
}

uint64_t sub_224D7C644()
{
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8640);
  sub_224D5C9C0(&qword_2557D8648, &qword_2557D8640, MEMORY[0x24BE76C78]);
  sub_224D82468();
  return swift_release();
}

uint64_t sub_224D7C728(uint64_t a1, uint64_t a2, uint64_t a3, char a4, uint64_t *a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v23 = *a5;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8720);
  v9 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8728);
  result = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *(_QWORD *)(a1 + 24);
  if (*(_QWORD *)(v16 + 16))
  {
    v17 = a4 & 1;
    sub_224D7CAFC(a2, a3, v17);
    v18 = sub_224D81A3C(a2, a3, v17);
    if ((v19 & 1) != 0)
    {
      v20 = *(_QWORD *)(*(_QWORD *)(v16 + 56) + 8 * v18);
      swift_bridgeObjectRetain();
      sub_224D7CB0C(a2, a3, v17);
      v26 = v20;
      swift_retain();
      sub_224D82498();
      sub_224D80AC0((uint64_t)v11, (uint64_t)v15);
      (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v24);
      sub_224D5BE98((uint64_t)v15, &qword_2557D8728);
      v21 = v26;
      sub_224D7CAFC(a2, a3, v17);
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v25 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 24) = 0x8000000000000000;
      sub_224D7F19C(v21, a2, a3, v17, isUniquelyReferenced_nonNull_native);
      *(_QWORD *)(a1 + 24) = v25;
      swift_bridgeObjectRelease();
    }
    return sub_224D7CB0C(a2, a3, v17);
  }
  return result;
}

uint64_t sub_224D7CA08()
{
  uint64_t v0;

  v0 = sub_224D825B8();
  __swift_allocate_value_buffer(v0, qword_2557D8620);
  __swift_project_value_buffer(v0, (uint64_t)qword_2557D8620);
  sub_224D82774();
  return sub_224D825AC();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static Logger.osaListener.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_2557D71F8 != -1)
    swift_once();
  v2 = sub_224D825B8();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_2557D8620);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_224D7CAFC(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_224D7CB0C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_224D7CB1C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_224D7C1A0(a1, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_BYTE *)(v2 + 40), *(_QWORD *)(v2 + 48), a2);
}

uint64_t sub_224D7CB48()
{
  uint64_t v0;

  sub_224D7CB0C(*(_QWORD *)(v0 + 24), *(_QWORD *)(v0 + 32), *(_BYTE *)(v0 + 40));
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_224D7CB80()
{
  return sub_224D7C644();
}

uint64_t sub_224D7CB94()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v0 = sub_224D8227C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_224D82270();
  sub_224D80F84();
  v4 = swift_allocError();
  (*(void (**)(uint64_t, char *, uint64_t))(v1 + 32))(v5, v3, v0);
  return v4;
}

uint64_t sub_224D7CC3C@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

void *sub_224D7CC64(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_224D82828();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t type metadata accessor for CrashReportListener()
{
  return objc_opt_self();
}

uint64_t method lookup function for CrashReportListener()
{
  return swift_lookUpClassMethod();
}

uint64_t type metadata accessor for CrashReportListener.ObserverProxy()
{
  return objc_opt_self();
}

uint64_t destroy for CrashReportListener.ObserverProxy.DiagnosticsLog()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *_s17PreviewsOSSupport19CrashReportListenerC13ObserverProxyC14DiagnosticsLogVwCP_0(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for CrashReportListener.ObserverProxy.DiagnosticsLog(_QWORD *a1, _QWORD *a2)
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

uint64_t assignWithTake for CrashReportListener.ObserverProxy.DiagnosticsLog(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for CrashReportListener.ObserverProxy.DiagnosticsLog(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for CrashReportListener.ObserverProxy.DiagnosticsLog(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for CrashReportListener.ObserverProxy.DiagnosticsLog()
{
  return &type metadata for CrashReportListener.ObserverProxy.DiagnosticsLog;
}

uint64_t destroy for CrashReportListener.State()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for CrashReportListener.State(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for CrashReportListener.State(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for CrashReportListener.State(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  return a1;
}

ValueMetadata *type metadata accessor for CrashReportListener.State()
{
  return &type metadata for CrashReportListener.State;
}

uint64_t sub_224D7D064(uint64_t a1)
{
  uint64_t v1;

  return sub_224D7C728(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32), *(uint64_t **)(v1 + 40));
}

uint64_t sub_224D7D084(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_224D819A4(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_224D7F5E0();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6);
  sub_224D7E4B4(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_224D7D180(unsigned int a1)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v3;
  char v4;
  unint64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = v1;
  v3 = sub_224D81A08(a1);
  if ((v4 & 1) == 0)
    return 0;
  v5 = v3;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v7 = *v1;
  v10 = *v2;
  *v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_224D7F988();
    v7 = v10;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v5);
  sub_224D7E8D8(v5, v7);
  *v2 = v7;
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_224D7D228@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_224D819A4(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v17 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_224D7FB34();
      v11 = v17;
    }
    swift_bridgeObjectRelease();
    v12 = *(_QWORD *)(v11 + 56);
    v13 = sub_224D821B0();
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v14 + 32))(a3, v12 + *(_QWORD *)(v14 + 72) * v8, v13);
    sub_224D7EA70(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a3, 0, 1, v13);
  }
  else
  {
    v16 = sub_224D821B0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(a3, 1, 1, v16);
  }
}

uint64_t sub_224D7D358(uint64_t a1, char a2)
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
  _QWORD *v18;
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
  int v29;
  char v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D87B8);
  v38 = a2;
  result = sub_224D8281C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v37 = (_QWORD *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v36 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
    while (1)
    {
      if (v11)
      {
        v19 = __clz(__rbit64(v11));
        v11 &= v11 - 1;
        v20 = v19 | (v8 << 6);
      }
      else
      {
        v21 = v8 + 1;
        if (__OFADD__(v8, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v21 >= v36)
          goto LABEL_33;
        v22 = v37[v21];
        ++v8;
        if (!v22)
        {
          v8 = v21 + 1;
          if (v21 + 1 >= v36)
            goto LABEL_33;
          v22 = v37[v8];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v36)
            {
LABEL_33:
              if ((v38 & 1) == 0)
              {
                result = swift_release();
                v3 = v2;
                goto LABEL_40;
              }
              v35 = 1 << *(_BYTE *)(v5 + 32);
              if (v35 >= 64)
                bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
              else
                *v37 = -1 << v35;
              v3 = v2;
              *(_QWORD *)(v5 + 16) = 0;
              break;
            }
            v22 = v37[v23];
            if (!v22)
            {
              while (1)
              {
                v8 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_42;
                if (v8 >= v36)
                  goto LABEL_33;
                v22 = v37[v8];
                ++v23;
                if (v22)
                  goto LABEL_30;
              }
            }
            v8 = v23;
          }
        }
LABEL_30:
        v11 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v8 << 6);
      }
      v28 = *(_QWORD *)(v5 + 48) + 8 * v20;
      v29 = *(_DWORD *)v28;
      v30 = *(_BYTE *)(v28 + 4);
      v31 = *(_QWORD *)(v5 + 56) + 16 * v20;
      v33 = *(void **)v31;
      v32 = *(_QWORD *)(v31 + 8);
      if ((v38 & 1) == 0)
        v34 = v33;
      sub_224D828E8();
      sub_224D82900();
      sub_224D828F4();
      result = sub_224D8290C();
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
      v17 = *(_QWORD *)(v7 + 48) + 8 * v16;
      *(_DWORD *)v17 = v29;
      *(_BYTE *)(v17 + 4) = v30;
      v18 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v16);
      *v18 = v33;
      v18[1] = v32;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
LABEL_40:
  *v3 = v7;
  return result;
}

uint64_t sub_224D7D658(uint64_t a1, char a2)
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
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int64_t v36;
  _QWORD *v37;
  char v38;
  __int128 v39;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D87B0);
  v38 = a2;
  v6 = sub_224D8281C();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v37 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v36 = (unint64_t)(v8 + 63) >> 6;
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
      }
      else
      {
        v22 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_39:
          __break(1u);
LABEL_40:
          __break(1u);
          return result;
        }
        if (v22 >= v36)
          goto LABEL_33;
        v23 = v37[v22];
        ++v13;
        if (!v23)
        {
          v13 = v22 + 1;
          if (v22 + 1 >= v36)
            goto LABEL_33;
          v23 = v37[v13];
          if (!v23)
          {
            v24 = v22 + 2;
            if (v24 >= v36)
            {
LABEL_33:
              swift_release();
              v3 = v2;
              if ((v38 & 1) != 0)
              {
                v35 = 1 << *(_BYTE *)(v5 + 32);
                if (v35 >= 64)
                  bzero(v37, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v37 = -1 << v35;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v23 = v37[v24];
            if (!v23)
            {
              while (1)
              {
                v13 = v24 + 1;
                if (__OFADD__(v24, 1))
                  goto LABEL_40;
                if (v13 >= v36)
                  goto LABEL_33;
                v23 = v37[v13];
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
        v21 = __clz(__rbit64(v23)) + (v13 << 6);
      }
      v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
      v31 = *v29;
      v30 = v29[1];
      v32 = *(_QWORD *)(v5 + 56) + 32 * v21;
      v33 = *(_QWORD *)v32;
      v39 = *(_OWORD *)(v32 + 8);
      v34 = *(_QWORD *)(v32 + 24);
      if ((v38 & 1) == 0)
      {
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_unknownObjectRetain();
      }
      sub_224D828E8();
      sub_224D82630();
      result = sub_224D8290C();
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
            goto LABEL_39;
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
      v19 = *(_QWORD *)(v7 + 56) + 32 * v17;
      *(_QWORD *)v19 = v33;
      *(_OWORD *)(v19 + 8) = v39;
      *(_QWORD *)(v19 + 24) = v34;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_224D7D988(uint64_t a1, char a2)
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
  uint64_t v18;
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
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8730);
  v38 = a2;
  v6 = sub_224D8281C();
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
    v29 = *(_QWORD *)(v5 + 48) + 24 * v20;
    v31 = *(_QWORD *)v29;
    v30 = *(_QWORD *)(v29 + 8);
    v32 = *(_BYTE *)(v29 + 16);
    v33 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      sub_224D7CAFC(*(_QWORD *)v29, *(_QWORD *)(v29 + 8), *(_BYTE *)(v29 + 16));
      swift_bridgeObjectRetain();
    }
    sub_224D828E8();
    sub_224D820E4();
    result = sub_224D8290C();
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
    v18 = *(_QWORD *)(v7 + 48) + 24 * v17;
    *(_QWORD *)v18 = v31;
    *(_QWORD *)(v18 + 8) = v30;
    *(_BYTE *)(v18 + 16) = v32;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v33;
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

uint64_t sub_224D7DCB8(uint64_t a1, char a2)
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
  _QWORD *v17;
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
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t *v34;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8790);
  result = sub_224D8281C();
  v7 = result;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 0;
    v34 = (uint64_t *)(v5 + 64);
    v9 = 1 << *(_BYTE *)(v5 + 32);
    v31 = -1 << v9;
    v32 = v9;
    if (v9 < 64)
      v10 = ~(-1 << v9);
    else
      v10 = -1;
    v11 = v10 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v9 + 63) >> 6;
    v12 = result + 64;
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
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        result = v5 + 64;
        if (v20 >= v33)
          goto LABEL_33;
        v21 = v34[v20];
        ++v8;
        if (!v21)
        {
          v8 = v20 + 1;
          if (v20 + 1 >= v33)
            goto LABEL_33;
          v21 = v34[v8];
          if (!v21)
          {
            v22 = v20 + 2;
            if (v22 >= v33)
            {
LABEL_33:
              if ((a2 & 1) != 0)
              {
                if (v32 >= 64)
                  bzero(v34, 8 * v33);
                else
                  *v34 = v31;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v21 = v34[v22];
            if (!v21)
            {
              while (1)
              {
                v8 = v22 + 1;
                if (__OFADD__(v22, 1))
                  goto LABEL_41;
                if (v8 >= v33)
                  goto LABEL_33;
                v21 = v34[v8];
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
      v27 = *(unsigned int *)(*(_QWORD *)(v5 + 48) + 4 * v19);
      v28 = (uint64_t *)(*(_QWORD *)(v5 + 56) + 16 * v19);
      v29 = *v28;
      v30 = v28[1];
      if ((a2 & 1) == 0)
        swift_bridgeObjectRetain();
      result = MEMORY[0x22768C4C4](*(_QWORD *)(v7 + 40), v27, 4);
      v13 = -1 << *(_BYTE *)(v7 + 32);
      v14 = result & ~v13;
      v15 = v14 >> 6;
      if (((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6))) != 0)
      {
        v16 = __clz(__rbit64((-1 << v14) & ~*(_QWORD *)(v12 + 8 * (v14 >> 6)))) | v14 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v13) >> 6;
        do
        {
          if (++v15 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v25 = v15 == v24;
          if (v15 == v24)
            v15 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v12 + 8 * v15);
        }
        while (v26 == -1);
        v16 = __clz(__rbit64(~v26)) + (v15 << 6);
      }
      *(_QWORD *)(v12 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      *(_DWORD *)(*(_QWORD *)(v7 + 48) + 4 * v16) = v27;
      v17 = (_QWORD *)(*(_QWORD *)(v7 + 56) + 16 * v16);
      *v17 = v29;
      v17[1] = v30;
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_224D7DF70(uint64_t a1, int a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  int64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char v34;
  unint64_t v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  int64_t v41;
  _QWORD *v42;
  int v43;
  char *v44;
  uint64_t v45;

  v3 = v2;
  v45 = sub_224D821B0();
  v5 = *(_QWORD *)(v45 - 8);
  MEMORY[0x24BDAC7A8](v45);
  v44 = (char *)&v39 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D8798);
  v43 = a2;
  v8 = sub_224D8281C();
  v9 = v8;
  if (*(_QWORD *)(v7 + 16))
  {
    v40 = v2;
    v10 = 1 << *(_BYTE *)(v7 + 32);
    v11 = *(_QWORD *)(v7 + 64);
    v42 = (_QWORD *)(v7 + 64);
    if (v10 < 64)
      v12 = ~(-1 << v10);
    else
      v12 = -1;
    v13 = v12 & v11;
    v41 = (unint64_t)(v10 + 63) >> 6;
    v14 = v8 + 64;
    result = swift_retain();
    v16 = 0;
    while (1)
    {
      if (v13)
      {
        v19 = __clz(__rbit64(v13));
        v13 &= v13 - 1;
        v20 = v19 | (v16 << 6);
      }
      else
      {
        v21 = v16 + 1;
        if (__OFADD__(v16, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v21 >= v41)
          goto LABEL_34;
        v22 = v42[v21];
        ++v16;
        if (!v22)
        {
          v16 = v21 + 1;
          if (v21 + 1 >= v41)
            goto LABEL_34;
          v22 = v42[v16];
          if (!v22)
          {
            v23 = v21 + 2;
            if (v23 >= v41)
            {
LABEL_34:
              swift_release();
              v3 = v40;
              if ((v43 & 1) != 0)
              {
                v38 = 1 << *(_BYTE *)(v7 + 32);
                if (v38 >= 64)
                  bzero(v42, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v42 = -1 << v38;
                *(_QWORD *)(v7 + 16) = 0;
              }
              break;
            }
            v22 = v42[v23];
            if (!v22)
            {
              while (1)
              {
                v16 = v23 + 1;
                if (__OFADD__(v23, 1))
                  goto LABEL_41;
                if (v16 >= v41)
                  goto LABEL_34;
                v22 = v42[v16];
                ++v23;
                if (v22)
                  goto LABEL_21;
              }
            }
            v16 = v23;
          }
        }
LABEL_21:
        v13 = (v22 - 1) & v22;
        v20 = __clz(__rbit64(v22)) + (v16 << 6);
      }
      v24 = *(_QWORD *)(v7 + 56);
      v25 = v7;
      v26 = (uint64_t *)(*(_QWORD *)(v7 + 48) + 16 * v20);
      v28 = *v26;
      v27 = v26[1];
      v29 = *(_QWORD *)(v5 + 72);
      v30 = v24 + v29 * v20;
      if ((v43 & 1) != 0)
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 32))(v44, v30, v45);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v44, v30, v45);
        swift_bridgeObjectRetain();
      }
      sub_224D828E8();
      sub_224D82630();
      result = sub_224D8290C();
      v31 = -1 << *(_BYTE *)(v9 + 32);
      v32 = result & ~v31;
      v33 = v32 >> 6;
      if (((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6))) != 0)
      {
        v17 = __clz(__rbit64((-1 << v32) & ~*(_QWORD *)(v14 + 8 * (v32 >> 6)))) | v32 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v34 = 0;
        v35 = (unint64_t)(63 - v31) >> 6;
        do
        {
          if (++v33 == v35 && (v34 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v36 = v33 == v35;
          if (v33 == v35)
            v33 = 0;
          v34 |= v36;
          v37 = *(_QWORD *)(v14 + 8 * v33);
        }
        while (v37 == -1);
        v17 = __clz(__rbit64(~v37)) + (v33 << 6);
      }
      *(_QWORD *)(v14 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
      v18 = (_QWORD *)(*(_QWORD *)(v9 + 48) + 16 * v17);
      *v18 = v28;
      v18[1] = v27;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v5 + 32))(*(_QWORD *)(v9 + 56) + v29 * v17, v44, v45);
      ++*(_QWORD *)(v9 + 16);
      v7 = v25;
    }
  }
  result = swift_release();
  *v3 = v9;
  return result;
}

unint64_t sub_224D7E2D8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_224D827B0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = 8 * v6;
        sub_224D828E8();
        sub_224D82900();
        sub_224D828F4();
        result = sub_224D8290C();
        v10 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_QWORD *)(v11 + 8 * v3);
          v13 = (_QWORD *)(v11 + v9);
          if (8 * v3 != v9 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_224D7E4B4(unint64_t result, uint64_t a2)
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
    result = sub_224D827B0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_224D828E8();
        swift_bridgeObjectRetain();
        sub_224D82630();
        v10 = sub_224D8290C();
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

unint64_t sub_224D7E688(unint64_t result, uint64_t a2)
{
  uint64_t v2;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  __int128 *v22;
  __int128 v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;

  v2 = a2;
  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_224D827B0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      v33 = v4;
      do
      {
        v9 = 24 * v6;
        v10 = v2;
        v11 = *(_QWORD *)(v2 + 48) + 24 * v6;
        v12 = *(_QWORD *)v11;
        v13 = *(_QWORD *)(v11 + 8);
        v14 = v3;
        v15 = *(_BYTE *)(v11 + 16);
        v16 = v8;
        sub_224D828E8();
        sub_224D7CAFC(v12, v13, v15);
        sub_224D820E4();
        v17 = sub_224D8290C();
        v18 = v15;
        v3 = v14;
        result = sub_224D7CB0C(v12, v13, v18);
        v8 = v16;
        v19 = v17 & v7;
        if (v14 >= (uint64_t)v16)
        {
          if (v19 < v16)
          {
            v4 = v33;
            v2 = v10;
          }
          else
          {
            v4 = v33;
            v2 = v10;
            if (v3 >= (uint64_t)v19)
              goto LABEL_12;
          }
        }
        else
        {
          v4 = v33;
          v2 = v10;
          if (v19 >= v8 || v3 >= (uint64_t)v19)
          {
LABEL_12:
            v20 = *(_QWORD *)(v2 + 48);
            v21 = v20 + 24 * v3;
            v22 = (__int128 *)(v20 + v9);
            if (24 * v3 < v9 || v21 >= (unint64_t)v22 + 24 || v3 != v6)
            {
              v23 = *v22;
              *(_QWORD *)(v21 + 16) = *((_QWORD *)v22 + 2);
              *(_OWORD *)v21 = v23;
            }
            v24 = *(_QWORD *)(v2 + 56);
            v25 = (_QWORD *)(v24 + 8 * v3);
            v26 = (_QWORD *)(v24 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v25 >= v26 + 1))
            {
              *v25 = *v26;
              v3 = v6;
            }
          }
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v27 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v28 = *v27;
    v29 = (-1 << v3) - 1;
  }
  else
  {
    v27 = (uint64_t *)(v4 + 8 * (result >> 6));
    v29 = *v27;
    v28 = (-1 << result) - 1;
  }
  *v27 = v29 & v28;
  v30 = *(_QWORD *)(v2 + 16);
  v31 = __OFSUB__(v30, 1);
  v32 = v30 - 1;
  if (v31)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v2 + 16) = v32;
    ++*(_DWORD *)(v2 + 36);
  }
  return result;
}

unint64_t sub_224D7E8D8(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  unint64_t v11;
  _DWORD *v14;
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
    result = sub_224D827B0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        v9 = *(_QWORD *)(a2 + 48);
        v10 = (_DWORD *)(v9 + 4 * v6);
        result = MEMORY[0x22768C4C4](*(_QWORD *)(a2 + 40), *v10, 4);
        v11 = result & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = (_DWORD *)(v9 + 4 * v3);
            if (v3 != v6 || v14 >= v10 + 1)
              *v14 = *v10;
            v15 = *(_QWORD *)(a2 + 56);
            v16 = (_OWORD *)(v15 + 16 * v3);
            v17 = (_OWORD *)(v15 + 16 * v6);
            if (v3 != v6 || (v3 = v6, v16 >= v17 + 1))
            {
              *v16 = *v17;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
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

unint64_t sub_224D7EA70(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  uint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_224D827B0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      while (1)
      {
        sub_224D828E8();
        swift_bridgeObjectRetain();
        sub_224D82630();
        v9 = sub_224D8290C();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
          break;
        if (v10 < v8)
          goto LABEL_11;
LABEL_12:
        v11 = *(_QWORD *)(a2 + 48);
        v12 = (_OWORD *)(v11 + 16 * v3);
        v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1)
          *v12 = *v13;
        v14 = *(_QWORD *)(a2 + 56);
        v15 = *(_QWORD *)(*(_QWORD *)(sub_224D821B0() - 8) + 72);
        v16 = v15 * v3;
        result = v14 + v15 * v3;
        v17 = v15 * v6;
        v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          v3 = v6;
          if (v16 == v17)
            goto LABEL_6;
          result = swift_arrayInitWithTakeBackToFront();
        }
        v3 = v6;
LABEL_6:
        v6 = (v6 + 1) & v7;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          goto LABEL_21;
      }
      if (v10 < v8)
        goto LABEL_6;
LABEL_11:
      if (v3 < (uint64_t)v10)
        goto LABEL_6;
      goto LABEL_12;
    }
LABEL_21:
    v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v21 = *v20;
    v22 = (-1 << v3) - 1;
  }
  else
  {
    v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    v22 = *v20;
    v21 = (-1 << result) - 1;
  }
  *v20 = v22 & v21;
  v23 = *(_QWORD *)(a2 + 16);
  v24 = __OFSUB__(v23, 1);
  v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

void sub_224D7EC6C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v9;
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

  v5 = (_QWORD **)v4;
  v9 = (_QWORD *)*v4;
  v10 = a3 & 0x1FFFFFFFFLL;
  v12 = sub_224D81940(a3 & 0x1FFFFFFFFLL);
  v13 = v9[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v9[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = v18[7] + 16 * v12;

        *(_QWORD *)v19 = a1;
        *(_QWORD *)(v19 + 8) = a2;
        return;
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_224D7F424();
      goto LABEL_7;
    }
    sub_224D7D358(v15, a4 & 1);
    v20 = sub_224D81940(v10);
    if ((v16 & 1) == (v21 & 1))
    {
      v12 = v20;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_224D7F2EC(v12, v10, a1, a2, v18);
      return;
    }
  }
  sub_224D82888();
  __break(1u);
}

uint64_t sub_224D7ED88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  uint64_t result;
  unint64_t v26;
  char v27;
  uint64_t *v28;
  _QWORD *v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;

  v8 = v7;
  v15 = *v7;
  v17 = sub_224D819A4(a5, a6);
  v18 = *(_QWORD *)(v15 + 16);
  v19 = (v16 & 1) == 0;
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v21 = v16;
  v22 = *(_QWORD *)(v15 + 24);
  if (v22 >= v20 && (a7 & 1) != 0)
    goto LABEL_7;
  if (v22 >= v20 && (a7 & 1) == 0)
  {
    sub_224D7F5E0();
LABEL_7:
    v23 = (_QWORD *)*v8;
    if ((v21 & 1) != 0)
    {
LABEL_8:
      v24 = (_QWORD *)(v23[7] + 32 * v17);
      swift_unknownObjectRelease();
      result = swift_bridgeObjectRelease();
      *v24 = a1;
      v24[1] = a2;
      v24[2] = a3;
      v24[3] = a4;
      return result;
    }
LABEL_11:
    v23[(v17 >> 6) + 8] |= 1 << v17;
    v28 = (uint64_t *)(v23[6] + 16 * v17);
    *v28 = a5;
    v28[1] = a6;
    v29 = (_QWORD *)(v23[7] + 32 * v17);
    *v29 = a1;
    v29[1] = a2;
    v29[2] = a3;
    v29[3] = a4;
    v30 = v23[2];
    v31 = __OFADD__(v30, 1);
    v32 = v30 + 1;
    if (!v31)
    {
      v23[2] = v32;
      return swift_bridgeObjectRetain();
    }
    goto LABEL_14;
  }
  sub_224D7D658(v20, a7 & 1);
  v26 = sub_224D819A4(a5, a6);
  if ((v21 & 1) == (v27 & 1))
  {
    v17 = v26;
    v23 = (_QWORD *)*v8;
    if ((v21 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_224D82888();
  __break(1u);
  return result;
}

uint64_t sub_224D7EF24(uint64_t a1, uint64_t a2, unsigned int a3, char a4)
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
  v12 = sub_224D81A08(a3);
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
    result = (uint64_t)sub_224D7F988();
LABEL_7:
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = (_QWORD *)(v18[7] + 16 * v12);
      result = swift_bridgeObjectRelease();
      *v19 = a1;
      v19[1] = a2;
      return result;
    }
LABEL_11:
    v18[(v12 >> 6) + 8] |= 1 << v12;
    *(_DWORD *)(v18[6] + 4 * v12) = a3;
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
  sub_224D7DCB8(result, a4 & 1);
  result = sub_224D81A08(a3);
  if ((v16 & 1) == (v20 & 1))
  {
    v12 = result;
    v18 = (_QWORD *)*v5;
    if ((v16 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = sub_224D82888();
  __break(1u);
  return result;
}

uint64_t sub_224D7F060(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
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
  uint64_t v19;
  uint64_t v20;
  uint64_t result;
  unint64_t v22;
  char v23;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_224D819A4(a2, a3);
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
        v19 = v18[7];
        v20 = sub_224D821B0();
        return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 40))(v19 + *(_QWORD *)(*(_QWORD *)(v20 - 8) + 72) * v12, a1, v20);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_224D7FB34();
      goto LABEL_7;
    }
    sub_224D7DF70(v15, a4 & 1);
    v22 = sub_224D819A4(a2, a3);
    if ((v16 & 1) == (v23 & 1))
    {
      v12 = v22;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_224D7F340(v12, a2, a3, a1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_224D82888();
  __break(1u);
  return result;
}

uint64_t sub_224D7F19C(uint64_t a1, uint64_t a2, uint64_t a3, char a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  char v11;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t result;
  unint64_t v23;
  char v24;

  v6 = (_QWORD **)v5;
  v11 = a4 & 1;
  v12 = (_QWORD *)*v5;
  v14 = sub_224D81A3C(a2, a3, a4 & 1);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a5 & 1) != 0)
    {
LABEL_7:
      v20 = *v6;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = v20[7];
        result = swift_bridgeObjectRelease();
        *(_QWORD *)(v21 + 8 * v14) = a1;
        return result;
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_224D7F7C8();
      goto LABEL_7;
    }
    sub_224D7D988(v17, a5 & 1);
    v23 = sub_224D81A3C(a2, a3, v11);
    if ((v18 & 1) == (v24 & 1))
    {
      v14 = v23;
      v20 = *v6;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_224D7F3D0(v14, a2, a3, v11, a1, v20);
      return sub_224D7CAFC(a2, a3, v11);
    }
  }
  result = sub_224D82888();
  __break(1u);
  return result;
}

unint64_t sub_224D7F2EC(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = a5[6] + 8 * result;
  *(_DWORD *)v5 = a2;
  *(_BYTE *)(v5 + 4) = BYTE4(a2) & 1;
  v6 = (_QWORD *)(a5[7] + 16 * result);
  *v6 = a3;
  v6[1] = a4;
  v7 = a5[2];
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
    __break(1u);
  else
    a5[2] = v9;
  return result;
}

uint64_t sub_224D7F340(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v8 = (_QWORD *)(a5[6] + 16 * a1);
  *v8 = a2;
  v8[1] = a3;
  v9 = a5[7];
  v10 = sub_224D821B0();
  result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v9 + *(_QWORD *)(*(_QWORD *)(v10 - 8) + 72) * a1, a4, v10);
  v12 = a5[2];
  v13 = __OFADD__(v12, 1);
  v14 = v12 + 1;
  if (v13)
    __break(1u);
  else
    a5[2] = v14;
  return result;
}

unint64_t sub_224D7F3D0(unint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5, _QWORD *a6)
{
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = a6[6] + 24 * result;
  *(_QWORD *)v6 = a2;
  *(_QWORD *)(v6 + 8) = a3;
  *(_BYTE *)(v6 + 16) = a4 & 1;
  *(_QWORD *)(a6[7] + 8 * result) = a5;
  v7 = a6[2];
  v8 = __OFADD__(v7, 1);
  v9 = v7 + 1;
  if (v8)
    __break(1u);
  else
    a6[2] = v9;
  return result;
}

id sub_224D7F424()
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
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D87B8);
  v2 = *v0;
  v3 = sub_224D82810();
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
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 8 * v15;
    v18 = *(_DWORD *)v17;
    LOBYTE(v17) = *(_BYTE *)(v17 + 4);
    v19 = 16 * v15;
    v20 = *(_QWORD *)(v2 + 56) + v19;
    v22 = *(void **)v20;
    v21 = *(_QWORD *)(v20 + 8);
    v23 = *(_QWORD *)(v4 + 48) + v16;
    *(_DWORD *)v23 = v18;
    *(_BYTE *)(v23 + 4) = v17;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v19);
    *v24 = v22;
    v24[1] = v21;
    result = v22;
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_224D7F5E0()
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
  uint64_t v23;
  _QWORD *v24;
  __int128 v25;
  uint64_t v26;
  int64_t v27;
  unint64_t v28;
  int64_t v29;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D87B0);
  v2 = *v0;
  v3 = sub_224D82810();
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
    v27 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v27 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v27);
    ++v9;
    if (!v28)
    {
      v9 = v27 + 1;
      if (v27 + 1 >= v13)
        goto LABEL_26;
      v28 = *(_QWORD *)(v6 + 8 * v9);
      if (!v28)
        break;
    }
LABEL_25:
    v12 = (v28 - 1) & v28;
    v15 = __clz(__rbit64(v28)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    v21 = *(_QWORD *)(v2 + 56) + v20;
    v22 = *(_QWORD *)v21;
    v23 = *(_QWORD *)(v21 + 24);
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    v25 = *(_OWORD *)(v21 + 8);
    *v24 = v19;
    v24[1] = v18;
    v26 = *(_QWORD *)(v4 + 56) + v20;
    *(_QWORD *)v26 = v22;
    *(_OWORD *)(v26 + 8) = v25;
    *(_QWORD *)(v26 + 24) = v23;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = (void *)swift_unknownObjectRetain();
  }
  v29 = v27 + 2;
  if (v29 >= v13)
    goto LABEL_26;
  v28 = *(_QWORD *)(v6 + 8 * v29);
  if (v28)
  {
    v9 = v29;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v29 + 1;
    if (__OFADD__(v29, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v28 = *(_QWORD *)(v6 + 8 * v9);
    ++v29;
    if (v28)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_224D7F7C8()
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
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  unint64_t v25;
  int64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8730);
  v2 = *v0;
  v3 = sub_224D82810();
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
    v24 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v24 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v24);
    ++v9;
    if (!v25)
    {
      v9 = v24 + 1;
      if (v24 + 1 >= v13)
        goto LABEL_26;
      v25 = *(_QWORD *)(v6 + 8 * v9);
      if (!v25)
        break;
    }
LABEL_25:
    v12 = (v25 - 1) & v25;
    v15 = __clz(__rbit64(v25)) + (v9 << 6);
LABEL_12:
    v16 = 24 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 24 * v15;
    v18 = *(_QWORD *)v17;
    v19 = *(_QWORD *)(v17 + 8);
    v20 = *(_BYTE *)(v17 + 16);
    v21 = 8 * v15;
    v22 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v21);
    v23 = *(_QWORD *)(v4 + 48) + v16;
    *(_QWORD *)v23 = *(_QWORD *)v17;
    *(_QWORD *)(v23 + 8) = v19;
    *(_BYTE *)(v23 + 16) = v20;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v21) = v22;
    sub_224D7CAFC(v18, v19, v20);
    result = (void *)swift_bridgeObjectRetain();
  }
  v26 = v24 + 2;
  if (v26 >= v13)
    goto LABEL_26;
  v25 = *(_QWORD *)(v6 + 8 * v26);
  if (v25)
  {
    v9 = v26;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v26 + 1;
    if (__OFADD__(v26, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v25 = *(_QWORD *)(v6 + 8 * v9);
    ++v26;
    if (v25)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_224D7F988()
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
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8790);
  v2 = *v0;
  v3 = sub_224D82810();
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
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 4 * v15;
    v17 = *(_DWORD *)(*(_QWORD *)(v2 + 48) + 4 * v15);
    v18 = 16 * v15;
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v18);
    v21 = *v19;
    v20 = v19[1];
    *(_DWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v18);
    *v22 = v21;
    v22[1] = v20;
    result = (void *)swift_bridgeObjectRetain();
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_224D7FB34()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *result;
  unint64_t v9;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;

  v34 = sub_224D821B0();
  v1 = *(_QWORD *)(v34 - 8);
  MEMORY[0x24BDAC7A8](v34);
  v3 = (char *)&v30 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2557D8798);
  v31 = v0;
  v4 = *v0;
  v5 = sub_224D82810();
  v6 = *(_QWORD *)(v4 + 16);
  v35 = v5;
  if (!v6)
  {
    result = (void *)swift_release();
    v29 = v35;
    v28 = v31;
LABEL_28:
    *v28 = v29;
    return result;
  }
  v7 = v5;
  result = (void *)(v5 + 64);
  v9 = (unint64_t)((1 << *(_BYTE *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    v7 = v35;
  }
  v32 = v4 + 64;
  v11 = 0;
  *(_QWORD *)(v7 + 16) = *(_QWORD *)(v4 + 16);
  v12 = 1 << *(_BYTE *)(v4 + 32);
  v13 = -1;
  if (v12 < 64)
    v13 = ~(-1 << v12);
  v14 = v13 & *(_QWORD *)(v4 + 64);
  v33 = (unint64_t)(v12 + 63) >> 6;
  v15 = v34;
  while (1)
  {
    if (v14)
    {
      v16 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      v17 = v16 | (v11 << 6);
      goto LABEL_12;
    }
    v25 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v25 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v25);
    ++v11;
    if (!v26)
    {
      v11 = v25 + 1;
      if (v25 + 1 >= v33)
        goto LABEL_26;
      v26 = *(_QWORD *)(v32 + 8 * v11);
      if (!v26)
        break;
    }
LABEL_25:
    v14 = (v26 - 1) & v26;
    v17 = __clz(__rbit64(v26)) + (v11 << 6);
LABEL_12:
    v18 = 16 * v17;
    v19 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v17);
    v21 = *v19;
    v20 = v19[1];
    v22 = *(_QWORD *)(v1 + 72) * v17;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(_QWORD *)(v4 + 56) + v22, v15);
    v23 = v35;
    v24 = (_QWORD *)(*(_QWORD *)(v35 + 48) + v18);
    *v24 = v21;
    v24[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(_QWORD *)(v23 + 56) + v22, v3, v15);
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v33)
  {
LABEL_26:
    result = (void *)swift_release();
    v28 = v31;
    v29 = v35;
    goto LABEL_28;
  }
  v26 = *(_QWORD *)(v32 + 8 * v27);
  if (v26)
  {
    v11 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v11 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v11 >= v33)
      goto LABEL_26;
    v26 = *(_QWORD *)(v32 + 8 * v11);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_224D7FD90(uint64_t a1, char *a2)
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
  void (*v17)(_QWORD, _QWORD, _QWORD);
  uint64_t v18;
  void (*v19)(_QWORD, _QWORD, _QWORD);
  char v20;
  void (*v21)(char *, uint64_t);
  char isUniquelyReferenced_nonNull_native;
  char *v23;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;

  v3 = v2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8720);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *v2;
  sub_224D5C9C0(&qword_2557D8738, &qword_2557D8720, MEMORY[0x24BE76AB0]);
  swift_bridgeObjectRetain();
  v29 = a2;
  v11 = sub_224D825DC();
  v12 = -1 << *(_BYTE *)(v10 + 32);
  v13 = v11 & ~v12;
  v14 = v10;
  v15 = v10 + 56;
  if (((*(_QWORD *)(v15 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
  {
    v25 = v2;
    v26 = a1;
    v27 = ~v12;
    v28 = v7;
    v16 = *(_QWORD *)(v7 + 72);
    v17 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
    while (1)
    {
      v18 = v14;
      v19 = v17;
      v17(v9, *(_QWORD *)(v14 + 48) + v16 * v13, v6);
      sub_224D5C9C0(&qword_2557D8740, &qword_2557D8720, MEMORY[0x24BE76AB8]);
      v20 = sub_224D825F4();
      v21 = *(void (**)(char *, uint64_t))(v28 + 8);
      v21(v9, v6);
      if ((v20 & 1) != 0)
        break;
      v13 = (v13 + 1) & v27;
      v14 = v18;
      v17 = v19;
      if (((*(_QWORD *)(v15 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v3 = v25;
        a1 = v26;
        v7 = v28;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v21(v29, v6);
    v19(v26, *(_QWORD *)(*v25 + 48) + v16 * v13, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v17 = *(void (**)(_QWORD, _QWORD, _QWORD))(v7 + 16);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v23 = v29;
    v17(v9, v29, v6);
    v30 = *v3;
    *v3 = 0x8000000000000000;
    sub_224D80360((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *v3 = v30;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v23, v6);
    return 1;
  }
}

uint64_t sub_224D7FFF0()
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
  uint64_t v23;
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
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8720);
  v36 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8748);
  v6 = sub_224D827C8();
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
      v22 = *(_QWORD *)(v5 + 48);
      v23 = *(_QWORD *)(v36 + 72);
      v24 = *(void (**)(char *, unint64_t, uint64_t))(v36 + 32);
      v24(v4, v22 + v23 * v17, v2);
      sub_224D5C9C0(&qword_2557D8738, &qword_2557D8720, MEMORY[0x24BE76AB0]);
      result = sub_224D825DC();
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
      result = ((uint64_t (*)(unint64_t, char *, uint64_t))v24)(*(_QWORD *)(v7 + 48) + v15 * v23, v4, v2);
      ++*(_QWORD *)(v7 + 16);
      v5 = v21;
    }
  }
  result = swift_release();
  *v1 = v7;
  return result;
}

uint64_t sub_224D80360(uint64_t a1, unint64_t a2, char a3)
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
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8720);
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
    sub_224D7FFF0();
  }
  else
  {
    if (v11 > v10)
    {
      sub_224D80568();
      goto LABEL_12;
    }
    sub_224D80794();
  }
  v12 = *v3;
  sub_224D5C9C0(&qword_2557D8738, &qword_2557D8720, MEMORY[0x24BE76AB0]);
  v13 = sub_224D825DC();
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
      sub_224D5C9C0(&qword_2557D8740, &qword_2557D8720, MEMORY[0x24BE76AB8]);
      v18 = sub_224D825F4();
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
  result = sub_224D8287C();
  __break(1u);
  return result;
}

void *sub_224D80568()
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
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8720);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8748);
  v6 = *v0;
  v7 = sub_224D827BC();
  v8 = v7;
  if (!*(_QWORD *)(v6 + 16))
  {
    result = (void *)swift_release();
LABEL_27:
    *v1 = v8;
    return result;
  }
  v24 = v1;
  result = (void *)(v7 + 56);
  v10 = v6 + 56;
  v11 = (unint64_t)((1 << *(_BYTE *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11)
    result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  v12 = 0;
  *(_QWORD *)(v8 + 16) = *(_QWORD *)(v6 + 16);
  v13 = 1 << *(_BYTE *)(v6 + 32);
  v14 = -1;
  if (v13 < 64)
    v14 = ~(-1 << v13);
  v15 = v14 & *(_QWORD *)(v6 + 56);
  v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v20 >= v16)
      goto LABEL_25;
    v21 = *(_QWORD *)(v10 + 8 * v20);
    ++v12;
    if (!v21)
    {
      v12 = v20 + 1;
      if (v20 + 1 >= v16)
        goto LABEL_25;
      v21 = *(_QWORD *)(v10 + 8 * v12);
      if (!v21)
      {
        v12 = v20 + 2;
        if (v20 + 2 >= v16)
          goto LABEL_25;
        v21 = *(_QWORD *)(v10 + 8 * v12);
        if (!v21)
          break;
      }
    }
LABEL_24:
    v15 = (v21 - 1) & v21;
    v18 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    v19 = *(_QWORD *)(v3 + 72) * v18;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(_QWORD *)(v6 + 48) + v19, v2);
    result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v8 + 48) + v19, v5, v2);
  }
  v22 = v20 + 3;
  if (v22 >= v16)
  {
LABEL_25:
    result = (void *)swift_release();
    v1 = v24;
    goto LABEL_27;
  }
  v21 = *(_QWORD *)(v10 + 8 * v22);
  if (v21)
  {
    v12 = v22;
    goto LABEL_24;
  }
  while (1)
  {
    v12 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v12 >= v16)
      goto LABEL_25;
    v21 = *(_QWORD *)(v10 + 8 * v12);
    ++v22;
    if (v21)
      goto LABEL_24;
  }
LABEL_29:
  __break(1u);
  return result;
}

uint64_t sub_224D80794()
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
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8720);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8748);
  v7 = sub_224D827C8();
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
  result = swift_retain();
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
    sub_224D5C9C0(&qword_2557D8738, &qword_2557D8720, MEMORY[0x24BE76AB0]);
    result = sub_224D825DC();
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

uint64_t sub_224D80AC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, unint64_t, uint64_t);
  unint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8720);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *v2;
  sub_224D5C9C0(&qword_2557D8738, &qword_2557D8720, MEMORY[0x24BE76AB0]);
  swift_bridgeObjectRetain();
  v27 = a1;
  v10 = sub_224D825DC();
  v11 = -1 << *(_BYTE *)(v9 + 32);
  v12 = v10 & ~v11;
  if (((*(_QWORD *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) != 0)
  {
    v25 = v2;
    v26 = a2;
    v13 = ~v11;
    v14 = *(_QWORD *)(v6 + 72);
    v28 = v6;
    v15 = *(void (**)(char *, unint64_t, uint64_t))(v6 + 16);
    while (1)
    {
      v16 = v14 * v12;
      v15(v8, *(_QWORD *)(v9 + 48) + v14 * v12, v5);
      sub_224D5C9C0(&qword_2557D8740, &qword_2557D8720, MEMORY[0x24BE76AB8]);
      v17 = sub_224D825F4();
      (*(void (**)(char *, uint64_t))(v28 + 8))(v8, v5);
      if ((v17 & 1) != 0)
        break;
      v12 = (v12 + 1) & v13;
      if (((*(_QWORD *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFF8)) >> v12) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        v18 = 1;
        a2 = v26;
        v6 = v28;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v18, 1, v5);
      }
    }
    swift_bridgeObjectRelease();
    v19 = v25;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v21 = *v19;
    v29 = *v19;
    *v19 = 0x8000000000000000;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_224D80568();
      v21 = v29;
    }
    v22 = *(_QWORD *)(v21 + 48) + v16;
    v6 = v28;
    a2 = v26;
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v28 + 32))(v26, v22, v5);
    sub_224D80D04(v12);
    *v19 = v29;
    swift_bridgeObjectRelease();
    v18 = 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    v18 = 1;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 56))(a2, v18, 1, v5);
}

uint64_t sub_224D80D04(int64_t a1)
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
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t *v25;
  void (*v26)(char *, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8720);
  v28 = *(_QWORD *)(v3 - 8);
  result = MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v1;
  v8 = *v1 + 56;
  v9 = -1 << *(_BYTE *)(*v1 + 32);
  v10 = (a1 + 1) & ~v9;
  if (((1 << v10) & *(_QWORD *)(v8 + 8 * (v10 >> 6))) != 0)
  {
    v25 = v1;
    v11 = ~v9;
    swift_retain();
    v12 = sub_224D827B0();
    v27 = v8;
    if ((*(_QWORD *)(v8 + 8 * (v10 >> 6)) & (1 << v10)) != 0)
    {
      v13 = (v12 + 1) & v11;
      v14 = *(_QWORD *)(v28 + 72);
      v26 = *(void (**)(char *, unint64_t, uint64_t))(v28 + 16);
      do
      {
        v15 = v14 * v10;
        v26(v6, *(_QWORD *)(v7 + 48) + v14 * v10, v3);
        sub_224D5C9C0(&qword_2557D8738, &qword_2557D8720, MEMORY[0x24BE76AB0]);
        v16 = sub_224D825DC();
        (*(void (**)(char *, uint64_t))(v28 + 8))(v6, v3);
        v17 = v16 & v11;
        if (a1 >= (uint64_t)v13)
        {
          if (v17 < v13 || a1 < (uint64_t)v17)
            goto LABEL_6;
        }
        else if (v17 < v13 && a1 < (uint64_t)v17)
        {
          goto LABEL_6;
        }
        v20 = v14 * a1;
        if (v14 * a1 < v15 || *(_QWORD *)(v7 + 48) + v14 * a1 >= (unint64_t)(*(_QWORD *)(v7 + 48) + v15 + v14))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          a1 = v10;
          if (v20 == v15)
            goto LABEL_6;
          swift_arrayInitWithTakeBackToFront();
        }
        a1 = v10;
LABEL_6:
        v10 = (v10 + 1) & v11;
      }
      while (((*(_QWORD *)(v27 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0);
    }
    *(_QWORD *)(v27 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
    result = swift_release();
    v1 = v25;
  }
  else
  {
    *(_QWORD *)(v8 + (((unint64_t)a1 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << a1) - 1;
  }
  v21 = *v1;
  v22 = *(_QWORD *)(*v1 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v21 + 16) = v24;
    ++*(_DWORD *)(v21 + 36);
  }
  return result;
}

unint64_t sub_224D80F84()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2557D8778;
  if (!qword_2557D8778)
  {
    v1 = sub_224D8227C();
    result = MEMORY[0x22768C914](MEMORY[0x24BE76558], v1);
    atomic_store(result, (unint64_t *)&qword_2557D8778);
  }
  return result;
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

uint64_t sub_224D8100C()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_224D81030(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_224D7AFC4(a1, a2, a3, v3);
}

uint64_t sub_224D81038()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  _QWORD v26[2];
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  char *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  int v35;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8750);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_224D821B0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)v29 - v9;
  sub_224D7B248((uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
    return sub_224D5BE98((uint64_t)v3, &qword_2557D8750);
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v10, v3, v4);
  if (qword_2557D71F8 != -1)
    swift_once();
  v31 = v0;
  v12 = sub_224D825B8();
  v13 = __swift_project_value_buffer(v12, (uint64_t)qword_2557D8620);
  v14 = sub_224D825A0();
  v15 = sub_224D8275C();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    v30 = (char *)v13;
    *(_DWORD *)v16 = 67240192;
    swift_beginAccess();
    v35 = sub_224D8218C();
    sub_224D8278C();
    _os_log_impl(&dword_224D58000, v14, v15, "Did receive log for pid: %{public}d", v16, 8u);
    MEMORY[0x22768C9BC](v16, -1, -1);
  }

  v17 = sub_224D82408();
  sub_224D823FC();
  swift_beginAccess();
  sub_224D8218C();
  v18 = sub_224D823F0();
  swift_release();
  if (v18)
  {
    v19 = sub_224D825A0();
    v20 = sub_224D8275C();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v29[1] = v17;
      v30 = v8;
      *(_DWORD *)v21 = 67240192;
      v32 = sub_224D8218C();
      v8 = v30;
      sub_224D8278C();
      _os_log_impl(&dword_224D58000, v19, v20, "Symbolicating missing JIT symbols for pid: %{public}d", v21, 8u);
      MEMORY[0x22768C9BC](v21, -1, -1);
    }

    sub_224D822DC();
    swift_beginAccess();
    (*(void (**)(char *, char *, uint64_t))(v5 + 40))(v10, v8, v4);
    sub_224D823FC();
    sub_224D8218C();
    sub_224D823E4();
    swift_release();
    swift_release();
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  v33 = *(_QWORD *)(v31 + OBJC_IVAR____TtC17PreviewsOSSupport19CrashReportListener_state);
  MEMORY[0x24BDAC7A8](v33);
  swift_retain();
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8640);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_2557D8780);
  v28 = sub_224D5C9C0(&qword_2557D8648, &qword_2557D8640, MEMORY[0x24BE76C78]);
  v26[0] = v26;
  v26[1] = v22;
  sub_224D82468();
  v23 = swift_release();
  v24 = v34;
  MEMORY[0x24BDAC7A8](v23);
  v27 = (uint64_t)v8;
  sub_224D7AB5C((void (*)(char *))sub_224D81538, (uint64_t)v26, v24);
  swift_bridgeObjectRelease();
  v25 = *(void (**)(char *, uint64_t))(v5 + 8);
  v25(v8, v4);
  return ((uint64_t (*)(char *, uint64_t))v25)(v10, v4);
}

uint64_t sub_224D81520@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_224D7B88C(a1, *(_QWORD *)(v2 + 16), a2);
}

uint64_t sub_224D81538(uint64_t a1)
{
  uint64_t v1;

  return sub_224D7BBDC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_224D81550(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v20 = MEMORY[0x24BEE4B08];
  v3 = sub_224D8218C();
  v4 = sub_224D82198();
  v6 = v5;
  sub_224D7CAFC(v3, 0, 0);
  swift_bridgeObjectRetain();
  v7 = sub_224D81A3C(v3, 0, 0);
  v9 = v8;
  swift_bridgeObjectRelease();
  if ((v9 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a2 + 24) = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
      sub_224D7F7C8();
    sub_224D7CB0C(*(_QWORD *)(*(_QWORD *)(v11 + 48) + 24 * v7), *(_QWORD *)(*(_QWORD *)(v11 + 48) + 24 * v7 + 8), *(_BYTE *)(*(_QWORD *)(v11 + 48) + 24 * v7 + 16));
    v12 = *(_QWORD *)(*(_QWORD *)(v11 + 56) + 8 * v7);
    sub_224D7E688(v7, v11);
    *(_QWORD *)(a2 + 24) = v11;
    swift_bridgeObjectRelease();
    sub_224D7CB0C(v3, 0, 0);
    sub_224D7B664(v12);
  }
  else
  {
    sub_224D7CB0C(v3, 0, 0);
  }
  sub_224D7CAFC(v4, v6, 1);
  swift_bridgeObjectRetain();
  v13 = sub_224D81A3C(v4, v6, 1);
  v15 = v14;
  swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
  {
    v16 = swift_isUniquelyReferenced_nonNull_native();
    v17 = *(_QWORD *)(a2 + 24);
    *(_QWORD *)(a2 + 24) = 0x8000000000000000;
    if ((v16 & 1) == 0)
      sub_224D7F7C8();
    sub_224D7CB0C(*(_QWORD *)(*(_QWORD *)(v17 + 48) + 24 * v13), *(_QWORD *)(*(_QWORD *)(v17 + 48) + 24 * v13 + 8), *(_BYTE *)(*(_QWORD *)(v17 + 48) + 24 * v13 + 16));
    v18 = *(_QWORD *)(*(_QWORD *)(v17 + 56) + 8 * v13);
    sub_224D7E688(v13, v17);
    *(_QWORD *)(a2 + 24) = v17;
    swift_bridgeObjectRelease();
    sub_224D7CB0C(v4, v6, 1);
    sub_224D7B664(v18);
  }
  else
  {
    sub_224D7CB0C(v4, v6, 1);
  }
  swift_arrayDestroy();
  return v20;
}

uint64_t static URL.rootRelativeFileURL(relativePath:isDirectory:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  id v5;
  uint64_t v6;
  char v7;
  uint64_t v9;

  v0 = sub_224D81F34();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD1760]), sel_init);
  v5 = objc_msgSend(v4, sel_environment);

  v6 = sub_224D825D0();
  if (*(_QWORD *)(v6 + 16) && (sub_224D819A4(0x4F4F525F444C5944, 0xEE00485441505F54), (v7 & 1) != 0))
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_224D81F04();
    swift_bridgeObjectRelease();
    sub_224D81F28();
    return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  else
  {
    swift_bridgeObjectRelease();
    return sub_224D81F04();
  }
}

unint64_t sub_224D81940(uint64_t a1)
{
  uint64_t v2;

  sub_224D828E8();
  sub_224D82900();
  sub_224D828F4();
  v2 = sub_224D8290C();
  return sub_224D81AB4(a1 & 0x1FFFFFFFFLL, v2);
}

unint64_t sub_224D819A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_224D828E8();
  sub_224D82630();
  v4 = sub_224D8290C();
  return sub_224D81B3C(a1, a2, v4);
}

unint64_t sub_224D81A08(unsigned int a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = MEMORY[0x22768C4C4](*(_QWORD *)(v1 + 40), a1, 4);
  return sub_224D81C1C(a1, v3);
}

unint64_t sub_224D81A3C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = a3 & 1;
  sub_224D828E8();
  sub_224D820E4();
  v6 = sub_224D8290C();
  return sub_224D81CB8(a1, a2, v5, v6);
}

unint64_t sub_224D81AB4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;

  v4 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v6 = ~v4;
    do
    {
      if (!((*(_DWORD *)(*(_QWORD *)(v2 + 48) + 8 * result) != (_DWORD)a1) | (BYTE4(a1) & 1 ^ *(unsigned __int8 *)(*(_QWORD *)(v2 + 48) + 8 * result + 4)) & 1))
        break;
      result = (result + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0);
  }
  return result;
}

unint64_t sub_224D81B3C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_224D82870() & 1) == 0)
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
      while (!v14 && (sub_224D82870() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_224D81C1C(int a1, uint64_t a2)
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
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_224D81CB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t i;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;

  v5 = v4 + 64;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  i = a4 & ~v6;
  if (((*(_QWORD *)(v4 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    v8 = *(_QWORD *)(v4 + 48) + 24 * i;
    v9 = *(_QWORD *)v8;
    v10 = *(_QWORD *)(v8 + 8);
    v11 = *(_BYTE *)(v8 + 16);
    sub_224D7CAFC(*(_QWORD *)v8, v10, v11);
    v12 = sub_224D820D8();
    sub_224D7CB0C(v9, v10, v11);
    if ((v12 & 1) == 0)
    {
      v13 = ~v6;
      for (i = (i + 1) & v13; ((*(_QWORD *)(v5 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v13)
      {
        v14 = *(_QWORD *)(v4 + 48) + 24 * i;
        v15 = *(_QWORD *)v14;
        v16 = *(_QWORD *)(v14 + 8);
        v17 = *(_BYTE *)(v14 + 16);
        sub_224D7CAFC(*(_QWORD *)v14, v16, v17);
        v18 = sub_224D820D8();
        sub_224D7CB0C(v15, v16, v17);
        if ((v18 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_224D81EC8()
{
  return MEMORY[0x24BDCBE60]();
}

uint64_t sub_224D81ED4()
{
  return MEMORY[0x24BDCBE68]();
}

uint64_t sub_224D81EE0()
{
  return MEMORY[0x24BDCBE80]();
}

uint64_t sub_224D81EEC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_224D81EF8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_224D81F04()
{
  return MEMORY[0x24BDCD860]();
}

uint64_t sub_224D81F10()
{
  return MEMORY[0x24BDCD870]();
}

uint64_t sub_224D81F1C()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_224D81F28()
{
  return MEMORY[0x24BDCD918]();
}

uint64_t sub_224D81F34()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_224D81F40()
{
  return MEMORY[0x24BDCE330]();
}

uint64_t sub_224D81F4C()
{
  return MEMORY[0x24BDCE5E8]();
}

uint64_t sub_224D81F58()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_224D81F64()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_224D81F70()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_224D81F7C()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_224D81F88()
{
  return MEMORY[0x24BE78638]();
}

uint64_t sub_224D81F94()
{
  return MEMORY[0x24BE76FD0]();
}

uint64_t sub_224D81FA0()
{
  return MEMORY[0x24BE76FE8]();
}

uint64_t sub_224D81FAC()
{
  return MEMORY[0x24BE76FF0]();
}

uint64_t sub_224D81FB8()
{
  return MEMORY[0x24BE77378]();
}

uint64_t sub_224D81FC4()
{
  return MEMORY[0x24BE773E0]();
}

uint64_t sub_224D81FD0()
{
  return MEMORY[0x24BE77448]();
}

uint64_t sub_224D81FDC()
{
  return MEMORY[0x24BE77460]();
}

uint64_t sub_224D81FE8()
{
  return MEMORY[0x24BE77478]();
}

uint64_t sub_224D81FF4()
{
  return MEMORY[0x24BE77480]();
}

uint64_t sub_224D82000()
{
  return MEMORY[0x24BE77488]();
}

uint64_t sub_224D8200C()
{
  return MEMORY[0x24BE77490]();
}

uint64_t sub_224D82018()
{
  return MEMORY[0x24BE77498]();
}

uint64_t sub_224D82024()
{
  return MEMORY[0x24BE774A0]();
}

uint64_t sub_224D82030()
{
  return MEMORY[0x24BE774B8]();
}

uint64_t sub_224D8203C()
{
  return MEMORY[0x24BE774E0]();
}

uint64_t sub_224D82048()
{
  return MEMORY[0x24BE774F8]();
}

uint64_t sub_224D82054()
{
  return MEMORY[0x24BE77500]();
}

uint64_t sub_224D82060()
{
  return MEMORY[0x24BE77508]();
}

uint64_t sub_224D8206C()
{
  return MEMORY[0x24BE77730]();
}

uint64_t sub_224D82078()
{
  return MEMORY[0x24BE77738]();
}

uint64_t sub_224D82084()
{
  return MEMORY[0x24BE77740]();
}

uint64_t sub_224D82090()
{
  return MEMORY[0x24BE77748]();
}

uint64_t sub_224D8209C()
{
  return MEMORY[0x24BE77750]();
}

uint64_t sub_224D820A8()
{
  return MEMORY[0x24BE77778]();
}

uint64_t sub_224D820B4()
{
  return MEMORY[0x24BE777C8]();
}

uint64_t sub_224D820C0()
{
  return MEMORY[0x24BE777F0]();
}

uint64_t sub_224D820CC()
{
  return MEMORY[0x24BE77838]();
}

uint64_t sub_224D820D8()
{
  return MEMORY[0x24BE77840]();
}

uint64_t sub_224D820E4()
{
  return MEMORY[0x24BE77848]();
}

uint64_t sub_224D820F0()
{
  return MEMORY[0x24BE779D0]();
}

uint64_t sub_224D820FC()
{
  return MEMORY[0x24BE77B88]();
}

uint64_t sub_224D82108()
{
  return MEMORY[0x24BE77B98]();
}

uint64_t sub_224D82114()
{
  return MEMORY[0x24BE77C48]();
}

uint64_t sub_224D82120()
{
  return MEMORY[0x24BE77C88]();
}

uint64_t sub_224D8212C()
{
  return MEMORY[0x24BE77C90]();
}

uint64_t sub_224D82138()
{
  return MEMORY[0x24BE77DC0]();
}

uint64_t sub_224D82144()
{
  return MEMORY[0x24BE77F28]();
}

uint64_t sub_224D82150()
{
  return MEMORY[0x24BE77F48]();
}

uint64_t sub_224D8215C()
{
  return MEMORY[0x24BE77F80]();
}

uint64_t sub_224D82168()
{
  return MEMORY[0x24BE77F90]();
}

uint64_t sub_224D82174()
{
  return MEMORY[0x24BE77F98]();
}

uint64_t sub_224D82180()
{
  return MEMORY[0x24BE76238]();
}

uint64_t sub_224D8218C()
{
  return MEMORY[0x24BE76288]();
}

uint64_t sub_224D82198()
{
  return MEMORY[0x24BE76290]();
}

uint64_t sub_224D821A4()
{
  return MEMORY[0x24BE76298]();
}

uint64_t sub_224D821B0()
{
  return MEMORY[0x24BE76340]();
}

uint64_t sub_224D821BC()
{
  return MEMORY[0x24BE76370]();
}

uint64_t sub_224D821C8()
{
  return MEMORY[0x24BE76428]();
}

uint64_t sub_224D821D4()
{
  return MEMORY[0x24BE77FA8]();
}

uint64_t sub_224D821E0()
{
  return MEMORY[0x24BE77FB0]();
}

uint64_t sub_224D821EC()
{
  return MEMORY[0x24BE764C0]();
}

uint64_t sub_224D821F8()
{
  return MEMORY[0x24BE764C8]();
}

uint64_t sub_224D82204()
{
  return MEMORY[0x24BE764D0]();
}

uint64_t sub_224D82210()
{
  return MEMORY[0x24BE764E0]();
}

uint64_t sub_224D8221C()
{
  return MEMORY[0x24BE764E8]();
}

uint64_t sub_224D82228()
{
  return MEMORY[0x24BE764F0]();
}

uint64_t _s17PreviewsOSSupport15JITSetupPayloadV17propertyListValue0A12FoundationOS08PropertyF0Vvg_0()
{
  return MEMORY[0x24BE764F8]();
}

uint64_t sub_224D82240()
{
  return MEMORY[0x24BE76500]();
}

uint64_t sub_224D8224C()
{
  return MEMORY[0x24BE76510]();
}

uint64_t sub_224D82258()
{
  return MEMORY[0x24BE76528]();
}

uint64_t sub_224D82264()
{
  return MEMORY[0x24BE76530]();
}

uint64_t sub_224D82270()
{
  return MEMORY[0x24BE76548]();
}

uint64_t sub_224D8227C()
{
  return MEMORY[0x24BE76550]();
}

uint64_t sub_224D82288()
{
  return MEMORY[0x24BE765B0]();
}

uint64_t sub_224D82294()
{
  return MEMORY[0x24BE765C0]();
}

uint64_t sub_224D822A0()
{
  return MEMORY[0x24BE765C8]();
}

uint64_t sub_224D822AC()
{
  return MEMORY[0x24BE76608]();
}

uint64_t sub_224D822B8()
{
  return MEMORY[0x24BE76618]();
}

uint64_t sub_224D822C4()
{
  return MEMORY[0x24BE76620]();
}

uint64_t sub_224D822D0()
{
  return MEMORY[0x24BE76628]();
}

uint64_t sub_224D822DC()
{
  return MEMORY[0x24BE76638]();
}

uint64_t sub_224D822E8()
{
  return MEMORY[0x24BE76648]();
}

uint64_t sub_224D822F4()
{
  return MEMORY[0x24BE766B8]();
}

uint64_t sub_224D82300()
{
  return MEMORY[0x24BE76708]();
}

uint64_t sub_224D8230C()
{
  return MEMORY[0x24BE76710]();
}

uint64_t sub_224D82318()
{
  return MEMORY[0x24BE76748]();
}

uint64_t sub_224D82324()
{
  return MEMORY[0x24BE76750]();
}

uint64_t sub_224D82330()
{
  return MEMORY[0x24BE76758]();
}

uint64_t sub_224D8233C()
{
  return MEMORY[0x24BE76768]();
}

uint64_t sub_224D82348()
{
  return MEMORY[0x24BE76770]();
}

uint64_t sub_224D82354()
{
  return MEMORY[0x24BE76778]();
}

uint64_t sub_224D82360()
{
  return MEMORY[0x24BE76780]();
}

uint64_t sub_224D8236C()
{
  return MEMORY[0x24BE76788]();
}

uint64_t sub_224D82378()
{
  return MEMORY[0x24BE76790]();
}

uint64_t sub_224D82384()
{
  return MEMORY[0x24BE76798]();
}

uint64_t sub_224D82390()
{
  return MEMORY[0x24BE767A0]();
}

uint64_t sub_224D8239C()
{
  return MEMORY[0x24BE767A8]();
}

uint64_t sub_224D823A8()
{
  return MEMORY[0x24BE767B0]();
}

uint64_t sub_224D823B4()
{
  return MEMORY[0x24BE767B8]();
}

uint64_t sub_224D823C0()
{
  return MEMORY[0x24BE767F0]();
}

uint64_t sub_224D823CC()
{
  return MEMORY[0x24BE767F8]();
}

uint64_t sub_224D823D8()
{
  return MEMORY[0x24BE76848]();
}

uint64_t sub_224D823E4()
{
  return MEMORY[0x24BE768E0]();
}

uint64_t sub_224D823F0()
{
  return MEMORY[0x24BE768E8]();
}

uint64_t sub_224D823FC()
{
  return MEMORY[0x24BE768F8]();
}

uint64_t sub_224D82408()
{
  return MEMORY[0x24BE76900]();
}

uint64_t sub_224D82414()
{
  return MEMORY[0x24BE76910]();
}

uint64_t sub_224D82420()
{
  return MEMORY[0x24BE76928]();
}

uint64_t sub_224D8242C()
{
  return MEMORY[0x24BE769A8]();
}

uint64_t sub_224D82438()
{
  return MEMORY[0x24BE769B0]();
}

uint64_t sub_224D82444()
{
  return MEMORY[0x24BE769C8]();
}

uint64_t sub_224D82450()
{
  return MEMORY[0x24BE769D0]();
}

uint64_t sub_224D8245C()
{
  return MEMORY[0x24BE76A20]();
}

uint64_t sub_224D82468()
{
  return MEMORY[0x24BE76A28]();
}

uint64_t sub_224D82474()
{
  return MEMORY[0x24BE76A50]();
}

uint64_t sub_224D82480()
{
  return MEMORY[0x24BE76A60]();
}

uint64_t sub_224D8248C()
{
  return MEMORY[0x24BE76A98]();
}

uint64_t sub_224D82498()
{
  return MEMORY[0x24BE76AA8]();
}

uint64_t sub_224D824A4()
{
  return MEMORY[0x24BE76AD0]();
}

uint64_t sub_224D824B0()
{
  return MEMORY[0x24BE76B28]();
}

uint64_t sub_224D824BC()
{
  return MEMORY[0x24BE76B38]();
}

uint64_t sub_224D824C8()
{
  return MEMORY[0x24BE76B50]();
}

uint64_t sub_224D824D4()
{
  return MEMORY[0x24BE76B58]();
}

uint64_t sub_224D824E0()
{
  return MEMORY[0x24BE76BC0]();
}

uint64_t sub_224D824EC()
{
  return MEMORY[0x24BDC6DD8]();
}

uint64_t sub_224D824F8()
{
  return MEMORY[0x24BDC6DE0]();
}

uint64_t sub_224D82504()
{
  return MEMORY[0x24BDC6DE8]();
}

uint64_t sub_224D82510()
{
  return MEMORY[0x24BDC6E88]();
}

uint64_t sub_224D8251C()
{
  return MEMORY[0x24BDC6E90]();
}

uint64_t sub_224D82528()
{
  return MEMORY[0x24BDC6E98]();
}

uint64_t sub_224D82534()
{
  return MEMORY[0x24BDC6EA0]();
}

uint64_t sub_224D82540()
{
  return MEMORY[0x24BDC6EA8]();
}

uint64_t sub_224D8254C()
{
  return MEMORY[0x24BDC6EB0]();
}

uint64_t sub_224D82558()
{
  return MEMORY[0x24BDC6EB8]();
}

uint64_t sub_224D82564()
{
  return MEMORY[0x24BDC6EC0]();
}

uint64_t sub_224D82570()
{
  return MEMORY[0x24BDC6ED0]();
}

uint64_t sub_224D8257C()
{
  return MEMORY[0x24BE76C70]();
}

uint64_t sub_224D82588()
{
  return MEMORY[0x24BE76C80]();
}

uint64_t sub_224D82594()
{
  return MEMORY[0x24BE76C88]();
}

uint64_t sub_224D825A0()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_224D825AC()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_224D825B8()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_224D825C4()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_224D825D0()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_224D825DC()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_224D825E8()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_224D825F4()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_224D82600()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_224D8260C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_224D82618()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_224D82624()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_224D82630()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_224D8263C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_224D82648()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_224D82654()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_224D82660()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_224D8266C()
{
  return MEMORY[0x24BE76CD8]();
}

uint64_t sub_224D82678()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_224D82684()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_224D82690()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_224D8269C()
{
  return MEMORY[0x24BEE69A8]();
}

uint64_t sub_224D826A8()
{
  return MEMORY[0x24BEE69E8]();
}

uint64_t sub_224D826B4()
{
  return MEMORY[0x24BEE6A18]();
}

uint64_t sub_224D826C0()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_224D826CC()
{
  return MEMORY[0x24BEE6A38]();
}

uint64_t sub_224D826D8()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t sub_224D826E4()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_224D826F0()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_224D826FC()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_224D82708()
{
  return MEMORY[0x24BE76D68]();
}

uint64_t sub_224D82714()
{
  return MEMORY[0x24BE76D78]();
}

uint64_t sub_224D82720()
{
  return MEMORY[0x24BEE6AC0]();
}

uint64_t sub_224D8272C()
{
  return MEMORY[0x24BEE6AE8]();
}

uint64_t sub_224D82738()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_224D82744()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_224D82750()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_224D8275C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_224D82768()
{
  return MEMORY[0x24BE77FB8]();
}

uint64_t sub_224D82774()
{
  return MEMORY[0x24BE76DF8]();
}

uint64_t sub_224D82780()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_224D8278C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_224D82798()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_224D827A4()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_224D827B0()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_224D827BC()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_224D827C8()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_224D827D4()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_224D827E0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_224D827EC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_224D827F8()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_224D82804()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_224D82810()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_224D8281C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_224D82828()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_224D82834()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_224D82840()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_224D8284C()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_224D82858()
{
  return MEMORY[0x24BEE3938]();
}

uint64_t sub_224D82864()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_224D82870()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_224D8287C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_224D82888()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_224D82894()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_224D828A0()
{
  return MEMORY[0x24BE76E10]();
}

uint64_t sub_224D828AC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_224D828B8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_224D828C4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_224D828D0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_224D828DC()
{
  return MEMORY[0x24BEE42C8]();
}

uint64_t sub_224D828E8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_224D828F4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_224D82900()
{
  return MEMORY[0x24BEE4310]();
}

uint64_t sub_224D8290C()
{
  return MEMORY[0x24BEE4328]();
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

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x24BEE4DE0]();
}

uint64_t swift_getTupleTypeLayout3()
{
  return MEMORY[0x24BEE4DE8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTupleTypeMetadata3()
{
  return MEMORY[0x24BEE4E00]();
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

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

