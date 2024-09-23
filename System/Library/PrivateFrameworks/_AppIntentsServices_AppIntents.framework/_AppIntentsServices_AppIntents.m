id sub_24B34C6E4()
{
  char *v0;

  return IntentToggleOperation.lnValue.getter(*v0);
}

id IntentToggleOperation.lnValue.getter(char a1)
{
  return sub_24B34C7EC(a1, MEMORY[0x24BDB5E80], (SEL *)&selRef_intentToggleOperationValueType);
}

uint64_t sub_24B34C700()
{
  sub_24B34CB8C();
  return sub_24B3503EC();
}

uint64_t sub_24B34C738()
{
  sub_24B34CB8C();
  return sub_24B350404();
}

id static IntentToggleOperation.lnValueType.getter()
{
  return sub_24B34C8EC((SEL *)&selRef_intentToggleOperationValueType);
}

uint64_t sub_24B34C798()
{
  sub_24B34CB8C();
  return sub_24B3503F8();
}

id sub_24B34C7D0()
{
  char *v0;

  return IntentToggleState.lnValue.getter(*v0);
}

id IntentToggleState.lnValue.getter(char a1)
{
  return sub_24B34C7EC(a1, MEMORY[0x24BDB5858], (SEL *)&selRef_intentToggleStateValueType);
}

id sub_24B34C7EC(char a1, void (*a2)(_QWORD *__return_ptr, _QWORD), SEL *a3)
{
  id v4;
  id v5;
  _QWORD v7[4];

  a2(v7, a1 & 1);
  v4 = objc_msgSend((id)objc_opt_self(), *a3);
  v5 = objc_allocWithZone(MEMORY[0x24BE5FE00]);
  return sub_24B34C95C(v7, v4);
}

uint64_t sub_24B34C858()
{
  sub_24B34CB50();
  return sub_24B3503EC();
}

uint64_t sub_24B34C890()
{
  sub_24B34CB50();
  return sub_24B350404();
}

id static IntentToggleState.lnValueType.getter()
{
  return sub_24B34C8EC((SEL *)&selRef_intentToggleStateValueType);
}

id sub_24B34C8EC(SEL *a1)
{
  return objc_msgSend((id)objc_opt_self(), *a1);
}

uint64_t sub_24B34C924()
{
  sub_24B34CB50();
  return sub_24B3503F8();
}

id sub_24B34C95C(_QWORD *a1, void *a2)
{
  void *v2;
  id v5;

  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  v5 = objc_msgSend(v2, sel_initWithValue_valueType_, sub_24B3504D0(), a2);
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v5;
}

unint64_t sub_24B34C9D4()
{
  unint64_t result;

  result = qword_2579700C0;
  if (!qword_2579700C0)
  {
    result = MEMORY[0x24BD1DE8C](&protocol conformance descriptor for IntentToggleOperation, MEMORY[0x24BDB5E90]);
    atomic_store(result, (unint64_t *)&qword_2579700C0);
  }
  return result;
}

unint64_t sub_24B34CA14()
{
  unint64_t result;

  result = qword_2579700C8;
  if (!qword_2579700C8)
  {
    result = MEMORY[0x24BD1DE8C](&protocol conformance descriptor for IntentToggleOperation, MEMORY[0x24BDB5E90]);
    atomic_store(result, (unint64_t *)&qword_2579700C8);
  }
  return result;
}

unint64_t sub_24B34CA54()
{
  unint64_t result;

  result = qword_2579700D0;
  if (!qword_2579700D0)
  {
    result = MEMORY[0x24BD1DE8C](&protocol conformance descriptor for IntentToggleOperation, MEMORY[0x24BDB5E90]);
    atomic_store(result, (unint64_t *)&qword_2579700D0);
  }
  return result;
}

unint64_t sub_24B34CA94()
{
  unint64_t result;

  result = qword_2579700D8;
  if (!qword_2579700D8)
  {
    result = MEMORY[0x24BD1DE8C](&protocol conformance descriptor for IntentToggleState, MEMORY[0x24BDB5868]);
    atomic_store(result, (unint64_t *)&qword_2579700D8);
  }
  return result;
}

unint64_t sub_24B34CAD4()
{
  unint64_t result;

  result = qword_2579700E0;
  if (!qword_2579700E0)
  {
    result = MEMORY[0x24BD1DE8C](&protocol conformance descriptor for IntentToggleState, MEMORY[0x24BDB5868]);
    atomic_store(result, (unint64_t *)&qword_2579700E0);
  }
  return result;
}

unint64_t sub_24B34CB14()
{
  unint64_t result;

  result = qword_2579700E8;
  if (!qword_2579700E8)
  {
    result = MEMORY[0x24BD1DE8C](&protocol conformance descriptor for IntentToggleState, MEMORY[0x24BDB5868]);
    atomic_store(result, (unint64_t *)&qword_2579700E8);
  }
  return result;
}

unint64_t sub_24B34CB50()
{
  unint64_t result;

  result = qword_2579700F0;
  if (!qword_2579700F0)
  {
    result = MEMORY[0x24BD1DE8C](&protocol conformance descriptor for IntentToggleState, MEMORY[0x24BDB5868]);
    atomic_store(result, (unint64_t *)&qword_2579700F0);
  }
  return result;
}

unint64_t sub_24B34CB8C()
{
  unint64_t result;

  result = qword_2579700F8;
  if (!qword_2579700F8)
  {
    result = MEMORY[0x24BD1DE8C](&protocol conformance descriptor for IntentToggleOperation, MEMORY[0x24BDB5E90]);
    atomic_store(result, (unint64_t *)&qword_2579700F8);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
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

uint64_t sub_24B34CC0C()
{
  sub_24B34CDD0(&qword_257970118, (uint64_t)&protocol conformance descriptor for StringSearchCriteria);
  return sub_24B3503E0();
}

uint64_t sub_24B34CC44()
{
  sub_24B34CDD0(&qword_257970118, (uint64_t)&protocol conformance descriptor for StringSearchCriteria);
  return sub_24B3503EC();
}

uint64_t sub_24B34CC8C()
{
  sub_24B34CDD0(&qword_257970118, (uint64_t)&protocol conformance descriptor for StringSearchCriteria);
  return sub_24B350404();
}

id static StringSearchCriteria.lnValueType.getter()
{
  return objc_msgSend((id)objc_opt_self(), sel_stringValueType);
}

uint64_t sub_24B34CD18()
{
  return sub_24B34CDD0(&qword_257970100, (uint64_t)&protocol conformance descriptor for StringSearchCriteria);
}

uint64_t sub_24B34CD3C()
{
  return sub_24B34CDD0(&qword_257970108, (uint64_t)&protocol conformance descriptor for StringSearchCriteria);
}

uint64_t sub_24B34CD60()
{
  return sub_24B34CDD0(&qword_257970110, (uint64_t)&protocol conformance descriptor for StringSearchCriteria);
}

uint64_t sub_24B34CD88()
{
  sub_24B34CDD0(&qword_257970118, (uint64_t)&protocol conformance descriptor for StringSearchCriteria);
  return sub_24B3503F8();
}

uint64_t sub_24B34CDD0(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_24B35035C();
    result = MEMORY[0x24BD1DE8C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t _IdentifiableAppEntityRepresentation<>.init<A>(instanceIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  sub_24B350380();
  v5 = sub_24B3503D4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8))(a1, a3);
  return v5;
}

uint64_t static _IdentifiableAppEntityRepresentation<>.queryByIdentifier<A>(instanceIdentifiers:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[12];

  v9[11] = a1;
  v9[6] = a2;
  v9[7] = a3;
  v9[8] = a4;
  v9[9] = a5;
  v9[2] = a2;
  v9[3] = a4;
  v9[4] = a5;
  v9[5] = swift_getKeyPath();
  v5 = sub_24B350434();
  v6 = MEMORY[0x24BD1DE8C](MEMORY[0x24BEE12E0], v5);
  sub_24B34D004((void (*)(char *, char *))sub_24B34CFDC, (uint64_t)v9, v5, MEMORY[0x24BEE0D00], MEMORY[0x24BEE4078], v6, MEMORY[0x24BEE40A8], v7);
  swift_release();
  sub_24B3503C8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24B34CF88@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_24B350380();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24B34CFC4()
{
  return 32;
}

__n128 sub_24B34CFD0(uint64_t a1, _OWORD *a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 16);
  *a2 = *(_OWORD *)a1;
  a2[1] = v3;
  return result;
}

uint64_t sub_24B34CFDC()
{
  return swift_getAtKeyPath();
}

uint64_t sub_24B34D004(void (*a1)(char *, char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  void (*v25)(char *, _QWORD);
  void (*v26)(char *);
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  uint64_t AssociatedTypeWitness;
  void (*v45)(char *, char *);
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  char v50[32];
  uint64_t v51;

  v37 = a5;
  v38 = a8;
  v45 = a1;
  v46 = a2;
  v36 = *(_QWORD *)(a5 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v47 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v13 = (char *)&v34 - v12;
  MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = swift_getAssociatedTypeWitness();
  v39 = *(_QWORD *)(v16 - 8);
  v40 = v16;
  v17 = MEMORY[0x24BDAC7A8](v16);
  v35 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v34 - v19;
  v21 = sub_24B35044C();
  if (!v21)
    return sub_24B350428();
  v22 = v21;
  v51 = sub_24B3504AC();
  v41 = sub_24B3504B8();
  sub_24B350494();
  v43 = a6;
  result = sub_24B350440();
  if ((v22 & 0x8000000000000000) == 0)
  {
    v24 = v22;
    v42 = v15;
    while (v24)
    {
      v48 = v24;
      v25 = (void (*)(char *, _QWORD))sub_24B350464();
      v26 = *(void (**)(char *))(v10 + 16);
      v27 = v10;
      v28 = AssociatedTypeWitness;
      v26(v13);
      v25(v50, 0);
      v29 = v20;
      v30 = v49;
      v45(v13, v47);
      if (v30)
      {
        (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
        (*(void (**)(char *, uint64_t))(v39 + 8))(v20, v40);
        swift_release();
        return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v36 + 32))(v38, v47, v37);
      }
      v49 = 0;
      (*(void (**)(char *, uint64_t))(v27 + 8))(v13, v28);
      sub_24B3504A0();
      result = sub_24B350458();
      v24 = v48 - 1;
      v10 = v27;
      if (v48 == 1)
      {
        v32 = v39;
        v31 = v40;
        v33 = v35;
        (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v35, v29, v40);
        sub_24B35047C();
        (*(void (**)(char *, uint64_t))(v32 + 8))(v33, v31);
        return v51;
      }
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void IntentApplication.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB57E0], (SEL *)&selRef_applicationValueType);
}

uint64_t sub_24B34D36C()
{
  sub_24B34FD98(&qword_2579702E0, MEMORY[0x24BDB57E8], (uint64_t)&protocol conformance descriptor for IntentApplication);
  return sub_24B3503EC();
}

uint64_t sub_24B34D3BC()
{
  sub_24B34FD98(&qword_2579702E0, MEMORY[0x24BDB57E8], (uint64_t)&protocol conformance descriptor for IntentApplication);
  return sub_24B350404();
}

id static IntentApplication.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_applicationValueType);
}

uint64_t sub_24B34D434()
{
  sub_24B34FD98(&qword_2579702E0, MEMORY[0x24BDB57E8], (uint64_t)&protocol conformance descriptor for IntentApplication);
  return sub_24B3503F8();
}

void IntentCalendarEvent.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB5A68], (SEL *)&selRef_calendarEventValueType);
}

uint64_t sub_24B34D49C()
{
  sub_24B34FD98(&qword_2579702D8, MEMORY[0x24BDB5A70], (uint64_t)&protocol conformance descriptor for IntentCalendarEvent);
  return sub_24B3503EC();
}

uint64_t sub_24B34D4EC()
{
  sub_24B34FD98(&qword_2579702D8, MEMORY[0x24BDB5A70], (uint64_t)&protocol conformance descriptor for IntentCalendarEvent);
  return sub_24B350404();
}

id static IntentCalendarEvent.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_calendarEventValueType);
}

uint64_t sub_24B34D564()
{
  sub_24B34FD98(&qword_2579702D8, MEMORY[0x24BDB5A70], (uint64_t)&protocol conformance descriptor for IntentCalendarEvent);
  return sub_24B3503F8();
}

void IntentCurrencyAmount.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB5B88], (SEL *)&selRef_currencyAmountValueType);
}

uint64_t sub_24B34D5CC()
{
  sub_24B34FD98(&qword_2579702D0, MEMORY[0x24BDB5B90], (uint64_t)&protocol conformance descriptor for IntentCurrencyAmount);
  return sub_24B3503EC();
}

uint64_t sub_24B34D61C()
{
  sub_24B34FD98(&qword_2579702D0, MEMORY[0x24BDB5B90], (uint64_t)&protocol conformance descriptor for IntentCurrencyAmount);
  return sub_24B350404();
}

id static IntentCurrencyAmount.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_currencyAmountValueType);
}

uint64_t sub_24B34D694()
{
  sub_24B34FD98(&qword_2579702D0, MEMORY[0x24BDB5B90], (uint64_t)&protocol conformance descriptor for IntentCurrencyAmount);
  return sub_24B3503F8();
}

void IntentEnvironment.lnValue.getter()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_24B350350();
  sub_24B350344();
  v0 = objc_msgSend((id)objc_opt_self(), sel_environmentValueType);
  v1 = objc_allocWithZone(MEMORY[0x24BE5FE00]);
  OUTLINED_FUNCTION_16((uint64_t)v1, v2, v3, v4, v5, v6, v7, v8, v9);
  OUTLINED_FUNCTION_19();
}

uint64_t sub_24B34D74C()
{
  sub_24B34FD98(&qword_2579702C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5820], (uint64_t)&protocol conformance descriptor for IntentEnvironment);
  return sub_24B3503EC();
}

uint64_t sub_24B34D79C()
{
  sub_24B34FD98(&qword_2579702C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5820], (uint64_t)&protocol conformance descriptor for IntentEnvironment);
  return sub_24B350404();
}

id static IntentEnvironment.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_environmentValueType);
}

uint64_t sub_24B34D814()
{
  sub_24B34FD98(&qword_2579702C8, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5820], (uint64_t)&protocol conformance descriptor for IntentEnvironment);
  return sub_24B3503F8();
}

void IntentMediaItem.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB5430], (SEL *)&selRef_mediaItemValueType);
}

uint64_t sub_24B34D87C()
{
  sub_24B34FD98(&qword_2579702C0, MEMORY[0x24BDB5438], (uint64_t)&protocol conformance descriptor for IntentMediaItem);
  return sub_24B3503EC();
}

uint64_t sub_24B34D8CC()
{
  sub_24B34FD98(&qword_2579702C0, MEMORY[0x24BDB5438], (uint64_t)&protocol conformance descriptor for IntentMediaItem);
  return sub_24B350404();
}

id static IntentMediaItem.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_mediaItemValueType);
}

uint64_t sub_24B34D944()
{
  sub_24B34FD98(&qword_2579702C0, MEMORY[0x24BDB5438], (uint64_t)&protocol conformance descriptor for IntentMediaItem);
  return sub_24B3503F8();
}

void IntentMediaSearch.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB5840], (SEL *)&selRef_mediaSearchValueType);
}

uint64_t sub_24B34D9AC()
{
  sub_24B34FD98(&qword_2579702B8, MEMORY[0x24BDB5848], (uint64_t)&protocol conformance descriptor for IntentMediaSearch);
  return sub_24B3503EC();
}

uint64_t sub_24B34D9FC()
{
  sub_24B34FD98(&qword_2579702B8, MEMORY[0x24BDB5848], (uint64_t)&protocol conformance descriptor for IntentMediaSearch);
  return sub_24B350404();
}

id static IntentMediaSearch.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_mediaSearchValueType);
}

uint64_t sub_24B34DA74()
{
  sub_24B34FD98(&qword_2579702B8, MEMORY[0x24BDB5848], (uint64_t)&protocol conformance descriptor for IntentMediaSearch);
  return sub_24B3503F8();
}

void IntentMessageConversation.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB61B8], (SEL *)&selRef_messageConversationValueType);
}

uint64_t sub_24B34DADC()
{
  sub_24B34FD98(&qword_2579702B0, MEMORY[0x24BDB61C0], (uint64_t)&protocol conformance descriptor for IntentMessageConversation);
  return sub_24B3503EC();
}

uint64_t sub_24B34DB2C()
{
  sub_24B34FD98(&qword_2579702B0, MEMORY[0x24BDB61C0], (uint64_t)&protocol conformance descriptor for IntentMessageConversation);
  return sub_24B350404();
}

id static IntentMessageConversation.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_messageConversationValueType);
}

uint64_t sub_24B34DBA4()
{
  sub_24B34FD98(&qword_2579702B0, MEMORY[0x24BDB61C0], (uint64_t)&protocol conformance descriptor for IntentMessageConversation);
  return sub_24B3503F8();
}

void IntentNote.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB4F58], (SEL *)&selRef_noteValueType);
}

uint64_t sub_24B34DC0C()
{
  sub_24B34FD98(&qword_2579702A8, MEMORY[0x24BDB4F60], (uint64_t)&protocol conformance descriptor for IntentNote);
  return sub_24B3503EC();
}

uint64_t sub_24B34DC5C()
{
  sub_24B34FD98(&qword_2579702A8, MEMORY[0x24BDB4F60], (uint64_t)&protocol conformance descriptor for IntentNote);
  return sub_24B350404();
}

id static IntentNote.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_noteValueType);
}

uint64_t sub_24B34DCD4()
{
  sub_24B34FD98(&qword_2579702A8, MEMORY[0x24BDB4F60], (uint64_t)&protocol conformance descriptor for IntentNote);
  return sub_24B3503F8();
}

void IntentNotification.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB5990], (SEL *)&selRef_notificationValueType);
}

uint64_t sub_24B34DD3C()
{
  sub_24B34FD98(&qword_2579702A0, MEMORY[0x24BDB5998], (uint64_t)&protocol conformance descriptor for IntentNotification);
  return sub_24B3503EC();
}

uint64_t sub_24B34DD8C()
{
  sub_24B34FD98(&qword_2579702A0, MEMORY[0x24BDB5998], (uint64_t)&protocol conformance descriptor for IntentNotification);
  return sub_24B350404();
}

id static IntentNotification.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_notificationValueType);
}

uint64_t sub_24B34DE04()
{
  sub_24B34FD98(&qword_2579702A0, MEMORY[0x24BDB5998], (uint64_t)&protocol conformance descriptor for IntentNotification);
  return sub_24B3503F8();
}

void IntentPaymentMethod.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB5A80], (SEL *)&selRef_paymentMethodValueType);
}

uint64_t sub_24B34DE6C()
{
  sub_24B34FD98(&qword_257970298, MEMORY[0x24BDB5A88], (uint64_t)&protocol conformance descriptor for IntentPaymentMethod);
  return sub_24B3503EC();
}

uint64_t sub_24B34DEBC()
{
  sub_24B34FD98(&qword_257970298, MEMORY[0x24BDB5A88], (uint64_t)&protocol conformance descriptor for IntentPaymentMethod);
  return sub_24B350404();
}

id static IntentPaymentMethod.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_paymentMethodValueType);
}

uint64_t sub_24B34DF34()
{
  sub_24B34FD98(&qword_257970298, MEMORY[0x24BDB5A88], (uint64_t)&protocol conformance descriptor for IntentPaymentMethod);
  return sub_24B3503F8();
}

void IntentPerson.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB5080], (SEL *)&selRef_personValueType);
}

uint64_t sub_24B34DF9C()
{
  sub_24B34FD98(&qword_257970290, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5170], (uint64_t)&protocol conformance descriptor for IntentPerson);
  return sub_24B3503EC();
}

void static IntentPerson.from(_:context:)(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v3 = objc_msgSend(a1, sel_value);
  sub_24B350470();
  swift_unknownObjectRelease();
  sub_24B350154(0, &qword_257970120);
  if (swift_dynamicCast())
  {
    sub_24B34E514(v8, a2);
  }
  else
  {
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_14();
    __swift_storeEnumTagSinglePayload(v4, v5, v6, v7);
  }
}

id static IntentPerson.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_personValueType);
}

uint64_t sub_24B34E0AC()
{
  sub_24B34FD98(&qword_257970290, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5170], (uint64_t)&protocol conformance descriptor for IntentPerson);
  return sub_24B3503F8();
}

void IntentReminderTask.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB59A8], (SEL *)&selRef_taskValueType);
}

uint64_t sub_24B34E114()
{
  sub_24B34FD98(&qword_257970288, MEMORY[0x24BDB59B0], (uint64_t)&protocol conformance descriptor for IntentReminderTask);
  return sub_24B3503EC();
}

uint64_t sub_24B34E164()
{
  sub_24B34FD98(&qword_257970288, MEMORY[0x24BDB59B0], (uint64_t)&protocol conformance descriptor for IntentReminderTask);
  return sub_24B350404();
}

id static IntentReminderTask.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_taskValueType);
}

uint64_t sub_24B34E1DC()
{
  sub_24B34FD98(&qword_257970288, MEMORY[0x24BDB59B0], (uint64_t)&protocol conformance descriptor for IntentReminderTask);
  return sub_24B3503F8();
}

void IntentReminderTaskList.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB5F70], (SEL *)&selRef_taskListValueType);
}

uint64_t sub_24B34E244()
{
  sub_24B34FD98(&qword_257970280, MEMORY[0x24BDB5F78], (uint64_t)&protocol conformance descriptor for IntentReminderTaskList);
  return sub_24B3503EC();
}

uint64_t sub_24B34E294()
{
  sub_24B34FD98(&qword_257970280, MEMORY[0x24BDB5F78], (uint64_t)&protocol conformance descriptor for IntentReminderTaskList);
  return sub_24B350404();
}

id static IntentReminderTaskList.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_taskListValueType);
}

uint64_t sub_24B34E30C()
{
  sub_24B34FD98(&qword_257970280, MEMORY[0x24BDB5F78], (uint64_t)&protocol conformance descriptor for IntentReminderTaskList);
  return sub_24B3503F8();
}

void IntentTimer.lnValue.getter()
{
  sub_24B34E374(MEMORY[0x24BDB4FA8], (SEL *)&selRef_timerValueType);
}

void sub_24B34E374(void (*a1)(uint64_t *__return_ptr), SEL *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12[4];

  a1(v12);
  v3 = objc_msgSend((id)objc_opt_self(), *a2);
  v4 = objc_allocWithZone(MEMORY[0x24BE5FE00]);
  OUTLINED_FUNCTION_16((uint64_t)v4, v5, v6, v7, v8, v9, v10, v11, v12[0]);
  OUTLINED_FUNCTION_19();
}

uint64_t sub_24B34E3C8()
{
  sub_24B34FD98(&qword_257970278, MEMORY[0x24BDB4FB0], (uint64_t)&protocol conformance descriptor for IntentTimer);
  return sub_24B3503EC();
}

uint64_t sub_24B34E418()
{
  sub_24B34FD98(&qword_257970278, MEMORY[0x24BDB4FB0], (uint64_t)&protocol conformance descriptor for IntentTimer);
  return sub_24B350404();
}

id static IntentTimer.lnValueType.getter()
{
  return sub_24B34E48C((SEL *)&selRef_timerValueType);
}

id sub_24B34E48C(SEL *a1)
{
  return objc_msgSend((id)objc_opt_self(), *a1);
}

uint64_t sub_24B34E4C4()
{
  sub_24B34FD98(&qword_257970278, MEMORY[0x24BDB4FB0], (uint64_t)&protocol conformance descriptor for IntentTimer);
  return sub_24B3503F8();
}

void sub_24B34E514(id a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
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
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  id v52;
  unint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  unint64_t v61;
  unint64_t v62;
  id v63;
  uint64_t v64;
  unint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  id v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v88;
  unint64_t v89;
  size_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  id v96;
  uint64_t *v97;
  uint64_t *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  id v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t *v111;
  uint64_t *v112;
  uint64_t v113;
  uint64_t *v114;
  uint64_t v115;
  unsigned int *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  unsigned int *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t *v152;
  uint64_t *v153;
  char *v154;
  id v155;
  uint64_t v156;
  unsigned int v157;
  unsigned int v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t *v162;
  unsigned int v163;
  uint64_t v164;
  unsigned int v165;
  uint64_t *v166;
  unint64_t v167;
  uint64_t v168;
  unint64_t v169;
  char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  _QWORD *v178;
  size_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;

  v156 = a2;
  v141 = sub_24B3503BC();
  v140 = *(_QWORD *)(v141 - 8);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_8();
  v139 = v4;
  OUTLINED_FUNCTION_12();
  v5 = sub_24B3502E4();
  v147 = *(_QWORD *)(v5 - 8);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2();
  v152 = v7;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_9();
  v153 = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579702E8);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_8();
  v146 = v11;
  OUTLINED_FUNCTION_12();
  v148 = sub_24B350398();
  v145 = *(_QWORD *)(v148 - 8);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v12);
  OUTLINED_FUNCTION_2();
  v144 = v13;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_9();
  v142 = v15;
  OUTLINED_FUNCTION_12();
  v161 = sub_24B3502FC();
  v160 = *(_QWORD *)(v161 - 8);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v16);
  OUTLINED_FUNCTION_2();
  v151 = v17;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v18);
  OUTLINED_FUNCTION_9();
  v162 = v19;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579702F0);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_2();
  v150 = v21;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v22);
  OUTLINED_FUNCTION_9();
  v159 = v23;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579702F8);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_8();
  v178 = v25;
  OUTLINED_FUNCTION_12();
  v26 = sub_24B350308();
  v177 = *(_QWORD *)(v26 - 8);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v27);
  OUTLINED_FUNCTION_2();
  v176 = v28;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v29);
  OUTLINED_FUNCTION_9();
  v175 = v30;
  OUTLINED_FUNCTION_12();
  v182 = sub_24B350314();
  v31 = *(_QWORD *)(v182 - 8);
  MEMORY[0x24BDAC7A8](v182);
  OUTLINED_FUNCTION_2();
  v174 = v32;
  OUTLINED_FUNCTION_7();
  v34 = MEMORY[0x24BDAC7A8](v33);
  v36 = (uint64_t *)((char *)&v139 - v35);
  MEMORY[0x24BDAC7A8](v34);
  OUTLINED_FUNCTION_9();
  v181 = v37;
  OUTLINED_FUNCTION_12();
  v38 = sub_24B350320();
  v173 = *(_QWORD *)(v38 - 8);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v39);
  OUTLINED_FUNCTION_2();
  v172 = v40;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v41);
  OUTLINED_FUNCTION_9();
  v164 = v42;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257970300);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v43);
  OUTLINED_FUNCTION_2();
  v149 = v44;
  OUTLINED_FUNCTION_7();
  v46 = MEMORY[0x24BDAC7A8](v45);
  v48 = (char *)&v139 - v47;
  v49 = MEMORY[0x24BDAC7A8](v46);
  v51 = (char *)&v139 - v50;
  v52 = OUTLINED_FUNCTION_15(v49, sel_personHandle);
  if (!v52)
  {

    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_14();
    __swift_storeEnumTagSinglePayload(v91, v92, v93, v94);
    return;
  }
  sub_24B34F09C(v52, (uint64_t)v51);
  OUTLINED_FUNCTION_11((uint64_t)v51, 0);
  v53 = sub_24B350004(a1);
  v155 = a1;
  v143 = v5;
  v154 = v51;
  if (!v53)
  {
    v179 = MEMORY[0x24BEE4AF8];
    goto LABEL_39;
  }
  v54 = v53;
  if (v53 >> 62)
  {
    swift_bridgeObjectRetain();
    v56 = sub_24B3504C4();
    if (v56)
      goto LABEL_5;
    goto LABEL_37;
  }
  v55 = *(_QWORD *)((v53 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v56 = v55;
  if (!v55)
  {
LABEL_37:
    v179 = MEMORY[0x24BEE4AF8];
LABEL_38:
    swift_bridgeObjectRelease_n();
    a1 = v155;
    v51 = v154;
LABEL_39:
    v95 = objc_msgSend(a1, sel_isMe, v139);
    LODWORD(v182) = (_DWORD)v95;
    v96 = OUTLINED_FUNCTION_15((uint64_t)v95, sel_image);
    v97 = v153;
    v98 = v152;
    v99 = v161;
    v100 = v159;
    v101 = v148;
    if (v96)
    {
      sub_24B350368();
      v102 = 0;
    }
    else
    {
      v102 = 1;
    }
    v103 = sub_24B350374();
    v104 = __swift_storeEnumTagSinglePayload(v100, v102, 1, v103);
    v105 = OUTLINED_FUNCTION_15(v104, sel_nameComponents);
    if (v105)
    {
      v106 = v105;
      v38 = v144;
      sub_24B35038C();

      v107 = v146;
      OUTLINED_FUNCTION_21(v146, v38);
      OUTLINED_FUNCTION_17();
      OUTLINED_FUNCTION_23(v108, v109, v110);
      if (__swift_getEnumTagSinglePayload(v107, 1, v101) != 1)
      {
        v111 = v98;
        v112 = v97;
        v113 = v142;
        OUTLINED_FUNCTION_21(v142, v107);
        v114 = v162;
        v115 = v113;
        v97 = v112;
        v98 = v111;
        OUTLINED_FUNCTION_21((uint64_t)v162, v115);
        v116 = (unsigned int *)MEMORY[0x24BDB5090];
        goto LABEL_47;
      }
    }
    else
    {
      v107 = v146;
      OUTLINED_FUNCTION_14();
      OUTLINED_FUNCTION_23(v117, v118, v119);
    }
    sub_24B350118(v107, &qword_2579702E8);
    v121 = OUTLINED_FUNCTION_15(v120, sel_displayName);
    sub_24B350410();
    OUTLINED_FUNCTION_20();
    v114 = v162;
    *v162 = v38;
    v114[1] = v101;
    v116 = (unsigned int *)MEMORY[0x24BDB5088];
LABEL_47:
    v122 = v147;
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v160 + 104))(v114, *v116, v99);
    v123 = sub_24B35007C(a1, (SEL *)&selRef_contactIdentifier);
    v125 = v143;
    if (v124)
    {
      *v97 = v123;
      v97[1] = v124;
      v126 = (unsigned int *)MEMORY[0x24BDB5050];
    }
    else
    {
      v127 = sub_24B35007C(a1, (SEL *)&selRef_customIdentifier);
      if (!v128)
      {
        v135 = v139;
        sub_24B3503B0();
        v136 = sub_24B3503A4();
        v138 = v137;
        (*(void (**)(uint64_t, uint64_t))(v140 + 8))(v135, v141);
        *v98 = v136;
        v98[1] = v138;
        v125 = v143;
        v114 = v162;
        (*(void (**)(uint64_t *, _QWORD, uint64_t))(v122 + 104))(v98, *MEMORY[0x24BDB5040], v143);
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v122 + 32))(v97, v98, v125);
        goto LABEL_52;
      }
      *v97 = v127;
      v97[1] = v128;
      v126 = (unsigned int *)MEMORY[0x24BDB5040];
    }
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v122 + 104))(v97, *v126, v125);
LABEL_52:
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v122 + 16))(v98, v97, v125);
    v129 = v160;
    (*(void (**)(uint64_t, uint64_t *, uint64_t))(v160 + 16))(v151, v114, v99);
    sub_24B3500D8((uint64_t)v51, v149, &qword_257970300);
    v130 = v159;
    sub_24B3500D8(v159, v150, &qword_2579702F0);
    sub_24B3502F0();

    (*(void (**)(uint64_t *, uint64_t))(v122 + 8))(v97, v125);
    (*(void (**)(uint64_t *, uint64_t))(v129 + 8))(v162, v161);
    sub_24B350118(v130, &qword_2579702F0);
    sub_24B350118((uint64_t)v154, &qword_257970300);
    OUTLINED_FUNCTION_24();
    OUTLINED_FUNCTION_17();
    __swift_storeEnumTagSinglePayload(v131, v132, v133, v134);
    OUTLINED_FUNCTION_10();
    return;
  }
LABEL_5:
  if (v56 >= 1)
  {
    v57 = 0;
    v167 = v54 & 0xC000000000000001;
    v158 = *MEMORY[0x24BDB5108];
    v157 = *MEMORY[0x24BDB5110];
    v163 = *MEMORY[0x24BDB5118];
    v179 = MEMORY[0x24BEE4AF8];
    v165 = *MEMORY[0x24BDB50B8];
    v166 = v36;
    v170 = v48;
    v171 = v38;
    v168 = v56;
    v169 = v54;
    while (1)
    {
      v180 = v57;
      if (v167)
        v58 = (id)MEMORY[0x24BD1DCF4](v57, v54);
      else
        v58 = *(id *)(v54 + 8 * v57 + 32);
      v59 = v58;
      v60 = sub_24B35007C(v58, (SEL *)&selRef_value);
      v62 = v61;
      v63 = objc_msgSend(v59, sel_type);
      if (v62)
        v64 = v60;
      else
        v64 = 0;
      v65 = 0xE000000000000000;
      if (v62)
        v65 = v62;
      if (v63 == (id)2)
      {
        *v36 = v64;
        v67 = v158;
        v66 = v178;
      }
      else
      {
        v66 = v178;
        *v36 = v64;
        v67 = v63 == (id)1 ? v157 : v163;
      }
      v36[1] = v65;
      (*(void (**)(uint64_t *, uint64_t, uint64_t))(v31 + 104))(v36, v67, v182);
      OUTLINED_FUNCTION_18(v181, (uint64_t)v36, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v31 + 32));
      v68 = objc_msgSend(v59, sel_label);
      if (!v68)
        break;
      v69 = v68;
      sub_24B34F354(v69, v66);
      OUTLINED_FUNCTION_17();
      __swift_storeEnumTagSinglePayload(v70, v71, v72, v26);

      if (__swift_getEnumTagSinglePayload((uint64_t)v66, 1, v26) == 1)
        goto LABEL_24;
      v73 = v177;
      v74 = v175;
      (*(void (**)(uint64_t, _QWORD *, uint64_t))(v177 + 32))(v175, v66, v26);
LABEL_25:
      v78 = v181;
      v79 = v182;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v31 + 16))(v174, v181, v182);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v73 + 16))(v176, v74, v26);
      v80 = (uint64_t)v170;
      sub_24B35032C();
      v81 = v74;
      v38 = v26;
      (*(void (**)(uint64_t, uint64_t))(v73 + 8))(v81, v26);
      (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v78, v79);
      OUTLINED_FUNCTION_17();
      v82 = v171;
      OUTLINED_FUNCTION_23(v83, v84, v85);

      if (__swift_getEnumTagSinglePayload(v80, 1, v82) == 1)
      {
        sub_24B350118(v80, &qword_257970300);
        v36 = v166;
        v54 = v169;
      }
      else
      {
        v86 = v164;
        OUTLINED_FUNCTION_22(v164, v80);
        OUTLINED_FUNCTION_22(v172, v86);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v54 = v169;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          v179 = sub_24B34FEB4(0, *(_QWORD *)(v179 + 16) + 1, 1, v179);
        v36 = v166;
        v26 = v38;
        v89 = *(_QWORD *)(v179 + 16);
        v88 = *(_QWORD *)(v179 + 24);
        if (v89 >= v88 >> 1)
          v179 = sub_24B34FEB4(v88 > 1, v89 + 1, 1, v179);
        v90 = v179;
        *(_QWORD *)(v179 + 16) = v89 + 1;
        OUTLINED_FUNCTION_22(v90+ ((*(unsigned __int8 *)(v173 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v173 + 80))+ *(_QWORD *)(v173 + 72) * v89, v172);
      }
      v57 = v180 + 1;
      if (v168 == v180 + 1)
        goto LABEL_38;
    }
    OUTLINED_FUNCTION_14();
    __swift_storeEnumTagSinglePayload(v75, v76, v77, v26);
LABEL_24:
    v73 = v177;
    v74 = v175;
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v177 + 104))(v175, v165, v26);
    sub_24B350118((uint64_t)v66, &qword_2579702F8);
    goto LABEL_25;
  }
  __break(1u);
}

void sub_24B34F09C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v27 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2579702F8);
  OUTLINED_FUNCTION_5();
  MEMORY[0x24BDAC7A8](v3);
  v5 = (uint64_t *)((char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_24B350308();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2();
  v26 = v8;
  OUTLINED_FUNCTION_7();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v24 - v10;
  v25 = sub_24B350314();
  v12 = *(_QWORD *)(v25 - 8);
  v13 = MEMORY[0x24BDAC7A8](v25);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (uint64_t *)((char *)&v24 - v16);
  v18 = sub_24B35007C(a1, (SEL *)&selRef_value);
  v20 = v19;
  objc_msgSend(a1, sel_type);
  sub_24B34F2DC(v18, v20, v17);
  v21 = objc_msgSend(a1, sel_label);
  if (!v21)
  {
    OUTLINED_FUNCTION_11((uint64_t)v5, 1);
    goto LABEL_5;
  }
  v22 = v21;
  sub_24B34F354(v22, v5);
  OUTLINED_FUNCTION_11((uint64_t)v5, 0);

  if (__swift_getEnumTagSinglePayload((uint64_t)v5, 1, v6) == 1)
  {
LABEL_5:
    (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v11, *MEMORY[0x24BDB50B8], v6);
    sub_24B350118((uint64_t)v5, &qword_2579702F8);
    goto LABEL_6;
  }
  OUTLINED_FUNCTION_18((uint64_t)v11, (uint64_t)v5, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 32));
LABEL_6:
  v23 = v25;
  (*(void (**)(char *, _QWORD *, uint64_t))(v12 + 16))(v15, v17, v25);
  OUTLINED_FUNCTION_18(v26, (uint64_t)v11, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16));
  sub_24B35032C();

  (*(void (**)(char *, uint64_t))(v7 + 8))(v11, v6);
  (*(void (**)(_QWORD *, uint64_t))(v12 + 8))(v17, v23);
  OUTLINED_FUNCTION_10();
}

uint64_t sub_24B34F2DC@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);

  if (a2)
    v4 = a1;
  else
    v4 = 0;
  v5 = 0xE000000000000000;
  if (a2)
    v5 = a2;
  *a3 = v4;
  a3[1] = v5;
  sub_24B350314();
  v6 = OUTLINED_FUNCTION_13();
  return v7(v6);
}

uint64_t sub_24B34F354@<X0>(void *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  uint64_t v9;
  uint64_t v11;
  uint64_t v13;
  uint64_t v15;
  uint64_t v17;
  uint64_t v19;
  uint64_t v21;
  uint64_t v23;
  uint64_t v25;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);

  sub_24B350410();
  if (v4 == OUTLINED_FUNCTION_1() && v2 == v7)
  {
    OUTLINED_FUNCTION_3();
    goto LABEL_53;
  }
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  if ((v4 & 1) != 0)
    goto LABEL_53;
  sub_24B350410();
  if (v4 == OUTLINED_FUNCTION_1() && v2 == v9)
  {
    OUTLINED_FUNCTION_3();
    goto LABEL_53;
  }
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  if ((v4 & 1) != 0)
    goto LABEL_53;
  sub_24B350410();
  if (v4 == OUTLINED_FUNCTION_1() && v2 == v11)
  {
    OUTLINED_FUNCTION_3();
    goto LABEL_53;
  }
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  if ((v4 & 1) != 0)
    goto LABEL_53;
  sub_24B350410();
  if (v4 == OUTLINED_FUNCTION_1() && v2 == v13)
  {
    OUTLINED_FUNCTION_3();
    goto LABEL_53;
  }
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  if ((v4 & 1) != 0)
    goto LABEL_53;
  sub_24B350410();
  if (v4 == OUTLINED_FUNCTION_1() && v2 == v15)
  {
    OUTLINED_FUNCTION_3();
    goto LABEL_53;
  }
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  if ((v4 & 1) != 0)
    goto LABEL_53;
  sub_24B350410();
  if (v4 == OUTLINED_FUNCTION_1() && v2 == v17)
  {
    OUTLINED_FUNCTION_3();
    goto LABEL_53;
  }
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  if ((v4 & 1) != 0)
    goto LABEL_53;
  sub_24B350410();
  if (v4 == OUTLINED_FUNCTION_1() && v2 == v19)
  {
    OUTLINED_FUNCTION_3();
    goto LABEL_53;
  }
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  if ((v4 & 1) != 0)
    goto LABEL_53;
  sub_24B350410();
  if (v4 == OUTLINED_FUNCTION_1() && v2 == v21)
  {
    OUTLINED_FUNCTION_3();
    goto LABEL_53;
  }
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  if ((v4 & 1) != 0)
    goto LABEL_53;
  sub_24B350410();
  if (v4 == OUTLINED_FUNCTION_1() && v2 == v23)
  {
    OUTLINED_FUNCTION_3();
    goto LABEL_53;
  }
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  if ((v4 & 1) != 0)
    goto LABEL_53;
  sub_24B350410();
  if (v4 == OUTLINED_FUNCTION_1() && v2 == v25)
  {
    OUTLINED_FUNCTION_3();
    goto LABEL_53;
  }
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  if ((v4 & 1) != 0)
  {
LABEL_53:

    goto LABEL_54;
  }
  sub_24B350410();
  OUTLINED_FUNCTION_20();
  *a2 = v2;
  a2[1] = v3;
LABEL_54:
  sub_24B350308();
  v27 = OUTLINED_FUNCTION_13();
  return v28(v27);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void sub_24B34F660()
{
  sub_24B34FD98(&qword_257970128, MEMORY[0x24BDB57E8], (uint64_t)&protocol conformance descriptor for IntentApplication);
}

void sub_24B34F68C()
{
  sub_24B34FD98(&qword_257970130, MEMORY[0x24BDB57E8], (uint64_t)&protocol conformance descriptor for IntentApplication);
}

void sub_24B34F6B8()
{
  sub_24B34FD98(&qword_257970138, MEMORY[0x24BDB57E8], (uint64_t)&protocol conformance descriptor for IntentApplication);
}

void sub_24B34F6E4()
{
  sub_24B34FD98(&qword_257970140, MEMORY[0x24BDB5A70], (uint64_t)&protocol conformance descriptor for IntentCalendarEvent);
}

void sub_24B34F710()
{
  sub_24B34FD98(&qword_257970148, MEMORY[0x24BDB5A70], (uint64_t)&protocol conformance descriptor for IntentCalendarEvent);
}

void sub_24B34F73C()
{
  sub_24B34FD98(&qword_257970150, MEMORY[0x24BDB5A70], (uint64_t)&protocol conformance descriptor for IntentCalendarEvent);
}

void sub_24B34F768()
{
  sub_24B34FD98(&qword_257970158, MEMORY[0x24BDB5B90], (uint64_t)&protocol conformance descriptor for IntentCurrencyAmount);
}

void sub_24B34F794()
{
  sub_24B34FD98(&qword_257970160, MEMORY[0x24BDB5B90], (uint64_t)&protocol conformance descriptor for IntentCurrencyAmount);
}

void sub_24B34F7C0()
{
  sub_24B34FD98(&qword_257970168, MEMORY[0x24BDB5B90], (uint64_t)&protocol conformance descriptor for IntentCurrencyAmount);
}

void sub_24B34F7EC()
{
  sub_24B34FD98(&qword_257970170, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5820], (uint64_t)&protocol conformance descriptor for IntentEnvironment);
}

void sub_24B34F818()
{
  sub_24B34FD98(&qword_257970178, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5820], (uint64_t)&protocol conformance descriptor for IntentEnvironment);
}

void sub_24B34F844()
{
  sub_24B34FD98(&qword_257970180, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5820], (uint64_t)&protocol conformance descriptor for IntentEnvironment);
}

void sub_24B34F870()
{
  sub_24B34FD98(&qword_257970188, MEMORY[0x24BDB5438], (uint64_t)&protocol conformance descriptor for IntentMediaItem);
}

void sub_24B34F89C()
{
  sub_24B34FD98(&qword_257970190, MEMORY[0x24BDB5438], (uint64_t)&protocol conformance descriptor for IntentMediaItem);
}

void sub_24B34F8C8()
{
  sub_24B34FD98(&qword_257970198, MEMORY[0x24BDB5438], (uint64_t)&protocol conformance descriptor for IntentMediaItem);
}

void sub_24B34F8F4()
{
  sub_24B34FD98(&qword_2579701A0, MEMORY[0x24BDB5848], (uint64_t)&protocol conformance descriptor for IntentMediaSearch);
}

void sub_24B34F920()
{
  sub_24B34FD98(&qword_2579701A8, MEMORY[0x24BDB5848], (uint64_t)&protocol conformance descriptor for IntentMediaSearch);
}

void sub_24B34F94C()
{
  sub_24B34FD98(&qword_2579701B0, MEMORY[0x24BDB5848], (uint64_t)&protocol conformance descriptor for IntentMediaSearch);
}

void sub_24B34F978()
{
  sub_24B34FD98(&qword_2579701B8, MEMORY[0x24BDB61C0], (uint64_t)&protocol conformance descriptor for IntentMessageConversation);
}

void sub_24B34F9A4()
{
  sub_24B34FD98(&qword_2579701C0, MEMORY[0x24BDB61C0], (uint64_t)&protocol conformance descriptor for IntentMessageConversation);
}

void sub_24B34F9D0()
{
  sub_24B34FD98(&qword_2579701C8, MEMORY[0x24BDB61C0], (uint64_t)&protocol conformance descriptor for IntentMessageConversation);
}

void sub_24B34F9FC()
{
  sub_24B34FD98(&qword_2579701D0, MEMORY[0x24BDB4F60], (uint64_t)&protocol conformance descriptor for IntentNote);
}

void sub_24B34FA28()
{
  sub_24B34FD98(&qword_2579701D8, MEMORY[0x24BDB4F60], (uint64_t)&protocol conformance descriptor for IntentNote);
}

void sub_24B34FA54()
{
  sub_24B34FD98(&qword_2579701E0, MEMORY[0x24BDB4F60], (uint64_t)&protocol conformance descriptor for IntentNote);
}

void sub_24B34FA80()
{
  sub_24B34FD98(&qword_2579701E8, MEMORY[0x24BDB5998], (uint64_t)&protocol conformance descriptor for IntentNotification);
}

void sub_24B34FAAC()
{
  sub_24B34FD98(&qword_2579701F0, MEMORY[0x24BDB5998], (uint64_t)&protocol conformance descriptor for IntentNotification);
}

void sub_24B34FAD8()
{
  sub_24B34FD98(&qword_2579701F8, MEMORY[0x24BDB5998], (uint64_t)&protocol conformance descriptor for IntentNotification);
}

void sub_24B34FB04()
{
  sub_24B34FD98(&qword_257970200, MEMORY[0x24BDB5A88], (uint64_t)&protocol conformance descriptor for IntentPaymentMethod);
}

void sub_24B34FB30()
{
  sub_24B34FD98(&qword_257970208, MEMORY[0x24BDB5A88], (uint64_t)&protocol conformance descriptor for IntentPaymentMethod);
}

void sub_24B34FB5C()
{
  sub_24B34FD98(&qword_257970210, MEMORY[0x24BDB5A88], (uint64_t)&protocol conformance descriptor for IntentPaymentMethod);
}

void sub_24B34FB88()
{
  sub_24B34FD98(&qword_257970218, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5170], (uint64_t)&protocol conformance descriptor for IntentPerson);
}

void sub_24B34FBB4()
{
  sub_24B34FD98(&qword_257970220, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5170], (uint64_t)&protocol conformance descriptor for IntentPerson);
}

void sub_24B34FBE0()
{
  sub_24B34FD98(&qword_257970228, (uint64_t (*)(uint64_t))MEMORY[0x24BDB5170], (uint64_t)&protocol conformance descriptor for IntentPerson);
}

void sub_24B34FC0C()
{
  sub_24B34FD98(&qword_257970230, MEMORY[0x24BDB59B0], (uint64_t)&protocol conformance descriptor for IntentReminderTask);
}

void sub_24B34FC38()
{
  sub_24B34FD98(&qword_257970238, MEMORY[0x24BDB59B0], (uint64_t)&protocol conformance descriptor for IntentReminderTask);
}

void sub_24B34FC64()
{
  sub_24B34FD98(&qword_257970240, MEMORY[0x24BDB59B0], (uint64_t)&protocol conformance descriptor for IntentReminderTask);
}

void sub_24B34FC90()
{
  sub_24B34FD98(&qword_257970248, MEMORY[0x24BDB5F78], (uint64_t)&protocol conformance descriptor for IntentReminderTaskList);
}

void sub_24B34FCBC()
{
  sub_24B34FD98(&qword_257970250, MEMORY[0x24BDB5F78], (uint64_t)&protocol conformance descriptor for IntentReminderTaskList);
}

void sub_24B34FCE8()
{
  sub_24B34FD98(&qword_257970258, MEMORY[0x24BDB5F78], (uint64_t)&protocol conformance descriptor for IntentReminderTaskList);
}

void sub_24B34FD14()
{
  sub_24B34FD98(&qword_257970260, MEMORY[0x24BDB4FB0], (uint64_t)&protocol conformance descriptor for IntentTimer);
}

void sub_24B34FD40()
{
  sub_24B34FD98(&qword_257970268, MEMORY[0x24BDB4FB0], (uint64_t)&protocol conformance descriptor for IntentTimer);
}

void sub_24B34FD6C()
{
  sub_24B34FD98(&qword_257970270, MEMORY[0x24BDB4FB0], (uint64_t)&protocol conformance descriptor for IntentTimer);
}

void sub_24B34FD98(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x24BD1DE8C](a3, v5), a1);
  }
  OUTLINED_FUNCTION_25();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24BD1DE80]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_24B34FE14(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if (a3 < a1 || (result = sub_24B350320(), a1 + *(_QWORD *)(*(_QWORD *)(result - 8) + 72) * a2 <= a3))
  {
    sub_24B350320();
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (a3 != a1)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

size_t sub_24B34FEB4(size_t result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  uint64_t v15;
  uint64_t v16;

  v5 = result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_25:
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
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEE4AF8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_257970308);
  v10 = *(_QWORD *)(sub_24B350320() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  result = _swift_stdlib_malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1)
    goto LABEL_24;
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  v15 = *(unsigned __int8 *)(*(_QWORD *)(sub_24B350320() - 8) + 80);
  v16 = (v15 + 32) & ~v15;
  if ((v5 & 1) != 0)
  {
    sub_24B34FE14(a4 + v16, v8, (unint64_t)v13 + v16);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_24B350004(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = objc_msgSend(a1, sel_aliases);
  if (!v1)
    return 0;
  v2 = v1;
  sub_24B350154(0, (unint64_t *)&unk_257970310);
  v3 = sub_24B35041C();

  return v3;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_24B35007C(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_24B350410();

  return v4;
}

void sub_24B3500D8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  OUTLINED_FUNCTION_25();
}

void sub_24B350118(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_25();
}

uint64_t sub_24B350154(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_0()
{
  return sub_24B3504DC();
}

uint64_t OUTLINED_FUNCTION_1()
{
  return sub_24B350410();
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return 0;
}

uint64_t OUTLINED_FUNCTION_13()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_15(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  return sub_24B34C95C(&a9, v9);
}

uint64_t OUTLINED_FUNCTION_18@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void OUTLINED_FUNCTION_20()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_21(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_22(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_23(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return __swift_storeEnumTagSinglePayload(a1, a2, a3, v3);
}

uint64_t OUTLINED_FUNCTION_24()
{
  return sub_24B350338();
}

uint64_t sub_24B3502E4()
{
  return MEMORY[0x24BDB5058]();
}

uint64_t sub_24B3502F0()
{
  return MEMORY[0x24BDB5060]();
}

uint64_t sub_24B3502FC()
{
  return MEMORY[0x24BDB5098]();
}

uint64_t sub_24B350308()
{
  return MEMORY[0x24BDB50F8]();
}

uint64_t sub_24B350314()
{
  return MEMORY[0x24BDB5128]();
}

uint64_t sub_24B350320()
{
  return MEMORY[0x24BDB5140]();
}

uint64_t sub_24B35032C()
{
  return MEMORY[0x24BDB5150]();
}

uint64_t sub_24B350338()
{
  return MEMORY[0x24BDB5170]();
}

uint64_t sub_24B350344()
{
  return MEMORY[0x24BDB5378]();
}

uint64_t sub_24B350350()
{
  return MEMORY[0x24BDB5820]();
}

uint64_t sub_24B35035C()
{
  return MEMORY[0x24BDB5CF8]();
}

uint64_t sub_24B350368()
{
  return MEMORY[0x24BDB5D58]();
}

uint64_t sub_24B350374()
{
  return MEMORY[0x24BDB5DB0]();
}

uint64_t sub_24B350380()
{
  return MEMORY[0x24BDB62F8]();
}

uint64_t sub_24B35038C()
{
  return MEMORY[0x24BDCCBD0]();
}

uint64_t sub_24B350398()
{
  return MEMORY[0x24BDCCC10]();
}

uint64_t sub_24B3503A4()
{
  return MEMORY[0x24BDCE9B0]();
}

uint64_t sub_24B3503B0()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_24B3503BC()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24B3503C8()
{
  return MEMORY[0x24BE03DE8]();
}

uint64_t sub_24B3503D4()
{
  return MEMORY[0x24BE03DF0]();
}

uint64_t sub_24B3503E0()
{
  return MEMORY[0x24BE04038]();
}

uint64_t sub_24B3503EC()
{
  return MEMORY[0x24BE04040]();
}

uint64_t sub_24B3503F8()
{
  return MEMORY[0x24BE04048]();
}

uint64_t sub_24B350404()
{
  return MEMORY[0x24BE04050]();
}

uint64_t sub_24B350410()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24B35041C()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_24B350428()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_24B350434()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_24B350440()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_24B35044C()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_24B350458()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_24B350464()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_24B350470()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24B35047C()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_24B350488()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_24B350494()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_24B3504A0()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_24B3504AC()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_24B3504B8()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_24B3504C4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_24B3504D0()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_24B3504DC()
{
  return MEMORY[0x24BEE3A30]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
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

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

