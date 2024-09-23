@implementation CLPCReportingSchemaColumn

- (NSNumber)valueID
{
  return self->_valueID;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)statID
{
  return self->_statID;
}

- (unint64_t)metadataType
{
  return self->_metadataType;
}

- (CLPCReportingSchemaColumn)init
{
  char *v2;
  CLPCReportingSchemaColumn *v3;
  void *v4;
  CLPCReportingSchemaColumn *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CLPCReportingSchemaColumn;
  v2 = -[CLPCReportingSchemaColumn init](&v7, sel_init);
  v3 = (CLPCReportingSchemaColumn *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 24) = 0u;
    *(_OWORD *)(v2 + 8) = 0u;
    v4 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = 0;

    v5 = v3;
  }

  return v3;
}

- (id)dictionaryRepresentation
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[7];

  v1 = a1;
  v11[6] = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v10[0] = CFSTR("Format");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(a1, "format"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v2;
    v10[1] = CFSTR("Type");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v1, "type"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v3;
    v10[2] = CFSTR("StatID");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v1, "statID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v4;
    v10[3] = CFSTR("MetadataType");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v1, "metadataType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11[3] = v5;
    v10[4] = CFSTR("ValueID");
    objc_msgSend(v1, "valueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(v1, "valueID");
    else
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[4] = v7;
    v10[5] = CFSTR("Name");
    objc_msgSend(v1, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[5] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 6);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

- (unint64_t)format
{
  return self->_format;
}

- (void)setFormat:(unint64_t)a3
{
  self->_format = a3;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setStatID:(unint64_t)a3
{
  self->_statID = a3;
}

- (void)setMetadataType:(unint64_t)a3
{
  self->_metadataType = a3;
}

- (void)setValueID:(id)a3
{
  objc_storeStrong((id *)&self->_valueID, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_valueID, 0);
}

@end
