void sub_10007B10C()
{
  void *v0;
  void *v1;
  objc_class *v2;
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
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  objc_super v41;

  v1 = v0;
  v2 = (objc_class *)sub_100049F68();
  v3 = sub_100012E2C(&qword_1000D1100);
  sub_100018034();
  v5 = __chkstk_darwin(v4);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v41 - v8;
  v10 = type metadata accessor for SidebarView(0);
  sub_100018034();
  __chkstk_darwin(v11);
  sub_100019D7C();
  v14 = (_QWORD *)(v13 - v12);
  v41.receiver = v1;
  v41.super_class = v2;
  objc_msgSendSuper2(&v41, "viewDidLoad");
  sub_1000037EC();
  v15 = sub_10007D104();
  v16 = sub_100003974(&qword_1000D28C0, type metadata accessor for SidebarView.DataSource, (uint64_t)&unk_100099F38);
  *v14 = ObservedObject.init(wrappedValue:)(v1, v15, v16);
  v14[1] = v17;
  v18 = (_QWORD *)((char *)v14 + *(int *)(v10 + 20));
  v19 = sub_100026B08();
  sub_100015D74((uint64_t)v9, 1, 1, v19);
  sub_1000064AC((uint64_t)v9, (uint64_t)v7);
  State.init(wrappedValue:)(v18, v7, v3);
  sub_10000D778((uint64_t)v9, &qword_1000D1100);
  v20 = objc_allocWithZone((Class)sub_100012E2C(&qword_1000D39E0));
  v21 = (void *)UIHostingController.init(rootView:)(v14);
  objc_msgSend(v1, "addChildViewController:", v21);
  v22 = sub_10007D074();
  if (!v22)
  {
    __break(1u);
    goto LABEL_8;
  }
  v23 = v22;
  objc_msgSend(v22, "setAutoresizingMask:", 18);

  v24 = sub_10007D074();
  if (!v24)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v25 = v24;
  v26 = sub_10007D118();
  if (!v26)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  v27 = v26;
  objc_msgSend(v26, "frame");
  v29 = v28;
  v31 = v30;
  v33 = v32;
  v35 = v34;

  objc_msgSend(v25, "setFrame:", v29, v31, v33, v35);
  v36 = sub_10007D118();
  if (!v36)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  v37 = v36;
  v38 = sub_10007D074();
  if (v38)
  {
    v39 = v38;
    objc_msgSend(v37, "addSubview:", v38);

    objc_msgSend(v21, "didMoveToParentViewController:", v1);
    sub_10007B420();
    sub_10007B470();
    sub_10007B590();
    v40 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
    objc_msgSend(v40, "addObserver:selector:name:object:", v1, "keyboardWillChange:", WFKeyboardWillChangeNotification, 0);

    return;
  }
LABEL_11:
  __break(1u);
}

void sub_10007B420()
{
  void *v0;
  char *v1;
  char *v2;

  v1 = sub_10007A8B8();
  if (v1)
  {
    v2 = v1;
    sub_100009428(v0);

  }
}

void sub_10007B470()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  NSArray v5;
  id v6;
  Class isa;

  v1 = sub_10007C114();
  v3 = v2;
  v4 = objc_msgSend(v0, "navigationItem");
  if (v1)
  {
    sub_100003B2C(0, (unint64_t *)&unk_1000D30E0, UIBarButtonItem_ptr);
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v1);
  }
  else
  {
    v5.super.isa = 0;
  }
  objc_msgSend(v4, "setLeftBarButtonItems:", v5.super.isa);

  v6 = objc_msgSend(v0, "navigationItem");
  if (v3)
  {
    sub_100003B2C(0, (unint64_t *)&unk_1000D30E0, UIBarButtonItem_ptr);
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    isa = 0;
  }
  objc_msgSend(v6, "setRightBarButtonItems:", isa);

}

uint64_t sub_10007B590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WFSidebarViewController_sections);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(v0 + OBJC_IVAR___WFSidebarViewController_sections));
    v3 = v1 + 40;
    do
    {
      v4 = *(_QWORD *)(v3 - 8);
      swift_unknownObjectRetain(v4);
      sub_10007BCC0();
      swift_unknownObjectRelease(v4);
      v3 += 16;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  return sub_10007BCF0();
}

id sub_10007B650()
{
  void *v0;
  objc_class *v1;
  id v2;
  objc_super v4;

  v1 = (objc_class *)sub_100049F68();
  v2 = objc_msgSend((id)objc_opt_self(NSNotificationCenter), "defaultCenter");
  objc_msgSend(v2, "removeObserver:", v0);

  v4.receiver = v0;
  v4.super_class = v1;
  return objc_msgSendSuper2(&v4, "dealloc");
}

uint64_t sub_10007B7A4()
{
  return type metadata accessor for SidebarViewController(0);
}

void sub_10007B7AC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)sub_100049F68();
  sub_100079D34((uint64_t)v7.super_class, "viewWillAppear:", v1, v2, v3, v4, v5, v6, v7);
  sub_10007B7E4(1);
  sub_1000270C4();
}

id sub_10007B7E4(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  char **v10;

  v2 = v1;
  v4 = *(_QWORD *)(v1 + OBJC_IVAR___WFSidebarViewController_sections);
  v5 = *(_QWORD *)(v4 + 16);
  if (v5)
  {
    swift_bridgeObjectRetain(*(_QWORD *)(v1 + OBJC_IVAR___WFSidebarViewController_sections));
    v6 = (uint64_t *)(v4 + 40);
    do
    {
      v7 = *(v6 - 1);
      v8 = *v6;
      ObjectType = swift_getObjectType(v7);
      swift_unknownObjectRetain(v7);
      dispatch thunk of SidebarSection.observeChanges.setter(a1 & 1, ObjectType, v8);
      swift_unknownObjectRelease(v7);
      v6 += 2;
      --v5;
    }
    while (v5);
    swift_bridgeObjectRelease(v4);
  }
  v10 = &selRef_addObjectObserver_;
  if ((a1 & 1) == 0)
    v10 = &selRef_removeObjectObserver_;
  return objc_msgSend(*(id *)(v2 + OBJC_IVAR___WFSidebarViewController_database), *v10, v2);
}

void sub_10007B8EC()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)sub_100049F68();
  sub_100079D34((uint64_t)v7.super_class, "viewDidAppear:", v1, v2, v3, v4, v5, v6, v7);
  sub_10007B924();
  sub_1000270C4();
}

double sub_10007B924()
{
  char *v0;
  char *v1;
  double Height;
  uint64_t v3;
  double result;
  CGRect v5;

  v0 = sub_10007A8B8();
  if (v0)
  {
    v1 = v0;
    objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC9Shortcuts29FloatingToolbarViewController_toolbar], "frame");
    Height = CGRectGetHeight(v5);

  }
  else
  {
    Height = 0.0;
  }
  v3 = sub_1000037EC();
  sub_100051CCC(Height);
  *(_QWORD *)&result = swift_release(v3).n128_u64[0];
  return result;
}

void sub_10007B9D0(uint64_t a1)
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)sub_100049F68();
  objc_msgSendSuper2(&v3, "didMoveToParentViewController:", a1);
  if (!a1)
    sub_10007B7E4(0);
  sub_1000270C4();
}

void sub_10007BA6C(void *a1)
{
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  _OWORD v17[2];
  _BYTE v18[24];
  uint64_t v19;
  CGRect v20;

  v2 = objc_msgSend(a1, "object");
  if (v2)
  {
    v3 = v2;
    _bridgeAnyObjectToAny(_:)(v17, v2);
    swift_unknownObjectRelease(v3);
  }
  else
  {
    memset(v17, 0, sizeof(v17));
  }
  sub_10002DD54((uint64_t)v17, (uint64_t)v18);
  if (v19)
  {
    v4 = sub_100003B2C(0, &qword_1000D13A0, WFKeyboard_ptr);
    if ((swift_dynamicCast(&v16, v18, (char *)&type metadata for Any + 8, v4, 6) & 1) != 0)
    {
      v5 = v16;
      v6 = objc_msgSend(v1, "view");
      if (v6)
      {
        v7 = v6;
        objc_msgSend(v5, "keyboardFrameInView:", v6);
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;

        if (objc_msgSend(v5, "isVisible"))
        {
          v20.origin.x = v9;
          v20.origin.y = v11;
          v20.size.width = v13;
          v20.size.height = v15;
          CGRectGetHeight(v20);
        }
        sub_10007B924();

      }
      else
      {
        __break(1u);
      }
    }
  }
  else
  {
    sub_10000D778((uint64_t)v18, (uint64_t *)&unk_1000D3650);
  }
}

void sub_10007BC18()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _BYTE v6[24];

  sub_10007BCC0();
  sub_1000037EC();
  v1 = sub_10007D104();
  v2 = sub_100003974(&qword_1000D28C0, type metadata accessor for SidebarView.DataSource, (uint64_t)&unk_100099F38);
  v3 = ObservableObject<>.objectWillChange.getter(v1, v2);
  sub_100019D9C();
  ObservableObjectPublisher.send()();
  swift_release(v3);
  sub_10007BCF0();
  sub_100026D70(v0 + OBJC_IVAR___WFSidebarViewController_rootView, (uint64_t)v6);
  v4 = sub_10007D0F0();
  if (v4)
  {
    v5 = (void *)v4;
    sub_10001D668();

  }
  sub_10004280C();
}

void sub_10007BCC0()
{
  if ((sub_10007BEF8() & 1) != 0)
    sub_10007B470();
  else
    sub_10007BF98(0, (uint64_t)sub_10007CEAC);
}

uint64_t sub_10007BCF0()
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
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  uint64_t result;
  uint64_t v14;
  uint64_t Strong;
  void *v16;
  uint64_t v17;
  _BYTE v18[24];
  _BYTE v19[24];

  v1 = sub_100012E2C(&qword_1000D1100);
  __chkstk_darwin(v1);
  v3 = &v18[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = type metadata accessor for RootNavigationDestination(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = type metadata accessor for SidebarStyle(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v12 = v0 + OBJC_IVAR___WFSidebarViewController_style;
  (*(void (**)(_BYTE *, _QWORD, uint64_t))(v9 + 104))(v11, enum case for SidebarStyle.column(_:), v8);
  LOBYTE(v12) = static SidebarStyle.== infix(_:_:)(v12, v11);
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
  if ((v12 & 1) != 0)
  {
    v14 = v0 + OBJC_IVAR___WFSidebarViewController_rootView;
    swift_beginAccess(v0 + OBJC_IVAR___WFSidebarViewController_rootView, v19, 0, 0);
    Strong = swift_unknownObjectWeakLoadStrong(v14);
    if (Strong)
    {
      v16 = (void *)Strong;
      v17 = Strong + OBJC_IVAR___WFMainViewController_currentDestination;
      swift_beginAccess(Strong + OBJC_IVAR___WFMainViewController_currentDestination, v18, 0, 0);
      sub_1000064AC(v17, (uint64_t)v3);

      if (sub_100019D44((uint64_t)v3, 1, v4) != 1)
      {
        (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v7, v3, v4);
        sub_100008B0C();
        return (*(uint64_t (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
      }
    }
    else
    {
      sub_100015D74((uint64_t)v3, 1, 1, v4);
    }
    return sub_10000D778((uint64_t)v3, &qword_1000D1100);
  }
  return result;
}

uint64_t sub_10007BEF8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___WFSidebarViewController_sections);
  v2 = *(_QWORD *)(v1 + 16);
  if (v2)
  {
    swift_bridgeObjectRetain(v1);
    v3 = v2 - 1;
    v4 = v1 + 40;
    do
    {
      v5 = v3;
      v6 = *(_QWORD *)(v4 - 8);
      swift_getObjectType(v6);
      swift_unknownObjectRetain(v6);
      LOBYTE(v2) = sub_10007A648();
      swift_unknownObjectRelease(v6);
      if ((v2 & 1) != 0)
        break;
      v3 = v5 - 1;
      v4 += 16;
    }
    while (v5);
    swift_bridgeObjectRelease(v1);
  }
  return v2 & 1;
}

void sub_10007BF98(char a1, uint64_t a2)
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v6 = v2;
  v4 = static Animation.default.getter(objc_msgSend(v2, "setEditing:animated:", a1 & 1, 1));
  withAnimation<A>(_:_:)(v4, a2, &v5, (char *)&type metadata for () + 8);
  swift_release(v4);
  sub_10007B470();
  sub_10004280C();
}

double sub_10007C044(uint64_t a1, unsigned int *a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double result;

  v4 = type metadata accessor for EditMode(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  sub_1000181C8();
  v6 = sub_1000037EC();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v5 + 104))(v2, *a2, v4);
  sub_100051A2C(v2);
  *(_QWORD *)&result = swift_release(v6).n128_u64[0];
  return result;
}

uint64_t sub_10007C114()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unsigned int v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v46;
  uint64_t v47;

  v1 = v0;
  v2 = type metadata accessor for SidebarStyle(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v1, "isEditing");
  v7 = &v1[OBJC_IVAR___WFSidebarViewController_style];
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for SidebarStyle.compact(_:), v2);
  v8 = static SidebarStyle.== infix(_:_:)(v7, v5);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if (v6)
  {
    v9 = sub_100012E2C((uint64_t *)&unk_1000D3690);
    v10 = swift_allocObject(v9, 40, 7);
    v46 = xmmword_100096F90;
    *(_OWORD *)(v10 + 16) = xmmword_100096F90;
    v11 = sub_10007AA4C();
    v13 = v12;
    v15 = v14;

    *(_QWORD *)(v10 + 32) = v15;
    if ((v8 & 1) != 0)
    {
      v47 = v10;
      specialized Array._endMutation()(v16, v17);
      v18 = v47;
      v19 = swift_allocObject(v9, 40, 7);
      v20 = v19;
      v21 = v46;
LABEL_13:
      *(_OWORD *)(v19 + 16) = v21;
      v38 = sub_10007AA4C();
      v40 = v39;
      v42 = v41;

      *(_QWORD *)(v20 + 32) = v40;
      v47 = v20;
      specialized Array._endMutation()(v43, v44);
      return v18;
    }
    v47 = v10;
  }
  else
  {
    v22 = sub_10007BEF8();
    if ((v8 & 1) != 0)
    {
      if ((v22 & 1) != 0)
      {
        v23 = sub_100012E2C((uint64_t *)&unk_1000D3690);
        v24 = swift_allocObject(v23, 40, 7);
        *(_OWORD *)(v24 + 16) = xmmword_100096F90;
        v25 = sub_10007AA4C();
        v27 = v26;

        *(_QWORD *)(v24 + 32) = v25;
        v47 = v24;
        specialized Array._endMutation()(v29, v30);
        v18 = v47;
      }
      else
      {
        v18 = 0;
      }
      v37 = sub_100012E2C((uint64_t *)&unk_1000D3690);
      v19 = swift_allocObject(v37, 40, 7);
      v20 = v19;
      v21 = xmmword_100096F90;
      goto LABEL_13;
    }
    if ((v22 & 1) == 0)
      return 0;
    v31 = sub_100012E2C((uint64_t *)&unk_1000D3690);
    v32 = swift_allocObject(v31, 40, 7);
    *(_OWORD *)(v32 + 16) = xmmword_100096F90;
    v33 = sub_10007AA4C();
    v35 = v34;

    *(_QWORD *)(v32 + 32) = v33;
    v47 = v32;
  }
  specialized Array._endMutation()(v16, v17);
  return 0;
}

void sub_10007C390()
{
  uint64_t v0;

  swift_getObjectType(v0);
  sub_100003974(&qword_1000D1040, type metadata accessor for SidebarViewController, (uint64_t)&unk_10009AC50);
  RootViewSidebar.createNewFolder()();
}

void sub_10007C40C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  _BYTE v4[24];

  v1 = v0 + OBJC_IVAR___WFSidebarViewController_rootView;
  swift_beginAccess(v0 + OBJC_IVAR___WFSidebarViewController_rootView, v4, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    sub_10001F6D0(0);

  }
}

void sub_10007C4BC()
{
  _swift_stdlib_reportUnimplementedInitializer("Shortcuts.SidebarViewController", 31, "init(nibName:bundle:)", 21, 0);
  __break(1u);
}

void (*sub_10007C514(_QWORD *a1))(id **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___WFSidebarViewController_rootView;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess(v1 + v4, v3, 33, 0);
  v3[3] = swift_unknownObjectWeakLoadStrong(v5);
  return sub_10007C584;
}

void sub_10007C584(id **a1, char a2)
{
  id *v3;
  id v4;

  v3 = *a1;
  v4 = (*a1)[3];
  swift_unknownObjectWeakAssign((char *)(*a1)[5] + (_QWORD)(*a1)[4], v4);
  if ((a2 & 1) != 0)
  {

    swift_endAccess(v3);
  }
  else
  {
    swift_endAccess(v3);

  }
  free(v3);
}

void sub_10007C5F4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  char v15;
  char v16;
  __n128 v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[7];

  sub_100018190();
  v3 = v0;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = type metadata accessor for DispatchWorkItemFlags(0);
  v26 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  sub_10001827C();
  v25 = type metadata accessor for DispatchQoS(0);
  v11 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  sub_1000181C8();
  sub_10007A000(v9);
  v13 = v12;
  sub_10007A2E0(v9);
  v15 = v14;
  sub_10007A2E0(v7);
  LOBYTE(v7) = v16;
  sub_10007A2E0(v5);
  if ((v7 & 1) != 0 || (v15 & 1) != 0 || (v13 & 1) != 0)
  {
    sub_100003B2C(0, &qword_1000D1290, OS_dispatch_queue_ptr);
    v18 = (void *)static OS_dispatch_queue.main.getter(v17);
    v19 = swift_allocObject(&unk_1000C35C0, 24, 7);
    *(_QWORD *)(v19 + 16) = v3;
    v27[4] = sub_10007CF40;
    v27[5] = v19;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 1107296256;
    v27[2] = sub_100007DA8;
    v27[3] = &unk_1000C35D8;
    v20 = _Block_copy(v27);
    v21 = v3;
    v22 = sub_100019D9C();
    static DispatchQoS.unspecified.getter(v22);
    v27[0] = _swiftEmptyArrayStorage;
    sub_100003974((unint64_t *)&unk_1000D3850, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t)&protocol conformance descriptor for DispatchWorkItemFlags);
    v23 = sub_100012E2C(&qword_1000D1298);
    v24 = sub_10007CF48();
    dispatch thunk of SetAlgebra.init<A>(_:)(v27, v23, v24);
    OS_dispatch_queue.async(group:qos:flags:execute:)(0, v2, v1, v20);
    _Block_release(v20);

    sub_10005E530(*(uint64_t (**)(uint64_t, uint64_t))(v26 + 8));
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v2, v25);
  }
  sub_100018094();
}

double sub_10007C7F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double result;

  v0 = sub_1000037EC();
  v1 = type metadata accessor for SidebarView.DataSource(0);
  v2 = sub_100003974(&qword_1000D28C0, type metadata accessor for SidebarView.DataSource, (uint64_t)&unk_100099F38);
  v3 = ObservableObject<>.objectWillChange.getter(v1, v2);
  swift_release(v0);
  ObservableObjectPublisher.send()();
  *(_QWORD *)&result = swift_release(v3).n128_u64[0];
  return result;
}

uint64_t sub_10007C940()
{
  return sub_100003974(&qword_1000D10C8, type metadata accessor for MainViewController, (uint64_t)&unk_100097290);
}

void sub_10007C96C(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[24];

  v3 = (void *)(v1 + OBJC_IVAR___WFSidebarViewController_rootView);
  sub_100026D70((uint64_t)v3, (uint64_t)v6);
  if (sub_10007D094())
  {
    v4 = sub_10007D0F8();
    v5 = sub_100003974(&qword_1000D10C8, type metadata accessor for MainViewController, (uint64_t)&unk_100097290);
    RootView.navigate(to:)(a1, v4, v5);

  }
  sub_10004280C();
}

void sub_10007C9E4(Swift::OpaquePointer a1, char a2)
{
  uint64_t v2;
  uint64_t v5;
  void *v6;
  _BYTE v7[24];

  sub_100026D70(v2 + OBJC_IVAR___WFSidebarViewController_rootView, (uint64_t)v7);
  v5 = sub_10007D094();
  if (v5)
  {
    v6 = (void *)v5;
    type metadata accessor for MainViewController(0);
    sub_100003974(&qword_1000D10C8, type metadata accessor for MainViewController, (uint64_t)&unk_100097290);
    RootView.deleteCollections(_:keepShortcuts:)(a1, a2 & 1);

  }
  sub_10004280C();
}

void sub_10007CA70(Swift::OpaquePointer a1@<X0>, Swift::Int a2@<X1>, char a3@<W2>, uint64_t *a4@<X8>)
{
  uint64_t v4;
  void *v9;
  uint64_t countAndFlagsBits;
  void *object;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  Swift::tuple_title_String_message_String_deleteTitle_String_keepTitle_String v18;
  _BYTE v19[24];

  v9 = (void *)(v4 + OBJC_IVAR___WFSidebarViewController_rootView);
  sub_100026D70((uint64_t)v9, (uint64_t)v19);
  if (sub_10007D094())
  {
    sub_10007D0F8();
    sub_100003974(&qword_1000D10C8, type metadata accessor for MainViewController, (uint64_t)&unk_100097290);
    RootView.deleteAlertStrings(collections:shortcutsCount:exactCount:)(&v18, a1, a2, a3 & 1);
    countAndFlagsBits = v18.title._countAndFlagsBits;
    object = v18.title._object;
    v12 = v18.message._countAndFlagsBits;
    v13 = v18.message._object;
    v14 = v18.deleteTitle._countAndFlagsBits;
    v15 = v18.deleteTitle._object;
    v16 = v18.keepTitle._countAndFlagsBits;
    v17 = v18.keepTitle._object;

  }
  else
  {
    countAndFlagsBits = 0;
    object = 0;
    v12 = 0;
    v13 = 0;
    v14 = 0;
    v15 = 0;
    v16 = 0;
    v17 = 0;
  }
  *a4 = countAndFlagsBits;
  a4[1] = (uint64_t)object;
  a4[2] = v12;
  a4[3] = (uint64_t)v13;
  a4[4] = v14;
  a4[5] = (uint64_t)v15;
  a4[6] = v16;
  a4[7] = (uint64_t)v17;
}

void sub_10007CB68(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  _BYTE v5[24];

  sub_100026D70(v1 + OBJC_IVAR___WFSidebarViewController_rootView, (uint64_t)v5);
  v3 = sub_10007D094();
  if (v3)
  {
    v4 = (void *)v3;
    sub_10001F6D0(a1);

  }
  sub_100068F8C();
}

void sub_10007CBB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  double (*v4)();
  char v5;
  id v6;
  char v7;

  v0 = type metadata accessor for EditMode(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  sub_10001827C();
  v2 = (uint64_t)sub_10007D0CC();
  if ((v2 & 1) == 0)
  {
    sub_10007D0AC(v2, enum case for EditMode.active(_:));
    v3 = sub_10007D124();
    sub_10005E530(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    if ((v3 & 1) != 0)
    {
      v4 = sub_10007CFEC;
      v5 = 1;
LABEL_7:
      sub_10007BF98(v5, (uint64_t)v4);
      return;
    }
  }
  v6 = sub_10007D0CC();
  if ((_DWORD)v6)
  {
    sub_10007D0AC((uint64_t)v6, enum case for EditMode.inactive(_:));
    v7 = sub_10007D124();
    sub_10005E530(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
    if ((v7 & 1) != 0)
    {
      v4 = sub_10007CEAC;
      v5 = 0;
      goto LABEL_7;
    }
  }
}

void sub_10007CC90()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[24];

  sub_100026D70(v0 + OBJC_IVAR___WFSidebarViewController_rootView, (uint64_t)v6);
  v1 = sub_10007D0F0();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = (void *)sub_10001AD7C();

    if (v3)
    {
      sub_100012A90();
      v5 = v4;

      sub_10000C9A0();
      swift_release(v5);
    }
  }
  sub_100068F8C();
}

id sub_10007CD04()
{
  void *v0;
  _QWORD *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  sub_100018190();
  v2 = v0;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = v1[3];
  if (v9)
  {
    v10 = v1;
    v11 = sub_10001465C(v1, v1[3]);
    v12 = *(_QWORD *)(v9 - 8);
    __chkstk_darwin(v11);
    sub_100019D7C();
    v15 = v14 - v13;
    (*(void (**)(uint64_t))(v12 + 16))(v14 - v13);
    v16 = _bridgeAnythingToObjectiveC<A>(_:)(v15, v9);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v15, v9);
    sub_10000B6E4(v10);
  }
  else
  {
    v16 = 0;
  }
  v17 = objc_msgSend(v2, "initWithImage:style:target:action:", v8, v6, v16, v4);
  swift_unknownObjectRelease(v16);

  return v17;
}

uint64_t sub_10007CE04@<X0>(_QWORD *a1@<X8>)
{
  return sub_100051518(a1);
}

void sub_10007CE28(void *a1, void *a2, void *a3)
{
  if (a1)
  {

  }
}

id sub_10007CE64(id result, void *a2, void *a3)
{
  id v4;
  id v5;

  if (result)
  {
    v4 = result;
    v5 = a2;
    return a3;
  }
  return result;
}

void sub_10007CEA0(uint64_t a1, uint64_t a2, void *a3)
{
  sub_10007CF98(a1, a2, a3, (SEL *)&selRef_setAccessibilityLabel_);
}

double sub_10007CEAC()
{
  uint64_t v0;

  return sub_10007C044(*(_QWORD *)(v0 + 16), (unsigned int *)&enum case for EditMode.inactive(_:));
}

unint64_t sub_10007CECC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D13C0;
  if (!qword_1000D13C0)
  {
    v1 = sub_100003B2C(255, (unint64_t *)&qword_1000D13B8, WFDatabaseObjectDescriptor_ptr);
    result = swift_getWitnessTable(&protocol conformance descriptor for NSObject, v1);
    atomic_store(result, (unint64_t *)&qword_1000D13C0);
  }
  return result;
}

uint64_t sub_10007CF1C()
{
  uint64_t v0;

  return swift_deallocObject(v0, 24, 7);
}

double sub_10007CF40()
{
  return sub_10007C7F0();
}

unint64_t sub_10007CF48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3860;
  if (!qword_1000D3860)
  {
    v1 = sub_1000143E4(&qword_1000D1298);
    result = swift_getWitnessTable(&protocol conformance descriptor for [A], v1);
    atomic_store(result, (unint64_t *)&qword_1000D3860);
  }
  return result;
}

void sub_10007CF8C(uint64_t a1, uint64_t a2, void *a3)
{
  sub_10007CF98(a1, a2, a3, (SEL *)&selRef_setTitle_);
}

void sub_10007CF98(uint64_t a1, uint64_t a2, void *a3, SEL *a4)
{
  NSString v6;

  v6 = String._bridgeToObjectiveC()();
  sub_100047F0C();
  objc_msgSend(a3, *a4, v6);

}

double sub_10007CFEC()
{
  uint64_t v0;

  return sub_10007C044(*(_QWORD *)(v0 + 16), (unsigned int *)&enum case for EditMode.active(_:));
}

NSString sub_10007D00C()
{
  return String._bridgeToObjectiveC()();
}

NSString sub_10007D048()
{
  return String._bridgeToObjectiveC()();
}

id sub_10007D060(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  const char *v9;

  return objc_msgSendSuper2(&a9, v9, 0, 0);
}

id sub_10007D074()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, *(SEL *)(v1 + 520));
}

uint64_t sub_10007D080()
{
  uint64_t v0;

  return swift_getObjectType(v0);
}

uint64_t sub_10007D094()
{
  uint64_t v0;

  return swift_unknownObjectWeakLoadStrong(v0);
}

id sub_10007D09C()
{
  void *v0;

  return sub_100011544(v0);
}

uint64_t sub_10007D0AC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 104))(v3, a2, v2);
}

void sub_10007D0BC(uint64_t a1, uint64_t a2, uint64_t a3, SEL *a4)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  sub_10007CF98(v5, v6, v4, a4);
}

id sub_10007D0CC()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, *(SEL *)(v1 + 3360));
}

void sub_10007D0D8()
{
  void *v0;

}

uint64_t sub_10007D0E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  return _stringCompareWithSmolCheck(_:_:expecting:)(a1, a2, a3, v3, 0);
}

uint64_t sub_10007D0F0()
{
  uint64_t v0;

  return swift_unknownObjectWeakLoadStrong(v0);
}

uint64_t sub_10007D0F8()
{
  return type metadata accessor for MainViewController(0);
}

uint64_t sub_10007D104()
{
  return type metadata accessor for SidebarView.DataSource(0);
}

uint64_t sub_10007D110()
{
  return type metadata accessor for SidebarStyle(0);
}

id sub_10007D118()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, *(SEL *)(v1 + 520));
}

uint64_t sub_10007D124()
{
  uint64_t v0;
  uint64_t v1;

  return static EditMode.== infix(_:_:)(v0, v1);
}

uint64_t sub_10007D130()
{
  uint64_t v0;

  return swift_retain(v0);
}

void *sub_10007D13C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15)
{
  return sub_10007D194(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, &qword_1000D1F80, &qword_1000D1F88);
}

void *sub_10007D194@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t *a16, uint64_t *a17)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v33;
  double v34;
  double v35;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int v43;
  unsigned int v44;
  double v45;
  double v46;
  double v47;
  double v48;
  _QWORD __src[15];

  v18 = v17;
  v19 = a9;
  v20 = a17;
  v22 = a14;
  v21 = a15;
  v23 = a12;
  v24 = a10;
  v25 = a2 & 1;
  v26 = a1;
  if ((_DWORD)v25)
    v26 = -INFINITY;
  v27 = a4 & 1;
  v28 = a3;
  if ((_DWORD)v27)
    v28 = v26;
  v29 = a6 & 1;
  v30 = a8 & 1;
  v31 = a5;
  if ((a6 & 1) != 0)
    v31 = v28;
  if (v26 > v28 || v28 > v31)
    goto LABEL_22;
  v33 = a7;
  if ((a8 & 1) != 0)
    v33 = -INFINITY;
  v34 = a10;
  if ((a11 & 1) != 0)
    v34 = v33;
  v35 = a12;
  if ((a13 & 1) != 0)
    v35 = v34;
  if (v33 > v34 || v34 > v35)
  {
LABEL_22:
    v47 = a5;
    v48 = a7;
    v45 = a3;
    v46 = a1;
    v44 = v25;
    v43 = v27;
    v38 = static os_log_type_t.fault.getter();
    v39 = (void *)static Log.runtimeIssuesLog.getter();
    v40 = v38;
    v19 = a9;
    os_log(_:dso:log:_:_:)(v40, &_mh_execute_header, v39, "Contradictory frame constraints specified.", 42, 2, _swiftEmptyArrayStorage);

    v27 = v43;
    v22 = a14;
    v21 = a15;
    v25 = v44;
    v24 = a10;
    v23 = a12;
    a3 = v45;
    a1 = v46;
    a5 = v47;
    a7 = v48;
    v20 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)(__src, *(_QWORD *)&a1, v25, *(_QWORD *)&a3, v27, *(_QWORD *)&a5, v29, *(_QWORD *)&a7, v30, *(_QWORD *)&v24, a11 & 1, *(_QWORD *)&v23, a13 & 1, v22, v21);
  sub_100081720(v18, v19, a16);
  v41 = sub_100012E2C(v20);
  return memcpy((void *)(v19 + *(int *)(v41 + 36)), __src, 0x70uLL);
}

uint64_t AppShortcutChiclet.init(section:isExpanded:containerWidth:chicletsPerRow:action:)@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, double a7@<D0>)
{
  uint64_t v7;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  int *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __n128 v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v35 = a3;
  v14 = type metadata accessor for TopHitCollectionViewStyle(0);
  v36 = *(_QWORD *)(v14 - 8);
  v37 = v14;
  sub_100018044();
  __chkstk_darwin(v15);
  sub_100018470();
  v16 = sub_100081788();
  v38 = *(_QWORD *)(v16 - 8);
  v39 = v16;
  sub_100018044();
  __chkstk_darwin(v17);
  v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = (int *)sub_1000817B4();
  v21 = (_QWORD *)(a6 + v20[10]);
  *v21 = swift_getKeyPath(&unk_10009AD40);
  v22 = sub_100012E2C(&qword_1000D4400);
  sub_1000817BC(v22);
  v23 = (_QWORD *)(a6 + v20[11]);
  *v23 = swift_getKeyPath(&unk_10009AD70);
  v24 = sub_100012E2C(&qword_1000D06D0);
  sub_1000817BC(v24);
  v25 = sub_100081780();
  v26 = *(_QWORD *)(v25 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(a6, a1, v25);
  *(_BYTE *)(a6 + v20[5]) = a2;
  *(double *)(a6 + v20[6]) = a7;
  *(_QWORD *)(a6 + v20[9]) = v35;
  v27 = (_QWORD *)(a6 + v20[7]);
  *v27 = a4;
  v27[1] = a5;
  v28 = swift_retain(a5);
  v29 = AutoShortcutAppSection.bundleIdentifier.getter(v28);
  v31 = v30;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v36 + 104))(v7, enum case for TopHitCollectionViewStyle.library(_:), v37);
  TopHitViewColorScheme.init(bundleIdentifier:style:)(v29, v31, v7);
  v32 = swift_release(a5);
  (*(void (**)(uint64_t, uint64_t, __n128))(v26 + 8))(a1, v25, v32);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v38 + 32))(a6 + v20[8], v19, v39);
}

uint64_t type metadata accessor for AppShortcutChiclet(uint64_t a1)
{
  return sub_100004954(a1, (uint64_t *)&unk_1000D3A60, (uint64_t)&nominal type descriptor for AppShortcutChiclet);
}

void AppShortcutChiclet.body.getter(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;

  v3 = v1;
  sub_100012E2C(&qword_1000D39E8);
  sub_100018044();
  __chkstk_darwin(v5);
  sub_1000184A0();
  *(_QWORD *)v2 = static HorizontalAlignment.leading.getter();
  *(_QWORD *)(v2 + 8) = 0;
  *(_BYTE *)(v2 + 16) = 1;
  v6 = sub_100012E2C(&qword_1000D39F0);
  sub_10007D628(v3, v2 + *(int *)(v6 + 44));
  v7 = *(double *)(v3 + *(int *)(sub_1000817B4() + 24));
  v8 = static Alignment.leading.getter();
  sub_10007D194(0.0, 1, 0.0, 1, v7, 0, 0.0, 1, a1, 0.0, 1, 0.0, 1, v8, v9, &qword_1000D39E8, &qword_1000D3AC8);
  sub_10001222C(v2, &qword_1000D39E8);
}

void sub_10007D628(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  BOOL v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t KeyPath;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  double v47;
  unint64_t v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t *v61;
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
  unint64_t v75;
  char *v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  _BYTE *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  char *v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;

  v117 = a2;
  v118 = type metadata accessor for AppShortcutChiclet(0);
  v108 = *(_QWORD *)(v118 - 8);
  __chkstk_darwin(v118);
  v110 = v3;
  v111 = (uint64_t)&v89 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100012E2C(&qword_1000D3BC8);
  v105 = *(_QWORD *)(v4 - 8);
  v106 = v4;
  __chkstk_darwin(v4);
  v99 = (uint64_t *)((char *)&v89 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = type metadata accessor for TopHitCollectionViewStyle(0);
  v101 = *(_QWORD *)(v6 - 8);
  v102 = v6;
  __chkstk_darwin(v6);
  v103 = (char *)&v89 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v115 = sub_100012E2C(&qword_1000D3BD0);
  v113 = *(_QWORD *)(v115 - 8);
  __chkstk_darwin(v115);
  v112 = (char *)&v89 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = sub_100012E2C(&qword_1000D3BD8);
  v9 = __chkstk_darwin(v109);
  v116 = (uint64_t)&v89 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v9);
  v107 = (char *)&v89 - v12;
  __chkstk_darwin(v11);
  v114 = (uint64_t)&v89 - v13;
  v96 = sub_100012E2C(&qword_1000D3BE0);
  v97 = *(_QWORD *)(v96 - 8);
  __chkstk_darwin(v96);
  v95 = (char *)&v89 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_100012E2C(&qword_1000D3BE8);
  __chkstk_darwin(v15);
  v17 = (char *)&v89 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_100012E2C(&qword_1000D3BF0);
  v19 = *(_QWORD *)(v18 - 8);
  __chkstk_darwin(v18);
  v21 = (char *)&v89 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = sub_100012E2C(&qword_1000D3BF8);
  __chkstk_darwin(v100);
  v23 = (char *)&v89 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = type metadata accessor for AutoShortcutAppSection.SectionType(0);
  v25 = *(_QWORD *)(v24 - 8);
  __chkstk_darwin(v24);
  v27 = (char *)&v89 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_100012E2C(&qword_1000D3C00);
  v29 = __chkstk_darwin(v28);
  v30 = __chkstk_darwin(v29);
  v119 = (uint64_t)&v89 - v31;
  v32 = *(int *)(v118 + 20);
  v33 = *(_BYTE *)(a1 + v32) == 1;
  v104 = v34;
  v98 = v32;
  if (v33)
  {
    v90 = v23;
    v35 = v97;
    v91 = v17;
    v89 = v15;
    v92 = v21;
    v93 = v19;
    v94 = v18;
    v56 = a1;
    AutoShortcutAppSection.sectionType.getter(v30);
    if ((*(unsigned int (**)(char *, uint64_t))(v25 + 88))(v27, v24) == enum case for AutoShortcutAppSection.SectionType.categorized(_:))
    {
      v36 = (*(uint64_t (**)(char *, uint64_t))(v25 + 96))(v27, v24);
      v37 = __chkstk_darwin(v36);
      __chkstk_darwin(v37);
      sub_100012E2C(&qword_1000D3C40);
      sub_100081218();
      v38 = v95;
      Label.init(title:icon:)(sub_10004F88C);
      swift_bridgeObjectRelease();
      v39 = swift_bridgeObjectRelease();
      v40 = static Font.title3.getter(v39);
      KeyPath = swift_getKeyPath(&unk_10009AEB0);
      v42 = (uint64_t)v91;
      v43 = v96;
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v91, v38, v96);
      v44 = v89;
      v45 = (uint64_t *)(v42 + *(int *)(v89 + 36));
      *v45 = KeyPath;
      v45[1] = v40;
      v46 = (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v38, v43);
      v47 = static Font.Weight.semibold.getter(v46);
      v48 = sub_1000812A4();
      v49 = v92;
      View.fontWeight(_:)(*(_QWORD *)&v47, 0, v44, v48);
      sub_10001222C(v42, &qword_1000D3BE8);
      LOBYTE(v47) = static Edge.Set.all.getter();
      v50 = v93;
      v51 = (uint64_t)v90;
      v52 = v94;
      (*(void (**)(char *, char *, uint64_t))(v93 + 16))(v90, v49, v94);
      v55 = v100;
      v53 = v51 + *(int *)(v100 + 36);
      *(_BYTE *)v53 = LOBYTE(v47);
      *(_OWORD *)(v53 + 8) = xmmword_10009AD10;
      *(_OWORD *)(v53 + 24) = xmmword_10009AD20;
      *(_BYTE *)(v53 + 40) = 0;
      (*(void (**)(char *, uint64_t))(v50 + 8))(v49, v52);
      sub_100081678(v51, v119, &qword_1000D3BF8);
      v54 = 0;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
      v54 = 1;
      v55 = v100;
    }
  }
  else
  {
    v54 = 1;
    v55 = v100;
    v56 = a1;
  }
  sub_100015D74(v119, v54, 1, v55);
  v57 = v103;
  v58 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v101 + 104))(v103, enum case for TopHitCollectionViewStyle.library(_:), v102);
  v59 = AutoShortcutAppSection.items.getter(v58);
  if (*(_BYTE *)(v56 + v98))
    v60 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v60 = 1;
  sub_10007DFF0();
  v61 = v99;
  *v99 = v60;
  v61[1] = v62;
  *((_BYTE *)v61 + 16) = 0;
  v63 = (*(uint64_t (**)(uint64_t *, _QWORD, uint64_t))(v105 + 104))(v61, enum case for TopHitCollectionView.Layout.grid<A, B>(_:), v106);
  v64 = v118;
  v65 = TopHitViewColorScheme.platterBackgroundGradient.getter(v63);
  v66 = *(_QWORD *)(v56 + *(int *)(v64 + 24));
  v67 = v111;
  sub_100080FB0(v56, v111);
  v68 = *(unsigned __int8 *)(v108 + 80);
  v69 = (v68 + 16) & ~v68;
  v70 = swift_allocObject(&unk_1000C3690, v69 + v110, v68 | 7);
  sub_10008164C(v67, v70 + v69, type metadata accessor for AppShortcutChiclet);
  v71 = type metadata accessor for AggregatedEntry(0);
  v72 = sub_100012E2C(&qword_1000D3C08);
  sub_1000040A8(&qword_1000D3C10, (uint64_t (*)(uint64_t))&type metadata accessor for AggregatedEntry);
  v74 = v73;
  v75 = sub_100081170();
  v88 = v71;
  v76 = v112;
  TopHitCollectionView.init(style:items:layout:backgroundGradient:containerWidth:content:)(v57, v59, v61, v65, v66, 0, sub_100081130, v70, v88, v72, v74, v75);
  v77 = sub_10007E6D8();
  v78 = v113;
  v79 = (uint64_t)v107;
  v80 = v115;
  (*(void (**)(char *, char *, uint64_t))(v113 + 16))(v107, v76, v115);
  v81 = (_BYTE *)(v79 + *(int *)(v109 + 36));
  *v81 = v77 & 1;
  v81[1] = 0;
  (*(void (**)(char *, uint64_t))(v78 + 8))(v76, v80);
  v82 = v114;
  sub_100081678(v79, v114, &qword_1000D3BD8);
  v83 = v119;
  v84 = v104;
  sub_100081720(v119, v104, &qword_1000D3C00);
  v85 = v116;
  sub_100081720(v82, v116, &qword_1000D3BD8);
  v86 = v117;
  sub_100081720(v84, v117, &qword_1000D3C00);
  v87 = sub_100012E2C(&qword_1000D3C38);
  sub_100081720(v85, v86 + *(int *)(v87 + 48), &qword_1000D3BD8);
  sub_10001222C(v82, &qword_1000D3BD8);
  sub_10001222C(v83, &qword_1000D3C00);
  sub_10001222C(v85, &qword_1000D3BD8);
  sub_10001222C(v84, &qword_1000D3C00);
}

uint64_t sub_10007DEA4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &opaque type descriptor for <<opaque return type of AppShortcutChiclet.body>>, 1);
}

uint64_t sub_10007DEB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v6 = type metadata accessor for ColorScheme(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain(a2);
  v10 = Image.init(_internalSystemName:)(a1, a2);
  type metadata accessor for AppShortcutChiclet(0);
  v11 = (void *)TopHitViewColorScheme.sectionIconForegroundColor.getter();
  sub_100080DAC(&qword_1000D4400, (uint64_t (*)(_QWORD))&type metadata accessor for ColorScheme, 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v9);
  v12 = WFColor.luminanceAdjustedColor(in:)(v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  v13 = Color.init(_:)(v12);
  result = swift_getKeyPath(&unk_10009AEE0);
  *a3 = v10;
  a3[1] = result;
  a3[2] = v13;
  return result;
}

uint64_t sub_10007DFF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t result;
  double v12;
  uint64_t v13;
  double v14;
  uint64_t v15;

  v1 = v0;
  v2 = type metadata accessor for TopHitCollectionViewStyle(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for AppShortcutChiclet(0);
  v7 = *(double *)(v1 + *(int *)(v6 + 24));
  v8 = (*(uint64_t (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, enum case for TopHitCollectionViewStyle.library(_:), v2);
  v9 = TopHitCollectionViewStyle.contentViewHorizontalPadding.getter(v8);
  v10 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  result = static TopHitViewMetrics.width.getter(v10);
  v13 = *(_QWORD *)(v1 + *(int *)(v6 + 36));
  if (v13 <= 2)
    v13 = 2;
  if (v13 + 0x4000000000000000 < 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  v14 = (v7 - (v9 + v9)) / v12;
  if ((~*(_QWORD *)&v14 & 0x7FF0000000000000) == 0)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v14 <= -9.22337204e18)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  if (v14 >= 9.22337204e18)
LABEL_11:
    __break(1u);
  return result;
}

void sub_10007E140(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(uint64_t, char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
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
  char *v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;

  v54 = a2;
  v71 = a3;
  v69 = type metadata accessor for EntryAnnotationModifier(0);
  __chkstk_darwin(v69);
  v70 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for AppShortcutChiclet(0);
  v64 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v65 = v6;
  v68 = (uint64_t)&v51 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TopHitViewColorScheme(0);
  v57 = *(_QWORD *)(v7 - 8);
  v58 = (char *)v7;
  __chkstk_darwin(v7);
  v9 = (char *)&v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for AggregatedEntry(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = __chkstk_darwin(v10);
  v14 = (char *)&v51 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v59 = v13;
  __chkstk_darwin(v12);
  v16 = (char *)&v51 - v15;
  v17 = sub_100012E2C(&qword_1000D3C70);
  __chkstk_darwin(v17);
  v19 = (char *)&v51 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_100012E2C(&qword_1000D3C28);
  v66 = *(_QWORD *)(v20 - 8);
  v67 = v20;
  __chkstk_darwin(v20);
  v63 = (char *)&v51 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = sub_100012E2C(&qword_1000D3C08);
  v22 = __chkstk_darwin(v61);
  v62 = (char *)&v51 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = AggregatedEntry.entryIcon.getter(v22);
  v24 = type metadata accessor for TopHitIconMask(0);
  v60 = v19;
  v25 = sub_100015D74((uint64_t)v19, 1, 1, v24);
  v55 = AggregatedEntry.iconBadges.getter(v25);
  v26 = AggregatedEntry.shortTitle.getter();
  v28 = v27;
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v30 = v29(v16, a1, v10);
  if (v28)
  {
    v52 = v28;
    v53 = v26;
  }
  else
  {
    v31 = AggregatedEntry.name.getter(v30);
    v52 = v32;
    v53 = v31;
  }
  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
  v33 = v54;
  (*(void (**)(char *, uint64_t, char *))(v57 + 16))(v9, v54 + *(int *)(v5 + 32), v58);
  v29(v14, a1, v10);
  v58 = v9;
  v34 = *(unsigned __int8 *)(v11 + 80);
  v51 = a1;
  v35 = (v34 + 16) & ~v34;
  v36 = v59;
  v37 = v34 | 7;
  v57 = swift_allocObject(&unk_1000C36B8, v35 + v59, v34 | 7);
  v38 = *(void (**)(uint64_t, char *, uint64_t))(v11 + 32);
  v38(v57 + v35, v14, v10);
  v39 = v33;
  v40 = v68;
  sub_100080FB0(v39, v68);
  v29(v14, a1, v10);
  v41 = *(unsigned __int8 *)(v64 + 80);
  v42 = (v41 + 16) & ~v41;
  v43 = (v65 + v34 + v42) & ~v34;
  v44 = swift_allocObject(&unk_1000C36E0, v43 + v36, v37 | v41);
  sub_10008164C(v40, v44 + v42, type metadata accessor for AppShortcutChiclet);
  v38(v44 + v43, v14, v10);
  v45 = v63;
  TopHitView.init(icon:iconMask:badges:name:colorScheme:menu:tapHandler:)(v56, v60, v55, v53, v52, v58, sub_1000813FC, v57, sub_1000815A8, v44, &type metadata for AnyView, &protocol witness table for AnyView);
  v46 = (uint64_t)v70;
  v29(v70, v51, v10);
  v47 = v46 + *(int *)(v69 + 20);
  *(_QWORD *)v47 = swift_getKeyPath(&unk_10009AF10);
  *(_BYTE *)(v47 + 8) = 0;
  v49 = v66;
  v48 = v67;
  v50 = (uint64_t)v62;
  (*(void (**)(char *, char *, uint64_t))(v66 + 16))(v62, v45, v67);
  sub_10008164C(v46, v50 + *(int *)(v61 + 36), type metadata accessor for EntryAnnotationModifier);
  (*(void (**)(char *, uint64_t))(v49 + 8))(v45, v48);
  sub_100081678(v50, v71, &qword_1000D3C08);
}

uint64_t sub_10007E59C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;

  v4 = type metadata accessor for AggregatedEntry(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for LibraryMenu(0);
  __chkstk_darwin(v8);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  LibraryMenu.init(entry:)(v7);
  sub_1000040A8(&qword_1000D22D8, (uint64_t (*)(uint64_t))&type metadata accessor for LibraryMenu);
  result = AnyView.init<A>(_:)(v10, v8, v11);
  *a2 = result;
  return result;
}

uint64_t sub_10007E69C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppShortcutChiclet(0);
  return (*(uint64_t (**)(uint64_t))(a1 + *(int *)(v4 + 28)))(a2);
}

uint64_t sub_10007E6D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
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
  char *v15;
  uint64_t v16;
  int v17;
  uint64_t *v18;
  char v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v23;

  v0 = type metadata accessor for UserInterfaceSizeClass(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_100012E2C(&qword_1000D3C60);
  __chkstk_darwin(v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100012E2C(&qword_1000D0860);
  v8 = __chkstk_darwin(v7);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __chkstk_darwin(v8);
  v13 = (char *)&v23 - v12;
  __chkstk_darwin(v11);
  v15 = (char *)&v23 - v14;
  type metadata accessor for AppShortcutChiclet(0);
  sub_100080804((uint64_t)v15);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v13, enum case for UserInterfaceSizeClass.regular(_:), v0);
  sub_100015D74((uint64_t)v13, 0, 1, v0);
  v16 = (uint64_t)&v6[*(int *)(v4 + 48)];
  sub_100081720((uint64_t)v15, (uint64_t)v6, &qword_1000D0860);
  sub_100081720((uint64_t)v13, v16, &qword_1000D0860);
  if (sub_100019D44((uint64_t)v6, 1, v0) == 1)
  {
    sub_10001222C((uint64_t)v13, &qword_1000D0860);
    sub_10001222C((uint64_t)v15, &qword_1000D0860);
    v17 = sub_100019D44(v16, 1, v0);
    if (v17 == 1)
      v18 = &qword_1000D0860;
    else
      v18 = &qword_1000D3C60;
    if (v17 == 1)
      v19 = -1;
    else
      v19 = 0;
  }
  else
  {
    sub_100081720((uint64_t)v6, (uint64_t)v10, &qword_1000D0860);
    if (sub_100019D44(v16, 1, v0) == 1)
    {
      sub_10001222C((uint64_t)v13, &qword_1000D0860);
      sub_10001222C((uint64_t)v15, &qword_1000D0860);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v10, v0);
      v19 = 0;
      v18 = &qword_1000D3C60;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v3, v16, v0);
      sub_1000040A8(&qword_1000D3C68, (uint64_t (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
      v19 = dispatch thunk of static Equatable.== infix(_:_:)(v10, v3, v0, v20);
      v21 = *(void (**)(char *, uint64_t))(v1 + 8);
      v21(v3, v0);
      v18 = &qword_1000D0860;
      sub_10001222C((uint64_t)v13, &qword_1000D0860);
      sub_10001222C((uint64_t)v15, &qword_1000D0860);
      v21(v10, v0);
    }
  }
  sub_10001222C((uint64_t)v6, v18);
  return v19 & 1;
}

_QWORD *initializeBufferWithCopyOfBuffer for AppShortcutChiclet(_QWORD *a1, _QWORD *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v24 = *a2;
    *a1 = *a2;
    a1 = (_QWORD *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v24);
  }
  else
  {
    v7 = type metadata accessor for AutoShortcutAppSection(0);
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[6];
    *((_BYTE *)a1 + a3[5]) = *((_BYTE *)a2 + a3[5]);
    *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
    v9 = a3[7];
    v10 = a3[8];
    v11 = (_QWORD *)((char *)a1 + v9);
    v12 = (_QWORD *)((char *)a2 + v9);
    v13 = v12[1];
    *v11 = *v12;
    v11[1] = v13;
    v14 = (char *)a1 + v10;
    v15 = (char *)a2 + v10;
    v16 = type metadata accessor for TopHitViewColorScheme(0);
    v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
    swift_retain(v13);
    v17(v14, v15, v16);
    v18 = a3[10];
    *(_QWORD *)((char *)a1 + a3[9]) = *(_QWORD *)((char *)a2 + a3[9]);
    v19 = (_QWORD *)((char *)a1 + v18);
    v20 = (_QWORD *)((char *)a2 + v18);
    v21 = sub_100012E2C(&qword_1000D4400);
    if (swift_getEnumCaseMultiPayload(v20, v21) == 1)
    {
      v22 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v19, v20, v22);
      v23 = 1;
    }
    else
    {
      v25 = *v20;
      *v19 = *v20;
      swift_retain(v25);
      v23 = 0;
    }
    swift_storeEnumTagMultiPayload(v19, v21, v23);
    v26 = a3[11];
    v27 = (_QWORD *)((char *)a1 + v26);
    v28 = (_QWORD *)((char *)a2 + v26);
    v29 = sub_100012E2C(&qword_1000D06D0);
    if (swift_getEnumCaseMultiPayload(v28, v29) == 1)
    {
      v30 = type metadata accessor for UserInterfaceSizeClass(0);
      if (sub_100019D44((uint64_t)v28, 1, v30))
      {
        v31 = sub_100012E2C(&qword_1000D0860);
        memcpy(v27, v28, *(_QWORD *)(*(_QWORD *)(v31 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v30 - 8) + 16))(v27, v28, v30);
        sub_100015D74((uint64_t)v27, 0, 1, v30);
      }
      v33 = v27;
      v34 = v29;
      v35 = 1;
    }
    else
    {
      v32 = *v28;
      *v27 = *v28;
      swift_retain(v32);
      v33 = v27;
      v34 = v29;
      v35 = 0;
    }
    swift_storeEnumTagMultiPayload(v33, v34, v35);
  }
  return a1;
}

void destroy for AppShortcutChiclet(uint64_t a1, int *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = type metadata accessor for AutoShortcutAppSection(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  swift_release(*(_QWORD *)(a1 + a2[7] + 8));
  v5 = a1 + a2[8];
  v6 = type metadata accessor for TopHitViewColorScheme(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (_QWORD *)(a1 + a2[10]);
  v8 = sub_100012E2C(&qword_1000D4400);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    v9 = type metadata accessor for ColorScheme(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v7, v9);
  }
  else
  {
    swift_release(*v7);
  }
  v10 = (_QWORD *)(a1 + a2[11]);
  v11 = sub_100012E2C(&qword_1000D06D0);
  if (swift_getEnumCaseMultiPayload(v10, v11) == 1)
  {
    v12 = type metadata accessor for UserInterfaceSizeClass(0);
    if (!sub_100019D44((uint64_t)v10, 1, v12))
      (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v10, v12);
  }
  else
  {
    swift_release(*v10);
  }
}

uint64_t initializeWithCopy for AppShortcutChiclet(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;

  v6 = type metadata accessor for AutoShortcutAppSection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[7];
  v9 = a3[8];
  v10 = (_QWORD *)(a1 + v8);
  v11 = (_QWORD *)(a2 + v8);
  v12 = v11[1];
  *v10 = *v11;
  v10[1] = v12;
  v13 = a1 + v9;
  v14 = a2 + v9;
  v15 = type metadata accessor for TopHitViewColorScheme(0);
  v16 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 16);
  swift_retain(v12);
  v16(v13, v14, v15);
  v17 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  v18 = (uint64_t *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v20 = sub_100012E2C(&qword_1000D4400);
  if (swift_getEnumCaseMultiPayload(v19, v20) == 1)
  {
    v21 = type metadata accessor for ColorScheme(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v18, v19, v21);
    v22 = 1;
  }
  else
  {
    v23 = *v19;
    *v18 = *v19;
    swift_retain(v23);
    v22 = 0;
  }
  swift_storeEnumTagMultiPayload(v18, v20, v22);
  v24 = a3[11];
  v25 = (uint64_t *)(a1 + v24);
  v26 = (uint64_t *)(a2 + v24);
  v27 = sub_100012E2C(&qword_1000D06D0);
  if (swift_getEnumCaseMultiPayload(v26, v27) == 1)
  {
    v28 = type metadata accessor for UserInterfaceSizeClass(0);
    if (sub_100019D44((uint64_t)v26, 1, v28))
    {
      v29 = sub_100012E2C(&qword_1000D0860);
      memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v29 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v25, v26, v28);
      sub_100015D74((uint64_t)v25, 0, 1, v28);
    }
    v31 = v25;
    v32 = v27;
    v33 = 1;
  }
  else
  {
    v30 = *v26;
    *v25 = *v26;
    swift_retain(v30);
    v31 = v25;
    v32 = v27;
    v33 = 0;
  }
  swift_storeEnumTagMultiPayload(v31, v32, v33);
  return a1;
}

uint64_t assignWithCopy for AppShortcutChiclet(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;

  v6 = type metadata accessor for AutoShortcutAppSection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + a3[6]) = *(_QWORD *)(a2 + a3[6]);
  v7 = a3[7];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  v10 = v9[1];
  v11 = v8[1];
  *v8 = *v9;
  v8[1] = v10;
  swift_retain(v10);
  swift_release(v11);
  v12 = a3[8];
  v13 = a1 + v12;
  v14 = a2 + v12;
  v15 = type metadata accessor for TopHitViewColorScheme(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 24))(v13, v14, v15);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  if (a1 != a2)
  {
    v16 = a3[10];
    v17 = (uint64_t *)(a1 + v16);
    v18 = (uint64_t *)(a2 + v16);
    sub_10001222C(a1 + v16, &qword_1000D4400);
    v19 = sub_100012E2C(&qword_1000D4400);
    if (swift_getEnumCaseMultiPayload(v18, v19) == 1)
    {
      v20 = type metadata accessor for ColorScheme(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v17, v18, v20);
      v21 = 1;
    }
    else
    {
      v22 = *v18;
      *v17 = *v18;
      swift_retain(v22);
      v21 = 0;
    }
    swift_storeEnumTagMultiPayload(v17, v19, v21);
    v23 = a3[11];
    v24 = (uint64_t *)(a1 + v23);
    v25 = (uint64_t *)(a2 + v23);
    sub_10001222C(a1 + v23, &qword_1000D06D0);
    v26 = sub_100012E2C(&qword_1000D06D0);
    if (swift_getEnumCaseMultiPayload(v25, v26) == 1)
    {
      v27 = type metadata accessor for UserInterfaceSizeClass(0);
      if (sub_100019D44((uint64_t)v25, 1, v27))
      {
        v28 = sub_100012E2C(&qword_1000D0860);
        memcpy(v24, v25, *(_QWORD *)(*(_QWORD *)(v28 - 8) + 64));
      }
      else
      {
        (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v27 - 8) + 16))(v24, v25, v27);
        sub_100015D74((uint64_t)v24, 0, 1, v27);
      }
      v30 = v24;
      v31 = v26;
      v32 = 1;
    }
    else
    {
      v29 = *v25;
      *v24 = *v25;
      swift_retain(v29);
      v30 = v24;
      v31 = v26;
      v32 = 0;
    }
    swift_storeEnumTagMultiPayload(v30, v31, v32);
  }
  return a1;
}

uint64_t initializeWithTake for AppShortcutChiclet(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v6 = type metadata accessor for AutoShortcutAppSection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[8];
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  v9 = a1 + v8;
  v10 = a2 + v8;
  v11 = type metadata accessor for TopHitViewColorScheme(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
  v12 = a3[10];
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  v13 = (void *)(a1 + v12);
  v14 = (const void *)(a2 + v12);
  v15 = sub_100012E2C(&qword_1000D4400);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for ColorScheme(0);
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v13, v14, v16);
    swift_storeEnumTagMultiPayload(v13, v15, 1);
  }
  else
  {
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  v17 = a3[11];
  v18 = (void *)(a1 + v17);
  v19 = (const void *)(a2 + v17);
  v20 = sub_100012E2C(&qword_1000D06D0);
  if (swift_getEnumCaseMultiPayload(v19, v20) == 1)
  {
    v21 = type metadata accessor for UserInterfaceSizeClass(0);
    if (sub_100019D44((uint64_t)v19, 1, v21))
    {
      v22 = sub_100012E2C(&qword_1000D0860);
      memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v18, v19, v21);
      sub_100015D74((uint64_t)v18, 0, 1, v21);
    }
    swift_storeEnumTagMultiPayload(v18, v20, 1);
  }
  else
  {
    memcpy(v18, v19, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
  }
  return a1;
}

uint64_t assignWithTake for AppShortcutChiclet(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v6 = type metadata accessor for AutoShortcutAppSection(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[6];
  *(_BYTE *)(a1 + a3[5]) = *(_BYTE *)(a2 + a3[5]);
  *(_QWORD *)(a1 + v7) = *(_QWORD *)(a2 + v7);
  v8 = a3[7];
  v9 = *(_QWORD *)(a1 + v8 + 8);
  *(_OWORD *)(a1 + v8) = *(_OWORD *)(a2 + v8);
  swift_release(v9);
  v10 = a3[8];
  v11 = a1 + v10;
  v12 = a2 + v10;
  v13 = type metadata accessor for TopHitViewColorScheme(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 40))(v11, v12, v13);
  *(_QWORD *)(a1 + a3[9]) = *(_QWORD *)(a2 + a3[9]);
  if (a1 != a2)
  {
    v14 = a3[10];
    v15 = (void *)(a1 + v14);
    v16 = (const void *)(a2 + v14);
    sub_10001222C(a1 + v14, &qword_1000D4400);
    v17 = sub_100012E2C(&qword_1000D4400);
    if (swift_getEnumCaseMultiPayload(v16, v17) == 1)
    {
      v18 = type metadata accessor for ColorScheme(0);
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(v15, v16, v18);
      swift_storeEnumTagMultiPayload(v15, v17, 1);
    }
    else
    {
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    v19 = a3[11];
    v20 = (void *)(a1 + v19);
    v21 = (const void *)(a2 + v19);
    sub_10001222C(a1 + v19, &qword_1000D06D0);
    v22 = sub_100012E2C(&qword_1000D06D0);
    if (swift_getEnumCaseMultiPayload(v21, v22) == 1)
    {
      v23 = type metadata accessor for UserInterfaceSizeClass(0);
      if (sub_100019D44((uint64_t)v21, 1, v23))
      {
        v24 = sub_100012E2C(&qword_1000D0860);
        memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v24 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v20, v21, v23);
        sub_100015D74((uint64_t)v20, 0, 1, v23);
      }
      swift_storeEnumTagMultiPayload(v20, v22, 1);
    }
    else
    {
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for AppShortcutChiclet(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10007F590);
}

void sub_10007F590(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  sub_100081780();
  sub_1000817A4();
  if (v11)
  {
    v7 = v6;
    v8 = a1;
  }
  else
  {
    if ((_DWORD)a2 == 0x7FFFFFFF)
    {
      sub_100018388();
      return;
    }
    sub_100081788();
    sub_1000817A4();
    if (v11)
    {
      v7 = v9;
      v10 = a3[8];
    }
    else
    {
      sub_100012E2C(&qword_1000D39F8);
      sub_1000817A4();
      if (v11)
      {
        v7 = v12;
        v10 = a3[10];
      }
      else
      {
        v7 = sub_100012E2C(&qword_1000D3A00);
        v10 = a3[11];
      }
    }
    v8 = a1 + v10;
  }
  sub_10005E454(v8, a2, v7);
}

uint64_t storeEnumTagSinglePayload for AppShortcutChiclet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10007F658);
}

void sub_10007F658(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  sub_100081780();
  sub_10005E74C();
  if (v13)
  {
    v9 = v8;
    v10 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + a4[7]) = (a2 - 1);
      sub_100018388();
      return;
    }
    sub_100081788();
    sub_10005E74C();
    if (v13)
    {
      v9 = v11;
      v12 = a4[8];
    }
    else
    {
      sub_100012E2C(&qword_1000D39F8);
      sub_10005E74C();
      if (v13)
      {
        v9 = v14;
        v12 = a4[10];
      }
      else
      {
        v9 = sub_100012E2C(&qword_1000D3A00);
        v12 = a4[11];
      }
    }
    v10 = a1 + v12;
  }
  sub_10005E460(v10, a2, a2, v9);
}

void sub_10007F710(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD v10[8];

  v2 = type metadata accessor for AutoShortcutAppSection(319);
  if (v3 <= 0x3F)
  {
    v10[0] = *(_QWORD *)(v2 - 8) + 64;
    v10[1] = &unk_10009AE18;
    v10[2] = (char *)&value witness table for Builtin.Int64 + 64;
    v10[3] = (char *)&value witness table for () + 64;
    v4 = type metadata accessor for TopHitViewColorScheme(319);
    if (v5 <= 0x3F)
    {
      v10[4] = *(_QWORD *)(v4 - 8) + 64;
      v10[5] = (char *)&value witness table for Builtin.Int64 + 64;
      sub_10007F7F0(319);
      if (v7 <= 0x3F)
      {
        v10[6] = *(_QWORD *)(v6 - 8) + 64;
        sub_10007F844(319);
        if (v9 <= 0x3F)
        {
          v10[7] = *(_QWORD *)(v8 - 8) + 64;
          swift_initStructMetadata(a1, 256, 8, v10, a1 + 16);
        }
      }
    }
  }
}

void sub_10007F7F0(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000D3A70)
  {
    v2 = type metadata accessor for ColorScheme(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000D3A70);
  }
}

void sub_10007F844(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000D3A78)
  {
    v2 = sub_1000143E4(&qword_1000D0860);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000D3A78);
  }
}

unint64_t sub_10007F8A0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3AC0;
  if (!qword_1000D3AC0)
  {
    v1 = sub_1000143E4(&qword_1000D3AC8);
    sub_100004038(&qword_1000D3AD0, &qword_1000D39E8);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3AC0);
  }
  return result;
}

uint64_t *sub_10007F924(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v12);
  }
  else
  {
    v6 = a3;
    v7 = type metadata accessor for AggregatedEntry(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = *(int *)(v6 + 20);
    v9 = (char *)a1 + v8;
    v10 = (char *)a2 + v8;
    v11 = *(_QWORD *)v10;
    LOBYTE(v6) = v10[8];
    sub_10007F9C8(*(_QWORD *)v10, v6);
    *(_QWORD *)v9 = v11;
    v9[8] = v6;
  }
  return a1;
}

uint64_t sub_10007F9C8(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_retain(result);
  return result;
}

uint64_t sub_10007F9D4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AggregatedEntry(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  return sub_10007FA20(*(_QWORD *)(a1 + *(int *)(a2 + 20)), *(_BYTE *)(a1 + *(int *)(a2 + 20) + 8));
}

uint64_t sub_10007FA20(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return swift_release(result);
  return result;
}

uint64_t sub_10007FA2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v6 = type metadata accessor for AggregatedEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)v9;
  LOBYTE(a2) = *(_BYTE *)(v9 + 8);
  sub_10007F9C8(*(_QWORD *)v9, a2);
  *(_QWORD *)v8 = v10;
  *(_BYTE *)(v8 + 8) = a2;
  return a1;
}

uint64_t sub_10007FAA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v6 = type metadata accessor for AggregatedEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  v10 = *(_QWORD *)v9;
  LOBYTE(a2) = *(_BYTE *)(v9 + 8);
  sub_10007F9C8(*(_QWORD *)v9, a2);
  v11 = *(_QWORD *)v8;
  v12 = *(_BYTE *)(v8 + 8);
  *(_QWORD *)v8 = v10;
  *(_BYTE *)(v8 + 8) = a2;
  sub_10007FA20(v11, v12);
  return a1;
}

uint64_t sub_10007FB28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6 = type metadata accessor for AggregatedEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = a2 + v7;
  *(_QWORD *)v8 = *(_QWORD *)v9;
  *(_BYTE *)(v8 + 8) = *(_BYTE *)(v9 + 8);
  return a1;
}

uint64_t sub_10007FB94(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  v6 = type metadata accessor for AggregatedEntry(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = *(int *)(a3 + 20);
  v8 = a1 + v7;
  v9 = (uint64_t *)(a2 + v7);
  v10 = *v9;
  LOBYTE(v9) = *((_BYTE *)v9 + 8);
  v11 = *(_QWORD *)v8;
  v12 = *(_BYTE *)(v8 + 8);
  *(_QWORD *)v8 = v10;
  *(_BYTE *)(v8 + 8) = (_BYTE)v9;
  sub_10007FA20(v11, v12);
  return a1;
}

uint64_t sub_10007FC0C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10007FC18);
}

void sub_10007FC18(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100068E3C();
  if (*(_DWORD *)(*(_QWORD *)(v4 - 8) + 84) == (_DWORD)a2)
    sub_10005E454(a1, a2, v4);
  else
    sub_100018388();
}

uint64_t sub_10007FC7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10007FC88);
}

void sub_10007FC88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  char v8;

  sub_100068E3C();
  sub_10005E74C();
  if (v8)
  {
    sub_10005E460(a1, a2, a2, v7);
  }
  else
  {
    *(_BYTE *)(a1 + *(int *)(a4 + 20) + 8) = -(char)a2;
    sub_100018388();
  }
}

uint64_t type metadata accessor for EntryAnnotationModifier(uint64_t a1)
{
  return sub_100004954(a1, qword_1000D3B30, (uint64_t)&nominal type descriptor for EntryAnnotationModifier);
}

uint64_t sub_10007FCF8(uint64_t a1)
{
  uint64_t result;
  unint64_t v3;
  _QWORD v4[2];

  result = type metadata accessor for AggregatedEntry(319);
  if (v3 <= 0x3F)
  {
    v4[0] = *(_QWORD *)(result - 8) + 64;
    v4[1] = "\t";
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
    return 0;
  }
  return result;
}

uint64_t sub_10007FD68(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000A7C94, 1);
}

void sub_10007FD78(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  id *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void (*v30)(char *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  int v38;
  id *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  ValueMetadata *v43;
  ValueMetadata *v44;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  char *v57;
  uint64_t OpaqueTypeConformance2;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  void (*v67)(id *, uint64_t);
  id *v68;
  id v69;
  uint64_t v70;
  id v71;
  uint64_t v72;
  ValueMetadata *v73;
  ValueMetadata *v74;
  uint64_t v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  unint64_t v81;
  unint64_t v82;
  char *v83;
  uint64_t v84;
  char *v85;
  char *v86;
  unint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t, uint64_t);
  char *v96;
  char *v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  unint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  char *v109;
  char *v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  char *v121;
  uint64_t v122;
  uint64_t v123;
  id v124;
  uint64_t v125;
  uint64_t v126;
  char *v127;
  char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  ValueMetadata *v133;
  uint64_t v134;
  unint64_t v135;
  _QWORD v136[2];

  v3 = v2;
  v129 = a1;
  v130 = a2;
  v122 = sub_100012E2C(&qword_1000D3B68);
  v111 = *(_QWORD *)(v122 - 8);
  v4 = __chkstk_darwin(v122);
  v109 = (char *)&v106 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v110 = (char *)&v106 - v6;
  v125 = sub_100012E2C(&qword_1000D3B70);
  __chkstk_darwin(v125);
  v128 = (char *)&v106 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = sub_100012E2C(&qword_1000D3B78);
  __chkstk_darwin(v118);
  v119 = (char *)&v106 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = sub_100012E2C(&qword_1000D3B80);
  __chkstk_darwin(v126);
  v121 = (char *)&v106 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for AppEntityVisualState(0);
  v116 = *(_QWORD *)(v10 - 8);
  v117 = v10;
  __chkstk_darwin(v10);
  v115 = (char *)&v106 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = sub_100012E2C(&qword_1000D3B88);
  v114 = *(_QWORD *)(v120 - 8);
  v12 = __chkstk_darwin(v120);
  v112 = (char *)&v106 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v113 = (char *)&v106 - v14;
  v15 = (_QWORD *)type metadata accessor for AggregatedEntry(0);
  v123 = *(v15 - 1);
  v124 = v15;
  __chkstk_darwin(v15);
  v17 = (id *)((char *)&v106 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  v131 = sub_100012E2C(&qword_1000D3B90);
  __chkstk_darwin(v131);
  v127 = (char *)&v106 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_100012E2C(&qword_1000D3B98);
  __chkstk_darwin(v19);
  v21 = (char *)&v106 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = sub_100012E2C(&qword_1000D3BA0);
  v23 = *(_QWORD *)(v22 - 8);
  __chkstk_darwin(v22);
  v25 = (char *)&v106 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = v3;
  v27 = v3 + *(int *)(type metadata accessor for EntryAnnotationModifier(0) + 20);
  v28 = *(_QWORD *)v27;
  v29 = *(_BYTE *)(v27 + 8);
  sub_10007F9C8(*(_QWORD *)v27, v29);
  LOBYTE(v3) = sub_100080A34(v28, v29);
  sub_10007FA20(v28, v29);
  if ((v3 & 1) != 0)
  {
    v30 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
    v30(v25, v129, v22);
    v30(v21, (uint64_t)v25, v22);
    swift_storeEnumTagMultiPayload(v21, v19, 0);
    sub_100004038(&qword_1000D3BB0, &qword_1000D3BA0);
    v32 = v31;
    v33 = sub_100080CFC();
    _ConditionalContent<>.init(storage:)(v21, v22, v131, v32, v33);
    (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v22);
    return;
  }
  v34 = v25;
  v35 = v129;
  v107 = v19;
  v108 = v21;
  v36 = v123;
  v37 = v124;
  (*(void (**)(id *, uint64_t, id))(v123 + 16))(v17, v26, v124);
  v38 = (*(uint64_t (**)(id *, id))(v36 + 88))(v17, v37);
  v39 = v17;
  v40 = v36;
  if (v38 == enum case for AggregatedEntry.userShortcut(_:))
  {
    (*(void (**)(id *, id))(v36 + 96))(v17, v37);
    v41 = *v17;
    v124 = v41;
    v42 = WFDatabaseObjectDescriptor.id.getter(v41);
    v44 = v43;

    v132 = v42;
    v133 = v44;
    v136[0] = _swiftEmptyArrayStorage;
    sub_1000040A8(&qword_1000D21B0, (uint64_t (*)(uint64_t))&type metadata accessor for AppEntityVisualState);
    v45 = sub_100012E2C((uint64_t *)&unk_1000D4480);
    sub_100004038(&qword_1000D21B8, (uint64_t *)&unk_1000D4480);
    v46 = v115;
    v47 = v117;
    dispatch thunk of SetAlgebra.init<A>(_:)(v136, v45, v48);
    sub_100004038(&qword_1000D3BB0, &qword_1000D3BA0);
    v50 = v49;
    v51 = sub_100015DA4();
    v52 = v112;
    v53 = v22;
    View.appEntity<A>(entityType:identifier:state:)(&type metadata for WorkflowEntity, &v132, v46, v22, &type metadata for WorkflowEntity, v50, v51);
    (*(void (**)(char *, uint64_t))(v116 + 8))(v46, v47);
    swift_bridgeObjectRelease();
    v54 = v114;
    v55 = v113;
    v56 = v120;
    (*(void (**)(char *, char *, uint64_t))(v114 + 32))(v113, v52, v120);
    v57 = v119;
    (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v119, v55, v56);
    swift_storeEnumTagMultiPayload(v57, v118, 0);
    v132 = v53;
    v133 = &type metadata for WorkflowEntity;
    v134 = v50;
    v135 = v51;
    OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(&v132, &opaque type descriptor for <<opaque return type of View.appEntity<A>(entityType:identifier:state:)>>, 1);
    v59 = type metadata accessor for AppShortcutEntity(255);
    sub_1000040A8(&qword_1000D3BB8, (uint64_t (*)(uint64_t))&type metadata accessor for AppShortcutEntity);
    v132 = v53;
    v133 = (ValueMetadata *)v59;
    v60 = v53;
    v134 = v50;
    v135 = v61;
    v62 = swift_getOpaqueTypeConformance2(&v132, &opaque type descriptor for <<opaque return type of View.appEntity<A>(entityType:identifier:state:)>>, 1);
    v63 = (uint64_t)v121;
    _ConditionalContent<>.init(storage:)(v57, v56, v122, OpaqueTypeConformance2, v62);
    v64 = (uint64_t)v128;
    sub_100081720(v63, (uint64_t)v128, &qword_1000D3B80);
    swift_storeEnumTagMultiPayload(v64, v125, 0);
    v65 = sub_100080BEC();
    v66 = (uint64_t)v127;
    _ConditionalContent<>.init(storage:)(v64, v126, v60, v65, v50);

    sub_10001222C(v63, &qword_1000D3B80);
    v67 = *(void (**)(id *, uint64_t))(v54 + 8);
    v68 = (id *)v55;
  }
  else
  {
    if (v38 != enum case for AggregatedEntry.appShortcut(_:))
    {
      v94 = v23;
      v95 = *(void (**)(char *, uint64_t, uint64_t))(v23 + 16);
      v96 = v34;
      v97 = v34;
      v60 = v22;
      v95(v97, v35, v22);
      v98 = (uint64_t)v128;
      v95(v128, (uint64_t)v96, v22);
      swift_storeEnumTagMultiPayload(v98, v125, 1);
      v99 = sub_100080BEC();
      sub_100004038(&qword_1000D3BB0, &qword_1000D3BA0);
      v66 = (uint64_t)v127;
      _ConditionalContent<>.init(storage:)(v98, v126, v60, v99, v100);
      (*(void (**)(char *, uint64_t))(v94 + 8))(v96, v60);
      v67 = *(void (**)(id *, uint64_t))(v40 + 8);
      v68 = v39;
      v93 = (uint64_t)v37;
      goto LABEL_9;
    }
    (*(void (**)(id *, id))(v36 + 96))(v17, v37);
    v124 = *v17;
    v69 = v124;
    v70 = type metadata accessor for AppShortcutEntity(0);
    v71 = objc_msgSend(v69, "id");
    v72 = static String._unconditionallyBridgeFromObjectiveC(_:)(v71);
    v74 = v73;

    v132 = v72;
    v133 = v74;
    v136[0] = _swiftEmptyArrayStorage;
    sub_1000040A8(&qword_1000D21B0, (uint64_t (*)(uint64_t))&type metadata accessor for AppEntityVisualState);
    v75 = sub_100012E2C((uint64_t *)&unk_1000D4480);
    sub_100004038(&qword_1000D21B8, (uint64_t *)&unk_1000D4480);
    v76 = v115;
    v77 = v117;
    dispatch thunk of SetAlgebra.init<A>(_:)(v136, v75, v78);
    sub_100004038(&qword_1000D3BB0, &qword_1000D3BA0);
    v80 = v79;
    sub_1000040A8(&qword_1000D3BB8, (uint64_t (*)(uint64_t))&type metadata accessor for AppShortcutEntity);
    v82 = v81;
    v83 = v109;
    v60 = v22;
    View.appEntity<A>(entityType:identifier:state:)(v70, &v132, v76, v22, v70, v80, v81);
    (*(void (**)(char *, uint64_t))(v116 + 8))(v76, v77);
    swift_bridgeObjectRelease();
    v84 = v111;
    v85 = v110;
    v56 = v122;
    (*(void (**)(char *, char *, uint64_t))(v111 + 32))(v110, v83, v122);
    v86 = v119;
    (*(void (**)(char *, char *, uint64_t))(v84 + 16))(v119, v85, v56);
    swift_storeEnumTagMultiPayload(v86, v118, 1);
    v87 = sub_100015DA4();
    v132 = v60;
    v133 = &type metadata for WorkflowEntity;
    v134 = v80;
    v135 = v87;
    v88 = swift_getOpaqueTypeConformance2(&v132, &opaque type descriptor for <<opaque return type of View.appEntity<A>(entityType:identifier:state:)>>, 1);
    v132 = v60;
    v133 = (ValueMetadata *)v70;
    v134 = v80;
    v135 = v82;
    v89 = swift_getOpaqueTypeConformance2(&v132, &opaque type descriptor for <<opaque return type of View.appEntity<A>(entityType:identifier:state:)>>, 1);
    v90 = (uint64_t)v121;
    _ConditionalContent<>.init(storage:)(v86, v120, v56, v88, v89);
    v91 = (uint64_t)v128;
    sub_100081720(v90, (uint64_t)v128, &qword_1000D3B80);
    swift_storeEnumTagMultiPayload(v91, v125, 0);
    v92 = sub_100080BEC();
    v66 = (uint64_t)v127;
    _ConditionalContent<>.init(storage:)(v91, v126, v60, v92, v80);

    sub_10001222C(v90, &qword_1000D3B80);
    v67 = *(void (**)(id *, uint64_t))(v84 + 8);
    v68 = (id *)v85;
  }
  v93 = v56;
LABEL_9:
  v67(v68, v93);
  v101 = v131;
  v102 = (uint64_t)v108;
  sub_100081720(v66, (uint64_t)v108, &qword_1000D3B90);
  swift_storeEnumTagMultiPayload(v102, v107, 1);
  sub_100004038(&qword_1000D3BB0, &qword_1000D3BA0);
  v104 = v103;
  v105 = sub_100080CFC();
  _ConditionalContent<>.init(storage:)(v102, v60, v101, v104, v105);
  sub_10001222C(v66, &qword_1000D3B90);
}

void sub_100080804(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  __n128 v18;
  _QWORD v19[2];
  uint64_t v20;
  uint64_t v21;

  v2 = v1;
  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100012E2C(&qword_1000D06D0);
  __chkstk_darwin(v8);
  v10 = (_QWORD *)((char *)v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_100081720(v2, (uint64_t)v10, &qword_1000D06D0);
  if (swift_getEnumCaseMultiPayload(v10, v8) == 1)
  {
    sub_100081678((uint64_t)v10, a1, &qword_1000D0860);
  }
  else
  {
    v11 = *v10;
    v12 = static os_log_type_t.fault.getter();
    v13 = static Log.runtimeIssuesLog.getter();
    v14 = v12;
    if (os_log_type_enabled(v13, v12))
    {
      v15 = (uint8_t *)swift_slowAlloc(12, -1);
      v16 = swift_slowAlloc(32, -1);
      v19[1] = a1;
      v17 = v16;
      v21 = v16;
      *(_DWORD *)v15 = 136315138;
      v20 = sub_100015868(0xD000000000000020, 0x800000010009EB20, &v21);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v20, &v21, v15 + 4, v15 + 12);
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
      swift_arrayDestroy(v17, 1, (char *)&type metadata for Any + 8);
      swift_slowDealloc(v17, -1, -1);
      swift_slowDealloc(v15, -1, -1);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v7, v11);
    v18 = swift_release(v11);
    (*(void (**)(char *, uint64_t, __n128))(v5 + 8))(v7, v4, v18);
  }
}

uint64_t sub_100080A34(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  os_log_type_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;

  v4 = type metadata accessor for EnvironmentValues(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return a1 & 1;
  v8 = swift_retain(a1);
  v9 = static os_log_type_t.fault.getter(v8);
  v10 = static Log.runtimeIssuesLog.getter();
  v11 = v9;
  if (os_log_type_enabled(v10, v9))
  {
    v12 = (uint8_t *)swift_slowAlloc(12, -1);
    v13 = swift_slowAlloc(32, -1);
    v16 = v13;
    *(_DWORD *)v12 = 136315138;
    v15 = sub_100015868(1819242306, 0xE400000000000000, &v16);
    UnsafeMutableRawBufferPointer.copyMemory(from:)(&v15, &v16, v12 + 4, v12 + 12);
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
    swift_arrayDestroy(v13, 1, (char *)&type metadata for Any + 8);
    swift_slowDealloc(v13, -1, -1);
    swift_slowDealloc(v12, -1, -1);
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath(v7, a1);
  sub_10007FA20(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v16;
}

unint64_t sub_100080BEC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  ValueMetadata *v8;
  uint64_t v9;
  unint64_t v10;

  result = qword_1000D3BA8;
  if (!qword_1000D3BA8)
  {
    v1 = sub_1000143E4(&qword_1000D3B80);
    v2 = sub_1000143E4(&qword_1000D3BA0);
    sub_100004038(&qword_1000D3BB0, &qword_1000D3BA0);
    v4 = v3;
    v7 = v2;
    v8 = &type metadata for WorkflowEntity;
    v9 = v3;
    v10 = sub_100015DA4();
    swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of View.appEntity<A>(entityType:identifier:state:)>>, 1);
    v5 = type metadata accessor for AppShortcutEntity(255);
    sub_1000040A8(&qword_1000D3BB8, (uint64_t (*)(uint64_t))&type metadata accessor for AppShortcutEntity);
    v7 = v2;
    v8 = (ValueMetadata *)v5;
    v9 = v4;
    v10 = v6;
    swift_getOpaqueTypeConformance2(&v7, &opaque type descriptor for <<opaque return type of View.appEntity<A>(entityType:identifier:state:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3BA8);
  }
  return result;
}

unint64_t sub_100080CFC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3BC0;
  if (!qword_1000D3BC0)
  {
    v1 = sub_1000143E4(&qword_1000D3B90);
    sub_100080BEC();
    sub_100004038(&qword_1000D3BB0, &qword_1000D3BA0);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3BC0);
  }
  return result;
}

uint64_t sub_100080D80@<X0>(uint64_t a1@<X8>)
{
  return sub_100080DAC(&qword_1000D3C88, (uint64_t (*)(_QWORD))&type metadata accessor for ContentSizeCategory, 0xD000000000000013, 0x800000010009EB50, a1);
}

uint64_t sub_100080DAC@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  os_log_type_t v20;
  NSObject *v21;
  uint8_t *v22;
  uint64_t v23;
  __n128 v24;
  uint64_t v26;
  uint64_t v27;

  v11 = v5;
  v13 = type metadata accessor for EnvironmentValues(0);
  v14 = *(_QWORD *)(v13 - 8);
  __chkstk_darwin(v13);
  sub_1000184A0();
  v15 = sub_100012E2C(a1);
  sub_100018044();
  __chkstk_darwin(v16);
  sub_100018470();
  sub_100081720(v11, (uint64_t)v7, a1);
  if (swift_getEnumCaseMultiPayload(v7, v15) == 1)
  {
    v17 = a2(0);
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(a5, v7, v17);
  }
  else
  {
    v19 = *v7;
    v20 = static os_log_type_t.fault.getter();
    v21 = static Log.runtimeIssuesLog.getter();
    if (os_log_type_enabled(v21, v20))
    {
      v22 = (uint8_t *)swift_slowAlloc(12, -1);
      v23 = swift_slowAlloc(32, -1);
      v27 = v23;
      *(_DWORD *)v22 = 136315138;
      v26 = sub_100015868(a3, a4, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)(&v26, &v27, v22 + 4, v22 + 12);
      _os_log_impl((void *)&_mh_execute_header, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v22, 0xCu);
      swift_arrayDestroy(v23, 1, (char *)&type metadata for Any + 8);
      sub_100026ACC(v23);
      sub_100026ACC((uint64_t)v22);
    }

    EnvironmentValues.init()();
    swift_getAtKeyPath(v6, v19);
    v24 = swift_release(v19);
    return (*(uint64_t (**)(uint64_t, uint64_t, __n128))(v14 + 8))(v6, v13, v24);
  }
}

uint64_t sub_100080FB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AppShortcutChiclet(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100080FF4()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = (int *)sub_1000817B4();
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  v6 = sub_100081780();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v0 + v4, v6);
  swift_release(*(_QWORD *)(v0 + v4 + v1[7] + 8));
  v7 = sub_100081788();
  sub_100081754(v7);
  v8 = (_QWORD *)(v0 + v4 + v1[10]);
  v9 = sub_100012E2C(&qword_1000D4400);
  if (swift_getEnumCaseMultiPayload(v8, v9) == 1)
  {
    v10 = type metadata accessor for ColorScheme(0);
    sub_100081754(v10);
  }
  else
  {
    swift_release(*v8);
  }
  v11 = (_QWORD *)(v0 + v4 + v1[11]);
  v12 = sub_100012E2C(&qword_1000D06D0);
  if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
  {
    v13 = type metadata accessor for UserInterfaceSizeClass(0);
    if (!sub_100019D44((uint64_t)v11, 1, v13))
      (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v11, v13);
  }
  else
  {
    swift_release(*v11);
  }
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

void sub_100081130(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;

  type metadata accessor for AppShortcutChiclet(0);
  sub_1000507D8();
  sub_10007E140(a1, v2 + v5, a2);
}

unint64_t sub_100081170()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3C18;
  if (!qword_1000D3C18)
  {
    v1 = sub_1000143E4(&qword_1000D3C08);
    sub_100004038(&qword_1000D3C20, &qword_1000D3C28);
    sub_1000040A8(&qword_1000D3C30, type metadata accessor for EntryAnnotationModifier);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3C18);
  }
  return result;
}

uint64_t sub_10008120C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_10007DEB4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_100081218()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3C48;
  if (!qword_1000D3C48)
  {
    v1 = sub_1000143E4(&qword_1000D3C40);
    sub_100004038(&qword_1000D1FF8, &qword_1000D2000);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3C48);
  }
  return result;
}

unint64_t sub_1000812A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3C50;
  if (!qword_1000D3C50)
  {
    v1 = sub_1000143E4(&qword_1000D3BE8);
    sub_100004038(&qword_1000D3C58, &qword_1000D3BE0);
    sub_100004038(&qword_1000D1FF0, &qword_1000D42D0);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3C50);
  }
  return result;
}

void sub_100081340()
{
  uint64_t *v0;

  *v0 = sub_1000817CC();
  sub_100018188();
}

void sub_10008135C()
{
  uint64_t *v0;

  *v0 = sub_1000817CC();
  sub_100018188();
}

void sub_100081378(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  EnvironmentValues.foregroundColor.setter(v1);
  sub_100018188();
}

uint64_t sub_1000813A0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = sub_100068E3C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  return swift_deallocObject(v0, v5, v6);
}

uint64_t sub_1000813FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  sub_100068E3C();
  sub_1000507D8();
  return sub_10007E59C(v1 + v3, a1);
}

uint64_t sub_100081428()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  __n128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;

  v1 = (int *)sub_1000817B4();
  v2 = *((_QWORD *)v1 - 1);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v21 = *(_QWORD *)(v2 + 64);
  v5 = sub_100068E3C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = sub_100081780();
  sub_100081754(v9);
  swift_release(*(_QWORD *)(v0 + v4 + v1[7] + 8));
  v10 = sub_100081788();
  sub_100081790(v10);
  v11 = (_QWORD *)(v0 + v4 + v1[10]);
  v12 = sub_100012E2C(&qword_1000D4400);
  if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
  {
    v13 = type metadata accessor for ColorScheme(0);
    sub_100081790(v13);
  }
  else
  {
    swift_release(*v11);
  }
  v14 = (_QWORD *)(v0 + v4 + v1[11]);
  v15 = sub_100012E2C(&qword_1000D06D0);
  if (swift_getEnumCaseMultiPayload(v14, v15) == 1)
  {
    v16 = type metadata accessor for UserInterfaceSizeClass(0);
    if (!sub_100019D44((uint64_t)v14, 1, v16))
      (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v14, v16);
  }
  else
  {
    v17 = swift_release(*v14);
  }
  v18 = (v4 + v21 + v7) & ~v7;
  v19 = v18 + v8;
  (*(void (**)(uint64_t, uint64_t, __n128))(v6 + 8))(v0 + v18, v5, v17);
  return swift_deallocObject(v0, v19, v3 | v7 | 7);
}

uint64_t sub_1000815A8()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(type metadata accessor for AppShortcutChiclet(0) - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_100068E3C() - 8) + 80);
  return sub_10007E69C(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

void sub_100081604(_BYTE *a1@<X8>)
{
  *a1 = EnvironmentValues.isLockedByAppProtection.getter() & 1;
  sub_100018188();
}

void sub_10008162C(unsigned __int8 *a1)
{
  EnvironmentValues.isLockedByAppProtection.setter(*a1);
  sub_100018188();
}

void sub_10008164C(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v3;

  v3 = a3(0);
  sub_100081768(v3);
  sub_100018188();
}

void sub_100081678(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;

  v3 = sub_10005E73C(a1, a2, a3);
  sub_100081768(v3);
  sub_100018188();
}

unint64_t sub_10008169C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3C78;
  if (!qword_1000D3C78)
  {
    v1 = sub_1000143E4(&qword_1000D3C80);
    sub_100004038(&qword_1000D3BB0, &qword_1000D3BA0);
    sub_100080CFC();
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3C78);
  }
  return result;
}

void sub_100081720(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v5 = sub_10005E73C(a1, a2, a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(v3, v4, v5);
  sub_100018188();
}

uint64_t sub_100081754(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_100081768(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 32))(v1, v2, a1);
}

uint64_t sub_100081780()
{
  return type metadata accessor for AutoShortcutAppSection(0);
}

uint64_t sub_100081788()
{
  return type metadata accessor for TopHitViewColorScheme(0);
}

uint64_t sub_100081790(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t sub_1000817B4()
{
  return type metadata accessor for AppShortcutChiclet(0);
}

uint64_t sub_1000817BC(uint64_t a1)
{
  uint64_t v1;

  return swift_storeEnumTagMultiPayload(v1, a1, 0);
}

uint64_t sub_1000817CC()
{
  return EnvironmentValues.foregroundColor.getter();
}

_QWORD *sub_1000817D8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v4;
  int v5;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v19 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain(v19);
  }
  else
  {
    v7 = (void *)a2[1];
    *a1 = *a2;
    a1[1] = v7;
    v8 = *(int *)(a3 + 20);
    v9 = (_QWORD *)((char *)a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = *(_QWORD *)((char *)a2 + v8);
    v12 = *(_QWORD *)((char *)a2 + v8 + 8);
    *v9 = v11;
    v9[1] = v12;
    v13 = v7;
    swift_retain(v11);
    swift_retain(v12);
    v14 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
    v15 = (char *)v9 + v14;
    v16 = &v10[v14];
    v17 = type metadata accessor for AutoShortcutApp(0);
    if (sub_100019D44((uint64_t)v16, 1, v17))
    {
      v18 = sub_100012E2C((uint64_t *)&unk_1000D4470);
      memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
      sub_100015D74((uint64_t)v15, 0, 1, v17);
    }
    *((_BYTE *)v4 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  }
  return v4;
}

uint64_t sub_100081908(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v4 = (_QWORD *)(a1 + *(int *)(a2 + 20));
  swift_release(*v4);
  swift_release(v4[1]);
  v5 = (uint64_t)v4 + *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v6 = type metadata accessor for AutoShortcutApp(0);
  result = sub_100019D44(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return result;
}

_QWORD *sub_100081998(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = (void *)a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (char *)a2 + v7;
  v10 = *(_QWORD *)((char *)a2 + v7);
  v11 = *(_QWORD *)((char *)a2 + v7 + 8);
  *v8 = v10;
  v8[1] = v11;
  v12 = v6;
  swift_retain(v10);
  swift_retain(v11);
  v13 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v14 = (char *)v8 + v13;
  v15 = &v9[v13];
  v16 = type metadata accessor for AutoShortcutApp(0);
  if (sub_100019D44((uint64_t)v15, 1, v16))
  {
    v17 = sub_100012E2C((uint64_t *)&unk_1000D4470);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
    sub_100015D74((uint64_t)v14, 0, 1, v16);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_100081A9C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  *a1 = *a2;
  v6 = (void *)a2[1];
  v7 = (void *)a1[1];
  a1[1] = v6;
  v8 = v6;

  v9 = *(int *)(a3 + 20);
  v10 = (char *)a1 + v9;
  v11 = (char *)a2 + v9;
  v12 = *(_QWORD *)((char *)a1 + v9);
  v13 = *(_QWORD *)((char *)a2 + v9);
  *(_QWORD *)((char *)a1 + v9) = v13;
  swift_retain(v13);
  swift_release(v12);
  v14 = *((_QWORD *)v11 + 1);
  v15 = *((_QWORD *)v10 + 1);
  *((_QWORD *)v10 + 1) = v14;
  swift_retain(v14);
  swift_release(v15);
  v16 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v17 = &v10[v16];
  v18 = &v11[v16];
  v19 = type metadata accessor for AutoShortcutApp(0);
  v20 = sub_100019D44((uint64_t)v17, 1, v19);
  v21 = sub_100019D44((uint64_t)v18, 1, v19);
  if (!v20)
  {
    v22 = *(_QWORD *)(v19 - 8);
    if (!v21)
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 24))(v17, v18, v19);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v22 + 8))(v17, v19);
    goto LABEL_6;
  }
  if (v21)
  {
LABEL_6:
    v23 = sub_100012E2C((uint64_t *)&unk_1000D4470);
    memcpy(v17, v18, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  sub_100015D74((uint64_t)v17, 0, 1, v19);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_OWORD *sub_100081C10(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (_QWORD *)((char *)a1 + v6);
  v8 = (char *)a2 + v6;
  v9 = *(_QWORD *)((char *)a2 + v6 + 8);
  *v7 = *(_QWORD *)((char *)a2 + v6);
  v7[1] = v9;
  v10 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v11 = (char *)v7 + v10;
  v12 = &v8[v10];
  v13 = type metadata accessor for AutoShortcutApp(0);
  if (sub_100019D44((uint64_t)v12, 1, v13))
  {
    v14 = sub_100012E2C((uint64_t *)&unk_1000D4470);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
    sub_100015D74((uint64_t)v11, 0, 1, v13);
  }
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

_QWORD *sub_100081CF8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a2[1];
  v7 = (void *)a1[1];
  *a1 = *a2;
  a1[1] = v6;

  v8 = *(int *)(a3 + 20);
  v9 = (char *)a1 + v8;
  v10 = (char *)a2 + v8;
  v11 = *(_QWORD *)((char *)a1 + v8);
  *(_QWORD *)((char *)a1 + v8) = *(_QWORD *)((char *)a2 + v8);
  swift_release(v11);
  v12 = *((_QWORD *)v9 + 1);
  *((_QWORD *)v9 + 1) = *((_QWORD *)v10 + 1);
  swift_release(v12);
  v13 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v14 = &v9[v13];
  v15 = &v10[v13];
  v16 = type metadata accessor for AutoShortcutApp(0);
  v17 = sub_100019D44((uint64_t)v14, 1, v16);
  v18 = sub_100019D44((uint64_t)v15, 1, v16);
  if (!v17)
  {
    v19 = *(_QWORD *)(v16 - 8);
    if (!v18)
    {
      (*(void (**)(char *, char *, uint64_t))(v19 + 40))(v14, v15, v16);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v16);
    goto LABEL_6;
  }
  if (v18)
  {
LABEL_6:
    v20 = sub_100012E2C((uint64_t *)&unk_1000D4470);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v14, v15, v16);
  sub_100015D74((uint64_t)v14, 0, 1, v16);
LABEL_7:
  *((_BYTE *)a1 + *(int *)(a3 + 24)) = *((_BYTE *)a2 + *(int *)(a3 + 24));
  return a1;
}

uint64_t sub_100081E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100081E5C);
}

void sub_100081E5C()
{
  uint64_t v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100086398();
  if (v1)
  {
    sub_10005E5A0(*(_QWORD *)(v0 + 8));
    sub_100018388();
  }
  else
  {
    sub_100012E2C(&qword_1000D3C90);
    v2 = sub_1000863A8();
    sub_10005E454(v2, v3, v4);
  }
}

uint64_t sub_100081EA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100081EB0);
}

void sub_100081EB0()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_100086364();
  if (v3)
  {
    *(_QWORD *)(v1 + 8) = (v0 - 1);
    sub_100018388();
  }
  else
  {
    v4 = v2;
    sub_100012E2C(&qword_1000D3C90);
    v5 = sub_100086378(*(int *)(v4 + 20));
    sub_10005E460(v5, v6, v7, v8);
  }
}

uint64_t type metadata accessor for AutoShortcutsAppGrid(uint64_t a1)
{
  return sub_100004954(a1, (uint64_t *)&unk_1000D3CF0, (uint64_t)&nominal type descriptor for AutoShortcutsAppGrid);
}

void sub_100081F10(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[3];

  v4[0] = &unk_10009AF68;
  sub_100081F8C(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    v4[2] = &unk_10009AF80;
    swift_initStructMetadata(a1, 256, 3, v4, a1 + 16);
  }
}

void sub_100081F8C(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000D3D00)
  {
    v2 = sub_1000143E4((uint64_t *)&unk_1000D4470);
    v3 = type metadata accessor for Binding(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000D3D00);
  }
}

uint64_t sub_100081FE4(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000A7D44, 1);
}

void sub_100081FF4(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
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

  v32 = a1;
  v33 = type metadata accessor for AppListView(0);
  sub_100018034();
  __chkstk_darwin(v2);
  v4 = (uint64_t *)((char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  v31 = sub_100012E2C(&qword_1000D3D38);
  sub_100018034();
  __chkstk_darwin(v5);
  v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_100086388();
  sub_100018034();
  v10 = __chkstk_darwin(v9);
  v12 = (uint64_t *)((char *)&v30 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  __chkstk_darwin(v10);
  v14 = (char *)&v30 - v13;
  v15 = *(unsigned __int8 *)(v1 + *(int *)(type metadata accessor for AutoShortcutsAppGrid(0) + 24));
  v16 = *(id *)(v1 + 8);
  v17 = dispatch thunk of AutoShortcutsAppsDataSource.autoShortcutApps.getter();

  v18 = sub_100012E2C(&qword_1000D3C90);
  if (v15 == 1)
  {
    Binding.projectedValue.getter(v18);
    *v12 = v17;
    v19 = (uint64_t *)((char *)v12 + *(int *)(v8 + 24));
    *v19 = swift_getKeyPath(&unk_10009AFE8);
    v20 = sub_100012E2C(&qword_1000D3C88);
    swift_storeEnumTagMultiPayload(v19, v20, 0);
    v21 = type metadata accessor for AppGridView;
    sub_10005DDA0((uint64_t)v12, (uint64_t)v14, type metadata accessor for AppGridView);
    sub_1000863BC((uint64_t)v14);
    swift_storeEnumTagMultiPayload(v7, v31, 0);
    sub_1000040A8(&qword_1000D3D40, type metadata accessor for AppGridView);
    v23 = v22;
    sub_1000040A8(&qword_1000D3D48, type metadata accessor for AppListView);
    _ConditionalContent<>.init(storage:)(v7, v8, v33, v23, v24);
    v25 = (uint64_t)v14;
  }
  else
  {
    v26 = v33;
    Binding.projectedValue.getter(v18);
    *v4 = v17;
    v21 = type metadata accessor for AppListView;
    sub_1000863BC((uint64_t)v4);
    swift_storeEnumTagMultiPayload(v7, v31, 1);
    sub_1000040A8(&qword_1000D3D40, type metadata accessor for AppGridView);
    v28 = v27;
    sub_1000040A8(&qword_1000D3D48, type metadata accessor for AppListView);
    _ConditionalContent<>.init(storage:)(v7, v8, v26, v28, v29);
    v25 = (uint64_t)v4;
  }
  sub_10005B8C8(v25, v21);
}

uint64_t type metadata accessor for AppListView(uint64_t a1)
{
  return sub_100004954(a1, qword_1000D3DA8, (uint64_t)&nominal type descriptor for AppListView);
}

uint64_t type metadata accessor for AppGridView(uint64_t a1)
{
  return sub_100004954(a1, (uint64_t *)&unk_1000D3E40, (uint64_t)&nominal type descriptor for AppGridView);
}

uint64_t sub_1000822BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v25[16];
  uint64_t v26;
  int v27;

  v3 = type metadata accessor for PinnedScrollableViews(0);
  __chkstk_darwin(v3);
  v5 = &v25[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_100012E2C(&qword_1000D3E98);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v25[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_100082484();
  v11 = static HorizontalAlignment.leading.getter();
  v26 = v1;
  v27 = 0;
  sub_1000040A8(&qword_1000D3EA0, (uint64_t (*)(uint64_t))&type metadata accessor for PinnedScrollableViews);
  dispatch thunk of OptionSet.init(rawValue:)(&v27, v3, v12);
  v13 = sub_100012E2C(&qword_1000D3EA8);
  v14 = sub_100085908();
  v15 = LazyVGrid.init(columns:alignment:spacing:pinnedViews:content:)(v10, v11, 0x4024000000000000, 0, v5, sub_100085900, v25, v13, v14);
  LOBYTE(v13) = static Edge.Set.vertical.getter(v15);
  v16 = EdgeInsets.init(_all:)(1.0);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v7 + 16))(a1, v9, v6);
  v23 = a1 + *(int *)(sub_100012E2C(&qword_1000D3ED0) + 36);
  *(_BYTE *)v23 = v13;
  *(double *)(v23 + 8) = v16;
  *(_QWORD *)(v23 + 16) = v18;
  *(_QWORD *)(v23 + 24) = v20;
  *(_QWORD *)(v23 + 32) = v22;
  *(_BYTE *)(v23 + 40) = 0;
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100082484()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  BOOL v11;
  void (*v12)(char *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(__int128 *, uint64_t, uint64_t);
  __int128 v22;

  v0 = type metadata accessor for GridItem.Size(0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  v3 = (__int128 *)((char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = type metadata accessor for ContentSizeCategory(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v22 - v9;
  type metadata accessor for AppGridView(0);
  sub_100080D80((uint64_t)v10);
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v8, enum case for ContentSizeCategory.accessibilityLarge(_:), v4);
  v11 = sub_1000834E8((uint64_t)v10, (uint64_t)v8);
  v12 = *(void (**)(char *, uint64_t))(v5 + 8);
  v12(v8, v4);
  v12(v10, v4);
  v13 = sub_100012E2C(&qword_1000D3F28);
  v14 = *(_QWORD *)(type metadata accessor for GridItem(0) - 8);
  v15 = *(_QWORD *)(v14 + 72);
  v16 = *(unsigned __int8 *)(v14 + 80);
  v17 = (v16 + 32) & ~v16;
  if (v11)
  {
    v18 = swift_allocObject(v13, v17 + v15, v16 | 7);
    *(_OWORD *)(v18 + 16) = xmmword_100096E80;
    *v3 = xmmword_10009AF40;
    (*(void (**)(__int128 *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for GridItem.Size.flexible(_:), v0);
  }
  else
  {
    v18 = swift_allocObject(v13, v17 + 2 * v15, v16 | 7);
    *(_OWORD *)(v18 + 16) = xmmword_100096F60;
    v22 = xmmword_10009AF40;
    *v3 = xmmword_10009AF40;
    v19 = enum case for GridItem.Size.flexible(_:);
    v20 = *(void (**)(__int128 *, uint64_t, uint64_t))(v1 + 104);
    v20(v3, enum case for GridItem.Size.flexible(_:), v0);
    GridItem.init(_:spacing:alignment:)(v3, 0, 1, 0, 0, 1);
    *v3 = v22;
    v20(v3, v19, v0);
  }
  GridItem.init(_:spacing:alignment:)(v3, 0, 1, 0, 0, 1);
  return v18;
}

uint64_t sub_1000826E4(uint64_t *a1)
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t OpaqueTypeConformance2;
  uint64_t v18;
  _QWORD v21[4];
  uint64_t v22;

  v2 = type metadata accessor for AppGridView(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  __chkstk_darwin(v2);
  v22 = *a1;
  v5 = v22;
  sub_10005B888((uint64_t)a1, (uint64_t)&v21[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AppGridView);
  v6 = *(unsigned __int8 *)(v3 + 80);
  v7 = (v6 + 16) & ~v6;
  v8 = swift_allocObject(&unk_1000C37A0, v7 + v4, v6 | 7);
  sub_10005DDA0((uint64_t)&v21[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v8 + v7, type metadata accessor for AppGridView);
  swift_bridgeObjectRetain(v5);
  v9 = sub_100012E2C(&qword_1000D3ED8);
  v10 = sub_100012E2C(&qword_1000D3EE0);
  sub_100004038(&qword_1000D3EE8, &qword_1000D3ED8);
  v12 = v11;
  v13 = sub_1000143E4(&qword_1000D3EB8);
  sub_100004038(&qword_1000D3EC0, &qword_1000D3EB8);
  v15 = v14;
  v16 = sub_1000859C8();
  v21[0] = v13;
  v21[1] = &type metadata for AppItemButtonStyle;
  v21[2] = v15;
  v21[3] = v16;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v21, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
  sub_1000040A8(&qword_1000D3EF0, (uint64_t (*)(uint64_t))&type metadata accessor for AutoShortcutApp);
  return ForEach<>.init(_:content:)(&v22, sub_100085AF8, v8, v9, &type metadata for String, v10, v12, OpaqueTypeConformance2, v18);
}

uint64_t sub_1000828A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  uint64_t v14;
  char *v15;
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
  uint64_t OpaqueTypeConformance2;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v38[16];
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];

  v34 = a1;
  v37 = a3;
  v4 = type metadata accessor for AutoShortcutApp(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  __chkstk_darwin(v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AppGridView(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  __chkstk_darwin(v8);
  v11 = (char *)&v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100012E2C(&qword_1000D3EB8);
  v13 = *(_QWORD *)(v12 - 8);
  v35 = v12;
  v36 = v13;
  __chkstk_darwin(v12);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005B888(a2, (uint64_t)v11, type metadata accessor for AppGridView);
  v16 = v34;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v34, v4);
  v17 = *(unsigned __int8 *)(v9 + 80);
  v18 = (v17 + 16) & ~v17;
  v19 = *(unsigned __int8 *)(v5 + 80);
  v20 = (v10 + v19 + v18) & ~v19;
  v21 = swift_allocObject(&unk_1000C37C8, v20 + v6, v17 | v19 | 7);
  sub_10005DDA0((uint64_t)v11, v21 + v18, type metadata accessor for AppGridView);
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 32))(v21 + v20, v7, v4);
  v39 = v16;
  v40 = a2;
  v22 = sub_100012E2C(&qword_1000D3EF8);
  v23 = sub_1000143E4(&qword_1000D3F00);
  v24 = type metadata accessor for NavigationDestinationEntity(255);
  sub_100004038(&qword_1000D3F08, &qword_1000D3F00);
  v26 = v25;
  sub_1000040A8(&qword_1000D0648, type metadata accessor for NavigationDestinationEntity);
  v41[0] = v23;
  v41[1] = v24;
  v41[2] = v26;
  v41[3] = v27;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v41, &opaque type descriptor for <<opaque return type of View.appEntity<A>(_:state:)>>, 1);
  Button.init(action:label:)(sub_100085C58, v21, sub_100085CB0, v38, v22, OpaqueTypeConformance2);
  sub_100004038(&qword_1000D3EC0, &qword_1000D3EB8);
  v30 = v29;
  v31 = sub_1000859C8();
  v32 = v35;
  View.buttonStyle<A>(_:)(v31, v35, &type metadata for AppItemButtonStyle, v30, v31);
  return (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v15, v32);
}

void sub_100082B34(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_100012E2C((uint64_t *)&unk_1000D4470);
  v4 = __chkstk_darwin(v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v11 - v7;
  v9 = type metadata accessor for AutoShortcutApp(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 16))(v8, a2, v9);
  sub_100015D74((uint64_t)v8, 0, 1, v9);
  type metadata accessor for AppGridView(0);
  sub_10000D74C((uint64_t)v8, (uint64_t)v6, (uint64_t *)&unk_1000D4470);
  v10 = sub_100012E2C(&qword_1000D3C90);
  Binding.wrappedValue.setter(v6, v10);
  sub_10000D7B4((uint64_t)v8, (uint64_t *)&unk_1000D4470);
}

void sub_100082C3C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
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
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;

  v25 = a3;
  v5 = type metadata accessor for AppEntityVisualState(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for NavigationDestinationEntity(0);
  __chkstk_darwin(v9);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100012E2C(&qword_1000D3F00);
  v13 = __chkstk_darwin(v12);
  v15 = (char *)&v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)v15 = static VerticalAlignment.center.getter(v13);
  *((_QWORD *)v15 + 1) = 0;
  v15[16] = 1;
  v16 = sub_100012E2C(&qword_1000D3F10);
  sub_100082EBC(a1, a2, (uint64_t)&v15[*(int *)(v16 + 44)]);
  v17 = type metadata accessor for AutoShortcutApp(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v11, a1, v17);
  v18 = enum case for RootNavigationDestination.autoShortcuts(_:);
  v19 = type metadata accessor for RootNavigationDestination(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v11, v18, v19);
  v26 = _swiftEmptyArrayStorage;
  sub_1000040A8(&qword_1000D21B0, (uint64_t (*)(uint64_t))&type metadata accessor for AppEntityVisualState);
  v20 = sub_100012E2C((uint64_t *)&unk_1000D4480);
  sub_100004038(&qword_1000D21B8, (uint64_t *)&unk_1000D4480);
  dispatch thunk of SetAlgebra.init<A>(_:)(&v26, v20, v21);
  sub_100004038(&qword_1000D3F08, &qword_1000D3F00);
  v23 = v22;
  sub_1000040A8(&qword_1000D0648, type metadata accessor for NavigationDestinationEntity);
  View.appEntity<A>(_:state:)(v11, v8, v12, v9, v23, v24);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  sub_10005B8C8((uint64_t)v11, type metadata accessor for NavigationDestinationEntity);
  sub_10000D7B4((uint64_t)v15, &qword_1000D3F00);
}

void sub_100082EBC(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  uint64_t v49;
  uint64_t KeyPath;
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
  _QWORD v69[2];

  v68 = a2;
  v62 = a1;
  v66 = a3;
  v3 = type metadata accessor for IconView.DisplayMode(0);
  v64 = *(_QWORD *)(v3 - 8);
  v65 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for IconSize(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (double *)((char *)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = type metadata accessor for IconView(0);
  v11 = *(_QWORD *)(v10 - 8);
  __chkstk_darwin(v10);
  v13 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = sub_100012E2C(&qword_1000D3F18);
  v14 = __chkstk_darwin(v63);
  v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v67 = (uint64_t)&v60 - v17;
  sub_100085CB8();
  AutoShortcutApp.bundleIdentifier.getter();
  sub_10008668C();
  v19 = v18;
  v20 = sub_100083304();
  v21 = sub_100083304();
  *v9 = v20;
  v9[1] = v21;
  (*(void (**)(double *, _QWORD, uint64_t))(v7 + 104))(v9, enum case for IconSize.custom(_:), v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v64 + 104))(v5, enum case for IconView.DisplayMode.default(_:), v65);
  v22 = IconView.init(_:size:displayMode:animated:)(v19, v9, v5, 1);
  LOBYTE(v5) = static Edge.Set.leading.getter(v22);
  v23 = EdgeInsets.init(_all:)(-5.0);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v30 = (uint64_t)v16;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v13, v10);
  v31 = &v16[*(int *)(v63 + 36)];
  *v31 = (char)v5;
  *((double *)v31 + 1) = v23;
  *((_QWORD *)v31 + 2) = v25;
  *((_QWORD *)v31 + 3) = v27;
  *((_QWORD *)v31 + 4) = v29;
  v31[40] = 0;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v32 = (uint64_t)v16;
  v33 = v67;
  sub_1000123CC(v32, v67, &qword_1000D3F18);
  v69[0] = AutoShortcutApp.localizedName.getter(v34);
  v69[1] = v35;
  v36 = sub_100014C08();
  v37 = Text.init<A>(_:)(v69, &type metadata for String, v36);
  v39 = v38;
  v41 = v40;
  v43 = v42 & 1;
  v44 = static Font.body.getter();
  v45 = Text.font(_:)(v44, v37, v39, v43, v41);
  v47 = v46;
  LOBYTE(v11) = v48;
  v65 = v49;
  swift_release(v44);
  LOBYTE(v44) = v11 & 1;
  sub_1000085A4(v37, v39, v43);
  swift_bridgeObjectRelease();
  KeyPath = swift_getKeyPath(&unk_10009B0D0);
  v51 = swift_getKeyPath(&unk_10009B100);
  v52 = swift_getKeyPath(&unk_10009B130);
  v53 = sub_1000833FC();
  v54 = swift_getKeyPath(&unk_10009B160);
  v61 = v30;
  sub_10000D74C(v33, v30, &qword_1000D3F18);
  v55 = v66;
  sub_10000D74C(v30, v66, &qword_1000D3F18);
  v56 = sub_100012E2C(&qword_1000D3F20);
  v57 = v55 + *(int *)(v56 + 48);
  *(_QWORD *)v57 = v45;
  *(_QWORD *)(v57 + 8) = v47;
  *(_BYTE *)(v57 + 16) = v44;
  v58 = v65;
  *(_QWORD *)(v57 + 24) = v65;
  *(_QWORD *)(v57 + 32) = KeyPath;
  *(_BYTE *)(v57 + 40) = 0;
  *(_QWORD *)(v57 + 48) = v51;
  *(_BYTE *)(v57 + 56) = 1;
  *(_QWORD *)(v57 + 64) = v52;
  *(_QWORD *)(v57 + 72) = 0x3FE8000000000000;
  *(_QWORD *)(v57 + 80) = v54;
  *(_QWORD *)(v57 + 88) = v53;
  *(_BYTE *)(v57 + 96) = 0;
  v59 = v55 + *(int *)(v56 + 64);
  *(_QWORD *)v59 = 0;
  *(_BYTE *)(v59 + 8) = 1;
  sub_100015610(v45, v47, v44);
  swift_bridgeObjectRetain(v58);
  swift_retain(KeyPath);
  swift_retain(v51);
  swift_retain(v52);
  swift_retain(v54);
  sub_10000D7B4(v67, &qword_1000D3F18);
  sub_1000085A4(v45, v47, v44);
  swift_release(v54);
  swift_release(v52);
  swift_release(v51);
  swift_release(KeyPath);
  swift_bridgeObjectRelease();
  sub_10000D7B4(v61, &qword_1000D3F18);
}

double sub_100083304()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  BOOL v7;
  void (*v8)(char *, uint64_t);
  double result;
  uint64_t v10;

  v0 = type metadata accessor for ContentSizeCategory(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v10 - v5;
  type metadata accessor for AppGridView(0);
  sub_100080D80((uint64_t)v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, enum case for ContentSizeCategory.accessibilityLarge(_:), v0);
  v7 = sub_1000834E8((uint64_t)v6, (uint64_t)v4);
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  result = 40.0;
  if (v7)
    return 80.0;
  return result;
}

uint64_t sub_1000833FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  BOOL v7;
  void (*v8)(char *, uint64_t);
  uint64_t v10;

  v0 = type metadata accessor for ContentSizeCategory(0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = __chkstk_darwin(v0);
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v10 - v5;
  type metadata accessor for AppGridView(0);
  sub_100080D80((uint64_t)v6);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v4, enum case for ContentSizeCategory.accessibilityLarge(_:), v0);
  v7 = sub_1000834E8((uint64_t)v6, (uint64_t)v4);
  v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  if (v7)
    return 1;
  else
    return 2;
}

BOOL sub_1000834E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  void (*v11)(char *, uint64_t, uint64_t);
  uint64_t (*v12)(char *, uint64_t);
  int v13;
  unint64_t v14;
  int v15;
  int v16;
  unint64_t v17;
  uint64_t v19;

  v4 = type metadata accessor for ContentSizeCategory(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v19 - v9;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v19 - v9, a2, v4);
  v12 = *(uint64_t (**)(char *, uint64_t))(v5 + 88);
  v13 = v12(v10, v4);
  v14 = 0;
  v15 = enum case for ContentSizeCategory.extraSmall(_:);
  if (v13 != enum case for ContentSizeCategory.extraSmall(_:))
  {
    if (v13 == enum case for ContentSizeCategory.small(_:))
    {
      v14 = 1;
      goto LABEL_24;
    }
    if (v13 == enum case for ContentSizeCategory.medium(_:))
    {
      v14 = 2;
      goto LABEL_24;
    }
    if (v13 == enum case for ContentSizeCategory.large(_:))
      goto LABEL_7;
    if (v13 == enum case for ContentSizeCategory.extraLarge(_:))
    {
      v14 = 4;
    }
    else if (v13 == enum case for ContentSizeCategory.extraExtraLarge(_:))
    {
      v14 = 5;
    }
    else if (v13 == enum case for ContentSizeCategory.extraExtraExtraLarge(_:))
    {
      v14 = 6;
    }
    else if (v13 == enum case for ContentSizeCategory.accessibilityMedium(_:))
    {
      v14 = 7;
    }
    else if (v13 == enum case for ContentSizeCategory.accessibilityLarge(_:))
    {
      v14 = 8;
    }
    else if (v13 == enum case for ContentSizeCategory.accessibilityExtraLarge(_:))
    {
      v14 = 9;
    }
    else if (v13 == enum case for ContentSizeCategory.accessibilityExtraExtraLarge(_:))
    {
      v14 = 10;
    }
    else
    {
      if (v13 != enum case for ContentSizeCategory.accessibilityExtraExtraExtraLarge(_:))
      {
        (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
LABEL_7:
        v14 = 3;
        goto LABEL_24;
      }
      v14 = 11;
    }
  }
LABEL_24:
  v11(v8, a1, v4);
  v16 = v12(v8, v4);
  if (v16 == v15)
  {
    v17 = 0;
  }
  else if (v16 == enum case for ContentSizeCategory.small(_:))
  {
    v17 = 1;
  }
  else if (v16 == enum case for ContentSizeCategory.medium(_:))
  {
    v17 = 2;
  }
  else
  {
    if (v16 != enum case for ContentSizeCategory.large(_:))
    {
      if (v16 == enum case for ContentSizeCategory.extraLarge(_:))
      {
        v17 = 4;
        return v14 < v17;
      }
      if (v16 == enum case for ContentSizeCategory.extraExtraLarge(_:))
      {
        v17 = 5;
        return v14 < v17;
      }
      if (v16 == enum case for ContentSizeCategory.extraExtraExtraLarge(_:))
      {
        v17 = 6;
        return v14 < v17;
      }
      if (v16 == enum case for ContentSizeCategory.accessibilityMedium(_:))
      {
        v17 = 7;
        return v14 < v17;
      }
      if (v16 == enum case for ContentSizeCategory.accessibilityLarge(_:))
      {
        v17 = 8;
        return v14 < v17;
      }
      if (v16 == enum case for ContentSizeCategory.accessibilityExtraLarge(_:))
      {
        v17 = 9;
        return v14 < v17;
      }
      if (v16 == enum case for ContentSizeCategory.accessibilityExtraExtraLarge(_:))
      {
        v17 = 10;
        return v14 < v17;
      }
      if (v16 == enum case for ContentSizeCategory.accessibilityExtraExtraExtraLarge(_:))
      {
        v17 = 11;
        return v14 < v17;
      }
      (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    }
    v17 = 3;
  }
  return v14 < v17;
}

void sub_100083870()
{
  EnvironmentValues.sizeCategory.getter();
  sub_100018188();
}

uint64_t sub_10008388C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v2 = type metadata accessor for ContentSizeCategory(0);
  __chkstk_darwin(v2);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v5 + 16))(v4, a1);
  return EnvironmentValues.sizeCategory.setter(v4);
}

uint64_t *sub_10008390C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v5);
  }
  else
  {
    v6 = *(int *)(a3 + 20);
    v7 = (uint64_t *)((char *)a1 + v6);
    v8 = (char *)a2 + v6;
    v9 = *(uint64_t *)((char *)a2 + v6);
    v10 = *(uint64_t *)((char *)a2 + v6 + 8);
    *v7 = v9;
    v7[1] = v10;
    swift_bridgeObjectRetain(v5);
    swift_retain(v9);
    swift_retain(v10);
    v11 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
    v12 = (char *)v7 + v11;
    v13 = &v8[v11];
    v14 = type metadata accessor for AutoShortcutApp(0);
    if (sub_100019D44((uint64_t)v13, 1, v14))
    {
      v15 = sub_100012E2C((uint64_t *)&unk_1000D4470);
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 16))(v12, v13, v14);
      sub_100015D74((uint64_t)v12, 0, 1, v14);
    }
  }
  return a1;
}

uint64_t sub_100083A18(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  swift_bridgeObjectRelease();
  v4 = (_QWORD *)(a1 + *(int *)(a2 + 20));
  swift_release(*v4);
  swift_release(v4[1]);
  v5 = (uint64_t)v4 + *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v6 = type metadata accessor for AutoShortcutApp(0);
  result = sub_100019D44(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  return result;
}

uint64_t *sub_100083AA8(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = *a2;
  *a1 = *a2;
  v5 = *(int *)(a3 + 20);
  v6 = (uint64_t *)((char *)a1 + v5);
  v7 = (char *)a2 + v5;
  v8 = *(uint64_t *)((char *)a2 + v5);
  v9 = *(uint64_t *)((char *)a2 + v5 + 8);
  *v6 = v8;
  v6[1] = v9;
  swift_bridgeObjectRetain(v4);
  swift_retain(v8);
  swift_retain(v9);
  v10 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v11 = (char *)v6 + v10;
  v12 = &v7[v10];
  v13 = type metadata accessor for AutoShortcutApp(0);
  if (sub_100019D44((uint64_t)v12, 1, v13))
  {
    v14 = sub_100012E2C((uint64_t *)&unk_1000D4470);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
    sub_100015D74((uint64_t)v11, 0, 1, v13);
  }
  return a1;
}

uint64_t *sub_100083B90(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;

  v6 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (uint64_t *)((char *)a2 + v7);
  v10 = *(uint64_t *)((char *)a1 + v7);
  v11 = *v9;
  *(uint64_t *)((char *)a1 + v7) = *v9;
  swift_retain(v11);
  swift_release(v10);
  v12 = v9[1];
  v13 = *((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v12;
  swift_retain(v12);
  swift_release(v13);
  v14 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v15 = &v8[v14];
  v16 = (char *)v9 + v14;
  v17 = type metadata accessor for AutoShortcutApp(0);
  v18 = sub_100019D44((uint64_t)v15, 1, v17);
  v19 = sub_100019D44((uint64_t)v16, 1, v17);
  if (!v18)
  {
    v20 = *(_QWORD *)(v17 - 8);
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 24))(v15, v16, v17);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v15, v17);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v21 = sub_100012E2C((uint64_t *)&unk_1000D4470);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
  sub_100015D74((uint64_t)v15, 0, 1, v17);
  return a1;
}

_QWORD *sub_100083CEC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = (_QWORD *)((char *)a1 + v4);
  v6 = (char *)a2 + v4;
  v7 = *(_QWORD *)((char *)a2 + v4 + 8);
  *v5 = *(_QWORD *)((char *)a2 + v4);
  v5[1] = v7;
  v8 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v9 = (char *)v5 + v8;
  v10 = &v6[v8];
  v11 = type metadata accessor for AutoShortcutApp(0);
  if (sub_100019D44((uint64_t)v10, 1, v11))
  {
    v12 = sub_100012E2C((uint64_t *)&unk_1000D4470);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 32))(v9, v10, v11);
    sub_100015D74((uint64_t)v9, 0, 1, v11);
  }
  return a1;
}

_QWORD *sub_100083DB8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (_QWORD *)((char *)a2 + v6);
  v9 = *(_QWORD *)((char *)a1 + v6);
  *(_QWORD *)((char *)a1 + v6) = *v8;
  swift_release(v9);
  v10 = *((_QWORD *)v7 + 1);
  *((_QWORD *)v7 + 1) = v8[1];
  swift_release(v10);
  v11 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v12 = &v7[v11];
  v13 = (char *)v8 + v11;
  v14 = type metadata accessor for AutoShortcutApp(0);
  v15 = sub_100019D44((uint64_t)v12, 1, v14);
  v16 = sub_100019D44((uint64_t)v13, 1, v14);
  if (!v15)
  {
    v17 = *(_QWORD *)(v14 - 8);
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(v17 + 40))(v12, v13, v14);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v14);
    goto LABEL_6;
  }
  if (v16)
  {
LABEL_6:
    v18 = sub_100012E2C((uint64_t *)&unk_1000D4470);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
  sub_100015D74((uint64_t)v12, 0, 1, v14);
  return a1;
}

uint64_t sub_100083EFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100083F08);
}

void sub_100083F08()
{
  unint64_t *v0;
  char v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_100086398();
  if (v1)
  {
    sub_10005E5A0(*v0);
    sub_100018388();
  }
  else
  {
    sub_100012E2C(&qword_1000D3C90);
    v2 = sub_1000863A8();
    sub_10005E454(v2, v3, v4);
  }
}

uint64_t sub_100083F50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100083F5C);
}

void sub_100083F5C()
{
  int v0;
  _QWORD *v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_100086364();
  if (v3)
  {
    *v1 = (v0 - 1);
    sub_100018388();
  }
  else
  {
    v4 = v2;
    sub_100012E2C(&qword_1000D3C90);
    v5 = sub_100086378(*(int *)(v4 + 20));
    sub_10005E460(v5, v6, v7, v8);
  }
}

void sub_100083FA8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  _QWORD v4[2];

  v4[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  sub_100081F8C(319);
  if (v3 <= 0x3F)
  {
    v4[1] = *(_QWORD *)(v2 - 8) + 64;
    swift_initStructMetadata(a1, 256, 2, v4, a1 + 16);
  }
}

uint64_t *sub_100084020(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4;
  uint64_t v5;
  uint64_t v8;
  _QWORD *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v5 = *a2;
  *a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = (uint64_t *)(v5 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain(v5);
  }
  else
  {
    v8 = *(int *)(a3 + 20);
    v9 = (uint64_t *)((char *)a1 + v8);
    v10 = (char *)a2 + v8;
    v11 = *(uint64_t *)((char *)a2 + v8);
    v12 = *(uint64_t *)((char *)a2 + v8 + 8);
    *v9 = v11;
    v9[1] = v12;
    swift_bridgeObjectRetain(v5);
    swift_retain(v11);
    swift_retain(v12);
    v13 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
    v14 = (char *)v9 + v13;
    v15 = &v10[v13];
    v16 = type metadata accessor for AutoShortcutApp(0);
    if (sub_100019D44((uint64_t)v15, 1, v16))
    {
      v17 = sub_100012E2C((uint64_t *)&unk_1000D4470);
      memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
      sub_100015D74((uint64_t)v14, 0, 1, v16);
    }
    v18 = *(int *)(a3 + 24);
    v19 = (uint64_t *)((char *)a1 + v18);
    v20 = (uint64_t *)((char *)a2 + v18);
    v21 = sub_100012E2C(&qword_1000D3C88);
    if (swift_getEnumCaseMultiPayload(v20, v21) == 1)
    {
      v22 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v19, v20, v22);
      v23 = v19;
      v24 = v21;
      v25 = 1;
    }
    else
    {
      v26 = *v20;
      *v19 = *v20;
      swift_retain(v26);
      v23 = v19;
      v24 = v21;
      v25 = 0;
    }
    swift_storeEnumTagMultiPayload(v23, v24, v25);
  }
  return a1;
}

double sub_1000841B8(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  double result;

  swift_bridgeObjectRelease();
  v4 = (_QWORD *)(a1 + *(int *)(a2 + 20));
  swift_release(*v4);
  swift_release(v4[1]);
  v5 = (uint64_t)v4 + *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v6 = type metadata accessor for AutoShortcutApp(0);
  if (!sub_100019D44(v5, 1, v6))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (_QWORD *)(a1 + *(int *)(a2 + 24));
  v8 = sub_100012E2C(&qword_1000D3C88);
  if (swift_getEnumCaseMultiPayload(v7, v8) == 1)
  {
    v9 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v7, v9);
  }
  else
  {
    *(_QWORD *)&result = swift_release(*v7).n128_u64[0];
  }
  return result;
}

uint64_t *sub_10008429C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v6 = *a2;
  *a1 = *a2;
  v7 = *(int *)(a3 + 20);
  v8 = (uint64_t *)((char *)a1 + v7);
  v9 = (char *)a2 + v7;
  v10 = *(uint64_t *)((char *)a2 + v7);
  v11 = *(uint64_t *)((char *)a2 + v7 + 8);
  *v8 = v10;
  v8[1] = v11;
  swift_bridgeObjectRetain(v6);
  swift_retain(v10);
  swift_retain(v11);
  v12 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v13 = (char *)v8 + v12;
  v14 = &v9[v12];
  v15 = type metadata accessor for AutoShortcutApp(0);
  if (sub_100019D44((uint64_t)v14, 1, v15))
  {
    v16 = sub_100012E2C((uint64_t *)&unk_1000D4470);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v13, v14, v15);
    sub_100015D74((uint64_t)v13, 0, 1, v15);
  }
  v17 = *(int *)(a3 + 24);
  v18 = (uint64_t *)((char *)a1 + v17);
  v19 = (uint64_t *)((char *)a2 + v17);
  v20 = sub_100012E2C(&qword_1000D3C88);
  if (swift_getEnumCaseMultiPayload(v19, v20) == 1)
  {
    v21 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v21 - 8) + 16))(v18, v19, v21);
    v22 = 1;
  }
  else
  {
    v23 = *v19;
    *v18 = *v19;
    swift_retain(v23);
    v22 = 0;
  }
  swift_storeEnumTagMultiPayload(v18, v20, v22);
  return a1;
}

uint64_t *sub_100084408(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v6 = *a2;
  *a1 = *a2;
  swift_bridgeObjectRetain(v6);
  swift_bridgeObjectRelease();
  v7 = *(int *)(a3 + 20);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  v10 = *(uint64_t *)((char *)a1 + v7);
  v11 = *(uint64_t *)((char *)a2 + v7);
  *(uint64_t *)((char *)a1 + v7) = v11;
  swift_retain(v11);
  swift_release(v10);
  v12 = *((_QWORD *)v9 + 1);
  v13 = *((_QWORD *)v8 + 1);
  *((_QWORD *)v8 + 1) = v12;
  swift_retain(v12);
  swift_release(v13);
  v14 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v15 = &v8[v14];
  v16 = &v9[v14];
  v17 = type metadata accessor for AutoShortcutApp(0);
  v18 = sub_100019D44((uint64_t)v15, 1, v17);
  v19 = sub_100019D44((uint64_t)v16, 1, v17);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v15, v16, v17);
      sub_100015D74((uint64_t)v15, 0, 1, v17);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v20 = *(_QWORD *)(v17 - 8);
  if (v19)
  {
    (*(void (**)(char *, uint64_t))(v20 + 8))(v15, v17);
LABEL_6:
    v21 = sub_100012E2C((uint64_t *)&unk_1000D4470);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v21 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v20 + 24))(v15, v16, v17);
LABEL_7:
  if (a1 != a2)
  {
    v22 = *(int *)(a3 + 24);
    v23 = (uint64_t *)((char *)a1 + v22);
    v24 = (uint64_t *)((char *)a2 + v22);
    sub_10000D7B4((uint64_t)a1 + v22, &qword_1000D3C88);
    v25 = sub_100012E2C(&qword_1000D3C88);
    if (swift_getEnumCaseMultiPayload(v24, v25) == 1)
    {
      v26 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(v23, v24, v26);
      v27 = 1;
    }
    else
    {
      v28 = *v24;
      *v23 = *v24;
      swift_retain(v28);
      v27 = 0;
    }
    swift_storeEnumTagMultiPayload(v23, v25, v27);
  }
  return a1;
}

_QWORD *sub_1000845F8(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = (_QWORD *)((char *)a1 + v6);
  v8 = (char *)a2 + v6;
  v9 = *(_QWORD *)((char *)a2 + v6 + 8);
  *v7 = *(_QWORD *)((char *)a2 + v6);
  v7[1] = v9;
  v10 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v11 = (char *)v7 + v10;
  v12 = &v8[v10];
  v13 = type metadata accessor for AutoShortcutApp(0);
  if (sub_100019D44((uint64_t)v12, 1, v13))
  {
    v14 = sub_100012E2C((uint64_t *)&unk_1000D4470);
    memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v13 - 8) + 32))(v11, v12, v13);
    sub_100015D74((uint64_t)v11, 0, 1, v13);
  }
  v15 = *(int *)(a3 + 24);
  v16 = (char *)a1 + v15;
  v17 = (char *)a2 + v15;
  v18 = sub_100012E2C(&qword_1000D3C88);
  if (swift_getEnumCaseMultiPayload(v17, v18) == 1)
  {
    v19 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 32))(v16, v17, v19);
    swift_storeEnumTagMultiPayload(v16, v18, 1);
  }
  else
  {
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
  }
  return a1;
}

_QWORD *sub_10008474C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;

  *a1 = *a2;
  swift_bridgeObjectRelease();
  v6 = *(int *)(a3 + 20);
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = *(_QWORD *)((char *)a1 + v6);
  *(_QWORD *)((char *)a1 + v6) = *(_QWORD *)((char *)a2 + v6);
  swift_release(v9);
  v10 = *((_QWORD *)v7 + 1);
  *((_QWORD *)v7 + 1) = *((_QWORD *)v8 + 1);
  swift_release(v10);
  v11 = *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v12 = &v7[v11];
  v13 = &v8[v11];
  v14 = type metadata accessor for AutoShortcutApp(0);
  v15 = sub_100019D44((uint64_t)v12, 1, v14);
  v16 = sub_100019D44((uint64_t)v13, 1, v14);
  if (v15)
  {
    if (!v16)
    {
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v14 - 8) + 32))(v12, v13, v14);
      sub_100015D74((uint64_t)v12, 0, 1, v14);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  v17 = *(_QWORD *)(v14 - 8);
  if (v16)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v12, v14);
LABEL_6:
    v18 = sub_100012E2C((uint64_t *)&unk_1000D4470);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v17 + 40))(v12, v13, v14);
LABEL_7:
  if (a1 != a2)
  {
    v19 = *(int *)(a3 + 24);
    v20 = (char *)a1 + v19;
    v21 = (char *)a2 + v19;
    sub_10000D7B4((uint64_t)a1 + v19, &qword_1000D3C88);
    v22 = sub_100012E2C(&qword_1000D3C88);
    if (swift_getEnumCaseMultiPayload(v21, v22) == 1)
    {
      v23 = type metadata accessor for ContentSizeCategory(0);
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v20, v21, v23);
      swift_storeEnumTagMultiPayload(v20, v22, 1);
    }
    else
    {
      memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100084928(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100084934);
}

void sub_100084934()
{
  unint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_100086398();
  if (v3)
  {
    sub_10005E5A0(*v0);
    sub_100018388();
  }
  else
  {
    v4 = v2;
    v5 = v1;
    v6 = sub_100012E2C(&qword_1000D3C90);
    if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)v5)
    {
      v7 = v6;
      v8 = *(int *)(v4 + 20);
    }
    else
    {
      v7 = sub_100012E2C(&qword_1000D3DE0);
      v8 = *(int *)(v4 + 24);
    }
    sub_10005E454((uint64_t)v0 + v8, v5, v7);
  }
}

uint64_t sub_1000849B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000849BC);
}

void sub_1000849BC()
{
  int v0;
  _QWORD *v1;
  int v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  sub_100086364();
  if (v4)
  {
    *v1 = (v0 - 1);
    sub_100018388();
  }
  else
  {
    v5 = v3;
    if (*(_DWORD *)(*(_QWORD *)(sub_100012E2C(&qword_1000D3C90) - 8) + 84) == v2)
    {
      v6 = *(int *)(v5 + 20);
    }
    else
    {
      sub_100012E2C(&qword_1000D3DE0);
      v6 = *(int *)(v5 + 24);
    }
    v7 = sub_100086378(v6);
    sub_10005E460(v7, v8, v9, v10);
  }
}

void sub_100084A34(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  _QWORD v6[3];

  v6[0] = (char *)&value witness table for Builtin.BridgeObject + 64;
  sub_100081F8C(319);
  if (v3 <= 0x3F)
  {
    v6[1] = *(_QWORD *)(v2 - 8) + 64;
    sub_100084AC8(319);
    if (v5 <= 0x3F)
    {
      v6[2] = *(_QWORD *)(v4 - 8) + 64;
      swift_initStructMetadata(a1, 256, 3, v6, a1 + 16);
    }
  }
}

void sub_100084AC8(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;

  if (!qword_1000D3E50)
  {
    v2 = type metadata accessor for ContentSizeCategory(255);
    v3 = type metadata accessor for Environment.Content(a1, v2);
    if (!v4)
      atomic_store(v3, (unint64_t *)&qword_1000D3E50);
  }
}

unint64_t sub_100084B20()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3E88;
  if (!qword_1000D3E88)
  {
    v1 = sub_1000143E4(&qword_1000D3E90);
    sub_1000040A8(&qword_1000D3D40, type metadata accessor for AppGridView);
    sub_1000040A8(&qword_1000D3D48, type metadata accessor for AppListView);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> _ConditionalContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3E88);
  }
  return result;
}

uint64_t sub_100084BBC(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000A7DB8, 1);
}

void sub_100084BD0(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char *v19;
  uint64_t v20;

  v2 = type metadata accessor for ButtonStyleConfiguration.Label(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100012E2C(&qword_1000D3FA8);
  __chkstk_darwin(v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100012E2C((uint64_t *)&unk_1000D44C0);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = ButtonStyleConfiguration.label.getter(v10);
  if ((ButtonStyleConfiguration.isPressed.getter(v13) & 1) != 0)
    v14 = 0.5;
  else
    v14 = 1.0;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v5, v2);
  *(double *)&v8[*(int *)(v6 + 36)] = v14;
  v15 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v16 = ButtonStyleConfiguration.isPressed.getter(v15);
  v17 = 0;
  if ((v16 & 1) == 0)
  {
    v16 = static Animation.easeInOut(duration:)(0.25);
    v17 = v16;
  }
  v18 = ButtonStyleConfiguration.isPressed.getter(v16);
  sub_10000D74C((uint64_t)v8, (uint64_t)v12, &qword_1000D3FA8);
  v19 = &v12[*(int *)(v9 + 36)];
  *(_QWORD *)v19 = v17;
  v19[8] = v18 & 1;
  sub_10000D7B4((uint64_t)v8, &qword_1000D3FA8);
  sub_1000123CC((uint64_t)v12, a1, (uint64_t *)&unk_1000D44C0);
}

uint64_t sub_100084D84()
{
  uint64_t *v0;
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
  unint64_t v14;
  uint64_t v15;
  uint64_t OpaqueTypeConformance2;
  uint64_t v17;
  _QWORD v20[4];
  uint64_t v21;

  v1 = type metadata accessor for AppListView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  __chkstk_darwin(v1);
  v21 = *v0;
  v4 = v21;
  sub_10005B888((uint64_t)v0, (uint64_t)&v20[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for AppListView);
  v5 = *(unsigned __int8 *)(v2 + 80);
  v6 = (v5 + 16) & ~v5;
  v7 = swift_allocObject(&unk_1000C37F0, v6 + v3, v5 | 7);
  sub_10005DDA0((uint64_t)&v20[-1] - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), v7 + v6, type metadata accessor for AppListView);
  swift_bridgeObjectRetain(v4);
  v8 = sub_100012E2C(&qword_1000D3ED8);
  v9 = sub_100012E2C(&qword_1000D3F30);
  sub_100004038(&qword_1000D3EE8, &qword_1000D3ED8);
  v11 = v10;
  v12 = sub_1000143E4(&qword_1000D3F38);
  v13 = type metadata accessor for NavigationDestinationEntity(255);
  v14 = sub_100085EF8();
  sub_1000040A8(&qword_1000D0648, type metadata accessor for NavigationDestinationEntity);
  v20[0] = v12;
  v20[1] = v13;
  v20[2] = v14;
  v20[3] = v15;
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2(v20, &opaque type descriptor for <<opaque return type of View.appEntity<A>(_:state:)>>, 1);
  sub_1000040A8(&qword_1000D3EF0, (uint64_t (*)(uint64_t))&type metadata accessor for AutoShortcutApp);
  return ForEach<>.init(_:content:)(&v21, sub_100085E88, v7, v8, &type metadata for String, v9, v11, OpaqueTypeConformance2, v17);
}

uint64_t sub_100084F50@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
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
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  Swift::Int v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, char *, uint64_t);
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
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  unint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v53;
  char *v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v60;
  void (*v61)(char *, uint64_t, uint64_t);
  char *v62;
  uint64_t v63;
  char *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;

  v73 = a2;
  v82 = a3;
  v85 = type metadata accessor for AutoShortcutApp(0);
  v4 = *(_QWORD *)(v85 - 8);
  __chkstk_darwin(v85);
  v62 = (char *)&v60 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100012E2C((uint64_t *)&unk_1000D4470);
  __chkstk_darwin(v6);
  v71 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for AppEntityVisualState(0);
  v80 = *(_QWORD *)(v8 - 8);
  v81 = v8;
  __chkstk_darwin(v8);
  v79 = (char *)&v60 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v78 = type metadata accessor for NavigationDestinationEntity(0);
  __chkstk_darwin(v78);
  v70 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100012E2C(&qword_1000D2AA8);
  __chkstk_darwin(v11);
  v69 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_100012E2C(&qword_1000D2AB0);
  __chkstk_darwin(v13);
  v15 = (char *)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_100012E2C(&qword_1000D3F50);
  __chkstk_darwin(v68);
  v67 = (char *)&v60 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_100012E2C(&qword_1000D3F58);
  v72 = *(_QWORD *)(v17 - 8);
  __chkstk_darwin(v17);
  v19 = (char *)&v60 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = sub_100012E2C(&qword_1000D3F68);
  v65 = *(_QWORD *)(v66 - 8);
  __chkstk_darwin(v66);
  v21 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v84 = sub_100012E2C(&qword_1000D3F38);
  __chkstk_darwin(v84);
  v83 = (char *)&v60 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_100012E2C(&qword_1000D3F30);
  v75 = *(_QWORD *)(v23 - 8);
  v76 = v23;
  __chkstk_darwin(v23);
  v74 = (char *)&v60 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = type metadata accessor for RootNavigationDestination(0);
  v26 = *(_QWORD *)(v25 - 8);
  __chkstk_darwin(v25);
  v28 = (char *)&v60 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v63 = v4;
  v61 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v61(v28, a1, v85);
  (*(void (**)(char *, _QWORD, uint64_t))(v26 + 104))(v28, enum case for RootNavigationDestination.autoShortcuts(_:), v25);
  v87 = a1;
  v86 = a1;
  sub_100012E2C(&qword_1000D3F70);
  sub_100086058();
  Label.init(title:icon:)(sub_100086048);
  v77 = a1;
  v29 = AutoShortcutApp.numberOfShortcuts(includeUserShortcuts:)(1);
  sub_100004038(&qword_1000D3F60, &qword_1000D3F58);
  v30 = v21;
  v64 = v21;
  View.badge(_:)(v29, v17, v31);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v19, v17);
  v72 = v26;
  v32 = *(void (**)(char *, char *, uint64_t))(v26 + 16);
  v32(v15, v28, v25);
  sub_100015D74((uint64_t)v15, 0, 1, v25);
  v33 = (uint64_t)v67;
  sub_10000D74C((uint64_t)v15, (uint64_t)&v67[*(int *)(v68 + 36)], &qword_1000D2AB0);
  v34 = v65;
  v35 = v66;
  (*(void (**)(uint64_t, char *, uint64_t))(v65 + 16))(v33, v30, v66);
  v36 = (uint64_t)v15;
  v37 = (uint64_t)v83;
  sub_10000D7B4(v36, &qword_1000D2AB0);
  v38 = (uint64_t)v69;
  v32(v69, v28, v25);
  sub_100015D74(v38, 0, 1, v25);
  v39 = sub_100012E2C(&qword_1000D1100);
  sub_100015D74(v38, 0, 1, v39);
  sub_10000D74C(v38, v37 + *(int *)(v84 + 36), &qword_1000D2AA8);
  sub_10000D74C(v33, v37, &qword_1000D3F50);
  v40 = (uint64_t)v70;
  sub_10000D7B4(v38, &qword_1000D2AA8);
  v41 = v85;
  sub_10000D7B4(v33, &qword_1000D3F50);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v64, v35);
  v42 = v28;
  v32((char *)v40, v28, v25);
  v43 = (uint64_t)v71;
  type metadata accessor for AppListView(0);
  v44 = sub_100012E2C(&qword_1000D3C90);
  Binding.wrappedValue.getter(v44);
  if (sub_100019D44(v43, 1, v41))
  {
    sub_10000D7B4(v43, (uint64_t *)&unk_1000D4470);
    v46 = 0;
    v47 = 0xE000000000000000;
  }
  else
  {
    v48 = v62;
    v61(v62, v43, v41);
    sub_10000D7B4(v43, (uint64_t *)&unk_1000D4470);
    v46 = ((uint64_t (*)(void))AutoShortcutApp.bundleIdentifier.getter)();
    v47 = v49;
    v45 = (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v48, v41);
  }
  v50 = AutoShortcutApp.bundleIdentifier.getter(v45);
  if (v46 == v50 && v47 == v51)
    v53 = 1;
  else
    v53 = _stringCompareWithSmolCheck(_:_:expecting:)(v46, v47, v50, v51, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v54 = v79;
  AppEntityVisualState.init(isSelected:isHighlighted:isFocused:isDisabled:isEditing:isPrimary:)(v53 & 1, 0, 0, 0, 0, 0);
  v55 = sub_100085EF8();
  sub_1000040A8(&qword_1000D0648, type metadata accessor for NavigationDestinationEntity);
  v56 = v74;
  v57 = (uint64_t)v83;
  View.appEntity<A>(_:state:)(v40, v54, v84, v78, v55, v58);
  (*(void (**)(char *, uint64_t))(v80 + 8))(v54, v81);
  sub_10005B8C8(v40, type metadata accessor for NavigationDestinationEntity);
  sub_10000D7B4(v57, &qword_1000D3F38);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v42, v25);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v75 + 32))(v82, v56, v76);
}

uint64_t sub_1000856C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[0] = AutoShortcutApp.localizedName.getter(a1);
  v9[1] = v3;
  v4 = sub_100014C08();
  result = Text.init<A>(_:)(v9, &type metadata for String, v4);
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7 & 1;
  *(_QWORD *)(a2 + 24) = v8;
  return result;
}

uint64_t sub_100085718@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  __int128 v24;
  uint64_t v26;
  uint64_t v27;
  _OWORD v28[3];

  v27 = a1;
  v26 = type metadata accessor for IconView.DisplayMode(0);
  v1 = *(_QWORD *)(v26 - 8);
  __chkstk_darwin(v26);
  v3 = (char *)&v26 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for IconSize(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (_OWORD *)((char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = type metadata accessor for IconView(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100085CB8();
  AutoShortcutApp.bundleIdentifier.getter();
  sub_10008668C();
  v13 = v12;
  __asm { FMOV            V0.2D, #29.0 }
  *v7 = _Q0;
  (*(void (**)(_OWORD *, _QWORD, uint64_t))(v5 + 104))(v7, enum case for IconSize.custom(_:), v4);
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, enum case for IconView.DisplayMode.default(_:), v26);
  v19 = IconView.init(_:size:displayMode:animated:)(v13, v7, v3, 1);
  v20 = static Alignment.center.getter(v19);
  _FrameLayout.init(width:height:alignment:)(v28, 0x403D000000000000, 0, 0x403D000000000000, 0, v20, v21);
  v22 = v27;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 16))(v27, v11, v8);
  v23 = (_OWORD *)(v22 + *(int *)(sub_100012E2C(&qword_1000D3F70) + 36));
  v24 = v28[1];
  *v23 = v28[0];
  v23[1] = v24;
  v23[2] = v28[2];
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1000858F0(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000A7D90, 1);
}

uint64_t sub_100085900()
{
  uint64_t v0;

  return sub_1000826E4(*(uint64_t **)(v0 + 16));
}

unint64_t sub_100085908()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];

  result = qword_1000D3EB0;
  if (!qword_1000D3EB0)
  {
    v1 = sub_1000143E4(&qword_1000D3EA8);
    v2 = sub_1000143E4(&qword_1000D3EB8);
    sub_100004038(&qword_1000D3EC0, &qword_1000D3EB8);
    v4[0] = v2;
    v4[1] = &type metadata for AppItemButtonStyle;
    v4[2] = v3;
    v4[3] = sub_1000859C8();
    swift_getOpaqueTypeConformance2(v4, &opaque type descriptor for <<opaque return type of View.buttonStyle<A>(_:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3EB0);
  }
  return result;
}

unint64_t sub_1000859C8()
{
  unint64_t result;

  result = qword_1000D3EC8;
  if (!qword_1000D3EC8)
  {
    result = swift_getWitnessTable(&unk_10009B1A4, &type metadata for AppItemButtonStyle);
    atomic_store(result, (unint64_t *)&qword_1000D3EC8);
  }
  return result;
}

uint64_t sub_100085A04()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_100086388();
  sub_1000863C8();
  v5 = *(_QWORD *)(v4 + 64);
  swift_bridgeObjectRelease();
  v6 = (_QWORD *)(v0 + v2 + *(int *)(v3 + 20));
  swift_release(*v6);
  swift_release(v6[1]);
  v7 = (uint64_t)v6 + *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v8 = sub_100086390();
  if (!sub_100019D44(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (_QWORD *)(v0 + v2 + *(int *)(v3 + 24));
  v10 = sub_100012E2C(&qword_1000D3C88);
  if (swift_getEnumCaseMultiPayload(v9, v10) == 1)
  {
    v11 = type metadata accessor for ContentSizeCategory(0);
    sub_100042914(v11);
  }
  else
  {
    swift_release(*v9);
  }
  return swift_deallocObject(v0, v2 + v5, v1 | 7);
}

uint64_t sub_100085AF8(uint64_t a1)
{
  return sub_100085E9C(a1, type metadata accessor for AppGridView, (uint64_t (*)(uint64_t, uint64_t))sub_1000828A4);
}

uint64_t sub_100085B0C()
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
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  __n128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;

  v3 = sub_100086388();
  sub_1000863C8();
  v18 = *(_QWORD *)(v4 + 64);
  v5 = sub_100086390();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned __int8 *)(v6 + 80);
  v8 = *(_QWORD *)(v6 + 64);
  swift_bridgeObjectRelease();
  v9 = (_QWORD *)(v0 + v2 + *(int *)(v3 + 20));
  swift_release(*v9);
  swift_release(v9[1]);
  v10 = (uint64_t)v9 + *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  if (!sub_100019D44(v10, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v10, v5);
  v11 = (_QWORD *)(v0 + v2 + *(int *)(v3 + 24));
  v12 = sub_100012E2C(&qword_1000D3C88);
  if (swift_getEnumCaseMultiPayload(v11, v12) == 1)
  {
    v13 = type metadata accessor for ContentSizeCategory(0);
    (*(void (**)(_QWORD *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v11, v13);
  }
  else
  {
    v14 = swift_release(*v11);
  }
  v15 = (v2 + v18 + v7) & ~v7;
  v16 = v15 + v8;
  (*(void (**)(uint64_t, uint64_t, __n128))(v6 + 8))(v0 + v15, v5, v14);
  return swift_deallocObject(v0, v16, v1 | v7 | 7);
}

void sub_100085C58()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(sub_100086388() - 8);
  v2 = (*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 64);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_100086390() - 8) + 80);
  sub_100082B34(v0 + v2, v0 + ((v2 + v3 + v4) & ~v4));
}

void sub_100085CB0(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_100082C3C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_100085CB8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D43C0;
  if (!qword_1000D43C0)
  {
    v1 = objc_opt_self(WFAppIcon);
    result = swift_getObjCClassMetadata(v1);
    atomic_store(result, (unint64_t *)&qword_1000D43C0);
  }
  return result;
}

void sub_100085CF4(_BYTE *a1@<X8>)
{
  *a1 = EnvironmentValues.multilineTextAlignment.getter();
  sub_100018188();
}

void sub_100085D18(unsigned __int8 *a1)
{
  EnvironmentValues.multilineTextAlignment.setter(*a1);
  sub_100018188();
}

void sub_100085D38(_BYTE *a1@<X8>)
{
  *a1 = EnvironmentValues.allowsTightening.getter() & 1;
  sub_100018188();
}

void sub_100085D60(unsigned __int8 *a1)
{
  EnvironmentValues.allowsTightening.setter(*a1);
  sub_100018188();
}

void sub_100085D80(double *a1@<X8>)
{
  *a1 = EnvironmentValues.minimumScaleFactor.getter();
  sub_100018188();
}

void sub_100085DA4(double *a1)
{
  EnvironmentValues.minimumScaleFactor.setter(*a1);
  sub_100018188();
}

uint64_t sub_100085DCC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;

  v1 = type metadata accessor for AppListView(0);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 16) & ~v3;
  v5 = *(_QWORD *)(v2 + 64);
  swift_bridgeObjectRelease();
  v6 = (_QWORD *)(v0 + v4 + *(int *)(v1 + 20));
  swift_release(*v6);
  swift_release(v6[1]);
  v7 = (uint64_t)v6 + *(int *)(sub_100012E2C(&qword_1000D3C90) + 32);
  v8 = sub_100086390();
  if (!sub_100019D44(v7, 1, v8))
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  return swift_deallocObject(v0, v4 + v5, v3 | 7);
}

uint64_t sub_100085E88(uint64_t a1)
{
  return sub_100085E9C(a1, type metadata accessor for AppListView, (uint64_t (*)(uint64_t, uint64_t))sub_100084F50);
}

uint64_t sub_100085E9C(uint64_t a1, uint64_t (*a2)(_QWORD), uint64_t (*a3)(uint64_t, uint64_t))
{
  uint64_t v3;
  uint64_t v5;

  v5 = *(unsigned __int8 *)(*(_QWORD *)(a2(0) - 8) + 80);
  return a3(a1, v3 + ((v5 + 16) & ~v5));
}

unint64_t sub_100085EF8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3F40;
  if (!qword_1000D3F40)
  {
    v1 = sub_1000143E4(&qword_1000D3F38);
    sub_100085F7C();
    sub_100004038(&qword_1000D2A10, &qword_1000D2A18);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3F40);
  }
  return result;
}

unint64_t sub_100085F7C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[2];

  result = qword_1000D3F48;
  if (!qword_1000D3F48)
  {
    v1 = sub_1000143E4(&qword_1000D3F50);
    v2 = sub_1000143E4(&qword_1000D3F58);
    sub_100004038(&qword_1000D3F60, &qword_1000D3F58);
    v4[0] = v2;
    v4[1] = v3;
    swift_getOpaqueTypeConformance2(v4, &opaque type descriptor for <<opaque return type of View.badge(_:)>>, 1);
    sub_100004038(&qword_1000D2A00, &qword_1000D2A08);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3F48);
  }
  return result;
}

uint64_t sub_100086048@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1000856C0(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_100086050@<X0>(uint64_t a1@<X8>)
{
  return sub_100085718(a1);
}

unint64_t sub_100086058()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3F78;
  if (!qword_1000D3F78)
  {
    v1 = sub_1000143E4(&qword_1000D3F70);
    sub_1000040A8(&qword_1000D3F80, (uint64_t (*)(uint64_t))&type metadata accessor for IconView);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3F78);
  }
  return result;
}

ValueMetadata *type metadata accessor for AppItemButtonStyle()
{
  return &type metadata for AppItemButtonStyle;
}

unint64_t sub_1000860F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3F88;
  if (!qword_1000D3F88)
  {
    v1 = sub_1000143E4(&qword_1000D3ED0);
    sub_100004038(&qword_1000D3F90, &qword_1000D3E98);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3F88);
  }
  return result;
}

unint64_t sub_100086178()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD v6[4];

  result = qword_1000D3F98;
  if (!qword_1000D3F98)
  {
    v1 = sub_1000143E4(&qword_1000D3FA0);
    v2 = sub_1000143E4(&qword_1000D3F38);
    v3 = type metadata accessor for NavigationDestinationEntity(255);
    v4 = sub_100085EF8();
    sub_1000040A8(&qword_1000D0648, type metadata accessor for NavigationDestinationEntity);
    v6[0] = v2;
    v6[1] = v3;
    v6[2] = v4;
    v6[3] = v5;
    swift_getOpaqueTypeConformance2(v6, &opaque type descriptor for <<opaque return type of View.appEntity<A>(_:state:)>>, 1);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ForEach<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3F98);
  }
  return result;
}

uint64_t sub_100086248(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000A7DE0, 1);
}

unint64_t sub_10008625C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D3FB0;
  if (!qword_1000D3FB0)
  {
    v1 = sub_1000143E4((uint64_t *)&unk_1000D44C0);
    sub_1000862E0();
    sub_100004038(&qword_1000D44E0, &qword_1000D2320);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D3FB0);
  }
  return result;
}

unint64_t sub_1000862E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1000D44D0;
  if (!qword_1000D44D0)
  {
    v1 = sub_1000143E4(&qword_1000D3FA8);
    sub_1000040A8(&qword_1000D3FB8, (uint64_t (*)(uint64_t))&type metadata accessor for ButtonStyleConfiguration.Label);
    result = swift_getWitnessTable(&protocol conformance descriptor for <> ModifiedContent<A, B>, v1);
    atomic_store(result, (unint64_t *)&qword_1000D44D0);
  }
  return result;
}

uint64_t sub_100086378@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return v1 + a1;
}

uint64_t sub_100086388()
{
  return type metadata accessor for AppGridView(0);
}

uint64_t sub_100086390()
{
  return type metadata accessor for AutoShortcutApp(0);
}

uint64_t sub_1000863A8()
{
  uint64_t v0;
  uint64_t v1;

  return v0 + *(int *)(v1 + 20);
}

void sub_1000863BC(uint64_t a1)
{
  uint64_t (*v1)(_QWORD);
  uint64_t v2;

  sub_10005B888(a1, v2, v1);
}

void *sub_1000863DC(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  char v4;
  void *v5;
  id v6;

  if (!*(_QWORD *)(a2 + 16))
    return 0;
  v3 = sub_100013F34(a1);
  if ((v4 & 1) == 0)
    return 0;
  v5 = *(void **)(*(_QWORD *)(a2 + 56) + 16 * v3);
  v6 = v5;
  return v5;
}

uint64_t sub_10008642C(Swift::UInt a1, uint64_t a2, double a3)
{
  unint64_t v4;
  char v5;

  if (*(_QWORD *)(a2 + 16) && (v4 = sub_100013CF8(a1, a3), (v5 & 1) != 0))
    return *(_QWORD *)(*(_QWORD *)(a2 + 56) + 16 * v4);
  else
    return 0;
}

void sub_100086478(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;

  if (*(_QWORD *)(a3 + 16))
  {
    v4 = sub_10008B544(a1, a2);
    if ((v5 & 1) != 0)
      swift_bridgeObjectRetain(*(_QWORD *)(*(_QWORD *)(a3 + 56) + 8 * v4));
  }
  sub_100018188();
}

void sub_1000864B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  char v5;
  id v6;

  if (*(_QWORD *)(a3 + 16))
  {
    v4 = sub_10008B544(a1, a2);
    if ((v5 & 1) != 0)
      v6 = *(id *)(*(_QWORD *)(a3 + 56) + 8 * v4);
  }
  sub_100018188();
}

_QWORD *sub_1000864F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    sub_10000CF78(0, v1, 0);
    v3 = *(_QWORD *)(type metadata accessor for ShortcutsLibraryItem(0) - 8);
    v4 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    v5 = *(_QWORD *)(v3 + 72);
    do
    {
      v6 = ShortcutsLibraryItem.id.getter();
      v8 = v7;
      v10 = _swiftEmptyArrayStorage[2];
      v9 = _swiftEmptyArrayStorage[3];
      if (v10 >= v9 >> 1)
        sub_10000CF78(v9 > 1, v10 + 1, 1);
      _swiftEmptyArrayStorage[2] = v10 + 1;
      v11 = &_swiftEmptyArrayStorage[2 * v10];
      v11[4] = v6;
      v11[5] = v8;
      v4 += v5;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

void sub_1000865F0()
{
  void *v0;
  void *v1;

  objc_msgSend(objc_allocWithZone((Class)sub_10008C4B8()), "initWithView:parameters:", v1, v0);

  sub_100018388();
}

void sub_100086634()
{
  EnvironmentValues.libraryMenuDataSource.getter();
  sub_100018188();
}

uint64_t sub_100086650(uint64_t a1)
{
  _BYTE v2[40];

  sub_10000D74C(a1, (uint64_t)v2, &qword_1000D3898);
  return EnvironmentValues.libraryMenuDataSource.setter(v2);
}

void sub_10008668C()
{
  void *v0;
  id v1;
  NSString v2;

  v1 = objc_allocWithZone((Class)sub_10008C4B8());
  sub_10008C3F8();
  v2 = String._bridgeToObjectiveC()();
  sub_1000183D0();
  objc_msgSend(v0, "initWithBundleIdentifier:", v2);
  sub_100027368();
  sub_100018388();
}

void sub_1000866DC(uint64_t a1, void *a2, Swift::UInt a3)
{
  void *v3;
  id v5;
  uint64_t v6;

  v5 = a2;
  v6 = sub_10008C3F8();
  NSObject.hash(into:)(v6);

  Hasher._combine(_:)(a3);
  sub_100018388();
}

uint64_t sub_100086718(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_100047E90(a1, &qword_1000D4370, NSObject_ptr);
  return static NSObject.== infix(_:_:)(a1, a3) & (a2 == a4);
}

Swift::Int sub_10008677C(void *a1, Swift::UInt a2)
{
  id v4;
  _QWORD v6[9];

  Hasher.init(_seed:)(v6, 0);
  v4 = a1;
  NSObject.hash(into:)(v6);

  Hasher._combine(_:)(a2);
  return Hasher._finalize()();
}

Swift::Int sub_1000867D8()
{
  uint64_t v0;

  return sub_10008677C(*(void **)v0, *(_QWORD *)(v0 + 8));
}

void sub_1000867E0(uint64_t a1)
{
  uint64_t v1;

  sub_1000866DC(a1, *(void **)v1, *(_QWORD *)(v1 + 8));
}

Swift::Int sub_1000867E8(uint64_t a1)
{
  uint64_t v1;
  Swift::UInt v2;
  void *v3;
  id v4;
  _QWORD v6[9];

  v3 = *(void **)v1;
  v2 = *(_QWORD *)(v1 + 8);
  Hasher.init(_seed:)(v6, a1);
  v4 = v3;
  NSObject.hash(into:)(v6);

  Hasher._combine(_:)(v2);
  return Hasher._finalize()();
}

uint64_t sub_100086844(uint64_t *a1, uint64_t *a2)
{
  return sub_100086718(*a1, a1[1], *a2, a2[1]);
}

void sub_100086858()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t Strong;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;

  v1 = qword_1000D3FE0;
  v2 = *(void **)(v0 + qword_1000D3FE0);
  if (!v2)
  {
    v3 = v0;
    v4 = LibraryDataSource.database.getter();
    LibraryDataSource.shortcutMoveService.getter(v4);
    v5 = sub_10008C600();
    v6 = objc_allocWithZone((Class)type metadata accessor for MoveToFolderCoordinator(v5));
    v7 = (void *)MoveToFolderCoordinator.init(database:service:)(v4, v0);
    Strong = swift_unknownObjectWeakLoadStrong(v3 + qword_1000D3FD0);
    if (Strong)
    {
      sub_1000040A8(&qword_1000D4428, type metadata accessor for LibraryViewController);
      v10 = v9;
    }
    else
    {
      v10 = 0;
    }
    dispatch thunk of MoveToFolderCoordinator.delegate.setter(Strong, v10);
    *(_QWORD *)(v3 + v1) = v7;
    v11 = v7;
    sub_100027368();
    v2 = 0;
  }
  v12 = v2;
  sub_100018388();
}

void sub_100086920()
{
  uint64_t v0;
  void *v1;
  void *v2;
  unsigned int v3;
  uint64_t Strong;
  void *v5;

  v1 = (void *)sub_100079E9C(qword_1000D3FD0);
  if (v1
    && (v2 = v1, v3 = objc_msgSend(v1, "isEditing"), v2, v3)
    && (Strong = swift_unknownObjectWeakLoadStrong(v0)) != 0)
  {
    v5 = (void *)Strong;
    sub_10000FC34();
    sub_100047D38(v5);
  }
  else
  {
    sub_100027380();
  }
}

uint64_t sub_10008698C()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  v0 = sub_1000507EC();
  v1 = (uint64_t (*)(void))method lookup function for LibraryDataSource(v0, &method descriptor for LibraryDataSource.selectedWorkflowIds.getter);
  return v1();
}

void sub_1000869AC(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t);

  v2 = sub_1000507EC();
  v3 = (void (*)(uint64_t))method lookup function for LibraryDataSource(v2, &method descriptor for LibraryDataSource.selectedWorkflowIds.setter);
  v3(a1);
  sub_100086920();
}

void sub_1000869E4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);

  v2 = sub_10008C570();
  *v0 = v2;
  v2[4] = v1;
  v3 = sub_1000507EC();
  v4 = (uint64_t (*)(uint64_t))method lookup function for LibraryDataSource(v3, &method descriptor for LibraryDataSource.selectedWorkflowIds.modify);
  v2[5] = sub_10008C518(v4);
  sub_100018388();
}

void sub_100086A2C(_QWORD *a1, char a2)
{
  sub_100086B20(a1, a2, (void (*)(uint64_t))sub_100086920);
}

void sub_100086A38()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  v0 = sub_10005E7FC(qword_1000D3FD0);
  if (v0)
  {
    v1 = (void *)v0;
    v2 = sub_1000507EC();
    v3 = (uint64_t (*)(void))method lookup function for LibraryDataSource(v2, &method descriptor for LibraryDataSource.isEditing.getter);
    objc_msgSend(v1, "setEditing:animated:", v3() & 1, 1);

  }
  sub_10000C9A0();
}

void sub_100086A9C()
{
  uint64_t v0;
  uint64_t (*v1)(uint64_t);

  v0 = sub_1000507EC();
  v1 = (uint64_t (*)(uint64_t))method lookup function for LibraryDataSource(v0, &method descriptor for LibraryDataSource.isEditing.setter);
  sub_10008C500(v1);
  sub_100086A38();
}

void sub_100086ACC()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t);

  v2 = sub_10008C570();
  *v0 = v2;
  v2[4] = v1;
  v3 = sub_1000507EC();
  v4 = (uint64_t (*)(uint64_t))method lookup function for LibraryDataSource(v3, &method descriptor for LibraryDataSource.isEditing.modify);
  v2[5] = sub_10008C518(v4);
  sub_100018388();
}

void sub_100086B14(_QWORD *a1, char a2)
{
  sub_100086B20(a1, a2, (void (*)(uint64_t))sub_100086A38);
}

void sub_100086B20(_QWORD *a1, char a2, void (*a3)(uint64_t))
{
  void *v5;
  uint64_t v6;

  v5 = (void *)*a1;
  v6 = (*(uint64_t (**)(_QWORD, _QWORD))(*a1 + 40))(*a1, 0);
  if ((a2 & 1) == 0)
    a3(v6);
  free(v5);
}

uint64_t sub_100086B6C(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26[24];

  v5 = v4;
  v24 = a4;
  v25 = a3;
  v8 = type metadata accessor for LibraryConfiguration(0);
  v9 = *(_QWORD *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)(v5 + qword_1000D3FC0) = 0;
  v12 = v5 + qword_1000D3FD0;
  swift_unknownObjectWeakInit(v5 + qword_1000D3FD0, 0);
  v13 = qword_1000D3FD8;
  v14 = type metadata accessor for UUID(0);
  sub_1000040A8(&qword_1000D2970, (uint64_t (*)(uint64_t))&type metadata accessor for UUID);
  v16 = v15;
  swift_retain(v5);
  *(_QWORD *)(v5 + v13) = Dictionary.init(dictionaryLiteral:)(_swiftEmptyArrayStorage, v14, &_s10DataSourceC13TopHitWrapperVN, v16);
  *(_QWORD *)(v5 + qword_1000D3FE0) = 0;
  *(_BYTE *)(v5 + qword_1000D3FE8) = 0;
  *(_QWORD *)(v5 + qword_1000D3FC8) = a1;
  swift_unknownObjectWeakAssign(v12, a2);
  v17 = a1;
  swift_release(v5);
  v18 = &a2[OBJC_IVAR____TtC9Shortcuts21LibraryViewController_configuration];
  swift_beginAccess(&a2[OBJC_IVAR____TtC9Shortcuts21LibraryViewController_configuration], v26, 0, 0);
  v19 = (*(uint64_t (**)(char *, char *, uint64_t))(v9 + 16))(v11, v18, v8);
  v20 = LibraryConfiguration.layoutOverride.getter(v19);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  v21 = LibraryDataSource.init(layoutMode:canChangeLayoutModes:shortcutMoveService:database:)(v20, v20 == 2, v24, v25);

  return v21;
}

void sub_100086D30(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v1 = a1 & 1;
  v2 = sub_1000507EC();
  v3 = (uint64_t (*)(void))method lookup function for LibraryDataSource(v2, &method descriptor for LibraryDataSource.layoutMode.getter);
  v4 = v3();
  v5 = LibraryLayoutMode.rawValue.getter(v4 & 1);
  v7 = v6;
  if (v5 == LibraryLayoutMode.rawValue.getter(v1) && v7 == v8)
  {
    sub_10008C614();
  }
  else
  {
    v10 = v8;
    v11 = sub_100026FE0();
    v14 = sub_100068E08(v11, v12, v13, v10);
    sub_1000183D0();
    sub_100047F0C();
    if ((v14 & 1) == 0)
    {
      sub_10000C9A0(0, 0);
      return;
    }
  }
  sub_100018388();
}

uint64_t sub_100086DC4()
{
  uint64_t v0;
  uint64_t (*v1)(void);

  v0 = sub_1000507EC();
  v1 = (uint64_t (*)(void))method lookup function for LibraryDataSource(v0, &method descriptor for LibraryDataSource.layoutMode.getter);
  return v1() & 1;
}

void sub_100086DEC()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  char v2;
  uint64_t (*v3)(uint64_t);

  v0 = sub_1000507EC();
  v1 = (uint64_t (*)(void))method lookup function for LibraryDataSource(v0, &method descriptor for LibraryDataSource.layoutMode.getter);
  v2 = v1() & 1;
  v3 = (uint64_t (*)(uint64_t))method lookup function for LibraryDataSource(v0, &method descriptor for LibraryDataSource.layoutMode.setter);
  sub_10008C500(v3);
  sub_100086D30(v2);
}

void (*sub_100086E44(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t (*v4)(void);

  *(_QWORD *)a1 = v1;
  v3 = sub_1000507EC();
  *(_QWORD *)(a1 + 8) = v3;
  v4 = (uint64_t (*)(void))method lookup function for LibraryDataSource(v3, &method descriptor for LibraryDataSource.layoutMode.getter);
  *(_QWORD *)(a1 + 16) = v4;
  *(_BYTE *)(a1 + 24) = v4() & 1;
  return sub_100086E94;
}

void sub_100086E94(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char v3;
  void (*v4)(uint64_t);

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(unsigned __int8 *)(a1 + 24);
  v3 = (*(uint64_t (**)(void))(a1 + 16))() & 1;
  v4 = (void (*)(uint64_t))method lookup function for LibraryDataSource(v1, &method descriptor for LibraryDataSource.layoutMode.setter);
  v4(v2);
  sub_100086D30(v3);
  sub_100018388();
}

void sub_100086EE4(uint64_t a1)
{
  sub_1000870E0(a1, (void (*)(void))&ShortcutsLibraryItem.autoShortcut.getter);
}

void sub_100086EF0()
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
  uint64_t v12;
  char *v13;
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

  sub_100018190();
  v28 = v3;
  v4 = type metadata accessor for LibrarySectionOptions.SectionType(0);
  v26 = *(_QWORD *)(v4 - 8);
  v27 = v4;
  sub_100018044();
  __chkstk_darwin(v5);
  v6 = sub_10008C2B8();
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  sub_1000181C8();
  sub_100012E2C(&qword_1000D0AD0);
  sub_100018034();
  __chkstk_darwin(v8);
  sub_100018458();
  v9 = sub_100019EFC();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = __chkstk_darwin(v9);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  IndexPath.section.getter(v11);
  sub_100012D0C();
  if (sub_100019D44(v2, 1, v9) == 1)
  {
    sub_10001222C(v2, &qword_1000D0AD0);
    v14 = sub_100086390();
    v15 = v28;
    v16 = 1;
  }
  else
  {
    v17 = v28;
    v18 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 32))(v13, v2, v9);
    v19 = ShortcutsLibrarySection.options.getter(v18);
    LibrarySectionOptions.sectionType.getter(v19);
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v1, v6);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v13, v9);
    v20 = v26;
    if (sub_100026D68(v0, *(uint64_t (**)(uint64_t, uint64_t))(v26 + 88)) != enum case for LibrarySectionOptions.SectionType.appShortcuts(_:))
    {
      v22 = sub_100086390();
      sub_100026B84(v17, v23, v24, v22);
      sub_100079B48(*(uint64_t (**)(uint64_t, uint64_t))(v20 + 8));
      goto LABEL_7;
    }
    sub_100079B48(*(uint64_t (**)(uint64_t, uint64_t))(v20 + 96));
    v21 = sub_100086390();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 32))(v17, v0, v21);
    v15 = v17;
    v16 = 0;
    v14 = v21;
  }
  sub_100015D74(v15, v16, 1, v14);
LABEL_7:
  sub_100018094();
}

void sub_1000870D4(uint64_t a1)
{
  sub_1000870E0(a1, (void (*)(void))&ShortcutsLibraryItem.workflow.getter);
}

void sub_1000870E0(uint64_t a1, void (*a2)(void))
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

  sub_100012E2C(&qword_1000D3670);
  sub_100018034();
  __chkstk_darwin(v5);
  sub_10008C3DC();
  __chkstk_darwin(v6);
  v8 = (char *)&v12 - v7;
  sub_100012EC0(a1, (uint64_t)&v12 - v7);
  v9 = sub_100026FE0();
  sub_10000D74C(v9, v10, &qword_1000D3670);
  v11 = type metadata accessor for ShortcutsLibraryItem(0);
  if (sub_100019D44(v2, 1, v11) == 1)
  {
    sub_10008C550((uint64_t)v8);
    sub_10008C550(v2);
  }
  else
  {
    a2();
    sub_10001222C((uint64_t)v8, &qword_1000D3670);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v2, v11);
  }
  sub_100026B34();
}

void sub_1000871D4()
{
  id *v0;
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
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
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
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v38;
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
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t (*v61)(uint64_t, uint64_t, uint64_t);
  _QWORD v62[3];

  sub_100018190();
  v55 = v5;
  v56 = v6;
  v47 = v7;
  v8 = type metadata accessor for ShortcutsLibraryItem.ItemType(0);
  v57 = *(_QWORD *)(v8 - 8);
  v58 = v8;
  sub_100018044();
  __chkstk_darwin(v9);
  v10 = sub_10008C3A4();
  v11 = type metadata accessor for ShortcutsLibraryItem(v10);
  sub_10004282C();
  __chkstk_darwin(v12);
  sub_100018488();
  v13 = sub_100019EFC();
  sub_100026DAC();
  __chkstk_darwin(v14);
  sub_10008C3C0(v15, v45);
  v16 = sub_100012E2C(&qword_1000D1EB0);
  v17 = *(_QWORD *)(v16 - 8);
  __chkstk_darwin(v16);
  sub_1000181C8();
  dispatch thunk of LibraryDataSource.sortedSections.getter(v18);
  v19 = OrderedDictionary.values.getter(v16);
  sub_100079B54(v2, *(uint64_t (**)(uint64_t, uint64_t))(v17 + 8));
  v48 = *(_QWORD *)(v19 + 16);
  if (!v48)
  {
LABEL_18:
    sub_100018420();
    v39 = type metadata accessor for IndexPath(0);
    sub_100026B84(v47, v40, v41, v39);
    goto LABEL_22;
  }
  v20 = 0;
  sub_100047E74();
  v51 = v19 + v21;
  v60 = enum case for ShortcutsLibraryItem.ItemType.workflow(_:);
  v23 = v57;
  v22 = v58;
  v46 = v13;
  v49 = v19;
  v50 = v4;
  v54 = v3;
  while (1)
  {
    if (v20 >= *(_QWORD *)(v19 + 16))
    {
      __break(1u);
      return;
    }
    v52 = v20;
    v24 = (*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(v4 + 16))(v53, v51 + *(_QWORD *)(v4 + 72) * v20, v13);
    v25 = ShortcutsLibrarySection.items.getter(v24);
    v26 = v25;
    v27 = *(_QWORD *)(v25 + 16);
    if (v27)
      break;
    swift_bridgeObjectRelease(v25);
LABEL_17:
    v20 = v52 + 1;
    v4 = v50;
    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v53, v13);
    v19 = v49;
    if (v52 + 1 == v48)
      goto LABEL_18;
  }
  sub_100047E74();
  v29 = v26 + v28;
  v59 = *(_QWORD *)(v3 + 72);
  v61 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  while (1)
  {
    v30 = v61(v1, v29, v11);
    ShortcutsLibraryItem.itemType.getter(v30);
    if ((*(unsigned int (**)(id *, uint64_t))(v23 + 88))(v0, v22) != v60)
    {
      sub_10008C364(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
      sub_100079B54((uint64_t)v0, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
      goto LABEL_14;
    }
    v31 = v11;
    sub_100079B54((uint64_t)v0, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 96));
    v32 = *v0;
    v33 = objc_msgSend(*v0, "identifier");
    v34 = static String._unconditionallyBridgeFromObjectiveC(_:)(v33);
    v36 = v35;

    if (v34 == v55 && v36 == v56)
    {
      swift_bridgeObjectRelease(v49);
      v42 = v26;
      goto LABEL_21;
    }
    v38 = sub_100068E08(v34, v36, v55, v56);
    sub_100018420();
    v11 = v31;
    if ((v38 & 1) != 0)
      break;
    v3 = v54;
    sub_10008C364(*(uint64_t (**)(uint64_t, uint64_t))(v54 + 8));

    v23 = v57;
    v22 = v58;
LABEL_14:
    v29 += v59;
    if (!--v27)
    {
      swift_bridgeObjectRelease(v26);
      v13 = v46;
      goto LABEL_17;
    }
  }
  v42 = v49;
LABEL_21:
  swift_bridgeObjectRelease(v42);
  v43 = sub_100018420();
  v62[0] = ShortcutsLibraryItem.id.getter(v43);
  v62[1] = v44;
  dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)(v62);
  sub_100030630();

  sub_10008C364(*(uint64_t (**)(uint64_t, uint64_t))(v54 + 8));
  (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v53, v46);
LABEL_22:
  sub_100018094();
}

void sub_100087514()
{
  uint64_t v0;
  _QWORD v1[2];

  v1[0] = static ShortcutsLibraryItem.identifier(for:)();
  v1[1] = v0;
  dispatch thunk of UICollectionViewDiffableDataSource.indexPath(for:)(v1);
  sub_100047F0C();
  sub_100027380();
}

uint64_t sub_10008755C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  _BYTE v6[24];

  v3 = a2 + 16;
  swift_beginAccess(a2 + 16, v6, 0, 0);
  result = swift_weakLoadStrong(v3);
  if (result)
  {
    v5 = result;
    sub_10008783C(a1);
    return swift_release(v5);
  }
  return result;
}

void sub_1000875B8()
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
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  sub_100018190();
  v3 = type metadata accessor for LibrarySectionOptions.SectionType(0);
  v20 = *(_QWORD *)(v3 - 8);
  v21 = v3;
  sub_100018044();
  __chkstk_darwin(v4);
  v5 = sub_10008C2B8();
  sub_100026DAC();
  __chkstk_darwin(v6);
  sub_100018488();
  v7 = dispatch thunk of LibraryDataSource.sections.getter();
  v8 = *(_QWORD *)(v7 + 16);
  if (v8)
  {
    v9 = 0;
    sub_100047E74();
    v19 = v10;
    v12 = v10 + v11;
    v13 = *(_QWORD *)(v2 + 72);
    v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
    while (1)
    {
      v15 = v14(v1, v12, v5);
      v16 = LibrarySectionOptions.sectionType.getter(v15);
      v17 = LibrarySectionOptions.SectionType.count.getter(v16);
      (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v0, v21);
      v18 = __OFADD__(v9, v17);
      v9 += v17;
      if (v18)
        break;
      sub_100079B54(v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
      v12 += v13;
      if (!--v8)
      {
        swift_bridgeObjectRelease(v19);
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  else
  {
    swift_bridgeObjectRelease(v7);
LABEL_7:
    sub_100018094();
  }
}

void sub_1000876B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[2];

  v2 = sub_100012E2C((uint64_t *)&unk_1000D43E0);
  sub_100079E30();
  __chkstk_darwin(v3);
  sub_10001827C();
  v5 = dispatch thunk of UICollectionViewDiffableDataSource.snapshot()(v4);
  v7[0] = ShortcutsLibrarySection.id.getter(v5);
  v7[1] = v6;
  NSDiffableDataSourceSnapshot.numberOfItems(inSection:)(v7, v2);
  sub_1000183D0();
  sub_100026C54(v0, *(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_100026B34();
}

void sub_10008774C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = sub_100012E2C((uint64_t *)&unk_1000D43E0);
  v1 = *(_QWORD *)(v0 - 8);
  __chkstk_darwin(v0);
  sub_1000184A0();
  dispatch thunk of UICollectionViewDiffableDataSource.snapshot()(v2);
  NSDiffableDataSourceSnapshot.numberOfSections.getter(v0);
  sub_100079B48(*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8));
  sub_100018388();
}

uint64_t sub_1000877C4()
{
  uint64_t v0;

  if (*(uint64_t *)(v0 + qword_1000D3FC0) <= 0)
    return *(unsigned __int8 *)(v0 + qword_1000D3FE8);
  else
    return 1;
}

uint64_t sub_1000877F0(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v1 + qword_1000D3FC0);
  v3 = __OFADD__(v2, result);
  v4 = v2 + result;
  if (v3)
    __break(1u);
  else
    *(_QWORD *)(v1 + qword_1000D3FC0) = v4;
  return result;
}

void sub_100087810()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + qword_1000D3FC0);
  v2 = v1 < 1;
  v3 = v1 - 1;
  if (!v2 && (*(_BYTE *)(v0 + qword_1000D3FE8) & 1) == 0)
    *(_QWORD *)(v0 + qword_1000D3FC0) = v3;
}

void sub_10008783C(uint64_t a1)
{
  void **v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t Strong;
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
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t ObjectType;

  v4 = type metadata accessor for AggregatedEntry(0);
  sub_100079E30();
  __chkstk_darwin(v5);
  sub_1000184A0();
  (*(void (**)(void **, uint64_t, uint64_t))(v2 + 16))(v1, a1, v4);
  v6 = sub_100026D68((uint64_t)v1, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 88));
  if (v6 == enum case for AggregatedEntry.userShortcut(_:))
  {
    sub_100079B48(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96));
    v7 = *v1;
    v8 = sub_10005E7FC(qword_1000D3FD0);
    if (v8)
    {
      v9 = (void *)v8;
      v10 = v8 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_delegate;
      Strong = swift_unknownObjectWeakLoadStrong(v8 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_delegate);
      v12 = *(_QWORD *)(v10 + 8);

      if (Strong)
      {
        swift_getObjectType(Strong);
        sub_10008C404();
        dispatch thunk of LibraryDelegate.run(_:from:input:requestOutput:runViewSource:completionHandler:)(v13, v14, v15, v16, v17, v18, v19, v20, v12);
LABEL_9:

        sub_100027130();
LABEL_11:
        sub_100026B34();
        return;
      }
    }
    goto LABEL_10;
  }
  if (v6 == enum case for AggregatedEntry.appShortcut(_:))
  {
    sub_100079B48(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 96));
    v7 = *v1;
    v21 = sub_10005E7FC(qword_1000D3FD0);
    if (v21)
    {
      v22 = (void *)v21;
      v23 = v21 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_delegate;
      v24 = sub_10008C4A0();
      v25 = *(_QWORD *)(v23 + 8);

      if (v24)
      {
        ObjectType = swift_getObjectType(v24);
        dispatch thunk of LibraryDelegate.run(_:)(v7, ObjectType, v25);
        goto LABEL_9;
      }
    }
LABEL_10:

    goto LABEL_11;
  }
  _diagnoseUnexpectedEnumCase<A>(type:)(v4, v4);
  __break(1u);
}

void sub_1000879B0(uint64_t a1, char a2)
{
  uint64_t v2;
  void **v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t (**v7)(uint64_t, uint64_t);
  uint64_t v8;
  void *v9;
  uint64_t Strong;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v5 = sub_10008C600();
  v6 = type metadata accessor for LibrarySectionOptions.SectionType(v5);
  v7 = *(uint64_t (***)(uint64_t, uint64_t))(v6 - 8);
  __chkstk_darwin(v6);
  sub_100018488();
  LibrarySectionOptions.sectionType.getter(v8);
  if (sub_100026D68((uint64_t)v3, v7[11]) == enum case for LibrarySectionOptions.SectionType.shortcuts(_:))
  {
    sub_100026D68((uint64_t)v3, v7[12]);
    v9 = *v3;
    Strong = swift_unknownObjectWeakLoadStrong(v2 + qword_1000D3FD0);
    if (Strong)
    {
      v11 = (void *)Strong;
      if ((a2 & 1) != 0)
      {
        v12 = *(void **)(Strong + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_searchController);
        if (v12)
        {
          v13 = v12;
          v14 = sub_1000694C8();
          v16 = v15;
        }
        else
        {
          v14 = 0;
          v16 = 0;
        }
        sub_1000507EC();
        v17 = (void *)static LibraryDataSource.searchPredicate(for:)(v14, v16);

        Strong = sub_100030630();
      }
      else
      {
        v17 = 0;
      }
      sub_100079D80(Strong, "setSearchPredicate:");

    }
  }
  else
  {
    sub_100026D68((uint64_t)v3, v7[1]);
  }
  sub_100026B34();
}

void sub_100087ADC()
{
  _swift_stdlib_reportUnimplementedInitializer("Shortcuts.DataSource", 20, "init(layoutMode:canChangeLayoutModes:shortcutMoveService:database:)", 67, 0);
  __break(1u);
}

void sub_100087B08()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + qword_1000D3FD0);
  swift_bridgeObjectRelease(*(_QWORD *)(v0 + qword_1000D3FD8));

}

void sub_100087B54()
{
  uint64_t v0;

  v0 = LibraryDataSource.deinit();

  swift_unknownObjectWeakDestroy(v0 + qword_1000D3FD0);
  swift_bridgeObjectRelease();
  sub_100026D28(qword_1000D3FE0);
  sub_100018188();
}

uint64_t sub_100087BB0()
{
  uint64_t v0;

  sub_100087B54();
  return swift_deallocClassInstance(v0, 57, 7);
}

uint64_t sub_100087BCC()
{
  return _s10DataSourceCMa(0);
}

uint64_t sub_100087BD4(void *a1, uint64_t a2)
{
  char *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void **v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  _BYTE *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSString v34;
  Class isa;
  id v36;
  void *v37;
  id v38;
  unsigned __int8 v39;
  uint64_t v40;
  _BYTE *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  NSString v47;
  Class v48;
  id v49;
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
  NSString v63;
  Class v64;
  id v65;
  id v66;
  double Width;
  void *v68;
  double v69;
  double v70;
  id v71;
  double v72;
  double v73;
  uint64_t v74;
  id v75;
  void (*v76)(_BYTE *, uint64_t);
  _BYTE *v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSString v88;
  Class v89;
  id v90;
  id v91;
  id v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _BYTE v96[12];
  unsigned int v97;
  uint64_t v98;
  _BYTE *v99;
  uint64_t v100;
  uint64_t v101;
  _BYTE *v102;
  uint64_t v103;
  id v104;
  char *v105;
  _QWORD v106[2];
  id v107;
  CGRect v108;

  v104 = a1;
  v4 = type metadata accessor for AutoShortcutAppSection(0);
  v100 = *(_QWORD *)(v4 - 8);
  v101 = v4;
  __chkstk_darwin(v4);
  v99 = &v96[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = sub_100012E2C((uint64_t *)&unk_1000D4470);
  v7 = __chkstk_darwin(v6);
  v9 = &v96[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  v102 = &v96[-v10];
  v11 = type metadata accessor for ShortcutsLibraryItem.ItemType(0);
  v12 = *(_QWORD *)(v11 - 8);
  __chkstk_darwin(v11);
  v14 = (void **)&v96[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v15 = sub_100012E2C(&qword_1000D3670);
  __chkstk_darwin(v15);
  v17 = &v96[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = type metadata accessor for ShortcutsLibraryItem(0);
  v19 = *(_QWORD *)(v18 - 8);
  v20 = __chkstk_darwin(v18);
  v22 = &v96[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v105 = v2;
  v23 = sub_100012A90(v20);
  v103 = a2;
  sub_100012EC0(a2, (uint64_t)v17);
  swift_release(v23);
  if (sub_100019D44((uint64_t)v17, 1, v18) != 1)
  {
    v25 = (*(uint64_t (**)(_BYTE *, _BYTE *, uint64_t))(v19 + 32))(v22, v17, v18);
    v26 = v18;
    ShortcutsLibraryItem.itemType.getter(v25);
    v27 = (*(uint64_t (**)(void **, uint64_t))(v12 + 88))(v14, v11);
    v28 = v22;
    if (v27 == enum case for ShortcutsLibraryItem.ItemType.workflow(_:))
    {
      (*(void (**)(void **, uint64_t))(v12 + 96))(v14, v11);
      v29 = *v14;
      v30 = type metadata accessor for LibraryCell();
      v106[0] = v30;
      v31 = sub_100012E2C(&qword_1000D4430);
      String.init<A>(describing:)(v106, v31);
      v33 = v32;
      v34 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v33);
      isa = IndexPath._bridgeToObjectiveC()().super.isa;
      v36 = objc_msgSend(v104, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v34, isa);

      v24 = swift_dynamicCastClassUnconditional(v36, v30, 0, 0, 0);
      v37 = v105;
      sub_100012AF4(v106);
      v38 = v107;
      sub_100012E6C(v106);
      sub_10008BE80(v29, v38, (uint64_t)v37);

      v39 = objc_msgSend(v37, "isEditing");
      *(_BYTE *)(v24 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_isJiggling) = v39;
      sub_100013738();
      sub_1000483A0(v24, 0, 0, 0);

      (*(void (**)(_BYTE *, uint64_t))(v19 + 8))(v28, v26);
      return v24;
    }
    v40 = v19;
    v98 = v26;
    if (v27 == enum case for ShortcutsLibraryItem.ItemType.autoShortcut(_:))
    {
      v41 = v28;
      (*(void (**)(void **, uint64_t))(v12 + 96))(v14, v11);
      v42 = *v14;
      v43 = type metadata accessor for LibraryCell();
      v106[0] = v43;
      v44 = sub_100012E2C(&qword_1000D4430);
      String.init<A>(describing:)(v106, v44);
      v46 = v45;
      v47 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v46);
      v48 = IndexPath._bridgeToObjectiveC()().super.isa;
      v49 = objc_msgSend(v104, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v47, v48);

      v24 = swift_dynamicCastClassUnconditional(v49, v43, 0, 0, 0);
      v50 = sub_100012A90(v24);
      v51 = (uint64_t)v102;
      sub_100086EF0();
      swift_release(v50);
      sub_10000D74C(v51, (uint64_t)v9, (uint64_t *)&unk_1000D4470);
      v52 = type metadata accessor for AutoShortcutApp(0);
      if (sub_100019D44((uint64_t)v9, 1, v52) == 1)
      {
        sub_10001222C((uint64_t)v9, (uint64_t *)&unk_1000D4470);
        v53 = 0;
        v54 = 0;
      }
      else
      {
        v53 = AutoShortcutApp.bundleIdentifier.getter();
        v54 = v78;
        (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v52 - 8) + 8))(v9, v52);
      }
      v79 = (uint64_t)v105;
      sub_100012AF4(v106);
      v80 = v107;
      sub_100012E6C(v106);
      sub_10008C008(v42, v53, v54, v80, v79);

      swift_bridgeObjectRelease(v54);
      sub_10001222C(v51, (uint64_t *)&unk_1000D4470);
      v76 = *(void (**)(_BYTE *, uint64_t))(v40 + 8);
      v77 = v41;
    }
    else
    {
      if (v27 != enum case for ShortcutsLibraryItem.ItemType.appShortcutTopHit(_:))
      {
        if (v27 == enum case for ShortcutsLibraryItem.ItemType.emptyState(_:))
        {
          (*(void (**)(void **, uint64_t))(v12 + 96))(v14, v11);
          v82 = *v14;
          v83 = (char *)v14 + *(int *)(sub_100012E2C((uint64_t *)&unk_1000D3680) + 48);
          v84 = _s16EmptySectionCellCMa();
          v106[0] = v84;
          v85 = sub_100012E2C(&qword_1000D4438);
          String.init<A>(describing:)(v106, v85);
          v87 = v86;
          v88 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease(v87);
          v89 = IndexPath._bridgeToObjectiveC()().super.isa;
          v90 = objc_msgSend(v104, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v88, v89);

          v24 = swift_dynamicCastClassUnconditional(v90, v84, 0, 0, 0);
          sub_100012AF4(v106);
          v91 = v107;
          sub_100012E6C(v106);
          v92 = objc_msgSend(v91, "floatingViewConfiguration");

          objc_msgSend(v92, "cornerRadius");
          v94 = v93;

          *(_QWORD *)(v24
                    + OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_cornerRadius) = v94;
          sub_1000889D0();
          sub_1000889BC(v82);
          (*(void (**)(_BYTE *, uint64_t))(v19 + 8))(v28, v98);
          v95 = type metadata accessor for LibrarySectionOptions(0);
          (*(void (**)(char *, uint64_t))(*(_QWORD *)(v95 - 8) + 8))(v83, v95);
          return v24;
        }
        (*(void (**)(_BYTE *, uint64_t))(v19 + 8))(v28, v98);
        (*(void (**)(void **, uint64_t))(v12 + 8))(v14, v11);
        return 0;
      }
      (*(void (**)(void **, uint64_t))(v12 + 96))(v14, v11);
      v55 = *(int *)(sub_100012E2C(&qword_1000D0AD8) + 48);
      v102 = (_BYTE *)v19;
      v97 = *((unsigned __int8 *)v14 + v55);
      v57 = (uint64_t)v99;
      v56 = v100;
      v58 = v101;
      (*(void (**)(_BYTE *, void **, uint64_t))(v100 + 32))(v99, v14, v101);
      v59 = _s10TopHitCellCMa();
      v106[0] = v59;
      v60 = sub_100012E2C((uint64_t *)&unk_1000D4440);
      String.init<A>(describing:)(v106, v60);
      v62 = v61;
      v63 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease(v62);
      v64 = IndexPath._bridgeToObjectiveC()().super.isa;
      v65 = v104;
      v66 = objc_msgSend(v104, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v63, v64);

      v24 = swift_dynamicCastClassUnconditional(v66, v59, 0, 0, 0);
      objc_msgSend(v65, "frame");
      Width = CGRectGetWidth(v108);
      v68 = *(void **)&v105[OBJC_IVAR____TtC9Shortcuts21LibraryViewController_flowLayout];
      objc_msgSend(v68, "sectionInset");
      v70 = Width - v69;
      v71 = objc_msgSend(v68, "sectionInset");
      v73 = v70 - v72;
      v74 = sub_100012A90(v71);
      v75 = sub_100011648(v73, v57, v97);
      swift_release(v74);
      sub_1000892D8(v75);

      (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v57, v58);
      v76 = (void (*)(_BYTE *, uint64_t))*((_QWORD *)v102 + 1);
      v77 = v28;
    }
    v76(v77, v98);
    return v24;
  }
  sub_10001222C((uint64_t)v17, &qword_1000D3670);
  return 0;
}

uint64_t sub_10008843C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t result;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _BYTE v15[24];

  v2 = type metadata accessor for LibraryWorkflowCreationBehavior(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v15[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = type metadata accessor for LibrarySectionOptions(0);
  v7 = *(_QWORD *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = &v15[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  a1 += 16;
  swift_beginAccess(a1, v15, 0, 0);
  result = swift_unknownObjectWeakLoadStrong(a1);
  if (result)
  {
    v11 = (void *)result;
    v12 = ShortcutsLibrarySection.options.getter(result);
    LibrarySectionOptions.workflowCreationBehavior.getter(v12);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v13 = type metadata accessor for LibraryViewController(0);
    sub_1000040A8(&qword_1000D4460, type metadata accessor for LibraryViewController);
    LibraryOperations.createWorkflow(from:withBehavior:)(0x685F7265646C6F66, 0xED00007265646165, v5, v13);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return result;
}

void sub_1000885A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjectType;
  _BYTE v10[24];

  v3 = a1 + 16;
  swift_beginAccess(a1 + 16, v10, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    v6 = Strong + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_delegate;
    v7 = swift_unknownObjectWeakLoadStrong(Strong + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_delegate);
    v8 = *(_QWORD *)(v6 + 8);

    if (v7)
    {
      ObjectType = swift_getObjectType(v7);
      dispatch thunk of LibraryDelegate.navigateToAutoShortcutApp(_:)(a2, ObjectType, v8);
      swift_unknownObjectRelease(v7);
    }
  }
}

id sub_100088644(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4;
  id v7;
  id v8;
  NSString v9;

  v7 = a2;
  if (a2)
  {
    v8 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata(v4));
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
    v7 = objc_msgSend(v8, "initWithSymbolName:symbolColor:background:", v9, a3, a4);

  }
  else
  {

  }
  return v7;
}

id sub_100088710(uint64_t a1)
{
  return sub_1000888C4(a1, _s17SectionHeaderViewCMa);
}

void sub_10008871C(uint64_t a1)
{
  sub_100079ACC(a1, OBJC_IVAR____TtCC9Shortcuts21LibraryViewController20LibrarySectionHeader_header);
}

void sub_100088728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  sub_100047E90(a1, (unint64_t *)&qword_1000D43C0, WFAppIcon_ptr);
  AutoShortcutApp.bundleIdentifier.getter();
  sub_10008668C();
  v6 = v5;
  v7 = AutoShortcutApp.localizedName.getter();
  v9 = v8;
  v10 = v6;
  sub_10000A0AC(v7, v9, v6, 0, 0, a2, a3);
  swift_bridgeObjectRelease(v9);

}

void sub_1000887EC()
{
  void *v0;
  uint64_t (*v1)(void);
  objc_super v2;

  sub_10008C330();
  v2.receiver = v0;
  v2.super_class = (Class)v1();
  sub_10008C274(&v2, "initWithFrame:");
  sub_10008C490();
}

void sub_100088850(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;

  v10.receiver = v3;
  v10.super_class = (Class)a3(a2);
  sub_10008C5E8((uint64_t)v10.super_class, "initWithCoder:", v4, v5, v6, v7, v8, v9, v10);
  sub_100042738();
  sub_1000270C4();
}

id sub_1000888B8(uint64_t a1)
{
  return sub_1000888C4(a1, _s21AppShortcutHeaderViewCMa);
}

id sub_1000888C4(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = v2;
  v10.super_class = (Class)a2();
  return sub_100079EA8((uint64_t)v10.super_class, "dealloc", v3, v4, v5, v6, v7, v8, v10);
}

void sub_1000888F0(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v4;

  *(_QWORD *)a2 = static VerticalAlignment.center.getter(a1);
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  v4 = sub_100012E2C(&qword_1000D4290);
  sub_100005348(v2, a2 + *(int *)(v4 + 44));
}

id sub_10008896C(uint64_t a1)
{
  return sub_1000888C4(a1, _s20LibrarySectionHeaderCMa);
}

void sub_100088988()
{
  uint64_t v0;

  objc_msgSend(*(id *)(v0+ OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_textView), "setAttributedText:", *(_QWORD *)(v0+ OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_message));
  sub_100089020();
}

void sub_1000889BC(void *a1)
{
  sub_10008A1E4(a1, &OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_message, sub_100088988);
}

void sub_1000889D0()
{
  char *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, "selectedBackgroundView");
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, "layer");

    objc_msgSend(v3, "setCornerRadius:", *(double *)&v0[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_cornerRadius]);
  }
}

char *sub_100088A5C(double a1, double a2, double a3, double a4)
{
  char *v4;
  uint64_t v9;
  id v10;
  char *v11;
  char *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  Class isa;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v46;
  objc_super v47;

  v9 = OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_textView;
  v10 = objc_allocWithZone((Class)UITextView);
  v11 = v4;
  *(_QWORD *)&v4[v9] = objc_msgSend(v10, "init");
  *(_QWORD *)&v11[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_message] = 0;
  *(_QWORD *)&v11[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_cornerRadius] = 0;

  v47.receiver = v11;
  v47.super_class = (Class)_s16EmptySectionCellCMa();
  v12 = (char *)objc_msgSendSuper2(&v47, "initWithFrame:", a1, a2, a3, a4);
  v13 = OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_textView;
  v14 = *(void **)&v12[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_textView];
  v15 = v12;
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v14, "setAdjustsFontForContentSizeCategory:", 1);
  v16 = objc_msgSend(v15, "contentView");
  objc_msgSend(v16, "addSubview:", v14);

  v46 = (id)objc_opt_self(NSLayoutConstraint);
  v17 = sub_100012E2C((uint64_t *)&unk_1000D3690);
  v18 = swift_allocObject(v17, 56, 7);
  *(_OWORD *)(v18 + 16) = xmmword_100096F80;
  v19 = objc_msgSend(*(id *)&v12[v13], "leadingAnchor");
  v20 = objc_msgSend(v15, "contentView");
  v21 = objc_msgSend(v20, "layoutMarginsGuide");

  v22 = objc_msgSend(v21, "leadingAnchor");
  v23 = objc_msgSend(v19, "constraintEqualToAnchor:", v22);

  *(_QWORD *)(v18 + 32) = v23;
  v24 = objc_msgSend(*(id *)&v12[v13], "trailingAnchor");
  v25 = objc_msgSend(v15, "contentView");
  v26 = objc_msgSend(v25, "layoutMarginsGuide");

  v27 = objc_msgSend(v26, "trailingAnchor");
  v28 = objc_msgSend(v24, "constraintEqualToAnchor:", v27);

  *(_QWORD *)(v18 + 40) = v28;
  v29 = objc_msgSend(*(id *)&v12[v13], "centerYAnchor");
  v30 = objc_msgSend(v15, "contentView");
  v31 = objc_msgSend(v30, "layoutMarginsGuide");

  v32 = objc_msgSend(v31, "centerYAnchor");
  v33 = objc_msgSend(v29, "constraintEqualToAnchor:", v32);

  *(_QWORD *)(v18 + 48) = v33;
  specialized Array._endMutation()(v34, v35);
  sub_100003B2C(0, &qword_1000D1398, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  objc_msgSend(v46, "activateConstraints:", isa);

  v37 = *(void **)&v12[v13];
  objc_msgSend(v37, "setScrollEnabled:", 0);
  objc_msgSend(v37, "setEditable:", 0);
  v38 = objc_msgSend(v37, "textContainer");
  objc_msgSend(v38, "setLineFragmentPadding:", 0.0);

  v39 = *(void **)&v12[v13];
  objc_msgSend(v39, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  v40 = (void *)objc_opt_self(UIColor);
  v41 = v39;
  v42 = objc_msgSend(v40, "clearColor");
  objc_msgSend(v41, "setBackgroundColor:", v42);

  sub_100089020();
  v43 = objc_msgSend(objc_allocWithZone((Class)UIView), "init");
  v44 = objc_msgSend(v40, "secondarySystemBackgroundColor");
  objc_msgSend(v43, "setBackgroundColor:", v44);

  objc_msgSend(v15, "setSelectedBackgroundView:", v43);
  return v15;
}

void sub_100088F60()
{
  char *v0;
  uint64_t v1;

  v1 = OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_textView;
  *(_QWORD *)&v0[v1] = objc_msgSend(objc_allocWithZone((Class)UITextView), "init");
  *(_QWORD *)&v0[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_message] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_cornerRadius] = 0;

  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010009C2C0, "Shortcuts/LibraryViewController+DataSource.swift", 48, 2, 548, 0);
  __break(1u);
}

void sub_100089020()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;

  v1 = *(void **)(v0
                + OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE916EmptySectionCell_textView);
  v2 = objc_msgSend((id)objc_opt_self(UIColor), "secondaryLabelColor");
  objc_msgSend(v1, "setTextColor:", v2);

  objc_msgSend(v1, "setTextAlignment:", 1);
  v3 = objc_msgSend((id)objc_opt_self(UIFont), "preferredFontForTextStyle:", UIFontTextStyleBody);
  objc_msgSend(v1, "setFont:", v3);

}

id sub_1000890E4()
{
  return sub_1000888C4(0, _s16EmptySectionCellCMa);
}

void sub_10008912C(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v2 = *(void **)(v1
                + OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell_hostingView);
  *(_QWORD *)(v1
            + OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell_hostingView) = a1;

}

void sub_100089140()
{
  char *v0;
  void *v1;
  id v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = v0;
  v12.super_class = (Class)_s10TopHitCellCMa();
  objc_msgSendSuper2(&v12, "layoutSubviews");
  v1 = *(void **)&v0[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell_hostingView];
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v0, "contentView");
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    objc_msgSend(v2, "setFrame:", v5, v7, v9, v11);
  }
}

void sub_100089238()
{
  char *v0;
  void *v1;
  id v2;
  objc_super v3;

  v3.receiver = v0;
  v3.super_class = (Class)_s10TopHitCellCMa();
  objc_msgSendSuper2(&v3, "prepareForReuse");
  v1 = *(void **)&v0[OBJC_IVAR____TtCC9Shortcuts21LibraryViewControllerP33_92562CD5492E919F87A213A8E0FD4AE910TopHitCell_hostingView];
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v2, "removeFromSuperview");
    sub_10008912C(0);

  }
}

void sub_1000892D8(void *a1)
{
  void *v1;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  Class isa;

  v3 = a1;
  sub_10008912C((uint64_t)a1);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = objc_msgSend(v1, "contentView");
  objc_msgSend(v4, "addSubview:", v3);

  v5 = (void *)objc_opt_self(NSLayoutConstraint);
  v6 = sub_100012E2C((uint64_t *)&unk_1000D3690);
  v7 = swift_allocObject(v6, 64, 7);
  *(_OWORD *)(v7 + 16) = xmmword_100097450;
  v8 = objc_msgSend(v3, "leadingAnchor");
  v9 = objc_msgSend(v1, "contentView");
  v10 = objc_msgSend(v9, "leadingAnchor");

  v11 = objc_msgSend(v8, "constraintEqualToAnchor:", v10);
  *(_QWORD *)(v7 + 32) = v11;
  v12 = objc_msgSend(v3, "trailingAnchor");
  v13 = objc_msgSend(v1, "contentView");
  v14 = objc_msgSend(v13, "trailingAnchor");

  v15 = objc_msgSend(v12, "constraintEqualToAnchor:", v14);
  *(_QWORD *)(v7 + 40) = v15;
  v16 = objc_msgSend(v3, "topAnchor");
  v17 = objc_msgSend(v1, "contentView");
  v18 = objc_msgSend(v17, "topAnchor");

  v19 = objc_msgSend(v16, "constraintEqualToAnchor:", v18);
  *(_QWORD *)(v7 + 48) = v19;
  v20 = objc_msgSend(v3, "bottomAnchor");
  v21 = objc_msgSend(v1, "contentView");
  v22 = objc_msgSend(v21, "bottomAnchor");

  v23 = objc_msgSend(v20, "constraintEqualToAnchor:", v22);
  *(_QWORD *)(v7 + 56) = v23;
  specialized Array._endMutation()(v24, v25);
  sub_100003B2C(0, &qword_1000D1398, NSLayoutConstraint_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  objc_msgSend(v5, "activateConstraints:", isa);

}

void sub_1000895D4()
{
  char *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  objc_super v4;

  sub_10008C330();
  *(_QWORD *)&v0[*v1] = 0;
  v4.receiver = v0;
  v4.super_class = (Class)v3(v2);
  sub_10008C274(&v4, "initWithFrame:");
  sub_10008C490();
}

void sub_100089650(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  *(_QWORD *)&v4[*a2] = 0;
  v11.receiver = v4;
  v11.super_class = (Class)a4(a3);
  sub_10008C5E8((uint64_t)v11.super_class, "initWithCoder:", v5, v6, v7, v8, v9, v10, v11);
  sub_100042738();
  sub_1000270C4();
}

id sub_1000896CC()
{
  return sub_1000888C4(0, _s10TopHitCellCMa);
}

void sub_1000896EC(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char *v19;
  uint64_t v20;

  v2 = type metadata accessor for ButtonStyleConfiguration.Label(0);
  v3 = *(_QWORD *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_100012E2C(&qword_1000D3FA8);
  __chkstk_darwin(v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_100012E2C((uint64_t *)&unk_1000D44C0);
  v10 = __chkstk_darwin(v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = ButtonStyleConfiguration.label.getter(v10);
  if ((ButtonStyleConfiguration.isPressed.getter(v13) & 1) != 0)
    v14 = 0.5;
  else
    v14 = 1.0;
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v8, v5, v2);
  *(double *)&v8[*(int *)(v6 + 36)] = v14;
  v15 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v16 = ButtonStyleConfiguration.isPressed.getter(v15);
  v17 = 0;
  if ((v16 & 1) == 0)
  {
    v16 = static Animation.easeInOut(duration:)(0.25);
    v17 = v16;
  }
  v18 = ButtonStyleConfiguration.isPressed.getter(v16);
  sub_10000D74C((uint64_t)v8, (uint64_t)v12, &qword_1000D3FA8);
  v19 = &v12[*(int *)(v9 + 36)];
  *(_QWORD *)v19 = v17;
  v19[8] = v18 & 1;
  sub_10001222C((uint64_t)v8, &qword_1000D3FA8);
  sub_1000123CC((uint64_t)v12, a1, (uint64_t *)&unk_1000D44C0);
}

void sub_1000898A0(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  id v9;

  v2 = *(void **)(a1 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_workflowReference);
  if (v2)
  {
    v3 = v1 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_delegate;
    Strong = swift_unknownObjectWeakLoadStrong(v3);
    if (Strong)
    {
      v5 = Strong;
      v6 = *(_QWORD *)(v3 + 8);
      ObjectType = swift_getObjectType(Strong);
      v8 = *(_QWORD *)(v6 + 8);
      v9 = v2;
      WorkflowOpener.openWorkflow(_:)(v9, ObjectType, v8);
      swift_unknownObjectRelease(v5);

      sub_100027130();
    }
  }
  sub_10008C37C();
}

void sub_100089984(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t ObjectType;
  id v7;
  void *v8;
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

  v2 = *(void **)(a1 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_autoShortcut);
  if (v2)
  {
    v3 = sub_100079E9C(OBJC_IVAR____TtC9Shortcuts21LibraryViewController_delegate);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)(v1 + 8);
      ObjectType = swift_getObjectType(v3);
      v7 = v2;
      dispatch thunk of LibraryDelegate.run(_:)(v7, ObjectType, v5);
LABEL_7:

      swift_unknownObjectRelease(v4);
      return;
    }
  }
  else
  {
    v8 = *(void **)(a1 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_workflowReference);
    if (v8)
    {
      v9 = sub_100079E9C(OBJC_IVAR____TtC9Shortcuts21LibraryViewController_delegate);
      if (v9)
      {
        v4 = v9;
        v10 = *(_QWORD *)(v1 + 8);
        v11 = swift_getObjectType(v9);
        v7 = v8;
        sub_10008C404();
        dispatch thunk of LibraryDelegate.run(_:from:input:requestOutput:runViewSource:completionHandler:)(v12, v13, v14, v15, v16, v17, v18, v11, v10);
        goto LABEL_7;
      }
    }
  }
  sub_10008C37C();
}

void sub_100089A5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t ObjectType;
  uint64_t v8;
  uint64_t v9;
  char v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  sub_100012E2C((uint64_t *)&unk_1000D30D0);
  sub_100018034();
  __chkstk_darwin(v1);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = v0 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_delegate;
  v5 = sub_10008C4A0();
  if (v5)
  {
    v6 = *(_QWORD *)(v4 + 8);
    ObjectType = swift_getObjectType(v5);
    dispatch thunk of LibraryDelegate.runningWorkflow.getter(ObjectType, v6);
    sub_100027130();
    v8 = type metadata accessor for RunningWorkflow(0);
    v9 = sub_100026C7C((uint64_t)v3);
    if (v10)
    {
      sub_10001222C((uint64_t)v3, (uint64_t *)&unk_1000D30D0);
    }
    else
    {
      v11 = (void (*)(uint64_t))RunningWorkflow.stop.getter(v9);
      v13 = v12;
      v14 = sub_100026C54((uint64_t)v3, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8));
      v11(v14);
      swift_release(v13);
    }
  }
  sub_100018388();
}

void sub_100089B34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20)
{
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  char *v33;
  void *v34;
  void *v35;
  id v36;
  void (*v37)(uint64_t, char *, uint64_t);
  char v38;
  unsigned int v39;
  void *v40;
  void *v41;
  NSIndexPath v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;

  sub_100018190();
  a19 = v22;
  a20 = v23;
  v25 = v24;
  sub_100012E2C(&qword_1000D10F0);
  sub_100018034();
  __chkstk_darwin(v26);
  sub_1000181C8();
  v27 = type metadata accessor for IndexPath(0);
  sub_10004282C();
  v29 = __chkstk_darwin(v28);
  v31 = (char *)&a9 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  v33 = (char *)&a9 - v32;
  sub_10000C98C();
  v35 = v34;
  v36 = objc_msgSend(v34, "indexPathForCell:", v25);

  if (!v36)
  {
    sub_100047F28(v20, 1);
    goto LABEL_6;
  }
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(v36);

  v37 = *(void (**)(uint64_t, char *, uint64_t))(v21 + 32);
  v37(v20, v31, v27);
  sub_100047F28(v20, 0);
  sub_100026C7C(v20);
  if (v38)
  {
LABEL_6:
    sub_10001222C(v20, &qword_1000D10F0);
    goto LABEL_9;
  }
  v37((uint64_t)v33, (char *)v20, v27);
  v39 = objc_msgSend(v25, "isSelected");
  sub_100047E58();
  v41 = v40;
  v42.super.isa = IndexPath._bridgeToObjectiveC()().super.isa;
  if (v39)
  {
    objc_msgSend(v41, "deselectItemAtIndexPath:animated:", v42.super.isa, 1);

    sub_100047E58();
    v44 = (void *)v43;
    sub_10007744C(v43);
  }
  else
  {
    objc_msgSend(v41, "selectItemAtIndexPath:animated:scrollPosition:", v42.super.isa, 1, 0);

    sub_100047E58();
    v44 = (void *)v45;
    sub_100077310(v45, (uint64_t)v33);
  }

  sub_100026C54((uint64_t)v33, *(uint64_t (**)(uint64_t, uint64_t))(v21 + 8));
LABEL_9:
  sub_100018094();
}

#error "100089D28: call analysis failed (funcsize=17)"

uint64_t sub_100089D48()
{
  return 0;
}

uint64_t sub_100089D50()
{
  return sub_100089D48() & 1;
}

CGFloat sub_100089D74()
{
  return sub_100089D94();
}

CGFloat sub_100089D94()
{
  return UIViewNoIntrinsicMetric;
}

uint64_t sub_100089DA8(uint64_t a1)
{
  objc_class *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v10;

  v3 = type metadata accessor for ShortcutChiclet(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  v8 = _UIHostingView.init(rootView:)(v6);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v8;
}

void sub_100089E50(uint64_t a1, uint64_t a2, void *a3)
{
  sub_100088850((uint64_t)a3, 0, type metadata accessor for LibraryCellHostingView);
}

id sub_100089E80()
{
  return sub_1000888C4(0, (uint64_t (*)(void))type metadata accessor for LibraryCellHostingView);
}

uint64_t sub_100089E90()
{
  return type metadata accessor for LibraryCellHostingView(0);
}

void sub_100089E98(uint64_t a1)
{
  sub_100079ACC(a1, OBJC_IVAR____TtC9Shortcuts11LibraryCell_hostingView);
}

void sub_100089EC4()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_workflowReference);
  sub_100018188();
}

void sub_100089F34(uint64_t a1)
{
  sub_100079ACC(a1, OBJC_IVAR____TtC9Shortcuts11LibraryCell_workflowReference);
}

void sub_100089F60()
{
  uint64_t v0;
  id v1;

  v1 = *(id *)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_autoShortcut);
  sub_100018188();
}

void sub_100089FD0(uint64_t a1)
{
  sub_100079ACC(a1, OBJC_IVAR____TtC9Shortcuts11LibraryCell_autoShortcut);
}

uint64_t sub_100089FDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_associatedBundleId);
  v4 = *(_QWORD *)(v2 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_associatedBundleId + 8);
  *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease(v4);
}

void sub_100089FF8()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  void (*v15)(char *, uint64_t);
  id v16;
  void *v17;
  id v18;
  double v19;
  double v20;
  uint64_t v21;

  v1 = v0;
  v2 = type metadata accessor for ShortcutChiclet.Model.Metrics(0);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = __chkstk_darwin(v2);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v8 = (char *)&v21 - v7;
  v9 = OBJC_IVAR____TtC9Shortcuts11LibraryCell_layoutMetrics;
  v10 = *(void **)&v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_layoutMetrics];
  if (v10)
  {
    v11 = v10;
    v12 = sub_100013974(v11, (uint64_t)v8);
    dispatch thunk of ShortcutChiclet.Model.metrics.getter(v12);
    sub_1000040A8(&qword_1000D43B0, (uint64_t (*)(uint64_t))&type metadata accessor for ShortcutChiclet.Model.Metrics);
    v14 = dispatch thunk of static Equatable.== infix(_:_:)(v8, v6, v2, v13);
    v15 = *(void (**)(char *, uint64_t))(v3 + 8);
    v15(v6, v2);
    if ((v14 & 1) != 0)
    {
      v15(v8, v2);

    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
      dispatch thunk of ShortcutChiclet.Model.metrics.setter(v6);
      v16 = objc_msgSend(v1, "layer");
      v17 = *(void **)&v1[v9];
      if (v17)
      {
        v18 = objc_msgSend(v17, "floatingViewConfiguration");
        objc_msgSend(v18, "cornerRadius");
        v20 = v19;

      }
      else
      {
        v20 = 0.0;
      }
      objc_msgSend(v16, "setCornerRadius:", v20);

      v15(v8, v2);
    }
  }
}

void sub_10008A1D0(void *a1)
{
  sub_10008A1E4(a1, &OBJC_IVAR____TtC9Shortcuts11LibraryCell_layoutMetrics, sub_100089FF8);
}

void sub_10008A1E4(void *a1, _QWORD *a2, void (*a3)(void))
{
  uint64_t v3;
  void *v5;
  id v6;

  v5 = *(void **)(v3 + *a2);
  *(_QWORD *)(v3 + *a2) = a1;
  v6 = a1;

  a3();
  sub_100047D38(v6);
}

double sub_10008A224()
{
  uint64_t v0;
  uint64_t v1;
  double result;

  v1 = swift_allocObject(&unk_1000C3AC0, 24, 7);
  swift_unknownObjectWeakInit(v1 + 16, v0);
  swift_retain(v1);
  dispatch thunk of ShortcutChiclet.Model.buttonAction.setter(sub_10008B918, v1);
  *(_QWORD *)&result = swift_release(v1).n128_u64[0];
  return result;
}

void sub_10008A294(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  void *v4;
  void *v5;
  _BYTE v6[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    v4 = (void *)swift_unknownObjectWeakLoadStrong(Strong + OBJC_IVAR____TtC9Shortcuts11LibraryCell_delegate);
    if (v4)
    {
      v5 = v4;
      objc_msgSend(v4, "libraryCellDidRequestComposeUI:", v3);

      swift_unknownObjectRelease(v5);
    }
    else
    {

    }
  }
}

uint64_t sub_10008A318(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_delegate;
  *(_QWORD *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign(v4, a1);
  sub_10008A224();
  return swift_unknownObjectRelease(a1);
}

void sub_10008A354(uint64_t a1, double a2)
{
  id v4;
  uint64_t v5;
  double v6;
  Class isa;
  Class v8;
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;
  uint64_t v16;
  double v17;
  id v18;
  id v19;

  sub_100047E90(a1, &qword_1000D43B8, CABasicAnimation_ptr);
  v4 = sub_10008AEB0(0xD000000000000017, a1);
  objc_msgSend(v4, "setDuration:", a2);
  v5 = sub_10008C318((uint64_t)v4);
  sub_10008C558(v6, v5, "setBeginTime:");

  isa = Double._bridgeToObjectiveC()().super.super.isa;
  sub_100079D80((uint64_t)isa, "setFromValue:");

  v8 = Double._bridgeToObjectiveC()().super.super.isa;
  sub_100079D80((uint64_t)v8, "setToValue:");

  v9 = objc_allocWithZone((Class)CAMediaTimingFunction);
  v10 = sub_100027640();
  LODWORD(v11) = 1052266988;
  LODWORD(v12) = 1059145646;
  v15 = sub_10008C460(v11, v13, v12, v14, (uint64_t)v10, "initWithControlPoints::::");
  sub_100079D80((uint64_t)v15, "setTimingFunction:");

  v18 = sub_10008C450(v17, v16, "setRepeatCount:");
  v19 = sub_10008C620((uint64_t)v18, "setAutoreverses:");
  sub_10008C2E4((uint64_t)v19, "setRemovedOnCompletion:");
  sub_10008C5F4();
}

void sub_10008A478(uint64_t a1)
{
  id v1;
  uint64_t v2;
  double v3;
  Class isa;
  Class v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  uint64_t v13;
  double v14;
  id v15;
  id v16;

  sub_100047E90(a1, &qword_1000D43B8, CABasicAnimation_ptr);
  v1 = sub_10008AEB0(0xD000000000000012, 0x800000010009F030);
  objc_msgSend(v1, "setDuration:", 0.128);
  v2 = sub_10008C318((uint64_t)v1);
  sub_10008C558(v3, v2, "setBeginTime:");

  isa = Double._bridgeToObjectiveC()().super.super.isa;
  sub_100079D80((uint64_t)isa, "setFromValue:");

  v5 = Double._bridgeToObjectiveC()().super.super.isa;
  sub_100079D80((uint64_t)v5, "setToValue:");

  v6 = objc_allocWithZone((Class)CAMediaTimingFunction);
  v7 = sub_100027640();
  LODWORD(v8) = 1052266988;
  LODWORD(v9) = 1059145646;
  v12 = sub_10008C460(v8, v10, v9, v11, (uint64_t)v7, "initWithControlPoints::::");
  sub_100079D80((uint64_t)v12, "setTimingFunction:");

  v15 = sub_10008C450(v14, v13, "setRepeatCount:");
  v16 = sub_10008C620((uint64_t)v15, "setAutoreverses:");
  sub_10008C2E4((uint64_t)v16, "setRemovedOnCompletion:");
  sub_10008C5F4();
}

void sub_10008A5A4()
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
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;

  type metadata accessor for ShortcutChiclet.Model.Metrics(0);
  sub_100018034();
  __chkstk_darwin(v2);
  sub_100026BF0();
  sub_100012E2C(&qword_1000D4398);
  sub_100018034();
  __chkstk_darwin(v3);
  sub_1000184A0();
  *(_QWORD *)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_hostingView) = 0;
  v4 = OBJC_IVAR____TtC9Shortcuts11LibraryCell_model;
  v5 = sub_10008C62C();
  v8 = sub_100026B84(v1, v6, v7, v5);
  static ShortcutChiclet.Model.Metrics.default.getter(v8);
  v9 = type metadata accessor for ShortcutChiclet.Model(0);
  sub_100068E6C(v9);
  *(_QWORD *)(v0 + v4) = sub_10008C24C();
  v10 = OBJC_IVAR____TtC9Shortcuts11LibraryCell_progress;
  v11 = type metadata accessor for ShortcutChiclet.Progress(0);
  sub_100068E6C(v11);
  *(_QWORD *)(v0 + v10) = ShortcutChiclet.Progress.init()();
  *(_QWORD *)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_observation) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_workflowReference) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_autoShortcut) = 0;
  v12 = (_QWORD *)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_associatedBundleId);
  *v12 = 0;
  v12[1] = 0;
  *(_QWORD *)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_layoutMetrics) = 0;
  sub_10008C420(OBJC_IVAR____TtC9Shortcuts11LibraryCell_delegate);
  *(_BYTE *)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_isEnabled) = 0;
  *(_BYTE *)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_isJiggling) = 0;
  v13 = (_QWORD *)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___run);
  *v13 = 0;
  v13[1] = 0;
  v14 = (_QWORD *)(v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___stop);
  *v14 = 0;
  v14[1] = 0;
  sub_10008C524(OBJC_IVAR____TtC9Shortcuts11LibraryCell____lazy_storage___accessibilitySelect);
  _assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010009C2C0, "Shortcuts/LibraryViewController+DataSource.swift", 48, 2, 759, 0);
  __break(1u);
}

void sub_10008A784()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v7;

  v7.receiver = v0;
  v7.super_class = (Class)type metadata accessor for LibraryCell();
  sub_100079EA8((uint64_t)v7.super_class, "prepareForReuse", v1, v2, v3, v4, v5, v6, v7);
  sub_100013568(1, 0);
  sub_100089F34(0);
  sub_100089FDC(0, 0);
  *((_BYTE *)v0 + OBJC_IVAR____TtC9Shortcuts11LibraryCell_isJiggling) = 0;
  sub_100013738();
  sub_100089FD0(0);
  dispatch thunk of ShortcutChiclet.Model.reset()();
  sub_1000270C4();
}

_QWORD *sub_10008A82C(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE v8[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v8, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (!Strong)
    return _swiftEmptyArrayStorage;
  v3 = (void *)Strong;
  v4 = swift_unknownObjectWeakLoadStrong(Strong + OBJC_IVAR____TtC9Shortcuts11LibraryCell_delegate);
  if (!v4)
  {

    return _swiftEmptyArrayStorage;
  }
  v5 = v4;
  v6 = sub_100089D04(v3);

  swift_unknownObjectRelease(v5);
  return (_QWORD *)v6;
}

void sub_10008A8C4()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  double v10;
  id v11;
  SEL v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _BOOL8 v17;
  uint64_t v18;
  id v19;
  id v20;
  _BOOL8 v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v27.receiver = v0;
  v27.super_class = (Class)type metadata accessor for LibraryCell();
  sub_100079EA8((uint64_t)v27.super_class, "layoutSubviews", v1, v2, v3, v4, v5, v6, v27);
  v7 = *(void **)&v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_hostingView];
  if (v7)
  {
    v8 = v7;
    v9 = sub_100019D50((uint64_t)v8, "contentView");
    objc_msgSend(v9, "bounds");
    sub_10008C5D4();

    v10 = sub_10008C584();
    objc_msgSend(v11, v12, v10);

  }
  v13 = *(void **)&v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_workflowReference];
  if (v13)
  {
    v14 = v13;
    v15 = sub_100019D50((uint64_t)v14, "traitCollection");
    v16 = objc_msgSend(v15, "userInterfaceStyle");

    v17 = v16 == (id)2;
    v19 = sub_100019D50(v18, "traitCollection");
    v20 = objc_msgSend(v19, "accessibilityContrast");

    v21 = v20 == (id)1;
    v23 = sub_100019EAC(v22, "backgroundColor");
    v24 = objc_msgSend(v23, "paletteGradient");

    v25 = objc_msgSend(v24, "baseColorForDarkMode:highContrast:", v17, v21);
    v26 = objc_msgSend(v25, "platformColor");

    objc_msgSend(v0, "setBackgroundColor:", v26);
  }
  else
  {
    objc_msgSend(v0, "setBackgroundColor:", 0);
  }
}

void *sub_10008AAA0()
{
  char *v0;
  void *v1;
  id v2;
  void *v3;
  double v4;
  id v5;
  SEL v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(v0, "bounds");
  sub_10008C5D4();
  v1 = *(void **)&v0[OBJC_IVAR____TtC9Shortcuts11LibraryCell_layoutMetrics];
  if (v1)
  {
    v2 = objc_msgSend(v1, "floatingViewConfiguration");
    objc_msgSend(v2, "cornerRadius");

  }
  v3 = (void *)objc_opt_self(UIBezierPath);
  v4 = sub_10008C584();
  v7 = objc_msgSend(v5, v6, v4);
  v8 = objc_msgSend(v7, "CGPath");

  v9 = objc_msgSend(v3, "bezierPathWithCGPath:", v8);
  sub_100027368();
  return v3;
}

void sub_10008ABA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE v6[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v6, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    v4 = swift_unknownObjectWeakLoadStrong(Strong + OBJC_IVAR____TtC9Shortcuts11LibraryCell_delegate);
    if (v4)
    {
      v5 = v4;
      sub_100089A5C();

      swift_unknownObjectRelease(v5);
    }
    else
    {

    }
  }
}

void sub_10008AC18(uint64_t a1, void (*a2)(uint64_t))
{
  uint64_t v3;
  uint64_t Strong;
  void *v5;
  uint64_t v6;
  _BYTE v7[24];

  v3 = a1 + 16;
  sub_1000424D0(a1 + 16, (uint64_t)v7, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v3);
  if (Strong)
  {
    v5 = (void *)Strong;
    if (swift_unknownObjectWeakLoadStrong(Strong + OBJC_IVAR____TtC9Shortcuts11LibraryCell_delegate))
    {
      v6 = sub_10008C3F8();
      a2(v6);

      sub_100027130();
    }
    else
    {

    }
  }
}

id sub_10008AC94()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for LibraryCell();
  return objc_msgSendSuper2(&v2, "isSelected");
}

void sub_10008AD04(char a1)
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for LibraryCell();
  objc_msgSendSuper2(&v3, "setSelected:", a1 & 1);
  sub_10008AD40();
  sub_1000270C4();
}

uint64_t sub_10008AD40()
{
  void *v0;

  return dispatch thunk of ShortcutChiclet.Model.isSelected.setter(objc_msgSend(v0, "isSelected"));
}

void sub_10008AD78(void *a1, char a2, double a3, double a4)
{
  id v7;
  double v8;
  id v9;

  v7 = objc_msgSend(a1, "contentView");
  v9 = v7;
  if ((a2 & 1) != 0)
    v8 = a3;
  else
    v8 = a4;
  objc_msgSend(v7, "setAlpha:", v8);

}

id sub_10008ADDC(uint64_t a1)
{
  return sub_1000888C4(a1, type metadata accessor for LibraryCell);
}

id sub_10008AEB0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSString v4;
  id v5;

  if (a2)
  {
    v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(a2);
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend((id)swift_getObjCClassFromMetadata(v2), "animationWithKeyPath:", v4);

  return v5;
}

void sub_10008AF1C()
{
  uint64_t v0;
  void *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  int *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;

  sub_100018190();
  sub_100012E2C(&qword_1000D4378);
  sub_100018034();
  __chkstk_darwin(v4);
  v5 = sub_10008C3A4();
  v24 = type metadata accessor for UIPointerEffect(v5);
  sub_10004282C();
  __chkstk_darwin(v6);
  sub_1000184A0();
  v7 = objc_msgSend(objc_allocWithZone((Class)UIPreviewParameters), "init");
  v8 = sub_10008AAA0();
  objc_msgSend(v7, "setVisiblePath:", v8);

  sub_100047E90(v9, &qword_1000D4380, UITargetedPreview_ptr);
  v10 = v7;
  v11 = v1;
  sub_1000865F0();
  v13 = (void *)v12;
  sub_100047E90(v12, &qword_1000D4388, UIPointerStyle_ptr);
  v14 = (int *)sub_100012E2C(&qword_1000D4390);
  v15 = (char *)v2 + v14[12];
  v16 = v14[16];
  v17 = v14[20];
  *v2 = v13;
  *((_BYTE *)v2 + v16) = 1;
  v18 = enum case for UIPointerEffect.TintMode.overlay(_:);
  v19 = type metadata accessor for UIPointerEffect.TintMode(0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 104))(v15, v18, v19);
  *((_BYTE *)v2 + v17) = 1;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v3 + 104))(v2, enum case for UIPointerEffect.hover(_:), v24);
  v20 = type metadata accessor for UIPointerShape(0);
  sub_100026B84(v0, v21, v22, v20);
  v23 = v13;
  UIPointerStyle.init(effect:shape:)(v2, v0);

  sub_100018094();
}

_QWORD *_s20LibrarySectionHeaderC13SectionHeaderVwca(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  *a1 = *a2;
  v4 = a2[1];
  v5 = a1[1];
  a1[1] = v4;
  swift_bridgeObjectRetain(v4);
  swift_bridgeObjectRelease(v5);
  v6 = (void *)a1[2];
  v7 = (void *)a2[2];
  a1[2] = v7;
  v8 = v7;

  v9 = a1[5];
  a1[3] = a2[3];
  a1[4] = a2[4];
  v10 = a2[5];
  if (v9)
  {
    if (v10)
    {
      v11 = a2[6];
      v12 = a1[6];
      a1[5] = v10;
      a1[6] = v11;
      swift_retain(v11);
      swift_release(v12);
      goto LABEL_8;
    }
    swift_release(a1[6]);
  }
  else if (v10)
  {
    v13 = a2[6];
    a1[5] = v10;
    a1[6] = v13;
    swift_retain(v13);
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 5) = *(_OWORD *)(a2 + 5);
LABEL_8:
  v14 = a2[7];
  if (!a1[7])
  {
    if (v14)
    {
      v17 = a2[8];
      a1[7] = v14;
      a1[8] = v17;
      swift_retain(v17);
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 7) = *(_OWORD *)(a2 + 7);
    return a1;
  }
  if (!v14)
  {
    swift_release(a1[8]);
    goto LABEL_14;
  }
  v15 = a2[8];
  v16 = a1[8];
  a1[7] = v14;
  a1[8] = v15;
  swift_retain(v15);
  swift_release(v16);
  return a1;
}

uint64_t _s20LibrarySectionHeaderC13SectionHeaderVwta(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease(*(_QWORD *)(a1 + 8));
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  if (v6)
  {
    if (v5)
    {
      v7 = *(_QWORD *)(a2 + 48);
      v8 = *(_QWORD *)(a1 + 48);
      *(_QWORD *)(a1 + 40) = v5;
      *(_QWORD *)(a1 + 48) = v7;
      swift_release(v8);
      goto LABEL_8;
    }
    swift_release(*(_QWORD *)(a1 + 48));
  }
  else if (v5)
  {
    v9 = *(_QWORD *)(a2 + 48);
    *(_QWORD *)(a1 + 40) = v5;
    *(_QWORD *)(a1 + 48) = v9;
    goto LABEL_8;
  }
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
LABEL_8:
  v10 = *(_QWORD *)(a2 + 56);
  if (!*(_QWORD *)(a1 + 56))
  {
    if (v10)
    {
      v13 = *(_QWORD *)(a2 + 64);
      *(_QWORD *)(a1 + 56) = v10;
      *(_QWORD *)(a1 + 64) = v13;
      return a1;
    }
LABEL_14:
    *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
    return a1;
  }
  if (!v10)
  {
    swift_release(*(_QWORD *)(a1 + 64));
    goto LABEL_14;
  }
  v11 = *(_QWORD *)(a2 + 64);
  v12 = *(_QWORD *)(a1 + 64);
  *(_QWORD *)(a1 + 56) = v10;
  *(_QWORD *)(a1 + 64) = v11;
  swift_release(v12);
  return a1;
}

uint64_t _s20LibrarySectionHeaderC13SectionHeaderVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 72))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 8);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t _s20LibrarySectionHeaderC13SectionHeaderVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 72) = 1;
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
    *(_BYTE *)(result + 72) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

_QWORD *_s10DataSourceC13TopHitWrapperVwCP(_QWORD *a1, uint64_t a2)
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

uint64_t _s10DataSourceC13TopHitWrapperVwca(uint64_t a1, uint64_t a2)
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

uint64_t _s10DataSourceC13TopHitWrapperVwta(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

unint64_t sub_10008B45C()
{
  unint64_t result;

  result = qword_1000D4288;
  if (!qword_1000D4288)
  {
    result = swift_getWitnessTable(&unk_10009B3B8, &_s10DataSourceC13TopHitWrapperVN);
    atomic_store(result, (unint64_t *)&qword_1000D4288);
  }
  return result;
}

void sub_10008B49C()
{
  uint64_t v0;
  void (*v1)(void);

  v1 = *(void (**)(void))(v0 + 56);
  if (v1)
    v1();
  sub_100018188();
}

void sub_10008B4C0(uint64_t a1, unsigned __int16 a2, uint64_t a3, unint64_t a4)
{
  void *v4;
  Class isa;

  if (a4 >> 60 == 15)
  {
    isa = 0;
  }
  else
  {
    isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10003F388(a3, a4);
  }
  objc_msgSend(v4, "initWithPaletteColor:glyphCharacter:customImageData:", a1, a2, isa);

  sub_100026B34();
}

unint64_t sub_10008B544(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  Swift::Int v5;
  _QWORD v7[9];

  Hasher.init(_seed:)(v7, *(_QWORD *)(v2 + 40));
  String.hash(into:)(v7, a1, a2);
  v5 = Hasher._finalize()();
  return sub_10008B5A8(a1, a2, v5);
}

unint64_t sub_10008B5A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  BOOL v16;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = v10[1];
    v12 = *v10 == a1 && v11 == a2;
    if (!v12 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v10, v11, a1, a2, 0) & 1) == 0)
    {
      v13 = ~v5;
      do
      {
        v6 = (v6 + 1) & v13;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v14 = (_QWORD *)(v9 + 16 * v6);
        v15 = v14[1];
        v16 = *v14 == a1 && v15 == a2;
      }
      while (!v16 && (_stringCompareWithSmolCheck(_:_:expecting:)(*v14, v15, a1, a2, 0) & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10008B688(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  uint64_t v10;

  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native(*v3);
  v10 = *v3;
  *v3 = 0x8000000000000000;
  sub_100013DDC(a1, a2, a3, isUniquelyReferenced_nonNull_native);
  v8 = *v3;
  *v3 = v10;
  return swift_bridgeObjectRelease(v8);
}

unint64_t sub_10008B704(unint64_t result, uint64_t a2, _QWORD *a3, double a4, double a5, double a6)
{
  uint64_t v6;
  double *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a3[(result >> 6) + 8] |= 1 << result;
  v6 = a3[6] + 16 * result;
  *(_QWORD *)v6 = a2;
  *(double *)(v6 + 8) = a4;
  v7 = (double *)(a3[7] + 16 * result);
  *v7 = a5;
  v7[1] = a6;
  v8 = a3[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a3[2] = v10;
  return result;
}

void sub_10008B754()
{
  uint64_t *v0;

  *v0 = sub_10008C53C();
  sub_100018188();
}

void sub_10008B770()
{
  uint64_t *v0;

  *v0 = sub_10008C53C();
  sub_100018188();
}

void sub_10008B78C(_QWORD *a1)
{
  uint64_t v1;

  v1 = swift_retain(*a1);
  EnvironmentValues.font.setter(v1);
  sub_100018188();
}

uint64_t sub_10008B7B8()
{
  uint64_t v0;

  swift_bridgeObjectRelease(*(_QWORD *)(v0 + 24));

  if (*(_QWORD *)(v0 + 56))
    swift_release(*(_QWORD *)(v0 + 64));
  if (*(_QWORD *)(v0 + 72))
    swift_release(*(_QWORD *)(v0 + 80));
  return swift_deallocObject(v0, 88, 7);
}

void sub_10008B804()
{
  uint64_t v0;
  void (*v1)(void);

  v1 = *(void (**)(void))(v0 + 72);
  if (v1)
    v1();
  sub_100018188();
}

void sub_10008B828(uint64_t a1@<X8>)
{
  uint64_t v1;

  sub_10000D74C(*(_QWORD *)(v1 + 16), a1, &qword_1000D4300);
}

uint64_t sub_10008B84C()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 24));
  return swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10008B870()
{
  uint64_t v0;

  return swift_deallocObject(v0, 48, 7);
}

void sub_10008B894()
{
  uint64_t v0;

  sub_10008AD78(*(void **)(v0 + 16), *(_BYTE *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40));
}

uint64_t sub_10008B8A4()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10008B8C8()
{
  uint64_t v0;

  sub_10008AC18(v0, (void (*)(uint64_t))sub_100089B34);
}

void sub_10008B8E8()
{
  uint64_t v0;

  sub_10008ABA0(v0);
}

void sub_10008B8F0()
{
  uint64_t v0;

  sub_10008AC18(v0, sub_100089984);
}

_QWORD *sub_10008B910()
{
  uint64_t v0;

  return sub_10008A82C(v0);
}

void sub_10008B918()
{
  uint64_t v0;

  sub_10008A294(v0);
}

uint64_t sub_10008B920(uint64_t result, double a2, double a3)
{
  double v5;
  uint64_t v6;
  uint64_t v7;

  if (a2 == a3)
  {
    __break(1u);
    goto LABEL_7;
  }
  v5 = a3 - a2;
  if ((~COERCE__INT64(a3 - a2) & 0x7FF0000000000000) == 0)
  {
LABEL_7:
    __break(1u);
    return result;
  }
  v6 = result;
  v7 = 0;
  result = swift_stdlib_random(&v7, 8);
  if (v5 * ((double)(v7 & 0x1FFFFFFFFFFFFFLL) * 1.11022302e-16) + a2 == a3)
    return sub_10008B920(v6, a2, a3);
  return result;
}

void sub_10008B9C8(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v6;

  v6 = String._bridgeToObjectiveC()();
  objc_msgSend(a4, "addAnimation:forKey:", a1, v6);

}

void sub_10008BA1C(id *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  objc_msgSend(*a1, "alpha");
  *a2 = v3;
  sub_100018188();
}

id sub_10008BA48(double *a1, id *a2)
{
  return objc_msgSend(*a2, "setAlpha:", *a1);
}

uint64_t sub_10008BA5C()
{
  uint64_t v0;

  swift_weakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10008BA80(uint64_t a1)
{
  uint64_t v1;

  return sub_10008755C(a1, v1);
}

void sub_10008BA98()
{
  EnvironmentValues.libraryMenuDataSource.getter();
  sub_100018188();
}

uint64_t sub_10008BAB8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AppShortcutChiclet(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

char *sub_10008BAF4(uint64_t a1, char *a2, double a3, double a4, double a5, double a6)
{
  uint64_t v6;
  uint64_t v9;
  void *v10;
  id v12;
  uint64_t v13;
  void *v14;
  Class v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  id v26;
  id v27;
  id v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  id v36;
  id v37;
  id v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  id v46;
  id v47;
  void *v48;
  SEL v49;
  id v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  id v58;
  id v59;
  void *v60;
  SEL v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  Class isa;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  id v73;
  id v74;
  id v75;
  _QWORD v76[2];

  v9 = OBJC_IVAR____TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView_hostingView;
  v72 = a2;
  v10 = *(void **)&a2[OBJC_IVAR____TtCC9Shortcuts21LibraryViewController35SyncUnavailableCollectionHeaderView_hostingView];
  if (v10)
    goto LABEL_3;
  v76[0] = a1;
  v76[1] = &off_1000C1F40;
  v12 = objc_allocWithZone((Class)sub_100012E2C(&qword_1000D4468));
  swift_unknownObjectRetain(a1);
  v13 = _UIHostingView.init(rootView:)(v76);
  v14 = *(void **)&v72[v9];
  *(_QWORD *)&v72[v9] = v13;

  v10 = *(void **)&v72[v9];
  if (v10)
  {
LABEL_3:
    v15 = v10;
    v16 = -[objc_class superview](v15, "superview");

    if (!v16)
    {
      sub_10008C2E4(v17, "setTranslatesAutoresizingMaskIntoConstraints:");
      objc_msgSend(v72, "addSubview:", v15);
      v18 = sub_100012E2C((uint64_t *)&unk_1000D3690);
      v19 = sub_100026B2C(v18, 64);
      *(_OWORD *)(v19 + 16) = xmmword_100097450;
      v26 = sub_100069E50(v19, "leadingAnchor", v20, v21, v22, v23, v24, v25, v68, v72);
      v27 = sub_100019EAC((uint64_t)v26, "leadingAnchor");
      v28 = sub_10008C4C8();
      sub_100026D30();

      *(_QWORD *)(v19 + 32) = v6;
      v36 = sub_100069E50(v29, "topAnchor", v30, v31, v32, v33, v34, v35, v69, v73);
      v37 = sub_100019EAC((uint64_t)v36, "topAnchor");
      v38 = sub_10008C4C8();
      sub_100026D30();

      *(_QWORD *)(v19 + 40) = v6;
      v46 = sub_100069E50(v39, "trailingAnchor", v40, v41, v42, v43, v44, v45, v70, v74);
      v47 = sub_100019EAC((uint64_t)v46, "trailingAnchor");
      v48 = (void *)sub_10008C5B8();
      v50 = objc_msgSend(v48, v49, a6);
      sub_100026D30();

      *(_QWORD *)(v19 + 48) = v6;
      v58 = sub_100069E50(v51, "bottomAnchor", v52, v53, v54, v55, v56, v57, v71, v75);
      v59 = sub_100019EAC((uint64_t)v58, "bottomAnchor");
      v60 = (void *)sub_10008C5B8();
      v62 = objc_msgSend(v60, v61, a5);
      sub_100026D30();

      *(_QWORD *)(v19 + 56) = v6;
      v76[0] = v19;
      v65 = specialized Array._endMutation()(v63, v64);
      sub_100047E90(v65, &qword_1000D1398, NSLayoutConstraint_ptr);
      isa = Array._bridgeToObjectiveC()().super.isa;
      sub_100018420();
      objc_msgSend(v72, "addConstraints:", isa);

      v15 = isa;
    }

  }
  return v72;
}

uint64_t sub_10008BD98()
{
  return sub_10008BDC4((uint64_t (*)(_QWORD))&type metadata accessor for AutoShortcutApp);
}

uint64_t sub_10008BDA4()
{
  return sub_10008BE44((uint64_t (*)(_QWORD))&type metadata accessor for AutoShortcutApp, (uint64_t (*)(_QWORD, uint64_t))sub_1000885A8);
}

uint64_t sub_10008BDB8()
{
  return sub_10008BDC4((uint64_t (*)(_QWORD))&type metadata accessor for ShortcutsLibrarySection);
}

uint64_t sub_10008BDC4(uint64_t (*a1)(_QWORD))
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD *)(sub_10008C50C(a1) - 8);
  v3 = *(unsigned __int8 *)(v2 + 80);
  v4 = (v3 + 24) & ~v3;
  v5 = v4 + *(_QWORD *)(v2 + 64);
  v6 = v3 | 7;
  swift_release(*(_QWORD *)(v1 + 16));
  sub_100026D68(v1 + v4, *(uint64_t (**)(uint64_t, uint64_t))(v2 + 8));
  return swift_deallocObject(v1, v5, v6);
}

uint64_t sub_10008BE30()
{
  return sub_10008BE44((uint64_t (*)(_QWORD))&type metadata accessor for ShortcutsLibrarySection, (uint64_t (*)(_QWORD, uint64_t))sub_10008843C);
}

uint64_t sub_10008BE44(uint64_t (*a1)(_QWORD), uint64_t (*a2)(_QWORD, uint64_t))
{
  uint64_t v2;
  uint64_t v3;

  v3 = *(unsigned __int8 *)(*(_QWORD *)(sub_10008C50C(a1) - 8) + 80);
  return a2(*(_QWORD *)(v2 + 16), v2 + ((v3 + 24) & ~v3));
}

void sub_10008BE80(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  void *v20;
  _QWORD v21[2];

  v6 = type metadata accessor for AppEntityVisualState(0);
  __chkstk_darwin(v6);
  v8 = (char *)v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = a1;
  sub_100089F34((uint64_t)a1);
  v10 = a2;
  sub_10008A1D0(a2);
  v11 = swift_unknownObjectRetain(a3);
  v12 = sub_10008A318(v11, (uint64_t)&off_1000C39B8);
  v13 = WFDatabaseObjectDescriptor.id.getter(v12);
  v15 = v14;
  v21[0] = _swiftEmptyArrayStorage;
  sub_1000040A8(&qword_1000D21B0, (uint64_t (*)(uint64_t))&type metadata accessor for AppEntityVisualState);
  v16 = sub_100012E2C((uint64_t *)&unk_1000D4480);
  sub_100004038(&qword_1000D21B8, (uint64_t *)&unk_1000D4480);
  dispatch thunk of SetAlgebra.init<A>(_:)(v21, v16, v17);
  v21[0] = v13;
  v21[1] = v15;
  v18 = objc_allocWithZone((Class)type metadata accessor for AppEntityViewAnnotation(0));
  v19 = sub_100015DA4();
  v20 = (void *)AppEntityViewAnnotation.init<A>(entityType:identifier:state:)(&type metadata for WorkflowEntity, v21, v8, &type metadata for WorkflowEntity, v19);
  UIView.annotate(with:)();
  sub_100011CB8();

}

void sub_10008C008(void *a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[2];

  v10 = type metadata accessor for AppEntityVisualState(0);
  __chkstk_darwin(v10);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = a1;
  sub_100089FD0((uint64_t)a1);
  swift_bridgeObjectRetain(a3);
  sub_100089FDC(a2, a3);
  v14 = a4;
  sub_10008A1D0(a4);
  v15 = swift_unknownObjectRetain(a5);
  sub_10008A318(v15, (uint64_t)&off_1000C39B8);
  v16 = objc_msgSend(v13, "id");
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(v16);
  v19 = v18;

  v25[0] = _swiftEmptyArrayStorage;
  sub_1000040A8(&qword_1000D21B0, (uint64_t (*)(uint64_t))&type metadata accessor for AppEntityVisualState);
  v20 = sub_100012E2C((uint64_t *)&unk_1000D4480);
  sub_100004038(&qword_1000D21B8, (uint64_t *)&unk_1000D4480);
  dispatch thunk of SetAlgebra.init<A>(_:)(v25, v20, v21);
  v22 = type metadata accessor for AppShortcutEntity(0);
  v25[0] = v17;
  v25[1] = v19;
  objc_allocWithZone((Class)type metadata accessor for AppEntityViewAnnotation(0));
  sub_1000040A8(&qword_1000D3BB8, (uint64_t (*)(uint64_t))&type metadata accessor for AppShortcutEntity);
  v24 = (void *)AppEntityViewAnnotation.init<A>(entityType:identifier:state:)(v22, v25, v12, v22, v23);
  UIView.annotate(with:)();
  sub_100011CB8();

}

void sub_10008C1F8()
{
  sub_100004038(&qword_1000D44A8, (uint64_t *)&unk_1000D44B0);
}

uint64_t sub_10008C224(uint64_t a1)
{
  return swift_getOpaqueTypeConformance2(a1, &unk_1000A8430, 1);
}

uint64_t sub_10008C240(uint64_t a1)
{
  return swift_allocObject(a1, 24, 7);
}

uint64_t sub_10008C24C()
{
  uint64_t v0;

  return ShortcutChiclet.Model.init(metrics:isSelected:isHovered:isEditing:isGallery:isGalleryDetail:isAddedToLibrary:isDownloading:buttonType:buttonAction:)(v0, 0, 0, 0, 0, 0, 0, 0);
}

id sub_10008C274(objc_super *a1, SEL a2)
{
  double v2;
  double v3;
  double v4;
  double v5;

  return objc_msgSendSuper2(a1, a2, v5, v4, v3, v2);
}

id sub_10008C288()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend(v0, *(SEL *)(v3 + 1344), v1, v2);
}

id sub_10008C29C(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return objc_msgSend(v1, *(SEL *)(v4 + 1352), v3, v2, a1);
}

uint64_t sub_10008C2B8()
{
  return type metadata accessor for LibrarySectionOptions(0);
}

uint64_t sub_10008C2D4(uint64_t a1)
{
  uint64_t v1;

  return swift_unknownObjectWeakInit(a1 + 16, v1);
}

id sub_10008C2E4(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2, 0);
}

uint64_t sub_10008C2F0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  sub_1000123BC(v2, v1);
  sub_1000123BC(v0, v4);
  return swift_bridgeObjectRetain(v3);
}

uint64_t sub_10008C318(uint64_t a1)
{
  return sub_10008B920(a1, 0.0, 100.0);
}

uint64_t sub_10008C344()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1000123BC(v0, v2);
  return v1;
}

uint64_t sub_10008C364@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t sub_10008C370()
{
  uint64_t v0;
  uint64_t v1;

  return sub_10000A798(v0, v1);
}

uint64_t sub_10008C390(uint64_t a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  return String.init<A>(describing:)(va, a1);
}

uint64_t sub_10008C39C()
{
  uint64_t v0;

  return swift_bridgeObjectRetain(v0);
}

uint64_t sub_10008C3A4()
{
  return 0;
}

void sub_10008C3C0(uint64_t a1@<X8>, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 176) = (char *)&a2 - ((a1 + 15) & 0xFFFFFFFFFFFFFFF0);
}

uint64_t sub_10008C3F8()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_10008C420@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 + a1 + 8) = 0;
  return swift_unknownObjectWeakInit(v1 + a1, 0);
}

uint64_t sub_10008C430()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  sub_1000123BC(v2, v1);
  return sub_1000123BC(v0, v3);
}

id sub_10008C450(double a1, uint64_t a2, const char *a3)
{
  void *v3;

  LODWORD(a1) = 2139095040;
  return objc_msgSend(v3, a3, a1);
}

id sub_10008C460(double a1, double a2, double a3, double a4, uint64_t a5, const char *a6)
{
  void *v6;

  LODWORD(a2) = 0;
  LODWORD(a4) = 1.0;
  return objc_msgSend(v6, a6, a1, a2, a3, a4);
}

uint64_t sub_10008C470(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

id sub_10008C478(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id sub_10008C480()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, *(SEL *)(v0 + 1216));
}

uint64_t sub_10008C4A0()
{
  uint64_t v0;

  return swift_unknownObjectWeakLoadStrong(v0);
}

uint64_t sub_10008C4A8(uint64_t a1)
{
  uint64_t v1;

  return swift_storeEnumTagMultiPayload(v1, a1, 0);
}

uint64_t sub_10008C4B8()
{
  uint64_t v0;

  return swift_getObjCClassFromMetadata(v0);
}

id sub_10008C4C8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, *(SEL *)(v2 + 1368), v1);
}

id sub_10008C4D8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;

  return objc_msgSend(v0, *(SEL *)(v1 + 2912), v2);
}

uint64_t sub_10008C500(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;

  return a1(v1);
}

uint64_t sub_10008C50C(uint64_t (*a1)(_QWORD))
{
  return a1(0);
}

uint64_t sub_10008C518(uint64_t (*a1)(uint64_t))
{
  uint64_t v1;

  return a1(v1);
}

void sub_10008C524(uint64_t a1@<X8>)
{
  char *v1;
  char *v2;

  v2 = &v1[a1];
  *(_QWORD *)v2 = 0;
  *((_QWORD *)v2 + 1) = 0;

}

uint64_t sub_10008C530@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_10000A798(*(_QWORD *)(v1 + a1), *(_QWORD *)(v1 + a1 + 8));
}

uint64_t sub_10008C53C()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_10008C548@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v3;

  return a3(a1, a2, v3);
}

void sub_10008C550(uint64_t a1)
{
  uint64_t *v1;

  sub_10001222C(a1, v1);
}

id sub_10008C558(double a1, uint64_t a2, const char *a3)
{
  void *v3;
  double v4;

  return objc_msgSend(v3, a3, a1 / v4);
}

uint64_t sub_10008C564()
{
  uint64_t v0;
  uint64_t v1;

  return static LibrarySectionOptions.Header.== infix(_:_:)(v1, v0);
}

void *sub_10008C570()
{
  return malloc(0x30uLL);
}

void sub_10008C57C()
{
  void *v0;

}

double sub_10008C584()
{
  double v0;

  return v0;
}

NSString sub_10008C598()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10008C5A4()
{
  return ShortcutsLibrarySection.options.getter();
}

NSString sub_10008C5B0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10008C5B8()
{
  uint64_t v0;

  return v0;
}

void sub_10008C5CC(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  sub_10001222C(v2, a2);
}

id sub_10008C5E8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v9;

  return objc_msgSendSuper2(&a9, a2, v9);
}

uint64_t sub_10008C600()
{
  return 0;
}

uint64_t sub_10008C60C(uint64_t a1)
{
  return swift_getObjCClassFromMetadata(a1);
}

uint64_t sub_10008C614()
{
  uint64_t v0;

  return swift_bridgeObjectRelease_n(v0, 2);
}

id sub_10008C620(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2, 1);
}

uint64_t sub_10008C62C()
{
  return type metadata accessor for ShortcutChiclet.ButtonType(0);
}

void *sub_10008C634(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  _BYTE v14[24];
  __int128 v15;
  uint64_t v16;
  _QWORD v17[3];
  uint64_t v18;
  uint64_t v19;

  v3 = v1 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_tip;
  sub_100026D70(v1 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_tip, (uint64_t)v14);
  sub_10008D81C(v3, (uint64_t)&v15);
  if (v16)
  {
    sub_10008D970(&v15, (uint64_t)v17);
    v4 = v18;
    v5 = v19;
    v6 = sub_10001465C(v17, v18);
    if (a1)
    {
      v7 = (uint64_t)v6;
      sub_100019BF0((uint64_t)v6);
      sub_10008D068(v8, v9, v10, v11, v7, v4, v5);
    }
    sub_10000B6E4(v17);
  }
  else
  {
    sub_10008DAC8((uint64_t)&v15, &qword_1000D3910);
    v12 = a1;
  }
  return a1;
}

uint64_t sub_10008C6F8()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_tipStatusObservation);
  if (v1)
  {
    swift_retain(*(_QWORD *)(v0 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_tipStatusObservation));
    Task.cancel()();
    swift_release(v1);
  }
  return sub_100074240(0);
}

uint64_t sub_10008C758(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6)
{
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
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  *(_BYTE *)(v6 + 273) = a5;
  *(_QWORD *)(v6 + 48) = a4;
  *(_QWORD *)(v6 + 56) = a6;
  v7 = sub_100012E2C(&qword_1000D4540);
  *(_QWORD *)(v6 + 64) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v7 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = type metadata accessor for Tips.Status(0);
  *(_QWORD *)(v6 + 72) = v8;
  v9 = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v6 + 80) = v9;
  *(_QWORD *)(v6 + 88) = swift_task_alloc((*(_QWORD *)(v9 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_100012E2C(&qword_1000D4548);
  *(_QWORD *)(v6 + 96) = v10;
  *(_QWORD *)(v6 + 104) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v10 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_100012E2C(&qword_1000D4550);
  *(_QWORD *)(v6 + 112) = v11;
  *(_QWORD *)(v6 + 120) = swift_task_alloc((*(_QWORD *)(*(_QWORD *)(v11 - 8) + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100012E2C(&qword_1000D4558);
  *(_QWORD *)(v6 + 128) = v12;
  v13 = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v6 + 136) = v13;
  *(_QWORD *)(v6 + 144) = swift_task_alloc((*(_QWORD *)(v13 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_100012E2C(&qword_1000D4560);
  *(_QWORD *)(v6 + 152) = v14;
  v15 = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v6 + 160) = v15;
  v16 = (*(_QWORD *)(v15 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(v6 + 168) = swift_task_alloc(v16);
  *(_QWORD *)(v6 + 176) = swift_task_alloc(v16);
  v17 = type metadata accessor for MainActor(0);
  *(_QWORD *)(v6 + 184) = v17;
  *(_QWORD *)(v6 + 192) = static MainActor.shared.getter(v17);
  v18 = dispatch thunk of Actor.unownedExecutor.getter(v17);
  *(_QWORD *)(v6 + 200) = v18;
  *(_QWORD *)(v6 + 208) = v19;
  return swift_task_switch(sub_10008C8D0, v18, v19);
}

uint64_t sub_10008C8D0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t ObjectType;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = v0[17];
  v1 = v0[18];
  v4 = v0[15];
  v3 = v0[16];
  v5 = v0[12];
  v6 = (_QWORD *)v0[6];
  v7 = v6[3];
  v8 = v6[4];
  sub_10001465C(v6, v7);
  Tip.shouldDisplayUpdates.getter(v7, v8);
  AsyncMapSequence.base.getter(v3);
  sub_100004038(&qword_1000D4568, &qword_1000D4548);
  v10 = v9;
  dispatch thunk of AsyncSequence.makeAsyncIterator()(v5, v9);
  v11 = AsyncMapSequence.transform.getter(v3);
  v13 = v12;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  v14 = AsyncMapSequence.Iterator.init(_:transform:)(v4, v11, v13, v5, &type metadata for Bool, v10);
  v15 = static MainActor.shared.getter(v14);
  v0[27] = v15;
  if (v15)
  {
    ObjectType = swift_getObjectType(v15);
    v17 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType);
    v19 = v18;
  }
  else
  {
    v17 = 0;
    v19 = 0;
  }
  v0[28] = v17;
  v0[29] = v19;
  return swift_task_switch(sub_10008CA20, v17, v19);
}

uint64_t sub_10008CA20()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = v0[27];
  v0[30] = AsyncMapSequence.Iterator.baseIterator.modify(v0 + 2, v0[19]);
  sub_100004038(&qword_1000D4570, &qword_1000D4550);
  v2 = (_QWORD *)swift_task_alloc(_sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTjTu[1]);
  v0[31] = v2;
  *v2 = v0;
  v2[1] = sub_10008CAC8;
  return _sScI4next9isolation7ElementQzSgScA_pSgYi_tYa7FailureQzYKFTj(v0[8], v1, &protocol witness table for MainActor);
}

uint64_t sub_10008CAC8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)();
  uint64_t v7;

  v2 = *v1;
  v7 = v2;
  sub_10005E614(*(_QWORD *)(v2 + 248), &v7);
  if (v0)
  {
    v3 = *(_QWORD *)(v2 + 224);
    v4 = *(_QWORD *)(v2 + 232);
    v5 = sub_10008CC60;
  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 240))(v2 + 16, 0);
    v3 = *(_QWORD *)(v2 + 224);
    v4 = *(_QWORD *)(v2 + 232);
    v5 = sub_10008CB34;
  }
  return swift_task_switch(v5, v3, v4);
}

uint64_t sub_10008CB34()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int *v8;
  uint64_t v9;
  _QWORD *v10;
  int *v11;

  v1 = v0[8];
  if (sub_100019D44(v1, 1, v0[9]) == 1)
  {
    v2 = v0[27];
    sub_10008DAC8(v1, &qword_1000D4540);
    swift_release(v2);
    return swift_task_switch(sub_10008CDA0, v0[25], v0[26]);
  }
  else
  {
    v5 = v0[21];
    v4 = v0[22];
    v6 = v0[19];
    v7 = v0[20];
    sub_10008DB2C(v0[11], *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0[10] + 32));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, v4, v6);
    v8 = (int *)AsyncMapSequence.Iterator.transform.getter(v6);
    v0[32] = v9;
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
    v11 = (int *)((char *)v8 + *v8);
    v10 = (_QWORD *)swift_task_alloc(v8[1]);
    v0[33] = v10;
    *v10 = v0;
    v10[1] = sub_10008CC70;
    return ((uint64_t (*)(_QWORD *, _QWORD))v11)(v0 + 34, v0[11]);
  }
}

uint64_t sub_10008CC60()
{
  uint64_t v0;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 240))(v0 + 16, 1);
}

uint64_t sub_10008CC70()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  uint64_t v8;

  v1 = *v0;
  v8 = v1;
  v2 = *(_QWORD *)(v1 + 256);
  v4 = *(_QWORD *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 88);
  v5 = *(_QWORD *)(v1 + 72);
  sub_10005E614(*(_QWORD *)(v1 + 264), &v8);
  v6 = swift_release(v2);
  *(_BYTE *)(v1 + 274) = *(_BYTE *)(v1 + 272);
  (*(void (**)(uint64_t, uint64_t, __n128))(v4 + 8))(v3, v5, v6);
  return swift_task_switch(sub_10008CCF0, *(_QWORD *)(v1 + 224), *(_QWORD *)(v1 + 232));
}

uint64_t sub_10008CCF0()
{
  uint64_t v0;

  swift_release(*(_QWORD *)(v0 + 216));
  return sub_1000422B0();
}

uint64_t sub_10008CD20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(unsigned __int8 *)(v0 + 274);
  if ((_DWORD)v1 != *(unsigned __int8 *)(v0 + 273))
    v1 = sub_10008CE44(v1);
  v2 = static MainActor.shared.getter(v1);
  *(_QWORD *)(v0 + 216) = v2;
  if (v2)
  {
    ObjectType = swift_getObjectType(v2);
    v4 = dispatch thunk of Actor.unownedExecutor.getter(ObjectType);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  *(_QWORD *)(v0 + 224) = v4;
  *(_QWORD *)(v0 + 232) = v6;
  return sub_1000422B0();
}

uint64_t sub_10008CDA0()
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

  v1 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 176);
  v4 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 104);
  v7 = *(_QWORD *)(v0 + 88);
  v8 = *(_QWORD *)(v0 + 64);
  sub_10008DB38(*(_QWORD *)(v0 + 160));
  swift_release(v1);
  swift_task_dealloc(v2);
  swift_task_dealloc(v3);
  swift_task_dealloc(v4);
  swift_task_dealloc(v5);
  swift_task_dealloc(v6);
  swift_task_dealloc(v7);
  swift_task_dealloc(v8);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_10008CE44(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  char **v15;
  uint64_t v16;
  os_log_type_t v17;
  uint64_t v18;
  uint64_t v20;

  v2 = v1;
  v4 = type metadata accessor for Logger(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = __chkstk_darwin(v4);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v10 = (char *)&v20 - v9;
  if ((a1 & 1) != 0)
  {
    v11 = static WFLog.subscript.getter(WFLogCategoryTips);
    v12 = Logger.logObject.getter(v11);
    v13 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v12, v13))
    {
      v15 = &selRef_addObjectObserver_;
      goto LABEL_9;
    }
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "Tip should display, requests dataSource reload", v14, 2u);
    v15 = &selRef_addObjectObserver_;
  }
  else
  {
    v16 = static WFLog.subscript.getter(WFLogCategoryTips);
    v12 = Logger.logObject.getter(v16);
    v17 = static os_log_type_t.info.getter();
    if (!os_log_type_enabled(v12, v17))
    {
      v15 = &selRef_removeObjectObserver_;
      v10 = v8;
      goto LABEL_9;
    }
    v14 = (uint8_t *)swift_slowAlloc(2, -1);
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, v17, "Tip should disappear, requests dataSource reload", v14, 2u);
    v15 = &selRef_removeObjectObserver_;
    v10 = v8;
  }
  swift_slowDealloc(v14, -1, -1);
LABEL_9:

  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  objc_msgSend(*(id *)(v2 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_database), *v15, v2);
  v18 = swift_allocObject(&unk_1000C3CF8, 24, 7);
  swift_unknownObjectWeakInit(v18 + 16, v2);
  swift_retain(v18);
  onMainThreadInlineOrAsync(closure:)(sub_10008DB1C, v18);
  return swift_release_n(v18, 2);
}

char *sub_10008D068(double a1, double a2, double a3, double a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v11;
  void *v12;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  void *v17;
  Class v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  id v28;
  id v29;
  id v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  id v38;
  id v39;
  id v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  id v48;
  id v49;
  void *v50;
  SEL v51;
  id v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  id v60;
  id v61;
  void *v62;
  SEL v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  Class isa;
  char *v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[5];

  v11 = OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView;
  v12 = *(void **)(v7 + OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView);
  if (v12)
    goto LABEL_3;
  v74[3] = a6;
  v74[4] = a7;
  v14 = sub_100014688(v74);
  sub_10008DB2C((uint64_t)v14, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 16));
  v15 = objc_allocWithZone((Class)type metadata accessor for TipUIView(0));
  v16 = TipUIView.init(_:arrowEdge:actionHandler:)(v74, 4, static NavigationDestinationEntity.defaultQuery.setter, 0);
  v17 = *(void **)&v70[v11];
  *(_QWORD *)&v70[v11] = v16;

  v12 = *(void **)&v70[v11];
  if (v12)
  {
LABEL_3:
    v18 = v12;
    v19 = -[objc_class superview](v18, "superview");

    if (!v19)
    {
      objc_msgSend(v70, "addSubview:", v18);
      v20 = sub_100012E2C((uint64_t *)&unk_1000D3690);
      v21 = swift_allocObject(v20, 64, 7);
      *(_OWORD *)(v21 + 16) = xmmword_100097450;
      v28 = sub_10008DB24(v21, "leadingAnchor", v22, v23, v24, v25, v26, v27, v70);
      v29 = sub_100019EAC((uint64_t)v28, "leadingAnchor");
      v30 = sub_10008C4C8();
      sub_100026D30();

      *(_QWORD *)(v21 + 32) = v8;
      v38 = sub_10008DB24(v31, "topAnchor", v32, v33, v34, v35, v36, v37, v71);
      v39 = sub_100019EAC((uint64_t)v38, "topAnchor");
      v40 = sub_10008C4C8();
      sub_100026D30();

      *(_QWORD *)(v21 + 40) = v8;
      v48 = sub_10008DB24(v41, "trailingAnchor", v42, v43, v44, v45, v46, v47, v72);
      v49 = sub_100019EAC((uint64_t)v48, "trailingAnchor");
      v50 = (void *)sub_10008C5B8();
      v52 = objc_msgSend(v50, v51, a4);
      sub_100026D30();

      *(_QWORD *)(v21 + 48) = v8;
      v60 = sub_10008DB24(v53, "bottomAnchor", v54, v55, v56, v57, v58, v59, v73);
      v61 = sub_100019EAC((uint64_t)v60, "bottomAnchor");
      v62 = (void *)sub_10008C5B8();
      v64 = objc_msgSend(v62, v63, a3);
      sub_100026D30();

      *(_QWORD *)(v21 + 56) = v8;
      v74[0] = v21;
      specialized Array._endMutation()(v65, v66);
      v67 = v74[0];
      sub_100003B2C(0, &qword_1000D1398, NSLayoutConstraint_ptr);
      isa = Array._bridgeToObjectiveC()().super.isa;
      swift_bridgeObjectRelease(v67);
      objc_msgSend(v70, "addConstraints:", isa);

      v18 = isa;
    }

  }
  return v70;
}

void sub_10008D320()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _BYTE v12[24];
  _QWORD v13[5];
  _QWORD v14[5];
  _BYTE v15[24];
  _BYTE v16[24];
  uint64_t v17;

  v1 = type metadata accessor for TipController.UseSiriToRunShortcutTip(0);
  v2 = __chkstk_darwin(v1);
  v4 = &v12[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  __chkstk_darwin(v2);
  v6 = &v12[-v5 - 8];
  v7 = v0 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_tip;
  sub_100026D70(v0 + OBJC_IVAR____TtC9Shortcuts21LibraryViewController_tip, (uint64_t)v15);
  sub_10008D81C(v7, (uint64_t)v16);
  if (v17)
  {
    sub_10008D81C((uint64_t)v16, (uint64_t)v14);
    v8 = sub_100012E2C(&qword_1000D4520);
    if (swift_dynamicCast(v6, v14, v8, v1, 0))
    {
      sub_10008D864((uint64_t)v6, (uint64_t)v4);
      sub_10002EC0C();
      v13[3] = v1;
      sub_1000040A8(&qword_1000D13A8, type metadata accessor for TipController.UseSiriToRunShortcutTip);
      v13[4] = v9;
      v10 = sub_100014688(v13);
      sub_10008D8A8((uint64_t)v4, (uint64_t)v10);
      sub_10005E630(v7, (uint64_t)v12);
      sub_10008D8EC((uint64_t)v13, v7);
      swift_endAccess(v12);
      sub_10008D934((uint64_t)v4);
    }
    sub_10000B6E4(v14);
  }
  sub_10008DAC8((uint64_t)v16, &qword_1000D3910);
  sub_100018094();
}

void sub_10008D594(uint64_t a1)
{
  uint64_t v1;
  uint64_t Strong;
  void *v3;
  _BYTE v4[24];

  v1 = a1 + 16;
  swift_beginAccess(a1 + 16, v4, 0, 0);
  Strong = swift_unknownObjectWeakLoadStrong(v1);
  if (Strong)
  {
    v3 = (void *)Strong;
    type metadata accessor for LibraryViewController(0);
    sub_1000040A8((unint64_t *)&unk_1000D3840, type metadata accessor for LibraryViewController);
    LibraryView.reload(animated:)(1);

  }
}

void sub_10008D618()
{
  char *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  objc_super v4;

  v4.receiver = v0;
  v4.super_class = (Class)sub_100049F68();
  objc_msgSendSuper2(&v4, "prepareForReuse");
  v1 = OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView;
  v2 = *(void **)&v0[OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView];
  if (v2)
  {
    objc_msgSend(v2, "removeFromSuperview");
    v3 = *(void **)&v0[v1];
  }
  else
  {
    v3 = 0;
  }
  *(_QWORD *)&v0[v1] = 0;

}

id sub_10008D6B4(double a1, double a2, double a3, double a4)
{
  char *v4;
  objc_class *v9;
  objc_super v11;

  v9 = (objc_class *)sub_100049F68();
  *(_QWORD *)&v4[OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView] = 0;
  *(_QWORD *)&v4[OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_layoutConstraints] = _swiftEmptyArrayStorage;
  v11.receiver = v4;
  v11.super_class = v9;
  return objc_msgSendSuper2(&v11, "initWithFrame:", a1, a2, a3, a4);
}

id sub_10008D754(void *a1)
{
  char *v1;
  objc_class *v3;
  id v4;
  objc_super v6;

  v3 = (objc_class *)sub_100049F68();
  *(_QWORD *)&v1[OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_tipHostingView] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtCC9Shortcuts21LibraryViewController27MiniTipCollectionHeaderView_layoutConstraints] = _swiftEmptyArrayStorage;
  v6.receiver = v1;
  v6.super_class = v3;
  v4 = objc_msgSendSuper2(&v6, "initWithCoder:", a1);

  return v4;
}

uint64_t sub_10008D81C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100012E2C(&qword_1000D3910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10008D864(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TipController.UseSiriToRunShortcutTip(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10008D8A8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for TipController.UseSiriToRunShortcutTip(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10008D8EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_100012E2C(&qword_1000D3910);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10008D934(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for TipController.UseSiriToRunShortcutTip(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10008D970(__int128 *a1, uint64_t a2)
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

uint64_t sub_10008D988(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10008D9CC()
{
  uint64_t v0;

  swift_unknownObjectRelease(*(_QWORD *)(v0 + 16));
  sub_10000B6E4((_QWORD *)(v0 + 32));

  return swift_deallocObject(v0, 88, 7);
}

uint64_t sub_10008DA00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = *(_QWORD *)(v1 + 24);
  v6 = v1 + 32;
  v7 = *(_BYTE *)(v1 + 72);
  v8 = *(_QWORD *)(v1 + 80);
  v9 = (_QWORD *)swift_task_alloc(dword_1000D4534);
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_10008DA84;
  return sub_10008C758(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_10008DA84()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v3 = *v0;
  v1 = *v0;
  sub_10005E614(*(_QWORD *)(v3 + 16), &v3);
  return (*(uint64_t (**)(void))(v1 + 8))();
}

void sub_10008DAC8(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;

  v2 = sub_100012E2C(a2);
  sub_10008DB38(*(_QWORD *)(v2 - 8));
  sub_100018188();
}

uint64_t sub_10008DAF8()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy(v0 + 16);
  return swift_deallocObject(v0, 24, 7);
}

void sub_10008DB1C()
{
  uint64_t v0;

  sub_10008D594(v0);
}

id sub_10008DB24(int a1, const char *a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9)
{
  return objc_msgSend(a9, a2);
}

uint64_t sub_10008DB2C@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t sub_10008DB38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v1);
}

uint64_t sub_10008DB44()
{
  uint64_t v0;

  return sub_10008D988(v0 - 128, v0 - 168);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self(_TtC9ShortcutsP33_8E1323D63AD4BC68B7B06E8F57FAAD4419ResourceBundleClass);
}

void sub_10008E900(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileAccessIntent readingIntentWithURL:options:](NSFileAccessIntent, "readingIntentWithURL:options:", *(_QWORD *)(a1 + 40), 0));
  v17 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008EAA0;
  v12[3] = &unk_1000C3E88;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  v13 = v8;
  v14 = v9;
  v15 = v10;
  v16 = v3;
  v11 = v3;
  objc_msgSend(v4, "coordinateAccessWithIntents:queue:byAccessor:", v6, v7, v12);

}

void sub_10008EA40(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  unsigned __int8 v5;
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v6 = v3;
    v5 = objc_msgSend(v3, "wf_isUserCancelledError");
    v4 = v6;
    if ((v5 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "showAlertWithError:", v6);
      v4 = v6;
    }
  }

}

id sub_10008EA94(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAlertWithError:", a2);
}

void sub_10008EAA0(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[WFFileRepresentation fileWithURL:options:](WFFileRepresentation, "fileWithURL:options:", *(_QWORD *)(a1 + 32), 0));
  v3 = *(void **)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008EB5C;
  v7[3] = &unk_1000C3E60;
  v10 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v3, "openFile:sourceApplication:completionHandler:", v2, v4, v7);

}

void sub_10008EB5C(uint64_t a1, void *a2)
{
  void *v3;
  unsigned __int8 v4;
  id v5;

  v5 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "stopAccessingSecurityScopedResource");
  v3 = v5;
  if (v5)
  {
    v4 = objc_msgSend(v5, "wf_isUserCancelledError");
    v3 = v5;
    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 40), "showAlertWithError:", v5);
      v3 = v5;
    }
  }

}

void sub_10008EBC4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008EC80;
  v11[3] = &unk_1000C3E10;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v5;
  v13 = v7;
  v14 = v6;
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);

}

void sub_10008EC80(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 40), "rootViewController"));
    v3 = *(_QWORD *)(a1 + 32);
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10008ED40;
    v4[3] = &unk_1000C3DE8;
    v5 = *(id *)(a1 + 56);
    objc_msgSend(v2, "importShortcutFileWithResult:options:completion:", v3, 1, v4);

  }
  else if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "showAlertWithError:");
  }
}

uint64_t sub_10008ED40(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id sub_10008ED50(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAlertWithError:", a2);
}

id sub_10008ED5C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "showAlertWithError:", a2);
}

void sub_10008ED68(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  if (a2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = a3;
    v6 = a2;
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rootViewController"));
    objc_msgSend(v7, "runWorkflowFromState:source:", v6, v5);

  }
}

void sub_10008EDD8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v3 = a2;
  v4 = (void *)objc_opt_new(WFStatusBarStyleViewController);
  v5 = *(id *)(a1 + 32);
  if (v5)
  {
    v6 = objc_opt_class(UIWindowScene);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "statusBarManager"));
  objc_msgSend(v4, "setPreferredStatusBarStyle:", objc_msgSend(v9, "statusBarStyle"));

  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10008F078;
  v27 = sub_10008F088;
  v28 = objc_alloc_init((Class)UIWindow);
  objc_msgSend((id)v24[5], "setWindowLevel:", UIWindowLevelAlert);
  objc_msgSend((id)v24[5], "makeKeyAndVisible");
  objc_msgSend((id)v24[5], "setRootViewController:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[WFActionRegistry sharedRegistry](WFActionRegistry, "sharedRegistry"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serializedParameters"));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "createActionWithIdentifier:serializedParameters:", v11, v12));
  v14 = (void *)qword_1000DAD90;
  qword_1000DAD90 = v13;

  objc_msgSend((id)qword_1000DAD90, "willBeAddedToWorkflow:", 0);
  objc_msgSend((id)qword_1000DAD90, "wasAddedToWorkflow:", 0);
  v15 = (void *)qword_1000DAD90;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "processedParameters"));
  objc_msgSend(v15, "setProcessedParameters:", v16);

  v17 = (void *)qword_1000DAD90;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "input"));
  v19 = WFUserInterfaceFromViewController(v4);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = &_dispatch_main_q;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10008F090;
  v22[3] = &unk_1000C3D98;
  v22[4] = *(_QWORD *)(a1 + 40);
  v22[5] = &v23;
  objc_msgSend(v17, "runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:", v18, v20, 0, 0, &_dispatch_main_q, v22);

  _Block_object_dispose(&v23, 8);
}

void sub_10008F060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10008F078(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10008F088(uint64_t a1)
{

}

void sub_10008F090(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = v5;
  if (v5 && (objc_msgSend(v5, "wf_isUserCancelledError") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "showAlertWithError:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setHidden:", 1);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  v9 = (void *)qword_1000DAD90;
  qword_1000DAD90 = 0;

}

uint64_t sub_1000905C4(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 32));
}

void sub_1000905D4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = WFHandoffSourceKey;
  v4 = a2;
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));
  v6 = (void *)v5;
  v7 = (void *)WFWorkflowRunSourceHandoff;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", WFHandoffWorkflowControllerStateKey));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void sub_100090680(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "parameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("type")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("webpageURL")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("userInfoURL")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v6));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000907AC;
  v12[3] = &unk_1000C3ED8;
  v8 = *(void **)(a1 + 40);
  v9 = *(id *)(a1 + 32);
  v14 = v5;
  v15 = v9;
  v13 = v4;
  v10 = v5;
  v11 = v4;
  objc_msgSend(v8, "deserializeUserInfoAtURL:completionHandler:", v7, v12);

}

uint64_t sub_1000907AC(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

void sub_100090A78(id a1, NSString *a2, NSURL *a3, NSDictionary *a4)
{
  NSDictionary *v6;
  NSURL *v7;
  NSString *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[WFWindowSceneManager mainScene](WFWindowSceneManager, "mainScene"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "delegate"));
  if (v9)
  {
    v10 = objc_opt_class(WFMainSceneDelegate);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      v11 = v9;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  objc_msgSend(v12, "scene:handleUserActivityWithType:webpageURL:userInfo:interaction:", v13, v8, v7, v6, 0);
}

id sub_100090B54(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = a1;
  v5 = sub_10001159C();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v4, v3, 0));

  return v7;
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URL");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLContexts");
}

id objc_msgSend_URLForSimulatingHandoffWithActivityType_userInfo_webpageURL_fromSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLForSimulatingHandoffWithActivityType:userInfo:webpageURL:fromSource:");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionIdentifier");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityType");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_alertWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertWithError:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyObject");
}

id objc_msgSend_appWithURLScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appWithURLScheme:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_beginObservingKeyboardNotifications(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginObservingKeyboardNotifications");
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "blackColor");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "close");
}

id objc_msgSend_composeViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "composeViewController");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configuration");
}

id objc_msgSend_configurationWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithName:sessionRole:");
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsValueForKey:");
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "content");
}

id objc_msgSend_coordinateAccessWithIntents_queue_byAccessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinateAccessWithIntents:queue:byAccessor:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copy");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createActionWithIdentifier_serializedParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createActionWithIdentifier:serializedParameters:");
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createDocumentsDirectoryIfNecessary(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createDocumentsDirectoryIfNecessary");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentNotificationCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentNotificationCenter");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultDatabase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultDatabase");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultSearchableIndex(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSearchableIndex");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "delegate");
}

id objc_msgSend_deleteSearchableItemsWithDomainIdentifiers_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteSearchableItemsWithDomainIdentifiers:completionHandler:");
}

id objc_msgSend_deserializeUserInfoAtURL_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deserializeUserInfoAtURL:completionHandler:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didBecomeActive(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didBecomeActive");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_externalURLForViewing(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "externalURLForViewing");
}

id objc_msgSend_extractShortcutWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "extractShortcutWithCompletion:");
}

id objc_msgSend_fetchConfigurationAssetWithType_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchConfigurationAssetWithType:completionHandler:");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileWithURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileWithURL:options:");
}

id objc_msgSend_fileWithURL_options_ofType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileWithURL:options:ofType:");
}

id objc_msgSend_getStateForContinuingWorkflowFromUserActivityUserInfo_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getStateForContinuingWorkflowFromUserActivityUserInfo:completionHandler:");
}

id objc_msgSend_handleAuthorizationForExtensionWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAuthorizationForExtensionWithCompletion:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_handleOpenURL_fromSourceApplication_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleOpenURL:fromSourceApplication:errorHandler:");
}

id objc_msgSend_handleOpenURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleOpenURL:options:");
}

id objc_msgSend_handleShortcutItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleShortcutItem:");
}

id objc_msgSend_highlightAutomationWithTriggerID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "highlightAutomationWithTriggerID:");
}

id objc_msgSend_importShortcutFileWithResult_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "importShortcutFileWithResult:options:completion:");
}

id objc_msgSend_initFileURLWithFileSystemRepresentation_isDirectory_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:");
}

id objc_msgSend_initWithActionIdentifier_input_serializedParameters_processedParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActionIdentifier:input:serializedParameters:processedParameters:");
}

id objc_msgSend_initWithActivityType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityType:");
}

id objc_msgSend_initWithComposeViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithComposeViewController:");
}

id objc_msgSend_initWithContainer_database_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContainer:database:");
}

id objc_msgSend_initWithDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDatabase:");
}

id objc_msgSend_initWithFile_suggestedName_sourceApplication_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFile:suggestedName:sourceApplication:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_initWithWorkflow_database_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWorkflow:database:");
}

id objc_msgSend_initializationResult(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializationResult");
}

id objc_msgSend_initializeProcessWithDatabase_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initializeProcessWithDatabase:");
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "input");
}

id objc_msgSend_inputStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inputStream");
}

id objc_msgSend_interaction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interaction");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isFileURL");
}

id objc_msgSend_isIndexingAvailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isIndexingAvailable");
}

id objc_msgSend_isShortcutFileType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isShortcutFileType:");
}

id objc_msgSend_lastForegroundDate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastForegroundDate");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_launchedToTest(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "launchedToTest");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "length");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainQueue");
}

id objc_msgSend_mainScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mainScene");
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeKeyAndVisible");
}

id objc_msgSend_mappedData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mappedData");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "name");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notification");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "open");
}

id objc_msgSend_openFile_sourceApplication_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openFile:sourceApplication:completionHandler:");
}

id objc_msgSend_openInPlace(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openInPlace");
}

id objc_msgSend_openWorkflow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openWorkflow:");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "options");
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parameters");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "path");
}

id objc_msgSend_pendingOpenURLContexts(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingOpenURLContexts");
}

id objc_msgSend_pendingShortcutItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingShortcutItem");
}

id objc_msgSend_pendingUserActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pendingUserActivity");
}

id objc_msgSend_performRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequest:");
}

id objc_msgSend_prepareForReadingItemsAtURLs_options_writingItemsAtURLs_options_error_byAccessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:error:byAccessor:");
}

id objc_msgSend_presentAlert_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentAlert:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentedViewController");
}

id objc_msgSend_processedParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processedParameters");
}

id objc_msgSend_propertyListWithStream_options_format_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyListWithStream:options:format:error:");
}

id objc_msgSend_proposedSharedTemporaryFileURLForFilename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proposedSharedTemporaryFileURLForFilename:");
}

id objc_msgSend_proposedTemporaryFileURLForFilename_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proposedTemporaryFileURLForFilename:");
}

id objc_msgSend_publicCloudDatabase(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "publicCloudDatabase");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_readingIntentWithURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readingIntentWithURL:options:");
}

id objc_msgSend_reference(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reference");
}

id objc_msgSend_referenceForWorkflowID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "referenceForWorkflowID:");
}

id objc_msgSend_register(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "register");
}

id objc_msgSend_registerHandler_forIncomingRequestsWithAction_scheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerHandler:forIncomingRequestsWithAction:scheme:");
}

id objc_msgSend_registerHandoffURLRequestHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerHandoffURLRequestHandler:");
}

id objc_msgSend_registeredValueClasses(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredValueClasses");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadData");
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "request");
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestSceneSessionDestruction:options:errorHandler:");
}

id objc_msgSend_requestWithURL_scheme_userInterface_bundleIdentifier_successHandler_failureHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:scheme:userInterface:bundleIdentifier:successHandler:failureHandler:");
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "role");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rootViewController");
}

id objc_msgSend_runWithInput_userInterface_runningDelegate_variableSource_workQueue_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWithInput:userInterface:runningDelegate:variableSource:workQueue:completionHandler:");
}

id objc_msgSend_runWorkflowFromState_source_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "runWorkflowFromState:source:");
}

id objc_msgSend_scene_continueUserActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene:continueUserActivity:");
}

id objc_msgSend_scene_handleUserActivityWithType_webpageURL_userInfo_interaction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene:handleUserActivityWithType:webpageURL:userInfo:interaction:");
}

id objc_msgSend_scene_openURLContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scene:openURLContexts:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scheme");
}

id objc_msgSend_schemeNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "schemeNamed:");
}

id objc_msgSend_serializedParameters(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "serializedParameters");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "session");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDuration:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setLastForegroundDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastForegroundDate:");
}

id objc_msgSend_setPendingOpenURLContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingOpenURLContexts:");
}

id objc_msgSend_setPendingShortcutItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingShortcutItem:");
}

id objc_msgSend_setPendingUserActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPendingUserActivity:");
}

id objc_msgSend_setPreferredStatusBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredStatusBarStyle:");
}

id objc_msgSend_setProcessedParameters_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessedParameters:");
}

id objc_msgSend_setProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProvider:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setShortcutItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShortcutItems:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSource:");
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuspended:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setValuesForKeysWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValuesForKeysWithDictionary:");
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindow:");
}

id objc_msgSend_setWindowLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWindowLevel:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupDatabaseForTesting(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDatabaseForTesting");
}

id objc_msgSend_setupDebuggingForWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupDebuggingForWindow:");
}

id objc_msgSend_setupSession_forEditingWorkflow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupSession:forEditingWorkflow:");
}

id objc_msgSend_sharedAppGroupDirectoryURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedAppGroupDirectoryURL");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedApplication");
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedContext");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sharedRegistry(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sharedRegistry");
}

id objc_msgSend_shortcutItem(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortcutItem");
}

id objc_msgSend_showAlertWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAlertWithError:");
}

id objc_msgSend_sourceApplication(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceApplication");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAccessingSecurityScopedResource");
}

id objc_msgSend_startListeningForDatabaseChanges(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startListeningForDatabaseChanges");
}

id objc_msgSend_startLogStream(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startLogStream");
}

id objc_msgSend_stateRestorationActivity(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stateRestorationActivity");
}

id objc_msgSend_statusBarManager(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarManager");
}

id objc_msgSend_statusBarStyle(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "statusBarStyle");
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAccessingSecurityScopedResource");
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemBackgroundColor");
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView");
}

id objc_msgSend_temporaryFileURLBySerializingUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "temporaryFileURLBySerializingUserInfo:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topViewController");
}

id objc_msgSend_track(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "track");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "type");
}

id objc_msgSend_typeWithUTType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "typeWithUTType:");
}

id objc_msgSend_uniqueVisibleReferenceForWorkflowName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "uniqueVisibleReferenceForWorkflowName:");
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActivities");
}

id objc_msgSend_userActivityForEditingWorkflow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userActivityForEditingWorkflow:");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInfo");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "view");
}

id objc_msgSend_wasAddedToWorkflow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wasAddedToWorkflow:");
}

id objc_msgSend_webpageURL(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "webpageURL");
}

id objc_msgSend_wfType(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wfType");
}

id objc_msgSend_wf_isContainedByDirectoryAtURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_isContainedByDirectoryAtURL:");
}

id objc_msgSend_wf_isUserCancelledError(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_isUserCancelledError");
}

id objc_msgSend_wf_loadValuesFromCloudKitWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_loadValuesFromCloudKitWithCompletion:");
}

id objc_msgSend_wf_scrollToTopAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_scrollToTopAnimated:");
}

id objc_msgSend_wf_securelyArchivedDataWithRootObject_deletionResponsibility_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_securelyArchivedDataWithRootObject:deletionResponsibility:");
}

id objc_msgSend_wf_securelyUnarchiveObjectWithData_allowedClasses_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:");
}

id objc_msgSend_wf_shortcutsAppHealthStore(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_shortcutsAppHealthStore");
}

id objc_msgSend_wf_shortcutsContainer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "wf_shortcutsContainer");
}

id objc_msgSend_willBeAddedToWorkflow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "willBeAddedToWorkflow:");
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "window");
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "windowScene");
}

id objc_msgSend_workflow(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workflow");
}

id objc_msgSend_workflowIdentifierFromUserActivity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workflowIdentifierFromUserActivity:");
}

id objc_msgSend_workflowUserDefaults(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workflowUserDefaults");
}

id objc_msgSend_workflowWithReference_database_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "workflowWithReference:database:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

