@implementation PXDebugStringValue

- (PXDebugStringValue)initWithLabel:(id)a3 string:(id)a4 highlightStyle:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  PXDebugStringValue *v13;
  uint64_t v14;
  NSString *string;
  objc_super v17;
  uint8_t buf[4];
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9)
      goto LABEL_10;
    goto LABEL_7;
  }
  PXAssertGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = CFSTR("label != nil");
    _os_log_fault_impl(&dword_1A6789000, v11, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: %@", buf, 0xCu);
  }

  if (!v10)
  {
LABEL_7:
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v19 = CFSTR("string != nil");
      _os_log_fault_impl(&dword_1A6789000, v12, OS_LOG_TYPE_FAULT, "Invalid parameter not satisfying: %@", buf, 0xCu);
    }

  }
LABEL_10:
  v17.receiver = self;
  v17.super_class = (Class)PXDebugStringValue;
  v13 = -[PXDebugValue initWithLabel:](&v17, sel_initWithLabel_, v8);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    string = v13->_string;
    v13->_string = (NSString *)v14;

    v13->_highlightStyle = a5;
  }

  return v13;
}

- (PXDebugStringValue)initWithLabel:(id)a3 BOOLValue:(BOOL)a4 positiveValue:(BOOL)a5 positiveHighlighted:(BOOL)a6 negativeHighlighted:(BOOL)a7
{
  const __CFString *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;

  v7 = CFSTR("NO");
  if (a4)
    v7 = CFSTR("YES");
  if (a4 != a5)
    v8 = a7;
  else
    v8 = a6;
  v9 = 3;
  if (a4 == a5)
    v9 = 1;
  if (v8)
    v10 = v9;
  else
    v10 = 0;
  return -[PXDebugStringValue initWithLabel:string:highlightStyle:](self, "initWithLabel:string:highlightStyle:", a3, v7, v10, a6);
}

- (PXDebugStringValue)initWithLabel:(id)a3 integerValue:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  PXDebugStringValue *v9;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%d"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXDebugStringValue initWithLabel:string:highlightStyle:](self, "initWithLabel:string:highlightStyle:", v7, v8, 0);

  return v9;
}

- (PXDebugStringValue)initWithLabel:(id)a3 doubleValue:(double)a4
{
  void *v6;
  id v7;
  void *v8;
  PXDebugStringValue *v9;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%0.3f"), *(_QWORD *)&a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXDebugStringValue initWithLabel:string:highlightStyle:](self, "initWithLabel:string:highlightStyle:", v7, v8, 0);

  return v9;
}

- (PXDebugStringValue)initWithLabel:(id)a3 highlightedScore:(double)a4
{
  void *v6;
  double v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  PXDebugStringValue *v12;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = round(a4 * 100.0);
  v8 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%2.1f%%"), *(_QWORD *)&v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 3;
  if (a4 >= 0.0)
    v10 = 0;
  if (a4 > 0.0)
    v11 = 1;
  else
    v11 = v10;
  v12 = -[PXDebugStringValue initWithLabel:string:highlightStyle:](self, "initWithLabel:string:highlightStyle:", v8, v9, v11);

  return v12;
}

- (unint64_t)highlightStyle
{
  return self->_highlightStyle;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
