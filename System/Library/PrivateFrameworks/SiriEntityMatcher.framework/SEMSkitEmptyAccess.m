@implementation SEMSkitEmptyAccess

- (id)matchSpans:(id)a3 error:(id *)a4
{
  NSObject *v4;
  const char *v5;
  uint64_t v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = qword_25441F970;
  if (os_log_type_enabled((os_log_t)qword_25441F970, OS_LOG_TYPE_INFO))
  {
    v8 = 136315138;
    v9 = "-[SEMSkitEmptyAccess matchSpans:error:]";
    _os_log_impl(&dword_2462C4000, v4, OS_LOG_TYPE_INFO, "%s Returning empty results.", (uint8_t *)&v8, 0xCu);
  }
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)indexLocale
{
  return 0;
}

@end
