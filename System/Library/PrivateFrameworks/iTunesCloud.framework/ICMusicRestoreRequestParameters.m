@implementation ICMusicRestoreRequestParameters

- (ICMusicRestoreRequestParameters)initWithItemID:(id)a3 title:(id)a4 storeFrontID:(id)a5 mediaKind:(id)a6 accountID:(id)a7 matchStatus:(id)a8 flavor:(id)a9
{
  id v16;
  id v17;
  ICMusicRestoreRequestParameters *v18;
  ICMusicRestoreRequestParameters *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)ICMusicRestoreRequestParameters;
  v18 = -[ICMusicRestoreRequestParameters init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_adamID, a3);
    objc_storeStrong((id *)&v19->_title, a4);
    objc_storeStrong((id *)&v19->_storeFrontID, a5);
    objc_storeStrong((id *)&v19->_mediaKind, a6);
    objc_storeStrong((id *)&v19->_accountID, a7);
    objc_storeStrong((id *)&v19->_matchStatus, a8);
    objc_storeStrong((id *)&v19->_flavor, a9);
  }

  return v19;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (NSNumber)accountID
{
  return self->_accountID;
}

- (NSNumber)matchStatus
{
  return self->_matchStatus;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)storeFrontID
{
  return self->_storeFrontID;
}

- (NSString)mediaKind
{
  return self->_mediaKind;
}

- (NSString)flavor
{
  return self->_flavor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flavor, 0);
  objc_storeStrong((id *)&self->_mediaKind, 0);
  objc_storeStrong((id *)&self->_storeFrontID, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_matchStatus, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end
