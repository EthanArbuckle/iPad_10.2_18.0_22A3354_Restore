@implementation ContactPickerViewControllerRepresentable.Coordinator

- (_TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator)init
{
  _TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator *result;

  result = (_TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("FindMyAppCore.Coordinator", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_weakDestroy((char *)self + OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_viewModel);
  swift_unknownObjectWeakDestroy((char *)self+ OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_searchController);
  v3 = (char *)self + OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_logger;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

- (id)searchController:(id)a3 composeRecipientForAddress:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t Strong;
  uint64_t v10;
  id v11;
  _TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator *v12;
  id v13;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  v8 = v7;
  Strong = swift_weakLoadStrong((char *)self+ OBJC_IVAR____TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator_viewModel);
  if (Strong)
  {
    v10 = Strong;
    v11 = a3;
    v12 = self;
    v13 = sub_19660(v6, v8);

    swift_bridgeObjectRelease(v8);
    swift_release(v10);
  }
  else
  {
    swift_bridgeObjectRelease(v8);
    v13 = 0;
  }
  return v13;
}

- (void)searchController:(id)a3 didAddRecipient:(id)a4
{
  sub_1E8F0((char *)self, (uint64_t)a2, a3, a4, (void (*)(id))sub_5E74);
}

- (void)searchController:(id)a3 didRemoveRecipient:(id)a4
{
  sub_1E8F0((char *)self, (uint64_t)a2, a3, a4, (void (*)(id))sub_671C);
}

- (void)searchController:(id)a3 willDisplayRowForRecipient:(id)a4
{
  sub_1E8F0((char *)self, (uint64_t)a2, a3, a4, sub_712C);
}

- (void)searchController:(id)a3 didEndDisplayingRowForRecipient:(id)a4
{
  sub_1E8F0((char *)self, (uint64_t)a2, a3, a4, sub_712C);
}

- (id)searchController:(id)a3 tintColorForRecipient:(id)a4
{
  return objc_msgSend((id)objc_opt_self(UIColor), "systemGrayColor");
}

- (void)didTapTextViewAccessoryButtonForSearchController:(id)a3 anchoredToView:(id)a4
{
  id v6;
  id v7;
  _TtCV13FindMyAppCore40ContactPickerViewControllerRepresentable11Coordinator *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_1ED34(v6);

}

- (void)contactPicker:(id)a3 didSelectContactProperty:(id)a4
{
  sub_1E8F0((char *)self, (uint64_t)a2, a3, a4, sub_4118);
}

@end
