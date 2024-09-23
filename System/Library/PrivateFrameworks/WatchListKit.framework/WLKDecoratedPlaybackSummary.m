@implementation WLKDecoratedPlaybackSummary

- (WLKDecoratedPlaybackSummary)initWithSummary:(id)a3 canonicalID:(id)a4
{
  id v7;
  id v8;
  WLKDecoratedPlaybackSummary *v9;
  NSString *v10;
  NSString *canonicalID;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WLKDecoratedPlaybackSummary;
  v9 = -[WLKDecoratedPlaybackSummary init](&v13, sel_init);
  if (v9 == self)
  {
    objc_storeStrong((id *)&self->_summary, a3);
    v10 = (NSString *)objc_msgSend(v8, "copy");
    canonicalID = self->_canonicalID;
    self->_canonicalID = v10;

  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WLKDecoratedPlaybackSummary)initWithCoder:(id)a3
{
  id v4;
  WLKDecoratedPlaybackSummary *v5;
  uint64_t v6;
  WLKPlaybackSummary *summary;
  uint64_t v8;
  NSString *canonicalID;
  WLKDecoratedPlaybackSummary *v10;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) != 0)
  {
    v5 = -[WLKDecoratedPlaybackSummary init](self, "init");
    if (v5)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKDecoratedPlaybackSummary.summary"));
      v6 = objc_claimAutoreleasedReturnValue();
      summary = v5->_summary;
      v5->_summary = (WLKPlaybackSummary *)v6;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("WLKDecoratedPlaybackSummary.canonicalID"));
      v8 = objc_claimAutoreleasedReturnValue();
      canonicalID = v5->_canonicalID;
      v5->_canonicalID = (NSString *)v8;

    }
    self = v5;
    v10 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The coder must allow keyed coding."));
  objc_msgSend(v4, "encodeObject:forKey:", self->_summary, CFSTR("WLKDecoratedPlaybackSummary.summary"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_canonicalID, CFSTR("WLKDecoratedPlaybackSummary.canonicalID"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WLKDecoratedPlaybackSummary;
  -[WLKDecoratedPlaybackSummary description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WLKDecoratedPlaybackSummary dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  WLKPlaybackSummary *summary;
  void *v4;
  NSString *canonicalID;
  void *v6;
  void *v7;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("summary");
  summary = self->_summary;
  v4 = summary;
  if (!summary)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v9[1] = CFSTR("canonicalID");
  v10[0] = v4;
  canonicalID = self->_canonicalID;
  v6 = canonicalID;
  if (!canonicalID)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!canonicalID)
  {

    if (summary)
      return v7;
LABEL_9:

    return v7;
  }
  if (!summary)
    goto LABEL_9;
  return v7;
}

- (WLKPlaybackSummary)summary
{
  return self->_summary;
}

- (NSString)canonicalID
{
  return self->_canonicalID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalID, 0);
  objc_storeStrong((id *)&self->_summary, 0);
}

@end
