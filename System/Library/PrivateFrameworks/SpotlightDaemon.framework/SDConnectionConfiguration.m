@implementation SDConnectionConfiguration

- (NSString)bundleID
{
  return self->_bundleID;
}

- (NSString)personaID
{
  return self->_personaID;
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (int)entitledAttributes
{
  return self->_entitledAttributes;
}

- (BOOL)searchInternal
{
  return self->_searchInternal;
}

- (BOOL)internal
{
  return self->_internal;
}

- (BOOL)quotaDisabled
{
  return self->_quotaDisabled;
}

- (NSString)protectionClass
{
  return self->_protectionClass;
}

- (int)pid
{
  return self->_pid;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (BOOL)isExtension
{
  return self->_isExtension;
}

- (unsigned)euid
{
  return self->_euid;
}

- (BOOL)allowPhotosLibraryDeletion
{
  return self->_allowPhotosLibraryDeletion;
}

- (BOOL)allowMail
{
  return self->_allowMail;
}

- (NSSet)allowedBundleIDs
{
  return self->_allowedBundleIDs;
}

- (BOOL)privateIndexNonSandboxAllowed
{
  return self->_privateIndexNonSandboxAllowed;
}

- (SDConnectionConfiguration)initWithConnection:(id)a3 isPrivate:(BOOL)a4
{
  return -[SDConnectionConfiguration initWithConnection:isPrivate:isManaged:](self, "initWithConnection:isPrivate:isManaged:", a3, a4, 0);
}

- (SDConnectionConfiguration)initWithConnection:(id)a3 isManaged:(BOOL)a4
{
  return -[SDConnectionConfiguration initWithConnection:isPrivate:isManaged:](self, "initWithConnection:isPrivate:isManaged:", a3, 0, a4);
}

- (SDConnectionConfiguration)initWithConnection:(id)a3 isPrivate:(BOOL)a4 isManaged:(BOOL)a5
{
  _xpc_connection_s *v9;
  SDConnectionConfiguration *v10;
  SDConnectionConfiguration *v11;
  const __CFAllocator *v12;
  __SecTask *v13;
  __SecTask *v14;
  void *v15;
  uint64_t v16;
  NSSet *allowedBundleIDs;
  void *v18;
  void *v19;
  uint64_t v20;
  NSString *bundleID;
  void *v22;
  uint64_t v23;
  NSString *v24;
  void **p_bundleID;
  CFTypeRef v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  NSSet *v32;
  void *v33;
  NSObject *v34;
  NSString *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  NSString *protectionClass;
  void *v41;
  void *v42;
  uint64_t v43;
  NSString *personaID;
  NSObject *v45;
  unsigned int pid;
  NSString *v47;
  void *v49;
  objc_super v50;
  audit_token_t token;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v9 = (_xpc_connection_s *)a3;
  v50.receiver = self;
  v50.super_class = (Class)SDConnectionConfiguration;
  v10 = -[SDConnectionConfiguration init](&v50, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_connection, a3);
    v11->_pid = xpc_connection_get_pid(v9);
    v11->_euid = xpc_connection_get_euid(v9);
    v11->_egid = xpc_connection_get_egid(v9);
    v11->_isExtension = xpc_connection_is_extension();
    v11->_isPrivate = a4;
    v11->_isManaged = a5;
    xpc_connection_get_audit_token();
    v12 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    memset(&token, 0, sizeof(token));
    v13 = SecTaskCreateWithAuditToken(v12, &token);
    if (v13)
    {
      v14 = v13;
      v11->_internal = checkBooleanEntitlement(v13, (const __CFString *)*MEMORY[0x24BDC2548]);
      v11->_searchInternal = checkBooleanEntitlement(v14, (const __CFString *)*MEMORY[0x24BDC2570]);
      v11->_quotaDisabled = checkBooleanEntitlement(v14, CFSTR("com.apple.developer.corespotlight.disablequota"));
      v11->_privateIndexNonSandboxAllowed = checkBooleanEntitlement(v14, (const __CFString *)*MEMORY[0x24BDC2558]);
      v11->_managedIndexNonSandboxAllowed = checkBooleanEntitlement(v14, (const __CFString *)*MEMORY[0x24BDC2550]);
      v11->_entitledAttributes = 0;
      if (checkBooleanEntitlement(v14, CFSTR("com.apple.spotlight.entitledattributes")))
        v11->_entitledAttributes |= 1u;
      if (checkBooleanEntitlement(v14, CFSTR("com.apple.spotlight.photos.entitledattributes")))
        v11->_entitledAttributes |= 2u;
      if (checkBooleanEntitlement(v14, CFSTR("com.apple.spotlight.documentunderstanding.entitledattributes")))
        v11->_entitledAttributes |= 4u;
      v11->_allowMail = checkBooleanEntitlement(v14, (const __CFString *)*MEMORY[0x24BDC2560]);
      v11->_allowPhotosLibraryDeletion = checkBooleanEntitlement(v14, (const __CFString *)*MEMORY[0x24BDC2540]);
      v11->_allowOpenJournalFile = checkBooleanEntitlement(v14, (const __CFString *)*MEMORY[0x24BDC2538]);
      v15 = (void *)SecTaskCopyValueForEntitlement(v14, (CFStringRef)*MEMORY[0x24BDC2568], 0);
      if (v15)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v15);
          v16 = objc_claimAutoreleasedReturnValue();
          allowedBundleIDs = v11->_allowedBundleIDs;
          v11->_allowedBundleIDs = (NSSet *)v16;

        }
      }

      v18 = (void *)SecTaskCopyValueForEntitlement(v14, (CFStringRef)*MEMORY[0x24BDC2578], 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_storeStrong((id *)&v11->_bundleID, v18);
      }
      else
      {
        if (v11->_isExtension)
        {
          objc_msgSend(MEMORY[0x24BE72FB8], "defaultManager");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "containingAppForPlugInWithPid:", v11->_pid);
          v20 = objc_claimAutoreleasedReturnValue();
          bundleID = v11->_bundleID;
          v11->_bundleID = (NSString *)v20;

          if (!v11->_bundleID)
          {
            objc_msgSend(v19, "informationForPlugInWithPid:", v11->_pid);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x24BE72FD0]);
            v23 = objc_claimAutoreleasedReturnValue();
            v24 = v11->_bundleID;
            v11->_bundleID = (NSString *)v23;

          }
        }
        p_bundleID = (void **)&v11->_bundleID;
        if (!v11->_bundleID)
        {
          v26 = SecTaskCopyValueForEntitlement(v14, CFSTR("application-identifier"), 0);

          v18 = (void *)v26;
          if (!v26)
            v18 = (void *)SecTaskCopySigningIdentifier(v14, 0);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_storeStrong((id *)&v11->_bundleID, v18);
            *(_QWORD *)token.val = 0;
            if (CPCopyBundleIdentifierAndTeamFromApplicationIdentifier())
            {
              if (*(_QWORD *)token.val)
              {
                v27 = objc_alloc(MEMORY[0x24BDC1528]);
                v49 = (void *)objc_msgSend(v27, "initWithBundleIdentifier:error:", *(_QWORD *)token.val, 0);
                objc_msgSend(v49, "containingBundleRecord");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "bundleIdentifier");
                v29 = (void *)objc_claimAutoreleasedReturnValue();

                if (v29)
                  v30 = v29;
                else
                  v30 = *(id *)token.val;
                v31 = *p_bundleID;
                *p_bundleID = v30;

              }
            }
          }
        }
      }
      if (v11->_bundleID && objc_msgSend(&unk_24D0FCEB0, "containsObject:"))
      {
        v11->_allowNotifications = 1;
      }
      else
      {
        v32 = v11->_allowedBundleIDs;
        v11->_allowNotifications = 0;
        if (-[NSSet containsObject:](v32, "containsObject:", CFSTR("com.apple.usernotificationsd")))
        {
          v33 = (void *)-[NSSet mutableCopy](v11->_allowedBundleIDs, "mutableCopy");
          objc_msgSend(v33, "removeObject:", CFSTR("com.apple.usernotificationsd"));
          objc_storeStrong((id *)&v11->_allowedBundleIDs, v33);
          logForCSLogCategoryDefault();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = v11->_bundleID;
            token.val[0] = 138412290;
            *(_QWORD *)&token.val[1] = v35;
            _os_log_impl(&dword_213CF1000, v34, OS_LOG_TYPE_INFO, "Unallowing notifications for bid %@ not in allow list", (uint8_t *)&token, 0xCu);
          }

        }
      }
      v36 = (void *)SecTaskCopyValueForEntitlement(v14, (CFStringRef)*MEMORY[0x24BDC2530], 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        || (v37 = (void *)SecTaskCopyValueForEntitlement(v14, (CFStringRef)*MEMORY[0x24BDC2528], 0),
            v36,
            objc_opt_class(),
            v38 = 0,
            v36 = v37,
            (objc_opt_isKindOfClass() & 1) != 0))
      {
        v38 = v36;
        v37 = v38;
      }
      CSSanitizeProtectionClass();
      v39 = objc_claimAutoreleasedReturnValue();
      protectionClass = v11->_protectionClass;
      v11->_protectionClass = (NSString *)v39;

      CFRelease(v14);
    }
    if (!a4 && !a5)
    {
      objc_msgSend(MEMORY[0x24BEBF268], "sharedManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "currentPersona");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "userPersonaUniqueString");
      v43 = objc_claimAutoreleasedReturnValue();
      personaID = v11->_personaID;
      v11->_personaID = (NSString *)v43;

    }
    if (v11->_bundleID || v11->_searchInternal)
    {
      logForCSLogCategoryDefault();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        pid = v11->_pid;
        v47 = v11->_bundleID;
        token.val[0] = 67109378;
        token.val[1] = pid;
        LOWORD(token.val[2]) = 2112;
        *(_QWORD *)((char *)&token.val[2] + 2) = v47;
        _os_log_impl(&dword_213CF1000, v45, OS_LOG_TYPE_DEFAULT, "pid: %d bundleID: %@", (uint8_t *)&token, 0x12u);
      }
    }
    else
    {
      logForCSLogCategoryDefault();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[SDConnectionConfiguration initWithConnection:isPrivate:isManaged:].cold.1((uint64_t)v9, v45);
    }

  }
  return v11;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (unsigned)egid
{
  return self->_egid;
}

- (BOOL)managedIndexNonSandboxAllowed
{
  return self->_managedIndexNonSandboxAllowed;
}

- (BOOL)isManaged
{
  return self->_isManaged;
}

- (BOOL)allowOpenJournalFile
{
  return self->_allowOpenJournalFile;
}

- (BOOL)allowNotifications
{
  return self->_allowNotifications;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedBundleIDs, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_protectionClass, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)initWithConnection:(uint64_t)a1 isPrivate:(NSObject *)a2 isManaged:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_213CF1000, a2, OS_LOG_TYPE_ERROR, "Could not resolve bundle from %@", (uint8_t *)&v2, 0xCu);
}

@end
