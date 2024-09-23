@implementation SUDownloadPolicyFactory

+ (id)_userDownloadPolicyFromCurrentPolicy:(id)a3 descriptor:(id)a4 networkMonitor:(id)a5 allowCellularOverride:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  __objc2_class **v15;
  void *v16;
  int v17;
  int v18;
  int v19;
  int v20;
  BOOL v21;
  char v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v11)
  {
    if (!v12)
    {
      +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(a1, "downloadPolicyTypeForClass:", v10);
    if (a6)
    {
      v15 = off_24CE3A820;
LABEL_22:
      v16 = (void *)objc_msgSend(objc_alloc(*v15), "initWithDescriptor:", v11);
      goto LABEL_23;
    }
    v17 = v14;
    v18 = objc_msgSend(v13, "isCellularRoaming");
    v19 = objc_msgSend(v13, "isCellularDataRoamingEnabled");
    if (v18 && v19)
    {
      v20 = objc_msgSend(v13, "currentNetworkType");
      if (v10)
        v21 = v17 == 0;
      else
        v21 = 0;
      v22 = v21;
      v15 = off_24CE3A828;
      if (v20 != 1 || (v22 & 1) != 0)
        goto LABEL_22;
    }
    else if (v10 && !v17)
    {
      v15 = off_24CE3A828;
      goto LABEL_22;
    }
    v15 = off_24CE3A830;
    goto LABEL_22;
  }
  v16 = 0;
LABEL_23:

  return v16;
}

+ (id)userDownloadPolicyForDescriptor:(id)a3 existingPolicy:(id)a4 networkMonitor:(id)a5 allowCellularOverride:(BOOL)a6
{
  return (id)objc_msgSend(a1, "_userDownloadPolicyFromCurrentPolicy:descriptor:networkMonitor:allowCellularOverride:", a4, a3, a5, a6);
}

+ (id)userDownloadPolicyForDescriptor:(id)a3 existingPolicy:(id)a4 allowCellularOverride:(BOOL)a5
{
  return (id)objc_msgSend(a1, "userDownloadPolicyForDescriptor:existingPolicy:networkMonitor:allowCellularOverride:", a3, a4, 0, a5);
}

+ (id)userDownloadPolicyForDescriptor:(id)a3 existingPolicy:(id)a4
{
  return (id)objc_msgSend(a1, "userDownloadPolicyForDescriptor:existingPolicy:networkMonitor:allowCellularOverride:", a3, a4, 0, 0);
}

+ (id)userDownloadPolicyForDescriptor:(id)a3
{
  return (id)objc_msgSend(a1, "userDownloadPolicyForDescriptor:existingPolicy:", a3, 0);
}

+ (id)downloadPolicyForType:(int)a3 forDescriptor:(id)a4
{
  id v5;
  __objc2_class **v6;
  void *v7;

  v5 = a4;
  if ((a3 - 1) > 3)
    v6 = off_24CE3A828;
  else
    v6 = off_24CE3E4B8[a3 - 1];
  v7 = (void *)objc_msgSend(objc_alloc(*v6), "initWithDescriptor:", v5);

  return v7;
}

+ (int)downloadPolicyTypeForClass:(id)a3
{
  uint64_t v3;

  v3 = objc_opt_class();
  if (v3 == objc_opt_class())
    return 1;
  if (v3 == objc_opt_class())
    return 2;
  if (v3 == objc_opt_class())
    return 3;
  return 4 * (v3 == objc_opt_class());
}

@end
