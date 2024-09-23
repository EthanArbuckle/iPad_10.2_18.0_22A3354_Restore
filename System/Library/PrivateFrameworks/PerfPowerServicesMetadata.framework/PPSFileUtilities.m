@implementation PPSFileUtilities

+ (id)containerPath
{
  if (containerPath_onceToken != -1)
    dispatch_once(&containerPath_onceToken, &__block_literal_global);
  return (id)containerPath_containerPath;
}

void __33__PPSFileUtilities_containerPath__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v4 = 1;
  v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    v1 = (void *)v0;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v0);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)containerPath_containerPath;
    containerPath_containerPath = v2;

    free(v1);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __33__PPSFileUtilities_containerPath__block_invoke_cold_1(&v4);
  }
}

void __33__PPSFileUtilities_containerPath__block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = *a1;
  v2 = 134217984;
  v3 = v1;
  _os_log_error_impl(&dword_24399D000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error fetching group container systemgroup.com.apple.powerlog : %llu", (uint8_t *)&v2, 0xCu);
}

@end
