@implementation _SFPBDynamicURLImageResource

- (_SFPBDynamicURLImageResource)initWithFacade:(id)a3
{
  id v4;
  _SFPBDynamicURLImageResource *v5;
  _SFPBGraphicalFloat *v6;
  _SFPBGraphicalFloat *v7;
  _SFPBGraphicalFloat *v8;
  _SFPBGraphicalFloat *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  _SFPBImageOption *v19;
  _SFPBDynamicURLImageResource *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[_SFPBDynamicURLImageResource init](self, "init");
  if (v5)
  {
    if (objc_msgSend(v4, "hasPixelWidth"))
    {
      v6 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "pixelWidth");
      v7 = -[_SFPBGraphicalFloat initWithCGFloat:](v6, "initWithCGFloat:");
      -[_SFPBDynamicURLImageResource setPixelWidth:](v5, "setPixelWidth:", v7);

    }
    if (objc_msgSend(v4, "hasPixelHeight"))
    {
      v8 = [_SFPBGraphicalFloat alloc];
      objc_msgSend(v4, "pixelHeight");
      v9 = -[_SFPBGraphicalFloat initWithCGFloat:](v8, "initWithCGFloat:");
      -[_SFPBDynamicURLImageResource setPixelHeight:](v5, "setPixelHeight:", v9);

    }
    objc_msgSend(v4, "formatURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "formatURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBDynamicURLImageResource setFormatURL:](v5, "setFormatURL:", v11);

    }
    if (objc_msgSend(v4, "hasSupportsResizing"))
      -[_SFPBDynamicURLImageResource setSupportsResizing:](v5, "setSupportsResizing:", objc_msgSend(v4, "supportsResizing"));
    objc_msgSend(v4, "imageOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v13 = 0;

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v4, "imageOptions", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          v19 = -[_SFPBImageOption initWithFacade:]([_SFPBImageOption alloc], "initWithFacade:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
          if (v19)
            objc_msgSend(v13, "addObject:", v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v16);
    }

    -[_SFPBDynamicURLImageResource setImageOptions:](v5, "setImageOptions:", v13);
    v20 = v5;

  }
  return v5;
}

- (void)setPixelWidth:(id)a3
{
  objc_storeStrong((id *)&self->_pixelWidth, a3);
}

- (void)setPixelHeight:(id)a3
{
  objc_storeStrong((id *)&self->_pixelHeight, a3);
}

- (void)setFormatURL:(id)a3
{
  NSString *v4;
  NSString *formatURL;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  formatURL = self->_formatURL;
  self->_formatURL = v4;

}

- (void)setSupportsResizing:(BOOL)a3
{
  self->_supportsResizing = a3;
}

- (void)setImageOptions:(id)a3
{
  NSArray *v4;
  NSArray *imageOptions;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  imageOptions = self->_imageOptions;
  self->_imageOptions = v4;

}

- (void)clearImageOptions
{
  -[NSArray removeAllObjects](self->_imageOptions, "removeAllObjects");
}

- (void)addImageOptions:(id)a3
{
  id v4;
  NSArray *imageOptions;
  NSArray *v6;
  NSArray *v7;
  id v8;

  v4 = a3;
  imageOptions = self->_imageOptions;
  v8 = v4;
  if (!imageOptions)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_imageOptions;
    self->_imageOptions = v6;

    v4 = v8;
    imageOptions = self->_imageOptions;
  }
  -[NSArray addObject:](imageOptions, "addObject:", v4);

}

- (unint64_t)imageOptionsCount
{
  return -[NSArray count](self->_imageOptions, "count");
}

- (id)imageOptionsAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndexedSubscript:](self->_imageOptions, "objectAtIndexedSubscript:", a3);
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBDynamicURLImageResourceReadFrom(self, (uint64_t)a3);
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
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_SFPBDynamicURLImageResource pixelWidth](self, "pixelWidth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteSubmessage();

  -[_SFPBDynamicURLImageResource pixelHeight](self, "pixelHeight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteSubmessage();

  -[_SFPBDynamicURLImageResource formatURL](self, "formatURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    PBDataWriterWriteStringField();

  if (-[_SFPBDynamicURLImageResource supportsResizing](self, "supportsResizing"))
    PBDataWriterWriteBOOLField();
  -[_SFPBDynamicURLImageResource imageOptions](self, "imageOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

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
  int supportsResizing;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  BOOL v28;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_23;
  -[_SFPBDynamicURLImageResource pixelWidth](self, "pixelWidth");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pixelWidth");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_22;
  -[_SFPBDynamicURLImageResource pixelWidth](self, "pixelWidth");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBDynamicURLImageResource pixelWidth](self, "pixelWidth");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pixelWidth");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_23;
  }
  else
  {

  }
  -[_SFPBDynamicURLImageResource pixelHeight](self, "pixelHeight");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pixelHeight");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_22;
  -[_SFPBDynamicURLImageResource pixelHeight](self, "pixelHeight");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBDynamicURLImageResource pixelHeight](self, "pixelHeight");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pixelHeight");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_23;
  }
  else
  {

  }
  -[_SFPBDynamicURLImageResource formatURL](self, "formatURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "formatURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_22;
  -[_SFPBDynamicURLImageResource formatURL](self, "formatURL");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBDynamicURLImageResource formatURL](self, "formatURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "formatURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_23;
  }
  else
  {

  }
  supportsResizing = self->_supportsResizing;
  if (supportsResizing != objc_msgSend(v4, "supportsResizing"))
    goto LABEL_23;
  -[_SFPBDynamicURLImageResource imageOptions](self, "imageOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_22:

    goto LABEL_23;
  }
  -[_SFPBDynamicURLImageResource imageOptions](self, "imageOptions");
  v23 = objc_claimAutoreleasedReturnValue();
  if (!v23)
  {

LABEL_26:
    v28 = 1;
    goto LABEL_24;
  }
  v24 = (void *)v23;
  -[_SFPBDynamicURLImageResource imageOptions](self, "imageOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageOptions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "isEqual:", v26);

  if ((v27 & 1) != 0)
    goto LABEL_26;
LABEL_23:
  v28 = 0;
LABEL_24:

  return v28;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  NSUInteger v5;
  uint64_t v6;

  v3 = -[_SFPBGraphicalFloat hash](self->_pixelWidth, "hash");
  v4 = -[_SFPBGraphicalFloat hash](self->_pixelHeight, "hash");
  v5 = -[NSString hash](self->_formatURL, "hash");
  if (self->_supportsResizing)
    v6 = 2654435761;
  else
    v6 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ -[NSArray hash](self->_imageOptions, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_formatURL)
  {
    -[_SFPBDynamicURLImageResource formatURL](self, "formatURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("formatURL"));

  }
  if (-[NSArray count](self->_imageOptions, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v7 = self->_imageOptions;
    v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "dictionaryRepresentation", (_QWORD)v22);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            objc_msgSend(v6, "addObject:", v12);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v13);

          }
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("imageOptions"));
  }
  if (self->_pixelHeight)
  {
    -[_SFPBDynamicURLImageResource pixelHeight](self, "pixelHeight");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("pixelHeight"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("pixelHeight"));

    }
  }
  if (self->_pixelWidth)
  {
    -[_SFPBDynamicURLImageResource pixelWidth](self, "pixelWidth");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("pixelWidth"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("pixelWidth"));

    }
  }
  if (self->_supportsResizing)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[_SFPBDynamicURLImageResource supportsResizing](self, "supportsResizing"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("supportsResizing"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBDynamicURLImageResource dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBDynamicURLImageResource)initWithJSON:(id)a3
{
  void *v4;
  _SFPBDynamicURLImageResource *v5;
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
    self = -[_SFPBDynamicURLImageResource initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBDynamicURLImageResource)initWithDictionary:(id)a3
{
  id v4;
  _SFPBDynamicURLImageResource *v5;
  void *v6;
  _SFPBGraphicalFloat *v7;
  void *v8;
  _SFPBGraphicalFloat *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  _SFPBImageOption *v20;
  _SFPBDynamicURLImageResource *v21;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  objc_super v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)_SFPBDynamicURLImageResource;
  v5 = -[_SFPBDynamicURLImageResource init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pixelWidth"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v6);
      -[_SFPBDynamicURLImageResource setPixelWidth:](v5, "setPixelWidth:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pixelHeight"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[_SFPBGraphicalFloat initWithDictionary:]([_SFPBGraphicalFloat alloc], "initWithDictionary:", v8);
      -[_SFPBDynamicURLImageResource setPixelHeight:](v5, "setPixelHeight:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("formatURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBDynamicURLImageResource setFormatURL:](v5, "setFormatURL:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("supportsResizing"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[_SFPBDynamicURLImageResource setSupportsResizing:](v5, "setSupportsResizing:", objc_msgSend(v12, "BOOLValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageOptions"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v23 = v12;
      v24 = v8;
      v25 = v6;
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v14 = v13;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v20 = -[_SFPBImageOption initWithDictionary:]([_SFPBImageOption alloc], "initWithDictionary:", v19);
              -[_SFPBDynamicURLImageResource addImageOptions:](v5, "addImageOptions:", v20);

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
        }
        while (v16);
      }

      v8 = v24;
      v6 = v25;
      v12 = v23;
    }
    v21 = v5;

  }
  return v5;
}

- (_SFPBGraphicalFloat)pixelWidth
{
  return self->_pixelWidth;
}

- (_SFPBGraphicalFloat)pixelHeight
{
  return self->_pixelHeight;
}

- (NSString)formatURL
{
  return self->_formatURL;
}

- (BOOL)supportsResizing
{
  return self->_supportsResizing;
}

- (NSArray)imageOptions
{
  return self->_imageOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageOptions, 0);
  objc_storeStrong((id *)&self->_formatURL, 0);
  objc_storeStrong((id *)&self->_pixelHeight, 0);
  objc_storeStrong((id *)&self->_pixelWidth, 0);
}

@end
