@implementation SKMountState

- (SKMountState)initWithMountPoint:(id)a3
{
  id v5;
  SKMountState *v6;
  SKMountState *v7;
  NSMutableArray *v8;
  NSMutableArray *mountFlags;
  int v10;
  int *v11;
  int v12;
  const __CFString *v13;
  objc_super v15;
  statfs v16;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SKMountState;
  v6 = -[SKMountState init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_mountPoint, a3);
    v8 = objc_opt_new(NSMutableArray);
    mountFlags = v7->_mountFlags;
    v7->_mountFlags = v8;

    bzero(&v16, 0x878uLL);
    if (!statfs((const char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String"), &v16))
    {
      v10 = 16;
      v11 = &dword_1000451E0;
      do
      {
        if ((v16.f_flags & v10) != 0)
          -[NSMutableArray addObject:](v7->_mountFlags, "addObject:", *((_QWORD *)v11 - 1));
        v12 = *v11;
        v11 += 4;
        v10 = v12;
      }
      while (v12);
      if ((v16.f_flags & 0x200000) != 0)
        v13 = CFSTR("noowners");
      else
        v13 = CFSTR("owners");
      -[NSMutableArray addObject:](v7->_mountFlags, "addObject:", v13);
    }
  }

  return v7;
}

- (NSString)mountPoint
{
  return self->_mountPoint;
}

- (NSMutableArray)mountFlags
{
  return self->_mountFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mountFlags, 0);
  objc_storeStrong((id *)&self->_mountPoint, 0);
}

@end
