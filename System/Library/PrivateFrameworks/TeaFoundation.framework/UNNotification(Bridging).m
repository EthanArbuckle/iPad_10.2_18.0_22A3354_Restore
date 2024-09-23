@implementation UNNotification(Bridging)

+ (id)notificationWithRequest:()Bridging
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CEC6F8];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v3, "notificationWithRequest:date:sourceIdentifier:intentIdentifiers:", v4, v5, &stru_1E2CF1930, MEMORY[0x1E0C9AA60]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
