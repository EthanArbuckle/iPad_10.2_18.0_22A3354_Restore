@implementation _SWCGeneration

- (_SWCGeneration)init
{
  uint64_t v3;
  uint64_t v4;
  audit_token_t v6;
  audit_token_t atoken;
  audit_token_t task_info_out;
  mach_msg_type_number_t task_info_outCnt;

  task_info_outCnt = 8;
  if (task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)&task_info_out, &task_info_outCnt))
  {
    v3 = 0;
    v4 = 0;
  }
  else
  {
    atoken = task_info_out;
    v3 = audit_token_to_pid(&atoken);
    v6 = task_info_out;
    v4 = audit_token_to_pidversion(&v6);
  }
  *(_QWORD *)task_info_out.val = 0;
  arc4random_buf(&task_info_out, 8uLL);
  return -[_SWCGeneration initWithPID:version:tick:](self, "initWithPID:version:tick:", v3, v4, *(_QWORD *)task_info_out.val);
}

- (id)generationByIncrementingSelf
{
  return -[_SWCGeneration initWithPID:version:tick:]([_SWCGeneration alloc], "initWithPID:version:tick:", self->_processIdentifier, self->_processIdentifierVersion, self->_tick + 1);
}

- (_SWCGeneration)initWithPID:(int)a3 version:(int)a4 tick:(unint64_t)a5
{
  _SWCGeneration *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_SWCGeneration;
  result = -[_SWCGeneration init](&v9, sel_init);
  if (result)
  {
    result->_processIdentifier = a3;
    result->_processIdentifierVersion = a4;
    result->_tick = a5;
  }
  return result;
}

- (unint64_t)hash
{
  return self->_tick ^ self->_processIdentifier;
}

- (BOOL)isEqual:(id)a3
{
  _SWCGeneration *v4;
  _SWCGeneration *v5;
  BOOL v6;

  v4 = (_SWCGeneration *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = self->_processIdentifier == v5->_processIdentifier
        && self->_processIdentifierVersion == v5->_processIdentifierVersion
        && self->_tick == v5->_tick;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("{ %llu, %llu, %llu }"), self->_processIdentifier, self->_processIdentifierVersion, self->_tick);
}

- (id)debugDescription
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<%@ %p> { %llu, %llu, %llu }"), objc_opt_class(), self, self->_processIdentifier, self->_processIdentifierVersion, self->_tick);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_processIdentifier, CFSTR("processIdentifier"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_processIdentifierVersion, CFSTR("processIdentifierVersion"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_tick, CFSTR("tick"));

}

- (_SWCGeneration)initWithCoder:(id)a3
{
  id v4;
  _SWCGeneration *v5;

  v4 = a3;
  v5 = -[_SWCGeneration initWithPID:version:tick:](self, "initWithPID:version:tick:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("processIdentifier")), objc_msgSend(v4, "decodeIntForKey:", CFSTR("processIdentifierVersion")), objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("tick")));

  return v5;
}

@end
