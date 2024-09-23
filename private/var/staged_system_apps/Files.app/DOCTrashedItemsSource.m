@implementation DOCTrashedItemsSource

- (NSString)displayName
{
  return (NSString *)sub_10003C32C(self, (uint64_t)a2, (void (*)(void))sub_1000ADF2C);
}

- (void)setDisplayName:(id)a3
{
  sub_1002AD184(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))type metadata accessor for DOCTrashedItemsSource);
}

- (void)setProviderName:(id)a3
{
  sub_1002AD184(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t))type metadata accessor for DOCTrashedItemsSource);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.providerDomain[OBJC_IVAR____TtC5Files21DOCTrashedItemsSource____lazy_storage____displayName]);
}

@end
