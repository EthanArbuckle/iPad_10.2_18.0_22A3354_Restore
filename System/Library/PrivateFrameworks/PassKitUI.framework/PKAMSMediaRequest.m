@implementation PKAMSMediaRequest

- (PKAMSMediaRequest)init
{

  return 0;
}

- (id)_initWithType:(unint64_t)a3 artworkConfiguration:(id)a4
{
  id v7;
  PKAMSMediaRequest *v8;
  PKAMSMediaRequest *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKAMSMediaRequest;
  v8 = -[PKAMSMediaRequest init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_artworkConfiguration, a4);
  }

  return v9;
}

- (PKAMSMediaRequestMusicItem)musicRequest
{
  if (self->_type > 2)
    return (PKAMSMediaRequestMusicItem *)0;
  else
    return (PKAMSMediaRequestMusicItem *)self;
}

- (unint64_t)type
{
  return self->_type;
}

- (PKAMSMediaRequestArtworkConfiguration)artworkConfiguration
{
  return self->_artworkConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkConfiguration, 0);
}

@end
