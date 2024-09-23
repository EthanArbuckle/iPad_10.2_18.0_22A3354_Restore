@implementation SMContact

- (SMContact)initWithIdentifier:(id)a3 sessionID:(id)a4 allowReadToken:(id)a5 safetyCacheKey:(id)a6 syncDate:(id)a7 sharingInvitationData:(id)a8 shareURL:(id)a9 participantID:(id)a10
{
  id v17;
  SMContact *v18;
  id *p_isa;
  SMContact *v20;
  NSObject *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  objc_super v30;
  uint8_t buf[16];

  v17 = a3;
  v29 = a4;
  v28 = a5;
  v27 = a6;
  v26 = a7;
  v25 = a8;
  v24 = a9;
  v23 = a10;
  if (v17)
  {
    v30.receiver = self;
    v30.super_class = (Class)SMContact;
    v18 = -[SMContact init](&v30, sel_init);
    p_isa = (id *)&v18->super.isa;
    if (v18)
    {
      objc_storeStrong((id *)&v18->_identifier, a3);
      objc_storeStrong(p_isa + 2, a4);
      objc_storeStrong(p_isa + 3, a5);
      objc_storeStrong(p_isa + 4, a6);
      objc_storeStrong(p_isa + 5, a7);
      objc_storeStrong(p_isa + 6, a8);
      objc_storeStrong(p_isa + 7, a9);
      objc_storeStrong(p_isa + 8, a10);
    }
    self = p_isa;
    v20 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_245521000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: identifier", buf, 2u);
    }

    v20 = 0;
  }

  return v20;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSUUID)sessionUUID
{
  return self->_sessionUUID;
}

- (void)setSessionUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)allowReadToken
{
  return self->_allowReadToken;
}

- (void)setAllowReadToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)safetyCacheKey
{
  return self->_safetyCacheKey;
}

- (void)setSafetyCacheKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)syncDate
{
  return self->_syncDate;
}

- (void)setSyncDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)sharingInvitationData
{
  return self->_sharingInvitationData;
}

- (void)setSharingInvitationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSURL)shareURL
{
  return self->_shareURL;
}

- (void)setShareURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantID, 0);
  objc_storeStrong((id *)&self->_shareURL, 0);
  objc_storeStrong((id *)&self->_sharingInvitationData, 0);
  objc_storeStrong((id *)&self->_syncDate, 0);
  objc_storeStrong((id *)&self->_safetyCacheKey, 0);
  objc_storeStrong((id *)&self->_allowReadToken, 0);
  objc_storeStrong((id *)&self->_sessionUUID, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
