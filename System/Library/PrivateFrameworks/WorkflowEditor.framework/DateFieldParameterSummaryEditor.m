@implementation DateFieldParameterSummaryEditor

- (void)textEntryWillBegin:(id)a3 allowMultipleLines:(BOOL *)a4
{
  _TtC14WorkflowEditorP33_DE5D388F8447713B14486126A05E4AC531DateFieldParameterSummaryEditor *v7;

  swift_unknownObjectRetain();
  v7 = self;
  sub_2267FB940((uint64_t)a3, (uint64_t)a4);
  swift_unknownObjectRelease();

}

- (void)textEntryTextDidChange:(id)a3
{
  id v5;
  _TtC14WorkflowEditorP33_DE5D388F8447713B14486126A05E4AC531DateFieldParameterSummaryEditor *v6;

  v5 = a3;
  v6 = self;
  sub_2267FBA2C((uint64_t)a3);

}

- (void)textEntryDidFinish
{
  _TtC14WorkflowEditorP33_DE5D388F8447713B14486126A05E4AC531DateFieldParameterSummaryEditor *v2;

  v2 = self;
  sub_2267FBACC();

}

- (void)parameterAttributesDidChange:(id)a3
{
  id v4;
  _TtC14WorkflowEditorP33_DE5D388F8447713B14486126A05E4AC531DateFieldParameterSummaryEditor *v5;

  v4 = a3;
  v5 = self;
  sub_2267FBD9C();

}

- (_TtC14WorkflowEditorP33_DE5D388F8447713B14486126A05E4AC531DateFieldParameterSummaryEditor)initWithParameter:(id)a3 arrayIndex:(int64_t)a4 processing:(BOOL)a5
{
  return (_TtC14WorkflowEditorP33_DE5D388F8447713B14486126A05E4AC531DateFieldParameterSummaryEditor *)sub_2267FBDF4(a3, a4, a5);
}

@end
