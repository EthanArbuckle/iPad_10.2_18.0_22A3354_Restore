@implementation PKPeerPaymentAssociatedAccountInformation

- (PKPeerPaymentAssociatedAccountInformation)initWithDictionary:(id)a3 lastUpdated:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentAssociatedAccountInformation *v8;
  PKPeerPaymentAssociatedAccountInformation *v9;
  double v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  PKPeerPaymentAccount *v17;
  uint64_t v18;
  NSSet *associatedAccounts;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  PKPeerPaymentAccountInvitation *v26;
  uint64_t v27;
  NSSet *associatedAccountInvitations;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  PKPeerPaymentAssociatedAccountRemovalRecord *v35;
  uint64_t v36;
  NSSet *associatedAccountRemovalRecords;
  PKPeerPaymentAssociatedAccountInformation *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  objc_super v53;
  _BYTE v54[128];
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)PKPeerPaymentAssociatedAccountInformation;
  v8 = -[PKPeerPaymentAssociatedAccountInformation init](&v53, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lastUpdated, a4);
    objc_msgSend(v6, "PKDoubleForKey:", CFSTR("proactiveAssociatedAccountFetchPeriod"));
    v9->_proactiveAssociatedAccountFetchPeriod = v10;
    v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("associatedAccounts"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v50 != v15)
            objc_enumerationMutation(v12);
          v17 = -[PKPeerPaymentAccount initWithDictionary:lastUpdated:]([PKPeerPaymentAccount alloc], "initWithDictionary:lastUpdated:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i), v7);
          if (v17)
            objc_msgSend(v11, "addObject:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v49, v56, 16);
      }
      while (v14);
    }

    v18 = objc_msgSend(v11, "copy");
    associatedAccounts = v9->_associatedAccounts;
    v9->_associatedAccounts = (NSSet *)v18;

    v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v40 = v6;
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("associatedAccountInvitations"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v21);
          v26 = -[PKPeerPaymentAccountInvitation initWithDictionary:]([PKPeerPaymentAccountInvitation alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j));
          if (v26)
            objc_msgSend(v20, "addObject:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v55, 16);
      }
      while (v23);
    }

    v27 = objc_msgSend(v20, "copy");
    associatedAccountInvitations = v9->_associatedAccountInvitations;
    v39 = v9;
    v9->_associatedAccountInvitations = (NSSet *)v27;

    v29 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("previousAssociatedAccounts"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v42;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v42 != v33)
            objc_enumerationMutation(v30);
          v35 = -[PKPeerPaymentAssociatedAccountRemovalRecord initWithDictionary:]([PKPeerPaymentAssociatedAccountRemovalRecord alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * k));
          if (v35)
            objc_msgSend(v29, "addObject:", v35);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v54, 16);
      }
      while (v32);
    }

    v36 = objc_msgSend(v29, "copy");
    v9 = v39;
    associatedAccountRemovalRecords = v39->_associatedAccountRemovalRecords;
    v39->_associatedAccountRemovalRecords = (NSSet *)v36;

    v6 = v40;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentAssociatedAccountInformation)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentAssociatedAccountInformation *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSSet *associatedAccounts;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSSet *associatedAccountInvitations;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSSet *associatedAccountRemovalRecords;
  uint64_t v22;
  NSDate *lastUpdated;
  objc_super v25;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPeerPaymentAssociatedAccountInformation;
  v5 = -[PKPeerPaymentAssociatedAccountInformation init](&v25, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("associatedAccounts"));
    v9 = objc_claimAutoreleasedReturnValue();
    associatedAccounts = v5->_associatedAccounts;
    v5->_associatedAccounts = (NSSet *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v27[0] = objc_opt_class();
    v27[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithArray:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("associatedAccountInvitations"));
    v14 = objc_claimAutoreleasedReturnValue();
    associatedAccountInvitations = v5->_associatedAccountInvitations;
    v5->_associatedAccountInvitations = (NSSet *)v14;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("proactiveAssociatedAccountFetchPeriod"));
    v5->_proactiveAssociatedAccountFetchPeriod = v16;
    v17 = (void *)MEMORY[0x1E0C99E60];
    v26[0] = objc_opt_class();
    v26[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setWithArray:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("associatedAccountRemovalRecords"));
    v20 = objc_claimAutoreleasedReturnValue();
    associatedAccountRemovalRecords = v5->_associatedAccountRemovalRecords;
    v5->_associatedAccountRemovalRecords = (NSSet *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v22 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v22;

    v5->_associatedAccountStateDirty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("associatedAccountStateDirty"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *associatedAccounts;
  id v5;

  associatedAccounts = self->_associatedAccounts;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", associatedAccounts, CFSTR("associatedAccounts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedAccountInvitations, CFSTR("associatedAccountInvitations"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("proactiveAssociatedAccountFetchPeriod"), self->_proactiveAssociatedAccountFetchPeriod);
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedAccountRemovalRecords, CFSTR("associatedAccountRemovalRecords"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastUpdated, CFSTR("lastUpdated"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_associatedAccountStateDirty, CFSTR("associatedAccountStateDirty"));

}

- (void)markAssociatedAccountRemovalRecordWithAltDSID:(id)a3 hasPresentedNotification:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  void *v15;
  int v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = self->_associatedAccountRemovalRecords;
  v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v12, "altDSID", (_QWORD)v17);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v14 = v6;
        v15 = v14;
        if (v13 == v14)
        {

LABEL_16:
          objc_msgSend(v12, "setHasPresentedNotification:", v4);
          goto LABEL_17;
        }
        if (v6 && v13)
        {
          v16 = objc_msgSend(v13, "isEqualToString:", v14);

          if (v16)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_17:

}

- (void)markAssociatedAccountActiveWithAltDSID:(id)a3 hasPresentedNotification:(BOOL)a4
{
  id v5;
  NSSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_associatedAccounts;
  v7 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "altDSID", (_QWORD)v16);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v5;
        v14 = v13;
        if (v12 == v13)
        {

LABEL_16:
          objc_msgSend(v11, "setHasDisplayedAssociatedAccountActiveNotification:", 1);
          goto LABEL_17;
        }
        if (v5 && v12)
        {
          v15 = objc_msgSend(v12, "isEqualToString:", v13);

          if (v15)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v8 = -[NSSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_17:

}

- (void)enumerateAssociatedAccountsUsingBlock:(id)a3
{
  -[NSSet enumerateObjectsUsingBlock:](self->_associatedAccounts, "enumerateObjectsUsingBlock:", a3);
}

- (void)enumerateAccountInvitationsUsingBlock:(id)a3
{
  -[NSSet enumerateObjectsUsingBlock:](self->_associatedAccountInvitations, "enumerateObjectsUsingBlock:", a3);
}

- (BOOL)isEqual:(id)a3
{
  double *v4;
  NSSet *associatedAccounts;
  NSSet *v6;
  NSSet *associatedAccountInvitations;
  NSSet *v8;
  NSDate *lastUpdated;
  NSDate *v10;
  NSSet *associatedAccountRemovalRecords;
  NSSet *v12;
  BOOL v13;

  v4 = (double *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_24;
  associatedAccounts = self->_associatedAccounts;
  v6 = (NSSet *)*((_QWORD *)v4 + 2);
  if (associatedAccounts && v6)
  {
    if ((-[NSSet isEqual:](associatedAccounts, "isEqual:") & 1) == 0)
      goto LABEL_24;
  }
  else if (associatedAccounts != v6)
  {
    goto LABEL_24;
  }
  associatedAccountInvitations = self->_associatedAccountInvitations;
  v8 = (NSSet *)*((_QWORD *)v4 + 3);
  if (associatedAccountInvitations && v8)
  {
    if ((-[NSSet isEqual:](associatedAccountInvitations, "isEqual:") & 1) == 0)
      goto LABEL_24;
  }
  else if (associatedAccountInvitations != v8)
  {
    goto LABEL_24;
  }
  lastUpdated = self->_lastUpdated;
  v10 = (NSDate *)*((_QWORD *)v4 + 6);
  if (lastUpdated && v10)
  {
    if ((-[NSDate isEqual:](lastUpdated, "isEqual:") & 1) == 0)
      goto LABEL_24;
  }
  else if (lastUpdated != v10)
  {
    goto LABEL_24;
  }
  associatedAccountRemovalRecords = self->_associatedAccountRemovalRecords;
  v12 = (NSSet *)*((_QWORD *)v4 + 4);
  if (!associatedAccountRemovalRecords || !v12)
  {
    if (associatedAccountRemovalRecords == v12)
      goto LABEL_22;
LABEL_24:
    v13 = 0;
    goto LABEL_25;
  }
  if ((-[NSSet isEqual:](associatedAccountRemovalRecords, "isEqual:") & 1) == 0)
    goto LABEL_24;
LABEL_22:
  if (self->_proactiveAssociatedAccountFetchPeriod != v4[5])
    goto LABEL_24;
  v13 = self->_associatedAccountStateDirty == *((unsigned __int8 *)v4 + 8);
LABEL_25:

  return v13;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdated);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedAccounts);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedAccountInvitations);
  objc_msgSend(v3, "safelyAddObject:", self->_associatedAccountRemovalRecords);
  v4 = PKCombinedHash(17, v3);
  v5 = (unint64_t)self->_proactiveAssociatedAccountFetchPeriod - v4 + 32 * v4;
  v6 = self->_associatedAccountStateDirty - v5 + 32 * v5;

  return v6;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedAccounts: '%@'; "), self->_associatedAccounts);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedAccountInvitations: '%@'; "), self->_associatedAccountInvitations);
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedAccountRemovalRecords: '%@'; "),
    self->_associatedAccountRemovalRecords);
  objc_msgSend(v3, "appendFormat:", CFSTR("lastAssociatedAccountUpdated: '%@'; "), self->_lastUpdated);
  if (self->_associatedAccountStateDirty)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("associatedAccountStateDirty: '%@'; "), v4);
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (NSSet)associatedAccounts
{
  return self->_associatedAccounts;
}

- (void)setAssociatedAccounts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)associatedAccountInvitations
{
  return self->_associatedAccountInvitations;
}

- (void)setAssociatedAccountInvitations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSSet)associatedAccountRemovalRecords
{
  return self->_associatedAccountRemovalRecords;
}

- (void)setAssociatedAccountRemovalRecords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)proactiveAssociatedAccountFetchPeriod
{
  return self->_proactiveAssociatedAccountFetchPeriod;
}

- (void)setProactiveAssociatedAccountFetchPeriod:(double)a3
{
  self->_proactiveAssociatedAccountFetchPeriod = a3;
}

- (BOOL)isAssociatedAccountStateDirty
{
  return self->_associatedAccountStateDirty;
}

- (void)setAssociatedAccountStateDirty:(BOOL)a3
{
  self->_associatedAccountStateDirty = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_associatedAccountRemovalRecords, 0);
  objc_storeStrong((id *)&self->_associatedAccountInvitations, 0);
  objc_storeStrong((id *)&self->_associatedAccounts, 0);
}

@end
