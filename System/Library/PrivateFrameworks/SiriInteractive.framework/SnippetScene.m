@implementation SnippetScene

- (_TtC15SiriInteractive12SnippetScene)initWithSession:(id)a3 connectionOptions:(id)a4
{
  return (_TtC15SiriInteractive12SnippetScene *)sub_246460980(a3, a4);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive12SnippetScene__settingsDiffer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_resolvedMetrics));
  swift_bridgeObjectRelease();
  sub_24646236C((uint64_t)self + OBJC_IVAR____TtC15SiriInteractive12SnippetScene_viewModel);
}

@end
