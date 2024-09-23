@implementation TTRIInlinePermissionHeaderViewCell

+ (Class)containerViewClass
{
  sub_1B41DF50C(0, &qword_1EF0B64E0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell *)sub_1B4877934((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_1B4875C24);
}

- (_TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B4878120();
}

- (void)prepareForReuse
{
  char *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  objc_super v12;
  _OWORD v13[3];
  uint64_t v14;

  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  v2 = (char *)v12.receiver;
  -[TTRIInlinePermissionHeaderViewCell prepareForReuse](&v12, sel_prepareForReuse);
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  v3 = &v2[OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration];
  v4 = *(_QWORD *)&v2[OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration + 16];
  if (v4)
  {
    v6 = *((_QWORD *)v3 + 5);
    v5 = (void *)*((_QWORD *)v3 + 6);
    v8 = *((_QWORD *)v3 + 3);
    v7 = *((_QWORD *)v3 + 4);
    v10 = *(void **)v3;
    v9 = *((_QWORD *)v3 + 1);
    _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
    v11 = v10;
    _s15RemindersUICore21TTRProcessEnvironmentV24dictionaryRepresentationSDyS2SGvg_0();
    sub_1B474897C(v6, v5);
    sub_1B487804C(v10, v9, v4, v8, v7, v6, v5);
    sub_1B487804C(0, 0, 0, 0, 0, 0, 0);
    sub_1B48754F4(v13);
  }

}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell____lazy_storage___iconView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell____lazy_storage___bodyLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell____lazy_storage___dismissButton));
  sub_1B487804C(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration), *(_QWORD *)((char *)&self->super.super.super.super._responderFlags+ OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration), *(uint64_t *)((char *)&self->super.super.super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration), *(uint64_t *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration), *(uint64_t *)((char *)&self->super.super.super._cachedTraitCollection+ OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration), *(unint64_t *)((char *)&self->super.super.super._animationInfo+ OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration), *(void **)((char *)&self->super.super.super._swiftAnimationInfo+ OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell_appliedConfiguration));
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4;
  _TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  id v27;

  v4 = a3;
  v5 = self;
  v27 = sub_1B4876624(&OBJC_IVAR____TtC15RemindersUICore34TTRIInlinePermissionHeaderViewCell____lazy_storage___titleLabel, 8, (SEL *)&selRef_labelColor);
  objc_msgSend(v27, sel_bounds);
  -[TTRIInlinePermissionHeaderViewCell convertRect:fromCoordinateSpace:](v5, sel_convertRect_fromCoordinateSpace_, v27);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v27, sel_effectiveAlignmentRectInsets);
  v16 = UIEdgeInsetsInsetRect(v7, v9, v11, v13, v14, v15);
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[TTRIInlinePermissionHeaderViewCell bounds](v5, sel_bounds);
  _sSo23NSDirectionalEdgeInsetsV15RemindersUICoreE12forInsetting8toBecome15layoutDirectionABSo6CGRectV_AHSo021UIUserInterfaceLayoutK0VtcfC_0((unint64_t)-[TTRIInlinePermissionHeaderViewCell effectiveUserInterfaceLayoutDirection](v5, sel_effectiveUserInterfaceLayoutDirection), v23, v24, v25, v26, v16, v18, v20, v22);
  -[TTRIInlinePermissionHeaderViewCell setSeparatorInset:](v5, sel_setSeparatorInset_, 0.0);

}

@end
