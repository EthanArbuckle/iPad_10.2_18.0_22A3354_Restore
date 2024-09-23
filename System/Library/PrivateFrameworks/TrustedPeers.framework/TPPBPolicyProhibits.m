@implementation TPPBPolicyProhibits

- (void)setPolicyVersion:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_policyVersion = a3;
}

- (void)setHasPolicyVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPolicyVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSponsorId
{
  return self->_sponsorId != 0;
}

- (BOOL)hasSponsorCategory
{
  return self->_sponsorCategory != 0;
}

- (BOOL)hasCandidateCategory
{
  return self->_candidateCategory != 0;
}

- (BOOL)hasExplanation
{
  return self->_explanation != 0;
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
  v8.super_class = (Class)TPPBPolicyProhibits;
  -[TPPBPolicyProhibits description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBPolicyProhibits dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *sponsorId;
  NSString *sponsorCategory;
  NSString *candidateCategory;
  NSString *explanation;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_policyVersion);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("policy_version"));

  }
  sponsorId = self->_sponsorId;
  if (sponsorId)
    objc_msgSend(v3, "setObject:forKey:", sponsorId, CFSTR("sponsor_id"));
  sponsorCategory = self->_sponsorCategory;
  if (sponsorCategory)
    objc_msgSend(v3, "setObject:forKey:", sponsorCategory, CFSTR("sponsor_category"));
  candidateCategory = self->_candidateCategory;
  if (candidateCategory)
    objc_msgSend(v3, "setObject:forKey:", candidateCategory, CFSTR("candidate_category"));
  explanation = self->_explanation;
  if (explanation)
    objc_msgSend(v3, "setObject:forKey:", explanation, CFSTR("explanation"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPolicyProhibitsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v5;
  }
  if (self->_sponsorId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_sponsorCategory)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_candidateCategory)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_explanation)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[1] = self->_policyVersion;
    *((_BYTE *)v4 + 48) |= 1u;
  }
  v5 = v4;
  if (self->_sponsorId)
  {
    objc_msgSend(v4, "setSponsorId:");
    v4 = v5;
  }
  if (self->_sponsorCategory)
  {
    objc_msgSend(v5, "setSponsorCategory:");
    v4 = v5;
  }
  if (self->_candidateCategory)
  {
    objc_msgSend(v5, "setCandidateCategory:");
    v4 = v5;
  }
  if (self->_explanation)
  {
    objc_msgSend(v5, "setExplanation:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_policyVersion;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_sponsorId, "copyWithZone:", a3);
  v8 = (void *)v6[5];
  v6[5] = v7;

  v9 = -[NSString copyWithZone:](self->_sponsorCategory, "copyWithZone:", a3);
  v10 = (void *)v6[4];
  v6[4] = v9;

  v11 = -[NSString copyWithZone:](self->_candidateCategory, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  v13 = -[NSString copyWithZone:](self->_explanation, "copyWithZone:", a3);
  v14 = (void *)v6[3];
  v6[3] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *sponsorId;
  NSString *sponsorCategory;
  NSString *candidateCategory;
  NSString *explanation;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_policyVersion != *((_QWORD *)v4 + 1))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  sponsorId = self->_sponsorId;
  if ((unint64_t)sponsorId | *((_QWORD *)v4 + 5) && !-[NSString isEqual:](sponsorId, "isEqual:"))
    goto LABEL_15;
  sponsorCategory = self->_sponsorCategory;
  if ((unint64_t)sponsorCategory | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](sponsorCategory, "isEqual:"))
      goto LABEL_15;
  }
  candidateCategory = self->_candidateCategory;
  if ((unint64_t)candidateCategory | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](candidateCategory, "isEqual:"))
      goto LABEL_15;
  }
  explanation = self->_explanation;
  if ((unint64_t)explanation | *((_QWORD *)v4 + 3))
    v9 = -[NSString isEqual:](explanation, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761u * self->_policyVersion;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_sponsorId, "hash") ^ v3;
  v5 = -[NSString hash](self->_sponsorCategory, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_candidateCategory, "hash");
  return v6 ^ -[NSString hash](self->_explanation, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  if ((v4[6] & 1) != 0)
  {
    self->_policyVersion = v4[1];
    *(_BYTE *)&self->_has |= 1u;
  }
  v5 = v4;
  if (v4[5])
  {
    -[TPPBPolicyProhibits setSponsorId:](self, "setSponsorId:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[TPPBPolicyProhibits setSponsorCategory:](self, "setSponsorCategory:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[TPPBPolicyProhibits setCandidateCategory:](self, "setCandidateCategory:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[TPPBPolicyProhibits setExplanation:](self, "setExplanation:");
    v4 = v5;
  }

}

- (unint64_t)policyVersion
{
  return self->_policyVersion;
}

- (NSString)sponsorId
{
  return self->_sponsorId;
}

- (void)setSponsorId:(id)a3
{
  objc_storeStrong((id *)&self->_sponsorId, a3);
}

- (NSString)sponsorCategory
{
  return self->_sponsorCategory;
}

- (void)setSponsorCategory:(id)a3
{
  objc_storeStrong((id *)&self->_sponsorCategory, a3);
}

- (NSString)candidateCategory
{
  return self->_candidateCategory;
}

- (void)setCandidateCategory:(id)a3
{
  objc_storeStrong((id *)&self->_candidateCategory, a3);
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
  objc_storeStrong((id *)&self->_explanation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sponsorId, 0);
  objc_storeStrong((id *)&self->_sponsorCategory, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_candidateCategory, 0);
}

@end
