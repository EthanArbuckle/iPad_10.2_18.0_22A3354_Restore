@implementation NSManagedObjectContext(RCExtensions)

- (id)recordingsModel
{
  return +[RCSavedRecordingsModel recordingsModelForContext:](RCSavedRecordingsModel, "recordingsModelForContext:", a1);
}

- (BOOL)rc_performAndWaitReturningError:()RCExtensions block:
{
  id v6;
  id v7;
  int v8;
  _BOOL8 v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__0;
  v19 = __Block_byref_object_dispose__0;
  v20 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __78__NSManagedObjectContext_RCExtensions__rc_performAndWaitReturningError_block___block_invoke;
  v11[3] = &unk_1E769BE90;
  v13 = &v21;
  v7 = v6;
  v12 = v7;
  v14 = &v15;
  objc_msgSend(a1, "performBlockAndWait:", v11);
  v8 = *((unsigned __int8 *)v22 + 24);
  if (a3 && !*((_BYTE *)v22 + 24))
  {
    *a3 = objc_retainAutorelease((id)v16[5]);
    v8 = *((unsigned __int8 *)v22 + 24);
  }
  v9 = v8 != 0;

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

@end
