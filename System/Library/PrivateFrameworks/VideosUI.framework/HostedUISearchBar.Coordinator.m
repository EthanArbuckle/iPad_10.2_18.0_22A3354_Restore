@implementation HostedUISearchBar.Coordinator

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  _TtCV8VideosUI17HostedUISearchBar11Coordinator *v10;

  v6 = sub_1DA143E80();
  v8 = v7;
  v9 = a3;
  v10 = self;
  sub_1D9E7E5BC(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  void *v3;
  id v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  sub_1D9E7E764();

  OUTLINED_FUNCTION_4_3(v4);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  void *v3;
  id v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  sub_1D9E7E7BC();

  OUTLINED_FUNCTION_4_3(v4);
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v4 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D9E7E814(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (void)searchBarCancelButtonClicked:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  OUTLINED_FUNCTION_4_11();
  v4 = (void *)OUTLINED_FUNCTION_2_13();
  sub_1D9E7E8E4(v4);

  OUTLINED_FUNCTION_4_3(v5);
}

- (BOOL)textFieldShouldClear:(id)a3
{
  void *v3;
  id v4;

  OUTLINED_FUNCTION_26_5((uint64_t)self, (uint64_t)a2, a3);
  v4 = OUTLINED_FUNCTION_4_11();
  sub_1D9E7E968();

  return 1;
}

- (_TtCV8VideosUI17HostedUISearchBar11Coordinator)init
{
  sub_1D9E7EA04();
}

- (void).cxx_destruct
{
  uint64_t v3;
  unint64_t v4;

  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_36_76();
  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_36_76();
  OUTLINED_FUNCTION_9_0();
  v3 = *(_QWORD *)&self->_text[OBJC_IVAR____TtCV8VideosUI17HostedUISearchBar11Coordinator__textInputSource + 8];
  v4 = *(_QWORD *)&self->_text[OBJC_IVAR____TtCV8VideosUI17HostedUISearchBar11Coordinator__textInputSource + 16];
  swift_release();
  OUTLINED_FUNCTION_9_0();
  sub_1D9B51ED0(v3, v4);
  swift_release();
  swift_release();
}

@end
