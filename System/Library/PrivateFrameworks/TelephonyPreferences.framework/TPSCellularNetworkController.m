@implementation TPSCellularNetworkController

- (TPSCellularNetworkController)init
{
  -[TPSCellularNetworkController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (TPSCellularNetworkController)initWithSubscriptionContext:(id)a3
{
  id v5;
  TPSCellularNetworkController *v6;
  TPSCellularNetworkController *v7;
  TPSRegistrationTelephonyController *v8;
  TPSRegistrationTelephonyController *registrationController;
  uint64_t v10;
  CTNetworkSelectionInfo *networkSelectionInfo;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TPSCellularNetworkController;
  v6 = -[TPSCellularNetworkController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_subscriptionContext, a3);
    v8 = -[TPSRegistrationTelephonyController initWithSubscriptionContext:]([TPSRegistrationTelephonyController alloc], "initWithSubscriptionContext:", v5);
    registrationController = v7->_registrationController;
    v7->_registrationController = v8;

    -[TPSController addDelegate:queue:](v7->_registrationController, "addDelegate:queue:", v7, MEMORY[0x1E0C80D38]);
    -[TPSRegistrationTelephonyController networkSelectionInfo](v7->_registrationController, "networkSelectionInfo");
    v10 = objc_claimAutoreleasedReturnValue();
    networkSelectionInfo = v7->_networkSelectionInfo;
    v7->_networkSelectionInfo = (CTNetworkSelectionInfo *)v10;

    -[TPSCellularNetworkController updateSelectedNetworkForNetworkSelectionInfo:](v7, "updateSelectedNetworkForNetworkSelectionInfo:", v7->_networkSelectionInfo);
    -[TPSCellularNetworkController updateNetworkSelectionModeForNetworkSelectionInfo:](v7, "updateNetworkSelectionModeForNetworkSelectionInfo:", v7->_networkSelectionInfo);
  }

  return v7;
}

- (void)setNetworkItems:(id)a3
{
  NSArray *v5;
  void *v6;
  NSArray *v7;

  v5 = (NSArray *)a3;
  if (self->_networkItems != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_networkItems, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("TPSCellularNetworkControllerNetworkItemsDidChangeNotification"), self);

    v5 = v7;
  }

}

- (BOOL)isNetworkSelectionEnabled
{
  void *v2;
  BOOL v3;

  -[TPSCellularNetworkController networkSelectionInfo](self, "networkSelectionInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "selectionMode") != 0;

  return v3;
}

- (void)setNetworkSelectionMode:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_networkSelectionMode != a3)
  {
    self->_networkSelectionMode = a3;
    if (a3 == 2)
    {
      -[TPSCellularNetworkController registrationController](self, "registrationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "fetchNetworkList");
    }
    else
    {
      if (a3 != 1)
      {
        if (!a3)
          -[TPSCellularNetworkController setNetworks:](self, "setNetworks:");
        goto LABEL_10;
      }
      -[TPSCellularNetworkController setNetworks:](self, "setNetworks:", 0);
      -[TPSCellularNetworkController selectedNetworkItem](self, "selectedNetworkItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
      {
LABEL_10:
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "postNotificationName:object:", CFSTR("TPSCellularNetworkControllerNetworkSelectionModeDidChangeNotification"), self);

        return;
      }
      -[TPSCellularNetworkController registrationController](self, "registrationController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "automaticallySelectNetwork");
    }

    goto LABEL_10;
  }
}

- (void)setSelectedNetworkItem:(id)a3
{
  TPSCellularNetworkItem *v5;
  void *v6;
  TPSCellularNetworkItem *v7;

  v5 = (TPSCellularNetworkItem *)a3;
  if (self->_selectedNetworkItem != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_selectedNetworkItem, a3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("TPSCellularNetworkControllerSelectedNetworkItemDidChangeNotification"), self);

    v5 = v7;
  }

}

- (void)setNetworks:(id)a3
{
  NSArray *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = (NSArray *)a3;
  if (self->_networks != v5)
  {
    objc_storeStrong((id *)&self->_networks, a3);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](v5, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = v5;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            -[TPSCellularNetworkController networkItemForNetwork:](self, "networkItemForNetwork:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v12);

          }
          v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

    }
    else
    {
      v6 = 0;
    }
    -[TPSCellularNetworkController setNetworkItems:](self, "setNetworkItems:", v6, (_QWORD)v13);

  }
}

- (void)updateNetworkSelectionModeForNetworkSelectionInfo:(id)a3
{
  uint64_t v4;

  if (objc_msgSend(a3, "selectionMode") == 2)
    v4 = 2;
  else
    v4 = 1;
  -[TPSCellularNetworkController setNetworkSelectionMode:](self, "setNetworkSelectionMode:", v4);
}

- (void)updateSelectedNetworkForNetworkSelectionInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a3, "selection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TPSCellularNetworkController networkItemForNetwork:](self, "networkItemForNetwork:", v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = (id)v5;
  -[TPSCellularNetworkController setSelectedNetworkItem:](self, "setSelectedNetworkItem:", v5);

}

- (id)networkItemAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;

  -[TPSCellularNetworkController networkItems](self, "networkItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3 < 0 || objc_msgSend(v4, "count") <= (unint64_t)a3)
  {
    TPSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[TPSCellularNetworkController networkItemAtIndex:].cold.1(a3, v7);

    v6 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)selectNetworkItemAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[TPSCellularNetworkController networks](self, "networks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    TPSLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_1DB4B7000, v7, OS_LOG_TYPE_DEFAULT, "Requesting manual selection of network %@.", (uint8_t *)&v9, 0xCu);
    }

    -[TPSCellularNetworkController registrationController](self, "registrationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "selectNetwork:", v6);

  }
}

- (id)networkItemForNetwork:(id)a3
{
  id v3;
  TPSCellularNetworkItem *v4;
  void *v5;
  void *v6;
  void *v7;
  TPSCellularNetworkItem *v8;

  v3 = a3;
  v4 = [TPSCellularNetworkItem alloc];
  objc_msgSend(v3, "plmn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tps_localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[TPSCellularNetworkItem initWithIdentifier:name:localizedName:](v4, "initWithIdentifier:name:localizedName:", v5, v6, v7);
  return v8;
}

- (void)networksChangedForRegistrationController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSCellularNetworkController registrationController](self, "registrationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    TPSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = (id)objc_opt_class();
      v7 = v10;
      _os_log_impl(&dword_1DB4B7000, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling networks changed delegate callback.", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(v4, "networks");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSCellularNetworkController setNetworks:](self, "setNetworks:", v8);

  }
}

- (void)networkSelectionInfoChangedForRegistrationController:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TPSCellularNetworkController registrationController](self, "registrationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    TPSLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 138412290;
      v10 = (id)objc_opt_class();
      v7 = v10;
      _os_log_impl(&dword_1DB4B7000, v6, OS_LOG_TYPE_DEFAULT, "%@ is handling networks selection information changed delegate callback.", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(v4, "networkSelectionInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSCellularNetworkController setNetworkSelectionInfo:](self, "setNetworkSelectionInfo:", v8);
    -[TPSCellularNetworkController updateSelectedNetworkForNetworkSelectionInfo:](self, "updateSelectedNetworkForNetworkSelectionInfo:", v8);
    -[TPSCellularNetworkController updateNetworkSelectionModeForNetworkSelectionInfo:](self, "updateNetworkSelectionModeForNetworkSelectionInfo:", v8);

  }
}

- (int64_t)networkSelectionMode
{
  return self->_networkSelectionMode;
}

- (TPSCellularNetworkItem)selectedNetworkItem
{
  return self->_selectedNetworkItem;
}

- (NSArray)networkItems
{
  return self->_networkItems;
}

- (TPSRegistrationTelephonyController)registrationController
{
  return self->_registrationController;
}

- (NSArray)networks
{
  return self->_networks;
}

- (CTNetworkSelectionInfo)networkSelectionInfo
{
  return self->_networkSelectionInfo;
}

- (void)setNetworkSelectionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_networkSelectionInfo, a3);
}

- (CTXPCServiceSubscriptionContext)subscriptionContext
{
  return self->_subscriptionContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_storeStrong((id *)&self->_networkSelectionInfo, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_registrationController, 0);
  objc_storeStrong((id *)&self->_networkItems, 0);
  objc_storeStrong((id *)&self->_selectedNetworkItem, 0);
}

- (void)networkItemAtIndex:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1DB4B7000, a2, OS_LOG_TYPE_ERROR, "Could not find network item at index %ld", (uint8_t *)&v2, 0xCu);
}

@end
