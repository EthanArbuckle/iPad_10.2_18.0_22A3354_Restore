@implementation VUIDocumentContextDataTVShow

- (VUIDocumentContextDataTVShow)initWithAdamID:(id)a3
{
  id v5;
  VUIDocumentContextDataTVShow *v6;
  VUIDocumentContextDataTVShow *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDocumentContextDataTVShow;
  v6 = -[VUIDocumentContextDataTVShow init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_adamID, a3);
    v7->_needsAdamIdToCanonicalIdConversion = 1;
  }

  return v7;
}

- (VUIDocumentContextDataTVShow)initWithShowID:(id)a3 episodeID:(id)a4
{
  id v7;
  id v8;
  VUIDocumentContextDataTVShow *v9;
  VUIDocumentContextDataTVShow *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)VUIDocumentContextDataTVShow;
  v9 = -[VUIDocumentContextDataTVShow init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_showID, a3);
    objc_storeStrong((id *)&v10->_episodeID, a4);
    v10->_needsAdamIdToCanonicalIdConversion = 0;
  }

  return v10;
}

- (id)jsonData
{
  void *v3;
  const __CFString *showID;
  const __CFString *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  if (-[NSString length](self->_episodeID, "length"))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_episodeID, CFSTR("id"));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Episode"), CFSTR("type"));
    if (-[NSString length](self->_showID, "length"))
    {
      showID = (const __CFString *)self->_showID;
      v5 = CFSTR("showId");
LABEL_8:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", showID, v5);
    }
  }
  else
  {
    if (-[NSString length](self->_showID, "length"))
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_showID, CFSTR("id"));
      showID = CFSTR("Show");
      v5 = CFSTR("type");
      goto LABEL_8;
    }
    if (-[NSString length](self->_adamID, "length"))
    {
      showID = (const __CFString *)self->_adamID;
      v5 = CFSTR("adamId");
      goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_needsAdamIdToCanonicalIdConversion);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("needsAdamIdToCanonicalIdConversion"));

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  int v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[VUIDocumentContextDataTVShow showID](self, "showID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "showID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      -[VUIDocumentContextDataTVShow episodeID](self, "episodeID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "episodeID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqual:", v9))
      {
        -[VUIDocumentContextDataTVShow adamID](self, "adamID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "adamID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isEqual:", v11))
        {
          v12 = -[VUIDocumentContextDataTVShow needsAdamIdToCanonicalIdConversion](self, "needsAdamIdToCanonicalIdConversion");
          v13 = v12 ^ objc_msgSend(v5, "needsAdamIdToCanonicalIdConversion") ^ 1;
        }
        else
        {
          LOBYTE(v13) = 0;
        }

      }
      else
      {
        LOBYTE(v13) = 0;
      }

    }
    else
    {
      LOBYTE(v13) = 0;
    }

  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (NSString)showID
{
  return self->_showID;
}

- (NSString)episodeID
{
  return self->_episodeID;
}

- (BOOL)needsAdamIdToCanonicalIdConversion
{
  return self->_needsAdamIdToCanonicalIdConversion;
}

- (void)setNeedsAdamIdToCanonicalIdConversion:(BOOL)a3
{
  self->_needsAdamIdToCanonicalIdConversion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_episodeID, 0);
  objc_storeStrong((id *)&self->_showID, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end
