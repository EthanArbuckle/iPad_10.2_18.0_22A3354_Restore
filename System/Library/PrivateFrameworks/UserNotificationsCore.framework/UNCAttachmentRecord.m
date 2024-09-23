@implementation UNCAttachmentRecord

- (UNCAttachmentRecord)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  UNCAttachmentRecord *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNCAttachmentRecord;
  v5 = -[UNCAttachmentRecord init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("AttachmentIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCAttachmentRecord setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v4, "objectForKey:", CFSTR("AttachmentURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCAttachmentRecord setURL:](v5, "setURL:", v7);

    objc_msgSend(v4, "objectForKey:", CFSTR("AttachmentType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCAttachmentRecord setType:](v5, "setType:", v8);

    -[UNCAttachmentRecord setThumbnailHidden:](v5, "setThumbnailHidden:", objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("AttachmentOptionsThumbnailHidden")));
    objc_msgSend(v4, "bs_safeDictionaryForKey:", CFSTR("AttachmentOptionsThumbnailClippingRect"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCAttachmentRecord setThumbnailClippingRect:](v5, "setThumbnailClippingRect:", v9);

    objc_msgSend(v4, "bs_safeNumberForKey:", CFSTR("AttachmentOptionsThumbnailFrameNumber"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCAttachmentRecord setThumbnailFrameNumber:](v5, "setThumbnailFrameNumber:", v10);

    objc_msgSend(v4, "bs_safeDictionaryForKey:", CFSTR("AttachmentOptionsThumbnailTimestamp"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCAttachmentRecord setThumbnailTimestamp:](v5, "setThumbnailTimestamp:", v11);

    -[UNCAttachmentRecord setHiddenFromDefaultExpandedView:](v5, "setHiddenFromDefaultExpandedView:", objc_msgSend(v4, "bs_BOOLForKey:", CFSTR("AttachmentHiddenFromDefaultExpandedView")));
  }

  return v5;
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

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCAttachmentRecord identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v4, CFSTR("AttachmentIdentifier"));

  -[UNCAttachmentRecord URL](self, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v5, CFSTR("AttachmentURL"));

  -[UNCAttachmentRecord type](self, "type");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v6, CFSTR("AttachmentType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCAttachmentRecord thumbnailHidden](self, "thumbnailHidden"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("AttachmentOptionsThumbnailHidden"));

  -[UNCAttachmentRecord thumbnailClippingRect](self, "thumbnailClippingRect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v8, CFSTR("AttachmentOptionsThumbnailClippingRect"));

  -[UNCAttachmentRecord thumbnailFrameNumber](self, "thumbnailFrameNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v9, CFSTR("AttachmentOptionsThumbnailFrameNumber"));

  -[UNCAttachmentRecord thumbnailTimestamp](self, "thumbnailTimestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_setSafeObject:forKey:", v10, CFSTR("AttachmentOptionsThumbnailTimestamp"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[UNCAttachmentRecord hiddenFromDefaultExpandedView](self, "hiddenFromDefaultExpandedView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("AttachmentHiddenFromDefaultExpandedView"));

  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCAttachmentRecord identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("Identifier"));

  -[UNCAttachmentRecord URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("URL"));

  -[UNCAttachmentRecord type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("Type"));

  v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCAttachmentRecord thumbnailHidden](self, "thumbnailHidden"), CFSTR("ThumbnailHidden"));
  -[UNCAttachmentRecord thumbnailClippingRect](self, "thumbnailClippingRect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("ThumbnailClippingRect"));

  -[UNCAttachmentRecord thumbnailFrameNumber](self, "thumbnailFrameNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:withName:", v13, CFSTR("ThumbnailFrameNumber"));

  -[UNCAttachmentRecord thumbnailTimestamp](self, "thumbnailTimestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:withName:", v15, CFSTR("ThumbnailTimestamp"));

  v17 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCAttachmentRecord hiddenFromDefaultExpandedView](self, "hiddenFromDefaultExpandedView"), CFSTR("HiddenFromDefaultExpandedView"));
  objc_msgSend(v3, "build");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  if (self == a3)
  {
    LOBYTE(v13) = 1;
  }
  else
  {
    v4 = a3;
    objc_opt_class();
    UNSafeCast();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[UNCAttachmentRecord identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (UNEqualObjects())
      {
        -[UNCAttachmentRecord URL](self, "URL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (UNEqualObjects())
        {
          -[UNCAttachmentRecord type](self, "type");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "type");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (UNEqualObjects()
            && (v12 = -[UNCAttachmentRecord thumbnailHidden](self, "thumbnailHidden"),
                v12 == objc_msgSend(v5, "thumbnailHidden")))
          {
            -[UNCAttachmentRecord thumbnailClippingRect](self, "thumbnailClippingRect");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "thumbnailClippingRect");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (UNEqualObjects())
            {
              v23 = v14;
              -[UNCAttachmentRecord thumbnailFrameNumber](self, "thumbnailFrameNumber");
              v16 = objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "thumbnailFrameNumber");
              v24 = (void *)v16;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (UNEqualObjects())
              {
                -[UNCAttachmentRecord thumbnailTimestamp](self, "thumbnailTimestamp");
                v17 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "thumbnailTimestamp");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = (void *)v17;
                v14 = v23;
                if (UNEqualObjects())
                {
                  v18 = -[UNCAttachmentRecord hiddenFromDefaultExpandedView](self, "hiddenFromDefaultExpandedView");
                  v13 = v18 ^ objc_msgSend(v5, "hiddenFromDefaultExpandedView") ^ 1;
                }
                else
                {
                  LOBYTE(v13) = 0;
                }

              }
              else
              {
                LOBYTE(v13) = 0;
                v14 = v23;
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
  return v13;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  unint64_t v18;

  objc_msgSend(MEMORY[0x24BE0BE28], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCAttachmentRecord identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  -[UNCAttachmentRecord URL](self, "URL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:", v6);

  -[UNCAttachmentRecord type](self, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:", v8);

  v10 = (id)objc_msgSend(v3, "appendBool:", -[UNCAttachmentRecord thumbnailHidden](self, "thumbnailHidden"));
  -[UNCAttachmentRecord thumbnailClippingRect](self, "thumbnailClippingRect");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v3, "appendObject:", v11);

  -[UNCAttachmentRecord thumbnailFrameNumber](self, "thumbnailFrameNumber");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v3, "appendObject:", v13);

  -[UNCAttachmentRecord thumbnailTimestamp](self, "thumbnailTimestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v3, "appendObject:", v15);

  v17 = (id)objc_msgSend(v3, "appendBool:", -[UNCAttachmentRecord hiddenFromDefaultExpandedView](self, "hiddenFromDefaultExpandedView"));
  v18 = objc_msgSend(v3, "hash");

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[UNCAttachmentRecord dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("dictionary"));

}

- (UNCAttachmentRecord)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  UNCAttachmentRecord *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCF20];
  v5 = a3;
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6, v11, v12, v13, v14, v15, v16);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("dictionary"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[UNCAttachmentRecord initWithDictionaryRepresentation:]([UNCAttachmentRecord alloc], "initWithDictionaryRepresentation:", v8);
  return v9;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)thumbnailHidden
{
  return self->_thumbnailHidden;
}

- (void)setThumbnailHidden:(BOOL)a3
{
  self->_thumbnailHidden = a3;
}

- (NSDictionary)thumbnailClippingRect
{
  return self->_thumbnailClippingRect;
}

- (void)setThumbnailClippingRect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSNumber)thumbnailFrameNumber
{
  return self->_thumbnailFrameNumber;
}

- (void)setThumbnailFrameNumber:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)thumbnailTimestamp
{
  return self->_thumbnailTimestamp;
}

- (void)setThumbnailTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (BOOL)hiddenFromDefaultExpandedView
{
  return self->_hiddenFromDefaultExpandedView;
}

- (void)setHiddenFromDefaultExpandedView:(BOOL)a3
{
  self->_hiddenFromDefaultExpandedView = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailTimestamp, 0);
  objc_storeStrong((id *)&self->_thumbnailFrameNumber, 0);
  objc_storeStrong((id *)&self->_thumbnailClippingRect, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
