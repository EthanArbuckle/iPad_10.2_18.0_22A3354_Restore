void sub_245440C48()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _OWORD v9[2];

  v1 = sub_245443CDC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (_QWORD *)((char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(void **)(v0 + OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_queue);
  *v4 = v5;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x24BEE5610], v1);
  v6 = v5;
  LOBYTE(v5) = sub_245443CE8();
  (*(void (**)(_QWORD *, uint64_t))(v2 + 8))(v4, v1);
  if ((v5 & 1) != 0)
  {
    sub_2454406CC();
    v7 = *(void **)(v0 + OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_connection);
    if (v7)
    {
      v8 = v7;
      if (objc_msgSend(v8, sel_remoteTarget))
      {
        sub_24544409C();

        swift_unknownObjectRelease();
        sub_245441414((uint64_t)v9);
      }
      else
      {
        memset(v9, 0, sizeof(v9));
        sub_245441414((uint64_t)v9);
        objc_msgSend(v8, sel_activate);

      }
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_245440D80()
{
  uint64_t v0;
  NSObject *v1;
  Class isa;
  uint64_t v3;
  _QWORD *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD v16[2];
  _OWORD v17[2];
  _BYTE v18[24];
  uint64_t v19;

  v1 = sub_245443CDC();
  isa = v1[-1].isa;
  MEMORY[0x24BDAC7A8](v1);
  v4 = (_QWORD *)((char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v5 = *(void **)(v0 + OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_queue);
  *v4 = v5;
  (*((void (**)(_QWORD *, _QWORD, NSObject *))isa + 13))(v4, *MEMORY[0x24BEE5610], v1);
  v6 = v5;
  LOBYTE(v5) = sub_245443CE8();
  (*((void (**)(_QWORD *, NSObject *))isa + 1))(v4, v1);
  if ((v5 & 1) == 0)
  {
    __break(1u);
LABEL_20:
    swift_once();
    goto LABEL_15;
  }
  sub_245440C48();
  v7 = *(void **)(v0 + OBJC_IVAR____TtC18ReplicatorServices18StateCaptureClient_connection);
  if (!v7)
  {
    if (qword_257463C50 != -1)
      swift_once();
    v8 = sub_245443C04();
    __swift_project_value_buffer(v8, (uint64_t)qword_257463C38);
    v1 = sub_245443BEC();
    v9 = sub_245443FF4();
    if (os_log_type_enabled(v1, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_2453B6000, v1, v9, "StateCaptureClient: Failed to establish a connection", v10, 2u);
      MEMORY[0x249534440](v10, -1, -1);
    }
    goto LABEL_18;
  }
  v1 = v7;
  if (-[NSObject remoteTarget](v1, sel_remoteTarget))
  {
    sub_24544409C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_2454413CC((uint64_t)v17, (uint64_t)v18);
  if (v19)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257465978);
    if ((swift_dynamicCast() & 1) != 0)
    {

      return v16[1];
    }
  }
  else
  {
    sub_245441414((uint64_t)v18);
  }
  if (qword_257463C50 != -1)
    goto LABEL_20;
LABEL_15:
  v12 = sub_245443C04();
  __swift_project_value_buffer(v12, (uint64_t)qword_257463C38);
  v13 = sub_245443BEC();
  v14 = sub_245443FF4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_2453B6000, v13, v14, "StateCaptureClient: Failed to cast connection to server interface protocol", v15, 2u);
    MEMORY[0x249534440](v15, -1, -1);
  }

LABEL_18:
  return 0;
}

id StateCaptureClient.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StateCaptureClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> StateCaptureClient.state(identifier:)(Swift::String_optional identifier)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  Swift::String result;
  uint64_t v5;
  void *v6;

  v2 = sub_245444030();
  if (!v1)
  {
    v2 = v5;
    v3 = v6;
  }
  result._object = v3;
  result._countAndFlagsBits = v2;
  return result;
}

void sub_245441110(void *a1@<X2>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = sub_245440D80();
  if (v4)
  {
    v5 = (void *)v4;
    if (a1)
      a1 = (void *)sub_245443D78();
    v13[0] = 0;
    v6 = objc_msgSend(v5, sel_stateFor_error_, a1, v13);
    swift_unknownObjectRelease();

    v7 = v13[0];
    if (v6)
    {
      v8 = sub_245443D9C();
      v10 = v9;
      v11 = v7;

      *a2 = v8;
      a2[1] = v10;
    }
    else
    {
      v12 = v13[0];
      sub_2454439B8();

      swift_willThrow();
    }
  }
  else
  {
    *a2 = 0;
    a2[1] = 0xE000000000000000;
  }
}

void sub_24544122C(uint64_t *a1@<X8>)
{
  uint64_t v1;

  sub_245441110(*(void **)(v1 + 32), a1);
}

Swift::String __swiftcall __spoils<CF,ZF,NF,VF,X0,X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,X21,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> StateCaptureClient.dataPath()()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  Swift::String result;
  uint64_t v4;
  void *v5;

  v1 = sub_245444030();
  if (!v0)
  {
    v1 = v4;
    v2 = v5;
  }
  result._object = v2;
  result._countAndFlagsBits = v1;
  return result;
}

void sub_2454412A4(uint64_t *a1@<X8>)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10[2];

  v10[1] = *(id *)MEMORY[0x24BDAC8D0];
  v2 = (void *)sub_245440D80();
  if (v2)
  {
    v10[0] = 0;
    v3 = objc_msgSend(v2, sel_dataPathAndReturnError_, v10);
    swift_unknownObjectRelease();
    v4 = v10[0];
    if (v3)
    {
      v5 = sub_245443D9C();
      v7 = v6;
      v8 = v4;

      *a1 = v5;
      a1[1] = v7;
    }
    else
    {
      v9 = v10[0];
      sub_2454439B8();

      swift_willThrow();
    }
  }
  else
  {
    *a1 = 0x6E776F6E6B6E55;
    a1[1] = 0xE700000000000000;
  }
}

void sub_2454413A8(uint64_t *a1@<X8>)
{
  sub_2454412A4(a1);
}

uint64_t method lookup function for StateCaptureClient()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_2454413CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440E7F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_245441414(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440E7F8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_245441454(void *a1)
{
  uint64_t v1;

  sub_2454408CC(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_24544145C()
{
  return swift_deallocObject();
}

uint64_t dispatch thunk of ReplicatorControlling.deviceUpdates.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ReplicatorControlling.devices.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ReplicatorControlling.pair(relationshipID:completion:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of ReplicatorControlling.unpair(relationshipID:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of ReplicatorControlling.retryStuckRelationships()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of ReplicatorControlling.setEnabled(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

void __swiftcall ClientDescriptor.init(id:entitlement:messageNotificationName:recordNotificationName:zoneDescriptors:messageDescriptors:)(ReplicatorServices::ClientDescriptor *__return_ptr retstr, Swift::String id, Swift::String entitlement, Swift::String messageNotificationName, Swift::String recordNotificationName, Swift::OpaquePointer zoneDescriptors, Swift::OpaquePointer messageDescriptors)
{
  _BYTE *rawValue;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  char v18;
  char v19;
  unint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  char v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  _QWORD *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char isUniquelyReferenced_nonNull_native;
  char v41;
  unint64_t v42;
  uint64_t v43;
  _BOOL8 v44;
  uint64_t v45;
  char v46;
  unint64_t v47;
  char v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v59;
  uint64_t v60;
  char v61;
  void *v62;

  object = messageNotificationName._object;
  countAndFlagsBits = messageNotificationName._countAndFlagsBits;
  rawValue = zoneDescriptors._rawValue;
  v8 = *((_QWORD *)zoneDescriptors._rawValue + 2);
  if (!v8)
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_18:
    v62 = v10;
    swift_bridgeObjectRelease();
    v32 = *((_QWORD *)messageDescriptors._rawValue + 2);
    if (!v32)
    {
      v34 = (_QWORD *)MEMORY[0x24BEE4B00];
LABEL_35:
      swift_bridgeObjectRelease();
      retstr->id = id;
      retstr->entitlement = entitlement;
      retstr->messageNotificationName._countAndFlagsBits = countAndFlagsBits;
      retstr->messageNotificationName._object = object;
      retstr->recordNotificationName = recordNotificationName;
      retstr->zoneDescriptors._rawValue = v62;
      retstr->messageDescriptors._rawValue = v34;
      return;
    }
    swift_bridgeObjectRetain();
    v33 = (uint64_t *)((char *)messageDescriptors._rawValue + 56);
    v34 = (_QWORD *)MEMORY[0x24BEE4B00];
    while (1)
    {
      v37 = *(v33 - 3);
      v36 = *(v33 - 2);
      v39 = *(v33 - 1);
      v38 = *v33;
      swift_bridgeObjectRetain_n();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v42 = sub_2453C64D8(v37, v36);
      v43 = v34[2];
      v44 = (v41 & 1) == 0;
      v45 = v43 + v44;
      if (__OFADD__(v43, v44))
        goto LABEL_37;
      v46 = v41;
      if (v34[3] >= v45)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          if ((v41 & 1) == 0)
            goto LABEL_29;
        }
        else
        {
          sub_2453CA284();
          if ((v46 & 1) == 0)
            goto LABEL_29;
        }
      }
      else
      {
        sub_2453C69E0(v45, isUniquelyReferenced_nonNull_native);
        v47 = sub_2453C64D8(v37, v36);
        if ((v46 & 1) != (v48 & 1))
          goto LABEL_40;
        v42 = v47;
        if ((v46 & 1) == 0)
        {
LABEL_29:
          v34[(v42 >> 6) + 8] |= 1 << v42;
          v49 = (uint64_t *)(v34[6] + 16 * v42);
          *v49 = v37;
          v49[1] = v36;
          v50 = (uint64_t *)(v34[7] + 32 * v42);
          *v50 = v37;
          v50[1] = v36;
          v50[2] = v39;
          v50[3] = v38;
          v51 = v34[2];
          v30 = __OFADD__(v51, 1);
          v52 = v51 + 1;
          if (v30)
            goto LABEL_39;
          v34[2] = v52;
          swift_bridgeObjectRetain();
          goto LABEL_21;
        }
      }
      v35 = (uint64_t *)(v34[7] + 32 * v42);
      swift_bridgeObjectRelease();
      *v35 = v37;
      v35[1] = v36;
      v35[2] = v39;
      v35[3] = v38;
LABEL_21:
      v33 += 4;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!--v32)
      {
        swift_bridgeObjectRelease();
        goto LABEL_35;
      }
    }
  }
  swift_bridgeObjectRetain();
  v9 = 0;
  v10 = (_QWORD *)MEMORY[0x24BEE4B00];
  while (1)
  {
    v13 = &rawValue[v9];
    v15 = *(_QWORD *)&rawValue[v9 + 32];
    v14 = *(_QWORD *)&rawValue[v9 + 40];
    v16 = rawValue[v9 + 48];
    v17 = rawValue[v9 + 49];
    v59 = *((_QWORD *)v13 + 7);
    v60 = *((_QWORD *)v13 + 8);
    v61 = v13[72];
    swift_bridgeObjectRetain_n();
    v18 = swift_isUniquelyReferenced_nonNull_native();
    v20 = sub_2453C64D8(v15, v14);
    v21 = v10[2];
    v22 = (v19 & 1) == 0;
    v23 = v21 + v22;
    if (__OFADD__(v21, v22))
      break;
    v24 = v19;
    if (v10[3] >= v23)
    {
      if ((v18 & 1) != 0)
      {
        if ((v19 & 1) == 0)
          goto LABEL_12;
      }
      else
      {
        sub_2453CA448();
        if ((v24 & 1) == 0)
          goto LABEL_12;
      }
    }
    else
    {
      sub_2453C6D0C(v23, v18);
      v25 = sub_2453C64D8(v15, v14);
      if ((v24 & 1) != (v26 & 1))
        goto LABEL_40;
      v20 = v25;
      if ((v24 & 1) == 0)
      {
LABEL_12:
        v10[(v20 >> 6) + 8] |= 1 << v20;
        v27 = (uint64_t *)(v10[6] + 16 * v20);
        *v27 = v15;
        v27[1] = v14;
        v28 = v10[7] + 48 * v20;
        *(_QWORD *)v28 = v15;
        *(_QWORD *)(v28 + 8) = v14;
        *(_BYTE *)(v28 + 16) = v16;
        *(_BYTE *)(v28 + 17) = v17;
        *(_QWORD *)(v28 + 24) = v59;
        *(_QWORD *)(v28 + 32) = v60;
        *(_BYTE *)(v28 + 40) = v61;
        v29 = v10[2];
        v30 = __OFADD__(v29, 1);
        v31 = v29 + 1;
        if (v30)
          goto LABEL_38;
        v10[2] = v31;
        swift_bridgeObjectRetain();
        goto LABEL_4;
      }
    }
    v11 = v10;
    v12 = v10[7] + 48 * v20;
    swift_bridgeObjectRelease();
    *(_QWORD *)v12 = v15;
    *(_QWORD *)(v12 + 8) = v14;
    *(_BYTE *)(v12 + 16) = v16;
    *(_BYTE *)(v12 + 17) = v17;
    *(_QWORD *)(v12 + 24) = v59;
    *(_QWORD *)(v12 + 32) = v60;
    *(_BYTE *)(v12 + 40) = v61;
    v10 = v11;
LABEL_4:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v9 += 48;
    --v8;
    rawValue = zoneDescriptors._rawValue;
    if (!v8)
    {
      swift_bridgeObjectRelease();
      goto LABEL_18;
    }
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  sub_2454443A8();
  __break(1u);
}

uint64_t ClientDescriptor.id.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClientDescriptor.id.setter(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *v2 = a1;
  v2[1] = a2;
  return result;
}

uint64_t (*ClientDescriptor.id.modify())()
{
  return nullsub_1;
}

uint64_t ClientDescriptor.entitlement.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClientDescriptor.entitlement.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ClientDescriptor.entitlement.modify())()
{
  return nullsub_1;
}

uint64_t ClientDescriptor.messageNotificationName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClientDescriptor.messageNotificationName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ClientDescriptor.messageNotificationName.modify())()
{
  return nullsub_1;
}

uint64_t ClientDescriptor.recordNotificationName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ClientDescriptor.recordNotificationName.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 48) = a1;
  *(_QWORD *)(v2 + 56) = a2;
  return result;
}

uint64_t (*ClientDescriptor.recordNotificationName.modify())()
{
  return nullsub_1;
}

uint64_t ClientDescriptor.zoneDescriptors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ClientDescriptor.zoneDescriptors.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 64) = a1;
  return result;
}

uint64_t (*ClientDescriptor.zoneDescriptors.modify())()
{
  return nullsub_1;
}

uint64_t ClientDescriptor.messageDescriptors.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t ClientDescriptor.messageDescriptors.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v1 + 72) = a1;
  return result;
}

uint64_t (*ClientDescriptor.messageDescriptors.modify())()
{
  return nullsub_1;
}

uint64_t ClientDescriptor.hash.getter()
{
  sub_2453F7094();
  return sub_245444090();
}

uint64_t ClientDescriptor.hash(into:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v4 = *(_QWORD *)(v1 + 64);
  v3 = *(_QWORD *)(v1 + 72);
  swift_bridgeObjectRetain();
  sub_245443DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245443DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245443DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245443DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245442EB0(a1, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245442CC0(a1, v3);
  return swift_bridgeObjectRelease();
}

uint64_t sub_245441C9C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  uint64_t v26;
  int v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v34;
  int64_t v35;
  uint64_t v36;
  int v37;
  uint64_t v38;
  int64_t v39;
  int v40;
  int v41;

  if (result == a2)
    return 1;
  v2 = a2;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v34 = result + 64;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 64);
  v35 = (unint64_t)(v5 + 63) >> 6;
  v36 = result;
  while (1)
  {
    if (v7)
    {
      v38 = (v7 - 1) & v7;
      v39 = v4;
      v8 = __clz(__rbit64(v7)) | (v4 << 6);
      goto LABEL_24;
    }
    v9 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_47;
    }
    if (v9 >= v35)
      return 1;
    v10 = *(_QWORD *)(v34 + 8 * v9);
    v11 = v4 + 1;
    if (!v10)
    {
      v11 = v4 + 2;
      if (v4 + 2 >= v35)
        return 1;
      v10 = *(_QWORD *)(v34 + 8 * v11);
      if (!v10)
      {
        v11 = v4 + 3;
        if (v4 + 3 >= v35)
          return 1;
        v10 = *(_QWORD *)(v34 + 8 * v11);
        if (!v10)
        {
          v11 = v4 + 4;
          if (v4 + 4 >= v35)
            return 1;
          v10 = *(_QWORD *)(v34 + 8 * v11);
          if (!v10)
            break;
        }
      }
    }
LABEL_23:
    v38 = (v10 - 1) & v10;
    v39 = v11;
    v8 = __clz(__rbit64(v10)) + (v11 << 6);
LABEL_24:
    v13 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v8);
    v14 = *v13;
    v15 = v13[1];
    v16 = *(_QWORD *)(v3 + 56) + 48 * v8;
    v18 = *(_QWORD *)v16;
    v17 = *(_QWORD *)(v16 + 8);
    v19 = *(unsigned __int8 *)(v16 + 16);
    v21 = *(_QWORD *)(v16 + 24);
    v20 = *(_QWORD *)(v16 + 32);
    v40 = *(unsigned __int8 *)(v16 + 40);
    v41 = *(unsigned __int8 *)(v16 + 17);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v22 = v2;
    v23 = sub_2453C64D8(v14, v15);
    v25 = v24;
    swift_bridgeObjectRelease();
    if ((v25 & 1) == 0)
      goto LABEL_44;
    v26 = *(_QWORD *)(v2 + 56) + 48 * v23;
    v27 = *(unsigned __int8 *)(v26 + 16);
    v28 = *(unsigned __int8 *)(v26 + 17);
    v30 = *(_QWORD *)(v26 + 24);
    v29 = *(_QWORD *)(v26 + 32);
    v37 = *(unsigned __int8 *)(v26 + 40);
    if (*(_QWORD *)v26 == v18 && *(_QWORD *)(v26 + 8) == v17)
    {
      if (v19 != v27)
        goto LABEL_44;
    }
    else if ((sub_245444390() & 1) == 0 || ((v19 ^ v27) & 1) != 0)
    {
LABEL_44:
      swift_bridgeObjectRelease();
      return 0;
    }
    swift_bridgeObjectRelease();
    result = 0;
    if (v28 == v41 && v30 == v21 && v29 == v20)
    {
      v2 = v22;
      v3 = v36;
      v7 = v38;
      v4 = v39;
      if (((v40 ^ v37) & 1) == 0)
        continue;
    }
    return result;
  }
  v12 = v4 + 5;
  if (v4 + 5 >= v35)
    return 1;
  v10 = *(_QWORD *)(v34 + 8 * v12);
  if (v10)
  {
    v11 = v4 + 5;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v12 + 1;
    if (__OFADD__(v12, 1))
      break;
    if (v11 >= v35)
      return 1;
    v10 = *(_QWORD *)(v34 + 8 * v11);
    ++v12;
    if (v10)
      goto LABEL_23;
  }
LABEL_47:
  __break(1u);
  return result;
}

uint64_t sub_245441F44(uint64_t result, uint64_t a2)
{
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char v25;
  char v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  BOOL v32;
  uint64_t v33;
  int64_t v34;
  int64_t v35;

  if (result == a2)
    return 1;
  v3 = result;
  if (*(_QWORD *)(result + 16) != *(_QWORD *)(a2 + 16))
    return 0;
  v4 = 0;
  v33 = result + 64;
  v5 = 1 << *(_BYTE *)(result + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(result + 64);
  v34 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v9 = __clz(__rbit64(v7));
      v7 &= v7 - 1;
      v35 = v4;
      v10 = v9 | (v4 << 6);
      goto LABEL_29;
    }
    v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_45;
    }
    if (v11 >= v34)
      return 1;
    v12 = *(_QWORD *)(v33 + 8 * v11);
    v13 = v4 + 1;
    if (!v12)
    {
      v13 = v4 + 2;
      if (v4 + 2 >= v34)
        return 1;
      v12 = *(_QWORD *)(v33 + 8 * v13);
      if (!v12)
      {
        v13 = v4 + 3;
        if (v4 + 3 >= v34)
          return 1;
        v12 = *(_QWORD *)(v33 + 8 * v13);
        if (!v12)
        {
          v13 = v4 + 4;
          if (v4 + 4 >= v34)
            return 1;
          v12 = *(_QWORD *)(v33 + 8 * v13);
          if (!v12)
            break;
        }
      }
    }
LABEL_28:
    v7 = (v12 - 1) & v12;
    v35 = v13;
    v10 = __clz(__rbit64(v12)) + (v13 << 6);
LABEL_29:
    v15 = v3;
    v16 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
    v17 = *v16;
    v18 = v16[1];
    v19 = (uint64_t *)(*(_QWORD *)(v3 + 56) + 32 * v10);
    v21 = *v19;
    v20 = v19[1];
    v22 = v19[2];
    v23 = v19[3];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v24 = sub_2453C64D8(v17, v18);
    v26 = v25;
    swift_bridgeObjectRelease();
    if ((v26 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    v27 = (_QWORD *)(*(_QWORD *)(a2 + 56) + 32 * v24);
    v29 = v27[2];
    v28 = v27[3];
    if (*v27 == v21 && v27[1] == v20)
    {
      result = swift_bridgeObjectRelease();
      v8 = v29 == v22 && v28 == v23;
      v3 = v15;
      v4 = v35;
      if (!v8)
        return 0;
    }
    else
    {
      v31 = sub_245444390();
      swift_bridgeObjectRelease();
      result = 0;
      if ((v31 & 1) == 0)
        return result;
      v32 = v29 == v22 && v28 == v23;
      v3 = v15;
      v4 = v35;
      if (!v32)
        return result;
    }
  }
  v14 = v4 + 5;
  if (v4 + 5 >= v34)
    return 1;
  v12 = *(_QWORD *)(v33 + 8 * v14);
  if (v12)
  {
    v13 = v4 + 5;
    goto LABEL_28;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v34)
      return 1;
    v12 = *(_QWORD *)(v33 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_28;
  }
LABEL_45:
  __break(1u);
  return result;
}

uint64_t sub_2454421B8(unsigned __int8 a1)
{
  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_2454421E0 + 4 * byte_24544D4E0[a1]))(25705, 0xE200000000000000);
}

uint64_t sub_2454421E0()
{
  return 0x6D656C7469746E65;
}

unint64_t sub_245442200()
{
  return 0xD000000000000017;
}

uint64_t sub_24544223C()
{
  return 0x63736544656E6F7ALL;
}

unint64_t sub_245442260()
{
  return 0xD000000000000012;
}

uint64_t sub_24544227C()
{
  unsigned __int8 *v0;

  return sub_2454421B8(*v0);
}

uint64_t sub_245442284@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_245443668(a1, a2);
  *a3 = result;
  return result;
}

void sub_2454422A8(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_2454422B4()
{
  sub_245443240();
  return sub_245444468();
}

uint64_t sub_2454422DC()
{
  sub_245443240();
  return sub_245444474();
}

uint64_t ClientDescriptor.encode(to:)(_QWORD *a1)
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t v23;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440EB28);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = v1[2];
  v19 = v1[3];
  v20 = v7;
  v8 = v1[4];
  v17 = v1[5];
  v18 = v8;
  v9 = v1[6];
  v15 = v1[7];
  v16 = v9;
  v10 = v1[8];
  v13 = v1[9];
  v14 = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245443240();
  sub_24544445C();
  LOBYTE(v23) = 0;
  v11 = v21;
  sub_245444348();
  if (!v11)
  {
    LOBYTE(v23) = 1;
    sub_245444348();
    LOBYTE(v23) = 2;
    sub_245444348();
    LOBYTE(v23) = 3;
    sub_245444348();
    v23 = v14;
    v22 = 4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25440EAD8);
    sub_2454432C8(&qword_25440EAE0, &qword_25440EAD8, (uint64_t (*)(void))sub_245443284);
    sub_245444360();
    v23 = v13;
    v22 = 5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25440EAE8);
    sub_2454432C8(&qword_25440EAF0, &qword_25440EAE8, (uint64_t (*)(void))sub_245443334);
    sub_245444360();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t ClientDescriptor.hashValue.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  sub_245444414();
  swift_bridgeObjectRetain();
  sub_245443DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245443DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245443DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245443DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245442EB0((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245442CC0((uint64_t)v4, v1);
  swift_bridgeObjectRelease();
  return sub_245444444();
}

uint64_t ClientDescriptor.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
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
  uint64_t v15;
  uint64_t v16;
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
  char v34;
  uint64_t v35;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25440EB78);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_245443240();
  sub_245444450();
  if (v2)
    return __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  LOBYTE(v35) = 0;
  v9 = sub_2454442C4();
  v11 = v10;
  LOBYTE(v35) = 1;
  swift_bridgeObjectRetain();
  v31 = sub_2454442C4();
  v32 = v9;
  LOBYTE(v35) = 2;
  v13 = v12;
  swift_bridgeObjectRetain();
  v14 = sub_2454442C4();
  v33 = v15;
  v27 = v14;
  v29 = v13;
  LOBYTE(v35) = 3;
  swift_bridgeObjectRetain();
  v28 = 0;
  v26 = sub_2454442C4();
  v17 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440EAD8);
  v34 = 4;
  sub_245443378(&qword_25440EB60, &qword_25440EAD8, (uint64_t (*)(void))sub_2454433E4);
  v30 = v17;
  swift_bridgeObjectRetain();
  sub_2454442DC();
  v19 = v35;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25440EAE8);
  v34 = 5;
  sub_245443378(&qword_25440EB68, &qword_25440EAE8, (uint64_t (*)(void))sub_245443428);
  v25 = v19;
  swift_bridgeObjectRetain();
  sub_2454442DC();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v20 = v35;
  swift_bridgeObjectRetain();
  v21 = v29;
  swift_bridgeObjectRetain();
  v22 = v33;
  swift_bridgeObjectRetain();
  v23 = v30;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *a2 = v32;
  a2[1] = v11;
  a2[2] = v31;
  a2[3] = v21;
  a2[4] = v27;
  a2[5] = v22;
  v24 = v25;
  a2[6] = v26;
  a2[7] = v23;
  a2[8] = v24;
  a2[9] = v20;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_245442B6C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return ClientDescriptor.init(from:)(a1, a2);
}

uint64_t sub_245442B80(_QWORD *a1)
{
  return ClientDescriptor.encode(to:)(a1);
}

uint64_t sub_245442B9C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE v4[72];

  v2 = *(_QWORD *)(v0 + 64);
  v1 = *(_QWORD *)(v0 + 72);
  sub_245444414();
  swift_bridgeObjectRetain();
  sub_245443DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245443DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245443DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245443DF0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245442EB0((uint64_t)v4, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_245442CC0((uint64_t)v4, v1);
  swift_bridgeObjectRelease();
  return sub_245444444();
}

uint64_t sub_245442CC0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  uint64_t v12;

  v12 = a2 + 64;
  v2 = 1 << *(_BYTE *)(a2 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a2 + 64);
  v11 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v6 = 0;
  v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      goto LABEL_5;
    }
    v8 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v8 >= v11)
      goto LABEL_19;
    v9 = *(_QWORD *)(v12 + 8 * v8);
    ++v7;
    if (!v9)
    {
      v7 = v8 + 1;
      if (v8 + 1 >= v11)
        goto LABEL_19;
      v9 = *(_QWORD *)(v12 + 8 * v7);
      if (!v9)
        break;
    }
LABEL_18:
    v4 = (v9 - 1) & v9;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_245443DF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_245443DF0();
    swift_bridgeObjectRelease();
    sub_245444438();
    sub_245444438();
    swift_bridgeObjectRelease();
    result = sub_245444444();
    v6 ^= result;
  }
  v10 = v8 + 2;
  if (v10 >= v11)
  {
LABEL_19:
    swift_release();
    return sub_245444420();
  }
  v9 = *(_QWORD *)(v12 + 8 * v10);
  if (v9)
  {
    v7 = v10;
    goto LABEL_18;
  }
  while (1)
  {
    v7 = v10 + 1;
    if (__OFADD__(v10, 1))
      break;
    if (v7 >= v11)
      goto LABEL_19;
    v9 = *(_QWORD *)(v12 + 8 * v7);
    ++v10;
    if (v9)
      goto LABEL_18;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t sub_245442EB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  int64_t v14;

  v13 = a2 + 64;
  v2 = 1 << *(_BYTE *)(a2 + 32);
  v3 = -1;
  if (v2 < 64)
    v3 = ~(-1 << v2);
  v4 = v3 & *(_QWORD *)(a2 + 64);
  v12 = (unint64_t)(v2 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v6 = 0;
  v7 = 0;
  while (1)
  {
    if (v4)
    {
      v4 &= v4 - 1;
      v14 = v7;
      goto LABEL_5;
    }
    v8 = v7 + 1;
    if (__OFADD__(v7, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    if (v8 >= v12)
      goto LABEL_19;
    v9 = *(_QWORD *)(v13 + 8 * v8);
    v10 = v7 + 1;
    if (!v9)
    {
      v10 = v7 + 2;
      if (v7 + 2 >= v12)
        goto LABEL_19;
      v9 = *(_QWORD *)(v13 + 8 * v10);
      if (!v9)
        break;
    }
LABEL_18:
    v4 = (v9 - 1) & v9;
    v14 = v10;
LABEL_5:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_245443DF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_245443DF0();
    swift_bridgeObjectRelease();
    sub_245444438();
    sub_245444438();
    sub_245444438();
    sub_245444438();
    sub_24544442C();
    swift_bridgeObjectRelease();
    result = sub_245444444();
    v7 = v14;
    v6 ^= result;
  }
  v11 = v7 + 3;
  if (v7 + 3 >= v12)
  {
LABEL_19:
    swift_release();
    return sub_245444420();
  }
  v9 = *(_QWORD *)(v13 + 8 * v11);
  if (v9)
  {
    v10 = v7 + 3;
    goto LABEL_18;
  }
  while (1)
  {
    v10 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v10 >= v12)
      goto LABEL_19;
    v9 = *(_QWORD *)(v13 + 8 * v10);
    ++v11;
    if (v9)
      goto LABEL_18;
  }
LABEL_21:
  __break(1u);
  return result;
}

uint64_t _s18ReplicatorServices16ClientDescriptorV2eeoiySbAC_ACtFZ_0(_QWORD *a1, _QWORD *a2)
{
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v2 = a1[2];
  v3 = a1[3];
  v4 = a1[4];
  v5 = a1[5];
  v17 = a1[7];
  v18 = a1[6];
  v7 = a2[2];
  v6 = a2[3];
  v8 = a2[4];
  v9 = a2[5];
  v10 = a2[6];
  v11 = a2[7];
  v15 = a2[8];
  v16 = a1[8];
  v13 = a2[9];
  v14 = a1[9];
  if ((*a1 == *a2 && a1[1] == a2[1] || (sub_245444390() & 1) != 0)
    && (v2 == v7 && v3 == v6 || (sub_245444390() & 1) != 0)
    && (v4 == v8 && v5 == v9 || (sub_245444390() & 1) != 0)
    && (v18 == v10 && v17 == v11 || (sub_245444390() & 1) != 0)
    && (sub_245441C9C(v16, v15) & 1) != 0)
  {
    return sub_245441F44(v14, v13);
  }
  else
  {
    return 0;
  }
}

unint64_t sub_245443240()
{
  unint64_t result;

  result = qword_25440E990;
  if (!qword_25440E990)
  {
    result = MEMORY[0x249534380](&unk_24544D6D4, &type metadata for ClientDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25440E990);
  }
  return result;
}

unint64_t sub_245443284()
{
  unint64_t result;

  result = qword_25440E988;
  if (!qword_25440E988)
  {
    result = MEMORY[0x249534380](&protocol conformance descriptor for ZoneDescriptor, &type metadata for ZoneDescriptor);
    atomic_store(result, (unint64_t *)&qword_25440E988);
  }
  return result;
}

uint64_t sub_2454432C8(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    v8[0] = MEMORY[0x24BEE0D08];
    v8[1] = v7;
    result = MEMORY[0x249534380](MEMORY[0x24BEE04C0], v6, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_245443334()
{
  unint64_t result;

  result = qword_25440E9C0;
  if (!qword_25440E9C0)
  {
    result = MEMORY[0x249534380](&protocol conformance descriptor for MessageDescriptor, &type metadata for MessageDescriptor);
    atomic_store(result, (unint64_t *)&qword_25440E9C0);
  }
  return result;
}

uint64_t sub_245443378(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7 = a3();
    v8[0] = MEMORY[0x24BEE0D38];
    v8[1] = v7;
    result = MEMORY[0x249534380](MEMORY[0x24BEE04E0], v6, v8);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_2454433E4()
{
  unint64_t result;

  result = qword_25440EB38;
  if (!qword_25440EB38)
  {
    result = MEMORY[0x249534380](&protocol conformance descriptor for ZoneDescriptor, &type metadata for ZoneDescriptor);
    atomic_store(result, (unint64_t *)&qword_25440EB38);
  }
  return result;
}

unint64_t sub_245443428()
{
  unint64_t result;

  result = qword_25440EB48;
  if (!qword_25440EB48)
  {
    result = MEMORY[0x249534380](&protocol conformance descriptor for MessageDescriptor, &type metadata for MessageDescriptor);
    atomic_store(result, (unint64_t *)&qword_25440EB48);
  }
  return result;
}

unint64_t sub_245443470()
{
  unint64_t result;

  result = qword_25440E9B8;
  if (!qword_25440E9B8)
  {
    result = MEMORY[0x249534380](&protocol conformance descriptor for ClientDescriptor, &type metadata for ClientDescriptor);
    atomic_store(result, (unint64_t *)&qword_25440E9B8);
  }
  return result;
}

ValueMetadata *type metadata accessor for ClientDescriptor()
{
  return &type metadata for ClientDescriptor;
}

uint64_t storeEnumTagSinglePayload for ClientDescriptor.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_245443510 + 4 * byte_24544D4EB[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_245443544 + 4 * byte_24544D4E6[v4]))();
}

uint64_t sub_245443544(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24544354C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x245443554);
  return result;
}

uint64_t sub_245443560(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x245443568);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_24544356C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_245443574(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ClientDescriptor.CodingKeys()
{
  return &type metadata for ClientDescriptor.CodingKeys;
}

unint64_t sub_245443594()
{
  unint64_t result;

  result = qword_257465980;
  if (!qword_257465980)
  {
    result = MEMORY[0x249534380](&unk_24544D6AC, &type metadata for ClientDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_257465980);
  }
  return result;
}

unint64_t sub_2454435DC()
{
  unint64_t result;

  result = qword_25440E9A0;
  if (!qword_25440E9A0)
  {
    result = MEMORY[0x249534380](&unk_24544D61C, &type metadata for ClientDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25440E9A0);
  }
  return result;
}

unint64_t sub_245443624()
{
  unint64_t result;

  result = qword_25440E998;
  if (!qword_25440E998)
  {
    result = MEMORY[0x249534380](&unk_24544D644, &type metadata for ClientDescriptor.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_25440E998);
  }
  return result;
}

uint64_t sub_245443668(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 25705 && a2 == 0xE200000000000000;
  if (v2 || (sub_245444390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D656C7469746E65 && a2 == 0xEB00000000746E65 || (sub_245444390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0xD000000000000017 && a2 == 0x800000024544F4F0 || (sub_245444390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0xD000000000000016 && a2 == 0x800000024544F510 || (sub_245444390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x63736544656E6F7ALL && a2 == 0xEF73726F74706972 || (sub_245444390() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0xD000000000000012 && a2 == 0x800000024544F530)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_245444390();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

uint64_t sub_2454438F8()
{
  return MEMORY[0x24BDCAFE0]();
}

uint64_t sub_245443904()
{
  return MEMORY[0x24BDCBBA0]();
}

uint64_t sub_245443910()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_24544391C()
{
  return MEMORY[0x24BDCBBD0]();
}

uint64_t sub_245443928()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_245443934()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_245443940()
{
  return MEMORY[0x24BDCBC10]();
}

uint64_t sub_24544394C()
{
  return MEMORY[0x24BDCCA20]();
}

uint64_t sub_245443958()
{
  return MEMORY[0x24BDCCA40]();
}

uint64_t sub_245443964()
{
  return MEMORY[0x24BDCCA48]();
}

uint64_t sub_245443970()
{
  return MEMORY[0x24BDCCA58]();
}

uint64_t sub_24544397C()
{
  return MEMORY[0x24BDCCA60]();
}

uint64_t sub_245443988()
{
  return MEMORY[0x24BDCCA88]();
}

uint64_t sub_245443994()
{
  return MEMORY[0x24BDCCA90]();
}

uint64_t sub_2454439A0()
{
  return MEMORY[0x24BDCD2C0]();
}

uint64_t sub_2454439AC()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2454439B8()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2454439C4()
{
  return MEMORY[0x24BDCD750]();
}

uint64_t sub_2454439D0()
{
  return MEMORY[0x24BDCD7B8]();
}

uint64_t sub_2454439DC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_2454439E8()
{
  return MEMORY[0x24BDCD968]();
}

uint64_t sub_2454439F4()
{
  return MEMORY[0x24BDCD9A0]();
}

uint64_t sub_245443A00()
{
  return MEMORY[0x24BDCD9E8]();
}

uint64_t sub_245443A0C()
{
  return MEMORY[0x24BDCD9F8]();
}

uint64_t sub_245443A18()
{
  return MEMORY[0x24BDCDAA0]();
}

uint64_t sub_245443A24()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_245443A30()
{
  return MEMORY[0x24BDCDB60]();
}

uint64_t sub_245443A3C()
{
  return MEMORY[0x24BDCDB80]();
}

uint64_t sub_245443A48()
{
  return MEMORY[0x24BDCDBB0]();
}

uint64_t sub_245443A54()
{
  return MEMORY[0x24BDCDBC8]();
}

uint64_t sub_245443A60()
{
  return MEMORY[0x24BDCDC10]();
}

uint64_t sub_245443A6C()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_245443A78()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_245443A84()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_245443A90()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_245443A9C()
{
  return MEMORY[0x24BDCE858]();
}

uint64_t sub_245443AA8()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_245443AB4()
{
  return MEMORY[0x24BDCE880]();
}

uint64_t sub_245443AC0()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_245443ACC()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_245443AD8()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_245443AE4()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_245443AF0()
{
  return MEMORY[0x24BDCE9E0]();
}

uint64_t sub_245443AFC()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_245443B08()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_245443B14()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_245443B20()
{
  return MEMORY[0x24BE7F420]();
}

uint64_t sub_245443B2C()
{
  return MEMORY[0x24BE7F490]();
}

uint64_t sub_245443B38()
{
  return MEMORY[0x24BE7F4F0]();
}

uint64_t sub_245443B44()
{
  return MEMORY[0x24BE7F4F8]();
}

uint64_t sub_245443B50()
{
  return MEMORY[0x24BE7F500]();
}

uint64_t sub_245443B5C()
{
  return MEMORY[0x24BE7F508]();
}

uint64_t sub_245443B68()
{
  return MEMORY[0x24BE7F510]();
}

uint64_t sub_245443B74()
{
  return MEMORY[0x24BE7F648]();
}

uint64_t sub_245443B80()
{
  return MEMORY[0x24BE7F650]();
}

uint64_t sub_245443B8C()
{
  return MEMORY[0x24BE7F658]();
}

uint64_t sub_245443B98()
{
  return MEMORY[0x24BE7F660]();
}

uint64_t _s18ReplicatorServices0A6HasherV8finalize10Foundation4UUIDVyF_0()
{
  return MEMORY[0x24BE7F668]();
}

uint64_t sub_245443BB0()
{
  return MEMORY[0x24BE7F670]();
}

uint64_t sub_245443BBC()
{
  return MEMORY[0x24BE7F678]();
}

uint64_t sub_245443BC8()
{
  return MEMORY[0x24BE7F6E8]();
}

uint64_t sub_245443BD4()
{
  return MEMORY[0x24BE7F6F0]();
}

uint64_t sub_245443BE0()
{
  return MEMORY[0x24BE7F6F8]();
}

uint64_t sub_245443BEC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_245443BF8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_245443C04()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_245443C10()
{
  return MEMORY[0x24BEE7698]();
}

uint64_t sub_245443C1C()
{
  return MEMORY[0x24BEE76B0]();
}

uint64_t sub_245443C28()
{
  return MEMORY[0x24BDB9B40]();
}

uint64_t sub_245443C34()
{
  return MEMORY[0x24BDB9C78]();
}

uint64_t sub_245443C40()
{
  return MEMORY[0x24BDB9C90]();
}

uint64_t sub_245443C4C()
{
  return MEMORY[0x24BDB9CC0]();
}

uint64_t sub_245443C58()
{
  return MEMORY[0x24BDB9D00]();
}

uint64_t sub_245443C64()
{
  return MEMORY[0x24BDB9F20]();
}

uint64_t sub_245443C70()
{
  return MEMORY[0x24BDBA110]();
}

uint64_t sub_245443C7C()
{
  return MEMORY[0x24BEE5428]();
}

uint64_t sub_245443C88()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_245443C94()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_245443CA0()
{
  return MEMORY[0x24BEE54E0]();
}

uint64_t sub_245443CAC()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_245443CB8()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_245443CC4()
{
  return MEMORY[0x24BEE5578]();
}

uint64_t sub_245443CD0()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_245443CDC()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_245443CE8()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_245443CF4()
{
  return MEMORY[0x24BEE01A8]();
}

uint64_t sub_245443D00()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_245443D0C()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_245443D18()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_245443D24()
{
  return MEMORY[0x24BEE0458]();
}

uint64_t sub_245443D30()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_245443D3C()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_245443D48()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_245443D54()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_245443D60()
{
  return MEMORY[0x24BEE0618]();
}

uint64_t sub_245443D6C()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_245443D78()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_245443D84()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_245443D90()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_245443D9C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245443DA8()
{
  return MEMORY[0x24BDCFAC8]();
}

uint64_t sub_245443DB4()
{
  return MEMORY[0x24BDCFAE8]();
}

uint64_t sub_245443DC0()
{
  return MEMORY[0x24BDCFAF8]();
}

uint64_t sub_245443DCC()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_245443DD8()
{
  return MEMORY[0x24BEE0A30]();
}

uint64_t sub_245443DE4()
{
  return MEMORY[0x24BEE0A50]();
}

uint64_t sub_245443DF0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_245443DFC()
{
  return MEMORY[0x24BEE0B68]();
}

uint64_t sub_245443E08()
{
  return MEMORY[0x24BEE0B80]();
}

uint64_t sub_245443E14()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_245443E20()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_245443E2C()
{
  return MEMORY[0x24BEE0DE0]();
}

uint64_t sub_245443E38()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_245443E44()
{
  return MEMORY[0x24BEE0EB0]();
}

uint64_t sub_245443E50()
{
  return MEMORY[0x24BEE1018]();
}

uint64_t sub_245443E5C()
{
  return MEMORY[0x24BEE1040]();
}

uint64_t sub_245443E68()
{
  return MEMORY[0x24BEE1098]();
}

uint64_t sub_245443E74()
{
  return MEMORY[0x24BEE10C0]();
}

uint64_t sub_245443E80()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_245443E8C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_245443E98()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_245443EA4()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_245443EB0()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_245443EBC()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_245443EC8()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_245443ED4()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_245443EE0()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_245443EEC()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_245443EF8()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_245443F04()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_245443F10()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_245443F1C()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_245443F28()
{
  return MEMORY[0x24BEE69E8]();
}

uint64_t sub_245443F34()
{
  return MEMORY[0x24BEE69F8]();
}

uint64_t sub_245443F40()
{
  return MEMORY[0x24BEE6A18]();
}

uint64_t sub_245443F4C()
{
  return MEMORY[0x24BEE6A30]();
}

uint64_t sub_245443F58()
{
  return MEMORY[0x24BEE6A40]();
}

uint64_t sub_245443F64()
{
  return MEMORY[0x24BEE6A50]();
}

uint64_t sub_245443F70()
{
  return MEMORY[0x24BEE6A58]();
}

uint64_t sub_245443F7C()
{
  return MEMORY[0x24BEE6AA0]();
}

uint64_t sub_245443F88()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_245443F94()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_245443FA0()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_245443FAC()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_245443FB8()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_245443FC4()
{
  return MEMORY[0x24BDCFE50]();
}

uint64_t sub_245443FD0()
{
  return MEMORY[0x24BDCFE60]();
}

uint64_t sub_245443FDC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_245443FE8()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_245443FF4()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_245444000()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_24544400C()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_245444018()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_245444024()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_245444030()
{
  return MEMORY[0x24BEE5780]();
}

uint64_t sub_24544403C()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_245444048()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_245444054()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_245444060()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_24544406C()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_245444078()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_245444084()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_245444090()
{
  return MEMORY[0x24BDD05F0]();
}

uint64_t sub_24544409C()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_2454440A8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_2454440B4()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_2454440C0()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_2454440CC()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_2454440D8()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_2454440E4()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_2454440F0()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_2454440FC()
{
  return MEMORY[0x24BEE2360]();
}

uint64_t sub_245444108()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_245444114()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_245444120()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_24544412C()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_245444138()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_245444144()
{
  return MEMORY[0x24BEE2568]();
}

uint64_t sub_245444150()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24544415C()
{
  return MEMORY[0x24BEE26E8]();
}

uint64_t sub_245444168()
{
  return MEMORY[0x24BEE2710]();
}

uint64_t sub_245444174()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_245444180()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_24544418C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_245444198()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_2454441A4()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_2454441B0()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_2454441BC()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_2454441C8()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_2454441D4()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_2454441E0()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_2454441EC()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_2454441F8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_245444204()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_245444210()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_24544421C()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_245444228()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_245444234()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_245444240()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_24544424C()
{
  return MEMORY[0x24BEE3270]();
}

uint64_t sub_245444258()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_245444264()
{
  return MEMORY[0x24BEE32B8]();
}

uint64_t sub_245444270()
{
  return MEMORY[0x24BEE32C0]();
}

uint64_t sub_24544427C()
{
  return MEMORY[0x24BEE32D8]();
}

uint64_t sub_245444288()
{
  return MEMORY[0x24BEE32E0]();
}

uint64_t sub_245444294()
{
  return MEMORY[0x24BEE32E8]();
}

uint64_t sub_2454442A0()
{
  return MEMORY[0x24BEE32F8]();
}

uint64_t sub_2454442AC()
{
  return MEMORY[0x24BEE3308]();
}

uint64_t sub_2454442B8()
{
  return MEMORY[0x24BEE3348]();
}

uint64_t sub_2454442C4()
{
  return MEMORY[0x24BEE3350]();
}

uint64_t sub_2454442D0()
{
  return MEMORY[0x24BEE3358]();
}

uint64_t sub_2454442DC()
{
  return MEMORY[0x24BEE3380]();
}

uint64_t sub_2454442E8()
{
  return MEMORY[0x24BEE33C0]();
}

uint64_t sub_2454442F4()
{
  return MEMORY[0x24BEE33C8]();
}

uint64_t sub_245444300()
{
  return MEMORY[0x24BEE3408]();
}

uint64_t sub_24544430C()
{
  return MEMORY[0x24BEE3428]();
}

uint64_t sub_245444318()
{
  return MEMORY[0x24BEE3438]();
}

uint64_t sub_245444324()
{
  return MEMORY[0x24BEE3448]();
}

uint64_t sub_245444330()
{
  return MEMORY[0x24BEE3458]();
}

uint64_t sub_24544433C()
{
  return MEMORY[0x24BEE3490]();
}

uint64_t sub_245444348()
{
  return MEMORY[0x24BEE34A0]();
}

uint64_t sub_245444354()
{
  return MEMORY[0x24BEE34A8]();
}

uint64_t sub_245444360()
{
  return MEMORY[0x24BEE34D0]();
}

uint64_t sub_24544436C()
{
  return MEMORY[0x24BEE3510]();
}

uint64_t sub_245444378()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_245444384()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_245444390()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24544439C()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_2454443A8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_2454443B4()
{
  return MEMORY[0x24BDD06E0]();
}

uint64_t sub_2454443C0()
{
  return MEMORY[0x24BDD06F0]();
}

uint64_t sub_2454443CC()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_2454443D8()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_2454443E4()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_2454443F0()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_2454443FC()
{
  return MEMORY[0x24BEE42C0]();
}

uint64_t sub_245444408()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_245444414()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_245444420()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24544442C()
{
  return MEMORY[0x24BEE4300]();
}

uint64_t sub_245444438()
{
  return MEMORY[0x24BEE4318]();
}

uint64_t sub_245444444()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_245444450()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24544445C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_245444468()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_245444474()
{
  return MEMORY[0x24BEE4A10]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _objc_autoreleasePoolPop()
{
  return MEMORY[0x24BEDCE10]();
}

uint64_t _objc_autoreleasePoolPush()
{
  return MEMORY[0x24BEDCE18]();
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

compression_status compression_stream_destroy(compression_stream *stream)
{
  return MEMORY[0x24BEDB998](stream);
}

compression_status compression_stream_init(compression_stream *stream, compression_stream_operation operation, compression_algorithm algorithm)
{
  return MEMORY[0x24BEDB9A8](stream, *(_QWORD *)&operation, *(_QWORD *)&algorithm);
}

compression_status compression_stream_process(compression_stream *stream, int flags)
{
  return MEMORY[0x24BEDB9B0](stream, *(_QWORD *)&flags);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x24BDAEA80](path, namebuff, size, *(_QWORD *)&options);
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

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
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

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getFunctionTypeMetadata1()
{
  return MEMORY[0x24BEE4D60]();
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

uint64_t swift_getTupleTypeMetadata()
{
  return MEMORY[0x24BEE4DF0]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initEnumMetadataSinglePayload()
{
  return MEMORY[0x24BEE4E40]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x24BEE4F48]();
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

xpc_object_t xpc_fd_create(int fd)
{
  return (xpc_object_t)MEMORY[0x24BDB0A40](*(_QWORD *)&fd);
}

int xpc_fd_dup(xpc_object_t xfd)
{
  return MEMORY[0x24BDB0A48](xfd);
}

