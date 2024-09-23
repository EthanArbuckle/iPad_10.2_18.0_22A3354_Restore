@implementation ICSAttachment

- (ICSAttachment)initWithURL:(id)a3
{
  id v4;
  ICSAttachment *v5;
  ICSAttachment *v6;

  v4 = a3;
  v5 = -[ICSAttachment init](self, "init");
  v6 = v5;
  if (v5)
    -[ICSAttachment setURL:](v5, "setURL:", v4);

  return v6;
}

- (ICSAttachment)initWithData:(id)a3
{
  id v4;
  ICSAttachment *v5;
  ICSAttachment *v6;

  v4 = a3;
  v5 = -[ICSAttachment init](self, "init");
  v6 = v5;
  if (v5)
    -[ICSAttachment setData:](v5, "setData:", v4);

  return v6;
}

- (BOOL)isBinary
{
  return -[ICSProperty type](self, "type") == 5026;
}

- (id)filename
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICSAttachment managed_filename](self, "managed_filename");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[ICSAttachment x_apple_filename](self, "x_apple_filename");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[ICSProperty value](self, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        -[ICSProperty value](self, "value");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          objc_msgSend(v7, "path");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "lastPathComponent");
          v5 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v5 = 0;
        }

      }
      else
      {
        v5 = 0;
      }

    }
  }

  return v5;
}

- (BOOL)hasSize
{
  void *v2;
  BOOL v3;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SIZE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int)size
{
  void *v2;
  void *v3;
  int v4;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("SIZE"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "intValue");
  else
    v4 = 0;

  return v4;
}

- (void)setSize:(int)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), *(_QWORD *)&a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("SIZE"));

}

- (NSString)managed_id
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("MANAGED-ID"));
}

- (void)setManaged_id:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("MANAGED-ID"));
}

- (NSString)fmtype
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("FMTTYPE"));
}

- (void)setFmtype:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("FMTTYPE"));
}

- (BOOL)x_apple_autoarchived
{
  void *v2;
  char v3;

  -[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-APPLE-AUTOARCHIVED"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setX_apple_autoarchived:(BOOL)a3
{
  id v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", v4, CFSTR("X-APPLE-AUTOARCHIVED"));

  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("X-APPLE-AUTOARCHIVED"));
  }
}

- (NSString)managed_filename
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("FILENAME"));
}

- (void)setManaged_filename:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("FILENAME"));
}

- (NSString)x_apple_filename
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-APPLE-FILENAME"));
}

- (void)setX_apple_filename:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-APPLE-FILENAME"));
}

- (NSString)x_apple_ews_attachmentid
{
  return (NSString *)-[ICSProperty parameterValueForName:](self, "parameterValueForName:", CFSTR("X-APPLE-EWS-ATTACHMENTID"));
}

- (void)setX_apple_ews_attachmentid:(id)a3
{
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", a3, CFSTR("X-APPLE-EWS-ATTACHMENTID"));
}

- (BOOL)shouldObscureValue
{
  return 1;
}

- (void)setData:(id)a3
{
  -[ICSProperty setValue:type:](self, "setValue:type:", a3, 5026);
  if (a3)
  {
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", CFSTR("BINARY"), CFSTR("VALUE"));
    -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", CFSTR("BASE64"), CFSTR("ENCODING"));
  }
  else
  {
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("VALUE"));
    -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("ENCODING"));
  }
}

- (void)setURL:(id)a3
{
  -[ICSProperty setValue:type:](self, "setValue:type:", a3, 5013);
  -[ICSProperty setParameterValue:forName:](self, "setParameterValue:forName:", CFSTR("URI"), CFSTR("VALUE"));
  -[ICSProperty removeParameterValueForName:](self, "removeParameterValueForName:", CFSTR("ENCODING"));
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  unint64_t v18;
  void *v19;
  void *v20;
  char v21;

  v6 = a4;
  -[ICSProperty value](self, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v7;
LABEL_14:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "setObject:forKey:", CFSTR("BINARY"), CFSTR("VALUE"));
        objc_msgSend(v8, "setObject:forKey:", CFSTR("BASE64"), CFSTR("ENCODING"));
      }
      v17 = (a3 & 0x10) != 0 && -[ICSAttachment shouldObscureValue](self, "shouldObscureValue");
      -[ICSProperty _ICSStringWithOptions:appendingToString:additionalParameters:](self, "_ICSStringWithOptions:appendingToString:additionalParameters:", a3, v6, v8);
      objc_msgSend(v6, "appendString:", CFSTR(":"));
      if (v17)
        v18 = a3 | 0x20;
      else
        v18 = a3;
      objc_msgSend(v9, "_ICSStringWithOptions:appendingToString:", v18, v6);

      goto LABEL_25;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = 0;
      if ((a3 & 2) != 0 && objc_msgSend(v7, "isFileURL"))
      {
        objc_msgSend(v7, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v10, "length") <= 1)
        {

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "path");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v12, &v21);

          if (v13)
          {
            objc_msgSend(v7, "path");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "lastPathComponent");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "setObject:forKey:", v15, CFSTR("X-APPLE-FILENAME"));

            if (v21)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKey:", v16, CFSTR("X-APPLE-AUTOARCHIVED"));

            }
            else
            {
              v19 = (void *)MEMORY[0x1E0C99D50];
              objc_msgSend(v7, "path");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "dataWithContentsOfFile:", v20);
              v9 = (id)objc_claimAutoreleasedReturnValue();

              if (v9)
                goto LABEL_14;
            }
            goto LABEL_24;
          }
        }
      }
      objc_msgSend(v7, "absoluteString");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9)
        goto LABEL_14;
    }
LABEL_24:
    NSLog(CFSTR("Ignoring attachment with nothing to export: %@"), self);
    objc_msgSend(v6, "appendString:", CFSTR(":"));
LABEL_25:

    goto LABEL_26;
  }
  NSLog(CFSTR("Ignoring attachment with nil URL and data: %@"), self);
  objc_msgSend(v6, "appendString:", CFSTR(":"));
LABEL_26:

}

@end
