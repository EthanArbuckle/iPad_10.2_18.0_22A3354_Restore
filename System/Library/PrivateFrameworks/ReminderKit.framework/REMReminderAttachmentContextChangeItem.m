@implementation REMReminderAttachmentContextChangeItem

- (REMReminderAttachmentContextChangeItem)initWithReminderChangeItem:(id)a3
{
  id v5;
  REMReminderAttachmentContextChangeItem *v6;
  REMReminderAttachmentContextChangeItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMReminderAttachmentContextChangeItem;
  v6 = -[REMReminderAttachmentContextChangeItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reminderChangeItem, a3);

  return v7;
}

- (NSArray)attachments
{
  void *v2;
  void *v3;

  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachments");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)attachmentsOfClass:(Class)a3
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  -[REMReminderAttachmentContextChangeItem attachments](self, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__REMReminderAttachmentContextChangeItem_attachmentsOfClass___block_invoke;
  v8[3] = &__block_descriptor_40_e26_B24__0__REMAttachment_8_16lu32l8;
  v8[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __61__REMReminderAttachmentContextChangeItem_attachmentsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (NSArray)fileAttachments
{
  return (NSArray *)-[REMReminderAttachmentContextChangeItem attachmentsOfClass:](self, "attachmentsOfClass:", objc_opt_class());
}

- (NSArray)imageAttachments
{
  return (NSArray *)-[REMReminderAttachmentContextChangeItem attachmentsOfClass:](self, "attachmentsOfClass:", objc_opt_class());
}

- (NSArray)urlAttachments
{
  return (NSArray *)-[REMReminderAttachmentContextChangeItem attachmentsOfClass:](self, "attachmentsOfClass:", objc_opt_class());
}

- (id)addFileAttachmentWithURL:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  REMFileAttachment *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  REMFileAttachment *v17;
  void *v19;
  void *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = *MEMORY[0x1E0C99AD0];
  v8 = *MEMORY[0x1E0C99998];
  v21[0] = *MEMORY[0x1E0C99AD0];
  v21[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resourceValuesForKeys:error:", v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[REMReminderAttachmentContextChangeItem newObjectIDForFileAttachment](self, "newObjectIDForFileAttachment");
    v12 = [REMFileAttachment alloc];
    -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accountID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[REMFileAttachment initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:](v12, "initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:", v11, v14, v16, v20, objc_msgSend(v19, "unsignedLongLongValue"), v6, 0);

    -[REMReminderAttachmentContextChangeItem insertAttachment:afterAttachment:](self, "insertAttachment:afterAttachment:", v17, 0);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)addFileAttachmentWithData:(id)a3 uti:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  REMFileAttachment *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  REMFileAttachment *v16;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[REMLogStore write](REMLogStore, "write");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v9;
    v20 = 2048;
    v21 = objc_msgSend(v6, "length");
    v22 = 2112;
    v23 = v7;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Adding data attachment {reminderChangeItem: %@, data.length: %ld, uti: %@}", buf, 0x20u);

  }
  v10 = -[REMReminderAttachmentContextChangeItem newObjectIDForFileAttachment](self, "newObjectIDForFileAttachment");
  v11 = [REMFileAttachment alloc];
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[REMFileAttachment initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:](v11, "initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:", v10, v13, v15, v7, objc_msgSend(v6, "length"), 0, v6);

  -[REMReminderAttachmentContextChangeItem insertAttachment:afterAttachment:](self, "insertAttachment:afterAttachment:", v16, 0);
  return v16;
}

- (id)addImageAttachmentWithURL:(id)a3 width:(unint64_t)a4 height:(unint64_t)a5 error:(id *)a6
{
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  REMImageAttachment *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  REMImageAttachment *v23;
  REMImageAttachment *v24;
  unint64_t v26;
  void *v27;
  void *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = *MEMORY[0x1E0C99AD0];
  v12 = *MEMORY[0x1E0C99998];
  v29[0] = *MEMORY[0x1E0C99AD0];
  v29[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resourceValuesForKeys:error:", v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "objectForKeyedSubscript:", v11);
    v26 = a4;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[REMReminderAttachmentContextChangeItem newObjectIDForImageAttachment](self, "newObjectIDForImageAttachment");
    v17 = v10;
    v18 = [REMImageAttachment alloc];
    -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "accountID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v15, "unsignedLongLongValue");
    v23 = v18;
    v10 = v17;
    v24 = -[REMImageAttachment initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:width:height:](v23, "initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:width:height:", v16, v19, v21, v28, v22, v17, 0, v26, a5);

    -[REMReminderAttachmentContextChangeItem insertAttachment:afterAttachment:](self, "insertAttachment:afterAttachment:", v24, 0);
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (id)addImageAttachmentWithData:(id)a3 uti:(id)a4 width:(unint64_t)a5 height:(unint64_t)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  REMImageAttachment *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  REMImageAttachment *v19;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v21 = a4;
  +[REMLogStore write](REMLogStore, "write");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v23 = v12;
    v24 = 2048;
    v25 = objc_msgSend(v10, "length");
    v26 = 2048;
    v27 = a5;
    v28 = 2048;
    v29 = a6;
    _os_log_impl(&dword_1B4A39000, v11, OS_LOG_TYPE_INFO, "Adding image attachment {reminderChangeItem: %@, data.length: %ld, width: %ld, height: %ld}", buf, 0x2Au);

  }
  v13 = -[REMReminderAttachmentContextChangeItem newObjectIDForImageAttachment](self, "newObjectIDForImageAttachment");
  v14 = [REMImageAttachment alloc];
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "accountID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[REMImageAttachment initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:width:height:](v14, "initWithObjectID:accountID:reminderID:UTI:fileSize:fileURL:data:width:height:", v13, v16, v18, v21, objc_msgSend(v10, "length"), 0, v10, a5, a6);

  -[REMReminderAttachmentContextChangeItem insertAttachment:afterAttachment:](self, "insertAttachment:afterAttachment:", v19, 0);
  return v19;
}

- (id)setURLAttachmentWithURL:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[REMReminderAttachmentContextChangeItem removeURLAttachments](self, "removeURLAttachments");
  -[REMReminderAttachmentContextChangeItem addURLAttachmentWithURL:](self, "addURLAttachmentWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)addURLAttachmentWithURL:(id)a3
{
  id v4;
  id v5;
  REMURLAttachment *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  REMURLAttachment *v11;

  v4 = a3;
  v5 = -[REMReminderAttachmentContextChangeItem newObjectIDForURLAttachment](self, "newObjectIDForURLAttachment");
  v6 = [REMURLAttachment alloc];
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[REMURLAttachment initWithObjectID:accountID:reminderID:url:metadata:](v6, "initWithObjectID:accountID:reminderID:url:metadata:", v5, v8, v10, v4, 0);

  -[REMReminderAttachmentContextChangeItem insertAttachment:afterAttachment:](self, "insertAttachment:afterAttachment:", v11, 0);
  return v11;
}

- (void)removeURLAttachments
{
  -[REMReminderAttachmentContextChangeItem removeAllAttachmentsWithClass:](self, "removeAllAttachmentsWithClass:", objc_opt_class());
}

- (void)addAttachment:(id)a3
{
  -[REMReminderAttachmentContextChangeItem insertAttachment:afterAttachment:](self, "insertAttachment:afterAttachment:", a3, 0);
}

- (void)insertAttachment:(id)a3 beforeAttachment:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[REMLogStore write](REMLogStore, "write");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v9;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Adding attachment before attachment {reminderChangeItem: %@, attachment: %@, siblisngAttachment: %@}", (uint8_t *)&v15, 0x20u);

  }
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "mutableCopy");

  if (v12)
  {
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!v7)
    {
LABEL_8:
      v13 = 0;
      goto LABEL_9;
    }
  }
  v13 = objc_msgSend(v12, "indexOfObject:", v7);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_8;
LABEL_9:
  objc_msgSend(v12, "insertObject:atIndex:", v6, v13);
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAttachments:", v12);

}

- (void)insertAttachment:(id)a3 afterAttachment:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[REMLogStore write](REMLogStore, "write");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v9;
    v17 = 2112;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1B4A39000, v8, OS_LOG_TYPE_INFO, "Adding attachment after attachment {reminderChangeItem: %@, attachment: %@, siblisngAttachment: %@}", (uint8_t *)&v15, 0x20u);

  }
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attachments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v11, "mutableCopy");

  if (v12)
  {
    if (!v7)
      goto LABEL_8;
  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!v7)
      goto LABEL_8;
  }
  v13 = objc_msgSend(v12, "indexOfObject:", v7);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v12, "insertObject:atIndex:", v6, v13 + 1);
    goto LABEL_10;
  }
LABEL_8:
  objc_msgSend(v12, "addObject:", v6);
LABEL_10:
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAttachments:", v12);

}

- (void)removeAttachment:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Removing attachment {reminderChangeItem: %@, attachment: %@}", buf, 0x16u);

  }
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__REMReminderAttachmentContextChangeItem_removeAttachment___block_invoke;
  v13[3] = &unk_1E67F83C0;
  v10 = v4;
  v14 = v10;
  v11 = objc_msgSend(v9, "indexOfObjectPassingTest:", v13);
  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v9, "removeObjectAtIndex:", v11);
    -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttachments:", v9);

  }
}

uint64_t __59__REMReminderAttachmentContextChangeItem_removeAttachment___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)removeAllAttachments
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[REMLogStore write](REMLogStore, "write");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B4A39000, v3, OS_LOG_TYPE_INFO, "Removing all attachments {reminderChangeItem: %@}", (uint8_t *)&v6, 0xCu);

  }
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttachments:", MEMORY[0x1E0C9AA60]);

}

- (void)removeAllAttachmentsWithClass:(Class)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  Class v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[REMLogStore write](REMLogStore, "write");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v6;
    v15 = 2112;
    v16 = a3;
    _os_log_impl(&dword_1B4A39000, v5, OS_LOG_TYPE_INFO, "Removing all attachments {reminderChangeItem: %@} for class %@", buf, 0x16u);

  }
  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attachments");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "mutableCopy");

  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__REMReminderAttachmentContextChangeItem_removeAllAttachmentsWithClass___block_invoke;
  v12[3] = &__block_descriptor_40_e40_B24__0__REMAttachment_8__NSDictionary_16lu32l8;
  v12[4] = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "filterUsingPredicate:", v10);

  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttachments:", v9);

}

BOOL __72__REMReminderAttachmentContextChangeItem_removeAllAttachmentsWithClass___block_invoke()
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (id)newObjectIDForURLAttachment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMTemplate cdEntityNameForSavedReminder](REMTemplate, "cdEntityNameForSavedReminder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    return +[REMTemplate newObjectIDForSavedAttachment](REMTemplate, "newObjectIDForSavedAttachment");
  else
    return +[REMAttachment newObjectID](REMURLAttachment, "newObjectID");
}

- (id)newObjectIDForFileAttachment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMTemplate cdEntityNameForSavedReminder](REMTemplate, "cdEntityNameForSavedReminder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    return +[REMTemplate newObjectIDForSavedAttachment](REMTemplate, "newObjectIDForSavedAttachment");
  else
    return +[REMAttachment newObjectID](REMFileAttachment, "newObjectID");
}

- (id)newObjectIDForImageAttachment
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;

  -[REMReminderAttachmentContextChangeItem reminderChangeItem](self, "reminderChangeItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMTemplate cdEntityNameForSavedReminder](REMTemplate, "cdEntityNameForSavedReminder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    return +[REMTemplate newObjectIDForSavedAttachment](REMTemplate, "newObjectIDForSavedAttachment");
  else
    return +[REMAttachment newObjectID](REMImageAttachment, "newObjectID");
}

- (REMReminderChangeItem)reminderChangeItem
{
  return self->_reminderChangeItem;
}

- (void)setReminderChangeItem:(id)a3
{
  objc_storeStrong((id *)&self->_reminderChangeItem, a3);
}

- (NSMutableArray)mutableAttachments
{
  return self->_mutableAttachments;
}

- (void)setMutableAttachments:(id)a3
{
  objc_storeStrong((id *)&self->_mutableAttachments, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableAttachments, 0);
  objc_storeStrong((id *)&self->_reminderChangeItem, 0);
}

@end
