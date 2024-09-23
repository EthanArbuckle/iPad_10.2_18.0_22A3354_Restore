@implementation _PSProximityBooster

- (_PSProximityBooster)init
{
  _PSProximityBooster *v2;
  RPPeopleDiscovery *v3;
  RPPeopleDiscovery *peopleDiscovery;
  NSObject *v5;
  dispatch_queue_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_PSProximityBooster;
  v2 = -[_PSProximityBooster init](&v8, sel_init);
  if (v2)
  {
    v3 = (RPPeopleDiscovery *)objc_alloc_init(MEMORY[0x1E0D83948]);
    peopleDiscovery = v2->_peopleDiscovery;
    v2->_peopleDiscovery = v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.peoplesuggester.proximitybooster", v5);
    -[RPPeopleDiscovery setDispatchQueue:](v2->_peopleDiscovery, "setDispatchQueue:", v6);

    -[RPPeopleDiscovery setDiscoveryMode:](v2->_peopleDiscovery, "setDiscoveryMode:", 400);
    -[RPPeopleDiscovery setDiscoveryFlags:](v2->_peopleDiscovery, "setDiscoveryFlags:", 24);
    -[RPPeopleDiscovery setChangeFlags:](v2->_peopleDiscovery, "setChangeFlags:", 0xFFFFFFFFLL);
    -[RPPeopleDiscovery setPersonFoundHandler:](v2->_peopleDiscovery, "setPersonFoundHandler:", &__block_literal_global_12);
    -[RPPeopleDiscovery setPersonLostHandler:](v2->_peopleDiscovery, "setPersonLostHandler:", &__block_literal_global_7);
    -[RPPeopleDiscovery setPersonChangedHandler:](v2->_peopleDiscovery, "setPersonChangedHandler:", &__block_literal_global_10_1);
    -[RPPeopleDiscovery setInvalidationHandler:](v2->_peopleDiscovery, "setInvalidationHandler:", &__block_literal_global_14_0);
    -[RPPeopleDiscovery setInterruptionHandler:](v2->_peopleDiscovery, "setInterruptionHandler:", &__block_literal_global_16_0);
  }
  return v2;
}

- (void)startMonitoringProximity
{
  id v2;

  -[_PSProximityBooster peopleDiscovery](self, "peopleDiscovery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activateWithCompletion:", &__block_literal_global_18_0);

}

- (void)stopMonitoringProximity
{
  id v2;

  -[_PSProximityBooster peopleDiscovery](self, "peopleDiscovery");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (id)suggestionsByBoostingNearbySuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
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
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id obj;
  id obja;
  _QWORD v48[5];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD block[5];
  id v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PSProximityBooster peopleDiscovery](self, "peopleDiscovery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dispatchQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke;
  block[3] = &unk_1E4400068;
  block[4] = self;
  v8 = v5;
  v9 = v4;
  v10 = v8;
  v58 = v8;
  dispatch_sync(v7, block);

  v44 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v9, "reverseObjectEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
  v45 = v9;
  v43 = v10;
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v54;
    do
    {
      v15 = 0;
      obj = (id)v13;
      do
      {
        if (*(_QWORD *)v54 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v15);
        objc_msgSend(v16, "recipients");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18 == 1)
        {
          objc_msgSend(v16, "recipients");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "firstObject");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "contact");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22 && objc_msgSend(v10, "containsObject:", v22))
          {
            objc_msgSend(v44, "removeObject:", v16);
            objc_msgSend(v44, "insertObject:atIndex:", v16, 0);
            objc_msgSend(v16, "reason");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "stringByAppendingString:", CFSTR(" - "));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "stringByAppendingString:", CFSTR("Proximity Boosted"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setReason:", v25);

            objc_msgSend(v16, "reasonType");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = (uint64_t)obj;
            objc_msgSend(v26, "stringByAppendingString:", CFSTR(" - "));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "stringByAppendingString:", CFSTR("Proximity Boosted"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setReasonType:", v28);

            v10 = v43;
            v9 = v45;

            objc_msgSend(v42, "addObject:", v22);
          }

        }
        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    }
    while (v13);
  }

  v29 = (void *)objc_msgSend(v44, "copy");
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obja = v42;
  v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v50 != v32)
          objc_enumerationMutation(obja);
        v34 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __62___PSProximityBooster_suggestionsByBoostingNearbySuggestions___block_invoke_24;
        v48[3] = &unk_1E4400288;
        v48[4] = v34;
        v35 = (void *)MEMORY[0x1A1AFCBF8](v48);
        v36 = objc_msgSend(v9, "indexOfObjectPassingTest:", v35);
        v37 = objc_msgSend(v29, "indexOfObjectPassingTest:", v35);
        +[_PSLogging heuristicsChannel](_PSLogging, "heuristicsChannel");
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v37);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v60 = v34;
          v61 = 2112;
          v62 = v39;
          v63 = 2112;
          v64 = v40;
          _os_log_debug_impl(&dword_1A07F4000, v38, OS_LOG_TYPE_DEBUG, "Boosting suggestion with contactID %@ from index %@ to index %@", buf, 0x20u);

          v9 = v45;
        }

      }
      v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    }
    while (v31);
  }

  return v29;
}

- (RPPeopleDiscovery)peopleDiscovery
{
  return self->_peopleDiscovery;
}

- (void)setPeopleDiscovery:(id)a3
{
  objc_storeStrong((id *)&self->_peopleDiscovery, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peopleDiscovery, 0);
}

@end
