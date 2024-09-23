@implementation UMTask

+ (id)taskWithName:(id)a3 reason:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;

  v6 = a3;
  v7 = a4;
  objc_msgSend_mainBundle(MEMORY[0x1E0CB34D0], v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bundleIdentifier(v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend_processInfo(MEMORY[0x1E0CB3898], v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_processName(v16, v17, v18);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_taskWithName_reason_forBundleID_(a1, v14, (uint64_t)v6, v7, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)taskWithName:(id)a3 reason:(id)a4 forBundleID:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  const char *v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v12 = v10;
  if (v10)
  {
    objc_msgSend_setName_(v10, v11, (uint64_t)v7);
    objc_msgSend_setReason_(v12, v13, (uint64_t)v8);
    objc_msgSend_setBundleID_(v12, v14, (uint64_t)v9);
  }

  return v12;
}

- (UMTask)init
{
  UMTask *v2;
  uint64_t v3;
  NSUUID *uuid;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UMTask;
  v2 = -[UMTask init](&v6, sel_init);
  if (v2)
  {
    if (qword_1EE184F18 != -1)
      dispatch_once(&qword_1EE184F18, &unk_1E2A4A748);
    v2->_pid = dword_1EE184F20;
    v3 = objc_opt_new();
    uuid = v2->_uuid;
    v2->_uuid = (NSUUID *)v3;

    v2->_isFinished = 0;
  }
  return v2;
}

- (void)begin
{
  id v3;

  sub_18FAE7234();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAFAAB0(v3, self);

}

- (void)end
{
  id v3;

  objc_msgSend_setIsFinished_(self, a2, 1);
  sub_18FAE7234();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  sub_18FAFBA98(v3, self);

}

- (id)description
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  sub_18FAF2030((uint64_t)UMMobileKeyBag, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_description(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v3, v8, (uint64_t)CFSTR("%p%@"), self, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

- (int)pid
{
  return self->_pid;
}

- (void)setPid:(int)a3
{
  self->_pid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
