@implementation WBSettingsTask

+ (id)taskWithType:(int64_t)a3
{
  return -[WBSettingsTask initWithType:websiteDataRecord:profileIdentifier:]([WBSettingsTask alloc], "initWithType:websiteDataRecord:profileIdentifier:", a3, 0, 0);
}

+ (id)taskForDeletingIndividualWebsiteDataWithRecord:(id)a3
{
  id v3;
  WBSettingsTask *v4;

  v3 = a3;
  v4 = -[WBSettingsTask initWithType:websiteDataRecord:profileIdentifier:]([WBSettingsTask alloc], "initWithType:websiteDataRecord:profileIdentifier:", 1, v3, 0);

  return v4;
}

+ (id)taskForDeletingAllWebsiteDataInProfileWithIdentifier:(id)a3
{
  id v3;
  WBSettingsTask *v4;

  v3 = a3;
  v4 = -[WBSettingsTask initWithType:websiteDataRecord:profileIdentifier:]([WBSettingsTask alloc], "initWithType:websiteDataRecord:profileIdentifier:", 0, 0, v3);

  return v4;
}

+ (id)taskForDeletingHistoryAfterDate:(id)a3 beforeDate:(id)a4 forProfileIdentifier:(id)a5 clearAllProfiles:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;
  WBSettingsTask *v12;

  v6 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = -[WBSettingsTask initWithType:afterDate:beforeDate:profileIdentifier:clearAllProfiles:]([WBSettingsTask alloc], "initWithType:afterDate:beforeDate:profileIdentifier:clearAllProfiles:", 4, v11, v10, v9, v6);

  return v12;
}

- (WBSettingsTask)initWithType:(int64_t)a3 websiteDataRecord:(id)a4 profileIdentifier:(id)a5
{
  id v9;
  id v10;
  WBSettingsTask *v11;
  WBSettingsTask *v12;
  WBSettingsTask *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WBSettingsTask;
  v11 = -[WBSettingsTask init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_taskType = a3;
    objc_storeStrong((id *)&v11->_websiteDataRecord, a4);
    objc_storeStrong((id *)&v12->_profileIdentifier, a5);
    v13 = v12;
  }

  return v12;
}

- (WBSettingsTask)initWithType:(int64_t)a3 afterDate:(id)a4 beforeDate:(id)a5 profileIdentifier:(id)a6 clearAllProfiles:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  WBSettingsTask *v16;
  WBSettingsTask *v17;
  WBSettingsTask *v18;
  objc_super v20;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)WBSettingsTask;
  v16 = -[WBSettingsTask init](&v20, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_taskType = a3;
    objc_storeStrong((id *)&v16->_afterDate, a4);
    objc_storeStrong((id *)&v17->_beforeDate, a5);
    objc_storeStrong((id *)&v17->_profileIdentifier, a6);
    v17->_clearAllProfiles = a7;
    v18 = v17;
  }

  return v17;
}

- (int64_t)taskType
{
  return self->_taskType;
}

- (WBWebsiteDataRecord)websiteDataRecord
{
  return self->_websiteDataRecord;
}

- (NSString)profileIdentifier
{
  return self->_profileIdentifier;
}

- (NSDate)afterDate
{
  return self->_afterDate;
}

- (NSDate)beforeDate
{
  return self->_beforeDate;
}

- (BOOL)clearAllProfiles
{
  return self->_clearAllProfiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_beforeDate, 0);
  objc_storeStrong((id *)&self->_afterDate, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_websiteDataRecord, 0);
}

@end
