@implementation PREResponsesExperimentMessage

- (void)encodeWithCoder:(id)a3
{
  NSString *title;
  id v5;

  title = self->_title;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", title, CFSTR("title"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_senderIdentifier, CFSTR("senderIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_summaryString, CFSTR("summaryString"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_tapBack, CFSTR("tapBack"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_emote, CFSTR("emote"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_read, CFSTR("read"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateSent, CFSTR("dateSent"));

}

- (PREResponsesExperimentMessage)initWithCoder:(id)a3
{
  id v4;
  PREResponsesExperimentMessage *v5;
  void *v6;
  uint64_t v7;
  NSString *title;
  void *v9;
  uint64_t v10;
  NSString *senderIdentifier;
  void *v12;
  uint64_t v13;
  NSString *summaryString;
  uint64_t v15;
  NSDate *dateSent;
  PREResponsesExperimentMessage *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PREResponsesExperimentMessage;
  v5 = -[PREResponsesExperimentMessage init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("senderIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    senderIdentifier = v5->_senderIdentifier;
    v5->_senderIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("summaryString"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    summaryString = v5->_summaryString;
    v5->_summaryString = (NSString *)v13;

    v5->_tapBack = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("tapBack"));
    v5->_emote = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("emote"));
    v5->_read = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("read"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateSent"));
    v15 = objc_claimAutoreleasedReturnValue();
    dateSent = v5->_dateSent;
    v5->_dateSent = (NSDate *)v15;

    v17 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_opt_new();
  v5 = (void *)-[NSString copy](self->_title, "copy");
  objc_msgSend(v4, "setTitle:", v5);

  v6 = (void *)-[NSString copy](self->_senderIdentifier, "copy");
  objc_msgSend(v4, "setSenderIdentifier:", v6);

  v7 = (void *)-[NSString copy](self->_summaryString, "copy");
  objc_msgSend(v4, "setSummaryString:", v7);

  objc_msgSend(v4, "setTapBack:", self->_tapBack);
  objc_msgSend(v4, "setEmote:", self->_emote);
  objc_msgSend(v4, "setRead:", self->_read);
  v8 = (void *)-[NSDate copy](self->_dateSent, "copy");
  objc_msgSend(v4, "setDateSent:", v8);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PREResponsesExperimentMessage *v4;
  uint64_t v5;
  char v6;
  PREResponsesExperimentMessage *v7;
  unint64_t v8;
  NSString *title;
  void *v10;
  NSString *senderIdentifier;
  void *v12;
  NSString *summaryString;
  void *v14;
  _BOOL4 tapBack;
  _BOOL4 emote;
  _BOOL4 read;
  NSDate *dateSent;
  void *v19;

  v4 = (PREResponsesExperimentMessage *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      v7 = v4;
      v8 = -[PREResponsesExperimentMessage hash](self, "hash");
      if (v8 == -[PREResponsesExperimentMessage hash](v7, "hash"))
      {
        title = self->_title;
        -[PREResponsesExperimentMessage title](v7, "title");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](title, "isEqualToString:", v10))
        {
          senderIdentifier = self->_senderIdentifier;
          -[PREResponsesExperimentMessage senderIdentifier](v7, "senderIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSString isEqualToString:](senderIdentifier, "isEqualToString:", v12))
          {
            summaryString = self->_summaryString;
            -[PREResponsesExperimentMessage summaryString](v7, "summaryString");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSString isEqualToString:](summaryString, "isEqualToString:", v14)
              && (tapBack = self->_tapBack, tapBack == -[PREResponsesExperimentMessage isTapBack](v7, "isTapBack"))
              && (emote = self->_emote, emote == -[PREResponsesExperimentMessage isEmote](v7, "isEmote"))
              && (read = self->_read, read == -[PREResponsesExperimentMessage isRead](v7, "isRead")))
            {
              dateSent = self->_dateSent;
              -[PREResponsesExperimentMessage dateSent](v7, "dateSent");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = -[NSDate isEqualToDate:](dateSent, "isEqualToDate:", v19);

            }
            else
            {
              v6 = 0;
            }

          }
          else
          {
            v6 = 0;
          }

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[PREResponsesExperimentMessage title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PREResponsesExperimentMessage senderIdentifier](self, "senderIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 + objc_msgSend(v5, "hash");
  -[PREResponsesExperimentMessage summaryString](self, "summaryString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[PREResponsesExperimentMessage dateSent](self, "dateSent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 + v8 + objc_msgSend(v9, "hash") + 31;

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)senderIdentifier
{
  return self->_senderIdentifier;
}

- (void)setSenderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)summaryString
{
  return self->_summaryString;
}

- (void)setSummaryString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isTapBack
{
  return self->_tapBack;
}

- (void)setTapBack:(BOOL)a3
{
  self->_tapBack = a3;
}

- (BOOL)isEmote
{
  return self->_emote;
}

- (void)setEmote:(BOOL)a3
{
  self->_emote = a3;
}

- (BOOL)isRead
{
  return self->_read;
}

- (void)setRead:(BOOL)a3
{
  self->_read = a3;
}

- (NSDate)dateSent
{
  return self->_dateSent;
}

- (void)setDateSent:(id)a3
{
  objc_storeStrong((id *)&self->_dateSent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSent, 0);
  objc_storeStrong((id *)&self->_summaryString, 0);
  objc_storeStrong((id *)&self->_senderIdentifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
