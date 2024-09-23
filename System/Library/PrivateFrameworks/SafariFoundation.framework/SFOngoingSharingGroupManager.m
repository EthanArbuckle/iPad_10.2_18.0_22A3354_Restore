@implementation SFOngoingSharingGroupManager

+ (void)fetchSharingGroupsThatIncludeFamilyMembers:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BE82C90]);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__SFOngoingSharingGroupManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke;
  v7[3] = &unk_24C9365B0;
  v8 = v4;
  v9 = v3;
  v5 = v3;
  v6 = v4;
  objc_msgSend(v6, "fetchSharingGroupsThatIncludeFamilyMembers:", v7);

}

uint64_t __75__SFOngoingSharingGroupManager_fetchSharingGroupsThatIncludeFamilyMembers___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
