@implementation SUViewHierarchy

id __SUViewHierarchy_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *i;
  void *v6;
  void *v7;

  v4 = a2;
  for (i = (void *)objc_opt_new(); a3; --a3)
    objc_msgSend(i, "appendString:", CFSTR("     "));
  objc_msgSend(v4, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(i, "appendFormat:", CFSTR("%@\n"), v6);

  v7 = (void *)objc_msgSend(i, "copy");
  return v7;
}

void __SUViewHierarchy_block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "appendString:", v2);

}

@end
