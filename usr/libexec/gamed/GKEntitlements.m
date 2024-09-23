@implementation GKEntitlements

- (id)description
{
  id v3;
  void *v4;
  unint64_t entitlements;
  const char *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  const char *v23;
  const char *v24;
  void *v25;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)GKEntitlements;
  v3 = -[GKEntitlements description](&v27, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  entitlements = self->_entitlements;
  v6 = "Account";
  if ((entitlements & 1) == 0)
    v6 = "";
  v7 = "Profile";
  if ((entitlements & 2) == 0)
    v7 = "";
  v8 = "Friends";
  if ((entitlements & 4) == 0)
    v8 = "";
  v9 = "Games";
  if ((entitlements & 0x10) == 0)
    v9 = "";
  v10 = "GameStats";
  if ((entitlements & 0x20) == 0)
    v10 = "";
  v11 = "Challenges";
  if ((entitlements & 0x40) == 0)
    v11 = "";
  v12 = "Multiplayer";
  if ((entitlements & 0x80) == 0)
    v12 = "";
  v13 = "TurnBasedMultiplayer";
  if ((entitlements & 0x100) == 0)
    v13 = "";
  v14 = "Media";
  if ((entitlements & 0x400) == 0)
    v14 = "";
  v15 = "BypassAuthentication";
  if ((entitlements & (unint64_t)&_mh_execute_header) == 0)
    v15 = "";
  v16 = "AccountPrivate";
  if ((entitlements & 0x10000) == 0)
    v16 = "";
  v17 = "ProfilePrivate";
  if ((entitlements & 0x20000) == 0)
    v17 = "";
  v18 = "FriendsPrivate";
  if ((entitlements & 0x40000) == 0)
    v18 = "";
  v19 = "GamesPrivate";
  if ((entitlements & 0x100000) == 0)
    v19 = "";
  v20 = "GameStatsPrivate";
  if ((entitlements & 0x200000) == 0)
    v20 = "";
  v21 = "ChallengesPrivate";
  if ((entitlements & 0x400000) == 0)
    v21 = "";
  v22 = "MultiplayerPrivate";
  if ((entitlements & 0x800000) == 0)
    v22 = "";
  v23 = "TurnBasedMultiplayerPrivate";
  if ((entitlements & 0x1000000) == 0)
    v23 = "";
  if ((entitlements & 0x4000000) != 0)
    v24 = "MediaPrivate";
  else
    v24 = "";
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(" -- (%s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s %s)"), v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20,
                    v21,
                    v22,
                    v23,
                    v24));

  return v25;
}

- (GKEntitlements)initWithConnection:(id)a3
{
  id v4;
  GKEntitlements *v5;
  GKEntitlements *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  _BOOL8 v12;
  id v13;
  NSObject *v14;
  _BOOL8 v15;
  id v16;
  void *v17;
  _BOOL8 v18;
  NSObject *v19;
  id v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)GKEntitlements;
  v5 = -[GKEntitlements init](&v22, "init");
  v6 = v5;
  if (!v5)
    goto LABEL_25;
  v7 = -[GKEntitlements _valuesForEntitlement:forConnection:](v5, "_valuesForEntitlement:forConnection:", CFSTR("com.apple.private.game-center"), v4);
  v6->_entitlements = -[GKEntitlements _valuesForEntitlement:forConnection:](v6, "_valuesForEntitlement:forConnection:", CFSTR("com.apple.developer.game-center"), v4) | (v7 << 16) | v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.game-center.bypass-authentication")));
  if ((objc_msgSend(v8, "BOOLValue") & 1) != 0
    || -[GKEntitlements _shouldBypasAuthenticationForConnection:](v6, "_shouldBypasAuthenticationForConnection:", v4))
  {
    v6->_entitlements |= (unint64_t)&_mh_execute_header;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.accounts.appleaccount.fullaccess")));
  if (objc_msgSend(v9, "BOOLValue"))
  {

LABEL_8:
    v6->_entitlements |= 0x200000000uLL;
    goto LABEL_9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.game-center.credential")));
  v11 = objc_msgSend(v10, "BOOLValue");

  if (v11)
    goto LABEL_8;
LABEL_9:
  if (!-[GKEntitlements hasEntitlements:](v6, "hasEntitlements:", 1527))
  {
    v12 = -[GKEntitlements hasAnyPrivateEntitlement](v6, "hasAnyPrivateEntitlement");
    if (!v12)
    {
      if (!os_log_GKGeneral)
        v13 = (id)GKOSLoggers(v12);
      v14 = os_log_GKDeveloper;
      v15 = os_log_type_enabled(os_log_GKDeveloper, OS_LOG_TYPE_ERROR);
      if (v15)
        sub_1000A0FF4(v14);
      if (!os_log_GKGeneral)
        v16 = (id)GKOSLoggers(v15);
      v17 = (void *)os_log_GKError;
      v18 = os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR);
      if (v18)
        sub_1000A0F48(v17, (uint64_t)v4);
      v19 = os_log_GKGeneral;
      if (!os_log_GKGeneral)
      {
        v20 = (id)GKOSLoggers(v18);
        v19 = os_log_GKGeneral;
      }
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_1000A0E9C(v19, (uint64_t)v4);
    }
    v6->_entitlements |= 0x5F7uLL;
  }

LABEL_25:
  return v6;
}

- (unint64_t)_valuesForEntitlement:(id)a3 forConnection:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "valueForEntitlement:", a3));
  if ((objc_opt_respondsToSelector(v5, "countByEnumeratingWithState:objects:count:") & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v6);
          v9 |= -[GKEntitlements _entitlementForName:](self, "_entitlementForName:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }
    else
    {
      v9 = 0;
    }

  }
  else if ((objc_opt_respondsToSelector(v5, "isEqualToString:") & 1) != 0)
  {
    v9 = -[GKEntitlements _entitlementForName:](self, "_entitlementForName:", v5);
  }
  else if (objc_msgSend(v5, "BOOLValue"))
  {
    v9 = 1527;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)_entitlementForName:(id)a3
{
  uint64_t v3;
  id v4;
  const void *Value;

  v3 = qword_100317E58;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_100317E58, &stru_1002C0A20);
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_100317E50, v4);

  return (unint64_t)Value;
}

- (BOOL)hasAnyPrivateEntitlement
{
  return (self->_entitlements & 0xFFFFFFFFFFFF0000) != 0;
}

- (BOOL)hasEntitlements:(unint64_t)a3
{
  return (a3 & ~self->_entitlements) == 0;
}

- (BOOL)hasAnyEntitlement
{
  return self->_entitlements != 0;
}

- (BOOL)_shouldBypasAuthenticationForConnection:(id)a3
{
  return 0;
}

- (id)grandfatheredEntitlementsForSpoofedApps
{
  *((_QWORD *)self + 1) |= 0x105F705F7uLL;
  return self;
}

@end
