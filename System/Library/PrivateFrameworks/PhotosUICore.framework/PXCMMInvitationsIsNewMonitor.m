@implementation PXCMMInvitationsIsNewMonitor

- (PXCMMInvitationsIsNewMonitor)init
{
  PXCMMInvitationsIsNewMonitor *v2;
  uint64_t v3;
  NSDate *lastExitedForYouDate;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXCMMInvitationsIsNewMonitor;
  v2 = -[PXCMMInvitationsIsNewMonitor init](&v7, sel_init);
  if (v2)
  {
    PXForYouLastExitedDate();
    v3 = objc_claimAutoreleasedReturnValue();
    lastExitedForYouDate = v2->_lastExitedForYouDate;
    v2->_lastExitedForYouDate = (NSDate *)v3;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__lastExitedDateDidChange_, CFSTR("PXForYouLastExitedDateChangeNotification"), 0);

    -[PXCMMInvitationsIsNewMonitor _updateLastExitedDate](v2, "_updateLastExitedDate");
  }
  return v2;
}

- (BOOL)invitationIsNew:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  void *v9;

  v4 = a3;
  +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "simulateAllMomentSharesAreNew");

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(v4, "shareType") == 1)
  {
    objc_msgSend(v4, "creationDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v7 = objc_msgSend(v8, "compare:", self->_lastExitedForYouDate) == 1;
    else
      v7 = 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_updateLastExitedDate
{
  NSDate *v3;
  NSDate *lastExitedForYouDate;

  PXForYouLastExitedDate();
  v3 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastExitedForYouDate = self->_lastExitedForYouDate;
  self->_lastExitedForYouDate = v3;

}

- (void)_lastExitedDateDidChange:(id)a3
{
  id v4;

  -[PXCMMInvitationsIsNewMonitor _updateLastExitedDate](self, "_updateLastExitedDate", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PXCMMInvitationsIsNewMonitorDidChangeNotification"), self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastExitedForYouDate, 0);
}

+ (PXCMMInvitationsIsNewMonitor)sharedMonitor
{
  if (sharedMonitor_predicate != -1)
    dispatch_once(&sharedMonitor_predicate, &__block_literal_global_90653);
  return (PXCMMInvitationsIsNewMonitor *)(id)sharedMonitor__sharedMonitor;
}

void __45__PXCMMInvitationsIsNewMonitor_sharedMonitor__block_invoke()
{
  PXCMMInvitationsIsNewMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(PXCMMInvitationsIsNewMonitor);
  v1 = (void *)sharedMonitor__sharedMonitor;
  sharedMonitor__sharedMonitor = (uint64_t)v0;

}

@end
