@implementation PXDeleteMomentShares

uint64_t ___PXDeleteMomentShares_block_invoke_314(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 40))
    return objc_msgSend(MEMORY[0x1E0CD1688], "expungeMomentShares:", v1);
  else
    return objc_msgSend(MEMORY[0x1E0CD1688], "trashMomentShares:", v1);
}

void ___PXDeleteMomentShares_block_invoke_2_315(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLSharingGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    v8 = a1[4];
    v9 = a1[5];
    v17 = 138412546;
    v18 = v8;
    v19 = 2112;
    v20 = v9;
    v10 = "Did %@ moment share(s) with uuids: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_DEFAULT;
    v13 = 22;
  }
  else
  {
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v14 = a1[4];
    v15 = a1[5];
    v17 = 138412802;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    v21 = 2112;
    v22 = v5;
    v10 = "Failed to %@ moment share(s) with uuids: %@, error: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_ERROR;
    v13 = 32;
  }
  _os_log_impl(&dword_1A6789000, v11, v12, v10, (uint8_t *)&v17, v13);
LABEL_7:

  v16 = a1[6];
  if (v16)
    (*(void (**)(uint64_t, uint64_t, id))(v16 + 16))(v16, a2, v5);

}

id ___PXDeleteMomentShares_block_invoke_2(int a1, id a2)
{
  return a2;
}

uint64_t ___PXDeleteMomentShares_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

@end
