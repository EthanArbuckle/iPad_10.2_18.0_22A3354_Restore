@implementation PKMutableJobState

- (PKMutableJobState)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKMutableJobState;
  return -[PKMutableJobState init](&v3, sel_init);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  id v4;
  BOOL v5;
  void *v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  id v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v14 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  if (v3)
    v5 = v4 == 0;
  else
    v5 = 0;
  if (v5)
  {
    v13 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v13);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v13;
    v6 = v8;
    if (v7)
      v9 = v8 == 0;
    else
      v9 = 0;
    if (v9)
    {
      v7 = v7;
      v11 = v7;
      goto LABEL_16;
    }
    _PKLogCategory(PKLogCategoryFramework);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_220F9A000, v10, OS_LOG_TYPE_ERROR, "couldn't create from archive: %@", buf, 0xCu);
    }

  }
  else
  {
    v6 = v4;
    _PKLogCategory(PKLogCategoryFramework);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v6;
      _os_log_impl(&dword_220F9A000, v7, OS_LOG_TYPE_ERROR, "couldn't create archive: %@", buf, 0xCu);
    }
  }
  v11 = 0;
LABEL_16:

  return v11;
}

- (PKMutableJobState)initWithCoder:(id)a3
{
  id v4;
  PKMutableJobState *v5;
  PKMutableJobState *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKMutableJobState;
  v5 = -[PKMutableJobState init](&v8, sel_init);
  v6 = v5;
  if (v5)
    DecodeVisitor::visitProperties(v5, v4);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  EncodeVisitor::visitProperties(self, a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)userCodableDictionary
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__PKMutableJobState_userCodableDictionary__block_invoke;
  v6[3] = &unk_24E6CD670;
  v4 = v3;
  v7 = v4;
  UserCodedSerializationVisitor::visitProperties(self, (uint64_t)v6);

  return v4;
}

void __42__PKMutableJobState_userCodableDictionary__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  void *v8;
  id v9;

  v9 = a2;
  (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, *a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

}

- (PKMutableJobState)initWithUserCodableDictionary:(id)a3
{
  id v4;
  PKMutableJobState *v5;
  _QWORD v7[4];
  id v8;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKMutableJobState;
  v5 = -[PKMutableJobState init](&v9, sel_init);
  if (v5)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__PKMutableJobState_initWithUserCodableDictionary___block_invoke;
    v7[3] = &unk_24E6CD670;
    v8 = v4;
    UserCodedSerializationVisitor::visitProperties(v5, (uint64_t)v7);

  }
  return v5;
}

void __51__PKMutableJobState_initWithUserCodableDictionary___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void **a5)
{
  void (**v8)(id, void *);
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *a5;
    *a5 = (void *)v11;

  }
}

- (void)visitProperties:(Visitor *)a3
{
  int64_t printerKind;

  (*((void (**)(Visitor *, SEL))a3->var0 + 2))(a3, a2);
  (*((void (**)(Visitor *, const __CFString *, int64_t *))a3->var0 + 5))(a3, CFSTR("localJobID"), &self->_localJobID);
  (*((void (**)(Visitor *, const __CFString *, NSData **))a3->var0 + 9))(a3, CFSTR("printerEndpointData"), &self->_printerEndpointData);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("printerDisplayName"), &self->_printerDisplayName);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("printerLocation"), &self->_printerLocation);
  printerKind = self->_printerKind;
  (*((void (**)(Visitor *, const __CFString *, int64_t *))a3->var0 + 5))(a3, CFSTR("printerKind"), &printerKind);
  self->_printerKind = printerKind;
  (*((void (**)(Visitor *, const __CFString *, PKPrintSettings **))a3->var0 + 21))(a3, CFSTR("settings"), &self->_settings);
  (*((void (**)(Visitor *, const __CFString *, NSDate **))a3->var0 + 11))(a3, CFSTR("timeAtCreation"), &self->_timeAtCreation);
  printerKind = self->_state;
  (*((void (**)(Visitor *, const __CFString *, int64_t *))a3->var0 + 5))(a3, CFSTR("state"), &printerKind);
  self->_state = printerKind;
  (*((void (**)(Visitor *, const __CFString *, int64_t *))a3->var0 + 5))(a3, CFSTR("mediaSheetsCompleted"), &self->_mediaSheetsCompleted);
  (*((void (**)(Visitor *, const __CFString *, NSDate **))a3->var0 + 11))(a3, CFSTR("timeAtProcessing"), &self->_timeAtProcessing);
  (*((void (**)(Visitor *, const __CFString *, NSDate **))a3->var0 + 11))(a3, CFSTR("timeAtCompleted"), &self->_timeAtCompleted);
  (*((void (**)(Visitor *, const __CFString *, int64_t *))a3->var0 + 5))(a3, CFSTR("mediaSheets"), &self->_mediaSheets);
  (*((void (**)(Visitor *, const __CFString *, int64_t *))a3->var0 + 5))(a3, CFSTR("mediaProgress"), &self->_mediaProgress);
  (*((void (**)(Visitor *, const __CFString *, int64_t *))a3->var0 + 5))(a3, CFSTR("remoteJobId"), &self->_remoteJobId);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("PIN"), &self->_PIN);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("jobPrinterStateMessage"), &self->_jobPrinterStateMessage);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 15))(a3, CFSTR("jobPrinterStateReasons"), &self->_jobPrinterStateReasons);
  (*((void (**)(Visitor *, const __CFString *, NSString **))a3->var0 + 7))(a3, CFSTR("jobStateMessage"), &self->_jobStateMessage);
  (*((void (**)(Visitor *, const __CFString *, NSArray **))a3->var0 + 15))(a3, CFSTR("jobStateReasons"), &self->_jobStateReasons);
  (*((void (**)(Visitor *, const __CFString *, NSData **))a3->var0 + 9))(a3, CFSTR("thumbnailImage"), &self->_thumbnailImage);
  (*((void (**)(Visitor *))a3->var0 + 24))(a3);
}

- (int64_t)localJobID
{
  return self->_localJobID;
}

- (void)setLocalJobID:(int64_t)a3
{
  self->_localJobID = a3;
}

- (NSData)printerEndpointData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPrinterEndpointData:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)printerDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrinterDisplayName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)printerLocation
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrinterLocation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (int64_t)printerKind
{
  return self->_printerKind;
}

- (void)setPrinterKind:(int64_t)a3
{
  self->_printerKind = a3;
}

- (PKPrintSettings)settings
{
  return (PKPrintSettings *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSettings:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSDate)timeAtCreation
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTimeAtCreation:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)mediaSheetsCompleted
{
  return self->_mediaSheetsCompleted;
}

- (void)setMediaSheetsCompleted:(int64_t)a3
{
  self->_mediaSheetsCompleted = a3;
}

- (NSDate)timeAtProcessing
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

- (void)setTimeAtProcessing:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (NSDate)timeAtCompleted
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setTimeAtCompleted:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (int64_t)mediaSheets
{
  return self->_mediaSheets;
}

- (void)setMediaSheets:(int64_t)a3
{
  self->_mediaSheets = a3;
}

- (int64_t)mediaProgress
{
  return self->_mediaProgress;
}

- (void)setMediaProgress:(int64_t)a3
{
  self->_mediaProgress = a3;
}

- (int64_t)remoteJobId
{
  return self->_remoteJobId;
}

- (void)setRemoteJobId:(int64_t)a3
{
  self->_remoteJobId = a3;
}

- (NSString)PIN
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPIN:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (NSString)jobPrinterStateMessage
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setJobPrinterStateMessage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 128);
}

- (NSArray)jobPrinterStateReasons
{
  return (NSArray *)objc_getProperty(self, a2, 136, 1);
}

- (void)setJobPrinterStateReasons:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 136);
}

- (NSString)jobStateMessage
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (void)setJobStateMessage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 144);
}

- (NSArray)jobStateReasons
{
  return (NSArray *)objc_getProperty(self, a2, 152, 1);
}

- (void)setJobStateReasons:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 152);
}

- (NSData)thumbnailImage
{
  return (NSData *)objc_getProperty(self, a2, 160, 1);
}

- (void)setThumbnailImage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_jobStateReasons, 0);
  objc_storeStrong((id *)&self->_jobStateMessage, 0);
  objc_storeStrong((id *)&self->_jobPrinterStateReasons, 0);
  objc_storeStrong((id *)&self->_jobPrinterStateMessage, 0);
  objc_storeStrong((id *)&self->_PIN, 0);
  objc_storeStrong((id *)&self->_timeAtCompleted, 0);
  objc_storeStrong((id *)&self->_timeAtProcessing, 0);
  objc_storeStrong((id *)&self->_timeAtCreation, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_printerLocation, 0);
  objc_storeStrong((id *)&self->_printerDisplayName, 0);
  objc_storeStrong((id *)&self->_printerEndpointData, 0);
}

@end
