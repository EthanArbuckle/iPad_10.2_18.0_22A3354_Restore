@implementation TTRIHashtagCollectionCell

+ (Class)containerViewClass
{
  type metadata accessor for TTRIMarginTransferringContainerBoxView();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15RemindersUICore25TTRIHashtagCollectionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_1B4906A64();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC15RemindersUICore25TTRIHashtagCollectionCell *)sub_1B480BAD0(a3, (uint64_t)a4, v6);
}

- (_TtC15RemindersUICore25TTRIHashtagCollectionCell)initWithCoder:(id)a3
{
  id v5;
  _TtC15RemindersUICore25TTRIHashtagCollectionCell *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15RemindersUICore25TTRIHashtagCollectionCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  v5 = a3;

  result = (_TtC15RemindersUICore25TTRIHashtagCollectionCell *)sub_1B4908144();
  __break(1u);
  return result;
}

- (BOOL)_accessibilityScrollingEnabled
{
  return 0;
}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore25TTRIHashtagCollectionCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore25TTRIHashtagCollectionCell_collectionView));
}

@end
