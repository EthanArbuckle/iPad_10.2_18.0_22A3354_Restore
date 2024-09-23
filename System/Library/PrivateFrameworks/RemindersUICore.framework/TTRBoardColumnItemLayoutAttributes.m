@implementation TTRBoardColumnItemLayoutAttributes

- (_TtC15RemindersUICore34TTRBoardColumnItemLayoutAttributes)init
{
  objc_class *ObjectType;
  objc_super v5;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore34TTRBoardColumnItemLayoutAttributes_backgroundRoundedCorners) = (Class)15;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return -[UICollectionViewLayoutAttributes init](&v5, sel_init);
}

- (id)copyWithZone:(void *)a3
{
  _TtC15RemindersUICore34TTRBoardColumnItemLayoutAttributes *v4;
  void *v5;
  _QWORD v7[4];

  v4 = self;
  TTRBoardColumnItemLayoutAttributes.copy(with:)((uint64_t)a3, (uint64_t)v7);

  __swift_project_boxed_opaque_existential_1(v7, v7[3]);
  v5 = (void *)sub_1B4908378();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v7);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _TtC15RemindersUICore34TTRBoardColumnItemLayoutAttributes *v4;
  _TtC15RemindersUICore34TTRBoardColumnItemLayoutAttributes *v5;
  BOOL v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1B4907C4C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = TTRBoardColumnItemLayoutAttributes.isEqual(_:)((uint64_t)v8);

  sub_1B4314F88((uint64_t)v8);
  return v6;
}

@end
