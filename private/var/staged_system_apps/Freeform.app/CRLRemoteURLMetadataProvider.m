@implementation CRLRemoteURLMetadataProvider

- (void).cxx_destruct
{
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform28CRLRemoteURLMetadataProvider_navigationDidFinishContinuation, &qword_101409858);
  swift_release(*(Class *)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC8Freeform28CRLRemoteURLMetadataProvider_imageProviderTask));

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6;
  id v7;
  _TtC8Freeform28CRLRemoteURLMetadataProvider *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100BF84BC(a4);

}

@end
