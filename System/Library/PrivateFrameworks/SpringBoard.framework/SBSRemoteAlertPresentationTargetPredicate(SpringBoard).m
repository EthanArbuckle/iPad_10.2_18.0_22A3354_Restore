@implementation SBSRemoteAlertPresentationTargetPredicate(SpringBoard)

- (id)targetApplicationWithController:()SpringBoard
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "launchingApplicationIdentity");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    objc_msgSend(v4, "applicationWithPid:", objc_msgSend(v5, "pid"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v6)
  {
    objc_msgSend(a1, "_launchingApplicationRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "applicationWithBundleIdentifier:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)matchesOverlayViewController:()SpringBoard
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(a1, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "launchingApplicationIdentity");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5)
  {
    v8 = objc_msgSend(v4, "isPresentedByProcess:", v5);
  }
  else if (v6)
  {
    objc_msgSend(a1, "_launchingApplicationRecord");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v4, "isPresentedByBundleIdentifier:", v10);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)configureTransientOverlayContext:()SpringBoard
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "process");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v5, "setOriginatingProcess:", v4);

}

- (id)_launchingApplicationRecord
{
  void *v1;
  void *v2;
  id v3;
  NSObject *v4;
  id v6;

  objc_msgSend(a1, "launchingApplicationIdentity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v1, "findApplicationRecordWithError:", &v6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v6;

  if (v3)
  {
    SBLogTransientOverlay();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SBSRemoteAlertPresentationTargetPredicate(SpringBoard) _launchingApplicationRecord].cold.1((uint64_t)v3, v4);

  }
  return v2;
}

- (void)_launchingApplicationRecord
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "could not find app record for app identity. error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
