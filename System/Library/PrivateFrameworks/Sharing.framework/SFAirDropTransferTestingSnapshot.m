@implementation SFAirDropTransferTestingSnapshot

+ (id)writeSnapshotForTransfer:(id)a3 initialInfo:(id)a4 name:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  SFAirDropTransferTestingSnapshot *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  id v23;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[SFAirDropTransferTestingSnapshot initWithTransfer:initialInfo:]([SFAirDropTransferTestingSnapshot alloc], "initWithTransfer:initialInfo:", v11, v10);

  v13 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v11, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@_%@"), v14, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "temporaryDirectory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLByAppendingPathComponent:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v19 = -[SFAirDropTransferTestingSnapshot writeToURL:error:](v12, "writeToURL:error:", v18, &v25);
  v20 = v25;
  airdrop_log();
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v22)
    {
      *(_DWORD *)buf = 138412290;
      v27 = v18;
      _os_log_impl(&dword_1A2830000, v21, OS_LOG_TYPE_DEFAULT, "Write AirDrop snapshot SUCCESS {url: %@}", buf, 0xCu);
    }

    v23 = v18;
  }
  else
  {
    if (v22)
    {
      *(_DWORD *)buf = 138412290;
      v27 = v20;
      _os_log_impl(&dword_1A2830000, v21, OS_LOG_TYPE_DEFAULT, "Write AirDrop snapshot FAIL {error: %@}", buf, 0xCu);
    }

    v23 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v20);
  }

  return v23;
}

+ (id)loadSnapshotFromURL:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x1E0C99D50];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithContentsOfURL:", v6);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirDropTransferTestingSnapshot)initWithTransfer:(id)a3 initialInfo:(id)a4
{
  id v7;
  id v8;
  SFAirDropTransferTestingSnapshot *v9;
  SFAirDropTransferTestingSnapshot *v10;
  void *v11;
  CFStringRef v12;
  NSString *nodeDisplayName;
  CFStringRef v14;
  NSString *nodeRealName;
  CFSetRef v16;
  NSSet *nodeContactIdentifiers;
  CFStringRef v18;
  NSString *nodeContactIdentifier;
  void *v20;
  void *v21;
  __CFData *TransferDataWithCGImage;
  NSData *transferFileIcon;
  __CFData *v24;
  NSData *transferSmallFileIcon;
  SFAirDropTransferTestingSnapshot *v26;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SFAirDropTransferTestingSnapshot;
  v9 = -[SFAirDropTransferTestingSnapshot init](&v28, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transfer, a3);
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SenderNode"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        v12 = SFNodeCopyDisplayName((uint64_t)v11);
        nodeDisplayName = v10->_nodeDisplayName;
        v10->_nodeDisplayName = &v12->isa;

        v14 = SFNodeCopyRealName((uint64_t)v11);
        nodeRealName = v10->_nodeRealName;
        v10->_nodeRealName = &v14->isa;

        v16 = SFNodeCopyContactIdentifiers((uint64_t)v11);
        nodeContactIdentifiers = v10->_nodeContactIdentifiers;
        v10->_nodeContactIdentifiers = (NSSet *)v16;

        v18 = SFNodeCopyContactIdentifier((uint64_t)v11);
        nodeContactIdentifier = v10->_nodeContactIdentifier;
        v10->_nodeContactIdentifier = &v18->isa;

      }
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FileIcon"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SmallFileIcon"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        TransferDataWithCGImage = createTransferDataWithCGImage((uint64_t)v20);
        transferFileIcon = v10->_transferFileIcon;
        v10->_transferFileIcon = (NSData *)TransferDataWithCGImage;
      }
      else
      {
        transferFileIcon = v10->_transferFileIcon;
        v10->_transferFileIcon = 0;
      }

      if (v21)
      {
        v24 = createTransferDataWithCGImage((uint64_t)v21);
        transferSmallFileIcon = v10->_transferSmallFileIcon;
        v10->_transferSmallFileIcon = (NSData *)v24;
      }
      else
      {
        transferSmallFileIcon = v10->_transferSmallFileIcon;
        v10->_transferSmallFileIcon = 0;
      }

      objc_storeStrong((id *)&v10->_initialInfo, a4);
    }
    v26 = v10;
  }

  return v10;
}

- (SFAirDropTransferTestingSnapshot)initWithCoder:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  uint64_t v34;
  void *v35;
  id v36;
  objc_super v38;
  _QWORD v39[2];
  _QWORD v40[7];

  v40[6] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)SFAirDropTransferTestingSnapshot;
  v5 = -[SFAirDropTransferTestingSnapshot init](&v38, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transfer"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v6;

    v8 = (void *)MEMORY[0x1E0C99E60];
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    v40[2] = objc_opt_class();
    v40[3] = objc_opt_class();
    v40[4] = objc_opt_class();
    v40[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setWithArray:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("initialInfo"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)*((_QWORD *)v5 + 2);
    *((_QWORD *)v5 + 2) = v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nodeDisplayName"));
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v5 + 3);
    *((_QWORD *)v5 + 3) = v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nodeRealName"));
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nodeIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)*((_QWORD *)v5 + 5);
    *((_QWORD *)v5 + 5) = v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nodeContactIdentifier"));
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)*((_QWORD *)v5 + 7);
    *((_QWORD *)v5 + 7) = v19;

    v21 = (void *)MEMORY[0x1E0C99E60];
    v39[0] = objc_opt_class();
    v39[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setWithArray:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("nodeContactIdentifiers"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = (void *)*((_QWORD *)v5 + 6);
    *((_QWORD *)v5 + 6) = v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferFileIcon"));
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)*((_QWORD *)v5 + 8);
    *((_QWORD *)v5 + 8) = v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("transferSmallFileIcon"));
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)*((_QWORD *)v5 + 9);
    *((_QWORD *)v5 + 9) = v28;

    v30 = (void *)*((_QWORD *)v5 + 2);
    if (v30)
    {
      v31 = (void *)objc_msgSend(v30, "mutableCopy");
      v32 = (const __CFString *)*((_QWORD *)v5 + 3);
      if (v32)
      {
        v33 = (const __CFString *)*((_QWORD *)v5 + 4);
        if (v33)
        {
          v34 = SFNodeCreate(*MEMORY[0x1E0C9AE00], v32, v33);
          SFNodeSetContactIdentifier(v34, *((const __CFString **)v5 + 7));
          SFNodeSetContactIdentifiers(v34, *((const __CFSet **)v5 + 6));
          objc_msgSend(v31, "setObject:forKeyedSubscript:", v34, CFSTR("SenderNode"));
        }
      }
      if (*((_QWORD *)v5 + 8))
        objc_msgSend(v31, "setObject:forKeyedSubscript:", createTransferCGImageWithData(), CFSTR("FileIcon"));
      if (*((_QWORD *)v5 + 9))
        objc_msgSend(v31, "setObject:forKeyedSubscript:", createTransferCGImageWithData(), CFSTR("SmallFileIcon"));
      v35 = (void *)*((_QWORD *)v5 + 2);
      *((_QWORD *)v5 + 2) = v31;

    }
    v36 = v5;
  }

  return (SFAirDropTransferTestingSnapshot *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *initialInfo;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", self->_transfer, CFSTR("transfer"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nodeDisplayName, CFSTR("nodeDisplayName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nodeRealName, CFSTR("nodeRealName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nodeIdentifier, CFSTR("nodeIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nodeContactIdentifier, CFSTR("nodeContactIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_nodeContactIdentifiers, CFSTR("nodeContactIdentifiers"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_transferFileIcon, CFSTR("transferFileIcon"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_transferSmallFileIcon, CFSTR("transferSmallFileIcon"));
  initialInfo = self->_initialInfo;
  if (initialInfo)
  {
    v5 = (void *)-[NSDictionary mutableCopy](initialInfo, "mutableCopy");
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("SenderNode"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("FileIcon"));
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, CFSTR("SmallFileIcon"));
    objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("initialInfo"));

  }
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "writeToURL:options:error:", v6, 1, a4);
  else
    v9 = 0;

  return v9;
}

- (SFAirDropTransfer)transfer
{
  return self->_transfer;
}

- (void)setTransfer:(id)a3
{
  objc_storeStrong((id *)&self->_transfer, a3);
}

- (NSDictionary)initialInfo
{
  return self->_initialInfo;
}

- (void)setInitialInfo:(id)a3
{
  objc_storeStrong((id *)&self->_initialInfo, a3);
}

- (NSString)nodeDisplayName
{
  return self->_nodeDisplayName;
}

- (void)setNodeDisplayName:(id)a3
{
  objc_storeStrong((id *)&self->_nodeDisplayName, a3);
}

- (NSString)nodeRealName
{
  return self->_nodeRealName;
}

- (void)setNodeRealName:(id)a3
{
  objc_storeStrong((id *)&self->_nodeRealName, a3);
}

- (NSString)nodeIdentifier
{
  return self->_nodeIdentifier;
}

- (void)setNodeIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_nodeIdentifier, a3);
}

- (NSSet)nodeContactIdentifiers
{
  return self->_nodeContactIdentifiers;
}

- (void)setNodeContactIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_nodeContactIdentifiers, a3);
}

- (NSString)nodeContactIdentifier
{
  return self->_nodeContactIdentifier;
}

- (void)setNodeContactIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_nodeContactIdentifier, a3);
}

- (NSData)transferFileIcon
{
  return self->_transferFileIcon;
}

- (void)setTransferFileIcon:(id)a3
{
  objc_storeStrong((id *)&self->_transferFileIcon, a3);
}

- (NSData)transferSmallFileIcon
{
  return self->_transferSmallFileIcon;
}

- (void)setTransferSmallFileIcon:(id)a3
{
  objc_storeStrong((id *)&self->_transferSmallFileIcon, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferSmallFileIcon, 0);
  objc_storeStrong((id *)&self->_transferFileIcon, 0);
  objc_storeStrong((id *)&self->_nodeContactIdentifier, 0);
  objc_storeStrong((id *)&self->_nodeContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
  objc_storeStrong((id *)&self->_nodeRealName, 0);
  objc_storeStrong((id *)&self->_nodeDisplayName, 0);
  objc_storeStrong((id *)&self->_initialInfo, 0);
  objc_storeStrong((id *)&self->_transfer, 0);
}

@end
