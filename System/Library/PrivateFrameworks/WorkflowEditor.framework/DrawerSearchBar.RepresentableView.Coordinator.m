@implementation DrawerSearchBar.RepresentableView.Coordinator

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  id v6;
  _TtCVV14WorkflowEditor15DrawerSearchBarP33_E51C85E07E6B1A263BBD21DD7A09E88317RepresentableView11Coordinator *v7;

  sub_22688E220();
  v6 = a3;
  v7 = self;
  sub_2266E5B4C(v6);

  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  id v4;
  _TtCVV14WorkflowEditor15DrawerSearchBarP33_E51C85E07E6B1A263BBD21DD7A09E88317RepresentableView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2266E5C68(v4);

}

- (void)searchBarTextDidEndEditing:(id)a3
{
  id v4;
  _TtCVV14WorkflowEditor15DrawerSearchBarP33_E51C85E07E6B1A263BBD21DD7A09E88317RepresentableView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2266E5CD0(v4);

}

- (void)searchBarCancelButtonClicked:(id)a3
{
  id v4;
  _TtCVV14WorkflowEditor15DrawerSearchBarP33_E51C85E07E6B1A263BBD21DD7A09E88317RepresentableView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2266E5D38(v4);

}

- (void)searchBarSearchButtonClicked:(id)a3
{
  id v4;
  _TtCVV14WorkflowEditor15DrawerSearchBarP33_E51C85E07E6B1A263BBD21DD7A09E88317RepresentableView11Coordinator *v5;

  v4 = a3;
  v5 = self;
  sub_2266E5DEC(v4);

}

- (_TtCVV14WorkflowEditor15DrawerSearchBarP33_E51C85E07E6B1A263BBD21DD7A09E88317RepresentableView11Coordinator)init
{
  sub_2266B8448();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
}

@end
