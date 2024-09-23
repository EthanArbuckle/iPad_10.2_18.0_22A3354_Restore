void sub_100003610(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;

  v2 = OBJC_IVAR____TtC18QuickLookExtension21PreviewViewController____lazy_storage___hostingView;
  v3 = *(void **)(v1 + OBJC_IVAR____TtC18QuickLookExtension21PreviewViewController____lazy_storage___hostingView);
  if (!v3)
  {
    v4 = v1;
    v10 = AnyView.init<A>(_:)(a1, &type metadata for EmptyView, &protocol witness table for EmptyView);
    v5 = objc_allocWithZone((Class)sub_100004D08(&qword_10000C648));
    v6 = (void *)UIHostingController.init(rootView:)(&v10);
    v7 = *(void **)(v1 + v2);
    *(_QWORD *)(v4 + v2) = v6;
    v8 = v6;

    v3 = 0;
  }
  v9 = v3;
  sub_100006084();
}

void sub_10000369C()
{
  void *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  objc_super v26;

  v26.receiver = v0;
  v26.super_class = (Class)type metadata accessor for PreviewViewController();
  v5 = objc_msgSendSuper2(&v26, "loadView");
  sub_100003610((uint64_t)v5);
  v7 = v6;
  objc_msgSend(v0, "addChildViewController:", v6);

  sub_100003610(v8);
  v10 = v9;
  v11 = sub_1000061EC(v9);

  if (!v11)
  {
    __break(1u);
    goto LABEL_8;
  }
  v12 = sub_1000061F4();
  if (!v12)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v13 = v12;
  objc_msgSend(v12, "bounds");
  sub_1000061D8();

  objc_msgSend(v11, "setFrame:", v1, v2, v3, v4);
  sub_100003610(v14);
  v16 = v15;
  v17 = sub_1000061EC(v15);

  if (!v17)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  objc_msgSend(v17, "setAutoresizingMask:", 18);

  v18 = sub_1000061F4();
  if (!v18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v19 = v18;
  sub_100003610((uint64_t)v18);
  v21 = v20;
  v22 = sub_1000061EC(v20);

  if (v22)
  {
    objc_msgSend(v19, "addSubview:", v22);

    sub_100003610(v23);
    v25 = v24;
    objc_msgSend(v24, "didMoveToParentViewController:", v0);

    return;
  }
LABEL_11:
  __break(1u);
}

void sub_100003870(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v8;
  id v9;
  NSURL *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  _QWORD aBlock[5];
  _QWORD *v17;

  v5 = v3;
  type metadata accessor for URL(0);
  __chkstk_darwin();
  sub_10000606C();
  sub_100006170(v4, *(uint64_t (**)(uint64_t, uint64_t))(v8 + 16));
  v9 = objc_allocWithZone((Class)WFShortcutExtractor);
  v11 = sub_1000049EC(v4, 1, 0, 0, v10);
  v12 = (_QWORD *)swift_allocObject(&unk_100008610, 40, 7);
  v12[2] = v5;
  v12[3] = a2;
  v12[4] = a3;
  aBlock[4] = sub_100004B04;
  v17 = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000039A0;
  aBlock[3] = &unk_100008628;
  v13 = _Block_copy(aBlock);
  v14 = v17;
  v15 = v5;
  swift_retain(a3);
  swift_release(v14);
  objc_msgSend(v11, "extractShortcutWithCompletion:", v13);
  _Block_release(v13);

  sub_100006120();
}

void sub_1000039A0(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void (*v6)(void *, void *);
  id v7;
  id v8;

  v6 = *(void (**)(void *, void *))(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  swift_retain(v5);
  v8 = a2;
  v7 = a3;
  v6(a2, a3);
  swift_release(v5);

}

void sub_100003AD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = _convertErrorToNSError(_:)();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

void sub_100003B20(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  NSString v6;
  objc_super v7;

  *(_QWORD *)&v3[OBJC_IVAR____TtC18QuickLookExtension21PreviewViewController____lazy_storage___hostingView] = 0;
  if (a2)
  {
    v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v6 = 0;
  }
  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for PreviewViewController();
  objc_msgSendSuper2(&v7, "initWithNibName:bundle:", v6, a3);

  sub_100006084();
}

id sub_100003BF0(void *a1)
{
  char *v1;
  id v3;
  objc_super v5;

  *(_QWORD *)&v1[OBJC_IVAR____TtC18QuickLookExtension21PreviewViewController____lazy_storage___hostingView] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for PreviewViewController();
  v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_100003C68()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PreviewViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for PreviewViewController()
{
  return objc_opt_self(_TtC18QuickLookExtension21PreviewViewController);
}

id sub_100003CC8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v4;
  NSString v5;
  id v6;

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v2));
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a2);
  v6 = objc_msgSend(v4, "initWithBundleIdentifier:", v5);

  return v6;
}

void sub_100003D38(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;

  *(_QWORD *)a3 = static HorizontalAlignment.center.getter(a1);
  *(_QWORD *)(a3 + 8) = 0;
  *(_BYTE *)(a3 + 16) = 0;
  v6 = sub_100004D08(&qword_10000C700);
  sub_100003D90(a1, a2, a3 + *(int *)(v6 + 44));
}

void sub_100003D90(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
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
  char *v23;
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
  char *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t, char *, uint64_t);
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(char *, uint64_t);
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  id v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v60 = a2;
  v66 = a3;
  v8 = type metadata accessor for WorkflowEditorView(0);
  v58 = *(_QWORD *)(v8 - 8);
  sub_100006060();
  __chkstk_darwin(v9);
  sub_100006110();
  v12 = v11 - v10;
  v59 = sub_100004D08(&qword_10000C708);
  sub_100006060();
  __chkstk_darwin(v13);
  sub_100006094();
  v61 = v14;
  __chkstk_darwin(v15);
  v63 = (uint64_t)&v55 - v16;
  v17 = sub_100006178();
  v18 = type metadata accessor for Divider(v17);
  v64 = *(_QWORD *)(v18 - 8);
  v65 = v18;
  sub_100006060();
  __chkstk_darwin(v19);
  sub_1000060A8(v20, (uint64_t)v55);
  __chkstk_darwin(v21);
  v23 = (char *)&v55 - v22;
  sub_100004D08(&qword_10000C710);
  sub_100006060();
  __chkstk_darwin(v24);
  sub_100006110();
  v27 = v26 - v25;
  v28 = sub_100004D08(&qword_10000C718);
  sub_100006060();
  __chkstk_darwin(v29);
  sub_100006094();
  v31 = v30;
  v33 = __chkstk_darwin(v32);
  v35 = (char *)&v55 - v34;
  *(_QWORD *)v27 = static HorizontalAlignment.center.getter(v33);
  *(_QWORD *)(v27 + 8) = 0;
  *(_BYTE *)(v27 + 16) = 1;
  v36 = sub_100004D08(&qword_10000C720);
  sub_10000415C(a1, v27 + *(int *)(v36 + 44));
  v37 = static Edge.Set.all.getter();
  EdgeInsets.init(_all:)(10.0);
  sub_1000061D8();
  sub_100005D34(v27, v31, &qword_10000C710);
  v38 = v31 + *(int *)(v28 + 36);
  *(_BYTE *)v38 = v37;
  *(_QWORD *)(v38 + 8) = v3;
  *(_QWORD *)(v38 + 16) = v4;
  *(_QWORD *)(v38 + 24) = v5;
  *(_QWORD *)(v38 + 32) = v6;
  *(_BYTE *)(v38 + 40) = 0;
  sub_100005D64(v27, &qword_10000C710);
  v57 = v35;
  sub_100005D04(v31, (uint64_t)v35, &qword_10000C718);
  v39 = v23;
  v55 = v23;
  Divider.init()();
  v40 = a1;
  WorkflowEditorView.init(workflow:options:)(v40, v60);
  v41 = objc_msgSend((id)objc_opt_self(UIColor), "wf_systemGroupedBackgroundColor");
  v42 = Color.init(uiColor:)(v41);
  LOBYTE(v28) = static Edge.Set.all.getter();
  v43 = v58;
  v44 = v61;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v58 + 16))(v61, v12, v8);
  v45 = v44 + *(int *)(v59 + 36);
  *(_QWORD *)v45 = v42;
  *(_BYTE *)(v45 + 8) = v28;
  (*(void (**)(uint64_t, uint64_t))(v43 + 8))(v12, v8);
  v46 = v63;
  sub_100005D04(v44, v63, &qword_10000C708);
  v56 = v31;
  sub_100005D34((uint64_t)v35, v31, &qword_10000C718);
  v48 = v64;
  v47 = v65;
  v49 = *(void (**)(uint64_t, char *, uint64_t))(v64 + 16);
  v50 = v62;
  v49((uint64_t)v62, v39, v65);
  v51 = v46;
  sub_100005D34(v46, v44, &qword_10000C708);
  v52 = v66;
  sub_100005D34(v31, v66, &qword_10000C718);
  v53 = sub_100004D08(&qword_10000C728);
  v49(v52 + *(int *)(v53 + 48), v50, v47);
  sub_100005D34(v44, v52 + *(int *)(v53 + 64), &qword_10000C708);
  sub_100005D64(v51, &qword_10000C708);
  v54 = *(void (**)(char *, uint64_t))(v48 + 8);
  v54(v55, v47);
  sub_100005D64((uint64_t)v57, &qword_10000C718);
  sub_100005D64(v44, &qword_10000C708);
  v54(v50, v47);
  sub_100005D64(v56, &qword_10000C718);
}

void sub_10000415C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
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
  unint64_t v63;

  v61 = a2;
  sub_100004D08(&qword_10000C730);
  sub_100006060();
  __chkstk_darwin(v3);
  sub_100006094();
  v60 = v4;
  v6 = __chkstk_darwin(v5);
  v8 = (uint64_t *)((char *)&v56 - v7);
  *v8 = static Alignment.center.getter(v6);
  v8[1] = v9;
  v10 = sub_100004D08(&qword_10000C738);
  sub_10000440C(a1, (uint64_t)v8 + *(int *)(v10 + 44));
  v11 = sub_100005C5C(a1, (SEL *)&selRef_name);
  if (v12)
    v13 = v11;
  else
    v13 = 0;
  v14 = 0xE000000000000000;
  if (v12)
    v14 = v12;
  v62 = v13;
  v63 = v14;
  sub_100005B68();
  v15 = sub_100006150();
  v17 = v16;
  v19 = v18;
  v21 = v20 & 1;
  v22 = static Font.title.getter();
  v23 = Text.font(_:)(v22, v15, v17, v21, v19);
  v58 = v24;
  v59 = v23;
  v57 = v25;
  v27 = v26;
  swift_release(v22);
  HIDWORD(v56) = v27 & 1;
  sub_100005BA4(v15, v17, v21);
  swift_bridgeObjectRelease(v19);
  v28 = objc_msgSend(a1, "workflowSubtitle");
  v29 = static String._unconditionallyBridgeFromObjectiveC(_:)(v28);
  v31 = v30;

  v62 = v29;
  v63 = v31;
  v32 = sub_100006150();
  v34 = v33;
  v36 = v35;
  v38 = v37 & 1;
  v39 = static Font.title3.getter();
  v40 = Text.font(_:)(v39, v32, v34, v38, v36);
  v42 = v41;
  LOBYTE(v22) = v43;
  v45 = v44;
  swift_release(v39);
  LOBYTE(v39) = v22 & 1;
  sub_100005BA4(v32, v34, v38);
  swift_bridgeObjectRelease(v36);
  v46 = v60;
  sub_100006140((uint64_t)v8, v60);
  LOBYTE(v38) = BYTE4(v56);
  LOBYTE(v62) = BYTE4(v56);
  v47 = v61;
  sub_100006140(v46, v61);
  v48 = sub_100004D08(&qword_10000C740);
  v49 = v47 + *(int *)(v48 + 48);
  v50 = v59;
  v51 = v57;
  *(_QWORD *)v49 = v59;
  *(_QWORD *)(v49 + 8) = v51;
  *(_BYTE *)(v49 + 16) = v38;
  v52 = v38;
  v53 = v58;
  *(_QWORD *)(v49 + 24) = v58;
  v54 = v47 + *(int *)(v48 + 64);
  *(_QWORD *)v54 = v40;
  *(_QWORD *)(v54 + 8) = v42;
  *(_BYTE *)(v54 + 16) = v39;
  *(_QWORD *)(v54 + 24) = v45;
  v55 = v50;
  sub_100005CB8(v50, v51, v52);
  swift_bridgeObjectRetain(v53);
  sub_100005CB8(v40, v42, v39);
  swift_bridgeObjectRetain(v45);
  sub_100006108((uint64_t)v8);
  sub_100005BA4(v40, v42, v39);
  swift_bridgeObjectRelease(v45);
  sub_100005BA4(v55, v51, v62);
  swift_bridgeObjectRelease(v53);
  sub_100006108(v46);
  sub_1000060C8();
}

void sub_10000440C(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  __int128 v42;
  uint64_t v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  _QWORD *v53;
  id v54;
  _QWORD *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  void (*v59)(uint64_t, char *, uint64_t);
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void (*v63)(char *, uint64_t);
  uint64_t v64;
  _QWORD *v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD *v68;
  char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  _OWORD v76[3];

  v75 = a2;
  v4 = type metadata accessor for IconView.DisplayMode(0);
  v70 = *(_QWORD *)(v4 - 8);
  v71 = v4;
  sub_100006060();
  ((void (*)(void))__chkstk_darwin)();
  sub_100006184();
  v65 = v5;
  v6 = sub_100006178();
  v7 = type metadata accessor for IconSize(v6);
  v66 = *(_QWORD *)(v7 - 8);
  v67 = v7;
  sub_100006060();
  ((void (*)(void))__chkstk_darwin)();
  sub_100006184();
  v68 = v8;
  v9 = sub_100006178();
  v74 = type metadata accessor for IconView(v9);
  v72 = *(_QWORD *)(v74 - 8);
  sub_100006060();
  ((void (*)(void))__chkstk_darwin)();
  sub_1000060A8(v10, v64);
  ((void (*)(void))__chkstk_darwin)();
  v69 = (char *)&v64 - v11;
  v12 = sub_100006178();
  v13 = type metadata accessor for RoundedRectangle(v12);
  sub_100006060();
  ((void (*)(void))__chkstk_darwin)();
  sub_100006110();
  v16 = (_OWORD *)(v15 - v14);
  v17 = sub_100004D08(&qword_10000C748);
  v18 = *(_QWORD *)(v17 - 8);
  ((void (*)(void))__chkstk_darwin)();
  sub_10000606C();
  v64 = sub_100004D08(&qword_10000C750);
  sub_100006060();
  v19 = ((uint64_t (*)(void))__chkstk_darwin)();
  v21 = (char *)&v64 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  v23 = (char *)&v64 - v22;
  v24 = (char *)v16 + *(int *)(v13 + 20);
  v25 = enum case for RoundedCornerStyle.continuous(_:);
  v26 = type metadata accessor for RoundedCornerStyle(0);
  v27 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 104))(v24, v25, v26);
  __asm { FMOV            V0.2D, #16.0 }
  *v16 = _Q0;
  v33 = sub_1000061D0(v27, "icon");
  v34 = objc_msgSend(v33, "backgroundColor");

  v35 = objc_msgSend(v34, "paletteGradient");
  v36 = (uint64_t)v23;
  sub_1000057A4(&qword_10000C758, (uint64_t (*)(uint64_t))&type metadata accessor for RoundedRectangle);
  Shape.fill(_:)(v35, v13, v37);

  v38 = sub_100005CC8((uint64_t)v16);
  v39 = static Alignment.center.getter(v38);
  _FrameLayout.init(width:height:alignment:)(v76, 0x4050000000000000, 0, 0x4050000000000000, 0, v39, v40);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, v2, v17);
  v41 = &v21[*(int *)(v64 + 36)];
  v42 = v76[1];
  *(_OWORD *)v41 = v76[0];
  *((_OWORD *)v41 + 1) = v42;
  *((_OWORD *)v41 + 2) = v76[2];
  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v2, v17);
  sub_100005D04((uint64_t)v21, (uint64_t)v23, &qword_10000C750);
  v44 = sub_1000061D0(v43, "reference");
  if (v44)
  {
    v45 = v44;
    v46 = objc_msgSend(v44, "attributionIcon");

  }
  else
  {
    v47 = sub_100005C5C(a1, (SEL *)&selRef_associatedAppBundleIdentifier);
    if (v48)
    {
      v49 = v47;
      v50 = v48;
      sub_100005D9C();
      v46 = sub_100003CC8(v49, v50);
    }
    else
    {
      v51 = sub_1000061D0(v47, "icon");
      v46 = objc_msgSend(v51, "icon");

    }
  }
  v52 = v67;
  v53 = v68;
  *v68 = 0x4046000000000000;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v66 + 104))(v53, enum case for IconSize.customHeight(_:), v52);
  v54 = objc_msgSend((id)objc_opt_self(WFColor), "whiteColor");
  v55 = v65;
  *v65 = v54;
  *((_BYTE *)v55 + 8) = 0;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v70 + 104))(v55, enum case for IconView.DisplayMode.customColor(_:), v71);
  v56 = v69;
  IconView.init(_:size:displayMode:animated:)(v46, v53, v55, 1);
  sub_100006140((uint64_t)v23, (uint64_t)v21);
  v58 = v72;
  v57 = v73;
  v59 = *(void (**)(uint64_t, char *, uint64_t))(v72 + 16);
  v60 = v74;
  v59((uint64_t)v73, v56, v74);
  v61 = v75;
  sub_100006140((uint64_t)v21, v75);
  v62 = sub_100004D08(&qword_10000C760);
  v59(v61 + *(int *)(v62 + 48), v57, v60);
  v63 = *(void (**)(char *, uint64_t))(v58 + 8);
  v63(v56, v60);
  sub_100006108(v36);
  v63(v57, v60);
  sub_100006108((uint64_t)v21);
  sub_1000060C8();
}

uint64_t sub_100004894()
{
  return static View._viewListCount(inputs:)();
}

void sub_1000048AC(uint64_t a1@<X8>)
{
  void **v1;

  sub_100003D38(*v1, v1[1], a1);
}

double sub_1000048B4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t KeyPath;
  uint64_t v21;
  char v22;
  double result;
  _QWORD v24[2];
  _QWORD v25[3];
  _BYTE v26[8];

  swift_getErrorValue(a1, v26, v25);
  v24[0] = Error.localizedDescription.getter(v25[1], v25[2]);
  v24[1] = v3;
  v4 = sub_100005B68();
  v5 = Text.init<A>(_:)(v24, &type metadata for String, v4);
  v7 = v6;
  v9 = v8;
  v11 = v10 & 1;
  v12 = static Color.secondary.getter();
  v13 = Text.foregroundColor(_:)(v12, v5, v7, v11, v9);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  swift_release(v12);
  sub_100005BA4(v5, v7, v11);
  swift_bridgeObjectRelease(v9);
  KeyPath = swift_getKeyPath(&unk_100006D08);
  v21 = swift_getKeyPath(&unk_100006D38);
  v22 = static Edge.Set.all.getter();
  *(_QWORD *)a2 = v13;
  *(_QWORD *)(a2 + 8) = v15;
  *(_BYTE *)(a2 + 16) = v17 & 1;
  *(_QWORD *)(a2 + 24) = v19;
  *(_QWORD *)(a2 + 32) = KeyPath;
  *(_BYTE *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 48) = v21;
  *(_QWORD *)(a2 + 56) = 0;
  *(_BYTE *)(a2 + 64) = 1;
  *(_WORD *)(a2 + 65) = 256;
  *(_BYTE *)(a2 + 72) = v22;
  result = 0.0;
  *(_OWORD *)(a2 + 80) = 0u;
  *(_OWORD *)(a2 + 96) = 0u;
  *(_BYTE *)(a2 + 112) = 1;
  return result;
}

double sub_1000049E4@<D0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1000048B4(*v1, a1);
}

id sub_1000049EC@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X3>, uint64_t a4@<X5>, NSURL *a5@<X8>)
{
  void *v5;
  void *v6;
  void *v11;
  void *v12;
  NSString v13;
  NSString v14;
  id v15;
  uint64_t v16;

  v6 = v5;
  URL._bridgeToObjectiveC()(a5);
  v12 = v11;
  if (!a3)
  {
    v13 = 0;
    if (a4)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a3);
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v14 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(a4);
LABEL_6:
  v15 = objc_msgSend(v6, "initWithURL:allowsOldFormatFile:suggestedName:sourceApplication:", v12, a2 & 1, v13, v14);

  v16 = type metadata accessor for URL(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(a1, v16);
  return v15;
}

uint64_t sub_100004AD8()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 32));
  return swift_deallocObject(v0, 40, 7);
}

void sub_100004B04(void *a1, uint64_t a2)
{
  id v2;
  id v3;
  id v4;
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
  void *v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  unint64_t v39;
  id v40;
  id v41;
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
  id v53;

  if (a1)
  {
    v2 = a1;
    v3 = objc_msgSend(v2, "record");
    v4 = objc_allocWithZone((Class)WFWorkflow);
    v34 = sub_100004DAC(v3, 0, 0);
    type metadata accessor for WorkflowEditorOptions(0);
    v35 = (void *)static WorkflowEditorOptions.default.getter();
    v36 = dispatch thunk of WorkflowEditorOptions.isReadOnly.setter(1);
    sub_100003610(v36);
    v38 = v37;
    v50 = (uint64_t)v34;
    v51 = (uint64_t)v35;
    v39 = sub_100004E94();
    v40 = v34;
    v41 = v35;
    v42 = AnyView.init<A>(_:)(&v50, &type metadata for PreviewView, v39);
    sub_1000061B0(v42, v43, v44, v45, v46, v47, v48, v49, v50);

    sub_100006148();
  }
  else if (a2)
  {
    v50 = a2;
    sub_100006100();
    sub_100006100();
    sub_100004D08(&qword_10000C630);
    type metadata accessor for WFWorkflowError(0);
    if ((sub_1000060E0(v6, v7, v8, v9, v10, v11, v12, v13, v50, v51, v52, (char)v53) & 1) != 0
      || (sub_100006100(),
          type metadata accessor for WFShortcutSharingError(0),
          sub_1000060E0(v14, v15, v16, v17, v18, v19, v20, v21, a2, v51, v52, (char)v53)))
    {

      sub_100003610(v22);
      v24 = v23;
      v50 = a2;
      sub_100006100();
      v25 = sub_100004D70();
      v26 = AnyView.init<A>(_:)(&v50, &type metadata for ErrorView, v25);
      sub_1000061B0(v26, v27, v28, v29, v30, v31, v32, v33, v50);

      sub_100006148();
      sub_1000061C8();
    }
    else
    {
      sub_1000061C8();
      sub_100006148();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_100004CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain(v2);
}

uint64_t sub_100004D00(uint64_t a1)
{
  return swift_release(*(_QWORD *)(a1 + 40));
}

uint64_t sub_100004D08(uint64_t *a1)
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

void type metadata accessor for WFWorkflowError(uint64_t a1)
{
  sub_100005A88(a1, &qword_10000C658, (uint64_t)&unk_1000087B0);
}

void type metadata accessor for WFShortcutSharingError(uint64_t a1)
{
  sub_100005A88(a1, &qword_10000C650, (uint64_t)&unk_100008788);
}

unint64_t sub_100004D70()
{
  unint64_t result;

  result = qword_10000C638;
  if (!qword_10000C638)
  {
    result = swift_getWitnessTable(&unk_100006CB4, &type metadata for ErrorView);
    atomic_store(result, (unint64_t *)&qword_10000C638);
  }
  return result;
}

id sub_100004DAC(void *a1, void *a2, uint64_t a3)
{
  void *v3;
  void *v4;
  id v8;
  id v9;
  id v10;
  id v11;
  id v13;

  v4 = v3;
  v13 = 0;
  v8 = objc_msgSend(v4, "initWithRecord:reference:storageProvider:error:", a1, a2, a3, &v13);
  v9 = v13;
  if (v8)
  {
    v10 = v13;
  }
  else
  {
    v11 = v13;
    _convertNSErrorToError(_:)(v9);

    swift_willThrow();
  }

  swift_unknownObjectRelease(a3);
  return v8;
}

unint64_t sub_100004E94()
{
  unint64_t result;

  result = qword_10000C640;
  if (!qword_10000C640)
  {
    result = swift_getWitnessTable(&unk_100006C64, &type metadata for PreviewView);
    atomic_store(result, (unint64_t *)&qword_10000C640);
  }
  return result;
}

uint64_t sub_100004ED0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject(v0, 24, 7);
}

void sub_100004EF4(uint64_t a1)
{
  uint64_t v1;

  sub_100003AD4(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_100004EFC@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

id sub_100004F04()
{
  id *v0;

  return *v0;
}

BOOL sub_100004F0C(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t sub_100004F1C()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(WFShortcutSharingErrorDomain);
}

uint64_t sub_100004F2C(uint64_t a1)
{
  uint64_t v2;

  sub_1000057A4(&qword_10000C6F0, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_100004F6C(uint64_t a1)
{
  uint64_t v2;

  sub_1000057A4(&qword_10000C6F0, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100004FAC(void *a1, uint64_t a2)
{
  uint64_t v4;

  sub_1000057A4(&qword_10000C6F0, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_100005010(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = NSObject.hashValue.getter();

  return v2;
}

uint64_t sub_100005040(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1000057A4(&qword_10000C6F0, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

uint64_t sub_100005098()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)(WFWorkflowErrorDomain);
}

uint64_t sub_1000050A8(uint64_t a1)
{
  uint64_t v2;

  sub_1000057A4(&qword_10000C6A8, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
  return _BridgedStoredNSError.errorCode.getter(a1, v2);
}

uint64_t sub_1000050E8(uint64_t a1)
{
  uint64_t v2;

  sub_1000057A4(&qword_10000C6A8, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
  return _BridgedStoredNSError.errorUserInfo.getter(a1, v2);
}

uint64_t sub_100005128(void *a1, uint64_t a2)
{
  uint64_t v4;

  sub_1000057A4(&qword_10000C6A8, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
  return _BridgedStoredNSError.init(_bridgedNSError:)(a1, a2, v4);
}

uint64_t sub_10000518C()
{
  void **v0;

  return sub_100005010(*v0);
}

uint64_t sub_100005194(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1000057A4(&qword_10000C6A8, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
  return _BridgedStoredNSError.hash(into:)(a1, a2, v4);
}

Swift::Int sub_1000051E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD v7[10];

  v7[9] = *v3;
  Hasher.init(_seed:)(v7);
  dispatch thunk of Hashable.hash(into:)(v7, a2, a3);
  return Hasher._finalize()();
}

void sub_100005240(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_100005270();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

uint64_t sub_100005278@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t result;

  result = nullsub_1(*v1);
  *a1 = result;
  return result;
}

void initializeBufferWithCopyOfBuffer for PreviewView(_QWORD *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)a2;
  v3 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v3;
  v4 = v2;
  v5 = v3;
  sub_100006058();
}

void destroy for PreviewView(id *a1)
{

}

void assignWithCopy for PreviewView(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(void **)(a2 + 8);
  v8 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v7;
  v9 = v7;

  sub_1000061A4();
}

__n128 initializeWithTake for PreviewView(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

void assignWithTake for PreviewView(uint64_t a1, _OWORD *a2)
{
  void *v4;

  v4 = *(void **)(a1 + 8);
  *(_OWORD *)a1 = *a2;

  sub_100006058();
}

uint64_t getEnumTagSinglePayload for PreviewView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

_QWORD *storeEnumTagSinglePayload for PreviewView(_QWORD *result, int a2, int a3)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
    if (a3 < 0)
      *((_BYTE *)result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
      return sub_1000061BC(result, a2);
    }
    *((_BYTE *)result + 16) = 0;
    if (a2)
      return sub_1000061BC(result, a2);
  }
  return result;
}

ValueMetadata *type metadata accessor for PreviewView()
{
  return &type metadata for PreviewView;
}

void initializeBufferWithCopyOfBuffer for ErrorView(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  uint64_t v3;

  sub_100006130(a1, a2);
  *v2 = v3;
  sub_100006058();
}

uint64_t destroy for ErrorView(_QWORD *a1)
{
  return swift_errorRelease(*a1);
}

void assignWithCopy for ErrorView(uint64_t a1, _QWORD *a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;

  sub_100006130(a1, a2);
  v4 = *v2;
  *v2 = v3;
  swift_errorRelease(v4);
  sub_100006058();
}

_QWORD *initializeWithTake for ErrorView(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

void assignWithTake for ErrorView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a1;
  *a1 = *a2;
  swift_errorRelease(v3);
  sub_100006058();
}

uint64_t getEnumTagSinglePayload for ErrorView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 8))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

_QWORD *storeEnumTagSinglePayload for ErrorView(_QWORD *result, int a2, int a3)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    if (a3 < 0)
      *((_BYTE *)result + 8) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
      return sub_1000061BC(result, a2);
    }
    *((_BYTE *)result + 8) = 0;
    if (a2)
      return sub_1000061BC(result, a2);
  }
  return result;
}

ValueMetadata *type metadata accessor for ErrorView()
{
  return &type metadata for ErrorView;
}

uint64_t sub_100005518(uint64_t a1)
{
  uint64_t v2;

  sub_1000057A4(&qword_10000C6C0, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100005558(uint64_t a1)
{
  uint64_t v2;

  sub_1000057A4(&qword_10000C6C0, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_10000559C(uint64_t a1)
{
  uint64_t v2;

  sub_1000057A4(&qword_10000C6F0, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_1000055DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_1000057A4(&qword_10000C6F0, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

uint64_t sub_100005634(uint64_t a1)
{
  uint64_t v2;

  sub_1000057A4(&qword_10000C670, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
  return Error<>._domain.getter(a1, v2);
}

uint64_t sub_100005674(uint64_t a1)
{
  uint64_t v2;

  sub_1000057A4(&qword_10000C670, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
  return Error<>._code.getter(a1, v2);
}

uint64_t sub_1000056B4(uint64_t a1)
{
  uint64_t v2;

  sub_1000057A4(&qword_10000C6A8, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
  return _BridgedStoredNSError._getEmbeddedNSError()(a1, v2);
}

uint64_t sub_1000056F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  sub_1000057A4(&qword_10000C6A8, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
  return static _BridgedStoredNSError.== infix(_:_:)(a1, a2, a3, v6);
}

void sub_10000574C()
{
  sub_1000057A4(&qword_10000C660, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
}

void sub_100005778()
{
  sub_1000057A4(&qword_10000C668, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
}

void sub_1000057A4(unint64_t *a1, uint64_t (*a2)(uint64_t))
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = a2(255);
    atomic_store(sub_100006198(v3), a1);
  }
  sub_100006058();
}

void sub_1000057D8()
{
  sub_1000057A4(&qword_10000C670, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
}

void sub_100005804()
{
  sub_1000057A4(&qword_10000C678, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
}

void sub_100005830()
{
  sub_1000057A4(&qword_10000C680, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
}

void sub_10000585C()
{
  sub_1000057A4(&qword_10000C688, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
  sub_100005A88(a1, &qword_10000C778, (uint64_t)&unk_1000087F8);
}

void sub_10000589C()
{
  sub_1000057A4(&qword_10000C690, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0);
}

unint64_t sub_1000058CC()
{
  unint64_t result;

  result = qword_10000C698;
  if (!qword_10000C698)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for Int, &type metadata for Int);
    atomic_store(result, (unint64_t *)&qword_10000C698);
  }
  return result;
}

void sub_100005908()
{
  sub_1000057A4(&qword_10000C6A0, (uint64_t (*)(uint64_t))_s3__C4CodeOMa_0);
}

void sub_100005934()
{
  sub_1000057A4(&qword_10000C6A8, (uint64_t (*)(uint64_t))type metadata accessor for WFWorkflowError);
}

BOOL sub_100005960(uint64_t *a1, uint64_t *a2)
{
  return sub_100004F0C(*a1, *a2);
}

void sub_10000596C()
{
  sub_1000057A4(&qword_10000C6B0, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
}

void sub_100005998()
{
  sub_1000057A4(&qword_10000C6B8, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
}

void sub_1000059C4()
{
  sub_1000057A4(&qword_10000C6C0, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
}

void sub_1000059F0()
{
  sub_1000057A4(&qword_10000C6C8, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
}

void sub_100005A1C()
{
  sub_1000057A4(&qword_10000C6D0, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
}

void sub_100005A48()
{
  sub_1000057A4(&qword_10000C6D8, (uint64_t (*)(uint64_t))type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
  sub_100005A88(a1, &qword_10000C770, (uint64_t)&unk_1000087D8);
}

void sub_100005A88(uint64_t a1, unint64_t *a2, uint64_t a3)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v5;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata(0, a3);
    if (!v5)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

void sub_100005ACC()
{
  sub_1000057A4(&qword_10000C6E0, (uint64_t (*)(uint64_t))type metadata accessor for Code);
}

void sub_100005AF8()
{
  sub_1000057A4(&qword_10000C6E8, (uint64_t (*)(uint64_t))type metadata accessor for Code);
}

void sub_100005B24()
{
  sub_1000057A4(&qword_10000C6F0, (uint64_t (*)(uint64_t))type metadata accessor for WFShortcutSharingError);
}

uint64_t sub_100005B50(uint64_t a1)
{
  return sub_1000060F8(a1, (uint64_t)&unk_1000073C0);
}

uint64_t sub_100005B5C(uint64_t a1)
{
  return sub_1000060F8(a1, (uint64_t)&unk_100007398);
}

unint64_t sub_100005B68()
{
  unint64_t result;

  result = qword_10000C6F8;
  if (!qword_10000C6F8)
  {
    result = swift_getWitnessTable(&protocol conformance descriptor for String, &type metadata for String);
    atomic_store(result, (unint64_t *)&qword_10000C6F8);
  }
  return result;
}

uint64_t sub_100005BA4(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release(a1);
  else
    return swift_bridgeObjectRelease(a2);
}

uint64_t sub_100005BB4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100005BDC(unsigned __int8 *a1)
{
  return EnvironmentValues.multilineTextAlignment.setter(*a1);
}

uint64_t sub_100005C00@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = EnvironmentValues.lineLimit.getter();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100005C30(uint64_t a1)
{
  return EnvironmentValues.lineLimit.setter(*(_QWORD *)a1, *(unsigned __int8 *)(a1 + 8));
}

uint64_t sub_100005C5C(void *a1, SEL *a2)
{
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, *a2);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(v2);

  return v4;
}

uint64_t sub_100005CB8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain(a1);
  else
    return swift_bridgeObjectRetain(a2);
}

uint64_t sub_100005CC8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for RoundedRectangle(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_100005D04(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  v4 = sub_100006160(a1, a2, a3);
  sub_100006170(v3, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32));
  sub_100006058();
}

void sub_100005D34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;

  v4 = sub_100006160(a1, a2, a3);
  sub_100006170(v3, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16));
  sub_100006058();
}

void sub_100005D64(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_100004D08(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  sub_100006058();
}

unint64_t sub_100005D9C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C768;
  if (!qword_10000C768)
  {
    v1 = objc_opt_self(WFAppIcon);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_10000C768);
  }
  return result;
}

void sub_100005DD8()
{
  sub_100005E74(&qword_10000C780, &qword_10000C788, sub_100005E50);
}

uint64_t sub_100005E0C(uint64_t *a1)
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

void sub_100005E50()
{
  sub_100005E74(&qword_10000C790, &qword_10000C798, (void (*)(void))sub_100005ED0);
}

void sub_100005E74(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = sub_100005E0C(a2);
    a3();
    atomic_store(swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v5), a1);
  }
  sub_100006084();
}

unint64_t sub_100005ED0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C7A0;
  if (!qword_10000C7A0)
  {
    v1 = sub_100005E0C(&qword_10000C7A8);
    sub_100005F54();
    sub_100006004(&qword_10000C7D0, &qword_10000C7D8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C7A0);
  }
  return result;
}

unint64_t sub_100005F54()
{
  unint64_t result;
  uint64_t v1;

  result = qword_10000C7B0;
  if (!qword_10000C7B0)
  {
    v1 = sub_100005E0C(&qword_10000C7B8);
    sub_100006004(&qword_10000C7C0, &qword_10000C7C8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_10000C7B0);
  }
  return result;
}

void sub_100005FD8()
{
  sub_100006004(&qword_10000C7E0, &qword_10000C7E8);
}

void sub_100006004(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = sub_100005E0C(a2);
    atomic_store(sub_100006198(v3), a1);
  }
  sub_100006058();
}

void sub_1000060A8(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 152) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_1000060E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, char a12)
{
  uint64_t v12;

  return swift_dynamicCast(&a12, &a9, v12, a1, 6);
}

uint64_t sub_1000060F8(uint64_t a1, uint64_t a2)
{
  return swift_getOpaqueTypeConformance2(a1, a2, 1);
}

uint64_t sub_100006100()
{
  uint64_t v0;

  return swift_errorRetain(v0);
}

void sub_100006108(uint64_t a1)
{
  uint64_t *v1;

  sub_100005D64(a1, v1);
}

uint64_t sub_100006130(uint64_t a1, _QWORD *a2)
{
  return swift_errorRetain(*a2);
}

void sub_100006140(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  sub_100005D34(a1, a2, v2);
}

uint64_t sub_100006148()
{
  uint64_t (*v0)(void);

  return v0();
}

uint64_t sub_100006150()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return Text.init<A>(_:)(v2 - 96, v1, v0);
}

uint64_t sub_100006160(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  return sub_100004D08(a3);
}

uint64_t sub_100006170@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t sub_100006178()
{
  return 0;
}

uint64_t sub_100006198(uint64_t a1)
{
  uint64_t v1;

  return swift_getWitnessTable(v1, a1);
}

uint64_t sub_1000061B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  a9 = a1;
  return dispatch thunk of UIHostingController.rootView.setter(&a9);
}

_QWORD *sub_1000061BC(_QWORD *result, int a2)
{
  *result = (a2 - 1);
  return result;
}

uint64_t sub_1000061C8()
{
  uint64_t v0;

  return swift_errorRelease(v0);
}

id sub_1000061D0(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_1000061EC(void *a1)
{
  uint64_t v1;

  return objc_msgSend(a1, *(SEL *)(v1 + 1080));
}

id sub_1000061F4()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, *(SEL *)(v1 + 1080));
}
