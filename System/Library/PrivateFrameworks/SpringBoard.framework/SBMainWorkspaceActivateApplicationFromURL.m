@implementation SBMainWorkspaceActivateApplicationFromURL

uint64_t ___SBMainWorkspaceActivateApplicationFromURL_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forActivationSetting:", *(_QWORD *)(a1 + 40), 5);
}

void ___SBMainWorkspaceActivateApplicationFromURL_block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_LSFailedToOpenURL:withBundle:", *(_QWORD *)(a1 + 32), 0);

}

@end
