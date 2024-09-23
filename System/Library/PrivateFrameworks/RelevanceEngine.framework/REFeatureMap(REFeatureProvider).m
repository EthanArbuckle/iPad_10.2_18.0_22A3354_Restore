@implementation REFeatureMap(REFeatureProvider)

- (void)featureValueForName:()REFeatureProvider .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2132F7000, a2, OS_LOG_TYPE_ERROR, "Unable to create multiarray: %@", (uint8_t *)&v2, 0xCu);
}

@end
