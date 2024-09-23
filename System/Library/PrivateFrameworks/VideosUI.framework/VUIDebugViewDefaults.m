@implementation VUIDebugViewDefaults

- (VUIDebugViewDefaults)initWithTitle:(id)a3 subtitle:(id)a4 domain:(id)a5 defaultName:(id)a6 BOOLType:(BOOL)a7
{
  _BOOL4 v7;
  id v13;
  id v14;
  __CFString *v15;
  __CFString *v16;
  VUIDebugViewDefaults *v17;
  VUIDebugViewDefaults *v18;
  objc_super v20;

  v7 = a7;
  v13 = a3;
  v14 = a4;
  v15 = (__CFString *)a5;
  v16 = (__CFString *)a6;
  v20.receiver = self;
  v20.super_class = (Class)VUIDebugViewDefaults;
  v17 = -[VUIDebugViewDefaults init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    objc_storeStrong((id *)&v18->_subtitle, a4);
    objc_storeStrong((id *)&v18->_domain, a5);
    objc_storeStrong((id *)&v18->_defaultName, a6);
    v18->_integerValueType = !v7;
    if (!v7)
      v18->_defaultIntegerValue = CFPreferencesGetAppIntegerValue(v16, v15, 0);
    else
      v18->_defaultBoolValue = CFPreferencesGetAppBooleanValue(v16, v15, 0) != 0;
  }

  return v18;
}

- (void)toggleDefaultBoolValue
{
  _BOOL4 defaultBoolValue;
  CFPropertyListRef *v4;
  CFPropertyListRef *v5;
  CFPropertyListRef *v6;

  defaultBoolValue = self->_defaultBoolValue;
  v4 = (CFPropertyListRef *)MEMORY[0x1E0C9AE50];
  v5 = (CFPropertyListRef *)MEMORY[0x1E0C9AE40];
  self->_defaultBoolValue = !defaultBoolValue;
  if (defaultBoolValue)
    v6 = v5;
  else
    v6 = v4;
  CFPreferencesSetAppValue((CFStringRef)self->_defaultName, *v6, (CFStringRef)self->_domain);
  CFPreferencesAppSynchronize((CFStringRef)self->_domain);
}

- (void)setDefaultIntegerValue:(unint64_t)a3
{
  self->_defaultIntegerValue = a3;
  CFPreferencesSetAppValue((CFStringRef)self->_defaultName, (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:"), (CFStringRef)self->_domain);
  CFPreferencesAppSynchronize((CFStringRef)self->_domain);
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)defaultName
{
  return self->_defaultName;
}

- (BOOL)defaultBoolValue
{
  return self->_defaultBoolValue;
}

- (void)setDefaultBoolValue:(BOOL)a3
{
  self->_defaultBoolValue = a3;
}

- (BOOL)integerValueType
{
  return self->_integerValueType;
}

- (void)setIntegerValueType:(BOOL)a3
{
  self->_integerValueType = a3;
}

- (unint64_t)defaultIntegerValue
{
  return self->_defaultIntegerValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
