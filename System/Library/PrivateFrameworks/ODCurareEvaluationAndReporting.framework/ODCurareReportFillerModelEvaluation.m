@implementation ODCurareReportFillerModelEvaluation

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerModelEvaluation;
  -[ODCurareReportFillerModelEvaluation description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODCurareReportFillerModelEvaluation dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *metricName;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  metricName = self->_metricName;
  if (metricName)
    objc_msgSend(v3, "setObject:forKey:", metricName, CFSTR("metricName"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_metricValue);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("metricValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numberOfSamples);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("numberOfSamples"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numberOfPositiveSamples);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v8, CFSTR("numberOfPositiveSamples"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerModelEvaluationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_metricName)
    -[ODCurareReportFillerModelEvaluation writeTo:].cold.1();
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  NSString *metricName;
  id v5;

  metricName = self->_metricName;
  v5 = a3;
  objc_msgSend(v5, "setMetricName:", metricName);
  *((_QWORD *)v5 + 1) = *(_QWORD *)&self->_metricValue;
  *((_DWORD *)v5 + 7) = self->_numberOfSamples;
  *((_DWORD *)v5 + 6) = self->_numberOfPositiveSamples;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_metricName, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(double *)(v5 + 8) = self->_metricValue;
  *(_DWORD *)(v5 + 28) = self->_numberOfSamples;
  *(_DWORD *)(v5 + 24) = self->_numberOfPositiveSamples;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *metricName;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((metricName = self->_metricName, !((unint64_t)metricName | *((_QWORD *)v4 + 2)))
     || -[NSString isEqual:](metricName, "isEqual:"))
    && self->_metricValue == *((double *)v4 + 1)
    && self->_numberOfSamples == *((_DWORD *)v4 + 7)
    && self->_numberOfPositiveSamples == *((_DWORD *)v4 + 6);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  double metricValue;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_metricName, "hash");
  metricValue = self->_metricValue;
  v5 = -metricValue;
  if (metricValue >= 0.0)
    v5 = self->_metricValue;
  v6 = floor(v5 + 0.5);
  v7 = (v5 - v6) * 1.84467441e19;
  v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  v9 = v8 + (unint64_t)v7;
  v10 = fabs(v7);
  if (v7 <= 0.0)
    v9 = v8;
  v11 = v8 - (unint64_t)v10;
  if (v7 >= 0.0)
    v11 = v9;
  return v11 ^ v3 ^ (2654435761 * self->_numberOfSamples) ^ (2654435761 * self->_numberOfPositiveSamples);
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[ODCurareReportFillerModelEvaluation setMetricName:](self, "setMetricName:");
    v4 = v5;
  }
  self->_metricValue = *((double *)v4 + 1);
  self->_numberOfSamples = *((_DWORD *)v4 + 7);
  self->_numberOfPositiveSamples = *((_DWORD *)v4 + 6);

}

- (NSString)metricName
{
  return self->_metricName;
}

- (void)setMetricName:(id)a3
{
  objc_storeStrong((id *)&self->_metricName, a3);
}

- (double)metricValue
{
  return self->_metricValue;
}

- (void)setMetricValue:(double)a3
{
  self->_metricValue = a3;
}

- (unsigned)numberOfSamples
{
  return self->_numberOfSamples;
}

- (void)setNumberOfSamples:(unsigned int)a3
{
  self->_numberOfSamples = a3;
}

- (unsigned)numberOfPositiveSamples
{
  return self->_numberOfPositiveSamples;
}

- (void)setNumberOfPositiveSamples:(unsigned int)a3
{
  self->_numberOfPositiveSamples = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricName, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerModelEvaluation writeTo:]", "ODCurareReportFillerModelEvaluation.m", 93, "nil != self->_metricName");
}

@end
