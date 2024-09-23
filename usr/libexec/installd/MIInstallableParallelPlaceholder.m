@implementation MIInstallableParallelPlaceholder

- (BOOL)shouldModifyExistingContainers
{
  return 0;
}

- (BOOL)performInstallationWithError:(id *)a3
{
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  id v34;
  id v35;
  id v36;
  id v37;

  if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    MOLogWrite(qword_10009E048, 5, "-[MIInstallableParallelPlaceholder performInstallationWithError:]", CFSTR("Installing parallel placeholder"));
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[MIInstallable progressBlock](self, "progressBlock"));
  ((void (**)(_QWORD, const __CFString *, uint64_t))v5)[2](v5, CFSTR("InstallingApplication"), 60);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parallelPlaceholderURL"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  objc_msgSend(v8, "removeItemAtURL:error:", v7, 0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MIFileManager defaultManager](MIFileManager, "defaultManager"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bundleURL"));
  v37 = 0;
  v12 = objc_msgSend(v9, "moveItemAtURL:toURL:error:", v11, v7, &v37);
  v13 = v37;

  if ((v12 & 1) == 0)
  {
    v29 = (void *)MIInstallerErrorDomain;
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bundleURL"));
    v32 = sub_100010E50((uint64_t)"-[MIInstallableParallelPlaceholder performInstallationWithError:]", 43, v29, 20, v13, &off_10008F370, CFSTR("Could not move %@ to %@"), v31, (uint64_t)v30);
    v19 = (id)objc_claimAutoreleasedReturnValue(v32);

    v28 = 0;
LABEL_9:

    if (!a3)
      goto LABEL_16;
    goto LABEL_14;
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bundle"));
  -[MIInstallable setBundle:](self, "setBundle:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle existingBundleContainer](self, "existingBundleContainer"));
  -[MIInstallableBundle setBundleContainer:](self, "setBundleContainer:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
  v36 = v13;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "frameworkBundlesWithError:", &v36));
  v19 = v36;

  -[MIInstallableBundle setFrameworkBundles:](self, "setFrameworkBundles:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle frameworkBundles](self, "frameworkBundles"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v35 = v19;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "driverKitExtensionBundlesWithError:", &v35));
    v23 = v35;

    -[MIInstallableBundle setDriverKitExtensionBundles:](self, "setDriverKitExtensionBundles:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle driverKitExtensionBundles](self, "driverKitExtensionBundles"));

    if (!v24)
    {
      v28 = 0;
      v19 = v23;
      if (!a3)
        goto LABEL_16;
      goto LABEL_14;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallable bundle](self, "bundle"));
    v34 = v23;
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "appExtensionBundlesWithError:", &v34));
    v19 = v34;

    -[MIInstallableBundle setAppExtensionBundles:](self, "setAppExtensionBundles:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MIInstallableBundle appExtensionBundles](self, "appExtensionBundles"));
    v28 = v27 != 0;
    goto LABEL_9;
  }
  v28 = 0;
  if (!a3)
    goto LABEL_16;
LABEL_14:
  if (!v28)
    *a3 = objc_retainAutorelease(v19);
LABEL_16:

  return v28;
}

@end
