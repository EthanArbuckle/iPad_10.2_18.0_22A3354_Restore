@implementation WFExtractShortcutResult

- (WFExtractShortcutResult)initWithRecord:(id)a3 fileContentType:(int64_t)a4 sourceApplicationIdentifier:(id)a5 sharedDate:(id)a6
{
  return -[WFExtractShortcutResult initWithRecord:fileContentType:iCloudIdentifier:sourceApplicationIdentifier:sharedDate:](self, "initWithRecord:fileContentType:iCloudIdentifier:sourceApplicationIdentifier:sharedDate:", a3, a4, 0, a5, a6);
}

- (WFExtractShortcutResult)initWithRecord:(id)a3 fileContentType:(int64_t)a4 iCloudIdentifier:(id)a5 sourceApplicationIdentifier:(id)a6 sharedDate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  WFExtractShortcutResult *v17;
  WFExtractShortcutResult *v18;
  uint64_t v19;
  NSString *iCloudIdentifier;
  uint64_t v21;
  NSString *sourceApplicationIdentifier;
  WFExtractShortcutResult *v23;
  objc_super v25;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)WFExtractShortcutResult;
  v17 = -[WFExtractShortcutResult init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_record, a3);
    v18->_fileContentType = a4;
    v19 = objc_msgSend(v14, "copy");
    iCloudIdentifier = v18->_iCloudIdentifier;
    v18->_iCloudIdentifier = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    sourceApplicationIdentifier = v18->_sourceApplicationIdentifier;
    v18->_sourceApplicationIdentifier = (NSString *)v21;

    objc_storeStrong((id *)&v18->_sharedDate, a7);
    v23 = v18;
  }

  return v18;
}

- (WFWorkflowRecord)record
{
  return self->_record;
}

- (int64_t)fileContentType
{
  return self->_fileContentType;
}

- (NSDate)sharedDate
{
  return self->_sharedDate;
}

- (NSString)iCloudIdentifier
{
  return self->_iCloudIdentifier;
}

- (NSString)sourceApplicationIdentifier
{
  return self->_sourceApplicationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceApplicationIdentifier, 0);
  objc_storeStrong((id *)&self->_iCloudIdentifier, 0);
  objc_storeStrong((id *)&self->_sharedDate, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
