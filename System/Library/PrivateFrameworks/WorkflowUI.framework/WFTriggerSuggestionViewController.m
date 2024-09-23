@implementation WFTriggerSuggestionViewController

- (WFTriggerSuggestionViewControllerDelegate)delegate
{
  sub_2201DA888();
}

- (void)setDelegate:(id)a3
{
  WFTriggerSuggestionViewController *v4;

  swift_unknownObjectRetain();
  v4 = self;
  sub_2201DA8E4();

}

- (WFTriggerSuggestionViewController)initWithTrigger:(id)a3 selectedEntryMetadataData:(id)a4 selectedReference:(id)a5
{
  void *v6;
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  id v14;

  v6 = a4;
  if (a4)
  {
    v8 = a3;
    v9 = a5;
    v10 = v6;
    v6 = (void *)sub_2203045B4();
    v12 = v11;

  }
  else
  {
    v13 = a3;
    v14 = a5;
    v12 = 0xF000000000000000;
  }
  return (WFTriggerSuggestionViewController *)sub_2201DA918(a3, (uint64_t)v6, v12, a5);
}

- (WFTriggerSuggestionViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2201DACF4();
}

- (void)loadView
{
  WFTriggerSuggestionViewController *v2;

  v2 = self;
  sub_2201DADB0();

}

- (void)viewDidLoad
{
  WFTriggerSuggestionViewController *v2;

  v2 = self;
  sub_2201DBEB8();

}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;
  WFTriggerSuggestionViewController *v5;

  v4 = a3;
  v5 = self;
  sub_2201DCE80();

}

- (id)contentScrollViewForEdge:(unint64_t)a3
{
  WFTriggerSuggestionViewController *v4;
  id v5;

  v4 = self;
  v5 = sub_2201DD08C(a3);

  return v5;
}

- (WFTriggerSuggestionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v5;

  if (a3)
    _sSo32WFShortcutConcerningReportReasona10WorkflowUIE2idSSvg_0();
  v5 = a4;
  sub_2201DD0FC();
}

- (void).cxx_destruct
{

  sub_2200A0118((uint64_t)self + OBJC_IVAR___WFTriggerSuggestionViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFTriggerSuggestionViewController_hostingController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFTriggerSuggestionViewController_searchController));
  swift_release();
  sub_2200ECF84(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR___WFTriggerSuggestionViewController_selectedEntryMetadataData), *(_QWORD *)((char *)&self->super.super._responderFlags+ OBJC_IVAR___WFTriggerSuggestionViewController_selectedEntryMetadataData));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___WFTriggerSuggestionViewController_selectedReference));
}

@end
