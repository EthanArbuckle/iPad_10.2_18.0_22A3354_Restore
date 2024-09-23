@implementation BRCCollaborationUploadOperation

- (BRCCollaborationUploadOperation)initWithRecord:(id)a3 progress:(id)a4 syncContext:(id)a5 sessionContext:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  BRCCollaborationUploadOperation *v18;
  void *v19;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a5;
  objc_msgSend(v11, "recordID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "recordName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("upload-"), "stringByAppendingString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21.receiver = self;
  v21.super_class = (Class)BRCCollaborationUploadOperation;
  v18 = -[_BRCOperation initWithName:syncContext:sessionContext:](&v21, sel_initWithName_syncContext_sessionContext_, v17, v14, v13);

  if (v18)
  {
    objc_storeStrong((id *)&v18->_record, a3);
    objc_storeStrong((id *)&v18->_progress, a4);
    -[_BRCOperation setNonDiscretionary:](v18, "setNonDiscretionary:", 1);
    objc_msgSend(MEMORY[0x24BDB9190], "br_collaborationUpload");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_BRCOperation setGroup:](v18, "setGroup:", v19);

  }
  return v18;
}

- (void)main
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_8(&dword_230455000, v0, v1, "[DEBUG] Starting the upload operation%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void __39__BRCCollaborationUploadOperation_main__block_invoke(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  double v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  if (a3 < 0.0)
  {
    brc_bread_crumbs();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218242;
      v10 = a3;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_230455000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Upload: Received negative progress from CK. progress [%f]%@", (uint8_t *)&v9, 0x16u);
    }

  }
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "totalUnitCount") * (uint64_t)(a3 * 1000.0) / 1000;
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "completedUnitCount") <= v8)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 512), "setCompletedUnitCount:", v8);

}

void __39__BRCCollaborationUploadOperation_main__block_invoke_144(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  if (v8 || objc_msgSend(v11, "count") != 1)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 520);
  if (v10)
    (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v9, v8);

}

- (BOOL)shouldRetryForError:(id)a3
{
  return 0;
}

- (id)uploadCompletionBlock
{
  return objc_getProperty(self, a2, 520, 1);
}

- (void)setUploadCompletionBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 520);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_uploadCompletionBlock, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
