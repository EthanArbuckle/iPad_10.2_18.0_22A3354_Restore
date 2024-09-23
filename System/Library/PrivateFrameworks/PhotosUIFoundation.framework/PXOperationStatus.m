@implementation PXOperationStatus

- (PXOperationStatus)initWithState:(int64_t)a3 progress:(double)a4 error:(id)a5
{
  id v8;
  PXOperationStatus *v9;
  PXOperationStatus *v10;
  uint64_t v11;
  NSError *error;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXOperationStatus;
  v9 = -[PXOperationStatus init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_state = a3;
    v9->_progress = a4;
    v9->_indeterminate = 0;
    v11 = objc_msgSend(v8, "copy");
    error = v10->_error;
    v10->_error = (NSError *)v11;

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  int v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "state");
    if (v6 == -[PXOperationStatus state](self, "state")
      && (v7 = objc_msgSend(v5, "isIndeterminate"), v7 == -[PXOperationStatus isIndeterminate](self, "isIndeterminate"))
      && (objc_msgSend(v5, "progress"), v9 = v8, -[PXOperationStatus progress](self, "progress"), v9 == v10))
    {
      objc_msgSend(v5, "error");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXOperationStatus error](self, "error");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11 == v12)
      {
        v15 = 1;
      }
      else
      {
        objc_msgSend(v5, "error");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXOperationStatus error](self, "error");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v13, "isEqual:", v14);

      }
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (int64_t)state
{
  return self->_state;
}

- (double)progress
{
  return self->_progress;
}

- (BOOL)isIndeterminate
{
  return self->_indeterminate;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
}

- (PXOperationStatus)init
{
  return -[PXOperationStatus initWithState:progress:error:](self, "initWithState:progress:error:", 0, 0, 0.0);
}

- (PXOperationStatus)initWithState:(int64_t)a3 error:(id)a4
{
  id v6;
  PXOperationStatus *v7;
  PXOperationStatus *v8;
  uint64_t v9;
  NSError *error;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXOperationStatus;
  v7 = -[PXOperationStatus init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_state = a3;
    v7->_progress = 0.5;
    v7->_indeterminate = 1;
    v9 = objc_msgSend(v6, "copy");
    error = v8->_error;
    v8->_error = (NSError *)v9;

  }
  return v8;
}

- (id)operationStatusByMixingOperationStatus:(id)a3 withMixFactor:(double)a4
{
  id v7;
  PXOperationStatus *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  PXOperationStatus *v15;
  int64_t v16;
  PXOperationStatus *v17;
  PXOperationStatus *v18;
  PXOperationStatus *v19;
  double v20;
  void *v22;

  v7 = a3;
  if (a4 < 0.0 || a4 > 1.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXOperationStatus.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mixFactor >= 0.0 && mixFactor <= 1.0"));

  }
  switch(objc_msgSend(v7, "state"))
  {
    case 0:
      goto LABEL_13;
    case 1:
      switch(-[PXOperationStatus state](self, "state"))
      {
        case 0:
        case 4:
          goto LABEL_15;
        case 1:
          v9 = [PXOperationStatus alloc];
          -[PXOperationStatus progress](self, "progress");
          v11 = v10;
          objc_msgSend(v7, "progress");
          v13 = v12 * a4 + (1.0 - a4) * v11;
          goto LABEL_11;
        case 2:
          v19 = [PXOperationStatus alloc];
          objc_msgSend(v7, "progress");
          v13 = 1.0 - a4 + v20 * a4;
          v15 = v19;
          goto LABEL_18;
        case 3:
          goto LABEL_13;
        default:
          goto LABEL_16;
      }
    case 2:
      switch(-[PXOperationStatus state](self, "state"))
      {
        case 0:
        case 2:
        case 4:
          goto LABEL_15;
        case 1:
          v9 = [PXOperationStatus alloc];
          -[PXOperationStatus progress](self, "progress");
          v13 = a4 + (1.0 - a4) * v14;
LABEL_11:
          v15 = v9;
LABEL_18:
          v17 = -[PXOperationStatus initWithState:progress:error:](v15, "initWithState:progress:error:", 1, 0, v13);
          goto LABEL_19;
        case 3:
          goto LABEL_13;
        default:
          goto LABEL_16;
      }
    case 3:
      goto LABEL_15;
    case 4:
      v16 = -[PXOperationStatus state](self, "state");
      if ((unint64_t)(v16 - 1) >= 4)
      {
        if (v16)
        {
LABEL_16:
          v18 = 0;
          goto LABEL_20;
        }
LABEL_15:
        v17 = (PXOperationStatus *)v7;
      }
      else
      {
LABEL_13:
        v17 = self;
      }
LABEL_19:
      v18 = v17;
LABEL_20:

      return v18;
    default:
      goto LABEL_16;
  }
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  double v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[PXOperationStatus state](self, "state");
  v4 = v3 ^ -[PXOperationStatus isIndeterminate](self, "isIndeterminate");
  -[PXOperationStatus progress](self, "progress");
  v6 = (unint64_t)(v5 * 1000.0);
  -[PXOperationStatus error](self, "error");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v4 ^ objc_msgSend(v7, "hash") ^ v6;

  return v8;
}

- (id)description
{
  __CFString *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;

  switch(-[PXOperationStatus state](self, "state"))
  {
    case 0:
      v3 = CFSTR("?");
      break;
    case 1:
      v4 = (void *)MEMORY[0x24BDD17C8];
      -[PXOperationStatus progress](self, "progress");
      objc_msgSend(v4, "stringWithFormat:", CFSTR("%0.1f%%"), v5 * 100.0);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v3 = CFSTR("Succeeded");
      break;
    case 3:
      v6 = (void *)MEMORY[0x24BDD17C8];
      -[PXOperationStatus error](self, "error");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", CFSTR("Failed (%@)"), v7);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 4:
      v3 = CFSTR("Canceled");
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (id)redactedDescription
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[PXOperationStatus state](self, "state") == 3
    && (-[PXOperationStatus error](self, "error"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    -[PXOperationStatus error](self, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "redactedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Failed (%@)"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[PXOperationStatus description](self, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

@end
