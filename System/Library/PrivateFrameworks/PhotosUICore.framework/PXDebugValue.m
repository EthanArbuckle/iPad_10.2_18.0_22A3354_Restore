@implementation PXDebugValue

- (PXDebugValue)initWithLabel:(id)a3
{
  id v4;
  NSObject *v5;
  PXDebugValue *v6;
  uint64_t v7;
  NSString *label;
  objc_super v10;
  uint8_t buf[4];
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v12 = CFSTR("label != nil");
      _os_log_fault_impl(&dword_1A6789000, v5, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: %@", buf, 0xCu);
    }

  }
  v10.receiver = self;
  v10.super_class = (Class)PXDebugValue;
  v6 = -[PXDebugValue init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    label = v6->_label;
    v6->_label = (NSString *)v7;

  }
  return v6;
}

- (unint64_t)highlightStyle
{
  return 0;
}

- (NSString)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end
