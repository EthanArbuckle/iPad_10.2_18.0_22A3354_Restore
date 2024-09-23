@implementation MTContentKeyRequest

- (id)initFrom:(id)a3 adamId:(id)a4 requestType:(int64_t)a5 offlineRequest:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v9;
  uint64_t v10;

  v6 = a6;
  v9 = sub_1A93F8040();
  return ContentKeyRequest.init(from:adamId:requestType:offlineRequest:)(a3, v9, v10, a5, v6);
}

- (NSString)keyIdentifier
{
  return (NSString *)sub_1A91AFA40();
}

- (NSString)adamId
{
  return (NSString *)sub_1A91AFA40();
}

- (NSNumber)secureInvalidationDsid
{
  return (NSNumber *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___MTContentKeyRequest_secureInvalidationDsid));
}

- (NSData)requestData
{
  return (NSData *)sub_1A9278268((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___MTContentKeyRequest_requestData);
}

- (void)setRequestData:(id)a3
{
  sub_1A927835C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR___MTContentKeyRequest_requestData);
}

- (MTContentKeyRequest)initWithKeyIdentifier:(id)a3 adamId:(id)a4 requestType:(int64_t)a5 offlineRequest:(BOOL)a6 secureInvalidationDsid:(id)a7
{
  _BOOL4 v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  MTContentKeyRequest *v17;
  MTContentKeyRequest *v18;

  v8 = a6;
  v10 = sub_1A93F8040();
  v12 = v11;
  v13 = sub_1A93F8040();
  v15 = v14;
  v16 = a7;
  sub_1A9278A30(v10, v12, v13, v15, a5, v8, a7);
  v18 = v17;

  return v18;
}

- (id)copyWith:(int64_t)a3
{
  MTContentKeyRequest *v4;
  void *v5;

  v4 = self;
  v5 = (void *)sub_1A9277CA0(a3);

  return v5;
}

- (MTContentKeyRequest)init
{
  MTContentKeyRequest *result;

  result = (MTContentKeyRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_1A9069F9C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___MTContentKeyRequest_requestData), *(_QWORD *)&self->keyIdentifier[OBJC_IVAR___MTContentKeyRequest_requestData]);
  v3 = (char *)self + OBJC_IVAR___MTContentKeyRequest_requestDate;
  v4 = sub_1A93F738C();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
