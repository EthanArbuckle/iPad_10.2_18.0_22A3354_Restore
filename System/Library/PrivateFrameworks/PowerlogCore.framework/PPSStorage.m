@implementation PPSStorage

- (PPSStorage)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PPSStorage;
  return -[PPSStorage init](&v3, sel_init);
}

- (void)setupMetadataStorage
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "[%s] overriden by subclasses", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)startStorage
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "[%s] overriden by subclasses", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)setupStorageForEntryKey:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
  if (v3)
    -[PPSStorage setupStorageForEntryKey:].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
}

- (void)setupStorageForEntryKey:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, MEMORY[0x1E0C81028], a3, "[%s] overriden by subclasses", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
