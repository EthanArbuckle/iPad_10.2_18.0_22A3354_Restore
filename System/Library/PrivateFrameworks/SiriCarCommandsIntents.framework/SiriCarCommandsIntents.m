id SetTrunkStatusIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SetTrunkStatusIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetTrunkStatusIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetTrunkStatusIntent()
{
  return objc_opt_self();
}

id SetTrunkStatusIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetTrunkStatusIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetTrunkStatusIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetTrunkStatusIntent.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for SetTrunkStatusIntent);
}

unint64_t SetTrunkStatusIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_2303A9D24(a1);
}

BOOL sub_2303A9754(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2303A9768()
{
  sub_2303ADC80();
  sub_2303ADC8C();
  return sub_2303ADC98();
}

uint64_t sub_2303A97AC()
{
  return sub_2303ADC8C();
}

uint64_t sub_2303A97D4()
{
  sub_2303ADC80();
  sub_2303ADC8C();
  return sub_2303ADC98();
}

unint64_t sub_2303A9814@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_2303A9D24(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_2303A9844(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t variable initialization expression of SetTrunkStatusIntentResponse.code()
{
  return 0;
}

uint64_t SetTrunkStatusIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SetTrunkStatusIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_2303A9928@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___SetTrunkStatusIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2303A9978(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___SetTrunkStatusIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

char *SetTrunkStatusIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SetTrunkStatusIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SetTrunkStatusIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SetTrunkStatusIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SetTrunkStatusIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___SetTrunkStatusIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetTrunkStatusIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SetTrunkStatusIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___SetTrunkStatusIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetTrunkStatusIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetTrunkStatusIntentResponse.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for SetTrunkStatusIntentResponse);
}

id sub_2303A9CB4(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t variable initialization expression of GetTrunkStatusIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of SetCarClimateIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of GetCarClimateIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of SetCarRadioStationIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of SetCarPlayClimateIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of SetCarPlaySeatSettingsIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of GetSignalActivationStatusIntentResponse.code()
{
  return 0;
}

uint64_t variable initialization expression of DeactivateSignalIntentResponse.code()
{
  return 0;
}

unint64_t sub_2303A9D24(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for SetTrunkStatusIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_2303A9D58()
{
  unint64_t result;

  result = qword_255E712D8;
  if (!qword_255E712D8)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for SetTrunkStatusIntentResponseCode, &type metadata for SetTrunkStatusIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255E712D8);
  }
  return result;
}

ValueMetadata *type metadata accessor for SetTrunkStatusIntentResponseCode()
{
  return &type metadata for SetTrunkStatusIntentResponseCode;
}

id GetTrunkStatusIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetTrunkStatusIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetTrunkStatusIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GetTrunkStatusIntent()
{
  return objc_opt_self();
}

id GetTrunkStatusIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id GetTrunkStatusIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetTrunkStatusIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetTrunkStatusIntent.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for GetTrunkStatusIntent);
}

unint64_t GetTrunkStatusIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_2303A9D24(a1);
}

uint64_t GetTrunkStatusIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___GetTrunkStatusIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *GetTrunkStatusIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___GetTrunkStatusIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *GetTrunkStatusIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___GetTrunkStatusIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id GetTrunkStatusIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___GetTrunkStatusIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetTrunkStatusIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GetTrunkStatusIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___GetTrunkStatusIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetTrunkStatusIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetTrunkStatusIntentResponse.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for GetTrunkStatusIntentResponse);
}

uint64_t type metadata accessor for GetTrunkStatusIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_2303AA33C()
{
  unint64_t result;

  result = qword_255E71398;
  if (!qword_255E71398)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for GetTrunkStatusIntentResponseCode, &type metadata for GetTrunkStatusIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255E71398);
  }
  return result;
}

uint64_t sub_2303AA380@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___GetTrunkStatusIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2303AA3D0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___GetTrunkStatusIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for GetTrunkStatusIntentResponseCode()
{
  return &type metadata for GetTrunkStatusIntentResponseCode;
}

unint64_t IntentTrunkStatus.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

uint64_t *sub_2303AA448@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

id static IntentTrunkStatusResolutionResult.success(with:)(uint64_t a1)
{
  return sub_2303AA4A8(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static IntentTrunkStatusResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_2303AA4A8(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id sub_2303AA4A8(uint64_t a1, SEL *a2)
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), *a2, a1);
}

id IntentTrunkStatusResolutionResult.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentTrunkStatusResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IntentTrunkStatusResolutionResult()
{
  return objc_opt_self();
}

unint64_t sub_2303AA568()
{
  unint64_t result;

  result = qword_255E713F0;
  if (!qword_255E713F0)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for IntentTrunkStatus, &type metadata for IntentTrunkStatus);
    atomic_store(result, (unint64_t *)&qword_255E713F0);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentTrunkStatus()
{
  return &type metadata for IntentTrunkStatus;
}

id SetCarClimateIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SetCarClimateIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarClimateIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetCarClimateIntent()
{
  return objc_opt_self();
}

id SetCarClimateIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetCarClimateIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarClimateIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarClimateIntent.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for SetCarClimateIntent);
}

unint64_t SetCarClimateIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_2303A9D24(a1);
}

uint64_t SetCarClimateIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SetCarClimateIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *SetCarClimateIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SetCarClimateIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SetCarClimateIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SetCarClimateIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SetCarClimateIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___SetCarClimateIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarClimateIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SetCarClimateIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___SetCarClimateIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarClimateIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarClimateIntentResponse.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for SetCarClimateIntentResponse);
}

uint64_t type metadata accessor for SetCarClimateIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_2303AAB44()
{
  unint64_t result;

  result = qword_255E71428;
  if (!qword_255E71428)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for SetCarClimateIntentResponseCode, &type metadata for SetCarClimateIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255E71428);
  }
  return result;
}

uint64_t sub_2303AAB88@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___SetCarClimateIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2303AABD8(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___SetCarClimateIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SetCarClimateIntentResponseCode()
{
  return &type metadata for SetCarClimateIntentResponseCode;
}

id GetCarClimateIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetCarClimateIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetCarClimateIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GetCarClimateIntent()
{
  return objc_opt_self();
}

id GetCarClimateIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id GetCarClimateIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetCarClimateIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetCarClimateIntent.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for GetCarClimateIntent);
}

unint64_t GetCarClimateIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_2303A9D24(a1);
}

uint64_t GetCarClimateIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___GetCarClimateIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *GetCarClimateIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___GetCarClimateIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *GetCarClimateIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___GetCarClimateIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id GetCarClimateIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___GetCarClimateIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetCarClimateIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GetCarClimateIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___GetCarClimateIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetCarClimateIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetCarClimateIntentResponse.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for GetCarClimateIntentResponse);
}

uint64_t type metadata accessor for GetCarClimateIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_2303AB1C4()
{
  unint64_t result;

  result = qword_255E71488;
  if (!qword_255E71488)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for GetCarClimateIntentResponseCode, &type metadata for GetCarClimateIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255E71488);
  }
  return result;
}

uint64_t sub_2303AB208@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___GetCarClimateIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2303AB258(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___GetCarClimateIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for GetCarClimateIntentResponseCode()
{
  return &type metadata for GetCarClimateIntentResponseCode;
}

unint64_t IntentClimate.init(rawValue:)(unint64_t a1)
{
  return sub_2303AB3A8(a1);
}

unint64_t sub_2303AB2D8@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_2303AB3A8(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id static IntentClimateResolutionResult.success(with:)(uint64_t a1)
{
  return sub_2303AA4A8(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static IntentClimateResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_2303AA4A8(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id IntentClimateResolutionResult.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentClimateResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2303AB3A8(unint64_t result)
{
  if (result > 4)
    return 0;
  return result;
}

uint64_t type metadata accessor for IntentClimateResolutionResult()
{
  return objc_opt_self();
}

unint64_t sub_2303AB3DC()
{
  unint64_t result;

  result = qword_255E714E0;
  if (!qword_255E714E0)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for IntentClimate, &type metadata for IntentClimate);
    atomic_store(result, (unint64_t *)&qword_255E714E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentClimate()
{
  return &type metadata for IntentClimate;
}

id SetCarRadioStationIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SetCarRadioStationIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarRadioStationIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetCarRadioStationIntent()
{
  return objc_opt_self();
}

id SetCarRadioStationIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetCarRadioStationIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarRadioStationIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarRadioStationIntent.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for SetCarRadioStationIntent);
}

unint64_t SetCarRadioStationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_2303A9D24(a1);
}

uint64_t SetCarRadioStationIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SetCarRadioStationIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *SetCarRadioStationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SetCarRadioStationIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SetCarRadioStationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SetCarRadioStationIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SetCarRadioStationIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___SetCarRadioStationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarRadioStationIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SetCarRadioStationIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___SetCarRadioStationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarRadioStationIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarRadioStationIntentResponse.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for SetCarRadioStationIntentResponse);
}

uint64_t type metadata accessor for SetCarRadioStationIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_2303AB9B8()
{
  unint64_t result;

  result = qword_255E71518;
  if (!qword_255E71518)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for SetCarRadioStationIntentResponseCode, &type metadata for SetCarRadioStationIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255E71518);
  }
  return result;
}

uint64_t sub_2303AB9FC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___SetCarRadioStationIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2303ABA4C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___SetCarRadioStationIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SetCarRadioStationIntentResponseCode()
{
  return &type metadata for SetCarRadioStationIntentResponseCode;
}

id SetCarPlayClimateIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SetCarPlayClimateIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarPlayClimateIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetCarPlayClimateIntent()
{
  return objc_opt_self();
}

id SetCarPlayClimateIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetCarPlayClimateIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarPlayClimateIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarPlayClimateIntent.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for SetCarPlayClimateIntent);
}

unint64_t SetCarPlayClimateIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_2303AC044(a1);
}

unint64_t sub_2303ABC54@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_2303AC044(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t SetCarPlayClimateIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SetCarPlayClimateIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *SetCarPlayClimateIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SetCarPlayClimateIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SetCarPlayClimateIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SetCarPlayClimateIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SetCarPlayClimateIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___SetCarPlayClimateIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarPlayClimateIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SetCarPlayClimateIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___SetCarPlayClimateIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarPlayClimateIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarPlayClimateIntentResponse.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for SetCarPlayClimateIntentResponse);
}

unint64_t sub_2303AC044(unint64_t result)
{
  unint64_t v1;

  if (result - 100 >= 2)
    v1 = 0;
  else
    v1 = result;
  if (result >= 7)
    return v1;
  return result;
}

uint64_t type metadata accessor for SetCarPlayClimateIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_2303AC08C()
{
  unint64_t result;

  result = qword_255E71578;
  if (!qword_255E71578)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for SetCarPlayClimateIntentResponseCode, &type metadata for SetCarPlayClimateIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255E71578);
  }
  return result;
}

uint64_t sub_2303AC0D0@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___SetCarPlayClimateIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2303AC120(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___SetCarPlayClimateIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SetCarPlayClimateIntentResponseCode()
{
  return &type metadata for SetCarPlayClimateIntentResponseCode;
}

id SetCarPlaySeatSettingsIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SetCarPlaySeatSettingsIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarPlaySeatSettingsIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SetCarPlaySeatSettingsIntent()
{
  return objc_opt_self();
}

id SetCarPlaySeatSettingsIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SetCarPlaySeatSettingsIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarPlaySeatSettingsIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarPlaySeatSettingsIntent.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for SetCarPlaySeatSettingsIntent);
}

unint64_t SetCarPlaySeatSettingsIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_2303AC044(a1);
}

uint64_t SetCarPlaySeatSettingsIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *SetCarPlaySeatSettingsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SetCarPlaySeatSettingsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SetCarPlaySeatSettingsIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SetCarPlaySeatSettingsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SetCarPlaySeatSettingsIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SetCarPlaySeatSettingsIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SetCarPlaySeatSettingsIntentResponse.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for SetCarPlaySeatSettingsIntentResponse);
}

uint64_t type metadata accessor for SetCarPlaySeatSettingsIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_2303AC70C()
{
  unint64_t result;

  result = qword_255E715D8;
  if (!qword_255E715D8)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for SetCarPlaySeatSettingsIntentResponseCode, &type metadata for SetCarPlaySeatSettingsIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255E715D8);
  }
  return result;
}

uint64_t sub_2303AC750@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2303AC7A0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___SetCarPlaySeatSettingsIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SetCarPlaySeatSettingsIntentResponseCode()
{
  return &type metadata for SetCarPlaySeatSettingsIntentResponseCode;
}

unint64_t IntentRadioBand.init(rawValue:)(unint64_t a1)
{
  return sub_2303AC8F0(a1);
}

unint64_t sub_2303AC820@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_2303AC8F0(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id static IntentRadioBandResolutionResult.success(with:)(uint64_t a1)
{
  return sub_2303AA4A8(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static IntentRadioBandResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_2303AA4A8(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id IntentRadioBandResolutionResult.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentRadioBandResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2303AC8F0(unint64_t result)
{
  if (result > 5)
    return 0;
  return result;
}

uint64_t type metadata accessor for IntentRadioBandResolutionResult()
{
  return objc_opt_self();
}

unint64_t sub_2303AC924()
{
  unint64_t result;

  result = qword_255E71630;
  if (!qword_255E71630)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for IntentRadioBand, &type metadata for IntentRadioBand);
    atomic_store(result, (unint64_t *)&qword_255E71630);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentRadioBand()
{
  return &type metadata for IntentRadioBand;
}

unint64_t IntentSeatType.init(rawValue:)(unint64_t a1)
{
  return sub_2303ACA64(a1);
}

unint64_t sub_2303AC994@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_2303ACA64(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

id static IntentSeatTypeResolutionResult.success(with:)(uint64_t a1)
{
  return sub_2303AA4A8(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static IntentSeatTypeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_2303AA4A8(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id IntentSeatTypeResolutionResult.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentSeatTypeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_2303ACA64(unint64_t result)
{
  if (result > 0xC)
    return 0;
  return result;
}

uint64_t type metadata accessor for IntentSeatTypeResolutionResult()
{
  return objc_opt_self();
}

unint64_t sub_2303ACA98()
{
  unint64_t result;

  result = qword_255E71660;
  if (!qword_255E71660)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for IntentSeatType, &type metadata for IntentSeatType);
    atomic_store(result, (unint64_t *)&qword_255E71660);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentSeatType()
{
  return &type metadata for IntentSeatType;
}

unint64_t IntentRelativeTemperatureChange.init(rawValue:)(unint64_t a1)
{
  return sub_2303AB3A8(a1);
}

id static IntentRelativeTemperatureChangeResolutionResult.success(with:)(uint64_t a1)
{
  return sub_2303AA4A8(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static IntentRelativeTemperatureChangeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_2303AA4A8(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id IntentRelativeTemperatureChangeResolutionResult.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentRelativeTemperatureChangeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IntentRelativeTemperatureChangeResolutionResult()
{
  return objc_opt_self();
}

unint64_t sub_2303ACBCC()
{
  unint64_t result;

  result = qword_255E71690;
  if (!qword_255E71690)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for IntentRelativeTemperatureChange, &type metadata for IntentRelativeTemperatureChange);
    atomic_store(result, (unint64_t *)&qword_255E71690);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentRelativeTemperatureChange()
{
  return &type metadata for IntentRelativeTemperatureChange;
}

unint64_t IntentTemperatureChange.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

id static IntentTemperatureChangeResolutionResult.success(with:)(uint64_t a1)
{
  return sub_2303AA4A8(a1, (SEL *)&selRef_successWithResolvedValue_);
}

id static IntentTemperatureChangeResolutionResult.confirmationRequired(with:)(uint64_t a1)
{
  return sub_2303AA4A8(a1, (SEL *)&selRef_confirmationRequiredWithValueToConfirm_);
}

id IntentTemperatureChangeResolutionResult.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IntentTemperatureChangeResolutionResult();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IntentTemperatureChangeResolutionResult()
{
  return objc_opt_self();
}

unint64_t sub_2303ACCF8()
{
  unint64_t result;

  result = qword_255E716C0;
  if (!qword_255E716C0)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for IntentTemperatureChange, &type metadata for IntentTemperatureChange);
    atomic_store(result, (unint64_t *)&qword_255E716C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for IntentTemperatureChange()
{
  return &type metadata for IntentTemperatureChange;
}

id GetSignalActivationStatusIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetSignalActivationStatusIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetSignalActivationStatusIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GetSignalActivationStatusIntent()
{
  return objc_opt_self();
}

id GetSignalActivationStatusIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id GetSignalActivationStatusIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetSignalActivationStatusIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetSignalActivationStatusIntent.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for GetSignalActivationStatusIntent);
}

unint64_t GetSignalActivationStatusIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_2303A9D24(a1);
}

uint64_t GetSignalActivationStatusIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___GetSignalActivationStatusIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *GetSignalActivationStatusIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___GetSignalActivationStatusIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *GetSignalActivationStatusIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___GetSignalActivationStatusIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id GetSignalActivationStatusIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___GetSignalActivationStatusIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetSignalActivationStatusIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GetSignalActivationStatusIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___GetSignalActivationStatusIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetSignalActivationStatusIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetSignalActivationStatusIntentResponse.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for GetSignalActivationStatusIntentResponse);
}

uint64_t GetSignalActivationStatusCarSignalUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 4) < 0xFFFFFFFFFFFFFFFDLL)
    return 0;
  return result;
}

uint64_t *sub_2303AD2D0@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  unint64_t v3;
  BOOL v4;
  BOOL v5;

  v2 = *result;
  v3 = *result - 4;
  v4 = __CFADD__(v3, 3);
  v5 = v3 < 0xFFFFFFFFFFFFFFFDLL;
  if (!v4)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

id static GetSignalActivationStatusCarSignalResolutionResult.unsupported(forReason:)(uint64_t a1)
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupportedWithReason_, a1);
}

id GetSignalActivationStatusCarSignalResolutionResult.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for GetSignalActivationStatusCarSignalResolutionResult);
}

uint64_t type metadata accessor for GetSignalActivationStatusIntentResponse()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for GetSignalActivationStatusCarSignalResolutionResult()
{
  return objc_opt_self();
}

unint64_t sub_2303AD3A4()
{
  unint64_t result;

  result = qword_255E716F8;
  if (!qword_255E716F8)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for GetSignalActivationStatusIntentResponseCode, &type metadata for GetSignalActivationStatusIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255E716F8);
  }
  return result;
}

unint64_t sub_2303AD3EC()
{
  unint64_t result;

  result = qword_255E71700;
  if (!qword_255E71700)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for GetSignalActivationStatusCarSignalUnsupportedReason, &type metadata for GetSignalActivationStatusCarSignalUnsupportedReason);
    atomic_store(result, (unint64_t *)&qword_255E71700);
  }
  return result;
}

uint64_t sub_2303AD430@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___GetSignalActivationStatusIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2303AD480(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___GetSignalActivationStatusIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for GetSignalActivationStatusIntentResponseCode()
{
  return &type metadata for GetSignalActivationStatusIntentResponseCode;
}

ValueMetadata *type metadata accessor for GetSignalActivationStatusCarSignalUnsupportedReason()
{
  return &type metadata for GetSignalActivationStatusCarSignalUnsupportedReason;
}

id DeactivateSignalIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DeactivateSignalIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeactivateSignalIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for DeactivateSignalIntent()
{
  return objc_opt_self();
}

id DeactivateSignalIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id DeactivateSignalIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DeactivateSignalIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DeactivateSignalIntent.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for DeactivateSignalIntent);
}

unint64_t DeactivateSignalIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_2303A9D24(a1);
}

uint64_t DeactivateSignalIntentResponse.code.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DeactivateSignalIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *DeactivateSignalIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___DeactivateSignalIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *DeactivateSignalIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___DeactivateSignalIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id DeactivateSignalIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___DeactivateSignalIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DeactivateSignalIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DeactivateSignalIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___DeactivateSignalIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DeactivateSignalIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DeactivateSignalIntentResponse.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for DeactivateSignalIntentResponse);
}

uint64_t DeactivateSignalCarSignalUnsupportedReason.init(rawValue:)(uint64_t result)
{
  if ((unint64_t)(result - 4) < 0xFFFFFFFFFFFFFFFDLL)
    return 0;
  return result;
}

id static DeactivateSignalCarSignalResolutionResult.unsupported(forReason:)(uint64_t a1)
{
  return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupportedWithReason_, a1);
}

id DeactivateSignalCarSignalResolutionResult.__deallocating_deinit()
{
  return sub_2303A9CB4(type metadata accessor for DeactivateSignalCarSignalResolutionResult);
}

uint64_t type metadata accessor for DeactivateSignalIntentResponse()
{
  return objc_opt_self();
}

uint64_t type metadata accessor for DeactivateSignalCarSignalResolutionResult()
{
  return objc_opt_self();
}

unint64_t sub_2303ADB30()
{
  unint64_t result;

  result = qword_255E71788;
  if (!qword_255E71788)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for DeactivateSignalIntentResponseCode, &type metadata for DeactivateSignalIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_255E71788);
  }
  return result;
}

unint64_t sub_2303ADB78()
{
  unint64_t result;

  result = qword_255E71790;
  if (!qword_255E71790)
  {
    result = MEMORY[0x2348B7EEC](&protocol conformance descriptor for DeactivateSignalCarSignalUnsupportedReason, &type metadata for DeactivateSignalCarSignalUnsupportedReason);
    atomic_store(result, (unint64_t *)&qword_255E71790);
  }
  return result;
}

uint64_t sub_2303ADBBC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___DeactivateSignalIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_2303ADC0C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___DeactivateSignalIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for DeactivateSignalIntentResponseCode()
{
  return &type metadata for DeactivateSignalIntentResponseCode;
}

ValueMetadata *type metadata accessor for DeactivateSignalCarSignalUnsupportedReason()
{
  return &type metadata for DeactivateSignalCarSignalUnsupportedReason;
}

uint64_t sub_2303ADC80()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_2303ADC8C()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_2303ADC98()
{
  return MEMORY[0x24BEE4328]();
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

