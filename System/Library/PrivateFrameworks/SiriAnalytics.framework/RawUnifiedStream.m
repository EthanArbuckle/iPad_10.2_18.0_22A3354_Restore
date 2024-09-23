@implementation RawUnifiedStream

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithPrivateStreamIdentifier:(id)a3 storeConfig:(id)a4 eventDataClass:(Class)a5
{
  id v6;

  sub_1A03077B4();
  v6 = a4;
  RawUnifiedStream.init(privateStreamIdentifier:storeConfig:eventDataClass:)();
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithStreamIdentifier:(id)a3 storeConfig:(id)a4
{
  id v5;

  sub_1A03077B4();
  v5 = a4;
  RawUnifiedStream.init(streamIdentifier:storeConfig:)();
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithPublicStream:(int64_t)a3
{
  RawUnifiedStream.init(publicStream:)();
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithRestrictedStreamIdentifier:(id)a3
{
  sub_1A03077B4();
  RawUnifiedStream.init(restrictedStreamIdentifier:)();
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithRestrictedStreamIdentifier:(id)a3 protectionClass:(unint64_t)a4
{
  sub_1A03077B4();
  RawUnifiedStream.init(restrictedStreamIdentifier:protectionClass:)();
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithRestrictedStreamIdentifier:(id)a3 storeConfig:(id)a4
{
  id v5;

  sub_1A03077B4();
  v5 = a4;
  RawUnifiedStream.init(restrictedStreamIdentifier:storeConfig:)();
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithRestrictedStreamIdentifier:(id)a3 storeConfig:(id)a4 eventDataClass:(Class)a5
{
  id v6;

  sub_1A03077B4();
  v6 = a4;
  RawUnifiedStream.init(restrictedStreamIdentifier:storeConfig:eventDataClass:)();
}

- (_TtC13SiriAnalytics16RawUnifiedStream)initWithPrivateStreamIdentifier:(id)a3 storeConfig:(id)a4
{
  id v5;

  sub_1A03077B4();
  v5 = a4;
  RawUnifiedStream.init(privateStreamIdentifier:storeConfig:)();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC13SiriAnalytics16RawUnifiedStream____lazy_storage___source));
  sub_1A0274C94(*(void **)((char *)&self->super.super.isa
                         + OBJC_IVAR____TtC13SiriAnalytics16RawUnifiedStream____lazy_storage___pruner));
}

@end
