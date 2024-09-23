@implementation RFEngageable

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setCommand_reference:(id)a3
{
  RFPreviewList *preview_list;
  id v6;

  *(_BYTE *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_command_reference, a3);
  v6 = a3;
  *(_BYTE *)&self->_has &= ~2u;
  preview_list = self->_preview_list;
  self->_preview_list = 0;

}

- (BOOL)hasCommand_reference
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setPreview_list:(id)a3
{
  SFCommandReference *command_reference;
  id v6;

  *(_BYTE *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_preview_list, a3);
  v6 = a3;
  *(_BYTE *)&self->_has &= ~1u;
  command_reference = self->_command_reference;
  self->_command_reference = 0;

}

- (BOOL)hasPreview_list
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (RFEngageable)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFEngageable *v6;
  RFEngageable *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRFEngageable initWithData:]([_SFPBRFEngageable alloc], "initWithData:", v5);
  v7 = -[RFEngageable initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRFEngageable *v6;

  v4 = a3;
  v6 = -[_SFPBRFEngageable initWithFacade:]([_SFPBRFEngageable alloc], "initWithFacade:", self);
  -[_SFPBRFEngageable data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRFEngageable *v2;
  void *v3;

  v2 = -[_SFPBRFEngageable initWithFacade:]([_SFPBRFEngageable alloc], "initWithFacade:", self);
  -[_SFPBRFEngageable dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRFEngageable *v2;
  void *v3;

  v2 = -[_SFPBRFEngageable initWithFacade:]([_SFPBRFEngageable alloc], "initWithFacade:", self);
  -[_SFPBRFEngageable jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (-[RFEngageable hasCommand_reference](self, "hasCommand_reference"))
  {
    -[RFEngageable command_reference](self, "command_reference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v4, "setCommand_reference:", v6);

  }
  if (-[RFEngageable hasPreview_list](self, "hasPreview_list"))
  {
    -[RFEngageable preview_list](self, "preview_list");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v4, "setPreview_list:", v8);

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  RFEngageable *v5;
  RFEngageable *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  v5 = (RFEngageable *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[RFEngageable isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[RFEngageable command_reference](self, "command_reference");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFEngageable command_reference](v6, "command_reference");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_19:

        goto LABEL_20;
      }
      -[RFEngageable command_reference](self, "command_reference");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[RFEngageable command_reference](self, "command_reference");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        -[RFEngageable command_reference](v6, "command_reference");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v3, "isEqual:", v10))
        {
          v11 = 0;
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        v21 = v10;
      }
      -[RFEngageable preview_list](self, "preview_list");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[RFEngageable preview_list](v6, "preview_list");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
      }
      else
      {
        -[RFEngageable preview_list](self, "preview_list");
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;
          -[RFEngageable preview_list](self, "preview_list");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[RFEngageable preview_list](v6, "preview_list");
          v20 = v3;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v19, "isEqual:", v17);

          v3 = v20;
        }
        else
        {

          v11 = 1;
        }
      }
      v10 = v21;
      if (!v9)
        goto LABEL_18;
      goto LABEL_17;
    }
    v11 = 0;
  }
LABEL_20:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[RFEngageable command_reference](self, "command_reference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[RFEngageable preview_list](self, "preview_list");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (SFCommandReference)command_reference
{
  return self->_command_reference;
}

- (RFPreviewList)preview_list
{
  return self->_preview_list;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preview_list, 0);
  objc_storeStrong((id *)&self->_command_reference, 0);
}

- (RFEngageable)initWithProtobuf:(id)a3
{
  id v4;
  RFEngageable *v5;
  void *v6;
  SFCommandReference *v7;
  void *v8;
  SFCommandReference *v9;
  void *v10;
  RFPreviewList *v11;
  void *v12;
  RFPreviewList *v13;
  RFEngageable *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)RFEngageable;
  v5 = -[RFEngageable init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "command_reference");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = [SFCommandReference alloc];
      objc_msgSend(v4, "command_reference");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SFCommandReference initWithProtobuf:](v7, "initWithProtobuf:", v8);
      -[RFEngageable setCommand_reference:](v5, "setCommand_reference:", v9);

    }
    objc_msgSend(v4, "preview_list");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [RFPreviewList alloc];
      objc_msgSend(v4, "preview_list");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[RFPreviewList initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[RFEngageable setPreview_list:](v5, "setPreview_list:", v13);

    }
    v14 = v5;
  }

  return v5;
}

@end
