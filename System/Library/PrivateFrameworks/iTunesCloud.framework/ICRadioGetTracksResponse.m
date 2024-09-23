@implementation ICRadioGetTracksResponse

- (ICRadioGetTracksResponse)initWithResponseDictionary:(id)a3 expirationDate:(id)a4
{
  id v6;
  ICRadioGetTracksResponse *v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)ICRadioGetTracksResponse;
  v7 = -[ICRadioResponse initWithResponseDictionary:expirationDate:](&v10, sel_initWithResponseDictionary_expirationDate_, a3, v6);
  if (v7)
  {
    v8 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 10800.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong((id *)&v7->_assetExpirationDate, v8);
    if (!v6)

  }
  return v7;
}

- (ICRadioStationMetadata)stationMetadata
{
  void *v2;
  void *v3;
  ICRadioStationMetadata *v4;

  -[ICRadioResponse contentDictionary](self, "contentDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("station-dict"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (_NSIsNSDictionary())
    v4 = -[ICRadioStationMetadata initWithResponseDictionary:]([ICRadioStationMetadata alloc], "initWithResponseDictionary:", v3);
  else
    v4 = 0;

  return v4;
}

- (int64_t)tracklistActionType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ICRadioResponse contentDictionary](self, "contentDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("tracklist-action-type"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = 0;

  return v4;
}

- (NSArray)tracks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  ICRadioStationTrack *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[ICRadioResponse contentDictionary](self, "contentDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("station-track-dict"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_NSIsNSDictionary())
    goto LABEL_19;
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!_NSIsNSArray() || !objc_msgSend(v6, "count"))
  {

LABEL_19:
    v10 = 0;
    goto LABEL_20;
  }
  v16 = v4;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        if (_NSIsNSDictionary())
        {
          v14 = -[ICRadioStationTrack initWithResponseDictionary:responseVersion:expirationDate:]([ICRadioStationTrack alloc], "initWithResponseDictionary:responseVersion:expirationDate:", v13, -[ICRadioResponse version](self, "version"), self->_assetExpirationDate);
          if (v14)
          {
            if (!v10)
              v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v10, "addObject:", v14);
          }

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  v4 = v16;
LABEL_20:

  return (NSArray *)v10;
}

- (NSDate)assetExpirationDate
{
  return self->_assetExpirationDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetExpirationDate, 0);
}

@end
