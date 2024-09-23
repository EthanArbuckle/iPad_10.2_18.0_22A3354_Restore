@implementation NSObject(PQLResultSetInitializer)

- (uint64_t)initFromPQLResultSet:()PQLResultSetInitializer error:
{
  id v6;
  uint64_t v7;

  v6 = a3;
  if (objc_msgSend(v6, "columns") == 1)
  {
    objc_msgSend(v6, "unarchivedObjectOfClass:atIndex:", objc_opt_class(), 0);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithSqliteCode:andMessage:", 20, CFSTR("This result set has more than one column"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    a1 = (void *)objc_msgSend(a1, "init");
    v7 = 0;
  }

  return v7;
}

@end
