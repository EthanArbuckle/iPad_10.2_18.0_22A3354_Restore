@implementation SearchUIWatchListButtonRequest

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  _BOOL4 v8;
  int v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SearchUIWatchListButtonRequest identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", v6)
      && (v7 = -[SearchUIWatchListButtonRequest type](self, "type"), v7 == objc_msgSend(v4, "type")))
    {
      v8 = -[SearchUIWatchListButtonRequest isHorizontallySrollingStyle](self, "isHorizontallySrollingStyle");
      v9 = v8 ^ objc_msgSend(v4, "isHorizontallySrollingStyle") ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  -[SearchUIWatchListButtonRequest identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[SearchUIWatchListButtonRequest type](self, "type");
  v6 = v5 ^ -[SearchUIWatchListButtonRequest isHorizontallySrollingStyle](self, "isHorizontallySrollingStyle");

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (BOOL)isHorizontallySrollingStyle
{
  return self->_isHorizontallySrollingStyle;
}

- (void)setIsHorizontallySrollingStyle:(BOOL)a3
{
  self->_isHorizontallySrollingStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
