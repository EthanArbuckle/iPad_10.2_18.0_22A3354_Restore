@implementation DOCItemCollectionView

- (void)safeAreaInsetsDidChange
{
  char *v2;
  uint64_t Strong;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCItemCollectionView();
  v2 = (char *)v5.receiver;
  -[DOCItemCollectionView safeAreaInsetsDidChange](&v5, "safeAreaInsetsDidChange");
  Strong = swift_unknownObjectWeakLoadStrong(&v2[OBJC_IVAR____TtC5Files21DOCItemCollectionView_itemCollectionViewController]);
  if (Strong)
  {
    v4 = (char *)Strong;
    sub_10009C498();

    v2 = v4;
  }

}

- (_TtC5Files21DOCItemCollectionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003F01E8();
}

- (void)layoutSubviews
{
  _TtC5Files21DOCItemCollectionView *v2;

  v2 = self;
  DOCItemCollectionView.layoutSubviews()();

}

- (BOOL)_hasContentForBarInteractions
{
  _TtC5Files21DOCItemCollectionView *v2;
  char v3;
  unsigned __int8 v4;
  objc_super v6;

  v2 = self;
  if (-[DOCItemCollectionView enclosedInUIPDocumentLanding](v2, "enclosedInUIPDocumentLanding"))
  {
    v3 = *((_BYTE *)&v2->super.super.super.super.super.isa
         + OBJC_IVAR____TtC5Files21DOCItemCollectionView_containerIsShowingNoContentUI);

    v4 = v3 ^ 1;
  }
  else
  {
    v6.receiver = v2;
    v6.super_class = (Class)type metadata accessor for DOCItemCollectionView();
    v4 = -[DOCItemCollectionView _hasContentForBarInteractions](&v6, "_hasContentForBarInteractions");

  }
  return v4 & 1;
}

- (id)indexPathForItemAtPoint:(CGPoint)a3
{
  double y;
  double x;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC5Files21DOCItemCollectionView *v9;
  uint64_t v10;
  uint64_t v11;
  Class isa;
  uint64_t v14;

  y = a3.y;
  x = a3.x;
  v6 = sub_10006922C((uint64_t *)&unk_100642710);
  __chkstk_darwin(v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = self;
  DOCItemCollectionView.indexPathForItem(at:)((uint64_t)v8, x, y);

  v10 = type metadata accessor for IndexPath(0);
  v11 = *(_QWORD *)(v10 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v8, 1, v10) != 1)
  {
    isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v8, v10);
  }
  return isa;
}

- (_TtC5Files21DOCItemCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  id v4;
  _TtC5Files21DOCItemCollectionView *result;

  v4 = a4;
  result = (_TtC5Files21DOCItemCollectionView *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCItemCollectionView", 27, "init(frame:collectionViewLayout:)", 33, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionView_configuration));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files21DOCItemCollectionView_displayDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionView__dragInteraction));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files21DOCItemCollectionView_focusableCollectionViewDelegate);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC5Files21DOCItemCollectionView_focusableCollectionViewState));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files21DOCItemCollectionView_gestureDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files21DOCItemCollectionView_backgroundTapGestureRecognizer));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files21DOCItemCollectionView_itemCollectionViewController);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  _TtC5Files21DOCItemCollectionView *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = DOCItemCollectionView.gestureRecognizerShouldBegin(_:)((UIGestureRecognizer)v4);

  return self & 1;
}

- (void)_backgroundTapGestureRecognized:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  id v11;
  _TtC5Files21DOCItemCollectionView *v12;

  v5 = (char *)self + OBJC_IVAR____TtC5Files21DOCItemCollectionView_gestureDelegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files21DOCItemCollectionView_gestureDelegate, a2);
  if (Strong)
  {
    v8 = Strong;
    v9 = *((_QWORD *)v5 + 1);
    swift_getObjectType(Strong, v7);
    v10 = *(void (**)(void))(v9 + 32);
    v11 = a3;
    v12 = self;
    v10();

    swift_unknownObjectRelease(v8);
  }
}

@end
