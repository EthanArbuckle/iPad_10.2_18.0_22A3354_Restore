@implementation SiriSharedUIAssistantSuggestionView

- (id)pressDownHandler
{
  return sub_1DE111DB4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SiriSharedUIAssistantSuggestionView_pressDownHandler, (uint64_t)&block_descriptor_26);
}

- (void)setPressDownHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SiriSharedUIAssistantSuggestionView_pressDownHandler);
  swift_beginAccess();
  *v6 = sub_1DE1144E0;
  v6[1] = v5;
  swift_release();
}

- (id)pressUpHandler
{
  return sub_1DE111DB4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___SiriSharedUIAssistantSuggestionView_pressUpHandler, (uint64_t)&block_descriptor_4);
}

- (void)setPressUpHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t (**v6)(uint64_t, uint64_t, uint64_t);

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))((char *)self
                                                          + OBJC_IVAR___SiriSharedUIAssistantSuggestionView_pressUpHandler);
  swift_beginAccess();
  *v6 = sub_1DE114280;
  v6[1] = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v5;
  swift_release();
}

- (SiriSharedUIAssistantSuggestionView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s12SiriSharedUI0aB25UIAssistantSuggestionViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)performSuggestionInPlaceAnimationPresenting
{
  SiriSharedUIAssistantSuggestionView *v2;

  v2 = self;
  sub_1DE1129DC();

}

- (void)performSuggestionInPlaceAnimationDismissing
{
  SiriSharedUIAssistantSuggestionView *v2;

  v2 = self;
  sub_1DE1307C4();
  sub_1DE1302D8();

  swift_release();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___SiriSharedUIAssistantSuggestionView_hostingView);
  if (v3)
    objc_msgSend(v3, sel__layoutSizeThatFits_fixedAxes_, 0, result.width, result.height);
  else
    __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SiriSharedUIAssistantSuggestionView();
  v2 = (char *)v5.receiver;
  -[SiriSharedUIAssistantSuggestionView layoutSubviews](&v5, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR___SiriSharedUIAssistantSuggestionView_hostingView];
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);

  }
  else
  {
    __break(1u);
  }
}

- (SiriSharedUIAssistantSuggestionView)initWithFrame:(CGRect)a3
{
  SiriSharedUIAssistantSuggestionView *result;

  result = (SiriSharedUIAssistantSuggestionView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();

  swift_release();
  swift_release();
}

@end
