@implementation DownloadsCVCLibraryActionControllerBridge

- (_TtC23ShelfKitCollectionViews41DownloadsCVCLibraryActionControllerBridge)init
{
  _TtC23ShelfKitCollectionViews41DownloadsCVCLibraryActionControllerBridge *result;

  result = (_TtC23ShelfKitCollectionViews41DownloadsCVCLibraryActionControllerBridge *)_swift_stdlib_reportUnimplementedInitializer("ShelfKitCollectionViews.DownloadsCVCLibraryActionControllerBridge", 65, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_0((Class *)((char *)&self->super.isa
                                                     + OBJC_IVAR____TtC23ShelfKitCollectionViews41DownloadsCVCLibraryActionControllerBridge_libraryActionController));
}

- (void)cancelDownloadForEpisodeUuid:(id)a3
{
  sub_22259C((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))&dispatch thunk of LibraryActionControllerProtocol.cancel(download:));
}

- (void)cancelAllDownloadsUserInitiated:(BOOL)a3
{
  _BOOL8 v3;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _TtC23ShelfKitCollectionViews41DownloadsCVCLibraryActionControllerBridge *v8;

  v3 = a3;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews41DownloadsCVCLibraryActionControllerBridge_libraryActionController);
  v6 = v5[3];
  v7 = v5[4];
  __swift_project_boxed_opaque_existential_1(v5, v6);
  v8 = self;
  dispatch thunk of LibraryActionControllerProtocol.cancelAllDownloads(userInitiated:)(v3, v6, v7);

}

- (void)resumeOrPauseEpisodeDownloadWithUuid:(id)a3
{
  sub_22259C((char *)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))&dispatch thunk of LibraryActionControllerProtocol.resumeOrPauseEpisodeDownload(withUuid:));
}

@end
