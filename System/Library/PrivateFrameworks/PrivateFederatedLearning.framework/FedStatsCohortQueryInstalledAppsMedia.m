@implementation FedStatsCohortQueryInstalledAppsMedia

- (id)cohortKeyForParameters:(id)a3 possibleError:(id *)a4
{
  __CFString *v5;

  if (-[FedStatsCohortQueryInstalledApps numOfMediaApps](self, "numOfMediaApps", a3, a4) <= 9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), -[FedStatsCohortQueryInstalledApps numOfMediaApps](self, "numOfMediaApps"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("at_least_10");
  }
  return v5;
}

@end
