@implementation HandleDistributedNotification

void ___HandleDistributedNotification_block_invoke(_QWORD *a1)
{
  char isKindOfClass;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  +[VISAXNotificationHandler _safelyGetObserverForIdentifier:](VISAXNotificationHandler, "_safelyGetObserverForIdentifier:", a1[4]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = a1[5];
  v4 = a1[6];
  v5 = a1[7];
  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v6, "_handleForwardDistributedNotificationWithName:object:userInfo:", v3, v4, v5);
  else
    objc_msgSend(v6, "_handleNotificationWithName:object:userInfo:", v3, v4, v5);

}

@end
