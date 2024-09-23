@implementation DOCLegacyWebDAVProviderSource

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _TtC5Files29DOCLegacyWebDAVProviderSource *v8;
  objc_super v9;
  _QWORD aBlock[5];
  uint64_t v11;

  v3 = *(void **)&self->super.DOCDocumentSource_opaque[OBJC_IVAR____TtC5Files29DOCLegacyWebDAVProviderSource_rootItemCollection];
  v4 = swift_allocObject(&unk_1005E79F0, 24, 7);
  *(_QWORD *)(v4 + 16) = v3;
  aBlock[4] = sub_1003EA670;
  v11 = v4;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10004A82C;
  aBlock[3] = &unk_1005E7A08;
  v5 = _Block_copy(aBlock);
  v6 = v11;
  v7 = v3;
  v8 = self;
  swift_release(v6);
  DOCRunInMainThread(v5);
  _Block_release(v5);

  v9.receiver = v8;
  v9.super_class = (Class)type metadata accessor for DOCLegacyWebDAVProviderSource();
  -[DOCLegacyWebDAVProviderSource dealloc](&v9, "dealloc");
}

- (void).cxx_destruct
{

}

- (void)dataForCollectionShouldBeReloaded:(id)a3
{
  id v4;
  _TtC5Files29DOCLegacyWebDAVProviderSource *v5;

  v4 = a3;
  v5 = self;
  sub_1003EA414("WebDAV collection was reloaded. Setting is ejectable to true");

}

- (void)collection:(id)a3 didPerformBatchUpdateWithReplayBlock:(id)a4
{
  void *v6;
  id v7;
  _TtC5Files29DOCLegacyWebDAVProviderSource *v8;

  v6 = _Block_copy(a4);
  v7 = a3;
  v8 = self;
  sub_1003EA414("WebDAV collection was updated. Setting is ejectable to true");
  _Block_release(v6);

}

- (void)collection:(id)a3 didEncounterError:(id)a4
{
  id v6;
  _TtC5Files29DOCLegacyWebDAVProviderSource *v7;
  id v8;

  v6 = a3;
  v8 = a4;
  v7 = self;
  sub_1003EA540((uint64_t)v8);

}

@end
