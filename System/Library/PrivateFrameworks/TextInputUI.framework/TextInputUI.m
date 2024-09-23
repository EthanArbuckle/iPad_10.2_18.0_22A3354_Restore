unint64_t sub_18C792F98()
{
  unint64_t result;

  result = qword_1ECF670B8;
  if (!qword_1ECF670B8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ECF670B8);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x18D787A40]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_18C793014()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ECF67080;
  if (!qword_1ECF67080)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ECF67078);
    result = MEMORY[0x18D787A58](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ECF67080);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x18D787A4C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_18C7930A4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_currentStatus;
  swift_beginAccess();
  v4 = sub_18C802B18();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t sub_18C793108(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_currentStatus;
  swift_beginAccess();
  v4 = sub_18C802B18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_18C793174())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_18C793204()
{
  swift_beginAccess();
  return swift_unknownObjectRetain();
}

uint64_t sub_18C7932B0(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_delegate);
  swift_beginAccess();
  *v3 = a1;
  return swift_unknownObjectRelease();
}

uint64_t (*sub_18C793300())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

char *sub_18C793344()
{
  char *v0;
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
  objc_class *v13;
  id v14;
  char *v15;
  void *v16;
  id v17;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  objc_super v30;

  v1 = sub_18C802B18();
  v23 = *(_QWORD *)(v1 - 8);
  v24 = v1;
  MEMORY[0x1E0C80A78]();
  v26 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_18C802B30();
  v27 = *(_QWORD *)(v3 - 8);
  v28 = v3;
  MEMORY[0x1E0C80A78]();
  v25 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_18C802BF0();
  v5 = *(_QWORD *)(v22 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C802BE4();
  MEMORY[0x1E0C80A78]();
  sub_18C802B48();
  MEMORY[0x1E0C80A78]();
  v8 = OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_monitor;
  sub_18C802B00();
  swift_allocObject();
  v9 = v0;
  *(_QWORD *)&v0[v8] = sub_18C802AF4();
  v10 = OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_networkMonitorQueue;
  sub_18C792F98();
  sub_18C802B3C();
  v29 = MEMORY[0x1E0DEE9D8];
  sub_18C793CE8(&qword_1ECF67088, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810], MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECF67078);
  sub_18C793014();
  sub_18C802C68();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF8D0], v22);
  *(_QWORD *)&v9[v10] = sub_18C802BFC();
  v12 = v23;
  v11 = v24;
  (*(void (**)(char *, _QWORD, uint64_t))(v23 + 104))(&v9[OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_currentStatus], *MEMORY[0x1E0CCEA98], v24);
  *(_QWORD *)&v9[OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_delegate] = 0;

  v13 = (objc_class *)type metadata accessor for TUINetworkObserver();
  v30.receiver = v9;
  v30.super_class = v13;
  v14 = objc_msgSendSuper2(&v30, sel_init);
  *(_QWORD *)(swift_allocObject() + 16) = v14;
  v15 = (char *)v14;
  swift_retain();
  sub_18C79379C((uint64_t)sub_18C793764);
  sub_18C802ADC();
  swift_release();
  swift_release();
  v16 = *(void **)&v15[OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_networkMonitorQueue];
  swift_retain();
  v17 = v16;
  sub_18C802AE8();
  swift_release();

  v18 = v25;
  sub_18C802AD0();
  v19 = v26;
  sub_18C802B24();

  (*(void (**)(char *, uint64_t))(v27 + 8))(v18, v28);
  v20 = &v15[OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_currentStatus];
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v12 + 40))(v20, v19, v11);
  swift_endAccess();
  return v15;
}

uint64_t type metadata accessor for TUINetworkObserver()
{
  uint64_t result;

  result = qword_1ECF67110;
  if (!qword_1ECF67110)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_18C793740()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_18C793764()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & **(_QWORD **)(v0 + 16)) + 0xA8))();
}

uint64_t sub_18C79379C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_18C7937CC()
{
  char *v0;
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  char *v5;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  uint64_t v8;
  _QWORD aBlock[6];
  unsigned __int8 v10;

  v10 = 0;
  v1 = *(NSObject **)&v0[OBJC_IVAR____TtC11TextInputUI18TUINetworkObserver_networkMonitorQueue];
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = &v10;
  *(_QWORD *)(v2 + 24) = v0;
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = sub_18C793A78;
  *(_QWORD *)(v3 + 24) = v2;
  aBlock[4] = sub_18C793A90;
  aBlock[5] = v3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18C793AB0;
  aBlock[3] = &block_descriptor;
  v4 = _Block_copy(aBlock);
  v5 = v0;
  swift_retain();
  swift_release();
  dispatch_sync(v1, v4);
  _Block_release(v4);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v8 = v10;
    swift_release();
    return v8;
  }
  return result;
}

uint64_t sub_18C793904(_BYTE *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char v13;
  void (*v14)(char *, uint64_t);
  uint64_t result;
  uint64_t v16;

  v2 = sub_18C802B18();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v16 - v7;
  v9 = sub_18C802B30();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C802AD0();
  sub_18C802B24();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, *MEMORY[0x1E0CCEAB0], v2);
  v13 = sub_18C802B0C();
  v14 = *(void (**)(char *, uint64_t))(v3 + 8);
  v14(v6, v2);
  result = ((uint64_t (*)(char *, uint64_t))v14)(v8, v2);
  *a1 = v13 & 1;
  return result;
}

uint64_t sub_18C793A54()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_18C793A78()
{
  uint64_t v0;

  return sub_18C793904(*(_BYTE **)(v0 + 16));
}

uint64_t sub_18C793A80()
{
  return swift_deallocObject();
}

uint64_t sub_18C793A90()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_18C793AB0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
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

uint64_t sub_18C793B18()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD *v11;
  char v12;
  void (*v13)(char *, uint64_t);
  uint64_t result;
  uint64_t v15;
  void *v16;
  char v17;
  uint64_t v18;

  v1 = v0;
  v2 = sub_18C802B18();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CCEAB8];
  v4 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x1E0C80A78](v2);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5);
  v10 = (char *)&v18 - v9;
  v11 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  (*(void (**)(uint64_t))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))(v8);
  sub_18C802B24();
  sub_18C793CE8(&qword_1ECF67070, v3, MEMORY[0x1E0CCEAC8]);
  v12 = sub_18C802B60();
  v13 = *(void (**)(char *, uint64_t))(v4 + 8);
  v13(v7, v2);
  result = ((uint64_t (*)(char *, uint64_t))v13)(v10, v2);
  if ((v12 & 1) == 0)
  {
    sub_18C802B24();
    v15 = (*(uint64_t (**)(char *))((*v11 & *v1) + 0x78))(v10);
    result = (*(uint64_t (**)(uint64_t))((*v11 & *v1) + 0x88))(v15);
    if (result)
    {
      v16 = (void *)result;
      sub_18C802B24();
      (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v7, *MEMORY[0x1E0CCEAB0], v2);
      v17 = sub_18C802B0C();
      v13(v7, v2);
      v13(v10, v2);
      objc_msgSend(v16, sel_didObserveNetworkAvailabilityChange_, v17 & 1);
      return swift_unknownObjectRelease();
    }
  }
  return result;
}

uint64_t sub_18C793CE8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x18D787A58](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

id sub_18C793D28()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TUINetworkObserver();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18C793DCC()
{
  return type metadata accessor for TUINetworkObserver();
}

uint64_t sub_18C793DD4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_18C802B18();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t variable initialization expression of TUISmartReplyResponse.srResponse()
{
  return 0;
}

void *TUISmartReplyResponse.srResponse.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_srResponse);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void TUISmartReplyResponse.srResponse.setter(void *a1)
{
  sub_18C794038(a1, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_srResponse);
}

uint64_t (*TUISmartReplyResponse.srResponse.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of TUISmartReplyResponse.error()
{
  return 0;
}

id sub_18C793F38(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id *v3;

  v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

void *TUISmartReplyResponse.error.getter()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_error);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_18C793FD4(uint64_t a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void **v5;
  void *v6;
  id v7;

  v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  v6 = *v5;
  *v5 = a3;
  v7 = a3;

}

void TUISmartReplyResponse.error.setter(void *a1)
{
  sub_18C794038(a1, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_error);
}

void sub_18C794038(void *a1, _QWORD *a2)
{
  uint64_t v2;
  void **v4;
  void *v5;

  v4 = (void **)(v2 + *a2);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a1;

}

uint64_t (*TUISmartReplyResponse.error.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t TUISmartReplyResponse.threadIdentifier.getter()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_threadIdentifier);
  swift_beginAccess();
  v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t TUISmartReplyResponse.threadIdentifier.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = (_QWORD *)(v2 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_threadIdentifier);
  swift_beginAccess();
  *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*TUISmartReplyResponse.threadIdentifier.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t TUISmartReplyResponse.type.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_type;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t TUISmartReplyResponse.type.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_type);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*TUISmartReplyResponse.type.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t TUISmartReplyResponse.contentWarning.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_contentWarning;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t TUISmartReplyResponse.contentWarning.setter(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_contentWarning);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*TUISmartReplyResponse.contentWarning.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of TUISmartReplyResponse.modelInfoString()
{
  return 0;
}

uint64_t TUISmartReplyResponse.modelInfoString.getter()
{
  return sub_18C79465C(&OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_modelInfoString);
}

uint64_t TUISmartReplyResponse.modelInfoString.setter(uint64_t a1, uint64_t a2)
{
  return sub_18C79473C(a1, a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_modelInfoString);
}

uint64_t (*TUISmartReplyResponse.modelInfoString.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of TUISmartReplyResponse.userFeedbackInputString()
{
  return 0;
}

id sub_18C7945DC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  void *v4;

  v3 = a1 + *a3;
  swift_beginAccess();
  if (!*(_QWORD *)(v3 + 8))
    return 0;
  swift_bridgeObjectRetain();
  v4 = (void *)sub_18C802B6C();
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t TUISmartReplyResponse.userFeedbackInputString.getter()
{
  return sub_18C79465C(&OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_userFeedbackInputString);
}

uint64_t sub_18C79465C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_18C7946B8(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;

  if (a3)
  {
    v6 = sub_18C802B78();
    v8 = v7;
  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  v9 = (uint64_t *)(a1 + *a4);
  swift_beginAccess();
  *v9 = v6;
  v9[1] = v8;
  return swift_bridgeObjectRelease();
}

uint64_t TUISmartReplyResponse.userFeedbackInputString.setter(uint64_t a1, uint64_t a2)
{
  return sub_18C79473C(a1, a2, &OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_userFeedbackInputString);
}

uint64_t sub_18C79473C(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess();
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*TUISmartReplyResponse.userFeedbackInputString.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_18C7947D8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  objc_class *v10;
  id v18;
  id v19;

  v18 = objc_allocWithZone(v10);
  v19 = sub_18C796F38(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10);

  return v19;
}

uint64_t sub_18C79496C()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  v1 = v0;
  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
  if (v3)
  {
    v4 = (void *)v3;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE04A070);
    v5 = swift_allocObject();
    *(_OWORD *)(v5 + 16) = xmmword_18C80C630;
    sub_18C802C74();
    sub_18C802B90();
    v6 = objc_msgSend(v4, sel_description);
    sub_18C802B78();

    sub_18C802B90();
    swift_bridgeObjectRelease();
    v7 = sub_18C802B90();
    (*(void (**)(uint64_t))((*v2 & *v1) + 0xE8))(v7);
    type metadata accessor for TUISmartReplyContentWarningType(0);
    sub_18C802C98();
    *(_QWORD *)(v5 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v5 + 32) = 0;
    *(_QWORD *)(v5 + 40) = 0xE000000000000000;
    sub_18C802CD4();

    return swift_bridgeObjectRelease();
  }
  else
  {
    v9 = (*(uint64_t (**)(void))((*v2 & *v0) + 0xA0))();
    if (v9)
    {
      v10 = (void *)v9;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE04A070);
      v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_18C80C630;
      sub_18C802C74();
      swift_bridgeObjectRelease();
      v12 = objc_msgSend(v10, sel_description);
      sub_18C802B78();

      sub_18C802B90();
      swift_bridgeObjectRelease();
      *(_QWORD *)(v11 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v11 + 32) = 0xD00000000000001ELL;
      *(_QWORD *)(v11 + 40) = 0x800000018C80CFA0;
      sub_18C802CD4();

    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EE04A070);
      v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_18C80C630;
      *(_QWORD *)(v13 + 56) = MEMORY[0x1E0DEA968];
      *(_QWORD *)(v13 + 32) = 0xD00000000000001BLL;
      *(_QWORD *)(v13 + 40) = 0x800000018C80CF70;
      sub_18C802CD4();
    }
    return swift_bridgeObjectRelease();
  }
}

id TUISmartReplyResponse.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void TUISmartReplyResponse.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id TUISmartReplyResponse.__deallocating_deinit()
{
  return sub_18C7966C4(type metadata accessor for TUISmartReplyResponse);
}

id TUITextCompositionClientWrapper.init()()
{
  void *v0;
  id v1;
  char *v2;
  id v3;
  objc_super v5;

  v1 = objc_allocWithZone((Class)sub_18C802AB8());
  v2 = v0;
  v3 = objc_msgSend(v1, sel_init);
  *(_QWORD *)&v2[OBJC_IVAR____TtC11TextInputUI31TUITextCompositionClientWrapper_textCompositionClient] = v3;

  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for TUITextCompositionClientWrapper();
  return objc_msgSendSuper2(&v5, sel_init);
}

uint64_t sub_18C794EA4()
{
  uint64_t v0;

  v0 = sub_18C802A94();
  __swift_allocate_value_buffer(v0, qword_1EE04B2E8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE04B2E8);
  return sub_18C802A88();
}

Swift::UInt __swiftcall TUITextCompositionClientWrapper.generateRequestToken()()
{
  id v0;
  id v1;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DBDAA0]), sel_init);
  v1 = objc_msgSend(v0, sel_nextToken);

  return (Swift::UInt)v1;
}

void sub_18C794FD4()
{
  qword_1EE04B2D8 = 825112889;
  unk_1EE04B2E0 = 0xE400000000000000;
}

uint64_t sub_18C794FF0()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  id v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _OWORD v8[2];
  __int128 v9;
  __int128 v10;

  v0 = (void *)sub_18C802B6C();
  v1 = objc_msgSend((id)objc_opt_self(), sel_bundleWithIdentifier_, v0);

  if (!v1)
  {
    v9 = 0u;
    v10 = 0u;
LABEL_9:
    result = sub_18C797AB0((uint64_t)&v9, &qword_1EE04A020);
    v6 = 0;
    v7 = 0;
    goto LABEL_10;
  }
  v2 = v1;
  v3 = (void *)sub_18C802B6C();
  v4 = objc_msgSend(v2, sel_objectForInfoDictionaryKey_, v3);

  if (v4)
  {
    sub_18C802C5C();

    swift_unknownObjectRelease();
  }
  else
  {

    memset(v8, 0, sizeof(v8));
  }
  sub_18C797AEC((uint64_t)v8, (uint64_t)&v9);
  if (!*((_QWORD *)&v10 + 1))
    goto LABEL_9;
  result = swift_dynamicCast();
  v7 = *((_QWORD *)&v8[0] + 1);
  v6 = *(_QWORD *)&v8[0];
  if (!(_DWORD)result)
  {
    v6 = 0;
    v7 = 0;
  }
LABEL_10:
  qword_1EE04B2C8 = v6;
  qword_1EE04B2D0 = v7;
  return result;
}

uint64_t sub_18C795168()
{
  uint64_t result;

  result = sub_18C795188();
  byte_1EE04B300 = result & 1;
  return result;
}

uint64_t sub_18C795188()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t result;
  _QWORD v24[2];
  uint64_t v25[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE04A000);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EE04B108 != -1)
    swift_once();
  v3 = qword_1EE04B2D0;
  if (!qword_1EE04B2D0)
  {
    if (qword_1EE04B118 != -1)
      swift_once();
    v14 = sub_18C802A94();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EE04B2E8);
    v15 = sub_18C802A7C();
    v16 = sub_18C802BCC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18C785000, v15, v16, "Unable to find GM bundle version", v17, 2u);
      MEMORY[0x18D787AAC](v17, -1, -1);
    }

    return 0;
  }
  v4 = qword_1EE04B2C8;
  v25[0] = qword_1EE04B2C8;
  v25[1] = qword_1EE04B2D0;
  v5 = qword_1EE04B110;
  swift_bridgeObjectRetain();
  if (v5 != -1)
    swift_once();
  v24[0] = qword_1EE04B2D8;
  v24[1] = unk_1EE04B2E0;
  v6 = sub_18C802A10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v2, 1, 1, v6);
  sub_18C797488();
  swift_bridgeObjectRetain();
  v7 = sub_18C802C44();
  sub_18C797AB0((uint64_t)v2, &qword_1EE04A000);
  swift_bridgeObjectRelease();
  if (v7 < 2)
  {
    if (qword_1EE04B118 != -1)
      swift_once();
    v8 = sub_18C802A94();
    __swift_project_value_buffer(v8, (uint64_t)qword_1EE04B2E8);
    swift_bridgeObjectRetain();
    v9 = sub_18C802A7C();
    v10 = sub_18C802BD8();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      v12 = swift_slowAlloc();
      v25[0] = v12;
      *(_DWORD *)v11 = 136315138;
      swift_bridgeObjectRetain();
      v24[0] = sub_18C7967B4(v4, v3, v25);
      sub_18C802C2C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_18C785000, v9, v10, "GM version %s supports Availability API", v11, 0xCu);
      v13 = 1;
      swift_arrayDestroy();
      MEMORY[0x18D787AAC](v12, -1, -1);
      MEMORY[0x18D787AAC](v11, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      return 1;
    }
    return v13;
  }
  if (v7 == -1)
  {
    if (qword_1EE04B118 != -1)
      swift_once();
    v18 = sub_18C802A94();
    __swift_project_value_buffer(v18, (uint64_t)qword_1EE04B2E8);
    swift_bridgeObjectRetain();
    v19 = sub_18C802A7C();
    v20 = sub_18C802BD8();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      v22 = swift_slowAlloc();
      v25[0] = v22;
      *(_DWORD *)v21 = 136315138;
      swift_bridgeObjectRetain();
      v24[0] = sub_18C7967B4(v4, v3, v25);
      sub_18C802C2C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_18C785000, v19, v20, "GM version %s does NOT support Availability API", v21, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x18D787AAC](v22, -1, -1);
      MEMORY[0x18D787AAC](v21, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  type metadata accessor for ComparisonResult(0);
  v25[0] = v7;
  result = sub_18C802CC8();
  __break(1u);
  return result;
}

uint64_t static TUITextCompositionClientWrapper.isGMAvailableForMessagesReply()()
{
  uint64_t v0;

  return (*(uint64_t (**)(unint64_t, unint64_t))(v0 + 96))(0xD00000000000001DLL, 0x800000018C80CF00);
}

uint64_t static TUITextCompositionClientWrapper.isGMAvailableForMailReply()()
{
  uint64_t v0;

  return (*(uint64_t (**)(unint64_t, unint64_t))(v0 + 96))(0xD000000000000019, 0x800000018C80CF20);
}

uint64_t static TUITextCompositionClientWrapper.isGMAvailableForMailReplyLongFormBasic()()
{
  uint64_t v0;

  return (*(uint64_t (**)(unint64_t, unint64_t))(v0 + 96))(0xD000000000000026, 0x800000018C80CF40);
}

uint64_t TUITextCompositionClientWrapper.requestSmartReplies(inputContextHistory:shortForm:clientID:threadIdentifier:candidateString:options:completion:)(void *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  void *v11;
  void *v12;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  unsigned int *v24;
  uint64_t v25;
  uint64_t (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  char *v34;
  void *v35;
  void *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  id v41;
  id v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  void *v46;
  void *v47;
  char *v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  id v54;
  id v55;
  uint64_t v57;
  uint64_t ObjectType;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  char *v65;
  void *v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;

  v12 = v11;
  v59 = a7;
  LODWORD(v61) = a2;
  v69 = a6;
  v70 = a11;
  v62 = a10;
  v63 = a5;
  v66 = a1;
  v67 = a9;
  v64 = v12;
  ObjectType = swift_getObjectType();
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE04A080);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_18C802AA0();
  v20 = *(_QWORD *)(v19 - 8);
  v21 = *(_QWORD *)(v20 + 64);
  MEMORY[0x1E0C80A78](v19);
  v22 = (v21 + 15) & 0xFFFFFFFFFFFFFFF0;
  v74 = a3;
  v75 = a4;
  v72 = 0x4D53656C69626F4DLL;
  v73 = 0xE900000000000053;
  sub_18C797488();
  v23 = sub_18C802C50();
  v24 = (unsigned int *)MEMORY[0x1E0D8BE00];
  if ((v23 & 1) != 0)
    v24 = (unsigned int *)MEMORY[0x1E0D8BE08];
  (*(void (**)(char *, _QWORD, uint64_t))(v20 + 104))((char *)&v57 - v22, *v24, v19);
  v25 = sub_18C802BC0();
  v26 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
  v68 = v18;
  v27 = v26(v18, 1, 1, v25);
  v60 = &v57;
  MEMORY[0x1E0C80A78](v27);
  v28 = (char *)&v57 - v22;
  v29 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
  v65 = (char *)&v57 - v22;
  v71 = v19;
  v29((char *)&v57 - v22, (char *)&v57 - v22, v19);
  v30 = (*(unsigned __int8 *)(v20 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v20 + 80);
  v31 = (v21 + v30 + 7) & 0xFFFFFFFFFFFFFFF8;
  if ((v61 & 1) != 0)
  {
    v32 = (v31 + 15) & 0xFFFFFFFFFFFFFFF8;
    v33 = (v32 + 23) & 0xFFFFFFFFFFFFFFF8;
    v34 = (char *)swift_allocObject();
    *((_QWORD *)v34 + 2) = 0;
    *((_QWORD *)v34 + 3) = 0;
    v35 = v64;
    v36 = v66;
    *((_QWORD *)v34 + 4) = v64;
    *((_QWORD *)v34 + 5) = v36;
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(&v34[v30], v28, v71);
    *(_QWORD *)&v34[v31] = v67;
    v37 = &v34[v32];
    v39 = v69;
    v38 = v70;
    *(_QWORD *)v37 = v63;
    *((_QWORD *)v37 + 1) = v39;
    v40 = &v34[v33];
    *(_QWORD *)v40 = v62;
    *((_QWORD *)v40 + 1) = v38;
    *(_QWORD *)&v34[(v33 + 23) & 0xFFFFFFFFFFFFFFF8] = ObjectType;
    v41 = v35;
    v42 = v36;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    v43 = &unk_1EE04A0A0;
  }
  else
  {
    v44 = (v31 + 23) & 0xFFFFFFFFFFFFFFF8;
    v45 = (v44 + 15) & 0xFFFFFFFFFFFFFFF8;
    v61 = a8;
    v34 = (char *)swift_allocObject();
    *((_QWORD *)v34 + 2) = 0;
    *((_QWORD *)v34 + 3) = 0;
    v46 = v64;
    v47 = v66;
    *((_QWORD *)v34 + 4) = v64;
    *((_QWORD *)v34 + 5) = v47;
    (*(void (**)(char *, char *, uint64_t))(v20 + 32))(&v34[v30], v28, v71);
    v48 = &v34[v31];
    v49 = v61;
    *(_QWORD *)v48 = v59;
    *((_QWORD *)v48 + 1) = v49;
    *(_QWORD *)&v34[v44] = v67;
    v50 = &v34[v45];
    v52 = v69;
    v51 = v70;
    *(_QWORD *)v50 = v63;
    *((_QWORD *)v50 + 1) = v52;
    v53 = &v34[(v45 + 23) & 0xFFFFFFFFFFFFFFF8];
    *(_QWORD *)v53 = v62;
    *((_QWORD *)v53 + 1) = v51;
    v54 = v46;
    v55 = v47;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_bridgeObjectRetain();
    v43 = &unk_1EE04A090;
  }
  sub_18C795FD8((uint64_t)v68, (uint64_t)v43, (uint64_t)v34);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v20 + 8))(v65, v71);
}

uint64_t sub_18C795B88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  __int128 v10;
  uint64_t v11;

  *(_QWORD *)(v8 + 80) = v11;
  *(_OWORD *)(v8 + 64) = v10;
  *(_QWORD *)(v8 + 48) = a7;
  *(_QWORD *)(v8 + 56) = a8;
  *(_QWORD *)(v8 + 32) = a5;
  *(_QWORD *)(v8 + 40) = a6;
  *(_QWORD *)(v8 + 24) = a4;
  return swift_task_switch();
}

uint64_t sub_18C795BBC()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD, _QWORD, uint64_t);

  v1 = v0[6];
  v4 = (uint64_t (*)(_QWORD, _QWORD, uint64_t))((int)*MEMORY[0x1E0D8BE40] + MEMORY[0x1E0D8BE40]);
  v2 = (_QWORD *)swift_task_alloc();
  v0[11] = v2;
  *v2 = v0;
  v2[1] = sub_18C795C38;
  return v4(v0[4], v0[5], v1);
}

uint64_t sub_18C795C38(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(*v3 + 96) = v2;
  swift_task_dealloc();
  if (!v2)
  {
    *(_QWORD *)(v6 + 104) = a2;
    *(_QWORD *)(v6 + 112) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_18C795CB0()
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
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v15;
  void (*v16)(id);

  v2 = *(_QWORD *)(v0 + 104);
  v1 = *(void **)(v0 + 112);
  v3 = *(_QWORD *)(v0 + 64);
  v16 = *(void (**)(id))(v0 + 72);
  v15 = *(_QWORD *)(v0 + 56);
  v4 = sub_18C7978C4(v2);
  v5 = sub_18C797B7C(v2);
  v7 = v6;
  v8 = sub_18C797F24(v2);
  v10 = v9;
  swift_bridgeObjectRelease();
  v11 = objc_allocWithZone((Class)type metadata accessor for TUISmartReplyResponse());
  v12 = v1;
  swift_bridgeObjectRetain();
  v13 = sub_18C796F38(v1, v15, v3, 0, v4, 0, v5, v7, v8, v10);

  v16(v13);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_18C795DA8()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  BOOL v7;
  void *v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void (*v14)(id);
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;

  if (qword_1EE04B118 != -1)
    swift_once();
  v1 = *(void **)(v0 + 96);
  v2 = sub_18C802A94();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EE04B2E8);
  v3 = v1;
  v4 = v1;
  v5 = sub_18C802A7C();
  v6 = sub_18C802BD8();
  v7 = os_log_type_enabled(v5, v6);
  v8 = *(void **)(v0 + 96);
  if (v7)
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v9 = 138412290;
    v11 = v8;
    v12 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 16) = v12;
    sub_18C802C2C();
    *v10 = v12;

    _os_log_impl(&dword_18C785000, v5, v6, "Caught short form generation error: %@", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE04A0E0);
    swift_arrayDestroy();
    MEMORY[0x18D787AAC](v10, -1, -1);
    MEMORY[0x18D787AAC](v9, -1, -1);
  }
  else
  {

  }
  v13 = *(void **)(v0 + 96);
  v14 = *(void (**)(id))(v0 + 72);
  v16 = *(_QWORD *)(v0 + 56);
  v15 = *(_QWORD *)(v0 + 64);
  swift_bridgeObjectRetain();
  v17 = (void *)sub_18C802A04();
  v18 = objc_allocWithZone((Class)type metadata accessor for TUISmartReplyResponse());
  v19 = sub_18C796F38(0, v16, v15, 0, 0, v17, 0, 0, 0, 0);

  v14(v19);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_18C795FD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_18C802BC0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_18C802BB4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_18C797AB0(a1, &qword_1EE04A080);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_18C802BA8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_18C796124(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  *(_QWORD *)(v8 + 88) = v12;
  *(_OWORD *)(v8 + 72) = v11;
  *(_OWORD *)(v8 + 56) = v10;
  *(_QWORD *)(v8 + 40) = a7;
  *(_QWORD *)(v8 + 48) = a8;
  *(_QWORD *)(v8 + 24) = a5;
  *(_QWORD *)(v8 + 32) = a6;
  *(_QWORD *)(v8 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_18C79615C()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t);

  v1 = v0[7];
  v4 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t))((int)*MEMORY[0x1E0D8BE38] + MEMORY[0x1E0D8BE38]);
  v2 = (_QWORD *)swift_task_alloc();
  v0[12] = v2;
  *v2 = v0;
  v2[1] = sub_18C7961DC;
  return v4(v0[3], v0[4], v0[5], v0[6], v1);
}

uint64_t sub_18C7961DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v6;

  v6 = *v3;
  *(_QWORD *)(*v3 + 104) = v2;
  swift_task_dealloc();
  if (!v2)
  {
    *(_QWORD *)(v6 + 112) = a2;
    *(_QWORD *)(v6 + 120) = a1;
  }
  return swift_task_switch();
}

uint64_t sub_18C796254()
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
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v15;
  void (*v16)(id);

  v2 = *(_QWORD *)(v0 + 112);
  v1 = *(void **)(v0 + 120);
  v3 = *(_QWORD *)(v0 + 72);
  v16 = *(void (**)(id))(v0 + 80);
  v15 = *(_QWORD *)(v0 + 64);
  v4 = sub_18C7978C4(v2);
  v5 = sub_18C797B7C(v2);
  v7 = v6;
  v8 = sub_18C797F24(v2);
  v10 = v9;
  swift_bridgeObjectRelease();
  v11 = objc_allocWithZone((Class)type metadata accessor for TUISmartReplyResponse());
  v12 = v1;
  swift_bridgeObjectRetain();
  v13 = sub_18C796F38(v1, v15, v3, 1, v4, 0, v5, v7, v8, v10);

  v16(v13);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_18C79634C()
{
  uint64_t v0;
  void *v1;
  void (*v2)(id);
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;

  v1 = *(void **)(v0 + 104);
  v2 = *(void (**)(id))(v0 + 80);
  v4 = *(_QWORD *)(v0 + 64);
  v3 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  v5 = (void *)sub_18C802A04();
  v6 = objc_allocWithZone((Class)type metadata accessor for TUISmartReplyResponse());
  v7 = sub_18C796F38(0, v4, v3, 1, 0, v5, 0, 0, 0, 0);

  v2(v7);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall TUITextCompositionClientWrapper.cancelRequest(token:)(Swift::UInt token)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (qword_1EE04B118 != -1)
    swift_once();
  v1 = sub_18C802A94();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EE04B2E8);
  v2 = sub_18C802A7C();
  v3 = sub_18C802BD8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v4 = 134217984;
    sub_18C802C2C();
    _os_log_impl(&dword_18C785000, v2, v3, "Cancelling request: %lu", v4, 0xCu);
    MEMORY[0x18D787AAC](v4, -1, -1);
  }

  sub_18C802AAC();
}

id TUITextCompositionClientWrapper.__deallocating_deinit()
{
  return sub_18C7966C4(type metadata accessor for TUITextCompositionClientWrapper);
}

id sub_18C7966C4(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t sub_18C796704(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_18C796768;
  return v6(a1);
}

uint64_t sub_18C796768()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_18C7967B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_18C796884(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_18C797964((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_18C797964((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_18C796884(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_18C802C38();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_18C796A3C(a5, a6);
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
  v8 = sub_18C802C8C();
  if (!v8)
  {
    sub_18C802CA4();
    __break(1u);
LABEL_17:
    result = sub_18C802CB0();
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

uint64_t sub_18C796A3C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_18C796AD0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_18C796CA8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_18C796CA8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_18C796AD0(uint64_t a1, unint64_t a2)
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
      v3 = sub_18C796C44(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_18C802C80();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_18C802CA4();
      __break(1u);
LABEL_10:
      v2 = sub_18C802B9C();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_18C802CB0();
    __break(1u);
LABEL_14:
    result = sub_18C802CA4();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_18C796C44(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EE04A018);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_18C796CA8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE04A018);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
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
  result = sub_18C802CB0();
  __break(1u);
  return result;
}

unint64_t sub_18C796DF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_18C802CE0();
  sub_18C802B84();
  v4 = sub_18C802CEC();
  return sub_18C796E58(a1, a2, v4);
}

unint64_t sub_18C796E58(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_18C802CBC() & 1) == 0)
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
      while (!v14 && (sub_18C802CBC() & 1) == 0);
    }
  }
  return v6;
}

id sub_18C796F38(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  char *v10;
  void **v15;
  void **v16;
  char *v17;
  char *v18;
  void *v19;
  char *v20;
  id v21;
  void *v22;
  id v23;
  char *v24;
  objc_super v30;

  v15 = (void **)&v10[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_srResponse];
  *(_QWORD *)&v10[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_srResponse] = 0;
  v16 = (void **)&v10[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_error];
  *(_QWORD *)&v10[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_error] = 0;
  v17 = &v10[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_modelInfoString];
  *(_QWORD *)v17 = 0;
  *((_QWORD *)v17 + 1) = 0;
  v18 = &v10[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_userFeedbackInputString];
  *(_QWORD *)v18 = 0;
  *((_QWORD *)v18 + 1) = 0;
  swift_beginAccess();
  v19 = *v15;
  *v15 = a1;
  v20 = v10;
  v21 = a1;

  swift_beginAccess();
  v22 = *v16;
  *v16 = a6;
  v23 = a6;

  v24 = &v20[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_threadIdentifier];
  *(_QWORD *)v24 = a2;
  *((_QWORD *)v24 + 1) = a3;
  *(_QWORD *)&v20[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_type] = a4;
  *(_QWORD *)&v20[OBJC_IVAR____TtC11TextInputUI21TUISmartReplyResponse_contentWarning] = a5;
  swift_beginAccess();
  *(_QWORD *)v17 = a7;
  *((_QWORD *)v17 + 1) = a8;
  swift_bridgeObjectRelease();
  swift_beginAccess();
  *(_QWORD *)v18 = a9;
  *((_QWORD *)v18 + 1) = a10;

  swift_bridgeObjectRelease();
  v30.receiver = v20;
  v30.super_class = (Class)type metadata accessor for TUISmartReplyResponse();
  return objc_msgSendSuper2(&v30, sel_init);
}

void type metadata accessor for TUISmartReplyContentWarningType(uint64_t a1)
{
  sub_18C797A48(a1, &qword_1EE04A0D8);
}

uint64_t type metadata accessor for TUISmartReplyResponse()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for TUITextCompositionClientWrapper()
{
  return objc_opt_self();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t _s11TextInputUI31TUITextCompositionClientWrapperC13isGMAvailable7useCaseSbSS_tFZ_0(uint64_t a1, uint64_t a2)
{
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
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v30 = a1;
  v31 = a2;
  v2 = sub_18C802A4C();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_18C802A70();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_18C802A28();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v28 - v15;
  if (qword_1EE04B120 != -1)
    swift_once();
  if (byte_1EE04B300 == 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EE04A010);
    v17 = swift_allocObject();
    v29 = v6;
    *(_OWORD *)(v17 + 16) = xmmword_18C80C630;
    *(_QWORD *)(v17 + 32) = v30;
    *(_QWORD *)(v17 + 40) = v31;
    swift_bridgeObjectRetain();
    sub_18C802A40();
    sub_18C802A64();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_18C802A58();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v29);
    (*(void (**)(char *, _QWORD, uint64_t))(v11 + 104))(v14, *MEMORY[0x1E0D26088], v10);
    v18 = sub_18C802A1C();
    v19 = *(void (**)(char *, uint64_t))(v11 + 8);
    v19(v14, v10);
    v19(v16, v10);
  }
  else
  {
    if (qword_1EE04B118 != -1)
      swift_once();
    v20 = sub_18C802A94();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EE04B2E8);
    v21 = sub_18C802A7C();
    v22 = sub_18C802BCC();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_18C785000, v21, v22, "GM version does not support Availability API.", v23, 2u);
      MEMORY[0x18D787AAC](v23, -1, -1);
    }

    if (os_variant_has_internal_diagnostics())
    {
      v24 = sub_18C802A7C();
      v25 = sub_18C802BD8();
      if (os_log_type_enabled(v24, v25))
      {
        v26 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v26 = 0;
        _os_log_impl(&dword_18C785000, v24, v25, "NOTICE: Allowing GM for internal OS without Availability API", v26, 2u);
        MEMORY[0x18D787AAC](v26, -1, -1);
      }

      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
  }
  return v18 & 1;
}

unint64_t sub_18C797488()
{
  unint64_t result;

  result = qword_1EE04A008;
  if (!qword_1EE04A008)
  {
    result = MEMORY[0x18D787A58](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EE04A008);
  }
  return result;
}

uint64_t sub_18C7974CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_18C802AA0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18C7975B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;

  v2 = *(_QWORD *)(sub_18C802AA0() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 23) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 23) & 0xFFFFFFFFFFFFF8;
  v8 = v0 + v3;
  v9 = (uint64_t *)(v0 + v4);
  v10 = *(_QWORD *)(v0 + v5);
  v11 = *v9;
  v12 = v9[1];
  v13 = *(_QWORD *)(v0 + v6);
  v14 = *(_QWORD *)(v0 + v6 + 8);
  v15 = swift_task_alloc();
  v16 = *(_OWORD *)(v0 + 32);
  v17 = *(_OWORD *)(v0 + v7);
  *(_QWORD *)(v1 + 16) = v15;
  *(_QWORD *)v15 = v1;
  *(_QWORD *)(v15 + 8) = sub_18C797694;
  *(_OWORD *)(v15 + 80) = v17;
  *(_QWORD *)(v15 + 64) = v13;
  *(_QWORD *)(v15 + 72) = v14;
  *(_QWORD *)(v15 + 48) = v12;
  *(_QWORD *)(v15 + 56) = v10;
  *(_QWORD *)(v15 + 32) = v8;
  *(_QWORD *)(v15 + 40) = v11;
  *(_OWORD *)(v15 + 16) = v16;
  return swift_task_switch();
}

uint64_t sub_18C797694()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_18C7976DC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_18C802AA0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();

  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18C7977B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;

  v2 = *(_QWORD *)(sub_18C802AA0() - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  v5 = (v4 + 15) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 23) & 0xFFFFFFFFFFFFF8;
  v7 = *(_QWORD *)(v0 + v4);
  v8 = v0 + v3;
  v9 = *(_QWORD *)(v0 + v5);
  v10 = *(_QWORD *)(v0 + v5 + 8);
  v11 = swift_task_alloc();
  v12 = *(_OWORD *)(v0 + v6);
  v13 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v11;
  *(_QWORD *)v11 = v1;
  *(_QWORD *)(v11 + 8) = sub_18C797B74;
  *(_OWORD *)(v11 + 72) = v12;
  *(_QWORD *)(v11 + 56) = v9;
  *(_QWORD *)(v11 + 64) = v10;
  *(_QWORD *)(v11 + 40) = v8;
  *(_QWORD *)(v11 + 48) = v7;
  *(_OWORD *)(v11 + 24) = v13;
  return swift_task_switch();
}

void type metadata accessor for TUISmartReplyType(uint64_t a1)
{
  sub_18C797A48(a1, &qword_1EE04A0D0);
}

uint64_t sub_18C797890()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_18C7978B4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_18C7978C4(uint64_t a1)
{
  unint64_t v2;
  char v3;
  unint64_t v5;
  _BYTE v6[32];

  if (!*(_QWORD *)(a1 + 16))
    return 0;
  v2 = sub_18C796DF4(0x57746E65746E6F43, 0xEE00676E696E7261);
  if ((v3 & 1) == 0)
    return 0;
  sub_18C797964(*(_QWORD *)(a1 + 56) + 32 * v2, (uint64_t)v6);
  if ((swift_dynamicCast() & 1) == 0)
    return 0;
  if (v5 >= 3)
    return -1;
  return v5;
}

uint64_t sub_18C797964(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_18C7979A0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_18C7979C4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_18C797694;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EE04A0E8 + dword_1EE04A0E8))(a1, v4);
}

void type metadata accessor for ComparisonResult(uint64_t a1)
{
  sub_18C797A48(a1, &qword_1EE04A0F8);
}

void sub_18C797A48(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_18C797AB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_18C797AEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE04A020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
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

uint64_t sub_18C797B7C(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  uint64_t v25;
  __int128 v26;
  __int128 v27;

  v2 = (void *)sub_18C802B6C();
  v3 = sub_18C802B78();
  v5 = v4;

  if (*(_QWORD *)(a1 + 16) && (v6 = sub_18C796DF4(v3, v5), (v7 & 1) != 0))
  {
    sub_18C797964(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)&v26);
    swift_bridgeObjectRelease();
    if (*((_QWORD *)&v27 + 1))
    {
      if (swift_dynamicCast())
        return v25;
      goto LABEL_8;
    }
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
    swift_bridgeObjectRelease();
  }
  sub_18C798008((uint64_t)&v26);
LABEL_8:
  v25 = 0;
  v8 = sub_18C802B78();
  if (*(_QWORD *)(a1 + 16) && (v10 = sub_18C796DF4(v8, v9), (v11 & 1) != 0))
  {
    sub_18C797964(*(_QWORD *)(a1 + 56) + 32 * v10, (uint64_t)&v26);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v27 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_18C802B90();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_18C798008((uint64_t)&v26);
  }
  sub_18C802B90();
  v12 = sub_18C802B78();
  if (*(_QWORD *)(a1 + 16) && (v14 = sub_18C796DF4(v12, v13), (v15 & 1) != 0))
  {
    sub_18C797964(*(_QWORD *)(a1 + 56) + 32 * v14, (uint64_t)&v26);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v27 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_18C802B90();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_18C798008((uint64_t)&v26);
  }
  sub_18C802B90();
  v16 = sub_18C802B78();
  if (*(_QWORD *)(a1 + 16) && (v18 = sub_18C796DF4(v16, v17), (v19 & 1) != 0))
  {
    sub_18C797964(*(_QWORD *)(a1 + 56) + 32 * v18, (uint64_t)&v26);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v27 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_18C802B90();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_18C798008((uint64_t)&v26);
  }
  sub_18C802B90();
  v20 = sub_18C802B78();
  if (*(_QWORD *)(a1 + 16) && (v22 = sub_18C796DF4(v20, v21), (v23 & 1) != 0))
  {
    sub_18C797964(*(_QWORD *)(a1 + 56) + 32 * v22, (uint64_t)&v26);
  }
  else
  {
    v26 = 0u;
    v27 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v27 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0)
    {
      sub_18C802B90();
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_18C798008((uint64_t)&v26);
  }
  return v25;
}

uint64_t sub_18C797F24(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v2 = (void *)sub_18C802B6C();
  v3 = sub_18C802B78();
  v5 = v4;

  if (!*(_QWORD *)(a1 + 16) || (v6 = sub_18C796DF4(v3, v5), (v7 & 1) == 0))
  {
    v10 = 0u;
    v11 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_18C797964(*(_QWORD *)(a1 + 56) + 32 * v6, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v11 + 1))
  {
LABEL_7:
    sub_18C798008((uint64_t)&v10);
    return 0;
  }
  if ((swift_dynamicCast() & 1) != 0)
    return v9;
  return 0;
}

uint64_t sub_18C798008(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EE04A020);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for TUITextCompositionUtilities()
{
  return &type metadata for TUITextCompositionUtilities;
}

uint64_t sub_18C798058()
{
  uint64_t v0;

  v0 = sub_18C802A94();
  __swift_allocate_value_buffer(v0, qword_1EE04B130);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EE04B130);
  return sub_18C802A88();
}

id sub_18C798128()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18C798160()
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
  char *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v19;

  v0 = sub_18C802A28();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_18C802A4C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_18C802A70();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C802A34();
  sub_18C802A64();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_18C802A58();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v12 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v12 == *MEMORY[0x1E0D25F70])
  {
LABEL_11:
    v13 = 1;
    goto LABEL_12;
  }
  if (v12 == *MEMORY[0x1E0D25F80])
  {
    v13 = 0;
LABEL_12:
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    return v13;
  }
  if (v12 != *MEMORY[0x1E0D26088])
  {
    if (qword_1EE04B128 != -1)
      swift_once();
    v14 = sub_18C802A94();
    __swift_project_value_buffer(v14, (uint64_t)qword_1EE04B130);
    v15 = sub_18C802A7C();
    v16 = sub_18C802BCC();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_18C785000, v15, v16, "unexpected case in GenerativeModelsAvailability isAvailable", v17, 2u);
      MEMORY[0x18D787AAC](v17, -1, -1);
    }

    goto LABEL_11;
  }
  return 1;
}

uint64_t type metadata accessor for TUIGenerativeModelsAvailability()
{
  return objc_opt_self();
}

id sub_18C7983DC(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  id v12;
  void *v13;
  uint64_t v15;

  v5 = sub_18C802C14();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v15 - v10;
  sub_18C802C08();
  sub_18C802AC4();
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v9, v11, v5);
  v12 = a4;
  v13 = (void *)sub_18C802C20();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v13;
}

uint64_t sub_18C7984B8()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
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

uint64_t _TextInputUIBundle()
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

void tui_performBlockOnMainThread(void *a1)
{
  void *v1;
  void (**block)(void);

  v1 = (void *)MEMORY[0x1E0CB3978];
  block = a1;
  if (objc_msgSend(v1, "isMainThread"))
    block[2]();
  else
    dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __Block_byref_object_copy__938(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__939(uint64_t a1)
{

}

void *__getMKBGetDeviceLockStateSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
  }
  else
  {
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
    if (!MobileKeyBagLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MKBGetDeviceLockState");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMKBGetDeviceLockStateSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL iPhoneVisualStyle(int a1)
{
  return (a1 - 1) < 5;
}

BOOL iPadVisualStyle(int a1)
{
  return (a1 - 101) < 9;
}

Class __getAFDictationConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AssistantServicesLibraryCore_frameworkLibrary)
  {
    AssistantServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AssistantServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AFDictationConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)abort_report_np();
    free(v3);
  }
  getAFDictationConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

__CFString *TUIKeyboardDisplayNameFromIdentifierForContext(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0DC3960], "keyboardInputModeWithIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isExtensionInputMode"))
  {
    objc_msgSend(v4, "safe__extendedDisplayName");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if ((objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0DC4F40]) & 1) != 0)
  {
    v5 = CFSTR("QWERTY");
  }
  else
  {
    MEMORY[0x18D787314](v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x18D787308](v6);
    v3 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", v3, &stru_1E24FC6C0, CFSTR("KeyboardTitles"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (-[__CFString isEqualToString:](v5, "isEqualToString:", v3))
    {

    }
    else if (v5)
    {
      goto LABEL_13;
    }
    v8 = (void *)MEMORY[0x1E0C99DC8];
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localeForBundleLanguage:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v3;
    if (_ReducedLanguageIdentifierForKeyboardLanguage___onceToken != -1)
      dispatch_once(&_ReducedLanguageIdentifierForKeyboardLanguage___onceToken, &__block_literal_global_1759);
    v11 = (void *)_ReducedLanguageIdentifierForKeyboardLanguage___languageCounts;
    objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "countForObject:", v12);

    v14 = v3;
    if (v13 <= 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "baseLanguageFromLanguage:", v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v10, "localizedStringForLanguage:context:", v14, a2);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_13:

  return v5;
}

__CFString *TUIKeyboardDisplayNameFromIdentifier(void *a1)
{
  return TUIKeyboardDisplayNameFromIdentifierForContext(a1, 3);
}

id TUIKeyboardTitle(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1E24FC6C0, CFSTR("KeyboardTitles"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id TUIKeyboardTitleInLanguage(void *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a1;
  objc_msgSend(v4, "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredLocalizationsFromArray:forPreferences:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = v10;

    v3 = v11;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:localization:", v5, v5, CFSTR("KeyboardTitles"), v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id TUIDictationTitle(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB34D0];
  v2 = a1;
  objc_msgSend(v1, "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1E24FC6C0, CFSTR("Dictation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

double TUIPPMFloatValue(double a1, double a2)
{
  return a2;
}

uint64_t __Block_byref_object_copy__2200(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2201(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__2460(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2461(uint64_t a1)
{

}

double TUIRectIntegralWithScale(double a1, double a2, double a3, double a4, double a5)
{
  double v6;
  BOOL IsNull;

  v6 = a1;
  IsNull = CGRectIsNull(*(CGRect *)&a1);
  if (a5 > 1.0 && !IsNull)
    return floor(v6 * a5) / a5;
  return v6;
}

double TUIPointIntegralWithScale(double result, double a2, double a3)
{
  if (a3 > 1.0)
    return floor(result * a3) / a3;
  return result;
}

double TUIScreenScaleForView(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  double v11;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3958], "activeInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "screen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  objc_msgSend(v2, "scale");
  v6 = v5;
  objc_msgSend(v2, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  v9 = 2.0;
  if (v6 <= 2.0 || v8 != 3)
    v9 = v6;
  v11 = fmax(v9, 1.0);

  return v11;
}

uint64_t __Block_byref_object_copy__4377(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4378(uint64_t a1)
{

}

id TUIAssertionLogFacility()
{
  if (TUIAssertionLogFacility_onceToken != -1)
    dispatch_once(&TUIAssertionLogFacility_onceToken, &__block_literal_global_5244);
  return (id)TUIAssertionLogFacility_log;
}

id TUISmartReplyLog()
{
  if (TUISmartReplyLog_onceToken != -1)
    dispatch_once(&TUISmartReplyLog_onceToken, &__block_literal_global_5317);
  return (id)TUISmartReplyLog_log;
}

id TUICandidateGenerationLog()
{
  if (TUICandidateGenerationLog_onceToken != -1)
    dispatch_once(&TUICandidateGenerationLog_onceToken, &__block_literal_global_3);
  return (id)TUICandidateGenerationLog_log;
}

uint64_t __Block_byref_object_copy__5649(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5650(uint64_t a1)
{

}

uint64_t _isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = a3;
  v6 = a1 + a2;
  if (v6 >= objc_msgSend(v5, "length"))
  {
    v8 = 0;
  }
  else
  {
    if (_isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext_onceToken != -1)
      dispatch_once(&_isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext_onceToken, &__block_literal_global_5656);
    v7 = objc_msgSend(v5, "characterAtIndex:", v6);
    v8 = objc_msgSend((id)_isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext___customPunctuationCharacterSet, "characterIsMember:", v7);
  }

  return v8;
}

void ___isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3780], "punctuationCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeCharactersInString:", CFSTR("*"));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)_isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext___customPunctuationCharacterSet;
  _isTextEffectMatchingStringRangeFollowedByPunctuationInTypingContext___customPunctuationCharacterSet = v0;

}

id TUIEmojiUpscalerLog()
{
  if (TUIEmojiUpscalerLog_onceToken != -1)
    dispatch_once(&TUIEmojiUpscalerLog_onceToken, &__block_literal_global_44);
  return (id)TUIEmojiUpscalerLog_log;
}

uint64_t TUIRemoteEmojiSearchViewControllerEnabled()
{
  void *v0;
  void *v1;
  void *v2;

  if (TIGetRemoteEmojiValue_onceToken != -1)
    dispatch_once(&TIGetRemoteEmojiValue_onceToken, &__block_literal_global_6962);
  objc_msgSend(MEMORY[0x1E0DBDCA8], "sharedPreferencesController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "valueForPreferenceKey:", CFSTR("RemoteEmoji"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v0) = objc_msgSend(v1, "BOOLValue");
  if (!(_DWORD)v0)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceIdiom");

  return _os_feature_enabled_impl();
}

Class __getSTKStickerSearchQueryClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!StickerKitLibraryCore_frameworkLibrary)
    StickerKitLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("STKStickerSearchQuery");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSTKStickerSearchQueryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSTKStickerSearchConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!StickerKitLibraryCore_frameworkLibrary)
    StickerKitLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("STKStickerSearchConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSTKStickerSearchConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getSTKStickerRemoteSearchViewControllerClass()
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
  v0 = (void *)getSTKStickerRemoteSearchViewControllerClass_softClass;
  v7 = getSTKStickerRemoteSearchViewControllerClass_softClass;
  if (!getSTKStickerRemoteSearchViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSTKStickerRemoteSearchViewControllerClass_block_invoke;
    v3[3] = &unk_1E24FBD38;
    v3[4] = &v4;
    __getSTKStickerRemoteSearchViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

Class __getSTKStickerRemoteSearchViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!StickerKitLibraryCore_frameworkLibrary)
    StickerKitLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("STKStickerRemoteSearchViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSTKStickerRemoteSearchViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ___collapsedButtonBarGroupViewsPredicate_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("collapsed == NO"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_collapsedButtonBarGroupViewsPredicate_collapsedButtonBarGroupViewsPredicate;
  _collapsedButtonBarGroupViewsPredicate_collapsedButtonBarGroupViewsPredicate = v0;

}

void __Block_byref_object_copy__7947(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__7948(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void SetSmartReplyStartTimeForRequest(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;

  v3 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&mappingLock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SmartReplyTimestampDict();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v3);

  os_unfair_lock_unlock((os_unfair_lock_t)&mappingLock);
}

id TUIInputAnalyticsLogger()
{
  if (TUIInputAnalyticsLogger_onceToken != -1)
    dispatch_once(&TUIInputAnalyticsLogger_onceToken, &__block_literal_global_8124);
  return (id)TUIInputAnalyticsLogger_log;
}

uint64_t GetSmartReplyStartTimeForRequest(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&mappingLock);
  SmartReplyTimestampDict();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
    SmartReplyTimestampDict();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v1);

  }
  else
  {
    v4 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&mappingLock);

  return v4;
}

id SmartReplyTimestampDict()
{
  if (SmartReplyTimestampDict_onceToken != -1)
    dispatch_once(&SmartReplyTimestampDict_onceToken, &__block_literal_global_12);
  return (id)SmartReplyTimestampDict_mapping;
}

uint64_t sub_18C802A04()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_18C802A10()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_18C802A1C()
{
  return MEMORY[0x1E0D26078]();
}

uint64_t sub_18C802A28()
{
  return MEMORY[0x1E0D26090]();
}

uint64_t sub_18C802A34()
{
  return MEMORY[0x1E0D260B8]();
}

uint64_t sub_18C802A40()
{
  return MEMORY[0x1E0D260C8]();
}

uint64_t sub_18C802A4C()
{
  return MEMORY[0x1E0D260E8]();
}

uint64_t sub_18C802A58()
{
  return MEMORY[0x1E0D260F8]();
}

uint64_t sub_18C802A64()
{
  return MEMORY[0x1E0D26150]();
}

uint64_t sub_18C802A70()
{
  return MEMORY[0x1E0D26168]();
}

uint64_t sub_18C802A7C()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_18C802A88()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_18C802A94()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_18C802AA0()
{
  return MEMORY[0x1E0D8BE10]();
}

uint64_t sub_18C802AAC()
{
  return MEMORY[0x1E0D8BE28]();
}

uint64_t sub_18C802AB8()
{
  return MEMORY[0x1E0D8BE48]();
}

uint64_t sub_18C802AC4()
{
  return MEMORY[0x1E0DC1EF8]();
}

uint64_t sub_18C802AD0()
{
  return MEMORY[0x1E0CCE6E0]();
}

uint64_t sub_18C802ADC()
{
  return MEMORY[0x1E0CCE6F0]();
}

uint64_t sub_18C802AE8()
{
  return MEMORY[0x1E0CCE6F8]();
}

uint64_t sub_18C802AF4()
{
  return MEMORY[0x1E0CCE728]();
}

uint64_t sub_18C802B00()
{
  return MEMORY[0x1E0CCE730]();
}

uint64_t sub_18C802B0C()
{
  return MEMORY[0x1E0CCEAA8]();
}

uint64_t sub_18C802B18()
{
  return MEMORY[0x1E0CCEAB8]();
}

uint64_t sub_18C802B24()
{
  return MEMORY[0x1E0CCEAD0]();
}

uint64_t sub_18C802B30()
{
  return MEMORY[0x1E0CCEAD8]();
}

uint64_t sub_18C802B3C()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_18C802B48()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_18C802B54()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_18C802B60()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_18C802B6C()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_18C802B78()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_18C802B84()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_18C802B90()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_18C802B9C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_18C802BA8()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_18C802BB4()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_18C802BC0()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_18C802BCC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_18C802BD8()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_18C802BE4()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_18C802BF0()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_18C802BFC()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_18C802C08()
{
  return MEMORY[0x1E0DC3178]();
}

uint64_t sub_18C802C14()
{
  return MEMORY[0x1E0DC3228]();
}

uint64_t sub_18C802C20()
{
  return MEMORY[0x1E0DC3238]();
}

uint64_t sub_18C802C2C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_18C802C38()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_18C802C44()
{
  return MEMORY[0x1E0CB2568]();
}

uint64_t sub_18C802C50()
{
  return MEMORY[0x1E0CB2588]();
}

uint64_t sub_18C802C5C()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_18C802C68()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_18C802C74()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_18C802C80()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_18C802C8C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_18C802C98()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_18C802CA4()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_18C802CB0()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_18C802CBC()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_18C802CC8()
{
  return MEMORY[0x1E0DED9C8]();
}

uint64_t sub_18C802CD4()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_18C802CE0()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_18C802CEC()
{
  return MEMORY[0x1E0DEDF40]();
}

BOOL CAFrameRateRangeIsEqualToRange(CAFrameRateRange range, CAFrameRateRange other)
{
  return MEMORY[0x1E0CD23C8](*(__n128 *)&range.minimum, *(__n128 *)&range.maximum, *(__n128 *)&range.preferred, *(__n128 *)&other.minimum, *(__n128 *)&other.maximum, *(__n128 *)&other.preferred);
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2678](retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1E0C97DF0](alloc, str, attributes);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopy(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BC80](color);
}

CGColorRef CGColorCreateSRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB8](red, green, blue, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

CFTypeID CGColorGetTypeID(void)
{
  return MEMORY[0x1E0C9BD38]();
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

uint64_t CGColorTransformConvertColor()
{
  return MEMORY[0x1E0C9BF78]();
}

uint64_t CGColorTransformCreate()
{
  return MEMORY[0x1E0C9BF90]();
}

uint64_t CGColorTransformRelease()
{
  return MEMORY[0x1E0C9BFA0]();
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C538](c, x, y);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C8](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateWithRoundedRect(CGRect rect, CGFloat cornerWidth, CGFloat cornerHeight, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3D0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, cornerWidth, cornerHeight);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1E0CA79F8]();
}

uint64_t CTFontCreateForCharactersWithLanguage()
{
  return MEMORY[0x1E0CA7A48]();
}

double CTFontGetAdvancesForGlyphs(CTFontRef font, CTFontOrientation orientation, const CGGlyph *glyphs, CGSize *advances, CFIndex count)
{
  double result;

  MEMORY[0x1E0CA7B98](font, *(_QWORD *)&orientation, glyphs, advances, count);
  return result;
}

CGFloat CTFontGetAscent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BA0](font);
  return result;
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BC0](font);
  return result;
}

CGFloat CTFontGetDescent(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BD8](font);
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x1E0CA7C08](font, characters, glyphs, count);
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1E0CA7C10]();
}

CTLineRef CTLineCreateTruncatedLine(CTLineRef line, double width, CTLineTruncationType truncationType, CTLineRef truncationToken)
{
  return (CTLineRef)MEMORY[0x1E0CA7E70](line, *(_QWORD *)&truncationType, truncationToken, width);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1E0CA7EA8](line, context);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EC0](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  double result;

  MEMORY[0x1E0CA7F18](line, ascent, descent, leading);
  return result;
}

CTLineRef CTTypesetterCreateLine(CTTypesetterRef typesetter, CFRange stringRange)
{
  return (CTLineRef)MEMORY[0x1E0CA8090](typesetter, stringRange.location, stringRange.length);
}

CTTypesetterRef CTTypesetterCreateWithAttributedStringAndOptions(CFAttributedStringRef string, CFDictionaryRef options)
{
  return (CTTypesetterRef)MEMORY[0x1E0CA80A0](string, options);
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

void *__cdecl CVPixelBufferGetBaseAddress(CVPixelBufferRef pixelBuffer)
{
  return (void *)MEMORY[0x1E0CA8AE0](pixelBuffer);
}

size_t CVPixelBufferGetBytesPerRow(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8AF8](pixelBuffer);
}

CVReturn CVPixelBufferLockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags lockFlags)
{
  return MEMORY[0x1E0CA8B70](pixelBuffer, lockFlags);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

CVReturn CVPixelBufferUnlockBaseAddress(CVPixelBufferRef pixelBuffer, CVPixelBufferLockFlags unlockFlags)
{
  return MEMORY[0x1E0CA8C00](pixelBuffer, unlockFlags);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0DC32E0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1E0DC4500]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1E0DC4988]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x1E0DC4C00]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x1E0DC4C08](context);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

UIImageSymbolWeight UIImageSymbolWeightForFontWeight(UIFontWeight fontWeight)
{
  return MEMORY[0x1E0DC4CE0](fontWeight);
}

uint64_t UIKBGetNamedColor()
{
  return MEMORY[0x1E0DC4D50]();
}

uint64_t UIKeyboardGetCurrentInputMode()
{
  return MEMORY[0x1E0DC4EA0]();
}

uint64_t UIKeyboardGetLightCandidateHighlightColor()
{
  return MEMORY[0x1E0DC4EC8]();
}

uint64_t UIKeyboardGetLightCandidateSeparatorColor()
{
  return MEMORY[0x1E0DC4ED0]();
}

uint64_t UIKeyboardGetSafeDeviceIdiom()
{
  return MEMORY[0x1E0DC4ED8]();
}

uint64_t UIKeyboardGetSoftwareLayoutForInputMode()
{
  return MEMORY[0x1E0DC4EE0]();
}

uint64_t UIKeyboardGetSupportedLanguages()
{
  return MEMORY[0x1E0DC4EE8]();
}

uint64_t UIKeyboardInputModeGetBaseLanguage()
{
  return MEMORY[0x1E0DC4EF8]();
}

uint64_t UIKeyboardInputModeGetLanguageWithRegion()
{
  return MEMORY[0x1E0DC4F00]();
}

uint64_t UIKeyboardInputModeGetNormalizedIdentifier()
{
  return MEMORY[0x1E0DC4F08]();
}

uint64_t UIKeyboardInputModeIsDefaultRightToLeft()
{
  return MEMORY[0x1E0DC4F20]();
}

uint64_t UIKeyboardInputModeLanguageMatchesLocaleLanguage()
{
  return MEMORY[0x1E0DC4F28]();
}

uint64_t UIKeyboardLocalizedObject()
{
  return MEMORY[0x1E0DC4F60]();
}

uint64_t UIKeyboardLocalizedString()
{
  return MEMORY[0x1E0DC4F70]();
}

uint64_t UIKeyboardTypeIsNumberPad()
{
  return MEMORY[0x1E0DC4FC0]();
}

uint64_t UIKeyboardUIPreferStringOverImageForInputMode()
{
  return MEMORY[0x1E0DC4FC8]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1E0DC5258]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1E0DC5260]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1E0DC5270]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0DC5278]();
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0DC52B8]();
}

uint64_t UIRectInsetEdges()
{
  return MEMORY[0x1E0DC52C0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0DC52C8]();
}

uint64_t UIRectRoundToScale()
{
  return MEMORY[0x1E0DC52D8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFPropertyListCreateFiltered()
{
  return MEMORY[0x1E0C9A3F8]();
}

uint64_t _TextInputBundlesRoot()
{
  return MEMORY[0x1E0DC56C0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint64_t attributeValueFromString()
{
  return MEMORY[0x1E0DC5B38]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x1E0C83158]();
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

uint64_t kac_get_log()
{
  return MEMORY[0x1E0DBEB50]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F98](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

uint64_t variantsTypeFromString()
{
  return MEMORY[0x1E0DC5B50]();
}

uint64_t visualStyleFromString()
{
  return MEMORY[0x1E0DC5B58]();
}

