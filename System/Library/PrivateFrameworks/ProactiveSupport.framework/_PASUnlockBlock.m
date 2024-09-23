@implementation _PASUnlockBlock

- (void).cxx_destruct
{
  objc_storeStrong(&self->block, 0);
}

@end
