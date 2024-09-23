@implementation AWDProactiveModelFittingModelInfoStatsPair

- (BOOL)hasModelInfo
{
  return self->_modelInfo != 0;
}

- (BOOL)hasStats
{
  return self->_stats != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)AWDProactiveModelFittingModelInfoStatsPair;
  -[AWDProactiveModelFittingModelInfoStatsPair description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AWDProactiveModelFittingModelInfoStatsPair dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  AWDProactiveModelFittingModelInfo *modelInfo;
  void *v5;
  AWDProactiveModelFittingMinibatchStats *stats;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  modelInfo = self->_modelInfo;
  if (modelInfo)
  {
    -[AWDProactiveModelFittingModelInfo dictionaryRepresentation](modelInfo, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("modelInfo"));

  }
  stats = self->_stats;
  if (stats)
  {
    -[AWDProactiveModelFittingMinibatchStats dictionaryRepresentation](stats, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("stats"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDProactiveModelFittingModelInfoStatsPairReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_modelInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_stats)
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
  if (self->_modelInfo)
  {
    objc_msgSend(v4, "setModelInfo:");
    v4 = v5;
  }
  if (self->_stats)
  {
    objc_msgSend(v5, "setStats:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[AWDProactiveModelFittingModelInfo copyWithZone:](self->_modelInfo, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[AWDProactiveModelFittingMinibatchStats copyWithZone:](self->_stats, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  AWDProactiveModelFittingModelInfo *modelInfo;
  AWDProactiveModelFittingMinibatchStats *stats;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((modelInfo = self->_modelInfo, !((unint64_t)modelInfo | v4[1]))
     || -[AWDProactiveModelFittingModelInfo isEqual:](modelInfo, "isEqual:")))
  {
    stats = self->_stats;
    if ((unint64_t)stats | v4[2])
      v7 = -[AWDProactiveModelFittingMinibatchStats isEqual:](stats, "isEqual:");
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
  unint64_t v3;

  v3 = -[AWDProactiveModelFittingModelInfo hash](self->_modelInfo, "hash");
  return -[AWDProactiveModelFittingMinibatchStats hash](self->_stats, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  AWDProactiveModelFittingModelInfo *modelInfo;
  uint64_t v6;
  AWDProactiveModelFittingMinibatchStats *stats;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  modelInfo = self->_modelInfo;
  v6 = v4[1];
  v9 = v4;
  if (modelInfo)
  {
    if (!v6)
      goto LABEL_7;
    -[AWDProactiveModelFittingModelInfo mergeFrom:](modelInfo, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[AWDProactiveModelFittingModelInfoStatsPair setModelInfo:](self, "setModelInfo:");
  }
  v4 = v9;
LABEL_7:
  stats = self->_stats;
  v8 = v4[2];
  if (stats)
  {
    if (v8)
    {
      -[AWDProactiveModelFittingMinibatchStats mergeFrom:](stats, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[AWDProactiveModelFittingModelInfoStatsPair setStats:](self, "setStats:");
    goto LABEL_12;
  }

}

- (AWDProactiveModelFittingModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (void)setModelInfo:(id)a3
{
  objc_storeStrong((id *)&self->_modelInfo, a3);
}

- (AWDProactiveModelFittingMinibatchStats)stats
{
  return self->_stats;
}

- (void)setStats:(id)a3
{
  objc_storeStrong((id *)&self->_stats, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stats, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
}

@end
