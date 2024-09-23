@implementation PKBarcode

- (int64_t)format
{
  return self->_format;
}

- (NSString)altText
{
  return self->_altText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altText, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
}

- (BOOL)shouldRemoveQuietZone
{
  return self->_shouldRemoveQuietZone;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *messageData;
  id v5;

  messageData = self->_messageData;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", messageData, CFSTR("message"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_format, CFSTR("format"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_options, CFSTR("options"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altText, CFSTR("altText"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_header, CFSTR("header"));

}

- (PKBarcode)initWithPassDictionary:(id)a3 bundle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  PKBarcode *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  int isKindOfClass;
  __CFString *v31;
  CFStringEncoding v32;
  NSData *v33;
  NSData *messageData;
  int v35;
  void *v36;
  void *v37;
  NSString *v38;
  NSString *altText;
  NSString *v40;
  NSString *header;
  void *v43;
  id v44;
  PKBarcode *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  objc_super v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v51.receiver = self;
    v51.super_class = (Class)PKBarcode;
    self = -[PKBarcode init](&v51, sel_init);
    if (!self)
    {
LABEL_38:
      self = self;
      v9 = self;
      goto LABEL_41;
    }
    objc_msgSend(v6, "objectForKey:", CFSTR("barcodes"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        v12 = 0;
LABEL_28:

        v9 = 0;
        goto LABEL_41;
      }
      v46 = v8;
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v11 = v10;
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v12)
      {
        v43 = v10;
        v44 = v6;
        v45 = self;
        v13 = *(_QWORD *)v48;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v48 != v13)
              objc_enumerationMutation(v11);
            v15 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)i);
            objc_msgSend(v15, "PKStringForKey:", CFSTR("format"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (v16)
            {
              v24 = MEMORY[0x1E0CB37E8];
              v18 = v16;
              objc_msgSend((id)v24, "numberWithInt:", 0);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v24) = _PKEnumValueFromString(v18, v19, (uint64_t)CFSTR("PKBarcodeFormat"), CFSTR("PKBarcodeFormatUnknown, PKBarcodeFormatQR, PKBarcodeFormatPDF417, PKBarcodeFormatAztec, PKBarcodeFormatCode128"), v20, v21, v22, v23, 0);

              if ((_DWORD)v24)
              {
                v24 = (int)v24;
                v12 = v15;
                v10 = v43;
                v6 = v44;
                goto LABEL_21;
              }
            }

          }
          v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
          if (v12)
            continue;
          break;
        }
        v24 = 0;
        v6 = v44;
        self = v45;
        v10 = v43;
        goto LABEL_22;
      }
    }
    else
    {
      v46 = v8;
      objc_msgSend(v6, "PKDictionaryForKey:", CFSTR("barcode"));
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "PKStringForKey:", CFSTR("format"));
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11)
      {
        v45 = self;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
        v18 = (id)objc_claimAutoreleasedReturnValue();
        v24 = (int)_PKEnumValueFromString(v11, v18, (uint64_t)CFSTR("PKBarcodeFormat"), CFSTR("PKBarcodeFormatUnknown, PKBarcodeFormatQR, PKBarcodeFormatPDF417, PKBarcodeFormatAztec, PKBarcodeFormatCode128"), v25, v26, v27, v28, 0);
LABEL_21:

        self = v45;
        goto LABEL_22;
      }
    }
    v24 = 0;
LABEL_22:

    if (v24)
    {
      self->_format = v24;
      objc_msgSend(v12, "objectForKey:", CFSTR("message"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      objc_msgSend(v12, "objectForKey:", CFSTR("messageEncoding"));
      v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & isKindOfClass & 1) == 0)
          goto LABEL_32;
        v32 = CFStringConvertIANACharSetNameToEncoding(v31);
        if (!v32)
          goto LABEL_32;
      }
      else
      {
        if ((isKindOfClass & 1) == 0)
        {
LABEL_32:
          v35 = 0;
LABEL_33:
          objc_msgSend(v12, "objectForKey:", CFSTR("altText"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (v36)
          {
            objc_opt_class();
            v35 &= objc_opt_isKindOfClass();
          }
          objc_msgSend(v12, "objectForKey:", CFSTR("header"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if (v37)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & v35 & 1) != 0)
            {
LABEL_37:
              v8 = v46;
              PKLocalizedPassStringForPassBundle(v36, v46, 0);
              v38 = (NSString *)objc_claimAutoreleasedReturnValue();
              altText = self->_altText;
              self->_altText = v38;

              PKLocalizedPassStringForPassBundle(v37, v46, 0);
              v40 = (NSString *)objc_claimAutoreleasedReturnValue();
              header = self->_header;
              self->_header = v40;

              goto LABEL_38;
            }
          }
          else if (v35)
          {
            goto LABEL_37;
          }

          v9 = 0;
          v8 = v46;
          goto LABEL_41;
        }
        v32 = 513;
      }
      objc_msgSend(v29, "dataUsingEncoding:", CFStringConvertEncodingToNSStringEncoding(v32));
      v33 = (NSData *)objc_claimAutoreleasedReturnValue();
      messageData = self->_messageData;
      self->_messageData = v33;

      v35 = 1;
      goto LABEL_33;
    }
    v8 = v46;
    goto LABEL_28;
  }
LABEL_41:

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKBarcode)initWithCoder:(id)a3
{
  id v4;
  PKBarcode *v5;
  uint64_t v6;
  NSData *messageData;
  uint64_t v8;
  NSDictionary *options;
  uint64_t v10;
  NSString *altText;
  uint64_t v12;
  NSString *header;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKBarcode;
  v5 = -[PKBarcode init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("message"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageData = v5->_messageData;
    v5->_messageData = (NSData *)v6;

    v5->_format = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("format"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("options"));
    v8 = objc_claimAutoreleasedReturnValue();
    options = v5->_options;
    v5->_options = (NSDictionary *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altText"));
    v10 = objc_claimAutoreleasedReturnValue();
    altText = v5->_altText;
    v5->_altText = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("header"));
    v12 = objc_claimAutoreleasedReturnValue();
    header = v5->_header;
    v5->_header = (NSString *)v12;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSDictionary *options;
  NSDictionary *v7;
  char v8;
  NSData *messageData;
  NSData *v10;
  NSString *altText;
  NSString *v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (self->_format == v5[6])
    {
      options = self->_options;
      v7 = (NSDictionary *)v5[3];
      if (options && v7)
      {
        if ((-[NSDictionary isEqual:](options, "isEqual:") & 1) == 0)
          goto LABEL_16;
      }
      else if (options != v7)
      {
        goto LABEL_16;
      }
      messageData = self->_messageData;
      v10 = (NSData *)v5[2];
      if (messageData && v10)
      {
        if ((-[NSData isEqual:](messageData, "isEqual:") & 1) != 0)
        {
LABEL_12:
          altText = self->_altText;
          v12 = (NSString *)v5[5];
          if (altText && v12)
            v8 = -[NSString isEqual:](altText, "isEqual:");
          else
            v8 = altText == v12;
          goto LABEL_17;
        }
      }
      else if (messageData == v10)
      {
        goto LABEL_12;
      }
    }
LABEL_16:
    v8 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v8 = 0;
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  return -[NSData hash](self->_messageData, "hash");
}

- (PKBarcode)init
{
  PKBarcode *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKBarcode;
  result = -[PKBarcode init](&v3, sel_init);
  if (result)
    result->_format = 0;
  return result;
}

- (BOOL)isTall
{
  return (self->_format & 0xFFFFFFFFFFFFFFFDLL) == 1;
}

- (void)setMessageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setAltText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setFormat:(int64_t)a3
{
  self->_format = a3;
}

- (void)setShouldRemoveQuietZone:(BOOL)a3
{
  self->_shouldRemoveQuietZone = a3;
}

@end
