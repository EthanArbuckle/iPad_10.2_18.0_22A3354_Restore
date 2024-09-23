@implementation TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row

- (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row)initWithCoder:(id)a3
{
  _OWORD *v5;
  id v6;
  _TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row *result;

  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_suggestionDelegate) = 0;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v5 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_configuration);
  *v5 = 0u;
  v5[1] = 0u;
  v5[2] = 0u;
  v5[3] = 0u;
  v5[4] = 0u;
  v5[5] = 0u;
  v5[6] = 0u;
  v5[7] = 0u;
  v5[8] = 0u;
  v5[9] = 0u;
  v5[10] = 0u;
  v5[11] = 0u;
  v5[12] = 0u;
  v5[13] = 0u;
  v6 = a3;

  result = (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row *)sub_1B4908144();
  __break(1u);
  return result;
}

- (void)didTap:(id)a3
{
  id v4;
  _TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row *v5;

  v4 = a3;
  v5 = self;
  sub_1B454C9D0();

}

- (void)didHover:(id)a3
{
  id v4;
  _TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row *v5;

  v4 = a3;
  v5 = self;
  sub_1B454AFDC(v4);

}

- (NSString)accessibilityLabel
{
  _TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row.accessibilityLabel.getter();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1B4906A34();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (NSArray)accessibilityUserInputLabels
{
  _TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row *v2;
  _QWORD *v3;
  void *v4;

  v2 = self;
  v3 = TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row.accessibilityUserInputLabels.getter();

  if (v3)
  {
    v4 = (void *)sub_1B4906DA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (void)accessibilityElementDidBecomeFocused
{
  _TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row *v2;

  v2 = self;
  TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row.accessibilityElementDidBecomeFocused()();

}

- (void)accessibilityElementDidLoseFocus
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row accessibilityElementDidLoseFocus](&v3, sel_accessibilityElementDidLoseFocus);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_backgroundHighlight], sel_setHidden_, 1, v3.receiver, v3.super_class);

}

- (void)layoutSubviews
{
  _TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row *v2;

  v2 = self;
  TTRIRemindersListCellAutoCompleteSuggestionsStackView.Row.layoutSubviews()();

}

- (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row)initWithFrame:(CGRect)a3
{
  sub_1B454BFD4();
}

- (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row)initWithArrangedSubviews:(id)a3
{
  _TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row *result;

  result = (_TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self+ OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_suggestionDelegate);
  swift_unknownObjectWeakDestroy();
  sub_1B454C190((uint64_t)self+ OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_configuration);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_separator));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_backgroundHighlight));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC15RemindersUICore53TTRIRemindersListCellAutoCompleteSuggestionsStackView3Row_imagesView));
}

@end
