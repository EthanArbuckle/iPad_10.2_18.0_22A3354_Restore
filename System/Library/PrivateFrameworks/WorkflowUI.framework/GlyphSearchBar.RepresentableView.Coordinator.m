@implementation GlyphSearchBar.RepresentableView.Coordinator

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  _TtCVV10WorkflowUI14GlyphSearchBarP33_7B2EDB8C9E03C94CB46248885C8C32B517RepresentableView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_220267914();

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  _TtCVV10WorkflowUI14GlyphSearchBarP33_7B2EDB8C9E03C94CB46248885C8C32B517RepresentableView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_220267974();

}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtCVV10WorkflowUI14GlyphSearchBarP33_7B2EDB8C9E03C94CB46248885C8C32B517RepresentableView11Coordinator *v10;

  v6 = _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_2202679D4((uint64_t)v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  _TtCVV10WorkflowUI14GlyphSearchBarP33_7B2EDB8C9E03C94CB46248885C8C32B517RepresentableView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_220267BBC();

}

- (_TtCVV10WorkflowUI14GlyphSearchBarP33_7B2EDB8C9E03C94CB46248885C8C32B517RepresentableView11Coordinator)init
{
  sub_22012DD88();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end
