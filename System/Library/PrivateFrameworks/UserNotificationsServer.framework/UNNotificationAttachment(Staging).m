@implementation UNNotificationAttachment(Staging)

+ (id)_systemDirectoryURL
{
  if (_systemDirectoryURL_onceToken != -1)
    dispatch_once(&_systemDirectoryURL_onceToken, &__block_literal_global_3);
  return (id)_systemDirectoryURL___systemDirectoryURL;
}

+ (uint64_t)stagingActionForFileHandle:()Staging fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:servicingBundleIdentifier:error:
{
  id v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __CFString *v36;
  __CFString *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __CFString *v44;
  void *v45;
  void *v47;
  _QWORD *v48;
  void *v49;
  void *v50;
  os_log_t log;
  NSObject *loga;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  uint8_t v63[128];
  _BYTE buf[32];
  __int16 v65;
  NSObject *v66;
  uint64_t v67;

  v67 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "unc_secureFileURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 | v13)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend((id)v12, "uns_clientBundleProxy");
      v19 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (id)v13;
    }
    v20 = v19;
    objc_msgSend(v19, "bundleURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v62 = 2;
      objc_msgSend(v18, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v62, v21, v15, 0);
      if (!v62)
        goto LABEL_35;
      objc_msgSend(v20, "dataContainerURL");
      v22 = objc_claimAutoreleasedReturnValue();
      if (v22)
      {
        v23 = (void *)v22;
        *(_QWORD *)buf = 2;
        objc_msgSend(v18, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", buf, v22, v15, 0);
        if (*(_QWORD *)buf)
        {
          v48 = a7;
          v49 = v23;
          log = v14;
          v53 = v21;
          objc_msgSend(v20, "groupContainerURLs");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "allValues");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v26 = v25;
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v57;
            while (2)
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v57 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
                *(_QWORD *)&v60 = 2;
                objc_msgSend(v18, "getRelationship:ofDirectoryAtURL:toItemAtURL:error:", &v60, v31, v15, 0);
                if (!(_QWORD)v60)
                {

                  v17 = 1;
                  v14 = log;
                  v21 = v53;
                  goto LABEL_43;
                }
              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
              if (v28)
                continue;
              break;
            }
          }

          v21 = v53;
          if (v48)
          {
            objc_msgSend(MEMORY[0x24BDD1540], "un_errorWithUNErrorCode:userInfo:", 100, 0);
            *v48 = (id)objc_claimAutoreleasedReturnValue();
          }

          v17 = 0;
          v14 = log;
          goto LABEL_43;
        }

        goto LABEL_35;
      }
      v60 = 0u;
      v61 = 0u;
      objc_msgSend((id)v12, "uns_clientAuditToken");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        objc_msgSend(v32, "realToken");
      }
      else
      {
        v60 = 0u;
        v61 = 0u;
      }

      if (v12)
      {
        objc_msgSend(v11, "fileDescriptor");
        *(_OWORD *)buf = v60;
        *(_OWORD *)&buf[16] = v61;
        if (!sandbox_check_by_audit_token())
        {
LABEL_35:
          v17 = 1;
LABEL_43:

          goto LABEL_44;
        }
      }
      if (v13)
      {
        objc_msgSend((id)v12, "processIdentifier");
        BSBundlePathForPID();
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
        v36 = CFSTR("<unknown executable>");
        if (v34)
          v36 = (__CFString *)v34;
        v37 = v36;

        v38 = (void *)*MEMORY[0x24BDF8980];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_FAULT))
        {
          v39 = v38;
          objc_msgSend(v15, "absoluteString");
          v54 = v21;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v54;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)&buf[24] = v40;
          _os_log_fault_impl(&dword_216DCB000, v39, OS_LOG_TYPE_FAULT, "[System Notification Source] Copying not moving attachment to prevent notification service extension from effectively deleting this file it doesn't have access to. Connection process '%{public}@', Posting of behalf of notification source: '%{public}@', Attachment: '%{public}@'", buf, 0x20u);

          v21 = v54;
        }
      }
      else
      {
        v55 = v21;
        objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "processIdentifier");
        BSBundlePathForPID();
        v42 = objc_claimAutoreleasedReturnValue();
        v43 = (void *)v42;
        v44 = CFSTR("<unknown executable>");
        if (v42)
          v44 = (__CFString *)v42;
        v37 = v44;

        v45 = (void *)*MEMORY[0x24BDF8980];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_FAULT))
        {
          loga = v45;
          objc_msgSend(v20, "bundleIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "absoluteString");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          *(_QWORD *)&buf[4] = v37;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v50;
          *(_WORD *)&buf[22] = 2114;
          *(_QWORD *)&buf[24] = v47;
          v65 = 2114;
          v66 = v14;
          _os_log_fault_impl(&dword_216DCB000, loga, OS_LOG_TYPE_FAULT, "[Notification Service Extension] Copying not moving attachment to prevent system process from effectively deleting this file it doesn't have access to. Push notification service connection '%{public}@'. Notification service extension for bundle: '%{public}@', Attachment: '%{public}@', Effective Notifications Bundle ID: '%{public}@'", buf, 0x2Au);

        }
        v21 = v55;
      }

    }
    v17 = 0;
    goto LABEL_43;
  }
  v16 = (void *)*MEMORY[0x24BDF8980];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF8980], OS_LOG_TYPE_FAULT))
    +[UNNotificationAttachment(Staging) stagingActionForFileHandle:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:servicingBundleIdentifier:error:].cold.1(v16, v15);
  v17 = 0;
LABEL_44:

  return v17;
}

+ (void)stagingActionForFileHandle:()Staging fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:servicingBundleIdentifier:error:.cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_216DCB000, v3, OS_LOG_TYPE_FAULT, "Cannot stage attachment. Must provide either a connection or proxy, and not both. Attachment: '%{public}@'", (uint8_t *)&v5, 0xCu);

}

@end
