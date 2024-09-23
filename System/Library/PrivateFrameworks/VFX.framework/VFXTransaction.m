@implementation VFXTransaction

+ (uint64_t)lock
{
  return pthread_mutex_lock(&stru_1ED4B7AA8);
}

+ (uint64_t)unlock
{
  return pthread_mutex_unlock(&stru_1ED4B7AA8);
}

+ (void)checkUncommittedTransactions
{
  CFArrayRef *v0;
  CFIndex Count;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFIndex v8;
  uint64_t v9;
  uint64_t v10;

  v0 = (CFArrayRef *)sub_1B197A564();
  Count = CFArrayGetCount(v0[2]);
  v8 = Count;
  if (Count < 2)
  {
    if (Count == 1)
      return;
  }
  else
  {
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: Unflushed transaction present."), v2, v3, v4, v5, v6, v7, v9);
    if (*((double *)CFArrayGetValueAtIndex(v0[2], v8 - 1) + 5) == 0.0)
      sub_1B17C4408(16, (uint64_t)CFSTR("Error: Transaction stack contains an uncommited transaction."), v2, v3, v4, v5, v6, v7, v10);
  }
  sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Unflushed transaction present."), v2, v3, v4, v5, v6, v7, (uint64_t)"(count == 1)");
}

+ (void)begin
{
  sub_1B197A7BC(0);
}

+ (void)flush
{
  sub_1B197A9A8(0, 0);
}

+ (uint64_t)completionBlock
{
  return *((_QWORD *)sub_1B197A534() + 10);
}

+ (void)setAnimationDuration:(double)a1
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double *v8;
  uint64_t v9;

  v8 = (double *)sub_1B197A534();
  if ((*((_BYTE *)v8 + 60) & 2) != 0)
    sub_1B17C4408(16, (uint64_t)CFSTR("Error: modifying duration of implicit transaction. Missing transaction begin?"), v2, v3, v4, v5, v6, v7, v9);
  v8[4] = a1;
}

+ (BOOL)disableActions
{
  return *((double *)sub_1B197A534() + 4) == 0.0;
}

+ (double)animationDuration
{
  return *((double *)sub_1B197A534() + 4);
}

+ (void)commit
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_1B197B174(0, (uint64_t)a2, v2, v3, v4, v5, v6, v7, v8);
}

+ (void)commitImmediate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_1B197B174(1, (uint64_t)a2, v2, v3, v4, v5, v6, v7, v8);
}

+ (CAMediaTimingFunction)animationTimingFunction
{
  CAMediaTimingFunction *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  result = (CAMediaTimingFunction *)sub_1B197B608();
  if (result)
    return (CAMediaTimingFunction *)sub_1B1881EFC((uint64_t)result, v3, v4, v5, v6, v7, v8, v9);
  return result;
}

+ (void)setAnimationTimingFunction:(id)a3
{
  id v3;

  v3 = sub_1B1881E78(a3, a2);
  sub_1B197B59C(v3);
}

+ (void)setDisableActions:(BOOL)a3
{
  sub_1B197B514();
}

+ (void)setCompletionBlock:(id)a3
{
  sub_1B197B4C0(a3);
}

+ (id)valueForKey:(id)a3
{
  return sub_1B197B488(a3);
}

+ (void)setValue:(id)a3 forKey:(id)a4
{
  sub_1B197B418(a4, a3);
}

+ (BOOL)setImmediateMode:(BOOL)a3
{
  _BOOL4 v3;
  const void *v4;
  char v5;

  v3 = a3;
  v4 = sub_1B197A534();
  v5 = sub_1B197B6CC((uint64_t)v4);
  sub_1B197B65C(v3);
  return v5;
}

+ (BOOL)immediateMode
{
  const void *v2;

  v2 = sub_1B197A534();
  if ((sub_1B197B6CC((uint64_t)v2) & 1) != 0)
    return 1;
  else
    return sub_1B197B644();
}

+ (void)setImmediateModeRestrictedContext:(__CFXWorld *)a3
{
  sub_1B197B6A8((uint64_t)a3);
}

+ (__CFXWorld)immediateModeRestrictedContext
{
  const void *v2;

  v2 = sub_1B197A534();
  return (__CFXWorld *)sub_1B179859C((uint64_t)v2);
}

+ (void)setCurrentThreadImmediateMode:(BOOL)a3
{
  sub_1B197B620(a3);
}

+ (void)postCommandWithContext:(__CFXWorld *)a3 object:(id)a4 applyBlock:(id)a5
{
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v8 = sub_1B197A534();
  if (a3)
  {
LABEL_4:
    if ((sub_1B197B6D8((uint64_t)v8, (id *)a3) & 1) != 0)
    {
      if (a3)
      {
        sub_1B187973C((uint64_t)a3, (uint64_t)v16, v17, v18, v19, v20, v21, v22);
        (*((void (**)(id, double))a5 + 2))(a5, 0.0);
        sub_1B18797B4((uint64_t)a3, v23, v24, v25, v26, v27, v28, v29);
        return;
      }
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  if (sub_1B193EBA0(a4))
  {
    a3 = (__CFXWorld *)sub_1B17C6244(a4, v9, v10, v11, v12, v13, v14, v15);
    goto LABEL_4;
  }
  a3 = 0;
  if ((sub_1B197B6D8((uint64_t)v8, 0) & 1) != 0)
  {
LABEL_8:
    (*((void (**)(id, double))a5 + 2))(a5, 0.0);
    return;
  }
LABEL_9:
  v30 = objc_msgSend___CFObject(a4, v16, v17, v18);
  sub_1B197B9A0(v8, a3, a4, v30, 0, a5, v31, v32);
}

+ (void)postCommandWithContext:(__CFXWorld *)a3 object:(id)a4 keyPath:(id)a5 applyBlock:(id)a6
{
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;

  v10 = sub_1B197A534();
  if (!a3)
  {
    if (sub_1B193EBA0(a4))
      a3 = (__CFXWorld *)sub_1B17C6244(a4, v11, v12, v13, v14, v15, v16, v17);
    else
      a3 = 0;
  }
  v18 = sub_1B197B6D8((uint64_t)v10, (id *)a3);
  v22 = (_QWORD *)objc_msgSend___CFObject(a4, v19, v20, v21);
  if (v18)
    sub_1B197AEC4((uint64_t)a3, v22, (const __CFString *)a5, (uint64_t)v10, (uint64_t)a6);
  else
    sub_1B197B9A0(v10, a3, a4, (uint64_t)v22, a5, a6, v23, v24);
}

+ (void)postCommandWithContext:(__CFXWorld *)a3 object:(id)a4 key:(id)a5 subscriptIndex:(unint64_t)a6 derivedKeyPath:(id)a7 applyBlock:(id)a8
{
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  v14 = sub_1B197A534();
  if (!a3)
  {
    if (sub_1B193EBA0(a4))
      a3 = (__CFXWorld *)sub_1B17C6244(a4, v15, v16, v17, v18, v19, v20, v21);
    else
      a3 = 0;
  }
  v22 = sub_1B197B6D8((uint64_t)v14, (id *)a3);
  v26 = (void *)objc_msgSend___CFObject(a4, v23, v24, v25);
  if (v22)
    sub_1B197AF98((uint64_t)a3, v26, (const __CFString *)a5, a6, (uint64_t)v14, (uint64_t)a8);
  else
    sub_1B197B9A0(v14, a3, a4, (uint64_t)v26, a7, a8, v27, v28);
}

+ (void)postCommandWithContext:(__CFXWorld *)a3 object:(id)a4 key:(id)a5 subscriptKey:(id)a6 derivedKeyPath:(id)a7 applyBlock:(id)a8
{
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;

  v14 = sub_1B197A534();
  if (!a3)
  {
    if (sub_1B193EBA0(a4))
      a3 = (__CFXWorld *)sub_1B17C6244(a4, v15, v16, v17, v18, v19, v20, v21);
    else
      a3 = 0;
  }
  v22 = sub_1B197B6D8((uint64_t)v14, (id *)a3);
  v26 = (void *)objc_msgSend___CFObject(a4, v23, v24, v25);
  if (v22)
    sub_1B197B084((uint64_t)a3, v26, (const __CFString *)a5, a6, (uint64_t)v14, (uint64_t)a8);
  else
    sub_1B197B9A0(v14, a3, a4, (uint64_t)v26, a7, a8, v27, v28);
}

+ (void)enqueueCommandForObject:(id)a3 immediateTransactionBlock:(id)a4
{
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_class *v22;
  NSString *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[6];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a3 = (id)objc_msgSend_world(a3, v8, v9, v10);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v21 = objc_msgSend_worldRef(a3, v11, v12, v13);
    if (!v21)
      sub_1B17C4408(17, (uint64_t)CFSTR("Assertion '%s' failed. Null argument"), v15, v16, v17, v18, v19, v20, (uint64_t)"worldRef");
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = sub_1B197C83C;
    v30[3] = &unk_1E63DA0D0;
    v30[4] = a4;
    v30[5] = a2;
    objc_msgSend_postCommandWithContext_object_applyBlock_(a1, v14, v21, (uint64_t)a3, v30);
  }
  else
  {
    v22 = (objc_class *)objc_opt_class();
    v23 = NSStringFromClass(v22);
    sub_1B17C4408(16, (uint64_t)CFSTR("Unreachable code: Unsupported class %@"), v24, v25, v26, v27, v28, v29, (uint64_t)v23);
  }
}

+ (void)performPresentationObjectQueriesInWorld:(id)a3 usingBlock:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v5 = objc_msgSend_worldRef(a3, a2, (uint64_t)a3, (uint64_t)a4);
  v21 = v5;
  if (v5)
  {
    v13 = v5;
    sub_1B187973C(v5, v6, v7, v8, v9, v10, v11, v12);
    (*((void (**)(id, uint64_t *))a4 + 2))(a4, &v21);
    sub_1B18797B4(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  else
  {
    (*((void (**)(id, uint64_t *))a4 + 2))(a4, &v21);
  }
}

+ (unsigned)currentState
{
  return sub_1B197B780();
}

- (void)begin
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_begin(VFXTransaction, a2, v2, v3);
}

- (void)commit
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_commit(VFXTransaction, a2, v2, v3);
}

- (void)flush
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_flush(VFXTransaction, a2, v2, v3);
}

- (void)lock
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_lock(VFXTransaction, a2, v2, v3);
}

- (void)unlock
{
  uint64_t v2;
  uint64_t v3;

  objc_msgSend_unlock(VFXTransaction, a2, v2, v3);
}

- (void)setAnimationDuration:(double)a3
{
  uint64_t v3;
  uint64_t v4;

  objc_msgSend_setAnimationDuration_(VFXTransaction, a2, v3, v4, a3);
}

- (double)animationDuration
{
  uint64_t v2;
  uint64_t v3;
  double result;

  objc_msgSend_animationDuration(VFXTransaction, a2, v2, v3);
  return result;
}

- (void)setDisableActions:(BOOL)a3
{
  ((void (*)(__objc2_class *, char *, BOOL))MEMORY[0x1E0DE7D20])(VFXTransaction, sel_setDisableActions_, a3);
}

- (BOOL)disableActions
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(VFXTransaction, sel_disableActions);
}

- (void)setAnimationTimingFunction:(id)a3
{
  const char *v4;
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a3 = (id)objc_msgSend_functionWithName_(MEMORY[0x1E0CD27D0], v4, (uint64_t)a3, v5);
  MEMORY[0x1E0DE7D20](VFXTransaction, sel_setAnimationTimingFunction_, a3, v5);
}

- (id)animationTimingFunction
{
  NSLog(CFSTR("animationTimingFunction not implemented for Javascript"), a2);
  return 0;
}

@end
