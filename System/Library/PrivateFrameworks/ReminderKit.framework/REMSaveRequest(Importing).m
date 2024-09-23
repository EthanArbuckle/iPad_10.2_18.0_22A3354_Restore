@implementation REMSaveRequest(Importing)

- (void)importRemindersFromICSData:()Importing insertIntoListChangeItem:error:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, a2, a3, "Failed to parse data to ICS document {error: %@}.", (uint8_t *)&v3);
}

- (void)_populateReminderChangeItem:()Importing withICSTodoItem:icsCalendar:isNew:withOptions:.cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_2_1(&dword_1B4A39000, a2, v4, "The imported ICS reminder doesn't have display order and creation time. {icsTodoItem.url: %@}", (uint8_t *)&v5);

}

- (void)_addAlarmsToReminderChangeItem:()Importing withICSAlarm:icsCalendar:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "Trying to import setting location without a proximity value. {alarmUID: %@, reminderID: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)_addAlarmsToReminderChangeItem:()Importing withICSAlarm:icsCalendar:.cold.2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3(&dword_1B4A39000, v3, v4, "Trying to import setting proximity without a location. {alarmUID: %@, reminderID: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_1();
}

- (void)_addAlarmsToReminderChangeItem:()Importing withICSAlarm:icsCalendar:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  _os_log_debug_impl(&dword_1B4A39000, a3, OS_LOG_TYPE_DEBUG, "Import ICS alarm and triggers to reminder {alarmUID: %@, reminderID: %@}.", v5, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

@end
