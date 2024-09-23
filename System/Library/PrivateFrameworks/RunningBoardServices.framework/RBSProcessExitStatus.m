@implementation RBSProcessExitStatus

+ (RBSProcessExitStatus)statusWithDomain:(unsigned int)a3 code:(unint64_t)a4
{
  _DWORD *v6;

  v6 = objc_alloc_init((Class)a1);
  v6[2] = a3;
  *((_QWORD *)v6 + 2) = a4;
  return (RBSProcessExitStatus *)v6;
}

- (BOOL)isValid
{
  return self->_domain - 1 < 0x29;
}

- (unsigned)domain
{
  return self->_domain;
}

- (unint64_t)code
{
  return self->_code;
}

- (BOOL)_isVoluntary
{
  return self->_domain == 0;
}

- (BOOL)isJetsam
{
  return self->_domain == 1;
}

- (BOOL)isSignal
{
  return self->_domain == 2;
}

- (BOOL)isCrash
{
  _BOOL4 v3;
  unint64_t code;
  BOOL v5;
  unsigned int v6;

  v3 = -[RBSProcessExitStatus isSignal](self, "isSignal");
  if (v3)
  {
    code = self->_code;
    v5 = code > 0xC;
    v6 = (0x1D70u >> code) & 1;
    if (v5)
      LOBYTE(v3) = 0;
    else
      LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isFairPlayFailure
{
  return self->_domain == 9 && self->_code == 10;
}

- (id)error
{
  void *v3;
  void *v4;
  unint64_t code;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB35C8];
  +[RBSProcessExitStatus _nameForDomain:includeNumber:]((uint64_t)RBSProcessExitStatus, self->_domain, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  code = self->_code;
  v10 = *MEMORY[0x1E0CB2D68];
  +[RBSProcessExitStatus _nameForDomain:code:includeNumber:]((uint64_t)RBSProcessExitStatus, self->_domain, code, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "errorWithDomain:code:userInfo:", v4, code, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (__CFString)_nameForDomain:(int)a3 includeNumber:
{
  __CFString *v5;
  uint64_t v7;

  objc_opt_self();
  if (a2 > 0x28)
  {
    if (!a3)
    {
      v5 = CFSTR("(unknown)");
      return v5;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown(%u))"), a2, v7);
    goto LABEL_6;
  }
  v5 = off_1E2D16D70[(int)a2];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%u)"), off_1E2D16D70[(int)a2], a2);
LABEL_6:
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (__CFString)_nameForDomain:(uint64_t)a3 code:(int)a4 includeNumber:
{
  __CFString *v7;
  char v8;
  uint64_t v9;
  __CFString **v10;
  __CFString *v11;
  __CFString *v12;
  __CFString *v13;

  objc_opt_self();
  v7 = 0;
  v8 = 1;
  switch(a2)
  {
    case 1:
      v9 = a3 - 1;
      if ((unint64_t)(a3 - 1) >= 0xD)
        goto LABEL_14;
      v10 = off_1E2D16F28;
      goto LABEL_24;
    case 2:
      v9 = a3 - 1;
      if ((unint64_t)(a3 - 1) >= 0x1F || ((0x67BFFFBFu >> v9) & 1) == 0)
        goto LABEL_14;
      v10 = off_1E2D16F90;
      goto LABEL_24;
    case 3:
      v9 = a3 - 1;
      if ((unint64_t)(a3 - 1) >= 4)
        goto LABEL_14;
      v10 = off_1E2D17088;
      goto LABEL_24;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
      goto LABEL_27;
    case 9:
      v9 = a3 - 1;
      if ((unint64_t)(a3 - 1) >= 0xE || ((0x3FFDu >> v9) & 1) == 0)
        goto LABEL_14;
      v10 = off_1E2D16EB8;
      goto LABEL_24;
    case 10:
      v7 = 0;
      if (a3 <= 3221229822)
      {
        if (a3 == 732775916)
        {
          v7 = CFSTR("security-violation");
        }
        else
        {
          if (a3 != 2343432205)
            goto LABEL_27;
          v7 = CFSTR("watchdog");
        }
      }
      else
      {
        switch(a3)
        {
          case 3221229823:
            v7 = CFSTR("thermal-pressure");
            break;
          case 3735943697:
            v7 = CFSTR("user-quit");
            break;
          case 4227595259:
            v7 = CFSTR("force-quit");
            break;
          default:
            goto LABEL_27;
        }
      }
      goto LABEL_25;
    default:
      if (a2 != 23)
        goto LABEL_27;
      v9 = a3 - 1;
      if ((unint64_t)(a3 - 1) >= 3)
      {
LABEL_14:
        v7 = 0;
      }
      else
      {
        v10 = off_1E2D170A8;
LABEL_24:
        v7 = v10[v9];
LABEL_25:
        if (!a4)
        {
          v12 = 0;
          goto LABEL_36;
        }
        v8 = 0;
      }
LABEL_27:
      if ((unint64_t)a3 < 0x10000)
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
      else
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0x%llx"), a3);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if ((v8 & 1) != 0)
      {
        v13 = v11;
        v12 = v13;
      }
      else
      {
        if (!a4)
          goto LABEL_36;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(%@)"), v7, v11);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v7 = v13;
LABEL_36:

      return v7;
  }
}

- (id)_initWithDictionaryRepresentation:(id)a3
{
  id v4;
  RBSProcessExitStatus *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RBSProcessExitStatus;
  v5 = -[RBSProcessExitStatus init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_domain"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_domain = objc_msgSend(v6, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("_code"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_code = objc_msgSend(v7, "unsignedLongLongValue");

  }
  return v5;
}

- (id)_dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_domain);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("_domain"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_code);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("_code"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  RBSProcessExitStatus *v4;
  uint64_t v5;
  BOOL v6;

  v4 = (RBSProcessExitStatus *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    v6 = v5 == objc_opt_class() && self->_domain == v4->_domain && self->_code == v4->_code;
  }

  return v6;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = 0xBF58476D1CE4E5B9 * (self->_domain ^ ((unint64_t)self->_domain >> 30));
  v3 = self->_code ^ (self->_code >> 30);
  v4 = (0x94D049BB133111EBLL * ((0xBF58476D1CE4E5B9 * v3) ^ ((0xBF58476D1CE4E5B9 * v3) >> 27))) ^ (0x94D049BB133111EBLL * (v2 ^ (v2 >> 27)));
  return v4 ^ (v4 >> 31);
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessExitStatus _nameForDomain:includeNumber:]((uint64_t)RBSProcessExitStatus, self->_domain, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RBSProcessExitStatus _nameForDomain:code:includeNumber:]((uint64_t)RBSProcessExitStatus, self->_domain, self->_code, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| domain:%@ code:%@>"), v4, v5, v6);

  return (NSString *)v7;
}

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  uint64_t domain;
  id v5;

  domain = self->_domain;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", domain, CFSTR("_domain"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_code, CFSTR("_code"));

}

- (RBSProcessExitStatus)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSProcessExitStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSProcessExitStatus;
  v5 = -[RBSProcessExitStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_domain = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_domain"));
    v5->_code = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_code"));
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t domain;
  id v5;

  domain = self->_domain;
  v5 = a3;
  objc_msgSend(v5, "encodeInt32:forKey:", domain, CFSTR("_domain"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_code, CFSTR("_code"));

}

- (RBSProcessExitStatus)initWithCoder:(id)a3
{
  id v4;
  RBSProcessExitStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RBSProcessExitStatus;
  v5 = -[RBSProcessExitStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_domain = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_domain"));
    v5->_code = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_code"));
  }

  return v5;
}

@end
