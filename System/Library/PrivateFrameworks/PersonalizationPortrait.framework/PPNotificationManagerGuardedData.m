@implementation PPNotificationManagerGuardedData

- (id)description
{
  id v3;
  NSObject *meCardDonationToken;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[9];
  __int128 v11;
  NSObject *meCardToken;
  NSObject *v13;
  void *v14;
  void *v15;
  __int128 v16;
  EKCalendarVisibilityManager *calendarVisibilityManager;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11 = *(_OWORD *)&self->_contactsToken;
  v10[0] = CFSTR("ct");
  v10[1] = CFSTR("cn");
  v10[2] = CFSTR("mt");
  v10[3] = CFSTR("md");
  meCardDonationToken = self->_meCardDonationToken;
  meCardToken = self->_meCardToken;
  v13 = meCardDonationToken;
  v10[4] = CFSTR("pct");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_portraitChangeToken);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  v10[5] = CFSTR("pit");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_portraitInvalidationToken);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v6;
  v16 = *(_OWORD *)&self->_eventKitToken;
  v10[6] = CFSTR("et");
  v10[7] = CFSTR("es");
  v10[8] = CFSTR("cvm");
  calendarVisibilityManager = self->_calendarVisibilityManager;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, v10, 9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPNotificationManagerGuardedData %@>"), v7);

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suggestionsToken, 0);
  objc_storeStrong((id *)&self->_suggestionsHandler, 0);
  objc_storeStrong((id *)&self->_suggestionsService, 0);
  objc_storeStrong((id *)&self->_calendarVisibilityManager, 0);
  objc_storeStrong((id *)&self->_calendarHandler, 0);
  objc_storeStrong((id *)&self->_ekStore, 0);
  objc_storeStrong((id *)&self->_eventKitToken, 0);
  objc_storeStrong((id *)&self->_eventKitHandler, 0);
  objc_storeStrong((id *)&self->_portraitInvalidationHandler, 0);
  objc_storeStrong((id *)&self->_portraitChangeHandler, 0);
  objc_storeStrong((id *)&self->_meCardDonationToken, 0);
  objc_storeStrong((id *)&self->_meCardToken, 0);
  objc_storeStrong((id *)&self->_meCardHandler, 0);
  objc_storeStrong((id *)&self->_cnStore, 0);
  objc_storeStrong((id *)&self->_contactsToken, 0);
  objc_storeStrong((id *)&self->_contactsHandler, 0);
}

@end
