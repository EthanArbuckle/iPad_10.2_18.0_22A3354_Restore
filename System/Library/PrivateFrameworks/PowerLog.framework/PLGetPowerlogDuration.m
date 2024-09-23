@implementation PLGetPowerlogDuration

uint64_t __PLGetPowerlogDuration_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_double(a2, 0);
  return 0;
}

@end
