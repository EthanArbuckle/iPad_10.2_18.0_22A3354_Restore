@implementation TPMachineID

- (TPMachineID)initWithMachineID:(id)a3 status:(unint64_t)a4 modified:(id)a5
{
  id v9;
  id v10;
  TPMachineID *v11;
  TPMachineID *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TPMachineID;
  v11 = -[TPMachineID init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_machineID, a3);
    v12->_status = a4;
    objc_storeStrong((id *)&v12->_modified, a5);
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  const __CFString *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TPMachineID machineID](self, "machineID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TPMachineID status](self, "status");
  if (v5 > 5)
    v6 = CFSTR("allowed");
  else
    v6 = off_1EA8BF5B0[v5];
  -[TPMachineID modified](self, "modified");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<TPMachineID: %@ %@ %@>"), v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSString)machineID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)status
{
  return self->_status;
}

- (NSDate)modified
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modified, 0);
  objc_storeStrong((id *)&self->_machineID, 0);
}

@end
