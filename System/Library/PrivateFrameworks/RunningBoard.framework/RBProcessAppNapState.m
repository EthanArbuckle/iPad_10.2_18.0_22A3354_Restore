@implementation RBProcessAppNapState

- (RBProcessAppNapState)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RBProcessAppNapState;
  return -[RBProcessAppNapState init](&v3, sel_init);
}

- (id)_initWithProcessAppNapState:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RBProcessAppNapState;
  return -[RBProcessAppNapState init](&v4, sel_init, a3);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)RBProcessAppNapState;
  -[RBProcessAppNapState dealloc](&v2, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  return 1;
}

- (unsigned)encodedState
{
  return 0;
}

- (id)description
{
  return &stru_24DD48378;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[RBProcessAppNapState _initWithProcessAppNapState:](+[RBMutableProcessAppNapState allocWithZone:](RBMutableProcessAppNapState, "allocWithZone:", a3), "_initWithProcessAppNapState:", self);
}

@end
