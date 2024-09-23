@implementation ContextRequestHandler

- (void)updateDescendantsOfContext:(id)a3 completion:(id)a4
{
  void *v6;
  id v7;
  _TtC25PodcastsClassKitExtension21ContextRequestHandler *v8;

  v6 = _Block_copy(a4);
  _Block_copy(v6);
  v7 = a3;
  v8 = self;
  sub_10000B518(v7, (void (**)(_QWORD, _QWORD))v6);
  _Block_release(v6);
  _Block_release(v6);

}

- (_TtC25PodcastsClassKitExtension21ContextRequestHandler)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ContextRequestHandler();
  return -[ContextRequestHandler init](&v3, "init");
}

@end
