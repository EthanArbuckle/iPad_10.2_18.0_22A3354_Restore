@implementation SKADatabaseReceivedInvitation(IncomingRatchet)

- (void)incomingRatchet
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2188DF000, a2, OS_LOG_TYPE_ERROR, "Failed to create incomingRatchet due to invalid data. Error: %@", (uint8_t *)&v2, 0xCu);
}

@end
