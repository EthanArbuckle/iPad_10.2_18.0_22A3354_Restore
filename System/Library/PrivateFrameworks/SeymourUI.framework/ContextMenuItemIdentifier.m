@implementation ContextMenuItemIdentifier

- (BOOL)isEqual:(id)a3
{
  _TtC9SeymourUI25ContextMenuItemIdentifier *v4;
  _TtC9SeymourUI25ContextMenuItemIdentifier *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_22BA812E8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_22B304490((uint64_t)v8);

  sub_22B304644((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  _TtC9SeymourUI25ContextMenuItemIdentifier *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_22BA81408();

  return v3;
}

- (_TtC9SeymourUI25ContextMenuItemIdentifier)init
{
  _TtC9SeymourUI25ContextMenuItemIdentifier *result;

  result = (_TtC9SeymourUI25ContextMenuItemIdentifier *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22B107928((uint64_t)self + OBJC_IVAR____TtC9SeymourUI25ContextMenuItemIdentifier_item);
}

@end
