@implementation ICCloudClientMigrateAllowMatchOnCellularToAllowAutoDownloadOnCellular

intptr_t __ICCloudClientMigrateAllowMatchOnCellularToAllowAutoDownloadOnCellular_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (a2 | a3) != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __ICCloudClientMigrateAllowMatchOnCellularToAllowAutoDownloadOnCellular_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a2)
  {
    objc_msgSend(a2, "ic_automaticDownloadKinds");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
