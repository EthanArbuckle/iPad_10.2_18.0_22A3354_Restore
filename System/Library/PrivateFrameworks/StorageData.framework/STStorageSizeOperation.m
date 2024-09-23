@implementation STStorageSizeOperation

- (void)setSize:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[STStorageOperation setOutput:](self, "setOutput:", v4);

}

- (int64_t)size
{
  void *v2;
  int64_t v3;

  -[STStorageOperation output](self, "output");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (void)main
{
  -[STStorageSizeOperation setSize:](self, "setSize:", 0);
}

@end
