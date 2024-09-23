@implementation ODCurareReportFillerMetadata

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerMetadata;
  -[ODCurareReportFillerMetadata description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODCurareReportFillerMetadata dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *date;
  NSString *selectedModelName;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  date = self->_date;
  if (date)
    objc_msgSend(v3, "setObject:forKey:", date, CFSTR("date"));
  selectedModelName = self->_selectedModelName;
  if (selectedModelName)
    objc_msgSend(v4, "setObject:forKey:", selectedModelName, CFSTR("selectedModelName"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_date)
    -[ODCurareReportFillerMetadata writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_selectedModelName)
    -[ODCurareReportFillerMetadata writeTo:].cold.2();
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  NSString *date;
  id v5;

  date = self->_date;
  v5 = a3;
  objc_msgSend(v5, "setDate:", date);
  objc_msgSend(v5, "setSelectedModelName:", self->_selectedModelName);

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_date, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_selectedModelName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *date;
  NSString *selectedModelName;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((date = self->_date, !((unint64_t)date | v4[1])) || -[NSString isEqual:](date, "isEqual:")))
  {
    selectedModelName = self->_selectedModelName;
    if ((unint64_t)selectedModelName | v4[2])
      v7 = -[NSString isEqual:](selectedModelName, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_date, "hash");
  return -[NSString hash](self->_selectedModelName, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[ODCurareReportFillerMetadata setDate:](self, "setDate:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[ODCurareReportFillerMetadata setSelectedModelName:](self, "setSelectedModelName:");
    v4 = v5;
  }

}

- (NSString)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (NSString)selectedModelName
{
  return self->_selectedModelName;
}

- (void)setSelectedModelName:(id)a3
{
  objc_storeStrong((id *)&self->_selectedModelName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedModelName, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerMetadata writeTo:]", "ODCurareReportFillerMetadata.m", 83, "nil != self->_date");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ODCurareReportFillerMetadata writeTo:]", "ODCurareReportFillerMetadata.m", 88, "nil != self->_selectedModelName");
}

@end
