@implementation LibraryMenuViewController.DownloadManagerObserver

- (_TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver)init
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  objc_class *v6;
  _TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver *v7;
  void *v8;
  _TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver *v9;
  id v10;
  objc_super v12;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didEnqueueAssetDownloads);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didFinishAssetDownload);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didCancelAssetsDownload);
  v6 = (objc_class *)type metadata accessor for LibraryMenuViewController.DownloadManagerObserver();
  *v5 = 0;
  v5[1] = 0;
  v12.receiver = self;
  v12.super_class = v6;
  v7 = -[LibraryMenuViewController.DownloadManagerObserver init](&v12, "init");
  v8 = (void *)objc_opt_self(MPMediaDownloadManager);
  v9 = v7;
  v10 = objc_msgSend(v8, "sharedManager");
  objc_msgSend(v10, "registerObserver:", v9);

  return v9;
}

- (void)dealloc
{
  void *v3;
  _TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver *v4;
  id v5;
  objc_super v6;

  v3 = (void *)objc_opt_self(MPMediaDownloadManager);
  v4 = self;
  v5 = objc_msgSend(v3, "sharedManager");
  objc_msgSend(v5, "unregisterObserver:", v4);

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for LibraryMenuViewController.DownloadManagerObserver();
  -[LibraryMenuViewController.DownloadManagerObserver dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didEnqueueAssetDownloads), *(_QWORD *)&self->didEnqueueAssetDownloads[OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didEnqueueAssetDownloads]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didFinishAssetDownload), *(_QWORD *)&self->didEnqueueAssetDownloads[OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didFinishAssetDownload]);
  sub_5C198(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didCancelAssetsDownload), *(_QWORD *)&self->didEnqueueAssetDownloads[OBJC_IVAR____TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver_didCancelAssetsDownload]);
}

- (void)downloadManager:(id)a3 didEnqueueAssetDownloads:(id)a4 didRemoveAssetDownloads:(id)a5
{
  uint64_t v9;
  _TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver *v10;
  id v11;
  id v12;
  id v13;

  sub_4E684(0, (unint64_t *)&qword_14AD360, OS_dispatch_queue_ptr);
  v9 = swift_allocObject(&unk_1368D90, 24, 7);
  *(_QWORD *)(v9 + 16) = self;
  v10 = self;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_4B5EF4, v9);

  swift_release(v9);
}

- (void)downloadManager:(id)a3 didFinishAsset:(id)a4 withError:(id)a5
{
  id v6;
  uint64_t v9;
  uint64_t v10;
  _TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver *v11;
  id v12;
  id v13;

  v6 = a4;
  if (a4)
  {
    v9 = sub_4E684(0, (unint64_t *)&unk_14CD4D0, MPMediaDownload_ptr);
    v6 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v6, v9);
  }
  sub_4E684(0, (unint64_t *)&qword_14AD360, OS_dispatch_queue_ptr);
  v10 = swift_allocObject(&unk_1368D68, 24, 7);
  *(_QWORD *)(v10 + 16) = self;
  v11 = self;
  v12 = a3;
  v13 = a5;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_4B5ED4, v10);

  swift_bridgeObjectRelease(v6);
  swift_release(v10);
}

- (void)downloadManager:(id)a3 didCancelAssets:(id)a4
{
  id v4;
  uint64_t v7;
  uint64_t v8;
  _TtCC16MusicApplication25LibraryMenuViewControllerP33_101455BD5CE9FA82B04106C497F7C13023DownloadManagerObserver *v9;
  id v10;

  v4 = a4;
  if (a4)
  {
    v7 = sub_4E684(0, (unint64_t *)&unk_14CD4D0, MPMediaDownload_ptr);
    v4 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(v4, v7);
  }
  sub_4E684(0, (unint64_t *)&qword_14AD360, OS_dispatch_queue_ptr);
  v8 = swift_allocObject(&unk_1368D40, 24, 7);
  *(_QWORD *)(v8 + 16) = self;
  v9 = self;
  v10 = a3;
  static OS_dispatch_queue.asyncOnMainIfNeeded(_:)(sub_4B5E90, v8);

  swift_bridgeObjectRelease(v4);
  swift_release(v8);
}

@end
