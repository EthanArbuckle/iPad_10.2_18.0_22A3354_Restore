@implementation TUSimulatedIDSIDQueryController

- (BOOL)currentIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v10;
  void *v11;

  v10 = a8;
  _validDictionaryForDestinations(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a8 + 2))(v10, v11);

  return 1;
}

- (BOOL)refreshIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v10;
  void *v11;

  v10 = a8;
  _validDictionaryForDestinations(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a8 + 2))(v10, v11);

  return 1;
}

- (BOOL)requiredIDStatusForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v10;
  void *v11;

  v10 = a8;
  _validDictionaryForDestinations(a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *))a8 + 2))(v10, v11);

  return 1;
}

- (BOOL)currentRemoteDevicesForDestinations:(id)a3 service:(id)a4 preferredFromID:(id)a5 listenerID:(id)a6 queue:(id)a7 completionBlock:(id)a8
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void (**v26)(id, void *);
  id obj;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v26 = (void (**)(id, void *))a8;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
  if (v10)
  {
    v11 = v10;
    v29 = *(_QWORD *)v32;
    v28 = *MEMORY[0x1E0D34B40];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12);
        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D34EA8]), "initWithPrefixedURI:", v13);
        v15 = objc_alloc(MEMORY[0x1E0D34D20]);
        objc_msgSend(CFSTR("push-token"), "dataUsingEncoding:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v15, "initWithURI:clientData:pushToken:sessionToken:expireDate:refreshDate:", v14, MEMORY[0x1E0C9AA70], v16, v17, v18, v19);

        v21 = objc_alloc(MEMORY[0x1E0D34D28]);
        v36 = v28;
        v37 = &unk_1E38E8F80;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v21, "initWithCapabilitiesMap:", v22);

        objc_msgSend(v20, "setValue:forKey:", v23, CFSTR("_capabilities"));
        v35 = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v24, v13);

        ++v12;
      }
      while (v11 != v12);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    }
    while (v11);
  }

  v26[2](v26, v30);
  return 1;
}

@end
