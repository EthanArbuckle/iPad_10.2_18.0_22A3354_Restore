@implementation SPZKWSession

- (id)queryTaskWithContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (!v3)
    v3 = (id)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE84988]), "initWithSearchQueryContext:", v3);
  objc_msgSend(v4, "setQuery:", v5);

  return v4;
}

@end
