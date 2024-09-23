@implementation PKPeerPaymentPreferences

- (PKPeerPaymentPreferences)initWithDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  PKPeerPaymentPreferences *v7;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKPeerPaymentPreferences initWithDictionary:lastUpdated:](self, "initWithDictionary:lastUpdated:", v5, v6);

  return v7;
}

- (PKPeerPaymentPreferences)initWithDictionary:(id)a3 lastUpdated:(id)a4
{
  id v6;
  id v7;
  PKPeerPaymentPreferences *v8;
  PKPeerPaymentPreferences *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  PKPeerPaymentPreferencesNotification *v16;
  uint64_t v17;
  NSSet *notifications;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  PKPeerPaymentPreferencesRestriction *v25;
  uint64_t v26;
  NSSet *restrictions;
  void *v28;
  PKPeerPaymentPreferencesProfileAppearance *v29;
  PKPeerPaymentPreferencesProfileAppearance *profileAppearance;
  double v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  objc_super v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)PKPeerPaymentPreferences;
  v8 = -[PKPeerPaymentPreferences init](&v41, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_lastUpdated, a4);
    v9->_requiresConfirmation = objc_msgSend(v6, "PKBoolForKey:", CFSTR("requiresConfirmation"));
    v9->_canReceiveFormalPaymentRequests = objc_msgSend(v6, "PKBoolForKey:", CFSTR("canReceiveFormalPaymentRequests"));
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("notifications"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v38 != v14)
            objc_enumerationMutation(v11);
          v16 = -[PKPeerPaymentPreferencesNotification initWithDictionary:]([PKPeerPaymentPreferencesNotification alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i));
          if (v16)
            objc_msgSend(v10, "addObject:", v16);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      }
      while (v13);
    }

    v17 = objc_msgSend(v10, "copy");
    notifications = v9->_notifications;
    v9->_notifications = (NSSet *)v17;

    v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    objc_msgSend(v6, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("restrictions"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v34;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v34 != v23)
            objc_enumerationMutation(v20);
          v25 = -[PKPeerPaymentPreferencesRestriction initWithDictionary:]([PKPeerPaymentPreferencesRestriction alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
          if (v25)
            objc_msgSend(v19, "addObject:", v25);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      }
      while (v22);
    }

    v26 = objc_msgSend(v19, "copy");
    restrictions = v9->_restrictions;
    v9->_restrictions = (NSSet *)v26;

    objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("profileAppearance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = -[PKPeerPaymentPreferencesProfileAppearance initWithDictionary:]([PKPeerPaymentPreferencesProfileAppearance alloc], "initWithDictionary:", v28);
      profileAppearance = v9->_profileAppearance;
      v9->_profileAppearance = v29;

    }
    objc_msgSend(v6, "PKDoubleForKey:", CFSTR("proactivePreferencesFetchPeriod"));
    v9->_proactiveFetchPeriod = v31;

  }
  return v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSSet *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_requiresConfirmation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("requiresConfirmation"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canReceiveFormalPaymentRequests);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("canReceiveFormalPaymentRequests"));

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v7 = self->_notifications;
  v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v11), "dictionaryRepresentation");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "safelyAddObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("notifications"));
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v14 = self->_restrictions;
  v15 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v25;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v25 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v18), "dictionaryRepresentation", (_QWORD)v24);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "safelyAddObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSSet countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v16);
  }

  objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("restrictions"));
  -[PKPeerPaymentPreferencesProfileAppearance dictionaryRepresentation](self->_profileAppearance, "dictionaryRepresentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("profileAppearance"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_proactiveFetchPeriod, (_QWORD)v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("proactivePreferencesFetchPeriod"));

  v22 = (void *)objc_msgSend(v3, "copy");
  return v22;
}

- (BOOL)isOutOfDate
{
  double proactiveFetchPeriod;
  void *v4;
  double v5;
  BOOL v6;

  if (!self->_lastUpdated)
    return 1;
  if (self->_proactiveFetchPeriod <= 0.0)
    proactiveFetchPeriod = *(double *)&PKPeerPaymentPreferencesDefaultProactiveFetchPeriod;
  else
    proactiveFetchPeriod = self->_proactiveFetchPeriod;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", self->_lastUpdated);
  v6 = v5 >= proactiveFetchPeriod;

  return v6;
}

- (id)sendRestrictionWithType:(unint64_t)a3 altDSID:(id)a4
{
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
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_restrictions;
  v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v12, "sendRestrictionType", (_QWORD)v19) == a3)
        {
          objc_msgSend(v12, "altDSID");
          v13 = (id)objc_claimAutoreleasedReturnValue();
          v14 = v6;
          v15 = v14;
          if (v13 == v14)
          {

LABEL_17:
            v17 = v12;
            goto LABEL_18;
          }
          if (v6 && v13)
          {
            v16 = objc_msgSend(v13, "isEqualToString:", v14);

            if (v16)
              goto LABEL_17;
          }
          else
          {

          }
        }
      }
      v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        continue;
      break;
    }
  }
  v17 = 0;
LABEL_18:

  return v17;
}

- (id)restrictionsForAltDSID:(id)a3
{
  id v4;
  NSSet *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_restrictions;
  v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "altDSID", (_QWORD)v15);
        v10 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v4;
        v12 = v11;
        if (v10 == v11)
        {

LABEL_16:
          v6 = v9;
          goto LABEL_17;
        }
        if (v4 && v10)
        {
          v13 = objc_msgSend(v10, "isEqualToString:", v11);

          if (v13)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v6 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_17:

  return v6;
}

- (id)notificationWithType:(unint64_t)a3 altDSID:(id)a4
{
  id v6;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  PKPeerPaymentPreferencesNotification *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_notifications;
  v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v8)
  {
LABEL_15:

    goto LABEL_18;
  }
  v9 = v8;
  v10 = *(_QWORD *)v20;
LABEL_3:
  v11 = 0;
  while (1)
  {
    if (*(_QWORD *)v20 != v10)
      objc_enumerationMutation(v7);
    v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v11);
    if (objc_msgSend(v12, "notificationType", (_QWORD)v19) != a3)
      goto LABEL_13;
    objc_msgSend(v12, "altDSID");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = v6;
    v15 = v14;
    if (v13 == v14)
      break;
    if (v6 && v13)
    {
      v16 = objc_msgSend(v13, "isEqualToString:", v14);

      if ((v16 & 1) != 0)
        goto LABEL_17;
    }
    else
    {

    }
LABEL_13:
    if (v9 == ++v11)
    {
      v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v9)
        goto LABEL_3;
      goto LABEL_15;
    }
  }

LABEL_17:
  v17 = v12;

  if (v17)
    goto LABEL_19;
LABEL_18:
  v17 = objc_alloc_init(PKPeerPaymentPreferencesNotification);
  -[PKPeerPaymentPreferencesNotification setAltDSID:](v17, "setAltDSID:", v6);
  -[PKPeerPaymentPreferencesNotification setNotificationType:](v17, "setNotificationType:", a3);
LABEL_19:

  return v17;
}

- (void)addSendRestrictionType:(unint64_t)a3 altDSID:(id)a4
{
  void *v6;
  void *v7;
  PKPeerPaymentPreferencesRestriction *v8;
  void *v9;
  NSSet *v10;
  NSSet *restrictions;
  id v12;

  v12 = a4;
  -[PKPeerPaymentPreferences restrictionsForAltDSID:](self, "restrictionsForAltDSID:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setSendRestrictionType:", a3);
  }
  else
  {
    v8 = objc_alloc_init(PKPeerPaymentPreferencesRestriction);
    -[PKPeerPaymentPreferencesRestriction setSendRestrictionType:](v8, "setSendRestrictionType:", a3);
    -[PKPeerPaymentPreferencesRestriction setAltDSID:](v8, "setAltDSID:", v12);
    v9 = (void *)-[NSSet mutableCopy](self->_restrictions, "mutableCopy");
    objc_msgSend(v9, "addObject:", v8);
    v10 = (NSSet *)objc_msgSend(v9, "copy");
    restrictions = self->_restrictions;
    self->_restrictions = v10;

  }
}

- (void)addReceiveRestrictionType:(unint64_t)a3 altDSID:(id)a4
{
  void *v6;
  void *v7;
  PKPeerPaymentPreferencesRestriction *v8;
  void *v9;
  NSSet *v10;
  NSSet *restrictions;
  id v12;

  v12 = a4;
  -[PKPeerPaymentPreferences restrictionsForAltDSID:](self, "restrictionsForAltDSID:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "setReceiveRestrictionType:", a3);
  }
  else
  {
    v8 = objc_alloc_init(PKPeerPaymentPreferencesRestriction);
    -[PKPeerPaymentPreferencesRestriction setReceiveRestrictionType:](v8, "setReceiveRestrictionType:", a3);
    -[PKPeerPaymentPreferencesRestriction setAltDSID:](v8, "setAltDSID:", v12);
    v9 = (void *)-[NSSet mutableCopy](self->_restrictions, "mutableCopy");
    objc_msgSend(v9, "addObject:", v8);
    v10 = (NSSet *)objc_msgSend(v9, "copy");
    restrictions = self->_restrictions;
    self->_restrictions = v10;

  }
}

- (void)didUpdateNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSSet *v10;
  NSSet *notifications;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    v5 = objc_msgSend(v4, "notificationType");
    objc_msgSend(v12, "altDSID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPeerPaymentPreferences notificationWithType:altDSID:](self, "notificationWithType:altDSID:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)-[NSSet mutableCopy](self->_notifications, "mutableCopy");
    v9 = v8;
    if (v7)
      objc_msgSend(v8, "removeObject:", v7);
    objc_msgSend(v9, "addObject:", v12);
    v10 = (NSSet *)objc_msgSend(v9, "copy");
    notifications = self->_notifications;
    self->_notifications = v10;

    v4 = v12;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentPreferences)initWithCoder:(id)a3
{
  id v4;
  PKPeerPaymentPreferences *v5;
  uint64_t v6;
  NSDate *lastUpdated;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSSet *restrictions;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSSet *notifications;
  uint64_t v18;
  PKPeerPaymentPreferencesProfileAppearance *profileAppearance;
  double v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentPreferences;
  v5 = -[PKPeerPaymentPreferences init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastUpdated"));
    v6 = objc_claimAutoreleasedReturnValue();
    lastUpdated = v5->_lastUpdated;
    v5->_lastUpdated = (NSDate *)v6;

    v5->_dirty = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("dirty"));
    v5->_requiresConfirmation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("requiresConfirmation"));
    v5->_canReceiveFormalPaymentRequests = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("canReceiveFormalPaymentRequests"));
    v8 = (void *)MEMORY[0x1E0C99E60];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("restrictions"));
    v11 = objc_claimAutoreleasedReturnValue();
    restrictions = v5->_restrictions;
    v5->_restrictions = (NSSet *)v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("notifications"));
    v16 = objc_claimAutoreleasedReturnValue();
    notifications = v5->_notifications;
    v5->_notifications = (NSSet *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profileAppearance"));
    v18 = objc_claimAutoreleasedReturnValue();
    profileAppearance = v5->_profileAppearance;
    v5->_profileAppearance = (PKPeerPaymentPreferencesProfileAppearance *)v18;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("proactivePreferencesFetchPeriod"));
    v5->_proactiveFetchPeriod = v20;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *lastUpdated;
  id v5;

  lastUpdated = self->_lastUpdated;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", lastUpdated, CFSTR("lastUpdated"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_dirty, CFSTR("dirty"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_requiresConfirmation, CFSTR("requiresConfirmation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canReceiveFormalPaymentRequests, CFSTR("canReceiveFormalPaymentRequests"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_notifications, CFSTR("notifications"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_restrictions, CFSTR("restrictions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profileAppearance, CFSTR("profileAppearance"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("proactivePreferencesFetchPeriod"), self->_proactiveFetchPeriod);

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPeerPaymentPreferences *v5;
  uint64_t v6;
  NSDate *lastUpdated;
  uint64_t v8;
  NSSet *notifications;
  uint64_t v10;
  NSSet *restrictions;
  PKPeerPaymentPreferencesProfileAppearance *v12;
  PKPeerPaymentPreferencesProfileAppearance *profileAppearance;

  v5 = -[PKPeerPaymentPreferences init](+[PKPeerPaymentPreferences allocWithZone:](PKPeerPaymentPreferences, "allocWithZone:"), "init");
  v6 = -[NSDate copyWithZone:](self->_lastUpdated, "copyWithZone:", a3);
  lastUpdated = v5->_lastUpdated;
  v5->_lastUpdated = (NSDate *)v6;

  v5->_dirty = self->_dirty;
  v5->_requiresConfirmation = self->_requiresConfirmation;
  v5->_canReceiveFormalPaymentRequests = self->_canReceiveFormalPaymentRequests;
  v8 = -[NSSet copyWithZone:](self->_notifications, "copyWithZone:", a3);
  notifications = v5->_notifications;
  v5->_notifications = (NSSet *)v8;

  v10 = -[NSSet copyWithZone:](self->_restrictions, "copyWithZone:", a3);
  restrictions = v5->_restrictions;
  v5->_restrictions = (NSSet *)v10;

  v12 = -[PKPeerPaymentPreferencesProfileAppearance copyWithZone:](self->_profileAppearance, "copyWithZone:", a3);
  profileAppearance = v5->_profileAppearance;
  v5->_profileAppearance = v12;

  v5->_proactiveFetchPeriod = self->_proactiveFetchPeriod;
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPeerPaymentPreferences *v4;
  PKPeerPaymentPreferences *v5;
  BOOL v6;

  v4 = (PKPeerPaymentPreferences *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPeerPaymentPreferences isEqualToPreferences:](self, "isEqualToPreferences:", v5);

  return v6;
}

- (BOOL)isEqualToPreferences:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  NSSet *notifications;
  NSSet *v7;
  NSSet *restrictions;
  NSSet *v9;
  PKPeerPaymentPreferencesProfileAppearance *profileAppearance;
  PKPeerPaymentPreferencesProfileAppearance *v11;
  BOOL v12;

  v4 = a3;
  v5 = v4;
  if (!v4
    || self->_requiresConfirmation != *((unsigned __int8 *)v4 + 8)
    || self->_canReceiveFormalPaymentRequests != *((unsigned __int8 *)v4 + 9)
    || self->_proactiveFetchPeriod != *((double *)v4 + 6))
  {
    goto LABEL_17;
  }
  notifications = self->_notifications;
  v7 = (NSSet *)v5[2];
  if (notifications && v7)
  {
    if ((-[NSSet isEqual:](notifications, "isEqual:") & 1) == 0)
      goto LABEL_17;
  }
  else if (notifications != v7)
  {
    goto LABEL_17;
  }
  restrictions = self->_restrictions;
  v9 = (NSSet *)v5[3];
  if (!restrictions || !v9)
  {
    if (restrictions == v9)
      goto LABEL_13;
LABEL_17:
    v12 = 0;
    goto LABEL_18;
  }
  if ((-[NSSet isEqual:](restrictions, "isEqual:") & 1) == 0)
    goto LABEL_17;
LABEL_13:
  profileAppearance = self->_profileAppearance;
  v11 = (PKPeerPaymentPreferencesProfileAppearance *)v5[4];
  if (profileAppearance && v11)
    v12 = -[PKPeerPaymentPreferencesProfileAppearance isEqual:](profileAppearance, "isEqual:");
  else
    v12 = profileAppearance == v11;
LABEL_18:

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_notifications);
  objc_msgSend(v3, "safelyAddObject:", self->_restrictions);
  objc_msgSend(v3, "safelyAddObject:", self->_profileAppearance);
  objc_msgSend(v3, "safelyAddObject:", self->_lastUpdated);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_dirty - v4 + 32 * v4;
  v6 = self->_requiresConfirmation - v5 + 32 * v5;
  v7 = self->_canReceiveFormalPaymentRequests - v6 + 32 * v6;
  v8 = (unint64_t)self->_proactiveFetchPeriod - v7 + 32 * v7;

  return v8;
}

- (id)description
{
  void *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("lastUpdated: '%@'; "), self->_lastUpdated);
  if (self->_dirty)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("dirty: '%@'; "), v4);
  if (self->_requiresConfirmation)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("requiresConfirmation: '%@'; "), v5);
  if (self->_canReceiveFormalPaymentRequests)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("canReceiveFormalPaymentRequests: '%@'; "), v6);
  objc_msgSend(v3, "appendFormat:", CFSTR("notifications: '%@'; "), self->_notifications);
  objc_msgSend(v3, "appendFormat:", CFSTR("restrictions: '%@'; "), self->_restrictions);
  objc_msgSend(v3, "appendFormat:", CFSTR("profileAppearance: '%@'; "), self->_profileAppearance);
  objc_msgSend(v3, "appendFormat:", CFSTR("proactiveFetchPeriod: '%lf'; "), *(_QWORD *)&self->_proactiveFetchPeriod);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)requiresConfirmation
{
  return self->_requiresConfirmation;
}

- (void)setRequiresConfirmation:(BOOL)a3
{
  self->_requiresConfirmation = a3;
}

- (BOOL)canReceiveFormalPaymentRequests
{
  return self->_canReceiveFormalPaymentRequests;
}

- (void)setCanReceiveFormalPaymentRequests:(BOOL)a3
{
  self->_canReceiveFormalPaymentRequests = a3;
}

- (NSSet)notifications
{
  return self->_notifications;
}

- (void)setNotifications:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSSet)restrictions
{
  return self->_restrictions;
}

- (void)setRestrictions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (PKPeerPaymentPreferencesProfileAppearance)profileAppearance
{
  return self->_profileAppearance;
}

- (void)setProfileAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isDirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (NSDate)lastUpdated
{
  return self->_lastUpdated;
}

- (void)setLastUpdated:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdated, a3);
}

- (double)proactiveFetchPeriod
{
  return self->_proactiveFetchPeriod;
}

- (void)setProactiveFetchPeriod:(double)a3
{
  self->_proactiveFetchPeriod = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdated, 0);
  objc_storeStrong((id *)&self->_profileAppearance, 0);
  objc_storeStrong((id *)&self->_restrictions, 0);
  objc_storeStrong((id *)&self->_notifications, 0);
}

@end
