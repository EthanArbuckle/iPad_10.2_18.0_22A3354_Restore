uint64_t sub_1000028C4(uint64_t a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  void (*v7)(char *, _UNKNOWN **, uint64_t, uint64_t);
  char *v8;
  char *v9;
  void (*v10)(void);
  id v11;
  _BYTE v13[24];

  v3 = &v1[qword_100026208];
  swift_beginAccess(&v1[qword_100026208], v13, 33, 0);
  sub_10000B53C(a1, (uint64_t)v3);
  swift_endAccess(v13);
  v4 = *(_QWORD *)v3;
  if (*(_QWORD *)v3)
  {
    v5 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType(v4);
    v7 = *(void (**)(char *, _UNKNOWN **, uint64_t, uint64_t))(v5 + 40);
    swift_unknownObjectRetain(v4);
    v8 = v1;
    v7(v1, &off_100020EC8, ObjectType, v5);
    v9 = &v8[*(_QWORD *)((swift_isaMask & *(_QWORD *)v8) + 0x68)];
    swift_beginAccess(v9, v13, 0, 0);
    if (*(_QWORD *)v9)
    {
      v10 = *(void (**)(void))(v5 + 64);
      v11 = *(id *)(*(_QWORD *)v9 + qword_100025710);
      v10();

    }
    swift_unknownObjectRelease(v4);
  }
  return sub_10000BA94(a1, &qword_100025A78);
}

uint64_t sub_1000029F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  Swift::String v20;
  unint64_t v21;
  unint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;

  v28 = a2;
  v6 = sub_100005DBC(&qword_100025A70);
  __chkstk_darwin(v6);
  v8 = (char *)&v27 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for UUID(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = &v3[qword_100026208];
  *(_OWORD *)v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  *((_OWORD *)v13 + 2) = 0u;
  v29 = 0;
  v30 = 0xE000000000000000;
  v14 = v3;
  _StringGuts.grow(_:)(31);
  v15 = swift_bridgeObjectRelease(v30);
  v29 = 0xD00000000000001DLL;
  v30 = 0x800000010001C2D0;
  v16 = UUID.init()(v15);
  v17 = UUID.uuidString.getter(v16);
  v19 = v18;
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v20._countAndFlagsBits = v17;
  v20._object = v19;
  String.append(_:)(v20);
  swift_bridgeObjectRelease(v19);
  v21 = v29;
  v22 = v30;
  v23 = &v14[qword_100026200];
  v24 = v28;
  *(_QWORD *)v23 = a1;
  *((_QWORD *)v23 + 1) = v24;

  sub_10000BAD0(a3, (uint64_t)v8, &qword_100025A70);
  v25 = TTRITableCellContent.init(state:prototypeCellView:reuseIdentifier:)(v8, 0, v21, v22);
  sub_10000BA94(a3, &qword_100025A70);
  return v25;
}

uint64_t sub_100002BAC()
{
  return 3;
}

id sub_100002BB4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + qword_100025710), "setDelegate:", 0);
}

uint64_t sub_100002BD0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  NSString v4;
  uint64_t *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  void (*v10)(_QWORD *, uint64_t, uint64_t);
  _BYTE v11[24];

  v2 = v1;
  v3 = *(_QWORD **)(a1 + qword_100025710);
  v4 = String._bridgeToObjectiveC()();
  objc_msgSend(v3, "setAccessibilityIdentifier:", v4);

  (*(void (**)(uint64_t, _QWORD))((swift_isaMask & *v3) + 0x70))(8, 0);
  v5 = (uint64_t *)(v2 + qword_100026208);
  result = swift_beginAccess(v2 + qword_100026208, v11, 0, 0);
  v7 = *v5;
  if (*v5)
  {
    v8 = v5[1];
    ObjectType = swift_getObjectType(v7);
    v10 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v8 + 64);
    swift_unknownObjectRetain(v7);
    v10(v3, ObjectType, v8);
    return swift_unknownObjectRelease(v7);
  }
  return result;
}

uint64_t sub_100002CC4(_BYTE *a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  int *ReminderNotesCellContentState;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned int (*v19)(char *, uint64_t, int *);
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t ObjectType;
  void (*v29)(char *, uint64_t, uint64_t);
  uint64_t ReminderNotesCellContent;
  _BYTE *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  _BYTE *v49;
  _QWORD *v50;
  _QWORD aBlock[5];
  uint64_t v52;
  char v53[24];
  char v54[24];

  v49 = a1;
  type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  ((void (*)(void))__chkstk_darwin)();
  v46 = (uint64_t)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005DBC(&qword_100025918);
  ((void (*)(void))__chkstk_darwin)();
  v48 = (uint64_t)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for TTRRemindersListViewModel.Item(0);
  ((void (*)(void))__chkstk_darwin)();
  v5 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  ReminderNotesCellContentState = (int *)type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState(0);
  v7 = *((_QWORD *)ReminderNotesCellContentState - 1);
  ((void (*)(void))__chkstk_darwin)();
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005DBC(&qword_100025A70);
  ((void (*)(void))__chkstk_darwin)();
  v11 = (char *)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005DBC(&qword_100025AF8);
  v12 = ((uint64_t (*)(void))__chkstk_darwin)();
  v14 = (char *)&v45 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v16 = (char *)&v45 - v15;
  v17 = *(_QWORD *)((swift_isaMask & *v1) + 0x78);
  v50 = v1;
  v18 = (uint64_t)v1 + v17;
  swift_beginAccess((char *)v1 + v17, v54, 0, 0);
  sub_10000BAD0(v18, (uint64_t)v11, &qword_100025A70);
  v19 = *(unsigned int (**)(char *, uint64_t, int *))(v7 + 48);
  if (v19(v11, 1, ReminderNotesCellContentState) == 1)
  {
    v20 = type metadata accessor for TTRIReminderCellNotesViewModel(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v16, 1, 1, v20);
  }
  else
  {
    sub_10000B584((uint64_t)v11, (uint64_t)v9, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState);
    sub_10000B5C8((uint64_t)v9, (uint64_t)v5, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
    v21 = *(void **)&v9[ReminderNotesCellContentState[5]];
    v22 = *(_QWORD *)&v9[ReminderNotesCellContentState[7]];
    TTRIReminderCellNotesViewModel.init(item:allowsEditing:notes:baseTextStyles:inlineHashtagVisibility:supportsStyling:)(v5, 1, v21, 0, v22, v9[ReminderNotesCellContentState[6]]);
    swift_bridgeObjectRetain(v22);
    v23 = v21;
    sub_100008650((uint64_t)v9, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState);
    v24 = type metadata accessor for TTRIReminderCellNotesViewModel(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v16, 0, 1, v24);
  }
  v25 = (_QWORD *)((char *)v50 + qword_100026208);
  swift_beginAccess((char *)v50 + qword_100026208, v53, 0, 0);
  v26 = *v25;
  v47 = v16;
  if (v26)
  {
    v27 = v25[1];
    ObjectType = swift_getObjectType(v26);
    sub_10000BAD0((uint64_t)v16, (uint64_t)v14, &qword_100025AF8);
    v29 = *(void (**)(char *, uint64_t, uint64_t))(v27 + 16);
    swift_unknownObjectRetain(v26);
    v29(v14, ObjectType, v27);
    swift_unknownObjectRelease(v26);
  }
  if (v19((char *)v18, 1, ReminderNotesCellContentState))
  {
    ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ReminderNotesCellContent - 8) + 56))(v48, 1, 1, ReminderNotesCellContent);
    v31 = v49;
  }
  else
  {
    v32 = v48;
    sub_10000BAD0(v18 + ReminderNotesCellContentState[8], v48, &qword_100025918);
    v33 = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
    v34 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 48))(v32, 1, v33);
    v31 = v49;
    if (v34 != 1)
    {
      if (swift_getEnumCaseMultiPayload(v32, v33) == 1)
      {
        v42 = v32;
        v43 = v46;
        sub_10000B584(v42, v46, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
        sub_1000033B4(v43);
        sub_100008650(v43, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
      }
      else
      {
        v44 = *(void **)v32;
        sub_100003248(*(void **)v32, *(_BYTE *)(v32 + 8));

      }
LABEL_12:
      sub_100003578();
      return sub_10000BA94((uint64_t)v47, &qword_100025AF8);
    }
  }
  if (v31[qword_100025730 + 8] == 2 && !*(_QWORD *)&v31[qword_100025730])
    goto LABEL_12;
  v35 = *(void **)&v31[direct field offset for TTRIStaticTableViewBaseCell.containerView];
  v36 = swift_allocObject(&unk_100020EF0, 24, 7);
  *(_QWORD *)(v36 + 16) = v31;
  v37 = swift_allocObject(&unk_100020F18, 32, 7);
  *(_QWORD *)(v37 + 16) = sub_10000BA24;
  *(_QWORD *)(v37 + 24) = v36;
  aBlock[4] = sub_10000BA74;
  v52 = v37;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000178F4;
  aBlock[3] = &unk_100020F30;
  v38 = _Block_copy(aBlock);
  v39 = v52;
  v40 = v31;
  swift_retain(v37);
  swift_release(v39);
  objc_msgSend(v35, "performBatchUpdates:", v38);
  _Block_release(v38);
  LOBYTE(v38) = swift_isEscapingClosureAtFileLocation(v37, "", 174, 166, 43, 1);
  swift_release(v36);
  result = swift_release(v37);
  if ((v38 & 1) == 0)
    goto LABEL_12;
  __break(1u);
  return result;
}

uint64_t sub_100003248(void *a1, char a2)
{
  char *v2;
  char *v3;
  uint64_t ObjectType;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t result;
  _QWORD v15[5];
  uint64_t v16;

  v3 = v2;
  ObjectType = swift_getObjectType(v3);
  v7 = *(void **)&v3[direct field offset for TTRIStaticTableViewBaseCell.containerView];
  v8 = swift_allocObject(&unk_100020F68, 48, 7);
  *(_QWORD *)(v8 + 16) = v3;
  *(_QWORD *)(v8 + 24) = a1;
  *(_BYTE *)(v8 + 32) = a2 & 1;
  *(_QWORD *)(v8 + 40) = ObjectType;
  v9 = swift_allocObject(&unk_100020F90, 32, 7);
  *(_QWORD *)(v9 + 16) = sub_10000BB44;
  *(_QWORD *)(v9 + 24) = v8;
  v15[4] = sub_10000BD64;
  v16 = v9;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_1000178F4;
  v15[3] = &unk_100020FA8;
  v10 = _Block_copy(v15);
  v11 = v16;
  v12 = v3;
  v13 = a1;
  swift_retain(v9);
  swift_release(v11);
  objc_msgSend(v7, "performBatchUpdates:", v10);
  _Block_release(v10);
  LOBYTE(v7) = swift_isEscapingClosureAtFileLocation(v9, "", 174, 173, 43, 1);
  swift_release(v8);
  result = swift_release(v9);
  if ((v7 & 1) != 0)
    __break(1u);
  return result;
}

uint64_t sub_1000033B4(uint64_t a1)
{
  char *v1;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  char *v15;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD aBlock[5];
  uint64_t v19;

  ObjectType = swift_getObjectType(v1);
  v4 = *(_QWORD *)(type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0) - 8);
  v5 = *(_QWORD *)(v4 + 64);
  __chkstk_darwin();
  v6 = (char *)aBlock - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void **)&v1[direct field offset for TTRIStaticTableViewBaseCell.containerView];
  sub_10000B5C8(a1, (uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
  v8 = *(unsigned __int8 *)(v4 + 80);
  v9 = (v8 + 24) & ~v8;
  v10 = (v5 + v9 + 7) & 0xFFFFFFFFFFFFFFF8;
  v11 = swift_allocObject(&unk_100020FE0, v10 + 8, v8 | 7);
  *(_QWORD *)(v11 + 16) = v1;
  sub_10000B584((uint64_t)v6, v11 + v9, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
  *(_QWORD *)(v11 + v10) = ObjectType;
  v12 = swift_allocObject(&unk_100021008, 32, 7);
  *(_QWORD *)(v12 + 16) = sub_10000BC10;
  *(_QWORD *)(v12 + 24) = v11;
  aBlock[4] = sub_10000BD64;
  v19 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000178F4;
  aBlock[3] = &unk_100021020;
  v13 = _Block_copy(aBlock);
  v14 = v19;
  v15 = v1;
  swift_retain(v12);
  swift_release(v14);
  objc_msgSend(v7, "performBatchUpdates:", v13);
  _Block_release(v13);
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v12, "", 174, 202, 43, 1);
  swift_release(v11);
  result = swift_release(v12);
  if ((isEscapingClosureAtFileLocation & 1) != 0)
    __break(1u);
  return result;
}

id sub_100003578()
{
  _QWORD *v0;
  uint64_t *v1;
  id result;
  void *v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  _BOOL8 v9;
  uint64_t v10;
  _BYTE v11[24];

  v1 = (_QWORD *)((char *)v0 + *(_QWORD *)((swift_isaMask & *v0) + 0x68));
  result = (id)swift_beginAccess(v1, v11, 0, 0);
  if (*v1)
  {
    result = objc_msgSend(*(id *)(*v1 + qword_100025710), "attributedText");
    if (!result)
    {
      v9 = 0;
      v10 = *v1;
      if (!*v1)
        return result;
      return objc_msgSend(*(id *)(v10 + qword_100025718), "setHidden:", v9);
    }
    v3 = result;
    v4 = objc_msgSend(result, "string");

    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v7 = v6;

    result = (id)swift_bridgeObjectRelease(v7);
    v8 = HIBYTE(v7) & 0xF;
    if ((v7 & 0x2000000000000000) == 0)
      v8 = v5 & 0xFFFFFFFFFFFFLL;
    v9 = v8 != 0;
    v10 = *v1;
    if (*v1)
      return objc_msgSend(*(id *)(v10 + qword_100025718), "setHidden:", v9);
  }
  return result;
}

void sub_100003680()
{
  _swift_stdlib_reportUnimplementedInitializer("RemindersSharingExtension.TTRIExtensionCreateReminderNotesCellContent", 69, "init(state:prototypeCellView:reuseIdentifier:)", 46, 0);
  __break(1u);
}

uint64_t sub_1000036AC()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + qword_100026200 + 8));
  return sub_10000BA94(v0 + qword_100026208, &qword_100025A78);
}

uint64_t sub_1000036EC(uint64_t a1)
{
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + qword_100026200 + 8));
  return sub_10000BA94(a1 + qword_100026208, &qword_100025A78);
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderNotesCellContent(uint64_t a1)
{
  return sub_10000A1D4(a1, qword_1000255D0, (uint64_t)&nominal type descriptor for TTRIExtensionCreateReminderNotesCellContent);
}

uint64_t sub_100003748(uint64_t a1)
{
  _QWORD v2[2];

  v2[0] = &unk_10001B710;
  v2[1] = &unk_10001B728;
  return swift_initClassMetadata2(a1, 256, 2, v2, a1 + 232);
}

uint64_t sub_100003790()
{
  return type metadata accessor for TTRIExtensionCreateReminderNotesCellContent(0);
}

void *sub_100003798()
{
  _QWORD *v0;
  void **v1;
  void *v2;
  uint64_t ObjectType;
  void *v4;
  id v5;
  char v7[24];

  v1 = (void **)((char *)v0 + *(_QWORD *)((swift_isaMask & *v0) + 0x68));
  swift_beginAccess(v1, v7, 0, 0);
  v2 = *v1;
  if (!v2)
    return 0;
  ObjectType = swift_getObjectType(v2);
  if (swift_conformsToProtocol2(ObjectType, &protocol descriptor for TTRIShowRemindersEditableReminderCell))
    v4 = v2;
  else
    v4 = 0;
  if (v4)
    v5 = v2;
  return v4;
}

id sub_100003834(uint64_t a1, uint64_t a2, unsigned __int8 a3)
{
  return sub_10000B308(a3);
}

void sub_10000383C()
{
  char *v0;
  char *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  Class v8;
  Class isa;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  Class v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  Class v24;
  uint64_t v25;
  uint64_t v26;

  v1 = v0;
  v2 = *(void **)&v0[qword_100025730];
  if (v0[qword_100025730 + 8])
  {
    if (v0[qword_100025730 + 8] == 1)
    {
      v3 = *(void **)&v0[direct field offset for TTRIStaticTableViewBaseCell.containerView];
      v4 = v2;
      objc_msgSend(v3, "setAxis:", 1);
      objc_msgSend(v3, "setSpacing:", 8.0);
      v5 = *(void **)&v1[qword_100025728];
      objc_msgSend(v5, "setHidden:", 0);
      v6 = sub_100005DBC(&qword_100025AB8);
      v7 = swift_allocObject(v6, 40, 7);
      *(_OWORD *)(v7 + 16) = xmmword_10001B4B0;
      *(_QWORD *)(v7 + 32) = v4;
      v25 = v7;
      specialized Array._endMutation()();
      sub_10000B938(0, &qword_100025AC0, UIView_ptr);
      v8 = (Class)v4;
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v25);
      objc_msgSend(v5, "setArrangedSubviews:", isa);

      objc_msgSend(v5, "setLayoutMargins:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
      objc_msgSend(v5, "setVerticalAlignment:", 0);
      objc_msgSend(v5, "setHorizontalAlignment:", 1);
    }
    else
    {
      objc_msgSend(*(id *)&v0[direct field offset for TTRIStaticTableViewBaseCell.containerView], "setAxis:", 0);
      v5 = *(void **)&v0[qword_100025728];
      objc_msgSend(v5, "setHidden:", 1);
      sub_10000B938(0, &qword_100025AC0, UIView_ptr);
      v8 = Array._bridgeToObjectiveC()().super.isa;
      objc_msgSend(v5, "setArrangedSubviews:", v8);
    }
  }
  else
  {
    v10 = *(void **)&v0[direct field offset for TTRIStaticTableViewBaseCell.containerView];
    v11 = v2;
    objc_msgSend(v10, "setAxis:", 0);
    objc_msgSend(v10, "setSpacing:", 12.0);
    v5 = *(void **)&v1[qword_100025728];
    objc_msgSend(v5, "setHidden:", 0);
    v12 = sub_100005DBC(&qword_100025AB8);
    v13 = swift_allocObject(v12, 40, 7);
    *(_OWORD *)(v13 + 16) = xmmword_10001B4B0;
    *(_QWORD *)(v13 + 32) = v11;
    v26 = v13;
    specialized Array._endMutation()();
    sub_10000B938(0, &qword_100025AC0, UIView_ptr);
    v8 = (Class)v11;
    v14 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v26);
    objc_msgSend(v5, "setArrangedSubviews:", v14);

    objc_msgSend(v5, "setLayoutMargins:", 15.0, 0.0, 0.0, 0.0);
    objc_msgSend(v5, "setVerticalAlignment:", 1);
    objc_msgSend(v5, "setHorizontalAlignment:", 0);
  }

  v15 = sub_100005DBC(&qword_100025AD8);
  v16 = swift_allocObject(v15, 96, 7);
  *(_OWORD *)(v16 + 16) = xmmword_10001B4C0;
  v17 = *(void **)&v1[qword_100025710];
  *(_QWORD *)(v16 + 56) = type metadata accessor for TTRIReminderTitleTextView(0);
  *(_QWORD *)(v16 + 32) = v17;
  v18 = v17;
  if ((objc_msgSend(v5, "isHidden") & 1) != 0)
  {
    v19 = 0;
    v20 = 0;
    *(_QWORD *)(v16 + 72) = 0;
    *(_QWORD *)(v16 + 80) = 0;
  }
  else
  {
    v20 = sub_10000B938(0, &qword_100025AE0, NUIContainerBoxView_ptr);
    v19 = v5;
  }
  *(_QWORD *)(v16 + 64) = v19;
  *(_QWORD *)(v16 + 88) = v20;
  v21 = sub_100005DBC(&qword_100025AE8);
  v22 = sub_10000B970();
  v23 = Sequence.removingNils<A>()(v21, (char *)&type metadata for Any + 8, v22);
  swift_bridgeObjectRelease(v16);
  v24 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v23);
  objc_msgSend(v1, "setAccessibilityElements:", v24);

}

void sub_100003C84(uint64_t a1, void *a2, char a3)
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  double v11;
  id v12;

  v5 = a1 + qword_100025730;
  if (*(_BYTE *)(a1 + qword_100025730 + 8))
  {
    v6 = objc_msgSend(objc_allocWithZone((Class)UIImageView), "init");
    objc_msgSend(v6, "setContentMode:", 2);
    objc_msgSend(v6, "setClipsToBounds:", 1);
    v7 = objc_msgSend(v6, "layer");
    objc_msgSend(v7, "setCornerCurve:", kCACornerCurveContinuous);

    v8 = *(id *)v5;
    *(_QWORD *)v5 = v6;
    *(_BYTE *)(v5 + 8) = 0;
    v12 = v6;

    sub_10000383C();
  }
  else
  {
    v12 = *(id *)v5;
  }
  v9 = a2;
  objc_msgSend(v12, "setImage:", a2);
  v10 = objc_msgSend(v12, "layer");
  v11 = 0.0;
  if ((a3 & 1) != 0)
  {
    if (qword_100025570 != -1)
      swift_once(&qword_100025570, sub_10000481C, 0.0);
    v11 = *(double *)&qword_100025578;
  }
  objc_msgSend(v10, "setCornerRadius:", v11);

}

void sub_100003E18(uint64_t a1, uint64_t a2)
{
  uint64_t ReminderView;
  uint64_t v5;
  void **v6;
  id *v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void (*v11)(void);
  id v12;
  uint64_t v13;

  ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  __chkstk_darwin();
  v6 = (void **)((char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = (id *)(a1 + qword_100025730);
  if (*(_BYTE *)(a1 + qword_100025730 + 8) == 1)
  {
    v8 = *v7;
    v9 = *v7;
    sub_10000B5C8(a2, (uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
    if (v8)
      goto LABEL_6;
  }
  else
  {
    sub_10000B5C8(a2, (uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
  }
  v9 = sub_10000B60C(v6, a1);
LABEL_6:
  sub_100008650((uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
  v10 = *(void **)(a2 + *(int *)(ReminderView + 24));
  if (v10)
  {
    v11 = *(void (**)(void))((swift_isaMask & *v9) + 0x68);
    v12 = v10;
    v11();

  }
}

char *sub_100003F34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  char *v4;
  id v5;
  char *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  double v13;
  id v14;
  void *v15;
  id v16;
  Swift::String v17;
  Swift::String v18;
  void *object;
  NSString v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  Class isa;
  id v27;
  id v28;
  Class v29;
  id v30;
  uint64_t v31;
  uint64_t inited;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  NSString v42;
  char *v43;
  void *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  Class v51;
  id v52;
  id v53;
  id v54;
  id v55;
  objc_class *ObjectType;
  objc_super v60;
  char v61[64];
  uint64_t v62;

  ObjectType = (objc_class *)swift_getObjectType(v3);
  v4 = &v3[qword_100025730];
  *(_QWORD *)v4 = 0;
  v4[8] = 2;
  *(_QWORD *)&v3[qword_100025738] = 0;
  v5 = objc_allocWithZone((Class)type metadata accessor for TTRIReminderTitleTextView(0));
  v6 = v3;
  v7 = (void *)TTRIReminderTitleTextView.init(isForUseInNUIContainerView:lineIndexWhereClippingBegins:hashtagTokenEditingBehavior:)(1, 0, 1, 0);
  objc_msgSend(v7, "setScrollEnabled:", 1);
  objc_msgSend(v7, "setShowsVerticalScrollIndicator:", 1);
  sub_10000B938(0, &qword_100025AB0, UIFont_ptr);
  v8 = v7;
  v9 = (void *)((uint64_t (*)(void))static UIFont.roundedBodyFont.getter)();
  objc_msgSend(v8, "setFont:", v9);

  objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);
  v10 = (void *)objc_opt_self(UIColor);
  v11 = v8;
  v12 = objc_msgSend(v10, "labelColor");
  objc_msgSend(v11, "setTextColor:", v12);

  objc_msgSend(v11, "setEditable:", 1);
  objc_msgSend(v11, "setBackgroundColor:", 0);
  LODWORD(v13) = 1132068864;
  objc_msgSend(v11, "setContentHuggingPriority:forAxis:", 0, v13);
  v14 = objc_msgSend(objc_allocWithZone((Class)UILabel), "init");
  v15 = (void *)static UIFont.roundedBodyFont.getter(objc_msgSend(v14, "setNumberOfLines:", 0));
  objc_msgSend(v14, "setFont:", v15);

  objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 1);
  objc_msgSend(v14, "setTextAlignment:", 4);
  objc_msgSend(v14, "setUserInteractionEnabled:", 0);
  v16 = objc_msgSend(v10, "placeholderTextColor");
  objc_msgSend(v14, "setTextColor:", v16);

  v17._object = (void *)0x800000010001C3E0;
  v18._countAndFlagsBits = 0x7365746F4ELL;
  v18._object = (void *)0xE500000000000000;
  v17._countAndFlagsBits = 0xD000000000000033;
  object = TTRLocalizedString(_:comment:)(v18, v17)._object;
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(object);
  objc_msgSend(v14, "setText:", v20);

  v21 = sub_100005DBC(&qword_100025AB8);
  v22 = swift_allocObject(v21, 48, 7);
  *(_OWORD *)(v22 + 16) = xmmword_10001B4D0;
  *(_QWORD *)(v22 + 32) = v11;
  *(_QWORD *)(v22 + 40) = v14;
  v62 = v22;
  specialized Array._endMutation()();
  v23 = objc_allocWithZone((Class)NUIContainerBoxView);
  sub_10000B938(0, &qword_100025AC0, UIView_ptr);
  v24 = v11;
  v25 = v14;
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v62);
  v27 = objc_msgSend(v23, "initWithArrangedSubviews:", isa);

  objc_msgSend(v27, "setHorizontalAlignment:", 0);
  objc_msgSend(v27, "setVerticalAlignment:", 0);
  objc_msgSend(v27, "setAlignment:forView:inAxis:", 1, v25, 1);
  v28 = objc_allocWithZone((Class)NUIContainerBoxView);
  v29 = Array._bridgeToObjectiveC()().super.isa;
  v30 = objc_msgSend(v28, "initWithArrangedSubviews:", v29);

  objc_msgSend(v30, "setLayoutMarginsRelativeArrangement:", 1);
  v31 = sub_100005DBC(&qword_100025AC8);
  inited = swift_initStackObject(v31, v61);
  *(_OWORD *)(inited + 16) = xmmword_10001B4C0;
  *(_QWORD *)(inited + 32) = v27;
  v33 = inited + 32;
  *(_DWORD *)(inited + 40) = 1132068864;
  *(_QWORD *)(inited + 48) = v30;
  *(_DWORD *)(inited + 56) = 1144750080;
  v34 = v27;
  v35 = v30;
  static UIView.setContentPriorities(_:for:)(inited, &off_100020CB0);
  swift_setDeallocating(inited);
  v36 = *(_QWORD *)(inited + 16);
  v37 = sub_100005DBC(&qword_100025AD0);
  swift_arrayDestroy(v33, v36, v37);
  objc_msgSend(v34, "setDebugBoundingBoxesEnabled:", 0);
  objc_msgSend(v35, "setDebugBoundingBoxesEnabled:", 0);
  *(_QWORD *)&v6[qword_100025710] = v24;
  *(_QWORD *)&v6[qword_100025718] = v25;
  *(_QWORD *)&v6[qword_100025720] = v34;
  *(_QWORD *)&v6[qword_100025728] = v35;
  v38 = v24;
  v39 = v25;
  v40 = v34;
  v41 = v35;

  if (a3)
  {
    v42 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a3);
  }
  else
  {
    v42 = 0;
  }
  v60.receiver = v6;
  v60.super_class = ObjectType;
  v43 = (char *)objc_msgSendSuper2(&v60, "initWithStyle:reuseIdentifier:", a1, v42);

  v44 = *(void **)&v43[direct field offset for TTRIStaticTableViewBaseCell.containerView];
  v45 = v43;
  objc_msgSend(v44, "setEdgesPreservingSuperviewLayoutMargins:", 10);
  objc_msgSend(v44, "layoutMargins");
  objc_msgSend(v44, "setLayoutMargins:", 12.0);
  v46 = swift_allocObject(v21, 48, 7);
  *(_OWORD *)(v46 + 16) = xmmword_10001B4D0;
  *(_QWORD *)(v46 + 32) = v40;
  *(_QWORD *)(v46 + 40) = v41;
  v62 = v46;
  specialized Array._endMutation()();
  v47 = v62;
  v48 = v40;
  v49 = v41;
  v50 = v44;
  v51 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v47);
  objc_msgSend(v50, "setArrangedSubviews:", v51);

  v52 = v48;
  v53 = sub_1000045F0();
  objc_msgSend(v52, "setDelegate:", v53);

  v54 = v49;
  v55 = sub_1000045F0();
  objc_msgSend(v54, "setDelegate:", v55);

  objc_msgSend(v45, "setIsAccessibilityElement:", 0);
  sub_10000383C();

  return v45;
}

id sub_1000045F0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  objc_class *v4;
  char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  objc_super v11;

  v1 = qword_100025738;
  v2 = *(void **)(v0 + qword_100025738);
  if (v2)
  {
    v3 = *(id *)(v0 + qword_100025738);
  }
  else
  {
    v4 = (objc_class *)type metadata accessor for CustomSizeMeasurer();
    v5 = (char *)objc_allocWithZone(v4);
    v6 = swift_unknownObjectWeakInit(&v5[OBJC_IVAR____TtC25RemindersSharingExtensionP33_8326BBA138680702F00C183C494E669A18CustomSizeMeasurer_hostCell], 0);
    swift_unknownObjectWeakAssign(v6, v0);
    v11.receiver = v5;
    v11.super_class = v4;
    v7 = objc_msgSendSuper2(&v11, "init");
    v8 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v7;
    v3 = v7;

    v2 = 0;
  }
  v9 = v2;
  return v3;
}

char *sub_100004694(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return sub_100003F34(a3, a4, v6);
}

void sub_1000046DC(char *a1, uint64_t a2, void *a3)
{
  char *v4;
  id v5;

  v4 = &a1[qword_100025730];
  *(_QWORD *)v4 = 0;
  v4[8] = 2;
  *(_QWORD *)&a1[qword_100025738] = 0;
  v5 = a3;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010001C3B0, "RemindersSharingExtension/TTRIExtensionCreateReminderNotesCellContent.swift", 75, 2, 292, 0);
  __break(1u);
}

void sub_100004768()
{
  objc_class *v0;
  char *v1;
  char *v2;

  v1 = (char *)objc_allocWithZone(v0);
  v2 = &v1[qword_100025730];
  *(_QWORD *)v2 = 0;
  v2[8] = 2;
  *(_QWORD *)&v1[qword_100025738] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000002FLL, 0x800000010001C380, "RemindersSharingExtension/TTRIExtensionCreateReminderNotesCellContent.swift", 75, 2, 296, 0);
  __break(1u);
}

void *sub_1000047F0()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + qword_100025710);
  v2 = v1;
  return v1;
}

void sub_10000481C()
{
  qword_100025578 = 0x4030000000000000;
}

void sub_10000482C()
{
  uint64_t v0;

}

void sub_100004898(uint64_t a1)
{

}

uint64_t type metadata accessor for TTRIExtensionCreateReminderNotesTableCell(uint64_t a1)
{
  return sub_10000A1D4(a1, qword_100025768, (uint64_t)&nominal type descriptor for TTRIExtensionCreateReminderNotesTableCell);
}

uint64_t sub_100004924(uint64_t a1)
{
  _QWORD v2[6];

  v2[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v2[1] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v2[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v2[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
  v2[4] = "\t";
  v2[5] = &unk_10001B788;
  return swift_initClassMetadata2(a1, 256, 6, v2, a1 + 160);
}

uint64_t sub_100004980()
{
  return type metadata accessor for TTRIExtensionCreateReminderNotesTableCell(0);
}

id sub_100004A30()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType(v0);
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for CustomSizeMeasurer()
{
  return objc_opt_self(_TtC25RemindersSharingExtensionP33_8326BBA138680702F00C183C494E669A18CustomSizeMeasurer);
}

uint64_t initializeBufferWithCopyOfBuffer for TTRIExtensionCreateReminderNotesTableCell.Layout(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v5 = v3;
  return a1;
}

void destroy for TTRIExtensionCreateReminderNotesTableCell.Layout(id *a1)
{

}

uint64_t assignWithCopy for TTRIExtensionCreateReminderNotesTableCell.Layout(uint64_t a1, uint64_t a2)
{
  void *v3;
  char v4;
  void *v5;
  id v6;

  v3 = *(void **)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v4;
  v6 = v3;

  return a1;
}

uint64_t initializeWithTake for TTRIExtensionCreateReminderViewModel.Image(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t assignWithTake for TTRIExtensionCreateReminderNotesTableCell.Layout(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIExtensionCreateReminderNotesTableCell.Layout(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TTRIExtensionCreateReminderNotesTableCell.Layout(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_100004BE4(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_100004C00(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for TTRIExtensionCreateReminderNotesTableCell.Layout()
{
  return &type metadata for TTRIExtensionCreateReminderNotesTableCell.Layout;
}

char *sub_100004C28(char *a1, char **a2, int *a3)
{
  int v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  void **v23;
  void **v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int (*v27)(void **, uint64_t, uint64_t);
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void **v32;
  void **v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int (*v36)(void **, uint64_t, uint64_t);
  char *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  void **v41;
  void **v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int (*v45)(void **, uint64_t, uint64_t);
  char *v46;
  uint64_t v47;
  char *v48;
  char *v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  char *v58;
  uint64_t v59;
  char *v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  void **v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  void **v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  id v76;
  void **v77;
  uint64_t v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  void (*v85)(char *, char *, uint64_t);
  uint64_t v86;
  char *v87;
  _QWORD *v88;
  uint64_t v89;
  void *v90;
  id v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  char *v101;
  char *v102;
  int *v103;
  uint64_t v104;
  char *v105;
  char *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  char *v130;
  char *v131;
  char *v132;
  char *v133;
  int *v134;
  uint64_t v135;
  char *v136;
  char *v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  int v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  id v164;
  void *v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  id v172;
  void *v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  id v181;
  void *v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  char *v191;
  void **v192;
  uint64_t ReminderNotesCellContent;
  uint64_t v194;
  unsigned int (*v195)(void **, uint64_t, uint64_t);
  id v196;
  uint64_t v197;
  void *v198;
  uint64_t ReminderView;
  uint64_t v200;
  char *v201;
  uint64_t v202;
  char *v203;
  void (*v204)(char *, char *, uint64_t);
  id v205;
  uint64_t v206;
  void *v207;
  id v208;
  uint64_t v209;
  void *v210;
  char v211;
  id v212;
  uint64_t v214;
  uint64_t v215;
  unsigned __int8 v216;
  void *v217;
  uint64_t v218;
  uint64_t v219;
  char *v220;
  uint64_t v221;
  char v222;
  unsigned __int8 v223;
  char v224;
  int *v225;
  uint64_t v226;
  uint64_t v227;
  char *v228;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v14[(v5 + 16) & ~(unint64_t)v5];
    swift_retain(v14);
  }
  else
  {
    v6 = a3;
    v7 = type metadata accessor for TTRRemindersListViewModel.Item(0);
    switch(swift_getEnumCaseMultiPayload(a2, v7))
    {
      case 0u:
        v8 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v226 = v7;
        switch(swift_getEnumCaseMultiPayload(a2, v8))
        {
          case 1u:
            v9 = *a2;
            *(_QWORD *)a1 = *a2;
            v10 = v9;
            v11 = a1;
            v12 = v8;
            v13 = 1;
            goto LABEL_43;
          case 2u:
            v94 = type metadata accessor for Date(0);
            (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v94 - 8) + 16))(a1, a2, v94);
            v11 = a1;
            v12 = v8;
            v13 = 2;
            goto LABEL_43;
          case 3u:
            v95 = type metadata accessor for Date(0);
            (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v95 - 8) + 16))(a1, a2, v95);
            v11 = a1;
            v12 = v8;
            v13 = 3;
            goto LABEL_43;
          case 4u:
            v96 = type metadata accessor for Date(0);
            (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v96 - 8) + 16))(a1, a2, v96);
            v11 = a1;
            v12 = v8;
            v13 = 4;
            goto LABEL_43;
          case 5u:
            v97 = type metadata accessor for Date(0);
            (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v97 - 8) + 16))(a1, a2, v97);
            v11 = a1;
            v12 = v8;
            v13 = 5;
            goto LABEL_43;
          case 6u:
            v98 = type metadata accessor for Date(0);
            (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v98 - 8) + 16))(a1, a2, v98);
            v11 = a1;
            v12 = v8;
            v13 = 6;
            goto LABEL_43;
          case 8u:
            v99 = *a2;
            *(_QWORD *)a1 = *a2;
            v100 = v99;
            v11 = a1;
            v12 = v8;
            v13 = 8;
            goto LABEL_43;
          case 9u:
            v101 = *a2;
            *(_QWORD *)a1 = *a2;
            v102 = v101;
            v11 = a1;
            v12 = v8;
            v13 = 9;
LABEL_43:
            swift_storeEnumTagMultiPayload(v11, v12, v13);
            break;
          default:
            memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
            break;
        }
        v103 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
        v104 = v103[5];
        v105 = &a1[v104];
        v106 = (char *)a2 + v104;
        v107 = *(uint64_t *)((char *)a2 + v104 + 8);
        if (v107)
        {
          *(_QWORD *)v105 = *(_QWORD *)v106;
          *((_QWORD *)v105 + 1) = v107;
          v108 = (void *)*((_QWORD *)v106 + 2);
          v109 = *((_QWORD *)v106 + 3);
          v110 = *((_QWORD *)v106 + 4);
          v111 = *((_QWORD *)v106 + 5);
          v214 = *((_QWORD *)v106 + 6);
          v221 = *((_QWORD *)v106 + 7);
          v216 = v106[64];
          swift_bridgeObjectRetain(v107);
          sub_100005D58(v108, v109, v110, v111, v214, v221, v216);
          *((_QWORD *)v105 + 2) = v108;
          *((_QWORD *)v105 + 3) = v109;
          *((_QWORD *)v105 + 4) = v110;
          *((_QWORD *)v105 + 5) = v111;
          *((_QWORD *)v105 + 6) = v214;
          *((_QWORD *)v105 + 7) = v221;
          v105[64] = v216;
          *(_DWORD *)(v105 + 65) = *(_DWORD *)(v106 + 65);
          v112 = v106[120];
          if (v112 == 255)
          {
            v113 = *(_OWORD *)(v106 + 88);
            *(_OWORD *)(v105 + 72) = *(_OWORD *)(v106 + 72);
            *(_OWORD *)(v105 + 88) = v113;
            *(_OWORD *)(v105 + 104) = *(_OWORD *)(v106 + 104);
            v105[120] = v106[120];
          }
          else
          {
            v222 = v112 & 1;
            v118 = *((_QWORD *)v106 + 10);
            v119 = *((_QWORD *)v106 + 11);
            v120 = *((_QWORD *)v106 + 12);
            v121 = *((_QWORD *)v106 + 13);
            v215 = *((_QWORD *)v106 + 14);
            v217 = (void *)*((_QWORD *)v106 + 9);
            sub_100005D80(v217, v118, v119, v120, v121, v215, v112 & 1);
            *((_QWORD *)v105 + 9) = v217;
            *((_QWORD *)v105 + 10) = v118;
            *((_QWORD *)v105 + 11) = v119;
            *((_QWORD *)v105 + 12) = v120;
            *((_QWORD *)v105 + 13) = v121;
            *((_QWORD *)v105 + 14) = v215;
            v105[120] = v222;
          }
          v117 = v226;
          v105[121] = v106[121];
        }
        else
        {
          v114 = *((_OWORD *)v106 + 5);
          *((_OWORD *)v105 + 4) = *((_OWORD *)v106 + 4);
          *((_OWORD *)v105 + 5) = v114;
          *((_OWORD *)v105 + 6) = *((_OWORD *)v106 + 6);
          *(_OWORD *)(v105 + 106) = *(_OWORD *)(v106 + 106);
          v115 = *((_OWORD *)v106 + 1);
          *(_OWORD *)v105 = *(_OWORD *)v106;
          *((_OWORD *)v105 + 1) = v115;
          v116 = *((_OWORD *)v106 + 3);
          *((_OWORD *)v105 + 2) = *((_OWORD *)v106 + 2);
          *((_OWORD *)v105 + 3) = v116;
          v117 = v7;
        }
        a1[v103[6]] = *((_BYTE *)a2 + v103[6]);
        a1[v103[7]] = *((_BYTE *)a2 + v103[7]);
        a1[v103[8]] = *((_BYTE *)a2 + v103[8]);
        a1[v103[9]] = *((_BYTE *)a2 + v103[9]);
        a1[v103[10]] = *((_BYTE *)a2 + v103[10]);
        v122 = v103[11];
        v123 = *(char **)((char *)a2 + v122);
        *(_QWORD *)&a1[v122] = v123;
        v124 = v123;
        v50 = a1;
        v51 = v117;
        v52 = 0;
        goto LABEL_100;
      case 1u:
        v15 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v225 = v6;
        v227 = v7;
        switch(swift_getEnumCaseMultiPayload(a2, v15))
        {
          case 1u:
            v16 = *a2;
            *(_QWORD *)a1 = *a2;
            v17 = v16;
            v18 = a1;
            v19 = v15;
            v20 = 1;
            goto LABEL_59;
          case 2u:
            v125 = type metadata accessor for Date(0);
            (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v125 - 8) + 16))(a1, a2, v125);
            v18 = a1;
            v19 = v15;
            v20 = 2;
            goto LABEL_59;
          case 3u:
            v126 = type metadata accessor for Date(0);
            (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v126 - 8) + 16))(a1, a2, v126);
            v18 = a1;
            v19 = v15;
            v20 = 3;
            goto LABEL_59;
          case 4u:
            v127 = type metadata accessor for Date(0);
            (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v127 - 8) + 16))(a1, a2, v127);
            v18 = a1;
            v19 = v15;
            v20 = 4;
            goto LABEL_59;
          case 5u:
            v128 = type metadata accessor for Date(0);
            (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v128 - 8) + 16))(a1, a2, v128);
            v18 = a1;
            v19 = v15;
            v20 = 5;
            goto LABEL_59;
          case 6u:
            v129 = type metadata accessor for Date(0);
            (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v129 - 8) + 16))(a1, a2, v129);
            v18 = a1;
            v19 = v15;
            v20 = 6;
            goto LABEL_59;
          case 8u:
            v130 = *a2;
            *(_QWORD *)a1 = *a2;
            v131 = v130;
            v18 = a1;
            v19 = v15;
            v20 = 8;
            goto LABEL_59;
          case 9u:
            v132 = *a2;
            *(_QWORD *)a1 = *a2;
            v133 = v132;
            v18 = a1;
            v19 = v15;
            v20 = 9;
LABEL_59:
            swift_storeEnumTagMultiPayload(v18, v19, v20);
            break;
          default:
            memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
            break;
        }
        v134 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
        v135 = v134[5];
        v136 = &a1[v135];
        v137 = (char *)a2 + v135;
        v138 = *(uint64_t *)((char *)a2 + v135 + 8);
        if (v138)
        {
          *(_QWORD *)v136 = *(_QWORD *)v137;
          *((_QWORD *)v136 + 1) = v138;
          v139 = (void *)*((_QWORD *)v137 + 2);
          v140 = *((_QWORD *)v137 + 3);
          v141 = *((_QWORD *)v137 + 4);
          v142 = *((_QWORD *)v137 + 5);
          v143 = *((_QWORD *)v137 + 6);
          v218 = *((_QWORD *)v137 + 7);
          v223 = v137[64];
          swift_bridgeObjectRetain(v138);
          sub_100005D58(v139, v140, v141, v142, v143, v218, v223);
          *((_QWORD *)v136 + 2) = v139;
          *((_QWORD *)v136 + 3) = v140;
          *((_QWORD *)v136 + 4) = v141;
          *((_QWORD *)v136 + 5) = v142;
          *((_QWORD *)v136 + 6) = v143;
          *((_QWORD *)v136 + 7) = v218;
          v136[64] = v223;
          *(_DWORD *)(v136 + 65) = *(_DWORD *)(v137 + 65);
          v144 = v137[120];
          if (v144 == 255)
          {
            v145 = *(_OWORD *)(v137 + 88);
            *(_OWORD *)(v136 + 72) = *(_OWORD *)(v137 + 72);
            *(_OWORD *)(v136 + 88) = v145;
            *(_OWORD *)(v136 + 104) = *(_OWORD *)(v137 + 104);
            v136[120] = v137[120];
          }
          else
          {
            v224 = v144 & 1;
            v151 = (void *)*((_QWORD *)v137 + 9);
            v150 = *((_QWORD *)v137 + 10);
            v152 = *((_QWORD *)v137 + 11);
            v153 = *((_QWORD *)v137 + 12);
            v154 = *((_QWORD *)v137 + 13);
            v219 = *((_QWORD *)v137 + 14);
            sub_100005D80(v151, v150, v152, v153, v154, v219, v144 & 1);
            *((_QWORD *)v136 + 9) = v151;
            *((_QWORD *)v136 + 10) = v150;
            *((_QWORD *)v136 + 11) = v152;
            *((_QWORD *)v136 + 12) = v153;
            *((_QWORD *)v136 + 13) = v154;
            *((_QWORD *)v136 + 14) = v219;
            v136[120] = v224;
          }
          v6 = v225;
          v149 = v227;
          v136[121] = v137[121];
        }
        else
        {
          v146 = *((_OWORD *)v137 + 5);
          *((_OWORD *)v136 + 4) = *((_OWORD *)v137 + 4);
          *((_OWORD *)v136 + 5) = v146;
          *((_OWORD *)v136 + 6) = *((_OWORD *)v137 + 6);
          *(_OWORD *)(v136 + 106) = *(_OWORD *)(v137 + 106);
          v147 = *((_OWORD *)v137 + 1);
          *(_OWORD *)v136 = *(_OWORD *)v137;
          *((_OWORD *)v136 + 1) = v147;
          v148 = *((_OWORD *)v137 + 3);
          *((_OWORD *)v136 + 2) = *((_OWORD *)v137 + 2);
          *((_OWORD *)v136 + 3) = v148;
          v149 = v7;
        }
        a1[v134[6]] = *((_BYTE *)a2 + v134[6]);
        a1[v134[7]] = *((_BYTE *)a2 + v134[7]);
        a1[v134[8]] = *((_BYTE *)a2 + v134[8]);
        a1[v134[9]] = *((_BYTE *)a2 + v134[9]);
        a1[v134[10]] = *((_BYTE *)a2 + v134[10]);
        v155 = v134[11];
        v156 = *(char **)((char *)a2 + v155);
        *(_QWORD *)&a1[v155] = v156;
        v157 = v156;
        v50 = a1;
        v51 = v149;
        v52 = 1;
        goto LABEL_100;
      case 2u:
        v21 = *a2;
        *(_QWORD *)a1 = *a2;
        v22 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v23 = (void **)&a1[v22];
        v24 = (void **)((char *)a2 + v22);
        v25 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v26 = *(_QWORD *)(v25 - 8);
        v27 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v26 + 48);
        v28 = v21;
        if (v27(v24, 1, v25))
        {
          v29 = sub_100005DBC(&qword_100025908);
          memcpy(v23, v24, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v24, v25))
          {
            case 1u:
              v65 = *v24;
              *v23 = *v24;
              v66 = v65;
              v67 = v23;
              v68 = v25;
              v69 = 1;
              goto LABEL_75;
            case 2u:
              v158 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v158 - 8) + 16))(v23, v24, v158);
              v67 = v23;
              v68 = v25;
              v69 = 2;
              goto LABEL_75;
            case 3u:
              v159 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v159 - 8) + 16))(v23, v24, v159);
              v67 = v23;
              v68 = v25;
              v69 = 3;
              goto LABEL_75;
            case 4u:
              v160 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v160 - 8) + 16))(v23, v24, v160);
              v67 = v23;
              v68 = v25;
              v69 = 4;
              goto LABEL_75;
            case 5u:
              v161 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v161 - 8) + 16))(v23, v24, v161);
              v67 = v23;
              v68 = v25;
              v69 = 5;
              goto LABEL_75;
            case 6u:
              v162 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v162 - 8) + 16))(v23, v24, v162);
              v67 = v23;
              v68 = v25;
              v69 = 6;
              goto LABEL_75;
            case 8u:
              v163 = *v24;
              *v23 = *v24;
              v164 = v163;
              v67 = v23;
              v68 = v25;
              v69 = 8;
              goto LABEL_75;
            case 9u:
              v165 = *v24;
              *v23 = *v24;
              v166 = v165;
              v67 = v23;
              v68 = v25;
              v69 = 9;
LABEL_75:
              swift_storeEnumTagMultiPayload(v67, v68, v69);
              break;
            default:
              memcpy(v23, v24, *(_QWORD *)(v26 + 64));
              break;
          }
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v26 + 56))(v23, 0, 1, v25);
        }
        v50 = a1;
        v51 = v7;
        v52 = 2;
        goto LABEL_100;
      case 3u:
        v30 = *a2;
        *(_QWORD *)a1 = *a2;
        v31 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v32 = (void **)&a1[v31];
        v33 = (void **)((char *)a2 + v31);
        v34 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v35 = *(_QWORD *)(v34 - 8);
        v36 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v35 + 48);
        v37 = v30;
        if (v36(v33, 1, v34))
        {
          v38 = sub_100005DBC(&qword_100025908);
          memcpy(v32, v33, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v33, v34))
          {
            case 1u:
              v70 = *v33;
              *v32 = *v33;
              v71 = v70;
              v72 = v32;
              v73 = v34;
              v74 = 1;
              goto LABEL_97;
            case 2u:
              v167 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v167 - 8) + 16))(v32, v33, v167);
              v72 = v32;
              v73 = v34;
              v74 = 2;
              goto LABEL_97;
            case 3u:
              v168 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v168 - 8) + 16))(v32, v33, v168);
              v72 = v32;
              v73 = v34;
              v74 = 3;
              goto LABEL_97;
            case 4u:
              v169 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v169 - 8) + 16))(v32, v33, v169);
              v72 = v32;
              v73 = v34;
              v74 = 4;
              goto LABEL_97;
            case 5u:
              v184 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v184 - 8) + 16))(v32, v33, v184);
              v72 = v32;
              v73 = v34;
              v74 = 5;
              goto LABEL_97;
            case 6u:
              v170 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v170 - 8) + 16))(v32, v33, v170);
              v72 = v32;
              v73 = v34;
              v74 = 6;
              goto LABEL_97;
            case 8u:
              v171 = *v33;
              *v32 = *v33;
              v172 = v171;
              v72 = v32;
              v73 = v34;
              v74 = 8;
              goto LABEL_97;
            case 9u:
              v173 = *v33;
              *v32 = *v33;
              v174 = v173;
              v72 = v32;
              v73 = v34;
              v74 = 9;
LABEL_97:
              swift_storeEnumTagMultiPayload(v72, v73, v74);
              break;
            default:
              memcpy(v32, v33, *(_QWORD *)(v35 + 64));
              break;
          }
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
        }
        v50 = a1;
        v51 = v7;
        v52 = 3;
        goto LABEL_100;
      case 4u:
        v39 = *a2;
        *(_QWORD *)a1 = *a2;
        v40 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v41 = (void **)&a1[v40];
        v42 = (void **)((char *)a2 + v40);
        v43 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v44 = *(_QWORD *)(v43 - 8);
        v45 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v44 + 48);
        v46 = v39;
        if (v45(v42, 1, v43))
        {
          v47 = sub_100005DBC(&qword_100025908);
          memcpy(v41, v42, *(_QWORD *)(*(_QWORD *)(v47 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v42, v43))
          {
            case 1u:
              v75 = *v42;
              *v41 = *v42;
              v76 = v75;
              v77 = v41;
              v78 = v43;
              v79 = 1;
              goto LABEL_93;
            case 2u:
              v175 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v175 - 8) + 16))(v41, v42, v175);
              v77 = v41;
              v78 = v43;
              v79 = 2;
              goto LABEL_93;
            case 3u:
              v176 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v176 - 8) + 16))(v41, v42, v176);
              v77 = v41;
              v78 = v43;
              v79 = 3;
              goto LABEL_93;
            case 4u:
              v177 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v177 - 8) + 16))(v41, v42, v177);
              v77 = v41;
              v78 = v43;
              v79 = 4;
              goto LABEL_93;
            case 5u:
              v178 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v178 - 8) + 16))(v41, v42, v178);
              v77 = v41;
              v78 = v43;
              v79 = 5;
              goto LABEL_93;
            case 6u:
              v179 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v179 - 8) + 16))(v41, v42, v179);
              v77 = v41;
              v78 = v43;
              v79 = 6;
              goto LABEL_93;
            case 8u:
              v180 = *v42;
              *v41 = *v42;
              v181 = v180;
              v77 = v41;
              v78 = v43;
              v79 = 8;
              goto LABEL_93;
            case 9u:
              v182 = *v42;
              *v41 = *v42;
              v183 = v182;
              v77 = v41;
              v78 = v43;
              v79 = 9;
LABEL_93:
              swift_storeEnumTagMultiPayload(v77, v78, v79);
              break;
            default:
              memcpy(v41, v42, *(_QWORD *)(v44 + 64));
              break;
          }
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v44 + 56))(v41, 0, 1, v43);
        }
        v50 = a1;
        v51 = v7;
        v52 = 4;
        goto LABEL_100;
      case 5u:
        *(_QWORD *)a1 = *a2;
        a1[8] = *((_BYTE *)a2 + 8);
        *(_WORD *)(a1 + 9) = *(_WORD *)((char *)a2 + 9);
        v48 = a2[2];
        *((_QWORD *)a1 + 2) = v48;
        v49 = v48;
        v50 = a1;
        v51 = v7;
        v52 = 5;
        goto LABEL_100;
      case 6u:
        v60 = *a2;
        *(_QWORD *)a1 = *a2;
        v61 = v60;
        v50 = a1;
        v51 = v7;
        v52 = 6;
        goto LABEL_100;
      case 7u:
        v53 = type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState(0);
        v54 = *(_QWORD *)(v53 - 8);
        if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v54 + 48))(a2, 1, v53))
        {
          v55 = sub_100005DBC(&qword_100025910);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v55 - 8) + 64));
        }
        else
        {
          v80 = *a2;
          *(_QWORD *)a1 = *a2;
          v81 = *(int *)(v53 + 20);
          v220 = &a1[v81];
          v82 = (char *)a2 + v81;
          v83 = type metadata accessor for REMHashtagLabelSpecifier(0);
          v84 = v7;
          v85 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v83 - 8) + 16);
          swift_bridgeObjectRetain(v80);
          v85(v220, v82, v83);
          v7 = v84;
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(a1, 0, 1, v53);
        }
        v86 = *(int *)(type metadata accessor for TTRRemindersListViewModel.HashtagsState(0) + 20);
        v87 = &a1[v86];
        v88 = (char **)((char *)a2 + v86);
        v89 = v88[1];
        if (v89)
        {
          *(_QWORD *)v87 = *v88;
          *((_QWORD *)v87 + 1) = v89;
          v90 = (void *)v88[2];
          *((_QWORD *)v87 + 2) = v90;
          swift_bridgeObjectRetain(v89);
          v91 = v90;
        }
        else
        {
          *(_OWORD *)v87 = *(_OWORD *)v88;
          *((_QWORD *)v87 + 2) = v88[2];
        }
        v50 = a1;
        v51 = v7;
        v52 = 7;
        goto LABEL_100;
      case 8u:
        v62 = type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription(0);
        v63 = *(_QWORD *)(v62 - 8);
        if ((*(unsigned int (**)(char **, uint64_t, uint64_t))(v63 + 48))(a2, 1, v62))
        {
          v64 = type metadata accessor for TTRTemplatePublicLinkData.StateToDisplay(0);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v64 - 8) + 64));
        }
        else
        {
          v92 = type metadata accessor for Date(0);
          (*(void (**)(char *, char **, uint64_t))(*(_QWORD *)(v92 - 8) + 16))(a1, a2, v92);
          a1[*(int *)(v62 + 20)] = *((_BYTE *)a2 + *(int *)(v62 + 20));
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v63 + 56))(a1, 0, 1, v62);
        }
        v93 = type metadata accessor for TTRTemplatePublicLinkData(0);
        *(_QWORD *)&a1[*(int *)(v93 + 20)] = *(char **)((char *)a2 + *(int *)(v93 + 20));
        v50 = a1;
        v51 = v7;
        v52 = 8;
        goto LABEL_100;
      case 9u:
        *a1 = *(_BYTE *)a2;
        v56 = *(int *)(type metadata accessor for TTRRemindersListTips(0) + 20);
        v57 = &a1[v56];
        v58 = (char *)a2 + v56;
        v59 = type metadata accessor for AnyTip(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v59 - 8) + 16))(v57, v58, v59);
        v50 = a1;
        v51 = v7;
        v52 = 9;
LABEL_100:
        swift_storeEnumTagMultiPayload(v50, v51, v52);
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
        break;
    }
    v185 = v6[5];
    v186 = v6[6];
    v187 = *(char **)((char *)a2 + v185);
    *(_QWORD *)&a1[v185] = v187;
    a1[v186] = *((_BYTE *)a2 + v186);
    v188 = v6[7];
    v189 = v6[8];
    v190 = *(uint64_t *)((char *)a2 + v188);
    *(_QWORD *)&a1[v188] = v190;
    v191 = &a1[v189];
    v192 = (void **)((char *)a2 + v189);
    ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
    v194 = *(_QWORD *)(ReminderNotesCellContent - 8);
    v195 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v194 + 48);
    v196 = v187;
    swift_bridgeObjectRetain(v190);
    if (v195(v192, 1, ReminderNotesCellContent))
    {
      v197 = sub_100005DBC(&qword_100025918);
      memcpy(v191, v192, *(_QWORD *)(*(_QWORD *)(v197 - 8) + 64));
    }
    else
    {
      if (swift_getEnumCaseMultiPayload(v192, ReminderNotesCellContent) == 1)
      {
        v198 = *v192;
        *(_QWORD *)v191 = *v192;
        ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
        v200 = *(int *)(ReminderView + 20);
        v228 = &v191[v200];
        v201 = (char *)v192 + v200;
        v202 = type metadata accessor for URL(0);
        v203 = a1;
        v204 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v202 - 8) + 16);
        v205 = v198;
        v204(v228, v201, v202);
        a1 = v203;
        v206 = *(int *)(ReminderView + 24);
        v207 = *(void **)((char *)v192 + v206);
        *(_QWORD *)&v191[v206] = v207;
        v208 = v207;
        v209 = 1;
      }
      else
      {
        v210 = *v192;
        v211 = *((_BYTE *)v192 + 8);
        v212 = v210;
        v209 = 0;
        *(_QWORD *)v191 = v210;
        v191[8] = v211;
      }
      swift_storeEnumTagMultiPayload(v191, ReminderNotesCellContent, v209);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v194 + 56))(v191, 0, 1, ReminderNotesCellContent);
    }
  }
  return a1;
}

id sub_100005D58(id result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 a7)
{
  if (a7 >> 6 == 2)
    return (id)swift_bridgeObjectRetain(a2);
  if (!(a7 >> 6))
    return sub_100005D80(result, a2, a3, a4, a5, a6, a7 & 1);
  return result;
}

id sub_100005D80(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if ((a7 & 1) != 0)
    return a1;
  swift_bridgeObjectRetain(a2);
  swift_bridgeObjectRetain(a4);
  return (id)swift_bridgeObjectRetain(a6);
}

uint64_t sub_100005DBC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContext2((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(uint64_t a1)
{
  return sub_10000A1D4(a1, qword_100025A38, (uint64_t)&nominal type descriptor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
}

void sub_100005E14(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  int v24;
  id *v25;
  uint64_t ReminderNotesCellContent;
  uint64_t ReminderView;
  char *v28;
  uint64_t v29;
  id v30;

  v4 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  switch(swift_getEnumCaseMultiPayload(a1, v4))
  {
    case 0u:
      v5 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      switch(swift_getEnumCaseMultiPayload(a1, v5))
      {
        case 1u:
        case 8u:
        case 9u:
          goto LABEL_22;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          goto LABEL_4;
        default:
          goto LABEL_23;
      }
      goto LABEL_23;
    case 1u:
      v6 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      switch(swift_getEnumCaseMultiPayload(a1, v6))
      {
        case 1u:
        case 8u:
        case 9u:
LABEL_22:

          break;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
LABEL_4:
          v7 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
          break;
        default:
          break;
      }
LABEL_23:
      v21 = type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
      v22 = (char *)a1 + *(int *)(v21 + 20);
      v23 = *((_QWORD *)v22 + 1);
      if (v23)
      {
        swift_bridgeObjectRelease(v23);
        sub_10000628C(*((void **)v22 + 2), *((_QWORD *)v22 + 3), *((_QWORD *)v22 + 4), *((_QWORD *)v22 + 5), *((_QWORD *)v22 + 6), *((_QWORD *)v22 + 7), v22[64]);
        v24 = v22[120];
        if (v24 != 255)
          sub_1000062B4(*((void **)v22 + 9), *((_QWORD *)v22 + 10), *((_QWORD *)v22 + 11), *((_QWORD *)v22 + 12), *((_QWORD *)v22 + 13), *((_QWORD *)v22 + 14), v24 & 1);
      }
      v13 = *(id *)((char *)a1 + *(int *)(v21 + 44));
      goto LABEL_27;
    case 2u:

      v8 = (id *)((char *)a1 + *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20));
      v9 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9))
      {
        switch(swift_getEnumCaseMultiPayload(v8, v9))
        {
          case 1u:
          case 8u:
          case 9u:
            goto LABEL_33;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            goto LABEL_11;
          default:
            goto LABEL_28;
        }
      }
      goto LABEL_28;
    case 3u:

      v8 = (id *)((char *)a1 + *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20));
      v10 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v8, 1, v10))
      {
        switch(swift_getEnumCaseMultiPayload(v8, v10))
        {
          case 1u:
          case 8u:
          case 9u:
            goto LABEL_33;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            goto LABEL_11;
          default:
            goto LABEL_28;
        }
      }
      goto LABEL_28;
    case 4u:

      v8 = (id *)((char *)a1 + *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20));
      v11 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v8, 1, v11))
      {
        switch(swift_getEnumCaseMultiPayload(v8, v11))
        {
          case 1u:
          case 8u:
          case 9u:
LABEL_33:
            v13 = *v8;
            goto LABEL_27;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
LABEL_11:
            v12 = type metadata accessor for Date(0);
            goto LABEL_21;
          default:
            goto LABEL_28;
        }
      }
      goto LABEL_28;
    case 5u:
      v13 = (id)a1[2];
      goto LABEL_27;
    case 6u:
      v13 = (id)*a1;
      goto LABEL_27;
    case 7u:
      v14 = type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState(0);
      if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48))(a1, 1, v14))
      {
        swift_bridgeObjectRelease(*a1);
        v15 = (char *)a1 + *(int *)(v14 + 20);
        v16 = type metadata accessor for REMHashtagLabelSpecifier(0);
        (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
      }
      v17 = (char *)a1 + *(int *)(type metadata accessor for TTRRemindersListViewModel.HashtagsState(0) + 20);
      v18 = *((_QWORD *)v17 + 1);
      if (!v18)
        goto LABEL_28;
      swift_bridgeObjectRelease(v18);
      v13 = (id)*((_QWORD *)v17 + 2);
LABEL_27:

LABEL_28:
      swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[7]));
      v25 = (id *)((char *)a1 + a2[8]);
      ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(ReminderNotesCellContent - 8) + 48))(v25, 1, ReminderNotesCellContent))
      {
        if (swift_getEnumCaseMultiPayload(v25, ReminderNotesCellContent) == 1)
        {

          ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
          v28 = (char *)v25 + *(int *)(ReminderView + 20);
          v29 = type metadata accessor for URL(0);
          (*(void (**)(char *, uint64_t))(*(_QWORD *)(v29 - 8) + 8))(v28, v29);
          v30 = *(id *)((char *)v25 + *(int *)(ReminderView + 24));
        }
        else
        {
          v30 = *v25;
        }

      }
      return;
    case 8u:
      v19 = type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription(0);
      if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48))(a1, 1, v19))
      {
        v20 = type metadata accessor for Date(0);
        (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a1, v20);
      }
      goto LABEL_28;
    case 9u:
      v8 = (id *)((char *)a1 + *(int *)(type metadata accessor for TTRRemindersListTips(0) + 20));
      v12 = type metadata accessor for AnyTip(0);
LABEL_21:
      (*(void (**)(id *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v8, v12);
      goto LABEL_28;
    default:
      goto LABEL_28;
  }
}

void sub_10000628C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned __int8 a7)
{
  if (a7 >> 6 == 2)
  {
    swift_bridgeObjectRelease(a2);
  }
  else if (!(a7 >> 6))
  {
    sub_1000062B4(a1, a2, a3, a4, a5, a6, a7 & 1);
  }
}

void sub_1000062B4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  if ((a7 & 1) != 0)
  {

  }
  else
  {
    swift_bridgeObjectRelease(a2);
    swift_bridgeObjectRelease(a4);
    swift_bridgeObjectRelease(a6);
  }
}

void **sub_1000062F4(void **a1, void **a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void **v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int (*v25)(void **, uint64_t, uint64_t);
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void **v30;
  void **v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int (*v34)(void **, uint64_t, uint64_t);
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void **v39;
  void **v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int (*v43)(void **, uint64_t, uint64_t);
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  void **v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  void **v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  void **v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  void **v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, char *, uint64_t);
  uint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  uint64_t v87;
  void *v88;
  id v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  int *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  int v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  id v131;
  void *v132;
  id v133;
  int *v134;
  uint64_t v135;
  char *v136;
  char *v137;
  uint64_t v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  int v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  id v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  id v164;
  void *v165;
  id v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  id v172;
  void *v173;
  id v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  id v181;
  void *v182;
  id v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  _BYTE *v191;
  void **v192;
  uint64_t ReminderNotesCellContent;
  uint64_t v194;
  unsigned int (*v195)(void **, uint64_t, uint64_t);
  id v196;
  uint64_t v197;
  void *v198;
  uint64_t ReminderView;
  uint64_t v200;
  char *v201;
  uint64_t v202;
  void **v203;
  void (*v204)(_BYTE *, char *, uint64_t);
  id v205;
  uint64_t v206;
  void *v207;
  id v208;
  uint64_t v209;
  void *v210;
  char v211;
  id v212;
  unsigned __int8 v214;
  void *v215;
  uint64_t v216;
  void *v217;
  char *v218;
  uint64_t v219;
  char v220;
  unsigned __int8 v221;
  char v222;
  uint64_t v223;
  uint64_t v224;
  int *v225;
  int *v226;
  _BYTE *v227;

  v6 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  switch(swift_getEnumCaseMultiPayload(a2, v6))
  {
    case 0u:
      v7 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v223 = v6;
      v225 = a3;
      switch(swift_getEnumCaseMultiPayload(a2, v7))
      {
        case 1u:
          v8 = *a2;
          *a1 = *a2;
          v9 = v8;
          v10 = a1;
          v11 = v7;
          v12 = 1;
          goto LABEL_41;
        case 2u:
          v92 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v92 - 8) + 16))(a1, a2, v92);
          v10 = a1;
          v11 = v7;
          v12 = 2;
          goto LABEL_41;
        case 3u:
          v93 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v93 - 8) + 16))(a1, a2, v93);
          v10 = a1;
          v11 = v7;
          v12 = 3;
          goto LABEL_41;
        case 4u:
          v94 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v94 - 8) + 16))(a1, a2, v94);
          v10 = a1;
          v11 = v7;
          v12 = 4;
          goto LABEL_41;
        case 5u:
          v95 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v95 - 8) + 16))(a1, a2, v95);
          v10 = a1;
          v11 = v7;
          v12 = 5;
          goto LABEL_41;
        case 6u:
          v96 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v96 - 8) + 16))(a1, a2, v96);
          v10 = a1;
          v11 = v7;
          v12 = 6;
          goto LABEL_41;
        case 8u:
          v97 = *a2;
          *a1 = *a2;
          v98 = v97;
          v10 = a1;
          v11 = v7;
          v12 = 8;
          goto LABEL_41;
        case 9u:
          v99 = *a2;
          *a1 = *a2;
          v100 = v99;
          v10 = a1;
          v11 = v7;
          v12 = 9;
LABEL_41:
          swift_storeEnumTagMultiPayload(v10, v11, v12);
          break;
        default:
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
          break;
      }
      v101 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
      v102 = v101[5];
      v103 = (char *)a1 + v102;
      v104 = (char *)a2 + v102;
      v105 = *(uint64_t *)((char *)a2 + v102 + 8);
      if (v105)
      {
        *(_QWORD *)v103 = *(_QWORD *)v104;
        *((_QWORD *)v103 + 1) = v105;
        v106 = (void *)*((_QWORD *)v104 + 2);
        v107 = *((_QWORD *)v104 + 3);
        v108 = *((_QWORD *)v104 + 4);
        v109 = *((_QWORD *)v104 + 5);
        v110 = *((_QWORD *)v104 + 6);
        v219 = *((_QWORD *)v104 + 7);
        v214 = v104[64];
        swift_bridgeObjectRetain(v105);
        sub_100005D58(v106, v107, v108, v109, v110, v219, v214);
        *((_QWORD *)v103 + 2) = v106;
        *((_QWORD *)v103 + 3) = v107;
        *((_QWORD *)v103 + 4) = v108;
        *((_QWORD *)v103 + 5) = v109;
        *((_QWORD *)v103 + 6) = v110;
        *((_QWORD *)v103 + 7) = v219;
        v103[64] = v214;
        *(_DWORD *)(v103 + 65) = *(_DWORD *)(v104 + 65);
        v111 = v104[120];
        if (v111 == 255)
        {
          v112 = *(_OWORD *)(v104 + 88);
          *(_OWORD *)(v103 + 72) = *(_OWORD *)(v104 + 72);
          *(_OWORD *)(v103 + 88) = v112;
          *(_OWORD *)(v103 + 104) = *(_OWORD *)(v104 + 104);
          v103[120] = v104[120];
        }
        else
        {
          v220 = v111 & 1;
          v117 = *((_QWORD *)v104 + 10);
          v215 = (void *)*((_QWORD *)v104 + 9);
          v118 = *((_QWORD *)v104 + 11);
          v119 = *((_QWORD *)v104 + 12);
          v120 = *((_QWORD *)v104 + 13);
          v121 = *((_QWORD *)v104 + 14);
          sub_100005D80(v215, v117, v118, v119, v120, v121, v111 & 1);
          *((_QWORD *)v103 + 9) = v215;
          *((_QWORD *)v103 + 10) = v117;
          *((_QWORD *)v103 + 11) = v118;
          *((_QWORD *)v103 + 12) = v119;
          *((_QWORD *)v103 + 13) = v120;
          *((_QWORD *)v103 + 14) = v121;
          v103[120] = v220;
        }
        v116 = v223;
        a3 = v225;
        v103[121] = v104[121];
      }
      else
      {
        v113 = *((_OWORD *)v104 + 5);
        *((_OWORD *)v103 + 4) = *((_OWORD *)v104 + 4);
        *((_OWORD *)v103 + 5) = v113;
        *((_OWORD *)v103 + 6) = *((_OWORD *)v104 + 6);
        *(_OWORD *)(v103 + 106) = *(_OWORD *)(v104 + 106);
        v114 = *((_OWORD *)v104 + 1);
        *(_OWORD *)v103 = *(_OWORD *)v104;
        *((_OWORD *)v103 + 1) = v114;
        v115 = *((_OWORD *)v104 + 3);
        *((_OWORD *)v103 + 2) = *((_OWORD *)v104 + 2);
        *((_OWORD *)v103 + 3) = v115;
        v116 = v6;
      }
      *((_BYTE *)a1 + v101[6]) = *((_BYTE *)a2 + v101[6]);
      *((_BYTE *)a1 + v101[7]) = *((_BYTE *)a2 + v101[7]);
      *((_BYTE *)a1 + v101[8]) = *((_BYTE *)a2 + v101[8]);
      *((_BYTE *)a1 + v101[9]) = *((_BYTE *)a2 + v101[9]);
      *((_BYTE *)a1 + v101[10]) = *((_BYTE *)a2 + v101[10]);
      v122 = v101[11];
      v123 = *(void **)((char *)a2 + v122);
      *(void **)((char *)a1 + v122) = v123;
      v124 = v123;
      v48 = a1;
      v49 = v116;
      v50 = 0;
      goto LABEL_98;
    case 1u:
      v13 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v224 = v6;
      v226 = a3;
      switch(swift_getEnumCaseMultiPayload(a2, v13))
      {
        case 1u:
          v14 = *a2;
          *a1 = *a2;
          v15 = v14;
          v16 = a1;
          v17 = v13;
          v18 = 1;
          goto LABEL_57;
        case 2u:
          v125 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v125 - 8) + 16))(a1, a2, v125);
          v16 = a1;
          v17 = v13;
          v18 = 2;
          goto LABEL_57;
        case 3u:
          v126 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v126 - 8) + 16))(a1, a2, v126);
          v16 = a1;
          v17 = v13;
          v18 = 3;
          goto LABEL_57;
        case 4u:
          v127 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v127 - 8) + 16))(a1, a2, v127);
          v16 = a1;
          v17 = v13;
          v18 = 4;
          goto LABEL_57;
        case 5u:
          v128 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v128 - 8) + 16))(a1, a2, v128);
          v16 = a1;
          v17 = v13;
          v18 = 5;
          goto LABEL_57;
        case 6u:
          v129 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v129 - 8) + 16))(a1, a2, v129);
          v16 = a1;
          v17 = v13;
          v18 = 6;
          goto LABEL_57;
        case 8u:
          v130 = *a2;
          *a1 = *a2;
          v131 = v130;
          v16 = a1;
          v17 = v13;
          v18 = 8;
          goto LABEL_57;
        case 9u:
          v132 = *a2;
          *a1 = *a2;
          v133 = v132;
          v16 = a1;
          v17 = v13;
          v18 = 9;
LABEL_57:
          swift_storeEnumTagMultiPayload(v16, v17, v18);
          break;
        default:
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
          break;
      }
      v134 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
      v135 = v134[5];
      v136 = (char *)a1 + v135;
      v137 = (char *)a2 + v135;
      v138 = *(uint64_t *)((char *)a2 + v135 + 8);
      if (v138)
      {
        *(_QWORD *)v136 = *(_QWORD *)v137;
        *((_QWORD *)v136 + 1) = v138;
        v139 = (void *)*((_QWORD *)v137 + 2);
        v140 = *((_QWORD *)v137 + 3);
        v141 = *((_QWORD *)v137 + 4);
        v142 = *((_QWORD *)v137 + 5);
        v143 = *((_QWORD *)v137 + 6);
        v216 = *((_QWORD *)v137 + 7);
        v221 = v137[64];
        swift_bridgeObjectRetain(v138);
        sub_100005D58(v139, v140, v141, v142, v143, v216, v221);
        *((_QWORD *)v136 + 2) = v139;
        *((_QWORD *)v136 + 3) = v140;
        *((_QWORD *)v136 + 4) = v141;
        *((_QWORD *)v136 + 5) = v142;
        *((_QWORD *)v136 + 6) = v143;
        *((_QWORD *)v136 + 7) = v216;
        v136[64] = v221;
        *(_DWORD *)(v136 + 65) = *(_DWORD *)(v137 + 65);
        v144 = v137[120];
        if (v144 == 255)
        {
          v145 = *(_OWORD *)(v137 + 88);
          *(_OWORD *)(v136 + 72) = *(_OWORD *)(v137 + 72);
          *(_OWORD *)(v136 + 88) = v145;
          *(_OWORD *)(v136 + 104) = *(_OWORD *)(v137 + 104);
          v136[120] = v137[120];
        }
        else
        {
          v222 = v144 & 1;
          v150 = *((_QWORD *)v137 + 10);
          v217 = (void *)*((_QWORD *)v137 + 9);
          v151 = *((_QWORD *)v137 + 11);
          v152 = *((_QWORD *)v137 + 12);
          v153 = *((_QWORD *)v137 + 13);
          v154 = *((_QWORD *)v137 + 14);
          sub_100005D80(v217, v150, v151, v152, v153, v154, v144 & 1);
          *((_QWORD *)v136 + 9) = v217;
          *((_QWORD *)v136 + 10) = v150;
          *((_QWORD *)v136 + 11) = v151;
          *((_QWORD *)v136 + 12) = v152;
          *((_QWORD *)v136 + 13) = v153;
          *((_QWORD *)v136 + 14) = v154;
          v136[120] = v222;
        }
        v149 = v224;
        a3 = v226;
        v136[121] = v137[121];
      }
      else
      {
        v146 = *((_OWORD *)v137 + 5);
        *((_OWORD *)v136 + 4) = *((_OWORD *)v137 + 4);
        *((_OWORD *)v136 + 5) = v146;
        *((_OWORD *)v136 + 6) = *((_OWORD *)v137 + 6);
        *(_OWORD *)(v136 + 106) = *(_OWORD *)(v137 + 106);
        v147 = *((_OWORD *)v137 + 1);
        *(_OWORD *)v136 = *(_OWORD *)v137;
        *((_OWORD *)v136 + 1) = v147;
        v148 = *((_OWORD *)v137 + 3);
        *((_OWORD *)v136 + 2) = *((_OWORD *)v137 + 2);
        *((_OWORD *)v136 + 3) = v148;
        v149 = v6;
      }
      *((_BYTE *)a1 + v134[6]) = *((_BYTE *)a2 + v134[6]);
      *((_BYTE *)a1 + v134[7]) = *((_BYTE *)a2 + v134[7]);
      *((_BYTE *)a1 + v134[8]) = *((_BYTE *)a2 + v134[8]);
      *((_BYTE *)a1 + v134[9]) = *((_BYTE *)a2 + v134[9]);
      *((_BYTE *)a1 + v134[10]) = *((_BYTE *)a2 + v134[10]);
      v155 = v134[11];
      v156 = *(void **)((char *)a2 + v155);
      *(void **)((char *)a1 + v155) = v156;
      v157 = v156;
      v48 = a1;
      v49 = v149;
      v50 = 1;
      goto LABEL_98;
    case 2u:
      v19 = *a2;
      *a1 = *a2;
      v20 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
      v21 = (void **)((char *)a1 + v20);
      v22 = (void **)((char *)a2 + v20);
      v23 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v24 = *(_QWORD *)(v23 - 8);
      v25 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v24 + 48);
      v26 = v19;
      if (v25(v22, 1, v23))
      {
        v27 = sub_100005DBC(&qword_100025908);
        memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload(v22, v23))
        {
          case 1u:
            v63 = *v22;
            *v21 = *v22;
            v64 = v63;
            v65 = v21;
            v66 = v23;
            v67 = 1;
            goto LABEL_73;
          case 2u:
            v158 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v158 - 8) + 16))(v21, v22, v158);
            v65 = v21;
            v66 = v23;
            v67 = 2;
            goto LABEL_73;
          case 3u:
            v159 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v159 - 8) + 16))(v21, v22, v159);
            v65 = v21;
            v66 = v23;
            v67 = 3;
            goto LABEL_73;
          case 4u:
            v160 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v160 - 8) + 16))(v21, v22, v160);
            v65 = v21;
            v66 = v23;
            v67 = 4;
            goto LABEL_73;
          case 5u:
            v161 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v161 - 8) + 16))(v21, v22, v161);
            v65 = v21;
            v66 = v23;
            v67 = 5;
            goto LABEL_73;
          case 6u:
            v162 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v162 - 8) + 16))(v21, v22, v162);
            v65 = v21;
            v66 = v23;
            v67 = 6;
            goto LABEL_73;
          case 8u:
            v163 = *v22;
            *v21 = *v22;
            v164 = v163;
            v65 = v21;
            v66 = v23;
            v67 = 8;
            goto LABEL_73;
          case 9u:
            v165 = *v22;
            *v21 = *v22;
            v166 = v165;
            v65 = v21;
            v66 = v23;
            v67 = 9;
LABEL_73:
            swift_storeEnumTagMultiPayload(v65, v66, v67);
            break;
          default:
            memcpy(v21, v22, *(_QWORD *)(v24 + 64));
            break;
        }
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
      }
      v48 = a1;
      v49 = v6;
      v50 = 2;
      goto LABEL_98;
    case 3u:
      v28 = *a2;
      *a1 = *a2;
      v29 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
      v30 = (void **)((char *)a1 + v29);
      v31 = (void **)((char *)a2 + v29);
      v32 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v33 = *(_QWORD *)(v32 - 8);
      v34 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v33 + 48);
      v35 = v28;
      if (v34(v31, 1, v32))
      {
        v36 = sub_100005DBC(&qword_100025908);
        memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload(v31, v32))
        {
          case 1u:
            v68 = *v31;
            *v30 = *v31;
            v69 = v68;
            v70 = v30;
            v71 = v32;
            v72 = 1;
            goto LABEL_95;
          case 2u:
            v167 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v167 - 8) + 16))(v30, v31, v167);
            v70 = v30;
            v71 = v32;
            v72 = 2;
            goto LABEL_95;
          case 3u:
            v168 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v168 - 8) + 16))(v30, v31, v168);
            v70 = v30;
            v71 = v32;
            v72 = 3;
            goto LABEL_95;
          case 4u:
            v169 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v169 - 8) + 16))(v30, v31, v169);
            v70 = v30;
            v71 = v32;
            v72 = 4;
            goto LABEL_95;
          case 5u:
            v184 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v184 - 8) + 16))(v30, v31, v184);
            v70 = v30;
            v71 = v32;
            v72 = 5;
            goto LABEL_95;
          case 6u:
            v170 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v170 - 8) + 16))(v30, v31, v170);
            v70 = v30;
            v71 = v32;
            v72 = 6;
            goto LABEL_95;
          case 8u:
            v171 = *v31;
            *v30 = *v31;
            v172 = v171;
            v70 = v30;
            v71 = v32;
            v72 = 8;
            goto LABEL_95;
          case 9u:
            v173 = *v31;
            *v30 = *v31;
            v174 = v173;
            v70 = v30;
            v71 = v32;
            v72 = 9;
LABEL_95:
            swift_storeEnumTagMultiPayload(v70, v71, v72);
            break;
          default:
            memcpy(v30, v31, *(_QWORD *)(v33 + 64));
            break;
        }
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
      }
      v48 = a1;
      v49 = v6;
      v50 = 3;
      goto LABEL_98;
    case 4u:
      v37 = *a2;
      *a1 = *a2;
      v38 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
      v39 = (void **)((char *)a1 + v38);
      v40 = (void **)((char *)a2 + v38);
      v41 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v42 = *(_QWORD *)(v41 - 8);
      v43 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v42 + 48);
      v44 = v37;
      if (v43(v40, 1, v41))
      {
        v45 = sub_100005DBC(&qword_100025908);
        memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload(v40, v41))
        {
          case 1u:
            v73 = *v40;
            *v39 = *v40;
            v74 = v73;
            v75 = v39;
            v76 = v41;
            v77 = 1;
            goto LABEL_91;
          case 2u:
            v175 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v175 - 8) + 16))(v39, v40, v175);
            v75 = v39;
            v76 = v41;
            v77 = 2;
            goto LABEL_91;
          case 3u:
            v176 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v176 - 8) + 16))(v39, v40, v176);
            v75 = v39;
            v76 = v41;
            v77 = 3;
            goto LABEL_91;
          case 4u:
            v177 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v177 - 8) + 16))(v39, v40, v177);
            v75 = v39;
            v76 = v41;
            v77 = 4;
            goto LABEL_91;
          case 5u:
            v178 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v178 - 8) + 16))(v39, v40, v178);
            v75 = v39;
            v76 = v41;
            v77 = 5;
            goto LABEL_91;
          case 6u:
            v179 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v179 - 8) + 16))(v39, v40, v179);
            v75 = v39;
            v76 = v41;
            v77 = 6;
            goto LABEL_91;
          case 8u:
            v180 = *v40;
            *v39 = *v40;
            v181 = v180;
            v75 = v39;
            v76 = v41;
            v77 = 8;
            goto LABEL_91;
          case 9u:
            v182 = *v40;
            *v39 = *v40;
            v183 = v182;
            v75 = v39;
            v76 = v41;
            v77 = 9;
LABEL_91:
            swift_storeEnumTagMultiPayload(v75, v76, v77);
            break;
          default:
            memcpy(v39, v40, *(_QWORD *)(v42 + 64));
            break;
        }
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
      }
      v48 = a1;
      v49 = v6;
      v50 = 4;
      goto LABEL_98;
    case 5u:
      *a1 = *a2;
      *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
      *(_WORD *)((char *)a1 + 9) = *(_WORD *)((char *)a2 + 9);
      v46 = a2[2];
      a1[2] = v46;
      v47 = v46;
      v48 = a1;
      v49 = v6;
      v50 = 5;
      goto LABEL_98;
    case 6u:
      v58 = *a2;
      *a1 = *a2;
      v59 = v58;
      v48 = a1;
      v49 = v6;
      v50 = 6;
      goto LABEL_98;
    case 7u:
      v51 = type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState(0);
      v52 = *(_QWORD *)(v51 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v52 + 48))(a2, 1, v51))
      {
        v53 = sub_100005DBC(&qword_100025910);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
      }
      else
      {
        v78 = *a2;
        *a1 = *a2;
        v79 = *(int *)(v51 + 20);
        v218 = (char *)a1 + v79;
        v80 = (char *)a2 + v79;
        v81 = type metadata accessor for REMHashtagLabelSpecifier(0);
        v82 = v6;
        v83 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v81 - 8) + 16);
        swift_bridgeObjectRetain(v78);
        v83(v218, v80, v81);
        v6 = v82;
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v52 + 56))(a1, 0, 1, v51);
      }
      v84 = *(int *)(type metadata accessor for TTRRemindersListViewModel.HashtagsState(0) + 20);
      v85 = (void **)((char *)a1 + v84);
      v86 = (void **)((char *)a2 + v84);
      v87 = v86[1];
      if (v87)
      {
        *v85 = *v86;
        v85[1] = v87;
        v88 = (void *)v86[2];
        v85[2] = v88;
        swift_bridgeObjectRetain(v87);
        v89 = v88;
      }
      else
      {
        *(_OWORD *)v85 = *(_OWORD *)v86;
        v85[2] = v86[2];
      }
      v48 = a1;
      v49 = v6;
      v50 = 7;
      goto LABEL_98;
    case 8u:
      v60 = type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription(0);
      v61 = *(_QWORD *)(v60 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v61 + 48))(a2, 1, v60))
      {
        v62 = type metadata accessor for TTRTemplatePublicLinkData.StateToDisplay(0);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v62 - 8) + 64));
      }
      else
      {
        v90 = type metadata accessor for Date(0);
        (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v90 - 8) + 16))(a1, a2, v90);
        *((_BYTE *)a1 + *(int *)(v60 + 20)) = *((_BYTE *)a2 + *(int *)(v60 + 20));
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v61 + 56))(a1, 0, 1, v60);
      }
      v91 = type metadata accessor for TTRTemplatePublicLinkData(0);
      *(void **)((char *)a1 + *(int *)(v91 + 20)) = *(void **)((char *)a2 + *(int *)(v91 + 20));
      v48 = a1;
      v49 = v6;
      v50 = 8;
      goto LABEL_98;
    case 9u:
      *(_BYTE *)a1 = *(_BYTE *)a2;
      v54 = *(int *)(type metadata accessor for TTRRemindersListTips(0) + 20);
      v55 = (char *)a1 + v54;
      v56 = (char *)a2 + v54;
      v57 = type metadata accessor for AnyTip(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v57 - 8) + 16))(v55, v56, v57);
      v48 = a1;
      v49 = v6;
      v50 = 9;
LABEL_98:
      swift_storeEnumTagMultiPayload(v48, v49, v50);
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
      break;
  }
  v185 = a3[5];
  v186 = a3[6];
  v187 = *(void **)((char *)a2 + v185);
  *(void **)((char *)a1 + v185) = v187;
  *((_BYTE *)a1 + v186) = *((_BYTE *)a2 + v186);
  v188 = a3[7];
  v189 = a3[8];
  v190 = *(void **)((char *)a2 + v188);
  *(void **)((char *)a1 + v188) = v190;
  v191 = (char *)a1 + v189;
  v192 = (void **)((char *)a2 + v189);
  ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
  v194 = *(_QWORD *)(ReminderNotesCellContent - 8);
  v195 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v194 + 48);
  v196 = v187;
  swift_bridgeObjectRetain(v190);
  if (v195(v192, 1, ReminderNotesCellContent))
  {
    v197 = sub_100005DBC(&qword_100025918);
    memcpy(v191, v192, *(_QWORD *)(*(_QWORD *)(v197 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload(v192, ReminderNotesCellContent) == 1)
    {
      v198 = *v192;
      *(_QWORD *)v191 = *v192;
      ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      v200 = *(int *)(ReminderView + 20);
      v227 = &v191[v200];
      v201 = (char *)v192 + v200;
      v202 = type metadata accessor for URL(0);
      v203 = a1;
      v204 = *(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v202 - 8) + 16);
      v205 = v198;
      v204(v227, v201, v202);
      a1 = v203;
      v206 = *(int *)(ReminderView + 24);
      v207 = *(void **)((char *)v192 + v206);
      *(_QWORD *)&v191[v206] = v207;
      v208 = v207;
      v209 = 1;
    }
    else
    {
      v210 = *v192;
      v211 = *((_BYTE *)v192 + 8);
      v212 = v210;
      v209 = 0;
      *(_QWORD *)v191 = v210;
      v191[8] = v211;
    }
    swift_storeEnumTagMultiPayload(v191, ReminderNotesCellContent, v209);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v194 + 56))(v191, 0, 1, ReminderNotesCellContent);
  }
  return a1;
}

void **sub_1000073F0(void **a1, void **a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void **v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void **v21;
  void **v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int (*v25)(void **, uint64_t, uint64_t);
  id v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void **v30;
  void **v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int (*v34)(void **, uint64_t, uint64_t);
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void **v39;
  void **v40;
  uint64_t v41;
  uint64_t v42;
  unsigned int (*v43)(void **, uint64_t, uint64_t);
  id v44;
  uint64_t v45;
  void *v46;
  id v47;
  void **v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  void **v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  id v69;
  void **v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  id v74;
  void **v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  uint64_t v79;
  char *v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(char *, char *, uint64_t);
  uint64_t v84;
  _QWORD *v85;
  _QWORD *v86;
  uint64_t v87;
  void *v88;
  id v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  int *v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  id v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  id v137;
  void *v138;
  id v139;
  int *v140;
  uint64_t v141;
  char *v142;
  char *v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  unsigned __int8 v150;
  int v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  uint64_t v161;
  uint64_t v162;
  void *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  id v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  id v177;
  void *v178;
  id v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  id v186;
  void *v187;
  id v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  id v195;
  void *v196;
  id v197;
  uint64_t v198;
  void *v199;
  void *v200;
  id v201;
  uint64_t v202;
  void *v203;
  uint64_t v204;
  uint64_t v205;
  _BYTE *v206;
  _BYTE *v207;
  uint64_t ReminderNotesCellContent;
  uint64_t v209;
  uint64_t (*v210)(_BYTE *, uint64_t, uint64_t);
  int v211;
  int v212;
  void *v213;
  uint64_t ReminderView;
  uint64_t v215;
  _BYTE *v216;
  uint64_t v217;
  void (*v218)(_BYTE *, _BYTE *, uint64_t);
  id v219;
  uint64_t v220;
  void *v221;
  id v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  uint64_t v226;
  uint64_t v227;
  _BYTE *v228;
  _BYTE *v229;
  uint64_t v230;
  void (*v231)(_BYTE *, _BYTE *, uint64_t);
  id v232;
  uint64_t v233;
  void *v234;
  id v235;
  void *v236;
  char v237;
  id v238;
  void *v240;
  char v241;
  id v242;
  uint64_t v243;
  uint64_t v244;
  int *v245;
  uint64_t v246;
  char v247;
  char *v248;
  unsigned __int8 v249;
  char v250;
  int *v251;
  int *v252;
  uint64_t v253;
  uint64_t v254;
  _BYTE *v255;

  if (a1 != a2)
  {
    sub_100008650((uint64_t)a1, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
    v6 = type metadata accessor for TTRRemindersListViewModel.Item(0);
    switch(swift_getEnumCaseMultiPayload(a2, v6))
    {
      case 0u:
        v7 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v253 = v6;
        switch(swift_getEnumCaseMultiPayload(a2, v7))
        {
          case 1u:
            v8 = *a2;
            *a1 = *a2;
            v9 = v8;
            v10 = a1;
            v11 = v7;
            v12 = 1;
            goto LABEL_42;
          case 2u:
            v93 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v93 - 8) + 16))(a1, a2, v93);
            v10 = a1;
            v11 = v7;
            v12 = 2;
            goto LABEL_42;
          case 3u:
            v94 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v94 - 8) + 16))(a1, a2, v94);
            v10 = a1;
            v11 = v7;
            v12 = 3;
            goto LABEL_42;
          case 4u:
            v95 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v95 - 8) + 16))(a1, a2, v95);
            v10 = a1;
            v11 = v7;
            v12 = 4;
            goto LABEL_42;
          case 5u:
            v96 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v96 - 8) + 16))(a1, a2, v96);
            v10 = a1;
            v11 = v7;
            v12 = 5;
            goto LABEL_42;
          case 6u:
            v97 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v97 - 8) + 16))(a1, a2, v97);
            v10 = a1;
            v11 = v7;
            v12 = 6;
            goto LABEL_42;
          case 8u:
            v98 = *a2;
            *a1 = *a2;
            v99 = v98;
            v10 = a1;
            v11 = v7;
            v12 = 8;
            goto LABEL_42;
          case 9u:
            v100 = *a2;
            *a1 = *a2;
            v101 = v100;
            v10 = a1;
            v11 = v7;
            v12 = 9;
LABEL_42:
            swift_storeEnumTagMultiPayload(v10, v11, v12);
            break;
          default:
            memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
            break;
        }
        v102 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
        v103 = v102[5];
        v104 = (char *)a1 + v103;
        v105 = (char *)a2 + v103;
        if (*(void **)((char *)a2 + v103 + 8))
        {
          v245 = v102;
          *(_QWORD *)v104 = *(_QWORD *)v105;
          v106 = *((_QWORD *)v105 + 1);
          *((_QWORD *)v104 + 1) = v106;
          v107 = (void *)*((_QWORD *)v105 + 2);
          v108 = *((_QWORD *)v105 + 3);
          v109 = *((_QWORD *)v105 + 4);
          v110 = *((_QWORD *)v105 + 5);
          v111 = *((_QWORD *)v105 + 7);
          v243 = *((_QWORD *)v105 + 6);
          v249 = v105[64];
          swift_bridgeObjectRetain(v106);
          sub_100005D58(v107, v108, v109, v110, v243, v111, v249);
          *((_QWORD *)v104 + 2) = v107;
          *((_QWORD *)v104 + 3) = v108;
          *((_QWORD *)v104 + 4) = v109;
          *((_QWORD *)v104 + 5) = v110;
          *((_QWORD *)v104 + 6) = v243;
          *((_QWORD *)v104 + 7) = v111;
          v104[64] = v249;
          v104[65] = v105[65];
          v104[66] = v105[66];
          v104[67] = v105[67];
          v104[68] = v105[68];
          v112 = v105[120];
          if (v112 == 255)
          {
            v113 = *(_OWORD *)(v105 + 72);
            v114 = *(_OWORD *)(v105 + 88);
            v115 = *(_OWORD *)(v105 + 104);
            v104[120] = v105[120];
            *(_OWORD *)(v104 + 88) = v114;
            *(_OWORD *)(v104 + 104) = v115;
            *(_OWORD *)(v104 + 72) = v113;
          }
          else
          {
            v250 = v112 & 1;
            v124 = (void *)*((_QWORD *)v105 + 9);
            v123 = *((_QWORD *)v105 + 10);
            v125 = *((_QWORD *)v105 + 11);
            v126 = *((_QWORD *)v105 + 12);
            v127 = *((_QWORD *)v105 + 13);
            v244 = *((_QWORD *)v105 + 14);
            sub_100005D80(v124, v123, v125, v126, v127, v244, v112 & 1);
            *((_QWORD *)v104 + 9) = v124;
            *((_QWORD *)v104 + 10) = v123;
            *((_QWORD *)v104 + 11) = v125;
            *((_QWORD *)v104 + 12) = v126;
            *((_QWORD *)v104 + 13) = v127;
            *((_QWORD *)v104 + 14) = v244;
            v104[120] = v250;
          }
          v122 = v253;
          v104[121] = v105[121];
          v102 = v245;
        }
        else
        {
          v116 = *(_OWORD *)v105;
          v117 = *((_OWORD *)v105 + 1);
          v118 = *((_OWORD *)v105 + 3);
          *((_OWORD *)v104 + 2) = *((_OWORD *)v105 + 2);
          *((_OWORD *)v104 + 3) = v118;
          *(_OWORD *)v104 = v116;
          *((_OWORD *)v104 + 1) = v117;
          v119 = *((_OWORD *)v105 + 4);
          v120 = *((_OWORD *)v105 + 5);
          v121 = *((_OWORD *)v105 + 6);
          *(_OWORD *)(v104 + 106) = *(_OWORD *)(v105 + 106);
          *((_OWORD *)v104 + 5) = v120;
          *((_OWORD *)v104 + 6) = v121;
          *((_OWORD *)v104 + 4) = v119;
          v122 = v6;
        }
        *((_BYTE *)a1 + v102[6]) = *((_BYTE *)a2 + v102[6]);
        *((_BYTE *)a1 + v102[7]) = *((_BYTE *)a2 + v102[7]);
        *((_BYTE *)a1 + v102[8]) = *((_BYTE *)a2 + v102[8]);
        *((_BYTE *)a1 + v102[9]) = *((_BYTE *)a2 + v102[9]);
        *((_BYTE *)a1 + v102[10]) = *((_BYTE *)a2 + v102[10]);
        v128 = v102[11];
        v129 = *(void **)((char *)a2 + v128);
        *(void **)((char *)a1 + v128) = v129;
        v130 = v129;
        v48 = a1;
        v49 = v122;
        v50 = 0;
        goto LABEL_99;
      case 1u:
        v13 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v252 = a3;
        v254 = v6;
        switch(swift_getEnumCaseMultiPayload(a2, v13))
        {
          case 1u:
            v14 = *a2;
            *a1 = *a2;
            v15 = v14;
            v16 = a1;
            v17 = v13;
            v18 = 1;
            goto LABEL_58;
          case 2u:
            v131 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v131 - 8) + 16))(a1, a2, v131);
            v16 = a1;
            v17 = v13;
            v18 = 2;
            goto LABEL_58;
          case 3u:
            v132 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v132 - 8) + 16))(a1, a2, v132);
            v16 = a1;
            v17 = v13;
            v18 = 3;
            goto LABEL_58;
          case 4u:
            v133 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v133 - 8) + 16))(a1, a2, v133);
            v16 = a1;
            v17 = v13;
            v18 = 4;
            goto LABEL_58;
          case 5u:
            v134 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v134 - 8) + 16))(a1, a2, v134);
            v16 = a1;
            v17 = v13;
            v18 = 5;
            goto LABEL_58;
          case 6u:
            v135 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v135 - 8) + 16))(a1, a2, v135);
            v16 = a1;
            v17 = v13;
            v18 = 6;
            goto LABEL_58;
          case 8u:
            v136 = *a2;
            *a1 = *a2;
            v137 = v136;
            v16 = a1;
            v17 = v13;
            v18 = 8;
            goto LABEL_58;
          case 9u:
            v138 = *a2;
            *a1 = *a2;
            v139 = v138;
            v16 = a1;
            v17 = v13;
            v18 = 9;
LABEL_58:
            swift_storeEnumTagMultiPayload(v16, v17, v18);
            break;
          default:
            memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
            break;
        }
        v140 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
        v141 = v140[5];
        v142 = (char *)a1 + v141;
        v143 = (char *)a2 + v141;
        if (*(void **)((char *)a2 + v141 + 8))
        {
          v251 = v140;
          *(_QWORD *)v142 = *(_QWORD *)v143;
          v144 = *((_QWORD *)v143 + 1);
          *((_QWORD *)v142 + 1) = v144;
          v145 = (void *)*((_QWORD *)v143 + 2);
          v146 = *((_QWORD *)v143 + 3);
          v147 = *((_QWORD *)v143 + 4);
          v148 = *((_QWORD *)v143 + 5);
          v149 = *((_QWORD *)v143 + 6);
          v246 = *((_QWORD *)v143 + 7);
          v150 = v143[64];
          swift_bridgeObjectRetain(v144);
          sub_100005D58(v145, v146, v147, v148, v149, v246, v150);
          *((_QWORD *)v142 + 2) = v145;
          *((_QWORD *)v142 + 3) = v146;
          *((_QWORD *)v142 + 4) = v147;
          *((_QWORD *)v142 + 5) = v148;
          *((_QWORD *)v142 + 6) = v149;
          *((_QWORD *)v142 + 7) = v246;
          v142[64] = v150;
          v142[65] = v143[65];
          v142[66] = v143[66];
          v142[67] = v143[67];
          v142[68] = v143[68];
          v151 = v143[120];
          if (v151 == 255)
          {
            v152 = *(_OWORD *)(v143 + 72);
            v153 = *(_OWORD *)(v143 + 88);
            v154 = *(_OWORD *)(v143 + 104);
            v142[120] = v143[120];
            *(_OWORD *)(v142 + 88) = v153;
            *(_OWORD *)(v142 + 104) = v154;
            *(_OWORD *)(v142 + 72) = v152;
          }
          else
          {
            v247 = v151 & 1;
            v163 = (void *)*((_QWORD *)v143 + 9);
            v162 = *((_QWORD *)v143 + 10);
            v164 = *((_QWORD *)v143 + 11);
            v165 = *((_QWORD *)v143 + 12);
            v167 = *((_QWORD *)v143 + 13);
            v166 = *((_QWORD *)v143 + 14);
            sub_100005D80(v163, v162, v164, v165, v167, v166, v151 & 1);
            *((_QWORD *)v142 + 9) = v163;
            *((_QWORD *)v142 + 10) = v162;
            *((_QWORD *)v142 + 11) = v164;
            *((_QWORD *)v142 + 12) = v165;
            *((_QWORD *)v142 + 13) = v167;
            *((_QWORD *)v142 + 14) = v166;
            v142[120] = v247;
          }
          a3 = v252;
          v161 = v254;
          v142[121] = v143[121];
          v140 = v251;
        }
        else
        {
          v155 = *(_OWORD *)v143;
          v156 = *((_OWORD *)v143 + 1);
          v157 = *((_OWORD *)v143 + 3);
          *((_OWORD *)v142 + 2) = *((_OWORD *)v143 + 2);
          *((_OWORD *)v142 + 3) = v157;
          *(_OWORD *)v142 = v155;
          *((_OWORD *)v142 + 1) = v156;
          v158 = *((_OWORD *)v143 + 4);
          v159 = *((_OWORD *)v143 + 5);
          v160 = *((_OWORD *)v143 + 6);
          *(_OWORD *)(v142 + 106) = *(_OWORD *)(v143 + 106);
          *((_OWORD *)v142 + 5) = v159;
          *((_OWORD *)v142 + 6) = v160;
          *((_OWORD *)v142 + 4) = v158;
          v161 = v6;
        }
        *((_BYTE *)a1 + v140[6]) = *((_BYTE *)a2 + v140[6]);
        *((_BYTE *)a1 + v140[7]) = *((_BYTE *)a2 + v140[7]);
        *((_BYTE *)a1 + v140[8]) = *((_BYTE *)a2 + v140[8]);
        *((_BYTE *)a1 + v140[9]) = *((_BYTE *)a2 + v140[9]);
        *((_BYTE *)a1 + v140[10]) = *((_BYTE *)a2 + v140[10]);
        v168 = v140[11];
        v169 = *(void **)((char *)a2 + v168);
        *(void **)((char *)a1 + v168) = v169;
        v170 = v169;
        v48 = a1;
        v49 = v161;
        v50 = 1;
        goto LABEL_99;
      case 2u:
        v19 = *a2;
        *a1 = *a2;
        v20 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v21 = (void **)((char *)a1 + v20);
        v22 = (void **)((char *)a2 + v20);
        v23 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v24 = *(_QWORD *)(v23 - 8);
        v25 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v24 + 48);
        v26 = v19;
        if (v25(v22, 1, v23))
        {
          v27 = sub_100005DBC(&qword_100025908);
          memcpy(v21, v22, *(_QWORD *)(*(_QWORD *)(v27 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v22, v23))
          {
            case 1u:
              v63 = *v22;
              *v21 = *v22;
              v64 = v63;
              v65 = v21;
              v66 = v23;
              v67 = 1;
              goto LABEL_74;
            case 2u:
              v171 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v171 - 8) + 16))(v21, v22, v171);
              v65 = v21;
              v66 = v23;
              v67 = 2;
              goto LABEL_74;
            case 3u:
              v172 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v172 - 8) + 16))(v21, v22, v172);
              v65 = v21;
              v66 = v23;
              v67 = 3;
              goto LABEL_74;
            case 4u:
              v173 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v173 - 8) + 16))(v21, v22, v173);
              v65 = v21;
              v66 = v23;
              v67 = 4;
              goto LABEL_74;
            case 5u:
              v174 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v174 - 8) + 16))(v21, v22, v174);
              v65 = v21;
              v66 = v23;
              v67 = 5;
              goto LABEL_74;
            case 6u:
              v175 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v175 - 8) + 16))(v21, v22, v175);
              v65 = v21;
              v66 = v23;
              v67 = 6;
              goto LABEL_74;
            case 8u:
              v176 = *v22;
              *v21 = *v22;
              v177 = v176;
              v65 = v21;
              v66 = v23;
              v67 = 8;
              goto LABEL_74;
            case 9u:
              v178 = *v22;
              *v21 = *v22;
              v179 = v178;
              v65 = v21;
              v66 = v23;
              v67 = 9;
LABEL_74:
              swift_storeEnumTagMultiPayload(v65, v66, v67);
              break;
            default:
              memcpy(v21, v22, *(_QWORD *)(v24 + 64));
              break;
          }
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
        }
        v48 = a1;
        v49 = v6;
        v50 = 2;
        goto LABEL_99;
      case 3u:
        v28 = *a2;
        *a1 = *a2;
        v29 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v30 = (void **)((char *)a1 + v29);
        v31 = (void **)((char *)a2 + v29);
        v32 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v33 = *(_QWORD *)(v32 - 8);
        v34 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v33 + 48);
        v35 = v28;
        if (v34(v31, 1, v32))
        {
          v36 = sub_100005DBC(&qword_100025908);
          memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v36 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v31, v32))
          {
            case 1u:
              v68 = *v31;
              *v30 = *v31;
              v69 = v68;
              v70 = v30;
              v71 = v32;
              v72 = 1;
              goto LABEL_85;
            case 2u:
              v180 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v180 - 8) + 16))(v30, v31, v180);
              v70 = v30;
              v71 = v32;
              v72 = 2;
              goto LABEL_85;
            case 3u:
              v181 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v181 - 8) + 16))(v30, v31, v181);
              v70 = v30;
              v71 = v32;
              v72 = 3;
              goto LABEL_85;
            case 4u:
              v182 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v182 - 8) + 16))(v30, v31, v182);
              v70 = v30;
              v71 = v32;
              v72 = 4;
              goto LABEL_85;
            case 5u:
              v183 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v183 - 8) + 16))(v30, v31, v183);
              v70 = v30;
              v71 = v32;
              v72 = 5;
              goto LABEL_85;
            case 6u:
              v184 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v184 - 8) + 16))(v30, v31, v184);
              v70 = v30;
              v71 = v32;
              v72 = 6;
              goto LABEL_85;
            case 8u:
              v185 = *v31;
              *v30 = *v31;
              v186 = v185;
              v70 = v30;
              v71 = v32;
              v72 = 8;
              goto LABEL_85;
            case 9u:
              v187 = *v31;
              *v30 = *v31;
              v188 = v187;
              v70 = v30;
              v71 = v32;
              v72 = 9;
LABEL_85:
              swift_storeEnumTagMultiPayload(v70, v71, v72);
              break;
            default:
              memcpy(v30, v31, *(_QWORD *)(v33 + 64));
              break;
          }
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
        }
        v48 = a1;
        v49 = v6;
        v50 = 3;
        goto LABEL_99;
      case 4u:
        v37 = *a2;
        *a1 = *a2;
        v38 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v39 = (void **)((char *)a1 + v38);
        v40 = (void **)((char *)a2 + v38);
        v41 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v42 = *(_QWORD *)(v41 - 8);
        v43 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v42 + 48);
        v44 = v37;
        if (v43(v40, 1, v41))
        {
          v45 = sub_100005DBC(&qword_100025908);
          memcpy(v39, v40, *(_QWORD *)(*(_QWORD *)(v45 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v40, v41))
          {
            case 1u:
              v73 = *v40;
              *v39 = *v40;
              v74 = v73;
              v75 = v39;
              v76 = v41;
              v77 = 1;
              goto LABEL_96;
            case 2u:
              v189 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v189 - 8) + 16))(v39, v40, v189);
              v75 = v39;
              v76 = v41;
              v77 = 2;
              goto LABEL_96;
            case 3u:
              v190 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v190 - 8) + 16))(v39, v40, v190);
              v75 = v39;
              v76 = v41;
              v77 = 3;
              goto LABEL_96;
            case 4u:
              v191 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v191 - 8) + 16))(v39, v40, v191);
              v75 = v39;
              v76 = v41;
              v77 = 4;
              goto LABEL_96;
            case 5u:
              v192 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v192 - 8) + 16))(v39, v40, v192);
              v75 = v39;
              v76 = v41;
              v77 = 5;
              goto LABEL_96;
            case 6u:
              v193 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v193 - 8) + 16))(v39, v40, v193);
              v75 = v39;
              v76 = v41;
              v77 = 6;
              goto LABEL_96;
            case 8u:
              v194 = *v40;
              *v39 = *v40;
              v195 = v194;
              v75 = v39;
              v76 = v41;
              v77 = 8;
              goto LABEL_96;
            case 9u:
              v196 = *v40;
              *v39 = *v40;
              v197 = v196;
              v75 = v39;
              v76 = v41;
              v77 = 9;
LABEL_96:
              swift_storeEnumTagMultiPayload(v75, v76, v77);
              break;
            default:
              memcpy(v39, v40, *(_QWORD *)(v42 + 64));
              break;
          }
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v42 + 56))(v39, 0, 1, v41);
        }
        v48 = a1;
        v49 = v6;
        v50 = 4;
        goto LABEL_99;
      case 5u:
        *a1 = *a2;
        *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
        *((_BYTE *)a1 + 9) = *((_BYTE *)a2 + 9);
        *((_BYTE *)a1 + 10) = *((_BYTE *)a2 + 10);
        v46 = a2[2];
        a1[2] = v46;
        v47 = v46;
        v48 = a1;
        v49 = v6;
        v50 = 5;
        goto LABEL_99;
      case 6u:
        v58 = *a2;
        *a1 = *a2;
        v59 = v58;
        v48 = a1;
        v49 = v6;
        v50 = 6;
        goto LABEL_99;
      case 7u:
        v51 = type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState(0);
        v52 = *(_QWORD *)(v51 - 8);
        if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v52 + 48))(a2, 1, v51))
        {
          v53 = sub_100005DBC(&qword_100025910);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v53 - 8) + 64));
        }
        else
        {
          v78 = *a2;
          *a1 = *a2;
          v79 = *(int *)(v51 + 20);
          v248 = (char *)a1 + v79;
          v80 = (char *)a2 + v79;
          v81 = type metadata accessor for REMHashtagLabelSpecifier(0);
          v82 = v6;
          v83 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v81 - 8) + 16);
          swift_bridgeObjectRetain(v78);
          v83(v248, v80, v81);
          v6 = v82;
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v52 + 56))(a1, 0, 1, v51);
        }
        v84 = *(int *)(type metadata accessor for TTRRemindersListViewModel.HashtagsState(0) + 20);
        v85 = (void **)((char *)a1 + v84);
        v86 = (void **)((char *)a2 + v84);
        if (v86[1])
        {
          *v85 = *v86;
          v87 = v86[1];
          v85[1] = v87;
          v88 = (void *)v86[2];
          v85[2] = v88;
          swift_bridgeObjectRetain(v87);
          v89 = v88;
        }
        else
        {
          v90 = *(_OWORD *)v86;
          v85[2] = v86[2];
          *(_OWORD *)v85 = v90;
        }
        v48 = a1;
        v49 = v6;
        v50 = 7;
        goto LABEL_99;
      case 8u:
        v60 = type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription(0);
        v61 = *(_QWORD *)(v60 - 8);
        if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v61 + 48))(a2, 1, v60))
        {
          v62 = type metadata accessor for TTRTemplatePublicLinkData.StateToDisplay(0);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v62 - 8) + 64));
        }
        else
        {
          v91 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v91 - 8) + 16))(a1, a2, v91);
          *((_BYTE *)a1 + *(int *)(v60 + 20)) = *((_BYTE *)a2 + *(int *)(v60 + 20));
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v61 + 56))(a1, 0, 1, v60);
        }
        v92 = type metadata accessor for TTRTemplatePublicLinkData(0);
        *(void **)((char *)a1 + *(int *)(v92 + 20)) = *(void **)((char *)a2 + *(int *)(v92 + 20));
        v48 = a1;
        v49 = v6;
        v50 = 8;
        goto LABEL_99;
      case 9u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v54 = *(int *)(type metadata accessor for TTRRemindersListTips(0) + 20);
        v55 = (char *)a1 + v54;
        v56 = (char *)a2 + v54;
        v57 = type metadata accessor for AnyTip(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v57 - 8) + 16))(v55, v56, v57);
        v48 = a1;
        v49 = v6;
        v50 = 9;
LABEL_99:
        swift_storeEnumTagMultiPayload(v48, v49, v50);
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
        break;
    }
  }
  v198 = a3[5];
  v199 = *(void **)((char *)a1 + v198);
  v200 = *(void **)((char *)a2 + v198);
  *(void **)((char *)a1 + v198) = v200;
  v201 = v200;

  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v202 = a3[7];
  v203 = *(void **)((char *)a2 + v202);
  v204 = *(uint64_t *)((char *)a1 + v202);
  *(void **)((char *)a1 + v202) = v203;
  swift_bridgeObjectRetain(v203);
  swift_bridgeObjectRelease(v204);
  v205 = a3[8];
  v206 = (char *)a1 + v205;
  v207 = (char *)a2 + v205;
  ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
  v209 = *(_QWORD *)(ReminderNotesCellContent - 8);
  v210 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v209 + 48);
  v211 = v210(v206, 1, ReminderNotesCellContent);
  v212 = v210(v207, 1, ReminderNotesCellContent);
  if (v211)
  {
    if (!v212)
    {
      if (swift_getEnumCaseMultiPayload(v207, ReminderNotesCellContent) == 1)
      {
        v213 = *(void **)v207;
        *(_QWORD *)v206 = *(_QWORD *)v207;
        ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
        v215 = *(int *)(ReminderView + 20);
        v255 = &v206[v215];
        v216 = &v207[v215];
        v217 = type metadata accessor for URL(0);
        v218 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v217 - 8) + 16);
        v219 = v213;
        v218(v255, v216, v217);
        v220 = *(int *)(ReminderView + 24);
        v221 = *(void **)&v207[v220];
        *(_QWORD *)&v206[v220] = v221;
        v222 = v221;
        v223 = 1;
      }
      else
      {
        v236 = *(void **)v207;
        v237 = v207[8];
        v238 = v236;
        v223 = 0;
        *(_QWORD *)v206 = v236;
        v206[8] = v237;
      }
      swift_storeEnumTagMultiPayload(v206, ReminderNotesCellContent, v223);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v209 + 56))(v206, 0, 1, ReminderNotesCellContent);
      return a1;
    }
LABEL_106:
    v224 = sub_100005DBC(&qword_100025918);
    memcpy(v206, v207, *(_QWORD *)(*(_QWORD *)(v224 - 8) + 64));
    return a1;
  }
  if (v212)
  {
    sub_100008650((uint64_t)v206, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
    goto LABEL_106;
  }
  if (a1 != a2)
  {
    sub_100008650((uint64_t)v206, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
    if (swift_getEnumCaseMultiPayload(v207, ReminderNotesCellContent) == 1)
    {
      v225 = *(void **)v207;
      *(_QWORD *)v206 = *(_QWORD *)v207;
      v226 = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      v227 = *(int *)(v226 + 20);
      v228 = &v206[v227];
      v229 = &v207[v227];
      v230 = type metadata accessor for URL(0);
      v231 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v230 - 8) + 16);
      v232 = v225;
      v231(v228, v229, v230);
      v233 = *(int *)(v226 + 24);
      v234 = *(void **)&v207[v233];
      *(_QWORD *)&v206[v233] = v234;
      v235 = v234;
      swift_storeEnumTagMultiPayload(v206, ReminderNotesCellContent, 1);
    }
    else
    {
      v240 = *(void **)v207;
      v241 = v207[8];
      v242 = v240;
      *(_QWORD *)v206 = v240;
      v206[8] = v241;
      swift_storeEnumTagMultiPayload(v206, ReminderNotesCellContent, 0);
    }
  }
  return a1;
}

uint64_t sub_100008650(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_QWORD *sub_10000868C(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
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
  char *v42;
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int *v73;
  uint64_t v74;
  _OWORD *v75;
  _OWORD *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int *v85;
  uint64_t v86;
  _OWORD *v87;
  _OWORD *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
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
  _QWORD *v107;
  _QWORD *v108;
  uint64_t ReminderNotesCellContent;
  uint64_t v110;
  uint64_t v111;
  uint64_t ReminderView;
  uint64_t v113;
  char *v114;
  char *v115;
  uint64_t v116;

  v6 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  switch(swift_getEnumCaseMultiPayload(a2, v6))
  {
    case 0u:
      v7 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      switch(swift_getEnumCaseMultiPayload(a2, v7))
      {
        case 2u:
          v8 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
          v9 = a1;
          v10 = v7;
          v11 = 2;
          goto LABEL_33;
        case 3u:
          v69 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v69 - 8) + 32))(a1, a2, v69);
          v9 = a1;
          v10 = v7;
          v11 = 3;
          goto LABEL_33;
        case 4u:
          v70 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v70 - 8) + 32))(a1, a2, v70);
          v9 = a1;
          v10 = v7;
          v11 = 4;
          goto LABEL_33;
        case 5u:
          v71 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v71 - 8) + 32))(a1, a2, v71);
          v9 = a1;
          v10 = v7;
          v11 = 5;
          goto LABEL_33;
        case 6u:
          v72 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v72 - 8) + 32))(a1, a2, v72);
          v9 = a1;
          v10 = v7;
          v11 = 6;
LABEL_33:
          swift_storeEnumTagMultiPayload(v9, v10, v11);
          break;
        default:
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
          break;
      }
      v73 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
      v74 = v73[5];
      v75 = (_OWORD *)((char *)a1 + v74);
      v76 = (_OWORD *)((char *)a2 + v74);
      v77 = v76[3];
      v75[2] = v76[2];
      v75[3] = v77;
      v78 = v76[1];
      *v75 = *v76;
      v75[1] = v78;
      *(_OWORD *)((char *)v75 + 106) = *(_OWORD *)((char *)v76 + 106);
      v79 = v76[6];
      v80 = v76[4];
      v75[5] = v76[5];
      v75[6] = v79;
      v75[4] = v80;
      *((_BYTE *)a1 + v73[6]) = *((_BYTE *)a2 + v73[6]);
      *((_BYTE *)a1 + v73[7]) = *((_BYTE *)a2 + v73[7]);
      *((_BYTE *)a1 + v73[8]) = *((_BYTE *)a2 + v73[8]);
      *((_BYTE *)a1 + v73[9]) = *((_BYTE *)a2 + v73[9]);
      *((_BYTE *)a1 + v73[10]) = *((_BYTE *)a2 + v73[10]);
      *(_QWORD *)((char *)a1 + v73[11]) = *(_QWORD *)((char *)a2 + v73[11]);
      v45 = a1;
      v46 = v6;
      v47 = 0;
      goto LABEL_66;
    case 1u:
      v12 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      switch(swift_getEnumCaseMultiPayload(a2, v12))
      {
        case 2u:
          v13 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a1, a2, v13);
          v14 = a1;
          v15 = v12;
          v16 = 2;
          goto LABEL_40;
        case 3u:
          v81 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v81 - 8) + 32))(a1, a2, v81);
          v14 = a1;
          v15 = v12;
          v16 = 3;
          goto LABEL_40;
        case 4u:
          v82 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v82 - 8) + 32))(a1, a2, v82);
          v14 = a1;
          v15 = v12;
          v16 = 4;
          goto LABEL_40;
        case 5u:
          v83 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v83 - 8) + 32))(a1, a2, v83);
          v14 = a1;
          v15 = v12;
          v16 = 5;
          goto LABEL_40;
        case 6u:
          v84 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v84 - 8) + 32))(a1, a2, v84);
          v14 = a1;
          v15 = v12;
          v16 = 6;
LABEL_40:
          swift_storeEnumTagMultiPayload(v14, v15, v16);
          break;
        default:
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
          break;
      }
      v85 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
      v86 = v85[5];
      v87 = (_OWORD *)((char *)a1 + v86);
      v88 = (_OWORD *)((char *)a2 + v86);
      v89 = v88[3];
      v87[2] = v88[2];
      v87[3] = v89;
      v90 = v88[1];
      *v87 = *v88;
      v87[1] = v90;
      *(_OWORD *)((char *)v87 + 106) = *(_OWORD *)((char *)v88 + 106);
      v91 = v88[6];
      v92 = v88[4];
      v87[5] = v88[5];
      v87[6] = v91;
      v87[4] = v92;
      *((_BYTE *)a1 + v85[6]) = *((_BYTE *)a2 + v85[6]);
      *((_BYTE *)a1 + v85[7]) = *((_BYTE *)a2 + v85[7]);
      *((_BYTE *)a1 + v85[8]) = *((_BYTE *)a2 + v85[8]);
      *((_BYTE *)a1 + v85[9]) = *((_BYTE *)a2 + v85[9]);
      *((_BYTE *)a1 + v85[10]) = *((_BYTE *)a2 + v85[10]);
      *(_QWORD *)((char *)a1 + v85[11]) = *(_QWORD *)((char *)a2 + v85[11]);
      v45 = a1;
      v46 = v6;
      v47 = 1;
      goto LABEL_66;
    case 2u:
      *a1 = *a2;
      v17 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
      v18 = (char *)a1 + v17;
      v19 = (char *)a2 + v17;
      v20 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v21 = *(_QWORD *)(v20 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
      {
        v22 = sub_100005DBC(&qword_100025908);
        memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload(v19, v20))
        {
          case 2u:
            v48 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v48 - 8) + 32))(v18, v19, v48);
            v49 = v18;
            v50 = v20;
            v51 = 2;
            goto LABEL_47;
          case 3u:
            v93 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v93 - 8) + 32))(v18, v19, v93);
            v49 = v18;
            v50 = v20;
            v51 = 3;
            goto LABEL_47;
          case 4u:
            v94 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v94 - 8) + 32))(v18, v19, v94);
            v49 = v18;
            v50 = v20;
            v51 = 4;
            goto LABEL_47;
          case 5u:
            v95 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v95 - 8) + 32))(v18, v19, v95);
            v49 = v18;
            v50 = v20;
            v51 = 5;
            goto LABEL_47;
          case 6u:
            v96 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v96 - 8) + 32))(v18, v19, v96);
            v49 = v18;
            v50 = v20;
            v51 = 6;
LABEL_47:
            swift_storeEnumTagMultiPayload(v49, v50, v51);
            break;
          default:
            memcpy(v18, v19, *(_QWORD *)(v21 + 64));
            break;
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      }
      v45 = a1;
      v46 = v6;
      v47 = 2;
      goto LABEL_66;
    case 3u:
      *a1 = *a2;
      v23 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
      v24 = (char *)a1 + v23;
      v25 = (char *)a2 + v23;
      v26 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v27 = *(_QWORD *)(v26 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
      {
        v28 = sub_100005DBC(&qword_100025908);
        memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload(v25, v26))
        {
          case 2u:
            v52 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 32))(v24, v25, v52);
            v53 = v24;
            v54 = v26;
            v55 = 2;
            goto LABEL_55;
          case 3u:
            v97 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v97 - 8) + 32))(v24, v25, v97);
            v53 = v24;
            v54 = v26;
            v55 = 3;
            goto LABEL_55;
          case 4u:
            v98 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v98 - 8) + 32))(v24, v25, v98);
            v53 = v24;
            v54 = v26;
            v55 = 4;
            goto LABEL_55;
          case 5u:
            v99 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v99 - 8) + 32))(v24, v25, v99);
            v53 = v24;
            v54 = v26;
            v55 = 5;
            goto LABEL_55;
          case 6u:
            v100 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v100 - 8) + 32))(v24, v25, v100);
            v53 = v24;
            v54 = v26;
            v55 = 6;
LABEL_55:
            swift_storeEnumTagMultiPayload(v53, v54, v55);
            break;
          default:
            memcpy(v24, v25, *(_QWORD *)(v27 + 64));
            break;
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
      }
      v45 = a1;
      v46 = v6;
      v47 = 3;
      goto LABEL_66;
    case 4u:
      *a1 = *a2;
      v29 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
      v30 = (char *)a1 + v29;
      v31 = (char *)a2 + v29;
      v32 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v33 = *(_QWORD *)(v32 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
      {
        v34 = sub_100005DBC(&qword_100025908);
        memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload(v31, v32))
        {
          case 2u:
            v56 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 32))(v30, v31, v56);
            v57 = v30;
            v58 = v32;
            v59 = 2;
            goto LABEL_63;
          case 3u:
            v101 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v101 - 8) + 32))(v30, v31, v101);
            v57 = v30;
            v58 = v32;
            v59 = 3;
            goto LABEL_63;
          case 4u:
            v102 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v102 - 8) + 32))(v30, v31, v102);
            v57 = v30;
            v58 = v32;
            v59 = 4;
            goto LABEL_63;
          case 5u:
            v103 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v103 - 8) + 32))(v30, v31, v103);
            v57 = v30;
            v58 = v32;
            v59 = 5;
            goto LABEL_63;
          case 6u:
            v104 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v104 - 8) + 32))(v30, v31, v104);
            v57 = v30;
            v58 = v32;
            v59 = 6;
LABEL_63:
            swift_storeEnumTagMultiPayload(v57, v58, v59);
            break;
          default:
            memcpy(v30, v31, *(_QWORD *)(v33 + 64));
            break;
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
      }
      v45 = a1;
      v46 = v6;
      v47 = 4;
      goto LABEL_66;
    case 7u:
      v35 = type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState(0);
      v36 = *(_QWORD *)(v35 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v36 + 48))(a2, 1, v35))
      {
        v37 = sub_100005DBC(&qword_100025910);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
      }
      else
      {
        *a1 = *a2;
        v60 = *(int *)(v35 + 20);
        v61 = (char *)a1 + v60;
        v62 = (char *)a2 + v60;
        v63 = type metadata accessor for REMHashtagLabelSpecifier(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v63 - 8) + 32))(v61, v62, v63);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v36 + 56))(a1, 0, 1, v35);
      }
      v64 = *(int *)(type metadata accessor for TTRRemindersListViewModel.HashtagsState(0) + 20);
      v65 = (char *)a1 + v64;
      v66 = (char *)a2 + v64;
      *(_OWORD *)v65 = *(_OWORD *)v66;
      *((_QWORD *)v65 + 2) = *((_QWORD *)v66 + 2);
      v45 = a1;
      v46 = v6;
      v47 = 7;
      goto LABEL_66;
    case 8u:
      v38 = type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription(0);
      v39 = *(_QWORD *)(v38 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v39 + 48))(a2, 1, v38))
      {
        v40 = type metadata accessor for TTRTemplatePublicLinkData.StateToDisplay(0);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
      }
      else
      {
        v67 = type metadata accessor for Date(0);
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v67 - 8) + 32))(a1, a2, v67);
        *((_BYTE *)a1 + *(int *)(v38 + 20)) = *((_BYTE *)a2 + *(int *)(v38 + 20));
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v39 + 56))(a1, 0, 1, v38);
      }
      v68 = type metadata accessor for TTRTemplatePublicLinkData(0);
      *(_QWORD *)((char *)a1 + *(int *)(v68 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v68 + 20));
      v45 = a1;
      v46 = v6;
      v47 = 8;
      goto LABEL_66;
    case 9u:
      *(_BYTE *)a1 = *(_BYTE *)a2;
      v41 = *(int *)(type metadata accessor for TTRRemindersListTips(0) + 20);
      v42 = (char *)a1 + v41;
      v43 = (char *)a2 + v41;
      v44 = type metadata accessor for AnyTip(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 32))(v42, v43, v44);
      v45 = a1;
      v46 = v6;
      v47 = 9;
LABEL_66:
      swift_storeEnumTagMultiPayload(v45, v46, v47);
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
      break;
  }
  v105 = a3[6];
  *(_QWORD *)((char *)a1 + a3[5]) = *(_QWORD *)((char *)a2 + a3[5]);
  *((_BYTE *)a1 + v105) = *((_BYTE *)a2 + v105);
  v106 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  v107 = (_QWORD *)((char *)a1 + v106);
  v108 = (_QWORD *)((char *)a2 + v106);
  ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
  v110 = *(_QWORD *)(ReminderNotesCellContent - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v110 + 48))(v108, 1, ReminderNotesCellContent))
  {
    v111 = sub_100005DBC(&qword_100025918);
    memcpy(v107, v108, *(_QWORD *)(*(_QWORD *)(v111 - 8) + 64));
  }
  else
  {
    if (swift_getEnumCaseMultiPayload(v108, ReminderNotesCellContent) == 1)
    {
      *v107 = *v108;
      ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      v113 = *(int *)(ReminderView + 20);
      v114 = (char *)v107 + v113;
      v115 = (char *)v108 + v113;
      v116 = type metadata accessor for URL(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v116 - 8) + 32))(v114, v115, v116);
      *(_QWORD *)((char *)v107 + *(int *)(ReminderView + 24)) = *(_QWORD *)((char *)v108 + *(int *)(ReminderView + 24));
      swift_storeEnumTagMultiPayload(v107, ReminderNotesCellContent, 1);
    }
    else
    {
      memcpy(v107, v108, *(_QWORD *)(v110 + 64));
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v110 + 56))(v107, 0, 1, ReminderNotesCellContent);
  }
  return a1;
}

_QWORD *sub_1000092F4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
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
  char *v42;
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int *v73;
  uint64_t v74;
  _OWORD *v75;
  _OWORD *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int *v85;
  uint64_t v86;
  _OWORD *v87;
  _OWORD *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
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
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  _QWORD *v110;
  _QWORD *v111;
  uint64_t ReminderNotesCellContent;
  uint64_t v113;
  uint64_t (*v114)(_QWORD *, uint64_t, uint64_t);
  int v115;
  int v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  char *v120;
  uint64_t v121;
  size_t v122;
  uint64_t ReminderView;
  uint64_t v124;
  char *v125;
  char *v126;
  uint64_t v127;

  if (a1 != a2)
  {
    sub_100008650((uint64_t)a1, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
    v6 = type metadata accessor for TTRRemindersListViewModel.Item(0);
    switch(swift_getEnumCaseMultiPayload(a2, v6))
    {
      case 0u:
        v7 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        switch(swift_getEnumCaseMultiPayload(a2, v7))
        {
          case 2u:
            v8 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
            v9 = a1;
            v10 = v7;
            v11 = 2;
            goto LABEL_34;
          case 3u:
            v69 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v69 - 8) + 32))(a1, a2, v69);
            v9 = a1;
            v10 = v7;
            v11 = 3;
            goto LABEL_34;
          case 4u:
            v70 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v70 - 8) + 32))(a1, a2, v70);
            v9 = a1;
            v10 = v7;
            v11 = 4;
            goto LABEL_34;
          case 5u:
            v71 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v71 - 8) + 32))(a1, a2, v71);
            v9 = a1;
            v10 = v7;
            v11 = 5;
            goto LABEL_34;
          case 6u:
            v72 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v72 - 8) + 32))(a1, a2, v72);
            v9 = a1;
            v10 = v7;
            v11 = 6;
LABEL_34:
            swift_storeEnumTagMultiPayload(v9, v10, v11);
            break;
          default:
            memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
            break;
        }
        v73 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
        v74 = v73[5];
        v75 = (_OWORD *)((char *)a1 + v74);
        v76 = (_OWORD *)((char *)a2 + v74);
        v77 = v76[3];
        v75[2] = v76[2];
        v75[3] = v77;
        v78 = v76[1];
        *v75 = *v76;
        v75[1] = v78;
        *(_OWORD *)((char *)v75 + 106) = *(_OWORD *)((char *)v76 + 106);
        v79 = v76[6];
        v80 = v76[4];
        v75[5] = v76[5];
        v75[6] = v79;
        v75[4] = v80;
        *((_BYTE *)a1 + v73[6]) = *((_BYTE *)a2 + v73[6]);
        *((_BYTE *)a1 + v73[7]) = *((_BYTE *)a2 + v73[7]);
        *((_BYTE *)a1 + v73[8]) = *((_BYTE *)a2 + v73[8]);
        *((_BYTE *)a1 + v73[9]) = *((_BYTE *)a2 + v73[9]);
        *((_BYTE *)a1 + v73[10]) = *((_BYTE *)a2 + v73[10]);
        *(_QWORD *)((char *)a1 + v73[11]) = *(_QWORD *)((char *)a2 + v73[11]);
        v45 = a1;
        v46 = v6;
        v47 = 0;
        goto LABEL_67;
      case 1u:
        v12 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        switch(swift_getEnumCaseMultiPayload(a2, v12))
        {
          case 2u:
            v13 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a1, a2, v13);
            v14 = a1;
            v15 = v12;
            v16 = 2;
            goto LABEL_41;
          case 3u:
            v81 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v81 - 8) + 32))(a1, a2, v81);
            v14 = a1;
            v15 = v12;
            v16 = 3;
            goto LABEL_41;
          case 4u:
            v82 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v82 - 8) + 32))(a1, a2, v82);
            v14 = a1;
            v15 = v12;
            v16 = 4;
            goto LABEL_41;
          case 5u:
            v83 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v83 - 8) + 32))(a1, a2, v83);
            v14 = a1;
            v15 = v12;
            v16 = 5;
            goto LABEL_41;
          case 6u:
            v84 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v84 - 8) + 32))(a1, a2, v84);
            v14 = a1;
            v15 = v12;
            v16 = 6;
LABEL_41:
            swift_storeEnumTagMultiPayload(v14, v15, v16);
            break;
          default:
            memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
            break;
        }
        v85 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
        v86 = v85[5];
        v87 = (_OWORD *)((char *)a1 + v86);
        v88 = (_OWORD *)((char *)a2 + v86);
        v89 = v88[3];
        v87[2] = v88[2];
        v87[3] = v89;
        v90 = v88[1];
        *v87 = *v88;
        v87[1] = v90;
        *(_OWORD *)((char *)v87 + 106) = *(_OWORD *)((char *)v88 + 106);
        v91 = v88[6];
        v92 = v88[4];
        v87[5] = v88[5];
        v87[6] = v91;
        v87[4] = v92;
        *((_BYTE *)a1 + v85[6]) = *((_BYTE *)a2 + v85[6]);
        *((_BYTE *)a1 + v85[7]) = *((_BYTE *)a2 + v85[7]);
        *((_BYTE *)a1 + v85[8]) = *((_BYTE *)a2 + v85[8]);
        *((_BYTE *)a1 + v85[9]) = *((_BYTE *)a2 + v85[9]);
        *((_BYTE *)a1 + v85[10]) = *((_BYTE *)a2 + v85[10]);
        *(_QWORD *)((char *)a1 + v85[11]) = *(_QWORD *)((char *)a2 + v85[11]);
        v45 = a1;
        v46 = v6;
        v47 = 1;
        goto LABEL_67;
      case 2u:
        *a1 = *a2;
        v17 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v18 = (char *)a1 + v17;
        v19 = (char *)a2 + v17;
        v20 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v21 = *(_QWORD *)(v20 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
        {
          v22 = sub_100005DBC(&qword_100025908);
          memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v19, v20))
          {
            case 2u:
              v48 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v48 - 8) + 32))(v18, v19, v48);
              v49 = v18;
              v50 = v20;
              v51 = 2;
              goto LABEL_48;
            case 3u:
              v93 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v93 - 8) + 32))(v18, v19, v93);
              v49 = v18;
              v50 = v20;
              v51 = 3;
              goto LABEL_48;
            case 4u:
              v94 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v94 - 8) + 32))(v18, v19, v94);
              v49 = v18;
              v50 = v20;
              v51 = 4;
              goto LABEL_48;
            case 5u:
              v95 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v95 - 8) + 32))(v18, v19, v95);
              v49 = v18;
              v50 = v20;
              v51 = 5;
              goto LABEL_48;
            case 6u:
              v96 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v96 - 8) + 32))(v18, v19, v96);
              v49 = v18;
              v50 = v20;
              v51 = 6;
LABEL_48:
              swift_storeEnumTagMultiPayload(v49, v50, v51);
              break;
            default:
              memcpy(v18, v19, *(_QWORD *)(v21 + 64));
              break;
          }
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
        }
        v45 = a1;
        v46 = v6;
        v47 = 2;
        goto LABEL_67;
      case 3u:
        *a1 = *a2;
        v23 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v24 = (char *)a1 + v23;
        v25 = (char *)a2 + v23;
        v26 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v27 = *(_QWORD *)(v26 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
        {
          v28 = sub_100005DBC(&qword_100025908);
          memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v25, v26))
          {
            case 2u:
              v52 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 32))(v24, v25, v52);
              v53 = v24;
              v54 = v26;
              v55 = 2;
              goto LABEL_56;
            case 3u:
              v97 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v97 - 8) + 32))(v24, v25, v97);
              v53 = v24;
              v54 = v26;
              v55 = 3;
              goto LABEL_56;
            case 4u:
              v98 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v98 - 8) + 32))(v24, v25, v98);
              v53 = v24;
              v54 = v26;
              v55 = 4;
              goto LABEL_56;
            case 5u:
              v99 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v99 - 8) + 32))(v24, v25, v99);
              v53 = v24;
              v54 = v26;
              v55 = 5;
              goto LABEL_56;
            case 6u:
              v100 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v100 - 8) + 32))(v24, v25, v100);
              v53 = v24;
              v54 = v26;
              v55 = 6;
LABEL_56:
              swift_storeEnumTagMultiPayload(v53, v54, v55);
              break;
            default:
              memcpy(v24, v25, *(_QWORD *)(v27 + 64));
              break;
          }
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
        }
        v45 = a1;
        v46 = v6;
        v47 = 3;
        goto LABEL_67;
      case 4u:
        *a1 = *a2;
        v29 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v30 = (char *)a1 + v29;
        v31 = (char *)a2 + v29;
        v32 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v33 = *(_QWORD *)(v32 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
        {
          v34 = sub_100005DBC(&qword_100025908);
          memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v31, v32))
          {
            case 2u:
              v56 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 32))(v30, v31, v56);
              v57 = v30;
              v58 = v32;
              v59 = 2;
              goto LABEL_64;
            case 3u:
              v101 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v101 - 8) + 32))(v30, v31, v101);
              v57 = v30;
              v58 = v32;
              v59 = 3;
              goto LABEL_64;
            case 4u:
              v102 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v102 - 8) + 32))(v30, v31, v102);
              v57 = v30;
              v58 = v32;
              v59 = 4;
              goto LABEL_64;
            case 5u:
              v103 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v103 - 8) + 32))(v30, v31, v103);
              v57 = v30;
              v58 = v32;
              v59 = 5;
              goto LABEL_64;
            case 6u:
              v104 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v104 - 8) + 32))(v30, v31, v104);
              v57 = v30;
              v58 = v32;
              v59 = 6;
LABEL_64:
              swift_storeEnumTagMultiPayload(v57, v58, v59);
              break;
            default:
              memcpy(v30, v31, *(_QWORD *)(v33 + 64));
              break;
          }
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
        }
        v45 = a1;
        v46 = v6;
        v47 = 4;
        goto LABEL_67;
      case 7u:
        v35 = type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState(0);
        v36 = *(_QWORD *)(v35 - 8);
        if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v36 + 48))(a2, 1, v35))
        {
          v37 = sub_100005DBC(&qword_100025910);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
        }
        else
        {
          *a1 = *a2;
          v60 = *(int *)(v35 + 20);
          v61 = (char *)a1 + v60;
          v62 = (char *)a2 + v60;
          v63 = type metadata accessor for REMHashtagLabelSpecifier(0);
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v63 - 8) + 32))(v61, v62, v63);
          (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v36 + 56))(a1, 0, 1, v35);
        }
        v64 = *(int *)(type metadata accessor for TTRRemindersListViewModel.HashtagsState(0) + 20);
        v65 = (char *)a1 + v64;
        v66 = (char *)a2 + v64;
        *(_OWORD *)v65 = *(_OWORD *)v66;
        *((_QWORD *)v65 + 2) = *((_QWORD *)v66 + 2);
        v45 = a1;
        v46 = v6;
        v47 = 7;
        goto LABEL_67;
      case 8u:
        v38 = type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription(0);
        v39 = *(_QWORD *)(v38 - 8);
        if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v39 + 48))(a2, 1, v38))
        {
          v40 = type metadata accessor for TTRTemplatePublicLinkData.StateToDisplay(0);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
        }
        else
        {
          v67 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v67 - 8) + 32))(a1, a2, v67);
          *((_BYTE *)a1 + *(int *)(v38 + 20)) = *((_BYTE *)a2 + *(int *)(v38 + 20));
          (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v39 + 56))(a1, 0, 1, v38);
        }
        v68 = type metadata accessor for TTRTemplatePublicLinkData(0);
        *(_QWORD *)((char *)a1 + *(int *)(v68 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v68 + 20));
        v45 = a1;
        v46 = v6;
        v47 = 8;
        goto LABEL_67;
      case 9u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v41 = *(int *)(type metadata accessor for TTRRemindersListTips(0) + 20);
        v42 = (char *)a1 + v41;
        v43 = (char *)a2 + v41;
        v44 = type metadata accessor for AnyTip(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 32))(v42, v43, v44);
        v45 = a1;
        v46 = v6;
        v47 = 9;
LABEL_67:
        swift_storeEnumTagMultiPayload(v45, v46, v47);
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
        break;
    }
  }
  v105 = a3[5];
  v106 = *(void **)((char *)a1 + v105);
  *(_QWORD *)((char *)a1 + v105) = *(_QWORD *)((char *)a2 + v105);

  v107 = a3[7];
  *((_BYTE *)a1 + a3[6]) = *((_BYTE *)a2 + a3[6]);
  v108 = *(_QWORD *)((char *)a1 + v107);
  *(_QWORD *)((char *)a1 + v107) = *(_QWORD *)((char *)a2 + v107);
  swift_bridgeObjectRelease(v108);
  v109 = a3[8];
  v110 = (_QWORD *)((char *)a1 + v109);
  v111 = (_QWORD *)((char *)a2 + v109);
  ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
  v113 = *(_QWORD *)(ReminderNotesCellContent - 8);
  v114 = *(uint64_t (**)(_QWORD *, uint64_t, uint64_t))(v113 + 48);
  v115 = v114(v110, 1, ReminderNotesCellContent);
  v116 = v114(v111, 1, ReminderNotesCellContent);
  if (!v115)
  {
    if (!v116)
    {
      if (a1 == a2)
        return a1;
      sub_100008650((uint64_t)v110, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
      if (swift_getEnumCaseMultiPayload(v111, ReminderNotesCellContent) == 1)
      {
        *v110 = *v111;
        ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
        v124 = *(int *)(ReminderView + 20);
        v125 = (char *)v110 + v124;
        v126 = (char *)v111 + v124;
        v127 = type metadata accessor for URL(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v127 - 8) + 32))(v125, v126, v127);
        *(_QWORD *)((char *)v110 + *(int *)(ReminderView + 24)) = *(_QWORD *)((char *)v111 + *(int *)(ReminderView + 24));
        swift_storeEnumTagMultiPayload(v110, ReminderNotesCellContent, 1);
        return a1;
      }
      v122 = *(_QWORD *)(v113 + 64);
      goto LABEL_75;
    }
    sub_100008650((uint64_t)v110, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
LABEL_74:
    v122 = *(_QWORD *)(*(_QWORD *)(sub_100005DBC(&qword_100025918) - 8) + 64);
LABEL_75:
    memcpy(v110, v111, v122);
    return a1;
  }
  if (v116)
    goto LABEL_74;
  if (swift_getEnumCaseMultiPayload(v111, ReminderNotesCellContent) == 1)
  {
    *v110 = *v111;
    v117 = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
    v118 = *(int *)(v117 + 20);
    v119 = (char *)v110 + v118;
    v120 = (char *)v111 + v118;
    v121 = type metadata accessor for URL(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v121 - 8) + 32))(v119, v120, v121);
    *(_QWORD *)((char *)v110 + *(int *)(v117 + 24)) = *(_QWORD *)((char *)v111 + *(int *)(v117 + 24));
    swift_storeEnumTagMultiPayload(v110, ReminderNotesCellContent, 1);
  }
  else
  {
    memcpy(v110, v111, *(_QWORD *)(v113 + 64));
  }
  (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v113 + 56))(v110, 0, 1, ReminderNotesCellContent);
  return a1;
}

uint64_t sub_10000A048(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000A054);
}

uint64_t sub_10000A054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;
  int v10;
  uint64_t v11;

  v6 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, a2, v6);
  if ((_DWORD)a2 == 2147483646)
  {
    v9 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
    if (v9 >= 0xFFFFFFFF)
      LODWORD(v9) = -1;
    v10 = v9 - 1;
    if (v10 < 0)
      v10 = -1;
    return (v10 + 1);
  }
  else
  {
    v11 = sub_100005DBC(&qword_100025918);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(a1 + *(int *)(a3 + 32), a2, v11);
  }
}

uint64_t sub_10000A10C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000A118);
}

uint64_t sub_10000A118(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = type metadata accessor for TTRRemindersListViewModel.Item(0);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 2147483646)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = a2;
      return result;
    }
    v10 = sub_100005DBC(&qword_100025918);
    v12 = a1 + *(int *)(a4 + 32);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState(uint64_t a1)
{
  return sub_10000A1D4(a1, (uint64_t *)&unk_100025978, (uint64_t)&nominal type descriptor for TTRIExtensionCreateReminderNotesCellContentState);
}

uint64_t sub_10000A1D4(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata(a1, a3);
  return result;
}

void sub_10000A208(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[5];

  v2 = type metadata accessor for TTRRemindersListViewModel.Item(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    v6[1] = &unk_10001B788;
    v6[2] = &unk_10001B7F8;
    v6[3] = &unk_10001B788;
    sub_10000A2A0(319);
    if (v5 <= 0x3F)
    {
      v6[4] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 5, v6, a1 + 16);
    }
  }
}

void sub_10000A2A0(uint64_t a1)
{
  uint64_t ReminderNotesCellContent;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100025988)
  {
    ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(255);
    v3 = type metadata accessor for Optional(a1, ReminderNotesCellContent);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100025988);
  }
}

char *sub_10000A2F4(char *a1, char **a2, uint64_t a3)
{
  int v5;
  char *v7;
  uint64_t ReminderView;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char v23;
  char *v24;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v21 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = &v21[(v5 + 16) & ~(unint64_t)v5];
    swift_retain(v21);
  }
  else
  {
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v7 = *a2;
      *(_QWORD *)a1 = *a2;
      ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      v9 = *(int *)(ReminderView + 20);
      v10 = &a1[v9];
      v11 = (uint64_t)a2 + v9;
      v12 = type metadata accessor for URL(0);
      v13 = *(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 16);
      v14 = v7;
      v13(v10, v11, v12);
      v15 = *(int *)(ReminderView + 24);
      v16 = *(char **)((char *)a2 + v15);
      *(_QWORD *)&a1[v15] = v16;
      v17 = v16;
      v18 = a1;
      v19 = a3;
      v20 = 1;
    }
    else
    {
      v22 = *a2;
      v23 = *((_BYTE *)a2 + 8);
      v24 = v22;
      *(_QWORD *)a1 = v22;
      a1[8] = v23;
      v18 = a1;
      v19 = a3;
      v20 = 0;
    }
    swift_storeEnumTagMultiPayload(v18, v19, v20);
  }
  return a1;
}

void sub_10000A410(id *a1, uint64_t a2)
{
  uint64_t ReminderView;
  char *v4;
  uint64_t v5;
  id v6;

  if (swift_getEnumCaseMultiPayload(a1, a2) == 1)
  {

    ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
    v4 = (char *)a1 + *(int *)(ReminderView + 20);
    v5 = type metadata accessor for URL(0);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
    v6 = *(id *)((char *)a1 + *(int *)(ReminderView + 24));
  }
  else
  {
    v6 = *a1;
  }

}

uint64_t sub_10000A498(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t ReminderView;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    v6 = *(void **)a2;
    *(_QWORD *)a1 = *(_QWORD *)a2;
    ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
    v8 = *(int *)(ReminderView + 20);
    v9 = a1 + v8;
    v10 = a2 + v8;
    v11 = type metadata accessor for URL(0);
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v13 = v6;
    v12(v9, v10, v11);
    v14 = *(int *)(ReminderView + 24);
    v15 = *(void **)(a2 + v14);
    *(_QWORD *)(a1 + v14) = v15;
    v16 = v15;
    v17 = 1;
  }
  else
  {
    v18 = *(void **)a2;
    v19 = *(_BYTE *)(a2 + 8);
    v20 = v18;
    v17 = 0;
    *(_QWORD *)a1 = v18;
    *(_BYTE *)(a1 + 8) = v19;
  }
  swift_storeEnumTagMultiPayload(a1, a3, v17);
  return a1;
}

uint64_t sub_10000A580(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t ReminderView;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  char v19;
  id v20;

  if (a1 != a2)
  {
    sub_100008650(a1, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      v6 = *(void **)a2;
      *(_QWORD *)a1 = *(_QWORD *)a2;
      ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      v8 = *(int *)(ReminderView + 20);
      v9 = a1 + v8;
      v10 = a2 + v8;
      v11 = type metadata accessor for URL(0);
      v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
      v13 = v6;
      v12(v9, v10, v11);
      v14 = *(int *)(ReminderView + 24);
      v15 = *(void **)(a2 + v14);
      *(_QWORD *)(a1 + v14) = v15;
      v16 = v15;
      v17 = 1;
    }
    else
    {
      v18 = *(void **)a2;
      v19 = *(_BYTE *)(a2 + 8);
      v20 = v18;
      v17 = 0;
      *(_QWORD *)a1 = v18;
      *(_BYTE *)(a1 + 8) = v19;
    }
    swift_storeEnumTagMultiPayload(a1, a3, v17);
  }
  return a1;
}

_QWORD *sub_10000A680(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t ReminderView;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
  {
    *a1 = *a2;
    ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
    v7 = *(int *)(ReminderView + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = type metadata accessor for URL(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
    *(_QWORD *)((char *)a1 + *(int *)(ReminderView + 24)) = *(_QWORD *)((char *)a2 + *(int *)(ReminderView + 24));
    swift_storeEnumTagMultiPayload(a1, a3, 1);
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
  }
  return a1;
}

_QWORD *sub_10000A740(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t ReminderView;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;

  if (a1 != a2)
  {
    sub_100008650((uint64_t)a1, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
    if (swift_getEnumCaseMultiPayload(a2, a3) == 1)
    {
      *a1 = *a2;
      ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      v7 = *(int *)(ReminderView + 20);
      v8 = (char *)a1 + v7;
      v9 = (char *)a2 + v7;
      v10 = type metadata accessor for URL(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 32))(v8, v9, v10);
      *(_QWORD *)((char *)a1 + *(int *)(ReminderView + 24)) = *(_QWORD *)((char *)a2 + *(int *)(ReminderView + 24));
      swift_storeEnumTagMultiPayload(a1, a3, 1);
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(a3 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_10000A818(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_10000A824(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_10000A834(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_storeEnumTagMultiPayload(a1, a3, a2);
}

uint64_t sub_10000A844(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = "\t";
  result = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    swift_initEnumMetadataMultiPayload(a1, 256, 2, v4);
    return 0;
  }
  return result;
}

NSNumber sub_10000A8B4()
{
  return Float._bridgeToObjectiveC()();
}

uint64_t sub_10000A8BC(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  char v4;
  int v5;
  int v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = static Float._forceBridgeFromObjectiveC(_:result:)(a1, &v6);
  v4 = v7;
  v5 = v6;
  if (v7)
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v4;
  return result;
}

uint64_t sub_10000A90C(uint64_t a1, uint64_t a2)
{
  char v3;
  char v4;
  int v5;
  int v7;
  char v8;

  v7 = 0;
  v8 = 1;
  v3 = static Float._conditionallyBridgeFromObjectiveC(_:result:)(a1, &v7);
  v4 = v8;
  v5 = v7;
  if (v8)
    v5 = 0;
  *(_DWORD *)a2 = v5;
  *(_BYTE *)(a2 + 4) = v4;
  return v3 & 1;
}

void sub_10000A960(float *a1@<X8>)
{
  *a1 = static Float._unconditionallyBridgeFromObjectiveC(_:)();
}

_DWORD *sub_10000A984@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_DWORD *)a2 = *result;
  *(_BYTE *)(a2 + 4) = 0;
  return result;
}

float sub_10000A994@<S0>(_DWORD *a1@<X8>)
{
  float *v1;
  float result;

  result = *v1;
  *a1 = *(_DWORD *)v1;
  return result;
}

uint64_t sub_10000A9A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = sub_10000BD24(&qword_100025B20, (uint64_t)&unk_10001B988);
  v3 = sub_10000BD24(&qword_100025B28, (uint64_t)&unk_10001B928);
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for Float);
}

uint64_t sub_10000AA24()
{
  float *v0;

  return Float.hashValue.getter(*v0);
}

void sub_10000AA2C()
{
  Swift::UInt32 *v0;
  Swift::UInt32 v1;

  if ((*v0 & 0x7FFFFFFF) != 0)
    v1 = *v0;
  else
    v1 = 0;
  Hasher._combine(_:)(v1);
}

uint64_t sub_10000AA5C(uint64_t a1)
{
  _DWORD *v1;
  uint64_t v2;

  if ((*v1 & 0x7FFFFFFF) != 0)
    v2 = *v1;
  else
    v2 = 0;
  return static Hasher._hash(seed:bytes:count:)(a1, v2, 4);
}

BOOL sub_10000AA70(float *a1, float *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10000AA84(uint64_t a1, uint64_t a2)
{
  uint64_t ReminderView;
  uint64_t v5;
  _QWORD *v6;
  uint64_t ReminderNotesCellContent;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  id v27;
  id v28;
  char v29;
  void *v30;
  id v31;
  id v32;
  char v33;
  uint64_t v35;

  ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  __chkstk_darwin(ReminderView);
  v6 = (uint64_t *)((char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
  v8 = __chkstk_darwin(ReminderNotesCellContent);
  v10 = (uint64_t *)((char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v8);
  v12 = (char *)&v35 - v11;
  v13 = sub_100005DBC(&qword_100025A90);
  v14 = __chkstk_darwin(v13);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = (uint64_t)&v16[*(int *)(v14 + 48)];
  sub_10000B5C8(a1, (uint64_t)v16, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
  sub_10000B5C8(a2, v17, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
  if (swift_getEnumCaseMultiPayload(v16, ReminderNotesCellContent) != 1)
  {
    sub_10000B5C8((uint64_t)v16, (uint64_t)v12, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
    v24 = *(void **)v12;
    v25 = v12[8];
    if (swift_getEnumCaseMultiPayload(v17, ReminderNotesCellContent) == 1)
    {

      goto LABEL_12;
    }
    v26 = *(void **)v17;
    if ((v25 & 1) != 0)
    {
      if ((*(_BYTE *)(v17 + 8) & 1) != 0)
      {
        if (!v24)
        {

          if (!v26)
          {

            goto LABEL_34;
          }

          v30 = 0;
          goto LABEL_23;
        }
        if (v26)
        {
          sub_10000B938(0, &qword_100025AA8, UIImage_ptr);
          v27 = v24;
          v28 = v26;
          v29 = static NSObject.== infix(_:_:)(v24, v26);

          if ((v29 & 1) != 0)
            goto LABEL_34;
          goto LABEL_28;
        }
      }
      else
      {

      }
      v30 = v24;
    }
    else
    {
      if ((*(_BYTE *)(v17 + 8) & 1) == 0)
      {
        sub_10000B938(0, &qword_100025A98, NSObject_ptr);
        v31 = v24;
        v32 = v26;
        v33 = static NSObject.== infix(_:_:)(v24, v26);

        if ((v33 & 1) != 0)
          goto LABEL_34;
        goto LABEL_28;
      }

      v30 = v24;
    }
LABEL_23:

LABEL_28:
    sub_100008650((uint64_t)v16, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
    return 0;
  }
  sub_10000B5C8((uint64_t)v16, (uint64_t)v10, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
  if (swift_getEnumCaseMultiPayload(v17, ReminderNotesCellContent) == 1)
  {
    sub_10000B584(v17, (uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
    sub_10000B938(0, &qword_100025A98, NSObject_ptr);
    if ((static NSObject.== infix(_:_:)(*v10, *v6) & 1) != 0
      && (static URL.== infix(_:_:)((char *)v10 + *(int *)(ReminderView + 20), (char *)v6 + *(int *)(ReminderView + 20)) & 1) != 0)
    {
      v18 = *(int *)(ReminderView + 24);
      v19 = *(void **)((char *)v10 + v18);
      v20 = *(void **)((char *)v6 + v18);
      if (v19)
      {
        if (v20)
        {
          sub_10000B938(0, &qword_100025AA0, LPLinkMetadata_ptr);
          v21 = v20;
          v22 = v19;
          v23 = static NSObject.== infix(_:_:)(v22, v21);

          if ((v23 & 1) != 0)
            goto LABEL_8;
        }
      }
      else if (!v20)
      {
LABEL_8:
        sub_100008650((uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
        sub_100008650((uint64_t)v10, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
LABEL_34:
        sub_100008650((uint64_t)v16, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
        return 1;
      }
    }
    sub_100008650((uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
    sub_100008650((uint64_t)v10, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
    goto LABEL_28;
  }
  sub_100008650((uint64_t)v10, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
LABEL_12:
  sub_10000BA94((uint64_t)v16, &qword_100025A90);
  return 0;
}

BOOL sub_10000AEEC(uint64_t a1, uint64_t a2)
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
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char v24;
  int *ReminderNotesCellContentState;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  uint64_t v40;
  uint64_t v41;
  uint64_t ReminderNotesCellContent;
  uint64_t v43;

  ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
  v4 = *(_QWORD *)(ReminderNotesCellContent - 8);
  __chkstk_darwin(ReminderNotesCellContent);
  v40 = (uint64_t)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100005DBC(&qword_100025A80);
  __chkstk_darwin(v6);
  v43 = (uint64_t)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100005DBC(&qword_100025918);
  v9 = __chkstk_darwin(v8);
  v41 = (uint64_t)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v40 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v40 - v14;
  v16 = type metadata accessor for TTRRemindersListViewModel.ItemID(0);
  v17 = __chkstk_darwin(v16);
  v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __chkstk_darwin(v17);
  v22 = (char *)&v40 - v21;
  v23 = TTRRemindersListViewModel.Item.treeItemIdentifier.getter(v20);
  TTRRemindersListViewModel.Item.treeItemIdentifier.getter(v23);
  v24 = static TTRRemindersListViewModel.ItemID.__derived_enum_equals(_:_:)(v22, v19);
  sub_100008650((uint64_t)v19, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.ItemID);
  sub_100008650((uint64_t)v22, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.ItemID);
  if ((v24 & 1) == 0)
    return 0;
  ReminderNotesCellContentState = (int *)type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState(0);
  v26 = ReminderNotesCellContentState[5];
  v27 = *(void **)(a1 + v26);
  v28 = *(void **)(a2 + v26);
  if (v27)
  {
    if (!v28)
      return 0;
    sub_10000B938(0, &qword_100025A88, NSAttributedString_ptr);
    v29 = v28;
    v30 = v27;
    v31 = static NSObject.== infix(_:_:)(v30, v29);

    if ((v31 & 1) == 0)
      return 0;
  }
  else if (v28)
  {
    return 0;
  }
  if (*(unsigned __int8 *)(a1 + ReminderNotesCellContentState[6]) != *(unsigned __int8 *)(a2
                                                                                         + ReminderNotesCellContentState[6])
    || (static TTRReminderCellInlineHashtagVisibility.__derived_enum_equals(_:_:)(*(_QWORD *)(a1 + ReminderNotesCellContentState[7]), *(_QWORD *)(a2 + ReminderNotesCellContentState[7])) & 1) == 0)
  {
    return 0;
  }
  sub_10000BAD0(a1 + ReminderNotesCellContentState[8], (uint64_t)v15, &qword_100025918);
  sub_10000BAD0(a2 + ReminderNotesCellContentState[8], (uint64_t)v13, &qword_100025918);
  v32 = v43;
  v33 = v43 + *(int *)(v6 + 48);
  sub_10000BAD0((uint64_t)v15, v43, &qword_100025918);
  sub_10000BAD0((uint64_t)v13, v33, &qword_100025918);
  v34 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48);
  v35 = ReminderNotesCellContent;
  if (v34(v32, 1, ReminderNotesCellContent) == 1)
  {
    sub_10000BA94((uint64_t)v13, &qword_100025918);
    sub_10000BA94((uint64_t)v15, &qword_100025918);
    if (v34(v33, 1, v35) == 1)
    {
      sub_10000BA94(v32, &qword_100025918);
      return 1;
    }
    goto LABEL_14;
  }
  v36 = v41;
  sub_10000BAD0(v32, v41, &qword_100025918);
  if (v34(v33, 1, v35) == 1)
  {
    sub_10000BA94((uint64_t)v13, &qword_100025918);
    sub_10000BA94((uint64_t)v15, &qword_100025918);
    sub_100008650(v36, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
LABEL_14:
    sub_10000BA94(v32, &qword_100025A80);
    return 0;
  }
  v37 = v40;
  sub_10000B584(v33, v40, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
  v38 = sub_10000AA84(v36, v37);
  sub_100008650(v37, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
  sub_10000BA94((uint64_t)v13, &qword_100025918);
  sub_10000BA94((uint64_t)v15, &qword_100025918);
  sub_100008650(v36, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment);
  sub_10000BA94(v32, &qword_100025918);
  return (v38 & 1) != 0;
}

id sub_10000B308(unsigned __int8 a1)
{
  _QWORD *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t ReminderNotesCellContentState;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  id result;
  uint64_t v14;
  _QWORD *v15;
  id v16;
  uint64_t v17;
  _BYTE v18[24];
  _BYTE v19[24];

  v2 = a1;
  v3 = sub_100005DBC(&qword_100025A70);
  v4 = __chkstk_darwin(v3);
  v6 = &v18[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  v8 = &v18[-v7];
  ReminderNotesCellContentState = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState(0);
  v10 = *(_QWORD *)(ReminderNotesCellContentState - 8);
  __chkstk_darwin(ReminderNotesCellContentState);
  v12 = &v18[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  result = sub_100003578();
  if (v2 == 3)
  {
    v14 = (uint64_t)v1 + *(_QWORD *)((swift_isaMask & *v1) + 0x78);
    swift_beginAccess(v14, v19, 0, 0);
    sub_10000BAD0(v14, (uint64_t)v8, &qword_100025A70);
    if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48))(v8, 1, ReminderNotesCellContentState) == 1)
    {
      return (id)sub_10000BA94((uint64_t)v8, &qword_100025A70);
    }
    else
    {
      sub_10000B584((uint64_t)v8, (uint64_t)v12, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState);
      v15 = (_QWORD *)((char *)v1 + *(_QWORD *)((swift_isaMask & *v1) + 0x68));
      swift_beginAccess(v15, v18, 0, 0);
      if (!*v15
        || (v16 = objc_msgSend(*(id *)(*v15 + qword_100025710), "attributedText")) == 0)
      {
        v16 = objc_msgSend(objc_allocWithZone((Class)NSAttributedString), "init");
      }
      v17 = *(int *)(ReminderNotesCellContentState + 20);

      *(_QWORD *)&v12[v17] = v16;
      sub_10000B5C8((uint64_t)v12, (uint64_t)v6, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, ReminderNotesCellContentState);
      TTRITableCellContent.setStateWithoutUpdatingCell(_:)(v6);
      sub_10000BA94((uint64_t)v6, &qword_100025A70);
      return (id)sub_100008650((uint64_t)v12, type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState);
    }
  }
  return result;
}

uint64_t sub_10000B53C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005DBC(&qword_100025A78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000B584(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000B5C8(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

id sub_10000B60C(void **a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t ReminderView;
  void *v9;
  id v10;
  void *v11;
  id v12;
  double v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v19;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, (char *)a1 + *(int *)(ReminderView + 20), v4);
  v9 = *a1;
  v10 = objc_allocWithZone((Class)type metadata accessor for TTRIRemindersListReminderCellLinkView(0));
  v11 = (void *)TTRIRemindersListReminderCellLinkView.init(url:attachmentID:)(v7, v9);
  objc_msgSend(v11, "_setApplyCornerRadius:", 1);
  objc_msgSend(v11, "_setPreferredSizeClass:", 4);
  v12 = objc_msgSend(v11, "layer");
  if (qword_100025570 != -1)
    swift_once(&qword_100025570, sub_10000481C, v13);
  objc_msgSend(v12, "setCornerRadius:", *(double *)&qword_100025578);

  v14 = objc_msgSend(v11, "layer");
  objc_msgSend(v14, "setMasksToBounds:", 1);

  objc_msgSend(v11, "setUserInteractionEnabled:", 0);
  v15 = a2 + qword_100025730;
  v16 = *(void **)(a2 + qword_100025730);
  *(_QWORD *)v15 = v11;
  *(_BYTE *)(v15 + 8) = 1;
  v17 = v11;

  sub_10000383C();
  return v17;
}

double sub_10000B7B8(void *a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t Strong;
  unsigned __int8 *v8;
  void *v9;
  double v11;
  double v12;
  double v13;
  int v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  Strong = swift_unknownObjectWeakLoadStrong(v3+ OBJC_IVAR____TtC25RemindersSharingExtensionP33_8326BBA138680702F00C183C494E669A18CustomSizeMeasurer_hostCell);
  if (!Strong)
    return *(double *)CGSize.nuiUseDefault.unsafeMutableAddressor();
  v8 = (unsigned __int8 *)Strong;
  if (*(void **)(Strong + qword_100025710) == a1)
  {
    objc_msgSend(a1, "effectiveLayoutSizeFittingSize:", a2, a3);
    v12 = v13;
    v14 = v8[qword_100025730 + 8];
    v15 = *(id *)&v8[qword_100025730];

    if (v14)
    {
      if (v14 == 1)

    }
    else
    {

    }
  }
  else
  {
    v9 = *(void **)(Strong + qword_100025730);
    if (*(_BYTE *)(Strong + qword_100025730 + 8))
    {
      if (*(_BYTE *)(Strong + qword_100025730 + 8) != 1 || v9 != a1)
        goto LABEL_15;
      objc_msgSend(a1, "effectiveLayoutSizeFittingSize:", a2, 120.0);
      v12 = v11;

    }
    else
    {
      if (v9 != a1)
      {
LABEL_15:
        v12 = *(double *)CGSize.nuiUseDefault.unsafeMutableAddressor();

        return v12;
      }
      objc_msgSend(a1, "effectiveLayoutSizeFittingSize:", a2, a3);
      v17 = v16;
      v19 = v18;

      if (v17 > v19)
        v20 = v17;
      else
        v20 = v19;
      return fmin(v20, 88.0);
    }
  }
  return v12;
}

uint64_t sub_10000B938(uint64_t a1, unint64_t *a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v5;

  result = *a2;
  if (!*a2)
  {
    v5 = objc_opt_self(*a3);
    result = swift_getObjCClassMetadata(v5);
    atomic_store(result, a2);
  }
  return result;
}

unint64_t sub_10000B970()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100025AF0;
  if (!qword_100025AF0)
  {
    v1 = sub_10000B9BC(&qword_100025AE8);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_100025AF0);
  }
  return result;
}

uint64_t sub_10000B9BC(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = swift_getTypeByMangledNameInContextInMetadataState2(255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000BA00()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_10000BA24()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(v0 + 16) + qword_100025730;
  v2 = *(void **)v1;
  *(_QWORD *)v1 = 0;
  *(_BYTE *)(v1 + 8) = 2;

  sub_10000383C();
}

uint64_t sub_10000BA64()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000BA74()
{
  uint64_t v0;

  return sub_1000178D4(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t sub_10000BA7C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_10000BA8C(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_10000BA94(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100005DBC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10000BAD0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005DBC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000BB14()
{
  uint64_t v0;

  return swift_deallocObject(v0, 48, 7);
}

void sub_10000BB44()
{
  uint64_t v0;

  sub_100003C84(*(_QWORD *)(v0 + 16), *(void **)(v0 + 24), *(_BYTE *)(v0 + 32));
}

uint64_t sub_10000BB54()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000BB64()
{
  uint64_t v0;
  uint64_t ReminderView;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  v2 = *(_QWORD *)(ReminderView - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v3 | 7;
  v6 = ((*(_QWORD *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;

  v7 = v0 + v4;
  v8 = v0 + v4 + *(int *)(ReminderView + 20);
  v9 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);

  return swift_deallocObject(v0, v6, v5);
}

void sub_10000BC10()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0) - 8)
                          + 80);
  sub_100003E18(*(_QWORD *)(v0 + 16), v0 + ((v1 + 24) & ~v1));
}

uint64_t sub_10000BC54()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

void type metadata accessor for UILayoutPriority()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_100025B00)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, &unk_100021058);
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100025B00);
  }
}

uint64_t sub_10000BCB8()
{
  return sub_10000BD24(&qword_100025B08, (uint64_t)&unk_10001B8EC);
}

uint64_t sub_10000BCDC()
{
  return sub_10000BD24(&qword_100025B10, (uint64_t)&unk_10001B8C0);
}

uint64_t sub_10000BD00()
{
  return sub_10000BD24(&qword_100025B18, (uint64_t)&unk_10001B95C);
}

uint64_t sub_10000BD24(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for UILayoutPriority();
    result = swift_getWitnessTable(a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000BD7C()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  uint64_t v3;

  v0 = type metadata accessor for Logger(0);
  sub_10000CFE8(v0, qword_100025B90);
  v1 = sub_10000CF9C(v0, (uint64_t)qword_100025B90);
  if (qword_100025598 != -1)
    swift_once(&qword_100025598, sub_1000171D0, v2);
  v3 = sub_10000CF9C(v0, (uint64_t)qword_100026230);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v3, v0);
}

void sub_10000BE0C()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  Class isa;
  objc_super v38;

  v38.receiver = v0;
  v38.super_class = (Class)type metadata accessor for TTRISERootViewController();
  objc_msgSendSuper2(&v38, "loadView");
  v1 = (void *)sub_10000C758(0, (uint64_t)v0, 0);
  v3 = v2;
  v4 = &v0[OBJC_IVAR____TtC25RemindersSharingExtension24TTRISERootViewController_extensionCreateReminderInterface];
  v5 = *(_QWORD *)&v0[OBJC_IVAR____TtC25RemindersSharingExtension24TTRISERootViewController_extensionCreateReminderInterface];
  *(_QWORD *)v4 = v2;
  *((_QWORD *)v4 + 1) = v6;
  swift_unknownObjectRetain(v2);
  swift_unknownObjectRelease(v5);
  v7 = objc_msgSend(objc_allocWithZone((Class)UINavigationController), "initWithRootViewController:", v1);
  v8 = objc_msgSend(v7, "view");
  if (!v8)
  {
    __break(1u);
    goto LABEL_9;
  }
  v9 = v8;
  v10 = objc_msgSend(v7, "navigationBar");
  objc_msgSend(v10, "setTranslucent:", 1);

  objc_msgSend(v0, "addChildViewController:", v7);
  v11 = objc_msgSend(v0, "view");
  if (!v11)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v12 = v11;
  objc_msgSend(v11, "addSubview:", v9);

  objc_msgSend(v7, "didMoveToParentViewController:", v0);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v13 = sub_100005DBC(&qword_100025AB8);
  v14 = swift_allocObject(v13, 64, 7);
  *(_OWORD *)(v14 + 16) = xmmword_10001BA20;
  v15 = objc_msgSend(v0, "view");
  if (!v15)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v16 = v15;
  v17 = objc_msgSend(v15, "topAnchor");

  v18 = objc_msgSend(v9, "topAnchor");
  v19 = objc_msgSend(v17, "constraintEqualToAnchor:", v18);

  *(_QWORD *)(v14 + 32) = v19;
  v20 = objc_msgSend(v0, "view");
  if (!v20)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v21 = v20;
  v22 = objc_msgSend(v20, "bottomAnchor");

  v23 = objc_msgSend(v9, "bottomAnchor");
  v24 = objc_msgSend(v22, "constraintEqualToAnchor:", v23);

  *(_QWORD *)(v14 + 40) = v24;
  v25 = objc_msgSend(v0, "view");
  if (!v25)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v26 = v25;
  v27 = objc_msgSend(v25, "leftAnchor");

  v28 = objc_msgSend(v9, "leftAnchor");
  v29 = objc_msgSend(v27, "constraintEqualToAnchor:", v28);

  *(_QWORD *)(v14 + 48) = v29;
  v30 = objc_msgSend(v0, "view");
  if (v30)
  {
    v31 = v30;
    v32 = (void *)objc_opt_self(NSLayoutConstraint);
    v33 = objc_msgSend(v31, "rightAnchor");

    v34 = objc_msgSend(v9, "rightAnchor");
    v35 = objc_msgSend(v33, "constraintEqualToAnchor:", v34);

    *(_QWORD *)(v14 + 56) = v35;
    specialized Array._endMutation()();
    v36 = v14;
    sub_10000B938(0, &qword_100025BE0, NSLayoutConstraint_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v36);
    objc_msgSend(v32, "activateConstraints:", isa);

    swift_unknownObjectRelease(v3);
    return;
  }
LABEL_13:
  __break(1u);
}

id sub_10000C258(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  void *v4;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  NSString v10;
  id v11;
  objc_super v13;
  char v14[24];
  void *v15;
  void *v16;

  v4 = v3;
  v7 = &v3[OBJC_IVAR____TtC25RemindersSharingExtension24TTRISERootViewController_extensionCreateReminderInterface];
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v8 = OBJC_IVAR____TtC25RemindersSharingExtension24TTRISERootViewController_extensionContextExtractor;
  v15 = &type metadata for TTRCurrentUserActivityProvider;
  v16 = &protocol witness table for TTRCurrentUserActivityProvider;
  v9 = type metadata accessor for TTRExtensionContextExtractor(0);
  swift_allocObject(v9, 64, 7);
  *(_QWORD *)&v3[v8] = TTRExtensionContextExtractor.init(userActivityProvider:)(v14);
  if (a2)
  {
    v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v4;
  v13.super_class = (Class)type metadata accessor for TTRISERootViewController();
  v11 = objc_msgSendSuper2(&v13, "initWithNibName:bundle:", v10, a3);

  return v11;
}

id sub_10000C398(void *a1)
{
  char *v1;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;
  char v9[24];
  void *v10;
  void *v11;

  v3 = &v1[OBJC_IVAR____TtC25RemindersSharingExtension24TTRISERootViewController_extensionCreateReminderInterface];
  *(_QWORD *)v3 = 0;
  *((_QWORD *)v3 + 1) = 0;
  v4 = OBJC_IVAR____TtC25RemindersSharingExtension24TTRISERootViewController_extensionContextExtractor;
  v10 = &type metadata for TTRCurrentUserActivityProvider;
  v11 = &protocol witness table for TTRCurrentUserActivityProvider;
  v5 = type metadata accessor for TTRExtensionContextExtractor(0);
  swift_allocObject(v5, 64, 7);
  *(_QWORD *)&v1[v4] = TTRExtensionContextExtractor.init(userActivityProvider:)(v9);
  v8.receiver = v1;
  v8.super_class = (Class)type metadata accessor for TTRISERootViewController();
  v6 = objc_msgSendSuper2(&v8, "initWithCoder:", a1);

  return v6;
}

id sub_10000C464()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRISERootViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for TTRISERootViewController()
{
  return objc_opt_self(_TtC25RemindersSharingExtension24TTRISERootViewController);
}

uint64_t sub_10000C4EC()
{
  void *v0;
  void *v1;
  id v2;
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  id v16;
  uint64_t v17;

  v1 = v0;
  v2 = objc_msgSend(v0, "extensionContext");
  if (v2)
  {
    v4 = v2;
    type metadata accessor for RDIDispatchQueue(0);
    v5 = (void *)static RDIDispatchQueue.storeQueue.getter();
    v6 = swift_allocObject(&unk_1000211A0, 32, 7);
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v1;
    v7 = type metadata accessor for TTRExtensionContextExtractorResult(0);
    v8 = v4;
    v9 = v1;
    v10 = firstly<A>(on:closure:)(v5, sub_10000CFE0, v6, v7);
    swift_release(v6);

    return v10;
  }
  else
  {
    if (qword_100025580 != -1)
      swift_once(&qword_100025580, sub_10000BD7C, v3);
    v12 = type metadata accessor for Logger(0);
    sub_10000CF9C(v12, (uint64_t)qword_100025B90);
    v13 = Logger.logObject.getter();
    v14 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Sharing extension is missing extension context", v15, 2u);
      swift_slowDealloc(v15, -1, -1);
    }

    v16 = objc_msgSend((id)objc_opt_self(REMError), "unexpectedError");
    v17 = sub_100005DBC(&qword_100025C00);
    swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
    return Promise.init(error:)(v16);
  }
}

uint64_t sub_10000C6A8(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(_QWORD *);
  id v8;
  uint64_t v9;
  _QWORD v11[5];

  v4 = type metadata accessor for TTRNSExtensionContextProvider(0);
  swift_allocObject(v4, 24, 7);
  v5 = TTRNSExtensionContextProvider.init(extensionContext:)(a1);
  v6 = *(_QWORD *)(a2 + OBJC_IVAR____TtC25RemindersSharingExtension24TTRISERootViewController_extensionContextExtractor);
  v11[3] = v4;
  v11[4] = &protocol witness table for TTRNSExtensionContextProvider;
  v11[0] = v5;
  v7 = *(uint64_t (**)(_QWORD *))(*(_QWORD *)v6 + 104);
  v8 = a1;
  swift_retain(v5);
  v9 = v7(v11);
  swift_release(v5);
  sub_10000CEF0(v11);
  return v9;
}

uint64_t sub_10000C758(void *a1, uint64_t a2, int a3)
{
  id v4;
  id v5;
  NSString v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ReminderInteractor;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t ReminderRouter;
  uint64_t v17;
  uint64_t ReminderPresenter;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t *v26;
  uint64_t ReminderViewController;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[5];

  HIDWORD(v30) = a3;
  v31 = a2;
  v4 = objc_msgSend(objc_allocWithZone((Class)REMStore), "init");
  v5 = objc_allocWithZone((Class)TTRUndoManager);
  v6 = String._bridgeToObjectiveC()();
  v7 = objc_msgSend(v5, "initWithDebugIdentifier:", v6);

  v8 = type metadata accessor for TTRURLMetadataInteractor(0);
  swift_allocObject(v8, 32, 7);
  v9 = TTRURLMetadataInteractor.init()();
  v10 = sub_10000C4EC();
  ReminderInteractor = type metadata accessor for TTRExtensionCreateReminderInteractor(0);
  swift_allocObject(ReminderInteractor, *(unsigned int *)(ReminderInteractor + 48), *(unsigned __int16 *)(ReminderInteractor + 52));
  v12 = a1;
  swift_retain(v10);
  v13 = v7;
  swift_retain(v9);
  v14 = v4;
  v15 = TTRExtensionCreateReminderInteractor.init(store:reminderID:extractorResult:undoManager:urlMetadataInteractor:)();
  ReminderRouter = type metadata accessor for TTRIExtensionCreateReminderRouter();
  v17 = swift_allocObject(ReminderRouter, 32, 7);
  swift_unknownObjectWeakInit(v17 + 16, 0);
  *(_QWORD *)(v17 + 24) = 0;
  v33[3] = ReminderRouter;
  v33[4] = &off_100021430;
  v33[0] = v17;
  ReminderPresenter = type metadata accessor for TTRIExtensionCreateReminderPresenter(0);
  v19 = (uint64_t *)swift_allocObject(ReminderPresenter, *(unsigned int *)(ReminderPresenter + 48), *(unsigned __int16 *)(ReminderPresenter + 52));
  v20 = sub_10000CA84((uint64_t)v33, ReminderRouter);
  __chkstk_darwin(v20);
  v22 = (uint64_t *)((char *)&v30 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v23 + 16))(v22);
  v24 = *v22;
  v25 = v13;
  swift_retain(v17);
  v26 = sub_10000CAAC(v15, v24, (uint64_t)sub_10001A38C, 0, (uint64_t)sub_10001A480, 0, v25, SBYTE4(v30), v19);

  sub_10000CEF0(v33);
  ReminderViewController = type metadata accessor for TTRIExtensionCreateReminderViewController();
  v33[0] = v26;
  v33[1] = &off_1000212B8;
  swift_retain(v26);
  static TTRTypedController<>.instantiateFromStoryboard(with:)(&v32, v33, ReminderViewController, &protocol witness table for UIViewController, &off_100026090);
  swift_release(v26);

  swift_release(v10);
  swift_release(v9);
  v28 = v32;
  swift_beginAccess(v15 + 16, v33, 1, 0);
  *(_QWORD *)(v15 + 24) = &off_100021288;
  swift_unknownObjectWeakAssign(v15 + 16, v26);
  swift_release(v15);
  v26[3] = (uint64_t)&off_100021520;
  swift_unknownObjectWeakAssign(v26 + 2, v28);
  v26[5] = (uint64_t)&off_100021170;
  swift_unknownObjectWeakAssign(v26 + 4, v31);
  swift_unknownObjectWeakAssign(v17 + 16, v28);
  swift_release(v17);
  return v28;
}

uint64_t sub_10000CA84(uint64_t a1, uint64_t a2)
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

uint64_t *sub_10000CAAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7, char a8, uint64_t *a9)
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t ReminderViewModel;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  Swift::String v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60[24];
  char v61[24];
  _QWORD v62[6];

  v53 = a3;
  v54 = a5;
  v55 = *a9;
  v15 = type metadata accessor for REMAnalyticsEvent(0);
  v56 = *(_QWORD *)(v15 - 8);
  v57 = v15;
  __chkstk_darwin(v15);
  v17 = (char *)&v53 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100005DBC(&qword_100025BE8);
  __chkstk_darwin(v18);
  v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62[3] = type metadata accessor for TTRIExtensionCreateReminderRouter();
  v62[4] = &off_100021430;
  v62[0] = a2;
  a9[3] = 0;
  swift_unknownObjectWeakInit(a9 + 2, 0);
  a9[5] = 0;
  swift_unknownObjectWeakInit(a9 + 4, 0);
  *((_BYTE *)a9 + 48) = 0;
  v21 = (uint64_t)a9 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_viewModel;
  ReminderViewModel = type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ReminderViewModel - 8) + 56))(v21, 1, 1, ReminderViewModel);
  *(uint64_t *)((char *)a9
             + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter____lazy_storage___attachmentThumbnailsManager) = 0;
  v23 = OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_editingSessionSharedProperties;
  v24 = type metadata accessor for TTRRemindersListEditingSessionPropertiesSharingWrapper(0);
  swift_allocObject(v24, 24, 7);
  *(uint64_t *)((char *)a9 + v23) = TTRRemindersListEditingSessionPropertiesSharingWrapper.init()();
  v25 = (uint64_t *)((char *)a9
                  + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor);
  *v25 = a1;
  v25[1] = &protocol witness table for TTRExtensionCreateReminderInteractor;
  sub_10000CF10((uint64_t)v62, (uint64_t)a9 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_router);
  *(uint64_t *)((char *)a9 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_undoManager) = (uint64_t)a7;
  *((_BYTE *)a9 + 48) = a8;
  v26 = type metadata accessor for TTRInCellEditingPresenterManagingHelper(0);
  swift_allocObject(v26, *(unsigned int *)(v26 + 48), *(unsigned __int16 *)(v26 + 52));
  swift_retain(a1);
  v27 = a7;
  v28 = TTRInCellEditingPresenterManagingHelper.init(reminderEditingComponents:)(&_swiftEmptyArrayStorage);
  *(uint64_t *)((char *)a9
             + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_inCellEditingPresenterHelper) = v28;
  v29 = (uint64_t *)((char *)a9
                  + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_makeCellTitleModule);
  *v29 = v53;
  v29[1] = a4;
  v30 = (uint64_t *)((char *)a9
                  + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_makeCellNotesModule);
  *v30 = v54;
  v30[1] = a6;
  sub_10000B938(0, &qword_100025BF0, OS_dispatch_queue_ptr);
  swift_retain(a4);
  v31 = swift_retain(a6);
  v32 = static OS_dispatch_queue.main.getter(v31);
  v33 = type metadata accessor for TTRDeferredAction(0);
  swift_allocObject(v33, 56, 7);
  v34 = TTRDeferredAction.init(queue:)(v32);
  *(uint64_t *)((char *)a9
             + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_deferredAction) = v34;
  swift_beginAccess(v34 + 16, v61, 1, 0);
  *(_QWORD *)(v34 + 24) = &off_100021238;
  swift_unknownObjectWeakAssign(v34 + 16, a9);
  swift_beginAccess(v28 + 16, v60, 1, 0);
  *(_QWORD *)(v28 + 24) = &off_1000211C0;
  swift_unknownObjectWeakAssign(v28 + 16, a9);
  sub_10000D238((uint64_t)v20);
  v35 = (uint64_t)a9 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_viewModel;
  swift_beginAccess((char *)a9 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_viewModel, &v58, 33, 0);
  sub_10000CF54((uint64_t)v20, v35);
  v36 = swift_endAccess(&v58);
  v37 = *(void **)TTRUserDefaults.appUserDefaults.unsafeMutableAddressor(v36);
  type metadata accessor for REMAnalyticsManager(0);
  v38 = v37;
  v39 = static REMAnalyticsManager.shared.getter();
  v40 = sub_100005DBC(&qword_100025BF8);
  v41 = &v17[*(int *)(v40 + 48)];
  v42 = enum case for REMUserOperation.createReminder(_:);
  v43 = type metadata accessor for REMUserOperation(0);
  v44 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 104))(v17, v42, v43);
  *(_QWORD *)v41 = TTRUserDefaults.activitySessionId.getter(v44);
  *((_QWORD *)v41 + 1) = v45;
  TTRUserDefaults.activitySessionBeginTime.getter();
  v58 = _typeName(_:qualified:)(v55, 0);
  v59 = v46;
  v47 = (uint64_t *)&v17[*(int *)(v40 + 80)];
  v48._countAndFlagsBits = 0x69736E657478452DLL;
  v48._object = (void *)0xEA00000000006E6FLL;
  String.append(_:)(v48);
  v49 = v59;
  *v47 = v58;
  v47[1] = v49;
  v51 = v56;
  v50 = v57;
  (*(void (**)(char *, _QWORD, uint64_t))(v56 + 104))(v17, enum case for REMAnalyticsEvent.userOperation(_:), v57);
  REMAnalyticsManager.post(event:)(v17);

  swift_release(v39);
  sub_10000CEF0(v62);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v17, v50);
  return a9;
}

uint64_t sub_10000CEF0(_QWORD *a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1[3] - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release(*a1);
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_10000CF10(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000CF54(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100005DBC(&qword_100025BE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CF9C(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_10000CFB4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CFE0()
{
  uint64_t v0;

  return sub_10000C6A8(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t *sub_10000CFE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a1 - 8);
  if ((*(_DWORD *)(v3 + 80) & 0x20000) != 0)
  {
    v4 = swift_slowAlloc(*(_QWORD *)(v3 + 64), *(_DWORD *)(v3 + 80));
    *a2 = v4;
    return (uint64_t *)v4;
  }
  return a2;
}

uint64_t sub_10000D028@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void *a5@<X4>, _QWORD *a6@<X6>, _OWORD *a7@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;

  v21 = a6;
  v22 = a4;
  v23 = a5;
  v11 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (char *)&v20 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100005DBC(&qword_100025DA8);
  __chkstk_darwin(v15);
  v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000BAD0(a1, (uint64_t)v17, &qword_100025DA8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v17, 1, v11) == 1)
  {
    a7[1] = 0u;
    a7[2] = 0u;
    *a7 = 0u;
    v18 = v23;
  }
  else
  {
    sub_10000B584((uint64_t)v17, (uint64_t)v14, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
    v18 = v23;
    (*(void (**)(char *, uint64_t, _UNKNOWN **, uint64_t, uint64_t, void *))(a2 + *v21))(v14, a2, &off_1000211D8, a3, v22, v23);
    sub_100008650((uint64_t)v14, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
  }
  swift_release(a2);

  return swift_unknownObjectRelease(a3);
}

uint64_t sub_10000D1A8()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  uint64_t v3;

  v0 = type metadata accessor for Logger(0);
  sub_10000CFE8(v0, qword_100025C08);
  v1 = sub_10000CF9C(v0, (uint64_t)qword_100025C08);
  if (qword_100025598 != -1)
    swift_once(&qword_100025598, sub_1000171D0, v2);
  v3 = sub_10000CF9C(v0, (uint64_t)qword_100026230);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v3, v0);
}

void sub_10000D238(uint64_t a1@<X8>)
{
  uint64_t v1;
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
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t ObjectType;
  uint64_t (*v18)(uint64_t, uint64_t);
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t Strong;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  void *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(__int128 *__return_ptr, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t ReminderViewModel;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  void *object;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char *v66;
  uint64_t ReminderView;
  void (*v68)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t *v69;
  id v70;
  void *v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  Class isa;
  id v76;
  id v77;
  id v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  void *v87;
  char v88;
  char v89;
  char v90;
  void *v91;
  int *v92;
  uint64_t v93;
  id v94;
  id v95;
  void *v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  void *v100;
  id v101;
  void *v102;
  id v103;
  double v104;
  double v105;
  id v106;
  uint64_t v107;
  uint64_t v108;
  id v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  void *v114;
  id v115;
  void *v116;
  id v117;
  double v118;
  double v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t inited;
  uint64_t v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  int v131;
  uint64_t v132;
  void *v133;
  id v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  id v139;
  id v140;
  id v141;
  uint64_t v142;
  _BYTE *v143;
  id v144;
  id v145;
  id v146;
  void *v147;
  void *v148;
  uint64_t v149;
  void *v150;
  uint64_t *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t *v157;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  id v161;
  unsigned int v162;
  id v163;
  id v164;
  id v165;
  int v166;
  id v167;
  uint64_t v168;
  uint64_t v169;
  char *v170;
  char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  _QWORD *v178;
  __int128 v179;
  uint64_t v180;
  char v181[40];
  __int128 v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  char v186[4];
  uint64_t v187;
  uint64_t v188;
  Swift::tuple_title_String_isValid_Bool v189;

  v169 = type metadata accessor for REMApplicationIconFormat(0);
  v168 = *(_QWORD *)(v169 - 8);
  __chkstk_darwin(v169);
  v170 = (char *)&v156 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v173 = type metadata accessor for URL(0);
  v172 = *(_QWORD *)(v173 - 8);
  __chkstk_darwin(v173);
  v171 = (char *)&v156 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_100005DBC(&qword_100025DB0);
  v6 = __chkstk_darwin(v5);
  v8 = (char *)&v156 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v176 = (uint64_t)&v156 - v9;
  v10 = sub_100005DBC(&qword_100025DA8);
  __chkstk_darwin(v10);
  v12 = (char *)&v156 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  v175 = (uint64_t)&v156 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v174 = v1;
  v16 = *(_QWORD *)(v1 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor + 8);
  ObjectType = swift_getObjectType(*(_QWORD *)(v1
                                             + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
  v18 = *(uint64_t (**)(uint64_t, uint64_t))(v16 + 24);
  v19 = v18(ObjectType, v16);
  if (!v19)
    goto LABEL_11;
  v20 = (void *)v19;
  v21 = (void *)v18(ObjectType, v16);
  if (!v21)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
    goto LABEL_10;
  }
  v22 = v21;
  v23 = (uint64_t *)objc_msgSend(v21, "objectID");
  static TTRReminderDetailViewModel.defaultItem(withReminderID:)();

  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56))(v12, 0, 1, v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13) == 1)
  {
LABEL_10:

    sub_10000BA94((uint64_t)v12, &qword_100025DA8);
LABEL_11:
    ReminderViewModel = type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ReminderViewModel - 8) + 56))(a1, 1, 1, ReminderViewModel);
    return;
  }
  sub_10000B584((uint64_t)v12, v175, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
  v24 = v174 + 16;
  Strong = swift_unknownObjectWeakLoadStrong(v174 + 16);
  v159 = v24;
  if (!Strong)
    goto LABEL_13;
  v26 = Strong;
  v27 = sub_100018CFC();
  v28 = (char *)*(id *)(v27 + 32);
  swift_release(v27);
  v29 = &v28[direct field offset for TTRIReminderTitleCellContent.titleModule];
  swift_beginAccess(&v28[direct field offset for TTRIReminderTitleCellContent.titleModule], v186, 0, 0);
  if (!*(_QWORD *)v29)
  {
    swift_unknownObjectRelease(v26);

    goto LABEL_13;
  }
  v23 = &qword_100025DD0;
  sub_10000BAD0((uint64_t)v29, (uint64_t)&v177, &qword_100025DD0);

  v30 = v177;
  v31 = v178;
  swift_unknownObjectRetain(v177);
  sub_10000BA94((uint64_t)&v177, &qword_100025DD0);
  swift_unknownObjectRelease(v26);
  if (!v30)
  {
LABEL_13:
    v30 = 0;
    goto LABEL_14;
  }
  v32 = swift_getObjectType(v30);
  v33 = v31[1];
  v34 = *(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v33 + 32);
  swift_unknownObjectRetain(v30);
  v34(&v182, v32, v33);
  swift_unknownObjectRelease(v30);
  sub_100010B7C(&v182, (uint64_t)&v177);
  v35 = *((_QWORD *)&v179 + 1);
  v36 = v180;
  sub_100010470(&v177, *((uint64_t *)&v179 + 1));
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v36 + 16))(v35, v36) & 1) != 0)
  {
    v37 = *((_QWORD *)&v179 + 1);
    v38 = v180;
    sub_100010470(&v177, *((uint64_t *)&v179 + 1));
    v166 = (*(uint64_t (**)(uint64_t, uint64_t))(v38 + 40))(v37, v38);
    sub_10000CEF0(&v177);
    goto LABEL_17;
  }
  sub_10000CEF0(&v177);
LABEL_14:
  v40 = objc_msgSend(v20, "titleAsString");
  if (v40)
  {
    v41 = v40;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v40);
    v43 = v42;

    v189 = String.validatedReminderTitle()();
    object = v189.title._object;
    v166 = *(_DWORD *)&v189.isValid;
    swift_bridgeObjectRelease(v43);
    swift_bridgeObjectRelease(object);
  }
  else
  {
    v166 = 0;
  }
LABEL_17:
  v184 = sub_10000B938(0, &qword_100025DB8, REMReminderChangeItem_ptr);
  v185 = &protocol witness table for REMReminderChangeItem;
  *(_QWORD *)&v182 = v20;
  v45 = v20;
  TTRReminderViewModelComputedProperties.init(reminder:postProcessingOperations:)(&v177, &v182, 3);
  v46 = v177;
  if (v177)
  {
    v47 = v177;
  }
  else
  {
    v47 = objc_msgSend(v45, "title");
    if (!v47)
      v47 = objc_msgSend(objc_allocWithZone((Class)NSAttributedString), "init");
  }
  v164 = v47;
  v48 = v178;
  v165 = v46;
  if (v178)
  {
    v49 = v46;
    v50 = v48;
  }
  else
  {
    v51 = v46;
    v50 = objc_msgSend(v45, "notes");
    if (!v50)
      v50 = objc_msgSend(objc_allocWithZone((Class)NSAttributedString), "init");
  }
  v163 = v50;
  v161 = v48;
  v52 = objc_msgSend(v45, "accountCapabilities");
  v162 = objc_msgSend(v52, "supportsTextStyling");

  v53 = objc_msgSend(v45, "attachmentContext");
  if (!v53)
  {
    v57 = (uint64_t)&_swiftEmptyArrayStorage;
    if (!((unint64_t)&_swiftEmptyArrayStorage >> 62))
      goto LABEL_27;
LABEL_35:
    if (v57 < 0)
      v63 = v57;
    else
      v63 = v57 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain_n(v57, 2);
    v58 = _CocoaArrayWrapper.endIndex.getter(v63);
    swift_bridgeObjectRelease(v57);
    goto LABEL_28;
  }
  v54 = v53;
  v55 = objc_msgSend(v53, "attachments");

  v56 = sub_10000B938(0, &qword_100025DC8, REMAttachment_ptr);
  v57 = static Array._unconditionallyBridgeFromObjectiveC(_:)(v55, v56);

  if ((unint64_t)v57 >> 62)
    goto LABEL_35;
LABEL_27:
  v58 = *(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain(v57);
LABEL_28:
  v167 = v45;
  if (!v58)
    goto LABEL_46;
  v59 = 0;
  if ((v57 & 0xC000000000000001) != 0)
  {
    while (1)
    {
      swift_bridgeObjectRetain(v57);
      v60 = specialized _ArrayBuffer._getElementSlowPath(_:)(v59, v57);
      v61 = objc_opt_self(REMURLAttachment);
      if (swift_dynamicCastObjCClass(v60, v61))
      {
        swift_unknownObjectRelease(v60);
        swift_bridgeObjectRelease(v57);
        goto LABEL_45;
      }
      swift_bridgeObjectRelease(v57);
      swift_unknownObjectRelease(v60);
      v62 = (char *)(v59 + 1);
      if (__OFADD__(v59, 1))
        break;
      ++v59;
      if (v62 == (char *)v58)
        goto LABEL_46;
    }
    __break(1u);
LABEL_115:
    __break(1u);
LABEL_116:
    __break(1u);
LABEL_117:
    __break(1u);
    goto LABEL_118;
  }
  v23 = (uint64_t *)&_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
  while (1)
  {
    v64 = *(_QWORD *)(v57 + 32 + 8 * v59);
    v65 = objc_opt_self(REMURLAttachment);
    if (swift_dynamicCastObjCClass(v64, v65))
      break;
    v66 = (char *)(v59 + 1);
    if (__OFADD__(v59, 1))
      goto LABEL_116;
    ++v59;
    if (v66 == (char *)v58)
      goto LABEL_46;
  }
LABEL_45:
  if (v59 == v58)
  {
LABEL_46:
    swift_bridgeObjectRelease(v57);
    v23 = 0;
    goto LABEL_47;
  }
  if ((v57 & 0xC000000000000001) != 0)
  {
LABEL_118:
    v106 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v59, v57);
    goto LABEL_77;
  }
  if ((v59 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_120;
  }
  if (v59 >= *(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_120:
    __break(1u);
    goto LABEL_121;
  }
  v106 = *(id *)(v57 + 8 * v59 + 32);
LABEL_77:
  v59 = (unint64_t)v106;
  v107 = objc_opt_self(REMURLAttachment);
  v108 = swift_dynamicCastObjCClass(v59, v107);
  if (!v108)
    goto LABEL_124;
  v23 = (uint64_t *)v108;
  swift_bridgeObjectRelease(v57);
LABEL_47:
  ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  v68 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ReminderView - 8) + 56);
  v68(v176, 1, 1, ReminderView);
  if (v23)
  {
    v158 = v30;
    v157 = v23;
    v69 = v23;
    v70 = objc_msgSend(v69, "metadata");
    v160 = a1;
    if (v70)
    {
      v71 = v70;
      v72 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      v74 = v73;

      sub_100010AF4(v72, v74);
      isa = Data._bridgeToObjectiveC()().super.isa;
      v76 = objc_msgSend((id)objc_opt_self(LPLinkMetadata), "metadataWithDataRepresentation:", isa);
      sub_100010B38(v72, v74);

      sub_100010B38(v72, v74);
    }
    else
    {
      v76 = 0;
    }
    v77 = objc_msgSend(v69, "objectID");
    v78 = objc_msgSend(v69, "url");
    v79 = v171;
    static URL._unconditionallyBridgeFromObjectiveC(_:)();

    v80 = v176;
    sub_10000BA94(v176, &qword_100025DB0);
    *(_QWORD *)v8 = v77;
    (*(void (**)(char *, char *, uint64_t))(v172 + 32))(&v8[*(int *)(ReminderView + 20)], v79, v173);
    *(_QWORD *)&v8[*(int *)(ReminderView + 24)] = v76;
    v68((uint64_t)v8, 0, 1, ReminderView);
    sub_1000109F0((uint64_t)v8, v80, &qword_100025DB0);
    v30 = v158;
    a1 = v160;
    v23 = v157;
  }
  if (!v58)
    goto LABEL_65;
  v59 = 0;
  if ((v57 & 0xC000000000000001) != 0)
  {
    while (1)
    {
      swift_bridgeObjectRetain(v57);
      v81 = specialized _ArrayBuffer._getElementSlowPath(_:)(v59, v57);
      v82 = objc_opt_self(REMImageAttachment);
      if (swift_dynamicCastObjCClass(v81, v82))
        break;
      swift_bridgeObjectRelease(v57);
      swift_unknownObjectRelease(v81);
      v83 = (char *)(v59 + 1);
      if (__OFADD__(v59, 1))
        goto LABEL_115;
      ++v59;
      if (v83 == (char *)v58)
        goto LABEL_65;
    }
    swift_unknownObjectRelease(v81);
    swift_bridgeObjectRelease(v57);
  }
  else
  {
    v8 = (char *)&_s10Foundation22_convertErrorToNSErrorySo0E0Cs0C0_pF_ptr;
    while (1)
    {
      v84 = *(_QWORD *)(v57 + 32 + 8 * v59);
      v85 = objc_opt_self(REMImageAttachment);
      if (swift_dynamicCastObjCClass(v84, v85))
        break;
      v86 = (char *)(v59 + 1);
      if (__OFADD__(v59, 1))
        goto LABEL_117;
      ++v59;
      if (v86 == (char *)v58)
        goto LABEL_65;
    }
  }
  if (v59 == v58)
  {
LABEL_65:
    swift_bridgeObjectRelease(v57);
    if (v23)
    {

      swift_unknownObjectRelease(v30);
LABEL_67:
      v87 = 0;
      v88 = -1;
LABEL_68:
      v89 = v166;
      v90 = v162;
      v91 = v161;
      sub_10000B584(v175, a1, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
      v182 = v179;
      v183 = v180;
      sub_100010964((uint64_t)&v182 + 8, (uint64_t)&v188);
      sub_1000109A0(&v188);

      sub_1000109C8(&v188);
      v187 = v183;
      sub_1000109C8(&v187);
      v92 = (int *)type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
      *(_BYTE *)(a1 + v92[5]) = v89 & 1;
      *(_QWORD *)(a1 + v92[6]) = v164;
      *(_QWORD *)(a1 + v92[7]) = v163;
      *(_BYTE *)(a1 + v92[8]) = v90;
      sub_100010964((uint64_t)&v188, a1 + v92[9]);
      sub_1000109F0(v176, a1 + v92[10], &qword_100025DB0);
      v93 = a1 + v92[11];
      *(_QWORD *)v93 = v87;
      *(_BYTE *)(v93 + 8) = v88;
      (*(void (**)(uint64_t, _QWORD, uint64_t, int *))(*((_QWORD *)v92 - 1) + 56))(a1, 0, 1, v92);
      return;
    }
    v94 = v167;
    v95 = objc_msgSend(v167, "userActivity");
    if (!v95)
    {

      swift_unknownObjectRelease(v30);
      goto LABEL_67;
    }
    v96 = v95;
    v97 = v168;
    v98 = v169;
    (*(void (**)(char *, _QWORD, uint64_t))(v168 + 104))(v170, enum case for REMApplicationIconFormat.reminderListiOS(_:), v169);
    v99 = (void *)swift_unknownObjectWeakLoadStrong(v159);
    if (!v99)
    {
      v105 = 1.0;
LABEL_90:
      v120 = v170;
      v87 = (void *)REMUserActivity.platformAppIconAndName(format:scale:)(v170, v105);
      v122 = v121;

      swift_unknownObjectRelease(v30);
      (*(void (**)(char *, uint64_t))(v97 + 8))(v120, v98);
      if (v87)
      {
        swift_bridgeObjectRelease(v122);
        v88 = 0;
      }
      else
      {
        v88 = -1;
      }
      goto LABEL_68;
    }
    v100 = v99;
    v101 = objc_msgSend(v99, "view");
    if (v101)
    {
      v102 = v101;
      v103 = objc_msgSend(v101, "traitCollection");

      objc_msgSend(v103, "displayScale");
      v105 = v104;
      swift_unknownObjectRelease(v100);

      goto LABEL_90;
    }
    goto LABEL_126;
  }
  if ((v57 & 0xC000000000000001) == 0)
  {
    if ((v59 & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (v59 < *(_QWORD *)((v57 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v109 = *(id *)(v57 + 8 * v59 + 32);
      goto LABEL_83;
    }
    __break(1u);
LABEL_124:

    __break(1u);
    goto LABEL_125;
  }
LABEL_121:
  v109 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)(v59, v57);
LABEL_83:
  v59 = (unint64_t)v109;
  v110 = objc_opt_self(REMImageAttachment);
  v111 = swift_dynamicCastObjCClass(v59, v110);
  if (!v111)
  {
LABEL_125:

    __break(1u);
LABEL_126:
    __break(1u);
    goto LABEL_127;
  }
  v112 = v111;
  swift_bridgeObjectRelease(v57);
  v113 = (void *)swift_unknownObjectWeakLoadStrong(v159);
  if (!v113)
  {
    v119 = 1.0;
    goto LABEL_94;
  }
  v114 = v113;
  v115 = objc_msgSend(v113, "view");
  if (v115)
  {
    v116 = v115;
    v117 = objc_msgSend(v115, "traitCollection");

    objc_msgSend(v117, "displayScale");
    v119 = v118;
    swift_unknownObjectRelease(v114);

LABEL_94:
    v123 = sub_10000ECF8();
    v124 = sub_100005DBC(&qword_100025AB8);
    inited = swift_initStackObject(v124, v181);
    *(_OWORD *)(inited + 16) = xmmword_10001B4B0;
    *(_QWORD *)(inited + 32) = v112;
    *(_QWORD *)&v182 = inited;
    specialized Array._endMutation()();
    v126 = v182;
    v127 = (id)v59;
    v128 = TTRAttachmentThumbnailsManager.thumbnails(for:scale:)(v126, v119);
    swift_bridgeObjectRelease(v126);
    swift_release(v123);
    v129 = *(_QWORD *)(v128 + 16);
    if (v129)
    {
      v87 = *(void **)(v128 + 32);
      v130 = *(void **)(v128 + 40);
      v131 = *(unsigned __int8 *)(v128 + 48);
      v160 = a1;
      if (v131)
      {
        if (v131 == 1)
        {
          sub_10000B938(0, &qword_100025BF0, OS_dispatch_queue_ptr);
          sub_100010A34(v87, v130, 1);
          v132 = swift_retain(v87);
          v133 = (void *)static OS_dispatch_queue.main.getter(v132);
          v134 = v127;
          v135 = swift_allocObject(&unk_100021348, 24, 7);
          swift_weakInit(v135 + 16, v174);
          v136 = sub_100005DBC(&qword_100025DC0);
          v137 = dispatch thunk of Promise.then<A>(on:closure:)(v133, sub_100010A88, v135, v136);
          sub_10001094C(0, 0xFFu);
          swift_release(v87);
          swift_release(v137);

          v138 = v135;
          v127 = v134;
          swift_release(v138);
          sub_100010AA0(v87, v130, 1);
        }
        else
        {
          sub_10001094C(0, 0xFFu);
        }
        v87 = 0;
      }
      else
      {
        v139 = v87;
        v140 = v130;
        sub_10001094C(0, 0xFFu);
        v141 = v139;
        sub_100010AA0(v87, v130, 0);
      }
      v142 = v129 - 1;
      if (v129 == 1)
      {
        v88 = 1;
        a1 = v160;
      }
      else
      {
        v173 = (uint64_t)v127;
        v158 = v30;
        v143 = (_BYTE *)(v128 + 72);
        do
        {
          v148 = (void *)*((_QWORD *)v143 - 2);
          v147 = (void *)*((_QWORD *)v143 - 1);
          if (*v143)
          {
            if (*v143 == 1)
            {
              sub_10000B938(0, &qword_100025BF0, OS_dispatch_queue_ptr);
              sub_100010A34(v148, v147, 1);
              v149 = swift_retain(v148);
              v150 = (void *)static OS_dispatch_queue.main.getter(v149);
              v151 = v23;
              v152 = swift_allocObject(&unk_100021348, 24, 7);
              swift_weakInit(v152 + 16, v174);
              v153 = sub_100005DBC(&qword_100025DC0);
              v154 = dispatch thunk of Promise.then<A>(on:closure:)(v150, sub_100010A88, v152, v153);
              sub_10001094C(v87, 1u);
              swift_release(v148);
              swift_release(v154);

              v155 = v152;
              v23 = v151;
              swift_release(v155);
              sub_100010AA0(v148, v147, 1);
            }
            else
            {
              sub_10001094C(v87, 1u);
            }
            v87 = 0;
          }
          else
          {
            v144 = v148;
            v145 = v147;
            sub_10001094C(v87, 1u);
            v146 = v144;
            sub_100010AA0(v148, v147, 0);
            v87 = v148;
          }
          v143 += 24;
          --v142;
        }
        while (v142);
        v88 = 1;
        a1 = v160;
        v30 = v158;
        v127 = (id)v173;
      }
    }
    else
    {
      v87 = 0;
      v88 = -1;
    }

    swift_bridgeObjectRelease(v128);
    swift_unknownObjectRelease(v30);

    goto LABEL_68;
  }
LABEL_127:
  __break(1u);
}

uint64_t sub_10000E368@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _OWORD *a4@<X8>)
{
  return sub_10000E380(a1, a2, a3, &OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_makeCellTitleModule, a4);
}

uint64_t sub_10000E374@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _OWORD *a4@<X8>)
{
  return sub_10000E380(a1, a2, a3, &OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_makeCellNotesModule, a4);
}

uint64_t sub_10000E380@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, _QWORD *a4@<X3>, _OWORD *a5@<X8>)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  uint64_t v15;
  uint64_t ObjectType;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE v23[16];

  v7 = v5;
  v12 = sub_100005DBC(&qword_100025DA8);
  __chkstk_darwin(v12);
  v14 = &v23[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = *(_QWORD *)(v5 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor + 8);
  ObjectType = swift_getObjectType(*(_QWORD *)(v5
                                             + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
  v17 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v15 + 24))(ObjectType, v15);
  if (v17)
  {
    v18 = v17;
    v19 = objc_msgSend(v17, "objectID");
    static TTRReminderDetailViewModel.defaultItem(withReminderID:)();

    v20 = type metadata accessor for TTRRemindersListViewModel.Item(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v14, 0, 1, v20);

  }
  else
  {
    v21 = type metadata accessor for TTRRemindersListViewModel.Item(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v14, 1, 1, v21);
  }
  swift_retain(v7);
  swift_unknownObjectRetain(a1);
  sub_10000D028((uint64_t)v14, v7, a1, a2, a3, a4, a5);
  return sub_10000BA94((uint64_t)v14, &qword_100025DA8);
}

uint64_t sub_10000E4F8()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t ObjectType;
  uint64_t v11;
  void (*v12)(void (*)(void *, char), uint64_t, uint64_t, uint64_t);
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  Swift::String v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;

  v1 = *v0;
  v2 = type metadata accessor for REMAnalyticsEvent(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100025588 != -1)
    swift_once(&qword_100025588, sub_10000D1A8, v4);
  v7 = type metadata accessor for Logger(0);
  sub_10000CF9C(v7, (uint64_t)qword_100025C08);
  v8 = sub_10000FF80((uint64_t)&_swiftEmptyArrayStorage);
  sub_100016ED4((uint64_t)"ExtensionCreateReminder add reminder", 36, 2, v8);
  swift_bridgeObjectRelease(v8);
  v9 = *(uint64_t *)((char *)v0
                  + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor
                  + 8);
  ObjectType = swift_getObjectType(*(uint64_t *)((char *)v0
                                              + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
  v11 = swift_allocObject(&unk_100021348, 24, 7);
  swift_weakInit(v11 + 16, v0);
  v12 = *(void (**)(void (*)(void *, char), uint64_t, uint64_t, uint64_t))(v9 + 136);
  swift_retain(v11);
  v12(sub_100010790, v11, ObjectType, v9);
  v13 = swift_release_n(v11, 2);
  v14 = *(void **)TTRUserDefaults.appUserDefaults.unsafeMutableAddressor(v13);
  type metadata accessor for REMAnalyticsManager(0);
  v15 = v14;
  v16 = static REMAnalyticsManager.shared.getter();
  v17 = sub_100005DBC(&qword_100025BF8);
  v18 = &v6[*(int *)(v17 + 48)];
  v19 = enum case for REMUserOperation.commitNewReminder(_:);
  v20 = type metadata accessor for REMUserOperation(0);
  v21 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 104))(v6, v19, v20);
  *(_QWORD *)v18 = TTRUserDefaults.activitySessionId.getter(v21);
  *((_QWORD *)v18 + 1) = v22;
  TTRUserDefaults.activitySessionBeginTime.getter();
  v28 = _typeName(_:qualified:)(v1, 0);
  v29 = v23;
  v24 = (uint64_t *)&v6[*(int *)(v17 + 80)];
  v25._countAndFlagsBits = 0x69736E657478452DLL;
  v25._object = (void *)0xEA00000000006E6FLL;
  String.append(_:)(v25);
  v26 = v29;
  *v24 = v28;
  v24[1] = v26;
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v6, enum case for REMAnalyticsEvent.userOperation(_:), v2);
  REMAnalyticsManager.post(event:)(v6);

  swift_release(v16);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

void sub_10000E760(void *a1, char a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  char v13;
  _BYTE v14[24];

  v5 = a3 + 16;
  swift_beginAccess(a3 + 16, v14, 0, 0);
  Strong = swift_weakLoadStrong(v5);
  if (Strong)
  {
    v7 = Strong;
    v8 = swift_unknownObjectWeakLoadStrong(Strong + 32);
    if (v8)
    {
      v9 = (void *)v8;
      if ((a2 & 1) != 0)
      {
        sub_10001079C(a1, 1);
        swift_retain(v7);
        sub_100010310(a1, v9);
        swift_unknownObjectRelease(v9);
        swift_release_n(v7, 2);
        v12 = a1;
        v13 = 1;
      }
      else
      {
        sub_10001079C(a1, 0);
        swift_retain(v7);
        v10 = objc_msgSend(v9, "extensionContext");
        if (v10)
        {
          v11 = v10;
          objc_msgSend(v10, "completeRequestReturningItems:completionHandler:", 0, 0);
          swift_release_n(v7, 2);
          swift_unknownObjectRelease(v9);

        }
        else
        {
          swift_release_n(v7, 2);
          swift_unknownObjectRelease(v9);
        }
        v12 = a1;
        v13 = 0;
      }
      sub_1000107A8(v12, v13);
    }
    else
    {
      swift_release(v7);
    }
  }
}

void sub_10000E898(double a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  void *Strong;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  NSString v11;
  id v12;
  id v13;

  if (qword_100025588 != -1)
    swift_once(&qword_100025588, sub_10000D1A8, a1);
  v2 = type metadata accessor for Logger(0);
  sub_10000CF9C(v2, (uint64_t)qword_100025C08);
  v3 = sub_10000FF80((uint64_t)&_swiftEmptyArrayStorage);
  sub_100016ED4((uint64_t)"ExtensionCreateReminder cancel", 30, 2, v3);
  swift_bridgeObjectRelease(v3);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v1 + 32);
  if (Strong)
  {
    v5 = Strong;
    v6 = objc_msgSend(Strong, "extensionContext");
    if (v6)
    {
      v7 = v6;
      static String._unconditionallyBridgeFromObjectiveC(_:)(NSCocoaErrorDomain);
      v9 = v8;
      v10 = objc_allocWithZone((Class)NSError);
      v11 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v9);
      v12 = objc_msgSend(v10, "initWithDomain:code:userInfo:", v11, 3072, 0);

      v13 = (id)_convertErrorToNSError(_:)(v12);
      objc_msgSend(v7, "cancelRequestWithError:", v13);
      swift_unknownObjectRelease(v5);

    }
    else
    {
      swift_unknownObjectRelease(v5);
    }
  }
}

void sub_10000EA34(void *a1, uint64_t a2, uint64_t a3, int a4, void (*a5)(id), uint64_t a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  void (*v17)(uint64_t *__return_ptr, uint64_t, uint64_t);
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id Strong;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(id);
  id v40;
  uint64_t v41[10];
  _QWORD v42[5];
  _QWORD v43[5];
  _OWORD v44[4];

  v35 = a6;
  v39 = a5;
  v34 = a4;
  v36 = a2;
  v8 = type metadata accessor for REMRemindersListDataView.SectionLite.SectionType(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = 1;
  if (*(_BYTE *)(a3 + 48))
    v13 = 2;
  else
    v13 = 1;
  v40 = (id)v13;
  v37 = TTRReminderDetailSubject.init(reminderChangeItem:)(a1);
  v38 = v14;
  v15 = *(_QWORD *)(a3 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor + 8);
  ObjectType = swift_getObjectType(*(_QWORD *)(a3
                                             + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
  v17 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v15 + 48);
  v18 = a1;
  v17(v41, ObjectType, v15);
  if (v36 < 1)
  {
    v19 = 0;
    v21 = 0;
    v20 = 0;
    v22 = 0;
  }
  else
  {
    (*(void (**)(char *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for REMRemindersListDataView.SectionLite.SectionType.sectionless(_:), v8);
    TTRSectionLite.init(sectionType:)(v42, v11);
    v12 = v42[0];
    v19 = v42[1];
    v21 = v42[2];
    v20 = v42[3];
    v22 = v42[4];
  }
  v43[0] = v12;
  v43[1] = v19;
  v43[2] = v21;
  v43[3] = v20;
  v43[4] = v22;
  type metadata accessor for TTRIReminderDetailAssembly(0);
  memset(v44, 0, sizeof(v44));
  v23 = (void *)v37;
  v24 = v38;
  v25 = (void *)static TTRIReminderDetailAssembly.createViewController(subject:delegate:style:savesOnCommit:itemCount:pendingMoveContext:ttrSectionLite:manualOrdering:)(v37, v38, a3, &off_100021258, v40, 2, 0, 1, v41, v43, v44);
  v27 = v26;
  sub_10001049C((void *)v12, v19, v21, v20, v22);
  sub_1000104D8(v41);
  swift_unknownObjectRelease(v27);

  swift_release(v24);
  v28 = *sub_100010470((_QWORD *)(a3 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_router), *(_QWORD *)(a3 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_router + 24));
  Strong = (id)swift_unknownObjectWeakLoadStrong(v28 + 16);
  if (Strong)
  {
    v30 = Strong;
    v31 = objc_msgSend(Strong, "navigationController");

    if (v31)
    {
      objc_msgSend(v31, "pushViewController:animated:", v25, v34 & 1);

      v32 = *(void **)(v28 + 24);
      *(_QWORD *)(v28 + 24) = v25;

      Strong = v25;
    }
  }
  if (v39)
    v39(Strong);

  sub_1000105B4(v40, 2);
}

uint64_t sub_10000ECF8()
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
  uint64_t v11;
  _QWORD v13[5];
  _QWORD v14[5];

  v1 = OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter____lazy_storage___attachmentThumbnailsManager;
  v2 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter____lazy_storage___attachmentThumbnailsManager);
  if (v2)
  {
    v3 = *(_QWORD *)(v0
                   + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter____lazy_storage___attachmentThumbnailsManager);
  }
  else
  {
    v4 = v0;
    v5 = type metadata accessor for TTRAttachmentThumbnailSizeProvider();
    swift_allocObject(v5, 41, 7);
    v6 = TTRAttachmentThumbnailSizeProvider.init(boundingSize:contentMode:)(0x4072C00000000000, 1, 88.0, 88.0);
    sub_10000B938(0, &qword_100025BF0, OS_dispatch_queue_ptr);
    v7 = static OS_dispatch_queue.main.getter();
    type metadata accessor for RDIDispatchQueue(0);
    v8 = static RDIDispatchQueue.utilityQueue.getter();
    v9 = type metadata accessor for TTRThumbnailGenerator(0);
    swift_allocObject(v9, 32, 7);
    v14[3] = v9;
    v14[4] = &protocol witness table for TTRThumbnailGenerator;
    v14[0] = TTRThumbnailGenerator.init(queue:backgroundQueue:)(v7, v8);
    v13[3] = v5;
    v13[4] = &protocol witness table for TTRAttachmentThumbnailSizeProvider;
    v13[0] = v6;
    v10 = type metadata accessor for TTRAttachmentThumbnailsManager(0);
    swift_allocObject(v10, 120, 7);
    v3 = TTRAttachmentThumbnailsManager.init(thumbnailSizeProvider:thumbnailGenerator:)(v13, v14);
    v11 = *(_QWORD *)(v4 + v1);
    *(_QWORD *)(v4 + v1) = v3;
    swift_retain(v3);
    swift_release(v11);
    v2 = 0;
  }
  swift_retain(v2);
  return v3;
}

uint64_t sub_10000EE50@<X0>(uint64_t a1@<X1>, BOOL *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  Swift::String v6;
  _BYTE v7[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v7, 0, 0);
  result = swift_weakLoadStrong(v3);
  v5 = result;
  if (result)
  {
    v6._object = (void *)0x800000010001C6E0;
    v6._countAndFlagsBits = 0xD000000000000011;
    TTRDeferredAction.scheduleNextRunLoop(reason:)(v6);
    result = swift_release(v5);
  }
  *a2 = v5 == 0;
  return result;
}

uint64_t sub_10000EEE8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  sub_100010BF4(v2 + 16, a2);
  sub_100010BF4(v2 + 32, v3);
  sub_10000BA94(v2 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_viewModel, &qword_100025BE8);
  swift_unknownObjectRelease(*(_QWORD *)(v2
                                       + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
  sub_10000CEF0((_QWORD *)(v2 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_router));

  swift_release(*(_QWORD *)(v2
                          + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter____lazy_storage___attachmentThumbnailsManager));
  swift_release(*(_QWORD *)(v2
                          + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_deferredAction));
  swift_release(*(_QWORD *)(v2
                          + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_inCellEditingPresenterHelper));
  swift_release(*(_QWORD *)(v2
                          + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_makeCellTitleModule
                          + 8));
  swift_release(*(_QWORD *)(v2
                          + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_makeCellNotesModule
                          + 8));
  swift_release(*(_QWORD *)(v2
                          + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_editingSessionSharedProperties));
  return v2;
}

uint64_t sub_10000EFBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000EEE8(a1, a2);
  return swift_deallocClassInstance(v2, *(unsigned int *)(*(_QWORD *)v2 + 48), *(unsigned __int16 *)(*(_QWORD *)v2 + 52));
}

uint64_t sub_10000EFE0()
{
  return type metadata accessor for TTRIExtensionCreateReminderPresenter(0);
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderPresenter(uint64_t a1)
{
  uint64_t result;

  result = qword_100025C90;
  if (!qword_100025C90)
    return swift_getSingletonMetadata(a1, &nominal type descriptor for TTRIExtensionCreateReminderPresenter);
  return result;
}

void sub_10000F024(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[13];

  v4[0] = &unk_10001BB18;
  v4[1] = &unk_10001BB18;
  v4[2] = &unk_10001BB30;
  sub_10000F0F0(319);
  if (v3 <= 0x3F)
  {
    v4[3] = *(_QWORD *)(v2 - 8) + 64;
    v4[4] = &unk_10001BB48;
    v4[5] = &unk_10001BB60;
    v4[6] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v4[7] = &unk_10001BB78;
    v4[8] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[9] = (char *)&value witness table for Builtin.NativeObject + 64;
    v4[10] = (char *)&value witness table for () + 64;
    v4[11] = (char *)&value witness table for () + 64;
    v4[12] = (char *)&value witness table for Builtin.NativeObject + 64;
    swift_updateClassMetadata2(a1, 256, 13, v4, a1 + 80);
  }
}

void sub_10000F0F0(uint64_t a1)
{
  uint64_t ReminderViewModel;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100025CA0)
  {
    ReminderViewModel = type metadata accessor for TTRIExtensionCreateReminderViewModel(255);
    v3 = type metadata accessor for Optional(a1, ReminderViewModel);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100025CA0);
  }
}

void sub_10000F144(uint64_t a1)
{
  void *Strong;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSString v8;
  id v9;
  id v10;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(a1 + 32);
  if (Strong)
  {
    v2 = Strong;
    v3 = objc_msgSend(Strong, "extensionContext");
    if (v3)
    {
      v4 = v3;
      static String._unconditionallyBridgeFromObjectiveC(_:)(NSCocoaErrorDomain);
      v6 = v5;
      v7 = objc_allocWithZone((Class)NSError);
      v8 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v6);
      v9 = objc_msgSend(v7, "initWithDomain:code:userInfo:", v8, 3072, 0);

      v10 = (id)_convertErrorToNSError(_:)(v9);
      objc_msgSend(v4, "cancelRequestWithError:", v10);
      swift_unknownObjectRelease(v2);

    }
    else
    {
      swift_unknownObjectRelease(v2);
    }
  }
}

void sub_10000F26C()
{
  Swift::String v0;

  v0._object = (void *)0x800000010001C6E0;
  v0._countAndFlagsBits = 0xD000000000000011;
  TTRDeferredAction.scheduleNextRunLoop(reason:)(v0);
}

uint64_t sub_10000F2AC(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  result = swift_unknownObjectWeakLoadStrong(v2 + 16);
  if (result)
  {
    v6 = result;
    v7 = TTRListOrCustomSmartList.displayName.getter(a1, a2 & 1);
    v9 = v8;
    sub_100019B14(v7, v8, v10);
    swift_bridgeObjectRelease(v9);
    return swift_unknownObjectRelease(v6);
  }
  return result;
}

uint64_t sub_10000F314()
{
  uint64_t v0;

  sub_100010470((_QWORD *)(v0 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_router), *(_QWORD *)(v0 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_router + 24));
  swift_retain(v0);
  sub_100016B64((uint64_t)sub_100010494, v0);
  return swift_release(v0);
}

void *sub_10000F364(void *a1)
{
  uint64_t v1;
  void *result;
  void *v4;

  result = (void *)swift_unknownObjectWeakLoadStrong(v1 + 32);
  if (result)
  {
    v4 = result;
    sub_100010310(a1, result);
    return (void *)swift_unknownObjectRelease(v4);
  }
  return result;
}

void sub_10000F3AC(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  Swift::String v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t ObjectType;
  void (*v19)(void *, _QWORD, uint64_t, uint64_t);
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void (*v26)(_QWORD *, uint64_t, uint64_t);
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  _BYTE v38[16];
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  void *v44;
  unsigned __int8 v45;
  uint64_t v46;
  _QWORD v47[4];
  char v48;

  sub_1000109F0(a2, (uint64_t)v38, &qword_100025D88);
  v6 = v38[8];
  v8 = v39;
  v7 = v40;
  v10 = v41;
  v9 = v42;
  v11 = v43;
  v12 = a3;
  sub_1000109F0(a2, (uint64_t)&v44, &qword_100025D88);
  if (v46 != 2)
  {
    v36 = a3;
    v35 = v10;
    v14 = v45;
    if (v45 != 255)
    {
      v33 = v6;
      v15 = v44;
      v16 = *(_QWORD *)(a3
                      + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor
                      + 8);
      v34 = v8;
      v17 = v7;
      ObjectType = swift_getObjectType(*(_QWORD *)(a3
                                                 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
      v19 = *(void (**)(void *, _QWORD, uint64_t, uint64_t))(v16 + 104);
      v20 = v15;
      v21 = ObjectType;
      v7 = v17;
      v8 = v34;
      v19(v15, v14 & 1, v21, v16);
      v22 = v15;
      v6 = v33;
      sub_100010758(v22, v14);
    }
    if (v9 != 1)
    {
      v47[0] = v8;
      v47[1] = v7;
      v47[2] = v35;
      v47[3] = v9;
      v48 = v11;
      v23 = *(_QWORD *)(v36
                      + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor
                      + 8);
      v24 = swift_getObjectType(*(_QWORD *)(v36
                                          + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
      v25 = v7;
      v26 = *(void (**)(_QWORD *, uint64_t, uint64_t))(v23 + 144);
      sub_100010748(v8);
      sub_100010748(v25);
      swift_bridgeObjectRetain(v9);
      v26(v47, v24, v23);
      sub_1000105A4(v8);
      v27 = v25;
      v12 = v36;
      sub_1000105A4(v27);
      swift_bridgeObjectRelease(v9);
      goto LABEL_9;
    }
    v12 = v36;
    if (v6 != 255)
      goto LABEL_9;
  }
  v13._object = (void *)0x800000010001C6E0;
  v13._countAndFlagsBits = 0xD000000000000011;
  TTRDeferredAction.scheduleNextRunLoop(reason:)(v13);
LABEL_9:
  v28 = *(_QWORD *)(v12
                  + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor
                  + 8);
  v29 = swift_getObjectType(*(_QWORD *)(v12
                                      + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v28 + 64))(v29, v28) & 1) != 0 || (a4 & 1) != 0)
  {
    sub_10000E4F8();
  }
  else
  {
    v30 = *(void **)(*sub_100010470((_QWORD *)(v12+ OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_router), *(_QWORD *)(v12+ OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_router+ 24))+ 24);
    if (v30)
    {
      v31 = objc_msgSend(v30, "navigationController");
      if (v31)
      {
        v32 = v31;

      }
    }
  }
}

void sub_10000F62C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t ObjectType;
  double v3;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor + 8);
  ObjectType = swift_getObjectType(*(_QWORD *)(v0
                                             + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
  if (((*(uint64_t (**)(uint64_t, uint64_t))(v1 + 64))(ObjectType, v1) & 1) != 0)
    sub_10000E898(v3);
}

void sub_10000F688(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  uint64_t v6;
  uint64_t v7;
  char v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  v7 = v6;
  v9 = a6 & 1;
  v10 = *(_QWORD *)(v6 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor + 8);
  ObjectType = swift_getObjectType(*(_QWORD *)(v6
                                             + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
  v12 = (*(uint64_t (**)(uint64_t, uint64_t))(v10 + 8))(ObjectType, v10);
  v13 = swift_allocObject(&unk_100021320, 81, 7);
  sub_1000109F0(a5, v13 + 16, &qword_100025D88);
  *(_QWORD *)(v13 + 72) = v7;
  *(_BYTE *)(v13 + 80) = v9;
  sub_100010660(a5);
  v14 = swift_retain(v7);
  v16 = (id)zalgo.getter(v14);
  v15 = dispatch thunk of Promise.then<A>(on:closure:)(v16, sub_100010640, v13, (char *)&type metadata for () + 8);
  swift_release(v15);
  swift_release(v12);
  swift_release(v13);

}

uint64_t sub_10000F76C()
{
  return 2;
}

void *sub_10000F778()
{
  uint64_t v0;
  uint64_t Strong;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  Strong = swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (!Strong)
    return 0;
  v2 = Strong;
  v3 = *(_QWORD *)(Strong
                 + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver);
  if (!v3)
  {
    swift_unknownObjectRelease(Strong);
    return 0;
  }
  v4 = swift_retain(*(_QWORD *)(Strong
                              + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver));
  v5 = (void *)TTRICurrentTextInputModeObserver.currentTextInputMode.getter(v4);
  swift_unknownObjectRelease(v2);
  swift_release(v3);
  if (!v5)
    return v5;
  v6 = objc_msgSend(v5, "primaryLanguage");

  if (!v6)
    return 0;
  v5 = (void *)static String._unconditionallyBridgeFromObjectiveC(_:)(v6);

  return v5;
}

uint64_t sub_10000F83C()
{
  return TTRInCellEditingPresenterManagingHelper.inCellEditingPresenterWillBeginEditing(_:)();
}

uint64_t sub_10000F864()
{
  return TTRInCellEditingPresenterManagingHelper.inCellEditingPresenterDidFinishEditing(_:editingSession:)();
}

uint64_t sub_10000F88C()
{
  return TTRInCellEditingPresenterManagingHelper.nonReminderInCellEditingPresenterWillBeginEditing(_:)();
}

uint64_t sub_10000F8B4()
{
  return TTRInCellEditingPresenterManagingHelper.nonReminderInCellEditingPresenterDidFinishEditing(_:)();
}

uint64_t sub_10000F8DC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  v2 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(a1, 1, 1, v2);
}

void *sub_10000F918()
{
  return &_swiftEmptyArrayStorage;
}

uint64_t sub_10000F924@<X0>(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;

  if (qword_100025588 != -1)
    swift_once(&qword_100025588, sub_10000D1A8, a2);
  v3 = type metadata accessor for Logger(0);
  v4 = sub_10000CF9C(v3, (uint64_t)qword_100025C08);
  v5 = Logger.logObject.getter(v4);
  v6 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "TTRIExtensionCreateReminderPresenter.autoCompletReminderListScope(for:) should not be called", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

  v8 = type metadata accessor for TTRAutoCompleteReminderListScope(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a1, 1, 1, v8);
}

uint64_t sub_10000FA14(double a1)
{
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;

  if (qword_100025588 != -1)
    swift_once(&qword_100025588, sub_10000D1A8, a1);
  v1 = type metadata accessor for Logger(0);
  v2 = sub_10000CF9C(v1, (uint64_t)qword_100025C08);
  v3 = Logger.logObject.getter(v2);
  v4 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "TTRIExtensionCreateReminderPresenter.shouldApplyListOfAutoCompleteSuggestion() should not be called", v5, 2u);
    swift_slowDealloc(v5, -1, -1);
  }

  return 0;
}

uint64_t sub_10000FAE4()
{
  uint64_t v0;

  return sub_100010B94(*(uint64_t (**)(uint64_t))(v0 + 8), v0, (uint64_t)&_swiftEmptyArrayStorage);
}

uint64_t sub_10000FAFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t ObjectType;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  uint64_t v21;
  _QWORD v22[5];

  v4 = v3;
  v8 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v3 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor + 8);
  ObjectType = swift_getObjectType(*(_QWORD *)(v3
                                             + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
  v13 = (*(uint64_t (**)(uint64_t, uint64_t))(v11 + 24))(ObjectType, v11);
  if (!v13)
    return 0;
  v14 = (void *)v13;
  (*(void (**)(__int128 *__return_ptr, uint64_t, uint64_t))(v11 + 56))(&v20, ObjectType, v11);
  if (!v21)
  {

    sub_10000BA94((uint64_t)&v20, &qword_100025DD8);
    return 0;
  }
  sub_100010B7C(&v20, (uint64_t)v22);
  sub_100010BA8(a1, (uint64_t)v10);
  sub_10000CF10((uint64_t)v22, (uint64_t)&v20);
  v15 = *(_QWORD *)(v3
                  + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_editingSessionSharedProperties);
  v16 = swift_allocObject(&unk_100021348, 24, 7);
  swift_weakInit(v16 + 16, v4);
  v17 = type metadata accessor for TTRReminderStandaloneEditingSession(0);
  swift_allocObject(v17, *(unsigned int *)(v17 + 48), *(unsigned __int16 *)(v17 + 52));
  swift_bridgeObjectRetain(a3);
  swift_retain(v15);
  swift_retain(v16);
  v18 = TTRReminderStandaloneEditingSession.init(item:acquirerName:reminderChangeItem:attributeEditor:pendingMoveTargetListValue:setPendingMoveTargetList:sharedPropertiesWrapper:setNeedsDisplayHandler:)(v10, a2, a3, v14, &v20, sub_10000FCD8, 0, sub_10000FCE0, 0, v15, sub_100010BEC, v16);
  sub_10000CEF0(v22);
  swift_release(v16);
  return v18;
}

uint64_t sub_10000FCD8()
{
  return 0;
}

void sub_10000FCE0(id a1, double a2)
{
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;

  if (qword_100025588 != -1)
    swift_once(&qword_100025588, sub_10000D1A8, a2);
  v3 = type metadata accessor for Logger(0);
  sub_10000CF9C(v3, (uint64_t)qword_100025C08);
  v12 = a1;
  v4 = Logger.logObject.getter(v12);
  v5 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc(12, -1);
    v7 = swift_slowAlloc(32, -1);
    v14 = v7;
    *(_DWORD *)v6 = 136315138;
    if (a1)
      a1 = objc_msgSend(v12, "objectID");
    v8 = sub_100005DBC(&qword_100025DE0);
    v9 = Optional.descriptionOrNil.getter(v8);
    v11 = v10;

    v13 = sub_100017254(v9, v11, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v13, &v14, v6 + 4, v6 + 12);

    swift_bridgeObjectRelease(v11);
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "TTRIExtensionCreateReminderPresenter: setPendingMoveTargetList is called unexpectedly {listID: %s}", v6, 0xCu);
    swift_arrayDestroy(v7, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v7, -1, -1);
    swift_slowDealloc(v6, -1, -1);

  }
  else
  {

  }
}

uint64_t sub_10000FEDC(uint64_t a1, uint64_t a2)
{
  _QWORD *Strong;
  uint64_t v5;
  _QWORD *v6;
  Swift::String v7;
  _BYTE v9[24];

  Strong = (_QWORD *)TTRRemindersListEditingSessionDisplayTargets.cell.unsafeMutableAddressor();
  if ((*Strong & ~a1) == 0)
  {
    v5 = a2 + 16;
    swift_beginAccess(v5, v9, 0, 0);
    Strong = (_QWORD *)swift_weakLoadStrong(v5);
    if (Strong)
    {
      v6 = Strong;
      v7._object = (void *)0x800000010001C6E0;
      v7._countAndFlagsBits = 0xD000000000000011;
      TTRDeferredAction.scheduleNextRunLoop(reason:)(v7);
      Strong = (_QWORD *)swift_release(v6);
    }
  }
  return TTRRemindersListEditingSessionDisplayTargets.reminderEditingComponents.unsafeMutableAddressor(Strong);
}

uint64_t sub_10000FF70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_10000FAFC(a2, a3, a4);
}

unint64_t sub_10000FF80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t result;
  char v11;
  uint64_t *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005DBC(&qword_100025D98);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  v6 = v3 + 64;
  v7 = a1 + 32;
  swift_retain(v3);
  while (1)
  {
    sub_10000BAD0(v7, (uint64_t)&v16, &qword_100025DA0);
    v8 = v16;
    v9 = v17;
    result = sub_1000101CC(v16, v17);
    if ((v11 & 1) != 0)
      break;
    *(_QWORD *)(v6 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v12 = (uint64_t *)(v4[6] + 16 * result);
    *v12 = v8;
    v12[1] = v9;
    result = (unint64_t)sub_1000107B4(&v18, (_OWORD *)(v4[7] + 32 * result));
    v13 = v4[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4[2] = v15;
    v7 += 48;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000100B4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  void **v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t result;
  char v12;
  uint64_t *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;

  v2 = *(_QWORD *)(a1 + 16);
  if (!v2)
  {
    v4 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100005DBC(&qword_100025D90);
  v3 = static _DictionaryStorage.allocate(capacity:)(v2);
  v4 = (_QWORD *)v3;
  v5 = *(_QWORD *)(a1 + 16);
  if (!v5)
  {
LABEL_9:
    swift_bridgeObjectRelease(a1);
    return (unint64_t)v4;
  }
  swift_retain(v3);
  v6 = (void **)(a1 + 48);
  while (1)
  {
    v7 = (uint64_t)*(v6 - 2);
    v8 = (uint64_t)*(v6 - 1);
    v9 = *v6;
    swift_bridgeObjectRetain(v8);
    v10 = v9;
    result = sub_1000101CC(v7, v8);
    if ((v12 & 1) != 0)
      break;
    *(_QWORD *)((char *)v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v13 = (uint64_t *)(v4[6] + 16 * result);
    *v13 = v7;
    v13[1] = v8;
    *(_QWORD *)(v4[7] + 8 * result) = v10;
    v14 = v4[2];
    v15 = __OFADD__(v14, 1);
    v16 = v14 + 1;
    if (v15)
      goto LABEL_11;
    v4[2] = v16;
    v6 += 3;
    if (!--v5)
    {
      swift_release(v4);
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1000101CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_100010230(a1, a2, v5);
}

unint64_t sub_100010230(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

void sub_100010310(void *a1, id a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  NSString v12;
  id v13;

  v3 = a1;
  if (a1)
  {
    v4 = (void *)objc_opt_self(REMError);
    v5 = (void *)_convertErrorToNSError(_:)(v3);
    v3 = objc_msgSend(v4, "errorSanitizedForXPCFromError:", v5);

  }
  v6 = objc_msgSend(a2, "extensionContext");
  if (v6)
  {
    v7 = v6;
    if (v3)
    {
      v8 = v3;
    }
    else
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)(NSCocoaErrorDomain);
      v10 = v9;
      v11 = objc_allocWithZone((Class)NSError);
      v12 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v10);
      v8 = objc_msgSend(v11, "initWithDomain:code:userInfo:", v12, 3072, 0);

      v3 = 0;
    }
    swift_errorRetain(v3);
    v13 = (id)_convertErrorToNSError(_:)(v8);
    swift_errorRelease(v8);
    objc_msgSend(v7, "cancelRequestWithError:", v13);
    swift_errorRelease(v3);

  }
  else
  {
    swift_errorRelease(v3);
  }
}

_QWORD *sub_100010470(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void sub_100010494()
{
  uint64_t v0;

  sub_10000F144(v0);
}

void *sub_10001049C(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (result != (void *)1)
  {

    swift_bridgeObjectRelease(a3);
    return (void *)swift_bridgeObjectRelease(a5);
  }
  return result;
}

uint64_t *sub_1000104D8(uint64_t *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v2 = (void *)a1[2];
  v3 = (void *)a1[3];
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = (void *)a1[8];
  v8 = (void *)a1[9];
  sub_100010558(*a1, a1[1]);

  sub_100010568(v3, v4, v5, v6);
  return a1;
}

uint64_t sub_100010558(uint64_t result, uint64_t a2)
{
  if (result)
    return swift_release(a2);
  return result;
}

void *sub_100010568(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1)
  {
    sub_1000105A4(result);
    sub_1000105A4(a2);
    return (void *)swift_bridgeObjectRelease(a4);
  }
  return result;
}

void sub_1000105A4(id a1)
{
  if (a1 != (id)1)

}

void sub_1000105B4(id a1, char a2)
{
  if (a2 == 1)

}

uint64_t sub_1000105C8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = *(_QWORD *)(v0 + 56);
  if (v1 != 2)
  {
    if (*(unsigned __int8 *)(v0 + 24) != 255)
    {

      v1 = *(_QWORD *)(v0 + 56);
    }
    if (v1 != 1)
    {
      v2 = *(void **)(v0 + 32);
      if (v2 != (void *)1)

      v3 = *(void **)(v0 + 40);
      if (v3 != (void *)1)

      swift_bridgeObjectRelease(*(_QWORD *)(v0 + 56));
    }
  }
  swift_release(*(_QWORD *)(v0 + 72));
  return swift_deallocObject(v0, 81, 7);
}

void sub_100010640(uint64_t a1)
{
  uint64_t v1;

  sub_10000F3AC(a1, v1 + 16, *(_QWORD *)(v1 + 72), *(_BYTE *)(v1 + 80));
}

uint64_t sub_100010660(uint64_t a1)
{
  sub_100010698(*(void **)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return a1;
}

void *sub_100010698(void *result, char a2, void *a3, void *a4, uint64_t a5, uint64_t a6)
{
  if (a6 != 2)
  {
    sub_1000106F8(result, a2);
    return sub_10001070C(a3, a4, a5, a6);
  }
  return result;
}

id sub_1000106F8(id result, char a2)
{
  if (a2 != -1)
    return result;
  return result;
}

void *sub_10001070C(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  if (a4 != 1)
  {
    sub_100010748(result);
    sub_100010748(a2);
    return (void *)swift_bridgeObjectRetain(a4);
  }
  return result;
}

id sub_100010748(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

void sub_100010758(id a1, char a2)
{
  if (a2 != -1)

}

uint64_t sub_10001076C()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_100010790(void *a1, char a2)
{
  uint64_t v2;

  sub_10000E760(a1, a2 & 1, v2);
}

id sub_10001079C(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    return (id)swift_errorRetain(a1);
  else
    return a1;
}

void sub_1000107A8(void *a1, char a2)
{
  if ((a2 & 1) != 0)
    swift_errorRelease(a1);
  else

}

_OWORD *sub_1000107B4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1000107C4()
{
  uint64_t v0;
  uint64_t ReminderViewModel;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t Strong;
  uint64_t v14;
  _BYTE v16[24];

  ReminderViewModel = type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
  v2 = *(_QWORD *)(ReminderViewModel - 8);
  __chkstk_darwin(ReminderViewModel);
  v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v5 = sub_100005DBC(&qword_100025BE8);
  v6 = __chkstk_darwin(v5);
  v8 = &v16[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v6);
  v10 = &v16[-v9 - 8];
  sub_10000D238((uint64_t)&v16[-v9 - 8]);
  v11 = v0 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_viewModel;
  swift_beginAccess(v0 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_viewModel, v16, 33, 0);
  sub_10000CF54((uint64_t)v10, v11);
  swift_endAccess(v16);
  sub_10000BAD0(v11, (uint64_t)v8, &qword_100025BE8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v2 + 48))(v8, 1, ReminderViewModel) == 1)
    return sub_10000BA94((uint64_t)v8, &qword_100025BE8);
  sub_10000B584((uint64_t)v8, (uint64_t)v4, type metadata accessor for TTRIExtensionCreateReminderViewModel);
  Strong = swift_unknownObjectWeakLoadStrong(v0 + 16);
  if (Strong)
  {
    v14 = Strong;
    sub_100018384((uint64_t)v4);
    swift_unknownObjectRelease(v14);
  }
  return sub_100008650((uint64_t)v4, type metadata accessor for TTRIExtensionCreateReminderViewModel);
}

void sub_10001094C(id a1, unsigned __int8 a2)
{
  if (a2 != 255)

}

uint64_t sub_100010964(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(&type metadata for TTRReminderCellInlineHashtagVisibility - 1) + 32))(a2, a1);
  return a2;
}

_QWORD *sub_1000109A0(_QWORD *a1)
{
  swift_bridgeObjectRetain(*a1);
  return a1;
}

_QWORD *sub_1000109C8(_QWORD *a1)
{
  swift_bridgeObjectRelease(*a1);
  return a1;
}

uint64_t sub_1000109F0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = sub_100005DBC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id sub_100010A34(id result, void *a2, char a3)
{
  id v3;
  id v4;

  if (a3 != 2)
  {
    if (a3 == 1)
    {
      v4 = a2;
      swift_retain(result);
    }
    else
    {
      if (a3)
        return result;
      v4 = a2;
      v3 = result;
    }
    result = v4;
  }
  return result;
}

uint64_t sub_100010A88@<X0>(BOOL *a1@<X8>)
{
  uint64_t v1;

  return sub_10000EE50(v1, a1);
}

void sub_100010AA0(void *a1, void *a2, char a3)
{
  id v3;

  if (a3 != 2)
  {
    if (a3 == 1)
    {
      v3 = a2;
      swift_release(a1);
    }
    else
    {
      if (a3)
        return;
      v3 = a2;

    }
    a1 = v3;
  }

}

uint64_t sub_100010AF4(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain(result);
  }
  return swift_retain(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100010B38(uint64_t result, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release(result);
  }
  return swift_release(a2 & 0x3FFFFFFFFFFFFFFFLL);
}

uint64_t sub_100010B7C(__int128 *a1, uint64_t a2)
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

uint64_t sub_100010B94(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t sub_100010BA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100010BEC(uint64_t a1)
{
  uint64_t v1;

  return sub_10000FEDC(a1, v1);
}

uint64_t sub_100010BF4(uint64_t a1, uint64_t a2)
{
  swift_unknownObjectWeakDestroy(a1, a2);
  return a1;
}

void **sub_100010C18(void **a1, void **a2, int *a3)
{
  void **v3;
  int v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void **v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void **v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void **v22;
  void **v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int (*v26)(void **, uint64_t, uint64_t);
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void **v31;
  void **v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int (*v35)(void **, uint64_t, uint64_t);
  id v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void **v40;
  void **v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int (*v44)(void **, uint64_t, uint64_t);
  id v45;
  uint64_t v46;
  void *v47;
  id v48;
  void **v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  char *v57;
  uint64_t v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  void **v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  id v70;
  void **v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  id v75;
  void **v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(char *, char *, uint64_t);
  uint64_t v85;
  _QWORD *v86;
  _QWORD *v87;
  uint64_t v88;
  void *v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  id v99;
  void *v100;
  id v101;
  int *v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  unsigned __int8 v112;
  int v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint64_t v118;
  char v119;
  uint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  void *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  id v134;
  void *v135;
  id v136;
  int *v137;
  uint64_t v138;
  char *v139;
  char *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unsigned __int8 v147;
  int v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  uint64_t v153;
  char v154;
  uint64_t v155;
  void *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  id v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  id v169;
  void *v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  id v177;
  void *v178;
  id v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  void *v185;
  id v186;
  void *v187;
  id v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  uint64_t v195;
  uint64_t v196;
  int *v197;
  void *v198;
  void **v199;
  void **v200;
  uint64_t ReminderView;
  uint64_t v202;
  unsigned int (*v203)(void **, uint64_t, uint64_t);
  id v204;
  id v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  char *v209;
  char *v210;
  uint64_t v211;
  void (*v212)(char *, char *, uint64_t);
  id v213;
  uint64_t v214;
  void *v215;
  void (*v216)(void **, _QWORD, uint64_t, uint64_t);
  id v217;
  uint64_t v218;
  char *v219;
  char *v220;
  int v221;
  char v222;
  uint64_t v223;
  id v224;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  char *v230;
  int *v231;
  int *v232;
  uint64_t v233;
  uint64_t v234;
  void **v235;

  v3 = a2;
  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v13 = (char *)*a2;
    *a1 = *a2;
    a1 = (void **)&v13[(v4 + 16) & ~(unint64_t)v4];
    swift_retain(v13);
  }
  else
  {
    v6 = type metadata accessor for TTRRemindersListViewModel.Item(0);
    switch(swift_getEnumCaseMultiPayload(v3, v6))
    {
      case 0u:
        v7 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v233 = v6;
        switch(swift_getEnumCaseMultiPayload(v3, v7))
        {
          case 1u:
            v8 = *v3;
            *a1 = *v3;
            v9 = v8;
            v10 = a1;
            v11 = v7;
            v12 = 1;
            goto LABEL_43;
          case 2u:
            v93 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v93 - 8) + 16))(a1, v3, v93);
            v10 = a1;
            v11 = v7;
            v12 = 2;
            goto LABEL_43;
          case 3u:
            v94 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v94 - 8) + 16))(a1, v3, v94);
            v10 = a1;
            v11 = v7;
            v12 = 3;
            goto LABEL_43;
          case 4u:
            v95 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v95 - 8) + 16))(a1, v3, v95);
            v10 = a1;
            v11 = v7;
            v12 = 4;
            goto LABEL_43;
          case 5u:
            v96 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v96 - 8) + 16))(a1, v3, v96);
            v10 = a1;
            v11 = v7;
            v12 = 5;
            goto LABEL_43;
          case 6u:
            v97 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v97 - 8) + 16))(a1, v3, v97);
            v10 = a1;
            v11 = v7;
            v12 = 6;
            goto LABEL_43;
          case 8u:
            v98 = *v3;
            *a1 = *v3;
            v99 = v98;
            v10 = a1;
            v11 = v7;
            v12 = 8;
            goto LABEL_43;
          case 9u:
            v100 = *v3;
            *a1 = *v3;
            v101 = v100;
            v10 = a1;
            v11 = v7;
            v12 = 9;
LABEL_43:
            swift_storeEnumTagMultiPayload(v10, v11, v12);
            break;
          default:
            memcpy(a1, v3, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
            break;
        }
        v102 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
        v103 = v102[5];
        v104 = (char *)a1 + v103;
        v105 = (char *)v3 + v103;
        v106 = *(uint64_t *)((char *)v3 + v103 + 8);
        if (v106)
        {
          *(_QWORD *)v104 = *(_QWORD *)v105;
          *((_QWORD *)v104 + 1) = v106;
          v107 = (void *)*((_QWORD *)v105 + 2);
          v108 = *((_QWORD *)v105 + 3);
          v109 = *((_QWORD *)v105 + 4);
          v110 = *((_QWORD *)v105 + 5);
          v111 = *((_QWORD *)v105 + 7);
          v226 = *((_QWORD *)v105 + 6);
          v231 = v102;
          v112 = v105[64];
          swift_bridgeObjectRetain(v106);
          sub_100005D58(v107, v108, v109, v110, v226, v111, v112);
          *((_QWORD *)v104 + 2) = v107;
          *((_QWORD *)v104 + 3) = v108;
          *((_QWORD *)v104 + 4) = v109;
          *((_QWORD *)v104 + 5) = v110;
          *((_QWORD *)v104 + 6) = v226;
          *((_QWORD *)v104 + 7) = v111;
          v104[64] = v112;
          *(_DWORD *)(v104 + 65) = *(_DWORD *)(v105 + 65);
          v113 = v105[120];
          if (v113 == 255)
          {
            v114 = *(_OWORD *)(v105 + 88);
            *(_OWORD *)(v104 + 72) = *(_OWORD *)(v105 + 72);
            *(_OWORD *)(v104 + 88) = v114;
            *(_OWORD *)(v104 + 104) = *(_OWORD *)(v105 + 104);
            v104[120] = v105[120];
          }
          else
          {
            v119 = v113 & 1;
            v121 = (void *)*((_QWORD *)v105 + 9);
            v120 = *((_QWORD *)v105 + 10);
            v122 = *((_QWORD *)v105 + 11);
            v123 = *((_QWORD *)v105 + 12);
            v124 = *((_QWORD *)v105 + 13);
            v227 = *((_QWORD *)v105 + 14);
            sub_100005D80(v121, v120, v122, v123, v124, v227, v113 & 1);
            *((_QWORD *)v104 + 9) = v121;
            *((_QWORD *)v104 + 10) = v120;
            *((_QWORD *)v104 + 11) = v122;
            *((_QWORD *)v104 + 12) = v123;
            *((_QWORD *)v104 + 13) = v124;
            *((_QWORD *)v104 + 14) = v227;
            v104[120] = v119;
          }
          v102 = v231;
          v118 = v233;
          v104[121] = v105[121];
        }
        else
        {
          v115 = *((_OWORD *)v105 + 5);
          *((_OWORD *)v104 + 4) = *((_OWORD *)v105 + 4);
          *((_OWORD *)v104 + 5) = v115;
          *((_OWORD *)v104 + 6) = *((_OWORD *)v105 + 6);
          *(_OWORD *)(v104 + 106) = *(_OWORD *)(v105 + 106);
          v116 = *((_OWORD *)v105 + 1);
          *(_OWORD *)v104 = *(_OWORD *)v105;
          *((_OWORD *)v104 + 1) = v116;
          v117 = *((_OWORD *)v105 + 3);
          *((_OWORD *)v104 + 2) = *((_OWORD *)v105 + 2);
          *((_OWORD *)v104 + 3) = v117;
          v118 = v6;
        }
        *((_BYTE *)a1 + v102[6]) = *((_BYTE *)v3 + v102[6]);
        *((_BYTE *)a1 + v102[7]) = *((_BYTE *)v3 + v102[7]);
        *((_BYTE *)a1 + v102[8]) = *((_BYTE *)v3 + v102[8]);
        *((_BYTE *)a1 + v102[9]) = *((_BYTE *)v3 + v102[9]);
        *((_BYTE *)a1 + v102[10]) = *((_BYTE *)v3 + v102[10]);
        v125 = v102[11];
        v126 = *(void **)((char *)v3 + v125);
        *(void **)((char *)a1 + v125) = v126;
        v127 = v126;
        v49 = a1;
        v50 = v118;
        v51 = 0;
        goto LABEL_100;
      case 1u:
        v14 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v234 = v6;
        switch(swift_getEnumCaseMultiPayload(v3, v14))
        {
          case 1u:
            v15 = *v3;
            *a1 = *v3;
            v16 = v15;
            v17 = a1;
            v18 = v14;
            v19 = 1;
            goto LABEL_59;
          case 2u:
            v128 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v128 - 8) + 16))(a1, v3, v128);
            v17 = a1;
            v18 = v14;
            v19 = 2;
            goto LABEL_59;
          case 3u:
            v129 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v129 - 8) + 16))(a1, v3, v129);
            v17 = a1;
            v18 = v14;
            v19 = 3;
            goto LABEL_59;
          case 4u:
            v130 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v130 - 8) + 16))(a1, v3, v130);
            v17 = a1;
            v18 = v14;
            v19 = 4;
            goto LABEL_59;
          case 5u:
            v131 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v131 - 8) + 16))(a1, v3, v131);
            v17 = a1;
            v18 = v14;
            v19 = 5;
            goto LABEL_59;
          case 6u:
            v132 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v132 - 8) + 16))(a1, v3, v132);
            v17 = a1;
            v18 = v14;
            v19 = 6;
            goto LABEL_59;
          case 8u:
            v133 = *v3;
            *a1 = *v3;
            v134 = v133;
            v17 = a1;
            v18 = v14;
            v19 = 8;
            goto LABEL_59;
          case 9u:
            v135 = *v3;
            *a1 = *v3;
            v136 = v135;
            v17 = a1;
            v18 = v14;
            v19 = 9;
LABEL_59:
            swift_storeEnumTagMultiPayload(v17, v18, v19);
            break;
          default:
            memcpy(a1, v3, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
            break;
        }
        v137 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
        v138 = v137[5];
        v139 = (char *)a1 + v138;
        v140 = (char *)v3 + v138;
        v141 = *(uint64_t *)((char *)v3 + v138 + 8);
        if (v141)
        {
          *(_QWORD *)v139 = *(_QWORD *)v140;
          *((_QWORD *)v139 + 1) = v141;
          v143 = (void *)*((_QWORD *)v140 + 2);
          v142 = *((_QWORD *)v140 + 3);
          v144 = *((_QWORD *)v140 + 4);
          v145 = *((_QWORD *)v140 + 5);
          v146 = *((_QWORD *)v140 + 6);
          v228 = *((_QWORD *)v140 + 7);
          v232 = v137;
          v147 = v140[64];
          swift_bridgeObjectRetain(v141);
          sub_100005D58(v143, v142, v144, v145, v146, v228, v147);
          *((_QWORD *)v139 + 2) = v143;
          *((_QWORD *)v139 + 3) = v142;
          *((_QWORD *)v139 + 4) = v144;
          *((_QWORD *)v139 + 5) = v145;
          *((_QWORD *)v139 + 6) = v146;
          *((_QWORD *)v139 + 7) = v228;
          v139[64] = v147;
          *(_DWORD *)(v139 + 65) = *(_DWORD *)(v140 + 65);
          v148 = v140[120];
          if (v148 == 255)
          {
            v149 = *(_OWORD *)(v140 + 88);
            *(_OWORD *)(v139 + 72) = *(_OWORD *)(v140 + 72);
            *(_OWORD *)(v139 + 88) = v149;
            *(_OWORD *)(v139 + 104) = *(_OWORD *)(v140 + 104);
            v139[120] = v140[120];
          }
          else
          {
            v154 = v148 & 1;
            v156 = (void *)*((_QWORD *)v140 + 9);
            v155 = *((_QWORD *)v140 + 10);
            v157 = *((_QWORD *)v140 + 11);
            v158 = *((_QWORD *)v140 + 12);
            v159 = *((_QWORD *)v140 + 13);
            v229 = *((_QWORD *)v140 + 14);
            sub_100005D80(v156, v155, v157, v158, v159, v229, v148 & 1);
            *((_QWORD *)v139 + 9) = v156;
            *((_QWORD *)v139 + 10) = v155;
            *((_QWORD *)v139 + 11) = v157;
            *((_QWORD *)v139 + 12) = v158;
            *((_QWORD *)v139 + 13) = v159;
            *((_QWORD *)v139 + 14) = v229;
            v139[120] = v154;
          }
          v137 = v232;
          v153 = v234;
          v139[121] = v140[121];
        }
        else
        {
          v150 = *((_OWORD *)v140 + 5);
          *((_OWORD *)v139 + 4) = *((_OWORD *)v140 + 4);
          *((_OWORD *)v139 + 5) = v150;
          *((_OWORD *)v139 + 6) = *((_OWORD *)v140 + 6);
          *(_OWORD *)(v139 + 106) = *(_OWORD *)(v140 + 106);
          v151 = *((_OWORD *)v140 + 1);
          *(_OWORD *)v139 = *(_OWORD *)v140;
          *((_OWORD *)v139 + 1) = v151;
          v152 = *((_OWORD *)v140 + 3);
          *((_OWORD *)v139 + 2) = *((_OWORD *)v140 + 2);
          *((_OWORD *)v139 + 3) = v152;
          v153 = v6;
        }
        *((_BYTE *)a1 + v137[6]) = *((_BYTE *)v3 + v137[6]);
        *((_BYTE *)a1 + v137[7]) = *((_BYTE *)v3 + v137[7]);
        *((_BYTE *)a1 + v137[8]) = *((_BYTE *)v3 + v137[8]);
        *((_BYTE *)a1 + v137[9]) = *((_BYTE *)v3 + v137[9]);
        *((_BYTE *)a1 + v137[10]) = *((_BYTE *)v3 + v137[10]);
        v160 = v137[11];
        v161 = *(void **)((char *)v3 + v160);
        *(void **)((char *)a1 + v160) = v161;
        v162 = v161;
        v49 = a1;
        v50 = v153;
        v51 = 1;
        goto LABEL_100;
      case 2u:
        v20 = *v3;
        *a1 = *v3;
        v21 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v22 = (void **)((char *)a1 + v21);
        v23 = (void **)((char *)v3 + v21);
        v24 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v25 = *(_QWORD *)(v24 - 8);
        v26 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v25 + 48);
        v27 = v20;
        if (v26(v23, 1, v24))
        {
          v28 = sub_100005DBC(&qword_100025908);
          memcpy(v22, v23, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v23, v24))
          {
            case 1u:
              v64 = *v23;
              *v22 = *v23;
              v65 = v64;
              v66 = v22;
              v67 = v24;
              v68 = 1;
              goto LABEL_75;
            case 2u:
              v163 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v163 - 8) + 16))(v22, v23, v163);
              v66 = v22;
              v67 = v24;
              v68 = 2;
              goto LABEL_75;
            case 3u:
              v164 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v164 - 8) + 16))(v22, v23, v164);
              v66 = v22;
              v67 = v24;
              v68 = 3;
              goto LABEL_75;
            case 4u:
              v165 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v165 - 8) + 16))(v22, v23, v165);
              v66 = v22;
              v67 = v24;
              v68 = 4;
              goto LABEL_75;
            case 5u:
              v166 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v166 - 8) + 16))(v22, v23, v166);
              v66 = v22;
              v67 = v24;
              v68 = 5;
              goto LABEL_75;
            case 6u:
              v167 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v167 - 8) + 16))(v22, v23, v167);
              v66 = v22;
              v67 = v24;
              v68 = 6;
              goto LABEL_75;
            case 8u:
              v168 = *v23;
              *v22 = *v23;
              v169 = v168;
              v66 = v22;
              v67 = v24;
              v68 = 8;
              goto LABEL_75;
            case 9u:
              v170 = *v23;
              *v22 = *v23;
              v171 = v170;
              v66 = v22;
              v67 = v24;
              v68 = 9;
LABEL_75:
              swift_storeEnumTagMultiPayload(v66, v67, v68);
              break;
            default:
              memcpy(v22, v23, *(_QWORD *)(v25 + 64));
              break;
          }
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
        }
        v49 = a1;
        v50 = v6;
        v51 = 2;
        goto LABEL_100;
      case 3u:
        v29 = *v3;
        *a1 = *v3;
        v30 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v31 = (void **)((char *)a1 + v30);
        v32 = (void **)((char *)v3 + v30);
        v33 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v34 = *(_QWORD *)(v33 - 8);
        v35 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v34 + 48);
        v36 = v29;
        if (v35(v32, 1, v33))
        {
          v37 = sub_100005DBC(&qword_100025908);
          memcpy(v31, v32, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v32, v33))
          {
            case 1u:
              v69 = *v32;
              *v31 = *v32;
              v70 = v69;
              v71 = v31;
              v72 = v33;
              v73 = 1;
              goto LABEL_97;
            case 2u:
              v172 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v172 - 8) + 16))(v31, v32, v172);
              v71 = v31;
              v72 = v33;
              v73 = 2;
              goto LABEL_97;
            case 3u:
              v173 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v173 - 8) + 16))(v31, v32, v173);
              v71 = v31;
              v72 = v33;
              v73 = 3;
              goto LABEL_97;
            case 4u:
              v174 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v174 - 8) + 16))(v31, v32, v174);
              v71 = v31;
              v72 = v33;
              v73 = 4;
              goto LABEL_97;
            case 5u:
              v189 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v189 - 8) + 16))(v31, v32, v189);
              v71 = v31;
              v72 = v33;
              v73 = 5;
              goto LABEL_97;
            case 6u:
              v175 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v175 - 8) + 16))(v31, v32, v175);
              v71 = v31;
              v72 = v33;
              v73 = 6;
              goto LABEL_97;
            case 8u:
              v176 = *v32;
              *v31 = *v32;
              v177 = v176;
              v71 = v31;
              v72 = v33;
              v73 = 8;
              goto LABEL_97;
            case 9u:
              v178 = *v32;
              *v31 = *v32;
              v179 = v178;
              v71 = v31;
              v72 = v33;
              v73 = 9;
LABEL_97:
              swift_storeEnumTagMultiPayload(v71, v72, v73);
              break;
            default:
              memcpy(v31, v32, *(_QWORD *)(v34 + 64));
              break;
          }
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
        }
        v49 = a1;
        v50 = v6;
        v51 = 3;
        goto LABEL_100;
      case 4u:
        v38 = *v3;
        *a1 = *v3;
        v39 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v40 = (void **)((char *)a1 + v39);
        v41 = (void **)((char *)v3 + v39);
        v42 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v43 = *(_QWORD *)(v42 - 8);
        v44 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v43 + 48);
        v45 = v38;
        if (v44(v41, 1, v42))
        {
          v46 = sub_100005DBC(&qword_100025908);
          memcpy(v40, v41, *(_QWORD *)(*(_QWORD *)(v46 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v41, v42))
          {
            case 1u:
              v74 = *v41;
              *v40 = *v41;
              v75 = v74;
              v76 = v40;
              v77 = v42;
              v78 = 1;
              goto LABEL_93;
            case 2u:
              v180 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v180 - 8) + 16))(v40, v41, v180);
              v76 = v40;
              v77 = v42;
              v78 = 2;
              goto LABEL_93;
            case 3u:
              v181 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v181 - 8) + 16))(v40, v41, v181);
              v76 = v40;
              v77 = v42;
              v78 = 3;
              goto LABEL_93;
            case 4u:
              v182 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v182 - 8) + 16))(v40, v41, v182);
              v76 = v40;
              v77 = v42;
              v78 = 4;
              goto LABEL_93;
            case 5u:
              v183 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v183 - 8) + 16))(v40, v41, v183);
              v76 = v40;
              v77 = v42;
              v78 = 5;
              goto LABEL_93;
            case 6u:
              v184 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v184 - 8) + 16))(v40, v41, v184);
              v76 = v40;
              v77 = v42;
              v78 = 6;
              goto LABEL_93;
            case 8u:
              v185 = *v41;
              *v40 = *v41;
              v186 = v185;
              v76 = v40;
              v77 = v42;
              v78 = 8;
              goto LABEL_93;
            case 9u:
              v187 = *v41;
              *v40 = *v41;
              v188 = v187;
              v76 = v40;
              v77 = v42;
              v78 = 9;
LABEL_93:
              swift_storeEnumTagMultiPayload(v76, v77, v78);
              break;
            default:
              memcpy(v40, v41, *(_QWORD *)(v43 + 64));
              break;
          }
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v43 + 56))(v40, 0, 1, v42);
        }
        v49 = a1;
        v50 = v6;
        v51 = 4;
        goto LABEL_100;
      case 5u:
        *a1 = *v3;
        *((_BYTE *)a1 + 8) = *((_BYTE *)v3 + 8);
        *(_WORD *)((char *)a1 + 9) = *(_WORD *)((char *)v3 + 9);
        v47 = v3[2];
        a1[2] = v47;
        v48 = v47;
        v49 = a1;
        v50 = v6;
        v51 = 5;
        goto LABEL_100;
      case 6u:
        v59 = *v3;
        *a1 = *v3;
        v60 = v59;
        v49 = a1;
        v50 = v6;
        v51 = 6;
        goto LABEL_100;
      case 7u:
        v52 = type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState(0);
        v53 = *(_QWORD *)(v52 - 8);
        if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v53 + 48))(v3, 1, v52))
        {
          v54 = sub_100005DBC(&qword_100025910);
          memcpy(a1, v3, *(_QWORD *)(*(_QWORD *)(v54 - 8) + 64));
        }
        else
        {
          v79 = *v3;
          *a1 = *v3;
          v80 = *(int *)(v52 + 20);
          v230 = (char *)a1 + v80;
          v81 = (char *)v3 + v80;
          v82 = type metadata accessor for REMHashtagLabelSpecifier(0);
          v83 = v6;
          v84 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v82 - 8) + 16);
          swift_bridgeObjectRetain(v79);
          v84(v230, v81, v82);
          v6 = v83;
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v53 + 56))(a1, 0, 1, v52);
        }
        v85 = *(int *)(type metadata accessor for TTRRemindersListViewModel.HashtagsState(0) + 20);
        v86 = (void **)((char *)a1 + v85);
        v87 = (void **)((char *)v3 + v85);
        v88 = v87[1];
        if (v88)
        {
          *v86 = *v87;
          v86[1] = v88;
          v89 = (void *)v87[2];
          v86[2] = v89;
          swift_bridgeObjectRetain(v88);
          v90 = v89;
        }
        else
        {
          *(_OWORD *)v86 = *(_OWORD *)v87;
          v86[2] = v87[2];
        }
        v49 = a1;
        v50 = v6;
        v51 = 7;
        goto LABEL_100;
      case 8u:
        v61 = type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription(0);
        v62 = *(_QWORD *)(v61 - 8);
        if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v62 + 48))(v3, 1, v61))
        {
          v63 = type metadata accessor for TTRTemplatePublicLinkData.StateToDisplay(0);
          memcpy(a1, v3, *(_QWORD *)(*(_QWORD *)(v63 - 8) + 64));
        }
        else
        {
          v91 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v91 - 8) + 16))(a1, v3, v91);
          *((_BYTE *)a1 + *(int *)(v61 + 20)) = *((_BYTE *)v3 + *(int *)(v61 + 20));
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v62 + 56))(a1, 0, 1, v61);
        }
        v92 = *(int *)(type metadata accessor for TTRTemplatePublicLinkData(0) + 20);
        v49 = a1;
        *(void **)((char *)a1 + v92) = *(void **)((char *)v3 + v92);
        v50 = v6;
        v51 = 8;
        goto LABEL_100;
      case 9u:
        *(_BYTE *)a1 = *(_BYTE *)v3;
        v55 = *(int *)(type metadata accessor for TTRRemindersListTips(0) + 20);
        v56 = (char *)a1 + v55;
        v57 = (char *)v3 + v55;
        v58 = type metadata accessor for AnyTip(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v58 - 8) + 16))(v56, v57, v58);
        v49 = a1;
        v50 = v6;
        v51 = 9;
LABEL_100:
        swift_storeEnumTagMultiPayload(v49, v50, v51);
        break;
      default:
        memcpy(a1, v3, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
        break;
    }
    v190 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)v3 + a3[5]);
    v191 = *(void **)((char *)v3 + v190);
    *(void **)((char *)a1 + v190) = v191;
    v192 = a3[7];
    v193 = a3[8];
    v194 = *(void **)((char *)v3 + v192);
    *(void **)((char *)a1 + v192) = v194;
    *((_BYTE *)a1 + v193) = *((_BYTE *)v3 + v193);
    v195 = a3[9];
    v196 = a3[10];
    v197 = a3;
    v198 = *(void **)((char *)v3 + v195);
    *(void **)((char *)a1 + v195) = v198;
    v199 = (void **)((char *)a1 + v196);
    v200 = (void **)((char *)v3 + v196);
    ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
    v202 = *(_QWORD *)(ReminderView - 8);
    v203 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v202 + 48);
    v204 = v191;
    v205 = v194;
    swift_bridgeObjectRetain(v198);
    if (v203(v200, 1, ReminderView))
    {
      v206 = sub_100005DBC(&qword_100025DB0);
      memcpy(v199, v200, *(_QWORD *)(*(_QWORD *)(v206 - 8) + 64));
    }
    else
    {
      v207 = *v200;
      *v199 = *v200;
      v208 = *(int *)(ReminderView + 20);
      v209 = (char *)v199 + v208;
      v210 = (char *)v200 + v208;
      v211 = type metadata accessor for URL(0);
      v235 = v3;
      v212 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v211 - 8) + 16);
      v213 = v207;
      v212(v209, v210, v211);
      v214 = *(int *)(ReminderView + 24);
      v215 = *(void **)((char *)v200 + v214);
      *(void **)((char *)v199 + v214) = v215;
      v216 = *(void (**)(void **, _QWORD, uint64_t, uint64_t))(v202 + 56);
      v217 = v215;
      v216(v199, 0, 1, ReminderView);
      v3 = v235;
    }
    v218 = v197[11];
    v219 = (char *)a1 + v218;
    v220 = (char *)v3 + v218;
    v221 = v220[8];
    if (v221 == 255)
    {
      *(_QWORD *)v219 = *(_QWORD *)v220;
      v219[8] = v220[8];
    }
    else
    {
      v222 = v221 & 1;
      v223 = *(_QWORD *)v220;
      v224 = *(id *)v220;
      *(_QWORD *)v219 = v223;
      v219[8] = v222;
    }
  }
  return a1;
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(uint64_t a1)
{
  return sub_10000A1D4(a1, qword_100025EF0, (uint64_t)&nominal type descriptor for TTRIExtensionCreateReminderViewModel.Link);
}

void sub_100011DD0(_QWORD *a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  int v24;
  id *v25;
  uint64_t ReminderView;
  char *v27;
  uint64_t v28;
  id *v29;

  v4 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  switch(swift_getEnumCaseMultiPayload(a1, v4))
  {
    case 0u:
      v5 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      switch(swift_getEnumCaseMultiPayload(a1, v5))
      {
        case 1u:
        case 8u:
        case 9u:
          goto LABEL_22;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
          goto LABEL_4;
        default:
          goto LABEL_23;
      }
      goto LABEL_23;
    case 1u:
      v6 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      switch(swift_getEnumCaseMultiPayload(a1, v6))
      {
        case 1u:
        case 8u:
        case 9u:
LABEL_22:

          break;
        case 2u:
        case 3u:
        case 4u:
        case 5u:
        case 6u:
LABEL_4:
          v7 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
          break;
        default:
          break;
      }
LABEL_23:
      v21 = type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
      v22 = (char *)a1 + *(int *)(v21 + 20);
      v23 = *((_QWORD *)v22 + 1);
      if (v23)
      {
        swift_bridgeObjectRelease(v23);
        sub_10000628C(*((void **)v22 + 2), *((_QWORD *)v22 + 3), *((_QWORD *)v22 + 4), *((_QWORD *)v22 + 5), *((_QWORD *)v22 + 6), *((_QWORD *)v22 + 7), v22[64]);
        v24 = v22[120];
        if (v24 != 255)
          sub_1000062B4(*((void **)v22 + 9), *((_QWORD *)v22 + 10), *((_QWORD *)v22 + 11), *((_QWORD *)v22 + 12), *((_QWORD *)v22 + 13), *((_QWORD *)v22 + 14), v24 & 1);
      }
      v13 = *(id *)((char *)a1 + *(int *)(v21 + 44));
      goto LABEL_27;
    case 2u:

      v8 = (id *)((char *)a1 + *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20));
      v9 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 48))(v8, 1, v9))
      {
        switch(swift_getEnumCaseMultiPayload(v8, v9))
        {
          case 1u:
          case 8u:
          case 9u:
            goto LABEL_32;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            goto LABEL_11;
          default:
            goto LABEL_28;
        }
      }
      goto LABEL_28;
    case 3u:

      v8 = (id *)((char *)a1 + *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20));
      v10 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v8, 1, v10))
      {
        switch(swift_getEnumCaseMultiPayload(v8, v10))
        {
          case 1u:
          case 8u:
          case 9u:
            goto LABEL_32;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
            goto LABEL_11;
          default:
            goto LABEL_28;
        }
      }
      goto LABEL_28;
    case 4u:

      v8 = (id *)((char *)a1 + *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20));
      v11 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v8, 1, v11))
      {
        switch(swift_getEnumCaseMultiPayload(v8, v11))
        {
          case 1u:
          case 8u:
          case 9u:
LABEL_32:
            v13 = *v8;
            goto LABEL_27;
          case 2u:
          case 3u:
          case 4u:
          case 5u:
          case 6u:
LABEL_11:
            v12 = type metadata accessor for Date(0);
            goto LABEL_21;
          default:
            goto LABEL_28;
        }
      }
      goto LABEL_28;
    case 5u:
      v13 = (id)a1[2];
      goto LABEL_27;
    case 6u:
      v13 = (id)*a1;
      goto LABEL_27;
    case 7u:
      v14 = type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState(0);
      if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 48))(a1, 1, v14))
      {
        swift_bridgeObjectRelease(*a1);
        v15 = (char *)a1 + *(int *)(v14 + 20);
        v16 = type metadata accessor for REMHashtagLabelSpecifier(0);
        (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
      }
      v17 = (char *)a1 + *(int *)(type metadata accessor for TTRRemindersListViewModel.HashtagsState(0) + 20);
      v18 = *((_QWORD *)v17 + 1);
      if (!v18)
        goto LABEL_28;
      swift_bridgeObjectRelease(v18);
      v13 = (id)*((_QWORD *)v17 + 2);
LABEL_27:

LABEL_28:
      swift_bridgeObjectRelease(*(_QWORD *)((char *)a1 + a2[9]));
      v25 = (id *)((char *)a1 + a2[10]);
      ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
      if (!(*(unsigned int (**)(id *, uint64_t, uint64_t))(*(_QWORD *)(ReminderView - 8) + 48))(v25, 1, ReminderView))
      {

        v27 = (char *)v25 + *(int *)(ReminderView + 20);
        v28 = type metadata accessor for URL(0);
        (*(void (**)(char *, uint64_t))(*(_QWORD *)(v28 - 8) + 8))(v27, v28);

      }
      v29 = (id *)((char *)a1 + a2[11]);
      if (*((unsigned __int8 *)v29 + 8) != 255)

      return;
    case 8u:
      v19 = type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription(0);
      if (!(*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 48))(a1, 1, v19))
      {
        v20 = type metadata accessor for Date(0);
        (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v20 - 8) + 8))(a1, v20);
      }
      goto LABEL_28;
    case 9u:
      v8 = (id *)((char *)a1 + *(int *)(type metadata accessor for TTRRemindersListTips(0) + 20));
      v12 = type metadata accessor for AnyTip(0);
LABEL_21:
      (*(void (**)(id *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v8, v12);
      goto LABEL_28;
    default:
      goto LABEL_28;
  }
}

void **sub_100012248(void **a1, void **a2, int *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void **v20;
  void **v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(void **, uint64_t, uint64_t);
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void **v29;
  void **v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int (*v33)(void **, uint64_t, uint64_t);
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void **v38;
  void **v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int (*v42)(void **, uint64_t, uint64_t);
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void **v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  void **v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  void **v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  void **v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(char *, char *, uint64_t);
  uint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  void *v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  id v97;
  void *v98;
  id v99;
  int *v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  unsigned __int8 v110;
  int v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  uint64_t v116;
  char v117;
  uint64_t v118;
  void *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  id v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  id v132;
  void *v133;
  id v134;
  int *v135;
  uint64_t v136;
  char *v137;
  char *v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  uint64_t v151;
  char v152;
  uint64_t v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  id v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  id v167;
  void *v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  id v175;
  void *v176;
  id v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  id v184;
  void *v185;
  id v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  uint64_t v193;
  uint64_t v194;
  int *v195;
  void *v196;
  void **v197;
  void **v198;
  uint64_t ReminderView;
  uint64_t v200;
  unsigned int (*v201)(void **, uint64_t, uint64_t);
  id v202;
  id v203;
  uint64_t v204;
  void *v205;
  uint64_t v206;
  char *v207;
  char *v208;
  uint64_t v209;
  void (*v210)(char *, char *, uint64_t);
  id v211;
  uint64_t v212;
  void *v213;
  void (*v214)(void **, _QWORD, uint64_t, uint64_t);
  id v215;
  uint64_t v216;
  char *v217;
  char *v218;
  int v219;
  char v220;
  uint64_t v221;
  id v222;
  uint64_t v224;
  uint64_t v225;
  char *v226;
  int *v227;
  unsigned __int8 v228;
  uint64_t v229;
  int *v230;
  uint64_t v231;
  uint64_t v232;
  void **v233;

  v5 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  switch(swift_getEnumCaseMultiPayload(a2, v5))
  {
    case 0u:
      v6 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v231 = v5;
      switch(swift_getEnumCaseMultiPayload(a2, v6))
      {
        case 1u:
          v7 = *a2;
          *a1 = *a2;
          v8 = v7;
          v9 = a1;
          v10 = v6;
          v11 = 1;
          goto LABEL_41;
        case 2u:
          v91 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v91 - 8) + 16))(a1, a2, v91);
          v9 = a1;
          v10 = v6;
          v11 = 2;
          goto LABEL_41;
        case 3u:
          v92 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v92 - 8) + 16))(a1, a2, v92);
          v9 = a1;
          v10 = v6;
          v11 = 3;
          goto LABEL_41;
        case 4u:
          v93 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v93 - 8) + 16))(a1, a2, v93);
          v9 = a1;
          v10 = v6;
          v11 = 4;
          goto LABEL_41;
        case 5u:
          v94 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v94 - 8) + 16))(a1, a2, v94);
          v9 = a1;
          v10 = v6;
          v11 = 5;
          goto LABEL_41;
        case 6u:
          v95 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v95 - 8) + 16))(a1, a2, v95);
          v9 = a1;
          v10 = v6;
          v11 = 6;
          goto LABEL_41;
        case 8u:
          v96 = *a2;
          *a1 = *a2;
          v97 = v96;
          v9 = a1;
          v10 = v6;
          v11 = 8;
          goto LABEL_41;
        case 9u:
          v98 = *a2;
          *a1 = *a2;
          v99 = v98;
          v9 = a1;
          v10 = v6;
          v11 = 9;
LABEL_41:
          swift_storeEnumTagMultiPayload(v9, v10, v11);
          break;
        default:
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
          break;
      }
      v100 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
      v101 = v100[5];
      v102 = (char *)a1 + v101;
      v103 = (char *)a2 + v101;
      v104 = *(uint64_t *)((char *)a2 + v101 + 8);
      if (v104)
      {
        *(_QWORD *)v102 = *(_QWORD *)v103;
        *((_QWORD *)v102 + 1) = v104;
        v105 = (void *)*((_QWORD *)v103 + 2);
        v106 = *((_QWORD *)v103 + 3);
        v107 = *((_QWORD *)v103 + 4);
        v108 = *((_QWORD *)v103 + 5);
        v109 = *((_QWORD *)v103 + 7);
        v224 = *((_QWORD *)v103 + 6);
        v227 = v100;
        v110 = v103[64];
        swift_bridgeObjectRetain(v104);
        sub_100005D58(v105, v106, v107, v108, v224, v109, v110);
        *((_QWORD *)v102 + 2) = v105;
        *((_QWORD *)v102 + 3) = v106;
        *((_QWORD *)v102 + 4) = v107;
        *((_QWORD *)v102 + 5) = v108;
        *((_QWORD *)v102 + 6) = v224;
        *((_QWORD *)v102 + 7) = v109;
        v102[64] = v110;
        *(_DWORD *)(v102 + 65) = *(_DWORD *)(v103 + 65);
        v111 = v103[120];
        if (v111 == 255)
        {
          v112 = *(_OWORD *)(v103 + 88);
          *(_OWORD *)(v102 + 72) = *(_OWORD *)(v103 + 72);
          *(_OWORD *)(v102 + 88) = v112;
          *(_OWORD *)(v102 + 104) = *(_OWORD *)(v103 + 104);
          v102[120] = v103[120];
        }
        else
        {
          v117 = v111 & 1;
          v119 = (void *)*((_QWORD *)v103 + 9);
          v118 = *((_QWORD *)v103 + 10);
          v120 = *((_QWORD *)v103 + 11);
          v121 = *((_QWORD *)v103 + 12);
          v122 = *((_QWORD *)v103 + 13);
          v225 = *((_QWORD *)v103 + 14);
          sub_100005D80(v119, v118, v120, v121, v122, v225, v111 & 1);
          *((_QWORD *)v102 + 9) = v119;
          *((_QWORD *)v102 + 10) = v118;
          *((_QWORD *)v102 + 11) = v120;
          *((_QWORD *)v102 + 12) = v121;
          *((_QWORD *)v102 + 13) = v122;
          *((_QWORD *)v102 + 14) = v225;
          v102[120] = v117;
        }
        v116 = v231;
        v102[121] = v103[121];
        v100 = v227;
      }
      else
      {
        v113 = *((_OWORD *)v103 + 5);
        *((_OWORD *)v102 + 4) = *((_OWORD *)v103 + 4);
        *((_OWORD *)v102 + 5) = v113;
        *((_OWORD *)v102 + 6) = *((_OWORD *)v103 + 6);
        *(_OWORD *)(v102 + 106) = *(_OWORD *)(v103 + 106);
        v114 = *((_OWORD *)v103 + 1);
        *(_OWORD *)v102 = *(_OWORD *)v103;
        *((_OWORD *)v102 + 1) = v114;
        v115 = *((_OWORD *)v103 + 3);
        *((_OWORD *)v102 + 2) = *((_OWORD *)v103 + 2);
        *((_OWORD *)v102 + 3) = v115;
        v116 = v5;
      }
      *((_BYTE *)a1 + v100[6]) = *((_BYTE *)a2 + v100[6]);
      *((_BYTE *)a1 + v100[7]) = *((_BYTE *)a2 + v100[7]);
      *((_BYTE *)a1 + v100[8]) = *((_BYTE *)a2 + v100[8]);
      *((_BYTE *)a1 + v100[9]) = *((_BYTE *)a2 + v100[9]);
      *((_BYTE *)a1 + v100[10]) = *((_BYTE *)a2 + v100[10]);
      v123 = v100[11];
      v124 = *(void **)((char *)a2 + v123);
      *(void **)((char *)a1 + v123) = v124;
      v125 = v124;
      v47 = a1;
      v48 = v116;
      v49 = 0;
      goto LABEL_98;
    case 1u:
      v12 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v230 = a3;
      v232 = v5;
      switch(swift_getEnumCaseMultiPayload(a2, v12))
      {
        case 1u:
          v13 = *a2;
          *a1 = *a2;
          v14 = v13;
          v15 = a1;
          v16 = v12;
          v17 = 1;
          goto LABEL_57;
        case 2u:
          v126 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v126 - 8) + 16))(a1, a2, v126);
          v15 = a1;
          v16 = v12;
          v17 = 2;
          goto LABEL_57;
        case 3u:
          v127 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v127 - 8) + 16))(a1, a2, v127);
          v15 = a1;
          v16 = v12;
          v17 = 3;
          goto LABEL_57;
        case 4u:
          v128 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v128 - 8) + 16))(a1, a2, v128);
          v15 = a1;
          v16 = v12;
          v17 = 4;
          goto LABEL_57;
        case 5u:
          v129 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v129 - 8) + 16))(a1, a2, v129);
          v15 = a1;
          v16 = v12;
          v17 = 5;
          goto LABEL_57;
        case 6u:
          v130 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v130 - 8) + 16))(a1, a2, v130);
          v15 = a1;
          v16 = v12;
          v17 = 6;
          goto LABEL_57;
        case 8u:
          v131 = *a2;
          *a1 = *a2;
          v132 = v131;
          v15 = a1;
          v16 = v12;
          v17 = 8;
          goto LABEL_57;
        case 9u:
          v133 = *a2;
          *a1 = *a2;
          v134 = v133;
          v15 = a1;
          v16 = v12;
          v17 = 9;
LABEL_57:
          swift_storeEnumTagMultiPayload(v15, v16, v17);
          break;
        default:
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
          break;
      }
      v135 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
      v136 = v135[5];
      v137 = (char *)a1 + v136;
      v138 = (char *)a2 + v136;
      v139 = *(uint64_t *)((char *)a2 + v136 + 8);
      if (v139)
      {
        *(_QWORD *)v137 = *(_QWORD *)v138;
        *((_QWORD *)v137 + 1) = v139;
        v141 = (void *)*((_QWORD *)v138 + 2);
        v140 = *((_QWORD *)v138 + 3);
        v142 = *((_QWORD *)v138 + 4);
        v143 = *((_QWORD *)v138 + 5);
        v145 = *((_QWORD *)v138 + 6);
        v144 = *((_QWORD *)v138 + 7);
        v228 = v138[64];
        swift_bridgeObjectRetain(v139);
        sub_100005D58(v141, v140, v142, v143, v145, v144, v228);
        *((_QWORD *)v137 + 2) = v141;
        *((_QWORD *)v137 + 3) = v140;
        *((_QWORD *)v137 + 4) = v142;
        *((_QWORD *)v137 + 5) = v143;
        *((_QWORD *)v137 + 6) = v145;
        *((_QWORD *)v137 + 7) = v144;
        v137[64] = v228;
        *(_DWORD *)(v137 + 65) = *(_DWORD *)(v138 + 65);
        v146 = v138[120];
        if (v146 == 255)
        {
          v147 = *(_OWORD *)(v138 + 88);
          *(_OWORD *)(v137 + 72) = *(_OWORD *)(v138 + 72);
          *(_OWORD *)(v137 + 88) = v147;
          *(_OWORD *)(v137 + 104) = *(_OWORD *)(v138 + 104);
          v137[120] = v138[120];
        }
        else
        {
          v152 = v146 & 1;
          v154 = (void *)*((_QWORD *)v138 + 9);
          v153 = *((_QWORD *)v138 + 10);
          v155 = *((_QWORD *)v138 + 11);
          v156 = *((_QWORD *)v138 + 12);
          v157 = *((_QWORD *)v138 + 13);
          v229 = *((_QWORD *)v138 + 14);
          sub_100005D80(v154, v153, v155, v156, v157, v229, v146 & 1);
          *((_QWORD *)v137 + 9) = v154;
          *((_QWORD *)v137 + 10) = v153;
          *((_QWORD *)v137 + 11) = v155;
          *((_QWORD *)v137 + 12) = v156;
          *((_QWORD *)v137 + 13) = v157;
          *((_QWORD *)v137 + 14) = v229;
          v137[120] = v152;
        }
        a3 = v230;
        v151 = v232;
        v137[121] = v138[121];
      }
      else
      {
        v148 = *((_OWORD *)v138 + 5);
        *((_OWORD *)v137 + 4) = *((_OWORD *)v138 + 4);
        *((_OWORD *)v137 + 5) = v148;
        *((_OWORD *)v137 + 6) = *((_OWORD *)v138 + 6);
        *(_OWORD *)(v137 + 106) = *(_OWORD *)(v138 + 106);
        v149 = *((_OWORD *)v138 + 1);
        *(_OWORD *)v137 = *(_OWORD *)v138;
        *((_OWORD *)v137 + 1) = v149;
        v150 = *((_OWORD *)v138 + 3);
        *((_OWORD *)v137 + 2) = *((_OWORD *)v138 + 2);
        *((_OWORD *)v137 + 3) = v150;
        v151 = v5;
      }
      *((_BYTE *)a1 + v135[6]) = *((_BYTE *)a2 + v135[6]);
      *((_BYTE *)a1 + v135[7]) = *((_BYTE *)a2 + v135[7]);
      *((_BYTE *)a1 + v135[8]) = *((_BYTE *)a2 + v135[8]);
      *((_BYTE *)a1 + v135[9]) = *((_BYTE *)a2 + v135[9]);
      *((_BYTE *)a1 + v135[10]) = *((_BYTE *)a2 + v135[10]);
      v158 = v135[11];
      v159 = *(void **)((char *)a2 + v158);
      *(void **)((char *)a1 + v158) = v159;
      v160 = v159;
      v47 = a1;
      v48 = v151;
      v49 = 1;
      goto LABEL_98;
    case 2u:
      v18 = *a2;
      *a1 = *a2;
      v19 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
      v20 = (void **)((char *)a1 + v19);
      v21 = (void **)((char *)a2 + v19);
      v22 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v23 = *(_QWORD *)(v22 - 8);
      v24 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v23 + 48);
      v25 = v18;
      if (v24(v21, 1, v22))
      {
        v26 = sub_100005DBC(&qword_100025908);
        memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload(v21, v22))
        {
          case 1u:
            v62 = *v21;
            *v20 = *v21;
            v63 = v62;
            v64 = v20;
            v65 = v22;
            v66 = 1;
            goto LABEL_73;
          case 2u:
            v161 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v161 - 8) + 16))(v20, v21, v161);
            v64 = v20;
            v65 = v22;
            v66 = 2;
            goto LABEL_73;
          case 3u:
            v162 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v162 - 8) + 16))(v20, v21, v162);
            v64 = v20;
            v65 = v22;
            v66 = 3;
            goto LABEL_73;
          case 4u:
            v163 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v163 - 8) + 16))(v20, v21, v163);
            v64 = v20;
            v65 = v22;
            v66 = 4;
            goto LABEL_73;
          case 5u:
            v164 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v164 - 8) + 16))(v20, v21, v164);
            v64 = v20;
            v65 = v22;
            v66 = 5;
            goto LABEL_73;
          case 6u:
            v165 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v165 - 8) + 16))(v20, v21, v165);
            v64 = v20;
            v65 = v22;
            v66 = 6;
            goto LABEL_73;
          case 8u:
            v166 = *v21;
            *v20 = *v21;
            v167 = v166;
            v64 = v20;
            v65 = v22;
            v66 = 8;
            goto LABEL_73;
          case 9u:
            v168 = *v21;
            *v20 = *v21;
            v169 = v168;
            v64 = v20;
            v65 = v22;
            v66 = 9;
LABEL_73:
            swift_storeEnumTagMultiPayload(v64, v65, v66);
            break;
          default:
            memcpy(v20, v21, *(_QWORD *)(v23 + 64));
            break;
        }
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      }
      v47 = a1;
      v48 = v5;
      v49 = 2;
      goto LABEL_98;
    case 3u:
      v27 = *a2;
      *a1 = *a2;
      v28 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
      v29 = (void **)((char *)a1 + v28);
      v30 = (void **)((char *)a2 + v28);
      v31 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v32 = *(_QWORD *)(v31 - 8);
      v33 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v32 + 48);
      v34 = v27;
      if (v33(v30, 1, v31))
      {
        v35 = sub_100005DBC(&qword_100025908);
        memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload(v30, v31))
        {
          case 1u:
            v67 = *v30;
            *v29 = *v30;
            v68 = v67;
            v69 = v29;
            v70 = v31;
            v71 = 1;
            goto LABEL_95;
          case 2u:
            v170 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v170 - 8) + 16))(v29, v30, v170);
            v69 = v29;
            v70 = v31;
            v71 = 2;
            goto LABEL_95;
          case 3u:
            v171 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v171 - 8) + 16))(v29, v30, v171);
            v69 = v29;
            v70 = v31;
            v71 = 3;
            goto LABEL_95;
          case 4u:
            v172 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v172 - 8) + 16))(v29, v30, v172);
            v69 = v29;
            v70 = v31;
            v71 = 4;
            goto LABEL_95;
          case 5u:
            v187 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v187 - 8) + 16))(v29, v30, v187);
            v69 = v29;
            v70 = v31;
            v71 = 5;
            goto LABEL_95;
          case 6u:
            v173 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v173 - 8) + 16))(v29, v30, v173);
            v69 = v29;
            v70 = v31;
            v71 = 6;
            goto LABEL_95;
          case 8u:
            v174 = *v30;
            *v29 = *v30;
            v175 = v174;
            v69 = v29;
            v70 = v31;
            v71 = 8;
            goto LABEL_95;
          case 9u:
            v176 = *v30;
            *v29 = *v30;
            v177 = v176;
            v69 = v29;
            v70 = v31;
            v71 = 9;
LABEL_95:
            swift_storeEnumTagMultiPayload(v69, v70, v71);
            break;
          default:
            memcpy(v29, v30, *(_QWORD *)(v32 + 64));
            break;
        }
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
      }
      v47 = a1;
      v48 = v5;
      v49 = 3;
      goto LABEL_98;
    case 4u:
      v36 = *a2;
      *a1 = *a2;
      v37 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
      v38 = (void **)((char *)a1 + v37);
      v39 = (void **)((char *)a2 + v37);
      v40 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v41 = *(_QWORD *)(v40 - 8);
      v42 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v41 + 48);
      v43 = v36;
      if (v42(v39, 1, v40))
      {
        v44 = sub_100005DBC(&qword_100025908);
        memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload(v39, v40))
        {
          case 1u:
            v72 = *v39;
            *v38 = *v39;
            v73 = v72;
            v74 = v38;
            v75 = v40;
            v76 = 1;
            goto LABEL_91;
          case 2u:
            v178 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v178 - 8) + 16))(v38, v39, v178);
            v74 = v38;
            v75 = v40;
            v76 = 2;
            goto LABEL_91;
          case 3u:
            v179 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v179 - 8) + 16))(v38, v39, v179);
            v74 = v38;
            v75 = v40;
            v76 = 3;
            goto LABEL_91;
          case 4u:
            v180 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v180 - 8) + 16))(v38, v39, v180);
            v74 = v38;
            v75 = v40;
            v76 = 4;
            goto LABEL_91;
          case 5u:
            v181 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v181 - 8) + 16))(v38, v39, v181);
            v74 = v38;
            v75 = v40;
            v76 = 5;
            goto LABEL_91;
          case 6u:
            v182 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v182 - 8) + 16))(v38, v39, v182);
            v74 = v38;
            v75 = v40;
            v76 = 6;
            goto LABEL_91;
          case 8u:
            v183 = *v39;
            *v38 = *v39;
            v184 = v183;
            v74 = v38;
            v75 = v40;
            v76 = 8;
            goto LABEL_91;
          case 9u:
            v185 = *v39;
            *v38 = *v39;
            v186 = v185;
            v74 = v38;
            v75 = v40;
            v76 = 9;
LABEL_91:
            swift_storeEnumTagMultiPayload(v74, v75, v76);
            break;
          default:
            memcpy(v38, v39, *(_QWORD *)(v41 + 64));
            break;
        }
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
      }
      v47 = a1;
      v48 = v5;
      v49 = 4;
      goto LABEL_98;
    case 5u:
      *a1 = *a2;
      *((_BYTE *)a1 + 8) = *((_BYTE *)a2 + 8);
      *(_WORD *)((char *)a1 + 9) = *(_WORD *)((char *)a2 + 9);
      v45 = a2[2];
      a1[2] = v45;
      v46 = v45;
      v47 = a1;
      v48 = v5;
      v49 = 5;
      goto LABEL_98;
    case 6u:
      v57 = *a2;
      *a1 = *a2;
      v58 = v57;
      v47 = a1;
      v48 = v5;
      v49 = 6;
      goto LABEL_98;
    case 7u:
      v50 = type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState(0);
      v51 = *(_QWORD *)(v50 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v51 + 48))(a2, 1, v50))
      {
        v52 = sub_100005DBC(&qword_100025910);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v52 - 8) + 64));
      }
      else
      {
        v77 = *a2;
        *a1 = *a2;
        v78 = *(int *)(v50 + 20);
        v226 = (char *)a1 + v78;
        v79 = (char *)a2 + v78;
        v80 = type metadata accessor for REMHashtagLabelSpecifier(0);
        v81 = v5;
        v82 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v80 - 8) + 16);
        swift_bridgeObjectRetain(v77);
        v82(v226, v79, v80);
        v5 = v81;
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v51 + 56))(a1, 0, 1, v50);
      }
      v83 = *(int *)(type metadata accessor for TTRRemindersListViewModel.HashtagsState(0) + 20);
      v84 = (void **)((char *)a1 + v83);
      v85 = (void **)((char *)a2 + v83);
      v86 = v85[1];
      if (v86)
      {
        *v84 = *v85;
        v84[1] = v86;
        v87 = (void *)v85[2];
        v84[2] = v87;
        swift_bridgeObjectRetain(v86);
        v88 = v87;
      }
      else
      {
        *(_OWORD *)v84 = *(_OWORD *)v85;
        v84[2] = v85[2];
      }
      v47 = a1;
      v48 = v5;
      v49 = 7;
      goto LABEL_98;
    case 8u:
      v59 = type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription(0);
      v60 = *(_QWORD *)(v59 - 8);
      if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v60 + 48))(a2, 1, v59))
      {
        v61 = type metadata accessor for TTRTemplatePublicLinkData.StateToDisplay(0);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
      }
      else
      {
        v89 = type metadata accessor for Date(0);
        (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v89 - 8) + 16))(a1, a2, v89);
        *((_BYTE *)a1 + *(int *)(v59 + 20)) = *((_BYTE *)a2 + *(int *)(v59 + 20));
        (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v60 + 56))(a1, 0, 1, v59);
      }
      v90 = *(int *)(type metadata accessor for TTRTemplatePublicLinkData(0) + 20);
      v47 = a1;
      *(void **)((char *)a1 + v90) = *(void **)((char *)a2 + v90);
      v48 = v5;
      v49 = 8;
      goto LABEL_98;
    case 9u:
      *(_BYTE *)a1 = *(_BYTE *)a2;
      v53 = *(int *)(type metadata accessor for TTRRemindersListTips(0) + 20);
      v54 = (char *)a1 + v53;
      v55 = (char *)a2 + v53;
      v56 = type metadata accessor for AnyTip(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 16))(v54, v55, v56);
      v47 = a1;
      v48 = v5;
      v49 = 9;
LABEL_98:
      swift_storeEnumTagMultiPayload(v47, v48, v49);
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
      break;
  }
  v188 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  v189 = *(void **)((char *)a2 + v188);
  *(void **)((char *)a1 + v188) = v189;
  v190 = a3[7];
  v191 = a3[8];
  v192 = *(void **)((char *)a2 + v190);
  *(void **)((char *)a1 + v190) = v192;
  *((_BYTE *)a1 + v191) = *((_BYTE *)a2 + v191);
  v193 = a3[9];
  v194 = a3[10];
  v195 = a3;
  v196 = *(void **)((char *)a2 + v193);
  *(void **)((char *)a1 + v193) = v196;
  v197 = (void **)((char *)a1 + v194);
  v198 = (void **)((char *)a2 + v194);
  ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  v200 = *(_QWORD *)(ReminderView - 8);
  v201 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v200 + 48);
  v202 = v189;
  v203 = v192;
  swift_bridgeObjectRetain(v196);
  if (v201(v198, 1, ReminderView))
  {
    v204 = sub_100005DBC(&qword_100025DB0);
    memcpy(v197, v198, *(_QWORD *)(*(_QWORD *)(v204 - 8) + 64));
  }
  else
  {
    v205 = *v198;
    *v197 = *v198;
    v206 = *(int *)(ReminderView + 20);
    v207 = (char *)v197 + v206;
    v208 = (char *)v198 + v206;
    v209 = type metadata accessor for URL(0);
    v233 = a2;
    v210 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v209 - 8) + 16);
    v211 = v205;
    v210(v207, v208, v209);
    v212 = *(int *)(ReminderView + 24);
    v213 = *(void **)((char *)v198 + v212);
    *(void **)((char *)v197 + v212) = v213;
    v214 = *(void (**)(void **, _QWORD, uint64_t, uint64_t))(v200 + 56);
    v215 = v213;
    v214(v197, 0, 1, ReminderView);
    a2 = v233;
  }
  v216 = v195[11];
  v217 = (char *)a1 + v216;
  v218 = (char *)a2 + v216;
  v219 = v218[8];
  if (v219 == 255)
  {
    *(_QWORD *)v217 = *(_QWORD *)v218;
    v217[8] = v218[8];
  }
  else
  {
    v220 = v219 & 1;
    v221 = *(_QWORD *)v218;
    v222 = *(id *)v218;
    *(_QWORD *)v217 = v221;
    v217[8] = v220;
  }
  return a1;
}

void **sub_1000133BC(void **a1, void **a2, int *a3)
{
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void **v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void **v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void **v20;
  void **v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int (*v24)(void **, uint64_t, uint64_t);
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void **v29;
  void **v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int (*v33)(void **, uint64_t, uint64_t);
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void **v38;
  void **v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int (*v42)(void **, uint64_t, uint64_t);
  id v43;
  uint64_t v44;
  void *v45;
  id v46;
  void **v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  void *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  id v63;
  void **v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  id v68;
  void **v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  void **v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(char *, char *, uint64_t);
  uint64_t v83;
  _QWORD *v84;
  _QWORD *v85;
  uint64_t v86;
  void *v87;
  id v88;
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  void *v99;
  id v100;
  int *v101;
  uint64_t v102;
  char *v103;
  char *v104;
  uint64_t v105;
  void *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unsigned __int8 v111;
  int v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  uint64_t v122;
  char v123;
  uint64_t v124;
  void *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  void *v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  id v138;
  void *v139;
  id v140;
  int *v141;
  uint64_t v142;
  char *v143;
  char *v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  unsigned __int8 v151;
  int v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  uint64_t v162;
  char v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  id v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  id v178;
  void *v179;
  id v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  id v187;
  void *v188;
  id v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  id v196;
  void *v197;
  id v198;
  uint64_t v199;
  void *v200;
  void *v201;
  id v202;
  uint64_t v203;
  void *v204;
  void *v205;
  id v206;
  uint64_t v207;
  void *v208;
  uint64_t v209;
  uint64_t v210;
  void **v211;
  void **v212;
  uint64_t ReminderView;
  uint64_t v214;
  uint64_t (*v215)(void **, uint64_t, uint64_t);
  int v216;
  int v217;
  int *v218;
  void *v219;
  uint64_t v220;
  char *v221;
  char *v222;
  uint64_t v223;
  void (*v224)(char *, char *, uint64_t);
  id v225;
  uint64_t v226;
  void *v227;
  void (*v228)(void **, _QWORD, uint64_t, uint64_t);
  id v229;
  uint64_t v230;
  uint64_t v231;
  id *v232;
  char *v233;
  int v234;
  int v235;
  char v236;
  void *v237;
  char v238;
  void *v239;
  id v240;
  id v241;
  char v242;
  void *v243;
  id v244;
  void *v246;
  void *v247;
  id v248;
  uint64_t v249;
  char *v250;
  char *v251;
  uint64_t v252;
  uint64_t v253;
  void *v254;
  void *v255;
  id v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  char *v261;
  int *v262;
  int *v263;
  uint64_t v264;
  uint64_t v265;
  void **v266;

  v4 = a2;
  if (a1 != a2)
  {
    sub_100008650((uint64_t)a1, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
    v5 = type metadata accessor for TTRRemindersListViewModel.Item(0);
    switch(swift_getEnumCaseMultiPayload(v4, v5))
    {
      case 0u:
        v6 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v264 = v5;
        switch(swift_getEnumCaseMultiPayload(v4, v6))
        {
          case 1u:
            v7 = *v4;
            *a1 = *v4;
            v8 = v7;
            v9 = a1;
            v10 = v6;
            v11 = 1;
            goto LABEL_42;
          case 2u:
            v92 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v92 - 8) + 16))(a1, v4, v92);
            v9 = a1;
            v10 = v6;
            v11 = 2;
            goto LABEL_42;
          case 3u:
            v93 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v93 - 8) + 16))(a1, v4, v93);
            v9 = a1;
            v10 = v6;
            v11 = 3;
            goto LABEL_42;
          case 4u:
            v94 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v94 - 8) + 16))(a1, v4, v94);
            v9 = a1;
            v10 = v6;
            v11 = 4;
            goto LABEL_42;
          case 5u:
            v95 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v95 - 8) + 16))(a1, v4, v95);
            v9 = a1;
            v10 = v6;
            v11 = 5;
            goto LABEL_42;
          case 6u:
            v96 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v96 - 8) + 16))(a1, v4, v96);
            v9 = a1;
            v10 = v6;
            v11 = 6;
            goto LABEL_42;
          case 8u:
            v97 = *v4;
            *a1 = *v4;
            v98 = v97;
            v9 = a1;
            v10 = v6;
            v11 = 8;
            goto LABEL_42;
          case 9u:
            v99 = *v4;
            *a1 = *v4;
            v100 = v99;
            v9 = a1;
            v10 = v6;
            v11 = 9;
LABEL_42:
            swift_storeEnumTagMultiPayload(v9, v10, v11);
            break;
          default:
            memcpy(a1, v4, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
            break;
        }
        v101 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
        v102 = v101[5];
        v103 = (char *)a1 + v102;
        v104 = (char *)v4 + v102;
        if (*(void **)((char *)v4 + v102 + 8))
        {
          v262 = v101;
          *(_QWORD *)v103 = *(_QWORD *)v104;
          v105 = *((_QWORD *)v104 + 1);
          *((_QWORD *)v103 + 1) = v105;
          v106 = (void *)*((_QWORD *)v104 + 2);
          v107 = *((_QWORD *)v104 + 3);
          v108 = *((_QWORD *)v104 + 4);
          v109 = *((_QWORD *)v104 + 5);
          v110 = *((_QWORD *)v104 + 7);
          v257 = *((_QWORD *)v104 + 6);
          v111 = v104[64];
          swift_bridgeObjectRetain(v105);
          sub_100005D58(v106, v107, v108, v109, v257, v110, v111);
          *((_QWORD *)v103 + 2) = v106;
          *((_QWORD *)v103 + 3) = v107;
          *((_QWORD *)v103 + 4) = v108;
          *((_QWORD *)v103 + 5) = v109;
          *((_QWORD *)v103 + 6) = v257;
          *((_QWORD *)v103 + 7) = v110;
          v103[64] = v111;
          v103[65] = v104[65];
          v103[66] = v104[66];
          v103[67] = v104[67];
          v103[68] = v104[68];
          v112 = v104[120];
          if (v112 == 255)
          {
            v113 = *(_OWORD *)(v104 + 72);
            v114 = *(_OWORD *)(v104 + 88);
            v115 = *(_OWORD *)(v104 + 104);
            v103[120] = v104[120];
            *(_OWORD *)(v103 + 88) = v114;
            *(_OWORD *)(v103 + 104) = v115;
            *(_OWORD *)(v103 + 72) = v113;
          }
          else
          {
            v123 = v112 & 1;
            v125 = (void *)*((_QWORD *)v104 + 9);
            v124 = *((_QWORD *)v104 + 10);
            v126 = *((_QWORD *)v104 + 11);
            v127 = *((_QWORD *)v104 + 12);
            v128 = *((_QWORD *)v104 + 13);
            v258 = *((_QWORD *)v104 + 14);
            sub_100005D80(v125, v124, v126, v127, v128, v258, v112 & 1);
            *((_QWORD *)v103 + 9) = v125;
            *((_QWORD *)v103 + 10) = v124;
            *((_QWORD *)v103 + 11) = v126;
            *((_QWORD *)v103 + 12) = v127;
            *((_QWORD *)v103 + 13) = v128;
            *((_QWORD *)v103 + 14) = v258;
            v103[120] = v123;
          }
          v101 = v262;
          v122 = v264;
          v103[121] = v104[121];
        }
        else
        {
          v116 = *(_OWORD *)v104;
          v117 = *((_OWORD *)v104 + 1);
          v118 = *((_OWORD *)v104 + 3);
          *((_OWORD *)v103 + 2) = *((_OWORD *)v104 + 2);
          *((_OWORD *)v103 + 3) = v118;
          *(_OWORD *)v103 = v116;
          *((_OWORD *)v103 + 1) = v117;
          v119 = *((_OWORD *)v104 + 4);
          v120 = *((_OWORD *)v104 + 5);
          v121 = *((_OWORD *)v104 + 6);
          *(_OWORD *)(v103 + 106) = *(_OWORD *)(v104 + 106);
          *((_OWORD *)v103 + 5) = v120;
          *((_OWORD *)v103 + 6) = v121;
          *((_OWORD *)v103 + 4) = v119;
          v122 = v5;
        }
        *((_BYTE *)a1 + v101[6]) = *((_BYTE *)v4 + v101[6]);
        *((_BYTE *)a1 + v101[7]) = *((_BYTE *)v4 + v101[7]);
        *((_BYTE *)a1 + v101[8]) = *((_BYTE *)v4 + v101[8]);
        *((_BYTE *)a1 + v101[9]) = *((_BYTE *)v4 + v101[9]);
        *((_BYTE *)a1 + v101[10]) = *((_BYTE *)v4 + v101[10]);
        v129 = v101[11];
        v130 = *(void **)((char *)v4 + v129);
        *(void **)((char *)a1 + v129) = v130;
        v131 = v130;
        v47 = a1;
        v48 = v122;
        v49 = 0;
        goto LABEL_99;
      case 1u:
        v12 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v265 = v5;
        switch(swift_getEnumCaseMultiPayload(v4, v12))
        {
          case 1u:
            v13 = *v4;
            *a1 = *v4;
            v14 = v13;
            v15 = a1;
            v16 = v12;
            v17 = 1;
            goto LABEL_58;
          case 2u:
            v132 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v132 - 8) + 16))(a1, v4, v132);
            v15 = a1;
            v16 = v12;
            v17 = 2;
            goto LABEL_58;
          case 3u:
            v133 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v133 - 8) + 16))(a1, v4, v133);
            v15 = a1;
            v16 = v12;
            v17 = 3;
            goto LABEL_58;
          case 4u:
            v134 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v134 - 8) + 16))(a1, v4, v134);
            v15 = a1;
            v16 = v12;
            v17 = 4;
            goto LABEL_58;
          case 5u:
            v135 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v135 - 8) + 16))(a1, v4, v135);
            v15 = a1;
            v16 = v12;
            v17 = 5;
            goto LABEL_58;
          case 6u:
            v136 = type metadata accessor for Date(0);
            (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v136 - 8) + 16))(a1, v4, v136);
            v15 = a1;
            v16 = v12;
            v17 = 6;
            goto LABEL_58;
          case 8u:
            v137 = *v4;
            *a1 = *v4;
            v138 = v137;
            v15 = a1;
            v16 = v12;
            v17 = 8;
            goto LABEL_58;
          case 9u:
            v139 = *v4;
            *a1 = *v4;
            v140 = v139;
            v15 = a1;
            v16 = v12;
            v17 = 9;
LABEL_58:
            swift_storeEnumTagMultiPayload(v15, v16, v17);
            break;
          default:
            memcpy(a1, v4, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
            break;
        }
        v141 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
        v142 = v141[5];
        v143 = (char *)a1 + v142;
        v144 = (char *)v4 + v142;
        if (*(void **)((char *)v4 + v142 + 8))
        {
          v263 = v141;
          *(_QWORD *)v143 = *(_QWORD *)v144;
          v145 = *((_QWORD *)v144 + 1);
          *((_QWORD *)v143 + 1) = v145;
          v147 = (void *)*((_QWORD *)v144 + 2);
          v146 = *((_QWORD *)v144 + 3);
          v148 = *((_QWORD *)v144 + 4);
          v149 = *((_QWORD *)v144 + 5);
          v150 = *((_QWORD *)v144 + 6);
          v259 = *((_QWORD *)v144 + 7);
          v151 = v144[64];
          swift_bridgeObjectRetain(v145);
          sub_100005D58(v147, v146, v148, v149, v150, v259, v151);
          *((_QWORD *)v143 + 2) = v147;
          *((_QWORD *)v143 + 3) = v146;
          *((_QWORD *)v143 + 4) = v148;
          *((_QWORD *)v143 + 5) = v149;
          *((_QWORD *)v143 + 6) = v150;
          *((_QWORD *)v143 + 7) = v259;
          v143[64] = v151;
          v143[65] = v144[65];
          v143[66] = v144[66];
          v143[67] = v144[67];
          v143[68] = v144[68];
          v152 = v144[120];
          if (v152 == 255)
          {
            v153 = *(_OWORD *)(v144 + 72);
            v154 = *(_OWORD *)(v144 + 88);
            v155 = *(_OWORD *)(v144 + 104);
            v143[120] = v144[120];
            *(_OWORD *)(v143 + 88) = v154;
            *(_OWORD *)(v143 + 104) = v155;
            *(_OWORD *)(v143 + 72) = v153;
          }
          else
          {
            v163 = v152 & 1;
            v165 = (void *)*((_QWORD *)v144 + 9);
            v164 = *((_QWORD *)v144 + 10);
            v166 = *((_QWORD *)v144 + 11);
            v167 = *((_QWORD *)v144 + 12);
            v168 = *((_QWORD *)v144 + 13);
            v260 = *((_QWORD *)v144 + 14);
            sub_100005D80(v165, v164, v166, v167, v168, v260, v152 & 1);
            *((_QWORD *)v143 + 9) = v165;
            *((_QWORD *)v143 + 10) = v164;
            *((_QWORD *)v143 + 11) = v166;
            *((_QWORD *)v143 + 12) = v167;
            *((_QWORD *)v143 + 13) = v168;
            *((_QWORD *)v143 + 14) = v260;
            v143[120] = v163;
          }
          v141 = v263;
          v162 = v265;
          v143[121] = v144[121];
        }
        else
        {
          v156 = *(_OWORD *)v144;
          v157 = *((_OWORD *)v144 + 1);
          v158 = *((_OWORD *)v144 + 3);
          *((_OWORD *)v143 + 2) = *((_OWORD *)v144 + 2);
          *((_OWORD *)v143 + 3) = v158;
          *(_OWORD *)v143 = v156;
          *((_OWORD *)v143 + 1) = v157;
          v159 = *((_OWORD *)v144 + 4);
          v160 = *((_OWORD *)v144 + 5);
          v161 = *((_OWORD *)v144 + 6);
          *(_OWORD *)(v143 + 106) = *(_OWORD *)(v144 + 106);
          *((_OWORD *)v143 + 5) = v160;
          *((_OWORD *)v143 + 6) = v161;
          *((_OWORD *)v143 + 4) = v159;
          v162 = v5;
        }
        *((_BYTE *)a1 + v141[6]) = *((_BYTE *)v4 + v141[6]);
        *((_BYTE *)a1 + v141[7]) = *((_BYTE *)v4 + v141[7]);
        *((_BYTE *)a1 + v141[8]) = *((_BYTE *)v4 + v141[8]);
        *((_BYTE *)a1 + v141[9]) = *((_BYTE *)v4 + v141[9]);
        *((_BYTE *)a1 + v141[10]) = *((_BYTE *)v4 + v141[10]);
        v169 = v141[11];
        v170 = *(void **)((char *)v4 + v169);
        *(void **)((char *)a1 + v169) = v170;
        v171 = v170;
        v47 = a1;
        v48 = v162;
        v49 = 1;
        goto LABEL_99;
      case 2u:
        v18 = *v4;
        *a1 = *v4;
        v19 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v20 = (void **)((char *)a1 + v19);
        v21 = (void **)((char *)v4 + v19);
        v22 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v23 = *(_QWORD *)(v22 - 8);
        v24 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v23 + 48);
        v25 = v18;
        if (v24(v21, 1, v22))
        {
          v26 = sub_100005DBC(&qword_100025908);
          memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v26 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v21, v22))
          {
            case 1u:
              v62 = *v21;
              *v20 = *v21;
              v63 = v62;
              v64 = v20;
              v65 = v22;
              v66 = 1;
              goto LABEL_74;
            case 2u:
              v172 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v172 - 8) + 16))(v20, v21, v172);
              v64 = v20;
              v65 = v22;
              v66 = 2;
              goto LABEL_74;
            case 3u:
              v173 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v173 - 8) + 16))(v20, v21, v173);
              v64 = v20;
              v65 = v22;
              v66 = 3;
              goto LABEL_74;
            case 4u:
              v174 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v174 - 8) + 16))(v20, v21, v174);
              v64 = v20;
              v65 = v22;
              v66 = 4;
              goto LABEL_74;
            case 5u:
              v175 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v175 - 8) + 16))(v20, v21, v175);
              v64 = v20;
              v65 = v22;
              v66 = 5;
              goto LABEL_74;
            case 6u:
              v176 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v176 - 8) + 16))(v20, v21, v176);
              v64 = v20;
              v65 = v22;
              v66 = 6;
              goto LABEL_74;
            case 8u:
              v177 = *v21;
              *v20 = *v21;
              v178 = v177;
              v64 = v20;
              v65 = v22;
              v66 = 8;
              goto LABEL_74;
            case 9u:
              v179 = *v21;
              *v20 = *v21;
              v180 = v179;
              v64 = v20;
              v65 = v22;
              v66 = 9;
LABEL_74:
              swift_storeEnumTagMultiPayload(v64, v65, v66);
              break;
            default:
              memcpy(v20, v21, *(_QWORD *)(v23 + 64));
              break;
          }
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
        }
        v47 = a1;
        v48 = v5;
        v49 = 2;
        goto LABEL_99;
      case 3u:
        v27 = *v4;
        *a1 = *v4;
        v28 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v29 = (void **)((char *)a1 + v28);
        v30 = (void **)((char *)v4 + v28);
        v31 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v32 = *(_QWORD *)(v31 - 8);
        v33 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v32 + 48);
        v34 = v27;
        if (v33(v30, 1, v31))
        {
          v35 = sub_100005DBC(&qword_100025908);
          memcpy(v29, v30, *(_QWORD *)(*(_QWORD *)(v35 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v30, v31))
          {
            case 1u:
              v67 = *v30;
              *v29 = *v30;
              v68 = v67;
              v69 = v29;
              v70 = v31;
              v71 = 1;
              goto LABEL_85;
            case 2u:
              v181 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v181 - 8) + 16))(v29, v30, v181);
              v69 = v29;
              v70 = v31;
              v71 = 2;
              goto LABEL_85;
            case 3u:
              v182 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v182 - 8) + 16))(v29, v30, v182);
              v69 = v29;
              v70 = v31;
              v71 = 3;
              goto LABEL_85;
            case 4u:
              v183 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v183 - 8) + 16))(v29, v30, v183);
              v69 = v29;
              v70 = v31;
              v71 = 4;
              goto LABEL_85;
            case 5u:
              v184 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v184 - 8) + 16))(v29, v30, v184);
              v69 = v29;
              v70 = v31;
              v71 = 5;
              goto LABEL_85;
            case 6u:
              v185 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v185 - 8) + 16))(v29, v30, v185);
              v69 = v29;
              v70 = v31;
              v71 = 6;
              goto LABEL_85;
            case 8u:
              v186 = *v30;
              *v29 = *v30;
              v187 = v186;
              v69 = v29;
              v70 = v31;
              v71 = 8;
              goto LABEL_85;
            case 9u:
              v188 = *v30;
              *v29 = *v30;
              v189 = v188;
              v69 = v29;
              v70 = v31;
              v71 = 9;
LABEL_85:
              swift_storeEnumTagMultiPayload(v69, v70, v71);
              break;
            default:
              memcpy(v29, v30, *(_QWORD *)(v32 + 64));
              break;
          }
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
        }
        v47 = a1;
        v48 = v5;
        v49 = 3;
        goto LABEL_99;
      case 4u:
        v36 = *v4;
        *a1 = *v4;
        v37 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v38 = (void **)((char *)a1 + v37);
        v39 = (void **)((char *)v4 + v37);
        v40 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v41 = *(_QWORD *)(v40 - 8);
        v42 = *(unsigned int (**)(void **, uint64_t, uint64_t))(v41 + 48);
        v43 = v36;
        if (v42(v39, 1, v40))
        {
          v44 = sub_100005DBC(&qword_100025908);
          memcpy(v38, v39, *(_QWORD *)(*(_QWORD *)(v44 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v39, v40))
          {
            case 1u:
              v72 = *v39;
              *v38 = *v39;
              v73 = v72;
              v74 = v38;
              v75 = v40;
              v76 = 1;
              goto LABEL_96;
            case 2u:
              v190 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v190 - 8) + 16))(v38, v39, v190);
              v74 = v38;
              v75 = v40;
              v76 = 2;
              goto LABEL_96;
            case 3u:
              v191 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v191 - 8) + 16))(v38, v39, v191);
              v74 = v38;
              v75 = v40;
              v76 = 3;
              goto LABEL_96;
            case 4u:
              v192 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v192 - 8) + 16))(v38, v39, v192);
              v74 = v38;
              v75 = v40;
              v76 = 4;
              goto LABEL_96;
            case 5u:
              v193 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v193 - 8) + 16))(v38, v39, v193);
              v74 = v38;
              v75 = v40;
              v76 = 5;
              goto LABEL_96;
            case 6u:
              v194 = type metadata accessor for Date(0);
              (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v194 - 8) + 16))(v38, v39, v194);
              v74 = v38;
              v75 = v40;
              v76 = 6;
              goto LABEL_96;
            case 8u:
              v195 = *v39;
              *v38 = *v39;
              v196 = v195;
              v74 = v38;
              v75 = v40;
              v76 = 8;
              goto LABEL_96;
            case 9u:
              v197 = *v39;
              *v38 = *v39;
              v198 = v197;
              v74 = v38;
              v75 = v40;
              v76 = 9;
LABEL_96:
              swift_storeEnumTagMultiPayload(v74, v75, v76);
              break;
            default:
              memcpy(v38, v39, *(_QWORD *)(v41 + 64));
              break;
          }
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v41 + 56))(v38, 0, 1, v40);
        }
        v47 = a1;
        v48 = v5;
        v49 = 4;
        goto LABEL_99;
      case 5u:
        *a1 = *v4;
        *((_BYTE *)a1 + 8) = *((_BYTE *)v4 + 8);
        *((_BYTE *)a1 + 9) = *((_BYTE *)v4 + 9);
        *((_BYTE *)a1 + 10) = *((_BYTE *)v4 + 10);
        v45 = v4[2];
        a1[2] = v45;
        v46 = v45;
        v47 = a1;
        v48 = v5;
        v49 = 5;
        goto LABEL_99;
      case 6u:
        v57 = *v4;
        *a1 = *v4;
        v58 = v57;
        v47 = a1;
        v48 = v5;
        v49 = 6;
        goto LABEL_99;
      case 7u:
        v50 = type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState(0);
        v51 = *(_QWORD *)(v50 - 8);
        if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v51 + 48))(v4, 1, v50))
        {
          v52 = sub_100005DBC(&qword_100025910);
          memcpy(a1, v4, *(_QWORD *)(*(_QWORD *)(v52 - 8) + 64));
        }
        else
        {
          v77 = *v4;
          *a1 = *v4;
          v78 = *(int *)(v50 + 20);
          v261 = (char *)a1 + v78;
          v79 = (char *)v4 + v78;
          v80 = type metadata accessor for REMHashtagLabelSpecifier(0);
          v81 = v5;
          v82 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v80 - 8) + 16);
          swift_bridgeObjectRetain(v77);
          v82(v261, v79, v80);
          v5 = v81;
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v51 + 56))(a1, 0, 1, v50);
        }
        v83 = *(int *)(type metadata accessor for TTRRemindersListViewModel.HashtagsState(0) + 20);
        v84 = (void **)((char *)a1 + v83);
        v85 = (void **)((char *)v4 + v83);
        if (v85[1])
        {
          *v84 = *v85;
          v86 = v85[1];
          v84[1] = v86;
          v87 = (void *)v85[2];
          v84[2] = v87;
          swift_bridgeObjectRetain(v86);
          v88 = v87;
        }
        else
        {
          v89 = *(_OWORD *)v85;
          v84[2] = v85[2];
          *(_OWORD *)v84 = v89;
        }
        v47 = a1;
        v48 = v5;
        v49 = 7;
        goto LABEL_99;
      case 8u:
        v59 = type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription(0);
        v60 = *(_QWORD *)(v59 - 8);
        if ((*(unsigned int (**)(void **, uint64_t, uint64_t))(v60 + 48))(v4, 1, v59))
        {
          v61 = type metadata accessor for TTRTemplatePublicLinkData.StateToDisplay(0);
          memcpy(a1, v4, *(_QWORD *)(*(_QWORD *)(v61 - 8) + 64));
        }
        else
        {
          v90 = type metadata accessor for Date(0);
          (*(void (**)(void **, void **, uint64_t))(*(_QWORD *)(v90 - 8) + 16))(a1, v4, v90);
          *((_BYTE *)a1 + *(int *)(v59 + 20)) = *((_BYTE *)v4 + *(int *)(v59 + 20));
          (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v60 + 56))(a1, 0, 1, v59);
        }
        v91 = *(int *)(type metadata accessor for TTRTemplatePublicLinkData(0) + 20);
        v47 = a1;
        *(void **)((char *)a1 + v91) = *(void **)((char *)v4 + v91);
        v48 = v5;
        v49 = 8;
        goto LABEL_99;
      case 9u:
        *(_BYTE *)a1 = *(_BYTE *)v4;
        v53 = *(int *)(type metadata accessor for TTRRemindersListTips(0) + 20);
        v54 = (char *)a1 + v53;
        v55 = (char *)v4 + v53;
        v56 = type metadata accessor for AnyTip(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 16))(v54, v55, v56);
        v47 = a1;
        v48 = v5;
        v49 = 9;
LABEL_99:
        swift_storeEnumTagMultiPayload(v47, v48, v49);
        break;
      default:
        memcpy(a1, v4, *(_QWORD *)(*(_QWORD *)(v5 - 8) + 64));
        break;
    }
  }
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)v4 + a3[5]);
  v199 = a3[6];
  v200 = *(void **)((char *)v4 + v199);
  v201 = *(void **)((char *)a1 + v199);
  *(void **)((char *)a1 + v199) = v200;
  v202 = v200;

  v203 = a3[7];
  v204 = *(void **)((char *)v4 + v203);
  v205 = *(void **)((char *)a1 + v203);
  *(void **)((char *)a1 + v203) = v204;
  v206 = v204;

  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)v4 + a3[8]);
  v207 = a3[9];
  v208 = *(void **)((char *)v4 + v207);
  v209 = *(uint64_t *)((char *)a1 + v207);
  *(void **)((char *)a1 + v207) = v208;
  swift_bridgeObjectRetain(v208);
  swift_bridgeObjectRelease(v209);
  v210 = a3[10];
  v211 = (void **)((char *)a1 + v210);
  v212 = (void **)((char *)v4 + v210);
  ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  v214 = *(_QWORD *)(ReminderView - 8);
  v215 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v214 + 48);
  v216 = v215(v211, 1, ReminderView);
  v217 = v215(v212, 1, ReminderView);
  if (v216)
  {
    if (!v217)
    {
      v218 = a3;
      v219 = *v212;
      *v211 = *v212;
      v220 = *(int *)(ReminderView + 20);
      v221 = (char *)v211 + v220;
      v222 = (char *)v212 + v220;
      v223 = type metadata accessor for URL(0);
      v266 = v4;
      v224 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v223 - 8) + 16);
      v225 = v219;
      a3 = v218;
      v224(v221, v222, v223);
      v226 = *(int *)(ReminderView + 24);
      v227 = *(void **)((char *)v212 + v226);
      *(void **)((char *)v211 + v226) = v227;
      v228 = *(void (**)(void **, _QWORD, uint64_t, uint64_t))(v214 + 56);
      v229 = v227;
      v228(v211, 0, 1, ReminderView);
      v4 = v266;
      goto LABEL_106;
    }
    goto LABEL_105;
  }
  if (v217)
  {
    sub_100008650((uint64_t)v211, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
LABEL_105:
    v230 = sub_100005DBC(&qword_100025DB0);
    memcpy(v211, v212, *(_QWORD *)(*(_QWORD *)(v230 - 8) + 64));
    goto LABEL_106;
  }
  v246 = *v212;
  v247 = *v211;
  *v211 = *v212;
  v248 = v246;

  v249 = *(int *)(ReminderView + 20);
  v250 = (char *)v211 + v249;
  v251 = (char *)v212 + v249;
  v252 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v252 - 8) + 24))(v250, v251, v252);
  v253 = *(int *)(ReminderView + 24);
  v254 = *(void **)((char *)v211 + v253);
  v255 = *(void **)((char *)v212 + v253);
  *(void **)((char *)v211 + v253) = v255;
  v256 = v255;

LABEL_106:
  v231 = a3[11];
  v232 = (void **)((char *)a1 + v231);
  v233 = (char *)v4 + v231;
  v234 = *((unsigned __int8 *)a1 + v231 + 8);
  v235 = *((unsigned __int8 *)v4 + v231 + 8);
  if (v234 == 255)
  {
    if (v235 == 255)
    {
      v237 = *(void **)v233;
      *((_BYTE *)v232 + 8) = v233[8];
      *v232 = v237;
    }
    else
    {
      v242 = v235 & 1;
      v243 = *(void **)v233;
      v244 = v243;
      *v232 = v243;
      *((_BYTE *)v232 + 8) = v242;
    }
  }
  else if (v235 == 255)
  {
    sub_100014698(v232);
    v236 = v233[8];
    *v232 = *(id *)v233;
    *((_BYTE *)v232 + 8) = v236;
  }
  else
  {
    v238 = v235 & 1;
    v239 = *(void **)v233;
    v240 = v239;
    v241 = *v232;
    *v232 = v239;
    *((_BYTE *)v232 + 8) = v238;

  }
  return a1;
}

id *sub_100014698(id *a1)
{

  return a1;
}

_QWORD *sub_1000146C4(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
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
  char *v42;
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int *v73;
  uint64_t v74;
  _OWORD *v75;
  _OWORD *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int *v85;
  uint64_t v86;
  _OWORD *v87;
  _OWORD *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
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
  _QWORD *v108;
  _QWORD *v109;
  uint64_t ReminderView;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  char *v118;
  char *v119;

  v6 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  switch(swift_getEnumCaseMultiPayload(a2, v6))
  {
    case 0u:
      v7 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      switch(swift_getEnumCaseMultiPayload(a2, v7))
      {
        case 2u:
          v8 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
          v9 = a1;
          v10 = v7;
          v11 = 2;
          goto LABEL_33;
        case 3u:
          v69 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v69 - 8) + 32))(a1, a2, v69);
          v9 = a1;
          v10 = v7;
          v11 = 3;
          goto LABEL_33;
        case 4u:
          v70 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v70 - 8) + 32))(a1, a2, v70);
          v9 = a1;
          v10 = v7;
          v11 = 4;
          goto LABEL_33;
        case 5u:
          v71 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v71 - 8) + 32))(a1, a2, v71);
          v9 = a1;
          v10 = v7;
          v11 = 5;
          goto LABEL_33;
        case 6u:
          v72 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v72 - 8) + 32))(a1, a2, v72);
          v9 = a1;
          v10 = v7;
          v11 = 6;
LABEL_33:
          swift_storeEnumTagMultiPayload(v9, v10, v11);
          break;
        default:
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
          break;
      }
      v73 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
      v74 = v73[5];
      v75 = (_OWORD *)((char *)a1 + v74);
      v76 = (_OWORD *)((char *)a2 + v74);
      v77 = v76[3];
      v75[2] = v76[2];
      v75[3] = v77;
      v78 = v76[1];
      *v75 = *v76;
      v75[1] = v78;
      *(_OWORD *)((char *)v75 + 106) = *(_OWORD *)((char *)v76 + 106);
      v79 = v76[6];
      v80 = v76[4];
      v75[5] = v76[5];
      v75[6] = v79;
      v75[4] = v80;
      *((_BYTE *)a1 + v73[6]) = *((_BYTE *)a2 + v73[6]);
      *((_BYTE *)a1 + v73[7]) = *((_BYTE *)a2 + v73[7]);
      *((_BYTE *)a1 + v73[8]) = *((_BYTE *)a2 + v73[8]);
      *((_BYTE *)a1 + v73[9]) = *((_BYTE *)a2 + v73[9]);
      *((_BYTE *)a1 + v73[10]) = *((_BYTE *)a2 + v73[10]);
      *(_QWORD *)((char *)a1 + v73[11]) = *(_QWORD *)((char *)a2 + v73[11]);
      v45 = a1;
      v46 = v6;
      v47 = 0;
      goto LABEL_66;
    case 1u:
      v12 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      switch(swift_getEnumCaseMultiPayload(a2, v12))
      {
        case 2u:
          v13 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a1, a2, v13);
          v14 = a1;
          v15 = v12;
          v16 = 2;
          goto LABEL_40;
        case 3u:
          v81 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v81 - 8) + 32))(a1, a2, v81);
          v14 = a1;
          v15 = v12;
          v16 = 3;
          goto LABEL_40;
        case 4u:
          v82 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v82 - 8) + 32))(a1, a2, v82);
          v14 = a1;
          v15 = v12;
          v16 = 4;
          goto LABEL_40;
        case 5u:
          v83 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v83 - 8) + 32))(a1, a2, v83);
          v14 = a1;
          v15 = v12;
          v16 = 5;
          goto LABEL_40;
        case 6u:
          v84 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v84 - 8) + 32))(a1, a2, v84);
          v14 = a1;
          v15 = v12;
          v16 = 6;
LABEL_40:
          swift_storeEnumTagMultiPayload(v14, v15, v16);
          break;
        default:
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
          break;
      }
      v85 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
      v86 = v85[5];
      v87 = (_OWORD *)((char *)a1 + v86);
      v88 = (_OWORD *)((char *)a2 + v86);
      v89 = v88[3];
      v87[2] = v88[2];
      v87[3] = v89;
      v90 = v88[1];
      *v87 = *v88;
      v87[1] = v90;
      *(_OWORD *)((char *)v87 + 106) = *(_OWORD *)((char *)v88 + 106);
      v91 = v88[6];
      v92 = v88[4];
      v87[5] = v88[5];
      v87[6] = v91;
      v87[4] = v92;
      *((_BYTE *)a1 + v85[6]) = *((_BYTE *)a2 + v85[6]);
      *((_BYTE *)a1 + v85[7]) = *((_BYTE *)a2 + v85[7]);
      *((_BYTE *)a1 + v85[8]) = *((_BYTE *)a2 + v85[8]);
      *((_BYTE *)a1 + v85[9]) = *((_BYTE *)a2 + v85[9]);
      *((_BYTE *)a1 + v85[10]) = *((_BYTE *)a2 + v85[10]);
      *(_QWORD *)((char *)a1 + v85[11]) = *(_QWORD *)((char *)a2 + v85[11]);
      v45 = a1;
      v46 = v6;
      v47 = 1;
      goto LABEL_66;
    case 2u:
      *a1 = *a2;
      v17 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
      v18 = (char *)a1 + v17;
      v19 = (char *)a2 + v17;
      v20 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v21 = *(_QWORD *)(v20 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
      {
        v22 = sub_100005DBC(&qword_100025908);
        memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload(v19, v20))
        {
          case 2u:
            v48 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v48 - 8) + 32))(v18, v19, v48);
            v49 = v18;
            v50 = v20;
            v51 = 2;
            goto LABEL_47;
          case 3u:
            v93 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v93 - 8) + 32))(v18, v19, v93);
            v49 = v18;
            v50 = v20;
            v51 = 3;
            goto LABEL_47;
          case 4u:
            v94 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v94 - 8) + 32))(v18, v19, v94);
            v49 = v18;
            v50 = v20;
            v51 = 4;
            goto LABEL_47;
          case 5u:
            v95 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v95 - 8) + 32))(v18, v19, v95);
            v49 = v18;
            v50 = v20;
            v51 = 5;
            goto LABEL_47;
          case 6u:
            v96 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v96 - 8) + 32))(v18, v19, v96);
            v49 = v18;
            v50 = v20;
            v51 = 6;
LABEL_47:
            swift_storeEnumTagMultiPayload(v49, v50, v51);
            break;
          default:
            memcpy(v18, v19, *(_QWORD *)(v21 + 64));
            break;
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
      }
      v45 = a1;
      v46 = v6;
      v47 = 2;
      goto LABEL_66;
    case 3u:
      *a1 = *a2;
      v23 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
      v24 = (char *)a1 + v23;
      v25 = (char *)a2 + v23;
      v26 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v27 = *(_QWORD *)(v26 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
      {
        v28 = sub_100005DBC(&qword_100025908);
        memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload(v25, v26))
        {
          case 2u:
            v52 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 32))(v24, v25, v52);
            v53 = v24;
            v54 = v26;
            v55 = 2;
            goto LABEL_55;
          case 3u:
            v97 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v97 - 8) + 32))(v24, v25, v97);
            v53 = v24;
            v54 = v26;
            v55 = 3;
            goto LABEL_55;
          case 4u:
            v98 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v98 - 8) + 32))(v24, v25, v98);
            v53 = v24;
            v54 = v26;
            v55 = 4;
            goto LABEL_55;
          case 5u:
            v99 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v99 - 8) + 32))(v24, v25, v99);
            v53 = v24;
            v54 = v26;
            v55 = 5;
            goto LABEL_55;
          case 6u:
            v100 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v100 - 8) + 32))(v24, v25, v100);
            v53 = v24;
            v54 = v26;
            v55 = 6;
LABEL_55:
            swift_storeEnumTagMultiPayload(v53, v54, v55);
            break;
          default:
            memcpy(v24, v25, *(_QWORD *)(v27 + 64));
            break;
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
      }
      v45 = a1;
      v46 = v6;
      v47 = 3;
      goto LABEL_66;
    case 4u:
      *a1 = *a2;
      v29 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
      v30 = (char *)a1 + v29;
      v31 = (char *)a2 + v29;
      v32 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
      v33 = *(_QWORD *)(v32 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
      {
        v34 = sub_100005DBC(&qword_100025908);
        memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
      }
      else
      {
        switch(swift_getEnumCaseMultiPayload(v31, v32))
        {
          case 2u:
            v56 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 32))(v30, v31, v56);
            v57 = v30;
            v58 = v32;
            v59 = 2;
            goto LABEL_63;
          case 3u:
            v101 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v101 - 8) + 32))(v30, v31, v101);
            v57 = v30;
            v58 = v32;
            v59 = 3;
            goto LABEL_63;
          case 4u:
            v102 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v102 - 8) + 32))(v30, v31, v102);
            v57 = v30;
            v58 = v32;
            v59 = 4;
            goto LABEL_63;
          case 5u:
            v103 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v103 - 8) + 32))(v30, v31, v103);
            v57 = v30;
            v58 = v32;
            v59 = 5;
            goto LABEL_63;
          case 6u:
            v104 = type metadata accessor for Date(0);
            (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v104 - 8) + 32))(v30, v31, v104);
            v57 = v30;
            v58 = v32;
            v59 = 6;
LABEL_63:
            swift_storeEnumTagMultiPayload(v57, v58, v59);
            break;
          default:
            memcpy(v30, v31, *(_QWORD *)(v33 + 64));
            break;
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
      }
      v45 = a1;
      v46 = v6;
      v47 = 4;
      goto LABEL_66;
    case 7u:
      v35 = type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState(0);
      v36 = *(_QWORD *)(v35 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v36 + 48))(a2, 1, v35))
      {
        v37 = sub_100005DBC(&qword_100025910);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
      }
      else
      {
        *a1 = *a2;
        v60 = *(int *)(v35 + 20);
        v61 = (char *)a1 + v60;
        v62 = (char *)a2 + v60;
        v63 = type metadata accessor for REMHashtagLabelSpecifier(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v63 - 8) + 32))(v61, v62, v63);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v36 + 56))(a1, 0, 1, v35);
      }
      v64 = *(int *)(type metadata accessor for TTRRemindersListViewModel.HashtagsState(0) + 20);
      v65 = (char *)a1 + v64;
      v66 = (char *)a2 + v64;
      *(_OWORD *)v65 = *(_OWORD *)v66;
      *((_QWORD *)v65 + 2) = *((_QWORD *)v66 + 2);
      v45 = a1;
      v46 = v6;
      v47 = 7;
      goto LABEL_66;
    case 8u:
      v38 = type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription(0);
      v39 = *(_QWORD *)(v38 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v39 + 48))(a2, 1, v38))
      {
        v40 = type metadata accessor for TTRTemplatePublicLinkData.StateToDisplay(0);
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
      }
      else
      {
        v67 = type metadata accessor for Date(0);
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v67 - 8) + 32))(a1, a2, v67);
        *((_BYTE *)a1 + *(int *)(v38 + 20)) = *((_BYTE *)a2 + *(int *)(v38 + 20));
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v39 + 56))(a1, 0, 1, v38);
      }
      v68 = type metadata accessor for TTRTemplatePublicLinkData(0);
      *(_QWORD *)((char *)a1 + *(int *)(v68 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v68 + 20));
      v45 = a1;
      v46 = v6;
      v47 = 8;
      goto LABEL_66;
    case 9u:
      *(_BYTE *)a1 = *(_BYTE *)a2;
      v41 = *(int *)(type metadata accessor for TTRRemindersListTips(0) + 20);
      v42 = (char *)a1 + v41;
      v43 = (char *)a2 + v41;
      v44 = type metadata accessor for AnyTip(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 32))(v42, v43, v44);
      v45 = a1;
      v46 = v6;
      v47 = 9;
LABEL_66:
      swift_storeEnumTagMultiPayload(v45, v46, v47);
      break;
    default:
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
      break;
  }
  v105 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  *(_QWORD *)((char *)a1 + v105) = *(_QWORD *)((char *)a2 + v105);
  v106 = a3[8];
  *(_QWORD *)((char *)a1 + a3[7]) = *(_QWORD *)((char *)a2 + a3[7]);
  *((_BYTE *)a1 + v106) = *((_BYTE *)a2 + v106);
  v107 = a3[10];
  *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
  v108 = (_QWORD *)((char *)a1 + v107);
  v109 = (_QWORD *)((char *)a2 + v107);
  ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  v111 = *(_QWORD *)(ReminderView - 8);
  if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v111 + 48))(v109, 1, ReminderView))
  {
    v112 = sub_100005DBC(&qword_100025DB0);
    memcpy(v108, v109, *(_QWORD *)(*(_QWORD *)(v112 - 8) + 64));
  }
  else
  {
    *v108 = *v109;
    v113 = *(int *)(ReminderView + 20);
    v114 = (char *)v108 + v113;
    v115 = (char *)v109 + v113;
    v116 = type metadata accessor for URL(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v116 - 8) + 32))(v114, v115, v116);
    *(_QWORD *)((char *)v108 + *(int *)(ReminderView + 24)) = *(_QWORD *)((char *)v109 + *(int *)(ReminderView + 24));
    (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v111 + 56))(v108, 0, 1, ReminderView);
  }
  v117 = a3[11];
  v118 = (char *)a1 + v117;
  v119 = (char *)a2 + v117;
  *(_QWORD *)v118 = *(_QWORD *)v119;
  v118[8] = v119[8];
  return a1;
}

_QWORD *sub_100015320(_QWORD *a1, _QWORD *a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
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
  char *v42;
  char *v43;
  uint64_t v44;
  _QWORD *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  int *v73;
  uint64_t v74;
  _OWORD *v75;
  _OWORD *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  int *v85;
  uint64_t v86;
  _OWORD *v87;
  _OWORD *v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
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
  void *v106;
  uint64_t v107;
  void *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void **v112;
  void **v113;
  uint64_t ReminderView;
  uint64_t v115;
  uint64_t (*v116)(void **, uint64_t, uint64_t);
  int v117;
  int v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id *v125;
  char *v126;
  int v127;
  id v128;
  void *v130;
  uint64_t v131;
  char *v132;
  char *v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;

  if (a1 != a2)
  {
    sub_100008650((uint64_t)a1, (uint64_t (*)(_QWORD))&type metadata accessor for TTRRemindersListViewModel.Item);
    v6 = type metadata accessor for TTRRemindersListViewModel.Item(0);
    switch(swift_getEnumCaseMultiPayload(a2, v6))
    {
      case 0u:
        v7 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        switch(swift_getEnumCaseMultiPayload(a2, v7))
        {
          case 2u:
            v8 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v8 - 8) + 32))(a1, a2, v8);
            v9 = a1;
            v10 = v7;
            v11 = 2;
            goto LABEL_34;
          case 3u:
            v69 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v69 - 8) + 32))(a1, a2, v69);
            v9 = a1;
            v10 = v7;
            v11 = 3;
            goto LABEL_34;
          case 4u:
            v70 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v70 - 8) + 32))(a1, a2, v70);
            v9 = a1;
            v10 = v7;
            v11 = 4;
            goto LABEL_34;
          case 5u:
            v71 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v71 - 8) + 32))(a1, a2, v71);
            v9 = a1;
            v10 = v7;
            v11 = 5;
            goto LABEL_34;
          case 6u:
            v72 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v72 - 8) + 32))(a1, a2, v72);
            v9 = a1;
            v10 = v7;
            v11 = 6;
LABEL_34:
            swift_storeEnumTagMultiPayload(v9, v10, v11);
            break;
          default:
            memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v7 - 8) + 64));
            break;
        }
        v73 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
        v74 = v73[5];
        v75 = (_OWORD *)((char *)a1 + v74);
        v76 = (_OWORD *)((char *)a2 + v74);
        v77 = v76[3];
        v75[2] = v76[2];
        v75[3] = v77;
        v78 = v76[1];
        *v75 = *v76;
        v75[1] = v78;
        *(_OWORD *)((char *)v75 + 106) = *(_OWORD *)((char *)v76 + 106);
        v79 = v76[6];
        v80 = v76[4];
        v75[5] = v76[5];
        v75[6] = v79;
        v75[4] = v80;
        *((_BYTE *)a1 + v73[6]) = *((_BYTE *)a2 + v73[6]);
        *((_BYTE *)a1 + v73[7]) = *((_BYTE *)a2 + v73[7]);
        *((_BYTE *)a1 + v73[8]) = *((_BYTE *)a2 + v73[8]);
        *((_BYTE *)a1 + v73[9]) = *((_BYTE *)a2 + v73[9]);
        *((_BYTE *)a1 + v73[10]) = *((_BYTE *)a2 + v73[10]);
        *(_QWORD *)((char *)a1 + v73[11]) = *(_QWORD *)((char *)a2 + v73[11]);
        v45 = a1;
        v46 = v6;
        v47 = 0;
        goto LABEL_67;
      case 1u:
        v12 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        switch(swift_getEnumCaseMultiPayload(a2, v12))
        {
          case 2u:
            v13 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(a1, a2, v13);
            v14 = a1;
            v15 = v12;
            v16 = 2;
            goto LABEL_41;
          case 3u:
            v81 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v81 - 8) + 32))(a1, a2, v81);
            v14 = a1;
            v15 = v12;
            v16 = 3;
            goto LABEL_41;
          case 4u:
            v82 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v82 - 8) + 32))(a1, a2, v82);
            v14 = a1;
            v15 = v12;
            v16 = 4;
            goto LABEL_41;
          case 5u:
            v83 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v83 - 8) + 32))(a1, a2, v83);
            v14 = a1;
            v15 = v12;
            v16 = 5;
            goto LABEL_41;
          case 6u:
            v84 = type metadata accessor for Date(0);
            (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v84 - 8) + 32))(a1, a2, v84);
            v14 = a1;
            v15 = v12;
            v16 = 6;
LABEL_41:
            swift_storeEnumTagMultiPayload(v14, v15, v16);
            break;
          default:
            memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
            break;
        }
        v85 = (int *)type metadata accessor for TTRRemindersListViewModel.SectionHeader(0);
        v86 = v85[5];
        v87 = (_OWORD *)((char *)a1 + v86);
        v88 = (_OWORD *)((char *)a2 + v86);
        v89 = v88[3];
        v87[2] = v88[2];
        v87[3] = v89;
        v90 = v88[1];
        *v87 = *v88;
        v87[1] = v90;
        *(_OWORD *)((char *)v87 + 106) = *(_OWORD *)((char *)v88 + 106);
        v91 = v88[6];
        v92 = v88[4];
        v87[5] = v88[5];
        v87[6] = v91;
        v87[4] = v92;
        *((_BYTE *)a1 + v85[6]) = *((_BYTE *)a2 + v85[6]);
        *((_BYTE *)a1 + v85[7]) = *((_BYTE *)a2 + v85[7]);
        *((_BYTE *)a1 + v85[8]) = *((_BYTE *)a2 + v85[8]);
        *((_BYTE *)a1 + v85[9]) = *((_BYTE *)a2 + v85[9]);
        *((_BYTE *)a1 + v85[10]) = *((_BYTE *)a2 + v85[10]);
        *(_QWORD *)((char *)a1 + v85[11]) = *(_QWORD *)((char *)a2 + v85[11]);
        v45 = a1;
        v46 = v6;
        v47 = 1;
        goto LABEL_67;
      case 2u:
        *a1 = *a2;
        v17 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v18 = (char *)a1 + v17;
        v19 = (char *)a2 + v17;
        v20 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v21 = *(_QWORD *)(v20 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20))
        {
          v22 = sub_100005DBC(&qword_100025908);
          memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v19, v20))
          {
            case 2u:
              v48 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v48 - 8) + 32))(v18, v19, v48);
              v49 = v18;
              v50 = v20;
              v51 = 2;
              goto LABEL_48;
            case 3u:
              v93 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v93 - 8) + 32))(v18, v19, v93);
              v49 = v18;
              v50 = v20;
              v51 = 3;
              goto LABEL_48;
            case 4u:
              v94 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v94 - 8) + 32))(v18, v19, v94);
              v49 = v18;
              v50 = v20;
              v51 = 4;
              goto LABEL_48;
            case 5u:
              v95 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v95 - 8) + 32))(v18, v19, v95);
              v49 = v18;
              v50 = v20;
              v51 = 5;
              goto LABEL_48;
            case 6u:
              v96 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v96 - 8) + 32))(v18, v19, v96);
              v49 = v18;
              v50 = v20;
              v51 = 6;
LABEL_48:
              swift_storeEnumTagMultiPayload(v49, v50, v51);
              break;
            default:
              memcpy(v18, v19, *(_QWORD *)(v21 + 64));
              break;
          }
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
        }
        v45 = a1;
        v46 = v6;
        v47 = 2;
        goto LABEL_67;
      case 3u:
        *a1 = *a2;
        v23 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v24 = (char *)a1 + v23;
        v25 = (char *)a2 + v23;
        v26 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v27 = *(_QWORD *)(v26 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26))
        {
          v28 = sub_100005DBC(&qword_100025908);
          memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v25, v26))
          {
            case 2u:
              v52 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v52 - 8) + 32))(v24, v25, v52);
              v53 = v24;
              v54 = v26;
              v55 = 2;
              goto LABEL_56;
            case 3u:
              v97 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v97 - 8) + 32))(v24, v25, v97);
              v53 = v24;
              v54 = v26;
              v55 = 3;
              goto LABEL_56;
            case 4u:
              v98 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v98 - 8) + 32))(v24, v25, v98);
              v53 = v24;
              v54 = v26;
              v55 = 4;
              goto LABEL_56;
            case 5u:
              v99 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v99 - 8) + 32))(v24, v25, v99);
              v53 = v24;
              v54 = v26;
              v55 = 5;
              goto LABEL_56;
            case 6u:
              v100 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v100 - 8) + 32))(v24, v25, v100);
              v53 = v24;
              v54 = v26;
              v55 = 6;
LABEL_56:
              swift_storeEnumTagMultiPayload(v53, v54, v55);
              break;
            default:
              memcpy(v24, v25, *(_QWORD *)(v27 + 64));
              break;
          }
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v24, 0, 1, v26);
        }
        v45 = a1;
        v46 = v6;
        v47 = 3;
        goto LABEL_67;
      case 4u:
        *a1 = *a2;
        v29 = *(int *)(type metadata accessor for TTRRemindersListViewModel.ReminderID(0) + 20);
        v30 = (char *)a1 + v29;
        v31 = (char *)a2 + v29;
        v32 = type metadata accessor for TTRRemindersListViewModel.SectionID(0);
        v33 = *(_QWORD *)(v32 - 8);
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32))
        {
          v34 = sub_100005DBC(&qword_100025908);
          memcpy(v30, v31, *(_QWORD *)(*(_QWORD *)(v34 - 8) + 64));
        }
        else
        {
          switch(swift_getEnumCaseMultiPayload(v31, v32))
          {
            case 2u:
              v56 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v56 - 8) + 32))(v30, v31, v56);
              v57 = v30;
              v58 = v32;
              v59 = 2;
              goto LABEL_64;
            case 3u:
              v101 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v101 - 8) + 32))(v30, v31, v101);
              v57 = v30;
              v58 = v32;
              v59 = 3;
              goto LABEL_64;
            case 4u:
              v102 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v102 - 8) + 32))(v30, v31, v102);
              v57 = v30;
              v58 = v32;
              v59 = 4;
              goto LABEL_64;
            case 5u:
              v103 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v103 - 8) + 32))(v30, v31, v103);
              v57 = v30;
              v58 = v32;
              v59 = 5;
              goto LABEL_64;
            case 6u:
              v104 = type metadata accessor for Date(0);
              (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v104 - 8) + 32))(v30, v31, v104);
              v57 = v30;
              v58 = v32;
              v59 = 6;
LABEL_64:
              swift_storeEnumTagMultiPayload(v57, v58, v59);
              break;
            default:
              memcpy(v30, v31, *(_QWORD *)(v33 + 64));
              break;
          }
          (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v33 + 56))(v30, 0, 1, v32);
        }
        v45 = a1;
        v46 = v6;
        v47 = 4;
        goto LABEL_67;
      case 7u:
        v35 = type metadata accessor for TTRRemindersListViewModel.HashtagLabelSelectorState(0);
        v36 = *(_QWORD *)(v35 - 8);
        if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v36 + 48))(a2, 1, v35))
        {
          v37 = sub_100005DBC(&qword_100025910);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
        }
        else
        {
          *a1 = *a2;
          v60 = *(int *)(v35 + 20);
          v61 = (char *)a1 + v60;
          v62 = (char *)a2 + v60;
          v63 = type metadata accessor for REMHashtagLabelSpecifier(0);
          (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v63 - 8) + 32))(v61, v62, v63);
          (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v36 + 56))(a1, 0, 1, v35);
        }
        v64 = *(int *)(type metadata accessor for TTRRemindersListViewModel.HashtagsState(0) + 20);
        v65 = (char *)a1 + v64;
        v66 = (char *)a2 + v64;
        *(_OWORD *)v65 = *(_OWORD *)v66;
        *((_QWORD *)v65 + 2) = *((_QWORD *)v66 + 2);
        v45 = a1;
        v46 = v6;
        v47 = 7;
        goto LABEL_67;
      case 8u:
        v38 = type metadata accessor for TTRTemplatePublicLinkData.CreatedStateDescription(0);
        v39 = *(_QWORD *)(v38 - 8);
        if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v39 + 48))(a2, 1, v38))
        {
          v40 = type metadata accessor for TTRTemplatePublicLinkData.StateToDisplay(0);
          memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v40 - 8) + 64));
        }
        else
        {
          v67 = type metadata accessor for Date(0);
          (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v67 - 8) + 32))(a1, a2, v67);
          *((_BYTE *)a1 + *(int *)(v38 + 20)) = *((_BYTE *)a2 + *(int *)(v38 + 20));
          (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v39 + 56))(a1, 0, 1, v38);
        }
        v68 = type metadata accessor for TTRTemplatePublicLinkData(0);
        *(_QWORD *)((char *)a1 + *(int *)(v68 + 20)) = *(_QWORD *)((char *)a2 + *(int *)(v68 + 20));
        v45 = a1;
        v46 = v6;
        v47 = 8;
        goto LABEL_67;
      case 9u:
        *(_BYTE *)a1 = *(_BYTE *)a2;
        v41 = *(int *)(type metadata accessor for TTRRemindersListTips(0) + 20);
        v42 = (char *)a1 + v41;
        v43 = (char *)a2 + v41;
        v44 = type metadata accessor for AnyTip(0);
        (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v44 - 8) + 32))(v42, v43, v44);
        v45 = a1;
        v46 = v6;
        v47 = 9;
LABEL_67:
        swift_storeEnumTagMultiPayload(v45, v46, v47);
        break;
      default:
        memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
        break;
    }
  }
  v105 = a3[6];
  *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
  v106 = *(void **)((char *)a1 + v105);
  *(_QWORD *)((char *)a1 + v105) = *(_QWORD *)((char *)a2 + v105);

  v107 = a3[7];
  v108 = *(void **)((char *)a1 + v107);
  *(_QWORD *)((char *)a1 + v107) = *(_QWORD *)((char *)a2 + v107);

  v109 = a3[9];
  *((_BYTE *)a1 + a3[8]) = *((_BYTE *)a2 + a3[8]);
  v110 = *(_QWORD *)((char *)a1 + v109);
  *(_QWORD *)((char *)a1 + v109) = *(_QWORD *)((char *)a2 + v109);
  swift_bridgeObjectRelease(v110);
  v111 = a3[10];
  v112 = (void **)((char *)a1 + v111);
  v113 = (void **)((char *)a2 + v111);
  ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  v115 = *(_QWORD *)(ReminderView - 8);
  v116 = *(uint64_t (**)(void **, uint64_t, uint64_t))(v115 + 48);
  v117 = v116(v112, 1, ReminderView);
  v118 = v116(v113, 1, ReminderView);
  if (v117)
  {
    if (!v118)
    {
      *v112 = *v113;
      v119 = *(int *)(ReminderView + 20);
      v120 = (char *)v112 + v119;
      v121 = (char *)v113 + v119;
      v122 = type metadata accessor for URL(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v122 - 8) + 32))(v120, v121, v122);
      *(void **)((char *)v112 + *(int *)(ReminderView + 24)) = *(void **)((char *)v113 + *(int *)(ReminderView + 24));
      (*(void (**)(void **, _QWORD, uint64_t, uint64_t))(v115 + 56))(v112, 0, 1, ReminderView);
      goto LABEL_74;
    }
    goto LABEL_73;
  }
  if (v118)
  {
    sub_100008650((uint64_t)v112, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
LABEL_73:
    v123 = sub_100005DBC(&qword_100025DB0);
    memcpy(v112, v113, *(_QWORD *)(*(_QWORD *)(v123 - 8) + 64));
    goto LABEL_74;
  }
  v130 = *v112;
  *v112 = *v113;

  v131 = *(int *)(ReminderView + 20);
  v132 = (char *)v112 + v131;
  v133 = (char *)v113 + v131;
  v134 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v134 - 8) + 40))(v132, v133, v134);
  v135 = *(int *)(ReminderView + 24);
  v136 = *(void **)((char *)v112 + v135);
  *(void **)((char *)v112 + v135) = *(void **)((char *)v113 + v135);

LABEL_74:
  v124 = a3[11];
  v125 = (id *)((char *)a1 + v124);
  v126 = (char *)a2 + v124;
  if (*((unsigned __int8 *)a1 + v124 + 8) != 255)
  {
    v127 = v126[8];
    if (v127 != 255)
    {
      v128 = *v125;
      *v125 = *(id *)v126;
      *((_BYTE *)v125 + 8) = v127 & 1;

      return a1;
    }
    sub_100014698(v125);
  }
  *v125 = *(id *)v126;
  *((_BYTE *)v125 + 8) = v126[8];
  return a1;
}

uint64_t sub_100016070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10001607C);
}

uint64_t sub_10001607C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = type metadata accessor for TTRRemindersListViewModel.Item(0);
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
    v8 = sub_100005DBC(&qword_100025DB0);
    v10 = a1 + *(int *)(a3 + 40);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 24));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_100016128(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100016134);
}

uint64_t sub_100016134(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = type metadata accessor for TTRRemindersListViewModel.Item(0);
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
      *(_QWORD *)(a1 + *(int *)(a4 + 24)) = (a2 - 1);
      return result;
    }
    v10 = sub_100005DBC(&qword_100025DB0);
    v12 = a1 + *(int *)(a4 + 40);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderViewModel(uint64_t a1)
{
  return sub_10000A1D4(a1, (uint64_t *)&unk_100025E40, (uint64_t)&nominal type descriptor for TTRIExtensionCreateReminderViewModel);
}

void sub_1000161F0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[8];

  v2 = type metadata accessor for TTRRemindersListViewModel.Item(319);
  if (v3 <= 0x3F)
  {
    v6[0] = *(_QWORD *)(v2 - 8) + 64;
    v6[1] = &unk_10001BE18;
    v6[2] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v6[3] = (char *)&value witness table for Builtin.UnknownObject + 64;
    v6[4] = &unk_10001BE18;
    v6[5] = &unk_10001BE30;
    sub_1000162A0(319);
    if (v5 <= 0x3F)
    {
      v6[6] = *(_QWORD *)(v4 - 8) + 64;
      v6[7] = &unk_10001BE48;
      swift_initStructMetadata(a1, 256, 8, v6, a1 + 16);
    }
  }
}

void sub_1000162A0(uint64_t a1)
{
  uint64_t ReminderView;
  unint64_t v3;
  uint64_t v4;

  if (!qword_100025E50)
  {
    ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(255);
    v3 = type metadata accessor for Optional(a1, ReminderView);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_100025E50);
  }
}

uint64_t initializeBufferWithCopyOfBuffer for TTRIExtensionCreateReminderViewModel.Image(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;
  id v5;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(id *)a2;
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

void destroy for TTRIExtensionCreateReminderViewModel.Image(id *a1)
{

}

uint64_t assignWithCopy for TTRIExtensionCreateReminderViewModel.Image(uint64_t a1, uint64_t a2)
{
  id v3;
  char v4;
  id v5;
  void *v6;

  v3 = *(id *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  v5 = *(id *)a2;
  v6 = *(void **)a1;
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;

  return a1;
}

uint64_t assignWithTake for TTRIExtensionCreateReminderViewModel.Image(uint64_t a1, uint64_t a2)
{
  char v3;
  void *v4;

  v3 = *(_BYTE *)(a2 + 8);
  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_BYTE *)(a1 + 8) = v3;

  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIExtensionCreateReminderViewModel.Image(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for TTRIExtensionCreateReminderViewModel.Image(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_100016460(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t sub_100016468(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TTRIExtensionCreateReminderViewModel.Image()
{
  return &type metadata for TTRIExtensionCreateReminderViewModel.Image;
}

void **sub_100016484(void **a1, void **a2, uint64_t a3)
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
  void *v15;
  id v16;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = (char *)*a2;
  *a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v7 = (void **)&v4[(v3 + 16) & ~(unint64_t)v3];
    swift_retain(v4);
  }
  else
  {
    v7 = a1;
    v8 = *(int *)(a3 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = type metadata accessor for URL(0);
    v12 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16);
    v13 = v4;
    v12(v9, v10, v11);
    v14 = *(int *)(a3 + 24);
    v15 = *(void **)((char *)a2 + v14);
    *(void **)((char *)v7 + v14) = v15;
    v16 = v15;
  }
  return v7;
}

void sub_100016538(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;

  v4 = (char *)a1 + *(int *)(a2 + 20);
  v5 = type metadata accessor for URL(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);

}

void **sub_100016594(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, char *, uint64_t);
  id v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = *a2;
  *a1 = *a2;
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for URL(0);
  v11 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 16);
  v12 = v6;
  v11(v8, v9, v10);
  v13 = *(int *)(a3 + 24);
  v14 = *(void **)((char *)a2 + v13);
  *(void **)((char *)a1 + v13) = v14;
  v15 = v14;
  return a1;
}

void **sub_100016620(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v6 = *a2;
  v7 = *a1;
  *a1 = *a2;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 24))(v10, v11, v12);
  v13 = *(int *)(a3 + 24);
  v14 = *(void **)((char *)a1 + v13);
  v15 = *(void **)((char *)a2 + v13);
  *(void **)((char *)a1 + v13) = v15;
  v16 = v15;

  return a1;
}

_QWORD *sub_1000166B0(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v9 - 8) + 32))(v7, v8, v9);
  *(_QWORD *)((char *)a1 + *(int *)(a3 + 24)) = *(_QWORD *)((char *)a2 + *(int *)(a3 + 24));
  return a1;
}

void **sub_100016728(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v6 = *a1;
  *a1 = *a2;

  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = type metadata accessor for URL(0);
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v10 - 8) + 40))(v8, v9, v10);
  v11 = *(int *)(a3 + 24);
  v12 = *(void **)((char *)a1 + v11);
  *(void **)((char *)a1 + v11) = *(void **)((char *)a2 + v11);

  return a1;
}

uint64_t sub_1000167B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000167BC);
}

uint64_t sub_1000167BC(char *a1, uint64_t a2, uint64_t a3)
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
    v8 = type metadata accessor for URL(0);
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_100016838(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100016844);
}

char *sub_100016844(char *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = type metadata accessor for URL(0);
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_1000168B8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = (char *)&value witness table for Builtin.UnknownObject + 64;
  result = type metadata accessor for URL(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(result - 8) + 64;
    v4[2] = &unk_10001BE30;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_100016938(uint64_t a1, uint64_t a2)
{
  return sub_100016A34(*(void **)a1, *(_BYTE *)(a1 + 8), *(void **)a2, *(_BYTE *)(a2 + 8));
}

uint64_t sub_100016958(_QWORD *a1, _QWORD *a2)
{
  uint64_t ReminderView;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  char v10;

  sub_10000B938(0, &qword_100025A98, NSObject_ptr);
  if ((static NSObject.== infix(_:_:)(*a1, *a2) & 1) != 0)
  {
    ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
    if ((static URL.== infix(_:_:)((char *)a1 + *(int *)(ReminderView + 20), (char *)a2 + *(int *)(ReminderView + 20)) & 1) != 0)
    {
      v5 = *(int *)(ReminderView + 24);
      v6 = *(void **)((char *)a1 + v5);
      v7 = *(void **)((char *)a2 + v5);
      if (v6)
      {
        if (v7)
        {
          sub_10000B938(0, &qword_100025AA0, LPLinkMetadata_ptr);
          v8 = v7;
          v9 = v6;
          v10 = static NSObject.== infix(_:_:)(v9, v8);

          if ((v10 & 1) != 0)
            return 1;
        }
      }
      else if (!v7)
      {
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_100016A34(void *a1, char a2, void *a3, char a4)
{
  id v6;
  id v7;
  char v8;
  uint64_t v10;
  id v11;
  id v12;
  char v13;

  if ((a2 & 1) != 0)
  {
    if ((a4 & 1) != 0)
    {
      if (a1)
      {
        if (a3)
        {
          sub_10000B938(0, &qword_100025AA8, UIImage_ptr);
          v10 = 1;
          v11 = a1;
          v12 = a3;
          v13 = static NSObject.== infix(_:_:)(a1, a3);

          if ((v13 & 1) != 0)
            return v10;
        }
      }
      else
      {
        if (!a3)
          return 1;

      }
    }
  }
  else if ((a4 & 1) == 0)
  {
    sub_10000B938(0, &qword_100025A98, NSObject_ptr);
    v6 = a1;
    v7 = a3;
    v8 = static NSObject.== infix(_:_:)(a1, a3);

    return v8 & 1;
  }
  return 0;
}

void sub_100016B64(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;
  void *object;
  Swift::String v9;
  Swift::String v10;
  void *v11;
  Swift::String v12;
  Swift::String v13;
  void *v14;
  NSString v15;
  NSString v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSString v21;
  void *v22;
  id v23;
  void *Strong;
  void *v25;
  _QWORD v26[5];
  uint64_t v27;

  if ((static REMFeatureFlags.isAppleAccountBrandingEnabled()() & 1) != 0)
  {
    v5._countAndFlagsBits = 0xD00000000000001FLL;
    v6._countAndFlagsBits = 0xD000000000000099;
    v5._object = (void *)0x800000010001C8D0;
    v7._object = (void *)0x800000010001C8F0;
    v6._object = (void *)0x800000010001C940;
    v7._countAndFlagsBits = 0x1000000000000049;
    object = TTRLocalizedString(_:value:comment:)(v5, v7, v6)._object;
  }
  else
  {
    v9._countAndFlagsBits = 0xD000000000000031;
    v10._countAndFlagsBits = 0xD000000000000049;
    v10._object = (void *)0x800000010001C7D0;
    v9._object = (void *)0x800000010001C820;
    object = TTRLocalizedString(_:comment:)(v10, v9)._object;
  }
  v11 = object;
  v12._countAndFlagsBits = 0xD00000000000002FLL;
  v13._object = (void *)0x800000010001C860;
  v12._object = (void *)0x800000010001C880;
  v13._countAndFlagsBits = 0xD000000000000016;
  v14 = TTRLocalizedString(_:comment:)(v13, v12)._object;
  v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v14);
  v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  v17 = objc_msgSend((id)objc_opt_self(UIAlertController), "alertControllerWithTitle:message:preferredStyle:", v15, v16, 1);

  static TTRLocalizableStrings.Common.alertOKButton.getter();
  v19 = v18;
  v20 = swift_allocObject(&unk_100021460, 32, 7);
  *(_QWORD *)(v20 + 16) = a1;
  *(_QWORD *)(v20 + 24) = a2;
  swift_retain(a2);
  v21 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  v26[4] = sub_100016E9C;
  v27 = v20;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 1107296256;
  v26[2] = sub_100016DDC;
  v26[3] = &unk_100021478;
  v22 = _Block_copy(v26);
  swift_release(v27);
  v23 = objc_msgSend((id)objc_opt_self(UIAlertAction), "actionWithTitle:style:handler:", v21, 0, v22);
  _Block_release(v22);

  objc_msgSend(v17, "addAction:", v23);
  Strong = (void *)swift_unknownObjectWeakLoadStrong(v2 + 16);
  if (Strong)
  {
    v25 = Strong;
    objc_msgSend(Strong, "presentViewController:animated:completion:", v17, 1, 0);

  }
}

void sub_100016DDC(uint64_t a1, void *a2)
{
  uint64_t v3;
  void (*v4)(void);
  id v5;

  v4 = *(void (**)(void))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = a2;
  v4();
  swift_release(v3);

}

uint64_t sub_100016E2C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectWeakDestroy(v2 + 16, a2);

  return swift_deallocClassInstance(v2, 32, 7);
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderRouter()
{
  return objc_opt_self(_TtC25RemindersSharingExtension33TTRIExtensionCreateReminderRouter);
}

uint64_t sub_100016E78()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100016E9C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100016EBC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100016ECC(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

void sub_100016ED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  NSString v12;
  unint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _BYTE v29[56];

  static REM_os_activity.labelUserAction(_:dso:)(a1, a2, a3, &_mh_execute_header);
  v8 = sub_100005DBC(&qword_100025FD8);
  inited = swift_initStackObject(v8, v29);
  *(_OWORD *)(inited + 16) = xmmword_10001BF40;
  type metadata accessor for Analytics(0);
  *(_QWORD *)(inited + 32) = 0x696669746E656449;
  *(_QWORD *)(inited + 40) = 0xEA00000000007265;
  StaticString.description.getter(a1, a2, a3);
  v11 = v10;
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  *(_QWORD *)(inited + 48) = v12;
  v13 = sub_1000100B4(inited);
  static Analytics.postEvent(_:payload:duration:)(0xD00000000000001CLL, 0x800000010001C9F0, v13, 0, 1);
  swift_bridgeObjectRelease(v13);
  if (qword_100025590 != -1)
    swift_once(&qword_100025590, sub_1000171BC, v14);
  v15 = type metadata accessor for Logger(0);
  sub_10000CF9C(v15, (uint64_t)qword_100026218);
  v16 = swift_bridgeObjectRetain_n(a4, 2);
  v17 = Logger.logObject.getter(v16);
  v18 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = swift_slowAlloc(22, -1);
    v20 = swift_slowAlloc(64, -1);
    v28 = v20;
    *(_DWORD *)v19 = 136446466;
    v21 = StaticString.description.getter(a1, a2, a3);
    v23 = v22;
    v27 = sub_100017254(v21, v22, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v19 + 4, v19 + 12);
    swift_bridgeObjectRelease(v23);
    *(_WORD *)(v19 + 12) = 2080;
    swift_bridgeObjectRetain(a4);
    v24 = Dictionary.description.getter(a4, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
    v26 = v25;
    swift_bridgeObjectRelease(a4);
    v27 = sub_100017254(v24, v26, &v28);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v27, &v28, v19 + 14, v19 + 22);
    swift_bridgeObjectRelease_n(a4, 2);
    swift_bridgeObjectRelease(v26);
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "%{public}s; UserInfo=%s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy(v20, 2, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v20, -1, -1);
    swift_slowDealloc(v19, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n(a4, 2);
  }
}

uint64_t sub_1000171BC(uint64_t a1)
{
  return sub_1000171E4(a1, qword_100026218, (SEL *)&selRef_userAction);
}

uint64_t sub_1000171D0(uint64_t a1)
{
  return sub_1000171E4(a1, qword_100026230, (SEL *)&selRef_ui);
}

uint64_t sub_1000171E4(uint64_t a1, uint64_t *a2, SEL *a3)
{
  uint64_t v5;
  id v6;

  v5 = type metadata accessor for Logger(0);
  sub_10000CFE8(v5, a2);
  sub_10000CF9C(v5, (uint64_t)a2);
  v6 = objc_msgSend((id)objc_opt_self(REMLog), *a3);
  return Logger.init(_:)(v6);
}

uint64_t sub_100017254(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  void *ObjectType;

  v6 = sub_100017324(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = (void *)swift_getObjectType(v6);
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_100017894((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_100017894((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain(a2);
  }
  sub_10000CEF0(v12);
  return v7;
}

uint64_t sub_100017324(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  int v14;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v12 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v12)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v12] || (char *)__src + v12 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter(0, HIBYTE(a6) & 0xF, __dst, a3);
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1000174DC(a5, a6);
    *a1 = v13;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = _StringObject.sharedUTF8.getter(a5, a6);
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Unexpectedly found nil while unwrapping an Optional value", 57, 2, "Swift/StringTesting.swift", 25, 2, 151, 0);
    __break(1u);
LABEL_17:
    LOBYTE(v14) = 2;
    result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableRawPointer.initializeMemory overlapping range", 58, 2, "Swift/UnsafeRawPointer.swift", 28, v14, 1173, 0);
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain(a6 & 0xFFFFFFFFFFFFFFFLL);
}

uint64_t sub_1000174DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = (uint64_t)sub_100017570(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_100017748(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_100017748(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

_QWORD *sub_100017570(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  _QWORD *result;
  int v10;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v4 = HIBYTE(a2) & 0xF;
  else
    v4 = a1 & 0xFFFFFFFFFFFFLL;
  if (v4)
  {
    while (1)
    {
      v5 = sub_1000176E4(v4, 0);
      if (v4 < 0)
        break;
      v6 = v5;
      v7 = _StringGuts.copyUTF8(into:)(v5 + 4, v4, a1, a2);
      if ((v8 & 1) != 0)
        goto LABEL_14;
      if (v7 == v4)
        return v6;
      LOBYTE(v10) = 2;
      _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "invalid Collection: less than 'count' elements in collection", 60, 2, "Swift/ContiguousArrayBuffer.swift", 33, v10, 1122, 0);
      __break(1u);
LABEL_10:
      v4 = String.UTF8View._foreignCount()();
      if (!v4)
        return &_swiftEmptyArrayStorage;
    }
    LOBYTE(v10) = 2;
    _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutableBufferPointer with negative count", 46, 2, "Swift/UnsafeBufferPointer.swift", 31, v10, 71, 0);
    __break(1u);
LABEL_14:
    LOBYTE(v10) = 2;
    result = (_QWORD *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, "Insufficient space allocated to copy string contents", 52, 2, "Swift/StringUTF8View.swift", 26, v10, 430, 0);
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

_QWORD *sub_1000176E4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  size_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return &_swiftEmptyArrayStorage;
  v4 = sub_100005DBC(&qword_100025FE0);
  v5 = (_QWORD *)swift_allocObject(v4, v2 + 32, 7);
  v6 = j__malloc_size(v5);
  v5[2] = a1;
  v5[3] = 2 * v6 - 64;
  return v5;
}

uint64_t sub_100017748(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  char *v11;
  size_t v12;
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
    v10 = sub_100005DBC(&qword_100025FE0);
    v11 = (char *)swift_allocObject(v10, v9 + 32, 7);
    v12 = j__malloc_size(v11);
    *((_QWORD *)v11 + 2) = v8;
    *((_QWORD *)v11 + 3) = 2 * v12 - 64;
  }
  else
  {
    v11 = (char *)&_swiftEmptyArrayStorage;
  }
  v13 = v11 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v13 >= &v14[v8])
      memmove(v13, v14, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v14 >= &v13[v8] || v13 >= &v14[v8])
  {
    memcpy(v13, v14, v8);
LABEL_28:
    swift_bridgeObjectRelease(a4);
    return (uint64_t)v11;
  }
LABEL_30:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

uint64_t sub_100017894(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1000178D4(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1000178F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

uint64_t sub_100017914()
{
  uint64_t v0;
  uint64_t v1;
  double v2;
  uint64_t v3;

  v0 = type metadata accessor for Logger(0);
  sub_10000CFE8(v0, qword_100025FE8);
  v1 = sub_10000CF9C(v0, (uint64_t)qword_100025FE8);
  if (qword_100025598 != -1)
    swift_once(&qword_100025598, sub_1000171D0, v2);
  v3 = sub_10000CF9C(v0, (uint64_t)qword_100026230);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 16))(v1, v3, v0);
}

id sub_1000179A4(void *a1)
{
  _BYTE *v1;
  _BYTE *v2;
  objc_class *ObjectType;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  objc_super v11;
  __int128 v12;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType(v1);
  swift_unknownObjectWeakInit(&v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableView], 0);
  swift_unknownObjectWeakInit(&v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_addBarButtonItem], 0);
  v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_needToUpdateCellSizesOnLayout] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableDataController] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeCancellable] = 0;
  v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_generatedSuggestionTextHasBeenSelected] = 0;
  v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_isFirstUpdate] = 1;
  *(_QWORD *)&v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___titleCell] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___notesCell] = 0;
  *(_QWORD *)&v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___detailsCell] = 0;
  v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_detailViewHasBeenAutomaticallyShown] = 0;
  v5 = v2;
  static TTRTypedController.currentArgument.getter(&v12, ObjectType, &off_100026090);
  v6 = v12;
  *(_OWORD *)&v5[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_presenter] = v12;
  v7 = v6;
  swift_unknownObjectRetain(v6);

  v11.receiver = v5;
  v11.super_class = ObjectType;
  v8 = objc_msgSendSuper2(&v11, "initWithCoder:", a1);

  v9 = v8;
  swift_unknownObjectRelease(v7);
  if (v9)

  return v9;
}

void *sub_100017B20()
{
  char *v0;
  char *v1;
  objc_class *ObjectType;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t ReminderViewModel;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  void *result;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  objc_class *v42;
  char *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  char v47[24];
  objc_super v48;

  v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType(v0);
  v3 = sub_100005DBC(&qword_1000260D8);
  __chkstk_darwin(v3);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100005DBC(&qword_1000260E0);
  v44 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v43 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100005DBC(&qword_100025BE8);
  __chkstk_darwin(v8);
  v10 = (char *)&v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  ReminderViewModel = type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
  v12 = *(_QWORD *)(ReminderViewModel - 8);
  __chkstk_darwin(ReminderViewModel);
  v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v48.receiver = v0;
  v48.super_class = ObjectType;
  objc_msgSendSuper2(&v48, "viewDidLoad");
  v15 = &v0[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableView];
  result = (void *)swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableView]);
  if (!result)
  {
    __break(1u);
    goto LABEL_10;
  }
  v17 = result;
  v41 = v6;
  v42 = ObjectType;
  UITableView.fixUpBackgroundColorLoadedFromNibIfNeeded_workaroundRdar108920406()();

  result = (void *)swift_unknownObjectWeakLoadStrong(v15);
  if (!result)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v18 = result;
  v19 = *(_QWORD *)(TTRAccesibility.SharingExtension.ID.ShareTable.unsafeMutableAddressor() + 8);
  swift_bridgeObjectRetain(v19);
  v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v19);
  objc_msgSend(v18, "setAccessibilityIdentifier:", v20);

  result = (void *)swift_unknownObjectWeakLoadStrong(v15);
  if (!result)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  v21 = result;
  objc_msgSend(result, "setEditing:", 1);

  result = (void *)swift_unknownObjectWeakLoadStrong(v15);
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  v22 = result;
  objc_msgSend(result, "setKeyboardDismissMode:", 3);

  sub_100017F94();
  v23 = *(_QWORD *)&v1[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_presenter]
      + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_viewModel;
  swift_beginAccess(v23, v47, 0, 0);
  sub_10000BAD0(v23, (uint64_t)v10, &qword_100025BE8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, ReminderViewModel) == 1)
  {
    sub_10000BA94((uint64_t)v10, &qword_100025BE8);
  }
  else
  {
    sub_10000B584((uint64_t)v10, (uint64_t)v14, type metadata accessor for TTRIExtensionCreateReminderViewModel);
    sub_100018384((uint64_t)v14);
    sub_10001A04C((uint64_t)v14);
  }
  v25 = v43;
  v24 = v44;
  v26 = type metadata accessor for TTRICurrentTextInputModeObserver(0);
  swift_allocObject(v26, 40, 7);
  v27 = TTRICurrentTextInputModeObserver.init()();
  v28 = *(_QWORD *)&v1[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver];
  *(_QWORD *)&v1[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver] = v27;
  swift_retain(v27);
  swift_release(v28);
  v46 = *(_QWORD *)(v27 + 16);
  v29 = v46;
  v30 = (void *)objc_opt_self(NSRunLoop);
  swift_retain(v29);
  v45 = objc_msgSend(v30, "mainRunLoop");
  v31 = type metadata accessor for NSRunLoop.SchedulerOptions(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v5, 1, 1, v31);
  v32 = sub_100005DBC(&qword_1000260E8);
  v33 = sub_10000B938(0, &qword_1000260F0, NSRunLoop_ptr);
  v34 = sub_10001A00C(&qword_1000260F8, &qword_1000260E8, (uint64_t)&protocol conformance descriptor for AnyPublisher<A, B>);
  v35 = sub_100019FB4();
  Publisher.receive<A>(on:options:)(&v45, v5, v32, v33, v34, v35);
  sub_10000BA94((uint64_t)v5, &qword_1000260D8);

  swift_release(v46);
  v36 = sub_10001A00C(&qword_100026108, &qword_1000260E0, (uint64_t)&protocol conformance descriptor for Publishers.ReceiveOn<A, B>);
  v37 = v41;
  v38 = Publisher.sink<A>(weakTarget:receiveValue:receiveCompletion:)(v1, sub_100018788, 0, 0, 0, v41, v42, v36);
  swift_release(v27);
  (*(void (**)(char *, uint64_t))(v24 + 8))(v25, v37);
  v39 = *(_QWORD *)&v1[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeCancellable];
  *(_QWORD *)&v1[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeCancellable] = v38;
  return (void *)swift_release(v39);
}

void sub_100017F94()
{
  char *v0;
  char *v1;
  double v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t inited;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t Strong;
  uint64_t v18;
  _QWORD *v19;
  id v20;
  char *v21;
  char *v22;
  void *v23;
  char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *oslog;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[25];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[25];
  char v38[56];

  v1 = v0;
  if (!objc_msgSend(v0, "isViewLoaded"))
    return;
  v3 = OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableDataController;
  if (!*(_QWORD *)&v0[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableDataController])
  {
    v8 = sub_100005DBC(&qword_100025AB8);
    inited = swift_initStackObject(v8, v38);
    *(_OWORD *)(inited + 16) = xmmword_10001BF60;
    v36 = 0u;
    memset(v37, 0, sizeof(v37));
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    memset(v33, 0, sizeof(v33));
    v30 = 0u;
    v31 = 0u;
    v10 = sub_100005DBC(&qword_100026110);
    v11 = swift_allocObject(v10, 48, 7);
    *(_OWORD *)(v11 + 16) = xmmword_10001BF40;
    *(_QWORD *)(v11 + 32) = sub_100018CFC();
    *(_QWORD *)(v11 + 40) = &protocol witness table for TTRITableCell<A>;
    v12 = type metadata accessor for TTRITableSection(0);
    swift_allocObject(v12, 217, 7);
    *(_QWORD *)(inited + 32) = TTRITableSection.init(header:footer:items:)(&v34, &v30, v11);
    v36 = 0u;
    memset(v37, 0, sizeof(v37));
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    memset(v33, 0, sizeof(v33));
    v30 = 0u;
    v31 = 0u;
    v13 = swift_allocObject(v10, 48, 7);
    *(_OWORD *)(v13 + 16) = xmmword_10001BF40;
    *(_QWORD *)(v13 + 32) = sub_100018E64();
    *(_QWORD *)(v13 + 40) = &protocol witness table for TTRITableCell<A>;
    swift_allocObject(v12, 217, 7);
    *(_QWORD *)(inited + 40) = TTRITableSection.init(header:footer:items:)(&v34, &v30, v13);
    v36 = 0u;
    memset(v37, 0, sizeof(v37));
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    memset(v33, 0, sizeof(v33));
    v30 = 0u;
    v31 = 0u;
    v14 = swift_allocObject(v10, 48, 7);
    *(_OWORD *)(v14 + 16) = xmmword_10001BF40;
    *(_QWORD *)(v14 + 32) = sub_100018F80();
    *(_QWORD *)(v14 + 40) = &protocol witness table for TTRITableCell<A>;
    swift_allocObject(v12, 217, 7);
    *(_QWORD *)(inited + 48) = TTRITableSection.init(header:footer:items:)(&v34, &v30, v14);
    *(_QWORD *)&v34 = inited;
    specialized Array._endMutation()();
    v15 = v34;
    v16 = &v0[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableView];
    Strong = swift_unknownObjectWeakLoadStrong(&v0[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableView]);
    if (Strong)
    {
      v18 = Strong;
      v19 = sub_1000192F4(v15);
      swift_bridgeObjectRelease(v15);
      *((_QWORD *)&v35 + 1) = sub_10000B938(0, &qword_1000260D0, UITableView_ptr);
      *(_QWORD *)&v36 = &protocol witness table for UITableView;
      *(_QWORD *)&v34 = v18;
      v20 = objc_allocWithZone((Class)type metadata accessor for TTRITableDataController(0));
      v21 = (char *)TTRITableDataController.init(tableView:sections:rowInsertionAnimationType:collapseSectionIfItemsAreHidden:)(&v34, v19, 6, 0);
      v22 = &v21[direct field offset for TTRITableDataController.customSectionSpacing];
      swift_beginAccess(&v21[direct field offset for TTRITableDataController.customSectionSpacing], &v34, 1, 0);
      *(_QWORD *)v22 = 0x4030000000000000;
      v22[8] = 0;
      v23 = *(void **)&v1[v3];
      *(_QWORD *)&v1[v3] = v21;
      v24 = v21;

      v25 = (void *)swift_unknownObjectWeakLoadStrong(v16);
      if (v25)
      {
        v26 = v25;
        objc_msgSend(v25, "setDataSource:", v24);

        v27 = (void *)swift_unknownObjectWeakLoadStrong(v16);
        if (v27)
        {
          v28 = v27;
          objc_msgSend(v27, "setDelegate:", v24);

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
  if (qword_1000255A0 != -1)
    swift_once(&qword_1000255A0, sub_100017914, v2);
  v4 = type metadata accessor for Logger(0);
  v5 = sub_10000CF9C(v4, (uint64_t)qword_100025FE8);
  oslog = Logger.logObject.getter(v5);
  v6 = static os_log_type_t.fault.getter();
  if (os_log_type_enabled(oslog, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v6, "buildSections is called more than once", v7, 2u);
    swift_slowDealloc(v7, -1, -1);
  }

}

uint64_t sub_100018384(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t result;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t ObjectType;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  _QWORD v33[4];
  char v34[24];
  __int128 aBlock;
  uint64_t (*v36)(uint64_t, uint64_t);
  void *v37;
  uint64_t (*v38)();
  uint64_t v39;
  char v40[24];

  v2 = v1;
  result = (uint64_t)objc_msgSend(v1, "isViewLoaded");
  if ((_DWORD)result)
  {
    v5 = sub_100018CFC();
    v6 = (char *)*(id *)(v5 + 32);
    swift_release(v5);
    v7 = (uint64_t)&v6[direct field offset for TTRIReminderTitleCellContent.titleModule];
    swift_beginAccess(&v6[direct field offset for TTRIReminderTitleCellContent.titleModule], v40, 0, 0);
    sub_10000BAD0(v7, (uint64_t)&aBlock, &qword_1000260B0);

    v8 = aBlock;
    sub_10000BA94((uint64_t)&aBlock, &qword_1000260B0);
    if (!v8)
    {
      v9 = sub_100018CFC();
      v10 = *(id *)(v9 + 32);
      swift_release(v9);
      sub_10000E368((uint64_t)v2, (uint64_t)&off_1000214B0, v2, &aBlock);
      TTRIReminderTitleCellContent.titleModule.setter(&aBlock);

    }
    v11 = sub_100018E64();
    v12 = (char *)*(id *)(v11 + 32);
    swift_release(v11);
    v13 = (uint64_t)&v12[qword_100026208];
    swift_beginAccess(&v12[qword_100026208], v34, 0, 0);
    sub_10000BAD0(v13, (uint64_t)&aBlock, &qword_100025A78);

    v14 = aBlock;
    sub_10000BA94((uint64_t)&aBlock, &qword_100025A78);
    if (!v14)
    {
      v15 = sub_100018E64();
      v16 = *(id *)(v15 + 32);
      swift_release(v15);
      sub_10000E374((uint64_t)v2, (uint64_t)&off_1000214A0, v2, &aBlock);
      sub_1000028C4((uint64_t)&aBlock);

    }
    result = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_addBarButtonItem]);
    if (!result)
    {
      __break(1u);
      return result;
    }
    v17 = (void *)result;
    objc_msgSend((id)result, "setEnabled:", *(unsigned __int8 *)(a1 + *(int *)(type metadata accessor for TTRIExtensionCreateReminderViewModel(0) + 20)));

    v19 = v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_isFirstUpdate];
    v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_isFirstUpdate] = 0;
    if (*(_QWORD *)&v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableDataController])
    {
      v20 = v19 ^ 1u;
      __chkstk_darwin(v18);
      v33[2] = v2;
      v33[3] = a1;
      v22 = v21;
      TTRITableDataController.performBatchUpdates(by:updates:)(v20, sub_100019F50, v33);

    }
    v23 = *(_QWORD *)&v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_presenter];
    v24 = *(_QWORD *)(v23
                    + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor
                    + 8);
    ObjectType = swift_getObjectType(*(_QWORD *)(v23
                                               + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
    result = (*(uint64_t (**)(uint64_t, uint64_t))(v24 + 72))(ObjectType, v24);
    if ((result & 1) != 0)
    {
      v26 = OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_generatedSuggestionTextHasBeenSelected;
      if ((v2[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_generatedSuggestionTextHasBeenSelected] & 1) == 0
        && (*(_BYTE *)(v23 + 48) & 1) == 0)
      {
        v27 = swift_allocObject(&unk_100021578, 24, 7);
        swift_unknownObjectWeakInit(v27 + 16, v2);
        swift_retain(v27);
        v28 = objc_msgSend(v2, "transitionCoordinator");
        if (v28)
        {
          v29 = v28;
          if (objc_msgSend(v28, "isAnimated"))
          {
            swift_release(v27);
            v30 = swift_allocObject(&unk_1000215F0, 32, 7);
            *(_QWORD *)(v30 + 16) = sub_100019F58;
            *(_QWORD *)(v30 + 24) = v27;
            v38 = sub_100016E9C;
            v39 = v30;
            *(_QWORD *)&aBlock = _NSConcreteStackBlock;
            *((_QWORD *)&aBlock + 1) = 1107296256;
            v36 = sub_100019ACC;
            v37 = &unk_100021608;
            v31 = _Block_copy(&aBlock);
            v32 = v39;
            swift_retain(v27);
            swift_release(v32);
            objc_msgSend(v29, "animateAlongsideTransition:completion:", v31, 0);
            swift_release(v27);
            _Block_release(v31);
            result = swift_unknownObjectRelease(v29);
LABEL_17:
            v2[v26] = 1;
            return result;
          }
          swift_unknownObjectRelease(v29);
        }
        sub_100019A08(v27);
        result = swift_release_n(v27, 2);
        goto LABEL_17;
      }
    }
  }
  return result;
}

uint64_t sub_100018788(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t ObjectType;
  void (*v6)(uint64_t, uint64_t);
  _BYTE v7[24];

  v1 = *(_QWORD *)(*(_QWORD *)(a1
                             + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_presenter)
                 + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_inCellEditingPresenterHelper);
  result = swift_beginAccess(v1 + 40, v7, 0, 0);
  v3 = *(_QWORD *)(v1 + 40);
  if (v3)
  {
    v4 = *(_QWORD *)(v1 + 48);
    ObjectType = swift_getObjectType(v3);
    v6 = *(void (**)(uint64_t, uint64_t))(v4 + 48);
    swift_unknownObjectRetain(v3);
    v6(ObjectType, v4);
    return swift_unknownObjectRelease(v3);
  }
  return result;
}

uint64_t sub_100018848(char a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType(v1);
  v9.receiver = v1;
  v9.super_class = ObjectType;
  v4 = a1 & 1;
  objc_msgSendSuper2(&v9, "viewWillAppear:", v4);
  result = swift_unknownObjectWeakLoadStrong(&v1[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableView]);
  if (result)
  {
    v6 = result;
    v8[3] = sub_10000B938(0, &qword_1000260D0, UITableView_ptr);
    v8[4] = &protocol witness table for UITableView;
    v8[0] = v6;
    UIViewController.deselectRowsAlongsideTransition(for:animated:)(v8, v4);
    sub_10000CEF0(v8);
    result = TTRKeyboardAvoidance<>.startAvoidingKeyboard()(ObjectType, &off_1000214E0);
    v7 = *(_QWORD *)&v1[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_currentTextInputModeObserver];
    if (v7)
    {
      swift_retain(v7);
      TTRICurrentTextInputModeObserver.startObserving()();
      return swift_release(v7);
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_100018A00()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  char isEscapingClosureAtFileLocation;
  _QWORD v9[5];
  uint64_t v10;
  objc_super v11;

  v11.receiver = v0;
  v11.super_class = (Class)swift_getObjectType(v0);
  result = objc_msgSendSuper2(&v11, "viewWillLayoutSubviews");
  if (*((_BYTE *)v0
       + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_needToUpdateCellSizesOnLayout) == 1)
  {
    *((_BYTE *)v0
    + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_needToUpdateCellSizesOnLayout) = 0;
    v2 = (void *)objc_opt_self(UIView);
    v3 = swift_allocObject(&unk_100021640, 24, 7);
    *(_QWORD *)(v3 + 16) = v0;
    v4 = swift_allocObject(&unk_100021668, 32, 7);
    *(_QWORD *)(v4 + 16) = sub_100019F9C;
    *(_QWORD *)(v4 + 24) = v3;
    v9[4] = sub_100016E9C;
    v10 = v4;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    v9[2] = sub_1000178F4;
    v9[3] = &unk_100021680;
    v5 = _Block_copy(v9);
    v6 = v10;
    v7 = v0;
    swift_retain(v4);
    swift_release(v6);
    objc_msgSend(v2, "performWithoutAnimation:", v5);
    _Block_release(v5);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation(v4, "", 159, 207, 40, 1);
    swift_release(v3);
    result = (id)swift_release(v4);
    if ((isEscapingClosureAtFileLocation & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_100018CFC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  Swift::String v8;
  Swift::String v9;
  Swift::String v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  v1 = v0;
  v2 = sub_100005DBC(&qword_1000260B8);
  __chkstk_darwin(v2);
  v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___titleCell;
  v6 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___titleCell);
  if (v6)
  {
    v7 = *(_QWORD *)(v1
                   + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___titleCell);
  }
  else
  {
    v8._countAndFlagsBits = 0xD00000000000002CLL;
    v8._object = (void *)0x800000010001CF50;
    v9._countAndFlagsBits = 0x656C746954;
    v9._object = (void *)0xE500000000000000;
    v10 = TTRLocalizedString(_:comment:)(v9, v8);
    v11 = type metadata accessor for TTRIReminderTitleCellContentState(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v4, 1, 1, v11);
    v12 = objc_allocWithZone((Class)type metadata accessor for TTRIReminderTitleCellContent(0));
    v13 = TTRIReminderTitleCellContent.init(placeholder:accessibilityIdentifier:state:)(v10._countAndFlagsBits, v10._object, 0xD00000000000001DLL, 0x800000010001CF80, v4);
    v14 = sub_100005DBC(&qword_1000260C8);
    swift_allocObject(v14, 73, 7);
    v7 = TTRITableCell.init(_:)(v13);
    v15 = *(_QWORD *)(v1 + v5);
    *(_QWORD *)(v1 + v5) = v7;
    swift_retain(v7);
    swift_release(v15);
    v6 = 0;
  }
  swift_retain(v6);
  return v7;
}

uint64_t sub_100018E64()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ReminderNotesCellContentState;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;

  v1 = v0;
  v2 = sub_100005DBC(&qword_100025A70);
  __chkstk_darwin(v2);
  v4 = (char *)&v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___notesCell;
  v6 = *(_QWORD *)(v1
                 + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___notesCell);
  if (v6)
  {
    v7 = *(_QWORD *)(v1
                   + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___notesCell);
  }
  else
  {
    ReminderNotesCellContentState = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ReminderNotesCellContentState - 8) + 56))(v4, 1, 1, ReminderNotesCellContentState);
    v9 = objc_allocWithZone((Class)type metadata accessor for TTRIExtensionCreateReminderNotesCellContent(0));
    v10 = sub_1000029F8(0xD00000000000001CLL, 0x800000010001CF30, (uint64_t)v4);
    v11 = sub_100005DBC(&qword_1000260C0);
    swift_allocObject(v11, 73, 7);
    v7 = TTRITableCell.init(_:)(v10);
    v12 = *(_QWORD *)(v1 + v5);
    *(_QWORD *)(v1 + v5) = v7;
    swift_retain(v7);
    swift_release(v12);
    v6 = 0;
  }
  swift_retain(v6);
  return v7;
}

uint64_t sub_100018F80()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___detailsCell;
  v2 = *(_QWORD *)(v0
                 + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___detailsCell);
  if (v2)
  {
    v3 = *(_QWORD *)(v0
                   + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController____lazy_storage___detailsCell);
  }
  else
  {
    v3 = sub_100018FE4(v0);
    v4 = *(_QWORD *)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v3;
    swift_retain(v3);
    swift_release(v4);
    v2 = 0;
  }
  swift_retain(v2);
  return v3;
}

uint64_t sub_100018FE4(uint64_t a1)
{
  Swift::String v2;
  Swift::String v3;
  Swift::String v4;
  Swift::String v5;
  Swift::String v6;
  Swift::String v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[24];
  _QWORD v17[27];
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  char v23;

  v2._object = (void *)0x800000010001CEA0;
  v3._countAndFlagsBits = 0x736C6961746544;
  v3._object = (void *)0xE700000000000000;
  v2._countAndFlagsBits = 0xD00000000000001ELL;
  v4 = TTRLocalizedString(_:comment:)(v3, v2);
  v18 = 0;
  v19 = 0u;
  v20 = 0x1FFFFFFFELL;
  v21 = 0u;
  v22 = 0u;
  v23 = 0;
  v5._countAndFlagsBits = 0xD000000000000028;
  v5._object = (void *)0x800000010001CEC0;
  v6._countAndFlagsBits = 0x7265646E696D6552;
  v6._object = (void *)0xE900000000000073;
  v7 = TTRLocalizedString(_:comment:)(v6, v5);
  TTRIDetailCellState.init(icon:title:titleTextColor:subtitle:detailText:detailTextColor:shortenedDetailText:checkmarkState:accessibilityLabel:accessibilityValue:accessibilityHint:accessibilityDifferentiateWithoutColorsIcon:)(v17, &v18, v4._countAndFlagsBits, v4._object, 0, 0, v7._countAndFlagsBits, v7._object, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,
    0);
  v8 = objc_allocWithZone((Class)type metadata accessor for TTRIDetailDisclosureCellContent(0));
  v9 = (_QWORD *)TTRIDetailDisclosureCellContent.init(state:)(v17);
  v10 = swift_allocObject(&unk_100021578, 24, 7);
  swift_unknownObjectWeakInit(v10 + 16, a1);
  v11 = (_QWORD *)((char *)v9 + *(_QWORD *)((swift_isaMask & *v9) + 0x108));
  swift_beginAccess(v11, v16, 1, 0);
  v12 = *v11;
  v13 = v11[1];
  *v11 = (uint64_t)sub_100019EB0;
  v11[1] = v10;
  sub_100010558(v12, v13);
  v14 = sub_100005DBC(&qword_1000260A8);
  swift_allocObject(v14, 73, 7);
  return TTRITableCell.init(_:)(v9);
}

void sub_10001919C(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  uint64_t (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _BYTE v14[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v14, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (char *)Strong;
    UIViewController.endFirstResponderEditing()();
    objc_msgSend(v3, "resignFirstResponder");
    v4 = *(_QWORD *)&v3[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_presenter];
    v5 = *(_QWORD *)(v4
                   + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor
                   + 8);
    ObjectType = swift_getObjectType(*(_QWORD *)(v4
                                               + OBJC_IVAR____TtC25RemindersSharingExtension36TTRIExtensionCreateReminderPresenter_interactor));
    v7 = *(uint64_t (**)(uint64_t, uint64_t))(v5 + 16);
    swift_retain(v4);
    v8 = v7(ObjectType, v5);
    v9 = swift_allocObject(&unk_1000215A0, 48, 7);
    *(_QWORD *)(v9 + 16) = v4;
    *(_BYTE *)(v9 + 24) = 1;
    *(_QWORD *)(v9 + 32) = 0;
    *(_QWORD *)(v9 + 40) = 0;
    v10 = swift_allocObject(&unk_1000215C8, 32, 7);
    *(_QWORD *)(v10 + 16) = sub_100019EEC;
    *(_QWORD *)(v10 + 24) = v9;
    v11 = swift_retain(v4);
    v12 = (void *)zalgo.getter(v11);
    v13 = dispatch thunk of Promise.then<A>(on:closure:)(v12, sub_100019F20, v10, (char *)&type metadata for () + 8);

    swift_release(v4);
    swift_release(v13);
    swift_release(v8);
    swift_release(v10);

  }
}

_QWORD *sub_1000192F4(uint64_t a1)
{
  uint64_t v2;
  _QWORD *result;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  uint64_t v15;

  if ((unint64_t)a1 >> 62)
  {
    if (a1 < 0)
      v15 = a1;
    else
      v15 = a1 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain(a1);
    v2 = _CocoaArrayWrapper.endIndex.getter(v15);
    swift_bridgeObjectRelease(a1);
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v2)
    return _swiftEmptyArrayStorage;
  result = (_QWORD *)sub_10001A088(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      v4 = 0;
      do
      {
        v5 = specialized _ArrayBuffer._getElementSlowPath(_:)(v4, a1);
        v7 = _swiftEmptyArrayStorage[2];
        v6 = _swiftEmptyArrayStorage[3];
        if (v7 >= v6 >> 1)
          sub_10001A088(v6 > 1, v7 + 1, 1);
        ++v4;
        _swiftEmptyArrayStorage[2] = v7 + 1;
        v8 = (char *)&_swiftEmptyArrayStorage[2 * v7];
        *((_QWORD *)v8 + 4) = v5;
        *((_QWORD *)v8 + 5) = &protocol witness table for TTRITableSection;
      }
      while (v2 != v4);
    }
    else
    {
      v9 = (_QWORD *)(a1 + 32);
      v10 = _swiftEmptyArrayStorage[2];
      v11 = 2 * v10;
      do
      {
        v12 = *v9;
        v13 = _swiftEmptyArrayStorage[3];
        swift_retain(*v9);
        if (v10 >= v13 >> 1)
          sub_10001A088(v13 > 1, v10 + 1, 1);
        _swiftEmptyArrayStorage[2] = v10 + 1;
        v14 = (char *)&_swiftEmptyArrayStorage[v11];
        *((_QWORD *)v14 + 4) = v12;
        *((_QWORD *)v14 + 5) = &protocol witness table for TTRITableSection;
        v11 += 2;
        ++v9;
        ++v10;
        --v2;
      }
      while (v2);
    }
    return _swiftEmptyArrayStorage;
  }
  __break(1u);
  return result;
}

uint64_t sub_100019494(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t ReminderView;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  id v22;
  int *ReminderViewModel;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t ReminderNotesCellContent;
  void (*v29)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  id v35;
  char v36;
  id v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  void *v41;
  char v42;
  uint64_t v43;
  int *ReminderNotesCellContentState;
  id v45;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;

  v4 = sub_100005DBC(&qword_100025A70);
  __chkstk_darwin(v4);
  v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100005DBC(&qword_100025DB0);
  __chkstk_darwin(v7);
  v9 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  ReminderView = type metadata accessor for TTRIExtensionCreateReminderViewModel.Link(0);
  v49 = *(_QWORD *)(ReminderView - 8);
  v50 = ReminderView;
  __chkstk_darwin(ReminderView);
  v48 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100005DBC(&qword_100025918);
  __chkstk_darwin(v12);
  v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for TTRRemindersListViewModel.Item(0);
  __chkstk_darwin(v15);
  v17 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100005DBC(&qword_1000260B8);
  __chkstk_darwin(v18);
  v20 = (char *)&v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v52 = a1;
  v21 = sub_100018CFC();
  v22 = *(id *)(v21 + 32);
  swift_release(v21);
  sub_100010BA8(a2, (uint64_t)v17);
  ReminderViewModel = (int *)type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
  v24 = *(void **)(a2 + ReminderViewModel[6]);
  v51 = ReminderViewModel[9];
  v25 = *(_QWORD *)(a2 + v51);
  TTRIReminderTitleCellContentState.init(item:attributedTitle:hashtagVisibility:)(v17, v24, v25);
  v26 = type metadata accessor for TTRIReminderTitleCellContentState(0);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v20, 0, 1, v26);
  swift_bridgeObjectRetain(v25);
  v27 = v24;
  TTRITableCellContent.state.setter(v20);

  ReminderNotesCellContent = type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState.Attachment(0);
  v29 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(ReminderNotesCellContent - 8) + 56);
  v29(v14, 1, 1, ReminderNotesCellContent);
  v30 = a2 + ReminderViewModel[11];
  v31 = *(unsigned __int8 *)(v30 + 8);
  if (v31 == 255)
  {
    v32 = (uint64_t)v48;
    sub_10000BAD0(a2 + ReminderViewModel[10], (uint64_t)v9, &qword_100025DB0);
    v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v49 + 48))(v9, 1, v50);
    v34 = v51;
    if (v33 == 1)
    {
      sub_10000BA94((uint64_t)v9, &qword_100025DB0);
    }
    else
    {
      sub_10000BA94((uint64_t)v14, &qword_100025918);
      sub_10000B584((uint64_t)v9, v32, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
      sub_10000B584(v32, (uint64_t)v14, type metadata accessor for TTRIExtensionCreateReminderViewModel.Link);
      swift_storeEnumTagMultiPayload(v14, ReminderNotesCellContent, 1);
      v29(v14, 0, 1, ReminderNotesCellContent);
    }
  }
  else
  {
    v35 = *(id *)v30;
    v36 = v31 & 1;
    v37 = *(id *)v30;
    sub_10000BA94((uint64_t)v14, &qword_100025918);
    *(_QWORD *)v14 = v35;
    v14[8] = v36;
    swift_storeEnumTagMultiPayload(v14, ReminderNotesCellContent, 0);
    v29(v14, 0, 1, ReminderNotesCellContent);
    v34 = v51;
  }
  v38 = sub_100018E64();
  v39 = *(id *)(v38 + 32);
  swift_release(v38);
  sub_100010BA8(a2, (uint64_t)v6);
  v40 = ReminderViewModel[8];
  v41 = *(void **)(a2 + ReminderViewModel[7]);
  v42 = *(_BYTE *)(a2 + v40);
  v43 = *(_QWORD *)(a2 + v34);
  ReminderNotesCellContentState = (int *)type metadata accessor for TTRIExtensionCreateReminderNotesCellContentState(0);
  sub_10000BAD0((uint64_t)v14, (uint64_t)&v6[ReminderNotesCellContentState[8]], &qword_100025918);
  *(_QWORD *)&v6[ReminderNotesCellContentState[5]] = v41;
  v6[ReminderNotesCellContentState[6]] = v42;
  *(_QWORD *)&v6[ReminderNotesCellContentState[7]] = v43;
  (*(void (**)(char *, _QWORD, uint64_t, int *))(*((_QWORD *)ReminderNotesCellContentState - 1) + 56))(v6, 0, 1, ReminderNotesCellContentState);
  swift_bridgeObjectRetain(v43);
  v45 = v41;
  TTRITableCellContent.state.setter(v6);

  return sub_10000BA94((uint64_t)v14, &qword_100025918);
}

void sub_1000198C4(uint64_t a1)
{
  void *Strong;
  id v2;

  Strong = (void *)swift_unknownObjectWeakLoadStrong(a1+ OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableView);
  if (Strong)
  {
    v2 = Strong;
    objc_msgSend(Strong, "performBatchUpdates:completion:", 0, 0);

  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderViewController()
{
  return objc_opt_self(_TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController);
}

void sub_100019A08(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _BYTE v11[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v11, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    v4 = sub_100018CFC();

    v5 = *(id *)(v4 + 32);
    swift_release(v4);
    TTRIReminderTitleCellContent.beginEditing()();

  }
  swift_beginAccess(v1, &v10, 0, 0);
  v6 = swift_unknownObjectWeakLoadStrong(v1);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = sub_100018CFC();

    v9 = *(id *)(v8 + 32);
    swift_release(v8);
    TTRIReminderTitleCellContent.selectAllText()();

  }
}

uint64_t sub_100019ACC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void (*v4)(uint64_t);
  uint64_t v5;

  v4 = *(void (**)(uint64_t))(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  swift_retain(v3);
  v5 = swift_unknownObjectRetain(a2);
  v4(v5);
  swift_release(v3);
  return swift_unknownObjectRelease(a2);
}

uint64_t sub_100019B14(uint64_t a1, uint64_t a2, double a3)
{
  uint64_t v3;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  id v11;
  Swift::String v12;
  Swift::String v13;
  Swift::String v14;
  uint64_t v15;
  _QWORD v17[27];
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  char v23;

  if (!*(_QWORD *)(v3
                  + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableDataController))
  {
    if (qword_1000255A0 != -1)
      swift_once(&qword_1000255A0, sub_100017914, a3);
    v6 = type metadata accessor for Logger(0);
    sub_10000CF9C(v6, (uint64_t)qword_100025FE8);
    v7 = Logger.logObject.getter();
    v8 = static os_log_type_t.fault.getter();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc(2, -1);
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "buildSections hasn't been called when update(listName:)", v9, 2u);
      swift_slowDealloc(v9, -1, -1);
    }

  }
  v10 = sub_100018F80();
  v11 = *(id *)(v10 + 32);
  swift_release(v10);
  v18 = 0u;
  v19 = 0;
  v20 = 0x1FFFFFFFELL;
  v21 = 0u;
  v22 = 0u;
  v23 = 0;
  v12._object = (void *)0x800000010001CEA0;
  v13._countAndFlagsBits = 0x736C6961746544;
  v13._object = (void *)0xE700000000000000;
  v12._countAndFlagsBits = 0xD00000000000001ELL;
  v14 = TTRLocalizedString(_:comment:)(v13, v12);
  swift_bridgeObjectRetain(a2);
  TTRIDetailCellState.init(icon:title:titleTextColor:subtitle:detailText:detailTextColor:shortenedDetailText:checkmarkState:accessibilityLabel:accessibilityValue:accessibilityHint:accessibilityDifferentiateWithoutColorsIcon:)(v17, &v18, v14._countAndFlagsBits, v14._object, 0, 0, a1, a2, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0,
    0);
  TTRITableCellContent.state.setter(v17);

  v15 = sub_100018F80();
  TTRITableCell.updateAssignedCellIfNeeded(force:)(0);
  return swift_release(v15);
}

uint64_t sub_100019D00()
{
  uint64_t v0;
  uint64_t result;

  result = swift_unknownObjectWeakLoadStrong(v0 + OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_tableView);
  if (!result)
    __break(1u);
  return result;
}

uint64_t sub_100019D28(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v2);
  return TTRKeyboardAvoidance<>.shouldAvoidKeyboard.getter(ObjectType, a2);
}

uint64_t sub_100019D50(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v2);
  return TTRKeyboardAvoidance<>.startAvoidingKeyboard()(ObjectType, a2);
}

uint64_t sub_100019D78(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v2);
  return TTRKeyboardAvoidance<>.stopAvoidingKeyboard()(ObjectType, a2);
}

uint64_t sub_100019DA0(double a1, double a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t ObjectType;

  ObjectType = swift_getObjectType(v4);
  return TTRKeyboardAvoidance<>.setKeyboardAvoidanceBottomInset(_:duration:)(ObjectType, a4, a1, a2);
}

uint64_t sub_100019DE0()
{
  return 1;
}

void sub_100019DEC()
{
  Swift::String v0;

  v0._object = (void *)0x800000010001C6E0;
  v0._countAndFlagsBits = 0xD000000000000011;
  TTRDeferredAction.scheduleNextRunLoop(reason:)(v0);
}

void sub_100019E38()
{
  _BYTE *v0;
  id v1;

  v0[OBJC_IVAR____TtC25RemindersSharingExtension41TTRIExtensionCreateReminderViewController_needToUpdateCellSizesOnLayout] = 1;
  v1 = objc_msgSend(v0, "viewIfLoaded");
  objc_msgSend(v1, "setNeedsLayout");

}

uint64_t sub_100019E8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_unknownObjectWeakDestroy(v2 + 16, a2);
  return swift_deallocObject(v2, 24, 7);
}

void sub_100019EB0()
{
  uint64_t v0;

  sub_10001919C(v0);
}

uint64_t sub_100019EB8()
{
  _QWORD *v0;

  swift_release(v0[2]);
  if (v0[4])
    swift_release(v0[5]);
  return swift_deallocObject(v0, 48, 7);
}

void sub_100019EEC(void *a1, uint64_t a2)
{
  uint64_t v2;

  sub_10000EA34(a1, a2, *(_QWORD *)(v2 + 16), *(unsigned __int8 *)(v2 + 24), *(void (**)(id))(v2 + 32), *(_QWORD *)(v2 + 40));
}

uint64_t sub_100019EFC()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100019F20(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v1 + 16))(*a1, a1[1]);
}

uint64_t sub_100019F50()
{
  uint64_t v0;

  return sub_100019494(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_100019F58()
{
  uint64_t v0;

  sub_100019A08(v0);
}

uint64_t sub_100019F60(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100019F70(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100019F78()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

void sub_100019F9C()
{
  uint64_t v0;

  sub_1000198C4(*(_QWORD *)(v0 + 16));
}

uint64_t sub_100019FA4()
{
  uint64_t v0;

  return swift_deallocObject(v0, 32, 7);
}

unint64_t sub_100019FB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_100026100;
  if (!qword_100026100)
  {
    v1 = sub_10000B938(255, &qword_1000260F0, NSRunLoop_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSRunLoop, v1);
    atomic_store(result, (unint64_t *)&qword_100026100);
  }
  return result;
}

uint64_t sub_10001A00C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = sub_10000B9BC(a2);
    result = swift_getWitnessTable(a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10001A04C(uint64_t a1)
{
  uint64_t ReminderViewModel;

  ReminderViewModel = type metadata accessor for TTRIExtensionCreateReminderViewModel(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(ReminderViewModel - 8) + 8))(a1, ReminderViewModel);
  return a1;
}

uint64_t sub_10001A088(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_10001A0A4(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_10001A0A4(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v18;
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
    v10 = sub_100005DBC(&qword_100026118);
    v11 = (_QWORD *)swift_allocObject(v10, 16 * v9 + 32, 7);
    v12 = j__malloc_size(v11);
    v13 = v12 - 32;
    if (v12 < 32)
      v13 = v12 - 17;
    v11[2] = v8;
    v11[3] = 2 * (v13 >> 4);
  }
  else
  {
    v11 = &_swiftEmptyArrayStorage;
  }
  v14 = (unint64_t)(v11 + 4);
  v15 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v11 != a4 || v14 >= v15 + 16 * v8)
      memmove(v11 + 4, a4 + 4, 16 * v8);
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v15 >= v14 + 16 * v8 || v14 >= v15 + 16 * v8)
  {
    v18 = sub_100005DBC(&qword_100026120);
    swift_arrayInitWithCopy(v11 + 4, a4 + 4, v8, v18);
LABEL_30:
    swift_release(a4);
    return (uint64_t)v11;
  }
LABEL_32:
  result = _fatalErrorMessage(_:_:file:line:flags:)("Fatal error", 11, 2, "UnsafeMutablePointer.initialize overlapping range", 49, 2, "Swift/UnsafePointer.swift", 25, 2, 1092, 0);
  __break(1u);
  return result;
}

__int128 *initializeBufferWithCopyOfBuffer for TTRIExtensionCreateReminderViewController.Argument(__int128 *a1, __int128 *a2)
{
  __int128 v3;

  v3 = *a2;
  *a1 = *a2;
  swift_unknownObjectRetain(v3);
  return a1;
}

uint64_t destroy for TTRIExtensionCreateReminderViewController.Argument(_QWORD *a1)
{
  return swift_unknownObjectRelease(*a1);
}

uint64_t *assignWithCopy for TTRIExtensionCreateReminderViewController.Argument(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *a1;
  *a1 = *a2;
  swift_unknownObjectRetain(v3);
  swift_unknownObjectRelease(v5);
  a1[1] = v4;
  return a1;
}

__n128 initializeWithTake for TTRIExtensionCreateReminderViewController.Argument(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_QWORD *assignWithTake for TTRIExtensionCreateReminderViewController.Argument(_QWORD *a1, _OWORD *a2)
{
  swift_unknownObjectRelease(*a1);
  *(_OWORD *)a1 = *a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for TTRIExtensionCreateReminderViewController.Argument(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for TTRIExtensionCreateReminderViewController.Argument(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for TTRIExtensionCreateReminderViewController.Argument()
{
  return &type metadata for TTRIExtensionCreateReminderViewController.Argument;
}

_OWORD *sub_10001A38C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD v19[2];
  uint64_t v20;
  _QWORD v21[5];
  _OWORD v22[2];

  v14 = type metadata accessor for TTRReminderTitleAttributesNoOpInteractor(0);
  swift_allocObject(v14, 24, 7);
  v21[3] = v14;
  v21[4] = &protocol witness table for TTRReminderTitleAttributesNoOpInteractor;
  v20 = 0;
  v21[0] = TTRReminderTitleAttributesNoOpInteractor.init()();
  memset(v19, 0, sizeof(v19));
  v15 = ((uint64_t (*)(_OWORD *, uint64_t, _QWORD *, _QWORD, _QWORD, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, char, _QWORD, uint64_t, uint64_t))static TTRIReminderCellTitleAssembly.createViewController(item:titleAttributesInteractor:quickBar:augmentationSplitter:ownerModule:hostViewController:inCellPresenterManager:isSingleReminderEditingMode:returnKeyType:moduleDelegate:))(v22, a1, v21, 0, 0, v19, 3, a6, a2, a3, 1, 0, a4, a5);
  v17 = v16;
  sub_10001A5B0((uint64_t)v19);
  sub_10000CEF0(v21);
  *(_QWORD *)a7 = v15;
  *(_QWORD *)(a7 + 8) = v17;
  return sub_1000107B4(v22, (_OWORD *)(a7 + 16));
}

uint64_t sub_10001A480@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t result;
  uint64_t v9;

  result = static TTRIReminderCellNotesAssembly.createViewController(item:isSingleReminderEditingMode:quickBar:ownerModule:hostViewController:inCellPresenterManager:moduleDelegate:)(a7 + 2, a1, 1, 0, 0, 3, a6, a2, a3, a4, a5);
  *a7 = result;
  a7[1] = v9;
  return result;
}

id TTRIExtensionCreateReminderAssembly.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), "init");
}

id TTRIExtensionCreateReminderAssembly.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRIExtensionCreateReminderAssembly();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for TTRIExtensionCreateReminderAssembly()
{
  return objc_opt_self(_TtC25RemindersSharingExtension35TTRIExtensionCreateReminderAssembly);
}

id TTRIExtensionCreateReminderAssembly.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for TTRIExtensionCreateReminderAssembly();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_10001A5B0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_100005DBC(&qword_100026150);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10001A5F0()
{
  uint64_t v0;

  return swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC25RemindersSharingExtensionP33_31D0579BABE86FFE76A3EF432630A4AC19ResourceBundleClass);
}
