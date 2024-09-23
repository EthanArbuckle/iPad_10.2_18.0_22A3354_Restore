@implementation TPSContextualEventValidation

- (void)dataProvider:(id)a3 didFinishQueryWithResults:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  unint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD);

  objc_msgSend(a4, "firstObject", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSContextualEventValidation event](self, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "status");

  if (v7 == 1)
  {
    objc_msgSend(v5, "observationMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "count");
    -[TPSContextualEventValidation event](self, "event");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v10 >= objc_msgSend(v11, "minObservationCount");

    goto LABEL_5;
  }
  if (!v7)
  {
    objc_msgSend(v5, "observationMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") == 0;
LABEL_5:

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[TPSContextualEventValidation dataProvider:didFinishQueryWithResults:].cold.2(self, v12);

  v9 = 0;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[TPSContextualEventValidation dataProvider:didFinishQueryWithResults:].cold.1(self, v9, v13);

  -[TPSContextualEventValidation completionHandler](self, "completionHandler");
  v14 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v14[2](v14, v9, 0);

  -[TPSContextualEventValidation setCompletionHandler:](self, "setCompletionHandler:", 0);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)validateWithCompletion:(id)a3
{
  void (**v4)(id, _QWORD, void *);
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
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  -[TPSContextualEventValidation event](self, "event");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)objc_opt_class();
    -[TPSTargetingValidation value](self, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contextualEventFromEventDictionary:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSContextualEventValidation setEvent:](self, "setEvent:", v8);

    -[TPSContextualEventValidation event](self, "event");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        -[TPSTargetingValidation value](self, "value");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v28 = v23;
        v24 = "Failed to create event from value: %@";
        goto LABEL_11;
      }
LABEL_12:

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 22, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v15);
      goto LABEL_16;
    }
  }
  v10 = (void *)objc_opt_class();
  -[TPSContextualEventValidation event](self, "event");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_eventProviderForContextualEvent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSContextualEventValidation setEventProvider:](self, "setEventProvider:", v12);

  -[TPSContextualEventValidation eventProvider](self, "eventProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      -[TPSContextualEventValidation event](self, "event");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v28 = v23;
      v24 = "Failed to create event provider from event: %@";
LABEL_11:
      _os_log_impl(&dword_1DAC2F000, v22, OS_LOG_TYPE_INFO, v24, buf, 0xCu);

      goto LABEL_12;
    }
    goto LABEL_12;
  }
  -[TPSContextualEventValidation event](self, "event");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventSinceDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15
    && (objc_msgSend(MEMORY[0x1E0C99D68], "now"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "compare:", v15),
        v16,
        v17 == -1))
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v15;
      _os_log_impl(&dword_1DAC2F000, v25, OS_LOG_TYPE_INFO, "Event since date (%@) is the future - skipping", buf, 0xCu);
    }

    v4[2](v4, 0, 0);
  }
  else
  {
    -[TPSContextualEventValidation setCompletionHandler:](self, "setCompletionHandler:", v4);
    -[TPSContextualEventValidation eventProvider](self, "eventProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDelegate:", self);

    -[TPSContextualEventValidation eventProvider](self, "eventProvider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TPSContextualEventValidation event](self, "event");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "queryEvents:", v21);

  }
LABEL_16:

}

- (TPSContextualEvent)event
{
  return self->_event;
}

- (TPSEventsProvider)eventProvider
{
  return self->_eventProvider;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setEventProvider:(id)a3
{
  objc_storeStrong((id *)&self->_eventProvider, a3);
}

+ (id)_eventProviderForContextualEvent:(id)a3
{
  uint64_t v3;
  Class *v4;

  v3 = objc_msgSend(a3, "type");
  if (v3 == 1)
  {
    v4 = (Class *)0x1E0DBF320;
    return objc_alloc_init(*v4);
  }
  if (v3 == 2)
  {
    v4 = (Class *)0x1E0DBF360;
    return objc_alloc_init(*v4);
  }
  return 0;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_eventProvider, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

- (TPSContextualEventValidation)initWithContextualEvent:(id)a3
{
  id v5;
  TPSContextualEventValidation *v6;
  TPSContextualEventValidation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSContextualEventValidation;
  v6 = -[TPSTargetingValidation initWithTargetContext:](&v9, sel_initWithTargetContext_, MEMORY[0x1E0C9AA70]);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_event, a3);

  return v7;
}

- (BOOL)isRegistrable
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)MEMORY[0x1E0DBF390];
  -[TPSTargetingValidation value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "typeFromEventDictionary:", v3);

  return v4 == 3;
}

+ (id)contextualEventFromEventDictionary:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0DBF390], "typeFromEventDictionary:", v3);
  if (v4 == 3)
  {
    objc_msgSend(MEMORY[0x1E0DBF378], "contextualBiomeEventFromDictionary:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else if (v4 == 2)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0DBF388]), "initWithDictionary:", v3);
  }
  else
  {
    if (v4)
    {
      v6 = 0;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0DBF378], "contextualBiomeEventFromDuetEventDictionary:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
LABEL_9:

  return v6;
}

- (void)dataProvider:(NSObject *)a3 didFinishQueryWithResults:.cold.1(void *a1, char a2, NSObject *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "targetContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "debugDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138413058;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v9;
  v16 = 1024;
  v17 = a2 & 1;
  _os_log_debug_impl(&dword_1DAC2F000, a3, OS_LOG_TYPE_DEBUG, "%@ - targetContext: %@. Event: %@, Valid: %d", (uint8_t *)&v10, 0x26u);

}

- (void)dataProvider:(void *)a1 didFinishQueryWithResults:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "targetContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DAC2F000, a2, OS_LOG_TYPE_ERROR, "%@ - targetContext: %@. Unknown Event Status", (uint8_t *)&v6, 0x16u);

}

@end
