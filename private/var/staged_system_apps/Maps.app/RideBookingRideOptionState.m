@implementation RideBookingRideOptionState

+ (RideBookingRideOptionState)stateWithRideOptionStatusMap:(id)a3 appStoreSuggestions:(id)a4 installedSuggestions:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init((Class)a1);
  v12 = objc_msgSend(v10, "copy");

  objc_msgSend(v11, "setRideOptionStatusMap:", v12);
  objc_msgSend(v11, "setAppStoreSuggestions:", v9);

  objc_msgSend(v11, "setInstalledSuggestions:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appStoreSuggestions"));

  if (!v13)
    objc_msgSend(v11, "setLoadingAppStoreSuggestions:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "appStoreSuggestions"));
  if (objc_msgSend(v14, "count"))
    v15 = 0;
  else
    v15 = objc_msgSend(v11, "loadingAppStoreSuggestions") ^ 1;
  objc_msgSend(v11, "setNoAppStoreSuggestionsAvailable:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rideOptionStatusMap"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "allValues"));
  objc_msgSend(v11, "setNoRideOptionsAvailable:", objc_msgSend(v17, "count") == 0);

  return (RideBookingRideOptionState *)v11;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@"), self->_rideOptionStatusMap);
}

- (NSDictionary)rideOptionStatusMap
{
  return self->_rideOptionStatusMap;
}

- (void)setRideOptionStatusMap:(id)a3
{
  objc_storeStrong((id *)&self->_rideOptionStatusMap, a3);
}

- (NSArray)installedSuggestions
{
  return self->_installedSuggestions;
}

- (void)setInstalledSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_installedSuggestions, a3);
}

- (NSArray)appStoreSuggestions
{
  return self->_appStoreSuggestions;
}

- (void)setAppStoreSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_appStoreSuggestions, a3);
}

- (BOOL)loadingAppStoreSuggestions
{
  return self->_loadingAppStoreSuggestions;
}

- (void)setLoadingAppStoreSuggestions:(BOOL)a3
{
  self->_loadingAppStoreSuggestions = a3;
}

- (BOOL)noAppStoreSuggestionsAvailable
{
  return self->_noAppStoreSuggestionsAvailable;
}

- (void)setNoAppStoreSuggestionsAvailable:(BOOL)a3
{
  self->_noAppStoreSuggestionsAvailable = a3;
}

- (BOOL)noRideOptionsAvailable
{
  return self->_noRideOptionsAvailable;
}

- (void)setNoRideOptionsAvailable:(BOOL)a3
{
  self->_noRideOptionsAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appStoreSuggestions, 0);
  objc_storeStrong((id *)&self->_installedSuggestions, 0);
  objc_storeStrong((id *)&self->_rideOptionStatusMap, 0);
}

@end
