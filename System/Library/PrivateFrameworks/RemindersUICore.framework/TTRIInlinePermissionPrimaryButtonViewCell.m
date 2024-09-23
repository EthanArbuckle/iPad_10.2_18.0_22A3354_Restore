@implementation TTRIInlinePermissionPrimaryButtonViewCell

+ (Class)containerViewClass
{
  sub_1B41DF50C(0, &qword_1EF0B6500);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell *)sub_1B4877934((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1B4877738);
}

- (_TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell)initWithCoder:(id)a3
{
  _OWORD *v5;
  id v6;
  _TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell____lazy_storage___primaryButton) = 0;
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_appliedConfiguration);
  *v5 = 0u;
  v5[1] = 0u;
  v6 = a3;

  result = (_TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void)prepareForReuse
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[TTRIInlinePermissionPrimaryButtonViewCell prepareForReuse](&v3, sel_prepareForReuse);
  if (*(_QWORD *)&v2[OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_appliedConfiguration
                    + 8])
    sub_1B48773D0(0, 0, 0, 0);

}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell____lazy_storage___primaryButton));
  sub_1B46166C8(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_appliedConfiguration), *(_QWORD *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_appliedConfiguration), *(unint64_t *)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_appliedConfiguration), *(void **)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15RemindersUICore41TTRIInlinePermissionPrimaryButtonViewCell_appliedConfiguration));
}

@end
