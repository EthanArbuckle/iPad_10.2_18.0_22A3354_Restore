@implementation CRLSEiOSMainViewController

- (void)loadView
{
  _TtC24FreeformSharingExtension26CRLSEiOSMainViewController *v2;

  v2 = self;
  sub_10001D7EC();

}

- (void)viewDidLoad
{
  _TtC24FreeformSharingExtension26CRLSEiOSMainViewController *v2;

  v2 = self;
  sub_10001E5C4();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC24FreeformSharingExtension26CRLSEiOSMainViewController *v4;

  v4 = self;
  sub_10001FFF4(a3);

}

- (void)viewWillDisappear:(BOOL)a3
{
  _TtC24FreeformSharingExtension26CRLSEiOSMainViewController *v4;

  v4 = self;
  sub_10002030C(a3);

}

- (void)viewDidLayoutSubviews
{
  _TtC24FreeformSharingExtension26CRLSEiOSMainViewController *v2;

  v2 = self;
  sub_1000203C8();

}

- (void)dealloc
{
  void *v3;
  _TtC24FreeformSharingExtension26CRLSEiOSMainViewController *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(NSNotificationCenter);
  v4 = self;
  v5 = objc_msgSend(v3, "defaultCenter");
  objc_msgSend(v5, "removeObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CRLSEiOSMainViewController(0);
  -[CRLSEiOSMainViewController dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  sub_100019B80((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard, &qword_10006D040);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_importItems));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController____lazy_storage___extensionContextManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewHeightConstraint));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraints));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraintsCompact));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraintsCompactLandscape));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource));
}

- (void)observedTraitsDidChange
{
  _TtC24FreeformSharingExtension26CRLSEiOSMainViewController *v2;

  v2 = self;
  sub_100020780();

}

- (void)keyboardDidShowWithNotification:(id)a3
{
  sub_100021158(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100020910);
}

- (void)keyboardWillHideWithNotification:(id)a3
{
  sub_100021158(self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_100020E44);
}

- (void)save:(id)a3
{
  id v4;
  _TtC24FreeformSharingExtension26CRLSEiOSMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100026290();

}

- (void)cancel:(id)a3
{
  id v4;
  _TtC24FreeformSharingExtension26CRLSEiOSMainViewController *v5;

  v4 = a3;
  v5 = self;
  sub_100021290();

}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC24FreeformSharingExtension26CRLSEiOSMainViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100024DA8(v11, (uint64_t)v10);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (_TtC24FreeformSharingExtension26CRLSEiOSMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC24FreeformSharingExtension26CRLSEiOSMainViewController *)sub_100025264(v5, v7, a4);
}

- (_TtC24FreeformSharingExtension26CRLSEiOSMainViewController)initWithCoder:(id)a3
{
  return (_TtC24FreeformSharingExtension26CRLSEiOSMainViewController *)sub_100025458(a3);
}

@end
