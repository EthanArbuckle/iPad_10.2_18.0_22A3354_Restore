@implementation DOCBrowserContainedViewController

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4;
  _TtC5Files33DOCBrowserContainedViewController *v5;

  v4 = a3;
  v5 = self;
  DOCBrowserContainedViewController.effectiveAppearanceDidChange(_:)(v4);

}

- (BOOL)hidesNavigationBackButton
{
  char *v3;
  uint64_t Strong;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t ObjectType;
  uint64_t (*v9)(uint64_t, uint64_t);
  _TtC5Files33DOCBrowserContainedViewController *v10;
  uint64_t v11;
  uint64_t v12;
  _TtC5Files33DOCBrowserContainedViewController *v14;
  uint64_t v15;

  v3 = (char *)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_overlayDelegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_overlayDelegate, a2);
  if (Strong)
  {
    v6 = Strong;
    v7 = *((_QWORD *)v3 + 1);
    ObjectType = swift_getObjectType(Strong, v5);
    v9 = *(uint64_t (**)(uint64_t, uint64_t))(v7 + 48);
    v10 = self;
    v11 = v9(ObjectType, v7);
    swift_unknownObjectRelease(v6);
    if (!((unint64_t)v11 >> 62))
    {
LABEL_3:
      v12 = *(_QWORD *)((v11 & 0xFFFFFFFFFFFFF8) + 0x10);

      goto LABEL_4;
    }
  }
  else
  {
    v14 = self;
    v11 = (uint64_t)_swiftEmptyArrayStorage;
    if (!((unint64_t)_swiftEmptyArrayStorage >> 62))
      goto LABEL_3;
  }
  if (v11 < 0)
    v15 = v11;
  else
    v15 = v11 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain(v11);
  v12 = _CocoaArrayWrapper.endIndex.getter(v15);

  swift_bridgeObjectRelease(v11);
LABEL_4:
  swift_bridgeObjectRelease(v11);
  return v12 > 0;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_configuration));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_eventReporting);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_viewReusing);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_actionReporting);
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_overlayDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_documentManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_actionManager));
  swift_release(*(Class *)((char *)&self->super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController____lazy_storage___overlayUpdateDisabledAssertions));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_containerNavigationItem));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_additionalLeadingNavigationBarButtonItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_additionalTrailingNavigationBarButtonItems));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_uipDocLandingBackground));
}

- (BOOL)wantsAppearanceOverride
{
  return 0;
}

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCBrowserContainedViewController();
  v2 = v3.receiver;
  -[DOCBrowserContainedViewController viewDidLoad](&v3, "viewDidLoad");
  sub_1000926C8();
  sub_1001F6FD4(0);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCBrowserContainedViewController();
  v6 = v10.receiver;
  -[DOCBrowserContainedViewController setEditing:animated:](&v10, "setEditing:animated:", v5, v4);
  v7 = sub_10004F2F0(0, &qword_100648590, &off_1005BCED8);
  v8 = (void *)UIViewController.doc_nearestAncestor<A>(ofType:searchPresentingHierarchy:)(v7, 1, v7);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "setEditing:animated:", v5, v4, v10.receiver, v10.super_class);

    v6 = v9;
  }

}

- (_TtP5Files34DOCBrowserContainedActionReporting_)actionReporting
{
  return (_TtP5Files34DOCBrowserContainedActionReporting_ *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_actionReporting, a2);
}

- (void)setActionReporting:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_actionReporting, a3);
}

- (_TtC5Files18DOCDocumentManager)documentManager
{
  return (_TtC5Files18DOCDocumentManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_documentManager));
}

- (BOOL)allowsPickingMultipleItems
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_allowsPickingMultipleItems);
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
  _BOOL8 v3;
  _TtC5Files33DOCBrowserContainedViewController *v4;

  v3 = a3;
  v4 = self;
  sub_10009255C(v3);

}

- (BOOL)forceEditingMode
{
  return *((_BYTE *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_forceEditingMode);
}

- (void)setForceEditingMode:(BOOL)a3
{
  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_forceEditingMode) = a3;
  if (a3)
    -[DOCBrowserContainedViewController setEditing:animated:](self, "setEditing:animated:", 1, 0);
}

- (BOOL)isInUserTriggeredSelectionMode
{
  _TtC5Files33DOCBrowserContainedViewController *v2;
  char v3;
  char v4;

  v2 = self;
  if (-[DOCBrowserContainedViewController isEditing](v2, "isEditing"))
  {
    v3 = (*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v2->super.super.super.super.isa) + 0x168))();

    v4 = v3 ^ 1;
  }
  else
  {

    v4 = 0;
  }
  return v4 & 1;
}

- (NSArray)additionalLeadingNavigationBarButtonItems
{
  return (NSArray *)sub_1001F75AC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_additionalLeadingNavigationBarButtonItems);
}

- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
  sub_1001F7614((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_additionalLeadingNavigationBarButtonItems);
}

- (NSArray)additionalTrailingNavigationBarButtonItems
{
  return (NSArray *)sub_1001F75AC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_additionalTrailingNavigationBarButtonItems);
}

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
  sub_1001F7614((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_additionalTrailingNavigationBarButtonItems);
}

- (_TtC5Files33DOCBrowserContainedViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1001F7DBC();
}

- (_TtC5Files33DOCBrowserContainedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC5Files33DOCBrowserContainedViewController *result;

  v4 = a4;
  result = (_TtC5Files33DOCBrowserContainedViewController *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCBrowserContainedViewController", 39, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end
