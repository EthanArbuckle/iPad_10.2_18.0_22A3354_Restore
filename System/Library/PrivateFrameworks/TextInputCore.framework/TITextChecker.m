@implementation TITextChecker

- (TITextChecker)init
{
  return -[TITextChecker initWithAsynchronousLoading:](self, "initWithAsynchronousLoading:", 0);
}

- (TITextChecker)initWithAsynchronousLoading:(BOOL)a3
{
  _BOOL8 v3;
  TITextChecker *v4;
  uint64_t v5;
  _TIUITextChecking *checker;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TITextChecker;
  v4 = -[TITextChecker init](&v8, sel_init);
  if (v4)
  {
    +[TITextChecker _UITextCheckerWithAsynchronousLoading:](TITextChecker, "_UITextCheckerWithAsynchronousLoading:", v3);
    v5 = objc_claimAutoreleasedReturnValue();
    checker = v4->_checker;
    v4->_checker = (_TIUITextChecking *)v5;

  }
  return v4;
}

- (BOOL)doneLoading
{
  void *v3;
  void *v4;
  char v5;

  -[TITextChecker checker](self, "checker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TITextChecker checker](self, "checker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_doneLoading");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (_NSRange)checkSpellingOfString:(id)a3 startingAt:(int64_t)a4 language:(id)a5 wrap:(BOOL)a6 correction:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v21;
  _NSRange result;

  v8 = a6;
  v12 = a3;
  v13 = a5;
  *a7 = 0;
  -[TITextChecker checker](self, "checker");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "_doneLoading");

  if (v15)
  {
    -[TITextChecker checker](self, "checker");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "checkSpellingOfString:startingAt:language:wrap:correction:", v12, a4, v13, v8, a7);
    v19 = v18;

  }
  else
  {
    v19 = 0;
    v17 = 0x7FFFFFFFFFFFFFFFLL;
  }

  v20 = v17;
  v21 = v19;
  result.length = v21;
  result.location = v20;
  return result;
}

- (_TIUITextChecking)checker
{
  return self->_checker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checker, 0);
}

+ (id)_UITextCheckerWithAsynchronousLoading:(BOOL)a3
{
  _QWORD block[4];
  BOOL v5;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__TITextChecker__UITextCheckerWithAsynchronousLoading___block_invoke;
  block[3] = &__block_descriptor_33_e5_v8__0l;
  v5 = a3;
  if (_UITextCheckerWithAsynchronousLoading__onceToken != -1)
    dispatch_once(&_UITextCheckerWithAsynchronousLoading__onceToken, block);
  return (id)_UITextCheckerWithAsynchronousLoading__checker;
}

void __55__TITextChecker__UITextCheckerWithAsynchronousLoading___block_invoke(uint64_t a1)
{
  void *v2;
  objc_class *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2050000000;
  v2 = (void *)getUITextCheckerClass_softClass;
  v10 = getUITextCheckerClass_softClass;
  if (!getUITextCheckerClass_softClass)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getUITextCheckerClass_block_invoke;
    v6[3] = &unk_1EA107058;
    v6[4] = &v7;
    __getUITextCheckerClass_block_invoke((uint64_t)v6);
    v2 = (void *)v8[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v7, 8);
  if (v3)
  {
    v4 = objc_msgSend([v3 alloc], "_initWithAsynchronousLoading:", *(unsigned __int8 *)(a1 + 32));
    v5 = (void *)_UITextCheckerWithAsynchronousLoading__checker;
    _UITextCheckerWithAsynchronousLoading__checker = v4;

  }
}

@end
