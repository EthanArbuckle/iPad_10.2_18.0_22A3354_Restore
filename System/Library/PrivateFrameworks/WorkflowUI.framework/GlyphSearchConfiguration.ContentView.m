@implementation GlyphSearchConfiguration.ContentView

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  _TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView *v5;

  v4 = a3;
  v5 = self;
  sub_220268344(v4, 1);

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  _TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView *v5;

  v4 = a3;
  v5 = self;
  sub_220268344(v4, 0);

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView *v10;

  v6 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_2202683F0((uint64_t)v10, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  _TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView *v5;

  v4 = a3;
  v5 = self;
  sub_220268534(v4);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  _TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView *v5;

  v4 = a3;
  v5 = self;
  sub_2202685B4(v4);

}

- (_TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_220268604();
}

- (_TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView)initWithFrame:(CGRect)a3
{
  sub_2201CF4A8();
}

- (void).cxx_destruct
{
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtCC10WorkflowUI24GlyphSearchConfiguration11ContentView_configuration);
}

@end
