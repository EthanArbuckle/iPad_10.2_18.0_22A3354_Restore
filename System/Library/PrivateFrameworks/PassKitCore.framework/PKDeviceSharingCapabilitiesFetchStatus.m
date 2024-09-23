@implementation PKDeviceSharingCapabilitiesFetchStatus

- (PKDeviceSharingCapabilitiesFetchStatus)initWithAppleID:(id)a3 fetchStartDate:(id)a4
{
  id v7;
  id v8;
  PKDeviceSharingCapabilitiesFetchStatus *v9;
  PKDeviceSharingCapabilitiesFetchStatus *v10;
  NSMutableArray *v11;
  NSMutableArray *fetchedCapabilities;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKDeviceSharingCapabilitiesFetchStatus;
  v9 = -[PKDeviceSharingCapabilitiesFetchStatus init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appleID, a3);
    objc_storeStrong((id *)&v10->_fetchStartDate, a4);
    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    fetchedCapabilities = v10->_fetchedCapabilities;
    v10->_fetchedCapabilities = v11;

  }
  return v10;
}

- (BOOL)hasDeviceVersionWithOSVersionRequirementRange:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  NSString *appleID;
  const __CFString *v16;
  NSObject *v17;
  const char *v18;
  void *v19;
  NSString *v20;
  const __CFString *v21;
  void *v22;
  NSString *v23;
  const __CFString *v24;
  void *v25;
  NSString *v26;
  const __CFString *v27;
  uint64_t v28;
  BOOL v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const __CFString *v37;
  __int16 v38;
  NSString *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = self->_fetchedCapabilities;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (!v6)
    goto LABEL_32;
  v8 = v6;
  v9 = *(_QWORD *)v33;
  *(_QWORD *)&v7 = 138412546;
  v31 = v7;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v33 != v9)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v10), "fromDeviceVersion", v31, (_QWORD)v32);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "watch");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = objc_msgSend(v4, "versionMeetsRequirements:deviceClass:", v11, CFSTR("Watch"));
        PKLogFacilityTypeGetObject(6uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        appleID = self->_appleID;
        v16 = CFSTR("NO");
        if (v13)
          v16 = CFSTR("YES");
        *(_DWORD *)buf = v31;
        v37 = v16;
        v38 = 2112;
        v39 = appleID;
        v17 = v14;
        v18 = "Compared version requirements for watch. Meets requirements %@. For appleID: %@";
        goto LABEL_26;
      }
      objc_msgSend(v11, "ipad");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v13 = objc_msgSend(v4, "versionMeetsRequirements:deviceClass:", v11, CFSTR("iPad"));
        PKLogFacilityTypeGetObject(6uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        v20 = self->_appleID;
        v21 = CFSTR("NO");
        if (v13)
          v21 = CFSTR("YES");
        *(_DWORD *)buf = v31;
        v37 = v21;
        v38 = 2112;
        v39 = v20;
        v17 = v14;
        v18 = "Compared version requirements for ipad. Meets requirements %@. For appleID: %@";
        goto LABEL_26;
      }
      objc_msgSend(v11, "iphone");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v13 = objc_msgSend(v4, "versionMeetsRequirements:deviceClass:", v11, CFSTR("iPhone"));
        PKLogFacilityTypeGetObject(6uLL);
        v14 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          goto LABEL_27;
        v23 = self->_appleID;
        v24 = CFSTR("NO");
        if (v13)
          v24 = CFSTR("YES");
        *(_DWORD *)buf = v31;
        v37 = v24;
        v38 = 2112;
        v39 = v23;
        v17 = v14;
        v18 = "Compared version requirements for iphone. Meets requirements %@. For appleID: %@";
        goto LABEL_26;
      }
      objc_msgSend(v11, "vision");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v25)
      {

        goto LABEL_28;
      }
      v13 = objc_msgSend(v4, "versionMeetsRequirements:deviceClass:", v11, CFSTR("RealityDevice"));
      PKLogFacilityTypeGetObject(6uLL);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v26 = self->_appleID;
        v27 = CFSTR("NO");
        if (v13)
          v27 = CFSTR("YES");
        *(_DWORD *)buf = v31;
        v37 = v27;
        v38 = 2112;
        v39 = v26;
        v17 = v14;
        v18 = "Compared version requirements for vision. Meets requirements %@. For appleID: %@";
LABEL_26:
        _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
      }
LABEL_27:

      if ((v13 & 1) != 0)
      {
        v29 = 1;
        goto LABEL_34;
      }
LABEL_28:
      ++v10;
    }
    while (v8 != v10);
    v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    v8 = v28;
  }
  while (v28);
LABEL_32:
  v29 = 0;
LABEL_34:

  return v29;
}

- (void)addDeviceSharingCapabilities:(id)a3
{
  -[NSMutableArray safelyAddObject:](self->_fetchedCapabilities, "safelyAddObject:", a3);
}

- (NSArray)fetchedCapabilities
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_fetchedCapabilities, "copy");
}

- (BOOL)allPossibleCapabilitiesFetched
{
  return -[NSMutableArray count](self->_fetchedCapabilities, "count") == self->_maximumPossibleDevices;
}

- (int64_t)secondsPassedSinceFetchStart
{
  void *v3;
  double v4;
  int64_t v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", self->_fetchStartDate);
  v5 = (uint64_t)v4;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("maximumPossibleDevices: %ld; "), self->_maximumPossibleDevices);
  objc_msgSend(v3, "appendFormat:", CFSTR("fetchStartDate: '%@'; "), self->_fetchStartDate);
  objc_msgSend(v3, "appendFormat:", CFSTR("fetchError: '%@'; "), self->_fetchError);
  objc_msgSend(v3, "appendFormat:", CFSTR("appleID: '%@'; "), self->_appleID);
  objc_msgSend(v3, "appendFormat:", CFSTR("fetchedCapabilities: '%@'; "), self->_fetchedCapabilities);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (int64_t)maximumPossibleDevices
{
  return self->_maximumPossibleDevices;
}

- (void)setMaximumPossibleDevices:(int64_t)a3
{
  self->_maximumPossibleDevices = a3;
}

- (NSDate)fetchStartDate
{
  return self->_fetchStartDate;
}

- (NSError)fetchError
{
  return self->_fetchError;
}

- (void)setFetchError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)deviceCountFetchInProgress
{
  return self->_deviceCountFetchInProgress;
}

- (void)setDeviceCountFetchInProgress:(BOOL)a3
{
  self->_deviceCountFetchInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchError, 0);
  objc_storeStrong((id *)&self->_fetchStartDate, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong((id *)&self->_fetchedCapabilities, 0);
}

@end
