@implementation SKIFitnessInvocation

+ (id)announceWorkoutReminder:(id)a3 announcePayload:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  SKIDirectInvocationPayload *v19;
  void *v20;
  void *v21;

  v6 = (objc_class *)MEMORY[0x24BDBCED8];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithCapacity:", 8);
  objc_msgSend(v8, "predictionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v10, CFSTR("predictionIdentifier"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "workoutType"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v11, CFSTR("workoutType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "workoutActivityType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v12, CFSTR("workoutActivityType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "workoutLocationType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v13, CFSTR("workoutLocationType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v8, "workoutSwimmingLocationType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v14, CFSTR("workoutSwimmingLocationType"));

  v15 = (void *)MEMORY[0x24BDD16E0];
  v16 = objc_msgSend(v8, "predictionType");

  objc_msgSend(v15, "numberWithInteger:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:forKey:", v17, CFSTR("predictionType"));

  objc_msgSend(a1, "updateDict:withAnnouncePayload:", v9, v7);
  +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.fitness.announceWorkoutReminder"));
  -[SKIDirectInvocationPayload setUserData:](v19, "setUserData:", v9);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)workoutReminderFromPayload:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("predictionIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("predictionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("workoutType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("workoutActivityType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("workoutLocationType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("workoutSwimmingLocationType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "integerValue");
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE09308]), "initWithPredictionIdentifier:predictionType:workoutType:workoutActivityType:locationType:swimmingLocationType:", v5, v7, v9, v11, v13, v15);

  return v16;
}

+ (id)announceWorkoutVoiceFeedback:(id)a3 announcePayload:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  SKIDirectInvocationPayload *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(a1, "updateDict:withAnnouncePayload:", v7, v6);

  +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", CFSTR("com.apple.siri.directInvocation.fitness.announceWorkoutVoiceFeedback"));
  -[SKIDirectInvocationPayload setUserData:](v9, "setUserData:", v7);
  +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)updateStartLocalRequest:(id)a3 withNewAnnouncePayload:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  SKIDirectInvocationPayload *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  id v38;

  v6 = a4;
  objc_msgSend(a3, "clientBoundCommands");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "parse");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "directInvocation");
    v10 = objc_claimAutoreleasedReturnValue();

    -[NSObject invocationIdentifier](v10, "invocationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.siri.directInvocation.fitness.announceWorkoutReminder")) & 1) != 0|| (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.siri.directInvocation.fitness.announceWorkoutVoiceFeedback")) & 1) != 0)
    {
      v12 = -[SKIDirectInvocationPayload initWithIdentifier:]([SKIDirectInvocationPayload alloc], "initWithIdentifier:", v11);
      -[NSObject data](v10, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v14 = (void *)MEMORY[0x24BDD1770];
        -[NSObject data](v10, "data");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0;
        objc_msgSend(v14, "propertyListWithData:options:format:error:", v15, 0, 0, &v38);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v38;
        -[SKIDirectInvocationPayload setUserData:](v12, "setUserData:", v16);

        if (v17)
        {
          SKIDefaultLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            +[SKIFitnessInvocation updateStartLocalRequest:withNewAnnouncePayload:].cold.2();
          v19 = 0;
        }
        else
        {
          -[SKIDirectInvocationPayload userData](v12, "userData");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v34, "mutableCopy");

          objc_msgSend(a1, "updateDict:withAnnouncePayload:", v18, v6);
          -[SKIDirectInvocationPayload setUserData:](v12, "setUserData:", v18);
          +[SKIDirectInvocationContext contextForAnnounceNotifications](SKIDirectInvocationContext, "contextForAnnounceNotifications");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          +[SKIDirectInvocation runSiriKitExecutorCommandWithContext:payload:](SKIDirectInvocation, "runSiriKitExecutorCommandWithContext:payload:", v35, v12);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          +[SKIDirectInvocation wrapCommandInStartLocalRequest:](SKIDirectInvocation, "wrapCommandInStartLocalRequest:", v36);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

        }
      }
      else
      {
        SKIDefaultLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          +[SKIFitnessInvocation updateStartLocalRequest:withNewAnnouncePayload:].cold.1(v17, v27, v28, v29, v30, v31, v32, v33);
        v19 = 0;
      }

    }
    else
    {
      SKIDefaultLog();
      v12 = (SKIDirectInvocationPayload *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
        +[SKIFitnessInvocation updateStartLocalRequest:withNewAnnouncePayload:].cold.3();
      v19 = 0;
    }

  }
  else
  {
    SKIDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[SKIFitnessInvocation updateStartLocalRequest:withNewAnnouncePayload:].cold.4(v10, v20, v21, v22, v23, v24, v25, v26);
    v19 = 0;
  }

  return v19;
}

+ (void)updateDict:(id)a3 withAnnouncePayload:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "appBundleIdOfLastAnnouncement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    objc_msgSend(v6, "appBundleIdOfLastAnnouncement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v9, CFSTR("appBundleIdOfLastAnnouncement"));

  }
  else
  {
    objc_msgSend(v5, "removeObjectForKey:", CFSTR("appBundleIdOfLastAnnouncement"));
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "synchronousBurstIndex"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v10, CFSTR("synchronousBurstIndex"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v6, "isSameTypeAsLastAnnouncement"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v11, CFSTR("isSameTypeAsLastAnnouncement"));

  v12 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v6, "timeSinceLastAnnouncement");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v13, CFSTR("timeSinceLastAnnouncement"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v6, "announcementPlatform"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v14, CFSTR("announcePlatform"));

  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v18;
  if (v15)
  {
    objc_msgSend(v5, "setValue:forKey:", v15, CFSTR("announcePayload"));
  }
  else
  {
    SKIDefaultLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[SKIFitnessInvocation updateDict:withAnnouncePayload:].cold.1();

  }
}

+ (id)announcePayloadFromUserData:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("announcePayload"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    SKIDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[SKIFitnessInvocation announcePayloadFromUserData:].cold.1();

  }
  return v4;
}

+ (void)updateStartLocalRequest:(uint64_t)a3 withNewAnnouncePayload:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_212490000, a1, a3, "Fitness SKIDirectInvocationPayload contains nil data", a5, a6, a7, a8, 0);
}

+ (void)updateStartLocalRequest:withNewAnnouncePayload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_212490000, v0, v1, "Error deserializing fitness SKIDirectInvocationPayload: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)updateStartLocalRequest:withNewAnnouncePayload:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_212490000, v0, v1, "Unexpected identifier - not a known fitness direct invocation identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)updateStartLocalRequest:(uint64_t)a3 withNewAnnouncePayload:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_212490000, a1, a3, "startLocalRequest not an RSKE", a5, a6, a7, a8, 0);
}

+ (void)updateDict:withAnnouncePayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_212490000, v0, v1, "error archiving SKIAnnounceNotificationDirectInvocationPayload for SKIFitnessInvocation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

+ (void)announcePayloadFromUserData:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_212490000, v0, v1, "error unarchiving SKIAnnounceNotificationDirectInvocationPayload from userData for SKIFitnessInvocation: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
