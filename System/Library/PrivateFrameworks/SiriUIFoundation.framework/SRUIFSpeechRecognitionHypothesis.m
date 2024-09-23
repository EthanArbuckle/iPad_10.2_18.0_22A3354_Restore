@implementation SRUIFSpeechRecognitionHypothesis

- (SRUIFSpeechRecognitionHypothesis)initWithUserUtterance:(id)a3 backingAceObject:(id)a4 isFinal:(BOOL)a5
{
  id v9;
  id v10;
  SRUIFSpeechRecognitionHypothesis *v11;
  SRUIFSpeechRecognitionHypothesis *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SRUIFSpeechRecognitionHypothesis;
  v11 = -[SRUIFSpeechRecognitionHypothesis init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_userUtterance, a3);
    v12->_final = a5;
    objc_storeStrong((id *)&v12->_backingAceObject, a4);
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithFormat:", CFSTR("<%@ %p:"), objc_opt_class(), self);
  objc_msgSend(v3, "appendString:", CFSTR(" userUtterance="));
  -[SRUIFSpeechRecognitionHypothesis userUtterance](self, "userUtterance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(v3, "appendString:", CFSTR("; isFinal="));
  if (-[SRUIFSpeechRecognitionHypothesis isFinal](self, "isFinal"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "appendString:", v6);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

- (AFUserUtterance)userUtterance
{
  return self->_userUtterance;
}

- (BOOL)isFinal
{
  return self->_final;
}

- (AceObject)backingAceObject
{
  return self->_backingAceObject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backingAceObject, 0);
  objc_storeStrong((id *)&self->_userUtterance, 0);
}

@end
