@implementation NSUserActivity(SYInternalExtensions)

+ (void)_syFetchCurrentUserActivityWithCompletion:()SYInternalExtensions
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SYNSUserActivityExtensions.m"), 207, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  objc_msgSend(MEMORY[0x1E0CA5920], "_currentUserActivityUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CA5920];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __82__NSUserActivity_SYInternalExtensions___syFetchCurrentUserActivityWithCompletion___block_invoke;
    v9[3] = &unk_1E757BDA8;
    v10 = v5;
    objc_msgSend(v7, "_fetchUserActivityWithUUID:completionHandler:", v6, v9);

  }
  else
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
  }

}

@end
