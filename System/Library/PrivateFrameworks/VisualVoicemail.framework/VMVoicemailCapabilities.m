@implementation VMVoicemailCapabilities

- (id)debugDescription
{
  id v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p "), objc_opt_class(), self);
  NSStringFromSelector(sel_transcriptionEnabled);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[VMVoicemailCapabilities isTranscriptionEnabled](self, "isTranscriptionEnabled");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@"), v4, v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (BOOL)isTranscriptionEnabled
{
  return self->_transcriptionEnabled;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 transcriptionEnabled;
  id v4;
  id v5;

  transcriptionEnabled = self->_transcriptionEnabled;
  v4 = a3;
  NSStringFromSelector(sel_transcriptionEnabled);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", transcriptionEnabled, v5);

}

- (VMVoicemailCapabilities)initWithCoder:(id)a3
{
  id v4;
  VMVoicemailCapabilities *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VMVoicemailCapabilities;
  v5 = -[VMVoicemailCapabilities init](&v8, sel_init);
  if (v5)
  {
    NSStringFromSelector(sel_transcriptionEnabled);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_transcriptionEnabled = objc_msgSend(v4, "decodeBoolForKey:", v6);

  }
  return v5;
}

- (VMVoicemailCapabilities)initWithTranscriptionEnabled:(BOOL)a3
{
  VMVoicemailCapabilities *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VMVoicemailCapabilities;
  result = -[VMVoicemailCapabilities init](&v5, sel_init);
  if (result)
    result->_transcriptionEnabled = a3;
  return result;
}

- (VMVoicemailCapabilities)init
{
  -[VMVoicemailCapabilities doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (VMVoicemailCapabilities)initWithCapabilities:(id)a3
{
  return -[VMVoicemailCapabilities initWithTranscriptionEnabled:](self, "initWithTranscriptionEnabled:", objc_msgSend(a3, "isTranscriptionEnabled"));
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCapabilities:", self);
}

- (unint64_t)hash
{
  if (-[VMVoicemailCapabilities isTranscriptionEnabled](self, "isTranscriptionEnabled"))
    return 1231;
  else
    return 1237;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  v5 = v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[VMVoicemailCapabilities isEqualToCapabilities:](self, "isEqualToCapabilities:", v4);

  return v5;
}

- (BOOL)isEqualToCapabilities:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  LOBYTE(self) = -[VMVoicemailCapabilities isTranscriptionEnabled](self, "isTranscriptionEnabled");
  v5 = objc_msgSend(v4, "isTranscriptionEnabled");

  return self ^ v5 ^ 1;
}

- (id)archivedDataWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

+ (id)unarchivedObjectClasses
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x24BDBCF20];
  v3 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, objc_opt_class(), 0);
}

+ (id)unarchivedObjectFromData:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x24BDD1620];
  v7 = a3;
  objc_msgSend(a1, "unarchivedObjectClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClasses:fromData:error:", v8, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
