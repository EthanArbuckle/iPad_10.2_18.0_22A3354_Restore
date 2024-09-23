@implementation ImagePicker.Coordinator

- (void)imagePickerController:(id)a3 didFinishPickingMediaWithInfo:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  Swift::OpaquePointer v10;
  _TtCV11MusicCoreUI11ImagePicker11Coordinator *v11;
  id _;

  _s3__C7InfoKeyVMa_0(0);
  v8 = v7;
  v9 = sub_4DD24(&qword_150D540, (uint64_t (*)(uint64_t))_s3__C7InfoKeyVMa_0, (uint64_t)&unk_10AA9EC);
  v10._rawValue = (void *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, v8, (char *)&type metadata for Any + 8, v9);
  _ = a3;
  v11 = self;
  ImagePicker.Coordinator.imagePickerController(_:didFinishPickingMediaWithInfo:)((UIImagePickerController)_, v10);
  swift_bridgeObjectRelease();

}

- (void)imagePickerControllerDidCancel:(id)a3
{
  id v4;
  _TtCV11MusicCoreUI11ImagePicker11Coordinator *v5;

  v4 = a3;
  v5 = self;
  ImagePicker.Coordinator.imagePickerControllerDidCancel(_:)((UIImagePickerController)v4);

}

- (void)documentPicker:(id)a3 didPickDocumentsAtURLs:(id)a4
{
  uint64_t v7;
  Swift::OpaquePointer v8;
  _TtCV11MusicCoreUI11ImagePicker11Coordinator *v9;
  id _;

  v7 = type metadata accessor for URL(0);
  v8._rawValue = (void *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  _ = a3;
  v9 = self;
  ImagePicker.Coordinator.documentPicker(_:didPickDocumentsAt:)((UIDocumentPickerViewController)_, v8);
  swift_bridgeObjectRelease();

}

- (void)documentPickerWasCancelled:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _TtCV11MusicCoreUI11ImagePicker11Coordinator *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;

  v5 = type metadata accessor for ImagePicker(0);
  __chkstk_darwin();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_EAC7B0((uint64_t)self + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator_imagePicker, (uint64_t)v7);
  v8 = &v7[*(int *)(v5 + 32)];
  v9 = *(_QWORD *)v8;
  v10 = *((_QWORD *)v8 + 1);
  LOBYTE(v8) = v8[16];
  v15 = v9;
  v16 = v10;
  v17 = (char)v8;
  HIBYTE(v14) = 0;
  v11 = a3;
  v12 = self;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_150D510);
  Binding.wrappedValue.setter((char *)&v14 + 7, v13);
  objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);
  sub_EAC7F4((uint64_t)v7);

}

- (void)presentationControllerDidDismiss:(id)a3
{
  char *v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  v3 = (char *)self + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator_imagePicker;
  v4 = &v3[*(int *)(type metadata accessor for ImagePicker(0) + 32)];
  v5 = *(_QWORD *)v4;
  v6 = *((_QWORD *)v4 + 1);
  LOBYTE(v4) = v4[16];
  v9 = v5;
  v10 = v6;
  v11 = (char)v4;
  v8 = 0;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_150D510);
  Binding.wrappedValue.setter(&v8, v7);
}

- (_TtCV11MusicCoreUI11ImagePicker11Coordinator)init
{
  _TtCV11MusicCoreUI11ImagePicker11Coordinator *result;

  result = (_TtCV11MusicCoreUI11ImagePicker11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("MusicCoreUI.Coordinator", 23, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_EAC7F4((uint64_t)self + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator_imagePicker);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator_pickHandler), *(_QWORD *)&self->pickHandler[OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator_pickHandler]);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV11MusicCoreUI11ImagePicker11Coordinator____lazy_storage___downloadFailureAlertController));
}

@end
