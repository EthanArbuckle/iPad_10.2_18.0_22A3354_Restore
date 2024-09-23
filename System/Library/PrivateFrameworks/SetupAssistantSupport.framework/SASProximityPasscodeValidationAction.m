@implementation SASProximityPasscodeValidationAction

+ (unint64_t)actionID
{
  return 7;
}

+ (id)actionFromDictionary:(id)a3
{
  id v3;
  SASProximityPasscodeValidationAction *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init(SASProximityPasscodeValidationAction);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("passcode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SASProximityPasscodeValidationAction setPasscode:](v4, "setPasscode:", v5);
  return v4;
}

- (BOOL)hasResponse
{
  return 1;
}

- (id)requestPayload
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("passcode");
  -[SASProximityPasscodeValidationAction passcode](self, "passcode");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)responsePayload
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASProximityPasscodeValidationAction passcode](self, "passcode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "unlockDeviceWithPasscode:outError:", v4, 0);

  v16 = CFSTR("success");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    +[SASLogging facility](SASLogging, "facility");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1D45FD000, v11, OS_LOG_TYPE_DEFAULT, "Failed to archive response: %@", buf, 0xCu);
    }

  }
  return v8;
}

- (void)setResponseFromData:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = a3;
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v5, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v9, v6, &v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v14;
  if (!v10)
  {
    +[SASLogging facility](SASLogging, "facility");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_impl(&dword_1D45FD000, v12, OS_LOG_TYPE_DEFAULT, "Failed to unarchive data: %@", buf, 0xCu);
    }

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("success"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SASProximityPasscodeValidationAction setPasscodeValid:](self, "setPasscodeValid:", objc_msgSend(v13, "BOOLValue"));

}

- (NSString)passcode
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPasscode:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)passcodeValid
{
  return self->_passcodeValid;
}

- (void)setPasscodeValid:(BOOL)a3
{
  self->_passcodeValid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
}

@end
