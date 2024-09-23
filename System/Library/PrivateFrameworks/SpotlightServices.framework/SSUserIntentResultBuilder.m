@implementation SSUserIntentResultBuilder

+ (BOOL)supportsResult:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "contentType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasPrefix:", *MEMORY[0x1E0CBD4D0]);

  return v4;
}

- (SSUserIntentResultBuilder)initWithResult:(id)a3
{
  id v4;
  SSUserIntentResultBuilder *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SSUserIntentResultBuilder;
  v5 = -[SSResultBuilder initWithResult:](&v15, sel_initWithResult_, v4);
  if (v5)
  {
    objc_msgSend(v4, "applicationBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSUserIntentResultBuilder setAppBundleId:](v5, "setAppBundleId:", v6);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6058], objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSUserIntentResultBuilder setIsBackgroundRunnable:](v5, "setIsBackgroundRunnable:", objc_msgSend(v7, "BOOLValue"));

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA68C8], objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSUserIntentResultBuilder setStartDate:](v5, "setStartDate:", v8);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6968], objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSUserIntentResultBuilder setIntentName:](v5, "setIntentName:", v9);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6730], objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSUserIntentResultBuilder setPunchoutLabel:](v5, "setPunchoutLabel:", v10);

    -[SSResultBuilder result](v5, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "valueForAttribute:withType:", *MEMORY[0x1E0CA6990], objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSUserIntentResultBuilder setUserActivityData:](v5, "setUserActivityData:", v12);

    objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA69A8], objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(v4, "valueForAttribute:withType:", *MEMORY[0x1E0CA6380], objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[SSUserIntentResultBuilder setUserActivityRequiredString:](v5, "setUserActivityRequiredString:", v13);

  }
  return v5;
}

- (id)buildResult
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSUserIntentResultBuilder;
  -[SSResultBuilder buildResult](&v6, sel_buildResult);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SSUserIntentResultBuilder userActivityRequiredString](self, "userActivityRequiredString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserActivityRequiredString:", v4);

  objc_msgSend(v3, "setType:", 20);
  return v3;
}

- (id)buildCommand
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v3 = (void *)MEMORY[0x1BCCB3708](self, a2);
  -[SSResultBuilder result](self, "result");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userActivityRequiredString");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;

  }
  else
  {
    -[SSUserIntentResultBuilder userActivityRequiredString](self, "userActivityRequiredString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v8 = 0;
      v7 = 0;
      goto LABEL_8;
    }
  }
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v6);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0DC7940], "donationWithUUID:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
LABEL_8:
  objc_msgSend(v8, "interaction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 0, &v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    if (v12)
    {
      SSGeneralLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SSUserIntentResultBuilder buildCommand].cold.2((uint64_t)v12, v13);

    }
  }
  else
  {
    SSGeneralLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SSUserIntentResultBuilder buildCommand].cold.1(v12);
    v11 = 0;
  }

  objc_autoreleasePoolPop(v3);
  v14 = (void *)objc_opt_new();
  v15 = v14;
  if (v11)
  {
    objc_msgSend(v14, "setIntentMessageData:", v11);
  }
  else
  {
    -[SSUserIntentResultBuilder userActivityData](self, "userActivityData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setIntentMessageData:", v16);

  }
  return v15;
}

- (id)buildThumbnail
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SSUserIntentResultBuilder;
  -[SSResultBuilder buildThumbnail](&v6, sel_buildThumbnail);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    -[SSUserIntentResultBuilder appBundleId](self, "appBundleId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBundleIdentifier:", v4);

  }
  return v3;
}

- (id)buildDescriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[SSResultBuilder result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentTypeTree");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", *MEMORY[0x1E0CBD4C8]) & 1) != 0)
  {
    -[SSUserIntentResultBuilder startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      +[SSDateFormatManager shortDateTimeFormatter](SSDateFormatManager, "shortDateTimeFormatter");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSUserIntentResultBuilder startDate](self, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringFromDate:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)MEMORY[0x1E0CB3940];
      +[SSDateFormatManager dateLastCalledStringFormat](SSDateFormatManager, "dateLastCalledStringFormat");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0D8C660], "textWithString:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      return v13;
    }
  }
  else
  {

  }
  return 0;
}

- (BOOL)isBackgroundRunnable
{
  return self->_isBackgroundRunnable;
}

- (void)setIsBackgroundRunnable:(BOOL)a3
{
  self->_isBackgroundRunnable = a3;
}

- (NSData)userActivityData
{
  return self->_userActivityData;
}

- (void)setUserActivityData:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityData, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSString)appBundleId
{
  return self->_appBundleId;
}

- (void)setAppBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_appBundleId, a3);
}

- (NSString)intentName
{
  return self->_intentName;
}

- (void)setIntentName:(id)a3
{
  objc_storeStrong((id *)&self->_intentName, a3);
}

- (NSString)punchoutLabel
{
  return self->_punchoutLabel;
}

- (void)setPunchoutLabel:(id)a3
{
  objc_storeStrong((id *)&self->_punchoutLabel, a3);
}

- (NSString)userActivityRequiredString
{
  return self->_userActivityRequiredString;
}

- (void)setUserActivityRequiredString:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityRequiredString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivityRequiredString, 0);
  objc_storeStrong((id *)&self->_punchoutLabel, 0);
  objc_storeStrong((id *)&self->_intentName, 0);
  objc_storeStrong((id *)&self->_appBundleId, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
}

- (void)buildCommand
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B86C5000, a2, OS_LOG_TYPE_ERROR, "SSUserIntentResultBuilder: eror when converting intent to data: %@", (uint8_t *)&v2, 0xCu);
}

@end
