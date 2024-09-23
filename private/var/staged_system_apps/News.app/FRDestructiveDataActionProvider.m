@implementation FRDestructiveDataActionProvider

- (FRDestructiveDataActionProvider)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FRDestructiveDataActionProvider;
  return -[FRDestructiveDataActionProvider init](&v3, "init");
}

- (void)consumeNonDestructiveActionsSyncWithBlock:(id)a3
{
  (*((void (**)(id, void *, Block_layout *))a3 + 2))(a3, &__NSArray0__struct, &stru_1000DC1F0);
}

- (void)consumeActionsUpToDestructiveActionSyncWithBlock:(id)a3
{
  (*((void (**)(id, uint64_t, Block_layout *))a3 + 2))(a3, 1, &stru_1000DC210);
}

@end
