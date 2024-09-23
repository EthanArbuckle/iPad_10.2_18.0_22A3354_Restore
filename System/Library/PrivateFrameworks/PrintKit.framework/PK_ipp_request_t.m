@implementation PK_ipp_request_t

- (PK_ipp_request_t)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PK_ipp_request_t;
  return -[PK_ipp_t init](&v3, sel_init);
}

- (PK_ipp_request_t)initWithOp:(unsigned __int16)a3
{
  uint64_t v3;
  PK_ipp_request_t *v4;
  PK_ipp_request_t *v5;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PK_ipp_request_t;
  v4 = -[PK_ipp_t init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    -[PK_ipp_t setOp_or_status:](v4, "setOp_or_status:", v3);
    -[PK_ipp_request_t _setupNewRequest](v5, "_setupNewRequest");
  }
  return v5;
}

- (void)_setupNewRequest
{
  unsigned int v3;
  void *v4;
  id v5;

  do
    v3 = __ldaxr((unsigned int *)&-[PK_ipp_request_t _setupNewRequest]::sRequest_id);
  while (__stlxr(v3 + 1, (unsigned int *)&-[PK_ipp_request_t _setupNewRequest]::sRequest_id));
  self->super._request_id = v3;
  -[PK_ipp_t _addString:valueTag:name:lang:value:](self, "_addString:valueTag:name:lang:value:", 1, 71, CFSTR("attributes-charset"), 0, CFSTR("utf-8"));
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BDBCB20]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[PK_ipp_t _addString:valueTag:name:lang:value:](self, "_addString:valueTag:name:lang:value:", 1, 72, CFSTR("attributes-natural-language"), 0, v5);
}

- (id)opString
{
  int v3;
  __CFString *v4;

  v3 = -[PK_ipp_t op_or_status](self, "op_or_status") - 2;
  v4 = CFSTR("IPP_OP_PRINT_JOB");
  switch(v3)
  {
    case 0:
      return v4;
    case 1:
    case 5:
      goto LABEL_6;
    case 2:
      v4 = CFSTR("IPP_OP_VALIDATE_JOB");
      break;
    case 3:
      v4 = CFSTR("IPP_OP_CREATE_JOB");
      break;
    case 4:
      v4 = CFSTR("IPP_OP_SEND_DOCUMENT");
      break;
    case 6:
      v4 = CFSTR("IPP_OP_CANCEL_JOB");
      break;
    case 7:
      v4 = CFSTR("IPP_OP_GET_JOB_ATTRIBUTES");
      break;
    case 8:
      v4 = CFSTR("IPP_OP_GET_JOBS");
      break;
    case 9:
      v4 = CFSTR("IPP_OP_GET_PRINTER_ATTRIBUTES");
      break;
    default:
      if (CFSTR("IPP_OP_PRINT_JOB") == 60)
      {
        v4 = CFSTR("IPP_OP_IDENTIFY_PRINTER");
      }
      else if (CFSTR("IPP_OP_PRINT_JOB") == 79)
      {
        v4 = CFSTR("IPP_OP_GET_PRINTERS");
      }
      else
      {
LABEL_6:
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("ipp-op-unknown (%d)"), -[PK_ipp_t op_or_status](self, "op_or_status"));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      break;
  }
  return v4;
}

- (id)_descriptionLeader
{
  void *v3;
  uint64_t request_id;
  unsigned int v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  request_id = self->super._request_id;
  v5 = -[PK_ipp_t op_or_status](self, "op_or_status");
  -[PK_ipp_request_t opString](self, "opString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<ID#%d(%d - %@)>"), request_id, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
