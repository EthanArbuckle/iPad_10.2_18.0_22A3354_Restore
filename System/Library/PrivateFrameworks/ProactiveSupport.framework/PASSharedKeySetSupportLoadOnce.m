@implementation PASSharedKeySetSupportLoadOnce

void ___PASSharedKeySetSupportLoadOnce_block_invoke()
{
  void *v0;
  void *v1;
  Class v2;
  uint64_t (*v3)(_QWORD, _QWORD);
  uint64_t (*v4)(_QWORD, _QWORD, _QWORD);
  uint64_t (*v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v0 = (void *)MEMORY[0x1A1AFDC98]();
  v1 = (void *)MEMORY[0x1A1AFDC98]();
  v2 = NSClassFromString((NSString *)CFSTR("NSSharedKeySet"));
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASSharedKeySetSupportLoadOnce(void)_block_invoke");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("_PASSharedKeySetSupport.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clsSharedKeySet"));

  }
  _sharedKeySetCountSelector = (uint64_t)NSSelectorFromString((NSString *)CFSTR("count"));
  v3 = (uint64_t (*)(_QWORD, _QWORD))-[objc_class instanceMethodForSelector:](v2, "instanceMethodForSelector:", _sharedKeySetCountSelector);
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASSharedKeySetSupportLoadOnce(void)_block_invoke");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("_PASSharedKeySetSupport.m"), 30, CFSTR("Failed to find NSSharedKeySet IMP for \"count\"));

  }
  _sharedKeySetCount = v3;
  _sharedKeySetIndexForKeySelector = (uint64_t)NSSelectorFromString((NSString *)CFSTR("indexForKey:"));
  v4 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))-[objc_class instanceMethodForSelector:](v2, "instanceMethodForSelector:", _sharedKeySetIndexForKeySelector);
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASSharedKeySetSupportLoadOnce(void)_block_invoke");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("_PASSharedKeySetSupport.m"), 36, CFSTR("Failed to find NSSharedKeySet IMP for \"indexForKey:\"));

  }
  _sharedKeySetIndexForKey = v4;
  _sharedKeySetKeyAtIndexSelector = (uint64_t)NSSelectorFromString((NSString *)CFSTR("keyAtIndex:"));
  v5 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))-[objc_class instanceMethodForSelector:](v2, "instanceMethodForSelector:", _sharedKeySetKeyAtIndexSelector);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _PASSharedKeySetSupportLoadOnce(void)_block_invoke");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("_PASSharedKeySetSupport.m"), 42, CFSTR("Failed to find NSSharedKeySet IMP for \"keyAtIndex:\"));

  }
  _sharedKeySetKeyAtIndex = v5;
  objc_autoreleasePoolPop(v1);
  objc_autoreleasePoolPop(v0);
}

@end
