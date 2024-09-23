@implementation WiFiAvailabilityEngine

- (void)_handleScanResultCallback:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  id v26;
  void *v27;
  WiFiAvailabilityEngine *v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v26 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v6;
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
  if (v31)
  {
    v9 = *(_QWORD *)v37;
    v27 = v7;
    v28 = self;
    v29 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v37 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v12 = (void *)MEMORY[0x1D17AC818]();
        objc_msgSend(v11, "SSID");
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          objc_msgSend(v11, "SSID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "length");

          if (v16)
          {
            -[WiFiAvailabilityEngine _findExistingAvailabilityMatchForScannedNetwork:](self, "_findExistingAvailabilityMatchForScannedNetwork:", v11);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {
              objc_msgSend(MEMORY[0x1E0C99D68], "date");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "setMatchedAt:", v18);

              objc_msgSend(v7, "addObject:", v17);
            }
            -[WiFiAvailabilityEngine _findRelevantNetworkMatchForScannedNetwork:](self, "_findRelevantNetworkMatchForScannedNetwork:", v11);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315650;
                v42 = "-[WiFiAvailabilityEngine _handleScanResultCallback:error:]";
                v43 = 2112;
                v44 = v19;
                v45 = 2112;
                v46 = v11;
                _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: found relevant network match (%@) for scanned network %@", buf, 0x20u);
              }
              -[WiFiAvailabilityEngine _createAvailabilityMatchForCandidate:scannedNetwork:](self, "_createAvailabilityMatchForCandidate:scannedNetwork:", v19, v11);
              v20 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v7, "addObject:", v20);
              v17 = (void *)v20;
            }
            else if (v17)
            {
              objc_msgSend(v7, "addObject:", v17);
            }
            else
            {
              objc_msgSend(v11, "BSSID");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              if (v17)
                objc_msgSend(v8, "setObject:forKey:", v11, v17);
              v34 = 0u;
              v35 = 0u;
              v32 = 0u;
              v33 = 0u;
              objc_msgSend(v11, "essMembers");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
              if (v22)
              {
                v23 = v22;
                v24 = *(_QWORD *)v33;
                do
                {
                  for (j = 0; j != v23; ++j)
                  {
                    if (*(_QWORD *)v33 != v24)
                      objc_enumerationMutation(v21);
                    objc_msgSend(v8, "setObject:forKey:", v11, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
                  }
                  v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
                }
                while (v23);
              }

              v7 = v27;
              self = v28;
            }

            v9 = v29;
          }
        }
        objc_autoreleasePoolPop(v12);
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v47, 16);
    }
    while (v31);
  }

  if (objc_msgSend(v8, "count"))
    -[WiFiAvailabilityEngine _findAvailabilityMatchesInSourcesForBSSIDS:](self, "_findAvailabilityMatchesInSourcesForBSSIDS:", v8);
  if (objc_msgSend(v7, "count"))
    -[WiFiAvailabilityEngine _handleCandidateMatches:](self, "_handleCandidateMatches:", v7);
  -[WiFiAvailabilityEngine _removeStaleMatches](self, "_removeStaleMatches");

}

- (id)_findRelevantNetworkMatchForScannedNetwork:(id)a3
{
  id v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  NSObject *v27;
  id obj;
  uint64_t v30;
  uint64_t v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[WiFiAvailabilityEngine sources](self, "sources");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
  if (v31)
  {
    v32 = 0;
    v30 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v38 != v30)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        objc_msgSend(v6, "relevantNetworks");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v34;
          while (2)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v34 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
              objc_msgSend(v12, "SSID");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "SSID");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = objc_msgSend(v13, "isEqualToString:", v14);

              if ((v15 & 1) != 0)
                goto LABEL_19;
              objc_msgSend(v4, "BSSID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();

              if (v16)
              {
                v17 = (void *)MEMORY[0x1E0C99E60];
                objc_msgSend(v4, "BSSID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "setWithObjects:", v18, 0);
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v12, "containsAccessPointMatchingBSSIDs:", v19);

                if ((v20 & 1) != 0)
                  goto LABEL_19;
              }
              objc_msgSend(v4, "essMembers");
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                v22 = (void *)MEMORY[0x1E0C99E60];
                objc_msgSend(v4, "essMembers");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setWithArray:", v23);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v12, "containsAccessPointMatchingBSSIDs:", v24);

                if (v25)
                {
LABEL_19:
                  v26 = v12;

                  v27 = MEMORY[0x1E0C81028];
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315650;
                    v42 = "-[WiFiAvailabilityEngine _findRelevantNetworkMatchForScannedNetwork:]";
                    v43 = 2112;
                    v44 = v26;
                    v45 = 2112;
                    v46 = v4;
                    _os_log_impl(&dword_1CC44E000, v27, OS_LOG_TYPE_DEFAULT, "%s: relevant network %@ matched with scanned network %@", buf, 0x20u);
                  }
                  v32 = v26;
                  goto LABEL_22;
                }
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v47, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_22:

      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v48, 16);
    }
    while (v31);
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (NSSet)sources
{
  return self->_sources;
}

- (id)_findExistingAvailabilityMatchForScannedNetwork:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isEqualToScannedNetwork:", v4))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_removeStaleMatches
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *context;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D17AC818](self, a2);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    v9 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "matchedAt");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "timeIntervalSinceDate:", v12);
        v14 = v13;
        -[WiFiAvailabilityEngine availabilityMatchMaximumAge](self, "availabilityMatchMaximumAge");
        v16 = v15;

        if (v14 > v16)
        {
          objc_msgSend(v3, "addObject:", v11);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v25 = "-[WiFiAvailabilityEngine _removeStaleMatches]";
            v26 = 2112;
            v27 = v11;
            _os_log_impl(&dword_1CC44E000, v9, OS_LOG_TYPE_DEFAULT, "%s: expired match %@", buf, 0x16u);
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v3, "count"))
  {
    -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    objc_msgSend(v18, "minusSet:", v3);
    -[WiFiAvailabilityEngine setAvailableNetworks:](self, "setAvailableNetworks:", v18);

  }
  objc_autoreleasePoolPop(context);
}

- (void)_handleCandidateMatches:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  _BOOL4 v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  void *context;
  void *v28;
  _QWORD block[6];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t v40[128];
  uint8_t buf[4];
  const char *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1D17AC818]();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__10;
  v38 = __Block_byref_object_dispose__10;
  v39 = 0;
  v28 = v4;
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 136315138;
    v42 = "-[WiFiAvailabilityEngine _handleCandidateMatches:]";
    v25 = MEMORY[0x1E0C81028];
    v26 = "%s: no candidates";
    goto LABEL_16;
  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v11, "matchedAt");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "timeIntervalSinceDate:", v12);
        v14 = v13;
        -[WiFiAvailabilityEngine availabilityMatchMaximumAge](self, "availabilityMatchMaximumAge");
        v16 = v14 < v15;

        if (v16)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
    }
    while (v8);
  }

  v17 = objc_msgSend(v5, "mutableCopy");
  v18 = (void *)v35[5];
  v35[5] = v17;

  v19 = (void *)v35[5];
  -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "minusSet:", v20);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[WiFiAvailabilityEngine setAvailableNetworks:](self, "setAvailableNetworks:", v21);

  -[WiFiAvailabilityEngine availabilityChangedCallback](self, "availabilityChangedCallback");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22 == 0;

  if (v23)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 136315138;
    v42 = "-[WiFiAvailabilityEngine _handleCandidateMatches:]";
    v25 = MEMORY[0x1E0C81028];
    v26 = "%s: no availability callback provided";
    goto LABEL_16;
  }
  if (!objc_msgSend((id)v35[5], "count"))
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_17;
    *(_DWORD *)buf = 136315138;
    v42 = "-[WiFiAvailabilityEngine _handleCandidateMatches:]";
    v25 = MEMORY[0x1E0C81028];
    v26 = "%s: no change to available networks";
LABEL_16:
    _os_log_impl(&dword_1CC44E000, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
    goto LABEL_17;
  }
  -[WiFiAvailabilityEngine queue](self, "queue");
  v24 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__WiFiAvailabilityEngine__handleCandidateMatches___block_invoke;
  block[3] = &unk_1E881D700;
  block[4] = self;
  block[5] = &v34;
  dispatch_async(v24, block);

LABEL_17:
  _Block_object_dispose(&v34, 8);

  objc_autoreleasePoolPop(context);
}

- (NSSet)availableNetworks
{
  return self->_availableNetworks;
}

- (void)setAvailableNetworks:(id)a3
{
  objc_storeStrong((id *)&self->_availableNetworks, a3);
}

- (id)availabilityChangedCallback
{
  return self->_availabilityChangedCallback;
}

- (void)_findAvailabilityMatchesInSourcesForBSSIDS:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  WiFiAvailabilityEngine *v15;
  _QWORD v16[4];
  id v17;
  WiFiAvailabilityEngine *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v15 = self;
  -[WiFiAvailabilityEngine sources](self, "sources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v21;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v9);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = (void *)MEMORY[0x1D17AC818]();
          v12 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v4, "allKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setWithArray:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __69__WiFiAvailabilityEngine__findAvailabilityMatchesInSourcesForBSSIDS___block_invoke;
          v16[3] = &unk_1E881E998;
          v17 = v4;
          v18 = v15;
          v19 = v10;
          objc_msgSend(v10, "fetchCandidateNetworksMatchingBSSIDs:completionHandler:", v14, v16);

          objc_autoreleasePoolPop(v11);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }

}

void __69__WiFiAvailabilityEngine__findAvailabilityMatchesInSourcesForBSSIDS___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v23 = v6;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v34 = "-[WiFiAvailabilityEngine _findAvailabilityMatchesInSourcesForBSSIDS:]_block_invoke";
      v35 = 2112;
      v36 = (uint64_t)v5;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: fetched matches %@", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v25 = v5;
    v7 = v5;
    v28 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v28)
    {
      v8 = *(_QWORD *)v30;
      v9 = MEMORY[0x1E0C81028];
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v30 != v8)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v12 = (void *)MEMORY[0x1D17AC818]();
          objc_msgSend(v7, "objectForKey:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
            +[WiFiAvailabilityMatch matchWithNetwork:scannedNetwork:](WiFiAvailabilityMatch, "matchWithNetwork:scannedNetwork:", v13, v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              v27 = v12;
              objc_msgSend(*(id *)(a1 + 40), "wifiLexicon");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if (v16)
              {
                objc_msgSend(*(id *)(a1 + 40), "wifiLexicon");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "SSID");
                v18 = a1;
                v19 = v7;
                v20 = v8;
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setUnwantedNetworkName:", objc_msgSend(v17, "stringContainsUnwantedWords:", v21));

                v8 = v20;
                v7 = v19;
                a1 = v18;
                v9 = MEMORY[0x1E0C81028];

              }
              else
              {
                objc_msgSend(v15, "setUnwantedNetworkName:", 0);
              }

              objc_msgSend(v26, "addObject:", v15);
              objc_opt_class();
              v12 = v27;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v14, "SSID");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "setSSID:", v22);

                v12 = v27;
              }
            }
            else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315651;
              v34 = "-[WiFiAvailabilityEngine _findAvailabilityMatchesInSourcesForBSSIDS:]_block_invoke";
              v35 = 2113;
              v36 = (uint64_t)v13;
              v37 = 2113;
              v38 = v14;
              _os_log_impl(&dword_1CC44E000, v9, OS_LOG_TYPE_DEFAULT, "%s: failed to create match for candidate %{private}@, scanned %{private}@", buf, 0x20u);
            }

          }
          else if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315907;
            v34 = "-[WiFiAvailabilityEngine _findAvailabilityMatchesInSourcesForBSSIDS:]_block_invoke";
            v35 = 2160;
            v36 = 1752392040;
            v37 = 2112;
            v38 = v11;
            v39 = 2113;
            v40 = v13;
            _os_log_impl(&dword_1CC44E000, v9, OS_LOG_TYPE_DEFAULT, "%s: missing scan match for bssid %{mask.hash}@, candidate %{private}@", buf, 0x2Au);
          }

          objc_autoreleasePoolPop(v12);
        }
        v28 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v28);
    }

    objc_msgSend(*(id *)(a1 + 40), "_handleCandidateMatches:", v26);
    v6 = v24;
    v5 = v25;
  }

}

void __50__WiFiAvailabilityEngine__setupProviderCallbacks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleScanResultCallback:error:", v6, v5);

}

- (WiFiAvailabilityEngine)initWithProviders:(id)a3 sources:(id)a4
{
  id v6;
  id v7;
  void *v8;
  WiFiAvailabilityEngine *v9;
  NSSet *v10;
  NSSet *providers;
  NSSet *v12;
  NSSet *sources;
  NSSet *v14;
  NSSet *availableNetworks;
  NSObject *v16;
  WiFiAvailabilityEngine *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *queue;
  _QWORD block[4];
  WiFiAvailabilityEngine *v23;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (objc_msgSend(v6, "count")
      && objc_msgSend(v8, "count")
      && (v24.receiver = self,
          v24.super_class = (Class)WiFiAvailabilityEngine,
          (self = -[WiFiAvailabilityEngine init](&v24, sel_init)) != 0))
    {
      v10 = (NSSet *)objc_msgSend(v6, "copy");
      providers = self->_providers;
      self->_providers = v10;

      v12 = (NSSet *)objc_msgSend(v8, "copy");
      sources = self->_sources;
      self->_sources = v12;

      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v14 = (NSSet *)objc_claimAutoreleasedReturnValue();
      availableNetworks = self->_availableNetworks;
      self->_availableNetworks = v14;

      dispatch_get_global_queue(0, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __52__WiFiAvailabilityEngine_initWithProviders_sources___block_invoke;
      block[3] = &unk_1E881C8E8;
      v17 = self;
      v23 = v17;
      dispatch_async(v16, block);

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = dispatch_queue_create("com.apple.WiFiPolicy.availability-engine", v18);
      queue = v17->_queue;
      v17->_queue = (OS_dispatch_queue *)v19;

      v17->_availabilityMatchMaximumAge = 600.0;
      -[WiFiAvailabilityEngine _setupProviderCallbacks:](v17, "_setupProviderCallbacks:", self->_providers);
      -[WiFiAvailabilityEngine _setupSourceCallbacks:](v17, "_setupSourceCallbacks:", self->_sources);
      self = v17;

      v9 = self;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

void __52__WiFiAvailabilityEngine_initWithProviders_sources___block_invoke(uint64_t a1)
{
  WiFiLexicon *v2;
  uint64_t v3;
  void *v4;

  v2 = objc_alloc_init(WiFiLexicon);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v2;

}

- (void)_setupProviderCallbacks:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t i;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id location;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    v8 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[WiFiAvailabilityEngine _setupProviderCallbacks:]";
          v21 = 2112;
          v22 = v10;
          _os_log_impl(&dword_1CC44E000, v8, OS_LOG_TYPE_DEFAULT, "%s: provider %@", buf, 0x16u);
        }
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EFA036E0))
        {
          v11 = objc_storeWeak((id *)&self->_scanProvider, v10);
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __50__WiFiAvailabilityEngine__setupProviderCallbacks___block_invoke;
          v12[3] = &unk_1E881CC50;
          objc_copyWeak(&v13, &location);
          objc_msgSend(v10, "addScanResultsCallback:", v12);

          objc_destroyWeak(&v13);
        }
        else if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EFA03740))
        {
          objc_storeWeak((id *)&self->_locationProvider, v10);
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    }
    while (v6);
  }

  objc_destroyWeak(&location);
}

- (void)_setupSourceCallbacks:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id obj;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v26 = "-[WiFiAvailabilityEngine _setupSourceCallbacks:]";
          v27 = 2112;
          v28 = v7;
          _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: source %@", buf, 0x16u);
        }
        objc_initWeak((id *)buf, self);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (NSClassFromString(CFSTR("WFTWalletSourceStub")), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v19[0] = MEMORY[0x1E0C809B0];
          v19[1] = 3221225472;
          v19[2] = __48__WiFiAvailabilityEngine__setupSourceCallbacks___block_invoke;
          v19[3] = &unk_1E881E970;
          objc_copyWeak(&v20, (id *)buf);
          objc_msgSend(v7, "setRelevancyHandler:", v19);
          objc_msgSend(v7, "relevantNetworks");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "count");

          if (v9)
          {
            WeakRetained = objc_loadWeakRetained((id *)buf);
            objc_msgSend(v7, "relevantNetworks");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "_handleWalletRelevancyAdded:removed:", v11, 0);

          }
          objc_destroyWeak(&v20);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0
          || (NSClassFromString(CFSTR("WFT3BarsSourceStub")), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __48__WiFiAvailabilityEngine__setupSourceCallbacks___block_invoke_2;
          v17[3] = &unk_1E881E970;
          objc_copyWeak(&v18, (id *)buf);
          objc_msgSend(v7, "setRelevancyHandler:", v17);
          objc_msgSend(v7, "relevantNetworks");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
          {
            v14 = objc_loadWeakRetained((id *)buf);
            objc_msgSend(v7, "relevantNetworks");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "_handle3BarsRelevancyAdded:removed:", v15, 0);

          }
          objc_destroyWeak(&v18);
        }
        objc_destroyWeak((id *)buf);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v4);
  }

}

void __48__WiFiAvailabilityEngine__setupSourceCallbacks___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handleWalletRelevancyAdded:removed:", v6, v5);

}

void __48__WiFiAvailabilityEngine__setupSourceCallbacks___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_handle3BarsRelevancyAdded:removed:", v6, v5);

}

- (void)setAvailabilityMatchMaximumAge:(double)a3
{
  double availabilityMatchMaximumAge;
  int v5;
  const char *v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  self->_availabilityMatchMaximumAge = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    availabilityMatchMaximumAge = self->_availabilityMatchMaximumAge;
    v5 = 136315394;
    v6 = "-[WiFiAvailabilityEngine setAvailabilityMatchMaximumAge:]";
    v7 = 2048;
    v8 = availabilityMatchMaximumAge;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: setting new max age %f", (uint8_t *)&v5, 0x16u);
  }
}

void __50__WiFiAvailabilityEngine__handleCandidateMatches___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "availabilityChangedCallback");
  v2 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v2[2](v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (id)_createAvailabilityMatchForCandidate:(id)a3 scannedNetwork:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[WiFiAvailabilityMatch matchWithNetwork:scannedNetwork:](WiFiAvailabilityMatch, "matchWithNetwork:scannedNetwork:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v6, "source") == 2)
  {
    -[WiFiAvailabilityEngine wifiLexicon](self, "wifiLexicon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      -[WiFiAvailabilityEngine wifiLexicon](self, "wifiLexicon");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "SSID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setUnwantedNetworkName:", objc_msgSend(v10, "stringContainsUnwantedWords:", v11));

    }
    else
    {
      objc_msgSend(v8, "setUnwantedNetworkName:", 0);
    }

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v8, "SSID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 136315906;
      v15 = "-[WiFiAvailabilityEngine _createAvailabilityMatchForCandidate:scannedNetwork:]";
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v7;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: unwanted network name %@ for candidate %@ scanned %@", (uint8_t *)&v14, 0x2Au);

    }
  }

  return v8;
}

- (void)_handleWalletRelevancyAdded:(id)a3 removed:(id)a4
{
  id v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[WiFiAvailabilityEngine _handleWalletRelevancyAdded:removed:]";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: wallet networks became relevant: %@", (uint8_t *)&v7, 0x16u);
  }
  if (v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[WiFiAvailabilityEngine _handleWalletRelevancyAdded:removed:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: wallet networks no longer relevant: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (void)_handle3BarsRelevancyAdded:(id)a3 removed:(id)a4
{
  id v5;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[WiFiAvailabilityEngine _handle3BarsRelevancyAdded:removed:]";
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: 3bars networks became relevant: %@", (uint8_t *)&v7, 0x16u);
  }
  if (v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[WiFiAvailabilityEngine _handle3BarsRelevancyAdded:removed:]";
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: 3bars networks no longer relevant: %@", (uint8_t *)&v7, 0x16u);
  }

}

- (id)findRecommendationForScannedNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WiFiAvailabilityEngine findRecommendationsForScannedNetwork:](self, "findRecommendationsForScannedNetwork:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315650;
      v9 = "-[WiFiAvailabilityEngine findRecommendationForScannedNetwork:]";
      v10 = 2112;
      v11 = v5;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_1CC44E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: matches %@, for network %@", (uint8_t *)&v8, 0x20u);
    }
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)findRecommendationsForScannedNetwork:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[WiFiAvailabilityEngine availableNetworks](self, "availableNetworks", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToScannedNetwork:", v4))
          {
            objc_msgSend(v5, "addObject:", v11);
            goto LABEL_12;
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_12:

  }
  if (objc_msgSend(v5, "count"))
    v12 = v5;
  else
    v12 = 0;
  v13 = v12;

  return v13;
}

- (double)availabilityMatchMaximumAge
{
  return self->_availabilityMatchMaximumAge;
}

- (NSSet)providers
{
  return self->_providers;
}

- (void)setProviders:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setSources:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setAvailabilityChangedCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (WiFiScanProvider)scanProvider
{
  return (WiFiScanProvider *)objc_loadWeakRetained((id *)&self->_scanProvider);
}

- (void)setScanProvider:(id)a3
{
  objc_storeWeak((id *)&self->_scanProvider, a3);
}

- (WiFiLocationProvider)locationProvider
{
  return (WiFiLocationProvider *)objc_loadWeakRetained((id *)&self->_locationProvider);
}

- (void)setLocationProvider:(id)a3
{
  objc_storeWeak((id *)&self->_locationProvider, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (WiFiLexicon)wifiLexicon
{
  return self->_wifiLexicon;
}

- (void)setWifiLexicon:(id)a3
{
  objc_storeStrong((id *)&self->_wifiLexicon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiLexicon, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_locationProvider);
  objc_destroyWeak((id *)&self->_scanProvider);
  objc_storeStrong(&self->_availabilityChangedCallback, 0);
  objc_storeStrong((id *)&self->_availableNetworks, 0);
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_providers, 0);
}

@end
