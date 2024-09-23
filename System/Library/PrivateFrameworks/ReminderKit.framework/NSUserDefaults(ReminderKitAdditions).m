@implementation NSUserDefaults(ReminderKitAdditions)

- (id)objectIDForKey:()ReminderKitAdditions
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "stringForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    +[REMObjectID objectIDWithURL:](REMObjectID, "objectIDWithURL:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)setObjectID:()ReminderKitAdditions forKey:
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "urlRepresentation");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v7, v6);

}

@end
