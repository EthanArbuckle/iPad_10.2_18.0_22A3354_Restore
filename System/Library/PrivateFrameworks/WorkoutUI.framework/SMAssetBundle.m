@implementation SMAssetBundle

- (NSString)identifier
{
  return (NSString *)sub_24A72F73C(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE887A8]);
}

- (NSString)workoutIdentifier
{
  return (NSString *)sub_24A72F73C(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE887C8]);
}

- (NSString)downloadingDeviceIdentifier
{
  return (NSString *)sub_24A72F73C(self, (uint64_t)a2, (void (*)(void))MEMORY[0x24BE887D0]);
}

- (int64_t)loadStatus
{
  SMAssetBundle *v2;
  char v3;
  char v4;
  char v5;

  v2 = self;
  v3 = sub_24A778A70();
  v5 = v4;

  if ((v5 & 1) != 0)
    return qword_24A787060[v3];
  else
    return 6;
}

- (int64_t)reason
{
  SMAssetBundle *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_24A72F89C();

  return v3;
}

- (SMAssetBundle)init
{
  SMAssetBundle *result;

  result = (SMAssetBundle *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR___SMAssetBundle_assetBundle;
  v3 = sub_24A778AB8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
