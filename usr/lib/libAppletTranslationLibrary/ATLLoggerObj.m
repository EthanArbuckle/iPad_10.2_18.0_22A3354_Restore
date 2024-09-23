@implementation ATLLoggerObj

+ (void)Log:(int)a3 msg:(id)a4
{
  os_log_type_t v4;
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v4 = a3;
  v9 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  ATLLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, v4))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1C3511000, v6, v4, "%@", (uint8_t *)&v7, 0xCu);
  }

}

+ (id)FormatLogWithLine:(int)a3 fmt:(id)a4
{
  uint64_t v5;

  FormatLogv((uint64_t)"OVM", *(uint64_t *)&a3, a4, (uint64_t)&v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
