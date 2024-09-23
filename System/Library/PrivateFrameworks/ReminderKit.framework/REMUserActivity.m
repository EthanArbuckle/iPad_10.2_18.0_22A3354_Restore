@implementation REMUserActivity

- (REMUserActivity)initWithType:(int64_t)a3 storage:(id)a4
{
  id v7;
  REMUserActivity *v8;
  REMUserActivity *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)REMUserActivity;
  v8 = -[REMUserActivity init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_storage, a4);
  }

  return v9;
}

- (REMUserActivity)initWithUniversalLink:(id)a3
{
  id v4;
  REMUserActivity *v5;
  REMUserActivity *v6;
  void *v7;
  REMUserActivity *v8;
  NSData *storage;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)REMUserActivity;
  v5 = -[REMUserActivity init](&v11, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  v5->_type = 1;
  objc_msgSend(v4, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (REMUserActivity *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    storage = v6->_storage;
    v6->_storage = (NSData *)v8;

LABEL_4:
    v8 = v6;
  }

  return v8;
}

- (REMUserActivity)initWithUserActivity:(id)a3
{
  id v4;
  REMUserActivity *v5;
  REMUserActivity *v6;
  uint64_t v7;
  NSData *storage;
  REMUserActivity *v9;
  NSObject *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)REMUserActivity;
  v5 = -[REMUserActivity init](&v12, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_4;
  v5->_type = 2;
  +[REMUserActivity dataFromUserActivity:](REMUserActivity, "dataFromUserActivity:", v4);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    storage = v6->_storage;
    v6->_storage = (NSData *)v7;

LABEL_4:
    v9 = v6;
    goto LABEL_8;
  }
  +[REMLog siriKit](REMLog, "siriKit");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[REMUserActivity initWithUserActivity:].cold.1();

  v9 = 0;
LABEL_8:

  return v9;
}

- (REMUserActivity)initWithUserActivityData:(id)a3
{
  id v5;
  REMUserActivity *v6;
  REMUserActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMUserActivity;
  v6 = -[REMUserActivity init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 2;
    objc_storeStrong((id *)&v6->_storage, a3);
  }

  return v7;
}

- (REMUserActivity)initWithSiriIntent:(id)a3
{
  id v4;
  REMUserActivity *v5;
  REMUserActivity *v6;
  NSData *v7;
  id v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  REMUserActivity *v12;
  NSData *storage;
  id v15;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)REMUserActivity;
  v5 = -[REMUserActivity init](&v16, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_10;
  v5->_type = 3;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v15);
  v7 = (NSData *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (!v9)
  {
    storage = v6->_storage;
    v6->_storage = v7;

LABEL_10:
    v12 = v6;
    goto LABEL_11;
  }
  v10 = v8;
  +[REMLog siriKit](REMLog, "siriKit");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    -[REMUserActivity initWithSiriIntent:].cold.1();

  v12 = 0;
LABEL_11:

  return v12;
}

+ (REMUserActivity)userActivityWithUserActivity:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  REMUserActivity *result;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__REMUserActivity_userActivityWithUserActivity_completion___block_invoke;
  v8[3] = &unk_1E67FA738;
  v9 = v5;
  v6 = v5;
  objc_msgSend(a3, "_createUserActivityDataWithOptions:completionHandler:", 0, v8);

  return result;
}

void __59__REMUserActivity_userActivityWithUserActivity_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  REMUserActivity *v8;
  NSObject *v9;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    +[REMLog siriKit](REMLog, "siriKit");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __59__REMUserActivity_userActivityWithUserActivity_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v8 = -[REMUserActivity initWithType:storage:]([REMUserActivity alloc], "initWithType:storage:", 2, v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  unint64_t v5;

  v3 = -[REMUserActivity type](self, "type");
  -[REMUserActivity storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  REMUserActivity *v4;
  REMUserActivity *v5;
  REMUserActivity *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v4 = (REMUserActivity *)a3;
  v5 = v4;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v7 = -[REMUserActivity type](self, "type"), v7 == -[REMUserActivity type](v6, "type")))
    {
      -[REMUserActivity storage](self, "storage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMUserActivity storage](v6, "storage");
      v9 = objc_claimAutoreleasedReturnValue();
      if (v8 == (void *)v9)
      {
        v13 = 1;
        v10 = v8;
      }
      else
      {
        v10 = (void *)v9;
        -[REMUserActivity storage](self, "storage");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMUserActivity storage](v6, "storage");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqual:", v12);

      }
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMUserActivity type](self, "type"), CFSTR("type"));
  -[REMUserActivity storage](self, "storage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("storage"));

}

- (REMUserActivity)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  REMUserActivity *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
  if ((unint64_t)(v5 - 1) >= 3)
  {
    v6 = os_log_create("com.apple.reminderkit", "default");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[REMUserActivity initWithCoder:].cold.1();

    v5 = 1;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("storage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[REMUserActivity initWithType:storage:]([REMUserActivity alloc], "initWithType:storage:", v5, v7);
  return v8;
}

+ (REMUserActivity)userActivityWithDictionaryData:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  id v8;
  REMUserActivity *v9;
  BOOL v10;
  NSObject *v11;
  id v13;

  v5 = (objc_class *)MEMORY[0x1E0CB3710];
  v6 = a3;
  v13 = 0;
  v7 = (void *)objc_msgSend([v5 alloc], "initForReadingFromData:error:", v6, &v13);

  v8 = v13;
  v9 = -[REMUserActivity initWithCoder:]([REMUserActivity alloc], "initWithCoder:", v7);
  if (v9)
    v10 = v8 == 0;
  else
    v10 = 0;
  if (!v10)
  {
    +[REMLog siriKit](REMLog, "siriKit");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[REMUserActivity userActivityWithDictionaryData:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease(v8);
  }

  return v9;
}

- (id)archivedDictionaryData
{
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[REMUserActivity encodeWithCoder:](self, "encodeWithCoder:", v3);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    +[REMLog siriKit](REMLog, "siriKit");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[REMUserActivity archivedDictionaryData].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

  }
  return v4;
}

+ (id)dataFromUserActivity:(id)a3
{
  id v3;
  dispatch_semaphore_t v4;
  NSObject *v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *, void *);
  void *v20;
  NSObject *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v3 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__14;
  v27 = __Block_byref_object_dispose__14;
  v28 = 0;
  v4 = dispatch_semaphore_create(0);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __40__REMUserActivity_dataFromUserActivity___block_invoke;
  v20 = &unk_1E67FA760;
  v22 = &v23;
  v5 = v4;
  v21 = v5;
  objc_msgSend(v3, "_createUserActivityDataWithOptions:completionHandler:", 0, &v17);
  v6 = dispatch_time(0, 5000000000);
  if (dispatch_semaphore_wait(v5, v6) >= 1)
  {
    +[REMLog siriKit](REMLog, "siriKit", v17, v18, v19, v20);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[REMUserActivity dataFromUserActivity:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);

  }
  v15 = (id)v24[5];

  _Block_object_dispose(&v23, 8);
  return v15;
}

void __40__REMUserActivity_dataFromUserActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    +[REMLog siriKit](REMLog, "siriKit");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __59__REMUserActivity_userActivityWithUserActivity_completion___block_invoke_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)universalLink
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[REMUserActivity type](self, "type") == 1)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[REMUserActivity storage](self, "storage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithData:encoding:", v4, 4);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", v5);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)userActivity
{
  id v3;
  void *v4;
  void *v5;

  if (-[REMUserActivity type](self, "type") == 2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CA5920]);
    -[REMUserActivity storage](self, "storage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "_initWithUserActivityData:", v4);

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)userActivityData
{
  void *v3;

  if (-[REMUserActivity type](self, "type") == 2)
  {
    -[REMUserActivity storage](self, "storage");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)siriIntent
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v10;
  id v11;

  if (-[REMUserActivity type](self, "type") != 3)
    return 0;
  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = objc_opt_class();
  -[REMUserActivity storage](self, "storage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v4, v5, &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v11;

  if (v7 || !v6)
  {
    +[REMLog siriKit](REMLog, "siriKit");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[REMUserActivity siriIntent].cold.1();

    v8 = 0;
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)REMUserActivity;
  -[REMUserActivity debugDescription](&v12, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "stringForActivityType:", -[REMUserActivity type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[REMUserActivity storage](self, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v7, "length"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMUserActivity debugDescriptionDetails](self, "debugDescriptionDetails");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ (type=%@, bytes=%@, details=%@)"), v3, v5, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)debugDescriptionDetails
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v3 = -[REMUserActivity type](self, "type");
  switch(v3)
  {
    case 3:
      -[REMUserActivity siriIntent](self, "siriIntent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "debugDescription");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[REMUserActivity userActivity](self, "userActivity");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v4, "activityType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "title");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "webpageURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "userInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringWithFormat:", CFSTR("{type: %@, title: %@, URL: %@, userInfo: %@}"), v8, v9, v10, v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 1:
      -[REMUserActivity universalLink](self, "universalLink");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "absoluteString");
      v5 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      v18.receiver = self;
      v18.super_class = (Class)REMUserActivity;
      -[REMUserActivity debugDescription](&v18, sel_debugDescription);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend((id)objc_opt_class(), "stringForActivityType:", -[REMUserActivity type](self, "type"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)MEMORY[0x1E0CB37E8];
      -[REMUserActivity storage](self, "storage");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "length"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (type=%@, bytes=%@)"), v4, v13, v16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
  }
  v6 = (void *)v5;
LABEL_9:

  return v6;
}

+ (id)stringForActivityType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) < 3)
    return off_1E67FA780[a3 - 1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown REMUserActivityType %ld"), a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)type
{
  return self->_type;
}

- (NSData)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

- (void)initWithUserActivity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, v0, v1, "Error when archiving NSUserActivity. {userActivity: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)initWithSiriIntent:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  v3 = 2112;
  v4 = v0;
  _os_log_fault_impl(&dword_1B4A39000, v1, OS_LOG_TYPE_FAULT, "Error when archiving Siri Intent. {siriIntent: %@, error: %@}", v2, 0x16u);
  OUTLINED_FUNCTION_3_1();
}

void __59__REMUserActivity_userActivityWithUserActivity_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Failed to serialize user activity {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)initWithCoder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, v0, v1, "Unknown REMUserActivityType %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

+ (void)userActivityWithDictionaryData:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Error decoding REMUserActivity {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)archivedDictionaryData
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "Error encoding REMUserActivity", a5, a6, a7, a8, 0);
}

+ (void)dataFromUserActivity:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "Timed out serializing user activity.", a5, a6, a7, a8, 0);
}

- (void)siriIntent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "Error when unarchiving Siri Intent. {error: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
