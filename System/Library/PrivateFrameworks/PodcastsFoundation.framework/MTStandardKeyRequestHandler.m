@implementation MTStandardKeyRequestHandler

+ (NSString)keyRequestLicenseErrorDomain
{
  return (NSString *)(id)sub_1A93F8010();
}

- (void)loadCertificateDataWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  MTStandardKeyRequestHandler *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A920BBDC((uint64_t)sub_1A91157E8, v5);

  swift_release();
}

- (void)loadKeyDataFor:(id)a3 account:(id)a4 completion:(id)a5
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  MTStandardKeyRequestHandler *v11;

  v7 = _Block_copy(a5);
  type metadata accessor for ContentKeyRequest(0);
  v8 = sub_1A93F8310();
  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = v7;
  v10 = a4;
  v11 = self;
  sub_1A920C89C(v8, a4, (uint64_t)sub_1A920E5AC, v9);

  swift_bridgeObjectRelease();
  swift_release();
}

- (MTStandardKeyRequestHandler)init
{
  return (MTStandardKeyRequestHandler *)StandardKeyRequestHandler.init()();
}

- (MTStandardKeyRequestHandler)initWithConcurrentOperationCount:(int64_t)a3 requestEncodingType:(unint64_t)a4
{
  return (MTStandardKeyRequestHandler *)StandardKeyRequestHandler.init(concurrentOperationCount:requestEncodingType:)(a3, a4);
}

- (void).cxx_destruct
{

}

@end
