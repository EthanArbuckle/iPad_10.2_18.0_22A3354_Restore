@implementation TPPBDisposition

- (BOOL)hasAncientEpoch
{
  return self->_ancientEpoch != 0;
}

- (BOOL)hasPolicyProhibits
{
  return self->_policyProhibits != 0;
}

- (BOOL)hasUnknownMachineID
{
  return self->_unknownMachineID != 0;
}

- (BOOL)hasDuplicateMachineID
{
  return self->_duplicateMachineID != 0;
}

- (BOOL)hasDisallowedMachineID
{
  return self->_disallowedMachineID != 0;
}

- (BOOL)hasEvictedMachineID
{
  return self->_evictedMachineID != 0;
}

- (BOOL)hasUnknownReasonRemovalMachineID
{
  return self->_unknownReasonRemovalMachineID != 0;
}

- (BOOL)hasGhostedMachineID
{
  return self->_ghostedMachineID != 0;
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
  v8.super_class = (Class)TPPBDisposition;
  -[TPPBDisposition description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBDisposition dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  TPPBAncientEpoch *ancientEpoch;
  void *v5;
  TPPBPolicyProhibits *policyProhibits;
  void *v7;
  TPPBUnknownMachineID *unknownMachineID;
  void *v9;
  TPPBDispositionDuplicateMachineID *duplicateMachineID;
  void *v11;
  TPPBDispositionDisallowedMachineID *disallowedMachineID;
  void *v13;
  TPPBDispositionEvictedMachineID *evictedMachineID;
  void *v15;
  TPPBDispositionUnknownReasonRemovalMachineID *unknownReasonRemovalMachineID;
  void *v17;
  TPPBDispositionGhostedMachineID *ghostedMachineID;
  void *v19;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ancientEpoch = self->_ancientEpoch;
  if (ancientEpoch)
  {
    -[TPPBAncientEpoch dictionaryRepresentation](ancientEpoch, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("ancientEpoch"));

  }
  policyProhibits = self->_policyProhibits;
  if (policyProhibits)
  {
    -[TPPBPolicyProhibits dictionaryRepresentation](policyProhibits, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("policyProhibits"));

  }
  unknownMachineID = self->_unknownMachineID;
  if (unknownMachineID)
  {
    -[TPPBUnknownMachineID dictionaryRepresentation](unknownMachineID, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("unknownMachineID"));

  }
  duplicateMachineID = self->_duplicateMachineID;
  if (duplicateMachineID)
  {
    -[TPPBDispositionDuplicateMachineID dictionaryRepresentation](duplicateMachineID, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("duplicateMachineID"));

  }
  disallowedMachineID = self->_disallowedMachineID;
  if (disallowedMachineID)
  {
    -[TPPBDispositionDisallowedMachineID dictionaryRepresentation](disallowedMachineID, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("disallowedMachineID"));

  }
  evictedMachineID = self->_evictedMachineID;
  if (evictedMachineID)
  {
    -[TPPBDispositionEvictedMachineID dictionaryRepresentation](evictedMachineID, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("evictedMachineID"));

  }
  unknownReasonRemovalMachineID = self->_unknownReasonRemovalMachineID;
  if (unknownReasonRemovalMachineID)
  {
    -[TPPBDispositionUnknownReasonRemovalMachineID dictionaryRepresentation](unknownReasonRemovalMachineID, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("unknownReasonRemovalMachineID"));

  }
  ghostedMachineID = self->_ghostedMachineID;
  if (ghostedMachineID)
  {
    -[TPPBDispositionGhostedMachineID dictionaryRepresentation](ghostedMachineID, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("ghostedMachineID"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDispositionReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_ancientEpoch)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_policyProhibits)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_unknownMachineID)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_duplicateMachineID)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_disallowedMachineID)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_evictedMachineID)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_unknownReasonRemovalMachineID)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_ghostedMachineID)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_ancientEpoch)
  {
    objc_msgSend(v4, "setAncientEpoch:");
    v4 = v5;
  }
  if (self->_policyProhibits)
  {
    objc_msgSend(v5, "setPolicyProhibits:");
    v4 = v5;
  }
  if (self->_unknownMachineID)
  {
    objc_msgSend(v5, "setUnknownMachineID:");
    v4 = v5;
  }
  if (self->_duplicateMachineID)
  {
    objc_msgSend(v5, "setDuplicateMachineID:");
    v4 = v5;
  }
  if (self->_disallowedMachineID)
  {
    objc_msgSend(v5, "setDisallowedMachineID:");
    v4 = v5;
  }
  if (self->_evictedMachineID)
  {
    objc_msgSend(v5, "setEvictedMachineID:");
    v4 = v5;
  }
  if (self->_unknownReasonRemovalMachineID)
  {
    objc_msgSend(v5, "setUnknownReasonRemovalMachineID:");
    v4 = v5;
  }
  if (self->_ghostedMachineID)
  {
    objc_msgSend(v5, "setGhostedMachineID:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[TPPBAncientEpoch copyWithZone:](self->_ancientEpoch, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[TPPBPolicyProhibits copyWithZone:](self->_policyProhibits, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  v10 = -[TPPBUnknownMachineID copyWithZone:](self->_unknownMachineID, "copyWithZone:", a3);
  v11 = (void *)v5[7];
  v5[7] = v10;

  v12 = -[TPPBDispositionDuplicateMachineID copyWithZone:](self->_duplicateMachineID, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[TPPBDispositionDisallowedMachineID copyWithZone:](self->_disallowedMachineID, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v16 = -[TPPBDispositionEvictedMachineID copyWithZone:](self->_evictedMachineID, "copyWithZone:", a3);
  v17 = (void *)v5[4];
  v5[4] = v16;

  v18 = -[TPPBDispositionUnknownReasonRemovalMachineID copyWithZone:](self->_unknownReasonRemovalMachineID, "copyWithZone:", a3);
  v19 = (void *)v5[8];
  v5[8] = v18;

  v20 = -[TPPBDispositionGhostedMachineID copyWithZone:](self->_ghostedMachineID, "copyWithZone:", a3);
  v21 = (void *)v5[5];
  v5[5] = v20;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  TPPBAncientEpoch *ancientEpoch;
  TPPBPolicyProhibits *policyProhibits;
  TPPBUnknownMachineID *unknownMachineID;
  TPPBDispositionDuplicateMachineID *duplicateMachineID;
  TPPBDispositionDisallowedMachineID *disallowedMachineID;
  TPPBDispositionEvictedMachineID *evictedMachineID;
  TPPBDispositionUnknownReasonRemovalMachineID *unknownReasonRemovalMachineID;
  TPPBDispositionGhostedMachineID *ghostedMachineID;
  char v13;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((ancientEpoch = self->_ancientEpoch, !((unint64_t)ancientEpoch | v4[1]))
     || -[TPPBAncientEpoch isEqual:](ancientEpoch, "isEqual:"))
    && ((policyProhibits = self->_policyProhibits, !((unint64_t)policyProhibits | v4[6]))
     || -[TPPBPolicyProhibits isEqual:](policyProhibits, "isEqual:"))
    && ((unknownMachineID = self->_unknownMachineID, !((unint64_t)unknownMachineID | v4[7]))
     || -[TPPBUnknownMachineID isEqual:](unknownMachineID, "isEqual:"))
    && ((duplicateMachineID = self->_duplicateMachineID, !((unint64_t)duplicateMachineID | v4[3]))
     || -[TPPBDispositionDuplicateMachineID isEqual:](duplicateMachineID, "isEqual:"))
    && ((disallowedMachineID = self->_disallowedMachineID, !((unint64_t)disallowedMachineID | v4[2]))
     || -[TPPBDispositionDisallowedMachineID isEqual:](disallowedMachineID, "isEqual:"))
    && ((evictedMachineID = self->_evictedMachineID, !((unint64_t)evictedMachineID | v4[4]))
     || -[TPPBDispositionEvictedMachineID isEqual:](evictedMachineID, "isEqual:"))
    && ((unknownReasonRemovalMachineID = self->_unknownReasonRemovalMachineID,
         !((unint64_t)unknownReasonRemovalMachineID | v4[8]))
     || -[TPPBDispositionUnknownReasonRemovalMachineID isEqual:](unknownReasonRemovalMachineID, "isEqual:")))
  {
    ghostedMachineID = self->_ghostedMachineID;
    if ((unint64_t)ghostedMachineID | v4[5])
      v13 = -[TPPBDispositionGhostedMachineID isEqual:](ghostedMachineID, "isEqual:");
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v3 = -[TPPBAncientEpoch hash](self->_ancientEpoch, "hash");
  v4 = -[TPPBPolicyProhibits hash](self->_policyProhibits, "hash") ^ v3;
  v5 = -[TPPBUnknownMachineID hash](self->_unknownMachineID, "hash");
  v6 = v4 ^ v5 ^ -[TPPBDispositionDuplicateMachineID hash](self->_duplicateMachineID, "hash");
  v7 = -[TPPBDispositionDisallowedMachineID hash](self->_disallowedMachineID, "hash");
  v8 = v7 ^ -[TPPBDispositionEvictedMachineID hash](self->_evictedMachineID, "hash");
  v9 = v6 ^ v8 ^ -[TPPBDispositionUnknownReasonRemovalMachineID hash](self->_unknownReasonRemovalMachineID, "hash");
  return v9 ^ -[TPPBDispositionGhostedMachineID hash](self->_ghostedMachineID, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  TPPBAncientEpoch *ancientEpoch;
  uint64_t v6;
  TPPBPolicyProhibits *policyProhibits;
  uint64_t v8;
  TPPBUnknownMachineID *unknownMachineID;
  uint64_t v10;
  TPPBDispositionDuplicateMachineID *duplicateMachineID;
  uint64_t v12;
  TPPBDispositionDisallowedMachineID *disallowedMachineID;
  uint64_t v14;
  TPPBDispositionEvictedMachineID *evictedMachineID;
  uint64_t v16;
  TPPBDispositionUnknownReasonRemovalMachineID *unknownReasonRemovalMachineID;
  uint64_t v18;
  TPPBDispositionGhostedMachineID *ghostedMachineID;
  uint64_t v20;
  _QWORD *v21;

  v4 = a3;
  ancientEpoch = self->_ancientEpoch;
  v21 = v4;
  v6 = v4[1];
  if (ancientEpoch)
  {
    if (v6)
      -[TPPBAncientEpoch mergeFrom:](ancientEpoch, "mergeFrom:");
  }
  else if (v6)
  {
    -[TPPBDisposition setAncientEpoch:](self, "setAncientEpoch:");
  }
  policyProhibits = self->_policyProhibits;
  v8 = v21[6];
  if (policyProhibits)
  {
    if (v8)
      -[TPPBPolicyProhibits mergeFrom:](policyProhibits, "mergeFrom:");
  }
  else if (v8)
  {
    -[TPPBDisposition setPolicyProhibits:](self, "setPolicyProhibits:");
  }
  unknownMachineID = self->_unknownMachineID;
  v10 = v21[7];
  if (unknownMachineID)
  {
    if (v10)
      -[TPPBUnknownMachineID mergeFrom:](unknownMachineID, "mergeFrom:");
  }
  else if (v10)
  {
    -[TPPBDisposition setUnknownMachineID:](self, "setUnknownMachineID:");
  }
  duplicateMachineID = self->_duplicateMachineID;
  v12 = v21[3];
  if (duplicateMachineID)
  {
    if (v12)
      -[TPPBDispositionDuplicateMachineID mergeFrom:](duplicateMachineID, "mergeFrom:");
  }
  else if (v12)
  {
    -[TPPBDisposition setDuplicateMachineID:](self, "setDuplicateMachineID:");
  }
  disallowedMachineID = self->_disallowedMachineID;
  v14 = v21[2];
  if (disallowedMachineID)
  {
    if (v14)
      -[TPPBDispositionDisallowedMachineID mergeFrom:](disallowedMachineID, "mergeFrom:");
  }
  else if (v14)
  {
    -[TPPBDisposition setDisallowedMachineID:](self, "setDisallowedMachineID:");
  }
  evictedMachineID = self->_evictedMachineID;
  v16 = v21[4];
  if (evictedMachineID)
  {
    if (v16)
      -[TPPBDispositionEvictedMachineID mergeFrom:](evictedMachineID, "mergeFrom:");
  }
  else if (v16)
  {
    -[TPPBDisposition setEvictedMachineID:](self, "setEvictedMachineID:");
  }
  unknownReasonRemovalMachineID = self->_unknownReasonRemovalMachineID;
  v18 = v21[8];
  if (unknownReasonRemovalMachineID)
  {
    if (v18)
      -[TPPBDispositionUnknownReasonRemovalMachineID mergeFrom:](unknownReasonRemovalMachineID, "mergeFrom:");
  }
  else if (v18)
  {
    -[TPPBDisposition setUnknownReasonRemovalMachineID:](self, "setUnknownReasonRemovalMachineID:");
  }
  ghostedMachineID = self->_ghostedMachineID;
  v20 = v21[5];
  if (ghostedMachineID)
  {
    if (v20)
      -[TPPBDispositionGhostedMachineID mergeFrom:](ghostedMachineID, "mergeFrom:");
  }
  else if (v20)
  {
    -[TPPBDisposition setGhostedMachineID:](self, "setGhostedMachineID:");
  }

}

- (TPPBAncientEpoch)ancientEpoch
{
  return self->_ancientEpoch;
}

- (void)setAncientEpoch:(id)a3
{
  objc_storeStrong((id *)&self->_ancientEpoch, a3);
}

- (TPPBPolicyProhibits)policyProhibits
{
  return self->_policyProhibits;
}

- (void)setPolicyProhibits:(id)a3
{
  objc_storeStrong((id *)&self->_policyProhibits, a3);
}

- (TPPBUnknownMachineID)unknownMachineID
{
  return self->_unknownMachineID;
}

- (void)setUnknownMachineID:(id)a3
{
  objc_storeStrong((id *)&self->_unknownMachineID, a3);
}

- (TPPBDispositionDuplicateMachineID)duplicateMachineID
{
  return self->_duplicateMachineID;
}

- (void)setDuplicateMachineID:(id)a3
{
  objc_storeStrong((id *)&self->_duplicateMachineID, a3);
}

- (TPPBDispositionDisallowedMachineID)disallowedMachineID
{
  return self->_disallowedMachineID;
}

- (void)setDisallowedMachineID:(id)a3
{
  objc_storeStrong((id *)&self->_disallowedMachineID, a3);
}

- (TPPBDispositionEvictedMachineID)evictedMachineID
{
  return self->_evictedMachineID;
}

- (void)setEvictedMachineID:(id)a3
{
  objc_storeStrong((id *)&self->_evictedMachineID, a3);
}

- (TPPBDispositionUnknownReasonRemovalMachineID)unknownReasonRemovalMachineID
{
  return self->_unknownReasonRemovalMachineID;
}

- (void)setUnknownReasonRemovalMachineID:(id)a3
{
  objc_storeStrong((id *)&self->_unknownReasonRemovalMachineID, a3);
}

- (TPPBDispositionGhostedMachineID)ghostedMachineID
{
  return self->_ghostedMachineID;
}

- (void)setGhostedMachineID:(id)a3
{
  objc_storeStrong((id *)&self->_ghostedMachineID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unknownReasonRemovalMachineID, 0);
  objc_storeStrong((id *)&self->_unknownMachineID, 0);
  objc_storeStrong((id *)&self->_policyProhibits, 0);
  objc_storeStrong((id *)&self->_ghostedMachineID, 0);
  objc_storeStrong((id *)&self->_evictedMachineID, 0);
  objc_storeStrong((id *)&self->_duplicateMachineID, 0);
  objc_storeStrong((id *)&self->_disallowedMachineID, 0);
  objc_storeStrong((id *)&self->_ancientEpoch, 0);
}

@end
