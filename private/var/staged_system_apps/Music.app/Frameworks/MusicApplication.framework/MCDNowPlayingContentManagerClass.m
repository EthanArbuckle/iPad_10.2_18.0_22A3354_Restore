@implementation MCDNowPlayingContentManagerClass

Class __get_MCDNowPlayingContentManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  MusicCarDisplayUILibrary_16();
  result = objc_getClass("_MCDNowPlayingContentManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    get_MCDNowPlayingContentManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __get_MCDNowPlayingContentManagerClass_block_invoke_cold_1();
    return (Class)MusicCarDisplayUILibrary_16();
  }
  return result;
}

uint64_t __get_MCDNowPlayingContentManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np("Unable to find class %s", "_MCDNowPlayingContentManager");
  return __getFAFamilyMessageGroupClass_block_invoke_cold_1(v0);
}

@end
