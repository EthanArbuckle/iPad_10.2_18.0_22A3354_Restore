@implementation NSString(TRIFunctions)

- (id)tri_assignmentProbabilityWithSeed:()TRIFunctions
{
  id v5;
  id v6;
  const char *v7;
  id v8;
  uint64_t v9;
  int8x16_t *v10;
  CC_LONG v11;
  int8x16_t v12;
  void *v13;
  void *v15;
  id v16;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), a1, v5);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = (const char *)objc_msgSend(v6, "UTF8String");

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIExpressionCategories.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("charString"));

  }
  v8 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 32));
  v9 = objc_msgSend(v8, "mutableBytes");
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99850], CFSTR("malloc failed"), 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  v10 = (int8x16_t *)v9;
  v11 = strlen(v7);
  CC_SHA256(v7, v11, (unsigned __int8 *)v10);
  v12 = veorq_s8(*v10, v10[1]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)(*(unint64_t *)&veor_s8(*(int8x8_t *)v12.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v12, v12, 8uLL)) % 0x3E8)/ 10.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
