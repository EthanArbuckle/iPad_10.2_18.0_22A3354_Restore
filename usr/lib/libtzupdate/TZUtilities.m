@implementation TZUtilities

+ (id)stringWithContentsOfFileAtURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v5, 4, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 && +[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
    NSLog(CFSTR("%s  Error reading file at %@\n%@"), "+[TZUtilities stringWithContentsOfFileAtURL:error:]", v5, *a4);
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2))
    NSLog(CFSTR("%s  File Contents with newline stripped: %@"), "+[TZUtilities stringWithContentsOfFileAtURL:error:]", v8);

  return v8;
}

+ (BOOL)fileExistsAndIsSymbolicLinkAtURL:(id)a3
{
  id v3;
  id v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  int v8;
  _BOOL4 v9;
  BOOL v10;
  __CFString *v11;
  BOOL v12;
  stat v14;

  v3 = a3;
  if (v3)
  {
    memset(&v14, 0, sizeof(v14));
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = lstat((const char *)objc_msgSend(v4, "fileSystemRepresentationWithPath:", v5), &v14);

    v7 = +[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2);
    if (v6 < 0)
    {
      v10 = 0;
      if (!v7)
        goto LABEL_16;
      v11 = CFSTR("%s  File doesn't exist at URL %@");
    }
    else
    {
      if (v7)
        NSLog(CFSTR("%s  File exists at URL %@"), "+[TZUtilities fileExistsAndIsSymbolicLinkAtURL:]", v3);
      v8 = v14.st_mode & 0xF000;
      v9 = +[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 2);
      v10 = v8 == 40960;
      if (v8 == 40960)
        v11 = CFSTR("%s  File at URL %@ is a symbolic link");
      else
        v11 = CFSTR("%s  File at URL %@ is NOT a symbolic link");
      if (!v9)
        goto LABEL_16;
    }
    NSLog(&v11->isa, "+[TZUtilities fileExistsAndIsSymbolicLinkAtURL:]", v3);
LABEL_16:
    v12 = v6 >= 0 && v10;
    goto LABEL_19;
  }
  if (+[TZDLogging canLogMessageAtLevel:](TZDLogging, "canLogMessageAtLevel:", 0))
    NSLog(CFSTR("%s  linkURL is nil!"), "+[TZUtilities fileExistsAndIsSymbolicLinkAtURL:]");
  v12 = 0;
LABEL_19:

  return v12;
}

@end
