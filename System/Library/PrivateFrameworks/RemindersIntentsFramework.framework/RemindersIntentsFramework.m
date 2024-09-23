uint64_t sub_2450D64C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_24510391C();
  __swift_allocate_value_buffer(v0, qword_25744B278);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25744B278);
  if (qword_25744B2B0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25744C4D0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id variable initialization expression of TTRIntentHandler.store()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7D290]), sel_initUserInteractive_, 1);
}

uint64_t variable initialization expression of TTRIntentHandler.queue()
{
  sub_2450D8184(0, (unint64_t *)&qword_25744B300);
  return sub_245103AFC();
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_contactStore()
{
  return 0;
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_addTasksHandler()
{
  return 0;
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_setTaskAttributeHandler()
{
  return 0;
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_snoozeTasksHandler()
{
  return 0;
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_searchForNotebookItemsHandler()
{
  return 0;
}

uint64_t variable initialization expression of TTRIntentHandler.$__lazy_storage_$_widgetListHandler()
{
  return 0;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_2450D65F0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_2450D6610(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_2450D81E4(a1, &qword_25744B308);
}

_QWORD *sub_2450D664C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_2450D665C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_2450D6668(uint64_t a1, uint64_t a2)
{
  return sub_2450D6910(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_2450D6674(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_245103970();
  *a2 = 0;
  return result;
}

uint64_t sub_2450D66E8(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_24510397C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_2450D6764@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_245103988();
  v2 = sub_245103964();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2450D67A4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_245103988();
  v2 = v1;
  if (v0 == sub_245103988() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_245103E38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_2450D682C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_245103964();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_2450D6870@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_245103988();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_2450D6898()
{
  sub_2450D8270(&qword_25744B370, (uint64_t)&unk_245104750);
  sub_2450D8270(&qword_25744B378, (uint64_t)&unk_2451046F8);
  return sub_245103E08();
}

uint64_t sub_2450D6904(uint64_t a1, uint64_t a2)
{
  return sub_2450D6910(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_2450D6910(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_245103988();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_2450D694C()
{
  sub_245103988();
  sub_2451039B8();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2450D698C()
{
  uint64_t v0;

  sub_245103988();
  sub_245103E68();
  sub_2451039B8();
  v0 = sub_245103E74();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_2450D69FC(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint8_t *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  IMP *p_imp;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  id v39;
  id v40;
  void *v41;
  unint64_t v42;
  uint64_t v43;
  id v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  void *ObjCClassFromMetadata;
  void *v58;
  id v59;
  NSObject *v60;
  os_log_type_t v61;
  unint64_t v62;
  void *v63;
  id i;
  id v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  id v69;
  id v70;
  void *v71;
  uint8_t *v72;
  uint64_t v73;
  uint64_t v74;
  unint64_t v75;

  if (qword_25744B270 != -1)
    swift_once();
  v5 = sub_24510391C();
  v6 = (uint8_t *)__swift_project_value_buffer(v5, (uint64_t)qword_25744B278);
  v7 = a1;
  v8 = sub_245103910();
  v9 = sub_245103AB4();
  p_imp = &stru_251606FF0.imp;
  if (os_log_type_enabled(v8, v9))
  {
    v73 = a3;
    v11 = (uint8_t *)swift_slowAlloc();
    v72 = v6;
    v12 = swift_slowAlloc();
    v75 = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = objc_msgSend(v7, sel_contactEventTrigger);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B338);
    v14 = sub_245103C1C();
    v16 = v15;

    v17 = v14;
    p_imp = (IMP *)(&stru_251606FF0 + 16);
    sub_245101AB4(v17, v16, (uint64_t *)&v75);
    sub_245103C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v8, v9, "SiriKit asked for resolving contactEventTrigger {contactEventTrigger: %s}", v11, 0xCu);
    swift_arrayDestroy();
    v6 = v72;
    MEMORY[0x24952EEE4](v12, -1, -1);
    v18 = v11;
    a3 = v73;
    MEMORY[0x24952EEE4](v18, -1, -1);

  }
  else
  {

  }
  v19 = objc_msgSend(v7, (SEL)p_imp[450]);
  if (!v19)
    goto LABEL_13;
  v20 = v19;
  v21 = objc_msgSend(v19, sel_triggerContact);
  if (!v21)
  {

LABEL_13:
    v29 = sub_245103910();
    v30 = sub_245103AB4();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_2450D4000, v29, v30, "Got nil contactEventTrigger. {result: .notRequired}", v31, 2u);
      MEMORY[0x24952EEE4](v31, -1, -1);
    }

    sub_2450D8184(0, &qword_25744B340);
    v20 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v20);
    goto LABEL_16;
  }
  v22 = v21;
  v23 = sub_2450DB1F0(v7);
  if (!v23)
  {
    v32 = sub_245103910();
    v33 = sub_245103A9C();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_2450D4000, v32, v33, "Unable to lookup capabilities. Ignoring contactEventTrigger. {result: .notRequired}", v34, 2u);
      MEMORY[0x24952EEE4](v34, -1, -1);
    }

    sub_2450D8184(0, &qword_25744B340);
    v35 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v35);

    v20 = v35;
    goto LABEL_16;
  }
  v24 = v23;
  if ((objc_msgSend(v23, sel_supportsPersonTrigger) & 1) == 0)
  {
    v36 = sub_245103910();
    v37 = sub_245103AB4();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_2450D4000, v36, v37, "Reminder account doesn't support contactTrigger. {result: .unsupported(.accountDoesNotSupport)}", v38, 2u);
      MEMORY[0x24952EEE4](v38, -1, -1);
    }

    v39 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 1);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v39);

    v20 = v39;
    goto LABEL_16;
  }
  v25 = objc_msgSend(v22, sel_contactIdentifier);
  if (v25)
  {

    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
    v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_245104540;
    *(_QWORD *)(v26 + 32) = v22;
    v75 = v26;
    sub_245103A0C();
    v27 = v75;
    v28 = v22;
  }
  else
  {
    v40 = objc_msgSend(v22, sel_alternatives);
    if (v40)
    {
      v41 = v40;
      sub_2450D8184(0, &qword_25744B328);
      v27 = sub_2451039F4();

    }
    else
    {
      v27 = MEMORY[0x24BEE4AF8];
    }
  }
  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    v42 = sub_245103DE4();
    swift_bridgeObjectRelease();
    v71 = v24;
    if (v42)
    {
LABEL_28:
      v75 = MEMORY[0x24BEE4AF8];
      sub_245103D24();
      if ((v42 & 0x8000000000000000) != 0)
      {
        __break(1u);
LABEL_60:
        v70 = (id)MEMORY[0x24952E92C](0, v42);
LABEL_56:
        v58 = v70;
        swift_bridgeObjectRelease();
        sub_2450D8184(0, &qword_25744B340);
        v59 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedContactEventTrigger_, v58);
        goto LABEL_57;
      }
      v43 = 0;
      do
      {
        if ((v27 & 0xC000000000000001) != 0)
          v44 = (id)MEMORY[0x24952E92C](v43, v27);
        else
          v44 = *(id *)(v27 + 8 * v43 + 32);
        v45 = v44;
        ++v43;
        objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9C40]), sel_initWithTriggerContact_, v44);

        sub_245103D0C();
        sub_245103D30();
        sub_245103D3C();
        sub_245103D18();
      }
      while (v42 != v43);
      v42 = v75;
      swift_bridgeObjectRelease();
      v24 = v71;
      if (!(v42 >> 62))
        goto LABEL_35;
LABEL_42:
      swift_bridgeObjectRetain();
      v46 = sub_245103DE4();
      swift_bridgeObjectRelease();
      if (v46 >= 2)
        goto LABEL_36;
      goto LABEL_43;
    }
  }
  else
  {
    v42 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
    v71 = v24;
    if (v42)
      goto LABEL_28;
  }
  swift_bridgeObjectRelease();
  v42 = MEMORY[0x24BEE4AF8];
  if (MEMORY[0x24BEE4AF8] >> 62)
    goto LABEL_42;
LABEL_35:
  v46 = *(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v46 >= 2)
  {
LABEL_36:
    swift_bridgeObjectRetain_n();
    v47 = sub_245103910();
    v48 = sub_245103AB4();
    if (os_log_type_enabled(v47, v48))
    {
      v49 = (uint8_t *)swift_slowAlloc();
      v74 = swift_slowAlloc();
      v75 = v74;
      *(_DWORD *)v49 = 136315138;
      v50 = v22;
      v51 = sub_2450D8184(0, &qword_25744B320);
      v52 = swift_bridgeObjectRetain();
      v53 = MEMORY[0x24952E644](v52, v51);
      v55 = v54;
      swift_bridgeObjectRelease();
      v56 = v53;
      v22 = v50;
      v24 = v71;
      sub_245101AB4(v56, v55, (uint64_t *)&v75);
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v47, v48, "Got >1 triggersToChoose {result: .disambiguation(%s)}", v49, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v74, -1, -1);
      MEMORY[0x24952EEE4](v49, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_2450D8184(0, &qword_25744B340);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_2450D8184(0, &qword_25744B320);
    v58 = (void *)sub_2451039E8();
    swift_bridgeObjectRelease();
    v59 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithContactEventTriggersToDisambiguate_, v58);
LABEL_57:
    v69 = v59;

LABEL_58:
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v69);

LABEL_16:
    return;
  }
LABEL_43:
  if (v46 != 1)
  {
    swift_bridgeObjectRelease();
    v66 = sub_245103910();
    v67 = sub_245103AB4();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v68 = 0;
      _os_log_impl(&dword_2450D4000, v66, v67, "Got 0 triggersToChoose {result: .unsupported}", v68, 2u);
      MEMORY[0x24952EEE4](v68, -1, -1);
    }

    sub_2450D8184(0, &qword_25744B340);
    v69 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    goto LABEL_58;
  }
  swift_bridgeObjectRetain_n();
  v60 = sub_245103910();
  v61 = sub_245103AB4();
  if (!os_log_type_enabled(v60, v61))
  {

    swift_bridgeObjectRelease_n();
    v62 = v42 & 0xC000000000000001;
    goto LABEL_53;
  }
  v6 = (uint8_t *)swift_slowAlloc();
  v27 = swift_slowAlloc();
  *(_DWORD *)v6 = 138412290;
  v62 = v42 & 0xC000000000000001;
  if ((v42 & 0xC000000000000001) != 0)
    goto LABEL_62;
  if (*(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v63 = v22;
    for (i = *(id *)(v42 + 32); ; i = (id)MEMORY[0x24952E92C](0, v42))
    {
      v65 = i;
      v75 = (unint64_t)i;
      sub_245103C28();
      *(_QWORD *)v27 = v65;
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2450D4000, v60, v61, "Got 1 triggersToChoose {result: .success(%@)}", v6, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v27, -1, -1);
      MEMORY[0x24952EEE4](v6, -1, -1);

      v22 = v63;
      v24 = v71;
LABEL_53:
      if (v62)
        break;
      if (*(_QWORD *)((v42 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v70 = *(id *)(v42 + 32);
        goto LABEL_56;
      }
      __break(1u);
LABEL_62:
      v63 = v22;
    }
    goto LABEL_60;
  }
  __break(1u);
}

void sub_2450D753C(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint8_t *v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  IMP *p_imp;
  uint8_t *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint8_t *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  id v35;
  NSObject *v36;
  os_log_type_t v37;
  uint8_t *v38;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  id v42;
  id v43;
  void *v44;
  unint64_t v45;
  uint64_t v46;
  id v47;
  void *v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  uint64_t v59;
  void *ObjCClassFromMetadata;
  void *v61;
  id v62;
  NSObject *v63;
  os_log_type_t v64;
  unint64_t v65;
  void *v66;
  id i;
  id v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  id v72;
  id v73;
  id v74;
  uint8_t *v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;

  if (qword_25744B270 != -1)
    swift_once();
  v5 = sub_24510391C();
  v6 = (uint8_t *)__swift_project_value_buffer(v5, (uint64_t)qword_25744B278);
  v7 = a1;
  v8 = sub_245103910();
  v9 = sub_245103AB4();
  p_imp = &stru_251606FF0.imp;
  if (os_log_type_enabled(v8, v9))
  {
    v76 = a3;
    v11 = (uint8_t *)swift_slowAlloc();
    v75 = v6;
    v12 = swift_slowAlloc();
    v78 = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = objc_msgSend(v7, sel_contactEventTrigger);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B338);
    v14 = sub_245103C1C();
    v16 = v15;

    v17 = v14;
    p_imp = (IMP *)(&stru_251606FF0 + 16);
    sub_245101AB4(v17, v16, (uint64_t *)&v78);
    sub_245103C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v8, v9, "SiriKit asked for resolving contactEventTrigger {contactEventTrigger: %s}", v11, 0xCu);
    swift_arrayDestroy();
    v6 = v75;
    MEMORY[0x24952EEE4](v12, -1, -1);
    v18 = v11;
    a3 = v76;
    MEMORY[0x24952EEE4](v18, -1, -1);

  }
  else
  {

  }
  v19 = objc_msgSend(v7, (SEL)p_imp[450]);
  if (!v19)
    goto LABEL_18;
  v20 = v19;
  v21 = objc_msgSend(v19, sel_triggerContact);
  if (!v21)
  {

LABEL_18:
    v36 = sub_245103910();
    v37 = sub_245103AB4();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v38 = 0;
      _os_log_impl(&dword_2450D4000, v36, v37, "Got nil contactEventTrigger. {result: .notRequired}", v38, 2u);
      MEMORY[0x24952EEE4](v38, -1, -1);
    }

    sub_2450D8184(0, (unint64_t *)&unk_25744B310);
    v20 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v20);
    goto LABEL_21;
  }
  v22 = v21;
  v23 = objc_msgSend(v7, sel_targetTask);
  if (!v23
    || (v24 = v23, v25 = (void *)sub_245103B74(), v24, !v25)
    || (v26 = objc_msgSend(v25, sel_account),
        v27 = objc_msgSend(v26, sel_capabilities),
        v26,
        v25,
        !v27))
  {
    v32 = sub_245103910();
    v33 = sub_245103A9C();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_2450D4000, v32, v33, "Unable to lookup capabilities. Ignoring contactEventTrigger. {result: .notRequired}", v34, 2u);
      MEMORY[0x24952EEE4](v34, -1, -1);
    }

    sub_2450D8184(0, (unint64_t *)&unk_25744B310);
    v35 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v35);

    v20 = v35;
    goto LABEL_21;
  }
  if (!objc_msgSend(v27, sel_supportsPersonTrigger))
  {
    v39 = sub_245103910();
    v40 = sub_245103AB4();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl(&dword_2450D4000, v39, v40, "Reminder account doesn't support contactTrigger. {result: .unsupported(.accountDoesNotSupport)}", v41, 2u);
      MEMORY[0x24952EEE4](v41, -1, -1);
    }

    v42 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 1);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v42);

    v20 = v42;
    goto LABEL_21;
  }
  v28 = objc_msgSend(v22, sel_contactIdentifier);
  if (v28)
  {

    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
    v29 = swift_allocObject();
    *(_OWORD *)(v29 + 16) = xmmword_245104540;
    *(_QWORD *)(v29 + 32) = v22;
    v78 = v29;
    sub_245103A0C();
    v30 = v78;
    v31 = v22;
  }
  else
  {
    v43 = objc_msgSend(v22, sel_alternatives);
    if (v43)
    {
      v44 = v43;
      sub_2450D8184(0, &qword_25744B328);
      v30 = sub_2451039F4();

    }
    else
    {
      v30 = MEMORY[0x24BEE4AF8];
    }
  }
  if (v30 >> 62)
  {
    swift_bridgeObjectRetain();
    v45 = sub_245103DE4();
    swift_bridgeObjectRelease();
    v74 = v27;
    if (v45)
      goto LABEL_30;
LABEL_38:
    swift_bridgeObjectRelease();
    v45 = MEMORY[0x24BEE4AF8];
    goto LABEL_39;
  }
  v45 = *(_QWORD *)((v30 & 0xFFFFFFFFFFFFF8) + 0x10);
  v74 = v27;
  if (!v45)
    goto LABEL_38;
LABEL_30:
  v78 = MEMORY[0x24BEE4AF8];
  sub_245103D24();
  if ((v45 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_63:
    v73 = (id)MEMORY[0x24952E92C](0, v45);
LABEL_59:
    v61 = v73;
    swift_bridgeObjectRelease();
    sub_2450D8184(0, (unint64_t *)&unk_25744B310);
    v62 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedContactEventTrigger_, v61);
    goto LABEL_60;
  }
  v46 = 0;
  do
  {
    if ((v30 & 0xC000000000000001) != 0)
      v47 = (id)MEMORY[0x24952E92C](v46, v30);
    else
      v47 = *(id *)(v30 + 8 * v46 + 32);
    v48 = v47;
    ++v46;
    objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9C40]), sel_initWithTriggerContact_, v47);

    sub_245103D0C();
    sub_245103D30();
    sub_245103D3C();
    sub_245103D18();
  }
  while (v45 != v46);
  v45 = v78;
  swift_bridgeObjectRelease();
  v27 = v74;
LABEL_39:
  if (v45 >> 62)
  {
    swift_bridgeObjectRetain();
    v49 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v49 >= 2)
      goto LABEL_41;
  }
  else
  {
    v49 = *(_QWORD *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v49 >= 2)
    {
LABEL_41:
      swift_bridgeObjectRetain_n();
      v50 = sub_245103910();
      v51 = sub_245103AB4();
      if (os_log_type_enabled(v50, v51))
      {
        v52 = (uint8_t *)swift_slowAlloc();
        v77 = swift_slowAlloc();
        v78 = v77;
        *(_DWORD *)v52 = 136315138;
        v53 = v22;
        v54 = sub_2450D8184(0, &qword_25744B320);
        v55 = swift_bridgeObjectRetain();
        v56 = MEMORY[0x24952E644](v55, v54);
        v58 = v57;
        swift_bridgeObjectRelease();
        v59 = v56;
        v22 = v53;
        v27 = v74;
        sub_245101AB4(v59, v58, (uint64_t *)&v78);
        sub_245103C28();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2450D4000, v50, v51, "Got >1 triggersToChoose {result: .disambiguation(%s)}", v52, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v77, -1, -1);
        MEMORY[0x24952EEE4](v52, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_2450D8184(0, (unint64_t *)&unk_25744B310);
      ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
      sub_2450D8184(0, &qword_25744B320);
      v61 = (void *)sub_2451039E8();
      swift_bridgeObjectRelease();
      v62 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithContactEventTriggersToDisambiguate_, v61);
LABEL_60:
      v72 = v62;

LABEL_61:
      (*(void (**)(uint64_t, id))(a3 + 16))(a3, v72);

LABEL_21:
      return;
    }
  }
  if (v49 != 1)
  {
    swift_bridgeObjectRelease();
    v69 = sub_245103910();
    v70 = sub_245103AB4();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v71 = 0;
      _os_log_impl(&dword_2450D4000, v69, v70, "Got 0 triggersToChoose {result: .unsupported}", v71, 2u);
      MEMORY[0x24952EEE4](v71, -1, -1);
    }

    sub_2450D8184(0, (unint64_t *)&unk_25744B310);
    v72 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    goto LABEL_61;
  }
  swift_bridgeObjectRetain_n();
  v63 = sub_245103910();
  v64 = sub_245103AB4();
  if (!os_log_type_enabled(v63, v64))
  {

    swift_bridgeObjectRelease_n();
    v65 = v45 & 0xC000000000000001;
    goto LABEL_56;
  }
  v6 = (uint8_t *)swift_slowAlloc();
  v30 = swift_slowAlloc();
  *(_DWORD *)v6 = 138412290;
  v65 = v45 & 0xC000000000000001;
  if ((v45 & 0xC000000000000001) != 0)
    goto LABEL_65;
  if (*(_QWORD *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v66 = v22;
    for (i = *(id *)(v45 + 32); ; i = (id)MEMORY[0x24952E92C](0, v45))
    {
      v68 = i;
      v78 = (unint64_t)i;
      sub_245103C28();
      *(_QWORD *)v30 = v68;
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2450D4000, v63, v64, "Got 1 triggersToChoose {result: .success(%@)}", v6, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v30, -1, -1);
      MEMORY[0x24952EEE4](v6, -1, -1);

      v22 = v66;
      v27 = v74;
LABEL_56:
      if (v65)
        break;
      if (*(_QWORD *)((v45 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v73 = *(id *)(v45 + 32);
        goto LABEL_59;
      }
      __break(1u);
LABEL_65:
      v66 = v22;
    }
    goto LABEL_63;
  }
  __break(1u);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24952EE24]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
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

uint64_t sub_2450D8184(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for INTaskReference(uint64_t a1)
{
  sub_2450D81E4(a1, &qword_25744B348);
}

void type metadata accessor for REMSmartListType(uint64_t a1)
{
  sub_2450D81E4(a1, &qword_25744B350);
}

void sub_2450D81E4(uint64_t a1, unint64_t *a2)
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

uint64_t sub_2450D8228()
{
  return sub_2450D8270(&qword_25744B358, (uint64_t)&unk_2451046C0);
}

uint64_t sub_2450D824C()
{
  return sub_2450D8270(&qword_25744B360, (uint64_t)&unk_245104698);
}

uint64_t sub_2450D8270(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for REMSmartListType(255);
    result = MEMORY[0x24952EE3C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2450D82B0()
{
  return sub_2450D8270(&qword_25744B368, (uint64_t)&unk_245104728);
}

uint64_t sub_2450D82D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_24510391C();
  __swift_allocate_value_buffer(v0, qword_25744B3E0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25744B3E0);
  if (qword_25744B2B0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25744C4D0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_2450D8368(uint64_t a1, uint64_t a2, void (*a3)(_QWORD))
{
  uint64_t v5;
  unint64_t v6;
  uint64_t (*v7)(uint64_t);
  unint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  _QWORD *v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id *v28;
  id v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  _QWORD *v35;
  id v36;
  NSObject *v37;
  void (*v38)(_QWORD);
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  void *ObjCClassFromMetadata;
  uint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  os_log_type_t type[8];
  uint64_t v61;

  v5 = sub_245103730();
  v6 = sub_245103718();
  v61 = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744B698);
  sub_245103460();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x24BDCEA58];
  sub_2450E37D4();
  sub_2450E3554(&qword_25744B6A8, v7, MEMORY[0x24BDCEA88]);
  v8 = sub_2451039D0();
  swift_bridgeObjectRelease();
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = (void *)sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v9)
      goto LABEL_5;
  }
  else
  {
    v9 = *(void **)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v9)
      goto LABEL_5;
  }
  if (!(v6 >> 62))
  {
    if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_5;
LABEL_52:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (qword_25744B290 != -1)
      swift_once();
    v56 = sub_24510391C();
    __swift_project_value_buffer(v56, (uint64_t)qword_25744B3E0);
    v57 = sub_245103910();
    v58 = sub_245103AB4();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v59 = 0;
      _os_log_impl(&dword_2450D4000, v57, v58, "No REMList or REMSmartList matches the name, prompt for creation {result: .confirmationRequired(.listShouldBeCreated)}", v59, 2u);
      MEMORY[0x24952EEE4](v59, -1, -1);
    }

    v40 = objc_msgSend((id)objc_opt_self(), sel_confirmationRequiredWithTaskListToConfirm_forReason_, a2, 1);
    goto LABEL_57;
  }
  swift_bridgeObjectRetain();
  v55 = sub_245103DE4();
  swift_bridgeObjectRelease();
  if (!v55)
    goto LABEL_52;
LABEL_5:
  if (v8 >> 62)
  {
    swift_bridgeObjectRetain();
    v10 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (!v9)
      goto LABEL_16;
LABEL_9:
    if (v10 != 1)
      goto LABEL_16;
    if ((v8 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      v11 = (id)MEMORY[0x24952E92C](0, v8);
      swift_bridgeObjectRelease();
    }
    else
    {
      if (!*(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_50;
      }
      v11 = *(id *)(v8 + 32);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_2450D8184(0, &qword_25744B5B8);
    v8 = (unint64_t)v11;
    v9 = (void *)sub_245103A60();
    if (qword_25744B290 == -1)
    {
LABEL_14:
      v12 = sub_24510391C();
      __swift_project_value_buffer(v12, (uint64_t)qword_25744B3E0);
      v13 = (id *)(id)v8;
      v14 = v9;
      v15 = v13;
      v16 = v14;
      v17 = sub_245103910();
      v18 = sub_245103AB4();
      if (os_log_type_enabled(v17, v18))
      {
        v19 = swift_slowAlloc();
        v20 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v19 = 138412546;
        *(_QWORD *)type = a3;
        v21 = -[NSObject objectID](v15, sel_objectID);
        sub_245103C28();
        *v20 = v21;

        *(_WORD *)(v19 + 12) = 2112;
        v61 = (uint64_t)v16;
        v22 = v15;
        v23 = v16;
        a3 = *(void (**)(_QWORD))type;
        sub_245103C28();
        v20[1] = v16;

        v15 = v22;
        _os_log_impl(&dword_2450D4000, v17, v18, "Got one REMList(%@) matches the name {result: .success(%@)}", (uint8_t *)v19, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v20, -1, -1);
        MEMORY[0x24952EEE4](v19, -1, -1);
      }
      else
      {

        v17 = v15;
      }

      sub_2450D8184(0, &qword_25744B5A8);
      v40 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedTaskList_, v16);

      goto LABEL_57;
    }
LABEL_50:
    swift_once();
    goto LABEL_14;
  }
  v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v9)
    goto LABEL_9;
LABEL_16:
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v41 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v41 != 1)
      goto LABEL_35;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v24 = (void *)sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v24)
    {
LABEL_19:
      if ((v6 & 0xC000000000000001) != 0)
      {
        v25 = (id)MEMORY[0x24952E92C](0, v6);
      }
      else
      {
        if (!*(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_60;
        }
        v25 = *(id *)(v6 + 32);
      }
      v26 = v25;
      swift_bridgeObjectRelease();
      sub_2450D8184(0, &qword_25744B5B8);
      v8 = v26;
      v24 = (void *)sub_245103A48();
      if (qword_25744B290 == -1)
      {
LABEL_23:
        v27 = sub_24510391C();
        __swift_project_value_buffer(v27, (uint64_t)qword_25744B3E0);
        v28 = (id *)(id)v8;
        v29 = v24;
        v30 = v28;
        v31 = v29;
        v32 = sub_245103910();
        v33 = sub_245103AB4();
        if (os_log_type_enabled(v32, v33))
        {
          v34 = swift_slowAlloc();
          v35 = (_QWORD *)swift_slowAlloc();
          *(_DWORD *)v34 = 138412546;
          v36 = -[NSObject objectID](v30, sel_objectID);
          sub_245103C28();
          *v35 = v36;

          *(_WORD *)(v34 + 12) = 2112;
          v61 = (uint64_t)v31;
          v37 = v30;
          v38 = a3;
          v39 = v31;
          sub_245103C28();
          v35[1] = v31;

          a3 = v38;
          v30 = v37;
          _os_log_impl(&dword_2450D4000, v32, v33, "Found REMSmartList matching the name {objectID: %@, result: .success(%@)}", (uint8_t *)v34, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
          swift_arrayDestroy();
          MEMORY[0x24952EEE4](v35, -1, -1);
          MEMORY[0x24952EEE4](v34, -1, -1);
        }
        else
        {

          v32 = v30;
        }

        sub_2450D8184(0, &qword_25744B5A8);
        v40 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedTaskList_, v31);

LABEL_48:
LABEL_57:
        a3(v40);

        return;
      }
LABEL_60:
      swift_once();
      goto LABEL_23;
    }
  }
  else
  {
    if (*(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) != 1)
      goto LABEL_35;
    swift_bridgeObjectRelease();
    v24 = *(void **)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v24)
      goto LABEL_19;
  }
  swift_bridgeObjectRelease();
  __break(1u);
LABEL_35:
  swift_bridgeObjectRelease();
  if (!v10)
    goto LABEL_42;
  v61 = MEMORY[0x24BEE4AF8];
  sub_245103D24();
  if ((v10 & 0x8000000000000000) == 0)
  {
    sub_2450D8184(0, &qword_25744B5B8);
    v42 = 0;
    do
    {
      if ((v8 & 0xC000000000000001) != 0)
        MEMORY[0x24952E92C](v42, v8);
      else
        v43 = *(id *)(v8 + 8 * v42 + 32);
      ++v42;
      sub_245103A60();
      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
    }
    while (v10 != v42);
LABEL_42:
    if (qword_25744B290 != -1)
      swift_once();
    v44 = sub_24510391C();
    __swift_project_value_buffer(v44, (uint64_t)qword_25744B3E0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    v45 = sub_245103910();
    v46 = sub_245103AB4();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = swift_slowAlloc();
      v48 = swift_slowAlloc();
      v61 = v48;
      *(_DWORD *)v47 = 134218242;
      swift_bridgeObjectRelease();
      sub_245103C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v47 + 12) = 2080;
      v49 = sub_2450D8184(0, &qword_25744B5B8);
      v50 = swift_bridgeObjectRetain();
      v51 = MEMORY[0x24952E644](v50, v49);
      v53 = v52;
      swift_bridgeObjectRelease();
      sub_245101AB4(v51, v53, &v61);
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v45, v46, "Got %ld REMList matches the name {result: .disambiguation(%s)}", (uint8_t *)v47, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v48, -1, -1);
      MEMORY[0x24952EEE4](v47, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_2450D8184(0, &qword_25744B5A8);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_2450D8184(0, &qword_25744B5B8);
    v30 = sub_2451039E8();
    swift_bridgeObjectRelease();
    v40 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithTaskListsToDisambiguate_, v30);
    goto LABEL_48;
  }
  __break(1u);
}

void sub_2450D8ECC(id *a1)
{
  id v1;
  id v2;

  v1 = objc_msgSend(*a1, sel_remObjectID);
  v2 = objc_msgSend(v1, sel_uuid);

  sub_245103454();
}

void sub_2450D8F40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void (*a6)(_QWORD))
{
  void *v6;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(_QWORD);
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  void **v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  void *ObjCClassFromMetadata;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  unint64_t v73;
  uint64_t v74;
  uint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  unint64_t v81;
  _QWORD *v82;
  os_log_type_t v83;
  uint64_t v84;
  NSObject *log;
  os_log_t loga;
  uint64_t v87;
  void (*v88)(_QWORD);
  void (*v89)(_QWORD);
  uint64_t v90;

  if (!((unint64_t)a1 >> 62))
  {
    v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_3;
LABEL_32:
    if (qword_25744B290 != -1)
      swift_once();
    v65 = sub_24510391C();
    __swift_project_value_buffer(v65, (uint64_t)qword_25744B3E0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v66 = sub_245103910();
    v67 = sub_245103AB4();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = swift_slowAlloc();
      v84 = swift_slowAlloc();
      v90 = v84;
      *(_DWORD *)v68 = 136315650;
      v89 = a6;
      v69 = sub_2450D8184(0, &qword_25744B328);
      v70 = swift_bridgeObjectRetain();
      v71 = MEMORY[0x24952E644](v70, v69);
      v73 = v72;
      swift_bridgeObjectRelease();
      sub_245101AB4(v71, v73, &v90);
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v68 + 12) = 2080;
      swift_bridgeObjectRetain();
      v74 = MEMORY[0x24BEE0D00];
      v75 = MEMORY[0x24952E644](a3, MEMORY[0x24BEE0D00]);
      v77 = v76;
      swift_bridgeObjectRelease();
      sub_245101AB4(v75, v77, &v90);
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v68 + 22) = 2080;
      v78 = swift_bridgeObjectRetain();
      v79 = MEMORY[0x24952E644](v78, v74);
      v81 = v80;
      swift_bridgeObjectRelease();
      sub_245101AB4(v79, v81, &v90);
      a6 = v89;
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v66, v67, "No list shared with the specified .targetTaskListMembers {targetTaskListMembers: %s, emails: %s, phones: %s, result: .disambiguateDueToNoDefaultList}", (uint8_t *)v68, 0x20u);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v84, -1, -1);
      MEMORY[0x24952EEE4](v68, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    v35 = sub_2450D9C0C();
    goto LABEL_38;
  }
  if (a1 < 0)
    v6 = (void *)a1;
  else
    v6 = (void *)(a1 & 0xFFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  v64 = sub_245103DE4();
  swift_bridgeObjectRelease();
  if (!v64)
    goto LABEL_32;
  swift_bridgeObjectRetain();
  v10 = sub_245103DE4();
  swift_bridgeObjectRelease();
LABEL_3:
  if (!v10)
  {
LABEL_21:
    if (qword_25744B290 != -1)
      swift_once();
    v40 = sub_24510391C();
    __swift_project_value_buffer(v40, (uint64_t)qword_25744B3E0);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain_n();
    v41 = sub_245103910();
    v42 = sub_245103AB4();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = swift_slowAlloc();
      loga = (os_log_t)swift_slowAlloc();
      v90 = (uint64_t)loga;
      *(_DWORD *)v43 = 134219010;
      swift_bridgeObjectRelease();
      sub_245103C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 12) = 2080;
      v44 = sub_2450D8184(0, &qword_25744B328);
      v45 = swift_bridgeObjectRetain();
      v46 = MEMORY[0x24952E644](v45, v44);
      v83 = v42;
      v48 = v47;
      swift_bridgeObjectRelease();
      sub_245101AB4(v46, v48, &v90);
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 22) = 2080;
      swift_bridgeObjectRetain();
      v49 = MEMORY[0x24BEE0D00];
      v50 = MEMORY[0x24952E644](a3, MEMORY[0x24BEE0D00]);
      v52 = v51;
      swift_bridgeObjectRelease();
      sub_245101AB4(v50, v52, &v90);
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 32) = 2080;
      v53 = swift_bridgeObjectRetain();
      v54 = MEMORY[0x24952E644](v53, v49);
      v56 = v55;
      swift_bridgeObjectRelease();
      sub_245101AB4(v54, v56, &v90);
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      *(_WORD *)(v43 + 42) = 2080;
      v57 = sub_2450D8184(0, &qword_25744B5B8);
      v58 = swift_bridgeObjectRetain();
      v59 = MEMORY[0x24952E644](v58, v57);
      v61 = v60;
      swift_bridgeObjectRelease();
      sub_245101AB4(v59, v61, &v90);
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v41, v83, "Got %ld REMList matching .targetTaskListMembers {targetTaskListMembers: %s, emails: %s, phones: %s, result: .disambiguation(%s)}", (uint8_t *)v43, 0x34u);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](loga, -1, -1);
      MEMORY[0x24952EEE4](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    sub_2450D8184(0, &qword_25744B5A8);
    ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
    sub_2450D8184(0, &qword_25744B5B8);
    v63 = (void *)sub_2451039E8();
    swift_bridgeObjectRelease();
    v35 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithTaskListsToDisambiguate_, v63);

    goto LABEL_38;
  }
  if (v10 == 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      MEMORY[0x24952E92C](0, a1);
    }
    else
    {
      if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_41;
      }
      v11 = *(id *)(a1 + 32);
    }
    sub_2450D8184(0, &qword_25744B5B8);
    v6 = (void *)sub_245103A60();
    if (qword_25744B290 == -1)
    {
LABEL_9:
      v12 = sub_24510391C();
      __swift_project_value_buffer(v12, (uint64_t)qword_25744B3E0);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      v13 = v6;
      v14 = sub_245103910();
      v15 = sub_245103AB4();
      if (os_log_type_enabled(v14, v15))
      {
        log = v14;
        v16 = swift_slowAlloc();
        v82 = (_QWORD *)swift_slowAlloc();
        v87 = swift_slowAlloc();
        v90 = v87;
        *(_DWORD *)v16 = 136315906;
        v17 = sub_2450D8184(0, &qword_25744B328);
        v18 = swift_bridgeObjectRetain();
        v19 = MEMORY[0x24952E644](v18, v17);
        v20 = a6;
        v22 = v21;
        swift_bridgeObjectRelease();
        sub_245101AB4(v19, v22, &v90);
        sub_245103C28();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 12) = 2080;
        swift_bridgeObjectRetain();
        v23 = MEMORY[0x24BEE0D00];
        v24 = MEMORY[0x24952E644](a3, MEMORY[0x24BEE0D00]);
        v26 = v25;
        swift_bridgeObjectRelease();
        v27 = v24;
        a6 = v20;
        sub_245101AB4(v27, v26, &v90);
        sub_245103C28();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 22) = 2080;
        v28 = swift_bridgeObjectRetain();
        v29 = MEMORY[0x24952E644](v28, v23);
        v31 = v30;
        swift_bridgeObjectRelease();
        sub_245101AB4(v29, v31, &v90);
        sub_245103C28();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        *(_WORD *)(v16 + 32) = 2112;
        v32 = v13;
        sub_245103C28();
        *v82 = v13;

        _os_log_impl(&dword_2450D4000, log, v15, "Found exactly 1 list matching .targetTaskListMembers, using that. {targetTaskListMembers: %s, emails: %s, phones: %s, result: .success(%@)}", (uint8_t *)v16, 0x2Au);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v82, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v87, -1, -1);
        MEMORY[0x24952EEE4](v16, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();
      }
      sub_2450D8184(0, &qword_25744B5A8);
      v35 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedTaskList_, v13);

LABEL_38:
      a6(v35);

      return;
    }
LABEL_41:
    swift_once();
    goto LABEL_9;
  }
  v90 = MEMORY[0x24BEE4AF8];
  sub_245103D24();
  if ((v10 & 0x8000000000000000) == 0)
  {
    v88 = a6;
    sub_2450D8184(0, &qword_25744B5B8);
    if ((a1 & 0xC000000000000001) != 0)
    {
      v33 = 0;
      do
      {
        v34 = v33 + 1;
        MEMORY[0x24952E92C]();
        sub_245103A60();
        sub_245103D0C();
        sub_245103D30();
        sub_245103D3C();
        sub_245103D18();
        v33 = v34;
      }
      while (v10 != v34);
    }
    else
    {
      v36 = (void **)(a1 + 32);
      v37 = v10;
      do
      {
        v38 = *v36++;
        v39 = v38;
        sub_245103A60();
        sub_245103D0C();
        sub_245103D30();
        sub_245103D3C();
        sub_245103D18();
        --v37;
      }
      while (v37);
    }
    a6 = v88;
    goto LABEL_21;
  }
  __break(1u);
}

id sub_2450D9C0C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  id v11;
  id *v12;
  id *v13;
  id v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint8_t *v27;
  void *ObjCClassFromMetadata;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(char *, uint64_t, uint64_t, uint64_t);
  void *v36;
  unsigned int (*v37)(char *, uint64_t, uint64_t);
  void *v38;
  void *v39;
  char *v40;
  uint64_t v41;
  id v42;
  id v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  void *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  id v62[2];

  v62[1] = *(id *)MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5A0);
  v1 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = (char *)&v59 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v59 - v4;
  v6 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store);
  v62[0] = 0;
  v7 = objc_msgSend(v6, sel_fetchEligibleDefaultListsWithError_, v62);
  v8 = v62[0];
  if (!v7)
  {
    v22 = v62[0];
    v23 = (id)sub_2451033A0();

    swift_willThrow();
    goto LABEL_38;
  }
  v9 = v7;
  v60 = v6;
  sub_2450D8184(0, (unint64_t *)&qword_25744B5B0);
  v10 = sub_2451039F4();
  v11 = v8;

  if (!(v10 >> 62))
  {
    v12 = *(id **)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v12)
      goto LABEL_4;
LABEL_28:
    swift_bridgeObjectRelease();
    v12 = (id *)MEMORY[0x24BEE4AF8];
    if (!(MEMORY[0x24BEE4AF8] >> 62))
      goto LABEL_11;
    goto LABEL_29;
  }
  swift_bridgeObjectRetain();
  v12 = (id *)sub_245103DE4();
  swift_bridgeObjectRelease();
  if (!v12)
    goto LABEL_28;
LABEL_4:
  v62[0] = (id)MEMORY[0x24BEE4AF8];
  sub_245103D24();
  if (((unint64_t)v12 & 0x8000000000000000) == 0)
  {
    sub_2450D8184(0, &qword_25744B5B8);
    v13 = 0;
    do
    {
      if ((v10 & 0xC000000000000001) != 0)
        MEMORY[0x24952E92C](v13, v10);
      else
        v14 = *(id *)(v10 + 8 * (_QWORD)v13 + 32);
      v13 = (id *)((char *)v13 + 1);
      sub_245103A60();
      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
    }
    while (v12 != v13);
    v12 = (id *)v62[0];
    swift_bridgeObjectRelease();
    if (!((unint64_t)v12 >> 62))
    {
LABEL_11:
      v15 = *(void **)(((unint64_t)v12 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v15)
        goto LABEL_12;
LABEL_31:
      swift_bridgeObjectRelease();
      sub_2451035EC();
      v32 = (void *)sub_2451039AC();
      swift_bridgeObjectRelease();
      v33 = sub_245103388();
      v34 = *(_QWORD *)(v33 - 8);
      v35 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v34 + 56);
      v35(v5, 1, 1, v33);
      v35(v3, 1, 1, v33);
      sub_2450D8184(0, &qword_25744B5C0);
      v36 = (void *)sub_2451039E8();
      v37 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
      v38 = 0;
      if (v37(v5, 1, v33) != 1)
      {
        v38 = (void *)sub_245103334();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v33);
      }
      if (v37(v3, 1, v33) == 1)
      {
        v39 = 0;
      }
      else
      {
        v39 = (void *)sub_245103334();
        (*(void (**)(char *, uint64_t))(v34 + 8))(v3, v33);
      }
      v12 = (id *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA238]), sel_initWithTitle_tasks_groupName_createdDateComponents_modifiedDateComponents_identifier_, v32, v36, 0, v38, v39, 0);

      v62[0] = 0;
      v40 = (char *)objc_msgSend(v60, sel_fetchDefaultAccountWithError_, v62);
      v3 = v40;
      if (!v62[0])
      {
        if (!v40)
        {
          if (qword_25744B290 != -1)
            swift_once();
          v55 = sub_24510391C();
          __swift_project_value_buffer(v55, (uint64_t)qword_25744B3E0);
          v56 = sub_245103910();
          v57 = sub_245103A9C();
          if (os_log_type_enabled(v56, v57))
          {
            v58 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v58 = 0;
            _os_log_impl(&dword_2450D4000, v56, v57, "No lists found in fetchEligibleDefaultLists and no default account available. Responding with .success so that we can fail the user in handle() with .failureRequiringAppLaunch. {result: .success}", v58, 2u);
            MEMORY[0x24952EEE4](v58, -1, -1);
          }

          sub_2450D8184(0, &qword_25744B5A8);
          v30 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedTaskList_, v12);

          return v30;
        }
        if (qword_25744B290 == -1)
          goto LABEL_47;
        goto LABEL_60;
      }
      v23 = v62[0];

      swift_willThrow();
LABEL_38:
      if (qword_25744B290 != -1)
        swift_once();
      v41 = sub_24510391C();
      __swift_project_value_buffer(v41, (uint64_t)qword_25744B3E0);
      v42 = v23;
      v43 = v23;
      v44 = sub_245103910();
      v45 = sub_245103A9C();
      if (os_log_type_enabled(v44, v45))
      {
        v46 = (uint8_t *)swift_slowAlloc();
        v47 = (void *)swift_slowAlloc();
        v62[0] = v47;
        *(_DWORD *)v46 = 136315138;
        swift_getErrorValue();
        v48 = sub_245103E50();
        v61 = sub_245101AB4(v48, v49, (uint64_t *)v62);
        sub_245103C28();
        swift_bridgeObjectRelease();

        _os_log_impl(&dword_2450D4000, v44, v45, "Error trying to retrieve eligible default lists {error: %s}", v46, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v47, -1, -1);
        MEMORY[0x24952EEE4](v46, -1, -1);
      }
      else
      {

      }
      sub_2450D8184(0, &qword_25744B5A8);
      v21 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);

      return v21;
    }
LABEL_29:
    swift_bridgeObjectRetain();
    v31 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v31)
    {
      swift_bridgeObjectRetain();
      v15 = (void *)sub_245103DE4();
      swift_bridgeObjectRelease();
LABEL_12:
      if (v15 != (void *)1)
      {
        if (qword_25744B290 != -1)
          swift_once();
        v24 = sub_24510391C();
        __swift_project_value_buffer(v24, (uint64_t)qword_25744B3E0);
        swift_bridgeObjectRetain();
        v25 = sub_245103910();
        v26 = sub_245103AB4();
        if (os_log_type_enabled(v25, v26))
        {
          v27 = (uint8_t *)swift_slowAlloc();
          *(_DWORD *)v27 = 134217984;
          v62[0] = v15;
          sub_245103C28();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2450D4000, v25, v26, "Disambiguating with some lists {count: %ld}", v27, 0xCu);
          MEMORY[0x24952EEE4](v27, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease();
        }
        sub_2450D8184(0, &qword_25744B5A8);
        ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
        sub_2450D8184(0, &qword_25744B5B8);
        v29 = (void *)sub_2451039E8();
        swift_bridgeObjectRelease();
        v30 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithTaskListsToDisambiguate_, v29);

        return v30;
      }
      if (qword_25744B290 == -1)
        goto LABEL_14;
      goto LABEL_57;
    }
    goto LABEL_31;
  }
  __break(1u);
LABEL_57:
  swift_once();
LABEL_14:
  v16 = sub_24510391C();
  __swift_project_value_buffer(v16, (uint64_t)qword_25744B3E0);
  v17 = sub_245103910();
  v18 = sub_245103AB4();
  if (os_log_type_enabled(v17, v18))
  {
    v3 = (char *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_2450D4000, v17, v18, "Got exactly 1 list from fetchEligibleDefaultLists, using that. {result: .confirmationRequired}", (uint8_t *)v3, 2u);
    MEMORY[0x24952EEE4](v3, -1, -1);
  }

  if (((unint64_t)v12 & 0xC000000000000001) != 0)
  {
    v19 = (id)MEMORY[0x24952E92C](0, v12);
    goto LABEL_19;
  }
  if (*(_QWORD *)(((unint64_t)v12 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v19 = v12[4];
LABEL_19:
    v20 = v19;
    swift_bridgeObjectRelease();
    sub_2450D8184(0, &qword_25744B5A8);
    v21 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_confirmationRequiredWithTaskListToConfirm_, v20);

    return v21;
  }
  __break(1u);
LABEL_60:
  swift_once();
LABEL_47:
  v51 = sub_24510391C();
  __swift_project_value_buffer(v51, (uint64_t)qword_25744B3E0);
  v52 = sub_245103910();
  v53 = sub_245103AB4();
  if (os_log_type_enabled(v52, v53))
  {
    v54 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v54 = 0;
    _os_log_impl(&dword_2450D4000, v52, v53, "No lists found in fetchEligibleDefaultLists(), prompt for creation {result: .confirmationRequired(.listShouldBeCreated)}", v54, 2u);
    MEMORY[0x24952EEE4](v54, -1, -1);
  }

  v30 = objc_msgSend((id)objc_opt_self(), sel_confirmationRequiredWithTaskListToConfirm_forReason_, v12, 1);
  return v30;
}

void sub_2450DA6B8(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (qword_25744B290 != -1)
    swift_once();
  v6 = sub_24510391C();
  __swift_project_value_buffer(v6, (uint64_t)qword_25744B3E0);
  v7 = a1;
  v8 = sub_245103910();
  v9 = sub_245103AB4();
  if (os_log_type_enabled(v8, v9))
  {
    v23 = a2;
    v24 = a3;
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v25 = v11;
    *(_DWORD *)v10 = 136315138;
    v12 = objc_msgSend(v7, sel_taskTitles);
    if (v12)
    {
      v13 = v12;
      sub_2450D8184(0, (unint64_t *)&unk_25744B580);
      sub_2451039F4();

    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B578);
    v15 = sub_245103C1C();
    v17 = v16;
    swift_bridgeObjectRelease();
    sub_245101AB4(v15, v17, &v25);
    sub_245103C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v8, v9, "SiriKit asked for resolving task titles {taskTitles: %s}", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v11, -1, -1);
    MEMORY[0x24952EEE4](v10, -1, -1);

    a2 = v23;
    a3 = v24;
  }
  else
  {

  }
  MEMORY[0x24BDAC7A8](v14);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744B560);
  swift_allocObject();
  sub_2451038EC();
  v18 = (void *)sub_245103898();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744B568);
  sub_2451038C8();
  swift_release();

  *(_QWORD *)(swift_allocObject() + 16) = v7;
  v19 = v7;
  v20 = (void *)sub_245103898();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744B570);
  sub_2451038C8();
  swift_release();
  swift_release();

  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = a2;
  *(_QWORD *)(v21 + 24) = a3;
  swift_retain();
  v22 = (void *)sub_245103898();
  sub_2451038C8();
  swift_release();
  swift_release();
  swift_release();

}

uint64_t sub_2450DAA44@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  _QWORD v14[2];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744B598);
  v5 = MEMORY[0x24BDAC7A8](v4);
  v7 = (_QWORD *)((char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)v14 - v8;
  if (*a1)
  {
    sub_245103ACC();
    v10 = sub_245103AC0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 0, 1, v10);
  }
  else
  {
    v10 = sub_245103AC0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  }
  sub_2450E3340((uint64_t)v9, (uint64_t)v7, &qword_25744B598);
  sub_245103AC0();
  if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v7, 1, v10) == 1)
  {
    result = sub_2450E35D8((uint64_t)v7, &qword_25744B598);
    v12 = 0;
    v13 = 0;
  }
  else
  {
    v12 = *v7;
    v13 = v7[1];
    swift_bridgeObjectRetain();
    result = sub_2450E369C((uint64_t)v7, (uint64_t (*)(_QWORD))MEMORY[0x24BE7E988]);
  }
  *a2 = v12;
  a2[1] = v13;
  return result;
}

uint64_t sub_2450DABA4@<X0>(id a1@<X1>, uint64_t *a2@<X0>, uint64_t *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  void *v31;
  _QWORD *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t result;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  unint64_t v44;
  uint64_t v45;

  v4 = *a2;
  v5 = a2[1];
  v6 = objc_msgSend(a1, sel_taskTitles);
  v7 = (uint64_t *)MEMORY[0x24BEE4AF8];
  v43 = a3;
  if (!v6)
  {
    a3 = (uint64_t *)MEMORY[0x24BEE4AF8];
    if (!v5)
      goto LABEL_22;
    goto LABEL_15;
  }
  v8 = v6;
  sub_2450D8184(0, (unint64_t *)&unk_25744B580);
  v9 = sub_2451039F4();

  if (!(v9 >> 62))
  {
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_4;
LABEL_21:
    swift_bridgeObjectRelease();
    a3 = (uint64_t *)MEMORY[0x24BEE4AF8];
    if (!v5)
      goto LABEL_22;
    goto LABEL_15;
  }
  swift_bridgeObjectRetain();
  v10 = sub_245103DE4();
  swift_bridgeObjectRelease();
  if (!v10)
    goto LABEL_21;
LABEL_4:
  sub_2450FDD2C(0, v10 & ~(v10 >> 63), 0);
  if (v10 < 0)
  {
    __break(1u);
    goto LABEL_39;
  }
  v41 = v5;
  v42 = v4;
  v11 = 0;
  a3 = v7;
  v44 = v9 & 0xC000000000000001;
  v12 = v9;
  v13 = v10;
  do
  {
    if (v44)
      v14 = (id)MEMORY[0x24952E92C](v11, v9);
    else
      v14 = *(id *)(v9 + 8 * v11 + 32);
    v15 = v14;
    v16 = objc_msgSend(v14, sel_spokenPhrase);
    v17 = sub_245103988();
    v19 = v18;

    v21 = a3[2];
    v20 = a3[3];
    if (v21 >= v20 >> 1)
      sub_2450FDD2C(v20 > 1, v21 + 1, 1);
    ++v11;
    a3[2] = v21 + 1;
    v22 = &a3[2 * v21];
    v22[4] = v17;
    v22[5] = v19;
    v9 = v12;
  }
  while (v13 != v11);
  swift_bridgeObjectRelease();
  v7 = (uint64_t *)MEMORY[0x24BEE4AF8];
  v5 = v41;
  v4 = v42;
  if (v41)
  {
LABEL_15:
    if (a3[2])
    {
LABEL_23:
      if (qword_25744B290 != -1)
        swift_once();
      v26 = sub_24510391C();
      __swift_project_value_buffer(v26, (uint64_t)qword_25744B3E0);
      v27 = sub_245103910();
      v28 = sub_245103AB4();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_2450D4000, v27, v28, "Resolved taskTitles {result: .success}", v29, 2u);
        MEMORY[0x24952EEE4](v29, -1, -1);
      }

      v30 = a3[2];
      if (v30)
      {
        v45 = (uint64_t)v7;
        swift_bridgeObjectRetain();
        sub_245103D24();
        v31 = (void *)objc_opt_self();
        v32 = a3 + 5;
        do
        {
          swift_bridgeObjectRetain();
          v33 = (void *)sub_2451039AC();
          v34 = objc_msgSend(v31, sel_successWithResolvedString_, v33);
          swift_bridgeObjectRelease();

          sub_245103D0C();
          sub_245103D30();
          sub_245103D3C();
          sub_245103D18();
          v32 += 2;
          --v30;
        }
        while (v30);
        v35 = v45;
        result = swift_bridgeObjectRelease_n();
      }
      else
      {
        result = swift_bridgeObjectRelease();
        v35 = MEMORY[0x24BEE4AF8];
      }
      goto LABEL_37;
    }
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) != 0)
    {
LABEL_17:
      v24 = a3[2];
      v23 = a3[3];
      if (v24 >= v23 >> 1)
        a3 = sub_245101788((_QWORD *)(v23 > 1), v24 + 1, 1, a3);
      a3[2] = v24 + 1;
      v25 = &a3[2 * v24];
      v25[4] = v4;
      v25[5] = v5;
      goto LABEL_23;
    }
LABEL_39:
    a3 = sub_245101788(0, 1, 1, a3);
    goto LABEL_17;
  }
LABEL_22:
  if (a3[2])
    goto LABEL_23;
  swift_bridgeObjectRelease();
  if (qword_25744B290 != -1)
    swift_once();
  v37 = sub_24510391C();
  __swift_project_value_buffer(v37, (uint64_t)qword_25744B3E0);
  v38 = sub_245103910();
  v39 = sub_245103AB4();
  if (os_log_type_enabled(v38, v39))
  {
    v40 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v40 = 0;
    _os_log_impl(&dword_2450D4000, v38, v39, "userTitles has 0 elements {result: .needsValue}", v40, 2u);
    MEMORY[0x24952EEE4](v40, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
  v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_245104540;
  sub_2450D8184(0, &qword_25744B590);
  *(_QWORD *)(v35 + 32) = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
  result = sub_245103A0C();
LABEL_37:
  *v43 = v35;
  return result;
}

void sub_2450DB174(uint64_t a1, uint64_t a2)
{
  id v3;

  sub_2450D8184(0, &qword_25744B590);
  v3 = (id)sub_2451039E8();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

id sub_2450DB1F0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v2 = v1;
  v3 = objc_msgSend(a1, sel_targetTaskList);
  if (!v3 || (v4 = v3, v5 = (void *)sub_245103A3C(), v4, !v5))
  {
    v6 = sub_2450DE10C(*(void **)(v2 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store));
    if (!v6)
      return 0;
LABEL_6:
    v7 = objc_msgSend(v6, sel_capabilities);

    return v7;
  }
  v6 = objc_msgSend(v5, sel_account);

  if (v6)
    goto LABEL_6;
  return 0;
}

void sub_2450DB2B4(_QWORD *a1, void (*a2)(void))
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  id v12;

  if (*a1)
  {
    if (qword_25744B290 != -1)
      swift_once();
    v3 = sub_24510391C();
    __swift_project_value_buffer(v3, (uint64_t)qword_25744B3E0);
    v4 = sub_245103910();
    v5 = sub_245103AB4();
    if (os_log_type_enabled(v4, v5))
    {
      v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2450D4000, v4, v5, "Got userActivity {result: .success(.currentActivity)", v6, 2u);
      MEMORY[0x24952EEE4](v6, -1, -1);
    }

    v7 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedTaskReference_, 1);
  }
  else
  {
    if (qword_25744B290 != -1)
      swift_once();
    v8 = sub_24510391C();
    __swift_project_value_buffer(v8, (uint64_t)qword_25744B3E0);
    v9 = sub_245103910();
    v10 = sub_245103AB4();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2450D4000, v9, v10, "Got nil userActivity {result: .notRequired}", v11, 2u);
      MEMORY[0x24952EEE4](v11, -1, -1);
    }

    sub_2450D8184(0, &qword_25744B658);
    v7 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
  }
  v12 = v7;
  a2();

}

void sub_2450DB4A0(void *a1, void (*a2)(id))
{
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;

  if (qword_25744B290 != -1)
    swift_once();
  v4 = sub_24510391C();
  __swift_project_value_buffer(v4, (uint64_t)qword_25744B3E0);
  v5 = a1;
  v6 = a1;
  v7 = sub_245103910();
  v8 = sub_245103A9C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_getErrorValue();
    v11 = sub_245103E50();
    sub_245101AB4(v11, v12, &v14);
    sub_245103C28();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2450D4000, v7, v8, "Got error userActivity. {result: .notRequired, error: %s}", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v10, -1, -1);
    MEMORY[0x24952EEE4](v9, -1, -1);
  }
  else
  {

  }
  sub_2450D8184(0, &qword_25744B658);
  v13 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
  a2(v13);

}

void sub_2450DB6C0(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, void *))
{
  void *v8;
  id v9;
  id v10;

  v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  v9 = a3;
  v10 = a1;
  a5(v9, v8);
  _Block_release(v8);
  _Block_release(v8);

}

void sub_2450DB744(void **a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id v5;

  v2 = *a1;
  if (*a1)
  {
    swift_beginAccess();
    v4 = *(void **)(a2 + 16);
    *(_QWORD *)(a2 + 16) = v2;
    v5 = v2;

  }
}

uint64_t sub_2450DB7A4(void **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t result;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[12];

  v7 = sub_245103AC0();
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5F0);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v26 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = *a1;
  result = swift_projectBox();
  if (v13)
  {
    v15 = result;
    v26[11] = a4 + 16;
    v16 = objc_allocWithZone(MEMORY[0x24BE7D2B8]);
    v17 = v13;
    v18 = objc_msgSend(v16, sel_initWithUserActivity_, v17);
    swift_beginAccess();
    v19 = *(void **)(a2 + 16);
    *(_QWORD *)(a2 + 16) = v18;

    v20 = objc_msgSend(v17, sel_webpageURL);
    if (v20)
    {
      v21 = v20;
      sub_2451033B8();

      v22 = sub_2451033C4();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v12, 0, 1, v22);
    }
    else
    {
      v23 = sub_2451033C4();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v12, 1, 1, v23);
    }
    swift_beginAccess();
    sub_2450E36D8((uint64_t)v12, v15);
    sub_245103ACC();

    v25 = *((_QWORD *)v9 + 2);
    v24 = *((_QWORD *)v9 + 3);
    swift_bridgeObjectRetain();
    sub_2450E369C((uint64_t)v9, (uint64_t (*)(_QWORD))MEMORY[0x24BE7E988]);
    swift_beginAccess();
    *(_QWORD *)(a4 + 16) = v25;
    *(_QWORD *)(a4 + 24) = v24;
    return swift_bridgeObjectRelease();
  }
  return result;
}

void sub_2450DB9B0(uint64_t a1, uint64_t a2, void *a3, unint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void (*a16)(void))
{
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  unint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  void *v35;
  uint64_t v36;
  unint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  NSObject *v56;
  os_log_type_t v57;
  uint8_t *v58;
  _QWORD *v59;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  char v67[16];
  id v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80[3];

  v80[1] = *(id *)MEMORY[0x24BDAC8D0];
  v62 = swift_projectBox();
  v18 = swift_projectBox();
  v19 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7D250]), sel_initWithStore_, *(_QWORD *)(a2 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store));
  sub_245103508();
  a3;
  v20 = v19;
  sub_245103544();
  v68 = v80[0];
  v69 = 0;
  v70 = a5;
  v71 = a6;
  v72 = v62;
  v73 = a8;
  v74 = a9 + 16;
  v75 = a10 + 16;
  v76 = v18;
  v77 = a12 + 16;
  v78 = a13 + 16;
  v79 = a14;
  v21 = v20;
  v22 = sub_2450FE6FC((void (*)(uint64_t *__return_ptr, id *))sub_2450E3510, (uint64_t)v67, a4);
  v80[0] = 0;
  if (objc_msgSend(v21, sel_saveSynchronouslyWithError_, v80))
  {
    v23 = v80[0];
    sub_245103520();
    swift_retain();
    sub_245103514();
    swift_release();
    if (v22 >> 62)
    {
      swift_bridgeObjectRetain();
      v24 = sub_245103DE4();
      swift_bridgeObjectRelease();
    }
    else
    {
      v24 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    v61 = v21;
    if (v24)
    {
      v80[0] = (id)MEMORY[0x24BEE4AF8];
      sub_245103D24();
      if (v24 < 0)
        __break(1u);
      sub_2450D8184(0, &qword_25744B5C0);
      v25 = 0;
      do
      {
        if ((v22 & 0xC000000000000001) != 0)
          MEMORY[0x24952E92C](v25, v22);
        else
          v26 = *(id *)(v22 + 8 * v25 + 32);
        ++v25;
        sub_245103B80();
        sub_245103D0C();
        sub_245103D30();
        sub_245103D3C();
        sub_245103D18();
      }
      while (v24 != v25);
    }
    swift_bridgeObjectRelease();
    v39 = a15;
    if (qword_25744B290 != -1)
      swift_once();
    v40 = sub_24510391C();
    __swift_project_value_buffer(v40, (uint64_t)qword_25744B3E0);
    swift_bridgeObjectRetain_n();
    v41 = sub_245103910();
    v42 = sub_245103AB4();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      v44 = (void *)swift_slowAlloc();
      v80[0] = v44;
      *(_DWORD *)v43 = 136315138;
      v45 = sub_2450D8184(0, &qword_25744B5C0);
      v46 = swift_bridgeObjectRetain();
      v47 = MEMORY[0x24952E644](v46, v45);
      v49 = v48;
      swift_bridgeObjectRelease();
      v50 = v47;
      v39 = a15;
      sub_245101AB4(v50, v49, (uint64_t *)v80);
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v41, v42, "insertedTasks: %s", v43, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v44, -1, -1);
      MEMORY[0x24952EEE4](v43, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v51 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9BB8]), sel_initWithCode_userActivity_, 3, 0);
    objc_msgSend(v51, sel_setModifiedTaskList_, v39);
    sub_2450D8184(0, &qword_25744B5C0);
    v52 = (void *)sub_2451039E8();
    swift_bridgeObjectRelease();
    objc_msgSend(v51, sel_setAddedTasks_, v52);

    v80[0] = a14;
    v53 = (void *)sub_245103BBC();
    sub_2450D8184(0, (unint64_t *)&unk_25744B5E0);
    v54 = sub_24510367C();

    objc_msgSend(v51, sel_setWarnings_, v54);
    v55 = v51;
    v56 = sub_245103910();
    v57 = sub_245103AB4();
    if (os_log_type_enabled(v56, v57))
    {
      v58 = (uint8_t *)swift_slowAlloc();
      v59 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v58 = 138412290;
      v80[0] = v55;
      v60 = v55;
      sub_245103C28();
      *v59 = v55;

      _os_log_impl(&dword_2450D4000, v56, v57, "successfully handled intent {result: %@}", v58, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v59, -1, -1);
      MEMORY[0x24952EEE4](v58, -1, -1);
    }
    else
    {

      v56 = v55;
    }

    ((void (*))a16)(v55);
    swift_release();

  }
  else
  {
    v27 = v80[0];
    swift_bridgeObjectRelease();
    v28 = (void *)sub_2451033A0();

    swift_willThrow();
    if (qword_25744B290 != -1)
      swift_once();
    v29 = sub_24510391C();
    __swift_project_value_buffer(v29, (uint64_t)qword_25744B3E0);
    v30 = v28;
    v31 = v28;
    v32 = sub_245103910();
    v33 = sub_245103A9C();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      v35 = (void *)swift_slowAlloc();
      v80[0] = v35;
      *(_DWORD *)v34 = 136446210;
      swift_getErrorValue();
      v36 = sub_245103E5C();
      sub_245101AB4(v36, v37, (uint64_t *)v80);
      sub_245103C28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2450D4000, v32, v33, "Error saving saveRequest {error: %{public}s}", v34, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v35, -1, -1);
      MEMORY[0x24952EEE4](v34, -1, -1);
    }
    else
    {

    }
    v38 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9BB8]), sel_initWithCode_userActivity_, 4, 0);
    a16();

    swift_release();
  }
}

void sub_2450DC248(void **a1@<X0>, void *a2@<X2>, void *a3@<X3>, _QWORD *a4@<X4>, uint64_t a5@<X5>, uint64_t a6@<X6>, void **a7@<X7>, _QWORD *a8@<X8>, void **a9, _QWORD *a10, void **a11, uint64_t a12, id a13)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
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
  void *v41;
  void *v42;
  id v43;
  id v44;
  NSObject *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  __objc2_prot_list **p_base_prots;
  id v51;
  uint64_t v52;
  id v53;
  NSObject *v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  _QWORD *v58;
  NSObject *v59;
  uint8_t *v60;
  NSObject *v61;
  void **v62;
  __objc2_prot_list *v63;
  _QWORD *v64;
  NSObject *v65;
  NSObject *v66;
  os_log_type_t v67;
  uint8_t *v68;
  _QWORD *v69;
  NSObject *v70;
  _QWORD *v71;
  uint8_t *v72;
  NSObject *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  _QWORD *v77;
  char *v78;
  void *v79;
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  uint8_t *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  int v94;
  uint64_t v95;
  uint64_t v96;
  NSObject *v97;
  os_log_type_t v98;
  uint8_t *v99;
  uint64_t v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void **v106;
  void *v107;
  __objc2_prot_list *v108;
  id v109;
  NSObject *v110;
  NSObject *v111;
  os_log_type_t v112;
  uint8_t *v113;
  NSObject *v114;
  _QWORD *v115;
  NSObject *v116;
  uint64_t v117;
  void **v118;
  void *v119;
  __objc2_prot_list *v120;
  id v121;
  NSObject *v122;
  NSObject *v123;
  os_log_type_t v124;
  uint8_t *v125;
  NSObject *v126;
  _QWORD *v127;
  uint8_t *v128;
  NSObject *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void (*v133)(char *, char *, uint64_t);
  uint64_t v134;
  char *v135;
  NSObject *v136;
  os_log_type_t v137;
  uint8_t *v138;
  uint64_t v139;
  uint64_t v140;
  unint64_t v141;
  void (*v142)(char *, uint64_t);
  uint64_t v143;
  uint64_t v144;
  char *v145;
  __objc2_prot_list *v146;
  NSObject *v147;
  os_log_type_t v148;
  uint8_t *v149;
  id v150;
  void *v151;
  id v152;
  id *v153;
  __objc2_prot_list *v154;
  id v155;
  NSObject *v156;
  os_log_type_t v157;
  uint8_t *v158;
  char *v159;
  id v160;
  id v161;
  unsigned int v162;
  id v163;
  id v164;
  NSObject *v165;
  os_log_type_t v166;
  uint8_t *v167;
  _QWORD *v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  char *v174;
  uint64_t v175;
  uint64_t v176;
  char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  char *v181;
  char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void **v190;
  char *v191;
  uint64_t v192;
  id v193;
  _QWORD *v194;
  char *v195;
  uint64_t v196;
  id v197;
  _QWORD *v198;
  void **v199;
  _QWORD *v200;
  uint64_t v201;
  NSObject *v202;
  char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206[4];
  uint64_t v207;
  uint64_t v208;
  NSObject *v209;
  id v210;

  v190 = a7;
  v179 = a6;
  v188 = a5;
  v198 = a4;
  v197 = a3;
  v194 = a8;
  v15 = sub_24510391C();
  v173 = *(_QWORD *)(v15 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v174 = (char *)&v173 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v184 = sub_245103430();
  v183 = *(_QWORD *)(v184 - 8);
  MEMORY[0x24BDAC7A8](v184);
  v182 = (char *)&v173 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5F0);
  MEMORY[0x24BDAC7A8](v18);
  v181 = (char *)&v173 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v173 - v21;
  v192 = sub_2451033C4();
  v196 = *(_QWORD *)(v192 - 8);
  MEMORY[0x24BDAC7A8](v192);
  v24 = (char *)&v173 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v25);
  v191 = (char *)&v173 - v26;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5C8);
  MEMORY[0x24BDAC7A8](v27);
  v178 = (uint64_t)&v173 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v186 = sub_245103628();
  v185 = *(_QWORD *)(v186 - 8);
  MEMORY[0x24BDAC7A8](v186);
  v175 = (uint64_t)&v173 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v176 = (uint64_t)&v173 - v31;
  MEMORY[0x24BDAC7A8](v32);
  v180 = (uint64_t)&v173 - v33;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5A0);
  MEMORY[0x24BDAC7A8](v34);
  v177 = (char *)&v173 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v36);
  v187 = (uint64_t)&v173 - v37;
  v200 = (_QWORD *)sub_245103388();
  v189 = *(v200 - 1);
  MEMORY[0x24BDAC7A8](v200);
  v199 = (void **)((char *)&v173 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v39);
  v195 = (char *)&v173 - v40;
  v41 = *a1;
  v42 = (void *)sub_2451034FC();
  sub_2451035E0();
  sub_2450E3554(&qword_25744B628, (uint64_t (*)(uint64_t))MEMORY[0x24BE7E610], MEMORY[0x24BE7E608]);
  v43 = v42;
  v44 = a2;
  v193 = v43;
  sub_2451035F8();
  v45 = v209;
  v46 = objc_msgSend(v41, sel_spokenPhrase);
  sub_245103988();

  v47 = objc_allocWithZone(MEMORY[0x24BDD1458]);
  v48 = (void *)sub_245103964();
  swift_bridgeObjectRelease();
  v49 = objc_msgSend(v47, sel_initWithString_, v48);

  sub_2451035B0();
  p_base_prots = &TTRIntentHandler.base_prots;
  v204 = v15;
  v51 = v197;
  v202 = v45;
  v203 = v24;
  v201 = (uint64_t)v22;
  if (v197)
  {
    v52 = qword_25744B290;
    v53 = v197;
    if (v52 != -1)
      swift_once();
    __swift_project_value_buffer(v204, (uint64_t)qword_25744B3E0);
    v54 = v53;
    v55 = sub_245103910();
    v56 = sub_245103AB4();
    if (os_log_type_enabled(v55, v56))
    {
      v57 = (uint8_t *)swift_slowAlloc();
      v58 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v57 = 138412290;
      v209 = v54;
      v59 = v54;
      p_base_prots = (__objc2_prot_list **)(&TTRIntentHandler + 40);
      v24 = v203;
      sub_245103C28();
      *v58 = v197;

      v22 = (char *)v201;
      _os_log_impl(&dword_2450D4000, v55, v56, "setting locationTrigger {locationTrigger: %@}", v57, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v58, -1, -1);
      v60 = v57;
      v51 = v197;
      MEMORY[0x24952EEE4](v60, -1, -1);
    }
    else
    {

      v55 = v54;
    }

    v61 = v54;
    MEMORY[0x24952E1B8](v51);

  }
  v62 = v199;
  if (v198)
  {
    v63 = p_base_prots[82];
    v64 = v198;
    if (v63 != (__objc2_prot_list *)-1)
      swift_once();
    __swift_project_value_buffer(v204, (uint64_t)qword_25744B3E0);
    v65 = v64;
    v66 = sub_245103910();
    v67 = sub_245103AB4();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = (uint8_t *)swift_slowAlloc();
      v69 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v68 = 138412290;
      v209 = v65;
      v70 = v65;
      v22 = (char *)v201;
      v24 = v203;
      sub_245103C28();
      v71 = v198;
      *v69 = v198;

      _os_log_impl(&dword_2450D4000, v66, v67, "setting vehicleTrigger {vehicleTrigger: %@}", v68, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v69, -1, -1);
      v72 = v68;
      p_base_prots = (__objc2_prot_list **)(&TTRIntentHandler + 40);
      MEMORY[0x24952EEE4](v72, -1, -1);
      v62 = v199;
    }
    else
    {

      v66 = v65;
      v62 = v199;
      v71 = v198;
    }

    v73 = v65;
    MEMORY[0x24952E1AC](v71);

  }
  v199 = a9;
  v74 = v188;
  swift_beginAccess();
  v75 = v187;
  sub_2450E3594(v74, v187, &qword_25744B5A0);
  v76 = v189;
  v77 = v200;
  if ((*(unsigned int (**)(uint64_t, uint64_t, _QWORD *))(v189 + 48))(v75, 1, v200) == 1)
  {
    sub_2450E35D8(v75, &qword_25744B5A0);
  }
  else
  {
    v78 = v195;
    (*(void (**)(char *, uint64_t, _QWORD *))(v76 + 32))(v195, v75, v77);
    if (p_base_prots[82] != (__objc2_prot_list *)-1)
      swift_once();
    v79 = (void *)__swift_project_value_buffer(v204, (uint64_t)qword_25744B3E0);
    v198 = *(_QWORD **)(v76 + 16);
    ((void (*)(void **, char *, _QWORD *))v198)(v62, v78, v77);
    v80 = sub_245103910();
    v81 = sub_245103AB4();
    if (os_log_type_enabled(v80, v81))
    {
      v82 = (uint8_t *)swift_slowAlloc();
      v83 = swift_slowAlloc();
      v197 = v79;
      v84 = v83;
      v208 = v83;
      *(_DWORD *)v82 = 136315138;
      sub_2450E3554(&qword_25744B638, (uint64_t (*)(uint64_t))MEMORY[0x24BDCBDE0], MEMORY[0x24BDCBE28]);
      v85 = sub_245103E14();
      v207 = sub_245101AB4(v85, v86, &v208);
      v77 = v200;
      sub_245103C28();
      swift_bridgeObjectRelease();
      v87 = *(_QWORD **)(v76 + 8);
      ((void (*)(void **, _QWORD *))v87)(v62, v77);
      _os_log_impl(&dword_2450D4000, v80, v81, "setting dueDateComponents {dueDateComponents: %s}", v82, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v84, -1, -1);
      v88 = v82;
      p_base_prots = (__objc2_prot_list **)(&TTRIntentHandler + 40);
      MEMORY[0x24952EEE4](v88, -1, -1);
    }
    else
    {
      v87 = *(_QWORD **)(v76 + 8);
      ((void (*)(void **, _QWORD *))v87)(v62, v77);
    }

    v89 = v186;
    v90 = v76;
    v91 = (uint64_t)v177;
    v92 = v195;
    ((void (*)(char *, char *, _QWORD *))v198)(v177, v195, v77);
    (*(void (**)(uint64_t, _QWORD, uint64_t, _QWORD *))(v90 + 56))(v91, 0, 1, v77);
    sub_24510358C();
    sub_2450E35D8(v91, &qword_25744B5A0);
    v93 = v178;
    sub_2450E3594(v179, v178, &qword_25744B5C8);
    v94 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v185 + 48))(v93, 1, v89);
    v22 = (char *)v201;
    if (v94 == 1)
    {
      ((void (*)(char *, _QWORD *))v87)(v92, v77);
      sub_2450E35D8(v93, &qword_25744B5C8);
      v24 = v203;
    }
    else
    {
      v198 = v87;
      v95 = v180;
      sub_2450E3614(v93, v180);
      v96 = v176;
      sub_2450E3658(v95, v176);
      v97 = sub_245103910();
      v98 = sub_245103AB4();
      if (os_log_type_enabled(v97, v98))
      {
        v99 = (uint8_t *)swift_slowAlloc();
        v100 = swift_slowAlloc();
        v208 = v100;
        *(_DWORD *)v99 = 136315138;
        sub_2450E3658(v96, v175);
        v101 = sub_245103994();
        v207 = sub_245101AB4(v101, v102, &v208);
        v22 = (char *)v201;
        sub_245103C28();
        p_base_prots = (__objc2_prot_list **)(&TTRIntentHandler + 40);
        swift_bridgeObjectRelease();
        sub_2450E369C(v96, (uint64_t (*)(_QWORD))MEMORY[0x24BE7E6F8]);
        _os_log_impl(&dword_2450D4000, v97, v98, "setting recurrenceRule {recurrenceRule: %s}", v99, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v100, -1, -1);
        MEMORY[0x24952EEE4](v99, -1, -1);
      }
      else
      {
        sub_2450E369C(v96, (uint64_t (*)(_QWORD))MEMORY[0x24BE7E6F8]);
      }

      v24 = v203;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B630);
      v103 = (*(unsigned __int8 *)(v185 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v185 + 80);
      v104 = swift_allocObject();
      *(_OWORD *)(v104 + 16) = xmmword_245104860;
      v105 = v180;
      sub_2450E3658(v180, v104 + v103);
      sub_245103580();
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      sub_2450E369C(v105, (uint64_t (*)(_QWORD))MEMORY[0x24BE7E6F8]);
      ((void (*)(char *, _QWORD *))v198)(v195, v200);
    }
  }
  v200 = a10;
  v106 = v190;
  swift_beginAccess();
  v107 = *v106;
  if (v107)
  {
    v108 = p_base_prots[82];
    v109 = v107;
    if (v108 != (__objc2_prot_list *)-1)
      swift_once();
    __swift_project_value_buffer(v204, (uint64_t)qword_25744B3E0);
    v110 = v109;
    v111 = sub_245103910();
    v112 = sub_245103AB4();
    if (os_log_type_enabled(v111, v112))
    {
      v113 = (uint8_t *)swift_slowAlloc();
      v198 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v113 = 138412290;
      v207 = (uint64_t)v110;
      v114 = v110;
      sub_245103C28();
      v115 = v198;
      *v198 = v107;

      p_base_prots = (__objc2_prot_list **)(&TTRIntentHandler + 40);
      _os_log_impl(&dword_2450D4000, v111, v112, "setting contactRepresentation {contactRepresentation: %@}", v113, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v115, -1, -1);
      MEMORY[0x24952EEE4](v113, -1, -1);
    }
    else
    {

      v111 = v110;
    }
    v24 = v203;
    v22 = (char *)v201;

    v116 = v110;
    sub_24510355C();

  }
  v117 = (uint64_t)a11;
  v118 = v199;
  swift_beginAccess();
  v119 = *v118;
  if (*v118)
  {
    v120 = p_base_prots[82];
    v121 = v119;
    if (v120 != (__objc2_prot_list *)-1)
      swift_once();
    __swift_project_value_buffer(v204, (uint64_t)qword_25744B3E0);
    v122 = v121;
    v123 = sub_245103910();
    v124 = sub_245103AB4();
    if (os_log_type_enabled(v123, v124))
    {
      v125 = (uint8_t *)swift_slowAlloc();
      v198 = (_QWORD *)swift_slowAlloc();
      v199 = a11;
      *(_DWORD *)v125 = 138412290;
      v206[3] = (uint64_t)v122;
      v126 = v122;
      v117 = (uint64_t)v199;
      sub_245103C28();
      v127 = v198;
      *v198 = v119;

      _os_log_impl(&dword_2450D4000, v123, v124, "setting userActivity {remUserActivity: %@}", v125, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v127, -1, -1);
      v128 = v125;
      v22 = (char *)v201;
      MEMORY[0x24952EEE4](v128, -1, -1);
    }
    else
    {

      v123 = v122;
    }

    v129 = v122;
    sub_245103550();

    p_base_prots = &TTRIntentHandler.base_prots;
    v24 = v203;
  }
  v201 = a12;
  v130 = (uint64_t)v200;
  swift_beginAccess();
  sub_2450E3594(v130, (uint64_t)v22, &qword_25744B5F0);
  v131 = v196;
  v132 = v192;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v196 + 48))(v22, 1, v192) == 1)
  {
    sub_2450E35D8((uint64_t)v22, &qword_25744B5F0);
  }
  else
  {
    v133 = *(void (**)(char *, char *, uint64_t))(v131 + 32);
    v134 = v131;
    v135 = v191;
    v133(v191, v22, v132);
    if (p_base_prots[82] != (__objc2_prot_list *)-1)
      swift_once();
    __swift_project_value_buffer(v204, (uint64_t)qword_25744B3E0);
    v200 = *(_QWORD **)(v134 + 16);
    ((void (*)(char *, char *, uint64_t))v200)(v24, v135, v132);
    v136 = sub_245103910();
    v137 = sub_245103AB4();
    if (os_log_type_enabled(v136, v137))
    {
      v138 = (uint8_t *)swift_slowAlloc();
      v139 = swift_slowAlloc();
      v206[0] = v139;
      *(_DWORD *)v138 = 136315138;
      v140 = sub_2451033AC();
      v205 = sub_245101AB4(v140, v141, v206);
      v134 = v196;
      sub_245103C28();
      swift_bridgeObjectRelease();
      v142 = *(void (**)(char *, uint64_t))(v134 + 8);
      v142(v203, v132);
      _os_log_impl(&dword_2450D4000, v136, v137, "setting URL attachment {userActivityURL: %s}", v138, 0xCu);
      swift_arrayDestroy();
      v143 = v139;
      p_base_prots = (__objc2_prot_list **)(&TTRIntentHandler + 40);
      MEMORY[0x24952EEE4](v143, -1, -1);
      MEMORY[0x24952EEE4](v138, -1, -1);
    }
    else
    {
      v142 = *(void (**)(char *, uint64_t))(v134 + 8);
      v142(v24, v132);
    }

    v144 = (uint64_t)v181;
    v145 = v191;
    ((void (*)(char *, char *, uint64_t))v200)(v181, v191, v132);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v134 + 56))(v144, 0, 1, v132);
    sub_245103598();
    sub_2450E35D8(v144, &qword_25744B5F0);
    v142(v145, v132);
  }
  swift_beginAccess();
  if (*(_QWORD *)(v117 + 8))
  {
    v146 = p_base_prots[82];
    swift_bridgeObjectRetain();
    if (v146 != (__objc2_prot_list *)-1)
      swift_once();
    __swift_project_value_buffer(v204, (uint64_t)qword_25744B3E0);
    v147 = sub_245103910();
    v148 = sub_245103AB4();
    if (os_log_type_enabled(v147, v148))
    {
      v149 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v149 = 0;
      _os_log_impl(&dword_2450D4000, v147, v148, "setting notes", v149, 2u);
      MEMORY[0x24952EEE4](v149, -1, -1);
    }

    v150 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v151 = (void *)sub_245103964();
    swift_bridgeObjectRelease();
    v152 = objc_msgSend(v150, sel_initWithString_, v151);

    sub_2451035A4();
  }
  v153 = (id *)v201;
  swift_beginAccess();
  if (*v153)
  {
    v154 = p_base_prots[82];
    v155 = *v153;
    if (v154 != (__objc2_prot_list *)-1)
      swift_once();
    __swift_project_value_buffer(v204, (uint64_t)qword_25744B3E0);
    v156 = sub_245103910();
    v157 = sub_245103AB4();
    if (os_log_type_enabled(v156, v157))
    {
      v158 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v158 = 0;
      _os_log_impl(&dword_2450D4000, v156, v157, "setting custom smart list filters", v158, 2u);
      MEMORY[0x24952EEE4](v158, -1, -1);
    }

    v159 = v182;
    sub_245103424();
    sub_2451035BC();

    (*(void (**)(char *, uint64_t))(v183 + 8))(v159, v184);
  }
  v160 = v193;
  v161 = objc_msgSend(v193, sel_accountCapabilities, v173);
  v162 = objc_msgSend(v161, sel_supportsFlagged);

  if (!v162)
    goto LABEL_67;
  v163 = objc_msgSend(a13, sel_priority);
  if (!v163)
    goto LABEL_67;
  if (v163 == (id)1 || v163 == (id)2)
  {
    sub_2451035D4();
LABEL_67:
    if (p_base_prots[82] != (__objc2_prot_list *)-1)
      swift_once();
    __swift_project_value_buffer(v204, (uint64_t)qword_25744B3E0);
    v164 = v160;
    v165 = sub_245103910();
    v166 = sub_245103AB4();
    if (os_log_type_enabled(v165, v166))
    {
      v167 = (uint8_t *)swift_slowAlloc();
      v168 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v167 = 138543362;
      v169 = objc_msgSend(v164, sel_objectID);
      v210 = v169;
      sub_245103C28();
      *v168 = v169;

      _os_log_impl(&dword_2450D4000, v165, v166, "Inserting reminder: {objectID: %{public}@}", v167, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v168, -1, -1);
      MEMORY[0x24952EEE4](v167, -1, -1);

      swift_release();
    }
    else
    {

      swift_release();
    }
    *v194 = v164;
    return;
  }
  if (p_base_prots[82] != (__objc2_prot_list *)-1)
    swift_once();
  v170 = v204;
  v171 = __swift_project_value_buffer(v204, (uint64_t)qword_25744B3E0);
  (*(void (**)(char *, uint64_t, uint64_t))(v173 + 16))(v174, v171, v170);
  v172 = MEMORY[0x24BEE4AF8];
  sub_2450ED6B4(MEMORY[0x24BEE4AF8]);
  sub_2450ED6B4(v172);
  sub_2450E645C((uint64_t)"unknown priority", 16, 2);
  __break(1u);
}

void sub_2450DDA5C(void *a1, int a2, void *a3, void *aBlock, void (*a5)(id, id, void *))
{
  void *v8;
  id v9;
  id v10;

  v8 = _Block_copy(aBlock);
  _Block_copy(v8);
  v9 = a3;
  v10 = a1;
  a5(v9, v10, v8);
  _Block_release(v8);
  _Block_release(v8);

}

uint64_t sub_2450DDAD8(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  void (*v17)(void (*)(int, void *), _QWORD *, uint64_t, uint64_t);
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  swift_retain();
  v13 = objc_msgSend(a5, sel_taskReference);
  if (!v13)
  {
    swift_release();
    if (qword_25744B290 != -1)
      swift_once();
    v19 = sub_24510391C();
    __swift_project_value_buffer(v19, (uint64_t)qword_25744B3E0);
    v20 = sub_245103910();
    v21 = sub_245103A90();
    if (!os_log_type_enabled(v20, v21))
      goto LABEL_13;
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    v23 = ".taskReference is .unknown. {resolve: nil}";
    goto LABEL_12;
  }
  if (v13 == (id)1)
  {
    v14 = *(_QWORD *)(a6
                    + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_userActivityProvider
                    + 24);
    v15 = *(_QWORD *)(a6
                    + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_userActivityProvider
                    + 32);
    __swift_project_boxed_opaque_existential_1((_QWORD *)(a6 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_userActivityProvider), v14);
    v16 = (_QWORD *)swift_allocObject();
    v16[2] = a3;
    v16[3] = a4;
    v16[4] = sub_2450DE0A4;
    v16[5] = v12;
    v17 = *(void (**)(void (*)(int, void *), _QWORD *, uint64_t, uint64_t))(v15 + 8);
    swift_retain();
    v17(sub_2450DE100, v16, v14, v15);
    return swift_release();
  }
  swift_release();
  if (qword_25744B290 != -1)
    swift_once();
  v24 = sub_24510391C();
  __swift_project_value_buffer(v24, (uint64_t)qword_25744B3E0);
  v20 = sub_245103910();
  v21 = sub_245103A9C();
  if (os_log_type_enabled(v20, v21))
  {
    v22 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v22 = 0;
    v23 = ".taskReference is an unhandled enum. {resolve: nil}";
LABEL_12:
    _os_log_impl(&dword_2450D4000, v20, v21, v23, v22, 2u);
    MEMORY[0x24952EEE4](v22, -1, -1);
  }
LABEL_13:

  v25 = 0;
  return a1(&v25);
}

void sub_2450DDD48(int a1, id a2, void (*a3)(id), uint64_t a4, void (*a5)(void))
{
  id v7;

  if (a2)
  {
    v7 = a2;
    a3(a2);

  }
  else
  {
    a5();
  }
}

uint64_t sub_2450DDDA4(void *a1)
{
  uint64_t v1;
  id v2;
  id v3;
  _QWORD *v4;
  id v5;
  uint64_t v6;

  v2 = objc_msgSend(a1, sel_contactEventTrigger);
  v3 = objc_msgSend(v2, sel_triggerContact);

  if (v3)
  {
    v4 = __swift_project_boxed_opaque_existential_1((_QWORD *)(v1+ OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_contactRepresentationResolver), *(_QWORD *)(v1+ OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_contactRepresentationResolver+ 24));
    MEMORY[0x24BDAC7A8](v4);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744B890);
    swift_allocObject();
    v5 = v3;
    v6 = sub_2451038EC();

  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744B890);
    swift_allocObject();
    return sub_2451038E0();
  }
  return v6;
}

id sub_2450DDEF4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRAddTasksIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TTRAddTasksIntentHandler()
{
  return objc_opt_self();
}

_UNKNOWN **sub_2450DDFBC()
{
  return &off_251606310;
}

_UNKNOWN **sub_2450DDFC8()
{
  return &off_251605828;
}

_UNKNOWN **sub_2450DDFD4()
{
  return &off_251606498;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_2450DE004(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  sub_2450E6818(a1, a2, a3, a4, *(uint64_t (**)(uint64_t))(v4 + 16), *(_QWORD *)(v4 + 24), *(void **)(v4 + 32));
}

uint64_t sub_2450DE010(uint64_t (*a1)(uint64_t *), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_2450DDAD8(a1, a2, a3, a4, *(void **)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_2450DE018()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_2450DE03C@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;

  return sub_2450DABA4(*(id *)(v2 + 16), a1, a2);
}

uint64_t sub_2450DE054()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2450DE078(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_2450DE0A4(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t sub_2450DE0D4()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_2450DE100(int a1, void *a2)
{
  uint64_t v2;

  sub_2450DDD48(a1, a2, *(void (**)(id))(v2 + 16), *(_QWORD *)(v2 + 24), *(void (**)(void))(v2 + 32));
}

id sub_2450DE10C(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  id v12[2];

  v12[1] = *(id *)MEMORY[0x24BDAC8D0];
  v12[0] = 0;
  v1 = objc_msgSend(a1, sel_fetchDefaultAccountWithError_, v12);
  if (v12[0])
  {
    v2 = v12[0];

    swift_willThrow();
    if (qword_25744B290 != -1)
      swift_once();
    v3 = sub_24510391C();
    __swift_project_value_buffer(v3, (uint64_t)qword_25744B3E0);
    v4 = v2;
    v5 = sub_245103910();
    v6 = sub_245103A9C();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = (void *)swift_slowAlloc();
      v12[0] = v8;
      *(_DWORD *)v7 = 136315138;
      swift_getErrorValue();
      v9 = sub_245103E50();
      sub_245101AB4(v9, v10, (uint64_t *)v12);
      sub_245103C28();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v5, v6, "Unable to determine default account {error: %s}", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v8, -1, -1);
      MEMORY[0x24952EEE4](v7, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v1;
}

uint64_t sub_2450DE328(unint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;

  if (a1 >> 62)
    goto LABEL_14;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x24BEE4AF8];
    if (!v4)
      break;
    v10 = MEMORY[0x24BEE4AF8];
    result = sub_245103D24();
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }
    v6 = 0;
    while (v4 != v6)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x24952E92C](v6, a1);
      else
        v7 = *(id *)(a1 + 8 * v6 + 32);
      ++v6;
      v8 = v7;
      v9 = objc_msgSend(a2, sel_event);
      objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA190]), sel_initWithPlacemark_event_, v8, v9);

      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
      if (v4 == v6)
        return v10;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    v4 = sub_245103DE4();
    swift_bridgeObjectRelease();
  }
  return result;
}

void sub_2450DE4A4(void *a1, char *a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  IMP *p_imp;
  uint8_t *v12;
  void *v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  uint8_t *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  _QWORD *v27;
  void (*v28)(id, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  id v29;
  id v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  void (*v52)(uint64_t, uint64_t, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  char *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  NSObject *v66;
  id v67;
  NSObject *v68;
  os_log_type_t v69;
  uint64_t v70;
  _QWORD *v71;
  id v72;
  id v73;
  id v74;
  os_log_type_t type[8];
  void (**v76)(_QWORD, _QWORD);
  void (**v77)(_QWORD, _QWORD);
  uint64_t v78;
  char *v79;
  id v80[2];

  v80[1] = *(id *)MEMORY[0x24BDAC8D0];
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = a3;
  _Block_copy(a3);
  if (qword_25744B290 != -1)
    swift_once();
  v7 = sub_24510391C();
  __swift_project_value_buffer(v7, (uint64_t)qword_25744B3E0);
  v8 = a1;
  v9 = sub_245103910();
  v10 = sub_245103AB4();
  p_imp = &stru_251606FF0.imp;
  if (os_log_type_enabled(v9, v10))
  {
    v76 = a3;
    v12 = (uint8_t *)swift_slowAlloc();
    *(_QWORD *)type = v6;
    v13 = (void *)swift_slowAlloc();
    v80[0] = v13;
    *(_DWORD *)v12 = 136315138;
    v14 = objc_msgSend(v8, sel_targetTaskList);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B690);
    v15 = sub_245103C1C();
    v17 = v16;

    v18 = v15;
    p_imp = (IMP *)(&stru_251606FF0 + 16);
    sub_245101AB4(v18, v17, (uint64_t *)v80);
    sub_245103C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v9, v10, "SiriKit asked for resolving tasklist {targetTaskList: %s}", v12, 0xCu);
    swift_arrayDestroy();
    v19 = v13;
    v6 = *(_QWORD *)type;
    MEMORY[0x24952EEE4](v19, -1, -1);
    v20 = v12;
    a3 = v76;
    MEMORY[0x24952EEE4](v20, -1, -1);

  }
  else
  {

  }
  v21 = objc_msgSend(v8, (SEL)p_imp[477]);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource + 24];
    v24 = *(_QWORD *)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource + 32];
    __swift_project_boxed_opaque_existential_1(&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource], v23);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
    v25 = swift_allocObject();
    *(_OWORD *)(v25 + 16) = xmmword_245104540;
    *(_QWORD *)(v25 + 32) = v22;
    v80[0] = (id)v25;
    sub_245103A0C();
    v26 = v80[0];
    v27 = (_QWORD *)swift_allocObject();
    v27[2] = v22;
    v27[3] = sub_2450E38AC;
    v27[4] = v6;
    v28 = *(void (**)(id, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v24 + 40);
    v29 = v22;
    swift_retain();
    v28(v26, sub_2450E37C8, v27, v23, v24);
    swift_release();

    swift_bridgeObjectRelease();
LABEL_8:
    swift_release();
    return;
  }
  v30 = objc_msgSend(v8, sel_targetTaskListMembers);
  if (v30)
  {
    v31 = v30;
    sub_2450D8184(0, &qword_25744B328);
    v32 = sub_2451039F4();

    if (v32 >> 62)
    {
      swift_bridgeObjectRetain();
      v33 = sub_245103DE4();
      swift_bridgeObjectRelease();
      if (v33)
        goto LABEL_12;
    }
    else
    {
      v33 = *(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v33)
      {
LABEL_12:
        v34 = (void *)MEMORY[0x24BEE4AF8];
        v80[0] = (id)MEMORY[0x24BEE4AF8];
        if (v33 < 1)
          __break(1u);
        v35 = v32 & 0xC000000000000001;
        swift_bridgeObjectRetain();
        v36 = 0;
        do
        {
          if (v35)
            v37 = (id)MEMORY[0x24952E92C](v36, v32);
          else
            v37 = *(id *)(v32 + 8 * v36 + 32);
          v38 = v37;
          ++v36;
          v39 = sub_245103BC8();

          sub_2450EBE0C(v39);
        }
        while (v33 != v36);
        swift_bridgeObjectRelease();
        v40 = v80[0];
        v80[0] = v34;
        swift_bridgeObjectRetain();
        v41 = 0;
        do
        {
          if (v35)
            v42 = (id)MEMORY[0x24952E92C](v41, v32);
          else
            v42 = *(id *)(v32 + 8 * v41 + 32);
          v43 = v42;
          ++v41;
          v44 = sub_245103BD4();

          sub_2450EBE0C(v44);
        }
        while (v33 != v41);
        swift_bridgeObjectRelease();
        v45 = v80[0];
        v46 = *(_QWORD *)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource + 32];
        v78 = *(_QWORD *)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource + 24];
        __swift_project_boxed_opaque_existential_1(&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource], v78);
        v47 = swift_bridgeObjectRetain();
        v48 = sub_2450EAC0C(v47);
        swift_bridgeObjectRelease();
        v49 = swift_bridgeObjectRetain();
        v50 = sub_2450EAC0C(v49);
        swift_bridgeObjectRelease();
        v51 = (_QWORD *)swift_allocObject();
        v51[2] = v32;
        v51[3] = v40;
        v51[4] = v45;
        v51[5] = a2;
        v51[6] = sub_2450E38AC;
        v51[7] = v6;
        v52 = *(void (**)(uint64_t, uint64_t, void (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v46 + 56);
        swift_retain();
        v53 = a2;
        v52(v48, v50, sub_2450E378C, v51, v78, v46);
        swift_release();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_8;
      }
    }
    swift_bridgeObjectRelease();
  }
  v54 = *(void **)&a2[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store];
  v80[0] = 0;
  v55 = objc_msgSend(v54, sel_fetchDefaultListWithError_, v80);
  v56 = v55;
  if (v80[0])
  {
    v57 = v80[0];

    swift_willThrow();
  }
  else if (v55)
  {
    v79 = a2;
    sub_2450D8184(0, &qword_25744B5B8);
    v62 = v56;
    v63 = (void *)sub_245103A60();
    v64 = v62;
    v65 = v63;
    v66 = v64;
    v67 = v65;
    v68 = sub_245103910();
    v69 = sub_245103AB4();
    if (os_log_type_enabled(v68, v69))
    {
      v70 = swift_slowAlloc();
      v71 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v70 = 138412546;
      v77 = a3;
      v72 = -[NSObject objectID](v66, sel_objectID);
      v80[0] = v72;
      sub_245103C28();
      *v71 = v72;

      *(_WORD *)(v70 + 12) = 2112;
      v80[0] = v67;
      v73 = v67;
      a3 = v77;
      sub_245103C28();
      v71[1] = v67;

      _os_log_impl(&dword_2450D4000, v68, v69, "Using defaultList {objectID: %@, result: .success(%@)}", (uint8_t *)v70, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v71, -1, -1);
      MEMORY[0x24952EEE4](v70, -1, -1);
    }
    else
    {

      v68 = v66;
    }

    v79[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_didNotSpecifyTargetList] = 1;
    sub_2450D8184(0, &qword_25744B5A8);
    v74 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedTaskList_, v67);
    ((void (**)(_QWORD, id))a3)[2](a3, v74);
    swift_release();

    return;
  }
  v58 = sub_245103910();
  v59 = sub_245103AB4();
  if (os_log_type_enabled(v58, v59))
  {
    v60 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v60 = 0;
    _os_log_impl(&dword_2450D4000, v58, v59, "No .targetTaskList and unable to get defaultList. {result: .disambiguateDueToNoDefaultList}", v60, 2u);
    MEMORY[0x24952EEE4](v60, -1, -1);
  }

  v61 = sub_2450D9C0C();
  ((void (**)(_QWORD, id))a3)[2](a3, v61);
  swift_release();

}

void sub_2450DED50(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  IMP *p_imp;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  BOOL v22;
  uint8_t *v23;
  _QWORD *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  NSObject *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint8_t *v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  id v41;
  void *v42;
  unint64_t v43;
  unint64_t v44;
  id v45;
  NSObject *v46;
  os_log_type_t v47;
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  unint64_t v54;
  unint64_t v55;
  uint64_t v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  id v60;
  void *v61;
  void *v62;
  id v63;
  NSObject *v64;
  os_log_type_t v65;
  uint8_t *v66;
  id v67;
  uint64_t v68;
  NSObject *v69;
  os_log_type_t v70;
  uint8_t *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  NSObject *v76;
  id v77;
  NSObject *v78;
  NSObject *v79;
  NSObject *v80;
  os_log_type_t v81;
  uint64_t v82;
  _QWORD *v83;
  NSObject *v84;
  NSObject *v85;
  uint64_t v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  id v91;
  uint64_t v92;
  unint64_t v93;
  unint64_t v94;
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  id v99;
  NSObject *v100;
  NSObject *v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;

  if (qword_25744B290 != -1)
    swift_once();
  v4 = sub_24510391C();
  __swift_project_value_buffer(v4, (uint64_t)qword_25744B3E0);
  v5 = a1;
  v6 = sub_245103910();
  v7 = sub_245103AB4();
  p_imp = &stru_251606FF0.imp;
  if (os_log_type_enabled(v6, v7))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v102 = a2;
    v10 = swift_slowAlloc();
    v104 = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = objc_msgSend(v5, sel_spatialEventTrigger);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B688);
    v12 = sub_245103C1C();
    v14 = v13;

    sub_245101AB4(v12, v14, (uint64_t *)&v104);
    sub_245103C28();

    p_imp = (IMP *)(&stru_251606FF0 + 16);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v6, v7, "SiriKit asked for resolving spatial event trigger {spatialEventTrigger: %s}", v9, 0xCu);
    swift_arrayDestroy();
    v15 = v10;
    a2 = v102;
    MEMORY[0x24952EEE4](v15, -1, -1);
    MEMORY[0x24952EEE4](v9, -1, -1);

  }
  else
  {

  }
  v16 = objc_msgSend(v5, (SEL)p_imp[486]);
  if (!v16)
  {
    v27 = sub_245103910();
    v28 = sub_245103AB4();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_2450D4000, v27, v28, ".spatialEventTrigger is nil {result: .notRequired}", v29, 2u);
      MEMORY[0x24952EEE4](v29, -1, -1);
    }

    sub_2450D8184(0, &qword_25744B660);
    v30 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v30);
    goto LABEL_60;
  }
  v17 = v16;
  if (!objc_msgSend(v16, sel_event))
  {
    v31 = sub_245103910();
    v32 = sub_245103A9C();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v33 = 0;
      _os_log_impl(&dword_2450D4000, v31, v32, "spatialEventTrigger.event must not be .unknown {result: .unsupported}", v33, 2u);
      MEMORY[0x24952EEE4](v33, -1, -1);
    }

    sub_2450D8184(0, &qword_25744B660);
    v30 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v30);

    goto LABEL_60;
  }
  v18 = objc_msgSend(v17, sel_mobileSpace);
  v19 = v17;
  v20 = sub_245103910();
  v21 = sub_245103AB4();
  v22 = os_log_type_enabled(v20, v21);
  if (v18 == (id)1)
  {
    if (v22)
    {
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v23 = 138412290;
      v104 = v19;
      v25 = v19;
      v26 = v19;
      sub_245103C28();
      *v24 = v17;

      v19 = v25;
      _os_log_impl(&dword_2450D4000, v20, v21, "Resolved vehicle trigger {result: .success, spatialEventTrigger: %@}", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v24, -1, -1);
      MEMORY[0x24952EEE4](v23, -1, -1);
    }
    else
    {

      v20 = v19;
    }

    v30 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedSpatialEventTrigger_, v19);
    (*(void (**)(uint64_t, NSObject *))(a2 + 16))(a2, v30);

LABEL_60:
    return;
  }
  v103 = a2;
  v100 = v19;
  if (v22)
  {
    v34 = (uint8_t *)swift_slowAlloc();
    v35 = swift_slowAlloc();
    v104 = v35;
    *(_DWORD *)v34 = 136315138;
    v36 = -[NSObject suggestedValues](v19, sel_suggestedValues);
    if (v36)
    {
      v37 = v36;
      sub_2450D8184(0, &qword_25744B670);
      sub_2451039F4();

    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B680);
    v38 = sub_245103C1C();
    v40 = v39;
    swift_bridgeObjectRelease();
    sub_245101AB4(v38, v40, (uint64_t *)&v104);
    sub_245103C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v20, v21, "suggestedValues: %s", v34, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v35, -1, -1);
    MEMORY[0x24952EEE4](v34, -1, -1);

    a2 = v103;
  }
  else
  {

  }
  v41 = -[NSObject suggestedValues](v19, sel_suggestedValues);
  if (v41)
  {
    v42 = v41;
    sub_2450D8184(0, &qword_25744B670);
    v43 = sub_2451039F4();

    v44 = v43 >> 62;
    if (!(v43 >> 62))
      goto LABEL_26;
  }
  else
  {
    v43 = MEMORY[0x24BEE4AF8];
    v44 = MEMORY[0x24BEE4AF8] >> 62;
    if (!(MEMORY[0x24BEE4AF8] >> 62))
    {
LABEL_26:
      if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_27;
LABEL_35:
      swift_bridgeObjectRelease();
      v57 = sub_245103910();
      v58 = sub_245103AB4();
      if (os_log_type_enabled(v57, v58))
      {
        v59 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v59 = 0;
        _os_log_impl(&dword_2450D4000, v57, v58, "fallback to spatialEventTrigger.placemark instead because placemark count is 0 {count: 0}", v59, 2u);
        MEMORY[0x24952EEE4](v59, -1, -1);
      }

      v60 = -[NSObject placemark](v19, sel_placemark);
      if (!v60)
      {
        v64 = sub_245103910();
        v65 = sub_245103A9C();
        if (os_log_type_enabled(v64, v65))
        {
          v66 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v66 = 0;
          _os_log_impl(&dword_2450D4000, v64, v65, "spatialEventTrigger.placemark == nil. Siri is messed up. Ignoring. {result: .notRequired}", v66, 2u);
          MEMORY[0x24952EEE4](v66, -1, -1);
        }

        sub_2450D8184(0, &qword_25744B660);
        v67 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
        (*(void (**)(uint64_t, id))(a2 + 16))(a2, v67);

        v30 = v19;
        goto LABEL_60;
      }
      v45 = -[NSObject placemark](v19, sel_placemark);
LABEL_49:
      v72 = objc_msgSend(v45, sel_region);
      if (v72)
      {
        v73 = v72;
        objc_opt_self();
        v74 = swift_dynamicCastObjCClass();
        if (v74)
        {
          v75 = v74;
          v76 = v19;
          v77 = v73;
          v78 = v76;
          v79 = v77;
          v80 = sub_245103910();
          v81 = sub_245103AB4();
          if (os_log_type_enabled(v80, v81))
          {
            v101 = v78;
            v82 = swift_slowAlloc();
            v83 = (_QWORD *)swift_slowAlloc();
            *(_DWORD *)v82 = 138412546;
            v104 = v75;
            v84 = v79;
            sub_245103C28();
            *v83 = v75;

            *(_WORD *)(v82 + 12) = 2112;
            v104 = v101;
            v85 = v101;
            sub_245103C28();
            v83[1] = v17;

            a2 = v103;
            _os_log_impl(&dword_2450D4000, v80, v81, "Resolved circularRegion {circularRegion: %@, result: .success(%@)}", (uint8_t *)v82, 0x16u);
            __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
            swift_arrayDestroy();
            MEMORY[0x24952EEE4](v83, -1, -1);
            v86 = v82;
            v78 = v101;
            MEMORY[0x24952EEE4](v86, -1, -1);
          }
          else
          {

            v80 = v79;
          }

          v30 = v45;
          v97 = -[NSObject event](v78, sel_event);
          v98 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA190]), sel_initWithPlacemark_event_, v30, v97);

          v99 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedSpatialEventTrigger_, v98);
          (*(void (**)(uint64_t, id))(a2 + 16))(a2, v99);

          goto LABEL_60;
        }

      }
      v30 = v45;
      v87 = sub_245103910();
      v88 = sub_245103A9C();
      if (os_log_type_enabled(v87, v88))
      {
        v89 = (uint8_t *)swift_slowAlloc();
        v90 = swift_slowAlloc();
        v104 = v90;
        *(_DWORD *)v89 = 136315138;
        v91 = -[NSObject region](v30, sel_region);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25744B678);
        v92 = sub_245103C1C();
        v94 = v93;

        sub_245101AB4(v92, v94, (uint64_t *)&v104);
        sub_245103C28();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2450D4000, v87, v88, "Got a placemark with a CLRegion that is not a CLCircularRegion {region: %s, result: unsupported}", v89, 0xCu);
        swift_arrayDestroy();
        v95 = v90;
        a2 = v103;
        MEMORY[0x24952EEE4](v95, -1, -1);
        MEMORY[0x24952EEE4](v89, -1, -1);

      }
      else
      {

      }
      sub_2450D8184(0, &qword_25744B660);
      v96 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      (*(void (**)(uint64_t, id))(a2 + 16))(a2, v96);

      goto LABEL_60;
    }
  }
  swift_bridgeObjectRetain();
  v56 = sub_245103DE4();
  swift_bridgeObjectRelease();
  if (!v56)
    goto LABEL_35;
LABEL_27:
  if ((v43 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    v45 = (id)MEMORY[0x24952E92C](0, v43);
    swift_bridgeObjectRelease();
    if (!v44)
    {
LABEL_30:
      if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10) != 1)
      {
LABEL_31:

        swift_bridgeObjectRetain_n();
        v46 = sub_245103910();
        v47 = sub_245103AB4();
        if (os_log_type_enabled(v46, v47))
        {
          v48 = (uint8_t *)swift_slowAlloc();
          v49 = swift_slowAlloc();
          v104 = v49;
          *(_DWORD *)v48 = 136315138;
          v50 = sub_2450D8184(0, &qword_25744B670);
          v51 = swift_bridgeObjectRetain();
          v52 = MEMORY[0x24952E644](v51, v50);
          v53 = v19;
          v55 = v54;
          swift_bridgeObjectRelease();
          sub_245101AB4(v52, v55, (uint64_t *)&v104);
          a2 = v103;
          sub_245103C28();
          swift_bridgeObjectRelease_n();
          v19 = v53;
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2450D4000, v46, v47, "Disambiguate suggestedValues {result: .disambiguation, placemarks: %s}", v48, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x24952EEE4](v49, -1, -1);
          MEMORY[0x24952EEE4](v48, -1, -1);

        }
        else
        {

          swift_bridgeObjectRelease_n();
        }
        v30 = v19;
        sub_2450DE328(v43, v30);
        swift_bridgeObjectRelease();

        v61 = (void *)objc_opt_self();
        sub_2450D8184(0, &qword_25744B668);
        v62 = (void *)sub_2451039E8();
        swift_bridgeObjectRelease();
        v63 = objc_msgSend(v61, sel_disambiguationWithSpatialEventTriggersToDisambiguate_, v62);

        (*(void (**)(uint64_t, id))(a2 + 16))(a2, v63);
        goto LABEL_60;
      }
      goto LABEL_46;
    }
LABEL_45:
    swift_bridgeObjectRetain();
    v68 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v68 != 1)
      goto LABEL_31;
LABEL_46:
    swift_bridgeObjectRelease();
    v69 = sub_245103910();
    v70 = sub_245103AB4();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v71 = 0;
      _os_log_impl(&dword_2450D4000, v69, v70, "Using the only suggestedValue because placemarks.count is 1 {count: 1}", v71, 2u);
      MEMORY[0x24952EEE4](v71, -1, -1);
    }

    goto LABEL_49;
  }
  if (*(_QWORD *)((v43 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v45 = *(id *)(v43 + 32);
    if (!v44)
      goto LABEL_30;
    goto LABEL_45;
  }
  __break(1u);
}

void sub_2450DFCE8(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  IMP *p_imp;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint8_t *v15;
  id v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;

  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = a3;
  _Block_copy(a3);
  if (qword_25744B290 != -1)
    swift_once();
  v6 = sub_24510391C();
  __swift_project_value_buffer(v6, (uint64_t)qword_25744B3E0);
  v7 = a1;
  v8 = sub_245103910();
  v9 = sub_245103AB4();
  p_imp = &stru_251606FF0.imp;
  if (os_log_type_enabled(v8, v9))
  {
    v30 = v5;
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v31 = v12;
    *(_DWORD *)v11 = 136315138;
    objc_msgSend(v7, sel_taskReference);
    type metadata accessor for INTaskReference(0);
    v13 = sub_245103994();
    sub_245101AB4(v13, v14, &v31);
    sub_245103C28();

    p_imp = (IMP *)(&stru_251606FF0 + 16);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v8, v9, "SiriKit asked for resolving task reference {taskReference: %s}", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v12, -1, -1);
    v15 = v11;
    v5 = v30;
    MEMORY[0x24952EEE4](v15, -1, -1);

  }
  else
  {

  }
  if (objc_msgSend(v7, (SEL)p_imp[468]) != (id)1)
  {
    v23 = sub_245103910();
    v24 = sub_245103AB4();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_2450D4000, v23, v24, "userActivity not requested {result: .notRequired}", v25, 2u);
      MEMORY[0x24952EEE4](v25, -1, -1);
    }

    sub_2450D8184(0, &qword_25744B658);
    v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    goto LABEL_16;
  }
  v16 = sub_2450DB1F0(v7);
  if (v16)
  {
    v17 = v16;
    v18 = objc_msgSend(v16, sel_supportsReminderActions);

    if ((v18 & 1) == 0)
    {
      v27 = sub_245103910();
      v28 = sub_245103A9C();
      if (os_log_type_enabled(v27, v28))
      {
        v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_2450D4000, v27, v28, "Target list account doesn't support userActivity. {result: .unsupported()}", v29, 2u);
        MEMORY[0x24952EEE4](v29, -1, -1);
      }

      sub_2450D8184(0, &qword_25744B658);
      v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
LABEL_16:
      v22 = v26;
      ((void (**)(_QWORD, id))a3)[2](a3, v22);
      goto LABEL_17;
    }
  }
  MEMORY[0x24BDAC7A8](v16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744B560);
  swift_allocObject();
  sub_2451038EC();
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = sub_2450E38AC;
  *(_QWORD *)(v19 + 24) = v5;
  swift_retain();
  v20 = (void *)sub_245103898();
  sub_2451038C8();
  swift_release();
  swift_release();

  v21 = swift_allocObject();
  *(_QWORD *)(v21 + 16) = sub_2450E38AC;
  *(_QWORD *)(v21 + 24) = v5;
  swift_retain();
  v22 = (id)sub_245103898();
  sub_2451038D4();
  swift_release();
  swift_release();
  swift_release();
LABEL_17:
  swift_release();

}

void sub_2450E01B8(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  if (qword_25744B290 != -1)
    swift_once();
  v4 = sub_24510391C();
  __swift_project_value_buffer(v4, (uint64_t)qword_25744B3E0);
  v5 = a1;
  v6 = sub_245103910();
  v7 = sub_245103AB4();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    v28 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = objc_msgSend(v5, sel_targetTaskListMembers);
    if (v10)
    {
      v11 = v10;
      sub_2450D8184(0, &qword_25744B328);
      sub_2451039F4();

    }
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B650);
    v12 = sub_245103994();
    v27 = sub_245101AB4(v12, v13, &v28);
    sub_245103C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v6, v7, "SiriKit asked for resolving target task list members {targetTaskListMembers: %s}", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v9, -1, -1);
    MEMORY[0x24952EEE4](v8, -1, -1);

  }
  else
  {

  }
  v14 = objc_msgSend(v5, sel_targetTaskListMembers, v27);
  if (!v14)
  {
    sub_2450D8184(0, (unint64_t *)&unk_25744B640);
    v23 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_245104540;
    *(_QWORD *)(v24 + 32) = v23;
    v28 = v24;
    sub_245103A0C();
    v25 = v23;
    v26 = (void *)sub_2451039E8();
    (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v26);

LABEL_21:
    swift_bridgeObjectRelease();

    return;
  }
  v15 = v14;
  sub_2450D8184(0, &qword_25744B328);
  v16 = sub_2451039F4();

  if (!(v16 >> 62))
  {
    v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v17)
      goto LABEL_11;
LABEL_20:
    swift_bridgeObjectRelease();
    sub_2450D8184(0, (unint64_t *)&unk_25744B640);
    v26 = (void *)sub_2451039E8();
    (*(void (**)(uint64_t, void *))(a2 + 16))(a2, v26);
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  v17 = sub_245103DE4();
  swift_bridgeObjectRelease();
  if (!v17)
    goto LABEL_20;
LABEL_11:
  v28 = MEMORY[0x24BEE4AF8];
  sub_245103D24();
  if ((v17 & 0x8000000000000000) == 0)
  {
    v18 = (void *)objc_opt_self();
    v19 = 0;
    do
    {
      if ((v16 & 0xC000000000000001) != 0)
        v20 = (id)MEMORY[0x24952E92C](v19, v16);
      else
        v20 = *(id *)(v16 + 8 * v19 + 32);
      v21 = v20;
      ++v19;
      v22 = objc_msgSend(v18, sel_successWithResolvedPerson_, v20);

      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
    }
    while (v17 != v19);
    goto LABEL_20;
  }
  __break(1u);
}

void sub_2450E0608(void *a1, _QWORD *a2, void (**a3)(const void *, id))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
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
  char *v24;
  uint64_t v25;
  void (**v26)(const void *, id);
  void *v27;
  uint64_t inited;
  id v29;
  NSObject *v30;
  NSObject *v31;
  os_log_type_t v32;
  _BOOL4 v33;
  uint64_t v34;
  uint8_t *v35;
  _QWORD *v36;
  NSObject *v37;
  uint8_t *v38;
  uint64_t v39;
  _QWORD *v40;
  char *v41;
  id v42;
  void *v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  void (**v50)(char *, uint64_t, _QWORD *);
  char *v51;
  uint64_t v52;
  _QWORD *v53;
  NSObject *v54;
  os_log_type_t v55;
  uint8_t *v56;
  uint8_t *v57;
  NSObject *v58;
  os_log_type_t v59;
  uint8_t *v60;
  uint64_t v61;
  _QWORD *v62;
  NSObject *v63;
  _QWORD *v64;
  id v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  void *v74;
  uint64_t v75;
  NSObject *v76;
  NSObject *v77;
  os_log_type_t v78;
  int v79;
  _BOOL4 v80;
  uint64_t v81;
  uint8_t *v82;
  _QWORD *v83;
  NSObject *v84;
  NSObject *v85;
  _QWORD *v86;
  uint8_t *v87;
  os_log_t v88;
  uint64_t v89;
  void (**v90)(char *, uint64_t, _QWORD *);
  os_log_t v91;
  _QWORD *v92;
  uint64_t v93;
  void *v94;
  id v95;
  void *v96;
  id v97;
  id v98;
  id v99;
  id v100;
  unsigned int v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  _QWORD *v108;
  id v109;
  id v110;
  NSObject *v111;
  os_log_type_t v112;
  int v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  _QWORD *v117;
  id v118;
  id v119;
  os_log_t v120;
  void *v121;
  void *v122;
  char *v123;
  void *v124;
  id v125;
  id v126;
  id v127;
  NSObject *v128;
  os_log_type_t v129;
  uint8_t *v130;
  uint64_t v131;
  _QWORD *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  id v136;
  _QWORD *v137;
  char *v138;
  NSObject *v139;
  NSObject *v140;
  os_log_type_t v141;
  uint8_t *v142;
  _QWORD *v143;
  NSObject *v144;
  _QWORD *v145;
  id v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  char *v151;
  id v152;
  char *v153;
  id v154;
  NSObject *v155;
  os_log_type_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  _QWORD *v160;
  char *v161;
  uint64_t v162;
  unint64_t v163;
  _QWORD *v164;
  uint64_t v165;
  id v166;
  _QWORD *v167;
  id v168;
  NSObject *v169;
  NSObject *v170;
  os_log_type_t v171;
  uint64_t v172;
  uint64_t v173;
  _QWORD *v174;
  id v175;
  id v176;
  NSObject *v177;
  id v178;
  id v179;
  unsigned int v180;
  NSObject *v181;
  NSObject *v182;
  NSObject *v183;
  os_log_type_t v184;
  uint8_t *v185;
  uint64_t v186;
  _QWORD *v187;
  id v188;
  _QWORD *v189;
  id v190;
  id v191;
  id v192;
  id v193;
  void *v194;
  void *v195;
  id v196;
  id v197;
  id v198;
  id v199;
  NSObject *v200;
  os_log_type_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  _QWORD *v205;
  id v206;
  uint64_t v207;
  unint64_t v208;
  _QWORD *v209;
  uint64_t v210;
  id v211;
  uint64_t v212;
  uint64_t v213;
  id v214;
  void *v215;
  id v216;
  uint8_t *v217;
  uint64_t v218;
  NSObject *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  NSObject *v223;
  void *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  _QWORD *v228;
  uint64_t v229;
  void *v230;
  uint64_t v231;
  uint64_t v232;
  _QWORD *v233;
  void *v234;
  uint64_t v235;
  uint64_t v236;
  char *v237;
  uint64_t v238;
  void (*v239)(char *, uint64_t);
  _QWORD *v240;
  id v241;
  id v242;
  id v243;
  _QWORD *v244;
  uint64_t v245;
  uint64_t v246;
  char *v247;
  void *v248;
  void *v249;
  char *v250;
  void *v251;
  id v252;
  char *v253;
  uint64_t v254;
  char v255;
  uint64_t v256;
  void *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  unint64_t v261;
  unint64_t v262;
  unint64_t v263;
  unint64_t v264;
  unint64_t v265;
  unint64_t v266;
  _QWORD *v267;
  id v268;
  char *v269;
  id v270;
  id v271;
  uint64_t (**v272)();
  NSObject *v273;
  id v274;
  uint64_t (*v275)();
  NSObject *v276;
  id v277;
  _QWORD *v278;
  char *v279;
  void *v280;
  _QWORD *v281;
  id v282;
  id v283;
  id v284;
  id v285;
  void *v286;
  void *v287;
  id v288;
  id v289;
  void *v290;
  NSObject *v291;
  id v292;
  NSObject *v293;
  id v294;
  NSObject *v295;
  os_log_type_t v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  NSObject **v300;
  NSObject *v301;
  NSObject **v302;
  uint64_t v303;
  unint64_t v304;
  _QWORD *v305;
  uint64_t v306;
  id v307;
  id v308;
  id v309;
  uint8_t *v310;
  uint8_t *v311;
  uint64_t v312;
  NSObject *v313;
  id v314;
  void *v315;
  id v316;
  uint64_t v317;
  id v318;
  uint64_t v319;
  NSObject *v320;
  void (**v321)(const void *, id);
  char *v322;
  uint64_t v323;
  uint64_t v324;
  char *v325;
  uint64_t v326;
  uint64_t v327;
  char *v328;
  uint64_t v329;
  uint64_t v330;
  char *v331;
  uint64_t v332;
  uint64_t v333;
  unint64_t v334;
  unint64_t v335;
  char *v336;
  char *v337;
  uint64_t v338;
  os_log_t v339;
  char *v340;
  uint64_t v341;
  void (**v342)(char *, uint64_t, _QWORD *);
  _QWORD *v343;
  char *v344;
  id v345;
  _QWORD *v346;
  uint64_t v347;
  void *v348;
  _QWORD *v349;
  id v350[16];

  v346 = a2;
  v350[15] = *(id *)MEMORY[0x24BDAC8D0];
  v324 = sub_2451034D8();
  v323 = *(_QWORD *)(v324 - 8);
  MEMORY[0x24BDAC7A8](v324);
  v322 = (char *)&v310 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v330 = sub_245103388();
  v329 = *(_QWORD *)(v330 - 8);
  MEMORY[0x24BDAC7A8](v330);
  v328 = (char *)&v310 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v327 = sub_245103430();
  v326 = *(_QWORD *)(v327 - 8);
  MEMORY[0x24BDAC7A8](v327);
  v8 = (char *)&v310 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v333 = sub_245103694();
  v332 = *(_QWORD *)(v333 - 8);
  MEMORY[0x24BDAC7A8](v333);
  v331 = (char *)&v310 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5C8);
  v334 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v336 = (char *)&v310 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v335 = v11;
  MEMORY[0x24BDAC7A8](v12);
  v338 = (uint64_t)&v310 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5D0);
  MEMORY[0x24BDAC7A8](v14);
  v339 = (os_log_t)((char *)&v310 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v16);
  v344 = (char *)&v310 - v17;
  v343 = (_QWORD *)sub_245103460();
  v342 = (void (**)(char *, uint64_t, _QWORD *))*(v343 - 1);
  MEMORY[0x24BDAC7A8](v343);
  v340 = (char *)&v310 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v19);
  v337 = (char *)&v310 - v20;
  v21 = sub_24510391C();
  v22 = *(_QWORD *)(v21 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)&v310 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = swift_allocObject();
  *(_QWORD *)(v25 + 16) = a3;
  v26 = a3;
  _Block_copy(a3);
  if (qword_25744B290 != -1)
    swift_once();
  v27 = (void *)__swift_project_value_buffer(v21, (uint64_t)qword_25744B3E0);
  (*(void (**)(char *, void *, uint64_t))(v22 + 16))(v24, v27, v21);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5D8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_245104860;
  *(_QWORD *)(inited + 32) = 0x746E65746E69;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 72) = sub_2450D8184(0, (unint64_t *)&unk_25744B5E0);
  *(_QWORD *)(inited + 48) = a1;
  v29 = a1;
  sub_2450ED6B4(inited);
  sub_2450E6174();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  v30 = v29;
  v345 = v27;
  v31 = sub_245103910();
  v32 = sub_245103AB4();
  v33 = os_log_type_enabled(v31, v32);
  v325 = v8;
  if (v33)
  {
    v34 = swift_slowAlloc();
    v341 = v25;
    v35 = (uint8_t *)v34;
    v36 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v35 = 138412290;
    v350[0] = v30;
    v37 = v30;
    sub_245103C28();
    *v36 = v30;

    _os_log_impl(&dword_2450D4000, v31, v32, "SiriKit asked for handling intent {intent: %@}", v35, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v36, -1, -1);
    v38 = v35;
    v39 = v341;
    v40 = v346;
    MEMORY[0x24952EEE4](v38, -1, -1);
  }
  else
  {

    v31 = v30;
    v39 = v25;
    v40 = v346;
  }
  v41 = v344;

  v42 = -[NSObject taskTitles](v30, sel_taskTitles);
  if (!v42)
  {
    v54 = sub_245103910();
    v55 = sub_245103A9C();
    if (!os_log_type_enabled(v54, v55))
    {
LABEL_18:

      v65 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9BB8]), sel_initWithCode_userActivity_, 4, 0);
      v26[2](v26, v65);
      swift_release();

      return;
    }
    v56 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v56 = 0;
    _os_log_impl(&dword_2450D4000, v54, v55, "intent.taskTitles is nil - should have resolved it in previous calls. {result: .failure}", v56, 2u);
    v57 = v56;
LABEL_16:
    MEMORY[0x24952EEE4](v57, -1, -1);
    goto LABEL_18;
  }
  v43 = v42;
  sub_2450D8184(0, (unint64_t *)&unk_25744B580);
  v44 = sub_2451039F4();

  v45 = (char *)-[NSObject targetTaskList](v30, sel_targetTaskList);
  if (!v45)
  {
    swift_bridgeObjectRelease();
    v58 = v30;
    v54 = sub_245103910();
    v59 = sub_245103A9C();
    if (!os_log_type_enabled(v54, v59))
    {

      v54 = v58;
      goto LABEL_18;
    }
    v60 = (uint8_t *)swift_slowAlloc();
    v61 = swift_slowAlloc();
    v321 = v26;
    v62 = (_QWORD *)v61;
    *(_DWORD *)v60 = 138412290;
    v350[0] = v58;
    v63 = v58;
    sub_245103C28();
    *v62 = v58;

    _os_log_impl(&dword_2450D4000, v54, v59, "Unexpected nil .targetTaskList from intent. {intent: %@, result: .failure}", v60, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
    swift_arrayDestroy();
    v64 = v62;
    v26 = v321;
    MEMORY[0x24952EEE4](v64, -1, -1);
    v57 = v60;
    goto LABEL_16;
  }
  v46 = v45;
  v320 = v30;
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 0;
  v48 = sub_245103A54();
  v344 = v46;
  if (!v49)
    goto LABEL_27;
  if ((v48 & 1) != 0)
  {
    v319 = v47;
    sub_24510343C();
    v50 = v342;
    v51 = v41;
    v52 = (uint64_t)v41;
    v53 = v343;
    if (((unsigned int (*)(char *, uint64_t, _QWORD *))v342[6])(v51, 1, v343) == 1)
    {
      sub_2450E35D8(v52, &qword_25744B5D0);
      v47 = v319;
      goto LABEL_25;
    }
    v50[4](v337, v52, v53);
    v66 = (void *)objc_opt_self();
    v67 = (void *)sub_245103448();
    v68 = objc_msgSend(v66, sel_objectIDWithUUID_, v67);

    v69 = *(void **)((char *)v40 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store);
    v350[0] = 0;
    v318 = v68;
    v70 = objc_msgSend(v69, sel_fetchCustomSmartListWithObjectID_error_, v68, v350);
    if (v70)
    {
      v71 = v70;
      v316 = v69;
      v72 = v350[0];
      v73 = objc_msgSend(v71, sel_customContext);
      v47 = v319;
      if (!v73 || (v74 = v73, v75 = sub_245103B44(), v74, (v315 = (void *)v75) == 0))
      {

        ((void (*)(char *, _QWORD *))v342[1])(v337, v343);
        v46 = v344;
        goto LABEL_25;
      }
      v314 = v71;
      v76 = v318;
      v77 = sub_245103910();
      v78 = sub_245103AB4();
      v79 = v78;
      v80 = os_log_type_enabled(v77, v78);
      v341 = v39;
      v313 = v76;
      if (v80)
      {
        v81 = swift_slowAlloc();
        LODWORD(v312) = v79;
        v82 = (uint8_t *)v81;
        v83 = (_QWORD *)swift_slowAlloc();
        v321 = v26;
        v311 = v82;
        *(_DWORD *)v82 = 138543362;
        v310 = v82 + 4;
        v350[0] = v76;
        v84 = v76;
        v317 = v44;
        v85 = v84;
        v39 = v341;
        v26 = v321;
        sub_245103C28();
        *v83 = v76;
        v86 = v83;

        v44 = v317;
        v87 = v311;
        _os_log_impl(&dword_2450D4000, v77, (os_log_type_t)v312, "Successfully fetched custom smart list {smartListID: %{public}@}", v311, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v86, -1, -1);
        MEMORY[0x24952EEE4](v87, -1, -1);
      }
      else
      {

        v77 = v76;
      }
      v285 = v316;

      v286 = *(void **)(v47 + 16);
      v287 = v315;
      *(_QWORD *)(v47 + 16) = v315;
      v316 = v287;

      v350[0] = 0;
      v288 = objc_msgSend(v285, sel_fetchDefaultListWithError_, v350);
      if (!v350[0])
      {
        ((void (*)(char *, _QWORD *))v342[1])(v337, v343);

        v46 = v344;
        if (v288)
        {
          v108 = v288;
          swift_bridgeObjectRelease();
          v343 = v108;
LABEL_52:
          v180 = objc_msgSend(v108, sel_isGroup);
          v181 = v320;
          if (v180)
          {
            swift_bridgeObjectRelease();
            v182 = v108;
            v183 = sub_245103910();
            v184 = sub_245103A9C();
            if (os_log_type_enabled(v183, v184))
            {
              v185 = (uint8_t *)swift_slowAlloc();
              v186 = swift_slowAlloc();
              v321 = v26;
              v187 = (_QWORD *)v186;
              *(_DWORD *)v185 = 138543362;
              v188 = -[NSObject objectID](v182, sel_objectID);
              v350[0] = v188;
              v46 = v344;
              sub_245103C28();
              *v187 = v188;

              _os_log_impl(&dword_2450D4000, v183, v184, "Fetched list is a Group, can't add reminder to groups. {result: .failure, listID: %{public}@}", v185, 0xCu);
              __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
              swift_arrayDestroy();
              v189 = v187;
              v26 = v321;
              MEMORY[0x24952EEE4](v189, -1, -1);
              MEMORY[0x24952EEE4](v185, -1, -1);
            }
            else
            {

              v183 = v182;
            }
            v190 = v343;

            v191 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9BB8]), sel_initWithCode_userActivity_, 4, 0);
            v26[2](v26, v191);
            swift_release();
            swift_release();

            return;
          }
          v345 = v108;
          v341 = v39;
          if (-[NSObject spatialEventTrigger](v320, sel_spatialEventTrigger))
          {
            sub_2450D8184(0, (unint64_t *)&unk_25744B8A0);
            v340 = (char *)sub_245103B38();
          }
          else
          {
            v340 = 0;
          }
          v211 = -[NSObject spatialEventTrigger](v181, sel_spatialEventTrigger);
          v317 = v44;
          if (v211)
          {
            sub_2450D8184(0, (unint64_t *)&unk_25744B600);
            v316 = (id)sub_245103B2C();
          }
          else
          {
            v316 = 0;
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5A0);
          v342 = (void (**)(char *, uint64_t, _QWORD *))swift_allocBox();
          v213 = v212;
          v214 = -[NSObject temporalEventTrigger](v181, sel_temporalEventTrigger);
          v310 = (uint8_t *)v213;
          if (v214)
          {
            v215 = v214;
            sub_245103B14();

          }
          else
          {
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v329 + 56))(v213, 1, 1, v330);
          }
          v216 = -[NSObject temporalEventTrigger](v181, sel_temporalEventTrigger, v310);
          v321 = v26;
          v319 = v47;
          if (v216)
          {
            v217 = (uint8_t *)v346;
            sub_2450E3474((uint64_t)v346 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_timeProvider, (uint64_t)v350);
            sub_24510361C();
          }
          else
          {
            v218 = sub_245103628();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v218 - 8) + 56))(v338, 1, 1, v218);
            v217 = (uint8_t *)v346;
          }
          v219 = swift_allocObject();
          v219[2].isa = 0;
          v220 = sub_2450DDDA4(v181);
          v221 = swift_allocObject();
          *(_QWORD *)(v221 + 16) = 0;
          MEMORY[0x24BDAC7A8](v221);
          *(&v310 - 2) = (uint8_t *)v222;
          *(&v310 - 1) = v217;
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744B560);
          swift_allocObject();
          v223 = sub_2451038EC();
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5F0);
          v224 = (void *)swift_allocBox();
          v226 = v225;
          v227 = sub_2451033C4();
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v227 - 8) + 56))(v226, 1, 1, v227);
          v228 = (_QWORD *)swift_allocObject();
          v228[2] = 0;
          v228[3] = 0;
          v311 = (uint8_t *)__swift_instantiateConcreteTypeFromMangledName(&qword_25744B5F8);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
          v229 = swift_allocObject();
          *(_OWORD *)(v229 + 16) = xmmword_245104870;
          swift_retain();
          v230 = (void *)sub_245103898();
          v231 = MEMORY[0x24BEE4AE0] + 8;
          v315 = (void *)v220;
          v232 = sub_2451038C8();
          v339 = v219;
          swift_release();

          *(_QWORD *)(v229 + 32) = v232;
          v233 = (_QWORD *)swift_allocObject();
          v233[2] = v221;
          v233[3] = v224;
          v233[4] = v228;
          v337 = (char *)v221;
          swift_retain();
          v318 = v224;
          swift_retain();
          v314 = v228;
          swift_retain();
          v234 = (void *)sub_245103898();
          v312 = v231;
          v313 = v223;
          v235 = sub_2451038C8();
          swift_release();

          *(_QWORD *)(v229 + 40) = v235;
          v350[0] = (id)v229;
          sub_245103A0C();
          v311 = (uint8_t *)sub_2451038A4();
          swift_bridgeObjectRelease();
          v236 = v332;
          v237 = v331;
          v238 = v333;
          (*(void (**)(char *, _QWORD, uint64_t))(v332 + 104))(v331, *MEMORY[0x24BE7D408], v333);
          LOBYTE(v235) = sub_245103688();
          v239 = *(void (**)(char *, uint64_t))(v236 + 8);
          v240 = v346;
          v239(v237, v238);
          if ((v235 & 1) != 0
            && *((_BYTE *)v240
               + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_didNotSpecifyTargetList) == 1)
          {
            v241 = -[NSObject temporalEventTrigger](v320, sel_temporalEventTrigger);

            if (!v241)
            {
              v242 = -[NSObject spatialEventTrigger](v320, sel_spatialEventTrigger);

              if (!v242)
              {
                v243 = -[NSObject contactEventTrigger](v320, sel_contactEventTrigger);

                if (!v243)
                {
                  v244 = (_QWORD *)((char *)v240
                                  + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_timeProvider);
                  v245 = *(_QWORD *)((char *)v240
                                   + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_timeProvider
                                   + 24);
                  v246 = v244[4];
                  __swift_project_boxed_opaque_existential_1(v244, v245);
                  v247 = v325;
                  (*(void (**)(uint64_t, uint64_t))(v246 + 8))(v245, v246);
                  v248 = (void *)objc_opt_self();
                  v249 = (void *)sub_2451033F4();
                  v250 = v322;
                  sub_2451034CC();
                  v251 = (void *)sub_2451034C0();
                  (*(void (**)(char *, uint64_t))(v323 + 8))(v250, v324);
                  v252 = objc_msgSend(v248, sel_rem_dateComponentsWithDate_timeZone_isAllDay_, v249, v251, 0);

                  v253 = v328;
                  sub_245103340();

                  v254 = sub_24510334C();
                  if ((v255 & 1) != 0)
                  {
                    _Block_release(v321);

                    __break(1u);
                    return;
                  }
                  v256 = v254;
                  v257 = (void *)objc_opt_self();
                  objc_msgSend(v257, sel_nextThirdsHour_, objc_msgSend(v257, sel_nextThirdsHourFromHour_, v256));
                  sub_245103358();
                  sub_245103364();
                  sub_245103370();
                  (*(void (**)(char *, uint64_t))(v326 + 8))(v247, v327);
                  v258 = (uint64_t)v310;
                  sub_2450E35D8((uint64_t)v310, &qword_25744B5A0);
                  v259 = v329;
                  v260 = v330;
                  (*(void (**)(uint64_t, char *, uint64_t))(v329 + 32))(v258, v253, v330);
                  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v259 + 56))(v258, 0, 1, v260);
                  v240 = v346;
                }
              }
            }
          }
          sub_2450E3594(v338, (uint64_t)v336, &qword_25744B5C8);
          v261 = (*(unsigned __int8 *)(v334 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v334 + 80);
          v334 = (v335 + v261 + 7) & 0xFFFFFFFFFFFFFFF8;
          v262 = (v334 + 15) & 0xFFFFFFFFFFFFFFF8;
          v263 = (v262 + 15) & 0xFFFFFFFFFFFFFFF8;
          v264 = (v263 + 15) & 0xFFFFFFFFFFFFFFF8;
          v335 = (v264 + 15) & 0xFFFFFFFFFFFFFFF8;
          v265 = (v335 + 15) & 0xFFFFFFFFFFFFFFF8;
          v266 = (v265 + 15) & 0xFFFFFFFFFFFFFFF8;
          v267 = (_QWORD *)swift_allocObject();
          v268 = v345;
          v267[2] = v240;
          v267[3] = v268;
          v269 = v340;
          v267[4] = v317;
          v267[5] = v269;
          v270 = v316;
          v271 = v342;
          v267[6] = v316;
          v267[7] = v271;
          sub_2450E3340((uint64_t)v336, (uint64_t)v267 + v261, &qword_25744B5C8);
          *(_QWORD *)((char *)v267 + v334) = v339;
          *(_QWORD *)((char *)v267 + v262) = v337;
          *(_QWORD *)((char *)v267 + v263) = v318;
          *(_QWORD *)((char *)v267 + v264) = v314;
          v272 = (uint64_t (**)())((char *)v267 + ((v266 + 15) & 0xFFFFFFFFFFFFFFF8));
          *(_QWORD *)((char *)v267 + v335) = v319;
          v273 = v320;
          *(_QWORD *)((char *)v267 + v265) = v320;
          v274 = v344;
          *(_QWORD *)((char *)v267 + v266) = v344;
          v275 = (uint64_t (*)())v341;
          *v272 = sub_2450E30AC;
          v272[1] = v275;
          v336 = (char *)v270;
          swift_retain();
          swift_retain();
          v344 = (char *)v274;
          swift_retain();
          v276 = v273;
          v277 = v345;
          swift_retain();
          swift_retain();
          swift_retain();
          swift_retain();
          v278 = v346;
          v279 = v340;
          v280 = (void *)sub_245103898();
          sub_2451038C8();

          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();

          sub_2450E35D8(v338, &qword_25744B5C8);
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
          swift_release();
LABEL_86:
          swift_release();
          return;
        }
        goto LABEL_25;
      }
      v289 = v350[0];
      swift_bridgeObjectRelease();

      swift_bridgeObjectRelease();
      swift_willThrow();
      v350[0] = v289;
      v193 = v289;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B610);
      sub_2450D8184(0, &qword_25744B618);
      if ((swift_dynamicCast() & 1) != 0)
      {

        v290 = v348;
        v291 = v313;
        v292 = v290;
        v293 = v291;
        v294 = v292;
        v295 = sub_245103910();
        v296 = sub_245103A9C();
        if (os_log_type_enabled(v295, v296))
        {
          v297 = swift_slowAlloc();
          v321 = v26;
          v298 = v297;
          v299 = swift_slowAlloc();
          v345 = v294;
          v300 = (NSObject **)v299;
          v346 = (_QWORD *)swift_slowAlloc();
          v347 = (uint64_t)v293;
          v349 = v346;
          *(_DWORD *)v298 = 138543618;
          v301 = v293;
          sub_245103C28();
          v302 = v300;
          v294 = v345;
          *v302 = v293;

          *(_WORD *)(v298 + 12) = 2082;
          v347 = (uint64_t)v294;
          sub_2450E34B8();
          v303 = sub_245103E5C();
          v347 = sub_245101AB4(v303, v304, (uint64_t *)&v349);
          sub_245103C28();

          swift_bridgeObjectRelease();
          _os_log_impl(&dword_2450D4000, v295, v296, "Smart List found and unable to fetch default list. {result: .failure, smartListID: %{public}@, error: %{public}s}", (uint8_t *)v298, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
          swift_arrayDestroy();
          MEMORY[0x24952EEE4](v302, -1, -1);
          v305 = v346;
          swift_arrayDestroy();
          MEMORY[0x24952EEE4](v305, -1, -1);
          v306 = v298;
          v26 = v321;
          MEMORY[0x24952EEE4](v306, -1, -1);

        }
        else
        {

        }
        v307 = v344;
        v308 = v316;
        v309 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9BB8]), sel_initWithCode_userActivity_, 4, 0);
        v26[2](v26, v309);

LABEL_84:
        ((void (*)(char *, _QWORD *))v342[1])(v337, v343);

        goto LABEL_85;
      }

    }
    else
    {
      v341 = v39;
      v192 = v350[0];
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v193 = (id)sub_2451033A0();

      swift_willThrow();
    }
    v350[0] = v193;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B610);
    v194 = (void *)sub_2450D8184(0, &qword_25744B618);
    swift_dynamicCast();
    v195 = v348;
    v196 = v318;
    v197 = v195;
    v198 = v196;
    v199 = v197;
    v200 = sub_245103910();
    v201 = sub_245103A9C();
    if (os_log_type_enabled(v200, v201))
    {
      v202 = swift_slowAlloc();
      v321 = v26;
      v203 = v202;
      v204 = swift_slowAlloc();
      v345 = v194;
      v205 = (_QWORD *)v204;
      v346 = (_QWORD *)swift_slowAlloc();
      v347 = (uint64_t)v198;
      v349 = v346;
      *(_DWORD *)v203 = 138543618;
      v206 = v198;
      sub_245103C28();
      *v205 = v198;

      *(_WORD *)(v203 + 12) = 2082;
      v347 = (uint64_t)v199;
      sub_2450E34B8();
      v207 = sub_245103E5C();
      v347 = sub_245101AB4(v207, v208, (uint64_t *)&v349);
      sub_245103C28();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v200, v201, "Error fetching smart list. {listID: %{public}@, error: %{public}s}", (uint8_t *)v203, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v205, -1, -1);
      v209 = v346;
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v209, -1, -1);
      v210 = v203;
      v26 = v321;
      MEMORY[0x24952EEE4](v210, -1, -1);

    }
    else
    {

    }
    v283 = v344;
    v284 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9BB8]), sel_initWithCode_userActivity_, 4, 0);
    v26[2](v26, v284);

    goto LABEL_84;
  }
LABEL_25:
  v88 = v339;
  sub_24510343C();
  v89 = (uint64_t)v88;
  swift_bridgeObjectRelease();
  v90 = v342;
  v91 = v88;
  v92 = v343;
  if (((unsigned int (*)(os_log_t, uint64_t, _QWORD *))v342[6])(v91, 1, v343) != 1)
  {
    v90[4](v340, v89, v92);
    v121 = (void *)objc_opt_self();
    v122 = (void *)sub_245103448();
    v123 = (char *)objc_msgSend(v121, sel_objectIDWithUUID_, v122);

    v124 = *(void **)((char *)v40 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store);
    v350[0] = 0;
    v125 = objc_msgSend(v124, sel_fetchListWithObjectID_error_, v123, v350);
    v126 = v350[0];
    if (!v125)
    {
      v319 = v47;
      v147 = v350[0];
      swift_bridgeObjectRelease();
      v148 = (void *)sub_2451033A0();

      swift_willThrow();
      v350[0] = v148;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B610);
      v149 = (void *)sub_2450D8184(0, &qword_25744B618);
      swift_dynamicCast();
      v150 = v348;
      v151 = v123;
      v152 = v150;
      v153 = v151;
      v154 = v152;
      v155 = sub_245103910();
      v156 = sub_245103A9C();
      if (os_log_type_enabled(v155, v156))
      {
        v157 = swift_slowAlloc();
        v321 = v26;
        v158 = v157;
        v159 = swift_slowAlloc();
        v345 = v149;
        v160 = (_QWORD *)v159;
        v346 = (_QWORD *)swift_slowAlloc();
        v347 = (uint64_t)v153;
        v349 = v346;
        *(_DWORD *)v158 = 138543618;
        v341 = v39;
        v161 = v153;
        sub_245103C28();
        *v160 = v153;

        *(_WORD *)(v158 + 12) = 2082;
        v347 = (uint64_t)v154;
        sub_2450E34B8();
        v162 = sub_245103E5C();
        v347 = sub_245101AB4(v162, v163, (uint64_t *)&v349);
        v46 = v344;
        sub_245103C28();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2450D4000, v155, v156, "Unable to fetch list. {result: .failure, listID: %{public}@, error: %{public}s}", (uint8_t *)v158, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v160, -1, -1);
        v164 = v346;
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v164, -1, -1);
        v165 = v158;
        v26 = v321;
        MEMORY[0x24952EEE4](v165, -1, -1);

      }
      else
      {

      }
      v281 = v343;
      v282 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9BB8]), sel_initWithCode_userActivity_, 4, 0);
      v26[2](v26, v282);

      ((void (*)(char *, _QWORD *))v342[1])(v340, v281);
      swift_release();
      goto LABEL_86;
    }
    v108 = v125;
    v127 = v126;
    v128 = sub_245103910();
    v129 = sub_245103AB4();
    if (os_log_type_enabled(v128, v129))
    {
      v321 = v26;
      v130 = (uint8_t *)swift_slowAlloc();
      v131 = swift_slowAlloc();
      v337 = v123;
      v132 = (_QWORD *)v131;
      v339 = v128;
      *(_DWORD *)v130 = 138543362;
      v133 = v44;
      v134 = v47;
      v135 = v39;
      v136 = objc_msgSend(v108, sel_objectID);
      v350[0] = v136;
      v26 = v321;
      v128 = v339;
      sub_245103C28();
      *v132 = v136;
      v39 = v135;
      v47 = v134;
      v44 = v133;

      _os_log_impl(&dword_2450D4000, v128, v129, "Successfully fetched list {listID: %{public}@}", v130, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      v137 = v132;
      v138 = v337;
      swift_arrayDestroy();
      v46 = v344;
      MEMORY[0x24952EEE4](v137, -1, -1);
      MEMORY[0x24952EEE4](v130, -1, -1);
    }
    else
    {

      v138 = (char *)v108;
    }

    ((void (*)(char *, _QWORD *))v342[1])(v340, v343);
    v343 = 0;
    goto LABEL_52;
  }
  sub_2450E35D8(v89, &qword_25744B5D0);
LABEL_27:
  v93 = v44;
  v94 = *(void **)((char *)v40 + OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store);
  v95 = sub_2450DE10C(v94);
  if (v95)
  {
    v96 = v95;
    v97 = objc_msgSend(v46, sel_title);
    v98 = objc_msgSend(v97, sel_spokenPhrase);

    if (!v98)
    {
      sub_245103988();
      v98 = (id)sub_245103964();
      swift_bridgeObjectRelease();
    }
    v99 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7D250]), sel_initWithStore_, v94);
    v342 = (void (**)(char *, uint64_t, _QWORD *))objc_msgSend(v99, sel_updateAccount_, v96);
    v100 = objc_msgSend(v99, sel_addListWithName_toAccountChangeItem_, v98);

    v350[0] = 0;
    v343 = v99;
    v101 = objc_msgSend(v99, sel_saveSynchronouslyWithError_, v350);
    v102 = v350[0];
    if (v101)
    {
      v321 = v26;
      v103 = v350[0];
      v104 = objc_msgSend(v100, sel_objectID);
      v350[0] = 0;
      v105 = objc_msgSend(v94, sel_fetchListWithObjectID_error_, v104, v350);

      v102 = v350[0];
      if (v105)
      {
        v341 = v39;
        v106 = v105;
        v107 = v96;
        v108 = v106;
        v109 = v107;
        v110 = v102;
        v111 = sub_245103910();
        v112 = sub_245103AB4();
        v113 = v112;
        if (os_log_type_enabled(v111, v112))
        {
          v114 = swift_slowAlloc();
          LODWORD(v340) = v113;
          v115 = v114;
          v116 = swift_slowAlloc();
          v339 = v111;
          v117 = (_QWORD *)v116;
          *(_DWORD *)v115 = 138543618;
          v118 = objc_msgSend(v108, sel_objectID);
          v350[0] = v118;
          v319 = v47;
          sub_245103C28();
          *v117 = v118;

          *(_WORD *)(v115 + 12) = 2112;
          v350[0] = v109;
          v119 = v109;
          v47 = v319;
          sub_245103C28();
          v117[1] = v96;

          v120 = v339;
          _os_log_impl(&dword_2450D4000, v339, (os_log_type_t)v340, "Successfully created new list {listID: %{public}@, account: %@}", (uint8_t *)v115, 0x16u);
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
          swift_arrayDestroy();
          MEMORY[0x24952EEE4](v117, -1, -1);
          MEMORY[0x24952EEE4](v115, -1, -1);

        }
        else
        {

        }
        v343 = 0;
        v39 = v341;
        v26 = v321;
        v46 = v344;
        v44 = v93;
        goto LABEL_52;
      }
      v26 = v321;
    }
    v166 = v102;
    swift_bridgeObjectRelease();
    v167 = (_QWORD *)sub_2451033A0();

    swift_willThrow();
    v168 = v96;
    v169 = v100;
    v170 = sub_245103910();
    v171 = sub_245103A9C();
    if (os_log_type_enabled(v170, v171))
    {
      v172 = swift_slowAlloc();
      v173 = swift_slowAlloc();
      v341 = v39;
      v174 = (_QWORD *)v173;
      *(_DWORD *)v172 = 138543618;
      v319 = v47;
      v175 = -[NSObject objectID](v169, sel_objectID);
      v321 = v26;
      v176 = v175;
      v350[0] = v175;
      v345 = v96;
      v346 = v167;
      sub_245103C28();
      *v174 = v176;

      *(_WORD *)(v172 + 12) = 2112;
      v350[0] = v168;
      v177 = v169;
      v178 = v168;
      v167 = v346;
      v26 = v321;
      sub_245103C28();
      v174[1] = v345;

      v169 = v177;
      _os_log_impl(&dword_2450D4000, v170, v171, "Error creating new list. {listID: %{public}@, account: %@, result: .failure}", (uint8_t *)v172, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v174, -1, -1);
      MEMORY[0x24952EEE4](v172, -1, -1);
    }
    else
    {

      v170 = v169;
    }

    v179 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9BB8]), sel_initWithCode_userActivity_, 4, 0);
    v26[2](v26, v179);

LABEL_85:
    swift_release();
    goto LABEL_86;
  }
  swift_bridgeObjectRelease();
  v139 = v320;
  v140 = sub_245103910();
  v141 = sub_245103A9C();
  if (os_log_type_enabled(v140, v141))
  {
    v142 = (uint8_t *)swift_slowAlloc();
    v143 = (_QWORD *)swift_slowAlloc();
    v321 = v26;
    v346 = v143;
    *(_DWORD *)v142 = 138412290;
    v350[0] = v139;
    v144 = v139;
    v46 = v344;
    sub_245103C28();
    v145 = v346;
    *v346 = v139;

    _os_log_impl(&dword_2450D4000, v140, v141, "Unable to create list because there is no default account. {intent: %@, result: .failureRequiringAppLaunch}", v142, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
    swift_arrayDestroy();
    v26 = v321;
    MEMORY[0x24952EEE4](v145, -1, -1);
    MEMORY[0x24952EEE4](v142, -1, -1);
  }
  else
  {

    v140 = v139;
  }

  v146 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD9BB8]), sel_initWithCode_userActivity_, 5, 0);
  v26[2](v26, v146);
  swift_release();
  swift_release();

}

uint64_t sub_2450E3088()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2450E30AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_2450E30BC()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_2450E30E0(void **a1)
{
  uint64_t v1;

  sub_2450DB744(a1, v1);
}

uint64_t sub_2450E30F8()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2450E312C(void **a1)
{
  uint64_t *v1;

  return sub_2450DB7A4(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_2450E3148()
{
  id *v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v1 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25744B5C8) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);

  swift_bridgeObjectRelease();
  swift_release();
  v4 = sub_245103628();
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 48))((char *)v0 + v2, 1, v4))
  {
    v5 = sub_245103604();
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))((char *)v0 + v2, 1, v5)&& !swift_getEnumCaseMultiPayload())
    {
      v6 = sub_245103430();
      (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))((char *)v0 + v2, v6);
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  v7 = (((((((((((v3 + v2 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
        + 15) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2450E3340(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_2450E3384(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25744B5C8) - 8);
  v4 = (*(unsigned __int8 *)(v3 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v5 = (*(_QWORD *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  v6 = (v5 + 15) & 0xFFFFFFFFFFFFFFF8;
  v7 = (v6 + 15) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF8;
  v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF8;
  sub_2450DB9B0(a1, *(_QWORD *)(v1 + 16), *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56), v1 + v4, *(_QWORD *)(v1 + v5), *(_QWORD *)(v1 + v6), *(_QWORD *)(v1 + v7), *(_QWORD *)(v1 + v8), *(_QWORD *)(v1 + v9), *(void **)(v1 + ((v9 + 15) & 0xFFFFFFFFFFFFFFF8)), *(_QWORD *)(v1 + ((((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)), *(void (**)(void))(v1+ ((((((v9 + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_2450E3474(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_2450E34B8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25744B620;
  if (!qword_25744B620)
  {
    v1 = sub_2450D8184(255, &qword_25744B618);
    result = MEMORY[0x24952EE3C](MEMORY[0x24BDD01A8], v1);
    atomic_store(result, (unint64_t *)&qword_25744B620);
  }
  return result;
}

void sub_2450E3510(void **a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  sub_2450DC248(a1, *(void **)(v2 + 24), *(void **)(v2 + 32), *(_QWORD **)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(void ***)(v2 + 64), a2, *(void ***)(v2 + 72), *(_QWORD **)(v2 + 80), *(void ***)(v2 + 88), *(_QWORD *)(v2 + 96), *(id *)(v2 + 104));
}

uint64_t sub_2450E3554(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x24952EE3C](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2450E3594(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_2450E35D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2450E3614(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245103628();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2450E3658(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_245103628();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2450E369C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_2450E36D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_2450E3720(_QWORD *a1)
{
  uint64_t v1;

  sub_2450DB2B4(a1, *(void (**)(void))(v1 + 16));
}

void sub_2450E3738(void *a1)
{
  uint64_t v1;

  sub_2450DB4A0(a1, *(void (**)(id))(v1 + 16));
}

void sub_2450E3740(uint64_t a1)
{
  uint64_t v1;

  sub_2450DB174(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2450E3748()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  return swift_deallocObject();
}

void sub_2450E378C(uint64_t a1)
{
  uint64_t v1;

  sub_2450D8F40(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(void (**)(_QWORD))(v1 + 48));
}

uint64_t sub_2450E379C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_2450E37C8(uint64_t a1)
{
  uint64_t v1;

  sub_2450D8368(a1, *(_QWORD *)(v1 + 16), *(void (**)(_QWORD))(v1 + 24));
}

unint64_t sub_2450E37D4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25744B6A0;
  if (!qword_25744B6A0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25744B698);
    result = MEMORY[0x24952EE3C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_25744B6A0);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24952EE30](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
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

uint64_t sub_2450E38B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_24510391C();
  __swift_allocate_value_buffer(v0, qword_25744B710);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25744B710);
  if (qword_25744B2B0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25744C4D0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_2450E3940(unint64_t a1, void (*a2)(id))
{
  char *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  void **v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  uint64_t v38;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = (char *)sub_245103DE4();
    swift_bridgeObjectRelease();
    if ((uint64_t)v4 > 0)
      goto LABEL_3;
LABEL_30:
    if (qword_25744B298 != -1)
      swift_once();
    v34 = sub_24510391C();
    __swift_project_value_buffer(v34, (uint64_t)qword_25744B710);
    v35 = sub_245103910();
    v36 = sub_245103AB4();
    if (os_log_type_enabled(v35, v36))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v37 = 0;
      _os_log_impl(&dword_2450D4000, v35, v36, "No reminder matches with the term {result: .unsupported}", v37, 2u);
      MEMORY[0x24952EEE4](v37, -1, -1);
    }

    sub_2450D8184(0, (unint64_t *)&unk_25744B8C0);
    v32 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
    goto LABEL_35;
  }
  v4 = *(char **)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if ((uint64_t)v4 <= 0)
    goto LABEL_30;
LABEL_3:
  if (v4 == (char *)1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      MEMORY[0x24952E92C](0, a1);
    }
    else
    {
      if (!*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        goto LABEL_38;
      }
      v5 = *(id *)(a1 + 32);
    }
    sub_2450D8184(0, &qword_25744B5C0);
    v4 = (char *)sub_245103B98();
    if (qword_25744B298 == -1)
    {
LABEL_8:
      v6 = sub_24510391C();
      __swift_project_value_buffer(v6, (uint64_t)qword_25744B710);
      swift_bridgeObjectRetain_n();
      v7 = sub_245103910();
      v8 = sub_245103AB4();
      if (os_log_type_enabled(v7, v8))
      {
        v9 = (uint8_t *)swift_slowAlloc();
        v10 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v9 = 138412290;
        if ((a1 & 0xC000000000000001) != 0)
          v11 = (id)MEMORY[0x24952E92C](0, a1);
        else
          v11 = *(id *)(a1 + 32);
        v33 = v11;
        v38 = (uint64_t)v11;
        sub_245103C28();
        *v10 = v33;
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_2450D4000, v7, v8, "One reminder matches with the term {result: .success(%@)}", v9, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v10, -1, -1);
        MEMORY[0x24952EEE4](v9, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v32 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedTask_, v4);

      goto LABEL_35;
    }
LABEL_38:
    swift_once();
    goto LABEL_8;
  }
  if (qword_25744B298 != -1)
    swift_once();
  v12 = sub_24510391C();
  __swift_project_value_buffer(v12, (uint64_t)qword_25744B710);
  v13 = sub_245103910();
  v14 = sub_245103AB4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_2450D4000, v13, v14, "Multiple reminders match with the term {result: .disambiguation}", v15, 2u);
    MEMORY[0x24952EEE4](v15, -1, -1);
  }

  swift_bridgeObjectRetain_n();
  v16 = sub_245103910();
  v17 = sub_245103AB4();
  if (os_log_type_enabled(v16, v17))
  {
    v18 = (uint8_t *)swift_slowAlloc();
    v19 = swift_slowAlloc();
    v38 = v19;
    *(_DWORD *)v18 = 136315138;
    v20 = sub_2450D8184(0, &qword_25744BDD0);
    v21 = swift_bridgeObjectRetain();
    v22 = MEMORY[0x24952E644](v21, v20);
    v24 = v23;
    swift_bridgeObjectRelease();
    sub_245101AB4(v22, v24, &v38);
    sub_245103C28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v16, v17, "Matching reminders: %s", v18, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v19, -1, -1);
    MEMORY[0x24952EEE4](v18, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v38 = MEMORY[0x24BEE4AF8];
  sub_245103D24();
  sub_2450D8184(0, &qword_25744B5C0);
  if ((a1 & 0xC000000000000001) != 0)
  {
    v25 = 0;
    do
    {
      v26 = v25 + 1;
      MEMORY[0x24952E92C]();
      sub_245103B98();
      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
      v25 = v26;
    }
    while (v4 != v26);
  }
  else
  {
    v27 = (void **)(a1 + 32);
    do
    {
      v28 = *v27++;
      v29 = v28;
      sub_245103B98();
      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
      --v4;
    }
    while (v4);
  }
  v30 = (void *)objc_opt_self();
  v31 = (void *)sub_2451039E8();
  swift_bridgeObjectRelease();
  v32 = objc_msgSend(v30, sel_disambiguationWithTasksToDisambiguate_, v31);

LABEL_35:
  a2(v32);

}

void sub_2450E40A8(void **a1, uint64_t a2, id a3, uint64_t a4, uint64_t a5, void *a6, void (*a7)(void))
{
  uint64_t v9;
  id v10;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  id v20;
  id v21;
  unsigned int v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  id v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  void *v43;
  uint64_t v44;
  unint64_t v45;
  id v46;
  uint8_t *v47;
  _QWORD *v48;
  id v52[2];

  v9 = a4;
  v10 = a3;
  v52[1] = *(id *)MEMORY[0x24BDAC8D0];
  v12 = *a1;
  if (*a1)
  {
    v13 = qword_25744B298;
    v14 = v12;
    if (v13 != -1)
      swift_once();
    v15 = sub_24510391C();
    __swift_project_value_buffer(v15, (uint64_t)qword_25744B710);
    v16 = v14;
    v17 = sub_245103910();
    v18 = sub_245103AB4();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      v48 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v19 = 138412290;
      v47 = v19 + 4;
      v52[0] = v16;
      v20 = v16;
      sub_245103C28();
      *v48 = v12;

      _os_log_impl(&dword_2450D4000, v17, v18, "Populating contactRepresentation {contactRepresentation: %@}", v19, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v48, -1, -1);
      MEMORY[0x24952EEE4](v19, -1, -1);

    }
    else
    {

    }
    v9 = a4;
    v21 = v16;
    sub_24510355C();

    v10 = a3;
  }
  v52[0] = 0;
  v22 = objc_msgSend(v10, sel_saveSynchronouslyWithError_, v52, v47);
  v23 = v52[0];
  if (!v22)
    goto LABEL_11;
  v24 = v52[0];
  sub_245103520();
  swift_retain();
  sub_245103514();
  swift_release();
  v25 = *(void **)(v9 + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_store);
  v52[0] = 0;
  v26 = objc_msgSend(v25, sel_fetchReminderWithObjectID_error_, a5, v52);
  v23 = v52[0];
  if (v26)
  {
    v27 = v26;
    v28 = objc_allocWithZone(MEMORY[0x24BDDA130]);
    v29 = v23;
    v30 = objc_msgSend(v28, sel_initWithCode_userActivity_, 3, 0);
    sub_2450D8184(0, &qword_25744B5C0);
    v31 = v27;
    v32 = (void *)sub_245103B98();
    objc_msgSend(v30, sel_setModifiedTask_, v32);

    v52[0] = a6;
    v33 = objc_msgSend(*(id *)(a2 + 16), sel_accountCapabilities);
    sub_2450D8184(0, &qword_25744B880);
    v34 = sub_24510367C();

    objc_msgSend(v30, sel_setWarnings_, v34);
    ((void (*)(id))a7)(v30);

  }
  else
  {
LABEL_11:
    v35 = v23;
    v36 = (void *)sub_2451033A0();

    swift_willThrow();
    if (qword_25744B298 != -1)
      swift_once();
    v37 = sub_24510391C();
    __swift_project_value_buffer(v37, (uint64_t)qword_25744B710);
    v38 = v36;
    v39 = v36;
    v40 = sub_245103910();
    v41 = sub_245103A9C();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      v43 = (void *)swift_slowAlloc();
      v52[0] = v43;
      *(_DWORD *)v42 = 136315138;
      swift_getErrorValue();
      v44 = sub_245103E50();
      sub_245101AB4(v44, v45, (uint64_t *)v52);
      sub_245103C28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2450D4000, v40, v41, "Error saving saveRequest {error: %s}", v42, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v43, -1, -1);
      MEMORY[0x24952EEE4](v42, -1, -1);
    }
    else
    {

    }
    v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA130]), sel_initWithCode_userActivity_, 4, 0);
    a7();

  }
}

id sub_2450E4678()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSetTaskAttributeIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TTRSetTaskAttributeIntentHandler()
{
  return objc_opt_self();
}

_UNKNOWN **sub_2450E4730()
{
  return &off_251606320;
}

_UNKNOWN **sub_2450E473C()
{
  return &off_251605838;
}

_UNKNOWN **sub_2450E4748()
{
  return &off_2516064A8;
}

void sub_2450E4754(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  IMP *p_imp;
  uint64_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;
  void (**v18)(_QWORD, _QWORD);
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  id v23;
  void *v24;
  BOOL v25;
  uint64_t v26;
  BOOL *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t inited;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  void *v40;
  _QWORD *v41;
  unint64_t v42;
  uint64_t v43;
  BOOL *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;

  v6 = sub_2451036D0();
  v45 = *(_QWORD *)(v6 - 8);
  v46 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v44 = (BOOL *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = a3;
  _Block_copy(a3);
  if (qword_25744B298 != -1)
    swift_once();
  v8 = sub_24510391C();
  v9 = __swift_project_value_buffer(v8, (uint64_t)qword_25744B710);
  v10 = a1;
  v11 = sub_245103910();
  v12 = sub_245103AB4();
  p_imp = &stru_251606FF0.imp;
  if (os_log_type_enabled(v11, v12))
  {
    v14 = swift_slowAlloc();
    v43 = v9;
    v15 = (uint8_t *)v14;
    v42 = swift_slowAlloc();
    v49 = v42;
    *(_DWORD *)v15 = 136315138;
    v16 = objc_msgSend(v10, sel_targetTask, v15 + 4);
    v48 = (uint64_t)v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B888);
    v17 = sub_245103C1C();
    v18 = a3;
    v19 = a2;
    v21 = v20;

    p_imp = (IMP *)(&stru_251606FF0 + 16);
    v48 = sub_245101AB4(v17, v21, (uint64_t *)&v49);
    sub_245103C28();

    a2 = v19;
    a3 = v18;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v11, v12, "SiriKit asked for resolving target task {targetTask: %s}", v15, 0xCu);
    v22 = v42;
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v22, -1, -1);
    MEMORY[0x24952EEE4](v15, -1, -1);

  }
  else
  {

  }
  v23 = objc_msgSend(v10, (SEL)p_imp[453]);
  if (v23)
  {
    v24 = v23;
    v25 = objc_msgSend(v10, sel_status) == (id)1;
    v27 = v44;
    v26 = v45;
    *v44 = v25;
    v28 = v46;
    (*(void (**)(BOOL *, _QWORD, uint64_t))(v26 + 104))(v27, *MEMORY[0x24BE7D4D8], v46);
    v29 = *(_QWORD *)(a2 + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_dataSource + 32);
    v42 = *(_QWORD *)(a2 + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_dataSource + 24);
    v43 = v29;
    v41 = __swift_project_boxed_opaque_existential_1((_QWORD *)(a2 + OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_dataSource), v42);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_245104540;
    *(_QWORD *)(inited + 32) = v24;
    v49 = inited;
    sub_245103A0C();
    v31 = v49;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744B8D0);
    v32 = (*(unsigned __int8 *)(v26 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v26 + 80);
    v33 = swift_allocObject();
    *(_OWORD *)(v33 + 16) = xmmword_245104860;
    (*(void (**)(unint64_t, BOOL *, uint64_t))(v26 + 16))(v33 + v32, v27, v28);
    v34 = swift_allocObject();
    v35 = v47;
    *(_QWORD *)(v34 + 16) = sub_2450E30AC;
    *(_QWORD *)(v34 + 24) = v35;
    v36 = v24;
    swift_retain();
    sub_2450EB28C(v31, v33, (void (*)(uint64_t))sub_2450E6168, v34, v42, v43);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();

    (*(void (**)(BOOL *, uint64_t))(v26 + 8))(v27, v28);
    swift_release();
  }
  else
  {
    v37 = sub_245103910();
    v38 = sub_245103A9C();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v39 = 0;
      _os_log_impl(&dword_2450D4000, v37, v38, "INSetTaskAttributeIntent contains nil targetTask, returning INTask.disambiguateWithIncompleteReminders", v39, 2u);
      MEMORY[0x24952EEE4](v39, -1, -1);
    }

    sub_2450D8184(0, &qword_25744B5C0);
    sub_2450D8184(0, (unint64_t *)&unk_25744B8C0);
    v40 = (void *)sub_245103B5C();
    ((void (**)(_QWORD, void *))a3)[2](a3, v40);
    swift_release();

  }
}

uint64_t sub_2450E4C18(void *a1)
{
  id v2;
  id v3;
  id v4;
  id v5;

  v2 = objc_msgSend(a1, sel_contactEventTrigger);

  if (v2)
    return 0;
  if (objc_msgSend(a1, sel_priority))
    return 0;
  v3 = objc_msgSend(a1, sel_spatialEventTrigger);

  if (v3)
    return 0;
  if (objc_msgSend(a1, sel_status))
    return 0;
  v4 = objc_msgSend(a1, sel_taskTitle);

  if (v4)
    return 0;
  v5 = objc_msgSend(a1, sel_temporalEventTrigger);
  if (v5)
  {

    return 0;
  }
  return 1;
}

void sub_2450E4CF0(void *a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  char **v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  _QWORD *v23;
  NSObject *v24;
  char v25;
  NSObject *v26;
  os_log_type_t v27;
  BOOL v28;
  uint8_t *v29;
  id v30;
  id v31;
  uint8_t *v32;
  uint64_t v33;
  NSObject *v34;

  if (qword_25744B298 != -1)
    swift_once();
  v4 = sub_24510391C();
  __swift_project_value_buffer(v4, (uint64_t)qword_25744B710);
  v5 = a1;
  v6 = sub_245103910();
  v7 = sub_245103AB4();
  v8 = &selRef_region;
  if (os_log_type_enabled(v6, v7))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v33 = a2;
    v10 = swift_slowAlloc();
    v34 = v10;
    *(_DWORD *)v9 = 136315138;
    v11 = objc_msgSend(v5, sel_taskTitle);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B8);
    v12 = sub_245103C1C();
    v14 = v13;

    v15 = v12;
    v8 = &selRef_region;
    sub_245101AB4(v15, v14, (uint64_t *)&v34);
    sub_245103C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v6, v7, "SiriKit asked for resolving task title {taskTitle: %s}", v9, 0xCu);
    swift_arrayDestroy();
    v16 = v10;
    a2 = v33;
    MEMORY[0x24952EEE4](v16, -1, -1);
    MEMORY[0x24952EEE4](v9, -1, -1);

  }
  else
  {

  }
  v17 = objc_msgSend(v5, v8[7]);
  if (v17)
  {
    v18 = v17;
    v19 = v17;
    v20 = sub_245103910();
    v21 = sub_245103AB4();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      v23 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v22 = 138412290;
      v34 = v19;
      v24 = v19;
      sub_245103C28();
      *v23 = v18;

      _os_log_impl(&dword_2450D4000, v20, v21, "Resolving TaskTitle, got new task title, returning success {taskTitle: %@}", v22, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v23, -1, -1);
      MEMORY[0x24952EEE4](v22, -1, -1);
    }
    else
    {

      v20 = v19;
    }

    v31 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedString_, v19);
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v31);

  }
  else
  {
    v25 = sub_2450E4C18(v5);
    v26 = sub_245103910();
    v27 = sub_245103AB4();
    v28 = os_log_type_enabled(v26, v27);
    if ((v25 & 1) != 0)
    {
      if (v28)
      {
        v29 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v29 = 0;
        _os_log_impl(&dword_2450D4000, v26, v27, "Resolving TaskTitle, nothing to do, returning .needsValue()", v29, 2u);
        MEMORY[0x24952EEE4](v29, -1, -1);
      }

      sub_2450D8184(0, &qword_25744B590);
      v30 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_needsValue);
    }
    else
    {
      if (v28)
      {
        v32 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v32 = 0;
        _os_log_impl(&dword_2450D4000, v26, v27, "Resolving TaskTitle, no title, other stuff to do, returning .notRequired()", v32, 2u);
        MEMORY[0x24952EEE4](v32, -1, -1);
      }

      sub_2450D8184(0, &qword_25744B590);
      v30 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    }
    v31 = v30;
    (*(void (**)(uint64_t, id))(a2 + 16))(a2, v31);
  }

}

void sub_2450E519C(void *a1, char *a2, void *a3)
{
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
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t inited;
  id v29;
  void (*v30)(char *, uint64_t);
  NSObject *v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  NSObject *v35;
  uint8_t *v36;
  _QWORD *v37;
  NSObject *v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  char *v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v48;
  NSObject *v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  id v61;
  uint64_t v62;
  unint64_t v63;
  unint64_t v64;
  void (**v65)(const void *, id);
  id v66;
  id v67;
  unsigned int v68;
  id v69;
  id v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  id v74;
  uint64_t v75;
  void *v76;
  id v77;
  uint64_t v78;
  void *v79;
  id v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  uint64_t v92;
  NSObject *v93;
  id v94;
  id v95;
  _QWORD *v96;
  __int128 v97;
  id v98;
  _QWORD *v99;
  void *v100;
  uint64_t v101;
  void *v102;
  void *v103;
  NSObject *v104;
  id v105;
  id v106;
  id v107;
  void *v108;
  uint64_t v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  id v113;
  id v114;
  void (*v115)(char *, uint64_t, uint64_t);
  char *v116;
  uint64_t v117;
  char *v118;
  __int128 v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void (**v130)(const void *, id);
  char *v131;
  uint64_t v132;
  char *v133;
  uint64_t v134[5];
  uint64_t v135;

  v133 = a2;
  v5 = sub_245103628();
  v131 = *(char **)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v120 = (uint64_t)&v113 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5C8);
  MEMORY[0x24BDAC7A8](v7);
  v122 = (uint64_t)&v113 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v123 = (char *)&v113 - v10;
  v128 = sub_245103388();
  v127 = *(_QWORD *)(v128 - 8);
  MEMORY[0x24BDAC7A8](v128);
  v126 = (char *)&v113 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5A0);
  MEMORY[0x24BDAC7A8](v12);
  v121 = (char *)&v113 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v125 = (uint64_t)&v113 - v15;
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v113 - v17;
  v19 = sub_24510391C();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v118 = (char *)&v113 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v116 = (char *)&v113 - v23;
  MEMORY[0x24BDAC7A8](v24);
  v26 = (char *)&v113 - v25;
  v132 = swift_allocObject();
  *(_QWORD *)(v132 + 16) = a3;
  _Block_copy(a3);
  if (qword_25744B298 != -1)
    swift_once();
  v27 = __swift_project_value_buffer(v19, (uint64_t)qword_25744B710);
  v115 = *(void (**)(char *, uint64_t, uint64_t))(v20 + 16);
  v115(v26, v27, v19);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5D8);
  inited = swift_initStackObject();
  v119 = xmmword_245104860;
  *(_OWORD *)(inited + 16) = xmmword_245104860;
  *(_QWORD *)(inited + 32) = 0x746E65746E69;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 72) = sub_2450D8184(0, &qword_25744B880);
  *(_QWORD *)(inited + 48) = a1;
  v29 = a1;
  sub_2450ED6B4(inited);
  sub_2450E6174();
  swift_bridgeObjectRelease();
  v30 = *(void (**)(char *, uint64_t))(v20 + 8);
  v117 = v19;
  v30(v26, v19);
  v31 = v29;
  v129 = v27;
  v32 = sub_245103910();
  v33 = sub_245103AB4();
  v34 = os_log_type_enabled(v32, v33);
  v124 = v5;
  v130 = (void (**)(const void *, id))a3;
  if (v34)
  {
    v35 = v31;
    v36 = (uint8_t *)swift_slowAlloc();
    v37 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v36 = 138412290;
    v134[0] = (uint64_t)v31;
    v38 = v31;
    sub_245103C28();
    *v37 = v35;

    v31 = v35;
    _os_log_impl(&dword_2450D4000, v32, v33, "SiriKit asked for handling set task attribute intent {intent: %@}", v36, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v37, -1, -1);
    MEMORY[0x24952EEE4](v36, -1, -1);
  }
  else
  {

    v32 = v31;
  }

  v39 = -[NSObject targetTask](v31, sel_targetTask);
  if (!v39
    || (v40 = v39,
        v41 = *(_QWORD *)&v133[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_store],
        v42 = (void *)sub_245103B74(),
        v40,
        !v42))
  {
    v56 = v31;
    v57 = sub_245103910();
    v58 = sub_245103A9C();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      v60 = swift_slowAlloc();
      v134[0] = v60;
      *(_DWORD *)v59 = 136315138;
      v61 = -[NSObject targetTask](v56, sel_targetTask);
      v135 = (uint64_t)v61;
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B888);
      v62 = sub_245103C1C();
      v64 = v63;

      v135 = sub_245101AB4(v62, v64, v134);
      sub_245103C28();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v57, v58, "Should have resolved targetTask into a reminder. {targetTask: %s}", v59, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v60, -1, -1);
      MEMORY[0x24952EEE4](v59, -1, -1);

    }
    else
    {

    }
    v65 = v130;
    v66 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA130]), sel_initWithCode_userActivity_, 4, 0);
    v65[2](v65, v66);
    swift_release();

    return;
  }
  v114 = objc_msgSend(v42, sel_objectID);
  v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7D250]), sel_initWithStore_, v41);
  sub_2451035E0();
  v135 = (uint64_t)v42;
  v44 = (char *)v43;
  v113 = v42;
  sub_245103544();
  v45 = v134[0];
  v46 = -[NSObject taskTitle](v31, sel_taskTitle);
  if (v46)
  {
    v47 = v46;
    v48 = objc_msgSend(v46, sel_spokenPhrase);
    sub_245103988();
    v49 = v31;

    v50 = objc_allocWithZone(MEMORY[0x24BDD1458]);
    v51 = (void *)sub_245103964();
    swift_bridgeObjectRelease();
    v52 = objc_msgSend(v50, sel_initWithString_, v51);

    sub_2451035B0();
    v31 = v49;
  }
  v53 = -[NSObject status](v31, sel_status);
  v54 = v128;
  v55 = (uint64_t)v131;
  if (v53)
  {
    if (v53 != (id)1 && v53 != (id)2)
    {
      v115(v116, v129, v117);
      v109 = MEMORY[0x24BEE4AF8];
      sub_2450ED6B4(MEMORY[0x24BEE4AF8]);
      sub_2450ED6B4(v109);
      swift_release();
      _Block_release(v130);
      v110 = "unknown status";
      v111 = 14;
LABEL_48:
      sub_2450E645C((uint64_t)v110, v111, 2);
      __break(1u);
      return;
    }
    sub_2451035C8();
  }
  v67 = objc_msgSend(*(id *)(v45 + 16), sel_accountCapabilities);
  v68 = objc_msgSend(v67, sel_supportsFlagged);

  if (!v68)
    goto LABEL_24;
  v69 = -[NSObject priority](v31, sel_priority);
  if (!v69)
    goto LABEL_24;
  if (v69 != (id)1 && v69 != (id)2)
  {
    v115(v118, v129, v117);
    v112 = MEMORY[0x24BEE4AF8];
    sub_2450ED6B4(MEMORY[0x24BEE4AF8]);
    sub_2450ED6B4(v112);
    swift_release();
    _Block_release(v130);
    v110 = "unknown priority";
    v111 = 16;
    goto LABEL_48;
  }
  sub_2451035D4();
LABEL_24:
  v70 = -[NSObject spatialEventTrigger](v31, sel_spatialEventTrigger);
  v71 = v127;
  if (v70)
  {
    v72 = v70;
    v73 = v31;
    sub_2450D8184(0, (unint64_t *)&unk_25744B8A0);
    v74 = v72;
    v75 = sub_245103B38();
    if (v75)
    {
      v76 = (void *)v75;
      MEMORY[0x24952E1B8]();

    }
    sub_2450D8184(0, (unint64_t *)&unk_25744B600);
    v77 = v74;
    v78 = sub_245103B2C();
    if (v78)
    {
      v79 = (void *)v78;
      MEMORY[0x24952E1AC]();

      v77 = v79;
    }
    v31 = v73;

    v55 = (uint64_t)v131;
  }
  v80 = -[NSObject temporalEventTrigger](v31, sel_temporalEventTrigger);
  if (v80)
  {
    v81 = v80;
    sub_245103B14();

  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v71 + 56))(v18, 1, 1, v54);
  }
  v82 = v125;
  sub_2450E3594((uint64_t)v18, v125, &qword_25744B5A0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v82, 1, v54) == 1)
  {
    sub_2450E35D8(v82, &qword_25744B5A0);
  }
  else
  {
    v131 = v44;
    v83 = v82;
    v84 = v126;
    (*(void (**)(char *, uint64_t, uint64_t))(v71 + 32))(v126, v83, v54);
    v85 = (uint64_t)v121;
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v121, v84, v54);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v71 + 56))(v85, 0, 1, v54);
    sub_24510358C();
    sub_2450E35D8(v85, &qword_25744B5A0);
    if (-[NSObject temporalEventTrigger](v31, sel_temporalEventTrigger))
    {
      sub_2450E3474((uint64_t)&v133[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_timeProvider], (uint64_t)v134);
      v86 = (uint64_t)v123;
      sub_24510361C();
      v87 = v124;
    }
    else
    {
      v86 = (uint64_t)v123;
      v87 = v124;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v55 + 56))(v123, 1, 1, v124);
    }
    v88 = v122;
    sub_2450E3594(v86, v122, &qword_25744B5C8);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v55 + 48))(v88, 1, v87) == 1)
    {
      sub_2450E35D8(v86, &qword_25744B5C8);
      (*(void (**)(char *, uint64_t))(v71 + 8))(v126, v54);
      sub_2450E35D8(v88, &qword_25744B5C8);
    }
    else
    {
      v130 = (void (**)(const void *, id))v31;
      v89 = v120;
      sub_2450E3614(v88, v120);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B630);
      v90 = (*(unsigned __int8 *)(v55 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
      v91 = swift_allocObject();
      *(_OWORD *)(v91 + 16) = v119;
      sub_2450E3658(v89, v91 + v90);
      sub_245103580();
      swift_setDeallocating();
      swift_arrayDestroy();
      swift_deallocClassInstance();
      v92 = v89;
      v31 = v130;
      sub_2450E6108(v92);
      sub_2450E35D8(v86, &qword_25744B5C8);
      (*(void (**)(char *, uint64_t))(v71 + 8))(v126, v54);
    }
    v44 = v131;
  }
  v131 = v18;
  v93 = v31;
  v94 = -[NSObject contactEventTrigger](v31, sel_contactEventTrigger);
  v95 = objc_msgSend(v94, sel_triggerContact);

  if (v95)
  {
    v96 = __swift_project_boxed_opaque_existential_1(&v133[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver], *(_QWORD *)&v133[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver+ 24]);
    *(double *)&v97 = MEMORY[0x24BDAC7A8](v96);
    *((_OWORD *)&v113 - 2) = v97;
    *(&v113 - 2) = v95;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744B890);
    swift_allocObject();
    v98 = v95;
    sub_2451038EC();

    swift_retain();
  }
  else
  {
    v134[0] = 0;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744B890);
    swift_allocObject();
    sub_2451038E0();
  }
  v99 = (_QWORD *)swift_allocObject();
  v99[2] = v45;
  v99[3] = v44;
  v100 = v44;
  v101 = v132;
  v102 = v133;
  v103 = v114;
  v99[4] = v133;
  v99[5] = v103;
  v99[6] = v93;
  v99[7] = sub_2450E38AC;
  v99[8] = v101;
  v104 = v93;
  v105 = v100;
  swift_retain();
  v106 = v102;
  v107 = v103;
  swift_retain();
  v108 = (void *)sub_245103898();
  sub_2451038C8();

  swift_release();
  swift_release();

  swift_release();
  swift_release();
  swift_release();

  sub_2450E35D8((uint64_t)v131, &qword_25744B5A0);
  swift_release();
}

uint64_t sub_2450E6074()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2450E6098()
{
  id *v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_2450E60E4(void **a1)
{
  uint64_t v1;

  sub_2450E40A8(a1, *(_QWORD *)(v1 + 16), *(id *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(void **)(v1 + 48), *(void (**)(void))(v1 + 56));
}

uint64_t sub_2450E6108(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245103628();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2450E6144()
{
  swift_release();
  return swift_deallocObject();
}

void sub_2450E6168(unint64_t a1)
{
  uint64_t v1;

  sub_2450E3940(a1, *(void (**)(id))(v1 + 16));
}

void sub_2450E6174()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;

  sub_2451036A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744B940);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_245104860;
  sub_245103904();
  *(_QWORD *)(inited + 32) = 0x696669746E656449;
  *(_QWORD *)(inited + 40) = 0xEA00000000007265;
  sub_245103CDC();
  v1 = sub_245103964();
  swift_bridgeObjectRelease();
  *(_QWORD *)(inited + 48) = v1;
  sub_2450ED59C(inited);
  sub_2451038F8();
  swift_bridgeObjectRelease();
  if (qword_25744B2A0 != -1)
    swift_once();
  v2 = sub_24510391C();
  __swift_project_value_buffer(v2, (uint64_t)qword_25744C4A0);
  swift_bridgeObjectRetain_n();
  v3 = sub_245103910();
  v4 = sub_245103AB4();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    v12 = v6;
    *(_DWORD *)v5 = 136446466;
    v7 = sub_245103CDC();
    sub_245101AB4(v7, v8, &v12);
    sub_245103C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v5 + 12) = 2080;
    swift_bridgeObjectRetain();
    v9 = sub_245103940();
    v11 = v10;
    swift_bridgeObjectRelease();
    sub_245101AB4(v9, v11, &v12);
    sub_245103C28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v3, v4, "%{public}s; UserInfo=%s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v6, -1, -1);
    MEMORY[0x24952EEE4](v5, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

void sub_2450E645C(uint64_t a1, uint64_t a2, char a3)
{
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t v19;

  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v5 = sub_245103910();
  v6 = sub_245103AA8();
  v18 = a1;
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v16 = swift_slowAlloc();
    v19 = v16;
    *(_DWORD *)v7 = 136446722;
    v8 = sub_245103CDC();
    sub_245101AB4(v8, v9, &v19);
    sub_245103C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 12) = 2080;
    swift_bridgeObjectRetain();
    v17 = a3;
    v10 = sub_245103940();
    v12 = v11;
    swift_bridgeObjectRelease();
    sub_245101AB4(v10, v12, &v19);
    sub_245103C28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v7 + 22) = 2082;
    swift_bridgeObjectRetain();
    v13 = sub_245103940();
    v15 = v14;
    swift_bridgeObjectRelease();
    sub_245101AB4(v13, v15, &v19);
    sub_245103C28();
    swift_bridgeObjectRelease_n();
    a3 = v17;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v5, v6, "%{public}s; UserInfo=%s; PublicUserInfo=%{public}s", (uint8_t *)v7, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v16, -1, -1);
    MEMORY[0x24952EEE4](v7, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }

  if ((a3 & 1) != 0)
    goto LABEL_7;
  if (v18)
  {
    rdi_os_crash();
LABEL_7:
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_2450E66DC(uint64_t a1)
{
  return sub_2450E6718(a1, qword_25744C4A0, (SEL *)&selRef_userAction);
}

uint64_t sub_2450E66F0(uint64_t a1)
{
  return sub_2450E6718(a1, qword_25744C4B8, (SEL *)&selRef_utility);
}

uint64_t sub_2450E6704(uint64_t a1)
{
  return sub_2450E6718(a1, qword_25744C4D0, (SEL *)&selRef_siriKit);
}

uint64_t sub_2450E6718(uint64_t a1, uint64_t *a2, SEL *a3)
{
  uint64_t v5;
  id v6;

  v5 = sub_24510391C();
  __swift_allocate_value_buffer(v5, a2);
  __swift_project_value_buffer(v5, (uint64_t)a2);
  v6 = objc_msgSend((id)objc_opt_self(), *a3);
  return sub_245103928();
}

uint64_t sub_2450E6788()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_24510391C();
  __swift_allocate_value_buffer(v0, qword_25744B948);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25744B948);
  if (qword_25744B2A8 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25744C4B8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_2450E6818(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(uint64_t), uint64_t a6, void *a7)
{
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  id v17;
  _QWORD v18[6];

  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  v13 = swift_retain();
  v14 = (void *)a5(v13);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = sub_2450DE0A4;
  v15[3] = v12;
  v15[4] = a7;
  v15[5] = a5;
  v15[6] = a6;
  v18[4] = sub_2450E6C80;
  v18[5] = v15;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 1107296256;
  v18[2] = sub_2450E6C90;
  v18[3] = &block_descriptor;
  v16 = _Block_copy(v18);
  v17 = a7;
  swift_retain();
  swift_release();
  objc_msgSend(v14, sel_requestAccessForEntityType_completionHandler_, 0, v16);
  _Block_release(v16);

}

uint64_t sub_2450E6930()
{
  swift_release();
  return swift_deallocObject();
}

void sub_2450E6954(char a1, id a2, void (*a3)(id), uint64_t a4, uint64_t a5, uint64_t (*a6)(void))
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  id v23;
  uint64_t v24;

  if (a2)
  {
    v8 = a2;
    if (qword_25744B2B8 != -1)
      swift_once();
    v9 = sub_24510391C();
    __swift_project_value_buffer(v9, (uint64_t)qword_25744B948);
    v10 = a2;
    v11 = a2;
    v12 = sub_245103910();
    v13 = sub_245103A9C();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v24 = v15;
      *(_DWORD *)v14 = 136315138;
      swift_getErrorValue();
      v16 = sub_245103E50();
      sub_245101AB4(v16, v17, &v24);
      sub_245103C28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2450D4000, v12, v13, "Error requesting permission for CNContactStore {error: %s}", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v15, -1, -1);
      MEMORY[0x24952EEE4](v14, -1, -1);
    }
    else
    {

    }
    a3(0);

  }
  else if ((a1 & 1) != 0)
  {
    v18 = (void *)a6();
    v23 = (id)sub_245103BE0();

    a3(v23);
  }
  else
  {
    if (qword_25744B2B8 != -1)
      swift_once();
    v19 = sub_24510391C();
    __swift_project_value_buffer(v19, (uint64_t)qword_25744B948);
    v20 = sub_245103910();
    v21 = sub_245103A9C();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_2450D4000, v20, v21, "Permission not granted for accessing CNContactStore {granted: false}", v22, 2u);
      MEMORY[0x24952EEE4](v22, -1, -1);
    }

    a3(0);
  }
}

uint64_t sub_2450E6C4C()
{
  uint64_t v0;

  swift_release();

  swift_release();
  return swift_deallocObject();
}

void sub_2450E6C80(char a1, void *a2)
{
  uint64_t v2;

  sub_2450E6954(a1, a2, *(void (**)(id))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(uint64_t (**)(void))(v2 + 40));
}

void sub_2450E6C90(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

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

_QWORD *initializeBufferWithCopyOfBuffer for TTRContactRepresentationResolver(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  return a1;
}

uint64_t destroy for TTRContactRepresentationResolver()
{
  return swift_release();
}

_QWORD *assignWithCopy for TTRContactRepresentationResolver(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *assignWithTake for TTRContactRepresentationResolver(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TTRContactRepresentationResolver(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TTRContactRepresentationResolver(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TTRContactRepresentationResolver()
{
  return &type metadata for TTRContactRepresentationResolver;
}

uint64_t sub_2450E6E3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_24510391C();
  __swift_allocate_value_buffer(v0, qword_25744B960);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25744B960);
  if (qword_25744B2B0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25744C4D0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_2450E6ECC(uint64_t a1, uint64_t a2)
{
  void **v2;
  void *v3;
  void *v4;
  _QWORD v6[6];

  v3 = *v2;
  v6[4] = a1;
  v6[5] = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 1107296256;
  v6[2] = sub_2450E6F64;
  v6[3] = &block_descriptor_0;
  v4 = _Block_copy(v6);
  swift_retain();
  objc_msgSend(v3, sel_getDeliveredNotificationsWithCompletionHandler_, v4);
  _Block_release(v4);
  return swift_release();
}

uint64_t sub_2450E6F64(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  sub_2450D8184(0, &qword_25744BA30);
  v2 = sub_2451039F4();
  swift_retain();
  v1(v2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2450E6FD0(unint64_t a1, uint64_t a2, void (*a3)(unint64_t), uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE *v31;
  void (*v32)(uint64_t, _BYTE *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  int v36;
  _BYTE *v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  _BYTE *v45;
  unint64_t v46;
  unint64_t v47;
  void (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t, uint64_t);
  unint64_t v50;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  os_log_type_t v57;
  uint64_t v58;
  uint64_t v59;
  NSObject *v60;
  os_log_type_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  uint64_t result;
  _BYTE v70[4];
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  void (*v79)(unint64_t);
  int v80;
  int v81;
  int v82;
  _BYTE *v83;
  _BYTE *v84;
  _BYTE *v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  _BYTE *v90;
  unint64_t v91;
  uint64_t v92;
  id v93;
  uint64_t v94;
  uint64_t v95[3];

  v78 = a4;
  v79 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BA28);
  MEMORY[0x24BDAC7A8](v6);
  v84 = &v70[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = sub_245103778();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = &v70[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v12);
  v14 = (uint64_t)&v70[-v13];
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744BCF0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = &v70[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = sub_245103874();
  v19 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v90 = &v70[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v21);
  v83 = &v70[-v22];
  if (a1 >> 62)
  {
LABEL_38:
    swift_bridgeObjectRetain();
    v23 = sub_245103DE4();
    v92 = v18;
    if (v23)
      goto LABEL_3;
  }
  else
  {
    v23 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    v92 = v18;
    if (v23)
    {
LABEL_3:
      v85 = v11;
      v86 = v14;
      v76 = a2;
      v89 = a1 & 0xC000000000000001;
      v82 = *MEMORY[0x24BE7D688];
      v81 = *MEMORY[0x24BE7D680];
      v80 = *MEMORY[0x24BE7D690];
      v77 = *MEMORY[0x24BE7D660];
      v75 = *MEMORY[0x24BE7D668];
      v74 = *MEMORY[0x24BE7D6A0];
      v73 = *MEMORY[0x24BE7D670];
      v14 = 4;
      v72 = *MEMORY[0x24BE7D678];
      v71 = *MEMORY[0x24BE7D698];
      v91 = MEMORY[0x24BEE4AF8];
      v87 = v23;
      v88 = a1;
      v11 = v84;
      while (1)
      {
        a2 = v14 - 4;
        if (v89)
        {
          v25 = (id)MEMORY[0x24952E92C](v14 - 4, a1);
          a1 = v14 - 3;
          if (__OFADD__(a2, 1))
            goto LABEL_37;
        }
        else
        {
          v25 = *(id *)(a1 + 8 * v14);
          a1 = v14 - 3;
          if (__OFADD__(a2, 1))
          {
LABEL_37:
            __break(1u);
            goto LABEL_38;
          }
        }
        v93 = v25;
        v26 = objc_msgSend(v25, sel_request);
        v27 = objc_msgSend(v26, sel_content);

        v28 = v27;
        sub_24510376C();
        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v9 + 48))(v11, 1, v8) == 1)
        {

          sub_2450E35D8((uint64_t)v11, &qword_25744BA28);
          v29 = 1;
          v18 = v92;
        }
        else
        {
          v30 = v19;
          v31 = v17;
          v32 = *(void (**)(uint64_t, _BYTE *, uint64_t))(v9 + 32);
          v33 = v9;
          v34 = v86;
          v32(v86, v11, v8);
          v35 = v85;
          (*(void (**)(_BYTE *, uint64_t, uint64_t))(v33 + 16))(v85, v34, v8);
          v36 = (*(uint64_t (**)(_BYTE *, uint64_t))(v33 + 88))(v35, v8);
          v18 = v92;
          if (v36 == v82)
          {
            (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v34, v8);

            (*(void (**)(_BYTE *, uint64_t))(v33 + 96))(v35, v8);
            v37 = v31;
            v19 = v30;
            (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v30 + 32))(v37, v35, v18);
            v29 = 0;
            v11 = v84;
            v9 = v33;
            v17 = v37;
            goto LABEL_20;
          }
          if (v36 == v81)
          {
            v9 = v33;
            v38 = *(void (**)(uint64_t, uint64_t))(v33 + 8);
            v38(v86, v8);

            v38((uint64_t)v85, v8);
            v18 = v92;
            v29 = 1;
            v11 = v84;
            v17 = v31;
            goto LABEL_19;
          }
          v11 = v84;
          v9 = v33;
          v17 = v31;
          if (v36 == v80)
          {
            v39 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
            v39(v86, v8);

            v39((uint64_t)v85, v8);
            v18 = v92;
            v29 = 1;
LABEL_19:
            v19 = v30;
LABEL_20:
            v23 = v87;
            goto LABEL_21;
          }
          v19 = v30;
          if (v36 == v77)
          {
            v48 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
            v48(v86, v8);

            v48((uint64_t)v85, v8);
            v18 = v92;
            v29 = 1;
            goto LABEL_20;
          }
          v23 = v87;
          if (v36 == v75 || v36 == v74)
          {
            v49 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
            v49(v86, v8);

            v49((uint64_t)v85, v8);
            v18 = v92;
            v29 = 1;
          }
          else
          {
            if (v36 != v73 && v36 != v72 && v36 != v71)
            {
              result = sub_245103E2C();
              __break(1u);
              return result;
            }
            (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v86, v8);

            v29 = 1;
          }
        }
LABEL_21:
        (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, v29, 1, v18);

        if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
        {
          sub_2450E35D8((uint64_t)v17, (uint64_t *)&unk_25744BCF0);
        }
        else
        {
          v40 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v19 + 32);
          v41 = v83;
          v40(v83, v17, v18);
          v40(v90, v41, v18);
          v42 = v91;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v42 = sub_245101894(0, *(_QWORD *)(v42 + 16) + 1, 1, v42);
          v44 = *(_QWORD *)(v42 + 16);
          v43 = *(_QWORD *)(v42 + 24);
          v91 = v42;
          if (v44 >= v43 >> 1)
            v91 = sub_245101894(v43 > 1, v44 + 1, 1, v91);
          v45 = v90;
          v46 = v91;
          *(_QWORD *)(v91 + 16) = v44 + 1;
          v47 = v46
              + ((*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80))
              + *(_QWORD *)(v19 + 72) * v44;
          v18 = v92;
          v40((_BYTE *)v47, v45, v92);
          v23 = v87;
        }
        ++v14;
        v24 = a1 == v23;
        a1 = v88;
        if (v24)
        {
          swift_bridgeObjectRelease();
          v50 = v91;
          goto LABEL_40;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  v50 = MEMORY[0x24BEE4AF8];
LABEL_40:
  v51 = v50;
  v52 = sub_245103C10();
  if (v52 >> 62)
  {
    swift_bridgeObjectRetain();
    v53 = sub_245103DE4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v53 = *(_QWORD *)((v52 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v54 = *(_QWORD *)(v51 + 16);
  if (v53 != v54)
  {
    if (qword_25744B2C0 != -1)
      swift_once();
    v55 = sub_24510391C();
    __swift_project_value_buffer(v55, (uint64_t)qword_25744B960);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v56 = sub_245103910();
    v57 = sub_245103A9C();
    if (os_log_type_enabled(v56, v57))
    {
      v58 = swift_slowAlloc();
      *(_DWORD *)v58 = 134218240;
      v95[0] = v53;
      sub_245103C28();
      swift_bridgeObjectRelease();
      *(_WORD *)(v58 + 12) = 2048;
      v95[0] = v54;
      sub_245103C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v56, v57, "Unable to fetch some reminders. reminders count doesn't match with reminderIDs count. {notificationIdentifiers.count: %ld, reminders.count: %ld}", (uint8_t *)v58, 0x16u);
      MEMORY[0x24952EEE4](v58, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v18 = v92;
  }
  if (qword_25744B2C0 != -1)
    swift_once();
  v59 = sub_24510391C();
  __swift_project_value_buffer(v59, (uint64_t)qword_25744B960);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v60 = sub_245103910();
  v61 = sub_245103AB4();
  if (os_log_type_enabled(v60, v61))
  {
    v62 = v18;
    v63 = swift_slowAlloc();
    v64 = swift_slowAlloc();
    v95[0] = v64;
    *(_DWORD *)v63 = 134218242;
    swift_bridgeObjectRelease();
    v94 = v53;
    sub_245103C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v63 + 12) = 2080;
    v65 = swift_bridgeObjectRetain();
    v66 = MEMORY[0x24952E644](v65, v62);
    v68 = v67;
    swift_bridgeObjectRelease();
    v94 = sub_245101AB4(v66, v68, v95);
    sub_245103C28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v60, v61, "Retrieved %ld reminders from notification center {notificationIdentifiers: %s}", (uint8_t *)v63, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v64, -1, -1);
    MEMORY[0x24952EEE4](v63, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  v79(v52);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2450E7B68(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  unint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  void (*v29)(uint64_t (*)(unint64_t), _QWORD *, uint64_t, uint64_t);
  _QWORD *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;

  v4 = swift_allocObject();
  v5 = MEMORY[0x24BEE4AF8];
  v33 = v4;
  *(_QWORD *)(v4 + 16) = MEMORY[0x24BEE4AF8];
  v6 = (_QWORD *)(v4 + 16);
  v35 = swift_allocObject();
  *(_QWORD *)(v35 + 16) = v5;
  if (!(a1 >> 62))
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    result = swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_3;
LABEL_19:
    swift_bridgeObjectRelease();
    v25 = (_QWORD *)swift_allocObject();
    v25[2] = v33;
    v25[3] = v35;
    v25[4] = a2;
    v25[5] = a3;
    v26 = v32[6];
    v27 = v32[7];
    __swift_project_boxed_opaque_existential_1(v32 + 3, v26);
    v28 = (_QWORD *)swift_allocObject();
    v28[2] = v32;
    v28[3] = sub_2450E81CC;
    v28[4] = v25;
    v29 = *(void (**)(uint64_t (*)(unint64_t), _QWORD *, uint64_t, uint64_t))(v27 + 8);
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    v29(sub_2450E8204, v28, v26, v27);
    swift_release();
    swift_release();
    swift_release();
    return swift_release();
  }
  swift_bridgeObjectRetain();
  result = sub_245103DE4();
  v7 = result;
  if (!result)
    goto LABEL_19;
LABEL_3:
  if (v7 >= 1)
  {
    v9 = 0;
    v10 = a1 & 0xC000000000000001;
    v34 = a1;
    do
    {
      if (v10)
        v13 = (id)MEMORY[0x24952E92C](v9, a1);
      else
        v13 = *(id *)(a1 + 8 * v9 + 32);
      v12 = v13;
      v14 = (void *)sub_245103B68();
      if (v14)
      {
        v11 = v14;
        MEMORY[0x24952E620]();
        if (*(_QWORD *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_245103A18();
        sub_245103A24();
        sub_245103A0C();

        v12 = v11;
      }
      else
      {
        v15 = objc_msgSend(v12, sel_title);
        v16 = objc_msgSend(v15, sel_spokenPhrase);

        v17 = sub_245103988();
        v19 = v18;

        v20 = *(_QWORD **)(v35 + 16);
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(_QWORD *)(v35 + 16) = v20;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          v20 = sub_245101788(0, v20[2] + 1, 1, v20);
          *(_QWORD *)(v35 + 16) = v20;
        }
        v23 = v20[2];
        v22 = v20[3];
        if (v23 >= v22 >> 1)
        {
          v20 = sub_245101788((_QWORD *)(v22 > 1), v23 + 1, 1, v20);
          *(_QWORD *)(v35 + 16) = v20;
        }
        v20[2] = v23 + 1;
        v24 = &v20[2 * v23];
        v24[4] = v17;
        v24[5] = v19;
        a1 = v34;
      }
      ++v9;

    }
    while (v7 != v9);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_2450E7E98(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(unint64_t))
{
  _QWORD *v5;
  uint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  void (*v20)(unint64_t);
  uint64_t v21;

  v5 = (_QWORD *)(a2 + 16);
  v6 = (uint64_t *)(a3 + 16);
  v7 = swift_bridgeObjectRetain();
  v8 = sub_2450E8210(v7, v5, v6);
  swift_bridgeObjectRelease();
  if (qword_25744B2C0 != -1)
    swift_once();
  v9 = sub_24510391C();
  __swift_project_value_buffer(v9, (uint64_t)qword_25744B960);
  swift_bridgeObjectRetain_n();
  v10 = sub_245103910();
  v11 = sub_245103AB4();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v13 = swift_slowAlloc();
    v21 = v13;
    *(_DWORD *)v12 = 134218242;
    v20 = a4;
    if (v8 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_245103DE4();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_245103C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    v14 = sub_2450D8184(0, &qword_25744BDD0);
    v15 = swift_bridgeObjectRetain();
    v16 = MEMORY[0x24952E644](v15, v14);
    v18 = v17;
    swift_bridgeObjectRelease();
    sub_245101AB4(v16, v18, &v21);
    sub_245103C28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v10, v11, "Got %ld matchingReminders matching searchTerms {matchingReminders: %s}", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v13, -1, -1);
    MEMORY[0x24952EEE4](v12, -1, -1);

    v20(v8);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    a4(v8);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_2450E8128()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 24);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TTRIntentsHandlerNotificationCenterDataSource()
{
  return objc_opt_self();
}

uint64_t sub_2450E8174()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2450E8198()
{
  swift_release();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2450E81CC(uint64_t a1)
{
  uint64_t v1;

  return sub_2450E7E98(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(void (**)(unint64_t))(v1 + 32));
}

uint64_t sub_2450E81D8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2450E8204(unint64_t a1)
{
  uint64_t v1;

  return sub_2450E6FD0(a1, *(_QWORD *)(v1 + 16), *(void (**)(unint64_t))(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_2450E8210(unint64_t a1, _QWORD *a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  id v26;
  _QWORD *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;

  v4 = a1;
  v36 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_52;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  swift_beginAccess();
  swift_beginAccess();
  if (v5)
  {
    v6 = 0;
    v33 = v4 & 0xFFFFFFFFFFFFFF8;
    v34 = v4 & 0xC000000000000001;
    v31 = v4;
    v32 = v4 + 32;
    v28 = a2;
    v30 = v5;
    while (1)
    {
      if (v34)
      {
        v8 = (id)MEMORY[0x24952E92C](v6, v4);
      }
      else
      {
        if (v6 >= *(_QWORD *)(v33 + 16))
          goto LABEL_49;
        v8 = *(id *)(v32 + 8 * v6);
      }
      v9 = v8;
      v10 = __OFADD__(v6, 1);
      v11 = v6 + 1;
      if (v10)
        goto LABEL_50;
      v35 = v11;
      v12 = *a2;
      swift_bridgeObjectRetain();
      v13 = objc_msgSend(v9, sel_objectID);
      if (v12 >> 62)
      {
        swift_bridgeObjectRetain();
        v14 = sub_245103DE4();
        if (!v14)
          goto LABEL_19;
      }
      else
      {
        v14 = *(_QWORD *)((v12 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v14)
          goto LABEL_19;
      }
      if ((v12 & 0xC000000000000001) != 0)
        v15 = (id)MEMORY[0x24952E92C](0, v12);
      else
        v15 = *(id *)(v12 + 32);
      v16 = v15;
      sub_2450D8184(0, &qword_25744BA20);
      v4 = sub_245103BF8();

      if ((v4 & 1) != 0)
      {

        swift_bridgeObjectRelease_n();
LABEL_41:
        v7 = v30;
        v4 = v31;
        v6 = v35;
        sub_245103D0C();
        sub_245103D30();
        sub_245103D3C();
        sub_245103D18();
        goto LABEL_7;
      }
      if (v14 != 1)
      {
        if ((v12 & 0xC000000000000001) != 0)
        {
          v22 = 1;
          while (1)
          {
            v23 = MEMORY[0x24952E92C](v22, v12);
            a2 = (_QWORD *)(v22 + 1);
            if (__OFADD__(v22, 1))
              break;
            v4 = v23;
            v24 = sub_245103BF8();
            swift_unknownObjectRelease();
            if ((v24 & 1) != 0)
              goto LABEL_39;
            ++v22;
            if (a2 == (_QWORD *)v14)
              goto LABEL_38;
          }
          __break(1u);
LABEL_49:
          __break(1u);
LABEL_50:
          __break(1u);
          goto LABEL_51;
        }
        v25 = 5;
        while (1)
        {
          a2 = (_QWORD *)(v25 - 3);
          if (__OFADD__(v25 - 4, 1))
            break;
          v26 = *(id *)(v12 + 8 * v25);
          v4 = sub_245103BF8();

          if ((v4 & 1) != 0)
          {
LABEL_39:

            swift_bridgeObjectRelease_n();
LABEL_40:
            a2 = v28;
            goto LABEL_41;
          }
          ++v25;
          if (a2 == (_QWORD *)v14)
          {
LABEL_38:

            swift_bridgeObjectRelease();
            a2 = v28;
            goto LABEL_20;
          }
        }
LABEL_51:
        __break(1u);
LABEL_52:
        v5 = sub_245103DE4();
        goto LABEL_3;
      }
LABEL_19:

      swift_bridgeObjectRelease();
LABEL_20:
      swift_bridgeObjectRelease();
      v17 = *a3;
      v18 = *(_QWORD *)(*a3 + 16);
      if (v18)
      {
        swift_bridgeObjectRetain();
        v19 = v17 + 40;
        while (1)
        {
          swift_bridgeObjectRetain();
          v20 = objc_msgSend(v9, sel_titleAsString);
          if (v20)
          {
            v21 = v20;
            sub_245103988();

            LOBYTE(v21) = sub_2451039A0();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v21 & 1) != 0)
            {
              swift_bridgeObjectRelease();
              goto LABEL_40;
            }
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          v19 += 16;
          if (!--v18)
          {

            swift_bridgeObjectRelease();
            a2 = v28;
            goto LABEL_6;
          }
        }
      }

LABEL_6:
      v7 = v30;
      v4 = v31;
      v6 = v35;
LABEL_7:
      if (v6 == v7)
        return v36;
    }
  }
  return MEMORY[0x24BEE4AF8];
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

uint64_t sub_2450E860C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_24510391C();
  __swift_allocate_value_buffer(v0, qword_25744BA38);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25744BA38);
  if (qword_25744B2B0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25744C4D0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_2450E869C(uint64_t a1, void (*a2)(void))
{
  sub_245103760();
  sub_245103754();
  a2();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2450E88EC(unint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;
  id v23[2];

  v23[1] = *(id *)MEMORY[0x24BDAC8D0];
  if (!(a1 >> 62))
  {
    if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
    return MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v22 = sub_245103DE4();
  swift_bridgeObjectRelease();
  if (!v22)
    return MEMORY[0x24BEE4AF8];
LABEL_3:
  v2 = *(void **)(v1 + 16);
  v3 = sub_2450D8184(0, &qword_25744BA20);
  v4 = (void *)sub_2451039E8();
  v23[0] = 0;
  v5 = objc_msgSend(v2, sel_fetchRemindersWithObjectIDs_error_, v4, v23);

  v6 = v23[0];
  if (!v5)
  {
    v10 = v23[0];
    v11 = (void *)sub_2451033A0();

    swift_willThrow();
    if (qword_25744B2C8 != -1)
      swift_once();
    v12 = sub_24510391C();
    __swift_project_value_buffer(v12, (uint64_t)qword_25744BA38);
    swift_bridgeObjectRetain_n();
    v13 = sub_245103910();
    v14 = sub_245103A9C();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = (void *)swift_slowAlloc();
      v23[0] = v16;
      *(_DWORD *)v15 = 136315138;
      v17 = swift_bridgeObjectRetain();
      v18 = MEMORY[0x24952E644](v17, v3);
      v20 = v19;
      swift_bridgeObjectRelease();
      sub_245101AB4(v18, v20, (uint64_t *)v23);
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v13, v14, "Error fetching reminders by objetIDs {objectIDs: %s}", v15, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v16, -1, -1);
      MEMORY[0x24952EEE4](v15, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    return MEMORY[0x24BEE4AF8];
  }
  sub_2450D8184(0, &qword_25744BDD0);
  sub_2450EB1F4();
  v7 = sub_245103934();
  v8 = v6;

  v9 = sub_245102108(v7);
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_2450E8C0C(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v13;

  v6 = sub_24510373C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v13 - v9;
  if (*(_QWORD *)(a1 + 16) <= 1uLL)
  {
    sub_245103760();
    sub_24510370C();
    a2(v10);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  }
  else
  {
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = a2;
    *(_QWORD *)(v11 + 24) = a3;
    swift_retain();
    sub_2450FE980(a1, (uint64_t)sub_2450EB288, v11);
    return swift_release();
  }
}

uint64_t sub_2450E8F38(uint64_t a1, uint64_t a2, void (*a3)(char *))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v4 = sub_24510373C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_245103724();
  a3(v7);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_2450E8FEC(unint64_t a1, void (*a2)(char *), uint64_t a3)
{
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  char *v27;
  uint64_t v28;
  void (*v29)(uint64_t *, _QWORD, uint64_t);
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void (*v37)(unint64_t, uint64_t *, uint64_t);
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  char *v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  unint64_t v54;
  id v55;
  unint64_t v56;
  id v57;
  uint64_t v58;
  NSObject *v59;
  os_log_type_t v60;
  uint8_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  unint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  _QWORD *v70;
  uint64_t v71;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(char *);
  uint64_t v77;
  _QWORD *v78;
  unint64_t v79;
  unsigned int v80;
  unsigned int v81;
  char *v82;
  char *v83;
  unsigned int v84;
  unsigned int v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  uint64_t *v89;
  uint8_t *v90;
  uint64_t v91;
  uint64_t v92;
  unint64_t v93;
  id v94[3];
  uint64_t v95[3];

  v77 = a3;
  v76 = a2;
  v95[1] = *MEMORY[0x24BDAC8D0];
  v75 = sub_24510373C();
  v74 = *(_QWORD *)(v75 - 8);
  MEMORY[0x24BDAC7A8](v75);
  v73 = (char *)&v73 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_2451036D0();
  v90 = *(uint8_t **)(v8 - 8);
  v91 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v83 = (char *)&v73 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v89 = (uint64_t *)((char *)&v73 - v11);
  v93 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v12 = sub_245103DE4();
    v78 = v3;
    if (v12)
      goto LABEL_3;
LABEL_39:
    swift_bridgeObjectRelease();
    v49 = MEMORY[0x24BEE4AF8];
    v15 = MEMORY[0x24BEE4AF8];
    if (MEMORY[0x24BEE4AF8] >> 62)
      goto LABEL_40;
LABEL_28:
    if (*(_QWORD *)((v49 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_29;
LABEL_41:
    v67 = MEMORY[0x24BEE4AF8];
    v5 = MEMORY[0x24BEE4AF8];
    if (*(_QWORD *)(v15 + 16))
      goto LABEL_42;
    goto LABEL_37;
  }
  v12 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v78 = v3;
  if (!v12)
    goto LABEL_39;
LABEL_3:
  if (v12 < 1)
  {
    __break(1u);
LABEL_45:
    swift_once();
LABEL_32:
    v58 = sub_24510391C();
    __swift_project_value_buffer(v58, (uint64_t)qword_25744BA38);
    v59 = sub_245103910();
    v60 = sub_245103A9C();
    if (os_log_type_enabled(v59, v60))
    {
      v61 = (uint8_t *)swift_slowAlloc();
      v62 = swift_slowAlloc();
      v95[0] = v62;
      *(_DWORD *)v61 = 136315138;
      v90 = v61 + 4;
      swift_beginAccess();
      v63 = swift_bridgeObjectRetain();
      v64 = MEMORY[0x24952E644](v63, v12);
      v66 = v65;
      swift_bridgeObjectRelease();
      v92 = sub_245101AB4(v64, v66, v95);
      sub_245103C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v59, v60, "Error fetching lists by objetIDs {objectIDs: %s}", v61, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v62, -1, -1);
      MEMORY[0x24952EEE4](v61, -1, -1);
    }

    v67 = MEMORY[0x24BEE4AF8];
    v15 = v91;
    if (*(_QWORD *)(v91 + 16))
      goto LABEL_42;
LABEL_37:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v68 = v73;
    sub_245103724();
    v76(v68);
    (*(void (**)(char *, uint64_t))(v74 + 8))(v68, v75);
    return swift_bridgeObjectRelease();
  }
  v13 = 0;
  v14 = a1 & 0xC000000000000001;
  v85 = *MEMORY[0x24BE7D800];
  v84 = *MEMORY[0x24BE7D4F8];
  v81 = *MEMORY[0x24BE7D608];
  v80 = *MEMORY[0x24BE7D518];
  v15 = MEMORY[0x24BEE4AF8];
  v82 = "8^B16";
  v79 = 0x800000024510A030;
  v86 = a1 & 0xC000000000000001;
  v87 = v12;
  v88 = a1;
  do
  {
    if (v14)
      v16 = (id)MEMORY[0x24952E92C](v13, a1);
    else
      v16 = *(id *)(a1 + 8 * v13 + 32);
    v17 = v16;
    v18 = (void *)sub_245103A78();
    if (!v18)
    {
      v20 = objc_msgSend(v17, sel_title);
      v21 = objc_msgSend(v20, sel_spokenPhrase);

      v22 = sub_245103988();
      v24 = v23;

      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD10);
      v26 = v89;
      v27 = (char *)v89 + *(int *)(v25 + 48);
      *v89 = v22;
      v26[1] = v24;
      v28 = sub_2451037A8();
      (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v28 - 8) + 104))(v27, v85, v28);
      v29 = (void (*)(uint64_t *, _QWORD, uint64_t))*((_QWORD *)v90 + 13);
      v29(v26, v84, v91);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v15 = sub_245101774(0, *(_QWORD *)(v15 + 16) + 1, 1, v15);
      v31 = *(_QWORD *)(v15 + 16);
      v30 = *(_QWORD *)(v15 + 24);
      if (v31 >= v30 >> 1)
        v15 = sub_245101774(v30 > 1, v31 + 1, 1, v15);
      *(_QWORD *)(v15 + 16) = v31 + 1;
      v32 = (v90[80] + 32) & ~(unint64_t)v90[80];
      v33 = v15;
      v34 = v15 + v32;
      v35 = *((_QWORD *)v90 + 9);
      v36 = v34 + v35 * v31;
      v37 = (void (*)(unint64_t, uint64_t *, uint64_t))*((_QWORD *)v90 + 4);
      v37(v36, v89, v91);
      v38 = objc_msgSend(v17, sel_title);
      v39 = objc_msgSend(v38, sel_vocabularyIdentifier);

      if (v39)
      {
        v40 = sub_245103988();
        v42 = v41;

        if (v40 == 0xD000000000000011 && v42 == v79)
        {
          swift_bridgeObjectRelease();
LABEL_24:
          v44 = sub_245103700();
          v45 = v83;
          (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v44 - 8) + 104))(v83, v81, v44);
          v29((uint64_t *)v45, v80, v91);
          v47 = *(_QWORD *)(v33 + 16);
          v46 = *(_QWORD *)(v33 + 24);
          if (v47 >= v46 >> 1)
            v33 = sub_245101774(v46 > 1, v47 + 1, 1, v33);
          *(_QWORD *)(v33 + 16) = v47 + 1;
          v48 = v33 + v32 + v47 * v35;
          v15 = v33;
          v37(v48, (uint64_t *)v83, v91);
          goto LABEL_6;
        }
        v43 = sub_245103E38();
        swift_bridgeObjectRelease();
        if ((v43 & 1) != 0)
          goto LABEL_24;
      }
      v15 = v33;
LABEL_6:
      v12 = v87;
      a1 = v88;
      v14 = v86;
      goto LABEL_7;
    }
    v19 = v18;
    MEMORY[0x24952E620]();
    if (*(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v93 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_245103A18();
    sub_245103A24();
    sub_245103A0C();

    v17 = v19;
LABEL_7:
    ++v13;

  }
  while (v12 != v13);
  swift_bridgeObjectRelease();
  v49 = v93;
  v3 = v78;
  if (!(v93 >> 62))
    goto LABEL_28;
LABEL_40:
  swift_bridgeObjectRetain();
  v69 = sub_245103DE4();
  swift_bridgeObjectRelease();
  if (!v69)
    goto LABEL_41;
LABEL_29:
  v50 = (void *)v3[2];
  v12 = sub_2450D8184(0, &qword_25744BA20);
  swift_bridgeObjectRetain();
  v51 = (void *)sub_2451039E8();
  swift_bridgeObjectRelease();
  v94[0] = 0;
  v52 = objc_msgSend(v50, sel_fetchListsWithObjectIDs_error_, v51, v94);

  v53 = v94[0];
  if (!v52)
  {
    v91 = v15;
    v57 = v94[0];
    v4 = (void *)sub_2451033A0();

    swift_willThrow();
    v5 = MEMORY[0x24BEE4AF8];
    if (qword_25744B2C8 == -1)
      goto LABEL_32;
    goto LABEL_45;
  }
  sub_2450D8184(0, (unint64_t *)&qword_25744B5B0);
  sub_2450EB1F4();
  v54 = sub_245103934();
  v55 = v53;

  v5 = sub_2451020F4(v54);
  swift_bridgeObjectRelease();
  swift_retain();
  v56 = swift_bridgeObjectRetain();
  v67 = sub_2450EAA40(v56, v3);
  swift_bridgeObjectRelease();
  swift_release();
  if (!*(_QWORD *)(v15 + 16))
    goto LABEL_37;
LABEL_42:
  v70 = (_QWORD *)swift_allocObject();
  v71 = v77;
  v70[2] = v76;
  v70[3] = v71;
  v70[4] = v5;
  v70[5] = v15;
  v70[6] = v67;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_2450FE980(v15, (uint64_t)sub_2450EB1E4, (uint64_t)v70);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2450E9914(unint64_t a1, unint64_t a2, void (*a3)(char *), uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v18;
  unint64_t v19;

  v13 = sub_24510373C();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v18 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2450EBF68(a5);
  sub_2450F8078(a6, v19);
  swift_bridgeObjectRelease();
  v19 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_2450EBF5C(a7);
  sub_245103724();
  a3(v16);
  return (*(uint64_t (**)(char *, uint64_t))(v14 + 8))(v16, v13);
}

uint64_t sub_2450E9A30(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v3;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[6];

  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = MEMORY[0x24BEE4AF8];
  v8 = *(void **)(v3 + 16);
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = a1;
  v9[3] = a2;
  v9[4] = v7;
  v13[4] = sub_2450EB17C;
  v13[5] = v9;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 1107296256;
  v13[2] = sub_2450EA4D4;
  v13[3] = &block_descriptor_1;
  v10 = _Block_copy(v13);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_release();
  objc_msgSend(v8, sel_enumerateAllListsWithBlock_, v10);
  _Block_release(v10);
  swift_beginAccess();
  v11 = swift_bridgeObjectRetain();
  a3(v11);
  swift_release();
  return swift_bridgeObjectRelease();
}

id sub_2450E9B84(SEL *a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  double v10;
  uint64_t v11;
  char *v12;
  id result;
  _QWORD *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  SEL *v21;
  void *v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  char v40;
  SEL *v41;
  _QWORD *v42;
  SEL *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  _QWORD *v49;
  SEL *v50;
  _QWORD *v51;
  uint64_t v52;
  uint64_t v53;

  v9 = sub_24510391C();
  v52 = *(_QWORD *)(v9 - 8);
  v53 = v9;
  v10 = MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = -[SEL isShared](a1, sel_isShared, v10);
  if (!(_DWORD)result)
    return result;
  v14 = (_QWORD *)(a5 + 16);
  v15 = -[SEL sharedOwnerAddress](a1, sel_sharedOwnerAddress);
  if (v15)
  {
    v16 = v15;
    v17 = sub_245103988();
    v19 = v18;

    if ((sub_2450EA0C0(v17, v19, (uint64_t)a3) & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      v20 = sub_2450EA0C0(v17, v19, a4);
      swift_bridgeObjectRelease();
      if ((v20 & 1) == 0)
        goto LABEL_10;
    }
    if (-[SEL isShared](a1, sel_isShared))
    {
      swift_beginAccess();
      v21 = a1;
      MEMORY[0x24952E620]();
      if (*(_QWORD *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v14 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
        sub_245103A18();
      sub_245103A24();
      sub_245103A0C();
      swift_endAccess();
    }
  }
LABEL_10:
  result = -[SEL shareeContext](a1, sel_shareeContext);
  if (result)
  {
    v22 = result;
    v48 = a4;
    v23 = objc_msgSend(result, sel_sharees);

    sub_2450D8184(0, &qword_25744BB58);
    v24 = sub_2451039F4();

    if (v24 >> 62)
      goto LABEL_38;
    v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    while (1)
    {
      v49 = a3;
      v50 = a1;
      v51 = v14;
      if (!v25)
        break;
      v47 = v12;
      v12 = (char *)(v24 & 0xC000000000000001);
      a3 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v26 = 4;
      a1 = (SEL *)&selRef_region;
      while (2)
      {
        if (v12)
          v27 = (id)MEMORY[0x24952E92C](v26 - 4, v24);
        else
          v27 = *(id *)(v24 + 8 * v26);
        v28 = v27;
        v14 = (_QWORD *)(v26 - 3);
        if (!__OFADD__(v26 - 4, 1))
        {
          switch((unint64_t)objc_msgSend(v27, a1[8]))
          {
            case 0uLL:
            case 2uLL:
            case 3uLL:
            case 4uLL:
              goto LABEL_15;
            case 1uLL:
            case 5uLL:
              v29 = objc_msgSend(v28, sel_address);
              if (v29)
              {
                v30 = v29;
                sub_245103988();

                v31 = (void *)sub_245103964();
                swift_bridgeObjectRelease();
                v32 = objc_msgSend(v31, sel_rem_removingMailto);

                v33 = sub_245103988();
                v35 = v34;

                if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                  a3 = sub_245101788(0, a3[2] + 1, 1, a3);
                v37 = a3[2];
                v36 = a3[3];
                if (v37 >= v36 >> 1)
                  a3 = sub_245101788((_QWORD *)(v36 > 1), v37 + 1, 1, a3);
                a3[2] = v37 + 1;
                v38 = &a3[2 * v37];
                v38[4] = v33;
                v38[5] = v35;
                a1 = (SEL *)&selRef_region;
              }
              else
              {
LABEL_15:

              }
              ++v26;
              if (v14 != (_QWORD *)v25)
                continue;
              goto LABEL_29;
            default:
              if (qword_25744B2C8 != -1)
                swift_once();
              v44 = v53;
              v45 = __swift_project_value_buffer(v53, (uint64_t)qword_25744BA38);
              (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v47, v45, v44);
              v46 = MEMORY[0x24BEE4AF8];
              sub_2450ED6B4(MEMORY[0x24BEE4AF8]);
              sub_2450ED6B4(v46);
              sub_2450E645C((uint64_t)"unknown status", 14, 2);
              __break(1u);
              JUMPOUT(0x2450EA0A8);
          }
        }
        break;
      }
      __break(1u);
LABEL_38:
      swift_bridgeObjectRetain_n();
      v25 = sub_245103DE4();
      swift_bridgeObjectRelease();
    }
    a3 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_29:
    swift_bridgeObjectRelease_n();
    v39 = sub_2450EAC0C((uint64_t)a3);
    swift_bridgeObjectRelease();
    if ((sub_2450EA1F4(v39, (uint64_t)v49) & 1) != 0)
    {
      v40 = sub_2450EA1F4(v39, v48);
      result = (id)swift_bridgeObjectRelease();
      v41 = v50;
      v42 = v51;
      if ((v40 & 1) != 0)
        return result;
    }
    else
    {
      swift_bridgeObjectRelease();
      v41 = v50;
      v42 = v51;
    }
    swift_beginAccess();
    v43 = v41;
    MEMORY[0x24952E620]();
    if (*(_QWORD *)((*v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_245103A18();
    sub_245103A24();
    sub_245103A0C();
    return (id)swift_endAccess();
  }
  return result;
}

uint64_t sub_2450EA0C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_245103E68();
    sub_2451039B8();
    v6 = sub_245103E74();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_245103E38() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_245103E38() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_2450EA1F4(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  BOOL v26;
  uint64_t v27;
  _QWORD *v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  uint64_t v33;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 1;
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return 1;
  if (v2 >= v3)
    v4 = a1;
  else
    v4 = a2;
  if (v2 >= v3)
    v5 = a2;
  else
    v5 = a1;
  v32 = v4;
  v33 = v4 + 56;
  v6 = -1 << *(_BYTE *)(v4 + 32);
  if (-v6 < 64)
    v7 = ~(-1 << -(char)v6);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v4 + 56);
  v31 = (unint64_t)(63 - v6) >> 6;
  v9 = v5 + 56;
  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRetain();
  v11 = 0;
  while (1)
  {
    while (1)
    {
      v12 = v11;
      if (!v8)
        break;
      v13 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v14 = v13 | (v11 << 6);
      if (*(_QWORD *)(v5 + 16))
        goto LABEL_31;
    }
    v15 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_50;
    }
    if (v15 >= v31)
      goto LABEL_48;
    v16 = *(_QWORD *)(v33 + 8 * v15);
    ++v11;
    if (!v16)
    {
      v11 = v12 + 2;
      if (v12 + 2 >= v31)
        goto LABEL_48;
      v16 = *(_QWORD *)(v33 + 8 * v11);
      if (!v16)
      {
        v11 = v12 + 3;
        if (v12 + 3 >= v31)
          goto LABEL_48;
        v16 = *(_QWORD *)(v33 + 8 * v11);
        if (!v16)
          break;
      }
    }
LABEL_30:
    v8 = (v16 - 1) & v16;
    v14 = __clz(__rbit64(v16)) + (v11 << 6);
    if (*(_QWORD *)(v5 + 16))
    {
LABEL_31:
      v18 = (uint64_t *)(*(_QWORD *)(v32 + 48) + 16 * v14);
      v20 = *v18;
      v19 = v18[1];
      sub_245103E68();
      swift_bridgeObjectRetain();
      sub_2451039B8();
      v21 = sub_245103E74();
      v22 = -1 << *(_BYTE *)(v5 + 32);
      v23 = v21 & ~v22;
      if (((*(_QWORD *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) != 0)
      {
        v24 = *(_QWORD *)(v5 + 48);
        v25 = (_QWORD *)(v24 + 16 * v23);
        v26 = *v25 == v20 && v25[1] == v19;
        if (v26 || (sub_245103E38() & 1) != 0)
        {
LABEL_44:
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          v30 = 0;
LABEL_45:
          sub_2450EB1A0();
          return v30;
        }
        v27 = ~v22;
        while (1)
        {
          v23 = (v23 + 1) & v27;
          if (((*(_QWORD *)(v9 + ((v23 >> 3) & 0xFFFFFFFFFFFFF8)) >> v23) & 1) == 0)
            break;
          v28 = (_QWORD *)(v24 + 16 * v23);
          v29 = *v28 == v20 && v28[1] == v19;
          if (v29 || (sub_245103E38() & 1) != 0)
            goto LABEL_44;
        }
      }
      result = swift_bridgeObjectRelease();
    }
  }
  v17 = v12 + 4;
  if (v12 + 4 >= v31)
  {
LABEL_48:
    swift_bridgeObjectRelease();
    v30 = 1;
    goto LABEL_45;
  }
  v16 = *(_QWORD *)(v33 + 8 * v17);
  if (v16)
  {
    v11 = v12 + 4;
    goto LABEL_30;
  }
  while (1)
  {
    v11 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v11 >= v31)
      goto LABEL_48;
    v16 = *(_QWORD *)(v33 + 8 * v11);
    ++v17;
    if (v16)
      goto LABEL_30;
  }
LABEL_50:
  __break(1u);
  return result;
}

void sub_2450EA4D4(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id sub_2450EA530()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  id v13[2];

  v13[1] = *(id *)MEMORY[0x24BDAC8D0];
  v1 = *(void **)(v0 + 16);
  v13[0] = 0;
  v2 = objc_msgSend(v1, sel_fetchDefaultListWithError_, v13);
  if (v13[0])
  {
    v3 = v13[0];

    swift_willThrow();
    if (qword_25744B2C8 != -1)
      swift_once();
    v4 = sub_24510391C();
    __swift_project_value_buffer(v4, (uint64_t)qword_25744BA38);
    v5 = v3;
    v6 = sub_245103910();
    v7 = sub_245103A9C();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = (void *)swift_slowAlloc();
      v13[0] = v9;
      *(_DWORD *)v8 = 136315138;
      swift_getErrorValue();
      v10 = sub_245103E50();
      sub_245101AB4(v10, v11, (uint64_t *)v13);
      sub_245103C28();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v6, v7, "Error fetching default list %s", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v9, -1, -1);
      MEMORY[0x24952EEE4](v8, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v2;
}

uint64_t sub_2450EA750(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];

  v14[0] = a1;
  v1 = sub_2451037CC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_245103850();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BB50);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v14 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24510385C();
  sub_2451037C0();
  sub_2451037B4();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  sub_245103844();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  v12 = sub_245103838();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v11, 0, 1, v12);
  ((void (*)(char *))v14[0])(v11);
  return sub_2450EB0E4((uint64_t)v11);
}

uint64_t sub_2450EA918()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TTRIntentsHandlerStoreDataSource()
{
  return objc_opt_self();
}

uint64_t sub_2450EA95C(unint64_t a1)
{
  return sub_2450E88EC(a1);
}

uint64_t sub_2450EA97C(uint64_t a1, void (*a2)(void))
{
  return sub_2450E869C(a1, a2);
}

uint64_t sub_2450EA99C(uint64_t a1, void (*a2)(char *), uint64_t a3)
{
  return sub_2450E8C0C(a1, a2, a3);
}

uint64_t sub_2450EA9BC(unint64_t a1, void (*a2)(char *), uint64_t a3)
{
  return sub_2450E8FEC(a1, a2, a3);
}

uint64_t sub_2450EA9DC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return sub_2450E9A30(a1, a2, a3);
}

id sub_2450EA9FC()
{
  return sub_2450EA530();
}

uint64_t sub_2450EAA1C(uint64_t a1)
{
  return sub_2450EA750(a1);
}

uint64_t sub_2450EAA40(unint64_t a1, _QWORD *a2)
{
  IMP *v2;
  IMP *p_imp;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  IMP *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  p_imp = v2;
  v16 = *MEMORY[0x24BDAC8D0];
  if (a1 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x24BEE4AF8];
    if (!v6)
      break;
    v15 = MEMORY[0x24BEE4AF8];
    sub_245103D24();
    if (v6 < 0)
      __break(1u);
    v13 = p_imp;
    v8 = 0;
    a2 = (_QWORD *)a2[2];
    p_imp = &stru_251606FF0.imp;
    while (v6 != v8)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x24952E92C](v8, a1);
      else
        v9 = *(id *)(a1 + 8 * v8 + 32);
      v10 = v9;
      v14 = 0;
      if (!objc_msgSend(a2, sel_fetchCustomSmartListWithObjectID_error_, v9, &v14, v13))
      {
        v12 = v14;
        sub_2451033A0();

        swift_willThrow();
        return swift_release();
      }
      ++v8;
      v11 = v14;

      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
      if (v6 == v8)
        return v15;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v6 = sub_245103DE4();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2450EAC0C(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  result = sub_245103A30();
  v8 = result;
  if (v2)
  {
    v4 = (uint64_t *)(a1 + 40);
    do
    {
      v5 = *(v4 - 1);
      v6 = *v4;
      swift_bridgeObjectRetain();
      sub_2450F8740(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_2450EACA0(uint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v7 = sub_24510373C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v15 - v10;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a3;
  *(_QWORD *)(v12 + 24) = a4;
  if (*(_QWORD *)(a1 + 16) < 2uLL)
  {
    sub_245103760();
    swift_retain();
    sub_24510370C();
    a3(v11);
    (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
  }
  else
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = sub_2450EB24C;
    *(_QWORD *)(v13 + 24) = v12;
    swift_retain();
    swift_retain();
    sub_2450FE980(a1, sub_2450EB278, v13);
    swift_release();
  }
  return swift_release();
}

uint64_t sub_2450EB01C(void (*a1)(uint64_t))
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BB48);
  v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_245104B80;
  v3 = (void *)*MEMORY[0x24BE7D360];
  v4 = (void *)*MEMORY[0x24BE7D348];
  *(_QWORD *)(v2 + 32) = *MEMORY[0x24BE7D360];
  *(_QWORD *)(v2 + 40) = v4;
  v5 = (void *)*MEMORY[0x24BE7D328];
  v6 = (void *)*MEMORY[0x24BE7D340];
  *(_QWORD *)(v2 + 48) = *MEMORY[0x24BE7D328];
  *(_QWORD *)(v2 + 56) = v6;
  v7 = (void *)*MEMORY[0x24BE7D330];
  *(_QWORD *)(v2 + 64) = *MEMORY[0x24BE7D330];
  v8 = v3;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  a1(v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2450EB0E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BB50);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2450EB124()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2450EB148()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

id sub_2450EB17C(SEL *a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2450E9B84(a1, a2, *(_QWORD **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
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

uint64_t sub_2450EB1A0()
{
  return swift_release();
}

uint64_t sub_2450EB1A8()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2450EB1E4(unint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_2450E9914(a1, a2, *(void (**)(char *))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

unint64_t sub_2450EB1F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25744BB60;
  if (!qword_25744BB60)
  {
    v1 = sub_2450D8184(255, &qword_25744BA20);
    result = MEMORY[0x24952EE3C](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_25744BB60);
  }
  return result;
}

uint64_t sub_2450EB24C(uint64_t a1)
{
  uint64_t v1;

  return sub_2450EBA44(a1, *(uint64_t (**)(void))(v1 + 16));
}

uint64_t sub_2450EB254()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2450EB278(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2450E8F38(a1, a2, *(void (**)(char *))(v2 + 16));
}

void sub_2450EB28C(unint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  uint64_t v46;
  unsigned int v47;
  unsigned int v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v43 = a6;
  v42 = a5;
  v49 = sub_2451036D0();
  v10 = *(_QWORD *)(v49 - 8);
  MEMORY[0x24BDAC7A8](v49);
  v12 = (uint64_t *)((char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v52 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v13 = sub_245103DE4();
  }
  else
  {
    v13 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v45 = a3;
  v46 = a4;
  v41 = a2;
  if (v13)
  {
    if (v13 < 1)
    {
      __break(1u);
      return;
    }
    v14 = 0;
    v50 = a1 & 0xC000000000000001;
    v48 = *MEMORY[0x24BE7D800];
    v47 = *MEMORY[0x24BE7D4F8];
    v15 = MEMORY[0x24BEE4AF8];
    do
    {
      if (v50)
        v18 = (id)MEMORY[0x24952E92C](v14, a1);
      else
        v18 = *(id *)(a1 + 8 * v14 + 32);
      v17 = v18;
      v19 = (void *)sub_245103B68();
      if (v19)
      {
        v16 = v19;
        MEMORY[0x24952E620]();
        if (*(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v52 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_245103A18();
        sub_245103A24();
        sub_245103A0C();

        v17 = v16;
      }
      else
      {
        v20 = objc_msgSend(v17, sel_title);
        v21 = objc_msgSend(v20, sel_spokenPhrase);

        v22 = sub_245103988();
        v24 = v23;

        v25 = (char *)v12 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25744BD10) + 48);
        *v12 = v22;
        v12[1] = v24;
        v26 = sub_2451037A8();
        (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v25, v48, v26);
        (*(void (**)(uint64_t *, _QWORD, uint64_t))(v10 + 104))(v12, v47, v49);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v15 = sub_245101774(0, *(_QWORD *)(v15 + 16) + 1, 1, v15);
        v28 = *(_QWORD *)(v15 + 16);
        v27 = *(_QWORD *)(v15 + 24);
        if (v28 >= v27 >> 1)
          v15 = sub_245101774(v27 > 1, v28 + 1, 1, v15);
        *(_QWORD *)(v15 + 16) = v28 + 1;
        (*(void (**)(unint64_t, uint64_t *, uint64_t))(v10 + 32))(v15+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(_QWORD *)(v10 + 72) * v28, v12, v49);
      }
      ++v14;

    }
    while (v13 != v14);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    v15 = MEMORY[0x24BEE4AF8];
  }
  v29 = v43;
  v30 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v43 + 8);
  v31 = swift_bridgeObjectRetain();
  v32 = v44;
  v33 = v42;
  v34 = v30(v31, v42, v29);
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v15 + 16))
  {
    v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BBB8);
    MEMORY[0x24BDAC7A8](v35);
    *(&v40 - 4) = v33;
    *(&v40 - 3) = v29;
    v36 = v41;
    *(&v40 - 2) = v32;
    *(&v40 - 1) = v36;
    swift_bridgeObjectRetain();
    v37 = sub_2450FE864((void (*)(uint64_t *__return_ptr, uint64_t))sub_2450ECD60, (uint64_t)(&v40 - 6), v15);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v51 = v37;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744BBC0);
    sub_2450ECDC8(&qword_25744BBC8, &qword_25744BBC0);
    sub_2451038B0();
    swift_bridgeObjectRelease();
    v38 = (_QWORD *)swift_allocObject();
    v38[2] = v45;
    v38[3] = v46;
    v38[4] = v34;
    swift_retain();
    v39 = (void *)sub_245103898();
    sub_2451038C8();
    swift_release();
    swift_release();
    swift_release();

  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v45(v34);
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2450EB728@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744B8D0);
  v3 = sub_2451036D0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_245104860;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v4 + 16))(v6 + v5, a1, v3);
  swift_bridgeObjectRetain();
  sub_2450EBF74(v6);
  v7 = sub_2450EB858();
  result = swift_bridgeObjectRelease();
  *a2 = v7;
  return result;
}

uint64_t sub_2450EB858()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BBB8);
  swift_allocObject();
  return sub_2451038EC();
}

uint64_t sub_2450EB8AC(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v11;

  v6 = MEMORY[0x24BEE4AF8];
  v11 = MEMORY[0x24BEE4AF8];
  v7 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  if (v7)
  {
    swift_bridgeObjectRetain();
    for (i = 0; i != v7; ++i)
    {
      v9 = swift_bridgeObjectRetain();
      sub_2450EC0F4(v9, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_2450EC6D8);
    }
    swift_bridgeObjectRelease();
    v6 = v11;
  }
  swift_bridgeObjectRetain();
  sub_2450EC0F4(v6, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_2450EC6D8);
  a2(a4);
  return swift_bridgeObjectRelease();
}

uint64_t sub_2450EB98C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t);

  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a1;
  *(_QWORD *)(v13 + 24) = a2;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = sub_2450DE0A4;
  *(_QWORD *)(v14 + 24) = v13;
  v15 = *(void (**)(uint64_t, uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a8 + 24);
  swift_retain();
  v15(a6, sub_2450ECD34, v14, a7, a8);
  return swift_release();
}

uint64_t sub_2450EBA44(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

uint64_t sub_2450EBA64(uint64_t a1, uint64_t a2)
{
  return sub_2450EBB0C(a1, a2, &qword_25744BB98);
}

uint64_t sub_2450EBA78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  void (*v12)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  v12 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a7 + 80);
  swift_retain();
  v12(sub_2450ECD34, v11, a6, a7);
  return swift_release();
}

uint64_t sub_2450EBAF8(uint64_t a1, uint64_t a2)
{
  return sub_2450EBB0C(a1, a2, &qword_25744BBA0);
}

uint64_t sub_2450EBB0C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  swift_allocObject();
  return sub_2451038EC();
}

uint64_t sub_2450EBB5C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t (*)(), uint64_t, uint64_t, uint64_t);

  v11 = swift_allocObject();
  *(_QWORD *)(v11 + 16) = a1;
  *(_QWORD *)(v11 + 24) = a2;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = sub_2450DE0A4;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = *(void (**)(uint64_t (*)(), uint64_t, uint64_t, uint64_t))(a7 + 88);
  swift_retain();
  v13(sub_2450ECE14, v12, a6, a7);
  return swift_release();
}

uint64_t sub_2450EBC00(uint64_t *a1, void (*a2)(uint64_t, uint64_t), uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(char *, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t, uint64_t);
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v4 = v3;
  v8 = sub_24510373C();
  v36 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v29 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *a1;
  v37 = MEMORY[0x24BEE4AF8];
  v13 = *(_QWORD *)(v12 + 16);
  if (v13)
  {
    v31 = a3;
    v32 = a2;
    v33 = v4;
    v34 = v12;
    v14 = v12 + ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80));
    v35 = *(_QWORD *)(v36 + 72);
    v15 = *(void (**)(char *, uint64_t, uint64_t))(v36 + 16);
    v16 = v9;
    swift_bridgeObjectRetain();
    v17 = v14;
    v30 = v13;
    v18 = v13;
    do
    {
      v15(v11, v17, v16);
      v19 = v15;
      v20 = v16;
      v21 = sub_245103730();
      v22 = *(void (**)(char *, uint64_t))(v36 + 8);
      v22(v11, v20);
      v23 = v21;
      v16 = v20;
      sub_2450EC0F4(v23, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_2450EC4C4);
      v17 += v35;
      --v18;
    }
    while (v18);
    swift_bridgeObjectRelease();
    v36 = v37;
    v37 = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRetain();
    v24 = v35;
    v25 = v30;
    do
    {
      v15(v11, v14, v16);
      v26 = sub_245103718();
      v22(v11, v20);
      v27 = v26;
      v16 = v20;
      sub_2450EC0F4(v27, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_2450EC2B0);
      v15 = v19;
      v14 += v24;
      --v25;
    }
    while (v25);
    swift_bridgeObjectRelease();
    v32(v36, v37);
  }
  else
  {
    a2(MEMORY[0x24BEE4AF8], MEMORY[0x24BEE4AF8]);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2450EBE0C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  int64_t v5;
  _QWORD *isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  int64_t v14;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD **)v1;
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = (_QWORD *)swift_isUniquelyReferenced_nonNull_native();
  if ((_DWORD)isUniquelyReferenced_nonNull_native && v5 <= v3[3] >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v14 = v4 + v2;
  else
    v14 = v4;
  v3 = sub_245101788(isUniquelyReferenced_nonNull_native, v14, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = v3[2];
  if ((v3[3] >> 1) - v8 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v9 = (unint64_t)&v3[2 * v8 + 4];
  if (a1 + 32 < v9 + 16 * v2 && v9 < a1 + 32 + 16 * v2)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *(_QWORD *)v1 = v3;
    return result;
  }
  v11 = v3[2];
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    v3[2] = v13;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_245103DFC();
  __break(1u);
  return result;
}

uint64_t sub_2450EBF5C(unint64_t a1)
{
  return sub_2450EC0F4(a1, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_2450EC2B0);
}

uint64_t sub_2450EBF68(unint64_t a1)
{
  return sub_2450EC0F4(a1, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_2450EC4C4);
}

uint64_t sub_2450EBF74(uint64_t a1)
{
  unint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  int64_t v23;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (isUniquelyReferenced_nonNull_native && v5 <= *(_QWORD *)(v3 + 24) >> 1)
  {
    if (*(_QWORD *)(a1 + 16))
      goto LABEL_5;
    goto LABEL_18;
  }
  if (v4 <= v5)
    v23 = v4 + v2;
  else
    v23 = v4;
  v3 = sub_245101774(isUniquelyReferenced_nonNull_native, v23, 1, v3);
  if (!*(_QWORD *)(a1 + 16))
  {
LABEL_18:
    if (!v2)
      goto LABEL_19;
    goto LABEL_21;
  }
LABEL_5:
  v8 = *(_QWORD *)(v3 + 16);
  v9 = (*(_QWORD *)(v3 + 24) >> 1) - v8;
  v10 = sub_2451036D0();
  if (v9 < v2)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v11 = *(_QWORD *)(v10 - 8);
  v12 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v13 = *(_QWORD *)(v11 + 72);
  v14 = v3 + v12 + v13 * v8;
  v15 = a1 + v12;
  v16 = v13 * v2;
  v17 = v14 + v16;
  v18 = v15 + v16;
  if (v15 < v17 && v14 < v18)
    goto LABEL_24;
  swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_19:
    result = swift_bridgeObjectRelease();
    *v1 = v3;
    return result;
  }
  v20 = *(_QWORD *)(v3 + 16);
  v21 = __OFADD__(v20, v2);
  v22 = v20 + v2;
  if (!v21)
  {
    *(_QWORD *)(v3 + 16) = v22;
    goto LABEL_19;
  }
LABEL_23:
  __break(1u);
LABEL_24:
  result = sub_245103DFC();
  __break(1u);
  return result;
}

uint64_t sub_2450EC0DC(unint64_t a1)
{
  return sub_2450EC0F4(a1, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_2450EC8EC);
}

uint64_t sub_2450EC0E8(unint64_t a1)
{
  return sub_2450EC0F4(a1, (uint64_t (*)(uint64_t, _QWORD, unint64_t))sub_2450ECB00);
}

uint64_t sub_2450EC0F4(unint64_t a1, uint64_t (*a2)(uint64_t, _QWORD, unint64_t))
{
  unint64_t *v2;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_245103DE4();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v6 = *v2;
  if (*v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_245103DE4();
    swift_bridgeObjectRelease();
    v8 = v7 + v5;
    if (!__OFADD__(v7, v5))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  v8 = v7 + v5;
  if (__OFADD__(v7, v5))
    goto LABEL_23;
LABEL_5:
  v6 = *v2;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v2 = v6;
  v7 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
  {
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
    if (v8 <= *(_QWORD *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v7 = 1;
  }
  if (v6 >> 62)
    goto LABEL_25;
  v11 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v11 <= v8)
      v11 = v8;
    swift_bridgeObjectRetain();
    v6 = MEMORY[0x24952E938](v7, v11, 1, v6);
    swift_bridgeObjectRelease();
    *v2 = v6;
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = a2(v10 + 8 * *(_QWORD *)(v10 + 16) + 32, (*(_QWORD *)(v10 + 24) >> 1) - *(_QWORD *)(v10 + 16), a1);
    if (v13 >= v5)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v11 = sub_245103DE4();
    swift_bridgeObjectRelease();
  }
  if (v13 < 1)
    goto LABEL_19;
  v14 = *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v15 = __OFADD__(v14, v13);
  v16 = v14 + v13;
  if (!v15)
  {
    *(_QWORD *)((*v2 & 0xFFFFFFFFFFFFFF8) + 0x10) = v16;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_245103A0C();
  }
  __break(1u);
  return result;
}

uint64_t sub_2450EC2B0(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2450ECDC8(&qword_25744BB78, &qword_25744BB70);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744BB70);
          v12 = sub_245102324(v16, i, a3);
          v14 = *v13;
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2450D8184(0, &qword_25744BB68);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_245103DFC();
  __break(1u);
  return result;
}

uint64_t sub_2450EC4C4(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2450ECDC8(&qword_25744BB80, &qword_25744B698);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744B698);
          v12 = sub_245102324(v16, i, a3);
          v14 = *v13;
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2450D8184(0, (unint64_t *)&qword_25744B5B0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_245103DFC();
  __break(1u);
  return result;
}

uint64_t sub_2450EC6D8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2450ECDC8(&qword_25744BBD8, &qword_25744BBD0);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744BBD0);
          v12 = sub_245102324(v16, i, a3);
          v14 = *v13;
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2450D8184(0, &qword_25744BDD0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_245103DFC();
  __break(1u);
  return result;
}

uint64_t sub_2450EC8EC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2450ECDC8(&qword_25744BBB0, &qword_25744BBA8);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744BBA8);
          v12 = sub_245102324(v16, i, a3);
          v14 = *v13;
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2450D8184(0, &qword_25744B5B8);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_245103DFC();
  __break(1u);
  return result;
}

uint64_t sub_2450ECB00(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  uint64_t (*v12)();
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_2450ECDC8(&qword_25744BB90, &qword_25744BB88);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744BB88);
          v12 = sub_24510237C(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_2451036AC();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_245103DFC();
  __break(1u);
  return result;
}

uint64_t sub_2450ECD04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_2450EBA78(a1, a2, a3, a4, v4[4], v4[2], v4[3]);
}

uint64_t sub_2450ECD10()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2450ECD34()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_2450ECD54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_2450EBB5C(a1, a2, a3, a4, v4[4], v4[2], v4[3]);
}

uint64_t sub_2450ECD60@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_2450EB728(a1, a2);
}

uint64_t sub_2450ECD80()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2450ECDAC(uint64_t a1)
{
  uint64_t v1;

  return sub_2450EB8AC(a1, *(void (**)(uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_2450ECDC8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x24952EE3C](MEMORY[0x24BEE12E0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2450ECE08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;

  return sub_2450EB98C(a1, a2, a3, a4, v4[4], v4[5], v4[2], v4[3]);
}

uint64_t sub_2450ECE28()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_24510391C();
  __swift_allocate_value_buffer(v0, qword_25744BBE0);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25744BBE0);
  if (qword_25744B2B0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25744C4D0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_2450ECEB8(void *a1, uint64_t a2, uint64_t a3)
{
  sub_2450ECEF0(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_timeProvider, 0x24BDD9BC8, &qword_25744BC08);
}

void sub_2450ECED4(void *a1, uint64_t a2, uint64_t a3)
{
  sub_2450ECEF0(a1, a2, a3, (uint64_t)&OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_timeProvider, 0x24BDDA138, &qword_25744BBF8);
}

void sub_2450ECEF0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t *a6)
{
  uint64_t v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  IMP *p_imp;
  uint8_t *v14;
  unint64_t *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  id v30;
  uint8_t *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  NSObject *v35;
  os_log_type_t v36;
  uint8_t *v37;
  id v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  id v46;
  uint64_t v47;
  _QWORD *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;

  if (qword_25744B2D0 != -1)
    swift_once();
  v9 = sub_24510391C();
  __swift_project_value_buffer(v9, (uint64_t)qword_25744BBE0);
  v10 = a1;
  v11 = sub_245103910();
  v12 = sub_245103AB4();
  p_imp = &stru_251606FF0.imp;
  if (os_log_type_enabled(v11, v12))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    v47 = swift_slowAlloc();
    v51 = v47;
    *(_DWORD *)v14 = 136315138;
    v15 = a6;
    v16 = objc_msgSend(v10, sel_temporalEventTrigger);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744BC00);
    v17 = sub_245103C1C();
    v50 = a3;
    v19 = v18;

    a6 = v15;
    v20 = v17;
    p_imp = (IMP *)(&stru_251606FF0 + 16);
    sub_245101AB4(v20, v19, &v51);
    sub_245103C28();

    a3 = v50;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v11, v12, "SiriKit asked for resolving temporalEventTrigger {temporalEventTrigger: %s}", v14, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v47, -1, -1);
    MEMORY[0x24952EEE4](v14, -1, -1);

  }
  else
  {

  }
  v21 = objc_msgSend(v10, (SEL)p_imp[487]);
  if (v21)
  {
    v22 = v21;
    v23 = (void *)sub_245103B20();
    v24 = v23;
    if ((v25 & 1) != 0)
    {
      if ((_BYTE)v23)
      {
        if (v23 == 1)
        {
          v35 = sub_245103910();
          v36 = sub_245103AB4();
          if (os_log_type_enabled(v35, v36))
          {
            v37 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v37 = 0;
            _os_log_impl(&dword_2450D4000, v35, v36, ".temporalEventTrigger.recurrenceRule is not supported {result: .unsupported(.invalidRecurrence)}", v37, 2u);
            MEMORY[0x24952EEE4](v37, -1, -1);
          }

          v38 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 2);
        }
        else
        {
          v43 = sub_245103910();
          v44 = sub_245103AB4();
          if (os_log_type_enabled(v43, v44))
          {
            v45 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v45 = 0;
            _os_log_impl(&dword_2450D4000, v43, v44, ".temporalEventTrigger could not be converted into a dueDate, ignoring it {result: .notRequired}", v45, 2u);
            MEMORY[0x24952EEE4](v45, -1, -1);
          }

          sub_2450D8184(0, a6);
          v38 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
        }
      }
      else
      {
        v40 = sub_245103910();
        v41 = sub_245103AB4();
        if (os_log_type_enabled(v40, v41))
        {
          v42 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v42 = 0;
          _os_log_impl(&dword_2450D4000, v40, v41, ".temporalEventTrigger would create a due date in the past {result: .unsupported(.timeInPast)}", v42, 2u);
          MEMORY[0x24952EEE4](v42, -1, -1);
        }

        v38 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 1);
      }
      v46 = v38;
      (*(void (**)(uint64_t, id))(a3 + 16))(a3, v46);

      v22 = v46;
    }
    else
    {
      v26 = v23;
      v27 = sub_245103910();
      v28 = sub_245103AB4();
      if (os_log_type_enabled(v27, v28))
      {
        v49 = v26;
        v29 = (uint8_t *)swift_slowAlloc();
        v48 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v29 = 138412290;
        v51 = (uint64_t)v49;
        v30 = v49;
        sub_245103C28();
        *v48 = v24;
        sub_2450ED590(v24, 0);
        sub_2450ED590(v24, 0);
        _os_log_impl(&dword_2450D4000, v27, v28, ".temporalEventTrigger resolved to a valid date {result: .success(with: %@)}", v29, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v48, -1, -1);
        v31 = v29;
        v26 = v49;
        MEMORY[0x24952EEE4](v31, -1, -1);
      }
      else
      {
        sub_2450ED590(v24, 0);
        sub_2450ED590(v24, 0);
      }

      sub_2450D8184(0, a6);
      v39 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_successWithResolvedTemporalEventTrigger_, v26);
      (*(void (**)(uint64_t, id))(a3 + 16))(a3, v39);

      sub_2450ED590(v24, 0);
    }
  }
  else
  {
    v32 = sub_245103910();
    v33 = sub_245103AB4();
    if (os_log_type_enabled(v32, v33))
    {
      v34 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v34 = 0;
      _os_log_impl(&dword_2450D4000, v32, v33, ".temporalEventTrigger is nil {result: .notRequired}", v34, 2u);
      MEMORY[0x24952EEE4](v34, -1, -1);
    }

    sub_2450D8184(0, a6);
    v22 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_notRequired);
    (*(void (**)(uint64_t, id))(a3 + 16))(a3, v22);
  }

}

void sub_2450ED590(id a1, char a2)
{
  if ((a2 & 1) == 0)

}

unint64_t sub_2450ED59C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD40);
  v2 = (_QWORD *)sub_245103DF0();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_2450F4A44(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
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

unint64_t sub_2450ED6B4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD48);
  v2 = sub_245103DF0();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2450E3594(v6, (uint64_t)&v15, &qword_25744BD50);
    v7 = v15;
    v8 = v16;
    result = sub_2450F4A44(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_2450F3464(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

uint64_t sub_2450ED7E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_24510391C();
  __swift_allocate_value_buffer(v0, qword_25744BC10);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25744BC10);
  if (qword_25744B2B0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25744C4D0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_2450EDA34(unint64_t a1, void (*a2)(NSObject *))
{
  uint8_t *v2;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void **v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  id v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;

  if (qword_25744B2D8 != -1)
    swift_once();
  v5 = sub_24510391C();
  __swift_project_value_buffer(v5, (uint64_t)qword_25744BC10);
  swift_bridgeObjectRetain_n();
  v6 = sub_245103910();
  LOBYTE(v7) = sub_245103AB4();
  v8 = a1 >> 62;
  if (!os_log_type_enabled(v6, (os_log_type_t)v7))
  {

    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  v2 = (uint8_t *)swift_slowAlloc();
  *(_DWORD *)v2 = 134217984;
  if (v8)
    goto LABEL_33;
  v9 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    swift_bridgeObjectRelease();
    v26 = v9;
    sub_245103C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v6, (os_log_type_t)v7, "Search dataSource returned %ld reminders", v2, 0xCu);
    MEMORY[0x24952EEE4](v2, -1, -1);

LABEL_8:
    if (v8)
    {
      swift_bridgeObjectRetain();
      v10 = sub_245103DE4();
      swift_bridgeObjectRelease();
      if (v10 <= 9)
      {
LABEL_10:
        sub_2450D8184(0, &qword_25744B5C0);
        a1 = sub_245103B8C();
        goto LABEL_13;
      }
    }
    else if (*(uint64_t *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10) <= 9)
    {
      goto LABEL_10;
    }
    swift_bridgeObjectRetain();
LABEL_13:
    if (a1 >> 62)
    {
      swift_bridgeObjectRetain();
      v7 = sub_245103DE4();
      swift_bridgeObjectRelease();
      if (!v7)
        goto LABEL_24;
    }
    else
    {
      v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (!v7)
        goto LABEL_24;
    }
    v26 = MEMORY[0x24BEE4AF8];
    v6 = &v26;
    sub_245103D24();
    if ((v7 & 0x8000000000000000) == 0)
      break;
    __break(1u);
LABEL_33:
    swift_bridgeObjectRetain();
    v9 = sub_245103DE4();
    swift_bridgeObjectRelease();
  }
  sub_2450D8184(0, &qword_25744B5C0);
  if ((a1 & 0xC000000000000001) != 0)
  {
    v11 = 0;
    do
    {
      v12 = v11 + 1;
      MEMORY[0x24952E92C]();
      sub_245103B98();
      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
      v11 = v12;
    }
    while (v7 != v12);
  }
  else
  {
    v13 = (void **)(a1 + 32);
    do
    {
      v14 = *v13++;
      v15 = v14;
      sub_245103B98();
      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
      --v7;
    }
    while (v7);
  }
LABEL_24:
  swift_bridgeObjectRelease();
  v16 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA098]), sel_initWithCode_userActivity_, 3, 0);
  sub_2450D8184(0, &qword_25744B5C0);
  v17 = (void *)sub_2451039E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v16, sel_setTasks_, v17);

  v18 = v16;
  v19 = sub_245103910();
  v20 = sub_245103AB4();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v21 = 134217984;
    v22 = -[NSObject tasks](v18, sel_tasks);
    if (v22)
    {
      v23 = v22;
      v24 = sub_2451039F4();

      if (v24 >> 62)
      {
        swift_bridgeObjectRetain();
        v25 = sub_245103DE4();

        swift_bridgeObjectRelease_n();
      }
      else
      {
        v25 = *(_QWORD *)((v24 & 0xFFFFFFFFFFFFF8) + 0x10);

        swift_bridgeObjectRelease();
      }
    }
    else
    {

      v25 = -1;
    }
    v26 = v25;
    sub_245103C28();

    _os_log_impl(&dword_2450D4000, v19, v20, "Return success search result {tasksCount: %ld}", v21, 0xCu);
    MEMORY[0x24952EEE4](v21, -1, -1);
  }
  else
  {

    v19 = v18;
  }

  a2(v18);
}

void sub_2450EDF50(uint64_t a1, void *a2, void (*a3)(NSObject *))
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  id v24;
  void *v25;
  unint64_t v26;
  _BYTE v27[8];
  _BYTE v28[16];

  v5 = sub_245103730();
  v6 = sub_245103718();
  if (qword_25744B2D8 != -1)
    swift_once();
  v7 = sub_24510391C();
  __swift_project_value_buffer(v7, (uint64_t)qword_25744BC10);
  swift_bridgeObjectRetain_n();
  v8 = sub_245103910();
  v9 = sub_245103AB4();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v10 = 134217984;
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_245103DE4();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_245103C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v8, v9, "Search dataSource returned %ld lists", v10, 0xCu);
    MEMORY[0x24952EEE4](v10, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_bridgeObjectRetain_n();
  v11 = sub_245103910();
  v12 = sub_245103AB4();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v13 = 134217984;
    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_245103DE4();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_245103C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v11, v12, "Search dataSource returned %ld smartLists", v13, 0xCu);
    MEMORY[0x24952EEE4](v13, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v14 = a2;
  v15 = sub_2450EEC1C(v5, (uint64_t)v14, (uint64_t)v28, (void (*)(uint64_t *__return_ptr, id *, uint64_t))sub_2450EE428);
  swift_bridgeObjectRelease();

  v16 = v14;
  v17 = sub_2450EEC1C(v6, (uint64_t)v16, (uint64_t)v27, (void (*)(uint64_t *__return_ptr, id *, uint64_t))sub_2450EE828);
  swift_bridgeObjectRelease();

  v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA098]), sel_initWithCode_userActivity_, 3, 0);
  sub_2450EC0DC(v17);
  sub_2450D8184(0, &qword_25744B5B8);
  v19 = (void *)sub_2451039E8();
  swift_bridgeObjectRelease();
  objc_msgSend(v18, sel_setTaskLists_, v19, v15);

  v20 = v18;
  v21 = sub_245103910();
  v22 = sub_245103AB4();
  if (os_log_type_enabled(v21, v22))
  {
    v23 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v23 = 134217984;
    v24 = -[NSObject taskLists](v20, sel_taskLists);
    if (v24)
    {
      v25 = v24;
      v26 = sub_2451039F4();

      if (v26 >> 62)
      {
        swift_bridgeObjectRetain();
        sub_245103DE4();

        swift_bridgeObjectRelease_n();
      }
      else
      {

        swift_bridgeObjectRelease();
      }
    }
    else
    {

    }
    sub_245103C28();

    _os_log_impl(&dword_2450D4000, v21, v22, "Return success search result {taskListsCount: %ld}", v23, 0xCu);
    MEMORY[0x24952EEE4](v23, -1, -1);
  }
  else
  {

    v21 = v20;
  }

  a3(v20);
}

void sub_2450EE428(void **a1@<X0>, uint64_t *a2@<X8>)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(void);
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  _QWORD *v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v31;

  v2 = *a1;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744B8D0);
  v3 = sub_2451036D0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = *(_QWORD *)(v4 + 72);
  v6 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_245104CF0;
  v8 = (_QWORD *)(v7 + v6);
  v9 = (char *)v8 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25744BD38) + 48);
  *v8 = objc_msgSend(v2, sel_objectID);
  v10 = *MEMORY[0x24BE7D530];
  v11 = sub_2451036C4();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 104))(v9, v10, v11);
  v12 = *(void (**)(void))(v4 + 104);
  ((void (*)(_QWORD *, _QWORD, uint64_t))v12)(v8, *MEMORY[0x24BE7D508], v3);
  *((_BYTE *)v8 + v5) = 0;
  v12();
  sub_245103760();
  v13 = v28;
  sub_245103754();
  if (v28)
  {
    swift_bridgeObjectRelease();
    if (qword_25744B2D8 != -1)
      swift_once();
    v14 = sub_24510391C();
    __swift_project_value_buffer(v14, (uint64_t)qword_25744BC10);
    v15 = v28;
    v16 = v2;
    v17 = v28;
    v18 = sub_245103910();
    v19 = sub_245103A9C();
    if (os_log_type_enabled(v18, v19))
    {
      v20 = swift_slowAlloc();
      v21 = (_QWORD *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v31 = v29;
      *(_DWORD *)v20 = 138412546;
      v22 = objc_msgSend(v16, sel_objectID);
      sub_245103C28();
      *v21 = v22;

      *(_WORD *)(v20 + 12) = 2080;
      swift_getErrorValue();
      v23 = sub_245103E50();
      sub_245101AB4(v23, v24, &v31);
      sub_245103C28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2450D4000, v18, v19, "Error fetching reminders for list {listID: %@, error: %s", (uint8_t *)v20, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v21, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v29, -1, -1);
      MEMORY[0x24952EEE4](v20, -1, -1);
    }
    else
    {

    }
    sub_2450D8184(0, &qword_25744B5B8);
    v27 = v16;
    v26 = sub_245103A60();

  }
  else
  {
    swift_bridgeObjectRelease();
    sub_2450D8184(0, &qword_25744B5B8);
    v25 = v2;
    v26 = sub_245103A6C();
  }
  *a2 = v26;
}

void sub_2450EE828(void **a1@<X0>, uint64_t *a2@<X8>)
{
  void *v2;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;

  v4 = *a1;
  sub_245103760();
  sub_245103748();
  if (v2)
  {
    if (qword_25744B2D8 != -1)
      swift_once();
    v5 = sub_24510391C();
    __swift_project_value_buffer(v5, (uint64_t)qword_25744BC10);
    v6 = v2;
    v7 = v4;
    v8 = v2;
    v9 = sub_245103910();
    v10 = sub_245103A9C();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = swift_slowAlloc();
      v12 = (_QWORD *)swift_slowAlloc();
      v19 = swift_slowAlloc();
      v21 = v19;
      *(_DWORD *)v11 = 138412546;
      v20 = a2;
      v13 = objc_msgSend(v7, sel_objectID);
      sub_245103C28();
      *v12 = v13;

      *(_WORD *)(v11 + 12) = 2080;
      swift_getErrorValue();
      v14 = sub_245103E50();
      sub_245101AB4(v14, v15, &v21);
      a2 = v20;
      sub_245103C28();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_2450D4000, v9, v10, "Error fetching reminders for smartList {smartListID: %@, error: %s", (uint8_t *)v11, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v12, -1, -1);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v19, -1, -1);
      MEMORY[0x24952EEE4](v11, -1, -1);
    }
    else
    {

    }
    sub_2450D8184(0, &qword_25744B5B8);
    v18 = v7;
    v17 = sub_245103A48();

  }
  else
  {
    sub_2450D8184(0, &qword_25744B5B8);
    v16 = v4;
    v17 = sub_245103A48();
  }
  *a2 = v17;
}

id sub_2450EEB74()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSearchForNotebookItemsIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TTRSearchForNotebookItemsIntentHandler()
{
  return objc_opt_self();
}

uint64_t sub_2450EEC1C(unint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, id *, uint64_t))
{
  uint64_t v4;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  id v10;
  void *v11;
  id v13;
  uint64_t v14;
  uint64_t v15;

  if (a1 >> 62)
    goto LABEL_16;
  v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x24BEE4AF8];
    if (!v7)
      break;
    v15 = MEMORY[0x24BEE4AF8];
    result = sub_245103D24();
    if (v7 < 0)
    {
      __break(1u);
      return result;
    }
    v9 = 0;
    while (v7 != v9)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v10 = (id)MEMORY[0x24952E92C](v9, a1);
      else
        v10 = *(id *)(a1 + 8 * v9 + 32);
      v11 = v10;
      v13 = v10;
      a4(&v14, &v13, a2);

      if (v4)
        return swift_release();
      ++v9;
      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
      if (v7 == v9)
        return v15;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v7 = sub_245103DE4();
    swift_bridgeObjectRelease();
  }
  return result;
}

void sub_2450EED88(void *a1, uint64_t a2, void (**a3)(_QWORD, _QWORD))
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  _QWORD *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  void (**v28)(_QWORD, _QWORD);
  NSObject *v29;

  v5 = sub_24510391C();
  v24 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v27 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25744B2D8 != -1)
    swift_once();
  v25 = v5;
  v7 = __swift_project_value_buffer(v5, (uint64_t)qword_25744BC10);
  v8 = a1;
  v9 = sub_245103910();
  v10 = sub_245103AB4();
  if (os_log_type_enabled(v9, v10))
  {
    v26 = v7;
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v28 = a3;
    v29 = v8;
    v13 = (_QWORD *)v12;
    *(_DWORD *)v11 = 138412290;
    v14 = v8;
    v7 = v26;
    sub_245103C28();
    *v13 = v8;

    _os_log_impl(&dword_2450D4000, v9, v10, "SiriKit asked for resolving itemType {intent: %@}", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
    swift_arrayDestroy();
    v15 = v13;
    a3 = v28;
    MEMORY[0x24952EEE4](v15, -1, -1);
    MEMORY[0x24952EEE4](v11, -1, -1);

  }
  else
  {

  }
  switch((unint64_t)-[NSObject itemType](v8, sel_itemType, v24))
  {
    case 0uLL:
    case 3uLL:
      goto LABEL_7;
    case 1uLL:
      sub_2450D8184(0, (unint64_t *)&unk_25744BD60);
      v16 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_unsupported);
      goto LABEL_9;
    case 2uLL:
      if ((sub_245103B50() & 1) != 0)
LABEL_7:
        v16 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedNotebookItemType_, 3);
      else
        v16 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedNotebookItemType_, 2);
LABEL_9:
      v17 = v16;
      v18 = sub_245103910();
      v19 = sub_245103AB4();
      if (os_log_type_enabled(v18, v19))
      {
        v20 = (uint8_t *)swift_slowAlloc();
        v21 = (_QWORD *)swift_slowAlloc();
        *(_DWORD *)v20 = 138412290;
        v29 = v17;
        v22 = v17;
        sub_245103C28();
        *v21 = v17;

        _os_log_impl(&dword_2450D4000, v18, v19, "Resolved itemType {result: %@}", v20, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v21, -1, -1);
        MEMORY[0x24952EEE4](v20, -1, -1);
      }
      else
      {

        v18 = v17;
      }

      ((void (**)(_QWORD, NSObject *))a3)[2](a3, v17);
      return;
    default:
      (*(void (**)(char *, uint64_t, uint64_t))(v24 + 16))(v27, v7, v25);
      v23 = MEMORY[0x24BEE4AF8];
      sub_2450ED6B4(MEMORY[0x24BEE4AF8]);
      sub_2450ED6B4(v23);
      _Block_release(a3);
      sub_2450E645C((uint64_t)"unknown item type", 17, 2);
      __break(1u);
      JUMPOUT(0x2450EF1ACLL);
  }
}

uint64_t sub_2450EF1BC(void *a1, char *a2, const void *a3)
{
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
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
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
  uint64_t v68;
  uint64_t v69;
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
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  _BYTE *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t inited;
  id v133;
  void (*v134)(_BYTE *, uint64_t);
  NSObject *v135;
  NSObject *v136;
  os_log_type_t v137;
  _BOOL4 v138;
  uint8_t *v139;
  _QWORD *v140;
  NSObject *v141;
  id v142;
  void *v143;
  id v144;
  uint64_t v145;
  objc_class *v146;
  objc_class *v147;
  id v148;
  void *v149;
  uint64_t v150;
  objc_class *v151;
  objc_class *v152;
  uint64_t v153;
  NSObject *v154;
  unint64_t v155;
  unint64_t isa;
  NSObject *v157;
  unint64_t v158;
  unint64_t v159;
  NSObject *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t *v165;
  char *v166;
  uint64_t v167;
  uint64_t v168;
  void (*v169)(char *, uint64_t, uint64_t);
  uint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unint64_t v173;
  unint64_t v174;
  uint64_t v175;
  void (*v176)(unint64_t, uint64_t *, uint64_t);
  uint64_t v177;
  uint64_t *v178;
  char *v179;
  uint64_t v180;
  void (*v181)(uint64_t *, uint64_t, uint64_t);
  unint64_t v182;
  unint64_t v183;
  unint64_t v184;
  id v185;
  void *v186;
  id v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  char v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t *v194;
  unint64_t v195;
  unint64_t v196;
  id v197;
  void *v198;
  uint64_t v199;
  unint64_t v200;
  unint64_t v201;
  uint64_t v202;
  unsigned int (**v203)(_QWORD, _QWORD, _QWORD);
  _QWORD *v204;
  NSObject *v205;
  os_log_type_t v206;
  uint8_t *v207;
  NSObject *v208;
  uint64_t v209;
  NSObject *v210;
  os_log_type_t v211;
  NSObject *v212;
  uint8_t *v213;
  uint64_t v214;
  _BYTE *v215;
  unsigned int (*v216)(_BYTE *, _BYTE *, _QWORD *);
  _BYTE *v217;
  NSObject *v218;
  os_log_type_t v219;
  uint8_t *v220;
  uint64_t v221;
  uint64_t v222;
  unint64_t v223;
  void (*v224)(_BYTE *, _QWORD *);
  _BYTE *v225;
  uint64_t v226;
  BOOL *v227;
  uint64_t v228;
  unint64_t v229;
  unint64_t v230;
  unint64_t v231;
  void (*v232)(BOOL *, BOOL *, uint64_t);
  id v233;
  void *v234;
  id v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t *v240;
  char *v241;
  uint64_t v242;
  uint64_t v243;
  unint64_t v244;
  unint64_t v245;
  unint64_t v246;
  void (*v247)(void);
  BOOL *v248;
  NSObject *v249;
  unsigned __int8 v250;
  unsigned __int8 v251;
  BOOL v252;
  NSObject *v253;
  unsigned __int8 v254;
  BOOL *v255;
  uint64_t v256;
  uint64_t v257;
  void (*v258)(void);
  unint64_t v259;
  unint64_t v260;
  unint64_t v261;
  uint64_t v262;
  id v263;
  void *v264;
  id v265;
  void *v266;
  uint64_t v267;
  uint64_t v268;
  _BYTE *v269;
  id v270;
  void *v271;
  void (*v272)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v273;
  _BYTE *v274;
  unsigned int (*v275)(_BYTE *, uint64_t, uint64_t);
  uint64_t v276;
  uint64_t v277;
  id v278;
  void *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  _BYTE *v283;
  _BYTE *v284;
  _BYTE *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  _BYTE *v289;
  unsigned int (*v290)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v291;
  uint64_t v292;
  _BYTE *v293;
  _BYTE *v294;
  uint64_t v295;
  uint64_t *v296;
  int v297;
  uint64_t v298;
  uint64_t v299;
  unint64_t v300;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v302;
  unint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t *v307;
  unint64_t v308;
  unint64_t v309;
  NSObject *v310;
  os_log_type_t v311;
  uint8_t *v312;
  uint64_t v313;
  uint64_t v314;
  unint64_t v315;
  uint64_t v316;
  _BYTE *v317;
  uint64_t v318;
  unsigned int v319;
  _BYTE *v320;
  uint64_t v321;
  uint64_t v322;
  void (*v323)(uint64_t, uint64_t);
  uint64_t v324;
  void (*v325)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v326;
  _BYTE *v327;
  uint64_t v328;
  uint64_t v329;
  _BYTE *v330;
  uint64_t v331;
  uint64_t v332;
  void (*v333)(_BYTE *, uint64_t);
  _BYTE *v334;
  _BYTE *v335;
  _BYTE *v336;
  _BYTE *v337;
  _BYTE *v338;
  void (*v339)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v340;
  uint64_t v341;
  _BYTE *v342;
  uint64_t v343;
  void (*v344)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v345;
  _BYTE *v346;
  _BYTE *v347;
  uint64_t v348;
  _BYTE *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  _BYTE *v354;
  unsigned int (*v355)(uint64_t, uint64_t, uint64_t);
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  void (*v360)(_BYTE *, uint64_t);
  uint64_t v361;
  void (*v362)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v363;
  _BYTE *v364;
  _BYTE *v365;
  uint64_t v366;
  _BYTE *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  _BYTE *v371;
  uint64_t v372;
  unint64_t v373;
  BOOL *v374;
  unsigned int v375;
  _BYTE *v376;
  void (*v377)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v378;
  void (*v379)(_BYTE *, _BYTE *, uint64_t);
  char *v380;
  char v381;
  _BYTE *v382;
  void (*v383)(_BYTE *, uint64_t);
  void (*v384)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v385;
  uint64_t v386;
  void (*v387)(uint64_t, uint64_t);
  uint64_t v388;
  _BYTE *v389;
  uint64_t v390;
  _BYTE *v391;
  _BYTE *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t (*v395)(uint64_t, uint64_t, uint64_t);
  uint64_t v396;
  _BYTE *v397;
  _BYTE *v398;
  uint64_t v399;
  int v400;
  id v401;
  _BYTE *v402;
  id v403;
  void (*v404)(_BYTE *, uint64_t);
  uint64_t v405;
  _BYTE *v406;
  uint64_t v407;
  _BYTE *v408;
  _BYTE *v409;
  uint64_t v410;
  uint64_t v411;
  void (*v412)(_BYTE *, _BYTE *, uint64_t);
  void (*v413)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v414;
  unint64_t v415;
  unint64_t v416;
  unint64_t v417;
  void (*v418)(BOOL *, _BYTE *, uint64_t);
  BOOL *v419;
  uint64_t v420;
  uint64_t v421;
  _BYTE *v422;
  _BYTE *v423;
  _BYTE *v424;
  uint64_t v425;
  unint64_t v426;
  unint64_t v427;
  unint64_t v428;
  BOOL *v429;
  uint64_t *v430;
  uint64_t v431;
  _BYTE *v432;
  uint64_t v433;
  _BYTE *v434;
  _BYTE *v435;
  void (*v436)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v437;
  uint64_t v438;
  void (*v439)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v440;
  unint64_t v441;
  unint64_t v442;
  unint64_t v443;
  BOOL *v444;
  uint64_t v445;
  uint64_t v446;
  _BYTE *v447;
  _BYTE *v448;
  unint64_t v449;
  unint64_t v450;
  uint64_t v451;
  int v452;
  uint64_t v453;
  uint64_t v454;
  _BYTE *v455;
  _BYTE *v456;
  void (*v457)(_BYTE *, _BYTE *, uint64_t);
  void (*v458)(_BYTE *, _QWORD, uint64_t, uint64_t);
  unint64_t v459;
  unint64_t v460;
  unint64_t v461;
  void (*v462)(BOOL *, _BYTE *, uint64_t);
  void (*v463)(_BYTE *, uint64_t);
  void (*v464)(BOOL *, _BYTE *, uint64_t);
  uint64_t v465;
  _BYTE *v466;
  _BYTE *v467;
  void (*v468)(_BYTE *, _BYTE *, uint64_t);
  void (*v469)(_BYTE *, _QWORD, uint64_t, uint64_t);
  unint64_t v470;
  unint64_t v471;
  unint64_t v472;
  void (*v473)(_BYTE *, uint64_t);
  _BYTE *v474;
  uint64_t v475;
  void (*v476)(BOOL *, _BYTE *, uint64_t);
  _BYTE *v477;
  _BYTE *v478;
  unint64_t v479;
  unint64_t v480;
  unint64_t v481;
  id v482;
  uint64_t v483;
  void (*v484)(void);
  unint64_t v485;
  unint64_t v486;
  unint64_t v487;
  BOOL *v488;
  char *v489;
  unint64_t v490;
  unint64_t v491;
  id v492;
  NSObject *v493;
  os_log_type_t v494;
  uint8_t *v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  unint64_t v499;
  unint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  unint64_t v504;
  _QWORD *v505;
  void (*v506)(unint64_t, void *, _QWORD *, uint64_t, uint64_t);
  void *v507;
  NSObject *v508;
  os_log_type_t v509;
  uint8_t *v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  unint64_t v514;
  unint64_t v515;
  uint64_t v516;
  void *v517;
  id v518;
  NSObject *v519;
  os_log_type_t v520;
  uint8_t *v521;
  id v522;
  void (*v524)(_BYTE *, uint64_t);
  uint64_t v525;
  const char *v526;
  uint64_t v527;
  uint64_t v528;
  _BYTE v529[4];
  unsigned int v530;
  uint64_t v531;
  void (*v532)(uint64_t *, uint64_t, uint64_t);
  _BYTE *v533;
  void (*v534)(_BYTE *, uint64_t, uint64_t);
  uint64_t v535;
  _BYTE *v536;
  _BYTE *v537;
  _BYTE *v538;
  _BYTE *v539;
  _BYTE *v540;
  _BYTE *v541;
  uint64_t v542;
  _BYTE *v543;
  _BYTE *v544;
  _BYTE *v545;
  uint64_t v546;
  _BYTE *v547;
  _BYTE *v548;
  _BYTE *v549;
  _BYTE *v550;
  _BYTE *v551;
  uint64_t *v552;
  _BYTE *v553;
  _BYTE *v554;
  uint64_t *v555;
  NSObject **v556;
  uint64_t *v557;
  _BYTE *v558;
  _BYTE *v559;
  _BYTE *v560;
  _BYTE *v561;
  _BYTE *v562;
  _BYTE *v563;
  _BYTE *v564;
  _BYTE *v565;
  _BYTE *v566;
  _BYTE *v567;
  _BYTE *v568;
  _BYTE *v569;
  const void *v570;
  _BYTE *v571;
  _BYTE *v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t *v575;
  _BYTE *v576;
  _BYTE *v577;
  void (*v578)(void);
  _BYTE *v579;
  _BYTE *v580;
  _BYTE *v581;
  _BYTE *v582;
  _BYTE *v583;
  _BYTE *v584;
  _BYTE *v585;
  _BYTE *v586;
  _BYTE *v587;
  _BYTE *v588;
  _BYTE *v589;
  _BYTE *v590;
  BOOL *v591;
  unsigned int (**v592)(_QWORD, _QWORD, _QWORD);
  _BYTE *v593;
  _BYTE *v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  uint64_t v600;
  uint64_t v601;
  uint64_t v602;
  void (*v603)(BOOL *, BOOL *, uint64_t);
  BOOL *v604;
  char *v605;
  _BYTE *v606;
  _BYTE *v607;
  _BYTE *v608;
  uint64_t *v609;
  BOOL *v610;
  _QWORD *v611;
  _BYTE *v612;
  _BYTE *v613;
  uint64_t v614;
  NSObject *v615;
  uint64_t v616;
  char v617;
  char v618;
  uint64_t v619;
  uint64_t v620;
  NSObject *v621;
  unint64_t v622;
  unint64_t v623;

  v605 = a2;
  v574 = sub_2451034A8();
  v573 = *(_QWORD *)(v574 - 8);
  MEMORY[0x24BDAC7A8](v574);
  v572 = &v529[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BCD0);
  MEMORY[0x24BDAC7A8](v6);
  v568 = &v529[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v8);
  v569 = &v529[-v9];
  MEMORY[0x24BDAC7A8](v10);
  v540 = &v529[-v11];
  MEMORY[0x24BDAC7A8](v12);
  v541 = &v529[-v13];
  MEMORY[0x24BDAC7A8](v14);
  v548 = &v529[-v15];
  MEMORY[0x24BDAC7A8](v16);
  v549 = &v529[-v17];
  MEMORY[0x24BDAC7A8](v18);
  v562 = &v529[-v19];
  v595 = sub_245103388();
  v597 = *(_QWORD *)(v595 - 8);
  MEMORY[0x24BDAC7A8](v595);
  v571 = &v529[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v21);
  v563 = &v529[-v22];
  MEMORY[0x24BDAC7A8](v23);
  v561 = &v529[-v24];
  v602 = sub_245103430();
  v25 = *(_QWORD *)(v602 - 8);
  MEMORY[0x24BDAC7A8](v602);
  v567 = &v529[-((v26 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v27);
  v564 = &v529[-v28];
  MEMORY[0x24BDAC7A8](v29);
  v539 = &v529[-v30];
  MEMORY[0x24BDAC7A8](v31);
  v547 = &v529[-v32];
  MEMORY[0x24BDAC7A8](v33);
  v538 = &v529[-v34];
  MEMORY[0x24BDAC7A8](v35);
  v587 = &v529[-v36];
  MEMORY[0x24BDAC7A8](v37);
  v560 = &v529[-v38];
  MEMORY[0x24BDAC7A8](v39);
  v607 = &v529[-v40];
  MEMORY[0x24BDAC7A8](v41);
  v612 = &v529[-v42];
  v43 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744BCD8);
  MEMORY[0x24BDAC7A8](v43);
  v559 = &v529[-((v44 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v45);
  v593 = &v529[-v46];
  v601 = sub_2451034B4();
  v599 = *(_QWORD *)(v601 - 8);
  MEMORY[0x24BDAC7A8](v601);
  v606 = &v529[-((v47 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5A0);
  MEMORY[0x24BDAC7A8](v48);
  v586 = &v529[-((v49 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v50);
  v585 = &v529[-v51];
  MEMORY[0x24BDAC7A8](v52);
  v558 = &v529[-v53];
  MEMORY[0x24BDAC7A8](v54);
  v584 = &v529[-v55];
  MEMORY[0x24BDAC7A8](v56);
  v583 = &v529[-v57];
  MEMORY[0x24BDAC7A8](v58);
  v581 = &v529[-v59];
  MEMORY[0x24BDAC7A8](v60);
  v582 = &v529[-v61];
  MEMORY[0x24BDAC7A8](v62);
  v613 = &v529[-v63];
  MEMORY[0x24BDAC7A8](v64);
  v579 = &v529[-v65];
  MEMORY[0x24BDAC7A8](v66);
  v580 = &v529[-v67];
  MEMORY[0x24BDAC7A8](v68);
  v608 = &v529[-v69];
  v546 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BCE8);
  MEMORY[0x24BDAC7A8](v546);
  v594 = &v529[-((v70 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v71);
  v588 = &v529[-v72];
  MEMORY[0x24BDAC7A8](v73);
  v604 = &v529[-v74];
  MEMORY[0x24BDAC7A8](v75);
  v545 = &v529[-v76];
  v77 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744BCF0);
  MEMORY[0x24BDAC7A8](v77);
  v578 = (void (*)(void))&v529[-((v78 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v611 = (_QWORD *)sub_245103874();
  v592 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))*(v611 - 1);
  MEMORY[0x24BDAC7A8](v611);
  v557 = (uint64_t *)&v529[-((v79 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v80);
  v544 = &v529[-v81];
  MEMORY[0x24BDAC7A8](v82);
  v554 = &v529[-v83];
  MEMORY[0x24BDAC7A8](v84);
  v603 = &v529[-v85];
  v86 = sub_2451036D0();
  v614 = *(_QWORD *)(v86 - 8);
  MEMORY[0x24BDAC7A8](v86);
  v591 = &v529[-((v87 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v88);
  v566 = &v529[-v89];
  MEMORY[0x24BDAC7A8](v90);
  v565 = &v529[-v91];
  MEMORY[0x24BDAC7A8](v92);
  v553 = &v529[-v93];
  MEMORY[0x24BDAC7A8](v94);
  v590 = &v529[-v95];
  MEMORY[0x24BDAC7A8](v96);
  v589 = &v529[-v97];
  MEMORY[0x24BDAC7A8](v98);
  v576 = &v529[-v99];
  MEMORY[0x24BDAC7A8](v100);
  v577 = &v529[-v101];
  MEMORY[0x24BDAC7A8](v102);
  v537 = &v529[-v103];
  MEMORY[0x24BDAC7A8](v104);
  v551 = &v529[-v105];
  MEMORY[0x24BDAC7A8](v106);
  v550 = &v529[-v107];
  MEMORY[0x24BDAC7A8](v108);
  v552 = (uint64_t *)&v529[-v109];
  MEMORY[0x24BDAC7A8](v110);
  v610 = &v529[-v111];
  MEMORY[0x24BDAC7A8](v112);
  v555 = (uint64_t *)&v529[-v113];
  MEMORY[0x24BDAC7A8](v114);
  v556 = (NSObject **)&v529[-v115];
  MEMORY[0x24BDAC7A8](v116);
  v543 = &v529[-v117];
  MEMORY[0x24BDAC7A8](v118);
  v575 = (uint64_t *)&v529[-v119];
  MEMORY[0x24BDAC7A8](v120);
  v609 = (uint64_t *)&v529[-v121];
  v122 = sub_24510391C();
  v123 = *(_QWORD *)(v122 - 8);
  MEMORY[0x24BDAC7A8](v122);
  v536 = &v529[-((v124 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x24BDAC7A8](v125);
  v533 = &v529[-v126];
  MEMORY[0x24BDAC7A8](v127);
  v129 = &v529[-v128];
  v130 = swift_allocObject();
  *(_QWORD *)(v130 + 16) = a3;
  _Block_copy(a3);
  if (qword_25744B2D8 != -1)
    swift_once();
  v131 = __swift_project_value_buffer(v122, (uint64_t)qword_25744BC10);
  v534 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v123 + 16);
  v534(v129, v131, v122);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5D8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_245104860;
  *(_QWORD *)(inited + 32) = 0x746E65746E69;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  *(_QWORD *)(inited + 72) = sub_2450D8184(0, &qword_25744BD00);
  *(_QWORD *)(inited + 48) = a1;
  v133 = a1;
  sub_2450ED6B4(inited);
  sub_2450E6174();
  swift_bridgeObjectRelease();
  v134 = *(void (**)(_BYTE *, uint64_t))(v123 + 8);
  v535 = v122;
  v134(v129, v122);
  v135 = v133;
  v136 = sub_245103910();
  v137 = sub_245103AB4();
  v138 = os_log_type_enabled(v136, v137);
  v598 = v130;
  v616 = v86;
  v596 = v25;
  v570 = a3;
  if (v138)
  {
    v139 = (uint8_t *)swift_slowAlloc();
    v140 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v139 = 138412290;
    v621 = v135;
    v141 = v135;
    v86 = v616;
    sub_245103C28();
    *v140 = v135;

    _os_log_impl(&dword_2450D4000, v136, v137, "SiriKit asked for handling search {intent: %@}", v139, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v140, -1, -1);
    MEMORY[0x24952EEE4](v139, -1, -1);
  }
  else
  {

    v136 = v135;
  }

  v622 = MEMORY[0x24BEE4AF8];
  v623 = MEMORY[0x24BEE4AF8];
  v142 = -[NSObject title](v135, sel_title);
  if (v142)
  {
    v143 = v142;
    v144 = objc_msgSend(v142, sel_spokenPhrase);

    v145 = sub_245103988();
    v147 = v146;

  }
  else
  {
    v145 = 0;
    v147 = 0;
  }
  v148 = -[NSObject content](v135, sel_content);
  if (v148)
  {
    v149 = v148;
    v150 = sub_245103988();
    v152 = v151;

  }
  else
  {
    v150 = 0;
    v152 = 0;
  }
  v600 = v131;
  v615 = v135;
  if (!((unint64_t)v147 | (unint64_t)v152))
    goto LABEL_41;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD18);
  v153 = swift_initStackObject();
  *(_OWORD *)(v153 + 16) = xmmword_245104CF0;
  *(_QWORD *)(v153 + 32) = v145;
  *(_QWORD *)(v153 + 40) = v147;
  *(_QWORD *)(v153 + 48) = v150;
  *(_QWORD *)(v153 + 56) = v152;
  if (!v147)
  {
    v154 = MEMORY[0x24BEE4AF8];
    if (!v152)
      goto LABEL_24;
    goto LABEL_19;
  }
  swift_bridgeObjectRetain();
  v154 = sub_245101788(0, 1, 1, MEMORY[0x24BEE4AF8]);
  isa = (unint64_t)v154[2].isa;
  v155 = (unint64_t)v154[3].isa;
  if (isa >= v155 >> 1)
    v154 = sub_245101788((_QWORD *)(v155 > 1), isa + 1, 1, v154);
  v154[2].isa = (Class)(isa + 1);
  v157 = &v154[2 * isa];
  v157[4].isa = (Class)v145;
  v157[5].isa = v147;
  if (v152)
  {
LABEL_19:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v154 = sub_245101788(0, (int64_t)v154[2].isa + 1, 1, v154);
    v159 = (unint64_t)v154[2].isa;
    v158 = (unint64_t)v154[3].isa;
    if (v159 >= v158 >> 1)
      v154 = sub_245101788((_QWORD *)(v158 > 1), v159 + 1, 1, v154);
    v154[2].isa = (Class)(v159 + 1);
    v160 = &v154[2 * v159];
    v160[4].isa = (Class)v150;
    v160[5].isa = v152;
  }
LABEL_24:
  swift_release();
  v621 = v154;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD20);
  sub_2450F3418();
  v161 = sub_245103958();
  v163 = v162;
  swift_bridgeObjectRelease();
  v164 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD10);
  v165 = v609;
  v166 = (char *)v609 + *(int *)(v164 + 48);
  v531 = v161;
  *v609 = v161;
  v165[1] = v163;
  v167 = *MEMORY[0x24BE7D800];
  v168 = sub_2451037A8();
  v169 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v168 - 8) + 104);
  v530 = v167;
  v169(v166, v167, v168);
  v170 = *MEMORY[0x24BE7D4F8];
  v532 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v614 + 104);
  v532(v165, v170, v616);
  v171 = v623;
  swift_bridgeObjectRetain();
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v171 = sub_245101774(0, *(_QWORD *)(v171 + 16) + 1, 1, v171);
  v173 = *(_QWORD *)(v171 + 16);
  v172 = *(_QWORD *)(v171 + 24);
  if (v173 >= v172 >> 1)
    v171 = sub_245101774(v172 > 1, v173 + 1, 1, v171);
  *(_QWORD *)(v171 + 16) = v173 + 1;
  v174 = (*(unsigned __int8 *)(v614 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v614 + 80);
  v542 = *(_QWORD *)(v614 + 72);
  v175 = v616;
  v176 = *(void (**)(unint64_t, uint64_t *, uint64_t))(v614 + 32);
  v176(v171 + v174 + v542 * v173, v609, v616);
  v623 = v171;
  v177 = *(int *)(v164 + 48);
  v178 = v575;
  v179 = (char *)v575 + v177;
  *v575 = v531;
  v178[1] = v163;
  v180 = v168;
  v86 = v175;
  v169(v179, v530, v180);
  v181 = (void (*)(_BYTE *, _QWORD, uint64_t))v532;
  v532(v178, v170, v175);
  v182 = v622;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v182 = sub_245101774(0, *(_QWORD *)(v182 + 16) + 1, 1, v182);
  v135 = v615;
  v184 = *(_QWORD *)(v182 + 16);
  v183 = *(_QWORD *)(v182 + 24);
  if (v184 >= v183 >> 1)
    v182 = sub_245101774(v183 > 1, v184 + 1, 1, v182);
  *(_QWORD *)(v182 + 16) = v184 + 1;
  v176(v182 + v174 + v184 * v542, v178, v175);
  v622 = v182;
  v185 = -[NSObject title](v135, sel_title);
  if (v185)
  {
    v186 = v185;
    v187 = objc_msgSend(v185, sel_vocabularyIdentifier);

    if (v187)
    {
      v188 = sub_245103988();
      v190 = v189;

      if (v188 == 0xD000000000000011 && v190 == 0x800000024510A030)
      {
        swift_bridgeObjectRelease();
        v135 = v615;
      }
      else
      {
        v191 = sub_245103E38();
        swift_bridgeObjectRelease();
        v135 = v615;
        if ((v191 & 1) == 0)
          goto LABEL_41;
      }
      v192 = *MEMORY[0x24BE7D608];
      v193 = sub_245103700();
      v194 = v543;
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(*(_QWORD *)(v193 - 8) + 104))(v543, v192, v193);
      v181((uint64_t *)v194, *MEMORY[0x24BE7D518], v86);
      v196 = *(_QWORD *)(v182 + 16);
      v195 = *(_QWORD *)(v182 + 24);
      if (v196 >= v195 >> 1)
        v182 = sub_245101774(v195 > 1, v196 + 1, 1, v182);
      *(_QWORD *)(v182 + 16) = v196 + 1;
      v176(v182 + v174 + v196 * v542, (uint64_t *)v194, v86);
      v622 = v182;
    }
  }
LABEL_41:
  v197 = -[NSObject notebookItemIdentifier](v135, sel_notebookItemIdentifier);
  if (!v197)
  {
    v210 = v135;
    v205 = sub_245103910();
    v211 = sub_245103A9C();
    if (os_log_type_enabled(v205, v211))
    {
      v207 = (uint8_t *)swift_slowAlloc();
      v208 = swift_slowAlloc();
      *(_DWORD *)v207 = 138412290;
      v621 = v210;
      v212 = v210;
      v209 = v616;
      sub_245103C28();
      v208->isa = (Class)v210;

      _os_log_impl(&dword_2450D4000, v205, v211, "[Announce Reminders] notebookIdentifier not found in intent: %@", v207, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
      goto LABEL_47;
    }

LABEL_52:
    v214 = v614;
    v209 = v86;
    goto LABEL_53;
  }
  v198 = v197;
  v199 = sub_245103988();
  v201 = v200;

  swift_bridgeObjectRetain();
  v202 = (uint64_t)v578;
  sub_245103868();
  v203 = v592;
  v204 = v611;
  if (((unsigned int (**)(uint64_t, uint64_t, _QWORD *))v592)[6](v202, 1, v611) == 1)
  {
    sub_2450E35D8(v202, (uint64_t *)&unk_25744BCF0);
    swift_bridgeObjectRetain();
    v205 = sub_245103910();
    v206 = sub_245103A9C();
    if (os_log_type_enabled(v205, v206))
    {
      v207 = (uint8_t *)swift_slowAlloc();
      v208 = swift_slowAlloc();
      v621 = v208;
      *(_DWORD *)v207 = 136315138;
      swift_bridgeObjectRetain();
      v620 = sub_245101AB4(v199, v201, (uint64_t *)&v621);
      v209 = v616;
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_2450D4000, v205, v206, "[Announce Reminders] Unable to create itemIdentifier from %s", v207, 0xCu);
LABEL_47:
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v208, -1, -1);
      v213 = v207;
      v135 = v615;
      MEMORY[0x24952EEE4](v213, -1, -1);

      v214 = v614;
LABEL_53:
      v225 = v608;
LABEL_54:
      v226 = v595;
      goto LABEL_55;
    }

    swift_bridgeObjectRelease_n();
    goto LABEL_52;
  }
  swift_bridgeObjectRelease();
  v215 = v603;
  ((unsigned int (**)(_QWORD, uint64_t, _QWORD *))v203)[4](v603, v202, v204);
  v216 = (unsigned int (*)(_BYTE *, _BYTE *, _QWORD *))v203[2];
  v217 = v554;
  v216(v554, v215, v204);
  v218 = sub_245103910();
  v219 = sub_245103AB4();
  if (os_log_type_enabled(v218, v219))
  {
    v220 = (uint8_t *)swift_slowAlloc();
    v221 = swift_slowAlloc();
    v621 = v221;
    *(_DWORD *)v220 = 136446210;
    v216(v544, v217, v611);
    v222 = sub_245103994();
    v620 = sub_245101AB4(v222, v223, (uint64_t *)&v621);
    v203 = v592;
    v204 = v611;
    sub_245103C28();
    swift_bridgeObjectRelease();
    v224 = (void (*)(_BYTE *, _QWORD *))v203[1];
    v224(v217, v204);
    _os_log_impl(&dword_2450D4000, v218, v219, "[Announce Reminders] requestIdentifier:%{public}s", v220, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v221, -1, -1);
    MEMORY[0x24952EEE4](v220, -1, -1);
  }
  else
  {
    v224 = (void (*)(_BYTE *, _QWORD *))v203[1];
    v224(v217, v204);
  }

  v214 = v614;
  v296 = v557;
  v216(v557, v603, v204);
  v297 = ((uint64_t (*)(uint64_t *, _QWORD *))v203[11])(v296, v204);
  if (v297 == *MEMORY[0x24BE7DD80])
  {
    ((void (*)(uint64_t *, _QWORD *))v203[12])(v296, v204);
    v298 = *v296;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
    v299 = swift_allocObject();
    *(_OWORD *)(v299 + 16) = xmmword_245104540;
    *(_QWORD *)(v299 + 32) = v298;
    v621 = v299;
    sub_245103A0C();
    *v556 = v621;
    (*(void (**)(void))(v214 + 104))();
    v300 = v623;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v226 = v595;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v300 = sub_245101774(0, *(_QWORD *)(v300 + 16) + 1, 1, v300);
    v303 = *(_QWORD *)(v300 + 16);
    v302 = *(_QWORD *)(v300 + 24);
    if (v303 >= v302 >> 1)
      v300 = sub_245101774(v302 > 1, v303 + 1, 1, v300);
    *(_QWORD *)(v300 + 16) = v303 + 1;
    v304 = *(unsigned __int8 *)(v214 + 80);
    v305 = *(_QWORD *)(v214 + 72);
    (*(void (**)(unint64_t, NSObject **, uint64_t))(v214 + 32))(v300 + ((v304 + 32) & ~v304) + v305 * v303, v556, v616);
  }
  else
  {
    v226 = v595;
    if (v297 != *MEMORY[0x24BE7DD70])
      goto LABEL_237;
    ((void (*)(uint64_t *, _QWORD *))v203[12])(v296, v204);
    v306 = v296[1];
    v307 = v555;
    *v555 = *v296;
    v307[1] = v306;
    (*(void (**)(void))(v214 + 104))();
    v300 = v623;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v300 = sub_245101774(0, *(_QWORD *)(v300 + 16) + 1, 1, v300);
    v309 = *(_QWORD *)(v300 + 16);
    v308 = *(_QWORD *)(v300 + 24);
    if (v309 >= v308 >> 1)
      v300 = sub_245101774(v308 > 1, v309 + 1, 1, v300);
    *(_QWORD *)(v300 + 16) = v309 + 1;
    v304 = *(unsigned __int8 *)(v214 + 80);
    v305 = *(_QWORD *)(v214 + 72);
    (*(void (**)(unint64_t, uint64_t *, uint64_t))(v214 + 32))(v300 + ((v304 + 32) & ~v304) + v305 * v309, v555, v616);
  }
  v623 = v300;
  v310 = sub_245103910();
  v311 = sub_245103AB4();
  if (os_log_type_enabled(v310, v311))
  {
    v312 = (uint8_t *)swift_slowAlloc();
    v313 = swift_slowAlloc();
    v621 = v313;
    *(_DWORD *)v312 = 136446210;
    swift_beginAccess();
    v314 = *(_QWORD *)(v623 + 16);
    if (v314)
    {
      v315 = v623 + ((v304 + 32) & ~(unint64_t)v304) + v305 * (v314 - 1);
      v316 = v614;
      v317 = v545;
      v209 = v616;
      (*(void (**)(_BYTE *, unint64_t, uint64_t))(v614 + 16))(v545, v315, v616);
      v318 = 0;
    }
    else
    {
      v318 = 1;
      v209 = v616;
      v316 = v614;
      v317 = v545;
    }
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v316 + 56))(v317, v318, 1, v209);
    v372 = sub_245103994();
    v620 = sub_245101AB4(v372, v373, (uint64_t *)&v621);
    sub_245103C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v310, v311, "[Announce Reminders] Added %{public}s to search criteria", v312, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v313, -1, -1);
    MEMORY[0x24952EEE4](v312, -1, -1);

    v224((void (*)(BOOL *, BOOL *, uint64_t))v603, v611);
    v214 = v316;
    v225 = v608;
    v135 = v615;
    goto LABEL_54;
  }

  v224((void (*)(BOOL *, BOOL *, uint64_t))v603, v611);
  v209 = v616;
  v225 = v608;
  v135 = v615;
LABEL_55:
  v227 = v610;
  *v227 = -[NSObject status](v135, sel_status) == (id)2;
  v228 = *MEMORY[0x24BE7D4D8];
  v611 = *(_QWORD **)(v214 + 104);
  ((void (*)(BOOL *, uint64_t, uint64_t))v611)(v227, v228, v209);
  swift_beginAccess();
  v229 = v623;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v229 = sub_245101774(0, *(_QWORD *)(v229 + 16) + 1, 1, v229);
  v231 = *(_QWORD *)(v229 + 16);
  v230 = *(_QWORD *)(v229 + 24);
  if (v231 >= v230 >> 1)
    v229 = sub_245101774(v230 > 1, v231 + 1, 1, v229);
  *(_QWORD *)(v229 + 16) = v231 + 1;
  v610 = (BOOL *)((*(unsigned __int8 *)(v214 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v214 + 80));
  v609 = *(uint64_t **)(v214 + 72);
  v232 = *(void (**)(BOOL *, BOOL *, uint64_t))(v214 + 32);
  v232(&v610[v229 + (_QWORD)v609 * v231], v227, v616);
  v623 = v229;
  swift_endAccess();
  v233 = -[NSObject location](v135, sel_location);
  if (v233)
  {
    v234 = v233;
    v235 = objc_msgSend(v233, sel_name);

    if (v235)
    {
      v236 = sub_245103988();
      v238 = v237;

      if (-[NSObject locationSearchType](v615, sel_locationSearchType) == (id)1)
      {
        v239 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD10);
        v240 = v552;
        v241 = (char *)v552 + *(int *)(v239 + 48);
        *v552 = v236;
        v240[1] = v238;
        v242 = *MEMORY[0x24BE7D800];
        v243 = sub_2451037A8();
        (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v243 - 8) + 104))(v241, v242, v243);
        ((void (*)(uint64_t *, _QWORD, uint64_t))v611)(v240, *MEMORY[0x24BE7D520], v616);
        swift_beginAccess();
        v244 = v623;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v244 = sub_245101774(0, *(_QWORD *)(v244 + 16) + 1, 1, v244);
        v246 = *(_QWORD *)(v244 + 16);
        v245 = *(_QWORD *)(v244 + 24);
        if (v246 >= v245 >> 1)
          v244 = sub_245101774(v245 > 1, v246 + 1, 1, v244);
        *(_QWORD *)(v244 + 16) = v246 + 1;
        v232(&v610[v244 + v246 * (_QWORD)v609], (BOOL *)v240, v616);
        v623 = v244;
        swift_endAccess();
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
  }
  v603 = v232;
  v247 = *(void (**)(void))(v214 + 56);
  v248 = v604;
  v247();
  v249 = v615;
  v250 = -[NSObject temporalEventTriggerTypes](v615, sel_temporalEventTriggerTypes);
  v251 = -[NSObject temporalEventTriggerTypes](v249, sel_temporalEventTriggerTypes);
  v252 = (v251 & 2) == 0;
  v253 = v249;
  v254 = -[NSObject temporalEventTriggerTypes](v249, sel_temporalEventTriggerTypes);
  v255 = v248;
  if ((v250 & 1) != 0)
  {
    if ((v251 & 2) != 0)
    {
      v256 = v597;
      if ((v254 & 4) != 0)
        goto LABEL_85;
      v252 = 0;
      v258 = (void (*)(void))v611;
      goto LABEL_79;
    }
    v256 = v597;
    if ((v254 & 4) != 0)
      goto LABEL_85;
    goto LABEL_84;
  }
  if ((v251 & 2) == 0)
  {
    v256 = v597;
    if ((v254 & 4) == 0)
      goto LABEL_85;
    goto LABEL_76;
  }
  v256 = v597;
  if ((v254 & 4) != 0)
  {
LABEL_84:
    sub_2450E35D8((uint64_t)v255, &qword_25744BCE8);
    *v255 = (v250 & 1) == 0;
    v262 = v616;
    ((void (*)(BOOL *, _QWORD, uint64_t))v611)(v255, *MEMORY[0x24BE7D4D0], v616);
    ((void (*)(BOOL *, _QWORD, uint64_t, uint64_t))v247)(v255, 0, 1, v262);
    goto LABEL_85;
  }
LABEL_76:
  sub_2450E35D8((uint64_t)v255, &qword_25744BCE8);
  *v255 = 1;
  v257 = v616;
  v258 = (void (*)(void))v611;
  ((void (*)(BOOL *, _QWORD, uint64_t))v611)(v255, *MEMORY[0x24BE7D4D0], v616);
  ((void (*)(BOOL *, _QWORD, uint64_t, uint64_t))v247)(v255, 0, 1, v257);
LABEL_79:
  *v591 = v252;
  v258();
  swift_beginAccess();
  v259 = v623;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v259 = sub_245101774(0, *(_QWORD *)(v259 + 16) + 1, 1, v259);
  v261 = *(_QWORD *)(v259 + 16);
  v260 = *(_QWORD *)(v259 + 24);
  if (v261 >= v260 >> 1)
    v259 = sub_245101774(v260 > 1, v261 + 1, 1, v259);
  *(_QWORD *)(v259 + 16) = v261 + 1;
  ((void (*)(BOOL *, BOOL *, uint64_t))v603)(&v610[v259 + v261 * (_QWORD)v609], v591, v616);
  v623 = v259;
  swift_endAccess();
LABEL_85:
  v578 = v247;
  v263 = -[NSObject dateTime](v253, sel_dateTime);
  if (!v263)
    goto LABEL_199;
  v264 = v263;
  v265 = objc_msgSend(v263, sel_allDay);
  if (v265)
  {
    v266 = v265;
    LODWORD(v591) = objc_msgSend(v265, sel_BOOLValue);

  }
  else
  {
    LODWORD(v591) = 0;
  }
  v267 = (uint64_t)v583;
  v268 = (uint64_t)v582;
  v269 = v579;
  v270 = objc_msgSend(v264, sel_startDateComponents);
  if (v270)
  {
    v271 = v270;
    sub_245103340();

    v272 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v256 + 56);
    v272(v269, 0, 1, v226);
  }
  else
  {
    v272 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v256 + 56);
    v272(v269, 1, 1, v226);
  }
  v273 = (uint64_t)v269;
  v274 = v580;
  sub_2450F33D0(v273, (uint64_t)v580);
  v275 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v256 + 48);
  if (v275(v274, 1, v226) == 1)
  {
    sub_2450E35D8((uint64_t)v274, &qword_25744B5A0);
    v276 = 1;
  }
  else
  {
    sub_245103328();
    (*(void (**)(_BYTE *, uint64_t))(v256 + 8))(v274, v226);
    v276 = 0;
  }
  v277 = 1;
  v272(v225, v276, 1, v226);
  v592 = (unsigned int (**)(_QWORD, _QWORD, _QWORD))v264;
  v278 = objc_msgSend(v264, sel_endDateComponents);
  if (v278)
  {
    v279 = v278;
    v280 = (uint64_t)v581;
    sub_245103340();

    v277 = 0;
    v281 = v599;
  }
  else
  {
    v281 = v599;
    v280 = (uint64_t)v581;
  }
  v272((_BYTE *)v280, v277, 1, v226);
  sub_2450F33D0(v280, v268);
  if (v275((_BYTE *)v268, 1, v226) == 1)
  {
    sub_2450E35D8(v268, &qword_25744B5A0);
    v282 = 1;
    v283 = v613;
  }
  else
  {
    v284 = v613;
    sub_245103328();
    v283 = v284;
    v256 = v597;
    (*(void (**)(uint64_t, uint64_t))(v597 + 8))(v268, v226);
    v282 = 0;
  }
  v272(v283, v282, 1, v226);
  sub_2450E3594((uint64_t)v225, v267, &qword_25744B5A0);
  if (v275((_BYTE *)v267, 1, v226) == 1)
  {
    sub_2450E35D8(v267, &qword_25744B5A0);
    v285 = v593;
    v286 = v601;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v281 + 56))(v593, 1, 1, v601);
    v287 = v602;
  }
  else
  {
    v285 = v593;
    sub_24510337C();
    (*(void (**)(uint64_t, uint64_t))(v256 + 8))(v267, v226);
    v287 = v602;
    v286 = v601;
  }
  v288 = v616;
  v289 = v584;
  sub_2450E3594((uint64_t)v613, (uint64_t)v584, &qword_25744B5A0);
  v290 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v281 + 48);
  if (v290(v285, 1, v286) != 1)
  {
    sub_2450E35D8((uint64_t)v289, &qword_25744B5A0);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v281 + 32))(v606, v285, v286);
    v293 = v613;
    v294 = v587;
    v295 = (uint64_t)v585;
    goto LABEL_129;
  }
  v291 = v558;
  sub_2450E3594((uint64_t)v289, (uint64_t)v558, &qword_25744B5A0);
  if (v275(v291, 1, v226) == 1)
  {
    sub_2450E35D8((uint64_t)v291, &qword_25744B5A0);
    v292 = (uint64_t)v559;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v599 + 56))(v559, 1, 1, v601);
  }
  else
  {
    v292 = (uint64_t)v559;
    sub_24510337C();
    (*(void (**)(_BYTE *, uint64_t))(v256 + 8))(v291, v226);
    v319 = v290((_BYTE *)v292, 1, v601);
    v320 = v606;
    if (v319 != 1)
    {
      sub_2450E35D8((uint64_t)v289, &qword_25744B5A0);
      (*(void (**)(_BYTE *, uint64_t, uint64_t))(v599 + 32))(v320, v292, v601);
      goto LABEL_128;
    }
  }
  v321 = *(_QWORD *)&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                        + 24];
  v322 = *(_QWORD *)&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                        + 32];
  __swift_project_boxed_opaque_existential_1(&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider], v321);
  v323 = *(void (**)(uint64_t, uint64_t))(v322 + 16);
  v324 = v322;
  v287 = v602;
  v323(v321, v324);
  sub_2450E35D8((uint64_t)v289, &qword_25744B5A0);
  sub_2450E35D8(v292, (uint64_t *)&unk_25744BCD8);
LABEL_128:
  v294 = v587;
  v295 = (uint64_t)v585;
  sub_2450E35D8((uint64_t)v593, (uint64_t *)&unk_25744BCD8);
  v293 = v613;
LABEL_129:
  sub_2451033D0();
  sub_2451033DC();
  sub_2450E3594((uint64_t)v608, v295, &qword_25744B5A0);
  if (v275((_BYTE *)v295, 1, v226) == 1)
  {
    sub_2450E35D8(v295, &qword_25744B5A0);
  }
  else
  {
    v325 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v256 + 32);
    v326 = v561;
    v325(v561, v295, v226);
    if ((v591 & 1) != 0)
    {
      v327 = v563;
      sub_24510331C();
      (*(void (**)(_BYTE *, uint64_t))(v256 + 8))(v326, v226);
      v325(v326, (uint64_t)v327, v226);
    }
    v328 = *(_QWORD *)&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 24];
    v329 = *(_QWORD *)&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 32];
    v330 = v326;
    __swift_project_boxed_opaque_existential_1(&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider], v328);
    (*(void (**)(uint64_t, uint64_t))(v329 + 8))(v328, v329);
    v331 = (uint64_t)v562;
    sub_245103484();
    v332 = v596;
    v333 = *(void (**)(_BYTE *, uint64_t))(v596 + 8);
    v287 = v602;
    v333(v294, v602);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v332 + 48))(v331, 1, v287) == 1)
    {
      v334 = v560;
      sub_2451033D0();
      v335 = v330;
      v336 = v334;
      (*(void (**)(_BYTE *, uint64_t))(v256 + 8))(v335, v226);
      v337 = v612;
      v333(v612, v287);
      sub_2450E35D8(v331, &qword_25744BCD0);
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v332 + 32))(v337, v336, v287);
    }
    else
    {
      (*(void (**)(_BYTE *, uint64_t))(v256 + 8))(v326, v226);
      v338 = v612;
      v333(v612, v287);
      v339 = *(void (**)(_BYTE *, uint64_t, uint64_t))(v332 + 32);
      v340 = v560;
      v339(v560, v331, v287);
      v339(v338, (uint64_t)v340, v287);
    }
    v293 = v613;
    v288 = v616;
  }
  v341 = (uint64_t)v293;
  v342 = v586;
  sub_2450E3594(v341, (uint64_t)v586, &qword_25744B5A0);
  if (v275(v342, 1, v226) == 1)
  {
    sub_2450E35D8((uint64_t)v342, &qword_25744B5A0);
    v343 = v596;
    goto LABEL_153;
  }
  v344 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v256 + 32);
  v345 = v256;
  v346 = v571;
  v344(v571, v342, v226);
  if ((v591 & 1) != 0)
  {
    v347 = v563;
    sub_24510331C();
    v348 = v287;
    v349 = *(_BYTE **)(v345 + 8);
    ((void (*)(_BYTE *, uint64_t))v349)(v346, v226);
    v344(v346, v347, v226);
    v350 = *(_QWORD *)&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 24];
    v351 = *(_QWORD *)&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 32];
    __swift_project_boxed_opaque_existential_1(&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider], v350);
    (*(void (**)(uint64_t, uint64_t))(v351 + 8))(v350, v351);
    v352 = (uint64_t)v549;
    sub_245103484();
    v353 = v596;
    v354 = *(_BYTE **)(v596 + 8);
    ((void (*)(_BYTE *, uint64_t))v354)(v294, v348);
    v355 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v353 + 48);
    if (v355(v352, 1, v348) == 1)
    {
      ((void (*)(_BYTE *, uint64_t))v349)(v346, v226);
      sub_2450E35D8(v352, &qword_25744BCD0);
      v288 = v616;
      v287 = v348;
      v343 = v353;
      goto LABEL_153;
    }
    v591 = v354;
    v593 = v349;
    v365 = v538;
    v597 = *(_QWORD *)(v353 + 32);
    ((void (*)(_BYTE *, uint64_t, uint64_t))v597)(v538, v352, v348);
    v366 = v573;
    v367 = v572;
    v368 = v574;
    (*(void (**)(_BYTE *, _QWORD, uint64_t))(v573 + 104))(v572, *MEMORY[0x24BDCF220], v574);
    v369 = (uint64_t)v540;
    sub_24510349C();
    (*(void (**)(_BYTE *, uint64_t))(v366 + 8))(v367, v368);
    if (v355(v369, 1, v348) == 1)
    {
      ((void (*)(_BYTE *, uint64_t))v591)(v365, v348);
      ((void (*)(_BYTE *, uint64_t))v593)(v571, v595);
      sub_2450E35D8(v369, &qword_25744BCD0);
      v370 = (uint64_t)v541;
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v353 + 56))(v541, 1, 1, v348);
      v288 = v616;
      v287 = v348;
      v343 = v353;
      v371 = v607;
LABEL_151:
      v376 = v539;
      v377 = (void (*)(_BYTE *, _BYTE *, uint64_t))v597;
      ((void (*)(_BYTE *, _BYTE *, uint64_t))v597)(v539, v371, v287);
      sub_2450E35D8(v370, &qword_25744BCD0);
      v377(v371, v376, v287);
      goto LABEL_153;
    }
    v370 = (uint64_t)v541;
    sub_2451033E8();
    v374 = v591;
    ((void (*)(_BYTE *, uint64_t))v591)(v365, v348);
    ((void (*)(_BYTE *, uint64_t))v593)(v571, v595);
    ((void (*)(uint64_t, uint64_t))v374)(v369, v348);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v353 + 56))(v370, 0, 1, v348);
    v375 = v355(v370, 1, v348);
    v288 = v616;
    v287 = v348;
    v343 = v353;
    v371 = v607;
    if (v375 == 1)
      goto LABEL_151;
    ((void (*)(_BYTE *, uint64_t))v374)(v607, v348);
    v378 = v539;
    v379 = (void (*)(_BYTE *, _BYTE *, uint64_t))v597;
    ((void (*)(_BYTE *, uint64_t, uint64_t))v597)(v539, v370, v348);
    v379(v371, v378, v348);
  }
  else
  {
    v356 = *(_QWORD *)&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 24];
    v357 = *(_QWORD *)&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider
                          + 32];
    __swift_project_boxed_opaque_existential_1(&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider], v356);
    (*(void (**)(uint64_t, uint64_t))(v357 + 8))(v356, v357);
    v358 = (uint64_t)v548;
    sub_245103484();
    v359 = v596;
    v360 = *(void (**)(_BYTE *, uint64_t))(v596 + 8);
    v360(v294, v287);
    v361 = v226;
    v343 = v359;
    (*(void (**)(_BYTE *, uint64_t))(v345 + 8))(v346, v361);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v359 + 48))(v358, 1, v287) == 1)
    {
      v362 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v359 + 32);
      v363 = v547;
      v364 = v607;
      v362(v547, v607, v287);
      sub_2450E35D8(v358, &qword_25744BCD0);
    }
    else
    {
      v364 = v607;
      v360(v607, v287);
      v362 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v359 + 32);
      v363 = v547;
      v362(v547, (_BYTE *)v358, v287);
    }
    v362(v364, v363, v287);
  }
LABEL_153:
  v380 = &v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider];
  v381 = sub_245103B50();
  v382 = v612;
  if ((v381 & 1) == 0)
    goto LABEL_160;
  sub_2451033D0();
  v383 = *(void (**)(_BYTE *, uint64_t))(v343 + 8);
  v383(v382, v287);
  v384 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v343 + 32);
  v384(v382, v294, v287);
  v385 = *((_QWORD *)v380 + 3);
  v386 = *((_QWORD *)v380 + 4);
  __swift_project_boxed_opaque_existential_1(v380, v385);
  v387 = *(void (**)(uint64_t, uint64_t))(v386 + 8);
  v388 = v386;
  v287 = v602;
  v387(v385, v388);
  v389 = v564;
  sub_245103478();
  v383(v294, v287);
  v390 = v573;
  v391 = v389;
  v392 = v572;
  v393 = v574;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v573 + 104))(v572, *MEMORY[0x24BDCF220], v574);
  v394 = (uint64_t)v568;
  sub_24510349C();
  (*(void (**)(_BYTE *, uint64_t))(v390 + 8))(v392, v393);
  v395 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v343 + 48);
  if (v395(v394, 1, v287) == 1)
  {
    v383(v391, v287);
    sub_2450E35D8(v394, &qword_25744BCD0);
    v396 = (uint64_t)v569;
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v343 + 56))(v569, 1, 1, v287);
    v397 = v567;
    v398 = v607;
  }
  else
  {
    v399 = v394;
    v396 = (uint64_t)v569;
    sub_2451033E8();
    v383(v391, v287);
    v383((_BYTE *)v399, v287);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v343 + 56))(v396, 0, 1, v287);
    v400 = v395(v396, 1, v287);
    v397 = v567;
    v398 = v607;
    if (v400 != 1)
    {
      v383(v607, v287);
      v384(v397, (_BYTE *)v396, v287);
      goto LABEL_159;
    }
  }
  v384(v397, v398, v287);
  sub_2450E35D8(v396, &qword_25744BCD0);
LABEL_159:
  v288 = v616;
  v382 = v612;
  v384(v398, v397, v287);
LABEL_160:
  v253 = v615;
  v401 = -[NSObject dateSearchType](v615, sel_dateSearchType);
  v255 = v604;
  v402 = v588;
  v403 = v592;
  switch((unint64_t)v401)
  {
    case 0uLL:

      v404 = *(void (**)(_BYTE *, uint64_t))(v343 + 8);
      v404(v607, v287);
      v404(v382, v287);
      (*(void (**)(_BYTE *, uint64_t))(v599 + 8))(v606, v601);
      goto LABEL_162;
    case 1uLL:
      sub_2450E3594((uint64_t)v604, (uint64_t)v588, &qword_25744BCE8);
      v451 = v614;
      v452 = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v614 + 48))(v402, 1, v288);
      v453 = v601;
      if (v452 == 1)
      {
        sub_2450E35D8((uint64_t)v402, &qword_25744BCE8);
        goto LABEL_192;
      }
      if ((*(unsigned int (**)(_BYTE *, uint64_t))(v451 + 88))(v402, v288) != *MEMORY[0x24BE7D4D0])
      {
        (*(void (**)(_BYTE *, uint64_t))(v451 + 8))(v402, v288);
LABEL_192:
        v464 = (void (*)(BOOL *, _BYTE *, uint64_t))v603;
        v465 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD08);
        v466 = v553;
        v467 = &v553[*(int *)(v465 + 48)];
        v468 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v343 + 16);
        v468(v553, v612, v287);
        v469 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v343 + 56);
        v469(v466, 0, 1, v287);
        v468(v467, v607, v287);
        v469(v467, 0, 1, v287);
        ((void (*)(_BYTE *, _QWORD, uint64_t))v611)(v466, *MEMORY[0x24BE7D510], v288);
        swift_beginAccess();
        v470 = v623;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v470 = sub_245101774(0, *(_QWORD *)(v470 + 16) + 1, 1, v470);
        v472 = *(_QWORD *)(v470 + 16);
        v471 = *(_QWORD *)(v470 + 24);
        v424 = v607;
        if (v472 >= v471 >> 1)
          v470 = sub_245101774(v471 > 1, v472 + 1, 1, v470);
        *(_QWORD *)(v470 + 16) = v472 + 1;
        v464(&v610[v470 + v472 * (_QWORD)v609], v553, v288);
        v623 = v470;
        swift_endAccess();

LABEL_197:
        v473 = *(void (**)(_BYTE *, uint64_t))(v343 + 8);
        v473(v424, v287);
        v473(v612, v287);
        (*(void (**)(_BYTE *, uint64_t))(v599 + 8))(v606, v601);
        sub_2450E35D8((uint64_t)v613, &qword_25744B5A0);
        sub_2450E35D8((uint64_t)v608, &qword_25744B5A0);
        goto LABEL_198;
      }
      (*(void (**)(_BYTE *, uint64_t))(v451 + 96))(v402, v288);
      if ((*v402 & 1) != 0)
      {
        v454 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD08);
        v455 = v537;
        v456 = &v537[*(int *)(v454 + 48)];
        v457 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v343 + 16);
        v457(v537, v612, v287);
        v458 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v343 + 56);
        v458(v455, 0, 1, v287);
        v457(v456, v607, v287);
        v458(v456, 0, 1, v287);
        ((void (*)(_BYTE *, _QWORD, uint64_t))v611)(v455, *MEMORY[0x24BE7D510], v288);
        swift_beginAccess();
        v459 = v623;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v459 = sub_245101774(0, *(_QWORD *)(v459 + 16) + 1, 1, v459);
        v461 = *(_QWORD *)(v459 + 16);
        v460 = *(_QWORD *)(v459 + 24);
        v462 = (void (*)(BOOL *, _BYTE *, uint64_t))v603;
        if (v461 >= v460 >> 1)
          v459 = sub_245101774(v460 > 1, v461 + 1, 1, v459);
        *(_QWORD *)(v459 + 16) = v461 + 1;
        v462(&v610[v459 + v461 * (_QWORD)v609], v455, v288);
        v623 = v459;
        swift_endAccess();

        v463 = *(void (**)(_BYTE *, uint64_t))(v343 + 8);
        v463(v607, v287);
        v463(v612, v287);
        (*(void (**)(_BYTE *, uint64_t))(v599 + 8))(v606, v601);
        sub_2450E35D8((uint64_t)v613, &qword_25744B5A0);
        sub_2450E35D8((uint64_t)v608, &qword_25744B5A0);
        sub_2450E35D8((uint64_t)v255, &qword_25744BCE8);
        ((void (*)(BOOL *, uint64_t, uint64_t, uint64_t))v578)(v255, 1, 1, v288);
LABEL_198:
        v214 = v614;
        v253 = v615;
        break;
      }

      v524 = *(void (**)(_BYTE *, uint64_t))(v343 + 8);
      v524(v607, v287);
      v524(v612, v287);
      (*(void (**)(_BYTE *, uint64_t))(v599 + 8))(v606, v453);
LABEL_162:
      sub_2450E35D8((uint64_t)v613, &qword_25744B5A0);
      sub_2450E35D8((uint64_t)v608, &qword_25744B5A0);
      v214 = v614;
      break;
    case 2uLL:
      v405 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD08);
      v406 = v382;
      v407 = v405;
      v408 = v550;
      v409 = &v550[*(int *)(v405 + 48)];
      v410 = v287;
      v411 = v288;
      v412 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v343 + 16);
      v412(v550, v406, v410);
      v413 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v343 + 56);
      v413(v408, 0, 1, v410);
      v412(v409, v607, v410);
      v413(v409, 0, 1, v410);
      v414 = *MEMORY[0x24BE7D4F0];
      ((void (*)(_BYTE *, uint64_t, uint64_t))v611)(v408, v414, v411);
      swift_beginAccess();
      v415 = v623;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v415 = sub_245101774(0, *(_QWORD *)(v415 + 16) + 1, 1, v415);
      v417 = *(_QWORD *)(v415 + 16);
      v416 = *(_QWORD *)(v415 + 24);
      v418 = (void (*)(BOOL *, _BYTE *, uint64_t))v603;
      if (v417 >= v416 >> 1)
        v415 = sub_245101774(v416 > 1, v417 + 1, 1, v415);
      *(_QWORD *)(v415 + 16) = v417 + 1;
      v419 = &v610[v415 + v417 * (_QWORD)v609];
      v420 = v616;
      v418(v419, v408, v616);
      v623 = v415;
      swift_endAccess();
      v421 = *(int *)(v407 + 48);
      v422 = v565;
      v423 = &v565[v421];
      v287 = v602;
      v412(v565, v612, v602);
      v413(v422, 0, 1, v287);
      v424 = v607;
      v412(v423, v607, v287);
      v425 = v420;
      v413(v423, 0, 1, v287);
      ((void (*)(_BYTE *, uint64_t, uint64_t))v611)(v422, v414, v420);
      v426 = v622;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v426 = sub_245101774(0, *(_QWORD *)(v426 + 16) + 1, 1, v426);
      v255 = v604;
      v343 = v596;
      v428 = *(_QWORD *)(v426 + 16);
      v427 = *(_QWORD *)(v426 + 24);
      if (v428 >= v427 >> 1)
        v426 = sub_245101774(v427 > 1, v428 + 1, 1, v426);
      *(_QWORD *)(v426 + 16) = v428 + 1;
      v429 = &v610[v426 + v428 * (_QWORD)v609];
      v430 = &v597;
      goto LABEL_181;
    case 3uLL:
      v431 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD08);
      v432 = v382;
      v433 = v431;
      v434 = v551;
      v435 = &v551[*(int *)(v431 + 48)];
      v436 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(v343 + 16);
      v436(v551, v432, v287);
      v437 = v287;
      v438 = v288;
      v439 = *(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v343 + 56);
      v439(v434, 0, 1, v437);
      v436(v435, v607, v437);
      v439(v435, 0, 1, v437);
      v440 = *MEMORY[0x24BE7D4E8];
      ((void (*)(_BYTE *, uint64_t, uint64_t))v611)(v434, v440, v438);
      swift_beginAccess();
      v441 = v623;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v441 = sub_245101774(0, *(_QWORD *)(v441 + 16) + 1, 1, v441);
      v443 = *(_QWORD *)(v441 + 16);
      v442 = *(_QWORD *)(v441 + 24);
      v418 = (void (*)(BOOL *, _BYTE *, uint64_t))v603;
      if (v443 >= v442 >> 1)
        v441 = sub_245101774(v442 > 1, v443 + 1, 1, v441);
      *(_QWORD *)(v441 + 16) = v443 + 1;
      v444 = &v610[v441 + v443 * (_QWORD)v609];
      v445 = v616;
      v418(v444, v434, v616);
      v623 = v441;
      swift_endAccess();
      v446 = *(int *)(v433 + 48);
      v447 = v566;
      v448 = &v566[v446];
      v287 = v602;
      v436(v566, v612, v602);
      v439(v447, 0, 1, v287);
      v424 = v607;
      v436(v448, v607, v287);
      v439(v448, 0, 1, v287);
      v425 = v445;
      ((void (*)(_BYTE *, uint64_t, uint64_t))v611)(v447, v440, v445);
      v426 = v622;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v426 = sub_245101774(0, *(_QWORD *)(v426 + 16) + 1, 1, v426);
      v255 = v604;
      v343 = v596;
      v450 = *(_QWORD *)(v426 + 16);
      v449 = *(_QWORD *)(v426 + 24);
      if (v450 >= v449 >> 1)
        v426 = sub_245101774(v449 > 1, v450 + 1, 1, v426);
      *(_QWORD *)(v426 + 16) = v450 + 1;
      v429 = &v610[v426 + v450 * (_QWORD)v609];
      v430 = &v598;
LABEL_181:
      v418(v429, (_BYTE *)*(v430 - 32), v425);

      v622 = v426;
      goto LABEL_197;
    default:
      v534(v533, v600, v535);
      v525 = MEMORY[0x24BEE4AF8];
      sub_2450ED6B4(MEMORY[0x24BEE4AF8]);
      sub_2450ED6B4(v525);
      swift_release();
      _Block_release(v570);
      v526 = "unknown date search type";
      v527 = 24;
      goto LABEL_236;
  }
LABEL_199:
  v474 = v594;
  sub_2450E3594((uint64_t)v255, (uint64_t)v594, &qword_25744BCE8);
  v475 = v616;
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v214 + 48))(v474, 1, v616) == 1)
  {
    sub_2450E35D8((uint64_t)v474, &qword_25744BCE8);
    v476 = (void (*)(BOOL *, _BYTE *, uint64_t))v603;
  }
  else
  {
    v477 = v577;
    v476 = (void (*)(BOOL *, _BYTE *, uint64_t))v603;
    ((void (*)(_BYTE *, _BYTE *, uint64_t))v603)(v577, v474, v475);
    v478 = v576;
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v214 + 16))(v576, v477, v475);
    swift_beginAccess();
    v479 = v623;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v479 = sub_245101774(0, *(_QWORD *)(v479 + 16) + 1, 1, v479);
    v481 = *(_QWORD *)(v479 + 16);
    v480 = *(_QWORD *)(v479 + 24);
    if (v481 >= v480 >> 1)
      v479 = sub_245101774(v480 > 1, v481 + 1, 1, v479);
    *(_QWORD *)(v479 + 16) = v481 + 1;
    v476(&v610[v479 + v481 * (_QWORD)v609], v478, v475);
    v623 = v479;
    swift_endAccess();
    (*(void (**)(_BYTE *, uint64_t))(v214 + 8))(v477, v475);
    v253 = v615;
  }
  v482 = -[NSObject taskPriority](v253, sel_taskPriority);
  v483 = v598;
  v484 = (void (*)(void))v611;
  if (v482)
  {
    if (v482 == (id)1)
    {
      *v590 = 0;
      v484();
      swift_beginAccess();
      v485 = v623;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v485 = sub_245101774(0, *(_QWORD *)(v485 + 16) + 1, 1, v485);
      v487 = *(_QWORD *)(v485 + 16);
      v486 = *(_QWORD *)(v485 + 24);
      if (v487 >= v486 >> 1)
        v485 = sub_245101774(v486 > 1, v487 + 1, 1, v485);
      *(_QWORD *)(v485 + 16) = v487 + 1;
      v488 = &v610[v485 + v487 * (_QWORD)v609];
      v489 = &v618;
LABEL_219:
      v476(v488, *((_BYTE **)v489 - 32), v475);
      v623 = v485;
      swift_endAccess();
      goto LABEL_220;
    }
    if (v482 == (id)2)
    {
      *v589 = 1;
      v484();
      swift_beginAccess();
      v485 = v623;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v485 = sub_245101774(0, *(_QWORD *)(v485 + 16) + 1, 1, v485);
      v491 = *(_QWORD *)(v485 + 16);
      v490 = *(_QWORD *)(v485 + 24);
      if (v491 >= v490 >> 1)
        v485 = sub_245101774(v490 > 1, v491 + 1, 1, v485);
      *(_QWORD *)(v485 + 16) = v491 + 1;
      v488 = &v610[v485 + v491 * (_QWORD)v609];
      v489 = &v617;
      goto LABEL_219;
    }
    v534(v536, v600, v535);
    v528 = MEMORY[0x24BEE4AF8];
    sub_2450ED6B4(MEMORY[0x24BEE4AF8]);
    sub_2450ED6B4(v528);
    swift_release();
    _Block_release(v570);
    v526 = "unknown task priority";
    v527 = 21;
LABEL_236:
    sub_2450E645C((uint64_t)v526, v527, 2);
    __break(1u);
LABEL_237:
    swift_release();
    _Block_release(v570);
    sub_245103E2C();
    __break(1u);
    JUMPOUT(0x2450F3338);
  }
LABEL_220:
  v492 = -[NSObject itemType](v253, sel_itemType);
  if (v492 == (id)2)
  {
    v508 = sub_245103910();
    v509 = sub_245103AB4();
    if (os_log_type_enabled(v508, v509))
    {
      v510 = (uint8_t *)swift_slowAlloc();
      v511 = swift_slowAlloc();
      v621 = v511;
      *(_DWORD *)v510 = 136315138;
      swift_beginAccess();
      v512 = swift_bridgeObjectRetain();
      v513 = MEMORY[0x24952E644](v512, v475);
      v515 = v514;
      swift_bridgeObjectRelease();
      v516 = v513;
      v483 = v598;
      v619 = sub_245101AB4(v516, v515, (uint64_t *)&v621);
      sub_245103C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v508, v509, "Consulting Search datasource for lists {itemType: taskList, criteria: %s}", v510, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v511, -1, -1);
      MEMORY[0x24952EEE4](v510, -1, -1);
    }

    v517 = v605;
    v502 = *(_QWORD *)&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 24];
    v503 = *(_QWORD *)&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 32];
    __swift_project_boxed_opaque_existential_1(&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource], v502);
    swift_beginAccess();
    v504 = v622;
    v505 = (_QWORD *)swift_allocObject();
    v505[2] = v517;
    v505[3] = sub_2450E30AC;
    v505[4] = v483;
    v506 = *(void (**)(unint64_t, void *, _QWORD *, uint64_t, uint64_t))(v503 + 32);
    swift_retain();
    swift_bridgeObjectRetain();
    v518 = v517;
    v507 = sub_2450F3398;
    goto LABEL_228;
  }
  if (v492 == (id)3)
  {
    v493 = sub_245103910();
    v494 = sub_245103AB4();
    if (os_log_type_enabled(v493, v494))
    {
      v495 = (uint8_t *)swift_slowAlloc();
      v496 = swift_slowAlloc();
      v621 = v496;
      *(_DWORD *)v495 = 136315138;
      v497 = swift_bridgeObjectRetain();
      v498 = MEMORY[0x24952E644](v497, v475);
      v500 = v499;
      swift_bridgeObjectRelease();
      v501 = v498;
      v483 = v598;
      v620 = sub_245101AB4(v501, v500, (uint64_t *)&v621);
      sub_245103C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v493, v494, "Consulting Search datasource for reminders {itemType: task, criteria: %s}", v495, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v496, -1, -1);
      MEMORY[0x24952EEE4](v495, -1, -1);
    }

    v502 = *(_QWORD *)&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 24];
    v503 = *(_QWORD *)&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource
                          + 32];
    __swift_project_boxed_opaque_existential_1(&v605[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource], v502);
    v504 = v623;
    v505 = (_QWORD *)swift_allocObject();
    v505[2] = sub_2450E30AC;
    v505[3] = v483;
    v506 = *(void (**)(unint64_t, void *, _QWORD *, uint64_t, uint64_t))(v503 + 24);
    swift_bridgeObjectRetain();
    swift_retain();
    v507 = sub_2450F33C8;
LABEL_228:
    v506(v504, v507, v505, v502, v503);
    swift_bridgeObjectRelease();
    swift_release();
    goto LABEL_232;
  }
  v519 = sub_245103910();
  v520 = sub_245103AA8();
  if (os_log_type_enabled(v519, v520))
  {
    v521 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v521 = 0;
    _os_log_impl(&dword_2450D4000, v519, v520, "Unhandled itemType. Should have been cleaned up in resolve(). Return failure search result.", v521, 2u);
    MEMORY[0x24952EEE4](v521, -1, -1);
  }

  v522 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA098]), sel_initWithCode_userActivity_, 4, 0);
  (*((void (**)(const void *, id))v570 + 2))(v570, v522);

LABEL_232:
  sub_2450E35D8((uint64_t)v255, &qword_25744BCE8);
  swift_bridgeObjectRelease();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_2450F3348()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_2450F336C()
{
  uint64_t v0;

  swift_release();
  return swift_deallocObject();
}

void sub_2450F3398(uint64_t a1)
{
  uint64_t v1;

  sub_2450EDF50(a1, *(void **)(v1 + 16), *(void (**))(v1 + 24));
}

uint64_t sub_2450F33A4()
{
  swift_release();
  return swift_deallocObject();
}

void sub_2450F33C8(unint64_t a1)
{
  uint64_t v1;

  sub_2450EDA34(a1, *(void (**))(v1 + 16));
}

uint64_t sub_2450F33D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744B5A0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_2450F3418()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25744BD28;
  if (!qword_25744BD28)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25744BD20);
    result = MEMORY[0x24952EE3C](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_25744BD28);
  }
  return result;
}

_OWORD *sub_2450F3464(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_2450F3474()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_24510391C();
  __swift_allocate_value_buffer(v0, qword_25744BD70);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25744BD70);
  if (qword_25744B2B0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25744C4D0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

uint64_t sub_2450F3504(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  void (*v16)(uint64_t (*)(unint64_t), _QWORD *, uint64_t, uint64_t);
  id v17;

  v7 = objc_msgSend(a1, sel_tasks);
  if (v7)
  {
    v8 = v7;
    sub_2450D8184(0, &qword_25744B5C0);
    v9 = sub_2451039F4();

    v10 = swift_allocObject();
    *(_QWORD *)(v10 + 16) = a2;
    *(_QWORD *)(v10 + 24) = a3;
    swift_retain();
    sub_2450E7B68(v9, (uint64_t)sub_2450F489C, v10);
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = *(_QWORD **)(v3 + OBJC_IVAR____TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler_dataSource);
    v12 = (_QWORD *)swift_allocObject();
    v12[2] = a2;
    v12[3] = a3;
    v12[4] = a1;
    v13 = v11[6];
    v14 = v11[7];
    __swift_project_boxed_opaque_existential_1(v11 + 3, v13);
    v15 = (_QWORD *)swift_allocObject();
    v15[2] = v11;
    v15[3] = sub_2450F4840;
    v15[4] = v12;
    v16 = *(void (**)(uint64_t (*)(unint64_t), _QWORD *, uint64_t, uint64_t))(v14 + 8);
    swift_retain();
    v17 = a1;
    swift_retain();
    swift_retain();
    v16(sub_2450E8204, v15, v13, v14);
    swift_release();
  }
  return swift_release();
}

void sub_2450F3690(unint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  void **v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;

  if (!(a1 >> 62))
  {
    v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v4)
      goto LABEL_3;
LABEL_27:
    if (qword_25744B2E0 != -1)
      swift_once();
    v27 = sub_24510391C();
    __swift_project_value_buffer(v27, (uint64_t)qword_25744BD70);
    v28 = sub_245103910();
    v29 = sub_245103A84();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v30 = 0;
      _os_log_impl(&dword_2450D4000, v28, v29, "No reminders found for searchTerm {result: .unsupported(.noTasksFound)}", v30, 2u);
      MEMORY[0x24952EEE4](v30, -1, -1);
    }

    v13 = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 1);
    goto LABEL_32;
  }
  swift_bridgeObjectRetain();
  v26 = sub_245103DE4();
  swift_bridgeObjectRelease();
  if (!v26)
    goto LABEL_27;
  swift_bridgeObjectRetain();
  v4 = sub_245103DE4();
  swift_bridgeObjectRelease();
LABEL_3:
  if (v4 == 1)
  {
    if (qword_25744B2E0 != -1)
      swift_once();
    v5 = sub_24510391C();
    __swift_project_value_buffer(v5, (uint64_t)qword_25744BD70);
    v6 = sub_245103910();
    v7 = sub_245103A84();
    v4 = v7;
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_2450D4000, v6, (os_log_type_t)v4, "One reminder found for searchTerm {result: .success}", v8, 2u);
      MEMORY[0x24952EEE4](v8, -1, -1);
    }

    if ((a1 & 0xC000000000000001) != 0)
    {
      MEMORY[0x24952E92C](0, a1);
      goto LABEL_11;
    }
    if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v9 = *(id *)(a1 + 32);
LABEL_11:
      v10 = (void *)objc_opt_self();
      sub_2450D8184(0, &qword_25744B5C0);
      v11 = (void *)sub_245103B98();
      v12 = objc_msgSend(v10, sel_successWithResolvedTask_, v11);

      v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA188]), sel_initWithTaskResolutionResult_, v12);
LABEL_32:
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
      v31 = swift_allocObject();
      *(_OWORD *)(v31 + 16) = xmmword_245104540;
      *(_QWORD *)(v31 + 32) = v13;
      v33 = v31;
      sub_245103A0C();
      v32 = v13;
      a2(v33);
      swift_bridgeObjectRelease();

      return;
    }
    __break(1u);
  }
  else if (qword_25744B2E0 == -1)
  {
    goto LABEL_13;
  }
  swift_once();
LABEL_13:
  v14 = sub_24510391C();
  __swift_project_value_buffer(v14, (uint64_t)qword_25744BD70);
  swift_bridgeObjectRetain();
  v15 = sub_245103910();
  v16 = sub_245103A84();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v17 = 134217984;
    sub_245103C28();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v15, v16, "Found %ld reminders found for searchTerm {result: .disambiguation}", v17, 0xCu);
    MEMORY[0x24952EEE4](v17, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease();
  }
  if (!v4)
    goto LABEL_24;
  sub_245103D24();
  if ((v4 & 0x8000000000000000) == 0)
  {
    sub_2450D8184(0, &qword_25744B5C0);
    if ((a1 & 0xC000000000000001) != 0)
    {
      v18 = 0;
      do
      {
        v19 = v18 + 1;
        MEMORY[0x24952E92C]();
        sub_245103B98();
        sub_245103D0C();
        sub_245103D30();
        sub_245103D3C();
        sub_245103D18();
        v18 = v19;
      }
      while (v4 != v19);
    }
    else
    {
      v20 = (void **)(a1 + 32);
      do
      {
        v21 = *v20++;
        v22 = v21;
        sub_245103B98();
        sub_245103D0C();
        sub_245103D30();
        sub_245103D3C();
        sub_245103D18();
        --v4;
      }
      while (v4);
    }
LABEL_24:
    v23 = (void *)objc_opt_self();
    sub_2450D8184(0, &qword_25744B5C0);
    v24 = (void *)sub_2451039E8();
    swift_bridgeObjectRelease();
    v25 = objc_msgSend(v23, sel_disambiguationWithTasksToDisambiguate_, v24);

    v13 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA188]), sel_initWithTaskResolutionResult_, v25);
    goto LABEL_32;
  }
  __break(1u);
}

uint64_t sub_2450F3C50(unint64_t a1, void (*a2)(_QWORD), int a3, id a4)
{
  uint64_t v7;
  id v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  void (*v26)(_QWORD);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  id v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void **v47;
  void *v48;
  id v49;
  void *ObjCClassFromMetadata;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint8_t *v57;
  uint64_t v58;
  uint64_t v59;
  os_log_type_t v60;
  uint64_t v61;
  uint64_t v62;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v53 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v53)
    {
      swift_bridgeObjectRetain();
      v7 = sub_245103DE4();
      swift_bridgeObjectRelease();
      if (v7 == 1)
        goto LABEL_6;
LABEL_4:
      v8 = objc_msgSend(a4, sel_all);
      if (!v8 || (v9 = v8, v10 = objc_msgSend(v8, sel_BOOLValue), v9, !v10))
      {
        if (qword_25744B2E0 == -1)
        {
LABEL_17:
          v21 = sub_24510391C();
          __swift_project_value_buffer(v21, (uint64_t)qword_25744BD70);
          swift_bridgeObjectRetain_n();
          v22 = sub_245103910();
          v23 = sub_245103A9C();
          if (os_log_type_enabled(v22, v23))
          {
            v24 = (uint8_t *)swift_slowAlloc();
            v25 = swift_slowAlloc();
            v62 = v25;
            *(_DWORD *)v24 = 136315138;
            v26 = a2;
            v27 = sub_2450D8184(0, &qword_25744BDD0);
            v28 = swift_bridgeObjectRetain();
            v29 = MEMORY[0x24952E644](v28, v27);
            v31 = v30;
            swift_bridgeObjectRelease();
            v32 = v29;
            a2 = v26;
            sub_245101AB4(v32, v31, &v62);
            sub_245103C28();
            swift_bridgeObjectRelease_n();
            swift_bridgeObjectRelease();
            _os_log_impl(&dword_2450D4000, v22, v23, "Multiple reminders match but user didn't say 'all'. Ask the user to disambiguate which reminder to snooze. {reminders: %s, result: .disambiguation}", v24, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x24952EEE4](v25, -1, -1);
            MEMORY[0x24952EEE4](v24, -1, -1);

          }
          else
          {

            swift_bridgeObjectRelease_n();
          }
          __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
          v44 = swift_allocObject();
          *(_OWORD *)(v44 + 16) = xmmword_245104540;
          if (!v7)
            goto LABEL_39;
          v62 = MEMORY[0x24BEE4AF8];
          result = sub_245103D24();
          if ((v7 & 0x8000000000000000) == 0)
          {
            sub_2450D8184(0, &qword_25744B5C0);
            if ((a1 & 0xC000000000000001) != 0)
            {
              v45 = 0;
              do
              {
                v46 = v45 + 1;
                MEMORY[0x24952E92C]();
                sub_245103B98();
                sub_245103D0C();
                sub_245103D30();
                sub_245103D3C();
                sub_245103D18();
                v45 = v46;
              }
              while (v7 != v46);
            }
            else
            {
              v47 = (void **)(a1 + 32);
              do
              {
                v48 = *v47++;
                v49 = v48;
                sub_245103B98();
                sub_245103D0C();
                sub_245103D30();
                sub_245103D3C();
                sub_245103D18();
                --v7;
              }
              while (v7);
            }
LABEL_39:
            sub_2450D8184(0, &qword_25744BDC8);
            ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
            sub_2450D8184(0, &qword_25744B5C0);
            v51 = (void *)sub_2451039E8();
            swift_bridgeObjectRelease();
            v52 = objc_msgSend(ObjCClassFromMetadata, sel_disambiguationWithTasksToDisambiguate_, v51);

            *(_QWORD *)(v44 + 32) = v52;
            v62 = v44;
            sub_245103A0C();
            v37 = v62;
            goto LABEL_40;
          }
          goto LABEL_53;
        }
LABEL_51:
        swift_once();
        goto LABEL_17;
      }
LABEL_6:
      if (qword_25744B2E0 != -1)
        swift_once();
      v11 = sub_24510391C();
      __swift_project_value_buffer(v11, (uint64_t)qword_25744BD70);
      swift_bridgeObjectRetain_n();
      v12 = sub_245103910();
      v13 = sub_245103AB4();
      if (os_log_type_enabled(v12, v13))
      {
        v60 = v13;
        v14 = swift_slowAlloc();
        v59 = swift_slowAlloc();
        v62 = v59;
        *(_DWORD *)v14 = 134218242;
        sub_245103C28();
        *(_WORD *)(v14 + 12) = 2080;
        v15 = MEMORY[0x24BEE4AF8];
        if (v7)
        {
          v61 = MEMORY[0x24BEE4AF8];
          result = sub_245103D24();
          if (v7 < 0)
          {
            __break(1u);
LABEL_53:
            __break(1u);
            return result;
          }
          v17 = 0;
          do
          {
            if ((a1 & 0xC000000000000001) != 0)
              v18 = (id)MEMORY[0x24952E92C](v17, a1);
            else
              v18 = *(id *)(a1 + 8 * v17 + 32);
            v19 = v18;
            ++v17;
            v20 = objc_msgSend(v18, sel_objectID);

            sub_245103D0C();
            sub_245103D30();
            sub_245103D3C();
            sub_245103D18();
          }
          while (v7 != v17);
          v15 = v61;
        }
        v33 = sub_2450D8184(0, &qword_25744BA20);
        v34 = MEMORY[0x24952E644](v15, v33);
        v36 = v35;
        swift_bridgeObjectRelease();
        sub_245101AB4(v34, v36, &v62);
        sub_245103C28();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_2450D4000, v12, v60, "Resolved %ld tasks to snooze. {reminderIDs: %s, result: .success}", (uint8_t *)v14, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x24952EEE4](v59, -1, -1);
        MEMORY[0x24952EEE4](v14, -1, -1);

      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      v37 = MEMORY[0x24BEE4AF8];
      if (!v7)
      {
LABEL_40:
        a2(v37);
        return swift_bridgeObjectRelease();
      }
      v62 = MEMORY[0x24BEE4AF8];
      sub_245103D24();
      if ((v7 & 0x8000000000000000) == 0)
      {
        sub_2450D8184(0, &qword_25744BDC8);
        v38 = (void *)swift_getObjCClassFromMetadata();
        sub_2450D8184(0, &qword_25744B5C0);
        v39 = 0;
        do
        {
          if ((a1 & 0xC000000000000001) != 0)
            v40 = (id)MEMORY[0x24952E92C](v39, a1);
          else
            v40 = *(id *)(a1 + 8 * v39 + 32);
          ++v39;
          v41 = v40;
          v42 = (void *)sub_245103B98();
          v43 = objc_msgSend(v38, sel_successWithResolvedTask_, v42);

          sub_245103D0C();
          sub_245103D30();
          sub_245103D3C();
          sub_245103D18();
        }
        while (v7 != v39);
        a2(v62);
        return swift_bridgeObjectRelease();
      }
      __break(1u);
      goto LABEL_51;
    }
  }
  else
  {
    v7 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v7)
    {
      if (v7 == 1)
        goto LABEL_6;
      goto LABEL_4;
    }
  }
  if (qword_25744B2E0 != -1)
    swift_once();
  v54 = sub_24510391C();
  __swift_project_value_buffer(v54, (uint64_t)qword_25744BD70);
  v55 = sub_245103910();
  v56 = sub_245103AB4();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v57 = 0;
    _os_log_impl(&dword_2450D4000, v55, v56, "No reminders to snooze. {result: .unsupported(.noTasksFound)}", v57, 2u);
    MEMORY[0x24952EEE4](v57, -1, -1);
  }

  __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
  v58 = swift_allocObject();
  *(_OWORD *)(v58 + 16) = xmmword_245104540;
  *(_QWORD *)(v58 + 32) = objc_msgSend((id)objc_opt_self(), sel_unsupportedForReason_, 1);
  sub_245103A0C();
  a2(v58);
  return swift_bridgeObjectRelease();
}

void sub_2450F4600(uint64_t a1, uint64_t a2)
{
  id v3;

  sub_2450D8184(0, &qword_25744BDC8);
  v3 = (id)sub_2451039E8();
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v3);

}

id sub_2450F477C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRSnoozeTasksIntentHandler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TTRSnoozeTasksIntentHandler()
{
  return objc_opt_self();
}

uint64_t sub_2450F4814()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

uint64_t sub_2450F4840(unint64_t a1)
{
  uint64_t v1;

  return sub_2450F3C50(a1, *(void (**)(_QWORD))(v1 + 16), *(_QWORD *)(v1 + 24), *(id *)(v1 + 32));
}

uint64_t sub_2450F484C()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2450F4878()
{
  swift_release();
  return swift_deallocObject();
}

void sub_2450F489C(unint64_t a1)
{
  uint64_t v1;

  sub_2450F3690(a1, *(void (**)(uint64_t))(v1 + 16));
}

id sub_2450F48A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(uint64_t, uint64_t, uint64_t);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;

  v5 = v4;
  v10 = sub_245103430();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
  v13 = 0;
  if (v12(a1, 1, v10) != 1)
  {
    v13 = (void *)sub_2451033F4();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a1, v10);
  }
  if (v12(a2, 1, v10) == 1)
  {
    v14 = 0;
  }
  else
  {
    v14 = (void *)sub_2451033F4();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(a2, v10);
  }
  v15 = sub_2451034B4();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v16 + 48))(a3, 1, v15) != 1)
  {
    v17 = (void *)sub_245103490();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(a3, v15);
  }
  v18 = sub_2451034D8();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(a4, 1, v18) != 1)
  {
    v20 = (void *)sub_2451034C0();
    (*(void (**)(uint64_t, uint64_t))(v19 + 8))(a4, v18);
  }
  v21 = objc_msgSend(v5, sel_initWithStartDate_endDate_onCalendar_inTimeZone_, v13, v14, v17, v20);

  return v21;
}

unint64_t sub_2450F4A44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_245103E68();
  sub_2451039B8();
  v4 = sub_245103E74();
  return sub_2450F4AD8(a1, a2, v4);
}

unint64_t sub_2450F4AA8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_245103BEC();
  return sub_2450F4BB8(a1, v2);
}

unint64_t sub_2450F4AD8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_245103E38() & 1) == 0)
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
      while (!v14 && (sub_245103E38() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_2450F4BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_2450D8184(0, &qword_25744BA20);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_245103BF8();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_245103BF8();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_2450F4CD0(uint64_t a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  if ((a1 & 0xC000000000000001) != 0)
    return sub_245103D48();
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
  {
    v3 = 0;
    return __clz(__rbit64(v2)) + v3;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v1 = 1 << v5;
  if (v6 < 7)
    return v1;
  v2 = *(_QWORD *)(a1 + 72);
  if (v2)
  {
    v3 = 64;
    return __clz(__rbit64(v2)) + v3;
  }
  v7 = (unint64_t)(v1 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v3 = 64;
  while (v8)
  {
    v10 = *v9++;
    v2 = v10;
    --v8;
    v3 += 64;
    if (v10)
      return __clz(__rbit64(v2)) + v3;
  }
  return v1;
}

void sub_2450F4D90(uint64_t a1, uint64_t a2, char a3, uint64_t a4)
{
  char v6;
  char v7;
  void *v8;

  if ((a3 & 1) == 0)
  {
    if (a1 < 0 || -(-1 << *(_BYTE *)(a4 + 32)) <= a1)
    {
      __break(1u);
    }
    else if (((*(_QWORD *)(a4 + 64 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8)) >> a1) & 1) != 0)
    {
      if (*(_DWORD *)(a4 + 36) == (_DWORD)a2)
      {
        sub_245103C58();
        return;
      }
      goto LABEL_12;
    }
    __break(1u);
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  if (sub_245103D78() != *(_DWORD *)(a4 + 36))
  {
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  sub_245103D84();
  sub_2450F6768(a1, a2, 1);
  sub_2450D8184(0, &qword_25744BA20);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  sub_2450F4AA8((uint64_t)v8);
  v7 = v6;

  if ((v7 & 1) != 0)
  {
    sub_245103D60();
    sub_245103D9C();
    sub_2450F675C(a1, a2, 1);
    swift_unknownObjectRelease();
    return;
  }
LABEL_14:
  __break(1u);
}

void sub_2450F4F2C(uint64_t a1, int a2, char a3, uint64_t a4)
{
  unint64_t v5;
  char v6;
  char v7;
  id v8;
  void *v9;

  v5 = a1;
  if ((a4 & 0xC000000000000001) != 0)
  {
    if ((a3 & 1) != 0)
    {
      sub_245103DA8();
      sub_2450D8184(0, &qword_25744BDD0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      swift_unknownObjectRelease();
      return;
    }
    goto LABEL_17;
  }
  if ((a3 & 1) != 0)
    goto LABEL_10;
  if (a1 < 0 || 1 << *(_BYTE *)(a4 + 32) <= a1)
  {
    __break(1u);
    goto LABEL_14;
  }
  if (((*(_QWORD *)(a4 + (((unint64_t)a1 >> 3) & 0xFFFFFFFFFFFFF8) + 64) >> a1) & 1) == 0)
  {
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  if (*(_DWORD *)(a4 + 36) == a2)
  {
LABEL_12:
    v8 = *(id *)(*(_QWORD *)(a4 + 56) + 8 * v5);
    return;
  }
  __break(1u);
LABEL_10:
  if (sub_245103D78() != *(_DWORD *)(a4 + 36))
  {
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  sub_245103D84();
  sub_2450D8184(0, &qword_25744BA20);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  swift_unknownObjectRelease();
  v5 = sub_2450F4AA8((uint64_t)v9);
  v7 = v6;

  if ((v7 & 1) != 0)
    goto LABEL_12;
LABEL_16:
  __break(1u);
LABEL_17:
  __break(1u);
}

uint64_t sub_2450F50E8(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  void (*v20)(_BYTE *, _QWORD);
  unint64_t v21;
  _BYTE v22[32];
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t v26;

  v21 = a1 & 0xC000000000000001;
  if ((a1 & 0xC000000000000001) != 0)
    v4 = sub_245103C7C();
  else
    v4 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v4)
  {
    v26 = MEMORY[0x24BEE4AF8];
    sub_245103D24();
    result = sub_2450F4CD0(a1);
    v23 = result;
    v24 = v6;
    v25 = v7 & 1;
    if (v4 < 0)
    {
      __break(1u);
LABEL_16:
      __break(1u);
    }
    else
    {
      do
      {
        while (1)
        {
          v14 = v23;
          v15 = v24;
          v16 = v25;
          sub_2450F4F2C(v23, v24, v25, a1);
          v18 = v17;
          v19 = objc_msgSend(a2, sel_updateReminder_, v17);

          sub_245103D0C();
          sub_245103D30();
          sub_245103D3C();
          result = sub_245103D18();
          if (v21)
            break;
          sub_2450F4D90(v14, v15, v16, a1);
          v9 = v8;
          v11 = v10;
          v13 = v12;
          sub_2450F675C(v14, v15, v16);
          v23 = v9;
          v24 = v11;
          v25 = v13 & 1;
          if (!--v4)
            goto LABEL_13;
        }
        if ((v16 & 1) == 0)
          goto LABEL_16;
        if (sub_245103D6C())
          swift_isUniquelyReferenced_nonNull_native();
        __swift_instantiateConcreteTypeFromMangledName(&qword_25744BDD8);
        v20 = (void (*)(_BYTE *, _QWORD))sub_24510394C();
        sub_245103DCC();
        v20(v22, 0);
        --v4;
      }
      while (v4);
LABEL_13:
      sub_2450F675C(v23, v24, v25);
      return v26;
    }
  }
  return result;
}

uint64_t sub_2450F52E8(void *a1, uint64_t a2)
{
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  NSObject *v32;
  os_log_type_t v33;
  _BOOL4 v34;
  char **v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint8_t *v42;
  _QWORD *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  _QWORD *v48;
  void (*v49)(char *, char *, uint64_t);
  void (*v50)(char *, uint64_t, uint64_t, uint64_t);
  unsigned int (*v51)(uint64_t, uint64_t, uint64_t);
  char *v52;
  id v53;
  void *v54;
  char *v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void (*v62)(char *, uint64_t, uint64_t);
  char v63;
  void (*v64)(char *, char *, uint64_t);
  _QWORD *v65;
  uint64_t v66;
  void (*v67)(uint64_t, _QWORD, uint64_t, uint64_t);
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  id v73;
  id v74;
  NSObject *v75;
  os_log_type_t v76;
  uint8_t *v77;
  id v78;
  id v79;
  char *v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint8_t *v86;
  id v87;
  uint64_t (*v88)(char *, uint64_t);
  uint64_t v90;
  char *v91;
  char *v92;
  char *v93;
  char *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  char *v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  id v104;
  uint64_t v105;

  v101 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744BDE0);
  MEMORY[0x24BDAC7A8](v3);
  v94 = (char *)&v90 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744BCD8);
  MEMORY[0x24BDAC7A8](v5);
  v98 = (char *)&v90 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BCD0);
  MEMORY[0x24BDAC7A8](v7);
  v91 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v97 = (char *)&v90 - v10;
  MEMORY[0x24BDAC7A8](v11);
  v96 = (char *)&v90 - v12;
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v90 - v14;
  MEMORY[0x24BDAC7A8](v16);
  v93 = (char *)&v90 - v17;
  v18 = sub_245103430();
  v103 = *(_QWORD *)(v18 - 8);
  MEMORY[0x24BDAC7A8](v18);
  v92 = (char *)&v90 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v90 - v21;
  MEMORY[0x24BDAC7A8](v23);
  v25 = (char *)&v90 - v24;
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v90 - v27;
  if (qword_25744B2E0 != -1)
    swift_once();
  v29 = sub_24510391C();
  v30 = __swift_project_value_buffer(v29, (uint64_t)qword_25744BD70);
  v31 = a1;
  v95 = v30;
  v32 = sub_245103910();
  v33 = sub_245103AB4();
  v34 = os_log_type_enabled(v32, v33);
  v35 = &selRef_region;
  v99 = v28;
  v100 = v18;
  if (v34)
  {
    v36 = (uint8_t *)swift_slowAlloc();
    v37 = swift_slowAlloc();
    v102 = v25;
    v38 = v37;
    v105 = v37;
    *(_DWORD *)v36 = 136315138;
    v104 = objc_msgSend(v31, sel_nextTriggerTime);
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744BDF0);
    v39 = sub_245103994();
    v104 = (id)sub_245101AB4(v39, v40, &v105);
    v35 = &selRef_region;
    sub_245103C28();

    v18 = v100;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v32, v33, "Resolving nextTriggerTime {nextTriggerTime: %s}", v36, 0xCu);
    swift_arrayDestroy();
    v41 = v38;
    v25 = v102;
    MEMORY[0x24952EEE4](v41, -1, -1);
    v42 = v36;
    v28 = v99;
    MEMORY[0x24952EEE4](v42, -1, -1);

  }
  else
  {

  }
  sub_245103424();
  sub_245103424();
  sub_2451033E8();
  v43 = (_QWORD *)v103;
  v102 = *(char **)(v103 + 8);
  ((void (*)(char *, uint64_t))v102)(v22, v18);
  v44 = objc_msgSend(v31, v35[52]);
  if (v44)
  {
    v45 = v44;
    v46 = objc_msgSend(v44, sel_endDate);
    if (v46)
    {
      v47 = v46;
      sub_245103418();

      v48 = v43;
      v49 = (void (*)(char *, char *, uint64_t))v43[4];
      v49(v15, v22, v18);
      v50 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v48[7];
      v50(v15, 0, 1, v18);
      v51 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v48[6];
      if (v51((uint64_t)v15, 1, v18) != 1)
      {
        v59 = (uint64_t)v93;
        v49(v93, v15, v18);
        v50((char *)v59, 0, 1, v18);
        v60 = v59;
        v43 = (_QWORD *)v103;
        v52 = v92;
LABEL_16:
        if (v51(v60, 1, v18) == 1)
        {

          sub_2450F671C(v60);
        }
        else
        {
          v61 = v60;
          v62 = (void (*)(char *, uint64_t, uint64_t))v43[4];
          v62(v52, v61, v18);
          v63 = sub_245103400();

          if ((v63 & 1) != 0)
          {
            ((void (*)(char *, uint64_t))v102)(v25, v18);
            v62(v25, (uint64_t)v52, v18);
          }
          else
          {
            ((void (*)(char *, uint64_t))v102)(v52, v18);
          }
        }
        goto LABEL_21;
      }
      v43 = (_QWORD *)v103;
    }
    else
    {
      v50 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v43[7];
      v50(v15, 1, 1, v18);
    }
    v52 = v92;
    v53 = objc_msgSend(v45, sel_startDate);
    if (v53)
    {
      v54 = v53;
      v55 = v15;
      v56 = v91;
      sub_245103418();

      v57 = (uint64_t)v56;
      v15 = v55;
      v58 = 0;
    }
    else
    {
      v58 = 1;
      v57 = (uint64_t)v91;
    }
    v50((char *)v57, v58, 1, v18);
    v60 = (uint64_t)v93;
    sub_2450F6774(v57, (uint64_t)v93);
    sub_2450F671C((uint64_t)v15);
    v51 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v43[6];
    goto LABEL_16;
  }
LABEL_21:
  v64 = (void (*)(char *, char *, uint64_t))v43[2];
  v65 = v43;
  v66 = (uint64_t)v96;
  v64(v96, v28, v18);
  v67 = (void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v65[7];
  v67(v66, 0, 1, v18);
  v68 = (uint64_t)v97;
  v64(v97, v25, v18);
  v67(v68, 0, 1, v18);
  v69 = sub_2451034B4();
  v70 = (uint64_t)v98;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v69 - 8) + 56))(v98, 1, 1, v69);
  v71 = sub_2451034D8();
  v72 = (uint64_t)v94;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v71 - 8) + 56))(v94, 1, 1, v71);
  v73 = objc_allocWithZone(MEMORY[0x24BDD9C98]);
  v74 = sub_2450F48A4(v66, v68, v70, v72);
  v75 = sub_245103910();
  v76 = sub_245103AB4();
  if (os_log_type_enabled(v75, v76))
  {
    v77 = (uint8_t *)swift_slowAlloc();
    v103 = swift_slowAlloc();
    v105 = v103;
    *(_DWORD *)v77 = 136315138;
    v98 = (char *)(v77 + 4);
    v78 = v74;
    v79 = objc_msgSend(v78, sel_description);
    v80 = v25;
    v81 = sub_245103988();
    v83 = v82;

    v84 = v81;
    v25 = v80;
    v104 = (id)sub_245101AB4(v84, v83, &v105);
    sub_245103C28();

    v28 = v99;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v75, v76, "Resolved nextTriggerTime. {nextTriggerTime: %s, result: .success", v77, 0xCu);
    v85 = v103;
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v85, -1, -1);
    v86 = v77;
    v18 = v100;
    MEMORY[0x24952EEE4](v86, -1, -1);

  }
  else
  {

  }
  v87 = objc_msgSend((id)objc_opt_self(), sel_successWithResolvedDateComponentsRange_, v74);
  (*(void (**)(uint64_t, id))(v101 + 16))(v101, v87);

  v88 = (uint64_t (*)(char *, uint64_t))v102;
  ((void (*)(char *, uint64_t))v102)(v25, v18);
  return v88(v28, v18);
}

void sub_2450F5B5C(void *a1, char *a2, uint64_t a3)
{
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
  uint64_t v14;
  uint8_t *v15;
  id v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint8_t *v21;
  _QWORD *v22;
  id v23;
  id v24;
  uint8_t *v25;
  uint8_t *v26;
  id v27;
  void *v28;
  unint64_t v29;
  char *v30;
  id v31;
  void *v32;
  char *v33;
  void (*v34)(char *, char *, uint64_t);
  double v35;
  double v36;
  unint64_t v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t i;
  id v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  id v48;
  void (*v49)(void);
  NSObject *v50;
  os_log_type_t v51;
  _BOOL4 v52;
  uint64_t v53;
  uint8_t *v54;
  void *v55;
  id v56;
  id v57;
  uint64_t v58;
  id v59;
  char *v60;
  uint64_t v61;
  uint64_t j;
  id v63;
  void *v64;
  id v65;
  unsigned int v66;
  id v67;
  NSObject *v68;
  os_log_type_t v69;
  uint8_t *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  void *v80;
  NSObject *v81;
  os_log_type_t v82;
  uint8_t *v83;
  void *v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  id v91;
  id v92;
  id v93;
  id v94;
  uint64_t v95;
  uint8_t *v96;
  char *v97;
  char *v98;
  uint64_t v99;
  char *v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  id v104[2];

  v102 = a3;
  v98 = a2;
  v104[1] = *(id *)MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BCD0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v94 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_245103430();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v94 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v94 - v12;
  if (qword_25744B2E0 != -1)
    swift_once();
  v14 = sub_24510391C();
  v15 = (uint8_t *)__swift_project_value_buffer(v14, (uint64_t)qword_25744BD70);
  v16 = a1;
  v17 = sub_245103910();
  v18 = sub_245103AB4();
  v19 = os_log_type_enabled(v17, v18);
  v101 = v10;
  if (v19)
  {
    v97 = v6;
    v20 = swift_slowAlloc();
    v99 = v7;
    v21 = (uint8_t *)v20;
    v22 = (_QWORD *)swift_slowAlloc();
    v96 = v21;
    *(_DWORD *)v21 = 138412290;
    v104[0] = v16;
    v23 = v16;
    v100 = v13;
    v24 = v23;
    v6 = v97;
    sub_245103C28();
    *v22 = v16;

    v13 = v100;
    v25 = v96;
    _os_log_impl(&dword_2450D4000, v17, v18, "SiriKit asked for handling snooze tasks intent {intent: %@}", v96, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v22, -1, -1);
    v26 = v25;
    v7 = v99;
    MEMORY[0x24952EEE4](v26, -1, -1);

  }
  else
  {

  }
  v27 = objc_msgSend(v16, sel_tasks);
  if (!v27)
  {
    v45 = sub_245103910();
    v46 = sub_245103A9C();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_2450D4000, v45, v46, "No .tasks to snooze. Should have resolved this in resolve stage. Giving up", v47, 2u);
      MEMORY[0x24952EEE4](v47, -1, -1);
    }

    v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA180]), sel_initWithCode_userActivity_, 4, 0);
    v49 = *(void (**)(void))(v102 + 16);
    goto LABEL_32;
  }
  v28 = v27;
  sub_2450D8184(0, &qword_25744B5C0);
  v29 = sub_2451039F4();
  v30 = (char *)objc_msgSend(v16, sel_nextTriggerTime);
  if (!v30)
  {
    swift_bridgeObjectRelease();

LABEL_29:
    v50 = sub_245103910();
    v51 = sub_245103A9C();
    v52 = os_log_type_enabled(v50, v51);
    v53 = v102;
    if (v52)
    {
      v54 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v54 = 0;
      _os_log_impl(&dword_2450D4000, v50, v51, "No nextTriggerTime.endDate. Should have resolved this in resolve stage. Giving up.", v54, 2u);
      MEMORY[0x24952EEE4](v54, -1, -1);
    }

    v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA180]), sel_initWithCode_userActivity_, 4, 0);
    v49 = *(void (**)(void))(v53 + 16);
LABEL_32:
    v49();

    return;
  }
  v96 = v15;
  v97 = v30;
  v31 = objc_msgSend(v30, sel_endDate);
  if (!v31)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_28;
  }
  v32 = v31;
  v33 = v101;
  sub_245103418();

  v34 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v34(v6, v33, v7);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_28:

    swift_bridgeObjectRelease();
    sub_2450F671C((uint64_t)v6);
    goto LABEL_29;
  }
  v34(v13, v6, v7);
  v100 = v13;
  sub_24510340C();
  v36 = v35;
  v37 = *(_QWORD *)&v98[OBJC_IVAR____TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler_store];
  v38 = (char *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BE7D250]), sel_initWithStore_, v37);
  v104[0] = (id)MEMORY[0x24BEE4AF8];
  if (v29 >> 62)
  {
    swift_bridgeObjectRetain();
    v39 = sub_245103DE4();
  }
  else
  {
    v39 = *(_QWORD *)((v29 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }
  v94 = v28;
  v95 = v8;
  v101 = v38;
  if (v39)
  {
    if (v39 < 1)
    {
      __break(1u);
      goto LABEL_46;
    }
    v40 = v37;
    for (i = 0; i != v39; ++i)
    {
      if ((v29 & 0xC000000000000001) != 0)
        v42 = (id)MEMORY[0x24952E92C](i, v29);
      else
        v42 = *(id *)(v29 + 8 * i + 32);
      v43 = v42;
      v44 = sub_245103B68();

      if (v44)
      {
        MEMORY[0x24952E620]();
        if (*(_QWORD *)(((unint64_t)v104[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)(((unint64_t)v104[0] & 0xFFFFFFFFFFFFFF8)
                                                                                                + 0x18) >> 1)
          sub_245103A18();
        sub_245103A24();
        sub_245103A0C();
      }
    }
    swift_bridgeObjectRelease();
    v37 = v40;
    v38 = v101;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v29 = sub_2450D8184(0, &qword_25744BA20);
  v55 = (void *)sub_2451039E8();
  v104[0] = 0;
  v56 = objc_msgSend((id)v37, sel_fetchRemindersWithObjectIDs_error_, v55, v104);

  v57 = v104[0];
  v99 = v7;
  if (!v56)
    goto LABEL_51;
  sub_2450D8184(0, &qword_25744BDD0);
  sub_2450EB1F4();
  v58 = sub_245103934();
  v59 = v57;

  v60 = v38;
  v98 = v60;
  v37 = sub_2450F50E8(v58, v60);
  swift_bridgeObjectRelease();

  if (v37 >> 62)
  {
LABEL_46:
    swift_bridgeObjectRetain();
    v61 = sub_245103DE4();
    if (v61)
      goto LABEL_38;
    goto LABEL_47;
  }
  v61 = *(_QWORD *)((v37 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v61)
  {
LABEL_38:
    if (v61 < 1)
      __break(1u);
    for (j = 0; j != v61; ++j)
    {
      if ((v37 & 0xC000000000000001) != 0)
        v63 = (id)MEMORY[0x24952E92C](j, v37);
      else
        v63 = *(id *)(v37 + 8 * j + 32);
      v64 = v63;
      objc_msgSend(v63, sel_snoozeFromNowForTimeInterval_, v36, v94);

    }
  }
LABEL_47:
  swift_bridgeObjectRelease_n();
  v104[0] = 0;
  v65 = v98;
  v66 = objc_msgSend(v98, sel_saveSynchronouslyWithError_, v104);
  v57 = v104[0];
  if (v66)
  {
    v67 = v104[0];
    sub_245103520();
    swift_retain();
    sub_245103514();
    swift_release();
    swift_bridgeObjectRetain();
    v68 = sub_245103910();
    v69 = sub_245103AB4();
    if (os_log_type_enabled(v68, v69))
    {
      v70 = (uint8_t *)swift_slowAlloc();
      v71 = (void *)swift_slowAlloc();
      v104[0] = v71;
      *(_DWORD *)v70 = 136315138;
      v72 = swift_bridgeObjectRetain();
      v73 = MEMORY[0x24952E644](v72, v29);
      v75 = v74;
      swift_bridgeObjectRelease();
      v76 = v73;
      v65 = v98;
      v103 = sub_245101AB4(v76, v75, (uint64_t *)v104);
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v68, v69, "Successfully snoozed reminders. {reminderIDs: %s}", v70, 0xCu);
      swift_arrayDestroy();
      v77 = v102;
      MEMORY[0x24952EEE4](v71, -1, -1);
      MEMORY[0x24952EEE4](v70, -1, -1);

      v78 = v99;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      v78 = v99;
      v77 = v102;
    }
    v92 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA180]), sel_initWithCode_userActivity_, 3, 0);
    v93 = v94;
    objc_msgSend(v92, sel_setSnoozedTasks_, v94);

    (*(void (**)(uint64_t, id))(v77 + 16))(v77, v92);
    (*(void (**)(char *, uint64_t))(v95 + 8))(v100, v78);
    return;
  }
  v7 = v99;
  v38 = v101;
LABEL_51:
  v79 = v57;

  v80 = (void *)sub_2451033A0();
  swift_willThrow();
  swift_bridgeObjectRetain();
  v81 = sub_245103910();
  v82 = sub_245103A9C();
  if (os_log_type_enabled(v81, v82))
  {
    v83 = (uint8_t *)swift_slowAlloc();
    v84 = (void *)swift_slowAlloc();
    v104[0] = v84;
    *(_DWORD *)v83 = 136315138;
    v85 = swift_bridgeObjectRetain();
    v86 = v80;
    v87 = MEMORY[0x24952E644](v85, v29);
    v89 = v88;
    swift_bridgeObjectRelease();
    v90 = v87;
    v80 = v86;
    v103 = sub_245101AB4(v90, v89, (uint64_t *)v104);
    v38 = v101;
    v7 = v99;
    sub_245103C28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v81, v82, "Error snoozing reminders {reminderIDs: %s}", v83, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v84, -1, -1);
    MEMORY[0x24952EEE4](v83, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v91 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA180]), sel_initWithCode_userActivity_, 4, 0);
  (*(void (**)(uint64_t, id))(v102 + 16))(v102, v91);

  (*(void (**)(char *, uint64_t))(v95 + 8))(v100, v7);
}

uint64_t sub_2450F671C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BCD0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2450F675C(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_2450F6768(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t result;

  if ((a3 & 1) != 0)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_2450F6774(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BCD0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_2450F67BC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_2450F67E0(uint64_t a1)
{
  uint64_t v1;

  sub_2450F4600(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_2450F67E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_24510391C();
  __swift_allocate_value_buffer(v0, qword_25744BE00);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25744BE00);
  if (qword_25744B2B0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25744C4D0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

id sub_2450F6878()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___contactStore;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___contactStore);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___contactStore);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBACF8]), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id TTRIntentHandler.handler(for:)@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t *v11;
  uint64_t (*v12)(uint64_t);
  uint64_t v13;
  uint64_t v14;
  id result;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  _QWORD *v20;
  NSObject *v21;
  uint64_t ObjectType;
  void *v23;

  ObjectType = swift_getObjectType();
  if (qword_25744B2E8 != -1)
    swift_once();
  v4 = sub_24510391C();
  __swift_project_value_buffer(v4, (uint64_t)qword_25744BE00);
  v5 = a1;
  v6 = sub_245103910();
  v7 = sub_245103A90();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v5;
    sub_245103C28();
    *v9 = v5;

    _os_log_impl(&dword_2450D4000, v6, v7, "SiriKit asks for handler for intent: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v9, -1, -1);
    MEMORY[0x24952EEE4](v8, -1, -1);

  }
  else
  {

  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v11 = &OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___addTasksHandler;
    v12 = (uint64_t (*)(uint64_t))sub_2450F717C;
LABEL_8:
    v13 = sub_2450F6ED0(v11, v12);
LABEL_11:
    v14 = v13;
    result = (id)swift_getObjectType();
LABEL_12:
    a2[3] = (uint64_t)result;
    *a2 = v14;
    return result;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v13 = (uint64_t)sub_2450F6CD4();
    goto LABEL_11;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v11 = &OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___snoozeTasksHandler;
    v12 = (uint64_t (*)(uint64_t))sub_2450F7418;
    goto LABEL_8;
  }
  objc_opt_self();
  if (swift_dynamicCastObjCClass())
  {
    v11 = &OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___searchForNotebookItemsHandler;
    v12 = (uint64_t (*)(uint64_t))sub_2450F7574;
    goto LABEL_8;
  }
  sub_2451036DC();
  if (swift_dynamicCastClass())
  {
    v14 = (uint64_t)sub_2450F6F30();
    result = (id)type metadata accessor for ConfigurationIntentHandler();
    goto LABEL_12;
  }
  v16 = v5;
  v17 = sub_245103910();
  v18 = sub_245103AA8();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    v20 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v19 = 138412290;
    v21 = v16;
    sub_245103C28();
    *v20 = v16;

    _os_log_impl(&dword_2450D4000, v17, v18, "TTRIntentHandler does not know how to handle intent of class: %@", v19, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B8B0);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v20, -1, -1);
    MEMORY[0x24952EEE4](v19, -1, -1);
  }
  else
  {

    v17 = v16;
  }

  a2[3] = ObjectType;
  *a2 = (uint64_t)v23;
  return v23;
}

id sub_2450F6CD4()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  id v19;
  id v20;
  char *v21;
  id v22;

  v1 = OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___setTaskAttributeHandler;
  if (*(_QWORD *)&v0[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___setTaskAttributeHandler])
  {
    v2 = *(id *)&v0[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___setTaskAttributeHandler];
  }
  else
  {
    v3 = v0;
    v4 = *(void **)&v0[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_store];
    v5 = *(void **)&v3[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_queue];
    type metadata accessor for TTRIntentsHandlerStoreDataSource();
    v6 = swift_allocObject();
    v7 = qword_25744B2C8;
    v8 = v4;
    if (v7 != -1)
      swift_once();
    v9 = sub_24510391C();
    __swift_project_value_buffer(v9, (uint64_t)qword_25744BA38);
    v10 = sub_245103910();
    v11 = sub_245103AB4();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_2450D4000, v10, v11, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v12, 2u);
      MEMORY[0x24952EEE4](v12, -1, -1);
    }

    *(_QWORD *)(v6 + 16) = v8;
    type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
    v13 = swift_allocObject();
    v14 = v8;
    v15 = v5;
    v16 = sub_2450F7A08((uint64_t)v14, (uint64_t)v15, v6, v13);
    v17 = swift_allocObject();
    *(_QWORD *)(v17 + 16) = v3;
    sub_245103610();
    v18 = (uint64_t *)swift_allocObject();
    v19 = v14;
    v20 = v15;
    v21 = v3;
    v22 = sub_2450F7D24((uint64_t)v19, (uint64_t)v20, (uint64_t)sub_2450F8074, v17, v16, v18);
    *(_QWORD *)&v3[v1] = v22;
    v2 = v22;
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v2;
}

uint64_t sub_2450F6ED0(uint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a1;
  v4 = *(_QWORD *)(v2 + *a1);
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v5 = a2(v2);
    *(_QWORD *)(v2 + v3) = v5;
    swift_unknownObjectRetain();
    swift_unknownObjectRelease();
  }
  swift_unknownObjectRetain();
  return v5;
}

id sub_2450F6F30()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  char *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;

  v1 = OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___widgetListHandler;
  v2 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___widgetListHandler);
  if (v2)
  {
    v3 = *(id *)(v0 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___widgetListHandler);
  }
  else
  {
    v4 = v0;
    v5 = *(void **)(v0 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_store);
    v6 = *(void **)(v4 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_queue);
    type metadata accessor for TTRIntentsHandlerStoreDataSource();
    v7 = swift_allocObject();
    v8 = qword_25744B2C8;
    v9 = v5;
    if (v8 != -1)
      swift_once();
    v10 = sub_24510391C();
    __swift_project_value_buffer(v10, (uint64_t)qword_25744BA38);
    v11 = sub_245103910();
    v12 = sub_245103AB4();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_2450D4000, v11, v12, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v13, 2u);
      MEMORY[0x24952EEE4](v13, -1, -1);
    }

    *(_QWORD *)(v7 + 16) = v9;
    type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
    v14 = swift_allocObject();
    v15 = v9;
    v16 = v6;
    v17 = sub_2450F7A08((uint64_t)v15, (uint64_t)v16, v7, v14);
    v18 = (char *)objc_allocWithZone((Class)type metadata accessor for ConfigurationIntentHandler());
    v19 = v15;
    v20 = v16;
    v21 = sub_2450F7ED4(v19, v20, v17, v18);

    v22 = *(void **)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v21;
    v3 = v21;

    v2 = 0;
  }
  v23 = v2;
  return v3;
}

id sub_2450F717C(char *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  double v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  char *v27;
  id v28;
  _QWORD v31[5];

  v2 = *(void **)&a1[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_store];
  v3 = *(void **)&a1[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_queue];
  type metadata accessor for TTRIntentsHandlerStoreDataSource();
  v4 = swift_allocObject();
  v5 = qword_25744B2C8;
  v6 = v2;
  if (v5 != -1)
    swift_once();
  v7 = sub_24510391C();
  __swift_project_value_buffer(v7, (uint64_t)qword_25744BA38);
  v8 = sub_245103910();
  v9 = sub_245103AB4();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_2450D4000, v8, v9, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v10, 2u);
    MEMORY[0x24952EEE4](v10, -1, -1);
  }

  *(_QWORD *)(v4 + 16) = v6;
  type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v11 = swift_allocObject();
  v12 = v6;
  v13 = v3;
  v14 = sub_2450F7A08((uint64_t)v12, (uint64_t)v13, v4, v11);
  v15 = swift_allocObject();
  *(_QWORD *)(v15 + 16) = a1;
  sub_245103610();
  v16 = swift_allocObject();
  v31[3] = &type metadata for TTRContactRepresentationResolver;
  v31[4] = &off_251605FB8;
  v31[0] = sub_2450F7B44;
  v31[1] = v15;
  v17 = objc_allocWithZone((Class)type metadata accessor for TTRAddTasksIntentHandler());
  v18 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v31, (uint64_t)&type metadata for TTRContactRepresentationResolver);
  v19 = MEMORY[0x24BDAC7A8](v18);
  v21 = (_QWORD *)((char *)&v31[-1] - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *, double))(v22 + 16))(v21, v19);
  v23 = *v21;
  v24 = v21[1];
  v25 = v12;
  v26 = v13;
  v27 = a1;
  swift_retain();
  swift_retain();
  swift_retain();
  v28 = sub_2450F7B8C((uint64_t)v25, (uint64_t)v26, v14, v23, v24, v16, v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v31);
  swift_release();
  swift_release();
  swift_release();
  return v28;
}

id sub_2450F7418(uint64_t a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_class *v8;
  char *v9;
  id v10;
  id v11;
  objc_super v13;
  __int128 v14;
  uint64_t v15;
  _UNKNOWN **v16;

  sub_245103988();
  v2 = objc_allocWithZone(MEMORY[0x24BDF88B8]);
  v3 = (void *)sub_245103964();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithBundleIdentifier_, v3);

  v5 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_store);
  v15 = sub_2450D8184(0, (unint64_t *)&unk_25744BEF0);
  v16 = &off_251605FC8;
  *(_QWORD *)&v14 = v4;
  type metadata accessor for TTRIntentsHandlerNotificationCenterDataSource();
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  sub_2450F7D0C(&v14, v6 + 24);
  v7 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_queue);
  v8 = (objc_class *)type metadata accessor for TTRSnoozeTasksIntentHandler();
  v9 = (char *)objc_allocWithZone(v8);
  *(_QWORD *)&v9[OBJC_IVAR____TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler_store] = v5;
  *(_QWORD *)&v9[OBJC_IVAR____TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler_queue] = v7;
  *(_QWORD *)&v9[OBJC_IVAR____TtC25RemindersIntentsFramework27TTRSnoozeTasksIntentHandler_dataSource] = v6;
  v13.receiver = v9;
  v13.super_class = v8;
  v10 = v5;
  v11 = v7;
  return objc_msgSendSuper2(&v13, sel_init);
}

id sub_2450F7574(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  char *v18;
  id v19;
  id v20;
  id v21;
  objc_super v23;
  _QWORD v24[5];
  _BYTE v25[40];
  _QWORD v26[5];

  v1 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_store);
  v2 = *(void **)(a1 + OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_queue);
  type metadata accessor for TTRIntentsHandlerStoreDataSource();
  v3 = swift_allocObject();
  v4 = qword_25744B2C8;
  v5 = v1;
  if (v4 != -1)
    swift_once();
  v6 = sub_24510391C();
  __swift_project_value_buffer(v6, (uint64_t)qword_25744BA38);
  v7 = sub_245103910();
  v8 = sub_245103AB4();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_2450D4000, v7, v8, "[TTRIntentsHandlerStoreDataSource] Using the backup intents handler data source", v9, 2u);
    MEMORY[0x24952EEE4](v9, -1, -1);
  }

  *(_QWORD *)(v3 + 16) = v5;
  v10 = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v11 = swift_allocObject();
  v12 = v5;
  v13 = v2;
  swift_retain();
  v14 = sub_2450F7A08((uint64_t)v12, (uint64_t)v13, v3, v11);
  v26[3] = v10;
  v26[4] = &off_251606768;
  swift_release();
  v26[0] = v14;
  sub_2450E3474((uint64_t)v26, (uint64_t)v25);
  v15 = sub_245103610();
  v16 = swift_allocObject();
  v24[3] = v15;
  v24[4] = MEMORY[0x24BE7E6D0];
  v24[0] = v16;
  v17 = (objc_class *)type metadata accessor for TTRSearchForNotebookItemsIntentHandler();
  v18 = (char *)objc_allocWithZone(v17);
  *(_QWORD *)&v18[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_store] = v12;
  *(_QWORD *)&v18[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_queue] = v13;
  sub_2450E3474((uint64_t)v25, (uint64_t)&v18[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_dataSource]);
  sub_2450E3474((uint64_t)v24, (uint64_t)&v18[OBJC_IVAR____TtC25RemindersIntentsFramework38TTRSearchForNotebookItemsIntentHandler_timeProvider]);
  v23.receiver = v18;
  v23.super_class = v17;
  v19 = v12;
  v20 = v13;
  swift_retain();
  v21 = objc_msgSendSuper2(&v23, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v24);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v25);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  return v21;
}

id TTRIntentHandler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id TTRIntentHandler.init()()
{
  char *v0;
  objc_class *ObjectType;
  uint64_t v2;
  id v3;
  char *v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v2 = OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_store;
  v3 = objc_allocWithZone(MEMORY[0x24BE7D290]);
  v4 = v0;
  *(_QWORD *)&v0[v2] = objc_msgSend(v3, sel_initUserInteractive_, 1);
  v5 = OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler_queue;
  sub_2450D8184(0, (unint64_t *)&qword_25744B300);
  *(_QWORD *)&v4[v5] = sub_245103AFC();
  *(_QWORD *)&v4[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___contactStore] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___addTasksHandler] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___setTaskAttributeHandler] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___snoozeTasksHandler] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___searchForNotebookItemsHandler] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtC25RemindersIntentsFramework16TTRIntentHandler____lazy_storage___widgetListHandler] = 0;

  v7.receiver = v4;
  v7.super_class = ObjectType;
  return objc_msgSendSuper2(&v7, sel_init);
}

id TTRIntentHandler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for TTRIntentHandler()
{
  return objc_opt_self();
}

uint64_t sub_2450F7A08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  __int128 v13;
  uint64_t v14;
  _UNKNOWN **v15;

  v14 = type metadata accessor for TTRIntentsHandlerStoreDataSource();
  v15 = &off_2516060A0;
  *(_QWORD *)&v13 = a3;
  if (qword_25744B2F8 != -1)
    swift_once();
  v8 = sub_24510391C();
  __swift_project_value_buffer(v8, (uint64_t)qword_25744BFA8);
  v9 = sub_245103910();
  v10 = sub_245103AB4();
  if (os_log_type_enabled(v9, v10))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_2450D4000, v9, v10, "[TTRIntentsHandlerSpotlightDataSource] Using the Spotlight intents handler data source", v11, 2u);
    MEMORY[0x24952EEE4](v11, -1, -1);
  }

  *(_QWORD *)(a4 + 16) = a1;
  *(_QWORD *)(a4 + 24) = a2;
  sub_2450F7D0C(&v13, a4 + 32);
  return a4;
}

uint64_t sub_2450F7B20()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_2450F7B44()
{
  return sub_2450F6878();
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

id sub_2450F7B8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  id v14;
  objc_super v16;
  _QWORD v17[5];
  _QWORD v18[5];
  _BYTE v19[24];
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[5];

  v22[3] = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v22[4] = &off_251606768;
  v22[0] = a3;
  v20 = MEMORY[0x24BE7E810];
  v21 = MEMORY[0x24BE7E808];
  v18[3] = sub_245103610();
  v18[4] = MEMORY[0x24BE7E6D0];
  v18[0] = a6;
  v17[3] = &type metadata for TTRContactRepresentationResolver;
  v17[4] = &off_251605FB8;
  v17[0] = a4;
  v17[1] = a5;
  a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_didNotSpecifyTargetList] = 0;
  sub_2450E3474((uint64_t)v18, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_timeProvider]);
  *(_QWORD *)&a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_store] = a1;
  *(_QWORD *)&a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_queue] = a2;
  sub_2450E3474((uint64_t)v22, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_dataSource]);
  sub_2450E3474((uint64_t)v17, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_contactRepresentationResolver]);
  sub_2450E3474((uint64_t)v19, (uint64_t)&a7[OBJC_IVAR____TtC25RemindersIntentsFramework24TTRAddTasksIntentHandler_userActivityProvider]);
  v16.receiver = a7;
  v16.super_class = (Class)type metadata accessor for TTRAddTasksIntentHandler();
  v14 = objc_msgSendSuper2(&v16, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v18);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v17);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v22);
  return v14;
}

uint64_t sub_2450F7D0C(__int128 *a1, uint64_t a2)
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

id sub_2450F7D24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v12;
  objc_class *v13;
  char *v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  __int128 *v18;
  uint64_t v19;
  id v20;
  objc_super v22;
  __int128 v23;
  ValueMetadata *v24;
  _UNKNOWN **v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];

  v12 = *a6;
  v28[4] = &off_251606768;
  v28[3] = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v28[0] = a5;
  v27[3] = &type metadata for TTRContactRepresentationResolver;
  v27[4] = &off_251605FB8;
  v27[0] = a3;
  v27[1] = a4;
  v26[3] = v12;
  v26[4] = MEMORY[0x24BE7E6D0];
  v26[0] = a6;
  v13 = (objc_class *)type metadata accessor for TTRSetTaskAttributeIntentHandler();
  v14 = (char *)objc_allocWithZone(v13);
  v15 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v27, (uint64_t)&type metadata for TTRContactRepresentationResolver);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v18 = (__int128 *)((char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(__int128 *, double))(v19 + 16))(v18, v16);
  v24 = &type metadata for TTRContactRepresentationResolver;
  v25 = &off_251605FB8;
  v23 = *v18;
  *(_QWORD *)&v14[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_store] = a1;
  *(_QWORD *)&v14[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_queue] = a2;
  sub_2450E3474((uint64_t)&v23, (uint64_t)&v14[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_contactRepresentationResolver]);
  sub_2450E3474((uint64_t)v28, (uint64_t)&v14[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_dataSource]);
  sub_2450E3474((uint64_t)v26, (uint64_t)&v14[OBJC_IVAR____TtC25RemindersIntentsFramework32TTRSetTaskAttributeIntentHandler_timeProvider]);
  v22.receiver = v14;
  v22.super_class = v13;
  v20 = objc_msgSendSuper2(&v22, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v28);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v23);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v27);
  return v20;
}

id sub_2450F7ED4(void *a1, void *a2, uint64_t a3, char *a4)
{
  objc_class *ObjectType;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  id v15;
  id v16;
  id v17;
  objc_super v19;
  _QWORD v20[5];

  ObjectType = (objc_class *)swift_getObjectType();
  v20[3] = type metadata accessor for TTRIntentsHandlerSpotlightDataSource();
  v20[4] = &off_251606768;
  v20[0] = a3;
  *(int64x2_t *)&a4[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_badgeSize] = vdupq_n_s64(0x4040000000000000uLL);
  v9 = qword_25744B2F0;
  v10 = a4;
  if (v9 != -1)
    swift_once();
  v11 = sub_24510391C();
  __swift_project_value_buffer(v11, (uint64_t)qword_25744BF18);
  v12 = sub_245103910();
  v13 = sub_245103AB4();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v14 = 0;
    _os_log_impl(&dword_2450D4000, v12, v13, "ConfigurationIntentHandler Created", v14, 2u);
    MEMORY[0x24952EEE4](v14, -1, -1);
  }

  *(_QWORD *)&v10[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_store] = a1;
  *(_QWORD *)&v10[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_queue] = a2;
  sub_2450E3474((uint64_t)v20, (uint64_t)&v10[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource]);
  v15 = a1;
  v16 = a2;

  v19.receiver = v10;
  v19.super_class = ObjectType;
  v17 = objc_msgSendSuper2(&v19, sel_init);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  return v17;
}

uint64_t sub_2450F8078(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  int v27;
  void (*v28)(_QWORD, _QWORD, _QWORD);
  unint64_t v29;
  char *v30;
  void (*v31)(char *, uint64_t);
  unsigned int (*v32)(char *, uint64_t);
  void (*v33)(char *, uint64_t);
  uint64_t v34;
  void (*v35)(_QWORD, _QWORD);
  uint64_t v36;
  char *v37;
  uint64_t v38;
  char *v39;
  char v40;
  void (*v41)(char *, _QWORD);
  char *v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t result;
  uint64_t v47;
  unint64_t v48;
  int v49;
  char *v50;
  char *v51;
  uint64_t v52;
  void (*v53)(char *, uint64_t, uint64_t);
  char *v54;
  uint64_t v55;
  void (*v56)(char *, uint64_t);
  char *v57;
  char *v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char *v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  char *v69;
  char *v70;
  uint64_t v71;
  unint64_t v72;
  int v73;
  unsigned int v74;
  char *v75;
  void (*v76)(_QWORD, _QWORD, _QWORD);
  char *v77;
  char *v78;
  char *v79;
  uint64_t v80;
  void (*v81)(_QWORD, _QWORD);
  unsigned int (*v82)(char *, uint64_t);
  void (*v83)(char *, uint64_t);
  uint64_t v84;

  v71 = a1;
  v3 = sub_245103700();
  v80 = *(_QWORD *)(v3 - 8);
  v81 = (void (*)(_QWORD, _QWORD))v3;
  MEMORY[0x24BDAC7A8](v3);
  v79 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v78 = (char *)&v64 - v6;
  v7 = sub_2451036D0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v64 - v12;
  MEMORY[0x24BDAC7A8](v14);
  v69 = (char *)&v64 - v15;
  MEMORY[0x24BDAC7A8](v16);
  v70 = (char *)&v64 - v17;
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v64 - v19;
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v64 - v22;
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v62 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v62 < 2)
      goto LABEL_12;
  }
  else if (*(uint64_t *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10) < 2)
  {
LABEL_12:
    swift_bridgeObjectRetain();
    if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_245103DE4())
      goto LABEL_29;
    v43 = MEMORY[0x24BEE4B08];
LABEL_14:
    v84 = v43;
    v44 = swift_bridgeObjectRetain();
    v45 = sub_2450FA424(v44);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v45;
  }
  v77 = v20;
  v24 = *(_QWORD *)(v71 + 16);
  if (!v24)
    goto LABEL_12;
  v64 = v10;
  v65 = v13;
  v67 = 0;
  v25 = v24;
  v26 = v71 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  v83 = *(void (**)(char *, uint64_t))(v8 + 72);
  v27 = *MEMORY[0x24BE7D518];
  v74 = *MEMORY[0x24BE7D608];
  v28 = *(void (**)(_QWORD, _QWORD, _QWORD))(v8 + 16);
  v68 = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v66 = v26;
  v72 = v25;
  v29 = v25;
  v30 = v77;
  v75 = v23;
  v76 = v28;
  v73 = v27;
  while (1)
  {
    v28(v23, v26, v7);
    v28(v30, v23, v7);
    v32 = *(unsigned int (**)(char *, uint64_t))(v8 + 88);
    if (v32(v30, v7) == v27)
      break;
    v31 = *(void (**)(char *, uint64_t))(v8 + 8);
    v31(v30, v7);
LABEL_6:
    v31(v23, v7);
    v26 += (uint64_t)v83;
    if (!--v29)
    {
      swift_bridgeObjectRelease();
      goto LABEL_11;
    }
  }
  v82 = v32;
  v33 = *(void (**)(char *, uint64_t))(v8 + 96);
  v34 = v7;
  v33(v30, v7);
  v36 = v80;
  v35 = v81;
  v37 = v78;
  (*(void (**)(char *, char *, void (*)(_QWORD, _QWORD)))(v80 + 32))(v78, v30, v81);
  v38 = v8;
  v39 = v79;
  (*(void (**)(char *, _QWORD, void (*)(_QWORD, _QWORD)))(v36 + 104))(v79, v74, v35);
  v40 = sub_2451036F4();
  v41 = *(void (**)(char *, _QWORD))(v36 + 8);
  v42 = v39;
  v8 = v38;
  v41(v42, v35);
  v41(v37, v35);
  v31 = *(void (**)(char *, uint64_t))(v38 + 8);
  if ((v40 & 1) == 0)
  {
    v28 = v76;
    v30 = v77;
    v7 = v34;
    v23 = v75;
    v27 = v73;
    goto LABEL_6;
  }
  v81 = (void (*)(_QWORD, _QWORD))v33;
  v47 = v34;
  v31(v75, v34);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v48 = 0;
  v49 = *MEMORY[0x24BE7D4F8];
  v51 = v69;
  v50 = v70;
  v52 = v66;
  v53 = (void (*)(char *, uint64_t, uint64_t))v76;
  while (1)
  {
    v53(v50, v52, v47);
    v53(v51, (uint64_t)v50, v47);
    if (v82(v51, v47) == v49)
      break;
    swift_bridgeObjectRetain();
    v31(v51, v47);
    v31(v50, v47);
    swift_bridgeObjectRelease();
    ++v48;
    v52 += (uint64_t)v83;
    if (v72 == v48)
      goto LABEL_11;
  }
  v66 = v52;
  v81(v51, v47);
  v54 = &v51[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25744BD10) + 48)];
  v55 = sub_2451037A8();
  v56 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v55 - 8) + 8);
  swift_bridgeObjectRetain();
  v83 = v56;
  v56(v54, v55);
  v31(v50, v47);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v72 == v48)
    goto LABEL_11;
  if (v48 >= v72)
  {
    __break(1u);
    goto LABEL_31;
  }
  v57 = v65;
  v53(v65, v66, v47);
  v58 = v64;
  v53(v64, (uint64_t)v57, v47);
  if (v82(v58, v47) == v49)
  {
    v81(v58, v47);
    v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD10);
    v83(&v58[*(int *)(v59 + 48)], v55);
    v31(v57, v47);
    swift_bridgeObjectRelease();
    v60 = swift_bridgeObjectRetain();
    v61 = sub_2450F9ECC(v60);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!(v61 >> 62))
    {
      if (*(_QWORD *)((v61 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_24:
        if ((MEMORY[0x24BEE4AF8] & 0xC000000000000000) != 0 && sub_245103DE4())
LABEL_29:
          sub_2450FA0CC(MEMORY[0x24BEE4AF8]);
        else
          v43 = MEMORY[0x24BEE4B08];
        goto LABEL_14;
      }
LABEL_11:
      swift_bridgeObjectRelease();
      goto LABEL_12;
    }
LABEL_31:
    swift_bridgeObjectRetain();
    v63 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v63)
      goto LABEL_24;
    goto LABEL_11;
  }
  v31(v58, v47);
  result = ((uint64_t (*)(char *, uint64_t))v31)(v57, v47);
  __break(1u);
  return result;
}

uint64_t sub_2450F8740(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_245103E68();
  swift_bridgeObjectRetain();
  sub_2451039B8();
  v8 = sub_245103E74();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_245103E38() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_245103E38() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_2450F9344(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_2450F88EC(_QWORD *a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  id v17;
  char v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char isUniquelyReferenced_nonNull_native;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0)
      v7 = *v2;
    else
      v7 = v6 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
    v8 = a2;
    v9 = sub_245103C88();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_2450FA5F0();
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v26;
      swift_unknownObjectRelease();
      return 0;
    }
    result = sub_245103C7C();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    v21 = sub_2450F8B68(v7, result + 1);
    v27 = v21;
    if (*(_QWORD *)(v21 + 24) <= *(_QWORD *)(v21 + 16))
    {
      v25 = v8;
      sub_2450F9028();
      v22 = v27;
    }
    else
    {
      v22 = v21;
      v23 = v8;
    }
    sub_2450F92C4((uint64_t)v8, v22);
    *v3 = v22;
  }
  else
  {
    swift_bridgeObjectRetain();
    v11 = sub_245103BEC();
    v12 = -1 << *(_BYTE *)(v6 + 32);
    v13 = v11 & ~v12;
    if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) != 0)
    {
      sub_2450FA5F0();
      v14 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
      v15 = sub_245103BF8();

      if ((v15 & 1) != 0)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        v19 = *(void **)(*(_QWORD *)(*v2 + 48) + 8 * v13);
        *a1 = v19;
        v20 = v19;
        return 0;
      }
      v16 = ~v12;
      while (1)
      {
        v13 = (v13 + 1) & v16;
        if (((*(_QWORD *)(v6 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
          break;
        v17 = *(id *)(*(_QWORD *)(v6 + 48) + 8 * v13);
        v18 = sub_245103BF8();

        if ((v18 & 1) != 0)
          goto LABEL_12;
      }
    }
    swift_bridgeObjectRelease();
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v28 = *v2;
    *v2 = 0x8000000000000000;
    v8 = a2;
    sub_2450F94DC((uint64_t)v8, v13, isUniquelyReferenced_nonNull_native);
    *v2 = v28;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_2450F8B68(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  unint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF08);
    v2 = sub_245103CB8();
    v14 = v2;
    sub_245103C70();
    if (sub_245103C94())
    {
      sub_2450FA5F0();
      do
      {
        swift_dynamicCast();
        v2 = v14;
        if (*(_QWORD *)(v14 + 24) <= *(_QWORD *)(v14 + 16))
        {
          sub_2450F9028();
          v2 = v14;
        }
        result = sub_245103BEC();
        v4 = v2 + 56;
        v5 = -1 << *(_BYTE *)(v2 + 32);
        v6 = result & ~v5;
        v7 = v6 >> 6;
        if (((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          v8 = __clz(__rbit64((-1 << v6) & ~*(_QWORD *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v9 = 0;
          v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v11 = v7 == v10;
            if (v7 == v10)
              v7 = 0;
            v9 |= v11;
            v12 = *(_QWORD *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(_QWORD *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v8) = v13;
        ++*(_QWORD *)(v2 + 16);
      }
      while (sub_245103C94());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B08];
  }
  return v2;
}

uint64_t sub_2450F8D4C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF10);
  v3 = sub_245103CAC();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_245103E68();
      sub_2451039B8();
      result = sub_245103E74();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_2450F9028()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF08);
  v3 = sub_245103CAC();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v28 = v0;
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v6 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v7 = ~(-1 << v5);
    else
      v7 = -1;
    v8 = v7 & *(_QWORD *)(v2 + 56);
    v9 = (unint64_t)(v5 + 63) >> 6;
    v10 = v3 + 56;
    result = swift_retain();
    v12 = 0;
    while (1)
    {
      if (v8)
      {
        v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        v15 = v14 | (v12 << 6);
      }
      else
      {
        v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9)
          goto LABEL_33;
        v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          v12 = v16 + 1;
          if (v16 + 1 >= v9)
            goto LABEL_33;
          v17 = v6[v12];
          if (!v17)
          {
            v12 = v16 + 2;
            if (v16 + 2 >= v9)
              goto LABEL_33;
            v17 = v6[v12];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                v1 = v28;
                v27 = 1 << *(_BYTE *)(v2 + 32);
                if (v27 > 63)
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v6 = -1 << v27;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  v12 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v12 >= v9)
                    goto LABEL_33;
                  v17 = v6[v12];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v12 = v18;
            }
          }
        }
LABEL_23:
        v8 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      v19 = *(_QWORD *)(*(_QWORD *)(v2 + 48) + 8 * v15);
      result = sub_245103BEC();
      v20 = -1 << *(_BYTE *)(v4 + 32);
      v21 = result & ~v20;
      v22 = v21 >> 6;
      if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v23 = 0;
        v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v25 = v22 == v24;
          if (v22 == v24)
            v22 = 0;
          v23 |= v25;
          v26 = *(_QWORD *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

unint64_t sub_2450F92C4(uint64_t a1, uint64_t a2)
{
  unint64_t result;

  sub_245103BEC();
  result = sub_245103C64();
  *(_QWORD *)(a2 + 56 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
  *(_QWORD *)(*(_QWORD *)(a2 + 48) + 8 * result) = a1;
  ++*(_QWORD *)(a2 + 16);
  return result;
}

uint64_t sub_2450F9344(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_2450F8D4C();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_2450F9650();
      goto LABEL_22;
    }
    sub_2450F99A8();
  }
  v11 = *v4;
  sub_245103E68();
  sub_2451039B8();
  result = sub_245103E74();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_245103E38(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_245103E44();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_245103E38();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void sub_2450F94DC(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t *v3;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  char v12;
  uint64_t v13;
  id v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;

  v6 = *(_QWORD *)(*v3 + 16);
  v7 = *(_QWORD *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0)
    goto LABEL_14;
  if ((a3 & 1) != 0)
  {
    sub_2450F9028();
  }
  else
  {
    if (v7 > v6)
    {
      sub_2450F9800();
      goto LABEL_14;
    }
    sub_2450F9C54();
  }
  v8 = *v3;
  v9 = sub_245103BEC();
  v10 = -1 << *(_BYTE *)(v8 + 32);
  a2 = v9 & ~v10;
  if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) != 0)
  {
    sub_2450FA5F0();
    v11 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
    v12 = sub_245103BF8();

    if ((v12 & 1) != 0)
    {
LABEL_13:
      sub_245103E44();
      __break(1u);
    }
    else
    {
      v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(_QWORD *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFF8)) >> a2) & 1) == 0)
          break;
        v14 = *(id *)(*(_QWORD *)(v8 + 48) + 8 * a2);
        v15 = sub_245103BF8();

        if ((v15 & 1) != 0)
          goto LABEL_13;
      }
    }
  }
LABEL_14:
  v16 = *v3;
  *(_QWORD *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(_QWORD *)(*(_QWORD *)(v16 + 48) + 8 * a2) = a1;
  v17 = *(_QWORD *)(v16 + 16);
  v18 = __OFADD__(v17, 1);
  v19 = v17 + 1;
  if (v18)
    __break(1u);
  else
    *(_QWORD *)(v16 + 16) = v19;
}

void *sub_2450F9650()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF10);
  v2 = *v0;
  v3 = sub_245103CA0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

id sub_2450F9800()
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
  void *v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF08);
  v2 = *v0;
  v3 = sub_245103CA0();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
      goto LABEL_30;
    }
    if (v18 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      v9 = v18 + 1;
      if (v18 + 1 >= v13)
        goto LABEL_28;
      v19 = *(_QWORD *)(v6 + 8 * v9);
      if (!v19)
      {
        v9 = v18 + 2;
        if (v18 + 2 >= v13)
          goto LABEL_28;
        v19 = *(_QWORD *)(v6 + 8 * v9);
        if (!v19)
          break;
      }
    }
LABEL_27:
    v12 = (v19 - 1) & v19;
    v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    result = v17;
  }
  v20 = v18 + 3;
  if (v20 >= v13)
    goto LABEL_28;
  v19 = *(_QWORD *)(v6 + 8 * v20);
  if (v19)
  {
    v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v20 + 1;
    if (__OFADD__(v20, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v19 = *(_QWORD *)(v6 + 8 * v9);
    ++v20;
    if (v19)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_2450F99A8()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF10);
  v3 = sub_245103CAC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_245103E68();
    swift_bridgeObjectRetain();
    sub_2451039B8();
    result = sub_245103E74();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2450F9C54()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t result;
  int64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF08);
  v3 = sub_245103CAC();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v27 = v0;
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v9 = (unint64_t)(v5 + 63) >> 6;
  v10 = v3 + 56;
  result = swift_retain();
  v12 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      v12 = v16 + 1;
      if (v16 + 1 >= v9)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v12);
      if (!v17)
      {
        v12 = v16 + 2;
        if (v16 + 2 >= v9)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v12);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    v19 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * v15);
    result = sub_245103BEC();
    v20 = -1 << *(_BYTE *)(v4 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6))) != 0)
    {
      v13 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v10 + 8 * v22);
      }
      while (v26 == -1);
      v13 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + 8 * v13) = v19;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v27;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v9)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_2450F9ECC(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char **v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;

  v1 = a1;
  v18 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_21;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      v3 = 0;
      v4 = v1 & 0xC000000000000001;
      v5 = v1 & 0xFFFFFFFFFFFFFF8;
      v6 = &selRef_region;
      v17 = v1;
      v16 = v1 & 0xFFFFFFFFFFFFFF8;
      while (v4)
      {
        v7 = (id)MEMORY[0x24952E92C](v3, v1);
LABEL_9:
        v8 = v7;
        v9 = v3 + 1;
        if (__OFADD__(v3, 1))
          goto LABEL_20;
        v10 = objc_msgSend(v7, v6[63]);
        if (v10)
        {
          v11 = v10;
          if (objc_msgSend(v10, sel_shouldCategorizeGroceryItems))
          {
            v12 = v4;
            v13 = objc_msgSend(v8, sel_name);
            sub_245103988();

            sub_2450FA5AC();
            v14 = sub_245103C40();
            swift_bridgeObjectRelease();

            if (v14)
            {

            }
            else
            {
              sub_245103D0C();
              sub_245103D30();
              sub_245103D3C();
              sub_245103D18();
            }
            v4 = v12;
            v5 = v16;
            v1 = v17;
            v6 = &selRef_region;
          }
          else
          {

          }
        }
        else
        {

        }
        ++v3;
        if (v9 == v2)
          return v18;
      }
      if (v3 < *(_QWORD *)(v5 + 16))
        break;
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      v2 = sub_245103DE4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    v7 = *(id *)(v1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

void sub_2450FA0CC(unint64_t a1)
{
  unint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  char v33;
  uint64_t v34;
  id v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v1 = a1;
  v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v5)
    {
LABEL_3:
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF08);
      v3 = sub_245103CC4();
      if (!v2)
        goto LABEL_4;
LABEL_8:
      swift_bridgeObjectRetain();
      v4 = sub_245103DE4();
      swift_bridgeObjectRelease();
      if (!v4)
        return;
      goto LABEL_9;
    }
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  v3 = MEMORY[0x24BEE4B08];
  if (v2)
    goto LABEL_8;
LABEL_4:
  v4 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    return;
LABEL_9:
  v6 = v3 + 56;
  v41 = v4;
  if ((v1 & 0xC000000000000001) != 0)
  {
    v7 = 0;
    v39 = v1;
    while (1)
    {
      v8 = MEMORY[0x24952E92C](v7, v1);
      v9 = __OFADD__(v7++, 1);
      if (v9)
      {
        __break(1u);
        goto LABEL_37;
      }
      v10 = v8;
      v11 = sub_245103BEC();
      v12 = -1 << *(_BYTE *)(v3 + 32);
      v13 = v11 & ~v12;
      v14 = v13 >> 6;
      v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
      v16 = 1 << v13;
      if (((1 << v13) & v15) != 0)
      {
        sub_2450FA5F0();
        v17 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
        v18 = sub_245103BF8();

        if ((v18 & 1) != 0)
        {
LABEL_11:
          swift_unknownObjectRelease();
          v1 = v39;
          goto LABEL_12;
        }
        v19 = ~v12;
        while (1)
        {
          v13 = (v13 + 1) & v19;
          v14 = v13 >> 6;
          v15 = *(_QWORD *)(v6 + 8 * (v13 >> 6));
          v16 = 1 << v13;
          if ((v15 & (1 << v13)) == 0)
            break;
          v20 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v13);
          v21 = sub_245103BF8();

          if ((v21 & 1) != 0)
            goto LABEL_11;
        }
        v1 = v39;
      }
      *(_QWORD *)(v6 + 8 * v14) = v16 | v15;
      *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v13) = v10;
      v22 = *(_QWORD *)(v3 + 16);
      v9 = __OFADD__(v22, 1);
      v23 = v22 + 1;
      if (v9)
        goto LABEL_38;
      *(_QWORD *)(v3 + 16) = v23;
LABEL_12:
      if (v7 == v41)
        return;
    }
  }
  v24 = 0;
  v40 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v24 != v40)
  {
    v25 = *(id *)(v1 + 32 + 8 * v24);
    v26 = sub_245103BEC();
    v27 = -1 << *(_BYTE *)(v3 + 32);
    v28 = v26 & ~v27;
    v29 = v28 >> 6;
    v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
    v31 = 1 << v28;
    if (((1 << v28) & v30) != 0)
    {
      sub_2450FA5F0();
      v32 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
      v33 = sub_245103BF8();

      if ((v33 & 1) != 0)
        goto LABEL_24;
      v34 = ~v27;
      v28 = (v28 + 1) & v34;
      v29 = v28 >> 6;
      v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
      v31 = 1 << v28;
      if ((v30 & (1 << v28)) != 0)
      {
        while (1)
        {
          v35 = *(id *)(*(_QWORD *)(v3 + 48) + 8 * v28);
          v36 = sub_245103BF8();

          if ((v36 & 1) != 0)
            break;
          v28 = (v28 + 1) & v34;
          v29 = v28 >> 6;
          v30 = *(_QWORD *)(v6 + 8 * (v28 >> 6));
          v31 = 1 << v28;
          if ((v30 & (1 << v28)) == 0)
            goto LABEL_32;
        }
LABEL_24:

        v4 = v41;
        goto LABEL_25;
      }
LABEL_32:
      v4 = v41;
    }
    *(_QWORD *)(v6 + 8 * v29) = v31 | v30;
    *(_QWORD *)(*(_QWORD *)(v3 + 48) + 8 * v28) = v25;
    v37 = *(_QWORD *)(v3 + 16);
    v9 = __OFADD__(v37, 1);
    v38 = v37 + 1;
    if (v9)
      goto LABEL_39;
    *(_QWORD *)(v3 + 16) = v38;
LABEL_25:
    if (++v24 == v4)
      return;
  }
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
}

uint64_t sub_2450FA424(unint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  id v5;
  unint64_t v6;
  id v7;
  char v8;
  id v10;
  uint64_t v11;

  v11 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_16:
    v2 = sub_245103DE4();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v2)
    {
LABEL_3:
      v3 = 0;
      v4 = a1 & 0xFFFFFFFFFFFFFF8;
      while (1)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          v5 = (id)MEMORY[0x24952E92C](v3, a1);
          v6 = v3 + 1;
          if (__OFADD__(v3, 1))
          {
LABEL_13:
            __break(1u);
            return v11;
          }
        }
        else
        {
          if (v3 >= *(_QWORD *)(v4 + 16))
          {
            __break(1u);
            goto LABEL_16;
          }
          v5 = *(id *)(a1 + 8 * v3 + 32);
          v6 = v3 + 1;
          if (__OFADD__(v3, 1))
            goto LABEL_13;
        }
        v7 = v5;
        v8 = sub_2450F88EC(&v10, v7);

        if ((v8 & 1) != 0)
        {
          sub_245103D0C();
          sub_245103D30();
          v4 = a1 & 0xFFFFFFFFFFFFFF8;
          sub_245103D3C();
          sub_245103D18();
        }
        else
        {

        }
        ++v3;
        if (v6 == v2)
          return v11;
      }
    }
  }
  return MEMORY[0x24BEE4AF8];
}

unint64_t sub_2450FA5AC()
{
  unint64_t result;

  result = qword_25744BF00;
  if (!qword_25744BF00)
  {
    result = MEMORY[0x24952EE3C](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_25744BF00);
  }
  return result;
}

unint64_t sub_2450FA5F0()
{
  unint64_t result;

  result = qword_25744B5B0;
  if (!qword_25744B5B0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25744B5B0);
  }
  return result;
}

uint64_t sub_2450FA62C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_24510391C();
  __swift_allocate_value_buffer(v0, qword_25744BF18);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25744BF18);
  if (qword_25744B2B0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25744C4D0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_2450FA730(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  char *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  char *v36;
  uint64_t v38;

  if (qword_25744B2F0 != -1)
    swift_once();
  v8 = sub_24510391C();
  __swift_project_value_buffer(v8, (uint64_t)qword_25744BF18);
  swift_bridgeObjectRetain_n();
  v9 = a1;
  v10 = sub_245103910();
  v11 = sub_245103AB4();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v34 = a5;
    v13 = swift_slowAlloc();
    v38 = v13;
    *(_DWORD *)v12 = 136315394;
    v14 = v9;
    v15 = objc_msgSend(v14, sel_description);
    v16 = sub_245103988();
    v18 = v17;

    sub_245101AB4(v16, v18, &v38);
    sub_245103C28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2080;
    v19 = a2;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B568);
    v20 = sub_245103994();
    sub_245101AB4(v20, v21, &v38);
    sub_245103C28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v10, v11, "Widget provideListOptions {intent: %s, searchTerm: %s}", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    v22 = v13;
    a5 = v34;
    MEMORY[0x24952EEE4](v22, -1, -1);
    MEMORY[0x24952EEE4](v12, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    v19 = a2;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF80);
  v23 = &v36[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource];
  v24 = *(_QWORD *)&v36[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource + 24];
  v25 = *(_QWORD *)&v36[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource + 32];
  __swift_project_boxed_opaque_existential_1(&v36[OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource], v24);
  sub_2450EBAF8(v24, v25);
  v26 = *((_QWORD *)v23 + 3);
  v27 = *((_QWORD *)v23 + 4);
  __swift_project_boxed_opaque_existential_1(v23, v26);
  sub_2450EBA64(v26, v27);
  sub_2451038BC();
  swift_release();
  swift_release();
  v28 = (_QWORD *)swift_allocObject();
  v28[2] = a4;
  v28[3] = a5;
  v28[4] = v36;
  v28[5] = v19;
  v28[6] = a3;
  v29 = swift_allocObject();
  *(_QWORD *)(v29 + 16) = sub_2450FDC50;
  *(_QWORD *)(v29 + 24) = v28;
  swift_bridgeObjectRetain();
  swift_retain();
  v30 = v36;
  v31 = (void *)sub_245103898();
  sub_2451038C8();
  swift_release();

  v32 = swift_allocObject();
  *(_QWORD *)(v32 + 16) = a4;
  *(_QWORD *)(v32 + 24) = a5;
  swift_retain();
  v33 = (void *)sub_245103898();
  sub_2451038D4();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

}

void sub_2450FABE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_245103394();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_2450FAC3C(uint64_t a1, uint64_t a2, uint64_t (*a3)(id, _QWORD), uint64_t a4, char *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t result;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  os_log_type_t v40;
  _BOOL4 v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  id v52;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v54;
  unint64_t v55;
  char *v56;
  unint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  unint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void **v73;
  char *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  void (*v81)(void **, char *, uint64_t);
  int v82;
  void *v83;
  uint64_t v84;
  id v85;
  id v86;
  char *v87;
  id v88;
  id v89;
  void *v90;
  void *v91;
  id v92;
  id v93;
  id v94;
  id v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  char *v99;
  unint64_t v100;
  unint64_t v101;
  char *v102;
  unint64_t v103;
  void (*v104)(id *, char *, uint64_t);
  id *v105;
  int v106;
  id v107;
  id v108;
  id v109;
  char *v110;
  id v111;
  id v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  id v117;
  id v118;
  NSObject *v119;
  _QWORD *v120;
  char *v121;
  uint64_t v122;
  void *v123;
  char *v124;
  id v125;
  id v126;
  void *v127;
  id v128;
  id v129;
  id v130;
  id v131;
  id v132;
  char *v133;
  id v134;
  id v135;
  void *v136;
  void *v137;
  id v138;
  id v139;
  id v140;
  id v141;
  uint64_t v142;
  NSObject *v143;
  _QWORD *v144;
  char *v145;
  uint64_t v146;
  void *v147;
  char *v148;
  id v149;
  id v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  id v155;
  id v156;
  void *v157;
  void *v158;
  id v159;
  id v160;
  unint64_t v161;
  NSObject *v162;
  os_log_type_t v163;
  BOOL v164;
  void *v165;
  uint8_t *v166;
  uint64_t v167;
  id v168;
  void *v169;
  id v170;
  id v171;
  uint64_t v172;
  id v173;
  uint64_t v174;
  void (*v175)(char *, uint64_t);
  uint64_t v176;
  uint64_t v177;
  uint64_t (*v178)(id, _QWORD);
  char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  unint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  unint64_t v187;
  char *v188;
  uint64_t v189;
  uint64_t v190;
  int v191;
  uint64_t v192;
  int v193;
  char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  __int128 v198;
  int v199;
  void (*v200)(void **, char *, uint64_t);
  uint64_t v201;
  unint64_t v202;
  char *v203;
  uint64_t v204;
  void **v205;
  uint64_t v206;
  uint64_t v207;
  int v208;
  id v209;
  int v210;
  uint64_t v211;
  id *v212;
  char *v213;
  uint64_t v214;
  void (*v215)(id *, char *, uint64_t);
  char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  char *v221;
  unint64_t v222;
  char *v223;
  uint64_t aBlock;
  uint64_t v225;
  uint64_t (*v226)(uint64_t);
  void *v227;
  uint64_t (*v228)();
  uint64_t v229;
  void *v230;
  unint64_t v231;
  unint64_t v232;
  unint64_t v233;
  char v234[8];
  _OWORD v235[2];
  uint64_t v236;
  char v237;
  id v238;

  v186 = a7;
  v181 = a6;
  v177 = a4;
  v178 = (uint64_t (*)(id, _QWORD))a3;
  v219 = sub_2451037D8();
  v10 = *(_QWORD *)(v219 - 8);
  MEMORY[0x24BDAC7A8](v219);
  v212 = (id *)((char *)&v172 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v12);
  v213 = (char *)&v172 - v13;
  v196 = sub_2451037FC();
  v195 = *(_QWORD *)(v196 - 8);
  MEMORY[0x24BDAC7A8](v196);
  v194 = (char *)&v172 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v218 = sub_2451033C4();
  v217 = *(_QWORD *)(v218 - 8);
  MEMORY[0x24BDAC7A8](v218);
  v216 = (char *)&v172 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v206 = sub_2451037E4();
  v197 = *(_QWORD *)(v206 - 8);
  MEMORY[0x24BDAC7A8](v206);
  v205 = (void **)((char *)&v172 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v172 - v18;
  v189 = sub_245103820();
  v190 = *(_QWORD *)(v189 - 8);
  MEMORY[0x24BDAC7A8](v189);
  v188 = (char *)&v172 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BB50);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)&v172 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_245103838();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)&v172 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v28);
  v179 = (char *)&v172 - v29;
  if (!a1)
  {
LABEL_4:
    if (qword_25744B2F0 == -1)
    {
LABEL_5:
      v30 = sub_24510391C();
      __swift_project_value_buffer(v30, (uint64_t)qword_25744BF18);
      v31 = sub_245103910();
      v32 = sub_245103A9C();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_2450D4000, v31, v32, "Widget provideListOptions failed no data", v33, 2u);
        MEMORY[0x24952EEE4](v33, -1, -1);
      }

      return v178(0, 0);
    }
LABEL_77:
    swift_once();
    goto LABEL_5;
  }
  sub_2450FDCE4(a2, (uint64_t)v23);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
  {
    sub_2450E35D8((uint64_t)v23, &qword_25744BB50);
    goto LABEL_4;
  }
  v223 = a5;
  v35 = v179;
  (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v179, v23, v24);
  v36 = qword_25744B2F0;
  swift_bridgeObjectRetain();
  if (v36 != -1)
    swift_once();
  v37 = sub_24510391C();
  v38 = __swift_project_value_buffer(v37, (uint64_t)qword_25744BF18);
  (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v27, v35, v24);
  swift_bridgeObjectRetain();
  v174 = v38;
  v39 = sub_245103910();
  v40 = sub_245103AB4();
  v41 = os_log_type_enabled(v39, v40);
  v211 = v10;
  v203 = v19;
  v176 = v24;
  if (v41)
  {
    v42 = swift_slowAlloc();
    *(_DWORD *)v42 = 134218240;
    aBlock = *(_QWORD *)(a1 + 16);
    sub_245103C28();
    swift_bridgeObjectRelease();
    *(_WORD *)(v42 + 12) = 2048;
    v43 = *(_QWORD *)(sub_24510382C() + 16);
    swift_bridgeObjectRelease();
    v175 = *(void (**)(char *, uint64_t))(v25 + 8);
    v175(v27, v24);
    aBlock = v43;
    sub_245103C28();
    _os_log_impl(&dword_2450D4000, v39, v40, "Widget provideListOptions smartListTypes: %ld, accounts %ld ", (uint8_t *)v42, 0x16u);
    MEMORY[0x24952EEE4](v42, -1, -1);

  }
  else
  {
    v175 = *(void (**)(char *, uint64_t))(v25 + 8);
    v175(v27, v24);

    swift_bridgeObjectRelease();
  }
  v44 = v188;
  v45 = MEMORY[0x24BEE4AF8];
  v233 = MEMORY[0x24BEE4AF8];
  sub_245103670();
  v46 = MEMORY[0x24952E2A8](v179);
  v47 = *(_QWORD *)(a1 + 16);
  v48 = v213;
  if (v47)
  {
    v49 = v46;
    v50 = (id *)(a1 + 32);
    v51 = MEMORY[0x24BEE4AF8];
    do
    {
      v238 = *v50;
      v52 = v238;
      if (sub_2450FC5A8((uint64_t)&v238, v49))
      {
        isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        aBlock = v51;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_2450FDD48(0, *(_QWORD *)(v51 + 16) + 1, 1);
          v51 = aBlock;
        }
        v55 = *(_QWORD *)(v51 + 16);
        v54 = *(_QWORD *)(v51 + 24);
        if (v55 >= v54 >> 1)
        {
          sub_2450FDD48(v54 > 1, v55 + 1, 1);
          v51 = aBlock;
        }
        *(_QWORD *)(v51 + 16) = v55 + 1;
        *(_QWORD *)(v51 + 8 * v55 + 32) = v52;
        v48 = v213;
        v44 = v188;
      }
      else
      {

      }
      ++v50;
      --v47;
    }
    while (v47);
  }
  else
  {
    v51 = v45;
  }
  swift_bridgeObjectRelease();
  v56 = v223;
  v57 = sub_2450FE050(v51);
  swift_release();
  v221 = v56;

  v58 = v186;
  if (v186)
  {
    swift_bridgeObjectRetain();
    sub_2450FE124(v57, v181, v58);
    v185 = 0;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    v185 = 0;
  }
  v59 = v219;
  v60 = v211;
  v61 = objc_allocWithZone(MEMORY[0x24BDD9ED8]);
  v220 = sub_2451036AC();
  v62 = (void *)sub_2451039E8();
  swift_bridgeObjectRelease();
  v63 = objc_msgSend(v61, sel_initWithTitle_items_, 0, v62);

  v64 = v63;
  MEMORY[0x24952E620]();
  if (*(_QWORD *)((v233 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v233 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
    sub_245103A18();
  v173 = v64;
  sub_245103A24();
  sub_245103A0C();
  v65 = sub_24510382C();
  v182 = *(_QWORD *)(v65 + 16);
  if (!v182)
  {
LABEL_68:
    swift_bridgeObjectRelease();
    v161 = v233;
    swift_bridgeObjectRetain_n();
    v162 = sub_245103910();
    v163 = sub_245103AB4();
    v164 = os_log_type_enabled(v162, v163);
    v165 = v173;
    if (v164)
    {
      v166 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v166 = 134217984;
      if (v161 >> 62)
      {
        swift_bridgeObjectRetain();
        v167 = sub_245103DE4();
        swift_bridgeObjectRelease();
      }
      else
      {
        v167 = *(_QWORD *)((v161 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      aBlock = v167;
      sub_245103C28();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v162, v163, "Widget provideListOptions sections %ld ", v166, 0xCu);
      MEMORY[0x24952EEE4](v166, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    swift_beginAccess();
    v168 = objc_allocWithZone(MEMORY[0x24BDD9ED0]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF90);
    v169 = (void *)sub_2451039E8();
    swift_bridgeObjectRelease();
    v170 = objc_msgSend(v168, sel_initWithSections_, v169);

    v171 = v170;
    v178(v170, 0);

    return ((uint64_t (*)(char *, uint64_t))v175)(v179, v176);
  }
  v66 = 0;
  v183 = v65 + ((*(unsigned __int8 *)(v190 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v190 + 80));
  v199 = *MEMORY[0x24BE7D8D8];
  v193 = *MEMORY[0x24BE7D8D0];
  v191 = *MEMORY[0x24BE7D8E0];
  v210 = *MEMORY[0x24BE7D8C0];
  v208 = *MEMORY[0x24BE7D8B8];
  v198 = xmmword_245104540;
  v180 = v65;
  while (1)
  {
    if (v66 >= *(_QWORD *)(v65 + 16))
    {
LABEL_76:
      __break(1u);
      goto LABEL_77;
    }
    v67 = *(_QWORD *)(v190 + 72);
    v187 = v66;
    (*(void (**)(char *, unint64_t, uint64_t))(v190 + 16))(v44, v183 + v67 * v66, v189);
    v68 = sub_2451037F0();
    v69 = MEMORY[0x24BEE4AF8];
    v232 = MEMORY[0x24BEE4AF8];
    v204 = *(_QWORD *)(v68 + 16);
    if (v204)
      break;
    swift_bridgeObjectRelease();
LABEL_63:
    v152 = v186;
    if (v186)
    {
      swift_bridgeObjectRetain();
      v153 = v185;
      sub_2450FE124(v69, v181, v152);
      v185 = v153;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    v154 = (void *)sub_245103808();
    v155 = objc_msgSend(v154, sel_displayName);

    sub_245103988();
    v156 = objc_allocWithZone(MEMORY[0x24BDD9ED8]);
    v157 = (void *)sub_245103964();
    swift_bridgeObjectRelease();
    v158 = (void *)sub_2451039E8();
    swift_bridgeObjectRelease();
    v159 = objc_msgSend(v156, sel_initWithTitle_items_, v157, v158);

    v160 = v159;
    MEMORY[0x24952E620]();
    if (*(_QWORD *)((v233 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v233 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      sub_245103A18();
    v66 = v187 + 1;
    sub_245103A24();
    sub_245103A0C();

    (*(void (**)(char *, uint64_t))(v190 + 8))(v44, v189);
    v65 = v180;
    if (v66 == v182)
      goto LABEL_68;
  }
  v70 = v197;
  v202 = v68 + ((*(unsigned __int8 *)(v70 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80));
  v184 = v68;
  swift_bridgeObjectRetain();
  v71 = 0;
  v201 = *(_QWORD *)(v70 + 72);
  v200 = *(void (**)(_QWORD, _QWORD, _QWORD))(v70 + 16);
  v72 = v206;
  v73 = v205;
  v74 = v203;
  while (1)
  {
    v207 = v71;
    v81 = (void (*)(void **, char *, uint64_t))v200;
    v200(v74, v202 + v201 * v71, v72);
    v81(v73, v74, v72);
    v82 = (*(uint64_t (**)(void **, uint64_t))(v70 + 88))(v73, v72);
    if (v82 != v199)
      break;
    (*(void (**)(void **, uint64_t))(v70 + 96))(v73, v72);
    v75 = *v73;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
    v76 = swift_allocObject();
    *(_OWORD *)(v76 + 16) = v198;
    v77 = v70;
    *(_QWORD *)(v76 + 32) = sub_2450FCB08(v75);
    aBlock = v76;
    sub_245103A0C();
    v78 = v206;
    v79 = aBlock;

LABEL_35:
    v80 = v207 + 1;
    v74 = v203;
    (*(void (**)(char *, uint64_t))(v77 + 8))(v203, v78);
    v72 = v78;
    sub_2450EC0E8(v79);
    v71 = v80;
    v70 = v77;
    v73 = v205;
    if (v80 == v204)
    {
      swift_bridgeObjectRelease_n();
      v69 = v232;
      v44 = v188;
      goto LABEL_63;
    }
  }
  if (v82 == v193)
  {
    (*(void (**)(void **, uint64_t))(v70 + 96))(v73, v72);
    v83 = *v73;
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
    v84 = swift_allocObject();
    *(_OWORD *)(v84 + 16) = v198;
    v85 = objc_msgSend(v83, sel_objectID);
    v86 = objc_msgSend(v85, sel_urlRepresentation);

    v87 = v216;
    sub_2451033B8();

    sub_2451033AC();
    (*(void (**)(char *, uint64_t))(v217 + 8))(v87, v218);
    v88 = objc_msgSend(v83, sel_name);
    sub_245103988();

    v89 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    v90 = (void *)sub_245103964();
    swift_bridgeObjectRelease();
    v91 = (void *)sub_245103964();
    swift_bridgeObjectRelease();
    v92 = objc_msgSend(v89, sel_initWithIdentifier_displayString_, v90, v91);

    v93 = objc_msgSend(v83, sel_customContext);
    v94 = objc_msgSend(v93, sel_badge);
    v95 = objc_msgSend(v93, sel_color);
    v96 = sub_24510352C();
    sub_2450FDA50(v96, (uint64_t)v234);
    v97 = (void *)sub_2450FD3E0(v94, v95, (uint64_t)v234);

    if (v97)
    {
      objc_msgSend(v92, sel_setDisplayImage_, v97);

    }
    objc_msgSend(v92, sel_setSubtitleString_, 0);
    *(_QWORD *)(v84 + 32) = v92;
    aBlock = v84;
    sub_245103A0C();
    v79 = aBlock;

    v59 = v219;
    v78 = v206;
LABEL_60:
    v77 = v197;
    goto LABEL_35;
  }
  if (v82 != v191)
    goto LABEL_80;
  (*(void (**)(void **, uint64_t))(v70 + 96))(v73, v72);
  (*(void (**)(char *, void **, uint64_t))(v195 + 32))(v194, v73, v196);
  v98 = sub_2451037F0();
  v99 = *(char **)(v98 + 16);
  if (!v99)
  {
    swift_bridgeObjectRelease();
    v79 = MEMORY[0x24BEE4AF8];
LABEL_59:
    v78 = v206;
    (*(void (**)(char *, uint64_t))(v195 + 8))(v194, v196);
    goto LABEL_60;
  }
  v231 = MEMORY[0x24BEE4AF8];
  sub_245103D24();
  v100 = (*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80);
  v192 = v98;
  v101 = v98 + v100;
  v214 = *(_QWORD *)(v60 + 72);
  v215 = *(void (**)(_QWORD, _QWORD, _QWORD))(v60 + 16);
  while (1)
  {
    v104 = (void (*)(id *, char *, uint64_t))v215;
    v215(v48, v101, v59);
    v105 = v212;
    v104(v212, v48, v59);
    v106 = (*(uint64_t (**)(id *, uint64_t))(v60 + 88))(v105, v59);
    v223 = v99;
    v222 = v101;
    if (v106 != v210)
      break;
    (*(void (**)(id *, uint64_t))(v60 + 96))(v105, v59);
    v107 = *v105;
    v108 = objc_msgSend(*v105, sel_objectID);
    v109 = objc_msgSend(v108, sel_urlRepresentation);

    v110 = v216;
    sub_2451033B8();

    sub_2451033AC();
    (*(void (**)(char *, uint64_t))(v217 + 8))(v110, v218);
    v111 = objc_msgSend(v107, sel_displayName);
    sub_245103988();

    v112 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    v113 = (void *)sub_245103964();
    swift_bridgeObjectRelease();
    v114 = (void *)sub_245103964();
    swift_bridgeObjectRelease();
    v115 = objc_msgSend(v112, sel_initWithIdentifier_displayString_, v113, v114);

    v116 = objc_msgSend(v107, sel_appearanceContext);
    v117 = objc_msgSend(v116, sel_badge);

    v118 = objc_msgSend(v107, sel_color);
    memset(v235, 0, sizeof(v235));
    v236 = 0;
    v237 = 2;
    v230 = 0;
    sub_2450FDA10();
    v119 = sub_245103AFC();
    v120 = (_QWORD *)swift_allocObject();
    v121 = v221;
    v120[2] = v221;
    v120[3] = v117;
    v120[4] = v118;
    sub_2450FDA50((uint64_t)v235, (uint64_t)(v120 + 5));
    v120[11] = &v230;
    v122 = swift_allocObject();
    *(_QWORD *)(v122 + 16) = sub_2450FDA8C;
    *(_QWORD *)(v122 + 24) = v120;
    v228 = sub_2450ECE14;
    v229 = v122;
    aBlock = MEMORY[0x24BDAC760];
    v225 = 1107296256;
    v226 = sub_2450FD7CC;
    v227 = &block_descriptor_48;
    v123 = _Block_copy(&aBlock);
    v124 = v121;
    swift_retain();
    v125 = v117;
    v126 = v118;
    swift_release();
    dispatch_sync(v119, v123);

    _Block_release(v123);
    LOBYTE(v110) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v110 & 1) != 0)
    {
      __break(1u);
LABEL_75:
      __break(1u);
      goto LABEL_76;
    }
    v127 = v230;

    swift_release();
    if (v127)
    {
      objc_msgSend(v115, sel_setDisplayImage_, v127);

    }
    v128 = v115;
    v129 = objc_msgSend(v107, sel_sharingStatusText);
    v60 = v211;
    v48 = v213;
    v59 = v219;
    if (v129)
    {
      sub_245103988();

      v129 = (id)sub_245103964();
      swift_bridgeObjectRelease();
    }
    v102 = v223;
    v103 = v222;
    objc_msgSend(v128, sel_setSubtitleString_, v129);

LABEL_45:
    (*(void (**)(char *, uint64_t))(v60 + 8))(v48, v59);
    sub_245103D0C();
    sub_245103D30();
    sub_245103D3C();
    sub_245103D18();
    v101 = v103 + v214;
    v99 = v102 - 1;
    if (!v99)
    {
      v79 = v231;
      swift_bridgeObjectRelease();
      goto LABEL_59;
    }
  }
  if (v106 == v208)
  {
    (*(void (**)(id *, uint64_t))(v60 + 96))(v105, v59);
    v130 = *v105;
    v131 = objc_msgSend(*v105, sel_objectID);
    v132 = objc_msgSend(v131, sel_urlRepresentation);

    v133 = v216;
    sub_2451033B8();

    sub_2451033AC();
    (*(void (**)(char *, uint64_t))(v217 + 8))(v133, v218);
    v134 = objc_msgSend(v130, sel_name);
    sub_245103988();

    v135 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
    v136 = (void *)sub_245103964();
    swift_bridgeObjectRelease();
    v137 = (void *)sub_245103964();
    swift_bridgeObjectRelease();
    v138 = objc_msgSend(v135, sel_initWithIdentifier_displayString_, v136, v137);

    v209 = v130;
    v139 = objc_msgSend(v130, sel_customContext);
    v140 = objc_msgSend(v139, sel_badge);
    v141 = objc_msgSend(v139, sel_color);
    v142 = sub_24510352C();
    sub_2450FDA50(v142, (uint64_t)&v238);
    v230 = 0;
    sub_2450FDA10();
    v143 = sub_245103AFC();
    v144 = (_QWORD *)swift_allocObject();
    v145 = v221;
    v144[2] = v221;
    v144[3] = v140;
    v144[4] = v141;
    sub_2450FDA50((uint64_t)&v238, (uint64_t)(v144 + 5));
    v144[11] = &v230;
    v146 = swift_allocObject();
    *(_QWORD *)(v146 + 16) = sub_2450FDA8C;
    *(_QWORD *)(v146 + 24) = v144;
    v228 = sub_2450ECE14;
    v229 = v146;
    aBlock = MEMORY[0x24BDAC760];
    v225 = 1107296256;
    v226 = sub_2450FD7CC;
    v227 = &block_descriptor_37;
    v147 = _Block_copy(&aBlock);
    v148 = v145;
    swift_retain();
    v149 = v140;
    v150 = v141;
    swift_release();
    dispatch_sync(v143, v147);

    _Block_release(v147);
    LOBYTE(v147) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((v147 & 1) != 0)
      goto LABEL_75;
    v151 = v230;

    swift_release();
    v48 = v213;
    v103 = v222;
    if (v151)
    {
      objc_msgSend(v138, sel_setDisplayImage_, v151);

    }
    objc_msgSend(v138, sel_setSubtitleString_, 0);
    v59 = v219;
    v60 = v211;
    v102 = v223;
    v129 = v209;
    goto LABEL_45;
  }
  sub_245103E2C();
  __break(1u);
LABEL_80:
  result = sub_245103E2C();
  __break(1u);
  return result;
}

BOOL sub_2450FC5A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  _BOOL8 result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v3 = sub_245103988();
  v5 = v4;
  if (v3 == sub_245103988() && v5 == v6)
    goto LABEL_14;
  v8 = sub_245103E38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v8 & 1) != 0)
    return 1;
  v10 = sub_245103988();
  v12 = v11;
  if (v10 == sub_245103988() && v12 == v13)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  v15 = sub_245103E38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v15 & 1) != 0)
  {
LABEL_16:
    v20 = (_QWORD *)sub_24510364C();
    return (*v20 & ~a2) == 0;
  }
  v16 = sub_245103988();
  v18 = v17;
  if (v16 == sub_245103988() && v18 == v19)
  {
LABEL_14:
    swift_bridgeObjectRelease_n();
    return 1;
  }
  v21 = sub_245103E38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v21 & 1) != 0)
    return 1;
  v22 = sub_245103988();
  v24 = v23;
  if (v22 == sub_245103988() && v24 == v25)
    goto LABEL_22;
  v26 = sub_245103E38();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v26 & 1) == 0)
  {
    v27 = sub_245103988();
    v29 = v28;
    if (v27 == sub_245103988() && v29 == v30)
    {
      swift_bridgeObjectRelease_n();
LABEL_29:
      v20 = (_QWORD *)sub_245103658();
      return (*v20 & ~a2) == 0;
    }
    v31 = sub_245103E38();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v31 & 1) != 0)
      goto LABEL_29;
    v32 = sub_245103988();
    v34 = v33;
    if (v32 == sub_245103988() && v34 == v35)
    {
LABEL_22:
      swift_bridgeObjectRelease_n();
      return 0;
    }
    v36 = sub_245103E38();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    result = 0;
    if ((v36 & 1) == 0)
    {
      v37 = sub_245103988();
      v39 = v38;
      if (v37 != sub_245103988() || v39 != v40)
      {
        sub_245103E38();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 0;
      }
      goto LABEL_22;
    }
  }
  return result;
}

id sub_2450FC904(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;

  v2 = sub_2451033C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF78);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1;
  sub_24510379C();
  v10 = sub_245103790();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) == 1)
  {
    sub_2450E35D8((uint64_t)v8, &qword_25744BF78);
    v12 = 0;
  }
  else
  {
    sub_245103784();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
    sub_2451033AC();
    v12 = v13;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_245103AF0();
  if (v12)
  {
    v14 = (void *)sub_245103964();
    swift_bridgeObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  sub_2451036AC();
  v15 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v16 = (void *)sub_245103964();
  swift_bridgeObjectRelease();
  v17 = objc_msgSend(v15, sel_initWithIdentifier_displayString_, v14, v16);

  v18 = sub_2450FD284(v9);
  if (v18)
  {
    v19 = (void *)v18;
    objc_msgSend(v17, sel_setDisplayImage_, v18);

  }
  return v17;
}

id sub_2450FCB08(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _OWORD v20[2];
  uint64_t v21;
  char v22;

  v2 = sub_2451033C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2451036AC();
  v6 = objc_msgSend(a1, sel_objectID);
  v7 = objc_msgSend(v6, sel_urlRepresentation);

  sub_2451033B8();
  sub_2451033AC();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v8 = objc_msgSend(a1, sel_displayName);
  sub_245103988();

  v9 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v10 = (void *)sub_245103964();
  swift_bridgeObjectRelease();
  v11 = (void *)sub_245103964();
  swift_bridgeObjectRelease();
  v12 = objc_msgSend(v9, sel_initWithIdentifier_displayString_, v10, v11);

  v13 = objc_msgSend(a1, sel_appearanceContext);
  v14 = objc_msgSend(v13, sel_badge);

  v15 = objc_msgSend(a1, sel_color);
  memset(v20, 0, sizeof(v20));
  v21 = 0;
  v22 = 2;
  v16 = (void *)sub_2450FD3E0(v14, v15, (uint64_t)v20);

  if (v16)
  {
    objc_msgSend(v12, sel_setDisplayImage_, v16);

  }
  v17 = v12;
  v18 = objc_msgSend(a1, sel_sharingStatusText);
  objc_msgSend(v17, sel_setSubtitleString_, v18);

  return v17;
}

uint64_t sub_2450FCD68(void *a1, uint64_t (*a2)(_QWORD, void *))
{
  uint64_t v4;
  id v5;
  id v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;

  if (qword_25744B2F0 != -1)
    swift_once();
  v4 = sub_24510391C();
  __swift_project_value_buffer(v4, (uint64_t)qword_25744BF18);
  v5 = a1;
  v6 = a1;
  v7 = sub_245103910();
  v8 = sub_245103A9C();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = (uint8_t *)swift_slowAlloc();
    v10 = swift_slowAlloc();
    v14 = v10;
    *(_DWORD *)v9 = 136315138;
    swift_getErrorValue();
    v11 = sub_245103E50();
    sub_245101AB4(v11, v12, &v14);
    sub_245103C28();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2450D4000, v7, v8, "Widget provideListOptions failed error %s", v9, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v10, -1, -1);
    MEMORY[0x24952EEE4](v9, -1, -1);
  }
  else
  {

  }
  return a2(0, a1);
}

id sub_2450FCFF8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;

  v2 = v1;
  if (qword_25744B2F0 != -1)
    swift_once();
  v4 = sub_24510391C();
  __swift_project_value_buffer(v4, (uint64_t)qword_25744BF18);
  v5 = a1;
  v6 = sub_245103910();
  v7 = sub_245103AB4();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v22 = v2;
    v9 = swift_slowAlloc();
    v23 = v9;
    *(_DWORD *)v8 = 136315138;
    v10 = v5;
    v11 = objc_msgSend(v10, sel_description);
    v12 = sub_245103988();
    v14 = v13;

    sub_245101AB4(v12, v14, &v23);
    sub_245103C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v6, v7, "Widget defaultList {intent: %s}", v8, 0xCu);
    swift_arrayDestroy();
    v15 = v9;
    v2 = v22;
    MEMORY[0x24952EEE4](v15, -1, -1);
    MEMORY[0x24952EEE4](v8, -1, -1);

  }
  else
  {

  }
  v16 = *(_QWORD *)(v2 + OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource + 24);
  v17 = *(_QWORD *)(v2 + OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource + 32);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v2 + OBJC_IVAR____TtC25RemindersIntentsFramework26ConfigurationIntentHandler_dataSource), v16);
  v18 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 72))(v16, v17);
  if (!v18)
    return sub_2450FC904((void *)*MEMORY[0x24BE7D360]);
  v19 = v18;
  v20 = sub_2450FCB08(v18);

  return v20;
}

uint64_t sub_2450FD284(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t result;
  uint64_t v11;
  _QWORD aBlock[6];
  uint64_t v13;

  v2 = v1;
  v13 = 0;
  sub_2450FDA10();
  v4 = sub_245103AFC();
  v5 = (_QWORD *)swift_allocObject();
  v5[2] = a1;
  v5[3] = v2;
  v5[4] = &v13;
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = sub_2450FDBD4;
  *(_QWORD *)(v6 + 24) = v5;
  aBlock[4] = sub_2450ECE14;
  aBlock[5] = v6;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2450FD7CC;
  aBlock[3] = &block_descriptor_14;
  v7 = _Block_copy(aBlock);
  v8 = a1;
  v9 = v2;
  swift_retain();
  swift_release();
  dispatch_sync((dispatch_queue_t)v4, v7);

  _Block_release(v7);
  LOBYTE(v4) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v4 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v11 = v13;
    swift_release();
    return v11;
  }
  return result;
}

uint64_t sub_2450FD3E0(void *a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t result;
  uint64_t v16;
  _QWORD aBlock[6];
  uint64_t v18;

  v4 = v3;
  v18 = 0;
  sub_2450FDA10();
  v8 = sub_245103AFC();
  v9 = (_QWORD *)swift_allocObject();
  v9[2] = v4;
  v9[3] = a1;
  v9[4] = a2;
  sub_2450FDA50(a3, (uint64_t)(v9 + 5));
  v9[11] = &v18;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = sub_2450FDA8C;
  *(_QWORD *)(v10 + 24) = v9;
  aBlock[4] = sub_2450ECD34;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_2450FD7CC;
  aBlock[3] = &block_descriptor_2;
  v11 = _Block_copy(aBlock);
  v12 = a2;
  swift_retain();
  v13 = v4;
  v14 = a1;
  swift_release();
  dispatch_sync((dispatch_queue_t)v8, v11);

  _Block_release(v11);
  LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v8 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v16 = v18;
    swift_release();
    return v16;
  }
  return result;
}

void sub_2450FD558(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, id *a5)
{
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  id v27;
  id v28;
  _BYTE v29[56];

  v9 = objc_msgSend(objc_allocWithZone((Class)sub_245103538()), sel_initWithFrame_, 0.0, 0.0, 32.0, 32.0);
  v10 = (_QWORD *)MEMORY[0x24BEE4EA0];
  if (!a2)
    goto LABEL_7;
  v11 = objc_msgSend(a2, sel_emoji);
  if (!v11)
  {
    v20 = objc_msgSend(a2, sel_emblem);
    if (v20)
    {
      v21 = v20;
      v22 = sub_245103B08();

      goto LABEL_8;
    }
LABEL_7:
    v22 = sub_245103B08();
LABEL_8:
    (*(void (**)(uint64_t))((*v10 & *v9) + 0x140))(v22);
    if (!a3)
      goto LABEL_4;
    goto LABEL_9;
  }
  v12 = v11;
  v13 = sub_245103988();
  v15 = v14;

  v16 = (*(uint64_t (**)(uint64_t, uint64_t))((*v10 & *v9) + 0x158))(v13, v15);
  (*(void (**)(uint64_t, double))((*v10 & *v9) + 0x170))(v16, 20.0);
  if (!a3)
  {
LABEL_4:
    v17 = v9;
    v18 = sub_2451034E4();
    swift_beginAccess();
    sub_2450FDAB8(v18, (uint64_t)v29);
    sub_2450FDB30((uint64_t)v29, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2450FDAF4);
    v19 = (void *)sub_2451034F0();
    sub_2450FDB30((uint64_t)v29, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_2450FDB6C);
    goto LABEL_10;
  }
LABEL_9:
  v23 = v9;
  v19 = (void *)sub_245103C04();
LABEL_10:
  objc_msgSend(v9, sel_setTintColor_, v19);

  (*(void (**)(uint64_t))((*v10 & *v9) + 0x110))(a4);
  sub_245103BB0();
  objc_msgSend(v9, sel_layoutIfNeeded);
  v24 = sub_245103BA4();
  if (v24)
  {
    v25 = (_QWORD *)v24;
    v26 = objc_msgSend((id)objc_opt_self(), sel_imageWithUIImage_, v24);
    v27 = *a5;
    *a5 = v26;

    if (*a5)
    {
      v28 = *a5;
      objc_msgSend(v28, sel__setRenderingMode_, 1);

    }
    v9 = v25;
  }

}

uint64_t sub_2450FD7CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_2450FD7EC(uint64_t a1, uint64_t a2, id *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD *v8;
  void (*v9)(void *);
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  v4 = sub_245103AE4();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = sub_245103AD8();
    if (v6)
    {
      v7 = (void *)v6;
      v8 = objc_msgSend(objc_allocWithZone((Class)sub_245103538()), sel_initWithFrame_, 0.0, 0.0, 32.0, 32.0);
      v9 = *(void (**)(void *))((*MEMORY[0x24BEE4EA0] & *v8) + 0x140);
      v16 = v5;
      v9(v5);
      objc_msgSend(v8, sel_setTintColor_, v7);
      v10 = sub_245103BA4();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = objc_msgSend((id)objc_opt_self(), sel_imageWithUIImage_, v10);
        v13 = *a3;
        *a3 = v12;

        if (*a3)
        {
          v14 = *a3;
          objc_msgSend(v14, sel__setRenderingMode_, 1);

        }
      }
      else
      {
        v11 = v16;
        v16 = v8;
      }

      v15 = v16;
    }
    else
    {
      v15 = v5;
    }

  }
}

id sub_2450FD974()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for ConfigurationIntentHandler()
{
  return objc_opt_self();
}

unint64_t sub_2450FDA10()
{
  unint64_t result;

  result = qword_25744B300;
  if (!qword_25744B300)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_25744B300);
  }
  return result;
}

uint64_t sub_2450FDA50(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BE7E4F8] - 8) + 32))(a2, a1);
  return a2;
}

uint64_t sub_2450FDA90()
{
  return swift_deallocObject();
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

uint64_t sub_2450FDAB8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BE7E3D0] - 8) + 32))(a2, a1);
  return a2;
}

id sub_2450FDAF4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if ((a7 & 1) != 0)
    return a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return (id)swift_bridgeObjectRetain();
}

uint64_t sub_2450FDB30(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))
{
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
  return a1;
}

void sub_2450FDB6C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if ((a7 & 1) != 0)
  {

  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

uint64_t sub_2450FDBA8()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_2450FDBD4()
{
  uint64_t v0;

  sub_2450FD7EC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24), *(id **)(v0 + 32));
}

uint64_t sub_2450FDBE0()
{
  return swift_deallocObject();
}

uint64_t sub_2450FDBF0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_2450FDC14(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_2450FABE4(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t sub_2450FDC1C()
{
  uint64_t v0;

  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_2450FDC50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2450FAC3C(a1, a2, *(uint64_t (**)(id, _QWORD))(v2 + 16), *(_QWORD *)(v2 + 24), *(char **)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48));
}

uint64_t sub_2450FDC60()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2450FDC84(char *a1)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, char *);
  uint64_t v4;
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t, char *))(v1 + 16);
  v4 = *(_QWORD *)a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF88);
  return v3(v4, &a1[*(int *)(v5 + 48)]);
}

uint64_t sub_2450FDCDC(void *a1)
{
  uint64_t v1;

  return sub_2450FCD68(a1, *(uint64_t (**)(_QWORD, void *))(v1 + 16));
}

uint64_t sub_2450FDCE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BB50);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2450FDD2C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_2450FDD64(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_2450FDD48(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_2450FDECC(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_2450FDD64(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744BFA0);
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
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_245103DFC();
  __break(1u);
  return result;
}

uint64_t sub_2450FDECC(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744BB48);
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
    type metadata accessor for REMSmartListType(0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_245103DFC();
  __break(1u);
  return result;
}

uint64_t sub_2450FE050(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  void **v4;
  void *v5;
  id v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v7 = MEMORY[0x24BEE4AF8];
    sub_245103D24();
    v4 = (void **)(a1 + 32);
    do
    {
      v5 = *v4++;
      v6 = v5;
      sub_2450FC904(v6);

      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_2450FE114()
{
  return swift_deallocObject();
}

uint64_t sub_2450FE124(unint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  void *v4;
  uint64_t v6;
  __n128 v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  _QWORD v21[2];
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = v3;
  v24 = a2;
  v25 = a3;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BF98);
  v7.n128_f64[0] = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_16;
  v10 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v10)
  {
    while (1)
    {
      v11 = 0;
      v23 = a1 & 0xC000000000000001;
      v21[1] = v4;
      v22 = a1 & 0xFFFFFFFFFFFFFF8;
      while (v23)
      {
        v12 = (id)MEMORY[0x24952E92C](v11, a1, v7);
LABEL_9:
        v4 = v12;
        v13 = v11 + 1;
        if (__OFADD__(v11, 1))
          goto LABEL_15;
        v14 = objc_msgSend(v12, sel_displayString);
        v15 = sub_245103988();
        v17 = v16;

        v28 = v15;
        v29 = v17;
        v26 = v24;
        v27 = v25;
        v18 = sub_24510346C();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v9, 1, 1, v18);
        sub_2450FA5AC();
        sub_245103C4C();
        LOBYTE(v14) = v19;
        sub_2450E35D8((uint64_t)v9, &qword_25744BF98);
        swift_bridgeObjectRelease();
        if ((v14 & 1) != 0)
        {

        }
        else
        {
          sub_245103D0C();
          sub_245103D30();
          sub_245103D3C();
          sub_245103D18();
        }
        ++v11;
        if (v13 == v10)
          return v30;
      }
      if (v11 < *(_QWORD *)(v22 + 16))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      v10 = sub_245103DE4();
      if (!v10)
        return MEMORY[0x24BEE4AF8];
    }
    v12 = *(id *)(a1 + 8 * v11 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t objectdestroyTm()
{
  id *v0;

  return swift_deallocObject();
}

void sub_2450FE384()
{
  uint64_t v0;

  sub_2450FD558(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_QWORD *)(v0 + 32), v0 + 40, *(id **)(v0 + 88));
}

uint64_t sub_2450FE398()
{
  return swift_deallocObject();
}

void sub_2450FE3AC(void *a1, uint64_t a2)
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  sub_24510388C();
  v4 = (void *)sub_245103880();
  v5 = objc_msgSend(a1, sel_list);
  v6 = v5;
  if (v5)
  {
    v7 = objc_msgSend(v5, sel_identifier);

    if (v7)
    {
      sub_245103988();

      v6 = (void *)sub_245103964();
      swift_bridgeObjectRelease();
    }
    else
    {
      v6 = 0;
    }
  }
  objc_msgSend(v4, sel_setList_, v6);

  if (qword_25744B2F0 != -1)
    swift_once();
  v8 = sub_24510391C();
  __swift_project_value_buffer(v8, (uint64_t)qword_25744BF18);
  v9 = a1;
  v10 = v4;
  v11 = v9;
  v12 = v10;
  v13 = sub_245103910();
  v14 = sub_245103AB4();
  if (os_log_type_enabled(v13, v14))
  {
    v15 = swift_slowAlloc();
    v26 = swift_slowAlloc();
    v28 = v26;
    *(_DWORD *)v15 = 136315394;
    v16 = v11;
    v17 = objc_msgSend(v16, sel_description);
    v18 = sub_245103988();
    v27 = a2;
    v20 = v19;

    sub_245101AB4(v18, v20, &v28);
    sub_245103C28();

    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    v21 = v12;
    v22 = objc_msgSend(v21, sel_description);
    v23 = sub_245103988();
    v25 = v24;

    sub_245101AB4(v23, v25, &v28);
    a2 = v27;
    sub_245103C28();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v13, v14, "Widget handle {intent: %s, response: %s}", (uint8_t *)v15, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v26, -1, -1);
    MEMORY[0x24952EEE4](v15, -1, -1);

  }
  else
  {

  }
  (*(void (**)(uint64_t, id))(a2 + 16))(a2, v12);

}

uint64_t sub_2450FE6FC(void (*a1)(uint64_t *__return_ptr, id *), uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  if (a3 >> 62)
    goto LABEL_16;
  v6 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x24BEE4AF8];
    if (!v6)
      break;
    v13 = MEMORY[0x24BEE4AF8];
    result = sub_245103D24();
    if (v6 < 0)
    {
      __break(1u);
      return result;
    }
    v8 = 0;
    while (v6 != v8)
    {
      if ((a3 & 0xC000000000000001) != 0)
        v9 = (id)MEMORY[0x24952E92C](v8, a3);
      else
        v9 = *(id *)(a3 + 8 * v8 + 32);
      v10 = v9;
      v11 = v9;
      a1(&v12, &v11);

      if (v3)
        return swift_release();
      ++v8;
      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
      if (v6 == v8)
        return v13;
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
    v6 = sub_245103DE4();
    swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_2450FE864(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  return sub_2450FE878(a1, a2, a3);
}

uint64_t sub_2450FE878(void (*a1)(uint64_t *__return_ptr, uint64_t), uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = v3;
  v6 = *(_QWORD *)(a3 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v6)
  {
    v13 = MEMORY[0x24BEE4AF8];
    sub_245103D24();
    v9 = *(_QWORD *)(sub_2451036D0() - 8);
    v10 = a3 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v11 = *(_QWORD *)(v9 + 72);
    while (1)
    {
      a1(&v12, v10);
      if (v4)
        break;
      v4 = 0;
      sub_245103D0C();
      sub_245103D30();
      sub_245103D3C();
      sub_245103D18();
      v10 += v11;
      if (!--v6)
        return v13;
    }
    return swift_release();
  }
  return result;
}

void sub_2450FE980(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2450FE99C(a1, a2, a3, (void (*)(uint64_t *__return_ptr, uint64_t))sub_245103264);
}

void sub_2450FE99C(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t *__return_ptr, uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;

  v9[2] = &v10;
  v6 = sub_2450FE878(a4, (uint64_t)v9, a1);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744C0D8);
  v9[4] = v6;
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744C0E0);
  sub_245102C10();
  sub_2451038B0();
  swift_bridgeObjectRelease();
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  swift_retain();
  v8 = (void *)sub_245103898();
  sub_2451038C8();
  swift_release();
  swift_release();
  swift_release();

}

uint64_t sub_2450FEAAC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_24510391C();
  __swift_allocate_value_buffer(v0, qword_25744BFA8);
  v1 = __swift_project_value_buffer(v0, (uint64_t)qword_25744BFA8);
  if (qword_25744B2B0 != -1)
    swift_once();
  v2 = __swift_project_value_buffer(v0, (uint64_t)qword_25744C4D0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v2, v0);
}

void sub_2450FEB3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t);
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  _QWORD *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  _BOOL4 v35;
  _QWORD *v36;
  uint8_t *v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  _QWORD *v51;
  void *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v4 = v3;
  v8 = sub_2451036D0();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v53 - v13;
  v15 = *(_QWORD *)(a1 + 16);
  if (v15)
  {
    v53 = v4;
    v54 = a2;
    v55 = a3;
    v16 = a1 + ((*(unsigned __int8 *)(v9 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));
    v17 = *MEMORY[0x24BE7D4F8];
    v18 = a1;
    v19 = *(_QWORD *)(v9 + 72);
    v20 = *(void (**)(char *, uint64_t, uint64_t))(v9 + 16);
    v56 = v18;
    swift_bridgeObjectRetain();
    while (1)
    {
      v20(v14, v16, v8);
      v20(v11, (uint64_t)v14, v8);
      if ((*(unsigned int (**)(char *, uint64_t))(v9 + 88))(v11, v8) == v17)
        break;
      v21 = *(void (**)(char *, uint64_t))(v9 + 8);
      v21(v11, v8);
      v21(v14, v8);
      v16 += v19;
      if (!--v15)
      {
        a1 = v56;
        swift_bridgeObjectRelease();
        a2 = v54;
        a3 = v55;
        v4 = v53;
        goto LABEL_6;
      }
    }
    (*(void (**)(char *, uint64_t))(v9 + 96))(v11, v8);
    swift_bridgeObjectRelease();
    v29 = &v11[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25744BD10) + 48)];
    v30 = sub_2451037A8();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v30 - 8) + 8))(v29, v30);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    v31 = v56;
    swift_bridgeObjectRelease();
    if (qword_25744B2F8 != -1)
      swift_once();
    v32 = sub_24510391C();
    __swift_project_value_buffer(v32, (uint64_t)qword_25744BFA8);
    swift_bridgeObjectRetain_n();
    v33 = sub_245103910();
    v34 = sub_245103AB4();
    v35 = os_log_type_enabled(v33, v34);
    v36 = v53;
    if (v35)
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v38 = swift_slowAlloc();
      v58 = v38;
      *(_DWORD *)v37 = 136315138;
      swift_bridgeObjectRetain();
      v39 = MEMORY[0x24952E644](v56, v8);
      v41 = v40;
      swift_bridgeObjectRelease();
      v57 = sub_245101AB4(v39, v41, &v58);
      v31 = v56;
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v33, v34, "Querying Spotlight for reminders {criteria: %s}", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v38, -1, -1);
      MEMORY[0x24952EEE4](v37, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_245103640();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744C0F0);
    v42 = sub_2451036E8();
    v43 = *(_QWORD *)(v42 - 8);
    v44 = (*(unsigned __int8 *)(v43 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v43 + 80);
    v45 = swift_allocObject();
    *(_OWORD *)(v45 + 16) = xmmword_245104860;
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v43 + 104))(v45 + v44, *MEMORY[0x24BE7D5E8], v42);
    sub_2450D8184(0, (unint64_t *)&qword_25744B300);
    v46 = (void *)sub_245103AFC();
    sub_245103634();
    swift_bridgeObjectRelease();

    v47 = (_QWORD *)swift_allocObject();
    v47[2] = v31;
    v47[3] = v36;
    v49 = v54;
    v48 = v55;
    v47[4] = v54;
    v47[5] = v48;
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v50 = (void *)sub_245103898();
    sub_2451038C8();
    swift_release();
    swift_release();

    v51 = (_QWORD *)swift_allocObject();
    v51[2] = v31;
    v51[3] = v49;
    v51[4] = v48;
    swift_bridgeObjectRetain();
    swift_retain();
    v52 = (void *)sub_245103898();
    sub_2451038D4();
    swift_release();
    swift_release();
    swift_release();

  }
  else
  {
LABEL_6:
    if (qword_25744B2F8 != -1)
      swift_once();
    v22 = sub_24510391C();
    __swift_project_value_buffer(v22, (uint64_t)qword_25744BFA8);
    v23 = sub_245103910();
    v24 = sub_245103AB4();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_2450D4000, v23, v24, "Criteria does not contain a text search, using fallback data source", v25, 2u);
      MEMORY[0x24952EEE4](v25, -1, -1);
    }

    v26 = v4 + 4;
    v28 = v4[7];
    v27 = v4[8];
    __swift_project_boxed_opaque_existential_1(v26, v28);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 24))(a1, a2, a3, v28, v27);
  }
}

uint64_t sub_2450FF104(uint64_t a1, uint64_t a2, _QWORD *a3, void (*a4)(unint64_t), uint64_t a5)
{
  uint64_t v5;
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
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  int v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  NSObject *v45;
  unint64_t v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  unint64_t v51;
  id v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  void (*v59)(char *, uint64_t, uint64_t);
  id *v60;
  char *v61;
  uint64_t v62;
  uint64_t (*v63)(id *, uint64_t);
  int v64;
  void (*v65)(id *, uint64_t);
  uint64_t v66;
  id v67;
  char *v69;
  void (*v70)(char *, uint64_t);
  void (*v71)(char *, char *, uint64_t);
  char *v72;
  char *v73;
  void **v74;
  int v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  char *v80;
  char v81;
  void (*v82)(char *, uint64_t);
  char v83;
  char *v84;
  NSObject *v85;
  os_log_type_t v86;
  _BOOL4 v87;
  uint8_t *v88;
  uint8_t *v89;
  char *v90;
  void (*v91)(char *, uint64_t);
  char *v92;
  NSObject *v93;
  os_log_type_t v94;
  uint8_t *v95;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  unint64_t v99;
  void (*v100)(char *, uint64_t);
  void (*v101)(char *, uint64_t);
  uint64_t v102;
  NSObject *v103;
  os_log_type_t v104;
  uint8_t *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void (*v109)(id *, uint64_t);
  unint64_t v110;
  char *v111;
  char *v112;
  void **v113;
  char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  id *v119;
  uint64_t v120;
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  void (*v125)(unint64_t);
  _QWORD *v126;
  uint64_t v127;
  uint64_t v128;
  void (*v129)(char *, uint64_t);
  uint64_t v130;
  id v131[3];

  v123 = a5;
  v125 = a4;
  v131[1] = *(id *)MEMORY[0x24BDAC8D0];
  v8 = sub_2451036C4();
  v115 = *(_QWORD *)(v8 - 8);
  v116 = v8;
  MEMORY[0x24BDAC7A8](v8);
  v111 = (char *)&v108 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v112 = (char *)&v108 - v11;
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v108 - v13;
  v127 = sub_2451036D0();
  v120 = *(_QWORD *)(v127 - 8);
  MEMORY[0x24BDAC7A8](v127);
  v113 = (void **)((char *)&v108 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v16);
  v119 = (id *)((char *)&v108 - v17);
  MEMORY[0x24BDAC7A8](v18);
  v118 = (char *)&v108 - v19;
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)&v108 - v21;
  MEMORY[0x24BDAC7A8](v23);
  v114 = (char *)&v108 - v24;
  v25 = swift_bridgeObjectRetain();
  v26 = sub_24510222C(v25);
  swift_bridgeObjectRelease();
  if (qword_25744B2F8 != -1)
    swift_once();
  v27 = sub_24510391C();
  v28 = __swift_project_value_buffer(v27, (uint64_t)qword_25744BFA8);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v117 = v28;
  v29 = sub_245103910();
  v30 = sub_245103AB4();
  v31 = os_log_type_enabled(v29, (os_log_type_t)v30);
  v128 = a2;
  v124 = v5;
  v126 = a3;
  if (v31)
  {
    v121 = v14;
    LODWORD(v129) = v30;
    v32 = swift_slowAlloc();
    v33 = (void *)swift_slowAlloc();
    v131[0] = v33;
    *(_DWORD *)v32 = 134218498;
    v122 = v22;
    v110 = (unint64_t)v33;
    if (v26 < 0 || (v26 & 0x4000000000000000) != 0)
    {
      v34 = v29;
      swift_bridgeObjectRetain();
      v35 = sub_245103DE4();
      swift_release();
    }
    else
    {
      v34 = v29;
      v35 = *(_QWORD *)(v26 + 16);
    }
    swift_release();
    v130 = v35;
    sub_245103C28();
    swift_release();
    *(_WORD *)(v32 + 12) = 2080;
    v36 = swift_bridgeObjectRetain();
    v37 = MEMORY[0x24952E644](v36, v127);
    v39 = v38;
    swift_bridgeObjectRelease();
    v130 = sub_245101AB4(v37, v39, (uint64_t *)v131);
    sub_245103C28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v32 + 22) = 2080;
    v40 = sub_2450D8184(0, &qword_25744BA20);
    v41 = swift_bridgeObjectRetain();
    v42 = MEMORY[0x24952E644](v41, v40);
    v44 = v43;
    swift_release();
    v130 = sub_245101AB4(v42, v44, (uint64_t *)v131);
    sub_245103C28();
    swift_release_n();
    swift_bridgeObjectRelease();
    v45 = v34;
    _os_log_impl(&dword_2450D4000, v34, (os_log_type_t)v129, "Got %ld reminders from Spotlight {criteria: %s, reminderIDs: %s}", (uint8_t *)v32, 0x20u);
    v46 = v110;
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v46, -1, -1);
    MEMORY[0x24952EEE4](v32, -1, -1);

    a3 = v126;
    v14 = v121;
    v22 = v122;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  v47 = (void *)a3[2];
  sub_2450D8184(0, &qword_25744BA20);
  v48 = (void *)sub_2451039E8();
  swift_release();
  v131[0] = 0;
  v49 = objc_msgSend(v47, sel_fetchRemindersWithObjectIDs_error_, v48, v131);

  v50 = v131[0];
  if (!v49)
  {
    v67 = v131[0];
    sub_2451033A0();

    return swift_willThrow();
  }
  sub_2450D8184(0, &qword_25744BDD0);
  sub_2450EB1F4();
  v51 = sub_245103934();
  v52 = v50;

  v53 = sub_24510211C(v51, &qword_25744BDD0);
  swift_bridgeObjectRelease();
  v54 = v128;
  v55 = *(_QWORD *)(v128 + 16);
  if (!v55)
  {
    v66 = v123;
    goto LABEL_28;
  }
  v110 = v53;
  v121 = v14;
  v122 = v22;
  v56 = (_QWORD *)v120;
  v57 = v128 + ((*(unsigned __int8 *)(v120 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v120 + 80));
  LODWORD(v129) = *MEMORY[0x24BE7D508];
  v58 = *(_QWORD *)(v120 + 72);
  v59 = *(void (**)(char *, uint64_t, uint64_t))(v120 + 16);
  swift_bridgeObjectRetain();
  v61 = v118;
  v60 = v119;
  v62 = v127;
  while (1)
  {
    v59(v61, v57, v62);
    v59((char *)v60, (uint64_t)v61, v62);
    v63 = (uint64_t (*)(id *, uint64_t))v56[11];
    v64 = v63(v60, v62);
    if (v64 == (_DWORD)v129)
      break;
    v65 = (void (*)(id *, uint64_t))v56[1];
    v65(v60, v62);
    v65((id *)v61, v62);
    v57 += v58;
    if (!--v55)
    {
      v54 = v128;
      swift_bridgeObjectRelease();
      v66 = v123;
LABEL_27:
      v53 = v110;
      goto LABEL_28;
    }
  }
  v109 = (void (*)(id *, uint64_t))v56[12];
  v109(v60, v62);

  v108 = __swift_instantiateConcreteTypeFromMangledName(&qword_25744BD38);
  v69 = (char *)v60 + *(int *)(v108 + 48);
  v70 = *(void (**)(char *, uint64_t))(v115 + 8);
  v70(v69, v116);
  swift_bridgeObjectRelease();
  v71 = (void (*)(char *, char *, uint64_t))v56[4];
  v72 = v122;
  v71(v122, v61, v62);
  v73 = v114;
  v71(v114, v72, v62);
  v74 = v113;
  v59((char *)v113, (uint64_t)v73, v62);
  v75 = v63(v74, v62);
  if (v75 != (_DWORD)v129)
  {
    v91 = (void (*)(char *, uint64_t))v56[1];
    v91(v73, v62);
    v91((char *)v74, v62);
LABEL_26:
    v66 = v123;
    v54 = v128;
    goto LABEL_27;
  }
  v109(v74, v62);
  v76 = (char *)*v74;
  v77 = v115;
  v78 = v116;
  v79 = v121;
  (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v121, (char *)v74 + *(int *)(v108 + 48), v116);
  v80 = v112;
  (*(void (**)(char *, _QWORD, uint64_t))(v77 + 104))(v112, *MEMORY[0x24BE7D530], v78);
  v81 = sub_2451036B8();
  v82 = v70;
  v83 = v81;
  v129 = v82;
  v82(v80, v78);
  if ((v83 & 1) == 0)
  {
    v92 = v111;
    (*(void (**)(char *, char *, uint64_t))(v77 + 16))(v111, v79, v78);
    v93 = sub_245103910();
    v94 = sub_245103AA8();
    if (os_log_type_enabled(v93, v94))
    {
      v95 = (uint8_t *)swift_slowAlloc();
      v96 = v78;
      v97 = (void *)swift_slowAlloc();
      v131[0] = v97;
      v122 = v76;
      *(_DWORD *)v95 = 136315138;
      v119 = (id *)(v95 + 4);
      sub_245102E70();
      v98 = sub_245103E14();
      v130 = sub_245101AB4(v98, v99, (uint64_t *)v131);
      sub_245103C28();
      swift_bridgeObjectRelease();
      v100 = v129;
      v129(v92, v96);
      _os_log_impl(&dword_2450D4000, v93, v94, "Called with %s, but should only be .includeForSiri in TTRIntentsHandlerSpotlightDataSource.", v95, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v97, -1, -1);
      MEMORY[0x24952EEE4](v95, -1, -1);

      v100(v121, v96);
      (*(void (**)(char *, uint64_t))(v120 + 8))(v114, v62);
    }
    else
    {

      v101 = v129;
      v129(v92, v78);
      v101(v79, v78);
      (*(void (**)(char *, uint64_t))(v120 + 8))(v73, v62);
    }
    goto LABEL_26;
  }
  v84 = v76;
  v85 = sub_245103910();
  v86 = sub_245103AB4();
  v87 = os_log_type_enabled(v85, v86);
  v66 = v123;
  v54 = v128;
  if (v87)
  {
    v88 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v88 = 0;
    _os_log_impl(&dword_2450D4000, v85, v86, "Criteria had list id, filtering further", v88, 2u);
    v89 = v88;
    v79 = v121;
    MEMORY[0x24952EEE4](v89, -1, -1);
  }

  v90 = v84;
  v53 = sub_2451030C0(v110);
  swift_release();

  v129(v79, v78);
  (*(void (**)(char *, uint64_t))(v120 + 8))(v114, v62);

LABEL_28:
  if (v53 >> 62)
  {
    swift_bridgeObjectRetain();
    v102 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v102)
      goto LABEL_30;
  }
  else if (*(_QWORD *)((v53 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_30:
    v125(v53);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  v103 = sub_245103910();
  v104 = sub_245103AB4();
  if (os_log_type_enabled(v103, v104))
  {
    v105 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v105 = 0;
    _os_log_impl(&dword_2450D4000, v103, v104, "Consulting fallbackDataSource since Spotlight result is empty.", v105, 2u);
    MEMORY[0x24952EEE4](v105, -1, -1);
  }

  v106 = v126[7];
  v107 = v126[8];
  __swift_project_boxed_opaque_existential_1(v126 + 4, v106);
  return (*(uint64_t (**)(uint64_t, void (*)(unint64_t), uint64_t, uint64_t, uint64_t))(v107 + 24))(v54, v125, v66, v106, v107);
}

uint64_t sub_2450FFC3C(void *a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(_QWORD);
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v21;

  if (qword_25744B2F8 != -1)
    swift_once();
  v5 = sub_24510391C();
  __swift_project_value_buffer(v5, (uint64_t)qword_25744BFA8);
  swift_bridgeObjectRetain();
  v6 = a1;
  swift_bridgeObjectRetain();
  v7 = a1;
  v8 = sub_245103910();
  v9 = sub_245103A9C();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v11 = swift_slowAlloc();
    v21 = v11;
    *(_DWORD *)v10 = 136315394;
    v12 = sub_2451036D0();
    v13 = swift_bridgeObjectRetain();
    v14 = MEMORY[0x24952E644](v13, v12);
    v15 = a3;
    v17 = v16;
    swift_bridgeObjectRelease();
    sub_245101AB4(v14, v17, &v21);
    sub_245103C28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v10 + 12) = 2080;
    swift_getErrorValue();
    v18 = sub_245103E50();
    sub_245101AB4(v18, v19, &v21);
    a3 = v15;
    sub_245103C28();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2450D4000, v8, v9, "Error matching reminders from Spotlight {criteria: %s, error: %s}", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v11, -1, -1);
    MEMORY[0x24952EEE4](v10, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  return a3(MEMORY[0x24BEE4AF8]);
}

void sub_2450FFEB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  _QWORD *v27;
  void *v28;
  uint64_t v29;

  v4 = v3;
  if (*(_QWORD *)(a1 + 16) < 2uLL)
  {
    if (qword_25744B2F8 != -1)
      swift_once();
    v10 = sub_24510391C();
    __swift_project_value_buffer(v10, (uint64_t)qword_25744BFA8);
    swift_bridgeObjectRetain_n();
    v11 = sub_245103910();
    v12 = sub_245103AB4();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v29 = v14;
      *(_DWORD *)v13 = 136315138;
      v15 = sub_2451036D0();
      v16 = swift_bridgeObjectRetain();
      v17 = MEMORY[0x24952E644](v16, v15);
      v19 = v18;
      swift_bridgeObjectRelease();
      sub_245101AB4(v17, v19, &v29);
      sub_245103C28();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2450D4000, v11, v12, "Querying Spotlight for lists {criteria: %s}", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24952EEE4](v14, -1, -1);
      MEMORY[0x24952EEE4](v13, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    sub_245103640();
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744C0F0);
    v20 = sub_2451036E8();
    v21 = *(_QWORD *)(v20 - 8);
    v22 = (*(unsigned __int8 *)(v21 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v21 + 80);
    v23 = swift_allocObject();
    *(_OWORD *)(v23 + 16) = xmmword_245104860;
    (*(void (**)(unint64_t, _QWORD, uint64_t))(v21 + 104))(v23 + v22, *MEMORY[0x24BE7D5E0], v20);
    sub_2450D8184(0, (unint64_t *)&qword_25744B300);
    v24 = (void *)sub_245103AFC();
    sub_245103634();
    swift_bridgeObjectRelease();

    v25 = (_QWORD *)swift_allocObject();
    v25[2] = a1;
    v25[3] = v4;
    v25[4] = a2;
    v25[5] = a3;
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    v26 = (void *)sub_245103898();
    sub_2451038C8();
    swift_release();
    swift_release();

    v27 = (_QWORD *)swift_allocObject();
    v27[2] = a1;
    v27[3] = a2;
    v27[4] = a3;
    swift_retain();
    swift_bridgeObjectRetain();
    v28 = (void *)sub_245103898();
    sub_2451038D4();
    swift_release();
    swift_release();
    swift_release();

  }
  else
  {
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = a2;
    v8[3] = a3;
    v8[4] = a1;
    swift_retain();
    v9 = swift_bridgeObjectRetain();
    sub_2450FE99C(v9, (uint64_t)sub_245102D98, (uint64_t)v8, (void (*)(uint64_t *__return_ptr, uint64_t))sub_245102BEC);
    swift_release();
  }
}

uint64_t sub_2451002C0(unint64_t a1, uint64_t a2, void (*a3)(char *), uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  v8 = sub_24510373C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2450F8078(a5, a1);
  swift_bridgeObjectRetain();
  sub_245103724();
  a3(v11);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_245100380(uint64_t a1, uint64_t a2, _QWORD *a3, void (*a4)(_QWORD), uint64_t a5)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  unint64_t v35;
  id v36;
  char *v37;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void (*v46)(_QWORD);
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  _QWORD *v53;
  uint64_t v54;
  id v55[2];

  v53 = a3;
  v55[1] = *(id *)MEMORY[0x24BDAC8D0];
  v9 = sub_24510373C();
  v51 = *(_QWORD *)(v9 - 8);
  v52 = v9;
  MEMORY[0x24BDAC7A8](v9);
  v50 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = swift_bridgeObjectRetain();
  v12 = sub_24510222C(v11);
  swift_bridgeObjectRelease();
  if (qword_25744B2F8 != -1)
    swift_once();
  v13 = sub_24510391C();
  v14 = __swift_project_value_buffer(v13, (uint64_t)qword_25744BFA8);
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  v49 = v14;
  v15 = sub_245103910();
  v16 = sub_245103AB4();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = swift_slowAlloc();
    v45 = (void *)swift_slowAlloc();
    v55[0] = v45;
    *(_DWORD *)v17 = 134218498;
    v47 = a5;
    v48 = v5;
    v46 = a4;
    if (v12 < 0 || (v12 & 0x4000000000000000) != 0)
    {
      v18 = a2;
      swift_bridgeObjectRetain();
      v19 = sub_245103DE4();
      swift_release();
    }
    else
    {
      v18 = a2;
      v19 = *(_QWORD *)(v12 + 16);
    }
    swift_release();
    v54 = v19;
    sub_245103C28();
    swift_release();
    *(_WORD *)(v17 + 12) = 2080;
    v20 = sub_2451036D0();
    v21 = swift_bridgeObjectRetain();
    v22 = MEMORY[0x24952E644](v21, v20);
    v24 = v23;
    swift_bridgeObjectRelease();
    v54 = sub_245101AB4(v22, v24, (uint64_t *)v55);
    sub_245103C28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 22) = 2080;
    v25 = sub_2450D8184(0, &qword_25744BA20);
    v26 = swift_bridgeObjectRetain();
    v27 = MEMORY[0x24952E644](v26, v25);
    v29 = v28;
    swift_release();
    v54 = sub_245101AB4(v27, v29, (uint64_t *)v55);
    sub_245103C28();
    swift_release_n();
    a2 = v18;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2450D4000, v15, v16, "Got %ld lists from Spotlight {criteria: %s, listIDs: %s}", (uint8_t *)v17, 0x20u);
    v30 = v45;
    swift_arrayDestroy();
    MEMORY[0x24952EEE4](v30, -1, -1);
    MEMORY[0x24952EEE4](v17, -1, -1);

    a5 = v47;
    a4 = v46;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  v31 = (void *)v53[2];
  sub_2450D8184(0, &qword_25744BA20);
  v32 = (void *)sub_2451039E8();
  swift_release();
  v55[0] = 0;
  v33 = objc_msgSend(v31, sel_fetchListsWithObjectIDs_error_, v32, v55);

  v34 = v55[0];
  if (v33)
  {
    sub_2450D8184(0, (unint64_t *)&qword_25744B5B0);
    sub_2450EB1F4();
    v35 = sub_245103934();
    v36 = v34;

    if ((v35 & 0xC000000000000001) != 0)
    {
      if (sub_245103C7C())
      {
LABEL_12:
        sub_24510211C(v35, (unint64_t *)&qword_25744B5B0);
        swift_bridgeObjectRelease();
        v37 = v50;
        sub_245103724();
        a4(v37);
        return (*(uint64_t (**)(char *, uint64_t))(v51 + 8))(v37, v52);
      }
    }
    else if (*(_QWORD *)(v35 + 16))
    {
      goto LABEL_12;
    }
    swift_bridgeObjectRelease();
    v40 = sub_245103910();
    v41 = sub_245103AB4();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v42 = 0;
      _os_log_impl(&dword_2450D4000, v40, v41, "Consulting fallbackDataSource for CSL or non-Spotlight-indexed list", v42, 2u);
      MEMORY[0x24952EEE4](v42, -1, -1);
    }

    v43 = v53[7];
    v44 = v53[8];
    __swift_project_boxed_opaque_existential_1(v53 + 4, v43);
    return (*(uint64_t (**)(uint64_t, void (*)(_QWORD), uint64_t, uint64_t, uint64_t))(v44 + 32))(a2, a4, a5, v43, v44);
  }
  else
  {
    v39 = v55[0];
    sub_2451033A0();

    return swift_willThrow();
  }
}

uint64_t sub_2451008FC(void *a1, uint64_t a2, void (*a3)(_QWORD), uint64_t a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(_QWORD);
  uint64_t v35;
  uint64_t v36;

  v7 = sub_24510373C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v31 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_25744B2F8 != -1)
    swift_once();
  v11 = sub_24510391C();
  __swift_project_value_buffer(v11, (uint64_t)qword_25744BFA8);
  swift_bridgeObjectRetain();
  v12 = a1;
  swift_bridgeObjectRetain();
  v13 = a1;
  v14 = sub_245103910();
  v15 = sub_245103A9C();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v31 = v8;
    v17 = v16;
    v18 = swift_slowAlloc();
    v34 = a3;
    v19 = v18;
    v36 = v18;
    *(_DWORD *)v17 = 136315394;
    v20 = sub_2451036D0();
    v33 = a4;
    v21 = v20;
    v22 = swift_bridgeObjectRetain();
    v23 = MEMORY[0x24952E644](v22, v21);
    v32 = v7;
    v25 = v24;
    swift_bridgeObjectRelease();
    v35 = sub_245101AB4(v23, v25, &v36);
    sub_245103C28();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v17 + 12) = 2080;
    swift_getErrorValue();
    v26 = sub_245103E50();
    v35 = sub_245101AB4(v26, v27, &v36);
    v7 = v32;
    sub_245103C28();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2450D4000, v14, v15, "Error matching lists from Spotlight {criteria: %s, error: %s}", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    v28 = v19;
    a3 = v34;
    MEMORY[0x24952EEE4](v28, -1, -1);
    v29 = v17;
    v8 = v31;
    MEMORY[0x24952EEE4](v29, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();

  }
  sub_245103724();
  a3(v10);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_245100BD8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  void (*v28)(uint64_t *, _QWORD, uint64_t);
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void (*v35)(unint64_t, uint64_t *, uint64_t);
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char *v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  unint64_t v56;
  unsigned int v57;
  unsigned int v58;
  char *v59;
  char *v60;
  unsigned int v61;
  unsigned int v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  uint64_t v69;

  v68 = sub_2451036D0();
  v64 = *(_QWORD *)(v68 - 8);
  MEMORY[0x24BDAC7A8](v68);
  v8 = (char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (uint64_t *)((char *)&v52 - v10);
  v12 = swift_allocObject();
  v13 = MEMORY[0x24BEE4AF8];
  v63 = v12;
  *(_QWORD *)(v12 + 16) = MEMORY[0x24BEE4AF8];
  v69 = v13;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    result = sub_245103DE4();
    v14 = result;
    if (result)
      goto LABEL_3;
LABEL_29:
    swift_bridgeObjectRelease();
    v47 = MEMORY[0x24BEE4AF8];
LABEL_30:
    v48 = v69;
    if (*(_QWORD *)(v47 + 16))
    {
      v49 = (_QWORD *)swift_allocObject();
      v49[2] = v3;
      v49[3] = a1;
      v49[4] = a2;
      v49[5] = a3;
      v49[6] = v48;
      v49[7] = v63;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      swift_retain();
      swift_retain();
      swift_retain();
      sub_2450FE99C(v47, (uint64_t)sub_2451024D0, (uint64_t)v49, (void (*)(uint64_t *__return_ptr, uint64_t))sub_245102BEC);
      swift_release();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      v50 = v3[7];
      v51 = v3[8];
      __swift_project_boxed_opaque_existential_1(v3 + 4, v50);
      (*(void (**)(unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v51 + 40))(a1, a2, a3, v50, v51);
    }
    return swift_release();
  }
  v14 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  result = swift_bridgeObjectRetain();
  if (!v14)
    goto LABEL_29;
LABEL_3:
  if (v14 >= 1)
  {
    v59 = v8;
    v53 = a2;
    v54 = a3;
    v55 = v3;
    v16 = 0;
    v65 = a1 & 0xC000000000000001;
    v62 = *MEMORY[0x24BE7D800];
    v61 = *MEMORY[0x24BE7D4F8];
    v58 = *MEMORY[0x24BE7D608];
    v57 = *MEMORY[0x24BE7D518];
    v60 = "8^B16";
    v56 = 0x800000024510A030;
    v66 = v14;
    v67 = a1;
    while (1)
    {
      if (v65)
        v18 = (id)MEMORY[0x24952E92C](v16, a1);
      else
        v18 = *(id *)(a1 + 8 * v16 + 32);
      v19 = v18;
      v20 = (void *)sub_245103A78();

      if (v20)
      {
        v17 = v19;
        MEMORY[0x24952E620]();
        if (*(_QWORD *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v69 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_245103A18();
        sub_245103A24();
        sub_245103A0C();
        goto LABEL_8;
      }
      v21 = objc_msgSend(v19, sel_title);
      v22 = objc_msgSend(v21, sel_spokenPhrase);

      v23 = sub_245103988();
      v25 = v24;

      v26 = (char *)v11 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_25744BD10) + 48);
      *v11 = v23;
      v11[1] = v25;
      v27 = sub_2451037A8();
      (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v27 - 8) + 104))(v26, v62, v27);
      v28 = *(void (**)(uint64_t *, _QWORD, uint64_t))(v64 + 104);
      v28(v11, v61, v68);
      v29 = *(_QWORD *)(v63 + 16);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        v29 = sub_2451018A8(0, *(_QWORD *)(v29 + 16) + 1, 1, v29, (uint64_t *)&unk_25744B8D0, (uint64_t (*)(_QWORD))MEMORY[0x24BE7D560]);
        *(_QWORD *)(v63 + 16) = v29;
      }
      v31 = *(_QWORD *)(v29 + 16);
      v30 = *(_QWORD *)(v29 + 24);
      if (v31 >= v30 >> 1)
      {
        v29 = sub_2451018A8(v30 > 1, v31 + 1, 1, v29, (uint64_t *)&unk_25744B8D0, (uint64_t (*)(_QWORD))MEMORY[0x24BE7D560]);
        *(_QWORD *)(v63 + 16) = v29;
      }
      *(_QWORD *)(v29 + 16) = v31 + 1;
      v32 = (*(unsigned __int8 *)(v64 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v64 + 80);
      v33 = *(_QWORD *)(v64 + 72);
      v34 = v29 + v32 + v33 * v31;
      v35 = *(void (**)(unint64_t, uint64_t *, uint64_t))(v64 + 32);
      v35(v34, v11, v68);
      v36 = objc_msgSend(v19, sel_title);
      v37 = objc_msgSend(v36, sel_vocabularyIdentifier);

      if (v37)
      {
        v38 = sub_245103988();
        v40 = v39;

        if (v38 == 0xD000000000000011 && v40 == v56)
        {
          swift_bridgeObjectRelease();
LABEL_22:
          v42 = sub_245103700();
          v43 = v59;
          (*(void (**)(char *, _QWORD, uint64_t))(*(_QWORD *)(v42 - 8) + 104))(v59, v58, v42);
          v28((uint64_t *)v43, v57, v68);
          v44 = *(_QWORD *)(v63 + 16);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            v44 = sub_2451018A8(0, *(_QWORD *)(v44 + 16) + 1, 1, v44, (uint64_t *)&unk_25744B8D0, (uint64_t (*)(_QWORD))MEMORY[0x24BE7D560]);
            *(_QWORD *)(v63 + 16) = v44;
          }
          v46 = *(_QWORD *)(v44 + 16);
          v45 = *(_QWORD *)(v44 + 24);
          if (v46 >= v45 >> 1)
          {
            v44 = sub_2451018A8(v45 > 1, v46 + 1, 1, v44, (uint64_t *)&unk_25744B8D0, (uint64_t (*)(_QWORD))MEMORY[0x24BE7D560]);
            *(_QWORD *)(v63 + 16) = v44;
          }
          *(_QWORD *)(v44 + 16) = v46 + 1;
          v35(v44 + v32 + v46 * v33, (uint64_t *)v43, v68);
          goto LABEL_8;
        }
        v41 = sub_245103E38();
        swift_bridgeObjectRelease();
        if ((v41 & 1) != 0)
          goto LABEL_22;
      }
LABEL_8:
      ++v16;

      a1 = v67;
      if (v66 == v16)
      {
        swift_bridgeObjectRelease();
        v47 = *(_QWORD *)(v63 + 16);
        a3 = v54;
        v3 = v55;
        a2 = v53;
        goto LABEL_30;
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_245101204(unint64_t a1, unint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  void (*v20)(uint64_t, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v22 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v22)
      goto LABEL_5;
  }
  else if (*(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_5:
    v16 = a3 + 4;
    v17 = a3[7];
    v18 = a3[8];
    __swift_project_boxed_opaque_existential_1(v16, v17);
    v19 = (_QWORD *)swift_allocObject();
    v19[2] = a1;
    v19[3] = a8;
    v19[4] = a2;
    v19[5] = a5;
    v19[6] = a6;
    v20 = *(void (**)(uint64_t, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v18 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    v20(a7, sub_245102D2C, v19, v17, v18);
    return swift_release();
  }
  if (a2 >> 62)
  {
    swift_bridgeObjectRetain();
    v23 = sub_245103DE4();
    swift_bridgeObjectRelease();
    if (v23)
      goto LABEL_5;
  }
  else if (*(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_5;
  }
  v24 = a3[7];
  v25 = a3[8];
  __swift_project_boxed_opaque_existential_1(a3 + 4, v24);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v25 + 40))(a4, a5, a6, v24, v25);
}

uint64_t sub_2451013AC(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(char *), uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  void (*v18)(char *);
  uint64_t v19;
  unint64_t v20;

  v17 = a6;
  v18 = a5;
  v8 = sub_24510373C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_245103730();
  v20 = a2;
  swift_bridgeObjectRetain();
  sub_2450EBF68(v12);
  v13 = v20;
  swift_beginAccess();
  v14 = swift_bridgeObjectRetain();
  sub_2450F8078(v14, v13);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v15 = sub_245103718();
  v19 = a4;
  swift_bridgeObjectRetain();
  sub_2450EBF5C(v15);
  sub_245103724();
  v18(v11);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_2451014F0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1(v0 + 32);
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for TTRIntentsHandlerSpotlightDataSource()
{
  return objc_opt_self();
}

uint64_t sub_245101544(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 64);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v1 + 32), v3);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 8))(a1, v3, v4);
}

void sub_245101594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2450FEB3C(a1, a2, a3);
}

void sub_2451015B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_2450FFEB4(a1, a2, a3);
}

uint64_t sub_2451015D4(unint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_245100BD8(a1, a2, a3);
}

uint64_t sub_2451015F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;

  v9 = *(_QWORD *)(*(_QWORD *)v4 + 56);
  v10 = *(_QWORD *)(*(_QWORD *)v4 + 64);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v4 + 32), v9);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v10 + 56))(a1, a2, a3, a4, v9, v10);
}

uint64_t sub_24510166C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 64);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v0 + 32), v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 72))(v1, v2);
}

uint64_t sub_2451016B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)v2 + 64);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v2 + 32), v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 80))(a1, a2, v5, v6);
}

uint64_t sub_245101714(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *(_QWORD *)(*(_QWORD *)v2 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)v2 + 64);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(*(_QWORD *)v2 + 32), v5);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 88))(a1, a2, v5, v6);
}

uint64_t sub_245101774(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2451018A8(a1, a2, a3, a4, (uint64_t *)&unk_25744B8D0, (uint64_t (*)(_QWORD))MEMORY[0x24BE7D560]);
}

_QWORD *sub_245101788(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_25744BFA0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
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
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_245102EB8(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_245101894(char a1, int64_t a2, char a3, unint64_t a4)
{
  return sub_2451018A8(a1, a2, a3, a4, (uint64_t *)&unk_25744C110, (uint64_t (*)(_QWORD))MEMORY[0x24BE7DD88]);
}

uint64_t sub_2451018A8(char a1, int64_t a2, char a3, unint64_t a4, uint64_t *a5, uint64_t (*a6)(_QWORD))
{
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  size_t v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v9 = *(_QWORD *)(a4 + 24);
    v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
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
  v11 = *(_QWORD *)(a4 + 16);
  if (v10 <= v11)
    v12 = *(_QWORD *)(a4 + 16);
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
  v17 = _swift_stdlib_malloc_size(v16);
  if (!v14 || (v17 - v15 == 0x8000000000000000 ? (v18 = v14 == -1) : (v18 = 0), v18))
  {
LABEL_29:
    result = sub_245103DD8();
    __break(1u);
    return result;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(v17 - v15) / v14);
LABEL_19:
  v19 = *(_QWORD *)(a6(0) - 8);
  v20 = (*(unsigned __int8 *)(v19 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v19 + 80);
  v21 = (unint64_t)v16 + v20;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v16 < a4 || v21 >= a4 + v20 + *(_QWORD *)(v19 + 72) * v11)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_245102FA8(0, v11, v21, a4, a6);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v16;
}

uint64_t sub_245101AB4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_245101B84(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_245102DA4((uint64_t)v12, *a3);
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
      sub_245102DA4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_245101B84(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_245103C34();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_245101D3C(a5, a6);
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
  v8 = sub_245103D00();
  if (!v8)
  {
    sub_245103DD8();
    __break(1u);
LABEL_17:
    result = sub_245103DFC();
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

uint64_t sub_245101D3C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_245101DD0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_245101FA8(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_245101FA8(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_245101DD0(uint64_t a1, unint64_t a2)
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
      v3 = sub_245101F44(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_245103CD0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_245103DD8();
      __break(1u);
LABEL_10:
      v2 = sub_2451039C4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_245103DFC();
    __break(1u);
LABEL_14:
    result = sub_245103DD8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_245101F44(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744C0F8);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_245101FA8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744C0F8);
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
  result = sub_245103DFC();
  __break(1u);
  return result;
}

uint64_t sub_2451020F4(unint64_t a1)
{
  return sub_24510211C(a1, (unint64_t *)&qword_25744B5B0);
}

uint64_t sub_245102108(unint64_t a1)
{
  return sub_24510211C(a1, &qword_25744BDD0);
}

uint64_t sub_24510211C(unint64_t a1, unint64_t *a2)
{
  uint64_t v4;
  uint64_t *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v4 = sub_245103C7C();
    if (v4)
      goto LABEL_3;
    return MEMORY[0x24BEE4AF8];
  }
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
    return MEMORY[0x24BEE4AF8];
LABEL_3:
  if (v4 <= 0)
  {
    v5 = (uint64_t *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
    v5 = (uint64_t *)swift_allocObject();
    v6 = _swift_stdlib_malloc_size(v5);
    v7 = v6 - 32;
    if (v6 < 32)
      v7 = v6 - 25;
    v5[2] = v4;
    v5[3] = (2 * (v7 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  v8 = sub_245102554((uint64_t)&v10, v5 + 4, v4, a1, a2);
  result = sub_2450EB1A0();
  if (v8 == v4)
    return (uint64_t)v5;
  __break(1u);
  return result;
}

uint64_t sub_24510222C(unint64_t a1)
{
  uint64_t v2;
  uint64_t *v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  if ((a1 & 0xC000000000000001) != 0)
  {
    v2 = sub_245103C7C();
    if (v2)
      goto LABEL_3;
    return MEMORY[0x24BEE4AF8];
  }
  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_3:
  if (v2 <= 0)
  {
    v3 = (uint64_t *)MEMORY[0x24BEE4AF8];
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_25744B330);
    v3 = (uint64_t *)swift_allocObject();
    v4 = _swift_stdlib_malloc_size(v3);
    v5 = v4 - 32;
    if (v4 < 32)
      v5 = v4 - 25;
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  v6 = sub_24510281C((uint64_t)&v8, v3 + 4, v2, a1);
  result = sub_2450EB1A0();
  if (v6 == v2)
    return (uint64_t)v3;
  __break(1u);
  return result;
}

uint64_t (*sub_245102324(uint64_t (**a1)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_2451023FC(v6, a2, a3);
  return sub_245102378;
}

uint64_t (*sub_24510237C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_2451024E0(v6, a2, a3);
  return sub_245102378;
}

void sub_2451023D0(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_2451023FC(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t (*v3)();
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x24952E92C](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_245103318;
  }
  __break(1u);
  return result;
}

uint64_t sub_245102468()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_24510248C()
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2451024D0(unint64_t a1, unint64_t a2)
{
  uint64_t v2;

  return sub_245101204(a1, a2, *(_QWORD **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), *(_QWORD *)(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56));
}

void (*sub_2451024E0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x24952E92C](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_24510254C;
  }
  __break(1u);
  return result;
}

void sub_24510254C(id *a1)
{

}

uint64_t sub_245102554(uint64_t result, uint64_t *a2, uint64_t a3, unint64_t a4, unint64_t *a5)
{
  unint64_t v5;
  uint64_t *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  uint64_t v27;

  v5 = a4;
  v7 = a2;
  v8 = (_QWORD *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    result = sub_245103D54();
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v5 = result | 0x8000000000000000;
    if (v7)
      goto LABEL_3;
LABEL_36:
    v12 = 0;
    a3 = 0;
LABEL_45:
    *v8 = v5;
    v8[1] = v9;
    v8[2] = v10;
    v8[3] = v12;
    v8[4] = v11;
    return a3;
  }
  v20 = -1 << *(_BYTE *)(a4 + 32);
  v9 = a4 + 64;
  v21 = ~v20;
  v22 = -v20;
  if (v22 < 64)
    v23 = ~(-1 << v22);
  else
    v23 = -1;
  v11 = v23 & *(_QWORD *)(a4 + 64);
  v10 = v21;
  if (!a2)
    goto LABEL_36;
LABEL_3:
  if (!a3)
  {
    v12 = 0;
    goto LABEL_45;
  }
  if (a3 < 0)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v24 = v10;
  v12 = 0;
  v13 = 0;
  v25 = (unint64_t)(v10 + 64) >> 6;
  while ((v5 & 0x8000000000000000) != 0)
  {
    if (!sub_245103DB4())
    {
      a3 = v13;
LABEL_44:
      v10 = v24;
      goto LABEL_45;
    }
    swift_unknownObjectRelease();
    sub_2450D8184(0, a5);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v16 = v27;
    result = swift_unknownObjectRelease();
    if (!v27)
      goto LABEL_43;
LABEL_8:
    ++v13;
    *v7++ = v16;
    if (v13 == a3)
      goto LABEL_44;
  }
  if (v11)
  {
    v14 = __clz(__rbit64(v11));
    v11 &= v11 - 1;
    v15 = v14 | (v12 << 6);
    goto LABEL_7;
  }
  v17 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_47;
  }
  if (v17 >= v25)
    goto LABEL_39;
  v18 = *(_QWORD *)(v9 + 8 * v17);
  if (v18)
    goto LABEL_23;
  v12 += 2;
  if (v17 + 1 >= v25)
  {
    v11 = 0;
    v12 = v17;
    goto LABEL_43;
  }
  v18 = *(_QWORD *)(v9 + 8 * v12);
  if (v18)
  {
LABEL_16:
    v17 = v12;
LABEL_23:
    v11 = (v18 - 1) & v18;
    v15 = __clz(__rbit64(v18)) + (v17 << 6);
    v12 = v17;
LABEL_7:
    result = (uint64_t)*(id *)(*(_QWORD *)(v5 + 56) + 8 * v15);
    v16 = result;
    if (!result)
      goto LABEL_43;
    goto LABEL_8;
  }
  v19 = v17 + 2;
  if (v17 + 2 >= v25)
    goto LABEL_39;
  v18 = *(_QWORD *)(v9 + 8 * v19);
  if (v18)
  {
LABEL_22:
    v17 = v19;
    goto LABEL_23;
  }
  v12 = v17 + 3;
  if (v17 + 3 >= v25)
  {
    v11 = 0;
    v12 = v17 + 2;
    goto LABEL_43;
  }
  v18 = *(_QWORD *)(v9 + 8 * v12);
  if (v18)
    goto LABEL_16;
  v19 = v17 + 4;
  if (v17 + 4 >= v25)
  {
LABEL_39:
    v11 = 0;
LABEL_43:
    a3 = v13;
    goto LABEL_44;
  }
  v18 = *(_QWORD *)(v9 + 8 * v19);
  if (v18)
    goto LABEL_22;
  while (1)
  {
    v17 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v17 >= v25)
    {
      v11 = 0;
      v12 = v25 - 1;
      goto LABEL_43;
    }
    v18 = *(_QWORD *)(v9 + 8 * v17);
    ++v19;
    if (v18)
      goto LABEL_23;
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_24510281C(uint64_t result, uint64_t *a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4;
  uint64_t *v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;

  v4 = a4;
  v6 = a2;
  v7 = (_QWORD *)result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    result = sub_245103D54();
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v4 = result | 0x8000000000000000;
    if (v6)
      goto LABEL_3;
LABEL_36:
    v11 = 0;
    a3 = 0;
LABEL_45:
    *v7 = v4;
    v7[1] = v8;
    v7[2] = v9;
    v7[3] = v11;
    v7[4] = v10;
    return a3;
  }
  v19 = -1 << *(_BYTE *)(a4 + 32);
  v8 = a4 + 64;
  v20 = ~v19;
  v21 = -v19;
  if (v21 < 64)
    v22 = ~(-1 << v21);
  else
    v22 = -1;
  v10 = v22 & *(_QWORD *)(a4 + 64);
  v9 = v20;
  if (!a2)
    goto LABEL_36;
LABEL_3:
  if (!a3)
  {
    v11 = 0;
    goto LABEL_45;
  }
  if (a3 < 0)
  {
LABEL_47:
    __break(1u);
    goto LABEL_48;
  }
  v23 = v9;
  v11 = 0;
  v12 = 0;
  v24 = (unint64_t)(v9 + 64) >> 6;
  while ((v4 & 0x8000000000000000) != 0)
  {
    if (!sub_245103DC0())
    {
      a3 = v12;
LABEL_44:
      v9 = v23;
      goto LABEL_45;
    }
    sub_2450D8184(0, &qword_25744BA20);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v15 = v25;
    result = swift_unknownObjectRelease();
    if (!v25)
      goto LABEL_43;
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
      goto LABEL_44;
  }
  if (v10)
  {
    v13 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    v14 = v13 | (v11 << 6);
    goto LABEL_7;
  }
  v16 = v11 + 1;
  if (__OFADD__(v11, 1))
  {
    __break(1u);
    goto LABEL_47;
  }
  if (v16 >= v24)
    goto LABEL_39;
  v17 = *(_QWORD *)(v8 + 8 * v16);
  if (v17)
    goto LABEL_23;
  v11 += 2;
  if (v16 + 1 >= v24)
  {
    v10 = 0;
    v11 = v16;
    goto LABEL_43;
  }
  v17 = *(_QWORD *)(v8 + 8 * v11);
  if (v17)
  {
LABEL_16:
    v16 = v11;
LABEL_23:
    v10 = (v17 - 1) & v17;
    v14 = __clz(__rbit64(v17)) + (v16 << 6);
    v11 = v16;
LABEL_7:
    result = (uint64_t)*(id *)(*(_QWORD *)(v4 + 48) + 8 * v14);
    v15 = result;
    if (!result)
      goto LABEL_43;
    goto LABEL_8;
  }
  v18 = v16 + 2;
  if (v16 + 2 >= v24)
    goto LABEL_39;
  v17 = *(_QWORD *)(v8 + 8 * v18);
  if (v17)
  {
LABEL_22:
    v16 = v18;
    goto LABEL_23;
  }
  v11 = v16 + 3;
  if (v16 + 3 >= v24)
  {
    v10 = 0;
    v11 = v16 + 2;
    goto LABEL_43;
  }
  v17 = *(_QWORD *)(v8 + 8 * v11);
  if (v17)
    goto LABEL_16;
  v18 = v16 + 4;
  if (v16 + 4 >= v24)
  {
LABEL_39:
    v10 = 0;
LABEL_43:
    a3 = v12;
    goto LABEL_44;
  }
  v17 = *(_QWORD *)(v8 + 8 * v18);
  if (v17)
    goto LABEL_22;
  while (1)
  {
    v16 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v16 >= v24)
    {
      v10 = 0;
      v11 = v24 - 1;
      goto LABEL_43;
    }
    v17 = *(_QWORD *)(v8 + 8 * v16);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_245102AE8@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_25744B8D0);
  v4 = sub_2451036D0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_245104860;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 16))(v7 + v6, a1, v4);
  __swift_instantiateConcreteTypeFromMangledName(&qword_25744C0D8);
  swift_allocObject();
  v8 = sub_2451038EC();
  result = swift_bridgeObjectRelease();
  *a2 = v8;
  return result;
}

uint64_t sub_245102BEC@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_245102AE8(a1, a2);
}

unint64_t sub_245102C10()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25744C0E8;
  if (!qword_25744C0E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_25744C0E0);
    result = MEMORY[0x24952EE3C](MEMORY[0x24BEE12E0], v1);
    atomic_store(result, (unint64_t *)&qword_25744C0E8);
  }
  return result;
}

uint64_t sub_245102C5C(uint64_t *a1)
{
  uint64_t v1;

  return sub_2450EBC00(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_245102C74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a1;
  *(_QWORD *)(v9 + 24) = a2;
  swift_retain();
  sub_2450FFEB4(a6, sub_2450EB24C, v9);
  return swift_release();
}

uint64_t sub_245102CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return sub_245102C74(a1, a2, a3, a4, *(_QWORD *)(v4 + 16), *(_QWORD *)(v4 + 24));
}

uint64_t sub_245102CF0()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245102D2C(uint64_t a1)
{
  uint64_t v1;

  return sub_2451013AC(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(void (**)(char *))(v1 + 40), *(_QWORD *)(v1 + 48));
}

uint64_t sub_245102D40(uint64_t a1)
{
  uint64_t v1;

  return sub_245100380(a1, *(_QWORD *)(v1 + 16), *(_QWORD **)(v1 + 24), *(void (**)(_QWORD))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t sub_245102D60(void *a1)
{
  uint64_t v1;

  return sub_2451008FC(a1, *(_QWORD *)(v1 + 16), *(void (**)(_QWORD))(v1 + 24), *(_QWORD *)(v1 + 32));
}

uint64_t sub_245102D6C()
{
  swift_release();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_245102D98(unint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_2451002C0(a1, a2, *(void (**)(char *))(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32));
}

uint64_t sub_245102DA4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t objectdestroy_14Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245102E18(uint64_t a1)
{
  uint64_t v1;

  return sub_2450FF104(a1, *(_QWORD *)(v1 + 16), *(_QWORD **)(v1 + 24), *(void (**)(unint64_t))(v1 + 32), *(_QWORD *)(v1 + 40));
}

uint64_t objectdestroy_17Tm()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_245102E64(void *a1)
{
  uint64_t v1;

  return sub_2450FFC3C(a1, *(_QWORD *)(v1 + 16), *(uint64_t (**)(_QWORD))(v1 + 24));
}

unint64_t sub_245102E70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_25744C100;
  if (!qword_25744C100)
  {
    v1 = sub_2451036C4();
    result = MEMORY[0x24952EE3C](MEMORY[0x24BE7D550], v1);
    atomic_store(result, (unint64_t *)&qword_25744C100);
  }
  return result;
}

uint64_t sub_245102EB8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_245103DFC();
  __break(1u);
  return result;
}

uint64_t sub_245102FA8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t (*a5)(_QWORD))
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t result;

  v5 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v5 & 0x8000000000000000) == 0)
  {
    v9 = *(_QWORD *)(a5(0) - 8);
    v10 = *(unsigned __int8 *)(v9 + 80);
    v11 = *(_QWORD *)(v9 + 72);
    v12 = a4 + ((v10 + 32) & ~v10) + v11 * a1;
    v13 = v11 * v5;
    v14 = a3 + v13;
    v15 = v12 + v13;
    if (v12 >= v14 || v15 <= a3)
    {
      swift_arrayInitWithCopy();
      return v14;
    }
  }
  result = sub_245103DFC();
  __break(1u);
  return result;
}

uint64_t sub_2451030C0(unint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;
  id v7;
  id v8;
  uint64_t v10;

  v10 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_16;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x24952E92C](v3, a1);
LABEL_9:
        v5 = v4;
        v6 = v3 + 1;
        if (__OFADD__(v3, 1))
          goto LABEL_15;
        sub_2450D8184(0, &qword_25744C108);
        v7 = objc_msgSend(v5, sel_list);
        v8 = objc_msgSend(v7, sel_objectID);

        LOBYTE(v7) = sub_245103BF8();
        if ((v7 & 1) != 0)
        {
          sub_245103D0C();
          sub_245103D30();
          sub_245103D3C();
          sub_245103D18();
        }
        else
        {

        }
        ++v3;
        if (v6 == v2)
          return v10;
      }
      if (v3 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      v2 = sub_245103DE4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_245103264@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  return sub_245102AE8(a1, a2);
}

uint64_t sub_245103288()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2451032AC(void (*a1)(char *), uint64_t a2)
{
  uint64_t v2;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = *(uint64_t **)(v2 + 16);
  v6 = *(_QWORD *)(v2 + 24);
  v7 = *v5;
  swift_retain();
  sub_2450EACA0(v6, v7, a1, a2);
  return swift_release();
}

uint64_t sub_245103304(uint64_t *a1)
{
  return sub_245102C5C(a1);
}

uint64_t sub_24510331C()
{
  return MEMORY[0x24BE7E338]();
}

uint64_t sub_245103328()
{
  return MEMORY[0x24BE7E350]();
}

uint64_t sub_245103334()
{
  return MEMORY[0x24BDCBCA0]();
}

uint64_t sub_245103340()
{
  return MEMORY[0x24BDCBCC0]();
}

uint64_t sub_24510334C()
{
  return MEMORY[0x24BDCBD08]();
}

uint64_t sub_245103358()
{
  return MEMORY[0x24BDCBD10]();
}

uint64_t sub_245103364()
{
  return MEMORY[0x24BDCBD68]();
}

uint64_t sub_245103370()
{
  return MEMORY[0x24BDCBD78]();
}

uint64_t sub_24510337C()
{
  return MEMORY[0x24BDCBDB0]();
}

uint64_t sub_245103388()
{
  return MEMORY[0x24BDCBDE0]();
}

uint64_t sub_245103394()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_2451033A0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_2451033AC()
{
  return MEMORY[0x24BDCD820]();
}

uint64_t sub_2451033B8()
{
  return MEMORY[0x24BDCD9C0]();
}

uint64_t sub_2451033C4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_2451033D0()
{
  return MEMORY[0x24BDCE2D8]();
}

uint64_t sub_2451033DC()
{
  return MEMORY[0x24BDCE2F8]();
}

uint64_t sub_2451033E8()
{
  return MEMORY[0x24BDCE468]();
}

uint64_t sub_2451033F4()
{
  return MEMORY[0x24BDCE5D8]();
}

uint64_t sub_245103400()
{
  return MEMORY[0x24BDCE5F0]();
}

uint64_t sub_24510340C()
{
  return MEMORY[0x24BDCE628]();
}

uint64_t sub_245103418()
{
  return MEMORY[0x24BDCE878]();
}

uint64_t sub_245103424()
{
  return MEMORY[0x24BDCE8F8]();
}

uint64_t sub_245103430()
{
  return MEMORY[0x24BDCE900]();
}

uint64_t sub_24510343C()
{
  return MEMORY[0x24BDCE998]();
}

uint64_t sub_245103448()
{
  return MEMORY[0x24BDCE9D0]();
}

uint64_t sub_245103454()
{
  return MEMORY[0x24BDCE9F8]();
}

uint64_t sub_245103460()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24510346C()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_245103478()
{
  return MEMORY[0x24BDCEFC8]();
}

uint64_t sub_245103484()
{
  return MEMORY[0x24BE7E358]();
}

uint64_t sub_245103490()
{
  return MEMORY[0x24BDCF0C0]();
}

uint64_t sub_24510349C()
{
  return MEMORY[0x24BDCF160]();
}

uint64_t sub_2451034A8()
{
  return MEMORY[0x24BDCF290]();
}

uint64_t sub_2451034B4()
{
  return MEMORY[0x24BDCF2D8]();
}

uint64_t sub_2451034C0()
{
  return MEMORY[0x24BDCF4D8]();
}

uint64_t sub_2451034CC()
{
  return MEMORY[0x24BDCF500]();
}

uint64_t sub_2451034D8()
{
  return MEMORY[0x24BDCF510]();
}

uint64_t sub_2451034E4()
{
  return MEMORY[0x24BE7E3C0]();
}

uint64_t sub_2451034F0()
{
  return MEMORY[0x24BE7E3C8]();
}

uint64_t sub_2451034FC()
{
  return MEMORY[0x24BE7E3F8]();
}

uint64_t sub_245103508()
{
  return MEMORY[0x24BE7E420]();
}

uint64_t sub_245103514()
{
  return MEMORY[0x24BE7E4B0]();
}

uint64_t sub_245103520()
{
  return MEMORY[0x24BE7E4B8]();
}

uint64_t sub_24510352C()
{
  return MEMORY[0x24BE7E4E8]();
}

uint64_t sub_245103538()
{
  return MEMORY[0x24BE7E500]();
}

uint64_t sub_245103544()
{
  return MEMORY[0x24BE7E510]();
}

uint64_t sub_245103550()
{
  return MEMORY[0x24BE7E578]();
}

uint64_t sub_24510355C()
{
  return MEMORY[0x24BE7E588]();
}

uint64_t sub_245103568()
{
  return MEMORY[0x24BE7E590]();
}

uint64_t sub_245103574()
{
  return MEMORY[0x24BE7E598]();
}

uint64_t sub_245103580()
{
  return MEMORY[0x24BE7E5A0]();
}

uint64_t sub_24510358C()
{
  return MEMORY[0x24BE7E5A8]();
}

uint64_t sub_245103598()
{
  return MEMORY[0x24BE7E5B0]();
}

uint64_t sub_2451035A4()
{
  return MEMORY[0x24BE7E5B8]();
}

uint64_t sub_2451035B0()
{
  return MEMORY[0x24BE7E5C0]();
}

uint64_t sub_2451035BC()
{
  return MEMORY[0x24BE7E5D8]();
}

uint64_t sub_2451035C8()
{
  return MEMORY[0x24BE7E5E0]();
}

uint64_t sub_2451035D4()
{
  return MEMORY[0x24BE7E5F0]();
}

uint64_t sub_2451035E0()
{
  return MEMORY[0x24BE7E610]();
}

uint64_t sub_2451035EC()
{
  return MEMORY[0x24BE7E640]();
}

uint64_t sub_2451035F8()
{
  return MEMORY[0x24BE7E660]();
}

uint64_t sub_245103604()
{
  return MEMORY[0x24BE7E6C8]();
}

uint64_t sub_245103610()
{
  return MEMORY[0x24BE7E6D8]();
}

uint64_t sub_24510361C()
{
  return MEMORY[0x24BE7E6F0]();
}

uint64_t sub_245103628()
{
  return MEMORY[0x24BE7E6F8]();
}

uint64_t sub_245103634()
{
  return MEMORY[0x24BE7E728]();
}

uint64_t sub_245103640()
{
  return MEMORY[0x24BE7E730]();
}

uint64_t sub_24510364C()
{
  return MEMORY[0x24BE7E738]();
}

uint64_t sub_245103658()
{
  return MEMORY[0x24BE7E740]();
}

uint64_t sub_245103664()
{
  return MEMORY[0x24BE7E748]();
}

uint64_t sub_245103670()
{
  return MEMORY[0x24BE7E750]();
}

uint64_t sub_24510367C()
{
  return MEMORY[0x24BE7E800]();
}

uint64_t sub_245103688()
{
  return MEMORY[0x24BE7D418]();
}

uint64_t sub_245103694()
{
  return MEMORY[0x24BE7D420]();
}

uint64_t sub_2451036A0()
{
  return MEMORY[0x24BE7D430]();
}

uint64_t sub_2451036AC()
{
  return MEMORY[0x24BE7D480]();
}

uint64_t sub_2451036B8()
{
  return MEMORY[0x24BE7D538]();
}

uint64_t sub_2451036C4()
{
  return MEMORY[0x24BE7D540]();
}

uint64_t sub_2451036D0()
{
  return MEMORY[0x24BE7D560]();
}

uint64_t sub_2451036DC()
{
  return MEMORY[0x24BE7D570]();
}

uint64_t sub_2451036E8()
{
  return MEMORY[0x24BE7D5F0]();
}

uint64_t sub_2451036F4()
{
  return MEMORY[0x24BE7D600]();
}

uint64_t sub_245103700()
{
  return MEMORY[0x24BE7D610]();
}

uint64_t sub_24510370C()
{
  return MEMORY[0x24BE7D618]();
}

uint64_t sub_245103718()
{
  return MEMORY[0x24BE7D620]();
}

uint64_t sub_245103724()
{
  return MEMORY[0x24BE7D628]();
}

uint64_t sub_245103730()
{
  return MEMORY[0x24BE7D630]();
}

uint64_t sub_24510373C()
{
  return MEMORY[0x24BE7D638]();
}

uint64_t sub_245103748()
{
  return MEMORY[0x24BE7D648]();
}

uint64_t sub_245103754()
{
  return MEMORY[0x24BE7D650]();
}

uint64_t sub_245103760()
{
  return MEMORY[0x24BE7D658]();
}

uint64_t sub_24510376C()
{
  return MEMORY[0x24BE7D6A8]();
}

uint64_t sub_245103778()
{
  return MEMORY[0x24BE7D6B0]();
}

uint64_t sub_245103784()
{
  return MEMORY[0x24BE7D780]();
}

uint64_t sub_245103790()
{
  return MEMORY[0x24BE7D7E8]();
}

uint64_t sub_24510379C()
{
  return MEMORY[0x24BE7D7F8]();
}

uint64_t sub_2451037A8()
{
  return MEMORY[0x24BE7D808]();
}

uint64_t sub_2451037B4()
{
  return MEMORY[0x24BE7D870]();
}

uint64_t sub_2451037C0()
{
  return MEMORY[0x24BE7D878]();
}

uint64_t sub_2451037CC()
{
  return MEMORY[0x24BE7D888]();
}

uint64_t sub_2451037D8()
{
  return MEMORY[0x24BE7D8C8]();
}

uint64_t sub_2451037E4()
{
  return MEMORY[0x24BE7D8E8]();
}

uint64_t sub_2451037F0()
{
  return MEMORY[0x24BE7D910]();
}

uint64_t sub_2451037FC()
{
  return MEMORY[0x24BE7D918]();
}

uint64_t sub_245103808()
{
  return MEMORY[0x24BE7D920]();
}

uint64_t sub_245103814()
{
  return MEMORY[0x24BE7D928]();
}

uint64_t sub_245103820()
{
  return MEMORY[0x24BE7D930]();
}

uint64_t sub_24510382C()
{
  return MEMORY[0x24BE7D940]();
}

uint64_t sub_245103838()
{
  return MEMORY[0x24BE7D948]();
}

uint64_t sub_245103844()
{
  return MEMORY[0x24BE7D958]();
}

uint64_t sub_245103850()
{
  return MEMORY[0x24BE7D960]();
}

uint64_t sub_24510385C()
{
  return MEMORY[0x24BE7D968]();
}

uint64_t sub_245103868()
{
  return MEMORY[0x24BE7DD78]();
}

uint64_t sub_245103874()
{
  return MEMORY[0x24BE7DD88]();
}

uint64_t sub_245103880()
{
  return MEMORY[0x24BE7DD98]();
}

uint64_t sub_24510388C()
{
  return MEMORY[0x24BE7DDA0]();
}

uint64_t sub_245103898()
{
  return MEMORY[0x24BE7DE80]();
}

uint64_t sub_2451038A4()
{
  return MEMORY[0x24BE7DE88]();
}

uint64_t sub_2451038B0()
{
  return MEMORY[0x24BE7DE90]();
}

uint64_t sub_2451038BC()
{
  return MEMORY[0x24BE7DE98]();
}

uint64_t sub_2451038C8()
{
  return MEMORY[0x24BE7DEA0]();
}

uint64_t sub_2451038D4()
{
  return MEMORY[0x24BE7DEA8]();
}

uint64_t sub_2451038E0()
{
  return MEMORY[0x24BE7DEB0]();
}

uint64_t sub_2451038EC()
{
  return MEMORY[0x24BE7DEB8]();
}

uint64_t sub_2451038F8()
{
  return MEMORY[0x24BE7DEC8]();
}

uint64_t sub_245103904()
{
  return MEMORY[0x24BE7DED8]();
}

uint64_t sub_245103910()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24510391C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_245103928()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_245103934()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_245103940()
{
  return MEMORY[0x24BEE0270]();
}

uint64_t sub_24510394C()
{
  return MEMORY[0x24BEE0350]();
}

uint64_t sub_245103958()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_245103964()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_245103970()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_24510397C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_245103988()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_245103994()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_2451039A0()
{
  return MEMORY[0x24BE7E910]();
}

uint64_t sub_2451039AC()
{
  return MEMORY[0x24BE7E918]();
}

uint64_t sub_2451039B8()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_2451039C4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_2451039D0()
{
  return MEMORY[0x24BE7DEF0]();
}

uint64_t sub_2451039DC()
{
  return MEMORY[0x24BEE1110]();
}

uint64_t sub_2451039E8()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_2451039F4()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_245103A00()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_245103A0C()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_245103A18()
{
  return MEMORY[0x24BEE1160]();
}

uint64_t sub_245103A24()
{
  return MEMORY[0x24BEE11B8]();
}

uint64_t sub_245103A30()
{
  return MEMORY[0x24BEE15D8]();
}

uint64_t sub_245103A3C()
{
  return MEMORY[0x24BE7E928]();
}

uint64_t sub_245103A48()
{
  return MEMORY[0x24BE7E930]();
}

uint64_t sub_245103A54()
{
  return MEMORY[0x24BE7E938]();
}

uint64_t sub_245103A60()
{
  return MEMORY[0x24BE7E940]();
}

uint64_t sub_245103A6C()
{
  return MEMORY[0x24BE7E948]();
}

uint64_t sub_245103A78()
{
  return MEMORY[0x24BE7E950]();
}

uint64_t sub_245103A84()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_245103A90()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_245103A9C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_245103AA8()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_245103AB4()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_245103AC0()
{
  return MEMORY[0x24BE7E988]();
}

uint64_t sub_245103ACC()
{
  return MEMORY[0x24BE7E998]();
}

uint64_t sub_245103AD8()
{
  return MEMORY[0x24BE7E9B0]();
}

uint64_t sub_245103AE4()
{
  return MEMORY[0x24BE7E9B8]();
}

uint64_t sub_245103AF0()
{
  return MEMORY[0x24BE7E9C0]();
}

uint64_t sub_245103AFC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_245103B08()
{
  return MEMORY[0x24BE7E9E0]();
}

uint64_t sub_245103B14()
{
  return MEMORY[0x24BE7EA10]();
}

uint64_t sub_245103B20()
{
  return MEMORY[0x24BE7EA18]();
}

uint64_t sub_245103B2C()
{
  return MEMORY[0x24BE7EA28]();
}

uint64_t sub_245103B38()
{
  return MEMORY[0x24BE7EA48]();
}

uint64_t sub_245103B44()
{
  return MEMORY[0x24BE7DF98]();
}

uint64_t sub_245103B50()
{
  return MEMORY[0x24BE7EA60]();
}

uint64_t sub_245103B5C()
{
  return MEMORY[0x24BE7EA68]();
}

uint64_t sub_245103B68()
{
  return MEMORY[0x24BE7EA70]();
}

uint64_t sub_245103B74()
{
  return MEMORY[0x24BE7EA78]();
}

uint64_t sub_245103B80()
{
  return MEMORY[0x24BE7EA80]();
}

uint64_t sub_245103B8C()
{
  return MEMORY[0x24BE7EA88]();
}

uint64_t sub_245103B98()
{
  return MEMORY[0x24BE7EA90]();
}

uint64_t sub_245103BA4()
{
  return MEMORY[0x24BE7EA98]();
}

uint64_t sub_245103BB0()
{
  return MEMORY[0x24BE7EAA0]();
}

uint64_t sub_245103BBC()
{
  return MEMORY[0x24BE7EAB0]();
}

uint64_t sub_245103BC8()
{
  return MEMORY[0x24BE7EAC0]();
}

uint64_t sub_245103BD4()
{
  return MEMORY[0x24BE7EAC8]();
}

uint64_t sub_245103BE0()
{
  return MEMORY[0x24BE7EAD0]();
}

uint64_t sub_245103BEC()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_245103BF8()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_245103C04()
{
  return MEMORY[0x24BE7EAD8]();
}

uint64_t sub_245103C10()
{
  return MEMORY[0x24BE7DFB8]();
}

uint64_t sub_245103C1C()
{
  return MEMORY[0x24BE7DFC8]();
}

uint64_t sub_245103C28()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_245103C34()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_245103C40()
{
  return MEMORY[0x24BDD0580]();
}

uint64_t sub_245103C4C()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_245103C58()
{
  return MEMORY[0x24BEE22D8]();
}

uint64_t sub_245103C64()
{
  return MEMORY[0x24BEE22E0]();
}

uint64_t sub_245103C70()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_245103C7C()
{
  return MEMORY[0x24BEE2330]();
}

uint64_t sub_245103C88()
{
  return MEMORY[0x24BEE2340]();
}

uint64_t sub_245103C94()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_245103CA0()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_245103CAC()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_245103CB8()
{
  return MEMORY[0x24BEE24C8]();
}

uint64_t sub_245103CC4()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_245103CD0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_245103CDC()
{
  return MEMORY[0x24BEE25B8]();
}

uint64_t sub_245103CE8()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_245103CF4()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_245103D00()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_245103D0C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_245103D18()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_245103D24()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_245103D30()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_245103D3C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_245103D48()
{
  return MEMORY[0x24BEE2EA0]();
}

uint64_t sub_245103D54()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_245103D60()
{
  return MEMORY[0x24BEE2EB8]();
}

uint64_t sub_245103D6C()
{
  return MEMORY[0x24BEE2EC0]();
}

uint64_t sub_245103D78()
{
  return MEMORY[0x24BEE2ED0]();
}

uint64_t sub_245103D84()
{
  return MEMORY[0x24BEE2ED8]();
}

uint64_t sub_245103D90()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_245103D9C()
{
  return MEMORY[0x24BEE2EE8]();
}

uint64_t sub_245103DA8()
{
  return MEMORY[0x24BEE2EF8]();
}

uint64_t sub_245103DB4()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_245103DC0()
{
  return MEMORY[0x24BEE2F20]();
}

uint64_t sub_245103DCC()
{
  return MEMORY[0x24BEE2F38]();
}

uint64_t sub_245103DD8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_245103DE4()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_245103DF0()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_245103DFC()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_245103E08()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_245103E14()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_245103E20()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_245103E2C()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_245103E38()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_245103E44()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_245103E50()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_245103E5C()
{
  return MEMORY[0x24BE7DFD8]();
}

uint64_t sub_245103E68()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_245103E74()
{
  return MEMORY[0x24BEE4328]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t rdi_os_crash()
{
  return MEMORY[0x24BE7DFE0]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x24BEE4C40]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
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

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
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

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

