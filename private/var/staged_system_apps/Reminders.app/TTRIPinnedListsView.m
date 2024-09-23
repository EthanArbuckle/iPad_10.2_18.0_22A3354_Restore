@implementation TTRIPinnedListsView

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TTRIPinnedListsView(0);
  v4 = v5.receiver;
  -[TTRIPinnedListsView setUserInteractionEnabled:](&v5, "setUserInteractionEnabled:", v3);
  sub_100014D64();

}

- (BOOL)isUserInteractionEnabled
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TTRIPinnedListsView(0);
  return -[TTRIPinnedListsView isUserInteractionEnabled](&v3, "isUserInteractionEnabled");
}

- (_TtC9Reminders19TTRIPinnedListsView)initWithFrame:(CGRect)a3
{
  return (_TtC9Reminders19TTRIPinnedListsView *)sub_10000D9A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9Reminders19TTRIPinnedListsView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100250108();
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (void)didTapControl:(id)a3
{
  char *v4;
  _TtC9Reminders19TTRIPinnedListsView *v5;

  if (a3)
  {
    v5 = self;
    v4 = (char *)a3;
    sub_10024F74C(v4, 1);

  }
}

- (void)didSelectControl:(id)a3
{
  _TtC9Reminders19TTRIPinnedListsView *v4;
  _TtC9Reminders19TTRIPinnedListsView *v5;
  _TtC9Reminders19TTRIPinnedListsView *v6;
  uint64_t v7;
  char *v8;
  _TtC9Reminders19TTRIPinnedListsView *v9;

  if ((self->NUIContainerGridView_opaque[OBJC_IVAR____TtC9Reminders19TTRIPinnedListsView_selectionFollowsFocus] & 1) == 0
    && a3)
  {
    v4 = self;
    v5 = (_TtC9Reminders19TTRIPinnedListsView *)a3;
    v6 = (_TtC9Reminders19TTRIPinnedListsView *)-[TTRIPinnedListsView view](v5, "view");
    if (v6)
    {
      v9 = v6;
      v7 = type metadata accessor for TTRIPinnedListControl(0);
      v8 = (char *)swift_dynamicCastClass(v9, v7);
      if (v8)
        sub_10024F74C(v8, 0);

      v5 = v4;
    }
    else
    {
      v9 = v4;
    }

  }
}

- (_TtC9Reminders19TTRIPinnedListsView)initWithArrangedSubviewRows:(id)a3
{
  _TtC9Reminders19TTRIPinnedListsView *result;

  result = (_TtC9Reminders19TTRIPinnedListsView *)_swift_stdlib_reportUnimplementedInitializer("Reminders.TTRIPinnedListsView", 29, "init(arrangedSubviewRows:)", 26, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000381C8((uint64_t)&self->NUIContainerGridView_opaque[OBJC_IVAR____TtC9Reminders19TTRIPinnedListsView_pinnedListsViewDelegate]);
  sub_1000073A0((uint64_t)&self->NUIContainerGridView_opaque[OBJC_IVAR____TtC9Reminders19TTRIPinnedListsView_selectedPinnedList], (uint64_t *)&unk_100646680);
  swift_release();
  swift_bridgeObjectRelease(*(_QWORD *)&self->NUIContainerGridView_opaque[OBJC_IVAR____TtC9Reminders19TTRIPinnedListsView_pinnedLists]);
  sub_1000073A0((uint64_t)&self->NUIContainerGridView_opaque[OBJC_IVAR____TtC9Reminders19TTRIPinnedListsView_dropTargetPinnedListID], &qword_100650718);
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6;
  _TtC9Reminders19TTRIPinnedListsView *v7;
  char v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_100250234(a4);

  swift_unknownObjectRelease(a4);
  return v8 & 1;
}

- (void)dropInteraction:(void *)a3 sessionDidEnter:(uint64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;

  v7 = sub_10002A750(&qword_100650718);
  __chkstk_darwin(v7);
  v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = type metadata accessor for UUID(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v9, 1, 1, v10);
  v11 = a3;
  swift_unknownObjectRetain(a4);
  v12 = a1;
  sub_10024E750((uint64_t)v9);
  sub_1000073A0((uint64_t)v9, &qword_100650718);

  swift_unknownObjectRelease(a4);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  _TtC9Reminders19TTRIPinnedListsView *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  v8 = sub_1002502C0(a4);

  swift_unknownObjectRelease(a4);
  return v8;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6;
  _TtC9Reminders19TTRIPinnedListsView *v7;

  v6 = a3;
  swift_unknownObjectRetain(a4);
  v7 = self;
  sub_100250630(a4);

  swift_unknownObjectRelease(a4);
}

@end
