uint64_t pn_default_log()
{
  if (pn_default_log_onceToken != -1)
    dispatch_once(&pn_default_log_onceToken, &__block_literal_global);
  return pn_default_log_sLog;
}

os_log_t __pn_default_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.phonenumbers", "default");
  pn_default_log_sLog = (uint64_t)result;
  return result;
}

uint64_t _PNCopyInternationalCodeForCountry()
{
  return MEMORY[0x24BE1FAE0]();
}

uint64_t _PNCopyNationalDirectDialingPrefixForCountry()
{
  return MEMORY[0x24BE1FAE8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

