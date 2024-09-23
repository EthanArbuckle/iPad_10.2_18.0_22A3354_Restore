@implementation PXSampleInboxModel

+ (NSDate)oldDate
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setDay:", 1);
  objc_msgSend(v2, "setMonth:", 1);
  objc_msgSend(v2, "setYear:", 2018);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateFromComponents:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v4;
}

- (NSArray)leftPreviewItems
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)assetsForOneUp
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (int64_t)inboxModelType
{
  return self->_inboxModelType;
}

- (NSString)inboxModelTitle
{
  return self->_inboxModelTitle;
}

- (void)setInboxModelTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)assetsCount
{
  return self->_assetsCount;
}

- (void)setAssetsCount:(unint64_t)a3
{
  self->_assetsCount = a3;
}

- (NSArray)senderNames
{
  return self->_senderNames;
}

- (void)setSenderNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)userIsSender
{
  return self->_userIsSender;
}

- (void)setUserIsSender:(BOOL)a3
{
  self->_userIsSender = a3;
}

- (BOOL)isSeen
{
  return self->_seen;
}

- (void)setSeen:(BOOL)a3
{
  self->_seen = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsForOneUp, 0);
  objc_storeStrong((id *)&self->_senderNames, 0);
  objc_storeStrong((id *)&self->_inboxModelTitle, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
