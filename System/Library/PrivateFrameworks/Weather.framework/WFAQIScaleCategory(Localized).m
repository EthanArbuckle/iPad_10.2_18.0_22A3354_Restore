@implementation WFAQIScaleCategory(Localized)

- (const)scaleClassName
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("Subclasses are expected to override this."));
  return &stru_24DD9EDF8;
}

- (uint64_t)warningLevel
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("Subclasses are expected to override this."));
  return 0;
}

- (uint64_t)longDescription
{
  return 0;
}

@end
