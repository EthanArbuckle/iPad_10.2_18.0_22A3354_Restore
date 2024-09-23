@implementation PLPersistentHistoryStats

- (int64_t)payloadPageCount
{
  return self->_filePageCount - self->_unusedPageCount;
}

- (int64_t)persistentHistoryPageCount
{
  return self->_transactionStringsPageCount + self->_transactionsPageCount + self->_changesPageCount;
}

- (int64_t)daysSinceEarliestTransaction
{
  int64_t result;
  double v3;

  result = (int64_t)self->_earliestTransactionDate;
  if (result)
  {
    objc_msgSend((id)result, "timeIntervalSinceNow");
    return llround(ceil(fabs(v3 / 86400.0)));
  }
  return result;
}

- (double)transactionsPageCountPercent
{
  double result;

  -[PLPersistentHistoryStats _pageCountAsPercentOfFile:](self, "_pageCountAsPercentOfFile:", self->_transactionsPageCount);
  return result;
}

- (double)transactionStringsPageCountPercent
{
  double result;

  -[PLPersistentHistoryStats _pageCountAsPercentOfFile:](self, "_pageCountAsPercentOfFile:", self->_transactionStringsPageCount);
  return result;
}

- (double)changesPageCountPercent
{
  double result;

  -[PLPersistentHistoryStats _pageCountAsPercentOfFile:](self, "_pageCountAsPercentOfFile:", self->_changesPageCount);
  return result;
}

- (double)persistentHistoryPageCountPercent
{
  double result;

  -[PLPersistentHistoryStats _pageCountAsPercentOfFile:](self, "_pageCountAsPercentOfFile:", -[PLPersistentHistoryStats persistentHistoryPageCount](self, "persistentHistoryPageCount"));
  return result;
}

- (double)_pageCountAsPercentOfFile:(int64_t)a3
{
  return (double)a3 / (double)self->_filePageCount * 100.0;
}

- (double)transactionsPageCountPercentOfPayload
{
  double result;

  -[PLPersistentHistoryStats _pageCountAsPercentOfPayload:](self, "_pageCountAsPercentOfPayload:", self->_transactionsPageCount);
  return result;
}

- (double)transactionStringsPageCountPercentOfPayload
{
  double result;

  -[PLPersistentHistoryStats _pageCountAsPercentOfPayload:](self, "_pageCountAsPercentOfPayload:", self->_transactionStringsPageCount);
  return result;
}

- (double)changesPageCountPercentOfPayload
{
  double result;

  -[PLPersistentHistoryStats _pageCountAsPercentOfPayload:](self, "_pageCountAsPercentOfPayload:", self->_changesPageCount);
  return result;
}

- (double)persistentHistoryPageCountPercentOfPayload
{
  double result;

  -[PLPersistentHistoryStats _pageCountAsPercentOfPayload:](self, "_pageCountAsPercentOfPayload:", -[PLPersistentHistoryStats persistentHistoryPageCount](self, "persistentHistoryPageCount"));
  return result;
}

- (double)_pageCountAsPercentOfPayload:(int64_t)a3
{
  return (double)a3 / (double)-[PLPersistentHistoryStats payloadPageCount](self, "payloadPageCount") * 100.0;
}

- (int64_t)filePageCount
{
  return self->_filePageCount;
}

- (void)setFilePageCount:(int64_t)a3
{
  self->_filePageCount = a3;
}

- (int64_t)unusedPageCount
{
  return self->_unusedPageCount;
}

- (void)setUnusedPageCount:(int64_t)a3
{
  self->_unusedPageCount = a3;
}

- (int64_t)transactionsPageCount
{
  return self->_transactionsPageCount;
}

- (void)setTransactionsPageCount:(int64_t)a3
{
  self->_transactionsPageCount = a3;
}

- (int64_t)transactionStringsPageCount
{
  return self->_transactionStringsPageCount;
}

- (void)setTransactionStringsPageCount:(int64_t)a3
{
  self->_transactionStringsPageCount = a3;
}

- (int64_t)changesPageCount
{
  return self->_changesPageCount;
}

- (void)setChangesPageCount:(int64_t)a3
{
  self->_changesPageCount = a3;
}

- (int64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTransactionCount:(int64_t)a3
{
  self->_transactionCount = a3;
}

- (NSDate)earliestTransactionDate
{
  return self->_earliestTransactionDate;
}

- (void)setEarliestTransactionDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_earliestTransactionDate, 0);
}

+ (id)statsFromDatabase:(id)a3
{
  id v4;
  PLPersistentHistoryStats *v5;
  PLPersistentHistoryStats *v6;

  v4 = a3;
  v5 = objc_alloc_init(PLPersistentHistoryStats);
  if (objc_msgSend(a1, "fetchPageCountsOfPersistentHistoryTablesFromDatabase:intoStats:", v4, v5)
    && objc_msgSend(a1, "fetchTotalPageCountFromDatabase:intoStats:", v4, v5)
    && objc_msgSend(a1, "fetchUnusedPageCountFromDatabase:intoStats:", v4, v5)
    && objc_msgSend(a1, "fetchTransactionCountFromDatabase:intoStats:", v4, v5)
    && objc_msgSend(a1, "fetchEarliestTransactionDateFromDatabase:intoStats:", v4, v5))
  {
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)fetchPageCountsOfPersistentHistoryTablesFromDatabase:(id)a3 intoStats:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __91__PLPersistentHistoryStats_fetchPageCountsOfPersistentHistoryTablesFromDatabase_intoStats___block_invoke;
  v8[3] = &unk_1E366AA38;
  v9 = v5;
  v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "prepareStatement:andStepThroughResultsWithBlock:", CFSTR("SELECT m.tbl_name tbl_name, sum(pageno) page_count  FROM   dbstat d, sqlite_master m  WHERE     d.name = m.name     AND m.tbl_name IN ('ACHANGE', 'ATRANSACTION', 'ATRANSACTIONSTRING')     AND d.aggregate = TRUE  GROUP BY m.tbl_name;"),
                 v8);

  return (char)a3;
}

+ (BOOL)fetchTotalPageCountFromDatabase:(id)a3 intoStats:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __70__PLPersistentHistoryStats_fetchTotalPageCountFromDatabase_intoStats___block_invoke;
  v8[3] = &unk_1E366AA38;
  v9 = v5;
  v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "prepareStatement:andStepThroughResultsWithBlock:", CFSTR("PRAGMA page_count;"), v8);

  return (char)a3;
}

+ (BOOL)fetchUnusedPageCountFromDatabase:(id)a3 intoStats:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__PLPersistentHistoryStats_fetchUnusedPageCountFromDatabase_intoStats___block_invoke;
  v8[3] = &unk_1E366AA38;
  v9 = v5;
  v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "prepareStatement:andStepThroughResultsWithBlock:", CFSTR("PRAGMA freelist_count;"), v8);

  return (char)a3;
}

+ (BOOL)fetchTransactionCountFromDatabase:(id)a3 intoStats:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__PLPersistentHistoryStats_fetchTransactionCountFromDatabase_intoStats___block_invoke;
  v8[3] = &unk_1E366AA38;
  v9 = v5;
  v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "prepareStatement:andStepThroughResultsWithBlock:", CFSTR("SELECT COUNT(*) from ATRANSACTION;"),
                 v8);

  return (char)a3;
}

+ (BOOL)fetchEarliestTransactionDateFromDatabase:(id)a3 intoStats:(id)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __79__PLPersistentHistoryStats_fetchEarliestTransactionDateFromDatabase_intoStats___block_invoke;
  v8[3] = &unk_1E366AA38;
  v9 = v5;
  v6 = v5;
  LOBYTE(a3) = objc_msgSend(a3, "prepareStatement:andStepThroughResultsWithBlock:", CFSTR("SELECT ZTIMESTAMP  FROM ATRANSACTION  ORDER BY ZTIMESTAMP ASC  LIMIT 1;"),
                 v8);

  return (char)a3;
}

void __79__PLPersistentHistoryStats_fetchEarliestTransactionDateFromDatabase_intoStats___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(a2, 0));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setEarliestTransactionDate:", v3);

}

uint64_t __72__PLPersistentHistoryStats_fetchTransactionCountFromDatabase_intoStats___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setTransactionCount:", sqlite3_column_int(a2, 0));
}

uint64_t __71__PLPersistentHistoryStats_fetchUnusedPageCountFromDatabase_intoStats___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUnusedPageCount:", sqlite3_column_int(a2, 0));
}

uint64_t __70__PLPersistentHistoryStats_fetchTotalPageCountFromDatabase_intoStats___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFilePageCount:", sqlite3_column_int(a2, 0));
}

uint64_t __91__PLPersistentHistoryStats_fetchPageCountsOfPersistentHistoryTablesFromDatabase_intoStats___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  const unsigned __int8 *v4;
  sqlite3_int64 v5;
  uint64_t result;

  v4 = sqlite3_column_text(a2, 0);
  v5 = sqlite3_column_int64(a2, 1);
  if (!strcmp((const char *)v4, "ACHANGE"))
    return objc_msgSend(*(id *)(a1 + 32), "setChangesPageCount:", v5);
  if (!strcmp((const char *)v4, "ATRANSACTION"))
    return objc_msgSend(*(id *)(a1 + 32), "setTransactionsPageCount:", v5);
  result = strcmp((const char *)v4, "ATRANSACTIONSTRING");
  if (!(_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setTransactionStringsPageCount:", v5);
  return result;
}

@end
