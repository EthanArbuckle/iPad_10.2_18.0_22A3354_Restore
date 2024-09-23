@implementation DOCCreateFolderViewController

- (id)initForCreatingFolderInParentItem:(id)a3 suggestedName:(id)a4 transitionProxy:(id)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v9 = v8;
  v10 = a3;
  swift_unknownObjectRetain(a5);
  return sub_10028780C(v10, v7, v9, (uint64_t)a5);
}

- (_TtC5Files29DOCCreateFolderViewController)initWithCoder:(id)a3
{
  sub_100287A48((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC5Files29DOCCreateFolderViewController_delegate, 991);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files29DOCCreateFolderViewController_parentItem));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files29DOCCreateFolderViewController_delegate);
}

@end
