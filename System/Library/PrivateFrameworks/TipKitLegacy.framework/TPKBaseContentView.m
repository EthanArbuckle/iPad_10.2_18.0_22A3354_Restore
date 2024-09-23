@implementation TPKBaseContentView

- (UIView)hostingView
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___TPKBaseContentView_hostingView));
}

- (void)setHostingView:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPKBaseContentView_hostingView);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPKBaseContentView_hostingView) = (Class)a3;
  v3 = a3;

}

- (TPKContentViewDelegate)viewDelegate
{
  return (TPKContentViewDelegate *)(id)MEMORY[0x2495A3F58]((char *)self+ OBJC_IVAR___TPKBaseContentView_viewDelegate, a2);
}

- (void)setViewDelegate:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (TPKContent)content
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPKBaseContentView_content);
  swift_beginAccess();
  return (TPKContent *)*v2;
}

- (void)setContent:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___TPKBaseContentView_content);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (UIColor)contentBackgroundColor
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor));
}

- (void)setContentBackgroundColor:(id)a3
{
  void (*v5)(id);
  TPKBaseContentView *v6;
  id v7;

  v5 = *(void (**)(id))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.super.super.isa) + 0x148);
  v7 = a3;
  v6 = self;
  v5(a3);

}

- (NSDirectionalEdgeInsets)defaultDirectionalEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets);
  v3 = *(double *)((char *)&self->super.super._responderFlags + OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets);
  v4 = *(double *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets);
  v5 = *(double *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets);
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (void)setDefaultDirectionalEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  *(NSDirectionalEdgeInsets *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets) = a3;
  -[TPKBaseContentView setDirectionalLayoutMargins:](self, sel_setDirectionalLayoutMargins_);
}

- (TPKBaseContentView)initWithController:(id)a3 content:(id)a4
{
  return (TPKBaseContentView *)TPKBaseContentView.init(controller:content:)(a3, a4);
}

- (TPKBaseContentView)initWithCoder:(id)a3
{
  return (TPKBaseContentView *)TPKBaseContentView.init(coder:)(a3);
}

- (void)willMoveToWindow:(id)a3
{
  id v5;
  TPKBaseContentView *v6;

  v5 = a3;
  v6 = self;
  sub_248A8F77C((uint64_t)a3);

}

- (void)monitorContentSizeCategoryChanges
{
  TPKBaseContentView *v2;

  v2 = self;
  sub_248A8EA80();

}

- (uint64_t)contentSizeCategoryDidChange:
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_248A9BF68();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_248A9BF5C();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

- (void)updatePreferredDirectionEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  *(NSDirectionalEdgeInsets *)((char *)&self->super.super.super.isa
                             + OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets) = a3;
  -[TPKBaseContentView setDirectionalLayoutMargins:](self, sel_setDirectionalLayoutMargins_);
}

- (void)updateContentBackgroundColor:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor) = (Class)a3;
  v3 = a3;

}

- (void)setupHostingViewWithController:(id)a3 content:(id)a4
{
  char *v7;
  TPKBaseContentView *v8;

  swift_unknownObjectRetain();
  v7 = (char *)a4;
  v8 = self;
  sub_248A8EEF4(a3, v7);
  swift_unknownObjectRelease();

}

- (id)createHostingView
{
  id result;

  result = (id)sub_248A9C7A8();
  __break(1u);
  return result;
}

- (TPKBaseContentView)initWithFrame:(CGRect)a3
{
  TPKBaseContentView *result;

  result = (TPKBaseContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_248A78B20((uint64_t)self + OBJC_IVAR___TPKBaseContentView_viewDelegate);
  swift_unownedRelease();

}

- (id)initWithReusableTipView:(char *)a1
{
  char *v2;
  uint64_t v8;
  void *v9;
  char *v10;
  objc_super v12;

  v2 = &a1[OBJC_IVAR___TPKBaseContentView_directionalEdgeInsets];
  __asm { FMOV            V0.2D, #16.0 }
  *(_OWORD *)v2 = _Q0;
  *((_OWORD *)v2 + 1) = _Q0;
  v8 = OBJC_IVAR___TPKBaseContentView_contentViewBackgroundColor;
  v9 = (void *)objc_opt_self();
  v10 = a1;
  *(_QWORD *)&a1[v8] = objc_msgSend(v9, sel_tertiarySystemFillColor);
  *(_QWORD *)&v10[OBJC_IVAR___TPKBaseContentView_hostingView] = 0;
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v10[OBJC_IVAR___TPKBaseContentView_viewModel] = 0;
  *(_QWORD *)&v10[OBJC_IVAR___TPKBaseContentView_content] = 0;

  v12.receiver = v10;
  v12.super_class = (Class)type metadata accessor for TPKBaseContentView();
  return objc_msgSendSuper2(&v12, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

@end
