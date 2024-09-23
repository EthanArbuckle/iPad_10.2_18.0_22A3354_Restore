@implementation PFLDiagnosticReporting

+ (id)reportingStringForIdentifier:(id)a3
{
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    +[PFLDiagnosticReporting reportingStringForIdentifier:].cold.1();
  return 0;
}

+ (void)reportingStringForIdentifier:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_213C25000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "PFLDiagnosticReporting is being deprecated, please consult PFL team.", v0, 2u);
}

@end
