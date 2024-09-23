@implementation NSArray

void __57__NSArray_UserNotificationsCore__unc_map_usingLibrarian___block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)a1[4];
  (*(void (**)(_QWORD, uint64_t, _QWORD))(a1[6] + 16))(a1[6], a2, a1[5]);
  v3 = objc_claimAutoreleasedReturnValue();
  v5 = (id)v3;
  if (v3)
  {
    objc_msgSend(v2, "addObject:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v4);

  }
}

@end
