@implementation NAFConnectionAvailabilityObserver

- (void)networkAvailability:(id)a3 isAvailable:(BOOL)a4
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_0);
}

void __69__NAFConnectionAvailabilityObserver_networkAvailability_isAvailable___block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("AFNetworkAvailabilityDidChangeNotification"), 0);

}

@end
