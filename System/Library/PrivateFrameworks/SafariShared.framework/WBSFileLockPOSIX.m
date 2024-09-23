@implementation WBSFileLockPOSIX

- (WBSFileLockPOSIX)initWithFileDescriptor:(int)a3
{
  WBSFileLockPOSIX *v4;
  WBSFileLockPOSIX *v5;
  WBSFileLockPOSIX *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WBSFileLockPOSIX;
  v4 = -[WBSFileLockPOSIX init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_fileDescriptor = a3;
    v6 = v4;
  }
  else
  {
    close(a3);
  }

  return v5;
}

- (void)releaseLock
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = a1;
  __error();
  OUTLINED_FUNCTION_2_6(&dword_1A3D90000, v2, v3, "Failed to unlock coordination lock: %{errno}d", v4, v5, v6, v7, 0);

  OUTLINED_FUNCTION_2();
}

- (void)dealloc
{
  objc_super v3;

  if (self->_fileDescriptor != -1)
    -[WBSFileLockPOSIX releaseLock](self, "releaseLock");
  v3.receiver = self;
  v3.super_class = (Class)WBSFileLockPOSIX;
  -[WBSFileLockPOSIX dealloc](&v3, sel_dealloc);
}

@end
