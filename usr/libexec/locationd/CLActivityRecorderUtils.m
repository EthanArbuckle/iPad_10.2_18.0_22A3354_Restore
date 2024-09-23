@implementation CLActivityRecorderUtils

+ (id)getDbDetails:(void *)a3
{
  id v4;
  void **v5;
  id v6;
  id v7;
  id v8;
  void **v9;
  id v10;
  void *__p[2];
  char v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v4 = objc_alloc((Class)NSString);
  sub_1011389B0((uint64_t)a3, (uint64_t)__p);
  if (v13 >= 0)
    v5 = __p;
  else
    v5 = (void **)__p[0];
  v6 = objc_msgSend(v4, "initWithUTF8String:", v5);
  if (v13 < 0)
    operator delete(__p[0]);
  v7 = objc_msgSend(objc_alloc((Class)NSURL), "initWithString:", v6);
  v8 = objc_alloc((Class)NSString);
  (*(void (**)(void **__return_ptr, void *))(*(_QWORD *)a3 + 32))(__p, a3);
  if (v13 >= 0)
    v9 = __p;
  else
    v9 = (void **)__p[0];
  v10 = objc_msgSend(v8, "initWithUTF8String:", v9);
  if (v13 < 0)
    operator delete(__p[0]);
  v14[0] = CFSTR("url");
  v14[1] = CFSTR("name");
  v15[0] = v7;
  v15[1] = v10;
  return +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
}

@end
