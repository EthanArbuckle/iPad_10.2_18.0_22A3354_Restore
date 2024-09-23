@implementation PPSocialHighlightFeedback

- (BOOL)hasClientIdentifier
{
  return self->_clientIdentifier != 0;
}

- (int)feedbackType
{
  if ((*(_BYTE *)&self->_has & 2) != 0)
    return self->_feedbackType;
  else
    return 0;
}

- (void)setFeedbackType:(int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_feedbackType = a3;
}

- (void)setHasFeedbackType:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFeedbackType
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (id)feedbackTypeAsString:(int)a3
{
  if (a3 < 0xB)
    return off_1E7E14AE0[a3];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsFeedbackType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Displayed")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("UserInteracted")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("Hide")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppButton")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ActivityButton")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConsumptionStarted")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConsumptionFinished")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ItemDetailViewed")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ParentDetailViewed")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AppReply")) & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("ConsumedExternally")))
  {
    v4 = 10;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setFeedbackCreationSecondsSinceReferenceDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_feedbackCreationSecondsSinceReferenceDate = a3;
}

- (void)setHasFeedbackCreationSecondsSinceReferenceDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeedbackCreationSecondsSinceReferenceDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasHighlight
{
  return self->_highlight != 0;
}

- (BOOL)hasVariant
{
  return self->_variant != 0;
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
  v8.super_class = (Class)PPSocialHighlightFeedback;
  -[PPSocialHighlightFeedback description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSocialHighlightFeedback dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *clientIdentifier;
  char has;
  uint64_t feedbackType;
  __CFString *v8;
  void *v9;
  PPRankableSocialHighlight *highlight;
  void *v11;
  NSString *variant;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier)
    objc_msgSend(v3, "setObject:forKey:", clientIdentifier, CFSTR("clientIdentifier"));
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    feedbackType = self->_feedbackType;
    if (feedbackType >= 0xB)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_feedbackType);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E7E14AE0[feedbackType];
    }
    objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("feedbackType"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_feedbackCreationSecondsSinceReferenceDate);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("feedbackCreationSecondsSinceReferenceDate"));

  }
  highlight = self->_highlight;
  if (highlight)
  {
    -[PPRankableSocialHighlight dictionaryRepresentation](highlight, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("highlight"));

  }
  variant = self->_variant;
  if (variant)
    objc_msgSend(v4, "setObject:forKey:", variant, CFSTR("variant"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PPSocialHighlightFeedbackReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_clientIdentifier)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_highlight)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_variant)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  v6 = v4;
  if (self->_clientIdentifier)
  {
    objc_msgSend(v4, "setClientIdentifier:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 6) = self->_feedbackType;
    *((_BYTE *)v4 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_feedbackCreationSecondsSinceReferenceDate;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  if (self->_highlight)
  {
    objc_msgSend(v6, "setHighlight:");
    v4 = v6;
  }
  if (self->_variant)
  {
    objc_msgSend(v6, "setVariant:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_clientIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_feedbackType;
    *(_BYTE *)(v5 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(double *)(v5 + 8) = self->_feedbackCreationSecondsSinceReferenceDate;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v9 = -[PPRankableSocialHighlight copyWithZone:](self->_highlight, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v9;

  v11 = -[NSString copyWithZone:](self->_variant, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *clientIdentifier;
  PPRankableSocialHighlight *highlight;
  NSString *variant;
  char v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_18;
  clientIdentifier = self->_clientIdentifier;
  if ((unint64_t)clientIdentifier | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](clientIdentifier, "isEqual:"))
      goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_feedbackType != *((_DWORD *)v4 + 6))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
LABEL_18:
    v8 = 0;
    goto LABEL_19;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_feedbackCreationSecondsSinceReferenceDate != *((double *)v4 + 1))
      goto LABEL_18;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_18;
  }
  highlight = self->_highlight;
  if ((unint64_t)highlight | *((_QWORD *)v4 + 4)
    && !-[PPRankableSocialHighlight isEqual:](highlight, "isEqual:"))
  {
    goto LABEL_18;
  }
  variant = self->_variant;
  if ((unint64_t)variant | *((_QWORD *)v4 + 5))
    v8 = -[NSString isEqual:](variant, "isEqual:");
  else
    v8 = 1;
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  double feedbackCreationSecondsSinceReferenceDate;
  double v6;
  long double v7;
  double v8;
  unint64_t v9;
  unint64_t v10;

  v3 = -[NSString hash](self->_clientIdentifier, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v4 = 2654435761 * self->_feedbackType;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
LABEL_8:
    v9 = 0;
    goto LABEL_11;
  }
  v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_8;
LABEL_3:
  feedbackCreationSecondsSinceReferenceDate = self->_feedbackCreationSecondsSinceReferenceDate;
  v6 = -feedbackCreationSecondsSinceReferenceDate;
  if (feedbackCreationSecondsSinceReferenceDate >= 0.0)
    v6 = self->_feedbackCreationSecondsSinceReferenceDate;
  v7 = floor(v6 + 0.5);
  v8 = (v6 - v7) * 1.84467441e19;
  v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0)
      v9 += (unint64_t)v8;
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  v10 = v4 ^ v3 ^ v9 ^ -[PPRankableSocialHighlight hash](self->_highlight, "hash");
  return v10 ^ -[NSString hash](self->_variant, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  PPRankableSocialHighlight *highlight;
  uint64_t v7;
  id v8;

  v4 = a3;
  v8 = v4;
  if (*((_QWORD *)v4 + 2))
  {
    -[PPSocialHighlightFeedback setClientIdentifier:](self, "setClientIdentifier:");
    v4 = v8;
  }
  v5 = *((_BYTE *)v4 + 48);
  if ((v5 & 2) != 0)
  {
    self->_feedbackType = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v5 = *((_BYTE *)v4 + 48);
  }
  if ((v5 & 1) != 0)
  {
    self->_feedbackCreationSecondsSinceReferenceDate = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  highlight = self->_highlight;
  v7 = *((_QWORD *)v4 + 4);
  if (highlight)
  {
    if (!v7)
      goto LABEL_13;
    -[PPRankableSocialHighlight mergeFrom:](highlight, "mergeFrom:");
  }
  else
  {
    if (!v7)
      goto LABEL_13;
    -[PPSocialHighlightFeedback setHighlight:](self, "setHighlight:");
  }
  v4 = v8;
LABEL_13:
  if (*((_QWORD *)v4 + 5))
  {
    -[PPSocialHighlightFeedback setVariant:](self, "setVariant:");
    v4 = v8;
  }

}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (double)feedbackCreationSecondsSinceReferenceDate
{
  return self->_feedbackCreationSecondsSinceReferenceDate;
}

- (PPRankableSocialHighlight)highlight
{
  return self->_highlight;
}

- (void)setHighlight:(id)a3
{
  objc_storeStrong((id *)&self->_highlight, a3);
}

- (NSString)variant
{
  return self->_variant;
}

- (void)setVariant:(id)a3
{
  objc_storeStrong((id *)&self->_variant, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variant, 0);
  objc_storeStrong((id *)&self->_highlight, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
