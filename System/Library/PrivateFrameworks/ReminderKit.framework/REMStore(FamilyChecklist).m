@implementation REMStore(FamilyChecklist)

- (void)fetchFamilyGroceryListEligibilityForFamilyChecklistWithLocale:()FamilyChecklist error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI error fetching eligibility for shared grocery list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)sharedGroceryListForFamilyChecklistWithCommonParticipants:()FamilyChecklist error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI error fetching existing shared grocery lists: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)createSharedGroceryListWithError:()FamilyChecklist .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI error creating itemProvider for shared grocery list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)createSharedGroceryListWithError:()FamilyChecklist .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI error creating CKShare for shared grocery list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)createSharedGroceryListWithError:()FamilyChecklist .cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI error saving created shared grocery list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)createSharedGroceryListWithError:()FamilyChecklist .cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI error fetching primary active cloudKit account for creating shared grocery list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)addParticipantsToSharedGroceryList:()FamilyChecklist completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI error adding participants: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)addParticipantsToSharedGroceryList:()FamilyChecklist completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI CloudKit error fetching primary active cloudKit account for adding participants to shared grocery list %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)addParticipantsToSharedGroceryList:()FamilyChecklist completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI CloudKit error fetching CKShare for adding participants to shared grocery list %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)deleteSharedGroceryList:()FamilyChecklist error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI error saving deletion of shared grocery list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)deleteSharedGroceryList:()FamilyChecklist error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI error deleting shared grocery list: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

- (void)deleteSharedGroceryList:()FamilyChecklist error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_0_3(&dword_1B4A39000, v0, v1, "FamilyChecklistSPI error fetching shared grocery list for deletion: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
