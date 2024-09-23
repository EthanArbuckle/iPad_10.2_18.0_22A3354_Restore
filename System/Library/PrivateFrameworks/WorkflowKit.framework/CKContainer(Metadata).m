@implementation CKContainer(Metadata)

- (uint64_t)wf_fetchDeviceRecords:()Metadata
{
  return objc_msgSend(a1, "wf_fetchDeviceRecordsWithCursor:results:completion:", 0, 0, a3);
}

- (id)wf_metaDataDeviceQueryOperation
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95010]), "initWithRecordType:predicate:", CFSTR("metadata_device_type"), v0);
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95038]), "initWithQuery:", v1);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95088]), "initWithZoneName:", CFSTR("metadata_zone"));
  objc_msgSend(v3, "zoneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setZoneID:", v4);

  v7[0] = CFSTR("DeviceOSType");
  v7[1] = CFSTR("DeviceOSVersionNumber");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDesiredKeys:", v5);

  return v2;
}

- (void)wf_fetchDeviceRecordsWithCursor:()Metadata results:completion:
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, void *);
  void *v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;

  v7 = a4;
  v8 = a5;
  if (!v7)
    v7 = (id)objc_opt_new();
  objc_msgSend(a1, "wf_metaDataDeviceQueryOperation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __76__CKContainer_Metadata__wf_fetchDeviceRecordsWithCursor_results_completion___block_invoke;
  v23[3] = &unk_1E7AF7980;
  v11 = v7;
  v24 = v11;
  objc_msgSend(v9, "setRecordMatchedBlock:", v23);
  v16 = v10;
  v17 = 3221225472;
  v18 = __76__CKContainer_Metadata__wf_fetchDeviceRecordsWithCursor_results_completion___block_invoke_2;
  v19 = &unk_1E7AF79A8;
  v20 = a1;
  v21 = v11;
  v22 = v8;
  v12 = v8;
  v13 = v11;
  objc_msgSend(v9, "setQueryCompletionBlock:", &v16);
  objc_msgSend(MEMORY[0x1E0C94C28], "wf_shortcutsContainer", v16, v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "privateCloudDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addOperation:", v9);

}

@end
