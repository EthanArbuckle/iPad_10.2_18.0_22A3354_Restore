@implementation GKContactsIntegrationEligibilityChecker

- (BOOL)isEligibleAllowingIneligibility:(unint64_t)a3 usingSettings:(id)a4 localPlayerInternal:(id)a5 isConnectionManagerReady:(BOOL)a6 withContext:(id)a7
{
  _BOOL8 v7;
  NSObject *v12;
  id v13;
  id v14;
  id v15;

  v7 = a6;
  v12 = os_log_GKContacts;
  v13 = a7;
  v14 = a5;
  v15 = a4;
  LOBYTE(v7) = -[GKContactsIntegrationEligibilityChecker isEligibleAllowingIneligibility:usingSettings:localPlayerInternal:isConnectionManagerReady:loggingEnabled:withContext:](self, "isEligibleAllowingIneligibility:usingSettings:localPlayerInternal:isConnectionManagerReady:loggingEnabled:withContext:", a3, v15, v14, v7, os_log_is_debug_enabled(v12), v13);

  return v7;
}

- (BOOL)isEligibleAllowingIneligibility:(unint64_t)a3 usingSettings:(id)a4 localPlayerInternal:(id)a5 isConnectionManagerReady:(BOOL)a6 loggingEnabled:(BOOL)a7 withContext:(id)a8
{
  return (-[GKContactsIntegrationEligibilityChecker currentIneligibilityUsingSettings:localPlayerInternal:isConnectionManagerReady:loggingEnabled:withContext:](self, "currentIneligibilityUsingSettings:localPlayerInternal:isConnectionManagerReady:loggingEnabled:withContext:", a4, a5, a6, a7, a8) | a3) == a3;
}

- (unint64_t)currentIneligibilityUsingSettings:(id)a3 localPlayerInternal:(id)a4 isConnectionManagerReady:(BOOL)a5 loggingEnabled:(BOOL)a6 withContext:(id)a7
{
  _BOOL4 v8;
  id v11;
  id v12;
  id v13;
  void *v14;
  unint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;

  v8 = a6;
  v11 = a3;
  v12 = a4;
  v13 = a7;
  if (v8)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString string](NSMutableString, "string"));
    if (v11)
    {
LABEL_3:
      v15 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    v14 = 0;
    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(v14, "appendString:", CFSTR("MissingSettings, "));
  v15 = 1;
LABEL_6:
  if ((objc_msgSend(v11, "allowUpdates") & 1) == 0)
  {
    objc_msgSend(v14, "appendString:", CFSTR("NotAllowedInSettings, "));
    v15 |= 0x10uLL;
  }
  if (v12)
  {
    if ((objc_msgSend(v12, "hasAcknowledgedLatestGDPR") & 1) != 0)
      goto LABEL_13;
    v16 = CFSTR("HasNotAcceptedGDPR, ");
    v17 = 32;
  }
  else
  {
    v16 = CFSTR("NoPrimaryPlayer, ");
    v17 = 2;
  }
  objc_msgSend(v14, "appendString:", v16);
  v15 |= v17;
LABEL_13:
  if (!a5)
  {
    objc_msgSend(v14, "appendString:", CFSTR("IDSMissingAccount, "));
    v15 |= 4uLL;
  }
  if ((objc_msgSend(v11, "allowUpdatesWithoutFriends") & 1) == 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[GKFriendListEntryCacheObject _gkFetchRequest](GKFriendListEntryCacheObject, "_gkFetchRequest"));
    v19 = objc_msgSend(v13, "_gkCountObjectsFromRequest:", v18);

    if (!v19)
    {
      objc_msgSend(v14, "appendString:", CFSTR("NoFriends, "));
      v15 |= 8uLL;
    }
  }
  v20 = objc_msgSend(v14, "length");
  if (v20)
  {
    if (!os_log_GKGeneral)
      v21 = (id)GKOSLoggers(v20);
    v22 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG))
      sub_100133F88((uint64_t)v14, v22);
  }

  return v15;
}

@end
