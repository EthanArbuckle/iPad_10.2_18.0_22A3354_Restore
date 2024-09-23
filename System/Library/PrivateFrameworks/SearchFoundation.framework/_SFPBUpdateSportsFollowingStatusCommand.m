@implementation _SFPBUpdateSportsFollowingStatusCommand

- (_SFPBUpdateSportsFollowingStatusCommand)initWithFacade:(id)a3
{
  id v4;
  _SFPBUpdateSportsFollowingStatusCommand *v5;
  void *v6;
  _SFPBSportsItem *v7;
  void *v8;
  _SFPBSportsItem *v9;
  _SFPBUpdateSportsFollowingStatusCommand *v10;

  v4 = a3;
  v5 = -[_SFPBUpdateSportsFollowingStatusCommand init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "sportsItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [_SFPBSportsItem alloc];
      objc_msgSend(v4, "sportsItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_SFPBSportsItem initWithFacade:](v7, "initWithFacade:", v8);
      -[_SFPBUpdateSportsFollowingStatusCommand setSportsItem:](v5, "setSportsItem:", v9);

    }
    if (objc_msgSend(v4, "hasFollow"))
      -[_SFPBUpdateSportsFollowingStatusCommand setFollow:](v5, "setFollow:", objc_msgSend(v4, "follow"));
    v10 = v5;
  }

  return v5;
}

- (void)setSportsItem:(id)a3
{
  objc_storeStrong((id *)&self->_sportsItem, a3);
}

- (void)setFollow:(BOOL)a3
{
  self->_follow = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBUpdateSportsFollowingStatusCommandReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[_SFPBUpdateSportsFollowingStatusCommand sportsItem](self, "sportsItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteSubmessage();

  if (-[_SFPBUpdateSportsFollowingStatusCommand follow](self, "follow"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  BOOL v13;
  int follow;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    -[_SFPBUpdateSportsFollowingStatusCommand sportsItem](self, "sportsItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sportsItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      -[_SFPBUpdateSportsFollowingStatusCommand sportsItem](self, "sportsItem");
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {

LABEL_10:
        follow = self->_follow;
        v13 = follow == objc_msgSend(v4, "follow");
        goto LABEL_8;
      }
      v9 = (void *)v8;
      -[_SFPBUpdateSportsFollowingStatusCommand sportsItem](self, "sportsItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sportsItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (v12)
        goto LABEL_10;
    }
    else
    {

    }
  }
  v13 = 0;
LABEL_8:

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;

  v3 = -[_SFPBSportsItem hash](self->_sportsItem, "hash");
  v4 = 2654435761;
  if (!self->_follow)
    v4 = 0;
  return v4 ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_follow)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBUpdateSportsFollowingStatusCommand follow](self, "follow"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("follow"));

  }
  if (self->_sportsItem)
  {
    -[_SFPBUpdateSportsFollowingStatusCommand sportsItem](self, "sportsItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sportsItem"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("sportsItem"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBUpdateSportsFollowingStatusCommand dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (_SFPBUpdateSportsFollowingStatusCommand)initWithJSON:(id)a3
{
  void *v4;
  _SFPBUpdateSportsFollowingStatusCommand *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[_SFPBUpdateSportsFollowingStatusCommand initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBUpdateSportsFollowingStatusCommand)initWithDictionary:(id)a3
{
  id v4;
  _SFPBUpdateSportsFollowingStatusCommand *v5;
  void *v6;
  _SFPBSportsItem *v7;
  void *v8;
  _SFPBUpdateSportsFollowingStatusCommand *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_SFPBUpdateSportsFollowingStatusCommand;
  v5 = -[_SFPBUpdateSportsFollowingStatusCommand init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sportsItem"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBSportsItem initWithDictionary:]([_SFPBSportsItem alloc], "initWithDictionary:", v6);
      -[_SFPBUpdateSportsFollowingStatusCommand setSportsItem:](v5, "setSportsItem:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("follow"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBUpdateSportsFollowingStatusCommand setFollow:](v5, "setFollow:", objc_msgSend(v8, "BOOLValue"));
    v9 = v5;

  }
  return v5;
}

- (_SFPBSportsItem)sportsItem
{
  return self->_sportsItem;
}

- (BOOL)follow
{
  return self->_follow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sportsItem, 0);
}

@end
