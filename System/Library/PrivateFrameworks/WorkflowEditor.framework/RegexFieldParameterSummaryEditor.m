@implementation RegexFieldParameterSummaryEditor

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
  _TtC14WorkflowEditorP33_5A7C08B693FD27A083A0FB9B3ECD43E132RegexFieldParameterSummaryEditor *v7;

  swift_unknownObjectRetain();
  v7 = self;
  sub_226673458((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease();

}

- (void)textEntryTextDidChange:(id)a3
{
  id v5;
  _TtC14WorkflowEditorP33_5A7C08B693FD27A083A0FB9B3ECD43E132RegexFieldParameterSummaryEditor *v6;

  v5 = a3;
  v6 = self;
  sub_226673544((uint64_t)a3);

}

- (void)textEntryDidFinish
{
  _TtC14WorkflowEditorP33_5A7C08B693FD27A083A0FB9B3ECD43E132RegexFieldParameterSummaryEditor *v2;

  v2 = self;
  sub_2266735E4();

}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4;
  _TtC14WorkflowEditorP33_5A7C08B693FD27A083A0FB9B3ECD43E132RegexFieldParameterSummaryEditor *v5;

  v4 = a3;
  v5 = self;
  sub_226673870();

}

- (_TtC14WorkflowEditorP33_5A7C08B693FD27A083A0FB9B3ECD43E132RegexFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_5A7C08B693FD27A083A0FB9B3ECD43E132RegexFieldParameterSummaryEditor *)sub_2266738C8(a3, a4, a5);
}

@end
