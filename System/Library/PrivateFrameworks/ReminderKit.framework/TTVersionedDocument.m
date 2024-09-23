@implementation TTVersionedDocument

+ (unsigned)serializationVersion
{
  return 0;
}

+ (unsigned)minimumSupportedVersion
{
  return 0;
}

+ (unsigned)versionedDocumentSerializationVersion
{
  return 0;
}

- (TTVersionedDocument)initWithData:(id)a3
{
  id v4;
  TTVersionedDocument *v5;
  TTVersionedDocument *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TTVersionedDocument;
  v5 = -[TTVersionedDocument init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[TTVersionedDocument loadData:](v5, "loadData:", v4);

  return v6;
}

- (TTVersionedDocument)initWithArchive:(const void *)a3
{
  TTVersionedDocument *v4;
  TTVersionedDocument *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TTVersionedDocument;
  v4 = -[TTVersionedDocument init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[TTVersionedDocument loadArchive:](v4, "loadArchive:", a3);
  return v5;
}

- (void)loadData:(id)a3
{
  id v4;
  versioned_document::Document *v5;
  double v6;
  void *v7;
  void *v8;
  google::protobuf::MessageLite *v9;
  id v10;
  char *v11;
  int v12;
  _DWORD *documentArchive;
  int v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t v23[24];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (versioned_document::Document *)operator new();
  v6 = versioned_document::Document::Document(v5);
  self->_documentArchive = v5;
  if (v4)
  {
    objc_msgSend(v4, "TT_gzipInflate", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7
      && (v9 = (google::protobuf::MessageLite *)self->_documentArchive,
          v10 = objc_retainAutorelease(v7),
          v11 = (char *)objc_msgSend(v10, "bytes"),
          v12 = TTBoundedCheckedCastNSUIntegerToUInt32(objc_msgSend(v10, "length")),
          google::protobuf::MessageLite::ParseFromArray(v9, v11, v12)))
    {
      documentArchive = self->_documentArchive;
      if ((documentArchive[8] & 1) != 0)
      {
        v14 = documentArchive[16];
        if (v14 == +[TTVersionedDocument versionedDocumentSerializationVersion](TTVersionedDocument, "versionedDocumentSerializationVersion"))
        {
          -[TTVersionedDocument loadDocumentArchive:](self, "loadDocumentArchive:", self->_documentArchive);
LABEL_12:

          goto LABEL_13;
        }
      }
      +[REMLog crdt](REMLog, "crdt");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[TTVersionedDocument loadData:].cold.2(v23, *((_DWORD *)self->_documentArchive + 16), +[TTVersionedDocument versionedDocumentSerializationVersion](TTVersionedDocument, "versionedDocumentSerializationVersion"), v15);
    }
    else
    {
      +[REMLog crdt](REMLog, "crdt");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[TTVersionedDocument loadData:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);
    }

    goto LABEL_12;
  }
LABEL_13:

}

- (void)loadArchive:(const void *)documentArchive
{
  int32x2_t *v5;
  __n128 v6;
  int32x2_t *v7;
  uint64_t v8;
  uint64_t v9;

  v5 = (int32x2_t *)operator new();
  v6.n128_f64[0] = versioned_document::Document::Document((versioned_document::Document *)v5);
  self->_documentArchive = v5;
  if (v5 != documentArchive)
  {
    v7 = (int32x2_t *)((char *)documentArchive + 40);
    if (v5[6].i32[0] >= 1)
    {
      v8 = 0;
      do
      {
        v9 = *(_QWORD *)(*(_QWORD *)&v5[5] + 8 * v8);
        (*(void (**)(uint64_t, __n128))(*(_QWORD *)v9 + 32))(v9, v6);
        ++v8;
      }
      while (v8 < v5[6].i32[0]);
    }
    v5[6].i32[0] = 0;
    google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>(v5 + 5, v7);
    documentArchive = self->_documentArchive;
  }
  -[TTVersionedDocument loadDocumentArchive:](self, "loadDocumentArchive:", documentArchive);
}

- (void)loadDocumentArchive:(void *)a3
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  int v10;
  const versioned_document::Version *v11;
  __int128 v13;
  const versioned_document::Version *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  const char *v18;
  uint32_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  _BYTE v37[40];
  unsigned int v38;
  unsigned int v39;
  uint8_t buf[4];
  unsigned int v41;
  __int16 v42;
  unsigned int v43;
  __int16 v44;
  unsigned int v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_opt_class(), "serializationVersion");
  v6 = *((_DWORD *)a3 + 12);
  if (!v6)
  {
    v10 = -1;
    goto LABEL_32;
  }
  v7 = v5;
  v8 = 0;
  v9 = -1;
  v10 = -1;
  do
  {
    v11 = (const versioned_document::Version *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((uint64_t)a3 + 40, v8);
    versioned_document::Version::Version((versioned_document::Version *)v37, v11);
    if (v10 < 0 && v38 <= v7)
      v10 = v8;
    if (v38 < v7)
    {
      if (v9 < 0)
        v9 = v8;
      versioned_document::Version::~Version((versioned_document::Version *)v37);
      if ((v9 & 0x80000000) == 0)
        goto LABEL_18;
LABEL_32:
      +[REMLog crdt](REMLog, "crdt");
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[TTVersionedDocument loadDocumentArchive:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

      goto LABEL_35;
    }
    if (v39 <= v7)
      v9 = v8;
    versioned_document::Version::~Version((versioned_document::Version *)v37);
    ++v8;
  }
  while (v6 != v8);
  if (v9 < 0)
    goto LABEL_32;
LABEL_18:
  if (v9 >= v6)
  {
LABEL_35:
    if (v10 < 0)
      return;
    goto LABEL_36;
  }
  *(_QWORD *)&v13 = 67109632;
  v36 = v13;
  while (1)
  {
    v14 = (const versioned_document::Version *)google::protobuf::internal::RepeatedPtrFieldBase::Get<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((uint64_t)a3 + 40, v9);
    versioned_document::Version::Version((versioned_document::Version *)v37, v14);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v36);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v38 < v7)
    {
      +[REMLog crdt](REMLog, "crdt");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109376;
        v41 = v38;
        v42 = 1024;
        v43 = v7;
        v17 = v16;
        v18 = "Loading old version %d < %d";
        v19 = 14;
LABEL_29:
        _os_log_debug_impl(&dword_1B4A39000, v17, OS_LOG_TYPE_DEBUG, v18, buf, v19);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
    if (v38 != v7)
      break;
    +[REMLog crdt](REMLog, "crdt");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 67109120;
      v41 = v7;
      v17 = v16;
      v18 = "Loading current version %d";
      v19 = 8;
      goto LABEL_29;
    }
LABEL_30:

    -[TTVersionedDocument mergeVersion:fromData:](self, "mergeVersion:fromData:", v38, v15);
    versioned_document::Version::~Version((versioned_document::Version *)v37);
    if (v6 == ++v9)
      goto LABEL_35;
  }
  if (v39 <= v7)
  {
    +[REMLog crdt](REMLog, "crdt");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = v36;
      v41 = v38;
      v42 = 1024;
      v43 = v7;
      v44 = 1024;
      v45 = v39;
      v17 = v16;
      v18 = "Loading future version %d > %d where min-supported %d";
      v19 = 20;
      goto LABEL_29;
    }
    goto LABEL_30;
  }
  +[REMLog crdt](REMLog, "crdt");
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    -[TTVersionedDocument loadDocumentArchive:].cold.2(v28, v29, v30, v31, v32, v33, v34, v35);

  versioned_document::Version::~Version((versioned_document::Version *)v37);
  if ((v10 & 0x80000000) == 0)
LABEL_36:
    google::protobuf::RepeatedPtrField<versioned_document::Version>::DeleteSubrange((google::protobuf::internal::RepeatedPtrFieldBase *)((char *)a3 + 40), v10, *((_DWORD *)a3 + 12) - v10);
}

- (void)dealloc
{
  void *documentArchive;
  objc_super v4;

  documentArchive = self->_documentArchive;
  if (documentArchive)
    (*(void (**)(void *, SEL))(*(_QWORD *)documentArchive + 8))(documentArchive, a2);
  v4.receiver = self;
  v4.super_class = (Class)TTVersionedDocument;
  -[TTVersionedDocument dealloc](&v4, sel_dealloc);
}

- (unint64_t)futureVersionCount
{
  return *((int *)self->_documentArchive + 12);
}

- (id)serializeCurrentVersion:(unsigned int *)a3
{
  return 0;
}

- (void)saveCurrentVersion:(void *)a3
{
  int v5;
  void *v6;
  int v7;
  id v8;
  _QWORD *v9;
  int v10;

  v5 = objc_msgSend((id)objc_opt_class(), "minimumSupportedVersion");
  v10 = 0;
  -[TTVersionedDocument serializeCurrentVersion:](self, "serializeCurrentVersion:", &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  *((_DWORD *)a3 + 8) |= 3u;
  *((_DWORD *)a3 + 10) = v7;
  *((_DWORD *)a3 + 11) = v5;
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  *((_DWORD *)a3 + 8) |= 4u;
  if (!google::protobuf::internal::empty_string_)
    __assert_rtn("GetEmptyStringAlreadyInited", "generated_message_util.h", 80, "empty_string_ != NULL");
  if (*((_QWORD *)a3 + 6) == google::protobuf::internal::empty_string_)
  {
    v9 = (_QWORD *)operator new();
    *v9 = 0;
    v9[1] = 0;
    v9[2] = 0;
    *((_QWORD *)a3 + 6) = v9;
  }
  MEMORY[0x1B5E3DB34]();

}

- (unint64_t)mergeWithVersionedDocument:(id)a3
{
  id v4;
  int32x2_t *v5;
  int32x2_t *v6;
  uint64_t v7;

  v4 = a3;
  v5 = -[TTVersionedDocument documentArchive](self, "documentArchive");
  v6 = (int32x2_t *)objc_msgSend(v4, "documentArchive");
  if (v6 != v5)
  {
    if (v5[6].i32[0] >= 1)
    {
      v7 = 0;
      do
      {
        (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)&v5[5] + 8 * v7) + 32))(*(_QWORD *)(*(_QWORD *)&v5[5] + 8 * v7));
        ++v7;
      }
      while (v7 < v5[6].i32[0]);
    }
    v5[6].i32[0] = 0;
    google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>(v5 + 5, v6 + 5);
  }

  return 1;
}

- (unsigned)maxDocumentVersion
{
  int *v3;
  std::string *v4;
  char v6;
  std::string v7[2];

  if (*(int *)(-[TTVersionedDocument documentArchive](self, "documentArchive") + 48) < 1)
    return objc_msgSend((id)objc_opt_class(), "serializationVersion");
  v3 = -[TTVersionedDocument documentArchive](self, "documentArchive");
  if (v3[12] <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v7, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ReminderKit/CRProtobuf/protobuf-lite/google/protobuf/repeated_field.h", 886);
    v4 = google::protobuf::internal::LogMessage::operator<<(v7, "CHECK failed: (index) < (size()): ");
    google::protobuf::internal::LogFinisher::operator=((uint64_t)&v6, (google::protobuf::internal::LogMessage *)v4);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v7[0].__r_.__value_.__l.__data_);
  }
  return *(_DWORD *)(**((_QWORD **)v3 + 5) + 40);
}

- (id)serialize
{
  NSObject *v3;
  int v4;
  _DWORD *v5;
  unsigned int v6;
  int *v7;
  int32x2_t *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  versioned_document::Version *v12;
  int32x2_t v13;
  int32x2_t v14;
  id v15;
  void *v16;
  void *v17;
  google::protobuf::MessageLite *v18;
  id v19;
  _DWORD *v20;
  int v21;
  std::string *v22;
  uint64_t v23;
  int v24;
  void *v25;
  char v27;
  std::string v28[2];
  char v29[24];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  +[REMLog crdt](REMLog, "crdt");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_msgSend((id)objc_opt_class(), "serializationVersion");
    -[TTVersionedDocument serialize].cold.1((uint64_t)-[TTVersionedDocument documentArchive](self, "documentArchive"), (uint64_t)v29, v4);
  }

  v5 = -[TTVersionedDocument documentArchive](self, "documentArchive");
  v6 = +[TTVersionedDocument versionedDocumentSerializationVersion](TTVersionedDocument, "versionedDocumentSerializationVersion");
  v5[8] |= 1u;
  v5[16] = v6;
  v7 = -[TTVersionedDocument documentArchive](self, "documentArchive");
  v8 = (int32x2_t *)v7;
  v9 = v7[13];
  v10 = v7[12];
  if ((int)v10 >= v9)
  {
    if (v9 == v7[14])
      google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v7 + 10, v9 + 1);
    v12 = google::protobuf::internal::GenericTypeHandler<versioned_document::Version>::New();
    v13 = v8[5];
    v14 = v8[6];
    v8[6] = vadd_s32(v14, (int32x2_t)0x100000001);
    *(_QWORD *)(*(_QWORD *)&v13 + 8 * v14.i32[0]) = v12;
  }
  else
  {
    v11 = *((_QWORD *)v7 + 5);
    v7[12] = v10 + 1;
    v12 = *(versioned_document::Version **)(v11 + 8 * v10);
  }
  -[TTVersionedDocument saveCurrentVersion:](self, "saveCurrentVersion:", v12);
  v15 = objc_alloc(MEMORY[0x1E0C99DF0]);
  v16 = -[TTVersionedDocument documentArchive](self, "documentArchive");
  v17 = (void *)objc_msgSend(v15, "initWithLength:", (*(int (**)(void *))(*(_QWORD *)v16 + 72))(v16));
  v18 = -[TTVersionedDocument documentArchive](self, "documentArchive");
  v19 = objc_retainAutorelease(v17);
  google::protobuf::MessageLite::SerializeToArray(v18, (void *)objc_msgSend(v19, "mutableBytes"), objc_msgSend(v19, "length"));
  v20 = -[TTVersionedDocument documentArchive](self, "documentArchive");
  v21 = v20[12];
  if (v21 <= 0)
  {
    google::protobuf::internal::LogMessage::LogMessage((uint64_t)v28, 3, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/ReminderKit/CRProtobuf/protobuf-lite/google/protobuf/repeated_field.h", 913);
    v22 = google::protobuf::internal::LogMessage::operator<<(v28, "CHECK failed: (current_size_) > (0): ");
    google::protobuf::internal::LogFinisher::operator=((uint64_t)&v27, (google::protobuf::internal::LogMessage *)v22);
    google::protobuf::internal::LogMessage::~LogMessage((void **)&v28[0].__r_.__value_.__l.__data_);
    v21 = v20[12];
  }
  v23 = *((_QWORD *)v20 + 5);
  v24 = v21 - 1;
  v20[12] = v24;
  (*(void (**)(_QWORD))(**(_QWORD **)(v23 + 8 * v24) + 32))(*(_QWORD *)(v23 + 8 * v24));
  objc_msgSend(v19, "TT_gzipDeflate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)saveToArchive:(void *)a3
{
  NSObject *v5;
  int v6;
  unsigned int v7;
  int32x2_t *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  versioned_document::Version *v14;
  uint64_t v15;
  int32x2_t v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  +[REMLog crdt](REMLog, "crdt");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = objc_msgSend((id)objc_opt_class(), "serializationVersion");
    -[TTVersionedDocument serialize].cold.1((uint64_t)-[TTVersionedDocument documentArchive](self, "documentArchive"), (uint64_t)v17, v6);
  }

  v7 = +[TTVersionedDocument versionedDocumentSerializationVersion](TTVersionedDocument, "versionedDocumentSerializationVersion");
  *((_DWORD *)a3 + 8) |= 1u;
  *((_DWORD *)a3 + 16) = v7;
  v8 = -[TTVersionedDocument documentArchive](self, "documentArchive");
  if (v8 != a3)
  {
    if (*((int *)a3 + 12) >= 1)
    {
      v9 = 0;
      do
      {
        v10 = *(_QWORD *)(*((_QWORD *)a3 + 5) + 8 * v9);
        (*(void (**)(uint64_t))(*(_QWORD *)v10 + 32))(v10);
        ++v9;
      }
      while (v9 < *((int *)a3 + 12));
    }
    *((_DWORD *)a3 + 12) = 0;
    google::protobuf::internal::RepeatedPtrFieldBase::MergeFrom<google::protobuf::RepeatedPtrField<versioned_document::Version>::TypeHandler>((int32x2_t *)a3 + 5, v8 + 5);
  }
  v11 = *((_DWORD *)a3 + 13);
  v12 = *((int *)a3 + 12);
  if ((int)v12 >= v11)
  {
    if (v11 == *((_DWORD *)a3 + 14))
      google::protobuf::internal::RepeatedPtrFieldBase::Reserve((int *)a3 + 10, v11 + 1);
    v14 = google::protobuf::internal::GenericTypeHandler<versioned_document::Version>::New();
    v15 = *((_QWORD *)a3 + 5);
    v16 = *(int32x2_t *)((char *)a3 + 48);
    *((int32x2_t *)a3 + 6) = vadd_s32(v16, (int32x2_t)0x100000001);
    *(_QWORD *)(v15 + 8 * v16.i32[0]) = v14;
  }
  else
  {
    v13 = *((_QWORD *)a3 + 5);
    *((_DWORD *)a3 + 12) = v12 + 1;
    v14 = *(versioned_document::Version **)(v13 + 8 * v12);
  }
  -[TTVersionedDocument saveCurrentVersion:](self, "saveCurrentVersion:", v14);
}

- (void)documentArchive
{
  return self->_documentArchive;
}

- (void)setDocumentArchive:(void *)a3
{
  self->_documentArchive = a3;
}

- (void)loadData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "TTVersionedDocument gzipped protobuf corrupt.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)loadData:(int)a3 .cold.2(uint8_t *buf, int a2, int a3, os_log_t log)
{
  *(_DWORD *)buf = 67109376;
  *((_DWORD *)buf + 1) = a2;
  *((_WORD *)buf + 4) = 1024;
  *(_DWORD *)(buf + 10) = a3;
  _os_log_error_impl(&dword_1B4A39000, log, OS_LOG_TYPE_ERROR, "TTVersionedDocument is wrong versionedDocumentSerializationVersion %d != %d.", buf, 0xEu);
}

- (void)loadDocumentArchive:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "TTVersionedDocument did not load any compatible version.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)loadDocumentArchive:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1B4A39000, a1, a3, "Should not attempt to load invalid version.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)serialize
{
  uint8_t *v3;
  NSObject *v4;

  OUTLINED_FUNCTION_1_7(1.5047e-36, a1, a2, a3);
  OUTLINED_FUNCTION_2_6(&dword_1B4A39000, "Saving versioned document %d with %d future versions.", v3, v4);
}

@end
