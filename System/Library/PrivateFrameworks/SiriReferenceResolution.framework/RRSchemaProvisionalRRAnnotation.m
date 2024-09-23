@implementation RRSchemaProvisionalRRAnnotation

- (void)setName:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_name = a3;
}

- (BOOL)hasName
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setHasName:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (void)setAnnotationAddedTimestampInSeconds:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_annotationAddedTimestampInSeconds = a3;
}

- (BOOL)hasAnnotationAddedTimestampInSeconds
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setHasAnnotationAddedTimestampInSeconds:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalRRAnnotationReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v6;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    v4 = v6;
  }

}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  $0E6D5F6156607B3C37387977E703F110 has;
  int v6;
  int name;
  unint64_t annotationAddedTimestampInSeconds;
  BOOL v9;

  v4 = (unsigned __int8 *)a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_10;
  has = self->_has;
  v6 = v4[24];
  if ((v6 & 1) != (*(_BYTE *)&has & 1))
    goto LABEL_10;
  if ((*(_BYTE *)&has & 1) != 0)
  {
    name = self->_name;
    if (name != objc_msgSend(v4, "name"))
    {
LABEL_10:
      v9 = 0;
      goto LABEL_11;
    }
    has = self->_has;
    v6 = v4[24];
  }
  if (((v6 ^ *(_DWORD *)&has) & 2) != 0)
    goto LABEL_10;
  if ((*(_BYTE *)&has & 2) != 0)
  {
    annotationAddedTimestampInSeconds = self->_annotationAddedTimestampInSeconds;
    if (annotationAddedTimestampInSeconds != objc_msgSend(v4, "annotationAddedTimestampInSeconds"))
      goto LABEL_10;
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v2;
  unint64_t v3;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v2 = 2654435761 * self->_name;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v3 = 0;
    return v3 ^ v2;
  }
  v2 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v3 = 2654435761u * self->_annotationAddedTimestampInSeconds;
  return v3 ^ v2;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  unsigned int v6;
  const __CFString *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", -[RRSchemaProvisionalRRAnnotation annotationAddedTimestampInSeconds](self, "annotationAddedTimestampInSeconds"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("annotationAddedTimestampInSeconds"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    v6 = -[RRSchemaProvisionalRRAnnotation name](self, "name") - 1;
    if (v6 > 4)
      v7 = CFSTR("RRANNOTATIONNAME_UNKNOWN");
    else
      v7 = *(&off_24CDCC0C0 + v6);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("name"));
  }
  -[RRSchemaProvisionalRRAnnotation willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[RRSchemaProvisionalRRAnnotation dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (RRSchemaProvisionalRRAnnotation)initWithJSON:(id)a3
{
  void *v4;
  RRSchemaProvisionalRRAnnotation *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[RRSchemaProvisionalRRAnnotation initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (RRSchemaProvisionalRRAnnotation)initWithDictionary:(id)a3
{
  id v4;
  RRSchemaProvisionalRRAnnotation *v5;
  void *v6;
  void *v7;
  RRSchemaProvisionalRRAnnotation *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RRSchemaProvisionalRRAnnotation;
  v5 = -[RRSchemaProvisionalRRAnnotation init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RRSchemaProvisionalRRAnnotation setName:](v5, "setName:", objc_msgSend(v6, "intValue"));
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("annotationAddedTimestampInSeconds"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RRSchemaProvisionalRRAnnotation setAnnotationAddedTimestampInSeconds:](v5, "setAnnotationAddedTimestampInSeconds:", objc_msgSend(v7, "unsignedLongLongValue"));
    v8 = v5;

  }
  return v5;
}

- (int)name
{
  return self->_name;
}

- (unint64_t)annotationAddedTimestampInSeconds
{
  return self->_annotationAddedTimestampInSeconds;
}

@end
