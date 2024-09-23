@implementation SharedAlbumSubscriberPicker.SharedAlbumSubscriberPickerCoordinator

- (void)photoRecipientViewController:(id)a3 didCompleteWithRecipients:(id)a4
{
  unint64_t v6;
  id v7;
  _TtCV12PhotosUICore27SharedAlbumSubscriberPicker38SharedAlbumSubscriberPickerCoordinator *v8;

  sub_1A6856488(0, (unint64_t *)&unk_1EE8D9890);
  v6 = sub_1A7AE3A10();
  v7 = a3;
  v8 = self;
  sub_1A68A03B8(v7, v6);

  swift_bridgeObjectRelease();
}

- (void)photoRecipientViewControllerDidCancel:(id)a3
{
  objc_msgSend(a3, sel_dismissViewControllerAnimated_completion_, 1, 0);
}

- (_TtCV12PhotosUICore27SharedAlbumSubscriberPicker38SharedAlbumSubscriberPickerCoordinator)init
{
  _TtCV12PhotosUICore27SharedAlbumSubscriberPicker38SharedAlbumSubscriberPickerCoordinator *result;

  result = (_TtCV12PhotosUICore27SharedAlbumSubscriberPicker38SharedAlbumSubscriberPickerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end
