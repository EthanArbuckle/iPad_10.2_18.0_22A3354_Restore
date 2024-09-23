@implementation TPSSearchResultItem

- (NSString)documentIdentifier
{
  return (NSString *)sub_19A95F504();
}

- (void)setDocumentIdentifier:(id)a3
{
  sub_19A95F580((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
}

- (NSString)collectionIdentifier
{
  return (NSString *)sub_19A95F504();
}

- (void)setCollectionIdentifier:(id)a3
{
  sub_19A95F580((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSSearchResultItem_collectionIdentifier);
}

- (NSString)correlationIdentifier
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSSearchResultItem_correlationIdentifier);
}

- (void)setCorrelationIdentifier:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSSearchResultItem_correlationIdentifier);
}

- (NSString)contentType
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSSearchResultItem_contentType);
}

- (void)setContentType:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSSearchResultItem_contentType);
}

- (NSString)title
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSSearchResultItem_title);
}

- (void)setTitle:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSSearchResultItem_title);
}

- (NSString)body
{
  return (NSString *)sub_19A95A0E4((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TPSSearchResultItem_body);
}

- (void)setBody:(id)a3
{
  sub_19A95A170((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___TPSSearchResultItem_body);
}

- (double)relevance
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR___TPSSearchResultItem_relevance);
  swift_beginAccess();
  return *v2;
}

- (void)setRelevance:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR___TPSSearchResultItem_relevance);
  swift_beginAccess();
  *v4 = a3;
}

- (TPSSearchResultItem)initWithIdentifier:(id)a3 collectionIdentifier:(id)a4
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  objc_super v18;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = sub_19A990D58();
  v8 = v7;
  v9 = sub_19A990D58();
  v10 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResultItem_correlationIdentifier);
  *v10 = 0;
  v10[1] = 0;
  v11 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResultItem_contentType);
  *v11 = 0;
  v11[1] = 0;
  v12 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResultItem_title);
  *v12 = 0;
  v12[1] = 0;
  v13 = (Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResultItem_body);
  *v13 = 0;
  v13[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSSearchResultItem_relevance) = (Class)0x3FF0000000000000;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___TPSSearchResultItem_documentIdentifier);
  *v14 = v6;
  v14[1] = v8;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR___TPSSearchResultItem_collectionIdentifier);
  *v15 = v9;
  v15[1] = v16;
  v18.receiver = self;
  v18.super_class = ObjectType;
  return -[TPSSearchResultItem init](&v18, sel_init);
}

- (TPSSearchResultItem)init
{
  TPSSearchResultItem *result;

  result = (TPSSearchResultItem *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TPSSearchResultItem *v5;

  v4 = a3;
  v5 = self;
  SearchResult.Item.encode(with:)((NSCoder)v4);

}

- (TPSSearchResultItem)initWithCoder:(id)a3
{
  return (TPSSearchResultItem *)SearchResult.Item.init(coder:)(a3);
}

- (NSString)description
{
  return (NSString *)sub_19A962970(self, (uint64_t)a2, (void (*)(void))SearchResult.Item.description.getter);
}

@end
