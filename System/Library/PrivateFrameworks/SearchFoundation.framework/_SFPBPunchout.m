@implementation _SFPBPunchout

- (_SFPBPunchout)initWithFacade:(id)a3
{
  id v4;
  _SFPBPunchout *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _SFPBURL *v19;
  void *v20;
  _SFPBUserActivityData *v21;
  void *v22;
  _SFPBUserActivityData *v23;
  void *v24;
  void *v25;
  _SFPBPunchout *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBPunchout init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPunchout setName:](v5, "setName:", v7);

    }
    objc_msgSend(v4, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPunchout setBundleIdentifier:](v5, "setBundleIdentifier:", v9);

    }
    objc_msgSend(v4, "label");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "label");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPunchout setLabel:](v5, "setLabel:", v11);

    }
    objc_msgSend(v4, "urls");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v13 = 0;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v4, "urls", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v14);
          v19 = -[_SFPBURL initWithNSURL:]([_SFPBURL alloc], "initWithNSURL:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
          if (v19)
            objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v16);
    }

    -[_SFPBPunchout setUrls:](v5, "setUrls:", v13);
    objc_msgSend(v4, "userActivityData");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [_SFPBUserActivityData alloc];
      objc_msgSend(v4, "userActivityData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[_SFPBUserActivityData initWithFacade:](v21, "initWithFacade:", v22);
      -[_SFPBPunchout setUserActivityData:](v5, "setUserActivityData:", v23);

    }
    objc_msgSend(v4, "actionTarget");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v4, "actionTarget");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPunchout setActionTarget:](v5, "setActionTarget:", v25);

    }
    if (objc_msgSend(v4, "hasIsRunnableInBackground"))
      -[_SFPBPunchout setIsRunnableInBackground:](v5, "setIsRunnableInBackground:", objc_msgSend(v4, "isRunnableInBackground"));
    if (objc_msgSend(v4, "hasHasClip"))
      -[_SFPBPunchout setHasClip:](v5, "setHasClip:", objc_msgSend(v4, "hasClip"));
    if (objc_msgSend(v4, "hasForceOpenInBrowser"))
      -[_SFPBPunchout setForceOpenInBrowser:](v5, "setForceOpenInBrowser:", objc_msgSend(v4, "forceOpenInBrowser"));
    v26 = v5;

  }
  return v5;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (void)setBundleIdentifier:(id)a3
{
  NSString *v4;
  NSString *bundleIdentifier;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  bundleIdentifier = self->_bundleIdentifier;
  self->_bundleIdentifier = v4;

}

- (void)setLabel:(id)a3
{
  NSString *v4;
  NSString *label;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  label = self->_label;
  self->_label = v4;

}

- (void)setUrls:(id)a3
{
  NSArray *v4;
  NSArray *urls;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  urls = self->_urls;
  self->_urls = v4;

}

- (void)clearUrls
{
  -[NSArray removeAllObjects](self->_urls, "removeAllObjects");
}

- (void)addUrls:(id)a3
{
  id v4;
  NSArray *urls;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  urls = self->_urls;
  v8 = v4;
  if (!urls)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_urls;
    self->_urls = v6;

    v4 = v8;
    urls = self->_urls;
  }
  -[NSArray addObject:](urls, "addObject:", v4);

}

- (unint64_t)urlsCount
{
  return -[NSArray count](self->_urls, "count");
}

- (id)urlsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_urls, "objectAtIndexedSubscript:", a3);
}

- (void)setUserActivityData:(id)a3
{
  objc_storeStrong((id *)&self->_userActivityData, a3);
}

- (void)setActionTarget:(id)a3
{
  NSString *v4;
  NSString *actionTarget;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  actionTarget = self->_actionTarget;
  self->_actionTarget = v4;

}

- (void)setIsRunnableInBackground:(BOOL)a3
{
  self->_isRunnableInBackground = a3;
}

- (void)setHasClip:(BOOL)a3
{
  self->_hasClip = a3;
}

- (void)setForceOpenInBrowser:(BOOL)a3
{
  self->_forceOpenInBrowser = a3;
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPunchoutReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBPunchout name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteStringField();

  -[_SFPBPunchout bundleIdentifier](self, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBPunchout label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  -[_SFPBPunchout urls](self, "urls");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[_SFPBPunchout userActivityData](self, "userActivityData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    PBDataWriterWriteSubmessage();

  -[_SFPBPunchout actionTarget](self, "actionTarget");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    PBDataWriterWriteStringField();

  if (-[_SFPBPunchout isRunnableInBackground](self, "isRunnableInBackground"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBPunchout hasClip](self, "hasClip"))
    PBDataWriterWriteBOOLField();
  if (-[_SFPBPunchout forceOpenInBrowser](self, "forceOpenInBrowser"))
    PBDataWriterWriteBOOLField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  BOOL v37;
  int isRunnableInBackground;
  int hasClip;
  int forceOpenInBrowser;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_32;
  -[_SFPBPunchout name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBPunchout name](self, "name");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBPunchout name](self, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBPunchout bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBPunchout bundleIdentifier](self, "bundleIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBPunchout bundleIdentifier](self, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBPunchout label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBPunchout label](self, "label");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBPunchout label](self, "label");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "label");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBPunchout urls](self, "urls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "urls");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBPunchout urls](self, "urls");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    -[_SFPBPunchout urls](self, "urls");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "urls");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if (!v26)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBPunchout userActivityData](self, "userActivityData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userActivityData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_31;
  -[_SFPBPunchout userActivityData](self, "userActivityData");
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)v27;
    -[_SFPBPunchout userActivityData](self, "userActivityData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userActivityData");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v29, "isEqual:", v30);

    if (!v31)
      goto LABEL_32;
  }
  else
  {

  }
  -[_SFPBPunchout actionTarget](self, "actionTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionTarget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_31:

    goto LABEL_32;
  }
  -[_SFPBPunchout actionTarget](self, "actionTarget");
  v32 = objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    v33 = (void *)v32;
    -[_SFPBPunchout actionTarget](self, "actionTarget");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "actionTarget");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqual:", v35);

    if (!v36)
      goto LABEL_32;
  }
  else
  {

  }
  isRunnableInBackground = self->_isRunnableInBackground;
  if (isRunnableInBackground == objc_msgSend(v4, "isRunnableInBackground"))
  {
    hasClip = self->_hasClip;
    if (hasClip == objc_msgSend(v4, "hasClip"))
    {
      forceOpenInBrowser = self->_forceOpenInBrowser;
      v37 = forceOpenInBrowser == objc_msgSend(v4, "forceOpenInBrowser");
      goto LABEL_33;
    }
  }
LABEL_32:
  v37 = 0;
LABEL_33:

  return v37;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  uint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_bundleIdentifier, "hash");
  v5 = -[NSString hash](self->_label, "hash");
  v6 = -[NSArray hash](self->_urls, "hash");
  v7 = -[_SFPBUserActivityData hash](self->_userActivityData, "hash");
  v8 = -[NSString hash](self->_actionTarget, "hash");
  v9 = 2654435761;
  if (self->_isRunnableInBackground)
    v10 = 2654435761;
  else
    v10 = 0;
  if (self->_hasClip)
    v11 = 2654435761;
  else
    v11 = 0;
  if (!self->_forceOpenInBrowser)
    v9 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v10 ^ v11 ^ v9;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_actionTarget)
  {
    -[_SFPBPunchout actionTarget](self, "actionTarget");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("actionTarget"));

  }
  if (self->_bundleIdentifier)
  {
    -[_SFPBPunchout bundleIdentifier](self, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("bundleIdentifier"));

  }
  if (self->_forceOpenInBrowser)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBPunchout forceOpenInBrowser](self, "forceOpenInBrowser"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("forceOpenInBrowser"));

  }
  if (self->_hasClip)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBPunchout hasClip](self, "hasClip"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("hasClip"));

  }
  if (self->_isRunnableInBackground)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBPunchout isRunnableInBackground](self, "isRunnableInBackground"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("isRunnableInBackground"));

  }
  if (self->_label)
  {
    -[_SFPBPunchout label](self, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("label"));

  }
  if (self->_name)
  {
    -[_SFPBPunchout name](self, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("name"));

  }
  if (-[NSArray count](self->_urls, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v16 = self->_urls;
    v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v27);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v15, "addObject:", v21);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v22);

          }
        }
        v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v18);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("urls"));
  }
  if (self->_userActivityData)
  {
    -[_SFPBPunchout userActivityData](self, "userActivityData");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("userActivityData"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, CFSTR("userActivityData"));

    }
  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPunchout dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBPunchout)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPunchout *v5;
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
    self = -[_SFPBPunchout initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPunchout)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPunchout *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  _SFPBURL *v19;
  void *v20;
  _SFPBUserActivityData *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _SFPBPunchout *v27;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  objc_super v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_SFPBPunchout;
  v5 = -[_SFPBPunchout init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBPunchout setName:](v5, "setName:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[_SFPBPunchout setBundleIdentifier:](v5, "setBundleIdentifier:", v9);

    }
    v30 = v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("label"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBPunchout setLabel:](v5, "setLabel:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("urls"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v29 = v6;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v13 = v12;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v32;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v32 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v19 = -[_SFPBURL initWithDictionary:]([_SFPBURL alloc], "initWithDictionary:", v18);
              -[_SFPBPunchout addUrls:](v5, "addUrls:", v19);

            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
        }
        while (v15);
      }

      v6 = v29;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userActivityData"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[_SFPBUserActivityData initWithDictionary:]([_SFPBUserActivityData alloc], "initWithDictionary:", v20);
      -[_SFPBPunchout setUserActivityData:](v5, "setUserActivityData:", v21);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("actionTarget"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = (void *)objc_msgSend(v22, "copy");
      -[_SFPBPunchout setActionTarget:](v5, "setActionTarget:", v23);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isRunnableInBackground"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPunchout setIsRunnableInBackground:](v5, "setIsRunnableInBackground:", objc_msgSend(v24, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("hasClip"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPunchout setHasClip:](v5, "setHasClip:", objc_msgSend(v25, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("forceOpenInBrowser"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBPunchout setForceOpenInBrowser:](v5, "setForceOpenInBrowser:", objc_msgSend(v26, "BOOLValue"));
    v27 = v5;

  }
  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)label
{
  return self->_label;
}

- (NSArray)urls
{
  return self->_urls;
}

- (_SFPBUserActivityData)userActivityData
{
  return self->_userActivityData;
}

- (NSString)actionTarget
{
  return self->_actionTarget;
}

- (BOOL)isRunnableInBackground
{
  return self->_isRunnableInBackground;
}

- (BOOL)hasClip
{
  return self->_hasClip;
}

- (BOOL)forceOpenInBrowser
{
  return self->_forceOpenInBrowser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTarget, 0);
  objc_storeStrong((id *)&self->_userActivityData, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
