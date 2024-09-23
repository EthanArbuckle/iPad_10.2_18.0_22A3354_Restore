@implementation UITableViewCountView

- (UITableViewCountView)initWithFrame:(CGRect)a3 withCountString:(id)a4 withCount:(int64_t)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  UITableViewCountView *v12;
  void *v13;
  void *v14;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)UITableViewCountView;
  v12 = -[UILabel initWithFrame:](&v16, sel_initWithFrame_, x, y, width, height);
  if (v12)
  {
    +[UIColor grayColor](UIColor, "grayColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    objc_msgSend(off_1E167A828, "systemFontOfSize:", 20.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v14);

    -[UILabel setUserInteractionEnabled:](v12, "setUserInteractionEnabled:", 0);
    -[UILabel setTextAlignment:](v12, "setTextAlignment:", 1);
    -[UIView setBackgroundColor:](v12, "setBackgroundColor:", 0);
    -[UITableViewCountView setCountString:withCount:](v12, "setCountString:withCount:", v11, a5);
  }

  return v12;
}

- (void)setCountString:(id)a3 withCount:(int64_t)a4
{
  NSString *v6;
  NSString *countString;

  v6 = (NSString *)objc_msgSend(a3, "copy");
  countString = self->_countString;
  self->_countString = v6;

  -[UITableViewCountView setCount:](self, "setCount:", a4);
}

- (void)setCount:(int64_t)a3
{
  double v4;
  NSString *countString;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSString *v10;
  id v11;
  BOOL v12;
  NSString *v13;
  id v14;
  BOOL v15;
  NSString *v16;
  id v17;
  BOOL v18;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint8_t buf[16];
  id v24;
  id v25;
  id v26;
  id v27;

  self->_count = a3;
  v4 = 0.0;
  if (a3 > 19)
    v4 = 1.0;
  -[UIView setAlpha:](self, "setAlpha:", v4);
  countString = self->_countString;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", countString, CFSTR("%d"), &v27, self->_count);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v27;
  v8 = v7;
  if (v6)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (!v9)
  {
    v10 = self->_countString;
    v26 = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v10, CFSTR("%u"), &v26, self->_count);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v26;

    v8 = v11;
  }
  if (v6)
    v12 = 1;
  else
    v12 = v8 == 0;
  if (!v12)
  {
    v13 = self->_countString;
    v25 = v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v13, CFSTR("%ld"), &v25, self->_count);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v25;

    v8 = v14;
  }
  if (v6)
    v15 = 1;
  else
    v15 = v8 == 0;
  if (!v15)
  {
    v16 = self->_countString;
    v24 = v8;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%lu"), &v24, self->_count);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v24;

    v8 = v17;
  }
  if (v6)
    v18 = 1;
  else
    v18 = v8 == 0;
  if (!v18)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_185066000, v22, OS_LOG_TYPE_FAULT, "Unrecognized format string presented to setCountString:. The count label will not be updated.", buf, 2u);
      }

    }
    else
    {
      v20 = setCount____s_category;
      if (!setCount____s_category)
      {
        v20 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v20, (unint64_t *)&setCount____s_category);
      }
      v21 = *(NSObject **)(v20 + 8);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v21, OS_LOG_TYPE_ERROR, "Unrecognized format string presented to setCountString:. The count label will not be updated.", buf, 2u);
      }
    }
  }
  -[UILabel setText:](self, "setText:", v6);

}

- (int64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countString, 0);
}

@end
