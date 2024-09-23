@implementation SRUIFDialogPhase

+ (id)dialogPhaseForAceDialogPhase:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82708]))
  {
    +[SRUIFDialogPhase acknowledgementDialogPhase](SRUIFDialogPhase, "acknowledgementDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82740]))
  {
    +[SRUIFDialogPhase reflectionDialogPhase](SRUIFDialogPhase, "reflectionDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82748]))
  {
    +[SRUIFDialogPhase statusDialogPhase](SRUIFDialogPhase, "statusDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82718]))
  {
    +[SRUIFDialogPhase clarificationDialogPhase](SRUIFDialogPhase, "clarificationDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82750]))
  {
    +[SRUIFDialogPhase summaryDialogPhase](SRUIFDialogPhase, "summaryDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82728]))
  {
    +[SRUIFDialogPhase confirmationDialogPhase](SRUIFDialogPhase, "confirmationDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82720]))
  {
    +[SRUIFDialogPhase completionDialogPhase](SRUIFDialogPhase, "completionDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82738]))
  {
    +[SRUIFDialogPhase errorDialogPhase](SRUIFDialogPhase, "errorDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82730]))
  {
    +[SRUIFDialogPhase confirmedDialogPhase](SRUIFDialogPhase, "confirmedDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE82710]))
    {
      v5 = 0;
      goto LABEL_22;
    }
    +[SRUIFDialogPhase cancelledDialogPhase](SRUIFDialogPhase, "cancelledDialogPhase");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
LABEL_22:

  return v5;
}

+ (id)acknowledgementDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 1);
}

+ (id)reflectionDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 2);
}

+ (id)statusDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 3);
}

+ (id)clarificationDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 4);
}

+ (id)summaryDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 5);
}

+ (id)confirmationDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 6);
}

+ (id)completionDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 7);
}

+ (id)errorDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 8);
}

+ (id)confirmedDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 9);
}

+ (id)cancelledDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 10);
}

+ (id)userRequestDialogPhase
{
  return (id)objc_msgSend(a1, "_dialogPhaseWithType:", 11);
}

+ (id)_dialogPhaseWithType:(int64_t)a3
{
  return -[SRUIFDialogPhase _initWithType:]([SRUIFDialogPhase alloc], "_initWithType:", a3);
}

- (id)_initWithType:(int64_t)a3
{
  id result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SRUIFDialogPhase;
  result = -[SRUIFDialogPhase init](&v5, sel_init);
  if (result)
    *((_QWORD *)result + 1) = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SRUIFDialogPhase _type](self, "_type"), CFSTR("SRUIFDialogPhaseType"));

}

- (SRUIFDialogPhase)initWithCoder:(id)a3
{
  id v4;
  SRUIFDialogPhase *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SRUIFDialogPhase;
  v5 = -[SRUIFDialogPhase init](&v7, sel_init);
  if (v5)
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SRUIFDialogPhaseType"));

  return v5;
}

- (BOOL)isEqualToDialogPhase:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[SRUIFDialogPhase _type](self, "_type");
  v6 = objc_msgSend(v4, "_type");

  return v5 == v6;
}

- (NSString)aceDialogPhaseValue
{
  int64_t v3;
  id v4;
  id *v5;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = -[SRUIFDialogPhase _type](self, "_type") - 1;
  v4 = 0;
  v5 = (id *)MEMORY[0x24BE82708];
  switch(v3)
  {
    case 0:
      goto LABEL_11;
    case 1:
      v5 = (id *)MEMORY[0x24BE82740];
      goto LABEL_11;
    case 2:
      v5 = (id *)MEMORY[0x24BE82748];
      goto LABEL_11;
    case 3:
      v5 = (id *)MEMORY[0x24BE82718];
      goto LABEL_11;
    case 4:
      v5 = (id *)MEMORY[0x24BE82750];
      goto LABEL_11;
    case 5:
      v5 = (id *)MEMORY[0x24BE82728];
      goto LABEL_11;
    case 6:
      v5 = (id *)MEMORY[0x24BE82720];
      goto LABEL_11;
    case 7:
      v5 = (id *)MEMORY[0x24BE82738];
      goto LABEL_11;
    case 8:
      v5 = (id *)MEMORY[0x24BE82730];
      goto LABEL_11;
    case 9:
      v5 = (id *)MEMORY[0x24BE82710];
LABEL_11:
      v4 = *v5;
      break;
    case 10:
      return (NSString *)v4;
    default:
      v7 = (void *)MEMORY[0x24BDBCE88];
      v8 = *MEMORY[0x24BDBCAB0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unexpected value for _type: %ld"), -[SRUIFDialogPhase _type](self, "_type"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, v9, 0);
      v10 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v10);
  }
  return (NSString *)v4;
}

- (BOOL)replacesPreviousSnippetContents
{
  unint64_t v2;

  v2 = -[SRUIFDialogPhase _type](self, "_type");
  return (v2 < 8) & (0xB0u >> v2);
}

- (BOOL)isTemporary
{
  unint64_t v2;

  v2 = -[SRUIFDialogPhase _type](self, "_type");
  return (v2 < 9) & (0x14Eu >> v2);
}

- (BOOL)isExpository
{
  return (unint64_t)(-[SRUIFDialogPhase _type](self, "_type") - 1) < 3;
}

- (BOOL)isConfirmationDialogPhase
{
  return -[SRUIFDialogPhase _type](self, "_type") == 6;
}

- (BOOL)isReflectionDialogPhase
{
  return -[SRUIFDialogPhase _type](self, "_type") == 2;
}

- (BOOL)isClarificationDialogPhase
{
  return -[SRUIFDialogPhase _type](self, "_type") == 4;
}

- (BOOL)isConfirmedDialogPhase
{
  return -[SRUIFDialogPhase _type](self, "_type") == 9;
}

- (BOOL)isCancelledDialogPhase
{
  return -[SRUIFDialogPhase _type](self, "_type") == 10;
}

- (BOOL)isUserRequestDialogPhase
{
  return -[SRUIFDialogPhase _type](self, "_type") == 11;
}

- (BOOL)isErrorDialogPhase
{
  return -[SRUIFDialogPhase _type](self, "_type") == 8;
}

- (BOOL)isCompletionDialogPhase
{
  return -[SRUIFDialogPhase _type](self, "_type") == 7;
}

- (BOOL)isSummaryDialogPhase
{
  return -[SRUIFDialogPhase _type](self, "_type") == 5;
}

- (BOOL)isPossiblyPartOfMultiTurnRequest
{
  unint64_t v2;

  v2 = -[SRUIFDialogPhase _type](self, "_type");
  return (v2 < 0xC) & (0x850u >> v2);
}

- (id)description
{
  void *v3;
  BOOL v4;
  const __CFString *v5;
  void *v6;
  BOOL v7;
  void *v8;
  BOOL v9;
  void *v10;
  BOOL v11;
  void *v12;
  BOOL v13;
  void *v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  void *v18;
  BOOL v19;
  void *v20;
  BOOL v21;
  void *v22;
  BOOL v23;
  void *v24;
  _BOOL4 v25;

  +[SRUIFDialogPhase acknowledgementDialogPhase](SRUIFDialogPhase, "acknowledgementDialogPhase");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SRUIFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v3);

  if (v4)
  {
    v5 = CFSTR("acknowledgementDialogPhase");
  }
  else
  {
    +[SRUIFDialogPhase reflectionDialogPhase](SRUIFDialogPhase, "reflectionDialogPhase");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SRUIFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v6);

    if (v7)
    {
      v5 = CFSTR("reflectionDialogPhase");
    }
    else
    {
      +[SRUIFDialogPhase statusDialogPhase](SRUIFDialogPhase, "statusDialogPhase");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SRUIFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v8);

      if (v9)
      {
        v5 = CFSTR("statusDialogPhase");
      }
      else
      {
        +[SRUIFDialogPhase clarificationDialogPhase](SRUIFDialogPhase, "clarificationDialogPhase");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[SRUIFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v10);

        if (v11)
        {
          v5 = CFSTR("clarificationDialogPhase");
        }
        else
        {
          +[SRUIFDialogPhase summaryDialogPhase](SRUIFDialogPhase, "summaryDialogPhase");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = -[SRUIFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v12);

          if (v13)
          {
            v5 = CFSTR("summaryDialogPhase");
          }
          else
          {
            +[SRUIFDialogPhase confirmationDialogPhase](SRUIFDialogPhase, "confirmationDialogPhase");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = -[SRUIFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v14);

            if (v15)
            {
              v5 = CFSTR("confirmationDialogPhase");
            }
            else
            {
              +[SRUIFDialogPhase completionDialogPhase](SRUIFDialogPhase, "completionDialogPhase");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = -[SRUIFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v16);

              if (v17)
              {
                v5 = CFSTR("completionDialogPhase");
              }
              else
              {
                +[SRUIFDialogPhase errorDialogPhase](SRUIFDialogPhase, "errorDialogPhase");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = -[SRUIFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v18);

                if (v19)
                {
                  v5 = CFSTR("errorDialogPhase");
                }
                else
                {
                  +[SRUIFDialogPhase confirmedDialogPhase](SRUIFDialogPhase, "confirmedDialogPhase");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = -[SRUIFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v20);

                  if (v21)
                  {
                    v5 = CFSTR("confirmedDialogPhase");
                  }
                  else
                  {
                    +[SRUIFDialogPhase cancelledDialogPhase](SRUIFDialogPhase, "cancelledDialogPhase");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    v23 = -[SRUIFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v22);

                    if (v23)
                    {
                      v5 = CFSTR("cancelledDialogPhase");
                    }
                    else
                    {
                      +[SRUIFDialogPhase userRequestDialogPhase](SRUIFDialogPhase, "userRequestDialogPhase");
                      v24 = (void *)objc_claimAutoreleasedReturnValue();
                      v25 = -[SRUIFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v24);

                      if (v25)
                        v5 = CFSTR("userRequestDialogPhase");
                      else
                        v5 = CFSTR("unknown dialogPhase");
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@ %@>"), objc_opt_class(), v5);
}

- (BOOL)isEqual:(id)a3
{
  SRUIFDialogPhase *v4;
  BOOL v5;

  v4 = (SRUIFDialogPhase *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[SRUIFDialogPhase isEqualToDialogPhase:](self, "isEqualToDialogPhase:", v4);
  }

  return v5;
}

- (int64_t)_type
{
  return self->_type;
}

@end
