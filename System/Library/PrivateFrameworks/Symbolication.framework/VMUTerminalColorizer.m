@implementation VMUTerminalColorizer

+ (id)colorize:(id)a3 withColor:(unsigned int)a4 bold:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  const __CFString *v8;
  id v9;
  void *v10;

  v5 = a5;
  v6 = *(_QWORD *)&a4;
  v7 = a3;
  if (getenv("TERM") && isatty(0) && isatty(1) && isatty(2))
  {
    v8 = &stru_1E4E04720;
    if (v5)
      v8 = CFSTR(";1");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\x1B[38;5;%d%@m%@\x1B[0m"), v6, v8, v7);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (id)startColorCodeString:(unsigned int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\x1B[38;5;%dm"), *(_QWORD *)&a3);
}

+ (id)controlCodeResetString
{
  return CFSTR("\x1B[0m");
}

@end
