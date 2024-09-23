@implementation Ace3UpdateController

- (id)createUpdaterInstanceFor:(unsigned int)a3 helper:(id)a4 options:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  Ace3UpdaterInstance *v9;

  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = a4;
  v9 = -[UARPSoCUpdaterInstance initWithLogicUnitNumber:helper:options:]([Ace3UpdaterInstance alloc], "initWithLogicUnitNumber:helper:options:", v6, v8, v7);

  return v9;
}

@end
