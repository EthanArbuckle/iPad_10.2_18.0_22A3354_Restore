@implementation NCNotificationDestinationsRegistry

- (NSArray)registeredDestinations
{
  void *v2;
  void *v3;

  -[NCNotificationDestinationsRegistry destinations](self, "destinations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSMutableDictionary)destinations
{
  return self->_destinations;
}

- (NCNotificationDestinationsRegistry)init
{
  NCNotificationDestinationsRegistry *v2;
  uint64_t v3;
  NSMutableDictionary *destinations;
  uint64_t v5;
  NSMutableDictionary *activeDestinations;
  uint64_t v7;
  NSMutableDictionary *readyDestinations;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)NCNotificationDestinationsRegistry;
  v2 = -[NCNotificationDestinationsRegistry init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    destinations = v2->_destinations;
    v2->_destinations = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    activeDestinations = v2->_activeDestinations;
    v2->_activeDestinations = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    readyDestinations = v2->_readyDestinations;
    v2->_readyDestinations = (NSMutableDictionary *)v7;

  }
  return v2;
}

- (void)registerDestination:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationDestinationsRegistry registerDestination:forIdentifier:](self, "registerDestination:forIdentifier:", v4, v5);

}

- (void)registerDestination:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[NCNotificationDestinationsRegistry destinations](self, "destinations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if ((objc_msgSend(v9, "isEqual:", v6) & 1) == 0)
    {
      v10 = (void *)NCUILogDispatch;
      if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138543874;
        v22 = v13;
        v23 = 2114;
        v24 = v7;
        v25 = 2114;
        v26 = v15;
        _os_log_impl(&dword_2149F4000, v11, OS_LOG_TYPE_DEFAULT, "Replacing destination %{public}@ for identifier %{public}@ with destination %{public}@", (uint8_t *)&v21, 0x20u);

      }
      -[NCNotificationDestinationsRegistry activeDestinations](self, "activeDestinations");
      v16 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject removeObjectForKey:](v16, "removeObjectForKey:", v17);
      goto LABEL_8;
    }
  }
  else
  {
    v18 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v18;
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543618;
      v22 = v17;
      v23 = 2114;
      v24 = v7;
      _os_log_impl(&dword_2149F4000, v16, OS_LOG_TYPE_DEFAULT, "Registering destination %{public}@ for identifier %{public}@", (uint8_t *)&v21, 0x16u);
LABEL_8:

    }
  }
  -[NCNotificationDestinationsRegistry destinations](self, "destinations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v6, v7);

}

- (BOOL)isRegisteredDestination:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[NCNotificationDestinationsRegistry destinations](self, "destinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v4);

  return v7;
}

- (void)unregisterDestination:(id)a3
{
  id v4;

  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NCNotificationDestinationsRegistry unregisterDestinationForIdentifier:](self, "unregisterDestinationForIdentifier:", v4);

}

- (void)unregisterDestinationForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NCNotificationDestinationsRegistry destinations](self, "destinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v10;
      v16 = 2114;
      v17 = v4;
      _os_log_impl(&dword_2149F4000, v8, OS_LOG_TYPE_DEFAULT, "Unregistering destination %{public}@ for identifier %{public}@", (uint8_t *)&v14, 0x16u);

    }
    -[NCNotificationDestinationsRegistry readyDestinations](self, "readyDestinations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectForKey:", v4);

    -[NCNotificationDestinationsRegistry activeDestinations](self, "activeDestinations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v4);

    -[NCNotificationDestinationsRegistry destinations](self, "destinations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v4);

  }
}

- (BOOL)hasActiveDestinationsForRequest:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "requestDestinations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationDestinationsRegistry destinationsForRequestDestinations:](self, "destinationsForRequestDestinations:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "count") != 0;
  return (char)v4;
}

- (id)destinationIdentifiersForRequestDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  -[NCNotificationDestinationsRegistry activeDestinations](self, "activeDestinations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKey:", v12, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)destinationsForRequestDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationDestinationsRegistry activeDestinations](self, "activeDestinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationDestinationsRegistry _destinationsForRequestDestinations:inDestinationDict:](self, "_destinationsForRequestDestinations:inDestinationDict:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDestination:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationDestinationsRegistry destinations](self, "destinations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqual:", v6) & 1) == 0)
  {
    v10 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_ERROR))
    {
      if (v4)
        v11 = "enable";
      else
        v11 = "disable";
      v12 = v10;
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 136446978;
      v18 = v11;
      v19 = 2114;
      v20 = v14;
      v21 = 2114;
      v22 = v16;
      v23 = 2114;
      v24 = v7;
      _os_log_error_impl(&dword_2149F4000, v12, OS_LOG_TYPE_ERROR, "Tried to %{public}s destination %{public}@ but %{public}@ is registered for identifier %{public}@", (uint8_t *)&v17, 0x2Au);

    }
  }
  -[NCNotificationDestinationsRegistry setDestinationWithIdentifier:enabled:](self, "setDestinationWithIdentifier:enabled:", v7, v4);

}

- (void)setDestinationWithIdentifier:(id)a3 enabled:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  const char *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  int v20;
  void *v21;
  uint64_t v22;

  v4 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[NCNotificationDestinationsRegistry destinations](self, "destinations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationDestinationsRegistry activeDestinations](self, "activeDestinations");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 || !v4)
  {
    if (v10)
    {
      if (!v4)
      {
        -[NCNotificationDestinationsRegistry activeDestinations](self, "activeDestinations");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObjectForKey:", v6);

        v18 = (void *)NCUILogDispatch;
        if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v18;
          v19 = (objc_class *)objc_opt_class();
          NSStringFromClass(v19);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = 138543362;
          v21 = v15;
          v16 = "Disabled destination %{public}@";
          goto LABEL_9;
        }
      }
    }
  }
  else
  {
    -[NCNotificationDestinationsRegistry activeDestinations](self, "activeDestinations");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v8, v6);

    v12 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v15;
      v16 = "Enabled destination %{public}@";
LABEL_9:
      _os_log_impl(&dword_2149F4000, v13, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v20, 0xCu);

    }
  }

}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[NCNotificationDestinationsRegistry destinations](self, "destinations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (void)setDestination:(id)a3 ready:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  char *v19;
  const char *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  const char *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  int v30;
  const char *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v4 = a4;
  v38 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationDestinationsRegistry destinations](self, "destinations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqual:", v6) & 1) == 0)
  {
    v10 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_ERROR))
    {
      if (v4)
        v24 = "set ready";
      else
        v24 = "set not ready";
      v25 = v10;
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 136446978;
      v31 = v24;
      v32 = 2114;
      v33 = v27;
      v34 = 2114;
      v35 = v29;
      v36 = 2114;
      v37 = v7;
      _os_log_error_impl(&dword_2149F4000, v25, OS_LOG_TYPE_ERROR, "Tried to %{public}s for destination %{public}@ but %{public}@ is registered for identifier %{public}@", (uint8_t *)&v30, 0x2Au);

    }
  }
  -[NCNotificationDestinationsRegistry activeDestinations](self, "activeDestinations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[NCNotificationDestinationsRegistry readyDestinations](self, "readyDestinations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14 && v4 && v12)
  {
    -[NCNotificationDestinationsRegistry readyDestinations](self, "readyDestinations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v6, v7);

    v16 = (void *)NCUILogDispatch;
    if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      v30 = 138543362;
      v31 = v19;
      v20 = "Destination %{public}@ set to ready";
LABEL_12:
      _os_log_impl(&dword_2149F4000, v17, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v30, 0xCu);

    }
  }
  else if (v14)
  {
    if (!v4)
    {
      -[NCNotificationDestinationsRegistry readyDestinations](self, "readyDestinations");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeObjectForKey:", v7);

      v22 = (void *)NCUILogDispatch;
      if (os_log_type_enabled((os_log_t)NCUILogDispatch, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v22;
        v23 = (objc_class *)objc_opt_class();
        NSStringFromClass(v23);
        v19 = (char *)objc_claimAutoreleasedReturnValue();
        v30 = 138543362;
        v31 = v19;
        v20 = "Destination %{public}@ set to not ready";
        goto LABEL_12;
      }
    }
  }

}

- (id)readyDestinationsForRequestDestinations:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NCNotificationDestinationsRegistry readyDestinations](self, "readyDestinations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NCNotificationDestinationsRegistry _destinationsForRequestDestinations:inDestinationDict:](self, "_destinationsForRequestDestinations:inDestinationDict:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_destinationsForRequestDestinations:(id)a3 inDestinationDict:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)setDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_destinations, a3);
}

- (NSMutableDictionary)activeDestinations
{
  return self->_activeDestinations;
}

- (void)setActiveDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_activeDestinations, a3);
}

- (NSMutableDictionary)readyDestinations
{
  return self->_readyDestinations;
}

- (void)setReadyDestinations:(id)a3
{
  objc_storeStrong((id *)&self->_readyDestinations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readyDestinations, 0);
  objc_storeStrong((id *)&self->_activeDestinations, 0);
  objc_storeStrong((id *)&self->_destinations, 0);
}

@end
