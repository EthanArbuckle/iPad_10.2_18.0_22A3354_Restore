@implementation WFREPBRunRequestProgress

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)WFREPBRunRequestProgress;
  -[WFREPBRunRequestProgress description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFREPBRunRequestProgress dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *runRequestIdentifier;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  runRequestIdentifier = self->_runRequestIdentifier;
  if (runRequestIdentifier)
    objc_msgSend(v3, "setObject:forKey:", runRequestIdentifier, CFSTR("runRequestIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_progress);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("progress"));

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBRunRequestProgressReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_runRequestIdentifier)
    __assert_rtn("-[WFREPBRunRequestProgress writeTo:]", "WFREPBRunRequestProgress.m", 79, "nil != self->_runRequestIdentifier");
  v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteDoubleField();

}

- (void)copyTo:(id)a3
{
  NSString *runRequestIdentifier;
  double *v5;

  runRequestIdentifier = self->_runRequestIdentifier;
  v5 = (double *)a3;
  objc_msgSend(v5, "setRunRequestIdentifier:", runRequestIdentifier);
  v5[1] = self->_progress;

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_runRequestIdentifier, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  *(double *)(v5 + 8) = self->_progress;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *runRequestIdentifier;
  BOOL v6;

  v4 = a3;
  v6 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((runRequestIdentifier = self->_runRequestIdentifier,
         !((unint64_t)runRequestIdentifier | *((_QWORD *)v4 + 2)))
     || -[NSString isEqual:](runRequestIdentifier, "isEqual:"))
    && self->_progress == *((double *)v4 + 1);

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3;
  double progress;
  double v5;
  long double v6;
  double v7;
  unint64_t v8;
  unint64_t v9;
  double v10;
  unint64_t v11;

  v3 = -[NSString hash](self->_runRequestIdentifier, "hash");
  progress = self->_progress;
  v5 = -progress;
  if (progress >= 0.0)
    v5 = self->_progress;
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
  return v11 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  double *v4;
  double *v5;

  v4 = (double *)a3;
  if (*((_QWORD *)v4 + 2))
  {
    v5 = v4;
    -[WFREPBRunRequestProgress setRunRequestIdentifier:](self, "setRunRequestIdentifier:");
    v4 = v5;
  }
  self->_progress = v4[1];

}

- (NSString)runRequestIdentifier
{
  return self->_runRequestIdentifier;
}

- (void)setRunRequestIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_runRequestIdentifier, a3);
}

- (double)progress
{
  return self->_progress;
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runRequestIdentifier, 0);
}

@end
