@implementation TextInputParameterSummaryEditor

- (void)beginEditingSlotWithIdentifier:(id)a3 presentationAnchor:(id)a4
{
  id v6;
  id v7;
  _TtC14WorkflowEditor31TextInputParameterSummaryEditor *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_2266E6E90();

}

- (void)cancelEditingWithCompletionHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  _TtC14WorkflowEditor31TextInputParameterSummaryEditor *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  *(_QWORD *)(v5 + 24) = self;
  v6 = self;
  sub_226838290((uint64_t)&unk_255881098, v5);
}

- (WFVariableProvider)variableProvider
{
  _TtC14WorkflowEditor31TextInputParameterSummaryEditor *v2;
  id v3;

  v2 = self;
  v3 = sub_2268160A4();

  return (WFVariableProvider *)v3;
}

- (void)setVariableProvider:(id)a3
{
  _TtC14WorkflowEditor31TextInputParameterSummaryEditor *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_226816124((uint64_t)a3);

}

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
  _TtC14WorkflowEditor31TextInputParameterSummaryEditor *v7;

  swift_unknownObjectRetain();
  v7 = self;
  sub_2268161D0((uint64_t)a3, (unsigned __int8 *)a4);

  swift_unknownObjectRelease();
}

- (void)textEntryTextDidChange:(id)a3
{
  id v5;
  _TtC14WorkflowEditor31TextInputParameterSummaryEditor *v6;

  v5 = a3;
  v6 = self;
  sub_2268167BC(a3);

}

- (void)textEntryDidFinish
{
  _TtC14WorkflowEditor31TextInputParameterSummaryEditor *v2;

  v2 = self;
  sub_2268168DC();

}

+ (unint64_t)variableResultTypeForParameter:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v5;

  v3 = a3;
  sub_2268169A4();
  v5 = v4;

  return v5;
}

- (void)textEntryDidCutWithOriginalBlock:(id)a3
{
  sub_226817170(self, (int)a2, a3, (void (*)(void))sub_226816A18);
}

- (void)textEntryDidCopyWithOriginalBlock:(id)a3
{
  sub_226817170(self, (int)a2, a3, (void (*)(void))sub_226816AA0);
}

- (void)textEntryDidPasteWithOriginalBlock:(id)a3
{
  sub_226817170(self, (int)a2, a3, (void (*)(void))sub_226816AF4);
}

- (_TtC14WorkflowEditor31TextInputParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditor31TextInputParameterSummaryEditor *)sub_226817354(a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor31TextInputParameterSummaryEditor_autocompleteDataSource));
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor31TextInputParameterSummaryEditor_textAttachmentToEdit));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC14WorkflowEditor31TextInputParameterSummaryEditor_autocompleteCoordinator));
}

@end
