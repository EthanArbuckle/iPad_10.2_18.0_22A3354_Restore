@implementation PGGraphPartOfWeekNode

+ (id)filter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("Weekend"), CFSTR("Weekday"), 0);
  v3 = objc_alloc(MEMORY[0x1E0D42A50]);
  v4 = (void *)objc_msgSend(v3, "initWithLabels:domain:properties:", v2, 400, MEMORY[0x1E0C9AA70]);

  return v4;
}

- (unsigned)domain
{
  return 400;
}

@end
