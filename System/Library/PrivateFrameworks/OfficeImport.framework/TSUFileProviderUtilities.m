@implementation TSUFileProviderUtilities

- (TSUFileProviderUtilities)init
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUFileProviderUtilities init]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUFileProviderUtilities.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 22, 0, "Do not call method");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[TSUFileProviderUtilities init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

+ (void)initialize
{
  if (initialize_once != -1)
    dispatch_once(&initialize_once, &__block_literal_global_22);
}

void *__38__TSUFileProviderUtilities_initialize__block_invoke()
{
  void *result;
  void *v1;

  v1 = 0;
  _FPSetAlternateContentsURLOnDocumentURL = TSUSoftLinkingGetFrameworkFunction(0, CFSTR("FileProvider"), "FPSetAlternateContentsURLOnDocumentURL", &v1);
  _FPFetchAlternateContentsURLForDocumentURL = TSUSoftLinkingGetFrameworkFunction(0, CFSTR("FileProvider"), "FPFetchAlternateContentsURLForDocumentURL", &v1);
  _FPDidUpdateAlternateContentsDocumentForDocumentAtURL = TSUSoftLinkingGetFrameworkFunction(0, CFSTR("FileProvider"), "FPDidUpdateAlternateContentsDocumentForDocumentAtURL", &v1);
  result = TSUSoftLinkingGetFrameworkFunction(0, CFSTR("FileProvider"), "FPBookmarkableStringFromDocumentURL", &v1);
  _FPBookmarkableStringFromDocumentURL = result;
  return result;
}

+ (void)setAlternateContentsURL:(id)a3 onDocumentURL:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void (*v11)(id, id, _QWORD *);
  void *v12;
  _QWORD v13[4];
  id v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  v11 = (void (*)(id, id, _QWORD *))_FPSetAlternateContentsURLOnDocumentURL;
  if (_FPSetAlternateContentsURLOnDocumentURL)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __77__TSUFileProviderUtilities_setAlternateContentsURL_onDocumentURL_completion___block_invoke;
    v13[3] = &unk_24F39B9A0;
    v14 = v9;
    v11(v8, v7, v13);

  }
  else if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v12);

  }
}

uint64_t __77__TSUFileProviderUtilities_setAlternateContentsURL_onDocumentURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)fetchAlternateContentsURLForDocumentURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void (*v8)(id, _QWORD *);
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  v8 = (void (*)(id, _QWORD *))_FPFetchAlternateContentsURLForDocumentURL;
  if (_FPFetchAlternateContentsURLForDocumentURL)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __79__TSUFileProviderUtilities_fetchAlternateContentsURLForDocumentURL_completion___block_invoke;
    v10[3] = &unk_24F39B9C8;
    v11 = v6;
    v8(v5, v10);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v9);

  }
}

uint64_t __79__TSUFileProviderUtilities_fetchAlternateContentsURLForDocumentURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)didUpdateAlternateContentsDocumentForDocumentAtURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD);
  void (*v8)(id, _QWORD *);
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD))v6;
  v8 = (void (*)(id, _QWORD *))_FPDidUpdateAlternateContentsDocumentForDocumentAtURL;
  if (_FPDidUpdateAlternateContentsDocumentForDocumentAtURL)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __90__TSUFileProviderUtilities_didUpdateAlternateContentsDocumentForDocumentAtURL_completion___block_invoke;
    v10[3] = &unk_24F39B9A0;
    v11 = v6;
    v8(v5, v10);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v7)[2](v7, v9);

  }
}

uint64_t __90__TSUFileProviderUtilities_didUpdateAlternateContentsDocumentForDocumentAtURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

+ (void)bookmarkableStringFromDocumentURL:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void (*v8)(id, _QWORD *);
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  v6 = a4;
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))v6;
  v8 = (void (*)(id, _QWORD *))_FPBookmarkableStringFromDocumentURL;
  if (_FPBookmarkableStringFromDocumentURL)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __73__TSUFileProviderUtilities_bookmarkableStringFromDocumentURL_completion___block_invoke;
    v10[3] = &unk_24F39B9F0;
    v11 = v6;
    v8(v5, v10);

  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 3328, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v9);

  }
}

uint64_t __73__TSUFileProviderUtilities_bookmarkableStringFromDocumentURL_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
