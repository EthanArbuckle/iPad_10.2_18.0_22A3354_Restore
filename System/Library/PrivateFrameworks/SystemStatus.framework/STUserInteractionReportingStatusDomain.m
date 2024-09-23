@implementation STUserInteractionReportingStatusDomain

- (void)reportUserInteraction:(id)a3
{
  id v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[STStatusDomain isInvalidated](self, "isInvalidated"))
  {
    STSystemStatusLogObservation();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      v6 = objc_msgSend((id)objc_opt_class(), "statusDomainName");
      STSystemStatusDescriptionForDomain(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_fault_impl(&dword_1D12C7000, v5, OS_LOG_TYPE_FAULT, "%{public}@ domain attempted to report user interaction after being invalidated", (uint8_t *)&v8, 0xCu);

    }
  }
  else
  {
    -[STStatusDomain serverHandle](self, "serverHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject reportUserInteraction:forClient:domain:](v5, "reportUserInteraction:forClient:domain:", v4, self, objc_msgSend((id)objc_opt_class(), "statusDomainName"));
  }

}

@end
