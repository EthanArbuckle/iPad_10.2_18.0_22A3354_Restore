@implementation UNNotification

id __52__UNNotification_Bulletin__notificationForBulletin___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if (objc_msgSend(v2, "length"))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

@end
