void sub_213B49664(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_sportName, a2);
}

void sub_213B49670(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setSportName_);
}

void sub_213B4967C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_leagueName, a2);
}

void sub_213B49688(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setLeagueName_);
}

void sub_213B49694(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_teamName, a2);
}

void sub_213B496A0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setTeamName_);
}

void sub_213B496AC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_athleteName, a2);
}

void sub_213B496B8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setAthleteName_);
}

void sub_213B496C4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_sportQId, a2);
}

void sub_213B496D0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setSportQId_);
}

void sub_213B496DC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_leagueQId, a2);
}

void sub_213B496E8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setLeagueQId_);
}

void sub_213B496F4(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_teamQId, a2);
}

void sub_213B49700(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setTeamQId_);
}

void sub_213B4970C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_athleteQId, a2);
}

void sub_213B49718(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    v6 = sub_213B4D6BC();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_213B49778(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setAthleteQId_);
}

void sub_213B49784(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v7 = sub_213B4D6B0();
  else
    v7 = 0;
  v8 = (id)v7;
  objc_msgSend(v6, *a5);

}

id SearchForSportsIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SearchForSportsIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchForSportsIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SearchForSportsIntent()
{
  return objc_opt_self();
}

id SearchForSportsIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SearchForSportsIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SearchForSportsIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SearchForSportsIntent.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for SearchForSportsIntent);
}

unint64_t SearchForSportsIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_213B49F0C(a1);
}

BOOL sub_213B49984(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_213B49998()
{
  sub_213B4D704();
  sub_213B4D710();
  return sub_213B4D71C();
}

uint64_t sub_213B499DC()
{
  return sub_213B4D710();
}

uint64_t sub_213B49A04()
{
  sub_213B4D704();
  sub_213B4D710();
  return sub_213B4D71C();
}

unint64_t sub_213B49A44@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_213B49F0C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_213B49A74(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_213B49AC4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SearchForSportsIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_213B49B50@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___SearchForSportsIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_213B49BA0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___SearchForSportsIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

char *SearchForSportsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SearchForSportsIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SearchForSportsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SearchForSportsIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SearchForSportsIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___SearchForSportsIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchForSportsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchForSportsIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___SearchForSportsIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SearchForSportsIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SearchForSportsIntentResponse.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for SearchForSportsIntentResponse);
}

id sub_213B49EDC(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

unint64_t sub_213B49F0C(unint64_t result)
{
  if (result > 6)
    return 0;
  return result;
}

uint64_t type metadata accessor for SearchForSportsIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_213B49F40()
{
  unint64_t result;

  result = qword_254D23D00;
  if (!qword_254D23D00)
  {
    result = MEMORY[0x2199BD328](&protocol conformance descriptor for SearchForSportsIntentResponseCode, &type metadata for SearchForSportsIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_254D23D00);
  }
  return result;
}

char *keypath_get_selector_sportName()
{
  return sel_sportName;
}

char *keypath_get_selector_leagueName()
{
  return sel_leagueName;
}

char *keypath_get_selector_teamName()
{
  return sel_teamName;
}

char *keypath_get_selector_athleteName()
{
  return sel_athleteName;
}

char *keypath_get_selector_sportQId()
{
  return sel_sportQId;
}

char *keypath_get_selector_leagueQId()
{
  return sel_leagueQId;
}

char *keypath_get_selector_teamQId()
{
  return sel_teamQId;
}

char *keypath_get_selector_athleteQId()
{
  return sel_athleteQId;
}

ValueMetadata *type metadata accessor for SearchForSportsIntentResponseCode()
{
  return &type metadata for SearchForSportsIntentResponseCode;
}

uint64_t method lookup function for SearchForSportsIntentResponse()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SearchForSportsIntentResponse.code.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

id GetSuggestionsIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GetSuggestionsIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetSuggestionsIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GetSuggestionsIntent()
{
  return objc_opt_self();
}

id GetSuggestionsIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id GetSuggestionsIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetSuggestionsIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetSuggestionsIntent.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for GetSuggestionsIntent);
}

unint64_t GetSuggestionsIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_213B49F0C(a1);
}

void sub_213B4A1C8(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(*a1, sel_suggestions);
  if (v3)
  {
    v4 = v3;
    type metadata accessor for Suggestion();
    v5 = sub_213B4D6D4();

  }
  else
  {
    v5 = 0;
  }
  *a2 = v5;
}

void sub_213B4A234(_QWORD *a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*a1)
  {
    type metadata accessor for Suggestion();
    v3 = sub_213B4D6C8();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  objc_msgSend(v2, sel_setSuggestions_);

}

uint64_t sub_213B4A2DC()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___GetSuggestionsIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *GetSuggestionsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___GetSuggestionsIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *GetSuggestionsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___GetSuggestionsIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id GetSuggestionsIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___GetSuggestionsIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GetSuggestionsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id GetSuggestionsIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___GetSuggestionsIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for GetSuggestionsIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id GetSuggestionsIntentResponse.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for GetSuggestionsIntentResponse);
}

uint64_t type metadata accessor for GetSuggestionsIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_213B4A67C()
{
  unint64_t result;

  result = qword_254D23D98;
  if (!qword_254D23D98)
  {
    result = MEMORY[0x2199BD328](&protocol conformance descriptor for GetSuggestionsIntentResponseCode, &type metadata for GetSuggestionsIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_254D23D98);
  }
  return result;
}

char *keypath_get_selector_suggestions()
{
  return sel_suggestions;
}

uint64_t sub_213B4A6D4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___GetSuggestionsIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_213B4A724(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___GetSuggestionsIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for GetSuggestionsIntentResponseCode()
{
  return &type metadata for GetSuggestionsIntentResponseCode;
}

uint64_t method lookup function for GetSuggestionsIntentResponse()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GetSuggestionsIntentResponse.code.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

id ExecuteSuggestionIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id ExecuteSuggestionIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExecuteSuggestionIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for ExecuteSuggestionIntent()
{
  return objc_opt_self();
}

id ExecuteSuggestionIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ExecuteSuggestionIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ExecuteSuggestionIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ExecuteSuggestionIntent.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for ExecuteSuggestionIntent);
}

unint64_t ExecuteSuggestionIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_213B49F0C(a1);
}

uint64_t sub_213B4A998()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___ExecuteSuggestionIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *ExecuteSuggestionIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___ExecuteSuggestionIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *ExecuteSuggestionIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___ExecuteSuggestionIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id ExecuteSuggestionIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___ExecuteSuggestionIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ExecuteSuggestionIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id ExecuteSuggestionIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___ExecuteSuggestionIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ExecuteSuggestionIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ExecuteSuggestionIntentResponse.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for ExecuteSuggestionIntentResponse);
}

uint64_t type metadata accessor for ExecuteSuggestionIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_213B4AD38()
{
  unint64_t result;

  result = qword_254D23DF8;
  if (!qword_254D23DF8)
  {
    result = MEMORY[0x2199BD328](&protocol conformance descriptor for ExecuteSuggestionIntentResponseCode, &type metadata for ExecuteSuggestionIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_254D23DF8);
  }
  return result;
}

char *keypath_get_selector_suggestion()
{
  return sel_suggestion;
}

id sub_213B4AD88@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_suggestion);
  *a2 = result;
  return result;
}

id sub_213B4ADC0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setSuggestion_, *a1);
}

uint64_t sub_213B4ADD4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___ExecuteSuggestionIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_213B4AE24(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___ExecuteSuggestionIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for ExecuteSuggestionIntentResponseCode()
{
  return &type metadata for ExecuteSuggestionIntentResponseCode;
}

uint64_t method lookup function for ExecuteSuggestionIntentResponse()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ExecuteSuggestionIntentResponse.code.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

void sub_213B4AEB0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_actionIdentifier);
  if (v3)
  {
    v4 = v3;
    v5 = sub_213B4D6BC();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_213B4AF14(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_213B4D6B0();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setActionIdentifier_);

}

void sub_213B4AF70(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_msgSend(*a1, sel_parameters);
  if (v3)
  {
    v4 = v3;
    type metadata accessor for ActionParameter();
    v5 = sub_213B4D6D4();

  }
  else
  {
    v5 = 0;
  }
  *a2 = v5;
}

void sub_213B4AFDC(_QWORD *a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*a1)
  {
    type metadata accessor for ActionParameter();
    v3 = sub_213B4D6C8();
  }
  else
  {
    v3 = 0;
  }
  v4 = (id)v3;
  objc_msgSend(v2, sel_setParameters_);

}

uint64_t sub_213B4B048()
{
  return 1;
}

id Suggestion.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a2)
  {
    v8 = (void *)sub_213B4D6B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)sub_213B4D6B0();
  swift_bridgeObjectRelease();
  if (a6)
  {
    v10 = (void *)sub_213B4D6B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id Suggestion.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  if (a2)
  {
    v8 = (void *)sub_213B4D6B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)sub_213B4D6B0();
  swift_bridgeObjectRelease();
  if (a6)
  {
    v10 = (void *)sub_213B4D6B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for Suggestion();
  v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for Suggestion()
{
  return objc_opt_self();
}

id Suggestion.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id Suggestion.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for Suggestion();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id Suggestion.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for Suggestion);
}

id sub_213B4B390(uint64_t a1)
{
  objc_super v3;

  v3.receiver = (id)swift_getObjCClassFromMetadata();
  v3.super_class = (Class)&OBJC_METACLASS___SuggestionResolutionResult;
  return objc_msgSendSuper2(&v3, sel_successWithResolvedObject_, a1);
}

id sub_213B4B41C(unint64_t a1)
{
  void *ObjCClassFromMetadata;
  void *v2;
  id v3;
  objc_super v5;

  if (a1 >> 62)
  {
    sub_213B4B510();
    swift_bridgeObjectRetain();
    sub_213B4D6EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_213B4D6F8();
    sub_213B4B510();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_213B4B510();
  v2 = (void *)sub_213B4D6C8();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___SuggestionResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

unint64_t sub_213B4B510()
{
  unint64_t result;

  result = qword_254D23E78;
  if (!qword_254D23E78)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254D23E78);
  }
  return result;
}

id sub_213B4B5A4(uint64_t a1)
{
  objc_super v3;

  v3.receiver = (id)swift_getObjCClassFromMetadata();
  v3.super_class = (Class)&OBJC_METACLASS___SuggestionResolutionResult;
  return objc_msgSendSuper2(&v3, sel_confirmationRequiredWithObjectToConfirm_, a1);
}

void sub_213B4B63C()
{
  sub_213B4D6E0();
  __break(1u);
}

void sub_213B4B6CC()
{
  sub_213B4D6E0();
  __break(1u);
}

void sub_213B4B75C()
{
  sub_213B4D6E0();
  __break(1u);
}

id SuggestionResolutionResult.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for SuggestionResolutionResult);
}

uint64_t type metadata accessor for SuggestionResolutionResult()
{
  return objc_opt_self();
}

char *keypath_get_selector_actionIdentifier()
{
  return sel_actionIdentifier;
}

char *keypath_get_selector_parameters()
{
  return sel_parameters;
}

uint64_t method lookup function for SuggestionResolutionResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static SuggestionResolutionResult.success(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static SuggestionResolutionResult.disambiguation(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static SuggestionResolutionResult.confirmationRequired(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

id ActionParameter.__allocating_init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (a2)
  {
    v8 = (void *)sub_213B4D6B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)sub_213B4D6B0();
  swift_bridgeObjectRelease();
  if (a6)
  {
    v10 = (void *)sub_213B4D6B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend(objc_allocWithZone(v6), sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

id ActionParameter.init(identifier:display:pronunciationHint:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  if (a2)
  {
    v8 = (void *)sub_213B4D6B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)sub_213B4D6B0();
  swift_bridgeObjectRelease();
  if (a6)
  {
    v10 = (void *)sub_213B4D6B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v6;
  v13.super_class = (Class)type metadata accessor for ActionParameter();
  v11 = objc_msgSendSuper2(&v13, sel_initWithIdentifier_displayString_pronunciationHint_, v8, v9, v10);

  return v11;
}

uint64_t type metadata accessor for ActionParameter()
{
  return objc_opt_self();
}

id ActionParameter.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id ActionParameter.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for ActionParameter();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id ActionParameter.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for ActionParameter);
}

id sub_213B4BBAC(uint64_t a1)
{
  objc_super v3;

  v3.receiver = (id)swift_getObjCClassFromMetadata();
  v3.super_class = (Class)&OBJC_METACLASS___ActionParameterResolutionResult;
  return objc_msgSendSuper2(&v3, sel_successWithResolvedObject_, a1);
}

id sub_213B4BC38(unint64_t a1)
{
  void *ObjCClassFromMetadata;
  void *v2;
  id v3;
  objc_super v5;

  if (a1 >> 62)
  {
    sub_213B4B510();
    swift_bridgeObjectRetain();
    sub_213B4D6EC();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRetain();
    sub_213B4D6F8();
    sub_213B4B510();
  }
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_213B4B510();
  v2 = (void *)sub_213B4D6C8();
  swift_bridgeObjectRelease();
  v5.receiver = ObjCClassFromMetadata;
  v5.super_class = (Class)&OBJC_METACLASS___ActionParameterResolutionResult;
  v3 = objc_msgSendSuper2(&v5, sel_disambiguationWithObjectsToDisambiguate_, v2);

  return v3;
}

id sub_213B4BD84(uint64_t a1)
{
  objc_super v3;

  v3.receiver = (id)swift_getObjCClassFromMetadata();
  v3.super_class = (Class)&OBJC_METACLASS___ActionParameterResolutionResult;
  return objc_msgSendSuper2(&v3, sel_confirmationRequiredWithObjectToConfirm_, a1);
}

void sub_213B4BE1C()
{
  sub_213B4D6E0();
  __break(1u);
}

void sub_213B4BEAC()
{
  sub_213B4D6E0();
  __break(1u);
}

void sub_213B4BF3C()
{
  sub_213B4D6E0();
  __break(1u);
}

id ActionParameterResolutionResult.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for ActionParameterResolutionResult);
}

uint64_t type metadata accessor for ActionParameterResolutionResult()
{
  return objc_opt_self();
}

char *keypath_get_selector_key()
{
  return sel_key;
}

void sub_213B4C004(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_key, a2);
}

void sub_213B4C020(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setKey_);
}

char *keypath_get_selector_value()
{
  return sel_value;
}

void sub_213B4C048(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_value, a2);
}

void sub_213B4C064(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setValue_);
}

uint64_t method lookup function for ActionParameterResolutionResult()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static ActionParameterResolutionResult.success(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static ActionParameterResolutionResult.disambiguation(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static ActionParameterResolutionResult.confirmationRequired(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

id SocialConversationIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SocialConversationIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SocialConversationIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SocialConversationIntent()
{
  return objc_opt_self();
}

id SocialConversationIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SocialConversationIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SocialConversationIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SocialConversationIntent.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for SocialConversationIntent);
}

unint64_t SocialConversationIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_213B49F0C(a1);
}

uint64_t sub_213B4C28C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SocialConversationIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *SocialConversationIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SocialConversationIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SocialConversationIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SocialConversationIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SocialConversationIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___SocialConversationIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SocialConversationIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SocialConversationIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___SocialConversationIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SocialConversationIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SocialConversationIntentResponse.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for SocialConversationIntentResponse);
}

uint64_t type metadata accessor for SocialConversationIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_213B4C62C()
{
  unint64_t result;

  result = qword_254D23F00;
  if (!qword_254D23F00)
  {
    result = MEMORY[0x2199BD328](&protocol conformance descriptor for SocialConversationIntentResponseCode, &type metadata for SocialConversationIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_254D23F00);
  }
  return result;
}

char *keypath_get_selector_intentType()
{
  return sel_intentType;
}

void sub_213B4C67C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_intentType, a2);
}

void sub_213B4C698(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setIntentType_);
}

char *keypath_get_selector_catID()
{
  return sel_catID;
}

void sub_213B4C6C0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_catID, a2);
}

void sub_213B4C6DC(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setCatID_);
}

char *keypath_get_selector_dialogID()
{
  return sel_dialogID;
}

void sub_213B4C704(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_dialogID, a2);
}

void sub_213B4C720(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setDialogID_);
}

uint64_t sub_213B4C73C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___SocialConversationIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_213B4C78C(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___SocialConversationIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SocialConversationIntentResponseCode()
{
  return &type metadata for SocialConversationIntentResponseCode;
}

uint64_t method lookup function for SocialConversationIntentResponse()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SocialConversationIntentResponse.code.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

id SiriLinkFlowIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SiriLinkFlowIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriLinkFlowIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SiriLinkFlowIntent()
{
  return objc_opt_self();
}

id SiriLinkFlowIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id SiriLinkFlowIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SiriLinkFlowIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SiriLinkFlowIntent.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for SiriLinkFlowIntent);
}

unint64_t SiriLinkFlowIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_213B49F0C(a1);
}

uint64_t sub_213B4CA00()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___SiriLinkFlowIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *SiriLinkFlowIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___SiriLinkFlowIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *SiriLinkFlowIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___SiriLinkFlowIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id SiriLinkFlowIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___SiriLinkFlowIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriLinkFlowIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SiriLinkFlowIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___SiriLinkFlowIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SiriLinkFlowIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id SiriLinkFlowIntentResponse.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for SiriLinkFlowIntentResponse);
}

uint64_t type metadata accessor for SiriLinkFlowIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_213B4CDA0()
{
  unint64_t result;

  result = qword_254D23F60;
  if (!qword_254D23F60)
  {
    result = MEMORY[0x2199BD328](&protocol conformance descriptor for SiriLinkFlowIntentResponseCode, &type metadata for SiriLinkFlowIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_254D23F60);
  }
  return result;
}

char *keypath_get_selector_bundleIdentifier()
{
  return sel_bundleIdentifier;
}

void sub_213B4CDF0(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_bundleIdentifier, a2);
}

void sub_213B4CE0C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setBundleIdentifier_);
}

void sub_213B4CE28(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_actionIdentifier, a2);
}

void sub_213B4CE44(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setActionIdentifier_);
}

uint64_t sub_213B4CE60@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___SiriLinkFlowIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_213B4CEB0(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___SiriLinkFlowIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for SiriLinkFlowIntentResponseCode()
{
  return &type metadata for SiriLinkFlowIntentResponseCode;
}

uint64_t method lookup function for SiriLinkFlowIntentResponse()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SiriLinkFlowIntentResponse.code.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

id DisambiguateActionsIntent.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id DisambiguateActionsIntent.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DisambiguateActionsIntent();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for DisambiguateActionsIntent()
{
  return objc_opt_self();
}

id DisambiguateActionsIntent.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id DisambiguateActionsIntent.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  objc_super v5;

  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DisambiguateActionsIntent();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DisambiguateActionsIntent.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for DisambiguateActionsIntent);
}

unint64_t DisambiguateActionsIntentResponseCode.init(rawValue:)(unint64_t a1)
{
  return sub_213B49F0C(a1);
}

uint64_t sub_213B4D124()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___DisambiguateActionsIntentResponse_code;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

char *DisambiguateActionsIntentResponse.__allocating_init(code:userActivity:)(uint64_t a1, void *a2)
{
  objc_class *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(objc_allocWithZone(v2), sel_init);
  v6 = &v5[OBJC_IVAR___DisambiguateActionsIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

char *DisambiguateActionsIntentResponse.init(code:userActivity:)(uint64_t a1, void *a2)
{
  void *v2;
  char *v5;
  char *v6;
  char *v7;

  v5 = (char *)objc_msgSend(v2, sel_init);
  v6 = &v5[OBJC_IVAR___DisambiguateActionsIntentResponse_code];
  swift_beginAccess();
  *(_QWORD *)v6 = a1;
  v7 = v5;
  objc_msgSend(v7, sel_setUserActivity_, a2);

  return v7;
}

id DisambiguateActionsIntentResponse.init()()
{
  char *v0;
  objc_super v2;

  *(_QWORD *)&v0[OBJC_IVAR___DisambiguateActionsIntentResponse_code] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DisambiguateActionsIntentResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id DisambiguateActionsIntentResponse.init(coder:)(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR___DisambiguateActionsIntentResponse_code] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for DisambiguateActionsIntentResponse();
  v3 = objc_msgSendSuper2(&v5, sel_initWithCoder_, a1);

  return v3;
}

id DisambiguateActionsIntentResponse.__deallocating_deinit()
{
  return sub_213B49EDC(type metadata accessor for DisambiguateActionsIntentResponse);
}

uint64_t type metadata accessor for DisambiguateActionsIntentResponse()
{
  return objc_opt_self();
}

unint64_t sub_213B4D4C4()
{
  unint64_t result;

  result = qword_254D23FC0;
  if (!qword_254D23FC0)
  {
    result = MEMORY[0x2199BD328](&protocol conformance descriptor for DisambiguateActionsIntentResponseCode, &type metadata for DisambiguateActionsIntentResponseCode);
    atomic_store(result, (unint64_t *)&qword_254D23FC0);
  }
  return result;
}

char *keypath_get_selector_candidateBundles()
{
  return sel_candidateBundles;
}

void sub_213B4D514(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_candidateBundles, a2);
}

void sub_213B4D530(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setCandidateBundles_);
}

char *keypath_get_selector_candidateActions()
{
  return sel_candidateActions;
}

void sub_213B4D558(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_candidateActions, a2);
}

void sub_213B4D574(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setCandidateActions_);
}

char *keypath_get_selector_selectedCandidateIndex()
{
  return sel_selectedCandidateIndex;
}

void sub_213B4D59C(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_213B49718(a1, (SEL *)&selRef_selectedCandidateIndex, a2);
}

void sub_213B4D5B8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_213B49784(a1, a2, a3, a4, (SEL *)&selRef_setSelectedCandidateIndex_);
}

uint64_t sub_213B4D5D4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(*a1 + OBJC_IVAR___DisambiguateActionsIntentResponse_code);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_213B4D624(uint64_t *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_QWORD *)(*a2 + OBJC_IVAR___DisambiguateActionsIntentResponse_code);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

ValueMetadata *type metadata accessor for DisambiguateActionsIntentResponseCode()
{
  return &type metadata for DisambiguateActionsIntentResponseCode;
}

uint64_t method lookup function for DisambiguateActionsIntentResponse()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of DisambiguateActionsIntentResponse.code.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t sub_213B4D6B0()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_213B4D6BC()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_213B4D6C8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_213B4D6D4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_213B4D6E0()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_213B4D6EC()
{
  return MEMORY[0x24BEE2F58]();
}

uint64_t sub_213B4D6F8()
{
  return MEMORY[0x24BEE3B90]();
}

uint64_t sub_213B4D704()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_213B4D710()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_213B4D71C()
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

