@implementation ACTRejectCandidate

- (ACTRejectCandidate)initWithCandidate:(id)a3 timestamp:(double)a4
{
  id v7;
  ACTRejectCandidate *v8;
  ACTRejectCandidate *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ACTRejectCandidate;
  v8 = -[ACTRejectCandidate init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_candidate, a3);
    v9->_timestamp = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTRejectCandidate candidate](self, "candidate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACTRejectCandidate timestamp](self, "timestamp");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: candidate=%@, t=%.2f>"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)applyWithTyper:(id)a3 log:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ACTRejectCandidate candidate](self, "candidate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[ACTRejectCandidate timestamp](self, "timestamp");
  objc_msgSend(v7, "_performRejectCandidate:timestamp:typingLog:", v8, v6);

}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_candidate, 0);
}

@end
