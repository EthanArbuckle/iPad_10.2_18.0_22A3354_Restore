@implementation CSHealthWrapMessageConfiguration

- (CSHealthWrapMessageConfiguration)initWithCertificate:(__SecCertificate *)a3 messageUUID:(id)a4 subjectUUID:(id)a5 studyUUID:(id)a6 channel:(id)a7 payloadType:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CSHealthWrapMessageConfiguration *v20;
  NSUUID *v21;
  NSUUID *messageUUID;
  NSUUID *v23;
  NSUUID *subjectUUID;
  NSUUID *v25;
  NSUUID *studyUUID;
  NSString *v27;
  NSString *channel;
  NSString *v29;
  NSString *payloadType;
  void *v32;
  objc_super v33;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (!a3)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CSHealthWrapMessage.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("certificate != NULL"));

  }
  v33.receiver = self;
  v33.super_class = (Class)CSHealthWrapMessageConfiguration;
  v20 = -[CSHealthWrapMessageConfiguration init](&v33, "init");
  if (v20)
  {
    if (v15)
      v21 = (NSUUID *)objc_msgSend(v15, "copy");
    else
      v21 = (NSUUID *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    messageUUID = v20->_messageUUID;
    v20->_messageUUID = v21;

    v23 = (NSUUID *)objc_msgSend(v16, "copy");
    subjectUUID = v20->_subjectUUID;
    v20->_subjectUUID = v23;

    v25 = (NSUUID *)objc_msgSend(v17, "copy");
    studyUUID = v20->_studyUUID;
    v20->_studyUUID = v25;

    v27 = (NSString *)objc_msgSend(v18, "copy");
    channel = v20->_channel;
    v20->_channel = v27;

    v29 = (NSString *)objc_msgSend(v19, "copy");
    payloadType = v20->_payloadType;
    v20->_payloadType = v29;

    CFRetain(a3);
    v20->_certificate = a3;
  }

  return v20;
}

- (void)dealloc
{
  __SecCertificate *certificate;
  objc_super v4;

  certificate = self->_certificate;
  if (certificate)
    CFRelease(certificate);
  v4.receiver = self;
  v4.super_class = (Class)CSHealthWrapMessageConfiguration;
  -[CSHealthWrapMessageConfiguration dealloc](&v4, "dealloc");
}

- (__SecCertificate)certificate
{
  return self->_certificate;
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (void)setMessageUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)subjectUUID
{
  return self->_subjectUUID;
}

- (void)setSubjectUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSUUID)studyUUID
{
  return self->_studyUUID;
}

- (void)setStudyUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
  objc_storeStrong((id *)&self->_applicationData, a3);
}

- (NSDictionary)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setKeyValuePairs:(id)a3
{
  objc_storeStrong((id *)&self->_keyValuePairs, a3);
}

- (BOOL)disableCompression
{
  return self->_disableCompression;
}

- (void)setDisableCompression:(BOOL)a3
{
  self->_disableCompression = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_subjectUUID, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
}

@end
