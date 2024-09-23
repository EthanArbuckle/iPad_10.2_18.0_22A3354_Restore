@implementation JSAStoreContentLookupRequest

- (float)priority
{
  return *(float *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__priority);
}

- (void)setPriority:(float)a3
{
  *(float *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__priority) = a3;
}

- (NSDictionary)requestOptions
{
  uint64_t v2;
  NSDictionary v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__requestOptions);
  if (v2)
  {
    swift_bridgeObjectRetain(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR___JSAStoreContentLookupRequest__requestOptions));
    v3.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSDictionary *)v3.super.isa;
}

- (void)setRequestOptions:(id)a3
{
  objc_class *v4;
  objc_class *v5;

  if (a3)
    v4 = (objc_class *)static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, (char *)&type metadata for Swift.AnyObject + 8, &protocol witness table for String);
  else
    v4 = 0;
  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest_frozen) & 1) == 0)
  {
    v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__requestOptions);
    *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__requestOptions) = v4;
    v4 = v5;
  }
  swift_bridgeObjectRelease(v4);
}

- (NSArray)itemIdentifiers
{
  uint64_t *v3;
  uint64_t v4;
  JSAStoreContentLookupRequest *v5;
  uint64_t v6;
  _QWORD *v7;
  Class isa;
  _BYTE v10[24];

  v3 = (uint64_t *)((char *)self + OBJC_IVAR___JSAStoreContentLookupRequest__itemIdentifiers);
  swift_beginAccess((char *)self + OBJC_IVAR___JSAStoreContentLookupRequest__itemIdentifiers, v10, 0, 0);
  v4 = *v3;
  v5 = self;
  v6 = swift_bridgeObjectRetain(v4);
  v7 = sub_593EC(v6);

  swift_bridgeObjectRelease(v4);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v7);
  return (NSArray *)isa;
}

- (void)setItemIdentifiers:(id)a3
{
  uint64_t v4;
  JSAStoreContentLookupRequest *v5;

  if (a3)
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, (char *)&type metadata for Swift.AnyObject + 8);
  else
    v4 = 0;
  v5 = self;
  sub_59998(v4);

}

- (JSValue)onResponse
{
  return (JSValue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR___JSAStoreContentLookupRequest__onResponse));
}

- (void)setOnResponse:(id)a3
{
  id v3;
  id v4;

  if ((*((_BYTE *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest_frozen) & 1) == 0)
  {
    v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__onResponse);
    *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__onResponse) = (Class)a3;
    v3 = a3;

  }
}

- (JSAStoreContentLookupRequest)init
{
  return (JSAStoreContentLookupRequest *)StoreContentLookupRequest.init()();
}

- (void)dealloc
{
  JSAStoreContentLookupRequest *v3;
  void *v4;
  JSAStoreContentLookupRequest *v5;
  objc_super v6;

  if (*((_BYTE *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest_frozen) == 1)
  {
    v3 = self;
  }
  else
  {
    v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__onResponse);
    *(Class *)((char *)&self->super.isa + OBJC_IVAR___JSAStoreContentLookupRequest__onResponse) = 0;
    v5 = self;

  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for StoreContentLookupRequest();
  -[JSAStoreContentLookupRequest dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___JSAStoreContentLookupRequest__requestOptions));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___JSAStoreContentLookupRequest__itemIdentifiers));

}

- (void)send
{
  JSAStoreContentLookupRequest *v2;

  v2 = self;
  sub_5A344();

}

- (void)cancel
{
  JSAStoreContentLookupRequest *v2;

  v2 = self;
  sub_5B034();

}

@end
