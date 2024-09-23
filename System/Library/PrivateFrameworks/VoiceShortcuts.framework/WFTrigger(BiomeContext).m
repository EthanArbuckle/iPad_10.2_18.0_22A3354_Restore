@implementation WFTrigger(BiomeContext)

- (uint64_t)publisherWithScheduler:()BiomeContext
{
  return 0;
}

- (uint64_t)hasRemotePublisher
{
  return 0;
}

- (uint64_t)remotePublisherWithScheduler:()BiomeContext
{
  return 0;
}

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  void *v5;
  uint64_t v6;
  void (**v7)(id, _QWORD);

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = a5;
  objc_msgSend(v5, "raise:format:", v6, CFSTR("-[WFTrigger shouldFireInResponseToEvent:] must be overridden"));
  v7[2](v7, 0);

}

+ (uint64_t)unregisterContextSyncClient
{
  return 0;
}

@end
