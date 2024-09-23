@implementation DOCFileSystemCollectionManager

- (void)applicationDidEnterBackgroundWithSender:(id)a3
{
  sub_10032E368((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100337B50);
}

- (void)applicationWillEnterForegroundWithSender:(id)a3
{
  sub_10032E368((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_100337DB8);
}

@end
