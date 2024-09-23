@implementation ThumbnailProvider

- (void)provideThumbnailForFileRequest:(id)a3 completionHandler:(id)a4
{
  void *v6;
  uint64_t v7;
  id v8;
  _TtC18ThumbnailExtension17ThumbnailProvider *v9;

  v6 = _Block_copy(a4);
  v7 = sub_10000398C((uint64_t)&unk_100004260, 24);
  *(_QWORD *)(v7 + 16) = v6;
  v8 = a3;
  v9 = self;
  sub_1000030C4(v8, (uint64_t)sub_100003518, v7);

  swift_release(v7);
}

- (_TtC18ThumbnailExtension17ThumbnailProvider)init
{
  return (_TtC18ThumbnailExtension17ThumbnailProvider *)sub_100003454();
}

@end
