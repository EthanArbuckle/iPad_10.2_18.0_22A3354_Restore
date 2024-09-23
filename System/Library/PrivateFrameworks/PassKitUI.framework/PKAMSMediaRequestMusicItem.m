@implementation PKAMSMediaRequestMusicItem

- (PKAMSMediaRequestMusicItem)initWithType:(unint64_t)a3 musicIDs:(id)a4 artworkConfiguration:(id)a5
{
  id v9;
  id v10;
  id *v11;
  id *v12;
  PKAMSMediaRequestMusicItem *v13;
  objc_super v15;

  v9 = a4;
  v10 = a5;
  if (v9 && objc_msgSend(v9, "count"))
  {
    v15.receiver = self;
    v15.super_class = (Class)PKAMSMediaRequestMusicItem;
    v11 = -[PKAMSMediaRequest _initWithType:artworkConfiguration:](&v15, sel__initWithType_artworkConfiguration_, a3, v10);
    v12 = v11;
    if (v11)
      objc_storeStrong(v11 + 3, a4);
    self = v12;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (NSArray)musicIDs
{
  return self->_musicIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicIDs, 0);
}

@end
