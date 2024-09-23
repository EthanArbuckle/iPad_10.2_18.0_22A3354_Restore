@implementation WBSKnownTrackingThirdParty

- (id)thirdPartyCoalescedWithThirdParty:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[WBSTrackingCapableThirdParty firstParties](self, "firstParties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstParties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safari_arrayByAddingObjectsFromArrayIfNotDuplicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_34);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc((Class)objc_opt_class());
  -[WBSTrackingCapableThirdParty domain](self, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithDomain:firstParties:", v10, v8);

  -[WBSKnownTrackingThirdParty ownerName](self, "ownerName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setOwnerName:", v12);

  return v11;
}

uint64_t __64__WBSKnownTrackingThirdParty_thirdPartyCoalescedWithThirdParty___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCaseInsensitiveCompare:", v6);
  return v7;
}

- (NSString)ownerName
{
  return self->_ownerName;
}

- (void)setOwnerName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ownerName, 0);
}

@end
