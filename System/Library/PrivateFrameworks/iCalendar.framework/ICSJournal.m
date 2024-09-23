@implementation ICSJournal

+ (id)name
{
  return CFSTR("VJOURNAL");
}

- (BOOL)validate:(id *)a3
{
  void *v5;
  unsigned int v6;
  unsigned int v7;
  void *v9;
  void *v10;
  objc_super v11;

  -[ICSComponent propertiesForName:](self, "propertiesForName:", CFSTR("STATUS"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[ICSComponent status](self, "status");
    v7 = v6;
    if (v6 > 8 || ((1 << v6) & 0x1C1) == 0)
    {
      if (a3)
      {
        v9 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", CFSTR("Invalid STATUS for VJOURNAL."), *MEMORY[0x1E0CB2D50]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.iCalendar"), 1000, v10);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      if (v7)
        return 0;
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)ICSJournal;
  return -[ICSComponent validate:](&v11, sel_validate_, a3);
}

@end
