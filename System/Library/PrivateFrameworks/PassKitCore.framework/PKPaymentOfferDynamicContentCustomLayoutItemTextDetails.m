@implementation PKPaymentOfferDynamicContentCustomLayoutItemTextDetails

- (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  char v9;
  uint64_t v10;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *v11;
  __CFString *v12;
  __CFString *v13;
  char v14;
  __CFString *v15;
  __CFString *v16;
  char v17;
  __CFString *v18;
  __CFString *v19;
  char v20;
  __CFString *v21;
  __CFString *v22;
  char v23;
  __CFString *v24;
  __CFString *v25;
  char v26;
  __CFString *v27;
  __CFString *v28;
  char v29;
  __CFString *v30;
  __CFString *v31;
  char v32;
  __CFString *v33;
  __CFString *v34;
  char v35;
  __CFString *v36;
  __CFString *v37;
  int v38;
  __CFString *v39;
  __CFString *v40;
  char v41;
  uint64_t v42;
  __CFString *v43;
  __CFString *v44;
  char v45;
  __CFString *v46;
  __CFString *v47;
  int v48;
  char v49;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *v50;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *v51;
  objc_super v53;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("text"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKStringForKey:", CFSTR("altText"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "length"))
    {
      v11 = 0;
LABEL_51:

      goto LABEL_52;
    }
    objc_msgSend(v4, "PKStringForKey:", CFSTR("font"));
    v7 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 == CFSTR("title"))
      goto LABEL_6;
    if (!v7)
      goto LABEL_36;
    v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("title"));

    if ((v9 & 1) != 0)
    {
LABEL_6:
      v10 = 1;
      goto LABEL_37;
    }
    v12 = v8;
    if (v12 == CFSTR("title2")
      || (v13 = v12,
          v14 = -[__CFString isEqualToString:](v12, "isEqualToString:", CFSTR("title2")),
          v13,
          (v14 & 1) != 0))
    {
      v10 = 2;
      goto LABEL_37;
    }
    v15 = v13;
    if (v15 == CFSTR("title3")
      || (v16 = v15,
          v17 = -[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("title3")),
          v16,
          (v17 & 1) != 0))
    {
      v10 = 3;
      goto LABEL_37;
    }
    v18 = v16;
    if (v18 == CFSTR("headline")
      || (v19 = v18,
          v20 = -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("headline")),
          v19,
          (v20 & 1) != 0))
    {
      v10 = 4;
      goto LABEL_37;
    }
    v21 = v19;
    if (v21 == CFSTR("subheadline")
      || (v22 = v21,
          v23 = -[__CFString isEqualToString:](v21, "isEqualToString:", CFSTR("subheadline")),
          v22,
          (v23 & 1) != 0))
    {
      v10 = 5;
      goto LABEL_37;
    }
    v24 = v22;
    if (v24 == CFSTR("body")
      || (v25 = v24,
          v26 = -[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("body")),
          v25,
          (v26 & 1) != 0))
    {
      v10 = 6;
      goto LABEL_37;
    }
    v27 = v25;
    if (v27 == CFSTR("callout")
      || (v28 = v27,
          v29 = -[__CFString isEqualToString:](v27, "isEqualToString:", CFSTR("callout")),
          v28,
          (v29 & 1) != 0))
    {
      v10 = 7;
      goto LABEL_37;
    }
    v30 = v28;
    if (v30 == CFSTR("footnote")
      || (v31 = v30,
          v32 = -[__CFString isEqualToString:](v30, "isEqualToString:", CFSTR("footnote")),
          v31,
          (v32 & 1) != 0))
    {
      v10 = 8;
      goto LABEL_37;
    }
    v33 = v31;
    if (v33 == CFSTR("caption")
      || (v34 = v33,
          v35 = -[__CFString isEqualToString:](v33, "isEqualToString:", CFSTR("caption")),
          v34,
          (v35 & 1) != 0))
    {
      v10 = 9;
      goto LABEL_37;
    }
    v36 = v34;
    if (v36 == CFSTR("caption2")
      || (v37 = v36,
          v38 = -[__CFString isEqualToString:](v36, "isEqualToString:", CFSTR("caption2")),
          v37,
          v38))
    {
      v10 = 10;
    }
    else
    {
LABEL_36:
      v10 = 0;
    }
LABEL_37:

    objc_msgSend(v4, "PKStringForKey:", CFSTR("textColor"));
    v39 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39 != CFSTR("primary"))
    {
      if (v39)
      {
        v41 = -[__CFString isEqualToString:](v39, "isEqualToString:", CFSTR("primary"));

        if ((v41 & 1) != 0)
          goto LABEL_40;
        v43 = v40;
        if (v43 == CFSTR("secondary")
          || (v44 = v43,
              v45 = -[__CFString isEqualToString:](v43, "isEqualToString:", CFSTR("secondary")),
              v44,
              (v45 & 1) != 0))
        {
          v42 = 2;
          goto LABEL_48;
        }
        v46 = v44;
        if (v46 == CFSTR("accentColor")
          || (v47 = v46,
              v48 = -[__CFString isEqualToString:](v46, "isEqualToString:", CFSTR("accentColor")),
              v47,
              v48))
        {
          v42 = 3;
          goto LABEL_48;
        }
      }
      v42 = 0;
      goto LABEL_48;
    }
LABEL_40:
    v42 = 1;
LABEL_48:

    v49 = objc_msgSend(v4, "PKBoolForKey:", CFSTR("bold"));
    v53.receiver = self;
    v53.super_class = (Class)PKPaymentOfferDynamicContentCustomLayoutItemTextDetails;
    v50 = -[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails init](&v53, sel_init);
    v51 = v50;
    if (v50)
    {
      objc_storeStrong((id *)&v50->_text, v5);
      objc_storeStrong((id *)&v51->_altText, v6);
      v51->_font = v10;
      v51->_textColor = v42;
      v51->_bold = v49;
    }
    self = v51;
    v11 = self;
    goto LABEL_51;
  }
  v11 = 0;
LABEL_52:

  return v11;
}

- (id)dictionaryRepresentation
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_text, CFSTR("text"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_altText, CFSTR("altText"));
  v4 = self->_font - 1;
  if (v4 > 9)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD7E28[v4];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("font"));
  v6 = self->_textColor - 1;
  if (v6 > 2)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E2AD7E78[v6];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("textColor"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_bold);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("bold"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *v4;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *v5;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *v6;
  NSString *text;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  _BOOL4 v11;
  BOOL v12;
  NSString *altText;
  NSString *v14;
  _BOOL4 v15;

  v4 = (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *)a3;
  v5 = v4;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        text = v6->_text;
        v8 = self->_text;
        v9 = text;
        if (v8 == v9)
        {

        }
        else
        {
          v10 = v9;
          if (!v8 || !v9)
            goto LABEL_17;
          v11 = -[NSString isEqualToString:](v8, "isEqualToString:", v9);

          if (!v11)
            goto LABEL_22;
        }
        altText = v6->_altText;
        v8 = self->_altText;
        v14 = altText;
        if (v8 == v14)
        {

LABEL_19:
          if (self->_font == v6->_font && self->_textColor == v6->_textColor)
          {
            v12 = self->_bold == v6->_bold;
LABEL_23:

            goto LABEL_24;
          }
LABEL_22:
          v12 = 0;
          goto LABEL_23;
        }
        v10 = v14;
        if (v8 && v14)
        {
          v15 = -[NSString isEqualToString:](v8, "isEqualToString:", v14);

          if (!v15)
            goto LABEL_22;
          goto LABEL_19;
        }
LABEL_17:

        goto LABEL_22;
      }
    }
    v12 = 0;
  }
LABEL_24:

  return v12;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_text);
  objc_msgSend(v3, "safelyAddObject:", self->_altText);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_font - v4 + 32 * v4;
  v6 = self->_textColor - v5 + 32 * v5;
  v7 = self->_bold - v6 + 32 * v6;

  return v7;
}

- (id)description
{
  id v3;
  unint64_t v4;
  const __CFString *v5;
  unint64_t v6;
  const __CFString *v7;
  const __CFString *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("text: '%@'; "), self->_text);
  objc_msgSend(v3, "appendFormat:", CFSTR("altText: '%@'; "), self->_altText);
  v4 = self->_font - 1;
  if (v4 > 9)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD7E28[v4];
  objc_msgSend(v3, "appendFormat:", CFSTR("font: '%@'; "), v5);
  v6 = self->_textColor - 1;
  if (v6 > 2)
    v7 = CFSTR("unknown");
  else
    v7 = off_1E2AD7E78[v6];
  objc_msgSend(v3, "appendFormat:", CFSTR("textColor: '%@'; "), v7);
  if (self->_bold)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("bold: '%@'; "), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentOfferDynamicContentCustomLayoutItemTextDetails)initWithCoder:(id)a3
{
  id v4;
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSString *altText;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaymentOfferDynamicContentCustomLayoutItemTextDetails;
  v5 = -[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("altText"));
    v8 = objc_claimAutoreleasedReturnValue();
    altText = v5->_altText;
    v5->_altText = (NSString *)v8;

    v5->_font = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("font"));
    v5->_textColor = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("textColor"));
    v5->_bold = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("bold"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_altText, CFSTR("altText"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_font, CFSTR("font"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_textColor, CFSTR("textColor"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_bold, CFSTR("bold"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentOfferDynamicContentCustomLayoutItemTextDetails *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSString *altText;

  v5 = -[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails init](+[PKPaymentOfferDynamicContentCustomLayoutItemTextDetails allocWithZone:](PKPaymentOfferDynamicContentCustomLayoutItemTextDetails, "allocWithZone:"), "init");
  v6 = -[NSString copyWithZone:](self->_text, "copyWithZone:", a3);
  text = v5->_text;
  v5->_text = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_altText, "copyWithZone:", a3);
  altText = v5->_altText;
  v5->_altText = (NSString *)v8;

  v5->_font = self->_font;
  v5->_textColor = self->_textColor;
  v5->_bold = self->_bold;
  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (NSString)altText
{
  return self->_altText;
}

- (unint64_t)font
{
  return self->_font;
}

- (unint64_t)textColor
{
  return self->_textColor;
}

- (BOOL)isBold
{
  return self->_bold;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_altText, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
