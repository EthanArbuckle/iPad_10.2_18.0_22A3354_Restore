@implementation ForYouConfigRecord.HeadlineMetadata

- (NSString)storyType
{
  return (NSString *)sub_1ABD01DB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata_storyType);
}

- (NSString)title
{
  return (NSString *)sub_1ABD01DB0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata_title);
}

- (void).cxx_destruct
{
  sub_1ABCFC3BC((uint64_t)self+ OBJC_IVAR____TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata_displayDate, (uint64_t (*)(_QWORD))sub_1ABD226F0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSDate)displayDate
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t (*v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  sub_1ABD226F0();
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ABCFC790((uint64_t)self+ OBJC_IVAR____TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata_displayDate, (uint64_t)v5, v6);
  v7 = sub_1ABF30760();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1ABF306D0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (_TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata)init
{
  _TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata *result;

  result = (_TtCV10StocksCore18ForYouConfigRecordP33_FB30AEA7B56282916E4430A3993C597516HeadlineMetadata *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
