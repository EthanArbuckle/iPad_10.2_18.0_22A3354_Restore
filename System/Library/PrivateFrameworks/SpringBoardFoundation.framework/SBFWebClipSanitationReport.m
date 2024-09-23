@implementation SBFWebClipSanitationReport

- (SBFWebClipSanitationReport)initWithWebClip:(id)a3 result:(int64_t)a4 error:(id)a5
{
  id v9;
  id v10;
  SBFWebClipSanitationReport *v11;
  SBFWebClipSanitationReport *v12;
  uint64_t v13;
  NSError *error;
  objc_super v16;

  v9 = a3;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SBFWebClipSanitationReport;
  v11 = -[SBFWebClipSanitationReport init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_webClip, a3);
    v13 = objc_msgSend(v10, "copy");
    error = v12->_error;
    v12->_error = (NSError *)v13;

    v12->_result = a4;
  }

  return v12;
}

- (id)description
{
  void *v3;
  id v4;
  unint64_t v5;
  const __CFString *v6;
  id v7;
  NSError *error;
  id v9;
  unint64_t v10;
  const __CFString *v11;
  id v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_webClip, CFSTR("webClip"));
  v5 = self->_result;
  if (v5 > 2)
    v6 = CFSTR("(Unknown SBFWebClipSanitizationResult)");
  else
    v6 = off_1E200F768[v5];
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("result"));
  error = self->_error;
  if (error)
  {
    v9 = (id)objc_msgSend(v3, "appendObject:withName:", error, CFSTR("error"));
    v10 = -[NSError code](self->_error, "code");
    if (v10 > 2)
      v11 = CFSTR("(Unknown SBFWebClipSanitizationError)");
    else
      v11 = off_1E200F780[v10];
    v12 = (id)objc_msgSend(v3, "appendObject:withName:", v11, CFSTR("errorCode"));
  }
  objc_msgSend(v3, "build");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (UIWebClip)webClip
{
  return self->_webClip;
}

- (int64_t)result
{
  return self->_result;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_webClip, 0);
}

@end
