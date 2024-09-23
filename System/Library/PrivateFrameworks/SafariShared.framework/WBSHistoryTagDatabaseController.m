@implementation WBSHistoryTagDatabaseController

- (WBSHistoryTagDatabaseController)initWithDatabase:(id)a3
{
  id v5;
  WBSHistoryTagDatabaseController *v6;
  WBSHistoryTagDatabaseController *v7;
  WBSHistoryTagDatabaseController *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSHistoryTagDatabaseController;
  v6 = -[WBSHistoryTagDatabaseController init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = v7;
  }

  return v7;
}

- (id)createTagsForIdentifiers:(id)a3 withTitles:(id)a4 type:(unint64_t)a5 level:(int64_t)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  WBSSQLiteDatabase *database;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  WBSHistoryTagDatabaseController *v24;
  id v25;
  id *v26;
  unint64_t v27;
  int64_t v28;

  v12 = a3;
  v13 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  database = self->_database;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__WBSHistoryTagDatabaseController_createTagsForIdentifiers_withTitles_type_level_error___block_invoke;
  v21[3] = &unk_1E4B3C6B0;
  v16 = v12;
  v22 = v16;
  v17 = v13;
  v23 = v17;
  v24 = self;
  v26 = a7;
  v27 = a5;
  v28 = a6;
  v18 = v14;
  v25 = v18;
  if ((-[WBSSQLiteDatabase tryToPerformTransactionInBlock:](database, "tryToPerformTransactionInBlock:", v21) & 1) != 0)
    v19 = v18;
  else
    v19 = 0;

  return v19;
}

uint64_t __88__WBSHistoryTagDatabaseController_createTagsForIdentifiers_withTitles_type_level_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;
  id v12;

  if (!objc_msgSend(*(id *)(a1 + 32), "count"))
    return 1;
  v2 = 0;
  while (1)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v2);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(_QWORD **)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v10 = v5;
    v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&,unsigned long const&,long long const&,double>(v3, v4, CFSTR("INSERT INTO history_tags (identifier, title, type, level, modification_timestamp) VALUES (?, ?, ?, ?, ?)"), &v11, &v12, (_QWORD *)(a1 + 72), (_QWORD *)(a1 + 80), (double *)&v10);
    if (v6)
    {
      if (v6 != 101)
        break;
    }
    v7 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "lastInsertRowID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    if (++v2 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count"))
      return 1;
  }

  return 0;
}

- (BOOL)assignURLString:(id)a3 toTopicTagsWithIDs:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  WBSSQLiteDatabase *database;
  id v11;
  id v12;
  _QWORD v14[5];
  id v15;
  id v16;
  id *v17;

  v8 = a3;
  v9 = a4;
  database = self->_database;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __76__WBSHistoryTagDatabaseController_assignURLString_toTopicTagsWithIDs_error___block_invoke;
  v14[3] = &unk_1E4B3C6D8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = a5;
  v11 = v9;
  v12 = v8;
  LOBYTE(self) = -[WBSSQLiteDatabase tryToPerformTransactionInBlock:](database, "tryToPerformTransactionInBlock:", v14);

  return (char)self;
}

uint64_t __76__WBSHistoryTagDatabaseController_assignURLString_toTopicTagsWithIDs_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t result;
  _QWORD *v5;
  id *v6;
  int v7;
  int v9;
  id *v10;
  uint64_t v11;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_QWORD *)(a1 + 56);
  v10 = (id *)&v11;
  v11 = 0;
  result = SafariShared::WBSSQLiteDatabaseEnumerate<NSString * const {__strong}&,std::tuple<long long &>>(v2, v3, CFSTR("SELECT id FROM history_items WHERE url = ?"), (id *)(a1 + 40), &v10);
  if ((_DWORD)result)
  {
    v5 = *(_QWORD **)(objc_msgSend(*(id *)(a1 + 48), "set") + 16);
    if (v5)
    {
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate", 0);
        v10 = v6;
        v7 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<long long &,long long const&,double &>(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD **)(a1 + 56), CFSTR("INSERT INTO history_items_to_tags (history_item, tag_id, timestamp) VALUES (?, ?, ?)"), &v11, v5 + 2, (double *)&v10);
        if (v7 != 101 && v7 != 0)
          break;
        v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double &,long long const&>(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD **)(a1 + 56), CFSTR("UPDATE history_tags SET modification_timestamp = ? WHERE id = ?"), (double *)&v10, v5 + 2);
        if (v9)
        {
          if (v9 != 101)
            break;
        }
        v5 = (_QWORD *)*v5;
        if (!v5)
          return 1;
      }
      return 0;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

- (BOOL)renameTagWithID:(int64_t)a3 toTitle:(id)a4 error:(id *)a5
{
  id v8;
  WBSSQLiteDatabase *database;
  id v10;
  _QWORD v12[5];
  id v13;
  id *v14;
  int64_t v15;

  v8 = a4;
  database = self->_database;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __65__WBSHistoryTagDatabaseController_renameTagWithID_toTitle_error___block_invoke;
  v12[3] = &unk_1E4B3C700;
  v12[4] = self;
  v13 = v8;
  v14 = a5;
  v15 = a3;
  v10 = v8;
  LOBYTE(a3) = -[WBSSQLiteDatabase tryToPerformTransactionInBlock:](database, "tryToPerformTransactionInBlock:", v12);

  return a3;
}

BOOL __65__WBSHistoryTagDatabaseController_renameTagWithID_toTitle_error___block_invoke(uint64_t a1)
{
  int v1;

  v1 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * const {__strong}&,long long const&>(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD **)(a1 + 48), CFSTR("UPDATE history_tags SET title = ? WHERE id = ?"), (_QWORD *)(a1 + 40), (_QWORD *)(a1 + 56));
  return v1 == 101 || v1 == 0;
}

- (BOOL)clearAllTagsWithError:(id *)a3
{
  WBSSQLiteDatabase *database;
  _QWORD v5[6];

  database = self->_database;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__WBSHistoryTagDatabaseController_clearAllTagsWithError___block_invoke;
  v5[3] = &unk_1E4B3C728;
  v5[4] = self;
  v5[5] = a3;
  return -[WBSSQLiteDatabase tryToPerformTransactionInBlock:](database, "tryToPerformTransactionInBlock:", v5);
}

BOOL __57__WBSHistoryTagDatabaseController_clearAllTagsWithError___block_invoke(uint64_t a1)
{
  int v2;
  int v4;

  v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD **)(a1 + 40), CFSTR("DELETE FROM history_items_to_tags"));
  if (v2 != 101 && v2 != 0)
    return 0;
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD **)(a1 + 40), CFSTR("DELETE FROM history_tags"));
  return v4 == 101 || v4 == 0;
}

- (BOOL)clearTagsFromStartDate:(id)a3 endDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  WBSSQLiteDatabase *database;
  uint64_t v13;
  _QWORD v15[8];

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  database = self->_database;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__WBSHistoryTagDatabaseController_clearTagsFromStartDate_endDate_error___block_invoke;
  v15[3] = &unk_1E4B3C750;
  v15[4] = self;
  v15[5] = a5;
  v15[6] = v11;
  v15[7] = v13;
  LOBYTE(a5) = -[WBSSQLiteDatabase tryToPerformTransactionInBlock:](database, "tryToPerformTransactionInBlock:", v15);

  return (char)a5;
}

BOOL __72__WBSHistoryTagDatabaseController_clearTagsFromStartDate_endDate_error___block_invoke(uint64_t a1)
{
  int v2;
  int v4;

  v2 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double const&,double const&>(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD **)(a1 + 40), CFSTR("DELETE FROM history_items_to_tags WHERE timestamp > ? AND timestamp < ?"), (double *)(a1 + 48), (double *)(a1 + 56));
  if (v2 != 101 && v2 != 0)
    return 0;
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double const&,double const&>(*(void **)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD **)(a1 + 40), CFSTR("DELETE FROM history_tags WHERE modification_timestamp > ? AND modification_timestamp < ?"), (double *)(a1 + 48), (double *)(a1 + 56));
  return v4 == 101 || v4 == 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
