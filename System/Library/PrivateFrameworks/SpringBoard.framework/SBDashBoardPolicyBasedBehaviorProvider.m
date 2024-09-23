@implementation SBDashBoardPolicyBasedBehaviorProvider

- (SBDashBoardPolicyBasedBehaviorProvider)initWithCoverSheetViewController:(id)a3 policyAggregator:(id)a4
{
  id v7;
  id v8;
  SBDashBoardPolicyBasedBehaviorProvider *v9;
  SBDashBoardPolicyBasedBehaviorProvider *v10;
  void *v11;
  uint64_t v12;
  id notificationToken;
  _QWORD v15[4];
  id v16;
  id location;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBDashBoardPolicyBasedBehaviorProvider;
  v9 = -[SBDashBoardPolicyBasedBehaviorProvider init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coverSheetViewController, a3);
    -[CSCoverSheetViewController registerExternalBehaviorProvider:](v10->_coverSheetViewController, "registerExternalBehaviorProvider:", v10);
    objc_storeStrong((id *)&v10->_policyAggregator, a4);
    objc_initWeak(&location, v10);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __92__SBDashBoardPolicyBasedBehaviorProvider_initWithCoverSheetViewController_policyAggregator___block_invoke;
    v15[3] = &unk_1E8EAD940;
    objc_copyWeak(&v16, &location);
    objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("SBPolicyAggregatorCapabilitiesChangedNotification"), v8, 0, v15);
    v12 = objc_claimAutoreleasedReturnValue();
    notificationToken = v10->_notificationToken;
    v10->_notificationToken = (id)v12;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __92__SBDashBoardPolicyBasedBehaviorProvider_initWithCoverSheetViewController_policyAggregator___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[1], "externalBehaviorProviderBehaviorChanged:", WeakRetained);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CSCoverSheetViewController unregisterExternalBehaviorProvider:](self->_coverSheetViewController, "unregisterExternalBehaviorProvider:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_notificationToken);

  v4.receiver = self;
  v4.super_class = (Class)SBDashBoardPolicyBasedBehaviorProvider;
  -[SBDashBoardPolicyBasedBehaviorProvider dealloc](&v4, sel_dealloc);
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (int64_t)notificationBehavior
{
  return 0;
}

- (int64_t)proximityDetectionMode
{
  return 0;
}

- (int64_t)scrollingStrategy
{
  return 0;
}

- (unint64_t)restrictedCapabilities
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[SBDashBoardPolicyBasedBehaviorProvider _cameraRestrictions](self, "_cameraRestrictions");
  v4 = -[SBDashBoardPolicyBasedBehaviorProvider _restrictedCapability:forAggregatorCapability:](self, "_restrictedCapability:forAggregatorCapability:", 64, 22) | v3;
  v5 = -[SBDashBoardPolicyBasedBehaviorProvider _restrictedCapability:forAggregatorCapability:](self, "_restrictedCapability:forAggregatorCapability:", 128, 20);
  v6 = v4 | v5 | -[SBDashBoardPolicyBasedBehaviorProvider _restrictedCapability:forAggregatorCapability:](self, "_restrictedCapability:forAggregatorCapability:", 0x2000, 25);
  v7 = -[SBDashBoardPolicyBasedBehaviorProvider _restrictedCapability:forAggregatorCapability:](self, "_restrictedCapability:forAggregatorCapability:", 0x10000, 21);
  v8 = v7 | -[SBDashBoardPolicyBasedBehaviorProvider _restrictedCapability:forAggregatorCapability:](self, "_restrictedCapability:forAggregatorCapability:", 0x200000, 26);
  v9 = v6 | v8 | -[SBDashBoardPolicyBasedBehaviorProvider _restrictedCapability:forAggregatorCapability:](self, "_restrictedCapability:forAggregatorCapability:", 0x400000, 20);
  return v9 | -[SBDashBoardPolicyBasedBehaviorProvider _restrictedCapability:forAggregatorCapability:](self, "_restrictedCapability:forAggregatorCapability:", 0x800000, 27);
}

- (unint64_t)_cameraRestrictions
{
  if (-[SBMainDisplayPolicyAggregator allowsCapability:](self->_policyAggregator, "allowsCapability:", 10)
    && -[SBMainDisplayPolicyAggregator allowsCapability:](self->_policyAggregator, "allowsCapability:", 11))
  {
    return 0;
  }
  else
  {
    return 4;
  }
}

- (unint64_t)_restrictedCapability:(unint64_t)a3 forAggregatorCapability:(int64_t)a4
{
  if (-[SBMainDisplayPolicyAggregator allowsCapability:](self->_policyAggregator, "allowsCapability:", a4))
    return 0;
  else
    return a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notificationToken, 0);
  objc_storeStrong((id *)&self->_policyAggregator, 0);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
}

@end
