@implementation ACAccount(StocksCore)

- (uint64_t)sc_isEnabledForStocksDataclass
{
  return objc_msgSend(a1, "isEnabledForDataclass:", *MEMORY[0x1E0C8EF20]);
}

@end
