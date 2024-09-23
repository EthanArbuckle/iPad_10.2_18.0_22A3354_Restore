@implementation WBSPasswordBreachQueuedPassword

- (id)initFakePasswordWithContext:(id)a3
{
  id v4;
  WBSPasswordBreachQueuedPassword *v5;
  void *v6;
  uint64_t v7;
  NSArray *persistentIdentifiers;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *bucketIdentifierAndHashStack;
  uint64_t v13;
  NSData *highFrequencyEncodedPassword;
  void *v15;
  int v16;
  NSObject *v17;
  WBSPasswordBreachQueuedPassword *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  objc_super v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)WBSPasswordBreachQueuedPassword;
  v5 = -[WBSPasswordBreachQueuedPassword init](&v36, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    persistentIdentifiers = v5->_persistentIdentifiers;
    v5->_persistentIdentifiers = (NSArray *)v7;

    objc_msgSend(v4, "cryptographicOperations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "generateFakeEncodedPasswordForLowFrequencyBucket");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v10);
      v11 = objc_claimAutoreleasedReturnValue();
      bucketIdentifierAndHashStack = v5->_bucketIdentifierAndHashStack;
      v5->_bucketIdentifierAndHashStack = (NSMutableArray *)v11;

      objc_msgSend(v9, "generateFakeEncodedPasswordForHighFrequencyBucket");
      v13 = objc_claimAutoreleasedReturnValue();
      highFrequencyEncodedPassword = v5->_highFrequencyEncodedPassword;
      v5->_highFrequencyEncodedPassword = (NSData *)v13;

      if (v5->_highFrequencyEncodedPassword)
      {
        objc_msgSend(v4, "configuration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "verboseSensitiveLoggingEnabled");

        if (v16)
        {
          v17 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            -[WBSPasswordBreachQueuedPassword initFakePasswordWithContext:].cold.3(v17, v5);
        }
        v18 = v5;
        goto LABEL_14;
      }
      v27 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[WBSPasswordBreachQueuedPassword initFakePasswordWithContext:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);
    }
    else
    {
      v19 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[WBSPasswordBreachQueuedPassword initFakePasswordWithContext:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
    }
    v18 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v18 = 0;
LABEL_15:

  return v18;
}

- (WBSPasswordBreachQueuedPassword)initWithCredentials:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  WBSPasswordBreachQueuedPassword *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSArray *persistentIdentifiers;
  NSArray *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSMutableArray *bucketIdentifierAndHashStack;
  uint64_t v25;
  NSData *highFrequencyEncodedPassword;
  void *v27;
  NSObject *v28;
  WBSPasswordBreachQueuedPassword *v29;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v36.receiver = self;
  v36.super_class = (Class)WBSPasswordBreachQueuedPassword;
  v8 = -[WBSPasswordBreachQueuedPassword init](&v36, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "cryptographicOperations");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "count");
    objc_msgSend(v6, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "password");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v33 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "persistentIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray addObject:](v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v15);
    }

    persistentIdentifiers = v8->_persistentIdentifiers;
    v8->_persistentIdentifiers = v12;
    v20 = v12;

    v21 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v31, "encodePasswordForLowFrequencyBucket:", v11);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "arrayWithObject:", v22);
    v23 = objc_claimAutoreleasedReturnValue();
    bucketIdentifierAndHashStack = v8->_bucketIdentifierAndHashStack;
    v8->_bucketIdentifierAndHashStack = (NSMutableArray *)v23;

    objc_msgSend(v31, "encodePasswordForHighFrequencyBucket:", v11);
    v25 = objc_claimAutoreleasedReturnValue();
    highFrequencyEncodedPassword = v8->_highFrequencyEncodedPassword;
    v8->_highFrequencyEncodedPassword = (NSData *)v25;

    objc_msgSend(v7, "configuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v21) = objc_msgSend(v27, "verboseSensitiveLoggingEnabled");

    if ((_DWORD)v21)
    {
      v28 = WBS_LOG_CHANNEL_PREFIXPasswordBreachAwareness();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        -[WBSPasswordBreachQueuedPassword initWithCredentials:context:].cold.1((uint64_t)v11, v28, v8);
    }
    v29 = v8;

  }
  return v8;
}

- (void)removeTopBucketIdentifierAndHash
{
  -[NSMutableArray removeLastObject](self->_bucketIdentifierAndHashStack, "removeLastObject");
}

- (void)pushBucketIdentifiersAndHashesFromQueuedPassword:(id)a3
{
  -[NSMutableArray addObjectsFromArray:](self->_bucketIdentifierAndHashStack, "addObjectsFromArray:", *((_QWORD *)a3 + 1));
}

- (WBSPair)topBucketIdentiferAndHash
{
  return (WBSPair *)-[NSMutableArray lastObject](self->_bucketIdentifierAndHashStack, "lastObject");
}

- (unint64_t)remainingHashCount
{
  return -[NSMutableArray count](self->_bucketIdentifierAndHashStack, "count");
}

- (NSData)highFrequencyEncodedPasswordData
{
  return self->_highFrequencyEncodedPassword;
}

- (NSUUID)uuid
{
  NSUUID *uuid;
  id v4;
  id v5;
  NSUUID *v6;
  NSUUID *v7;

  uuid = self->_uuid;
  if (!uuid)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[WBSPasswordBreachQueuedPassword highFrequencyEncodedPasswordData](self, "highFrequencyEncodedPasswordData");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (NSUUID *)objc_msgSend(v4, "initWithUUIDBytes:", objc_msgSend(v5, "bytes"));
    v7 = self->_uuid;
    self->_uuid = v6;

    uuid = self->_uuid;
  }
  return uuid;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p, persistentIdentifiers: %@, bucketIdentifierAndHashStack: %@, uuid: %@, highFrequencyEncodedPassword: %@>"), objc_opt_class(), self, self->_persistentIdentifiers, self->_bucketIdentifierAndHashStack, self->_uuid, self->_highFrequencyEncodedPassword);
}

- (NSArray)persistentIdentifiers
{
  return self->_persistentIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifiers, 0);
  objc_storeStrong((id *)&self->_highFrequencyEncodedPassword, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_bucketIdentifierAndHashStack, 0);
}

- (void)initFakePasswordWithContext:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Could not generate low frequency password.", a5, a6, a7, a8, 0);
}

- (void)initFakePasswordWithContext:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_0(&dword_1B2621000, a1, a3, "Could not generate high frequency password.", a5, a6, a7, a8, 0);
}

- (void)initFakePasswordWithContext:(void *)a1 .cold.3(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138739971;
  v6 = v4;
  _os_log_debug_impl(&dword_1B2621000, v3, OS_LOG_TYPE_DEBUG, "Generated password with UUID %{sensitive}@", (uint8_t *)&v5, 0xCu);

}

- (void)initWithCredentials:(void *)a3 context:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138740227;
  v8 = a1;
  v9 = 2117;
  v10 = v6;
  _os_log_debug_impl(&dword_1B2621000, v5, OS_LOG_TYPE_DEBUG, "Enqueued password \"%{sensitive}@\" with UUID %{sensitive}@", (uint8_t *)&v7, 0x16u);

}

@end
