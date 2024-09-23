@implementation FPProcessGroupMinimal

- (FPProcessGroupMinimal)init
{
  return (FPProcessGroupMinimal *)sub_213462D94(self, 19);
}

- (id)initUniqueProcessGroup
{
  void *v3;
  _QWORD *v4;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = sub_213462D94(self, objc_msgSend(v3, "hash"));

  return v4;
}

- (void)addProcess:(id)a3
{
  unint64_t v4;
  id v5;

  v5 = a3;
  if ((-[NSMutableSet containsObject:](self->_processes, "containsObject:") & 1) == 0)
  {
    v4 = 37 * self->_hashValue;
    self->_hashValue = v4 ^ (int)objc_msgSend(v5, "pid");
    -[NSMutableSet addObject:](self->_processes, "addObject:", v5);
  }

}

- (unint64_t)hash
{
  return self->_hashValue;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (self->_hashValue != *((_QWORD *)a3 + 2))
    return 0;
  v4 = a3;
  -[FPProcessGroupMinimal processes](self, "processes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToSet:", v6);
  return (char)v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[FPProcessGroupMinimal processes](self, "processes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("FPProcessGroup%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSMutableSet)processes
{
  return self->_processes;
}

- (void)setProcesses:(id)a3
{
  objc_storeStrong((id *)&self->_processes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processes, 0);
}

@end
