@implementation UVFenceHandle

- (UVFenceHandle)initWithUnderlying:(id)a3
{
  id v5;
  UVFenceHandle *v6;
  UVFenceHandle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UVFenceHandle;
  v6 = -[UVFenceHandle init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_underlying, a3);

  return v7;
}

- (void)applyToAllScenes
{
  objc_msgSend(MEMORY[0x24BEBD8D8], "_synchronizeDrawingWithFence:", self->_underlying);
}

- (void)applyToScene:(id)a3
{
  objc_msgSend(a3, "_synchronizeDrawingWithFence:", self->_underlying);
}

+ (id)createForAllScenes
{
  void *v2;
  UVFenceHandle *v3;
  NSObject *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x24BEBD8D8], "_synchronizedDrawingFence");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = -[UVFenceHandle initWithUnderlying:]([UVFenceHandle alloc], "initWithUnderlying:", v2);
  }
  else
  {
    UVLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_22AE41000, v4, OS_LOG_TYPE_DEFAULT, "+[UIScene _synchronizedDrawingFence] returned nil", v6, 2u);
    }

    v3 = 0;
  }

  return v3;
}

+ (id)createForScene:(id)a3
{
  id v3;
  void *v4;
  UVFenceHandle *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "_synchronizedDrawingFence");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[UVFenceHandle initWithUnderlying:]([UVFenceHandle alloc], "initWithUnderlying:", v4);
  }
  else
  {
    UVLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_22AE41000, v6, OS_LOG_TYPE_DEFAULT, "-[UIScene _synchronizedDrawingFence] returned nil: scene = %@", (uint8_t *)&v8, 0xCu);
    }

    v5 = 0;
  }

  return v5;
}

- (void)invalidate
{
  -[BKSAnimationFenceHandle invalidate](self->_underlying, "invalidate");
}

- (id)copy
{
  UVFenceHandle *v3;
  void *v4;
  UVFenceHandle *v5;

  v3 = [UVFenceHandle alloc];
  v4 = (void *)-[BKSAnimationFenceHandle copy](self->_underlying, "copy");
  v5 = -[UVFenceHandle initWithUnderlying:](v3, "initWithUnderlying:", v4);

  return v5;
}

- (unint64_t)fenceName
{
  return -[BKSAnimationFenceHandle fenceName](self->_underlying, "fenceName");
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_underlying, CFSTR("underlying"));
}

- (UVFenceHandle)initWithBSXPCCoder:(id)a3
{
  id v4;
  UVFenceHandle *v5;
  uint64_t v6;
  BKSAnimationFenceHandle *underlying;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UVFenceHandle;
  v5 = -[UVFenceHandle init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("underlying"));
    v6 = objc_claimAutoreleasedReturnValue();
    underlying = v5->_underlying;
    v5->_underlying = (BKSAnimationFenceHandle *)v6;

    if (!v5->_underlying)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("UVFenceHandle missing fence handle"));
  }

  return v5;
}

- (BKSAnimationFenceHandle)underlying
{
  return self->_underlying;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end
