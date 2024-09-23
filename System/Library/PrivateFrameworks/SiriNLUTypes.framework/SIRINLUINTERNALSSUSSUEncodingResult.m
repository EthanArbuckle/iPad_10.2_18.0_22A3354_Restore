@implementation SIRINLUINTERNALSSUSSUEncodingResult

- (void)dealloc
{
  objc_super v3;

  PBRepeatedFloatClear();
  v3.receiver = self;
  v3.super_class = (Class)SIRINLUINTERNALSSUSSUEncodingResult;
  -[SIRINLUINTERNALSSUSSUEncodingResult dealloc](&v3, sel_dealloc);
}

- (BOOL)hasRequestId
{
  return self->_requestId != 0;
}

- (BOOL)hasSsuEncoderVersion
{
  return self->_ssuEncoderVersion != 0;
}

- (BOOL)hasUtterance
{
  return self->_utterance != 0;
}

- (unint64_t)encodingsCount
{
  return self->_encodings.count;
}

- (float)encodings
{
  return self->_encodings.list;
}

- (void)clearEncodings
{
  PBRepeatedFloatClear();
}

- (void)addEncoding:(float)a3
{
  PBRepeatedFloatAdd();
}

- (float)encodingAtIndex:(unint64_t)a3
{
  $7401700F6E393C0442CED440453508D3 *p_encodings;
  unint64_t count;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  p_encodings = &self->_encodings;
  count = self->_encodings.count;
  if (count <= a3)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99858];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("idx (%lu) is out of range (%lu)"), a3, count);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "raise");

  }
  return p_encodings->list[a3];
}

- (void)setEncodings:(float *)a3 count:(unint64_t)a4
{
  PBRepeatedFloatSet();
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
  v8.super_class = (Class)SIRINLUINTERNALSSUSSUEncodingResult;
  -[SIRINLUINTERNALSSUSSUEncodingResult description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUINTERNALSSUSSUEncodingResult dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *requestId;
  NSString *ssuEncoderVersion;
  NSString *utterance;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  requestId = self->_requestId;
  if (requestId)
    objc_msgSend(v3, "setObject:forKey:", requestId, CFSTR("requestId"));
  ssuEncoderVersion = self->_ssuEncoderVersion;
  if (ssuEncoderVersion)
    objc_msgSend(v4, "setObject:forKey:", ssuEncoderVersion, CFSTR("ssuEncoderVersion"));
  utterance = self->_utterance;
  if (utterance)
    objc_msgSend(v4, "setObject:forKey:", utterance, CFSTR("utterance"));
  PBRepeatedFloatNSArray();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("encoding"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALSSUSSUEncodingResultReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  $7401700F6E393C0442CED440453508D3 *p_encodings;
  unint64_t v6;
  id v7;

  v4 = a3;
  v7 = v4;
  if (self->_requestId)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_ssuEncoderVersion)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  if (self->_utterance)
  {
    PBDataWriterWriteStringField();
    v4 = v7;
  }
  p_encodings = &self->_encodings;
  if (p_encodings->count)
  {
    v6 = 0;
    do
    {
      PBDataWriterWriteFloatField();
      v4 = v7;
      ++v6;
    }
    while (v6 < p_encodings->count);
  }

}

- (void)copyTo:(id)a3
{
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  id v7;

  v7 = a3;
  if (self->_requestId)
    objc_msgSend(v7, "setRequestId:");
  if (self->_ssuEncoderVersion)
    objc_msgSend(v7, "setSsuEncoderVersion:");
  if (self->_utterance)
    objc_msgSend(v7, "setUtterance:");
  if (-[SIRINLUINTERNALSSUSSUEncodingResult encodingsCount](self, "encodingsCount"))
  {
    objc_msgSend(v7, "clearEncodings");
    v4 = -[SIRINLUINTERNALSSUSSUEncodingResult encodingsCount](self, "encodingsCount");
    if (v4)
    {
      v5 = v4;
      for (i = 0; i != v5; ++i)
      {
        -[SIRINLUINTERNALSSUSSUEncodingResult encodingAtIndex:](self, "encodingAtIndex:", i);
        objc_msgSend(v7, "addEncoding:");
      }
    }
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_requestId, "copyWithZone:", a3);
  v7 = (void *)v5[4];
  v5[4] = v6;

  v8 = -[NSString copyWithZone:](self->_ssuEncoderVersion, "copyWithZone:", a3);
  v9 = (void *)v5[5];
  v5[5] = v8;

  v10 = -[NSString copyWithZone:](self->_utterance, "copyWithZone:", a3);
  v11 = (void *)v5[6];
  v5[6] = v10;

  PBRepeatedFloatCopy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *requestId;
  NSString *ssuEncoderVersion;
  NSString *utterance;
  char IsEqual;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((requestId = self->_requestId, !((unint64_t)requestId | v4[4]))
     || -[NSString isEqual:](requestId, "isEqual:"))
    && ((ssuEncoderVersion = self->_ssuEncoderVersion, !((unint64_t)ssuEncoderVersion | v4[5]))
     || -[NSString isEqual:](ssuEncoderVersion, "isEqual:"))
    && ((utterance = self->_utterance, !((unint64_t)utterance | v4[6]))
     || -[NSString isEqual:](utterance, "isEqual:")))
  {
    IsEqual = PBRepeatedFloatIsEqual();
  }
  else
  {
    IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_requestId, "hash");
  v4 = -[NSString hash](self->_ssuEncoderVersion, "hash") ^ v3;
  v5 = -[NSString hash](self->_utterance, "hash");
  return v4 ^ v5 ^ PBRepeatedFloatHash();
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  _QWORD *v8;

  v4 = a3;
  v8 = v4;
  if (v4[4])
  {
    -[SIRINLUINTERNALSSUSSUEncodingResult setRequestId:](self, "setRequestId:");
    v4 = v8;
  }
  if (v4[5])
  {
    -[SIRINLUINTERNALSSUSSUEncodingResult setSsuEncoderVersion:](self, "setSsuEncoderVersion:");
    v4 = v8;
  }
  if (v4[6])
  {
    -[SIRINLUINTERNALSSUSSUEncodingResult setUtterance:](self, "setUtterance:");
    v4 = v8;
  }
  v5 = objc_msgSend(v4, "encodingsCount");
  if (v5)
  {
    v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      objc_msgSend(v8, "encodingAtIndex:", i);
      -[SIRINLUINTERNALSSUSSUEncodingResult addEncoding:](self, "addEncoding:");
    }
  }

}

- (NSString)requestId
{
  return self->_requestId;
}

- (void)setRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_requestId, a3);
}

- (NSString)ssuEncoderVersion
{
  return self->_ssuEncoderVersion;
}

- (void)setSsuEncoderVersion:(id)a3
{
  objc_storeStrong((id *)&self->_ssuEncoderVersion, a3);
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_storeStrong((id *)&self->_utterance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_ssuEncoderVersion, 0);
  objc_storeStrong((id *)&self->_requestId, 0);
}

@end
