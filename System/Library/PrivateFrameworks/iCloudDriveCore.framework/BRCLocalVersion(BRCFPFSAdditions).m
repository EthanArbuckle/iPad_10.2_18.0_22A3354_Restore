@implementation BRCLocalVersion(BRCFPFSAdditions)

- (void)initFromResultSet:()BRCFPFSAdditions pos:.cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4_0(&dword_230455000, a4, a3, "[CRIT] UNREACHABLE: can't unarchive CKRecord: %@%@", (uint8_t *)a3);

}

@end
