@implementation SUXPCAlarm

- (SUXPCAlarm)init
{
  SUXPCAlarm *v2;
  SUCSScheduler *v3;
  SUCSScheduler *csScheduler;
  _QWORD handler[4];
  SUXPCAlarm *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUXPCAlarm;
  v2 = -[SUXPCAlarm init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SUCSScheduler);
    csScheduler = v2->_csScheduler;
    v2->_csScheduler = v3;

    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __18__SUXPCAlarm_init__block_invoke;
    handler[3] = &unk_24CE3CC58;
    v7 = v2;
    xpc_set_event_stream_handler("com.apple.alarm", MEMORY[0x24BDAC9B8], handler);

  }
  return v2;
}

uint64_t __18__SUXPCAlarm_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *string;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t result;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = a2;
  SULogInfo(CFSTR("Handling wakeup alarm"), v4, v5, v6, v7, v8, v9, v10, v27);
  string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x24BDACF50]);

  if (!string)
    SULogInfo(CFSTR("No event name"), v12, v13, v14, v15, v16, v17, v18, v28);
  result = strcmp(string, (const char *)objc_msgSend(CFSTR("installAlertAlarmName"), "UTF8String"));
  if (!(_DWORD)result)
  {
    SULogInfo(CFSTR("Registering ContextStore Predicates"), v20, v21, v22, v23, v24, v25, v26, v28);
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "registerInstallAlertConditionsWithHandler:", &__block_literal_global_11);
  }
  return result;
}

uint64_t __18__SUXPCAlarm_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t vars0;

  SULogInfo(CFSTR("ContextStore reports ready for installation UI"), a2, a3, a4, a5, a6, a7, a8, vars0);
  return 1;
}

- (void)scheduleInstallAlertAlarm:(id)a3
{
  -[SUXPCAlarm scheduleAlarm:date:](self, "scheduleAlarm:date:", CFSTR("installAlertAlarmName"), a3);
}

- (void)cancelInstallAlertAlarm
{
  -[SUXPCAlarm cancelAlarm:](self, "cancelAlarm:", CFSTR("installAlertAlarmName"));
  -[SUCSScheduler unregisterInstallationAlertAction](self->_csScheduler, "unregisterInstallationAlertAction");
}

- (void)scheduleAlarm:(id)a3 date:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  id v16;
  id v17;

  v5 = a4;
  v6 = a3;
  SULogInfo(CFSTR("Scheduling alarm: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);
  objc_msgSend(v5, "timeIntervalSince1970");
  v15 = v14;

  v17 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_date(v17, "Date", (uint64_t)(v15 * 1000000000.0));
  v16 = objc_retainAutorelease(v6);
  objc_msgSend(v16, "UTF8String");

  xpc_set_event();
}

- (void)cancelAlarm:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  SULogInfo(CFSTR("Canceling alarm: %@"), v4, v5, v6, v7, v8, v9, v10, (uint64_t)v3);
  v11 = objc_retainAutorelease(v3);
  objc_msgSend(v11, "UTF8String");

  xpc_set_event();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_csScheduler, 0);
}

@end
