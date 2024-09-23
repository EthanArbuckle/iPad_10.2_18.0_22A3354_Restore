@implementation DOCItemCollectionViewController.FolderMenuHeader.IconDeliveryController

- (void)dealloc
{
  void *v2;
  _TtCCC5Files31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController *v3;
  objc_super v4;

  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCCC5Files31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController_iconThumbnail);
  v3 = self;
  objc_msgSend(v2, "removeListener:", v3);
  v4.receiver = v3;
  v4.super_class = (Class)_s16FolderMenuHeaderC22IconDeliveryControllerCMa();
  -[DOCItemCollectionViewController.FolderMenuHeader.IconDeliveryController dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtCCC5Files31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController_iconThumbnail));
  sub_100087534(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCCC5Files31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController_iconProvidingDidLoadCompletion), *(_QWORD *)&self->delivered[OBJC_IVAR____TtCCC5Files31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController_iconProvidingDidLoadCompletion]);
}

- (void)thumbnailLoaded:(id)a3
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _TtCCC5Files31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController *v8;
  _QWORD v9[5];
  uint64_t v10;

  v5 = swift_allocObject(&unk_1005D1418, 24, 7);
  *(_QWORD *)(v5 + 16) = self;
  v9[4] = sub_1001F8C9C;
  v10 = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_10004A82C;
  v9[3] = &unk_1005D1430;
  v6 = _Block_copy(v9);
  v7 = v10;
  v8 = self;
  swift_unknownObjectRetain(a3);
  swift_release(v7);
  DOCRunInMainThread(v6);
  _Block_release(v6);
  swift_unknownObjectRelease(a3);

}

- (_TtCCC5Files31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController)init
{
  _TtCCC5Files31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController *result;

  result = (_TtCCC5Files31DOCItemCollectionViewController16FolderMenuHeader22IconDeliveryController *)_swift_stdlib_reportUnimplementedInitializer("Files.IconDeliveryController", 28, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
