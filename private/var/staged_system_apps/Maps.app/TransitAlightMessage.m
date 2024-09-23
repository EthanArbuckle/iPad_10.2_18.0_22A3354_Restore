@implementation TransitAlightMessage

- (TransitAlightMessage)initWithDictionary:(id)a3
{
  id v4;
  TransitAlightMessage *v5;
  NSString *v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  uint64_t v18;
  GEOPBTransitArtwork *artwork;
  NSString *v20;
  void *v21;
  uint64_t v22;
  GEOComposedString *title;
  NSString *v24;
  void *v25;
  uint64_t v26;
  GEOComposedString *detail;
  objc_super v29;

  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)TransitAlightMessage;
  v5 = -[IPCMessageObject initWithDictionary:](&v29, "initWithDictionary:", v4);
  if (v5)
  {
    v6 = NSStringFromSelector("identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v7));
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v10 = NSStringFromSelector("stopIndex");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v11));
    v5->_stopIndex = (unint64_t)objc_msgSend(v12, "unsignedIntegerValue");

    v13 = NSStringFromSelector("stepIndex");
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v14));
    v5->_stepIndex = (unint64_t)objc_msgSend(v15, "unsignedIntegerValue");

    v16 = NSStringFromSelector("artwork");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v17));
    artwork = v5->_artwork;
    v5->_artwork = (GEOPBTransitArtwork *)v18;

    v20 = NSStringFromSelector("title");
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v21));
    title = v5->_title;
    v5->_title = (GEOComposedString *)v22;

    v24 = NSStringFromSelector("detail");
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v25));
    detail = v5->_detail;
    v5->_detail = (GEOComposedString *)v26;

  }
  return v5;
}

- (id)dictionaryValue
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  NSString *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  void *v21;
  NSString *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)TransitAlightMessage;
  v3 = -[IPCMessageObject dictionaryValue](&v25, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAlightMessage identifier](self, "identifier"));
  v7 = NSStringFromSelector("identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[TransitAlightMessage stopIndex](self, "stopIndex")));
  v10 = NSStringFromSelector("stopIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[TransitAlightMessage stepIndex](self, "stepIndex")));
  v13 = NSStringFromSelector("stepIndex");
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAlightMessage artwork](self, "artwork"));
  v16 = NSStringFromSelector("artwork");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAlightMessage title](self, "title"));
  v19 = NSStringFromSelector("title");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAlightMessage detail](self, "detail"));
  v22 = NSStringFromSelector("detail");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v21, v23);

  return v5;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitAlightMessage dictionaryValue](self, "dictionaryValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p> %@"), v3, self, v4));

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)stopIndex
{
  return self->_stopIndex;
}

- (void)setStopIndex:(unint64_t)a3
{
  self->_stopIndex = a3;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (void)setStepIndex:(unint64_t)a3
{
  self->_stepIndex = a3;
}

- (GEOPBTransitArtwork)artwork
{
  return self->_artwork;
}

- (void)setArtwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (GEOComposedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (GEOComposedString)detail
{
  return self->_detail;
}

- (void)setDetail:(id)a3
{
  objc_storeStrong((id *)&self->_detail, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detail, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_artwork, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
