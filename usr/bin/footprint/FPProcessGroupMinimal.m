@implementation FPProcessGroupMinimal

- (FPProcessGroupMinimal)init
{
  return (FPProcessGroupMinimal *)sub_100018CF0(self, 19);
}

- (id)initUniqueProcessGroup
{
  void *v3;
  _QWORD *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = sub_100018CF0(self, (uint64_t)objc_msgSend(v3, "hash"));

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
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FPProcessGroupMinimal processes](self, "processes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "processes"));

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToSet:", v6);
  return (char)v4;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FPProcessGroupMinimal processes](self, "processes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "description"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("FPProcessGroup%@"), v3));

  return v4;
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
