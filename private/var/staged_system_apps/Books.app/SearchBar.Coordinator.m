@implementation SearchBar.Coordinator

- (BOOL)searchBar:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtCV5Books9SearchBar11Coordinator_isEditing) = 1;
  return 1;
}

- (void)searchBar:(id)a3 textDidChange:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[2];
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v7 = *(_QWORD *)&self->_text[OBJC_IVAR____TtCV5Books9SearchBar11Coordinator__text + 8];
  v6 = *(_QWORD *)&self->_text[OBJC_IVAR____TtCV5Books9SearchBar11Coordinator__text + 16];
  v11 = *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtCV5Books9SearchBar11Coordinator__text);
  v12 = v7;
  v13 = v6;
  v10[0] = v5;
  v10[1] = v8;
  v9 = sub_10004CFD4(&qword_1009EBCA0);
  Binding.wrappedValue.setter(v10, v9);
}

- (void)searchBarTextDidEndEditing:(id)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtCV5Books9SearchBar11Coordinator_isEditing) = 0;
}

- (void)searchBarSearchButtonClicked:(id)a3
{
  uint64_t v4;
  void (*v5)(uint64_t);
  id v6;
  _TtCV5Books9SearchBar11Coordinator *v7;
  uint64_t v8;

  v5 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtCV5Books9SearchBar11Coordinator_searchAction);
  v4 = *(_QWORD *)&self->_text[OBJC_IVAR____TtCV5Books9SearchBar11Coordinator_searchAction];
  v6 = a3;
  v7 = self;
  v8 = swift_retain(v4);
  v5(v8);

  swift_release(v4);
}

- (_TtCV5Books9SearchBar11Coordinator)init
{
  _TtCV5Books9SearchBar11Coordinator *result;

  result = (_TtCV5Books9SearchBar11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("Books.Coordinator", 17, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV5Books9SearchBar11Coordinator__text);
  v4 = *(_QWORD *)&self->_text[OBJC_IVAR____TtCV5Books9SearchBar11Coordinator__text];
  swift_bridgeObjectRelease(*(_QWORD *)&self->_text[OBJC_IVAR____TtCV5Books9SearchBar11Coordinator__text + 16]);
  swift_release(v4);
  swift_release(v3);
  swift_release(*(_QWORD *)&self->_text[OBJC_IVAR____TtCV5Books9SearchBar11Coordinator_searchAction]);
}

@end
