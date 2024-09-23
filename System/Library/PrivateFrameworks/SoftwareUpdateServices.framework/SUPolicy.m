@implementation SUPolicy

- (BOOL)discretionary
{
  return 0;
}

- (BOOL)allowsCellular
{
  return 1;
}

- (BOOL)allowExpensiveNetwork
{
  return 1;
}

- (BOOL)requiresPowerPluggedIn
{
  return 0;
}

- (int)downloadTimeoutSecs
{
  return -1;
}

- (BOOL)skipPhase
{
  return 0;
}

- (id)_stringForBool:(BOOL)a3
{
  if (a3)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SUPolicy _stringForBool:](self, "_stringForBool:", -[SUPolicy discretionary](self, "discretionary"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicy _stringForBool:](self, "_stringForBool:", -[SUPolicy allowsCellular](self, "allowsCellular"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUPolicy _stringForBool:](self, "_stringForBool:", -[SUPolicy requiresPowerPluggedIn](self, "requiresPowerPluggedIn"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("\n            discretionary: %@\n            allowsCellular: %@\n            requiresPowerPluggedIn: %@\n            downloadTimeoutSecs: %d"), v4, v5, v6, -[SUPolicy downloadTimeoutSecs](self, "downloadTimeoutSecs"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)additionalOptions
{
  return self->_additionalOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalOptions, 0);
}

@end
