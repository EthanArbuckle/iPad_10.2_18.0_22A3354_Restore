@implementation REMExporting(ICSExport)

+ (void)_icsCalendarItemsFromReminders:()ICSExport exportingOption:.cold.1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_2_5(a1, a2), "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1B4A39000, v3, v4, "Couldn't create ICSComponents for reminder %@");

  OUTLINED_FUNCTION_5_2();
}

+ (void)icsTodoFromReminder:()ICSExport exportingOption:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_4_2(&dword_1B4A39000, a1, a3, "Couldn't update the calendar item components of reminder.", v3);
}

+ (void)icsTodoFromReminder:()ICSExport exportingOption:.cold.2(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "timeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Failed to obtain an NSTimeZone from reminder.timeZone when exporting due date components to ICS {timeZoneString: %@, reminderID: %@}.", (uint8_t *)&v6, 0x16u);

}

+ (void)icsTodoFromReminder:()ICSExport exportingOption:.cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_ERROR, "Failed to parse reminder.importedICSData to an ICS document {error: %@}.", (uint8_t *)&v2, 0xCu);
}

+ (void)_updateICSComponentWithReminder:()ICSExport icsCalendarItem:.cold.1(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1B4A39000, v3, v4, "Encountered an unknown REMWeekday: %@");

  OUTLINED_FUNCTION_5_2();
}

+ (void)_updateICSComponentWithReminder:()ICSExport icsCalendarItem:.cold.2(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1B4A39000, v3, v4, "Encountered an unknown calendar frequency: %@");

  OUTLINED_FUNCTION_5_2();
}

+ (void)_updateICSComponentWithReminder:()ICSExport icsCalendarItem:.cold.3(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_4_2(&dword_1B4A39000, a3, (uint64_t)a3, "UpdateICSStructuredLocationFromREMStructuredLocation dropping mapkit handle because it exceeds the max length restriction on many servers.", a1);
}

+ (void)_updateICSComponentWithReminder:()ICSExport icsCalendarItem:.cold.4(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)OUTLINED_FUNCTION_2_5(a1, a2), "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1((uint64_t)v2, 5.7779e-34);
  OUTLINED_FUNCTION_0_8(&dword_1B4A39000, v3, v4, "AlarmUID was not set, generating one when exporting to ICS {remObjectID: %@}.");

  OUTLINED_FUNCTION_5_2();
}

+ (void)_updateICSComponentWithReminder:()ICSExport icsCalendarItem:.cold.5(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "rem_log_fault_if (REMIsInvalidICSAlarmDateComponents(remAlarmDateTrigger.dateComponents)) -- ReminderKit does not create nor import invalid alarm trigger date in alarms.", buf, 2u);
}

+ (void)_updateICSComponentWithReminder:()ICSExport icsCalendarItem:.cold.6(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint8_t *v3;
  objc_class *v4;
  void *v5;

  OUTLINED_FUNCTION_2_5(a1, a2);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_1((uint64_t)v5, 5.7779e-34);
  _os_log_fault_impl(&dword_1B4A39000, v2, OS_LOG_TYPE_FAULT, "Unexpected type of REMAlarmTrigger (%@), unable to export to ICSAlarm.", v3, 0xCu);

  OUTLINED_FUNCTION_5_2();
}

@end
