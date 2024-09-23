@implementation _WBBookmarkSyncDataForPositionDecoding

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WBBookmarkSyncDataForPositionDecoding)initWithCoder:(id)a3
{
  id v4;
  _WBBookmarkSyncDataForPositionDecoding *v5;
  uint64_t v6;
  WBSCRDTPosition *position;
  _WBBookmarkSyncDataForPositionDecoding *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_WBBookmarkSyncDataForPositionDecoding;
  v5 = -[_WBBookmarkSyncDataForPositionDecoding init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Position"));
    v6 = objc_claimAutoreleasedReturnValue();
    position = v5->_position;
    v5->_position = (WBSCRDTPosition *)v6;

    v8 = v5;
  }

  return v5;
}

- (WBSCRDTPosition)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
}

@end
