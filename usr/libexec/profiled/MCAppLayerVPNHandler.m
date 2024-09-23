@implementation MCAppLayerVPNHandler

- (id)installService:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  unsigned __int8 v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  void *v38;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "VPNUUID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "SafariDomains"));
  v9 = objc_msgSend(v6, "setPerAppUUID:andSafariDomains:", v7, v8);

  if ((v9 & 1) == 0)
  {
    v23 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Could not add Safari App VPN rules", buf, 2u);
    }
    v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "displayName"));
    v38 = v26;
    v27 = CFSTR("ERROR_VPN_COULD_NOT_INSTALL_SAFARI_DOMAIN");
    goto LABEL_34;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "SMBDomains"));
  v11 = objc_msgSend(v6, "setSMBDomains:", v10);

  if ((v11 & 1) == 0)
  {
    v28 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Could not set per-app VPN SMBDomains", buf, 2u);
    }
    v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "displayName"));
    v38 = v26;
    v27 = CFSTR("ERROR_VPN_COULD_NOT_INSTALL_SMB_DOMAIN");
    goto LABEL_34;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "mailDomains"));
  v13 = objc_msgSend(v6, "setMailDomains:", v12);

  if ((v13 & 1) == 0)
  {
    v29 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Could not set per-app VPN mail domains", buf, 2u);
    }
    v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "displayName"));
    v38 = v26;
    v27 = CFSTR("ERROR_VPN_COULD_NOT_INSTALL_MAIL_DOMAIN");
    goto LABEL_34;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "calendarDomains"));
  v15 = objc_msgSend(v6, "setCalendarDomains:", v14);

  if ((v15 & 1) == 0)
  {
    v30 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "Could not set per-app VPN calendar domains", buf, 2u);
    }
    v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "displayName"));
    v38 = v26;
    v27 = CFSTR("ERROR_VPN_COULD_NOT_INSTALL_CALENDAR_DOMAIN");
    goto LABEL_34;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contactsDomains"));
  v17 = objc_msgSend(v6, "setContactsDomains:", v16);

  if ((v17 & 1) == 0)
  {
    v31 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Could not set per-app VPN contacts domains", buf, 2u);
    }
    v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "displayName"));
    v38 = v26;
    v27 = CFSTR("ERROR_VPN_COULD_NOT_INSTALL_CONTACTS_DOMAIN");
    goto LABEL_34;
  }
  if ((objc_msgSend(v6, "setRestrictDomains:", objc_msgSend(v5, "restrictDomains")) & 1) == 0)
  {
    v32 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Could not set per-app VPN domain restrictions", buf, 2u);
    }
    v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "displayName"));
    v38 = v26;
    v27 = CFSTR("ERROR_VPN_COULD_NOT_INSTALL_RESTRICTIONS_DOMAIN");
    goto LABEL_34;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "associatedDomains"));
  v19 = objc_msgSend(v6, "setAssociatedDomains:", v18);

  if ((v19 & 1) == 0)
  {
    v33 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Could not set per-app VPN associated domains", buf, 2u);
    }
    v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "displayName"));
    v38 = v26;
    v27 = CFSTR("ERROR_VPN_COULD_NOT_INSTALL_ASSOCIATED_DOMAIN");
    goto LABEL_34;
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "excludedDomains"));
  v21 = objc_msgSend(v6, "setExcludedDomains:", v20);

  if ((v21 & 1) == 0)
  {
    v34 = _MCLogObjects[0];
    if (os_log_type_enabled(_MCLogObjects[0], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Could not set per-app VPN excluded domains", buf, 2u);
    }
    v24 = MCVPNErrorDomain;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MCNewPayloadHandler payload](self, "payload"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "displayName"));
    v38 = v26;
    v27 = CFSTR("ERROR_VPN_COULD_NOT_INSTALL_EXCLUDED_DOMAIN");
LABEL_34:
    v35 = MCErrorArray(v27);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSError MCErrorWithDomain:code:descriptionArray:errorType:](NSError, "MCErrorWithDomain:code:descriptionArray:errorType:", v24, 15000, v36, MCErrorTypeFatal, v38, 0));

    goto LABEL_35;
  }
  v22 = 0;
LABEL_35:

  return v22;
}

@end
