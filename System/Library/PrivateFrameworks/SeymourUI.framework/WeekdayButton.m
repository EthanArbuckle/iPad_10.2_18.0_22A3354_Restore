@implementation WeekdayButton

- (_TtC9SeymourUI13WeekdayButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI13WeekdayButton *)sub_22B70257C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI13WeekdayButton)initWithCoder:(id)a3
{
  _QWORD *v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  char *v10;
  _TtC9SeymourUI13WeekdayButton *result;
  _QWORD v12[2];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;

  v4 = (Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_onTap);
  *v4 = 0;
  v4[1] = 0;
  v5 = (char *)self + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider;
  v6 = a3;
  sub_22B703A9C(v12);
  v7 = v12[1];
  v8 = v16;
  *(_QWORD *)v5 = v12[0];
  *((_QWORD *)v5 + 1) = v7;
  v9 = v14;
  *((_OWORD *)v5 + 1) = v13;
  *((_OWORD *)v5 + 2) = v9;
  *((_OWORD *)v5 + 3) = v15;
  *((_QWORD *)v5 + 8) = v8;
  *(_OWORD *)(v5 + 72) = v17;
  *((_QWORD *)v5 + 11) = 0x4044000000000000;
  v10 = (char *)self + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_item;
  *(_QWORD *)v10 = 0;
  *((_WORD *)v10 + 4) = 0;

  result = (_TtC9SeymourUI13WeekdayButton *)sub_22BA815D0();
  __break(1u);
  return result;
}

- (void)updateConfiguration
{
  _TtC9SeymourUI13WeekdayButton *v2;

  v2 = self;
  sub_22B702B74();

}

- (void)buttonTapped:(id)a3
{
  void *v3;
  void (*v5)(id, uint64_t);
  uint64_t v6;
  id v7;
  _TtC9SeymourUI13WeekdayButton *v8;
  id v9;

  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_item);
  if (v3)
  {
    v5 = *(void (**)(id, uint64_t))((char *)&self->super.super.super.super.super.isa
                                            + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_onTap);
    if (v5)
    {
      v6 = *(unsigned __int16 *)((char *)&self->super.super.super.super._responderFlags
                               + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_item);
      v7 = a3;
      v8 = self;
      v9 = v3;
      sub_22B0FAA58((uint64_t)v5);
      v5(v9, v6);
      sub_22B0FAA68((uint64_t)v5);

    }
  }
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_onTap));
  v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  v4 = *(NSMutableArray **)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  v5 = *(UITraitCollection **)((char *)&self->super.super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  v6 = *(UIViewAnimationInfo **)((char *)&self->super.super.super._animationInfo
                               + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  v7 = *(uint64_t *)((char *)&self->super.super.super._swiftAnimationInfo
                  + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  v8 = *(uint64_t *)((char *)&self->super.super.super._traitChangeRegistry
                  + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  v9 = *(NSArray **)((char *)&self->super.super.super._subviewCache
                   + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  v10 = *(UIWindow **)((char *)&self->super.super.super._window + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI13WeekdayButton_styleProvider));
  sub_22B29F334(v3, v4, v5, v6, v7, v8);

}

@end
