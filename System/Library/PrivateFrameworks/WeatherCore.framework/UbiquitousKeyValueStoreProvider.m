@implementation UbiquitousKeyValueStoreProvider

- (void)migrateToEncryptedStoreIfNeededAndHandleLocationsChangedExternally:(id)a3
{
  sub_1B01B0CF4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1B01B0700);
}

- (void)handleLocationsChangedExternally:(id)a3
{
  sub_1B01B0CF4((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(char *))sub_1B01B0A74);
}

@end
