@implementation DOCSidebarCollectionView

- (_TtC5Files24DOCSidebarCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _TtC5Files24DOCSidebarCollectionView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files24DOCSidebarCollectionView_isHandlingTouchesEndedCount) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Files24DOCSidebarCollectionView_requireCanBecomeFocusedTrue) = 0;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for DOCSidebarCollectionView();
  v9 = a4;
  v10 = -[DOCSidebarCollectionView initWithFrame:collectionViewLayout:](&v12, "initWithFrame:collectionViewLayout:", v9, x, y, width, height);
  -[DOCSidebarCollectionView _setAdjustsContentInsetWhenScrollDisabled:](v10, "_setAdjustsContentInsetWhenScrollDisabled:", 1, v12.receiver, v12.super_class);

  return v10;
}

- (BOOL)selectionFollowsFocus
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCSidebarCollectionView();
  return -[DOCSidebarCollectionView selectionFollowsFocus](&v3, "selectionFollowsFocus");
}

- (_TtC5Files24DOCSidebarCollectionView)initWithCoder:(id)a3
{
  id v4;
  _TtC5Files24DOCSidebarCollectionView *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files24DOCSidebarCollectionView_isHandlingTouchesEndedCount) = 0;
  *((_BYTE *)&self->super.super.super.super.super.isa
  + OBJC_IVAR____TtC5Files24DOCSidebarCollectionView_requireCanBecomeFocusedTrue) = 0;
  v4 = a3;

  result = (_TtC5Files24DOCSidebarCollectionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010050DA60, "Files/UIKit+DOCAdditionsCore.swift", 34, 2, 12, 0);
  __break(1u);
  return result;
}

- (id)dequeueReusableCellWithReuseIdentifier:(id)a3 forIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _TtC5Files24DOCSidebarCollectionView *v14;
  void *v15;
  void *v16;
  __n128 v17;
  uint64_t v19;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v13 = v12;
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v14 = self;
  sub_1003C9B40(v11, v13, (uint64_t)v10);
  v16 = v15;

  v17 = swift_bridgeObjectRelease(v13);
  (*(void (**)(char *, uint64_t, __n128))(v8 + 8))(v10, v7, v17);
  return v16;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  objc_class *v13;
  uint64_t v14;
  id v15;
  _TtC5Files24DOCSidebarCollectionView *v16;
  Class isa;
  uint64_t v18;
  objc_class *v19;
  objc_super v20;

  v7 = sub_1003CA0AC();
  v8 = sub_1003CA0E8();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = OBJC_IVAR____TtC5Files24DOCSidebarCollectionView_isHandlingTouchesEndedCount;
  v11 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC5Files24DOCSidebarCollectionView_isHandlingTouchesEndedCount);
  v12 = __OFADD__(v11, 1);
  v13 = (objc_class *)(v11 + 1);
  if (v12)
  {
    __break(1u);
  }
  else
  {
    v14 = v9;
    *(Class *)((char *)&self->super.super.super.super.super.isa
             + OBJC_IVAR____TtC5Files24DOCSidebarCollectionView_isHandlingTouchesEndedCount) = v13;
    v15 = a4;
    v16 = self;
    isa = Set._bridgeToObjectiveC()().super.isa;
    v20.receiver = v16;
    v20.super_class = (Class)type metadata accessor for DOCSidebarCollectionView();
    -[DOCSidebarCollectionView touchesEnded:withEvent:](&v20, "touchesEnded:withEvent:", isa, v15);

    v18 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v10);
    v12 = __OFSUB__(v18, 1);
    v19 = (objc_class *)(v18 - 1);
    if (!v12)
    {
      *(Class *)((char *)&self->super.super.super.super.super.isa + v10) = v19;

      swift_bridgeObjectRelease(v14);
      return;
    }
  }
  __break(1u);
}

- (void)setSelectionFollowsFocus:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC5Files24DOCSidebarCollectionView *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for DOCSidebarCollectionView();
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[DOCSidebarCollectionView selectionFollowsFocus](&v9, "selectionFollowsFocus");
  v8.receiver = v6;
  v8.super_class = v5;
  -[DOCSidebarCollectionView setSelectionFollowsFocus:](&v8, "setSelectionFollowsFocus:", v3);
  if (v7 != -[DOCSidebarCollectionView selectionFollowsFocus](v6, "selectionFollowsFocus")
    && -[DOCSidebarCollectionView selectionFollowsFocus](v6, "selectionFollowsFocus"))
  {
    -[DOCSidebarCollectionView setNeedsFocusUpdate](v6, "setNeedsFocusUpdate");
  }

}

- (BOOL)canBecomeFocused
{
  objc_super v3;

  if ((*((_BYTE *)&self->super.super.super.super.super.isa
        + OBJC_IVAR____TtC5Files24DOCSidebarCollectionView_requireCanBecomeFocusedTrue) & 1) != 0)
    return 1;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCSidebarCollectionView();
  return -[DOCSidebarCollectionView canBecomeFocused](&v3, "canBecomeFocused");
}

@end
