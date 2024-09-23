@implementation SBIconModelReadOnlyMemoryStore

- (BOOL)saveCurrentIconState:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)saveDesiredIconState:(id)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)deleteCurrentIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

- (BOOL)deleteDesiredIconStateWithOptions:(unint64_t)a3 error:(id *)a4
{
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3328, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

@end
