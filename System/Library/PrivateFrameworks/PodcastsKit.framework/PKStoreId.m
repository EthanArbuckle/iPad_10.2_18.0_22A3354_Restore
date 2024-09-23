@implementation PKStoreId

- (PKStoreId)initWithString:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_22FB37B18();
  return (PKStoreId *)StoreId.init(value:)(v3, v4);
}

- (PKStoreId)initWithInteger:(int64_t)a3
{
  return (PKStoreId *)StoreId.init(value:)(a3);
}

- (PKStoreId)initWithNumber:(id)a3
{
  return (PKStoreId *)StoreId.init(value:)(a3);
}

- (NSNumber)numberValue
{
  PKStoreId *v2;
  void *v3;
  void *v4;

  v2 = self;
  sub_22FB25514();
  v4 = v3;

  return (NSNumber *)v4;
}

- (NSString)stringValue
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_22FB37B0C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)longValue
{
  PKStoreId *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_22FB25880();
  v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return byte_255E3C220;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  byte_255E3C220 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PKStoreId *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = self;
  v6 = (void *)sub_22FB37B0C();
  v7 = (id)sub_22FB37B0C();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);

}

- (PKStoreId)initWithCoder:(id)a3
{
  return (PKStoreId *)StoreId.init(coder:)(a3);
}

- (PKStoreId)init
{
  PKStoreId *result;

  result = (PKStoreId *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
