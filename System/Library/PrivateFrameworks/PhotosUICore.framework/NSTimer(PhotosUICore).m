@implementation NSTimer(PhotosUICore)

+ (id)px_scheduledTimerWithTimeInterval:()PhotosUICore weakTarget:selector:userInfo:repeats:
{
  id v11;
  id v12;
  _PXTimerTarget *v13;
  void *v14;

  v11 = a6;
  v12 = a4;
  v13 = objc_alloc_init(_PXTimerTarget);
  -[_PXTimerTarget setTarget:](v13, "setTarget:", v12);

  -[_PXTimerTarget setSelector:](v13, "setSelector:", a5);
  objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", v13, sel_handleTimer_, v11, a7, a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)px_timerWithTimeInterval:()PhotosUICore weakTarget:selector:userInfo:repeats:
{
  id v11;
  id v12;
  _PXTimerTarget *v13;
  void *v14;

  v11 = a6;
  v12 = a4;
  v13 = objc_alloc_init(_PXTimerTarget);
  -[_PXTimerTarget setTarget:](v13, "setTarget:", v12);

  -[_PXTimerTarget setSelector:](v13, "setSelector:", a5);
  objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", v13, sel_handleTimer_, v11, a7, a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)px_timerWithFireDate:()PhotosUICore interval:repeats:block:
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = (objc_class *)MEMORY[0x1E0C99E88];
  v11 = a6;
  v12 = a4;
  v13 = [v10 alloc];
  v14 = (void *)objc_msgSend(v11, "copy");

  v15 = (void *)objc_msgSend(v13, "initWithFireDate:interval:target:selector:userInfo:repeats:", v12, a1, sel_blockInvoke_, v14, a5, a2);
  return v15;
}

+ (id)px_scheduledTimerWithTimeInterval:()PhotosUICore repeats:block:
{
  void *v8;
  void *v9;
  void *v10;

  v8 = (void *)MEMORY[0x1E0C99E88];
  v9 = (void *)objc_msgSend(a5, "copy");
  objc_msgSend(v8, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", a1, sel_blockInvoke_, v9, a4, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (void)blockInvoke:()PhotosUICore
{
  void (**v3)(void);
  void (**v4)(void);

  objc_msgSend(a3, "userInfo");
  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    v3[2]();
    v3 = v4;
  }

}

@end
