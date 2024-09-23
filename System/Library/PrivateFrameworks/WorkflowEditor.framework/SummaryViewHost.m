@implementation SummaryViewHost

- (void)willMoveToWindow:(id)a3
{
  id v5;
  _TtC14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770415SummaryViewHost *v6;

  v5 = a3;
  v6 = self;
  sub_2267AF260((uint64_t)a3);

}

- (void)dealloc
{
  _TtC14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770415SummaryViewHost *v2;

  v2 = self;
  sub_2267AF3C4();
}

- (void).cxx_destruct
{
  swift_release();
}

- (_TtC14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770415SummaryViewHost)initWithFrame:(CGRect)a3
{
  return (_TtC14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770415SummaryViewHost *)sub_2267AF488(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770415SummaryViewHost)initWithCoder:(id)a3
{
  return (_TtC14WorkflowEditorP33_060892FA80DB790CDB013ACF6F2F770415SummaryViewHost *)sub_2267AF518(a3);
}

@end
