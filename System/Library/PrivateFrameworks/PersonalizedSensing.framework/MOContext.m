@implementation MOContext

+ (id)fromBiome:(id)a3
{
  id v3;
  MOContext *v4;
  void *v5;
  void *v6;
  MOContext *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [MOContext alloc];
  objc_msgSend(v3, "contextIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextCreationTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOContext initWithContextIdentifier:contextCreationTimestamp:](v4, "initWithContextIdentifier:contextCreationTimestamp:", v5, v6);

  v8 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "contextStrings", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        +[MOContextString fromBiome:](MOContextString, "fromBiome:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[MOContext setContextStrings:](v7, "setContextStrings:", v8);
  -[MOContext setAssociatedPatternType:](v7, "setAssociatedPatternType:", objc_msgSend(v3, "associatedPatternType"));

  return v7;
}

- (MOContext)initWithContextIdentifier:(id)a3 contextCreationTimestamp:(id)a4
{
  id v7;
  id v8;
  MOContext *v9;
  MOContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MOContext;
  v9 = -[MOContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_contextIdentifier, a3);
    objc_storeStrong((id *)&v10->_contextCreationTimestamp, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *contextIdentifier;
  id v5;

  contextIdentifier = self->_contextIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contextIdentifier, CFSTR("contextIndentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextCreationTimestamp, CFSTR("contextCreationTimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextStrings, CFSTR("contextStrings"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedLocations, CFSTR("associatedLocations"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedContacts, CFSTR("associatedContacts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedActivities, CFSTR("associatedActivities"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedPhotos, CFSTR("associatedPhotos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedTime, CFSTR("associatedTime"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedMusic, CFSTR("associatedMusic"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_associatedPatternType, CFSTR("associatedPatternType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedRequestID, CFSTR("associatedRequestID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedBundleID, CFSTR("associatedBundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_associatedSuggestionID, CFSTR("associatedSuggestionID"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_actionType, CFSTR("actionType"));

}

- (MOContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MOContext *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSArray *contextStrings;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSArray *associatedLocations;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *associatedContacts;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *associatedActivities;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *associatedPhotos;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSArray *associatedTime;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSArray *associatedMusic;
  uint64_t v43;
  NSString *associatedRequestID;
  uint64_t v45;
  NSString *associatedBundleID;
  uint64_t v47;
  NSString *associatedSuggestionID;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextIndentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextCreationTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOContext initWithContextIdentifier:contextCreationTimestamp:](self, "initWithContextIdentifier:contextCreationTimestamp:", v5, v6);
  if (v7)
  {
    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("contextStrings"));
    v11 = objc_claimAutoreleasedReturnValue();
    contextStrings = v7->_contextStrings;
    v7->_contextStrings = (NSArray *)v11;

    v7->_associatedPatternType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("associatedPatternType"));
    v13 = (void *)MEMORY[0x24BDBCF20];
    v14 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("associatedLocations"));
    v16 = objc_claimAutoreleasedReturnValue();
    associatedLocations = v7->_associatedLocations;
    v7->_associatedLocations = (NSArray *)v16;

    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("associatedContacts"));
    v21 = objc_claimAutoreleasedReturnValue();
    associatedContacts = v7->_associatedContacts;
    v7->_associatedContacts = (NSArray *)v21;

    v23 = (void *)MEMORY[0x24BDBCF20];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("associatedActivities"));
    v26 = objc_claimAutoreleasedReturnValue();
    associatedActivities = v7->_associatedActivities;
    v7->_associatedActivities = (NSArray *)v26;

    v28 = (void *)MEMORY[0x24BDBCF20];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("associatedPhotos"));
    v31 = objc_claimAutoreleasedReturnValue();
    associatedPhotos = v7->_associatedPhotos;
    v7->_associatedPhotos = (NSArray *)v31;

    v33 = (void *)MEMORY[0x24BDBCF20];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("associatedTime"));
    v36 = objc_claimAutoreleasedReturnValue();
    associatedTime = v7->_associatedTime;
    v7->_associatedTime = (NSArray *)v36;

    v38 = (void *)MEMORY[0x24BDBCF20];
    v39 = objc_opt_class();
    objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("associatedMusic"));
    v41 = objc_claimAutoreleasedReturnValue();
    associatedMusic = v7->_associatedMusic;
    v7->_associatedMusic = (NSArray *)v41;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedRequestID"));
    v43 = objc_claimAutoreleasedReturnValue();
    associatedRequestID = v7->_associatedRequestID;
    v7->_associatedRequestID = (NSString *)v43;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedBundleID"));
    v45 = objc_claimAutoreleasedReturnValue();
    associatedBundleID = v7->_associatedBundleID;
    v7->_associatedBundleID = (NSString *)v45;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("associatedSuggestionID"));
    v47 = objc_claimAutoreleasedReturnValue();
    associatedSuggestionID = v7->_associatedSuggestionID;
    v7->_associatedSuggestionID = (NSString *)v47;

    v7->_actionType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("actionType"));
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSUUID *contextIdentifier;
  void *v7;
  NSDate *contextCreationTimestamp;
  void *v9;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());
  contextIdentifier = self->_contextIdentifier;
  objc_msgSend(v4, "contextIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(contextIdentifier) = -[NSUUID isEqual:](contextIdentifier, "isEqual:", v7);

  contextCreationTimestamp = self->_contextCreationTimestamp;
  objc_msgSend(v4, "contextCreationTimestamp");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(contextCreationTimestamp) = -[NSDate isEqual:](contextCreationTimestamp, "isEqual:", v9);
  return v5 & contextIdentifier & contextCreationTimestamp;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MOContext contextIdentifier](self, "contextIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext contextCreationTimestamp](self, "contextCreationTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext associatedRequestID](self, "associatedRequestID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext associatedBundleID](self, "associatedBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext associatedSuggestionID](self, "associatedSuggestionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext contextStrings](self, "contextStrings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("contextIdentifier, %@, contextCreationTimestamp, %@, associated request ID, %@, associated bundle ID, %@, associated suggestion ID, %@, contextStrings, %@, actionType, %lu "), v4, v5, v6, v7, v8, v9, -[MOContext actionType](self, "actionType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOContext *v4;
  void *v5;
  void *v6;
  MOContext *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v4 = [MOContext alloc];
  -[MOContext contextIdentifier](self, "contextIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext contextCreationTimestamp](self, "contextCreationTimestamp");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MOContext initWithContextIdentifier:contextCreationTimestamp:](v4, "initWithContextIdentifier:contextCreationTimestamp:", v5, v6);

  -[MOContext contextStrings](self, "contextStrings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext setContextStrings:](v7, "setContextStrings:", v8);

  -[MOContext setAssociatedPatternType:](v7, "setAssociatedPatternType:", -[MOContext associatedPatternType](self, "associatedPatternType"));
  -[MOContext associatedLocations](self, "associatedLocations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext setAssociatedLocations:](v7, "setAssociatedLocations:", v9);

  -[MOContext associatedContacts](self, "associatedContacts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext setAssociatedContacts:](v7, "setAssociatedContacts:", v10);

  -[MOContext associatedActivities](self, "associatedActivities");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext setAssociatedActivities:](v7, "setAssociatedActivities:", v11);

  -[MOContext associatedPhotos](self, "associatedPhotos");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext setAssociatedPhotos:](v7, "setAssociatedPhotos:", v12);

  -[MOContext associatedTime](self, "associatedTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext setAssociatedTime:](v7, "setAssociatedTime:", v13);

  -[MOContext associatedMusic](self, "associatedMusic");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext setAssociatedMusic:](v7, "setAssociatedMusic:", v14);

  -[MOContext associatedRequestID](self, "associatedRequestID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext setAssociatedRequestID:](v7, "setAssociatedRequestID:", v15);

  -[MOContext associatedBundleID](self, "associatedBundleID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext setAssociatedBundleID:](v7, "setAssociatedBundleID:", v16);

  -[MOContext associatedSuggestionID](self, "associatedSuggestionID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContext setAssociatedSuggestionID:](v7, "setAssociatedSuggestionID:", v17);

  -[MOContext setActionType:](v7, "setActionType:", -[MOContext actionType](self, "actionType"));
  return v7;
}

- (NSUUID)contextIdentifier
{
  return self->_contextIdentifier;
}

- (NSArray)contextStrings
{
  return self->_contextStrings;
}

- (void)setContextStrings:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDate)contextCreationTimestamp
{
  return self->_contextCreationTimestamp;
}

- (unint64_t)associatedPatternType
{
  return self->_associatedPatternType;
}

- (void)setAssociatedPatternType:(unint64_t)a3
{
  self->_associatedPatternType = a3;
}

- (NSArray)associatedLocations
{
  return self->_associatedLocations;
}

- (void)setAssociatedLocations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)associatedContacts
{
  return self->_associatedContacts;
}

- (void)setAssociatedContacts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)associatedActivities
{
  return self->_associatedActivities;
}

- (void)setAssociatedActivities:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)associatedPhotos
{
  return self->_associatedPhotos;
}

- (void)setAssociatedPhotos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)associatedTime
{
  return self->_associatedTime;
}

- (void)setAssociatedTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)associatedMusic
{
  return self->_associatedMusic;
}

- (void)setAssociatedMusic:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (NSString)associatedRequestID
{
  return self->_associatedRequestID;
}

- (void)setAssociatedRequestID:(id)a3
{
  objc_storeStrong((id *)&self->_associatedRequestID, a3);
}

- (NSString)associatedBundleID
{
  return self->_associatedBundleID;
}

- (void)setAssociatedBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_associatedBundleID, a3);
}

- (NSString)associatedSuggestionID
{
  return self->_associatedSuggestionID;
}

- (void)setAssociatedSuggestionID:(id)a3
{
  objc_storeStrong((id *)&self->_associatedSuggestionID, a3);
}

- (NSUUID)bundleContentIdentifier
{
  return self->_bundleContentIdentifier;
}

- (void)setBundleContentIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleContentIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleContentIdentifier, 0);
  objc_storeStrong((id *)&self->_associatedSuggestionID, 0);
  objc_storeStrong((id *)&self->_associatedBundleID, 0);
  objc_storeStrong((id *)&self->_associatedRequestID, 0);
  objc_storeStrong((id *)&self->_associatedMusic, 0);
  objc_storeStrong((id *)&self->_associatedTime, 0);
  objc_storeStrong((id *)&self->_associatedPhotos, 0);
  objc_storeStrong((id *)&self->_associatedActivities, 0);
  objc_storeStrong((id *)&self->_associatedContacts, 0);
  objc_storeStrong((id *)&self->_associatedLocations, 0);
  objc_storeStrong((id *)&self->_contextCreationTimestamp, 0);
  objc_storeStrong((id *)&self->_contextStrings, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
}

@end
