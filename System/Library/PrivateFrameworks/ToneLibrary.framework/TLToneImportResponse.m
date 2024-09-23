@implementation TLToneImportResponse

- (TLToneImportResponse)initWithStatusCode:(int64_t)a3 toneIdentifier:(id)a4
{
  id v6;
  TLToneImportResponse *v7;
  TLToneImportResponse *v8;
  uint64_t v9;
  NSString *toneIdentifier;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TLToneImportResponse;
  v7 = -[TLToneImportResponse init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_statusCode = a3;
    v9 = objc_msgSend(v6, "copy");
    toneIdentifier = v8->_toneIdentifier;
    v8->_toneIdentifier = (NSString *)v9;

  }
  return v8;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t statusCode;
  __CFString *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p"), v5, self);

  statusCode = self->_statusCode;
  if (statusCode > 2)
    v8 = 0;
  else
    v8 = _TLToneImportStatusCodeHumanReadableDescriptions[statusCode];
  objc_msgSend(v6, "appendFormat:", CFSTR("; statusCode = %@"), v8);

  if (self->_toneIdentifier)
    objc_msgSend(v6, "appendFormat:", CFSTR("; toneIdentifier = \"%@\"), self->_toneIdentifier);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (int64_t)statusCode
{
  return self->_statusCode;
}

- (NSString)toneIdentifier
{
  return self->_toneIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
}

@end
