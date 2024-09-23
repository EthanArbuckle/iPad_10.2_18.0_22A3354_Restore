@implementation ODCurareReportFillerDataSetStats

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerDataSetStats;
  -[ODCurareReportFillerDataSetStats description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODCurareReportFillerDataSetStats dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *featureName;
  NSString *featureValueMin;
  NSString *featureValueMax;
  NSString *featureValueMean;
  NSString *featureValueStd;
  NSString *featureValuePercentile10;
  NSString *featureValuePercentile25;
  NSString *featureValuePercentile50;
  NSString *featureValuePercentile75;
  NSString *featureValuePercentile90;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  featureName = self->_featureName;
  if (featureName)
    objc_msgSend(v3, "setObject:forKey:", featureName, CFSTR("featureName"));
  featureValueMin = self->_featureValueMin;
  if (featureValueMin)
    objc_msgSend(v4, "setObject:forKey:", featureValueMin, CFSTR("featureValueMin"));
  featureValueMax = self->_featureValueMax;
  if (featureValueMax)
    objc_msgSend(v4, "setObject:forKey:", featureValueMax, CFSTR("featureValueMax"));
  featureValueMean = self->_featureValueMean;
  if (featureValueMean)
    objc_msgSend(v4, "setObject:forKey:", featureValueMean, CFSTR("featureValueMean"));
  featureValueStd = self->_featureValueStd;
  if (featureValueStd)
    objc_msgSend(v4, "setObject:forKey:", featureValueStd, CFSTR("featureValueStd"));
  featureValuePercentile10 = self->_featureValuePercentile10;
  if (featureValuePercentile10)
    objc_msgSend(v4, "setObject:forKey:", featureValuePercentile10, CFSTR("featureValuePercentile10"));
  featureValuePercentile25 = self->_featureValuePercentile25;
  if (featureValuePercentile25)
    objc_msgSend(v4, "setObject:forKey:", featureValuePercentile25, CFSTR("featureValuePercentile25"));
  featureValuePercentile50 = self->_featureValuePercentile50;
  if (featureValuePercentile50)
    objc_msgSend(v4, "setObject:forKey:", featureValuePercentile50, CFSTR("featureValuePercentile50"));
  featureValuePercentile75 = self->_featureValuePercentile75;
  if (featureValuePercentile75)
    objc_msgSend(v4, "setObject:forKey:", featureValuePercentile75, CFSTR("featureValuePercentile75"));
  featureValuePercentile90 = self->_featureValuePercentile90;
  if (featureValuePercentile90)
    objc_msgSend(v4, "setObject:forKey:", featureValuePercentile90, CFSTR("featureValuePercentile90"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerDataSetStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;

  v4 = a3;
  if (!self->_featureName)
    -[ODCurareReportFillerDataSetStats writeTo:].cold.1();
  PBDataWriterWriteStringField();
  if (!self->_featureValueMin)
    -[ODCurareReportFillerDataSetStats writeTo:].cold.2();
  PBDataWriterWriteStringField();
  if (!self->_featureValueMax)
    -[ODCurareReportFillerDataSetStats writeTo:].cold.3();
  PBDataWriterWriteStringField();
  if (!self->_featureValueMean)
    -[ODCurareReportFillerDataSetStats writeTo:].cold.4();
  PBDataWriterWriteStringField();
  if (!self->_featureValueStd)
    -[ODCurareReportFillerDataSetStats writeTo:].cold.5();
  PBDataWriterWriteStringField();
  if (!self->_featureValuePercentile10)
    -[ODCurareReportFillerDataSetStats writeTo:].cold.6();
  PBDataWriterWriteStringField();
  if (!self->_featureValuePercentile25)
    -[ODCurareReportFillerDataSetStats writeTo:].cold.7();
  PBDataWriterWriteStringField();
  if (!self->_featureValuePercentile50)
    -[ODCurareReportFillerDataSetStats writeTo:].cold.8();
  PBDataWriterWriteStringField();
  if (!self->_featureValuePercentile75)
    -[ODCurareReportFillerDataSetStats writeTo:].cold.9();
  PBDataWriterWriteStringField();
  if (!self->_featureValuePercentile90)
    -[ODCurareReportFillerDataSetStats writeTo:].cold.10();
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  NSString *featureName;
  id v5;

  featureName = self->_featureName;
  v5 = a3;
  objc_msgSend(v5, "setFeatureName:", featureName);
  objc_msgSend(v5, "setFeatureValueMin:", self->_featureValueMin);
  objc_msgSend(v5, "setFeatureValueMax:", self->_featureValueMax);
  objc_msgSend(v5, "setFeatureValueMean:", self->_featureValueMean);
  objc_msgSend(v5, "setFeatureValueStd:", self->_featureValueStd);
  objc_msgSend(v5, "setFeatureValuePercentile10:", self->_featureValuePercentile10);
  objc_msgSend(v5, "setFeatureValuePercentile25:", self->_featureValuePercentile25);
  objc_msgSend(v5, "setFeatureValuePercentile50:", self->_featureValuePercentile50);
  objc_msgSend(v5, "setFeatureValuePercentile75:", self->_featureValuePercentile75);
  objc_msgSend(v5, "setFeatureValuePercentile90:", self->_featureValuePercentile90);

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
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_featureName, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_featureValueMin, "copyWithZone:", a3);
  v9 = (void *)v5[4];
  v5[4] = v8;

  v10 = -[NSString copyWithZone:](self->_featureValueMax, "copyWithZone:", a3);
  v11 = (void *)v5[2];
  v5[2] = v10;

  v12 = -[NSString copyWithZone:](self->_featureValueMean, "copyWithZone:", a3);
  v13 = (void *)v5[3];
  v5[3] = v12;

  v14 = -[NSString copyWithZone:](self->_featureValueStd, "copyWithZone:", a3);
  v15 = (void *)v5[10];
  v5[10] = v14;

  v16 = -[NSString copyWithZone:](self->_featureValuePercentile10, "copyWithZone:", a3);
  v17 = (void *)v5[5];
  v5[5] = v16;

  v18 = -[NSString copyWithZone:](self->_featureValuePercentile25, "copyWithZone:", a3);
  v19 = (void *)v5[6];
  v5[6] = v18;

  v20 = -[NSString copyWithZone:](self->_featureValuePercentile50, "copyWithZone:", a3);
  v21 = (void *)v5[7];
  v5[7] = v20;

  v22 = -[NSString copyWithZone:](self->_featureValuePercentile75, "copyWithZone:", a3);
  v23 = (void *)v5[8];
  v5[8] = v22;

  v24 = -[NSString copyWithZone:](self->_featureValuePercentile90, "copyWithZone:", a3);
  v25 = (void *)v5[9];
  v5[9] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *featureName;
  NSString *featureValueMin;
  NSString *featureValueMax;
  NSString *featureValueMean;
  NSString *featureValueStd;
  NSString *featureValuePercentile10;
  NSString *featureValuePercentile25;
  NSString *featureValuePercentile50;
  NSString *featureValuePercentile75;
  NSString *featureValuePercentile90;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  featureName = self->_featureName;
  if ((unint64_t)featureName | v4[1])
  {
    if (!-[NSString isEqual:](featureName, "isEqual:"))
      goto LABEL_22;
  }
  featureValueMin = self->_featureValueMin;
  if ((unint64_t)featureValueMin | v4[4] && !-[NSString isEqual:](featureValueMin, "isEqual:"))
    goto LABEL_22;
  if (((featureValueMax = self->_featureValueMax, !((unint64_t)featureValueMax | v4[2]))
     || -[NSString isEqual:](featureValueMax, "isEqual:"))
    && ((featureValueMean = self->_featureValueMean, !((unint64_t)featureValueMean | v4[3]))
     || -[NSString isEqual:](featureValueMean, "isEqual:"))
    && ((featureValueStd = self->_featureValueStd, !((unint64_t)featureValueStd | v4[10]))
     || -[NSString isEqual:](featureValueStd, "isEqual:"))
    && ((featureValuePercentile10 = self->_featureValuePercentile10,
         !((unint64_t)featureValuePercentile10 | v4[5]))
     || -[NSString isEqual:](featureValuePercentile10, "isEqual:"))
    && ((featureValuePercentile25 = self->_featureValuePercentile25,
         !((unint64_t)featureValuePercentile25 | v4[6]))
     || -[NSString isEqual:](featureValuePercentile25, "isEqual:"))
    && ((featureValuePercentile50 = self->_featureValuePercentile50,
         !((unint64_t)featureValuePercentile50 | v4[7]))
     || -[NSString isEqual:](featureValuePercentile50, "isEqual:"))
    && ((featureValuePercentile75 = self->_featureValuePercentile75,
         !((unint64_t)featureValuePercentile75 | v4[8]))
     || -[NSString isEqual:](featureValuePercentile75, "isEqual:")))
  {
    featureValuePercentile90 = self->_featureValuePercentile90;
    if ((unint64_t)featureValuePercentile90 | v4[9])
      v15 = -[NSString isEqual:](featureValuePercentile90, "isEqual:");
    else
      v15 = 1;
  }
  else
  {
LABEL_22:
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;

  v3 = -[NSString hash](self->_featureName, "hash");
  v4 = -[NSString hash](self->_featureValueMin, "hash") ^ v3;
  v5 = -[NSString hash](self->_featureValueMax, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_featureValueMean, "hash");
  v7 = -[NSString hash](self->_featureValueStd, "hash");
  v8 = v7 ^ -[NSString hash](self->_featureValuePercentile10, "hash");
  v9 = v6 ^ v8 ^ -[NSString hash](self->_featureValuePercentile25, "hash");
  v10 = -[NSString hash](self->_featureValuePercentile50, "hash");
  v11 = v10 ^ -[NSString hash](self->_featureValuePercentile75, "hash");
  return v9 ^ v11 ^ -[NSString hash](self->_featureValuePercentile90, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[1])
    -[ODCurareReportFillerDataSetStats setFeatureName:](self, "setFeatureName:");
  if (v4[4])
    -[ODCurareReportFillerDataSetStats setFeatureValueMin:](self, "setFeatureValueMin:");
  if (v4[2])
    -[ODCurareReportFillerDataSetStats setFeatureValueMax:](self, "setFeatureValueMax:");
  if (v4[3])
    -[ODCurareReportFillerDataSetStats setFeatureValueMean:](self, "setFeatureValueMean:");
  if (v4[10])
    -[ODCurareReportFillerDataSetStats setFeatureValueStd:](self, "setFeatureValueStd:");
  if (v4[5])
    -[ODCurareReportFillerDataSetStats setFeatureValuePercentile10:](self, "setFeatureValuePercentile10:");
  if (v4[6])
    -[ODCurareReportFillerDataSetStats setFeatureValuePercentile25:](self, "setFeatureValuePercentile25:");
  if (v4[7])
    -[ODCurareReportFillerDataSetStats setFeatureValuePercentile50:](self, "setFeatureValuePercentile50:");
  if (v4[8])
    -[ODCurareReportFillerDataSetStats setFeatureValuePercentile75:](self, "setFeatureValuePercentile75:");
  if (v4[9])
    -[ODCurareReportFillerDataSetStats setFeatureValuePercentile90:](self, "setFeatureValuePercentile90:");

}

- (NSString)featureName
{
  return self->_featureName;
}

- (void)setFeatureName:(id)a3
{
  objc_storeStrong((id *)&self->_featureName, a3);
}

- (NSString)featureValueMin
{
  return self->_featureValueMin;
}

- (void)setFeatureValueMin:(id)a3
{
  objc_storeStrong((id *)&self->_featureValueMin, a3);
}

- (NSString)featureValueMax
{
  return self->_featureValueMax;
}

- (void)setFeatureValueMax:(id)a3
{
  objc_storeStrong((id *)&self->_featureValueMax, a3);
}

- (NSString)featureValueMean
{
  return self->_featureValueMean;
}

- (void)setFeatureValueMean:(id)a3
{
  objc_storeStrong((id *)&self->_featureValueMean, a3);
}

- (NSString)featureValueStd
{
  return self->_featureValueStd;
}

- (void)setFeatureValueStd:(id)a3
{
  objc_storeStrong((id *)&self->_featureValueStd, a3);
}

- (NSString)featureValuePercentile10
{
  return self->_featureValuePercentile10;
}

- (void)setFeatureValuePercentile10:(id)a3
{
  objc_storeStrong((id *)&self->_featureValuePercentile10, a3);
}

- (NSString)featureValuePercentile25
{
  return self->_featureValuePercentile25;
}

- (void)setFeatureValuePercentile25:(id)a3
{
  objc_storeStrong((id *)&self->_featureValuePercentile25, a3);
}

- (NSString)featureValuePercentile50
{
  return self->_featureValuePercentile50;
}

- (void)setFeatureValuePercentile50:(id)a3
{
  objc_storeStrong((id *)&self->_featureValuePercentile50, a3);
}

- (NSString)featureValuePercentile75
{
  return self->_featureValuePercentile75;
}

- (void)setFeatureValuePercentile75:(id)a3
{
  objc_storeStrong((id *)&self->_featureValuePercentile75, a3);
}

- (NSString)featureValuePercentile90
{
  return self->_featureValuePercentile90;
}

- (void)setFeatureValuePercentile90:(id)a3
{
  objc_storeStrong((id *)&self->_featureValuePercentile90, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureValueStd, 0);
  objc_storeStrong((id *)&self->_featureValuePercentile90, 0);
  objc_storeStrong((id *)&self->_featureValuePercentile75, 0);
  objc_storeStrong((id *)&self->_featureValuePercentile50, 0);
  objc_storeStrong((id *)&self->_featureValuePercentile25, 0);
  objc_storeStrong((id *)&self->_featureValuePercentile10, 0);
  objc_storeStrong((id *)&self->_featureValueMin, 0);
  objc_storeStrong((id *)&self->_featureValueMean, 0);
  objc_storeStrong((id *)&self->_featureValueMax, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 171, "nil != self->_featureName");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 176, "nil != self->_featureValueMin");
}

- (void)writeTo:.cold.3()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 181, "nil != self->_featureValueMax");
}

- (void)writeTo:.cold.4()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 186, "nil != self->_featureValueMean");
}

- (void)writeTo:.cold.5()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 191, "nil != self->_featureValueStd");
}

- (void)writeTo:.cold.6()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 196, "nil != self->_featureValuePercentile10");
}

- (void)writeTo:.cold.7()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 201, "nil != self->_featureValuePercentile25");
}

- (void)writeTo:.cold.8()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 206, "nil != self->_featureValuePercentile50");
}

- (void)writeTo:.cold.9()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 211, "nil != self->_featureValuePercentile75");
}

- (void)writeTo:.cold.10()
{
  __assert_rtn("-[ODCurareReportFillerDataSetStats writeTo:]", "ODCurareReportFillerDataSetStats.m", 216, "nil != self->_featureValuePercentile90");
}

@end
