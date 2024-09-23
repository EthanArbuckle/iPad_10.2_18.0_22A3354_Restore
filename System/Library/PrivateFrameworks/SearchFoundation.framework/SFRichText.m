@implementation SFRichText

- (void)setStarRating:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_starRating = a3;
}

- (BOOL)hasStarRating
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFRichText)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRichText *v6;
  SFRichText *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBRichText initWithData:]([_SFPBRichText alloc], "initWithData:", v5);
  v7 = -[SFRichText initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBRichText *v6;

  v4 = a3;
  v6 = -[_SFPBRichText initWithFacade:]([_SFPBRichText alloc], "initWithFacade:", self);
  -[_SFPBRichText data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBRichText *v2;
  void *v3;

  v2 = -[_SFPBRichText initWithFacade:]([_SFPBRichText alloc], "initWithFacade:", self);
  -[_SFPBRichText dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBRichText *v2;
  void *v3;

  v2 = -[_SFPBRichText initWithFacade:]([_SFPBRichText alloc], "initWithFacade:", self);
  -[_SFPBRichText jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SFRichText;
  v4 = -[SFText copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[SFRichText starRating](self, "starRating");
  objc_msgSend(v4, "setStarRating:");
  -[SFRichText contentAdvisory](self, "contentAdvisory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setContentAdvisory:", v6);

  -[SFRichText icons](self, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setIcons:", v8);

  -[SFRichText formattedTextPieces](self, "formattedTextPieces");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setFormattedTextPieces:", v10);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFRichText *v5;
  SFRichText *v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v5 = (SFRichText *)a3;
  if (self == v5)
  {
    v14 = 1;
  }
  else
  {
    if (-[SFRichText isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v35.receiver = self;
      v35.super_class = (Class)SFRichText;
      if (-[SFText isEqual:](&v35, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFRichText starRating](self, "starRating");
        v8 = v7;
        -[SFRichText starRating](v6, "starRating");
        if (vabdd_f64(v8, v9) >= 2.22044605e-16)
        {
          v14 = 0;
LABEL_34:

          goto LABEL_35;
        }
        -[SFRichText contentAdvisory](self, "contentAdvisory");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFRichText contentAdvisory](v6, "contentAdvisory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v10 == 0) == (v11 != 0))
        {
          v14 = 0;
LABEL_33:

          goto LABEL_34;
        }
        -[SFRichText contentAdvisory](self, "contentAdvisory");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[SFRichText contentAdvisory](self, "contentAdvisory");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFRichText contentAdvisory](v6, "contentAdvisory");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v3, "isEqual:", v13))
          {
            v14 = 0;
            goto LABEL_31;
          }
          v34 = v13;
        }
        -[SFRichText icons](self, "icons");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFRichText icons](v6, "icons");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if ((v15 == 0) == (v16 != 0))
        {

          v14 = 0;
          goto LABEL_30;
        }
        -[SFRichText icons](self, "icons");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v28 = v15;
          -[SFRichText icons](self, "icons");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFRichText icons](v6, "icons");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = v19;
          if (!objc_msgSend(v19, "isEqual:"))
          {
            v14 = 0;
            v15 = v28;
            goto LABEL_28;
          }
          v30 = v18;
          v33 = v3;
          v15 = v28;
        }
        else
        {
          v30 = 0;
          v33 = v3;
        }
        -[SFRichText formattedTextPieces](self, "formattedTextPieces");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFRichText formattedTextPieces](v6, "formattedTextPieces");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v20 == 0) == (v21 != 0))
        {

          v14 = 0;
          v3 = v33;
          v18 = v30;
          if (!v30)
            goto LABEL_29;
        }
        else
        {
          v27 = v20;
          v29 = v21;
          -[SFRichText formattedTextPieces](self, "formattedTextPieces");
          v22 = objc_claimAutoreleasedReturnValue();
          v18 = v30;
          if (v22)
          {
            v26 = (void *)v22;
            -[SFRichText formattedTextPieces](self, "formattedTextPieces");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFRichText formattedTextPieces](v6, "formattedTextPieces");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v25, "isEqual:");

          }
          else
          {

            v14 = 1;
          }
          v3 = v33;
          if (!v30)
            goto LABEL_29;
        }
LABEL_28:

LABEL_29:
LABEL_30:
        v13 = v34;
        if (!v12)
        {
LABEL_32:

          goto LABEL_33;
        }
LABEL_31:

        goto LABEL_32;
      }
    }
    v14 = 0;
  }
LABEL_35:

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3;
  double v4;
  double v5;
  long double v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SFRichText;
  v3 = -[SFText hash](&v15, sel_hash);
  -[SFRichText starRating](self, "starRating");
  v5 = -v4;
  if (v4 >= 0.0)
    v5 = v4;
  v6 = round(v5);
  v7 = (unint64_t)(fmod(v6, 1.84467441e19) * 2654435760.0) + vcvtd_n_u64_f64(v5 - v6, 0x40uLL);
  -[SFRichText contentAdvisory](self, "contentAdvisory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hash");
  -[SFRichText icons](self, "icons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hash");
  -[SFRichText formattedTextPieces](self, "formattedTextPieces");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v9 ^ v11 ^ v3 ^ objc_msgSend(v12, "hash") ^ v7;

  return v13;
}

- (double)starRating
{
  return self->_starRating;
}

- (NSString)contentAdvisory
{
  return self->_contentAdvisory;
}

- (void)setContentAdvisory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)formattedTextPieces
{
  return self->_formattedTextPieces;
}

- (void)setFormattedTextPieces:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedTextPieces, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_contentAdvisory, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFRichText)initWithProtobuf:(id)a3
{
  id v4;
  void *v5;
  SFRichText *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  SFImage *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  SFFormattedText *v26;
  SFRichText *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37.receiver = self;
  v37.super_class = (Class)SFRichText;
  v6 = -[SFText initWithProtobuf:](&v37, sel_initWithProtobuf_, v5);

  if (v6)
  {
    objc_msgSend(v4, "starRating");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v4, "starRating");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      -[SFRichText setStarRating:](v6, "setStarRating:");

    }
    objc_msgSend(v4, "contentAdvisory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "contentAdvisory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFRichText setContentAdvisory:](v6, "setContentAdvisory:", v10);

    }
    objc_msgSend(v4, "icons");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v12 = 0;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    objc_msgSend(v4, "icons");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = -[SFImage initWithProtobuf:]([SFImage alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
          if (v18)
            objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v15);
    }

    -[SFRichText setIcons:](v6, "setIcons:", v12);
    objc_msgSend(v4, "formattedTextPieces");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    else
      v20 = 0;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    objc_msgSend(v4, "formattedTextPieces", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v30 != v24)
            objc_enumerationMutation(v21);
          v26 = -[SFFormattedText initWithProtobuf:]([SFFormattedText alloc], "initWithProtobuf:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j));
          if (v26)
            objc_msgSend(v20, "addObject:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      }
      while (v23);
    }

    -[SFRichText setFormattedTextPieces:](v6, "setFormattedTextPieces:", v20);
    v27 = v6;

  }
  return v6;
}

- (void)loadRichTextWithCompletionHandler:(id)a3
{
  (*((void (**)(id))a3 + 2))(a3);
}

@end
