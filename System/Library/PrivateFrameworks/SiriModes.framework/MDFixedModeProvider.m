@implementation MDFixedModeProvider

- (MDFixedModeProvider)initWithFixedMode:(unint64_t)a3
{
  MDFixedModeProvider *v4;
  MDFixedModeProvider *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MDFixedModeProvider;
  v4 = -[MDFixedModeProvider init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_fixedMode = a3;
    v6 = (void *)*MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEBUG))
      -[MDFixedModeProvider initWithFixedMode:].cold.1((uint64_t *)&v5->_fixedMode, v6);
  }
  return v5;
}

- (unint64_t)currentMode
{
  return self->_fixedMode;
}

- (void)initWithFixedMode:(uint64_t *)a1 .cold.1(uint64_t *a1, void *a2)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  MDModeGetName(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[MDFixedModeProvider initWithFixedMode:]";
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_215D0F000, v3, OS_LOG_TYPE_DEBUG, "%s #modes: Initialized Fixed ModeProvider with mode %@", (uint8_t *)&v5, 0x16u);

}

@end
