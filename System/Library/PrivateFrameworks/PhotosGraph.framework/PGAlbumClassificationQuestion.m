@implementation PGAlbumClassificationQuestion

- (PGAlbumClassificationQuestion)initWithAlbumUUID:(id)a3 localFactoryScore:(double)a4
{
  id v7;
  PGAlbumClassificationQuestion *v8;
  PGAlbumClassificationQuestion *v9;
  NSDictionary *additionalInfo;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PGAlbumClassificationQuestion;
  v8 = -[PGAlbumClassificationQuestion init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_entityIdentifier, a3);
    v9->_state = 0;
    v9->_localFactoryScore = a4;
    additionalInfo = v9->_additionalInfo;
    v9->_additionalInfo = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v9;
}

- (unsigned)type
{
  return 24;
}

- (unsigned)displayType
{
  return 8;
}

- (unsigned)entityType
{
  return 6;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (double)localFactoryScore
{
  return self->_localFactoryScore;
}

- (unsigned)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
}

@end
