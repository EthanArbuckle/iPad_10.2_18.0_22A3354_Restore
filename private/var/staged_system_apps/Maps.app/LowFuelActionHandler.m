@implementation LowFuelActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = objc_opt_class(LowFuelAction);
  if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0)
    +[SearchSession performSearchForEngineType:withObserver:](SearchSession, "performSearchForEngineType:withObserver:", objc_msgSend(v5, "engineType"), 0);

}

@end
