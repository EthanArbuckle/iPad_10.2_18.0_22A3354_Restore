@implementation PTCinematographyDetection(Serialization)

+ (void)_detectionsFromInnerAtomStream:()Serialization .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9281000, log, OS_LOG_TYPE_ERROR, "error reading detection from container", v1, 2u);
}

@end
