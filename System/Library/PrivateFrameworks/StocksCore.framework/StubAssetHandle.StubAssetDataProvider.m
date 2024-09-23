@implementation StubAssetHandle.StubAssetDataProvider

- (NSString)filePath
{
  void *v2;

  if (*(_QWORD *)&self->filePath[8])
  {
    sub_1ABF2FF5C();
    v2 = (void *)sub_1ABF31780();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (NSData)data
{
  unint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = *(_QWORD *)&self->data[8];
  if (v2 >> 60 == 15)
  {
    v3 = 0;
  }
  else
  {
    v4 = *(_QWORD *)self->data;
    sub_1ABD0F474(v4, v2);
    v3 = (void *)sub_1ABF30640();
    sub_1ABD0D868(v4, v2);
  }
  return (NSData *)v3;
}

- (BOOL)isRawFileConsumable
{
  return 1;
}

@end
