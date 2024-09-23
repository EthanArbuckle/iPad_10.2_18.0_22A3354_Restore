@implementation WBSTrackedFirstParty

- (WBSTrackedFirstParty)initWithDomain:(id)a3
{
  return -[WBSTrackedFirstParty initWithDomain:blockedTrackers:preventedTrackers:](self, "initWithDomain:blockedTrackers:preventedTrackers:", a3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60]);
}

- (WBSTrackedFirstParty)initWithDomain:(id)a3 blockedTrackers:(id)a4 preventedTrackers:(id)a5
{
  id v8;
  id v9;
  WBSTrackedFirstParty *v10;
  uint64_t v11;
  NSArray *blockedTrackers;
  uint64_t v13;
  NSArray *preventedTrackers;
  WBSTrackedFirstParty *v15;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)WBSTrackedFirstParty;
  v10 = -[WBSTrackingCapableFirstParty initWithDomain:](&v17, sel_initWithDomain_, a3);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    blockedTrackers = v10->_blockedTrackers;
    v10->_blockedTrackers = (NSArray *)v11;

    v13 = objc_msgSend(v9, "copy");
    preventedTrackers = v10->_preventedTrackers;
    v10->_preventedTrackers = (NSArray *)v13;

    v15 = v10;
  }

  return v10;
}

- (NSArray)trackers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  -[NSArray arrayByAddingObjectsFromArray:](self->_preventedTrackers, "arrayByAddingObjectsFromArray:", self->_blockedTrackers);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", CFSTR("domain"), 1, sel_localizedCaseInsensitiveCompare_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (NSArray)blockedTrackers
{
  return self->_blockedTrackers;
}

- (void)setBlockedTrackers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)preventedTrackers
{
  return self->_preventedTrackers;
}

- (void)setPreventedTrackers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preventedTrackers, 0);
  objc_storeStrong((id *)&self->_blockedTrackers, 0);
}

@end
