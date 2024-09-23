@implementation SFAirDropTransfer

- (SFAirDropTransfer)initWithIdentifier:(id)a3 initialInformation:(id)a4
{
  id v6;
  id v7;
  SFAirDropTransfer *v8;
  SFAirDropTransfer *v9;
  uint64_t v10;
  NSString *identifier;
  NSObject *v12;
  NSString *v13;
  SFAirDropTransferMetaData *v14;
  SFAirDropTransferMetaData *metaData;
  objc_super v17;
  uint8_t buf[4];
  NSString *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SFAirDropTransfer;
  v8 = -[SFAirDropTransfer init](&v17, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_usedByTransferManager = 1;
    v10 = objc_msgSend(v6, "copy");
    identifier = v9->_identifier;
    v9->_identifier = (NSString *)v10;

    if (v9->_usedByTransferManager)
    {
      airdrop_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = v9->_identifier;
        *(_DWORD *)buf = 138543618;
        v19 = v13;
        v20 = 2112;
        v21 = v7;
        _os_log_impl(&dword_1A2830000, v12, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] Initialized with initial information: %@", buf, 0x16u);
      }

    }
    v9->_transferState = 0;
    v14 = -[SFAirDropTransferMetaData initWithInformation:]([SFAirDropTransferMetaData alloc], "initWithInformation:", v7);
    metaData = v9->_metaData;
    v9->_metaData = v14;

    -[SFAirDropTransfer updateWithInformation:](v9, "updateWithInformation:", v7);
    -[SFAirDropTransfer setUpProgressToBroadcast:](v9, "setUpProgressToBroadcast:", v9->_usedByTransferManager);
  }

  return v9;
}

- (SFAirDropTransfer)initWithIdentifier:(id)a3 metaData:(id)a4 userResponse:(unint64_t)a5 transferState:(unint64_t)a6 failureReason:(unint64_t)a7 error:(id)a8 customDestinationURL:(id)a9 contentsTitle:(id)a10 contentsDescription:(id)a11 selectedAction:(id)a12 possibleActions:(id)a13 cancelAction:(id)a14 completedURLs:(id)a15
{
  id v18;
  id v19;
  id v20;
  id v21;
  SFAirDropTransfer *v22;
  SFAirDropTransfer *v23;
  SFAirDropTransfer *v24;
  id obj;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a3;
  obj = a4;
  v35 = a4;
  v34 = a8;
  v33 = a9;
  v32 = a10;
  v31 = a11;
  v18 = a12;
  v19 = a13;
  v20 = a14;
  v21 = a15;
  v37.receiver = self;
  v37.super_class = (Class)SFAirDropTransfer;
  v22 = -[SFAirDropTransfer init](&v37, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_identifier, a3);
    objc_storeStrong((id *)&v23->_metaData, obj);
    v23->_userResponse = a5;
    v23->_transferState = a6;
    v23->_failureReason = a7;
    objc_storeStrong((id *)&v23->_error, a8);
    objc_storeStrong((id *)&v23->_customDestinationURL, a9);
    objc_storeStrong((id *)&v23->_contentsTitle, a10);
    objc_storeStrong((id *)&v23->_contentsDescription, a11);
    objc_storeStrong((id *)&v23->_selectedAction, a12);
    objc_storeStrong((id *)&v23->_possibleActions, a13);
    objc_storeStrong((id *)&v23->_cancelAction, a14);
    objc_storeStrong((id *)&v23->_completedURLs, a15);
    v24 = v23;
  }

  return v23;
}

- (void)setUpProgress
{
  -[SFAirDropTransfer setUpProgressToBroadcast:](self, "setUpProgressToBroadcast:", 0);
}

- (void)setUpProgressToBroadcast:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSProgress *v18;
  NSProgress *transferProgress;
  id *v20;
  id *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  id location;
  _QWORD v33[3];
  _QWORD v34[4];

  v3 = a3;
  v34[3] = *MEMORY[0x1E0C80C00];
  SFAirDropDownloadsURL();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.AirDrop"), 1);
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject URLByAppendingPathComponent:isDirectory:](v7, "URLByAppendingPathComponent:isDirectory:", self->_identifier, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    location = 0;
    objc_initWeak(&location, self);
    v9 = (void *)MEMORY[0x1E0CB38A8];
    if (v3)
    {
      v10 = objc_alloc(MEMORY[0x1E0CB38A8]);
      v11 = *MEMORY[0x1E0CB30C8];
      v33[0] = *MEMORY[0x1E0CB30F0];
      v33[1] = v11;
      v12 = *MEMORY[0x1E0CB30D0];
      v34[0] = v8;
      v34[1] = v12;
      v33[2] = *MEMORY[0x1E0CB30E8];
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[SFAirDropTransfer metaData](self, "metaData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "rawFiles");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34[2] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (NSProgress *)objc_msgSend(v10, "initWithParent:userInfo:", 0, v17);
      transferProgress = self->_transferProgress;
      self->_transferProgress = v18;

      -[NSProgress setCancellable:](self->_transferProgress, "setCancellable:", 1);
      -[NSProgress setPausable:](self->_transferProgress, "setPausable:", 0);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke;
      v29[3] = &unk_1E482DBA8;
      v20 = &v31;
      objc_copyWeak(&v31, &location);
      v30 = v8;
      -[NSProgress setCancellationHandler:](self->_transferProgress, "setCancellationHandler:", v29);
      -[NSProgress publish](self->_transferProgress, "publish");
      v21 = &v30;
    }
    else
    {
      v23 = MEMORY[0x1E0C809B0];
      v24 = 3221225472;
      v25 = __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke_101;
      v26 = &unk_1E482F218;
      v20 = &v28;
      objc_copyWeak(&v28, &location);
      v27 = v8;
      objc_msgSend(v9, "addSubscriberForFileURL:withPublishingHandler:", v27, &v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirDropTransfer setProgressToken:](self, "setProgressToken:", v22, v23, v24, v25, v26);

      v21 = &v27;
    }

    objc_destroyWeak(v20);
    objc_destroyWeak(&location);

LABEL_9:
    goto LABEL_10;
  }
  if (self->_usedByTransferManager)
  {
    airdrop_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SFAirDropTransfer setUpProgressToBroadcast:].cold.1((uint64_t)self, v7);
    goto LABEL_9;
  }
LABEL_10:

}

void __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  void *v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  airdrop_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543619;
    v8 = v4;
    v9 = 2113;
    v10 = v5;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_INFO, "[Transfer: %{public}@]: SFAirDropTransfer: cancellation handler called %{private}@", (uint8_t *)&v7, 0x16u);

  }
  v6 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v6, "setUserResponse:", 2);

}

id __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke_101(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;
  void *v6;
  _QWORD v8[5];
  id v9;

  v3 = (id *)(a1 + 40);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setTransferProgress:", v4);

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke_2;
  v8[3] = &unk_1E482D3A0;
  v8[4] = WeakRetained;
  v9 = *(id *)(a1 + 32);
  v6 = _Block_copy(v8);

  return v6;
}

void __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  airdrop_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v3;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1A2830000, v2, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] Progress unpublished for transfer at %@", (uint8_t *)&v9, 0x16u);

  }
  v6 = *(void **)(a1 + 32);
  v5 = (id *)(a1 + 32);
  objc_msgSend(v6, "progressToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v5, "setProgressToken:", 0);
  if (v7)
  {
    objc_msgSend(*v5, "setTransferProgress:", 0);
  }
  else
  {
    airdrop_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke_2_cold_1(v5, v8);

  }
}

- (BOOL)isJustFiles
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  BOOL v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SFAirDropTransfer metaData](self, "metaData", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "isFile"))
        {
          v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
  v8 = 1;
LABEL_11:

  return v8;
}

- (unint64_t)itemCount
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SFAirDropTransfer metaData](self, "metaData", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "items");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v3);
        v6 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "count");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_progressToken)
    objc_msgSend(MEMORY[0x1E0CB38A8], "removeSubscriber:");
  -[NSProgress unpublish](self->_transferProgress, "unpublish");
  v3.receiver = self;
  v3.super_class = (Class)SFAirDropTransfer;
  -[SFAirDropTransfer dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  objc_opt_class();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "updateWithTransfer:", self);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirDropTransfer)initWithCoder:(id)a3
{
  id v4;
  SFAirDropTransfer *v5;
  SFAirDropTransfer *v6;

  v4 = a3;
  v5 = -[SFAirDropTransfer init](self, "init");
  v6 = v5;
  if (v5)
    -[SFAirDropTransfer updateUsingCoder:](v5, "updateUsingCoder:", v4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metaData, CFSTR("metaData"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_userResponse, CFSTR("userResponse"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_transferState, CFSTR("transferState"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_failureReason, CFSTR("failureReason"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentsTitle, CFSTR("contentsTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contentsDescription, CFSTR("contentsDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_selectedAction, CFSTR("selectedAction"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_possibleActions, CFSTR("possibleActions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_cancelAction, CFSTR("cancelAction"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_willOpenInMRQL, CFSTR("willOpenInMRQL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_completedURLs, CFSTR("completedURLs"));

}

- (id)description
{
  id v3;
  id v4;
  unint64_t userResponse;
  const __CFString *v6;
  id v7;
  const char *v8;
  id v9;
  const char *v10;
  id v11;
  SFAirDropAction *selectedAction;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v18;
  const __CFString *v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  NSString *identifier;
  id v24;

  objc_opt_class();
  identifier = self->_identifier;
  NSAppendPrintF();
  v24 = 0;
  SFAirDropTransferStateToString(self->_transferState);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF();
  v3 = v24;

  if (self->_transferState == 9)
  {
    NSAppendPrintF();
    v4 = v3;

    NSAppendPrintF();
    v3 = v4;

  }
  userResponse = self->_userResponse;
  if (userResponse > 3)
    v6 = CFSTR("Unknown");
  else
    v6 = off_1E482F238[userResponse];
  v19 = v6;
  NSAppendPrintF();
  v7 = v3;

  if (-[SFAirDropTransfer needsAction](self, "needsAction", v19, identifier))
    v8 = "yes";
  else
    v8 = "no";
  v20 = v8;
  NSAppendPrintF();
  v9 = v7;

  if (-[SFAirDropTransfer willOpenInMRQL](self, "willOpenInMRQL", v20))
    v10 = "yes";
  else
    v10 = "no";
  v21 = v10;
  NSAppendPrintF();
  v11 = v9;

  selectedAction = self->_selectedAction;
  if (selectedAction)
  {
    -[SFAirDropAction localizedTitle](selectedAction, "localizedTitle", v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v14 = v11;
  }
  else
  {
    -[NSArray valueForKeyPath:](self->_possibleActions, "valueForKeyPath:", CFSTR("@unionOfObjects.localizedTitle"), v21);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SFCompactStringFromCollection(v13);
    v22 = objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v14 = v11;

    v11 = (id)v22;
  }

  NSAppendPrintF();
  v15 = v14;

  NSAppendPrintF();
  v16 = v15;

  return v16;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SFAirDropTransfer identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SFAirDropTransfer *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (SFAirDropTransfer *)a3;
  if (self == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SFAirDropTransfer identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirDropTransfer identifier](v4, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (BOOL)updateWithTransfer:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0CB36F8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initRequiringSecureCoding:", 1);
  objc_msgSend(v5, "encodeWithCoder:", v6);

  v7 = objc_alloc(MEMORY[0x1E0CB3710]);
  objc_msgSend(v6, "encodedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initForReadingFromData:error:", v8, 0);

  LOBYTE(self) = -[SFAirDropTransfer updateUsingCoder:](self, "updateUsingCoder:", v9);
  objc_msgSend(v9, "finishDecoding");

  return (char)self;
}

- (BOOL)updateUsingCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  int v32;
  void *v33;
  void *v34;
  uint64_t v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v44;
  int v45;
  int v46;
  int v47;
  BOOL v48;
  BOOL v49;
  BOOL v50;
  int v51;
  int v52;
  _QWORD v53[2];
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SFAirDropTransfer identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropTransfer setIdentifier:](self, "setIdentifier:", v6);

  -[SFAirDropTransfer identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = SFNilEqual((unint64_t)v5, (uint64_t)v7);

  -[SFAirDropTransfer metaData](self, "metaData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metaData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropTransfer setMetaData:](self, "setMetaData:", v9);

  -[SFAirDropTransfer metaData](self, "metaData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = SFNilEqual((unint64_t)v8, (uint64_t)v10);

  v11 = -[SFAirDropTransfer userResponse](self, "userResponse");
  -[SFAirDropTransfer setUserResponse:](self, "setUserResponse:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("userResponse")));
  v50 = v11 != -[SFAirDropTransfer userResponse](self, "userResponse");
  v12 = -[SFAirDropTransfer transferState](self, "transferState");
  -[SFAirDropTransfer setTransferState:](self, "setTransferState:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("transferState")));
  v49 = v12 != -[SFAirDropTransfer transferState](self, "transferState");
  v13 = -[SFAirDropTransfer failureReason](self, "failureReason");
  -[SFAirDropTransfer setFailureReason:](self, "setFailureReason:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("failureReason")));
  v48 = v13 != -[SFAirDropTransfer failureReason](self, "failureReason");
  -[SFAirDropTransfer error](self, "error");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropTransfer setError:](self, "setError:", v15);

  -[SFAirDropTransfer error](self, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = SFNilEqual((unint64_t)v14, (uint64_t)v16);

  -[SFAirDropTransfer contentsTitle](self, "contentsTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentsTitle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropTransfer setContentsTitle:](self, "setContentsTitle:", v18);

  -[SFAirDropTransfer contentsTitle](self, "contentsTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = SFNilEqual((unint64_t)v17, (uint64_t)v19);

  -[SFAirDropTransfer contentsDescription](self, "contentsDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentsDescription"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropTransfer setContentsDescription:](self, "setContentsDescription:", v21);

  -[SFAirDropTransfer contentsDescription](self, "contentsDescription");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = SFNilEqual((unint64_t)v20, (uint64_t)v22);

  -[SFAirDropTransfer selectedAction](self, "selectedAction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("selectedAction"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropTransfer setSelectedAction:](self, "setSelectedAction:", v24);

  -[SFAirDropTransfer selectedAction](self, "selectedAction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = SFNilEqual((unint64_t)v23, (uint64_t)v25);

  -[SFAirDropTransfer possibleActions](self, "possibleActions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)MEMORY[0x1E0C99E60];
  v54[0] = objc_opt_class();
  v54[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setWithArray:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("possibleActions"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropTransfer setPossibleActions:](self, "setPossibleActions:", v30);

  -[SFAirDropTransfer possibleActions](self, "possibleActions");
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = SFNilEqual((unint64_t)v26, v31);

  -[SFAirDropTransfer cancelAction](self, "cancelAction");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cancelAction"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropTransfer setCancelAction:](self, "setCancelAction:", v34);

  -[SFAirDropTransfer cancelAction](self, "cancelAction");
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = SFNilEqual((unint64_t)v33, v35);

  LOBYTE(v35) = -[SFAirDropTransfer willOpenInMRQL](self, "willOpenInMRQL");
  -[SFAirDropTransfer setWillOpenInMRQL:](self, "setWillOpenInMRQL:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("willOpenInMRQL")));
  LOBYTE(v31) = -[SFAirDropTransfer willOpenInMRQL](self, "willOpenInMRQL");
  -[SFAirDropTransfer completedURLs](self, "completedURLs");
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = (void *)MEMORY[0x1E0C99E60];
  v53[0] = objc_opt_class();
  v53[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setWithArray:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("completedURLs"));
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAirDropTransfer setCompletedURLs:](self, "setCompletedURLs:", v41);
  -[SFAirDropTransfer completedURLs](self, "completedURLs");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = SFNilEqual((unint64_t)v37, (uint64_t)v42);

  return (v50 || (v52 & v51 & 1) == 0 || v49 || v48 || (v47 & v46 & v45 & v44 & v32 & v36 & 1) == 0) | (v35 ^ v31) & 1 | ((self & 1) == 0);
}

- (void)updateWithInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSString *identifier;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSString *v15;
  void *v16;
  void *v17;
  int v18;
  NSString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Items"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropTransfer setCompletedURLs:](self, "setCompletedURLs:", v5);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Error"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAirDropTransfer setError:](self, "setError:", v6);

  -[SFAirDropTransfer error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && self->_usedByTransferManager)
  {
    airdrop_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      identifier = self->_identifier;
      -[SFAirDropTransfer error](self, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = identifier;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] updateWithInformation: Error was set: %@", (uint8_t *)&v18, 0x16u);

    }
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TotalBytes"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
    -[NSProgress setTotalUnitCount:](self->_transferProgress, "setTotalUnitCount:", objc_msgSend(v11, "longLongValue"));
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("BytesCopied"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (self->_usedByTransferManager)
    {
      airdrop_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = self->_identifier;
        v18 = 138543874;
        v19 = v15;
        v20 = 2112;
        v21 = v13;
        v22 = 2112;
        v23 = v12;
        _os_log_impl(&dword_1A2830000, v14, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] Updating completedUnitCount: %@ bytesCopied / %@ totalBytes", (uint8_t *)&v18, 0x20u);
      }

    }
    -[NSProgress setCompletedUnitCount:](self->_transferProgress, "setCompletedUnitCount:", objc_msgSend(v13, "longLongValue"));
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TimeRemaining"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    -[NSProgress setUserInfoObject:forKey:](self->_transferProgress, "setUserInfoObject:forKey:", v16, *MEMORY[0x1E0CB3078]);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FilesCopied"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    -[NSProgress setUserInfoObject:forKey:](self->_transferProgress, "setUserInfoObject:forKey:", v17, *MEMORY[0x1E0CB3080]);

}

+ (BOOL)automaticallyNotifiesObserversOfUserResponse
{
  return 0;
}

- (void)setUserResponse:(unint64_t)a3
{
  unint64_t userResponse;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  NSString *v9;
  void *v10;
  NSObject *v11;
  NSString *identifier;
  int v13;
  NSString *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  userResponse = self->_userResponse;
  if (userResponse != a3)
  {
    if (userResponse > 3)
      v6 = CFSTR("Unknown");
    else
      v6 = off_1E482F238[userResponse];
    if (a3 > 3)
      v7 = CFSTR("Unknown");
    else
      v7 = off_1E482F238[a3];
    if (self->_userResponse >= a3)
    {
      if (!self->_usedByTransferManager)
        return;
      airdrop_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        identifier = self->_identifier;
        v13 = 138543874;
        v14 = identifier;
        v15 = 2112;
        v16 = v6;
        v17 = 2112;
        v18 = v7;
        _os_log_error_impl(&dword_1A2830000, v11, OS_LOG_TYPE_ERROR, "[Transfer: %{public}@] Cannot change userResponse from %@ to %@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      if (self->_usedByTransferManager)
      {
        airdrop_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = self->_identifier;
          v13 = 138543874;
          v14 = v9;
          v15 = 2112;
          v16 = v6;
          v17 = 2112;
          v18 = v7;
          _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] Changing user response from %@ to %@", (uint8_t *)&v13, 0x20u);
        }

      }
      NSStringFromSelector(sel_userResponse);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirDropTransfer willChangeValueForKey:](self, "willChangeValueForKey:", v10);

      self->_userResponse = a3;
      NSStringFromSelector(sel_userResponse);
      v11 = objc_claimAutoreleasedReturnValue();
      -[SFAirDropTransfer didChangeValueForKey:](self, "didChangeValueForKey:", v11);
    }

  }
}

+ (BOOL)automaticallyNotifiesObserversOfTransferState
{
  return 0;
}

- (void)setTransferState:(unint64_t)a3
{
  unint64_t transferState;
  void *v6;
  void *v7;
  NSObject *v8;
  NSString *v9;
  void *v10;
  NSObject *v11;
  NSString *identifier;
  int v13;
  NSString *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  transferState = self->_transferState;
  if (transferState != a3)
  {
    SFAirDropTransferStateToString(transferState);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SFAirDropTransferStateToString(a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_transferState >= a3)
    {
      if (!self->_usedByTransferManager)
      {
LABEL_12:

        return;
      }
      airdrop_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        identifier = self->_identifier;
        v13 = 138543874;
        v14 = identifier;
        v15 = 2112;
        v16 = v6;
        v17 = 2112;
        v18 = v7;
        _os_log_error_impl(&dword_1A2830000, v11, OS_LOG_TYPE_ERROR, "[Transfer: %{public}@] Cannot change transferState from %@ to %@", (uint8_t *)&v13, 0x20u);
      }
    }
    else
    {
      if (self->_usedByTransferManager)
      {
        airdrop_log();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          v9 = self->_identifier;
          v13 = 138543874;
          v14 = v9;
          v15 = 2112;
          v16 = v6;
          v17 = 2112;
          v18 = v7;
          _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] Changing transfer state from %@ to %@", (uint8_t *)&v13, 0x20u);
        }

      }
      NSStringFromSelector(sel_transferState);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFAirDropTransfer willChangeValueForKey:](self, "willChangeValueForKey:", v10);

      self->_transferState = a3;
      NSStringFromSelector(sel_transferState);
      v11 = objc_claimAutoreleasedReturnValue();
      -[SFAirDropTransfer didChangeValueForKey:](self, "didChangeValueForKey:", v11);
    }

    goto LABEL_12;
  }
}

+ (BOOL)automaticallyNotifiesObserversOfFailureReason
{
  return 0;
}

- (void)setFailureReason:(unint64_t)a3
{
  unint64_t failureReason;
  const __CFString *v6;
  const __CFString *v7;
  NSObject *v8;
  NSString *identifier;
  void *v10;
  void *v11;
  int v12;
  NSString *v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  failureReason = self->_failureReason;
  if (failureReason != a3)
  {
    if (failureReason - 1 > 2)
      v6 = CFSTR("Unknown");
    else
      v6 = off_1E482F258[failureReason - 1];
    if (a3 - 1 > 2)
      v7 = CFSTR("Unknown");
    else
      v7 = off_1E482F258[a3 - 1];
    if (self->_usedByTransferManager)
    {
      airdrop_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        identifier = self->_identifier;
        v12 = 138543874;
        v13 = identifier;
        v14 = 2112;
        v15 = v6;
        v16 = 2112;
        v17 = v7;
        _os_log_impl(&dword_1A2830000, v8, OS_LOG_TYPE_INFO, "[Transfer: %{public}@] Setting failure reason from %@ to %@", (uint8_t *)&v12, 0x20u);
      }

    }
    NSStringFromSelector(sel_failureReason);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropTransfer willChangeValueForKey:](self, "willChangeValueForKey:", v10);

    self->_failureReason = a3;
    NSStringFromSelector(sel_failureReason);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFAirDropTransfer didChangeValueForKey:](self, "didChangeValueForKey:", v11);

  }
}

+ (id)keyPathsForValuesAffectingNeedsAction
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  NSStringFromSelector(sel_selectedAction);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v3;
  NSStringFromSelector(sel_possibleActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v4;
  NSStringFromSelector(sel_userResponse);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)needsAction
{
  void *v3;
  BOOL v4;
  void *v5;

  -[SFAirDropTransfer selectedAction](self, "selectedAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[SFAirDropTransfer userResponse](self, "userResponse") == 0;
  }
  else
  {
    -[SFAirDropTransfer possibleActions](self, "possibleActions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      v4 = 1;
    else
      v4 = -[SFAirDropTransfer userResponse](self, "userResponse") == 0;

  }
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (SFAirDropTransferMetaData)metaData
{
  return self->_metaData;
}

- (void)setMetaData:(id)a3
{
  objc_storeStrong((id *)&self->_metaData, a3);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (NSProgress)transferProgress
{
  return self->_transferProgress;
}

- (void)setTransferProgress:(id)a3
{
  objc_storeStrong((id *)&self->_transferProgress, a3);
}

- (NSString)contentsTitle
{
  return self->_contentsTitle;
}

- (void)setContentsTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)contentsDescription
{
  return self->_contentsDescription;
}

- (void)setContentsDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (SFAirDropAction)selectedAction
{
  return self->_selectedAction;
}

- (void)setSelectedAction:(id)a3
{
  objc_storeStrong((id *)&self->_selectedAction, a3);
}

- (NSArray)possibleActions
{
  return self->_possibleActions;
}

- (void)setPossibleActions:(id)a3
{
  objc_storeStrong((id *)&self->_possibleActions, a3);
}

- (SFAirDropAction)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
  objc_storeStrong((id *)&self->_cancelAction, a3);
}

- (BOOL)willOpenInMRQL
{
  return self->_willOpenInMRQL;
}

- (void)setWillOpenInMRQL:(BOOL)a3
{
  self->_willOpenInMRQL = a3;
}

- (NSArray)completedURLs
{
  return self->_completedURLs;
}

- (void)setCompletedURLs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSArray)sensitiveURLs
{
  return self->_sensitiveURLs;
}

- (unint64_t)userResponse
{
  return self->_userResponse;
}

- (unint64_t)transferState
{
  return self->_transferState;
}

- (unint64_t)failureReason
{
  return self->_failureReason;
}

- (NSURL)customDestinationURL
{
  return self->_customDestinationURL;
}

- (void)setCustomDestinationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)progressToken
{
  return self->_progressToken;
}

- (void)setProgressToken:(id)a3
{
  objc_storeStrong(&self->_progressToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressToken, 0);
  objc_storeStrong((id *)&self->_customDestinationURL, 0);
  objc_storeStrong((id *)&self->_sensitiveURLs, 0);
  objc_storeStrong((id *)&self->_completedURLs, 0);
  objc_storeStrong((id *)&self->_possibleActions, 0);
  objc_storeStrong((id *)&self->_selectedAction, 0);
  objc_storeStrong((id *)&self->_contentsDescription, 0);
  objc_storeStrong((id *)&self->_contentsTitle, 0);
  objc_storeStrong((id *)&self->_transferProgress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_metaData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_cancelAction, 0);
}

- (void)setUpProgressToBroadcast:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 24);
  v3 = 138543618;
  v4 = v2;
  v5 = 2114;
  v6 = v2;
  _os_log_error_impl(&dword_1A2830000, a2, OS_LOG_TYPE_ERROR, "[Transfer: %{public}@] [Transfer: %{public}@] Failed to set up progress object (Downloads URL not available)", (uint8_t *)&v3, 0x16u);
}

void __46__SFAirDropTransfer_setUpProgressToBroadcast___block_invoke_2_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1A2830000, a2, OS_LOG_TYPE_ERROR, "[Transfer: %{public}@] Progress token not available.", (uint8_t *)&v4, 0xCu);

}

@end
