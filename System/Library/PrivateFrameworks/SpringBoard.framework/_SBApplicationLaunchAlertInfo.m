@implementation _SBApplicationLaunchAlertInfo

- (_QWORD)initWithBundleID:(_QWORD *)a1
{
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v4 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)_SBApplicationLaunchAlertInfo;
    v5 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v7 = (void *)a1[2];
      a1[2] = v6;

      v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v9 = (void *)a1[3];
      a1[3] = v8;

    }
  }

  return a1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p [bundleID=%@, foregroundScenes=%@, alertItems=%@]>"), v5, self, self->_bundleID, self->_foregroundScenes, self->_alertItems);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertItems, 0);
  objc_storeStrong((id *)&self->_foregroundScenes, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
