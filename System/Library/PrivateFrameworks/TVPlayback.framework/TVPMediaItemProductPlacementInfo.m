@implementation TVPMediaItemProductPlacementInfo

- (TVPMediaItemProductPlacementInfo)initWithLocalizedProductPlacementInfoString:(id)a3 duration:(id)a4 andImageURLStringFormat:(id)a5
{
  id v9;
  id v10;
  id v11;
  TVPMediaItemProductPlacementInfo *v12;
  TVPMediaItemProductPlacementInfo *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TVPMediaItemProductPlacementInfo;
  v12 = -[TVPMediaItemProductPlacementInfo init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_localizedInfoString, a3);
    objc_storeStrong((id *)&v13->_duration, a4);
    objc_storeStrong((id *)&v13->_imageUrlStringFormat, a5);
  }

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[TVPMediaItemProductPlacementInfo localizedInfoString](self, "localizedInfoString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVPMediaItemProductPlacementInfo duration](self, "duration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v6;
  -[TVPMediaItemProductPlacementInfo imageUrlStringFormat](self, "imageUrlStringFormat");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("infoString - %@, duration - %f, urlString - %@"), v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSString)localizedInfoString
{
  return self->_localizedInfoString;
}

- (void)setLocalizedInfoString:(id)a3
{
  objc_storeStrong((id *)&self->_localizedInfoString, a3);
}

- (NSNumber)duration
{
  return self->_duration;
}

- (void)setDuration:(id)a3
{
  objc_storeStrong((id *)&self->_duration, a3);
}

- (NSString)imageUrlStringFormat
{
  return self->_imageUrlStringFormat;
}

- (void)setImageUrlStringFormat:(id)a3
{
  objc_storeStrong((id *)&self->_imageUrlStringFormat, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageUrlStringFormat, 0);
  objc_storeStrong((id *)&self->_duration, 0);
  objc_storeStrong((id *)&self->_localizedInfoString, 0);
}

@end
