@implementation VRXTurnBasedInstrumentationEvent

- (BOOL)requiresNewTurn
{
  return 0;
}

- (void)emitWithTurnIdentifier:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("You must override %@ in a subclass"), v5);

}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
  void *v4;
  uint64_t v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  NSStringFromSelector(a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("You must override %@ in a subclass"), v6);

}

@end
