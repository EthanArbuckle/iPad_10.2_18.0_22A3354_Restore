@implementation INDeleteTasksIntent(SPI)

- (uint64_t)rem_all
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "all");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

@end
