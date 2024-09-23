@implementation PeopleSuggesterFeedbackMessage

- (BOOL)hasPrivatizedCandidateIdentifier
{
  return self->_privatizedCandidateIdentifier != 0;
}

- (BOOL)hasPrivatizedTransportBundleId
{
  return self->_privatizedTransportBundleId != 0;
}

- (int)feedbackType
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    return self->_feedbackType;
  else
    return 0;
}

- (void)setFeedbackType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_feedbackType = a3;
}

- (void)setHasFeedbackType:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeedbackType
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)feedbackTypeAsString:(int)a3
{
  if (a3 < 5)
    return off_1E44001D8[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedbackType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ABANDONED")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SUGGESTION_SELECTED")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("INTERACTED_WITH_AFTER_SHARE_DEPRECATED")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("HANDLE_SELECTED_IN_APP_EXTENSION")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("HANDLE_SELECTED_IN_APP")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v8.super_class = (Class)PeopleSuggesterFeedbackMessage;
  -[PeopleSuggesterFeedbackMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PeopleSuggesterFeedbackMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *privatizedCandidateIdentifier;
  NSString *privatizedTransportBundleId;
  uint64_t feedbackType;
  __CFString *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  privatizedCandidateIdentifier = self->_privatizedCandidateIdentifier;
  if (privatizedCandidateIdentifier)
    objc_msgSend(v3, "setObject:forKey:", privatizedCandidateIdentifier, CFSTR("privatizedCandidateIdentifier"));
  privatizedTransportBundleId = self->_privatizedTransportBundleId;
  if (privatizedTransportBundleId)
    objc_msgSend(v4, "setObject:forKey:", privatizedTransportBundleId, CFSTR("privatizedTransportBundleId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    feedbackType = self->_feedbackType;
    if (feedbackType >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedbackType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E44001D8[feedbackType];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("feedbackType"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PeopleSuggesterFeedbackMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_privatizedCandidateIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_privatizedTransportBundleId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_privatizedCandidateIdentifier)
  {
    objc_msgSend(v4, "setPrivatizedCandidateIdentifier:");
    v4 = v5;
  }
  if (self->_privatizedTransportBundleId)
  {
    objc_msgSend(v5, "setPrivatizedTransportBundleId:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v4 + 2) = self->_feedbackType;
    *((_BYTE *)v4 + 32) |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_privatizedCandidateIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSString copyWithZone:](self->_privatizedTransportBundleId, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 8) = self->_feedbackType;
    *(_BYTE *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *privatizedCandidateIdentifier;
  NSString *privatizedTransportBundleId;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  privatizedCandidateIdentifier = self->_privatizedCandidateIdentifier;
  if ((unint64_t)privatizedCandidateIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](privatizedCandidateIdentifier, "isEqual:"))
      goto LABEL_10;
  }
  privatizedTransportBundleId = self->_privatizedTransportBundleId;
  if ((unint64_t)privatizedTransportBundleId | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](privatizedTransportBundleId, "isEqual:"))
      goto LABEL_10;
  }
  v7 = (*((_BYTE *)v4 + 32) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 32) & 1) != 0 && self->_feedbackType == *((_DWORD *)v4 + 2))
    {
      v7 = 1;
      goto LABEL_11;
    }
LABEL_10:
    v7 = 0;
  }
LABEL_11:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_privatizedCandidateIdentifier, "hash");
  v4 = -[NSString hash](self->_privatizedTransportBundleId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_feedbackType;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  int *v4;
  int *v5;

  v4 = (int *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PeopleSuggesterFeedbackMessage setPrivatizedCandidateIdentifier:](self, "setPrivatizedCandidateIdentifier:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 3))
  {
    -[PeopleSuggesterFeedbackMessage setPrivatizedTransportBundleId:](self, "setPrivatizedTransportBundleId:");
    v4 = v5;
  }
  if ((v4[8] & 1) != 0)
  {
    self->_feedbackType = v4[2];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)privatizedCandidateIdentifier
{
  return self->_privatizedCandidateIdentifier;
}

- (void)setPrivatizedCandidateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_privatizedCandidateIdentifier, a3);
}

- (NSString)privatizedTransportBundleId
{
  return self->_privatizedTransportBundleId;
}

- (void)setPrivatizedTransportBundleId:(id)a3
{
  objc_storeStrong((id *)&self->_privatizedTransportBundleId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privatizedTransportBundleId, 0);
  objc_storeStrong((id *)&self->_privatizedCandidateIdentifier, 0);
}

@end
