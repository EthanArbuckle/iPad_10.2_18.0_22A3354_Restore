@implementation TRIXPCActivityCriteria

+ (id)cellularCriteria
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C80898], 1);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E0C807A8], 259200);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E0C80890], 3600);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808D0], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808C8], 0);
  return v2;
}

+ (id)fetchExperimentsCriteria
{
  void *v2;

  objc_msgSend(a1, "cellularCriteria");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E0C807A8], 86400);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808C8], 1);
  return v2;
}

+ (id)maintenanceCriteria
{
  void *v2;

  objc_msgSend(a1, "cellularCriteria");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808D0], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808C8], 0);
  xpc_dictionary_set_int64(v2, (const char *)*MEMORY[0x1E0C807A8], 86400);
  return v2;
}

+ (id)clientTriggeredCellularCriteria
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C80898], 0);
  xpc_dictionary_set_string(v2, (const char *)*MEMORY[0x1E0C80878], (const char *)*MEMORY[0x1E0C80880]);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C80738], 0);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808D0], 1);
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808C8], 0);
  return v2;
}

+ (id)clientTriggeredWifiCriteria
{
  void *v2;

  objc_msgSend(a1, "clientTriggeredCellularCriteria");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v2, (const char *)*MEMORY[0x1E0C808C8], 1);
  return v2;
}

@end
