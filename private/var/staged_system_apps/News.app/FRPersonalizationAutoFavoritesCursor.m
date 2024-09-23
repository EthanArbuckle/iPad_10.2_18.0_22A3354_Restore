@implementation FRPersonalizationAutoFavoritesCursor

- (FRPersonalizationAutoFavoritesCursor)initWithCoreDuetLastQueryDate:(id)a3 portraitLastQueryDate:(id)a4
{
  id v7;
  id v8;
  FRPersonalizationAutoFavoritesCursor *v9;
  FRPersonalizationAutoFavoritesCursor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FRPersonalizationAutoFavoritesCursor;
  v9 = -[FRPersonalizationAutoFavoritesCursor init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_coreDuetLastQueryDate, a3);
    objc_storeStrong((id *)&v10->_portraitLastQueryDate, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesCursor lastInternalSignalProcessingDate](self, "lastInternalSignalProcessingDate"));
  objc_msgSend(v4, "setLastInternalSignalProcessingDate:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesCursor lastExternalSignalProcessingDate](self, "lastExternalSignalProcessingDate"));
  objc_msgSend(v4, "setLastExternalSignalProcessingDate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesCursor coreDuetLastQueryDate](self, "coreDuetLastQueryDate"));
  objc_msgSend(v4, "setCoreDuetLastQueryDate:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesCursor portraitLastQueryDate](self, "portraitLastQueryDate"));
  objc_msgSend(v4, "setPortraitLastQueryDate:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesCursor lastAppUsageAutoFavoriteResults](self, "lastAppUsageAutoFavoriteResults"));
  objc_msgSend(v4, "setLastAppUsageAutoFavoriteResults:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesCursor lastSafariAutoFavoriteResults](self, "lastSafariAutoFavoriteResults"));
  objc_msgSend(v4, "setLastSafariAutoFavoriteResults:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesCursor lastPortraitAutoFavoriteResults](self, "lastPortraitAutoFavoriteResults"));
  objc_msgSend(v4, "setLastPortraitAutoFavoriteResults:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesCursor lastLocationAutoFavoriteResults](self, "lastLocationAutoFavoriteResults"));
  objc_msgSend(v4, "setLastLocationAutoFavoriteResults:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesCursor lastInternalSignalAutoFavorites](self, "lastInternalSignalAutoFavorites"));
  objc_msgSend(v4, "setLastInternalSignalAutoFavorites:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRPersonalizationAutoFavoritesCursor lastInternalSignalGroupableFavorites](self, "lastInternalSignalGroupableFavorites"));
  objc_msgSend(v4, "setLastInternalSignalGroupableFavorites:", v14);

  return v4;
}

- (NSDate)coreDuetLastQueryDate
{
  return self->_coreDuetLastQueryDate;
}

- (void)setCoreDuetLastQueryDate:(id)a3
{
  objc_storeStrong((id *)&self->_coreDuetLastQueryDate, a3);
}

- (NSDate)portraitLastQueryDate
{
  return self->_portraitLastQueryDate;
}

- (void)setPortraitLastQueryDate:(id)a3
{
  objc_storeStrong((id *)&self->_portraitLastQueryDate, a3);
}

- (NSDate)lastInternalSignalProcessingDate
{
  return self->_lastInternalSignalProcessingDate;
}

- (void)setLastInternalSignalProcessingDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastInternalSignalProcessingDate, a3);
}

- (NSDate)lastExternalSignalProcessingDate
{
  return self->_lastExternalSignalProcessingDate;
}

- (void)setLastExternalSignalProcessingDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastExternalSignalProcessingDate, a3);
}

- (NSSet)lastAppUsageAutoFavoriteResults
{
  return self->_lastAppUsageAutoFavoriteResults;
}

- (void)setLastAppUsageAutoFavoriteResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSSet)lastSafariAutoFavoriteResults
{
  return self->_lastSafariAutoFavoriteResults;
}

- (void)setLastSafariAutoFavoriteResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSSet)lastPortraitAutoFavoriteResults
{
  return self->_lastPortraitAutoFavoriteResults;
}

- (void)setLastPortraitAutoFavoriteResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSSet)lastLocationAutoFavoriteResults
{
  return self->_lastLocationAutoFavoriteResults;
}

- (void)setLastLocationAutoFavoriteResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSSet)lastInternalSignalAutoFavorites
{
  return self->_lastInternalSignalAutoFavorites;
}

- (void)setLastInternalSignalAutoFavorites:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSSet)lastInternalSignalGroupableFavorites
{
  return self->_lastInternalSignalGroupableFavorites;
}

- (void)setLastInternalSignalGroupableFavorites:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastInternalSignalGroupableFavorites, 0);
  objc_storeStrong((id *)&self->_lastInternalSignalAutoFavorites, 0);
  objc_storeStrong((id *)&self->_lastLocationAutoFavoriteResults, 0);
  objc_storeStrong((id *)&self->_lastPortraitAutoFavoriteResults, 0);
  objc_storeStrong((id *)&self->_lastSafariAutoFavoriteResults, 0);
  objc_storeStrong((id *)&self->_lastAppUsageAutoFavoriteResults, 0);
  objc_storeStrong((id *)&self->_lastExternalSignalProcessingDate, 0);
  objc_storeStrong((id *)&self->_lastInternalSignalProcessingDate, 0);
  objc_storeStrong((id *)&self->_portraitLastQueryDate, 0);
  objc_storeStrong((id *)&self->_coreDuetLastQueryDate, 0);
}

@end
