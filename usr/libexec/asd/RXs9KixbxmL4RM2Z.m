@implementation RXs9KixbxmL4RM2Z

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003186C;
  block[3] = &unk_1004CE9E0;
  block[4] = a1;
  if (qword_100511630[0] != -1)
    dispatch_once(qword_100511630, block);
  return (id)qword_100511628;
}

- (RXs9KixbxmL4RM2Z)init
{
  RXs9KixbxmL4RM2Z *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *R0CYcVVd8XXm0zfW;
  NSLock *v5;
  NSLock *uBOR9lc7Krr6TYui;
  dispatch_queue_t v7;
  OS_dispatch_queue *mH3NQ8DXxcL1G9QZ;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RXs9KixbxmL4RM2Z;
  v2 = -[RXs9KixbxmL4RM2Z init](&v10, "init");
  v3 = objc_opt_new(NSMutableDictionary);
  R0CYcVVd8XXm0zfW = v2->R0CYcVVd8XXm0zfW;
  v2->R0CYcVVd8XXm0zfW = v3;

  v5 = (NSLock *)objc_alloc_init((Class)NSLock);
  uBOR9lc7Krr6TYui = v2->_uBOR9lc7Krr6TYui;
  v2->_uBOR9lc7Krr6TYui = v5;

  v7 = dispatch_queue_create("com.apple.asd.ctimer", 0);
  mH3NQ8DXxcL1G9QZ = v2->_mH3NQ8DXxcL1G9QZ;
  v2->_mH3NQ8DXxcL1G9QZ = (OS_dispatch_queue *)v7;

  return v2;
}

- (id)KvXBZ2Y159GbeEgH:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[NSLock lock](self->_uBOR9lc7Krr6TYui, "lock");
  v5 = 0;
  do
  {
    v6 = v5;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RXs9KixbxmL4RM2Z OtYQBavMHoCfV2sk:](self, "OtYQBavMHoCfV2sk:", 8));

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->R0CYcVVd8XXm0zfW, "objectForKey:", v5));
  }
  while (v7);
  -[NSMutableDictionary setObject:forKey:](self->R0CYcVVd8XXm0zfW, "setObject:forKey:", v4, v5);
  -[NSLock unlock](self->_uBOR9lc7Krr6TYui, "unlock");
  -[RXs9KixbxmL4RM2Z qY1DoQqvimc9pbAA:](self, "qY1DoQqvimc9pbAA:", v5);

  return v5;
}

- (id)xkNh5bfoCwq3gGYr:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->R0CYcVVd8XXm0zfW, "objectForKey:", a3);
}

- (void)f5FVXJrOBjzaLi8u:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a3;
  -[NSLock lock](self->_uBOR9lc7Krr6TYui, "lock");
  if (v4)
  {
    v9 = 0;
    v10 = 0;
    v11 = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RXs9KixbxmL4RM2Z xkNh5bfoCwq3gGYr:](self, "xkNh5bfoCwq3gGYr:", v4));
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "Xj38ZYkbLwtCgBTH");
    }
    else
    {
      v9 = 0;
      v10 = 0;
      v11 = 0;
    }

    -[NSMutableDictionary removeObjectForKey:](self->R0CYcVVd8XXm0zfW, "removeObjectForKey:", v4);
    if (v9)
    {
      v8 = 0;
      v7 = &v8;
      sub_10027ADA4();
    }
  }
  -[NSLock unlock](self->_uBOR9lc7Krr6TYui, "unlock", v7);

}

- (void)qY1DoQqvimc9pbAA:(id)a3
{
  id v4;
  dispatch_time_t v5;
  NSObject *mH3NQ8DXxcL1G9QZ;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = dispatch_time(0, 1800000000000);
  mH3NQ8DXxcL1G9QZ = self->_mH3NQ8DXxcL1G9QZ;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100031B34;
  v8[3] = &unk_1004CF4A0;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_after(v5, mH3NQ8DXxcL1G9QZ, v8);

}

- (id)OtYQBavMHoCfV2sk:(int64_t)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithCapacity:](NSMutableString, "stringWithCapacity:"));
  if (a3 >= 1)
  {
    do
    {
      objc_msgSend(v4, "appendFormat:", CFSTR("%C"), objc_msgSend(CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"), "characterAtIndex:", arc4random_uniform((uint32_t)objc_msgSend(CFSTR("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"), "length"))));
      --a3;
    }
    while (a3);
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mH3NQ8DXxcL1G9QZ, 0);
  objc_storeStrong((id *)&self->_uBOR9lc7Krr6TYui, 0);
  objc_storeStrong((id *)&self->R0CYcVVd8XXm0zfW, 0);
}

@end
