void sub_211023A5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211023B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id a22)
{
  _Block_object_dispose(&a17, 8);

  _Unwind_Resume(a1);
}

void performBlockExclusively(void *a1)
{
  void (**v1)(void);

  v1 = a1;
  if (performBlockExclusively(void({block_pointer})(void))::onceToken != -1)
    dispatch_once(&performBlockExclusively(void({block_pointer})(void))::onceToken, &__block_literal_global_1549);
  dispatch_semaphore_wait((dispatch_semaphore_t)performBlockExclusively(void({block_pointer})(void))::mutex, 0xFFFFFFFFFFFFFFFFLL);
  v1[2]();
  dispatch_semaphore_signal((dispatch_semaphore_t)performBlockExclusively(void({block_pointer})(void))::mutex);

}

void sub_211023BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211023D6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id collectionTypeToDeviceIdentifierDictionary(void)
{
  unsigned __int8 v0;

  if ((v0 & 1) == 0
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    collectionTypeToDeviceIdentifierDictionary(void)::dictionary = objc_claimAutoreleasedReturnValue();
  }
  return (id)collectionTypeToDeviceIdentifierDictionary(void)::dictionary;
}

void sub_211023FC0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id WBDataFromNullableColumn(sqlite3_stmt *a1, int a2)
{
  void *v4;
  const void *v5;

  if (sqlite3_column_type(a1, a2) == 5)
  {
    v4 = 0;
  }
  else
  {
    v5 = sqlite3_column_blob(a1, a2);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", v5, sqlite3_column_bytes(a1, a2));
  }
  return v4;
}

unsigned __int8 *WBUTF8StringFromSQLStatement(sqlite3_stmt *a1, int a2)
{
  unsigned __int8 *v4;

  if (sqlite3_column_type(a1, a2) == 5)
  {
    v4 = 0;
  }
  else
  {
    v4 = (unsigned __int8 *)sqlite3_column_text(a1, a2);
    if (v4)
      v4 = (unsigned __int8 *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v4);
  }
  return v4;
}

id newStringFromNullableColumn(sqlite3_stmt *a1, int a2)
{
  void *v4;

  if (sqlite3_column_type(a1, a2) == 5)
    v4 = 0;
  else
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", sqlite3_column_text(a1, a2));
  return v4;
}

void sub_211025494(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_211026BEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211026D18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211027428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, ...)
{
  void *v6;
  void *v7;
  va_list va;

  va_start(va, a6);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211027984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  void *v32;
  void *v33;

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&a32);

  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement(uint64_t this, sqlite3_stmt *a2)
{
  *(_QWORD *)this = &off_24CB32148;
  *(_QWORD *)(this + 8) = a2;
  *(_WORD *)(this + 16) = 1;
  *(_DWORD *)(this + 20) = 0;
  return this;
}

void sub_211027B04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLStatement::selectInt(WebBookmarks::BookmarkSQLStatement *this, sqlite3 *zSql, const char *a3)
{
  uint64_t v3;
  _BYTE v5[8];
  sqlite3_stmt *v6;
  char v7;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5, this, (const char *)zSql);
  if (v7 && sqlite3_step(v6) == 100)
    v3 = sqlite3_column_int(v6, 0);
  else
    v3 = 0xFFFFFFFFLL;
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5);
  return v3;
}

void sub_211027B9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLStatement::executeSQL(WebBookmarks::BookmarkSQLStatement *this, sqlite3 *zSql, const char *a3)
{
  uint64_t v3;
  _BYTE v5[8];
  sqlite3_stmt *pStmt;
  char v7;
  char v8;

  WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5, this, (const char *)zSql);
  if (v7)
  {
    sqlite3_step(pStmt);
    if (v8)
    {
      v3 = 0xFFFFFFFFLL;
    }
    else
    {
      v8 = 1;
      v3 = sqlite3_finalize(pStmt);
    }
  }
  else
  {
    v3 = 1;
  }
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)v5);
  return v3;
}

void sub_211027C2C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement(WebBookmarks::BookmarkSQLStatement *this)
{
  *(_QWORD *)this = &off_24CB32148;
  if (!*((_BYTE *)this + 17))
  {
    *((_BYTE *)this + 17) = 1;
    sqlite3_finalize(*((sqlite3_stmt **)this + 1));
  }
}

{
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement(this);
  JUMPOUT(0x212BD4888);
}

WebBookmarks::BookmarkSQLStatement *WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement(WebBookmarks::BookmarkSQLStatement *this, sqlite3 *db, const char *zSql)
{
  int v4;
  NSObject *v5;

  *(_QWORD *)this = &off_24CB32148;
  *((_BYTE *)this + 17) = 0;
  v4 = sqlite3_prepare_v2(db, zSql, -1, (sqlite3_stmt **)this + 1, 0);
  *((_BYTE *)this + 16) = v4 == 0;
  if (v4)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement(v4, v5);
  }
  *((_DWORD *)this + 5) = v4;
  return this;
}

uint64_t WebBookmarks::BookmarkSQLStatement::selectInt(WebBookmarks::BookmarkSQLStatement *this, sqlite3 *a2, NSString *a3)
{
  sqlite3 *v4;
  sqlite3 *v5;
  const char *v6;
  uint64_t v7;

  v4 = objc_retainAutorelease(a2);
  v5 = (sqlite3 *)-[sqlite3 UTF8String](v4, "UTF8String");
  v7 = WebBookmarks::BookmarkSQLStatement::selectInt(this, v5, v6);

  return v7;
}

void sub_211027D58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211027E70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

id BookmarkSQLiteColumns()
{
  if (BookmarkSQLiteColumns_onceToken != -1)
    dispatch_once(&BookmarkSQLiteColumns_onceToken, &__block_literal_global_54);
  return (id)BookmarkSQLiteColumns_columns;
}

NSString *whereClauseWithAppendingINConditions(NSString *a1, NSString *a2, NSString *a3)
{
  NSString *v5;
  NSString *v6;
  NSString *v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;
  const __CFString *v11;
  NSString *v12;
  NSString *v13;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = -[NSString length](v6, "length");
  v9 = -[NSString length](v7, "length");
  if (v8 && v9)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@ AND %@) OR %@"), v5, v7, v6);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!v8 || v9)
    {
      if (v8 || !v9)
      {
        v10 = v5;
        goto LABEL_12;
      }
      v11 = CFSTR("(%@ AND %@)");
      v12 = v7;
    }
    else
    {
      v11 = CFSTR("(%@) OR %@");
      v12 = v6;
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v11, v5, v12);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:
  v13 = v10;

  return v13;
}

void sub_211027FC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21102816C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id commaSeparatedIDStringForBookmarkIDs(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        if (objc_msgSend(v2, "length"))
        {
          objc_msgSend(v7, "stringValue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendFormat:", CFSTR(",%@"), v8);
        }
        else
        {
          objc_msgSend(v7, "stringValue");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "appendString:", v8);
        }

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

  return v2;
}

void sub_21102844C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21102858C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211028A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  va_list va;

  va_start(va, a9);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211028EB0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211028F70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110292F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_2110295BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_2110296C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110297BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211029A3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t bindAttributesToSQLStatement(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v11[5];

  v11[4] = *(id *)MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    sqlite3_bind_null(a1, a2);
LABEL_9:
    v7 = 1;
    goto LABEL_10;
  }
  v6 = (void *)MEMORY[0x212BD4AC8]();
  v11[0] = 0;
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v5, 200, 0, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v11[0];
  if (v7)
  {
    sqlite3_bind_blob(a1, a2, (const void *)objc_msgSend(objc_retainAutorelease((id)v7), "bytes"), objc_msgSend((id)v7, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "wb_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      bindAttributesToSQLStatement_cold_1();
    }

  }
  objc_autoreleasePoolPop(v6);
  if (v7)
    goto LABEL_9;
LABEL_10:

  return v7;
}

void sub_211029C88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void bindNullableDataToSQLStatement(sqlite3_stmt *a1, int a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  v6 = v5;
  if (v5)
    sqlite3_bind_blob(a1, a2, (const void *)objc_msgSend(objc_retainAutorelease(v5), "bytes"), objc_msgSend(v5, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  else
    sqlite3_bind_null(a1, a2);

}

void sub_211029D40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211029E24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211029E80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211029F24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211029FEC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21102A13C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21102A360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_21102A428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21102A590(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_21102B000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void sub_21102B0B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21102B1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_21102B3E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21102B8B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_21102BB60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_21102BC74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21102BD4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21102C8AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21102D758(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21102E6A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21102E974(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLStatement::executeSQL(WebBookmarks::BookmarkSQLStatement *this, sqlite3 *a2, NSString *a3)
{
  sqlite3 *v4;
  sqlite3 *v5;
  const char *v6;
  uint64_t v7;

  v4 = objc_retainAutorelease(a2);
  v5 = (sqlite3 *)-[sqlite3 UTF8String](v4, "UTF8String");
  v7 = WebBookmarks::BookmarkSQLStatement::executeSQL(this, v5, v6);

  return v7;
}

void sub_21102E9D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21102F3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_21102F7B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21102F954(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21102FAF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21102FC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21102FCCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21102FDC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21102FE9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21102FF28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21102FFB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110306EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va2;

  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v12 = va_arg(va2, _QWORD);
  v14 = va_arg(va2, _QWORD);
  v15 = va_arg(va2, _QWORD);
  v16 = va_arg(va2, _QWORD);
  v17 = va_arg(va2, _QWORD);
  v18 = va_arg(va2, _QWORD);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va1);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va2);
  _Unwind_Resume(a1);
}

void sub_211030880(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211030A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  va_list va;

  va_start(va, a3);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211030E04(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211030F50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110310EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_2110311DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t __cjkIdeographCharacterSet_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1690]);
  v1 = (void *)cjkIdeographCharacterSet_cjkIdeographCharacterSet;
  cjkIdeographCharacterSet_cjkIdeographCharacterSet = (uint64_t)v0;

  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 19968, 20992);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 13312, 6592);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 11904, 128);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 12032, 224);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 12736, 48);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 63744, 512);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 0x20000, 42720);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 173824, 4160);
  objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 177984, 224);
  return objc_msgSend((id)cjkIdeographCharacterSet_cjkIdeographCharacterSet, "addCharactersInRange:", 194560, 544);
}

void sub_211031EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211031F14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211031FAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110320CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21103258C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_2110326DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211032E30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  void *v8;
  void *v9;
  va_list va;

  va_start(va, a8);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21103317C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLStatement::finalize(WebBookmarks::BookmarkSQLStatement *this)
{
  if (*((_BYTE *)this + 17))
    return 0xFFFFFFFFLL;
  *((_BYTE *)this + 17) = 1;
  return sqlite3_finalize(*((sqlite3_stmt **)this + 1));
}

void sub_211033278(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21103330C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211033608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  va_list va;

  va_start(va, a4);
  v9 = v8;

  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)va);
  _Unwind_Resume(a1);
}

void sub_211033824(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_211033AD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211033D74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21103403C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211034EF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXBookmarks()
{
  if (WBS_LOG_CHANNEL_PREFIXBookmarks_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBookmarks_onceToken, &__block_literal_global_17);
  return WBS_LOG_CHANNEL_PREFIXBookmarks_log;
}

void sub_2110350E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211035204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21103532C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110353D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211035454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2110354D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211035554(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110355D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110356AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2110357A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2110358C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_211035A34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211035E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_211035F84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211036078(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_211036170(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_21103639C(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x212BD4888](v2, 0x10A1C4022337C91);

  _Unwind_Resume(a1);
}

void WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction(WebBookmarks::BookmarkSQLWriteTransaction *this, uint64_t a2, const char *a3)
{
  WebBookmarks::BookmarkSQLTransaction::~BookmarkSQLTransaction(this, a2, a3);
  JUMPOUT(0x212BD4888);
}

WebBookmarks::BookmarkSQLWriteTransaction *WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction(WebBookmarks::BookmarkSQLWriteTransaction *this, sqlite3 *a2, const char *a3)
{
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v21;
  uint8_t buf[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  *((_WORD *)this + 8) = 0;
  *(_QWORD *)this = &off_24CB321A8;
  *((_QWORD *)this + 1) = a2;
  *((_BYTE *)this + 18) = 0;
  v4 = WebBookmarks::BookmarkSQLStatement::executeSQL(a2, (sqlite3 *)"BEGIN IMMEDIATE", a3);
  if ((v4 - 5) <= 1)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_DEFAULT, "WebBookmarks could not start an immediate transaction; sleeping.",
        buf,
        2u);
    }
    notify_post("com.apple.MobileSafari.StopSyncing");
    usleep(0xC350u);
    v4 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"BEGIN IMMEDIATE", v6);
    if ((v4 - 5) <= 1)
    {
      v7 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211022000, v7, OS_LOG_TYPE_DEFAULT, "WebBookmarks could not start an immediate transaction; sleeping longer.",
          buf,
          2u);
      }
      usleep(0x6DDD0u);
      v4 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"BEGIN IMMEDIATE", v8);
    }
  }
  *((_BYTE *)this + 17) = (_DWORD)v4 == 0;
  if ((_DWORD)v4)
  {
    if ((_DWORD)v4 == 1)
    {
      v9 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = sqlite3_errmsg(*((sqlite3 **)this + 1));
        WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction((uint64_t)v10, (uint64_t)buf);
      }

    }
    else
    {
      v11 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction(v4, v11, v12, v13, v14, v15, v16, v17);
    }
    if (objc_msgSend(MEMORY[0x24BE82CC8], "hasInternalContent"))
    {
      v18 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(v19, (uint64_t)&v21);
      }

    }
  }
  return this;
}

void sub_211036618(_Unwind_Exception *a1)
{
  WebBookmarks::BookmarkSQLTransaction *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  const char *v6;

  v3 = v2;

  WebBookmarks::BookmarkSQLTransaction::~BookmarkSQLTransaction(v1, v5, v6);
  _Unwind_Resume(a1);
}

uint64_t WebBookmarks::BookmarkSQLWriteTransaction::requestSecureDelete(uint64_t this, char a2)
{
  *(_BYTE *)(this + 18) |= a2;
  return this;
}

void WebBookmarks::BookmarkSQLTransaction::~BookmarkSQLTransaction(WebBookmarks::BookmarkSQLTransaction *this, uint64_t a2, const char *a3)
{
  *(_QWORD *)this = &off_24CB32168;
  if (*((_BYTE *)this + 17))
  {
    if (!*((_BYTE *)this + 16))
      WebBookmarks::BookmarkSQLTransaction::rollback(this, a2, a3);
  }
}

{
  WebBookmarks::BookmarkSQLTransaction::~BookmarkSQLTransaction(this, a2, a3);
  JUMPOUT(0x212BD4888);
}

BOOL WebBookmarks::BookmarkSQLTransaction::commit(WebBookmarks::BookmarkSQLTransaction *this, uint64_t a2, const char *a3)
{
  int v5;

  if (!*((_BYTE *)this + 17) || *((_BYTE *)this + 16))
    return 0;
  v5 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"COMMIT", a3);
  *((_BYTE *)this + 16) = 1;
  return v5 == 0;
}

void sub_2110368D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2110369C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211036B24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_211036DCC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

BOOL WebBookmarks::BookmarkSQLTransaction::rollback(WebBookmarks::BookmarkSQLTransaction *this, uint64_t a2, const char *a3)
{
  int v5;

  if (!*((_BYTE *)this + 17) || *((_BYTE *)this + 16))
    return 0;
  v5 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"ROLLBACK", a3);
  *((_BYTE *)this + 16) = 1;
  return v5 == 0;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_3(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_21103711C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211037284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id a11)
{

  _Unwind_Resume(a1);
}

void sub_211037304(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110373DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_211037720(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_2110378B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211037A60(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler((id *)va);
  _Unwind_Resume(a1);
}

id syncLockQueue(void)
{
  if (syncLockQueue(void)::onceToken != -1)
    dispatch_once(&syncLockQueue(void)::onceToken, &__block_literal_global_10);
  return (id)syncLockQueue(void)::syncLockQueue;
}

void sub_211037CEC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler((id *)va);

  _Unwind_Resume(a1);
}

void sub_21103803C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2110382C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXBookmarkSync()
{
  if (WBS_LOG_CHANNEL_PREFIXBookmarkSync_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXBookmarkSync_onceToken, &__block_literal_global_3);
  return WBS_LOG_CHANNEL_PREFIXBookmarkSync_log;
}

void sub_2110383D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110384A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21103871C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  va_list va;

  va_start(va, a15);

  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler((id *)va);
  _Unwind_Resume(a1);
}

id bookmarksCollectionQueue(void)
{
  if (bookmarksCollectionQueue(void)::onceToken != -1)
    dispatch_once(&bookmarksCollectionQueue(void)::onceToken, &__block_literal_global_1536);
  return (id)bookmarksCollectionQueue(void)::bookmarksCollectionQueue;
}

void SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(id *this)
{
  SafariShared::SuddenTerminationDisabler::enableSuddenTermination((SafariShared::SuddenTerminationDisabler *)this);

}

void sub_2110388C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

id WBSafariDirectoryPath()
{
  if (WBSafariDirectoryPath_onceToken != -1)
    dispatch_once(&WBSafariDirectoryPath_onceToken, &__block_literal_global_7);
  return (id)WBSafariDirectoryPath_safariDirectoryPath;
}

void sub_2110389AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211038BF4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211039334(_Unwind_Exception *a1)
{
  WBSReleaseOnMainQueueImpl();
  _Unwind_Resume(a1);
}

void sub_2110395D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_2110398E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211039AB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  MEMORY[0x212BD4888](v5, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void WBSetupTabGroupSyncAgentProtocolInterface(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = a1;
  v6[0] = objc_opt_class();
  v6[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_userDidAcceptTabGroupShareWithMetadata_inProfileWithIdentifier_completionHandler_, 1, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_beginSharingTabGroupWithUUID_completionHandler_, 1, 1);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_acceptShareForURL_invitationTokenData_completionHandler_, 1, 1);
  WBTabGroupSyncAgentSyncObserverInterface();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_addSyncObserver_, 0, 0);
  objc_msgSend(v2, "setInterface:forSelector:argumentIndex:ofReply:", v5, sel_removeSyncObserver_, 0, 0);

}

id WBTabGroupSyncAgentSyncObserverInterface()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254A9A718);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x24BDBCF20];
  v2 = objc_opt_class();
  objc_msgSend(v1, "setWithObjects:", v2, objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_participants_didJoinSharedTabGroupWithUUID_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_participants_didLeaveSharedTabGroupWithUUID_, 0, 0);

  return v0;
}

void sub_21103A73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_21103A87C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_21103A9EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x212BD4888](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

uint64_t WBS_LOG_CHANNEL_PREFIXTabGroup()
{
  if (WBS_LOG_CHANNEL_PREFIXTabGroup_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXTabGroup_onceToken, &__block_literal_global_15_0);
  return WBS_LOG_CHANNEL_PREFIXTabGroup_log;
}

void sub_21103B05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___ZL19syncFlagsDictionaryv_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)syncFlagsDictionary(void)::syncFlagsDictionary;
  syncFlagsDictionary(void)::syncFlagsDictionary = v0;

}

void sub_21103B0E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZL23performBlockExclusivelyU13block_pointerFvvE_block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(1);
  v1 = (void *)performBlockExclusively(void({block_pointer})(void))::mutex;
  performBlockExclusively(void({block_pointer})(void))::mutex = (uint64_t)v0;

}

id BookmarkSQLiteColumnNames()
{
  if (BookmarkSQLiteColumnNames_onceToken != -1)
    dispatch_once(&BookmarkSQLiteColumnNames_onceToken, &__block_literal_global_15);
  return (id)BookmarkSQLiteColumnNames_columns;
}

void sub_21103B39C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21103B7E8(_Unwind_Exception *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, ...)
{
  void *v10;
  va_list va;

  va_start(va, a10);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21103B948(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21103BAD4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21103BCBC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21103BEB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void ___ZL13syncLockQueuev_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("come.apple.WebBookmarks.syncLockQueue", MEMORY[0x24BDAC9C0]);
  v1 = (void *)syncLockQueue(void)::syncLockQueue;
  syncLockQueue(void)::syncLockQueue = (uint64_t)v0;

}

void sub_21103C67C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21103C934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_21103CB0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21103CBA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21103CC44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21103CD20(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL24bookmarksCollectionQueuev_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.WebBookmarks.bookmarksCollectionQueue", v2);
  v1 = (void *)bookmarksCollectionQueue(void)::bookmarksCollectionQueue;
  bookmarksCollectionQueue(void)::bookmarksCollectionQueue = (uint64_t)v0;

}

Class __getWFUserSettingsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!WebContentAnalysisLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24CB32F58;
    v5 = 0;
    WebContentAnalysisLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!WebContentAnalysisLibraryCore_frameworkLibrary)
    __getWFUserSettingsClass_block_invoke_cold_1(&v3);
  result = objc_getClass("WFUserSettings");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getWFUserSettingsClass_block_invoke_cold_2();
  getWFUserSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21103D344(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21103D3C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21103D4BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21103D63C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21103D860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  void *v5;
  va_list va;

  va_start(va, a4);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

id WBObjectFromColumn(sqlite3_stmt *a1, int a2)
{
  void *v4;

  switch(sqlite3_column_type(a1, a2))
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", sqlite3_column_int64(a1, a2));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", sqlite3_column_double(a1, a2));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      WBUTF8StringFromSQLStatement(a1, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      WBDataFromNullableColumn(a1, a2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

void sub_21103E1E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x212BD4888](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21103E4BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21103E5C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21103E780(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getTIWordTokenizerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!TextInputLibraryCore_frameworkLibrary)
    TextInputLibraryCore_frameworkLibrary = _sl_dlopen();
  result = objc_getClass("TIWordTokenizer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getTIWordTokenizerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_21103E948(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21103EA5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21103EB6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x212BD4888](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_2110403BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110405A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_211040660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2110407A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211040840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21104091C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211040B78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211040C88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211040DC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_211041018(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21104116C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_2110412A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2110413A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21104141C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211041508(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211041718(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2110417FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_211041990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_211041AC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211041B50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211041D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  _Unwind_Resume(a1);
}

void sub_2110420A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, id a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,void *a28,void *a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  _Unwind_Resume(a1);
}

void sub_21104214C()
{
  JUMPOUT(0x211042118);
}

void sub_211042154()
{
  JUMPOUT(0x21104212CLL);
}

void sub_21104215C()
{
  JUMPOUT(0x211042134);
}

void sub_211042164()
{
  void *v0;
  void *v1;

  JUMPOUT(0x21104213CLL);
}

void sub_21104217C()
{
  JUMPOUT(0x21104213CLL);
}

void sub_2110421D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21104223C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2110422A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211042350(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211042454(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_211042AE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22,void *a23,void *a24,void *a25,void *a26,void *a27,void *a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,void *a35)
{
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;

  _Unwind_Resume(a1);
}

id makeSettingDictionary(NSString *a1, objc_object *a2)
{
  NSString *v3;
  objc_object *v4;
  objc_object *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = *MEMORY[0x24BE83180];
  v10[0] = *MEMORY[0x24BE83178];
  v10[1] = v6;
  v7 = &stru_24CB35168;
  if (v4)
    v7 = (const __CFString *)v4;
  v11[0] = v3;
  v11[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_211042DE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211042E48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211042EA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211042F38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110430E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211043180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t CKBABookmarkTypeForBookmark(void *a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "isReadingListItem"))
  {
    v2 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    v3 = 1;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "CKBABookmarkTypeForBookmark";
      v3 = 1;
      _os_log_impl(&dword_211022000, v2, OS_LOG_TYPE_INFO, "<- %s -> CKBABookmarkTypeReadingListItem", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    v4 = objc_msgSend(v1, "subtype");
    v5 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4 == 1)
    {
      if (v6)
      {
        v8 = 136315138;
        v9 = "CKBABookmarkTypeForBookmark";
        _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "<- %s -> CKBABookmarkTypeTabGroupScopedBookmark", (uint8_t *)&v8, 0xCu);
      }
      v3 = 2;
    }
    else
    {
      if (v6)
      {
        v8 = 136315138;
        v9 = "CKBABookmarkTypeForBookmark";
        _os_log_impl(&dword_211022000, v5, OS_LOG_TYPE_INFO, "<- %s -> CKBABookmarkTypeRegular", (uint8_t *)&v8, 0xCu);
      }
      v3 = 0;
    }
  }

  return v3;
}

uint64_t __redactedArrayOfServerIDs_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "wb_stringByRedactingBookmarkDAVServerID");
}

id copyBookmarkAttributes(void *a1, void *a2, int a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  int v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  WBTabGroup *v26;
  char v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  char v32;
  void *v33;
  uint64_t v34;
  char v35;
  void *v36;
  char v37;
  int v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  void *v51;

  v5 = a1;
  v6 = a2;
  v7 = 1;
  if ((objc_msgSend(v5, "attributesMarkedAsModified:", 1) & 1) == 0)
    v7 = objc_msgSend(v5, "attributesMarkedAsModified:", 2);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 1) != 0 || v7)
  {
    objc_msgSend(v5, "title");
    v11 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v11;
    if (v11)
      v12 = a3;
    else
      v12 = 0;
    v13 = a3 ^ 1;
    if ((v12 & 1) != 0 || v13)
    {
      if (v11)
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, CFSTR("Title"));
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("Title"));

      }
    }
    if ((objc_msgSend(v5, "isFolder") & 1) == 0)
    {
      objc_msgSend(v5, "address");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v17 = 0;
      }
      if (v17)
        v18 = a3;
      else
        v18 = 0;
      if ((v18 | v13) == 1)
      {
        if (v17)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, CFSTR("URL"));
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, CFSTR("URL"));

        }
      }

LABEL_77:
      if ((objc_msgSend(v5, "isReadingListItem") & 1) != 0)
        goto LABEL_88;
      if ((a3 & 1) == 0 && !objc_msgSend(v5, "attributesMarkedAsModified:", 0x200000))
      {
        if ((objc_msgSend(v5, "isReadingListItem") & 1) == 0)
          goto LABEL_142;
LABEL_92:
        if (!objc_msgSend(v5, "attributesMarkedAsModified:", 16))
          goto LABEL_105;
LABEL_93:
        v36 = v10;
        objc_msgSend(v5, "dateAdded");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          v37 = a3;
        else
          v37 = 0;
        if ((v37 & 1) != 0 || !a3)
        {
          if (!v10)
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v41, CFSTR("DateAdded"));

            v10 = 0;
            if ((a3 & 1) != 0)
              goto LABEL_101;
            goto LABEL_105;
          }
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("DateAdded"));
        }
        if ((a3 & 1) != 0)
        {
LABEL_101:
          v38 = 0;
          goto LABEL_107;
        }
LABEL_105:
        if (!objc_msgSend(v5, "attributesMarkedAsModified:", 8))
          goto LABEL_115;
        v38 = 1;
LABEL_107:
        v42 = v10;
        objc_msgSend(v5, "dateLastViewed");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          v43 = a3;
        else
          v43 = 0;
        if ((v43 & 1) != 0 || v38)
        {
          if (!v10)
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v49, CFSTR("DateLastViewed"));

            v10 = 0;
            if ((a3 & 1) != 0)
              goto LABEL_117;
            goto LABEL_115;
          }
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("DateLastViewed"));
        }
        if ((a3 & 1) != 0)
          goto LABEL_117;
LABEL_115:
        if (!objc_msgSend(v5, "attributesMarkedAsModified:", 256))
          goto LABEL_125;
        v38 = 1;
LABEL_117:
        v44 = v10;
        objc_msgSend(v5, "previewText");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
          v45 = a3;
        else
          v45 = 0;
        if ((v45 & 1) != 0 || v38)
        {
          if (!v10)
          {
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKeyedSubscript:", v50, CFSTR("PreviewText"));

            v10 = 0;
            if ((a3 & 1) == 0)
            {
LABEL_125:
              if (!objc_msgSend(v5, "attributesMarkedAsModified:", 128))
                goto LABEL_142;
            }
LABEL_126:
            v46 = v10;
            objc_msgSend(v5, "readingListIconURL");
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (v10)
            {
              objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v10);
              v47 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v47 = 0;
            }
            if (v47)
              v48 = a3;
            else
              v48 = 0;
            if ((v48 & 1) != 0 || !a3)
            {
              if (v47)
              {
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v47, CFSTR("ImageURL"));
              }
              else
              {
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v51, CFSTR("ImageURL"));

              }
            }

            goto LABEL_142;
          }
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("PreviewText"));
        }
        if ((a3 & 1) == 0)
          goto LABEL_125;
        goto LABEL_126;
      }
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "showIconOnly"));
      v34 = objc_claimAutoreleasedReturnValue();

      if (v34)
        v35 = a3;
      else
        v35 = 0;
      if ((v35 & 1) != 0 || !a3)
      {
        if (!v34)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v40, CFSTR("ShowIconOnly"));

          v10 = 0;
LABEL_88:
          if ((objc_msgSend(v5, "isReadingListItem") & 1) == 0)
            goto LABEL_142;
          if ((a3 & 1) != 0)
            goto LABEL_93;
          goto LABEL_92;
        }
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v34, CFSTR("ShowIconOnly"));
      }
      v10 = (void *)v34;
      goto LABEL_88;
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
    if (!objc_msgSend(v5, "isFolder"))
      goto LABEL_77;
  }
  if ((a3 & 1) != 0 || objc_msgSend(v5, "attributesMarkedAsModified:", 32))
  {
    objc_msgSend(v5, "isSelectedFavoritesFolder");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      v16 = a3;
    else
      v16 = 0;
    if ((v16 & 1) != 0 || !a3)
    {
      if (v15)
      {
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, CFSTR("IsSelectedFavoritesFolder"));
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("IsSelectedFavoritesFolder"));

        v15 = 0;
      }
    }
  }
  else
  {
    v15 = v9;
  }
  objc_msgSend(v6, "configuration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "collectionType") != 1)
  {
LABEL_43:

    if ((a3 & 1) != 0)
      goto LABEL_45;
    goto LABEL_44;
  }
  if ((a3 & 1) != 0)
  {

    goto LABEL_40;
  }
  v21 = objc_msgSend(v5, "attributesMarkedAsModified:", 512);

  if ((v21 & 1) != 0)
  {
LABEL_40:
    objc_msgSend(v6, "serverIDForBookmarkID:", objc_msgSend(v5, "lastSelectedChildID"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, CFSTR("LastSelectedTab"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("LastSelectedTab"));

    }
    goto LABEL_43;
  }
LABEL_44:
  if (!objc_msgSend(v5, "attributesMarkedAsModified:", 4096))
  {
    v23 = v15;
    goto LABEL_54;
  }
LABEL_45:
  objc_msgSend(v5, "symbolImageName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    v24 = a3;
  else
    v24 = 0;
  if ((v24 & 1) != 0 || !a3)
  {
    if (v23)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v23, CFSTR("SymbolImageName"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, CFSTR("SymbolImageName"));

    }
  }
LABEL_54:
  objc_msgSend(v6, "configuration");
  v26 = (WBTabGroup *)objc_claimAutoreleasedReturnValue();
  if (-[WBTabGroup collectionType](v26, "collectionType") == 1)
  {
    if ((a3 & 1) != 0)
    {

    }
    else
    {
      v27 = objc_msgSend(v5, "attributesMarkedAsModified:", 0x2000);

      if ((v27 & 1) == 0)
      {
        if ((objc_msgSend(v5, "isReadingListItem") & 1) != 0)
          goto LABEL_74;
        goto LABEL_66;
      }
    }
    v26 = -[WBTabGroup initWithBookmark:]([WBTabGroup alloc], "initWithBookmark:", v5);
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBTabGroup uuid](v26, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "safari_startPageBackgroundImageFileURLForIdentifier:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v30, "checkResourceIsReachableAndReturnError:", 0))
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, CFSTR("BackgroundImage"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v31, CFSTR("BackgroundImage"));

    }
  }

  if ((objc_msgSend(v5, "isReadingListItem") & 1) != 0)
    goto LABEL_74;
  if ((a3 & 1) == 0)
  {
LABEL_66:
    if (objc_msgSend(v5, "attributesMarkedAsModified:", 0x200000))
      goto LABEL_67;
LABEL_74:
    v10 = v23;
    goto LABEL_142;
  }
LABEL_67:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v5, "showIconOnly"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v32 = a3;
  else
    v32 = 0;
  if ((v32 & 1) != 0 || !a3)
  {
    if (v10)
    {
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, CFSTR("ShowIconOnly"));
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v39, CFSTR("ShowIconOnly"));

    }
  }
LABEL_142:

  return v8;
}

id bookmarkURLWithString(void *a1)
{
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", a1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_7(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_8()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return objc_opt_class();
}

void sub_21104BB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WBBookmarkSyncModifiedAttributesForKey(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = WBBookmarkSyncModifiedAttributesForKey_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&WBBookmarkSyncModifiedAttributesForKey_onceToken, &__block_literal_global_3);
  objc_msgSend((id)WBBookmarkSyncModifiedAttributesForKey_keysToModifiedAttributeMasks, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

uint64_t WBBookmarkSyncModifiedAttributesForKeys(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v1);
        v4 |= WBBookmarkSyncModifiedAttributesForKey(*(void **)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id WBKeysForBookmarkSyncModifiedAttributes(int a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __WBKeysForBookmarkSyncModifiedAttributes_block_invoke;
  v6[3] = &unk_24CB31AE0;
  v7 = v2;
  v3 = v2;
  _keysForModifiedAttributeMaskUsingBlock(a1, v6);
  v4 = (void *)objc_msgSend(v3, "copy");

  return v4;
}

void _keysForModifiedAttributeMaskUsingBlock(int a1, void *a2)
{
  void (**v3)(id, const __CFString *);

  v3 = a2;
  if ((a1 & 1) != 0)
  {
    v3[2](v3, CFSTR("ParentAndPosition"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 0x40) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  v3[2](v3, CFSTR("Title"));
  if ((a1 & 0x40) == 0)
  {
LABEL_4:
    if ((a1 & 0x80) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v3[2](v3, CFSTR("IsSelectedFavoritesFolder"));
  if ((a1 & 0x80) == 0)
  {
LABEL_5:
    if ((a1 & 0x1000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v3[2](v3, CFSTR("IsTabGroup"));
  if ((a1 & 0x1000) == 0)
  {
LABEL_6:
    if ((a1 & 0x2000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v3[2](v3, CFSTR("DateAdded"));
  if ((a1 & 0x2000) == 0)
  {
LABEL_7:
    if ((a1 & 0x4000) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v3[2](v3, CFSTR("DateLastViewed"));
  if ((a1 & 0x4000) == 0)
  {
LABEL_8:
    if ((a1 & 0x8000) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  v3[2](v3, CFSTR("HasUserDefinedPreviewText"));
  if ((a1 & 0x8000) == 0)
  {
LABEL_9:
    if ((a1 & 0x10000) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  v3[2](v3, CFSTR("ImageURL"));
  if ((a1 & 0x10000) == 0)
  {
LABEL_10:
    if ((a1 & 0x20000) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  v3[2](v3, CFSTR("PreviewText"));
  if ((a1 & 0x20000) == 0)
  {
LABEL_11:
    if ((a1 & 0x40000) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  v3[2](v3, CFSTR("URL"));
  if ((a1 & 0x40000) == 0)
  {
LABEL_12:
    if ((a1 & 0x80000) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  v3[2](v3, CFSTR("LastSelectedTab"));
  if ((a1 & 0x80000) == 0)
  {
LABEL_13:
    if ((a1 & 0x400000) == 0)
      goto LABEL_14;
    goto LABEL_31;
  }
LABEL_30:
  v3[2](v3, CFSTR("SymbolImageName"));
  if ((a1 & 0x400000) == 0)
  {
LABEL_14:
    if ((a1 & 0x100000) == 0)
      goto LABEL_15;
    goto LABEL_32;
  }
LABEL_31:
  v3[2](v3, CFSTR("CustomFavoritesFolderServerID"));
  if ((a1 & 0x100000) == 0)
  {
LABEL_15:
    if ((a1 & 0x200000) == 0)
      goto LABEL_16;
LABEL_33:
    v3[2](v3, CFSTR("IsPinned"));
    if ((a1 & 0x800000) == 0)
      goto LABEL_18;
    goto LABEL_17;
  }
LABEL_32:
  v3[2](v3, CFSTR("BackgroundImage"));
  if ((a1 & 0x200000) != 0)
    goto LABEL_33;
LABEL_16:
  if ((a1 & 0x800000) != 0)
LABEL_17:
    v3[2](v3, CFSTR("ShowIconOnly"));
LABEL_18:

}

id WBDescriptionForBookmarkSyncModifiedAttributes(int a1)
{
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __WBDescriptionForBookmarkSyncModifiedAttributes_block_invoke;
  v6[3] = &unk_24CB31AE0;
  v7 = v2;
  v3 = v2;
  _keysForModifiedAttributeMaskUsingBlock(a1, v6);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_21104D1A8(_Unwind_Exception *exception_object, int a2, ...)
{
  id v2;
  NSObject *v3;
  void *v4;
  va_list va;

  va_start(va, a2);
  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBBookmarkSyncData positionFromContentsOfData:].cold.1(v4, (uint64_t)va, v3);
    }

    objc_end_catch();
    JUMPOUT(0x21104D15CLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_2110507D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211050AC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211050E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2110511D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110516E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va1);
  _Unwind_Resume(a1);
}

void sub_211051800(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211051D34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211051E6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211051FF0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211052138(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211052290(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21105241C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110525AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110528B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a3);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211052F0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_211053108(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_2110532D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211053494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21105366C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v6 = v5;

  _Unwind_Resume(a1);
}

void sub_211053730(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211053930(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110539AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211053BA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211053D00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211053E60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211053F60(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110540A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_21105413C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110542D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211054398(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211054414(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110546CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_211054AE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2110550A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, ...)
{
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  va_list va;

  va_start(va, a12);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211055374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  va_list va;

  va_start(va, a4);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_2110554A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_2110555D4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_2110556B0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211055754(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110557BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211055A58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211055BB0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211055CC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211055DA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211055EA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211055F74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_211056058(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2110560EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211056384(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_211056504(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110565B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2110566D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110567F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110568BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211056984(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211056A98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211056BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  void *v5;
  void *v6;
  va_list va;

  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211056C58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211056DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  void *v5;
  va_list va;

  va_start(va, a3);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211056E34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211056ED0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211056F3C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211057080(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21105719C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211057228(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211057490(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211057714(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_211057804(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211057914(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211057A5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211057B44(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211057BB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211057C24(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211057C90(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211057D00(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211057D64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211057E08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_211057F0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_211057FAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211058134(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211058410(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_21105860C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211058674(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

WebBookmarks::BookmarkSQLReadTransaction *WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(WebBookmarks::BookmarkSQLReadTransaction *this, sqlite3 *a2, const char *a3)
{
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  const char *v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v22;
  uint8_t buf[24];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  *((_WORD *)this + 8) = 0;
  *(_QWORD *)this = &off_24CB32188;
  *((_QWORD *)this + 1) = a2;
  WebBookmarks::BookmarkSQLStatement::executeSQL(a2, (sqlite3 *)"BEGIN DEFERRED", a3);
  v5 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"SELECT NULL FROM bookmarks", v4);
  if ((v5 - 5) <= 1)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_DEFAULT, "WebBookmarks could not start a deferred transaction; sleeping and trying again later",
        buf,
        2u);
    }
    notify_post("com.apple.MobileSafari.StopSyncing");
    usleep(0xC350u);
    v5 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"SELECT NULL FROM bookmarks", v7);
    if ((v5 - 5) <= 1)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_211022000, v8, OS_LOG_TYPE_DEFAULT, "WebBookmarks still could not start a deferred transaction; sleeping longer",
          buf,
          2u);
      }
      usleep(0x6DDD0u);
      v5 = WebBookmarks::BookmarkSQLStatement::executeSQL(*((WebBookmarks::BookmarkSQLStatement **)this + 1), (sqlite3 *)"SELECT NULL FROM bookmarks", v9);
    }
  }
  *((_BYTE *)this + 17) = (_DWORD)v5 == 0;
  if ((_DWORD)v5)
  {
    if ((_DWORD)v5 == 1)
    {
      v10 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = sqlite3_errmsg(*((sqlite3 **)this + 1));
        WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction((uint64_t)v11, (uint64_t)buf);
      }

    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(v5, v12, v13, v14, v15, v16, v17, v18);
    }
    if (objc_msgSend(MEMORY[0x24BE82CC8], "hasInternalContent"))
    {
      v19 = (id)WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(v20, (uint64_t)&v22);
      }

    }
  }
  return this;
}

void sub_211058D50(_Unwind_Exception *a1)
{
  WebBookmarks::BookmarkSQLTransaction *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  const char *v6;

  v3 = v2;

  WebBookmarks::BookmarkSQLTransaction::~BookmarkSQLTransaction(v1, v5, v6);
  _Unwind_Resume(a1);
}

void WebBookmarks::BookmarkSQLReadTransaction::~BookmarkSQLReadTransaction(WebBookmarks::BookmarkSQLReadTransaction *this, uint64_t a2, const char *a3)
{
  uint64_t v4;
  const char *v5;

  *(_QWORD *)this = &off_24CB32188;
  WebBookmarks::BookmarkSQLTransaction::commit(this, a2, a3);
  WebBookmarks::BookmarkSQLTransaction::~BookmarkSQLTransaction(this, v4, v5);
}

{
  WebBookmarks::BookmarkSQLReadTransaction::~BookmarkSQLReadTransaction(this, a2, a3);
  JUMPOUT(0x212BD4888);
}

uint64_t OUTLINED_FUNCTION_2_1(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

__CFString *WBStringFromBookmarkSyncState(unint64_t a1)
{
  if (a1 < 3)
    return off_24CB323C0[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("State <%zd>"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t WebNSStringFromBookmarkID(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%d"), a1);
}

void sub_21105D978(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_21105F2F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21105F538(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21105F5A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21105F62C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21105F778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_21105F924(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21105FFF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)(v38 - 256));

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&a35);
  _Unwind_Resume(a1);
}

void sub_2110601DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110604A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_2110606DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2110609B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_211060B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211060C6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211060E28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211060F28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_211061118(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110611BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2110614D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  void *v11;
  void *v12;
  void *v13;
  va_list va;

  va_start(va, a11);

  WebBookmarks::BookmarkSQLReadTransaction::~BookmarkSQLReadTransaction((WebBookmarks::BookmarkSQLReadTransaction *)va);
  _Unwind_Resume(a1);
}

void sub_211061688(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211061850(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211061A4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211061BEC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211061CA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211061DA8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211061E50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211061F20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211061F98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110620AC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_2110621A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211062238(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106230C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110623CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211062568(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106271C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110627C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110628DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110629D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_211062AC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211062BB8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211062CA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211062D34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211062D98(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110630C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  void *v30;

  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)&a30);
  _Unwind_Resume(a1);
}

void sub_211063258(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106345C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_211063574(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211063718(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v6;

  _Unwind_Resume(a1);
}

void sub_2110638A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106399C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211063A28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211063BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_211063CC4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)va);

  _Unwind_Resume(a1);
}

void sub_211063F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  void *v5;
  va_list va;

  va_start(va, a5);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211064140(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_211064294(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110643E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106450C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110645CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21106482C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v10 = v8;

  _Unwind_Resume(a1);
}

void sub_211064ADC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211064BE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211064D10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211064DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;

  _Unwind_Resume(a1);
}

void sub_2110651EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,id a52)
{
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;

  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a24, 8);

  _Unwind_Resume(a1);
}

void sub_211065370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2110653C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106545C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211065768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_211065A1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  uint64_t v6;
  va_list va;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a4);
  va_start(va, a4);
  v6 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va1);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211065C70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_211065E5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211066028(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2110664FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,void *a45,uint64_t a46,char a47)
{

  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_211066704(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110667E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110669A8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211066B88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211067014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18)
{

  _Unwind_Resume(a1);
}

void sub_21106716C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110671DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211067514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_211067760(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211067854(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211067900(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_2110679A4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211067AA4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211067BBC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211067C88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211067D30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211067E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211067EE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211067F40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211068028(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21106816C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211068328(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_2110684E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110686D8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211068804(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211068934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211068A1C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211068B30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211068CBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  void *v5;
  void *v6;
  va_list va;

  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211068DD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211068E44(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211068F4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211069058(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211069184(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106930C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2110693B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211069538(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211069618(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211069B1C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211069CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211069F28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106A02C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106A59C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  va_list va;

  va_start(va, a9);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106AD5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, ...)
{
  void *v6;
  va_list va;

  va_start(va, a6);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106ADF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106AFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106B174(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106B55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)va1);
  _Unwind_Resume(a1);
}

void sub_21106B7A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106B88C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106B93C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106BA6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106BB30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106BC5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106BE24(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106BF38(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106BFF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106C09C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106C130(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106C3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21106C5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  void *v6;
  void *v7;
  va_list va;

  va_start(va, a6);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106C730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v17 = v16;

  _Unwind_Resume(a1);
}

void sub_21106C7DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21106C844(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106C9E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_21106CB64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21106D0CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21106D348(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_21106D3DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106D438(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106D4AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106D534(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106D5BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106D744(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106D9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  va_list va;

  va_start(va, a4);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106DC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  void *v5;
  void *v6;
  va_list va;

  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21106DD4C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106DE10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106DE9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106E0EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  void *v5;
  uint64_t v7;
  va_list va;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  va_list va1;
  uint64_t v13;
  uint64_t v14;
  va_list va2;

  va_start(va2, a4);
  va_start(va1, a4);
  va_start(va, a4);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v11 = va_arg(va2, _QWORD);
  v13 = va_arg(va2, _QWORD);
  v14 = va_arg(va2, _QWORD);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va1);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va2);

  _Unwind_Resume(a1);
}

void sub_21106E330(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21106E4C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_21106E5B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21106E6C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106E7E8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106EA98(_Unwind_Exception *a1, uint64_t a2, void *a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va1);

  _Unwind_Resume(a1);
}

void sub_21106EC40(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21106ED9C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21106F214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  void *v32;
  void *v33;

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&a32);

  _Unwind_Resume(a1);
}

uint64_t compareBookmarksByOrder(void *a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  unsigned int v8;

  v4 = a1;
  v5 = a2;
  v6 = objc_msgSend(v4, "orderIndex");
  if (v6 <= objc_msgSend(v5, "orderIndex"))
  {
    v8 = objc_msgSend(v4, "orderIndex");
    if (v8 >= objc_msgSend(v5, "orderIndex"))
      v7 = 0;
    else
      v7 = -1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void sub_21106F350(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106F408(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106F468(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21106F58C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106F688(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106F778(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106F900(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21106FB0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21106FCC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  void *v5;
  va_list va;

  va_start(va, a4);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106FDA0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21106FE58(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21106FFE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110700F0(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211070194(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_21107020C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110702D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id a12)
{

  _Unwind_Resume(a1);
}

void BookmarksFileChanged(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _QWORD block[4];
  id v10;
  uint8_t buf[16];

  v6 = WBS_LOG_CHANNEL_PREFIXBookmarks();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_211022000, v6, OS_LOG_TYPE_INFO, "Received com.apple.bookmarks.BookmarksFileChanged", buf, 2u);
  }
  v7 = a2;
  if (v7)
  {
    bookmarksCollectionQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = ___ZL20BookmarksFileChangedP22__CFNotificationCenterPvPK10__CFStringPKvPK14__CFDictionary_block_invoke;
    block[3] = &unk_24CB31DC8;
    v10 = v7;
    dispatch_sync(v8, block);

  }
}

void sub_2110704F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21107054C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211070670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2110706E0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21107078C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_211070864(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211070954(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)va);
  _Unwind_Resume(a1);
}

void sub_2110709F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211070BC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_211070C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211070D04(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211070D48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211070DA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211070E44(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211070EE4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21107103C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_2110714A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_211071604(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211071944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  void *v10;
  void *v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va1);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211071A44(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211071AB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211071CD8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211071DF4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211071E84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211071EEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2110725D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2110727B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_211072834(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21107288C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211072914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211072A5C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211072B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_211072C5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_211072DD0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211072EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_211072F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21107307C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_211073154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_211073210(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLWriteTransaction::~BookmarkSQLWriteTransaction((WebBookmarks::BookmarkSQLWriteTransaction *)va);
  _Unwind_Resume(a1);
}

void sub_2110732C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21107336C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211073F98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35)
{
  (*(void (**)(uint64_t))(*(_QWORD *)a16 + 8))(a16);
  (*(void (**)(uint64_t))(*(_QWORD *)a18 + 8))(a18);

  (*(void (**)(uint64_t))(*(_QWORD *)a27 + 8))(a27);
  (*(void (**)(uint64_t))(*(_QWORD *)a31 + 8))(a31);

  _Block_object_dispose(&STACK[0x250], 8);
  _Block_object_dispose(&STACK[0x270], 8);

  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&STACK[0x2C0], 8);

  _Unwind_Resume(a1);
}

void sub_2110743C4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_2110746B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  void *v16;
  va_list va;

  va_start(va, a16);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_2110747C0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211074990(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_211074A58(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211074D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_211074FC4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v4;

  _Unwind_Resume(a1);
}

void sub_21107514C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  void *v4;
  va_list va;

  va_start(va, a4);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211075550(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2110756B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211075914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  va_list va;

  va_start(va, a3);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211075A8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211075C14(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  va_list va;

  va_start(va, a2);
  v5 = v4;

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211075CC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211075D90(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211075E18(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211075EE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_2110760A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21107626C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_211076318(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211076374(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211076538(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Block_object_dispose((const void *)(v2 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2110766EC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_211076768(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110767FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_2110768A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21107695C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2110769AC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211076AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_211076B94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2110773DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_2110775DC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);
  _Unwind_Resume(a1);
}

void sub_2110776A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211077740(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110777C8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211077844(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211077910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_2110779F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_211077ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_211077BB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211077D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_211077E48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  if (a10)

  _Unwind_Resume(a1);
}

void sub_211077EE4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110781D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{

  _Unwind_Resume(a1);
}

void sub_2110782C4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211078370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2110783E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211078494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21107856C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110785C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZL33prefixEndingWithFirstWordOfStringP8NSString_block_invoke()
{
  WebBookmarkTitleWordTokenizer *v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;

  v0 = objc_alloc_init(WebBookmarkTitleWordTokenizer);
  v1 = (void *)prefixEndingWithFirstWordOfString(NSString *)::tokenizer;
  prefixEndingWithFirstWordOfString(NSString *)::tokenizer = (uint64_t)v0;

  v2 = dispatch_queue_create("com.apple.WebBookmarks.titleWordTokenizerAccess", 0);
  v3 = (void *)prefixEndingWithFirstWordOfString(NSString *)::tokenizerAccessQueue;
  prefixEndingWithFirstWordOfString(NSString *)::tokenizerAccessQueue = (uint64_t)v2;

}

__n128 __Block_byref_object_copy__1540(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

uint64_t ___ZL33prefixEndingWithFirstWordOfStringP8NSString_block_invoke_1543(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend((id)prefixEndingWithFirstWordOfString(NSString *)::tokenizer, "setString:", *(_QWORD *)(a1 + 32));
  result = objc_msgSend((id)prefixEndingWithFirstWordOfString(NSString *)::tokenizer, "advanceToNextToken");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 48) = result;
  *(_QWORD *)(v3 + 56) = v4;
  return result;
}

void ___ZL6isIPadv_block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    isIPad(void)::result = CFEqual(v0, CFSTR("iPad")) != 0;
    CFRelease(v1);
  }
}

void ___ZL20BookmarksFileChangedP22__CFNotificationCenterPvPK10__CFStringPKvPK14__CFDictionary_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2
    && (objc_msgSend(*(id *)(v2 + 16), "isReadonly") & 1) == 0
    && (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "skipsExternalNotifications") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_updateSyncNotificationType");
    objc_msgSend(*(id *)(a1 + 32), "_clearCachedFavoritesFolderIdentifier");
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "_inMemoryChangeSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "_applyInMemoryChanges:postChangeNotification:", v4, 0);

  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___ZL20BookmarksFileChangedP22__CFNotificationCenterPvPK10__CFStringPKvPK14__CFDictionary_block_invoke_2;
  block[3] = &unk_24CB31DC8;
  v7 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void sub_211078850(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void ___ZL20BookmarksFileChangedP22__CFNotificationCenterPvPK10__CFStringPKvPK14__CFDictionary_block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:userInfo:", CFSTR("WebBookmarksDidReloadNotification"), *(_QWORD *)(a1 + 32), 0);

}

void sub_2110788B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xEu);
}

uint64_t OUTLINED_FUNCTION_15(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_18(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_211078B78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211078DCC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void _SetErrorFromSQLiteResult(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  if (a2)
  {
    if ((a1 - 1) > 0x19)
      v3 = 5;
    else
      v3 = qword_2110B88F8[(int)a1 - 1];
    v4 = (void *)MEMORY[0x24BDD1540];
    v7 = CFSTR("SQLiteResult");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("com.apple.WebBookmarks.ErrorDomain"), v3, v6);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
}

void sub_211078F0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211079168(_Unwind_Exception *a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);

  WebBookmarks::BookmarkSQLReadTransaction::~BookmarkSQLReadTransaction((WebBookmarks::BookmarkSQLReadTransaction *)va);
  _Unwind_Resume(a1);
}

void sub_21107938C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211079630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_211079908(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211079994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_211079A8C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_211079B54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211079D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  void *v10;
  void *v11;

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&a9);

  _Unwind_Resume(a1);
}

void sub_211079EE8(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  void *v3;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21107A078(_Unwind_Exception *a1, uint64_t a2, ...)
{
  void *v2;
  va_list va;

  va_start(va, a2);
  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)va);

  _Unwind_Resume(a1);
}

void sub_21107A1A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21107A308(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21107A578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_21107A6C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BD4888](v1, 0x1080C40D2F62047);
  _Unwind_Resume(a1);
}

void sub_21107A8B8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21107AA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_21107AC10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_2(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

uint64_t WebBookmarksRootBookmarkTitle()
{
  return _WBSLocalizedString();
}

uint64_t WebBookmarksHistoryFolderTitle()
{
  return _WBSLocalizedString();
}

uint64_t WebBookmarksReadingListFolderTitle()
{
  return _WBSLocalizedString();
}

uint64_t WebBookmarksWebFilterAllowedSitesFolderTitle()
{
  return _WBSLocalizedString();
}

uint64_t WebBookmarksBookmarksBarFolderTitle()
{
  return _WBSLocalizedString();
}

uint64_t WebBookmarksBookmarksMenuFolderTitle()
{
  return _WBSLocalizedString();
}

void webFilterConfigurationChanged(uint64_t a1, void *a2)
{
  __CFNotificationCenter *DarwinNotifyCenter;

  objc_msgSend(a2, "reloadSettings");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("WBWebFilterSettingsDidChange"), 0, 0, 1u);
}

void sub_21107D7E8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21107D974(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t bookmarkMatchesFilter(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  id v15;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (bookmarkMatchesFilter(WebBookmark *,NSArray<NSString *> *)::onceToken != -1)
    dispatch_once(&bookmarkMatchesFilter(WebBookmark *,NSArray<NSString *> *)::onceToken, &__block_literal_global_134);
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v3, "title");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", bookmarkMatchesFilter(WebBookmark *,NSArray<NSString *> *)::tokenizationCharacterSet);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v15 = v3;
      v9 = *(_QWORD *)v18;
      v10 = MEMORY[0x24BDAC760];
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v18 != v9)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v16[0] = v10;
          v16[1] = 3221225472;
          v16[2] = ___ZL21bookmarkMatchesFilterP11WebBookmarkP7NSArrayIP8NSStringE_block_invoke_2;
          v16[3] = &unk_24CB33040;
          v16[4] = v12;
          if (objc_msgSend(v6, "indexOfObjectPassingTest:", v16, v15) == 0x7FFFFFFFFFFFFFFFLL)
          {
            v13 = 0;
            goto LABEL_14;
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          continue;
        break;
      }
      v13 = 1;
LABEL_14:
      v3 = v15;
    }
    else
    {
      v13 = 1;
    }

  }
  else
  {
    v13 = 1;
  }

  return v13;
}

void sub_21107DB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  void *v9;
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_21107E4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  WebBookmarks::BookmarkSQLStatement::~BookmarkSQLStatement((WebBookmarks::BookmarkSQLStatement *)&a55);
  _Unwind_Resume(a1);
}

void sub_21107E728(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21107E870(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21107E998(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void ___ZL21bookmarkMatchesFilterP11WebBookmarkP7NSArrayIP8NSStringE_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x24BDD1690]);
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v1);

  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "formUnionWithCharacterSet:", v2);

  v3 = (void *)bookmarkMatchesFilter(WebBookmark *,NSArray<NSString *> *)::tokenizationCharacterSet;
  bookmarkMatchesFilter(WebBookmark *,NSArray<NSString *> *)::tokenizationCharacterSet = (uint64_t)v0;

}

void sub_21107EA3C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

BOOL ___ZL21bookmarkMatchesFilterP11WebBookmarkP7NSArrayIP8NSStringE_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "rangeOfString:options:", *(_QWORD *)(a1 + 32), 9) != 0x7FFFFFFFFFFFFFFFLL;
}

void sub_21107EB48(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21107EC0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21107ECF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21107EE2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21107EF00(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x212BD4888](v1, 0x1080C40D2F62047);
  _Unwind_Resume(a1);
}

void sub_21107F25C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21107F3B4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21107F49C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21107F6A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21107F844(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x212BD4888](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21107FA0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21107FA88(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21107FB8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21107FCA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21107FE1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  MEMORY[0x212BD4888](v4, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_21107FF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_211080138(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21108027C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x212BD4888](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_211080438(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  MEMORY[0x212BD4888](v4, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_211080504(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110805BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_211080660(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110806D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2110807CC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211080908(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x212BD4888](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_211080A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_211080B20(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_211080C40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211080DA4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  MEMORY[0x212BD4888](v4, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_211080EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_211080F50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211081058(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x212BD4888](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_2110811D0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110812AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2110813B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211081500(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x212BD4888](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_2110817BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211081824(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110818E8(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x212BD4888](v2, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_211081A80(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211081B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v14 = v13;

  _Unwind_Resume(a1);
}

void sub_211081C54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211081CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_211081F6C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2110822AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id a42)
{
  void *v42;

  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_2110823B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21108249C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2110825CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2110826D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2110827B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211082814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211082920(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211082988(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211082AD4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  MEMORY[0x212BD4888](v4, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_211082BC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211082D00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211082DA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211083040(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110830AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110831C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  v16 = v15;

  _Unwind_Resume(a1);
}

void sub_211083248(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211083350(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110833EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_211083528(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110835C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_21108365C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21108374C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211083848(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110838D0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110839E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211083A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_211083C34(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211083D94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211083E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_211083F0C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21108403C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110840BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_2110841EC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211084284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_21108430C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211084428(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110844DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_211084558(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211084694(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211084768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_21108484C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211084978(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211084A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_211084AAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211084BE8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211084CC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_211084EB4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21108505C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2110850F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211085254(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2110852C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211085540(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21108569C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211085740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{

  _Unwind_Resume(a1);
}

void sub_211085880(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110859BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211085A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_211085B58(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211085C28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211085D30(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211085DB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_211085EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211086030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211086094(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21108619C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211086234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

void sub_2110863A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_2110864B0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_2110865DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211086720(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x212BD4888](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_2110867C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2110868A8(_Unwind_Exception *a1)
{
  void *v1;
  uint64_t v2;

  MEMORY[0x212BD4888](v2, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_211086BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40)
{
  void *v40;
  void *v41;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);

  _Unwind_Resume(a1);
}

void sub_211086D10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_211086E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  void *v24;

  _Block_object_dispose(&a19, 8);

  _Unwind_Resume(a1);
}

void sub_211086FC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x212BD4888](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_2110870B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_211087118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211087248(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v8 = v5;

  _Unwind_Resume(a1);
}

void sub_2110874A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_21108763C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110876DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2110877B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21108783C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21108799C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211087A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_211087B6C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211087C0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_211087D4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_211087E64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211087ECC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2110880BC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211088118(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211088200(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21108825C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211088344(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110883A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2110884AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  MEMORY[0x212BD4888](v3, 0x1080C40D2F62047);

  _Unwind_Resume(a1);
}

void sub_211088564(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211088664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21108874C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110887A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211088898(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21108892C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110889F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_211088B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

void sub_211088BF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211088C54(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211088C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211088CE8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211088DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211089008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_21108940C(_Unwind_Exception *a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  va_list va;

  va_start(va, a16);

  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v23 - 136), 8);

  _Unwind_Resume(a1);
}

void sub_211089FF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,void *a21)
{
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_21108A2A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21108A538(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, void *a14)
{

  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_2_3(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(_DWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 8) = 2112;
  *(_QWORD *)(a2 + 10) = result;
  return result;
}

void OUTLINED_FUNCTION_3_1(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x12u);
}

id BookmarkInFolderWithoutIconColumnsSelectQuery()
{
  if (BookmarkInFolderWithoutIconColumnsSelectQuery_onceToken != -1)
    dispatch_once(&BookmarkInFolderWithoutIconColumnsSelectQuery_onceToken, &__block_literal_global_57);
  return (id)BookmarkInFolderWithoutIconColumnsSelectQuery_query;
}

uint64_t BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions(char a1)
{
  const __CFString *v2;
  const __CFString *v3;

  if (BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions_onceToken != -1)
    dispatch_once(&BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions_onceToken, &__block_literal_global_58);
  v2 = &stru_24CB35168;
  v3 = CFSTR("AND hidden = 0 ");
  if ((a1 & 1) != 0)
    v3 = &stru_24CB35168;
  if ((a1 & 6) == 2)
    v2 = CFSTR("AND type = 0 ");
  if ((a1 & 6) == 4)
    v2 = CFSTR("AND type = 1 ");
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SELECT %@ FROM bookmarks WHERE parent = ? %@%@ORDER BY order_index ASC"), BookmarkInFolderWithoutIconColumnsSelectQueryWithOptions_columnsStringWithoutIcon, v3, v2);
}

id WBSafariPreferencesDomain()
{
  if (WBSafariPreferencesDomain_onceToken != -1)
    dispatch_once(&WBSafariPreferencesDomain_onceToken, &__block_literal_global_16);
  return (id)WBSafariPreferencesDomain_domain;
}

id WBCurrentProcessContainerPath()
{
  if (WBCurrentProcessContainerPath_onceToken != -1)
    dispatch_once(&WBCurrentProcessContainerPath_onceToken, &__block_literal_global_4);
  return (id)WBCurrentProcessContainerPath_containerPath;
}

id WBSafariContainerPath()
{
  if (WBSafariContainerPath_onceToken != -1)
    dispatch_once(&WBSafariContainerPath_onceToken, &__block_literal_global_5_0);
  return (id)WBSafariContainerPath_containerPath;
}

const __CFString *WBNSStringFromCollectionType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Tabs");
  if (a1 != 1)
    v1 = 0;
  if (a1)
    return v1;
  else
    return CFSTR("Bookmarks");
}

const __CFString *WBNSStringFromCollectionStoreOwner(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Default");
  else
    return off_24CB33EA0[a1 - 1];
}

uint64_t WBS_LOG_CHANNEL_PREFIXCloudBookmarks()
{
  if (WBS_LOG_CHANNEL_PREFIXCloudBookmarks_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCloudBookmarks_onceToken, &__block_literal_global_5_1);
  return WBS_LOG_CHANNEL_PREFIXCloudBookmarks_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCycler()
{
  if (WBS_LOG_CHANNEL_PREFIXCycler_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCycler_onceToken, &__block_literal_global_7_0);
  return WBS_LOG_CHANNEL_PREFIXCycler_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXDataMigration()
{
  if (WBS_LOG_CHANNEL_PREFIXDataMigration_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXDataMigration_onceToken, &__block_literal_global_9);
  return WBS_LOG_CHANNEL_PREFIXDataMigration_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXReadingList()
{
  if (WBS_LOG_CHANNEL_PREFIXReadingList_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXReadingList_onceToken, &__block_literal_global_11);
  return WBS_LOG_CHANNEL_PREFIXReadingList_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXReadingListIcons()
{
  if (WBS_LOG_CHANNEL_PREFIXReadingListIcons_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXReadingListIcons_onceToken, &__block_literal_global_13_0);
  return WBS_LOG_CHANNEL_PREFIXReadingListIcons_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXTabs()
{
  if (WBS_LOG_CHANNEL_PREFIXTabs_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXTabs_onceToken, &__block_literal_global_17);
  return WBS_LOG_CHANNEL_PREFIXTabs_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebsiteData()
{
  if (WBS_LOG_CHANNEL_PREFIXWebsiteData_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebsiteData_onceToken, &__block_literal_global_19_0);
  return WBS_LOG_CHANNEL_PREFIXWebsiteData_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebBookmarkServer()
{
  if (WBS_LOG_CHANNEL_PREFIXWebBookmarkServer_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebBookmarkServer_onceToken, &__block_literal_global_21);
  return WBS_LOG_CHANNEL_PREFIXWebBookmarkServer_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCloudSettings()
{
  if (WBS_LOG_CHANNEL_PREFIXCloudSettings_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCloudSettings_onceToken, &__block_literal_global_23);
  return WBS_LOG_CHANNEL_PREFIXCloudSettings_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXProfiles()
{
  if (WBS_LOG_CHANNEL_PREFIXProfiles_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXProfiles_onceToken, &__block_literal_global_25);
  return WBS_LOG_CHANNEL_PREFIXProfiles_log;
}

void sub_21108EDF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21108EF28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21108F0B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21108F180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21108F23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21108F34C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21108F41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21108F4FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21108F5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21108F6C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_21108F750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21108F7DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21108F8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21108F914(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21108F9D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_21108FA64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21108FAD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21108FBA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21108FCE0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21108FDD8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_21108FE88(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110900A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_211090224(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2110903B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_2110904D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211090534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2110905D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_211090798(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __processAccessLevel_block_invoke()
{
  void *v0;
  int v1;

  processAccessLevel_accessLevel = 0;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isEphemeralMultiUser");

  if (v1)
    processAccessLevel_accessLevel = 1;
}

void sub_211092598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_211092EB8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211093050(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_2110930FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_2110931A4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110931FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_211093290(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_211093374(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110935C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_211093848(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_2110939F4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_211093AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;

  _Unwind_Resume(a1);
}

void sub_211093B58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_211093BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_211093D54(_Unwind_Exception *exception_object, int a2, ...)
{
  id v2;
  NSObject *v3;
  void *v4;
  va_list va;

  va_start(va, a2);
  if (a2 == 1)
  {
    v2 = objc_begin_catch(exception_object);
    v3 = (id)WBS_LOG_CHANNEL_PREFIXCloudBookmarks();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "name");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[WBBookmarkDatabaseSyncData databaseSyncDataWithContentsOfData:].cold.2(v4, (uint8_t *)va, v3);
    }

    objc_end_catch();
    JUMPOUT(0x211093D1CLL);
  }
  _Unwind_Resume(exception_object);
}

uint64_t OUTLINED_FUNCTION_2_4()
{
  void *v0;

  return objc_msgSend(v0, "length");
}

void sub_211096F38(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_211097224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2110977A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_211099158(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  id *v4;
  uint64_t v5;

  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 120));
  _Unwind_Resume(a1);
}

uint64_t _tabGroupManagerProfilesChanged(uint64_t a1, void *a2)
{
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  return objc_msgSend(a2, "_reloadProfilesAndTabGroupsAndNotify:withCompletionHandler:", 1, 0);
}

void sub_21109C160(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(&profilesLock);
  _Unwind_Resume(a1);
}

void sub_2110A19D0(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(&reloadAfterSyncLock);
  _Unwind_Resume(a1);
}

void sub_2110A4AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2110A59A4(_Unwind_Exception *a1)
{
  os_unfair_lock_unlock(&reloadAfterSyncLock);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  void *v0;

  return objc_msgSend(v0, "identifier");
}

void sub_2110A6D2C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2110A8D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2110A93B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2110A9664(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2110ABB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void WebBookmarks::BookmarkSQLStatement::BookmarkSQLStatement(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_211022000, a2, OS_LOG_TYPE_ERROR, "Prepare statement failed (%i)", (uint8_t *)v2, 8u);
}

void WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(void *a1, uint64_t a2)
{
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_2_1((uint64_t)a1, a2, 5.8381e-34);
  OUTLINED_FUNCTION_0_3(&dword_211022000, v3, v4, "%{public}@", v5);

}

void WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(uint64_t a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2, 4.8751e-34);
  OUTLINED_FUNCTION_0_3(&dword_211022000, v2, v3, "WebBookmarks could not start a deferred transaction; bailing. Error was: %{public}s",
    v4);
}

void WebBookmarks::BookmarkSQLReadTransaction::BookmarkSQLReadTransaction(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_211022000, a2, a3, "WebBookmarks could not start a deferred transaction; bailing. Result code was: %d",
    a5,
    a6,
    a7,
    a8,
    0);
}

void WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction(uint64_t a1, uint64_t a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_2_1(a1, a2, 4.8751e-34);
  OUTLINED_FUNCTION_0_3(&dword_211022000, v2, v3, "WebBookmarks could not start an immediate transaction; bailing. Error was: %{public}s",
    v4);
}

void WebBookmarks::BookmarkSQLWriteTransaction::BookmarkSQLWriteTransaction(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_211022000, a2, a3, "WebBookmarks could not start an immediate transaction; bailing. Result code was: %d",
    a5,
    a6,
    a7,
    a8,
    0);
}

void bindAttributesToSQLStatement_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_2_1(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_3(&dword_211022000, v3, (uint64_t)v3, "Error reading bookmark attributes: %{public}@", v4);

  OUTLINED_FUNCTION_4();
}

void __getWFUserSettingsClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *WebContentAnalysisLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("WBWebFilterSettings.m"), 12, CFSTR("%s"), *a1);

  __break(1u);
}

void __getWFUserSettingsClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getWFUserSettingsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("WBWebFilterSettings.m"), 13, CFSTR("Unable to find class %s"), "WFUserSettings");

  __break(1u);
}

CFIndex CFArrayBSearchValues(CFArrayRef theArray, CFRange range, const void *value, CFComparatorFunction comparator, void *context)
{
  return MEMORY[0x24BDBB7E0](theArray, range.location, range.length, value, comparator, context);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF28]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x24BDBC4A8](theString, appendedString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC540](alloc, maxLength, theString);
}

void CFStringFold(CFMutableStringRef theString, CFStringCompareFlags theFlags, CFLocaleRef theLocale)
{
  MEMORY[0x24BDBC5F0](theString, theFlags, theLocale);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x24BDBC5F8](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

void CFStringNormalize(CFMutableStringRef theString, CFStringNormalizationForm theForm)
{
  MEMORY[0x24BDBC6D0](theString, theForm);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x24BDBC740](theString);
}

CGImageMetadataTagRef CGImageMetadataCopyTagWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CGImageMetadataTagRef)MEMORY[0x24BDD90B0](metadata, parent, path);
}

CFTypeRef CGImageMetadataTagCopyValue(CGImageMetadataTagRef tag)
{
  return (CFTypeRef)MEMORY[0x24BDD9120](tag);
}

CGImageMetadataRef CGImageSourceCopyMetadataAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageMetadataRef)MEMORY[0x24BDD9138](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x24BDD9180](url, options);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x24BE04728]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x24BDD13F8]();
}

uint64_t WBSIsEqual()
{
  return MEMORY[0x24BE82E88]();
}

uint64_t WBSReleaseOnMainQueueImpl()
{
  return MEMORY[0x24BE82FA8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _WBSLocalizedString()
{
  return MEMORY[0x24BE82FF8]();
}

uint64_t SafariShared::SuddenTerminationDisabler::enableSuddenTermination(SafariShared::SuddenTerminationDisabler *this)
{
  return MEMORY[0x24BE83000](this);
}

uint64_t SafariShared::SuddenTerminationDisabler::SuddenTerminationDisabler(SafariShared::SuddenTerminationDisabler *this, NSString *a2)
{
  return MEMORY[0x24BE83008](this, a2);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24CB30E70();
}

uint64_t operator new()
{
  return off_24CB30E78();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_guard_abort(__guard *a1)
{
  MEMORY[0x24BEDB940](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x24BEDB948](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x24BEDB950](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

uint64_t ct_green_tea_logger_create_static()
{
  return MEMORY[0x24BED3BD0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCE0](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCF8](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int flock(int a1, int a2)
{
  return MEMORY[0x24BDAE3B0](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return MEMORY[0x24BED3BF8]();
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x24BDAF490]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x24BDAF4A8]();
}

uint64_t sandbox_container_path_for_pid()
{
  return MEMORY[0x24BDAFBF0]();
}

int sqlite3_bind_blob(sqlite3_stmt *a1, int a2, const void *a3, int n, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF48](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&n, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x24BEDDF58](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x24BEDDF60](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x24BEDDF68](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x24BEDDF70](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x24BEDDF80](a1, zName);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x24BEDDF98](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x24BEDDFF0](a1, *(_QWORD *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE008](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x24BEDE010](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x24BEDE020](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE028](a1, *(_QWORD *)&iCol);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x24BEDE048](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE050](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE058](a1, *(_QWORD *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x24BEDE068](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x24BEDE078](a1, *(_QWORD *)&iCol);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x24BEDE100](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x24BEDE108](a1);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE140](pStmt);
}

sqlite3_int64 sqlite3_last_insert_rowid(sqlite3 *a1)
{
  return MEMORY[0x24BEDE180](a1);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x24BEDE1C0](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x24BEDE1D0](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x24BEDE1E0](pStmt);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x24BEDE2A8](a1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x24BDB0630](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x24BDB0638](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x24BDB0660](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x24BDB0688](xarray, index);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x24BDB0720]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x24BDB0930](xdict, key);
  return result;
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x24BDB0BD0](type);
}

